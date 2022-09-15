import 'package:flutter/material.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: const <Widget>[
                OnboardScreenImage(),
                SizedBox(height: 40.0),
                Text(
                  "Your body need water",
                  style: TextStyle(
                    color: Color(0xFF061941),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 24.0),
                Text(
                  "Track your daily water intake in just a few taps!",
                  style: TextStyle(
                    color: Color(0xFF9DA4B4),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 72.0),
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: FloatActionButtonClipper(),
                  child: Container(
                    width: 70,
                    height: 70,
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE5DEF2),
                    ),
                  ),
                ),
                FloatingActionButton(
                  elevation: 0,
                  child: const Icon(Icons.navigate_next, size: 26.0),
                  onPressed: () => Navigator.pushNamed(context, "/home"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardScreenImage extends StatelessWidget {
  const OnboardScreenImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/onboard_image.png");
  }
}

class FloatActionButtonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height * 0.8)
      ..lineTo(size.width * 0.5, size.height * 0.5)
      ..lineTo(size.width * 0.5, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
