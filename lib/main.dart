// Khai báo thư viện cần dùng
import 'package:flutter/material.dart';

// Bước 2: Hàm main là hàm đầu tiên nó chạy
void main() {
  // Bước 3: Chạy hàm khởi động app
  runApp(MaterialApp(
    // Sử dụng widget
    home: SafeArea(
      // để giao diện k bị đè lên khung điện thoại
      child: Scaffold(
        // giao diện bên trong màn hình
        body: Center(
            child: TextWidget(),
        ),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Tu hoc flutter'),
        ),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Code Nam viết
//StateLess Widget chỉ cần 1 class kế thừa StatelessWidget
class MyWidgetLess extends StatelessWidget {

  final bool loading;

  const MyWidgetLess(this.loading, {super.key});

  @override
  Widget build(BuildContext context) {
    // if(loading){
    //   return CircularProgressIndicator();
    // }else{
    //   return Text('StateLess');
    // }
    return loading ?  CircularProgressIndicator() : Text('StateLess');
    throw UnimplementedError();
  }
}

// StateFullWidget thì kế thừa từ StatefulWidget gồm 2 bước với 2 class khác nhau
class MyWidgetFull extends StatefulWidget{
  final bool loading;

  const MyWidgetFull(this.loading, {super.key});

  @override
  State<StatefulWidget> createState() {
    return MyWidgetFullState();
  }

}
// Class State kế thừa State<MyWidgetFull>  chứa hàm build
class MyWidgetFullState extends State<MyWidgetFull> {
 late bool _localLoading;

  @override
  void initState(){
    _localLoading = widget.loading;
  }

  @override
  Widget build(BuildContext context) {
    return _localLoading ?  CircularProgressIndicator() : FloatingActionButton(onPressed: onClickButton,);
  }

  void onClickButton(){
    setState((){
      _localLoading = true;
    });
  }
}

// Học về Text Widget
class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Toi la nam, tôi mới học lập trình flutter aaaaaaaaaaaaaa'
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.right,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: 1.2,
      style: TextStyle(
        color: Colors.pink,
        backgroundColor: Colors.orange,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
        fontFamily: 'Dancing',
        wordSpacing: 2,
        letterSpacing: 1,
        decoration: TextDecoration.none,
      ),
    );
  }

}

// Học cách custom font
// Bước 1 tải font
// Bước 2 tạo thư mục assets/fonts/ copy file font tải vào đây
// Bước 3 khai báo font mới tải vào file pubspect.yaml với cấu trúc sau
// fonts:
// - family: Dancing
// fonts:
// - asset: assets/fonts/DancingScript.ttf
// Bước 4 dùng thôi
