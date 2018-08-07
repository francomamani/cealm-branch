<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Martinez Acchini Libros</title>
	<link rel="stylesheet" href="./styles/template.css">


</head>
<body ng-app="martinezApp" ng-controller="MainCtrl">
	<header class="header">
		<div class="logo"></div>
		<h1>Martinez Acchini Libros S.R.L.</h1>
		<nav class="navigation">
			<ul>
				<li><a href=""></a></li>
				<li><a href="">item</a></li>
				<li><a href="">item</a></li>
				<li><a href="">item</a></li>
				<li><a href="{{ URL::to('login') }}">Iniciar Sesion</a></li>
			</ul>
		</nav>
	</header>
	<div class="content">
		<h3>Estoy buscando un libro</h3>
		<form action="" class="search">
			<select name="searchBy" class="searchBy" id="" ng-model="search.type">
				<option value="title">Titulo</option>
				<option value="isbn">ISBN</option>
				<option value="author">Autor</option>
			</select>
			<input type="search" class="parameters" ng-model="search.parameters" placeholder="BUSCA TU LIBRO FAVORITO <presiona enter>" autofocus>
			<input type="submit" value="VAMOS!">
		</form>

		<section class="category">
			<h2>Bestsellers</h2>
			<section class="books">	
				<article class="book" ng-repeat="book in books">
					<img src="@{{ book.src }}" alt="">
					<h3>@{{ book.title }}</h3>
					<h4>@{{ book.author }}</h4>		
				</article>
				<div class="clear"></div>
			</section>
		</section>

		<section class="category">
			<h2>Bestsellers</h2>
			<section class="books">	
				<article class="book">
					<img src="../images/logo.jpg" alt="">
					<h3>Titulo</h3>
					<h4>Autor</h4>		
				</article>
				<div class="clear"></div>
			</section>
		</section>
				
	</div>
	
</body>
</html>