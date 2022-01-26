import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListTileKitap extends StatelessWidget {
  String bookName;
  String bookAuthor;
  String bookImage;

  ListTileKitap({
    Key? key,
    required this.bookAuthor,
    required this.bookImage,
    required this.bookName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
              imageUrl: bookImage,
              height: 180,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookAuthor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
