<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library</title>
    <link rel="icon"
        href="https://png.pngtree.com/png-clipart/20200422/ourmid/pngtree-hand-drawn-cartoon-polygon-library-bookshelf-illustration-png-image_2190375.jpg"
        type="image/x-icon">
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'modifyRegister.css')}" type="text/css">
</head>

<body>
    <div id="whole">
        <form action="${createLink(controller: 'book_register', action: 'newRegister')}" method="post">
            <h2>New Register</h2>
            <g:if test="${flash.error}">
                <div id="error-message" class="error-message" style="color:black;margin-top:10px">${flash.error}</div>
                <script>
                    setTimeout(function () {
                        var errorMessage = document.getElementById('error-message');
                        if (errorMessage) {
                            errorMessage.style.display = 'none';
                        }
                    }, 1700);
                </script>
            </g:if>
            <input type="text" id="bookId" name="bookId" placeholder="Book ID" required>
            <input type="text" id="userId" name="userId" placeholder="User ID" required>
            <button>Register</button>
        </form> 
    </div>
</body>

</html>
