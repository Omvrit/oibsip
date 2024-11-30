import 'package:farmpure/data/wishlist.dart';
import 'package:farmpure/models/product.dart';
import 'package:flutter/material.dart';

import '../features/product_details_page/ui/product_details_page.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.product);
       Navigator.push(
         context,
         MaterialPageRoute(
           builder: (context) => ProductDetailsPage(product: widget.product),
         ),
       );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        elevation: 5,
        shadowColor: Colors.grey.shade200,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: widget.product.image.isNotEmpty
                          ? NetworkImage(widget.product.image)
                          : const AssetImage('assets/placeholder.png')
                      as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          print(wishlist.length);
                          setState(() {
                            if(wishlist.contains(widget.product)){
                              wishlist.remove(widget.product);
                            }else{
                              wishlist.add(widget.product);
                            }
                          });
                        },
                        icon:wishlist.contains(widget.product) ?const Icon(Icons.favorite,color: Colors.teal,): const Icon(Icons.favorite_outline),
                        color: Colors.white,
                        iconSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "₹${widget.product.price}",
                                  style: Theme.of(context).textTheme.titleSmall),
                              TextSpan(
                                  text: "/${widget.product.unit}",
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.teal,
                          ),
                          iconSize: 24,
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
    );
  }
}