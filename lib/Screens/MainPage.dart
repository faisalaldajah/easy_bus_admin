// ignore_for_file: file_names, missing_return, prefer_const_constructors

import 'package:easy_bus_admin/Model/TripDetails.dart';
import 'package:easy_bus_admin/Model/driver.dart';
import 'package:easy_bus_admin/Model/user.dart';
import 'package:easy_bus_admin/Screens/DriverScreenDetrails.dart';
import 'package:easy_bus_admin/Screens/TripDetailsView.dart';
import 'package:easy_bus_admin/brand_colors.dart';
import 'package:easy_bus_admin/widgets/DataViewer.dart';
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
        title: const Center(
          child: Text(
            "الرئيسية",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'JF-Flat-regular',
            ),
          ),
        ),
        backgroundColor: BrandColors.colorBackground,
        elevation: 0,
      ),
      backgroundColor: BrandColors.colorBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            DataViewer(
              icon: const Icon(Icons.person),
              title: 'عدد المستخدمين',
              total: userData.length,
            ),
            DataViewer(
              icon: const Icon(Icons.person),
              title: 'عدد السواقين',
              total: driverdata.length,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DriverScreenDetails()));
              },
            ),
            DataViewer(
              icon: const Icon(Icons.bus_alert),
              title: 'عدد الرحلات',
              total: tripDetails.length,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TripDetailsView()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getData() {
    DatabaseReference driverRef =
        FirebaseDatabase.instance.reference().child('drivers');
    DatabaseReference userRef =
        FirebaseDatabase.instance.reference().child('users');
    DatabaseReference tripRef =
        FirebaseDatabase.instance.reference().child('rideRequest');
    // ignore: prefer_typing_uninitialized_variables
    var keys;
    Driver driver;
    UserDetails user;
    TripDetails trip;
    driverRef.once().then((DataSnapshot snapshot) {
      keys = snapshot.value.keys;
      for (var key in keys) {
        driver = Driver(
          fullName: snapshot.value[key]['fullname'],
          phone: snapshot.value[key]['phone'],
          busNumber: snapshot.value['busNumber'],
          busType: snapshot.value['busType'],
          socialDriverNumber: snapshot.value['socialDriverNumber'],
          driverType: snapshot.value['driverType'],
          email: snapshot.value[key]['email'],
        );
        setState(() {
          driverdata.add(driver);
        });
      }
    });
    tripRef.once().then((DataSnapshot snapshot) {
      keys = snapshot.value.keys;
      for (var key in keys) {
        trip = TripDetails(
          riderName: snapshot.value[key]['rider_name'],
          riderPhone: snapshot.value[key]['rider_phone'],
          driverPhone: snapshot.value[key]['driver_phone'],
          driverName: snapshot.value[key]['driver_name'],
          busDetails: snapshot.value[key]['car_details'],
          createdAt: snapshot.value[key]['created_at'],
          destinationAddress: snapshot.value[key]['destination_address'],
          iD: key,
          pickUpAddress: snapshot.value[key]['pickup_address'],
        );
        setState(() {
          tripDetails.add(trip);
        });
      }
    });
    userRef.once().then((DataSnapshot snapshot) {
      keys = snapshot.value.keys;
      for (var key in keys) {
        user = UserDetails(
          fullName: snapshot.value[key]['fullname'],
          phone: snapshot.value[key]['phone'],
        );
        setState(() {
          userData.add(user);
        });
      }
    });
  }
}
