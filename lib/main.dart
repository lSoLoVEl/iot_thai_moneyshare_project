import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_thai_moneyshare_project/views/splash_screen_ui.dart';

void main(){
  runApp(
    IOTThaiMoneyShare()
  );
}
class IOTThaiMoneyShare extends StatefulWidget {
  const IOTThaiMoneyShare({super.key});

  @override
  State<IOTThaiMoneyShare> createState() => _IOTThaiMoneyShareState();
}

class _IOTThaiMoneyShareState extends State<IOTThaiMoneyShare> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreenUI(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      );
  }
}