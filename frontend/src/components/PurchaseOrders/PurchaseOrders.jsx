import React, { useEffect } from 'react';
import Highcharts from 'highcharts';

const PurchaseOrders = ({ orders }) => {
    console.log('orders:', orders)
  useEffect(() => {
    Highcharts.chart('purchase-orders-chart', {
      chart: {
        type: 'line',
      },
      title: {
        text: 'Purchase Orders (Past 30 Days)',
      },
      xAxis: {
        categories: orders.map(data => data.date),
        title: {
          text: 'Date',
        },
      },
      yAxis: {
        title: {
          text: 'Count',
        },
      },
      series: [{
        name: 'Number of Orders',
        data: orders.map(data => data.count),
      }],
    });
  }, [orders]);

  return (
    <div>
      <h2>Purchase Orders</h2>
      <div id="purchase-orders-chart"></div>
    </div>
  );
};

export default PurchaseOrders;
