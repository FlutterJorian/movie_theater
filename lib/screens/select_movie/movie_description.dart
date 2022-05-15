import 'package:flutter/material.dart';

class MovieDescription extends StatefulWidget {
  const MovieDescription({Key? key}) : super(key: key);

  @override
  State<MovieDescription> createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription> {
  final PageController pageController = PageController(viewportFraction: 0.34);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: Colors.black,
      fontSize: 13,
    );
    var textStyleTitle = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Director',
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Actors',
          style: textStyleTitle,
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 180,
          child: PageView(
            padEnds: false,
            controller: pageController,
            children: List.generate(
              4,
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(35),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 35,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lorem Ipsum',
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
        Text(
          'Introduction',
          style: textStyleTitle,
        ),
        SizedBox(height: 15),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nec luctus erat. Curabitur ultricies massa quis justo viverra, a euismod nulla rutrum. Sed non mauris eros. Duis quam nunc, porttitor cursus dolor id, luctus viverra purus. Nulla auctor libero vitae eros aliquam, nec eleifend sapien mattis. Ut luctus et neque in tincidunt. Morbi egestas maximus erat ac ultricies. Sed tristique mi quis eros faucibus, quis finibus diam eleifend. Nullam dictum sodales sagittis. Sed pharetra massa sed urna pellentesque dictum. Sed pretium condimentum eros, cursus blandit nulla vestibulum et. Quisque sed accumsan orci. Nullam laoreet ipsum placerat, pellentesque ligula eu, porta orci. Sed sit amet orci dignissim, venenatis urna in, laoreet nisl. Etiam quis purus id augue porta pharetra.',
          style: textStyle,
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 80),
      ],
    );
  }
}
