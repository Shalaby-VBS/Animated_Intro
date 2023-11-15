import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  final AnimationController animationController;

  const SplashView({Key? key, required this.animationController})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    final introductionAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.0, -1.0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    return SlideTransition(
      position: introductionAnimation,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image
            _splashImage(),
            // Title
            _splashTitle(),
            // Description
            _splashDescription(),
            // Space
            const SizedBox(height: 48),
            // Let's begin button
            _splashButton(),
          ],
        ),
      ),
    );
  }

  _splashImage() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.cover,
      ),
    );
  }

  _splashTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
      child: Text(
        "Splash Screen",
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.07,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _splashDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
      child: Text(
        "Splash Welcome Message",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.036),
      ),
    );
  }

  _splashButton() {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 16),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.5,
        child: TextButton(
          onPressed: () {
            widget.animationController.animateTo(0.2);
          },
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xff132137),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(38),
            ),
          ),
          child: Text(
            "Let's begin",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
