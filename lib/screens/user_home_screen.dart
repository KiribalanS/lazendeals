import 'package:flutter/material.dart';
import 'package:lazendeals/models/dummy.dart';
import 'package:lazendeals/widgets/custom_drawer.dart';
import 'package:lazendeals/widgets/custom_nav_button.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
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
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 25,
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.home,
                          size: 30,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Center(
                          child: Text(
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                            "Helloo, Name!",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 35,
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
                const Text(
                  "Your orders",
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
                                "assets/images/ad.jpeg",
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
                const Text(
                  "Wish list",
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
                                "assets/images/sweet.png",
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
              ],
            ),
          ),
          const Positioned(
            bottom: 35,
            left: 10,
            right: 10,
            child: CustomNavButton(),
          ),
        ],
      ),
    );
  }
}
