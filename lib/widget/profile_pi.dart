
import 'package:flutter/material.dart';
userProfilePic({radius:24}) {
  return CircleAvatar(
    radius: radius,
    backgroundImage: Image.network(
        "https://starsunfolded.com/wp-content/uploads/2018/03/Sakshi-Malik.jpg")
        .image,
  );
}
