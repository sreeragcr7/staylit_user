import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Casourl extends StatelessWidget {
  const Casourl({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Carousel(
      overlayShadow: false,
      dotBgColor: Colors.transparent,
      boxFit: BoxFit.fill,
      images: const [
        AssetImage('assets/images/service.jpg'),
        AssetImage('assets/images/service2.jpg'),
        AssetImage('assets/images/service3.jpg'),
        AssetImage('assets/images/service4.jpg'),
      ],
      autoplay: true,
      dotColor: Colors.white,
      dotSize: 3.0,
      dotSpacing: 20.0,
    );
  }
}
