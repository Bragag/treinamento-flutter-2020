import 'package:exercicio_10/models/car-detail.model.dart';
import 'package:exercicio_10/network/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarDetailPageArguments {
  final String type, yearId, modelId;
  final int brandId;

  CarDetailPageArguments(this.type, this.brandId, this.modelId, this.yearId);
}

class CarDetailPage extends StatefulWidget {
  static const routeName = '/car-details';
  final CarDetailPageArguments args;

  CarDetailPage(this.args);

  @override
  _CarDetailPageState createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  CarDetail _carDetail;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    _carDetail = await Api.getCarDetails(widget.args.type, widget.args.brandId,
        widget.args.modelId, widget.args.yearId);
    print(_carDetail);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do veículo'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: _carDetail == null
            ? CupertinoActivityIndicator()
            : Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_carDetail.name),
                    SizedBox(height: 10,),
                    Text(_carDetail.brand),
                    SizedBox(height: 10,),
                    Text(_carDetail.vehicle),
                    SizedBox(height: 10,),
                    Text(_carDetail.fipeCode),
                    SizedBox(height: 10,),
                    Text(_carDetail.fuel),
                    SizedBox(height: 10,),
                    Text(_carDetail.price),
                    SizedBox(height: 10,),
                    Text(_carDetail.modelYear),
                    IconButton(icon: Icon(Icons.favorite), onPressed: null)
                  ],
                ),
            ),
      ),
    );
  }
}
