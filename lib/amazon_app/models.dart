import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

final List<Resturant> resturants = [
  Resturant(
    imageUrl: 'assets/images/hanger_app/Layer 2 Frame.png',
    title: 'عروض يلو فرايدي',
    price: 300.95,
    rating: "4.4",
    lable: "مغلق",
    desc:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
  ),
  Resturant(
    imageUrl: 'assets/images/hanger_app/Layer 3 Frame.png',
    title: 'عروض التوصيل',
    price: 109.99,
    rating: "4.2",
    lable: "مغلق",
    desc:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
  ),
  Resturant(
    imageUrl: 'assets/images/hanger_app/Layer 5 Frame.png',
    title: 'توصيل مجاني',
    price: 1199.99,
    rating: "4.4",
    desc:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
  ),
  Resturant(
    imageUrl: 'assets/images/hanger_app/Layer 6 Frame.png',
    title: 'قرمشها',
    price: 88.99,
    rating: "4.4",
    lable: "مغلق",
    desc:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
  ),
  Resturant(
    imageUrl: 'assets/images/hanger_app/qq.png',
    title: 'الجديد عنا',
    price: 99.95,
    rating: "4.4",
    desc:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
  ),
  Resturant(
    imageUrl: 'assets/images/hanger_app/aa.png',
    title: 'مخبوزات ومقاضي',
    price: 99.95,
    rating: "4.4",
    desc:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
  ),
  Resturant(
    imageUrl: 'assets/images/hanger_app/aaaa.png',
    title: 'صحة وتغذية',
    price: 99.95,
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
final List<Resturant> resturants2 = [
  Resturant(
    imageUrl: 'assets/images/hanger_app/quick.png',
    title: 'كويك',
    price: 300.95,
    type: "سندويش , مأكولات سريعة",
    rating: "4.4",
    lable: "مغلق",
    desc: 'Sandwitch , Fast Food',
  ),
  Resturant(
    imageUrl: 'assets/images/hanger_app/res2.png',
    title: 'الفطيرة الدمشقية',
    price: 109.99,
    rating: "4.2",
    type: "سندويش , مأكولات سريعة",
    lable: "مغلق",
    desc:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
  ),
  Resturant(
    imageUrl: 'assets/images/hanger_app/res3.png',
    title: 'ماكدونالدز',
    price: 1199.99,
    rating: "4.4",
    type: "سندويش , مأكولات سريعة",
    lable: "مغلق",
    desc:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
  ),
  Resturant(
    imageUrl: 'assets/images/hanger_app/res4.png',
    title: 'قرمشها',
    price: 88.99,
    rating: "4.4",
    type: "سندويش , مأكولات سريعة",
    lable: "مغلق",
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

final List<Product> products = [
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
final List<Product> mobiles = [
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
final List<Product> toys = [
  Product(
    imageUrl: 'assets/images/amazon_app/gear_vr.jpg',
    name: 'Samsung VR',
    price: 300.95,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Volutpat consequat mauris nunc congue nisi. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Aliquam id diam maecenas ultricies mi eget.',
  ),
];
final List<Product> books = [
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

final List<Product> cart = [
  products[3],
  mobiles[1],
  products[1],
  books[0],
  products[4],
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
final List<String> mFilterTitle = [
  'قهوة',
  'شاورما',
  'عالمي',
  'طعام محلي',
];

final List<Cat> mCatNames = [
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

final List icons = [
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
