import 'package:blog_app/core/common/widgets/loader.dart';
import 'package:blog_app/core/theme/app_palette.dart';
import 'package:blog_app/core/utils/get_random_number.dart';
import 'package:blog_app/features/auth/presentation/pages/widgets/show_menu.dart';
import 'package:blog_app/core/utils/show_snackbar.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/auth/presentation/pages/login_page.dart';
import 'package:blog_app/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:blog_app/features/blog/presentation/pages/add_new_blog.dart';
import 'package:blog_app/features/blog/presentation/widgets/blog_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const BlogPage(),
      );
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(GetAllBlogsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedOut) {
          Navigator.pushAndRemoveUntil(
            context,
            LoginPage.route(),
            (route) => false,
          );
        } else if (state is AuthFailure) {
          showSnackBAr(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.person_outline_rounded,
                  size: 30,
                ),
              ),
            ),
            centerTitle: true,
            title: const Text('Blog App'),
            actions: [
              IconButton(
                onPressed: () =>
                    Navigator.push(context, AddNewBlogPage.route()),
                icon: const Icon(
                  CupertinoIcons.add_circled,
                ),
              ),
            ],
          ),
          drawer: const SidebarMenu(),
          body: BlocConsumer<BlogBloc, BlogState>(
            listener: (context, state) {
              if (state is BlogFailure) {
                showSnackBAr(context, state.error);
              }
            },
            builder: (context, state) {
              if (state is BlogLoading) {
                return const Loader();
              }
              if (state is BlogDisplaySuccess) {
                return ListView.builder(
                  itemCount: state.blogs.length,
                  itemBuilder: (context, index) {
                    final blog = state.blogs[index];
                    return BlogCard(
                      blog: blog,
                      color: getRandomNumber() == 0
                          ? AppPalette.gradient1
                          : getRandomNumber() == 1
                              ? AppPalette.gradient2
                              : AppPalette.gradient3,
                    );
                  },
                );
              }
              return const SizedBox();
            },
          ),
        );
      },
    );
  }
}
