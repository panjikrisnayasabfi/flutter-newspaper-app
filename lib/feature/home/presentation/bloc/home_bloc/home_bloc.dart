import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newspaper_app/feature/home/domain/repo/home_repo.dart';
import 'package:flutter_newspaper_app/feature/home/presentation/bloc/home_bloc/bloc.dart';

class Homebloc extends Bloc<HomeEvent, HomeState> {
  Homebloc() : super(Homestatenewsinitial()) {
    final HomeRepo homeRepo = HomeRepo();
    on<GetNews>((event, emit) async {
      try {
        emit(Homestatenewsloading());
        final newslist = await homeRepo.fectnewslist();
        emit(Homestatenewsloaded(newslist));
        if (newslist.error != null) {
          emit(Homestatenewserror(newslist.error));
        }
      } catch (e) {
        emit(Homestatenewserror('nework eror mybe ??'));
      }
    });
  }
}
