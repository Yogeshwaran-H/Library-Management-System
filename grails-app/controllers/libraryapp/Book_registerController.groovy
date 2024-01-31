package libraryapp


import grails.rest.*
import grails.converters.*
import java.util.*
import java.text.*

import grails.gorm.transactions.Transactional

@Transactional

class Book_registerController {

    def booklist()
    {
        def offset = params.offset ?: 0
        def bookRegister=Book_register.list(max: 5, offset:offset)
        flash.offset = offset.toInteger()
        flash.bookRegister=bookRegister
        render(view: 'showRegister', model: [register: bookRegister])
    }

    def modifyRegister(){}
    def modifyRegister2()
    {
        def register_id=params?.registerId
        def book_Id=params?.bookId
        Date curdate=new Date()
        def returnTime= curdate
        def bookRegisterInstance=Book_register.get(register_id)
        if(bookRegisterInstance && bookRegisterInstance.return_time==null)
        {
            use(groovy.time.TimeCategory)
            {
                bookRegisterInstance.return_time=returnTime
                bookRegisterInstance.save()
            }
            def book_id=bookRegisterInstance.book.id
            def bookInstance=Book.get(book_id)
            bookInstance.isAvailable="true"
            bookInstance.save()
            redirect(action: 'booklist')
        }
        else{
            flash.error = "Invalid credentials"  
            render(view: "modifyRegister")
        }
    }

    def newRegister()
    {
        def book_id=params?.bookId
        def user_id=params?.userId
        def bookIdIns=Book.get(book_id)
        def bookRegisterIns=Book_register.findAllByBook(bookIdIns)
        def bookreturned=bookRegisterIns?.findAll{ temp ->
            def taken=temp?.return_time;
            if(taken==null)
            {
                return true
            }
        }
        if(!bookreturned)
        {
            def userIns=User.get(user_id)
            Date curdate=new Date();
            def takenTime=curdate
            def bookregisterIns= new Book_register(
                taken_time:takenTime,
                return_time:null,
                user:userIns,
                book:bookIdIns
            )
            if(bookregisterIns?.validate())
            {
                bookregisterIns.save()
                def bookid=bookregisterIns.book.id
                def bookupdateIns=Book.get(bookid)
                bookupdateIns.isAvailable="false"
                bookupdateIns.save()
                redirect(action: 'booklist')
            }
        }
        else{
            flash.error = "Invalid credentials"
            render(view: "newRegister")
        }
    }

}