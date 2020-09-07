import 'package:exercicio_10/models/car-year.model.dart';
import 'package:exercicio_10/network/api.dart';
import 'package:exercicio_10/pages/car-detail.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YearListPageArguments {
  final String type, modelName, modelId;
  final int brandId;


  YearListPageArguments(this.type, this.modelName, this.modelId, this.brandId);
}

class YearListPage extends StatefulWidget {
  static const routeName = '/year-list';
  final YearListPageArguments args;

  YearListPage(this.args);
  @override
  _YearListPageState createState() => _YearListPageState();
}

class _YearListPageState extends State<YearListPage> {
  List<CarYear> _years = [];

  _onPress(BuildContext context, String type, int brandId, String modelId, String yearId) {
    Navigator.pushNamed(
      context,
      CarDetailPage.routeName,
      arguments: CarDetailPageArguments(
        type,
        brandId,
        modelId,
        yearId,
      ),
    );
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    _years = await Api.getYears(widget.args.type, widget.args.brandId, widget.args.modelId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.modelName),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: _years.length == 0
            ? CupertinoActivityIndicator()
            : ListView.builder(
            itemCount: _years.length,
            itemBuilder: (
                BuildContext context,
                int index,
                ) {
              CarYear year = _years[index];
              return CupertinoButton(
                onPressed: () => _onPress(context, widget.args.type, widget.args.brandId, widget.args.modelId, year.id),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  color: Colors.white,
                  padding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    year.name,
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
