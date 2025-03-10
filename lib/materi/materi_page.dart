import 'dart:developer';
import 'package:aplikasi_bahasa_arab/dashboard_page.dart';
import 'package:aplikasi_bahasa_arab/materi/ain_page.dart';
import 'package:aplikasi_bahasa_arab/materi/alif_page.dart';
import 'package:aplikasi_bahasa_arab/materi/ba_page.dart';
import 'package:aplikasi_bahasa_arab/materi/dal_page.dart';
import 'package:aplikasi_bahasa_arab/materi/fa_page.dart';
import 'package:aplikasi_bahasa_arab/materi/ha_page.dart';
import 'package:aplikasi_bahasa_arab/materi/hah_page.dart';
import 'package:aplikasi_bahasa_arab/materi/kaf_page.dart';
import 'package:aplikasi_bahasa_arab/materi/lam_page.dart';
import 'package:aplikasi_bahasa_arab/materi/lamalif_page.dart';
import 'package:aplikasi_bahasa_arab/materi/mim_page.dart';
import 'package:aplikasi_bahasa_arab/materi/nun_page.dart';
import 'package:aplikasi_bahasa_arab/materi/penutup_page.dart';
import 'package:aplikasi_bahasa_arab/materi/qof_page.dart';
import 'package:aplikasi_bahasa_arab/materi/ro_page.dart';
import 'package:aplikasi_bahasa_arab/materi/sin_page.dart';
import 'package:aplikasi_bahasa_arab/materi/syod_page.dart';
import 'package:aplikasi_bahasa_arab/materi/to_page.dart';
import 'package:aplikasi_bahasa_arab/materi/waw_page.dart';
import 'package:aplikasi_bahasa_arab/materi/ya_page.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../config/theme_config.dart';

class MateriPage extends StatefulWidget implements PreferredSizeWidget {
  const MateriPage({super.key});

  @override
  State<MateriPage> createState() => _MateriPageState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MateriPageState extends State<MateriPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationLeft;
  late Animation<Offset> _animationRight;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  List<Widget> menu = [
    AlifPage(color: primary4, backsound: 'assets/sound/pembuka.mp3',),
    BaPage(color: primary4),
    HaPage(color: primary4),
    DalPage(color: primary4),
    RoPage(color: primary4),
    SinPage(color: primary4),
    SyodPage(color: primary4),
    ToPage(color: primary4),
    AinPage(color: primary4),
    FaPage(color: primary4),
    QofPage(color: primary4),
    KafPage(color: primary4),
    LamPage(color: primary4),
    MimPage(color: primary4),
    NunPage(color: primary4),
    HahPage(color: primary4),
    WawPage(color: primary4),
    YaPage(color: primary4),
    LamalifPage(color: primary4)
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
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if(!didPop){
          _showExitConfirmation();
        }
      },
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
                    Fluttertoast.showToast(msg: "tidak bisa memutar musik!");
                  },
                  icon: Icon(
                    Icons.music_off_outlined,
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
                _showExitConfirmation();
              },
              icon: Icon(Icons.close_outlined, color: Colors.red, size: 30),
            )
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          physics:NeverScrollableScrollPhysics(),
          children: menu,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _currentIndex > 0 ? () {
                  _goToPage(_currentIndex - 1);
                } : null,
                icon: Icon(Icons.arrow_back,size: 30,),
                color: _currentIndex > 0 ? Colors.black : Colors.grey,
              ),
              IconButton(
                onPressed: _currentIndex < menu.length - 1 ? () {
                  _goToPage(_currentIndex + 1);
                } : (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PenutupPage(),));
                },
                icon:_currentIndex < menu.length - 1 ? Icon(Icons.arrow_forward,size: 30,) : Text('selesai'),
                color: _currentIndex < menu.length - 1 ? Colors.black : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showExitConfirmation() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Konfirmasi Keluar"),
          content: Text("Apakah Anda yakin ingin keluar dari menu materi?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => DashboardPage(),), (route) => false,);
              },
              child: Text("Keluar"),
            ),
          ],
        );
      },
    );
  }
}
