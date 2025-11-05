import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  // ====== config ======
  static const String roomId = "test"; // تقدر تغيّرها لغرف متعددة
  final String myId = "mohammed"; // مع Auth استخدم uid
  final String myName = "mohammed sameer"; // أو خذه من بروفايلك

  // ====== firebase ======
  late final DatabaseReference messagesRef;
  late final Future<void> _init;

  // ====== UI ======
  final TextEditingController _msgCtrl = TextEditingController();
  final ScrollController _scroll = ScrollController();

  Future<void> _firebaseInit() async {
    await Firebase.initializeApp();

    final database = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: "https://real-time-db-97109-default-rtdb.firebaseio.com",
    );

    messagesRef = database.ref("chats/$roomId/messages");
  }

  @override
  void initState() {
    super.initState();
    _init = _firebaseInit();
  }

  Future<void> _send() async {
    final text = _msgCtrl.text.trim();
    if (text.isEmpty) return;
    try {
      await messagesRef.push().set({
        "text": text,
        "senderId": myId,
        "senderName": myName,
        "created_at": ServerValue.timestamp,
      });
      _msgCtrl.clear();
      // سكرول بسيط لآخر رسالة بعد الإرسال
      await Future.delayed(const Duration(milliseconds: 100));
      if (_scroll.hasClients) {
        _scroll.animateTo(
          _scroll.position.maxScrollExtent + 80,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Send error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, s) {
        if (s.connectionState != ConnectionState.done) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (s.hasError) {
          return Scaffold(body: Center(child: Text("Init error: ${s.error}")));
        }

        // نعمل query مرتّب بحسب الوقت وآخر 200 رسالة
        final query = messagesRef.orderByChild("created_at").limitToLast(200);

        return Scaffold(
          appBar: AppBar(
            title: const Text("Realtime Chat"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: StreamBuilder<DatabaseEvent>(
                  stream: query.onValue,
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final ds = snap.data?.snapshot;
                    if (ds == null || !ds.exists || ds.value == null) {
                      return const Center(child: Text("No messages yet"));
                    }

                    // تحويل الـ Map إلى List مرتبة
                    final raw = (ds.value as Map).map(
                          (k, v) => MapEntry(k.toString(), Map<String, dynamic>.from(v)),
                    );

                    final msgs = raw.entries.toList()
                      ..sort((a, b) {
                        final ta = (a.value["created_at"] ?? 0) as int;
                        final tb = (b.value["created_at"] ?? 0) as int;
                        return ta.compareTo(tb);
                      });

                    // نعمل سكرول تلقائي بسيط عند وصول بيانات
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (_scroll.hasClients) {
                        _scroll.jumpTo(_scroll.position.maxScrollExtent);
                      }
                    });

                    return ListView.builder(
                      controller: _scroll,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      itemCount: msgs.length,
                      itemBuilder: (_, i) {
                        final m = msgs[i].value;
                        final bool mine = m["senderId"] == myId;

                        return Align(
                          alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            constraints: const BoxConstraints(maxWidth: 320),
                            decoration: BoxDecoration(
                              color: mine
                                  ? Theme.of(context).colorScheme.primary.withOpacity(0.12)
                                  : Theme.of(context).colorScheme.surfaceVariant,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(14),
                                topRight: const Radius.circular(14),
                                bottomLeft: Radius.circular(mine ? 14 : 4),
                                bottomRight: Radius.circular(mine ? 4 : 14),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment:
                              mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                              children: [
                                if (!mine)
                                  Text(
                                    m["senderName"]?.toString() ?? "User",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                Text(m["text"]?.toString() ?? ""),
                                if (m["created_at"] != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text(
                                      _fmtTime(m["created_at"]),
                                      style: Theme.of(context).textTheme.labelSmall,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              // حقل الإدخال
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _msgCtrl,
                          textInputAction: TextInputAction.send,
                          onSubmitted: (_) => _send(),
                          decoration: InputDecoration(
                            hintText: "Type a message...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: _send,
                        icon: const Icon(Icons.send),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _fmtTime(dynamic ts) {
    try {
      final millis = (ts as num).toInt();
      final d = DateTime.fromMillisecondsSinceEpoch(millis);
      final hh = d.hour.toString().padLeft(2, '0');
      final mm = d.minute.toString().padLeft(2, '0');
      return "$hh:$mm";
    } catch (_) {
      return "";
    }
  }
}