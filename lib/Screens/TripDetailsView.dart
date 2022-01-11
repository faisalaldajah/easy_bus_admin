import 'package:easy_bus_admin/Model/TripDetails.dart';
import 'package:easy_bus_admin/brand_colors.dart';
import 'package:easy_bus_admin/globalvariabels.dart';
import 'package:flutter/material.dart';

class TripDetailsView extends StatelessWidget {
  const TripDetailsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            'Trip Details',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: tripDetails.length,
          itemBuilder: (context, index) {
            if (tripDetails[index] == null) {
              return Container();
            }
            return TripCard(
              tripDetail: tripDetails[18],
            );
          }),
    );
  }
}

class TripCard extends StatelessWidget {
  TripDetails tripDetail;
  TripCard({
    Key key,
    this.tripDetail,
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
                tripDetail.destinationAddress,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              Text(
                tripDetail.pickUpAddress,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              Text(
                tripDetail.driverName,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              Text(
                tripDetail.riderName,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              Text(
                tripDetail.createdAt,
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
