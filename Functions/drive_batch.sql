-- FUNCTION: public.driver_batch()

-- DROP FUNCTION public.driver_batch();

CREATE OR REPLACE FUNCTION public.driver_batch(
	)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
Begin
Perform assert_subclass_triple();
Perform assert_subprop_triple();
Perform infer_spo_triple_given_subprop();
Perform assert_spo_triple();
Perform infer_spo_triple_given_spo();
Perform infer_type_triple_given_spo();
Perform infer_type_triple_given_subclass_assertion();
Perform assert_type_triple(); 
end;
$BODY$;

ALTER FUNCTION public.driver_batch()
    OWNER TO postgres;

