---

# Ecommerce Database

This project defines the logical schema of a database for an ecommerce system. The goal is to manage information about customers, orders, products, suppliers, stock, and deliveries, providing a solid foundation for ecommerce operations.

---

## Database Structure

### Main Tables

1. **Customer**: Stores customer data (individuals or companies), including CPF, CNPJ, and address.
2. **OrderALT**: Records orders placed by customers.
3. **Delivery**: Tracks the status of order deliveries.
4. **Product**: Contains information about products, such as category, description, and price.
5. **Supplier**: Stores data about product suppliers.
6. **Third_Party_Seller**: Records information about third-party sellers.

### Relationship Tables

1. **Product_Has_Order**: Links products to orders, indicating the quantity.
2. **Stock_Has_Product**: Links products to stock, with location and quantity.
3. **Supplier_Has_Product**: Links suppliers to products, with supplied quantity.
4. **Thirt_Part_Seller_Has_Product**: Links third-party sellers to products, with available quantity.

---

## Purpose

The database is designed to:
- Manage customers (individuals and companies) and their orders.
- Control product stock and availability.
- Register suppliers and third-party sellers.
- Track delivery status.

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---
