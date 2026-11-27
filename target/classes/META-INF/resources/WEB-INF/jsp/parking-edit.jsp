<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Parking Place</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('https://cdn.pixabay.com/photo/2016/03/22/00/45/multi-storey-car-park-1271919_1280.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            z-index: -2;
        }
        body::after {
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

    <div class="container mx-auto px-4 py-8 max-w-5xl">
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-4xl font-bold text-white mb-2">Edit Parking Place</h1>
            <p class="text-slate-200">Update parking place information and manage availability</p>
        </div>

        <!-- Error Message -->
        <c:if test="${not empty error}">
            <div class="bg-red-50 border-l-4 border-red-500 text-red-700 p-4 mb-6 rounded-lg shadow-sm">
                <div class="flex items-center">
                    <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                    </svg>
                    <span>${error}</span>
                </div>
            </div>
        </c:if>

        <!-- Back Button -->
        <div class="mb-6">
            <a href="${pageContext.request.contextPath}/parking/list"
               class="inline-flex items-center px-4 py-2 bg-white border border-slate-300 rounded-lg text-slate-700 hover:bg-slate-50 hover:border-slate-400 transition-all duration-200 shadow-sm">
                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                </svg>
                Back to List
            </a>
        </div>

        <!-- Form Card -->
        <div class="bg-white rounded-2xl shadow-2xl overflow-hidden backdrop-blur-sm bg-opacity-95">
            <form action="${pageContext.request.contextPath}/parking/edit/${parkingPlace.id}" method="post" enctype="multipart/form-data">

                <!-- Basic Information Section -->
                <div class="bg-gradient-to-r from-blue-600 to-blue-700 px-8 py-4">
                    <h2 class="text-2xl font-semibold text-white flex items-center">
                        <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                        </svg>
                        Basic Information
                    </h2>
                </div>
                <div class="p-8 grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="md:col-span-2">
                        <label for="parkingName" class="block text-sm font-semibold text-slate-700 mb-2">Parking Name / Title *</label>
                        <input type="text" id="parkingName" name="parkingName" value="${parkingPlace.parkingName}" required
                               class="w-full px-4 py-3 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none">
                    </div>

                    <div class="md:col-span-2">
                        <label for="description" class="block text-sm font-semibold text-slate-700 mb-2">Description</label>
                        <textarea id="description" name="description" rows="4"
                                  class="w-full px-4 py-3 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none resize-none">${parkingPlace.description}</textarea>
                    </div>

                    <div>
                        <label for="parkingType" class="block text-sm font-semibold text-slate-700 mb-2">Parking Type *</label>
                        <select id="parkingType" name="parkingType" required
                                class="w-full px-4 py-3 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none bg-white">
                            <option value="">Select Type</option>
                            <option value="Car Park" ${parkingPlace.parkingType == 'Car Park' ? 'selected' : ''}>Car Park</option>
                            <option value="Motorbike Park" ${parkingPlace.parkingType == 'Motorbike Park' ? 'selected' : ''}>Motorbike Park</option>
                            <option value="Truck Park" ${parkingPlace.parkingType == 'Truck Park' ? 'selected' : ''}>Truck Park</option>
                            <option value="All vehicle" ${parkingPlace.parkingType == 'All vehicle' ? 'selected' : ''}>All vehicle</option>
                        </select>
                    </div>

                    <div>
                        <label for="contactNumber" class="block text-sm font-semibold text-slate-700 mb-2">Contact Number *</label>
                        <input type="text" id="contactNumber" name="contactNumber" value="${parkingPlace.contactNumber}" required
                               class="w-full px-4 py-3 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none">
                    </div>
                </div>

                <!-- Location Section -->
                <div class="bg-gradient-to-r from-green-600 to-green-700 px-8 py-4">
                    <h2 class="text-2xl font-semibold text-white flex items-center">
                        <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                        </svg>
                        Location Details
                    </h2>
                </div>
                <div class="p-8 grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="md:col-span-2">
                        <label for="address" class="block text-sm font-semibold text-slate-700 mb-2">Address *</label>
                        <input type="text" id="address" name="address" value="${parkingPlace.address}" required
                               class="w-full px-4 py-3 border border-slate-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent transition-all duration-200 outline-none">
                    </div>

                    <div>
                        <label for="city" class="block text-sm font-semibold text-slate-700 mb-2">City/Town *</label>
                        <input type="text" id="city" name="city" value="${parkingPlace.city}" required
                               class="w-full px-4 py-3 border border-slate-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent transition-all duration-200 outline-none">
                    </div>

                    <div>
                        <label for="district" class="block text-sm font-semibold text-slate-700 mb-2">District *</label>
                        <input type="text" id="district" name="district" value="${parkingPlace.district}" required
                               class="w-full px-4 py-3 border border-slate-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent transition-all duration-200 outline-none">
                    </div>

                    <div>
                        <label for="latitude" class="block text-sm font-semibold text-slate-700 mb-2">Latitude</label>
                        <input type="number" id="latitude" name="latitude" value="${parkingPlace.latitude}" step="0.000001"
                               class="w-full px-4 py-3 border border-slate-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent transition-all duration-200 outline-none">
                    </div>

                    <div>
                        <label for="longitude" class="block text-sm font-semibold text-slate-700 mb-2">Longitude</label>
                        <input type="number" id="longitude" name="longitude" value="${parkingPlace.longitude}" step="0.000001"
                               class="w-full px-4 py-3 border border-slate-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent transition-all duration-200 outline-none">
                    </div>
                </div>

                <!-- Capacity & Pricing Section -->
                <div class="bg-gradient-to-r from-purple-600 to-purple-700 px-8 py-4">
                    <h2 class="text-2xl font-semibold text-white flex items-center">
                        <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z"/>
                        </svg>
                        Capacity & Pricing
                    </h2>
                </div>
                <div class="p-8 grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label for="totalSlots" class="block text-sm font-semibold text-slate-700 mb-2">Total Slots *</label>
                        <input type="number" id="totalSlots" name="totalSlots" value="${parkingPlace.totalSlots}" required min="1"
                               class="w-full px-4 py-3 border border-slate-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent transition-all duration-200 outline-none">
                    </div>

                    <div>
                        <label class="block text-sm font-semibold text-slate-700 mb-2">Current Available Slots</label>
                        <div class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-lg text-slate-700 font-medium">
                            ${parkingPlace.availableSlots}
                        </div>
                    </div>

                    <div>
                        <label for="hourlyRate" class="block text-sm font-semibold text-slate-700 mb-2">Hourly Rate (Rs.) *</label>
                        <input type="number" id="hourlyRate" name="hourlyRate" value="${parkingPlace.hourlyRate}" required min="0" step="0.01"
                               class="w-full px-4 py-3 border border-slate-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent transition-all duration-200 outline-none">
                    </div>
                </div>

                <!-- Operating Hours Section -->
                <div class="bg-gradient-to-r from-orange-600 to-orange-700 px-8 py-4">
                    <h2 class="text-2xl font-semibold text-white flex items-center">
                        <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                        </svg>
                        Operating Hours
                    </h2>
                </div>
                <div class="p-8 grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label for="openingTime" class="block text-sm font-semibold text-slate-700 mb-2">Opening Time *</label>
                        <input type="time" id="openingTime" name="openingTime" value="${parkingPlace.openingTime}" required
                               class="w-full px-4 py-3 border border-slate-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-transparent transition-all duration-200 outline-none">
                    </div>

                    <div>
                        <label for="closingTime" class="block text-sm font-semibold text-slate-700 mb-2">Closing Time *</label>
                        <input type="time" id="closingTime" name="closingTime" value="${parkingPlace.closingTime}" required
                               class="w-full px-4 py-3 border border-slate-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-transparent transition-all duration-200 outline-none">
                    </div>
                </div>

                <!-- Amenities Section -->
                <div class="bg-gradient-to-r from-teal-600 to-teal-700 px-8 py-4">
                    <h2 class="text-2xl font-semibold text-white flex items-center">
                        <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"/>
                        </svg>
                        Amenities
                    </h2>
                </div>
                <div class="p-8">
                    <label class="block text-sm font-semibold text-slate-700 mb-3">EV Charging Available</label>
                    <div class="flex gap-6">
                        <label class="flex items-center cursor-pointer group">
                            <input type="radio" id="evYes" name="evChargingAvailable" value="true" ${parkingPlace.evChargingAvailable ? 'checked' : ''}
                                   class="w-5 h-5 text-teal-600 focus:ring-2 focus:ring-teal-500 cursor-pointer">
                            <span class="ml-2 text-slate-700 group-hover:text-teal-600 transition-colors duration-200">Yes</span>
                        </label>
                        <label class="flex items-center cursor-pointer group">
                            <input type="radio" id="evNo" name="evChargingAvailable" value="false" ${!parkingPlace.evChargingAvailable ? 'checked' : ''}
                                   class="w-5 h-5 text-teal-600 focus:ring-2 focus:ring-teal-500 cursor-pointer">
                            <span class="ml-2 text-slate-700 group-hover:text-teal-600 transition-colors duration-200">No</span>
                        </label>
                    </div>
                </div>

                <!-- Images Section -->
                <div class="bg-gradient-to-r from-pink-600 to-pink-700 px-8 py-4">
                    <h2 class="text-2xl font-semibold text-white flex items-center">
                        <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                        </svg>
                        Images
                    </h2>
                </div>
                <div class="p-8 space-y-6">
                    <div>
                        <label class="block text-sm font-semibold text-slate-700 mb-2">Current Images</label>
                        <div class="p-4 bg-slate-50 border border-slate-200 rounded-lg">
                            <c:if test="${not empty parkingPlace.parkingImages}">
                                <span class="text-slate-700">${parkingPlace.parkingImages}</span>
                            </c:if>
                            <c:if test="${empty parkingPlace.parkingImages}">
                                <span class="text-slate-500 italic">No images uploaded</span>
                            </c:if>
                        </div>
                    </div>

                    <div>
                        <label for="images" class="block text-sm font-semibold text-slate-700 mb-2">Upload New Images</label>
                        <input type="file" id="images" name="images" multiple accept="image/*"
                               class="w-full px-4 py-3 border border-slate-300 rounded-lg focus:ring-2 focus:ring-pink-500 focus:border-transparent transition-all duration-200 outline-none file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-pink-50 file:text-pink-700 hover:file:bg-pink-100 cursor-pointer">
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="bg-slate-50 px-8 py-6 border-t border-slate-200 flex flex-col sm:flex-row gap-4 justify-end">
                    <a href="${pageContext.request.contextPath}/parking/list"
                       class="inline-flex items-center justify-center px-6 py-3 border border-slate-300 rounded-lg text-slate-700 bg-white hover:bg-slate-50 hover:border-slate-400 transition-all duration-200 font-medium shadow-sm">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                        </svg>
                        Cancel
                    </a>
                    <button type="submit"
                            class="inline-flex items-center justify-center px-6 py-3 bg-gradient-to-r from-blue-600 to-blue-700 text-white rounded-lg hover:from-blue-700 hover:to-blue-800 transition-all duration-200 font-medium shadow-lg hover:shadow-xl transform hover:-translate-y-0.5">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                        </svg>
                        Update Parking Place
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>