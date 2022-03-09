import 'package:flutter/material.dart';

mixin DeviceScreenMonitor {

  bool isLarge(context) {
    
    Size size = MediaQuery.of(context).size;
    double width = size.width > size.height ? size.height : size.width;

    if(width > 600) return true;
    else return false;

  } 


}