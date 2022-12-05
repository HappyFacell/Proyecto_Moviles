import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Detalles extends StatelessWidget {
  const Detalles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const Text("Tacos el camioncito",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        const Image(
            image: AssetImage("assets/images/camioncito.jpg"),
            width: 391,
            height: 300),
        const Text(
          "Fundados en Enero de 2011, contamos con más de 10 años de experiencia con deliciosos tacos preparados por el mismisimo Taquero de Sahuayo",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontStyle: FontStyle.italic),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          alignment: Alignment.center,
          child: QrImage(
            data: "https://drive.google.com/file/d/12WX_uuQNZoBiUKvEARFW4fvo3OHHTlOn/view?usp=sharing",
            size: 200,
          ),
        )
      ],
    ));
  }
}
