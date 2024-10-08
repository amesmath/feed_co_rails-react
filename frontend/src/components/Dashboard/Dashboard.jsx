import React, { useEffect, useState } from 'react';
import TopSales from '../TopSales/TopSales';
import TopSuppliers from '../TopSuppliers/TopSuppliers';
import ProductLookup from '../ProductLookup/ProductLookup';
import PurchaseOrders from '../PurchaseOrders/PurchaseOrders';
import Inventory from '../Inventory/Inventory';
import "./Dashboard.scss"

const Dashboard = () => {
  const [orders, setOrders] = useState([]);
  const [companies, setCompanies] = useState([]);
  const [lowStockProducts, setLowStockProducts] = useState([]);
  const [products, setProducts] = useState([]);

  useEffect(() => {
    // Fetch top products, companies, and low stock products from your Rails API
    fetch('http://localhost:3000/api/v1/dashboard')
      .then((response) => response.json())
      .then((data) => { 
        setOrders(data.purchase_order_data)
        setCompanies(data.companies)
        setLowStockProducts(data.low_stock_products)
        setProducts(data.products_with_ingredients)
      });
  }, []);

  return (
    <div className="dashboard">
      <header className="dashboard-header">
        <h1>FeedCo</h1>
      </header>
      <div className="dashboard-content">
        <div className="row">
          <div className="widget">
            <TopSuppliers companies={companies} />
          </div>
          <div className="widget">
            <ProductLookup products={products} />
          </div>
          <div className="widget">
            <TopSales products={products} />
          </div>
        </div>
        <div className="row">
          <div className="widget large-widget">
            <PurchaseOrders orders={orders} />
          </div>
          <div className="widget">
            <Inventory lowStockProducts={lowStockProducts} />
          </div>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
