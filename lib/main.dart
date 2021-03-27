import 'package:flutter/material.dart';

import 'DetailPage.dart';

void main() {
  runApp(Contact());
}

class Contact extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("HA Contact"),
        ),
        body: Home(),
      ),
    );
  }
}

class ContactModel {
  String name;
  String mobileNumber;

  ContactModel(this.name, this.mobileNumber);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ContactModel> contactList = [];

/*  Dismissible(
  child: ListTile(
  leading: Image.network('https://picsum.photos/250?image=9'),
  title: Text(model.name),
  subtitle: Text(model.mobileNumber),
  onTap: () {
  _navigatAndDisplaySelection(context, model, index);
  },
  ),
  onDismissed: (direction){
  // contactList.removeAt(index);
  },
  );*/
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ListView.builder(
            itemCount: contactList.length,
            itemBuilder: (context, index) {
              ContactModel model = contactList[index];
              return Dismissible(
                key: ObjectKey(contactList[index]),
                background: stackBehindDismiss(),
                child: ListTile(
                  leading: Image.network('https://picsum.photos/250?image=9'),
                  title: Text(model.name),
                  subtitle: Text(model.mobileNumber),
                  onTap: () {
                    _navigatAndDisplaySelection(context, model, index);
                  },
                ),
                onDismissed: (direction) {
                  setState(() {
                    contactList.removeAt(index);
                  });
                },
              );
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(10),
              child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    _navigatAndDisplaySelection(context);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  _navigatAndDisplaySelection(BuildContext context,
      [ContactModel model, int _index]) async {
    var result;
    if (model != null) {
      result = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailPage(model.name, model.mobileNumber, _index)));
    } else {
      result = await Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailPage()));
    }
    int index = -1;
    List listResult = result as List;
    ContactModel ctm = listResult[0];
    if (listResult.length > 1) {
      index = listResult[1];
    }

    setState(() {
      if (index == -1) {
        contactList.add(ctm);
      } else {
        contactList[index] = ctm;
      }
    });
  }

  Widget stackBehindDismiss() {
    return Container(
      color: Colors.red,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20),
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}
