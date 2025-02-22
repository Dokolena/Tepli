import {makeAutoObservable} from 'mobx';

export default class userTepli {
    constructor() {
        this._isAuth = false;
        this._isAdmin = false;
        this._user = {};
        makeAutoObservable(this);
    }

    setIsAuth(bool) {
        this._isAuth = bool;
    }

    setUser(user) {
        this._user = user;
    }

    setIsAdmin(bool) {
        this._isAdmin = bool;
    }

    get isAuth() {
        return this._isAuth;
    }

    get user() {
        return this._user;
    }

    get isAdmin() {
        return this._isAdmin;
    }
}
