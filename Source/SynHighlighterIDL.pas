{-------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
the specific language governing rights and limitations under the License.

Code template generated with SynGen.
The original code is: SynHighlighterIDL.pas, released 2001-10-15.
Description: CORBA IDL Parser/Highlighter
The initial author of this file is P.L. Polak.
Unicode translation by Ma�l H�rz.
Copyright (c) 2001, all rights reserved.

Contributors to the SynEdit and mwEdit projects are listed in the
Contributors.txt file.

Alternatively, the contents of this file may be used under the terms of the
GNU General Public License Version 2 or later (the "GPL"), in which case
the provisions of the GPL are applicable instead of those above.
If you wish to allow use of your version of this file only under the terms
of the GPL and not to allow others to use your version of this file
under the MPL, indicate your decision by deleting the provisions above and
replace them with the notice and other provisions required by the GPL.
If you do not delete the provisions above, a recipient may use your version
of this file under either the MPL or the GPL.

$Id: SynHighlighterIDL.pas,v 1.8.2.7 2008/09/14 16:25:00 maelh Exp $

You may retrieve the latest version of this file at the SynEdit home page,
located at http://SynEdit.SourceForge.net

-------------------------------------------------------------------------------}

{$IFNDEF QSYNHIGHLIGHTERIDL}
unit SynHighlighterIDL;
{$ENDIF}

{$I SynEdit.Inc}

interface

uses
{$IFDEF SYN_CLX}
  QGraphics,
  QSynEditTypes,
  QSynEditHighlighter,
  QSynUnicode,
{$ELSE}
  Graphics,
  SynEditTypes,
  SynEditHighlighter,
  SynUnicode,
{$ENDIF}
  SysUtils,
  Classes;

Type
  TtkTokenKind = (
    tkComment,
    tkDatatype,
    tkIdentifier,
    tkKey,
    tkNull,
    tkNumber,
    tkPreprocessor,
    tkSpace,
    tkString,
    tkSymbol,
    tkUnknown);

  TRangeState = (rsUnknown, rsComment, rsString, rsChar);

  PIdentFuncTableFunc = ^TIdentFuncTableFunc;
  TIdentFuncTableFunc = function (Index: Integer): TtkTokenKind of object;

type
  TSynIdlSyn = class(TSynCustomHighlighter)
  private
    FRange: TRangeState;
    FTokenID: TtkTokenKind;
    FIdentFuncTable: array[0..100] of TIdentFuncTableFunc;
    FCommentAttri: TSynHighlighterAttributes;
    FDatatypeAttri: TSynHighlighterAttributes;
    FIdentifierAttri: TSynHighlighterAttributes;
    FKeyAttri: TSynHighlighterAttributes;
    FNumberAttri: TSynHighlighterAttributes;
    FPreprocessorAttri: TSynHighlighterAttributes;
    FSpaceAttri: TSynHighlighterAttributes;
    FStringAttri: TSynHighlighterAttributes;
    FSymbolAttri: TSynHighlighterAttributes;
    function AltFunc(Index: Integer): TtkTokenKind;
    procedure IdentProc;
    procedure SymbolProc;
    procedure UnknownProc;
    function FuncAbstract(Index: Integer): TtkTokenKind;
    function FuncAny(Index: Integer): TtkTokenKind;
    function FuncAttribute(Index: Integer): TtkTokenKind;
    function FuncBoolean(Index: Integer): TtkTokenKind;
    function FuncCase(Index: Integer): TtkTokenKind;
    function FuncChar(Index: Integer): TtkTokenKind;
    function FuncConst(Index: Integer): TtkTokenKind;
    function FuncContext(Index: Integer): TtkTokenKind;
    function FuncCustom(Index: Integer): TtkTokenKind;
    function FuncDefault(Index: Integer): TtkTokenKind;
    function FuncDouble(Index: Integer): TtkTokenKind;
    function FuncEnum(Index: Integer): TtkTokenKind;
    function FuncException(Index: Integer): TtkTokenKind;
    function FuncFactory(Index: Integer): TtkTokenKind;
    function FuncFalse(Index: Integer): TtkTokenKind;
    function FuncFixed(Index: Integer): TtkTokenKind;
    function FuncFloat(Index: Integer): TtkTokenKind;
    function FuncIn(Index: Integer): TtkTokenKind;
    function FuncInout(Index: Integer): TtkTokenKind;
    function FuncInterface(Index: Integer): TtkTokenKind;
    function FuncLocal(Index: Integer): TtkTokenKind;
    function FuncLong(Index: Integer): TtkTokenKind;
    function FuncModule(Index: Integer): TtkTokenKind;
    function FuncNative(Index: Integer): TtkTokenKind;
    function FuncObject(Index: Integer): TtkTokenKind;
    function FuncOctet(Index: Integer): TtkTokenKind;
    function FuncOneway(Index: Integer): TtkTokenKind;
    function FuncOut(Index: Integer): TtkTokenKind;
    function FuncPrivate(Index: Integer): TtkTokenKind;
    function FuncPublic(Index: Integer): TtkTokenKind;
    function FuncRaises(Index: Integer): TtkTokenKind;
    function FuncReadonly(Index: Integer): TtkTokenKind;
    function FuncSequence(Index: Integer): TtkTokenKind;
    function FuncShort(Index: Integer): TtkTokenKind;
    function FuncString(Index: Integer): TtkTokenKind;
    function FuncStruct(Index: Integer): TtkTokenKind;
    function FuncSupports(Index: Integer): TtkTokenKind;
    function FuncSwitch(Index: Integer): TtkTokenKind;
    function FuncTrue(Index: Integer): TtkTokenKind;
    function FuncTruncatable(Index: Integer): TtkTokenKind;
    function FuncTypedef(Index: Integer): TtkTokenKind;
    function FuncUnion(Index: Integer): TtkTokenKind;
    function FuncUnsigned(Index: Integer): TtkTokenKind;
    function FuncValuebase(Index: Integer): TtkTokenKind;
    function FuncValuetype(Index: Integer): TtkTokenKind;
    function FuncVoid(Index: Integer): TtkTokenKind;
    function FuncWchar(Index: Integer): TtkTokenKind;
    function FuncWstring(Index: Integer): TtkTokenKind;
    function HashKey(Str: PWideChar): Cardinal;
    function IdentKind(MayBe: PWideChar): TtkTokenKind;
    procedure InitIdent;
    procedure NullProc;
    procedure NumberProc;
    procedure SpaceProc;
    procedure CRProc;
    procedure LFProc;
    procedure CommentOpenProc;
    procedure CommentProc;
    procedure StringOpenProc;
    procedure StringProc;
    procedure CharOpenProc;
    procedure CharProc;
    procedure PreProcessorProc;
  protected
    function GetSampleSource: UnicodeString; override;
    function IsFilterStored: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    class function GetLanguageName: string; override;
    class function GetFriendlyLanguageName: UnicodeString; override;
    function GetRange: Pointer; override;
    procedure ResetRange; override;
    procedure SetRange(Value: Pointer); override;
    function GetDefaultAttribute(Index: Integer): TSynHighlighterAttributes; override;
    function GetEol: Boolean; override;
    function GetTokenID: TtkTokenKind;
    function GetTokenAttribute: TSynHighlighterAttributes; override;
    function GetTokenKind: Integer; override;
    function IsIdentChar(AChar: WideChar): Boolean; override;
    procedure Next; override;
  published
    property CommentAttri: TSynHighlighterAttributes read FCommentAttri write FCommentAttri;
    property DatatypeAttri: TSynHighlighterAttributes read FDatatypeAttri write FDatatypeAttri;
    property IdentifierAttri: TSynHighlighterAttributes read FIdentifierAttri write FIdentifierAttri;
    property KeyAttri: TSynHighlighterAttributes read FKeyAttri write FKeyAttri;
    property NumberAttri: TSynHighlighterAttributes read FNumberAttri write FNumberAttri;
    property PreprocessorAttri: TSynHighlighterAttributes read FPreprocessorAttri write FPreprocessorAttri;
    property SpaceAttri: TSynHighlighterAttributes read FSpaceAttri write FSpaceAttri;
    property StringAttri: TSynHighlighterAttributes read FStringAttri write FStringAttri;
    property SymbolAttri: TSynHighlighterAttributes read FSymbolAttri write FSymbolAttri;
  end;

implementation

uses
{$IFDEF SYN_CLX}
  QSynEditStrConst;
{$ELSE}
  SynEditStrConst;
{$ENDIF}

const
  KeyWords: array[0..47] of UnicodeString = (
    'abstract', 'any', 'attribute', 'boolean', 'case', 'char', 'const', 
    'context', 'custom', 'default', 'double', 'enum', 'exception', 'factory', 
    'FALSE', 'fixed', 'float', 'in', 'inout', 'interface', 'local', 'long', 
    'module', 'native', 'Object', 'octet', 'oneway', 'out', 'private', 'public', 
    'raises', 'readonly', 'sequence', 'short', 'string', 'struct', 'supports', 
    'switch', 'TRUE', 'truncatable', 'typedef', 'union', 'unsigned', 
    'ValueBase', 'valuetype', 'void', 'wchar', 'wstring' 
  );

  KeyIndices: array[0..100] of Integer = (
    5, 19, 17, 7, -1, -1, -1, -1, -1, 15, 18, -1, 37, -1, 24, -1, -1, -1, 44, 
    -1, 11, 31, -1, 25, 33, -1, -1, 42, 39, -1, -1, 36, 46, -1, 27, -1, 43, 28, 
    26, 20, -1, 1, 32, 6, -1, 14, 8, -1, -1, -1, -1, 0, 35, -1, -1, -1, -1, -1, 
    -1, -1, -1, 45, 22, 47, -1, -1, 12, 4, -1, -1, -1, 10, -1, -1, 3, -1, 9, -1, 
    34, 30, 13, -1, 2, 21, 16, -1, 29, 40, -1, -1, -1, -1, -1, -1, -1, 23, -1, 
    38, -1, -1, 41 
  );

{$Q-}
function TSynIdlSyn.HashKey(Str: PWideChar): Cardinal;
begin
  Result := 0;
  while IsIdentChar(Str^) do
  begin
    Result := Result * 612 + Ord(Str^) * 199;
    Inc(Str);
  end;
  Result := Result mod 101;
  FStringLen := Str - FToIdent;
end;
{$Q+}

function TSynIdlSyn.IdentKind(MayBe: PWideChar): TtkTokenKind;
var
  Key: Cardinal;
begin
  FToIdent := MayBe;
  Key := HashKey(MayBe);
  if Key <= High(FIdentFuncTable) then
    Result := FIdentFuncTable[Key](KeyIndices[Key])
  else
    Result := tkIdentifier;
end;

procedure TSynIdlSyn.InitIdent;
var
  i: Integer;
begin
  for i := Low(FIdentFuncTable) to High(FIdentFuncTable) do
    if KeyIndices[i] = -1 then
      FIdentFuncTable[i] := AltFunc;

  FIdentFuncTable[51] := FuncAbstract;
  FIdentFuncTable[41] := FuncAny;
  FIdentFuncTable[82] := FuncAttribute;
  FIdentFuncTable[74] := FuncBoolean;
  FIdentFuncTable[67] := FuncCase;
  FIdentFuncTable[0] := FuncChar;
  FIdentFuncTable[43] := FuncConst;
  FIdentFuncTable[3] := FuncContext;
  FIdentFuncTable[46] := FuncCustom;
  FIdentFuncTable[76] := FuncDefault;
  FIdentFuncTable[71] := FuncDouble;
  FIdentFuncTable[20] := FuncEnum;
  FIdentFuncTable[66] := FuncException;
  FIdentFuncTable[80] := FuncFactory;
  FIdentFuncTable[45] := FuncFalse;
  FIdentFuncTable[9] := FuncFixed;
  FIdentFuncTable[84] := FuncFloat;
  FIdentFuncTable[2] := FuncIn;
  FIdentFuncTable[10] := FuncInout;
  FIdentFuncTable[1] := FuncInterface;
  FIdentFuncTable[39] := FuncLocal;
  FIdentFuncTable[83] := FuncLong;
  FIdentFuncTable[62] := FuncModule;
  FIdentFuncTable[95] := FuncNative;
  FIdentFuncTable[14] := FuncObject;
  FIdentFuncTable[23] := FuncOctet;
  FIdentFuncTable[38] := FuncOneway;
  FIdentFuncTable[34] := FuncOut;
  FIdentFuncTable[37] := FuncPrivate;
  FIdentFuncTable[86] := FuncPublic;
  FIdentFuncTable[79] := FuncRaises;
  FIdentFuncTable[21] := FuncReadonly;
  FIdentFuncTable[42] := FuncSequence;
  FIdentFuncTable[24] := FuncShort;
  FIdentFuncTable[78] := FuncString;
  FIdentFuncTable[52] := FuncStruct;
  FIdentFuncTable[31] := FuncSupports;
  FIdentFuncTable[12] := FuncSwitch;
  FIdentFuncTable[97] := FuncTrue;
  FIdentFuncTable[28] := FuncTruncatable;
  FIdentFuncTable[87] := FuncTypedef;
  FIdentFuncTable[100] := FuncUnion;
  FIdentFuncTable[27] := FuncUnsigned;
  FIdentFuncTable[36] := FuncValuebase;
  FIdentFuncTable[18] := FuncValuetype;
  FIdentFuncTable[61] := FuncVoid;
  FIdentFuncTable[32] := FuncWchar;
  FIdentFuncTable[63] := FuncWstring;
end;

function TSynIdlSyn.AltFunc(Index: Integer): TtkTokenKind;
begin
  Result := tkIdentifier;
end;

function TSynIdlSyn.FuncAbstract(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncAny(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkDatatype
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncAttribute(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncBoolean(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkDatatype
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncCase(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncChar(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkDatatype
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncConst(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncContext(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncCustom(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncDefault(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncDouble(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkDatatype
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncEnum(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncException(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncFactory(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncFalse(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncFixed(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkDatatype
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncFloat(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkDatatype
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncIn(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncInout(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncInterface(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncLocal(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncLong(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkDatatype
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncModule(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncNative(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncObject(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncOctet(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkDatatype
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncOneway(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncOut(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncPrivate(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncPublic(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncRaises(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncReadonly(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncSequence(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncShort(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkDatatype
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncString(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkDatatype
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncStruct(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncSupports(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncSwitch(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncTrue(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncTruncatable(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncTypedef(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncUnion(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncUnsigned(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncValuebase(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncValuetype(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncVoid(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkDatatype
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncWchar(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkDatatype
  else
    Result := tkIdentifier;
end;

function TSynIdlSyn.FuncWstring(Index: Integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkDatatype
  else
    Result := tkIdentifier;
end;

procedure TSynIdlSyn.SpaceProc;
begin
  Inc(Run);
  FTokenID := tkSpace;
  while (FLine[Run] <= #32) and not IsLineEnd(Run) do Inc(Run);
end;

procedure TSynIdlSyn.NullProc;
begin
  FTokenID := tkNull;
  Inc(Run);
end;

procedure TSynIdlSyn.NumberProc;

  function IsNumberChar: Boolean;
  begin
    case FLine[Run] of
      '0'..'9', '.', 'e', 'E':
        Result := True;
      else
        Result := False;
    end;
  end;

begin
  Inc(Run);
  FTokenID := tkNumber;
  while IsNumberChar do
  begin
    case FLine[Run] of
      '.': if FLine[Run + 1] = '.' then
             Break;
    end;
    Inc(Run);
  end;
end; { NumberProc }


procedure TSynIdlSyn.CRProc;
begin
  FTokenID := tkSpace;
  Inc(Run);
  if FLine[Run] = #10 then
    Inc(Run);
end;

procedure TSynIdlSyn.LFProc;
begin
  FTokenID := tkSpace;
  Inc(Run);
end;

procedure TSynIdlSyn.CommentOpenProc;
begin
  Inc(Run);
  if (FLine[Run] = '*') then
  begin
    FRange := rsComment;
    CommentProc;
    FTokenID := tkComment;
  end
  else if (FLine[Run] = '/') then
  begin
    while not IsLineEnd(Run) do
      Inc(Run);
    FTokenID := tkComment;
  end
  else
    FTokenID := tkSymbol;
end;

procedure TSynIdlSyn.CommentProc;
begin
  case FLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    begin
      FTokenID := tkComment;
      repeat
        if (FLine[Run] = '*') and
           (FLine[Run + 1] = '/') then
        begin
          Inc(Run, 2);
          FRange := rsUnknown;
          Break;
        end;
        if not IsLineEnd(Run) then
          Inc(Run);
      until IsLineEnd(Run);
    end;
  end;
end;

procedure TSynIdlSyn.StringOpenProc;
begin
  Inc(Run);
  FRange := rsString;
  StringProc;
  FTokenID := tkString;
end;

procedure TSynIdlSyn.StringProc;
begin
  FTokenID := tkString;
  repeat
    if (FLine[Run] = '"') then
    begin
      Inc(Run);
      FRange := rsUnknown;
      Break;
    end
    else if (FLine[Run] = '\') then
      Inc(Run);
    if not IsLineEnd(Run) then
      Inc(Run);
  until IsLineEnd(Run);
end;

procedure TSynIdlSyn.CharOpenProc;
begin
  Inc(Run);
  FRange := rsChar;
  CharProc;
  FTokenID := tkString;
end;

procedure TSynIdlSyn.CharProc;
begin
  FTokenID := tkString;
  repeat
    if (FLine[Run] = '''') then
    begin
      Inc(Run);
      FRange := rsUnknown;
      Break;
    end;
    if not IsLineEnd(Run) then
      Inc(Run);
  until IsLineEnd(Run);
end;

procedure TSynIdlSyn.PreProcessorProc;

  function IsWhiteChar: Boolean;
  begin
    case FLine[Run] of
      #0, #9, #10, #13, #32:
        Result := True;
      else
        Result := False;
    end;
  end;

var
  Directive: String;
begin
  Directive := '';
  while not IsWhiteChar do
  begin
    Directive := Directive + FLine[Run];
    Inc(Run);
  end;
  if (WideCompareStr(Directive, '#include') = 0) then
    FTokenID := tkPreprocessor
  else if (WideCompareStr(Directive, '#pragma') = 0) then
    FTokenID := tkPreprocessor
  else
    FTokenID := tkIdentifier;
end; { PreProcessorProc }


constructor TSynIdlSyn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FCaseSensitive := True;

  FCommentAttri := TSynHighLighterAttributes.Create(SYNS_AttrComment, SYNS_FriendlyAttrComment);
  FCommentAttri.Style := [fsItalic];
  FCommentAttri.Foreground := clNavy;
  AddAttribute(FCommentAttri);

  FDatatypeAttri := TSynHighLighterAttributes.Create(SYNS_AttrDatatype, SYNS_FriendlyAttrDatatype);
  FDatatypeAttri.Style := [fsBold];
  FDatatypeAttri.Foreground := clTeal;
  AddAttribute(FDatatypeAttri);

  FIdentifierAttri := TSynHighLighterAttributes.Create(SYNS_AttrIdentifier, SYNS_FriendlyAttrIdentifier);
  AddAttribute(FIdentifierAttri);

  FKeyAttri := TSynHighLighterAttributes.Create(SYNS_AttrReservedWord, SYNS_FriendlyAttrReservedWord);
  FKeyAttri.Style := [fsBold];
  AddAttribute(FKeyAttri);

  FNumberAttri := TSynHighLighterAttributes.Create(SYNS_AttrNumber, SYNS_FriendlyAttrNumber);
  FNumberAttri.Foreground := clBlue;
  AddAttribute(FNumberAttri);

  FPreprocessorAttri := TSynHighLighterAttributes.Create(SYNS_AttrPreprocessor, SYNS_FriendlyAttrPreprocessor);
  FPreprocessorAttri.Foreground := clRed;
  AddAttribute(FPreprocessorAttri);

  FSpaceAttri := TSynHighLighterAttributes.Create(SYNS_AttrSpace, SYNS_FriendlyAttrSpace);
  AddAttribute(FSpaceAttri);

  FStringAttri := TSynHighLighterAttributes.Create(SYNS_AttrString, SYNS_FriendlyAttrString);
  FStringAttri.Foreground := clBlue;
  AddAttribute(FStringAttri);

  FSymbolAttri := TSynHighLighterAttributes.Create(SYNS_AttrSymbol, SYNS_FriendlyAttrSymbol);
  AddAttribute(FSymbolAttri);

  SetAttributesOnChange(DefHighlightChange);
  InitIdent;
  FDefaultFilter := SYNS_FilterCORBAIDL;
  FRange := rsUnknown;
end;

procedure TSynIdlSyn.IdentProc;
begin
  FTokenID := IdentKind((FLine + Run));
  Inc(Run, FStringLen);
  while IsIdentChar(FLine[Run]) do
    Inc(Run);
end;

procedure TSynIdlSyn.SymbolProc;
begin
  Inc(Run);
  FTokenID := tkSymbol;
end;

procedure TSynIdlSyn.UnknownProc;
begin
  Inc(Run);
  FTokenID := tkUnknown;
end;

procedure TSynIdlSyn.Next;
begin
  FTokenPos := Run;
  case FRange of
    rsComment: CommentProc;
  else
    begin
      FRange := rsUnknown;
      case FLine[Run] of
        #0: NullProc;
        #10: LFProc;
        #13: CRProc;
        '/': CommentOpenProc;
        '"': StringOpenProc;
        '''': CharOpenProc;
        '#': PreProcessorProc;
        #1..#9, #11, #12, #14..#32: SpaceProc;
        'A'..'Z', 'a'..'z', '_': IdentProc;
        '0'..'9': NumberProc;
        '-', '+', '*', '\', ',', '.', '[', ']', '{', '}', '<', '>', '(', ')',
        '=', '?', ':', ';' : SymbolProc;
      else
        UnknownProc;
      end;
    end;
  end;
  inherited;
end;

function TSynIdlSyn.GetDefaultAttribute(Index: Integer): TSynHighLighterAttributes;
begin
  case Index of
    SYN_ATTR_COMMENT: Result := FCommentAttri;
    SYN_ATTR_IDENTIFIER: Result := FIdentifierAttri;
    SYN_ATTR_KEYWORD: Result := FKeyAttri;
    SYN_ATTR_STRING: Result := FStringAttri;
    SYN_ATTR_WHITESPACE: Result := FSpaceAttri;
    SYN_ATTR_SYMBOL: Result := FSymbolAttri;
  else
    Result := nil;
  end;
end;

function TSynIdlSyn.GetEol: Boolean;
begin
  Result := Run = FLineLen + 1;
end;

function TSynIdlSyn.GetTokenID: TtkTokenKind;
begin
  Result := FTokenID;
end;

function TSynIdlSyn.GetTokenAttribute: TSynHighLighterAttributes;
begin
  case GetTokenID of
    tkComment: Result := FCommentAttri;
    tkDatatype: Result := FDatatypeAttri;
    tkIdentifier: Result := FIdentifierAttri;
    tkKey: Result := FKeyAttri;
    tkNumber: Result := FNumberAttri;
    tkPreprocessor: Result := FPreprocessorAttri;
    tkSpace: Result := FSpaceAttri;
    tkString: Result := FStringAttri;
    tkSymbol: Result := FSymbolAttri;
    tkUnknown: Result := FIdentifierAttri;
  else
    Result := nil;
  end;
end;

function TSynIdlSyn.GetTokenKind: Integer;
begin
  Result := Ord(FTokenID);
end;

function TSynIdlSyn.GetSampleSource: UnicodeString;
begin
  Result := '/* CORBA IDL sample source */'#13#10 +
            '#include <sample.idl>'#13#10 +
            #13#10 +
            'const string TestString = "Hello World";'#13#10 +
            'const long TestLong = 10;'#13#10 +
            #13#10 +
            'module TestModule {'#13#10 +
            '  interface DemoInterface {'#13#10 +
            '    boolean HelloWorld(in string Message);'#13#10 +
            '  }'#13#10 +
            '}';
end;

function TSynIdlSyn.IsFilterStored: Boolean;
begin
  Result := FDefaultFilter <> SYNS_FilterCORBAIDL;
end;

function TSynIdlSyn.IsIdentChar(AChar: WideChar): Boolean;
begin
  case AChar of
    '_', 'a'..'z', 'A'..'Z':
      Result := True;
    else
      Result := False;
  end;
end;

class function TSynIdlSyn.GetLanguageName: string;
begin
  Result := SYNS_LangCORBAIDL;
end;

procedure TSynIdlSyn.ResetRange;
begin
  FRange := rsUnknown;
end;

procedure TSynIdlSyn.SetRange(Value: Pointer);
begin
  FRange := TRangeState(Value);
end;

function TSynIdlSyn.GetRange: Pointer;
begin
  Result := Pointer(FRange);
end;

class function TSynIdlSyn.GetFriendlyLanguageName: UnicodeString;
begin
  Result := SYNS_FriendlyLangCORBAIDL;
end;

initialization
{$IFNDEF SYN_CPPB_1}
  RegisterPlaceableHighlighter(TSynIdlSyn);
{$ENDIF}
end.
