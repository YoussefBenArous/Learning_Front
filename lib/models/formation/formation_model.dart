class GetFormation {
  int? count;
  List<Formations>? formations;

  GetFormation({this.count, this.formations});

  GetFormation.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['formations'] != null) {
      formations = <Formations>[];
      json['formations'].forEach((v) {
        formations!.add(new Formations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.formations != null) {
      data['formations'] = this.formations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Formations {
  String? sId;
  String? nameF;
  String? dureeF;
  List<String>? formateur;
  String? descriptionF;
  int? iV;
  List<String>? cours;

  Formations(
      {this.sId,
      this.nameF,
      this.dureeF,
      this.formateur,
      this.descriptionF,
      this.iV,
      this.cours});

  Formations.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nameF = json['nameF'];
    dureeF = json['dureeF'];
    formateur = json['formateur'].cast<String>();
    descriptionF = json['descriptionF'];
    iV = json['__v'];
    cours = json['cours'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nameF'] = this.nameF;
    data['dureeF'] = this.dureeF;
    data['formateur'] = this.formateur;
    data['descriptionF'] = this.descriptionF;
    data['__v'] = this.iV;
    data['cours'] = this.cours;
    return data;
  }
}