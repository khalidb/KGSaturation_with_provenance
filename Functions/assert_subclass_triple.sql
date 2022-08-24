-- FUNCTION: public.assert_subclass_triple()

-- DROP FUNCTION public.assert_subclass_triple();

CREATE OR REPLACE FUNCTION public.assert_subclass_triple(
	)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
Begin

-- This function assumes that the subclasses do not collide in the batch

Insert into inferred_subclass_triple (
(select * from batch_subclass_triple)
Union
(Select b.s, b.p, c.o, sort(b.provset || c.provset) from batch_subclass_triple b, current_subclass_triple c where b.o = c.s)
Union
(Select c.s, c.p, b.o, sort(c.provset || b.provset) from current_subclass_triple c, batch_subclass_triple b where c.o = b.s)
) ;

End;
$BODY$;

ALTER FUNCTION public.assert_subclass_triple()
    OWNER TO postgres;

