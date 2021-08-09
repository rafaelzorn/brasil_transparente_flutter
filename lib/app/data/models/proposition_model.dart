class PropositionModel {
  int? id;
  int? number;
  int? year;
  String? initialsType;
  String? menu;

  PropositionModel({
    this.id,
    this.number,
    this.year,
    this.initialsType,
    this.menu,
  });

  factory PropositionModel.fromMap(Map<String, dynamic> map) {
    return PropositionModel(
      id: map['id'],
      number: map['numero'],
      year: map['ano'],
      initialsType: map['siglaTipo'],
      menu: map['ementa'],
    );
  }
}
