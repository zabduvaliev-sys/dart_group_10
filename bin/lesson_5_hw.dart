class Book {
  String _title;
  String _author;
  double _rating;

  Book(String title, String author)
    : _title = title,
      _author = author,
      _rating = 0;

  Book.withRating(String title, String author, double rating)
    : _title = title,
      _author = author,
      _rating = rating;

  String get title => _title;
  String get author => _author;
  double get rating => _rating;

  set rating(double value) {
    if (value >= 0 && value <= 10) {
      _rating = value;
    } else {
      print('Rating must be between 0 and 10');
    }
  }

  void displayInfo() {
    print('Title: $_title');
    print('Author: $_author');
    print('Rating: $_rating');
  }
}

void main() {
  Book book = Book('Harry Potter', 'J.K. Rowling');
  book.rating = 9.5;
  Book book2 = Book.withRating('The Hobbit', 'J.R.R. Tolkien', 9.5);
  book.displayInfo();
  Library library = Library('City Library');

  library.addBook(book);
  library.addBook(book2);

  library.showBooks();
  Book book3 = Book('Sherlock Holmes', 'Arthur Conan Doyle');
  book3.rating = 8.5;

  Library cityLib = Library('City Library');
  cityLib.addBook(book);
  cityLib.addBook(book2);
  cityLib.addBook(book3);
  cityLib.showBooks();
  print('Total books in library: ${cityLib.booksCount}');
}

class Library {
  String name;
  List<Book> _books = [];

  Library(this.name);

  void addBook(Book b) {
    _books.add(b);
  }

  void showBooks() {
    print('Library: $name');
    print('Books list:');

    for (int i = 0; i < _books.length; i++) {
      print('${i + 1}. ${_books[i].title}');
    }
  }

  int get booksCount => _books.length;
}
