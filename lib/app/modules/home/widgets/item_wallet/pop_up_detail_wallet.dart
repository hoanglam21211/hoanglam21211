import 'package:flutter/material.dart';
import 'package:get/get.dart';

functionDetailWalletPopUp(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Text('Setting Wallet'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      icon: Icon(Icons.account_box),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                      icon: Icon(Icons.email),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      icon: Icon(Icons.message),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            RaisedButton(
                child: Text("Cancle"),
                onPressed: () {
                  Get.back();
                  // your code
                }),
            RaisedButton(
                child: Text("Submit"),
                onPressed: () {
                  // your code
                })
          ],
        );
      });
}


