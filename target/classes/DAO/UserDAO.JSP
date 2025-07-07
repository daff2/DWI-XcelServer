import { User } from "../models/User.js";

export class UserDAO {
  constructor() {
    this.users = [];
    this.nextId = 1;
  }

  getAllUsers() {
    return this.users;
  }

  getUserById(id) {
    return this.users.find(user => user.id === id);
  }

  createUser(nombre, email, rol) {
    const newUser = new User(this.nextId++, nombre, email, rol);
    this.users.push(newUser);
    return newUser;
  }

  updateUser(id, nombre, email, rol) {
    const user = this.getUserById(id);
    if (user) {
      user.nombre = nombre;
      user.email = email;
      user.rol = rol;
      return user;
    }
    return null;
  }

  deleteUser(id) {
    this.users = this.users.filter(user => user.id !== id);
  }
}
