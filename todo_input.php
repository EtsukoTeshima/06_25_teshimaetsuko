<form action="todo_create.php" method="POST">
  内容: <input type="text" name="todo">
  時間: <input type="date" name="deadline">
  <button>submit</button>
</form>
<?php
// データベースの接続
$dbn = 'mysql:dbname=gsacf_d06_05;charset=utf8;port=3306;host=localhost';
$user = 'root';
$pwd = '';

try {
  $pdo = new PDO($dbn, $user, $pwd);
} catch (PDOException $e) {
  echo json_encode(["db error" => "{$e->getMessage()}"]);
  exit();
}

// データベース取得
$sql = 'SELECT * FROM todo_table';
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
    $output .= "<li><span>{$record["deadline"]}</span><span>{$record["todo"]}</span></li>";
  }
}

?>

<ul>
  <?= $output ?>
</ul>