import 'package:animo/animated_pages.dart';
import 'package:animo/image_sllider.dart';
import 'package:animo/movie_button.dart';
import 'package:animo/movies_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'movie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  List<Movie> movies = [];
  int currentIndex=0;
  double pagevalue =0.0;


  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    movies = rawData.map(
          (data) =>
          Movie(
              title: data['title'],
              image: data['image'],
              index: data['index']),).toList();
    _pageController=PageController(
        viewportFraction: 0.8,
        initialPage: currentIndex)
    ..addListener((){
      setState(() {
        pagevalue = _pageController.page!;
      });

    })
    ;
  }

  @override
  Widget build(BuildContext context) {
    final reversedMoviesList = movies.reversed.toList();
    print(pagevalue);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
       statusBarBrightness: Brightness.dark
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children:[
            Stack(
              children: reversedMoviesList.map((movie)=>ImageSllider(
                  index:movie.index-1,
                  image: movie.image,
                  pageValue: pagevalue),
              ).toList(),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.white],
                stops: [0.3,0.8])
              ),
            ),
            AnimatedPages(
            pageController: _pageController,
            pageValue: pagevalue,
            pagecount: movies.length,
            onPageChangeCallback: (index){
              setState(() {
                currentIndex = index;
              });
            },
            child: (index,_){
              return MoviesDetails(movies[index]);
            },
          ),
           Positioned(
             bottom: 32,
               left: 0,
               right: 0,
               child: MovieButton()
           )
          ]
        )
      ),
    );
  }
}
