<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-green-50 via-emerald-50 to-teal-50 flex items-center justify-center min-h-screen py-8 relative overflow-hidden">
    <!-- Background Image with Overlay -->
    <div class="absolute inset-0 z-0">
        <img src="https://images.unsplash.com/photo-1506521781263-d8422e82f27a?w=1920&q=80"
             alt="Background"
             class="w-full h-full object-cover" />
        <div class="absolute inset-0 bg-black/60"></div>
    </div>

    <!-- Animated Background Elements -->
    <div class="absolute inset-0 z-0 overflow-hidden">
        <div class="absolute top-20 left-20 w-72 h-72 bg-green-400 rounded-full mix-blend-multiply filter blur-xl opacity-20 animate-blob"></div>
        <div class="absolute top-40 right-20 w-72 h-72 bg-teal-400 rounded-full mix-blend-multiply filter blur-xl opacity-20 animate-blob animation-delay-2000"></div>
        <div class="absolute bottom-20 left-40 w-72 h-72 bg-emerald-400 rounded-full mix-blend-multiply filter blur-xl opacity-20 animate-blob animation-delay-4000"></div>
    </div>

    <style>
        @keyframes blob {
            0%, 100% { transform: translate(0, 0) scale(1); }
            33% { transform: translate(30px, -50px) scale(1.1); }
            66% { transform: translate(-20px, 20px) scale(0.9); }
        }
        .animate-blob {
            animation: blob 7s infinite;
        }
        .animation-delay-2000 {
            animation-delay: 2s;
        }
        .animation-delay-4000 {
            animation-delay: 4s;
        }
    </style>

    <div class="relative z-10 bg-white/90 backdrop-blur-xl p-8 rounded-3xl shadow-2xl w-full max-w-5xl border border-white/20">
        <div class="flex items-center gap-8">
            <!-- Left Side - Logo and Welcome Text -->
            <div class="flex-shrink-0 flex flex-col items-center justify-center w-64">
                <!-- Logo/Icon Section -->
                <div class="flex justify-center mb-4">
                    <div class="w-16 h-16 bg-gradient-to-br from-green-500 to-teal-600 rounded-2xl flex items-center justify-center shadow-lg transform hover:scale-110 transition-transform duration-300">
                        <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                        </svg>
                    </div>
                </div>

                <h1 class="text-3xl font-bold mb-2 text-center bg-gradient-to-r from-green-600 to-teal-600 bg-clip-text text-transparent">Create Account</h1>
                <p class="text-gray-600 text-center text-sm">Join us and start your journey today</p>
            </div>

            <!-- Divider -->
            <div class="h-96 w-px bg-gradient-to-b from-transparent via-gray-300 to-transparent"></div>

            <!-- Right Side - Form -->
            <div class="flex-1">
                <div id="message" class="mb-4 text-center text-sm"></div>

                <form id="registerForm">
                    <div class="grid grid-cols-2 gap-4">
                        <!-- First Name -->
                        <div>
                            <label for="firstName" class="block mb-1.5 font-semibold text-gray-700 text-xs">First Name</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                    </svg>
                                </div>
                                <input type="text" id="firstName" required
                                       class="w-full pl-9 pr-3 py-2.5 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-green-500 focus:ring-4 focus:ring-green-100 transition-all duration-300 bg-gray-50/50 text-sm"
                                       placeholder="John"/>
                            </div>
                        </div>

                        <!-- Last Name -->
                        <div>
                            <label for="lastName" class="block mb-1.5 font-semibold text-gray-700 text-xs">Last Name</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                    </svg>
                                </div>
                                <input type="text" id="lastName" required
                                       class="w-full pl-9 pr-3 py-2.5 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-green-500 focus:ring-4 focus:ring-green-100 transition-all duration-300 bg-gray-50/50 text-sm"
                                       placeholder="Doe"/>
                            </div>
                        </div>
                    </div>

                    <!-- Email Address -->
                    <div class="mt-3">
                        <label for="email" class="block mb-1.5 font-semibold text-gray-700 text-xs">Email Address</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207"></path>
                                </svg>
                            </div>
                            <input type="email" id="email" required
                                   class="w-full pl-9 pr-3 py-2.5 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-green-500 focus:ring-4 focus:ring-green-100 transition-all duration-300 bg-gray-50/50 text-sm"
                                   placeholder="you@example.com"/>
                        </div>
                    </div>

                    <!-- Register As -->
                    <div class="mt-3">
                        <label for="role" class="block mb-1.5 font-semibold text-gray-700 text-xs">Register As</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                                </svg>
                            </div>
                            <select id="role" required
                                    class="w-full pl-9 pr-3 py-2.5 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-green-500 focus:ring-4 focus:ring-green-100 transition-all duration-300 bg-gray-50/50 appearance-none cursor-pointer text-sm">
                                <option value="">Select Role</option>
                                <option value="VEHICLE_OWNER">Vehicle Owner (Book Parking)</option>
                                <option value="PARKING_OWNER">Parking Owner (Provide Parking)</option>
                            </select>
                            <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                                <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                                </svg>
                            </div>
                        </div>
                        <p class="text-xs text-gray-600 mt-1.5 ml-1 flex items-start">
                            <svg class="w-3.5 h-3.5 text-green-500 mr-1 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path>
                            </svg>
                            <span>Vehicle owners can book parking slots. Parking owners can register parking places.</span>
                        </p>
                    </div>

                    <div class="grid grid-cols-2 gap-4 mt-3">
                        <!-- Password -->
                        <div>
                            <label for="password" class="block mb-1.5 font-semibold text-gray-700 text-xs">Password</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                                    </svg>
                                </div>
                                <input type="password" id="password" required
                                       class="w-full pl-9 pr-3 py-2.5 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-green-500 focus:ring-4 focus:ring-green-100 transition-all duration-300 bg-gray-50/50 text-sm"
                                       placeholder="••••••••"/>
                            </div>
                        </div>

                        <!-- Confirm Password -->
                        <div>
                            <label for="confirmPassword" class="block mb-1.5 font-semibold text-gray-700 text-xs">Confirm Password</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                    </svg>
                                </div>
                                <input type="password" id="confirmPassword" required
                                       class="w-full pl-9 pr-3 py-2.5 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-green-500 focus:ring-4 focus:ring-green-100 transition-all duration-300 bg-gray-50/50 text-sm"
                                       placeholder="••••••••"/>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="w-full bg-gradient-to-r from-green-600 to-teal-600 text-white py-2.5 rounded-xl font-semibold shadow-lg hover:shadow-xl hover:scale-[1.02] active:scale-[0.98] transition-all duration-300 transform mt-4 text-sm">
                        Create Account
                    </button>
                </form>

                <div class="mt-4 text-center">
                    <p class="text-gray-600 text-xs">
                        Already have an account?
                        <a href="/login" class="text-green-600 hover:text-teal-600 font-semibold hover:underline transition-colors duration-300">Sign In</a>
                    </p>
                </div>

                <!-- Decorative Line -->
                <div class="mt-4 flex items-center">
                    <div class="flex-1 border-t border-gray-300"></div>
                    <span class="px-3 text-xs text-gray-500">SECURE REGISTRATION</span>
                    <div class="flex-1 border-t border-gray-300"></div>
                </div>
            </div>
        </div>
    </div>

    <script>
        const form = document.getElementById('registerForm');
        const messageDiv = document.getElementById('message');

        form.addEventListener('submit', async (e) => {
            e.preventDefault();

            // Clear previous message
            messageDiv.textContent = '';
            messageDiv.className = 'mb-4 text-center text-sm';

            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const role = document.getElementById('role').value;

            if (!role) {
                messageDiv.textContent = "Please select a role!";
                messageDiv.classList.add('text-red-500');
                return;
            }

            if (password !== confirmPassword) {
                messageDiv.textContent = "Passwords do not match!";
                messageDiv.classList.add('text-red-500');
                return;
            }

            const payload = {
                firstName: document.getElementById('firstName').value,
                lastName: document.getElementById('lastName').value,
                email: document.getElementById('email').value,
                role: role,
                password: password,
                confirmPassword: confirmPassword
            };

            try {
                const response = await fetch('/api/auth/register', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(payload)
                });

                const data = await response.json();

                if (response.ok) {
                    messageDiv.textContent = "User registered successfully! Redirecting to login...";
                    messageDiv.classList.add('text-green-500');
                    setTimeout(() => window.location.href = '/login', 1500);
                } else {
                    messageDiv.textContent = data.error || "Registration failed!";
                    messageDiv.classList.add('text-red-500');
                }
            } catch (err) {
                console.error(err);
                messageDiv.textContent = "Something went wrong!";
                messageDiv.classList.add('text-red-500');
            }
        });
    </script>
</body>
</html>