
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appbar',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar icon menu'),
        centerTitle: true,
        elevation: 0.0,

        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                print("Shopping cart button is clicked");
              }
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("Search button is clicked");
              }
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/practice1.png"),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage("assets/practice2.png"),
                  backgroundColor: Colors.white,
                ),
              ],
              accountEmail: Text("bbanto@gmail.com"),
              accountName: Text("BBANTO"),
              onDetailsPressed: (){
                print("arrow is clicked");
              },
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.home,
                color: Colors.grey[850],
              ),
              title: Text("Home"),
              onTap: (){
                print("Home is clicked");
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text("Setting"),
              onTap: (){
                print("Setting is clicked");
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: Text("Question_answer"),
              onTap: (){
                print("Question_answer is clicked");
              },
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.thumb_up),
        onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Like a new Snack bar'),
              duration: Duration(seconds: 5),
              action: SnackBarAction(
                label : 'Undo',
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage()),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Go to the second page'),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          );
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text(
          '"좋아요가 추가 되었습니다."',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.redAccent
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Builder(
        builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '"좋아요를 취소하시겠습니까?"',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.redAccent
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('"좋아요가 취소되었습니다."'),
                        duration: Duration(seconds: 3),
                      )
                    );
                  },
                  child: Text('취소하기'),
                ),
              ],
            ),
          );
        },
      ),
      ),
    );
  }
}



///////////////////////////////////////////////////////////////////
