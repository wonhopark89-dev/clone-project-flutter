import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.healing), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ""),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      // appBar: AppBar(title: Text("TEST1")),
      body: Container(
        color: Colors.amberAccent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: btmNavItems,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black87,
        currentIndex: _selectedIndex,
        onTap: _onBtmItemClick,
      ),
    ));
  }

  void _onBtmItemClick(int index) {
    print(index);
    setState(() {
      _selectedIndex = index; // homepage 상태값 바뀐것을 알려줌
    });
  }
}
