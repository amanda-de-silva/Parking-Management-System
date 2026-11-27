<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Bookings</title>
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
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10">

        <!-- Page Header with Gradient -->
        <div class="mb-10">
            <div class="relative overflow-hidden rounded-2xl gradient-bg p-8 shadow-2xl">
                <div class="absolute top-0 right-0 -mt-4 -mr-4 w-32 h-32 bg-white opacity-10 rounded-full"></div>
                <div class="absolute bottom-0 left-0 -mb-8 -ml-8 w-40 h-40 bg-white opacity-10 rounded-full"></div>
                <div class="relative z-10">
                    <h1 class="text-5xl font-extrabold text-white mb-3 tracking-tight">My Bookings</h1>
                    <p class="text-purple-100 text-lg font-medium">Manage and track all your bookings in one place</p>
                </div>
            </div>
        </div>

        <!-- Success Message -->
        <c:if test="${not empty message}">
            <div class="mb-6 animate-slide-in">
                <div class="bg-gradient-to-r from-green-50 to-emerald-50 border-l-4 border-green-500 rounded-xl p-5 shadow-lg">
                    <div class="flex items-start">
                        <div class="flex-shrink-0">
                            <svg class="w-6 h-6 text-green-500" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                            </svg>
                        </div>
                        <div class="ml-4">
                            <p class="text-green-800 font-semibold text-base">${message}</p>
                        </div>
                        <button class="ml-auto text-green-600 hover:text-green-800">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"/>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </c:if>

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
                        <button class="ml-auto text-red-600 hover:text-red-800">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"/>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </c:if>

        <hr class="border-0 mb-8">

        <c:choose>
            <c:when test="${empty bookings}">
                <!-- Ultra Modern Empty State -->
                <div class="animate-slide-in">
                    <div class="relative bg-white rounded-3xl shadow-xl border border-gray-100 p-16 text-center overflow-hidden">
                        <div class="absolute inset-0 bg-gradient-to-br from-purple-50 via-blue-50 to-transparent opacity-50"></div>
                        <div class="relative z-10">
                            <div class="inline-flex items-center justify-center w-32 h-32 bg-gradient-to-br from-purple-100 to-blue-100 rounded-full mb-6 shadow-lg">
                                <svg class="w-16 h-16 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                                </svg>
                            </div>
                            <h3 class="text-3xl font-bold text-gray-900 mb-3">No bookings found</h3>
                            <p class="text-gray-600 text-lg mb-8 max-w-md mx-auto">Create your first booking!</p>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Desktop Table View -->
                <div class="hidden lg:block animate-slide-in">
                    <div class="bg-white rounded-3xl shadow-2xl border border-gray-100 overflow-hidden">
                        <div class="overflow-x-auto">
                            <table class="min-w-full">
                                <thead>
                                    <tr class="bg-gradient-to-r from-gray-50 to-gray-100 border-b-2 border-gray-200">
                                        <th class="px-8 py-5 text-left text-xs font-bold text-gray-700 uppercase tracking-wider">
                                            <div class="flex items-center space-x-1">
                                                <span>ID</span>
                                            </div>
                                        </th>
                                        <th class="px-8 py-5 text-left text-xs font-bold text-gray-700 uppercase tracking-wider">
                                            <div class="flex items-center space-x-1">
                                                <span>Booking Start</span>
                                            </div>
                                        </th>
                                        <th class="px-8 py-5 text-left text-xs font-bold text-gray-700 uppercase tracking-wider">
                                            <div class="flex items-center space-x-1">
                                                <span>Booking End</span>
                                            </div>
                                        </th>
                                        <th class="px-8 py-5 text-left text-xs font-bold text-gray-700 uppercase tracking-wider">
                                            <div class="flex items-center space-x-1">
                                                <span>Status</span>
                                            </div>
                                        </th>
                                        <th class="px-8 py-5 text-left text-xs font-bold text-gray-700 uppercase tracking-wider">
                                            <div class="flex items-center space-x-1">
                                                <span>Total Amount</span>
                                            </div>
                                        </th>
                                        <th class="px-8 py-5 text-left text-xs font-bold text-gray-700 uppercase tracking-wider">
                                            <div class="flex items-center space-x-1">
                                                <span>Created At</span>
                                            </div>
                                        </th>
                                        <th class="px-8 py-5 text-left text-xs font-bold text-gray-700 uppercase tracking-wider">
                                            <div class="flex items-center space-x-1">
                                                <span>Actions</span>
                                            </div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-gray-100">
                                    <c:forEach var="booking" items="${bookings}">
                                        <tr class="hover:bg-gradient-to-r hover:from-purple-50 hover:to-blue-50 transition-all duration-200">
                                            <td class="px-8 py-6 whitespace-nowrap">
                                                <span class="inline-flex items-center justify-center w-10 h-10 rounded-xl bg-gradient-to-br from-purple-100 to-blue-100 text-purple-700 font-bold text-sm">
                                                    ${booking.id}
                                                </span>
                                            </td>
                                            <td class="px-8 py-6 whitespace-nowrap">
                                                <div class="flex items-center">
                                                    <svg class="w-5 h-5 text-gray-400 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                                    </svg>
                                                    <span class="text-sm font-medium text-gray-900">${booking.bookingStartTime}</span>
                                                </div>
                                            </td>
                                            <td class="px-8 py-6 whitespace-nowrap">
                                                <div class="flex items-center">
                                                    <svg class="w-5 h-5 text-gray-400 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                                    </svg>
                                                    <span class="text-sm font-medium text-gray-900">${booking.bookingEndTime}</span>
                                                </div>
                                            </td>
                                            <td class="px-8 py-6 whitespace-nowrap">
                                                <c:choose>
                                                    <c:when test="${booking.bookingStatus == 'PENDING'}">
                                                        <span class="px-4 py-2 inline-flex text-xs leading-5 font-bold rounded-full bg-gradient-to-r from-yellow-100 to-amber-100 text-yellow-800 shadow-sm border border-yellow-200">
                                                            <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z" clip-rule="evenodd"/>
                                                            </svg>
                                                            ${booking.bookingStatus}
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${booking.bookingStatus == 'CONFIRMED'}">
                                                        <span class="px-4 py-2 inline-flex text-xs leading-5 font-bold rounded-full bg-gradient-to-r from-green-100 to-emerald-100 text-green-800 shadow-sm border border-green-200">
                                                            <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                                                            </svg>
                                                            ${booking.bookingStatus}
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="px-4 py-2 inline-flex text-xs leading-5 font-bold rounded-full bg-gradient-to-r from-gray-100 to-slate-100 text-gray-800 shadow-sm border border-gray-200">
                                                            ${booking.bookingStatus}
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="px-8 py-6 whitespace-nowrap">
                                                <div class="flex items-center">
                                                    <span class="text-lg font-bold text-transparent bg-clip-text bg-gradient-to-r from-purple-600 to-blue-600">
                                                        Rs. ${booking.totalAmount}
                                                    </span>
                                                </div>
                                            </td>
                                            <td class="px-8 py-6 whitespace-nowrap">
                                                <span class="text-sm text-gray-600 font-medium">${booking.createdAt}</span>
                                            </td>
                                            <td class="px-8 py-6 whitespace-nowrap">
                                                <div class="flex items-center space-x-2">
                                                    <a href="${pageContext.request.contextPath}/booking/view/${booking.id}"
                                                       class="inline-flex items-center px-4 py-2 rounded-lg bg-gradient-to-r from-blue-500 to-blue-600 text-white text-xs font-bold hover:from-blue-600 hover:to-blue-700 shadow-md hover:shadow-lg transform hover:-translate-y-0.5 transition-all duration-200">
                                                        <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                                                        </svg>
                                                        View
                                                    </a>
                                                    <c:if test="${booking.bookingStatus == 'PENDING' || booking.bookingStatus == 'CONFIRMED'}">
                                                        <a href="${pageContext.request.contextPath}/booking/edit/${booking.id}"
                                                           class="inline-flex items-center px-4 py-2 rounded-lg bg-gradient-to-r from-indigo-500 to-purple-600 text-white text-xs font-bold hover:from-indigo-600 hover:to-purple-700 shadow-md hover:shadow-lg transform hover:-translate-y-0.5 transition-all duration-200">
                                                            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                                                            </svg>
                                                            Edit
                                                        </a>
                                                        <a href="${pageContext.request.contextPath}/booking/cancel/${booking.id}"
                                                           onclick="return confirm('Are you sure you want to end this booking?')"
                                                           class="inline-flex items-center px-4 py-2 rounded-lg bg-gradient-to-r from-red-500 to-pink-600 text-white text-xs font-bold hover:from-red-600 hover:to-pink-700 shadow-md hover:shadow-lg transform hover:-translate-y-0.5 transition-all duration-200">
                                                            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                                                            </svg>
                                                            END
                                                        </a>
                                                    </c:if>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Mobile & Tablet Card View -->
                <div class="lg:hidden space-y-6">
                    <c:forEach var="booking" items="${bookings}">
                        <div class="bg-white rounded-2xl shadow-xl border border-gray-100 overflow-hidden transform hover:scale-102 transition-all duration-300 animate-slide-in">
                            <!-- Card Header -->
                            <div class="bg-gradient-to-r from-purple-500 to-blue-600 px-6 py-4">
                                <div class="flex items-center justify-between">
                                    <div class="flex items-center space-x-3">
                                        <div class="w-12 h-12 rounded-xl bg-white bg-opacity-20 flex items-center justify-center backdrop-blur-sm">
                                            <span class="text-white font-bold text-lg">#${booking.id}</span>
                                        </div>
                                        <div>
                                            <p class="text-white text-xs font-medium opacity-90">Booking ID</p>
                                            <p class="text-white text-lg font-bold">${booking.id}</p>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${booking.bookingStatus == 'PENDING'}">
                                            <span class="px-3 py-1 text-xs font-bold rounded-full bg-yellow-400 text-yellow-900 shadow-lg">
                                                ${booking.bookingStatus}
                                            </span>
                                        </c:when>
                                        <c:when test="${booking.bookingStatus == 'CONFIRMED'}">
                                            <span class="px-3 py-1 text-xs font-bold rounded-full bg-green-400 text-green-900 shadow-lg">
                                                ${booking.bookingStatus}
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="px-3 py-1 text-xs font-bold rounded-full bg-gray-300 text-gray-800 shadow-lg">
                                                ${booking.bookingStatus}
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <!-- Card Body -->
                            <div class="p-6 space-y-4">
                                <div class="grid grid-cols-1 gap-4">
                                    <div class="flex items-center justify-between p-3 bg-gradient-to-r from-blue-50 to-purple-50 rounded-xl">
                                        <div class="flex items-center space-x-3">
                                            <div class="w-10 h-10 rounded-lg bg-blue-100 flex items-center justify-center">
                                                <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                                </svg>
                                            </div>
                                            <div>
                                                <p class="text-xs text-gray-600 font-semibold">Booking Start</p>
                                                <p class="text-sm text-gray-900 font-bold">${booking.bookingStartTime}</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="flex items-center justify-between p-3 bg-gradient-to-r from-purple-50 to-pink-50 rounded-xl">
                                        <div class="flex items-center space-x-3">
                                            <div class="w-10 h-10 rounded-lg bg-purple-100 flex items-center justify-center">
                                                <svg class="w-5 h-5 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                                </svg>
                                            </div>
                                            <div>
                                                <p class="text-xs text-gray-600 font-semibold">Booking End</p>
                                                <p class="text-sm text-gray-900 font-bold">${booking.bookingEndTime}</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="p-4 bg-gradient-to-br from-green-50 to-emerald-50 rounded-xl border-2 border-green-200">
                                        <div class="flex items-center justify-between">
                                            <span class="text-sm text-gray-700 font-semibold">Total Amount</span>
                                            <span class="text-2xl font-extrabold text-transparent bg-clip-text bg-gradient-to-r from-green-600 to-emerald-600">
                                                Rs. ${booking.totalAmount}
                                            </span>
                                        </div>
                                    </div>

                                    <div class="flex items-center justify-between text-sm pt-2 border-t border-gray-200">
                                        <span class="text-gray-600 font-medium">Created At</span>
                                        <span class="text-gray-900 font-bold">${booking.createdAt}</span>
                                    </div>
                                </div>
                            </div>

                            <!-- Card Footer -->
                            <div class="px-6 pb-6">
                                <div class="flex flex-wrap gap-2">
                                    <a href="${pageContext.request.contextPath}/booking/view/${booking.id}"
                                       class="flex-1 min-w-max inline-flex items-center justify-center px-4 py-3 rounded-xl bg-gradient-to-r from-blue-500 to-blue-600 text-white text-sm font-bold hover:from-blue-600 hover:to-blue-700 shadow-lg hover:shadow-xl transform hover:-translate-y-0.5 transition-all duration-200">
                                        <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                                        </svg>
                                        View
                                    </a>
                                    <c:if test="${booking.bookingStatus == 'PENDING' || booking.bookingStatus == 'CONFIRMED'}">
                                        <a href="${pageContext.request.contextPath}/booking/edit/${booking.id}"
                                           class="flex-1 min-w-max inline-flex items-center justify-center px-4 py-3 rounded-xl bg-gradient-to-r from-indigo-500 to-purple-600 text-white text-sm font-bold hover:from-indigo-600 hover:to-purple-700 shadow-lg hover:shadow-xl transform hover:-translate-y-0.5 transition-all duration-200">
                                            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                                            </svg>
                                            Edit
                                        </a>
                                        <a href="${pageContext.request.contextPath}/booking/cancel/${booking.id}"
                                           onclick="return confirm('Are you sure you want to end this booking?')"
                                           class="flex-1 min-w-max inline-flex items-center justify-center px-4 py-3 rounded-xl bg-gradient-to-r from-red-500 to-pink-600 text-white text-sm font-bold hover:from-red-600 hover:to-pink-700 shadow-lg hover:shadow-xl transform hover:-translate-y-0.5 transition-all duration-200">
                                            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                                            </svg>
                                            END
                                        </a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>