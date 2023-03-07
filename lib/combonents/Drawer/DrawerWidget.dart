import 'package:flutter/material.dart';

import '../../pages/Home_Page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  trailing: const Icon(Icons.account_circle),
                  title: Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      },
                      child: const Text(
                        '  الحساب ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    // Handle item 1 tap
                  },
                ),
                ListTile(
                  trailing: const Icon(Icons.favorite),
                  title: Container(
                    alignment: Alignment.centerRight,
                    child: const Text('Item 2'),
                  ),
                  onTap: () {
                    // Handle item 2 tap
                  },
                ),
                ListTile(
                  trailing: const Icon(Icons.edit),
                  title: Container(
                    alignment: Alignment.centerRight,
                    child: const Text('Item 3'),
                  ),
                  onTap: () {
                    // Handle item 3 tap
                  },
                ),
                // Add more items as needed
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text('Drawer Footer'),
          ),
        ],
      ),
    );
  }
}
