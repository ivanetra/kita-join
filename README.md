# kitajoin

This system is a web-based application that can make it easier for users who want to join competitions but have difficulty in forming teams. In this web application, the users can create profile account that contains their personal data, contacts, and competencies. There is also search feature that can be used to search for other users as well as features to connect to the contacts of people who are sought through certain instant messaging applications or social media.

## Getting Started

### Prerequisites

You need to install:
- Composer
- Laravel CLI
- XAMPP
- Node.js

### Installation

- Edit `.env` and set your database connection details
- (When installed via git clone or download, run `php artisan key:generate` and `php artisan jwt:secret`)
- `php artisan migrate`
- `npm install`

## FAQ

**How to naming branch?**

1. Use grouping tokens (words) at the beginning of your branch names. Use these:
`feat   Feature you are adding or expanding`
`bug    Bug fix`
2. Use `/` to separate parts of your branch names
3. Use `-` to separate words after `/`

Example:
`feat/register`
`bug/register`

**How to start a PHP server?**

run the command below:

```go
php artisan serve
```