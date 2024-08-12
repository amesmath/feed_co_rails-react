import React from 'react';
import "./Inventory.scss"

const Inventory = ({ lowStockProducts }) => {
  return (
    <div>
      <h2>Low Inventory</h2>
      <div>        {lowStockProducts.length > 0 ? (
          lowStockProducts.map((product) => (
            <div key={product.id} className="low-stock_productItem">
              <strong>
                <span>{product.name}</span>
              </strong>
              <br />
              Current Stock: <span className="low-stock_productAmount">{product.stock_quantity}</span> kg
              <br />
            </div>
          ))
        ) : (
          <div>No low stock products</div>
        )}
      </div>
    </div>
  );
};

export default Inventory;
