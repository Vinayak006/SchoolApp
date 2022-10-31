import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Schedule extends StatelessWidget {
  final String topic;
  final DateTime date;
  const Schedule({
    Key? key,
    required this.topic,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.15),
            blurRadius: 18.0,
            spreadRadius: 0.0,
            offset: const Offset(
              0.0,
              12.0,
            ),
          )
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.checklist_sharp,
                  size: 45,
                  color: const Color.fromARGB(255, 18, 83, 135).withOpacity(.8),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              topic,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 18, 83, 135),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              date.toString().split(" ").first,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 18, 83, 135)
                                    .withOpacity(.8),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      CircularPercentIndicator(
                        progressColor: const Color.fromARGB(255, 18, 83, 135)
                            .withOpacity(.5),
                        radius: 35,
                        percent: date.difference(DateTime.now()).inDays / 100,
                        lineWidth: 3,
                        center: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "${date.difference(DateTime.now()).inDays}\n",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 18, 83, 135),
                                  fontSize: 16,
                                ),
                              ),
                              const TextSpan(
                                text: "Days left",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 18, 83, 135),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
