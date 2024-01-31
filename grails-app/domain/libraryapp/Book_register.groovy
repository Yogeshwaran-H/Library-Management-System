package libraryapp

class Book_register {
    Date taken_time
    Date return_time
    Book book
    User user
    static constraints = {
        return_time(nullable:true)
    }
}
