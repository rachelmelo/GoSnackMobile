
import 'package:flutter/material.dart';

class EmptySlotWidget extends StatelessWidget {
  const EmptySlotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 105,
      child: TextButton(
        onPressed: null,
        style: TextButton.styleFrom (
          backgroundColor: const Color.fromRGBO(210, 210, 211, 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.all(10),
        ),
        child: const Text(''),
      ),
    );
  }

}