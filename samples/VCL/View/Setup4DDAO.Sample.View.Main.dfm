object PageMain: TPageMain
  Left = 0
  Top = 0
  Caption = 'Page Main'
  ClientHeight = 358
  ClientWidth = 694
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 694
    Height = 358
    ActivePage = tsCustom
    Align = alClient
    MultiLine = True
    TabOrder = 0
    TabPosition = tpBottom
    ExplicitWidth = 690
    ExplicitHeight = 357
    object tsRTTi: TTabSheet
      Caption = 'RTTi'
      object lblOperador: TLabel
        Left = 495
        Top = 102
        Width = 50
        Height = 15
        Caption = 'Operador'
      end
      object btClearList: TButton
        Left = 16
        Top = 305
        Width = 305
        Height = 25
        Caption = 'Limpar Lista'
        TabOrder = 0
        OnClick = btClearListClick
      end
      object btFiltrar: TButton
        Left = 601
        Top = 72
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 1
        OnClick = btFiltrarClick
      end
      object btFiltroOperador: TButton
        Left = 601
        Top = 120
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 2
        OnClick = btFiltroOperadorClick
      end
      object btPesquisarID: TButton
        Left = 601
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 3
        OnClick = btPesquisarIDClick
      end
      object cbxOperador: TComboBox
        Left = 495
        Top = 121
        Width = 100
        Height = 23
        Style = csDropDownList
        TabOrder = 4
      end
      object edtFiltro: TLabeledEdit
        Left = 344
        Top = 73
        Width = 251
        Height = 23
        EditLabel.Width = 30
        EditLabel.Height = 15
        EditLabel.Caption = 'Filtro:'
        TabOrder = 5
        Text = ''
      end
      object edtFiltroOperador: TLabeledEdit
        Left = 344
        Top = 121
        Width = 145
        Height = 23
        EditLabel.Width = 30
        EditLabel.Height = 15
        EditLabel.Caption = 'Filtro:'
        TabOrder = 6
        Text = ''
      end
      object edtID: TLabeledEdit
        Left = 344
        Top = 25
        Width = 251
        Height = 23
        EditLabel.Width = 14
        EditLabel.Height = 15
        EditLabel.Caption = 'ID:'
        NumbersOnly = True
        TabOrder = 7
        Text = ''
      end
      object gbPercistir: TGroupBox
        Left = 344
        Top = 145
        Width = 332
        Height = 185
        Caption = ' Persistir '
        TabOrder = 8
        object edtPersistID: TLabeledEdit
          Left = 16
          Top = 40
          Width = 146
          Height = 23
          EditLabel.Width = 11
          EditLabel.Height = 15
          EditLabel.Caption = 'ID'
          NumbersOnly = True
          TabOrder = 0
          Text = ''
        end
        object edtPersistNome: TLabeledEdit
          Left = 168
          Top = 40
          Width = 153
          Height = 23
          EditLabel.Width = 33
          EditLabel.Height = 15
          EditLabel.Caption = 'Nome'
          TabOrder = 1
          Text = ''
        end
        object edtPersistOcultar: TLabeledEdit
          Left = 168
          Top = 85
          Width = 153
          Height = 23
          EditLabel.Width = 39
          EditLabel.Height = 15
          EditLabel.Caption = 'Ocultar'
          TabOrder = 3
          Text = ''
        end
        object edtPersistEmail: TLabeledEdit
          Left = 16
          Top = 85
          Width = 146
          Height = 23
          EditLabel.Width = 29
          EditLabel.Height = 15
          EditLabel.Caption = 'Email'
          TabOrder = 2
          Text = ''
        end
        object btinserir: TButton
          Tag = 1
          Left = 17
          Top = 136
          Width = 100
          Height = 25
          Caption = 'Inserir'
          TabOrder = 4
          OnClick = btinserirClick
        end
        object btMudar: TButton
          Tag = 2
          Left = 123
          Top = 136
          Width = 100
          Height = 25
          Caption = 'Mudar'
          TabOrder = 5
          OnClick = btinserirClick
        end
        object btApagar: TButton
          Tag = 3
          Left = 229
          Top = 136
          Width = 100
          Height = 25
          Caption = 'Apagar'
          TabOrder = 6
          OnClick = btinserirClick
        end
      end
      object Memo: TMemo
        Left = 16
        Top = 8
        Width = 305
        Height = 291
        Lines.Strings = (
          'Memo1')
        TabOrder = 9
      end
    end
    object tsCustom: TTabSheet
      Caption = 'CUSTOM'
      ImageIndex = 1
      object lblOrderBy: TLabel
        Left = 590
        Top = 198
        Width = 30
        Height = 15
        Caption = 'Order'
      end
      object lblWhereCodition: TLabel
        Left = 352
        Top = 110
        Width = 67
        Height = 15
        Caption = 'Comparador'
      end
      object lblOperadorLogico: TLabel
        Left = 352
        Top = 62
        Width = 89
        Height = 15
        Caption = 'Operador Logico'
      end
      object MemoCustom: TMemo
        Left = 24
        Top = 16
        Width = 305
        Height = 311
        ImeName = 'Portuguese (Brazilian ABNT)'
        Lines.Strings = (
          'Memo1')
        TabOrder = 0
      end
      object edtSelect: TLabeledEdit
        Left = 352
        Top = 33
        Width = 325
        Height = 23
        EditLabel.Width = 37
        EditLabel.Height = 15
        EditLabel.Caption = 'Select: '
        TabOrder = 1
        Text = 'SELECT * FROM CLIENTES'
        OnEnter = edtSelectEnter
        OnExit = edtSelectExit
      end
      object edtWhereKey: TLabeledEdit
        Left = 458
        Top = 81
        Width = 219
        Height = 23
        EditLabel.Width = 67
        EditLabel.Height = 15
        EditLabel.Caption = 'Where (Key):'
        TabOrder = 2
        Text = 'nome'
      end
      object cbxWhere: TComboBox
        Left = 352
        Top = 129
        Width = 100
        Height = 23
        Style = csDropDownList
        TabOrder = 3
      end
      object edtWhereValue: TLabeledEdit
        Left = 458
        Top = 129
        Width = 219
        Height = 23
        EditLabel.Width = 73
        EditLabel.Height = 15
        EditLabel.Caption = 'Where (Value)'
        TabOrder = 4
        Text = 'maria'
      end
      object edtGroupBy: TLabeledEdit
        Left = 352
        Top = 174
        Width = 325
        Height = 23
        EditLabel.Width = 52
        EditLabel.Height = 15
        EditLabel.Caption = 'Group By:'
        TabOrder = 5
        Text = ''
      end
      object edtOrderBy: TLabeledEdit
        Left = 350
        Top = 219
        Width = 234
        Height = 23
        Hint = 'Selecionar a forma de ordena'#231#227'o'
        EditLabel.Width = 49
        EditLabel.Height = 15
        EditLabel.Caption = 'Order By:'
        TabOrder = 6
        Text = 'nome'
      end
      object cbxOrder: TComboBox
        Left = 590
        Top = 219
        Width = 87
        Height = 23
        Style = csDropDownList
        TabOrder = 7
      end
      object edtJOIN: TLabeledEdit
        Left = 350
        Top = 265
        Width = 327
        Height = 23
        EditLabel.Width = 21
        EditLabel.Height = 15
        EditLabel.Caption = 'Join'
        TabOrder = 8
        Text = ''
      end
      object pnlBotao: TPanel
        Left = 366
        Top = 302
        Width = 297
        Height = 25
        BevelOuter = bvNone
        TabOrder = 9
        object btOpen: TButton
          Tag = 3
          Left = 197
          Top = 0
          Width = 100
          Height = 25
          Align = alRight
          Caption = 'Abrir'
          TabOrder = 0
          OnClick = btOpenClick
        end
        object btExecutar: TButton
          Tag = 3
          Left = 97
          Top = 0
          Width = 100
          Height = 25
          Align = alRight
          Caption = 'Executar'
          TabOrder = 1
          OnClick = btExecutarClick
        end
      end
      object cbxOperadorLogico: TComboBox
        Left = 352
        Top = 81
        Width = 100
        Height = 23
        Style = csDropDownList
        TabOrder = 10
      end
    end
  end
end
