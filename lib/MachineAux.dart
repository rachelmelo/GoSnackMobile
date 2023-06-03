import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:teste/productDetailAux.dart';

import 'package:http/http.dart' as http;

import 'constants.dart' as Constants;

class MachineAuxPage extends StatefulWidget {
  MachineAuxPage({super.key, required this.title});

  final String title;
  double temperature = 0;

  @override
  State<MachineAuxPage> createState() => _MachineAuxPageState();
}

class _MachineAuxPageState extends State<MachineAuxPage> {

  @override
  void initState() {
    super.initState();
    updateTemperature();
  }

  void updateTemperature() async {
    var response = await http.get(Uri.parse("${Constants.URL}/api/vending_machine/1/temperature"));
    var j = jsonDecode(response.body);
    var temperature = j['data'];

    setState(() {
      widget.temperature = temperature;
    });
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
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.3,
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
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 45),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'GoSnack',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Máquina bué fixe',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () {
                      //TODO
                    },
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromRGBO(249, 251, 231, 1),
                alignment: Alignment.center,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                const ProductDetailsAuxPage(
                                  title: 'product_detail',)),
                              );
                            },
                            style: ElevatedButton.styleFrom(
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
                                  'assets/images/KitKat.png',
                                  height: 60,
                                ),
                                const Text(
                                  '1 €',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
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
                                      'assets/images/Twix.png',
                                      height: 60,
                                    ),
                                  ),
                                  const Text(
                                    '1 €',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              //TODO
                            },
                            style: ElevatedButton.styleFrom(
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
                                  'assets/images/Mars.png',
                                  height: 60,
                                ),
                                const Text(
                                  '1,01 €',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              //TODO
                            },
                            style: ElevatedButton.styleFrom(
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
                                  'assets/images/Lays.png',
                                  height: 60,
                                ),
                                const Text(
                                  '1,20 €',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 100,
                          height: 105,
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
                            child: const Text(''),
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 100,
                          height: 105,
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
                            child: const Text(''),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 35),

                    Text(
                      'Temperatura atual: ${widget.temperature}ºC',
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

