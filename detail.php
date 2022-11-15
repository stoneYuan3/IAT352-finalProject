<html>
    <head>
        <title>Header</title>
        <link rel="stylesheet" href="css/css.css">
    </head>

    <body>
        <!-- resource: https://www.w3schools.com/howto/howto_js_topnav.asp -->
        <section class="navbar">
            <a class="logo" href="index.html"><img src="img/logo.png"></a>

            <!-- if didn't sign in -->
            <a class="active" href="login.html" ><b>Login/Signup</b></a>

            <!-- if sign in -->
            <!-- <a class="active"href="profile.html"><img src="img/icon.png"></a> -->
            <!-- <a class="active" href="upload-image.html"><img src="img/new_post.png"></a> -->
        </section>

        <section class="detail">
            <section class="picture">
                <img src="img/example-image2.png">
            </section>
            <section class="description">
                <img src="img/liked.png">
                <label>191</label>
                <img src="img/comment.png">
                <label>10</label>
                <label class="view">13452 views</label>
                <section class="tags">
                    <p>#drawing #digital drawing #fantasy #robotics</p>
                </section>
                <p>This is a lovely description posted by username</p>
                <br><img src="img/icon.png">
                <label class="username"><a href="user-profile.html">Username</a></label>
                <label class="userid"> @userid</label>
                <button class ="selected" type="follow" value="follow"><strong>Follow</strong></button>
            </section>
            <hr>
            <section class="user-comments">
                <h1>Comments</h1>
                <section class="my-comment">
                    <img src="img/icon.png">
                    <input type="comments" placeholder="">
                    <button class ="selected" type="send" value="send"><strong>Send</strong></button>
                </section><br><br>
                <section class="all-comment">
                    <img src="img/icon.png">
                    <label class="username"><a href="user-profile.html">Username</a></label>
                    <label class="date"> Posted on 2022-11-07</label>
                    <p>Exciting, doubleplusgood, work.</p>
                    <br><hr><br>
                    <img src="img/icon.png">
                    <label class="username"><a href="user-profile.html">Username</a></label>
                    <label class="date"> Posted on 2022-11-07</label>
                    <p>Exciting, doubleplusgood, work.</p>
                    <br><hr><br>
                </section>
            </section>
        </section>
    </body>
</html>