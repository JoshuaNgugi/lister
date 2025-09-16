import 'package:flutter/material.dart';
import 'package:lister/add_item_screen.dart';
import 'package:lister/item_list_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lister',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: ItemListScreen.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        ItemListScreen.routeName: (context) => const ItemListScreen(),
        AddItemScreen.routeName: (context) => const AddItemScreen(),
      },
    );
  }
}
