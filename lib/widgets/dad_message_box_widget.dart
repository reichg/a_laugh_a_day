import 'package:flutter/material.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;
import 'package:intl/intl.dart';

import 'custom_box_shadow/custom_box_shadow.dart';

class DadMessageBoxWidget extends StatefulWidget {
  final String dadName;
  final String jokeText;

  const DadMessageBoxWidget(
      {Key? key, required this.jokeText, required this.dadName})
      : super(key: key);

  @override
  State<DadMessageBoxWidget> createState() => _DadMessageBoxWidgetState();
}

class _DadMessageBoxWidgetState extends State<DadMessageBoxWidget> {
  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Text("$dateDayName $dateMonthName $dateDayAbb"),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        CustomBoxShadow(
                            color: Constants.PRIMARY_BLACK,
                            offset: Offset(0.5, 0.5),
                            blurRadius: 10.0,
                            blurStyle: BlurStyle.outer)
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 15,
                          ),
                          child: Text(
                            'From: ${widget.dadName}',
                            style: const TextStyle(
                              fontFamily: 'Aleo-Regular',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Constants.PRIMARY_BLACK,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Text(
                            widget.jokeText,
                            style: const TextStyle(
                              fontFamily: 'Aleo-Regular',
                              fontSize: 22,
                              color: Constants.PRIMARY_BLACK,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    "Received: $dateHour",
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
