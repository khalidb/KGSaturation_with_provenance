-- FUNCTION: public.assert_subclass_triple_with_collision()

-- DROP FUNCTION public.assert_subclass_triple_with_collision();

CREATE OR REPLACE FUNCTION public.assert_subclass_triple_with_collision(
	)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
Begin

-- This function assumes that the subclasses in the batch may collide

Insert into inferred_subclass_triple (
(select * from batch_subclass_triple)
Union
(Select b.s, b.p, c.o, sort(b.provset || c.provset) from batch_subclass_triple b, current_subclass_triple c where b.o = c.s)
Union
(Select c.s, c.p, b.o, sort(c.provset || b.provset) from current_subclass_triple c, batch_subclass_triple b where c.o = b.s)
) ;

Loop

Insert into inferred_subclass_triple (
Select i1.s, i1.p, i2.o, sort(i1.provset || i2.provset)  from inferred_subclass_triple i1, inferred_subclass_triple i2 where i1.o = i2.s
) ON CONFLICT DO NOTHING;

Exit when Found = False;   

End Loop;

End;
$BODY$;

ALTER FUNCTION public.assert_subclass_triple_with_collision()
    OWNER TO postgres;

