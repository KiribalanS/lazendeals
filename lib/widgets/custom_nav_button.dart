import 'package:flutter/material.dart';
import 'package:lazendeals/screens/cart_screen.dart';
import 'package:lazendeals/screens/categories_screen.dart';
import 'package:lazendeals/screens/home_screen.dart';
import 'package:lazendeals/screens/orders_screen.dart';
import 'package:lazendeals/screens/user_home_screen.dart';
import 'package:lazendeals/widgets/hero_dialog_widget.dart';

class CustomNavButton extends StatelessWidget {
  const CustomNavButton({super.key});

  @override
  Widget build(BuildContext context) {
    // return getPopUp(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 11.0),
      child: SizedBox(
          height: MediaQuery.of(context).size.height * .08,
          child: Center(
            child: InkWell(
              child: const Hero(
                tag: 'hero-custom-tween',
                child: Image(
                  image: AssetImage("assets/images/logo.png"),
                  height: 85,
                  width: 85,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  HeroDialogRoute(
                    builder: (context) => Container(
                      child: const Center(
                        child: MyWidget(),
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 155,
          left: 35,
          right: 35,
          child: Hero(
            tag: 'hero-custom-tween',
            createRectTween: (Rect? begin, Rect? end) {
              return MaterialRectCenterArcTween(begin: begin, end: end);
            },
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(251, 215, 187, 1),
                  borderRadius: BorderRadius.circular(15)),
              height: MediaQuery.of(context).size.height * .05,
              width: MediaQuery.of(context).size.width * .75,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        },
                        icon: const Image(
                            height: 35,
                            width: 35,
                            image: AssetImage(
                                "assets/images/custom_nav/home.png"))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CategoriesScreen(),
                              ));
                        },
                        icon: const Image(
                            height: 35,
                            width: 35,
                            image: AssetImage(
                                "assets/images/custom_nav/category.png"))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UserHomeScreen(),
                              ));
                        },
                        icon: const Image(
                            height: 35,
                            width: 35,
                            image: AssetImage(
                                "assets/images/custom_nav/account.png"))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OrdersScreen(),
                              ));
                        },
                        icon: const Image(
                            height: 35,
                            width: 35,
                            image: AssetImage(
                                "assets/images/custom_nav/gift.png"))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartScreen(),
                              ));
                        },
                        icon: const Image(
                            height: 35,
                            width: 35,
                            image: AssetImage(
                                "assets/images/custom_nav/cart.png"))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
