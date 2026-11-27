<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Vehicles</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .animate-fadeIn {
            animation: fadeIn 0.5s ease-out;
        }
        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .glass-effect {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
        }
        .card-hover {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .card-hover:hover {
            transform: translateY(-4px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }
    </style>
</head>
<body class="relative min-h-screen font-sans text-gray-900">

    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <!-- 🔹 Page Content -->
    <div class="relative z-0">
        <div class="container mx-auto px-4 py-8 max-w-7xl">
            <!-- Page Header with Gradient -->
                    <div class="mb-10">
                        <div class="relative overflow-hidden rounded-2xl gradient-bg p-8 shadow-2xl">
                            <div class="absolute top-0 right-0 -mt-4 -mr-4 w-32 h-32 bg-white opacity-10 rounded-full"></div>
                            <div class="absolute bottom-0 left-0 -mb-8 -ml-8 w-40 h-40 bg-white opacity-10 rounded-full"></div>
                            <div class="relative z-10">
                                <h1 class="text-5xl font-extrabold text-white mb-3 tracking-tight">My Vehicles</h1>
                                <p class="text-purple-100 text-lg font-medium">Manage and view all your vehicles in one place</p>
                            </div>
                        </div>
                    </div>

            <!-- Success Message -->
            <c:if test="${not empty message}">
                <div class="animate-fadeIn bg-gradient-to-r from-green-50 to-emerald-50 border-l-4 border-green-500 text-green-800 p-5 mb-6 rounded-xl shadow-md">
                    <div class="flex items-center">
                        <div class="w-10 h-10 bg-green-500 rounded-full flex items-center justify-center mr-3 shadow-sm">
                            <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                            </svg>
                        </div>
                        <span class="font-semibold text-base">${message}</span>
                    </div>
                </div>
            </c:if>

            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="animate-fadeIn bg-gradient-to-r from-red-50 to-pink-50 border-l-4 border-red-500 text-red-800 p-5 mb-6 rounded-xl shadow-md">
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

            <!-- Content Section -->
            <div class="glass-effect rounded-2xl shadow-2xl overflow-hidden border border-gray-100 animate-fadeIn">
                <c:choose>
                    <c:when test="${empty vehicles}">
                        <div class="text-center py-20 px-4">
                            <div class="w-32 h-32 mx-auto mb-6 rounded-full bg-gradient-to-br from-purple-100 to-blue-100 flex items-center justify-center">
                                <svg class="h-16 w-16 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 17v-6a2 2 0 012-2h2a2 2 0 012 2v6M3 7h18M5 7v12a2 2 0 002 2h10a2 2 0 002-2V7"/>
                                </svg>
                            </div>
                            <p class="text-2xl text-gray-700 font-bold mb-2">No vehicles registered</p>
                            <p class="text-gray-500">Register your first vehicle to get started!</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- Desktop Table View -->
                        <div class="hidden md:block overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead class="bg-gradient-to-r from-gray-50 to-gray-100">
                                    <tr>
                                        <th class="px-6 py-5 text-left text-xs font-extrabold text-gray-700 uppercase tracking-wider">ID</th>
                                        <th class="px-6 py-5 text-left text-xs font-extrabold text-gray-700 uppercase tracking-wider">Vehicle Number</th>
                                        <th class="px-6 py-5 text-left text-xs font-extrabold text-gray-700 uppercase tracking-wider">Vehicle Type</th>
                                        <th class="px-6 py-5 text-left text-xs font-extrabold text-gray-700 uppercase tracking-wider">Brand</th>
                                        <th class="px-6 py-5 text-left text-xs font-extrabold text-gray-700 uppercase tracking-wider">Model</th>
                                        <th class="px-6 py-5 text-left text-xs font-extrabold text-gray-700 uppercase tracking-wider">Color</th>
                                        <th class="px-6 py-5 text-left text-xs font-extrabold text-gray-700 uppercase tracking-wider">Actions</th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-100">
                                    <c:forEach var="vehicle" items="${vehicles}">
                                        <tr class="hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 transition-all duration-300">
                                            <td class="px-6 py-5 whitespace-nowrap">
                                                <span class="inline-flex items-center justify-center w-8 h-8 rounded-full bg-gradient-to-br from-purple-500 to-blue-500 text-white text-xs font-bold">${vehicle.id}</span>
                                            </td>
                                            <td class="px-6 py-5 whitespace-nowrap">
                                                <span class="text-sm font-bold text-gray-900 bg-gradient-to-r from-purple-600 to-blue-600 bg-clip-text text-transparent">${vehicle.vehicleNumber}</span>
                                            </td>
                                            <td class="px-6 py-5 whitespace-nowrap">
                                                <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-gradient-to-r from-blue-100 to-purple-100 text-blue-800">${vehicle.vehicleType}</span>
                                            </td>
                                            <td class="px-6 py-5 whitespace-nowrap text-sm font-medium text-gray-700">${vehicle.vehicleBrand}</td>
                                            <td class="px-6 py-5 whitespace-nowrap text-sm font-medium text-gray-700">${vehicle.vehicleModel}</td>
                                            <td class="px-6 py-5 whitespace-nowrap">
                                                <span class="inline-flex items-center px-3 py-1.5 rounded-full bg-gray-50 border border-gray-200">
                                                    <span class="w-4 h-4 rounded-full mr-2 border-2 border-white shadow-sm" style="background-color: ${vehicle.vehicleColor}"></span>
                                                    <span class="text-xs font-medium text-gray-700">${vehicle.vehicleColor}</span>
                                                </span>
                                            </td>
                                            <td class="px-6 py-5 whitespace-nowrap text-sm font-medium space-x-2">
                                                <a href="${pageContext.request.contextPath}/vehicle/edit/${vehicle.id}"
                                                   class="inline-flex items-center px-4 py-2 bg-gradient-to-r from-blue-600 to-blue-700 text-white rounded-lg hover:from-blue-700 hover:to-blue-800 transition-all duration-300 shadow-md hover:shadow-lg transform hover:scale-105">
                                                    <svg class="w-4 h-4 mr-1.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                                                    </svg>
                                                    Edit
                                                </a>
                                                <a href="${pageContext.request.contextPath}/vehicle/delete/${vehicle.id}"
                                                   onclick="return confirm('Are you sure you want to delete this vehicle?')"
                                                   class="inline-flex items-center px-4 py-2 bg-gradient-to-r from-red-600 to-red-700 text-white rounded-lg hover:from-red-700 hover:to-red-800 transition-all duration-300 shadow-md hover:shadow-lg transform hover:scale-105">
                                                    <svg class="w-4 h-4 mr-1.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                                                    </svg>
                                                    Delete
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Mobile Card View -->
                        <div class="md:hidden divide-y divide-gray-200">
                            <c:forEach var="vehicle" items="${vehicles}">
                                <div class="p-5 hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 transition-all duration-300">
                                    <div class="flex justify-between items-start mb-4">
                                        <div>
                                            <p class="text-xl font-extrabold bg-gradient-to-r from-purple-600 to-blue-600 bg-clip-text text-transparent mb-1">${vehicle.vehicleNumber}</p>
                                            <div class="inline-flex items-center justify-center px-2.5 py-1 rounded-full bg-gradient-to-r from-purple-500 to-blue-500 text-white text-xs font-bold">
                                                ID: ${vehicle.id}
                                            </div>
                                        </div>
                                        <span class="inline-flex items-center px-3 py-1.5 rounded-full text-xs font-bold bg-gradient-to-r from-blue-100 to-purple-100 text-blue-800 shadow-sm">
                                            ${vehicle.vehicleType}
                                        </span>
                                    </div>
                                    <div class="space-y-3 mb-4 bg-gradient-to-r from-gray-50 to-blue-50 p-4 rounded-xl">
                                        <p class="text-sm flex items-center">
                                            <span class="font-bold text-gray-800 mr-2 w-16">Brand:</span>
                                            <span class="text-gray-700 font-medium">${vehicle.vehicleBrand}</span>
                                        </p>
                                        <p class="text-sm flex items-center">
                                            <span class="font-bold text-gray-800 mr-2 w-16">Model:</span>
                                            <span class="text-gray-700 font-medium">${vehicle.vehicleModel}</span>
                                        </p>
                                        <p class="text-sm flex items-center">
                                            <span class="font-bold text-gray-800 mr-2 w-16">Color:</span>
                                            <span class="inline-flex items-center px-3 py-1 rounded-full bg-white border border-gray-200 shadow-sm">
                                                <span class="w-4 h-4 rounded-full mr-2 border-2 border-gray-300 shadow-sm" style="background-color: ${vehicle.vehicleColor}"></span>
                                                <span class="text-gray-700 font-medium text-xs">${vehicle.vehicleColor}</span>
                                            </span>
                                        </p>
                                    </div>
                                    <div class="flex gap-3">
                                        <a href="${pageContext.request.contextPath}/vehicle/edit/${vehicle.id}"
                                           class="flex-1 inline-flex justify-center items-center px-4 py-3 bg-gradient-to-r from-blue-600 to-blue-700 text-white text-sm font-semibold rounded-xl hover:from-blue-700 hover:to-blue-800 transition-all duration-300 shadow-md hover:shadow-lg transform hover:scale-105">
                                            <svg class="w-4 h-4 mr-1.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                                            </svg>
                                            Edit
                                        </a>
                                        <a href="${pageContext.request.contextPath}/vehicle/delete/${vehicle.id}"
                                           onclick="return confirm('Are you sure you want to delete this vehicle?')"
                                           class="flex-1 inline-flex justify-center items-center px-4 py-3 bg-gradient-to-r from-red-600 to-red-700 text-white text-sm font-semibold rounded-xl hover:from-red-700 hover:to-red-800 transition-all duration-300 shadow-md hover:shadow-lg transform hover:scale-105">
                                            <svg class="w-4 h-4 mr-1.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                                            </svg>
                                            Delete
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>