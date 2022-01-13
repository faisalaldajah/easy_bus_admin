import 'package:easy_bus_admin/Model/TripDetails.dart';
import 'package:easy_bus_admin/Model/driver.dart';
import 'package:easy_bus_admin/Model/user.dart';
import 'package:easy_bus_admin/Screens/MainPage.dart';
import 'package:easy_bus_admin/widgets/PermissionLocation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

User currentFirebaseUser;
// ignore: prefer_typing_uninitialized_variables
var userInfo;
List<Driver> driverdata = [];
List<UserDetails> userData = [];
List<TripDetails> tripDetails = [];
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
void showSnackBar(String title) {
  final snackbar = SnackBar(
    content: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15),
    ),
  );
  // ignore: deprecated_member_use
  scaffoldKey.currentState.showSnackBar(snackbar);
}

void getCurrentUserInfo(context) async {
  //////

  currentFirebaseUser = FirebaseAuth.instance.currentUser;
  String userid = currentFirebaseUser.uid;

  DatabaseReference userRef =
      FirebaseDatabase.instance.reference().child('admin/$userid');
  userRef.once().then((DataSnapshot snapshot) {
    if (snapshot.value != null) {
      userInfo = UserDetails.fromSnapshot(snapshot);
      Navigator.pushNamedAndRemoveUntil(context, MainPage.id, (route) => false);
    }
  });
}
