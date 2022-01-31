import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompanyLogoWidget extends StatelessWidget {
  final String companyLogo;
  final double width;
  final double height;
  const CompanyLogoWidget(this.companyLogo, this.height, this.width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isSvg = companyLogo.contains('.svg');
    return isSvg
        ? SvgPicture.network(
            companyLogo,
            width: width,
          )
        : Image.network(
            companyLogo,
            width: width,
            height: height,
            errorBuilder: (context, url, error) => Image(
              image: const AssetImage('lib/assets/images/empty-company-logo.png'),
              width: width,
              height: height,
            ),
          );
  }
}
