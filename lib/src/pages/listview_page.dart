import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _numberList = [];
  int _lastnumber = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addingTen();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists'),
      ),
      body: Stack(
        children: [_createList(), _createLoading()],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getPage,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _numberList.length,
          itemBuilder: (BuildContext context, int index) {
            final imagen = _numberList[index];
            return FadeInImage(
              image: NetworkImage('https://picsum.photos/id/$imagen/500/300'),
              placeholder: AssetImage('assets/jar-loading.gif'),
            );
          }),
    );
  }

  Future<void> getPage() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _numberList.clear();
      _lastnumber++;
      _addingTen();
    });

    return Future.delayed(duration);
  }

  void _addingTen() {
    for (var i = 1; i < 10; i++) {
      _lastnumber++;
      _numberList.add(_lastnumber);
    }
    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, httpResponse);
  }

  void httpResponse() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _addingTen();
  }

  _createLoading() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Container();
    }
  }
}
