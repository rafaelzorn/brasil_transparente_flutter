class DeputyModel {
  int id;
  String name;
  String state;
  String photo;
  String politicalParty;

  DeputyModel({
    required this.id,
    required this.name,
    required this.state,
    required this.photo,
    required this.politicalParty,
  });

  factory DeputyModel.fromMap(Map<String, dynamic> map) {
    return DeputyModel(
      id: map['id'],
      name: map['nome'],
      state: map['siglaUf'],
      photo: map['urlFoto'],
      politicalParty: map['siglaPartido'],
    );
  }
}
