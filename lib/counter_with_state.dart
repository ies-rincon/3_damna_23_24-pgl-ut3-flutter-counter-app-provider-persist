import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_counter_app_provider_persist/counter_provider.dart';
import 'package:flutter_counter_app_provider_persist/tabs/tab_page_1.dart';
import 'package:flutter_counter_app_provider_persist/tabs/tab_page_2.dart';
import 'package:flutter_counter_app_provider_persist/tabs/tab_page_3.dart';

class CounterWithState extends StatefulWidget {
  const CounterWithState({super.key});

  @override
  State<CounterWithState> createState() => _CounterWithStateState();
}

class _CounterWithStateState extends State<CounterWithState> {
  int _selectedIndex = 0;
  static const List<MaterialColor> colors = [
    Colors.lightBlue,
    Colors.green,
    Colors.purple
  ];
  List<Widget> get _widgetOptions => [
        Page1(color: colors[_selectedIndex]),
        Page2(color: colors[_selectedIndex]),
        Page3(color: colors[_selectedIndex]),
      ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();
    return Scaffold(
      appBar: AppBar(
          title: Text('Counter App ${counterProvider.counter}'),
          actions: [
            counterProvider.counter > 0
                ? IconButton(
                    icon: const Icon(Icons.refresh_rounded),
                    onPressed: counterProvider.resetCounter,
                  )
                : Container(),
          ]),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Page 1',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_transit),
            label: 'Page 2',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bike),
            label: 'Page 3',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
