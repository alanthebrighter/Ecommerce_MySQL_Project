---

# Banco de Dados para Ecommerce

Este projeto define o esquema lógico de um banco de dados para um sistema de ecommerce. O objetivo é gerenciar informações sobre clientes, pedidos, produtos, fornecedores, estoques e entregas, proporcionando uma base sólida para operações de comércio eletrônico.

---

## Estrutura do Banco de Dados

### Tabelas Principais

1. **Customer**: Armazena dados dos clientes (PF ou PJ), incluindo CPF, CNPJ e endereço.
2. **OrderALT**: Registra os pedidos feitos pelos clientes.
3. **Delivery**: Controla o status das entregas dos pedidos.
4. **Product**: Contém informações sobre os produtos, como categoria, descrição e preço.
5. **Supplier**: Armazena dados dos fornecedores dos produtos.
6. **Third_Party_Seller**: Registra informações sobre vendedores terceirizados.

### Tabelas de Relacionamento

1. **Product_Has_Order**: Relaciona produtos a pedidos, indicando a quantidade.
2. **Stock_Has_Product**: Relaciona produtos a estoques, com localização e quantidade.
3. **Supplier_Has_Product**: Relaciona fornecedores a produtos, com quantidade fornecida.
4. **Thirt_Part_Seller_Has_Product**: Relaciona vendedores terceirizados a produtos, com quantidade disponível.

---

## Propósito

O banco de dados foi projetado para:
- Gerenciar clientes (PF e PJ) e seus pedidos.
- Controlar o estoque e a disponibilidade de produtos.
- Registrar fornecedores e vendedores terceirizados.
- Acompanhar o status das entregas.

---


