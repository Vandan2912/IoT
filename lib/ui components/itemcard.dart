import 'package:flutter/material.dart';
import 'package:iot/model/component.dart';

class ItemCard extends StatelessWidget {
  Component? component;

  ItemCard({required this.component});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      height: 175,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white54,
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                offset: Offset(5, 5),
                color: Colors.black.withOpacity(0.1))
          ]),
      child: Column(
        children: [
          Row(
            children: [
              // CachedNetworkImage(
              //   imageUrl: "$",
              //   placeholder: (context, url) => new CircularProgressIndicator(),
              //   errorWidget: (context, url, error) => new Icon(Icons.error),
              // ),
              Image.network('${component!.img}',height: 100, width: 100,),
              const SizedBox(
                width: 15,
              ),
              Text(
                "${component!.title}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          Expanded(child: Container()),
          Row(
            children: [
              Text(
                "${component!.available}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(child: Container()),
              Text(
                "${component!.total}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'Available',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Expanded(child: Container()),
              const Text(
                'Total Pcs',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
