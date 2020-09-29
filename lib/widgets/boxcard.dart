import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class BoxCard extends StatelessWidget {
  BoxCard({@required this.title, this.items});
  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: Offset(0,1),
              blurRadius: 5.0,
              spreadRadius: 7.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(title, style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(items[0], style: TextStyle(
                      color: kPrimaryTextColor,
                      fontSize: 20.0,
                    ),),
                    Text(items[1], style: TextStyle(
                      color: kPrimaryTextColor,
                      fontSize: 20.0,
                    ),),
                    Text(items[2], style: TextStyle(
                      color: kPrimaryTextColor,
                      fontSize: 20.0,
                    ),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}