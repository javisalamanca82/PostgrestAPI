page 50000 "Customer Buffer"
{
    ApplicationArea = All;
    Caption = 'Customer Buffer';
    PageType = List;
    SourceTable = "Customer Buffer";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Id;
                Rec.Id)
                {
                    ToolTip = 'Specifies the value of the Id field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Country/Code"; Rec."Country/Code")
                {
                    ToolTip = 'Specifies the value of the Country/Code field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field(Phone; Rec.Phone)
                {
                    ToolTip = 'Specifies the value of the Phone field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Last Update At"; Rec."Last Update At")
                {
                    ToolTip = 'Specifies the value of the Last Update At field.';
                    Visible = false;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                    Visible = false;
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                    Visible = false;
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                    Visible = false;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                    Visible = false;
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GenerateData)
            {
                ApplicationArea = All;
                ToolTip = 'Creates Dummy Data in Postgre DB';
                Image = CreateDocuments;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    GeneratePostGreCustomers: Report "Generate Postgre Customers";
                begin
                    PostgrestAPIMgt.GeneratePostgreCustomers(Rec);
                end;
            }

            action(ImportData)
            {
                ApplicationArea = All;
                ToolTip = 'Imports Data from Postgre';
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    InitProcessDt := CurrentDateTime;
                    PostgrestAPIMgt.ImportArrayFromPostgre('Customer');

                    Message(ProcessDuration, CurrentDateTime - InitProcessDt);
                end;
            }
        }
    }

    var
        PostgrestAPIMgt: Codeunit "Postgrest API Mgt.";
        ProcessDuration: Label 'Processing time: %1.';
        InitProcessDt: DateTime;
}
