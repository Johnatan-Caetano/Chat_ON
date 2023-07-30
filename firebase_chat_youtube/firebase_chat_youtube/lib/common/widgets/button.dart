import 'package:flutter/material.dart';
import 'package:ChatON/common/values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class btnFlatButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color gbColor;
  final String title;
  final Color fontColor;
  final double fontSize;
  final String fontName;
  final FontWeight fontWeight;
  final double elevation;
  final ImageProvider? image; // Nova propriedade para a imagem

  btnFlatButtonWidget({
    required this.onPressed,
    this.width = 140,
    this.height = 44,
    this.gbColor = Colors.white, // Defina o fundo para branco
    this.title = "button",
    this.fontColor = AppColors.primaryElementText,
    this.fontSize = 16,
    this.fontName = "Montserrat",
    this.fontWeight = FontWeight.w400,
    this.elevation = 4, // Defina um valor maior que 0 para a sombra
    this.image, // Valor padrão é null (sem imagem)
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      child: TextButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation),
          textStyle: MaterialStateProperty.all(TextStyle(
            fontSize: fontSize.sp,
          )),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.focused) &&
                  !states.contains(MaterialState.pressed)) {
                return Colors.blue;
              } else if (states.contains(MaterialState.pressed)) {
                return Colors.deepPurple;
              }
              return fontColor;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.blue[200];
            }
            return gbColor;
          }),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: Radii.k6pxRadius,
          )),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null) // Se houver imagem, adiciona ao Row
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image(image: image!),
              ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: fontColor,
                fontWeight: fontWeight,
                fontSize: fontSize.sp,
                height: 1,
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}





///
Widget btnFlatButtonBorderOnlyWidget({
  required VoidCallback onPressed,
  double width = 88,
  double height = 44,
  required String iconFileName,
}) {
  return Container(
    width: width.w,
    height: height.h,
    child: TextButton(
      style: ButtonStyle(
        // textStyle: MaterialStateProperty.all(TextStyle(
        //   fontSize: 16.sp,
        // )),
        // foregroundColor: MaterialStateProperty.resolveWith(
        //   (states) {
        //     if (states.contains(MaterialState.focused) &&
        //         !states.contains(MaterialState.pressed)) {
        //       return Colors.blue;
        //     } else if (states.contains(MaterialState.pressed)) {
        //       return Colors.deepPurple;
        //     }
        //     return AppColors.primaryElementText;
        //   },
        // ),
        // backgroundColor: MaterialStateProperty.resolveWith((states) {
        //   if (states.contains(MaterialState.pressed)) {
        //     return Colors.blue[200];
        //   }
        //   return AppColors.primaryElement;
        // }),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: Radii.k6pxRadius,
        )),
      ),
      child: Image.asset(
        "assets/images/icons-$iconFileName.png",
      ),
      onPressed: onPressed,
    ),
  );
}
