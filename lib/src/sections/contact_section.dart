import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 120, horizontal: width >= 900 ? 96 : 24),
      color: theme.colorScheme.surface.withOpacity(0.3),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 40,
                offset: const Offset(0, 20),
              )
            ]
          ),
          child: Column(
            children: [
              Icon(Icons.mail_outline, size: 48, color: theme.colorScheme.primary)
                  .animate().fade(duration: 600.ms).scale(curve: Curves.easeOutBack),
              const SizedBox(height: 24),
              Text('Get In Touch', style: theme.textTheme.displayMedium)
                  .animate().fade(delay: 200.ms).slideY(begin: 0.1),
              const SizedBox(height: 16),
              Text(
                'I am currently open for new opportunities and freelancing projects. '
                'Whether you have a question or just want to say hi, I\'ll try my best to get back to you!',
                style: theme.textTheme.bodyLarge, 
                textAlign: TextAlign.center,
              ).animate().fade(delay: 400.ms).slideY(begin: 0.1),
              const SizedBox(height: 40),
              Wrap(
                spacing: 24,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => launchUrlString('mailto:anujparashar8520@gmail.com'),
                    icon: const Icon(Icons.send),
                    label: const Text('Say Hello'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    ),
                  ).animate().fade(delay: 600.ms).scale(),
                  OutlinedButton.icon(
                    onPressed: () => launchUrlString('https://www.linkedin.com/in/anuj-kumar-parashar-01527b227/'),
                    icon: const Icon(Icons.connect_without_contact, color: Colors.white),
                    label: const Text('Connect on LinkedIn'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    ),
                  ).animate().fade(delay: 700.ms).scale(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
