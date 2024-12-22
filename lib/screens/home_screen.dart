import 'package:flutter/material.dart';
import 'package:lazendeals/screens/product_details_screen.dart';
import 'package:lazendeals/widgets/custom_drawer.dart';
import 'package:lazendeals/widgets/custom_nav_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SearchBar(
                elevation: WidgetStatePropertyAll(5),
                side: WidgetStatePropertyAll(
                  BorderSide(color: Colors.black, width: 2),
                ),
                leading: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                hintText: "Search",
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              height: mediaQuery.height * 0.22,
              width: mediaQuery.width * 0.85,
              child: const Center(
                child: Text("Advertisments"),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductDetailsScreen(),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    height: mediaQuery.height * 0.22,
                    width: mediaQuery.width * 0.4,
                    child: const Center(
                      child: Text("Products"),
                    ),
                  ),
                ),
                SizedBox(
                  width: mediaQuery.width * .05,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  height: mediaQuery.height * 0.22,
                  width: mediaQuery.width * 0.4,
                  child: const Center(
                    child: Text("Products"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              padding: const EdgeInsets.all(8),
              height: mediaQuery.height * 0.22,
              width: mediaQuery.width * 0.85,
              child: LayoutBuilder(
                builder: (ctx, constraints) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Recently Viewed"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          height: MediaQuery.of(ctx).size.height * 0.16,
                          width: constraints.minWidth * 0.2,
                          child: const Center(
                            child: Text("Product"),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(ctx).size.width * .02,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          height: MediaQuery.of(ctx).size.height * 0.16,
                          width: constraints.minWidth * 0.75,
                          child: const Center(
                            child: Text("Product Details"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: const BorderSide(width: 2.5),
              ),
              child: SizedBox(
                height: mediaQuery.height * .2,
                width: mediaQuery.width * .85,
                child: const Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    "Tamil Nadu\nSweets and snacks",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const CustomNavButton(),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
