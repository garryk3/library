part of '../book-info.dart';

class BookinfoActionButtons extends StatefulWidget {
  BookinfoActionButtons({Key key}) : super(key: key);

  @override
  _BookinfoActionButtonsState createState() => _BookinfoActionButtonsState();
}

class _BookinfoActionButtonsState extends State<BookinfoActionButtons> {
  void _onTapFavorites(bool newValue) {
    print('add to favirites $bool');
  }

  void _onTapRead(bool newValue) {
    print('add to reed $bool');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          buildRow(text: 'В избранное', action: _onTapFavorites),
          buildRow(text: 'Прочитано', action: _onTapRead),
        ],
      ),
    );
  }

  Widget buildRow({String text, Function action}) {
    return Container(
      height: 24.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(text), flex: 2),
          Switch(
            value: false,
            onChanged: action,
          ),
        ],
      ),
    );
  }
}
