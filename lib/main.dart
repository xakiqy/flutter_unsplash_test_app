import 'package:flutter/material.dart';
import 'package:flutter_unsplash_test_app/model/unsplash_model.dart';
import 'package:flutter_unsplash_test_app/service/unsplash_service.dart';
import 'package:flutter_unsplash_test_app/theme/light_theme.dart';
import 'package:flutter_unsplash_test_app/util/util.dart';
import 'package:pagination_view/pagination_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightUnsplashTheme,
      home: MyHomePage(title: 'Unsplash photos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GlobalKey<PaginationViewState> key;

  @override
  void initState() {
    key = GlobalKey<PaginationViewState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: PaginationView<Result>(
        key: key,
        preloadedItems: <Result>[],
        paginationViewType: PaginationViewType.gridView,
        itemBuilder: (BuildContext context, Result result, int index) =>
            GridTile(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      _createPhotoFullScreenPageRoute(result.urls!.full));
                },
                child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 4.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 16 / 11,
                      child: Image.network(
                        result.urls!.small,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              result.description,
                              style: theme.textTheme.button,
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              result.user.name,
                              style: theme.textTheme.caption,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
      pageFetch: fetchPhotos,
      pullToRefresh: true,
      onError: (dynamic error) =>
          Center(
            child: Text('Some error occured'),
          ),
      onEmpty: Center(
        child: Text('Sorry! This is empty'),
      ),
      bottomLoader: Center(
        child: CircularProgressIndicator(),
      ),
      initialLoader: Center(
        child: CircularProgressIndicator(),
      ),
    ),);
  }

  Route _createPhotoFullScreenPageRoute(String imageUrl) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          PhotoFullScreenPage(imageUrl: imageUrl),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class PhotoFullScreenPage extends StatelessWidget {
  final String imageUrl;

  PhotoFullScreenPage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
