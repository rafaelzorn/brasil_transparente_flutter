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
      id: map['id'],
      name: map['nome'],
      cpf: map['cpf'],
      initialsParty: map['siglaPartido'],
      state: map['siglaUf'],
      photo: map['urlFoto'],
      politicalParty: map['siglaPartido'],
      schooling: map['escolaridade'],
      email: map['email'],
      phone: map['telefone'],
      situation: map['situacao'],
      civilName: map['nomeCivil'],
      birthCity: map['municipioNascimento'],
      birthState: map['ufNascimento'],
      birthDate: map['dataNascimento'],
      gender: map['sexo'],
    );
  }
}
