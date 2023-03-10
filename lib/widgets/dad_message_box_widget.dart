import 'dart:math';

import 'package:flutter/material.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;
import 'package:a_laugh_a_day/widgets/typing_indicator/typing_indicator.dart';
import 'package:intl/intl.dart';

import 'custom_box_shadow/custom_box_shadow.dart';

class DadMessageBoxWidget extends StatefulWidget {
  final String dadName;
  final String jokeText;

  DadMessageBoxWidget({Key? key, required this.jokeText, required this.dadName})
      : super(key: key);

  @override
  State<DadMessageBoxWidget> createState() => _DadMessageBoxWidgetState();
}

class _DadMessageBoxWidgetState extends State<DadMessageBoxWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    DateTime currentDate = DateTime.now();
    final dateDayName = DateFormat('EEEE').format(currentDate);
    final dateMonthName = DateFormat('MMMM').format(currentDate);
    final dateDayAbb = DateFormat('d').format(currentDate);
    final dateHour = DateFormat('Hm').format(currentDate);

    //To Do
    //Need to add custom text message widget to hold text from "dad"
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(height / 55),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  child: Text("${dateDayName} ${dateMonthName} ${dateDayAbb}"),
                  padding: EdgeInsets.all(2),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height / 35, horizontal: width / 25),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      CustomBoxShadow(
                          color: Constants.PRIMARY_BLACK,
                          offset: new Offset(0.5, 0.5),
                          blurRadius: 10.0,
                          blurStyle: BlurStyle.outer)
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'From: ${widget.dadName}',
                          style: TextStyle(
                            fontFamily: 'Aleo-Regular',
                            fontWeight: FontWeight.bold,
                            fontSize: height / 48,
                            color: Constants.PRIMARY_BLACK,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.jokeText,
                          style: TextStyle(
                            fontFamily: 'Aleo-Regular',
                            fontSize: height / 40,
                            color: Constants.PRIMARY_BLACK,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    "Received: ${dateHour}",
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
