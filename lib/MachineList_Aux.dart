import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:teste/machine.dart';

import 'package:http/http.dart' as http;
import 'package:teste/machine_list/machine_list_widget.dart';
import 'constants.dart' as Constants;

class MachineList_AuxPage extends StatefulWidget {
  const MachineList_AuxPage({super.key, required this.title});

  final String title;
  final bool isAdmin = true;

  @override
  State<MachineList_AuxPage> createState() => _MachineList_AuxPageState();
}

class _MachineList_AuxPageState extends State<MachineList_AuxPage> {

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
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 30),
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
                        'Listagem de Máquinas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
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
            MachineListWidget(machineList: machineList, isAdmin: true,)
          ],
        ),
      ),
    );
  }
}

