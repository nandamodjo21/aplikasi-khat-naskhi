import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class BaPage extends StatefulWidget {
  final Color color;
  const BaPage({super.key, required this.color});

  @override
  State<BaPage> createState() => _BaPageState();
}

class _BaPageState extends State<BaPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset("assets/animation/batasa.json")
          ],
        ),
      ),
    );
  }
}
