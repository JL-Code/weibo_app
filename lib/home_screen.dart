import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weiboapp/emotion_screen.dart';
import 'package:weiboapp/models/home_timeline_response.dart';
import 'package:weiboapp/status_screen.dart';
import 'package:weiboapp/widgets/list_item.dart';
import 'package:weiboapp/constants.dart' show AppColors, Constants;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  HomeTimelineResponse response;
  bool added = false;

  @override
  void initState() {
    super.initState();
    response = new HomeTimelineResponse(statuses: []);
    _handleRefresh();
  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  /// 处理下拉刷新
  Future<void> _handleRefresh() {
    var token = new CancelToken();
    var statuses = response.statuses;
    var sinceId = statuses.length > 0 ? statuses.first.id : 0;
    var path = "${Constants.HOST}/2/statuses/home_timeline.json";
    var queryParameters = {
      "access_token": Constants.AccessToken,
      "since_id": sinceId,
      "count": Constants.LIST_LIMIT
    };
    print(path);
    print(queryParameters);
    return Dio()
        .get(path, queryParameters: queryParameters, cancelToken: token)
        .then((Response<dynamic> res) {
      var result = HomeTimelineResponse.fromJson(res.data);
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
        content: Text('有${result.statuses.length}条微博更新'),
      ));
      setState(() {
        statuses.insertAll(0, result.statuses);
      });
    }).catchError((e) {
      token.cancel("canceled");
      print(e);
    });
  }

  _loadMore() {
    var token = new CancelToken();
    var statuses = response.statuses;
    var sinceId = statuses.last == null ? 0 : statuses.last.id;
    var path = "${Constants.HOST}/2/statuses/home_timeline.json";
    var queryParameters = {
      "access_token": Constants.AccessToken,
      "max_id": sinceId,
      "count": Constants.LIST_LIMIT
    };
    Dio()
        .get(path, queryParameters: queryParameters, cancelToken: token)
        .then((Response<dynamic> res) {
      var result = HomeTimelineResponse.fromJson(res.data);
      result.statuses.removeAt(0);
      setState(() {
        statuses.addAll(result.statuses);
      });
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
        content: Text('有${result.statuses.length}条微博更新'),
      ));
    }).catchError((e) {
      token.cancel("canceled");
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("微博${response.statuses.length}"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // 命令式调用下拉刷新
              _refreshIndicatorKey.currentState.show();
            },
          ),
          IconButton(
            icon: Icon(Icons.insert_emoticon),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return EmotionScreen();
                },
              ));
            },
          )
        ],
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            debugPrint("listview builder $index");
            if (index == response.statuses.length) {
              return RaisedButton(
                child: Text("加载更多"),
                onPressed: () {
                  _loadMore();
                },
              );
            } else {
              var item = response.statuses[index];
              return ListItem(
                statuses: item,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return StatusScreen(
                        statuses: item,
                      );
                    },
                  ));
                },
              );
            }
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: response.statuses.length + 1,
        ),
      ),
      backgroundColor: const Color(AppColors.BackgroundColor),
    );
  }
}
