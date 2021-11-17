import 'package:flutter/material.dart';
import 'package:iot/model/component.dart';

class ItemCard extends StatelessWidget {
  Component? component;
  ItemCard({required this.component});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("this is item card")
      ),
    );
  }
}
