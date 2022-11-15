<?php
    include('header.php');
?>

        <section class="index">
            <section class="top">
                <h1>Explore</h1>
                <button href="" class ="selected" type="button"><strong>All</strong></button>
                <button href="" class ="unselected" type="button"><strong>Image</strong></button>
                <button href="" class ="unselected" type="button"><strong>Articles</strong></button>
                <button href="" class ="unselected" type="button"><strong>Following</strong></button>
            </section>

            <section class="search">
                <label>Filter By:</label>
                <input type="search-bar" placeholder="Enter Keyword: Tag/User ID">
            </section>

            <section class="all">
                <!-- reference: https://www.w3schools.com/css/tryit.asp?filename=trycss3_flexbox_image_gallery -->
                <div class="row">
                    <div class="column">
                        <div class="post-image">
                            <div class="user" href="detail.php">
                                <img src="img/icon.png">
                                <label class="username"><a href="user-profile.php">Username</a></label>
                                <label class="date"> May 19th 2022</label>
                                <hr>
                            </div>
                            <div class="content">
                                <a href="detail.php"><img src="img/example-image1.png"></a>
                                <p>penatibus et magnis dis #drawing #digital drawing</p>
                                <hr>
                            </div>
                            <div class="bottom">
                                <img src="img/liked.png">
                                <label>1145</label>
                                <label class="comment">14</label>
                                <img src="img/commented.png" class="comment">
                            </div>
                        </div>
                        <div class="post-thought">
                            <div class="user">
                                <img src="img/icon.png">
                                <label class="username"><a href="user-profile.php">Username</a></label>
                                <label class="date"> May 15th 2022</label>
                                <hr>
                            </div>
                            <div class="content">
                                <a href="detail.php"><p>Suspendisse tempor, lorem suscipit vehicula ornare, lectus turpis maximus turpis, a ullamcorper lorem mauris in nunc. Phasellus ac pellentesque orci. Cras accumsan auctor sollicitudin. </p></a>
                                <hr>
                            </div>
                            <div class="bottom">
                                <img src="img/like.png">
                                <label>81</label>
                                <label class="comment">0</label>
                                <img src="img/comment.png" class="comment">
                            </div>
                        </div>
                    </div>
                    <div class="column">
                        <div class="post-thought">
                            <div class="user">
                                <img src="img/icon.png">
                                <label class="username"><a href="user-profile.php">Username</a></label>
                                <label class="date"> May 19th 2022</label>
                                <hr>
                            </div>
                            <div class="content">
                                <a href="detail.php"><p>Nunc dui elit, gravida sed magna sed, congue aliquet augue. Quisque a pretium mi. Vivamus arcu erat, porta vel massa in, vehicula venenatis tortor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales accumsan felis, sed euismod leo vestibulum et. </p>
                                </a><hr>
                            </div>
                            <div class="bottom">
                                <img src="img/like.png">
                                <label>39</label>
                                <label class="comment">0</label>
                                <img src="img/comment.png" class="comment">
                            </div>
                        </div>
                        <div class="post-thought">
                            <div class="user">
                                <img src="img/icon.png">
                                <label class="username"><a href="user-profile.php">Username</a></label>
                                <label class="date"> May 10th 2022</label>
                                <hr>
                            </div>
                            <div class="content">
                                <a href="detail.php"><p>This is bullshit! </p></a>
                                <hr>
                            </div>
                            <div class="bottom">
                                <img src="img/like.png">
                                <label>0</label>
                                <label class="comment">3</label>
                                <img src="img/commented.png" class="comment">
                            </div>
                        </div>
                        <div class="post-thought">
                            <div class="user">
                                <img src="img/icon.png">
                                <label class="username"><a href="user-profile.php">Username</a></label>
                                <label class="date"> May 19th 2022</label>
                                <hr>
                            </div>
                            <div class="content">
                                <a href="detail.php"><p>Nunc dui elit, gravida sed magna sed, congue aliquet augue. Quisque a pretium mi. Vivamus arcu erat, porta vel massa in, vehicula venenatis tortor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales accumsan felis, sed euismod leo vestibulum et. </p>
                                </a><hr>
                            </div>
                            <div class="bottom">
                                <img src="img/like.png">
                                <label>39</label>
                                <label class="comment">0</label>
                                <img src="img/comment.png" class="comment">
                            </div>
                        </div>
                    </div>
                    <div class="column">
                        <div class="post-image">
                            <div class="user">
                                <img src="img/icon.png">
                                <label class="username"><a href="user-profile.php">Username</a></label>
                                <label class="date"> May 7th 2022</label>
                                <hr>
                            </div>
                            <div class="content">
                                <a href="detail.php"><img src="img/example-image2.png"></a>
                                <p>#drawing #digital drawing #fantasy #robotics</p>
                                <hr>
                            </div>
                            <div class="bottom">
                                <img src="img/liked.png">
                                <label>191</label>
                                <label class="comment">10</label>
                                <img src="img/comment.png" class="comment">
                            </div>
                        </div>
                        <div class="post-image">
                            <div class="user">
                                <img src="img/icon.png">
                                <label class="username"><a href="user-profile.php">Username</a></label>
                                <label class="date"> May 7th 2022</label>
                                <hr>
                            </div>
                            <div class="content">
                                <a href="detail.php"><img src="img/example-image2.png"></a>
                                <p>#drawing #digital drawing #fantasy #robotics</p>
                                <hr>
                            </div>
                            <div class="bottom">
                                <img src="img/liked.png">
                                <label>191</label>
                                <label class="comment">10</label>
                                <img src="img/comment.png" class="comment">
                            </div>
                        </div>
                    </div>
                    <div class="column">
                    <div class="post-image">
                            <div class="user">
                                <img src="img/icon.png">
                                <label class="username"><a href="user-profile.php">Username</a></label>
                                <label class="date"> May 19th 2022</label>
                                <hr>
                            </div>
                            <div class="content">
                                <a href="detail.php"><img src="img/example-image1.png"></a>
                                <p>penatibus et magnis dis #drawing #digital drawing</p>
                                <hr>
                            </div>
                            <div class="bottom">
                                <img src="img/liked.png">
                                <label>1145</label>
                                <label class="comment">14</label>
                                <img src="img/commented.png" class="comment">
                            </div>
                        </div>
                        <div class="post-image">
                            <div class="user">
                                <img src="img/icon.png">
                                <label class="username"><a href="user-profile.php">Username</a></label>
                                <label class="date"> May 7th 2022</label>
                                <hr>
                            </div>
                            <div class="content">
                                <a href="detail.php"><img src="img/example-image2.png"></a>
                                <p>#drawing #digital drawing #fantasy #robotics</p>
                                <hr>
                            </div>
                            <div class="bottom">
                                <img src="img/liked.png">
                                <label>191</label>
                                <label class="comment">10</label>
                                <img src="img/comment.png" class="comment">
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </section>
    </body>
</html>