
import 'package:bloc_tutorial/features/home/models/home_product_data_model.dart';
import 'package:bloc_tutorial/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistTileWidget(
      {super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(productDataModel.imageUrl))),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          productDataModel.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(productDataModel.description),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${productDataModel.price.toString()}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      // homeBloc.add(HomeProductWishlishButtonClickedEvent(
                      //     clickedProduct: productDataModel));
                      wishlistBloc.add(WishlistRemoveFromWishlistEvent(productDataModel: productDataModel));
                    },
                    icon: const Icon(Icons.favorite)),
                IconButton(
                    onPressed: () {
                      
                    },
                    icon: const Icon(Icons.shopping_cart_outlined))
              ],
            )
          ],
        ),
      ]),
    );
  }
}
