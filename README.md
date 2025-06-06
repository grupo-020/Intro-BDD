# Diagrama de Clases del Sistema de Usuarios

## 1. Controller

Gestiona usuarios: registro, login, validación, visualización de menú y eliminación.  
Contiene un atributo privado `users` con una lista de instancias `Users`.

### Métodos:
- `validate_password(password)`: Valida que la contraseña cumpla con las reglas establecidas- 
- `register()`: registra un nuevo usuario si la contraseña es valida.
- `show_menu(user)`: muestra las opciones según el rol del usuario.
- `login()`: permite a un usuario iniciar sesión luego de registrarse.
- `delete_user(current_user, username_delete)`: permite eliminar usuarios, solamente los administradores.
---

## 2. Users

Representa un usuario.

### Atributos:
- `username`
- `password`
- `role` (por defecto "user")

### Métodos:
- `password_matches(password)`: verifica que la contraseña coincida con la creada.
- `__str__()`: devuelve una representación en cadena del usuario con su nombre y rol.

---

## Relación entre clases

- `Controller` tiene muchas instancias de `Users` (0..*).
- Es una relación de composición o agregación.