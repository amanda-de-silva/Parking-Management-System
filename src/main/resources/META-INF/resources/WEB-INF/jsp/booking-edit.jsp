<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Booking</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .animate-slide-in {
            animation: slideIn 0.3s ease-out;
        }
        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 via-blue-50 to-purple-50 min-h-screen">

    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <!-- Main Content Container -->
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-10">

        <!-- Page Header with Gradient -->
        <div class="mb-8">
            <div class="relative overflow-hidden rounded-2xl gradient-bg p-8 shadow-2xl">
                <div class="absolute top-0 right-0 -mt-4 -mr-4 w-32 h-32 bg-white opacity-10 rounded-full"></div>
                <div class="absolute bottom-0 left-0 -mb-8 -ml-8 w-40 h-40 bg-white opacity-10 rounded-full"></div>
                <div class="relative z-10 flex items-center">
                    <div class="w-16 h-16 bg-white bg-opacity-20 rounded-2xl flex items-center justify-center backdrop-blur-sm mr-4">
                        <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                        </svg>
                    </div>
                    <div>
                        <h1 class="text-5xl font-extrabold text-white mb-2 tracking-tight">Edit Booking</h1>
                        <p class="text-purple-100 text-lg font-medium">Update your booking details</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Error Message -->
        <c:if test="${not empty error}">
            <div class="mb-6 animate-slide-in">
                <div class="bg-gradient-to-r from-red-50 to-pink-50 border-l-4 border-red-500 rounded-xl p-5 shadow-lg">
                    <div class="flex items-start">
                        <div class="flex-shrink-0">
                            <svg class="w-6 h-6 text-red-500" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                            </svg>
                        </div>
                        <div class="ml-4">
                            <p class="text-red-800 font-semibold text-base">${error}</p>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- Back to List Button -->
        <div class="mb-6">
            <a href="${pageContext.request.contextPath}/booking/list"
               class="inline-flex items-center px-5 py-3 rounded-xl bg-white text-gray-700 font-semibold hover:bg-gray-50 shadow-md hover:shadow-lg transform hover:-translate-y-0.5 transition-all duration-200 border border-gray-200">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                </svg>
                Back to List
            </a>
        </div>

        <hr class="border-0 mb-8">

        <!-- Edit Form -->
        <div class="bg-white rounded-3xl shadow-2xl border border-gray-100 overflow-hidden animate-slide-in">
            <form action="${pageContext.request.contextPath}/booking/edit/${booking.id}" method="post">
                <div class="p-8 space-y-6">
                    <table class="w-full">
                        <!-- Booking ID -->
                        <tr>
                            <td class="pb-6">
                                <div class="bg-gradient-to-r from-blue-50 to-purple-50 rounded-xl p-6 border border-blue-100">
                                    <div class="flex items-center justify-between">
                                        <div class="flex items-center space-x-4">
                                            <div class="w-12 h-12 bg-gradient-to-br from-blue-500 to-purple-600 rounded-xl flex items-center justify-center shadow-lg">
                                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 20l4-16m2 16l4-16M6 9h14M4 15h14"/>
                                                </svg>
                                            </div>
                                            <div>
                                                <label class="block text-sm font-semibold text-gray-600 mb-1">Booking ID:</label>
                                                <span class="text-2xl font-bold text-gray-900">#${booking.id}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <!-- Current Status -->
                        <tr>
                            <td class="pb-6">
                                <div class="bg-gradient-to-r from-green-50 to-emerald-50 rounded-xl p-6 border border-green-100">
                                    <div class="flex items-center space-x-4">
                                        <div class="w-12 h-12 bg-gradient-to-br from-green-500 to-emerald-600 rounded-xl flex items-center justify-center shadow-lg">
                                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                            </svg>
                                        </div>
                                        <div>
                                            <label class="block text-sm font-semibold text-gray-600 mb-1">Current Status:</label>
                                            <span class="inline-flex items-center px-4 py-2 rounded-full bg-white text-green-700 text-lg font-bold shadow-sm border border-green-200">
                                                ${booking.bookingStatus}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <!-- Select Vehicle -->
                        <tr>
                            <td class="pb-6">
                                <div class="bg-white rounded-xl p-6 border-2 border-gray-200 hover:border-purple-300 transition-all duration-200">
                                    <label for="vehicleId" class="flex items-center text-sm font-bold text-gray-700 mb-3">
                                        <svg class="w-5 h-5 mr-2 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7v8a2 2 0 002 2h6M8 7V5a2 2 0 012-2h4.586a1 1 0 01.707.293l4.414 4.414a1 1 0 01.293.707V15a2 2 0 01-2 2h-2M8 7H6a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2v-2"/>
                                        </svg>
                                        Select Vehicle:
                                    </label>
                                    <select id="vehicleId" name="vehicleId" required
                                            class="w-full px-5 py-4 text-base font-medium text-gray-900 bg-gray-50 border-2 border-gray-300 rounded-xl focus:ring-4 focus:ring-purple-200 focus:border-purple-500 transition-all duration-200 cursor-pointer hover:bg-gray-100">
                                        <c:forEach var="vehicle" items="${vehicles}">
                                            <option value="${vehicle.id}" ${booking.vehicleId == vehicle.id ? 'selected' : ''}>
                                                ${vehicle.vehicleNumber} - ${vehicle.vehicleBrand} ${vehicle.vehicleModel}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                        </tr>

                        <!-- Booking Start Time -->
                        <tr>
                            <td class="pb-6">
                                <div class="bg-white rounded-xl p-6 border-2 border-gray-200 hover:border-blue-300 transition-all duration-200">
                                    <label for="bookingStartTime" class="flex items-center text-sm font-bold text-gray-700 mb-3">
                                        <svg class="w-5 h-5 mr-2 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                        </svg>
                                        Booking Start Time:
                                    </label>
                                    <input type="datetime-local" id="bookingStartTime" name="bookingStartTime" value="${booking.bookingStartTime}" required
                                           class="w-full px-5 py-4 text-base font-medium text-gray-900 bg-gray-50 border-2 border-gray-300 rounded-xl focus:ring-4 focus:ring-blue-200 focus:border-blue-500 transition-all duration-200">
                                </div>
                            </td>
                        </tr>

                        <!-- Booking End Time -->
                        <tr>
                            <td class="pb-6">
                                <div class="bg-white rounded-xl p-6 border-2 border-gray-200 hover:border-purple-300 transition-all duration-200">
                                    <label for="bookingEndTime" class="flex items-center text-sm font-bold text-gray-700 mb-3">
                                        <svg class="w-5 h-5 mr-2 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                        </svg>
                                        Booking End Time:
                                    </label>
                                    <input type="datetime-local" id="bookingEndTime" name="bookingEndTime" value="${booking.bookingEndTime}" required
                                           class="w-full px-5 py-4 text-base font-medium text-gray-900 bg-gray-50 border-2 border-gray-300 rounded-xl focus:ring-4 focus:ring-purple-200 focus:border-purple-500 transition-all duration-200">
                                </div>
                            </td>
                        </tr>

                        <!-- Current Total Amount -->
                        <tr>
                            <td class="pb-6">
                                <div class="bg-gradient-to-r from-amber-50 to-yellow-50 rounded-xl p-6 border border-amber-200">
                                    <div class="flex items-center justify-between">
                                        <div class="flex items-center space-x-4">
                                            <div class="w-12 h-12 bg-gradient-to-br from-amber-500 to-yellow-600 rounded-xl flex items-center justify-center shadow-lg">
                                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                                </svg>
                                            </div>
                                            <div>
                                                <label class="block text-sm font-semibold text-gray-600 mb-1">Current Total Amount:</label>
                                                <span class="text-3xl font-extrabold text-transparent bg-clip-text bg-gradient-to-r from-amber-600 to-yellow-600">
                                                    Rs. ${booking.totalAmount}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <!-- Action Buttons -->
                        <tr>
                            <td colspan="2" class="pt-4">
                                <div class="flex flex-col sm:flex-row gap-4">
                                    <button type="submit"
                                            class="flex-1 inline-flex items-center justify-center px-8 py-4 rounded-xl bg-gradient-to-r from-blue-600 to-purple-600 text-white text-lg font-bold hover:from-blue-700 hover:to-purple-700 shadow-xl hover:shadow-2xl transform hover:-translate-y-1 transition-all duration-200">
                                        <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12"/>
                                        </svg>
                                        Update Booking
                                    </button>
                                    <a href="${pageContext.request.contextPath}/booking/list"
                                       class="flex-1 inline-flex items-center justify-center">
                                        <button type="button"
                                                class="w-full px-8 py-4 rounded-xl bg-gradient-to-r from-gray-100 to-gray-200 text-gray-700 text-lg font-bold hover:from-gray-200 hover:to-gray-300 shadow-lg hover:shadow-xl transform hover:-translate-y-1 transition-all duration-200 border-2 border-gray-300">
                                            <svg class="w-6 h-6 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                                            </svg>
                                            Cancel
                                        </button>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>

        <!-- Helper Text -->
        <div class="mt-6 text-center">
            <p class="text-sm text-gray-500 font-medium">
                <svg class="w-4 h-4 inline mr-1" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                </svg>
                All changes will be saved after clicking "Update Booking"
            </p>
        </div>
    </div>

</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>