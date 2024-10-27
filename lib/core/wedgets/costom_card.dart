import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String duree;
  final String image;
  final Function()? onTap;
  const CustomCard(
      {super.key,
      required this.title,
      required this.description,
      required this.duree,
      required this.image,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  'assets/image/$image', // Replace with actual image asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title: $title', // Replace with actual article title
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Description: $description', // Replace with actual article title
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.date_range, color: Colors.red),
                      Text('Duree: $duree'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}