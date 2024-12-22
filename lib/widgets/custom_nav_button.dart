import 'package:custom_pop_up_menu_fork/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:lazendeals/screens/cart_screen.dart';
import 'package:lazendeals/screens/categories_screen.dart';
import 'package:lazendeals/screens/orders_screen.dart';
import 'package:lazendeals/screens/user_home_screen.dart';

class CustomNavButton extends StatelessWidget {
  const CustomNavButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: QuickPopUpMenu(
        pressType: PressType.singleClick,
        menuItems: [
          PopMenuItemModel(
              title: '',
              icon: Icons.home,
              callback: (data) {
                debugPrint("data: " + data);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserHomeScreen(),
                  ),
                );
              }),
          PopMenuItemModel(
              title: '',
              icon: Icons.category,
              callback: (data) {
                debugPrint("data: " + data);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoriesScreen(),
                  ),
                );
              }),
          PopMenuItemModel(
              title: '',
              icon: Icons.person,
              callback: (data) {
                debugPrint("data: " + data);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserHomeScreen(),
                  ),
                );
              }),
          PopMenuItemModel(
              title: '',
              icon: Icons.book,
              callback: (data) {
                debugPrint("data: " + data);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrdersScreen(),
                  ),
                );
              }),
          PopMenuItemModel(
              title: '',
              icon: Icons.shopping_cart,
              callback: (data) {
                debugPrint("data: " + data);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              }),
        ],
        useGridView: true,
        dataObj: "",
        child: const Icon(
          Icons.image,
          size: 35,
        ),
      ),
      //Better to use custom pop up menu
    );
  }
}
