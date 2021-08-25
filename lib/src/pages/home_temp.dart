import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp List'),
      ),
      body: ListView(
        children: _createShortItems(),
      ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = [];
    for (String opt in options) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      list..add(tempWidget)..add(Divider());
    }
    return list;
  }

  List<Widget> _createShortItems() {
    return options.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Anything'),
            leading: Icon(Icons.account_balance),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
