part of '../book-info.dart';

class BookInfoSlider extends StatelessWidget {
  final List<BookInfoModel>? seriesBooks;
  const BookInfoSlider(this.seriesBooks, {Key? key}) : super(key: key);

  void _onTapBook(BuildContext context, int id) {
    // final bloc = BlocProvider.of<BookinfoBloc>(context);
    // bloc.add(BookinfoEventLoadInfo(id));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(),
        items: (seriesBooks ?? []).map((book) {
          return Builder(
            builder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  _onTapBook(context, book.bookId);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.black),
                  child: Text(
                    book.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
