part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeIniialEvent extends HomeEvent{}

class HomeProductWishlistButtonClicked extends HomeEvent{}

class HomeProductCartButtonClicked extends HomeEvent{}

class HomeCartButtonClicked extends HomeEvent{}

class HomeWishlistButtonClicked extends HomeEvent{}
