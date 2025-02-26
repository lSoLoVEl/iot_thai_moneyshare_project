import 'package:flutter/material.dart';

class MoneyResultUI extends StatefulWidget {
  
  double ? money;
  int ? person;
  double ? tip;
  double ? moneyShare;
  //เอาตัวแปรที่สร้างไว้มารับตัวที่ส่งมาจากหน้า MoneyInputUI()
  MoneyResultUI({
    super.key,
    this.money,
    this.person,
    this.tip,
    this.moneyShare,
});

  @override
  State<MoneyResultUI> createState() => _MoneyResultUIState();
}

class _MoneyResultUIState extends State<MoneyResultUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}