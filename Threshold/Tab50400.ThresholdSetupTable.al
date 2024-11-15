table 50400 ThresholdSetupTable
{
    Caption = 'ThresholdSetupTable';
    DataClassification = CustomerContent;
    
    
    fields
    {
        field(1; PrimaryKey; Code[10])
        {
            Caption = 'PrimaryKey';
        }
        field(2; "Threshold 1 Value"; Integer)
        {
            Caption = 'Threshold 1 Value';
        }
        field(3; "Threshold 2 Value"; Integer)
        {
            Caption = 'Threshold 2 Value';
        }
        field(4; "Threshold 1 Style"; Enum ColourForNumbers)
        {
            Caption = 'Threshold 1 Style';
        }
        field(5; "Threshold 2 Style"; Enum ColourForNumbers)
        {
            Caption = 'Threshold 2 Style';
        }
    }
    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }
}
