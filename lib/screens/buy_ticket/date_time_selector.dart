import 'package:flutter/material.dart';

class DateTimeSelector extends StatefulWidget {
  const DateTimeSelector({Key? key}) : super(key: key);

  @override
  State<DateTimeSelector> createState() => _DateTimeSelectorState();
}

class _DateTimeSelectorState extends State<DateTimeSelector> {
  final DateTime startDate = DateTime.now();
  late DateTime selectedDate;
  final months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  final PageController pageController = PageController(viewportFraction: 0.33);
  int? selectedIndex;

  @override
  void initState() {
    selectedDate = startDate;
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final times = getTimes();
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 12,
    );
    const textStyle2 = TextStyle(
      color: Colors.white,
      fontSize: 14,
    );
    return Row(
      children: [
        DropdownButton<DateTime>(
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
          underline: const SizedBox(),
          value: selectedDate,
          style: textStyle2,
          dropdownColor: Colors.black,
          items: List.generate(
            5,
            (index) {
              var datetime = startDate.add(Duration(days: index));
              return DropdownMenuItem(
                value: datetime,
                child: Center(
                  child: Text(
                    '${months[datetime.month - 1]} ${datetime.day}',
                    style: textStyle2,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
          onChanged: (datetime) {
            setState(() {
              selectedIndex = null;
              selectedDate = datetime ?? startDate;
            });
          },
        ),
        const SizedBox(width: 15),
        Expanded(
          child: SizedBox(
            height: 26,
            child: PageView.builder(
              itemCount: times.length,
              padEnds: false,
              controller: pageController,
              itemBuilder: (context, index) {
                var datetime = times[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: selectedIndex != index
                          ? Border.all(
                              color: const Color(0xff2C2B37),
                              width: 1,
                            )
                          : null,
                      color: selectedIndex == index
                          ? const Color(0xffF51933)
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        '${datetime.hour.toString().padLeft(2, '0')}:'
                        '${datetime.minute.toString().padLeft(2, '0')}',
                        style: textStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  List<DateTime> getTimes() {
    List<DateTime> datetimes = [];
    var time = selectedDate.add(const Duration(hours: 1));
    time = DateTime(time.year, time.month, time.day, time.hour);
    while (time.day == selectedDate.day) {
      datetimes.add(time);
      time = time.add(const Duration(minutes: 30));
    }
    return datetimes;
  }
}
