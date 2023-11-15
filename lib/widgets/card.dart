import 'package:flutter/material.dart';
import 'package:cardco/screens/itemlist_form.dart';
import 'package:cardco/screens/itemlist.dart';

class CardItem {
  final String name;
  final IconData icon;

  CardItem(this.name, this.icon);
}

class ItemCard extends StatelessWidget {
  final CardItem item;

  const ItemCard(this.item, {Key? key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You pressed the ${item.name} button!")));

          if (item.name == "Add Items") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemFormPage(),
                ),
              );
          }
          if (item.name == "View Items") {
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
          builder: (context) => const ItemListPage(),
          ));
        }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}