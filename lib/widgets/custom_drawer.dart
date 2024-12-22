import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> functionNames = [
      "Account Details",
      "Wishlist",
      "About us",
      "Privacy policy",
      "Customer care",
      "Help us",
    ];
    final mediaQuery = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: mediaQuery.height * .05),
          const Text(
            "MENU",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(height: mediaQuery.height * .02),
          Expanded(
            child: ListView.builder(
              itemCount: functionNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(functionNames[index]),
                  leading: const Icon(Icons.textsms),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {},
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Log Out",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
