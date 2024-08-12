import React, { useEffect, useState } from 'react';
import TopSuppliers from './TopSuppliers';
import ProductLookup from './ProductLookup';
import Inventory from './Inventory';

const Dashboard = () => {
  const [topProducts, setTopProducts] = useState([]);
  const [companies, setCompanies] = useState([]);
  const [lowStockProducts, setLowStockProducts] = useState([]);

  useEffect(() => {
    // Fetch top products, companies, and low stock products from your Rails API
    fetch('/api/v1/top_products')
      .then((response) => response.json())
      .then((data) => setTopProducts(data));

    fetch('/api/v1/companies')
      .then((response) => response.json())
      .then((data) => setCompanies(data));

    fetch('/api/v1/low_stock_products')
      .then((response) => response.json())
      .then((data) => setLowStockProducts(data));
  }, []);

  return (
    <div className="dashboard">
      <header className="dashboard-header">
        <h1>FeedCo</h1>
      </header>
      <div className="dashboard-content">
        <TopSuppliers companies={companies} />
        <ProductLookup />
        <Inventory lowStockProducts={lowStockProducts} />
      </div>
    </div>
  );
};

export default Dashboard;
