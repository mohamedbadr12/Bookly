import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();


  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Image.asset(AssetsData.logo),
         AnimatedBuilder(
         animation: slidingAnimation
         ,
           builder: (context, _) {
           return

            SlideTransition(
               position:slidingAnimation ,
               child: const Text("Read Free Books",textAlign: TextAlign.center,)
         );})
],
    );
  }

  void initSlidingAnimation(){
    animationController =AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1)
    );
    slidingAnimation=Tween<Offset>(begin:const Offset(0, 2) ,end:Offset.zero ).animate(animationController);
    animationController.forward();

  }
  void navigateToHome(){
    Future.delayed(const Duration(seconds: 3),(){
      GoRouter.of(context).push("/home");
    },);
  }
}
