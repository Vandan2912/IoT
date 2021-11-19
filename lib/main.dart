import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot/screens/home.dart';
import 'package:iot/screens/search.dart';
import 'package:iot/screens/update.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:iot/services/database.dart';
import 'package:provider/provider.dart';

import 'controller/component_list_controller.dart';
import 'model/component.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          final componentListController = Get.put(ComponentController());
          return IoT();
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
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
    HomePage(),
    Searchpage(),
    CameraWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar:
      BottomNavigationBar(
        backgroundColor: Colors.grey.shade800,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
            activeIcon: Icon(Icons.home_rounded,color: Colors.white,)
          ),
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


class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Something went wrong..",
        textDirection: TextDirection.ltr,
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Loading...",
        textDirection: TextDirection.ltr,
      ),
    );
  }
}