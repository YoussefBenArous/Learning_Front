import 'package:flutter/material.dart';
import 'package:flutter_application_learning/controllers/Profile_Controller.dart';
import 'package:flutter_application_learning/core/wedgets/costom_input_text.dart';
import 'package:get/get.dart';


class UpdateScreen extends GetView<ProfileController> {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update",
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 80,
        toolbarOpacity: 0.8,
        elevation: 0.0,
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: controller.keyForm2,
            child: Column(
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  // onTap: () async {
                  //   final ImagePicker picker = ImagePicker();
                  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                  //   if (image != null) {
                  //     controller.updateProfilePicture(image.path);
                  //   }
                  // },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: controller.profilePictureUrl != null
                        ? NetworkImage(controller.profilePictureUrl!)
                        : const AssetImage("assets/image/profile.jpg") as ImageProvider,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 18,
                            child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomInputText(
                  controller: controller.nameController,
                  label: 'Name',
                  hintText: "Enter your name",
                  prefixIcon: Icons.account_circle_outlined,
                  borderRadius: BorderRadius.circular(15),
                ),
                const SizedBox(height: 20),
                CustomInputText(
                  controller: controller.emailController,
                  label: 'Email',
                  hintText: "Enter your email",
                  prefixIcon: Icons.email_outlined,
                  borderRadius: BorderRadius.circular(15),
                ),
                const SizedBox(height: 20),
                CustomInputText(
                  controller: controller.phoneNumberController,
                  label: 'Phone Number',
                  hintText: "Enter your phone number",
                  prefixIcon: Icons.phone_android_outlined,
                  borderRadius: BorderRadius.circular(15),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    controller.updateUser(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                    minimumSize: MaterialStateProperty.all(const Size(320, 60)),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 40),
                const Divider(color: Colors.grey),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(Icons.lock, color: Colors.blueAccent),
                  title: const Text("Change Password"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.toNamed('/change-password');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
