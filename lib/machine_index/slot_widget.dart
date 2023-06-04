
import 'package:flutter/material.dart';

import '../productDetails.dart';

class SlotWidget extends StatefulWidget {

  Function onPressed;
  int slotId;
  String imagePath;
  String productName;
  num productPrice;

  SlotWidget({
    super.key,
    required this.onPressed,
    required this.slotId,
    required this.imagePath,
    required this.productName,
    required this.productPrice
  });

  @override
  State<StatefulWidget> createState() => SlotWidgetState();
}

class SlotWidgetState extends State<SlotWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        onPressed: () => widget.onPressed(),
        style: ElevatedButton.styleFrom (
          backgroundColor: Colors.white60,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.all(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.imagePath,
              height: 60,
            ),
            Text(
              '${widget.productPrice}€',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

}