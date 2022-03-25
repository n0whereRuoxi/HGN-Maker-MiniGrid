( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16166 - OBJ
      ?auto_16165 - LOCATION
    )
    :vars
    (
      ?auto_16168 - LOCATION
      ?auto_16169 - CITY
      ?auto_16167 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16168 ?auto_16169 ) ( IN-CITY ?auto_16165 ?auto_16169 ) ( not ( = ?auto_16165 ?auto_16168 ) ) ( OBJ-AT ?auto_16166 ?auto_16168 ) ( TRUCK-AT ?auto_16167 ?auto_16165 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16167 ?auto_16165 ?auto_16168 ?auto_16169 )
      ( !LOAD-TRUCK ?auto_16166 ?auto_16167 ?auto_16168 )
      ( !DRIVE-TRUCK ?auto_16167 ?auto_16168 ?auto_16165 ?auto_16169 )
      ( !UNLOAD-TRUCK ?auto_16166 ?auto_16167 ?auto_16165 )
      ( DELIVER-1PKG-VERIFY ?auto_16166 ?auto_16165 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16187 - OBJ
      ?auto_16188 - OBJ
      ?auto_16186 - LOCATION
    )
    :vars
    (
      ?auto_16190 - LOCATION
      ?auto_16191 - CITY
      ?auto_16192 - LOCATION
      ?auto_16189 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16190 ?auto_16191 ) ( IN-CITY ?auto_16186 ?auto_16191 ) ( not ( = ?auto_16186 ?auto_16190 ) ) ( OBJ-AT ?auto_16188 ?auto_16190 ) ( IN-CITY ?auto_16192 ?auto_16191 ) ( not ( = ?auto_16186 ?auto_16192 ) ) ( OBJ-AT ?auto_16187 ?auto_16192 ) ( TRUCK-AT ?auto_16189 ?auto_16186 ) ( not ( = ?auto_16187 ?auto_16188 ) ) ( not ( = ?auto_16190 ?auto_16192 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16187 ?auto_16186 )
      ( DELIVER-1PKG ?auto_16188 ?auto_16186 )
      ( DELIVER-2PKG-VERIFY ?auto_16187 ?auto_16188 ?auto_16186 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16298 - OBJ
      ?auto_16299 - OBJ
      ?auto_16300 - OBJ
      ?auto_16297 - LOCATION
    )
    :vars
    (
      ?auto_16302 - LOCATION
      ?auto_16301 - CITY
      ?auto_16304 - LOCATION
      ?auto_16305 - LOCATION
      ?auto_16303 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16302 ?auto_16301 ) ( IN-CITY ?auto_16297 ?auto_16301 ) ( not ( = ?auto_16297 ?auto_16302 ) ) ( OBJ-AT ?auto_16300 ?auto_16302 ) ( IN-CITY ?auto_16304 ?auto_16301 ) ( not ( = ?auto_16297 ?auto_16304 ) ) ( OBJ-AT ?auto_16299 ?auto_16304 ) ( IN-CITY ?auto_16305 ?auto_16301 ) ( not ( = ?auto_16297 ?auto_16305 ) ) ( OBJ-AT ?auto_16298 ?auto_16305 ) ( TRUCK-AT ?auto_16303 ?auto_16297 ) ( not ( = ?auto_16298 ?auto_16299 ) ) ( not ( = ?auto_16304 ?auto_16305 ) ) ( not ( = ?auto_16298 ?auto_16300 ) ) ( not ( = ?auto_16299 ?auto_16300 ) ) ( not ( = ?auto_16302 ?auto_16304 ) ) ( not ( = ?auto_16302 ?auto_16305 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16298 ?auto_16299 ?auto_16297 )
      ( DELIVER-1PKG ?auto_16300 ?auto_16297 )
      ( DELIVER-3PKG-VERIFY ?auto_16298 ?auto_16299 ?auto_16300 ?auto_16297 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17432 - OBJ
      ?auto_17433 - OBJ
      ?auto_17434 - OBJ
      ?auto_17435 - OBJ
      ?auto_17431 - LOCATION
    )
    :vars
    (
      ?auto_17438 - LOCATION
      ?auto_17437 - CITY
      ?auto_17439 - LOCATION
      ?auto_17440 - LOCATION
      ?auto_17436 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17438 ?auto_17437 ) ( IN-CITY ?auto_17431 ?auto_17437 ) ( not ( = ?auto_17431 ?auto_17438 ) ) ( OBJ-AT ?auto_17435 ?auto_17438 ) ( OBJ-AT ?auto_17434 ?auto_17438 ) ( IN-CITY ?auto_17439 ?auto_17437 ) ( not ( = ?auto_17431 ?auto_17439 ) ) ( OBJ-AT ?auto_17433 ?auto_17439 ) ( IN-CITY ?auto_17440 ?auto_17437 ) ( not ( = ?auto_17431 ?auto_17440 ) ) ( OBJ-AT ?auto_17432 ?auto_17440 ) ( TRUCK-AT ?auto_17436 ?auto_17431 ) ( not ( = ?auto_17432 ?auto_17433 ) ) ( not ( = ?auto_17439 ?auto_17440 ) ) ( not ( = ?auto_17432 ?auto_17434 ) ) ( not ( = ?auto_17433 ?auto_17434 ) ) ( not ( = ?auto_17438 ?auto_17439 ) ) ( not ( = ?auto_17438 ?auto_17440 ) ) ( not ( = ?auto_17432 ?auto_17435 ) ) ( not ( = ?auto_17433 ?auto_17435 ) ) ( not ( = ?auto_17434 ?auto_17435 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_17432 ?auto_17433 ?auto_17434 ?auto_17431 )
      ( DELIVER-1PKG ?auto_17435 ?auto_17431 )
      ( DELIVER-4PKG-VERIFY ?auto_17432 ?auto_17433 ?auto_17434 ?auto_17435 ?auto_17431 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17491 - OBJ
      ?auto_17492 - OBJ
      ?auto_17493 - OBJ
      ?auto_17494 - OBJ
      ?auto_17490 - LOCATION
    )
    :vars
    (
      ?auto_17495 - LOCATION
      ?auto_17497 - CITY
      ?auto_17498 - LOCATION
      ?auto_17499 - LOCATION
      ?auto_17496 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17495 ?auto_17497 ) ( IN-CITY ?auto_17490 ?auto_17497 ) ( not ( = ?auto_17490 ?auto_17495 ) ) ( OBJ-AT ?auto_17494 ?auto_17495 ) ( OBJ-AT ?auto_17492 ?auto_17495 ) ( IN-CITY ?auto_17498 ?auto_17497 ) ( not ( = ?auto_17490 ?auto_17498 ) ) ( OBJ-AT ?auto_17493 ?auto_17498 ) ( IN-CITY ?auto_17499 ?auto_17497 ) ( not ( = ?auto_17490 ?auto_17499 ) ) ( OBJ-AT ?auto_17491 ?auto_17499 ) ( TRUCK-AT ?auto_17496 ?auto_17490 ) ( not ( = ?auto_17491 ?auto_17493 ) ) ( not ( = ?auto_17498 ?auto_17499 ) ) ( not ( = ?auto_17491 ?auto_17492 ) ) ( not ( = ?auto_17493 ?auto_17492 ) ) ( not ( = ?auto_17495 ?auto_17498 ) ) ( not ( = ?auto_17495 ?auto_17499 ) ) ( not ( = ?auto_17491 ?auto_17494 ) ) ( not ( = ?auto_17493 ?auto_17494 ) ) ( not ( = ?auto_17492 ?auto_17494 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_17491 ?auto_17493 ?auto_17492 ?auto_17494 ?auto_17490 )
      ( DELIVER-4PKG-VERIFY ?auto_17491 ?auto_17492 ?auto_17493 ?auto_17494 ?auto_17490 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17523 - OBJ
      ?auto_17524 - OBJ
      ?auto_17525 - OBJ
      ?auto_17526 - OBJ
      ?auto_17522 - LOCATION
    )
    :vars
    (
      ?auto_17528 - LOCATION
      ?auto_17530 - CITY
      ?auto_17527 - LOCATION
      ?auto_17529 - LOCATION
      ?auto_17531 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17528 ?auto_17530 ) ( IN-CITY ?auto_17522 ?auto_17530 ) ( not ( = ?auto_17522 ?auto_17528 ) ) ( OBJ-AT ?auto_17525 ?auto_17528 ) ( OBJ-AT ?auto_17524 ?auto_17528 ) ( IN-CITY ?auto_17527 ?auto_17530 ) ( not ( = ?auto_17522 ?auto_17527 ) ) ( OBJ-AT ?auto_17526 ?auto_17527 ) ( IN-CITY ?auto_17529 ?auto_17530 ) ( not ( = ?auto_17522 ?auto_17529 ) ) ( OBJ-AT ?auto_17523 ?auto_17529 ) ( TRUCK-AT ?auto_17531 ?auto_17522 ) ( not ( = ?auto_17523 ?auto_17526 ) ) ( not ( = ?auto_17527 ?auto_17529 ) ) ( not ( = ?auto_17523 ?auto_17524 ) ) ( not ( = ?auto_17526 ?auto_17524 ) ) ( not ( = ?auto_17528 ?auto_17527 ) ) ( not ( = ?auto_17528 ?auto_17529 ) ) ( not ( = ?auto_17523 ?auto_17525 ) ) ( not ( = ?auto_17526 ?auto_17525 ) ) ( not ( = ?auto_17524 ?auto_17525 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_17523 ?auto_17524 ?auto_17526 ?auto_17525 ?auto_17522 )
      ( DELIVER-4PKG-VERIFY ?auto_17523 ?auto_17524 ?auto_17525 ?auto_17526 ?auto_17522 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18112 - OBJ
      ?auto_18113 - OBJ
      ?auto_18114 - OBJ
      ?auto_18115 - OBJ
      ?auto_18111 - LOCATION
    )
    :vars
    (
      ?auto_18117 - LOCATION
      ?auto_18119 - CITY
      ?auto_18116 - LOCATION
      ?auto_18118 - LOCATION
      ?auto_18120 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18117 ?auto_18119 ) ( IN-CITY ?auto_18111 ?auto_18119 ) ( not ( = ?auto_18111 ?auto_18117 ) ) ( OBJ-AT ?auto_18115 ?auto_18117 ) ( OBJ-AT ?auto_18112 ?auto_18117 ) ( IN-CITY ?auto_18116 ?auto_18119 ) ( not ( = ?auto_18111 ?auto_18116 ) ) ( OBJ-AT ?auto_18114 ?auto_18116 ) ( IN-CITY ?auto_18118 ?auto_18119 ) ( not ( = ?auto_18111 ?auto_18118 ) ) ( OBJ-AT ?auto_18113 ?auto_18118 ) ( TRUCK-AT ?auto_18120 ?auto_18111 ) ( not ( = ?auto_18113 ?auto_18114 ) ) ( not ( = ?auto_18116 ?auto_18118 ) ) ( not ( = ?auto_18113 ?auto_18112 ) ) ( not ( = ?auto_18114 ?auto_18112 ) ) ( not ( = ?auto_18117 ?auto_18116 ) ) ( not ( = ?auto_18117 ?auto_18118 ) ) ( not ( = ?auto_18113 ?auto_18115 ) ) ( not ( = ?auto_18114 ?auto_18115 ) ) ( not ( = ?auto_18112 ?auto_18115 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18113 ?auto_18112 ?auto_18114 ?auto_18115 ?auto_18111 )
      ( DELIVER-4PKG-VERIFY ?auto_18112 ?auto_18113 ?auto_18114 ?auto_18115 ?auto_18111 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18144 - OBJ
      ?auto_18145 - OBJ
      ?auto_18146 - OBJ
      ?auto_18147 - OBJ
      ?auto_18143 - LOCATION
    )
    :vars
    (
      ?auto_18149 - LOCATION
      ?auto_18151 - CITY
      ?auto_18148 - LOCATION
      ?auto_18150 - LOCATION
      ?auto_18152 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18149 ?auto_18151 ) ( IN-CITY ?auto_18143 ?auto_18151 ) ( not ( = ?auto_18143 ?auto_18149 ) ) ( OBJ-AT ?auto_18146 ?auto_18149 ) ( OBJ-AT ?auto_18144 ?auto_18149 ) ( IN-CITY ?auto_18148 ?auto_18151 ) ( not ( = ?auto_18143 ?auto_18148 ) ) ( OBJ-AT ?auto_18147 ?auto_18148 ) ( IN-CITY ?auto_18150 ?auto_18151 ) ( not ( = ?auto_18143 ?auto_18150 ) ) ( OBJ-AT ?auto_18145 ?auto_18150 ) ( TRUCK-AT ?auto_18152 ?auto_18143 ) ( not ( = ?auto_18145 ?auto_18147 ) ) ( not ( = ?auto_18148 ?auto_18150 ) ) ( not ( = ?auto_18145 ?auto_18144 ) ) ( not ( = ?auto_18147 ?auto_18144 ) ) ( not ( = ?auto_18149 ?auto_18148 ) ) ( not ( = ?auto_18149 ?auto_18150 ) ) ( not ( = ?auto_18145 ?auto_18146 ) ) ( not ( = ?auto_18147 ?auto_18146 ) ) ( not ( = ?auto_18144 ?auto_18146 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18145 ?auto_18144 ?auto_18147 ?auto_18146 ?auto_18143 )
      ( DELIVER-4PKG-VERIFY ?auto_18144 ?auto_18145 ?auto_18146 ?auto_18147 ?auto_18143 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18332 - OBJ
      ?auto_18333 - OBJ
      ?auto_18334 - OBJ
      ?auto_18335 - OBJ
      ?auto_18331 - LOCATION
    )
    :vars
    (
      ?auto_18337 - LOCATION
      ?auto_18339 - CITY
      ?auto_18336 - LOCATION
      ?auto_18338 - LOCATION
      ?auto_18340 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18337 ?auto_18339 ) ( IN-CITY ?auto_18331 ?auto_18339 ) ( not ( = ?auto_18331 ?auto_18337 ) ) ( OBJ-AT ?auto_18333 ?auto_18337 ) ( OBJ-AT ?auto_18332 ?auto_18337 ) ( IN-CITY ?auto_18336 ?auto_18339 ) ( not ( = ?auto_18331 ?auto_18336 ) ) ( OBJ-AT ?auto_18335 ?auto_18336 ) ( IN-CITY ?auto_18338 ?auto_18339 ) ( not ( = ?auto_18331 ?auto_18338 ) ) ( OBJ-AT ?auto_18334 ?auto_18338 ) ( TRUCK-AT ?auto_18340 ?auto_18331 ) ( not ( = ?auto_18334 ?auto_18335 ) ) ( not ( = ?auto_18336 ?auto_18338 ) ) ( not ( = ?auto_18334 ?auto_18332 ) ) ( not ( = ?auto_18335 ?auto_18332 ) ) ( not ( = ?auto_18337 ?auto_18336 ) ) ( not ( = ?auto_18337 ?auto_18338 ) ) ( not ( = ?auto_18334 ?auto_18333 ) ) ( not ( = ?auto_18335 ?auto_18333 ) ) ( not ( = ?auto_18332 ?auto_18333 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18334 ?auto_18332 ?auto_18335 ?auto_18333 ?auto_18331 )
      ( DELIVER-4PKG-VERIFY ?auto_18332 ?auto_18333 ?auto_18334 ?auto_18335 ?auto_18331 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_32842 - OBJ
      ?auto_32843 - OBJ
      ?auto_32844 - OBJ
      ?auto_32845 - OBJ
      ?auto_32846 - OBJ
      ?auto_32841 - LOCATION
    )
    :vars
    (
      ?auto_32848 - LOCATION
      ?auto_32849 - CITY
      ?auto_32850 - LOCATION
      ?auto_32851 - LOCATION
      ?auto_32847 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_32848 ?auto_32849 ) ( IN-CITY ?auto_32841 ?auto_32849 ) ( not ( = ?auto_32841 ?auto_32848 ) ) ( OBJ-AT ?auto_32846 ?auto_32848 ) ( OBJ-AT ?auto_32845 ?auto_32848 ) ( OBJ-AT ?auto_32844 ?auto_32848 ) ( IN-CITY ?auto_32850 ?auto_32849 ) ( not ( = ?auto_32841 ?auto_32850 ) ) ( OBJ-AT ?auto_32843 ?auto_32850 ) ( IN-CITY ?auto_32851 ?auto_32849 ) ( not ( = ?auto_32841 ?auto_32851 ) ) ( OBJ-AT ?auto_32842 ?auto_32851 ) ( TRUCK-AT ?auto_32847 ?auto_32841 ) ( not ( = ?auto_32842 ?auto_32843 ) ) ( not ( = ?auto_32850 ?auto_32851 ) ) ( not ( = ?auto_32842 ?auto_32844 ) ) ( not ( = ?auto_32843 ?auto_32844 ) ) ( not ( = ?auto_32848 ?auto_32850 ) ) ( not ( = ?auto_32848 ?auto_32851 ) ) ( not ( = ?auto_32842 ?auto_32845 ) ) ( not ( = ?auto_32843 ?auto_32845 ) ) ( not ( = ?auto_32844 ?auto_32845 ) ) ( not ( = ?auto_32842 ?auto_32846 ) ) ( not ( = ?auto_32843 ?auto_32846 ) ) ( not ( = ?auto_32844 ?auto_32846 ) ) ( not ( = ?auto_32845 ?auto_32846 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_32842 ?auto_32844 ?auto_32843 ?auto_32845 ?auto_32841 )
      ( DELIVER-1PKG ?auto_32846 ?auto_32841 )
      ( DELIVER-5PKG-VERIFY ?auto_32842 ?auto_32843 ?auto_32844 ?auto_32845 ?auto_32846 ?auto_32841 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33449 - OBJ
      ?auto_33450 - OBJ
      ?auto_33451 - OBJ
      ?auto_33452 - OBJ
      ?auto_33453 - OBJ
      ?auto_33448 - LOCATION
    )
    :vars
    (
      ?auto_33455 - LOCATION
      ?auto_33456 - CITY
      ?auto_33454 - LOCATION
      ?auto_33458 - LOCATION
      ?auto_33457 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33455 ?auto_33456 ) ( IN-CITY ?auto_33448 ?auto_33456 ) ( not ( = ?auto_33448 ?auto_33455 ) ) ( OBJ-AT ?auto_33453 ?auto_33455 ) ( OBJ-AT ?auto_33452 ?auto_33455 ) ( OBJ-AT ?auto_33450 ?auto_33455 ) ( IN-CITY ?auto_33454 ?auto_33456 ) ( not ( = ?auto_33448 ?auto_33454 ) ) ( OBJ-AT ?auto_33451 ?auto_33454 ) ( IN-CITY ?auto_33458 ?auto_33456 ) ( not ( = ?auto_33448 ?auto_33458 ) ) ( OBJ-AT ?auto_33449 ?auto_33458 ) ( TRUCK-AT ?auto_33457 ?auto_33448 ) ( not ( = ?auto_33449 ?auto_33451 ) ) ( not ( = ?auto_33454 ?auto_33458 ) ) ( not ( = ?auto_33449 ?auto_33450 ) ) ( not ( = ?auto_33451 ?auto_33450 ) ) ( not ( = ?auto_33455 ?auto_33454 ) ) ( not ( = ?auto_33455 ?auto_33458 ) ) ( not ( = ?auto_33449 ?auto_33452 ) ) ( not ( = ?auto_33451 ?auto_33452 ) ) ( not ( = ?auto_33450 ?auto_33452 ) ) ( not ( = ?auto_33449 ?auto_33453 ) ) ( not ( = ?auto_33451 ?auto_33453 ) ) ( not ( = ?auto_33450 ?auto_33453 ) ) ( not ( = ?auto_33452 ?auto_33453 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_33449 ?auto_33451 ?auto_33450 ?auto_33452 ?auto_33453 ?auto_33448 )
      ( DELIVER-5PKG-VERIFY ?auto_33449 ?auto_33450 ?auto_33451 ?auto_33452 ?auto_33453 ?auto_33448 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33639 - OBJ
      ?auto_33640 - OBJ
      ?auto_33641 - OBJ
      ?auto_33642 - OBJ
      ?auto_33643 - OBJ
      ?auto_33638 - LOCATION
    )
    :vars
    (
      ?auto_33644 - LOCATION
      ?auto_33646 - CITY
      ?auto_33647 - LOCATION
      ?auto_33645 - LOCATION
      ?auto_33648 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33644 ?auto_33646 ) ( IN-CITY ?auto_33638 ?auto_33646 ) ( not ( = ?auto_33638 ?auto_33644 ) ) ( OBJ-AT ?auto_33643 ?auto_33644 ) ( OBJ-AT ?auto_33641 ?auto_33644 ) ( OBJ-AT ?auto_33640 ?auto_33644 ) ( IN-CITY ?auto_33647 ?auto_33646 ) ( not ( = ?auto_33638 ?auto_33647 ) ) ( OBJ-AT ?auto_33642 ?auto_33647 ) ( IN-CITY ?auto_33645 ?auto_33646 ) ( not ( = ?auto_33638 ?auto_33645 ) ) ( OBJ-AT ?auto_33639 ?auto_33645 ) ( TRUCK-AT ?auto_33648 ?auto_33638 ) ( not ( = ?auto_33639 ?auto_33642 ) ) ( not ( = ?auto_33647 ?auto_33645 ) ) ( not ( = ?auto_33639 ?auto_33640 ) ) ( not ( = ?auto_33642 ?auto_33640 ) ) ( not ( = ?auto_33644 ?auto_33647 ) ) ( not ( = ?auto_33644 ?auto_33645 ) ) ( not ( = ?auto_33639 ?auto_33641 ) ) ( not ( = ?auto_33642 ?auto_33641 ) ) ( not ( = ?auto_33640 ?auto_33641 ) ) ( not ( = ?auto_33639 ?auto_33643 ) ) ( not ( = ?auto_33642 ?auto_33643 ) ) ( not ( = ?auto_33640 ?auto_33643 ) ) ( not ( = ?auto_33641 ?auto_33643 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_33639 ?auto_33640 ?auto_33642 ?auto_33641 ?auto_33643 ?auto_33638 )
      ( DELIVER-5PKG-VERIFY ?auto_33639 ?auto_33640 ?auto_33641 ?auto_33642 ?auto_33643 ?auto_33638 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33686 - OBJ
      ?auto_33687 - OBJ
      ?auto_33688 - OBJ
      ?auto_33689 - OBJ
      ?auto_33690 - OBJ
      ?auto_33685 - LOCATION
    )
    :vars
    (
      ?auto_33691 - LOCATION
      ?auto_33693 - CITY
      ?auto_33694 - LOCATION
      ?auto_33692 - LOCATION
      ?auto_33695 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33691 ?auto_33693 ) ( IN-CITY ?auto_33685 ?auto_33693 ) ( not ( = ?auto_33685 ?auto_33691 ) ) ( OBJ-AT ?auto_33689 ?auto_33691 ) ( OBJ-AT ?auto_33688 ?auto_33691 ) ( OBJ-AT ?auto_33687 ?auto_33691 ) ( IN-CITY ?auto_33694 ?auto_33693 ) ( not ( = ?auto_33685 ?auto_33694 ) ) ( OBJ-AT ?auto_33690 ?auto_33694 ) ( IN-CITY ?auto_33692 ?auto_33693 ) ( not ( = ?auto_33685 ?auto_33692 ) ) ( OBJ-AT ?auto_33686 ?auto_33692 ) ( TRUCK-AT ?auto_33695 ?auto_33685 ) ( not ( = ?auto_33686 ?auto_33690 ) ) ( not ( = ?auto_33694 ?auto_33692 ) ) ( not ( = ?auto_33686 ?auto_33687 ) ) ( not ( = ?auto_33690 ?auto_33687 ) ) ( not ( = ?auto_33691 ?auto_33694 ) ) ( not ( = ?auto_33691 ?auto_33692 ) ) ( not ( = ?auto_33686 ?auto_33688 ) ) ( not ( = ?auto_33690 ?auto_33688 ) ) ( not ( = ?auto_33687 ?auto_33688 ) ) ( not ( = ?auto_33686 ?auto_33689 ) ) ( not ( = ?auto_33690 ?auto_33689 ) ) ( not ( = ?auto_33687 ?auto_33689 ) ) ( not ( = ?auto_33688 ?auto_33689 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_33686 ?auto_33687 ?auto_33690 ?auto_33688 ?auto_33689 ?auto_33685 )
      ( DELIVER-5PKG-VERIFY ?auto_33686 ?auto_33687 ?auto_33688 ?auto_33689 ?auto_33690 ?auto_33685 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40895 - OBJ
      ?auto_40896 - OBJ
      ?auto_40897 - OBJ
      ?auto_40898 - OBJ
      ?auto_40899 - OBJ
      ?auto_40894 - LOCATION
    )
    :vars
    (
      ?auto_40900 - LOCATION
      ?auto_40902 - CITY
      ?auto_40903 - LOCATION
      ?auto_40901 - LOCATION
      ?auto_40904 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40900 ?auto_40902 ) ( IN-CITY ?auto_40894 ?auto_40902 ) ( not ( = ?auto_40894 ?auto_40900 ) ) ( OBJ-AT ?auto_40899 ?auto_40900 ) ( OBJ-AT ?auto_40898 ?auto_40900 ) ( OBJ-AT ?auto_40895 ?auto_40900 ) ( IN-CITY ?auto_40903 ?auto_40902 ) ( not ( = ?auto_40894 ?auto_40903 ) ) ( OBJ-AT ?auto_40897 ?auto_40903 ) ( IN-CITY ?auto_40901 ?auto_40902 ) ( not ( = ?auto_40894 ?auto_40901 ) ) ( OBJ-AT ?auto_40896 ?auto_40901 ) ( TRUCK-AT ?auto_40904 ?auto_40894 ) ( not ( = ?auto_40896 ?auto_40897 ) ) ( not ( = ?auto_40903 ?auto_40901 ) ) ( not ( = ?auto_40896 ?auto_40895 ) ) ( not ( = ?auto_40897 ?auto_40895 ) ) ( not ( = ?auto_40900 ?auto_40903 ) ) ( not ( = ?auto_40900 ?auto_40901 ) ) ( not ( = ?auto_40896 ?auto_40898 ) ) ( not ( = ?auto_40897 ?auto_40898 ) ) ( not ( = ?auto_40895 ?auto_40898 ) ) ( not ( = ?auto_40896 ?auto_40899 ) ) ( not ( = ?auto_40897 ?auto_40899 ) ) ( not ( = ?auto_40895 ?auto_40899 ) ) ( not ( = ?auto_40898 ?auto_40899 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40896 ?auto_40895 ?auto_40897 ?auto_40898 ?auto_40899 ?auto_40894 )
      ( DELIVER-5PKG-VERIFY ?auto_40895 ?auto_40896 ?auto_40897 ?auto_40898 ?auto_40899 ?auto_40894 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41085 - OBJ
      ?auto_41086 - OBJ
      ?auto_41087 - OBJ
      ?auto_41088 - OBJ
      ?auto_41089 - OBJ
      ?auto_41084 - LOCATION
    )
    :vars
    (
      ?auto_41090 - LOCATION
      ?auto_41092 - CITY
      ?auto_41093 - LOCATION
      ?auto_41091 - LOCATION
      ?auto_41094 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41090 ?auto_41092 ) ( IN-CITY ?auto_41084 ?auto_41092 ) ( not ( = ?auto_41084 ?auto_41090 ) ) ( OBJ-AT ?auto_41089 ?auto_41090 ) ( OBJ-AT ?auto_41087 ?auto_41090 ) ( OBJ-AT ?auto_41085 ?auto_41090 ) ( IN-CITY ?auto_41093 ?auto_41092 ) ( not ( = ?auto_41084 ?auto_41093 ) ) ( OBJ-AT ?auto_41088 ?auto_41093 ) ( IN-CITY ?auto_41091 ?auto_41092 ) ( not ( = ?auto_41084 ?auto_41091 ) ) ( OBJ-AT ?auto_41086 ?auto_41091 ) ( TRUCK-AT ?auto_41094 ?auto_41084 ) ( not ( = ?auto_41086 ?auto_41088 ) ) ( not ( = ?auto_41093 ?auto_41091 ) ) ( not ( = ?auto_41086 ?auto_41085 ) ) ( not ( = ?auto_41088 ?auto_41085 ) ) ( not ( = ?auto_41090 ?auto_41093 ) ) ( not ( = ?auto_41090 ?auto_41091 ) ) ( not ( = ?auto_41086 ?auto_41087 ) ) ( not ( = ?auto_41088 ?auto_41087 ) ) ( not ( = ?auto_41085 ?auto_41087 ) ) ( not ( = ?auto_41086 ?auto_41089 ) ) ( not ( = ?auto_41088 ?auto_41089 ) ) ( not ( = ?auto_41085 ?auto_41089 ) ) ( not ( = ?auto_41087 ?auto_41089 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41086 ?auto_41085 ?auto_41088 ?auto_41087 ?auto_41089 ?auto_41084 )
      ( DELIVER-5PKG-VERIFY ?auto_41085 ?auto_41086 ?auto_41087 ?auto_41088 ?auto_41089 ?auto_41084 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41132 - OBJ
      ?auto_41133 - OBJ
      ?auto_41134 - OBJ
      ?auto_41135 - OBJ
      ?auto_41136 - OBJ
      ?auto_41131 - LOCATION
    )
    :vars
    (
      ?auto_41137 - LOCATION
      ?auto_41139 - CITY
      ?auto_41140 - LOCATION
      ?auto_41138 - LOCATION
      ?auto_41141 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41137 ?auto_41139 ) ( IN-CITY ?auto_41131 ?auto_41139 ) ( not ( = ?auto_41131 ?auto_41137 ) ) ( OBJ-AT ?auto_41135 ?auto_41137 ) ( OBJ-AT ?auto_41134 ?auto_41137 ) ( OBJ-AT ?auto_41132 ?auto_41137 ) ( IN-CITY ?auto_41140 ?auto_41139 ) ( not ( = ?auto_41131 ?auto_41140 ) ) ( OBJ-AT ?auto_41136 ?auto_41140 ) ( IN-CITY ?auto_41138 ?auto_41139 ) ( not ( = ?auto_41131 ?auto_41138 ) ) ( OBJ-AT ?auto_41133 ?auto_41138 ) ( TRUCK-AT ?auto_41141 ?auto_41131 ) ( not ( = ?auto_41133 ?auto_41136 ) ) ( not ( = ?auto_41140 ?auto_41138 ) ) ( not ( = ?auto_41133 ?auto_41132 ) ) ( not ( = ?auto_41136 ?auto_41132 ) ) ( not ( = ?auto_41137 ?auto_41140 ) ) ( not ( = ?auto_41137 ?auto_41138 ) ) ( not ( = ?auto_41133 ?auto_41134 ) ) ( not ( = ?auto_41136 ?auto_41134 ) ) ( not ( = ?auto_41132 ?auto_41134 ) ) ( not ( = ?auto_41133 ?auto_41135 ) ) ( not ( = ?auto_41136 ?auto_41135 ) ) ( not ( = ?auto_41132 ?auto_41135 ) ) ( not ( = ?auto_41134 ?auto_41135 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41133 ?auto_41132 ?auto_41136 ?auto_41134 ?auto_41135 ?auto_41131 )
      ( DELIVER-5PKG-VERIFY ?auto_41132 ?auto_41133 ?auto_41134 ?auto_41135 ?auto_41136 ?auto_41131 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42985 - OBJ
      ?auto_42986 - OBJ
      ?auto_42987 - OBJ
      ?auto_42988 - OBJ
      ?auto_42989 - OBJ
      ?auto_42984 - LOCATION
    )
    :vars
    (
      ?auto_42990 - LOCATION
      ?auto_42992 - CITY
      ?auto_42993 - LOCATION
      ?auto_42991 - LOCATION
      ?auto_42994 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42990 ?auto_42992 ) ( IN-CITY ?auto_42984 ?auto_42992 ) ( not ( = ?auto_42984 ?auto_42990 ) ) ( OBJ-AT ?auto_42989 ?auto_42990 ) ( OBJ-AT ?auto_42986 ?auto_42990 ) ( OBJ-AT ?auto_42985 ?auto_42990 ) ( IN-CITY ?auto_42993 ?auto_42992 ) ( not ( = ?auto_42984 ?auto_42993 ) ) ( OBJ-AT ?auto_42988 ?auto_42993 ) ( IN-CITY ?auto_42991 ?auto_42992 ) ( not ( = ?auto_42984 ?auto_42991 ) ) ( OBJ-AT ?auto_42987 ?auto_42991 ) ( TRUCK-AT ?auto_42994 ?auto_42984 ) ( not ( = ?auto_42987 ?auto_42988 ) ) ( not ( = ?auto_42993 ?auto_42991 ) ) ( not ( = ?auto_42987 ?auto_42985 ) ) ( not ( = ?auto_42988 ?auto_42985 ) ) ( not ( = ?auto_42990 ?auto_42993 ) ) ( not ( = ?auto_42990 ?auto_42991 ) ) ( not ( = ?auto_42987 ?auto_42986 ) ) ( not ( = ?auto_42988 ?auto_42986 ) ) ( not ( = ?auto_42985 ?auto_42986 ) ) ( not ( = ?auto_42987 ?auto_42989 ) ) ( not ( = ?auto_42988 ?auto_42989 ) ) ( not ( = ?auto_42985 ?auto_42989 ) ) ( not ( = ?auto_42986 ?auto_42989 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42987 ?auto_42985 ?auto_42988 ?auto_42986 ?auto_42989 ?auto_42984 )
      ( DELIVER-5PKG-VERIFY ?auto_42985 ?auto_42986 ?auto_42987 ?auto_42988 ?auto_42989 ?auto_42984 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_43032 - OBJ
      ?auto_43033 - OBJ
      ?auto_43034 - OBJ
      ?auto_43035 - OBJ
      ?auto_43036 - OBJ
      ?auto_43031 - LOCATION
    )
    :vars
    (
      ?auto_43037 - LOCATION
      ?auto_43039 - CITY
      ?auto_43040 - LOCATION
      ?auto_43038 - LOCATION
      ?auto_43041 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43037 ?auto_43039 ) ( IN-CITY ?auto_43031 ?auto_43039 ) ( not ( = ?auto_43031 ?auto_43037 ) ) ( OBJ-AT ?auto_43035 ?auto_43037 ) ( OBJ-AT ?auto_43033 ?auto_43037 ) ( OBJ-AT ?auto_43032 ?auto_43037 ) ( IN-CITY ?auto_43040 ?auto_43039 ) ( not ( = ?auto_43031 ?auto_43040 ) ) ( OBJ-AT ?auto_43036 ?auto_43040 ) ( IN-CITY ?auto_43038 ?auto_43039 ) ( not ( = ?auto_43031 ?auto_43038 ) ) ( OBJ-AT ?auto_43034 ?auto_43038 ) ( TRUCK-AT ?auto_43041 ?auto_43031 ) ( not ( = ?auto_43034 ?auto_43036 ) ) ( not ( = ?auto_43040 ?auto_43038 ) ) ( not ( = ?auto_43034 ?auto_43032 ) ) ( not ( = ?auto_43036 ?auto_43032 ) ) ( not ( = ?auto_43037 ?auto_43040 ) ) ( not ( = ?auto_43037 ?auto_43038 ) ) ( not ( = ?auto_43034 ?auto_43033 ) ) ( not ( = ?auto_43036 ?auto_43033 ) ) ( not ( = ?auto_43032 ?auto_43033 ) ) ( not ( = ?auto_43034 ?auto_43035 ) ) ( not ( = ?auto_43036 ?auto_43035 ) ) ( not ( = ?auto_43032 ?auto_43035 ) ) ( not ( = ?auto_43033 ?auto_43035 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_43034 ?auto_43032 ?auto_43036 ?auto_43033 ?auto_43035 ?auto_43031 )
      ( DELIVER-5PKG-VERIFY ?auto_43032 ?auto_43033 ?auto_43034 ?auto_43035 ?auto_43036 ?auto_43031 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_43413 - OBJ
      ?auto_43414 - OBJ
      ?auto_43415 - OBJ
      ?auto_43416 - OBJ
      ?auto_43417 - OBJ
      ?auto_43412 - LOCATION
    )
    :vars
    (
      ?auto_43418 - LOCATION
      ?auto_43420 - CITY
      ?auto_43421 - LOCATION
      ?auto_43419 - LOCATION
      ?auto_43422 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43418 ?auto_43420 ) ( IN-CITY ?auto_43412 ?auto_43420 ) ( not ( = ?auto_43412 ?auto_43418 ) ) ( OBJ-AT ?auto_43415 ?auto_43418 ) ( OBJ-AT ?auto_43414 ?auto_43418 ) ( OBJ-AT ?auto_43413 ?auto_43418 ) ( IN-CITY ?auto_43421 ?auto_43420 ) ( not ( = ?auto_43412 ?auto_43421 ) ) ( OBJ-AT ?auto_43417 ?auto_43421 ) ( IN-CITY ?auto_43419 ?auto_43420 ) ( not ( = ?auto_43412 ?auto_43419 ) ) ( OBJ-AT ?auto_43416 ?auto_43419 ) ( TRUCK-AT ?auto_43422 ?auto_43412 ) ( not ( = ?auto_43416 ?auto_43417 ) ) ( not ( = ?auto_43421 ?auto_43419 ) ) ( not ( = ?auto_43416 ?auto_43413 ) ) ( not ( = ?auto_43417 ?auto_43413 ) ) ( not ( = ?auto_43418 ?auto_43421 ) ) ( not ( = ?auto_43418 ?auto_43419 ) ) ( not ( = ?auto_43416 ?auto_43414 ) ) ( not ( = ?auto_43417 ?auto_43414 ) ) ( not ( = ?auto_43413 ?auto_43414 ) ) ( not ( = ?auto_43416 ?auto_43415 ) ) ( not ( = ?auto_43417 ?auto_43415 ) ) ( not ( = ?auto_43413 ?auto_43415 ) ) ( not ( = ?auto_43414 ?auto_43415 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_43416 ?auto_43413 ?auto_43417 ?auto_43414 ?auto_43415 ?auto_43412 )
      ( DELIVER-5PKG-VERIFY ?auto_43413 ?auto_43414 ?auto_43415 ?auto_43416 ?auto_43417 ?auto_43412 ) )
  )

)

