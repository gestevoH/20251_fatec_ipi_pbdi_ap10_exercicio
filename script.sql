-- 1.5  Resolva cada exercício a seguir usando LOOP, WHILE, FOR e FOREACH. Quando o
-- enunciado disser que é preciso “ler” algum valor, gere-o aleatoriamente. 
-- Gerar inteiros no intervalo de -50 a 50.
-- https://www.beecrowd.com.br/judge/pt/problems/view/1060
-- Gerar inteiros no intervalo de 20 a 50.
-- https://www.beecrowd.com.br/judge/pt/problems/view/1071
-- Gerar inteiros no intervalo de 20 a 50.
-- https://www.beecrowd.com.br/judge/pt/problems/view/1071
-- Gerar inteiros no intervalo de 1 a 100.
-- https://www.beecrowd.com.br/judge/pt/problems/view/1101

-- CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
-- INT) RETURNS INT AS
-- $$
-- BEGIN
-- RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
-- END;
-- $$ LANGUAGE plpgsql;

-- Gerar Valores inteiros de -50 a 50 -- 

-- -- Com FOR
-- DO $$
-- DECLARE
--     v_valor INT;
--     contador INT := 0;
-- BEGIN
--     FOR i IN 1..6 LOOP
--         v_valor := valor_aleatorio_entre(-50, 50);
--         RAISE NOTICE 'Valor da vez: %', v_valor;
--         IF v_valor > 0 THEN
--             contador := contador + 1;
--         END IF;
--     END LOOP;
--     RAISE NOTICE 'Positivos: %', contador;
-- END;
-- $$;

-- -- Com FOREACH
-- DO $$
-- DECLARE
-- 	v_valores INT[] := ARRAY[
-- 	valor_aleatorio_entre(-50, 50),
-- 	valor_aleatorio_entre(-50, 50),
-- 	valor_aleatorio_entre(-50, 50),
-- 	valor_aleatorio_entre(-50, 50),
-- 	valor_aleatorio_entre(-50, 50),
-- 	valor_aleatorio_entre(-50, 50)
-- 	];
-- 	v_valor INT;
-- 	contador INT := 0;
-- BEGIN
-- 	FOREACH v_valor IN ARRAY v_valores LOOP
-- 		RAISE NOTICE 'Valor da vez: %', v_valor;
-- 		IF v_valor > 0 THEN
-- 			contador := contador + 1;
-- 		END IF;
-- 	END LOOP;
-- 	RAISE NOTICE 'Positivos: %', contador;
-- END;
-- $$

-- -- Com LOOP
-- DO $$
-- DECLARE
-- 	v_valor INT;
-- 	contador INT := 0;
-- 	i INT := 1;
-- BEGIN
-- 	LOOP
-- 		EXIT WHEN i > 6;
-- 		v_valor := valor_aleatorio_entre(-50, 50);
-- 		RAISE NOTICE 'Valor da vez: %', v_valor;
-- 		IF v_valor > 0 THEN
-- 			contador := contador + 1;
-- 		END IF;
-- 		i := i + 1;
-- 	END LOOP;
-- 	RAISE NOTICE 'Positivos: %', contador;
-- END;
-- $$

-- -- Com WHILE
-- DO $$
-- DECLARE
-- 	v_valor INT;
-- 	contador INT := 0;
-- 	i INT := 1;
-- BEGIN
-- 	WHILE i<= 6 LOOP
-- 		v_valor := valor_aleatorio_entre(-50, 50);
-- 		RAISE NOTICE 'Valor da vez: %', v_valor;
-- 		IF v_valor > 0 THEN
-- 			contador := contador + 1;
-- 		END IF;
-- 		i := i + 1;
-- 	END LOOP;
-- 	RAISE NOTICE 'Positivos: %', contador;
-- END;
-- $$
-------------------------------------------------------------------------------------------------------------------------------------------------
-- Gerar Valores Inteiros de 20 a 50 --




-------------------------------------------------------------------------------------------------------------------------------------------------
-- 1.2 Faça um programa que calcule o determinante de uma matriz quadrada de ordem 3
-- utilizando a regra de Sarrus. Veja a regra aqui:
-- https://en.wikipedia.org/wiki/Rule_of_Sarrus
-- Preencha a matriz com valores inteiros aleatórios no intervalo de 1 a 12.

DO $$
DECLARE
    matriz INT[3][3] := ARRAY[
        [valor_aleatorio_entre(1, 12), valor_aleatorio_entre(1, 12), valor_aleatorio_entre(1, 12)],
        [valor_aleatorio_entre(1, 12), valor_aleatorio_entre(1, 12), valor_aleatorio_entre(1, 12)],
        [valor_aleatorio_entre(1, 12), valor_aleatorio_entre(1, 12), valor_aleatorio_entre(1, 12)]
    ];
    linha INT[];
    determinante INT := 0;
    i INT := 1;
BEGIN
    -- Exibir matriz com FOREACH
    RAISE NOTICE 'Matriz:';
    FOREACH linha SLICE 1 IN ARRAY matriz LOOP
        RAISE NOTICE '| % % % |', linha[1], linha[2], linha[3];
    END LOOP;

    -- Cálculo da Regra de Sarrus diretamente
    determinante :=
          matriz[1][1] * matriz[2][2] * matriz[3][3]
        + matriz[1][2] * matriz[2][3] * matriz[3][1]
        + matriz[1][3] * matriz[2][1] * matriz[3][2]
        - matriz[1][3] * matriz[2][2] * matriz[3][1]
        - matriz[1][2] * matriz[2][1] * matriz[3][3]
        - matriz[1][1] * matriz[2][3] * matriz[3][2];

    -- Mostrar resultado
    RAISE NOTICE 'Determinante: %', determinante;
END;
$$
