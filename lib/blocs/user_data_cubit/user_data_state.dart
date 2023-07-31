part of 'user_data_cubit.dart';

abstract class UserDataState extends Equatable {
  const UserDataState();
}

class UserDataInitial extends UserDataState {
  @override
  List<Object> get props => [];
}

class FetchLocalDataUser extends UserDataState {
  final List<ProfileList>? profileList;
  final String? username;
  final String? lastEdit;
  final String? activeAccountId;
  final String? activeProfileId;

  const FetchLocalDataUser({this.profileList, this.lastEdit, this.username, this.activeAccountId, this.activeProfileId});
  @override
  List<Object?> get props => [profileList, username, lastEdit, activeAccountId, activeProfileId];

}