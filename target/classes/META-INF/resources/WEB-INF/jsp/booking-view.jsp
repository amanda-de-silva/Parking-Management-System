<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Booking</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-slate-50 via-blue-50 to-indigo-50 min-h-screen">
    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <div class="container mx-auto px-4 py-8 max-w-6xl">
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-4xl font-bold text-gray-800 mb-2">Booking Details</h1>
            <div class="h-1 w-24 bg-gradient-to-r from-blue-500 to-indigo-600 rounded-full"></div>
        </div>

        <!-- Action Buttons -->
        <div class="mb-6 flex flex-wrap gap-3">
            <a href="${pageContext.request.contextPath}/booking/list"
               class="inline-flex items-center px-6 py-3 bg-white text-gray-700 font-medium rounded-lg shadow-md hover:shadow-lg hover:bg-gray-50 transition-all duration-300 border border-gray-200">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                </svg>
                Back to List
            </a>
            <c:if test="${booking.bookingStatus == 'PENDING' || booking.bookingStatus == 'CONFIRMED'}">
                <a href="${pageContext.request.contextPath}/booking/edit/${booking.id}"
                   class="inline-flex items-center px-6 py-3 bg-gradient-to-r from-blue-500 to-indigo-600 text-white font-medium rounded-lg shadow-md hover:shadow-lg hover:from-blue-600 hover:to-indigo-700 transition-all duration-300">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                    </svg>
                    Edit
                </a>
            </c:if>
        </div>

        <!-- Booking Information Card -->
        <div class="bg-white rounded-2xl shadow-xl overflow-hidden mb-8 border border-gray-100">
            <div class="bg-gradient-to-r from-blue-500 to-indigo-600 px-6 py-4">
                <h2 class="text-2xl font-bold text-white flex items-center">
                    <svg class="w-7 h-7 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                    Booking Information
                </h2>
            </div>
            <div class="p-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="flex items-start space-x-4 p-4 bg-gradient-to-br from-blue-50 to-indigo-50 rounded-lg border border-blue-100">
                        <div class="flex-shrink-0 w-12 h-12 bg-blue-500 rounded-lg flex items-center justify-center">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 20l4-16m2 16l4-16M6 9h14M4 15h14"/>
                            </svg>
                        </div>
                        <div>
                            <p class="text-sm text-gray-500 font-medium">Booking ID</p>
                            <p class="text-lg font-bold text-gray-800">${booking.id}</p>
                        </div>
                    </div>

                    <div class="flex items-start space-x-4 p-4 bg-gradient-to-br from-green-50 to-emerald-50 rounded-lg border border-green-100">
                        <div class="flex-shrink-0 w-12 h-12 bg-green-500 rounded-lg flex items-center justify-center">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                        <div>
                            <p class="text-sm text-gray-500 font-medium">Status</p>
                            <p class="text-lg font-bold text-gray-800">${booking.bookingStatus}</p>
                        </div>
                    </div>

                    <div class="flex items-start space-x-4 p-4 bg-gradient-to-br from-purple-50 to-pink-50 rounded-lg border border-purple-100">
                        <div class="flex-shrink-0 w-12 h-12 bg-purple-500 rounded-lg flex items-center justify-center">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                        <div>
                            <p class="text-sm text-gray-500 font-medium">Booking Start Time</p>
                            <p class="text-lg font-bold text-gray-800">${booking.bookingStartTime}</p>
                        </div>
                    </div>

                    <div class="flex items-start space-x-4 p-4 bg-gradient-to-br from-orange-50 to-amber-50 rounded-lg border border-orange-100">
                        <div class="flex-shrink-0 w-12 h-12 bg-orange-500 rounded-lg flex items-center justify-center">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                        <div>
                            <p class="text-sm text-gray-500 font-medium">Booking End Time</p>
                            <p class="text-lg font-bold text-gray-800">${booking.bookingEndTime}</p>
                        </div>
                    </div>

                    <div class="flex items-start space-x-4 p-4 bg-gradient-to-br from-emerald-50 to-teal-50 rounded-lg border border-emerald-100">
                        <div class="flex-shrink-0 w-12 h-12 bg-emerald-500 rounded-lg flex items-center justify-center">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                        <div>
                            <p class="text-sm text-gray-500 font-medium">Total Amount</p>
                            <p class="text-lg font-bold text-gray-800">Rs. ${booking.totalAmount}</p>
                        </div>
                    </div>

                    <div class="flex items-start space-x-4 p-4 bg-gradient-to-br from-cyan-50 to-blue-50 rounded-lg border border-cyan-100">
                        <div class="flex-shrink-0 w-12 h-12 bg-cyan-500 rounded-lg flex items-center justify-center">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                            </svg>
                        </div>
                        <div>
                            <p class="text-sm text-gray-500 font-medium">Created At</p>
                            <p class="text-lg font-bold text-gray-800">${booking.createdAt}</p>
                        </div>
                    </div>

                    <c:if test="${not empty booking.updatedAt}">
                        <div class="flex items-start space-x-4 p-4 bg-gradient-to-br from-slate-50 to-gray-50 rounded-lg border border-slate-100">
                            <div class="flex-shrink-0 w-12 h-12 bg-slate-500 rounded-lg flex items-center justify-center">
                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
                                </svg>
                            </div>
                            <div>
                                <p class="text-sm text-gray-500 font-medium">Updated At</p>
                                <p class="text-lg font-bold text-gray-800">${booking.updatedAt}</p>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>

        <!-- Vehicle Details Card -->
        <div class="bg-white rounded-2xl shadow-xl overflow-hidden mb-8 border border-gray-100">
            <div class="bg-gradient-to-r from-indigo-500 to-purple-600 px-6 py-4">
                <h2 class="text-2xl font-bold text-white flex items-center">
                    <svg class="w-7 h-7 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7h12m0 0l-4-4m4 4l-4 4m0 6H4m0 0l4 4m-4-4l4-4"/>
                    </svg>
                    Vehicle Details
                </h2>
            </div>
            <div class="p-6">
                <c:choose>
                    <c:when test="${not empty vehicle}">
                        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
                            <div class="p-5 bg-gradient-to-br from-indigo-50 to-purple-50 rounded-xl border border-indigo-100 hover:shadow-md transition-shadow duration-300">
                                <p class="text-sm text-gray-500 font-medium mb-1">Vehicle Number</p>
                                <p class="text-xl font-bold text-gray-800">${vehicle.vehicleNumber}</p>
                            </div>
                            <div class="p-5 bg-gradient-to-br from-purple-50 to-pink-50 rounded-xl border border-purple-100 hover:shadow-md transition-shadow duration-300">
                                <p class="text-sm text-gray-500 font-medium mb-1">Vehicle Type</p>
                                <p class="text-xl font-bold text-gray-800">${vehicle.vehicleType}</p>
                            </div>
                            <div class="p-5 bg-gradient-to-br from-pink-50 to-rose-50 rounded-xl border border-pink-100 hover:shadow-md transition-shadow duration-300">
                                <p class="text-sm text-gray-500 font-medium mb-1">Brand</p>
                                <p class="text-xl font-bold text-gray-800">${vehicle.vehicleBrand}</p>
                            </div>
                            <div class="p-5 bg-gradient-to-br from-rose-50 to-red-50 rounded-xl border border-rose-100 hover:shadow-md transition-shadow duration-300">
                                <p class="text-sm text-gray-500 font-medium mb-1">Model</p>
                                <p class="text-xl font-bold text-gray-800">${vehicle.vehicleModel}</p>
                            </div>
                            <div class="p-5 bg-gradient-to-br from-amber-50 to-orange-50 rounded-xl border border-amber-100 hover:shadow-md transition-shadow duration-300">
                                <p class="text-sm text-gray-500 font-medium mb-1">Color</p>
                                <p class="text-xl font-bold text-gray-800">${vehicle.vehicleColor}</p>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-12">
                            <div class="inline-flex items-center justify-center w-16 h-16 bg-gray-100 rounded-full mb-4">
                                <svg class="w-8 h-8 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                </svg>
                            </div>
                            <p class="text-gray-500 text-lg">Vehicle information not available</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Parking Place Details Card -->
        <div class="bg-white rounded-2xl shadow-xl overflow-hidden border border-gray-100">
            <div class="bg-gradient-to-r from-emerald-500 to-teal-600 px-6 py-4">
                <h2 class="text-2xl font-bold text-white flex items-center">
                    <svg class="w-7 h-7 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                    </svg>
                    Parking Place Details
                </h2>
            </div>
            <div class="p-6">
                <c:choose>
                    <c:when test="${not empty parkingPlace}">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
                            <div class="p-5 bg-gradient-to-br from-emerald-50 to-teal-50 rounded-xl border border-emerald-100 hover:shadow-md transition-shadow duration-300">
                                <p class="text-sm text-gray-500 font-medium mb-1">Parking Name</p>
                                <p class="text-xl font-bold text-gray-800">${parkingPlace.parkingName}</p>
                            </div>
                            <div class="p-5 bg-gradient-to-br from-teal-50 to-cyan-50 rounded-xl border border-teal-100 hover:shadow-md transition-shadow duration-300">
                                <p class="text-sm text-gray-500 font-medium mb-1">Parking Type</p>
                                <p class="text-xl font-bold text-gray-800">${parkingPlace.parkingType}</p>
                            </div>
                            <div class="p-5 bg-gradient-to-br from-cyan-50 to-blue-50 rounded-xl border border-cyan-100 hover:shadow-md transition-shadow duration-300 md:col-span-2">
                                <p class="text-sm text-gray-500 font-medium mb-1">Address</p>
                                <p class="text-xl font-bold text-gray-800">${parkingPlace.address}</p>
                            </div>
                            <div class="p-5 bg-gradient-to-br from-blue-50 to-indigo-50 rounded-xl border border-blue-100 hover:shadow-md transition-shadow duration-300">
                                <p class="text-sm text-gray-500 font-medium mb-1">City</p>
                                <p class="text-xl font-bold text-gray-800">${parkingPlace.city}</p>
                            </div>
                            <div class="p-5 bg-gradient-to-br from-indigo-50 to-violet-50 rounded-xl border border-indigo-100 hover:shadow-md transition-shadow duration-300">
                                <p class="text-sm text-gray-500 font-medium mb-1">District</p>
                                <p class="text-xl font-bold text-gray-800">${parkingPlace.district}</p>
                            </div>
                            <div class="p-5 bg-gradient-to-br from-violet-50 to-purple-50 rounded-xl border border-violet-100 hover:shadow-md transition-shadow duration-300">
                                <p class="text-sm text-gray-500 font-medium mb-1">Hourly Rate</p>
                                <p class="text-xl font-bold text-gray-800">Rs. ${parkingPlace.hourlyRate}</p>
                            </div>
                            <div class="p-5 bg-gradient-to-br from-purple-50 to-fuchsia-50 rounded-xl border border-purple-100 hover:shadow-md transition-shadow duration-300">
                                <p class="text-sm text-gray-500 font-medium mb-1">Opening Time</p>
                                <p class="text-xl font-bold text-gray-800">${parkingPlace.openingTime}</p>
                            </div>
                            <div class="p-5 bg-gradient-to-br from-fuchsia-50 to-pink-50 rounded-xl border border-fuchsia-100 hover:shadow-md transition-shadow duration-300">
                                <p class="text-sm text-gray-500 font-medium mb-1">Closing Time</p>
                                <p class="text-xl font-bold text-gray-800">${parkingPlace.closingTime}</p>
                            </div>
                            <div class="p-5 bg-gradient-to-br from-pink-50 to-rose-50 rounded-xl border border-pink-100 hover:shadow-md transition-shadow duration-300">
                                <p class="text-sm text-gray-500 font-medium mb-1">EV Charging</p>
                                <p class="text-xl font-bold text-gray-800">${parkingPlace.evChargingAvailable ? 'Available' : 'Not Available'}</p>
                            </div>
                            <div class="p-5 bg-gradient-to-br from-rose-50 to-red-50 rounded-xl border border-rose-100 hover:shadow-md transition-shadow duration-300">
                                <p class="text-sm text-gray-500 font-medium mb-1">Contact</p>
                                <p class="text-xl font-bold text-gray-800">${parkingPlace.contactNumber}</p>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-12">
                            <div class="inline-flex items-center justify-center w-16 h-16 bg-gray-100 rounded-full mb-4">
                                <svg class="w-8 h-8 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                </svg>
                            </div>
                            <p class="text-gray-500 text-lg">Parking place information not available</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>