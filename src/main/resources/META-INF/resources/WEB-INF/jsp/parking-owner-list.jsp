<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Parking Places</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .card-animate {
            animation: slideIn 0.5s ease-out forwards;
        }
        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .card-hover {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .card-hover:hover {
            transform: translateY(-8px);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 via-blue-50 to-purple-50 min-h-screen">
    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 sm:py-12">
        <!-- Header Section -->
        <div class="mb-8 sm:mb-12">
            <div class="flex items-center justify-between flex-wrap gap-4">
                <div>
                    <h1 class="text-4xl sm:text-5xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-purple-600 to-blue-600 mb-2">
                        My Parking Places
                    </h1>
                    <p class="text-gray-600 text-lg">Manage and view your parking spaces</p>
                </div>
                <div class="flex items-center gap-2 bg-white px-4 py-2 rounded-full shadow-md">
                    <svg class="w-5 h-5 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                    </svg>
                    <span class="text-sm font-medium text-gray-700">Your Locations</span>
                </div>
            </div>
        </div>

        <!-- Success / Error Messages -->
        <c:if test="${not empty message}">
            <div class="bg-gradient-to-r from-green-50 to-emerald-50 border-l-4 border-green-500 text-green-800 px-6 py-4 rounded-xl mb-6 shadow-md flex items-start gap-3 card-animate">
                <svg class="w-6 h-6 text-green-500 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
                <span class="font-medium">${message}</span>
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="bg-gradient-to-r from-red-50 to-rose-50 border-l-4 border-red-500 text-red-800 px-6 py-4 rounded-xl mb-6 shadow-md flex items-start gap-3 card-animate">
                <svg class="w-6 h-6 text-red-500 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
                <span class="font-medium">${error}</span>
            </div>
        </c:if>

        <c:choose>
            <c:when test="${empty parkingPlaces}">
                <div class="flex flex-col items-center justify-center py-20 px-4">
                    <div class="bg-white rounded-3xl shadow-2xl p-12 text-center max-w-md">
                        <div class="w-24 h-24 bg-gradient-to-br from-purple-100 to-blue-100 rounded-full flex items-center justify-center mx-auto mb-6">
                            <svg class="w-12 h-12 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4"/>
                            </svg>
                        </div>
                        <h2 class="text-2xl font-bold text-gray-800 mb-3">No Parking Places Found</h2>
                        <p class="text-gray-600 text-lg">Start by adding your first parking space to get started.</p>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Card Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 lg:gap-8">
                    <c:forEach var="parking" items="${parkingPlaces}">
                        <div class="bg-white rounded-3xl shadow-xl overflow-hidden card-hover card-animate flex flex-col border border-gray-100">
                            <!-- Image -->
                            <div class="relative overflow-hidden">
                                <c:if test="${not empty parking.parkingImages}">
                                    <img src="${pageContext.request.contextPath}/uploads/parking/${parking.parkingImages}"
                                         alt="${parking.parkingName}"
                                         class="w-full h-56 object-cover transform hover:scale-110 transition duration-500">
                                </c:if>
                                <c:if test="${empty parking.parkingImages}">
                                    <div class="w-full h-56 bg-gradient-to-br from-gray-200 to-gray-300 flex items-center justify-center">
                                        <svg class="w-16 h-16 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                        </svg>
                                    </div>
                                </c:if>
                                <!-- Availability Badge -->
                                <div class="absolute top-4 right-4 bg-white/95 backdrop-blur-sm px-4 py-2 rounded-full shadow-lg">
                                    <span class="text-sm font-bold text-purple-600">${parking.availableSlots}/${parking.totalSlots} Available</span>
                                </div>
                            </div>

                            <!-- Details -->
                            <div class="p-6 flex-1 flex flex-col">
                                <div class="mb-4">
                                    <h2 class="text-2xl font-bold text-gray-900 mb-2">${parking.parkingName}</h2>
                                    <p class="text-gray-600 text-sm leading-relaxed">${parking.description}</p>
                                </div>

                                <!-- Price Badge -->
                                <div class="mb-4 inline-flex items-center gap-2 bg-gradient-to-r from-purple-600 to-blue-600 text-white px-5 py-3 rounded-2xl shadow-lg w-fit">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1"/>
                                    </svg>
                                    <span class="text-xl font-bold">Rs. ${parking.hourlyRate}</span>
                                    <span class="text-sm opacity-90">/hour</span>
                                </div>

                                <!-- Details Grid -->
                                <div class="space-y-3 text-sm flex-1">
                                    <div class="flex items-start gap-3 p-3 bg-gray-50 rounded-xl hover:bg-gray-100 transition">
                                        <svg class="w-5 h-5 text-purple-600 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"/>
                                        </svg>
                                        <div>
                                            <span class="font-semibold text-gray-700">Type:</span>
                                            <span class="text-gray-600 ml-1">${parking.parkingType}</span>
                                        </div>
                                    </div>

                                    <div class="flex items-start gap-3 p-3 bg-gray-50 rounded-xl hover:bg-gray-100 transition">
                                        <svg class="w-5 h-5 text-purple-600 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                                        </svg>
                                        <div class="flex-1">
                                            <div class="font-semibold text-gray-700 mb-1">Location:</div>
                                            <div class="text-gray-600 space-y-0.5">
                                                <div>${parking.address}</div>
                                                <div>${parking.city}, ${parking.district}</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="flex items-start gap-3 p-3 bg-gray-50 rounded-xl hover:bg-gray-100 transition">
                                        <svg class="w-5 h-5 text-purple-600 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                        </svg>
                                        <div>
                                            <span class="font-semibold text-gray-700">Hours:</span>
                                            <span class="text-gray-600 ml-1">${parking.openingTime} - ${parking.closingTime}</span>
                                        </div>
                                    </div>

                                    <div class="flex items-start gap-3 p-3 bg-gray-50 rounded-xl hover:bg-gray-100 transition">
                                        <svg class="w-5 h-5 text-purple-600 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>
                                        </svg>
                                        <div>
                                            <span class="font-semibold text-gray-700">Contact:</span>
                                            <span class="text-gray-600 ml-1">${parking.contactNumber}</span>
                                        </div>
                                    </div>

                                    <div class="flex items-center gap-3 p-3 bg-gray-50 rounded-xl">
                                        <c:choose>
                                            <c:when test="${parking.evChargingAvailable}">
                                                <div class="flex items-center gap-2 text-green-700">
                                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"/>
                                                    </svg>
                                                    <span class="font-semibold">EV Charging Available</span>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="flex items-center gap-2 text-gray-500">
                                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"/>
                                                    </svg>
                                                    <span class="font-semibold">No EV Charging</span>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <c:choose>
                                        <c:when test="${not empty parking.latitude && not empty parking.longitude}">
                                            <div class="flex items-start gap-3 p-3 bg-gradient-to-r from-blue-50 to-purple-50 rounded-xl border border-purple-100">
                                                <svg class="w-5 h-5 text-purple-600 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7"/>
                                                </svg>
                                                <div class="text-xs">
                                                    <div class="font-semibold text-gray-700 mb-1">GPS Coordinates:</div>
                                                    <div class="text-gray-600 font-mono">
                                                        Lat: ${parking.latitude}<br>
                                                        Lng: ${parking.longitude}
                                                    </div>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="flex items-center gap-3 p-3 bg-gray-50 rounded-xl">
                                                <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7"/>
                                                </svg>
                                                <span class="text-sm text-gray-500 font-medium">GPS not specified</span>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
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