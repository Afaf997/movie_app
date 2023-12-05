import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Column(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    // color: Colors.transparent,
                       color: Colors.black.withOpacity(0.8),
                  ),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Item 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    // Handle item 1 click
                  },
                ),
                ListTile(
                  title: Text(
                    'Item 2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    // Handle item 2 click
                  },
                ),
                ListTile(
                  title: Text(
                    'Item 3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    // Handle item 3 click
                  },
                ),
                ListTile(
                  title: Text(
                    'Item 4',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    // Handle item 4 click
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}