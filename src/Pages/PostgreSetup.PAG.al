page 50001 "Postgre Setup"
{
    ApplicationArea = All;
    Caption = 'Postgre Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Postgre Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Database Name"; Rec."Database Name")
                {
                    ToolTip = 'Specifies the value of the Database Name field.';
                }
                field("Database User"; Rec."Database User")
                {
                    ToolTip = 'Specifies the value of the Database User field.';
                }
                field("Database User Password"; Rec."Database User Password")
                {
                    ToolTip = 'Specifies the value of the Database User Password field.';
                    ExtendedDatatype = Masked;
                }
                field("Postgrest API Uri"; Rec."Postgrest API Uri")
                {
                    ToolTip = 'Specifies the value of the Postgrest API Url field.';
                }
                field("Postgrest API Port"; Rec."Postgrest API Port")
                {
                    ToolTip = 'Specifies the value of the Postgrest API Port field.';
                    BlankZero = true;
                }
            }
            group(SystemData)
            {
                Caption = 'System Data';
                Editable = false;

                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(TestConnection)
            {
                ApplicationArea = All;
                Caption = 'Test Connetion';
                Image = TestDatabase;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    PostgrestAPIMgt.TestConnection();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

    var
        PostgrestAPIMgt: Codeunit "Postgrest API Mgt.";
}
