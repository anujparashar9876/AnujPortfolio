import 'package:flutter/material.dart';
import 'package:flutter_portfolio/src/sections/animated_section.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onPrimaryAction;
  final VoidCallback? contact;
  const HeroSection({super.key, this.onPrimaryAction, this.contact});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= 900;

    return AnimatedSection(
      delay: const Duration(milliseconds: 300),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: isDesktop ? 80 : 60, horizontal: isDesktop ? 96 : 24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A192F), Color(0xFF112240)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: isDesktop ? desktopLayout(theme) : mobileLayout(theme),
      ),
    );
  }

  Widget desktopLayout(ThemeData theme) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Hello, I\'m', style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white70)),
              const SizedBox(height: 8),
              Text('Anuj', style: theme.textTheme.displayLarge?.copyWith(color: Colors.white, fontSize: 64)),
              const SizedBox(height: 12),
              SizedBox(
                width: 540,
                child: Text(
                  'Flutter Developer building beautiful native experiences for mobile and web. I love crafting UI, solving UX problems, and shipping production apps.',
                  style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: onPrimaryAction,
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Theme.of(theme.dialogBackgroundColor).colorScheme?.secondary ?? const Color(0xFF6C63FF),
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('View Work'),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    onPressed: contact,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white24),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Contact', style: TextStyle(color: Colors.white70)),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 4,
          child: Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 120,
              backgroundImage: const NetworkImage('https://media.licdn.com/dms/image/v2/C5603AQGnYnN9mvWyeg/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1637993001187?e=1760572800&v=beta&t=YGxQrVH3UHlrmW1H3d0GaXgCHOMI7o8WbUesLd-jN0o'),
              backgroundColor: Colors.white24,
            ),
          ),
        ),
      ],
    );
  }

  Widget mobileLayout(ThemeData theme) {
    return Column(
      children: [
        CircleAvatar(
          radius: 72,
          backgroundImage: const NetworkImage('https://media.licdn.com/dms/image/v2/C5603AQGnYnN9mvWyeg/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1637993001187?e=1760572800&v=beta&t=YGxQrVH3UHlrmW1H3d0GaXgCHOMI7o8WbUesLd-jN0o'),
          backgroundColor: Colors.white24,
        ),
        const SizedBox(height: 16),
        Text('Hello, I\'m', style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white70)),
        const SizedBox(height: 8),
        Text('Your Name', style: theme.textTheme.displayLarge?.copyWith(color: Colors.white, fontSize: 36)),
        const SizedBox(height: 12),
        Text(
          'Flutter Developer building beautiful native experiences for mobile and web.',
          style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white70),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onPrimaryAction,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6C63FF),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('View Work'),
        ),
      ],
    );
  }
}
