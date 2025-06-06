from controller import Controller

def main():
    controller = Controller()
    # uso el while para poder registrar varios usuarios, no me salia 
    while True: 
        print("\n1. Registrar\n2. Iniciar sesión\n3. Salir")
        option = input("Opción: ")
        if option == "1":
            controller.register()
        elif option == "2":
            user = controller.login()
            if user:
                controller.show_menu(user)
        elif option == "3":
            break
        else:
            print("Seleccione una opcion valida")

if __name__ == "__main__":
    main()
