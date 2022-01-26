import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kutuphane/add_book.dart';
import 'package:kutuphane/constructors.dart';
import 'package:kutuphane/controllers/controller.dart';
import 'package:kutuphane/list_tile.dart';

void main() => runApp(MyApp());

String _text = 'Kütüphane App';
bool _switchValue = true;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      title: _text,
      home: Scaffold(
        appBar: getAppBar(),
        body: GetBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddBookWidget(
              themeValue: _switchValue,
            ));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(_text),
      leading: Switch(
          activeColor: Colors.white,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
              Get.changeTheme(value ? ThemeData.light() : ThemeData.dark());
              print('Switch value: $_switchValue');
            });
          },
          value: _switchValue),
    );
  }
}

class GetBody extends StatelessWidget {
  const GetBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Books books = Books('das', 'das', 'dasdsa');
    return Column(
      children: [
        Text(
          'Please Long press to remove book',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(child: getListView()),
      ],
    );
  }

  Widget getListView() {
    Controller _controller = Get.find();
    return Obx(() => ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: _controller.books.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () {
                showAlertDialog(context, index);
                // AlertDialog(
                //   title: Text('${_controller.books[index].bookName}'),
                //   content: Text('${_controller.books[index].bookAuthor}'),
                //   actions: [
                //     ElevatedButton(
                //       child: Text('OK'),
                //       onPressed: () {
                //         Get.back();
                //       },
                //     )
                //   ],
                // );
              },
              child: ListTileKitap(
                bookAuthor: _controller.books[index].bookName,
                bookName: _controller.books[index].bookAuthor,
                bookImage: _controller.books[index].bookImage,
              ),
            );
          },
        ));
  }

  Widget getListViewAnimation() {
    Controller _controller = Get.find();
    return Obx(() => ListView.builder(
          itemCount: _controller.books.length,
          itemBuilder: (context, index) {
            return ListTileKitap(
              bookAuthor: _controller.books[index].bookName,
              bookName: _controller.books[index].bookAuthor,
              bookImage: _controller.books[index].bookImage,
            );
          },
        ));
  }
}

showAlertDialog(BuildContext context, int index) {
  Controller _controller = Get.find();
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text('No'),
    onPressed: () {
      Get.back();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Remove"),
    onPressed: () {
      _controller.removeBook(index);
      Get.back();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Remove Book"),
    content: Text("Do you really want to remove " +
        _controller.books[index].bookName +
        " book?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
