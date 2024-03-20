query 50001 "WS Customer Query API"
{
    APIGroup = 'BC23';
    APIPublisher = 'javisalamanca';
    APIVersion = 'v1.0';
    EntityName = 'WSCustomer';
    EntitySetName = 'WSCustomers';
    QueryType = API;

    elements
    {
        dataitem(wsCustomer; WSCustomer)
        {
            column(id; Id)
            {
            }
            column(name; Name)
            {
            }
        }
    }
}
