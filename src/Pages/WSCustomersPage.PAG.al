page 50001 "WS Customers Page"
{
    ApplicationArea = All;
    Caption = 'WS Customers';
    PageType = List;
    SourceTable = WSCustomer;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Id; Rec.Id)
                {
                    ToolTip = 'Specifies the value of the Id field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }
}
