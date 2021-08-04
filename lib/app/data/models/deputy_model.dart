class DeputyModel {
  int? id;
  String? name;
  String? cpf;
  String? initialsParty;
  String? state;
  String? photo;
  String? politicalParty;
  String? schooling;
  String? email;
  String? phone;
  String? situation;
  String? civilName;
  String? birthCity;
  String? birthState;
  String? birthDate;
  String? gender;

  DeputyModel({
    this.id,
    this.name,
    this.cpf,
    this.initialsParty,
    this.state,
    this.photo,
    this.politicalParty,
    this.schooling,
    this.email,
    this.phone,
    this.situation,
    this.civilName,
    this.birthCity,
    this.birthState,
    this.birthDate,
    this.gender,
  });

  factory DeputyModel.fromMap(Map<String, dynamic> map) {
    return DeputyModel(
      id: map['id'] ?? null,
      name: map['nome'] ?? null,
      cpf: map['cpf'] ?? null,
      initialsParty: map['siglaPartido'] ?? null,
      state: map['siglaUf'] ?? null,
      photo: map['urlFoto'] ?? null,
      politicalParty: map['siglaPartido'] ?? null,
      schooling: map['escolaridade'] ?? null,
      email: map['email'] ?? null,
      phone: map['telefone'] ?? null,
      situation: map['situacao'] ?? null,
      civilName: map['nomeCivil'] ?? null,
      birthCity: map['municipioNascimento'] ?? null,
      birthState: map['ufNascimento'] ?? null,
      birthDate: map['dataNascimento'] ?? null,
      gender: map['sexo'] ?? null,
    );
  }
}
