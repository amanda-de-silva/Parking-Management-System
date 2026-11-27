<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Parking System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
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
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }
        .float-animation {
            animation: float 6s ease-in-out infinite;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 via-blue-50 to-purple-50 min-h-screen">
<!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />
    <div class="flex min-h-screen">
        <!-- Sidebar -->
        <aside id="sidebar" class="fixed inset-y-0 left-0 z-50 w-72 bg-white/95 backdrop-blur-xl shadow-2xl transform transition-transform duration-300 ease-in-out lg:translate-x-0 -translate-x-full border-r border-gray-200/50">
            <!-- Sidebar Header -->
            <div class="relative overflow-hidden bg-gradient-to-br from-blue-600 via-purple-600 to-indigo-600 animate-gradient p-8 text-white">
                <div class="absolute top-0 right-0 -mt-4 -mr-4 w-24 h-24 bg-white/10 rounded-full blur-2xl"></div>
                <div class="absolute bottom-0 left-0 -mb-4 -ml-4 w-32 h-32 bg-white/10 rounded-full blur-2xl"></div>
                <div class="relative z-10 text-center">
                    <div class="inline-flex items-center justify-center w-16 h-16 bg-white/20 backdrop-blur-sm rounded-2xl mb-3 shadow-lg">
                        <i class="fas fa-parking text-3xl"></i>
                    </div>
                    <h2 class="text-2xl font-bold mb-1">Parking System</h2>
                    <p class="text-sm text-blue-100">Administrator Portal</p>
                </div>
            </div>

            <!-- Admin Info -->
            <div class="p-6 bg-gradient-to-r from-gray-50 to-blue-50 border-b border-gray-200">
                <div class="flex items-center space-x-3">
                    <div class="flex-shrink-0">
                        <div class="w-12 h-12 bg-gradient-to-br from-blue-500 to-purple-600 rounded-xl flex items-center justify-center text-white font-bold text-lg shadow-lg">
                            ${userProfile.firstName.substring(0,1)}${userProfile.lastName.substring(0,1)}
                        </div>
                    </div>
                    <div class="flex-1 min-w-0">
                        <p class="text-sm font-semibold text-gray-900 truncate flex items-center">
                            <i class="fas fa-user-shield text-blue-600 mr-2"></i>
                            ${userProfile.firstName} ${userProfile.lastName}
                        </p>
                        <p class="text-xs text-gray-600 truncate">${userProfile.email}</p>
                    </div>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <div class="overflow-y-auto h-[calc(100vh-280px)] px-4 py-6 space-y-6">
                <!-- Dashboard Section -->
                <div>
                    <h3 class="px-3 text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3">Dashboard</h3>
                    <a href="/admin/dashboard" class="flex items-center px-4 py-3 text-sm font-medium text-white bg-gradient-to-r from-blue-600 to-purple-600 rounded-xl shadow-md hover:shadow-lg transform hover:scale-105 transition-all duration-200">
                        <i class="fas fa-tachometer-alt w-5 mr-3"></i>
                        <span>Admin Dashboard</span>
                    </a>
                </div>

                <!-- User Management -->
                <div>
                    <h3 class="px-3 text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3">User Management</h3>
                    <div class="space-y-1">
                        <a href="/profile" class="flex items-center px-4 py-2.5 text-sm font-medium text-gray-700 rounded-lg hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 hover:text-blue-700 transition-all duration-200 group">
                            <i class="fas fa-user-circle w-5 mr-3 text-gray-400 group-hover:text-blue-600"></i>
                            <span>My Profile</span>
                        </a>
                        <a href="/vehicle/list" class="flex items-center px-4 py-2.5 text-sm font-medium text-gray-700 rounded-lg hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 hover:text-blue-700 transition-all duration-200 group">
                            <i class="fas fa-car w-5 mr-3 text-gray-400 group-hover:text-blue-600"></i>
                            <span>My Vehicles</span>
                        </a>
                        <a href="/vehicle/create" class="flex items-center px-4 py-2.5 text-sm font-medium text-gray-700 rounded-lg hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 hover:text-blue-700 transition-all duration-200 group">
                            <i class="fas fa-plus-circle w-5 mr-3 text-gray-400 group-hover:text-blue-600"></i>
                            <span>Add Vehicle</span>
                        </a>
                    </div>
                </div>

                <!-- Parking Management -->
                <div>
                    <h3 class="px-3 text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3">Parking Management</h3>
                    <div class="space-y-1">
                        <a href="/parking/list" class="flex items-center px-4 py-2.5 text-sm font-medium text-gray-700 rounded-lg hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 hover:text-blue-700 transition-all duration-200 group">
                            <i class="fas fa-parking w-5 mr-3 text-gray-400 group-hover:text-blue-600"></i>
                            <span>My Parking Places</span>
                        </a>
                        <a href="/parking/create" class="flex items-center px-4 py-2.5 text-sm font-medium text-gray-700 rounded-lg hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 hover:text-blue-700 transition-all duration-200 group">
                            <i class="fas fa-plus-square w-5 mr-3 text-gray-400 group-hover:text-blue-600"></i>
                            <span>Add Parking Place</span>
                        </a>
                        <a href="/parking/user/list" class="flex items-center px-4 py-2.5 text-sm font-medium text-gray-700 rounded-lg hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 hover:text-blue-700 transition-all duration-200 group">
                            <i class="fas fa-map-marked-alt w-5 mr-3 text-gray-400 group-hover:text-blue-600"></i>
                            <span>Browse Parking</span>
                        </a>
                    </div>
                </div>

                <!-- Booking Management -->
                <div>
                    <h3 class="px-3 text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3">Booking Management</h3>
                    <div class="space-y-1">
                        <a href="/booking/list" class="flex items-center px-4 py-2.5 text-sm font-medium text-gray-700 rounded-lg hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 hover:text-blue-700 transition-all duration-200 group">
                            <i class="fas fa-calendar-check w-5 mr-3 text-gray-400 group-hover:text-blue-600"></i>
                            <span>My Bookings</span>
                        </a>
                        <a href="/booking/create" class="flex items-center px-4 py-2.5 text-sm font-medium text-gray-700 rounded-lg hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 hover:text-blue-700 transition-all duration-200 group">
                            <i class="fas fa-calendar-plus w-5 mr-3 text-gray-400 group-hover:text-blue-600"></i>
                            <span>New Booking</span>
                        </a>
                    </div>
                </div>

                <!-- Financial -->
                <div>
                    <h3 class="px-3 text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3">Financial</h3>
                    <div class="space-y-1">
                        <a href="/payments/list" class="flex items-center px-4 py-2.5 text-sm font-medium text-gray-700 rounded-lg hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 hover:text-blue-700 transition-all duration-200 group">
                            <i class="fas fa-money-bill-wave w-5 mr-3 text-gray-400 group-hover:text-blue-600"></i>
                            <span>Payments</span>
                        </a>
                        <a href="/promotions" class="flex items-center px-4 py-2.5 text-sm font-medium text-gray-700 rounded-lg hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 hover:text-blue-700 transition-all duration-200 group">
                            <i class="fas fa-tags w-5 mr-3 text-gray-400 group-hover:text-blue-600"></i>
                            <span>Promotions</span>
                        </a>
                        <a href="/promotions/create" class="flex items-center px-4 py-2.5 text-sm font-medium text-gray-700 rounded-lg hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 hover:text-blue-700 transition-all duration-200 group">
                            <i class="fas fa-bullhorn w-5 mr-3 text-gray-400 group-hover:text-blue-600"></i>
                            <span>Create Promotion</span>
                        </a>
                        <a href="/promotions/active" class="flex items-center px-4 py-2.5 text-sm font-medium text-gray-700 rounded-lg hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 hover:text-blue-700 transition-all duration-200 group">
                            <i class="fas fa-fire w-5 mr-3 text-gray-400 group-hover:text-blue-600"></i>
                            <span>Active Promotions</span>
                        </a>
                    </div>
                </div>

                <!-- Support & Feedback -->
                <div>
                    <h3 class="px-3 text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3">Support & Feedback</h3>
                    <div class="space-y-1">
                        <a href="/feedbacks" class="flex items-center px-4 py-2.5 text-sm font-medium text-gray-700 rounded-lg hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 hover:text-blue-700 transition-all duration-200 group">
                            <i class="fas fa-comments w-5 mr-3 text-gray-400 group-hover:text-blue-600"></i>
                            <span>All Feedbacks</span>
                        </a>
                        <a href="/feedbacks/new" class="flex items-center px-4 py-2.5 text-sm font-medium text-gray-700 rounded-lg hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 hover:text-blue-700 transition-all duration-200 group">
                            <i class="fas fa-comment-medical w-5 mr-3 text-gray-400 group-hover:text-blue-600"></i>
                            <span>Submit Feedback</span>
                        </a>
                        <a href="/feedbacks/feedback-dashboard" class="flex items-center px-4 py-2.5 text-sm font-medium text-gray-700 rounded-lg hover:bg-gradient-to-r hover:from-blue-50 hover:to-purple-50 hover:text-blue-700 transition-all duration-200 group">
                            <i class="fas fa-chart-pie w-5 mr-3 text-gray-400 group-hover:text-blue-600"></i>
                            <span>Feedback Dashboard</span>
                        </a>
                    </div>
                </div>
            </div>
        </aside>

        <!-- Mobile Menu Overlay -->
        <div id="sidebar-overlay" class="fixed inset-0 bg-black/50 backdrop-blur-sm z-40 lg:hidden hidden"></div>

        <!-- Main Content -->
        <main class="flex-1 lg:ml-72">
            <!-- Top Bar -->
            <div class="sticky top-0 z-30 bg-white/80 backdrop-blur-xl shadow-sm border-b border-gray-200/50">
                <div class="flex items-center justify-between px-6 py-4">
                    <div class="flex items-center space-x-4">
                        <button id="mobile-menu-btn" class="lg:hidden p-2 rounded-lg hover:bg-gray-100 transition-colors">
                            <i class="fas fa-bars text-gray-600 text-xl"></i>
                        </button>
                        <div>
                            <h1 class="text-2xl lg:text-3xl font-bold bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">Admin Dashboard</h1>
                            <p class="text-sm text-gray-600 mt-0.5">Welcome back, manage your parking system</p>
                        </div>
                    </div>
                    <div class="flex items-center space-x-3">
                        <a href="/profile" class="hidden sm:flex items-center space-x-2 px-4 py-2 bg-gradient-to-r from-blue-600 to-purple-600 text-white rounded-xl hover:shadow-lg transform hover:scale-105 transition-all duration-200 text-sm font-medium">
                            <i class="fas fa-user"></i>
                            <span>Profile</span>
                        </a>
                        <form action="/api/auth/logout" method="post" style="display: inline;">
                            <button onclick="logout()" class="flex items-center space-x-2 px-4 py-2 bg-red-50 text-red-600 hover:bg-red-100 rounded-xl transition-all duration-200 text-sm font-medium border border-red-200">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                                </svg>
                                <span class="hidden sm:inline">Logout</span>
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Dashboard Content -->
            <div class="p-6 lg:p-8 space-y-8">
                <!-- Stats Grid -->
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                    <!-- Stat Card 1 -->
                    <div class="group relative overflow-hidden bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2">
                        <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-blue-400 to-purple-500 rounded-full -mr-16 -mt-16 opacity-20 group-hover:opacity-30 transition-opacity"></div>
                        <div class="p-6 relative">
                            <div class="flex items-center justify-between mb-4">
                                <div class="w-14 h-14 bg-gradient-to-br from-blue-500 to-purple-600 rounded-xl flex items-center justify-center shadow-lg float-animation">
                                    <i class="fas fa-parking text-white text-2xl"></i>
                                </div>
                                <span class="text-xs font-semibold text-blue-600 bg-blue-50 px-3 py-1 rounded-full">Total</span>
                            </div>
                            <h3 class="text-sm font-medium text-gray-600 mb-1">Total Parking Places</h3>
                            <div class="text-3xl font-bold text-gray-900">${parkingPlaceCount != null ? parkingPlaceCount : 0}</div>
                        </div>
                        <div class="h-1 bg-gradient-to-r from-blue-500 to-purple-600"></div>
                    </div>

                    <!-- Stat Card 2 -->
                    <div class="group relative overflow-hidden bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2">
                        <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-green-400 to-emerald-500 rounded-full -mr-16 -mt-16 opacity-20 group-hover:opacity-30 transition-opacity"></div>
                        <div class="p-6 relative">
                            <div class="flex items-center justify-between mb-4">
                                <div class="w-14 h-14 bg-gradient-to-br from-green-500 to-emerald-600 rounded-xl flex items-center justify-center shadow-lg float-animation" style="animation-delay: 0.2s;">
                                    <i class="fas fa-calendar-check text-white text-2xl"></i>
                                </div>
                                <span class="text-xs font-semibold text-green-600 bg-green-50 px-3 py-1 rounded-full">Bookings</span>
                            </div>
                            <h3 class="text-sm font-medium text-gray-600 mb-1">Total Bookings</h3>
                            <div class="text-3xl font-bold text-gray-900">${bookingCount != null ? bookingCount : 0}</div>
                        </div>
                        <div class="h-1 bg-gradient-to-r from-green-500 to-emerald-600"></div>
                    </div>

                    <!-- Stat Card 3 -->
                    <div class="group relative overflow-hidden bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2">
                        <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-orange-400 to-red-500 rounded-full -mr-16 -mt-16 opacity-20 group-hover:opacity-30 transition-opacity"></div>
                        <div class="p-6 relative">
                            <div class="flex items-center justify-between mb-4">
                                <div class="w-14 h-14 bg-gradient-to-br from-orange-500 to-red-600 rounded-xl flex items-center justify-center shadow-lg float-animation" style="animation-delay: 0.4s;">
                                    <i class="fas fa-car text-white text-2xl"></i>
                                </div>
                                <span class="text-xs font-semibold text-orange-600 bg-orange-50 px-3 py-1 rounded-full">Vehicles</span>
                            </div>
                            <h3 class="text-sm font-medium text-gray-600 mb-1">Registered Vehicles</h3>
                            <div class="text-3xl font-bold text-gray-900">${vehicleCount != null ? vehicleCount : 0}</div>
                        </div>
                        <div class="h-1 bg-gradient-to-r from-orange-500 to-red-600"></div>
                    </div>

                    <!-- Stat Card 4 -->
                    <div class="group relative overflow-hidden bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2">
                        <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-cyan-400 to-blue-500 rounded-full -mr-16 -mt-16 opacity-20 group-hover:opacity-30 transition-opacity"></div>
                        <div class="p-6 relative">
                            <div class="flex items-center justify-between mb-4">
                                <div class="w-14 h-14 bg-gradient-to-br from-cyan-500 to-blue-600 rounded-xl flex items-center justify-center shadow-lg float-animation" style="animation-delay: 0.6s;">
                                    <i class="fas fa-tags text-white text-2xl"></i>
                                </div>
                                <span class="text-xs font-semibold text-cyan-600 bg-cyan-50 px-3 py-1 rounded-full">Promos</span>
                            </div>
                            <h3 class="text-sm font-medium text-gray-600 mb-1">Active Promotions</h3>
                            <div class="text-3xl font-bold text-gray-900">${activePromotionsCount != null ? activePromotionsCount : 0}</div>
                        </div>
                        <div class="h-1 bg-gradient-to-r from-cyan-500 to-blue-600"></div>
                    </div>

                    <!-- Stat Card 5 -->
                    <div class="group relative overflow-hidden bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2">
                        <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-pink-400 to-rose-500 rounded-full -mr-16 -mt-16 opacity-20 group-hover:opacity-30 transition-opacity"></div>
                        <div class="p-6 relative">
                            <div class="flex items-center justify-between mb-4">
                                <div class="w-14 h-14 bg-gradient-to-br from-pink-500 to-rose-600 rounded-xl flex items-center justify-center shadow-lg float-animation" style="animation-delay: 0.8s;">
                                    <i class="fas fa-fire text-white text-2xl"></i>
                                </div>
                                <span class="text-xs font-semibold text-pink-600 bg-pink-50 px-3 py-1 rounded-full">Active</span>
                            </div>
                            <h3 class="text-sm font-medium text-gray-600 mb-1">Active Bookings</h3>
                            <div class="text-3xl font-bold text-gray-900">${activeBookings != null ? activeBookings : 0}</div>
                        </div>
                        <div class="h-1 bg-gradient-to-r from-pink-500 to-rose-600"></div>
                    </div>

                    <!-- Stat Card 6 -->
                    <div class="group relative overflow-hidden bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2">
                        <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-emerald-400 to-teal-500 rounded-full -mr-16 -mt-16 opacity-20 group-hover:opacity-30 transition-opacity"></div>
                        <div class="p-6 relative">
                            <div class="flex items-center justify-between mb-4">
                                <div class="w-14 h-14 bg-gradient-to-br from-emerald-500 to-teal-600 rounded-xl flex items-center justify-center shadow-lg float-animation" style="animation-delay: 1s;">
                                    <i class="fas fa-check-circle text-white text-2xl"></i>
                                </div>
                                <span class="text-xs font-semibold text-emerald-600 bg-emerald-50 px-3 py-1 rounded-full">Available</span>
                            </div>
                            <h3 class="text-sm font-medium text-gray-600 mb-1">Available Slots</h3>
                            <div class="text-3xl font-bold text-gray-900">${availableSlots != null ? availableSlots : 0}</div>
                        </div>
                        <div class="h-1 bg-gradient-to-r from-emerald-500 to-teal-600"></div>
                    </div>
                </div>

                <!-- Quick Actions -->
                <div class="bg-white rounded-2xl shadow-lg p-8">
                    <div class="flex items-center mb-6">
                        <div class="w-10 h-10 bg-gradient-to-br from-blue-500 to-purple-600 rounded-xl flex items-center justify-center mr-3">
                            <i class="fas fa-bolt text-white"></i>
                        </div>
                        <h2 class="text-2xl font-bold text-gray-900">Quick Actions</h2>
                    </div>

                    <div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-4">
                        <a href="/parking/create" class="group flex flex-col items-center justify-center p-6 bg-gradient-to-br from-blue-50 to-purple-50 rounded-xl hover:from-blue-600 hover:to-purple-600 transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
                            <i class="fas fa-plus-circle text-3xl text-blue-600 group-hover:text-white mb-3 transition-colors"></i>
                            <h4 class="text-sm font-semibold text-gray-700 group-hover:text-white text-center transition-colors">Add Parking Place</h4>
                        </a>

                        <a href="/booking/create" class="group flex flex-col items-center justify-center p-6 bg-gradient-to-br from-green-50 to-emerald-50 rounded-xl hover:from-green-600 hover:to-emerald-600 transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
                            <i class="fas fa-calendar-plus text-3xl text-green-600 group-hover:text-white mb-3 transition-colors"></i>
                            <h4 class="text-sm font-semibold text-gray-700 group-hover:text-white text-center transition-colors">New Booking</h4>
                        </a>

                        <a href="/vehicle/create" class="group flex flex-col items-center justify-center p-6 bg-gradient-to-br from-orange-50 to-red-50 rounded-xl hover:from-orange-600 hover:to-red-600 transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
                            <i class="fas fa-car text-3xl text-orange-600 group-hover:text-white mb-3 transition-colors"></i>
                            <h4 class="text-sm font-semibold text-gray-700 group-hover:text-white text-center transition-colors">Register Vehicle</h4>
                        </a>

                        <a href="/promotions/create" class="group flex flex-col items-center justify-center p-6 bg-gradient-to-br from-cyan-50 to-blue-50 rounded-xl hover:from-cyan-600 hover:to-blue-600 transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
                            <i class="fas fa-bullhorn text-3xl text-cyan-600 group-hover:text-white mb-3 transition-colors"></i>
                            <h4 class="text-sm font-semibold text-gray-700 group-hover:text-white text-center transition-colors">Create Promotion</h4>
                        </a>

                        <a href="/parking/user/list" class="group flex flex-col items-center justify-center p-6 bg-gradient-to-br from-purple-50 to-pink-50 rounded-xl hover:from-purple-600 hover:to-pink-600 transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
                            <i class="fas fa-list text-3xl text-purple-600 group-hover:text-white mb-3 transition-colors"></i>
                            <h4 class="text-sm font-semibold text-gray-700 group-hover:text-white text-center transition-colors">All Parking</h4>
                        </a>
                        <a href="/booking/admin/list" class="group flex flex-col items-center justify-center p-6 bg-gradient-to-br from-indigo-50 to-blue-50 rounded-xl hover:from-indigo-600 hover:to-blue-600 transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
                            <i class="fas fa-clipboard-list text-3xl text-indigo-600 group-hover:text-white mb-3 transition-colors"></i>
                            <h4 class="text-sm font-semibold text-gray-700 group-hover:text-white text-center transition-colors">View Bookings</h4>
                        </a>

                        <a href="/payments/list" class="group flex flex-col items-center justify-center p-6 bg-gradient-to-br from-teal-50 to-green-50 rounded-xl hover:from-teal-600 hover:to-green-600 transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
                            <i class="fas fa-receipt text-3xl text-teal-600 group-hover:text-white mb-3 transition-colors"></i>
                            <h4 class="text-sm font-semibold text-gray-700 group-hover:text-white text-center transition-colors">Payment History</h4>
                        </a>

                        <a href="/promotions" class="group flex flex-col items-center justify-center p-6 bg-gradient-to-br from-yellow-50 to-orange-50 rounded-xl hover:from-yellow-600 hover:to-orange-600 transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
                            <i class="fas fa-tags text-3xl text-yellow-600 group-hover:text-white mb-3 transition-colors"></i>
                            <h4 class="text-sm font-semibold text-gray-700 group-hover:text-white text-center transition-colors">All Promotions</h4>
                        </a>

                        <a href="/parking/user/list" class="group flex flex-col items-center justify-center p-6 bg-gradient-to-br from-rose-50 to-pink-50 rounded-xl hover:from-rose-600 hover:to-pink-600 transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
                            <i class="fas fa-search text-3xl text-rose-600 group-hover:text-white mb-3 transition-colors"></i>
                            <h4 class="text-sm font-semibold text-gray-700 group-hover:text-white text-center transition-colors">Browse Parking</h4>
                        </a>

                        <a href="/feedbacks" class="group flex flex-col items-center justify-center p-6 bg-gradient-to-br from-emerald-50 to-teal-50 rounded-xl hover:from-emerald-600 hover:to-teal-600 transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
                            <i class="fas fa-comments text-3xl text-emerald-600 group-hover:text-white mb-3 transition-colors"></i>
                            <h4 class="text-sm font-semibold text-gray-700 group-hover:text-white text-center transition-colors">All Feedbacks</h4>
                        </a>

                        <a href="/vehicle/admin/list" class="group flex flex-col items-center justify-center p-6 bg-gradient-to-br from-blue-50 to-cyan-50 rounded-xl hover:from-blue-600 hover:to-cyan-600 transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
                            <i class="fas fa-user-cog text-3xl text-blue-600 group-hover:text-white mb-3 transition-colors"></i>
                            <h4 class="text-sm font-semibold text-gray-700 group-hover:text-white text-center transition-colors">All Vehicles</h4>
                        </a>

                        <a href="/admin/users" class="group flex flex-col items-center justify-center p-6 bg-gradient-to-br from-violet-50 to-purple-50 rounded-xl hover:from-violet-600 hover:to-purple-600 transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
                             <i class="fas fa-user-cog text-3xl text-violet-600 group-hover:text-white mb-3 transition-colors"></i>
                             <h4 class="text-sm font-semibold text-gray-700 group-hover:text-white text-center transition-colors">All Users</h4>
                        </a>
                    </div>
                </div>
            </div>
        </main>
    </div>

                        <script>
                            // Mobile menu toggle
                            const mobileMenuBtn = document.getElementById('mobile-menu-btn');
                            const sidebar = document.getElementById('sidebar');
                            const sidebarOverlay = document.getElementById('sidebar-overlay');

                            mobileMenuBtn?.addEventListener('click', function () {
                                sidebar.classList.toggle('-translate-x-full');
                                sidebarOverlay.classList.toggle('hidden');
                            });

                            sidebarOverlay?.addEventListener('click', function () {
                                sidebar.classList.add('-translate-x-full');
                                sidebarOverlay.classList.add('hidden');
                            });

                            // Logout function
                            async function logout() {
                                try {
                                    const response = await fetch('/api/auth/logout', {
                                        method: 'POST',
                                        headers: { 'Content-Type': 'application/json' }
                                    });
                                    if (response.ok) {
                                        window.location.href = '/login';
                                    } else {
                                        alert('Logout failed!');
                                    }
                                } catch (error) {
                                    console.error('Logout error:', error);
                                    alert('Logout failed!');
                                }
                            }
                        </script>
</body>
</html>