
import 'package:image_picker/image_picker.dart';


class GenricException implements Exception{}

PickImage(ImageSource scource) async{
final ImagePicker _imagepicker=ImagePicker();
XFile? file=await _imagepicker.pickImage(source: scource);
if(file != null){

  return await file.readAsBytes();
 
}

 print("no image selected");
 return null;
}