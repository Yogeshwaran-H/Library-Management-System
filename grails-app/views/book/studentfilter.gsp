<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Library </title>
  <link rel="icon"
    href="https://png.pngtree.com/png-clipart/20200422/ourmid/pngtree-hand-drawn-cartoon-polygon-library-bookshelf-illustration-png-image_2190375.jpg"
    type="image/x-icon">
  <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'fullbook.css')}" type="text/css">
</head>

<body>
  <div id="whole">
    <h1>Book List</h1>
    <table>
      <thead>
        <tr>
          <th>Book id</th>
          <th>Name</th>
          <th>Author</th>
          <th>Genre</th>
          <th>Description</th>
          <th>Is_Available</th>
        </tr>
      </thead>
      <tbody>
        <g:each in="${books}" var="book">
          <tr>
            <td>${book.id}</td>
            <td>${book.name}</td>
            <td>${book.author}</td>
            <td>${book.genre}</td>
            <td>${book.description}</td>
            <td>${book.isAvailable}</td>
          </tr>
        </g:each>
      </tbody>
    </table>
    <div class="btn">
      <a href="${createLink(controller: 'user', action: 'dash')}">Dashboard</a>
      <g:if test="${flash.offset > 0}">
        <a href="${createLink(controller: 'book', action: 'books', params: [offset: flash.offset - 5])}">Previous</a>
      </g:if>
      <g:if test="${flash.allbooks.size() == 5}">
        <a href="${createLink(controller: 'book', action: 'books' , params: [ offset: flash.offset + 5])}">Next</a>
      </g:if>
    </div>
  </div>
</body>

</html>
