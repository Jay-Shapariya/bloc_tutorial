part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProductWishlishButtonClickedEvent extends HomeEvent{
  final ProductDataModel clickedProduct;

  HomeProductWishlishButtonClickedEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickedEvent extends HomeEvent{
  final ProductDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});

}
class HomeWishlishButtonNavigatEvent extends HomeEvent{

}

class HomeCartButtonNavigatEvent extends HomeEvent{

}

class HomeProductItemWishlistedActionState extends HomeActionState{}
class HomeProductItemCartedActionState extends HomeActionState{}