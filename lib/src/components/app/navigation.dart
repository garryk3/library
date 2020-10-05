part of 'app.dart';

enum Routes { home, ratings, getPath, library, bookInfo }

class AppRouter {
  static final _instance = AppRouter._();

  const AppRouter._();

  factory AppRouter() {
    return _instance;
  }

  static void goTo(BuildContext context, Routes route) {
    Navigator.pushReplacementNamed(context, route.toString());
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static Route<dynamic> _buildGetPathRoute() => MaterialPageRoute(builder: (_) => AppRoute(child: GetPath()));

  static Route<dynamic> _buildBookInfoRoute() =>
      MaterialPageRoute(builder: (BuildContext context) => AppRoute(child: BookInfo()));

  static Route<dynamic> _buildHomeRoute() => MaterialPageRoute(
        builder: (_) => BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc()..add(HomeEventStarted()),
          child: AppRoute(child: Home()),
        ),
      );

  static Route<dynamic> _buildLibraryRoute() => MaterialPageRoute(
        builder: (_) => BlocProvider<LibraryBloc>(
          create: (BuildContext context) => LibraryBloc(context)..add(LibraryEventLoadData()),
          child: AppRoute(child: Library()),
        ),
      );

  static Route<dynamic> _buildRatingsRoute() => MaterialPageRoute(
      builder: (_) => BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc()..add(HomeEventStarted()),
            child: AppRoute(child: Ratings()),
          ));

  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == Routes.getPath.toString()) {
      return _buildGetPathRoute();
    }
    if (settings.name == Routes.home.toString()) {
      return _buildHomeRoute();
    }
    if (settings.name == Routes.ratings.toString()) {
      return _buildRatingsRoute();
    }
    if (settings.name == Routes.library.toString()) {
      return _buildLibraryRoute();
    }
    if (settings.name == Routes.bookInfo.toString()) {
      return _buildBookInfoRoute();
    }
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text('404 - PAGE NOT FOUND')),
      ),
    );
  }
}
