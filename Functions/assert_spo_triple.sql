-- FUNCTION: public.assert_spo_triple()

-- DROP FUNCTION public.assert_spo_triple();

CREATE OR REPLACE FUNCTION public.assert_spo_triple(
	)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
Begin

insert into inferred_spo_triple (
(select * from batch_spo_triple) 
union 
(select b.s, c.p, b.o, sort(b.provset || c.provset)  from  batch_spo_triple b,   (select * from ((select * from current_subprop_triple) union (select * from inferred_subprop_triple)) temp) c where (b.p = c.s))
);

end;
$BODY$;

ALTER FUNCTION public.assert_spo_triple()
    OWNER TO postgres;

