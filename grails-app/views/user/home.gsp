<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library</title>
    <link rel="icon"
        href="https://png.pngtree.com/png-clipart/20200422/ourmid/pngtree-hand-drawn-cartoon-polygon-library-bookshelf-illustration-png-image_2190375.jpg"
        type="image/x-icon">
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'home.css')}" type="text/css">
</head>

<body>
    <script>
        function showpassword() {
            var pass = document.getElementById("passWord");
            if (pass.type == "password")
                pass.type = "text";
            else
                pass.type = "password";
        }
    </script>
    <div id="whole">
        <form action="${createLink(controller: 'user', action: 'login')}" method="post">
            <h2>Login</h2>
            <g:if test="${flash.error}">
                <div id="error-message" class="error-message" style="color:black;margin-top:10px;text-align: center;">
                    ${flash.error}</div>
                <script>
                    setTimeout(function () {
                        var errorMessage = document.getElementById('error-message');
                        if (errorMessage) {
                            errorMessage.style.display = 'none';
                        }
                    }, 1700);
                </script>
            </g:if>
            <input type="text" id="userName" name="userName" placeholder="Username" required>
            <input type="password" id="passWord" name="passWord" placeholder="Password" required>
            <div>
                <input type="checkbox" id="showp" onclick="showpassword()">
                <label for="showp">show password</label>
            </div>
            <button>Login</button>
        </form>
    </div>
</body>

</html>
