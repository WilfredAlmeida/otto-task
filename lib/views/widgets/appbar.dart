import 'package:flutter/material.dart';

var GalleryAppbar = AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
  flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.blue.withOpacity(0.8),
          Colors.purple.withOpacity(0.8),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
  ),
  leading: IconButton(
    icon: const Icon(Icons.menu),
    onPressed: () {},
  ),
  title: const Text(
    'Otto Gallery',
    style: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.2,
    ),
  ),
  centerTitle: true,
  actions: [
    IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {},
    ),
    IconButton(
      icon: const Icon(Icons.bookmark),
      onPressed: () {},
    ),
  ],
);
