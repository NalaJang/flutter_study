import 'package:flutter/material.dart';
import 'package:yummy_chat_lecture/config/palette.dart';
import 'package:yummy_chat_lecture/model/model.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {

  Model model = Model();
  bool isSignupScreen = true;
  // 사용자가 submit button 을 클릭했을 때 text field 의 값 유효성 검사를 위한
  // 밸리데이션 기능을 실행하기 위한 글로벌 키 생성
  final _formKey = GlobalKey<FormState>();

  // textFormField 의 onSaved()에 저장된 value 값을 실제 밸리데이션 기능에 사용하기 위한 변수 선언
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  // _formKey 를 사용해서 밸리데이션 기능 실행
  void _tryValidation() {
    // 현재 값에 대한 유효성 검사를 하는 것이므로 currentState 에 대해 null check 를 한다.
    final isValid = _formKey.currentState!.validate();

    // 폼 스테이트 값이 유효하다면 값을 저장
    if( isValid ) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,

      body: Stack(
        children: [

          // 배경
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('image/red.jpg'),
                  fit: BoxFit.fill
                ),
              ),

              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Welcome',
                        style: const TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 25,
                          color: Colors.white
                        ),

                        children: [
                          TextSpan(
                            text: isSignupScreen ?
                            ' to Yummy chat!' : ' back',

                            style: const TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),

                    Text(
                      isSignupScreen ?
                      'Signup to continue' : 'SignIn to continue',

                      style: const TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            )
          ),

          // text form field
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,

            top: 180,
            child:
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,

              padding: const EdgeInsets.all(20.0),
              height: isSignupScreen ? 280.0 : 250.0,
              width: MediaQuery.of(context).size.width -40,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5
                  )
                ],
              ),

              // 유효성 검사에서 경고 메시지가 뜨게 되면 container 의 크기 부족(?)으로 내부 내용들이 가려지게 된다.
              // 그로 인해 생기는 에러를 없애기 위해 컨테이너 내부에 scroll 기능을 추가.
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        // login
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignupScreen ?
                                  Palette.activeColor : Palette.textColor1
                                ),
                              ),

                              if(!isSignupScreen)
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                              )
                            ],
                          ),
                        ),

                        // signup
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'SIGNUP',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen ?
                                    Palette.activeColor : Palette.textColor1
                                ),
                              ),

                              if(isSignupScreen)
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                              )
                            ],
                          ),
                        )
                      ],
                    ),

                    // signup text field
                    if( isSignupScreen )
                    // 사용자 정보 입력 칸
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Form(
                        key: _formKey,

                        child: Column(
                          children: [
                            // userName
                            TextFormField(
                              key: ValueKey(1),
                              validator: (value){
                                if( value!.isEmpty || value.length < 4 ) {
                                  return 'Please enter at least 4 characters';
                                }
                                return null;
                              },

                              // 사용자가 입력한 value 값을 저장하는 기능
                              onSaved: (value){
                                // value 값이 전달될 때마다 해당 변수에 저장된다.
                                userName = value!;
                              },

                              decoration: model.textFormDecoration('User name')
                            ),

                            const SizedBox(
                              height: 8,
                            ),

                            // email
                            TextFormField(
                                key: ValueKey(2),
                                validator: (value){
                                  if( value!.isEmpty || value.contains('@') ) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },

                                onSaved: (value){
                                  userEmail = value!;
                                },

                                decoration: model.textFormDecoration('Email')
                            ),

                            const SizedBox(
                              height: 8,
                            ),

                            // password
                            TextFormField(
                                key: ValueKey(3),
                                validator: (value){
                                  if( value!.isEmpty || value.length < 6 ) {
                                    return 'Please must be at least 7 characters long.';
                                  }
                                  return null;
                                },

                                onSaved: (value){
                                  userPassword = value!;
                                },

                                decoration: model.textFormDecoration('Password')
                            ),
                          ],
                        ),
                      ),
                    ),

                    // login text field
                    if( !isSignupScreen )
                    Container(
                      margin: EdgeInsets.only(top: 20),

                      child: Form(
                        key: _formKey,

                        child: Column(
                          children: [

                            // email
                            TextFormField(
                                key: ValueKey(4),
                                validator: (value){
                                  if( value!.isEmpty || value.contains('@') ) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },

                                onSaved: (value){
                                  userEmail = value!;
                                },

                                decoration: model.textFormDecoration('Email')
                            ),

                            const SizedBox(
                              height: 8,
                            ),

                            // password
                            TextFormField(
                                key: ValueKey(5),
                                validator: (value){
                                  if( value!.isEmpty || value.length < 6 ) {
                                    return 'Please must be at least 7 characters long.';
                                  }
                                  return null;
                                },

                                onSaved: (value){
                                  userPassword = value!;
                                },

                                decoration: model.textFormDecoration('Password')
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // next button
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,

            top: isSignupScreen ? 430 : 390,
            right: 0,
            left: 0,

            child: Center(
              child: Container(
                padding: EdgeInsets.all(15),
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)
                ),

                child: GestureDetector(
                  onTap: (){
                    _tryValidation();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        // gradient 는 몇 가지 색상을 가지므로 colors 는 list 형태를 가진다.
                        colors: [
                          Colors.orange,
                          Colors.red
                        ],
                        // 리스트 내의 색상 시작과 끝
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                      ),

                      borderRadius: BorderRadius.circular(30),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          // 한 지점에서 다른 지점까지의 거리 즉, 버튼 그림자 효과가 가지는 버튼으로부터의 수직, 수평
                          offset: Offset(0, 1)
                        ),
                      ],
                    ),

                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ),

          // text 와 google login button
          Positioned(
            top: MediaQuery.of(context).size.height -125,
            right: 0,
            left: 0,

            child: Column(
              children: [
                Text(isSignupScreen ? 'or Signup with' : 'or SignIn with'),

                SizedBox(
                  height: 10,
                ),

                TextButton.icon(
                  onPressed: (){},
                  icon: Icon(Icons.add),
                  label: Text('Google'),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                    minimumSize: Size(155, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    backgroundColor: Palette.googleColor
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
