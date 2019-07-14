import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:housekeeping/core/viewmodels/task_model.dart';
import 'package:housekeeping/ui/views/tasks_page.dart';
import 'package:housekeeping/ui/widgets/appbar.dart';
import '../../core/viewmodels/base_model.dart';
import '../../core/viewmodels/assets_model.dart';
import './base_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:prepley_flutter_app/ui/views/login.dart';
// import '../../core/models/user.dart';

class AssetsPage extends StatefulWidget {
  @override
  _AssetsPageState createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {

  TextEditingController _searchTextFieldController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BaseView<AssetsModel>(onModelReady: (model) {
      //! model.doSomething();
      //! Here we can set the ViewState to busy are and release it to Idle when we get are ready
      // model.doSomething();
      model.fetchAllAssets();
    }, builder: (context, model, child) {
      return Scaffold(
        appBar: appBar(context, backAvailable: true),
        body:
         model.state == ViewState.Busy
            ? Center(
                child: SpinKitChasingDots(color: Color(0xfffd5f00)),
              )
            : 
            SafeArea(
                child: Column(
                children: <Widget>[

                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        style: TextStyle(fontSize: 18),
                        controller: _searchTextFieldController,
                        onChanged: (text){
                          model.onSearchTextChanged(text);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(15, 17, 15, 15),
                          prefixIcon: Icon(
                            Icons.search,
                          ),

                          //Add th Hint text here.
                          hintText: "Search for Assets",
                          hintStyle: TextStyle(fontSize: 18),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.4),
                                width: 1.5),
                          ),
                        ),
                      ),
                    ),


                  Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(8.0),
                        children: <Widget>[
                          
                          for(var data in model.assetsDataJson)
                            assetsCard(context, data),
                          
                        ],
                      ),
                    )

                ],
              )
          ),
      );
    });
  }

  
  Widget assetsCard(context, data) {

    return GestureDetector(
        onTap: (){
          if(data.isActive){
            Route route =
              MaterialPageRoute(builder: (context) => TaskPage(assetId: data.sId));
          Navigator.push(context, route);
          print(data.sId);
          }
        },

        child: Container(

          foregroundDecoration: 
          data.isActive ?
          BoxDecoration()
          :
          BoxDecoration(
              color: Colors.grey,
              backgroundBlendMode: BlendMode.saturation,
            ),

          child: Card(

            shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10.0),
                   ),
                   
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Card Image
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    placeholder: "assets/images/food-load-7.gif",
                    image: data.image,
                  ),

                ),

                //SizedBox(height: 20,),

                // Restaurant Name
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
                  child: Text(
                    data.name.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),

                // Restaurant Details

                // Padding(
                //   padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       Row(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: <Widget>[
                //           Icon(
                //             Icons.star,
                //             color: Color(0xffFFD700),
                //             size: 20,
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                //             child: Text(
                //               (next(42,47)/10).toString(),
                //               style: TextStyle(
                //                   fontSize: 17,
                //                   fontWeight: FontWeight.w700,
                //                   color: Colors.black.withOpacity(0.5)),
                //             ),
                //           )
                //         ],
                //       ),
                //       Row(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: <Widget>[
                //           Icon(
                //             Icons.watch_later,
                //             color: Colors.blue,
                //             size: 20,
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                //             child: Text(
                //               data.opensAt + " - " + data.closesAt,
                //               style: TextStyle(
                //                   fontSize: 17,
                //                   fontWeight: FontWeight.w700,
                //                   color: Colors.black.withOpacity(0.5)),
                //             ),
                //           )
                //         ],
                //       ),
                //       Row(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: <Widget>[
                //           for( var i = 0 ; i <= next(0,3); i++ )
                //             Icon(
                //               Icons.monetization_on,
                //               color: Colors.green,
                //               size: 20,
                //             ),
                          
                //           // Padding(
                //           //   padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                //           //   child: Text(
                //           //     "Free",
                //           //     style: TextStyle(
                //           //         fontSize: 17,
                //           //         fontWeight: FontWeight.w700,
                //           //         color: Colors.black.withOpacity(0.5)),
                //           //   ),
                //           // )
                //         ],
                //       ),

                //       // Row(
                //       //   crossAxisAlignment: CrossAxisAlignment.center,
                //       //   children: <Widget>[
                //       //     Icon(
                //       //       Icons.location_on,
                //       //       color: Colors.blue,
                //       //       size: 20,
                //       //     ),
                //       //     Padding(
                //       //       padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                //       //       child: Text(
                //       //         "Potheri",
                //       //         style: TextStyle(
                //       //             fontSize: 17,
                //       //             fontWeight: FontWeight.w700,
                //       //             color: Colors.black.withOpacity(0.5)),
                //       //       ),
                //       //     )
                //       //   ],
                //       // ),


                //     ],
                //   ),
                // )
              
              
              
              ],
            ),
          ),
        ),
    );
  

  }






}
