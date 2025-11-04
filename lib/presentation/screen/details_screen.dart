import 'package:countires_bloc/domain/entity/countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  final Countries country;
  const DetailsScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
                children: <Widget>[
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    country.name ?? "",
                    style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 24 ),
                  ),
                  (country.flag != null) ? SizedBox(
                width: 200,
                height: 200,
                child: SvgPicture.network(
                  country.flag!,
                  fit: BoxFit.cover,
                ),
              )
                  : Icon(Icons.flag),
                  Text(
                    country.currency?.code ?? "",
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    country.currency?.symbol ?? "",
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                ],
              )),
            ]),
          ),
        ));
  }
}
