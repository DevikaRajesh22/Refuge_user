import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1C77),
      body: Stack(
        children: [
          ClipPath(clipper: CustomHalfCircleClipper(),
          child: Container(
            height: 300.0,
            width: 300.0,
             ),
          ),),
          // Positioned(
          //   top: -50,
          //   left: -50,
          //   right: 100,
          //   child: Container(
          //     height: 350,
          //     width: 500,
          //     decoration: const BoxDecoration(
          //         color: Color(0xFF023E8A), shape: BoxShape.circle),
          //   ),
          // ),
          // Positioned(
          //   top: -50,
          //   left: -50,
          //   right: 100,
          //   child: Container(
          //     height: 250,
          //     width: 400,
          //     decoration: const BoxDecoration(
          //         color: Color(0xFF0077B6), shape: BoxShape.circle),
          //   ),
          // ),
          Center(child: Image.asset('lib/assets/logo.png')),
        ],
      ),
    );
  }
}

class CustomHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
