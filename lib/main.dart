import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kutuphane/add_book.dart';
import 'package:kutuphane/constructors.dart';
import 'package:kutuphane/controllers/controller.dart';
import 'package:kutuphane/list_tile.dart';

void main() => runApp(MyApp());

String text = 'Material App Bar';

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
      title: 'Material App',
      home: Scaffold(
        appBar: getAppBar(),
        body: GetBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddBookWidget());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      title: Text('data'),
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
    return getListView();
  }

  Widget getListView() {
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
