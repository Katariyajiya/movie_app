import 'package:flutter/cupertino.dart';

class ImageClipper extends CustomClipper<Path>{
  ImageClipper({required this.progress});
late final double progress;

  @override
  Path getClip(Size size) {
    Path path =Path();
    
    path.addRect(
      Rect.fromLTRB(
          size.width-(size.width*progress),
          0,
          size.width,
          size.height
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
