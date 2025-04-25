import 'package:flutter/material.dart';
import 'package:catbreeds/Domain/Entity/CatBreedEntity.dart';

class CatBreedDetailView extends StatelessWidget {
  final CatBreedEntity catBreed;

  const CatBreedDetailView({Key? key, required this.catBreed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Hero(
            tag: catBreed.id,
            child:
                catBreed.image != null
                    ? Image.network(
                      catBreed.image!,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset( 
                          "lib/assets/default.jpg",
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    )
                    : Image.asset(
                      "lib/assets/default.jpg",
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
          ),
          // Overlay degradado para oscurecer la imagen y resaltar el contenido
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),
          // Barra superior con botón de regresar y título
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      catBreed.name,
                      style: textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Panel deslizable que contiene el detalle del gato
          DraggableScrollableSheet(
            initialChildSize: 0.45,
            minChildSize: 0.45,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Indicador para arrastrar el panel
                      Center(
                        child: Container(
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Sección "About"
                      Text(
                        "About",
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        catBreed.description,
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Fila de información básica: Origin y Life Span
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildDetailInfo(context, "Origin", catBreed.origin),
                          _buildDetailInfo(
                            context,
                            "Life Span",
                            catBreed.lifeSpan,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Temperament
                      Text(
                        "Temperament",
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        catBreed.temperament.isNotEmpty
                            ? catBreed.temperament.join(', ')
                            : "Unknown",
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Estadísticas en forma de Grid (dos filas de tres columnas)
                      GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: [
                          _buildStatItem(
                            context,
                            "Adaptability",
                            catBreed.adaptability.toString(),
                          ),
                          _buildStatItem(
                            context,
                            "Affection",
                            catBreed.affectionLevel.toString(),
                          ),
                          _buildStatItem(
                            context,
                            "Energy",
                            catBreed.energyLevel.toString(),
                          ),
                          _buildStatItem(
                            context,
                            "Child Friendly",
                            catBreed.childFriendly.toString(),
                          ),
                          _buildStatItem(
                            context,
                            "Dog Friendly",
                            catBreed.dogFriendly.toString(),
                          ),
                          _buildStatItem(
                            context,
                            "Intelligence",
                            catBreed.intelligence.toString(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// Tarjeta de información básica en el panel deslizable
  Widget _buildDetailInfo(BuildContext context, String title, String value) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: textTheme.bodyMedium?.copyWith(color: Colors.black87),
        ),
      ],
    );
  }

  /// Elemento de la grilla para mostrar las estadísticas
  Widget _buildStatItem(BuildContext context, String label, String value) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
