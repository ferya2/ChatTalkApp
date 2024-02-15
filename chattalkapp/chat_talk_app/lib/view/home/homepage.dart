import 'package:chat_talk_app/main.dart';
import 'package:chat_talk_app/view/sidepage/chatscreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false;
  bool _isDarkMode = MyApp.isDarkMode;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: _isDarkMode ? Colors.black : const Color(0xFF075E54),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        textTheme: const TextTheme(
          headline6: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:
            _isDarkMode ? const Color(0xFF101F23) : Colors.grey.shade700,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:
                _isDarkMode ? Colors.black26 : const Color(0xFF075E54),
            title: _isSearching
                ? TextField(
                    // Implementasi TextField saat sedang mencari
                    style: TextStyle(
                        color: _isDarkMode ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                          color: _isDarkMode ? Colors.white : Colors.white),
                      icon: Icon(Icons.search,
                          color: _isDarkMode ? Colors.white : Colors.white),
                    ),
                  )
                : const Text(
                    'Chat Talk',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
            actions: [
              // Toggle _isSearching saat ikon pencarian di klik
              IconButton(
                icon: Icon(_isSearching ? Icons.cancel : Icons.search),
                onPressed: () {
                  setState(() {
                    _isSearching = !_isSearching;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  // Tambahkan logika menu lebih banyak di sini
                },
              ),
              IconButton(
                icon: Icon(
                  MyApp.isDarkMode
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                ),
                onPressed: () {
                  MyApp.isDarkMode = !MyApp.isDarkMode;
                  setState(() {
                    _isDarkMode = MyApp.isDarkMode;
                    print('Is Dark Mode: $_isDarkMode');
                  });
                },
              ),
            ],
            // Tambahkan properti
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Chats'),
                Tab(text: 'Calls'),
              ],
            ),
          ),
          backgroundColor: _isDarkMode ? const Color(0xFF101F23) : Colors.white,
          body: const TabBarView(
            children: [
              ChatsPage(),
              CallsPage(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Tambahkan logika untuk membuat pesan baru
            },
            child: const Icon(Icons.message),
            backgroundColor: const Color(0xFF25D366),
          ),
        ),
      ),
    );
  }
}

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0),
      children: const [
        ChatCard(
          contactName: 'John Doe',
          lastMessage: 'Hi, how are you?',
          time: '10:30 AM',
          unreadCount: 2,
        ),
        ChatCard(
          contactName: 'Jane Smith',
          lastMessage: 'Let\'s meet later.',
          time: 'Yesterday',
          unreadCount: 0,
        ),
        ChatCard(
          contactName: 'Michael Johnson',
          lastMessage: 'See you tomorrow.',
          time: 'Yesterday',
          unreadCount: 3,
        ),
        ChatCard(
          contactName: 'Emily Davis',
          lastMessage: 'I\'m on my way.',
          time: 'Yesterday',
          unreadCount: 7,
        ),
        ChatCard(
          contactName: 'David Wilson',
          lastMessage: 'Hey there!',
          time: 'Yesterday',
          unreadCount: 0,
        ),
        ChatCard(
          contactName: 'Sarah Thompson',
          lastMessage: 'Good morning!',
          time: 'Yesterday',
          unreadCount: 3,
        ),
        ChatCard(
          contactName: 'Olivia Anderson',
          lastMessage: 'Hey!',
          time: 'Yesterday',
          unreadCount: 0,
        ),
        ChatCard(
          contactName: 'Michael Johnson',
          lastMessage: 'See you tomorrow.',
          time: 'Yesterday',
          unreadCount: 3,
        ),
        ChatCard(
          contactName: 'Emily Davis',
          lastMessage: 'I\'m on my way.',
          time: 'Yesterday',
          unreadCount: 7,
        )
        // Tambahkan ChatCard lainnya di sini sesuai kebutuhan
      ],
    );
  }
}

class CallsPage extends StatelessWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callHistory.length,
      itemBuilder: (context, index) {
        final call = callHistory[index];
        return Builder(
          builder: (context) => CallHistoryItem(
            call: call,
            isDarkMode: MyApp.isDarkMode,
          ),
        );
      },
    );
  }
}

class CallHistoryItem extends StatelessWidget {
  final CallModel call;
  final bool isDarkMode;

  const CallHistoryItem(
      {Key? key, required this.call, required this.isDarkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Is Dark Mode: $isDarkMode'); // Pastikan mencetak nilai mode tema

    return ListTile(
      leading: CircleAvatar(
        child: call.avatarUrl != null
            ? Image.network(call.avatarUrl!)
            : Icon(Icons.phone),
      ),
      title: Text(
        call.contactName,
        style: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      subtitle: Text(
        call.time,
        style: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      trailing: Icon(
        call.isMissed ? Icons.call_missed : Icons.call_received,
        color: call.isMissed ? Colors.red : Colors.green,
      ),
      onTap: () {
        // Tambahkan logika ketika item panggilan diklik
        print('Call item tapped');
      },
    );
  }
}

class CallModel {
  final String contactName;
  final String time;
  final bool isMissed;
  final String? avatarUrl;

  CallModel({
    required this.contactName,
    required this.time,
    required this.isMissed,
    this.avatarUrl,
  });
}

// Contoh data riwayat panggilan
List<CallModel> callHistory = [
  CallModel(contactName: 'John Doe', time: '10:30 AM', isMissed: true),
  CallModel(contactName: 'Jane Smith', time: 'Yesterday', isMissed: false),
  // Tambahkan item panggilan lainnya di sini sesuai kebutuhan
];

class ChatCard extends StatelessWidget {
  final String contactName;
  final String lastMessage;
  final String time;
  final int unreadCount;

  const ChatCard({
    Key? key,
    required this.contactName,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cardColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[600] ?? Colors.grey
        : Colors.white;
    return Card(
      color: cardColor,
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(contactName),
        subtitle: Text(lastMessage),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(time),
            if (unreadCount > 0)
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  '$unreadCount new',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
        onTap: () {
          // Tambahkan logika ketika card diklik
          print('Card tapped');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ChatScreen()));
        },
      ),
    );
  }
}
