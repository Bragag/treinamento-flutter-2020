class CarYear {
  String key, fipeName, name, vehicle, id;

  CarYear({
    this.key,
    this.id,
    this.fipeName,
    this.name,
    this.vehicle,
  });

  factory CarYear.fromJson(Map<String, dynamic> json) {
    return CarYear(
      key: json['key'],
      id: json['id'],
      fipeName: json['fipeName'],
      name: json['name'],
      vehicle: json['veiculo'],
    );
  }
}
