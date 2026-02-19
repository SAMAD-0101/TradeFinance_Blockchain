/* Project: Trade Finance Blockchain Explorer | Developer: Abdul Samad | FRS Standard Compliance */
import axios from 'axios';

// Construct API URL: Handle localhost fallback and Render's bare hostname (host only)
let apiUrl = import.meta.env.VITE_API_BASE_URL || 'http://localhost:8000/api/v1';

// Ensure protocol (Render provides host without protocol)
if (!apiUrl.startsWith('http')) {
    apiUrl = `https://${apiUrl}`;
}

// Ensure API version path
if (!apiUrl.includes('/api/v1')) {
    apiUrl = `${apiUrl}/api/v1`;
}

const API_BASE_URL = apiUrl;

// Create axios instance
export const apiClient = axios.create({
    baseURL: API_BASE_URL,
    headers: {
        'Content-Type': 'application/json',
    },
});

// Request interceptor: Attach JWT token
apiClient.interceptors.request.use(
    (config) => {
        const token = localStorage.getItem('access_token');
        if (token) {
            config.headers.Authorization = `Bearer ${token}`;
        }
        return config;
    },
    (error) => Promise.reject(error)
);

// Response interceptor: Handle errors globally
apiClient.interceptors.response.use(
    (response) => response,
    (error) => {
        if (error.response?.status === 401) {
            // Token expired or invalid
            localStorage.removeItem('access_token');
            window.location.href = '/login';
        }
        return Promise.reject(error);
    }
);
