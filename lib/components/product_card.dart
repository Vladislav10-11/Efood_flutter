import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: Colors.grey.shade700,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product['image'],
            width: 200.0,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    product['description'],
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  // const SizedBox(height: 8.0),
                  // if (_allergicIngredientsCount > 0)
                  //   Container(
                  //     padding: const EdgeInsets.all(8.0),
                  //     color: Colors.yellow.shade100,
                  //     child: Text(
                  //       'Warning! This product contains $_allergicIngredientsCount ingredients that you are allergic to.',
                  //       style: TextStyle(
                  //         color: Colors.red.shade700,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  const SizedBox(height: 8.0),
                  // Row(
                  //   children: [
                  //     for (var ingredient in _ingredients)
                  //       Container(
                  //         margin: const EdgeInsets.only(right: 8.0),
                  //         child: Chip(
                  //           backgroundColor: ingredient['allergic']
                  //               ? Colors.red
                  //               : Colors.green,
                  //           label: Text(
                  //             ingredient['name'],
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // List<Map<String, dynamic>> get _ingredients {
  //   return List<Map<String, dynamic>>.from(product['ingredients']).map((ing) {
  //     return {
  //       'name': ing,
  //       'allergic': false, // replace with check for allergic ingredient
  //     };
  //   }).toList();
  // }

  // int get _allergicIngredientsCount {
  //   return _ingredients.where((ing) => ing['allergic']).length;
  // }
}
