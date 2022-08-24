-- FUNCTION: public.assert_subprop_triple_with_collision()

-- DROP FUNCTION public.assert_subprop_triple_with_collision();

CREATE OR REPLACE FUNCTION public.assert_subprop_triple_with_collision(
	)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
Begin

--- with collision

Insert into inferred_subprop_triple (
(select * from batch_subprop_triple)
Union
(Select b.s, b.p, c.o, sort(b.provset || c.provset) from batch_subprop_triple b, current_subprop_triple c where b.o = c.s)
Union
(Select c.s, c.p, b.o, sort(c.provset || b.provset) from current_subprop_triple c, batch_subprop_triple b where c.o = b.s)
) ;

Loop

Insert into inferred_subprop_triple (
Select i1.s, i1.p, i2.o, sort(i1.provset || i2.provset)  from inferred_subprop_triple i1, inferred_subprop_triple i2 where i1.o = i2.s
) ON CONFLICT DO NOTHING;

Exit when Found = False;   

End Loop;

end;
$BODY$;

ALTER FUNCTION public.assert_subprop_triple_with_collision()
    OWNER TO postgres;

