<?php
    include('header.php');
?>
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
                <label class="username"><a href="user-profile.php">Username</a></label>
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
                    <label class="username"><a href="user-profile.php">Username</a></label>
                    <label class="date"> Posted on 2022-11-07</label>
                    <p>Exciting, doubleplusgood, work.</p>
                    <br><hr><br>
                    <img src="img/icon.png">
                    <label class="username"><a href="user-profile.php">Username</a></label>
                    <label class="date"> Posted on 2022-11-07</label>
                    <p>Exciting, doubleplusgood, work.</p>
                    <br><hr><br>
                </section>
            </section>
        </section>
    </body>
</html>