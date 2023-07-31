import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:keepo/services/navigation.dart';
import 'package:keepo/services/permission_handler.dart';

final selectContactsRepositoryProvider = Provider(
  (ref) => ContactRepository(),
);

class ContactRepository {
  Future handleContact() async {
    var data = await getContacts();

    return data;
  }

  Future<List<String>> getStringNameContact() async {
    var data = await handleContact();
    if (data != false) {
      var result = <String>[];
      data.forEach((element) {
        result.add(element.displayName);
      });

      return result;
    }
    return [];
  }

  void sendContact(Contact selectedContact, BuildContext context) async {
    try {
      var contact = {
        'contact': selectedContact,
        'id': selectedContact.id,
        'name': selectedContact.name,
        'displayName': selectedContact.displayName,
        'number': jsonEncode(selectedContact.phones.toList())
      };

      GetIt.I<NavigationServiceMain>().pop(contact);
    } catch (e) {
      print('error send contact ==> $e');
      // showSnackBar(context: context, content: e.toString());
    }
  }

  void createGroup(List<Contact> selectedContact, BuildContext context) async {
    try {
      print("LIST ${selectedContact.length}");
    } catch (e) {
      print('error send contact ==> $e');
      // showSnackBar(context: context, content: e.toString());
    }
  }
}
