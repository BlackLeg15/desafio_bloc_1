// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:desafio_bloc_1/app/modules/home/presenter/pages/home/widgets/blog_post_card_widget.dart'
    as _i2;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'app',
    children: [
      _i1.WidgetbookFolder(
        name: 'modules',
        children: [
          _i1.WidgetbookFolder(
            name: 'home',
            children: [
              _i1.WidgetbookFolder(
                name: 'presenter',
                children: [
                  _i1.WidgetbookFolder(
                    name: 'pages',
                    children: [
                      _i1.WidgetbookFolder(
                        name: 'home',
                        children: [
                          _i1.WidgetbookFolder(
                            name: 'widgets',
                            children: [
                              _i1.WidgetbookComponent(
                                name: 'BlogPostCardWidget',
                                useCases: [
                                  _i1.WidgetbookUseCase(
                                    name: 'Empty',
                                    builder: _i2.emptyCard,
                                  ),
                                  _i1.WidgetbookUseCase(
                                    name: 'Fullfilled',
                                    builder: _i2.fullfilledCard,
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
