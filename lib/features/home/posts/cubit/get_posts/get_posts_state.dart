part of 'get_posts_cubit.dart';

@immutable
sealed class GetPostsState {}

final class GetPostsInitial extends GetPostsState {}

final class GetPostsLoadingState extends GetPostsState {}

final class GetPostsSuccessState extends GetPostsState {
  List posts;
  GetPostsSuccessState({required this.posts});
}

final class GetPostsFailedState extends GetPostsState {
  String failedMessage;
  GetPostsFailedState({required this.failedMessage});
}
