class ProcedureModel {
  String? date;
  String? initialsOrgan;
  String? description;
  String? dispatch;
  int? sequence;

  ProcedureModel({
    this.date,
    this.initialsOrgan,
    this.description,
    this.dispatch,
    this.sequence,
  });

  factory ProcedureModel.fromMap(Map<String, dynamic> map) {
    return ProcedureModel(
      date: map['dataHora'],
      initialsOrgan: map['siglaOrgao'],
      description: map['descricaoTramitacao'],
      dispatch: map['despacho'],
      sequence: map['sequencia'],
    );
  }
}
