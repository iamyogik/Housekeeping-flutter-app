import 'package:flutter/material.dart';
import 'package:housekeeping/ui/views/assets_page.dart';
import 'package:housekeeping/ui/views/workers_page.dart';
import 'package:provider/provider.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return BaseView<LoginModel>(builder: (context, model, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Welcome To",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Text(
                        "Udaan",
                        style: TextStyle(
                          color: Color(0xff6C63FF),
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Spacer(flex: 2),
              // SizedBox(height: 20),

              Image(
                width: double.infinity,
                image: AssetImage("assets/images/reading-girl-tab.png"),
              ),

              Spacer(flex: 2),

  
              Spacer(flex: 2),

              Buttons(),

              SizedBox(height: 30),

              //Spacer(flex: 1),
            ],
          ),
        ),
      );
    // });
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final model = Provider.of<LoginModel>(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Column(
        children: <Widget>[

          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () async {
                 Route route =
                    MaterialPageRoute(builder: (context) => AssetsPage());
                Navigator.push(context, route);
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: new Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Center(
                        child: new Text(
                          'Go to Assets section',
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
          SizedBox(height: 20),
         
          Material(
            color: Color(0xffE7E8EB),
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Route route =
                    MaterialPageRoute(builder: (context) => WorkersPage());
                Navigator.push(context, route);
              },
              child: Container(
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    //   child: Center(
                    //       child: Icon(
                    //     Icons.mail,
                    //     size: 25,
                    //     color: Colors.black.withOpacity(0.7),
                    //   )),
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Center(
                        child: new Text(
                          'Go to Workers section',
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
          SizedBox(height: 20),
         

        ],
      ),
    );
  }
}
