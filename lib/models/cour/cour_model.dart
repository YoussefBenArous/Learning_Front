class GetCour {
  List<Cours>? cours;

  GetCour({this.cours});

  GetCour.fromJson(Map<String, dynamic> json) {
    if (json['cours'] != null) {
      cours = <Cours>[];
      json['cours'].forEach((v) {
        cours!.add(new Cours.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cours != null) {
      data['cours'] = this.cours!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cours {
  String? sId;
  String? titreC;
  String? descriptionC;
  int? iV;

  Cours({this.sId, this.titreC, this.descriptionC, this.iV});

  Cours.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    titreC = json['titreC'];
    descriptionC = json['descriptionC'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['titreC'] = this.titreC;
    data['descriptionC'] = this.descriptionC;
    data['__v'] = this.iV;
    return data;
  }
}