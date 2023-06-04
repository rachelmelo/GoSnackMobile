


import 'package:flutter/material.dart';

import '../productDetails.dart';

class OutOfStockSlotWidget extends StatefulWidget {

  int slotId;
  String imagePath;
  String productName;
  num productPrice;

  OutOfStockSlotWidget({
    super.key,
    required this.slotId,
    required this.imagePath,
    required this.productName,
    required this.productPrice
  });

  @override
  State<StatefulWidget> createState() => OutOfStockSlotWidgetState();
}

class OutOfStockSlotWidgetState extends State<OutOfStockSlotWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        child: TextButton(
          onPressed: null,
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromRGBO(
                210, 210, 211, 0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.all(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: 0.4,
                child: Image.asset(
                  widget.imagePath,
                  height: 60,
                ),
              ),
              Text(
                '${widget.productPrice} €',
                style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontSize: 20,
                ),
              ),
            ],
          ),
        )
    );
  }

}