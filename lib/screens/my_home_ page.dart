import 'package:flutter/material.dart';
import '../model/model_products.dart';
import '../services/service_product.dart';
import '../utilities/app_assets.dart';
import '../utilities/rest_api_utilities.dart';
// import 'package:sqlite/products/model/model_post.dart';
// import 'package:sqlite/products/services/service_product.dart';
// import 'package:sqlite/utilities/app_assets.dart';
// import 'package:sqlite/utilities/rest_api_utilities.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<ProductsModel>? _future_list;

  void initState() {
    super.initState();
    setState(() {
      _future_list = ServiceProduct().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('APIs'),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child:  FutureBuilder(
            future: _future_list,
            builder: (BuildContext context,
                AsyncSnapshot<ProductsModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: RestApiUtilities.ShowLoadingView(context),
                );
              } else if (snapshot.hasError) {
                  return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(fontSize: 20),
                      ));
                } else if (snapshot.hasData) {
                  List<Datum> list = snapshot.data!.data!;
                  if (list.length > 0) {
                    return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, index) {
                          return
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                child: Card(
                                  child:  Column(
                                  children: [
                                    Text('Fajar Nemaz Timing: ${list[index].timings!.fajr.toString()}'),
                                    Text('Duhur Nemaz Timing: ${list[index].timings!.dhuhr.toString()}'),
                                    Text('Asr Nemaz Timing: ${list[index].timings!.asr.toString()}'),
                                    Text('Maghrib Nemaz Timing: ${list[index].timings!.maghrib.toString()}'),
                                    Text('Isha Nemaz Timing: ${list[index].timings!.isha.toString()}'),
                                SizedBox(height: 10,)
                                  ],

                          ),

                                ),

                                decoration: const BoxDecoration(
                                  boxShadow: [
                                     BoxShadow(
                                      color: Colors.lightGreen,
                                      blurRadius: 5,
                                    ),

                                  ],
                                ),

                              ),
                            );

                         /*   ListTile(
                            onTap: (){
                              RestApiUtilities.ShowLoadingViewDialog(context);

                            },

                            title: Text('Fajar Nemaz Timing: ${list[index].timings!.fajr.toString()}'),
                            //Text('${list[index].title}'),
                            subtitle: Text('Duhur Nemaz Timing: ${list[index].timings!.dhuhr.toString()}'),
                            //Text('${list[index].description}'),
                          );   */
                        });
                  } else {
                    return Center(
                        child: RestApiUtilities.ShowErrorWithReloadView(context,AppAssets.internet_issue, '${snapshot.data!.status}', (){
                          setState(() {
                            _future_list = ServiceProduct().loadProducts();
                          });
                        }));
                  }
                } else {
                  return SizedBox();
                }
              }
          ),
          ),);

  }
}
