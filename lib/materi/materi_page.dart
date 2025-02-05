import 'dart:developer';
import 'package:aplikasi_bahasa_arab/materi/alif_page.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../config/theme_config.dart';

class MateriPage extends StatefulWidget implements PreferredSizeWidget {
  const MateriPage({super.key});

  @override
  State<MateriPage> createState() => _MateriPageState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MateriPageState extends State<MateriPage> with SingleTickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isMusic = true;
  late AnimationController _controller;
  late Animation<Offset> _animationLeft;
  late Animation<Offset> _animationRight;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0; // Indeks dimulai dari 0 agar sesuai dengan PageView

  List<Widget> menu = [
    AlifPage(color: primary4, text: "assets/images/hafidz.json"),
    AlifPage(color: primary4, text: "assets/images/hafidz.json"),
    AlifPage(color: primary4, text: "assets/images/hafidz.json"),
    AlifPage(color: primary4, text: "assets/images/hafidz.json"),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _animationLeft = Tween<Offset>(
      begin: Offset(-1.5, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _animationRight = Tween<Offset>(
      begin: Offset(1.5, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  void _playClickSound() async {
    await _audioPlayer.play(AssetSource('sound/click.mp3'));
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
    log("Current Page: $_currentIndex");
  }

  void _goToPage(int index) {
    if (index >= 0 && index < menu.length) {
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: primary4,
        appBar: AppBar(
          backgroundColor: primary4,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _animationLeft,
                child: Text(
                  'MATERI',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.white, blurRadius: 5)],
                  ),
                ),
              ),
              SizedBox(width: 15),
              SlideTransition(
                position: _animationRight,
                child: Text(
                  'مَادَّة',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: "NotoNaskhArabic",
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          leading: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(width: 1),
                ),
                child: IconButton(
                  onPressed: () {
                    _playClickSound();
                    setState(() {
                      isMusic = !isMusic;
                    });
                  },
                  icon: Icon(
                    isMusic ? Icons.music_note_outlined : Icons.music_off_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                _playClickSound();
              },
              icon: Icon(Icons.close_outlined, color: Colors.red, size: 30),
            )
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: menu,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _currentIndex > 0 ? () {
                  _playClickSound();
                  _goToPage(_currentIndex - 1);
                } : null,
                icon: Icon(Icons.arrow_back),
                color: _currentIndex > 0 ? Colors.black : Colors.grey,
              ),
              IconButton(
                onPressed: _currentIndex < menu.length - 1 ? () {
                  _playClickSound();
                  _goToPage(_currentIndex + 1);
                } : null,
                icon: Icon(Icons.arrow_forward),
                color: _currentIndex < menu.length - 1 ? Colors.black : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
