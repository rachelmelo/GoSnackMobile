import 'package:flutter/material.dart';

import 'favorites.dart';
import 'history.dart';

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
      home: const InitialPage(title: 'Initial Page'),
    );
  }
}


class InitialPage extends StatefulWidget {
  const InitialPage({super.key, required this.title});

  final String title;

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {

  final List<InitialPageItem> itemList = [
    InitialPageItem('KitKat', 'assets/images/KitKat.jpg', '-1€'),
    InitialPageItem('KitKat', 'assets/images/KitKat.jpg', '-1€'),
    InitialPageItem('KitKat', 'assets/images/KitKat.jpg', '-1€'),
  ];

  //methods

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
              width: MediaQuery.of(context).size.width,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 8),
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
                    'Saldo: 2€',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(249, 251, 231, 1),
              ),
              child: const Text(
                'Histórico de Compras',
                style: TextStyle(
                  backgroundColor: Color.fromRGBO(249, 251, 231, 1),
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              height: 1.0,
              color: Colors.black,
            ),
            Container(
              color: const Color.fromRGBO(249, 251, 231, 1),
              height: MediaQuery.of(context).size.height * 0.4,
              child: Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: itemList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemWidget(item: itemList[index]);
                      }
                  )
              ),
            ),
            Container(
              color: const Color.fromRGBO(249, 251, 231, 1),
              height: MediaQuery.of(context).size.height * 0.23,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FavoritesPage(title: 'Favorites',)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white60,
                        padding: const EdgeInsets.all(10),
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(
                        Icons.star_border_outlined,
                        color: Colors.black87,
                        size: 35,
                      ),
                  ),
                  const SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () {
                      //TODO mid button
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(180, 240, 115, 1),
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.qr_code_scanner_outlined,
                      color: Colors.black87,
                      size: 55,
                    ),
                  ),
                  const SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HistoryPage(title: 'History',)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white60,
                      padding: const EdgeInsets.all(10),
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.history,
                      color: Colors.black87,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

}

class InitialPageItem {
  final String productImage;
  final String productName;
  final String productPrice;

  InitialPageItem(this.productName, this.productImage, this.productPrice);
}

class ItemWidget extends StatelessWidget {
  final InitialPageItem item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 0.6,
          ),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            item.productImage,
            width: 70,
            height: 70,
          ),
          const SizedBox(width: 16),
          Text(
              item.productName,
              style: const TextStyle(
                fontSize: 18,
              ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              item.productPrice.toString(),
              style: const TextStyle(
                color: Color.fromRGBO(180, 0, 0, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

}