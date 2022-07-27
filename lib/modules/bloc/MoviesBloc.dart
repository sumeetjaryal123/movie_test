import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moviesapp/utils/all_constants.dart';

class MoviesBloc {
  ApiRepository apiRepository = ApiRepository();

  ///*******PROGRESS SINK*********
  final progressController = BehaviorSubject<bool>();

  Stream<bool> get progressStream => progressController.stream;

  StreamSink<bool> get progressSink => progressController.sink;

  // Child Profile Data
  final moviesListController = BehaviorSubject<MoviesData>();

  Stream<MoviesData> get get_moviesList_Stream => moviesListController.stream;

  StreamSink get get_moviesList_Sink => moviesListController.sink;

  void getMoviesData_List({required BuildContext? context}) {
    progressSink.add(true);
    apiRepository.getmoviesApiHit().then((onResponse) {
      if (onResponse.statusCode == 200) {
        get_moviesList_Sink.add(onResponse.data);
      } else if (onResponse.statusCode == 400) {
        CommonUtils.showToastBar(
            text: onResponse.message!, color: Colors.red, context: context);
      }
      progressSink.add(false);
    }).catchError((onError) {
      progressSink.add(false);
      CommonUtils.showToastBar(
          text: onError.message.toString(),
          color: Colors.red,
          context: context);
    });
  }
}
