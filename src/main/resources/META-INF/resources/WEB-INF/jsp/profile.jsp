<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen relative">
    <!-- Background Image with Overlay -->
    <div class="fixed inset-0 z-0">
        <img src="https://cdn.pixabay.com/photo/2016/03/22/00/45/multi-storey-car-park-1271919_1280.jpg"
             alt="Background"
             class="w-full h-full object-cover">
        <div class="absolute inset-0 bg-gradient-to-br from-blue-900/60 via-indigo-900/70 to-purple-900/60"></div>
    </div>

    <!-- Include Header -->
    <div class="relative z-20">
        <jsp:include page="/WEB-INF/jsp/header.jsp" />
    </div>

    <div class="min-h-screen flex items-center justify-center p-4 pt-24 relative z-10">
        <div class="bg-white/90 backdrop-blur-xl p-8 md:p-10 rounded-2xl shadow-2xl w-full max-w-2xl border border-white/30">
            <!-- Header Section with Avatar -->
            <div class="flex flex-col items-center mb-8">
                <div class="w-24 h-24 rounded-full bg-gradient-to-br from-blue-500 to-indigo-600 flex items-center justify-center text-white text-3xl font-bold shadow-lg mb-4">
                    <span id="avatarInitials">U</span>
                </div>
                <h1 class="text-3xl font-bold bg-gradient-to-r from-blue-600 to-indigo-600 bg-clip-text text-transparent">My Profile</h1>
                <p class="text-gray-500 text-sm mt-1">Manage your account information</p>
            </div>

            <!-- Profile Details -->
            <div id="profileDetails" class="space-y-4 mb-8">
                <div class="flex items-start p-4 bg-gradient-to-r from-blue-50 to-indigo-50 rounded-xl border border-blue-100 hover:shadow-md transition-shadow">
                    <div class="flex-shrink-0 w-10 h-10 rounded-lg bg-blue-600 flex items-center justify-center text-white mr-4">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                        </svg>
                    </div>
                    <div class="flex-1">
                        <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">First Name</p>
                        <p id="firstName" class="text-lg font-semibold text-gray-800 mt-1"></p>
                    </div>
                </div>

                <div class="flex items-start p-4 bg-gradient-to-r from-purple-50 to-pink-50 rounded-xl border border-purple-100 hover:shadow-md transition-shadow">
                    <div class="flex-shrink-0 w-10 h-10 rounded-lg bg-purple-600 flex items-center justify-center text-white mr-4">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                        </svg>
                    </div>
                    <div class="flex-1">
                        <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Last Name</p>
                        <p id="lastName" class="text-lg font-semibold text-gray-800 mt-1"></p>
                    </div>
                </div>

                <div class="flex items-start p-4 bg-gradient-to-r from-emerald-50 to-teal-50 rounded-xl border border-emerald-100 hover:shadow-md transition-shadow">
                    <div class="flex-shrink-0 w-10 h-10 rounded-lg bg-emerald-600 flex items-center justify-center text-white mr-4">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                        </svg>
                    </div>
                    <div class="flex-1">
                        <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Email</p>
                        <p id="email" class="text-lg font-semibold text-gray-800 mt-1 break-all"></p>
                    </div>
                </div>

                <div class="flex items-start p-4 bg-gradient-to-r from-amber-50 to-orange-50 rounded-xl border border-amber-100 hover:shadow-md transition-shadow">
                    <div class="flex-shrink-0 w-10 h-10 rounded-lg bg-amber-600 flex items-center justify-center text-white mr-4">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path>
                        </svg>
                    </div>
                    <div class="flex-1">
                        <p class="text-xs font-medium text-gray-500 uppercase tracking-wide">Role</p>
                        <p id="role" class="text-lg font-semibold text-gray-800 mt-1"></p>
                    </div>
                </div>
            </div>

            <!-- Buttons -->
            <div class="flex flex-col sm:flex-row justify-center gap-4">
                <button id="editBtn"
                        class="flex-1 px-6 py-3 bg-gradient-to-r from-blue-600 to-indigo-600 text-white rounded-xl hover:from-blue-700 hover:to-indigo-700 transition-all duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-0.5 font-medium flex items-center justify-center gap-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                    </svg>
                    Edit Profile
                </button>
                <button id="deleteBtn"
                        class="flex-1 px-6 py-3 bg-gradient-to-r from-red-600 to-pink-600 text-white rounded-xl hover:from-red-700 hover:to-pink-700 transition-all duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-0.5 font-medium flex items-center justify-center gap-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                    </svg>
                    Delete Account
                </button>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="hidden fixed inset-0 flex items-center justify-center bg-black/60 backdrop-blur-sm z-50 p-4">
        <div class="bg-white rounded-2xl shadow-2xl w-full max-w-md p-8 transform transition-all animate-fadeIn">
            <div class="flex items-center justify-between mb-6">
                <h2 class="text-2xl font-bold bg-gradient-to-r from-blue-600 to-indigo-600 bg-clip-text text-transparent">Edit Profile</h2>
                <button id="cancelBtn" class="text-gray-400 hover:text-gray-600 transition-colors">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </div>

            <div id="editMessage" class="mb-4 text-sm text-center rounded-lg p-3"></div>

            <form id="editForm" class="space-y-5">
                <div>
                    <label for="editFirstName" class="block text-sm font-semibold text-gray-700 mb-2">First Name</label>
                    <input type="text" id="editFirstName" name="firstName"
                           class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all outline-none" required>
                </div>
                <div>
                    <label for="editLastName" class="block text-sm font-semibold text-gray-700 mb-2">Last Name</label>
                    <input type="text" id="editLastName" name="lastName"
                           class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all outline-none" required>
                </div>
                <div>
                    <label for="editEmail" class="block text-sm font-semibold text-gray-700 mb-2">Email</label>
                    <input type="email" id="editEmail" name="email"
                           class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all outline-none" required>
                </div>
                <div>
                    <label for="editPassword" class="block text-sm font-semibold text-gray-700 mb-2">Password</label>
                    <input type="password" id="editPassword" name="password"
                           class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all outline-none" required>
                </div>
                <div>
                    <label for="editConfirmPassword" class="block text-sm font-semibold text-gray-700 mb-2">Confirm Password</label>
                    <input type="password" id="editConfirmPassword" name="confirmPassword"
                           class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all outline-none" required>
                </div>
                <div class="flex gap-3 pt-4">
                    <button type="button" id="cancelBtn2"
                            class="flex-1 px-6 py-3 bg-gray-100 text-gray-700 rounded-xl hover:bg-gray-200 transition-all font-medium">Cancel</button>
                    <button type="submit"
                            class="flex-1 px-6 py-3 bg-gradient-to-r from-green-600 to-emerald-600 text-white rounded-xl hover:from-green-700 hover:to-emerald-700 transition-all shadow-lg hover:shadow-xl font-medium">Save Changes</button>
                </div>
            </form>
        </div>
    </div>

    <script>
    const editMessage = document.getElementById("editMessage");

    async function loadProfile() {
        const response = await fetch("${pageContext.request.contextPath}/api/user/profile");
        if (response.ok) {
            const data = await response.json();
            document.getElementById("firstName").textContent = data.firstName;
            document.getElementById("lastName").textContent = data.lastName;
            document.getElementById("email").textContent = data.email;
            document.getElementById("role").textContent = data.role;

            document.getElementById("editFirstName").value = data.firstName;
            document.getElementById("editLastName").value = data.lastName;
            document.getElementById("editEmail").value = data.email;

            // Set avatar initials
            const initials = (data.firstName.charAt(0) + data.lastName.charAt(0)).toUpperCase();
            document.getElementById("avatarInitials").textContent = initials;
        } else {
            editMessage.textContent = "Failed to load profile.";
            editMessage.className = "mb-4 text-center text-red-500 bg-red-50 rounded-lg p-3";
        }
    }

    document.getElementById("editBtn").addEventListener("click", () => {
        editMessage.textContent = '';
        editMessage.className = 'mb-4 text-sm text-center rounded-lg p-3';
        document.getElementById("editModal").classList.remove("hidden");
    });

    document.getElementById("cancelBtn").addEventListener("click", () => {
        document.getElementById("editModal").classList.add("hidden");
    });

    // Add second cancel button functionality
    document.getElementById("cancelBtn2").addEventListener("click", () => {
        document.getElementById("editModal").classList.add("hidden");
    });

    document.getElementById("editForm").addEventListener("submit", async function(e) {
        e.preventDefault();

        const password = document.getElementById("editPassword").value;
        const confirmPassword = document.getElementById("editConfirmPassword").value;

        editMessage.textContent = '';
        editMessage.className = 'mb-4 text-sm text-center rounded-lg p-3';

        if (password !== confirmPassword) {
            editMessage.textContent = "Passwords do not match!";
            editMessage.classList.add("text-red-500", "bg-red-50");
            return;
        }

        const updateRequest = {
            firstName: document.getElementById("editFirstName").value,
            lastName: document.getElementById("editLastName").value,
            email: document.getElementById("editEmail").value,
            password: password,
            confirmPassword: confirmPassword
        };

        try {
            const response = await fetch("${pageContext.request.contextPath}/api/user/profile", {
                method: "PUT",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(updateRequest)
            });

            const data = await response.json();

            if (response.ok) {
                editMessage.textContent = "Profile updated successfully!";
                editMessage.classList.add("text-green-500", "bg-green-50");
                setTimeout(() => {
                    document.getElementById("editModal").classList.add("hidden");
                    loadProfile();
                }, 1000);
            } else {
                editMessage.textContent = data.error || "Update failed!";
                editMessage.classList.add("text-red-500", "bg-red-50");
            }
        } catch (err) {
            console.error(err);
            editMessage.textContent = "Something went wrong!";
            editMessage.classList.add("text-red-500", "bg-red-50");
        }
    });

    // Delete Account
    document.getElementById("deleteBtn").addEventListener("click", async () => {
        if (!confirm("Are you sure you want to delete your account? This action cannot be undone.")) return;

        try {
            const response = await fetch("${pageContext.request.contextPath}/api/user/delete", {
                method: "DELETE"
            });

            const data = await response.json();

            if (response.ok) {
                alert(data.message || "Account deleted successfully!");
                window.location.href = "${pageContext.request.contextPath}/dashboard"; // redirect to dashboard
            } else {
                alert(data.error || "Failed to delete account.");
            }
        } catch (err) {
            console.error(err);
            alert("Something went wrong!");
        }
    });

    loadProfile();
    </script>
</body>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</html>