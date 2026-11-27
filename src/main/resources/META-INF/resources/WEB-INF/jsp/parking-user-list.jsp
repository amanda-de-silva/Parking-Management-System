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
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.8; }
        }
        .slide-in {
            animation: slideIn 0.6s ease-out;
        }
        .card-transform {
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }
        .card-transform:hover {
            transform: translateY(-12px) scale(1.02);
        }
        .btn-shine {
            position: relative;
            overflow: hidden;
        }
        .btn-shine::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s;
        }
        .btn-shine:hover::before {
            left: 100%;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-slate-50 via-blue-50 to-indigo-50 min-h-screen">
    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <div class="max-w-7xl mx-auto px-6 py-10">
        <!-- Modern Header Section -->
        <div class="mb-12 slide-in">
            <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4 mb-6">
                <div>
                    <h1 class="text-5xl font-extrabold text-transparent bg-clip-text bg-gradient-to-r from-blue-600 via-purple-600 to-indigo-600 mb-3">
                        Available Parking Places
                    </h1>
                    <p class="text-gray-600 text-lg">Discover and manage your parking locations with ease</p>
                </div>
                <div class="flex items-center gap-3">
                    <div class="bg-white rounded-2xl px-6 py-4 shadow-xl border border-gray-100">
                        <div class="text-sm text-gray-500 mb-1">Total Locations</div>
                        <div class="text-3xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-purple-600">
                            ${parkingPlaces.size()}
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Success / Error Messages -->
        <c:if test="${not empty message}">
            <div class="bg-gradient-to-r from-emerald-50 to-teal-50 border-l-4 border-emerald-500 text-emerald-800 px-6 py-5 rounded-2xl mb-8 shadow-lg slide-in backdrop-blur-sm">
                <div class="flex items-center">
                    <div class="flex-shrink-0">
                        <svg class="w-7 h-7 text-emerald-500" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                    </div>
                    <div class="ml-4">
                        <p class="font-semibold text-lg">${message}</p>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="bg-gradient-to-r from-rose-50 to-pink-50 border-l-4 border-rose-500 text-rose-800 px-6 py-5 rounded-2xl mb-8 shadow-lg slide-in backdrop-blur-sm">
                <div class="flex items-center">
                    <div class="flex-shrink-0">
                        <svg class="w-7 h-7 text-rose-500" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                        </svg>
                    </div>
                    <div class="ml-4">
                        <p class="font-semibold text-lg">${error}</p>
                    </div>
                </div>
            </div>
        </c:if>

        <c:choose>
            <c:when test="${empty parkingPlaces}">
                <div class="text-center py-24 slide-in">
                    <div class="inline-flex items-center justify-center w-32 h-32 bg-gradient-to-br from-blue-100 to-purple-100 rounded-full shadow-2xl mb-8">
                        <svg class="w-16 h-16 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
                        </svg>
                    </div>
                    <p class="text-gray-700 text-2xl font-bold mb-3">No parking places found.</p>
                    <p class="text-gray-500 text-lg">Start by adding your first parking location to get started</p>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Card Grid -->
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
                    <c:forEach var="parking" items="${parkingPlaces}">
                        <div class="bg-white rounded-3xl shadow-2xl overflow-hidden card-transform flex flex-col border border-gray-100 hover:border-purple-200">
                            <!-- Image with Overlay -->
                            <div class="relative overflow-hidden group">
                                <c:if test="${not empty parking.parkingImages}">
                                    <img src="${pageContext.request.contextPath}/uploads/parking/${parking.parkingImages}"
                                         alt="${parking.parkingName}"
                                         class="w-full h-48 object-cover transform group-hover:scale-110 transition duration-700">
                                    <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-black/20 to-transparent"></div>
                                </c:if>
                                <c:if test="${empty parking.parkingImages}">
                                    <div class="w-full h-48 bg-gradient-to-br from-blue-200 via-purple-200 to-pink-200 flex items-center justify-center relative overflow-hidden">
                                        <div class="absolute inset-0 bg-white/20 backdrop-blur-sm"></div>
                                        <svg class="w-20 h-20 text-white/70 relative z-10" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                        </svg>
                                    </div>
                                </c:if>

                                <!-- Status Badge -->
                                <div class="absolute top-4 right-4 z-10">
                                    <c:choose>
                                        <c:when test="${parking.availableSlots > 0}">
                                            <span class="inline-flex items-center bg-gradient-to-r from-green-500 to-emerald-500 text-white px-3 py-1.5 rounded-full text-xs font-bold shadow-xl">
                                                <span class="w-2 h-2 bg-white rounded-full mr-2 animate-pulse"></span>
                                                Available
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="inline-flex items-center bg-gradient-to-r from-red-500 to-rose-500 text-white px-3 py-1.5 rounded-full text-xs font-bold shadow-xl">
                                                <span class="w-2 h-2 bg-white rounded-full mr-2"></span>
                                                Full
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <!-- Details -->
                            <div class="p-5 flex-1 flex flex-col justify-between">
                                <div>
                                    <h2 class="text-xl font-bold mb-2 text-gray-900 leading-tight">${parking.parkingName}</h2>
                                    <p class="text-gray-600 text-xs mb-3 leading-relaxed line-clamp-2">${parking.description}</p>

                                    <!-- Key Info Cards -->
                                    <div class="grid grid-cols-2 gap-3 mb-3">
                                        <div class="bg-gradient-to-br from-blue-50 to-blue-100 rounded-xl p-3 text-center border border-blue-200 shadow-sm">
                                            <div class="text-xs font-semibold text-blue-600 mb-0.5 uppercase tracking-wide">Slots</div>
                                            <div class="text-xl font-bold text-blue-700">${parking.availableSlots}<span class="text-sm text-blue-500">/${parking.totalSlots}</span></div>
                                        </div>
                                        <div class="bg-gradient-to-br from-purple-50 to-purple-100 rounded-xl p-3 text-center border border-purple-200 shadow-sm">
                                            <div class="text-xs font-semibold text-purple-600 mb-0.5 uppercase tracking-wide">Rate</div>
                                            <div class="text-xl font-bold text-purple-700">Rs. ${parking.hourlyRate}</div>
                                        </div>
                                    </div>

                                    <!-- Details List - Compact Version -->
                                    <div class="space-y-2 text-xs mb-3">
                                        <div class="flex items-center bg-gray-50 rounded-lg p-2 hover:bg-gray-100 transition">
                                            <svg class="w-4 h-4 mr-2 text-blue-500 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                                <path fill-rule="evenodd" d="M4 4a2 2 0 012-2h8a2 2 0 012 2v12a1 1 0 110 2h-3a1 1 0 01-1-1v-2a1 1 0 00-1-1H9a1 1 0 00-1 1v2a1 1 0 01-1 1H4a1 1 0 110-2V4zm3 1h2v2H7V5zm2 4H7v2h2V9zm2-4h2v2h-2V5zm2 4h-2v2h2V9z" clip-rule="evenodd"/>
                                            </svg>
                                            <span class="font-semibold text-gray-700 mr-1">Type:</span>
                                            <span class="text-gray-600 truncate">${parking.parkingType}</span>
                                        </div>

                                        <div class="flex items-center bg-gray-50 rounded-lg p-2 hover:bg-gray-100 transition">
                                            <svg class="w-4 h-4 mr-2 text-blue-500 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                                <path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"/>
                                            </svg>
                                            <span class="font-semibold text-gray-700 mr-1">Location:</span>
                                            <span class="text-gray-600 truncate">${parking.city}, ${parking.district}</span>
                                        </div>

                                        <div class="flex items-center bg-gray-50 rounded-lg p-2 hover:bg-gray-100 transition">
                                            <svg class="w-4 h-4 mr-2 text-blue-500 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                                <path d="M2 3a1 1 0 011-1h2.153a1 1 0 01.986.836l.74 4.435a1 1 0 01-.54 1.06l-1.548.773a11.037 11.037 0 006.105 6.105l.774-1.548a1 1 0 011.059-.54l4.435.74a1 1 0 01.836.986V17a1 1 0 01-1 1h-2C7.82 18 2 12.18 2 5V3z"/>
                                            </svg>
                                            <span class="font-semibold text-gray-700 mr-1">Contact:</span>
                                            <span class="text-gray-600 truncate">${parking.contactNumber}</span>
                                        </div>

                                        <div class="flex items-center bg-gray-50 rounded-lg p-2 hover:bg-gray-100 transition">
                                            <svg class="w-4 h-4 mr-2 text-blue-500 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                                <path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"/>
                                            </svg>
                                            <span class="font-semibold text-gray-700 mr-1">Hours:</span>
                                            <span class="text-gray-600 truncate">${parking.openingTime} - ${parking.closingTime}</span>
                                        </div>

                                        <div class="flex items-center bg-gray-50 rounded-lg p-2 hover:bg-gray-100 transition">
                                            <svg class="w-4 h-4 mr-2 text-blue-500 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                                <path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"/>
                                            </svg>
                                            <span class="font-semibold text-gray-700 mr-1">GPS:</span>
                                            <span class="text-gray-600 truncate">
                                                <c:choose>
                                                    <c:when test="${not empty parking.latitude && not empty parking.longitude}">
                                                        ${parking.latitude}, ${parking.longitude}
                                                    </c:when>
                                                    <c:otherwise>
                                                        Not specified
                                                    </c:otherwise>
                                                </c:choose>
                                            </span>
                                        </div>
                                    </div>

                                    <!-- Feature Badges - Compact Version -->
                                    <div class="flex flex-wrap gap-1.5 mb-3">
                                        <c:if test="${parking.evChargingAvailable}">
                                            <span class="inline-flex items-center bg-gradient-to-r from-green-100 to-emerald-100 text-green-700 px-2 py-1 rounded-full text-xs font-bold border border-green-200">
                                                <svg class="w-3 h-3 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                                    <path d="M11 3a1 1 0 10-2 0v1a1 1 0 102 0V3zM15.657 5.757a1 1 0 00-1.414-1.414l-.707.707a1 1 0 001.414 1.414l.707-.707zM18 10a1 1 0 01-1 1h-1a1 1 0 110-2h1a1 1 0 011 1zM5.05 6.464A1 1 0 106.464 5.05l-.707-.707a1 1 0 00-1.414 1.414l.707.707zM5 10a1 1 0 01-1 1H3a1 1 0 110-2h1a1 1 0 011 1zM8 16v-1h4v1a2 2 0 11-4 0zM12 14c.015-.34.208-.646.477-.859a4 4 0 10-4.954 0c.27.213.462.519.476.859h4.002z"/>
                                                </svg>
                                                EV Charging
                                            </span>
                                        </c:if>
                                        <c:choose>
                                            <c:when test="${not empty parking.latitude && not empty parking.longitude}">
                                                <span class="inline-flex items-center bg-gradient-to-r from-blue-100 to-indigo-100 text-blue-700 px-2 py-1 rounded-full text-xs font-bold border border-blue-200">
                                                    <svg class="w-3 h-3 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                                        <path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"/>
                                                    </svg>
                                                    GPS Enabled
                                                </span>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>

                               <!-- Booking Button - Compact Version -->
                               <div class="mt-3">
                                   <a href="${pageContext.request.contextPath}/booking/create?parkingPlaceId=${parking.id}&parkingName=${parking.parkingName}&openingTime=${parking.openingTime}&closingTime=${parking.closingTime}"
                                      class="btn-shine block text-center bg-gradient-to-r from-green-500 to-emerald-600 hover:from-green-600 hover:to-emerald-700 text-white font-bold px-4 py-3 rounded-xl shadow-lg hover:shadow-2xl transition-all duration-300 transform hover:scale-105">
                                       <span class="flex items-center justify-center text-sm">
                                           <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                               <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                           </svg>
                                           Book / Create Booking
                                       </span>
                                   </a>
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