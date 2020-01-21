<?php
$posts = json_decode(file_get_contents('posts.json'), true);

if (isset($_POST['name']) && isset($_POST['text'])) {
    $post = array(
        'name' => $_POST['name'],
        'text' => $_POST['text'],
        'picture' => 'upload/cbf19975f168298c0d10f1b5380ba931.png'
    );

    if (isset($_FILES['picture']) && $_FILES['picture']['error'] == UPLOAD_ERR_OK) {
        $extension = end(explode('.', $_FILES['picture']['name']));
        $name = md5_file($_FILES['picture']['tmp_name']);
        $path = "upload/$name.$extension";
        move_uploaded_file($_FILES['picture']['tmp_name'], $path);
        $post['picture'] = $path;
    }

    array_unshift($posts, $post);

    file_put_contents('posts.json', json_encode($posts));
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">
    <title>Goof Guest Book</title>
</head>
<body>
<div class="album py-5 bg-light">
    <div class="container">
        <div class="row">
            <? foreach ($posts as $value) { ?>
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <img src="<?= htmlspecialchars($value['picture']) ?>"
                             class="bd-placeholder-img card-img-top" width="100%" height="225"
                             focusable="false">
                        <div class="card-body">
                            <p class="card-text"><?= htmlspecialchars($value['text']) ?></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <small class="text-muted"><?= htmlspecialchars($value['name']) ?></small>
                            </div>
                        </div>
                    </div>
                </div>
            <? } ?>
        </div>

        <hr>

        <h4>Post your feedback</h4>
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="text">Text</label>
                <textarea class="form-control" id="text" rows="3" name="text" required></textarea>
            </div>
            <div class="form-group">
                <label for="picture">Upload picture</label>
                <input type="file" class="form-control-file" id="picture" name="picture">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</div>
</body>
</html>
