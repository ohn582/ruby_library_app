require 'pry'

class Book < ActiveRecord::Base

    has_many :libraries
    has_many :users, through: :libraries

    attr_accessor :user 

     def self.tty_prompt
        TTY::Prompt.new
    end


    def self.new_book(user_object)

        system "clear"

        names_array = Libraries.all.map do |library|
            library.book.title
        end
        choice = TTY::Prompt.new.select("What kind of books?", names_array)

        case choice
            when "Catch-22"
                puts "added to the Libraries"
                Libraries.create(user_id: "#{user_object.id}", book_id: "#{Book.all.second.id}", genre: "Adventure")
            when "Exit"
                
            when "To Kill a Mockingbird"
                puts "added to the Libraries"
                Libraries.create(user_id: "#{user_object.id}", book_id: "#{Book.all.third.id}", genre: "Fiction")
            when "Exit" 
            
            when "Starship Troopers"
                puts "added to the Libraries"
                Libraries.create(user_id: "#{user_object.id}", book_id: "#{Book.all.fourth.id}", genre: "Si-FI")
            when "Exit"
            
            when "Harry Potter and the Sorcerer's Stone"
                puts "added to the Libraries"
                Libraries.create(user_id: "#{user_object.id}", book_id: "#{Book.all.last.id}", genre: "Fantasy")
            when "Exit"

            when "The Catcher in the Rye"
                puts "added to the Libraries"
                Libraries.create(user_id: "#{user_object.id}", book_id: "#{Book.all.first.id}", genre: "Fiction")
            when "Exit"
        end
        
    end



    # def self.old_book

    #     # title = self.tty_prompt.ask("Recent Book:")
    #     # Book.find_by(title: title)
    #     # my_books
    #     book_array = Libraries.all.select {|join| join.user == }.map {|join| join.book}
    #     self.tty_prompt.select("Your Books", book_array)

        
    # end

end