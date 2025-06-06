# src/controller.py

import re
from user import Users

class Controller:
    def __init__(self):
        self.users = [Users("administrador", "admin123", "admin")]

    def validate_password(self, password):
        return (
            len(password) >= 6 and
            re.search(r"[A-Za-z]", password) and
            re.search(r"[0-9]", password)
        )

    def register(self):
        username = input("Usuario nuevo: ")
        password = input("Contraseña: ")

        if not self.validate_password(password):
            print("La contraseña debe tener minimo 6 caracteres con letras y numeros")
            return

        self.users.append(Users(username, password))
        print("Usuario registrado")

    def login(self):
        username = input("Usuario: ")
        password = input("Contraseña: ")
        for user in self.users:
            if user.username == username and user.password_matches(password):
                return user
        print("Error en login.")
        return None

    def show_menu(self, user):
        if user.role == "admin":
            while True:
                print("\n--- Menu admin ---")
                print("1. Ver usuarios")
                print("2. Eliminar usuario")
                print("3. Cerrar sesión")
                option = input("Opción: ")
                if option == "1":
                    for u in self.users:
                        print(u)
                elif option == "2":
                    username_delete = input("Usuario a eliminar: ")
                    self.delete_user(user, username_delete)
                elif option == "3":
                    break
                else:
                    print("Opción inválida.")
        else:
            print("\n--- Tu perfil ---")
            print(user)

    def delete_user(self, current_user, username_delete):
        if current_user.role != "admin":
            print("Función válida solo para administradores.")
            return False
        
        for user in self.users:
            if user.username == username_delete:
                if user.role == "admin":
                    print("No podés eliminar un administrador.")
                    return False
                self.users.remove(user)
                print(f"{username_delete} eliminado.")
                return True
        print("El usuario no existe.")
        return False
