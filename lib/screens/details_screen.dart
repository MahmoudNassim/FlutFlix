import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/constant.dart';
import 'package:moviesapp/models/movie.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie, });

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: Colors.black,
            // bottom: PreferredSize(
            //   preferredSize: const Size.fromHeight(0),
            //   child: Text(
            //     '${movie.title}',
            //     style: GoogleFonts.belleza(
            //         fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            // ),
            elevation: 0,
            title: Text(
              '${movie.title}',
              style: GoogleFonts.belleza(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(8)),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_rounded)),
            ),
            pinned: true,
            floating: true,
            expandedHeight: 500,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24)),
                child: Hero(
                  tag: '${movie.id}',
                  child: Image.network(
                    '${Constants.imagePath}${movie.posterPath}',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    // width: double.maxFinite,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(children: [
                Text(
                  'Overview'.toUpperCase(),
                  style: GoogleFonts.aBeeZee(
                      fontSize: 20, fontWeight: FontWeight.w900),
                ),
                Text(
                  '${movie.overview}',
                  style: GoogleFonts.roboto(
                      fontSize: 17, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          'Realesed Date : ${movie.releaseDate ?? "Unknown"}',
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Rating :',
                              style: GoogleFonts.roboto(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text(
                              '${movie.voteAverage!.toStringAsFixed(1)} /10',
                              style: GoogleFonts.roboto(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),

              ]),
            ),
          ),
        ],
      ),
    );
  }
}
