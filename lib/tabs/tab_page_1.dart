import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../counter_provider.dart';

class Page1 extends StatefulWidget {
  final Color color;
  const Page1({super.key, required this.color});
  get getColor => color;

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();
    int clickCounter = counterProvider.counter;
    String labelClick = 'Clicks';
    if (clickCounter == 1) {
      labelClick = 'Click';
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
              labelClick,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      backgroundColor: widget.color,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButtons(
            icon: Icons.refresh_outlined,
            onPressed: counterProvider.resetCounter,
          ),
          const SizedBox(height: 10),
          CustomButtons(
            icon: Icons.plus_one,
            onPressed: counterProvider.setPlusOne,
          ),
          const SizedBox(height: 10),
          CustomButtons(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: clickCounter == 0
                ? null
                : () {
                    counterProvider.setMinusOne();
                  },
          ),
        ],
      ),
    );
  }
}

class CustomButtons extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButtons({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // shape: const StadiumBorder(),
      enableFeedback: true,
      elevation: 10,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
