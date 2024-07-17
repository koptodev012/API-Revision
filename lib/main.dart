import 'package:api_revision/features/home/login/cubit/login/login_cubit.dart';
import 'package:api_revision/features/home/posts/cubit/get_posts/get_posts_cubit.dart';
import 'package:api_revision/features/home/posts/presentation/posts_screen.dart';
import 'package:api_revision/features/home/products/cubit/product/get_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => GetProductCubit()),
        BlocProvider(create: (context) => GetPostsCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'API Revision',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const PostsScreen()),
    );
  }
}
