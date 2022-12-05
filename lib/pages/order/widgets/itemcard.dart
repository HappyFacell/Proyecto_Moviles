import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final String img;
  final String description;
  final num precio;
  const ItemCard(
      {super.key,
      this.img = "assets/images/taco_pastor.jpg",
      this.description = "Taco de pastor",
      this.precio = 10});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: AssetImage(widget.img),
          ),
          Text(
            widget.description,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'Precio: \$${widget.precio}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (quantity > 0) {
                      quantity--;
                    }
                  });
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ),
              Text('$quantity'),
              IconButton(
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
                icon: const Icon(
                  Icons.keyboard_arrow_up,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
