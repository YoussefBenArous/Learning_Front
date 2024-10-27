import 'package:flutter/material.dart';

class CostomCardCour extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final Function()? onTap;
  const CostomCardCour(
      {super.key,
      required this.title,
      required this.description,
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
        elevation: 0,
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
                  Text.rich(
                    TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: "Title:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "$title",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: "Description:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "$description",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ]),
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
