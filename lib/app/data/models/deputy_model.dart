class DeputyModel {
  int id;
  String ?name;
  String ?state;
  String ?photo;
  String ?politicalParty;

  DeputyModel({
    required this.id,
    this.name,
    this.state,
    this.photo,
    this.politicalParty,
  });

  factory DeputyModel.fromMap(Map<String, dynamic> map) {
    return DeputyModel(
      id: map['id'],
      name: map['nome'] ?? null,
      state: map['siglaUf'] ?? null,
      photo: map['urlFoto' ] ?? null,
      politicalParty: map['siglaPartido'] ?? null,
    );
  }
}
