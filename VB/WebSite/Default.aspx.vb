Imports Microsoft.VisualBasic
Imports System
Imports System.Configuration
Imports System.Data
Imports System.Data.OleDb
Imports System.Linq
Imports DevExpress.Web.ASPxGridView

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private citiesDataTable As DataTable

	Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
		rptCities.DataSource = GetCitiesDataTable()
		rptCities.DataBind()
	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If (Not IsPostBack) Then
			gv.ExpandRow(1)
		End If
	End Sub

	Protected Sub gv_CustomColumnSort(ByVal sender As Object, ByVal e As CustomColumnSortEventArgs)
		Dim order1 As Integer = GetOrderValue(e.Value1.ToString())
		Dim order2 As Integer = GetOrderValue(e.Value2.ToString())
		e.Handled = order1 <> order2
		If e.Handled Then
			If order1 > order2 Then
				e.Result = 1
			Else
				e.Result = -1
			End If
		End If
	End Sub

	Private Function GetOrderValue(ByVal value As String) As Integer
		Dim dr As DataRow = citiesDataTable.AsEnumerable().Where(Function(r) r.Field(Of String)("City").ToLower().Contains(value.ToLower())).First()
		Return CInt(Fix(dr("Order")))
	End Function

	Private Function GetCitiesDataTable() As DataTable
		If citiesDataTable Is Nothing Then
			citiesDataTable = CType(Session("Cities"), DataTable)
			If citiesDataTable Is Nothing Then
				Const cmdText As String = "SELECT * FROM [Cities]"
				Dim connString As String = ConfigurationManager.ConnectionStrings("NorthwindConnectionString").ConnectionString
				Using connection As New OleDbConnection(connString)
					Using command As New OleDbCommand(cmdText, connection)
						Using adapter As New OleDbDataAdapter(command)
							Dim dt As New DataTable("Cities")
							adapter.Fill(dt)
							citiesDataTable = dt
							Session("Cities") = citiesDataTable
						End Using
					End Using
				End Using
			End If
		End If
		Return citiesDataTable
	End Function
End Class