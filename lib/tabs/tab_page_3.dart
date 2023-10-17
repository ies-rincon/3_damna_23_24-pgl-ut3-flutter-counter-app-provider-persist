import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_counter_app_provider_persist/counter_provider.dart';

class Page3 extends StatelessWidget {
  final Color color;
  const Page3({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();
    return Container(
        color: color,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Page 3',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w400),
            ),
            ElevatedButton(
                onPressed: counterProvider.setPlusOne, child: const Text('+1'))
          ],
        ));
  }
}
