codeunit 50001 "WS Customer - WS"
{
    procedure AddWSCustomer(name: Text)
    var
        WSCustomer: Record WSCustomer;
        NewId: Integer;
    begin
        WSCustomer.AddLoadFields(Id);
        WSCustomer.FindLast();
        NewId := WSCustomer.Id + 1;

        WSCustomer.Reset();
        WSCustomer.Init();
        WSCustomer.Id := NewId;
        WSCustomer.Name := Name;
        WSCustomer.Insert();
    end;
}
