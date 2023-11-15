import 'package:flutter/material.dart';

class FirstOnBoardingView extends StatelessWidget {
  final AnimationController animationController;

  const FirstOnBoardingView({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final secondHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.2,
        0.4,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final textAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-2, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.2,
        0.4,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final imageAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-4, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.2,
        0.4,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final relaxAnimation =
        Tween<Offset>(begin: const Offset(0, -2), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    return SlideTransition(
      position: firstHalfAnimation,
      child: SlideTransition(
        position: secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title
              SlideTransition(
                position: relaxAnimation,
                child: _buildTitle(),
              ),
              // Description
              SlideTransition(
                position: textAnimation,
                child: _buildDescription(),
              ),
              // Image
              SlideTransition(
                position: imageAnimation,
                child: _buildImage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildTitle() {
    return const Text(
      "FirstOnBoardingView",
      style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
    );
  }

  _buildDescription() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 64, vertical: 16),
      child: Text(
        "Lorem ipsum dolor sit amet,consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore",
        textAlign: TextAlign.center,
      ),
    );
  }

  _buildImage() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 350, maxHeight: 250),
      child: Image.asset(
        'assets/images/first_onboarding.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
