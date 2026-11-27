<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Management - Parking System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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

        .glass-effect {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .card-hover {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .card-hover:hover {
            transform: translateY(-2px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        }

        .input-focus {
            transition: all 0.3s ease;
        }

        .input-focus:focus {
            transform: translateY(-2px);
            box-shadow: 0 4px 20px rgba(59, 130, 246, 0.2);
        }

        .promo-input {
            position: relative;
        }

        .shimmer {
            position: relative;
            overflow: hidden;
        }

        .shimmer::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            animation: shimmer 2s infinite;
        }

        @keyframes shimmer {
            0% { left: -100%; }
            100% { left: 100%; }
        }

        .btn-gradient {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            transition: all 0.3s ease;
        }

        .btn-gradient:hover {
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
        }

        .btn-success {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
        }

        .btn-success:hover {
            background: linear-gradient(135deg, #38ef7d 0%, #11998e 100%);
            box-shadow: 0 10px 25px rgba(56, 239, 125, 0.4);
        }

        .payment-icon {
            font-size: 2rem;
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .discount-badge {
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }
    </style>
</head>
<body class="min-h-screen flex flex-col bg-gradient-to-br from-blue-50 via-purple-50 to-pink-50">
<!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <!-- Main Content -->
    <main class="flex-grow container mx-auto px-4 py-12">
        <div class="glass-effect rounded-3xl shadow-2xl p-8 md:p-12 max-w-3xl mx-auto card-hover">

            <!-- Header Section -->
            <div class="text-center mb-8">
                <div class="inline-block p-4 bg-gradient-to-r from-blue-500 to-purple-600 rounded-full mb-4">
                    <i class="fas fa-wallet text-white text-4xl"></i>
                </div>
                <h2 class="text-4xl font-bold bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent mb-2">
                    Payment Form
                </h2>
                <p class="text-gray-600 text-lg">
                    Process your payment securely and receive a digital receipt instantly.
                </p>
            </div>

            <!-- Booking Summary -->
            <div class="bg-gradient-to-r from-blue-50 to-indigo-50 border-2 border-blue-200 rounded-2xl p-6 mb-6 shadow-lg card-hover">
                <div class="flex items-center mb-4">
                    <i class="fas fa-file-invoice text-blue-600 text-2xl mr-3"></i>
                    <h3 class="text-xl font-bold text-blue-800">Booking Summary</h3>
                </div>
                <div class="space-y-3 text-sm md:text-base">
                    <div class="flex items-center justify-between bg-white rounded-lg p-3">
                        <span class="text-gray-700 flex items-center">
                            <i class="fas fa-parking text-blue-500 mr-2"></i>
                            <strong>Parking Place:</strong>
                        </span>
                        <span class="font-semibold text-gray-800">${parkingPlaceName}</span>
                    </div>
                    <div class="flex items-center justify-between bg-white rounded-lg p-3">
                        <span class="text-gray-700 flex items-center">
                            <i class="fas fa-clock text-purple-500 mr-2"></i>
                            <strong>Duration:</strong>
                        </span>
                        <span class="font-semibold text-gray-800">${hours} hour(s)</span>
                    </div>
                    <div class="flex items-center justify-between bg-white rounded-lg p-3">
                        <span class="text-gray-700 flex items-center">
                            <i class="fas fa-tag text-green-500 mr-2"></i>
                            <strong>Hourly Rate:</strong>
                        </span>
                        <span class="font-semibold text-gray-800">Rs. ${hourlyRate}</span>
                    </div>
                    <div class="flex items-center justify-between bg-gradient-to-r from-blue-100 to-blue-50 rounded-lg p-4 border-2 border-blue-300">
                        <span class="text-blue-800 flex items-center">
                            <i class="fas fa-receipt text-blue-600 mr-2"></i>
                            <strong class="text-lg">Original Amount:</strong>
                        </span>
                        <span class="text-blue-700 font-bold text-xl">Rs. <span id="originalAmount">${amount}</span></span>
                    </div>

                    <!-- Discount Info (Hidden by default) -->
                    <div id="discountInfo" class="hidden mt-4 pt-4 border-t-2 border-blue-300">
                        <div class="bg-gradient-to-r from-green-50 to-emerald-50 rounded-lg p-4 mb-3 border-2 border-green-300">
                            <div class="flex items-center justify-between">
                                <span class="text-green-700 flex items-center">
                                    <i class="fas fa-percent text-green-600 mr-2"></i>
                                    <strong>Discount Applied:</strong>
                                </span>
                                <span class="text-green-700 font-bold text-lg">Rs. <span id="discountAmount">0</span></span>
                            </div>
                        </div>
                        <div class="bg-gradient-to-r from-purple-100 to-pink-100 rounded-lg p-4 border-2 border-purple-300 discount-badge">
                            <div class="flex items-center justify-between">
                                <span class="text-purple-800 flex items-center">
                                    <i class="fas fa-check-circle text-purple-600 mr-2"></i>
                                    <strong class="text-xl">Final Amount:</strong>
                                </span>
                                <span class="text-purple-800 font-bold text-2xl">Rs. <span id="finalAmount">${amount}</span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Promo Code Section -->
            <div class="bg-gradient-to-r from-green-50 to-emerald-50 border-2 border-green-200 rounded-2xl p-6 mb-6 shadow-lg card-hover">
                <div class="flex items-center mb-4">
                    <i class="fas fa-ticket-alt text-green-600 text-2xl mr-3"></i>
                    <h3 class="text-xl font-bold text-gray-800">Have a Promo Code?</h3>
                </div>
                <div class="flex gap-3">
                    <div class="flex-grow relative">
                        <i class="fas fa-gift absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                        <input type="text" id="promoCodeInput"
                               placeholder="Enter promo code"
                               class="w-full border-2 border-gray-300 rounded-xl pl-12 pr-4 py-3 focus:ring-2 focus:ring-green-400 focus:border-green-400 input-focus transition-all">
                    </div>
                    <button type="button" id="applyPromoBtn"
                            class="btn-success text-white px-8 py-3 rounded-xl font-bold transition-all duration-300 hover:scale-105 shadow-lg flex items-center">
                        <i class="fas fa-check mr-2"></i>Apply
                    </button>
                </div>
                <div id="promoMessage" class="mt-3 text-sm font-semibold hidden rounded-lg p-3"></div>
            </div>

            <!-- Payment Form -->
            <form action="${pageContext.request.contextPath}/payments/process" method="post" class="space-y-6">
                <input type="hidden" name="reservationId" value="${reservationId}">
                <input type="hidden" id="finalAmountInput" name="amount" value="${amount}">
                <input type="hidden" id="appliedPromoCode" name="promoCode" value="">

                <!-- Customer Name -->
                <div class="card-hover">
                    <label for="customerName" class="block text-gray-700 font-semibold mb-2 flex items-center">
                        <i class="fas fa-user text-blue-600 mr-2"></i>
                        Customer Name <span class="text-red-500 ml-1">*</span>
                    </label>
                    <input type="text" id="customerName" name="customerName"
                           value="${customerName}" required
                           class="w-full border-2 border-gray-300 rounded-xl px-4 py-3 focus:ring-2 focus:ring-blue-400 focus:border-blue-400 input-focus transition-all">
                </div>

                <!-- Reservation ID (Display Only) -->
                <div class="card-hover">
                    <label for="reservationIdDisplay" class="block text-gray-700 font-semibold mb-2 flex items-center">
                        <i class="fas fa-hashtag text-purple-600 mr-2"></i>
                        Reservation ID <span class="text-red-500 ml-1">*</span>
                    </label>
                    <input type="text" id="reservationIdDisplay" name="reservationIdDisplay"
                           value="${reservationId}" readonly
                           class="w-full border-2 border-gray-300 rounded-xl px-4 py-3 bg-gradient-to-r from-gray-50 to-gray-100 font-semibold text-gray-700">
                </div>

                <!-- Amount (Display Only) -->
                <div class="card-hover">
                    <label for="amountDisplay" class="block text-gray-700 font-semibold mb-2 flex items-center">
                        <i class="fas fa-money-bill-wave text-green-600 mr-2"></i>
                        Payment Amount (Rs.) <span class="text-red-500 ml-1">*</span>
                    </label>
                    <input type="text" id="amountDisplay"
                           value="${amount}" readonly
                           class="w-full border-2 border-gray-300 rounded-xl px-4 py-3 bg-gradient-to-r from-green-50 to-emerald-50 font-bold text-green-700 text-xl">
                </div>

                <!-- Payment Method -->
                <div class="card-hover">
                    <label for="paymentMethod" class="block text-gray-700 font-semibold mb-2 flex items-center">
                        <i class="fas fa-credit-card text-indigo-600 mr-2"></i>
                        Payment Method <span class="text-red-500 ml-1">*</span>
                    </label>
                    <select id="paymentMethod" name="paymentMethod" required
                            class="w-full border-2 border-gray-300 rounded-xl px-4 py-3 focus:ring-2 focus:ring-indigo-400 focus:border-indigo-400 input-focus transition-all cursor-pointer">
                        <option value="">-- Select Payment Method --</option>
                        <option value="CARD">💳 Credit / Debit Card</option>
                        <option value="ONLINE">🌐 Online Transfer</option>
                        <option value="CASH">💵 Cash</option>
                    </select>
                </div>

                <!-- Card Details -->
                <div id="cardDetails" class="hidden space-y-4 bg-gradient-to-r from-indigo-50 to-purple-50 p-6 rounded-2xl border-2 border-indigo-200 shadow-lg card-hover">
                    <div class="flex items-center mb-4">
                        <i class="fas fa-credit-card text-indigo-600 text-2xl mr-3"></i>
                        <h4 class="text-xl font-bold text-gray-800">Card Information</h4>
                    </div>
                    <div>
                        <label for="cardNumber" class="block text-gray-700 font-semibold mb-2 flex items-center">
                            <i class="fas fa-hashtag text-indigo-500 mr-2"></i>Card Number
                        </label>
                        <input type="text" id="cardNumber" name="cardNumber" maxlength="16"
                               placeholder="1234 5678 9012 3456"
                               class="w-full border-2 border-gray-300 rounded-xl px-4 py-3 focus:ring-2 focus:ring-indigo-400 focus:border-indigo-400 input-focus transition-all">
                    </div>
                    <div class="flex gap-4">
                        <div class="w-1/2">
                            <label for="expiry" class="block text-gray-700 font-semibold mb-2 flex items-center">
                                <i class="fas fa-calendar text-indigo-500 mr-2"></i>Expiry Date (MM/YY)
                            </label>
                            <input type="text" id="expiry" name="expiry" placeholder="12/25"
                                   class="w-full border-2 border-gray-300 rounded-xl px-4 py-3 focus:ring-2 focus:ring-indigo-400 focus:border-indigo-400 input-focus transition-all">
                        </div>
                        <div class="w-1/2">
                            <label for="cvv" class="block text-gray-700 font-semibold mb-2 flex items-center">
                                <i class="fas fa-lock text-indigo-500 mr-2"></i>CVV
                            </label>
                            <input type="password" id="cvv" name="cvv" maxlength="3" placeholder="123"
                                   class="w-full border-2 border-gray-300 rounded-xl px-4 py-3 focus:ring-2 focus:ring-indigo-400 focus:border-indigo-400 input-focus transition-all">
                        </div>
                    </div>
                </div>

                <!-- Submit -->
                <div class="flex justify-center gap-4 pt-6">
                    <button type="submit"
                            class="btn-gradient text-white px-10 py-4 rounded-full shadow-xl font-bold text-lg transition-all duration-300 hover:scale-105 flex items-center">
                        <i class="fas fa-check-circle mr-3"></i>Process Payment
                    </button>
                    <a href="${pageContext.request.contextPath}/booking/list"
                       class="bg-gradient-to-r from-gray-300 to-gray-400 hover:from-gray-400 hover:to-gray-500 text-gray-800 px-10 py-4 rounded-full shadow-xl font-bold text-lg transition-all duration-300 hover:scale-105 inline-flex items-center">
                        <i class="fas fa-times-circle mr-3"></i>Cancel
                    </a>
                </div>
            </form>
        </div>
    </main>



    <!-- Script -->
    <script>
        const originalAmount = parseFloat('${amount}');
        const parkingPlaceName = '${parkingPlaceName}';
        const reservationId = '${reservationId}';

        // Apply Promo Code
        document.getElementById('applyPromoBtn').addEventListener('click', function() {
            const promoCode = document.getElementById('promoCodeInput').value.trim();
            const messageDiv = document.getElementById('promoMessage');

            if (!promoCode) {
                showMessage('Please enter a promo code', 'error');
                return;
            }

            // Disable button during request
            this.disabled = true;
            this.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Applying...';

            // Send AJAX request
            fetch('${pageContext.request.contextPath}/payments/validate-promo', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: new URLSearchParams({
                    promoCode: promoCode,
                    parkingPlaceName: parkingPlaceName,
                    originalAmount: originalAmount,
                    reservationId: reservationId
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.valid) {
                    // Show discount info
                    document.getElementById('discountInfo').classList.remove('hidden');
                    document.getElementById('discountAmount').textContent = data.discount.toFixed(2);
                    document.getElementById('finalAmount').textContent = data.finalAmount.toFixed(2);
                    document.getElementById('amountDisplay').value = data.finalAmount.toFixed(2);
                    document.getElementById('finalAmountInput').value = data.finalAmount;
                    document.getElementById('appliedPromoCode').value = promoCode;

                    showMessage(data.message, 'success');

                    // Disable promo input after successful application
                    document.getElementById('promoCodeInput').disabled = true;
                    this.innerHTML = '<i class="fas fa-check mr-2"></i>Applied';
                } else {
                    showMessage(data.message, 'error');
                    this.disabled = false;
                    this.innerHTML = '<i class="fas fa-check mr-2"></i>Apply';
                }
            })
            .catch(error => {
                showMessage('Error applying promo code', 'error');
                this.disabled = false;
                this.innerHTML = '<i class="fas fa-check mr-2"></i>Apply';
            });
        });

        function showMessage(message, type) {
            const messageDiv = document.getElementById('promoMessage');
            messageDiv.textContent = message;
            messageDiv.classList.remove('hidden', 'text-red-600', 'text-green-600', 'bg-red-100', 'bg-green-100', 'border-red-300', 'border-green-300');
            if (type === 'error') {
                messageDiv.classList.add('text-red-700', 'bg-red-100', 'border-2', 'border-red-300');
            } else {
                messageDiv.classList.add('text-green-700', 'bg-green-100', 'border-2', 'border-green-300');
            }
        }

        // Payment method handling
        document.getElementById('paymentMethod').addEventListener('change', function() {
            const cardDetails = document.getElementById('cardDetails');
            const cardInputs = cardDetails.querySelectorAll('input');

            if (this.value === 'CARD') {
                cardDetails.classList.remove('hidden');
                cardInputs.forEach(input => input.required = true);
            } else {
                cardDetails.classList.add('hidden');
                cardInputs.forEach(input => {
                    input.required = false;
                    input.value = '';
                });
            }
        });

        // Format card number input
        document.getElementById('cardNumber').addEventListener('input', function(e) {
            let value = e.target.value.replace(/\s/g, '');
            if (value.length > 16) value = value.substr(0, 16);
            e.target.value = value.replace(/\D/g, '');
        });

        // Format expiry date
        document.getElementById('expiry').addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length >= 2) {
                value = value.substr(0, 2) + '/' + value.substr(2, 2);
            }
            e.target.value = value;
        });

        // Format CVV
        document.getElementById('cvv').addEventListener('input', function(e) {
            e.target.value = e.target.value.replace(/\D/g, '');
        });
    </script>
</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>