<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard - ParkingHub</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    animation: {
                        'float': 'float 3s ease-in-out infinite',
                        'slideIn': 'slideIn 0.5s ease-out',
                        'fadeIn': 'fadeIn 0.6s ease-out',
                    },
                    keyframes: {
                        float: {
                            '0%, 100%': { transform: 'translateY(0px)' },
                            '50%': { transform: 'translateY(-10px)' },
                        },
                        slideIn: {
                            '0%': { transform: 'translateX(-20px)', opacity: '0' },
                            '100%': { transform: 'translateX(0)', opacity: '1' },
                        },
                        fadeIn: {
                            '0%': { opacity: '0' },
                            '100%': { opacity: '1' },
                        }
                    }
                }
            }
        }
    </script>
    <style>
        .gradient-border {
            position: relative;
            background: white;
            border-radius: 1rem;
        }
        .gradient-border::before {
            content: '';
            position: absolute;
            inset: 0;
            border-radius: 1rem;
            padding: 2px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-mask: linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
            -webkit-mask-composite: xor;
            mask-composite: exclude;
        }
        .card-hover {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .card-hover:hover {
            transform: translateY(-8px) scale(1.02);
        }
        .glassmorphism {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-slate-50 via-blue-50 to-indigo-50 min-h-screen">

    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <!-- Main Content -->
    <div class="container mx-auto px-4 py-8">

        <!-- Welcome Section -->
        <div class="relative overflow-hidden bg-gradient-to-r from-blue-600 via-indigo-600 to-purple-600 text-white p-10 rounded-3xl shadow-2xl mb-10 animate-fadeIn">
            <!-- Decorative Elements -->
            <div class="absolute top-0 right-0 w-64 h-64 bg-white opacity-10 rounded-full -mr-32 -mt-32"></div>
            <div class="absolute bottom-0 left-0 w-48 h-48 bg-white opacity-10 rounded-full -ml-24 -mb-24"></div>

            <div class="relative z-10">
                <div class="flex items-center gap-3 mb-3">
                    <div class="w-2 h-12 bg-yellow-400 rounded-full animate-float"></div>
                    <h1 class="text-5xl font-extrabold tracking-tight">Welcome back!</h1>
                </div>
                <p class="text-2xl font-light mb-6 opacity-95">
                    <c:choose>
                        <c:when test="${not empty sessionScope.userEmail}">
                            ${sessionScope.userEmail}
                        </c:when>
                        <c:otherwise>
                            Guest User
                        </c:otherwise>
                    </c:choose>
                </p>
                <div class="inline-flex items-center gap-3 bg-white bg-opacity-20 backdrop-blur-sm px-6 py-3 rounded-full border border-white border-opacity-30">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9 6a3 3 0 11-6 0 3 3 0 016 0zM17 6a3 3 0 11-6 0 3 3 0 016 0zM12.93 17c.046-.327.07-.66.07-1a6.97 6.97 0 00-1.5-4.33A5 5 0 0119 16v1h-6.07zM6 11a5 5 0 015 5v1H1v-1a5 5 0 015-5z"></path>
                    </svg>
                    <span class="font-medium">Role:</span>
                    <span class="font-bold text-yellow-300">${sessionScope.userRole}</span>
                </div>
            </div>
        </div>

        <!-- Role-Based Dashboard Content -->
        <c:choose>
            <c:when test="${sessionScope.userRole == 'PARKING_OWNER'}">
                <!-- Parking Owner Dashboard -->
                <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8 animate-slideIn">

                    <!-- Parking Places Card -->
                    <a href="/parking/list" class="group relative bg-white p-8 rounded-2xl shadow-lg hover:shadow-2xl card-hover overflow-hidden">
                        <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-blue-400 to-blue-600 opacity-10 rounded-full -mr-16 -mt-16 group-hover:scale-150 transition-transform duration-500"></div>
                        <div class="relative z-10">
                            <div class="flex items-center justify-between mb-6">
                                <div class="bg-gradient-to-br from-blue-100 to-blue-200 p-4 rounded-2xl group-hover:scale-110 transition-transform duration-300">
                                    <svg class="w-10 h-10 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path>
                                    </svg>
                                </div>
                                <div class="text-right">
                                    <span class="text-4xl font-black text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-indigo-600">${parkingPlaceCount != null ? parkingPlaceCount : 0}</span>
                                    <p class="text-xs text-gray-500 font-medium mt-1">Total Places</p>
                                </div>
                            </div>
                            <h3 class="text-2xl font-bold text-gray-800 mb-2 group-hover:text-blue-600 transition-colors">My Parking Places</h3>
                            <p class="text-gray-600 text-sm font-medium">Manage your parking locations</p>
                        </div>
                    </a>

                    <!-- Create New Parking Card -->
                    <a href="/parking/create" class="group relative glassmorphism p-8 rounded-2xl shadow-lg hover:shadow-2xl card-hover border-2 border-dashed border-green-400 hover:border-green-500 overflow-hidden">
                        <div class="absolute inset-0 bg-gradient-to-br from-green-400 to-emerald-500 opacity-0 group-hover:opacity-10 transition-opacity duration-500"></div>
                        <div class="relative z-10">
                            <div class="flex items-center justify-center mb-6">
                                <div class="bg-gradient-to-br from-green-100 to-emerald-200 p-4 rounded-2xl group-hover:scale-110 group-hover:rotate-90 transition-all duration-500">
                                    <svg class="w-10 h-10 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                                    </svg>
                                </div>
                            </div>
                            <h3 class="text-2xl font-bold text-gray-800 mb-2 text-center group-hover:text-green-600 transition-colors">Create Parking Place</h3>
                            <p class="text-gray-600 text-sm text-center font-medium">Add a new parking location</p>
                        </div>
                    </a>

                    <!-- All Booking Card -->
                    <a href="/booking/owner/bookings" class="group relative bg-white p-8 rounded-2xl shadow-lg hover:shadow-2xl card-hover overflow-hidden">
                        <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-amber-400 to-orange-600 opacity-10 rounded-full -mr-16 -mt-16 group-hover:scale-150 transition-transform duration-500"></div>
                        <div class="relative z-10">
                            <div class="flex items-center justify-between mb-6">
                                <div class="bg-gradient-to-br from-amber-100 to-orange-200 p-4 rounded-2xl group-hover:scale-110 transition-transform duration-300">
                                    <svg class="w-10 h-10 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                    </svg>
                                </div>
                            </div>
                            <h3 class="text-2xl font-bold text-gray-800 mb-2 group-hover:text-amber-600 transition-colors">All Bookings</h3>
                            <p class="text-gray-600 text-sm font-medium">View all booking requests</p>
                        </div>
                    </a>

                    <!-- Promotions Card -->
                    <a href="/promotions/active" class="group relative bg-white p-8 rounded-2xl shadow-lg hover:shadow-2xl card-hover overflow-hidden">
                        <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-pink-400 to-rose-600 opacity-10 rounded-full -mr-16 -mt-16 group-hover:scale-150 transition-transform duration-500"></div>
                        <div class="relative z-10">
                            <div class="flex items-center justify-between mb-6">
                                <div class="bg-gradient-to-br from-pink-100 to-rose-200 p-4 rounded-2xl group-hover:scale-110 transition-transform duration-300">
                                    <svg class="w-10 h-10 text-pink-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"></path>
                                    </svg>
                                </div>
                            </div>
                            <h3 class="text-2xl font-bold text-gray-800 mb-2 group-hover:text-pink-600 transition-colors">Promotions</h3>
                            <p class="text-gray-600 text-sm font-medium">Manage your promotions</p>
                        </div>
                    </a>

                    <!-- Profile Card -->
                    <a href="/profile" class="group relative bg-white p-8 rounded-2xl shadow-lg hover:shadow-2xl card-hover overflow-hidden">
                        <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-slate-400 to-gray-600 opacity-10 rounded-full -mr-16 -mt-16 group-hover:scale-150 transition-transform duration-500"></div>
                        <div class="relative z-10">
                            <div class="flex items-center justify-between mb-6">
                                <div class="bg-gradient-to-br from-slate-100 to-gray-200 p-4 rounded-2xl group-hover:scale-110 transition-transform duration-300">
                                    <svg class="w-10 h-10 text-slate-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                    </svg>
                                </div>
                            </div>
                            <h3 class="text-2xl font-bold text-gray-800 mb-2 group-hover:text-slate-600 transition-colors">My Profile</h3>
                            <p class="text-gray-600 text-sm font-medium">Update account settings</p>
                        </div>
                    </a>

                    <!-- Quick Stats Card -->
                    <div class="relative bg-gradient-to-br from-indigo-500 via-purple-600 to-pink-600 text-white p-8 rounded-2xl shadow-2xl overflow-hidden col-span-full lg:col-span-1">
                        <div class="absolute top-0 right-0 w-40 h-40 bg-white opacity-10 rounded-full -mr-20 -mt-20"></div>
                        <div class="absolute bottom-0 left-0 w-32 h-32 bg-white opacity-10 rounded-full -ml-16 -mb-16"></div>
                        <div class="relative z-10">
                            <div class="flex items-center gap-2 mb-6">
                                <div class="w-1 h-8 bg-yellow-400 rounded-full"></div>
                                <h3 class="text-2xl font-bold">Quick Stats</h3>
                            </div>
                            <div class="space-y-4">
                                <div class="flex justify-between items-center p-3 bg-white bg-opacity-20 rounded-xl backdrop-blur-sm">
                                    <span class="font-medium">Total Slots:</span>
                                    <span class="text-2xl font-black">${totalSlots != null ? totalSlots : 0}</span>
                                </div>
                                <div class="flex justify-between items-center p-3 bg-white bg-opacity-20 rounded-xl backdrop-blur-sm">
                                    <span class="font-medium">Available:</span>
                                    <span class="text-2xl font-black text-green-300">${availableSlots != null ? availableSlots : 0}</span>
                                </div>
                                <div class="flex justify-between items-center p-3 bg-white bg-opacity-20 rounded-xl backdrop-blur-sm">
                                    <span class="font-medium">Occupied:</span>
                                    <span class="text-2xl font-black text-red-300">${totalSlots - availableSlots}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>

            <c:when test="${sessionScope.userRole == 'VEHICLE_OWNER'}">
                <!-- Vehicle Owner Dashboard -->
                <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8 animate-slideIn">

                    <!-- My Bookings Card -->
                    <a href="/booking/list" class="group relative bg-white p-8 rounded-2xl shadow-lg hover:shadow-2xl card-hover overflow-hidden">
                        <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-yellow-400 to-amber-600 opacity-10 rounded-full -mr-16 -mt-16 group-hover:scale-150 transition-transform duration-500"></div>
                        <div class="relative z-10">
                            <div class="flex items-center justify-between mb-6">
                                <div class="bg-gradient-to-br from-yellow-100 to-amber-200 p-4 rounded-2xl group-hover:scale-110 transition-transform duration-300">
                                    <svg class="w-10 h-10 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                    </svg>
                                </div>
                                <div class="text-right">
                                    <span class="text-4xl font-black text-transparent bg-clip-text bg-gradient-to-r from-yellow-600 to-amber-600">${bookingCount != null ? bookingCount : 0}</span>
                                    <p class="text-xs text-gray-500 font-medium mt-1">Bookings</p>
                                </div>
                            </div>
                            <h3 class="text-2xl font-bold text-gray-800 mb-2 group-hover:text-yellow-600 transition-colors">My Bookings</h3>
                            <p class="text-gray-600 text-sm font-medium">View your reservations</p>
                        </div>
                    </a>

                    <!-- My Vehicles Card -->
                    <a href="/vehicle/list" class="group relative bg-white p-8 rounded-2xl shadow-lg hover:shadow-2xl card-hover overflow-hidden">
                        <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-purple-400 to-violet-600 opacity-10 rounded-full -mr-16 -mt-16 group-hover:scale-150 transition-transform duration-500"></div>
                        <div class="relative z-10">
                            <div class="flex items-center justify-between mb-6">
                                <div class="bg-gradient-to-br from-purple-100 to-violet-200 p-4 rounded-2xl group-hover:scale-110 transition-transform duration-300">
                                    <svg class="w-10 h-10 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 17a2 2 0 11-4 0 2 2 0 014 0zM19 17a2 2 0 11-4 0 2 2 0 014 0z"></path>
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16V6a1 1 0 00-1-1H4a1 1 0 00-1 1v10a1 1 0 001 1h1m8-1a1 1 0 01-1 1H9m4-1V8a1 1 0 011-1h2.586a1 1 0 01.707.293l3.414 3.414a1 1 0 01.293.707V16a1 1 0 01-1 1h-1m-6-1a1 1 0 001 1h1M5 17a2 2 0 104 0m-4 0a2 2 0 114 0m6 0a2 2 0 104 0m-4 0a2 2 0 114 0"></path>
                                    </svg>
                                </div>
                                <div class="text-right">
                                    <span class="text-4xl font-black text-transparent bg-clip-text bg-gradient-to-r from-purple-600 to-violet-600">${vehicleCount != null ? vehicleCount : 0}</span>
                                    <p class="text-xs text-gray-500 font-medium mt-1">Vehicles</p>
                                </div>
                            </div>
                            <h3 class="text-2xl font-bold text-gray-800 mb-2 group-hover:text-purple-600 transition-colors">My Vehicles</h3>
                            <p class="text-gray-600 text-sm font-medium">Manage registered vehicles</p>
                        </div>
                    </a>

                    <!-- Register Vehicle Card -->
                    <a href="/vehicle/create" class="group relative glassmorphism p-8 rounded-2xl shadow-lg hover:shadow-2xl card-hover border-2 border-dashed border-purple-400 hover:border-purple-500 overflow-hidden">
                        <div class="absolute inset-0 bg-gradient-to-br from-purple-400 to-violet-500 opacity-0 group-hover:opacity-10 transition-opacity duration-500"></div>
                        <div class="relative z-10">
                            <div class="flex items-center justify-center mb-6">
                                <div class="bg-gradient-to-br from-purple-100 to-violet-200 p-4 rounded-2xl group-hover:scale-110 group-hover:rotate-90 transition-all duration-500">
                                    <svg class="w-10 h-10 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                                    </svg>
                                </div>
                            </div>
                            <h3 class="text-2xl font-bold text-gray-800 mb-2 text-center group-hover:text-purple-600 transition-colors">Register Vehicle</h3>
                            <p class="text-gray-600 text-sm text-center font-medium">Add a new vehicle</p>
                        </div>
                    </a>

                    <!-- Profile Card -->
                    <a href="/profile" class="group relative bg-white p-8 rounded-2xl shadow-lg hover:shadow-2xl card-hover overflow-hidden">
                        <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-slate-400 to-gray-600 opacity-10 rounded-full -mr-16 -mt-16 group-hover:scale-150 transition-transform duration-500"></div>
                        <div class="relative z-10">
                            <div class="flex items-center justify-between mb-6">
                                <div class="bg-gradient-to-br from-slate-100 to-gray-200 p-4 rounded-2xl group-hover:scale-110 transition-transform duration-300">
                                    <svg class="w-10 h-10 text-slate-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                    </svg>
                                </div>
                            </div>
                            <h3 class="text-2xl font-bold text-gray-800 mb-2 group-hover:text-slate-600 transition-colors">My Profile</h3>
                            <p class="text-gray-600 text-sm font-medium">Update account settings</p>
                        </div>
                    </a>

                    <!-- Parking Places Card -->
                    <a href="/parking/user/list" class="group relative bg-white p-8 rounded-2xl shadow-lg hover:shadow-2xl card-hover overflow-hidden">
                        <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-blue-400 to-cyan-600 opacity-10 rounded-full -mr-16 -mt-16 group-hover:scale-150 transition-transform duration-500"></div>
                        <div class="relative z-10">
                            <div class="flex items-center justify-between mb-6">
                                <div class="bg-gradient-to-br from-blue-100 to-cyan-200 p-4 rounded-2xl group-hover:scale-110 transition-transform duration-300">
                                    <svg class="w-10 h-10 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                    </svg>
                                </div>
                            </div>
                            <h3 class="text-2xl font-bold text-gray-800 mb-2 group-hover:text-blue-600 transition-colors">Parking Places</h3>
                            <p class="text-gray-600 text-sm font-medium">Browse available locations</p>
                        </div>
                    </a>

                    <!-- Promotions Card -->
                    <a href="/promotions/active" class="group relative bg-white p-8 rounded-2xl shadow-lg hover:shadow-2xl card-hover overflow-hidden">
                        <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-br from-pink-400 to-rose-600 opacity-10 rounded-full -mr-16 -mt-16 group-hover:scale-150 transition-transform duration-500"></div>
                        <div class="relative z-10">
                            <div class="flex items-center justify-between mb-6">
                                <div class="bg-gradient-to-br from-pink-100 to-rose-200 p-4 rounded-2xl group-hover:scale-110 transition-transform duration-300">
                                    <svg class="w-10 h-10 text-pink-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"></path>
                                    </svg>
                                </div>
                            </div>
                            <h3 class="text-2xl font-bold text-gray-800 mb-2 group-hover:text-pink-600 transition-colors">Promotions</h3>
                            <p class="text-gray-600 text-sm font-medium">View active promotions</p>
                        </div>
                    </a>

                    <!-- Activity Card -->
                    <div class="relative bg-gradient-to-br from-emerald-500 via-teal-600 to-cyan-600 text-white p-8 rounded-2xl shadow-2xl overflow-hidden col-span-full lg:col-span-1">
                        <div class="absolute top-0 right-0 w-40 h-40 bg-white opacity-10 rounded-full -mr-20 -mt-20"></div>
                        <div class="absolute bottom-0 left-0 w-32 h-32 bg-white opacity-10 rounded-full -ml-16 -mb-16"></div>
                        <div class="relative z-10">
                            <div class="flex items-center gap-2 mb-6">
                                <div class="w-1 h-8 bg-yellow-400 rounded-full"></div>
                                <h3 class="text-2xl font-bold">Recent Activity</h3>
                            </div>
                            <div class="space-y-4">
                                <div class="flex justify-between items-center p-3 bg-white bg-opacity-20 rounded-xl backdrop-blur-sm">
                                    <span class="font-medium">Active Bookings:</span>
                                    <span class="text-2xl font-black">${activeBookings != null ? activeBookings : 0}</span>
                                </div>
                                <div class="flex justify-between items-center p-3 bg-white bg-opacity-20 rounded-xl backdrop-blur-sm">
                                    <span class="font-medium">Completed:</span>
                                    <span class="text-2xl font-black text-green-300">${completedBookings != null ? completedBookings : 0}</span>
                                </div>
                                <div class="flex justify-between items-center p-3 bg-white bg-opacity-20 rounded-xl backdrop-blur-sm">
                                    <span class="font-medium">Vehicles:</span>
                                    <span class="text-2xl font-black text-blue-300">${vehicleCount != null ? vehicleCount : 0}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>

            <c:otherwise>
                <!-- Guest or No Role -->
                <div class="text-center py-16 animate-fadeIn">
                    <div class="bg-white p-12 rounded-3xl shadow-2xl max-w-2xl mx-auto">
                        <div class="mb-6">
                            <div class="inline-flex items-center justify-center w-24 h-24 bg-gradient-to-br from-blue-100 to-indigo-200 rounded-full mb-6">
                                <svg class="w-12 h-12 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                                </svg>
                            </div>
                        </div>
                        <h2 class="text-3xl font-bold text-gray-800 mb-4">Please log in to access dashboard features</h2>
                        <p class="text-gray-600 mb-8">Sign in to manage your parking spaces or book parking spots</p>
                        <a href="/login" class="inline-block bg-gradient-to-r from-blue-600 to-indigo-600 text-white px-8 py-4 rounded-xl hover:from-blue-700 hover:to-indigo-700 transition shadow-lg hover:shadow-xl font-semibold text-lg">
                            Go to Login
                        </a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

        <!-- Info Section -->
        <div class="mt-16 bg-white p-10 rounded-3xl shadow-xl animate-fadeIn">
            <div class="text-center mb-12">
                <h2 class="text-4xl font-bold text-gray-800 mb-3">How It Works</h2>
                <div class="w-24 h-1 bg-gradient-to-r from-blue-600 to-purple-600 mx-auto rounded-full"></div>
            </div>
            <div class="grid md:grid-cols-3 gap-10">
                <div class="text-center group">
                    <div class="relative inline-block mb-6">
                        <div class="bg-gradient-to-br from-blue-500 to-indigo-600 w-20 h-20 rounded-2xl flex items-center justify-center mx-auto shadow-lg group-hover:scale-110 group-hover:rotate-6 transition-all duration-300">
                            <span class="text-3xl font-black text-white">1</span>
                        </div>
                        <div class="absolute -top-2 -right-2 w-6 h-6 bg-yellow-400 rounded-full animate-pulse"></div>
                    </div>
                    <h3 class="text-2xl font-bold text-gray-800 mb-3">Register</h3>
                    <p class="text-gray-600 leading-relaxed">Create your account as Vehicle Owner or Parking Owner</p>
                </div>
                <div class="text-center group">
                    <div class="relative inline-block mb-6">
                        <div class="bg-gradient-to-br from-purple-500 to-pink-600 w-20 h-20 rounded-2xl flex items-center justify-center mx-auto shadow-lg group-hover:scale-110 group-hover:rotate-6 transition-all duration-300">
                            <span class="text-3xl font-black text-white">2</span>
                        </div>
                        <div class="absolute -top-2 -right-2 w-6 h-6 bg-green-400 rounded-full animate-pulse"></div>
                    </div>
                    <h3 class="text-2xl font-bold text-gray-800 mb-3">Setup</h3>
                    <p class="text-gray-600 leading-relaxed">Register your vehicles or create parking places</p>
                </div>
                <div class="text-center group">
                    <div class="relative inline-block mb-6">
                        <div class="bg-gradient-to-br from-green-500 to-teal-600 w-20 h-20 rounded-2xl flex items-center justify-center mx-auto shadow-lg group-hover:scale-110 group-hover:rotate-6 transition-all duration-300">
                            <span class="text-3xl font-black text-white">3</span>
                        </div>
                        <div class="absolute -top-2 -right-2 w-6 h-6 bg-blue-400 rounded-full animate-pulse"></div>
                    </div>
                    <h3 class="text-2xl font-bold text-gray-800 mb-3">Book & Manage</h3>
                    <p class="text-gray-600 leading-relaxed">Book parking slots or manage your parking business</p>
                </div>
            </div>
        </div>
    </div>

</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>