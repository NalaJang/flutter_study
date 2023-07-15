import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController id_controller = TextEditingController();
  TextEditingController pw_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),

        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top:50)),
            const Center(
              child: Image(
                image: AssetImage('image/chef.gif'),
                width: 170.0,
                height: 190.0,
              ),
            ),
            Form(
                child: Theme(
                    data: ThemeData(
                      primaryColor: Colors.teal,
                      inputDecorationTheme: const InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.teal,
                          fontSize: 15.0
                        )
                      )
                    ),
                    child: Container(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: id_controller,
                            decoration: InputDecoration(
                              labelText: 'Enter "dice"'
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),

                          TextField(
                            controller: pw_controller,
                            decoration: InputDecoration(
                                labelText: 'Enter Password'
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),

                          const SizedBox(height: 40.0,),

                          ButtonTheme(
                            minWidth: 100.0,
                              height: 50.0,
                              child: ElevatedButton(
                                  onPressed: (){

                                    if( id_controller.text == 'dice'
                                    && pw_controller.text == '1234' ) {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         // builder: (BuildContext context) => Dice()
                                      // );
                                    } else if( id_controller.text == 'dice'
                                    && pw_controller.text != '1234' ) {

                                    } else if( id_controller.text != 'dice'
                                        && pw_controller.text == '1234' ) {

                                    } else {

                                    }

                                  },
                                  child: const Icon(
                                  Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 35.0,
                                  )
                              ),
                          ),
                        ],
                      ),
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}
