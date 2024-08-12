import React, { useState } from 'react';
import "./ProductLookup.scss";

const ProductLookup = ({ products }) => {
  const [query, setQuery] = useState('');
  const [options, setOptions] = useState([]);
  const [results, setResults] = useState([]);
  const [visibleInfo, setVisibleInfo] = useState({});

  const toggleAdditionalInfo = (sku) => {
    setVisibleInfo((prevVisibleInfo) => ({
      ...prevVisibleInfo,
      [sku]: !prevVisibleInfo[sku],
    }));
  };

  const handleInputChange = (event) => {
    const text = event?.target?.value;
    setQuery(text);

    if (text.trim() !== '') {
      const filteredOptions = products
        .filter(product => product.name.toLowerCase().includes(text.toLowerCase()))
        .map(product => product.name);

      setOptions(filteredOptions);
    } else {
      setOptions([]);
    }
  };

  const handleSelection = (productName) => {
    setQuery(productName);
    setOptions([]);
  }
  
  const handleSearch = () => {
    if (query.trim() !== '') {
      const filteredProducts = products.filter(product =>
        product.name.toLowerCase().includes(query.toLowerCase())
      );
      setResults(filteredProducts);
    }
  };
  
  return (
    <div className="product-lookup">
      <h3>Product Lookup</h3>
      <div className="search-container">
        <input
          type="text"
          value={query}
          onChange={handleInputChange}
          placeholder="Search for a product..."
        />
        <button className="search-button" onClick={handleSearch}>
          Search
        </button>
        {options.length > 0 && (
          <div className="typeahead-options">
            {options.map((productName, index) => (
              <div className="typeahead-option" key={index} onClick={() => handleSelection(productName)}>
                {productName}
              </div>
            ))}
          </div>
        )}
      </div>
      <div className="results-container">
        {results.length > 0 ? (
          <div className="ingredients-results" id="search-results">
            {results.map((product) => (
              <div key={product.name} className="ingredient-item-group">
                <div className="ingredient-title">{product.name} Ingredients</div>
                <div className="ingredients">
                  {product.ingredients.map((ingredient) => (
                    <div key={ingredient.supplier_product.sku} className="ingredient-item">
                      <div className="ingredient-header">
                        <div>{ingredient.supplier_product.name}</div>
                        <div>
                          <i>Supplier</i>: <a onClick={() => toggleAdditionalInfo(ingredient.supplier_product.sku)} className="company-link">{ingredient.supplier_product.name}</a>
                        </div>
                      </div>
                      {visibleInfo[ingredient.supplier_product.sku] && (
                        <div className="additional-info">
                          <p>Current price: {new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(ingredient.supplier_product.price)}</p>
                          <p>SKU: {ingredient.supplier_product.sku}</p>
                        </div>
                      )}
                    </div>
                  ))}
                </div>
              </div>
            ))}
          </div>
        ) : null}
      </div>
    </div>
  );
};

export default ProductLookup;
