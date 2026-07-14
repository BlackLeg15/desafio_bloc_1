// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:desafio_bloc_1/app/modules/home/presenter/pages/home/widgets/blog_post_card_widget.dart'
    as _desafio_bloc_1_app_modules_home_presenter_pages_home_widgets_blog_post_card_widget;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'app',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'modules',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'home',
            children: [
              _widgetbook.WidgetbookFolder(
                name: 'presenter',
                children: [
                  _widgetbook.WidgetbookFolder(
                    name: 'pages',
                    children: [
                      _widgetbook.WidgetbookFolder(
                        name: 'home',
                        children: [
                          _widgetbook.WidgetbookFolder(
                            name: 'widgets',
                            children: [
                              _widgetbook.WidgetbookComponent(
                                name: 'BlogPostCardWidget',
                                useCases: [
                                  _widgetbook.WidgetbookUseCase(
                                    name: 'Empty',
                                    builder:
                                        _desafio_bloc_1_app_modules_home_presenter_pages_home_widgets_blog_post_card_widget
                                            .emptyCard,
                                  ),
                                  _widgetbook.WidgetbookUseCase(
                                    name: 'Fullfilled',
                                    builder:
                                        _desafio_bloc_1_app_modules_home_presenter_pages_home_widgets_blog_post_card_widget
                                            .fullfilledCard,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      )
    ],
  )
];
