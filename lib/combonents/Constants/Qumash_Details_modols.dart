class Qumash_Detail {
  static List<Qumash_Details> List_of_Qumashs = [
    /// قماش كوري
    // Qumash_Details(
    //     Image_URL: 'https://cdn.salla.sa/mWbnq/XQWFpflTlRD5Usl2jI7iQM6PGkytndLFKRMbqHF2.jpg',
    //     country_of_manufacture: 'كوري',
    //     Rate: '4.3',
    //     id: '1',
    //     Qumash_name: "قماش كوري ",
    //     Describtion: 'قماش صيفي كوري فاخر جودة عالية نقشة مربعات مصنوع من الياف القطن والبولستر المعالج.',
    //     The_ability: 'متوفر',
    //     price: ' 230'),

    ///2
    ///https://aljedaie.com/pub/media/catalog/product/cache/dbe9a78d4cde7d5b7f628bb032d21033/_/-/_-7711.jpg
    ///بنتلي
    ///نسيج تربيعي من القطن الصناعي ناعم مريح وبارد وجيد جداً في مقاومته التكسير
    ///3
    ///https://aljedaie.com/pub/media/catalog/product/cache/dbe9a78d4cde7d5b7f628bb032d21033/f/i/file_3.jpg
    ///بليرن
    ///نسيج طولي من القطن الصناعي ناعم مريح وبارد وجيد جداً في مقاومته التكسير
    ///4
    ///https://aljedaie.com/pub/media/catalog/product/cache/dbe9a78d4cde7d5b7f628bb032d21033/_/-/_-_2.jpg
    ///ميليون
    ///نسيج تربيعي من القطن الصناعي ثقيل رسمي ومتوسط في مقاومته التكسير
    ///5
    ///https://aljedaie.com/pub/media/catalog/product/cache/dbe9a78d4cde7d5b7f628bb032d21033/f/i/file_1.jpg
    ///ريفيو
    ///نسيج طولي من القطن الصناعي ناعم مريح وبارد وجيد جداً في مقاومته التكسير
    ///
    ///
    ///
    Qumash_Details(
        Image_URL: 'https://cdn.salla.sa/mWbnq/XQWFpflTlRD5Usl2jI7iQM6PGkytndLFKRMbqHF2.jpg',
        country_of_manufacture: 'كوري',
        Rate: '4.4',
        id: '1',
        Qumash_name: "قماش كوري ",
        Describtion: 'قماش صيفي كوري فاخر جودة عالية نقشة مربعات مصنوع من الياف القطن والبولستر المعالج.',
        The_ability: 'متوفر',
        price: ' 237'),
    Qumash_Details(
        Image_URL:
            'https://aljedaie.com/pub/media/catalog/product/cache/dbe9a78d4cde7d5b7f628bb032d21033/_/-/_-7711.jpg',
        country_of_manufacture: '',
        Rate: '5',
        id: '2',
        Qumash_name: 'بنتلي',
        Describtion: 'نسيج تربيعي من القطن الصناعي ناعم مريح وبارد وجيد جداً في مقاومته التكسير',
        The_ability: 'متوفر',
        price: '244'),
    Qumash_Details(
        Image_URL:
            'https://aljedaie.com/pub/media/catalog/product/cache/dbe9a78d4cde7d5b7f628bb032d21033/f/i/file_3.jpg',
        country_of_manufacture: '',
        Rate: '5',
        id: '3',
        Qumash_name: 'بليرن',
        Describtion: 'نسيج تربيعي من القطن الصناعي ناعم مريح وبارد وجيد جداً في مقاومته التكسير',
        The_ability: 'متوفر',
        price: '234'),
    Qumash_Details(
        Image_URL: 'https://aljedaie.com/pub/media/catalog/product/cache/dbe9a78d4cde7d5b7f628bb032d21033/_/-/_-_2.jpg',
        country_of_manufacture: '',
        Rate: '5',
        id: '4',
        Qumash_name: 'ميليون',
        Describtion: 'سيج تربيعي من القطن الصناعي ثقيل رسمي ومتوسط في مقاومته التكسير',
        The_ability: 'متوفر',
        price: '294'),
    Qumash_Details(
        Image_URL:
            'https://aljedaie.com/pub/media/catalog/product/cache/dbe9a78d4cde7d5b7f628bb032d21033/f/i/file_1.jpg',
        country_of_manufacture: '',
        Rate: '5',
        id: '5',
        Qumash_name: 'ريفيو',
        Describtion: 'نسيج طولي من القطن الصناعي ناعم مريح وبارد وجيد جداً في مقاومته التكسير',
        The_ability: 'متوفر',
        price: '274'),
  ];
}

class Qumash_Details {
  String Qumash_name;
  String id;
  String Describtion;
  String Rate;
  String The_ability;
  String Image_URL;
  String price;
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
