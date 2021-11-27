import 'dart:math';

import 'package:contacts_app/app-contact.class.dart';
import 'package:contacts_app/utils/get-color-gradient.dart';
import 'package:flutter/material.dart';

class ContactAvatar extends StatelessWidget {
  ContactAvatar(this.contact, this.size);
  final AppContact contact;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
        // decoration: BoxDecoration(
        //     shape: BoxShape.circle, gradient: getColorGradient(contact.color)),
        child: (contact.info.avatar != null && contact.info.avatar.length > 0)
            ? CircleAvatar(
                backgroundImage: MemoryImage(contact.info.avatar),
              )
            : CircleAvatar(
                backgroundImage: AssetImage("assets/avatar.png"),
                // backgroundImage: Image.asset("assets/img/004.png"),
                // child: Text(contact.info.displayName,
                //     style: TextStyle(color: Colors.black)),
                backgroundColor: Colors.transparent,
              ));
  }
}
