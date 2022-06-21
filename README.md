# Library App API
Essa aplicação é uma Api de uma Blibioteca onde um usuário deve se cadastrar fazer login e assim conseguir cadastrar livros.<br>
Uma outra caracterisca da Api é que os livros podem recebecer avaliações sobre o mesmo com nota e comentario e assim ter uma media para que os usuários possam vizualizar sua avaliação.

Obs: Essa api usa Autenticação com JWT

# Tecnologias

Para desenvolver o projeto foi usado as tecnologias: Ruby on Rails e Postgresql

### Pré-requisitos

Para rodar o projeto na sua máquina, deve ter instalado o ruby '2.5.8' e o 'rails', '~> 6.0.4' e Postgres

```
gem 'rails', '~> 6.0.3', '>= 6.0.3.5'
Postgres 
```

Na sua máquina execute os comandos:
```
bundle install
```

Obs:  
 

Em seguida crie sua base de dados com comandos:

```
rails db:create
rails db:migrate
```
Para subir o projeto local execute:
```
rails s
```

### Endpoints para testes

#### Sign up

```
curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "email": "myemail@email.com", "password": "mypassword" } }' http://localhost:3000/users
```

#### Login
```
curl -XPOST -i -H "Content-Type: application/json" -d '{ "user": { "email": "myemail@email.com", "password": "mypassword" } }' http://localhost:3000/users/sign_in
```
obs: use a chave gerada para criar e acessar os dados

#### Create Book
```
curl -XPOST -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjU1NDkwODA2LCJleHAiOjE2NTY3ODY4MDYsImp0aSI6IjRkYzNhMDU1LWI4ZGEtNDg0Yy1iYzNkLWQxN2Y4YmE0MWEwOCJ9.BTOh4iSD7M5mF-8BtcNjlQRpZ7uJZgMACflKhcBPPj0" -H "Content-Type: application/json" -d '{ "book": { "title": "Lorem", "author": "Lorem ipsum author", "genre": "Lore genre" } }' http://localhost:3000/books
```

### Create Review - Book.id=1

```
curl -XPOST -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjU1NTE2MjIzLCJleHAiOjE2NTY4MTIyMjMsImp0aSI6ImM2MjdiODkwLTlkNWItNGVhYi05M2Y0LWMyNjM4YzQ4ZWEzNCJ9.v8-3D2kcOnRd9sag9tTI0nNbSrMDLWh2ZFF1YzbXhjI" -H "Content-Type: application/json" -d '{ "review": { "rating": "3", "comment": "Lorem impsum "} }'  http://localhost:3000/books/1/reviews
```

#### Get Review - Book.id=1
```
curl -XGET -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjU1NTE2MjIzLCJleHAiOjE2NTY4MTIyMjMsImp0aSI6ImM2MjdiODkwLTlkNWItNGVhYi05M2Y0LWMyNjM4YzQ4ZWEzNCJ9.v8-3D2kcOnRd9sag9tTI0nNbSrMDLWh2ZFF1YzbXhjI" -H "Content-Type: application/json" http://localhost:3000/books/1/reviews
```

