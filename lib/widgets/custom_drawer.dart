import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lazendeals/auth/auth_bloc/auth_bloc.dart';
import 'package:lazendeals/auth/screens/login_screen.dart';
import 'package:lazendeals/wishlist/screens/wishlist_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.scaffoldKey,
  });
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    List<CustomMenu> menus = [
      CustomMenu(
        name: "Account Details",
        icon: Icons.account_circle_sharp,
        callBack: () {},
      ),
      CustomMenu(
        name: "Wishlist",
        icon: Icons.favorite,
        callBack: () {
          scaffoldKey.currentState?.closeDrawer();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WishlistScreen(),
              ));
        },
      ),
      CustomMenu(
        name: "About Us",
        icon: Icons.info,
        callBack: () {},
      ),
      CustomMenu(
        name: "Privacy Policy",
        icon: Icons.privacy_tip,
        callBack: () {},
      ),
      CustomMenu(
        name: "Customer care",
        icon: Icons.phone,
        callBack: () {},
      ),
      CustomMenu(
        name: "Help Us",
        icon: Icons.question_mark_outlined,
        callBack: () {},
      ),
    ];

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
              itemCount: menus.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(menus[index].name),
                  leading: Icon(menus[index].icon),
                  onTap: menus[index].callBack,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                context.read<AuthBloc>().add(AuthLogOutEvent(context: context));

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false,
                );
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

class CustomMenu {
  String name;
  IconData icon;
  void Function() callBack;
  CustomMenu({
    required this.name,
    required this.icon,
    required this.callBack,
  });
}
