<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment List</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    animation: {
                        'fadeIn': 'fadeIn 0.6s ease-out',
                        'slideUp': 'slideUp 0.5s ease-out',
                        'shimmer': 'shimmer 2s infinite',
                    },
                    keyframes: {
                        fadeIn: {
                            '0%': { opacity: '0' },
                            '100%': { opacity: '1' },
                        },
                        slideUp: {
                            '0%': { transform: 'translateY(20px)', opacity: '0' },
                            '100%': { transform: 'translateY(0)', opacity: '1' },
                        },
                        shimmer: {
                            '0%': { backgroundPosition: '-1000px 0' },
                            '100%': { backgroundPosition: '1000px 0' },
                        }
                    }
                }
            }
        }
    </script>
    <style>
        .table-row-hover {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .table-row-hover:hover {
            transform: scale(1.01);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }
        .status-badge {
            animation: fadeIn 0.3s ease-out;
        }
        .gradient-text {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-slate-50 via-blue-50 to-indigo-50 min-h-screen flex flex-col">
<!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <!-- Main Content -->
    <main class="flex-grow container mx-auto px-6 py-8 animate-fadeIn">
        <!-- Header Section -->
        <div class="mb-8 animate-slideUp">
            <div class="flex items-center gap-4 mb-2">
                <div class="w-1.5 h-12 bg-gradient-to-b from-blue-600 to-purple-600 rounded-full"></div>
                <div>
                    <h2 class="text-4xl font-extrabold text-gray-800">All Payments</h2>
                    <p class="text-gray-600 mt-1">View and manage all payment transactions</p>
                </div>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8 animate-slideUp" style="animation-delay: 0.1s;">
            <div class="bg-white p-6 rounded-2xl shadow-lg hover:shadow-xl transition-all duration-300 border border-gray-100">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-gray-600 text-sm font-medium mb-1">Total Payments</p>
                        <p class="text-3xl font-bold text-gray-800">${payments.size()}</p>
                    </div>
                    <div class="bg-gradient-to-br from-blue-100 to-blue-200 p-4 rounded-xl">
                        <svg class="w-8 h-8 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                        </svg>
                    </div>
                </div>
            </div>

            <div class="bg-white p-6 rounded-2xl shadow-lg hover:shadow-xl transition-all duration-300 border border-gray-100">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-gray-600 text-sm font-medium mb-1">Revenue</p>
                        <p class="text-3xl font-bold text-green-600">Rs. <c:set var="total" value="0"/>
                            <c:forEach var="payment" items="${payments}">
                                <c:set var="total" value="${total + payment.amount}"/>
                            </c:forEach>${total}</p>
                    </div>
                    <div class="bg-gradient-to-br from-green-100 to-emerald-200 p-4 rounded-xl">
                        <svg class="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                    </div>
                </div>
            </div>

            <div class="bg-white p-6 rounded-2xl shadow-lg hover:shadow-xl transition-all duration-300 border border-gray-100">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-gray-600 text-sm font-medium mb-1">This Month</p>
                        <p class="text-3xl font-bold text-purple-600">--</p>
                    </div>
                    <div class="bg-gradient-to-br from-purple-100 to-violet-200 p-4 rounded-xl">
                        <svg class="w-8 h-8 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                        </svg>
                    </div>
                </div>
            </div>

            <div class="bg-gradient-to-br from-indigo-500 to-purple-600 p-6 rounded-2xl shadow-lg hover:shadow-xl transition-all duration-300 text-white">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-white text-sm font-medium mb-1 opacity-90">Avg. Payment</p>
                        <p class="text-3xl font-bold">Rs. <c:choose>
                            <c:when test="${payments.size() > 0}">
                                ${total / payments.size()}
                            </c:when>
                            <c:otherwise>0</c:otherwise>
                        </c:choose></p>
                    </div>
                    <div class="bg-white bg-opacity-20 p-4 rounded-xl backdrop-blur-sm">
                        <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                        </svg>
                    </div>
                </div>
            </div>
        </div>

        <!-- Table Section -->
        <div class="bg-white shadow-2xl rounded-3xl overflow-hidden border border-gray-100 animate-slideUp" style="animation-delay: 0.2s;">
            <!-- Table Header -->
            <div class="bg-gradient-to-r from-gray-50 to-gray-100 px-8 py-6 border-b border-gray-200">
                <div class="flex items-center justify-between">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 bg-gradient-to-br from-blue-500 to-purple-600 rounded-xl flex items-center justify-center">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z"></path>
                            </svg>
                        </div>
                        <h3 class="text-xl font-bold text-gray-800">Payment Transactions</h3>
                    </div>
                    <div class="flex items-center gap-2 text-sm text-gray-600">
                        <div class="w-2 h-2 bg-green-500 rounded-full animate-pulse"></div>
                        <span class="font-medium">Live Data</span>
                    </div>
                </div>
            </div>

            <!-- Table Content -->
            <div class="overflow-x-auto">
                <table class="min-w-full">
                    <thead>
                        <tr class="bg-gradient-to-r from-gray-100 to-gray-50">
                            <th class="py-4 px-6 text-left">
                                <div class="flex items-center gap-2">
                                    <span class="text-xs font-bold text-gray-600 uppercase tracking-wider">#</span>
                                </div>
                            </th>
                            <th class="py-4 px-6 text-left">
                                <div class="flex items-center gap-2">
                                    <svg class="w-4 h-4 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                    </svg>
                                    <span class="text-xs font-bold text-gray-600 uppercase tracking-wider">Customer Name</span>
                                </div>
                            </th>
                            <th class="py-4 px-6 text-left">
                                <div class="flex items-center gap-2">
                                    <svg class="w-4 h-4 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                    </svg>
                                    <span class="text-xs font-bold text-gray-600 uppercase tracking-wider">Amount (Rs.)</span>
                                </div>
                            </th>
                            <th class="py-4 px-6 text-left">
                                <div class="flex items-center gap-2">
                                    <svg class="w-4 h-4 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z"></path>
                                    </svg>
                                    <span class="text-xs font-bold text-gray-600 uppercase tracking-wider">Payment Method</span>
                                </div>
                            </th>
                            <th class="py-4 px-6 text-left">
                                <div class="flex items-center gap-2">
                                    <svg class="w-4 h-4 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                    </svg>
                                    <span class="text-xs font-bold text-gray-600 uppercase tracking-wider">Date</span>
                                </div>
                            </th>
                            <th class="py-4 px-6 text-left">
                                <div class="flex items-center gap-2">
                                    <svg class="w-4 h-4 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                    </svg>
                                    <span class="text-xs font-bold text-gray-600 uppercase tracking-wider">Status</span>
                                </div>
                            </th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">
                        <c:forEach var="payment" items="${payments}">
                            <tr class="table-row-hover bg-white hover:bg-gradient-to-r hover:from-blue-50 hover:to-indigo-50">
                                <td class="py-4 px-6">
                                    <div class="flex items-center">
                                        <span class="inline-flex items-center justify-center w-8 h-8 bg-gradient-to-br from-gray-100 to-gray-200 rounded-lg text-sm font-bold text-gray-700">
                                            ${payment.id}
                                        </span>
                                    </div>
                                </td>
                                <td class="py-4 px-6">
                                    <div class="flex items-center gap-3">
                                        <div class="w-10 h-10 bg-gradient-to-br from-blue-400 to-purple-500 rounded-full flex items-center justify-center text-white font-bold text-sm">
                                            ${payment.customerName.substring(0, 1).toUpperCase()}
                                        </div>
                                        <div>
                                            <p class="font-semibold text-gray-800">${payment.customerName}</p>
                                            <p class="text-xs text-gray-500">Customer</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="py-4 px-6">
                                    <span class="inline-flex items-center gap-1 text-lg font-bold text-green-600">
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                        </svg>
                                        Rs. ${payment.amount}
                                    </span>
                                </td>
                                <td class="py-4 px-6">
                                    <span class="inline-flex items-center gap-2 px-3 py-1.5 bg-gradient-to-r from-indigo-100 to-purple-100 text-indigo-700 rounded-lg text-sm font-medium">
                                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z"></path>
                                        </svg>
                                        ${payment.paymentMethod}
                                    </span>
                                </td>
                                <td class="py-4 px-6">
                                    <div class="flex items-center gap-2 text-gray-700">
                                        <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                        </svg>
                                        <span class="font-medium">${payment.date}</span>
                                    </div>
                                </td>
                                <td class="py-4 px-6">
                                    <c:choose>
                                        <c:when test="${payment.status == 'COMPLETED' || payment.status == 'SUCCESS' || payment.status == 'Completed' || payment.status == 'Success'}">
                                            <span class="status-badge inline-flex items-center gap-2 px-3 py-1.5 bg-gradient-to-r from-green-100 to-emerald-100 text-green-700 rounded-full text-sm font-semibold">
                                                <span class="w-2 h-2 bg-green-500 rounded-full animate-pulse"></span>
                                                ${payment.status}
                                            </span>
                                        </c:when>
                                        <c:when test="${payment.status == 'PENDING' || payment.status == 'Pending'}">
                                            <span class="status-badge inline-flex items-center gap-2 px-3 py-1.5 bg-gradient-to-r from-yellow-100 to-amber-100 text-yellow-700 rounded-full text-sm font-semibold">
                                                <span class="w-2 h-2 bg-yellow-500 rounded-full animate-pulse"></span>
                                                ${payment.status}
                                            </span>
                                        </c:when>
                                        <c:when test="${payment.status == 'FAILED' || payment.status == 'Failed'}">
                                            <span class="status-badge inline-flex items-center gap-2 px-3 py-1.5 bg-gradient-to-r from-red-100 to-rose-100 text-red-700 rounded-full text-sm font-semibold">
                                                <span class="w-2 h-2 bg-red-500 rounded-full"></span>
                                                ${payment.status}
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status-badge inline-flex items-center gap-2 px-3 py-1.5 bg-gradient-to-r from-gray-100 to-slate-100 text-gray-700 rounded-full text-sm font-semibold">
                                                <span class="w-2 h-2 bg-gray-500 rounded-full"></span>
                                                ${payment.status}
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty payments}">
                            <tr>
                                <td colspan="6" class="text-center py-16">
                                    <div class="flex flex-col items-center justify-center">
                                        <div class="w-24 h-24 bg-gradient-to-br from-gray-100 to-gray-200 rounded-full flex items-center justify-center mb-4">
                                            <svg class="w-12 h-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4"></path>
                                            </svg>
                                        </div>
                                        <p class="text-xl font-bold text-gray-700 mb-2">No payments found</p>
                                        <p class="text-gray-500">There are no payment transactions to display at the moment.</p>
                                    </div>
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>

            <!-- Table Footer -->
            <div class="bg-gradient-to-r from-gray-50 to-gray-100 px-8 py-4 border-t border-gray-200">
                <div class="flex items-center justify-between text-sm text-gray-600">
                    <span class="font-medium">Showing ${payments.size()} payment(s)</span>
                    <span class="font-medium">Total Revenue: Rs. ${total}</span>
                </div>
            </div>
        </div>
    </main>

</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>