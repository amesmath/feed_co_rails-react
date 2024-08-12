import React, { useState } from 'react';

const ProductLookup = () => {
  const [query, setQuery] = useState('');
  const [results, setResults] = useState([]);

  const handleSearch = () => {
    fetch(`/dashboard/search?query=${query}`)
      .then((response) => response.json())
      .then((data) => setResults(data));
  };

  const formatCurrency = (value) =>
    new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD',
    }).format(value);

  return (
    <div>
      <div id="search-container">
        <input
          type="text"
          id="product-search"
          placeholder="Search for a product..."
          value={query}
          onChange={(e) => setQuery(e.target.value)}
        />
        <button id="search-button" onClick={handleSearch}>
          Search
        </button>
      </div>
      <div className="ingredients-results" id="search-results">
        {results.length > 0 ? (
          results.map((product) => (
            <div key={product.name} className="ingredient-item-group">
              <div className="ingredient-title">{product.name} Ingredients</div>
              <div className="ingredients">
                {product.ingredients.map((ingredient) => (
                  <div key={ingredient.supplier_product.sku} className="ingredient-item">
                    <div className="ingredient-header">
                      <div>{ingredient.supplier_product.name}</div>
                      <div>
                        <i>Supplier</i>:{' '}
                        <a className="company-link">{ingredient.supplier_product.company.company_name}</a>
                      </div>
                    </div>
                    <div className="additional-info">
                      <p>Current price: {formatCurrency(ingredient.supplier_product.price)}</p>
                      <p>SKU: {ingredient.supplier_product.sku}</p>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          ))
        ) : (
          <div className="ingredient-item"></div>
        )}
      </div>
    </div>
  );
};

export default ProductLookup;
