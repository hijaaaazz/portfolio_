import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/cubit/section_cubit.dart';
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
        // Wrap the Column with Expanded to provide finite height constraints
        Expanded(
          child: Column(
            children: [
              const NavBar(),
              Expanded( // Add Expanded here to give the Row finite height
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.05,
                          top: MediaQuery.of(context).size.height * 0.05,
                          bottom: MediaQuery.of(context).size.height * 0.175,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<SectionCubit, Section>(
                              builder: (context, state) {
                                final isHome = state == Section.home;
                                        
                                return Column(
                                  key: const ValueKey('intro'),
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Slide & Fade: Top text
                                    AnimatedOpacity(
                                      opacity: isHome ? 1 : 0,
                                      duration: const Duration(milliseconds: 500),
                                      child: AnimatedSlide(
                                        offset: isHome ? Offset.zero : const Offset(-0.2, 0),
                                        duration: const Duration(milliseconds: 500),
                                        child: Text(
                                          'Hi, I am',
                                          style: GoogleFonts.inter(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                        
                                    const SizedBox(height: 16),
                                        
                                    // Typewriter: Section title (Hijaz C / About Me etc.)
                                    _TypewriterTitle(title: _getTitleFromSection(state), fontSize: size.width * 0.045),
                                        
                                    const SizedBox(height: 16),
                                        
                                    // Slide & Fade: Bottom text
                                    AnimatedOpacity(
                                      opacity: isHome ? 1 : 0,
                                      duration: const Duration(milliseconds: 500),
                                      child: AnimatedSlide(
                                        offset: isHome ? Offset.zero : const Offset(-0.2, 0),
                                        duration: const Duration(milliseconds: 500),
                                        child: Text(
                                          'Flutter Developer / UI Designer',
                                          style: GoogleFonts.inter(
                                            color: const Color.fromARGB(255, 105, 105, 105),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            
                            const Spacer(),
                            const SocialIcons(),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        // You can replace this with an image or custom widget
                        color: Colors.transparent,
                        child: Center(
                          child: Text(
                            'Right Side Placeholder',
                            style: GoogleFonts.inter(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TypewriterTitle extends StatefulWidget {
  final String title;
  final double fontSize;

  const _TypewriterTitle({required this.title, required this.fontSize});

  @override
  State<_TypewriterTitle> createState() => _TypewriterTitleState();
}

class _TypewriterTitleState extends State<_TypewriterTitle> {
  String displayedText = '';
  int charIndex = 0;

  @override
  void didUpdateWidget(covariant _TypewriterTitle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.title != widget.title) {
      _startTyping();
    }
  }

  void _startTyping() {
    displayedText = '';
    charIndex = 0;
    Future.doWhile(() async {
      if (charIndex < widget.title.length) {
        await Future.delayed(const Duration(milliseconds: 80));
        setState(() {
          displayedText += widget.title[charIndex];
          charIndex++;
        });
        return true;
      }
      return false;
    });
  }

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      displayedText,
      style: GoogleFonts.inter(
        color: Colors.black,
        fontSize: widget.fontSize,
        fontWeight: FontWeight.bold,
        height: 1.1,
      ),
    );
  }
}

String _getTitleFromSection(Section section) {
  switch (section) {
    case Section.home:
      return 'Hijaz C';
    case Section.about:
      return 'About Me';
    case Section.skills:
      return 'My Skills';
    case Section.portfolio:
      return 'My Work';
    case Section.contact:
      return 'Get in Touch';
  }
}