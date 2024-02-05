import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CardPostPage extends StatefulWidget {
  const CardPostPage({super.key});

  @override
  State<CardPostPage> createState() => _CardPostPageState();
}

class _CardPostPageState extends State<CardPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text('data'),
),
    );
  }
}
