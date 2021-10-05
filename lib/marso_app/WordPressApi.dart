import 'dart:convert';

import 'package:ui_clones/amazon_app/models.dart';
import 'package:ui_clones/marso_app/models/User.dart';
import 'package:woocommerce/woocommerce.dart';
import 'package:http/http.dart' as http;

class WooCommerceApi {
  static String s1 =
      "https://balqes.com/wp-json/wc/v2/orders?oauth_consumer_key=ck_c2abc16f3219ec260c8319c6f16d6d35776b474e&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1609646209&oauth_nonce=TrzxTC&oauth_version=1.0&oauth_signature=gxxYG2umB95NFHEN/q2kl6Q0d+I=";
  static String s2 =
      "https://balqes.com/wp-json/wc/v2/orders?oauth_consumer_key=ck_c2abc16f3219ec260c8319c6f16d6d35776b474e&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1609646209&oauth_nonce=TrzxTC&oauth_version=1.0&oauth_signature=gxxYG2umB95NFHEN/q2kl6Q0d+I=";

  static String BASEURL_LOCAL_EnabledLiveLinks =
      "https://1e9d0c188a9f.ngrok.io";
  static String BASEURL_LOCAL = "https://b.local";
  static String BASEURL_LOCAL2 = "https://10.0.2.2:443";
  static String QUERYKEYWORD_Local = "products";
  static String RESTAPI_Local = "wp-json/wc/v2";
  static String PORTNUMBER_Local = "443";
  static String consumerKey_Local =
      "ck_056fa2c106eeeb0e6d20ac28fa1b6dca57c83305";
  static String consumerSecret_Local =
      "cs_4c4971f8decaa2a021463cfcf30243c663d4fdb8";

  static String BASEURL = "https://balqes.com";
  static String RESTAPI = "wp-json/wc/v3";
  static String QUERYKEYWORD = "orders";
  static String consumerKey = "ck_115be05d2cb9f5c12b0fbd19737766591bcdac9f";
  static String consumerSecret = "cs_1c20e101601d6e169b7ba170f01919108c6311ed";

  static String ENDPOINT =
      "$BASEURL/$RESTAPI/$QUERYKEYWORD?oauth_consumer_key=$consumerKey&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1609646209&oauth_nonce=TrzxTC&oauth_version=1.0&oauth_signature=gxxYG2umB95NFHEN/q2kl6Q0d+I=";
  static String ENDPOINT_Local =
      "$BASEURL_LOCAL/$RESTAPI_Local/$QUERYKEYWORD_Local?oauth_consumer_key=$consumerKey_Local&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1609646209&oauth_nonce=TrzxTC&oauth_version=1.0&oauth_signature=gxxYG2umB95NFHEN/q2kl6Q0d+I=";

  static WooCommerce woocommerce = WooCommerce(
    baseUrl: "$BASEURL",
    consumerKey: "$consumerKey",
    consumerSecret: "$consumerSecret",
    isDebug: true,
  );
  static WooCommerce woocommerceInLocalHost = WooCommerce(
    baseUrl: "$BASEURL_LOCAL_EnabledLiveLinks",
    consumerKey: "$consumerKey_Local",
    consumerSecret: "$consumerSecret_Local",
    isDebug: true,
  );

  static getProductsWoo() async {
    final myProducts = await woocommerce.getProducts(category: "238",perPage: 100);

    return myProducts;
  }

  static String GOOGLE = "https://www.google.com/";
  static String JSONPLACEHOLDER = "https://jsonplaceholder.typicode.com/posts";

  static Future getGoogle() async {
    print("getGoogle Called ");

    var client = http.Client();
    var response = await client.get(GOOGLE);
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      // print(response.headers);
      print(response.request);
      // print(response.bodyBytes);
    } else {
      // print(jsonObject);
    }
//
//   //
  }
//
//
// static Future<List<Order>> getOrders() async {
//   var products = [];
//
//   var client = http.Client();
//   var response = await client.get(ENDPOINT, headers: {
//     "Authorization":
//         'OAuth oauth_consumer_key="ck_a911e860650dcb256a8d7a286264b4091fc1f48d",oauth_signature_method="HMAC-SHA1",oauth_timestamp="1609655674",oauth_nonce="uAd7yG",oauth_version="1.0",oauth_signature="NbXbC8zfGBvxCUQLQorSgQYoUOk%3D"'
//   });
//   if (response.statusCode == 200) {
//     jsonObject = jsonDecode(response.body);
//     Product product = Product.fromJson(jsonObject);
//     products.add(product);
//     print(jsonObject);
//     print(response.body);
//     return products;
//   } else {
//     // print(jsonObject);
//   }
// }
}
