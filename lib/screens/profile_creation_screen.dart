import 'package:flutter/material.dart';

import 'home_screen.dart';

class ProfileCreationScreen extends StatefulWidget {
  const ProfileCreationScreen({super.key});

  @override
  State<ProfileCreationScreen> createState() => _ProfileCreationScreenState();
}

class _ProfileCreationScreenState extends State<ProfileCreationScreen> {

  // Controller for Full Name input
  TextEditingController nameController = TextEditingController();

  // Variables to store user selections
  String selectedGender = "";
  String selectedBirthday = "";
  int selectedAge = 18;

  // Function when user presses Complete Profile
  void completeProfile() {

    String name = nameController.text;

    if(name.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter your name"),
        ),
      );
      return;
    }

    // Show confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profile Created Successfully"),
      ),
    );

    //TODO: 1. REMEMBER TO IMPLEMENT THE PRINT AND THEN REMOVE IT
    // 2. REMEMBER TO IMPLEMENT FUNCTION TO ADD PROFILE PICTURE
    // 3. REMEMBER TO IMPLEMENT SAFEGUARD SETTING TO MAKE SURE THAT ALL FIELDS ARE SELECTED OR FILLED, NOT ONLY FULL NAME
    // Later you will send this data to your backend
    print(name);
    print(selectedAge);
    print(selectedGender);
    print(selectedBirthday);

    Future.delayed(const Duration(seconds: 2), () {

      Navigator.pushReplacement(context,MaterialPageRoute(
        builder: (context) => const HomeScreen(),
        ),
      );

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(

        children: [

          // BACKGROUND IMAGE
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // DARK OVERLAY
          Container(
            color: Colors.black.withOpacity(0.45),
          ),

          SafeArea(

            child: SingleChildScrollView(

              child: Padding(

                padding: const EdgeInsets.symmetric(horizontal: 24),

                child: Column(

                  children: [

                    const SizedBox(height: 20),

                    // Top Bar
                    Row(

                      children: [

                        Row(
                          children: [

                            Image.asset(
                              "assets/images/vibely_icon.jpg",
                              height: 24,
                            ),

                            const SizedBox(width:8),

                            const Text(
                              "VIBELY",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),

                        const Spacer()

                      ],
                    ),

                    const SizedBox(height:30),

                    const Text(
                      "Create Your Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height:10),

                    const Text(
                      "Let's set up your account",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height:40),

                    // PROFILE PHOTO BUTTON
                    Container(

                      height: 140,
                      width: 140,

                      decoration: BoxDecoration(

                        shape: BoxShape.circle,

                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF7B3BFF),
                            Color(0xFFFF4D8D),
                          ],
                        ),

                      ),

                      child: Center(

                        child: Container(

                          height: 110,
                          width: 110,

                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),

                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 40,
                          ),

                        ),

                      ),
                    ),

                    const SizedBox(height:40),

                    // FULL NAME FIELD
                    TextField(

                      controller: nameController,

                      style: const TextStyle(color: Colors.white),

                      decoration: InputDecoration(

                        hintText: "Full Name",
                        hintStyle: const TextStyle(color: Colors.white54),

                        prefixIcon: const Icon(Icons.person,color: Colors.white54),

                        filled: true,
                        fillColor: const Color(0xFF1B1534),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),

                      ),
                    ),

                    const SizedBox(height:20),

                    // AGE TILE
                    ListTile(

                      tileColor: const Color(0xFF1B1534),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),

                      leading: const Icon(Icons.cake,color: Colors.white54),

                      title: const Text(
                        "Age",
                        style: TextStyle(color: Colors.white),
                      ),

                      subtitle: Text(
                        "Selected: $selectedAge",
                        style: const TextStyle(color: Colors.white54),
                      ),

                      trailing: const Icon(Icons.arrow_forward_ios,color: Colors.white54),

                      onTap: (){
                        selectAge();
                      },

                    ),

                    const SizedBox(height:15),

                    // GENDER TILE
                    ListTile(

                      tileColor: const Color(0xFF1B1534),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),

                      leading: const Icon(Icons.male,color: Colors.white54),

                      title: const Text(
                        "Gender",
                        style: TextStyle(color: Colors.white),
                      ),

                      subtitle: Text(
                        selectedGender.isEmpty ? "Select your gender" : selectedGender,
                        style: const TextStyle(color: Colors.white54),
                      ),

                      trailing: const Icon(Icons.arrow_forward_ios,color: Colors.white54),

                      onTap: (){
                        selectGender();
                      },

                    ),

                    const SizedBox(height:15),

                    // BIRTHDAY TILE
                    ListTile(

                      tileColor: const Color(0xFF1B1534),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),

                      leading: const Icon(Icons.calendar_today,color: Colors.white54),

                      title: const Text(
                        "Birthday",
                        style: TextStyle(color: Colors.white),
                      ),

                      subtitle: Text(
                        selectedBirthday.isEmpty ? "Select your birthday" : selectedBirthday,
                        style: const TextStyle(color: Colors.white54),
                      ),

                      trailing: const Icon(Icons.arrow_forward_ios,color: Colors.white54),

                      onTap: (){
                        selectBirthday();
                      },

                    ),

                    const SizedBox(height:30),

                    // COMPLETE PROFILE BUTTON
                    GestureDetector(

                      onTap: completeProfile,

                      child: Container(

                        height: 55,
                        width: double.infinity,

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(30),

                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF7B3BFF),
                              Color(0xFFFF4D8D),
                            ],
                          ),

                        ),

                        child: const Center(
                          child: Text(
                            "Complete Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      ),
                    ),

                    const SizedBox(height:20),

                    const Text(
                      "Privacy Policy • Terms of Service",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height:40),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // AGE SELECTION DIALOG
  void selectAge(){

    showDialog(
      context: context,
      builder: (context){

        return AlertDialog(

          title: const Text("Select Age"),

          content: SizedBox(

            height:200,

            child: ListView.builder(

              itemCount: 83,

              itemBuilder:(context,index){

                int age = index + 18;

                return ListTile(

                  title: Text("$age"),

                  onTap:(){

                    setState(() {
                      selectedAge = age;
                    });

                    Navigator.pop(context);

                  },

                );

              },
            ),
          ),
        );

      },
    );

  }

  // GENDER SELECTION
  void selectGender(){

    showDialog(

      context: context,

      builder:(context){

        return AlertDialog(

          title: const Text("Select Gender"),

          content: Column(

            mainAxisSize: MainAxisSize.min,

            children: [

              ListTile(
                title: const Text("Male"),
                onTap: (){
                  setState(() {
                    selectedGender = "Male";
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: const Text("Female"),
                onTap: (){
                  setState(() {
                    selectedGender = "Female";
                  });
                  Navigator.pop(context);
                },
              ),

            ],
          ),
        );

      },

    );

  }

  // BIRTHDAY PICKER
  void selectBirthday() async{

    DateTime? pickedDate = await showDatePicker(

      context: context,

      initialDate: DateTime(2000),

      firstDate: DateTime(1950),

      lastDate: DateTime.now(),

    );

    if(pickedDate != null){

      setState(() {

        selectedBirthday =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";

      });

    }

  }

}
