import 'package:dio/dio.dart';

abstract class Failures{
  final String errMessage;

  Failures(this.errMessage);
}
class ServerFailure extends Failures{
  ServerFailure(super.errMessage);

factory ServerFailure.fromDioError(DioException dioException){

switch(dioException.type){

  case DioExceptionType.connectionTimeout:
    return ServerFailure("Connection Timeout with Api");
  case DioExceptionType.sendTimeout:
     return ServerFailure("Send Timeout with Api");
  case DioExceptionType.receiveTimeout:
    return ServerFailure("Receive Timeout with Api");
  case DioExceptionType.badCertificate:
    return ServerFailure("Receive badCertificate with Api");

  case DioExceptionType.badResponse:
    return ServerFailure.fromResponse(dioException.response!.statusCode!, dioException.response!.data);
  case DioExceptionType.cancel:
    return ServerFailure("Request with Api Canceled");
  case DioExceptionType.connectionError:
    return ServerFailure("Receive ConnectionError with Api");
  case DioExceptionType.unknown:
    if(dioException.message!.contains("SocketException")){
      return ServerFailure("No internet Connection");
    }
    return ServerFailure("please try again");
    default:
      return ServerFailure("Opps please try again");
}
}
factory ServerFailure.fromResponse(int status,dynamic response){

  if(status ==400|| status==401||status==403){
    return ServerFailure(response["error"]["message"]);
  }
  else if(status ==404){
    return ServerFailure("Your Request not found, Try Again later");
  }
  else if(status==500){
    return ServerFailure("Internal Server error, please Try Later");
  }
  else {
    return ServerFailure("Opps please Try Again");
  }

}

}