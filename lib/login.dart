import 'package:flutter/material.dart';
import 'package:teste/MachineList_Aux.dart';
import 'package:teste/initial.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(title: 'Login Page'),
    );
  }
}


class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool passwordVisible = false;

  String username = "";

  //metodos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(180, 240, 115, 1),
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('GoSnack',
                  style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      fontFamily: '',
                  color: Colors.white),
                ),
                const SizedBox(height: 10),
                Image.asset('assets/images/GoSnackLogo.png',
                  width: 170),
                const SizedBox(height: 30),
                 TextField(
                   onChanged: (u) {
                     username = u;
                   },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                    filled: true,
                    fillColor: Colors.white60,
                    hintText: 'Username',
                    hintStyle: const TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                    filled: true,
                    fillColor: Colors.white60,
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.black54),
                      suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisible ? Icons.visibility_off : Icons.visibility,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          }
                      )
                  ),
                  obscureText: !passwordVisible,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: FilledButton(
                    onPressed: () {
                      print(username);
                      if (username == "user") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InitialPage(title: 'initial',)),
                        );

                      } else if (username == "admin") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MachineList_AuxPage(title: 'machine_list',)),
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Invalid username"),
                                content: const Text("The only two valid usernames are 'user' and 'admin'"),
                                actions: [
                                  TextButton(
                                      child: const Text("Ok"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                  )
                                ],
                              );
                            }
                        );
                      }
                    } ,
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                      foregroundColor: MaterialStatePropertyAll<Color>(Colors.green),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
    );
  }
}
