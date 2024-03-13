package libraryapp

import grails.rest.*
import grails.converters.*
import java.util.*
import java.text.*
import groovy.time.TimeCategory

class BookController {

    def books() { 
        def role = session.userRole
        def offset = params.offset ?: 0
        flash.offset = offset.toInteger()
        if(role == "student")
        {
            def availableBooks = Book.findAllByIsAvailable("true",[max:5,offset:offset])
            flash.allbooks = availableBooks
            render(view: 'studentfilter', model: [books: availableBooks])
        }
        else if(role == "admin")
        {
            def unreturnBooks = Book_register.findAllByReturn_time(null)
            def filteredBooks = unreturnBooks?.findAll{temp -> 
                def taken = temp.taken_time
                Date curdate=new Date()
                use(groovy.time.TimeCategory) {
                    def duration = (curdate - taken).days
                    if(duration>15)
                        return true
                    else
                        return false
                }
            }.take(5)
            flash.allbooks = filteredBooks
            render(view: 'adminfilterregister', model: [books: filteredBooks])
        }
    }

    def fullbooks()
    {
        def offset = params.offset ?: 0
        def allbooks = Book.list (max: 5, offset: offset)
        flash.offset = offset.toInteger()
        flash.allbooks = allbooks
        [books:allbooks]
    }
    
    def studentHistory()
    {
        def offset = params.offset ?: 0
        flash.offset = offset.toInteger()
        def userId = session.userId
        def user = User.get(userId)
        def historyIns = Book_register.findAllByUser(user,[max:5,offset:offset])
        flash.history = historyIns
        render(view: 'studentHistory', model: [register: historyIns])
    }

}