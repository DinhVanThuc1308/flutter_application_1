import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/ToDoList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required Color backgroundColor}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manager Works'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Text(
                'Manager Works',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ToDoList()));
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Text(
            'Quản lý thư mục của bạn',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 160),
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // căn giữa
                  children: [
                    // Tạo button với icon
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ToDoList()));
                      },
                      icon: const Icon(Icons.shopping_bag),
                      label: const Text('Công việc'),
                      // chỉnh size elvatedbutton
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 150),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.book),
                      label: const Text('Học'),
                      // chỉnh size elvatedbutton
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 150),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.audiotrack),
                      label: const Text('Giải trí'),
                      // chỉnh size elvatedbutton
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 150),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.difference),
                      label: const Text('Khác '),
                      // chỉnh size elvatedbutton
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 150),
                      ),
                    ),
                  ],
                ),
              ])
            ]),
          ),
        ],
      ),
    );
  }
}
