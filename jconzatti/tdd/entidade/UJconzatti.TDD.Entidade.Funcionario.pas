unit UJconzatti.TDD.Entidade.Funcionario;

interface

type
   TEntidadeFuncionario = class
   private
      FNome: String;
      FDataAdmissao: TDate;
      FSalario: Currency;
   public
      constructor Create(aNome : String; aDataAdmissao : TDate; aSalario : Currency); reintroduce;
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

end.
