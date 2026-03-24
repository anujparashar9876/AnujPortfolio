import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= 900;

    return Container(
      width: double.infinity,
      // Use extremely dark background to match the scrapbook aesthetic shadow drop
      padding: EdgeInsets.symmetric(vertical: 150, horizontal: isDesktop ? 96 : 24),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Center(
        child: Transform.rotate(
          angle: -0.03, // Slight paper tilt
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // 1. The Main Off-White Paper Card
              Container(
                width: isDesktop ? 700 : 380,
                padding: EdgeInsets.fromLTRB(
                  isDesktop ? 60 : 30,
                  isDesktop ? 80 : 60,
                  isDesktop ? 60 : 30,
                  isDesktop ? 60 : 40,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCDADB), // Off-white / light grey paper
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      blurRadius: 50,
                      spreadRadius: 10,
                      offset: const Offset(15, 25),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ABOUT ME.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: isDesktop ? 85 : 52,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF151515),
                        letterSpacing: -3,
                        height: 1.0,
                      ),
                    ),
                    
                    SizedBox(height: isDesktop ? 70 : 50),
                    
                    // The Inner Layout (Row desktop, Column mobile)
                    isDesktop
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: _buildContent(isDesktop),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: _buildContent(isDesktop),
                          ),
                          
                    SizedBox(height: isDesktop ? 80 : 60),
                    
                    Text(
                      "Let's work together!",
                      style: GoogleFonts.dancingScript(
                        fontSize: isDesktop ? 64 : 48,
                        color: const Color(0xFF151515),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              // 2. The Binder Clip (Top Right)
              Positioned(
                top: isDesktop ? 10 : -40,
                right: isDesktop ? 20 : -30,
                child: Transform.rotate(
                  angle: 1, // Deeper angle exactly like the design
                  child: Image.asset(
                    'assets/paper_clip.png',
                    width: isDesktop ? 240 : 160, // Much larger to match physical scaling
                    errorBuilder: (context, _, __) => const Icon(Icons.push_pin, size: 60, color: Colors.black87),
                  ).animate().scale(delay: 400.ms, curve: Curves.easeOutBack),
                ),
              ),
            ],
          ),
        ).animate().fade(duration: 800.ms).slideY(begin: 0.1),
      ),
    );
  }

  List<Widget> _buildContent(bool isDesktop) {
    final textDetails = Column(
      crossAxisAlignment: isDesktop ? CrossAxisAlignment.end : CrossAxisAlignment.center,
      children: [
        Text(
          'Anuj Parashar',
          style: GoogleFonts.dancingScript(
            fontSize: isDesktop ? 42 : 36,
            color: const Color(0xFF151515),
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.black26,
          margin: const EdgeInsets.symmetric(vertical: 8),
        ),
        Text(
          'India',
          style: GoogleFonts.dancingScript(
            fontSize: isDesktop ? 32 : 28,
            color: const Color(0xFF151515),
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.black26,
          margin: const EdgeInsets.only(top: 8, bottom: 24),
        ),
        Text(
          "I'm a Flutter developer helping ideas become visually strong and robust applications. I value clean architecture, engaging UI, and purpose in everything I do.",
          textAlign: isDesktop ? TextAlign.right : TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 15,
            color: const Color(0xFF4A4A4A),
            height: 1.6,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );

    return [
      // Left/Top: Polaroid Frame with Clip
      Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: isDesktop ? 260 : 220,
            height: isDesktop ? 300 : 260,
            decoration: const BoxDecoration(
              color: Color(0xFFF0F0F0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15,
                  offset: Offset(0, 8),
                )
              ],
            ),
            padding: const EdgeInsets.only(left: 14, right: 14, top: 14, bottom: 50),
            child: Image.asset(
              'assets/profile.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, _, __) => Container(
                color: Colors.grey[800],
                child: const Icon(Icons.person, size: 60, color: Colors.white),
              ),
            ),
          ),
          
          // Paper Clip hovering on the portrait
          Positioned(
            left: -20,
            top: 20,
            child: Transform.rotate(
              angle: -0.05,
              child: Image.asset(
                'assets/paper_clip.png',
                width: 90, // Taller structure exactly mapping the reference image
                errorBuilder: (context, _, __) => const SizedBox(),
              ),
            ),
          ),
        ],
      ).animate().fade(delay: 200.ms).rotate(begin: -0.05, end: 0, curve: Curves.easeOutBack),
      
      SizedBox(width: isDesktop ? 40 : 0, height: isDesktop ? 0 : 40),
      
      // Right/Bottom: Handwritten Details
      isDesktop ? Expanded(child: textDetails) : textDetails,
    ];
  }
}
