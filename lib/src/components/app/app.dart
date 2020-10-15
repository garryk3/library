import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:library/src/components/error/index.dart';
import 'package:library/src/components/loader/loader.dart';
import 'package:library/src/screens/get-path/get-path.dart';
import 'package:library/src/screens/home/index.dart';
import 'package:library/src/screens/library/library.dart';
import 'package:library/src/screens/library/bloc/library_bloc.dart';
import 'package:library/src/screens/book-info/book-info.dart';
import 'package:library/src/screens/ratings/ratings.dart';
import 'package:library/src/screens/authors/authors.dart';
import 'package:library/src/repositories/repositories.dart';
import 'package:library/src/services/service-locator.dart';

import 'bloc/app_bloc.dart';
export 'bloc/app_bloc.dart';

part 'navigation.dart';
part 'route.dart';
part 'get-theme.dart';
part 'top-app-bar.dart';
part 'menu.dart';
part 'settings.dart';

class LibraryApp extends StatefulWidget {
  LibraryApp({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<LibraryApp> {
  ErrorBloc _errorBloc;
  LoaderBloc _loaderBloc;
  AppBloc _appBloc;
  BookinfoBloc _bookInfoBloc;

  CalibreRepository _calibreRepository;
  AppDbRepository _appDbRepository;

  @override
  void initState() {
    _errorBloc = ErrorBloc();
    _loaderBloc = LoaderBloc();
    _calibreRepository = CalibreRepository(_errorBloc, _loaderBloc);
    _appDbRepository = AppDbRepository();
    _appBloc = AppBloc(_appDbRepository)..add(AppEventInitialize());
    _bookInfoBloc = BookinfoBloc(_calibreRepository, _appDbRepository, _loaderBloc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ErrorBloc>.value(value: _errorBloc),
        BlocProvider<LoaderBloc>.value(value: _loaderBloc),
        BlocProvider<AppBloc>.value(value: _appBloc),
        BlocProvider.value(value: _bookInfoBloc)
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: _calibreRepository),
          RepositoryProvider.value(value: _appDbRepository),
        ],
        child: MaterialApp(
          title: 'Calendar',
          theme: getTheme(),
          initialRoute: Routes.home.toString(),
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _errorBloc.close();
    _loaderBloc.close();
    _appBloc.close();
    _bookInfoBloc.close();
    getService<DbProvider>().dispose();
    super.dispose();
  }
}
