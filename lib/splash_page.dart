import 'package:aplikasi_bahasa_arab/config/theme_config.dart';
import 'package:aplikasi_bahasa_arab/home_page.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    _navigation();

  }

  Future<void>_navigation()async{
   await Future.delayed(Duration(seconds: 3),() {
     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),), (route) => false,);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary4,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/icon.png",width:225,height: 225,fit: BoxFit.cover,),
            SizedBox(height: 20,),
            LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.black,size: 30
            )
          ],
        ),
      ),
    );
  }
}
