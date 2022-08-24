-- FUNCTION: public.assert_type_triple()

-- DROP FUNCTION public.assert_type_triple();

CREATE OR REPLACE FUNCTION public.assert_type_triple(
	)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
Declare
    TYPETRIPLE int := 27826905;
Begin

Insert into inferred_type_triple (
(select * from batch_type_triple) 
union
(select b.s, TYPETRIPLE, c.o,   sort(b.provset || c.provset)   from batch_type_triple b, (select * from ((select * from current_subclass_triple) union (select * from inferred_subclass_triple)) temp) c where (b.o = c.s)) 
);

end;
$BODY$;

ALTER FUNCTION public.assert_type_triple()
    OWNER TO postgres;

