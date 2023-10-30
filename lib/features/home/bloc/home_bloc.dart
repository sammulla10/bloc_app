import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/grocery_data.dart';
import 'package:bloc_app/features/home/models/home_prduct_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeIniialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClicked>(homeProductWishlistButtonClicked);
    on<HomeProductCartButtonClicked>(homeProductCartButtonClicked);
    on<HomeCartButtonClicked>(homeCartButtonClicked);
    on<HomeWishlistButtonClicked>(homeWishlistButtonClicked);
  }

  FutureOr<void> homeInitialEvent(
      HomeIniialEvent event, Emitter<HomeState> emit) async {
    emit(
      HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                id: e["id"],
                name: e["name"],
                desc: e['desc'],
                price: e['price'],
                imageurl: e['imageurl'],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeProductWishlistButtonClicked(
      HomeProductWishlistButtonClicked event, Emitter<HomeState> emit) {
    print("Product Wishlist Clicked");
  }

  FutureOr<void> homeProductCartButtonClicked(
      HomeProductCartButtonClicked event, Emitter<HomeState> emit) {
    print("Product Cart Clicked");
  }

  FutureOr<void> homeWishlistButtonClicked(
      HomeWishlistButtonClicked event, Emitter<HomeState> emit) {
    print("Navigate WishList Clicked");
    emit(HomeNavigateToWishlistPageState());
  }

  FutureOr<void> homeCartButtonClicked(
      HomeCartButtonClicked event, Emitter<HomeState> emit) {
    print("Navigate Cart Clicked");
    emit(HomeNavigateToCartPageState());
  }
}
