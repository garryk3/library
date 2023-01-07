part of '../library.dart';

// final _pathToCalibreFolder = getService<DbProvider>().calibreFolderPath;

class Book extends StatelessWidget {
  final BookModel _model;
  const Book(this._model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coverFile = File(join(
      // _pathToCalibreFolder,
      '',
      _model.path,
      _model.coverFileName,
    ));
    final hasCover = _model.hasCover == 1 && coverFile.existsSync();

    return Container(
      color: Colors.black87,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          if (_model.rating != null)
            Positioned(
              left: 8.0,
              top: 8.0,
              child: Text(
                _model.rating == null ? '${(_model.rating! ~/ 2).toString()}/5' : '',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          if (hasCover)
            Image.file(
              coverFile,
              height: 100.0,
            ),
          if (!hasCover)
            Icon(
              Icons.book_outlined,
              color: Colors.white,
              size: 100.0,
            ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 90.0,
              padding: const EdgeInsets.all(8.0),
              color: Colors.white.withOpacity(0.4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _model.title ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _model.author ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(fontSize: 13.0),
                  ),
                  if (_model.tags != null)
                    Column(
                      children: [
                        Divider(
                          color: Colors.white,
                          height: 5.0,
                        ),
                        Text(
                          // _model.tags,
                          'hh',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12.0),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
