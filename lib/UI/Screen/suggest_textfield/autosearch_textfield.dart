import 'package:flutter/material.dart';
import 'package:vpn_scanner/UI/Screen/suggest_textfield/rich_text_controller.dart';

typedef OnTap = void Function(int index);

class AutoSearchInput extends StatefulWidget {
  List<String>? data;
  Color? selectedTextColor,unSelectedTextColor,enabledBorderColor,disabledBorderColor,focusedBorderColor,cursorColor;
  double? borderRadius,fontSize,singleItemHeight;
  String? hintText;
  bool? autoCorrect,enabled;
  Function? onSubmitted,onEditingComplete;
  OnTap? onItemTap;
  int? maxLine,maxElementsToDisplay,itemsShownAtStart;

  AutoSearchInput({
    @required this.data,
    @required this.maxElementsToDisplay,
    @required this.onItemTap,
    this.selectedTextColor,
    this.unSelectedTextColor,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.focusedBorderColor,
    this.cursorColor,
    this.borderRadius = 10.0,
    this.fontSize = 20.0,
    this.singleItemHeight = 40.0,
    this.itemsShownAtStart = 10,
    this.hintText,
    this.autoCorrect = true,
    this.enabled = true,
    this.onSubmitted,
    this.onEditingComplete, this.maxLine,
  }) : assert(data != null, maxElementsToDisplay != null);

  @override
  _AutoSearchInputState createState() => _AutoSearchInputState();
}

class _AutoSearchInputState extends State<AutoSearchInput> {
  List<String> results = [];
  bool isItemClicked = false;

  // TextEditingController? cSearch = TextEditingController();

  RichTextController? cSearch;


  @override
  void initState() {
    super.initState();
    cSearch = RichTextController();
    cSearch!..addListener(() {
      setState(() {
        var index1 = cSearch!.text.toLowerCase().lastIndexOf(' ');
        debugPrint('index1 : $index1');

        if(index1 > 0) {
          var cText = cSearch!.text.substring(index1).trim();
          debugPrint('cText : $cText');
          results = widget.data!.where((element) => element.toLowerCase().startsWith(cText.toLowerCase())).toList();
          debugPrint('index1>0 results : $results');

        }else{
          results = widget.data!.where((element) => element.toLowerCase().startsWith(cSearch!.text.toLowerCase())).toList();
          debugPrint('else results : $results => ${results.length}');

        }
        debugPrint('else results => 1 : ${results.length}');
        if (results.length > widget.maxElementsToDisplay!) {
          debugPrint('if 2 results.length: ${results.length}');

          results = results.sublist(0, widget.maxElementsToDisplay);
        }
        debugPrint('addListener => results : $results');
      });
    });
  }

  @override
  void dispose() {
    cSearch!.dispose();
    super.dispose();
  }

  List addText = [];
  String? suggestString = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          autofillHints: widget.data,
          controller: cSearch,
          autocorrect: widget.autoCorrect!,
          enabled: widget.enabled,
          onEditingComplete: () => widget.onEditingComplete!,
          onSubmitted: (val) => widget.onSubmitted!,
          maxLines: widget.maxLine,
          onTap: () {
            setState(() {
              if (isItemClicked) {
                isItemClicked = !isItemClicked;
              }
            });
          },
          onChanged: (onChangedVal) {

            // addText.clear();
            // if(onChangedVal)
            addText = onChangedVal.split(' ');
            debugPrint('onChanged => addText : ${addText}');

            ///////////
            results = widget.data!.where((element) => element.toLowerCase().startsWith(addText.last.toLowerCase())).toList();
            debugPrint('onChanged => results : $results');
            // debugPrint('onChanged => results[0] : ${results[0]}');

            var a = onChangedVal.substring(0, cSearch!.text.length);
            debugPrint('onChangedVal.substring => a : $a'); //A

            try {
              debugPrint('addText.last : ${addText.last}');
              var c  = widget.data!.where((element) => element.toLowerCase().startsWith(addText.last.toLowerCase())).toList()[0];
              debugPrint('c : $c'); //Apple
              suggestString = c.substring(addText.last.length, c.length);
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
            else{
              if(addText.last == '') {
                cSearch!.suggestText = '';
              }
              else{
                cSearch!.suggestText = suggestString;
              }
            }
          },
          decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding: const EdgeInsets.all(10.0),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.disabledBorderColor ?? Colors.grey.shade200),
                  borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius!))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.enabledBorderColor ?? Colors.grey.shade200),
                  borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius!))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.focusedBorderColor ?? Colors.grey.shade200),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(widget.borderRadius!), topRight: Radius.circular(widget.borderRadius!)))),
          style: TextStyle(fontSize: widget.fontSize),
          cursorColor: widget.cursorColor ?? Colors.grey.shade600,
        ),
        if (!isItemClicked)
          Container(
            height: widget.itemsShownAtStart! * widget.singleItemHeight!,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: results.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: widget.singleItemHeight,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      // borderRadius: BorderRadius.only(
                      //     bottomLeft: Radius.circular(index == (results.length - 1) ? widget.borderRadius! : 0.0),
                      //     bottomRight: Radius.circular(index == (results.length - 1) ? widget.borderRadius! : 0.0))
                  ),
                  child: GestureDetector(
                    onTap: () {
                      addText.removeLast();
                      addText.add(results[index]);
                      cSearch!.text = addText.join(' ');
                      cSearch!.selection = TextSelection.fromPosition(TextPosition(offset: cSearch!.text.length));
                      cSearch!.suggestText = '';
                    },
                    child: Text(results[index].toString())

                    // _getRichText(results[index]),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:vpn_scanner/UI/Screen/suggest_textfield/rich_text_controller.dart';
//
// typedef OnTap = void Function(int index);
//
// class AutoSearchInput extends StatefulWidget {
//   List<String>? data;
//   Color? selectedTextColor,unSelectedTextColor,enabledBorderColor,disabledBorderColor,focusedBorderColor,cursorColor;
//   double? borderRadius,fontSize,singleItemHeight;
//   String? hintText;
//   bool? autoCorrect,enabled;
//   Function? onSubmitted,onEditingComplete;
//   OnTap? onItemTap;
//   int? maxLine,maxElementsToDisplay,itemsShownAtStart;
//
//   AutoSearchInput({
//     @required this.data,
//     @required this.maxElementsToDisplay,
//     @required this.onItemTap,
//     this.selectedTextColor,
//     this.unSelectedTextColor,
//     this.enabledBorderColor,
//     this.disabledBorderColor,
//     this.focusedBorderColor,
//     this.cursorColor,
//     this.borderRadius = 10.0,
//     this.fontSize = 20.0,
//     this.singleItemHeight = 40.0,
//     this.itemsShownAtStart = 10,
//     this.hintText,
//     this.autoCorrect = true,
//     this.enabled = true,
//     this.onSubmitted,
//     this.onEditingComplete, this.maxLine,
//   }) : assert(data != null, maxElementsToDisplay != null);
//
//   @override
//   _AutoSearchInputState createState() => _AutoSearchInputState();
// }
//
// class _AutoSearchInputState extends State<AutoSearchInput> {
//   List<String> results = [];
//   bool isItemClicked = false;
//
//   TextEditingController? cSearch = TextEditingController();
//
//   // RichTextController? cSearch = RichTextController(
//   //   patternMatchMap: {
//   //     RegExp(r"\B#[a-zA-Z0-9]+\b"):TextStyle(color:Colors.red),
//   //     RegExp(r"\B@[a-zA-Z0-9]+\b"):TextStyle(fontWeight: FontWeight.w800 ,color:Colors.blue),
//   //     RegExp(r"\B![a-zA-Z0-9]+\b"):TextStyle(color:Colors.yellow, fontStyle:FontStyle.italic),
//   //   },
//   //   stringMatchMap: {
//   //     "String1":TextStyle(color: Colors.red),
//   //     "String2":TextStyle(color: Colors.yellow),
//   //   },
//   //   onMatch: (List<String> matches) { },
//   //   deleteOnBack: true,
//   // );
//
//   @override
//   void initState() {
//     super.initState();
//     cSearch!..addListener(() {
//         setState(() {
//           var index1 = cSearch!.text.toLowerCase().lastIndexOf(' ');
//           debugPrint('index1 : $index1');
//
//           if(index1>0) {
//             var cText = cSearch!.text.substring(index1).trim();
//             debugPrint('cText : $cText');
//             results = widget.data!.where((element) => element.toLowerCase().startsWith(cText.toLowerCase())).toList();
//             debugPrint('index1>0 results : $results');
//
//           }else{
//             results = widget.data!.where((element) => element.toLowerCase().startsWith(cSearch!.text.toLowerCase())).toList();
//             debugPrint('else results : $results => ${results.length}');
//
//           }
//           debugPrint('else results => 1 : ${results.length}');
//           if (results.length > widget.maxElementsToDisplay!) {
//             debugPrint('if 2 results.length: ${results.length}');
//
//             results = results.sublist(0, widget.maxElementsToDisplay);
//           }
//           debugPrint('addListener => results : $results');
//         });
//       });
//   }
//
//   @override
//   void dispose() {
//     cSearch!.dispose();
//     super.dispose();
//   }
//
//   Widget _getRichText(String result) {
//     debugPrint('result : $result');
//     return RichText(
//       text: cSearch!.text.length > 0
//         ? TextSpan(
//             children: [
//               if (cSearch!.text.length > 0)
//                 TextSpan(
//                   text: result.substring(0, cSearch!.text.length),
//                   style: TextStyle(fontSize: widget.fontSize, color: widget.selectedTextColor != null ? widget.selectedTextColor : Colors.black)),
//                 TextSpan(
//                   text: result.substring(cSearch!.text.length, result.length),
//                   style: TextStyle(fontSize: widget.fontSize, color: widget.unSelectedTextColor != null ? widget.unSelectedTextColor : Colors.grey[400]))
//             ],
//           )
//         : TextSpan(
//             text: result,
//             style: TextStyle(fontSize: widget.fontSize, color: widget.unSelectedTextColor != null ? widget.unSelectedTextColor : Colors.grey[400]),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           autofillHints: widget.data,
//           controller: cSearch,
//           autocorrect: widget.autoCorrect!,
//           enabled: widget.enabled,
//           onEditingComplete: () => widget.onEditingComplete!,
//           onSubmitted: (val) => widget.onSubmitted!,
//           maxLines: widget.maxLine,
//           onTap: () {
//             setState(() {
//               if (isItemClicked) {
//                 isItemClicked = !isItemClicked;
//               }
//             });
//           },
//           onChanged: (onChangedVal) {
//             // var a = onChangedVal.substring(0, cSearch!.text.length);
//             // debugPrint('a : $a');
//             //
//             // try {
//             //   var c  = widget.data!.where((element) => element.toLowerCase().startsWith(cSearch!.text.toLowerCase())).toList()[0];
//             //   debugPrint('c : $c');
//             //   var b = c.substring(cSearch!.text.length, c.length);
//             //   debugPrint('b : $b');
//             // } catch(e) {
//             //   debugPrint('onChanged => ERROR : $e');
//             // }
//             //
//             // var test = widget.data!.where((element) => element.toLowerCase().contains(cSearch!.text.toLowerCase()));
//             // debugPrint('onChanged => test : $test');
//             //
//             //
//             //
//             // var index1 = cSearch!.text.toLowerCase().lastIndexOf(' ');
//             // debugPrint('onChanged => index1 : $index1');
//             // if(index1 == 1) {
//             //   // var test1 = widget.data!.where((element) => element.toLowerCase().contains(cSearch!.text.toLowerCase()));
//             //   // debugPrint('onChanged => test1 : $test1');
//             //   var index2 = widget.data!.where((element) => element.toLowerCase().contains(cSearch!.text.substring(index1)));// ;
//             //   debugPrint('onChanged => index2 : $index2');
//             //
//             // }
//             // var index2 = cSearch!.text.substring(index1);
//             // debugPrint('onChanged => index2 : $index2');
//
//           },
//           decoration: InputDecoration(
//             hintText: widget.hintText,
//             contentPadding: const EdgeInsets.all(10.0),
//             disabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: widget.disabledBorderColor ?? Colors.grey.shade200),
//               borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius!))),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: widget.enabledBorderColor ?? Colors.grey.shade200),
//               borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius!))),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: widget.focusedBorderColor ?? Colors.grey.shade200),
//               borderRadius: BorderRadius.only(topLeft: Radius.circular(widget.borderRadius!), topRight: Radius.circular(widget.borderRadius!)))),
//           style: TextStyle(fontSize: widget.fontSize),
//           cursorColor: widget.cursorColor ?? Colors.grey.shade600,
//         ),
//         if (!isItemClicked)
//           Container(
//             height: widget.itemsShownAtStart! * widget.singleItemHeight!,
//             child: ListView.builder(
//               scrollDirection: Axis.vertical,
//               itemCount: results.length,
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return Container(
//                   height: widget.singleItemHeight,
//                   padding: const EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey.shade300),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(index == (results.length - 1) ? widget.borderRadius! : 0.0),
//                       bottomRight: Radius.circular(index == (results.length - 1) ? widget.borderRadius! : 0.0))),
//                   child: GestureDetector(
//                     onTap: () {
//                       String value = results[index];
//                       widget.onItemTap!(widget.data!.indexOf(value));
//                       cSearch!.text = value;
//                       cSearch!.selection = TextSelection.fromPosition(TextPosition(offset: value.length));
//                       setState(() {
//                         isItemClicked = !isItemClicked;
//                       });
//                     },
//                     child: _getRichText(results[index]),
//                   ),
//                 );
//               },
//             ),
//           ),
//       ],
//     );
//   }
// }
//
//
