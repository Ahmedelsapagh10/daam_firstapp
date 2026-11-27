import 'package:first_project/features/home_screen/cubit/cubit.dart';
import 'package:first_project/features/home_screen/cubit/state.dart';
import 'package:first_project/features/home_screen/presentation/screen/view_news_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is IncreamentHomeState) {
          toastification.show(
            context: context,
            primaryColor: Colors.blue,
            title: Text('Current value ${context.read<HomeCubit>().counter}'),
            autoCloseDuration: const Duration(seconds: 1),
          );
        }
        if (state is DecreamentHomeState) {
          toastification.show(
            context: context,
            primaryColor: Colors.red,

            title: Text('Current value ${context.read<HomeCubit>().counter}'),
            autoCloseDuration: const Duration(seconds: 1),
          );
        }
      },
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        return Scaffold(
          appBar: AppBar(),
          body: state is LoadingScreen
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: ListView.builder(
                    itemCount: (cubit.allData?.results ?? []).length,
                    itemBuilder: (context, index) {
                      var item = cubit.allData?.results?[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsScreen(url: item?.sourceUrl ?? ''),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.grey.shade200,
                          ),
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              Image.network(
                                item?.imageUrl ?? '',
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, child, loadingProgress) {
                                      return CircularProgressIndicator();
                                    },
                              ),

                              Text(
                                item?.title ?? '',
                                textAlign: TextAlign.right,
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                item?.description ?? '',
                                maxLines: 2,
                                textAlign: TextAlign.right,

                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
