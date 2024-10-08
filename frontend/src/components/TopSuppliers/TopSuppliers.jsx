import React, { useEffect } from 'react';
import Highcharts from 'highcharts';

const TopSuppliers = ({ companies }) => {
  useEffect(() => {
    Highcharts.chart('companies_pie_chart', {
      chart: {
        type: 'pie',
        height: 530
      },
      title: {
        text: 'Top Suppliers',
      },
      plotOptions: {
        pie: {
          size: '270px',
          dataLabels: {
            enabled: false,
          },
          showInLegend: true,
          center: ['50%', '50%'],
        },
      },
      tooltip: {
        pointFormat: '{series.name}: <b>{point.y}</b>',
      },
      series: [
        {
          name: 'Products',
          colorByPoint: true,
          data: companies.map((company) => ({
            name: company.company_name,
            y: company.product_count,
          })),
        },
      ],
    });
  }, [companies]);

  return <div id="companies_pie_chart" style={{ width: '100%', height: '400px' }}></div>;
};

export default TopSuppliers;
