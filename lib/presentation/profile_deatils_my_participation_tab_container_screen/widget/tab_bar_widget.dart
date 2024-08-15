import 'package:flutter/material.dart';

import '../../profile_deatils_my_participation_page/profile_deatils_my_participation_page.dart';

class GoalValueScreen extends StatefulWidget {
  @override
  State<GoalValueScreen> createState() => _GoalValueScreenState();
}

class _GoalValueScreenState extends State<GoalValueScreen> {
  List<Tab> tabs = [
    Tab(child: Text("Details")),
    Tab(child: Text("Txn History")),
    // Tab(child: Text("Documents")),
    // Tab(child: Text("Auctions")),
  ];

  List<Widget> tabsContent = [
    ProfileDeatilsMyParticipationPage(),
    Container(child: ProfileDeatilsMyParticipationPage()),
    // Container(child: DocumentScreen()),
    // Container(child: AuctionScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[700],
            centerTitle: true,
            // brightness: Brightness.dark,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: TabBar(
                indicatorColor: Colors.white,
                isScrollable: true,
                tabs: tabs,
              ),
            ),

            // actions: [Center(
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(0,0,8,0),
            //     child: InkWell(
            //       onTap: (){},
            //       child: Text(
            //         'Member Details',
            //         textScaleFactor: 1.5,
            //         style: TextStyle(
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //   ),
            // )
            actions: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(255, 247, 245, 245),
                      ),
                      borderRadius: BorderRadius.circular(30)),
                  color: Color.fromARGB(255, 223, 235, 245),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.black,
                      ),
                      Text(" Member Details"),
                    ],
                  ),
                ),
              ),
            ],

            //   child: MaterialButton(
            //                                         shape: RoundedRectangleBorder(
            //                                             side: BorderSide(
            //                                               color: Color.fromARGB(
            //                                                   255, 247, 245, 245),
            //                                             ),
            //                                             borderRadius:
            //                                                 BorderRadius.circular(
            //                                                     20)),
            //                                         color: Color.fromARGB(
            //                                             255, 223, 235, 245),
            //                                         onPressed: () {

            //                                         },
            //                                         child: Text(
            //                                            "Member details",
            //                                       ),
            // )
          ),
          body: TabBarView(
            children: tabsContent,
          ),
        ));
  }
}
