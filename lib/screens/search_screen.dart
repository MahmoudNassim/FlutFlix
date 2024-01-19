// import 'package:flutter/material.dart';
// import 'package:moviesapp/api/api.dart';
// import 'package:moviesapp/constant.dart';
// import 'package:moviesapp/models/movie.dart';
// import 'package:moviesapp/screens/details_screen.dart';

// class SearchScreen extends StatefulWidget {
//   SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   var searchController = TextEditingController();
//   late Future<List<Movie>> search;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize search with an empty list
//     search = Future.value([]);
//   }

//   void performSearch() {
//     setState(() {
//       search = Api().getSearchMovies(query: searchController.text);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: searchController,
//               keyboardType: TextInputType.text,
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'search must not be empty';
//                 } else {
//                   return null;
//                 }
//               },
//               onChanged: (value) {
//                 setState(() {
//                   performSearch();
//                 });
//               },
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hoverColor: Colors.grey,
//                 labelText: 'Search',
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: FutureBuilder(
//                 future: search,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return GridView.builder(
//                       itemCount: snapshot.data!.length,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2),
//                       itemBuilder: (context, index) {
//                         return Container(
//                           height: 200,
//                           width: 200,
//                           child: Card(
//                             child: Column(
//                               children: [
//                                 Expanded(
//                                   child: InkWell(
//                                     onTap: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   DetailsScreen(
//                                                       movie: snapshot
//                                                           .data![index])));
//                                     },
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(10),
//                                       child: Image.network(
//                                         '${Constants.imagePath}${snapshot.data![index].posterPath}',
//                                         filterQuality: FilterQuality.high,
//                                         fit: BoxFit.fill,
//                                         width: 200,
//                                         height: 200,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
