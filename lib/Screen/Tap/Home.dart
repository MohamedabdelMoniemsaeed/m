import 'package:flutter/material.dart';
import 'package:movise/Widget/CarouselSlider.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSliderWidget(),
      ],
    );
  }
}
