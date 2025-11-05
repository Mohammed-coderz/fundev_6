import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  late final TextEditingController _controller;
  late final DatabaseReference dbRef;
  late final Future<void> _init;

  Future<void> _firebaseInit() async {
    await Firebase.initializeApp();

    final database = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: "https://real-time-db-97109-default-rtdb.firebaseio.com",
    );

    dbRef = database.ref("items");
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _init = _firebaseInit();
  }

  Future<void> _addItem() async {
    if (_controller.text.trim().isEmpty) return;
    await dbRef.push().set({
      "name": _controller.text.trim(),
      "created_at": ServerValue.timestamp,
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snap.hasError) {
          return Scaffold(
            body: Center(child: Text("Init error:\n${snap.error}")),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("items"),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: "Enter item name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: _addItem,
                      child: const Text("Add"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder<DatabaseEvent>(
                  stream: dbRef.onValue,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final dataSnapshot = snapshot.data?.snapshot;
                    if (dataSnapshot == null || !dataSnapshot.exists) {
                      return const Center(child: Text("empty list"));
                    }

                    final raw = dataSnapshot.value;
                    // Firebase قد تعود Map<dynamic,dynamic>
                    final map = (raw is Map)
                        ? Map<String, dynamic>.from(
                            raw.map((k, v) => MapEntry(k.toString(), v)),
                          )
                        : <String, dynamic>{};

                    final entries = map.entries.toList();
                    return ListView.separated(
                      itemCount: entries.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (_, i) {
                        final id = entries[i].key;
                        final item = Map<String, dynamic>.from(
                          entries[i].value,
                        );
                        return ListTile(
                          title: Text(item["name"]?.toString() ?? ""),
                          subtitle: Text("ID: $id"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => dbRef.child(id).remove(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
