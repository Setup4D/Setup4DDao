unit Setup4D.DAO.Rtti;

interface

uses
  Setup4D.DAO.Types,
  Setup4D.DAO.Interf,
  Setup4D.DAO.Attribute,

  System.Rtti,
  System.SysUtils,
  System.Generics.Collections;

type
  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Retorna os dados da classe associados ao DAO.
  /// </summary>
  /// <returns>
  /// Os dados da classe associados ao DAO.
  /// </returns>
  /// <remarks>
  /// Este método retorna os dados da classe associados ao DAO,
  /// que podem ser usados para manipulação ou análise de dados adicionais.
  /// </remarks>
  {$ELSE}
  /// <summary>
  /// Returns the class data associated with the DAO.
  /// </summary>
  /// <returns>
  /// The class data associated with the DAO.
  /// </returns>
  /// <remarks>
  /// This method returns the class data associated with the DAO,
  /// which can be used for additional data manipulation or analysis.
  /// </remarks>
  {$ENDIF}
  TSetup4DDAORtti<T: class, constructor> = class(TInterfacedObject, ISetup4DDAORtti<T>)

  private
  {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Construtor da classe TSetupDAO.
    /// </summary>
  {$ELSE}
    /// <summary>
    /// Constructor of the TSetupDAO class.
    /// </summary>
  {$ENDIF}
    constructor Create;
  protected
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna o nome da tabela associada ao DAO.
    /// </summary>
    /// <returns>
    /// O nome da tabela associada ao DAO.
    /// </returns>
    /// <remarks>
    /// Este método retorna o nome da tabela associada ao DAO,
    /// que pode ser usado para consultas e manipulação de dados.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Returns the name of the table associated with the DAO.
    /// </summary>
    /// <returns>The name of the table associated with the DAO.</returns>
    /// <remarks>
    /// This method returns the name of the table associated with the DAO,
    /// which can be used for querying and manipulating data.
    /// </remarks>
    {$ENDIF}
    function GetTableName: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna os nomes dos campos associados ao DAO.
    /// </summary>
    /// <returns>
    /// Um array contendo os nomes dos campos associados ao DAO.
    /// </returns>
    /// <remarks>
    /// Este método retorna os nomes dos campos associados ao DAO,
    /// que podem ser usados para consultas e manipulação de dados.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Returns the names of the fields associated with the DAO.
    /// </summary>
    /// <returns>An array containing the names of the fields associated with the DAO.</returns>
    /// <remarks>
    /// This method returns the names of the fields associated with the DAO,
    /// which can be used for querying and manipulating data.
    /// </remarks>
    {$ENDIF}
    function GetFieldNames(AValue: TCRUDOperation): TArray<string>; overload;
  public
  {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Destrói a instância da classe TSetup4DDAORtti.
    /// </summary>
  {$ELSE}
    /// <summary>
    /// Destroys the instance of the TSetup4DDAORtti<T> class.
    /// </summary>
  {$ENDIF}
    destructor Destroy; override;

  {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Cria uma nova instância da classe TSetup4DDAORtti.
    /// </summary>
    /// <returns>
    /// Uma nova instância da interface ISetup4DDAORtti<T>.
    /// </returns>
  {$ELSE}
    /// <summary>
    /// Creates a new instance of the TSetup4DDAORtti class.
    /// </summary>
    /// <returns>
    /// A new instance of the ISetup4DDAORtti<T> interface.
    /// </returns>
  {$ENDIF}
    class function New: ISetup4DDAORtti<T>;
  end;

implementation


{ TSetup4DDAORtti<T> }

constructor TSetup4DDAORtti<T>.Create;
begin

end;

destructor TSetup4DDAORtti<T>.Destroy;
begin
  inherited;
end;

function TSetup4DDAORtti<T>.GetFieldNames(AValue: TCRUDOperation): TArray<string>;
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiProperty: TRttiProperty;
  LAttribute: TCustomAttribute;
  LFieldList: TList<string>;
begin
  LRttiContext := TRttiContext.Create;
  LFieldList := TList<string>.Create;
  try
    LRttiType := LRttiContext.GetType(TClass(T));

    // Verificar as propriedades da classe T
    for LRttiProperty in LRttiType.GetProperties do
    begin
      // Verificar os atributos TField
      for LAttribute in LRttiProperty.GetAttributes do
      begin
        // Obter o nome do campo da propriedade
        if LAttribute is TFieldAttribute then
          LFieldList.Add(TFieldAttribute(LAttribute).Name);
      end;
    end;

    case AValue of
      TCRUDOperation.Create:
      begin
        // Remover os campos marcados com o atributo Ignorar com o Select
        for LRttiProperty in LRttiType.GetProperties do
        begin
          for LAttribute in LRttiProperty.GetAttributes do
          begin
            if (LAttribute is TIgnoreInInsert) or (LAttribute is TAutoInc) then
              LFieldList.Remove(TFieldAttribute(LRttiProperty.GetAttribute(TFieldAttribute)).Name);
          end;
        end;
      end;
      TCRUDOperation.Read:
      begin
        // Remover os campos marcados com o atributo Ignorar com o Select
        for LRttiProperty in LRttiType.GetProperties do
        begin
          for LAttribute in LRttiProperty.GetAttributes do
          begin
            if LAttribute is TIgnoreInSelect then
              LFieldList.Remove(TFieldAttribute(LRttiProperty.GetAttribute(TFieldAttribute)).Name);
          end;
        end;
      end;
      TCRUDOperation.Update:
      begin
        // Remover os campos marcados com o atributo Ignorar com o UPDATE
        for LRttiProperty in LRttiType.GetProperties do
        begin
          for LAttribute in LRttiProperty.GetAttributes do
          begin
            if (LAttribute is TIgnoreInUpdate)  or (LAttribute is TPrimaryKey)  then
              LFieldList.Remove(TFieldAttribute(LRttiProperty.GetAttribute(TFieldAttribute)).Name);
          end;
        end;
      end;
      TCRUDOperation.Delete:
      begin
      end;
    end;

    // Converter a lista de campos para um array
    Result := LFieldList.ToArray;
  finally
    LFieldList.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
    LRttiContext.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
  end;
end;


function TSetup4DDAORtti<T>.GetTableName: string;
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LAttribute: TCustomAttribute;
begin
  LRttiContext := TRttiContext.Create;
  try
    LRttiType := LRttiContext.GetType(TClass(T));

    // Verificar se existe atributo Tabela definido na classe
    for LAttribute in LRttiType.GetAttributes do
    begin
      if LAttribute is TTableAttribute then
      begin
        Result := TTableAttribute(LAttribute).Name;
        Exit;
      end;
    end;

    // Se nenhum atributo Tabela for encontrado, utilizar o nome da classe
    Result := LRttiType.Name;

    if string(Result[1]).ToUpper = 'T' then
      Result := Copy(Result, 2, Result.Length);

  finally
    LRttiContext.{$IFDEF MSWINDOWS}Free{$ELSE}DisposeOf{$ENDIF};
  end;
end;


class function TSetup4DDAORtti<T>.New: ISetup4DDAORtti<T>;
begin
  Result := Self.Create;
end;

end.
