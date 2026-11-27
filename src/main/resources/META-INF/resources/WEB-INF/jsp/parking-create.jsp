<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Parking Place</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1590674899484-d5640e854abe?q=80&w=2000');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
        .glass-effect {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
        }
        .input-glow:focus {
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.3);
        }
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
        .animate-slide-in {
            animation: slideIn 0.5s ease-out;
        }
    </style>
    <script>
        function validateCoordinates() {
            var latitude = document.getElementById('latitude').value;
            var longitude = document.getElementById('longitude').value;

            if (latitude !== '') {
                var lat = parseFloat(latitude);
                if (isNaN(lat) || lat < -90 || lat > 90) {
                    alert('Latitude must be a number between -90 and 90');
                    return false;
                }
            }

            if (longitude !== '') {
                var lon = parseFloat(longitude);
                if (isNaN(lon) || lon < -180 || lon > 180) {
                    alert('Longitude must be a number between -180 and 180');
                    return false;
                }
            }

            return true;
        }

        function validateContactNumber() {
            var contactNumber = document.getElementById('contactNumber').value;
            var regex = /^\d{10}$/;

            if (!regex.test(contactNumber)) {
                alert('Contact Number must be exactly 10 digits');
                return false;
            }

            return true;
        }

        function validateForm() {
            return validateCoordinates() && validateContactNumber();
        }
    </script>
</head>
<body class="min-h-screen">
    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <!-- Overlay for better readability -->
    <div class="absolute inset-0 bg-gradient-to-br from-blue-900/20 via-purple-900/20 to-pink-900/20 pointer-events-none"></div>

    <div class="relative container mx-auto px-4 py-12 max-w-5xl">
        <!-- Page Header with Glass Effect -->
        <div class="glass-effect rounded-3xl shadow-2xl p-8 mb-8 animate-slide-in border border-white/20">
            <div class="text-center">
                <div class="inline-flex items-center justify-center w-20 h-20 bg-gradient-to-br from-blue-500 to-purple-600 rounded-2xl mb-4 shadow-lg">
                    <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                    </svg>
                </div>
                <h1 class="text-5xl font-bold bg-gradient-to-r from-blue-600 via-purple-600 to-pink-600 bg-clip-text text-transparent mb-3">
                    Create New Parking Place
                </h1>
                <p class="text-slate-600 text-lg font-medium">Transform parking management with cutting-edge technology</p>
            </div>
        </div>

        <!-- Error Message -->
        <c:if test="${not empty error}">
            <div class="glass-effect border-l-4 border-red-500 text-red-700 p-5 mb-8 rounded-2xl shadow-xl animate-slide-in">
                <div class="flex items-center">
                    <div class="flex-shrink-0">
                        <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                        </svg>
                    </div>
                    <span class="ml-3 font-semibold">${error}</span>
                </div>
            </div>
        </c:if>

        <!-- Back Button -->
        <div class="mb-8">
            <a href="${pageContext.request.contextPath}/parking/list" class="inline-flex items-center glass-effect text-blue-600 hover:text-blue-800 font-semibold px-6 py-3 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 transform hover:scale-105 border border-white/20">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                </svg>
                Back to List
            </a>
        </div>

        <!-- Form Card with Glass Effect -->
        <div class="glass-effect rounded-3xl shadow-2xl p-10 mb-8 border border-white/20 animate-slide-in">
            <form action="${pageContext.request.contextPath}/parking/create" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                <div class="space-y-8">

                    <!-- Basic Information Section -->
                    <div class="pb-8 border-b-2 border-gradient-to-r from-blue-200 via-purple-200 to-pink-200">
                        <div class="flex items-center mb-6">
                            <div class="w-12 h-12 bg-gradient-to-br from-blue-500 to-blue-600 rounded-xl flex items-center justify-center mr-4 shadow-lg">
                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                </svg>
                            </div>
                            <h2 class="text-3xl font-bold bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">Basic Information</h2>
                        </div>

                        <div class="grid grid-cols-1 gap-6">
                            <div class="group">
                                <label for="parkingName" class="block text-sm font-bold text-slate-700 mb-2 uppercase tracking-wide">Parking Name / Title</label>
                                <input type="text" id="parkingName" name="parkingName" required class="w-full px-5 py-4 border-2 border-slate-200 rounded-xl focus:ring-4 focus:ring-blue-500/30 focus:border-blue-500 transition-all duration-300 outline-none input-glow hover:border-blue-300 bg-white/80 font-medium">
                            </div>

                            <div class="group">
                                <label for="description" class="block text-sm font-bold text-slate-700 mb-2 uppercase tracking-wide">Description</label>
                                <textarea id="description" name="description" rows="4" class="w-full px-5 py-4 border-2 border-slate-200 rounded-xl focus:ring-4 focus:ring-blue-500/30 focus:border-blue-500 transition-all duration-300 outline-none resize-none input-glow hover:border-blue-300 bg-white/80 font-medium"></textarea>
                            </div>

                            <div class="group">
                                <label for="parkingType" class="block text-sm font-bold text-slate-700 mb-2 uppercase tracking-wide">Parking Type</label>
                                <div class="relative">
                                    <select id="parkingType" name="parkingType" required class="w-full px-5 py-4 border-2 border-slate-200 rounded-xl focus:ring-4 focus:ring-blue-500/30 focus:border-blue-500 transition-all duration-300 outline-none bg-white/80 appearance-none font-medium input-glow hover:border-blue-300">
                                        <option value="">Select Type</option>
                                        <option value="Car Park">Car Park</option>
                                        <option value="Motorbike Park">Motorbike Park</option>
                                        <option value="Truck Park">Truck Park</option>
                                        <option value="All vehicle">All vehicle</option>
                                    </select>
                                    <div class="absolute inset-y-0 right-0 flex items-center px-4 pointer-events-none">
                                        <svg class="w-5 h-5 text-slate-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Location Details Section -->
                    <div class="pb-8 border-b-2 border-gradient-to-r from-purple-200 via-pink-200 to-blue-200">
                        <div class="flex items-center mb-6">
                            <div class="w-12 h-12 bg-gradient-to-br from-purple-500 to-purple-600 rounded-xl flex items-center justify-center mr-4 shadow-lg">
                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                                </svg>
                            </div>
                            <h2 class="text-3xl font-bold bg-gradient-to-r from-purple-600 to-pink-600 bg-clip-text text-transparent">Location Details</h2>
                        </div>

                        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                            <div class="lg:col-span-2 group">
                                <label for="address" class="block text-sm font-bold text-slate-700 mb-2 uppercase tracking-wide">Address</label>
                                <input type="text" id="address" name="address" required class="w-full px-5 py-4 border-2 border-slate-200 rounded-xl focus:ring-4 focus:ring-purple-500/30 focus:border-purple-500 transition-all duration-300 outline-none input-glow hover:border-purple-300 bg-white/80 font-medium">
                            </div>

                            <div class="group">
                                <label for="city" class="block text-sm font-bold text-slate-700 mb-2 uppercase tracking-wide">City/Town</label>
                                <input type="text" id="city" name="city" required class="w-full px-5 py-4 border-2 border-slate-200 rounded-xl focus:ring-4 focus:ring-purple-500/30 focus:border-purple-500 transition-all duration-300 outline-none input-glow hover:border-purple-300 bg-white/80 font-medium">
                            </div>

                            <div class="group">
                                <label for="district" class="block text-sm font-bold text-slate-700 mb-2 uppercase tracking-wide">District</label>
                                <input type="text" id="district" name="district" required class="w-full px-5 py-4 border-2 border-slate-200 rounded-xl focus:ring-4 focus:ring-purple-500/30 focus:border-purple-500 transition-all duration-300 outline-none input-glow hover:border-purple-300 bg-white/80 font-medium">
                            </div>

                            <div class="group">
                                <label for="latitude" class="block text-sm font-bold text-slate-700 mb-2 uppercase tracking-wide">Latitude</label>
                                <input type="number" id="latitude" name="latitude" step="0.000001" min="-90" max="90" class="w-full px-5 py-4 border-2 border-slate-200 rounded-xl focus:ring-4 focus:ring-purple-500/30 focus:border-purple-500 transition-all duration-300 outline-none input-glow hover:border-purple-300 bg-white/80 font-medium">
                            </div>

                            <div class="group">
                                <label for="longitude" class="block text-sm font-bold text-slate-700 mb-2 uppercase tracking-wide">Longitude</label>
                                <input type="number" id="longitude" name="longitude" step="0.000001" min="-180" max="180" class="w-full px-5 py-4 border-2 border-slate-200 rounded-xl focus:ring-4 focus:ring-purple-500/30 focus:border-purple-500 transition-all duration-300 outline-none input-glow hover:border-purple-300 bg-white/80 font-medium">
                            </div>
                        </div>
                    </div>

                    <!-- Parking Details Section -->
                    <div class="pb-8 border-b-2 border-gradient-to-r from-pink-200 via-blue-200 to-purple-200">
                        <div class="flex items-center mb-6">
                            <div class="w-12 h-12 bg-gradient-to-br from-pink-500 to-pink-600 rounded-xl flex items-center justify-center mr-4 shadow-lg">
                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                                </svg>
                            </div>
                            <h2 class="text-3xl font-bold bg-gradient-to-r from-pink-600 to-blue-600 bg-clip-text text-transparent">Parking Details</h2>
                        </div>

                        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                            <div class="group">
                                <label for="availableSlots" class="block text-sm font-bold text-slate-700 mb-2 uppercase tracking-wide">Available Slots</label>
                                <input type="number" id="availableSlots" name="availableSlots" required min="1" class="w-full px-5 py-4 border-2 border-slate-200 rounded-xl focus:ring-4 focus:ring-pink-500/30 focus:border-pink-500 transition-all duration-300 outline-none input-glow hover:border-pink-300 bg-white/80 font-medium">
                            </div>

                            <div class="group">
                                <label for="hourlyRate" class="block text-sm font-bold text-slate-700 mb-2 uppercase tracking-wide">Hourly Rate (Rs.)</label>
                                <input type="number" id="hourlyRate" name="hourlyRate" required min="0" step="0.01" class="w-full px-5 py-4 border-2 border-slate-200 rounded-xl focus:ring-4 focus:ring-pink-500/30 focus:border-pink-500 transition-all duration-300 outline-none input-glow hover:border-pink-300 bg-white/80 font-medium">
                            </div>

                            <div class="group">
                                <label for="openingTime" class="block text-sm font-bold text-slate-700 mb-2 uppercase tracking-wide">Opening Time</label>
                                <input type="time" id="openingTime" name="openingTime" required class="w-full px-5 py-4 border-2 border-slate-200 rounded-xl focus:ring-4 focus:ring-pink-500/30 focus:border-pink-500 transition-all duration-300 outline-none input-glow hover:border-pink-300 bg-white/80 font-medium">
                            </div>

                            <div class="group">
                                <label for="closingTime" class="block text-sm font-bold text-slate-700 mb-2 uppercase tracking-wide">Closing Time</label>
                                <input type="time" id="closingTime" name="closingTime" required class="w-full px-5 py-4 border-2 border-slate-200 rounded-xl focus:ring-4 focus:ring-pink-500/30 focus:border-pink-500 transition-all duration-300 outline-none input-glow hover:border-pink-300 bg-white/80 font-medium">
                            </div>

                            <div class="lg:col-span-2">
                                <label class="block text-sm font-bold text-slate-700 mb-3 uppercase tracking-wide">EV Charging Available</label>
                                <div class="flex items-center space-x-8">
                                    <div class="flex items-center group cursor-pointer">
                                        <div class="relative">
                                            <input type="radio" id="evYes" name="evChargingAvailable" value="true" class="w-6 h-6 text-pink-600 border-2 border-slate-300 focus:ring-4 focus:ring-pink-500/30 cursor-pointer">
                                        </div>
                                        <label for="evYes" class="ml-3 text-base font-bold text-slate-700 cursor-pointer group-hover:text-pink-600 transition-colors">Yes</label>
                                    </div>
                                    <div class="flex items-center group cursor-pointer">
                                        <div class="relative">
                                            <input type="radio" id="evNo" name="evChargingAvailable" value="false" checked class="w-6 h-6 text-pink-600 border-2 border-slate-300 focus:ring-4 focus:ring-pink-500/30 cursor-pointer">
                                        </div>
                                        <label for="evNo" class="ml-3 text-base font-bold text-slate-700 cursor-pointer group-hover:text-pink-600 transition-colors">No</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Additional Information Section -->
                    <div>
                        <div class="flex items-center mb-6">
                            <div class="w-12 h-12 bg-gradient-to-br from-blue-500 to-purple-600 rounded-xl flex items-center justify-center mr-4 shadow-lg">
                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                                </svg>
                            </div>
                            <h2 class="text-3xl font-bold bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">Additional Information</h2>
                        </div>

                        <div class="grid grid-cols-1 gap-6">
                            <div class="group">
                                <label for="images" class="block text-sm font-bold text-slate-700 mb-2 uppercase tracking-wide">Upload Parking Images</label>
                                <div class="relative">
                                    <input type="file" id="images" name="images" multiple accept="image/*" class="w-full px-5 py-4 border-2 border-dashed border-slate-300 rounded-xl focus:ring-4 focus:ring-blue-500/30 focus:border-blue-500 transition-all duration-300 outline-none bg-white/80 file:mr-4 file:py-3 file:px-6 file:rounded-lg file:border-0 file:text-sm file:font-bold file:bg-gradient-to-r file:from-blue-500 file:to-purple-600 file:text-white hover:file:from-blue-600 hover:file:to-purple-700 file:transition-all file:duration-300 file:shadow-lg hover:border-blue-400 cursor-pointer">
                                </div>
                                <p class="mt-3 text-sm text-slate-600 font-medium flex items-center">
                                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                    </svg>
                                    You can select multiple images
                                </p>
                            </div>

                            <div class="group">
                                <label for="contactNumber" class="block text-sm font-bold text-slate-700 mb-2 uppercase tracking-wide">Contact Number</label>
                                <input type="text" id="contactNumber" name="contactNumber" required pattern="\d{10}" maxlength="10" class="w-full px-5 py-4 border-2 border-slate-200 rounded-xl focus:ring-4 focus:ring-blue-500/30 focus:border-blue-500 transition-all duration-300 outline-none input-glow hover:border-blue-300 bg-white/80 font-medium">
                            </div>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="flex flex-col sm:flex-row gap-5 pt-8">
                        <button type="submit" class="flex-1 bg-gradient-to-r from-blue-600 via-purple-600 to-pink-600 hover:from-blue-700 hover:via-purple-700 hover:to-pink-700 text-white font-bold py-5 px-8 rounded-xl shadow-2xl hover:shadow-3xl transition-all duration-300 transform hover:scale-105 text-lg uppercase tracking-wide flex items-center justify-center">
                            <svg class="w-6 h-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                            </svg>
                            Create Parking Place
                        </button>
                        <button type="reset" class="flex-1 bg-gradient-to-r from-slate-200 to-slate-300 hover:from-slate-300 hover:to-slate-400 text-slate-800 font-bold py-5 px-8 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 transform hover:scale-105 text-lg uppercase tracking-wide flex items-center justify-center">
                            <svg class="w-6 h-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
                            </svg>
                            Reset
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>