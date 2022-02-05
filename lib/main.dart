import 'package:flutter/material.dart';
import './widget_extensions.dart';

const itemCount = 20;

void main() => runApp(
      MaterialApp(
        title: 'Flutter Layout',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            // Material default text style
            bodyText2: TextStyle(color: Colors.purple),
          ),
        ),
        home: const Home(),
      ),
    );

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //elevation: 0, // removes shadow at bottom
        title: Text('My Demo'),
      ),
      body: Column(
        children: [
          ScrollableRow().border().padding(10),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ScrollableColumn(),
          ).border().padding(10),
          SizedBox(
            height: 200,
            child: MyListView(),
          ).border().padding(10),
          Text(
            'Bold Text',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollableRow extends StatelessWidget {
  const ScrollableRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          for (var i = 1; i <= itemCount; i++) Text('Text #$i').padding(5),
        ],
      ),
    );
  }
}

class ScrollableColumn extends StatelessWidget {
  const ScrollableColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (var i = 1; i <= itemCount; i++) Text('Text #$i').padding(5),
        ],
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Text('Text #${index + 1}').padding(5);
      },
      itemCount: itemCount,
    );
  }
}
