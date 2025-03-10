import 'package:cinemapedia_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId =
                state.pathParameters['id'] ??
                'no-id'; // ✅ Usar pathParameters en lugar de params
            return MovieScreen(movieId: movieId);
          },
        ),
      ],
    ),
  ],
);
