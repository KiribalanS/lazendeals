import 'package:flutter/material.dart';
import 'package:lazendeals/models/dummy.dart';
import 'package:lazendeals/widgets/advertisement_widget.dart';
import 'package:lazendeals/widgets/custom_drawer.dart';
import 'package:lazendeals/widgets/custom_nav_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              const AdvertisementWidget(),
              const SizedBox(
                height: 25,
              ),
              Container(
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
                height: mediaQuery.height * 0.21,
                width: mediaQuery.width * 0.85,
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
                          dummyProduct[0].productName,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.1,
                width: mediaQuery.width * 0.85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // width: mediaQuery.width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (quantity < 2) return;
                                  quantity -= 1;
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                              ),
                            ),
                            Text(
                              "Quantity : $quantity",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity += 1;
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Cost",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Rs. 000 /-",
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  child: Text.rich(
                    TextSpan(
                        text: 'Description  : ',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        children: <InlineSpan>[
                          TextSpan(
                            text: dummyProduct[0].description,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          )
                        ]),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(251, 215, 187, 1)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductDetailsScreen(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: 250,
                  child: Text(
                    "Add to Cart",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(251, 215, 187, 1)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductDetailsScreen(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: 250,
                  child: Text(
                    "Buy now",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text("Manufacturer Details : XXXXXX"),
              const Text("Delivery Details : In two days"),
              const Text("Reviews (Others)"),
              const SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                height: mediaQuery.height * 0.32,
                width: mediaQuery.width * 0.85,
                child: const Center(
                  child: Text("Message box"),
                ),
              ),
              const CustomNavButton(),
              SizedBox(
                height: mediaQuery.height * .05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
