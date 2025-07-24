import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/cubit/section_cubit.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width <= 768;

    return Container(
      width: double.infinity,
      height: size.height * 0.1,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 32, 32, 32),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'HC',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
          // Logo placeholder (can be empty since main logo is in content)
          
          // Navigation items
          if (!isMobile) _buildDesktopNav(context) else _buildMobileNav(),
        ],
      ),
    );
  }

  Widget _buildDesktopNav(BuildContext context) {
    return Row(
      children: [_buildNavItem('Home',Section.home,context),
        const SizedBox(width: 32),
        _buildNavItem('About me',Section.about,context),
        const SizedBox(width: 32),
        _buildNavItem('Skills',Section.skills,context),
        const SizedBox(width: 32),
        _buildNavItem('Portfolio',Section.portfolio,context),
        const SizedBox(width: 32),
        _buildContactButton(),
      ],
    );
  }

  Widget _buildMobileNav() {
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
        size: 28,
      ),
      color: Colors.black,
      itemBuilder: (context) => [
        _buildPopupMenuItem('Home'),
        _buildPopupMenuItem('About me'),
        _buildPopupMenuItem('Skills'),
        _buildPopupMenuItem('Portfolio'),
        const PopupMenuDivider(),
        PopupMenuItem<String>(
          value: 'contact',
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              'CONTACT ME',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(String text) {
    return PopupMenuItem<String>(
      value: text.toLowerCase().replaceAll(' ', ''),
      child: Text(
        text,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

 Widget _buildNavItem(String text, Section section,BuildContext context) {
  return TextButton(
    onPressed: () {
      context.read<SectionCubit>().changeSection(section);
    },
    child: Text(
      text,
      style: GoogleFonts.inter(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    ),
  );
}


  Widget _buildContactButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 0,
      ),
      child: Text(
        'CONTACT ME',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}