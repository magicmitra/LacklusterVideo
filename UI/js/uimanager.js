//dynamic content. implementation of this should be changed at a later date.
var rentReturnContent = '<div class="row, content-table"><div class="col-sm-2">Customer Information</div><div class="col-sm-2">Rentals</div><div class="col-sm-2">Returns</div><div class="col-sm-2">Transaction Summary</div></div> <button onclick=# class="btn btn-default">Confirm Transaction</button>';
var employeeContent = '<div class="row, content-table"><div class="col-sm-2">Added Employees</div><div class="col-sm-2">Removed Employees</div><div class="col-sm-3">Summary</div></div><button onclick=# class="btn btn-default">Confirm Changes</button>';
var customerContent = '<div class="row, content-table"><div class="col-sm-2">Current Customers</div><div class="col-sm-2">Removed Customers</div><div class="col-sm-3">Summary</div></div><button onclick=# class="btn btn-default">Confirm Changes</button>';
var stockContent = '<div class="row, content-table"><div class="col-sm-2">Current Stock</div><div class="col-sm-2">Added Stock</div><div class="col-sm-2">Removed Stock</div><div class="col-sm-2">Summary</div></div><button onclick=# class="btn btn-default">Confirm Changes</button>';
var stockInfoContent = '<div class="row, content-table"><div class="col-sm-3">Video ID</div><div class="col-sm-3">Video Name</div><div class="col-sm-3">Rental Status</div></div></div>';
var customerInfoContent = '<div class="row, content-table"><div class="col-sm-2">Customer ID</div><div class="col-sm-2">Customer Name</div><div class="col-sm-2">Account Status</div><div class="col-sm-2">Most Rented Movie</div></div></div>';
var employeeInfoContent = '<div class="row, content-table"><div class="col-sm-2">Employee ID</div><div class="col-sm-2">Employee Name</div><div class="col-sm-2">Employee Status</div></div></div>';

//dynamic input forms. implementation of this should be changed at a later date as it is messy.
var stockInfoInput = '<form action=#> <div class="form-group"> <label for="videoid">Search by Video ID:</label> <input type="videoid" class="form-control" id="videoid"> </div>' +
'<label for="videoname">Search By Video Name:</label> <input type="videoname" class="form-control" id="videoname"> </div> <button onclick=# class="btn btn-default">' +
'Search</button><button onclick=# class="btn btn-default">Detailed Search</button><button onclick=# class="btn btn-default">Show All Videos</button></form>';
var customerInfoInput = '<form action=#> <div class="form-group"> <label for="customerid">Search by Customer ID:</label> <input type="videoid" class="form-control" id="videoid"> </div>' +
'<label for="customername">Search By Customer Name:</label> <input type="customername" class="form-control" id="customername"> </div> <button onclick=# class="btn btn-default">' +
'Search</button><button onclick=# class="btn btn-default">Detailed Search</button><button onclick=# class="btn btn-default">Show All Customers</button> </form>';
var employeeInfoInput = '<form action=#> <div class="form-group"> <label for="employeeid">Search by Employee ID:</label> <input type="employeeid" class="form-control" id="employeeid"> </div>' +
'<label for="employeename">Search By Employee Name:</label> <input type="employeename" class="form-control" id="employeename"> </div> <button onclick=# class="btn btn-default">' +
'Search</button><button onclick=# class="btn btn-default">Detailed Search</button><button onclick=# class="btn btn-default">Show All Employees</button> </form>';
var rentReturnInput = '<form action=#> <div class="form-group"> <label for="customerid">Customer ID:</label> <input type="customerid" class="form-control" id="customerid"><label for="videoid">Video ID:</label> <input type="videoid" class="form-control" id="videoid"> </div> <button onclick=# class="btn btn-default">' +
'Add Rental</button> <button onclick=# class="btn btn-default">Remove Rental</button></form>';
var employeeAdminInput = '<form action=#> <div class="form-group"> <label for="employeename">Employee Name:</label> <input type="employeename" class="form-control" id="employeename"> <label for="employeeid">Employee ID:</label> <input type="employeeid" class="form-control" id="employeeid"></div>' + 
'<button onclick=# class="btn btn-default">' +
'Add Employee</button> <button onclick=# class="btn btn-default">Remove Employee</button> </form>';
var customerAdminInput = '<form action=#> <div class="form-group"> <label for="customername">Customer Name:</label> <input type="customername" class="form-control" id="customername"> </div> <button onclick=# class="btn btn-default">' +
'Add Customer</button> <button onclick=# class="btn btn-default">Remove Customer</button></form>';
var stockInput = '<form action=#> <div class="form-group"> <label for="employeeName">Video ID:</label> <input type="videoid" class="form-control" id="videoid"> </div> <button onclick=# class="btn btn-default">' +
'Add Stock</button> <button onclick=# class="btn btn-default">Remove Stock</button></form>';

//initial dyanmic input and content loader.
window.onload = function() {
	document.getElementById("dynamic-content").innerHTML = rentReturnContent;
	document.getElementById("dynamic-input").innerHTML = rentReturnInput;
}

//admin ui input and content loaders.
function showEmployeeAdminUI() {
	document.getElementById("dynamic-content").innerHTML = employeeContent;
	document.getElementById("dynamic-input").innerHTML = employeeAdminInput;
}

function showCustomerAdminUI() {
	document.getElementById("dynamic-content").innerHTML = customerContent;
	document.getElementById("dynamic-input").innerHTML = customerAdminInput;
}

function showStockAdminUI() {
	document.getElementById("dynamic-content").innerHTML = stockContent;
	document.getElementById("dynamic-input").innerHTML = stockInput;
}

//rent or return input and content loader.
function showRentReturnUI() {
	document.getElementById("dynamic-content").innerHTML = rentReturnContent;
	document.getElementById("dynamic-input").innerHTML = rentReturnInput;
}

//information ui input and content loaders.
function showVideoInfoUI() {
	document.getElementById("dynamic-content").innerHTML = stockInfoContent;
	document.getElementById("dynamic-input").innerHTML = stockInfoInput;
}

function showCustomerInfoUI() {
	document.getElementById("dynamic-content").innerHTML = customerInfoContent;
	document.getElementById("dynamic-input").innerHTML = customerInfoInput;
}

function showEmployeeInfoUI() {
	document.getElementById("dynamic-content").innerHTML = employeeInfoContent;
	document.getElementById("dynamic-input").innerHTML = employeeInfoInput;
}