import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constructors.dart';

class Controller extends GetxController {
  var name = 'Jonatas Borges'.obs;

  final bookNameController = TextEditingController();
  final bookImageController = TextEditingController();
  final bookAuthorController = TextEditingController();

  List<Books> books = [
    Books('https://i.idefix.com/cache/500x400-0/originals/0001947675001-1.jpg',
        'Zihin Tuzakları', 'Serhat Yabancı'),
    Books(
        'https://i.idefix.com/cache/500x400-0/originals/0001957015001-1.jpg',
        'İmzalı - Ezbere Yaşayanlar - Vazgeçemediğimiz Alışkanlıklarımızın Kökenleri ',
        ' Emrah Safa Gürkan'),
    Books('https://i.idefix.com/cache/500x400-0/originals/0001957732001-1.jpg',
        'Uyurgezerler 1.Kitap', 'Hermann Broch'),
    Books('https://i.idefix.com/cache/500x400-0/originals/0001957714001-1.jpg',
        'Atatürk\'ün Mutfağı', 'Murat Bardakçı'),
    Books('https://i.idefix.com/cache/500x400-0/originals/0001957732001-1.jpg',
        'Uyurgezerler 1.Kitap', 'Hermann Broch'),
    Books(
        'https://i.idefix.com/cache/500x400-0/originals/0001957015001-1.jpg',
        'İmzalı - Ezbere Yaşayanlar - Vazgeçemediğimiz Alışkanlıklarımızın Kökenleri ',
        ' Emrah Safa Gürkan'),
  ].obs;

  addBook(String name, String author, String image) {
    bool _validURL = Uri.parse(image).isAbsolute;

    _validURL
        ? books.add(Books(image, name, author))
        : books.add(Books(
            'https://i.idefix.com/cache/500x400-0/originals/0001957015001-1.jpg',
            name,
            author));

    print(books.length);
    //update();
  }

  removeBook(int index) {
    books.removeAt(index);
    update();
  }
}
