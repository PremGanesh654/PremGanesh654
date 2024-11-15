tableextension 50400 CustomerLedgerEntry extends "Cust. Ledger Entry"
{
    fields
    {
        field(50400; NumberOfDaysExpired; Integer)
        {
            Caption = 'Number Of Days Expired';
            DataClassification = ToBeClassified;
        }
    }
    procedure GetNumberDaysExpired(): Integer
    var
        Customer: Record "Cust. Ledger Entry";
        Days: Integer;
    begin
        if Customer.FindSet() then begin
            repeat
                if Customer."Due Date" < Today then begin
                    Days := Abs(Customer."Due Date" - Today);
                    Message('%1', Days);
                end

                else
                    Message('0');

            until Customer.Next() = 0;
        end;

    end;
}
