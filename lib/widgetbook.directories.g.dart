// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

import 'dart:async';
import 'dart:core';
import 'package:desafio_bloc_1/app/modules/home/domain/entities/blog_post_entity.dart';
import 'package:desafio_bloc_1/app/modules/home/presenter/pages/home/widgets/blog_post_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

final directories = [
  WidgetbookFolder(
    name: 'app',
    children: [
      WidgetbookFolder(
        name: 'modules',
        children: [
          WidgetbookFolder(
            name: 'home',
            children: [
              WidgetbookFolder(
                name: 'presenter',
                children: [
                  WidgetbookFolder(
                    name: 'pages',
                    children: [
                      WidgetbookFolder(
                        name: 'home',
                        children: [
                          WidgetbookFolder(
                            name: 'widgets',
                            children: [
                              WidgetbookComponent(
                                name: 'BlogPostCardWidget',
                                useCases: [
                                  WidgetbookUseCase(
                                    name: 'Fullfilled',
                                    builder: (context) =>
                                        fullfilledCard(context),
                                  ),
                                  WidgetbookUseCase(
                                    name: 'Empty',
                                    builder: (context) => emptyCard(context),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
