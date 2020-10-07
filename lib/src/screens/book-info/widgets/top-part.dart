part of '../book-info.dart';

class BookinfoTopPart extends StatelessWidget {
  final BookInfoModel model;

  const BookinfoTopPart(this.model, {Key key}) : super(key: key);

  Widget buildTextLine(String text) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final coverFile = File(join(
      _pathToCalibreFolder,
      model.path,
      model.coverFileName,
    ));
    final hasCover = model.hasCover == 1 && coverFile.existsSync();
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.black12,
            padding: EdgeInsets.symmetric(vertical: 8.0),
            width: screenWidth / 2 - 30.0,
            child: hasCover
                ? Image.file(coverFile, height: 100.0)
                : Icon(Icons.book_outlined, color: Colors.black, size: 100.0),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextLine('Рейтинг: ${(model.rating ~/ 2).toString()}/5'),
                  if (model.format != null) buildTextLine('Формат: ${model.format}'),
                  if (model.identType != null) buildTextLine('Идентификаторы: ${model.identType}'),
                  if (model.langCode != null) buildTextLine(model.langCode),
                  BookinfoActionButtons(context, model.bookId),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
