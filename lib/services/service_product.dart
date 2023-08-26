import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';
import '../model/model_products.dart';
import '../utilities/rest_api_utilities.dart';


class ServiceProduct {
  static var client = http.Client();
  static var duration = Duration(seconds: 20);

  List<ProductsModel> Prayerlist = [];
  Future<ProductsModel> loadProducts() async{
  //  List<ProductsModel> list = [];

    try{
      Map<String, String> header = {};
      Map<String, String> body = {};

      Response response = await client.get(Uri.parse(RestApiUtilities.product_url)).timeout(duration);
      RestApiUtilities.GetPrintHeaderBodyUrlResponse(RestApiUtilities.product_url, header, body, response);

      if(response.statusCode ==200){
        print('Object_response ${response.body}');

        final productsModel = productsModelFromMap(response.body);
        if(productsModel.code ==200){
          return productsModel;
        }else{
          return ProductsModel(code: 200,status: 'Issue 2',data: []);
        }

      }else{
        return ProductsModel(code: 200,status: 'Issue 1',data: []);
      }
    } on TimeoutException {
      print(RestApiUtilities.GetResponseError(420));
      return ProductsModel(code: 200,status: 'Time Out',data: []);
    } on SocketException {
      print(RestApiUtilities.GetResponseError(430));
      return ProductsModel(code: 200,status: 'Internet Issue',data: []);
    } catch (e) {
      print('Error!: ${e.toString()}');
      return ProductsModel(code: 200,status: 'No Data!',data: []);
    }
  }
}