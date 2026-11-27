<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="bg-blue-600 text-white shadow-lg">
    <div class="container mx-auto px-4">
        <div class="flex items-center justify-between py-4">
            <!-- Logo -->
            <div class="flex items-center space-x-2">
                <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4"></path>
                </svg>
                <a href="/home" class="text-2xl font-bold">ParkingHub</a>
            </div>

            <!-- Desktop Navigation -->
            <div class="hidden md:flex items-center space-x-6">
                <c:choose>
                    <c:when test="${not empty sessionScope.userEmail}">
                        <!-- Common -->
                        <c:choose>
                            <c:when test="${sessionScope.userRole == 'ADMIN'}">
                                <a href="/admin/dashboard" class="hover:text-blue-200 transition font-medium">Dashboard</a>
                            </c:when>
                            <c:otherwise>
                                <a href="/dashboard" class="hover:text-blue-200 transition font-medium">Dashboard</a>
                            </c:otherwise>
                        </c:choose>

                        <!-- Vehicle Owner Links -->
                        <c:if test="${sessionScope.userRole == 'VEHICLE_OWNER'}">
                            <a href="/vehicle/list" class="hover:text-blue-200 transition font-medium">My Vehicles</a>
                            <a href="/booking/list" class="hover:text-blue-200 transition font-medium">My Bookings</a>
                            <a href="/feedbacks/new" class="hover:text-blue-200 transition font-medium">Create Tickets</a>
                        </c:if>

                        <!-- Parking Owner Links -->
                        <c:if test="${sessionScope.userRole == 'PARKING_OWNER'}">
                            <a href="/parking/list" class="hover:text-blue-200 transition font-medium">My Parking Places</a>
                            <a href="/feedbacks/new" class="hover:text-blue-200 transition font-medium">Create Tickets</a>
                        </c:if>

                        <!-- User Dropdown -->
                        <div class="relative">
                            <button id="user-menu-btn" class="flex items-center space-x-2 hover:text-blue-200 transition font-medium">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                </svg>
                                <span>${sessionScope.userEmail}</span>
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M19 9l-7 7-7-7"></path>
                                </svg>
                            </button>

                            <!-- Dropdown -->
                            <div id="user-menu" class="hidden absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-lg py-2 z-50">
                                <a href="/profile" class="block px-4 py-2 text-gray-800 hover:bg-blue-50 transition">
                                    <svg class="w-4 h-4 inline mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                    </svg>
                                    Profile
                                </a>
                                <div class="px-4 py-2 text-sm text-gray-600 border-t">
                                    Role: <span class="font-semibold">${sessionScope.userRole}</span>
                                </div>
                                <button onclick="logout()"
                                        class="w-full text-left px-4 py-2 text-red-600 hover:bg-red-50 transition border-t">
                                    <svg class="w-4 h-4 inline mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                                    </svg>
                                    Logout
                                </button>
                            </div>
                        </div>
                    </c:when>

                    <c:otherwise>
                        <a href="/login" class="hover:text-blue-200 transition font-medium">Login</a>
                        <a href="/register"
                           class="bg-white text-blue-600 px-4 py-2 rounded-lg hover:bg-gray-100 transition font-medium">
                            Register
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Mobile Menu Button -->
            <button id="mobile-menu-btn" class="md:hidden">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M4 6h16M4 12h16M4 18h16"></path>
                </svg>
            </button>
        </div>

        <!-- Mobile Navigation -->
        <div id="mobile-menu" class="hidden md:hidden pb-4">
            <c:choose>
                <c:when test="${not empty sessionScope.userEmail}">
                    <c:choose>
                        <c:when test="${sessionScope.userRole == 'ADMIN'}">
                            <a href="/admin/dashboard" class="block py-2 hover:text-blue-200 transition">Dashboard</a>
                        </c:when>
                        <c:otherwise>
                            <a href="/dashboard" class="block py-2 hover:text-blue-200 transition">Dashboard</a>
                        </c:otherwise>
                    </c:choose>

                    <!-- Vehicle Owner -->
                    <c:if test="${sessionScope.userRole == 'VEHICLE_OWNER'}">
                        <a href="/vehicle/list" class="block py-2 hover:text-blue-200 transition">My Vehicles</a>
                        <a href="/booking/list" class="block py-2 hover:text-blue-200 transition">My Bookings</a>
                        <a href="/feedbacks/new" class="block py-2 hover:text-blue-200 transition">Create Tickets</a>
                    </c:if>

                    <!-- Parking Owner -->
                    <c:if test="${sessionScope.userRole == 'PARKING_OWNER'}">
                        <a href="/parking/list" class="block py-2 hover:text-blue-200 transition">My Parking Places</a>
                        <a href="/feedbacks/new" class="block py-2 hover:text-blue-200 transition">Create Tickets</a>
                    </c:if>

                    <a href="/profile" class="block py-2 hover:text-blue-200 transition">
                        Profile (${sessionScope.userEmail})
                    </a>
                    <div class="text-sm py-2 border-t border-blue-500">
                        Role: ${sessionScope.userRole}
                    </div>
                    <button onclick="logout()"
                            class="block w-full text-left py-2 text-red-200 hover:text-white transition border-t border-blue-500">
                        Logout
                    </button>
                </c:when>

                <c:otherwise>
                    <a href="/login" class="block py-2 hover:text-blue-200 transition">Login</a>
                    <a href="/register" class="block py-2 hover:text-blue-200 transition">Register</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

<script>
    // Mobile menu toggle
    document.getElementById('mobile-menu-btn')?.addEventListener('click', function () {
        const menu = document.getElementById('mobile-menu');
        menu.classList.toggle('hidden');
    });

    // User dropdown toggle
    const userMenuBtn = document.getElementById('user-menu-btn');
    const userMenu = document.getElementById('user-menu');

    if (userMenuBtn && userMenu) {
        userMenuBtn.addEventListener('click', function(e) {
            e.stopPropagation();
            userMenu.classList.toggle('hidden');
        });

        // Close dropdown when clicking outside
        document.addEventListener('click', function(e) {
            if (!userMenuBtn.contains(e.target) && !userMenu.contains(e.target)) {
                userMenu.classList.add('hidden');
            }
        });
    }

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