import 'package:flutter/material.dart';

InkWell myicons({required IconData icon,required Color bacgroundColor,required Color iconColor}) {
    return InkWell(
          
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:bacgroundColor
            ),
          child: Icon(icon,size: 15,color: iconColor,),
                   ),
        );
  }

