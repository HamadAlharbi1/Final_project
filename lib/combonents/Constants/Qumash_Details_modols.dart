class Qumash_Detail {
  static List<Qumash_Details> List_of_Qumashs = [
    Qumash_Details(
        Image_URL: 'https://cdn.salla.sa/mWbnq/XQWFpflTlRD5Usl2jI7iQM6PGkytndLFKRMbqHF2.jpg',
        country_of_manufacture: 'كوري',
        Rate: '4.3',
        id: '1',
        Qumash_name: "قماش كوري نقشة مربعات أبيض",
        Describtion: 'قماش صيفي كوري فاخر جودة عالية نقشة مربعات مصنوع من الياف القطن والبولستر المعالج.',
        The_ability: 'متوفر',
        price: 180),
    Qumash_Details(
        Image_URL: 'https://cdn.salla.sa/mWbnq/XQWFpflTlRD5Usl2jI7iQM6PGkytndLFKRMbqHF2.jpg',
        country_of_manufacture: 'كوري',
        Rate: '4.3',
        id: '2',
        Qumash_name: "قماش كوري نقشة مربعات أبيض",
        Describtion: 'قماش صيفي كوري فاخر جودة عالية نقشة مربعات مصنوع من الياف القطن والبولستر المعالج.',
        The_ability: 'متوفر',
        price: 180),
    Qumash_Details(
        Image_URL: 'https://cdn.salla.sa/mWbnq/XQWFpflTlRD5Usl2jI7iQM6PGkytndLFKRMbqHF2.jpg',
        country_of_manufacture: 'كوري',
        Rate: '4.3',
        id: '3',
        Qumash_name: "قماش كوري نقشة مربعات أبيض",
        Describtion: 'قماش صيفي كوري فاخر جودة عالية نقشة مربعات مصنوع من الياف القطن والبولستر المعالج.',
        The_ability: 'متوفر',
        price: 180),
  ];
}

class Qumash_Details {
  String Qumash_name;
  String id;
  String Describtion;
  String Rate;
  String The_ability;
  String Image_URL;
  double price;
  String country_of_manufacture;

  Qumash_Details({
    required this.id,
    required this.Qumash_name,
    required this.Describtion,
    required this.Rate,
    required this.The_ability,
    required this.Image_URL,
    required this.price,
    required this.country_of_manufacture,
  });
  factory Qumash_Details.fromMap(Map<String, dynamic> map) {
    return Qumash_Details(
      Qumash_name: map['Qumash_name'],
      Describtion: map['Describtion'],
      Rate: map['Rate'],
      The_ability: map['The_ability'],
      Image_URL: map['Image_URL'],
      price: map['more_details1'],
      country_of_manufacture: map['more_details2'],
      id: map['id'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'Qumash_name': Qumash_name, //
      'Describtion': Describtion, //
      'Rate': Rate, //
      'more_details1': price, //
      'more_details2': country_of_manufacture, //
      'The_ability': The_ability,
      'Image_URL': Image_URL,
      'id': id,
    };
  }
}
