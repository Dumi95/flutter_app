import 'package:flutter/material.dart';
//引入列表视图部件
import 'demo/listview_demo.dart';
//引入底部导航栏的小部件
import 'demo/bottom_navigation_bar_demo.dart';
import 'demo/basic_demo.dart';
//路由相关配置使用的小部件
import 'demo/navigator_demo.dart';
//form表单提交的部件
import 'demo/form_demo.dart';
//成功打卡小部件
import 'demo/success.dart';
import 'demo/self_info.dart';
import 'demo/leave_application.dart';
import 'demo/self_info_edit.dart';
import 'demo/over_time.dart';
import 'demo/leave_application_form.dart';

void main() {
  runApp(App());
}

//自定义不需要继承数据的小部件
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //MaterialApp风格应用设置
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //如果不用home，要设置初始路由
      //home: NavigatorDemo(),
      //设置路由和初始路由
      initialRoute: '/',
      routes: {
        //之前报错是因为路由没加/
        '/': (context) => NavigatorDemo(),
        // '/about':(context) => Page(title: 'About'),
        '/submit': (context) => successDemo(),
        '/form': (context) => FormDemo(),
        '/edit': (context) => infoEditDemo(),
        '/overTime': (context) => overTimeDemo(),
        '/leaveApplicationForm': (context) => leaveApplicationFormDemo(),
      },
      //主题颜色
      theme: ThemeData(
        primarySwatch: Colors.teal,
        //高亮色，点击后的颜色
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        //点击后的水波纹
        splashColor: Colors.white30,
      ),
    );
  }
}

//被使用的home小部件
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Scaffold设置具体格式，appBar之类，导航栏
    //使用TabController设置底部小部件
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Text('考勤系统'),
            centerTitle: true,
            //显示后面的搜索和更多信息
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () => debugPrint('Search Button is pressed.'),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                tooltip: 'More',
                onPressed: () => debugPrint('More_horiz Button is pressed.'),
              ),
            ],
            //顶部阴影颜色
            elevation: 5.0,
          ),
          //body显示对应TabBar
          body: TabBarView(children: <Widget>[
            //Icon(Icons.check_circle_outline,size:128.0,color: Colors.black12,),
//          Container(
//            padding: EdgeInsets.all(8.0),
//            child: Column(
//              children: <Widget>[
//                Text('工作班次',style: TextStyle(fontSize: 26.0,color: Colors.teal,decoration: TextDecoration.overline,)),
//                ListViewDemo(),
//                //ListViewDemo(),
//              ],
//            ),
//          ),
            ListViewDemo(),
            //BasicDemo(),
            Container(
              child: Column(
                children: <Widget>[leaveApplicationDemo()],
              ),
            ),
            //Icon(Icons.home,size:128.0,color: Colors.black12,),
            Container(
              child: Column(
                children: <Widget>[
                  selfInfoDemo(),
                ],
              ),
            )
            // Icon(Icons.build,size:128.0,color: Colors.black12,),
          ]),
          //设置抽屉，左边栏drawer，右边栏endDrawer，会自动添加icon
          //设置为Container容器,或者直接用Drawer部件
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                //可以使用DrawerHead部件，显示用户信息用UserAccountDrawerHeader部件
                UserAccountsDrawerHeader(
                  accountName: Text(
                    'xiangkun',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text('xixiangkun@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    //设置当前头像
                    backgroundImage: NetworkImage(
                        'https://b-ssl.duitang.com/uploads/item/201902/18/20190218194003_zuqir.jpg'),
                  ),
                  //设置背景颜色
                  decoration: BoxDecoration(
                    color: Colors.teal[400],
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://b-ssl.duitang.com/uploads/item/201902/18/20190218194003_zuqir.jpg'),
                        //设置全部填充
                        fit: BoxFit.cover,
                        //添加滤镜，混合模式
                        colorFilter: ColorFilter.mode(
                            Colors.teal[200].withOpacity(0.6),
                            BlendMode.hardLight)),
                  ),
                ),
                ListTile(
                  //设置标题右对齐
                  title: Text(
                    '个人信息',
                    textAlign: TextAlign.right,
                  ),
                  //标题后面设置小图标，右边trailing，左边leading
                  trailing: Icon(
                    Icons.account_circle,
                    color: Colors.black12,
                    size: 22.0,
                  ),
                  //设置点击后返回
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  //设置标题右对齐
                  title: Text(
                    '系统通知',
                    textAlign: TextAlign.right,
                  ),
                  //标题后面设置小图标，右边trailing，左边leading
                  trailing: Icon(
                    Icons.chat,
                    color: Colors.black12,
                    size: 22.0,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  //设置标题右对齐
                  title: Text(
                    '个人设置',
                    textAlign: TextAlign.right,
                  ),
                  //标题后面设置小图标，右边trailing，左边leading
                  trailing: Icon(
                    Icons.build,
                    color: Colors.black12,
                    size: 22.0,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          //设置底部导航栏
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(
              top: 9.0,
              bottom: 4.0,
            ),
            color: Colors.teal,
            child: TabBar(
                //未被选择的颜色
                unselectedLabelColor: Colors.black38,
                //设置下划线的颜色
                indicatorColor: Colors.black54,
                //下划线的大小和label一样
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 1.0,
                tabs: <Widget>[
                  Tab(
                    icon: Icon(
                      Icons.calendar_today,
                      size: 28.0,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.add_circle,
                      size: 28.0,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.account_circle,
                      size: 28.0,
                    ),
                  ),
                ]),
          )
          //BottomNavigationBarDemo(),
          ),
    );
  }
}
