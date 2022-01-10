// ignore_for_file: file_names, missing_return

import 'package:easy_bus_admin/Model/driver.dart';
import 'package:easy_bus_admin/Model/user.dart';
import 'package:easy_bus_admin/brand_colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:easy_bus_admin/globalvariabels.dart';

class MainPage extends StatefulWidget {
  static const String id = 'mainpage';

  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الرئيسية",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: BrandColors.colorBackground,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: BrandColors.colorBackground,
      body: SingleChildScrollView(),
    );
  }

  Future<void> getData() {
    DatabaseReference driverRef =
        FirebaseDatabase.instance.reference().child('drivers');
    DatabaseReference userRef =
        FirebaseDatabase.instance.reference().child('users');
    // ignore: prefer_typing_uninitialized_variables
    var keys;
    Driver driver;
    UserDetails user;
    driverRef.once().then((DataSnapshot snapshot) {
      keys = snapshot.value.keys;
      for (var key in keys) {
        driver = Driver(
          fullName: snapshot.value[key]['fullname'],
          phone: snapshot.value[key]['phone'],
          busNumber: snapshot.value[key]['carNumber'],
          busType: snapshot.value[key]['carType'],
          approveDriver: snapshot.value[key]['approveDriver'],
          socialDriverNumber: snapshot.value[key]['socialAgentNumber'],
          driverType: snapshot.value[key]['taxiType'],
          email: snapshot.value[key]['email'],
        );
        driverdata.add(driver);
      }
    });
    userRef.once().then((DataSnapshot snapshot) {
      keys = snapshot.value.keys;
      for (var key in keys) {
        user = UserDetails(
          fullName: snapshot.value[key]['fullname'],
          phone: snapshot.value[key]['phone'],
        );
        userData.add(user);
      }
    });
  }
}
