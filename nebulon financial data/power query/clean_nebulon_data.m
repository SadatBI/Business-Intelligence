let
    Source = Excel.Workbook("NebulonFinancialData.xlsx"), null, true),
    #"Cleaning Financial Data_Sheet" = Source{[Item="Cleaning Financial Data",Kind="Sheet"]}[Data],
    #"Filtered Rows" = Table.SelectRows(#"Cleaning Financial Data_Sheet", each ([Column1] = null or [Column1] = "Expenses" or [Column1] = "Revenues")),
    #"Filled Down" = Table.FillDown(#"Filtered Rows",{"Column1"}),
    #"Transposed Table" = Table.Transpose(#"Filled Down"),
    #"Filled Down1" = Table.FillDown(#"Transposed Table",{"Column1"}),
    #"Merged Columns" = Table.CombineColumns(#"Filled Down1",{"Column1", "Column2"},Combiner.CombineTextByDelimiter(" ", QuoteStyle.None),"Merged"),
    #"Transposed Table1" = Table.Transpose(#"Merged Columns"),
    #"Promoted Headers" = Table.PromoteHeaders(#"Transposed Table1", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{" ", type text}, {" _1", type text}, {"June Actual ", type number}, {"June Budget ", type number}, {"June Variance ($)", type number}, {"July Actual ", type number}, {"July Budget ", type number}, {"July Variance ($)", type number}}),
    #"Unpivoted Other Columns" = Table.UnpivotOtherColumns(#"Changed Type", {" ", " _1"}, "Attribute", "Value"),
    #"Renamed Columns" = Table.RenameColumns(#"Unpivoted Other Columns",{{" ", "Revenue/Expenses"}, {" _1", "item"}}),
    #"Split Column by Delimiter" = Table.SplitColumn(#"Renamed Columns", "Attribute", Splitter.SplitTextByDelimiter(" ", QuoteStyle.Csv), {"Attribute.1", "Attribute.2", "Attribute.3"}),
    #"Changed Type1" = Table.TransformColumnTypes(#"Split Column by Delimiter",{{"Attribute.1", type text}, {"Attribute.2", type text}, {"Attribute.3", type text}}),
    #"Removed Columns" = Table.RemoveColumns(#"Changed Type1",{"Attribute.3"}),
    #"Renamed Columns1" = Table.RenameColumns(#"Removed Columns",{{"item", "Item"}, {"Attribute.1", "Month"}, {"Attribute.2", "Actual/Budget"}, {"Value", "Amount"}}),
    #"Filtered Rows1" = Table.SelectRows(#"Renamed Columns1", each ([#"Actual/Budget"] <> "Variance"))
in
    #"Filtered Rows1"