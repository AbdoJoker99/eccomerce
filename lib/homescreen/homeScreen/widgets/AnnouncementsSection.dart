import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class AnnouncementsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 200,
      initialPage: 0,
      indicatorColor: Colors.blue,
      indicatorBackgroundColor: Colors.grey,
      children: [
        Image.asset(
          'assets/images/computer.png',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/makeUp.png',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/music.png',
          fit: BoxFit.cover,
        ),
      ],
      onPageChanged: (value) {
        print('Page changed: $value');
      },
      autoPlayInterval: 3000,
      isLoop: true,
    );
  }
}
