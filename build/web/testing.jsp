<%@page import="com.codebook.admin.adminDao"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="com.codebook.Connections.bean"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <style>
    body {
  background-color: #f4f4f4;
}

.card {
  margin-top: 20px;
}
</style>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dummy Payments Page</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="styles.css">
</head>
<body>
    <script>
    document.getElementById("paymentForm").addEventListener("submit", function (e) {
  e.preventDefault();

  // Simulate payment processing
  setTimeout(function () {
    // Show success message using Swal alerts
    Swal.fire({
      title: "Payment Successful",
      text: "Your payment was successfully processed.",
      icon: "success",
    });
  }, 2000); // Simulate a delay of 2 seconds
});
</script>
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <div class="card">
          <div class="card-header">
            <h3 class="text-center">Make a Payment</h3>
          </div>
          <div class="card-body">
            <form id="paymentForm">
              <div class="mb-3">
                <label for="cardNumber" class="form-label">Card Number</label>
                <input type="text" class="form-control" id="cardNumber" placeholder="Enter card number" required>
              </div>
              <div class="mb-3">
                <label for="expiryDate" class="form-label">Expiry Date</label>
                <input type="text" class="form-control" id="expiryDate" placeholder="MM/YYYY" required>
              </div>
              <div class="mb-3">
                <label for="cvv" class="form-label">CVV</label>
                <input type="password" class="form-control" id="cvv" placeholder="Enter CVV" required>
              </div>
                <%
                    String coursename=request.getParameter("coursename");
                    out.println(coursename);
                    String insname=request.getParameter("instructor_name");
                    out.println(insname);
                %>
              <a  class="btn btn-dark" href="student/subscribeAction.jsp?coursename=<%= coursename%>&instructor_name=<%= insname%>">Buy</a>
              
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="script.js"></script>
</body>
</html>

