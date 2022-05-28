import 'package:flutter/material.dart';
import 'package:movie_theater/main.dart';
import 'package:movie_theater/screens/buy_ticket/theater_seats.dart';

class BuyTicket extends StatefulWidget {
  const BuyTicket({Key? key}) : super(key: key);

  @override
  State<BuyTicket> createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> with TickerProviderStateMixin {
  late AnimationController animationController;
  List<Animation<double>> seatRowAnimations = [];

  bool switchAn = false;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    const rows = 10;
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    for (var i = 0; i < rows; i++) {
      var seatRowAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(i / 15, (i + 1) / 10),
        ),
      )..addListener(() {
          setState(() {});
        });
      seatRowAnimations.add(seatRowAnimation);
    }
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 11,
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: Column(
          children: [
            Spacer(),
            TheaterSeats(
              rowScales: seatRowAnimations.map((row) => row.value).toList(),
            ),
            SizedBox(height: 30),
            Row(
              children: const [
                Icon(
                  Icons.circle,
                  color: Color(0xffB3B3C3),
                  size: 10,
                ),
                SizedBox(width: 5),
                Text('Available', style: textStyle),
                Spacer(),
                Icon(
                  Icons.circle,
                  color: Color(0xff2C2B37),
                  size: 10,
                ),
                SizedBox(width: 5),
                Text('Taken', style: textStyle),
                Spacer(),
                Icon(
                  Icons.circle,
                  color: Color(0xffF51933),
                  size: 10,
                ),
                SizedBox(width: 5),
                Text('Selected', style: textStyle),
              ],
            ),
            SizedBox(height: 15),
            Divider(color: Color(0xff2C2B37), thickness: 0.5),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                'Januray 18',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Divider(color: Color(0xff2C2B37), thickness: 0.5),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                // if (switchAn) {
                //   animationController.forward().whenComplete(() => setState(() {
                //         switchAn = !switchAn;
                //       }));
                // } else {
                //   animationController.reverse().whenComplete(() => setState(() {
                //         switchAn = !switchAn;
                //       }));
                // }
                Navigator.pushReplacementNamed(
                    context, MovieTheaterRoute.selectMovie);
              },
              child: Container(
                height: 50,
                width: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: const [Color(0xffC4562F), Color(0xffF51933)],
                  ),
                ),
                child: Center(
                  child: Text(
                    'PAY',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
