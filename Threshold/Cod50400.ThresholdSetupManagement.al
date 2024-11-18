codeunit 50400 ThresholdSetupManagement
{
    procedure RunThresholdSetup(var ThresholdSetupNotification: Notification)
    var
        ThresholdSetupPage: page ThresholdSetupPage;

    begin
        ThresholdSetupPage.Run();
    end;
}
