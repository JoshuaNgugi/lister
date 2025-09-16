import 'package:flutter/material.dart';
import 'package:lister/add_item_screen.dart';
import 'package:lister/model/item.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  static const String routeName = '/item-list';

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final List<Item> items = [];

  void _addItem(Item item) {
    setState(() {
      items.add(item);
    });
  }

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  Future<void> _navigateToAddItemScreen() async {
    final newItem = await Navigator.pushNamed(context, AddItemScreen.routeName);
    if (newItem != null && newItem is Item) {
      _addItem(newItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Test App'),
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.5),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
              ),
              onPressed: _navigateToAddItemScreen,
              icon: const Icon(Icons.add, size: 18),
              label: const Text('New'),
            ),
          ),
        ],
      ),
      body: items.isEmpty
          ? const Card(
              child: Center(
                child: Text(
                  'No items added. Please press "New" to add an item.',
                ),
              ),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.description),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteItem(index),
                  ),
                );
              },
            ),
    );
  }
}
