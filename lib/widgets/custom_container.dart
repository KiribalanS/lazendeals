import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(251, 215, 187, 1),
              Color.fromRGBO(252, 238, 197, 1),
              // Colors.pink.shade200,
              // Colors.pink.shade400,
            ],
          ),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
