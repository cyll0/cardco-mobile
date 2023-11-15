import 'package:flutter/material.dart';
import 'package:cardco/widgets/left_drawer.dart';
import 'package:cardco/screens/itemlist_form.dart';



class ItemListPage extends StatefulWidget {
    const ItemListPage({super.key});

    @override
    State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
                title: const Center(
                child: Text(
                    'Card List Page',
                ),
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
              "Currently Saved Cards:",
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
            children: itemObjects.map((ItemObject item) {
              return ViewItem(item);
            }).toList(),
          ),
        ],
      ),
    ),
  ),
        );
}
}

class ViewItem extends StatelessWidget {
  final ItemObject item;

  const ViewItem(this.item, {Key? key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.all(7)),
                Text(
                  "Name: ${item.name}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  "Amount: ${item.amount.toString()}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  "Description: ${item.description}",
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