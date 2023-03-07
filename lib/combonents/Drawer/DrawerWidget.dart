import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer header with profile image
          // const Align(
          //   alignment: Alignment.centerRight,
          //   child: UserAccountsDrawerHeader(
          //     accountName: Text('محمد خالد'),
          //     accountEmail: Text('anything@example.com'),
          //     currentAccountPicture: CircleAvatar(
          //       backgroundImage: NetworkImage('https://www.w3schools.com/w3images/avatar2.png'),
          //     ),
          //     decoration: BoxDecoration(
          //       color: Colors.blue,
          //     ),
          //   ),
          // ),
          Expanded(
            child: ListView(
              children: [
                // Add your drawer items here
                ListTile(
                  trailing: const Icon(Icons.favorite),
                  title: Container(
                    alignment: Alignment.centerRight,
                    child: const Text('Item 1'),
                  ),
                  onTap: () {
                    // Handle item 1 tap
                  },
                ),
                ListTile(
                  trailing: const Icon(Icons.account_circle),
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
          // Drawer footer
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text('Drawer Footer'),
          ),
        ],
      ),
    );
  }
}
