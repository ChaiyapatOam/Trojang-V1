import 'package:contacts_app/app-contact.class.dart';
import 'package:contacts_app/components/contact-avatar.dart';
import 'package:contacts_app/pages/contact-details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'components/contact-avatar.dart';

class Trojang extends StatelessWidget {
  //const Trojang({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trojang',
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  //const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Trojang"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[Trojang_List()],
          ),
        ));
  }
}

class Trojang_List extends StatelessWidget {
  final List<AppContact> contacts;
  Function() reloadContacts;
  Trojang_List({Key key, this.contacts, this.reloadContacts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 0.75),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          AppContact contact = contacts[index];
          return Card(
              elevation: 0,
              color: Colors.transparent,
              child: Hero(
                tag: Text(contact.info.displayName),
                child: Material(
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      FlutterPhoneDirectCaller.callNumber(
                          contact.info.phones.elementAt(0).value);
                      // Navigator.of(context).push(MaterialPageRoute(
                      // builder: (BuildContext context) => ContactDetails(
                      //       contact,
                      //       onContactDelete: (AppContact _contact) {
                      //         reloadContacts();
                      //         Navigator.of(context).pop();
                      //       },
                      //       onContactUpdate: (AppContact _contact) {
                      //         reloadContacts();
                      //       },
                      //     )));
                    },
                    onLongPress: () {
                      // FlutterPhoneDirectCaller.callNumber(
                      //     contact.info.phones.elementAt(0).value);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => ContactDetails(
                                contact,
                                onContactDelete: (AppContact _contact) {
                                  reloadContacts();
                                  Navigator.of(context).pop();
                                },
                                onContactUpdate: (AppContact _contact) {
                                  reloadContacts();
                                },
                              )));
                    },
                    child: GridTile(
                      child: ContactAvatar(contact, 50),
                      footer: Container(
                        height: 20,
                        width: 5,
                        padding: EdgeInsets.all(2),
                        color: Colors.transparent,
                        child: GridTileBar(
                          backgroundColor: Colors.transparent,
                          title: Text(
                            contact.info.displayName,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        // title: Column(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: <Widget>[
                        //     Text(
                        //       contact.info.displayName,
                        //       style: TextStyle(
                        //         fontSize: 14,
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                    ),
                  ),
                  // onTap: () {
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (BuildContext context) => ContactDetails(
                  //             contact,
                  //             onContactDelete: (AppContact _contact) {
                  //               reloadContacts();
                  //               Navigator.of(context).pop();
                  //             },
                  //             onContactUpdate: (AppContact _contact) {
                  //               reloadContacts();
                  //             },
                  //           )));
                  // },
                  // title: Text(contact.info.displayName),
                  // subtitle: Text(contact.info.phones.length > 0
                  //     ? contact.info.phones.elementAt(0).value
                  //     : ''),
                  // leading: ContactAvatar(contact, 36)
                ),
              ));
        },
      ),
    );
  }
}
