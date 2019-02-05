<?php
	require 'include/categories.php';
	$category = new Category();
	$listCategories = $category->getCategories();
	$data = $category->getCategoriesWithProducts();
?>
<!DOCTYPE html>
<html>
<head>
	<title>Catalogue</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="container">
	<?php
		foreach ($listCategories as $key) {
			echo "<table>";
			echo "<caption>" . $key->title ."</caption>";
			echo "<tr><th>Название</th><th>Цена</th><th>Описание</th></tr>";
			foreach ($data[$key->id] as $item) {
				echo "<tr>";
				echo "<td>" . $item->title ."</td>" . "<td>" . $item->price ."</td>" . "<td><p>" . $item->description ."</p></td>";
				echo "</tr>";
			}

			echo "</table>";
		}
	?>
	</div>
</body>
</html>