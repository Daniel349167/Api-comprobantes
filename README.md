Pasos para correr mi aplicación:

-clonar el repositorio
-php artisan migrate
-php artisan db:seed
-php artisan serve

luego pueden probar las apis en postman importando el archivo postman_collection.json.

pasos para probar en postman:
crear las variables de entorno:
-  url_base    con valor localhost:8000/api
-  token
-  user
-  email
-  password

listo ya pueden interactuar con la api en postman, tambien si kieren ver una documentacion detallada sobre las apis pueden copiar el contenido del archivo swagger.txt en https://editor.swagger.io/

Gracias!
