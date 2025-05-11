
import 'package:flutter/cupertino.dart';

typedef ChildBuilder = Widget Function(int index,BuildContext context);

typedef OnPageChangeCallback = void Function(int index);

class AnimatedPages extends StatelessWidget {
  final PageController pageController;
  final double pageValue;
  final ChildBuilder child;
  final int pagecount;
  final OnPageChangeCallback onPageChangeCallback;


  const AnimatedPages(

        {super.key,
          required this.pageValue,
          required this.child,
          required this.pagecount,
          required this.onPageChangeCallback,
          required this.pageController
        }
);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
       onPageChanged: onPageChangeCallback,
      physics: ClampingScrollPhysics(),
      controller: pageController,
      itemCount: pagecount,
      itemBuilder: (context,index){
         if(index ==pageValue.floor()+1 ||
             index == pageValue.floor()+2){
           return Transform.translate(offset: Offset(0.0, 100*(index-pageValue))
           ,child: child(index,context),
           );
         }
         else if (index ==pageValue.floor()||
                 index == pageValue.floor()-1){
                 return Transform.translate(offset: Offset(00,100*(pageValue-index)),
                 child: child(index,context),);
         }
         else{
           return child(index,context);
         }
         }
    );
  }
}
