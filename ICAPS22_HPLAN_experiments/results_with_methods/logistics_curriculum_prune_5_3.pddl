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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_147177 - OBJ
      ?auto_147176 - LOCATION
    )
    :vars
    (
      ?auto_147179 - LOCATION
      ?auto_147180 - CITY
      ?auto_147178 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147179 ?auto_147180 ) ( IN-CITY ?auto_147176 ?auto_147180 ) ( not ( = ?auto_147176 ?auto_147179 ) ) ( OBJ-AT ?auto_147177 ?auto_147179 ) ( TRUCK-AT ?auto_147178 ?auto_147176 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_147178 ?auto_147176 ?auto_147179 ?auto_147180 )
      ( !LOAD-TRUCK ?auto_147177 ?auto_147178 ?auto_147179 )
      ( !DRIVE-TRUCK ?auto_147178 ?auto_147179 ?auto_147176 ?auto_147180 )
      ( !UNLOAD-TRUCK ?auto_147177 ?auto_147178 ?auto_147176 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_147198 - OBJ
      ?auto_147199 - OBJ
      ?auto_147197 - LOCATION
    )
    :vars
    (
      ?auto_147202 - LOCATION
      ?auto_147200 - CITY
      ?auto_147201 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147202 ?auto_147200 ) ( IN-CITY ?auto_147197 ?auto_147200 ) ( not ( = ?auto_147197 ?auto_147202 ) ) ( OBJ-AT ?auto_147199 ?auto_147202 ) ( OBJ-AT ?auto_147198 ?auto_147202 ) ( TRUCK-AT ?auto_147201 ?auto_147197 ) ( not ( = ?auto_147198 ?auto_147199 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_147198 ?auto_147197 )
      ( DELIVER-1PKG ?auto_147199 ?auto_147197 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147306 - OBJ
      ?auto_147307 - OBJ
      ?auto_147308 - OBJ
      ?auto_147305 - LOCATION
    )
    :vars
    (
      ?auto_147309 - LOCATION
      ?auto_147311 - CITY
      ?auto_147312 - LOCATION
      ?auto_147310 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147309 ?auto_147311 ) ( IN-CITY ?auto_147305 ?auto_147311 ) ( not ( = ?auto_147305 ?auto_147309 ) ) ( OBJ-AT ?auto_147308 ?auto_147309 ) ( IN-CITY ?auto_147312 ?auto_147311 ) ( not ( = ?auto_147305 ?auto_147312 ) ) ( OBJ-AT ?auto_147307 ?auto_147312 ) ( OBJ-AT ?auto_147306 ?auto_147312 ) ( TRUCK-AT ?auto_147310 ?auto_147305 ) ( not ( = ?auto_147306 ?auto_147307 ) ) ( not ( = ?auto_147306 ?auto_147308 ) ) ( not ( = ?auto_147307 ?auto_147308 ) ) ( not ( = ?auto_147309 ?auto_147312 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_147306 ?auto_147307 ?auto_147305 )
      ( DELIVER-1PKG ?auto_147308 ?auto_147305 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147323 - OBJ
      ?auto_147324 - OBJ
      ?auto_147325 - OBJ
      ?auto_147322 - LOCATION
    )
    :vars
    (
      ?auto_147328 - LOCATION
      ?auto_147329 - CITY
      ?auto_147326 - LOCATION
      ?auto_147327 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147328 ?auto_147329 ) ( IN-CITY ?auto_147322 ?auto_147329 ) ( not ( = ?auto_147322 ?auto_147328 ) ) ( OBJ-AT ?auto_147324 ?auto_147328 ) ( IN-CITY ?auto_147326 ?auto_147329 ) ( not ( = ?auto_147322 ?auto_147326 ) ) ( OBJ-AT ?auto_147325 ?auto_147326 ) ( OBJ-AT ?auto_147323 ?auto_147326 ) ( TRUCK-AT ?auto_147327 ?auto_147322 ) ( not ( = ?auto_147323 ?auto_147325 ) ) ( not ( = ?auto_147323 ?auto_147324 ) ) ( not ( = ?auto_147325 ?auto_147324 ) ) ( not ( = ?auto_147328 ?auto_147326 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_147323 ?auto_147325 ?auto_147324 ?auto_147322 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147384 - OBJ
      ?auto_147385 - OBJ
      ?auto_147386 - OBJ
      ?auto_147383 - LOCATION
    )
    :vars
    (
      ?auto_147389 - LOCATION
      ?auto_147388 - CITY
      ?auto_147390 - LOCATION
      ?auto_147387 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147389 ?auto_147388 ) ( IN-CITY ?auto_147383 ?auto_147388 ) ( not ( = ?auto_147383 ?auto_147389 ) ) ( OBJ-AT ?auto_147384 ?auto_147389 ) ( IN-CITY ?auto_147390 ?auto_147388 ) ( not ( = ?auto_147383 ?auto_147390 ) ) ( OBJ-AT ?auto_147386 ?auto_147390 ) ( OBJ-AT ?auto_147385 ?auto_147390 ) ( TRUCK-AT ?auto_147387 ?auto_147383 ) ( not ( = ?auto_147385 ?auto_147386 ) ) ( not ( = ?auto_147385 ?auto_147384 ) ) ( not ( = ?auto_147386 ?auto_147384 ) ) ( not ( = ?auto_147389 ?auto_147390 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_147385 ?auto_147384 ?auto_147386 ?auto_147383 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148426 - OBJ
      ?auto_148427 - OBJ
      ?auto_148428 - OBJ
      ?auto_148429 - OBJ
      ?auto_148425 - LOCATION
    )
    :vars
    (
      ?auto_148431 - LOCATION
      ?auto_148432 - CITY
      ?auto_148433 - LOCATION
      ?auto_148430 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148431 ?auto_148432 ) ( IN-CITY ?auto_148425 ?auto_148432 ) ( not ( = ?auto_148425 ?auto_148431 ) ) ( OBJ-AT ?auto_148429 ?auto_148431 ) ( IN-CITY ?auto_148433 ?auto_148432 ) ( not ( = ?auto_148425 ?auto_148433 ) ) ( OBJ-AT ?auto_148428 ?auto_148433 ) ( OBJ-AT ?auto_148427 ?auto_148431 ) ( OBJ-AT ?auto_148426 ?auto_148431 ) ( TRUCK-AT ?auto_148430 ?auto_148425 ) ( not ( = ?auto_148426 ?auto_148427 ) ) ( not ( = ?auto_148426 ?auto_148428 ) ) ( not ( = ?auto_148427 ?auto_148428 ) ) ( not ( = ?auto_148433 ?auto_148431 ) ) ( not ( = ?auto_148426 ?auto_148429 ) ) ( not ( = ?auto_148427 ?auto_148429 ) ) ( not ( = ?auto_148428 ?auto_148429 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_148426 ?auto_148428 ?auto_148427 ?auto_148425 )
      ( DELIVER-1PKG ?auto_148429 ?auto_148425 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148455 - OBJ
      ?auto_148456 - OBJ
      ?auto_148457 - OBJ
      ?auto_148458 - OBJ
      ?auto_148454 - LOCATION
    )
    :vars
    (
      ?auto_148461 - LOCATION
      ?auto_148462 - CITY
      ?auto_148460 - LOCATION
      ?auto_148459 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148461 ?auto_148462 ) ( IN-CITY ?auto_148454 ?auto_148462 ) ( not ( = ?auto_148454 ?auto_148461 ) ) ( OBJ-AT ?auto_148457 ?auto_148461 ) ( IN-CITY ?auto_148460 ?auto_148462 ) ( not ( = ?auto_148454 ?auto_148460 ) ) ( OBJ-AT ?auto_148458 ?auto_148460 ) ( OBJ-AT ?auto_148456 ?auto_148461 ) ( OBJ-AT ?auto_148455 ?auto_148461 ) ( TRUCK-AT ?auto_148459 ?auto_148454 ) ( not ( = ?auto_148455 ?auto_148456 ) ) ( not ( = ?auto_148455 ?auto_148458 ) ) ( not ( = ?auto_148456 ?auto_148458 ) ) ( not ( = ?auto_148460 ?auto_148461 ) ) ( not ( = ?auto_148455 ?auto_148457 ) ) ( not ( = ?auto_148456 ?auto_148457 ) ) ( not ( = ?auto_148458 ?auto_148457 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_148455 ?auto_148456 ?auto_148458 ?auto_148457 ?auto_148454 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148484 - OBJ
      ?auto_148485 - OBJ
      ?auto_148486 - OBJ
      ?auto_148487 - OBJ
      ?auto_148483 - LOCATION
    )
    :vars
    (
      ?auto_148490 - LOCATION
      ?auto_148489 - CITY
      ?auto_148488 - LOCATION
      ?auto_148491 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148490 ?auto_148489 ) ( IN-CITY ?auto_148483 ?auto_148489 ) ( not ( = ?auto_148483 ?auto_148490 ) ) ( OBJ-AT ?auto_148487 ?auto_148490 ) ( IN-CITY ?auto_148488 ?auto_148489 ) ( not ( = ?auto_148483 ?auto_148488 ) ) ( OBJ-AT ?auto_148485 ?auto_148488 ) ( OBJ-AT ?auto_148486 ?auto_148490 ) ( OBJ-AT ?auto_148484 ?auto_148490 ) ( TRUCK-AT ?auto_148491 ?auto_148483 ) ( not ( = ?auto_148484 ?auto_148486 ) ) ( not ( = ?auto_148484 ?auto_148485 ) ) ( not ( = ?auto_148486 ?auto_148485 ) ) ( not ( = ?auto_148488 ?auto_148490 ) ) ( not ( = ?auto_148484 ?auto_148487 ) ) ( not ( = ?auto_148486 ?auto_148487 ) ) ( not ( = ?auto_148485 ?auto_148487 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_148484 ?auto_148486 ?auto_148487 ?auto_148485 ?auto_148483 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149049 - OBJ
      ?auto_149050 - OBJ
      ?auto_149051 - OBJ
      ?auto_149052 - OBJ
      ?auto_149048 - LOCATION
    )
    :vars
    (
      ?auto_149055 - LOCATION
      ?auto_149054 - CITY
      ?auto_149053 - LOCATION
      ?auto_149056 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149055 ?auto_149054 ) ( IN-CITY ?auto_149048 ?auto_149054 ) ( not ( = ?auto_149048 ?auto_149055 ) ) ( OBJ-AT ?auto_149052 ?auto_149055 ) ( IN-CITY ?auto_149053 ?auto_149054 ) ( not ( = ?auto_149048 ?auto_149053 ) ) ( OBJ-AT ?auto_149049 ?auto_149053 ) ( OBJ-AT ?auto_149051 ?auto_149055 ) ( OBJ-AT ?auto_149050 ?auto_149055 ) ( TRUCK-AT ?auto_149056 ?auto_149048 ) ( not ( = ?auto_149050 ?auto_149051 ) ) ( not ( = ?auto_149050 ?auto_149049 ) ) ( not ( = ?auto_149051 ?auto_149049 ) ) ( not ( = ?auto_149053 ?auto_149055 ) ) ( not ( = ?auto_149050 ?auto_149052 ) ) ( not ( = ?auto_149051 ?auto_149052 ) ) ( not ( = ?auto_149049 ?auto_149052 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149050 ?auto_149051 ?auto_149052 ?auto_149049 ?auto_149048 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_163598 - OBJ
      ?auto_163599 - OBJ
      ?auto_163600 - OBJ
      ?auto_163601 - OBJ
      ?auto_163602 - OBJ
      ?auto_163597 - LOCATION
    )
    :vars
    (
      ?auto_163603 - LOCATION
      ?auto_163604 - CITY
      ?auto_163606 - LOCATION
      ?auto_163605 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_163603 ?auto_163604 ) ( IN-CITY ?auto_163597 ?auto_163604 ) ( not ( = ?auto_163597 ?auto_163603 ) ) ( OBJ-AT ?auto_163602 ?auto_163603 ) ( IN-CITY ?auto_163606 ?auto_163604 ) ( not ( = ?auto_163597 ?auto_163606 ) ) ( OBJ-AT ?auto_163601 ?auto_163606 ) ( OBJ-AT ?auto_163600 ?auto_163603 ) ( OBJ-AT ?auto_163599 ?auto_163606 ) ( OBJ-AT ?auto_163598 ?auto_163606 ) ( TRUCK-AT ?auto_163605 ?auto_163597 ) ( not ( = ?auto_163598 ?auto_163599 ) ) ( not ( = ?auto_163598 ?auto_163600 ) ) ( not ( = ?auto_163599 ?auto_163600 ) ) ( not ( = ?auto_163603 ?auto_163606 ) ) ( not ( = ?auto_163598 ?auto_163601 ) ) ( not ( = ?auto_163599 ?auto_163601 ) ) ( not ( = ?auto_163600 ?auto_163601 ) ) ( not ( = ?auto_163598 ?auto_163602 ) ) ( not ( = ?auto_163599 ?auto_163602 ) ) ( not ( = ?auto_163600 ?auto_163602 ) ) ( not ( = ?auto_163601 ?auto_163602 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_163598 ?auto_163599 ?auto_163601 ?auto_163600 ?auto_163597 )
      ( DELIVER-1PKG ?auto_163602 ?auto_163597 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_163641 - OBJ
      ?auto_163642 - OBJ
      ?auto_163643 - OBJ
      ?auto_163644 - OBJ
      ?auto_163645 - OBJ
      ?auto_163640 - LOCATION
    )
    :vars
    (
      ?auto_163649 - LOCATION
      ?auto_163646 - CITY
      ?auto_163647 - LOCATION
      ?auto_163648 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_163649 ?auto_163646 ) ( IN-CITY ?auto_163640 ?auto_163646 ) ( not ( = ?auto_163640 ?auto_163649 ) ) ( OBJ-AT ?auto_163644 ?auto_163649 ) ( IN-CITY ?auto_163647 ?auto_163646 ) ( not ( = ?auto_163640 ?auto_163647 ) ) ( OBJ-AT ?auto_163645 ?auto_163647 ) ( OBJ-AT ?auto_163643 ?auto_163649 ) ( OBJ-AT ?auto_163642 ?auto_163647 ) ( OBJ-AT ?auto_163641 ?auto_163647 ) ( TRUCK-AT ?auto_163648 ?auto_163640 ) ( not ( = ?auto_163641 ?auto_163642 ) ) ( not ( = ?auto_163641 ?auto_163643 ) ) ( not ( = ?auto_163642 ?auto_163643 ) ) ( not ( = ?auto_163649 ?auto_163647 ) ) ( not ( = ?auto_163641 ?auto_163645 ) ) ( not ( = ?auto_163642 ?auto_163645 ) ) ( not ( = ?auto_163643 ?auto_163645 ) ) ( not ( = ?auto_163641 ?auto_163644 ) ) ( not ( = ?auto_163642 ?auto_163644 ) ) ( not ( = ?auto_163643 ?auto_163644 ) ) ( not ( = ?auto_163645 ?auto_163644 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_163641 ?auto_163642 ?auto_163643 ?auto_163645 ?auto_163644 ?auto_163640 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_163684 - OBJ
      ?auto_163685 - OBJ
      ?auto_163686 - OBJ
      ?auto_163687 - OBJ
      ?auto_163688 - OBJ
      ?auto_163683 - LOCATION
    )
    :vars
    (
      ?auto_163692 - LOCATION
      ?auto_163690 - CITY
      ?auto_163691 - LOCATION
      ?auto_163689 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_163692 ?auto_163690 ) ( IN-CITY ?auto_163683 ?auto_163690 ) ( not ( = ?auto_163683 ?auto_163692 ) ) ( OBJ-AT ?auto_163688 ?auto_163692 ) ( IN-CITY ?auto_163691 ?auto_163690 ) ( not ( = ?auto_163683 ?auto_163691 ) ) ( OBJ-AT ?auto_163686 ?auto_163691 ) ( OBJ-AT ?auto_163687 ?auto_163692 ) ( OBJ-AT ?auto_163685 ?auto_163691 ) ( OBJ-AT ?auto_163684 ?auto_163691 ) ( TRUCK-AT ?auto_163689 ?auto_163683 ) ( not ( = ?auto_163684 ?auto_163685 ) ) ( not ( = ?auto_163684 ?auto_163687 ) ) ( not ( = ?auto_163685 ?auto_163687 ) ) ( not ( = ?auto_163692 ?auto_163691 ) ) ( not ( = ?auto_163684 ?auto_163686 ) ) ( not ( = ?auto_163685 ?auto_163686 ) ) ( not ( = ?auto_163687 ?auto_163686 ) ) ( not ( = ?auto_163684 ?auto_163688 ) ) ( not ( = ?auto_163685 ?auto_163688 ) ) ( not ( = ?auto_163687 ?auto_163688 ) ) ( not ( = ?auto_163686 ?auto_163688 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_163684 ?auto_163685 ?auto_163687 ?auto_163688 ?auto_163686 ?auto_163683 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164166 - OBJ
      ?auto_164167 - OBJ
      ?auto_164168 - OBJ
      ?auto_164169 - OBJ
      ?auto_164170 - OBJ
      ?auto_164165 - LOCATION
    )
    :vars
    (
      ?auto_164174 - LOCATION
      ?auto_164172 - CITY
      ?auto_164173 - LOCATION
      ?auto_164171 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164174 ?auto_164172 ) ( IN-CITY ?auto_164165 ?auto_164172 ) ( not ( = ?auto_164165 ?auto_164174 ) ) ( OBJ-AT ?auto_164170 ?auto_164174 ) ( IN-CITY ?auto_164173 ?auto_164172 ) ( not ( = ?auto_164165 ?auto_164173 ) ) ( OBJ-AT ?auto_164169 ?auto_164173 ) ( OBJ-AT ?auto_164167 ?auto_164174 ) ( OBJ-AT ?auto_164168 ?auto_164173 ) ( OBJ-AT ?auto_164166 ?auto_164173 ) ( TRUCK-AT ?auto_164171 ?auto_164165 ) ( not ( = ?auto_164166 ?auto_164168 ) ) ( not ( = ?auto_164166 ?auto_164167 ) ) ( not ( = ?auto_164168 ?auto_164167 ) ) ( not ( = ?auto_164174 ?auto_164173 ) ) ( not ( = ?auto_164166 ?auto_164169 ) ) ( not ( = ?auto_164168 ?auto_164169 ) ) ( not ( = ?auto_164167 ?auto_164169 ) ) ( not ( = ?auto_164166 ?auto_164170 ) ) ( not ( = ?auto_164168 ?auto_164170 ) ) ( not ( = ?auto_164167 ?auto_164170 ) ) ( not ( = ?auto_164169 ?auto_164170 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_164166 ?auto_164168 ?auto_164167 ?auto_164170 ?auto_164169 ?auto_164165 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164209 - OBJ
      ?auto_164210 - OBJ
      ?auto_164211 - OBJ
      ?auto_164212 - OBJ
      ?auto_164213 - OBJ
      ?auto_164208 - LOCATION
    )
    :vars
    (
      ?auto_164217 - LOCATION
      ?auto_164215 - CITY
      ?auto_164216 - LOCATION
      ?auto_164214 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164217 ?auto_164215 ) ( IN-CITY ?auto_164208 ?auto_164215 ) ( not ( = ?auto_164208 ?auto_164217 ) ) ( OBJ-AT ?auto_164212 ?auto_164217 ) ( IN-CITY ?auto_164216 ?auto_164215 ) ( not ( = ?auto_164208 ?auto_164216 ) ) ( OBJ-AT ?auto_164213 ?auto_164216 ) ( OBJ-AT ?auto_164210 ?auto_164217 ) ( OBJ-AT ?auto_164211 ?auto_164216 ) ( OBJ-AT ?auto_164209 ?auto_164216 ) ( TRUCK-AT ?auto_164214 ?auto_164208 ) ( not ( = ?auto_164209 ?auto_164211 ) ) ( not ( = ?auto_164209 ?auto_164210 ) ) ( not ( = ?auto_164211 ?auto_164210 ) ) ( not ( = ?auto_164217 ?auto_164216 ) ) ( not ( = ?auto_164209 ?auto_164213 ) ) ( not ( = ?auto_164211 ?auto_164213 ) ) ( not ( = ?auto_164210 ?auto_164213 ) ) ( not ( = ?auto_164209 ?auto_164212 ) ) ( not ( = ?auto_164211 ?auto_164212 ) ) ( not ( = ?auto_164210 ?auto_164212 ) ) ( not ( = ?auto_164213 ?auto_164212 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_164209 ?auto_164211 ?auto_164210 ?auto_164212 ?auto_164213 ?auto_164208 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164514 - OBJ
      ?auto_164515 - OBJ
      ?auto_164516 - OBJ
      ?auto_164517 - OBJ
      ?auto_164518 - OBJ
      ?auto_164513 - LOCATION
    )
    :vars
    (
      ?auto_164522 - LOCATION
      ?auto_164520 - CITY
      ?auto_164521 - LOCATION
      ?auto_164519 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164522 ?auto_164520 ) ( IN-CITY ?auto_164513 ?auto_164520 ) ( not ( = ?auto_164513 ?auto_164522 ) ) ( OBJ-AT ?auto_164516 ?auto_164522 ) ( IN-CITY ?auto_164521 ?auto_164520 ) ( not ( = ?auto_164513 ?auto_164521 ) ) ( OBJ-AT ?auto_164518 ?auto_164521 ) ( OBJ-AT ?auto_164515 ?auto_164522 ) ( OBJ-AT ?auto_164517 ?auto_164521 ) ( OBJ-AT ?auto_164514 ?auto_164521 ) ( TRUCK-AT ?auto_164519 ?auto_164513 ) ( not ( = ?auto_164514 ?auto_164517 ) ) ( not ( = ?auto_164514 ?auto_164515 ) ) ( not ( = ?auto_164517 ?auto_164515 ) ) ( not ( = ?auto_164522 ?auto_164521 ) ) ( not ( = ?auto_164514 ?auto_164518 ) ) ( not ( = ?auto_164517 ?auto_164518 ) ) ( not ( = ?auto_164515 ?auto_164518 ) ) ( not ( = ?auto_164514 ?auto_164516 ) ) ( not ( = ?auto_164517 ?auto_164516 ) ) ( not ( = ?auto_164515 ?auto_164516 ) ) ( not ( = ?auto_164518 ?auto_164516 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_164514 ?auto_164517 ?auto_164515 ?auto_164516 ?auto_164518 ?auto_164513 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171035 - OBJ
      ?auto_171036 - OBJ
      ?auto_171037 - OBJ
      ?auto_171038 - OBJ
      ?auto_171039 - OBJ
      ?auto_171034 - LOCATION
    )
    :vars
    (
      ?auto_171043 - LOCATION
      ?auto_171041 - CITY
      ?auto_171042 - LOCATION
      ?auto_171040 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171043 ?auto_171041 ) ( IN-CITY ?auto_171034 ?auto_171041 ) ( not ( = ?auto_171034 ?auto_171043 ) ) ( OBJ-AT ?auto_171039 ?auto_171043 ) ( IN-CITY ?auto_171042 ?auto_171041 ) ( not ( = ?auto_171034 ?auto_171042 ) ) ( OBJ-AT ?auto_171038 ?auto_171042 ) ( OBJ-AT ?auto_171035 ?auto_171043 ) ( OBJ-AT ?auto_171037 ?auto_171042 ) ( OBJ-AT ?auto_171036 ?auto_171042 ) ( TRUCK-AT ?auto_171040 ?auto_171034 ) ( not ( = ?auto_171036 ?auto_171037 ) ) ( not ( = ?auto_171036 ?auto_171035 ) ) ( not ( = ?auto_171037 ?auto_171035 ) ) ( not ( = ?auto_171043 ?auto_171042 ) ) ( not ( = ?auto_171036 ?auto_171038 ) ) ( not ( = ?auto_171037 ?auto_171038 ) ) ( not ( = ?auto_171035 ?auto_171038 ) ) ( not ( = ?auto_171036 ?auto_171039 ) ) ( not ( = ?auto_171037 ?auto_171039 ) ) ( not ( = ?auto_171035 ?auto_171039 ) ) ( not ( = ?auto_171038 ?auto_171039 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171036 ?auto_171037 ?auto_171035 ?auto_171039 ?auto_171038 ?auto_171034 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171078 - OBJ
      ?auto_171079 - OBJ
      ?auto_171080 - OBJ
      ?auto_171081 - OBJ
      ?auto_171082 - OBJ
      ?auto_171077 - LOCATION
    )
    :vars
    (
      ?auto_171086 - LOCATION
      ?auto_171084 - CITY
      ?auto_171085 - LOCATION
      ?auto_171083 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171086 ?auto_171084 ) ( IN-CITY ?auto_171077 ?auto_171084 ) ( not ( = ?auto_171077 ?auto_171086 ) ) ( OBJ-AT ?auto_171081 ?auto_171086 ) ( IN-CITY ?auto_171085 ?auto_171084 ) ( not ( = ?auto_171077 ?auto_171085 ) ) ( OBJ-AT ?auto_171082 ?auto_171085 ) ( OBJ-AT ?auto_171078 ?auto_171086 ) ( OBJ-AT ?auto_171080 ?auto_171085 ) ( OBJ-AT ?auto_171079 ?auto_171085 ) ( TRUCK-AT ?auto_171083 ?auto_171077 ) ( not ( = ?auto_171079 ?auto_171080 ) ) ( not ( = ?auto_171079 ?auto_171078 ) ) ( not ( = ?auto_171080 ?auto_171078 ) ) ( not ( = ?auto_171086 ?auto_171085 ) ) ( not ( = ?auto_171079 ?auto_171082 ) ) ( not ( = ?auto_171080 ?auto_171082 ) ) ( not ( = ?auto_171078 ?auto_171082 ) ) ( not ( = ?auto_171079 ?auto_171081 ) ) ( not ( = ?auto_171080 ?auto_171081 ) ) ( not ( = ?auto_171078 ?auto_171081 ) ) ( not ( = ?auto_171082 ?auto_171081 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171079 ?auto_171080 ?auto_171078 ?auto_171081 ?auto_171082 ?auto_171077 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171383 - OBJ
      ?auto_171384 - OBJ
      ?auto_171385 - OBJ
      ?auto_171386 - OBJ
      ?auto_171387 - OBJ
      ?auto_171382 - LOCATION
    )
    :vars
    (
      ?auto_171391 - LOCATION
      ?auto_171389 - CITY
      ?auto_171390 - LOCATION
      ?auto_171388 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171391 ?auto_171389 ) ( IN-CITY ?auto_171382 ?auto_171389 ) ( not ( = ?auto_171382 ?auto_171391 ) ) ( OBJ-AT ?auto_171385 ?auto_171391 ) ( IN-CITY ?auto_171390 ?auto_171389 ) ( not ( = ?auto_171382 ?auto_171390 ) ) ( OBJ-AT ?auto_171387 ?auto_171390 ) ( OBJ-AT ?auto_171383 ?auto_171391 ) ( OBJ-AT ?auto_171386 ?auto_171390 ) ( OBJ-AT ?auto_171384 ?auto_171390 ) ( TRUCK-AT ?auto_171388 ?auto_171382 ) ( not ( = ?auto_171384 ?auto_171386 ) ) ( not ( = ?auto_171384 ?auto_171383 ) ) ( not ( = ?auto_171386 ?auto_171383 ) ) ( not ( = ?auto_171391 ?auto_171390 ) ) ( not ( = ?auto_171384 ?auto_171387 ) ) ( not ( = ?auto_171386 ?auto_171387 ) ) ( not ( = ?auto_171383 ?auto_171387 ) ) ( not ( = ?auto_171384 ?auto_171385 ) ) ( not ( = ?auto_171386 ?auto_171385 ) ) ( not ( = ?auto_171383 ?auto_171385 ) ) ( not ( = ?auto_171387 ?auto_171385 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171384 ?auto_171386 ?auto_171383 ?auto_171385 ?auto_171387 ?auto_171382 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173702 - OBJ
      ?auto_173703 - OBJ
      ?auto_173704 - OBJ
      ?auto_173705 - OBJ
      ?auto_173706 - OBJ
      ?auto_173701 - LOCATION
    )
    :vars
    (
      ?auto_173710 - LOCATION
      ?auto_173708 - CITY
      ?auto_173709 - LOCATION
      ?auto_173707 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173710 ?auto_173708 ) ( IN-CITY ?auto_173701 ?auto_173708 ) ( not ( = ?auto_173701 ?auto_173710 ) ) ( OBJ-AT ?auto_173703 ?auto_173710 ) ( IN-CITY ?auto_173709 ?auto_173708 ) ( not ( = ?auto_173701 ?auto_173709 ) ) ( OBJ-AT ?auto_173706 ?auto_173709 ) ( OBJ-AT ?auto_173702 ?auto_173710 ) ( OBJ-AT ?auto_173705 ?auto_173709 ) ( OBJ-AT ?auto_173704 ?auto_173709 ) ( TRUCK-AT ?auto_173707 ?auto_173701 ) ( not ( = ?auto_173704 ?auto_173705 ) ) ( not ( = ?auto_173704 ?auto_173702 ) ) ( not ( = ?auto_173705 ?auto_173702 ) ) ( not ( = ?auto_173710 ?auto_173709 ) ) ( not ( = ?auto_173704 ?auto_173706 ) ) ( not ( = ?auto_173705 ?auto_173706 ) ) ( not ( = ?auto_173702 ?auto_173706 ) ) ( not ( = ?auto_173704 ?auto_173703 ) ) ( not ( = ?auto_173705 ?auto_173703 ) ) ( not ( = ?auto_173702 ?auto_173703 ) ) ( not ( = ?auto_173706 ?auto_173703 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173704 ?auto_173705 ?auto_173702 ?auto_173703 ?auto_173706 ?auto_173701 ) )
  )

)

