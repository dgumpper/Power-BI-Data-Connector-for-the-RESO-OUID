// This file contains your Data Connector logic
section RESO_OUID_Power_BI_Data_Connector;

[DataSource.Kind="RESO_OUID_Power_BI_Data_Connector", Publish="RESO_OUID_Power_BI_Data_Connector.Publish"]
shared RESO_OUID_Power_BI_Data_Connector.Contents = () =>
    let
        Source = Xml.Tables(Web.Contents("https://reso.org/ouid/")),
        #"Changed Type" = Table.TransformColumnTypes(Source,{{"copyright", type text}}),
        #"Expanded organization" = Table.ExpandTableColumn(#"Changed Type", "organization", {"name", "ouid", "assoc2mls", "type", "active", "url", "location", "updated", "statuschangedate", "notes"}, {"organization.name", "organization.ouid", "organization.assoc2mls", "organization.type", "organization.active", "organization.url", "organization.location", "organization.updated", "organization.statuschangedate", "organization.notes"}),
        #"Expanded organization.assoc2mls" = Table.ExpandTableColumn(#"Expanded organization", "organization.assoc2mls", {"Element:Text"}, {"organization.assoc2mls.Element:Text"}),
        #"Expanded organization.location" = Table.ExpandTableColumn(#"Expanded organization.assoc2mls", "organization.location", {"address", "city", "state", "zip", "country"}, {"organization.location.address", "organization.location.city", "organization.location.state", "organization.location.zip", "organization.location.country"}),
        #"Removed Columns" = Table.RemoveColumns(#"Expanded organization.location",{"copyright"}),
        #"Changed Type1" = Table.TransformColumnTypes(#"Removed Columns",{{"organization.updated", type date}}),
        #"Renamed Columns" = Table.RenameColumns(#"Changed Type1",{{"organization.notes", "Notes"}, {"organization.statuschangedate", "Status Change Date"}, {"organization.updated", "Update Date"}, {"organization.location.country", "Country"}, {"organization.location.zip", "Zip"}, {"organization.location.state", "State"}, {"organization.location.city", "City"}, {"organization.location.address", "Address"}, {"organization.url", "Web Address"}, {"organization.active", "Active"}, {"organization.type", "Type"}, {"organization.assoc2mls.Element:Text", "Assoc2MLS"}, {"organization.ouid", "OUID"}, {"organization.name", "Name"}}),
        #"Filtered Rows" = Table.SelectRows(#"Renamed Columns", each ([Active] = "1")),
        #"Changed Type2" = Table.TransformColumnTypes(#"Filtered Rows",{{"Status Change Date", type date}})
in
    #"Changed Type2";

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
