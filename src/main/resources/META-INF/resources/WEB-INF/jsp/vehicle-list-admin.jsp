<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin - Vehicle List</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#4f46e5',
                        secondary: '#06b6d4'
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-gradient-to-br from-slate-50 to-slate-100 min-h-screen">
<!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />
    <div class="container mx-auto px-4 py-8">
        <!-- Header Section -->
        <div class="mb-8">
            <div class="flex items-center justify-between">
                <div>
                    <h2 class="text-4xl font-bold text-slate-800 mb-2">All Vehicles</h2>
                    <p class="text-slate-600">Manage and monitor all registered vehicles</p>
                </div>
                <div class="bg-white rounded-lg shadow-md px-6 py-4">
                    <p class="text-sm text-slate-600">Total Vehicles</p>
                    <p class="text-3xl font-bold text-primary">${vehicles.size()}</p>
                </div>
            </div>
        </div>

        <!-- Table Container -->
        <div class="bg-white rounded-xl shadow-xl overflow-hidden border border-slate-200">
            <!-- Table Header -->
            <div class="bg-gradient-to-r from-primary to-secondary px-6 py-4">
                <h3 class="text-xl font-semibold text-white">Vehicle Registry</h3>
            </div>

            <!-- Table Wrapper for Horizontal Scroll -->
            <div class="overflow-x-auto">
                <table class="w-full">
                    <thead>
                        <tr class="bg-slate-50 border-b-2 border-slate-200">
                            <th class="px-6 py-4 text-left text-xs font-semibold text-slate-700 uppercase tracking-wider">ID</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-slate-700 uppercase tracking-wider">Number</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-slate-700 uppercase tracking-wider">Type</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-slate-700 uppercase tracking-wider">Brand</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-slate-700 uppercase tracking-wider">Model</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-slate-700 uppercase tracking-wider">Color</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-slate-700 uppercase tracking-wider">User ID</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-slate-700 uppercase tracking-wider">Active</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-200">
                        <c:forEach var="vehicle" items="${vehicles}">
                            <tr class="hover:bg-slate-50 transition-colors duration-200">
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex items-center">
                                        <div class="h-10 w-10 flex-shrink-0 flex items-center justify-center bg-primary bg-opacity-10 rounded-full">
                                            <span class="text-primary font-semibold text-sm">${vehicle.id}</span>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm font-semibold text-slate-900">${vehicle.vehicleNumber}</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-blue-100 text-blue-800">
                                        ${vehicle.vehicleType}
                                    </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-slate-700 font-medium">
                                    ${vehicle.vehicleBrand}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-slate-600">
                                    ${vehicle.vehicleModel}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex items-center">
                                        <div class="h-4 w-4 rounded-full border-2 border-slate-300 mr-2" style="background-color: ${vehicle.vehicleColor}"></div>
                                        <span class="text-sm text-slate-700">${vehicle.vehicleColor}</span>
                                    </div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-slate-600">
                                    ${vehicle.userId}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <c:choose>
                                        <c:when test="${vehicle.active == true || vehicle.active == 'true' || vehicle.active == 1}">
                                            <span class="px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                                                Active
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-red-100 text-red-800">
                                                Inactive
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Table Footer -->
            <div class="bg-slate-50 px-6 py-4 border-t border-slate-200">
                <p class="text-sm text-slate-600">Showing all vehicles in the system</p>
            </div>
        </div>
    </div>
</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>