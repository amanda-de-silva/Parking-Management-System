<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Parking Place</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background-image: url('https://cdn.pixabay.com/photo/2014/10/25/19/23/multi-storey-car-park-502960_1280.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.75);
            z-index: -1;
        }
    </style>
</head>
<body class="min-h-screen">
    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <!-- Main Container -->
    <div class="container mx-auto px-4 py-8 max-w-5xl">
        <!-- Page Header -->
        <div class="bg-white rounded-2xl shadow-lg p-8 mb-6">
            <div class="flex items-center justify-between flex-wrap gap-4">
                <div>
                    <h1 class="text-4xl font-bold text-gray-800 mb-2">Parking Place Details</h1>
                    <p class="text-gray-500">View complete information about this parking location</p>
                </div>

                <!-- Action Buttons -->
                <div class="flex gap-3">
                    <a href="${pageContext.request.contextPath}/parking/list"
                       class="inline-flex items-center px-6 py-3 bg-gray-600 hover:bg-gray-700 text-white font-medium rounded-lg shadow-md transition-all duration-300 transform hover:scale-105">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                        </svg>
                        Back to List
                    </a>
                    <a href="${pageContext.request.contextPath}/parking/edit/${parkingPlace.id}"
                       class="inline-flex items-center px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg shadow-md transition-all duration-300 transform hover:scale-105">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                        </svg>
                        Edit
                    </a>
                </div>
            </div>
        </div>

        <!-- Details Grid -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            <!-- Left Column - Main Info -->
            <div class="lg:col-span-2 space-y-6">
                <!-- Basic Information Card -->
                <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
                    <div class="bg-gradient-to-r from-blue-600 to-blue-700 px-6 py-4">
                        <h2 class="text-2xl font-bold text-white">Basic Information</h2>
                    </div>
                    <div class="p-6 space-y-4">
                        <div class="flex items-start border-b border-gray-100 pb-4">
                            <span class="text-gray-500 font-medium min-w-[140px]">ID:</span>
                            <span class="text-gray-800 font-semibold">${parkingPlace.id}</span>
                        </div>
                        <div class="flex items-start border-b border-gray-100 pb-4">
                            <span class="text-gray-500 font-medium min-w-[140px]">Parking Name:</span>
                            <span class="text-gray-800 font-semibold text-lg">${parkingPlace.parkingName}</span>
                        </div>
                        <div class="flex items-start border-b border-gray-100 pb-4">
                            <span class="text-gray-500 font-medium min-w-[140px]">Description:</span>
                            <span class="text-gray-700">${parkingPlace.description}</span>
                        </div>
                        <div class="flex items-start">
                            <span class="text-gray-500 font-medium min-w-[140px]">Parking Type:</span>
                            <span class="inline-block px-4 py-1 bg-blue-100 text-blue-800 rounded-full text-sm font-semibold">${parkingPlace.parkingType}</span>
                        </div>
                    </div>
                </div>

                <!-- Location Information Card -->
                <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
                    <div class="bg-gradient-to-r from-green-600 to-green-700 px-6 py-4">
                        <h2 class="text-2xl font-bold text-white">Location Details</h2>
                    </div>
                    <div class="p-6 space-y-4">
                        <div class="flex items-start border-b border-gray-100 pb-4">
                            <span class="text-gray-500 font-medium min-w-[140px]">Address:</span>
                            <span class="text-gray-800">${parkingPlace.address}</span>
                        </div>
                        <div class="flex items-start border-b border-gray-100 pb-4">
                            <span class="text-gray-500 font-medium min-w-[140px]">City/Town:</span>
                            <span class="text-gray-800 font-semibold">${parkingPlace.city}</span>
                        </div>
                        <div class="flex items-start border-b border-gray-100 pb-4">
                            <span class="text-gray-500 font-medium min-w-[140px]">District:</span>
                            <span class="text-gray-800 font-semibold">${parkingPlace.district}</span>
                        </div>
                        <div class="flex items-start">
                            <span class="text-gray-500 font-medium min-w-[140px]">GPS Coordinates:</span>
                            <span class="text-gray-800">
                                <c:if test="${not empty parkingPlace.latitude && not empty parkingPlace.longitude}">
                                    <div class="flex items-center gap-2">
                                        <svg class="w-5 h-5 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                                        </svg>
                                        <span>Latitude: ${parkingPlace.latitude}, Longitude: ${parkingPlace.longitude}</span>
                                    </div>
                                </c:if>
                                <c:if test="${empty parkingPlace.latitude || empty parkingPlace.longitude}">
                                    <span class="text-gray-400 italic">Not specified</span>
                                </c:if>
                            </span>
                        </div>
                    </div>
                </div>

                <!-- Parking Image Card -->
                <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
                    <div class="bg-gradient-to-r from-purple-600 to-purple-700 px-6 py-4">
                        <h2 class="text-2xl font-bold text-white">Parking Images</h2>
                    </div>
                    <div class="p-6">
                        <c:if test="${not empty parkingPlace.parkingImages}">
                            <div class="relative group">
                                <img src="${pageContext.request.contextPath}/uploads/parking/${parkingPlace.parkingImages}"
                                     alt="Parking Image"
                                     class="w-full h-auto rounded-xl shadow-md transition-transform duration-300 group-hover:scale-105"/>
                                <div class="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-10 rounded-xl transition-all duration-300"></div>
                            </div>
                        </c:if>
                        <c:if test="${empty parkingPlace.parkingImages}">
                            <div class="flex flex-col items-center justify-center py-12 text-gray-400">
                                <svg class="w-20 h-20 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                </svg>
                                <p class="text-lg font-medium">No images uploaded</p>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>

            <!-- Right Column - Stats & Info -->
            <div class="space-y-6">
                <!-- Availability Card -->
                <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
                    <div class="bg-gradient-to-r from-orange-600 to-orange-700 px-6 py-4">
                        <h2 class="text-xl font-bold text-white">Availability</h2>
                    </div>
                    <div class="p-6 space-y-4">
                        <div class="bg-gradient-to-br from-green-50 to-green-100 rounded-xl p-4 border border-green-200">
                            <div class="text-sm text-green-700 font-medium mb-1">Available Slots</div>
                            <div class="text-4xl font-bold text-green-800">${parkingPlace.availableSlots}</div>
                        </div>
                        <div class="bg-gradient-to-br from-blue-50 to-blue-100 rounded-xl p-4 border border-blue-200">
                            <div class="text-sm text-blue-700 font-medium mb-1">Total Slots</div>
                            <div class="text-4xl font-bold text-blue-800">${parkingPlace.totalSlots}</div>
                        </div>
                    </div>
                </div>

                <!-- Pricing Card -->
                <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
                    <div class="bg-gradient-to-r from-yellow-600 to-yellow-700 px-6 py-4">
                        <h2 class="text-xl font-bold text-white">Pricing</h2>
                    </div>
                    <div class="p-6">
                        <div class="bg-gradient-to-br from-yellow-50 to-amber-100 rounded-xl p-6 border border-yellow-200 text-center">
                            <div class="text-sm text-yellow-700 font-medium mb-2">Hourly Rate</div>
                            <div class="text-5xl font-bold text-yellow-900">Rs. ${parkingPlace.hourlyRate}</div>
                            <div class="text-xs text-yellow-600 mt-2">per hour</div>
                        </div>
                    </div>
                </div>

                <!-- Operating Hours Card -->
                <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
                    <div class="bg-gradient-to-r from-indigo-600 to-indigo-700 px-6 py-4">
                        <h2 class="text-xl font-bold text-white">Operating Hours</h2>
                    </div>
                    <div class="p-6 space-y-4">
                        <div class="flex items-center gap-3 bg-indigo-50 rounded-lg p-4">
                            <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"/>
                            </svg>
                            <div>
                                <div class="text-xs text-indigo-600 font-medium">Opening Time</div>
                                <div class="text-lg font-bold text-indigo-900">${parkingPlace.openingTime}</div>
                            </div>
                        </div>
                        <div class="flex items-center gap-3 bg-indigo-50 rounded-lg p-4">
                            <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"/>
                            </svg>
                            <div>
                                <div class="text-xs text-indigo-600 font-medium">Closing Time</div>
                                <div class="text-lg font-bold text-indigo-900">${parkingPlace.closingTime}</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Features Card -->
                <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
                    <div class="bg-gradient-to-r from-teal-600 to-teal-700 px-6 py-4">
                        <h2 class="text-xl font-bold text-white">Features</h2>
                    </div>
                    <div class="p-6">
                        <div class="flex items-center gap-3 ${parkingPlace.evChargingAvailable ? 'bg-green-50 border-green-200' : 'bg-gray-50 border-gray-200'} border rounded-lg p-4">
                            <c:if test="${parkingPlace.evChargingAvailable}">
                                <svg class="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"/>
                                </svg>
                            </c:if>
                            <c:if test="${!parkingPlace.evChargingAvailable}">
                                <svg class="w-8 h-8 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"/>
                                </svg>
                            </c:if>
                            <div>
                                <div class="text-sm ${parkingPlace.evChargingAvailable ? 'text-green-700' : 'text-gray-500'} font-medium">EV Charging</div>
                                <div class="text-lg font-bold ${parkingPlace.evChargingAvailable ? 'text-green-900' : 'text-gray-700'}">${parkingPlace.evChargingAvailable ? 'Available' : 'Not Available'}</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Contact Card -->
                <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
                    <div class="bg-gradient-to-r from-pink-600 to-pink-700 px-6 py-4">
                        <h2 class="text-xl font-bold text-white">Contact</h2>
                    </div>
                    <div class="p-6">
                        <div class="flex items-center gap-3 bg-pink-50 rounded-lg p-4">
                            <svg class="w-6 h-6 text-pink-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>
                            </svg>
                            <div>
                                <div class="text-xs text-pink-600 font-medium">Phone Number</div>
                                <div class="text-lg font-bold text-pink-900">${parkingPlace.contactNumber}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>