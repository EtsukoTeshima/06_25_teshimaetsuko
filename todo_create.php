<?php

// 送信確認
// var_dump($_POST);
// exit();

// あるかどうか
if(
  !isset($_POST['recipename']) || $_POST['recipename']=='' ||
  !isset($_POST['howto']) || $_POST['howto']== '' ||
  !isset($_POST['enagy']) || $_POST['enagy']== '' ||
  !isset($_POST['salt']) || $_POST['salt']== '' 
){
  exit('ParamError');
}

// フォームの送信
$recipename = $_POST["recipename"];
$howto = $_POST["howto"];
$enagy = $_POST["enagy"];
$salt = $_POST["salt"];


// データベースの設定
$dbn = 'mysql:dbname=gsacf_d06_25_kadai;charset=utf8;port=3306;host=localhost';
$user = 'root';
$pwd = '';

try {
  $pdo = new PDO($dbn, $user, $pwd);
} catch (PDOException $e) {
  echo json_encode(["db error" => "{$e->getMessage()}"]);
  exit();
}

// データを送信
$sql = 'INSERT INTO kadai(id, recipename, howto, enagy, salt) VALUES(NULL, :recipename, :howto, :enagy, :salt )';
$stmt = $pdo->prepare($sql);
$stmt->bindValue(':recipename', $recipename, PDO::PARAM_STR);
$stmt->bindValue(':howto', $howto, PDO::PARAM_STR);
$stmt->bindValue(':enagy', $enagy, PDO::PARAM_INT);
$stmt->bindValue(':salt', $salt, PDO::PARAM_INT); //数字の時は::PARAM_INT
$status = $stmt->execute(); //SQLを実行

if ($status == false) {
  $error = $stmt->errorInfo();
  exit('sqlError:' . $error[2]);


} else {
header('Location:index.php');
}
