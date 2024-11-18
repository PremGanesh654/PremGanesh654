pageextension 50400 CustomerLedgerEntries extends "Customer Ledger Entries"
{
    layout
    {

        addafter("Due Date")
        {
            field(NumberOfDaysExpired; NumberOfDaysExpired)
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Number Of Days Expired';
                ToolTip = 'Number Of Days Expired';
                StyleExpr = DaysExpiredStyle;

            }
        }
    }
    views
    {
        addfirst
        {
            view("Open Entries")
            {
                Caption = 'Open Entries';
                OrderBy = ascending("Due Date");
                Filters = where(Open = const(true));
                SharedLayout = false;
                layout
                {
                    movefirst(Control1; NumberOfDaysExpired)
                    moveafter(NumberOfDaysExpired; "Due Date")
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        ThresholdSet: Record ThresholdSetupTable;
    begin
        if not ThresholdSet.Get() then begin
            ShowThresholdSetupNotification();
            CurrPage.Update();


        end;
    end;

    trigger OnAfterGetRecord()

    begin
        NumberOfDaysExpired := rec.GetNumberDaysExpired();
        case NumberOfDaysExpired of
            ThresholdSetup."Threshold 1 Value" .. ThresholdSetup."Threshold 2 Value":
                DaysExpiredStyle := Format(ThresholdSetup."Threshold 1 Style");
            ThresholdSetup."Threshold 2 Value" .. 99999:
                DaysExpiredStyle := Format(ThresholdSetup."Threshold 2 Style");
            else
                DaysExpiredStyle := 'None';
        end;

    end;

    procedure ShowThresholdSetupNotification()
    var
        ThresholdSetupNotification: Notification;
        message: Label 'You need to run the Threshold Setup:';
        message2: Label 'Click here to run the ThresholdSetup';
    begin
        ThresholdSetupNotification.Message(message);
        ThresholdSetupNotification.AddAction(message2, Codeunit::ThresholdSetupManagement, 'RunThresholdsetup');
        ThresholdSetupNotification.send();
    end;

    var
        NumberOfDaysExpired: Integer;
        DaysExpiredStyle: Text;
        ThresholdSetup: Record ThresholdSetupTable;

}
