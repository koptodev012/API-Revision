import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_revision/features/home/products/cubit/product/get_product_cubit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Get All Products',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocBuilder<GetProductCubit, GetProductState>(
          builder: (context, state) {
            if (state is GetProductInitial) {
              return Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Colors.white,
                  size: 50,
                ),
              );
            } else if (state is GetProductFailedState) {
              return Center(child: Text(state.failedMessage));
            } else if (state is GetProductSuccessState) {
              return ListView.builder(
                  itemCount: state.product.length,
                  itemBuilder: (context, index) {
                    var perticularProduct = state.product[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Card(
                        color: Color(0xffFFF4E5),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(perticularProduct["id"].toString()),
                              Text(perticularProduct["title"]),
                              Text(perticularProduct["description"]),
                              Text(perticularProduct["category"]),
                              Text(perticularProduct["price"].toString()),
                              Text(perticularProduct["rating"].toString()),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }

            return const SizedBox();
          },
        ));
  }
}
