import 'package:flutter/material.dart';


class Detalles extends StatelessWidget {
  const Detalles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resumen de Orden"),
        backgroundColor: const Color.fromARGB(255, 164, 59, 27),
      ),
      body: 
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text("Costo total:"),
                Text("150"),
                Image(image: AssetImage("assets/images/agua_horchata.png")),
                
              ],
            ),
          ),
    );
  }
}
