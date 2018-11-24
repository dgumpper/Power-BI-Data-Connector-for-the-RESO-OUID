// This file contains your Data Connector logic
section RESO_OUID_Power_BI_Data_Connector;

[DataSource.Kind="RESO_OUID_Power_BI_Data_Connector", Publish="RESO_OUID_Power_BI_Data_Connector.Publish"]
shared RESO_OUID_Power_BI_Data_Connector.Contents = (optional message as text) =>
    let
        Source = Xml.Tables(Web.Contents("https://reso.org/ouid/"))
 //       #"Changed Type" = Table.TransformColumnTypes(Source,{{"copyright", type text}}),
 //       organization = #"Changed Type"{0}[organization],
 //       #"Changed Type1" = Table.TransformColumnTypes(organization,{{"name", type text}, {"ouid", type text}, {"assoc2mls", type text}, {"type", type text}, {"active", Int64.Type}, {"url", type text}, {"updated", type date}, {"statuschangedate", type date}, {"notes", type text}}),
 //       #"Expanded location" = Table.ExpandTableColumn(#"Changed Type1", "location", {"address", "city", "state", "zip", "country"}, {"location.address", "location.city", "location.state", "location.zip", "location.country"})
        in
 //           #"Expanded location"; 
            Source;

// Data Source Kind description
RESO_OUID_Power_BI_Data_Connector = [
    Authentication = [
        Implicit = []
    ],
    Label = Extension.LoadString("DataSourceLabel")
];

// Data Source UI publishing description
RESO_OUID_Power_BI_Data_Connector.Publish = [
    Beta = true,
    Category = "Other",
    ButtonText = { Extension.LoadString("ButtonTitle"), Extension.LoadString("ButtonHelp") },
    LearnMoreUrl = "https://powerbi.microsoft.com/",
    SourceImage = RESO_OUID_Power_BI_Data_Connector.Icons,
    SourceTypeImage = RESO_OUID_Power_BI_Data_Connector.Icons
];

RESO_OUID_Power_BI_Data_Connector.Icons = [
    Icon16 = { Extension.Contents("RESO_OUID_Power_BI_Data_Connector16.png"), Extension.Contents("RESO_OUID_Power_BI_Data_Connector20.png"), Extension.Contents("RESO_OUID_Power_BI_Data_Connector24.png"), Extension.Contents("RESO_OUID_Power_BI_Data_Connector32.png") },
    Icon32 = { Extension.Contents("RESO_OUID_Power_BI_Data_Connector32.png"), Extension.Contents("RESO_OUID_Power_BI_Data_Connector40.png"), Extension.Contents("RESO_OUID_Power_BI_Data_Connector48.png"), Extension.Contents("RESO_OUID_Power_BI_Data_Connector64.png") }
];
