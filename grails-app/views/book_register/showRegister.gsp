<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Library </title>
    <link rel="icon" href="https://png.pngtree.com/png-clipart/20200422/ourmid/pngtree-hand-drawn-cartoon-polygon-library-bookshelf-illustration-png-image_2190375.jpg" type="image/x-icon">
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'showRegister.css')}" type="text/css">
</head>

<body>
    <div id="whole">
        <h1>Book List</h1>
        <table>
            <thead>
                <tr>
                    <th>Register Id</th>
                    <th>User Id</th>
                    <th>User Name</th>
                    <th>Book Id</th>
                    <th>Taken Time</th>
                    <th>Return Time</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${register}" var="bregister">
                    <tr>
                        <td>${bregister.id}</td>
                        <td>${bregister.user.id}</td>
                        <td>${bregister.user.name}</td>
                        <td>${bregister.book.id}</td>
                        <td>${bregister.taken_time}</td>
                        <td>
                            <g:if test="${bregister.return_time==null}">
                                Not Return
                            </g:if>
                            <g:if test="${bregister.return_time!=null}">
                                ${bregister.return_time}
                            </g:if>
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        <div class="btn">
            <a href="${createLink(controller: 'user', action: 'dash')}">Dashboard</a>
            <a class="changebtn" href="${createLink(url: 'modifyRegister')}">Modify Register</a>
            <a class="changebtn" href="${createLink(url: 'newRegister')}">New Register</a>
        </div> 
        <div class="btn">   
            <g:if test="${flash.offset > 0}">
                <a
                    href="${createLink(controller: 'book_register', action: 'booklist', params: [offset: flash.offset - 5])}">Previous</a>
            </g:if>
            <g:if test="${flash.bookRegister.size() == 5}">
                <a
                    href="${createLink(controller: 'book_register', action: 'booklist', params: [ offset: flash.offset + 5])}">Next</a>
            </g:if>
        </div>
    </div>
</body>

</html>