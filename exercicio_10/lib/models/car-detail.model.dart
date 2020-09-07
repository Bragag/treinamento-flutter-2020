class CarDetail {
  String id, modelYear, brand, name, vehicle, price, fuel, ref, fipeCode, key;

  CarDetail({
    this.id,
    this.modelYear,
    this.brand,
    this.name,
    this.vehicle,
    this.price,
    this.fuel,
    this.ref,
    this.fipeCode,
    this.key,
  });

  factory CarDetail.fromJson(Map<String, dynamic> json) {
    return CarDetail(
      id: json['id'],
      modelYear: json['ano_modelo'],
      brand: json['marca'],
      name: json['name'],
      vehicle: json['veiculo'],
      price: json['preco'],
      fuel: json['combustivel'],
      ref: json['referencia'],
      fipeCode: json['fipe_codigo'],
      key: json['key'],
    );
  }
}
