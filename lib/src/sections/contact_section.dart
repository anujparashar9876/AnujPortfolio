import 'package:flutter/material.dart';
import 'package:flutter_portfolio/src/sections/animated_section.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return AnimatedSection(
      delay: const Duration(milliseconds: 300),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: width >= 900 ? 96 : 24),
        color: Colors.white,
        child: Column(
          children: [
            Text('Get in touch', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 16),
            Text('I’m currently open to new opportunities and freelance work. Let\'s build something great together!',
                style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
            const SizedBox(height: 24),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => launchUrlString('mailto:anujparashar8520@gmail.com'),
                  child: const Text('Email Me'),
                ),
                OutlinedButton(
                  onPressed: () => launchUrlString('https://www.linkedin.com/in/anuj-kumar-parashar-01527b227/'),
                  child: const Text('LinkedIn'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
