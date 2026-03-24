import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_portfolio/src/sections/animated_section.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onPrimaryAction;
  final VoidCallback? contact;
  const HeroSection({super.key, this.onPrimaryAction, this.contact});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final isDesktop = width >= 900;
    final theme = Theme.of(context);

    // Using the portfolio's core dark theme colors
    final Color accentColor = theme.colorScheme.primary;
    final Color darkShapeColor = theme.cardColor;

    return Container(
      width: double.infinity,
      color: theme.scaffoldBackgroundColor, // Dark theme background
      child: Stack(
        children: [
          // Top Left Accent Blob
          Positioned(
            top: -50,
            left: -50,
            child: _buildBlob(accentColor.withOpacity(0.8), 250),
          ),
          
          // Bottom Right Accent Blob
          Positioned(
            bottom: -50,
            right: -50,
            child: _buildBlob(accentColor.withOpacity(0.8), 350),
          ),
          
          // Content Container dictating the total Hero height securely
          Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: height),
            alignment: Alignment.center,
            child: AnimatedSection(
              delay: const Duration(milliseconds: 100),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: isDesktop ? 60 : 40, horizontal: isDesktop ? 96 : 24),
                child: isDesktop 
                    ? desktopLayout(context, accentColor, darkShapeColor, theme) 
                    : mobileLayout(context, accentColor, darkShapeColor, theme),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  // Custom abstract blob shape generator
  Widget _buildBlob(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(size),
          topRight: Radius.circular(size * 0.4),
          bottomLeft: Radius.circular(size * 0.3),
          bottomRight: Radius.circular(size * 0.8),
        ),
      ),
    ).animate().fade(duration: 1000.ms).scale(curve: Curves.easeOut);
  }

  Widget desktopLayout(BuildContext context, Color accentColor, Color darkShapeColor, ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left Side - Image and Abstract Shapes
        Expanded(
          flex: 5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Abstract dark shape
              Positioned(
                right: 20,
                bottom: 20,
                child: Container(
                  width: 150,
                  height: 250,
                  color: darkShapeColor,
                ).animate().fade().slideY(begin: 0.2),
              ),
              // Abstract accent circle piece
              Positioned(
                left: 40,
                top: 40,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle),
                ).animate().fade().scale(),
              ),
              // Main Profile Image
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: theme.scaffoldBackgroundColor, width: 8),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 30, offset: const Offset(0, 15))
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/profile.jpg'),
                    fit: BoxFit.cover,
                  )
                ),
              ).animate().fade(delay: 300.ms).scale(curve: Curves.easeOutBack),
            ],
          ),
        ),
        
        const SizedBox(width: 60),

        // Right Side - Text Content
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // Fixes unbounded layout exception
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Outfit'),
                  children: [
                    const TextSpan(text: 'Hello, I\'m '),
                    TextSpan(text: 'Anuj Parashar', style: TextStyle(color: accentColor)),
                  ],
                ),
              ).animate().fade(duration: 800.ms).slideX(begin: 0.1),
              
              const SizedBox(height: 8),
              
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: accentColor,
                  fontFamily: 'Outfit',
                ),
              ).animate().fade(delay: 200.ms).slideX(begin: 0.1),
              
              const SizedBox(height: 24),
              
              const Text(
                'A passionate Flutter Developer building seamless native experiences for mobile and web. I love crafting interactive UI, solving complex UX problems, and shipping production-ready applications with modern toolkits.',
                style: TextStyle(fontSize: 16, height: 1.6, color: Colors.white70, fontFamily: 'Outfit'),
              ).animate().fade(delay: 400.ms).slideY(begin: 0.1),
              
              const SizedBox(height: 48),
              
              ElevatedButton(
                onPressed: contact,
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 0,
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: const Text('GET IN TOUCH!'),
              ).animate().fade(delay: 600.ms).scale(begin: const Offset(0.9, 0.9)),
              
              const SizedBox(height: 24),
              
              const Text(
                'anujparashar8520@gmail.com',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Outfit'),
              ).animate().fade(delay: 700.ms),
              
              const SizedBox(height: 16),
              
              // Social Icons
              Row(
                children: [
                  _socialIcon(Icons.link, 'https://www.linkedin.com/in/anuj-kumar-parashar-01527b227/', accentColor),
                  const SizedBox(width: 12),
                  _socialIcon(Icons.code, 'https://github.com/anujparashar9876', accentColor),
                ],
              ).animate().fade(delay: 800.ms).slideY(begin: 0.2),
            ],
          ),
        ),
      ],
    );
  }

  Widget mobileLayout(BuildContext context, Color accentColor, Color darkShapeColor, ThemeData theme) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Fixes unbounded layout exception
      children: [
        // Image and Abstract Shapes
        Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: 10,
              bottom: 10,
              child: Container(width: 100, height: 150, color: darkShapeColor),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: Container(width: 120, height: 120, decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle)),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: theme.scaffoldBackgroundColor, width: 6),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20, offset: const Offset(0, 10))],
                image: const DecorationImage(
                  image: AssetImage('assets/profile.jpg'),
                  fit: BoxFit.cover,
                )
              ),
            ),
          ],
        ).animate().fade().scale(),
        
        const SizedBox(height: 40),

        // Text Content
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Outfit'),
                children: [
                  const TextSpan(text: 'Hello, I\'m\n'),
                  TextSpan(text: 'Anuj Parashar', style: TextStyle(color: accentColor)),
                ],
              ),
            ).animate().fade().slideY(),
            
            const SizedBox(height: 8),
            
            Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: accentColor,
                fontFamily: 'Outfit',
              ),
            ).animate().fade(delay: 200.ms),
            
            const SizedBox(height: 24),
            
            const Text(
              'A passionate Flutter Developer building seamless native experiences for mobile and web. I love crafting interactive UI, solving complex UX problems.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.6, color: Colors.white70, fontFamily: 'Outfit'),
            ).animate().fade(delay: 400.ms),
            
            const SizedBox(height: 32),
            
            ElevatedButton(
              onPressed: contact,
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                elevation: 0,
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: const Text('GET IN TOUCH!'),
            ).animate().fade(delay: 600.ms).scale(),
            
            const SizedBox(height: 24),
            
            const Text('anujparashar8520@gmail.com', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Outfit')),
            
            const SizedBox(height: 16),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialIcon(Icons.link, 'https://www.linkedin.com/in/anuj-kumar-parashar-01527b227/', accentColor),
                const SizedBox(width: 12),
                _socialIcon(Icons.code, 'https://github.com/anujparashar9876', accentColor),
              ],
            ).animate().fade(delay: 700.ms),
          ],
        ),
      ],
    );
  }

  Widget _socialIcon(IconData icon, String url, Color accentColor) {
    return InkWell(
      onTap: () => launchUrlString(url),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: accentColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
