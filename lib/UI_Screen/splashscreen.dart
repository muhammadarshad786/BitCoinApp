import 'dart:async';
import 'package:coffeewithcoin/UI_Screen/Home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}
class SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => const Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
          Image.asset(
            'assets/Bitcoin-ezgif.com-gif-maker.gif',
          ),
          const SizedBox(height: 30),
          Text(
            'Coffee With Coins',
            style: GoogleFonts.rubikScribble(
              textStyle: const TextStyle(
                color: Colors.orange,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
