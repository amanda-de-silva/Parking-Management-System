<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Active Promotions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .animated-gradient {
            background: linear-gradient(-45deg, #667eea, #764ba2, #f093fb, #4facfe);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
        }

        .promo-card {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            height: 100%;
            backdrop-filter: blur(10px);
        }

        .promo-card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }

        .promo-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .promo-card:hover .promo-image {
            transform: scale(1.1);
        }

        .promo-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            padding: 8px 20px;
            border-radius: 25px;
            font-weight: bold;
            box-shadow: 0 4px 15px rgba(245, 87, 108, 0.4);
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .promo-code {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 15px;
            border-radius: 12px;
            text-align: center;
            font-size: 1.3rem;
            font-weight: bold;
            color: white;
            letter-spacing: 2px;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
            border: 2px solid rgba(255, 255, 255, 0.3);
            position: relative;
            overflow: hidden;
        }

        .promo-code::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255,255,255,0.1), transparent);
            transform: rotate(45deg);
            animation: shine 3s infinite;
        }

        @keyframes shine {
            0% { transform: translateX(-100%) translateY(-100%) rotate(45deg); }
            100% { transform: translateX(100%) translateY(100%) rotate(45deg); }
        }

        .discount-badge {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            color: white;
            padding: 10px 20px;
            border-radius: 30px;
            font-size: 1.1rem;
            font-weight: bold;
            box-shadow: 0 4px 15px rgba(56, 239, 125, 0.3);
        }

        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 60px 0;
            position: relative;
            overflow: hidden;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg"><path d="M0 0h100v100H0z" fill="none"/><path d="M50 0L100 50L50 100L0 50z" fill="rgba(255,255,255,0.05)"/></svg>');
            opacity: 0.3;
        }

        .card-body {
            position: relative;
            z-index: 1;
        }

        .image-container {
            overflow: hidden;
            border-radius: 12px 12px 0 0;
        }

        .no-promo-icon {
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }
    </style>
</head>
<body class="bg-gray-50">
    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <!-- Hero Section -->
    <div class="hero-section relative">
        <div class="container mx-auto px-4 text-center relative z-10">
            <div class="inline-block mb-4 px-6 py-2 bg-white bg-opacity-20 rounded-full backdrop-blur-sm">
                <span class="text-black font-semibold">
                    <i class="fas fa-gift mr-2"></i>Special Offers
                </span>
            </div>
            <h1 class="text-5xl md:text-6xl font-bold text-white mb-4">
                Active Promotions
            </h1>
            <p class="text-xl text-white text-opacity-90 max-w-2xl mx-auto">
                Take advantage of our current offers and save on your parking!
            </p>
        </div>
    </div>

    <div class="container mx-auto px-4 py-12">
        <c:choose>
            <c:when test="${not empty promotions}">
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <c:forEach var="promotion" items="${promotions}">
                        <div class="transform transition-all duration-300">
                            <div class="card promo-card bg-white rounded-2xl shadow-lg overflow-hidden border-0">
                                <div class="position-relative image-container">
                                    <c:choose>
                                        <c:when test="${not empty promotion.imagePath}">
                                            <img src="${pageContext.request.contextPath}/${promotion.imagePath}"
                                                 alt="${promotion.title}" class="promo-image">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="promo-image animated-gradient flex items-center justify-center">
                                                <i class="fas fa-tags text-white text-6xl opacity-50"></i>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>

                                    <span class="promo-badge">
                                        <c:choose>
                                            <c:when test="${promotion.discountPercentage != null}">
                                                ${promotion.discountPercentage}% OFF
                                            </c:when>
                                            <c:when test="${promotion.discountAmount != null}">
                                                Rs. <fmt:formatNumber value="${promotion.discountAmount}" pattern="#,##0"/> OFF
                                            </c:when>
                                        </c:choose>
                                    </span>
                                </div>

                                <div class="card-body p-6">
                                    <h5 class="text-2xl font-bold text-gray-800 mb-3">${promotion.title}</h5>

                                    <c:if test="${not empty promotion.lotName}">
                                        <div class="flex items-center text-gray-600 mb-3 bg-gray-100 rounded-lg px-3 py-2">
                                            <i class="fas fa-parking text-blue-600 mr-2"></i>
                                            <span class="font-medium">${promotion.lotName}</span>
                                        </div>
                                    </c:if>

                                    <p class="text-gray-600 mb-4 leading-relaxed">${promotion.description}</p>

                                    <div class="promo-code mb-4">
                                        <i class="fas fa-ticket-alt mr-2"></i>${promotion.promoCode}
                                    </div>

                                    <div class="flex justify-center mb-4">
                                        <span class="discount-badge inline-flex items-center">
                                            <i class="fas fa-tag mr-2"></i>
                                            <c:choose>
                                                <c:when test="${promotion.discountPercentage != null}">
                                                    Save ${promotion.discountPercentage}%
                                                </c:when>
                                                <c:when test="${promotion.discountAmount != null}">
                                                    Save Rs. <fmt:formatNumber value="${promotion.discountAmount}" pattern="#,##0.00"/>
                                                </c:when>
                                            </c:choose>
                                        </span>
                                    </div>

                                    <div class="border-t border-gray-200 pt-4 mt-4">
                                        <div class="flex items-center justify-center text-sm text-gray-500">
                                            <i class="fas fa-calendar-alt mr-2 text-purple-600"></i>
                                            <span>
                                                <strong class="text-gray-700"><fmt:formatDate value="${promotion.startDate}" pattern="MMM dd, yyyy"/></strong>
                                                <span class="mx-2">to</span>
                                                <strong class="text-gray-700"><fmt:formatDate value="${promotion.endDate}" pattern="MMM dd, yyyy"/></strong>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="text-center py-16 bg-white rounded-3xl shadow-lg">
                    <div class="no-promo-icon">
                        <i class="fas fa-inbox text-gray-300 mb-6" style="font-size: 6rem;"></i>
                    </div>
                    <h3 class="text-3xl font-bold text-gray-700 mb-3">No Active Promotions</h3>
                    <p class="text-xl text-gray-500">Check back later for exciting offers!</p>
                </div>
            </c:otherwise>
        </c:choose>

        <div class="text-center mt-12">
            <a href="${pageContext.request.contextPath}/"
               class="inline-flex items-center px-8 py-4 bg-gradient-to-r from-purple-600 to-blue-600 text-white text-lg font-semibold rounded-full shadow-lg hover:shadow-xl transform hover:scale-105 transition-all duration-300">
                <i class="fas fa-arrow-left mr-3"></i>
                Back to Home
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>