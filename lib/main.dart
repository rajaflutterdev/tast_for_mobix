import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/products/bloc/product_bloc.dart';
import 'features/products/presentation/product_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getAllProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductView(),
      ),
    );
  }
}

List<BlocProvider<ProductBloc>> getAllProvider() {
  return [BlocProvider<ProductBloc>(create: (context) => ProductBloc())];
}
