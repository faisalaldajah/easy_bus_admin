// ignore_for_file: prefer_const_constructors

import 'package:easy_bus_admin/Model/TripDetails.dart';
import 'package:easy_bus_admin/Model/driver.dart';
import 'package:easy_bus_admin/brand_colors.dart';
import 'package:easy_bus_admin/globalvariabels.dart';
import 'package:flutter/material.dart';

class DriverScreenDetails extends StatelessWidget {
  const DriverScreenDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            'Driver Details',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: driverdata.length,
          itemBuilder: (context, index) {
            if (driverdata[index] == null) {
              return Container();
            } else {
              return DriverCard(
                driver: driverdata[index],
              );
            }
          }),
    );
  }
}

class DriverCard extends StatelessWidget {
  Driver driver;
  DriverCard({
    Key key,
    this.driver,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: BrandColors.colorAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                driver.fullName,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              Text(
                driver.phone,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              Text(
                driver.email,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}
