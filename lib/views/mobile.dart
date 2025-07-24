import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/navbar.dart';
import 'package:portfolio/widgets/social_icons.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              // Background image
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[800],
                            child: const Icon(
                              Icons.person,
                              size: 100,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Overlay content
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.2),
                    Text(
                      'Hi, I am',
                      style: GoogleFonts.inter(
                        color: const Color.fromARGB(255, 214, 214, 214),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Hijaz C',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Flutter Developer / UI Designer',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF909090),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const SocialIcons(),
                  ],
                ),
              ),

              // Navigation
              const NavBar(),
            ],
          ),
        ),
      ],
    );
  }
}
