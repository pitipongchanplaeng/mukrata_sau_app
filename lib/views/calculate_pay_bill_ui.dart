// ignore_for_file: prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mukrata_sau_app/views/show_pay_bill_ui.dart';

class CalculatePayBillUI extends StatefulWidget {
  const CalculatePayBillUI({super.key});

  @override
  State<CalculatePayBillUI> createState() => _CalculatePayBillUIState();
}

class _CalculatePayBillUIState extends State<CalculatePayBillUI> {
//ตัวแปรเก็บรายการใน Dropdown
  List<String> _memberType = [
    'ไม่เป็นสมาชิก',
    'สมาชิก Silver Member ลด 5%',
    'สมาชิก Gold Member Member ลด 10%',
    'สมาชิก Platium Member ลด 20%',
  ];
//ตัวแปรเก็บรายการที่เลือกในdropdown
  String _memberTypeSelect = 'ไม่เป็นสมาชิก';

  //ตัวแปรเก็บรูปที่ถ่าย
  File? _imageFromCamera;

  //เมธอดเปิดกล้องและถ่ายรูป
  Future getImageFromCamera() async{
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;

    //เก็บรูปที่ถ่ายไว้ในตัวแปลที่สร้างไว้ก่อนหน้า
    setState(() {
      _imageFromCamera = File(image.path);
    });
  }

  //สร้างตัวแปรเก็บสถานะผู้ใหญ่ และเด็กว่า้ลือกไม่เลือก
  bool adultStatus = false;
  bool babyStatus = false;

  //สร้างตัวแปรสำหรับ gruop value ของ radio
  int waterStatus = 1;

//สร้างตัวควบคุม textfield
TextEditingController adultCtrl = TextEditingController(text: '0');
TextEditingController babyCtrl = TextEditingController(text: '0');
TextEditingController cokeCtrl = TextEditingController(text: '0');
TextEditingController pureCtrl = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 35.0,
            right: 35.0,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: (){
                    getImageFromCamera();
                  },
                  child: _imageFromCamera == null
                  ?Image.asset(
                    'assets/images/camera.jpg',
                    width: 150.0,
                    height: 150.0,
                    fit: BoxFit.cover,
                  )
                  : Image.file(
                    _imageFromCamera!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนคน',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: adultStatus,
                      onChanged: (paramValue) {
                        setState(() {
                          adultStatus = adultStatus == true ? false : true;
                        });
                      },
                    ),
                    Text(
                      'ผู้ใหญ่ 299 บาท/คน จำนวน  ',
                    ),
                    Expanded(
                      child: TextField(
                        controller: adultCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      'คน ',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: babyStatus,
                      onChanged: (paramValue) {
                        setState(() {
                          babyStatus = babyStatus == true ? false : true;
                        });
                      },
                    ),
                    Text(
                      'เด็ก 69 บาท/คน จำนวน      ',
                    ),
                    Expanded(
                      child: TextField(
                        controller: babyCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      'คน ',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุปเฟต์น้ำดื่ม',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: waterStatus,
                      onChanged: (paramValue) {
                        setState(() {
                          waterStatus = paramValue!;
                        });
                      },
                    ),
                    Text('รับ 25 บาท/หัว'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: waterStatus,
                      onChanged: (paramValue) {
                        setState(() {
                          waterStatus = paramValue!;
                        });
                      },
                    ),
                    Text('ไม่รับ'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'โค้ก 20 บาท/ขวด จำนวน  ',
                    ),
                    Expanded(
                      child: TextField(
                        controller: cokeCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      'ขวด ',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'น้ำเปล่า 15 บาท/ขวด จำนวน  ',
                    ),
                    Expanded(
                      child: TextField(
                        controller: pureCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      'ขวด ',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ประเภทสมาชิก',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownButton(
                  items: _memberType
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                            ),
                          ))
                      .toList(),
                  onChanged: (paraValue) {
                    setState(() {
                      _memberTypeSelect = paraValue!;
                    });
                  },
                  value: _memberTypeSelect,
                  isExpanded: true,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            //คิดผู้ใหญ่
                            double adultPay = adultStatus == false ? 0 : (int.parse(adultCtrl.text)*299);
                            //คิดเด็ก
                            double babyPay = babyStatus == false ? 0 : (int.parse(adultCtrl.text)*69);
                            //คิดน้ำดื่มบุปเฟต์
                            double waterPay = waterStatus == 1 ? (int.parse(adultCtrl.text) + int.parse(adultCtrl.text)) * 25 : 0 ;
                            //คิดcoke
                            double cokePay = int.parse(cokeCtrl.text)*20;
                            //คิดน้ำเปล่า
                            double purePay = int.parse(pureCtrl.text)*15;
                            //คำนวณเงินที่ต้องจ่ายพร้อมส่วนลด
                            //คำนวณเงินรวมก่อนลด
                            double totalPay = adultPay + babyPay + waterPay + cokePay + purePay;
                            //คำนวณที่หักส่วนลด
                            if(_memberTypeSelect == 'ไม่เป็นสมาชิก'){
                              totalPay = totalPay;
                            }else if (_memberTypeSelect == 'สมาชิก Silver Member ลด 5%'){
                              totalPay = totalPay - (totalPay * 5/100);
                            }else if (_memberTypeSelect == 'สมาชิก Gold Member ลด 10%'){
                              totalPay = totalPay - (totalPay * 10/100);
                            }else {
                              totalPay = totalPay - (totalPay * 20/100);
                            }
                            //เปิดไปยังหน้าแสดงผล โดยส่งรูป จำนวนคน น้ำ และเงินที่ต้องจ่าย
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowPayBillUI(
                                  adult: adultCtrl.text,
                                  baby: babyCtrl.text,
                                  water: waterStatus,
                                  coke: cokeCtrl.text,
                                  pure: pureCtrl.text,
                                  memberType: _memberTypeSelect,
                                  totalPay: totalPay,
                                  imageFile: _imageFromCamera,
                                ),
                              ),
                            );

                          },
                          icon: Icon(
                            FontAwesomeIcons.calculator,
                            color: Colors.white,
                          ),
                          label: Text(
                            'คำนวณเงิน',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fixedSize: Size(
                                double.infinity,
                                55.0,
                              )),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 2,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.x,
                            color: Colors.white,
                          ),
                          label: Text(
                            'ยกเลิก',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fixedSize: Size(
                                double.infinity,
                                55.0,
                              )
                              ),
                        )
                        ),
                  ],
                ),
                SizedBox(
                  height: 70.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
