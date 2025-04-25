import 'package:catbreeds/Domain/Entity/CatBreedEntity.dart';
import 'package:flutter/material.dart';

class CardCatBreed extends StatelessWidget {
  const CardCatBreed({super.key, required this.catBreed});

  final CatBreedEntity catBreed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(81, 153, 153, 153),
            offset: const Offset(0, 0),
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                aspectRatio: 1,
                child:
                    catBreed.image != null
                        ? Image.network(
                          catBreed.image!,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                              ),
                            );
                          },
                        )
                        : Image.asset(
                          "lib/assets/default.jpg",
                          fit: BoxFit.cover,
                        ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
              child: Text(
                catBreed.name,
                style: const TextStyle(fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                catBreed.origin,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/detail',
                  arguments: {
                    'cat': catBreed,
                  }, 
                );
              },
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(Colors.blue),
              ),
              child: Text("View"),
            ),
          ],
        ),
      ),
    );
  }
}
