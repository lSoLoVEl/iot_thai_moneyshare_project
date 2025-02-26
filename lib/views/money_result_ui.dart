import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // นำเข้า package intl

class MoneyResultUI extends StatefulWidget {
  double? money;
  int? person;
  double? tip;
  double? moneyShare;

  // เอาตัวแปรที่สร้างไว้มารับตัวที่ส่งมาจากหน้า MoneyInputUI()
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
  // ใช้ NumberFormat ในการแสดงจำนวนเงิน
  final moneyFormatter = NumberFormat("#,##0.00", "th_TH"); // รูปแบบคอมม่าในจำนวนเงิน

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 55, 110, 57),
        title: Text(
          "แฃร์เงินกัน",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Image.asset(
                'assets/images/money.png',
                width: MediaQuery.of(context).size.width * 0.35,
              ),
              SizedBox(
                height: 50.0,
              ),
              // จำนวนเงิน
              Text(
                'จำนวนเงิน',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                moneyFormatter.format(widget.money!), // แปลงจำนวนเงินให้มีคอมม่า
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              // จำนวนคน
              Text(
                'จำนวนคนที่ต้องหาร',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.person!.toString(),
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              Text(
                'คน',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              // จำนวนเงินทิป
              Text(
                'จำนวนเงินทิป',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                moneyFormatter.format(widget.tip!), // แปลงจำนวนเงินทิปให้มีคอมม่า
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              // สรุปว่าหารกันคนละ
              Text(
                'สรุปว่าหารกันคนละ',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                moneyFormatter.format(widget.moneyShare!), // แปลงจำนวนเงินที่แต่ละคนต้องจ่ายให้มีคอมม่า
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
