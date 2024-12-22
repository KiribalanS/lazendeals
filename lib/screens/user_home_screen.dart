import 'package:flutter/material.dart';
import 'package:lazendeals/widgets/custom_drawer.dart';
import 'package:lazendeals/widgets/custom_nav_button.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text(
          "Lazendeals",
          style: TextStyle(
            fontSize: 37,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 35,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 25,
            ),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_balance,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Center(
                    child: Text(
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                      "Helloo, Name!",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 35,
            ),
            const Text("Recently viewed"),
            Container(
              height: mediaQuery.height * .2,
              width: mediaQuery.width * .7,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: const Center(child: Text('Product')),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text("Your orders"),
            Container(
              height: mediaQuery.height * .2,
              width: mediaQuery.width * .7,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: const Center(child: Text('Product')),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text("Wish list"),
            Container(
              height: mediaQuery.height * .2,
              width: mediaQuery.width * .7,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: const Center(child: Text('Product')),
            ),
            const CustomNavButton(),
          ],
        ),
      ),
    );
  }
}
