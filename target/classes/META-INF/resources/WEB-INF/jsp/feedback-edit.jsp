<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Feedback</title>
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
</head>
<body class="bg-gradient-to-br from-blue-50 via-purple-50 to-pink-50 min-h-screen">
    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <div class="py-8 px-4 sm:px-6 lg:px-8">
        <div class="max-w-2xl mx-auto">
            <!-- Header Section -->
            <div class="bg-white rounded-3xl shadow-2xl overflow-hidden mb-6 fade-in">
                <div class="relative bg-gradient-to-r from-blue-600 via-purple-600 to-pink-600 animate-gradient p-8 text-white">
                    <div class="absolute top-0 right-0 -mt-4 -mr-4 w-32 h-32 bg-white/10 rounded-full blur-3xl"></div>
                    <div class="absolute bottom-0 left-0 -mb-4 -ml-4 w-40 h-40 bg-white/10 rounded-full blur-3xl"></div>
                    <div class="relative z-10 text-center">
                        <div class="flex items-center justify-center space-x-3 mb-3">
                            <div class="w-14 h-14 bg-white/20 backdrop-blur-sm rounded-2xl flex items-center justify-center">
                                <span class="text-3xl">✏️</span>
                            </div>
                            <h1 class="text-3xl sm:text-4xl font-bold">Edit Feedback #${feedback.id}</h1>
                        </div>
                        <p class="text-blue-100 text-sm sm:text-base">Update feedback details and track resolution</p>
                    </div>
                </div>
            </div>

            <!-- Form Card -->
            <div class="bg-white rounded-3xl shadow-2xl overflow-hidden fade-in">
                <div class="p-6 sm:p-8">
                    <!-- Status Info -->
                    <div class="bg-blue-50 border-l-4 border-blue-500 rounded-xl p-4 mb-8">
                        <h3 class="text-blue-900 font-semibold mb-2">Current Status</h3>
                        <c:choose>
                            <c:when test="${feedback.status == 'PENDING'}">
                                <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-yellow-100 text-yellow-800">
                                    <span class="w-2 h-2 bg-yellow-500 rounded-full mr-2"></span>Pending
                                </span>
                            </c:when>
                            <c:when test="${feedback.status == 'IN_PROGRESS'}">
                                <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-blue-100 text-blue-800">
                                    <span class="w-2 h-2 bg-blue-500 rounded-full mr-2"></span>In Progress
                                </span>
                            </c:when>
                            <c:when test="${feedback.status == 'SOLVED'}">
                                <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-800">
                                    <span class="w-2 h-2 bg-green-500 rounded-full mr-2"></span>Solved
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-gray-100 text-gray-800">
                                    <span class="w-2 h-2 bg-gray-500 rounded-full mr-2"></span>Closed
                                </span>
                            </c:otherwise>
                        </c:choose>
                        <p class="text-blue-700 text-sm mt-2">Update the feedback details below to keep track of customer issues and resolutions.</p>
                    </div>

                    <form action="${pageContext.request.contextPath}/feedbacks/${feedback.id}" method="post" enctype="multipart/form-data" class="space-y-6">

                        <!-- Customer Info Section -->
                        <div class="pb-6 border-b border-gray-200">
                            <h3 class="text-lg font-semibold text-gray-900 mb-4 flex items-center">
                                <svg class="w-5 h-5 mr-2 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>
                                Customer Information
                            </h3>

                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label for="customerName" class="block text-sm font-semibold text-gray-700 mb-2">
                                        Customer Name <span class="text-red-500">*</span>
                                    </label>
                                    <input type="text" id="customerName" name="customerName" value="${feedback.customerName}" required
                                        class="w-full px-4 py-2 border-2 border-gray-200 rounded-lg focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all">
                                </div>

                                <div>
                                    <label for="contactNumber" class="block text-sm font-semibold text-gray-700 mb-2">
                                        Contact Number <span class="text-red-500">*</span>
                                    </label>
                                    <input type="tel" id="contactNumber" name="contactNumber" value="${feedback.contactNumber}" required
                                        class="w-full px-4 py-2 border-2 border-gray-200 rounded-lg focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all">
                                </div>

                                <div class="md:col-span-2">
                                    <label for="email" class="block text-sm font-semibold text-gray-700 mb-2">
                                        Email Address <span class="text-red-500">*</span>
                                    </label>
                                    <input type="email" id="email" name="email" value="${feedback.email}" required
                                        class="w-full px-4 py-2 border-2 border-gray-200 rounded-lg focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all">
                                </div>
                            </div>
                        </div>

                        <!-- Feedback Details Section -->
                        <div class="pb-6 border-b border-gray-200">
                            <h3 class="text-lg font-semibold text-gray-900 mb-4 flex items-center">
                                <svg class="w-5 h-5 mr-2 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                </svg>
                                Feedback Details
                            </h3>

                            <div>
                                <label for="subject" class="block text-sm font-semibold text-gray-700 mb-2">
                                    Subject <span class="text-red-500">*</span>
                                </label>
                                <input type="text" id="subject" name="subject" value="${feedback.subject}" required
                                    class="w-full px-4 py-2 border-2 border-gray-200 rounded-lg focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all">
                            </div>

                            <div class="mt-4">
                                <label for="concern" class="block text-sm font-semibold text-gray-700 mb-2">
                                    Concern/Details <span class="text-red-500">*</span>
                                </label>
                                <textarea id="concern" name="concern" required
                                    class="w-full px-4 py-2 border-2 border-gray-200 rounded-lg focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all min-h-32 resize-vertical">${feedback.concern}</textarea>
                            </div>
                        </div>

                        <!-- Classification Section -->
                        <div class="pb-6 border-b border-gray-200">
                            <h3 class="text-lg font-semibold text-gray-900 mb-4 flex items-center">
                                <svg class="w-5 h-5 mr-2 text-pink-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 01.586 1.414v5c0 .512-.195 1.024-.586 1.414l-7 7a2 2 0 01-1.414.586h-5c-.512 0-1.024-.195-1.414-.586l-7-7A2 2 0 013 12.828V7.828c0-.512.195-1.024.586-1.414l7-7A2 2 0 017 3z"></path>
                                </svg>
                                Classification & Status
                            </h3>

                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label for="category" class="block text-sm font-semibold text-gray-700 mb-2">
                                        Category <span class="text-red-500">*</span>
                                    </label>
                                    <select id="category" name="category" required
                                        class="w-full px-4 py-2 border-2 border-gray-200 rounded-lg focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all">
                                        <option value="PARKING_BOOKING_ISSUE" ${feedback.category == 'PARKING_BOOKING_ISSUE' ? 'selected' : ''}>
                                            Parking Booking Issue
                                        </option>
                                        <option value="EV_CHARGING_ISSUE" ${feedback.category == 'EV_CHARGING_ISSUE' ? 'selected' : ''}>
                                            EV Charging Issue
                                        </option>
                                        <option value="PAYMENT_ISSUE" ${feedback.category == 'PAYMENT_ISSUE' ? 'selected' : ''}>
                                            Payment Issue
                                        </option>
                                        <option value="FACILITY_FEEDBACK" ${feedback.category == 'FACILITY_FEEDBACK' ? 'selected' : ''}>
                                            Facility Feedback
                                        </option>
                                        <option value="GENERAL_INQUIRY" ${feedback.category == 'GENERAL_INQUIRY' ? 'selected' : ''}>
                                            General Inquiry
                                        </option>
                                    </select>
                                </div>

                                <div>
                                    <label for="status" class="block text-sm font-semibold text-gray-700 mb-2">
                                        Status <span class="text-red-500">*</span>
                                    </label>
                                    <select id="status" name="status" required
                                        class="w-full px-4 py-2 border-2 border-gray-200 rounded-lg focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all">
                                        <option value="PENDING" ${feedback.status == 'PENDING' ? 'selected' : ''}>Pending</option>
                                        <option value="IN_PROGRESS" ${feedback.status == 'IN_PROGRESS' ? 'selected' : ''}>In Progress</option>
                                        <option value="SOLVED" ${feedback.status == 'SOLVED' ? 'selected' : ''}>Solved</option>
                                        <option value="CLOSED" ${feedback.status == 'CLOSED' ? 'selected' : ''}>Closed</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Document Section -->
                        <div class="pb-6">
                            <h3 class="text-lg font-semibold text-gray-900 mb-4 flex items-center">
                                <svg class="w-5 h-5 mr-2 text-orange-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                </svg>
                                Document
                            </h3>

                            <c:if test="${not empty feedback.documentPath}">
                                <div class="bg-green-50 border-l-4 border-green-500 rounded-lg p-4 mb-4">
                                    <p class="text-sm text-gray-600 mb-1">
                                        <span class="font-semibold">Current file:</span>
                                    </p>
                                    <p class="text-green-800 font-medium break-all">📎 ${feedback.documentPath}</p>
                                </div>
                            </c:if>

                            <label for="file" class="block text-sm font-semibold text-gray-700 mb-2">
                                Update Document (Optional)
                            </label>
                            <input type="file" id="file" name="file" accept="image/*,.pdf,.doc,.docx"
                                class="w-full px-4 py-3 border-2 border-dashed border-gray-300 rounded-lg focus:outline-none focus:border-blue-500 hover:border-blue-400 transition-all cursor-pointer bg-gray-50">
                            <p class="text-xs text-gray-500 mt-2">Supported formats: Images (JPG, PNG, GIF), PDF, DOC, DOCX. Upload a new file to replace the existing one.</p>
                        </div>

                        <!-- Action Buttons -->
                        <div class="flex gap-4 pt-6 border-t border-gray-200">
                            <button type="submit" class="flex-1 px-6 py-3 bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 text-white font-semibold rounded-lg transition-all duration-200 transform hover:scale-105 shadow-lg">
                                <span class="flex items-center justify-center space-x-2">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                                    </svg>
                                    <span>Update Feedback</span>
                                </span>
                            </button>
                            <a href="${pageContext.request.contextPath}/feedbacks" class="flex-1 px-6 py-3 bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold rounded-lg transition-all duration-200 text-center">
                                <span class="flex items-center justify-center space-x-2">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                                    </svg>
                                    <span>Cancel</span>
                                </span>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>