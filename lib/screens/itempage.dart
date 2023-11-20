import 'package:flutter/material.dart';
import 'package:cardco/models/item.dart';

class ItemDetailPage extends StatelessWidget {
  final Item item;

  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${item.fields.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Amount: ${item.fields.amount}'),
            SizedBox(height: 8),
            Text('Description: ${item.fields.description}'),
            SizedBox(height: 8),
            Text('Discount: ${item.fields.isDiscount}'),
            SizedBox(height: 8),
            Text('Added by: user [${item.fields.user}]'),
            SizedBox(height: 8),
            Text('Date Added: ${item.fields.dateAdded}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to item list page
              },
              child: Text('Back to Items'),
            ),
          ],
        ),
      ),
    );
  }
}