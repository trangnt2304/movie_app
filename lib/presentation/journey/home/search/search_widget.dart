import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/colors.dart';
import 'package:movie_app/common/constant/images.dart';
import 'package:movie_app/common/constant/text_style.dart';
import 'package:movie_app/database/model/movie/movie.dart';
import 'package:movie_app/presentation/journey/home/movie_detail/movie_detail_widget.dart';
import 'package:movie_app/presentation/journey/home/widget/home_widget/ticket_button_widget.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget(
      {Key? key, required this.listMovie, required this.onChange})
      : super(key: key);

  final List<Movie> listMovie;
  final String onChange;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  List<Movie> finalList = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    print('Alo');

    print(widget.onChange);
    if (widget.onChange.isEmpty) {
      setState(() {
        finalList = widget.listMovie;
      });
    } else {
      setState(() {
        finalList = widget.listMovie
            .where((element) => (element.title?.toLowerCase() ?? '')
            .contains(widget.onChange.toLowerCase()))
            .toList();
      });
    }
    return Scaffold(
      backgroundColor: const Color(AppColors.background),
      body: ListView.builder(
        itemCount: finalList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xFFDFDFDF)),
                left: BorderSide(width: 1.0, color: Color(0xFFDFDFDF)),
                right: BorderSide(width: 1.0, color: Color(0xFF7F7F7F)),
                bottom: BorderSide(width: 1.0, color: Color(0xFF7F7F7F)),
              ),
            ),
            padding: const EdgeInsets.all(8),
            width: width,
            height: height / 5,
            child: Container(
              padding: const EdgeInsets.all(8).copyWith(left: 16),
              width: width,
              height: height / 5.5,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(const Radius.circular(8)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'http://image.tmdb.org/t/p/w500/${finalList[index].poster_path}'),
                      ),
                    ),
                    width: width / 4,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          finalList[index].title ?? '',
                          style: AppTextStyle.movieTitle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                            child: TicketButtonWidget(
                          colorButton: AppColors.chineseBlue,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => MovieDetailWidget(
                                  movie: finalList[index],
                                )));
                          },
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}
