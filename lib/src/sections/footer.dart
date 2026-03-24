import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final theme = Theme.of(context);
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: width >= 900 ? 96 : 24),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.05),
            width: 1,
          ),
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 16,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            '© ${DateTime.now().year} Anuj Kumar Parashar. All rights reserved.', 
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white60)
          ),
          RichText(
            text: TextSpan(
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white54),
              children: [
                const TextSpan(text: 'Designed & Built with '),
                TextSpan(
                  text: 'Flutter',
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
