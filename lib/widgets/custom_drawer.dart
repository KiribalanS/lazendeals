import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazendeals/auth/auth_bloc/auth_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> functionNames = [
      "Account Details",
      "Wishlist",
      "About Us",
      "Privacy Policy",
      "Customer care",
      "Help Us",
    ];
    Map<String, IconData> functionIcons = {
      "Account Details": Icons.account_circle_sharp,
      "Wishlist": Icons.favorite,
      "About Us": Icons.info,
      "Privacy Policy": Icons.privacy_tip,
      "Customer care": Icons.phone,
      "Help Us": Icons.question_mark_outlined,
    };
    final mediaQuery = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: const Color.fromRGBO(252, 238, 197, 1),
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
                  leading: Icon(functionIcons[functionNames[index]]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                context.read<AuthBloc>().add(AuthLogOutEvent());
              },
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
