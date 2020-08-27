<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to sort an ASPxGridView by some column in a given sequence</title>
	<link href="Styles/StyleSheet.css" rel="stylesheet" />
</head>
<body>
	<form id="form1" runat="server">
		<table>
			<tr>
				<td class="contentCell">
					<asp:Repeater ID="rptCities" runat="server">
						<HeaderTemplate>
							<table class="cities">
								<tr>
									<th class="citiesHeader">
										<dx:ASPxLabel ID="city" runat="server" Text="City"></dx:ASPxLabel>
									</th>
									<th class="citiesHeader">
										<dx:ASPxLabel ID="order" runat="server" Text="Order"></dx:ASPxLabel>
									</th>
								</tr>
						</HeaderTemplate>
						<FooterTemplate>
							</table>
						</FooterTemplate>
						<ItemTemplate>
							<tr>
								<td class="citiesCell">
									<dx:ASPxLabel ID="lblCity" runat="server" Text='<% #Eval("City")%>'></dx:ASPxLabel>
								</td>
								<td class="citiesCell">
									<dx:ASPxLabel ID="lblOrder" runat="server" Text='<% #Eval("Order")%>'></dx:ASPxLabel>
								</td>
							</tr>
						</ItemTemplate>
					</asp:Repeater>
				</td>
				<td class="contentCell">
					<dx:ASPxGridView ID="gv" runat="server" AutoGenerateColumns="False" DataSourceID="adsCustomers"
						KeyFieldName="CustomerID" OnCustomColumnSort="gv_CustomColumnSort">
						<Columns>
							<dx:GridViewDataTextColumn FieldName="CustomerID" ReadOnly="True"
								VisibleIndex="0">
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="1">
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn FieldName="ContactName" VisibleIndex="2">
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn FieldName="ContactTitle" VisibleIndex="3">
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn FieldName="Address" VisibleIndex="4">
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn FieldName="City" VisibleIndex="2" SortOrder="Ascending"
								GroupIndex="0">
								<Settings SortMode="Custom" />
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn FieldName="Region" VisibleIndex="6">
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn FieldName="PostalCode" VisibleIndex="7">
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn FieldName="Country" VisibleIndex="8">
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn FieldName="Phone" VisibleIndex="9">
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn FieldName="Fax" VisibleIndex="10">
							</dx:GridViewDataTextColumn>
						</Columns>
						<SettingsPager Mode="ShowAllRecords">
						</SettingsPager>
					</dx:ASPxGridView>
				</td>
			</tr>
		</table>
		<asp:AccessDataSource ID="adsCustomers" runat="server"
			DataFile="~/App_Data/NorthWind.mdb"
			SelectCommand="SELECT * FROM [Customers]"></asp:AccessDataSource>
	</form>
</body>
</html>