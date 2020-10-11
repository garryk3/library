part of '../book-info.dart';

class BookinfoActionButtons extends StatefulWidget {
  final AppDbRepository appDbRepository;
  final BookInfoModel model;
  BookinfoActionButtons(BuildContext context, this.model, {Key key})
      : appDbRepository = RepositoryProvider.of<AppDbRepository>(context),
        super(key: key);

  @override
  _BookinfoActionButtonsState createState() => _BookinfoActionButtonsState();
}

class _BookinfoActionButtonsState extends State<BookinfoActionButtons> {
  bool isReaded = false;
  bool isFavorites = false;

  @override
  void initState() {
    super.initState();
    isReaded = widget.model.read;
    isFavorites = widget.model.favorites;
  }

  void _onTapFavorites(bool newValue) {
    setState(() {
      isFavorites = newValue;
    });
    widget.appDbRepository.saveFavoritesBook(widget.model.bookId, newValue);
  }

  void _onTapRead(bool newValue) {
    setState(() {
      isReaded = newValue;
    });
    widget.appDbRepository.saveReadBook(widget.model.bookId, newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          buildRow(text: 'В избранное', action: _onTapFavorites, value: isFavorites),
          buildRow(text: 'Прочитано', action: _onTapRead, value: isReaded),
        ],
      ),
    );
  }

  Widget buildRow({@required String text, @required Function action, @required bool value}) {
    return Container(
      height: 24.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(text), flex: 2),
          Switch(
            value: value,
            onChanged: action,
          ),
        ],
      ),
    );
  }
}
