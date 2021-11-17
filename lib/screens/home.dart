import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot/controller/component_list_controller.dart';
import 'package:iot/model/component.dart';
import 'package:iot/ui%20components/itemcard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';


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
      body: Obx(() =>
        ListView.builder(
          itemCount: componentListController.componentList.value.length,
          itemBuilder: (context, index) =>
              ItemCard(component: componentListController.componentList[index]),
        ),
      )
    );
  }
}
