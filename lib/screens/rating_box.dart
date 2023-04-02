import 'package:flutter/material.dart';
class RatingBox extends StatefulWidget {
  const RatingBox({Key? key}) : super(key: key);

  @override
  State<RatingBox> createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating=0;
  void _setRatingAsOne(){
    setState(() {
      _rating=1;
    });
  }
  void _setRatingAsTwo(){
    setState(() {
      _rating=2;
    });
  }
  void _setRatingAsThree(){
    setState(() {
      _rating=3;
    });
  }
  @override
  Widget build(BuildContext context) {
    double _size=20;
    print(_rating);
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(0),
           child: IconButton(
             icon: (
             _rating>=1?
                 Icon(Icons.star, size: _size,):
                 Icon(Icons.star_border,size:_size ,)
             ),
             color: Colors.red[500],
             onPressed: _setRatingAsOne,
             iconSize: _size,
           ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
                _rating>=2?
                Icon(Icons.star, size: _size,):
                Icon(Icons.star_border,size:_size ,)
            ),
            color: Colors.red[500],
            onPressed: _setRatingAsTwo,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(2),
          child: IconButton(
            icon: (
                _rating>=3?
                Icon(Icons.star, size: _size,):
                Icon(Icons.star_border,size:_size ,)
            ),
            color: Colors.red[500],
            onPressed: _setRatingAsThree,
            iconSize: _size,
          ),
        ),
      ],
    );
    
  }
}
