<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/.../resources/js/script.js"></script>
</head>
<body>
	<h1>Help to navigate the website</h1>
	<h2>Subtitle</h2>
	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam
		tincidunt urna eget justo lacinia, a commodo massa maximus. Sed in
		malesuada ante. Pellentesque bibendum leo libero, non commodo sapien
		luctus nec. Maecenas tristique metus a dolor hendrerit, in ultricies
		massa dictum. Donec nec turpis lorem. Ut at nulla at augue
		pellentesque fringilla non et quam. Donec fermentum, lorem sit amet
		varius sollicitudin, eros ipsum iaculis massa, nec malesuada magna
		quam ut odio.</p>

	<h2>Navigation Menu Intructions</h2>

	<ol>
		<li>To access the Home page, click on the <strong>"Home"</strong>
			link.
		</li>
		<li>To manage categories, hover over the <strong>"Categories"</strong>
			menu item and click on either <strong>"Add new category"</strong> to
			create a new category or <strong>"Category list"</strong> to view and
			edit existing categories.
		</li>
		<li>To manage items, hover over the <strong>"Items"</strong> menu
			item and click on either <strong>"Add new item"</strong> to create a
			new item or <strong>"Items list"</strong> to view and edit existing
			items.
		</li>
		<li>To access the Help page, click on the <strong>"Help"</strong>
			link.
		</li>
		<li>To access the user settings, click on the <strong>"Settings"</strong>
			link.
		</li>
		<li>If you are logged in, you can click on the <strong>"Logout"</strong>
			link to log out of your account.
		</li>
	</ol>

	<h2>How to use the Item Management Section</h2>

	<ol>
		<li>Enter a search term in the <strong>"Search items"</strong>
			input field.
		</li>
		<li>Click the <strong>"Search"</strong> button to perform the
			search.
		</li>
		<li>The search results will appear below the search bar in the <strong>"Search
				results"</strong> section.
		</li>
		<li>To add a new item, click the <strong>"Add"</strong> button
			located above the item cards.
		</li>
		<li>Each item is displayed as a card with an image, title, and
			description.</li>
		<li>To view more details about an item, click the <strong>"Details"</strong>
			button on the item's card.
		</li>
		<li>To edit an item, click the <strong>"Edit"</strong> button on
			the item's card.
		</li>
		<li>To delete an item, click the <strong>"Delete"</strong> button
			on the item's card and confirm the action in the confirmation dialog.
		</li>
	</ol>
</body>
</html>