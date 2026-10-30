codeunit XXXXX "KC Documentation Sample"
#region I002
{
    /*
    I002 "Introduce documentation sample"
    I755 "Enhance sales order page"
    */

    #region I755
    procedure IsEnabled(): Boolean
    begin
        exit(true);
    end;
    #endregion I755
}
#endregion I002

pageextension XXXXX "KC Documentation Page" extends "Customer Card"
{
    /*
    I002 "Introduce documentation sample"
    I755 "Enhance sales order page"
    */

    layout
    {
        modify(Name)
        {
            #region I755
            ToolTip = 'Specifies the customer name.';
            #endregion I755
        }
    }
}
