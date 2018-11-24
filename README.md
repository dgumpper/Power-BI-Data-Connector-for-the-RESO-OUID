# RESO OUID Power Bi Data Connectors 
Microsoft Power BI Custom Data Connector for RESO OUID

Microsoft Power BI custom data connectors are built to easily access and refresh data in Power BI for data analysis and visualizations.

RESO Power BI Data connectors is code to generate a custom data connector files which easily accesses databases from Microsoft Power BI that are compliant to the RESO Data Dictionary.

<h2>Requirements:</h2>

<ol>
    <li><a href="https://visualstudio.microsoft.com/downloads/" rel="nofollow">Microsoft Visual Studio 2015 or 2017</a></li>
    <li><a href="https://docs.microsoft.com/en-us/power-query/installingsdk" rel="nofollow">Microsoft Power Query SDK</a></li>
    <li><a href="https://marketplace.visualstudio.com/items?itemName=lennyomg.AutoDeploy" rel="nofollow">Auto Deploy Extension for Visual Studio</a></li>
</ol>

Custom Data Connectors in Power BI are still under preview. Please enable the feature under File | Options & Settings | Options | Preview Features.

<h2>Notes</h2>
This data connector only contains 'Active' associations. If you want to pull all data, remove the expresion statement #"Filtered Rows" = Table.SelectRows(#"Renamed Columns", each ([Active] = "1")).
