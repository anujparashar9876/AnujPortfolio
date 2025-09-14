import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedSection extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const AnimatedSection({
    super.key,
    required this.child,
    this.delay = const Duration(milliseconds: 100),
  });

  @override
  State<AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.hashCode.toString()),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_visible) {
          setState(() => _visible = true);
        }
      },
      child: AnimatedOpacity(
        opacity: _visible ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 800),
          offset: _visible ? Offset.zero : const Offset(0, 0.2),
          curve: Curves.easeOut,
          child: widget.child,
        ).animate(delay: widget.delay),
      ),
    );
  }
}
