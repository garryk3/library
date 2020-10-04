part of 'app.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          ListView(
            padding: const EdgeInsets.only(bottom: 80.0),
            children: <Widget>[
              SizedBox(
                height: 60.0,
                child: DrawerHeader(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Настройки', style: const TextStyle(color: Colors.white)),
                      Icon(
                        Icons.settings,
                        color: Colors.white.withOpacity(0.4),
                        size: 36.0,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {
                    AppRouter.goTo(context, Routes.getPath);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Расположение базы данных Calibre: ',
                          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                        ),
                        BlocBuilder<AppBloc, AppState>(
                          builder: (BuildContext context, state) {
                            if (state.pathToCalibre != null) {
                              return Text(state.pathToCalibre, style: const TextStyle(fontSize: 12.0));
                            }
                            return Text(
                              'Не задано!',
                              style: const TextStyle(fontSize: 12.0),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            bottom: 24.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlatButton.icon(
                  label: Text('Обновить бд Calibre'),
                  icon: Icon(Icons.refresh),
                  onPressed: () {},
                  color: Colors.white,
                ),
                FlatButton.icon(
                  label: Text('Сохранить бд приложения'),
                  icon: Icon(Icons.save),
                  onPressed: () {},
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ]));
  }
}
