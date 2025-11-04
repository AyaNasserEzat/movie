import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  final String errorMessage;

  Failure({required this.errorMessage});
  
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}
