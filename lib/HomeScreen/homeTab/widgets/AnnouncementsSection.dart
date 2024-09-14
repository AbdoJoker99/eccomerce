import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// If you are using flutter_screenutil, make sure to import it:
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnnouncementsSection extends StatelessWidget {
  final List<String> sliderImages = [
    'assets/images/computer.png',
    'assets/images/makeUp.png',
    'assets/images/music.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 200,
      initialPage: 0,
      indicatorColor: Colors.blue,
      indicatorBackgroundColor: Colors.grey,
      children: sliderImages.map((imagePath) {
        return Image.asset(
          imagePath,
          fit: BoxFit.cover,
        );
      }).toList(),
      onPageChanged: (value) {
        print('Page changed: $value');
      },
      // Uncomment this line if you are using flutter_screenutil or similar for responsive sizing
      indicatorBottomPadding: 20.h,
      autoPlayInterval: 3000,
      isLoop: true,
    );
  }
}
