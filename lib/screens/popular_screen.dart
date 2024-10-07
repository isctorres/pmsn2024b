import 'package:flutter/material.dart';
import 'package:pmsn2024b/models/popular_moviedao.dart';
import 'package:pmsn2024b/network/popular_api.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  
  PopularApi? popularApi;

  @override
  void initState() {
    super.initState();
    popularApi = PopularApi();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: popularApi!.getPopularMovies(), 
        builder: (context, AsyncSnapshot<List<PopularMovieDao>> snapshot) {
          if( snapshot.hasData ){
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
              ), 
              itemBuilder: (context, index) {
                return Image.network('https://image.tmdb.org/t/p/w500/${snapshot.data![index].posterPath}');
              },
            );
          }else{
            if( snapshot.hasError ){
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        },
      ),
    );
  }
}