import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/background.dart';
import 'package:portfolio/widgets/navbar.dart';
import 'package:portfolio/widgets/social_icons.dart';

class DesktopHome extends StatelessWidget {
  const DesktopHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        const Background(),
        Column(
          children: [
            const NavBar(),
            Expanded(
              child: Row(
                children: [
                  // Left side
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.08,
                        vertical: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, I am',
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Hijaz C',
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: size.width * 0.045,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Flutter Developer / UI Designer',
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF909090),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const SocialIcons(),
                        ],
                      ),
                    ),
                  ),

                  // Right side (e.g., image or graphic placeholder)
                  const Expanded(
                    flex: 2,
                    child: SizedBox(), // Add image or graphic here
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
