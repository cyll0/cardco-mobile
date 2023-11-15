import 'package:flutter/material.dart';
import 'package:cardco/widgets/left_drawer.dart';
import 'package:cardco/screens/itemlist_form.dart';
import 'package:cardco/screens/itemlist.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<CardItem> items = [
    CardItem("View Items", Icons.checklist, Colors.blue),
    CardItem("Add Items", Icons.add_shopping_cart, Colors.green),
    CardItem("Logout", Icons.logout, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CardCo'
          ),
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
    ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Card Collection',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((CardItem item) {
                  return ItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem {
  final String name;
  final IconData icon;
  final Color color;

  CardItem(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final CardItem item;

  const ItemCard(this.item, {Key? key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You clicked the ${item.name} button!")));
                if (item.name == 'Add Items') {
                  Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemFormPage(),
                ),
              );
                }
                if (item.name == 'View Items') {
                  Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemListPage(),
                ),
              );
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