import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../counter_provider.dart';

class Page2 extends StatelessWidget {
  final Color color;
  const Page2({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();
    int clickCounter = counterProvider.counter;
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        'Page 2: \nNº Clicks --> $clickCounter',
        style: const TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.w400),
      ),
    );
  }
}
