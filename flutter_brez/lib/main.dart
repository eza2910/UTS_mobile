import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("brez app"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            print("sa dapa tekan");
            }, 
          icon: Icon(
            Icons.menu,
          ),
        ),
         actions: [
        IconButton(
        onPressed: () {}, 
        icon: Icon (
          Icons. refresh,
        ),
        ),
        IconButton(
        onPressed: () {},
        icon: Icon (
          Icons. search,
        ),
          ),
        ],
      ),
      body:Center(
        child : 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:[
           Container(
          height: 100,
          width: 100,
          color: Colors.deepPurple,
          child: Center(child: Text("data")),
        ),
        
        Container(
          height: 100,
          width: 100,
          color: const Color.fromARGB(255, 183, 58, 58),
          child: Center(child: Text("data")),
        ),
        ],
      ),
      ),
    );
  }
}