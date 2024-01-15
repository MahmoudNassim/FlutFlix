import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/api/api.dart';
import 'package:moviesapp/models/movie.dart';
import 'package:moviesapp/screens/details_screen.dart';
import 'package:moviesapp/widgets/movies_slider.dart';
import 'package:moviesapp/widgets/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendyMovie;
  late Future<List<Movie>> topMovie;
  late Future<List<Movie>> upMovie;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    trendyMovie = Api().getTrendyMovies();
    topMovie = Api().getTopRatedMovies();
    upMovie = Api().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/flutflix.png',
          fit: BoxFit.cover,
          height: 40,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Trending Movies',
              style: GoogleFonts.aBeeZee(fontSize: 24),
            ),
            const SizedBox(
              height: 16,
            ),
            FutureBuilder(
                future: trendyMovie,
                builder: (context, snapshot){
                  if (snapshot.hasError){
                    return Center(child: Text(snapshot.hasError.toString()),);
                  }else if(snapshot.hasData){
                    return TrendingSlider(snapshot: snapshot,);
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Top Rated Movies',
              style: GoogleFonts.aBeeZee(fontSize: 24),
            ),
            const SizedBox(
              height: 16,
            ),
             FutureBuilder(
                future: topMovie,
                builder: (context, snapshot){
                  if (snapshot.hasError){
                    return Center(child: Text(snapshot.hasError.toString()),);
                  }else if(snapshot.hasData){
                    return MoviesSlider(snapshot: snapshot,);
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Upcoming Movies',
              style: GoogleFonts.aBeeZee(fontSize: 24),
            ),
            const SizedBox(
              height: 16,
            ),
             FutureBuilder(
                future: upMovie,
                builder: (context, snapshot){
                  if (snapshot.hasError){
                    return Center(child: Text(snapshot.hasError.toString()),);
                  }else if(snapshot.hasData){
                    return MoviesSlider(snapshot: snapshot,);
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                }),
          ]),
        ),
      ),
    );
  }
}
