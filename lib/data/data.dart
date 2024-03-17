import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List <Map<String, dynamic>> transactionData = [
  {
    'icon': const FaIcon(
      FontAwesomeIcons.burger,
      color: Colors.white,  
    ),
    'color': Colors.blueAccent,
    'name': 'Nandos',
    'totalAmount': '-P225.00' , 
    'date': 'Today', 
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.tv),
    'color': Colors.redAccent,
    'name': 'Netflix',
    'totalAmount': '-P60.00',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.gamepad),
    'color': Colors.purpleAccent,
    'name': 'Gaming',
    'totalAmount': '-P200.00',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.spotify),
    'color': Colors.greenAccent,
    'name': 'Spotify',
    'totalAmount': '-P20.00',
    'date': 'Today',
  }
];