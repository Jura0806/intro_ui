import 'package:flutter/material.dart';
import 'package:intro_ui/pages/home_page.dart';
import 'package:intro_ui/pages/utils/strings.dart';

class IntroPage extends StatefulWidget {
static final String id = 'intro_page';

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

   @override
  void dispose() {
   _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: Stack(
       alignment: Alignment.bottomCenter,
   children: [
       PageView(
         onPageChanged: (int page){
           setState(() {
             _currentIndex = page;
           });
         },
         controller: _pageController,
         children: [
           makePage(
             title :  Strings.stepOneTitle,
             content : Strings.stepOneContent,
             image: "assets/images/image_1.png",
           ),
           makePage(
             title :  Strings.stepTwoTitle,
             content : Strings.stepTwoContent,
             image: "assets/images/image_2.png",
           ),
           makePage(
             title :  Strings.stepThreeTitle,
             content : Strings.stepThreeContent,
             image: "assets/images/image_3.png",
           ),

         ],
       ),
     Container(
       margin: EdgeInsets.only(bottom: 60),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children:_buildIndicator(),

       ),
     ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
       crossAxisAlignment: CrossAxisAlignment.end,
        children: _skipButton(),
      )

   ],
     ),
    );
  }

 Widget makePage( {title, content, image}) {
    return Container(
     padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
     child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(title, style: TextStyle(color: Colors.redAccent,fontSize: 30, fontWeight: FontWeight.bold),),
      SizedBox(height: 20,),
      Text(content,style: TextStyle(color: Colors.grey, fontSize: 20),textAlign: TextAlign.center,),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset(image),
      ),
    ],
  ),
    );
 }

   Widget _indicator(bool isActive){
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
        duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6 ,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(5),
      ),
    );
   }

   List<Widget> _buildIndicator(){
    List<Widget> indicators = [];

    for(int i =0; i < 3; i++){
     if(_currentIndex == i){
       indicators.add(_indicator(true));
     }else{
       indicators.add(_indicator(false));
     }
    }
    return indicators;
}

 Widget _button(){
    return Container(
      padding: EdgeInsets.only(bottom: 70, left: 320),
      child: GestureDetector(
        onTap: (){
          Navigator.pushReplacementNamed(context, HomePage.id);
        },
        child: Text('Skip', style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.bold),),
      ),
    );
 }

  List<Widget> _skipButton(){
    List<Widget> listButton =[];

    if(_currentIndex == 2){
      listButton.add(_button());
    }
    return listButton;
  }


}






