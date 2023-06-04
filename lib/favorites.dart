import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:teste/machine_list/machine_list_widget.dart';

import 'initial.dart';

import 'package:http/http.dart' as http;
import 'constants.dart' as Constants;

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key, required this.title});

  final String title;

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  var machineList = [];

  @override
  void initState() {
    super.initState();
    updateMachines();
  }

  void updateMachines() async {
    var response = await http.get(Uri.parse('${Constants.URL}/api/vending_machine'));
    var j = jsonDecode(response.body);

    var machines = j['data'];

    setState(() {
      machineList = machines;
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
              height: MediaQuery.of(context).size.height * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const InitialPage()),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  const SizedBox(width: 25),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'GoSnack',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Máquinas favoritas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            MachineListWidget(machineList: machineList),
          ],
        ),
      ),
    );
  }
}

