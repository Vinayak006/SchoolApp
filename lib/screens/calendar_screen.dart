import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../data.dart';
import '../widgets/schedule_card.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _currentDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  List month = [
    "January",
    "Febraury",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 18, 83, 135),
        body: SlidingUpPanel(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          body: TableCalendar(
            rowHeight: height * 0.055,
            headerStyle: const HeaderStyle(
              headerMargin: EdgeInsets.only(left: 20, right: 20, top: 15),
              rightChevronVisible: false,
              leftChevronVisible: false,
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color: Colors.white.withOpacity(.8),
              ),
              weekendStyle: TextStyle(
                color: Colors.white.withOpacity(.8),
              ),
            ),
            selectedDayPredicate: (day) {
              if (day.toUtc().day == _currentDay.toUtc().day &&
                  day.toUtc().month == _currentDay.toUtc().month) return true;
              return false;
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            firstDay: DateTime.now(),
            focusedDay: _focusedDay,
            lastDay: DateTime.utc(DateTime.now().year, 12, 31),
            currentDay: _currentDay,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _currentDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            availableCalendarFormats: const {CalendarFormat.month: "month"},
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
            ),
            calendarBuilders: CalendarBuilders(
              selectedBuilder: (context, day, focusedDay) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 23, 117, 193),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    day.toUtc().day.toString(),
                    style: TextStyle(
                      color: Colors.white.withOpacity(.8),
                    ),
                  ),
                );
              },
              disabledBuilder: (context, day, focusedDay) {
                return Text(
                  DateFormat("d").format(day),
                  style: TextStyle(
                    color: Colors.white.withOpacity(.4),
                  ),
                );
              },
              dowBuilder: (context, day) {
                return Text(
                  DateFormat("EEEE").format(day).split("").first.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: (DateFormat("EEEE").format(day).split("")[1] ==
                            DateFormat("EEEE")
                                .format(DateTime.now())
                                .split("")[1])
                        ? Colors.white.withOpacity(.8)
                        : Colors.white.withOpacity(.4),
                    fontWeight: FontWeight.w500,
                  ),
                );
              },
              defaultBuilder: (context, day, focusedDay) {
                return Text(
                  DateFormat("d").format(day),
                  style: TextStyle(
                      color: Colors.white.withOpacity(.8),
                      fontWeight: FontWeight.w500),
                );
              },
              headerTitleBuilder: (context, day) {
                return SizedBox(
                  width: width,
                  height: height * 0.07,
                  child: ListView.separated(
                    itemCount: 12 - day.month + 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      List mnth = month.sublist(day.month - 1);
                      return Text(
                        mnth[index],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: (month.elementAt(DateTime.now().month - 1) ==
                                  mnth[index])
                              ? Colors.white
                              : Colors.white.withOpacity(.6),
                        ),
                      );
                    }),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 25,
                      );
                    },
                  ),
                );
              },
            ),
          ),
          panel: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: width * 0.13,
                  height: height * 0.005,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 18, 83, 135).withOpacity(.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Schedule",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 18, 83, 135),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Year 2019-20",
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 18, 83, 135).withOpacity(.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Schedule(
                        topic: scheduleInfo[index]["topic"],
                        date: scheduleInfo[index]["date"],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 14,
                      );
                    },
                    itemCount: scheduleInfo.length,
                  ),
                ),
              ],
            ),
          ),
          minHeight: height * 0.35,
        ),
      ),
    );
  }
}
