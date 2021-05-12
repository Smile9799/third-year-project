import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/image2.jpg',
    title: 'Are You Looking For an Investor',
    description: 'MEEK Investment Systems is here to help you get in touch with the investor you have been looking for. A lot of businesses fail because of lack of funds and a support structure but not here at MEEK.',
  ),
  Slide(
    imageUrl: 'assets/images/account.jpg',
    title: 'A gateway to business freedom',
    description: 'MEEK Investment Systems is here to help you get in touch with the investor you have been looking for. A lot of businesses fail because of lack of funds and a support structure but not here at MEEK.',
  ),
  Slide(
    imageUrl: 'assets/images/growth.jpg',
    title: 'Invest and Grow',
    description: 'MEEK Investment Systems is here to help you get in touch with the investor you have been looking for. A lot of businesses fail because of lack of funds and a support structure but not here at MEEK.',
  ),
];
