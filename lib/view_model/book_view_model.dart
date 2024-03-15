import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../data/model/book_model.dart';
import '../data/model/response.dart';
import '../data/repositories/book_repo.dart';

class BookViewModel extends ChangeNotifier {
  List<BookModel> allBooks = [];

  String statusText = "";

  bool isLoading = false;

  BookViewModel({required this.productRepo});

  final BookRepo productRepo;

  Future<void> getAllBooks() async {
    _notify(true);
    MyResponse myResponse = await productRepo.getAllBooks();
    getAllBooks();
    _notify(false);
    if (myResponse.errorText.isEmpty) {
      allBooks = myResponse.data as List<BookModel>;
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> addBook(BookModel bookModel) async {
    _notify(true);
    MyResponse myResponse = await productRepo.addBook(bookModel);
    getAllBooks();

    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> updateBook(BookModel bookModel) async {
    _notify(true);
    MyResponse myResponse = await productRepo.updateBook(bookModel);
    getAllBooks();

    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> deleteBook(String bookUUID) async {
    _notify(true);
    MyResponse myResponse = await productRepo.deleteBook(bookUUID);
    getAllBooks();

    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
    } else {
      statusText = myResponse.errorText;
    }
  }

  _notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}