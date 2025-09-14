import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/theme.dart';
import 'src/widgets/navbar.dart';
import 'src/sections/hero_section.dart';
import 'src/sections/about_section.dart';
import 'src/sections/projects_section.dart';
import 'src/sections/contact_section.dart';
import 'src/sections/footer.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget bodyContent(double width) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          // Hero
          SizedBox(
            key: heroKey,
            child: HeroSection(onPrimaryAction: () => scrollTo(projectsKey),contact: () => scrollTo(contactKey),),
          ),

          // About
          Container(
            key: aboutKey,
            child: AboutSection(),
          ),

          // Projects
          Container(
            key: projectsKey,
            child: ProjectsSection(),
          ),

          // Contact
          Container(
            key: contactKey,
            child: ContactSection(),
          ),

          // Footer
          const FooterSection(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: NavBar(
        onAbout: () => scrollTo(aboutKey),
        onProjects: () => scrollTo(projectsKey),
        onContact: () => scrollTo(contactKey),
      ),
      body: bodyContent(width),
    );
  }
}
