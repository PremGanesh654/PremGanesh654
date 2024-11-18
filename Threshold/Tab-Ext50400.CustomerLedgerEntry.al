tableextension 50400 CustomerLedgerEntry extends "Cust. Ledger Entry"
{
    // fields
    // {
    //     field(50400; NumberOfDaysExpired; Integer)
    //     {
    //         Caption = 'Number Of Days Expired';
    //         DataClassification = ToBeClassified;
    //     }
    // }
    procedure GetNumberDaysExpired(): Integer
    var
        // Customer: Record "Cust. Ledger Entry";
        Days: Integer;
    begin


        if "Due Date" >= Today then begin
            exit(0);
            // Days := Abs("Due Date" - Today);
            // Message('%1', Days);
            Days := "Due Date" - Today;

            exit(Abs(Days))
        end


    end;


}
