report 50000 "Generate Postgre Customers"
{
    ApplicationArea = All;
    Caption = 'Generate Postgre Customers';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Integer; Integer)
        {
            trigger OnPreDataItem()
            var
                responseMessage: HttpResponseMessage;
            begin
                InitProcessDt := CurrentDateTime;
                PostgrestAPIMgt.DeletePostgresRecords('Customer');

                Integer.SetRange(Number, 1, NoOfRecords);

                Clear(JsonArray);
            end;

            trigger OnAfterGetRecord()
            var
                JsonObject: JsonObject;
                DescriptionLbl: Label '%2 %1';
            begin
                Clear(JsonObject);
                JsonObject.Add('Id', Number);
                JsonObject.Add('Name', StrSubstNo(DescriptionLbl, 'Name', Number));
                JsonObject.Add('Address', StrSubstNo(DescriptionLbl, 'Address', Number));
                JsonObject.Add('City', 'Tarragona');
                JsonObject.Add('Country/Code', 'ES');
                JsonObject.Add('E-Mail', StrSubstNo('randomuser%1@gmail.com', Number));
                JsonObject.Add('Last Update At', CurrentDateTime);
                JsonObject.Add('Phone', '1234567890');
                JsonObject.Add('Post Code', '43006');

                JsonArray.Add(JsonObject);
            end;

            trigger OnPostDataItem()
            var
                JsonArrayAsText: Text;
            begin
                JsonArray.WriteTo(JsonArrayAsText);
                PostgrestAPIMgt.CreatePostgreRecords('Customer', JsonArrayAsText);

                Message(ProcessExecutionDurationTxt, Number, CurrentDateTime - InitProcessDt);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(General)
                {
                    field(NoOfRecods; NoOfRecords)
                    {
                        Caption = 'No. of records to create';
                        ToolTip = 'Defines the no. of records to be created in Postgre DB.';
                    }
                }
            }
        }
    }

    var
        PostgrestAPIMgt: Codeunit "Postgrest API Mgt.";
        NoOfRecords: Integer;
        JsonArray: JsonArray;
        InitProcessDt: DateTime;
        ProcessExecutionDurationTxt: Label 'Duration of creation of %1 records: %2.';
}
