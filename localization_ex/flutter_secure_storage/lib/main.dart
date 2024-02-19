import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:value_listenable_builder_ex/secondPage.dart';
import 'package:value_listenable_builder_ex/util.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

// 첫 로그인 시 userUid 를 키 값으로 저장, 로그인 상태를 value 값으로 저장
// userUid 가 로그인 상태라면, userUid 를 통해 db 에 저장된 정보를 가져와 자동 로그인.
// 이렇게 데이터를 가져오면 오래 걸릴까?
class _FirstPageState extends State<FirstPage> {

  var userName = TextEditingController();
  var password = TextEditingController();

  // Create storage
  final storage = const FlutterSecureStorage();
  final _authentication = FirebaseAuth.instance;

  // user 정보
  String userUid = '';
  String userEmail = '';
  String userPassword = '';


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    // Read all values
    Map<String, String> allValues = await storage.readAll();

    if( allValues != null ) {
      allValues.forEach((key, value) async {
        print('key > $key, value > $value');

        if( value == STATUS_LOGIN ) {
          userUid = key;

          await _getUserInfo(userUid);

          if( userUid != '' ) {
            Navigator.push(
              (context),
              MaterialPageRoute(
                builder: (context) => SecondPage(
                  userEmail: userEmail, userPassword: userPassword,
                )
              )
            );
          }
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // 아이디
              TextField(
                controller: userName,
                decoration: const InputDecoration(
                  labelText: 'User name'
                ),
              ),

              // 비밀번호
              TextField(
                controller: password,
                decoration: const InputDecoration(
                  labelText: 'Password'
                ),
              ),

              const SizedBox(height: 20,),

              // 회원가입 버튼
              ElevatedButton(
                  onPressed: () async {
                    _signUp('${userName.text}@email.com', password.text);
                  },
                  child: const Text('회원가입')
              ),

              // 로그인 버튼
              ElevatedButton(
                onPressed: () async {


                  var isLogged = _signIn('${userName.text}@email.com', password.text);

                  if( await isLogged ) {
                    Navigator.push(
                      (context),
                      MaterialPageRoute(
                        builder: (context) => SecondPage(
                          userEmail: userEmail, userPassword: userPassword,
                        )
                      )
                    );
                  }

                },
                child: const Text('로그인')
              )
            ],
          ),
        )
      ),
    );
  }

  // 회원가입
  Future<void> _signUp(String email, String password) async {
    final newUser = await _authentication.createUserWithEmailAndPassword(
        email: email, password: password
    );

    await FirebaseFirestore.instance
    .collection('userEx')
    .doc(newUser.user!.uid)
    .set({
      'userEmail' : email,
      'userPassword' : password
    });
  }

  // 로그인
  Future<bool> _signIn(String email, String password) async {
    final newUser = await _authentication.signInWithEmailAndPassword(
        email: email,
        password: password
    );

    if (newUser.user != null) {
      userUid = newUser.user!.uid;

      await _getUserInfo(userUid);

      await storage.write(key: userUid, value: STATUS_LOGIN);

      return true;
    }

    return false;
  }

  // user 정보 가져오기
  _getUserInfo(String userUid) async {

    await FirebaseFirestore.instance
        .collection('userEx')
        .doc(userUid)
        .get()
        .then((value) => {
      userEmail = value.data()!['userEmail'],
      userPassword = value.data()!['userPassword']
    });
  }
}