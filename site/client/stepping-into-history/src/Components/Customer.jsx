import React, { useState, useEffect } from 'react';
import { getCustomers, addCustomer, updateCustomer, deleteCustomer } from '../apis/apis';

const Customer = () => {
    const [customers, setCustomers] = useState([]);
    const [newCustomer, setNewCustomer] = useState({ first_name: '', last_name: '', email: '' });

    useEffect(() => {
        fetchCustomers();
    }, []);

    const fetchCustomers = () => {
        getCustomers()
            .then(setCustomers)
            .catch(console.error);
    };

    const handleAddCustomer = () => {
        addCustomer(newCustomer)
            .then(fetchCustomers)
            .catch(console.error);
    };

    const handleUpdateCustomer = (id) => {
        const updatedData = { ...newCustomer, first_name: 'Updated First Name' };
        updateCustomer(id, updatedData)
            .then(fetchCustomers)
            .catch(console.error);
    };

    const handleDeleteCustomer = (id) => {
        deleteCustomer(id)
            .then(fetchCustomers)
            .catch(console.error);
    };

    return (
        <div>
            <h2>Customer List</h2>
            <input
                type="text"
                placeholder="First Name"
                value={newCustomer.first_name}
                onChange={(e) => setNewCustomer({ ...newCustomer, first_name: e.target.value })}
            />
            <input
                type="text"
                placeholder="Last Name"
                value={newCustomer.last_name}
                onChange={(e) => setNewCustomer({ ...newCustomer, last_name: e.target.value })}
            />
            <input
                type="email"
                placeholder="Email"
                value={newCustomer.email}
                onChange={(e) => setNewCustomer({ ...newCustomer, email: e.target.value })}
            />
            <button onClick={handleAddCustomer}>Add Customer</button>

            <ul>
                {customers.map((customer) => (
                    <li key={customer.id}>
                        {customer.first_name} {customer.last_name} - {customer.email}
                        <button onClick={() => handleUpdateCustomer(customer.id)}>Update</button>
                        <button onClick={() => handleDeleteCustomer(customer.id)}>Delete</button>
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default Customer;
