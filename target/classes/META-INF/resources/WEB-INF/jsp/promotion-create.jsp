<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Promotion</title>
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

        .fade-in { animation: fadeIn 0.6s ease-out; }
        .slide-in-left { animation: slideInLeft 0.5s ease-out; }

        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .gradient-card {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
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

        .badge-custom {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-weight: 600;
        }

        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
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
                        <i class="fas fa-plus-circle text-purple-600" style="font-size: 2rem; color: #667eea;"></i>
                    </div>
                    <div>
                        <h2 class="text-white fw-bold mb-1" style="font-size: 2rem;">Create New Promotion</h2>
                        <p class="text-white-50 mb-0">Fill in the details to create an exciting promotion</p>
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

        <!-- Main Form Card -->
        <div class="card border-0 shadow-2xl rounded-4 glass-effect fade-in card-hover">
            <div class="card-header border-0 rounded-top-4 py-4" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                <h4 class="text-white mb-0 fw-bold">
                    <i class="fas fa-file-invoice me-2"></i>Promotion Details
                </h4>
            </div>
            <div class="card-body p-4">
                <form method="post" action="${pageContext.request.contextPath}/promotions/create"
                      enctype="multipart/form-data">

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
                                <input type="text" class="form-control form-control-lg rounded-3 shadow-sm"
                                       id="title" name="title" required
                                       placeholder="Enter promotion title">
                            </div>

                            <div class="col-md-6 mb-3">
                                <label for="promoCode" class="form-label fw-semibold">
                                    <i class="fas fa-ticket-alt me-2" style="color: #667eea;"></i>Promo Code
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" class="form-control form-control-lg rounded-3 shadow-sm"
                                       id="promoCode" name="promoCode"
                                       placeholder="e.g., SUMMER2025" required>
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
                                      rows="3" placeholder="Describe the promotion..."></textarea>
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
                                        <option value="${place.parkingName}">${place.parkingName}</option>
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
                                <input type="file" class="form-control form-control-lg rounded-3 shadow-sm"
                                       id="image" name="image" accept="image/*">
                                <small class="text-muted">
                                    <i class="fas fa-file-image me-1"></i>JPG, PNG, or GIF (Max 5MB)
                                </small>
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
                                    <input type="number" class="form-control form-control-lg rounded-start-3"
                                           id="discountPercentage"
                                           name="discountPercentage" min="0" max="100" step="0.01"
                                           onchange="toggleDiscountFields('percentage')"
                                           placeholder="0.00">
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
                                    <input type="number" class="form-control form-control-lg rounded-end-3"
                                           id="discountAmount"
                                           name="discountAmount" min="0" step="0.01"
                                           onchange="toggleDiscountFields('amount')"
                                           placeholder="0.00">
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
                                <input type="date" class="form-control form-control-lg rounded-3 shadow-sm"
                                       id="startDate" name="startDate" required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label for="endDate" class="form-label fw-semibold">
                                    <i class="fas fa-calendar-check me-2" style="color: #667eea;"></i>End Date
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="date" class="form-control form-control-lg rounded-3 shadow-sm"
                                       id="endDate" name="endDate" required>
                            </div>
                        </div>
                    </div>

                    <!-- Active Status -->
                    <div class="mb-3">
                        <div class="form-check form-switch p-0">
                            <div class="bg-light rounded-3 p-4 shadow-sm border border-light">
                                <div class="d-flex align-items-center">
                                    <input class="form-check-input me-3" type="checkbox" id="isActive"
                                           name="isActive" value="true" checked
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
                            <i class="fas fa-save me-2"></i> Create Promotion
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Info Cards -->
        <div class="row mt-4 fade-in">
            <div class="col-md-4 mb-3">
                <div class="card border-0 shadow rounded-4 card-hover" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                    <div class="card-body text-center text-white p-4">
                        <i class="fas fa-lightbulb fa-3x mb-3"></i>
                        <h6 class="fw-bold">Pro Tip</h6>
                        <p class="small mb-0">Create engaging promotions to attract more customers</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card border-0 shadow rounded-4 card-hover" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);">
                    <div class="card-body text-center text-white p-4">
                        <i class="fas fa-clock fa-3x mb-3"></i>
                        <h6 class="fw-bold">Time-Limited</h6>
                        <p class="small mb-0">Set appropriate start and end dates for urgency</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card border-0 shadow rounded-4 card-hover" style="background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);">
                    <div class="card-body text-center text-white p-4">
                        <i class="fas fa-chart-line fa-3x mb-3"></i>
                        <h6 class="fw-bold">Track Success</h6>
                        <p class="small mb-0">Monitor promotion performance regularly</p>
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

        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('startDate').setAttribute('min', today);
            document.getElementById('endDate').setAttribute('min', today);
        });

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