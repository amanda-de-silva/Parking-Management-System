<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <title>Feedback Management System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        .animate-gradient {
            background-size: 200% 200%;
            animation: gradient 15s ease infinite;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .fade-in {
            animation: fadeIn 0.6s ease-out;
        }
        @keyframes slideIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }
        .modal-content {
            animation: slideIn 0.3s ease-out;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-blue-50 via-purple-50 to-pink-50 min-h-screen">
    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <div class="min-h-screen py-8 px-4 sm:px-6 lg:px-8">
        <div class="max-w-7xl mx-auto">
            <!-- Header Section -->
            <div class="bg-white rounded-3xl shadow-2xl overflow-hidden mb-6 fade-in">
                <div class="relative bg-gradient-to-r from-blue-600 via-purple-600 to-pink-600 animate-gradient p-8 text-white">
                    <div class="absolute top-0 right-0 -mt-4 -mr-4 w-32 h-32 bg-white/10 rounded-full blur-3xl"></div>
                    <div class="absolute bottom-0 left-0 -mb-4 -ml-4 w-40 h-40 bg-white/10 rounded-full blur-3xl"></div>
                    <div class="relative z-10 text-center">
                        <div class="flex items-center justify-center space-x-3 mb-3">
                            <div class="w-14 h-14 bg-white/20 backdrop-blur-sm rounded-2xl flex items-center justify-center">
                                <span class="text-3xl">🎫</span>
                            </div>
                            <h2 class="text-3xl sm:text-4xl font-bold">Feedback Management System</h2>
                        </div>
                        <p class="text-blue-100 text-sm sm:text-base">Track and manage customer feedback efficiently</p>
                    </div>
                </div>
            </div>

            <!-- Alerts -->
            <c:if test="${not empty success}">
                <div class="bg-green-50 border-l-4 border-green-500 rounded-xl p-4 mb-6 fade-in shadow-lg">
                    <div class="flex items-center">
                        <svg class="w-6 h-6 text-green-500 mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                        </svg>
                        <p class="text-green-800 font-medium">${success}</p>
                    </div>
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="bg-red-50 border-l-4 border-red-500 rounded-xl p-4 mb-6 fade-in shadow-lg">
                    <div class="flex items-center">
                        <svg class="w-6 h-6 text-red-500 mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path>
                        </svg>
                        <p class="text-red-800 font-medium">${error}</p>
                    </div>
                </div>
            </c:if>

            <!-- Content Card -->
            <div class="bg-white rounded-3xl shadow-2xl overflow-hidden fade-in">
                <div class="p-6 sm:p-8">
                    <div class="flex items-center justify-between mb-6">
                        <h2 class="text-2xl font-bold text-gray-900 flex items-center">
                            <svg class="w-7 h-7 text-blue-600 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path>
                            </svg>
                            All Feedback
                        </h2>
                    </div>

                    <c:choose>
                        <c:when test="${not empty feedbacks}">
                            <!-- Desktop Table View -->
                            <div class="hidden lg:block overflow-x-auto">
                                <table class="w-full">
                                    <thead>
                                        <tr class="bg-gradient-to-r from-blue-600 to-purple-600 text-white">
                                            <th class="px-6 py-4 text-left text-sm font-semibold rounded-tl-xl">#</th>
                                            <th class="px-6 py-4 text-left text-sm font-semibold">Customer Name</th>
                                            <th class="px-6 py-4 text-left text-sm font-semibold">Contact</th>
                                            <th class="px-6 py-4 text-left text-sm font-semibold">Email</th>
                                            <th class="px-6 py-4 text-left text-sm font-semibold">Subject</th>
                                            <th class="px-6 py-4 text-left text-sm font-semibold">Category</th>
                                            <th class="px-6 py-4 text-left text-sm font-semibold">Status</th>
                                            <th class="px-6 py-4 text-left text-sm font-semibold">Created At</th>
                                            <th class="px-6 py-4 text-left text-sm font-semibold rounded-tr-xl">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody class="divide-y divide-gray-200">
                                        <c:forEach items="${feedbacks}" var="feedback" varStatus="loop">
                                            <tr class="hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 transition-all duration-200">
                                                <td class="px-6 py-4">
                                                    <span class="open-modal cursor-pointer text-blue-600 hover:text-blue-800 font-semibold underline"
                                                        data-id="${feedback.id}"
                                                        data-customer="${feedback.customerName}"
                                                        data-contact="${feedback.contactNumber}"
                                                        data-email="${feedback.email}"
                                                        data-subject="${feedback.subject}"
                                                        data-category="${feedback.category}"
                                                        data-status="${feedback.status}"
                                                        data-date="<fmt:formatDate value='${feedback.listingDateAsDate}' pattern='MMM dd, yyyy' />"
                                                        data-concern="${fn:escapeXml(feedback.concern)}"
                                                        data-document="${fn:escapeXml(feedback.documentPath)}">
                                                        ${loop.count}
                                                    </span>
                                                </td>
                                                <td class="px-6 py-4">
                                                    <div class="flex items-center">
                                                        <div class="w-10 h-10 bg-gradient-to-br from-blue-500 to-purple-600 rounded-xl flex items-center justify-center text-white font-bold mr-3">
                                                            ${fn:substring(feedback.customerName, 0, 1)}
                                                        </div>
                                                        <span class="font-semibold text-gray-900">${feedback.customerName}</span>
                                                    </div>
                                                </td>
                                                <td class="px-6 py-4 text-gray-700">${feedback.contactNumber}</td>
                                                <td class="px-6 py-4 text-gray-700">${feedback.email}</td>
                                                <td class="px-6 py-4 text-gray-900 font-medium">${feedback.subject}</td>
                                                <td class="px-6 py-4">
                                                    <c:choose>
                                                        <c:when test="${feedback.category == 'PARKING_BOOKING_ISSUE'}">
                                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-blue-100 text-blue-800">Parking Booking Issue</span>
                                                        </c:when>
                                                        <c:when test="${feedback.category == 'EV_CHARGING_ISSUE'}">
                                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-800">EV Charging Issue</span>
                                                        </c:when>
                                                        <c:when test="${feedback.category == 'PAYMENT_ISSUE'}">
                                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-yellow-100 text-yellow-800">Payment Issue</span>
                                                        </c:when>
                                                        <c:when test="${feedback.category == 'FACILITY_FEEDBACK'}">
                                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-orange-100 text-orange-800">Facility Feedback</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-indigo-100 text-indigo-800">General Inquiry</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="px-6 py-4">
                                                    <c:choose>
                                                        <c:when test="${feedback.status == 'PENDING'}">
                                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-yellow-100 text-yellow-800">
                                                                <span class="w-2 h-2 bg-yellow-500 rounded-full mr-2"></span>Pending
                                                            </span>
                                                        </c:when>
                                                        <c:when test="${feedback.status == 'IN_PROGRESS'}">
                                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-blue-100 text-blue-800">
                                                                <span class="w-2 h-2 bg-blue-500 rounded-full mr-2"></span>In Progress
                                                            </span>
                                                        </c:when>
                                                        <c:when test="${feedback.status == 'SOLVED'}">
                                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-800">
                                                                <span class="w-2 h-2 bg-green-500 rounded-full mr-2"></span>Solved
                                                            </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-gray-100 text-gray-800">
                                                                <span class="w-2 h-2 bg-gray-500 rounded-full mr-2"></span>Closed
                                                            </span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="px-6 py-4 text-gray-700">
                                                    <fmt:formatDate value="${feedback.listingDateAsDate}" pattern="MMM dd, yyyy" />
                                                </td>
                                                <td class="px-6 py-4">
                                                    <div class="flex items-center space-x-2">
                                                        <c:if test="${feedback.status != 'SOLVED' && feedback.status != 'CLOSED'}">
                                                            <form method="post" action="${pageContext.request.contextPath}/feedbacks/${feedback.id}/solve" style="display:inline;">
                                                                <button type="submit" class="px-3 py-1.5 bg-red-500 hover:bg-red-600 text-white text-xs font-semibold rounded-lg transition-all duration-200 transform hover:scale-105 shadow-md">✓ Solve</button>
                                                            </form>
                                                        </c:if>
                                                        <a href="${pageContext.request.contextPath}/feedbacks/${feedback.id}/edit" class="px-3 py-1.5 bg-orange-500 hover:bg-orange-600 text-white text-xs font-semibold rounded-lg transition-all duration-200 transform hover:scale-105 shadow-md">✏ Edit</a>
                                                        <a href="${pageContext.request.contextPath}/feedbacks/${feedback.id}/delete" class="px-3 py-1.5 bg-red-500 hover:bg-red-600 text-white text-xs font-semibold rounded-lg transition-all duration-200 transform hover:scale-105 shadow-md" onclick="return confirm('Are you sure you want to delete this feedback?')">🗑 Delete</a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Mobile Card View -->
                            <div class="lg:hidden space-y-4">
                                <c:forEach items="${feedbacks}" var="feedback" varStatus="loop">
                                    <div class="bg-gradient-to-br from-white to-gray-50 rounded-2xl shadow-lg p-6 border border-gray-200 hover:shadow-xl transition-all duration-300">
                                        <div class="flex items-start justify-between mb-4">
                                            <span class="open-modal cursor-pointer text-blue-600 hover:text-blue-800 font-bold text-lg underline"
                                                data-id="${feedback.id}"
                                                data-customer="${feedback.customerName}"
                                                data-contact="${feedback.contactNumber}"
                                                data-email="${feedback.email}"
                                                data-subject="${feedback.subject}"
                                                data-category="${feedback.category}"
                                                data-status="${feedback.status}"
                                                data-date="<fmt:formatDate value='${feedback.listingDateAsDate}' pattern='MMM dd, yyyy' />"
                                                data-concern="${fn:escapeXml(feedback.concern)}"
                                                data-document="${fn:escapeXml(feedback.documentPath)}">
                                                #${loop.count}
                                            </span>
                                            <c:choose>
                                                <c:when test="${feedback.status == 'PENDING'}">
                                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-yellow-100 text-yellow-800">
                                                        <span class="w-2 h-2 bg-yellow-500 rounded-full mr-2"></span>Pending
                                                    </span>
                                                </c:when>
                                                <c:when test="${feedback.status == 'IN_PROGRESS'}">
                                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-blue-100 text-blue-800">
                                                        <span class="w-2 h-2 bg-blue-500 rounded-full mr-2"></span>In Progress
                                                    </span>
                                                </c:when>
                                                <c:when test="${feedback.status == 'SOLVED'}">
                                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-800">
                                                        <span class="w-2 h-2 bg-green-500 rounded-full mr-2"></span>Solved
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-gray-100 text-gray-800">
                                                        <span class="w-2 h-2 bg-gray-500 rounded-full mr-2"></span>Closed
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                        <div class="space-y-3 mb-4">
                                            <div class="flex items-center">
                                                <div class="w-12 h-12 bg-gradient-to-br from-blue-500 to-purple-600 rounded-xl flex items-center justify-center text-white font-bold mr-3 text-lg">
                                                    ${fn:substring(feedback.customerName, 0, 1)}
                                                </div>
                                                <div>
                                                    <p class="font-bold text-gray-900">${feedback.customerName}</p>
                                                    <p class="text-sm text-gray-600">${feedback.contactNumber}</p>
                                                </div>
                                            </div>

                                            <div class="space-y-2">
                                                <p class="text-sm text-gray-600"><span class="font-semibold">Email:</span> ${feedback.email}</p>
                                                <p class="text-sm text-gray-900 font-medium"><span class="font-semibold">Subject:</span> ${feedback.subject}</p>
                                                <div class="flex items-center space-x-2">
                                                    <span class="text-sm font-semibold text-gray-700">Category:</span>
                                                    <c:choose>
                                                        <c:when test="${feedback.category == 'PARKING_BOOKING_ISSUE'}">
                                                            <span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-semibold bg-blue-100 text-blue-800">Parking Booking</span>
                                                        </c:when>
                                                        <c:when test="${feedback.category == 'EV_CHARGING_ISSUE'}">
                                                            <span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-800">EV Charging</span>
                                                        </c:when>
                                                        <c:when test="${feedback.category == 'PAYMENT_ISSUE'}">
                                                            <span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-semibold bg-yellow-100 text-yellow-800">Payment</span>
                                                        </c:when>
                                                        <c:when test="${feedback.category == 'FACILITY_FEEDBACK'}">
                                                            <span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-semibold bg-orange-100 text-orange-800">Facility</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-semibold bg-indigo-100 text-indigo-800">General</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <p class="text-xs text-gray-500">
                                                    <fmt:formatDate value="${feedback.listingDateAsDate}" pattern="MMM dd, yyyy" />
                                                </p>
                                            </div>
                                        </div>

                                        <div class="flex flex-wrap gap-2 pt-4 border-t border-gray-200">
                                            <c:if test="${feedback.status != 'SOLVED' && feedback.status != 'CLOSED'}">
                                                <form method="post" action="${pageContext.request.contextPath}/feedbacks/${feedback.id}/solve" class="flex-1">
                                                    <button type="submit" class="w-full px-4 py-2 bg-green-500 hover:bg-green-600 text-white text-sm font-semibold rounded-lg transition-all duration-200 shadow-md">✓ Solve</button>
                                                </form>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/feedbacks/${feedback.id}/edit" class="flex-1 px-4 py-2 bg-orange-500 hover:bg-orange-600 text-white text-sm font-semibold rounded-lg transition-all duration-200 text-center shadow-md">✏ Edit</a>
                                            <a href="${pageContext.request.contextPath}/feedbacks/${feedback.id}/delete" class="flex-1 px-4 py-2 bg-red-500 hover:bg-red-600 text-white text-sm font-semibold rounded-lg transition-all duration-200 text-center shadow-md" onclick="return confirm('Are you sure you want to delete this feedback?')">🗑 Delete</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-16">
                                <div class="inline-flex items-center justify-center w-24 h-24 bg-gradient-to-br from-blue-100 to-purple-100 rounded-full mb-6">
                                    <svg class="w-12 h-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4"></path>
                                    </svg>
                                </div>
                                <h3 class="text-xl font-semibold text-gray-700 mb-2">No Feedbacks Found</h3>
                                <p class="text-gray-500">Create your first feedback to get started!</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div id="feedbackModal" class="fixed inset-0 bg-black/60 backdrop-blur-sm z-50 hidden items-center justify-center p-4">
        <div class="modal-content bg-white rounded-3xl shadow-2xl max-w-3xl w-full max-h-[90vh] overflow-y-auto">
            <div class="sticky top-0 bg-gradient-to-r from-blue-600 to-purple-600 text-white p-6 rounded-t-3xl z-10">
                <h2 class="text-2xl font-bold flex items-center">
                    <svg class="w-7 h-7 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                    </svg>
                    Feedback Details
                </h2>
            </div>

            <div class="p-8 space-y-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="bg-gradient-to-br from-blue-50 to-purple-50 rounded-xl p-4">
                        <p class="text-sm font-semibold text-gray-600 mb-1">Customer Name</p>
                        <p id="modalCustomer" class="text-lg font-bold text-gray-900"></p>
                    </div>
                    <div class="bg-gradient-to-br from-blue-50 to-purple-50 rounded-xl p-4">
                        <p class="text-sm font-semibold text-gray-600 mb-1">Contact</p>
                        <p id="modalContact" class="text-lg font-bold text-gray-900"></p>
                    </div>
                    <div class="bg-gradient-to-br from-blue-50 to-purple-50 rounded-xl p-4">
                        <p class="text-sm font-semibold text-gray-600 mb-1">Email</p>
                        <p id="modalEmail" class="text-lg font-bold text-gray-900 break-all"></p>
                    </div>
                    <div class="bg-gradient-to-br from-blue-50 to-purple-50 rounded-xl p-4">
                        <p class="text-sm font-semibold text-gray-600 mb-1">Created At</p>
                        <p id="modalDate" class="text-lg font-bold text-gray-900"></p>
                    </div>
                </div>

                <div class="bg-gradient-to-br from-blue-50 to-purple-50 rounded-xl p-4">
                    <p class="text-sm font-semibold text-gray-600 mb-1">Subject</p>
                    <p id="modalSubject" class="text-lg font-bold text-gray-900"></p>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="bg-gradient-to-br from-blue-50 to-purple-50 rounded-xl p-4">
                        <p class="text-sm font-semibold text-gray-600 mb-1">Category</p>
                        <p id="modalCategory" class="text-lg font-bold text-gray-900"></p>
                    </div>
                    <div class="bg-gradient-to-br from-blue-50 to-purple-50 rounded-xl p-4">
                        <p class="text-sm font-semibold text-gray-600 mb-1">Status</p>
                        <p id="modalStatus" class="text-lg font-bold text-gray-900"></p>
                    </div>
                </div>

                <div class="bg-gradient-to-br from-blue-50 to-purple-50 rounded-xl p-4">
                    <p class="text-sm font-semibold text-gray-600 mb-2">Concern/Details</p>
                    <p id="modalConcern" class="text-gray-900 leading-relaxed whitespace-pre-wrap"></p>
                </div>

                <div id="modalDocumentContainer" class="bg-gradient-to-br from-blue-50 to-purple-50 rounded-xl p-4">
                    <p class="text-sm font-semibold text-gray-600 mb-3">Document</p>
                    <div id="modalDocument"></div>
                </div>
            </div>

            <div class="sticky bottom-0 bg-gray-50 px-8 py-6 rounded-b-3xl border-t border-gray-200">
                <button onclick="closeModal()" class="w-full px-6 py-3 bg-gradient-to-r from-red-500 to-red-600 hover:from-red-600 hover:to-red-700 text-white font-semibold rounded-xl transition-all duration-200 transform hover:scale-105 shadow-lg flex items-center justify-center space-x-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                    <span>Close</span>
                </button>
            </div>
        </div>
    </div>

    <script>
        // Open Modal
        document.querySelectorAll('.open-modal').forEach(function(item) {
            item.addEventListener('click', function() {
                // Set basic fields
                document.getElementById('modalCustomer').innerText = this.dataset.customer;
                document.getElementById('modalContact').innerText = this.dataset.contact;
                document.getElementById('modalEmail').innerText = this.dataset.email;
                document.getElementById('modalSubject').innerText = this.dataset.subject;
                document.getElementById('modalConcern').innerText = this.dataset.concern;

                // Handle document with proper URL
                const docPath = this.dataset.document;
                const docContainer = document.getElementById('modalDocument');
                docContainer.innerHTML = ''; // Clear previous content

                if (docPath && docPath.trim() !== '' && docPath !== 'null') {
                    // Extract just the filename from the path
                    const filename = docPath.split('/').pop().split('\\').pop();
                    const extension = filename.split('.').pop().toLowerCase();
                    const documentUrl = '${pageContext.request.contextPath}/feedbacks/documents/' + encodeURIComponent(filename);

                    if (['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].includes(extension)) {
                        docContainer.innerHTML = '<img src="' + documentUrl + '" alt="Document Image" class="w-full rounded-xl shadow-lg" onerror="this.onerror=null; this.parentElement.innerHTML=\'<p class=text-red-600>Error loading image</p>\';" />';
                    } else if (extension === 'pdf') {
                        docContainer.innerHTML = '<iframe src="' + documentUrl + '" class="w-full h-96 border-2 border-gray-200 rounded-xl shadow-lg" frameborder="0"></iframe>';
                    } else {
                        docContainer.innerHTML = '<a href="' + documentUrl + '" target="_blank" class="inline-flex items-center space-x-2 px-6 py-3 bg-gradient-to-r from-blue-600 to-purple-600 text-white font-semibold rounded-xl hover:shadow-lg transition-all duration-200 transform hover:scale-105"><svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path></svg><span>View Document</span></a>';
                    }
                } else {
                    docContainer.innerHTML = '<span class="text-gray-500 italic">No document attached.</span>';
                }

                // Map category
                const categoryMap = {
                    'PARKING_BOOKING_ISSUE': 'Parking Booking Issue',
                    'EV_CHARGING_ISSUE': 'EV Charging Issue',
                    'PAYMENT_ISSUE': 'Payment Issue',
                    'FACILITY_FEEDBACK': 'Facility Feedback',
                    'GENERAL_INQUIRY': 'General Inquiry'
                };

                document.getElementById('modalCategory').innerText = categoryMap[this.dataset.category] || this.dataset.category;

                // Map status
                const statusMap = {
                    'PENDING': 'Pending',
                    'IN_PROGRESS': 'In Progress',
                    'SOLVED': 'Solved',
                    'CLOSED': 'Closed'
                };
                document.getElementById('modalStatus').innerText = statusMap[this.dataset.status] || this.dataset.status;

                document.getElementById('modalDate').innerText = this.dataset.date;

                // Show modal
                document.getElementById('feedbackModal').style.display = 'flex';
            });
        });

        // Close Modal
        function closeModal() {
            document.getElementById('feedbackModal').style.display = 'none';
        }

        // Close modal on outside click
        window.onclick = function(event) {
            const modal = document.getElementById('feedbackModal');
            if (event.target === modal) {
                closeModal();
            }
        }

        // Close modal on Escape key
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                closeModal();
            }
        });
    </script>

</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>