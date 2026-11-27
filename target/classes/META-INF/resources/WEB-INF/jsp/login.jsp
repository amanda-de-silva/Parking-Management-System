<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-blue-50 via-indigo-50 to-purple-50 flex items-center justify-center min-h-screen relative overflow-hidden">
    <!-- Background Image with Overlay -->
    <div class="absolute inset-0 z-0">
        <img src="https://images.unsplash.com/photo-1506521781263-d8422e82f27a?w=1920&q=80"
             alt="Background"
             class="w-full h-full object-cover" />
        <div class="absolute inset-0 bg-black/60"></div>
    </div>

    <!-- Animated Background Elements -->
    <div class="absolute inset-0 z-0 overflow-hidden">
        <div class="absolute top-20 left-20 w-72 h-72 bg-blue-400 rounded-full mix-blend-multiply filter blur-xl opacity-20 animate-blob"></div>
        <div class="absolute top-40 right-20 w-72 h-72 bg-purple-400 rounded-full mix-blend-multiply filter blur-xl opacity-20 animate-blob animation-delay-2000"></div>
        <div class="absolute bottom-20 left-40 w-72 h-72 bg-indigo-400 rounded-full mix-blend-multiply filter blur-xl opacity-20 animate-blob animation-delay-4000"></div>
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

    <div class="relative z-10 bg-white/90 backdrop-blur-xl p-10 rounded-3xl shadow-2xl w-full max-w-md border border-white/20">
        <!-- Logo/Icon Section -->
        <div class="flex justify-center mb-6">
            <div class="w-16 h-16 bg-gradient-to-br from-blue-500 to-purple-600 rounded-2xl flex items-center justify-center shadow-lg transform hover:scale-110 transition-transform duration-300">
                <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                </svg>
            </div>
        </div>

        <h1 class="text-3xl font-bold mb-2 text-center bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">Welcome Back</h1>
        <p class="text-gray-600 text-center mb-8 text-sm">Sign in to continue to your account</p>

        <div id="message" class="mb-4 text-center text-sm"></div>

        <form id="loginForm">
            <div class="mb-5">
                <label for="username" class="block mb-2 font-semibold text-gray-700 text-sm">Email Address</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207"></path>
                        </svg>
                    </div>
                    <input type="email" id="username" required
                           class="w-full pl-10 pr-4 py-3 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-100 transition-all duration-300 bg-gray-50/50"
                           placeholder="you@example.com" />
                </div>
            </div>
            <div class="mb-6">
                <label for="password" class="block mb-2 font-semibold text-gray-700 text-sm">Password</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                        </svg>
                    </div>
                    <input type="password" id="password" required
                           class="w-full pl-10 pr-4 py-3 border-2 border-gray-200 rounded-xl focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-100 transition-all duration-300 bg-gray-50/50"
                           placeholder="••••••••" />
                </div>
            </div>
            <button type="submit" class="w-full bg-gradient-to-r from-blue-600 to-purple-600 text-white py-3 rounded-xl font-semibold shadow-lg hover:shadow-xl hover:scale-[1.02] active:scale-[0.98] transition-all duration-300 transform">
                Sign In
            </button>
        </form>

        <div class="mt-6 text-center">
            <p class="text-gray-600 text-sm">
                Don't have an account?
                <a href="/register" class="text-blue-600 hover:text-purple-600 font-semibold hover:underline transition-colors duration-300">Create Account</a>
            </p>
        </div>

        <!-- Decorative Line -->
        <div class="mt-6 flex items-center">
            <div class="flex-1 border-t border-gray-300"></div>
            <span class="px-4 text-xs text-gray-500">SECURE LOGIN</span>
            <div class="flex-1 border-t border-gray-300"></div>
        </div>
    </div>

    <script>
        const loginForm = document.getElementById('loginForm');
        const messageDiv = document.getElementById('message');

        loginForm.addEventListener('submit', async (e) => {
            e.preventDefault();

            // Clear previous message
            messageDiv.textContent = '';
            messageDiv.className = 'mb-4 text-center text-sm';

            const payload = {
                email: document.getElementById('username').value,
                password: document.getElementById('password').value
            };

            try {
                const response = await fetch('/api/auth/login', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(payload)
                });

                const data = await response.json();

                if (response.ok) {
                    messageDiv.textContent = "Login successful! Redirecting...";
                    messageDiv.classList.add('text-green-500');

                    // Redirect based on role
                    if (data.role && data.role.toLowerCase() === 'admin') {
                        setTimeout(() => window.location.href = '/home', 1000);
                    } else {
                        setTimeout(() => window.location.href = '/home', 1000);
                    }
                } else {
                    messageDiv.textContent = data.error || "Login failed!";
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