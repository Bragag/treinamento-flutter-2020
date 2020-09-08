import 'package:exercicio_10/models/brand.model.dart';
import 'package:exercicio_10/network/api.dart';
import 'package:exercicio_10/widgets/list-item.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model-list.page.dart';

class BrandListPageArguments {
  final String type, title;

  BrandListPageArguments(this.type, this.title);
}

class BrandListPage extends StatefulWidget {
  static const routeName = '/brand-list';
  final BrandListPageArguments args;

  BrandListPage(this.args);

  @override
  _BrandListPageState createState() => _BrandListPageState();
}

class _BrandListPageState extends State<BrandListPage> {
  List<Brand> _brands = <Brand>[];

  _onPress(BuildContext context, String type, String title, int id) {
    Navigator.pushNamed(
      context,
      ModelListPage.routeName,
      arguments: ModelListPageArguments(
        type,
        title,
        id,
      ),
    );
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    _brands = await Api.getBrands(widget.args.type);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.title),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: _brands.length == 0
            ? CupertinoActivityIndicator()
            : ListView.builder(
                itemCount: _brands.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  Brand brand = _brands[index];
                  return ListItem(
                    onPress: () => _onPress(
                        context, widget.args.type, brand.name, brand.id),
                    buttonLabel: brand.name,
                  );
                }),
      ),
    );
  }
}
