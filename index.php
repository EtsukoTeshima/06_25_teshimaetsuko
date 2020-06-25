<?php
// データベースの接続
$dbn = 'mysql:dbname=gsacf_d06_25_kadai;charset=utf8;port=3306;host=localhost';
$user = 'root';
$pwd = '';

try {
    $pdo = new PDO($dbn, $user, $pwd);
} catch (PDOException $e) {
    echo json_encode(["db error" => "{$e->getMessage()}"]);
    exit();
}

// データベース取得
$sql = 'SELECT * FROM kadai';
$stmt = $pdo->prepare($sql);
$status = $stmt->execute();

// データ表示
$view = '';
if ($status == false) {
    $error = $stmt->errorInfo();
    exit('sqlError:' . $error[2]);
} else {
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $output = "";
    foreach ($result as $record) {
    $output .= "<li><span>{$record["recipename"]}</span><span>{$record["howto"]}</span><span>{$record["enagy"]}</span><span>{$record["salt"]}</span></li>";
    }
}

?>

<!doctype html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>タイトル</title>
    <meta name="description" content="ディスクリプション">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/style.js"></script>
</head>

<body>
    <!-- ヘッダー -->
    <header class="PC_header">
        <div class="logo"><img src="img/okomekun.png" alt="" width="100px" height=100px></div>
        <div class="headertitle">てしまのレシピ</div>
        <ul>
            <li><a href="index.php">トップページ</a></li>
            <li><a href="page/todo.php">レシピ一覧</a></li>
            <li><a href="page/about.html">レシピ検索</a></li>
            <li><a href="page/company.html">レシピ詳細 ページ</a></li>
        </ul>
    </header>
    <!-- メインビジュアル -->
    <div class="mainvisual"></div>
    <form action="todo_create.php" method="POST">
        <fieldset>
            <!-- <a href="recipe_read.php">レシピ一覧</a> -->

            <div>
                料理名: <input type="text" name="recipename">

            </div>
            <div>
                材料・作り方: <textarea name="howto" id="howto" cols="40" rows="10"></textarea>
            </div>
            <div>
                エネルギー: <input type="number" min="1" max="2000" name="enagy"> kcal
            </div>
            <div>
                食塩量: <input type="number" min="0.0" max="20.0" name="salt"> g
            </div>
            <div>
                <button>レシピ登録</button>
            </div>
        </fieldset>
    </form>

    <!-- todoリスト -->
    <div class="todo">
        <ul>
            <?= $output ?>
        </ul>
    </div>

</body>

</html>