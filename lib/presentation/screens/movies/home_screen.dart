import 'package:cinemapedia_app/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Pantalla principal de la aplicación
class HomeScreen extends StatelessWidget {
  static const name = 'home-screen'; // Nombre para la navegación
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeView(); // Renderiza la vista principal
  }
}

// Widget que maneja el estado con Riverpod
class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    // Cargar la primera página de películas en cartelera al iniciar
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(
      nowPlayingMoviesProvider,
    ); // Escucha cambios en la lista de películas

    return ListView.builder(
      itemCount: nowPlayingMovies.length, // Número total de películas
      itemBuilder: (context, index) {
        final movie =
            nowPlayingMovies[index]; // Obtiene la película en la posición actual

        return _MovieCard(
          title: movie.title, // Título de la película
          categories: movie.genreIds, // Lista de géneros
          posterUrl: movie.posterPath, // URL del póster
        );
      },
    );
  }
}

// Tarjeta para mostrar información de una película
class _MovieCard extends StatelessWidget {
  final String title;
  final List<String> categories;
  final String posterUrl;

  const _MovieCard({
    required this.title,
    required this.categories,
    required this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Sombra del card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ), // Bordes redondeados
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen de la película
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ), // Bordes redondeados solo arriba
            child: Image.network(
              posterUrl,
              height: 200, // Altura fija
              width: double.infinity, // Ocupar todo el ancho disponible
              fit: BoxFit.cover, // Ajuste para cubrir el espacio
              errorBuilder:
                  (context, error, stackTrace) => const Icon(
                    Icons.broken_image, // Ícono de imagen rota si no carga
                    size: 100,
                    color: Colors.grey,
                  ),
            ),
          ),

          // Título de la película
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ), // Estilo en negrita
              maxLines: 2, // Máximo 2 líneas
              overflow:
                  TextOverflow
                      .ellipsis, // Agrega "..." si el texto es muy largo
            ),
          ),

          // Géneros de la película
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              categories.join(
                ', ',
              ), // Convierte la lista en un string separado por comas
              style: const TextStyle(
                color: Colors.green,
              ), // Texto en color verde
              maxLines: 1, // Máximo una línea
              overflow:
                  TextOverflow
                      .ellipsis, // Agrega "..." si el texto es muy largo
            ),
          ),

          const SizedBox(height: 8), // Espacio al final
        ],
      ),
    );
  }
}
