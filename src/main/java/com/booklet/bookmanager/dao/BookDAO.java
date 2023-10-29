package com.booklet.bookmanager.dao;

import com.booklet.bookmanager.connection.DatabaseConnection;
import com.booklet.bookmanager.model.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO extends DatabaseConnection {
    private static BookDAO bookDAO = null;

    private BookDAO(){}

    public static synchronized BookDAO getInstance() {
        if (bookDAO == null) bookDAO = new BookDAO();
        return bookDAO;
    }

    public boolean insertBook(Book book) throws SQLException {
        try (Connection connection = connection()) {
            String sql = "INSERT INTO book (title, author, price) VALUES (?, ?, ?)";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthor());
            statement.setFloat(3, book.getPrice());

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new SQLException(e.getMessage());
        }
    }

    public List<Book> listAllBooks() throws SQLException {
        try (Connection connection = connection()) {
            List<Book> listBook;
            listBook = new ArrayList<>();

            String sql = "SELECT * FROM book";

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("book_id");
                String title = resultSet.getString("title");
                String author = resultSet.getString("author");
                float price = resultSet.getFloat("price");

                Book book = new Book(id, title, author, price);
                listBook.add(book);
            }

            return listBook;
        } catch (SQLException e) {
            throw new SQLException(e.getMessage());
        }
    }

    public boolean deleteBook(Book book) throws SQLException {
        try (Connection connection = connection()) {
            String sql = "DELETE FROM book where book_id = ?";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, book.getId());

            boolean rowDeleted = statement.executeUpdate() > 0;
            return rowDeleted;
        } catch (SQLException e) {
            throw new SQLException(e.getMessage());
        }
    }

    public boolean updateBook(Book book) throws SQLException {
        try (Connection connection = connection()) {
            String sql = "UPDATE book SET title = ?, author = ?, price = ?";
            sql += " WHERE book_id = ?";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthor());
            statement.setFloat(3, book.getPrice());
            statement.setInt(4, book.getId());

            boolean rowUpdated = statement.executeUpdate() > 0;
            return rowUpdated;
        } catch (SQLException e) {
            throw new SQLException(e.getMessage());
        }
    }

    public Book getBook(int id) throws SQLException {
        try(Connection connection = connection()){
            Book book = null;
            String sql = "SELECT * FROM book WHERE book_id = ?";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String title = resultSet.getString("title");
                String author = resultSet.getString("author");
                float price = resultSet.getFloat("price");

                book = new Book(id, title, author, price);
            }

            return book;
        } catch(SQLException e){
            throw new SQLException(e.getMessage());
        }
    }
}

