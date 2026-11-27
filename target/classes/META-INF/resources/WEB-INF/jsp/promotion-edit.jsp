<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Promotion</title>
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

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.8; }
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

        .input-glow:focus {
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.3);
            border-color: #667eea;
            transition: all 0.3s ease;
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
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        }

        .icon-bounce:hover {
            animation: bounce 0.6s ease;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .form-control:focus, .form-select:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }

        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }

        .info-badge {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 10px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .image-preview-container {
            position: relative;
            display: inline-block;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
            border: 3px solid #667eea;
        }
    </style>
</head>
<body>
 <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <div class="container py-4">
        <!-- Header Section -->
        <div class="row mb-4 slide-in-left">
            <div class="col">
                <div class="d-flex align-items-center">
                    <div class="bg-white rounded-circle p-3 shadow-lg me-3 icon-bounce">
                        <i class="fas fa-edit text-purple-600" style="font-size: 2rem; color: #667eea;"></i>
                    </div>
                    <div>
                        <h2 class="text-white fw-bold mb-1" style="font-size: 2rem;">Edit Promotion</h2>
                        <p class="text-white-50 mb-0">Update promotion details and settings</p>
                    </div>
                </div>
            </div>
            <div class="col-auto">
                <a href="${pageContext.request.contextPath}/promotions"
                   class="btn btn-light shadow-lg px-4 py-2 rounded-pill">
                    <i class="fas fa-arrow-left me-2"></i> Back to List
                </a>
            </div>
        </div>

        <!-- Error Messages -->
        <c:if test="${not empty errorMessage}">
            <div class="fade-in mb-4">
                <div class="alert alert-danger alert-dismissible fade show shadow-lg rounded-4 border-0" role="alert" style="background: linear-gradient(135deg, #ff6b6b 0%, #ee5a6f 100%); color: white;">
                    <i class="fas fa-exclamation-circle me-2"></i>
                    <strong>Error!</strong> ${errorMessage}
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </c:if>

        <!-- Main Form Card -->
        <div class="card border-0 shadow-2xl rounded-4 glass-effect fade-in card-hover mb-4">
            <div class="card-header border-0 rounded-top-4 py-4" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                <h4 class="text-white mb-0 fw-bold">
                    <i class="fas fa-file-edit me-2"></i>Promotion Details
                </h4>
            </div>
            <div class="card-body p-4">
                <form method="post" action="${pageContext.request.contextPath}/promotions/edit/${promotion.id}">

                    <!-- Basic Information Section -->
                    <div class="mb-4">
                        <h5 class="fw-bold mb-3" style="color: #667eea;">
                            <i class="fas fa-info-circle me-2"></i>Basic Information
                        </h5>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="title" class="form-label fw-semibold">
                                    <i class="fas fa-heading me-2" style="color: #667eea;"></i>Title
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" class="form-control form-control-lg rounded-3 shadow-sm" id="title" name="title"
                                       value="${promotion.title}" required placeholder="Enter promotion title">
                            </div>

                            <div class="col-md-6 mb-3">
                                <label for="promoCode" class="form-label fw-semibold">
                                    <i class="fas fa-ticket-alt me-2" style="color: #667eea;"></i>Promo Code
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" class="form-control form-control-lg rounded-3 shadow-sm" id="promoCode" name="promoCode"
                                       value="${promotion.promoCode}" required placeholder="e.g., SUMMER2025">
                                <small class="text-muted">
                                    <i class="fas fa-lightbulb me-1"></i>Unique code that users will enter
                                </small>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label fw-semibold">
                                <i class="fas fa-align-left me-2" style="color: #667eea;"></i>Description
                            </label>
                            <textarea class="form-control rounded-3 shadow-sm" id="description" name="description"
                                      rows="3" placeholder="Describe the promotion...">${promotion.description}</textarea>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Parking and Media Section -->
                    <div class="mb-4">
                        <h5 class="fw-bold mb-3" style="color: #667eea;">
                            <i class="fas fa-parking me-2"></i>Parking & Media
                        </h5>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="lotName" class="form-label fw-semibold">
                                    <i class="fas fa-map-marker-alt me-2" style="color: #667eea;"></i>Parking Name
                                </label>
                                <select class="form-control form-control-lg rounded-3 shadow-sm" id="lotName" name="lotName">
                                    <option value="">-- All Parking Lots (General Promotion) --</option>
                                    <c:forEach items="${parkingPlaces}" var="place">
                                        <option value="${place.parkingName}"
                                                ${promotion.lotName == place.parkingName ? 'selected' : ''}>
                                            ${place.parkingName}
                                        </option>
                                    </c:forEach>
                                </select>
                                <small class="text-muted">
                                    <i class="fas fa-info-circle me-1"></i>Select a specific parking lot or leave as general
                                </small>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label for="image" class="form-label fw-semibold">
                                    <i class="fas fa-image me-2" style="color: #667eea;"></i>Promotion Image
                                </label>
                                <input type="file" class="form-control form-control-lg rounded-3 shadow-sm" id="image" name="image"
                                       accept="image/*">
                                <small class="text-muted">
                                    <i class="fas fa-file-image me-1"></i>JPG, PNG, or GIF (Max 5MB) - Leave empty to keep current image
                                </small>
                                <c:if test="${not empty promotion.imagePath}">
                                    <div class="mt-3">
                                        <p class="fw-semibold mb-2" style="color: #667eea;">
                                            <i class="fas fa-eye me-2"></i>Current Image:
                                        </p>
                                        <div class="image-preview-container">
                                            <img src="${pageContext.request.contextPath}/${promotion.imagePath}"
                                                 alt="Current image" style="max-width: 200px; max-height: 150px; display: block;">
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Discount Section -->
                    <div class="mb-4">
                        <h5 class="fw-bold mb-3" style="color: #667eea;">
                            <i class="fas fa-tags me-2"></i>Discount Details
                        </h5>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="discountPercentage" class="form-label fw-semibold">
                                    <i class="fas fa-percentage me-2" style="color: #f5576c;"></i>Discount Percentage (%)
                                </label>
                                <div class="input-group shadow-sm">
                                    <input type="number" class="form-control form-control-lg rounded-start-3" id="discountPercentage"
                                           name="discountPercentage" min="0" max="100" step="0.01"
                                           value="${promotion.discountPercentage}"
                                           onchange="toggleDiscountFields('percentage')" placeholder="0.00">
                                    <span class="input-group-text rounded-end-3 bg-light">
                                        <i class="fas fa-percent"></i>
                                    </span>
                                </div>
                                <small class="text-muted">
                                    <i class="fas fa-info-circle me-1"></i>Leave empty if using fixed amount
                                </small>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label for="discountAmount" class="form-label fw-semibold">
                                    <i class="fas fa-dollar-sign me-2" style="color: #f5576c;"></i>Discount Amount (Rs.)
                                </label>
                                <div class="input-group shadow-sm">
                                    <span class="input-group-text rounded-start-3 bg-light">Rs.</span>
                                    <input type="number" class="form-control form-control-lg rounded-end-3" id="discountAmount"
                                           name="discountAmount" min="0" step="0.01"
                                           value="${promotion.discountAmount}"
                                           onchange="toggleDiscountFields('amount')" placeholder="0.00">
                                </div>
                                <small class="text-muted">
                                    <i class="fas fa-info-circle me-1"></i>Leave empty if using percentage
                                </small>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Date Range Section -->
                    <div class="mb-4">
                        <h5 class="fw-bold mb-3" style="color: #667eea;">
                            <i class="fas fa-calendar-alt me-2"></i>Validity Period
                        </h5>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="startDate" class="form-label fw-semibold">
                                    <i class="fas fa-calendar-plus me-2" style="color: #667eea;"></i>Start Date
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="date" class="form-control form-control-lg rounded-3 shadow-sm" id="startDate" name="startDate"
                                       value="<fmt:formatDate value='${promotion.startDate}' pattern='yyyy-MM-dd'/>" required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label for="endDate" class="form-label fw-semibold">
                                    <i class="fas fa-calendar-check me-2" style="color: #667eea;"></i>End Date
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="date" class="form-control form-control-lg rounded-3 shadow-sm" id="endDate" name="endDate"
                                       value="<fmt:formatDate value='${promotion.endDate}' pattern='yyyy-MM-dd'/>" required>
                            </div>
                        </div>
                    </div>

                    <!-- Active Status -->
                    <div class="mb-3">
                        <div class="form-check form-switch p-0">
                            <div class="bg-light rounded-3 p-4 shadow-sm border border-light">
                                <div class="d-flex align-items-center">
                                    <input class="form-check-input me-3" type="checkbox" id="isActive"
                                           name="isActive" value="true" ${promotion.isActive ? 'checked' : ''}
                                           style="width: 3rem; height: 1.5rem; cursor: pointer;">
                                    <label class="form-check-label fw-semibold mb-0" for="isActive" style="cursor: pointer;">
                                        <i class="fas fa-toggle-on me-2" style="color: #667eea;"></i>
                                        Active (users can use this promotion)
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Action Buttons -->
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="${pageContext.request.contextPath}/promotions"
                           class="btn btn-lg btn-outline-secondary rounded-pill px-5 shadow-sm">
                            <i class="fas fa-times me-2"></i>Cancel
                        </a>
                        <button type="submit" class="btn btn-lg rounded-pill px-5 shadow-lg btn-gradient text-white">
                            <i class="fas fa-save me-2"></i> Update Promotion
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Promotion Info Card -->
        <div class="card border-0 shadow-lg rounded-4 glass-effect fade-in card-hover">
            <div class="card-header border-0 rounded-top-4 py-3" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);">
                <h5 class="mb-0 text-white fw-bold">
                    <i class="fas fa-info-circle me-2"></i>Promotion Information
                </h5>
            </div>
            <div class="card-body p-4">
                <div class="row g-4">
                    <div class="col-md-6">
                        <div class="d-flex align-items-center p-3 rounded-3 shadow-sm" style="background: linear-gradient(135deg, #e0f7fa 0%, #b2ebf2 100%);">
                            <div class="bg-white rounded-circle p-3 me-3 shadow">
                                <i class="fas fa-calendar-plus fa-2x" style="color: #00897b;"></i>
                            </div>
                            <div>
                                <p class="mb-1 text-muted small fw-semibold">Created At</p>
                                <p class="mb-0 fw-bold" style="color: #00897b; font-size: 1.1rem;">
                                    <fmt:formatDate value="${promotion.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="d-flex align-items-center p-3 rounded-3 shadow-sm" style="background: linear-gradient(135deg, #fff3e0 0%, #ffe0b2 100%);">
                            <div class="bg-white rounded-circle p-3 me-3 shadow">
                                <i class="fas fa-sync-alt fa-2x" style="color: #ef6c00;"></i>
                            </div>
                            <div>
                                <p class="mb-1 text-muted small fw-semibold">Last Updated</p>
                                <p class="mb-0 fw-bold" style="color: #ef6c00; font-size: 1.1rem;">
                                    <fmt:formatDate value="${promotion.updatedAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function toggleDiscountFields(type) {
            const percentageField = document.getElementById('discountPercentage');
            const amountField = document.getElementById('discountAmount');

            if (type === 'percentage' && percentageField.value) {
                amountField.value = '';
                amountField.disabled = true;
            } else if (type === 'amount' && amountField.value) {
                percentageField.value = '';
                percentageField.disabled = true;
            } else {
                percentageField.disabled = false;
                amountField.disabled = false;
            }
        }

        // Initialize on page load
        document.addEventListener('DOMContentLoaded', function() {
            const percentageField = document.getElementById('discountPercentage');
            const amountField = document.getElementById('discountAmount');

            if (percentageField.value) {
                amountField.disabled = true;
            } else if (amountField.value) {
                percentageField.disabled = true;
            }
        });

        // Validate end date is after start date
        document.getElementById('endDate').addEventListener('change', function() {
            const startDate = document.getElementById('startDate').value;
            const endDate = this.value;

            if (startDate && endDate && endDate < startDate) {
                alert('End date must be after start date');
                this.value = '';
            }
        });
    </script>
</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>