import 'package:flutter/material.dart';
import 'package:portfolio/views/desktop.dart';
import 'package:portfolio/views/mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 768) {
            return const DesktopHome();
          } else {
            return const MobileHome();
          }
        },
      ),
    );
  }
}

