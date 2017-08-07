# SAFE BANK

## Ferramentas

* Ruby 2.4.1
* Rails 5.1.1
* RSpec 3.7
* PostgreSql 9.5

## Instalação
1. Clonar o repositório

```console
git clone git@github.com:eoliveiramg/safe_bank.git
```

2. Acessar o diretório clonado

```console
cd safe_bank/
```

3. Instalar a gem Bundler

```console
gem install bundler
```

4. Executar o comando abaixo para que seja realizado o build das dependências de gemas

```console
bundle install
```

5. Copie e adicione suas configurações locais para o banco de dados
```console
cp config/database.yml.sample config/database.yml
```

6. Realize a instalação do banco de dados
```console
bundle exec rails db:setup
```

7. Execute o servidor e acesse através da url http://localhost:3000
```console
bundle exec rails server
```

### APIs
#### 1. Crie uma conta :)
Request
```console
POST /accounts
```
Body
```console
{
  "name": "Lorem Name"
}
```

#### 2. Crie entradas ou saídas financeiras no cofre :)
Request
```console
POST /vaults
```
Body
```console
{
  "value": 100.02,
  "type_value": "credit" or "debit",
  "account_id": 3
}
```

#### 3. Verifique o saldo da sua conta :)
Request
```console
GET /balances?account_id={integer}
```
Response example
```console
{
    "account_id": "4",
    "balance": "1600.02"
}
```

#### 4. Realize transações entre contas :)
Request
```console
POST /money_transfers
```
Body
```console
{
  "source_account_id": 3,
  "destination_account_id": 67,
  "amount": 100.00
}
```
Documentação de parametros
```console
source_account_id => Id da conta de origem da transação
destination_account_id => Id da conta de destino da transação
amount => Valor que sera contemplado na transação
```
