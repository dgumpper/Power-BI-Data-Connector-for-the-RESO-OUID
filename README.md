# Microsoft Power Bi Custom Data Connector for the Organization Unique Identifier (OUID) from the Real Estate Standards Organization (RESO).

Microsoft Power BI Custom Data Connector for RESO - OUID

Microsoft Power BI custom data connectors are built to easily access and refresh data in Power BI for data analysis and visualization.

<h2>Requirements:</h2>

<ol>
    <li><a href="https://visualstudio.microsoft.com/downloads/" rel="nofollow">Microsoft Visual Studio 2015 or 2017</a></li>
    <li><a href="https://docs.microsoft.com/en-us/power-query/installingsdk" rel="nofollow">Microsoft Power Query SDK</a></li>
    <li><a href="https://marketplace.visualstudio.com/items?itemName=lennyomg.AutoDeploy" rel="nofollow">Auto Deploy Extension for Visual Studio</a></li>
</ol>

Custom Data Connectors in Power BI are still under preview in the Power BI Desktop and <a href="https://docs.microsoft.com/en-us/power-bi/service-gateway-custom-connectors" rel="nofollow">Power BI On-premise Gateway</a>. Please enable the feature under File | Options & Settings | Options | Preview Features for the PBI Desktop and select the option for the on-premise gateway.

<h2>Notes</h2>
This data connector only contains 'Active' associations. To pull all data, remove the expression statement #"Filtered Rows" = Table.SelectRows(#"Renamed Columns", each ([Active] = "1")).
