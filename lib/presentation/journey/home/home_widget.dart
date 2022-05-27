import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_bloc.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_event.dart';
import 'package:movie_app/presentation/journey/home/home_bloc/home_state.dart';
import 'package:movie_app/presentation/journey/home/search/search_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/SideDrawer.dart';
import 'package:movie_app/presentation/journey/home/widget/cinema_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/comming_soon_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/now_showing_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController controller = PageController();

  final HomeBloc _homeBloc = HomeBloc();
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Phim');
  String? onChangeSearch;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: BlocProvider(
        create: (_) => _homeBloc,
        child: Scaffold(
          drawer: const SideDrawer(),
          backgroundColor: const Color(AppColors.background),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: const Color(AppColors.background),
            title: customSearchBar,
            actions: [
              IconButton(
                icon: customIcon,
                onPressed: () {
                  setState(() {
                    if (customIcon.icon == Icons.search) {
                      customIcon = const Icon(Icons.cancel);
                      customSearchBar = ListTile(
                        leading: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 28,
                        ),
                        title: TextField(
                          onChanged: (value) {
                            setState(() {
                              onChangeSearch = value;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: 'Nhập tên phim cần tìm.',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else {
                      customIcon = const Icon(Icons.search);
                      customSearchBar = const Text('Phim');
                    }
                  });
                },
              ),
            ],
            bottom: const TabBar(
              indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
              indicatorColor: Color(AppColors.movieSubTitle),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  text: "Đang chiếu",
                ),
                Tab(
                  text: "Tại rạp",
                ),
                Tab(
                  text: "Sắp chiếu",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                if (state is HomeDoneImgState) {
                  if (customIcon.icon != Icons.search) {
                      return SearchWidget(
                        listMovie: state.listMovie, onChange: onChangeSearch??'',
                      );
                  } else {
                    return SingleChildScrollView(
                      child: NowShowingWidget(
                        controller: controller,
                        onPageChanged: (int page) {
                          context.read<HomeBloc>().add(HomeDoneImgEvent(
                                page: page,
                                listMovie: [],
                              ));
                        },
                      ),
                    );
                  }
                } else {
                  return Container();
                }
              }),
              const CinemaWidget(),
              const CommingSoonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
