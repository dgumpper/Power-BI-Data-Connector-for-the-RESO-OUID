// This file contains your Data Connector logic
section RESO_OUID_Power_BI_Data_Connector;

[DataSource.Kind="RESO_OUID_Power_BI_Data_Connector", Publish="RESO_OUID_Power_BI_Data_Connector.Publish"]
shared RESO_OUID_Power_BI_Data_Connector.Contents = (optional message as text) =>
    let
        _message = if (message <> null) then message else "(no message)",
        a = "Hello from RESO_OUID_Power_BI_Data_Connector: " & _message
    in
        a;

// Data Source Kind description
RESO_OUID_Power_BI_Data_Connector = [
    Authentication = [
        // Key = [],
        // UsernamePassword = [],
        // Windows = [],
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
