import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:housekeeping/core/viewmodels/worker_task.dart';
import 'package:housekeeping/ui/widgets/appbar.dart';
import '../../core/viewmodels/base_model.dart';
import './base_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:prepley_flutter_app/ui/views/login.dart';
// import '../../core/models/user.dart';



class WorkerTaskPage extends StatefulWidget {
  final String workerId;
  WorkerTaskPage({this.workerId});

  @override
  _WorkerTaskPageState createState() => _WorkerTaskPageState();
}

class _WorkerTaskPageState extends State<WorkerTaskPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<WorkersTaskModel>(
      onModelReady: (model) {
        //! model.doSomething();
        //! Here we can set the ViewState to busy are and release it to Idle when we get are ready
        model.getAllTaskOfWorker(widget.workerId);
      },
      builder: (context, model, child) {
        return Scaffold(
        appBar: appBar(context, backAvailable: true),
        body: model.state == ViewState.Busy
            ? Center(
                child: SpinKitChasingDots(color: Color(0xfffd5f00)),
              )
            : SafeArea(
                child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      style: TextStyle(fontSize: 18),
                      // controller: _searchTextFieldController,
                      onChanged: (text) {
                        model.onSearchTextChanged(text);
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 17, 15, 15),
                        prefixIcon: Icon(
                          Icons.search,
                        ),

                        //Add th Hint text here.
                        hintText: "Search for Task",
                        hintStyle: TextStyle(fontSize: 18),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.4), width: 1.5),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8.0),
                      children: <Widget>[
                        for (var data in model.allocatedTaskDataJson)
                         taskCard(context, data),
                      ],
                    ),
                  )
                ],
              )),
      );
      }
    );
  }

   Widget taskCard(context, data) {
    // final model = Provider.of<TaskModel>(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                height: 200,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Menu Item name

                    Spacer(
                      flex: 1,
                    ),

                    Text(
                      data.taskData.name,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),

                    Spacer(
                      flex: 1,
                    ),

                    Text(
                      data.taskData.description.toString(),
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),

                    Spacer(
                      flex: 3,
                    ),

                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 5,
                      runSpacing: 5,
                      children: <Widget>[
                        for (var skill in data.taskData.skills)
                          Container(
                            padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Text(
                              skill.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                      ],
                    ),

                    Spacer(
                      flex: 4,
                    ),

                    // Spacer(
                    //   flex: 1,
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.watch_later,
                              color: Colors.green,
                              size: 20,
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                              child: Text(
                                // (data.time / 3600).toInt().toString() + "hrs",
                               "FROM : ",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.green.withOpacity(0.9)),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                              child: Text(
                                // (data.time / 3600).toInt().toString() + "hrs",
                                data.timeOfAllocation.toString(),
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            )
                          ],
                        ),
                       
                       
                        // Material(
                        //   color: Color(0xfffd5f00),
                        //   borderRadius: BorderRadius.circular(10),
                        //   child: InkWell(
                        //     borderRadius: BorderRadius.circular(10),
                        //     onTap: () async {
                        //       //  model.getWorkers(data.sId);
                        //       // _settingModalBottomSheet(context, assetId, data.sId, data, model);
                        //     },
                        //     child: Container(
                        //       height: 40,
                        //       //padding: EdgeInsets.fromLTRB(10,5,10,5),
                        //       width: 130,

                        //       child: Center(
                        //         child: Text(
                        //           "Allocate",
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontSize: 18,
                        //               fontWeight: FontWeight.w700),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      
                      
                      
                      
                      
                      
                      ],
                    ),

                    Spacer(
                      flex: 1,
                    ),

                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.watch_later,
                              color: Colors.green,
                              size: 20,
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                              child: Text(
                                // (data.time / 3600).toInt().toString() + "hrs",
                               "UPTO : ",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.green.withOpacity(0.9)),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                              child: Text(
                                // (data.time / 3600).toInt().toString() + "hrs",
                                data.completionByTime.toString(),
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            )
                          ],
                        ),
                      
                      
                      
                        Spacer(
                      flex: 1,
                    ),
                      
                      
                      ],
                    ),





                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }






}




