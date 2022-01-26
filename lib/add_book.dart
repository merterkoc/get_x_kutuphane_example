import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kutuphane/controllers/controller.dart';

class AddBookWidget extends StatefulWidget {
  AddBookWidget({Key? key}) : super(key: key);

  @override
  State<AddBookWidget> createState() => _AddBookWidgetState();
}

class _AddBookWidgetState extends State<AddBookWidget> {
  Controller _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Add Book'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _controller.bookNameController,
                  decoration: const InputDecoration(labelText: 'Kitap Adı'),
                ),
                TextFormField(
                  controller: _controller.bookAuthorController,
                  decoration: const InputDecoration(labelText: 'Kitap Yazarı'),
                ),
                TextFormField(
                  controller: _controller.bookImageController,
                  decoration: const InputDecoration(
                      labelText:
                          'Kitap Resmi (Url girmezseniz varsayılan görseli Ekler)'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.addBook(
                        _controller.bookAuthorController.value.text,
                        _controller.bookNameController.value.text,
                        _controller.bookImageController.value.text);
                  },
                  child: Text('Kitap Ekle'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
