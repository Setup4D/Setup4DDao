{*******************************************************}
{                                                       }
{           DAO runtime library in pascal               }
{                    DAO Usefull                        }
{                                                       }
{                                                       }
{             Copyright(c) 2010-2023                    }
{      Setup4D Consulting & Development,  Inc.          }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit Setup4D.DAO.Useful;

interface

uses
  Setup4D.DAO.Types,
  System.Classes,
  System.RegularExpressions;

type
  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Classe utilitária para manipulação dos dados
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Classe utilitária para manipulação dos dados
  /// </summary>
  {$ENDIF}
  TSetup4DDAOUseful = class
  public
  {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Remove caracteres não alfanuméricos do início de uma string.
    /// </summary>
    /// <param name="AValue">
    /// A string a ser processada.
    /// </param>
    /// <returns>
    /// A string com caracteres não alfanuméricos removidos do início.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Removes non-alphanumeric characters from the beginning of a string.
    /// </summary>
    /// <param name="AValue">
    /// The string to be processed.
    /// </param>
    /// <returns>
    /// The string with non-alphanumeric characters removed from the beginning.
    /// </returns>
    {$ENDIF}
    class function RemoveNonAlphaNumericFromStart(const AValue: string): string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Extrai a primeira palavra de uma string.
    /// </summary>
    /// <param name="AValue">
    /// A string a ser processada.
    /// </param>
    /// <returns>
    /// A primeira palavra da string.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Extracts the first word from a string.
    /// </summary>
    /// <param name="AValue">
    /// The string to be processed.
    /// </param>
    /// <returns>
    /// The first word of the string.
    /// </returns>
    {$ENDIF}
    class function ExtractFirstWord(const AValue: string): string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Verifica se uma palavra existe em uma string.
    /// </summary>
    /// <param name="AValue">
    /// A string onde a palavra será procurada.
    /// </param>
    /// <param name="AKey">
    /// A palavra a ser procurada.
    /// </param>
    /// <returns>
    /// Verdadeiro se a palavra existir na string, falso caso contrário.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Checks if a word exists in a string.
    /// </summary>
    /// <param name="AValue">
    /// The string where the word will be searched.
    /// </param>
    /// <param name="AKey">
    /// The word to be searched for.
    /// </param>
    /// <returns>
    /// True if the word exists in the string, false otherwise.
    /// </returns>
    {$ENDIF}
    class function WordExistsInString(Const AValue, AKey: string): Boolean;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Classe utilitária para manipulação de tipos enumerados do DAO.
  /// </summary>
  /// <typeparam name="T">
  /// O tipo enumerado.
  /// </typeparam>
  {$ELSE}
  /// <summary>
  /// Utility class for manipulating DAO enumerated types.
  /// </summary>
  /// <typeparam name="T">
  /// The enumerated type.
  /// </typeparam>
  {$ENDIF}

  TSetup4DDAOEnumeratedTypes<T> = class
  public
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Converte um valor do tipo enumerado em uma string.
    /// </summary>
    /// <param name="AValue">
    /// O valor do tipo enumerado.
    /// </param>
    /// <returns>
    /// A string correspondente ao valor do tipo enumerado.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Converts a value of the enumerated type to a string.
    /// </summary>
    /// <param name="AValue">
    /// The value of the enumerated type.
    /// </param>
    /// <returns>
    /// The string corresponding to the value of the enumerated type.
    /// </returns>
    {$ENDIF}
    class function EnumToString(AValue: T): string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Preenche uma lista de strings com os valores do tipo enumerado.
    /// </summary>
    /// <param name="AValue">
    /// A lista de strings a ser preenchida.
    /// </param>
    {$ELSE}
    /// <summary>
    /// Fills a string list with the values of the enumerated type.
    /// </summary>
    /// <param name="AValue">
    /// The string list to be filled.
    /// </param>
    {$ENDIF}
    class procedure EnumToList(AValue: TStrings);

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Converte uma string em um valor do tipo enumerado.
    /// </summary>
    /// <param name="AValue">
    /// A string a ser convertida.
    /// </param>
    /// <returns>
    /// O valor do tipo enumerado correspondente à string.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Converts a string to a value of the enumerated type.
    /// </summary>
    /// <param name="AValue">
    /// The string to be converted.
    /// </param>
    /// <returns>
    /// The value of the enumerated type corresponding to the string.
    /// </returns>
    {$ENDIF}
    class function StringToEnum(AValue: string): T;
  end;


implementation

uses
  System.TypInfo,
  System.Rtti,
  System.SysUtils;

{ TSetup4DDAOEnumeratedTypes<T> }

class function TSetup4DDAOEnumeratedTypes<T>.EnumToString(AValue: T): string;
var
  LPosition: Variant;
begin
  LPosition := TValue.From<T>(AValue).AsVariant;
  Result := GetEnumName(TypeInfo(T), LPosition);
end;

class procedure TSetup4DDAOEnumeratedTypes<T>.EnumToList(AValue: TStrings);
var
  LAuxiliar: String;
  I: Integer;
  LPosicao: Integer;
begin
  AValue.Clear;
  I := 0;
  repeat
    LAuxiliar := GetEnumName(TypeInfo(T), I);
    LPosicao := GetEnumValue(TypeInfo(T), LAuxiliar);
    if LPosicao <> -1 then
      AValue.Add(LAuxiliar);
    Inc(I);
  until LPosicao < 0;
end;

class function TSetup4DDAOEnumeratedTypes<T>.StringToEnum(AValue: string): T;
var
  LTypeInfo: PTypeInfo;
  LPosition: Integer;
  LPointer: Pointer;
begin
  LTypeInfo := TypeInfo(T);
  LPosition := GetEnumValue(LTypeInfo, AValue);
  LPointer := @LPosition;
  Result := T(LPointer^);
end;

{ TSetup4DDAOUseful }

class function TSetup4DDAOUseful.ExtractFirstWord(const AValue: string): string;
var
  LSpacePos: Integer;
begin
  LSpacePos := Pos(' ', AValue.Trim);
  if LSpacePos > 0 then
    Result := Copy(AValue.Trim, 1, LSpacePos - 1)
  else
    Result := AValue;
end;

class function TSetup4DDAOUseful.RemoveNonAlphaNumericFromStart(
  const AValue: string): string;
var
  LRegex: TRegEx;
begin
  LRegex := TRegEx.Create('^[^A-Za-z0-9]*');
  Result := LRegex.Replace(AValue, '');
end;

class function TSetup4DDAOUseful.WordExistsInString(const AValue,
  AKey: string): Boolean;
begin
  Result := SameText(RemoveNonAlphaNumericFromStart(ExtractFirstWord(AValue).ToUpper),
                      AKey.ToUpper);

end;

end.
