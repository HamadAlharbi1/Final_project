class Qumash_Detail {
  static List<Qumash_Details> reports1 = [
    Qumash_Details(
        Image_URL: '300',
        more_details2: '5 ',
        Rate: '28',
        id: '1',
        Qumash_name: "علي العبدلي",
        Describtion: '200',
        The_ability: '2500',
        more_details1: '4 '),
  ];
}

class Qumash_Details {
  String Qumash_name;
  String id;
  String Describtion;
  String Rate;
  String The_ability;
  String Image_URL;
  String more_details1;
  String more_details2;

  Qumash_Details({
    required this.id,
    required this.Qumash_name,
    required this.Describtion,
    required this.Rate,
    required this.The_ability,
    required this.Image_URL,
    required this.more_details1,
    required this.more_details2,
  });
  factory Qumash_Details.fromMap(Map<String, dynamic> map) {
    return Qumash_Details(
      Qumash_name: map['Qumash_name'],
      Describtion: map['Describtion'],
      Rate: map['Rate'],
      The_ability: map['The_ability'],
      Image_URL: map['Image_URL'],
      more_details1: map['more_details1'],
      more_details2: map['more_details2'],
      id: map['id'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'Qumash_name': Qumash_name, //
      'Describtion': Describtion, //
      'Rate': Rate, //
      'more_details1': more_details1, //
      'more_details2': more_details2, //
      'The_ability': The_ability,
      'Image_URL': Image_URL,
      'id': id,
    };
  }
}
