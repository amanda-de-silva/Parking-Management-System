<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Vehicle</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }
        @keyframes gradient {
            0%, 100% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
        }
        .animate-float {
            animation: float 6s ease-in-out infinite;
        }
        .animate-gradient {
            background-size: 200% 200%;
            animation: gradient 8s ease infinite;
        }
        .input-glow:focus {
            box-shadow: 0 0 30px rgba(139, 92, 246, 0.3);
        }
        .card-hover {
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .card-hover:hover {
            transform: translateY(-8px) scale(1.01);
        }
    </style>
    <script>
        function validateVehicleNumber() {
            var vehicleNumber = document.getElementById('vehicleNumber').value;
            var pattern = /^[A-Za-z0-9]{7}$/;

            if (!pattern.test(vehicleNumber)) {
                alert('Vehicle Number must be exactly 7 characters (letters and numbers only)');
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="min-h-screen relative overflow-x-hidden">
    <!-- Animated Background with Dark Overlay -->
    <div class="fixed inset-0 z-0">
        <img src="https://cdn.pixabay.com/photo/2020/08/24/06/04/cars-5512851_1280.jpg"
             alt="Background"
             class="w-full h-full object-cover">
        <div class="absolute inset-0 bg-gradient-to-br from-gray-900/75 via-slate-900/80 to-gray-900/75"></div>

        <!-- Floating Orbs -->
        <div class="absolute top-20 left-10 w-72 h-72 bg-gray-700/10 rounded-full blur-3xl animate-float"></div>
        <div class="absolute bottom-20 right-10 w-96 h-96 bg-slate-700/10 rounded-full blur-3xl animate-float" style="animation-delay: 2s;"></div>
        <div class="absolute top-1/2 left-1/3 w-64 h-64 bg-gray-600/10 rounded-full blur-3xl animate-float" style="animation-delay: 4s;"></div>
    </div>

    <!-- Include Header -->
    <div class="relative z-20">
        <jsp:include page="/WEB-INF/jsp/header.jsp" />
    </div>

    <div class="relative z-10 min-h-screen flex items-center justify-center p-4 pt-24 pb-8">
        <div class="bg-white rounded-3xl shadow-2xl w-full max-w-4xl border border-gray-200 overflow-hidden card-hover">
            <!-- Header Section with Modern Gradient -->
            <div class="relative bg-gradient-to-r from-violet-600 via-purple-600 to-fuchsia-600 p-10 text-center overflow-hidden animate-gradient">
                <!-- Decorative Elements -->
                <div class="absolute top-0 right-0 w-64 h-64 bg-white/10 rounded-full blur-3xl -translate-y-1/2 translate-x-1/2"></div>
                <div class="absolute bottom-0 left-0 w-48 h-48 bg-white/10 rounded-full blur-2xl translate-y-1/2 -translate-x-1/2"></div>

                <div class="relative z-10">
                    <div class="flex items-center justify-center mb-4">
                        <div class="bg-white/20 p-4 rounded-2xl backdrop-blur-xl mr-4 animate-float">
                            <svg class="w-14 h-14 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path>
                            </svg>
                        </div>
                        <div class="text-left">
                            <h1 class="text-4xl font-extrabold text-white tracking-tight">Register New Vehicle</h1>
                            <div class="h-1 w-32 bg-gradient-to-r from-yellow-300 to-pink-300 rounded-full mt-2"></div>
                        </div>
                    </div>
                    <p class="text-purple-100 text-base font-medium">Add your vehicle details to the system seamlessly</p>
                </div>
            </div>

            <div class="p-10">
                <!-- Error Message with Modern Design -->
                <c:if test="${not empty error}">
                    <div class="mb-8 bg-gradient-to-r from-red-50 to-pink-50 border-l-4 border-red-500 p-5 rounded-2xl flex items-start shadow-lg">
                        <div class="bg-red-100 rounded-full p-2 mr-4">
                            <svg class="w-6 h-6 text-red-600" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path>
                            </svg>
                        </div>
                        <span class="text-red-800 font-semibold text-lg">${error}</span>
                    </div>
                </c:if>

                <!-- Back to List Button -->
                <div class="mb-8">
                    <a href="${pageContext.request.contextPath}/vehicle/list"
                       class="inline-flex items-center px-6 py-3 bg-gradient-to-r from-gray-100 to-gray-200 text-gray-800 rounded-xl hover:from-gray-200 hover:to-gray-300 transition-all duration-300 font-semibold shadow-md hover:shadow-xl transform hover:-translate-y-1">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
                        </svg>
                        Back to List
                    </a>
                </div>

                <div class="relative mb-8">
                    <div class="absolute inset-0 flex items-center">
                        <div class="w-full border-t-2 border-gradient-to-r from-purple-200 via-violet-200 to-fuchsia-200"></div>
                    </div>
                    <div class="relative flex justify-center">
                        <span class="bg-white px-6 text-sm font-bold text-purple-600 uppercase tracking-wider">Vehicle Information</span>
                    </div>
                </div>

                <!-- Form -->
                <form action="${pageContext.request.contextPath}/vehicle/create" method="post" class="space-y-7" onsubmit="return validateVehicleNumber()">
                    <!-- Vehicle Number -->
                    <div class="grid md:grid-cols-3 gap-6 items-start">
                        <label for="vehicleNumber" class="text-sm font-bold text-gray-800 pt-4 flex items-center">
                            <div class="bg-gradient-to-br from-violet-500 to-purple-600 p-2 rounded-lg mr-3 shadow-md">
                                <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 20l4-16m2 16l4-16M6 9h14M4 15h14"></path>
                                </svg>
                            </div>
                            Vehicle Number:
                        </label>
                        <div class="md:col-span-2">
                            <input type="text" id="vehicleNumber" name="vehicleNumber" required maxlength="7" pattern="[A-Za-z0-9]{7}"
                                   class="w-full px-5 py-4 border-2 border-purple-200 rounded-2xl focus:ring-4 focus:ring-purple-300 focus:border-purple-500 transition-all outline-none input-glow bg-white font-medium text-gray-800"
                                   placeholder="Enter vehicle registration number">
                        </div>
                    </div>

                    <!-- Vehicle Type -->
                    <div class="grid md:grid-cols-3 gap-6 items-start">
                        <label for="vehicleType" class="text-sm font-bold text-gray-800 pt-4 flex items-center">
                            <div class="bg-gradient-to-br from-fuchsia-500 to-pink-600 p-2 rounded-lg mr-3 shadow-md">
                                <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
                                </svg>
                            </div>
                            Vehicle Type:
                        </label>
                        <div class="md:col-span-2">
                            <select id="vehicleType" name="vehicleType" required
                                    class="w-full px-5 py-4 border-2 border-purple-200 rounded-2xl focus:ring-4 focus:ring-purple-300 focus:border-purple-500 transition-all outline-none input-glow bg-white font-medium text-gray-800">
                                <option value="">Select Type</option>
                                <option value="Car">Car</option>
                                <option value="Motorbike">Motorbike</option>
                                <option value="Truck">Truck</option>
                                <option value="Van">Van</option>
                                <option value="SUV">SUV</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                    </div>

                    <!-- Vehicle Brand -->
                    <div class="grid md:grid-cols-3 gap-6 items-start">
                        <label for="vehicleBrand" class="text-sm font-bold text-gray-800 pt-4 flex items-center">
                            <div class="bg-gradient-to-br from-purple-500 to-violet-600 p-2 rounded-lg mr-3 shadow-md">
                                <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"></path>
                                </svg>
                            </div>
                            Vehicle Brand:
                        </label>
                        <div class="md:col-span-2">
                            <input type="text" id="vehicleBrand" name="vehicleBrand" required
                                   class="w-full px-5 py-4 border-2 border-purple-200 rounded-2xl focus:ring-4 focus:ring-purple-300 focus:border-purple-500 transition-all outline-none input-glow bg-white font-medium text-gray-800"
                                   placeholder="Enter vehicle brand (e.g., Toyota, Honda)">
                        </div>
                    </div>

                    <!-- Vehicle Model -->
                    <div class="grid md:grid-cols-3 gap-6 items-start">
                        <label for="vehicleModel" class="text-sm font-bold text-gray-800 pt-4 flex items-center">
                            <div class="bg-gradient-to-br from-pink-500 to-rose-600 p-2 rounded-lg mr-3 shadow-md">
                                <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path>
                                </svg>
                            </div>
                            Vehicle Model:
                        </label>
                        <div class="md:col-span-2">
                            <input type="text" id="vehicleModel" name="vehicleModel" required
                                   class="w-full px-5 py-4 border-2 border-purple-200 rounded-2xl focus:ring-4 focus:ring-purple-300 focus:border-purple-500 transition-all outline-none input-glow bg-white font-medium text-gray-800"
                                   placeholder="Enter vehicle model">
                        </div>
                    </div>

                    <!-- Vehicle Color -->
                    <div class="grid md:grid-cols-3 gap-6 items-start">
                        <label for="vehicleColor" class="text-sm font-bold text-gray-800 pt-4 flex items-center">
                            <div class="bg-gradient-to-br from-violet-500 to-indigo-600 p-2 rounded-lg mr-3 shadow-md">
                                <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 21a4 4 0 01-4-4V5a2 2 0 012-2h4a2 2 0 012 2v12a4 4 0 01-4 4zm0 0h12a2 2 0 002-2v-4a2 2 0 00-2-2h-2.343M11 7.343l1.657-1.657a2 2 0 012.828 0l2.829 2.829a2 2 0 010 2.828l-8.486 8.485M7 17h.01"></path>
                                </svg>
                            </div>
                            Vehicle Color:
                        </label>
                        <div class="md:col-span-2">
                            <input type="text" id="vehicleColor" name="vehicleColor"
                                   class="w-full px-5 py-4 border-2 border-purple-200 rounded-2xl focus:ring-4 focus:ring-purple-300 focus:border-purple-500 transition-all outline-none input-glow bg-white font-medium text-gray-800"
                                   placeholder="Enter vehicle color (optional)">
                        </div>
                    </div>

                    <!-- Buttons -->
                    <div class="flex flex-col sm:flex-row justify-center gap-5 pt-8">
                        <button type="submit"
                                class="flex-1 sm:flex-initial px-10 py-4 bg-gradient-to-r from-violet-600 via-purple-600 to-fuchsia-600 text-white rounded-2xl hover:from-violet-700 hover:via-purple-700 hover:to-fuchsia-700 transition-all duration-300 shadow-xl hover:shadow-2xl transform hover:-translate-y-1 hover:scale-105 font-bold text-lg flex items-center justify-center gap-3 animate-gradient">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                            </svg>
                            Register Vehicle
                        </button>
                        <button type="reset"
                                class="flex-1 sm:flex-initial px-10 py-4 bg-gradient-to-r from-gray-600 to-gray-700 text-white rounded-2xl hover:from-gray-700 hover:to-gray-800 transition-all duration-300 shadow-xl hover:shadow-2xl transform hover:-translate-y-1 hover:scale-105 font-bold text-lg flex items-center justify-center gap-3">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"></path>
                            </svg>
                            Reset
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>