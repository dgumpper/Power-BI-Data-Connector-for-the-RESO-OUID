// This file contains your Data Connector logic
section RESO_OUID_Power_BI_Data_Connector;

[DataSource.Kind="RESO_OUID_Power_BI_Data_Connector", Publish="RESO_OUID_Power_BI_Data_Connector.Publish"]
shared RESO_OUID_Power_BI_Data_Connector.Contents = () =>
    let
        Source = Xml.Tables(Web.Contents("https://reso.org/ouid/")),
    #"Expanded organization" = Table.ExpandTableColumn(Source, "organization", {"name", "assoc2mls", "type", "active", "url", "location", "updated", "ouid", "notes", "statuschangedate"}, {"organization.name", "organization.assoc2mls", "organization.type", "organization.active", "organization.url", "organization.location", "organization.updated", "organization.ouid", "organization.notes", "organization.statuschangedate"}),
    #"Expanded organization.assoc2mls" = Table.ExpandTableColumn(#"Expanded organization", "organization.assoc2mls", {"Element:Text"}, {"organization.assoc2mls.Element:Text"}),
    #"Expanded organization.location" = Table.ExpandTableColumn(#"Expanded organization.assoc2mls", "organization.location", {"address", "city", "state", "zip", "country"}, {"organization.location.address", "organization.location.city", "organization.location.state", "organization.location.zip", "organization.location.country"}),
    #"Renamed Columns" = Table.RenameColumns(#"Expanded organization.location",{{"organization.name", "Name"}, {"organization.assoc2mls.Element:Text", "Assoc2MLS"}, {"organization.type", "Type"}, {"organization.active", "Active"}, {"organization.url", "Web Address"}, {"organization.location.address", "Address"}, {"organization.location.city", "City"}, {"organization.location.state", "State"}, {"organization.location.zip", "Zip"}, {"organization.location.country", "Country"}, {"organization.updated", "Updated"}, {"organization.ouid", "OUID"}, {"organization.notes", "Notes"}, {"organization.statuschangedate", "Status Change Date"}}),
    #"Changed Type" = Table.TransformColumnTypes(#"Renamed Columns",{{"Status Change Date", type date}, {"Updated", type date}}),
    #"Removed Columns" = Table.RemoveColumns(#"Changed Type",{"copyright"}),
    #"Filtered Rows" = Table.SelectRows(#"Removed Columns", each ([Active] = "1"))
in
    #"Filtered Rows";

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
