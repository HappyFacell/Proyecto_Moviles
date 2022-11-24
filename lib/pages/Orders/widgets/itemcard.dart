import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final String img;
  final String description;
  const ItemCard(
      {super.key,
      this.img = "assets/images/taco_pastor.jpg",
      this.description = "Taco de pastor"});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ),
              const Text("5"),
              IconButton(
                onPressed: () {},
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
