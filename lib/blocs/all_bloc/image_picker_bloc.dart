import 'package:bloc/bloc.dart';
import 'package:bloc_playlist/Utils/image_picker_utils.dart';
import 'package:bloc_playlist/blocs/events/image_picker_event.dart';
import 'package:bloc_playlist/states/image_picker_state.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBlock extends Bloc<ImagePickerEvent, ImagePickerStates> {
  final ImagePickerUtils pickerUtils;

  ImagePickerBlock(this.pickerUtils) : super(ImagePickerStates()) {
    on<CameraCapture>(cameraCapture);
    on<GalleryCapture>(galleryCapture);
  }

  void cameraCapture(CameraCapture event, Emitter<ImagePickerStates> states) async {
    XFile? file = await pickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void galleryCapture(GalleryCapture event, Emitter<ImagePickerStates> states) async {
    XFile? file = await pickerUtils.galleryCapture();
    emit(state.copyWith(file: file));
  }
}
