<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Vehicle</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes slideIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .animate-slideIn {
            animation: slideIn 0.5s ease-out;
        }
        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .input-focus {
            transition: all 0.3s ease;
        }
        .input-focus:focus {
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(102, 126, 234, 0.2);
        }
    </style>
</head>
<body class="relative min-h-screen font-sans text-gray-900">
    <!-- 🔹 Background Image with Dark Overlay -->
    <div class="fixed inset-0 bg-cover bg-center bg-no-repeat -z-10"
         style="background-image: url('https://cdn.pixabay.com/photo/2017/10/03/15/48/car-2812914_1280.jpg');">
    </div>
    <div class="fixed inset-0 bg-black bg-opacity-60 -z-10"></div>

    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <!-- 🔹 Page Content -->
    <div class="relative z-0">
        <div class="container mx-auto px-4 py-8 max-w-4xl">
            <!-- Page Title -->
            <div class="mb-8 animate-slideIn">
                <div class="flex items-center gap-4 mb-6">
                    <div class="w-16 h-16 rounded-2xl gradient-bg flex items-center justify-center shadow-lg">
                        <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                        </svg>
                    </div>
                    <div>
                        <h1 class="text-5xl font-extrabold bg-gradient-to-r from-purple-600 to-blue-600 bg-clip-text text-transparent">Edit Vehicle</h1>
                    </div>
                </div>
            </div>

            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="animate-slideIn bg-gradient-to-r from-red-50 to-pink-50 border-l-4 border-red-500 text-red-800 p-5 mb-6 rounded-xl shadow-md">
                    <div class="flex items-center">
                        <div class="w-10 h-10 bg-red-500 rounded-full flex items-center justify-center mr-3 shadow-sm">
                            <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                            </svg>
                        </div>
                        <span class="font-semibold text-base">${error}</span>
                    </div>
                </div>
            </c:if>

            <!-- Back to List Link -->
            <div class="mb-6 animate-slideIn">
                <a href="${pageContext.request.contextPath}/vehicle/list" class="inline-flex items-center px-5 py-3 bg-white text-gray-700 font-semibold rounded-xl shadow-md hover:shadow-lg transition-all duration-300 transform hover:scale-105 border border-gray-200">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                    </svg>
                    Back to List
                </a>
            </div>

            <hr class="border-t-2 border-gray-200 mb-8">

            <!-- Form Container -->
            <div class="bg-white rounded-2xl shadow-2xl overflow-hidden border border-gray-100 animate-slideIn">
                <div class="p-8">
                    <form action="${pageContext.request.contextPath}/vehicle/edit/${vehicle.id}" method="post">
                        <table class="w-full">
                            <tr>
                                <td class="pb-6 align-top pt-3">
                                    <label for="vehicleNumber" class="block text-sm font-bold text-gray-800 mb-2">
                                        Vehicle Number:
                                        <span class="text-red-500">*</span>
                                    </label>
                                </td>
                                <td class="pb-6">
                                    <input type="text" id="vehicleNumber" name="vehicleNumber" value="${vehicle.vehicleNumber}" required size="30"
                                           class="input-focus w-full px-4 py-3 bg-gray-50 border-2 border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-transparent text-gray-800 font-medium">
                                </td>
                            </tr>
                            <tr>
                                <td class="pb-6 align-top pt-3">
                                    <label for="vehicleType" class="block text-sm font-bold text-gray-800 mb-2">
                                        Vehicle Type:
                                        <span class="text-red-500">*</span>
                                    </label>
                                </td>
                                <td class="pb-6">
                                    <select id="vehicleType" name="vehicleType" required
                                            class="input-focus w-full px-4 py-3 bg-gray-50 border-2 border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-transparent text-gray-800 font-medium appearance-none cursor-pointer bg-no-repeat bg-right"
                                            style="background-image: url('data:image/svg+xml;charset=UTF-8,%3csvg xmlns=%27http://www.w3.org/2000/svg%27 viewBox=%270 0 24 24%27 fill=%27none%27 stroke=%27currentColor%27 stroke-width=%272%27 stroke-linecap=%27round%27 stroke-linejoin=%27round%27%3e%3cpolyline points=%276 9 12 15 18 9%27%3e%3c/polyline%3e%3c/svg%3e'); background-position: right 0.75rem center; background-size: 1.25rem;">
                                        <option value="">Select Type</option>
                                        <option value="Car" ${vehicle.vehicleType == 'Car' ? 'selected' : ''}>Car</option>
                                        <option value="Motorbike" ${vehicle.vehicleType == 'Motorbike' ? 'selected' : ''}>Motorbike</option>
                                        <option value="Truck" ${vehicle.vehicleType == 'Truck' ? 'selected' : ''}>Truck</option>
                                        <option value="Van" ${vehicle.vehicleType == 'Van' ? 'selected' : ''}>Van</option>
                                        <option value="SUV" ${vehicle.vehicleType == 'SUV' ? 'selected' : ''}>SUV</option>
                                        <option value="Other" ${vehicle.vehicleType == 'Other' ? 'selected' : ''}>Other</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="pb-6 align-top pt-3">
                                    <label for="vehicleBrand" class="block text-sm font-bold text-gray-800 mb-2">
                                        Vehicle Brand:
                                        <span class="text-red-500">*</span>
                                    </label>
                                </td>
                                <td class="pb-6">
                                    <input type="text" id="vehicleBrand" name="vehicleBrand" value="${vehicle.vehicleBrand}" required size="30"
                                           class="input-focus w-full px-4 py-3 bg-gray-50 border-2 border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-transparent text-gray-800 font-medium">
                                </td>
                            </tr>
                            <tr>
                                <td class="pb-6 align-top pt-3">
                                    <label for="vehicleModel" class="block text-sm font-bold text-gray-800 mb-2">
                                        Vehicle Model:
                                        <span class="text-red-500">*</span>
                                    </label>
                                </td>
                                <td class="pb-6">
                                    <input type="text" id="vehicleModel" name="vehicleModel" value="${vehicle.vehicleModel}" required size="30"
                                           class="input-focus w-full px-4 py-3 bg-gray-50 border-2 border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-transparent text-gray-800 font-medium">
                                </td>
                            </tr>
                            <tr>
                                <td class="pb-6 align-top pt-3">
                                    <label for="vehicleColor" class="block text-sm font-bold text-gray-800 mb-2">
                                        Vehicle Color:
                                    </label>
                                </td>
                                <td class="pb-6">
                                    <input type="text" id="vehicleColor" name="vehicleColor" value="${vehicle.vehicleColor}" size="30"
                                           class="input-focus w-full px-4 py-3 bg-gray-50 border-2 border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-transparent text-gray-800 font-medium">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="pt-6">
                                    <div class="flex gap-4">
                                        <button type="submit"
                                                class="flex-1 inline-flex justify-center items-center px-6 py-4 bg-gradient-to-r from-purple-600 to-blue-600 text-white text-base font-bold rounded-xl hover:from-purple-700 hover:to-blue-700 transition-all duration-300 shadow-lg hover:shadow-xl transform hover:scale-105">
                                            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                                            </svg>
                                            Update Vehicle
                                        </button>
                                        <a href="${pageContext.request.contextPath}/vehicle/list" class="flex-1">
                                            <button type="button"
                                                    class="w-full inline-flex justify-center items-center px-6 py-4 bg-gray-200 text-gray-800 text-base font-bold rounded-xl hover:bg-gray-300 transition-all duration-300 shadow-md hover:shadow-lg transform hover:scale-105">
                                                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                                                </svg>
                                                Cancel
                                            </button>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>

            <!-- Helper Text -->
            <div class="mt-6 text-center text-sm text-gray-600">
                <p class="flex items-center justify-center gap-1">
                    <span class="text-red-500 font-bold">*</span>
                    <span>Required fields</span>
                </p>
            </div>
        </div>
    </div>
</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>