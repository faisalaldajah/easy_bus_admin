// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:firebase_database/firebase_database.dart';

class Driver {
  String fullName;
  String email;
  String phone;
  String id;
  String busType;
  String socialDriverNumber;
  String busNumber;
  var driversIsAvailable;
  String driverType;
  String approveDriver;
  String oil;
  String exDate;
  String front;
  String rear;
  String dis;
  Driver({
    this.fullName,
    this.email,
    this.phone,
    this.id,
    this.busType,
    this.socialDriverNumber,
    this.busNumber,
    this.driverType,
    this.approveDriver,
    this.dis,
    this.driversIsAvailable,
    this.exDate,
    this.front,
    this.oil,
    this.rear,
  });

  Driver.fromSnapshot(DataSnapshot snapshot) {
    id = snapshot.key;
    phone = snapshot.value['phone'];
    email = snapshot.value['email'];
    fullName = snapshot.value['fullname'];
    busType = snapshot.value['busType'];
    socialDriverNumber = snapshot.value['socialDriverNumber'];
    busNumber = snapshot.value['busNumber'];
    driversIsAvailable = snapshot.value['driversIsAvailable'];
    driverType = snapshot.value['driverType'];
    approveDriver = snapshot.value['approveDriver'];
    oil = snapshot.value['fixData']['oil'];
    exDate = snapshot.value['fixData']['exDate'];
    dis = snapshot.value['fixData']['dis'];
    rear=snapshot.value['fixData']['rear'];
    front = snapshot.value['fixData']['front'];
  }
}
