// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:vtc_app/core/const/app_colors.dart';

// class ImagePickerWidget extends StatefulWidget {
//   final double avatarRadius;
//   final double iconSize;
//   final Function(XFile?)? onImageChanged;
//   final XFile? initialImage;
//   final bool showCameraIcon; // ✅ Nouveau paramètre
//   final bool showEditText;   // ✅ Nouveau paramètre
//   final String editText;     // ✅ Nouveau paramètre

//   const ImagePickerWidget({
//     super.key,
//     this.avatarRadius = 50,
//     this.iconSize = 45,
//     this.onImageChanged,
//     this.initialImage,
//     this.showCameraIcon = true, // ✅ Par défaut visible
//     this.showEditText = false,  // ✅ Par défaut caché
//     this.editText = "Edit Profile Image", // ✅ Texte personnalisable
//   });

//   @override
//   State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
// }

// class _ImagePickerWidgetState extends State<ImagePickerWidget> {
//   XFile? _image;
//   final ImagePicker _picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     _image = widget.initialImage;
//   }

//   Future<void> _pickImage(ImageSource source) async {
//     try {
//       final XFile? pickedImage = await _picker.pickImage(source: source);
//       if (pickedImage != null) {
//         setState(() {
//           _image = pickedImage;
//         });
//         widget.onImageChanged?.call(pickedImage);
//       }
//     } catch (e) {
//       print("Erreur lors de la sélection d'image: $e");
//     }
//   }

//   void _showImagePickerModal(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: AppColors.primary,
//           ),
//           padding: EdgeInsets.all(20),
//           width: double.infinity,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 "Modify Profile Image",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//               SizedBox(height: 20),
//               _buildPickerOption(
//                 icon: Icons.photo_library,
//                 text: "Choose from Gallery",
//                 onTap: () => _pickImage(ImageSource.gallery),
//               ),
//               SizedBox(height: 10),
//               _buildPickerOption(
//                 icon: Icons.camera_alt,
//                 text: "Take a photo",
//                 onTap: () => _pickImage(ImageSource.camera),
//               ),
//               SizedBox(height: 10),
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: Text(
//                   "Cancel",
//                   style: TextStyle(color: AppColors.secondary),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildPickerOption({
//     required IconData icon,
//     required String text,
//     required VoidCallback onTap,
//   }) {
//     return TextButton(
//       onPressed: onTap,
//       child: Container(
//         padding: EdgeInsets.all(15),
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: AppColors.accent,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Row(
//           children: [
//             Icon(icon, color: AppColors.secondary, size: 24),
//             SizedBox(width: 15),
//             Text(
//               text,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//             Spacer(),
//             Icon(
//               Icons.arrow_forward_ios_outlined,
//               color: Colors.white,
//               size: 16,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         // Avatar avec/sans icône camera
//         Stack(
//           alignment: Alignment.center,
//           children: [
//             // Avatar principal
//             CircleAvatar(
//               backgroundColor: AppColors.primary,
//               radius: widget.avatarRadius,
//               child: _image != null
//                   ? ClipOval(
//                       child: Image.file(
//                         File(_image!.path),
//                         width: widget.avatarRadius * 2,
//                         height: widget.avatarRadius * 2,
//                         fit: BoxFit.cover,
//                       ),
//                     )
//                   : Icon(
//                       Icons.person,
//                       color: Colors.white,
//                       size: widget.iconSize,
//                     ),
//             ),
            
//             // Icône camera (conditionnelle)
//             if (widget.showCameraIcon)
//               Positioned(
//                 bottom: 0,
//                 right: 0,
//                 child: GestureDetector(
//                   onTap: () => _showImagePickerModal(context),
//                   child: Container(
//                     width: widget.avatarRadius * 0.6,
//                     height: widget.avatarRadius * 0.6,
//                     decoration: BoxDecoration(
//                       color: AppColors.secondary,
//                       shape: BoxShape.circle,
//                       border: Border.all(color: AppColors.primary, width: 2),
//                     ),
//                     child: Icon(
//                       Icons.camera_alt,
//                       color: Colors.white,
//                       size: widget.avatarRadius * 0.3,
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
        
//         // Texte "Edit Profile Image" (conditionnel)
//         if (widget.showEditText)
//           Padding(
//             padding: EdgeInsets.only(top: 8),
//             child: TextButton(
//               onPressed: () => _showImagePickerModal(context),
//               child: Text(
//                 widget.editText,
//                 style: TextStyle(
//                   color: AppColors.secondary,
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }