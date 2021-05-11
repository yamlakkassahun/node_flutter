import 'package:flutter/material.dart';

import 'apiService/categoryApiService.dart';
import 'models/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CategoryApiService apiService = CategoryApiService();
  List<Category> categoryList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child:FutureBuilder(
            future: apiService.getAllCategory(),
            builder: (context, snapshot){
              categoryList = snapshot.data ?? [];
              return ListView.builder(
                itemCount: categoryList.length,
                itemBuilder: (context, index){
                  Category category = categoryList[index] ?? [];
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(category.id),
                        Text(category.title),
                        Text(category.image),
                      ],
                    ),
                  );
                },
              );
            },
          )
      ),
    );
  }
}
