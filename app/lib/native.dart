List<int> _range(int stop, {int start: 0, int step: 1}){
  if (step == 0)
    throw Exception("Step cannot be 0");
  return start < stop == step > 0
  ? List<int>.generate(((start-stop)/step).abs().ceil(), (int i) => start + (i * step))
  : [];
}

List<int> primesUntil(int n){
  List<dynamic> primes = _range(n + 1, start: 2);
  for (var i = 0; i < primes.length; i++){
    if (primes[i] != null){
      List<int> maybePrime = primes.where((e){
        if (e == null){return false;}
        return (e % primes[i]) == 0;
      }).toList();
      maybePrime = maybePrime.sublist(1);
      for (int number in maybePrime){
        if (number != null){
          primes[number - 2] = null;
        }
      }
    }
  }
  return primes.where((element) => element != null).toList();
}

List<int> primeFactorisation(int n, List<int> checkingUntil){
  List<int> primeFactors = [];
  final copy = n;
  for (int i in checkingUntil){
    while (n % i == 0){
      primeFactors.add(i);
      n = n~/i;
    }
  }
  if (n != 1 && n != copy){
    primeFactors.add(n);
  }
  return primeFactors;
}

// int x;
// int y;

// Text result = Text("");

// Text generateResult(int x, int y){
//   int gcd = x.gcd(y);
//   return Text(
//     "The greatest common divisor of $x and $y is $gcd."
//   );
// }

// class FindGCD extends StatefulWidget {
//   @override
//   _FindGCDState createState() => _FindGCDState();
// }

// class _FindGCDState extends State<FindGCD> {
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     double padding = findPadding(context);
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         title: Text('Find greatest common divisior'),
//       ),
//       drawer: MakeDrawer(1),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Form(
//               key: _formKey,
//               child: Column(
//                 children: <Widget>[
//                   Text(
//                     "Greatest Common Divisor Calculator",
//                     style: TextStyle(
//                       fontSize: 25
//                     ),
//                   ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       SizedBox(
//                         width: padding,
//                       ),
//                       Flexible(
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             hintText: "Please enter a number"
//                           ),
//                           onFieldSubmitted: (val){
//                             dynamic value = double.tryParse(val);
//                             if (val != null){
//                               setState(() {
//                                 x = value;
//                               });
//                             }
//                           },
//                           validator: (val){
//                             dynamic value = double.tryParse(val);
//                             if (value == null){
//                               return "Please enter a number";
//                             } else if (value < 2 || value > 999999999){
//                               return "Please enter a number between 2 and 999 999 999";
//                             }
//                             return null;
//                           }
//                         ),
//                       ),
//                       SizedBox(
//                         width: padding,
//                       ),
//                       Flexible(
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             hintText: "Please enter a number"
//                           ),
//                           onFieldSubmitted: (val){
//                             dynamic value = double.tryParse(val);
//                             if (val != null){
//                               setState(() {
//                                 y = value;
//                               });
//                             }
//                           },
//                           validator: (val){
//                             dynamic value = double.tryParse(val);
//                             if (value == null){
//                               return "Please enter a number";
//                             } else if (value < 2 || value > 999999999){
//                               return "Please enter a number between 2 and 999 999 999";
//                             }
//                             return null;
//                           }
//                         ),
//                       ),
//                       SizedBox(
//                         width: padding,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   RaisedButton(
//                     color: Colors.lime,
//                     onPressed: (){
//                      if (_formKey.currentState.validate()){
//                        setState(() {
//                         result = generateResult(x, y);
//                       });
//                      } else {
//                        setState(() {
//                          result = Text("");
//                        });
//                      }
//                     },
//                     child: Text(
//                       "Check",
//                       style: TextStyle(
//                         color: Colors.deepPurple
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
//                     child: result,
//                   )
//                 ],
//               )
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// int gcd(int x, int y){
//   return x.gcd(y);
// }

// List<String> mathFunctions = [
//   "Prime Number Calculator",
//   "Greatest Common Divisor Calculator"
// ];

// List<String> route = [
//   "/prime",
//   "/gcd"
// ];

// class SideNavTile extends StatelessWidget {
//   SideNavTile(this.title, this.isActive, this.route);
//   final String title;
//   final bool isActive;
//   final String route;
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         title,
//         textAlign: TextAlign.center,
//       ),
//       selected: isActive,
//       onTap: (){
//         if (!isActive){
//           Navigator.pop(context);
//           Navigator.pushNamed(context, route);
//         }
//       },
//     );
//   }
// }

// List<SideNavTile> makeSideNavOptions(int active){
//   List<SideNavTile> tiles = [];
//   for (int i = 0; i < mathFunctions.length; i++){
//     tiles.add(
//       SideNavTile(
//         mathFunctions[i],
//         i == active,
//         route[i]
//       )
//     );
//   }
//   return tiles;
// }

// class MakeDrawer extends StatefulWidget {
//   MakeDrawer(this.active);
//   final int active;
//   @override
//   _MakeDrawerState createState() => _MakeDrawerState();

// }

// class _MakeDrawerState extends State<MakeDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: <Widget>[
//           DrawerHeader(
//             child: Center(
//               child: Text(
//                 "Math Functions",
//                 style: TextStyle(
//                   fontSize: 30
//                 ),
//               ),
//             )
//           ),
//           Divider(
//             height: 2,
//             thickness: 1,
//             color: Colors.black,
//           ),
//           Column(
//             children: makeSideNavOptions(widget.active),
//           )
//         ],
//       ),
//     );
//   }
// }

// double findPadding(BuildContext context){
//   return MediaQuery.of(context).size.width/10;
// }