import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/model/book_model.dart';
import '../view_model/book_view_model.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: context.watch<BookViewModel>().isLoading
        ? ListView(
      children: [
        ...List.generate(
          context.watch<BookViewModel>().allBooks.length,
              (index) {
            BookModel booksModel = context.watch<BookViewModel>().allBooks[index];
            return Column(
              children: [
                CachedNetworkImage(imageUrl: booksModel.imageUrl,
                )
              ],
            ) ;
          },
        ),
      ],
    )
        : const Center(
      child: CircularProgressIndicator(),
    ),
    );
  }
}
