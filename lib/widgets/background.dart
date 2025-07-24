import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Stack(
        children: [
          Row(
            children: [
              SizedBox(
                 width: size.width * 0.45,
                 height: size.height,
                
               ),
               SizedBox(
                 width: size.width * 0.55,
                 height: size.height,
                 child: Image.asset(
                   'assets/images/profile.jpg',
                   fit: BoxFit.cover,
                   alignment: Alignment.bottomCenter,
                 ),
               ),
            ],
          ),
          // Grey slanted background on left
          Align(
            alignment: Alignment.centerLeft,
            child: ClipPath(
              clipper: LeftSlantClipper(),
              child: Container(
                width: size.width,
                height: size.height,
                color: Colors.grey.shade300,
              ),
            ),
          ),

          // Full image shown completely on the right side
         
        ]
      );
  }
}


class LeftSlantClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.55, 0)
      ..lineTo(size.width * 0.45, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
