codeunit 50000 "WS Customer Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        InsertWSCustomer();
    end;

    local procedure InsertWSCustomer()
    var
        WSCustomer: Record WSCustomer;
        i: Integer;
        NameLbl: Label 'Name %1';
    begin
        WSCustomer.Reset();
        if not WSCustomer.IsEmpty then
            WSCustomer.DeleteAll();

        WSCustomer.Reset();
        for i := 1 to 10 do begin
            WSCustomer.Init();
            WSCustomer.Id := i;
            WSCustomer.Name := StrSubstNo(NameLbl, i);
            WSCustomer.Insert(true);
        end;
    end;
}
