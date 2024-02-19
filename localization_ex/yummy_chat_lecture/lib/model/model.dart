import 'package:flutter/material.dart';
import 'package:yummy_chat_lecture/config/palette.dart';

class Model {

  InputDecoration textFormDecoration(String hintText) {

    var icon;

    if( hintText == 'User name' ) {
      icon = Icons.account_circle;

    } else if( hintText == 'Email' ) {
      icon = Icons.email;

    } else if( hintText == 'Password' ) {
      icon = Icons.lock;
    }

    return InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Palette.iconColor,
        ),

        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Palette.textColor1
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(35.0)
          ),
        ),

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Palette.textColor1
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(35.0)
          ),
        ),

        hintText: '$hintText',

        hintStyle: TextStyle(
            fontSize: 14,
            color: Palette.textColor1
        ),

        contentPadding: EdgeInsets.all(10)
    );

  }
}