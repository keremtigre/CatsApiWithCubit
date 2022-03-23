import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cats_app/view/cubit/cats_cubit.dart';

class ShowCatsBody extends StatefulWidget {
  ShowCatsBody({Key? key}) : super(key: key);

  @override
  State<ShowCatsBody> createState() => _ShowCatsBodyState();
}

class _ShowCatsBodyState extends State<ShowCatsBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Random Cats"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocConsumer<CatsCubit, CatsState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is CatsInitial) {
                  return Text("");
                } else if (state is CatsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is CatsCompleted) {
                  return Column(
                    children: [
                      Image.network(
                        state.cats[0].url.toString(),
                        fit: BoxFit.cover,
                        height: size.height / 2,
                        width: size.width,
                      ),
                    ],
                  );
                } else {
                  final error = state as CatsError;
                  return Text(error.message);
                }
              },
            ),
            SizedBox(
              height: size.height / 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<CatsCubit>().getCat();
                },
                child: Text(
                  "Kedi getir",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ));
  }
}
