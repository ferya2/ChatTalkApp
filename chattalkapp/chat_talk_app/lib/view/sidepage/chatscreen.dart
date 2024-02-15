import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/png/spiderman.png'),
              radius: 20.0,
            ),
            SizedBox(width: 12.0),
            Text(
              'John Doe',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // Tambahkan logika panggilan di sini
            },
          ),
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              // Tambahkan logika panggilan video di sini
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Tambahkan logika menu lebih banyak di sini
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'search',
                child: Text('Search'),
              ),
              const PopupMenuItem(
                value: 'info',
                child: Text('Contact Info'),
              ),
              const PopupMenuItem(
                value: 'block',
                child: Text('Block Contact'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const MessageWidget(
                  isSent: false,
                  message: 'Hi, how are you?',
                  time: '10:30 AM',
                ),
                const MessageWidget(
                  isSent: true,
                  message: 'I\'m good. How about you?',
                  time: '10:32 AM',
                ),
                const MessageWidget(
                  isSent: false,
                  message: 'Let\'s meet later.',
                  time: '10:35 AM',
                ),
                // Tambahkan pesan lain sesuai kebutuhan
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: const Border(
                top: BorderSide(color: Colors.grey),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.photo, color: Colors.blue),
                  onPressed: () {
                    // Tambahkan logika untuk mengirim foto
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    // Tambahkan logika pengiriman pesan di sini
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final bool isSent;
  final String message;
  final String time;

  const MessageWidget({
    Key? key,
    required this.isSent,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          color: isSent ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment:
              isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isSent ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              time,
              style: TextStyle(
                fontSize: 12.0,
                color: isSent ? Colors.white54 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
