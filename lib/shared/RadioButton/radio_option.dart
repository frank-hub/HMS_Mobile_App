import 'package:flutter/material.dart';

class MyRadioOption<T> extends StatelessWidget {

  final T value;
  final T? groupValue;
  final String label;
  final String text;
  final String image;
  final ValueChanged<T?> onChanged;

  const MyRadioOption({
    required this.value,
    required this.groupValue,
    required this.label,
    required this.text,
    required this.image,
    required this.onChanged,
  });

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;

    return Container(
      width: 50,
      height: 30,
      decoration: ShapeDecoration(
        shape: CircleBorder(

          side: BorderSide(
            color: Colors.black,
          ),
        ),
        color: isSelected ?  Color(0xFF5A54C4) : Colors.white,
      ),
      child: Center(
        child: Text(
          label.toString(),
          style: TextStyle(
            color: isSelected ? Colors.white :  Color(0xFF5A54C4),
            fontSize: 20,
          ),
        ),
      ),
    );

  }

  Widget _buildText() {
    return Row(
      children: [
      Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 24),
    )  ,


      ],
    );
  }
  Widget _buildmage(){
    return Image.asset(image,width: 50,height: 40.0,);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () => onChanged(value),
        splashColor: Colors.cyan.withOpacity(0.5),
        child: Padding(
          padding: EdgeInsets.all(5),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildLabel(),
              const SizedBox(width: 10),
              _buildText(),
              const SizedBox(width: 30,),
              _buildmage(),
            ],
          ),
        ),
      ),
    );
  }
}