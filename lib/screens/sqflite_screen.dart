import 'package:flutter/material.dart';
import '../core/utils/db_helper.dart';

class SqfliteScreen extends StatefulWidget {
  const SqfliteScreen({super.key});

  @override
  State<SqfliteScreen> createState() => _SqfliteScreenState();
}

class _SqfliteScreenState extends State<SqfliteScreen> {
  bool isLoading = true;
  List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  Future<void> load() async {
    try {
      final rows = await DbHelper.dbHelper.getAllItems();
      setState(() {
        _items = rows;
        isLoading = false;
      });
      print("items fetch");
      print(_items);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sqflite"), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final data = {'name': "item ${_items.length + 1}", 'price': 100.0};
          try {
            await DbHelper.dbHelper.insertItem(data);
            load();
          } catch (e) {
            print(e);
          }
        },
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : _items.isEmpty
          ? Center(child: Text("No Data"))
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "item name : ${item['name']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "item price : ${item['price']}",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
