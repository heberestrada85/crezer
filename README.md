# README

### Versiones:
* Ruby 3.3.1
* Rails 7.2.2
* Postgres 14 o posterior

### Requerimientos
    Docker desktop
    Postman


### Información previa
El archivo .devcontainer/docker-compose.yml, contienen la información necesaria para aprovisionar nuestro sistema asi como el motor de base de datos requerido, asi mismo el dockerfile contenido en la misma ruta contiene las instrucciones necesarias para instalar las dependencias requeridas para aprovisionar los elementos necesarios para un ambiente de desarrollo.

Asi mismo al presente proyecto se anexa una coleccion de POSTMAN en la ruta /Clientes.postman_collection.json para facilitar el uso de la misma que contiene ejemplos de su uso, mismos que se enlistaran mas delante.

### Instrucciones de despliegue para un ambiente de desarrollo
1. Abrir una terminal para la ejecución de comandos para el aprovisionamiento del ambiente.
2. Deberemos compilar nuestro proyecto en docker para tener un ambiente completo de desarrollo con el siguiente comando:
    - docker compose build
3. Una vez completada la instruccion previa deberemos poner en marcha nuestra aplicación con el comando:
    - docker compose up -d && docker-compose exec app /bin/bash -l
4. Este ya contiene las instrucciones y configuraicones necesarias para conectar con nuestra db de desarrollo misma que esta enlazada a nuestro ambiente de desarrollo, ya que nos encontremos dentro del contenedor previamente puesto en marcha y con las instrucciones procederemos a crear la base de datos de prueba asi como la estructura base para traabajar con nuestro ambiente de pruebas.
    - bundle (instalar las gemas/"librerias" faltantes propias al proyecto )
    - rails db:create
    - rails db:migrate
5. Posteriormente procedemos a iniciar nuestro servidor para poder hacer uso del mismo.
    rails server -b 0.0.0.0
6. Ingresamos en nuestro navegador a la ruta http://localhost:3000/clients, en esta tendremos las vistas necesarias para manipular la informacion de nuestros registros.
7. Este paso es opcional en caso de desear manejarlo como un api externa, procedemos a abrir nuestro Postman/Insomnia (Se anexo el archivo de coleccion a la carpeta del proyecto) o algun similar que sea de su gusto, los endpoints de uso de la aplicacion son los enlistados a continuación. Seintase en libertad de jugar con los datos a su gusto para familiarizarse con el uso de la aplicacion, cada uno relacionado con su repsectivo verbo.
    - Obtener el listado completo de clientes registrados
        GET - http://localhost:3000/clients.json

    - Obtener la información correspondiente un solo cliente en este ejemplo seria del cliente ID=1
        GET - http://localhost:3000/clients/1.json

    - Crear un nuevo cliente
        POST - http://localhost:3000/clients.json
        Ejemplo de payload
        {
            "client": {
                "name": "John",
                "surname": "Doe",
                "second_surname": "Sanchez",
                "street": "Siempreviva",
                "neighborhood": "Altamirano",
                "city": "Parras",
                "state": "Coahuila",
                "zipcode": "27989",
                "rfc": "XAXX010101000"
            }
        }


    -  Editar a un cliente
        PATCH - http://localhost:3000/clients/1.json
        Ejemplo de payload
        {
            "client": {
                "name": "John",
                "surname": "Doe",
                "second_surname": "Sanchez",
                "street": "Siempreviva",
                "neighborhood": "Altamirano",
                "city": "Parras",
                "state": "Coahuila",
                "zipcode": "27989",
                "rfc": "XAXX010101000"
            }
        }


    - Eliminar un cliente especifico
        DELETE - http://localhost:3000/clients/1.json
