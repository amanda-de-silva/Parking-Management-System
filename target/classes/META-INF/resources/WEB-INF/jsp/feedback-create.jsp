<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create New Feedback</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        .animate-gradient {
            background-size: 200% 200%;
            animation: gradient 15s ease infinite;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .fade-in {
            animation: fadeIn 0.6s ease-out;
        }
    </style>
    <script>
        function validateContactNumber() {
            var contactNumber = document.getElementById('contactNumber').value;
            var pattern = /^[0-9]{10}$/;

            if (!pattern.test(contactNumber)) {
                alert('Contact Number must be exactly 10 digits (numbers only)');
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="bg-gradient-to-br from-blue-50 via-purple-50 to-pink-50 min-h-screen">
    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <div class="min-h-screen py-8 px-4 sm:px-6 lg:px-8">
        <div class="max-w-4xl mx-auto">
            <!-- Header Card -->
            <div class="bg-white rounded-3xl shadow-2xl overflow-hidden mb-6 fade-in">
                <div class="relative bg-gradient-to-r from-blue-600 via-purple-600 to-pink-600 animate-gradient p-8 text-white">
                    <div class="absolute top-0 right-0 -mt-4 -mr-4 w-32 h-32 bg-white/10 rounded-full blur-3xl"></div>
                    <div class="absolute bottom-0 left-0 -mb-4 -ml-4 w-40 h-40 bg-white/10 rounded-full blur-3xl"></div>
                    <div class="relative z-10 flex items-center justify-center space-x-3">
                        <div class="w-14 h-14 bg-white/20 backdrop-blur-sm rounded-2xl flex items-center justify-center">
                            <span class="text-3xl">📝</span>
                        </div>
                        <h1 class="text-3xl sm:text-4xl font-bold">Create New Feedback</h1>
                    </div>
                    <p class="text-center mt-3 text-blue-100 text-sm sm:text-base">We value your feedback and will respond promptly</p>
                </div>
            </div>

            <!-- Form Card -->
            <div class="bg-white rounded-3xl shadow-2xl p-6 sm:p-10 fade-in">
                <form action="${pageContext.request.contextPath}/feedbacks" method="post" enctype="multipart/form-data" class="space-y-6" onsubmit="return validateContactNumber()">
                    <!-- Customer Name -->
                    <div class="group">
                        <label for="customerName" class="block text-sm font-semibold text-gray-700 mb-2">
                            Customer Name <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                <svg class="w-5 h-5 text-gray-400 group-focus-within:text-blue-600 transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                </svg>
                            </div>
                            <input type="text" id="customerName" name="customerName" required
                                   placeholder="Enter customer full name"
                                   class="w-full pl-12 pr-4 py-3.5 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-100 transition-all duration-300 text-gray-900 placeholder-gray-400">
                        </div>
                    </div>

                    <!-- Contact Number -->
                    <div class="group">
                        <label for="contactNumber" class="block text-sm font-semibold text-gray-700 mb-2">
                            Contact Number <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                <svg class="w-5 h-5 text-gray-400 group-focus-within:text-blue-600 transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path>
                                </svg>
                            </div>
                            <input type="tel" id="contactNumber" name="contactNumber" required maxlength="10" pattern="[0-9]{10}"
                                   placeholder="e.g., +94 77 123 4567"
                                   class="w-full pl-12 pr-4 py-3.5 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-100 transition-all duration-300 text-gray-900 placeholder-gray-400">
                        </div>
                    </div>

                    <!-- Email Address -->
                    <div class="group">
                        <label for="email" class="block text-sm font-semibold text-gray-700 mb-2">
                            Email Address <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                <svg class="w-5 h-5 text-gray-400 group-focus-within:text-blue-600 transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207"></path>
                                </svg>
                            </div>
                            <input type="email" id="email" name="email" required
                                   placeholder="customer@example.com"
                                   class="w-full pl-12 pr-4 py-3.5 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-100 transition-all duration-300 text-gray-900 placeholder-gray-400">
                        </div>
                    </div>

                    <!-- Category -->
                    <div class="group">
                        <label for="category" class="block text-sm font-semibold text-gray-700 mb-2">
                            Category <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                <svg class="w-5 h-5 text-gray-400 group-focus-within:text-blue-600 transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"></path>
                                </svg>
                            </div>
                            <select id="category" name="category" required onchange="updateCategoryDescription()"
                                    class="w-full pl-12 pr-10 py-3.5 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-100 transition-all duration-300 text-gray-900 appearance-none cursor-pointer bg-white">
                                <option value="">-- Select Category --</option>
                                <option value="PARKING_BOOKING_ISSUE">Parking Booking Issue</option>
                                <option value="EV_CHARGING_ISSUE">EV Charging Issue</option>
                                <option value="PAYMENT_ISSUE">Payment / Billing Issue</option>
                                <option value="FACILITY_FEEDBACK">Facility Feedback</option>
                                <option value="GENERAL_INQUIRY">General Inquiry</option>
                            </select>
                            <div class="absolute inset-y-0 right-0 pr-4 flex items-center pointer-events-none">
                                <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                                </svg>
                            </div>
                        </div>
                        <div id="categoryDescription" style="display: none;" class="mt-3 p-4 bg-gradient-to-r from-blue-50 to-purple-50 border-l-4 border-blue-500 rounded-lg">
                            <p class="text-sm text-gray-700"></p>
                        </div>
                    </div>

                    <!-- Subject -->
                    <div class="group">
                        <label for="subject" class="block text-sm font-semibold text-gray-700 mb-2">
                            Subject <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                <svg class="w-5 h-5 text-gray-400 group-focus-within:text-blue-600 transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z"></path>
                                </svg>
                            </div>
                            <input type="text" id="subject" name="subject" required
                                   placeholder="Brief description of your request"
                                   class="w-full pl-12 pr-4 py-3.5 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-100 transition-all duration-300 text-gray-900 placeholder-gray-400">
                        </div>
                    </div>

                    <!-- Concern/Details -->
                    <div class="group">
                        <label for="concern" class="block text-sm font-semibold text-gray-700 mb-2">
                            Concern/Details <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <div class="absolute top-4 left-4 pointer-events-none">
                                <svg class="w-5 h-5 text-gray-400 group-focus-within:text-blue-600 transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                </svg>
                            </div>
                            <textarea id="concern" name="concern" required rows="6"
                                      placeholder="Provide detailed information about your concern..."
                                      class="w-full pl-12 pr-4 py-3.5 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-100 transition-all duration-300 text-gray-900 placeholder-gray-400 resize-none"></textarea>
                        </div>
                        <p class="mt-2 text-xs text-gray-500 flex items-start">
                            <svg class="w-4 h-4 text-blue-500 mr-1 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path>
                            </svg>
                            <span>Please provide as much detail as possible to help us assist you better.</span>
                        </p>
                    </div>

                    <!-- Upload Document -->
                    <div class="group">
                        <label for="file" class="block text-sm font-semibold text-gray-700 mb-2">
                            Upload Document <span class="text-gray-400 text-xs font-normal">(Optional)</span>
                        </label>
                        <div class="relative">
                            <input type="file" id="file" name="file"
                                   accept="image/*,.pdf,.doc,.docx"
                                   class="block w-full text-sm text-gray-500 file:mr-4 file:py-3 file:px-6 file:rounded-xl file:border-0 file:text-sm file:font-semibold file:bg-gradient-to-r file:from-blue-600 file:to-purple-600 file:text-white hover:file:from-blue-700 hover:file:to-purple-700 file:cursor-pointer border-2 border-dashed border-gray-300 rounded-xl p-3 hover:border-blue-500 transition-all duration-300 cursor-pointer">
                        </div>
                        <p class="mt-2 text-xs text-gray-500 flex items-start">
                            <svg class="w-4 h-4 text-purple-500 mr-1 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path>
                            </svg>
                            <span>Accepted formats: Images, PDF, Word documents (Max 10MB)</span>
                        </p>
                    </div>

                    <!-- Button Group -->
                    <div class="flex flex-col sm:flex-row gap-4 pt-4">
                        <button type="submit" class="flex-1 py-4 px-6 bg-gradient-to-r from-blue-600 via-purple-600 to-pink-600 text-white font-semibold rounded-xl shadow-lg hover:shadow-2xl transform hover:scale-105 active:scale-95 transition-all duration-300 flex items-center justify-center space-x-2">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                            <span>Create Feedback</span>
                        </button>
                        <a href="${pageContext.request.contextPath}/home" class="flex-1 py-4 px-6 bg-gray-100 hover:bg-gray-200 text-gray-700 font-semibold rounded-xl transition-all duration-300 flex items-center justify-center space-x-2 border-2 border-gray-300">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                            </svg>
                            <span>Cancel</span>
                        </a>
                    </div>
                </form>
            </div>

            <!-- Help Section -->
            <div class="mt-6 bg-gradient-to-r from-blue-50 to-purple-50 rounded-2xl p-6 fade-in border border-blue-100">
                <div class="flex items-start space-x-3">
                    <div class="flex-shrink-0">
                        <div class="w-10 h-10 bg-gradient-to-br from-blue-500 to-purple-600 rounded-xl flex items-center justify-center">
                            <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                        </div>
                    </div>
                    <div>
                        <h3 class="text-sm font-semibold text-gray-900 mb-1">Need Help?</h3>
                        <p class="text-xs text-gray-600">If you're experiencing urgent issues, please contact our support team directly at <a href="tel:+94771234567" class="text-blue-600 hover:text-blue-700 font-medium">+94 77 123 4567</a> or email <a href="mailto:support@parking.com" class="text-blue-600 hover:text-blue-700 font-medium">support@parking.com</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    function validateContactNumber() {
        var contactNumber = document.getElementById('contactNumber').value;
        var pattern = /^[0-9]{10}$/;

        if (!pattern.test(contactNumber)) {
            alert('Contact Number must be exactly 10 digits (numbers only)');
            return false;
        }
        return true;
    }

    function updateCategoryDescription() {
        const category = document.getElementById('category').value;
        const descriptionDiv = document.getElementById('categoryDescription');

        const descriptions = {
            'PARKING_BOOKING_ISSUE': 'Report issues related to booking a parking slot, wrong slot assignment, or booking errors.',
            'EV_CHARGING_ISSUE': 'Report problems with EV charging facilities, such as broken chargers or unavailability.',
            'PAYMENT_ISSUE': 'Report billing or payment issues, including overcharging or failed payments.',
            'FACILITY_FEEDBACK': 'Provide feedback on parking facilities, cleanliness, signage, or overall experience.',
            'GENERAL_INQUIRY': 'Use this for general questions about parking services or policies.'
        };

        if (category && descriptions[category]) {
            descriptionDiv.querySelector('p').textContent = descriptions[category];
            descriptionDiv.style.display = 'block';
        } else {
            descriptionDiv.style.display = 'none';
            descriptionDiv.querySelector('p').textContent = '';
        }
    }
    </script>

</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>