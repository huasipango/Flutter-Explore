import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _cardType1(),
          SizedBox(
            height: 15.0,
          ),
          _cardType2(),
          SizedBox(
            height: 15.0,
          ),
          _cardType1(),
          SizedBox(
            height: 15.0,
          ),
          _cardType2(),
          SizedBox(
            height: 15.0,
          ),
          _cardType1(),
          SizedBox(
            height: 15.0,
          ),
          _cardType2(),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  _cardType1() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Card tittle'),
            subtitle: Text(
                'asdkolakosd askdasdp asdpas askdlalsd asjdlkasd a dlasdm asd asdlasdm '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  _cardType2() {
    final card = Container(
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(padding: EdgeInsets.all(10.0), child: Text('Hola'))
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(5, 5)),
          ]),
      child: ClipRRect(borderRadius: BorderRadius.circular(20), child: card),
    );
  }
}
