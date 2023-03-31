import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'custom_box_shadow/custom_box_shadow.dart';

class DadMessageBoxWidget extends StatefulWidget {
  final String dadName;
  final String jokeText;
  final Image dadImage;

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
  bool snackBarIsOpen = false;
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
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "$dateDayName $dateMonthName $dateDayAbb",
                    style: const TextStyle(
                      color: Constants.PRIMARY_TEXT,
                      fontFamily: 'Lato',
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                                padding: const EdgeInsets.only(right: 12.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: widget.dadImage.image,
                                  radius: 28,
                                ),
                              ),
                              Text(
                                widget.dadName,
                                style: const TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Constants.PRIMARY_TEXT,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(1.5, 1.5),
                                        blurRadius: 3.0,
                                        color: Constants.PRIMARY_BLACK,
                                      ),
                                    ]),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(
                                  Icons.copy,
                                  size: 20,
                                ),
                                onPressed: snackBarIsOpen
                                    ? null
                                    : () async {
                                        setState(() {
                                          snackBarIsOpen = true;
                                        });
                                        await Clipboard.setData(ClipboardData(
                                                text: widget.jokeText))
                                            .then((value) =>
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                          "Copied Joke To Clipboard",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: Constants
                                                                .PRIMARY_BLACK,
                                                            fontFamily: 'Lato',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                          milliseconds: 1250,
                                                        ),
                                                        backgroundColor:
                                                            Constants
                                                                .PRIMARY_AQUA,
                                                      ),
                                                    )
                                                    .closed
                                                    .then(((value) {
                                                  mounted
                                                      ? setState(() {
                                                          snackBarIsOpen =
                                                              false;
                                                        })
                                                      : null;
                                                })));
                                      },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: AutoSizeText(
                            minFontSize: 16,
                            maxLines: 11,
                            widget.jokeText,
                            style: const TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 22,
                              color: Constants.PRIMARY_TEXT,
                              fontWeight: FontWeight.w300,
                              shadows: [
                                Shadow(
                                  offset: Offset(1.5, 1.5),
                                  blurRadius: 3.0,
                                  color: Constants.PRIMARY_BLACK,
                                ),
                              ],
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
                    style: const TextStyle(
                        color: Constants.PRIMARY_TEXT,
                        fontFamily: 'Lato',
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
