<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Promotions Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideInLeft {
            from { opacity: 0; transform: translateX(-30px); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes shimmer {
            0% { background-position: -1000px 0; }
            100% { background-position: 1000px 0; }
        }

        .fade-in { animation: fadeIn 0.6s ease-out; }
        .slide-in-left { animation: slideInLeft 0.5s ease-out; }

        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .glass-effect {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .table-row-hover {
            transition: all 0.3s ease;
        }

        .table-row-hover:hover {
            transform: translateX(5px);
            background: linear-gradient(90deg, rgba(102, 126, 234, 0.05) 0%, transparent 100%);
        }

        .btn-gradient {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            transition: all 0.3s ease;
        }

        .btn-gradient:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
        }

        .card-hover {
            transition: all 0.3s ease;
        }

        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }

        .status-badge {
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.85rem;
        }

        .card-stats {
            border-left: 4px solid #007bff;
        }

        .table-actions a {
            margin: 0 0.25rem;
            transition: all 0.3s ease;
        }

        .table-actions a:hover {
            transform: scale(1.1);
        }

        .promo-image {
            max-width: 80px;
            max-height: 60px;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .icon-bounce:hover {
            animation: bounce 0.6s ease;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }

        .promo-code-badge {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            padding: 0.35rem 0.75rem;
            border-radius: 8px;
            font-family: 'Courier New', monospace;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .discount-badge {
            background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
            color: #c0392b;
            padding: 0.35rem 0.75rem;
            border-radius: 8px;
            font-weight: bold;
        }

        .empty-state {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 20px;
            padding: 3rem;
        }
    </style>
</head>
<body>
 <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <div class="container-fluid py-4">
        <!-- Header Section -->
        <div class="row mb-4 slide-in-left">
            <div class="col">
                <div class="d-flex align-items-center">
                    <div class="bg-white rounded-circle p-3 shadow-lg me-3 icon-bounce">
                        <i class="fas fa-tags" style="font-size: 2rem; color: #667eea;"></i>
                    </div>
                    <div>
                        <h2 class="text-white fw-bold mb-1" style="font-size: 2rem;">Promotions Management</h2>
                        <p class="text-white-50 mb-0">
                            <i class="fas fa-chart-line me-2"></i>Track and manage all promotional campaigns
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-auto">
                <a href="${pageContext.request.contextPath}/promotions/create"
                   class="btn btn-light btn-lg shadow-lg px-4 py-2 rounded-pill btn-gradient text-white">
                    <i class="fas fa-plus me-2"></i> Create New Promotion
                </a>
            </div>
        </div>

        <!-- Success Message -->
        <c:if test="${not empty successMessage}">
            <div class="fade-in mb-4">
                <div class="alert alert-success alert-dismissible fade show shadow-lg rounded-4 border-0" role="alert" style="background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%); color: white;">
                    <i class="fas fa-check-circle me-2"></i>
                    <strong>Success!</strong> ${successMessage}
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </c:if>

        <!-- Error Message -->
        <c:if test="${not empty errorMessage}">
            <div class="fade-in mb-4">
                <div class="alert alert-danger alert-dismissible fade show shadow-lg rounded-4 border-0" role="alert" style="background: linear-gradient(135deg, #ff6b6b 0%, #ee5a6f 100%); color: white;">
                    <i class="fas fa-exclamation-circle me-2"></i>
                    <strong>Error!</strong> ${errorMessage}
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </c:if>

        <!-- Main Table Card -->
        <div class="card border-0 shadow-2xl rounded-4 glass-effect fade-in">
            <div class="card-header border-0 rounded-top-4 py-4" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                <div class="d-flex justify-content-between align-items-center">
                    <h4 class="text-white mb-0 fw-bold">
                        <i class="fas fa-list-ul me-2"></i>All Promotions
                    </h4>
                    <div class="d-flex gap-2">
                        <span class="badge bg-white text-dark px-3 py-2 rounded-pill">
                            <i class="fas fa-database me-2"></i>
                            <strong>${not empty promotions ? promotions.size() : 0}</strong> Total
                        </span>
                    </div>
                </div>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover mb-0">
                        <thead style="background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);">
                            <tr>
                                <th class="px-4 py-3 fw-bold text-dark">
                                    <i class="fas fa-hashtag me-2" style="color: #667eea;"></i>ID
                                </th>
                                <th class="px-4 py-3 fw-bold text-dark">
                                    <i class="fas fa-image me-2" style="color: #667eea;"></i>Image
                                </th>
                                <th class="px-4 py-3 fw-bold text-dark">
                                    <i class="fas fa-heading me-2" style="color: #667eea;"></i>Title
                                </th>
                                <th class="px-4 py-3 fw-bold text-dark">
                                    <i class="fas fa-parking me-2" style="color: #667eea;"></i>Lot Name
                                </th>
                                <th class="px-4 py-3 fw-bold text-dark">
                                    <i class="fas fa-ticket-alt me-2" style="color: #667eea;"></i>Promo Code
                                </th>
                                <th class="px-4 py-3 fw-bold text-dark">
                                    <i class="fas fa-percent me-2" style="color: #667eea;"></i>Discount
                                </th>
                                <th class="px-4 py-3 fw-bold text-dark">
                                    <i class="fas fa-calendar-alt me-2" style="color: #667eea;"></i>Date Range
                                </th>
                                <th class="px-4 py-3 fw-bold text-dark">
                                    <i class="fas fa-toggle-on me-2" style="color: #667eea;"></i>Status
                                </th>
                                <th class="px-4 py-3 fw-bold text-dark">
                                    <i class="fas fa-cog me-2" style="color: #667eea;"></i>Actions
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="promotion" items="${promotions}">
                                <tr class="table-row-hover">
                                    <td class="px-4 py-3 align-middle">
                                        <span class="badge bg-light text-dark border fw-bold" style="font-size: 0.9rem;">
                                            #${promotion.id}
                                        </span>
                                    </td>
                                    <td class="px-4 py-3 align-middle">
                                        <c:choose>
                                            <c:when test="${not empty promotion.imagePath}">
                                                <img src="${pageContext.request.contextPath}/${promotion.imagePath}"
                                                     alt="Promotion" class="promo-image">
                                            </c:when>
                                            <c:otherwise>
                                                <div class="text-muted text-center rounded-3" style="width: 80px; height: 60px; display: flex; align-items: center; justify-content: center; border: 2px dashed #ccc; background: #f8f9fa;">
                                                    <i class="fas fa-image fa-2x" style="color: #dee2e6;"></i>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="px-4 py-3 align-middle">
                                        <div>
                                            <strong class="d-block mb-1" style="color: #2c3e50; font-size: 1rem;">
                                                ${promotion.title}
                                            </strong>
                                            <small class="text-muted">
                                                <i class="fas fa-align-left me-1"></i>${promotion.description}
                                            </small>
                                        </div>
                                    </td>
                                    <td class="px-4 py-3 align-middle">
                                        <c:choose>
                                            <c:when test="${not empty promotion.lotName}">
                                                <span class="badge bg-info text-dark px-3 py-2 rounded-pill">
                                                    <i class="fas fa-map-marker-alt me-1"></i>${promotion.lotName}
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-secondary px-3 py-2 rounded-pill">
                                                    <i class="fas fa-globe me-1"></i>All Lots
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="px-4 py-3 align-middle">
                                        <span class="promo-code-badge">
                                            ${promotion.promoCode}
                                        </span>
                                    </td>
                                    <td class="px-4 py-3 align-middle">
                                        <c:choose>
                                            <c:when test="${promotion.discountPercentage != null}">
                                                <span class="discount-badge">
                                                    <i class="fas fa-percentage me-1"></i>${promotion.discountPercentage}%
                                                </span>
                                            </c:when>
                                            <c:when test="${promotion.discountAmount != null}">
                                                <span class="discount-badge">
                                                    <i class="fas fa-rupee-sign me-1"></i>
                                                    <fmt:formatNumber value="${promotion.discountAmount}" pattern="#,##0.00"/>
                                                </span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td class="px-4 py-3 align-middle">
                                        <div class="d-flex flex-column gap-1">
                                            <small class="text-muted">
                                                <i class="fas fa-calendar-plus me-1" style="color: #27ae60;"></i>
                                                <fmt:formatDate value="${promotion.startDate}" pattern="yyyy-MM-dd"/>
                                            </small>
                                            <small class="text-muted">
                                                <i class="fas fa-calendar-check me-1" style="color: #e74c3c;"></i>
                                                <fmt:formatDate value="${promotion.endDate}" pattern="yyyy-MM-dd"/>
                                            </small>
                                        </div>
                                    </td>
                                    <td class="px-4 py-3 align-middle">
                                        <c:choose>
                                            <c:when test="${promotion.isActive}">
                                                <span class="badge px-3 py-2 rounded-pill" style="background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%); font-size: 0.85rem;">
                                                    <i class="fas fa-check-circle me-1"></i>Active
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-secondary px-3 py-2 rounded-pill" style="font-size: 0.85rem;">
                                                    <i class="fas fa-times-circle me-1"></i>Inactive
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="px-4 py-3 align-middle">
                                        <div class="table-actions d-flex gap-1">
                                            <a href="${pageContext.request.contextPath}/promotions/edit/${promotion.id}"
                                               class="btn btn-sm btn-warning rounded-circle shadow-sm" title="Edit" style="width: 36px; height: 36px; display: flex; align-items: center; justify-content: center;">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="${pageContext.request.contextPath}/promotions/toggle/${promotion.id}"
                                               class="btn btn-sm btn-secondary rounded-circle shadow-sm" title="Toggle Status" style="width: 36px; height: 36px; display: flex; align-items: center; justify-content: center;">
                                                <i class="fas fa-toggle-on"></i>
                                            </a>
                                            <a href="${pageContext.request.contextPath}/promotions/delete/${promotion.id}"
                                               class="btn btn-sm btn-danger rounded-circle shadow-sm"
                                               onclick="return confirm('Are you sure you want to delete this promotion?');"
                                               title="Delete" style="width: 36px; height: 36px; display: flex; align-items: center; justify-content: center;">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty promotions}">
                                <tr>
                                    <td colspan="9" class="text-center py-5">
                                        <div class="empty-state text-white">
                                            <i class="fas fa-inbox fa-4x mb-4" style="opacity: 0.5;"></i>
                                            <h4 class="fw-bold mb-3">No Promotions Found</h4>
                                            <p class="mb-4">Start creating promotional campaigns to attract more customers</p>
                                            <a href="${pageContext.request.contextPath}/promotions/create"
                                               class="btn btn-light btn-lg rounded-pill px-5 shadow-lg">
                                                <i class="fas fa-plus-circle me-2"></i>Create Your First Promotion
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>