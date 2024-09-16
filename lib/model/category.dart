import 'package:flutter/material.dart';
import 'package:news_app/theming/colors.dart';

class Category {
  String id;
  String title;
  String imgPath;
  Color color;

  Category(
  {required this.color,
  required this.id,
  required this.imgPath,
  required this.title});

  static List<Category> getCategories() {
  return [
  Category(
    id: 'sports',
    title: 'Sports',
    imgPath: 'assets/ball.png',
    color: AppColors.red),
  Category(
    id: 'politics',
    title: 'Politics',
    imgPath: 'assets/Politics.png',
   color: AppColors.darkBlue),
  Category(
    id: 'health',
   title: 'Health',
   imgPath: 'assets/health.png',
   color: AppColors.pink),
  Category(
    id: 'business',
    title: 'Business',
    imgPath: 'assets/bussines.png',
    color: AppColors.brown),
  Category(
    id: 'environment',
    title: 'Environment',
    imgPath: 'assets/environment.png',
    color: AppColors.blue),
  Category(
    id: 'science',
    title: 'Science',
    imgPath: 'assets/science.png',
    color: AppColors.yellow),

  ];
  }

  }
