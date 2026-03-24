import 'dart:ui';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onAbout;
  final VoidCallback? onProjects;
  final VoidCallback? onContact;
  final double height;

  const NavBar({
    super.key,
    this.onAbout,
    this.onProjects,
    this.onContact,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color accentColor = theme.colorScheme.primary;

    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: theme.scaffoldBackgroundColor.withOpacity(0.85), // Floating dark glass
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SafeArea(
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo Header 
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'ANUJ',
                          style: TextStyle(
                            color: accentColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            letterSpacing: 1,
                            fontFamily: 'Outfit',
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'PARASHAR',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                              letterSpacing: 1,
                              fontFamily: 'Outfit',
                            ),
                          ),
                        )
                      ],
                    ),
                    
                    const Spacer(),
                    
                    if (MediaQuery.sizeOf(context).width > 600) ...[
                      NavButton(label: 'WORK', onTap: onProjects),
                      const SizedBox(width: 24),
                      NavButton(label: 'ABOUT ME', onTap: onAbout),
                      const SizedBox(width: 24),
                      NavButton(label: 'CONTACT', onTap: onContact),
                    ] else ...[
                      IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () {},
                      )
                    ]
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class NavButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;

  const NavButton({super.key, required this.label, this.onTap});

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color accentColor = theme.colorScheme.primary;

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            color: hovering ? accentColor : Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: 'Outfit',
            letterSpacing: 1,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
