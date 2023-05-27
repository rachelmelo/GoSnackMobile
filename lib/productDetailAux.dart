import 'package:flutter/material.dart';

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
      home: const ProductDetailsAuxPage(title: 'Product Details Aux Page'),
    );
  }
}

class ProductDetailsAuxPage extends StatefulWidget {
  const ProductDetailsAuxPage({super.key, required this.title});

  final String title;

  @override
  State<ProductDetailsAuxPage> createState() => _ProductDetailsAuxPageState();
}

class _ProductDetailsAuxPageState extends State<ProductDetailsAuxPage> {

  int counter = 3;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if(counter > 0) {
        counter--;
      }
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
                        'Detalhes do produto',
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
            Expanded(
              child: Container(
                color: const Color.fromRGBO(249, 251, 231, 1),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/KitKat.jpg',
                      height: 180,
                    ),
                    const Text(
                      'KitKat',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      '1 €',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Info. nutricional (por 100g)',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Calorias   ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 1.0,
                            color: Colors.black,
                          ),
                          const Text(
                            '   521kcal',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Açúcar   ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 1.0,
                            color: Colors.black,
                          ),
                          const Text(
                            '   49,2g',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: FilledButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: const Color.fromRGBO(180, 240, 115, 1),
                                content: Container(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  height: MediaQuery.of(context).size.height * 0.30,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(180, 240, 115, 1),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        'Adicionar KitKat',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 60),
                                      Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Container(
                                           width: 50,
                                           height: 50,
                                           decoration: const BoxDecoration(
                                             color: Color.fromRGBO(225, 225, 225, 1),
                                             shape: BoxShape.circle,
                                           ),
                                           child: IconButton(
                                             icon: const Icon(Icons.remove),
                                             color: Colors.white,
                                             onPressed: decrementCounter,
                                           ),
                                         ),
                                         Container(
                                           padding: const EdgeInsets.symmetric(horizontal: 16),
                                           width: 90,
                                           height: 50,
                                           decoration: BoxDecoration(
                                             color: const Color.fromRGBO(225, 225, 225, 1),
                                             borderRadius: BorderRadius.circular(8),
                                           ),
                                           child: Center(
                                             child: Text(
                                               counter.toString(),
                                               style: const TextStyle(
                                                 color: Colors.white,
                                                 fontSize: 30,
                                               ),
                                             ),
                                           ),
                                         ),
                                         Container(
                                           width: 50,
                                           height: 50,
                                           decoration: const BoxDecoration(
                                             color: Color.fromRGBO(225, 225, 225, 1),
                                             shape: BoxShape.circle,
                                           ),
                                           child: IconButton(
                                             icon: const Icon(Icons.add),
                                             color: Colors.white,
                                             onPressed: decrementCounter,
                                           ),
                                         ),
                                       ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } ,
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Color.fromRGBO(180, 240, 115, 1)),
                          foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                        ),
                        child: const Text(
                          'Adicionar',
                          style: TextStyle(
                            fontSize: 30,
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