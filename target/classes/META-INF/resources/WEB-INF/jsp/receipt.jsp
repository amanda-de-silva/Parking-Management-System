<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Receipt - Parking System</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col items-center py-10">

    <!-- Receipt Container -->
    <div class="bg-white shadow-lg rounded-2xl p-8 w-full max-w-2xl border-t-4 border-blue-600">
        <div class="text-center mb-6">
            <h1 class="text-2xl font-bold text-blue-700">Parking System</h1>
            <p class="text-gray-600">Official Payment Receipt</p>
        </div>

        <div class="border-t border-gray-200 pt-4 mb-6">
            <p class="text-sm text-gray-500 mb-2">Receipt No: <span class="font-semibold text-gray-800">${receiptId}</span></p>
            <p class="text-sm text-gray-500 mb-2">Date: <span class="font-semibold text-gray-800">${paymentDate}</span></p>
        </div>

        <!-- Customer Info -->
        <div class="mb-6">
            <h2 class="text-lg font-semibold text-gray-800 mb-2">Customer Information</h2>
            <div class="bg-gray-50 p-4 rounded-lg">
                <p class="text-gray-700"><strong>Name:</strong> ${customerName}</p>
                <p class="text-gray-700"><strong>Email:</strong> ${customerEmail}</p>
                <p class="text-gray-700"><strong>Reservation ID:</strong> ${reservationId}</p>
            </div>
        </div>

        <!-- Payment Info -->
        <div class="mb-6">
            <h2 class="text-lg font-semibold text-gray-800 mb-2">Payment Details</h2>
            <div class="bg-gray-50 p-4 rounded-lg space-y-1">
                <p class="text-gray-700"><strong>Payment Method:</strong> ${paymentMethod}</p>
                <p class="text-gray-700"><strong>Transaction ID:</strong> ${transactionId}</p>
                <p class="text-gray-700"><strong>Amount:</strong> Rs. <span class="font-semibold">${amount}</span></p>
                <p class="text-gray-700"><strong>Status:</strong>
                    <span class="px-2 py-1 rounded-full text-sm font-medium
                        ${status == 'SUCCESS' ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}">
                        ${status}
                    </span>
                </p>
            </div>
        </div>

        <!-- Parking Info -->
        <div class="mb-6">
            <h2 class="text-lg font-semibold text-gray-800 mb-2">Parking Details</h2>
            <div class="bg-gray-50 p-4 rounded-lg space-y-1">
                <p class="text-gray-700"><strong>Parking Place:</strong> ${parkingPlaceName}</p>
                <p class="text-gray-700"><strong>Booking Time:</strong> ${bookingStartTime} - ${bookingEndTime}</p>
            </div>
        </div>

        <!-- Footer -->
        <div class="text-center border-t border-gray-200 pt-4">
            <p class="text-gray-600 text-sm mb-4">
                Thank you for using our Parking Management System. Have a safe journey!
            </p>

            <div class="flex justify-center gap-4">
                <button onclick="window.print()"
                        class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg text-sm shadow-md">
                    Print Receipt
                </button>
                <a href="${pageContext.request.contextPath}/dashboard"
                   class="bg-gray-600 hover:bg-gray-700 text-white px-4 py-2 rounded-lg text-sm shadow-md">
                   Back to Dashboard
                </a>
            </div>
        </div>
    </div>

</body>
</html>
