

import 'package:flutter/material.dart';
import 'package:teste/machine.dart';

class MachineListWidget extends StatefulWidget {

  var machineList = [];
  bool isAdmin;

  MachineListWidget({super.key, required this.machineList, this.isAdmin = false});

  @override
  State<MachineListWidget> createState() => MachineListWidgetState();
}

class MachineListWidgetState extends State<MachineListWidget> {

  List<Widget> generateMachineList(BuildContext context) {
    List<Widget> machineListWidgets = [];
    for (var machine in widget.machineList) {
      machineListWidgets.addAll([
        const SizedBox(height: 30),

        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.15,
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        machine['name'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MachinePage(title: machine['name'], machineId: machine['id'], isAdmin: widget.isAdmin,)),
                        );
                      },
                      child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 35
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
      ]);
    }

    return machineListWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color.fromRGBO(249, 251, 231, 1),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: generateMachineList(context),
        ),
      ),
    );
  }

}