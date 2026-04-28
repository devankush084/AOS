import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      notifications = prefs.getBool('notifications') ?? true;
      darkMode = prefs.getBool('darkMode') ?? false;
    });
  }

  Future<void> _savePrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications', notifications);
    await prefs.setBool('darkMode', darkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF5F6FA), Color(0xFFEDE7F6)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          elevation: 0,
          backgroundColor: Color(0xff8358FE),
          centerTitle: true,
          title: const Text(
            "Settings",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          children: [
            _profileSection(),
            const SizedBox(height: 20),
            _settingsCard("Account", [
              _item(Icons.person, "Edit Profile", onTap: () {
                _showEditProfileBottomSheet(context);
              }),
              _item(Icons.lock, "Change Pin"),
              _item(Icons.security, "Privacy Settings"),
            ]),
            const SizedBox(height: 20),
            _settingsCard("Preferences", [
              _switchItem(Icons.notifications, "Notifications", notifications,
                  (v) {
                setState(() => notifications = v);
                _savePrefs();
              }),

            ]),
            const SizedBox(height: 20),
            _settingsCard("Support", [
              _item(Icons.help, "Help Center", onTap: () {
                _showHelpCenter(context);
              }),
              _item(Icons.feedback, "Send Feedback", onTap: () {
                _showFeedbackDialog(context);
              }),
              _item(Icons.info, "About App", onTap: () {
                _showAboutApp(context);
              }),
            ]),
            const SizedBox(height: 20),
            _settingsCard("Others", [
              _item(Icons.logout, "Logout", onTap: () {
                _showLogoutDialog(context);
              }),
            ]),
          ],
        ),
      ),
    );
  }

  // ---------------- UI ----------------

  Widget _profileSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xff8358FE), width: 2),
            ),
            child: const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
            ),
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Amina Bello",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Flutter Developer", style: TextStyle(color: Colors.grey)),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  Widget _settingsCard(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                color: Color(0xff8358FE), fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        Container(
          decoration: _cardDecoration(),
          child: Column(children: children),
        )
      ],
    );
  }

  Widget _item(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color(0xff8358FE),
      ),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap ??
          () => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("$title clicked"))),
    );
  }

  Widget _switchItem(
      IconData icon, String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(title),
      secondary: Icon(
        icon,
        color: Color(0xff8358FE),
      ),
      activeColor: Color(0xff8358FE),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
        )
      ],
    );
  }

  // ---------------- LOGOUT ----------------

  void _showLogoutDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// 🔥 HANDLE
              Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height: 20),

              /// 🔥 ICON (VISUAL FOCUS)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 28,
                ),
              ),

              const SizedBox(height: 16),

              /// 🔥 TITLE
              const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 6),

              /// 🔥 SUBTEXT
              const Text(
                "Are you sure you want to logout from your account?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 20),

              /// 🔥 BUTTONS
              Row(
                children: [

                  /// CANCEL
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                  ),

                  const SizedBox(width: 10),

                  /// LOGOUT
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff8358FE),
                        minimumSize: const Size.fromHeight(50),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);

                        _showGlassSuccess(context, "Logged out successfully");

                        // 🔥 Add real logout logic here
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
  // ---------------- EDIT PROFILE (ADVANCED) ----------------

  void _showEditProfileBottomSheet(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final name = TextEditingController(text: "Amina Bello");
    final email = TextEditingController(text: "abc@gmail.com");
    final phone = TextEditingController(text: "+919999999999");
    final address = TextEditingController(text: "India");

    File? selectedImage;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        /// Drag handle
                        Container(
                            height: 5, width: 50, color: Colors.grey[300]),
                        const SizedBox(height: 20),

                        const Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 20),

                        /// 🔥 PROFILE IMAGE PICKER
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 45,
                              backgroundImage: selectedImage != null
                                  ? FileImage(selectedImage!)
                                  : const NetworkImage(
                                          "https://i.pravatar.cc/300")
                                      as ImageProvider,
                            ),
                            GestureDetector(
                              onTap: () async {
                                final picker = ImagePicker();
                                final picked = await picker.pickImage(
                                    source: ImageSource.gallery);
                                if (picked != null) {
                                  setState(() {
                                    selectedImage = File(picked.path);
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Color(0xff8358FE),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.camera_alt,
                                    color: Colors.white, size: 18),
                              ),
                            )
                          ],
                        ),

                        const SizedBox(height: 20),

                        /// NAME
                        _validatedField(
                          "Full Name",
                          name,
                          validator: (v) {
                            if (v == null || v.trim().isEmpty)
                              return "Name required";
                            if (v.length < 3) return "Minimum 3 characters";
                            return null;
                          },
                        ),

                        const SizedBox(height: 12),

                        /// EMAIL
                        _validatedField(
                          "Email",
                          email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) {
                            if (v == null || v.isEmpty) return "Email required";
                            if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$')
                                .hasMatch(v)) {
                              return "Invalid email";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 12),

                        /// PHONE
                        _validatedField(
                          "Phone",
                          phone,
                          keyboardType: TextInputType.phone,
                          validator: (v) {
                            if (v == null || v.isEmpty) return "Phone required";
                            if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(v)) {
                              return "Invalid phone";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 12),

                        /// ADDRESS
                        _validatedField(
                          "Address",
                          address,
                          maxLines: 2,
                          validator: (v) {
                            if (v == null || v.isEmpty)
                              return "Address required";
                            if (v.length < 5) return "Too short";
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        /// SAVE BUTTON
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff8358FE),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.pop(context);

                                _showGlassSuccess(
                                    context, "Profile Updated Successfully");
                              }
                            },
                            child: const Text("Save Changes",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

Widget _validatedField(
  String label,
  TextEditingController controller, {
  String? Function(String?)? validator,
  TextInputType keyboardType = TextInputType.text,
  int maxLines = 1,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    maxLines: maxLines,
    validator: validator,
    decoration: InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.deepPurple),
      ),
    ),
  );
}

void _showGlassSuccess(BuildContext context, String message) {
  final overlay = Overlay.of(context);

  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (context) => Positioned(
      top: 100,
      left: 20,
      right: 20,
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 400),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, double value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, (1 - value) * -20), // smooth slide
              child: child,
            ),
          );
        },
        child: Material(
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    /// ✅ ICON (glass circle)
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 18,
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// 🔥 TEXT AREA
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          /// MAIN TEXT (BOLD)
                          Text(
                            "Success",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(height: 2),

                          /// SUB TEXT (DYNAMIC MESSAGE)
                          Text(
                            "Your profile has been updated",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );

  overlay.insert(entry);

  Future.delayed(const Duration(seconds: 2), () {
    entry.remove();
  });
}

void _showHelpCenter(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(height: 5, width: 50, color: Colors.grey[300]),
            const SizedBox(height: 20),

            const Text("Help Center",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            const SizedBox(height: 20),

            _faqItem("How to update profile?", "Go to Edit Profile and update your details."),
            _faqItem("How to reset password?", "Click on Change Password in settings."),
            _faqItem("How to contact support?", "Use Send Feedback option."),

          ],
        ),
      );
    },
  );
}

Widget _faqItem(String question, String answer) {
  return ExpansionTile(
    tilePadding: EdgeInsets.zero,
    title: Text(question, style: const TextStyle(fontWeight: FontWeight.w600)),
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(answer, style: const TextStyle(color: Colors.grey)),
      )
    ],
  );
}
void _showFeedbackDialog(BuildContext context) {
  final controller = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                /// 🔥 DRAG HANDLE
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔥 TITLE
                const Text(
                  "Send Feedback",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 6),

                /// 🔥 SUBTITLE
                const Text(
                  "Help us improve your experience",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔥 INPUT FIELD (PREMIUM)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: TextField(
                    controller: controller,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: "Write your feedback...",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(14),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔥 BUTTON ROW
                Row(
                  children: [

                    /// CANCEL
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                    ),

                    const SizedBox(width: 10),

                    /// SEND
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff8358FE),
                          elevation: 6,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {
                          if (controller.text.trim().isEmpty) {
                            _showGlassSuccess(context, "Please enter feedback");
                            return;
                          }

                          Navigator.pop(context);

                          _showGlassSuccess(context, "Feedback Submitted 🚀");
                        },
                        child: const Text(
                          "Send",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
    },
  );
}


void _showAboutApp(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// 🔥 HANDLE
            Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 20),

            /// 🔥 APP ICON (CLEAN + MODERN)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff8358FE).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.mobile_friendly,
                size: 30,
                color: Color(0xff8358FE),
              ),
            ),

            const SizedBox(height: 16),

            /// 🔥 APP NAME
            const Text(
              "My App",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 4),

            /// 🔥 VERSION
            const Text(
              "Version 1.0.0",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 16),

            /// 🔥 DESCRIPTION
            const Text(
              "This app helps you manage your profile and settings in a simple and efficient way.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black87,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 20),

            /// 🔥 DIVIDER (PREMIUM TOUCH)
            Divider(color: Colors.grey.shade200),

            const SizedBox(height: 10),

            /// 🔥 EXTRA INFO (PRO LOOK)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Developer", style: TextStyle(color: Colors.grey)),
                Text("Atappisoft",
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),

            const SizedBox(height: 6),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Support", style: TextStyle(color: Colors.grey)),
                Text("support@atappisoft.com",
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),

            const SizedBox(height: 20),

            /// 🔥 BUTTON (CLEAN CTA)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff8358FE),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Close",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}