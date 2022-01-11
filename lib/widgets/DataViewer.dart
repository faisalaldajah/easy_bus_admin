// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

import '../brand_colors.dart';

class DataViewer extends StatelessWidget {
  final int total;
  final String title;
  final Icon icon;
  final Function onTap;
  DataViewer({
    this.icon,
    this.title,
    this.total,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: BrandColors.colorAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                  color: BrandColors.colorBackground,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  border: Border.all(color: Colors.grey[300])),
              child: Center(
                child: Icon(
                  icon.icon,
                  color: BrandColors.colorAccent,
                  size: 70,
                ),
              ),
            ),
            Expanded(child: Container()),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    total.toString(),
                    style: const TextStyle(
                      color: BrandColors.colorBackground,
                      fontFamily: 'JF-Flat-regular',
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: BrandColors.colorBackground,
                      fontFamily: 'JF-Flat-regular',
                      fontSize: 20,
                    ),
                    maxLines: 4,
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
