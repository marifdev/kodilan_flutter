import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CompanyLogoWidget extends StatelessWidget {
  final String companyLogo;
  final double width;
  final double height;
  const CompanyLogoWidget(this.companyLogo, this.height, this.width, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: companyLogo,
      errorWidget: (context, url, error) => const Image(
        image: AssetImage('lib/assets/images/empty-company-logo.png'),
        width: 40,
        height: 40,
      ),
    );
  }
}
