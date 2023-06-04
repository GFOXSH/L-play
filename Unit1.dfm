object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'L-play'
  ClientHeight = 448
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 144
    Top = 432
    Width = 86
    Height = 13
    Caption = #169' GFOXSH, 2023'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = False
  end
  object Edit1: TEdit
    Left = 0
    Top = 0
    Width = 369
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 0
    Top = 24
    Width = 369
    Height = 21
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 48
    Width = 177
    Height = 105
    Caption = 'WARP'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 40
      Width = 84
      Height = 13
      Caption = 'Feature level limit:'
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 56
      Width = 161
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'None'
      Items.Strings = (
        'None'
        '9_1'
        '9_2'
        '9_3'
        '10_0'
        '10_1'
        '11_0'
        '11_1')
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 80
      Width = 161
      Height = 17
      Caption = 'Disable feature level upgrade'
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 16
      Width = 161
      Height = 17
      Caption = 'Enable'
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 192
    Top = 48
    Width = 177
    Height = 121
    Caption = 'CPU'
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 34
      Height = 13
      Caption = 'Priority:'
    end
    object Label3: TLabel
      Left = 8
      Top = 80
      Width = 34
      Height = 13
      Caption = 'Affinity:'
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 16
      Width = 161
      Height = 17
      Caption = 'Enable'
      TabOrder = 0
    end
    object ComboBox2: TComboBox
      Left = 8
      Top = 56
      Width = 161
      Height = 21
      ItemHeight = 13
      ItemIndex = 3
      TabOrder = 1
      Text = 'Normal'
      Items.Strings = (
        'Realtime'
        'High'
        'Above normal'
        'Normal'
        'Below normal'
        'Low')
    end
    object CheckBox11: TCheckBox
      Left = 24
      Top = 96
      Width = 17
      Height = 17
      TabOrder = 2
    end
    object CheckBox12: TCheckBox
      Left = 40
      Top = 96
      Width = 17
      Height = 17
      TabOrder = 3
    end
    object CheckBox13: TCheckBox
      Left = 56
      Top = 96
      Width = 17
      Height = 17
      TabOrder = 4
    end
    object CheckBox14: TCheckBox
      Left = 72
      Top = 96
      Width = 17
      Height = 17
      TabOrder = 5
    end
    object CheckBox15: TCheckBox
      Left = 88
      Top = 96
      Width = 17
      Height = 17
      TabOrder = 6
    end
    object CheckBox16: TCheckBox
      Left = 104
      Top = 96
      Width = 17
      Height = 17
      TabOrder = 7
    end
    object CheckBox17: TCheckBox
      Left = 120
      Top = 96
      Width = 17
      Height = 17
      TabOrder = 8
    end
    object CheckBox18: TCheckBox
      Left = 136
      Top = 96
      Width = 17
      Height = 17
      TabOrder = 9
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 152
    Width = 177
    Height = 177
    Caption = 'Native software renderer'
    TabOrder = 4
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 108
      Height = 13
      Caption = 'SwiftShader (Direct3D)'
    end
    object Label5: TLabel
      Left = 8
      Top = 72
      Width = 89
      Height = 13
      Caption = 'Mesa3D (OpenGL)'
    end
    object Label7: TLabel
      Left = 8
      Top = 128
      Width = 104
      Height = 13
      Caption = 'Direct3D 8 to 9 bridge'
    end
    object Button1: TButton
      Left = 8
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Install'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 96
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Remove'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 8
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Install'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 96
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Remove'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button8: TButton
      Left = 8
      Top = 144
      Width = 75
      Height = 25
      Caption = 'Install'
      TabOrder = 4
      OnClick = Button8Click
    end
    object Button9: TButton
      Left = 96
      Top = 144
      Width = 75
      Height = 25
      Caption = 'Remove'
      TabOrder = 5
      OnClick = Button9Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 192
    Top = 176
    Width = 177
    Height = 153
    Caption = 'WineD3D (Direct3D to OpenGL)'
    TabOrder = 5
    object CheckBox4: TCheckBox
      Left = 8
      Top = 16
      Width = 161
      Height = 17
      Caption = 'DXGI'
      TabOrder = 0
    end
    object CheckBox5: TCheckBox
      Left = 8
      Top = 32
      Width = 161
      Height = 17
      Caption = 'DirectDraw'
      TabOrder = 1
    end
    object CheckBox6: TCheckBox
      Left = 8
      Top = 48
      Width = 161
      Height = 17
      Caption = 'DirectX 8'
      TabOrder = 2
    end
    object CheckBox7: TCheckBox
      Left = 8
      Top = 64
      Width = 161
      Height = 17
      Caption = 'DirectX 9'
      TabOrder = 3
    end
    object CheckBox8: TCheckBox
      Left = 8
      Top = 80
      Width = 161
      Height = 17
      Caption = 'DirectX 10'
      TabOrder = 4
    end
    object CheckBox9: TCheckBox
      Left = 8
      Top = 96
      Width = 161
      Height = 17
      Caption = 'DirectX 11'
      TabOrder = 5
    end
    object Button6: TButton
      Left = 8
      Top = 120
      Width = 75
      Height = 25
      Caption = 'Install'
      TabOrder = 6
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 96
      Top = 120
      Width = 75
      Height = 25
      Caption = 'Remove'
      TabOrder = 7
      OnClick = Button7Click
    end
  end
  object Button5: TButton
    Left = 8
    Top = 400
    Width = 361
    Height = 25
    Caption = 'Launch'
    TabOrder = 6
    OnClick = Button5Click
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 336
    Width = 361
    Height = 57
    Caption = 'MemReduct'
    TabOrder = 7
    object CheckBox10: TCheckBox
      Left = 8
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Minimized'
      TabOrder = 0
    end
    object Button10: TButton
      Left = 192
      Top = 16
      Width = 161
      Height = 33
      Caption = 'Run'
      TabOrder = 1
      OnClick = Button10Click
    end
  end
end
