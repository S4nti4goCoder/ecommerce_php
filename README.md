
# eCommerce PHP

This is an eCommerce project developed in PHP, designed to facilitate the management of products, users and orders through a modular architecture based on controllers and models. A REST API is implemented to handle CRUD operations and an administration interface is integrated with AdminLTE 3.2.0.


## 📂 Project Structure
The project is structured as follows:

```bash
├── api/                # Contains the REST API
│   ├── controllers/    # Controllers to manage requests
│   ├── models/         # Models for data manipulation in the database
│   ├── routes/         # Definition of API paths
│   ├── index.php       # API entry point
│   └── .htaccess       # Apache configuration
├── database/
│   ├── ecommerce_db_php.sql  # SQL file for the database
├── resources/
│   ├── AdminLTE-3.2.0/  # AdminLTE-based administration interface
```
## Pre-requisites

- XAMPP with PHP 8.+

- MySQL

- Composer

- Apache server with mod_rewrite support


## 🚀 Installation

XAMPP Installation Steps

1. Clone the repository in the `htdocs` folder of XAMPP:
```bash
cd C:\xampp\htdocs
git clone https://github.com/tu-usuario/ecommerce-php.git
cd ecommerce-php
```
2. Install dependencies with Composer:
```bash
composer install
```
3. Import the database from `database/ecommerce_db_php.sql` to MySQL using phpMyAdmin.
4. Configure the database connection in `api/models/connection.php`.
5. Configure virtual domains in Apache by adding the following to the `httpd-vhosts.conf file`:
```bash
<VirtualHost *:80>
  DocumentRoot "C:/xampp/htdocs/ecommerce_php/api"
  ServerName api.ecommerce.com
</VirtualHost>

<VirtualHost *:80>
  DocumentRoot "C:/xampp/htdocs/ecommerce_php/web"
  ServerName ecommerce.com
</VirtualHost>
```
6. Editar el archivo `C:\Windows\System32\drivers\etc\hosts` y añadir:
```bash
127.0.0.1 ecommerce.com
127.0.0.1 api.ecommerce.com
```
7. Restart Apache from the XAMPP control panel.
8. Access the project in the browser:
- API: `http://api.ecommerce.com/`
- Web: `http://ecommerce.com/`

    
## 🛠 API Usage

The REST API allows CRUD operations on products, users and orders through the following endpoints:

### Available Endpoints
- `GET /api/routes/get.php` → Get data.
- `POST /api/routes/post.php` → Create a new resource.
- `PUT /api/routes/put.php` → Update an existing resource.
- `DELETE /api/routes/delete.php` → Delete a resource.


## 🎨 User Interface

IMAGEN

The project includes an administration interface based on AdminLTE 3.2.0, which allows visual management of the eCommerce elements. This interface offers:

- Automation of sales processes using payment gateways.

- Shopping cart.

- Lead capture page and send them to the offer pages.

- Online Marketing Strategies for business positioning on the Internet to obtain successful sales...

- Management of the products in the store whether they are physical or digital.

- Promotion management, offers and discounts.

- Analysis of visits to the page.

- Sales control of each product.

![Screenshot 2025-03-23 014825](https://github.com/user-attachments/assets/300b55f2-a9ec-487b-a12f-0fbc0ea9388a)
![Screenshot 2025-03-23 014959](https://github.com/user-attachments/assets/213c3dd2-5f30-4b6a-84d0-411608a39578)
![Screenshot 2025-03-23 015029](https://github.com/user-attachments/assets/79c81437-0526-4b65-86c6-bf9ae074055f)
![Screenshot 2025-03-23 015114](https://github.com/user-attachments/assets/f3a88473-8b86-41fb-a12d-9e04bb2b0d40)
![Screenshot 2025-03-23 015045](https://github.com/user-attachments/assets/ae503fef-0310-49c3-b3f1-522e37b884c0)
![Screenshot 2025-03-23 015130](https://github.com/user-attachments/assets/76fcf7fb-9668-4d63-829c-04e5e11d6981)
![Screenshot 2025-03-23 015328](https://github.com/user-attachments/assets/eb8c34d9-ae97-4df9-96ec-f9699f3639c4)
![Screenshot 2025-03-23 015222](https://github.com/user-attachments/assets/b0c46873-e065-48c2-98c6-2b3d6711d540)
![Screenshot 2025-03-23 015241](https://github.com/user-attachments/assets/5c939015-66ff-480e-bb51-9328495814f9)

## Support
✉️ For questions or suggestions, contact me at santiagoquintero.softdev.code@gmail.com  - [@S4nti4goCoder](https://github.com/S4nti4goCoder)
