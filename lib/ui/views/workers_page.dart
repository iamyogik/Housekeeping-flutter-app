import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:housekeeping/core/viewmodels/workers_model.dart';
import 'package:housekeeping/ui/views/worker_task.dart';
import 'package:housekeeping/ui/widgets/appbar.dart';
import '../../core/viewmodels/base_model.dart';
// import '../../core/viewmodels/homepage_model.dart';
import './base_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:prepley_flutter_app/ui/views/login.dart';
// import '../../core/models/user.dart';



class WorkersPage extends StatefulWidget {
  @override
  _WorkersPageState createState() => _WorkersPageState();
}

class _WorkersPageState extends State<WorkersPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<WorkersModel>(
      onModelReady: (model) {
        //! model.doSomething();
        //! Here we can set the ViewState to busy are and release it to Idle when we get are ready
        model.getAllWorkers();
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
                        hintText: "Search for Worker",
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
                        for (var data in model.workersDataJson)
                          workerCard(context, data),
                      ],
                    ),
                  )
                ],
              )),
      );
      }
    );
  }

Widget workerCard(context, data){

  return Card(
    child: Material(
      child: InkWell(
        onTap: (){
          Route route =
              MaterialPageRoute(builder: (context) => WorkerTaskPage(workerId: data.sId));
          Navigator.push(context, route);
        },
        child: Container(
          height: 100,
          child: Row(
            children: <Widget>[
              
               Padding(
                    padding: const EdgeInsets.fromLTRB(25,0,0, 0),
                    child: Center(
                      child: Image(
                        width: 70,
                        //height: 300,
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/avatar.png"),
                        // image: AssetImage("assets/images/food-img-1.jpg"),
                      ),
                      ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 5, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          data.name.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      
                      Spacer(flex: 1,),

                      
                         Wrap(
                          // direction: Axis.horizontal,
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

                      
                      
                      
                      ],


                    ),
                  )

            ],
          ),
        ),
      ),
    ),
  );

}




}







