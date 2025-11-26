// Khai báo thư viện cần dùng
import 'package:flutter/material.dart';

// Bước 2: Hàm main là hàm đầu tiên nó chạy
void main() {
  // Bước 3: Chạy hàm khởi động app
  runApp(MaterialApp(
    // Sử dụng widget ThemeData để cấu hình font cho toàn
    // theme: ThemeData(
    //   fontFamily: 'Dancing',
    // ),
    home: SafeArea(
      // để giao diện k bị đè lên khung điện thoại
      child: Scaffold(
        // giao diện bên trong màn hình
        body: WidgetExamplesPage(),
        // appBar: AppBar(
        //   backgroundColor: Colors.green,
        //   title: Text('Tu hoc flutter'),
        // ),
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
    super.initState();
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
        fontFamily: 'Times New Roman',
        wordSpacing: 2,
        letterSpacing: 1,
        decoration: TextDecoration.none,
      ),
    );
  }

}

// Học cách custom font
class CustomFont {
  // Bước 1 tải font
  // Bước 2 tạo thư mục assets/fonts/ copy file font tải vào đây
  // Bước 3 khai báo font mới tải vào file pubspect.yaml với cấu trúc sau
  // fonts:
  // - family: Dancing
  // fonts:
  // - asset: assets/fonts/DancingScript.ttf
  // Bước 4 dùng thôi
}

// Học về RichText Widget
class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
  return RichText(text:
    TextSpan(
      style: DefaultTextStyle.of(context).style,
      children: <TextSpan>[
        TextSpan(text: 'Hello'),
        TextSpan(text: 'bold', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        TextSpan(text: 'world !!!')
      ]
    ),
  );
  }

}

// Học về padding margin
class PaddingMarginWidget extends StatelessWidget {
  const PaddingMarginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink,
      margin: EdgeInsets.all(10),
      child: Padding(
        // padding: const EdgeInsets.fromLTRB(8,10,8,10),
        // padding: const EdgeInsets.all(20),
        // padding: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 100),
        child: Text('Nam đây',
          style: TextStyle(fontSize: 20, color: Colors.white),),
      )
    );
  }
}

// Học về TextButtonWidget
class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget Container là 1 kho chứa giống như thẻ div vậy
    return Container(
      margin: const EdgeInsets.all(20),
      // Để thêm icon vào TextButton thì dùng widget TextButton.icon
      // Thuộc tính child đổi thành label
      // Thêm thuộc tính icon như bên dưới
      child: TextButton.icon(
          // onPressed: (){
          //   print('Click me');
          // },
          // set onpressed = null để disable button
          onPressed: null,
          style: TextButton.styleFrom(
            foregroundColor: Colors.pink,
            backgroundColor: Colors.green,
            minimumSize: const Size(120, 80),
            padding: EdgeInsets.all(50),
            // tạo hình cho đối tượng như bo tròn
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            // đổ bóng với elevation kích thước bóng, và màu bóng shadowColor
            elevation: 20,
            shadowColor: Colors.blue.withOpacity(0.8),
            // thêm viền màu cho đối tượng
            side: BorderSide(width: 1, color:Colors.orange),
            // set background và fore khi button disable
            disabledBackgroundColor: Colors.grey,
            disabledForegroundColor: Colors.white,
          ),
          icon: const Icon(Icons.add, size: 20),
          // child: Text('Text Nam', style: TextStyle(fontSize: 20)),
          label: Text('Text Nam', style: TextStyle(fontSize: 28))
      ),
    );
  }
}

// Học về ElevatedButtonWidget
class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      child: ElevatedButton.icon(
          onPressed: (){
            print('Click the Elevated Button');
          },
          // onPressed: null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
            maximumSize: Size(240, 80),
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 30,
            shadowColor: Colors.black.withOpacity(0.9),
            side: const BorderSide(width: 1, color: Colors.yellow),
            // disabledBackgroundColor: Colors.black,
            // disabledForegroundColor: Colors.green
          ),
          // child: Text('ElevatedButton', style: TextStyle(fontSize: 28)),
          icon: Icon(Icons.edit, size: 28),
          label: Text('ElevatedButton', style: TextStyle(fontSize: 28))
      ),
    );
  }
}

// Học về OutlineButtonWidget
class OutlineButtonWidget extends StatelessWidget {
  const OutlineButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: OutlinedButton(
          onPressed: (){
            print('Click On OutlinedButton');
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            minimumSize: Size(300, 100),
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 20,
            shadowColor: Colors.green.withOpacity(0.8),
            side:BorderSide(width: 1, color: Colors.black)
          ),
          child: Text('OutlinedButton', style: TextStyle(fontSize: 20))
      ),
    );
  }
}

//Học về Widget Container
class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Nếu container k có child thì nó sẽ bao toàn màn hình,
    // ngược lại nó sẽ bao trùm con nó mà thôi
    return Container(
      // color: Colors.blue,
      width: 200,
      height: 200,
      // Trường hợp này đã fix cứng width height container rồi, nên child cách lề đúng theo padding
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.all(20),
      // Tuỳ chỉnh theo thuộc tính
      // alignment: Alignment.bottomLeft,
      // Tuỳ chỉnh theo hằng số
      // alignment: Alignment(1,1),
      // Tuỳ chỉnh theo số tuỳ thích
      alignment: FractionalOffset(0.75,1),
      decoration: BoxDecoration(
        // Muốn set màu trong này thì phải bỏ màu ở ngoài đi
        color: Colors.blue,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2, color: Colors.red),
      ),
      transform: Matrix4.rotationZ(0.2),
      child: Text('NamCoder', style: TextStyle(fontSize: 20, color:Colors.white)),
    );
    throw UnimplementedError();
  }
}

// Học về SizeBox => hướng content bên trong bằng kích thước của SizeBox
// Dùng khi biết trước kích thước rồi, có thể dùng SizeBox rỗng làm khoảng cách giữa các widget
class SizedBoxWidget extends StatelessWidget {
  const SizedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: ElevatedButton(
          onPressed: (){
            print('Click On ElevatedButton');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          child: const Text('NamCoder', style: TextStyle(fontSize: 20)))
    );
  }
}

// Row là view group bao quanh view bên trong sắp xếp theo chiều ngang
// Same div class=row
class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Row(
        // set kích thước của Row so với container
        mainAxisSize: MainAxisSize.max,
        // canh theo chiều ngang các phần tử con cho đẹp trong row
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // theo chiều dọc các phần tử con
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: (){

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white
              ),
              child: Text('Button1', style: TextStyle(fontSize: 15))
          ),
          ElevatedButton(
              onPressed: (){

              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white
              ),
              child: Text('Button2', style: TextStyle(fontSize: 15))
          ),
          ElevatedButton(
              onPressed: (){

              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white
              ),
              child: Text('Button3', style: TextStyle(fontSize: 15))
          ),
        ],
      ),
    );
  }

}

// Column là view group bao quanh view bên trong sắp xếp theo chiều dọc
// Same div class=col
class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: (){

              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white
              ),
              child: Text('Button1', style: TextStyle(fontSize: 15))
          ),
          ElevatedButton(
              onPressed: (){

              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white
              ),
              child: Text('Button2', style: TextStyle(fontSize: 15))
          ),
          ElevatedButton(
              onPressed: (){

              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white
              ),
              child: Text('Button3', style: TextStyle(fontSize: 15))
          ),
        ],
      ),
    );
  }
}

// Expanded Widget sắp xếp bố cục theo tỷ lệ
class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});
  // Kết hợp SizedBox để tạo khoảng cách giữa các Expanded
  // Kèm theo đó là margin để tạo khoảng cách với lề
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey,
                height: 150,
              )
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
                height: 150,
              )
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              flex:1,
              child: Container(
                color: Colors.green,
                height: 150,
              )
          ),
        ]
      )
    );
  }

}

// Sử dụng kết hợp row, column, expanded, container, sizedbox trong flutter
class DemoWidget extends StatelessWidget {
  const DemoWidget({super.key});
  // Cách tư duy thiết kế giao diện này
  // Ta thấy username và Trần Doãn Nam đều là text, trong đó label có size cố đinh
  // Ta sẽ để label trong SizedBox còn tên để trong Text,
  // 2 cái này ngang nhau nên đặt trong row, tương tự với 2 cái còn lại
  // Cái cuối là 2 button cách đều nhau nghĩ ngay tới Expanded chứa 2 ElevanButton
  // 2 cái Expanded này nằm trên 1 dòng vậy đặt trong 1 Row
  // Toàn bộ các row này trong 1 column được bọc bởi container
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 80,
                child: Text('UserName: ', style: const TextStyle(fontSize: 14, color: Colors.grey),),
              ),
              Text('Trần Doãn Nam', style: TextStyle(fontSize: 18, color: Colors.blueAccent))
            ],
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              SizedBox(
                width: 80,
                child: Text('Email: ', style: const TextStyle(fontSize: 14, color: Colors.grey),),
              ),
              Text('Nakani3797@gmail.com', style: TextStyle(fontSize: 18, color: Colors.blueAccent))
            ],
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              SizedBox(
                width: 80,
                child: Text('Address: ', style: const TextStyle(fontSize: 14, color: Colors.grey),),
              ),
              Text('64 Lê Lợi TPHCM', style: TextStyle(fontSize: 18, color: Colors.blueAccent))
            ],
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.black
                      ),
                      onPressed: (){},
                      child: Text('Add', style: TextStyle(fontSize: 18, color: Colors.white),)
                  )
              ),
              Expanded(
                  child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange
                      ),
                      onPressed: (){},
                      child: Text('Edit', style: TextStyle(fontSize: 18, color: Colors.white),)
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}

// Sử dụng Stack widget để sắp xếp bố cục chồng lên nhau = row, column
class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: 500,
      height: 500,
      child: Stack(
        // điều chỉnh kích thước các layout
        fit: StackFit.loose,
        alignment: Alignment.center,
        // Set nhìn dc phần tràn ra ngoài phần tử con nằm trong Stack
        clipBehavior: Clip.none,
        // textDirection: TextDirection.ltr,
        children: [
          Container(
            color: Colors.blue,
            width: 300,
            height: 300,
          ),
          // Sử dụng widget Positioned với left, top, right, bottom để
          // điều chỉnh vị trí trong Stack
          Positioned(
            left: 10,
            bottom: 10,
            child: Container(
              color: Colors.green,
              width: 200,
              height: 700,
            ),
          ),
          // Sử dụng widget Align với alignment để điều chỉnh vị trí trong Stack
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              color: Colors.pink,
              width: 100,
              height: 100,
            ),
          ),
          Container(
            color: Colors.yellow,
            width: 70,
            height: 70,
          ),
          Container(
            color: Colors.red,
            width: 50,
            height: 50,
          )
        ],
      ),
    );
  }

}

// Phân biệt Expanded và Flexible
// Cả hai đều phải là con trực tiếp của Row, Column, Flex
class Demo2 extends StatelessWidget{
  const Demo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            flex: 1,
            // Nếu set FlexFit.tight thì Flexible = Expanded
            // Ngược lại FlexFit.loose thì nó có thể thay đổi Container dễ dàng
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              color: Colors.blue,
            )
        ),
        Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              color: Colors.yellow,
            )
        ),
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              color: Colors.grey,
            )
        ),
      ],
    );
  }

}

// Xây dựng giao diện cơ bản với Stack, Positoned, Card...
class Demo3 extends StatelessWidget {
  const Demo3({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.orange,
        ),
        Positioned(
          bottom: 20,
          left: 10,
          right: 10,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('NamCoder', style: TextStyle(fontSize: 20, color:Colors.white),),
                  const SizedBox(height: 20),
                  Text('Học lập trình flutter '
                      'Học lập trình flutter '
                      'Học lập trình flutter '
                      'Học lập trình flutter',
                    style: TextStyle(fontSize: 20, color:Colors.white),
                  )
                ],
              ),
            )
          ),
        )
      ],
    );
  }
}

// Xây dụng giao diện cơ bản bài hát
class Demo5 extends StatelessWidget {
  const Demo5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 40,
                color: Colors.red,
              ),
              const SizedBox(width: 10,),
              Expanded(
                  child:Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Nguyễn Văn Thanh', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Text('Lê Lợi TPHCM', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                    ],
                  )
              ),
              Container(
                width: 20,
                height: 20,
                color: Colors.green
              ),
              const SizedBox(width: 10,),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      width: 20,
                      height: 20,
                      color: Colors.green
                  ),
                  Text('20')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetExamplesPage extends StatefulWidget {
  @override
  _WidgetExamplesPageState createState() => _WidgetExamplesPageState();
}

class _WidgetExamplesPageState extends State<WidgetExamplesPage> {
  bool _checkboxValue = false;
  bool _switchValue = false;
  String _radioValue = 'option1';
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar - Thanh tiêu đề
      appBar: AppBar(
        title: Text('Flutter Widget Examples'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),

      // Drawer - Menu trượt
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),

      // Body - Nội dung chính
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // 1. Container Example
          _buildSection(
            'Container',
            Container(
              width: 200,
              height: 100,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: Center(
                child: Text('Container with decoration'),
              ),
            ),
          ),

          // 2. Text Examples
          _buildSection(
            'Text',
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Normal Text'),
                Text(
                  'Bold Text',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Styled Text',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),

          // 3. Image Example
          _buildSection(
            'Image',
            Column(
              children: [
                // Image from network
                Image.network(
                  'https://picsum.photos/200/100',
                  height: 100,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Text('Image from network'),
              ],
            ),
          ),

          // 4. Icon Example
          _buildSection(
            'Icon',
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 32),
                Icon(Icons.star, color: Colors.amber, size: 32),
                Icon(Icons.thumb_up, color: Colors.blue, size: 32),
                Icon(Icons.share, color: Colors.green, size: 32),
              ],
            ),
          ),

          // 5. Button Examples
          _buildSection(
            'Buttons',
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Elevated Button'),
                ),
                SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: Text('Text Button'),
                ),
                SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Outlined Button'),
                ),
                SizedBox(height: 8),
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {},
                  color: Colors.red,
                ),
              ],
            ),
          ),

          // 6. Row & Column Example
          _buildSection(
            'Row & Column',
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Row Example:'),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(color: Colors.red, width: 50, height: 50),
                      Container(color: Colors.green, width: 50, height: 50),
                      Container(color: Colors.blue, width: 50, height: 50),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Column Example:'),
                  SizedBox(height: 8),
                  Column(
                    children: [
                      Container(color: Colors.orange, width: 100, height: 30),
                      SizedBox(height: 4),
                      Container(color: Colors.purple, width: 100, height: 30),
                      SizedBox(height: 4),
                      Container(color: Colors.teal, width: 100, height: 30),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // 7. Stack Example
          _buildSection(
            'Stack',
            Container(
              height: 150,
              child: Stack(
                children: [
                  Container(
                    width: 200,
                    height: 150,
                    color: Colors.blue[100],
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red.withOpacity(0.7),
                      child: Center(child: Text('Front')),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Icon(Icons.star, size: 50, color: Colors.amber),
                  ),
                ],
              ),
            ),
          ),

          // 8. ListView Example
          _buildSection(
            'ListView (Horizontal)',
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    margin: EdgeInsets.only(right: 8),
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // 9. GridView Example
          _buildSection(
            'GridView',
            Container(
              height: 200,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: List.generate(9, (index) {
                  return Container(
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          // 10. TextField Example
          _buildSection(
            'TextField',
            Column(
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Enter text',
                    hintText: 'Type something...',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.edit),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                ),
              ],
            ),
          ),

          // 11. Checkbox Example
          _buildSection(
            'Checkbox',
            CheckboxListTile(
              title: Text('Accept terms and conditions'),
              value: _checkboxValue,
              onChanged: (bool? value) {
                setState(() {
                  _checkboxValue = value ?? false;
                });
              },
            ),
          ),

          // 12. Radio Example
          _buildSection(
            'Radio',
            Column(
              children: [
                RadioListTile<String>(
                  title: Text('Option 1'),
                  value: 'option1',
                  groupValue: _radioValue,
                  onChanged: (String? value) {
                    setState(() {
                      _radioValue = value ?? 'option1';
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('Option 2'),
                  value: 'option2',
                  groupValue: _radioValue,
                  onChanged: (String? value) {
                    setState(() {
                      _radioValue = value ?? 'option1';
                    });
                  },
                ),
              ],
            ),
          ),

          // 13. Switch Example
          _buildSection(
            'Switch',
            SwitchListTile(
              title: Text('Enable notifications'),
              value: _switchValue,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),

          // 14. Card Example
          _buildSection(
            'Card',
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Title',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('This is a card with elevation and padding.'),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('ACTION 1'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('ACTION 2'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 15. GestureDetector & InkWell Example
          _buildSection(
            'GestureDetector & InkWell',
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('GestureDetector tapped!')),
                    );
                  },
                  onLongPress: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Long pressed!')),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.blue[100],
                    child: Text('Tap or Long Press (GestureDetector)'),
                  ),
                ),
                SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('InkWell tapped!')),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.green[100],
                    child: Text('Tap for Ripple Effect (InkWell)'),
                  ),
                ),
              ],
            ),
          ),

          // 16. Expanded & Flexible Example
          _buildSection(
            'Expanded & Flexible',
            Container(
              height: 100,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    color: Colors.red,
                    child: Center(child: Text('Fixed')),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.green,
                      child: Center(child: Text('Expanded (2)')),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue,
                      child: Center(child: Text('Expanded (1)')),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 17. Divider Example
          _buildSection(
            'Divider',
            Column(
              children: [
                Text('Content above'),
                Divider(thickness: 2, color: Colors.grey),
                Text('Content below'),
              ],
            ),
          ),
        ],
      ),

      // BottomNavigationBar Example
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),

      // FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('FloatingActionButton pressed!')),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Helper method để tạo section
  Widget _buildSection(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        child,
        SizedBox(height: 24),
      ],
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}