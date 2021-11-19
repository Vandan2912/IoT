import 'package:flutter/material.dart';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iot/model/component.dart';
import 'package:iot/services/database.dart';
import 'package:iot/ui%20components/text_input_box.dart';

class Updatepage extends StatefulWidget {
  const Updatepage({Key? key}) : super(key: key);

  @override
  _UpdatepageState createState() => _UpdatepageState();
}

class _UpdatepageState extends State<Updatepage> {
  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.update_rounded,
      size: 150,
      color: Colors.white,
    );
  }
}

class CameraWidget extends StatefulWidget {
  const CameraWidget({Key? key}) : super(key: key);

  @override
  State createState() {
    // TODO: implement createState
    return CameraWidgetState();
  }
}

class CameraWidgetState extends State<CameraWidget> {
  PickedFile? imageFile = null;
  String componentName = "";
  int totalPcs = 0;
  int available = 0;

  @override
  Widget build(BuildContext context) {
    DatabaseService dbs = DatabaseService();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Item"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          MyInputBox(
              onChanged: (val) {
                componentName = val;
              },
              label: "Component",
              hintText: "Enter component name"),
          SizedBox(
            height: 30,
          ),
          MyInputBox(
              onChanged: (val) {
                totalPcs = int.parse(val);
              },
              label: "Total Pcs",
              hintText: "Enter number of total pcs"),
          SizedBox(
            height: 30,
          ),
          MyInputBox(
              onChanged: (val) {
                available = int.parse(val);
              },
              label: "Available Pcs",
              hintText: "Enter number of available pcs"),
          Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    child: (imageFile == null)
                        ? Text("Choose Image")
                        : Image.file(
                      File(imageFile!.path), height: 100, width: 100,),
                  ),
                  MaterialButton(
                    textColor: Colors.white,
                    color: Colors.pink,
                    onPressed: () {
                      _showChoiceDialog(context);
                    },
                    child: Text("Select Image"),
                  ),
                  ElevatedButton(onPressed: () {
                    //TODO: add image to firebase storage and its link to firestore
                    Future<String> imgurl = dbs.uploadImage(imageFile!);
                    imgurl.then((img) {
                      Component component = Component(total: totalPcs,
                          title: componentName,
                          img: img,
                          available: available);
                      dbs.addItemToDataBase(component);
                    });
                  }, child: Text("upload Component"))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    Navigator.pop(context);
  }
}
