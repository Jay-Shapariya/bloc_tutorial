import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/data/cart_item.dart';
import 'package:bloc_tutorial/data/grocery_data.dart';
import 'package:bloc_tutorial/data/wishlist_item.dart';
import 'package:bloc_tutorial/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlishButtonClickedEvent>(
        homeProductWishlishButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlishButtonNavigatEvent>(homeWishlishButtonNavigatEvent);
    on<HomeCartButtonNavigatEvent>(homeCartButtonNavigatEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageurl']))
            .toList()));
  }

  FutureOr<void> homeProductWishlishButtonClickedEvent(
      HomeProductWishlishButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Wishlist clicked");
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("cart clicked");
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlishButtonNavigatEvent(
      HomeWishlishButtonNavigatEvent event, Emitter<HomeState> emit) {
    print("wishlist navigate");
    emit(HomeNavegateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigatEvent(
      HomeCartButtonNavigatEvent event, Emitter<HomeState> emit) {
    print("cart navigate");
    emit(HomeNavegateToCartPageActionState());
  }
}
