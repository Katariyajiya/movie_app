import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie.dart';

class MoviesDetails extends StatelessWidget {
  final Movie movie;
  const MoviesDetails(this.movie,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 250, 8, 0),
      decoration: BoxDecoration(
       color: Colors.white,
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
      ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
          )
        ]
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image.asset(
                movie.image,
                height: 290,
                width: double.infinity,
                fit: BoxFit.cover,),
            ),
          ),
          
          Text(movie.title,style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (_) => Icon(
              Icons.star,
              size: 20,
             color: Colors.orange ,
            )),
          )
        ],
      ),
    );
  }
}
