import 'package:flutter/material.dart';

class Teacher extends StatelessWidget {
  final String name;
  final String profession;
  final Color color;
  final double rating;
  final String image;
  const Teacher({
    Key? key,
    required this.name,
    required this.profession,
    required this.color,
    required this.rating,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(
          width: width * 0.38,
          height: height * 0.2,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
            width: width * 0.38,
            height: height * 0.17,
          ),
        ),
        SizedBox(
          width: width * 0.38,
          height: height * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image(
                  image: AssetImage("assets/images/$image.jpg"),
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 18, 83, 135),
                    ),
                  ),
                  Text(
                    profession,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 18, 83, 135).withOpacity(.7),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 237, 73),
                      size: 17,
                    ),
                    Text(
                      "$rating",
                      style: TextStyle(
                        color:const Color.fromARGB(255, 18, 83, 135).withOpacity(.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
