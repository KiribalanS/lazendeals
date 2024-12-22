import 'package:flutter/material.dart';
import 'package:lazendeals/widgets/custom_drawer.dart';
import 'package:lazendeals/widgets/custom_nav_button.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 25,
          ),
          const Center(
            child: Text(
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
              "Categories",
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 2),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    // height: mediaQuery.height * 0.04,
                    // width: mediaQuery.width * 0.38,
                    child: const Center(
                      child: Text("Products"),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            height: mediaQuery.height * 0.05,
            width: mediaQuery.width * 0.8,
            child: const Center(
              child: Text("Advertisments"),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const CustomNavButton(),
        ],
      ),
    );
  }
}
