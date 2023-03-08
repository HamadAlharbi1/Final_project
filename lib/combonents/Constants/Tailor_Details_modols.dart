///------------------------ معلومات الخياطين ----------------------------

class Tailor_Detail {
  static List<Tailor_Details> List_of_tailors = [
    /// الرياض
    Tailor_Details(
        Image_URL: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082952883814809610/IMG_2859.png',
        location_URL: 'https://maps.app.goo.gl/3gikDHeYXysHXgzw9?g_st=ic',
        Rate: '4',
        id: '1',
        Tailor_name: " خياط الربيع",
        location: 'الرياض',
        The_ability: 'متوفر',
        avarge_period: '4 ايام عمل  '),
    Tailor_Details(
        Image_URL: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082953261553811516/IMG_2860.png',
        location_URL: 'https://maps.app.goo.gl/iSCY8EauoDSS33uM9?g_st=ic',
        Rate: '9.3',
        id: '2',
        Tailor_name: " خياط رحال الرجالي",
        location: 'الرياض',
        The_ability: 'متوفر',
        avarge_period: '7 ايام عمل  '),

    /// الدمام
    Tailor_Details(
        Image_URL: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082954540871065720/IMG_2861.png',
        location_URL: 'https://maps.app.goo.gl/2oFSpgivraRbetyQA?g_st=ic',
        Rate: '3.4',
        id: '3',
        Tailor_name: " خياط الثوب الرسمي",
        location: 'الدمام',
        The_ability: 'متوفر',
        avarge_period: '5 ايام عمل  '),
    Tailor_Details(
        Image_URL: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082955497335963648/IMG_2862.png',
        location_URL: 'https://maps.app.goo.gl/weeQwzEgMTjLSMGt7?g_st=ic',
        Rate: '9.3',
        id: '4',
        Tailor_name: " خياط النجمه الذهبيه",
        location: 'الدمام',
        The_ability: 'متوفر',
        avarge_period: '5 ايام عمل  '),

    /// ينبع
    Tailor_Details(
        Image_URL: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082956134199074856/IMG_2863.png',
        location_URL: 'https://maps.app.goo.gl/QZmZGufePZmxetpo6?g_st=ic',
        Rate: '6.3',
        id: '5',
        Tailor_name: "الفاخرة للخياطة الرجالية",
        location: 'ينبع',
        The_ability: 'متوفر',
        avarge_period: '5 ايام عمل  '),
    Tailor_Details(
        Image_URL: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082956832580059218/IMG_2864.png',
        location_URL: 'https://maps.app.goo.gl/YFpm3r7bkPxnvwiY7?g_st=ic',
        Rate: '5.3',
        id: '6',
        Tailor_name: "جيران للخياطة",
        location: 'ينبع',
        The_ability: 'متوفر',
        avarge_period: '5 ايام عمل  '),

    /// المدينة
    Tailor_Details(
        Image_URL: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082958183779283005/IMG_2865.png',
        location_URL: 'https://maps.app.goo.gl/DfSg3u3n9MbhhDvs6?g_st=ic',
        Rate: '4.3',
        id: '7',
        Tailor_name: "   روشن",
        location: 'المدينة',
        The_ability: 'متوفر',
        avarge_period: '5 ايام عمل  '),
    Tailor_Details(
        Image_URL: 'https://cdn.discordapp.com/attachments/1081328393364189276/1082955497335963648/IMG_2862.png',
        location_URL: 'https://maps.app.goo.gl/iSCY8EauoDSS33uM9?g_st=ic',
        Rate: '3',
        id: '8',
        Tailor_name: " خياط الثوب الرسمي",
        location: 'المدينة',
        The_ability: 'متوفر',
        avarge_period: '5 ايام عمل  '),
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
  String location_URL;

  Tailor_Details({
    required this.id,
    required this.Tailor_name,
    required this.location,
    required this.Rate,
    required this.The_ability,
    required this.Image_URL,
    required this.avarge_period,
    required this.location_URL,
  });
  factory Tailor_Details.fromMap(Map<String, dynamic> map) {
    return Tailor_Details(
      Tailor_name: map['Tailor_name'],
      location: map['location'],
      Rate: map['Rate'],
      The_ability: map['The_ability'],
      Image_URL: map['Image_URL'],
      avarge_period: map['avarge_period'],
      location_URL: map['more_details2'],
      id: map['id'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'Tailor_name': Tailor_name,
      'location': location,
      'Rate': Rate,
      'avarge_period': avarge_period,
      'more_details2': location_URL,
      'The_ability': The_ability,
      'Image_URL': Image_URL,
      'id': id,
    };
  }
}
