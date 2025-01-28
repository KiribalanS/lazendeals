import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lazendeals/models/dummy.dart';
import 'package:lazendeals/screens/product_details_screen.dart';
import 'package:lazendeals/screens/products_screen.dart';
import 'package:lazendeals/widgets/custom_drawer.dart';
import 'package:lazendeals/widgets/custom_nav_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 32,
            color: Colors.black,
          ),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
        title: const Text(
          "Lazendeals",
        ),
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
        scrollDirection: Axis.vertical,
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
            SizedBox(
              // decoration: BoxDecoration(
              //     // border: Border.all(),
              //     // borderRadius: BorderRadius.circular(15),

              //     ),
              height: mediaQuery.height * 0.22,
              width: mediaQuery.width * 0.85,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: const Image(
                    image: AssetImage("assets/images/ad.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                  mainAxisSpacing: 10,
                ),
                itemCount: dummyCategory.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductsScreen(),
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/ad.jpeg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border(
                              left: BorderSide(),
                              right: BorderSide(),
                              top: BorderSide()),
                        ),
                        height: mediaQuery.height * 0.22,
                        width: mediaQuery.width * 0.4,
                        child: LayoutBuilder(builder: (context, constraints) {
                          return Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              color: Color.fromRGBO(251, 215, 187, 1),
                            ),
                            constraints:
                                BoxConstraints(maxHeight: 49, minHeight: 37),
                            width: constraints.maxWidth,
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
                  );
                },
              ),
            ),
            const SizedBox(
              height: 25,
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
                    topRight: Radius.circular(15),
                  ),
                  border: Border.all(width: 2.5),
                ),
                height: mediaQuery.height * .2,
                width: mediaQuery.width * .85,
                child: LayoutBuilder(builder: (context, constraints) {
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
                }),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Recently Viewed",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: mediaQuery.height * 0.15,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ListView.builder(
                  itemCount: dummyCategory.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Card(
                        child: Image(
                          image: AssetImage(
                            "assets/images/jwel.jpeg",
                          ),
                          fit: BoxFit.cover,
                          width: 120,
                        ),
                      ),
                    );
                  },
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
