import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot/controller/component_list_controller.dart';
import 'package:iot/model/component.dart';
import 'package:iot/ui%20components/itemcard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({Key? key}) : super(key: key);

  @override
  _Homepage1State createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  List info = [];

  // _initData() {}
  //
  // @override
  // void initstate() {
  //   super.initState();
  //   _initData();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.fromLTRB(15, 20, 20, 20),
                width: 150.0,
                height: 100.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "200",
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                    Text(
                      "Product In",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.fromLTRB(15, 20, 20, 20),
                width: 150.0,
                height: 100.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "170",
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                    Text(
                      "Product Out",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Available Product List",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
              itemCount: 17,
              itemBuilder: (_, i) {
                return Container(
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
                          Image.asset(
                            info[i]['img'],
                            height: 60,
                            width: 60,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            info[i]['title'],
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
                            info[i]['available'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            info[i]['total'],
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
                );
              })
        ],
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage();
  @override
  Widget build(BuildContext context) {
    // List<Component> componentlist = Provider.of<List<Component>>(context) ;
    final componentListController = Get.put(ComponentController());
    print(componentListController.componentList.value);
    return Scaffold(
      appBar: AppBar(
        title: Text("Components"),
      ),
      body: ListView.builder(
          itemCount: componentListController.componentList.value.length,
          itemBuilder: (context, index) => ItemCard(component: componentListController.componentList[index]),),
    );
  }
}
