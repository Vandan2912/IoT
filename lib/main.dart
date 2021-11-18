import 'package:flutter/material.dart';
import 'package:iot/home.dart';
import 'package:iot/search.dart';
import 'package:iot/update.dart';


void main() {
  runApp(const IoT());
}

class IoT extends StatelessWidget {
  const IoT({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        brightness: Brightness.light,
          iconTheme: IconThemeData()
        /* light theme settings */
      ),
      themeMode: ThemeMode.light,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex=0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  static const List<Widget> _pages = <Widget>[
    Searchpage(),
    Updatepage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IoT Inventory"),
      ),

      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar:
      BottomNavigationBar(
        backgroundColor: Colors.grey.shade800,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'search',
              activeIcon: Icon(Icons.search_rounded,color: Colors.white,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update_rounded),
            label: 'Update',
              activeIcon: Icon(Icons.update_rounded,color: Colors.white,)
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),

    );
  }
}
