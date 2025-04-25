import 'package:catbreeds/Application/Stores/CatBreed/CatBreedStore.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final CatBreedStore store;
  const HomeHeader({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Find the perfect cat breed for you!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    onChanged: store.setSearchTerm,
                    decoration: const InputDecoration(
                      hintText: 'Search cat breed',
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.search, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
