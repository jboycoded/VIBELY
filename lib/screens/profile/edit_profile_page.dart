import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../vibely_background.dart';

class EditProfilePage extends StatefulWidget {
  final String name;
  final int age;
  final String country;
  final String bio;
  final String imageUrl;
  final File? imageFile;

  const EditProfilePage({
    super.key,
    required this.name,
    required this.age,
    required this.country,
    required this.bio,
    required this.imageUrl,
    this.imageFile,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController countryController;
  late TextEditingController bioController;

  final _formKey = GlobalKey<FormState>();
  File? _image;

  final List<String> countries = [
    "Nigeria",
    "Ghana",
    "USA",
    "UK",
    "Canada",
    "India",
  ];

  @override
  void initState() {
    super.initState();

    // 🔄 Initialize with existing data
    nameController = TextEditingController(text: widget.name);
    ageController = TextEditingController(text: widget.age.toString());
    countryController = TextEditingController(text: widget.country);
    bioController = TextEditingController(text: widget.bio);

    _image = widget.imageFile;
  }

  // 📸 IMAGE PICKER
  Future<void> pickImage() async {
    final picked =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  // 🌍 COUNTRY PICKER
  void selectCountry() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      builder: (_) {
        return ListView(
          children: countries.map((country) {
            return ListTile(
              title: Text(country,
                  style: const TextStyle(color: Colors.white)),
              onTap: () {
                setState(() {
                  countryController.text = country;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  // 🎂 AGE PICKER
  void selectAge() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      builder: (_) {
        return ListView.builder(
          itemCount: 43, // 18 - 60
          itemBuilder: (_, index) {
            final age = 18 + index;
            return ListTile(
              title: Text("$age",
                  style: const TextStyle(color: Colors.white)),
              onTap: () {
                setState(() {
                  ageController.text = age.toString();
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  // 💾 CONFIRM + SAVE
  void confirmSave() {
    if (!_formKey.currentState!.validate()) return;

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text("Save Changes",
              style: TextStyle(color: Colors.white)),
          content: const Text(
            "Are you sure you want to update your profile?",
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel",
                  style: TextStyle(color: Colors.grey)),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("Yes",
                  style: TextStyle(color: Colors.pinkAccent)),
              onPressed: () {
                Navigator.pop(context);
                
                // 🔄 Return updated data
                Navigator.pop(context, {
                  "name": nameController.text,
                  "age": int.parse(ageController.text),
                  "country": countryController.text,
                  "bio": bioController.text,
                  "imageFile": _image, // File?
                  "imageUrl": widget.imageUrl, // fallback
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VibelyBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // 🔙 Header
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back,
                            color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Edit Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // 👤 PROFILE IMAGE
                  GestureDetector(
                    onTap: pickImage,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: _image != null
                              ? FileImage(_image!)
                              : AssetImage(widget.imageUrl) as ImageProvider,
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Colors.pinkAccent,
                                Colors.purple
                              ],
                            ),
                          ),
                          child: const Icon(Icons.edit,
                              color: Colors.white, size: 16),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  Expanded(
                    child: ListView(
                      children: [
                        inputField(
                          "Name",
                          nameController,
                          validator: (value) =>
                              value!.isEmpty ? "Enter your name" : null,
                        ),

                        // 🎂 AGE PICKER FIELD
                        GestureDetector(
                          onTap: selectAge,
                          child: AbsorbPointer(
                            child: inputField("Age", ageController),
                          ),
                        ),

                        // 🌍 COUNTRY PICKER
                        GestureDetector(
                          onTap: selectCountry,
                          child: AbsorbPointer(
                            child:
                                inputField("Country", countryController),
                          ),
                        ),

                        inputField(
                          "Bio",
                          bioController,
                          maxLines: 3,
                          validator: (value) => value!.length > 120
                              ? "Max 120 characters"
                              : null,
                        ),
                      ],
                    ),
                  ),

                  // 💾 SAVE BUTTON
                  GestureDetector(
                    onTap: confirmSave,
                    child: Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.pinkAccent,
                            Colors.purple
                          ],
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Save Changes",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
    );
  }

  // 🔹 INPUT FIELD
  Widget inputField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: validator,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle:
              const TextStyle(color: Colors.white70),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
