import 'package:flutter/material.dart';

class Kard extends StatelessWidget {
  final List<Color> kolor;
  final String txt;
  final String destination;
  final String imageUrl;
  const Kard({
    Key? key,
    required this.txt,
    required this.kolor,
    required this.destination,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(17),
          child: Container(
            height: 165,
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              gradient: LinearGradient(colors: kolor),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  destination,
                  (Route<dynamic> route) => false,
                );
              },
              splashColor: Theme.of(context).splashColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 55, horizontal: 20),
                child: Text(
                  txt,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -16.5,
          right: -22,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
