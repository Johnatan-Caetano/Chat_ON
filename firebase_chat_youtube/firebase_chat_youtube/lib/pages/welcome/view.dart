import 'package:ChatON/pages/welcome/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

class WelcomePage extends GetView<WelcomeController> {
WelcomePage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SizedBox(
        width: 360.w,
        height: 780.w,
        child:Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              scrollDirection: Axis.horizontal,
              reverse: false,
              onPageChanged: (index){
                controller.changePage(index);
              },
              controller: PageController(
                initialPage: 0, keepPage: false, viewportFraction: 1
              ),
              pageSnapping: true,
              physics: const ClampingScrollPhysics(),
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.grey[900], 
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Widget de imagem
                        Image.asset(
                          "assets/images/Chat_On_logo_branco.png",
                          width: 92, 
                          height: 150, 
                          fit: BoxFit.cover, 
                        ),
                        SizedBox(height: 100), 
                        // Widget de texto
                       const Padding(
                          padding: EdgeInsets.all(12),
                          child: Center(
                            child: Text(
                              'Está pronto(a) para mergulhar em Uma experiência inovadora que irá Transformar a maneira como você Vive a sua vida?',
                              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.grey[900], // Escolha o tom de cinza escuro que você deseja aqui
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Widget de imagem
                        Image.asset(
                          "assets/images/banner2.png", // Substitua pelo caminho da sua imagem
                          width: 150, // Defina a largura desejada da imagem
                          height: 180, // Defina a altura desejada da imagem
                          fit: BoxFit.cover, // Defina o ajuste da imagem dentro do espaço
                        ),
                        SizedBox(height: 80), // Espaçamento entre a imagem e o texto
                        // Widget de texto
                       const Padding(
                          padding: EdgeInsets.all(12),
                          child: Center(
                            child: Text(
                              'UM APP SEM LIMITES',
                              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: Text(
                              'Mensagens de texto, mensagens de voz, localização em tempo real, fotos e vídeos, seja tirada na hora, ou enviadas de sua galeria!',
                              style: TextStyle(color: Colors.white, fontSize: 22),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                Center(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.grey[900], // Set the background color to gray
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/Chat_On_logo_branco.png", // Substitua pelo caminho da sua imagem
                          width: 92, 
                          height: 150, 
                          fit: BoxFit.cover, 
                        ),
                        SizedBox(height: 80),

                        ElevatedButton(
                          onPressed: () => controller.handleSignIn(),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.white),
                            ),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(vertical: 16, horizontal: 40), // Adjust the values to change the button size
                            ),
                          ),
                          child: const Text(
                            "Login/Cadastro",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              
                            )
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 70,
              child: DotsIndicator(
                position: controller.state.index.value.toDouble(),
                dotsCount: 3,
                reversed: false,
                mainAxisAlignment: MainAxisAlignment.center,
                decorator: DotsDecorator(
                  size: Size.square(9),
                  activeSize: Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
              )
            ),
          ],
          ),
      ),
    ),
    );
  }
}