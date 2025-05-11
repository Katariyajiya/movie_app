import 'package:animo/image_cliper.dart';
import 'package:flutter/cupertino.dart';


class ImageSllider extends StatelessWidget {

  final int index;
  final String image;
  final double pageValue;

  const ImageSllider({
    super.key,
    required this.index,
    required this.image,
    required this.pageValue
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper:ImageClipper(progress: getProgress()),
      child: Image.asset(
        image,
        height: double.infinity,
      fit: BoxFit.cover,),
    );
  }
  double getProgress(){
    if(index == pageValue.floor()){
      return 1.0-(pageValue-index);
    }
    else if (index<pageValue.floor()){
      return 0.0;
    }
    else{
      return 1.0;
    }
  }
}
