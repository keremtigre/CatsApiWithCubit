import 'package:bloc/bloc.dart';
import 'package:random_cats_app/cat.dart';
import 'package:random_cats_app/view/cats_repository.dart';
part 'cats_state.dart';

class CatsCubit extends Cubit<CatsState> {
  final CatsRepository _catsrepo;
  CatsCubit(this._catsrepo) : super(CatsInitial());

  Future<void> getCat() async {
    try {
      emit(CatsLoading());
      Future.delayed(Duration(milliseconds: 200));
      var response = await _catsrepo.getCats();
      emit(CatsCompleted(response));
    } on NetworkError catch (e) {
      emit(CatsError(e.message));
    }
  }
}
