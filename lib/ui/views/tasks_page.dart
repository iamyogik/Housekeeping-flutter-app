import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:housekeeping/core/viewmodels/task_model.dart';
import 'package:housekeeping/ui/views/allocation_confirmed.dart';
import 'package:housekeeping/ui/widgets/appbar.dart';
import '../../core/viewmodels/base_model.dart';
import './base_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class TaskPage extends StatefulWidget {
  final String assetId;
  TaskPage({this.assetId});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {



  @override
  Widget build(BuildContext context) {
    return BaseView<TaskModel>(onModelReady: (model) {
      //! model.doSomething();
      //! Here we can set the ViewState to busy are and release it to Idle when we get are ready
      model.fetchAllTasks(widget.assetId);
    }, builder: (context, model, child) {
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
                      // onChanged: (text) {
                      //   model.onSearchTextChanged(text);
                      // },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 17, 15, 15),
                        prefixIcon: Icon(
                          Icons.search,
                        ),

                        //Add th Hint text here.
                        hintText: "Search for Tasks",
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
                        for (var data in model.tasksDataJson)
                          taskCard(context, data, widget.assetId),
                      ],
                    ),
                  )
                ],
              )),
      );
    });
  }

  Widget taskCard(context, data, assetId) {
    final model = Provider.of<TaskModel>(context);

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
                      data.name,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),

                    Spacer(
                      flex: 1,
                    ),

                    Text(
                      data.description.toString(),
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
                        for (var skill in data.skills)
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
                                (data.time / 3600).toInt().toString() + "hrs",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            )
                          ],
                        ),
                        Material(
                          color: Color(0xfffd5f00),
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () async {
                               model.getWorkers(data.sId);
                              _settingModalBottomSheet(context, assetId, data.sId, data, model);
                            },
                            child: Container(
                              height: 40,
                              //padding: EdgeInsets.fromLTRB(10,5,10,5),
                              width: 130,

                              child: Center(
                                child: Text(
                                  "Allocate",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Spacer(
                      flex: 1,
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

  void _settingModalBottomSheet(context, assetId, taskId, data, model) async{

    bool loading = true;



  bool check2(setStateNew){
    if(model.workersDataJson.length == 0){
      return false;
    }else{

      if(this.mounted){
          setStateNew((){
          loading = false;
        });
      }


    return true;

    }
  }


  void checkData(setStateNew){
    try {

      // RestartableTimer _timer = new RestartableTimer(Duration(seconds: 3), _startNewPage);

      Timer(Duration(seconds: 3), () {
     if(check2(setStateNew)){

     }else{
       checkData(setStateNew);
     }
      
    });
    } catch(e) {


    }

  }


  
    

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {

         
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setStateNew){

                checkData(setStateNew);

            
              return model.workersDataJson.length == 0
                ? Center(
                    child: SpinKitChasingDots(color: Color(0xfffd5f00)),
                  )
                : 
                
                Container(
                // height: 200,
                child: Column(
                  children: <Widget>[

                    Container(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                      alignment: Alignment.center,
                      child: Text(
                        "Choose a Worker",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),

                     Expanded(
                       child: ListView(
                        //  shrinkWrap: true,
                         padding: const EdgeInsets.all(8.0),
                         children: <Widget>[
                          
                          for (var data in model.workersDataJson)

                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child:Card(
                                child: Material(
                                  child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {

                                    // print("HIi");
                                    Route route =
                                        MaterialPageRoute(builder: (context) => AllocationConfirmationPage(assetId: assetId, taskId: taskId, workerId: data.sId));
                                    Navigator.push(context, route);
                                  },
                                    child: Row(
                             children: <Widget>[

                                  //  Spacer(flex: 1,),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(25,0,0, 0),
                                    child: Center(
                                      child: Image(
                                        width: 30,
                                        //height: 300,
                                        fit: BoxFit.cover,
                                        image: AssetImage("assets/images/avatar.png"),
                                        // image: AssetImage("assets/images/food-img-1.jpg"),
                                      ),
                                      ),
                                  ),

                                    // Spacer(flex: 2,),


                                     Container(
                                       padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                       child: Text(
                                         data.name.toString(),
                                         style: TextStyle(
                                           fontWeight: FontWeight.w600,
                                           fontSize: 22
                                         ),
                                       ),
                                     ),

                                      // Spacer(flex: 1,),


                             ],
                           ),
                                  ),
                                ),
                              ),
                              
                              )
                            
                          

                          //  ListTile(
                          //  leading: new Icon(Icons.music_note),
                          //  title: new Text('Music'),
                          //  onTap: () => {}),ListTile(
                          //  leading: new Icon(Icons.music_note),
                          //  title: new Text('Music'),
                          //  onTap: () => {}),ListTile(
                          //  leading: new Icon(Icons.music_note),
                          //  title: new Text('Music'),
                          //  onTap: () => {}),ListTile(
                          //  leading: new Icon(Icons.music_note),
                          //  title: new Text('Music'),
                          //  onTap: () => {}),ListTile(
                          //  leading: new Icon(Icons.music_note),
                          //  title: new Text('Music'),
                          //  onTap: () => {}),ListTile(
                          //  leading: new Icon(Icons.music_note),
                          //  title: new Text('Music'),
                          //  onTap: () => {}),ListTile(
                          //  leading: new Icon(Icons.music_note),
                          //  title: new Text('Music'),
                          //  onTap: () => {}),ListTile(
                          //  leading: new Icon(Icons.music_note),
                          //  title: new Text('Music'),
                          //  onTap: () => {}),ListTile(
                          //  leading: new Icon(Icons.music_note),
                          //  title: new Text('Music'),
                          //  onTap: () => {}),ListTile(
                          //  leading: new Icon(Icons.music_note),
                          //  title: new Text('Music'),
                          //  onTap: () => {}),ListTile(
                          //  leading: new Icon(Icons.music_note),
                          //  title: new Text('Music'),
                          //  onTap: () => {}),



                         ],
                       ),
                     ),
                  ],
                ),
              );
            }
          );
        });
  }
}
