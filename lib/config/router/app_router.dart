import 'package:cinemapedia_app/presentation/screens/screens.dart';
import 'package:cinemapedia_app/presentation/views/home_views/favorites_view.dart';
import 'package:cinemapedia_app/presentation/views/home_views/home_view.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    //* rutas padre e hijo
    // GoRoute(
    //   path: '/',
    //   name: HomeScreen.name,
    //   builder: (context, state) => HomeScreen(childView: FavoritesView()),
    //   routes: [
    //     GoRoute(
    //       path: 'movie/:id',
    //       name: MovieScreen.name,
    //       builder: (context, state) {
    //         final movieId =
    //             state.pathParameters['id'] ??
    //             'no-id'; // ✅ Usar pathParameters en lugar de params
    //         return MovieScreen(movieId: movieId);
    //       },
    //     ),
    //   ],
    // ),
    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const HomeView();
          },
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
        GoRoute(
          path: '/favorites',
          builder: (context, state) {
            return const FavoritesView();
          },
        ),
      ],
    ),
  ],
);
