import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newspaper_app/core/utils/route_util.dart';
import 'package:flutter_newspaper_app/feature/detail_news_screen/data/arguments_detail_news_model.dart';
import 'package:flutter_newspaper_app/feature/home/data/home_model.dart';
import 'package:flutter_newspaper_app/feature/home/data/homeuserdata.dart';
import 'package:flutter_newspaper_app/feature/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_newspaper_app/feature/home/presentation/bloc/home_bloc/home_event.dart';
import 'package:flutter_newspaper_app/feature/home/presentation/bloc/home_bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({this.homeduserdata});
  // final String? title;
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Text(widget.title),
          actions: [
            Center(child: Text("Nesw Sport")),
            SizedBox(
              width: 10,
            ),
            // CircleAvatar(),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: newslist());
  }

  Widget newslist() {
    return Container(
      child: BlocProvider(
        create: (_) => _homebloc,
        child: BlocListener<Homebloc, HomeState>(
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
            builder: (context, state) {
              if (state is Homestatenewsinitial) {
                return loading();
              } else if (state is Homestatenewsloading) {
                return loading();
              } else if (state is Homestatenewsloaded) {
                return lisnews(state.homeModel);
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget lisnews(HomeModel homeModel) {
    return Column(
      children: [
        // (widget.homeduserdata?.user != "user")
        // ?
        // Visibility(
        // visible: false,
        // child:
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.05,
          color: (widget.homeduserdata?.user != "user")
              ? Colors.red
              : Color.fromARGB(0, 244, 67, 54),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          // ),
        ),
        // : Container(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.85,
          child: ListView.builder(
            itemCount: homeModel.article?.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteUtil.detailNewsRoute,
                      arguments: ArgumentDetailNewsModel(homeModel.article!, index));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    child: ListTile(
                      leading: Image.network(
                          homeModel.article![index].urlToImage.toString()),
                      title: Text(homeModel.article![index].title.toString()),
                      subtitle: Text(
                          homeModel.article![index].content!.substring(0, 50)),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
