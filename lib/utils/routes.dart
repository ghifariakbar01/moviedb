import 'package:omdb/view/pages/favorit.dart';
import 'package:omdb/view/pages/movies/searchmovies.dart';
import 'package:omdb/view/widgets/home.dart';

import 'root.dart';

final appRoutes = {
  '/': (context) => Root(),
  '/home': (context) => HomeWidget(
        title: 'Elemes Movie',
      ),
  '/favorit': (context) => const FavoritPage(),
  '/search': (context) => const SearchMovies(),
};
