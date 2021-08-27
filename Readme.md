<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128543026/13.1.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E4260)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# How to sort an ASPxGridView by some column in a given sequence
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e4260/)**
<!-- run online end -->


<p>This example shows how to sort an ASPxGridView by some column in a given sequence.</p><p>For this purpose, it is necessary to append an additional Cities table to a Northwind database. There are three fields in this table - ID, Order, and City. The City column contains a distinct list of cities. The Order column defines the order of cities during sorting. A list of Cities is displayed in a browser window in the left table.</p><p>The ASPxGridView is sorted and grouped by the City column. As you can see, the SortOrder of the City column is Ascending, but cities whose sequence number is less is displayed at the top of the list.</p>

<br/>


