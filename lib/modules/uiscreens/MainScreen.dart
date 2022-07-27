import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/modules/uiscreens/MoviesDetails.dart';
import 'package:moviesapp/utils/all_constants.dart';
import 'package:moviesapp/utils/custom_progress_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MoviesBloc? moviesScreenBloc;
  late List<Movies> movies_List;
  @override
  void initState() {
    movies_List = [];
    moviesScreenBloc = MoviesBloc();
    fetch_MoviesList(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fetch_MoviesList(context: context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: CommonTextWidget(
              text: AppStrings.movies,
              fontSize: Dimens.twentyEight,
              fontWeight: FontWeight.w600,
              fontColor: Colors.white),
        ),
        body: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.transparent,
                child: SafeArea(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: Dimens.five, horizontal: Dimens.fifteen),
                    child: StreamBuilder<MoviesData>(
                        stream: moviesScreenBloc!.get_moviesList_Stream,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            CircularProgressIndicator();
                          } else if (snapshot.connectionState ==
                              ConnectionState.active) {
                            //place your code here. It will prevent double data call.
                            if (snapshot.data != null) {
                              movies_List = [];
                              if (snapshot.data!.movies!.length > 0) {
                                movies_List = snapshot.data!.movies!;
                              }
                            }
                          }
                          return _moviesWidget(context);
                        }),
                  ),
                )),
            StreamBuilder<dynamic>(
              stream: moviesScreenBloc?.progressStream,
              builder: (context, snapshot) {
                return Center(
                    child: CommonProgressIndicator(
                        snapshot.hasData ? snapshot.data! : false));
              },
            ),
          ],
        ));
  }

  Widget _moviesWidget(BuildContext context) {
    return movies_List.length > 0
        ? Container(
            child: GridView.builder(
              shrinkWrap: true,
              controller: new ScrollController(keepScrollOffset: false),
              itemCount: movies_List.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (3 / 4),
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => MoviesDetails(
                                  movies_list: movies_List[index])));
                    },
                    child: _movieItem(movies_List[index], context));
              },
            ),
          )
        : SizedBox();
  }

  Widget _movieItem(Movies movies_list, BuildContext context) {
    var Screenwidth = MediaQuery.of(context).size.width;
    var Screenheight = MediaQuery.of(context).size.height;

    String _finalImageUrl =
        movies_list.thumbnail!.replaceAll('thumb/', 'medium/');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(_finalImageUrl, height: Screenwidth * 0.5, width: Screenwidth * 0.33),
        CommonTextWidget(
            text: movies_list.name!,
            fontSize: Dimens.fifteen,
            fontWeight: FontWeight.w600,
            fontColor: Colors.black),
        CommonTextWidget(
            text: movies_list.year!,
            fontSize: Dimens.fifteen,
            fontWeight: FontWeight.w600,
            fontColor: Colors.black),
      ],
    );
  }

  void fetch_MoviesList({required BuildContext context}) {
    CommonUtils.checkConnectivity().then((isConnected) {
      if (isConnected) {
        moviesScreenBloc!.getMoviesData_List(context: context);
      } else {
        CommonUtils.showToastBar(
            text: AppStrings.network_error,
            color: Colors.red,
            context: context);
      }
    });
  }
}
