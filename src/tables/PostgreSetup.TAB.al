table 50001 "Postgre Setup"
{
    Caption = 'Postgre Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Postgrest API Uri"; Text[1024])
        {
            Caption = 'Postgrest API Uri';
        }
        field(3; "Postgrest API Port"; Integer)
        {
            Caption = 'Postgrest API Port';
        }
        field(4; "Database Name"; Text[50])
        {
            Caption = 'Database Name';
        }
        field(5; "Database User"; Text[50])
        {
            Caption = 'Database User';
        }
        field(6; "Database User Password"; Text[250])
        {
            Caption = 'Database User Password';
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
