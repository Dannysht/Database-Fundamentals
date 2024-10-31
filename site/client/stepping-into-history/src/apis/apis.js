const API_BASE_URL = 'http://localhost:8080'; 

const handleResponse = (response) => {
    if (!response.ok) throw new Error('Network response was not ok');
    return response.json();
};

export const getCustomers = () =>
    fetch(`${API_BASE_URL}/customers`).then(handleResponse);

export const addCustomer = (customerData) =>
    fetch(`${API_BASE_URL}/customers`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(customerData),
    }).then(handleResponse);

export const updateCustomer = (id, customerData) =>
    fetch(`${API_BASE_URL}/customers/${id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(customerData),
    }).then(handleResponse);

export const deleteCustomer = (id) =>
    fetch(`${API_BASE_URL}/customers/${id}`, { method: 'DELETE' }).then(handleResponse);


export const getHistorians = () =>
    fetch(`${API_BASE_URL}/historians`).then(handleResponse);

export const addHistorian = (historianData) =>
    fetch(`${API_BASE_URL}/historians`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(historianData),
    }).then(handleResponse);

export const updateHistorian = (id, historianData) =>
    fetch(`${API_BASE_URL}/historians/${id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(historianData),
    }).then(handleResponse);

export const deleteHistorian = (id) =>
    fetch(`${API_BASE_URL}/historians/${id}`, { method: 'DELETE' }).then(handleResponse);

export const getBookings = () =>
    fetch(`${API_BASE_URL}/bookings`).then(handleResponse);

export const addBooking = (bookingData) =>
    fetch(`${API_BASE_URL}/bookings`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(bookingData),
    }).then(handleResponse);

export const updateBooking = (id, bookingData) =>
    fetch(`${API_BASE_URL}/bookings/${id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(bookingData),
    }).then(handleResponse);

export const deleteBooking = (id) =>
    fetch(`${API_BASE_URL}/bookings/${id}`, { method: 'DELETE' }).then(handleResponse);
