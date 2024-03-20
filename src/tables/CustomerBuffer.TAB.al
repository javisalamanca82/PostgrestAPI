table 50000 "Customer Buffer"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Id"; Integer)
        {
            Caption = 'Id';
            DataClassification = CustomerContent;
        }

        field(2; "Name"; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }

        field(3; "Country/Code"; Code[10])
        {
            Caption = 'Country/Code';
            DataClassification = CustomerContent;
        }

        field(4; City; Text[250])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
        }

        field(5; "Post Code"; Code[10])
        {
            Caption = 'Post Code';
            DataClassification = CustomerContent;
        }


        field(6; "Address"; Text[250])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }

        field(10; "E-Mail"; Text[250])
        {
            Caption = 'E-Mail';
            DataClassification = CustomerContent;
        }

        field(11; "Phone"; Text[50])
        {
            Caption = 'Phone';
            DataClassification = CustomerContent;
        }

        field(20; "Last Update At"; Datetime)
        {
            Caption = 'Last Update At';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Id")
        {
            Clustered = true;
        }
    }

}