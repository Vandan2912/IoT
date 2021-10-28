import 'package:flutter/material.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  _SearchpageState createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.search_rounded,
      size: 150,
      color: Colors.white,
    );
  }
}
