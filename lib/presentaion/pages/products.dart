

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:taskelevate/domain/entity/productentity.dart';

import 'package:taskelevate/presentaion/cubit/products_cubit.dart';
import 'package:taskelevate/presentaion/widgets/myicons.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsCubit>().getmyData();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    //double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductSucess) {
            return _ourProducts(screenWidth,state.productEntity);
          } else {
            return _loder();
          }
        },
      ),
    );
  }

  Center _loder() => Center(child: CircularProgressIndicator());

  Padding _ourProducts(double mywidth,List<ProductEntity>products ) {
    return Padding(
      padding: EdgeInsetsGeometry.all(8),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: mywidth / 500,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blueGrey, width: 2),
                ),

                width: double.infinity,

                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.network(
                          products[index].image,
                          //width: double.infinity,
                          fit: BoxFit.cover,
                          height: 120,
                        ),
                      ),

                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index].title,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              products[index].description,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  " ${products[index].price.toString()} EGP",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                //SizedBox(width: 10),
                                Text(
                                  " ${products[index].price.toString()} EGP",
                                  style: TextStyle(
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Review ${products[index].rate}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.star, color: Colors.yellow),
                                Spacer(),
                                myicons(
                                  icon: Icons.add,
                                  bacgroundColor: Colors.blueGrey,
                                  iconColor: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: myicons(
                  icon: Icons.favorite,
                  bacgroundColor: Colors.white,
                  iconColor: Colors.blueGrey,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
