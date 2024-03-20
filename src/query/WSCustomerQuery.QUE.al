query 50000 "WS Customer Query"
{
    Caption = 'WS Customer Query';
    QueryType = Normal;

    elements
    {
        dataitem(WSCustomer; WSCustomer)
        {
            column(Id; Id)
            {
            }
            column(Name; Name)
            {
            }
        }
    }
}
