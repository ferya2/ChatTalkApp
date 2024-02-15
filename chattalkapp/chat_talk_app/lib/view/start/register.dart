import 'package:chat_talk_app/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isDarkMode = MyApp.isDarkMode;
  bool _agreeToTerms = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: _isDarkMode ? Colors.black : Colors.blue,
          iconTheme: IconThemeData(
            color: _isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: _isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        // Sesuaikan warna latar belakang sesuai keinginan Anda
        scaffoldBackgroundColor: Colors.black,
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
                }); // Perbarui widget untuk merender ulang dengans tema baru
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
                  child: Text(
                    'Register',
                    key: ValueKey<bool>(_isDarkMode),
                    style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Text(
                    'You and Your Friend Always Connected ',
                    style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  style: TextStyle(
                    color: _isDarkMode ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                      color: _isDarkMode
                          ? Colors.white.withOpacity(0.5)
                          : Colors.black.withOpacity(0.5),
                    ),
                    hintStyle: TextStyle(
                      color: _isDarkMode ? Colors.white70 : Colors.black54,
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
                    color: _isDarkMode ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: _isDarkMode
                          ? Colors.white.withOpacity(0.5)
                          : Colors.black.withOpacity(0.5),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: _isDarkMode ? Colors.white70 : Colors.black54,
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
                    color: _isDarkMode ? Colors.white : Colors.black,
                  ),
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline,
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
                      color: _isDarkMode ? Colors.white70 : Colors.black54,
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
                Row(
                  children: [
                    Checkbox(
                      activeColor: _isDarkMode
                          ? Colors.white.withOpacity(0.5)
                          : Colors.black.withOpacity(0.5),
                      checkColor: _isDarkMode ? Colors.black : Colors.white,
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
                            color: _isDarkMode ? Colors.white : Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'I agree with the ',
                              style: TextStyle(
                                color:
                                    _isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms and Condition',
                              style: TextStyle(
                                color: _isDarkMode
                                    ? Colors.deepPurple
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Tambahkan logika untuk menangani ketika "Terms and Condition" diklik
                                },
                            ),
                            TextSpan(
                              text: ' and the ',
                              style: TextStyle(
                                color:
                                    _isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'privacy policy',
                              style: TextStyle(
                                color: _isDarkMode
                                    ? Colors.deepPurple
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Tambahkan logika untuk menangani ketika "privacy policy" diklik
                                },
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
                      // Tambahkan logika registrasi di sini
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isDarkMode
                          ? Colors.deepPurple.withOpacity(0.5)
                          : Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: _isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Already have an account ? ',
                        style: TextStyle(
                          color: _isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: _isDarkMode ? Colors.deepPurple : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Tambahkan logika untuk menangani ketika "Terms and Condition" diklik
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
