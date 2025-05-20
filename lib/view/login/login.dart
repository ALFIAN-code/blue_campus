import 'package:bluecampus_mobile/view/page_switcher.dart';
import 'package:flutter/material.dart';
import 'package:bluecampus_mobile/services/auth_services.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  String error = '';

  void handleLogin() async {
    setState(() {
      isLoading = true;
      error = '';
    });

    bool success = await AuthService.login(
      emailController.text,
      passwordController.text,
    );

    setState(() {
      isLoading = false;
    });

    if (success && mounted) {
      final user = await AuthService.getUser();
      final role = user?['role'];

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => PageSwitcher(role: role)),
      );
    } else {
      setState(() {
        error = 'Login gagal. Cek email/password.';
      });
    }
  }

  // Future<void> handleLogin() async {
  //   setState(() => isLoading = true);

  //   final response = await AuthService.login(
  //     emailController.text,
  //     passwordController.text,
  //   );

  //   setState(() => isLoading = false);

  //   if (response['success']) {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder:
  //             (_) => JadwalPage(user: response['user']),
  //       ),
  //     );
  //   } else {
  //     showError(response['message']);
  //   }
  // }

  void showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FC),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 80),
            Image.asset('asset/Blue-campus.png', width: 250),
            const SizedBox(height: 60),
            const Text(
              'Selamat datang di BlueCampus',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff003366),
              ),
            ),
            const Text(
              'Kelola aktivitas akademik Anda dengan mudah, cepat, dan terintegrasi di satu tempat.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xff003366)),
            ),
            const SizedBox(height: 60),
            const Text(
              "Masuk",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff003366),
              ),
            ),
            const Text(
              'Masukkan email dan password dengan benar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff003366),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: const Color(0xff003366),
                ),
                onPressed: () {
                  Get.to(PageSwitcher(role: 'Mahasiswa'));
                },
                child:
                    isLoading
                        ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        )
                        : const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
