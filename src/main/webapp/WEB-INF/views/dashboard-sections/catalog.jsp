<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
</head>

<div class="container">
    <div class="row mt-4">
        <div class="col-md-12 text-right">
            <a href="items/new" class="btn btn-success mb-3"><i class="fas fa-plus"></i> Add</a>
        </div>
    </div>
    <div class="row">
        <c:forEach items="${items}" var="item">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img class="card-img-top" src="${empty item.imageUrl ? 'https://via.placeholder.com/150x100?text=Item' : item.imageUrl}"
                         alt="Product image">
                    <div class="card-body">
                        <h5 class="card-title">${item.name}</h5>
                        <p class="card-text">${item.description}</p>
                        <a href="#" class="btn btn-primary catalog-details-btn"><i class="fas fa-eye"></i> Details</a>
                        <a href="/items/edit/?itemId=${item.id}" class="btn btn-warning catalog-edit-btn"><i class="fas fa-pencil-alt"></i> Edit</a>
                        <a href="/items/delete?itemId=${item.id}" class="btn btn-danger catalog-delete-btn"><i class="fas fa-trash"></i> Delete</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
