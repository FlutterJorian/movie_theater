import 'package:flutter/material.dart';

class AvatarPageView extends StatelessWidget {
  const AvatarPageView({
    required this.pageController,
    required this.names,
    this.flipColors = false,
    Key? key,
  }) : super(key: key);

  final List<String> names;
  final PageController pageController;
  final bool flipColors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView(
        padEnds: false,
        controller: pageController,
        children: names.map((name) {
          var index = names.indexOf(name);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                  color: getColor(index, flipped: !flipColors),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.person,
                  size: 35,
                  color: getColor(index, flipped: flipColors),
                ),
              ),
             const  SizedBox(height: 10),
              Text(
                name,
                style:const  TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Color getColor(int index, {bool flipped = false}) =>
      (index % 2 == 0 && !flipped) || (index % 2 == 1 && flipped)
          ? Colors.grey.shade400
          : Colors.grey.shade700;
}
