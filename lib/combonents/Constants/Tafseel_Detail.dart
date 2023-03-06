class Tafseel_Detail {
  static List<Tafseel_Details> List_of_Details = [];
}

class Tafseel_Details {
  String tailor;
  String id;
  String qumash;
  String qumash_D;
  String qumash_IMG;
  String Yaqa;
  String Jubzor;
  String Zorar;
  String Kapak;
  String Tallstyle;
  String tadrizestyle;
  Tafseel_Details({
    required this.id,
    required this.tailor,
    required this.qumash,
    required this.qumash_D, //qumash_IMG
    required this.qumash_IMG,
    required this.Yaqa,
    required this.Jubzor,
    required this.Zorar,
    required this.Kapak,
    required this.Tallstyle,
    required this.tadrizestyle,
  });
  factory Tafseel_Details.fromMap(Map<String, dynamic> map) {
    return Tafseel_Details(
      qumash_IMG: map['qumash_IMG'],
      tadrizestyle: map['tadrizestyle'],
      tailor: map['tailor'],
      qumash: map['qumash'],
      qumash_D: map['qumash_D'],
      Yaqa: map['Yaqa'],
      Jubzor: map['Jubzor'],
      Zorar: map['Zorar'],
      Kapak: map['Kapak'],
      Tallstyle: map['Tallstyle'],
      id: map['id'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'qumash_D': qumash_D,
      'qumash_IMG': qumash_IMG,
      'tadrizestyle': tadrizestyle,
      'tailor': tailor,
      'qumash': qumash,
      'Yaqa': Yaqa,
      'Kapak': Kapak,
      'Tallstyle': Tallstyle,
      'Jubzor': Jubzor,
      'Zorar': Zorar,
      'id': id,
    };
  }
}
