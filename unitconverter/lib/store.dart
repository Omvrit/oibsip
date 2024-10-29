import 'package:velocity_x/velocity_x.dart';
enum Unit{
  km,m,cm,mm,
  kg,g,mg,cg,

}
class Units{
  static List<Unit> li = [Unit.km,Unit.m,Unit.cm,Unit.mm,Unit.kg,Unit.g,Unit.mg,Unit.cg];
}
class UnitConverterStore extends VxStore{
  double tobeConverted = 1.00;
  double afterConverted = 1000.00;
  Unit unitTobeConverted = Unit.km ;
  Unit unitAfterConverted = Unit.m ;





}
class ChangeToBeConverted extends VxMutation<UnitConverterStore>{
  final double tobeConverted;

  ChangeToBeConverted(this.tobeConverted);

  @override
  perform() {
    store!.tobeConverted=tobeConverted;
  }

}
class ChangeAfterConverted extends VxMutation<UnitConverterStore>{
  final double afterConverted;

  ChangeAfterConverted(this.afterConverted);

  @override
  perform() {
    store!.afterConverted=afterConverted;
  }

}
class ChangeUnitToBeConverted extends VxMutation<UnitConverterStore>{
  final Unit unitToBeConverted;

  ChangeUnitToBeConverted(this.unitToBeConverted);

  @override
  perform() {
    store!.unitTobeConverted=unitToBeConverted;
  }

}
class ChangeUnitAfterConverted extends VxMutation<UnitConverterStore>{
  final Unit unitAfterConverted;

  ChangeUnitAfterConverted(this.unitAfterConverted);

  @override
  perform() {
    store!.unitAfterConverted=unitAfterConverted;
  }

}