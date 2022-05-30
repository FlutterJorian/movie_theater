import 'package:flutter/material.dart';
import 'package:movie_theater/main.dart';
import 'package:movie_theater/screens/buy_ticket/date_time_selector.dart';
import 'package:movie_theater/screens/buy_ticket/number_animation.dart';
import 'package:movie_theater/screens/buy_ticket/theater_seats.dart';

class BuyTicket extends StatefulWidget {
  const BuyTicket({Key? key}) : super(key: key);

  @override
  State<BuyTicket> createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> with TickerProviderStateMixin {
  late AnimationController animationController;
  List<Animation<double>> seatRowAnimations = [];
  late Animation<Offset> buttonAnimation;

  late AnimationController numberAnimationController;
  late AnimationController numberAnimationController2;
  late Tween<double> numberAnimationTween1;
  late Animation<double> numberAnimation1;
  late Tween<double> numberAnimationTween2;
  late Animation<double> numberAnimation2;
  late Tween<double> numberAnimationTween3;
  late Animation<double> numberAnimation3;

  double number1 = 0;
  double number2 = 0;
  double number3 = 0;

  final numSize = 20;

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
      duration: Duration(milliseconds: 950),
    );
    for (var i = 0; i < rows; i++) {
      var seatRowAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(i / 15, (i + 1) / 10),
        ),
      );
      seatRowAnimations.add(seatRowAnimation);
    }

    buttonAnimation = Tween<Offset>(
      begin: Offset(0, 150),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.4, 0.6),
      ),
    );

    numberAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    numberAnimationController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    numberAnimationTween1 = Tween<double>(begin: 0.0, end: 20);
    numberAnimation1 =
        numberAnimationTween1.animate(numberAnimationController2);
    numberAnimationTween2 = Tween<double>(begin: 0.0, end: 20);
    numberAnimation2 = numberAnimationTween2.animate(numberAnimationController);
    numberAnimationTween3 = Tween<double>(begin: 0.0, end: 20);
    numberAnimation3 = numberAnimationTween3.animate(numberAnimationController);

    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 12,
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            child: Column(
              children: [
                Spacer(),
                TheaterSeats(
                  onSelected: (selected) {
                    if (selected) {
                      animateToNumber();
                    }
                  },
                  seatRowAnimations: seatRowAnimations,
                ),
                SizedBox(height: 40),
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
                SizedBox(height: 30),
                Divider(color: Color(0xff2C2B37), thickness: 0.5),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: DateTimeSelector(),
                ),
                Divider(color: Color(0xff2C2B37), thickness: 0.5),
                SizedBox(height: 30),
                AnimatedBuilder(
                  animation: buttonAnimation,
                  builder: (context, _) => Transform.translate(
                    offset: buttonAnimation.value,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          MovieTheaterRoute.selectMovie,
                          (route) => false,
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 450,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: const [
                              Color(0xffC4562F),
                              Color(0xffF51933)
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                              child: Text(
                                'PAY €',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              children: [
                                if (number1 > 0)
                                  NumberAnimation(
                                    numberAnimation: numberAnimation1,
                                    hideZero: true,
                                  ),
                                NumberAnimation(
                                    numberAnimation: numberAnimation2),
                                NumberAnimation(
                                    numberAnimation: numberAnimation3),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50, left: 20),
            child: GestureDetector(
              onTap: () {
                animationController.reverse().whenComplete(
                      () => Navigator.pop(context),
                    );
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void animateToNumber() {
    var num1 = number1;
    var num2 = number2 + numSize;
    var num3 = number3 + (numSize * 2);

    if ((num3 / numSize) % 10 == 0) {
      num2 = num2 + numSize;
    }
    if ((num2 / numSize) % 10 == 0) {
      num1 = num1 + numSize;
    }

    if (number3 != num3) {
      var end = num3;
      numberAnimationTween3.begin = number3;
      numberAnimationTween3.end = end;
    }
    if (number2 != num2) {
      var end = num2;
      numberAnimationTween2.begin = number2;
      numberAnimationTween2.end = end;
    }
    if (number1 != num1) {
      var end = num1;
      numberAnimationTween1.begin = number1;
      numberAnimationTween1.end = end;

      setState(() {
        number1 = numberAnimationTween1.end!;
      });
      numberAnimationController2.reset();
      numberAnimationController2.forward();
    }
    if (number2 != num3 || number2 != num2) {
      numberAnimationController.reset();
      numberAnimationController.forward();
      number2 = numberAnimationTween2.end!;
      number3 = numberAnimationTween3.end!;
    }
  }
}
