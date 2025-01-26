import 'package:flutter/material.dart';
import 'package:lazendeals/models/dummy.dart';
import 'package:lazendeals/screens/product_details_screen.dart';
import 'package:lazendeals/screens/products_screen.dart';
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
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 32,
            color: Colors.black,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        title: const Text("Lazendeals"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 35,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              shrinkWrap: true,
              itemCount: dummyCategory.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductsScreen(),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/images/jwel.jpeg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(),
                      ),
                      height: mediaQuery.height * 0.25,
                      width: mediaQuery.width * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(0.8),
                        child: LayoutBuilder(builder: (context, constraints) {
                          return Container(
                            height: 37,
                            width: constraints.maxWidth,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Color.fromRGBO(251, 215, 187, 1),
                            ),
                            child: Center(
                              child: Text(
                                dummyCategory[index].category,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductDetailsScreen(),
                ),
              ),
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/sweet.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: const Radius.circular(15),
                  ),
                  border: Border.all(width: 2.5),
                ),
                height: mediaQuery.height * .2,
                width: mediaQuery.width * .85,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      height: 37,
                      width: constraints.maxWidth,
                      color: const Color.fromRGBO(251, 215, 187, 1),
                      child: const Center(
                        child: Text(
                          "Tamil Nadu\nSweets and snacks",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const CustomNavButton(),
          ],
        ),
      ),
    );
  }
}
