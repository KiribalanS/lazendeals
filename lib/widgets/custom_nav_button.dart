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
    // return getPopUp(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: QuickPopUpMenu(
          pressType: PressType.singleClick,
          menuItems: [
            PopMenuItemModel(
                title: 'home',
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
                title: 'categories',
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
          child: const Image(
            image: AssetImage("assets/images/logo.png"),
            height: 85,
            width: 85,
          )),
      //Better to use custom pop up menu
    );
  }
}

Widget getPopUp(BuildContext context) {
  List<PopMenuItemModel> menuItems = [
    PopMenuItemModel(
        title: 'home',
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
        title: 'categories',
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
  ];
  CustomPopupMenuController _controller = CustomPopupMenuController();
  return CustomPopupMenu(
    menuBuilder: () {
      return MyWidget(
        controller: _controller,
        list: menuItems,
      );
    },
    pressType: PressType.singleClick,
    child: const Image(
      image: AssetImage("assets/images/logo.png"),
      height: 85,
      width: 85,
    ),
  );
}

class MyWidget extends StatelessWidget {
  MyWidget({
    super.key,
    required this.list,
    required this.controller,
  });
  List<PopMenuItemModel> list;
  CustomPopupMenuController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return IconButton(
            onPressed: () {
              controller.hideMenu();
              print("Works");
            },
            icon: Icon(Icons.abc));
      },
      itemCount: list.length,
    );
  }
}
