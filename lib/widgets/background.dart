import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/cubit/section_cubit.dart';
class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  bool showBlackOverlay = false;

  @override
  void initState() {
    super.initState();

    // Listen for section changes
    final cubit = context.read<SectionCubit>();
    cubit.stream.listen((section) {
     
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<SectionCubit, Section>(
      builder: (context, state) {
        final isDefault = state == Section.home;

        return Stack(
          children: [
            Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
              
                ),
              ),
            // Background image
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              top: isDefault ? 0 : -size.height,
              left: size.width * 0.45,
              width: size.width * 0.55,
              height: size.height,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),

            // Person image
            AnimatedPositioned(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              bottom: isDefault ? 0 : -size.height,
              left: size.width * 0.45,
              width: size.width * 0.55,
              height: size.height,
              child: Image.asset(
                'assets/images/person.png',
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),

           
            // Left grey slant background
            // Left grey slant background with animation
AnimatedPositioned(
  duration: const Duration(milliseconds: 1000),
  curve: Curves.easeInOut,
  left: isDefault ? 0 : -size.width * 0.2, // move left on non-home
  top: 0,
  width: size.width,
  height: size.height,
  child: ClipPath(
    clipper: LeftSlantClipper(),
    child: Container(
      color: Colors.grey.shade300,
    ),
  ),
),

          ],
        );
      },
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
