import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import 'src/actions/index.dart';
import 'src/data/unsplash_api.dart';
import 'src/epics/app_epics.dart';
import 'src/models/index.dart';
import 'src/presentation/containers/index.dart';
import 'src/reducer/app_reducer.dart';

void main() {
  const String apiKey = 'y1Sic6aeJeVL4pJPR5NwdxzHVx8kUSL_A3_LkPZQibw';
  final Client client = Client();
  final UnsplashApi api = UnsplashApi(client, apiKey);
  final AppEpics epic = AppEpics(api);

  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: const AppState(),
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(epic.call).call,
    ],
  );
  store.dispatch(GetImages.start(page: store.state.page, search: store.state.searchTerm));
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.store});

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  @override
  void initState(){
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    final double height = MediaQuery.of(context).size.height;
    final double offset = _controller.position.pixels;
    final double maxRange = _controller.position.maxScrollExtent;

    if (store.state.hasMore && !store.state.isLoading && (maxRange - offset) < height * 3) {
      store.dispatch(GetImages.start(page: store.state.page  , search: store.state.searchTerm));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
      title: Text(
        'Google Images')
      ),
      body: IsLoadingContainer(builder: (BuildContext context, bool isLoading) {
        return ImagesContainer(builder: (BuildContext context, List<Picture> images) {
          if (isLoading && images.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            controller: _controller,
            itemCount: images.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == images.length) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              final Picture picture = images[index];

              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  GridTile(
                    child: Image.network(
                      picture.urls.regular,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: AlignmentDirectional.topCenter,
                            colors: <Color>[Colors.white10, Colors.transparent],
                          ),
                        ),
                        child: ListTile(
                          title: Text(picture.user.name),
                          trailing: CircleAvatar(
                            backgroundImage: NetworkImage(picture.user.profileImage.small),
                          ),
                        ),
                      )),
                ],
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          );
        });
      }),
    );
  }
}
