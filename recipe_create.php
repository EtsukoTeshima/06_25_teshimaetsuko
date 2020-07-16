<?php
session_start();
// var_dump($_SESSION);
// exit();
include('functions.php');
check_session_id();

// 送信確認
// var_dump($_POST);
// exit();

// 項目入力のチェック
// 値が存在しないor空で送信されてきた場合はNGにする
if (
  !isset($_POST['recipename']) || $_POST['recipename'] == '' ||
  !isset($_POST['category']) || $_POST['category'] == '' ||
  !isset($_POST['howto']) || $_POST['howto'] == '' ||
  !isset($_POST['recipe_image']) || $_POST['recipe_image'] == ''
) {
  // echo json_encode(["error_msg" => "no input"]);
  exit('ParamError');
}

// 受け取ったデータを変数に入れる
$recipename = $_POST['recipename'];
$category = $_POST['category'];
$howto = $_POST['howto'];
$recipe_image = $_POST['recipe_image'];

// DB接続の設定
// include('functions.php');
$pdo = connect_to_db();

// データ登録SQL作成
// `created_at`と`updated_at`には実行時の`sysdate()`関数を用いて実行時の日時を入力する
// SQL準備&実行
$sql = 'INSERT INTO kadai_recipe_table(id, recipename, category, howto, recipe_image) VALUES(NULL, :recipename, :category, :howto, :recipe_image )';
$stmt = $pdo->prepare($sql);
$stmt->bindValue(':recipename', $recipename, PDO::PARAM_STR);
$stmt->bindValue(':category', $category, PDO::PARAM_STR);
$stmt->bindValue(':howto', $howto, PDO::PARAM_STR);
$stmt->bindValue(':recipe_image', $recipe_image, PDO::PARAM_STR);
$status = $stmt->execute(); //SQLを実行

// データ登録処理後
if ($status == false) {
  $error = $stmt->errorInfo();
  echo json_encode(["error_msg" => "{$error[2]}"]);
  exit();
} else {
  header('Location:recipe_read.php');
  exit();
}

?>
