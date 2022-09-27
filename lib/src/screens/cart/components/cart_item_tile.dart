import 'package:flutter/material.dart';
import 'package:greengrocer/src/helpers/utils.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';

class CartItemTile extends StatelessWidget {
  final CartItemModel cartItem;

  const CartItemTile({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();

    return Expanded(
      child: Card(
        elevation: 1,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Product Image
              Expanded(child: Image.asset(cartItem.item.imgUrl)),
              // Product Name
              Text(cartItem.item.itemName),
              // Product Unitary Price
              Text(utils.priceToCurrency(cartItem.item.price)),
              // Quantity Selector
            ],
          ),
        ),
      ),
    );
  }
}
