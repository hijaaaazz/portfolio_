import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  // Map of social icon images and URLs
  final List<_SocialLink> _socialLinks = const [
    _SocialLink(
      imageUrl: 'https://img.icons8.com/ios-glyphs/30/email.png',
      linkUrl: 'https://mail.google.com/mail/?view=cm&to=mhcnkd4@gmail.com&su=Hello%20Hijaz&body=Hi%20there!'

    ),
    _SocialLink(
      imageUrl: 'https://img.icons8.com/ios-glyphs/30/github.png',
      linkUrl: 'https://github.com/hijaaaazz',
    ),
    _SocialLink(
      imageUrl: 'https://img.icons8.com/ios-glyphs/30/linkedin.png',
      linkUrl: 'https://www.linkedin.com/in/hijaaaazz/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _socialLinks
          .map((social) => Padding(
                padding: const EdgeInsets.only(right: 16),
                child: _buildSocialIcon(social,context),
              ))
          .toList(),
    );
  }

  Widget _buildSocialIcon(_SocialLink social,BuildContext context) {
    return InkWell(
      onTap: () => _launchURL(social.linkUrl,context),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFC4C4C4),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.network(
              social.imageUrl,
              width: 20,
              height: 20,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }

 Future<void> _launchURL(String url,BuildContext context) async {
 try {
    launchUrl(Uri.parse(url));

  
} catch (e) {
  log('❌ Error: $e');
}

}

}

class _SocialLink {
  final String imageUrl;
  final String linkUrl;

  const _SocialLink({required this.imageUrl, required this.linkUrl});
}
