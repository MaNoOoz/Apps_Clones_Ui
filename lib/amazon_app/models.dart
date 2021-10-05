import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Data extends ChangeNotifier {
  static String collectionPlaces = "places";

  static FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Data.initalize() {
    _loadPlaces();
  }

  List<Place> _Places = [];

  _loadPlaces() async {
    _Places = await getPlacesWithDistance();
    notifyListeners();
  }

  static Future<List<Place>> getPlaces() async =>
      _firestore.collection(collectionPlaces).get().then((result) {
        List<Place> restaurants = [];

        for (DocumentSnapshot restaurant in result.docs) {
          restaurants.add(Place.fromSnapshot(restaurant));
        }

        return restaurants;
      });

  static Future<List<Place>> getPlacesWithDistance() async =>
      _firestore.collection(collectionPlaces).get().then((result) {
        List<Place> restaurants = [];

        for (DocumentSnapshot place in result.docs) {
          restaurants.add(Place.fromSnapshot(place));
        }

        return restaurants;
      });

  final List<Resturant> _resturants2 = [
    Resturant(
      imageUrl: 'assets/images/hanger_app/quick.png',
      title: 'كويك',
      price: 300.95,
      type: "سندويش , مأكولات سريعة",
      rating: "4.4",
      lable: "إعلان",
      desc: 'Sandwitch , Fast Food',
    ),
    Resturant(
      imageUrl: 'assets/images/hanger_app/res2.png',
      title: 'الفطيرة الدمشقية',
      price: 109.99,
      rating: "4.2",
      type: "سندويش , مأكولات سريعة",
      lable: "إعلان",
      desc: '',
    ),
    Resturant(
      imageUrl: 'assets/images/hanger_app/res3.png',
      title: 'ماكدونالدز',
      price: 1199.99,
      rating: "4.4",
      type: "سندويش , مأكولات سريعة",
      lable: "",
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
    Resturant(
      imageUrl: 'assets/images/hanger_app/res4.png',
      title: 'قرمشها',
      price: 88.99,
      rating: "4.4",
      type: "سندويش , مأكولات سريعة",
      lable: "",
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
    Resturant(
      imageUrl: 'assets/images/hanger_app/qq.png',
      title: 'الجديد عنا',
      price: 99.95,
      rating: "4.4",
      lable: "مغلق",
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
    Resturant(
      imageUrl: 'assets/images/hanger_app/aa.png',
      title: 'مخبوزات ومقاضي',
      price: 99.95,
      rating: "4.4",
      lable: "مغلق",
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
    Resturant(
      imageUrl: 'assets/images/hanger_app/aaaa.png',
      title: 'صحة وتغذية',
      price: 99.95,
      lable: "مغلق",
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
    Resturant(
      imageUrl: 'assets/images/hanger_app/aasd.png',
      title: 'مطاعم كشخة',
      price: 99.95,
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
    Resturant(
      imageUrl: 'assets/images/hanger_app/Layer 22 Frame.png',
      title: 'الورد جميل',
      price: 99.95,
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
  ];

  final List<Product> _products = [
    Product(
      imageUrl: 'assets/images/amazon_app/mxmaster.jpg',
      name: 'Logitech MX Master 2S',
      price: 300.95,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
    Product(
      imageUrl: 'assets/images/amazon_app/z1.jpg',
      name: 'IPhone 6 Plus (64) Gray',
      price: 109.99,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
    Product(
      imageUrl: 'assets/images/amazon_app/macbookpro.jpg',
      name: 'MacBook Pro 13-inch (2019)',
      price: 1199.99,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
    Product(
      imageUrl: 'assets/images/amazon_app/keyboard.jpg',
      name: 'Apple Magic Keyboard',
      price: 88.99,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
    Product(
      imageUrl: 'assets/images/amazon_app/jbl.jpg',
      name: 'JBL Bluetooth Speaker',
      price: 99.95,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
  ];
  final List<Product> _mobiles = [
    Product(
      imageUrl: 'assets/images/amazon_app/a5.jpg',
      name: 'IPhone 11 Pro',
      price: 300.95,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
    Product(
      imageUrl: 'assets/images/amazon_app/a6.jpg',
      name: 'Samsung S10 Ultra (256)',
      price: 109.99,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
    Product(
      imageUrl: 'assets/images/amazon_app/a7.jpg',
      name: 'IPhone XR Yellow ',
      price: 1199.99,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
    Product(
      imageUrl: 'assets/images/amazon_app/a8.jpg',
      name: 'Samsung Note 10 Plus (128)',
      price: 88.99,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
  ];
  final List<Product> _toys = [
    Product(
      imageUrl: 'assets/images/amazon_app/gear_vr.jpg',
      name: 'Samsung VR',
      price: 300.95,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
  ];
  final List<Product> _books = [
    Product(
      imageUrl: 'assets/images/amazon_app/thirddoor.jpg',
      name: 'The Third Door',
      price: 18.49,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
    Product(
      imageUrl: 'assets/images/amazon_app/unfu*kyourself.jpg',
      name: 'Unfu*k Yourself',
      price: 18.40,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
    Product(
      imageUrl: 'assets/images/amazon_app/crushingit.jpg',
      name: 'Crushing It',
      price: 18.98,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
    Product(
      imageUrl: 'assets/images/amazon_app/powerofhabit.jpg',
      name: 'The Power of Habit',
      price: 10.20,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
    ),
  ];

  List<Place> get Places => _Places;

  List<Product> get books => _books;

  List<Product> get toys => _toys;

  List<Product> get mobiles => _mobiles;

  List<Product> get products => _products;

  List<Resturant> get resturants2 => _resturants2;
}

class Product {
  String imageUrl;
  String name;
  double price;
  String description;

  Product({
    this.imageUrl,
    this.name,
    this.price,
    this.description,
  });
}

class Resturant {
  String title;
  String subTitle;
  String desc = "";
  String type = "";
  double price;
  String rating;
  String lable;
  String imageUrl;

  Resturant(
      {this.title,
      this.type,
      this.subTitle,
      this.desc,
      this.price,
      this.rating,
      this.lable,
      this.imageUrl});
}

class Cat {
  String name;
  String Image;

  Cat({this.name, this.Image});
}

class Filter {
  String name;
  String Image;

  Filter({this.name, this.Image});
}

class Place {
  static const NAME = "name";
  static const IMAGE = "Image";
  static const GEOPOINT = "geopoint";
  static const TYPE = "type";

  Place(this._name, this._Image, this._geoPoint, this._type);

  String _name;
  String _Image;
  GeoPoint _geoPoint;
  String _type;

  Place.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _Image = snapshot.data()[IMAGE];
    _geoPoint = snapshot.data()[GEOPOINT];
    _type = snapshot.data()[TYPE];
  }

  String get name => _name;

  String get Image => _Image;

  GeoPoint get geoPoint => _geoPoint;

  String get type => _type;
}

final List<Cat> _mCatNames = [
  Cat(name: "عروض اليوم"),
  Cat(name: "السوبرماركت"),
  Cat(name: "الالكترونيات"),
  Cat(name: "الجوالات"),
  Cat(name: "المنزل"),
  Cat(name: "الألعاب"),
  Cat(name: "القسائم"),
  Cat(name: "الجمال"),
  Cat(name: "الأخبار"),
];
final List<Cat> mCatNames2 = [
  Cat(name: "حلويات"),
  Cat(name: "السوبرماركت"),
  Cat(name: "الالكترونيات"),
  Cat(name: "الجوالات"),
  Cat(name: "المنزل"),
  Cat(name: "الألعاب"),
  Cat(name: "القسائم"),
  Cat(name: "الجمال"),
  Cat(name: "عصائر"),
];
//static
final List<String> mFilterTitle = [
  'قهوة',
  'شاورما',
  'عالمي',
  'طعام محلي',
];

final List<IconData> mIcons = [
  Icon(Icons.shop).icon,
  Icon(Icons.mood).icon,
  Icon(Icons.g_translate).icon,
  Icon(Icons.scatter_plot).icon,
  Icon(Icons.school).icon,
  Icon(Icons.dashboard).icon,
  Icon(Icons.wifi).icon,
  Icon(Icons.work).icon,
];

final List<Color> mColors = [
  Colors.red,
  Colors.blue,
  Colors.yellow,
  Colors.blueGrey,
  Colors.greenAccent,
  Colors.lightGreen,
  Colors.orange,
  Colors.brown,
];

//static
final List<String> imgList = [
  'assets/images/amazon_app/s1.jpg',
  'assets/images/amazon_app/s2.jpg',
  'assets/images/amazon_app/s3.jpg',
  'assets/images/amazon_app/s4.jpg',
];

/// Network
final List<String> imgList2 = [
  'https://images-na.ssl-images-amazon.com/images/G/40/Events/2020/BSS20/GW_MobileHero_AMZ_Basics_1242x450_ar._CB409600059_SY300_.jpg',
  'https://images-na.ssl-images-amazon.com/images/G/40/Events/BSS/GW/GW_MobileHero_Electronics_1242x450_ar._CB409624444_SY300_.jpg',
  'https://images-na.ssl-images-amazon.com/images/G/40/Events/BSS/GW/GW_MobileHero_Supermarket_1242x450_ar._CB409624172_SY300_.jpg',
  'https://images-na.ssl-images-amazon.com/images/G/40/Events/BSS/GW/coupon/GW_MobileHero_Coupon_1242x450_ar._CB409667589_SY300_.jpg',
];

/// Network
final List<String> offersImages = [
  'https://images-na.ssl-images-amazon.com/images/G/40/Events/BSS/GW/GW_MobileHero_BSS_1242x450_ar2._SX1242_CB409621248_.jpg',
  'https://images-na.ssl-images-amazon.com/images/G/40/KSA-hq/2020/img/Apparel/XCM_2Manual_1230371_KSA_A_SA_BSS_GW_BB_Fashion_ar_3204340_1242x450_2Xundefined._SX1242_CB409313934_.jpg',
  'https://images-na.ssl-images-amazon.com/images/G/40/Events/BSS/GW/https://images-na.ssl-images-amazon.com/images/G/40/Gateway/Sunrise/OHL/Event/GW_BB_Appliances_1242x450_AR._SX1242_CB409616719_.jpg',
  'https://images-na.ssl-images-amazon.com/images/G/40/Events/BSS/GW/https://images-na.ssl-images-amazon.com/images/G/40/Gateway/Sunrise/Consumables/GW_MobileHero_Personal_care_1242x450_ar._SX1242_CB409629054_.jpg',
];

/// Static
final List<String> offersImages2 = [
  'assets/images/amazon_app/d1.jpg',
  'assets/images/amazon_app/d2.jpg',
  'assets/images/amazon_app/b1.jpg',
  'assets/images/amazon_app/s4.jpg',
];

final List<IconData> navIcons = const [
  Icons.home,
  // Icons.ondemand_video,
  MdiIcons.accountCircleOutline,
  MdiIcons.cart,
  // MdiIcons.bellOutline,
  Icons.menu,
];
final List catIcons = [
  Icon(
    FontAwesomeIcons.coffee,
    color: Colors.black38,
    size: 12,
  ),
  Icon(
    FontAwesomeIcons.globe,
    color: Colors.black38,
    size: 12,
  ),
  Icon(
    FontAwesomeIcons.utensils,
    color: Colors.black38,
    size: 12,
  ),
  Icon(
    FontAwesomeIcons.weight,
    color: Colors.black38,
    size: 12,
  ),
];
