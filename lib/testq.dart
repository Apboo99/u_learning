// void main(){
//   gets();
//   // IsTrueOrFalse isTrueOrFalse = IsTrueOrFalse();
//   // print(IsTrueOrFalse().dogIsBiggerThanElephant());
//   // print(IsTrueOrFalse().dogIsBiggerThanElephant());
//   // CheckBig.printColorOfBigger();
//   // print(CheckBig.dogIsBiggerThanElephant());
// }
//
//   gets(){
//     List<St> name = [
//       St(name: "Mo", age: 21, address: "Tanta", hairColor: "black"),
//       St(name: "Karem", age: 20, address: "Cairo", hairColor: "red"),
//       St(name: "Mohamed", age: 40, address: "Maca", hairColor: "black"),
//     ];
//     for(var element in name){
//       if(element.name.contains('s')){
//         continue;
//       }
//       print("${element.name} his age is ${element.age} years old, lives in ${element.address} city and he have a ${element.hairColor} hair.");
//
//     }
//
//   // return name.last.x;
// }
// class St{
//    final String name;
//    final int age;
//    final String address;
//    final String hairColor;
//    St({required this.name, required this.age, required this.address, required this.hairColor});
// }
// abstract class CheckBig{
//    bool dogIsBiggerThanElephant();
//    bool dogIsBiggerThanCat();
//    void printColorOfBigger();
//
// }
// class IsTrueOrFalse extends CheckBig{
//   @override
//   bool dogIsBiggerThanCat() {
//     return true;
//   }
//
//   bool dogIsBiggerThanElephant() {
//     return false;
//   }
//
//
//   bool dogIsBiggerThanTiger() {
//     return false;
//   }
//
//   @override
//   void printColorOfBigger() {
//     // TODO: implement printColorOfBigger
//   }
// }
// class Brain extends CheckBig{
//   @override
//   bool dogIsBiggerThanCat() {
//     return false;
//   }
//
//   @override
//   bool dogIsBiggerThanElephant() {
//     return true;
//   }
//
//   @override
//   void printColorOfBigger() {
//
//   }
// }
