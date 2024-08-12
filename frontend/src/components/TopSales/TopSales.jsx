import React, { useEffect } from 'react';
import Highcharts from 'highcharts';

const TopSales = ({ products = [] }) => {
  useEffect(() => {
    Highcharts.chart('top-sales-chart', {
      chart: {
        type: 'column',
      },
      title: {
        text: 'Top Sales',
      },
      xAxis: {
        categories: products.map(product => product.name),
        title: {
          text: 'Products',
        },
      },
      yAxis: {
        min: 0,
        title: {
          text: 'Sales Count',
          align: 'high',
        },
        labels: {
          overflow: 'justify',
        },
      },
      tooltip: {
        valueSuffix: ' units',
      },
      plotOptions: {
        column: {
          dataLabels: {
            enabled: true,
          },
        },
      },
      legend: {
        reversed: false,
      },
      credits: {
        enabled: false,
      },
      series: [{
        name: 'Sales Count',
        colorByPoint: true,
        data: products.map(product => product.sales_count),
      }],
    });
  }, [products]);

  return (
    <div>
      <h2>Top Sales</h2>
      <div id="top-sales-chart"></div>
    </div>
  );
};

export default TopSales;
