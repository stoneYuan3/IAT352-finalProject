<?php
    include('header.php');
?>
        <form class="upload" action="index.php">
            <section class="top">
                <h1>Content Upload</h1>
                <label>I want to post:</label> 
                <a class="select-page">Image</a>
                <a class="unselect-page" href="upload-thought.php">Thoughts</a>
            </section>
            
            <!-- reference: https://www.w3schools.com/tags/tryit.asp?filename=tryhtml_input_accept -->
            <input class="upload-image-box" type="file" id="img" name="img" accept="image/*" >

            <h3>Tags</h3>
            <input class="upload-tag"type="tags" id="tags" name="tags">

            <h3>Descriptions</h3>
            <textarea class="upload-des-box" type="des" id="des" name="des" rows="5" cols="100"></textarea>

            <section class="bottom">
                <button class ="selected" type="submit" value="submit"><strong>Submit</strong></button>
            </section>
        </form>
    </body>
</html>