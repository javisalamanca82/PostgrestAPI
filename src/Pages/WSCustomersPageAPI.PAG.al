page 50002 "WS Customers Page API"
{
    APIGroup = 'BC23';
    APIPublisher = 'javisalamanca';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'WSCustomersPageAPI';
    DelayedInsert = true;
    EntityName = 'WSCustomerPage';
    EntitySetName = 'WSCustomersPage';
    PageType = API;
    SourceTable = WSCustomer;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(id; Rec.Id)
                {
                    Caption = 'Id';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
            }
        }
    }
}
