<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Booking</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
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
        .glass-effect {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
        }
        input:focus, select:focus {
            transform: translateY(-2px);
            transition: all 0.2s ease;
        }
        .hover-lift:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        body {
            background-image: url('https://cdn.pixabay.com/photo/2019/08/01/07/26/architecture-4376923_1280.jpg');
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
            background: rgba(0, 0, 0, 0.55);
            z-index: -1;
        }
    </style>
</head>
<body class="min-h-screen">

    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <div class="container mx-auto px-4 py-12">
        <div class="max-w-4xl mx-auto">
            <!-- Page Header with Gradient -->
            <div class="gradient-bg rounded-2xl shadow-2xl p-8 mb-8 text-white animate-slide-in">
                <div class="flex items-center gap-4">
                    <div class="bg-white bg-opacity-20 p-4 rounded-xl backdrop-blur-sm">
                        <svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                        </svg>
                    </div>
                    <div>
                        <h1 class="text-4xl font-bold mb-2">Create New Booking</h1>
                        <p class="text-blue-100 text-lg">Reserve your parking spot in just a few clicks</p>
                    </div>
                </div>
            </div>

            <c:if test="${not empty error}">
                <div class="bg-red-50 border-l-4 border-red-500 text-red-700 px-6 py-4 rounded-lg mb-6 shadow-md animate-slide-in">
                    <div class="flex items-center">
                        <svg class="w-6 h-6 mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                        </svg>
                        <span class="font-medium">${error}</span>
                    </div>
                </div>
            </c:if>

            <div class="mb-6">
                <a href="${pageContext.request.contextPath}/booking/list"
                   class="inline-flex items-center gap-2 text-indigo-600 hover:text-indigo-800 font-semibold transition-all hover:gap-3">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
                    </svg>
                    Back to List
                </a>
            </div>

            <div class="glass-effect rounded-2xl shadow-2xl p-8 border border-gray-100">
                <c:choose>
                    <c:when test="${empty vehicles}">
                        <div class="text-center py-16 animate-slide-in">
                            <div class="bg-gradient-to-br from-red-50 to-orange-50 rounded-full w-24 h-24 flex items-center justify-center mx-auto mb-6">
                                <svg class="w-12 h-12 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path>
                                </svg>
                            </div>
                            <h3 class="text-2xl font-bold text-gray-800 mb-3">No Vehicle Registered</h3>
                            <p class="text-gray-600 text-lg mb-6">You need to register a vehicle first before making a booking.</p>
                            <a href="${pageContext.request.contextPath}/vehicle/create"
                               class="inline-flex items-center gap-2 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white px-8 py-3 rounded-xl font-semibold shadow-lg hover-lift transition-all">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                                </svg>
                                Register Vehicle
                            </a>
                        </div>
                    </c:when>
                    <c:when test="${empty parkingPlaces and empty param.parkingPlaceId}">
                        <div class="text-center py-16 animate-slide-in">
                            <div class="bg-gradient-to-br from-yellow-50 to-orange-50 rounded-full w-24 h-24 flex items-center justify-center mx-auto mb-6">
                                <svg class="w-12 h-12 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636"></path>
                                </svg>
                            </div>
                            <h3 class="text-2xl font-bold text-gray-800 mb-3">No Parking Available</h3>
                            <p class="text-gray-600 text-lg">No parking places available at the moment.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <form action="${pageContext.request.contextPath}/booking/create" method="post" class="space-y-8">

                            <!-- Vehicle Selection -->
                            <div class="group">
                                <label for="vehicleId" class="flex items-center gap-2 text-gray-800 font-bold mb-3 text-lg">
                                    <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                                    </svg>
                                    Select Vehicle <span class="text-red-500">*</span>
                                </label>
                                <select id="vehicleId" name="vehicleId" required
                                        class="w-full border-2 border-gray-200 rounded-xl px-5 py-4 focus:ring-4 focus:ring-indigo-100 focus:border-indigo-500 text-lg transition-all hover:border-gray-300 bg-white shadow-sm">
                                    <option value="">Choose Vehicle</option>
                                    <c:forEach var="vehicle" items="${vehicles}">
                                        <option value="${vehicle.id}">
                                            ${vehicle.vehicleNumber} - ${vehicle.vehicleBrand} ${vehicle.vehicleModel}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <!-- Parking Place Selection -->
                            <c:choose>
                                <c:when test="${not empty param.parkingPlaceId}">
                                    <!-- Pre-selected Parking Place (Read-only) -->
                                    <div class="group">
                                        <label for="parkingName" class="flex items-center gap-2 text-gray-800 font-bold mb-3 text-lg">
                                            <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                            </svg>
                                            Parking Place <span class="text-red-500">*</span>
                                        </label>
                                        <input type="text" id="parkingName"
                                               value="${param.parkingName}" readonly
                                               class="w-full border-2 border-gray-200 rounded-xl px-5 py-4 bg-gradient-to-r from-gray-50 to-gray-100 text-gray-700 cursor-not-allowed text-lg shadow-sm">
                                        <input type="hidden" id="parkingPlaceId" name="parkingPlaceId" value="${param.parkingPlaceId}">

                                        <!-- Display Operating Hours -->
                                        <c:if test="${not empty param.openingTime and not empty param.closingTime}">
                                            <div class="mt-4 p-5 bg-gradient-to-r from-blue-50 to-indigo-50 border-l-4 border-blue-500 rounded-xl shadow-sm animate-slide-in">
                                                <p class="text-blue-900 font-semibold flex items-center gap-2 text-lg">
                                                    <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                                    </svg>
                                                    Operating Hours: ${param.openingTime} - ${param.closingTime}
                                                </p>
                                                <p class="text-sm text-blue-700 mt-2 ml-8">
                                                    Your booking times must fall within these hours
                                                </p>
                                            </div>
                                            <input type="hidden" id="openingTime" value="${param.openingTime}">
                                            <input type="hidden" id="closingTime" value="${param.closingTime}">
                                        </c:if>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <!-- Dropdown for Parking Place Selection -->
                                    <div class="group">
                                        <label for="parkingPlaceId" class="flex items-center gap-2 text-gray-800 font-bold mb-3 text-lg">
                                            <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                            </svg>
                                            Select Parking Place <span class="text-red-500">*</span>
                                        </label>
                                        <select id="parkingPlaceId" name="parkingPlaceId" required
                                                class="w-full border-2 border-gray-200 rounded-xl px-5 py-4 focus:ring-4 focus:ring-indigo-100 focus:border-indigo-500 text-lg transition-all hover:border-gray-300 bg-white shadow-sm">
                                            <option value="">Choose Parking Place</option>
                                            <c:forEach var="parking" items="${parkingPlaces}">
                                                <option value="${parking.id}"
                                                        data-opening="${parking.openingTime}"
                                                        data-closing="${parking.closingTime}">
                                                    ${parking.parkingName} - ${parking.city}
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <div id="operatingHoursDisplay" class="mt-4 p-5 bg-gradient-to-r from-blue-50 to-indigo-50 border-l-4 border-blue-500 rounded-xl shadow-sm hidden animate-slide-in">
                                            <p class="text-blue-900 font-semibold flex items-center gap-2 text-lg">
                                                <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                                </svg>
                                                Operating Hours: <span id="operatingHoursText"></span>
                                            </p>
                                            <p class="text-sm text-blue-700 mt-2 ml-8">
                                                Your booking times must fall within these hours
                                            </p>
                                        </div>
                                        <input type="hidden" id="openingTime" value="">
                                        <input type="hidden" id="closingTime" value="">
                                    </div>
                                </c:otherwise>
                            </c:choose>

                            <!-- Booking Start Time -->
                            <div class="group">
                                <label for="bookingStartTime" class="flex items-center gap-2 text-gray-800 font-bold mb-3 text-lg">
                                    <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                    </svg>
                                    Booking Start Time <span class="text-red-500">*</span>
                                </label>
                                <input type="datetime-local" id="bookingStartTime" name="bookingStartTime" required
                                       class="w-full border-2 border-gray-200 rounded-xl px-5 py-4 focus:ring-4 focus:ring-indigo-100 focus:border-indigo-500 text-lg transition-all hover:border-gray-300 bg-white shadow-sm">
                                <p class="text-sm text-gray-500 mt-2 ml-1 flex items-center gap-2">
                                    <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                                    </svg>
                                    Must be within operating hours and cannot be in the past
                                </p>
                            </div>

                            <!-- Booking End Time -->
                            <div class="group">
                                <label for="bookingEndTime" class="flex items-center gap-2 text-gray-800 font-bold mb-3 text-lg">
                                    <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                    </svg>
                                    Booking End Time <span class="text-red-500">*</span>
                                </label>
                                <input type="datetime-local" id="bookingEndTime" name="bookingEndTime" required
                                       class="w-full border-2 border-gray-200 rounded-xl px-5 py-4 focus:ring-4 focus:ring-indigo-100 focus:border-indigo-500 text-lg transition-all hover:border-gray-300 bg-white shadow-sm">
                                <p class="text-sm text-gray-500 mt-2 ml-1 flex items-center gap-2">
                                    <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                                    </svg>
                                    Must be within operating hours and at least 1 hour after start time
                                </p>
                            </div>

                            <!-- Booking Summary -->
                            <div id="bookingSummary" class="hidden p-6 bg-gradient-to-r from-green-50 to-emerald-50 border-l-4 border-green-500 rounded-xl shadow-md animate-slide-in">
                                <div class="flex items-start gap-3">
                                    <div class="bg-green-100 p-2 rounded-lg">
                                        <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                        </svg>
                                    </div>
                                    <div>
                                        <h3 class="font-bold text-green-900 mb-2 text-lg">Booking Summary</h3>
                                        <p class="text-green-800">
                                            <strong class="font-semibold">Duration:</strong> <span id="bookingDuration" class="font-bold">-</span>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <!-- Buttons -->
                            <div class="flex gap-4 pt-6">
                                <button type="submit"
                                        class="flex-1 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white px-8 py-4 rounded-xl font-bold text-lg shadow-lg hover-lift transition-all flex items-center justify-center gap-2">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                                    </svg>
                                    Create Booking
                                </button>
                                <button type="reset"
                                        class="bg-gradient-to-r from-gray-100 to-gray-200 hover:from-gray-200 hover:to-gray-300 text-gray-700 px-8 py-4 rounded-xl font-bold text-lg shadow-md hover-lift transition-all flex items-center justify-center gap-2">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"></path>
                                    </svg>
                                    Reset
                                </button>
                            </div>
                        </form>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <script>
        // Get operating hours from hidden fields
        let openingTimeStr = document.getElementById('openingTime') ? document.getElementById('openingTime').value : '';
        let closingTimeStr = document.getElementById('closingTime') ? document.getElementById('closingTime').value : '';

        // Parse operating hours (handle both HH:MM and HH:MM:SS formats)
        function parseTimeString(timeStr) {
            if (!timeStr) return null;
            const parts = timeStr.split(':');
            return {
                hours: parseInt(parts[0]),
                minutes: parseInt(parts[1])
            };
        }

        let openingTime = parseTimeString(openingTimeStr);
        let closingTime = parseTimeString(closingTimeStr);

        // Handle parking place dropdown change (if dropdown exists)
        const parkingPlaceDropdown = document.getElementById('parkingPlaceId');
        if (parkingPlaceDropdown && parkingPlaceDropdown.tagName === 'SELECT') {
            parkingPlaceDropdown.addEventListener('change', function() {
                const selectedOption = this.options[this.selectedIndex];
                if (selectedOption.value) {
                    openingTimeStr = selectedOption.getAttribute('data-opening') || '';
                    closingTimeStr = selectedOption.getAttribute('data-closing') || '';

                    document.getElementById('openingTime').value = openingTimeStr;
                    document.getElementById('closingTime').value = closingTimeStr;

                    openingTime = parseTimeString(openingTimeStr);
                    closingTime = parseTimeString(closingTimeStr);

                    // Display operating hours
                    if (openingTimeStr && closingTimeStr) {
                        document.getElementById('operatingHoursText').textContent = openingTimeStr + ' - ' + closingTimeStr;
                        document.getElementById('operatingHoursDisplay').classList.remove('hidden');
                    }
                } else {
                    document.getElementById('operatingHoursDisplay').classList.add('hidden');
                }
            });
        }

        // Get current date and time
        const now = new Date();
        const year = now.getFullYear();
        const month = String(now.getMonth() + 1).padStart(2, '0');
        const day = String(now.getDate()).padStart(2, '0');
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        const minDateTime = year + '-' + month + '-' + day + 'T' + hours + ':' + minutes;

        // Set minimum date/time for both inputs
        const startTimeInput = document.getElementById('bookingStartTime');
        const endTimeInput = document.getElementById('bookingEndTime');

        startTimeInput.min = minDateTime;
        endTimeInput.min = minDateTime;

        // Function to check if time is within operating hours
        function isWithinOperatingHours(dateTime) {
            if (!openingTime || !closingTime) return true;

            const selectedHours = dateTime.getHours();
            const selectedMinutes = dateTime.getMinutes();

            const selectedTimeInMinutes = selectedHours * 60 + selectedMinutes;
            const openingTimeInMinutes = openingTime.hours * 60 + openingTime.minutes;
            const closingTimeInMinutes = closingTime.hours * 60 + closingTime.minutes;

            return selectedTimeInMinutes >= openingTimeInMinutes &&
                   selectedTimeInMinutes <= closingTimeInMinutes;
        }

        // Function to format operating hours for display
        function formatOperatingHours() {
            if (!openingTime || !closingTime) return '';
            return String(openingTime.hours).padStart(2, '0') + ':' + String(openingTime.minutes).padStart(2, '0') + ' - ' +
                   String(closingTime.hours).padStart(2, '0') + ':' + String(closingTime.minutes).padStart(2, '0');
        }

        // Function to update booking summary
        function updateBookingSummary() {
            const startTime = new Date(startTimeInput.value);
            const endTime = new Date(endTimeInput.value);

            if (startTimeInput.value && endTimeInput.value && endTime > startTime) {
                const diffMs = endTime - startTime;
                const diffHours = Math.ceil(diffMs / (1000 * 60 * 60));

                document.getElementById('bookingDuration').textContent = diffHours + ' hour(s)';
                document.getElementById('bookingSummary').classList.remove('hidden');
            } else {
                document.getElementById('bookingSummary').classList.add('hidden');
            }
        }

        // Validate start time on change
        startTimeInput.addEventListener('change', function() {
            const startTime = new Date(this.value);
            const currentTime = new Date();

            if (startTime < currentTime) {
                alert('Start time cannot be in the past!');
                this.value = '';
                return;
            }

            if (openingTime && closingTime && !isWithinOperatingHours(startTime)) {
                alert('Start time must be within operating hours: ' + formatOperatingHours());
                this.value = '';
                return;
            }

            endTimeInput.min = this.value;

            if (endTimeInput.value && new Date(endTimeInput.value) <= startTime) {
                endTimeInput.value = '';
            }

            updateBookingSummary();
        });

        // Validate end time on change
        endTimeInput.addEventListener('change', function() {
            const endTime = new Date(this.value);
            const startTime = new Date(startTimeInput.value);
            const currentTime = new Date();

            if (endTime < currentTime) {
                alert('End time cannot be in the past!');
                this.value = '';
                return;
            }

            if (!startTimeInput.value) {
                alert('Please select start time first!');
                this.value = '';
                return;
            }

            if (endTime <= startTime) {
                alert('End time must be after start time!');
                this.value = '';
                return;
            }

            if (openingTime && closingTime && !isWithinOperatingHours(endTime)) {
                alert('End time must be within operating hours: ' + formatOperatingHours());
                this.value = '';
                return;
            }

            const diffMs = endTime - startTime;
            const diffHours = diffMs / (1000 * 60 * 60);

            if (diffHours < 1) {
                alert('Booking duration must be at least 1 hour!');
                this.value = '';
                return;
            }

            updateBookingSummary();
        });

        // Form validation before submit
        const form = document.querySelector('form');
        if (form) {
            form.addEventListener('submit', function(e) {
                const startTime = new Date(startTimeInput.value);
                const endTime = new Date(endTimeInput.value);
                const currentTime = new Date();

                if (startTime < currentTime) {
                    e.preventDefault();
                    alert('Start time cannot be in the past!');
                    return false;
                }

                if (endTime < currentTime) {
                    e.preventDefault();
                    alert('End time cannot be in the past!');
                    return false;
                }

                if (endTime <= startTime) {
                    e.preventDefault();
                    alert('End time must be after start time!');
                    return false;
                }

                if (openingTime && closingTime) {
                    if (!isWithinOperatingHours(startTime)) {
                        e.preventDefault();
                        alert('Start time must be within operating hours: ' + formatOperatingHours());
                        return false;
                    }

                    if (!isWithinOperatingHours(endTime)) {
                        e.preventDefault();
                        alert('End time must be within operating hours: ' + formatOperatingHours());
                        return false;
                    }
                }

                const diffMs = endTime - startTime;
                const diffHours = diffMs / (1000 * 60 * 60);

                if (diffHours < 1) {
                    e.preventDefault();
                    alert('Booking duration must be at least 1 hour!');
                    return false;
                }
            });
        }

        // Reset form handler
        const resetButton = document.querySelector('button[type="reset"]');
        if (resetButton) {
            resetButton.addEventListener('click', function() {
                document.getElementById('bookingSummary').classList.add('hidden');
            });
        }
    </script>

</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>