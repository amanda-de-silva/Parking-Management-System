<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Parking Places</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .animate-fadeIn {
            animation: fadeIn 0.5s ease-out;
        }
        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .animate-slideUp {
            animation: slideUp 0.6s ease-out;
        }
        .gradient-purple {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .gradient-blue {
            background: linear-gradient(135deg, #667eea 0%, #4facfe 100%);
        }
        .table-row-hover {
            transition: all 0.3s ease;
        }
        .table-row-hover:hover {
            background: linear-gradient(90deg, #f9fafb 0%, #ede9fe 100%);
            transform: scale(1.01);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 via-purple-50 to-blue-50 min-h-screen">
    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 sm:py-12">
        <!-- Page Header -->
        <div class="mb-8 animate-fadeIn">
            <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
                <div>
                    <h1 class="text-4xl sm:text-5xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-purple-600 via-blue-600 to-purple-600 mb-2">
                        My Parking Places
                    </h1>
                    <p class="text-gray-600 text-lg">Manage your parking locations efficiently</p>
                </div>
                <div class="flex items-center gap-3">
                    <div class="hidden sm:flex items-center gap-2 bg-white px-4 py-2 rounded-full shadow-md">
                        <div class="w-2 h-2 bg-green-500 rounded-full animate-pulse"></div>
                        <span class="text-sm font-medium text-gray-700">Active</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Success / Error Messages -->
        <c:if test="${not empty message}">
            <div class="bg-gradient-to-r from-green-50 to-emerald-50 border-l-4 border-green-500 text-green-800 px-6 py-4 rounded-xl mb-6 shadow-lg animate-slideUp">
                <div class="flex items-start gap-3">
                    <svg class="w-6 h-6 text-green-500 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                    <div>
                        <p class="font-semibold">Success!</p>
                        <p class="text-sm">${message}</p>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${not empty error}">
            <div class="bg-gradient-to-r from-red-50 to-rose-50 border-l-4 border-red-500 text-red-800 px-6 py-4 rounded-xl mb-6 shadow-lg animate-slideUp">
                <div class="flex items-start gap-3">
                    <svg class="w-6 h-6 text-red-500 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                    <div>
                        <p class="font-semibold">Error!</p>
                        <p class="text-sm">${error}</p>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- Divider -->
        <div class="relative mb-8">
            <div class="absolute inset-0 flex items-center">
                <div class="w-full border-t-2 border-gray-200"></div>
            </div>
            <div class="relative flex justify-center">
                <span class="bg-gradient-to-br from-gray-50 via-purple-50 to-blue-50 px-6 text-sm font-medium text-gray-500">
                    Your Parking Locations
                </span>
            </div>
        </div>

        <!-- Content Section -->
        <c:choose>
            <c:when test="${empty parkingPlaces}">
                <div class="flex flex-col items-center justify-center py-16 px-4 animate-slideUp">
                    <div class="bg-white rounded-3xl shadow-2xl p-12 text-center max-w-lg">
                        <div class="w-32 h-32 gradient-purple rounded-full flex items-center justify-center mx-auto mb-6 shadow-xl">
                            <svg class="w-16 h-16 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4"/>
                            </svg>
                        </div>
                        <h2 class="text-3xl font-bold text-gray-900 mb-4">No Parking Places Found</h2>
                        <p class="text-gray-600 text-lg mb-8">Thre is no parking places listed in the site!</p>

                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Modern Table -->
                <div class="bg-white rounded-3xl shadow-2xl overflow-hidden animate-slideUp border border-gray-100">
                    <!-- Table Header -->
                    <div class="gradient-purple px-8 py-6">
                        <div class="flex items-center gap-3">
                            <svg class="w-7 h-7 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                            </svg>
                            <h2 class="text-2xl font-bold text-white">Parking Locations Overview</h2>
                        </div>
                    </div>

                    <!-- Table Container -->
                    <div class="overflow-x-auto">
                        <table class="w-full" cellpadding="10" cellspacing="0">
                            <thead>
                                <tr class="bg-gradient-to-r from-gray-50 to-purple-50 border-b-2 border-purple-200">
                                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-700 uppercase tracking-wider">ID</th>
                                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-700 uppercase tracking-wider">Name</th>
                                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-700 uppercase tracking-wider">Type</th>
                                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-700 uppercase tracking-wider">City</th>
                                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-700 uppercase tracking-wider">District</th>
                                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-700 uppercase tracking-wider">Available Slots</th>
                                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-700 uppercase tracking-wider">Total Slots</th>
                                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-700 uppercase tracking-wider">Hourly Rate</th>
                                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-700 uppercase tracking-wider">Contact</th>
                                    <th class="px-6 py-4 text-center text-xs font-bold text-gray-700 uppercase tracking-wider">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                <c:forEach var="parking" items="${parkingPlaces}">
                                    <tr class="table-row-hover">
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-gradient-to-br from-purple-100 to-blue-100 text-purple-700 font-bold text-sm">
                                                ${parking.id}
                                            </span>
                                        </td>
                                        <td class="px-6 py-4">
                                            <div class="flex items-center gap-3">
                                                <div class="w-10 h-10 rounded-full gradient-blue flex items-center justify-center shadow-md">
                                                    <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                                                    </svg>
                                                </div>
                                                <div>
                                                    <div class="text-sm font-bold text-gray-900">${parking.parkingName}</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-purple-100 text-purple-800">
                                                ${parking.parkingType}
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="text-sm text-gray-900 font-medium">${parking.city}</span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="text-sm text-gray-600">${parking.district}</span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-center">
                                            <span class="inline-flex items-center justify-center w-12 h-12 rounded-full bg-green-100 text-green-800 font-bold text-sm shadow-md">
                                                ${parking.availableSlots}
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-center">
                                            <span class="inline-flex items-center justify-center w-12 h-12 rounded-full bg-blue-100 text-blue-800 font-bold text-sm shadow-md">
                                                ${parking.totalSlots}
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="flex items-center gap-1">
                                                <svg class="w-4 h-4 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1"/>
                                                </svg>
                                                <span class="text-sm font-bold text-gray-900">Rs. ${parking.hourlyRate}</span>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="flex items-center gap-2 text-sm text-gray-600">
                                                <svg class="w-4 h-4 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>
                                                </svg>
                                                <span class="font-medium">${parking.contactNumber}</span>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-center">
                                            <div class="flex items-center justify-center gap-2">
                                                <a href="${pageContext.request.contextPath}/parking/view/${parking.id}"
                                                   class="inline-flex items-center gap-1 bg-blue-500 hover:bg-blue-600 text-white font-medium px-4 py-2 rounded-lg shadow-md hover:shadow-lg transform hover:scale-105 transition duration-200 text-sm">
                                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                                                    </svg>
                                                    View
                                                </a>
                                                <span class="text-gray-300">|</span>
                                                <a href="${pageContext.request.contextPath}/parking/edit/${parking.id}"
                                                   class="inline-flex items-center gap-1 bg-purple-500 hover:bg-purple-600 text-white font-medium px-4 py-2 rounded-lg shadow-md hover:shadow-lg transform hover:scale-105 transition duration-200 text-sm">
                                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                                                    </svg>
                                                    Edit
                                                </a>
                                                <span class="text-gray-300">|</span>
                                                <a href="${pageContext.request.contextPath}/parking/delete/${parking.id}"
                                                   onclick="return confirm('Are you sure you want to delete this parking place?')"
                                                   class="inline-flex items-center gap-1 bg-red-500 hover:bg-red-600 text-white font-medium px-4 py-2 rounded-lg shadow-md hover:shadow-lg transform hover:scale-105 transition duration-200 text-sm">
                                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                                                    </svg>
                                                    Delete
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Table Footer -->
                    <div class="bg-gradient-to-r from-gray-50 to-purple-50 px-8 py-4 border-t border-gray-200">
                        <div class="flex items-center justify-between flex-wrap gap-4">
                            <div class="flex items-center gap-2 text-sm text-gray-600">
                                <svg class="w-5 h-5 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                                </svg>
                                <span class="font-semibold">Total Locations:</span>
                                <span class="font-bold text-purple-700">${parkingPlaces.size()}</span>
                            </div>
                            <div class="text-xs text-gray-500">
                                Last updated: <span class="font-medium">Just now</span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>