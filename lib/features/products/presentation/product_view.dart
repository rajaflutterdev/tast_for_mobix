import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tast_for_mobix/core/constants/constant_Values.dart';
import 'package:tast_for_mobix/features/products/bloc/product_bloc.dart';

import 'package:http/http.dart' as http;

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductBloc>().add(GetProductEvent());
  }
  
  final TextEditingController searchCon=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("MWS", style: TextStyle(color: Colors.white)),
        leading: Icon(Icons.menu, color: Colors.white),
        actions: [
          Icon(Icons.search, color: Colors.white)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                height: 50,

                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: TextField(
                  controller: searchCon,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed: (){
                      FocusScope.of(context).unfocus();
                      searchCon.clear();
                    }, icon: Icon(Icons.clear)),
                    border: InputBorder.none,
                    hint: Text("Search Here",style: TextStyle(fontSize: 18),),
                    contentPadding: EdgeInsets.only(left: 10,top: 15)
                  ),
                  onChanged: (value){
                    context.read<ProductBloc>().add(
                        SearchProductEvent(searchText:
                    value));
                  },
                ),
              ),
              SizedBox(height: 10,),
              
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductInitial) {
                    return CircularProgressIndicator();
                  }
                  if (state is ProductLoaded) {

                    if(state.data.isEmpty){
                      return Center(child: Text(notFoundMessage),);
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final productData = state.data[index];

                        return Card(
                          elevation: 3,
                          child: SizedBox(
                            height: 400,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                /// image Widget
                                Container(
                                  height: 200,
                                  width: double.infinity,

                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(productData.image),
                                    ),
                                  ),
                                ),

                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 8,
                                    children: [
                                      /// Title Text Widget
                                      Text(
                                        productData.title,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),

                                      /// subTittle
                                      Text(
                                        productData.category,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),

                                      /// price
                                      Text(
                                        "\$ ${productData.price.toString()} /",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),

                                      ///arting
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Text(
                                              productData.description,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              "More",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15),
                      itemCount: state.data.length,
                    );
                  }

                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
