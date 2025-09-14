import 'package:flutter/material.dart';
import 'package:flutter_portfolio/src/sections/animated_section.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final cross = width >= 1200 ? 3 : width >= 800 ? 2 : 1;
    return AnimatedSection(
      delay: const Duration(milliseconds: 300),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: width >= 900 ? 96 : 24),
        color: const Color(0xFFF7F8FA),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Projects', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 24),
            GridView.count(
              crossAxisCount: cross,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.05,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ProjectCard(
                  imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz5djEOlVq3GjEybpTIyvfbIXNOzyMcsU2WQ&s',
                  title: 'Socially',
                  description: 'A Social Media App built with Flutter & Firebase.',
                  link: 'https://github.com/anujparashar9876/socially',
                ),
                ProjectCard(
                  imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfXa2RFDRShkXH03IKgZgsWT069w_AKhsdcQ&s',
                  title: 'Chat App',
                  description: 'A real-time chat application using Flutter and Firebase.',
                  link: 'https://github.com/anujparashar9876/chat_app_test',
                ),
                ProjectCard(
                  imagePath: 'https://cdn.shopify.com/app-store/listing_images/119e46d40447b213e034117eaa5a9382/icon/CLWd5bj0lu8CEAE=.png',
                  title: 'Music Player',
                  description: 'A sleek music player app with playlist and equalizer features.',
                  link: 'https://github.com/anujparashar9876/music_player',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


class ProjectCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final String link;

  const ProjectCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.link,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        transform: Matrix4.identity()..scale(hovering ? 1.04 : 1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: hovering ? Colors.black.withOpacity(0.15) : Colors.black.withOpacity(0.06),
              blurRadius: hovering ? 18 : 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Image with overlay on hover
              Stack(
                children: [
                  Image.network(
                    widget.imagePath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  AnimatedOpacity(
                    opacity: hovering ? 0.6 : 0.0,
                    duration: const Duration(milliseconds: 250),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black87],
                        ),
                      ),
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Description + Button
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[700],
                          height: 1.4,
                        )),
                    const SizedBox(height: 14),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: () => _openLink(widget.link),
                        style: TextButton.styleFrom(
                          foregroundColor: theme.colorScheme.primary,
                          textStyle: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        icon: const Icon(Icons.open_in_new, size: 18),
                        label: const Text("View Project"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
