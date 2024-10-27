import 'package:flutter/material.dart';
import 'package:flutter_application_learning/controllers/home_controller.dart';
import 'package:flutter_application_learning/core/wedgets/costom_card_cour.dart';
import 'package:flutter_application_learning/models/cour/cour_model.dart';
import 'package:flutter_application_learning/models/cour/detail_cour_screen.dart';
import 'package:get/get.dart';

class CoursScreen extends StatefulWidget {
  const CoursScreen({super.key});

  @override
  State<CoursScreen> createState() => _CoursScreenState();
}

class _CoursScreenState extends State<CoursScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        GetCour();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cours",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          toolbarHeight: 80,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          elevation: 0.00,
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        drawer: const Drawer(), // Consider removing this if unused
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: GetBuilder<HomeController>(
                builder: (controller) => FutureBuilder(
                  future: controller
                      .getcour(), // Ensure this fetches the correct data
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (snapshot.hasData) {
                      if (snapshot.data!.cours!.isEmpty) {
                        return const Center(
                          child: Text('No Data'),
                        );
                      } else {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: snapshot.data!.cours!.length,
                          itemBuilder: (context, index) => CostomCardCour(
                            title: "${snapshot.data!.cours![index].titreC}",
                            description:
                                "${snapshot.data!.cours![index].descriptionC}",
                            image: "cours.jpg",
                            onTap: () => Get.to(
                              DetailsCourScreen(
                                title: "Cour",
                                titreC: snapshot.data!.cours![index].titreC,
                                descriptionC:
                                    snapshot.data!.cours![index].descriptionC,
                              ),
                            ),
                          ),
                        );
                      }
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
