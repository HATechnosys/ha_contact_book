import 'package:flutter/material.dart';
import 'package:ha_contact_book/main.dart';

class DetailPage extends StatefulWidget {
  var _controllerName = TextEditingController(text: "");
  var _controllerMobile = TextEditingController(text: "");
  //bool textEnable = false;
  String btnName = "Update";
  String name;
  String mobileNumber;
  int index;

  DetailPage([this.name, this.mobileNumber, this.index]) {
    _controllerName.text = name;
    _controllerMobile.text = mobileNumber;
    if (name == null) {
    //  textEnable = true;
      btnName = "Create";
    }
  }

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Page"),),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: widget._controllerName,
                  decoration: InputDecoration(
                    labelText: "Name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blue, width: 2.0),

                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
              /*    enabled: widget.textEnable,*/
                  controller: widget._controllerMobile,
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blue, width: 2.0),

                    ),
                  ),
                ),
              ),

              RaisedButton(
                child: Text(widget.btnName),
                onPressed: () {
                updateCreateContact();
                },
              )
            ],
          )
      ),
    );
  }

  updateCreateContact(){
    ContactModel ctm = ContactModel(
        widget._controllerName.text,
        widget._controllerMobile.text);
    if(widget.btnName =="Update"){

      Navigator.pop(context, [ctm,widget.index]);
    }else{
      Navigator.pop(context, [ctm]);
    }
  }

}
