<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library</title>
    <link rel="icon"
        href="https://png.pngtree.com/png-clipart/20200422/ourmid/pngtree-hand-drawn-cartoon-polygon-library-bookshelf-illustration-png-image_2190375.jpg"
        type="image/x-icon">
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'dashboard.css')}" type="text/css">
</head>

<body>
    <div id="whole">
        <a class="btn" href="${createLink(controller: 'book', action: 'fullbooks')}" title="Full Books">
            <h2>Full Books</h2>
        </a>
        <a class="btn" href="${createLink(controller: 'book', action: 'books')}" title="Filtered List">
            <h2>Filtered List</h2>
        </a>
        <g:if test="${session.userRole=='admin'}">
            <a href="${createLink(controller: 'book_register', action: 'booklist')}" title="Book Register">
                <h2>Book Register</h2>
            </a>
        </g:if>
        <g:else>
            <a href="${createLink(controller: 'book', action: 'studentHistory')}" title="My History">
                <h2>My History</h2>
            </a>
        </g:else>
    </div>
</body>

</html>