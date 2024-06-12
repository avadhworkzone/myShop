// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, unused_local_variable
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class TradingSearchingController extends GetxController {

  RxInt shoppingCounter = RxInt(0);
  var speechText='please the'.obs;
  var isListening=false.obs;
  SpeechToText ?speechToText;
  @override
  void onInit(){
    super.onInit();
    speechToText=SpeechToText();
  }

  void listen()async{
    try{
      if(!isListening.value){
      bool available=await speechToText!.initialize(
        onStatus: (val){},
        onError: (val){},
      );
      if(available){
        isListening.value=true;
        speechToText!.listen(
          onResult: (val){
            speechText.value=val.recognizedWords;
          }
        );
      }
    }
    else{
      isListening.value=false;
      speechToText!.stop();
      speechText.value='';
    }
    }catch(e){
      print('${e}error-----------');
    }
  }

  shoppingcounter() {
    shoppingCounter.value++;
    print(shoppingCounter.value);
  }

  
}
