import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iot_thai_moneyshare_project/views/money_result_ui.dart';

class MoneyInputUI extends StatefulWidget {
  const MoneyInputUI({super.key});

  @override
  State<MoneyInputUI> createState() => _MoneyInputUIState();
}

class _MoneyInputUIState extends State<MoneyInputUI> {
  bool isTip = false;
  // ตัวควบคุม TextField
  TextEditingController moneyCtrl = TextEditingController();
  TextEditingController personCtrl = TextEditingController();
  TextEditingController tipCtrl = TextEditingController();

  // เมธอดแสดงข้อความเตือน
  showWarningMSG(context, msg) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('คำเตือน'),
          content: Text(msg),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'ตกลง',
              ),
            ),
          ],
        );
      },
    );
  }

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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Image.asset(
              'assets/images/money.png',
              width: MediaQuery.of(context).size.width * 0.35,
            ),
            // ช่องกรอกจำนวนเงิน
            TextField(
              controller: moneyCtrl,  // เชื่อมต่อ controller
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                ),
                prefixIcon: Icon(
                  FontAwesomeIcons.moneyBill1Wave,
                  color: Colors.greenAccent,
                ),
                hintText: "ป้อนจำนวนเงิน (บาท)",
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            // ช่องกรอกจำนวนคน
            TextField(
              controller: personCtrl,  // เชื่อมต่อ controller
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.greenAccent,
                ),
                hintText: "ป้อนจำนวนคน (คน)",
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            // Checkbox สำหรับทิป
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  onChanged: (paramValue) {
                    setState(() {
                      isTip = paramValue!;
                    });
                  },
                  value: isTip,
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  side: BorderSide(
                    color: Colors.green,
                  ),
                ),
                Text(
                  "ทิปให้พนักงานเสริฟ",
                ),
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            // ช่องกรอกจำนวนเงินทิป (ถ้าทิปถูกเลือก)
            TextField(
              controller: tipCtrl,  // เชื่อมต่อ controller
              enabled: isTip,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                ),
                prefixIcon: Icon(
                  FontAwesomeIcons.coins,
                  color: Colors.greenAccent,
                ),
                hintText: "ป้อนจำนวนเงินทิป (บาท)",
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            // ปุ่มคำนวณ
            ElevatedButton(
              onPressed: () {
                if (moneyCtrl.text.isEmpty) {
                  // แจ้งเตือนหากไม่ได้ป้อนจำนวนเงิน
                  showWarningMSG(context, 'โปรดป้อนเงินด้วยครับ !!!!');
                } else if (personCtrl.text.isEmpty) {
                  // แจ้งเตือนหากไม่ได้ป้อนจำนวนคน
                  showWarningMSG(context, 'โปรดป้อนจำนวนคนด้วยครับ !!!!');
                } else if (isTip == true && tipCtrl.text.isEmpty) {
                  // แจ้งเตือนหากไม่ได้ป้อนเงินทิป
                  showWarningMSG(context, 'โปรดป้อนเงินทิปด้วยครับ !!!!');
                } else {
                  // คำนวณแล้วแสดงผลที่หน้าจอ MoneyResultUI()
                  double money = double.parse(moneyCtrl.text);
                  int person = int.parse(personCtrl.text);
                  double tip = isTip == true ? double.parse(tipCtrl.text) : 0;
                  double moneyShare = (money + tip) / person;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoneyResultUI(
                        money: money,
                        person: person,
                        tip: tip,
                        moneyShare: moneyShare,
                      ),
                    ),
                  );
                }
              },
              child: Text(
                "คำนวณ",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width,
                    50.0,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
            ),
            SizedBox(
              height: 10.0,
            ),
            // ปุ่มยกเลิก
            ElevatedButton.icon(
              onPressed: () {
                // ให้หน้าจอกลลับมาเป็นเไหมือนตอนเริ่มต้น
                setState(() {
                  moneyCtrl.clear();
                  personCtrl.clear();
                  tipCtrl.clear();
                  isTip = false;
                  tipCtrl.text = '';
                });
              },
              icon: Icon(
                Icons.cancel_outlined,
                color: Colors.white,
              ),
              label: Text(
                "ยกเลิก",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width,
                    50.0,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
            ),
            SizedBox(
              height: 35.0,
            ),
            Text(
              "Create by Sorawit",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
