import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_learning/controllers/home_controller.dart';
import 'package:flutter_application_learning/core/wedgets/costom_card.dart';
import 'package:flutter_application_learning/core/wedgets/costom_drawer.dart';
import 'package:flutter_application_learning/models/formation/details_screen.dart';
import 'package:flutter_application_learning/models/formation/formation_model.dart';
import 'package:flutter_application_learning/screens/home/profile/notification_screen.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await GetFormation();
        setState(() {});
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text(
            'E-Learning',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          toolbarHeight: 80,
          toolbarOpacity: 0.8,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          elevation: 0.00,
          backgroundColor: Colors.blueAccent,
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(Icons.account_box),
          ),

          // Adding a notification icon to the top-right
          actions: [
            IconButton(
              icon: Icon(Icons.notification_important_sharp),
              onPressed: () {
                // Navigate to the NotificationScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
            ),
          ],
        ),
        drawer: const CustomDrawer(),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Liste of ',
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              child: GetBuilder<HomeController>(
                  builder: (controller) => FutureBuilder(
                      future: controller.getFormations(),
                      builder: (context, Snapshot) {
                        if (Snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          if (Snapshot.hasData) {
                            if (Snapshot.data!.formations!.isEmpty) {
                              return const Text('No Data');
                            } else if (Snapshot.data!.formations!.isNotEmpty) {
                              return SizedBox(
                                height: MediaQuery.sizeOf(context).height * .2,
                                width: double.infinity,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 0.75,
                                  ),
                                  itemCount: Snapshot.data!.formations!.length,
                                  itemBuilder: (context, index) => CustomCard(
                                    title:
                                        " ${Snapshot.data!.formations![index].nameF}",
                                    description:
                                        "${Snapshot.data!.formations![index].descriptionF}",
                                    duree:
                                        "\n  ${Snapshot.data!.formations![index].dureeF}",
                                    image: "formation.png",
                                    onTap: () => Get.to(
                                      DetailsScreen(
                                        title: "Formation",
                                        name: Snapshot
                                            .data!.formations![index].nameF,
                                        description: Snapshot.data!
                                            .formations![index].descriptionF,
                                        duree: Snapshot
                                            .data!.formations![index].dureeF,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            if (Snapshot.hasError) {
                              return Text(Snapshot.error.toString());
                            }
                          }
                        }
                        return const SizedBox.shrink();
                      })),
            )

            // Expanded(
            //   child: SizedBox(
            //     height: 300,
            //     width: double.infinity,
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: 5,
            //       shrinkWrap: true,
            //       physics: const ClampingScrollPhysics(),
            //       itemBuilder: (context, index) {
            //         return const Card(
            //           child: ListTile(
            //             leading: Icon(Icons.child_care),
            //             title: Text('title Name'),
            //             subtitle:
            //                 Text.rich(TextSpan(text: "description", children: [
            //               TextSpan(
            //                 text: "duree",
            //                 style: TextStyle(
            //                   color: Colors.red,
            //                 ),
            //               )
            //             ])),
            //             trailing: Text("Formateur"),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}