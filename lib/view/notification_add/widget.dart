import 'package:flutter/material.dart';

class LevelUpMaterialDitile extends StatelessWidget {
  const LevelUpMaterialDitile({
    Key? key,
    required this.path,
    required this.materialName1,
    required this.materialName2,
    required this.materialName3,
  }) : super(key: key);

  final String path;
  final String materialName1;
  final String materialName2;
  final String materialName3;

  @override
  Widget build(BuildContext context) {
    return Row(
      // alignment: WrapAlignment.center,
      // runAlignment: WrapAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          height: 74,
          image: AssetImage(path),
        ),
        Column(
          children: [
            Text(
              materialName1,
              textScaleFactor: 1,
            ),
            if (materialName2 != '')
              Text(
                materialName2,
                textScaleFactor: 1,
              ),
            if (materialName3 != '')
              Text(
                materialName3,
                textScaleFactor: 1,
              ),
          ],
        ),
      ],
    );
  }
}
