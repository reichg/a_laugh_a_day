import 'dart:math';

import 'package:a_laugh_a_day/utils/joke_utils.dart';
import 'package:flutter/material.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;
import 'package:intl/intl.dart';

import 'custom_box_shadow/custom_box_shadow.dart';

class DadMessageBoxWidget extends StatefulWidget {
  final String dadName;
  final String jokeText;
  final AssetImage dadImage;

  const DadMessageBoxWidget({
    Key? key,
    required this.jokeText,
    required this.dadName,
    required this.dadImage,
  }) : super(key: key);

  @override
  State<DadMessageBoxWidget> createState() => _DadMessageBoxWidgetState();
}

class _DadMessageBoxWidgetState extends State<DadMessageBoxWidget> {
  Random rnd = Random();
  String imageId = '1x7krU-0UwcIs_IguBVoo4ZyzCbLCKK4G';

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    final dateDayName = DateFormat('EEEE').format(currentDate);
    final dateMonthName = DateFormat('MMMM').format(currentDate);
    final dateDayAbb = DateFormat('d').format(currentDate);
    final dateHour = DateFormat('Hm').format(currentDate);

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
                  child: Text(
                    "$dateDayName $dateMonthName $dateDayAbb",
                    style: TextStyle(
                      color: Color.fromARGB(176, 255, 255, 255),
                      fontFamily: 'Futura',
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
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
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: CircleAvatar(
                                  backgroundImage: widget.dadImage,
                                  radius: 25,
                                ),
                              ),
                              Text(
                                '${widget.dadName}',
                                style: const TextStyle(
                                  fontFamily: 'Futura',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Text(
                            widget.jokeText,
                            style: const TextStyle(
                              fontFamily: 'Futura',
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
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
                    style: TextStyle(
                        color: Color.fromARGB(176, 255, 255, 255),
                        fontFamily: 'Futura',
                        fontSize: 13),
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
