import 'package:aplikasi_bahasa_arab/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class AlifPage extends StatefulWidget {
  final Color color;
  final String text;
  const AlifPage({super.key, required this.color, required this.text});

  @override
  State<AlifPage> createState() => _AlifPageState();
}

class _AlifPageState extends State<AlifPage> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(widget.text,width: 200,height: 200),
            IconButton(onPressed: () {
              setState(() {
                if(isPlaying){
                  isPlaying = false;
                }else{
                  isPlaying = true;
                }
              });
            }, icon: CircleAvatar(
              radius: 24,child: Icon(isPlaying ? Icons.pause:Icons.play_arrow,size: 50,),))
          ],
        )
      ),
    );
  }
}
