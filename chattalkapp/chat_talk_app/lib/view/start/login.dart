import 'package:chat_talk_app/main.dart';
import 'package:chat_talk_app/view/home/homepage.dart';
import 'package:chat_talk_app/view/start/register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _containerHeight = 0.0;
  bool _showAdditionalTexts = true;
  bool _isPasswordVisible = false;
  bool _agreeToTerms = false;
  bool _isDarkMode = MyApp.isDarkMode;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: _isDarkMode
          ? ThemeData.dark()
          : ThemeData.light().copyWith(
              textTheme: TextTheme(
                headline6: TextStyle(
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: _isDarkMode ? Colors.black : Colors.blue,
          actions: [
            IconButton(
              icon: Icon(
                _isDarkMode
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
              ),
              onPressed: () {
                MyApp.isDarkMode = !MyApp.isDarkMode;
                setState(() {
                  _isDarkMode = MyApp.isDarkMode;
                }); // Perbarui widget untuk merender ulang dengan tema baru
              },
            ),
          ],
        ),
        backgroundColor: _isDarkMode ? Colors.black : Colors.blue,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: _showAdditionalTexts
                      ? Column(
                          children: [
                            Text(
                              'Login',
                              key: ValueKey<bool>(_isDarkMode),
                              style: TextStyle(
                                color:
                                    _isDarkMode ? Colors.white : Colors.black,
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0, right: 30.0),
                              child: Text(
                                'Remember to get up & strech once ',
                                style: TextStyle(
                                  color:
                                      _isDarkMode ? Colors.white : Colors.black,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 40.0, right: 40.0),
                              child: Text(
                                'in a while - your friends at chat app ',
                                style: TextStyle(
                                  color:
                                      _isDarkMode ? Colors.white : Colors.black,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              style: TextStyle(
                                color:
                                    _isDarkMode ? Colors.white : Colors.black,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone_outlined,
                                  color: _isDarkMode
                                      ? Colors.white.withOpacity(0.5)
                                      : Colors.black.withOpacity(0.5),
                                ),
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(
                                  color:
                                      _isDarkMode ? Colors.white : Colors.black,
                                ),
                                fillColor: Colors.white.withOpacity(0.3),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              style: TextStyle(
                                color:
                                    _isDarkMode ? Colors.white : Colors.black,
                              ),
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_outline_rounded,
                                  color: _isDarkMode
                                      ? Colors.white.withOpacity(0.5)
                                      : Colors.black.withOpacity(0.5),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: _isDarkMode
                                        ? Colors.white.withOpacity(0.5)
                                        : Colors.black.withOpacity(0.5),
                                  ),
                                ),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color:
                                      _isDarkMode ? Colors.white : Colors.black,
                                ),
                                fillColor: Colors.white.withOpacity(0.3),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: _isDarkMode
                                      ? Colors.white.withOpacity(0.5)
                                      : Colors.black.withOpacity(0.5),
                                  checkColor:
                                      _isDarkMode ? Colors.black : Colors.white,
                                  value: _agreeToTerms,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _agreeToTerms = value!;
                                    });
                                  },
                                ),
                                Container(
                                  constraints: const BoxConstraints(
                                      maxWidth:
                                          250), // Sesuaikan dengan lebar yang diinginkan
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: _isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Remember me  ',
                                          style: TextStyle(
                                            color: _isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _containerHeight = 80.0;
                                    _showAdditionalTexts = false;
                                    // Tambahkan logika autentikasi di sini
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()));
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _isDarkMode
                                      ? Colors.deepPurple.withOpacity(0.5)
                                      : Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: _isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            GestureDetector(
                              child: TextButton(
                                onPressed: () {
                                  // Tambahkan logika untuk pindah ke halaman registrasi
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: _isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(), // Widget kosong ketika tidak diperlukan
                ),
                const SizedBox(height: 10.0),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.0, end: _containerHeight),
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  builder: (BuildContext context, double value, Widget? child) {
                    return AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      height: value,
                      child: const FlutterLogo(
                        size: 50.0,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10.0),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.0, end: _containerHeight),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  builder: (BuildContext context, double value, Widget? child) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      height: value,
                      child: Text(
                        'Chat Talk',
                        style: TextStyle(
                          color: _isDarkMode ? Colors.white : Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
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
