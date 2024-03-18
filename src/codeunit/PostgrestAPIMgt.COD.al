codeunit 50000 "Postgrest API Mgt."
{
    var
        RestApiManagement: Codeunit "Rest API Management";
        MethodType: Enum "REST API Method";

    procedure CreatePostgreRecords(TableName: Text; Payload: Text)
    begin
        RestApiManagement.SendRequest(GetPostgreUri(TableName), MethodType::POST, Payload);
    end;

    procedure DeletePostgresRecords(TableName: Text)
    begin
        RestApiManagement.SendRequest(GetPostgreUri(TableName), MethodType::DELETE, '');
    end;

    procedure GeneratePostgreCustomers(var CustomerBuffer: Record "Customer Buffer")
    var
        GeneratePostgreCustomers: Report "Generate Postgre Customers";
    begin
        GeneratePostGreCustomers.RunModal();
        CustomerBuffer.Reset();
        CustomerBuffer.DeleteAll();
        ImportArrayFromPostgre('Customer');
    end;

    procedure GetPostgreUri(TableName: Text): Text
    var
        PostgreSetup: Record "Postgre Setup";
        UriPortTxt: Label ':%1';
        UriTableTxt: Label '/%1';
        Uri: Text;
    begin
        PostgreSetup.Get();
        PostgreSetup.TestField("Postgrest API Uri");

        Uri := PostgreSetup."Postgrest API Uri";
        if PostgreSetup."Postgrest API Port" <> 0 then
            Uri += StrSubstNo(UriPortTxt, PostgreSetup."Postgrest API Port");

        if TableName <> '' then
            Uri += StrSubstNo(UriTableTxt, TableName);

        exit(Uri);
    end;

    local procedure ImportCustomer(JsonObject: JsonObject)
    var
        CustomerBuffer: Record "Customer Buffer";
        JsonToken: JsonToken;
    begin
        CustomerBuffer.Init();

        JsonObject.Get('Id', JsonToken);
        CustomerBuffer.Id := JsonToken.AsValue().AsInteger();

        JsonObject.Get('Name', JsonToken);
        CustomerBuffer.Name := JsonToken.AsValue().AsText();

        JsonObject.Get('Address', JsonToken);
        CustomerBuffer.Address := JsonToken.AsValue().AsText();

        JsonObject.Get('City', JsonToken);
        CustomerBuffer.City := JsonToken.AsValue().AsText();

        JsonObject.Get('Country/Code', JsonToken);
        CustomerBuffer."Country/Code" := JsonToken.AsValue().AsText();

        JsonObject.Get('E-Mail', JsonToken);
        CustomerBuffer."E-Mail" := JsonToken.AsValue().AsText();

        JsonObject.Get('Last Update At', JsonToken);
        CustomerBuffer."Last Update At" := JsonToken.AsValue().AsDateTime();

        JsonObject.Get('Phone', JsonToken);
        CustomerBuffer.Phone := JsonToken.AsValue().AsText();

        JsonObject.Get('Post Code', JsonToken);
        CustomerBuffer."Post Code" := JsonToken.AsValue().AsText();

        CustomerBuffer.Insert(true);
    end;

    procedure ImportArrayFromPostgre(TableName: Text)
    var
        JsonArray: JsonArray;
        JsonObject: JsonObject;
        JsonToken: JsonToken;
        ResponseAsText: Text;
        TableNotSupportedErr: Label 'Table %1 is not supported.';
    begin
        RestApiManagement.SendRequest(GetPostgreUri(TableName), MethodType::GET, '');
        ResponseAsText := RestApiManagement.GetResponseAsText();

        JsonArray.ReadFrom(ResponseAsText);
        foreach JsonToken in JsonArray do begin
            JsonObject := JsonToken.AsObject();
            case TableName of
                'Customer':
                    ImportCustomer(JsonObject);
                else
                    Error(TableNotSupportedErr, TableName);
            end;
        end;
    end;

    procedure TestConnection()
    var
        SuccessMsg: Label 'Connection is successful';
    begin
        RestApiManagement.SendRequest(GetPostgreUri('Customer'), MethodType::GET, '');
        Message(SuccessMsg);
    end;
}
