import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'app_assets.dart';

class RestApiUtilities {
  // static String url = 'https://fakestoreapi.com/products';    // Production
  //https://fakestoreapi.com/
  //http://api.aladhan.com/v1/calendar?latitude=51.508515&longitude=-0.1254872&method=2&month=4&year=2017
  static String url = 'https://webhook.site/'; // Develp

  static final String product_url = '${url}17f6580e-cf1e-4e6f-b71d-83a332d247f0';

  static final error_404 = 'Resouce Not Found!';
  static final error_401 = 'Un Authorize Error!';
  static final error_time_out = 'Time Out Error!';
  static final error_internet_issue = 'You are Not Connected to Internet!';
  static final error_unknown = 'UnKnown Error!';

  static String GetResponseError(int status) {
    switch (status) {
      case 404:
        return error_404;
      case 401:
        return error_401;
      case 420:
        return error_time_out;
      case 430:
        return error_internet_issue;
      default:
        return error_unknown;
    }
  }

  static void GetPrintHeaderBodyUrlResponse(url, header, body, response) {
    print('GetResponse: Url : $url');
    print('GetResponse: header : $header');
    print('GetResponse: body : $body');
   print('GetResponse: response : ${response.statusCode}, ${response.body}');
  }

  static Widget ShowLoadingView(BuildContext context) {
    return Container(
      height: 145,
      width: 145,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Lottie.asset(AppAssets.loading_view),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Loading Data',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }

  static ShowLoadingViewDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Center(
          child: ShowLoadingView(context),
        ));
  }

  static Widget ShowMessageView(BuildContext context, String path, String title) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Lottie.asset(path),
          ),
          SizedBox(height: 10,),
          Text('$title',style: TextStyle(fontSize: 18),)
        ],
      ),
    );
  }

  static Widget ShowErrorWithReloadView(context, path, title, onTap) {
    return Container(
        child: Column(children: [
          ShowMessageView(context, path, title),
          TextButton(onPressed: onTap, child: Text('Reload...'))
        ],)
    );
  }
}
