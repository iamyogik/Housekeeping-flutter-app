import 'dart:async';

import 'package:flutter/material.dart';
import 'package:housekeeping/core/viewmodels/allocation_confirmation.dart';
import 'package:housekeeping/core/viewmodels/base_model.dart';
import 'package:housekeeping/ui/views/workers_page.dart';
import 'package:housekeeping/ui/widgets/appbar.dart';
import './base_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';




class AllocationConfirmationPage extends StatefulWidget {
  final String assetId;
  final String taskId;
  final String workerId;
  AllocationConfirmationPage({this.assetId, this.taskId, this.workerId});

  @override
  _AllocationConfirmationPageState createState() => _AllocationConfirmationPageState();
}

class _AllocationConfirmationPageState extends State<AllocationConfirmationPage> {


  @override
  Widget build(BuildContext context) {
    return BaseView<AllocationConfirm>(onModelReady: (model) {

      print(widget.assetId);
      print(widget.taskId);
      print(widget.workerId);


      model.sendAllocationRequest(widget.assetId, widget.taskId, widget.workerId);
      

    }, builder: (context, model, child) {
      return Scaffold(
        appBar: appBar(context, backAvailable: true),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: 
          model.state == ViewState.Busy ?
          Center(
            child: SpinKitChasingDots(color: Color(0xfffd5f00)),
          )
          :
          acceptedScreen(model),
        ),
      );
    });
  }



  Widget acceptedScreen(model) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // SizedBox(
          //   height: 50,
          // ),

          Spacer(
            flex: 5,
          ),

          Center(
            child: Text(
              "Task Status",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 25,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w800),
            ),
          ),

          Center(
            child: Text(
              model.allocationDataJson.timeOfAllocation.toString(),
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),



          Spacer(
            flex: 8,
          ),

          Center(
            child: Image(
              width: 120,
              //height: 300,
              fit: BoxFit.cover,
              image: AssetImage("assets/images/4.png"),
              // image: AssetImage("assets/images/food-img-1.jpg"),
            ),
          ),

          // SizedBox(
          //   height: 80,
          // ),

          Spacer(
            flex: 8,
          ),

          Center(
            child: Text(
              "Task Allocated",
              style: TextStyle(
                  color: Colors.green.withOpacity(0.9),
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
            ),
          ),

          SizedBox(
            height: 5,
          ),


          Center(
            child: Container(
              width: 250,
              child: Text(
                "Task to be completed by:",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),

          SizedBox(
            height: 5,
          ),

          // SizedBox(
          //   height: 30,
          // ),

          Spacer(
            flex: 3,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.watch_later,
                size: 25,
                color: Colors.green,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                model.allocationDataJson.completionByTime.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),

          // SizedBox(
          //   height: 120,
          // ),

          
          Spacer(
            flex: 9,
          ),



          Spacer(
            flex: 3,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: ()  {
                  Route route =
                    MaterialPageRoute(builder: (context) => WorkersPage());
                Navigator.push(context, route);

                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: new Border.all(
                        color: Color(0xfffd5f00),
                        style: BorderStyle.solid,
                        width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Center(
                          child: new Text(
                            'See all Task of Workers',
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

       

          Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }






}
