import 'dart:convert';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List info=[];
  _initData(){
    DefaultAssetBundle.of(context).loadString("json/home_info.json").then((value){
      info = json.decode(value);
    });
  }

  @override
  void initstate(){
    super.initState();
    _initData();
  }

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
          Expanded(
              child: ListView.builder(
              itemCount: 17,
              itemBuilder: (_, i){
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
                        offset: Offset(5,5),
                        color: Colors.black.withOpacity(0.1)
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            info[i]['img'],
                            height: 60,
                            width: 60,
                          ),
                          const SizedBox(width: 15,),
                          Text(info[i]['title'],
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
                          Text(info[i]['available'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(info[i]['total'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Available',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Expanded(child: Container()),
                          const Text('Total Pcs',
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
          )
        ],
      ),
    );
  }
}
