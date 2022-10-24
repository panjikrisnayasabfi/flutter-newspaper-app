import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ds_bfi/flutter_ds_bfi.dart';
import 'package:flutter_newspaper_app/core/utils/route_util.dart';
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
  void dispose() {
    _homebloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // title: Text(widget.title),
          actions: [
            Center(child: Text("News Sport")),
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
      child: BlocListener<Homebloc, HomeState>(
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
              return loading();
            } else if (state is Homestatenewsloading) {
              return loading();
            } else if (state is Homestatenewsloaded) {
              return lisnews(state.homeModel!);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget lisnews(HomeModel homeModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: (widget.homeduserdata?.user != "user")
                ? EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0)
                : EdgeInsets.all(0),
            child: Opacity(
              opacity: (widget.homeduserdata?.user != "user") ? 1.0 : 0.0,
              child: (widget.homeduserdata?.user != "user")
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.red,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DSText(
                            data: 'Anda Masuk Sebagai Guest',
                            textStyle: DSTextStyle.regularStyle
                                .copyWith(color: Colors.white),
                          ),
                          InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, RouteUtil.loginRoute),
                            child: DSText(
                                data: 'Login',
                                textStyle: DSTextStyle.regularStyle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      // ),
                    )
                  : Container(),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.85,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return (SizedBox(
                  height: 8.0,
                ));
              },
              itemCount: homeModel.article!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (widget.homeduserdata?.user == 'user') {
                      Navigator.pushNamed(context, RouteUtil.detailNewsRoute,
                          arguments: homeModel.article![index]);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Card(
                      child: ListTile(
                        leading: Image.network(
                          homeModel.article?[index].urlToImage ?? '',
                          scale: 7,
                        ),
                        title: Text(homeModel.article?[index].title ?? ''),
                        subtitle: Text(
                          homeModel.article?[index].content ?? '',
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
