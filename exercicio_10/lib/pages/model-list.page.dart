import 'package:exercicio_10/models/car.model.dart';
import 'package:exercicio_10/network/api.dart';
import 'package:exercicio_10/pages/year-list.page.dart';
import 'package:exercicio_10/widgets/list-item.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModelListPageArguments {
  final String type, brandName;
  final int brandId;

  ModelListPageArguments(this.type, this.brandName, this.brandId);
}

class ModelListPage extends StatefulWidget {
  static const routeName = '/model-list';
  final ModelListPageArguments args;

  ModelListPage(this.args);

  @override
  _ModelListPageState createState() => _ModelListPageState();
}

class _ModelListPageState extends State<ModelListPage> {
  List<CarModel> _models = [];

  _onPress(BuildContext context, String type, String modelName, String modelId,
      int brandId) {
    Navigator.pushNamed(
      context,
      YearListPage.routeName,
      arguments: YearListPageArguments(type, modelName, modelId, brandId),
    );
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    _models = await Api.getModels(widget.args.type, widget.args.brandId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.brandName),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: _models.length == 0
            ? CupertinoActivityIndicator()
            : ListView.builder(
                itemCount: _models.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  CarModel model = _models[index];
                  return ListItem(
                    onPress: () => _onPress(context, widget.args.type,
                        model.name, model.id, widget.args.brandId),
                    buttonLabel: model.name,
                  );
                }),
      ),
    );
  }
}
