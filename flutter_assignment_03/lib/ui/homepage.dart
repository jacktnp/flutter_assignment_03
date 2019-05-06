import 'package:flutter/material.dart';
import '../firestore.dart';
import './todo.dart';
import './done.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      Todo(),
      Done()
    ];

    final List topBar = <Widget>[
      IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/addlist');
        },
      ),
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          FirestoreUtils.deleteAllCompleted();
        },
      )
    ];

    return new Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        actions: <Widget>[topBar[_index]],
      ),
      body: Center(child: _children[_index]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('Task')),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_all), title: Text("Completed"))
        ],
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
