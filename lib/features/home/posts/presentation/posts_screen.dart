import 'package:api_revision/features/home/posts/cubit/get_posts/get_posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<GetPostsCubit, GetPostsState>(
      builder: (context, state) {
        if (state is GetPostsLoadingState) {
          return Center(
            child: LoadingAnimationWidget.inkDrop(
              color: Colors.blue,
              size: 50,
            ),
          );
        } else if (state is GetPostsFailedState) {
          return Center(
            child: Text(state.failedMessage),
          );
        } else if (state is GetPostsSuccessState) {
          return ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              var postData = state.posts[index];

              return Card(
                color: Colors.blue,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(postData["id"].toString()),
                      Text(postData["title"]),
                      Text(postData["body"]),
                      Text(postData["reactions"]["likes"].toString()),
                      Text(postData["tags"][0]),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return SizedBox();
      },
    ));
  }
}
