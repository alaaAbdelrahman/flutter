import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print("Button Pressed");
            },
            icon: Icon(Icons.person),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              icon: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 100,
            ),
            count >= 0
                ? Text(
                    "$count",
                    style: const TextStyle(fontSize: 24),
                  )
                : const Text(
                    "Not Be Negative",
                    style: TextStyle(fontSize: 24),
                  ),
            const SizedBox(
              height: 100,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  count < 0 ? count = 0 : count--;
                });
              },
              icon: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
