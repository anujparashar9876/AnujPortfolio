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
    this.height = 70,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.transparent],
          ),
        ),
        child: SafeArea(
          child: Row(
            children: [
              Text('Anuj', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              const Spacer(),
              NavButton(label: 'About', onTap: onAbout),
              const SizedBox(width: 8),
              NavButton(label: 'Projects', onTap: onProjects),
              const SizedBox(width: 8),
              NavButton(label: 'Contact', onTap: onContact),
            ],
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
    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 150),
          style: TextStyle(
            color: hovering ? Theme.of(context).colorScheme.secondary : Colors.black87,
            fontSize: 16,
            fontWeight: hovering ? FontWeight.w700 : FontWeight.w500,
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
