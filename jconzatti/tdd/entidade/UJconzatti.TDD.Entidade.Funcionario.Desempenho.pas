unit UJconzatti.TDD.Entidade.Funcionario.Desempenho;

interface

type
   TEntidadeFuncionarioDesempenho = (fdADesejar, fdBom, fdOtimo);

   TEntidadeFuncionarioDesempenhoHelper = record helper for TEntidadeFuncionarioDesempenho
   public
      function ObterPercentualDeReajuste: Double;
   end;

implementation

{ TEntidadeFuncionarioDesempenhoHelper }

function TEntidadeFuncionarioDesempenhoHelper.ObterPercentualDeReajuste: Double;
begin
   Result := 0;
   case Self of
      fdADesejar: Result := 0.03;
      fdBom:      Result := 0.15;
      fdOtimo:    Result := 0.20;
   end;
end;

end.
