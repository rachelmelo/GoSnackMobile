import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:teste/machine_index/empty_slot_widget.dart';
import 'package:teste/machine_index/out_of_stock_slot_widget.dart';
import 'package:teste/machine_index/slot_widget.dart';
import 'package:teste/productDetails.dart';
import 'package:http/http.dart' as http;
import 'constants.dart' as Constants;


class MachinePage extends StatefulWidget {
  const MachinePage({super.key, required this.title, required this.machineId, this.isAdmin = false});

  final String title;
  final bool isAdmin;
  final int machineId;

  @override
  State<MachinePage> createState() => _MachinePageState();
}

class _MachinePageState extends State<MachinePage> {

  List<Widget> slots = [];
  num temperature = 0.0;
  var slotData;

  @override
  void initState() {
    super.initState();
    updateSlots();
    updateTemperature();
  }

  void updateSlots() async {
    var response = await http.get(Uri.parse('${Constants.URL}/api/vending_machine/${widget.machineId}/slots'));
    var j = jsonDecode(response.body);
    var data = j['data'];

    setState(() {
      slotData = data;
    });
  }

  void updateTemperature() async {
    var request = await http.get(Uri.parse('${Constants.URL}/api/vending_machine/${widget.machineId}/temperature'));
    var j = jsonDecode(request.body);

    var newTemperature = j['data'];

    setState(() {
      temperature = newTemperature;
    });
  }

  List<Widget> generateSlots() {

    List<Widget> rows = [];
    List<Widget> rowChildren = [];

    for (var i = 0; i < 7 ; i++) {
      if (i % 3 == 0) {
        rows.add(
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: rowChildren
          ),
        );
        rows.add(
            const SizedBox(height: 25)
        );
        rowChildren = [];
      }

      if (i == 9) {
        break;
      }

      if (i < slotData.length) {
        var slot = slotData[i];

        if (slot['product_quantity'] > 0) {
          rowChildren.add(
              SlotWidget(
                  onPressed: () {
                    if (widget.isAdmin) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            ProductDetailsPage(
                              machineId: slot['vending_machine_id'],
                              productImagePath: slot['product_image'],
                              productName: slot['product_name'],
                              slotNumber: slot['slot_number'],
                            )),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            ProductDetailsPage(
                              machineId: slot['vending_machine_id'],
                              productImagePath: slot['product_image'],
                              productName: slot['product_name'],
                              slotNumber: slot['slot_number'],
                            )),
                      );
                    }
                  },
                  slotId: slot['slot_number'],
                  imagePath: slot['product_image'],
                  productName: slot['product_name'],
                  productPrice: slot['product_price']

              )
          );
        } else {
          rowChildren.add(
              OutOfStockSlotWidget(
                  slotId: slot['slot_number'],
                  imagePath: slot['product_image'],
                  productName: slot['product_name'],
                  productPrice: slot['product_price']
              )
          );
        }
      } else {
        rowChildren.add(
            const EmptySlotWidget()
        );
      }

      if (i % 3 <= 1) {
        rowChildren.add(const SizedBox(width: 20));
      }
    }

    if (widget.isAdmin) {
      rows.addAll([
        const SizedBox(height: 35),

        Text(
          'Temperatura atual: $temperature ºC',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 30),

        SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.35,
          child: FilledButton(
            onPressed: () {
              //TODO
            },
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(
                  Colors.red),
              foregroundColor: MaterialStatePropertyAll<Color>(
                  Colors.white),
            ),
            child: const Text(
              'Desligar',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ]);
    }

    return rows;
    /**/
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(180, 240, 115, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  const SizedBox(width: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'GoSnack',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromRGBO(249, 251, 231, 1),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: generateSlots(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

