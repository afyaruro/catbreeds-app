import 'package:catbreeds/Application/Stores/CatBreed/CatBreedStore.dart';
import 'package:catbreeds/Domain/Entity/CatBreedEntity.dart';
import 'package:catbreeds/Presentation/Screens/Home/Widgets/HomeHeader.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final storeCatBreed = GetIt.instance<CatBreedStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              HomeHeader(),

              Center(
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (var element in storeCatBreed.catBreeds)
                      CardCatBreed(
                        catBreed: element,
                        image: element.image != null ? "Tiene imagen" : "null",
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardCatBreed extends StatelessWidget {
  const CardCatBreed({super.key, required this.catBreed, required this.image});

  final CatBreedEntity catBreed;
  final String image;

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
              child:
                  catBreed.image != null
                      ? Image.network(catBreed.image!)
                      : Image.asset("lib/assets/cat.jpg"),
            ),

            Text(image),

            // Image.network(catBreed.image!),
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
              onPressed: () {},
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
