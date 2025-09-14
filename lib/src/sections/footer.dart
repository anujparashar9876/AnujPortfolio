import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: width >= 900 ? 96 : 24),
      color: const Color(0xFF0A192F),
      child: Row(
        children: [
          Text('© ${DateTime.now().year} Anuj', style: TextStyle(color: Colors.white70)),
          const Spacer(),
          Text('Built with Flutter', style: TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}
