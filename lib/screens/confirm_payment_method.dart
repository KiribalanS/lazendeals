import 'package:flutter/material.dart';
import 'package:lazendeals/models/product_model.dart';
import 'package:lazendeals/models/user_model.dart';
import 'package:lazendeals/widgets/custom_appbar.dart';
import 'package:lazendeals/widgets/custom_drawer.dart';
import 'package:lazendeals/widgets/custom_payment_method_widget.dart';

class ConfirmPaymentMethod extends StatefulWidget {
  final ProductModel productModel;

  const ConfirmPaymentMethod({super.key, required this.productModel});

  @override
  State<ConfirmPaymentMethod> createState() => _ConfirmPaymentMethodState();
}

class _ConfirmPaymentMethodState extends State<ConfirmPaymentMethod> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(
        scaffoldKey: scaffoldKey,
      ),
      appBar: customAppBar(scaffoldKey),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                  height: mediaQuery.height * 0.18,
                  width: mediaQuery.width * 0.45,
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
                            widget.productModel.productName,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: SizedBox(
                      width: mediaQuery.width * .45,
                      child: Text.rich(
                        TextSpan(
                          text: 'Description  : ',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          children: <InlineSpan>[
                            TextSpan(
                              text: widget.productModel.description,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Quantity",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "250 gms",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Cost",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "Rs. 000 /-",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Deliver to ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              userModel.address ?? "No address specified",
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Pincode",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "938 455",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Payment details",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                CustomPaymentMethodWidget(content: "UPI"),
                CustomPaymentMethodWidget(content: "Net banking"),
                CustomPaymentMethodWidget(content: "Credit card / Debit card"),
                CustomPaymentMethodWidget(content: "Cash on delivery"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
