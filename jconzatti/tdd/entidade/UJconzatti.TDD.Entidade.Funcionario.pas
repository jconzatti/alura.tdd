unit UJconzatti.TDD.Entidade.Funcionario;

interface

uses
   System.Math;

type
   TEntidadeFuncionario = class
   private
      FNome: String;
      FDataAdmissao: TDate;
      FSalario: Currency;
      procedure ArredondarSalario;
   public
      constructor Create(aNome : String; aDataAdmissao : TDate; aSalario : Currency); reintroduce;
      procedure ReajustarSalario(ValReajusteSalarial : Double);
      property Nome: String read FNome;
      property DataAdmissao: TDate read FDataAdmissao;
      property Salario: Currency read FSalario;
   end;

implementation

{ TEntidadeFuncionario }

constructor TEntidadeFuncionario.Create(aNome: String; aDataAdmissao: TDate;
  aSalario: Currency);
begin
   FNome         := aNome;
   FDataAdmissao := aDataAdmissao;
   FSalario      := aSalario;
end;

procedure TEntidadeFuncionario.ReajustarSalario(ValReajusteSalarial: Double);
begin
   FSalario := FSalario + ValReajusteSalarial;
   ArredondarSalario;
end;

procedure TEntidadeFuncionario.ArredondarSalario;
begin
   FSalario := RoundTo(FSalario, -2);
end;

end.
