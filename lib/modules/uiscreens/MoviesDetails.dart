import 'package:flutter/material.dart';
import 'package:moviesapp/utils/all_constants.dart';

class MoviesDetails extends StatefulWidget {
  Movies movies_list;
  MoviesDetails({required this.movies_list});

  @override
  State<MoviesDetails> createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  @override
  Widget build(BuildContext context) {
    String? _finalImageUrl =
        widget.movies_list.thumbnail?.replaceAll('thumb/', 'medium/');
    var Screenwidth = MediaQuery.of(context).size.width;
    var Screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: CommonTextWidget(
              text: AppStrings.movies,
              fontSize: Dimens.twentyEight,
              fontWeight: FontWeight.w600,
              fontColor: Colors.white),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  width: Screenwidth,
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimens.ten, vertical: Dimens.twenty),
                  child: CommonTextWidget(
                      text: widget.movies_list.name!,
                      fontSize: Dimens.twenty,
                      textAlignment: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      fontColor: Colors.black),
                )),
            Flexible(
              flex: 2,
              child: Image.network(_finalImageUrl!, width: Screenwidth),
            ),
            Flexible(flex: 2, child: _textContents())
          ],
        ));
  }

  Widget _textContents() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _bottomText(
              text1: AppStrings.genres,
              text2: widget.movies_list.genres?.join(', ')),
          _bottomText(text1: AppStrings.year, text2: widget.movies_list.year),
          _bottomText(
              text1: AppStrings.director, text2: widget.movies_list.director),
          _bottomText(
              text1: AppStrings.mainStar, text2: widget.movies_list.mainStar),
          _bottomText(
              text1: AppStrings.description,
              text2: widget.movies_list.description),
        ],
      ),
    );
  }

  Widget _bottomText({required text1, required text2}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CommonTextWidget(
            text: text1,
            fontSize: Dimens.fifteen,
            fontWeight: FontWeight.w600,
            fontColor: Colors.black),
        SizedBox(height: Dimens.three),
        CommonTextWidget(
          text: text2,
          maxLines: 4,
          textAlignment: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          fontSize: Dimens.fifteen,
          fontWeight: FontWeight.w400,
          fontColor: Colors.black.withOpacity(0.5),
        ),
        SizedBox(height: Dimens.five)
      ],
    );
  }
}
