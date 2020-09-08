import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> _contacts;

  @override
  initState() {
    _refreshContacts();
    super.initState();
  }

  _refreshContacts() async {
    List<Contact> contacts = (await ContactsService.getContacts(
            withThumbnails: false, iOSLocalizedLabels: false))
        .toList();

    setState(() {
      _contacts = contacts;
    });
  }

  _share(Contact contact) {
    Share.text('Contato', '${contact.displayName}', 'text/plain');
  }

  @override
  Widget build(BuildContext context) {
    return _contacts == null
        ? CupertinoActivityIndicator()
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              Contact contact = _contacts?.elementAt(index);
              return ListTile(
                title: Text(contact.displayName),
                onTap: () => _share(contact),
                leading: CircleAvatar(
                  child: Text(
                    contact.initials(),
                  ),
                ),
              );
            },
            itemCount: _contacts?.length ?? 0,
          );
  }
}
