import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/size_config.dart';
import 'package:food_delivery/utils/styles.dart';
class ExpandableText extends StatefulWidget {
   ExpandableText({super.key, required this.text});
  String text ;
  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

late String firstHalf;
late String lastHalf;
double textHeight = SizeConfig.verticalBlock*100;
bool hiddenText = true;
class _ExpandableTextState extends State<ExpandableText> {
  @override
  void initState(){
    super.initState();
    if(widget.text.length> textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt() );
      lastHalf = widget.text.substring(textHeight.toInt()+1 , widget.text.length);
    }
    else
      {
        firstHalf = widget.text;
        lastHalf ="";

      }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: lastHalf.isEmpty? Text(firstHalf):Column(
        children: [
          Text(hiddenText? ('$firstHalf...'):firstHalf+lastHalf, style: TextStyles.textStyle15,),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;

              });
            },
            child: Row(
              children: [
                Text(hiddenText?"show more":"show less", style: TextStyles.textStyle15.copyWith(color: AppColors.mainColor)),
                 Icon( hiddenText?Icons.arrow_drop_down: Icons.arrow_drop_up, color: AppColors.mainColor,)
              ],
            ),
          )
        ],
      )
      ,
    );
  }
}
