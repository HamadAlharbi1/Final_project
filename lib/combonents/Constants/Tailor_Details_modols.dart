///------------------------ معلومات الخياطين ----------------------------

class Tailor_Detail {
  static List<Tailor_Details> List_of_tailors = [
    Tailor_Details(
        Image_URL:
            'data:image/jpeg;base64,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',
        more_details2: '  ',
        Rate: '3.5',
        id: '1',
        Tailor_name: " ابو عبدالله ",
        location: 'الرياض-حي المونسيه',
        The_ability: 'متوفر',
        avarge_period: '3 ايام عمل  '),
    Tailor_Details(
        Image_URL: 'https://i0.wp.com/bestriyadh.com/wp-content/uploads/2021/11/images-4-5.jpeg?resize=512%2C330&ssl=1',
        more_details2: '  ',
        Rate: '5',
        id: '2',
        Tailor_name: " حسن محمد ",
        location: 'الرياض-قرطبة',
        The_ability: 'متوفر',
        avarge_period: '4 ايام عمل  '),
  ];
}

class Tailor_Details {
  String Tailor_name;
  String id;
  String location;
  String Rate;
  String The_ability;
  String Image_URL;
  String avarge_period;
  String more_details2;

  Tailor_Details({
    required this.id,
    required this.Tailor_name,
    required this.location,
    required this.Rate,
    required this.The_ability,
    required this.Image_URL,
    required this.avarge_period,
    required this.more_details2,
  });
  factory Tailor_Details.fromMap(Map<String, dynamic> map) {
    return Tailor_Details(
      Tailor_name: map['Tailor_name'],
      location: map['location'],
      Rate: map['Rate'],
      The_ability: map['The_ability'],
      Image_URL: map['Image_URL'],
      avarge_period: map['avarge_period'],
      more_details2: map['more_details2'],
      id: map['id'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'Tailor_name': Tailor_name,
      'location': location,
      'Rate': Rate,
      'avarge_period': avarge_period,
      'more_details2': more_details2,
      'The_ability': The_ability,
      'Image_URL': Image_URL,
      'id': id,
    };
  }
}
