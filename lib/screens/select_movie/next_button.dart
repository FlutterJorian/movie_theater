import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    required this.buttonColor,
    required this.buttonScaleAnimation,
    required this.width,
    required this.widthTransition,
    this.isInTransition = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final void Function()? onTap;
  final Color buttonColor;
  final Animation<double> buttonScaleAnimation;
  final bool isInTransition;
  final double width;
  final double widthTransition;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: onTap,
        child: ScaleTransition(
          scale: buttonScaleAnimation,
          child: Container(
            width: !isInTransition ? width - 40 : widthTransition,
            height: 50,
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(
                !isInTransition ? 5 : 25,
              ),
            ),
            child: !isInTransition
                ? const Center(
                    child: Text(
                      'BUY TICKET',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
