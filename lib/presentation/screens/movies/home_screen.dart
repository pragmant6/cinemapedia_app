import 'package:cinemapedia_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

// Pantalla principal de la aplicación
class HomeScreen extends StatelessWidget {
  static const name = 'home-screen'; // Nombre para la navegación
  final Widget childView;
  const HomeScreen({super.key, required this.childView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      bottomNavigationBar: const CustomBottomNavigation(),
    ); // Rendering la vista principal
  }
}
