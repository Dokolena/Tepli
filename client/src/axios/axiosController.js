import axios from 'axios';

const instance = axios.create({
    baseURL: `${process.env.REACT_APP_URL}api/v1`,
});
const $host = axios.create({
    baseURL: `${process.env.REACT_APP_URL}api/v1`,
});

const $authHost = axios.create({
    baseURL: `${process.env.REACT_APP_URL}api/v1`,
});

const authInterceptor = (config) => {
    config.headers.authorization = `Bearer ${localStorage.getItem('token')}`;
    return config;
};

$authHost.interceptors.request.use(authInterceptor);

export {
    $host,
    $authHost,
};

export default instance;
