import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newspaper_app/feature/home/data/homeuserdata.dart';
import 'package:flutter_newspaper_app/feature/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_newspaper_app/feature/home/presentation/bloc/home_bloc/home_event.dart';

import '../../../../core/utils/strings_util.dart';
import '../../data/home_model.dart';
import '../bloc/home_bloc/home_state.dart';
import '../widget/list_news_widget.dart';
import '../widget/loading_indicator_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({this.homeduserdata});
  final Homeduserdata? homeduserdata;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Homebloc _homebloc = Homebloc();

  @override
  void initState() {
    _homebloc.add(GetNews());
    super.initState();
  }

  @override
  void dispose() {
    _homebloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('home screen built');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Center(child: Text(Strings.newsSport)),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: BlocListener<Homebloc, HomeState>(
        bloc: _homebloc,
        listener: (context, state) {
          if (state is Homestatenewserror) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: BlocBuilder<Homebloc, HomeState>(
          bloc: _homebloc,
          builder: (context, state) {
            if (state is Homestatenewsinitial) {
              return SizedBox();
            } else if (state is Homestatenewsloading) {
              return LoadingIndicatorWidget();
            } else if (state is Homestatenewsloaded) {
              return ListNewsWidget(
                homeduserdata: widget.homeduserdata ?? Homeduserdata(),
                homeModel: state.homeModel ?? HomeModel(),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
