<?php
session_start();
include('functions.php');
check_session_id();
// 送信データのチェック
// var_dump($_GET);
// exit();

// 関数ファイルの読み込み
// include('functions.php');


// idの受け取り
$id = $_GET['id'];
// var_dump($_GET);
// exit();

// DB接続
$pdo = connect_to_db();



// データ取得SQL作成
// SQL準備&実行
$sql = 'SELECT * FROM kadai_recipe_table WHERE id=:id';
$stmt = $pdo->prepare($sql);
$stmt->bindValue(':id', $id, PDO::PARAM_INT);
$status = $stmt->execute();


// データ登録処理後
if ($status == false) {
  // SQL実行に失敗した場合はここでエラーを出力し，以降の処理を中止する
  $error = $stmt->errorInfo();
  echo json_encode(["error_msg" => "{$error[2]}"]);
  exit();
} else {
  // 正常にSQLが実行された場合は指定の11レコードを取得
  // fetch()関数でSQLで取得したレコードを取得できる
  $record = $stmt->fetch(PDO::FETCH_ASSOC);
}
// var_dump($record);
// exit();

?>

<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>レシピ更新画面（編集画面）</title>
</head>

<body>
  <a href="recipe_read.php">一覧画面</a>
  <form action="recipe_update.php" method="POST">
    料理名: <input type="text" name="recipename" value="<?= $record['recipename'] ?>"><br>
    <div>
      レシピカテゴリ: <select name="category" id="" value="<?= $record['category'] ?>">
        <option value="">選択してください</option>
        <option value="1">ダイエットレシピ</option>
        <option value="2">筋トレレシピ</option>
        <option value="3">骨活レシピ</option>
        <option value="4">最強トーストレシピ</option>
        <option value="5">その他</option>
      </select>
    </div>
    材料・作り方: <textarea name="howto" id="howto" cols="40" rows="10" value="<?= $record['howto'] ?>"></textarea><br>
    <div><input type="file" name="recipe_image" accept="image/*" value="<?= $record['recipe_image'] ?>"></div>

    <input type="hidden" name="id" value="<?= $record['id'] ?>">
    <button>修正</button>
  </form>

</body>

</html>