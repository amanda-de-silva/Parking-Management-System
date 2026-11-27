<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>My Parking Bookings</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        body { font-family: 'Inter', sans-serif; }
        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .card-shadow {
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        .status-badge {
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .animate-fade-in {
            animation: fadeIn 0.6s ease-out;
        }
        .hover-scale {
            transition: transform 0.2s ease;
        }
        .hover-scale:hover {
            transform: scale(1.02);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 to-gray-100 min-h-screen">

<!-- Header Section -->
<div class="gradient-bg text-white py-8 shadow-lg">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h1 class="text-4xl font-bold text-center mb-2">Parking Place Bookings</h1>
        <p class="text-center text-gray-100 text-lg">Manage all bookings for your parking spaces</p>
    </div>
</div>

<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">

    <c:if test="${not empty bookings}">
        <!-- Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8 animate-fade-in">
            <div class="bg-white rounded-xl p-6 card-shadow hover-scale">
                <div class="flex items-center">
                    <div class="flex-shrink-0 bg-blue-100 rounded-lg p-3">
                        <svg class="w-8 h-8 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path>
                        </svg>
                    </div>
                    <div class="ml-4">
                        <p class="text-sm font-medium text-gray-500">Total Bookings</p>
                        <p class="text-2xl font-bold text-gray-900">${bookings.size()}</p>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-xl p-6 card-shadow hover-scale">
                <div class="flex items-center">
                    <div class="flex-shrink-0 bg-green-100 rounded-lg p-3">
                        <svg class="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                    </div>
                    <div class="ml-4">
                        <p class="text-sm font-medium text-gray-500">Active</p>
                        <p class="text-2xl font-bold text-gray-900">
                            <c:set var="activeCount" value="0" />
                            <c:forEach var="b" items="${bookings}">
                                <c:if test="${b.bookingStatus eq 'ACTIVE' or b.bookingStatus eq 'Active' or b.bookingStatus eq 'active'}">
                                    <c:set var="activeCount" value="${activeCount + 1}" />
                                </c:if>
                            </c:forEach>
                            ${activeCount}
                        </p>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-xl p-6 card-shadow hover-scale">
                <div class="flex items-center">
                    <div class="flex-shrink-0 bg-purple-100 rounded-lg p-3">
                        <svg class="w-8 h-8 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
                        </svg>
                    </div>
                    <div class="ml-4">
                        <p class="text-sm font-medium text-gray-500">Parking Places</p>
                        <p class="text-2xl font-bold text-gray-900">
                            <c:set var="uniquePlaces" value="${[]}" />
                            <c:forEach var="b" items="${bookings}">
                                <c:set var="uniquePlaces" value="${uniquePlaces}" />
                            </c:forEach>
                            ${parkingPlaceMap.size()}
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Table Section -->
        <div class="bg-white rounded-xl card-shadow overflow-hidden animate-fade-in">
            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="gradient-bg">
                        <tr>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-white uppercase tracking-wider">Booking ID</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-white uppercase tracking-wider">Parking Place</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-white uppercase tracking-wider">Vehicle</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-white uppercase tracking-wider">User Name</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-white uppercase tracking-wider">Start Time</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-white uppercase tracking-wider">End Time</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-white uppercase tracking-wider">Status</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-white uppercase tracking-wider">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <c:forEach var="b" items="${bookings}">
                            <tr class="hover:bg-gray-50 transition-colors duration-200">
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex items-center">
                                        <div class="flex-shrink-0 h-10 w-10 bg-indigo-100 rounded-full flex items-center justify-center">
                                            <span class="text-indigo-600 font-semibold text-sm">#${b.id}</span>
                                        </div>
                                        <div class="ml-3">
                                            <div class="text-sm font-medium text-gray-900">${b.id}</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm font-medium text-gray-900">${parkingPlaceMap[b.parkingPlaceId]}</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex items-center">
                                        <svg class="w-5 h-5 text-gray-400 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7h12m0 0l-4-4m4 4l-4 4m0 6H4m0 0l4 4m-4-4l4-4"></path>
                                        </svg>
                                        <div class="text-sm text-gray-900">${vehicleMap[b.vehicleId]}</div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex items-center">
                                        <div class="flex-shrink-0 h-8 w-8 bg-gradient-to-br from-purple-400 to-pink-400 rounded-full flex items-center justify-center">
                                            <span class="text-white font-medium text-xs">${userMap[b.userId].substring(0, 1).toUpperCase()}</span>
                                        </div>
                                        <div class="ml-3">
                                            <div class="text-sm font-medium text-gray-900">${userMap[b.userId]}</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900">${b.bookingStartTime}</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900">${b.bookingEndTime}</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="status-badge px-3 py-1 inline-flex leading-5 rounded-full
                                        ${b.bookingStatus eq 'ACTIVE' or b.bookingStatus eq 'Active' or b.bookingStatus eq 'active' ? 'bg-green-100 text-green-800' :
                                          b.bookingStatus eq 'CANCELLED' or b.bookingStatus eq 'Cancelled' or b.bookingStatus eq 'cancelled' ? 'bg-red-100 text-red-800' :
                                          b.bookingStatus eq 'PENDING' or b.bookingStatus eq 'Pending' or b.bookingStatus eq 'pending' ? 'bg-yellow-100 text-yellow-800' :
                                          'bg-gray-100 text-gray-800'}">
                                        ${b.bookingStatus}
                                    </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    <div class="flex space-x-2">
                                        <a href="/booking/owner/cancel/${b.id}"
                                           class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-white bg-red-500 hover:bg-red-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 transition-colors duration-200"
                                           onclick="return confirm('Are you sure to cancel this booking?');">
                                            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                                            </svg>
                                            CANCEL
                                        </a>
                                        <a href="/booking/owner/delete/${b.id}"
                                           class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-white bg-red-800 hover:bg-red-900 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-800 transition-colors duration-200"
                                           onclick="return confirm('Are you sure to delete this booking? This action cannot be undone!');">
                                            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                            </svg>
                                            DELETE
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>

    <c:if test="${empty bookings}">
        <div class="bg-white rounded-xl card-shadow p-12 text-center animate-fade-in">
            <svg class="mx-auto h-24 w-24 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
            </svg>
            <h3 class="mt-4 text-xl font-semibold text-gray-900">No Bookings Found</h3>
            <p class="mt-2 text-gray-500">No bookings found for your parking places.</p>
        </div>
    </c:if>

    <!-- Back Button -->
    <div class="mt-8 flex justify-center animate-fade-in">
        <a href="/dashboard" class="inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-lg text-white gradient-bg hover:opacity-90 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition-all duration-200 shadow-lg hover:shadow-xl">
            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
            </svg>
            Back to Dashboard
        </a>
    </div>
</div>

</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>