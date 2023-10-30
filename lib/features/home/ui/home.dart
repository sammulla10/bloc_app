import 'package:bloc_app/features/cart/ui/cart.dart';
import 'package:bloc_app/features/home/bloc/home_bloc.dart';
import 'package:bloc_app/features/wishlist/ui/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeIniialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageState) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => WishlistPage(),
            ),
          );
        } else if (state is HomeNavigateToCartPageState) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CartPage(),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            return Scaffold(
              appBar: AppBar(
                title: Text('Home Page'),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeWishlistButtonClicked(),
                      );
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeCartButtonClicked(),
                      );
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(child: Text("Error")),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
