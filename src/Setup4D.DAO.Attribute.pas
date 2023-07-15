unit Setup4D.DAO.Attribute;

interface

type
  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Atributo usado para marcar uma classe como uma tabela no contexto do banco de dados.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Attribute used to mark a class as a table in the database context.
  /// </summary>
  {$ENDIF}
  TTableAttribute = class(TCustomAttribute)
  private
    FName: string;
  public
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Cria uma nova instância do atributo TTableAttribute com o nome especificado.
    /// </summary>
    /// <param name="AName">O nome da tabela.</param>
    {$ELSE}
    /// <summary>
    /// Creates a new instance of TTableAttribute with the specified name.
    /// </summary>
    /// <param name="AName">The name of the table.</param>
    {$ENDIF}
    constructor Create(const AName: string);
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome da tabela.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Gets the name of the table.
    /// </summary>
    {$ENDIF}
    property Name: string read FName;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Atributo usado para marcar uma propriedade como um campo no contexto do banco de dados.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Attribute used to mark a property as a field in the database context.
  /// </summary>
  {$ENDIF}
  TFieldAttribute = class(TCustomAttribute)
  private
    FName: string;
  public
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Cria uma nova instância do atributo TFieldAttribute com o nome especificado.
    /// </summary>
    /// <param name="AName">O nome do campo.</param>
    {$ELSE}
    /// <summary>
    /// Creates a new instance of TFieldAttribute with the specified name.
    /// </summary>
    /// <param name="AName">The name of the field.</param>
    {$ENDIF}
    constructor Create(const AName: string);
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome do campo.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Gets the name of the field.
    /// </summary>
    {$ENDIF}
    property Name: string read FName;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Atributo usado para indicar que uma propriedade deve ser ignorada em operações de seleção.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Attribute used to indicate that a property should be ignored in select operations.
  /// </summary>
  {$ENDIF}
  TIgnoreInSelect = class(TCustomAttribute)
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Atributo usado para indicar que uma propriedade deve ser ignorada em operações de inserção.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Attribute used to indicate that a property should be ignored in insert operations.
  /// </summary>
  {$ENDIF}
  TIgnoreInInsert = class(TCustomAttribute)
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Atributo usado para indicar que uma propriedade deve ser ignorada em operações de atualização.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Attribute used to indicate that a property should be ignored in update operations.
  /// </summary>
  {$ENDIF}
  TIgnoreInUpdate = class(TCustomAttribute)
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Atributo usado para indicar que uma propriedade é um campo obrigatório.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Attribute used to indicate that a property is a required field.
  /// </summary>
  {$ENDIF}
  TRequiredField = class(TCustomAttribute)
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Atributo usado para indicar que uma propriedade é uma chave primária.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Attribute used to indicate that a property is a primary key.
  /// </summary>
  {$ENDIF}
  TPrimaryKey = class(TCustomAttribute)
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Atributo usado para indicar que uma propriedade é uma chave estrangeira.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Attribute used to indicate that a property is a foreign key.
  /// </summary>
  {$ENDIF}
  TForeignKey = class(TCustomAttribute)
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Atributo usado para indicar que uma propriedade é autoincrementável.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Attribute used to indicate that a property is auto-incremental.
  /// </summary>
  {$ENDIF}
  TAutoInc = class(TCustomAttribute)
  end;

implementation

constructor TTableAttribute.Create(const AName: string);
begin
  FName := AName;
end;

constructor TFieldAttribute.Create(const AName: string);
begin
  FName := AName;
end;

end.

