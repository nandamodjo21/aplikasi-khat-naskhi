
import 'package:aplikasi_bahasa_arab/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'config/theme_config.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary4,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/uin.png",width: 50,height: 50,),
                SizedBox(width: 10,),
                Image.asset("assets/images/kemenag.png",width: 50,height: 50,),

              ],
            ),
            Image.asset("assets/images/naskhi.png",width: 150,height: 150,),

            Lottie.asset("assets/images/hafidz.json",width: 250,height: 250),
            // Image.asset("assets/images/hafidz.png",height: 250,width: 250,),

            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Text(
                "APLIKASI KHAT NASKHI UNTUK IMLA' KELAS X MA",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,),
            ),
            SizedBox(height: 20,),

            SizedBox(
              width:150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade600,
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DashboardPage(),), (route) => false,);
                }, child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_downward_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 10,),
                  Text('Mulai',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: 10,),
                  Icon(
                    Icons.arrow_downward_outlined,
                    color: Colors.white,
                    size: 20,
                  )
                ],
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
