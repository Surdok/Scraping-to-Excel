Option Explicit
Dim rng As Range
Dim cell As Range
Dim Filename As String

Sub URLPictureInsert()
    Dim theShape As Shape
    Dim xRg As Range
    Dim xCol As Long
    On Error Resume Next
    Application.ScreenUpdating = False
    ' Set to the range of cells you want to change to pictures
    Set rng = ActiveSheet.Range("C1:C1")
    For Each cell In rng
    cell.RowHeight = 70
    cell.ColumnWidth = 15
        Filename = cell
        ' Use Shapes instead so that we can force it to save with the document
        Set theShape = ActiveSheet.Shapes.AddPicture( _
            Filename:=Filename, linktofile:=msoFalse, _
            savewithdocument:=msoCTrue, _
            Left:=cell.Left, Top:=cell.Top, Width:=70, Height:=70)
        If theShape Is Nothing Then GoTo isnill
        With theShape
            .LockAspectRatio = msoTrue
            ' Shape position and sizes stuck to cell shape
            .Top = cell.Top + 1
            .Left = cell.Left + 1
            .Height = 70
            .Width = 70
            ' Move with the cell (and size, though that is likely buggy)
            .Placement = xlMoveAndSize
        End With
        ' Get rid of the
        cell.ClearContents
        
        
isnill:
        Set theShape = Nothing
        Range("C1").Select

    Next
    Application.ScreenUpdating = True

    Debug.Print "Done " & Now

End Sub

