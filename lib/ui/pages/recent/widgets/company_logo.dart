import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kodilan_flutter/models/company.dart';

import '../../search_result/search_result_view.dart';

class CompanyLogoWidget extends StatelessWidget {
  final Company company;
  final double width;
  final double height;
  const CompanyLogoWidget(this.company, this.height, this.width, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isSvg = company.logo!.endsWith('.svg');
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResult(company: company.slug),
          ),
        );
      },
      child: isSvg
          ? SvgPicture.network(
              company.logo!,
              width: width,
            )
          : Image.network(
              company.logo!,
              width: width,
              height: height,
              errorBuilder: (context, url, error) => Image(
                image: const AssetImage(
                    'lib/assets/images/empty-company-logo.png'),
                width: width,
                height: height,
              ),
            ),
    );
  }
}
