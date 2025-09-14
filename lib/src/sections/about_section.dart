import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/src/sections/animated_section.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= 900;
    return AnimatedSection(
      delay: const Duration(milliseconds: 300),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: isDesktop ? 96 : 24),
        color: Colors.white,
        child: isDesktop ? buildDesktop(context) : buildMobile(context),
      ),
    );
  }

  Widget buildDesktop(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GlowingProfileImage(
  imageUrl: 'https://media.licdn.com/dms/image/v2/C5603AQGnYnN9mvWyeg/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1637993001187?e=1760572800&v=beta&t=YGxQrVH3UHlrmW1H3d0GaXgCHOMI7o8WbUesLd-jN0o',
  size: 400,
)
        ),
        const SizedBox(width: 48),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('About Me', style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 16),
              Text(
                'I’m a Flutter developer with experience building cross-platform apps. I focus on UI/UX, app architecture, state management, and production deployment.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _skillChip('Flutter'),
                  _skillChip('Dart'),
                  _skillChip('Firebase'),
                  _skillChip('REST APIs'),
                  _skillChip('UI/UX'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMobile(BuildContext context) {
    return Column(
      children: [
        GlowingProfileImage(
  imageUrl: 'https://media.licdn.com/dms/image/v2/C5603AQGnYnN9mvWyeg/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1637993001187?e=1760572800&v=beta&t=YGxQrVH3UHlrmW1H3d0GaXgCHOMI7o8WbUesLd-jN0o',
  size: 250,
),
        const SizedBox(height: 24),
        Text('About Me', style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 12),
        Text(
          'I’m a Flutter developer with experience building cross-platform apps. I focus on UI/UX and clean architecture.',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            _skillChip('Flutter'),
            _skillChip('Dart'),
            _skillChip('Firebase'),
          ],
        ),
      ],
    );
  }

  Widget _skillChip(String label) {
    return Chip(
      label: Text(label),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from top-left
    path.moveTo(0, 30);

    // Top wave
    path.quadraticBezierTo(
        size.width / 4, 0, size.width / 2, 30);
    path.quadraticBezierTo(
        3 * size.width / 4, 60, size.width, 30);

    // Right edge
    path.lineTo(size.width, size.height - 30);

    // Bottom wave
    path.quadraticBezierTo(
        3 * size.width / 4, size.height, size.width / 2, size.height - 30);
    path.quadraticBezierTo(
        size.width / 4, size.height - 60, 0, size.height - 30);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class GlowingProfileImage extends StatefulWidget {
  final String imageUrl;
  final double size;

  const GlowingProfileImage({
    super.key,
    required this.imageUrl,
    this.size = 220,
  });

  @override
  State<GlowingProfileImage> createState() => _GlowingProfileImageState();
}

class _GlowingProfileImageState extends State<GlowingProfileImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            painter: GlowBorderPainter(progress: _controller.value),
            child: ClipPath(
              clipper: WaveClipper(),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class GlowBorderPainter extends CustomPainter {
  final double progress;
  GlowBorderPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final path = WaveClipper().getClip(size);

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    // Create a moving sweep gradient
    final gradient = SweepGradient(
      startAngle: 0,
      endAngle: 2 * pi,
      transform: GradientRotation(2 * pi * progress),
      colors: [
        Colors.blueAccent.withOpacity(0.8),
        const Color.fromARGB(255, 64, 251, 164).withOpacity(0.8),
        Colors.pinkAccent.withOpacity(0.8),
        Colors.blueAccent.withOpacity(0.8),
      ],
      stops: const [0.0, 0.3, 0.7, 1.0],
    );

    paint.shader = gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant GlowBorderPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
