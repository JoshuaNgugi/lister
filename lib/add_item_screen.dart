import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  static const String routeName = '/add-item';

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Item')),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: '*Indicates required fields',
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Item Title*'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter a title for the item',
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Description'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Add description',
                    ),
                    maxLines: 5,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Add Item'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
