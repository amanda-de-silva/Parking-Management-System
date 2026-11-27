<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<footer class="bg-blue-600 text-white mt-auto">
    <div class="container mx-auto px-4 py-8">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- About Section -->
            <div>
                <div class="flex items-center space-x-2 mb-4">
                    <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4"></path>
                    </svg>
                    <h3 class="text-xl font-bold">ParkingHub</h3>
                </div>
                <p class="text-blue-100 text-sm">
                    Your trusted platform for convenient and secure parking space management.
                </p>
            </div>

            <!-- Quick Links -->
            <div>
                <h4 class="text-lg font-semibold mb-4">Quick Links</h4>
                <ul class="space-y-2">
                    <c:choose>
                        <c:when test="${not empty sessionScope.userEmail}">
                            <c:choose>
                                <c:when test="${sessionScope.userRole == 'ADMIN'}">
                                    <li><span class="text-blue-100 text-sm">Dashboard</span></li>
                                </c:when>
                                <c:otherwise>
                                    <li><span class="text-blue-100 text-sm">Dashboard</span></li>
                                </c:otherwise>
                            </c:choose>
                            <li><span class="text-blue-100 text-sm">Profile</span></li>
                            <c:if test="${sessionScope.userRole == 'VEHICLE_OWNER'}">
                                <li><span class="text-blue-100 text-sm">My Vehicles</span></li>
                                <li><span class="text-blue-100 text-sm">My Bookings</span></li>
                            </c:if>
                            <c:if test="${sessionScope.userRole == 'PARKING_OWNER'}">
                                <li><span class="text-blue-100 text-sm">My Parking Places</span></li>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <li><span class="text-blue-100 text-sm">Home</span></li>
                            <li><span class="text-blue-100 text-sm">Login</span></li>
                            <li><span class="text-blue-100 text-sm">Register</span></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>

            <!-- Contact & Support -->
            <div>
                <h4 class="text-lg font-semibold mb-4">Contact & Support</h4>
                <ul class="space-y-2">
                    <c:if test="${not empty sessionScope.userEmail}">
                        <li>
                            <span class="text-blue-100 text-sm flex items-center">
                                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z"></path>
                                </svg>
                                Create Ticket
                            </span>
                        </li>
                    </c:if>
                    <li class="text-blue-100 text-sm flex items-center">
                        <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                        </svg>
                        support@parkinghub.com
                    </li>
                    <li class="text-blue-100 text-sm flex items-center">
                        <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path>
                        </svg>
                        +1 (555) 123-4567
                    </li>
                </ul>
            </div>
        </div>

        <!-- Bottom Bar -->
        <div class="border-t border-blue-500 mt-8 pt-6 text-center">
            <p class="text-blue-100 text-sm">
                &copy; <span id="currentYear"></span> ParkingHub. All rights reserved.
            </p>
        </div>
    </div>
</footer>

<script>
    // Set current year dynamically
    document.getElementById('currentYear').textContent = new Date().getFullYear();
</script>