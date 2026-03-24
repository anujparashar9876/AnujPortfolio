import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final theme = Theme.of(context);

    // List of projects
    final projects = [
      {
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz5djEOlVq3GjEybpTIyvfbIXNOzyMcsU2WQ&s',
        'title': 'Socially - Interactive Social Network',
        'desc': 'A comprehensive Social Media App built with Flutter & Firebase. Features include real-time feeds, user authentication, interactive posts, and dynamic content sharing with a fully responsive architecture.',
        'tags': ['Flutter', 'Firebase', 'Social', 'Real-time'],
        'link': 'https://github.com/anujparashar9876/socially',
      },
      {
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfXa2RFDRShkXH03IKgZgsWT069w_AKhsdcQ&s',
        'title': 'Chat App - Realtime Messaging',
        'desc': 'Real-time chat application demonstrating state management, Firebase streaming, and responsive multi-device layouts. Includes multimedia messaging, read receipts, and push notifications.',
        'tags': ['Flutter', 'Firestore', 'Streams', 'WebSockets'],
        'link': 'https://github.com/anujparashar9876/chat_app_test',
      },
      {
        'image': 'https://cdn.shopify.com/app-store/listing_images/119e46d40447b213e034117eaa5a9382/icon/CLWd5bj0lu8CEAE=.png',
        'title': 'Music Player - Immersive Audio',
        'desc': 'Sleek music player app with beautiful animations, background audio playback, precise playlist management, and a custom built graphical equalizer for an immersive listening experience.',
        'tags': ['Flutter', 'Audio API', 'UI/UX', 'Animations'],
        'link': 'https://github.com/anujparashar9876/music_player',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: width >= 900 ? 96 : 24),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        image: DecorationImage(
          image: const NetworkImage('https://www.transparenttextures.com/patterns/cubes.png'),
          opacity: 0.03,
          repeat: ImageRepeat.repeat,
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 40, height: 2, color: theme.colorScheme.primary),
              const SizedBox(width: 16),
              Text('Featured Projects', style: theme.textTheme.displayMedium),
            ],
          ).animate().fade(duration: 600.ms).slideX(begin: -0.1),
          const SizedBox(height: 64),
          
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            separatorBuilder: (context, index) => const SizedBox(height: 80),
            itemBuilder: (context, index) {
              final p = projects[index];
              return FlashyProjectCard(
                imagePath: p['image'] as String,
                title: p['title'] as String,
                description: p['desc'] as String,
                tags: p['tags'] as List<String>,
                link: p['link'] as String,
                isReversed: index % 2 != 0 && width >= 900, // Alternate layout for desktop
                index: index,
              );
            },
          )
        ],
      ),
    );
  }
}

class FlashyProjectCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final List<String> tags;
  final String link;
  final bool isReversed;
  final int index;

  const FlashyProjectCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.tags,
    required this.link,
    required this.isReversed,
    required this.index,
  });

  @override
  State<FlashyProjectCard> createState() => _FlashyProjectCardState();
}

class _FlashyProjectCardState extends State<FlashyProjectCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= 900;

    Widget imageContent = Container(
      height: isDesktop ? 400 : 250,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: hovering ? theme.colorScheme.primary.withOpacity(0.4) : Colors.black45,
            blurRadius: hovering ? 40 : 20,
            spreadRadius: hovering ? 10 : 0,
            offset: Offset(0, hovering ? 20 : 10),
          )
        ]
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Image scales up on hover
          AnimatedScale(
            scale: hovering ? 1.1 : 1.0,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutExpo,
            child: Image.network(
              widget.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          
          // Flashy tint overlay
          AnimatedOpacity(
            opacity: hovering ? 0.0 : 0.4,
            duration: const Duration(milliseconds: 400),
            child: Container(
              color: theme.colorScheme.primary.withOpacity(0.5),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: const SizedBox.shrink(),
              ),
            ),
          ),

          // Glowing border that shows up on hover
          AnimatedOpacity(
            opacity: hovering ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 400),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: theme.colorScheme.primary, width: 3),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          )
        ],
      ),
    );

    // Apply shimmer effect on hover target
    imageContent = imageContent.animate(target: hovering ? 1 : 0)
        .shimmer(duration: 1000.ms, color: Colors.white.withOpacity(0.5));

    Widget textContent = Column(
      crossAxisAlignment: isDesktop ? (widget.isReversed ? CrossAxisAlignment.end : CrossAxisAlignment.start) : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Featured Project',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.primary,
            fontSize: 16,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          widget.title,
          style: theme.textTheme.displayMedium?.copyWith(
            fontSize: isDesktop ? 36 : 28,
          ),
          textAlign: isDesktop && widget.isReversed ? TextAlign.right : TextAlign.left,
        ).animate(target: hovering ? 1 : 0).tint(color: theme.colorScheme.primary.withOpacity(0.2)),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: theme.cardColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ]
          ),
          child: Text(
            widget.description,
            style: theme.textTheme.bodyLarge?.copyWith(height: 1.6, color: Colors.white70),
            textAlign: isDesktop && widget.isReversed ? TextAlign.right : TextAlign.left,
          ),
        ).animate(target: hovering ? 1 : 0).scale(begin: const Offset(1,1), end: const Offset(1.02, 1.02)).elevation(),
        
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: isDesktop && widget.isReversed ? WrapAlignment.end : WrapAlignment.start,
          children: widget.tags.map((tag) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: theme.colorScheme.primary.withOpacity(0.5)),
            ),
            child: Text(
              tag,
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          )).toList(),
        ).animate(target: hovering ? 1 : 0).slideY(begin: 0, end: -0.1),

        const SizedBox(height: 32),
        IconButton(
          onPressed: () => _openLink(widget.link),
          icon: const Icon(Icons.open_in_new),
          iconSize: 28,
          color: Colors.white,
          style: IconButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            padding: const EdgeInsets.all(16),
          ),
        ).animate(target: hovering ? 1 : 0).scale(begin: const Offset(1,1), end: const Offset(1.1, 1.1))
      ],
    );

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()..translate(0.0, hovering ? -10.0 : 0.0),
        child: isDesktop
            ? Row(
                children: widget.isReversed
                    ? [
                        Expanded(flex: 5, child: textContent),
                        const SizedBox(width: 40),
                        Expanded(flex: 7, child: GestureDetector(onTap: () => _openLink(widget.link), child: imageContent)),
                      ]
                    : [
                        Expanded(flex: 7, child: GestureDetector(onTap: () => _openLink(widget.link), child: imageContent)),
                        const SizedBox(width: 40),
                        Expanded(flex: 5, child: textContent),
                      ],
              )
            : Column(
                children: [
                  GestureDetector(onTap: () => _openLink(widget.link), child: imageContent),
                  const SizedBox(height: 32),
                  textContent,
                ],
              ),
      ).animate().fade(delay: Duration(milliseconds: widget.index * 200), duration: 800.ms).slideY(begin: 0.2),
    );
  }

  Future<void> _openLink(String url) async {
    try {
      if (await canLaunchUrlString(url)) {
        await launchUrlString(url, mode: LaunchMode.externalApplication);
      }
    } catch (_) {}
  }
}
