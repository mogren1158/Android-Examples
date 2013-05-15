package com.example.fragmentbookexample;

public class Book
{
   private static final String[] BOOK_NAMES   = { "Book Name 1", "Book Name 2", "Book Name 3",
         "Book Name 4", "Book Name 5", "Book Name 6", "Book Name 7", "Book Name 8" };

   private static final String[] AUTHOR_NAMES = { "Author of Book 1", "Author of Book 2",
         "Author of Book 3", "Author of Book 4", "Author of Book 5", "Author of Book 6",
         "Author of Book 7", "Author of Book 8" };

   
   public static String[] GetBookNames()
   {
      return BOOK_NAMES;
   }
   
   public static String[] GetAuthorNames()
   {
      return AUTHOR_NAMES;
   }
}
