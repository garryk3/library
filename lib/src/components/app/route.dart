part of 'app.dart';

class AppRoute extends StatelessWidget {
  final Widget child;
  const AppRoute({Key key, this.child}) : super(key: key);

  Widget buildDevBtnClear(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        RepositoryProvider.of<AppDbRepository>(context).dropAppTables();
      },
      child: Icon(Icons.delete),
    );
  }

  List<BlocListener> _getEventListeners() => [
        BlocListener<ErrorBloc, ErrorState>(
          listenWhen: (previousState, state) {
            return previousState.message != state.message;
          },
          listener: (context, state) {
            if (state is ErrorStateActive) {
              Error.showErrorDialog(context, state);
            }
          },
        ),
        BlocListener<LoaderBloc, LoaderState>(
          listenWhen: (previousState, state) {
            return previousState != state;
          },
          listener: (context, state) {
            if (state is LoaderStateShow) {
              Loader.showLoader(context);
            }
            if (state is LoaderStateHide) {
              AppRouter.goBack(context);
            }
          },
        )
      ];

  @override
  Widget build(BuildContext context) {
    const isProduction = bool.fromEnvironment('dart.vm.product');

    return SafeArea(
      child: Scaffold(
        floatingActionButton: isProduction ? null : buildDevBtnClear(context),
        appBar: const TopAppBar(),
        drawer: Drawer(
          child: Menu(),
        ),
        endDrawer: Drawer(
          child: Settings(),
        ),
        body: MultiBlocListener(
          listeners: _getEventListeners(),
          child: BlocBuilder<AppBloc, AppState>(
            builder: (BuildContext context, state) {
              if (state.pathToCalibre == null) {
                return GetPath();
              }
              return child;
            },
          ),
        ),
      ),
    );
  }
}
