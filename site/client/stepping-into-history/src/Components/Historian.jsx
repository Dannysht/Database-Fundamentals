import React, { useState, useEffect } from 'react';
import { getHistorians, addHistorian, updateHistorian, deleteHistorian } from '../apis/apis';

const Historian = () => {
    const [historians, setHistorians] = useState([]);
    const [newHistorian, setNewHistorian] = useState({ first_name: '', last_name: '', email: '' });

    useEffect(() => {
        fetchHistorians();
    }, []);

    const fetchHistorians = () => {
        getHistorians()
            .then(setHistorians)
            .catch(console.error);
    };

    const handleAddHistorian = () => {
        addHistorian(newHistorian)
            .then(fetchHistorians)
            .catch(console.error);
    };

    const handleUpdateHistorian = (id) => {
        const updatedData = { ...newHistorian, first_name: 'Updated First Name' };
        updateHistorian(id, updatedData)
            .then(fetchHistorians)
            .catch(console.error);
    };

    const handleDeleteHistorian = (id) => {
        deleteHistorian(id)
            .then(fetchHistorians)
            .catch(console.error);
    };

    return (
        <div>
            <h2>Historian List</h2>
            <input
                type="text"
                placeholder="First Name"
                value={newHistorian.first_name}
                onChange={(e) => setNewHistorian({ ...newHistorian, first_name: e.target.value })}
            />
            <input
                type="text"
                placeholder="Last Name"
                value={newHistorian.last_name}
                onChange={(e) => setNewHistorian({ ...newHistorian, last_name: e.target.value })}
            />
            <input
                type="email"
                placeholder="Email"
                value={newHistorian.email}
                onChange={(e) => setNewHistorian({ ...newHistorian, email: e.target.value })}
            />
            <button onClick={handleAddHistorian}>Add Historian</button>

            <ul>
                {historians.map((historian) => (
                    <li key={historian.id}>
                        {historian.first_name} {historian.last_name} - {historian.email}
                        <button onClick={() => handleUpdateHistorian(historian.id)}>Update</button>
                        <button onClick={() => handleDeleteHistorian(historian.id)}>Delete</button>
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default Historian;
