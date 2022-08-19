object fmCliente: TfmCliente
  Left = 0
  Top = 0
  Caption = 'PRSistemas - Cadastro de Cliente'
  ClientHeight = 415
  ClientWidth = 810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object PagA: TPageControl
    Left = 0
    Top = 0
    Width = 810
    Height = 409
    ActivePage = TabConsulta
    Align = alTop
    TabOrder = 0
    object TabConsulta: TTabSheet
      Caption = 'Consulta'
      object pnpFiltro: TPanel
        Left = 0
        Top = 0
        Width = 802
        Height = 49
        Align = alTop
        Color = clBtnShadow
        ParentBackground = False
        TabOrder = 0
        object lblFiltro: TLabel
          Left = 7
          Top = 4
          Width = 87
          Height = 15
          Caption = 'Filtrar por Nome'
        end
        object edtFiltro: TEdit
          Left = 7
          Top = 20
          Width = 218
          Height = 23
          TabOrder = 0
        end
        object btnFiltrar: TButton
          Left = 231
          Top = 18
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = btnFiltrarClick
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 346
        Width = 802
        Height = 33
        Align = alBottom
        Color = clBtnShadow
        ParentBackground = False
        TabOrder = 1
        object btnNovo: TButton
          Left = 485
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnSelecionar: TButton
          Left = 563
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Selecionar'
          Enabled = False
          TabOrder = 1
          OnClick = btnSelecionarClick
        end
        object btnExcluir: TButton
          Left = 640
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Excluir'
          Enabled = False
          TabOrder = 2
          OnClick = btnExcluirClick
        end
        object btnFechar: TButton
          Left = 5
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Fechar'
          TabOrder = 3
          OnClick = btnFecharClick
        end
        object btnImprimir: TButton
          Left = 720
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Imprimir'
          TabOrder = 4
          OnClick = btnImprimirClick
        end
      end
      object gridConsulta: TDBGrid
        Left = 0
        Top = 49
        Width = 802
        Height = 297
        Align = alClient
        DataSource = dsConsulta
        DrawingStyle = gdsClassic
        FixedColor = 8454143
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = 'N'#186' ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cpf'
            Title.Caption = 'N'#186' CPF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rg'
            Title.Caption = 'N'#186' RG'
            Visible = True
          end>
      end
    end
    object TabCrud: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
      object lblEdtID: TLabeledEdit
        Left = 16
        Top = 24
        Width = 73
        Height = 23
        Color = clInfoBk
        EditLabel.Width = 11
        EditLabel.Height = 15
        EditLabel.Caption = 'ID'
        EditLabel.Color = clWhite
        EditLabel.ParentColor = False
        ReadOnly = True
        TabOrder = 0
        Text = ''
      end
      object lblEdtNome: TLabeledEdit
        Tag = 1
        Left = 16
        Top = 72
        Width = 305
        Height = 23
        EditLabel.Width = 33
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome'
        EditLabel.Color = clWhite
        EditLabel.ParentColor = False
        TabOrder = 1
        Text = 'Walter'
        OnEnter = lblEdtNomeEnter
        OnExit = lblEdtNomeExit
      end
      object lblEdtCpf: TLabeledEdit
        Tag = 1
        Left = 351
        Top = 72
        Width = 114
        Height = 23
        EditLabel.Width = 21
        EditLabel.Height = 15
        EditLabel.Caption = 'CPF'
        EditLabel.Color = clWhite
        EditLabel.ParentColor = False
        TabOrder = 2
        Text = ''
        OnEnter = lblEdtNomeEnter
        OnExit = lblEdtNomeExit
      end
      object lblEdtRg: TLabeledEdit
        Tag = 1
        Left = 471
        Top = 72
        Width = 114
        Height = 23
        CharCase = ecUpperCase
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = 'RG'
        EditLabel.Color = clWhite
        EditLabel.ParentColor = False
        TabOrder = 3
        Text = ''
        OnEnter = lblEdtNomeEnter
        OnExit = lblEdtNomeExit
      end
      object lblEdtNomeMae: TLabeledEdit
        Tag = 1
        Left = 16
        Top = 120
        Width = 305
        Height = 23
        EditLabel.Width = 75
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome da M'#227'e'
        EditLabel.Color = clWhite
        EditLabel.ParentColor = False
        TabOrder = 4
        Text = ''
        OnEnter = lblEdtNomeEnter
        OnExit = lblEdtNomeExit
      end
      object lblEdtNomePai: TLabeledEdit
        Tag = 1
        Left = 345
        Top = 120
        Width = 305
        Height = 23
        EditLabel.Width = 69
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome do Pai'
        EditLabel.Color = clWhite
        EditLabel.ParentColor = False
        TabOrder = 5
        Text = ''
        OnEnter = lblEdtNomeEnter
        OnExit = lblEdtNomeExit
      end
      object Panel2: TPanel
        Left = 0
        Top = 346
        Width = 802
        Height = 33
        Align = alBottom
        Color = clBtnShadow
        ParentBackground = False
        TabOrder = 6
        object btnListar: TButton
          Left = 7
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Voltar'
          TabOrder = 3
          OnClick = btnListarClick
        end
        object btnAlterar: TButton
          Left = 562
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 0
          OnClick = btnAlterarClick
        end
        object btnGravar: TButton
          Left = 640
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 1
          OnClick = btnGravarClick
        end
        object btnCancelar: TButton
          Left = 718
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 2
          OnClick = btnCancelarClick
        end
        object btnImprimirFicha: TButton
          Left = 483
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Imprimir'
          TabOrder = 4
          OnClick = btnImprimirFichaClick
        end
      end
      object lblEdtCep: TLabeledEdit
        Tag = 1
        Left = 16
        Top = 186
        Width = 89
        Height = 23
        CharCase = ecUpperCase
        EditLabel.Width = 21
        EditLabel.Height = 15
        EditLabel.Caption = 'Cep'
        EditLabel.Color = clWhite
        EditLabel.ParentColor = False
        TabOrder = 7
        Text = ''
        OnEnter = lblEdtCepEnter
        OnExit = lblEdtCepExit
      end
      object btnBuscaCep: TButton
        Left = 111
        Top = 185
        Width = 57
        Height = 25
        Caption = 'Buscar'
        Default = True
        TabOrder = 8
        OnClick = btnBuscaCepClick
      end
      object lblEdtEndereco: TLabeledEdit
        Tag = 1
        Left = 16
        Top = 232
        Width = 385
        Height = 23
        EditLabel.Width = 49
        EditLabel.Height = 15
        EditLabel.Caption = 'Endere'#231'o'
        EditLabel.Color = clWhite
        EditLabel.ParentColor = False
        TabOrder = 9
        Text = ''
        OnEnter = lblEdtNomeEnter
        OnExit = lblEdtNomeExit
      end
      object lblEdtNumero: TLabeledEdit
        Tag = 1
        Left = 407
        Top = 232
        Width = 66
        Height = 23
        CharCase = ecUpperCase
        EditLabel.Width = 44
        EditLabel.Height = 15
        EditLabel.Caption = 'Numero'
        EditLabel.Color = clWhite
        EditLabel.ParentColor = False
        MaxLength = 5
        TabOrder = 10
        Text = ''
        OnEnter = lblEdtNomeEnter
        OnExit = lblEdtNomeExit
      end
      object lblEdtCidade: TLabeledEdit
        Tag = 1
        Left = 478
        Top = 232
        Width = 263
        Height = 23
        CharCase = ecUpperCase
        EditLabel.Width = 37
        EditLabel.Height = 15
        EditLabel.Caption = 'Cidade'
        EditLabel.Color = clWhite
        EditLabel.ParentColor = False
        TabOrder = 11
        Text = ''
        OnEnter = lblEdtNomeEnter
        OnExit = lblEdtNomeExit
      end
      object lblEdtUf: TLabeledEdit
        Tag = 1
        Left = 748
        Top = 232
        Width = 38
        Height = 23
        CharCase = ecUpperCase
        EditLabel.Width = 14
        EditLabel.Height = 15
        EditLabel.Caption = 'UF'
        EditLabel.Color = clWhite
        EditLabel.ParentColor = False
        MaxLength = 2
        TabOrder = 12
        Text = ''
        OnEnter = lblEdtNomeEnter
        OnExit = lblEdtNomeExit
      end
      object Panel3: TPanel
        Left = 0
        Top = 305
        Width = 802
        Height = 41
        Align = alBottom
        TabOrder = 13
      end
    end
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 280
    Top = 56
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    AfterOpen = cdsConsultaAfterOpen
    Left = 280
    Top = 117
    object cdsConsultaid: TAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsConsultanome: TStringField
      DisplayWidth = 50
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object cdsConsultacpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      FixedChar = True
      Size = 11
    end
    object cdsConsultarg: TStringField
      FieldName = 'rg'
      Origin = 'rg'
      FixedChar = True
    end
  end
  object dspConsulta: TDataSetProvider
    DataSet = sqlConsulta
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 280
    Top = 184
  end
  object sqlConsulta: TFDQuery
    Connection = DmConexao.FDConexao
    SQL.Strings = (
      'Select * from dbo.cliente')
    Left = 280
    Top = 248
  end
end
