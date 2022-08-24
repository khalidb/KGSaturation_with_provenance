-- FUNCTION: public.assert_subprop_triple()

-- DROP FUNCTION public.assert_subprop_triple();

CREATE OR REPLACE FUNCTION public.assert_subprop_triple(
	)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
Begin
Insert into inferred_subprop_triple (
(select * from batch_subprop_triple)
Union
(Select b.s, b.p, c.o, sort(b.provset || c.provset) from batch_subprop_triple b, current_subprop_triple c where b.o = c.s)
Union
(Select c.s, c.p, b.o, sort(c.provset || b.provset) from current_subprop_triple c, batch_subprop_triple b where c.o = b.s)
) ;

end;
$BODY$;

ALTER FUNCTION public.assert_subprop_triple()
    OWNER TO postgres;

