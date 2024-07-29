import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vpn_scanner/UI/Screen/suggetion_api/model/suggetion_api_model.dart';
import 'package:vpn_scanner/UI/Screen/suggetion_api/src/dbHelper.dart';
import 'package:vpn_scanner/UI/Screen/suggetion_api/widgets/controller.dart';
import 'dart:developer' as logger;

import 'package:vpn_scanner/UI/Screen/suggetion_api/widgets/overlay_container.dart';

typedef OnTap = void Function(String? index);

class DictionaryTextField extends StatefulWidget {
  // TextEditingController? controller;
  ValueChanged<String>? onChange;
  // String? hintText;
  // Widget? label;
  // Widget? icon;
  // Color? iconColor;
  // String? labelText;
  // TextStyle? labelStyle;
  // TextStyle? floatingLabelStyle;
  // String? helperText;
  // TextStyle? helperStyle;
  // int? helperMaxLines;
  // TextStyle? hintStyle;
  // TextDirection? hintTextDirection;
  // int? hintMaxLines;
  // String? errorText;
  // TextStyle? errorStyle;
  // int? errorMaxLines;
  // FloatingLabelBehavior? floatingLabelBehavior;
  // bool? isDense;
  // EdgeInsetsGeometry? contentPadding;
  // bool isCollapsed;
  // Widget? prefixIcon;

  // BoxConstraints? prefixIconConstraints;
  // Widget? prefix;
  // String? prefixText;
  // TextStyle? prefixStyle;
  // Color? prefixIconColor;
  // Widget? suffixIcon;
  // Widget? suffix;
  // String? suffixText;
  // TextStyle? suffixStyle;
  // Color? suffixIconColor;
  // BoxConstraints? suffixIconConstraints;
  // String? counterText;
  // Widget? counter;
  // TextStyle? counterStyle;
  // bool? filled;
  // Color? fillColor;
  // Color? focusColor;
  // Color? hoverColor;
  // InputBorder? errorBorder;
  // InputBorder? focusedBorder;
  // InputBorder? focusedErrorBorder;
  // InputBorder? disabledBorder;
  // InputBorder? enabledBorder;
  // InputBorder? border;
  // bool? decorationEnabled;
  // String? semanticCounterText;
  // bool? alignLabelWithHint;
  // BoxConstraints? constraints;




  ////
  String? initialValue;
  FocusNode? focusNode;
  InputDecoration? decoration = const InputDecoration();
  TextInputType? keyboardType;
  TextCapitalization textCapitalization = TextCapitalization.none;
  TextInputAction? textInputAction;
  TextStyle? style;
  StrutStyle? strutStyle;
  TextDirection? textDirection;
  TextAlign textAlign = TextAlign.start;
  TextAlignVertical? textAlignVertical;
  bool autofocus = false;
  bool readOnly = false;
  ToolbarOptions? toolbarOptions;
  bool? showCursor;
  String obscuringCharacter = '•';
  bool obscureText = false;
  bool autocorrect = true;
  SmartDashesType? smartDashesType;
  SmartQuotesType? smartQuotesType;
  bool enableSuggestions = true;
  bool maxLengthEnforced = true;
  MaxLengthEnforcement? maxLengthEnforcement;
  int? maxLines = 1;
  int? minLines;
  bool expands = false;
  int? maxLength;
  GestureTapCallback? onTap;
  VoidCallback? onEditingComplete;
  ValueChanged<String>? onFieldSubmitted;
  FormFieldSetter<String>? onSaved;
  FormFieldValidator<String>? validator;
  List<TextInputFormatter>? inputFormatters;
  bool? enabled;
  double cursorWidth = 2.0;
  double? cursorHeight;
  Radius? cursorRadius;
  Color? cursorColor;
  Brightness? keyboardAppearance;
  EdgeInsets scrollPadding = const EdgeInsets.all(20.0);
  bool enableInteractiveSelection = true;
  TextSelectionControls? selectionControls;
  InputCounterWidgetBuilder? buildCounter;
  ScrollPhysics? scrollPhysics;
  Iterable<String>? autofillHints;
  AutovalidateMode? autovalidateMode;
  ScrollController? scrollController;
  String? restorationId;
  bool? enableIMEPersonalizedLearning;
  int? maxElementsToDisplay;
  OnTap? onChangeValue;
  Decoration? listDecoration,itemDecoration;
  TextStyle? listItemStyle;
  double? listHeight,listWidth;
  Color? selectedTextColor,unSelectedTextColor;
  bool showSuggestionList;
  double? listItemFontSize;
  EdgeInsetsGeometry? itemPadding,itemMargin;
  String? selectedFontFamily,unSelectedFontFamily;
  double? itemHeight,itemWidth;
  DropdownPosition? position;
  DictionaryTextField({
    Key? key,
    // this.controller,
    this.onTap,
    this.onEditingComplete,
    this.onSaved,
    // this.hintText,this.label,
    // this.icon,
    // this.iconColor,
    // this.labelText,
    // this.labelStyle,
    // this.floatingLabelStyle,
    // this.helperText,
    // this.helperStyle,
    // this.helperMaxLines,
    // this.hintStyle,
    // this.hintTextDirection,
    // this.hintMaxLines,
    // this.errorText,
    // this.errorStyle,
    // this.errorMaxLines,
    // this.floatingLabelBehavior,
    // this.isCollapsed = false,
    // this.isDense,
    // this.contentPadding,
    // this.prefixIcon,
    // this.prefixIconConstraints,
    // this.prefix,
    // this.prefixText,
    // this.prefixStyle,
    // this.prefixIconColor,
    // this.suffixIcon,
    // this.suffix,
    // this.suffixText,
    // this.suffixStyle,
    // this.suffixIconColor,
    // this.suffixIconConstraints,
    // this.counter,
    // this.counterText,
    // this.counterStyle,
    // this.filled,
    // this.fillColor,
    // this.focusColor,
    // this.hoverColor,
    // this.errorBorder,
    // this.focusedBorder,
    // this.focusedErrorBorder,
    // this.disabledBorder,
    // this.enabledBorder,
    // this.border,
    this.enabled = true,
    // this.semanticCounterText,
    // this.alignLabelWithHint,
    // this.constraints,
    // this.decorationEnabled,
    this.scrollController,
    this.enableIMEPersonalizedLearning,
    this.onChangeValue,this.maxElementsToDisplay = 5,this.listDecoration,
    this.listItemStyle,
    this.listHeight,this.listWidth,
    this.selectedTextColor,
    this.unSelectedTextColor,
    this.showSuggestionList = false,
    this.decoration,
    this.listItemFontSize,this.itemPadding,this.itemMargin,this.itemDecoration,
    this.selectedFontFamily,this.unSelectedFontFamily,
    this.itemHeight,this.itemWidth,
    this.position = DropdownPosition.BELOW,
    this.focusNode

  }) : super(key: key);

  @override
  State<DictionaryTextField> createState() => _DictionaryTextFieldState();
}

class _DictionaryTextFieldState extends State<DictionaryTextField> {

  CustomController? cSearch = CustomController();
  // List<String> results = [];
  bool isItemClicked = false;
  DatabaseHelper dbHelper = DatabaseHelper();
  List<String> names = [];

  List addText = [];
  String? suggestString = '';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    cSearch!.addListener(() async {
      addText = cSearch!.text.split(' ');
      debugPrint('onChanged => addText : $addText');

      /// GET ONLY TYPED VALUE
      // var a = cSearch!.text.substring(0, cSearch!.text.length);
      // debugPrint('onChangedVal.substring => a : $a');
      // debugPrint('onChangedVal.substring => a.length : ${a.length}');
      // if(cSearch!.text.endsWith(' ')){
      //   suggestString = '';
      //   debugPrint("cSearch!.text.endsWith(' ') : ${cSearch!.text.endsWith(' ')}");
      // }
      // else

      debugPrint('addText : ${addText.last}');
      debugPrint('addText.runtimeType : ${addText.last.runtimeType}');
      if(cSearch!.text.length > 1 && cSearch!.text.substring(cSearch!.text.length -1) == ' '){
        names.clear();
        suggestString = '';
        cSearch!.suggestText = '';
        debugPrint('names =======> 1 : $names');
        debugPrint('suggestString =======> 1 : $suggestString');
      }
      else{
        try {
          debugPrint('addText.last : ${addText.last}');
          await dbHelper.getDataWithQuery(addText.last).then((value) {
            if(value != null) {
              names.clear();
              for (var f in value) {
                // debugPrint('f : $f');
                var a = Dictionary.fromMap(f);
                names.add(a.word.toString());
              }
            }
            debugPrint('names : ${names}');
          });
          var getFirstValue  = names[0]; // names.where((element) => element.toLowerCase().startsWith(addText.last.toLowerCase())).toList()[0];
          debugPrint('getFirstValue : $getFirstValue'); //Apple
          suggestString = getFirstValue.substring(addText.last.length, getFirstValue.length);

          debugPrint('suggestString : $suggestString'); //pple
        } catch(e) {
          suggestString = '';
          debugPrint('onChanged => ERROR : $e');
        }

        debugPrint('suggestString.length : ${suggestString!.length}');
        debugPrint('addText : ${addText}');
        if(cSearch!.text.isEmpty) {
          cSearch!.suggestText = '';
        }
        else {
          if(addText.last == '') {
            cSearch!.suggestText = '';
          }
          else{
            cSearch!.suggestText = suggestString;
          }
        }

        var index1 = cSearch!.text.toLowerCase().lastIndexOf(' ');
        debugPrint('index1 : $index1');
        if (names.length > widget.maxElementsToDisplay!) {
          debugPrint('names.length: ${names.length}');
          names = names.sublist(0, widget.maxElementsToDisplay);
        }
        debugPrint('addListener => names : $names');
      }
      debugPrint('names => $names');
      debugPrint('addText => $addText');
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: widget.decoration ??
            InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade50)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade500,width: 2))),
          restorationId: widget.restorationId,
          controller: cSearch,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          style: widget.style,
          strutStyle: widget.strutStyle,
          textAlign: widget.textAlign,
          textAlignVertical: widget.textAlignVertical,
          textDirection: widget.textDirection,
          textCapitalization: widget.textCapitalization,
          autofocus: widget.autofocus,
          toolbarOptions: widget.toolbarOptions,
          readOnly: widget.readOnly,
          showCursor: widget.showCursor,
          obscuringCharacter: widget.obscuringCharacter,
          obscureText: widget.obscureText,
          autocorrect: widget.autocorrect,
          smartDashesType: widget.smartDashesType ?? (widget.obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
          smartQuotesType: widget.smartQuotesType ?? (widget.obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
          enableSuggestions: widget.enableSuggestions,
          maxLengthEnforced: widget.maxLengthEnforced,

          maxLengthEnforcement: widget.maxLengthEnforcement,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          expands: widget.expands,
          maxLength: widget.maxLength,
          onChanged: (String? val) {
            widget.onChangeValue!(val);
          },
          onTap: widget.onTap ?? () {},
          onEditingComplete: () => widget.onEditingComplete ?? (){},
          onFieldSubmitted: widget.onFieldSubmitted,
          inputFormatters: widget.inputFormatters,
          enabled: widget.enabled ?? widget.decoration?.enabled ?? true,
          cursorWidth: widget.cursorWidth,
          cursorHeight: widget.cursorHeight,
          cursorRadius: widget.cursorRadius,
          cursorColor: widget.cursorColor,
          scrollPadding: widget.scrollPadding,
          scrollPhysics: widget.scrollPhysics,
          keyboardAppearance: widget.keyboardAppearance,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          selectionControls: widget.selectionControls,
          buildCounter: widget.buildCounter,
          autofillHints: widget.autofillHints,
          scrollController: widget.scrollController,
          enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning ?? true,
          onSaved: (onSavedVal) => widget.onSaved ?? (onSavedVal){},
        ),

        widget.showSuggestionList == false ? SizedBox() : Column(
          children: [
            widget.showSuggestionList == false ? SizedBox() : SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              height: widget.listHeight ?? MediaQuery.of(context).size.height * 0.7,
              width: widget.listWidth,
              alignment: Alignment.topLeft,
              // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              // margin: EdgeInsets.symmetric(),
              decoration: widget.listDecoration ?? BoxDecoration(color: Colors.grey.shade600),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: names.length,
                  itemBuilder: (context,index) {

                    return GestureDetector(
                        onTap: () {
                          // String value = results[index];
                          // widget.onChangeValue!(names[index]);
                          // cSearch!.text = value;
                          addText.last = names[index];
                          cSearch!.text = addText.join(' ');
                          debugPrint('onTap =>  cSearch!.text : ${cSearch!.text}');
                          suggestString = '';
                          // cSearch!.suggestText = '';
                          debugPrint('onTap => addText : ${addText}');
                          debugPrint('onTap => addText.last : ${addText.last}');
                          names.clear();
                          cSearch!.selection = TextSelection.fromPosition(TextPosition(offset:  cSearch!.text.length));
                          setState(() { });
                        },
                        // child: Container(
                        //     color: index % 2 == 0 ? Colors.grey[200] : Colors.white,
                        //     padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        //     child: Text('${index + 1} ${names[index]}',style: widget.listItemStyle ?? TextStyle(color: Colors.red),)
                        child: Container(
                          decoration: widget.itemDecoration ?? BoxDecoration(color: index % 2 == 0 ? Colors.grey[200] : Colors.white),
                          height: widget.itemHeight,
                          width: widget.itemWidth,
                          padding: widget.itemPadding ?? EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          margin: widget.itemMargin ?? EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: names[index].substring(0, addText.last.length),
                                  style: TextStyle(fontSize: widget.listItemFontSize, color:  widget.selectedTextColor ?? Colors.black,fontFamily: widget.selectedFontFamily )),
                                TextSpan(
                                  text: names[index].substring(addText.last.length, names[index].length),
                                  style: TextStyle(fontSize: widget.listItemFontSize, color:  widget.unSelectedTextColor ?? Colors.grey[400],fontFamily: widget.unSelectedFontFamily))
                              ]
                            )
                          ),
                        )
                      // ),
                    );
                  }),
            )
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cSearch!.dispose();
  }
}


// import 'package:flutter/material.dart';
//
// class CustomTextField extends StatefulWidget {
//   const CustomTextField({Key? key}) : super(key: key);
//
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   final layerLink = LayerLink();
//   late TextEditingController controller;
//   OverlayEntry? entry;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controller = TextEditingController();
//     WidgetsBinding.instance!.addPostFrameCallback((_) => showOverlay());
//   }
//
//   void hideOverlay() {
//     entry?.remove();
//     entry = null;
//   }
//
//   void showOverlay() {
//     final overlay = Overlay.of(context);
//     final renderbox = context.findRenderObject() as RenderBox;
//     final size = renderbox.size;
//     // final offset = renderbox.localToGlobal(Offset.zero);
//
//     entry =
//         OverlayEntry(builder: (context) => Positioned(
//           // left:  offset.dx,
//           // top:  offset.dy + size.height + 8,
//             width: size.width,
//             child: CompositedTransformFollower(
//                 link: layerLink,
//                 showWhenUnlinked: false,
//                 offset: Offset(0, size.height + 8),
//                 child:
//                 buildOverlay())));
//     overlay!.insert(entry!);
//   }
//
//   buildOverlay() => Material(
//     elevation: 8,
//     child: Column(
//       children: [
//         for (int i = 0; i < 6; i++) Text("item $i")
//         // ListView.builder(
//         //     itemCount: 5,
//         //     itemBuilder: (context, index) => Text("item") )
//       ],
//     ),
//   );
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CompositedTransformTarget(
//       link: layerLink,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//             decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//             child: TextField()),
//       ),
//     );
//   }
// }
//
// focusNode.addListener(() {
// if (focusNode.hasFocus) {
// showOverlay();
// } else {
// hideOverlay();
// }
// });
//
// final focusNode = FocusNode();