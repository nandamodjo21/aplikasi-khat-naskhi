import 'package:aplikasi_bahasa_arab/config/theme_config.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isMusic = true;


  void _playClickSound() async {
    await _audioPlayer.play(AssetSource('sound/click.mp3'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary4,
        appBar: AppBar(
          backgroundColor: primary4,
          leading: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10), // Geser ke kanan sejauh 10px
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border(
                    right: BorderSide(
                      width: 1
                    ),
                    left: BorderSide(width: 1),
                    top: BorderSide(width: 1),
                    bottom: BorderSide(width: 1)
                  )
                ),
                child: IconButton(
                  onPressed: () {
                    _playClickSound();
                    setState(() {
                      if(isMusic){
                        isMusic = false;
                      }else{
                        isMusic = true;
                      }
                    });
                  },
                  icon: Icon(isMusic ? Icons.music_note_outlined : Icons.music_off_outlined, color: Colors.black, size: 30),
                ),
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.close_outlined,color: Colors.black,size: 30,))
          ],
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'قَائِمَة الطَّعَامِ',
              style: TextStyle(fontSize: 35, fontFamily: "NotoNaskhArabic",fontWeight: FontWeight.bold),
            ),
            Text('MENU',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,shadows: [
              Shadow(color: Colors.white,blurRadius: 5)
            ]),),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
                children: [
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    // hoverColor: Colors.transparent,
                    onTap: () {
                      _playClickSound();
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1,
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/images/info.png",width: 50,height: 50,),
                            Text(
                              'اِرْشَاد',
                              style: TextStyle(fontSize: 30, fontFamily: "NotoNaskhArabic",fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    // hoverColor: Colors.transparent,
                    onTap: () {
                      _playClickSound();
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1,
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            Image.asset("assets/images/ebook.png",width: 50,height: 50,),
                            Text(
                              'مَادَّة',
                              style: TextStyle(fontSize: 30, fontFamily: "NotoNaskhArabic",fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    // hoverColor: Colors.transparent,
                    onTap: () {
                      _playClickSound();

                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1,
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            Image.asset("assets/images/mahasiswa.png",width: 50,height: 50,),
                            Text(
                              'بُغْيَة',
                              style: TextStyle(fontSize: 30, fontFamily: "NotoNaskhArabic",fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    // hoverColor: Colors.transparent,
                    onTap: () {
                      _playClickSound();

                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1,
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            Image.asset("assets/images/bio.png",width: 50,height: 50,),
                            Text(
                              'سِيْرَة',
                              style: TextStyle(fontSize: 30, fontFamily: "NotoNaskhArabic",fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //
            //   ],
            // ),
            // SizedBox(height: 10,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //
            //   ],
            // ),
            // SizedBox(height: 10,),
            // InkWell(
            //   highlightColor: Colors.transparent,
            //   splashColor: Colors.transparent,
            //   // hoverColor: Colors.transparent,
            //   onTap: () {
            //     _playClickSound();
            //
            //   },
            //   borderRadius: BorderRadius.circular(10),
            //   child: Card(
            //     elevation: 0,
            //     color: Colors.transparent,
            //     shape: RoundedRectangleBorder(
            //         side: BorderSide(
            //             width: 0.5,
            //             color: Colors.black
            //         ),
            //         borderRadius: BorderRadius.circular(10)
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(10),
            //       child: Column(
            //         children: [
            //           Image.asset("assets/images/info.png",width: 50,height: 50,),
            //           Text(
            //             'قائمة طعام',
            //             style: TextStyle(fontSize: 30, fontFamily: "NotoNaskhArabic",fontWeight: FontWeight.bold),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        )
    );
  }
}
