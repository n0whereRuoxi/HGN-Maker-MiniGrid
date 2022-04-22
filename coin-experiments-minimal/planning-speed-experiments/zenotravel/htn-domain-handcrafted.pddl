( define ( domain zeno-travel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft person city flevel )

  ( :predicates
    ( person-at ?x - person ?c - city )
    ( aircraft-at ?y - aircraft ?c - city )
    ( in ?p - person ?a - aircraft )
    ( fuel-level ?a - aircraft ?l - flevel )
    ( next ?l1 - flevel ?l2 - flevel )
  )

  ( :action !Board
    :parameters ( ?p - person ?a - aircraft ?c - city )
    :precondition ( and ( person-at ?p ?c ) ( aircraft-at ?a ?c ) )
    :effect ( and ( not ( person-at ?p ?c ) )  ( in ?p ?a ) )
  )

  ( :action !Debark
    :parameters ( ?p - person ?a - aircraft ?c - city )
    :precondition ( and ( in ?p ?a ) ( aircraft-at ?a ?c ) )
    :effect ( and ( not ( in ?p ?a ) ) ( person-at ?p ?c ) )
  )

  ( :action !Fly
    :parameters ( ?a - aircraft ?c1 - city ?c2 - city 
                  ?l1 - flevel ?l2 - flevel )
    :precondition ( and ( aircraft-at ?a ?c1 ) ( fuel-level ?a ?l1 )
                        ( next ?l2 ?l1 ) )
    :effect ( and ( not ( aircraft-at ?a ?c1 ) ) ( aircraft-at ?a ?c2 )
                  ( not ( fuel-level ?a ?l1 ) ) ( fuel-level ?a ?l2 ) )
  )

  ( :action !Zoom
    :parameters ( ?a - aircraft ?c1 - city ?c2 - city ?l1 - flevel
                  ?l2 - flevel ?l3 - flevel )
    :precondition ( and ( aircraft-at ?a ?c1 ) ( fuel-level ?a ?l1 )
                        ( next ?l2 ?l1 ) ( next ?l3 ?l2 ) )
    :effect ( and ( not ( aircraft-at ?a ?c1 ) ) ( aircraft-at ?a ?c2 )
                  ( not ( fuel-level ?a ?l1 ) ) ( fuel-level ?a ?l3 ) )
  )

  ( :action !Refuel
    :parameters ( ?a - aircraft ?c - city ?l - flevel ?l1 - flevel )
    :precondition ( and ( fuel-level ?a ?l ) ( next ?l ?l1 )
                        ( aircraft-at ?a ?c ) )
    :effect ( and ( fuel-level ?a ?l1 ) ( not ( fuel-level ?a ?l ) ) )
  )

  ( :method Travel
    :parameters ( ?p - person ?c - city )
    :precondition ( and ( person-at ?p ?c ) )
    :subtasks ()
  )

  ( :method Travel
    :parameters ( ?p - person ?c - city )
    :vars ( ?a - aircraft )
    :precondition ( and ( in ?p ?a ) ( aircraft-at ?a ?c ) )
    :subtasks ( ( !Debark ?p ?a ?c ) )
  )

  ( :method Travel
    :parameters ( ?p - person ?c - city )
    :vars ( ?a - aircraft ?l1 - flevel ?l2 - flevel ?c2 - city )
    :precondition ( and ( in ?p ?a ) ( aircraft-at ?a ?c2 )
                        ( fuel-level ?a ?l1 ) ( next ?l2 ?l1 ) )
    :subtasks ( ( !Fly ?a ?c2 ?c ?l1 ?l2 ) ( Travel ?p ?c ) )
  )

  ( :method Travel
    :parameters ( ?p - person ?c - city )
    :vars ( ?a - aircraft ?l1 - flevel ?l2 - flevel ?c2 - city )
    :precondition ( and ( in ?p ?a ) ( aircraft-at ?a ?c2 )
                        ( fuel-level ?a ?l1 ) ( next ?l1 ?l2 ) )
    :subtasks ( ( !Refuel ?a ?c2 ?l1 ?l2 ) ( Travel ?p ?c ) )
  )

  ( :method Travel
    :parameters ( ?p - person ?c - city )
    :vars ( ?a - aircraft ?c2 - city )
    :precondition ( and ( aircraft-at ?a ?c2 ) ( person-at ?p ?c2 ) )
    :subtasks ( ( !Board ?p ?a ?c2 ) ( Travel ?p ?c ) )
  )

  ( :method Travel
    :parameters ( ?p - person ?c - city )
    :vars ( ?a - aircraft ?c2 - city ?c3 - city ?l1 - flevel ?l2 - flevel )
    :precondition ( and ( aircraft-at ?a ?c3 ) ( person-at ?p ?c2 )
                        ( fuel-level ?a ?l1 ) ( next ?l2 ?l1 ) )
    :subtasks ( ( !Fly ?a ?c3 ?c2 ?l1 ?l2 ) ( Travel ?p ?c ) )
  )

  ( :method Travel
    :parameters ( ?p - person ?c - city )
    :vars ( ?a - aircraft ?c3 - city ?l1 - flevel ?l2 - flevel )
    :precondition ( and ( aircraft-at ?a ?c3 ) ( fuel-level ?a ?l1 )
                        ( next ?l1 ?l2 ) )
    :subtasks ( ( !Refuel ?a ?c3 ?l1 ?l2 ) ( Travel ?p ?c ) )
  )

)
