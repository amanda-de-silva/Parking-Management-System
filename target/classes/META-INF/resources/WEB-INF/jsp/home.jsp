<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ParkEase - Smart Parking Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: scale(1.1);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        .slide-active {
            animation: slideIn 1s ease-in-out;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px);
            }
            50% {
                transform: translateY(-20px);
            }
        }

        .float-animation {
            animation: float 3s ease-in-out infinite;
        }

        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .card-hover {
            transition: all 0.3s ease;
        }

        .card-hover:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        .smooth-scroll {
            scroll-behavior: smooth;
        }

        @keyframes pulse-glow {
            0%, 100% {
                box-shadow: 0 0 20px rgba(102, 126, 234, 0.4);
            }
            50% {
                box-shadow: 0 0 40px rgba(102, 126, 234, 0.8);
            }
        }

        .pulse-glow {
            animation: pulse-glow 2s ease-in-out infinite;
        }
    </style>
</head>
<body class="smooth-scroll">

<!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <!-- Hero Banner Section with Slideshow -->
    <section id="hero" class="relative h-screen overflow-hidden">
        <!-- Slideshow Container -->
        <div class="absolute inset-0">
            <div id="slide1" class="absolute inset-0 slide-active">
                <img src="https://images.unsplash.com/photo-1590674899484-d5640e854abe?w=1920&h=1080&fit=crop"
                     alt="Modern Parking Facility" class="w-full h-full object-cover">
                <div class="absolute inset-0 bg-gradient-to-r from-black/70 to-black/30"></div>
            </div>
            <div id="slide2" class="absolute inset-0 opacity-0">
                <img src="https://images.unsplash.com/photo-1506521781263-d8422e82f27a?w=1920&h=1080&fit=crop"
                     alt="Underground Parking" class="w-full h-full object-cover">
                <div class="absolute inset-0 bg-gradient-to-r from-black/70 to-black/30"></div>
            </div>
            <div id="slide3" class="absolute inset-0 opacity-0">
                <img src="https://cdn.pixabay.com/photo/2023/05/15/19/50/multi-storey-car-park-7995856_1280.jpg"
                     alt="Smart Parking System" class="w-full h-full object-cover">
                <div class="absolute inset-0 bg-gradient-to-r from-black/70 to-black/30"></div>
            </div>
            <div id="slide4" class="absolute inset-0 opacity-0">
                <img src="https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?w=1920&h=1080&fit=crop"
                     alt="City Parking Solutions" class="w-full h-full object-cover">
                <div class="absolute inset-0 bg-gradient-to-r from-black/70 to-black/30"></div>
            </div>
        </div>

        <!-- Hero Content -->
        <div class="relative z-10 h-full flex items-center justify-center">
            <div class="text-center text-white px-4">
                <h1 class="text-6xl md:text-8xl font-bold mb-6 float-animation">
                    ParkEase
                </h1>
                <p class="text-2xl md:text-3xl mb-8 font-light">
                    Smart Parking Solutions for Modern Cities
                </p>
                <p class="text-lg md:text-xl mb-12 max-w-2xl mx-auto opacity-90">
                    Find, reserve, and manage your parking space with ease. Experience hassle-free parking at your fingertips.
                </p>
                <button onclick="document.getElementById('services').scrollIntoView({behavior: 'smooth'})"
                        class="bg-white text-purple-700 px-12 py-4 rounded-full text-xl font-semibold hover:bg-purple-100 transition duration-300 pulse-glow">
                    Get Started
                </button>
            </div>
        </div>

        <!-- Scroll Indicator -->
        <div class="absolute bottom-8 left-1/2 transform -translate-x-1/2 z-10">
            <div class="animate-bounce">
                <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path>
                </svg>
            </div>
        </div>
    </section>

    <!-- Services Section -->
    <section id="services" class="py-20 bg-gradient-to-br from-gray-50 to-gray-100">
        <div class="container mx-auto px-4">
            <div class="text-center mb-16">
                <h2 class="text-5xl font-bold text-gray-800 mb-4">Our Services</h2>
                <p class="text-xl text-gray-600 max-w-2xl mx-auto">
                    Everything you need for seamless parking management
                </p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-6xl mx-auto">
                <!-- Find Your Parking Card -->
                <a href="/parking/user/list" class="block">
                    <div class="bg-white rounded-2xl shadow-lg overflow-hidden card-hover cursor-pointer h-full">
                        <div class="gradient-bg p-8 text-white">
                            <svg class="w-16 h-16 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                            </svg>
                            <h3 class="text-3xl font-bold mb-2">Find Your Parking</h3>
                        </div>
                        <div class="p-8">
                            <p class="text-gray-600 text-lg mb-6">
                                Discover available parking spots near you in real-time. Filter by location, price, and amenities.
                            </p>
                            <ul class="space-y-3 text-gray-700">
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-purple-600 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                    </svg>
                                    Real-time availability
                                </li>
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-purple-600 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                    </svg>
                                    Instant booking
                                </li>
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-purple-600 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                    </svg>
                                    GPS navigation
                                </li>
                            </ul>
                        </div>
                    </div>
                </a>

                <!-- Promotions Card -->
                <a href="/promotions/active" class="block">
                    <div class="bg-white rounded-2xl shadow-lg overflow-hidden card-hover cursor-pointer h-full">
                        <div class="bg-gradient-to-br from-pink-500 to-orange-500 p-8 text-white">
                            <svg class="w-16 h-16 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v13m0-13V6a2 2 0 112 2h-2zm0 0V5.5A2.5 2.5 0 109.5 8H12zm-7 4h14M5 12a2 2 0 110-4h14a2 2 0 110 4M5 12v7a2 2 0 002 2h10a2 2 0 002-2v-7"></path>
                            </svg>
                            <h3 class="text-3xl font-bold mb-2">Promotions</h3>
                        </div>
                        <div class="p-8">
                            <p class="text-gray-600 text-lg mb-6">
                                Save more with exclusive deals and special offers. Check out our latest promotions and discounts.
                            </p>
                            <ul class="space-y-3 text-gray-700">
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-pink-600 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                    </svg>
                                    Daily deals
                                </li>
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-pink-600 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                    </svg>
                                    Member rewards
                                </li>
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-pink-600 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                    </svg>
                                    Seasonal offers
                                </li>
                            </ul>
                        </div>
                    </div>
                </a>

                <!-- Submit Feedback Card -->
                <a href="/feedbacks/new" class="block">
                    <div class="bg-white rounded-2xl shadow-lg overflow-hidden card-hover cursor-pointer h-full">
                        <div class="bg-gradient-to-br from-green-500 to-teal-500 p-8 text-white">
                            <svg class="w-16 h-16 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"></path>
                            </svg>
                            <h3 class="text-3xl font-bold mb-2">Submit Feedback</h3>
                        </div>
                        <div class="p-8">
                            <p class="text-gray-600 text-lg mb-6">
                                Your opinion matters! Share your experience and help us improve our services.
                            </p>
                            <ul class="space-y-3 text-gray-700">
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-green-600 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                    </svg>
                                    Quick submission
                                </li>
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-green-600 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                    </svg>
                                    Anonymous option
                                </li>
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-green-600 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                    </svg>
                                    Fast response
                                </li>
                            </ul>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-20 bg-white">
        <div class="container mx-auto px-4">
            <div class="text-center mb-16">
                <h2 class="text-5xl font-bold text-gray-800 mb-4">Why Choose ParkEase?</h2>
                <p class="text-xl text-gray-600">Advanced features for a superior parking experience</p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 max-w-7xl mx-auto">
                <div class="text-center p-6">
                    <div class="bg-purple-100 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-10 h-10 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2">24/7 Availability</h3>
                    <p class="text-gray-600">Book parking anytime, anywhere with our round-the-clock service</p>
                </div>

                <div class="text-center p-6">
                    <div class="bg-blue-100 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-10 h-10 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path>
                        </svg>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2">Secure Payment</h3>
                    <p class="text-gray-600">Multiple payment options with bank-level security</p>
                </div>

                <div class="text-center p-6">
                    <div class="bg-green-100 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-10 h-10 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path>
                        </svg>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2">Instant Confirmation</h3>
                    <p class="text-gray-600">Get immediate booking confirmation via email and SMS</p>
                </div>

                <div class="text-center p-6">
                    <div class="bg-yellow-100 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-10 h-10 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18.364 5.636l-3.536 3.536m0 5.656l3.536 3.536M9.172 9.172L5.636 5.636m3.536 9.192l-3.536 3.536M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-5 0a4 4 0 11-8 0 4 4 0 018 0z"></path>
                        </svg>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2">24/7 Support</h3>
                    <p class="text-gray-600">Dedicated customer support team always ready to help</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="py-20 gradient-bg text-white">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8 max-w-6xl mx-auto text-center">
                <div>
                    <div class="text-5xl font-bold mb-2">500+</div>
                    <div class="text-xl opacity-90">Parking Locations</div>
                </div>
                <div>
                    <div class="text-5xl font-bold mb-2">50K+</div>
                    <div class="text-xl opacity-90">Happy Customers</div>
                </div>
                <div>
                    <div class="text-5xl font-bold mb-2">1M+</div>
                    <div class="text-xl opacity-90">Bookings Completed</div>
                </div>
                <div>
                    <div class="text-5xl font-bold mb-2">4.8★</div>
                    <div class="text-xl opacity-90">Average Rating</div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="py-20 bg-gradient-to-br from-gray-50 to-gray-100">
        <div class="container mx-auto px-4 text-center">
            <h2 class="text-5xl font-bold text-gray-800 mb-6">Ready to Get Started?</h2>
            <p class="text-xl text-gray-600 mb-8 max-w-2xl mx-auto">
                Join thousands of satisfied customers who trust ParkEase for their parking needs
            </p>
            <a href="/parking/user/list" class="inline-block bg-purple-600 text-white px-12 py-4 rounded-full text-xl font-semibold hover:bg-purple-700 transition duration-300 shadow-lg hover:shadow-xl">
                Find Parking Now
            </a>
        </div>
    </section>

    <script>
        // Slideshow functionality
        let currentSlide = 1;
        const totalSlides = 4;

        function changeSlide() {
            const currentElement = document.getElementById('slide' + currentSlide);
            currentElement.classList.remove('slide-active');
            currentElement.style.opacity = '0';

            currentSlide = currentSlide % totalSlides + 1;

            const nextElement = document.getElementById('slide' + currentSlide);
            nextElement.style.opacity = '1';
            nextElement.classList.add('slide-active');
        }

        // Change slide every 4 seconds
        setInterval(changeSlide, 4000);

        // Smooth scroll for all anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth'
                    });
                }
            });
        });
    </script>
</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>