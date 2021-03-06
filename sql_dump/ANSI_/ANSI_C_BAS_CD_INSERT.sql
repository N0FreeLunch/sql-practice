-- ************************************************
-- PART I - 1.2.2 SQL10
-- ************************************************
	-- 기준코드 데이터 생성
	INSERT INTO C_BAS_CD (BAS_CD_DV ,LNG_CD ,BAS_CD ,BAS_CD_NM ,SRT_OD)
	SELECT  'LNG_CD' BAS_CD_DV ,'KO' LNG_CD ,'KO' BAS_CD ,'한국어' BAS_CD_NM ,10 SRT_OD FROM DUAL UNION ALL        
	SELECT  'LNG_CD' ,'KO' ,'EN' ,'영어' ,20 FROM DUAL UNION ALL        
	SELECT  'LNG_CD' ,'KO' ,'CN' ,'중국어' ,30 FROM DUAL UNION ALL    
	SELECT  'ITM_TP' ,'KO' ,'ELEC' ,'가전제품' ,10 FROM DUAL UNION ALL
	SELECT  'ITM_TP' ,'KO' ,'PC' ,'컴퓨터' ,20 FROM DUAL UNION ALL
	SELECT  'ITM_TP' ,'KO' ,'COOK' ,'주방도구' ,30 FROM DUAL UNION ALL
	SELECT  'ITM_TP' ,'KO' ,'CLOTHES' ,'옷' ,40 FROM DUAL UNION ALL
	SELECT  'ORD_ST' ,'KO' ,'WAIT' ,'대기' ,10 FROM DUAL UNION ALL
	SELECT  'ORD_ST' ,'KO' ,'COMP' ,'완료' ,20 FROM DUAL UNION ALL
	SELECT  'PAY_TP' ,'KO' ,'BANK' ,'계좌이체' ,10 FROM DUAL UNION ALL
	SELECT  'PAY_TP' ,'KO' ,'CARD' ,'카드' ,20 FROM DUAL UNION ALL
	SELECT  'GND_TP' ,'KO' ,'FEMLE' ,'여성' ,10 FROM DUAL UNION ALL
	SELECT  'GND_TP' ,'KO' ,'MALE' ,'남성' ,20 FROM DUAL UNION ALL
	SELECT  'CUS_GD' ,'KO' ,'A' ,'A' ,10 FROM DUAL UNION ALL
	SELECT  'CUS_GD' ,'KO' ,'B' ,'B' ,20 FROM DUAL;
	COMMIT;