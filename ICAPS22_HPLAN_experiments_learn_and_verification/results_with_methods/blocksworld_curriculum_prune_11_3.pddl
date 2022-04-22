( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?b - BLOCK )
    ( ON ?b1 - BLOCK ?b2 - BLOCK )
    ( CLEAR ?b - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?b - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?b ) ( CLEAR ?b ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?b ) ) ( not ( CLEAR ?b ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?b ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b ) )
    :effect
    ( and ( not ( HOLDING ?b ) ) ( HAND-EMPTY ) ( ON-TABLE ?b ) ( CLEAR ?b ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?b1 ?b2 ) ) ( not ( CLEAR ?b1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?b2 ) ( HOLDING ?b1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b1 ) ( CLEAR ?b2 ) )
    :effect
    ( and ( not ( HOLDING ?b1 ) ) ( not ( CLEAR ?b2 ) ) ( HAND-EMPTY ) ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?goal - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?goal ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?top - BLOCK
      ?bottom - BLOCK
    )
    :precondition
    ( and ( ON ?top ?bottom ) )
    :subtasks
    (  )
  )

  ( :method MAKE-CLEAR
    :parameters
    (
      ?target - BLOCK
    )
    :precondition
    ( and ( CLEAR ?target ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113245 - BLOCK
    )
    :vars
    (
      ?auto_113246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113245 ?auto_113246 ) ( CLEAR ?auto_113245 ) ( HAND-EMPTY ) ( not ( = ?auto_113245 ?auto_113246 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113245 ?auto_113246 )
      ( !PUTDOWN ?auto_113245 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113252 - BLOCK
      ?auto_113253 - BLOCK
    )
    :vars
    (
      ?auto_113254 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_113252 ) ( ON ?auto_113253 ?auto_113254 ) ( CLEAR ?auto_113253 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113252 ) ( not ( = ?auto_113252 ?auto_113253 ) ) ( not ( = ?auto_113252 ?auto_113254 ) ) ( not ( = ?auto_113253 ?auto_113254 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113253 ?auto_113254 )
      ( !STACK ?auto_113253 ?auto_113252 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113262 - BLOCK
      ?auto_113263 - BLOCK
    )
    :vars
    (
      ?auto_113264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113263 ?auto_113264 ) ( not ( = ?auto_113262 ?auto_113263 ) ) ( not ( = ?auto_113262 ?auto_113264 ) ) ( not ( = ?auto_113263 ?auto_113264 ) ) ( ON ?auto_113262 ?auto_113263 ) ( CLEAR ?auto_113262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113262 )
      ( MAKE-2PILE ?auto_113262 ?auto_113263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113273 - BLOCK
      ?auto_113274 - BLOCK
      ?auto_113275 - BLOCK
    )
    :vars
    (
      ?auto_113276 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_113274 ) ( ON ?auto_113275 ?auto_113276 ) ( CLEAR ?auto_113275 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113273 ) ( ON ?auto_113274 ?auto_113273 ) ( not ( = ?auto_113273 ?auto_113274 ) ) ( not ( = ?auto_113273 ?auto_113275 ) ) ( not ( = ?auto_113273 ?auto_113276 ) ) ( not ( = ?auto_113274 ?auto_113275 ) ) ( not ( = ?auto_113274 ?auto_113276 ) ) ( not ( = ?auto_113275 ?auto_113276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113275 ?auto_113276 )
      ( !STACK ?auto_113275 ?auto_113274 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113287 - BLOCK
      ?auto_113288 - BLOCK
      ?auto_113289 - BLOCK
    )
    :vars
    (
      ?auto_113290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113289 ?auto_113290 ) ( ON-TABLE ?auto_113287 ) ( not ( = ?auto_113287 ?auto_113288 ) ) ( not ( = ?auto_113287 ?auto_113289 ) ) ( not ( = ?auto_113287 ?auto_113290 ) ) ( not ( = ?auto_113288 ?auto_113289 ) ) ( not ( = ?auto_113288 ?auto_113290 ) ) ( not ( = ?auto_113289 ?auto_113290 ) ) ( CLEAR ?auto_113287 ) ( ON ?auto_113288 ?auto_113289 ) ( CLEAR ?auto_113288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113287 ?auto_113288 )
      ( MAKE-3PILE ?auto_113287 ?auto_113288 ?auto_113289 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113301 - BLOCK
      ?auto_113302 - BLOCK
      ?auto_113303 - BLOCK
    )
    :vars
    (
      ?auto_113304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113303 ?auto_113304 ) ( not ( = ?auto_113301 ?auto_113302 ) ) ( not ( = ?auto_113301 ?auto_113303 ) ) ( not ( = ?auto_113301 ?auto_113304 ) ) ( not ( = ?auto_113302 ?auto_113303 ) ) ( not ( = ?auto_113302 ?auto_113304 ) ) ( not ( = ?auto_113303 ?auto_113304 ) ) ( ON ?auto_113302 ?auto_113303 ) ( ON ?auto_113301 ?auto_113302 ) ( CLEAR ?auto_113301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113301 )
      ( MAKE-3PILE ?auto_113301 ?auto_113302 ?auto_113303 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113316 - BLOCK
      ?auto_113317 - BLOCK
      ?auto_113318 - BLOCK
      ?auto_113319 - BLOCK
    )
    :vars
    (
      ?auto_113320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_113318 ) ( ON ?auto_113319 ?auto_113320 ) ( CLEAR ?auto_113319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113316 ) ( ON ?auto_113317 ?auto_113316 ) ( ON ?auto_113318 ?auto_113317 ) ( not ( = ?auto_113316 ?auto_113317 ) ) ( not ( = ?auto_113316 ?auto_113318 ) ) ( not ( = ?auto_113316 ?auto_113319 ) ) ( not ( = ?auto_113316 ?auto_113320 ) ) ( not ( = ?auto_113317 ?auto_113318 ) ) ( not ( = ?auto_113317 ?auto_113319 ) ) ( not ( = ?auto_113317 ?auto_113320 ) ) ( not ( = ?auto_113318 ?auto_113319 ) ) ( not ( = ?auto_113318 ?auto_113320 ) ) ( not ( = ?auto_113319 ?auto_113320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113319 ?auto_113320 )
      ( !STACK ?auto_113319 ?auto_113318 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113334 - BLOCK
      ?auto_113335 - BLOCK
      ?auto_113336 - BLOCK
      ?auto_113337 - BLOCK
    )
    :vars
    (
      ?auto_113338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113337 ?auto_113338 ) ( ON-TABLE ?auto_113334 ) ( ON ?auto_113335 ?auto_113334 ) ( not ( = ?auto_113334 ?auto_113335 ) ) ( not ( = ?auto_113334 ?auto_113336 ) ) ( not ( = ?auto_113334 ?auto_113337 ) ) ( not ( = ?auto_113334 ?auto_113338 ) ) ( not ( = ?auto_113335 ?auto_113336 ) ) ( not ( = ?auto_113335 ?auto_113337 ) ) ( not ( = ?auto_113335 ?auto_113338 ) ) ( not ( = ?auto_113336 ?auto_113337 ) ) ( not ( = ?auto_113336 ?auto_113338 ) ) ( not ( = ?auto_113337 ?auto_113338 ) ) ( CLEAR ?auto_113335 ) ( ON ?auto_113336 ?auto_113337 ) ( CLEAR ?auto_113336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113334 ?auto_113335 ?auto_113336 )
      ( MAKE-4PILE ?auto_113334 ?auto_113335 ?auto_113336 ?auto_113337 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113352 - BLOCK
      ?auto_113353 - BLOCK
      ?auto_113354 - BLOCK
      ?auto_113355 - BLOCK
    )
    :vars
    (
      ?auto_113356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113355 ?auto_113356 ) ( ON-TABLE ?auto_113352 ) ( not ( = ?auto_113352 ?auto_113353 ) ) ( not ( = ?auto_113352 ?auto_113354 ) ) ( not ( = ?auto_113352 ?auto_113355 ) ) ( not ( = ?auto_113352 ?auto_113356 ) ) ( not ( = ?auto_113353 ?auto_113354 ) ) ( not ( = ?auto_113353 ?auto_113355 ) ) ( not ( = ?auto_113353 ?auto_113356 ) ) ( not ( = ?auto_113354 ?auto_113355 ) ) ( not ( = ?auto_113354 ?auto_113356 ) ) ( not ( = ?auto_113355 ?auto_113356 ) ) ( ON ?auto_113354 ?auto_113355 ) ( CLEAR ?auto_113352 ) ( ON ?auto_113353 ?auto_113354 ) ( CLEAR ?auto_113353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113352 ?auto_113353 )
      ( MAKE-4PILE ?auto_113352 ?auto_113353 ?auto_113354 ?auto_113355 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113370 - BLOCK
      ?auto_113371 - BLOCK
      ?auto_113372 - BLOCK
      ?auto_113373 - BLOCK
    )
    :vars
    (
      ?auto_113374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113373 ?auto_113374 ) ( not ( = ?auto_113370 ?auto_113371 ) ) ( not ( = ?auto_113370 ?auto_113372 ) ) ( not ( = ?auto_113370 ?auto_113373 ) ) ( not ( = ?auto_113370 ?auto_113374 ) ) ( not ( = ?auto_113371 ?auto_113372 ) ) ( not ( = ?auto_113371 ?auto_113373 ) ) ( not ( = ?auto_113371 ?auto_113374 ) ) ( not ( = ?auto_113372 ?auto_113373 ) ) ( not ( = ?auto_113372 ?auto_113374 ) ) ( not ( = ?auto_113373 ?auto_113374 ) ) ( ON ?auto_113372 ?auto_113373 ) ( ON ?auto_113371 ?auto_113372 ) ( ON ?auto_113370 ?auto_113371 ) ( CLEAR ?auto_113370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113370 )
      ( MAKE-4PILE ?auto_113370 ?auto_113371 ?auto_113372 ?auto_113373 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113389 - BLOCK
      ?auto_113390 - BLOCK
      ?auto_113391 - BLOCK
      ?auto_113392 - BLOCK
      ?auto_113393 - BLOCK
    )
    :vars
    (
      ?auto_113394 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_113392 ) ( ON ?auto_113393 ?auto_113394 ) ( CLEAR ?auto_113393 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113389 ) ( ON ?auto_113390 ?auto_113389 ) ( ON ?auto_113391 ?auto_113390 ) ( ON ?auto_113392 ?auto_113391 ) ( not ( = ?auto_113389 ?auto_113390 ) ) ( not ( = ?auto_113389 ?auto_113391 ) ) ( not ( = ?auto_113389 ?auto_113392 ) ) ( not ( = ?auto_113389 ?auto_113393 ) ) ( not ( = ?auto_113389 ?auto_113394 ) ) ( not ( = ?auto_113390 ?auto_113391 ) ) ( not ( = ?auto_113390 ?auto_113392 ) ) ( not ( = ?auto_113390 ?auto_113393 ) ) ( not ( = ?auto_113390 ?auto_113394 ) ) ( not ( = ?auto_113391 ?auto_113392 ) ) ( not ( = ?auto_113391 ?auto_113393 ) ) ( not ( = ?auto_113391 ?auto_113394 ) ) ( not ( = ?auto_113392 ?auto_113393 ) ) ( not ( = ?auto_113392 ?auto_113394 ) ) ( not ( = ?auto_113393 ?auto_113394 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113393 ?auto_113394 )
      ( !STACK ?auto_113393 ?auto_113392 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113411 - BLOCK
      ?auto_113412 - BLOCK
      ?auto_113413 - BLOCK
      ?auto_113414 - BLOCK
      ?auto_113415 - BLOCK
    )
    :vars
    (
      ?auto_113416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113415 ?auto_113416 ) ( ON-TABLE ?auto_113411 ) ( ON ?auto_113412 ?auto_113411 ) ( ON ?auto_113413 ?auto_113412 ) ( not ( = ?auto_113411 ?auto_113412 ) ) ( not ( = ?auto_113411 ?auto_113413 ) ) ( not ( = ?auto_113411 ?auto_113414 ) ) ( not ( = ?auto_113411 ?auto_113415 ) ) ( not ( = ?auto_113411 ?auto_113416 ) ) ( not ( = ?auto_113412 ?auto_113413 ) ) ( not ( = ?auto_113412 ?auto_113414 ) ) ( not ( = ?auto_113412 ?auto_113415 ) ) ( not ( = ?auto_113412 ?auto_113416 ) ) ( not ( = ?auto_113413 ?auto_113414 ) ) ( not ( = ?auto_113413 ?auto_113415 ) ) ( not ( = ?auto_113413 ?auto_113416 ) ) ( not ( = ?auto_113414 ?auto_113415 ) ) ( not ( = ?auto_113414 ?auto_113416 ) ) ( not ( = ?auto_113415 ?auto_113416 ) ) ( CLEAR ?auto_113413 ) ( ON ?auto_113414 ?auto_113415 ) ( CLEAR ?auto_113414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113411 ?auto_113412 ?auto_113413 ?auto_113414 )
      ( MAKE-5PILE ?auto_113411 ?auto_113412 ?auto_113413 ?auto_113414 ?auto_113415 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113433 - BLOCK
      ?auto_113434 - BLOCK
      ?auto_113435 - BLOCK
      ?auto_113436 - BLOCK
      ?auto_113437 - BLOCK
    )
    :vars
    (
      ?auto_113438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113437 ?auto_113438 ) ( ON-TABLE ?auto_113433 ) ( ON ?auto_113434 ?auto_113433 ) ( not ( = ?auto_113433 ?auto_113434 ) ) ( not ( = ?auto_113433 ?auto_113435 ) ) ( not ( = ?auto_113433 ?auto_113436 ) ) ( not ( = ?auto_113433 ?auto_113437 ) ) ( not ( = ?auto_113433 ?auto_113438 ) ) ( not ( = ?auto_113434 ?auto_113435 ) ) ( not ( = ?auto_113434 ?auto_113436 ) ) ( not ( = ?auto_113434 ?auto_113437 ) ) ( not ( = ?auto_113434 ?auto_113438 ) ) ( not ( = ?auto_113435 ?auto_113436 ) ) ( not ( = ?auto_113435 ?auto_113437 ) ) ( not ( = ?auto_113435 ?auto_113438 ) ) ( not ( = ?auto_113436 ?auto_113437 ) ) ( not ( = ?auto_113436 ?auto_113438 ) ) ( not ( = ?auto_113437 ?auto_113438 ) ) ( ON ?auto_113436 ?auto_113437 ) ( CLEAR ?auto_113434 ) ( ON ?auto_113435 ?auto_113436 ) ( CLEAR ?auto_113435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113433 ?auto_113434 ?auto_113435 )
      ( MAKE-5PILE ?auto_113433 ?auto_113434 ?auto_113435 ?auto_113436 ?auto_113437 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113455 - BLOCK
      ?auto_113456 - BLOCK
      ?auto_113457 - BLOCK
      ?auto_113458 - BLOCK
      ?auto_113459 - BLOCK
    )
    :vars
    (
      ?auto_113460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113459 ?auto_113460 ) ( ON-TABLE ?auto_113455 ) ( not ( = ?auto_113455 ?auto_113456 ) ) ( not ( = ?auto_113455 ?auto_113457 ) ) ( not ( = ?auto_113455 ?auto_113458 ) ) ( not ( = ?auto_113455 ?auto_113459 ) ) ( not ( = ?auto_113455 ?auto_113460 ) ) ( not ( = ?auto_113456 ?auto_113457 ) ) ( not ( = ?auto_113456 ?auto_113458 ) ) ( not ( = ?auto_113456 ?auto_113459 ) ) ( not ( = ?auto_113456 ?auto_113460 ) ) ( not ( = ?auto_113457 ?auto_113458 ) ) ( not ( = ?auto_113457 ?auto_113459 ) ) ( not ( = ?auto_113457 ?auto_113460 ) ) ( not ( = ?auto_113458 ?auto_113459 ) ) ( not ( = ?auto_113458 ?auto_113460 ) ) ( not ( = ?auto_113459 ?auto_113460 ) ) ( ON ?auto_113458 ?auto_113459 ) ( ON ?auto_113457 ?auto_113458 ) ( CLEAR ?auto_113455 ) ( ON ?auto_113456 ?auto_113457 ) ( CLEAR ?auto_113456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113455 ?auto_113456 )
      ( MAKE-5PILE ?auto_113455 ?auto_113456 ?auto_113457 ?auto_113458 ?auto_113459 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113477 - BLOCK
      ?auto_113478 - BLOCK
      ?auto_113479 - BLOCK
      ?auto_113480 - BLOCK
      ?auto_113481 - BLOCK
    )
    :vars
    (
      ?auto_113482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113481 ?auto_113482 ) ( not ( = ?auto_113477 ?auto_113478 ) ) ( not ( = ?auto_113477 ?auto_113479 ) ) ( not ( = ?auto_113477 ?auto_113480 ) ) ( not ( = ?auto_113477 ?auto_113481 ) ) ( not ( = ?auto_113477 ?auto_113482 ) ) ( not ( = ?auto_113478 ?auto_113479 ) ) ( not ( = ?auto_113478 ?auto_113480 ) ) ( not ( = ?auto_113478 ?auto_113481 ) ) ( not ( = ?auto_113478 ?auto_113482 ) ) ( not ( = ?auto_113479 ?auto_113480 ) ) ( not ( = ?auto_113479 ?auto_113481 ) ) ( not ( = ?auto_113479 ?auto_113482 ) ) ( not ( = ?auto_113480 ?auto_113481 ) ) ( not ( = ?auto_113480 ?auto_113482 ) ) ( not ( = ?auto_113481 ?auto_113482 ) ) ( ON ?auto_113480 ?auto_113481 ) ( ON ?auto_113479 ?auto_113480 ) ( ON ?auto_113478 ?auto_113479 ) ( ON ?auto_113477 ?auto_113478 ) ( CLEAR ?auto_113477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113477 )
      ( MAKE-5PILE ?auto_113477 ?auto_113478 ?auto_113479 ?auto_113480 ?auto_113481 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113500 - BLOCK
      ?auto_113501 - BLOCK
      ?auto_113502 - BLOCK
      ?auto_113503 - BLOCK
      ?auto_113504 - BLOCK
      ?auto_113505 - BLOCK
    )
    :vars
    (
      ?auto_113506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_113504 ) ( ON ?auto_113505 ?auto_113506 ) ( CLEAR ?auto_113505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113500 ) ( ON ?auto_113501 ?auto_113500 ) ( ON ?auto_113502 ?auto_113501 ) ( ON ?auto_113503 ?auto_113502 ) ( ON ?auto_113504 ?auto_113503 ) ( not ( = ?auto_113500 ?auto_113501 ) ) ( not ( = ?auto_113500 ?auto_113502 ) ) ( not ( = ?auto_113500 ?auto_113503 ) ) ( not ( = ?auto_113500 ?auto_113504 ) ) ( not ( = ?auto_113500 ?auto_113505 ) ) ( not ( = ?auto_113500 ?auto_113506 ) ) ( not ( = ?auto_113501 ?auto_113502 ) ) ( not ( = ?auto_113501 ?auto_113503 ) ) ( not ( = ?auto_113501 ?auto_113504 ) ) ( not ( = ?auto_113501 ?auto_113505 ) ) ( not ( = ?auto_113501 ?auto_113506 ) ) ( not ( = ?auto_113502 ?auto_113503 ) ) ( not ( = ?auto_113502 ?auto_113504 ) ) ( not ( = ?auto_113502 ?auto_113505 ) ) ( not ( = ?auto_113502 ?auto_113506 ) ) ( not ( = ?auto_113503 ?auto_113504 ) ) ( not ( = ?auto_113503 ?auto_113505 ) ) ( not ( = ?auto_113503 ?auto_113506 ) ) ( not ( = ?auto_113504 ?auto_113505 ) ) ( not ( = ?auto_113504 ?auto_113506 ) ) ( not ( = ?auto_113505 ?auto_113506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113505 ?auto_113506 )
      ( !STACK ?auto_113505 ?auto_113504 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113526 - BLOCK
      ?auto_113527 - BLOCK
      ?auto_113528 - BLOCK
      ?auto_113529 - BLOCK
      ?auto_113530 - BLOCK
      ?auto_113531 - BLOCK
    )
    :vars
    (
      ?auto_113532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113531 ?auto_113532 ) ( ON-TABLE ?auto_113526 ) ( ON ?auto_113527 ?auto_113526 ) ( ON ?auto_113528 ?auto_113527 ) ( ON ?auto_113529 ?auto_113528 ) ( not ( = ?auto_113526 ?auto_113527 ) ) ( not ( = ?auto_113526 ?auto_113528 ) ) ( not ( = ?auto_113526 ?auto_113529 ) ) ( not ( = ?auto_113526 ?auto_113530 ) ) ( not ( = ?auto_113526 ?auto_113531 ) ) ( not ( = ?auto_113526 ?auto_113532 ) ) ( not ( = ?auto_113527 ?auto_113528 ) ) ( not ( = ?auto_113527 ?auto_113529 ) ) ( not ( = ?auto_113527 ?auto_113530 ) ) ( not ( = ?auto_113527 ?auto_113531 ) ) ( not ( = ?auto_113527 ?auto_113532 ) ) ( not ( = ?auto_113528 ?auto_113529 ) ) ( not ( = ?auto_113528 ?auto_113530 ) ) ( not ( = ?auto_113528 ?auto_113531 ) ) ( not ( = ?auto_113528 ?auto_113532 ) ) ( not ( = ?auto_113529 ?auto_113530 ) ) ( not ( = ?auto_113529 ?auto_113531 ) ) ( not ( = ?auto_113529 ?auto_113532 ) ) ( not ( = ?auto_113530 ?auto_113531 ) ) ( not ( = ?auto_113530 ?auto_113532 ) ) ( not ( = ?auto_113531 ?auto_113532 ) ) ( CLEAR ?auto_113529 ) ( ON ?auto_113530 ?auto_113531 ) ( CLEAR ?auto_113530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113526 ?auto_113527 ?auto_113528 ?auto_113529 ?auto_113530 )
      ( MAKE-6PILE ?auto_113526 ?auto_113527 ?auto_113528 ?auto_113529 ?auto_113530 ?auto_113531 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113552 - BLOCK
      ?auto_113553 - BLOCK
      ?auto_113554 - BLOCK
      ?auto_113555 - BLOCK
      ?auto_113556 - BLOCK
      ?auto_113557 - BLOCK
    )
    :vars
    (
      ?auto_113558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113557 ?auto_113558 ) ( ON-TABLE ?auto_113552 ) ( ON ?auto_113553 ?auto_113552 ) ( ON ?auto_113554 ?auto_113553 ) ( not ( = ?auto_113552 ?auto_113553 ) ) ( not ( = ?auto_113552 ?auto_113554 ) ) ( not ( = ?auto_113552 ?auto_113555 ) ) ( not ( = ?auto_113552 ?auto_113556 ) ) ( not ( = ?auto_113552 ?auto_113557 ) ) ( not ( = ?auto_113552 ?auto_113558 ) ) ( not ( = ?auto_113553 ?auto_113554 ) ) ( not ( = ?auto_113553 ?auto_113555 ) ) ( not ( = ?auto_113553 ?auto_113556 ) ) ( not ( = ?auto_113553 ?auto_113557 ) ) ( not ( = ?auto_113553 ?auto_113558 ) ) ( not ( = ?auto_113554 ?auto_113555 ) ) ( not ( = ?auto_113554 ?auto_113556 ) ) ( not ( = ?auto_113554 ?auto_113557 ) ) ( not ( = ?auto_113554 ?auto_113558 ) ) ( not ( = ?auto_113555 ?auto_113556 ) ) ( not ( = ?auto_113555 ?auto_113557 ) ) ( not ( = ?auto_113555 ?auto_113558 ) ) ( not ( = ?auto_113556 ?auto_113557 ) ) ( not ( = ?auto_113556 ?auto_113558 ) ) ( not ( = ?auto_113557 ?auto_113558 ) ) ( ON ?auto_113556 ?auto_113557 ) ( CLEAR ?auto_113554 ) ( ON ?auto_113555 ?auto_113556 ) ( CLEAR ?auto_113555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113552 ?auto_113553 ?auto_113554 ?auto_113555 )
      ( MAKE-6PILE ?auto_113552 ?auto_113553 ?auto_113554 ?auto_113555 ?auto_113556 ?auto_113557 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113578 - BLOCK
      ?auto_113579 - BLOCK
      ?auto_113580 - BLOCK
      ?auto_113581 - BLOCK
      ?auto_113582 - BLOCK
      ?auto_113583 - BLOCK
    )
    :vars
    (
      ?auto_113584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113583 ?auto_113584 ) ( ON-TABLE ?auto_113578 ) ( ON ?auto_113579 ?auto_113578 ) ( not ( = ?auto_113578 ?auto_113579 ) ) ( not ( = ?auto_113578 ?auto_113580 ) ) ( not ( = ?auto_113578 ?auto_113581 ) ) ( not ( = ?auto_113578 ?auto_113582 ) ) ( not ( = ?auto_113578 ?auto_113583 ) ) ( not ( = ?auto_113578 ?auto_113584 ) ) ( not ( = ?auto_113579 ?auto_113580 ) ) ( not ( = ?auto_113579 ?auto_113581 ) ) ( not ( = ?auto_113579 ?auto_113582 ) ) ( not ( = ?auto_113579 ?auto_113583 ) ) ( not ( = ?auto_113579 ?auto_113584 ) ) ( not ( = ?auto_113580 ?auto_113581 ) ) ( not ( = ?auto_113580 ?auto_113582 ) ) ( not ( = ?auto_113580 ?auto_113583 ) ) ( not ( = ?auto_113580 ?auto_113584 ) ) ( not ( = ?auto_113581 ?auto_113582 ) ) ( not ( = ?auto_113581 ?auto_113583 ) ) ( not ( = ?auto_113581 ?auto_113584 ) ) ( not ( = ?auto_113582 ?auto_113583 ) ) ( not ( = ?auto_113582 ?auto_113584 ) ) ( not ( = ?auto_113583 ?auto_113584 ) ) ( ON ?auto_113582 ?auto_113583 ) ( ON ?auto_113581 ?auto_113582 ) ( CLEAR ?auto_113579 ) ( ON ?auto_113580 ?auto_113581 ) ( CLEAR ?auto_113580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113578 ?auto_113579 ?auto_113580 )
      ( MAKE-6PILE ?auto_113578 ?auto_113579 ?auto_113580 ?auto_113581 ?auto_113582 ?auto_113583 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113604 - BLOCK
      ?auto_113605 - BLOCK
      ?auto_113606 - BLOCK
      ?auto_113607 - BLOCK
      ?auto_113608 - BLOCK
      ?auto_113609 - BLOCK
    )
    :vars
    (
      ?auto_113610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113609 ?auto_113610 ) ( ON-TABLE ?auto_113604 ) ( not ( = ?auto_113604 ?auto_113605 ) ) ( not ( = ?auto_113604 ?auto_113606 ) ) ( not ( = ?auto_113604 ?auto_113607 ) ) ( not ( = ?auto_113604 ?auto_113608 ) ) ( not ( = ?auto_113604 ?auto_113609 ) ) ( not ( = ?auto_113604 ?auto_113610 ) ) ( not ( = ?auto_113605 ?auto_113606 ) ) ( not ( = ?auto_113605 ?auto_113607 ) ) ( not ( = ?auto_113605 ?auto_113608 ) ) ( not ( = ?auto_113605 ?auto_113609 ) ) ( not ( = ?auto_113605 ?auto_113610 ) ) ( not ( = ?auto_113606 ?auto_113607 ) ) ( not ( = ?auto_113606 ?auto_113608 ) ) ( not ( = ?auto_113606 ?auto_113609 ) ) ( not ( = ?auto_113606 ?auto_113610 ) ) ( not ( = ?auto_113607 ?auto_113608 ) ) ( not ( = ?auto_113607 ?auto_113609 ) ) ( not ( = ?auto_113607 ?auto_113610 ) ) ( not ( = ?auto_113608 ?auto_113609 ) ) ( not ( = ?auto_113608 ?auto_113610 ) ) ( not ( = ?auto_113609 ?auto_113610 ) ) ( ON ?auto_113608 ?auto_113609 ) ( ON ?auto_113607 ?auto_113608 ) ( ON ?auto_113606 ?auto_113607 ) ( CLEAR ?auto_113604 ) ( ON ?auto_113605 ?auto_113606 ) ( CLEAR ?auto_113605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113604 ?auto_113605 )
      ( MAKE-6PILE ?auto_113604 ?auto_113605 ?auto_113606 ?auto_113607 ?auto_113608 ?auto_113609 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113630 - BLOCK
      ?auto_113631 - BLOCK
      ?auto_113632 - BLOCK
      ?auto_113633 - BLOCK
      ?auto_113634 - BLOCK
      ?auto_113635 - BLOCK
    )
    :vars
    (
      ?auto_113636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113635 ?auto_113636 ) ( not ( = ?auto_113630 ?auto_113631 ) ) ( not ( = ?auto_113630 ?auto_113632 ) ) ( not ( = ?auto_113630 ?auto_113633 ) ) ( not ( = ?auto_113630 ?auto_113634 ) ) ( not ( = ?auto_113630 ?auto_113635 ) ) ( not ( = ?auto_113630 ?auto_113636 ) ) ( not ( = ?auto_113631 ?auto_113632 ) ) ( not ( = ?auto_113631 ?auto_113633 ) ) ( not ( = ?auto_113631 ?auto_113634 ) ) ( not ( = ?auto_113631 ?auto_113635 ) ) ( not ( = ?auto_113631 ?auto_113636 ) ) ( not ( = ?auto_113632 ?auto_113633 ) ) ( not ( = ?auto_113632 ?auto_113634 ) ) ( not ( = ?auto_113632 ?auto_113635 ) ) ( not ( = ?auto_113632 ?auto_113636 ) ) ( not ( = ?auto_113633 ?auto_113634 ) ) ( not ( = ?auto_113633 ?auto_113635 ) ) ( not ( = ?auto_113633 ?auto_113636 ) ) ( not ( = ?auto_113634 ?auto_113635 ) ) ( not ( = ?auto_113634 ?auto_113636 ) ) ( not ( = ?auto_113635 ?auto_113636 ) ) ( ON ?auto_113634 ?auto_113635 ) ( ON ?auto_113633 ?auto_113634 ) ( ON ?auto_113632 ?auto_113633 ) ( ON ?auto_113631 ?auto_113632 ) ( ON ?auto_113630 ?auto_113631 ) ( CLEAR ?auto_113630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113630 )
      ( MAKE-6PILE ?auto_113630 ?auto_113631 ?auto_113632 ?auto_113633 ?auto_113634 ?auto_113635 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113657 - BLOCK
      ?auto_113658 - BLOCK
      ?auto_113659 - BLOCK
      ?auto_113660 - BLOCK
      ?auto_113661 - BLOCK
      ?auto_113662 - BLOCK
      ?auto_113663 - BLOCK
    )
    :vars
    (
      ?auto_113664 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_113662 ) ( ON ?auto_113663 ?auto_113664 ) ( CLEAR ?auto_113663 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113657 ) ( ON ?auto_113658 ?auto_113657 ) ( ON ?auto_113659 ?auto_113658 ) ( ON ?auto_113660 ?auto_113659 ) ( ON ?auto_113661 ?auto_113660 ) ( ON ?auto_113662 ?auto_113661 ) ( not ( = ?auto_113657 ?auto_113658 ) ) ( not ( = ?auto_113657 ?auto_113659 ) ) ( not ( = ?auto_113657 ?auto_113660 ) ) ( not ( = ?auto_113657 ?auto_113661 ) ) ( not ( = ?auto_113657 ?auto_113662 ) ) ( not ( = ?auto_113657 ?auto_113663 ) ) ( not ( = ?auto_113657 ?auto_113664 ) ) ( not ( = ?auto_113658 ?auto_113659 ) ) ( not ( = ?auto_113658 ?auto_113660 ) ) ( not ( = ?auto_113658 ?auto_113661 ) ) ( not ( = ?auto_113658 ?auto_113662 ) ) ( not ( = ?auto_113658 ?auto_113663 ) ) ( not ( = ?auto_113658 ?auto_113664 ) ) ( not ( = ?auto_113659 ?auto_113660 ) ) ( not ( = ?auto_113659 ?auto_113661 ) ) ( not ( = ?auto_113659 ?auto_113662 ) ) ( not ( = ?auto_113659 ?auto_113663 ) ) ( not ( = ?auto_113659 ?auto_113664 ) ) ( not ( = ?auto_113660 ?auto_113661 ) ) ( not ( = ?auto_113660 ?auto_113662 ) ) ( not ( = ?auto_113660 ?auto_113663 ) ) ( not ( = ?auto_113660 ?auto_113664 ) ) ( not ( = ?auto_113661 ?auto_113662 ) ) ( not ( = ?auto_113661 ?auto_113663 ) ) ( not ( = ?auto_113661 ?auto_113664 ) ) ( not ( = ?auto_113662 ?auto_113663 ) ) ( not ( = ?auto_113662 ?auto_113664 ) ) ( not ( = ?auto_113663 ?auto_113664 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113663 ?auto_113664 )
      ( !STACK ?auto_113663 ?auto_113662 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113687 - BLOCK
      ?auto_113688 - BLOCK
      ?auto_113689 - BLOCK
      ?auto_113690 - BLOCK
      ?auto_113691 - BLOCK
      ?auto_113692 - BLOCK
      ?auto_113693 - BLOCK
    )
    :vars
    (
      ?auto_113694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113693 ?auto_113694 ) ( ON-TABLE ?auto_113687 ) ( ON ?auto_113688 ?auto_113687 ) ( ON ?auto_113689 ?auto_113688 ) ( ON ?auto_113690 ?auto_113689 ) ( ON ?auto_113691 ?auto_113690 ) ( not ( = ?auto_113687 ?auto_113688 ) ) ( not ( = ?auto_113687 ?auto_113689 ) ) ( not ( = ?auto_113687 ?auto_113690 ) ) ( not ( = ?auto_113687 ?auto_113691 ) ) ( not ( = ?auto_113687 ?auto_113692 ) ) ( not ( = ?auto_113687 ?auto_113693 ) ) ( not ( = ?auto_113687 ?auto_113694 ) ) ( not ( = ?auto_113688 ?auto_113689 ) ) ( not ( = ?auto_113688 ?auto_113690 ) ) ( not ( = ?auto_113688 ?auto_113691 ) ) ( not ( = ?auto_113688 ?auto_113692 ) ) ( not ( = ?auto_113688 ?auto_113693 ) ) ( not ( = ?auto_113688 ?auto_113694 ) ) ( not ( = ?auto_113689 ?auto_113690 ) ) ( not ( = ?auto_113689 ?auto_113691 ) ) ( not ( = ?auto_113689 ?auto_113692 ) ) ( not ( = ?auto_113689 ?auto_113693 ) ) ( not ( = ?auto_113689 ?auto_113694 ) ) ( not ( = ?auto_113690 ?auto_113691 ) ) ( not ( = ?auto_113690 ?auto_113692 ) ) ( not ( = ?auto_113690 ?auto_113693 ) ) ( not ( = ?auto_113690 ?auto_113694 ) ) ( not ( = ?auto_113691 ?auto_113692 ) ) ( not ( = ?auto_113691 ?auto_113693 ) ) ( not ( = ?auto_113691 ?auto_113694 ) ) ( not ( = ?auto_113692 ?auto_113693 ) ) ( not ( = ?auto_113692 ?auto_113694 ) ) ( not ( = ?auto_113693 ?auto_113694 ) ) ( CLEAR ?auto_113691 ) ( ON ?auto_113692 ?auto_113693 ) ( CLEAR ?auto_113692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113687 ?auto_113688 ?auto_113689 ?auto_113690 ?auto_113691 ?auto_113692 )
      ( MAKE-7PILE ?auto_113687 ?auto_113688 ?auto_113689 ?auto_113690 ?auto_113691 ?auto_113692 ?auto_113693 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113717 - BLOCK
      ?auto_113718 - BLOCK
      ?auto_113719 - BLOCK
      ?auto_113720 - BLOCK
      ?auto_113721 - BLOCK
      ?auto_113722 - BLOCK
      ?auto_113723 - BLOCK
    )
    :vars
    (
      ?auto_113724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113723 ?auto_113724 ) ( ON-TABLE ?auto_113717 ) ( ON ?auto_113718 ?auto_113717 ) ( ON ?auto_113719 ?auto_113718 ) ( ON ?auto_113720 ?auto_113719 ) ( not ( = ?auto_113717 ?auto_113718 ) ) ( not ( = ?auto_113717 ?auto_113719 ) ) ( not ( = ?auto_113717 ?auto_113720 ) ) ( not ( = ?auto_113717 ?auto_113721 ) ) ( not ( = ?auto_113717 ?auto_113722 ) ) ( not ( = ?auto_113717 ?auto_113723 ) ) ( not ( = ?auto_113717 ?auto_113724 ) ) ( not ( = ?auto_113718 ?auto_113719 ) ) ( not ( = ?auto_113718 ?auto_113720 ) ) ( not ( = ?auto_113718 ?auto_113721 ) ) ( not ( = ?auto_113718 ?auto_113722 ) ) ( not ( = ?auto_113718 ?auto_113723 ) ) ( not ( = ?auto_113718 ?auto_113724 ) ) ( not ( = ?auto_113719 ?auto_113720 ) ) ( not ( = ?auto_113719 ?auto_113721 ) ) ( not ( = ?auto_113719 ?auto_113722 ) ) ( not ( = ?auto_113719 ?auto_113723 ) ) ( not ( = ?auto_113719 ?auto_113724 ) ) ( not ( = ?auto_113720 ?auto_113721 ) ) ( not ( = ?auto_113720 ?auto_113722 ) ) ( not ( = ?auto_113720 ?auto_113723 ) ) ( not ( = ?auto_113720 ?auto_113724 ) ) ( not ( = ?auto_113721 ?auto_113722 ) ) ( not ( = ?auto_113721 ?auto_113723 ) ) ( not ( = ?auto_113721 ?auto_113724 ) ) ( not ( = ?auto_113722 ?auto_113723 ) ) ( not ( = ?auto_113722 ?auto_113724 ) ) ( not ( = ?auto_113723 ?auto_113724 ) ) ( ON ?auto_113722 ?auto_113723 ) ( CLEAR ?auto_113720 ) ( ON ?auto_113721 ?auto_113722 ) ( CLEAR ?auto_113721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113717 ?auto_113718 ?auto_113719 ?auto_113720 ?auto_113721 )
      ( MAKE-7PILE ?auto_113717 ?auto_113718 ?auto_113719 ?auto_113720 ?auto_113721 ?auto_113722 ?auto_113723 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113747 - BLOCK
      ?auto_113748 - BLOCK
      ?auto_113749 - BLOCK
      ?auto_113750 - BLOCK
      ?auto_113751 - BLOCK
      ?auto_113752 - BLOCK
      ?auto_113753 - BLOCK
    )
    :vars
    (
      ?auto_113754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113753 ?auto_113754 ) ( ON-TABLE ?auto_113747 ) ( ON ?auto_113748 ?auto_113747 ) ( ON ?auto_113749 ?auto_113748 ) ( not ( = ?auto_113747 ?auto_113748 ) ) ( not ( = ?auto_113747 ?auto_113749 ) ) ( not ( = ?auto_113747 ?auto_113750 ) ) ( not ( = ?auto_113747 ?auto_113751 ) ) ( not ( = ?auto_113747 ?auto_113752 ) ) ( not ( = ?auto_113747 ?auto_113753 ) ) ( not ( = ?auto_113747 ?auto_113754 ) ) ( not ( = ?auto_113748 ?auto_113749 ) ) ( not ( = ?auto_113748 ?auto_113750 ) ) ( not ( = ?auto_113748 ?auto_113751 ) ) ( not ( = ?auto_113748 ?auto_113752 ) ) ( not ( = ?auto_113748 ?auto_113753 ) ) ( not ( = ?auto_113748 ?auto_113754 ) ) ( not ( = ?auto_113749 ?auto_113750 ) ) ( not ( = ?auto_113749 ?auto_113751 ) ) ( not ( = ?auto_113749 ?auto_113752 ) ) ( not ( = ?auto_113749 ?auto_113753 ) ) ( not ( = ?auto_113749 ?auto_113754 ) ) ( not ( = ?auto_113750 ?auto_113751 ) ) ( not ( = ?auto_113750 ?auto_113752 ) ) ( not ( = ?auto_113750 ?auto_113753 ) ) ( not ( = ?auto_113750 ?auto_113754 ) ) ( not ( = ?auto_113751 ?auto_113752 ) ) ( not ( = ?auto_113751 ?auto_113753 ) ) ( not ( = ?auto_113751 ?auto_113754 ) ) ( not ( = ?auto_113752 ?auto_113753 ) ) ( not ( = ?auto_113752 ?auto_113754 ) ) ( not ( = ?auto_113753 ?auto_113754 ) ) ( ON ?auto_113752 ?auto_113753 ) ( ON ?auto_113751 ?auto_113752 ) ( CLEAR ?auto_113749 ) ( ON ?auto_113750 ?auto_113751 ) ( CLEAR ?auto_113750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113747 ?auto_113748 ?auto_113749 ?auto_113750 )
      ( MAKE-7PILE ?auto_113747 ?auto_113748 ?auto_113749 ?auto_113750 ?auto_113751 ?auto_113752 ?auto_113753 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113777 - BLOCK
      ?auto_113778 - BLOCK
      ?auto_113779 - BLOCK
      ?auto_113780 - BLOCK
      ?auto_113781 - BLOCK
      ?auto_113782 - BLOCK
      ?auto_113783 - BLOCK
    )
    :vars
    (
      ?auto_113784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113783 ?auto_113784 ) ( ON-TABLE ?auto_113777 ) ( ON ?auto_113778 ?auto_113777 ) ( not ( = ?auto_113777 ?auto_113778 ) ) ( not ( = ?auto_113777 ?auto_113779 ) ) ( not ( = ?auto_113777 ?auto_113780 ) ) ( not ( = ?auto_113777 ?auto_113781 ) ) ( not ( = ?auto_113777 ?auto_113782 ) ) ( not ( = ?auto_113777 ?auto_113783 ) ) ( not ( = ?auto_113777 ?auto_113784 ) ) ( not ( = ?auto_113778 ?auto_113779 ) ) ( not ( = ?auto_113778 ?auto_113780 ) ) ( not ( = ?auto_113778 ?auto_113781 ) ) ( not ( = ?auto_113778 ?auto_113782 ) ) ( not ( = ?auto_113778 ?auto_113783 ) ) ( not ( = ?auto_113778 ?auto_113784 ) ) ( not ( = ?auto_113779 ?auto_113780 ) ) ( not ( = ?auto_113779 ?auto_113781 ) ) ( not ( = ?auto_113779 ?auto_113782 ) ) ( not ( = ?auto_113779 ?auto_113783 ) ) ( not ( = ?auto_113779 ?auto_113784 ) ) ( not ( = ?auto_113780 ?auto_113781 ) ) ( not ( = ?auto_113780 ?auto_113782 ) ) ( not ( = ?auto_113780 ?auto_113783 ) ) ( not ( = ?auto_113780 ?auto_113784 ) ) ( not ( = ?auto_113781 ?auto_113782 ) ) ( not ( = ?auto_113781 ?auto_113783 ) ) ( not ( = ?auto_113781 ?auto_113784 ) ) ( not ( = ?auto_113782 ?auto_113783 ) ) ( not ( = ?auto_113782 ?auto_113784 ) ) ( not ( = ?auto_113783 ?auto_113784 ) ) ( ON ?auto_113782 ?auto_113783 ) ( ON ?auto_113781 ?auto_113782 ) ( ON ?auto_113780 ?auto_113781 ) ( CLEAR ?auto_113778 ) ( ON ?auto_113779 ?auto_113780 ) ( CLEAR ?auto_113779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113777 ?auto_113778 ?auto_113779 )
      ( MAKE-7PILE ?auto_113777 ?auto_113778 ?auto_113779 ?auto_113780 ?auto_113781 ?auto_113782 ?auto_113783 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113807 - BLOCK
      ?auto_113808 - BLOCK
      ?auto_113809 - BLOCK
      ?auto_113810 - BLOCK
      ?auto_113811 - BLOCK
      ?auto_113812 - BLOCK
      ?auto_113813 - BLOCK
    )
    :vars
    (
      ?auto_113814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113813 ?auto_113814 ) ( ON-TABLE ?auto_113807 ) ( not ( = ?auto_113807 ?auto_113808 ) ) ( not ( = ?auto_113807 ?auto_113809 ) ) ( not ( = ?auto_113807 ?auto_113810 ) ) ( not ( = ?auto_113807 ?auto_113811 ) ) ( not ( = ?auto_113807 ?auto_113812 ) ) ( not ( = ?auto_113807 ?auto_113813 ) ) ( not ( = ?auto_113807 ?auto_113814 ) ) ( not ( = ?auto_113808 ?auto_113809 ) ) ( not ( = ?auto_113808 ?auto_113810 ) ) ( not ( = ?auto_113808 ?auto_113811 ) ) ( not ( = ?auto_113808 ?auto_113812 ) ) ( not ( = ?auto_113808 ?auto_113813 ) ) ( not ( = ?auto_113808 ?auto_113814 ) ) ( not ( = ?auto_113809 ?auto_113810 ) ) ( not ( = ?auto_113809 ?auto_113811 ) ) ( not ( = ?auto_113809 ?auto_113812 ) ) ( not ( = ?auto_113809 ?auto_113813 ) ) ( not ( = ?auto_113809 ?auto_113814 ) ) ( not ( = ?auto_113810 ?auto_113811 ) ) ( not ( = ?auto_113810 ?auto_113812 ) ) ( not ( = ?auto_113810 ?auto_113813 ) ) ( not ( = ?auto_113810 ?auto_113814 ) ) ( not ( = ?auto_113811 ?auto_113812 ) ) ( not ( = ?auto_113811 ?auto_113813 ) ) ( not ( = ?auto_113811 ?auto_113814 ) ) ( not ( = ?auto_113812 ?auto_113813 ) ) ( not ( = ?auto_113812 ?auto_113814 ) ) ( not ( = ?auto_113813 ?auto_113814 ) ) ( ON ?auto_113812 ?auto_113813 ) ( ON ?auto_113811 ?auto_113812 ) ( ON ?auto_113810 ?auto_113811 ) ( ON ?auto_113809 ?auto_113810 ) ( CLEAR ?auto_113807 ) ( ON ?auto_113808 ?auto_113809 ) ( CLEAR ?auto_113808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113807 ?auto_113808 )
      ( MAKE-7PILE ?auto_113807 ?auto_113808 ?auto_113809 ?auto_113810 ?auto_113811 ?auto_113812 ?auto_113813 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113837 - BLOCK
      ?auto_113838 - BLOCK
      ?auto_113839 - BLOCK
      ?auto_113840 - BLOCK
      ?auto_113841 - BLOCK
      ?auto_113842 - BLOCK
      ?auto_113843 - BLOCK
    )
    :vars
    (
      ?auto_113844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113843 ?auto_113844 ) ( not ( = ?auto_113837 ?auto_113838 ) ) ( not ( = ?auto_113837 ?auto_113839 ) ) ( not ( = ?auto_113837 ?auto_113840 ) ) ( not ( = ?auto_113837 ?auto_113841 ) ) ( not ( = ?auto_113837 ?auto_113842 ) ) ( not ( = ?auto_113837 ?auto_113843 ) ) ( not ( = ?auto_113837 ?auto_113844 ) ) ( not ( = ?auto_113838 ?auto_113839 ) ) ( not ( = ?auto_113838 ?auto_113840 ) ) ( not ( = ?auto_113838 ?auto_113841 ) ) ( not ( = ?auto_113838 ?auto_113842 ) ) ( not ( = ?auto_113838 ?auto_113843 ) ) ( not ( = ?auto_113838 ?auto_113844 ) ) ( not ( = ?auto_113839 ?auto_113840 ) ) ( not ( = ?auto_113839 ?auto_113841 ) ) ( not ( = ?auto_113839 ?auto_113842 ) ) ( not ( = ?auto_113839 ?auto_113843 ) ) ( not ( = ?auto_113839 ?auto_113844 ) ) ( not ( = ?auto_113840 ?auto_113841 ) ) ( not ( = ?auto_113840 ?auto_113842 ) ) ( not ( = ?auto_113840 ?auto_113843 ) ) ( not ( = ?auto_113840 ?auto_113844 ) ) ( not ( = ?auto_113841 ?auto_113842 ) ) ( not ( = ?auto_113841 ?auto_113843 ) ) ( not ( = ?auto_113841 ?auto_113844 ) ) ( not ( = ?auto_113842 ?auto_113843 ) ) ( not ( = ?auto_113842 ?auto_113844 ) ) ( not ( = ?auto_113843 ?auto_113844 ) ) ( ON ?auto_113842 ?auto_113843 ) ( ON ?auto_113841 ?auto_113842 ) ( ON ?auto_113840 ?auto_113841 ) ( ON ?auto_113839 ?auto_113840 ) ( ON ?auto_113838 ?auto_113839 ) ( ON ?auto_113837 ?auto_113838 ) ( CLEAR ?auto_113837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113837 )
      ( MAKE-7PILE ?auto_113837 ?auto_113838 ?auto_113839 ?auto_113840 ?auto_113841 ?auto_113842 ?auto_113843 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_113868 - BLOCK
      ?auto_113869 - BLOCK
      ?auto_113870 - BLOCK
      ?auto_113871 - BLOCK
      ?auto_113872 - BLOCK
      ?auto_113873 - BLOCK
      ?auto_113874 - BLOCK
      ?auto_113875 - BLOCK
    )
    :vars
    (
      ?auto_113876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_113874 ) ( ON ?auto_113875 ?auto_113876 ) ( CLEAR ?auto_113875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113868 ) ( ON ?auto_113869 ?auto_113868 ) ( ON ?auto_113870 ?auto_113869 ) ( ON ?auto_113871 ?auto_113870 ) ( ON ?auto_113872 ?auto_113871 ) ( ON ?auto_113873 ?auto_113872 ) ( ON ?auto_113874 ?auto_113873 ) ( not ( = ?auto_113868 ?auto_113869 ) ) ( not ( = ?auto_113868 ?auto_113870 ) ) ( not ( = ?auto_113868 ?auto_113871 ) ) ( not ( = ?auto_113868 ?auto_113872 ) ) ( not ( = ?auto_113868 ?auto_113873 ) ) ( not ( = ?auto_113868 ?auto_113874 ) ) ( not ( = ?auto_113868 ?auto_113875 ) ) ( not ( = ?auto_113868 ?auto_113876 ) ) ( not ( = ?auto_113869 ?auto_113870 ) ) ( not ( = ?auto_113869 ?auto_113871 ) ) ( not ( = ?auto_113869 ?auto_113872 ) ) ( not ( = ?auto_113869 ?auto_113873 ) ) ( not ( = ?auto_113869 ?auto_113874 ) ) ( not ( = ?auto_113869 ?auto_113875 ) ) ( not ( = ?auto_113869 ?auto_113876 ) ) ( not ( = ?auto_113870 ?auto_113871 ) ) ( not ( = ?auto_113870 ?auto_113872 ) ) ( not ( = ?auto_113870 ?auto_113873 ) ) ( not ( = ?auto_113870 ?auto_113874 ) ) ( not ( = ?auto_113870 ?auto_113875 ) ) ( not ( = ?auto_113870 ?auto_113876 ) ) ( not ( = ?auto_113871 ?auto_113872 ) ) ( not ( = ?auto_113871 ?auto_113873 ) ) ( not ( = ?auto_113871 ?auto_113874 ) ) ( not ( = ?auto_113871 ?auto_113875 ) ) ( not ( = ?auto_113871 ?auto_113876 ) ) ( not ( = ?auto_113872 ?auto_113873 ) ) ( not ( = ?auto_113872 ?auto_113874 ) ) ( not ( = ?auto_113872 ?auto_113875 ) ) ( not ( = ?auto_113872 ?auto_113876 ) ) ( not ( = ?auto_113873 ?auto_113874 ) ) ( not ( = ?auto_113873 ?auto_113875 ) ) ( not ( = ?auto_113873 ?auto_113876 ) ) ( not ( = ?auto_113874 ?auto_113875 ) ) ( not ( = ?auto_113874 ?auto_113876 ) ) ( not ( = ?auto_113875 ?auto_113876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113875 ?auto_113876 )
      ( !STACK ?auto_113875 ?auto_113874 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_113902 - BLOCK
      ?auto_113903 - BLOCK
      ?auto_113904 - BLOCK
      ?auto_113905 - BLOCK
      ?auto_113906 - BLOCK
      ?auto_113907 - BLOCK
      ?auto_113908 - BLOCK
      ?auto_113909 - BLOCK
    )
    :vars
    (
      ?auto_113910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113909 ?auto_113910 ) ( ON-TABLE ?auto_113902 ) ( ON ?auto_113903 ?auto_113902 ) ( ON ?auto_113904 ?auto_113903 ) ( ON ?auto_113905 ?auto_113904 ) ( ON ?auto_113906 ?auto_113905 ) ( ON ?auto_113907 ?auto_113906 ) ( not ( = ?auto_113902 ?auto_113903 ) ) ( not ( = ?auto_113902 ?auto_113904 ) ) ( not ( = ?auto_113902 ?auto_113905 ) ) ( not ( = ?auto_113902 ?auto_113906 ) ) ( not ( = ?auto_113902 ?auto_113907 ) ) ( not ( = ?auto_113902 ?auto_113908 ) ) ( not ( = ?auto_113902 ?auto_113909 ) ) ( not ( = ?auto_113902 ?auto_113910 ) ) ( not ( = ?auto_113903 ?auto_113904 ) ) ( not ( = ?auto_113903 ?auto_113905 ) ) ( not ( = ?auto_113903 ?auto_113906 ) ) ( not ( = ?auto_113903 ?auto_113907 ) ) ( not ( = ?auto_113903 ?auto_113908 ) ) ( not ( = ?auto_113903 ?auto_113909 ) ) ( not ( = ?auto_113903 ?auto_113910 ) ) ( not ( = ?auto_113904 ?auto_113905 ) ) ( not ( = ?auto_113904 ?auto_113906 ) ) ( not ( = ?auto_113904 ?auto_113907 ) ) ( not ( = ?auto_113904 ?auto_113908 ) ) ( not ( = ?auto_113904 ?auto_113909 ) ) ( not ( = ?auto_113904 ?auto_113910 ) ) ( not ( = ?auto_113905 ?auto_113906 ) ) ( not ( = ?auto_113905 ?auto_113907 ) ) ( not ( = ?auto_113905 ?auto_113908 ) ) ( not ( = ?auto_113905 ?auto_113909 ) ) ( not ( = ?auto_113905 ?auto_113910 ) ) ( not ( = ?auto_113906 ?auto_113907 ) ) ( not ( = ?auto_113906 ?auto_113908 ) ) ( not ( = ?auto_113906 ?auto_113909 ) ) ( not ( = ?auto_113906 ?auto_113910 ) ) ( not ( = ?auto_113907 ?auto_113908 ) ) ( not ( = ?auto_113907 ?auto_113909 ) ) ( not ( = ?auto_113907 ?auto_113910 ) ) ( not ( = ?auto_113908 ?auto_113909 ) ) ( not ( = ?auto_113908 ?auto_113910 ) ) ( not ( = ?auto_113909 ?auto_113910 ) ) ( CLEAR ?auto_113907 ) ( ON ?auto_113908 ?auto_113909 ) ( CLEAR ?auto_113908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113902 ?auto_113903 ?auto_113904 ?auto_113905 ?auto_113906 ?auto_113907 ?auto_113908 )
      ( MAKE-8PILE ?auto_113902 ?auto_113903 ?auto_113904 ?auto_113905 ?auto_113906 ?auto_113907 ?auto_113908 ?auto_113909 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_113936 - BLOCK
      ?auto_113937 - BLOCK
      ?auto_113938 - BLOCK
      ?auto_113939 - BLOCK
      ?auto_113940 - BLOCK
      ?auto_113941 - BLOCK
      ?auto_113942 - BLOCK
      ?auto_113943 - BLOCK
    )
    :vars
    (
      ?auto_113944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113943 ?auto_113944 ) ( ON-TABLE ?auto_113936 ) ( ON ?auto_113937 ?auto_113936 ) ( ON ?auto_113938 ?auto_113937 ) ( ON ?auto_113939 ?auto_113938 ) ( ON ?auto_113940 ?auto_113939 ) ( not ( = ?auto_113936 ?auto_113937 ) ) ( not ( = ?auto_113936 ?auto_113938 ) ) ( not ( = ?auto_113936 ?auto_113939 ) ) ( not ( = ?auto_113936 ?auto_113940 ) ) ( not ( = ?auto_113936 ?auto_113941 ) ) ( not ( = ?auto_113936 ?auto_113942 ) ) ( not ( = ?auto_113936 ?auto_113943 ) ) ( not ( = ?auto_113936 ?auto_113944 ) ) ( not ( = ?auto_113937 ?auto_113938 ) ) ( not ( = ?auto_113937 ?auto_113939 ) ) ( not ( = ?auto_113937 ?auto_113940 ) ) ( not ( = ?auto_113937 ?auto_113941 ) ) ( not ( = ?auto_113937 ?auto_113942 ) ) ( not ( = ?auto_113937 ?auto_113943 ) ) ( not ( = ?auto_113937 ?auto_113944 ) ) ( not ( = ?auto_113938 ?auto_113939 ) ) ( not ( = ?auto_113938 ?auto_113940 ) ) ( not ( = ?auto_113938 ?auto_113941 ) ) ( not ( = ?auto_113938 ?auto_113942 ) ) ( not ( = ?auto_113938 ?auto_113943 ) ) ( not ( = ?auto_113938 ?auto_113944 ) ) ( not ( = ?auto_113939 ?auto_113940 ) ) ( not ( = ?auto_113939 ?auto_113941 ) ) ( not ( = ?auto_113939 ?auto_113942 ) ) ( not ( = ?auto_113939 ?auto_113943 ) ) ( not ( = ?auto_113939 ?auto_113944 ) ) ( not ( = ?auto_113940 ?auto_113941 ) ) ( not ( = ?auto_113940 ?auto_113942 ) ) ( not ( = ?auto_113940 ?auto_113943 ) ) ( not ( = ?auto_113940 ?auto_113944 ) ) ( not ( = ?auto_113941 ?auto_113942 ) ) ( not ( = ?auto_113941 ?auto_113943 ) ) ( not ( = ?auto_113941 ?auto_113944 ) ) ( not ( = ?auto_113942 ?auto_113943 ) ) ( not ( = ?auto_113942 ?auto_113944 ) ) ( not ( = ?auto_113943 ?auto_113944 ) ) ( ON ?auto_113942 ?auto_113943 ) ( CLEAR ?auto_113940 ) ( ON ?auto_113941 ?auto_113942 ) ( CLEAR ?auto_113941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113936 ?auto_113937 ?auto_113938 ?auto_113939 ?auto_113940 ?auto_113941 )
      ( MAKE-8PILE ?auto_113936 ?auto_113937 ?auto_113938 ?auto_113939 ?auto_113940 ?auto_113941 ?auto_113942 ?auto_113943 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_113970 - BLOCK
      ?auto_113971 - BLOCK
      ?auto_113972 - BLOCK
      ?auto_113973 - BLOCK
      ?auto_113974 - BLOCK
      ?auto_113975 - BLOCK
      ?auto_113976 - BLOCK
      ?auto_113977 - BLOCK
    )
    :vars
    (
      ?auto_113978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113977 ?auto_113978 ) ( ON-TABLE ?auto_113970 ) ( ON ?auto_113971 ?auto_113970 ) ( ON ?auto_113972 ?auto_113971 ) ( ON ?auto_113973 ?auto_113972 ) ( not ( = ?auto_113970 ?auto_113971 ) ) ( not ( = ?auto_113970 ?auto_113972 ) ) ( not ( = ?auto_113970 ?auto_113973 ) ) ( not ( = ?auto_113970 ?auto_113974 ) ) ( not ( = ?auto_113970 ?auto_113975 ) ) ( not ( = ?auto_113970 ?auto_113976 ) ) ( not ( = ?auto_113970 ?auto_113977 ) ) ( not ( = ?auto_113970 ?auto_113978 ) ) ( not ( = ?auto_113971 ?auto_113972 ) ) ( not ( = ?auto_113971 ?auto_113973 ) ) ( not ( = ?auto_113971 ?auto_113974 ) ) ( not ( = ?auto_113971 ?auto_113975 ) ) ( not ( = ?auto_113971 ?auto_113976 ) ) ( not ( = ?auto_113971 ?auto_113977 ) ) ( not ( = ?auto_113971 ?auto_113978 ) ) ( not ( = ?auto_113972 ?auto_113973 ) ) ( not ( = ?auto_113972 ?auto_113974 ) ) ( not ( = ?auto_113972 ?auto_113975 ) ) ( not ( = ?auto_113972 ?auto_113976 ) ) ( not ( = ?auto_113972 ?auto_113977 ) ) ( not ( = ?auto_113972 ?auto_113978 ) ) ( not ( = ?auto_113973 ?auto_113974 ) ) ( not ( = ?auto_113973 ?auto_113975 ) ) ( not ( = ?auto_113973 ?auto_113976 ) ) ( not ( = ?auto_113973 ?auto_113977 ) ) ( not ( = ?auto_113973 ?auto_113978 ) ) ( not ( = ?auto_113974 ?auto_113975 ) ) ( not ( = ?auto_113974 ?auto_113976 ) ) ( not ( = ?auto_113974 ?auto_113977 ) ) ( not ( = ?auto_113974 ?auto_113978 ) ) ( not ( = ?auto_113975 ?auto_113976 ) ) ( not ( = ?auto_113975 ?auto_113977 ) ) ( not ( = ?auto_113975 ?auto_113978 ) ) ( not ( = ?auto_113976 ?auto_113977 ) ) ( not ( = ?auto_113976 ?auto_113978 ) ) ( not ( = ?auto_113977 ?auto_113978 ) ) ( ON ?auto_113976 ?auto_113977 ) ( ON ?auto_113975 ?auto_113976 ) ( CLEAR ?auto_113973 ) ( ON ?auto_113974 ?auto_113975 ) ( CLEAR ?auto_113974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113970 ?auto_113971 ?auto_113972 ?auto_113973 ?auto_113974 )
      ( MAKE-8PILE ?auto_113970 ?auto_113971 ?auto_113972 ?auto_113973 ?auto_113974 ?auto_113975 ?auto_113976 ?auto_113977 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_114004 - BLOCK
      ?auto_114005 - BLOCK
      ?auto_114006 - BLOCK
      ?auto_114007 - BLOCK
      ?auto_114008 - BLOCK
      ?auto_114009 - BLOCK
      ?auto_114010 - BLOCK
      ?auto_114011 - BLOCK
    )
    :vars
    (
      ?auto_114012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114011 ?auto_114012 ) ( ON-TABLE ?auto_114004 ) ( ON ?auto_114005 ?auto_114004 ) ( ON ?auto_114006 ?auto_114005 ) ( not ( = ?auto_114004 ?auto_114005 ) ) ( not ( = ?auto_114004 ?auto_114006 ) ) ( not ( = ?auto_114004 ?auto_114007 ) ) ( not ( = ?auto_114004 ?auto_114008 ) ) ( not ( = ?auto_114004 ?auto_114009 ) ) ( not ( = ?auto_114004 ?auto_114010 ) ) ( not ( = ?auto_114004 ?auto_114011 ) ) ( not ( = ?auto_114004 ?auto_114012 ) ) ( not ( = ?auto_114005 ?auto_114006 ) ) ( not ( = ?auto_114005 ?auto_114007 ) ) ( not ( = ?auto_114005 ?auto_114008 ) ) ( not ( = ?auto_114005 ?auto_114009 ) ) ( not ( = ?auto_114005 ?auto_114010 ) ) ( not ( = ?auto_114005 ?auto_114011 ) ) ( not ( = ?auto_114005 ?auto_114012 ) ) ( not ( = ?auto_114006 ?auto_114007 ) ) ( not ( = ?auto_114006 ?auto_114008 ) ) ( not ( = ?auto_114006 ?auto_114009 ) ) ( not ( = ?auto_114006 ?auto_114010 ) ) ( not ( = ?auto_114006 ?auto_114011 ) ) ( not ( = ?auto_114006 ?auto_114012 ) ) ( not ( = ?auto_114007 ?auto_114008 ) ) ( not ( = ?auto_114007 ?auto_114009 ) ) ( not ( = ?auto_114007 ?auto_114010 ) ) ( not ( = ?auto_114007 ?auto_114011 ) ) ( not ( = ?auto_114007 ?auto_114012 ) ) ( not ( = ?auto_114008 ?auto_114009 ) ) ( not ( = ?auto_114008 ?auto_114010 ) ) ( not ( = ?auto_114008 ?auto_114011 ) ) ( not ( = ?auto_114008 ?auto_114012 ) ) ( not ( = ?auto_114009 ?auto_114010 ) ) ( not ( = ?auto_114009 ?auto_114011 ) ) ( not ( = ?auto_114009 ?auto_114012 ) ) ( not ( = ?auto_114010 ?auto_114011 ) ) ( not ( = ?auto_114010 ?auto_114012 ) ) ( not ( = ?auto_114011 ?auto_114012 ) ) ( ON ?auto_114010 ?auto_114011 ) ( ON ?auto_114009 ?auto_114010 ) ( ON ?auto_114008 ?auto_114009 ) ( CLEAR ?auto_114006 ) ( ON ?auto_114007 ?auto_114008 ) ( CLEAR ?auto_114007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114004 ?auto_114005 ?auto_114006 ?auto_114007 )
      ( MAKE-8PILE ?auto_114004 ?auto_114005 ?auto_114006 ?auto_114007 ?auto_114008 ?auto_114009 ?auto_114010 ?auto_114011 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_114038 - BLOCK
      ?auto_114039 - BLOCK
      ?auto_114040 - BLOCK
      ?auto_114041 - BLOCK
      ?auto_114042 - BLOCK
      ?auto_114043 - BLOCK
      ?auto_114044 - BLOCK
      ?auto_114045 - BLOCK
    )
    :vars
    (
      ?auto_114046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114045 ?auto_114046 ) ( ON-TABLE ?auto_114038 ) ( ON ?auto_114039 ?auto_114038 ) ( not ( = ?auto_114038 ?auto_114039 ) ) ( not ( = ?auto_114038 ?auto_114040 ) ) ( not ( = ?auto_114038 ?auto_114041 ) ) ( not ( = ?auto_114038 ?auto_114042 ) ) ( not ( = ?auto_114038 ?auto_114043 ) ) ( not ( = ?auto_114038 ?auto_114044 ) ) ( not ( = ?auto_114038 ?auto_114045 ) ) ( not ( = ?auto_114038 ?auto_114046 ) ) ( not ( = ?auto_114039 ?auto_114040 ) ) ( not ( = ?auto_114039 ?auto_114041 ) ) ( not ( = ?auto_114039 ?auto_114042 ) ) ( not ( = ?auto_114039 ?auto_114043 ) ) ( not ( = ?auto_114039 ?auto_114044 ) ) ( not ( = ?auto_114039 ?auto_114045 ) ) ( not ( = ?auto_114039 ?auto_114046 ) ) ( not ( = ?auto_114040 ?auto_114041 ) ) ( not ( = ?auto_114040 ?auto_114042 ) ) ( not ( = ?auto_114040 ?auto_114043 ) ) ( not ( = ?auto_114040 ?auto_114044 ) ) ( not ( = ?auto_114040 ?auto_114045 ) ) ( not ( = ?auto_114040 ?auto_114046 ) ) ( not ( = ?auto_114041 ?auto_114042 ) ) ( not ( = ?auto_114041 ?auto_114043 ) ) ( not ( = ?auto_114041 ?auto_114044 ) ) ( not ( = ?auto_114041 ?auto_114045 ) ) ( not ( = ?auto_114041 ?auto_114046 ) ) ( not ( = ?auto_114042 ?auto_114043 ) ) ( not ( = ?auto_114042 ?auto_114044 ) ) ( not ( = ?auto_114042 ?auto_114045 ) ) ( not ( = ?auto_114042 ?auto_114046 ) ) ( not ( = ?auto_114043 ?auto_114044 ) ) ( not ( = ?auto_114043 ?auto_114045 ) ) ( not ( = ?auto_114043 ?auto_114046 ) ) ( not ( = ?auto_114044 ?auto_114045 ) ) ( not ( = ?auto_114044 ?auto_114046 ) ) ( not ( = ?auto_114045 ?auto_114046 ) ) ( ON ?auto_114044 ?auto_114045 ) ( ON ?auto_114043 ?auto_114044 ) ( ON ?auto_114042 ?auto_114043 ) ( ON ?auto_114041 ?auto_114042 ) ( CLEAR ?auto_114039 ) ( ON ?auto_114040 ?auto_114041 ) ( CLEAR ?auto_114040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114038 ?auto_114039 ?auto_114040 )
      ( MAKE-8PILE ?auto_114038 ?auto_114039 ?auto_114040 ?auto_114041 ?auto_114042 ?auto_114043 ?auto_114044 ?auto_114045 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_114072 - BLOCK
      ?auto_114073 - BLOCK
      ?auto_114074 - BLOCK
      ?auto_114075 - BLOCK
      ?auto_114076 - BLOCK
      ?auto_114077 - BLOCK
      ?auto_114078 - BLOCK
      ?auto_114079 - BLOCK
    )
    :vars
    (
      ?auto_114080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114079 ?auto_114080 ) ( ON-TABLE ?auto_114072 ) ( not ( = ?auto_114072 ?auto_114073 ) ) ( not ( = ?auto_114072 ?auto_114074 ) ) ( not ( = ?auto_114072 ?auto_114075 ) ) ( not ( = ?auto_114072 ?auto_114076 ) ) ( not ( = ?auto_114072 ?auto_114077 ) ) ( not ( = ?auto_114072 ?auto_114078 ) ) ( not ( = ?auto_114072 ?auto_114079 ) ) ( not ( = ?auto_114072 ?auto_114080 ) ) ( not ( = ?auto_114073 ?auto_114074 ) ) ( not ( = ?auto_114073 ?auto_114075 ) ) ( not ( = ?auto_114073 ?auto_114076 ) ) ( not ( = ?auto_114073 ?auto_114077 ) ) ( not ( = ?auto_114073 ?auto_114078 ) ) ( not ( = ?auto_114073 ?auto_114079 ) ) ( not ( = ?auto_114073 ?auto_114080 ) ) ( not ( = ?auto_114074 ?auto_114075 ) ) ( not ( = ?auto_114074 ?auto_114076 ) ) ( not ( = ?auto_114074 ?auto_114077 ) ) ( not ( = ?auto_114074 ?auto_114078 ) ) ( not ( = ?auto_114074 ?auto_114079 ) ) ( not ( = ?auto_114074 ?auto_114080 ) ) ( not ( = ?auto_114075 ?auto_114076 ) ) ( not ( = ?auto_114075 ?auto_114077 ) ) ( not ( = ?auto_114075 ?auto_114078 ) ) ( not ( = ?auto_114075 ?auto_114079 ) ) ( not ( = ?auto_114075 ?auto_114080 ) ) ( not ( = ?auto_114076 ?auto_114077 ) ) ( not ( = ?auto_114076 ?auto_114078 ) ) ( not ( = ?auto_114076 ?auto_114079 ) ) ( not ( = ?auto_114076 ?auto_114080 ) ) ( not ( = ?auto_114077 ?auto_114078 ) ) ( not ( = ?auto_114077 ?auto_114079 ) ) ( not ( = ?auto_114077 ?auto_114080 ) ) ( not ( = ?auto_114078 ?auto_114079 ) ) ( not ( = ?auto_114078 ?auto_114080 ) ) ( not ( = ?auto_114079 ?auto_114080 ) ) ( ON ?auto_114078 ?auto_114079 ) ( ON ?auto_114077 ?auto_114078 ) ( ON ?auto_114076 ?auto_114077 ) ( ON ?auto_114075 ?auto_114076 ) ( ON ?auto_114074 ?auto_114075 ) ( CLEAR ?auto_114072 ) ( ON ?auto_114073 ?auto_114074 ) ( CLEAR ?auto_114073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114072 ?auto_114073 )
      ( MAKE-8PILE ?auto_114072 ?auto_114073 ?auto_114074 ?auto_114075 ?auto_114076 ?auto_114077 ?auto_114078 ?auto_114079 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_114106 - BLOCK
      ?auto_114107 - BLOCK
      ?auto_114108 - BLOCK
      ?auto_114109 - BLOCK
      ?auto_114110 - BLOCK
      ?auto_114111 - BLOCK
      ?auto_114112 - BLOCK
      ?auto_114113 - BLOCK
    )
    :vars
    (
      ?auto_114114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114113 ?auto_114114 ) ( not ( = ?auto_114106 ?auto_114107 ) ) ( not ( = ?auto_114106 ?auto_114108 ) ) ( not ( = ?auto_114106 ?auto_114109 ) ) ( not ( = ?auto_114106 ?auto_114110 ) ) ( not ( = ?auto_114106 ?auto_114111 ) ) ( not ( = ?auto_114106 ?auto_114112 ) ) ( not ( = ?auto_114106 ?auto_114113 ) ) ( not ( = ?auto_114106 ?auto_114114 ) ) ( not ( = ?auto_114107 ?auto_114108 ) ) ( not ( = ?auto_114107 ?auto_114109 ) ) ( not ( = ?auto_114107 ?auto_114110 ) ) ( not ( = ?auto_114107 ?auto_114111 ) ) ( not ( = ?auto_114107 ?auto_114112 ) ) ( not ( = ?auto_114107 ?auto_114113 ) ) ( not ( = ?auto_114107 ?auto_114114 ) ) ( not ( = ?auto_114108 ?auto_114109 ) ) ( not ( = ?auto_114108 ?auto_114110 ) ) ( not ( = ?auto_114108 ?auto_114111 ) ) ( not ( = ?auto_114108 ?auto_114112 ) ) ( not ( = ?auto_114108 ?auto_114113 ) ) ( not ( = ?auto_114108 ?auto_114114 ) ) ( not ( = ?auto_114109 ?auto_114110 ) ) ( not ( = ?auto_114109 ?auto_114111 ) ) ( not ( = ?auto_114109 ?auto_114112 ) ) ( not ( = ?auto_114109 ?auto_114113 ) ) ( not ( = ?auto_114109 ?auto_114114 ) ) ( not ( = ?auto_114110 ?auto_114111 ) ) ( not ( = ?auto_114110 ?auto_114112 ) ) ( not ( = ?auto_114110 ?auto_114113 ) ) ( not ( = ?auto_114110 ?auto_114114 ) ) ( not ( = ?auto_114111 ?auto_114112 ) ) ( not ( = ?auto_114111 ?auto_114113 ) ) ( not ( = ?auto_114111 ?auto_114114 ) ) ( not ( = ?auto_114112 ?auto_114113 ) ) ( not ( = ?auto_114112 ?auto_114114 ) ) ( not ( = ?auto_114113 ?auto_114114 ) ) ( ON ?auto_114112 ?auto_114113 ) ( ON ?auto_114111 ?auto_114112 ) ( ON ?auto_114110 ?auto_114111 ) ( ON ?auto_114109 ?auto_114110 ) ( ON ?auto_114108 ?auto_114109 ) ( ON ?auto_114107 ?auto_114108 ) ( ON ?auto_114106 ?auto_114107 ) ( CLEAR ?auto_114106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114106 )
      ( MAKE-8PILE ?auto_114106 ?auto_114107 ?auto_114108 ?auto_114109 ?auto_114110 ?auto_114111 ?auto_114112 ?auto_114113 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_114141 - BLOCK
      ?auto_114142 - BLOCK
      ?auto_114143 - BLOCK
      ?auto_114144 - BLOCK
      ?auto_114145 - BLOCK
      ?auto_114146 - BLOCK
      ?auto_114147 - BLOCK
      ?auto_114148 - BLOCK
      ?auto_114149 - BLOCK
    )
    :vars
    (
      ?auto_114150 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_114148 ) ( ON ?auto_114149 ?auto_114150 ) ( CLEAR ?auto_114149 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114141 ) ( ON ?auto_114142 ?auto_114141 ) ( ON ?auto_114143 ?auto_114142 ) ( ON ?auto_114144 ?auto_114143 ) ( ON ?auto_114145 ?auto_114144 ) ( ON ?auto_114146 ?auto_114145 ) ( ON ?auto_114147 ?auto_114146 ) ( ON ?auto_114148 ?auto_114147 ) ( not ( = ?auto_114141 ?auto_114142 ) ) ( not ( = ?auto_114141 ?auto_114143 ) ) ( not ( = ?auto_114141 ?auto_114144 ) ) ( not ( = ?auto_114141 ?auto_114145 ) ) ( not ( = ?auto_114141 ?auto_114146 ) ) ( not ( = ?auto_114141 ?auto_114147 ) ) ( not ( = ?auto_114141 ?auto_114148 ) ) ( not ( = ?auto_114141 ?auto_114149 ) ) ( not ( = ?auto_114141 ?auto_114150 ) ) ( not ( = ?auto_114142 ?auto_114143 ) ) ( not ( = ?auto_114142 ?auto_114144 ) ) ( not ( = ?auto_114142 ?auto_114145 ) ) ( not ( = ?auto_114142 ?auto_114146 ) ) ( not ( = ?auto_114142 ?auto_114147 ) ) ( not ( = ?auto_114142 ?auto_114148 ) ) ( not ( = ?auto_114142 ?auto_114149 ) ) ( not ( = ?auto_114142 ?auto_114150 ) ) ( not ( = ?auto_114143 ?auto_114144 ) ) ( not ( = ?auto_114143 ?auto_114145 ) ) ( not ( = ?auto_114143 ?auto_114146 ) ) ( not ( = ?auto_114143 ?auto_114147 ) ) ( not ( = ?auto_114143 ?auto_114148 ) ) ( not ( = ?auto_114143 ?auto_114149 ) ) ( not ( = ?auto_114143 ?auto_114150 ) ) ( not ( = ?auto_114144 ?auto_114145 ) ) ( not ( = ?auto_114144 ?auto_114146 ) ) ( not ( = ?auto_114144 ?auto_114147 ) ) ( not ( = ?auto_114144 ?auto_114148 ) ) ( not ( = ?auto_114144 ?auto_114149 ) ) ( not ( = ?auto_114144 ?auto_114150 ) ) ( not ( = ?auto_114145 ?auto_114146 ) ) ( not ( = ?auto_114145 ?auto_114147 ) ) ( not ( = ?auto_114145 ?auto_114148 ) ) ( not ( = ?auto_114145 ?auto_114149 ) ) ( not ( = ?auto_114145 ?auto_114150 ) ) ( not ( = ?auto_114146 ?auto_114147 ) ) ( not ( = ?auto_114146 ?auto_114148 ) ) ( not ( = ?auto_114146 ?auto_114149 ) ) ( not ( = ?auto_114146 ?auto_114150 ) ) ( not ( = ?auto_114147 ?auto_114148 ) ) ( not ( = ?auto_114147 ?auto_114149 ) ) ( not ( = ?auto_114147 ?auto_114150 ) ) ( not ( = ?auto_114148 ?auto_114149 ) ) ( not ( = ?auto_114148 ?auto_114150 ) ) ( not ( = ?auto_114149 ?auto_114150 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114149 ?auto_114150 )
      ( !STACK ?auto_114149 ?auto_114148 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_114179 - BLOCK
      ?auto_114180 - BLOCK
      ?auto_114181 - BLOCK
      ?auto_114182 - BLOCK
      ?auto_114183 - BLOCK
      ?auto_114184 - BLOCK
      ?auto_114185 - BLOCK
      ?auto_114186 - BLOCK
      ?auto_114187 - BLOCK
    )
    :vars
    (
      ?auto_114188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114187 ?auto_114188 ) ( ON-TABLE ?auto_114179 ) ( ON ?auto_114180 ?auto_114179 ) ( ON ?auto_114181 ?auto_114180 ) ( ON ?auto_114182 ?auto_114181 ) ( ON ?auto_114183 ?auto_114182 ) ( ON ?auto_114184 ?auto_114183 ) ( ON ?auto_114185 ?auto_114184 ) ( not ( = ?auto_114179 ?auto_114180 ) ) ( not ( = ?auto_114179 ?auto_114181 ) ) ( not ( = ?auto_114179 ?auto_114182 ) ) ( not ( = ?auto_114179 ?auto_114183 ) ) ( not ( = ?auto_114179 ?auto_114184 ) ) ( not ( = ?auto_114179 ?auto_114185 ) ) ( not ( = ?auto_114179 ?auto_114186 ) ) ( not ( = ?auto_114179 ?auto_114187 ) ) ( not ( = ?auto_114179 ?auto_114188 ) ) ( not ( = ?auto_114180 ?auto_114181 ) ) ( not ( = ?auto_114180 ?auto_114182 ) ) ( not ( = ?auto_114180 ?auto_114183 ) ) ( not ( = ?auto_114180 ?auto_114184 ) ) ( not ( = ?auto_114180 ?auto_114185 ) ) ( not ( = ?auto_114180 ?auto_114186 ) ) ( not ( = ?auto_114180 ?auto_114187 ) ) ( not ( = ?auto_114180 ?auto_114188 ) ) ( not ( = ?auto_114181 ?auto_114182 ) ) ( not ( = ?auto_114181 ?auto_114183 ) ) ( not ( = ?auto_114181 ?auto_114184 ) ) ( not ( = ?auto_114181 ?auto_114185 ) ) ( not ( = ?auto_114181 ?auto_114186 ) ) ( not ( = ?auto_114181 ?auto_114187 ) ) ( not ( = ?auto_114181 ?auto_114188 ) ) ( not ( = ?auto_114182 ?auto_114183 ) ) ( not ( = ?auto_114182 ?auto_114184 ) ) ( not ( = ?auto_114182 ?auto_114185 ) ) ( not ( = ?auto_114182 ?auto_114186 ) ) ( not ( = ?auto_114182 ?auto_114187 ) ) ( not ( = ?auto_114182 ?auto_114188 ) ) ( not ( = ?auto_114183 ?auto_114184 ) ) ( not ( = ?auto_114183 ?auto_114185 ) ) ( not ( = ?auto_114183 ?auto_114186 ) ) ( not ( = ?auto_114183 ?auto_114187 ) ) ( not ( = ?auto_114183 ?auto_114188 ) ) ( not ( = ?auto_114184 ?auto_114185 ) ) ( not ( = ?auto_114184 ?auto_114186 ) ) ( not ( = ?auto_114184 ?auto_114187 ) ) ( not ( = ?auto_114184 ?auto_114188 ) ) ( not ( = ?auto_114185 ?auto_114186 ) ) ( not ( = ?auto_114185 ?auto_114187 ) ) ( not ( = ?auto_114185 ?auto_114188 ) ) ( not ( = ?auto_114186 ?auto_114187 ) ) ( not ( = ?auto_114186 ?auto_114188 ) ) ( not ( = ?auto_114187 ?auto_114188 ) ) ( CLEAR ?auto_114185 ) ( ON ?auto_114186 ?auto_114187 ) ( CLEAR ?auto_114186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_114179 ?auto_114180 ?auto_114181 ?auto_114182 ?auto_114183 ?auto_114184 ?auto_114185 ?auto_114186 )
      ( MAKE-9PILE ?auto_114179 ?auto_114180 ?auto_114181 ?auto_114182 ?auto_114183 ?auto_114184 ?auto_114185 ?auto_114186 ?auto_114187 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_114217 - BLOCK
      ?auto_114218 - BLOCK
      ?auto_114219 - BLOCK
      ?auto_114220 - BLOCK
      ?auto_114221 - BLOCK
      ?auto_114222 - BLOCK
      ?auto_114223 - BLOCK
      ?auto_114224 - BLOCK
      ?auto_114225 - BLOCK
    )
    :vars
    (
      ?auto_114226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114225 ?auto_114226 ) ( ON-TABLE ?auto_114217 ) ( ON ?auto_114218 ?auto_114217 ) ( ON ?auto_114219 ?auto_114218 ) ( ON ?auto_114220 ?auto_114219 ) ( ON ?auto_114221 ?auto_114220 ) ( ON ?auto_114222 ?auto_114221 ) ( not ( = ?auto_114217 ?auto_114218 ) ) ( not ( = ?auto_114217 ?auto_114219 ) ) ( not ( = ?auto_114217 ?auto_114220 ) ) ( not ( = ?auto_114217 ?auto_114221 ) ) ( not ( = ?auto_114217 ?auto_114222 ) ) ( not ( = ?auto_114217 ?auto_114223 ) ) ( not ( = ?auto_114217 ?auto_114224 ) ) ( not ( = ?auto_114217 ?auto_114225 ) ) ( not ( = ?auto_114217 ?auto_114226 ) ) ( not ( = ?auto_114218 ?auto_114219 ) ) ( not ( = ?auto_114218 ?auto_114220 ) ) ( not ( = ?auto_114218 ?auto_114221 ) ) ( not ( = ?auto_114218 ?auto_114222 ) ) ( not ( = ?auto_114218 ?auto_114223 ) ) ( not ( = ?auto_114218 ?auto_114224 ) ) ( not ( = ?auto_114218 ?auto_114225 ) ) ( not ( = ?auto_114218 ?auto_114226 ) ) ( not ( = ?auto_114219 ?auto_114220 ) ) ( not ( = ?auto_114219 ?auto_114221 ) ) ( not ( = ?auto_114219 ?auto_114222 ) ) ( not ( = ?auto_114219 ?auto_114223 ) ) ( not ( = ?auto_114219 ?auto_114224 ) ) ( not ( = ?auto_114219 ?auto_114225 ) ) ( not ( = ?auto_114219 ?auto_114226 ) ) ( not ( = ?auto_114220 ?auto_114221 ) ) ( not ( = ?auto_114220 ?auto_114222 ) ) ( not ( = ?auto_114220 ?auto_114223 ) ) ( not ( = ?auto_114220 ?auto_114224 ) ) ( not ( = ?auto_114220 ?auto_114225 ) ) ( not ( = ?auto_114220 ?auto_114226 ) ) ( not ( = ?auto_114221 ?auto_114222 ) ) ( not ( = ?auto_114221 ?auto_114223 ) ) ( not ( = ?auto_114221 ?auto_114224 ) ) ( not ( = ?auto_114221 ?auto_114225 ) ) ( not ( = ?auto_114221 ?auto_114226 ) ) ( not ( = ?auto_114222 ?auto_114223 ) ) ( not ( = ?auto_114222 ?auto_114224 ) ) ( not ( = ?auto_114222 ?auto_114225 ) ) ( not ( = ?auto_114222 ?auto_114226 ) ) ( not ( = ?auto_114223 ?auto_114224 ) ) ( not ( = ?auto_114223 ?auto_114225 ) ) ( not ( = ?auto_114223 ?auto_114226 ) ) ( not ( = ?auto_114224 ?auto_114225 ) ) ( not ( = ?auto_114224 ?auto_114226 ) ) ( not ( = ?auto_114225 ?auto_114226 ) ) ( ON ?auto_114224 ?auto_114225 ) ( CLEAR ?auto_114222 ) ( ON ?auto_114223 ?auto_114224 ) ( CLEAR ?auto_114223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114217 ?auto_114218 ?auto_114219 ?auto_114220 ?auto_114221 ?auto_114222 ?auto_114223 )
      ( MAKE-9PILE ?auto_114217 ?auto_114218 ?auto_114219 ?auto_114220 ?auto_114221 ?auto_114222 ?auto_114223 ?auto_114224 ?auto_114225 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_114255 - BLOCK
      ?auto_114256 - BLOCK
      ?auto_114257 - BLOCK
      ?auto_114258 - BLOCK
      ?auto_114259 - BLOCK
      ?auto_114260 - BLOCK
      ?auto_114261 - BLOCK
      ?auto_114262 - BLOCK
      ?auto_114263 - BLOCK
    )
    :vars
    (
      ?auto_114264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114263 ?auto_114264 ) ( ON-TABLE ?auto_114255 ) ( ON ?auto_114256 ?auto_114255 ) ( ON ?auto_114257 ?auto_114256 ) ( ON ?auto_114258 ?auto_114257 ) ( ON ?auto_114259 ?auto_114258 ) ( not ( = ?auto_114255 ?auto_114256 ) ) ( not ( = ?auto_114255 ?auto_114257 ) ) ( not ( = ?auto_114255 ?auto_114258 ) ) ( not ( = ?auto_114255 ?auto_114259 ) ) ( not ( = ?auto_114255 ?auto_114260 ) ) ( not ( = ?auto_114255 ?auto_114261 ) ) ( not ( = ?auto_114255 ?auto_114262 ) ) ( not ( = ?auto_114255 ?auto_114263 ) ) ( not ( = ?auto_114255 ?auto_114264 ) ) ( not ( = ?auto_114256 ?auto_114257 ) ) ( not ( = ?auto_114256 ?auto_114258 ) ) ( not ( = ?auto_114256 ?auto_114259 ) ) ( not ( = ?auto_114256 ?auto_114260 ) ) ( not ( = ?auto_114256 ?auto_114261 ) ) ( not ( = ?auto_114256 ?auto_114262 ) ) ( not ( = ?auto_114256 ?auto_114263 ) ) ( not ( = ?auto_114256 ?auto_114264 ) ) ( not ( = ?auto_114257 ?auto_114258 ) ) ( not ( = ?auto_114257 ?auto_114259 ) ) ( not ( = ?auto_114257 ?auto_114260 ) ) ( not ( = ?auto_114257 ?auto_114261 ) ) ( not ( = ?auto_114257 ?auto_114262 ) ) ( not ( = ?auto_114257 ?auto_114263 ) ) ( not ( = ?auto_114257 ?auto_114264 ) ) ( not ( = ?auto_114258 ?auto_114259 ) ) ( not ( = ?auto_114258 ?auto_114260 ) ) ( not ( = ?auto_114258 ?auto_114261 ) ) ( not ( = ?auto_114258 ?auto_114262 ) ) ( not ( = ?auto_114258 ?auto_114263 ) ) ( not ( = ?auto_114258 ?auto_114264 ) ) ( not ( = ?auto_114259 ?auto_114260 ) ) ( not ( = ?auto_114259 ?auto_114261 ) ) ( not ( = ?auto_114259 ?auto_114262 ) ) ( not ( = ?auto_114259 ?auto_114263 ) ) ( not ( = ?auto_114259 ?auto_114264 ) ) ( not ( = ?auto_114260 ?auto_114261 ) ) ( not ( = ?auto_114260 ?auto_114262 ) ) ( not ( = ?auto_114260 ?auto_114263 ) ) ( not ( = ?auto_114260 ?auto_114264 ) ) ( not ( = ?auto_114261 ?auto_114262 ) ) ( not ( = ?auto_114261 ?auto_114263 ) ) ( not ( = ?auto_114261 ?auto_114264 ) ) ( not ( = ?auto_114262 ?auto_114263 ) ) ( not ( = ?auto_114262 ?auto_114264 ) ) ( not ( = ?auto_114263 ?auto_114264 ) ) ( ON ?auto_114262 ?auto_114263 ) ( ON ?auto_114261 ?auto_114262 ) ( CLEAR ?auto_114259 ) ( ON ?auto_114260 ?auto_114261 ) ( CLEAR ?auto_114260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114255 ?auto_114256 ?auto_114257 ?auto_114258 ?auto_114259 ?auto_114260 )
      ( MAKE-9PILE ?auto_114255 ?auto_114256 ?auto_114257 ?auto_114258 ?auto_114259 ?auto_114260 ?auto_114261 ?auto_114262 ?auto_114263 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_114293 - BLOCK
      ?auto_114294 - BLOCK
      ?auto_114295 - BLOCK
      ?auto_114296 - BLOCK
      ?auto_114297 - BLOCK
      ?auto_114298 - BLOCK
      ?auto_114299 - BLOCK
      ?auto_114300 - BLOCK
      ?auto_114301 - BLOCK
    )
    :vars
    (
      ?auto_114302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114301 ?auto_114302 ) ( ON-TABLE ?auto_114293 ) ( ON ?auto_114294 ?auto_114293 ) ( ON ?auto_114295 ?auto_114294 ) ( ON ?auto_114296 ?auto_114295 ) ( not ( = ?auto_114293 ?auto_114294 ) ) ( not ( = ?auto_114293 ?auto_114295 ) ) ( not ( = ?auto_114293 ?auto_114296 ) ) ( not ( = ?auto_114293 ?auto_114297 ) ) ( not ( = ?auto_114293 ?auto_114298 ) ) ( not ( = ?auto_114293 ?auto_114299 ) ) ( not ( = ?auto_114293 ?auto_114300 ) ) ( not ( = ?auto_114293 ?auto_114301 ) ) ( not ( = ?auto_114293 ?auto_114302 ) ) ( not ( = ?auto_114294 ?auto_114295 ) ) ( not ( = ?auto_114294 ?auto_114296 ) ) ( not ( = ?auto_114294 ?auto_114297 ) ) ( not ( = ?auto_114294 ?auto_114298 ) ) ( not ( = ?auto_114294 ?auto_114299 ) ) ( not ( = ?auto_114294 ?auto_114300 ) ) ( not ( = ?auto_114294 ?auto_114301 ) ) ( not ( = ?auto_114294 ?auto_114302 ) ) ( not ( = ?auto_114295 ?auto_114296 ) ) ( not ( = ?auto_114295 ?auto_114297 ) ) ( not ( = ?auto_114295 ?auto_114298 ) ) ( not ( = ?auto_114295 ?auto_114299 ) ) ( not ( = ?auto_114295 ?auto_114300 ) ) ( not ( = ?auto_114295 ?auto_114301 ) ) ( not ( = ?auto_114295 ?auto_114302 ) ) ( not ( = ?auto_114296 ?auto_114297 ) ) ( not ( = ?auto_114296 ?auto_114298 ) ) ( not ( = ?auto_114296 ?auto_114299 ) ) ( not ( = ?auto_114296 ?auto_114300 ) ) ( not ( = ?auto_114296 ?auto_114301 ) ) ( not ( = ?auto_114296 ?auto_114302 ) ) ( not ( = ?auto_114297 ?auto_114298 ) ) ( not ( = ?auto_114297 ?auto_114299 ) ) ( not ( = ?auto_114297 ?auto_114300 ) ) ( not ( = ?auto_114297 ?auto_114301 ) ) ( not ( = ?auto_114297 ?auto_114302 ) ) ( not ( = ?auto_114298 ?auto_114299 ) ) ( not ( = ?auto_114298 ?auto_114300 ) ) ( not ( = ?auto_114298 ?auto_114301 ) ) ( not ( = ?auto_114298 ?auto_114302 ) ) ( not ( = ?auto_114299 ?auto_114300 ) ) ( not ( = ?auto_114299 ?auto_114301 ) ) ( not ( = ?auto_114299 ?auto_114302 ) ) ( not ( = ?auto_114300 ?auto_114301 ) ) ( not ( = ?auto_114300 ?auto_114302 ) ) ( not ( = ?auto_114301 ?auto_114302 ) ) ( ON ?auto_114300 ?auto_114301 ) ( ON ?auto_114299 ?auto_114300 ) ( ON ?auto_114298 ?auto_114299 ) ( CLEAR ?auto_114296 ) ( ON ?auto_114297 ?auto_114298 ) ( CLEAR ?auto_114297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114293 ?auto_114294 ?auto_114295 ?auto_114296 ?auto_114297 )
      ( MAKE-9PILE ?auto_114293 ?auto_114294 ?auto_114295 ?auto_114296 ?auto_114297 ?auto_114298 ?auto_114299 ?auto_114300 ?auto_114301 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_114331 - BLOCK
      ?auto_114332 - BLOCK
      ?auto_114333 - BLOCK
      ?auto_114334 - BLOCK
      ?auto_114335 - BLOCK
      ?auto_114336 - BLOCK
      ?auto_114337 - BLOCK
      ?auto_114338 - BLOCK
      ?auto_114339 - BLOCK
    )
    :vars
    (
      ?auto_114340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114339 ?auto_114340 ) ( ON-TABLE ?auto_114331 ) ( ON ?auto_114332 ?auto_114331 ) ( ON ?auto_114333 ?auto_114332 ) ( not ( = ?auto_114331 ?auto_114332 ) ) ( not ( = ?auto_114331 ?auto_114333 ) ) ( not ( = ?auto_114331 ?auto_114334 ) ) ( not ( = ?auto_114331 ?auto_114335 ) ) ( not ( = ?auto_114331 ?auto_114336 ) ) ( not ( = ?auto_114331 ?auto_114337 ) ) ( not ( = ?auto_114331 ?auto_114338 ) ) ( not ( = ?auto_114331 ?auto_114339 ) ) ( not ( = ?auto_114331 ?auto_114340 ) ) ( not ( = ?auto_114332 ?auto_114333 ) ) ( not ( = ?auto_114332 ?auto_114334 ) ) ( not ( = ?auto_114332 ?auto_114335 ) ) ( not ( = ?auto_114332 ?auto_114336 ) ) ( not ( = ?auto_114332 ?auto_114337 ) ) ( not ( = ?auto_114332 ?auto_114338 ) ) ( not ( = ?auto_114332 ?auto_114339 ) ) ( not ( = ?auto_114332 ?auto_114340 ) ) ( not ( = ?auto_114333 ?auto_114334 ) ) ( not ( = ?auto_114333 ?auto_114335 ) ) ( not ( = ?auto_114333 ?auto_114336 ) ) ( not ( = ?auto_114333 ?auto_114337 ) ) ( not ( = ?auto_114333 ?auto_114338 ) ) ( not ( = ?auto_114333 ?auto_114339 ) ) ( not ( = ?auto_114333 ?auto_114340 ) ) ( not ( = ?auto_114334 ?auto_114335 ) ) ( not ( = ?auto_114334 ?auto_114336 ) ) ( not ( = ?auto_114334 ?auto_114337 ) ) ( not ( = ?auto_114334 ?auto_114338 ) ) ( not ( = ?auto_114334 ?auto_114339 ) ) ( not ( = ?auto_114334 ?auto_114340 ) ) ( not ( = ?auto_114335 ?auto_114336 ) ) ( not ( = ?auto_114335 ?auto_114337 ) ) ( not ( = ?auto_114335 ?auto_114338 ) ) ( not ( = ?auto_114335 ?auto_114339 ) ) ( not ( = ?auto_114335 ?auto_114340 ) ) ( not ( = ?auto_114336 ?auto_114337 ) ) ( not ( = ?auto_114336 ?auto_114338 ) ) ( not ( = ?auto_114336 ?auto_114339 ) ) ( not ( = ?auto_114336 ?auto_114340 ) ) ( not ( = ?auto_114337 ?auto_114338 ) ) ( not ( = ?auto_114337 ?auto_114339 ) ) ( not ( = ?auto_114337 ?auto_114340 ) ) ( not ( = ?auto_114338 ?auto_114339 ) ) ( not ( = ?auto_114338 ?auto_114340 ) ) ( not ( = ?auto_114339 ?auto_114340 ) ) ( ON ?auto_114338 ?auto_114339 ) ( ON ?auto_114337 ?auto_114338 ) ( ON ?auto_114336 ?auto_114337 ) ( ON ?auto_114335 ?auto_114336 ) ( CLEAR ?auto_114333 ) ( ON ?auto_114334 ?auto_114335 ) ( CLEAR ?auto_114334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114331 ?auto_114332 ?auto_114333 ?auto_114334 )
      ( MAKE-9PILE ?auto_114331 ?auto_114332 ?auto_114333 ?auto_114334 ?auto_114335 ?auto_114336 ?auto_114337 ?auto_114338 ?auto_114339 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_114369 - BLOCK
      ?auto_114370 - BLOCK
      ?auto_114371 - BLOCK
      ?auto_114372 - BLOCK
      ?auto_114373 - BLOCK
      ?auto_114374 - BLOCK
      ?auto_114375 - BLOCK
      ?auto_114376 - BLOCK
      ?auto_114377 - BLOCK
    )
    :vars
    (
      ?auto_114378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114377 ?auto_114378 ) ( ON-TABLE ?auto_114369 ) ( ON ?auto_114370 ?auto_114369 ) ( not ( = ?auto_114369 ?auto_114370 ) ) ( not ( = ?auto_114369 ?auto_114371 ) ) ( not ( = ?auto_114369 ?auto_114372 ) ) ( not ( = ?auto_114369 ?auto_114373 ) ) ( not ( = ?auto_114369 ?auto_114374 ) ) ( not ( = ?auto_114369 ?auto_114375 ) ) ( not ( = ?auto_114369 ?auto_114376 ) ) ( not ( = ?auto_114369 ?auto_114377 ) ) ( not ( = ?auto_114369 ?auto_114378 ) ) ( not ( = ?auto_114370 ?auto_114371 ) ) ( not ( = ?auto_114370 ?auto_114372 ) ) ( not ( = ?auto_114370 ?auto_114373 ) ) ( not ( = ?auto_114370 ?auto_114374 ) ) ( not ( = ?auto_114370 ?auto_114375 ) ) ( not ( = ?auto_114370 ?auto_114376 ) ) ( not ( = ?auto_114370 ?auto_114377 ) ) ( not ( = ?auto_114370 ?auto_114378 ) ) ( not ( = ?auto_114371 ?auto_114372 ) ) ( not ( = ?auto_114371 ?auto_114373 ) ) ( not ( = ?auto_114371 ?auto_114374 ) ) ( not ( = ?auto_114371 ?auto_114375 ) ) ( not ( = ?auto_114371 ?auto_114376 ) ) ( not ( = ?auto_114371 ?auto_114377 ) ) ( not ( = ?auto_114371 ?auto_114378 ) ) ( not ( = ?auto_114372 ?auto_114373 ) ) ( not ( = ?auto_114372 ?auto_114374 ) ) ( not ( = ?auto_114372 ?auto_114375 ) ) ( not ( = ?auto_114372 ?auto_114376 ) ) ( not ( = ?auto_114372 ?auto_114377 ) ) ( not ( = ?auto_114372 ?auto_114378 ) ) ( not ( = ?auto_114373 ?auto_114374 ) ) ( not ( = ?auto_114373 ?auto_114375 ) ) ( not ( = ?auto_114373 ?auto_114376 ) ) ( not ( = ?auto_114373 ?auto_114377 ) ) ( not ( = ?auto_114373 ?auto_114378 ) ) ( not ( = ?auto_114374 ?auto_114375 ) ) ( not ( = ?auto_114374 ?auto_114376 ) ) ( not ( = ?auto_114374 ?auto_114377 ) ) ( not ( = ?auto_114374 ?auto_114378 ) ) ( not ( = ?auto_114375 ?auto_114376 ) ) ( not ( = ?auto_114375 ?auto_114377 ) ) ( not ( = ?auto_114375 ?auto_114378 ) ) ( not ( = ?auto_114376 ?auto_114377 ) ) ( not ( = ?auto_114376 ?auto_114378 ) ) ( not ( = ?auto_114377 ?auto_114378 ) ) ( ON ?auto_114376 ?auto_114377 ) ( ON ?auto_114375 ?auto_114376 ) ( ON ?auto_114374 ?auto_114375 ) ( ON ?auto_114373 ?auto_114374 ) ( ON ?auto_114372 ?auto_114373 ) ( CLEAR ?auto_114370 ) ( ON ?auto_114371 ?auto_114372 ) ( CLEAR ?auto_114371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114369 ?auto_114370 ?auto_114371 )
      ( MAKE-9PILE ?auto_114369 ?auto_114370 ?auto_114371 ?auto_114372 ?auto_114373 ?auto_114374 ?auto_114375 ?auto_114376 ?auto_114377 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_114407 - BLOCK
      ?auto_114408 - BLOCK
      ?auto_114409 - BLOCK
      ?auto_114410 - BLOCK
      ?auto_114411 - BLOCK
      ?auto_114412 - BLOCK
      ?auto_114413 - BLOCK
      ?auto_114414 - BLOCK
      ?auto_114415 - BLOCK
    )
    :vars
    (
      ?auto_114416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114415 ?auto_114416 ) ( ON-TABLE ?auto_114407 ) ( not ( = ?auto_114407 ?auto_114408 ) ) ( not ( = ?auto_114407 ?auto_114409 ) ) ( not ( = ?auto_114407 ?auto_114410 ) ) ( not ( = ?auto_114407 ?auto_114411 ) ) ( not ( = ?auto_114407 ?auto_114412 ) ) ( not ( = ?auto_114407 ?auto_114413 ) ) ( not ( = ?auto_114407 ?auto_114414 ) ) ( not ( = ?auto_114407 ?auto_114415 ) ) ( not ( = ?auto_114407 ?auto_114416 ) ) ( not ( = ?auto_114408 ?auto_114409 ) ) ( not ( = ?auto_114408 ?auto_114410 ) ) ( not ( = ?auto_114408 ?auto_114411 ) ) ( not ( = ?auto_114408 ?auto_114412 ) ) ( not ( = ?auto_114408 ?auto_114413 ) ) ( not ( = ?auto_114408 ?auto_114414 ) ) ( not ( = ?auto_114408 ?auto_114415 ) ) ( not ( = ?auto_114408 ?auto_114416 ) ) ( not ( = ?auto_114409 ?auto_114410 ) ) ( not ( = ?auto_114409 ?auto_114411 ) ) ( not ( = ?auto_114409 ?auto_114412 ) ) ( not ( = ?auto_114409 ?auto_114413 ) ) ( not ( = ?auto_114409 ?auto_114414 ) ) ( not ( = ?auto_114409 ?auto_114415 ) ) ( not ( = ?auto_114409 ?auto_114416 ) ) ( not ( = ?auto_114410 ?auto_114411 ) ) ( not ( = ?auto_114410 ?auto_114412 ) ) ( not ( = ?auto_114410 ?auto_114413 ) ) ( not ( = ?auto_114410 ?auto_114414 ) ) ( not ( = ?auto_114410 ?auto_114415 ) ) ( not ( = ?auto_114410 ?auto_114416 ) ) ( not ( = ?auto_114411 ?auto_114412 ) ) ( not ( = ?auto_114411 ?auto_114413 ) ) ( not ( = ?auto_114411 ?auto_114414 ) ) ( not ( = ?auto_114411 ?auto_114415 ) ) ( not ( = ?auto_114411 ?auto_114416 ) ) ( not ( = ?auto_114412 ?auto_114413 ) ) ( not ( = ?auto_114412 ?auto_114414 ) ) ( not ( = ?auto_114412 ?auto_114415 ) ) ( not ( = ?auto_114412 ?auto_114416 ) ) ( not ( = ?auto_114413 ?auto_114414 ) ) ( not ( = ?auto_114413 ?auto_114415 ) ) ( not ( = ?auto_114413 ?auto_114416 ) ) ( not ( = ?auto_114414 ?auto_114415 ) ) ( not ( = ?auto_114414 ?auto_114416 ) ) ( not ( = ?auto_114415 ?auto_114416 ) ) ( ON ?auto_114414 ?auto_114415 ) ( ON ?auto_114413 ?auto_114414 ) ( ON ?auto_114412 ?auto_114413 ) ( ON ?auto_114411 ?auto_114412 ) ( ON ?auto_114410 ?auto_114411 ) ( ON ?auto_114409 ?auto_114410 ) ( CLEAR ?auto_114407 ) ( ON ?auto_114408 ?auto_114409 ) ( CLEAR ?auto_114408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114407 ?auto_114408 )
      ( MAKE-9PILE ?auto_114407 ?auto_114408 ?auto_114409 ?auto_114410 ?auto_114411 ?auto_114412 ?auto_114413 ?auto_114414 ?auto_114415 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_114445 - BLOCK
      ?auto_114446 - BLOCK
      ?auto_114447 - BLOCK
      ?auto_114448 - BLOCK
      ?auto_114449 - BLOCK
      ?auto_114450 - BLOCK
      ?auto_114451 - BLOCK
      ?auto_114452 - BLOCK
      ?auto_114453 - BLOCK
    )
    :vars
    (
      ?auto_114454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114453 ?auto_114454 ) ( not ( = ?auto_114445 ?auto_114446 ) ) ( not ( = ?auto_114445 ?auto_114447 ) ) ( not ( = ?auto_114445 ?auto_114448 ) ) ( not ( = ?auto_114445 ?auto_114449 ) ) ( not ( = ?auto_114445 ?auto_114450 ) ) ( not ( = ?auto_114445 ?auto_114451 ) ) ( not ( = ?auto_114445 ?auto_114452 ) ) ( not ( = ?auto_114445 ?auto_114453 ) ) ( not ( = ?auto_114445 ?auto_114454 ) ) ( not ( = ?auto_114446 ?auto_114447 ) ) ( not ( = ?auto_114446 ?auto_114448 ) ) ( not ( = ?auto_114446 ?auto_114449 ) ) ( not ( = ?auto_114446 ?auto_114450 ) ) ( not ( = ?auto_114446 ?auto_114451 ) ) ( not ( = ?auto_114446 ?auto_114452 ) ) ( not ( = ?auto_114446 ?auto_114453 ) ) ( not ( = ?auto_114446 ?auto_114454 ) ) ( not ( = ?auto_114447 ?auto_114448 ) ) ( not ( = ?auto_114447 ?auto_114449 ) ) ( not ( = ?auto_114447 ?auto_114450 ) ) ( not ( = ?auto_114447 ?auto_114451 ) ) ( not ( = ?auto_114447 ?auto_114452 ) ) ( not ( = ?auto_114447 ?auto_114453 ) ) ( not ( = ?auto_114447 ?auto_114454 ) ) ( not ( = ?auto_114448 ?auto_114449 ) ) ( not ( = ?auto_114448 ?auto_114450 ) ) ( not ( = ?auto_114448 ?auto_114451 ) ) ( not ( = ?auto_114448 ?auto_114452 ) ) ( not ( = ?auto_114448 ?auto_114453 ) ) ( not ( = ?auto_114448 ?auto_114454 ) ) ( not ( = ?auto_114449 ?auto_114450 ) ) ( not ( = ?auto_114449 ?auto_114451 ) ) ( not ( = ?auto_114449 ?auto_114452 ) ) ( not ( = ?auto_114449 ?auto_114453 ) ) ( not ( = ?auto_114449 ?auto_114454 ) ) ( not ( = ?auto_114450 ?auto_114451 ) ) ( not ( = ?auto_114450 ?auto_114452 ) ) ( not ( = ?auto_114450 ?auto_114453 ) ) ( not ( = ?auto_114450 ?auto_114454 ) ) ( not ( = ?auto_114451 ?auto_114452 ) ) ( not ( = ?auto_114451 ?auto_114453 ) ) ( not ( = ?auto_114451 ?auto_114454 ) ) ( not ( = ?auto_114452 ?auto_114453 ) ) ( not ( = ?auto_114452 ?auto_114454 ) ) ( not ( = ?auto_114453 ?auto_114454 ) ) ( ON ?auto_114452 ?auto_114453 ) ( ON ?auto_114451 ?auto_114452 ) ( ON ?auto_114450 ?auto_114451 ) ( ON ?auto_114449 ?auto_114450 ) ( ON ?auto_114448 ?auto_114449 ) ( ON ?auto_114447 ?auto_114448 ) ( ON ?auto_114446 ?auto_114447 ) ( ON ?auto_114445 ?auto_114446 ) ( CLEAR ?auto_114445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114445 )
      ( MAKE-9PILE ?auto_114445 ?auto_114446 ?auto_114447 ?auto_114448 ?auto_114449 ?auto_114450 ?auto_114451 ?auto_114452 ?auto_114453 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_114484 - BLOCK
      ?auto_114485 - BLOCK
      ?auto_114486 - BLOCK
      ?auto_114487 - BLOCK
      ?auto_114488 - BLOCK
      ?auto_114489 - BLOCK
      ?auto_114490 - BLOCK
      ?auto_114491 - BLOCK
      ?auto_114492 - BLOCK
      ?auto_114493 - BLOCK
    )
    :vars
    (
      ?auto_114494 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_114492 ) ( ON ?auto_114493 ?auto_114494 ) ( CLEAR ?auto_114493 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114484 ) ( ON ?auto_114485 ?auto_114484 ) ( ON ?auto_114486 ?auto_114485 ) ( ON ?auto_114487 ?auto_114486 ) ( ON ?auto_114488 ?auto_114487 ) ( ON ?auto_114489 ?auto_114488 ) ( ON ?auto_114490 ?auto_114489 ) ( ON ?auto_114491 ?auto_114490 ) ( ON ?auto_114492 ?auto_114491 ) ( not ( = ?auto_114484 ?auto_114485 ) ) ( not ( = ?auto_114484 ?auto_114486 ) ) ( not ( = ?auto_114484 ?auto_114487 ) ) ( not ( = ?auto_114484 ?auto_114488 ) ) ( not ( = ?auto_114484 ?auto_114489 ) ) ( not ( = ?auto_114484 ?auto_114490 ) ) ( not ( = ?auto_114484 ?auto_114491 ) ) ( not ( = ?auto_114484 ?auto_114492 ) ) ( not ( = ?auto_114484 ?auto_114493 ) ) ( not ( = ?auto_114484 ?auto_114494 ) ) ( not ( = ?auto_114485 ?auto_114486 ) ) ( not ( = ?auto_114485 ?auto_114487 ) ) ( not ( = ?auto_114485 ?auto_114488 ) ) ( not ( = ?auto_114485 ?auto_114489 ) ) ( not ( = ?auto_114485 ?auto_114490 ) ) ( not ( = ?auto_114485 ?auto_114491 ) ) ( not ( = ?auto_114485 ?auto_114492 ) ) ( not ( = ?auto_114485 ?auto_114493 ) ) ( not ( = ?auto_114485 ?auto_114494 ) ) ( not ( = ?auto_114486 ?auto_114487 ) ) ( not ( = ?auto_114486 ?auto_114488 ) ) ( not ( = ?auto_114486 ?auto_114489 ) ) ( not ( = ?auto_114486 ?auto_114490 ) ) ( not ( = ?auto_114486 ?auto_114491 ) ) ( not ( = ?auto_114486 ?auto_114492 ) ) ( not ( = ?auto_114486 ?auto_114493 ) ) ( not ( = ?auto_114486 ?auto_114494 ) ) ( not ( = ?auto_114487 ?auto_114488 ) ) ( not ( = ?auto_114487 ?auto_114489 ) ) ( not ( = ?auto_114487 ?auto_114490 ) ) ( not ( = ?auto_114487 ?auto_114491 ) ) ( not ( = ?auto_114487 ?auto_114492 ) ) ( not ( = ?auto_114487 ?auto_114493 ) ) ( not ( = ?auto_114487 ?auto_114494 ) ) ( not ( = ?auto_114488 ?auto_114489 ) ) ( not ( = ?auto_114488 ?auto_114490 ) ) ( not ( = ?auto_114488 ?auto_114491 ) ) ( not ( = ?auto_114488 ?auto_114492 ) ) ( not ( = ?auto_114488 ?auto_114493 ) ) ( not ( = ?auto_114488 ?auto_114494 ) ) ( not ( = ?auto_114489 ?auto_114490 ) ) ( not ( = ?auto_114489 ?auto_114491 ) ) ( not ( = ?auto_114489 ?auto_114492 ) ) ( not ( = ?auto_114489 ?auto_114493 ) ) ( not ( = ?auto_114489 ?auto_114494 ) ) ( not ( = ?auto_114490 ?auto_114491 ) ) ( not ( = ?auto_114490 ?auto_114492 ) ) ( not ( = ?auto_114490 ?auto_114493 ) ) ( not ( = ?auto_114490 ?auto_114494 ) ) ( not ( = ?auto_114491 ?auto_114492 ) ) ( not ( = ?auto_114491 ?auto_114493 ) ) ( not ( = ?auto_114491 ?auto_114494 ) ) ( not ( = ?auto_114492 ?auto_114493 ) ) ( not ( = ?auto_114492 ?auto_114494 ) ) ( not ( = ?auto_114493 ?auto_114494 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114493 ?auto_114494 )
      ( !STACK ?auto_114493 ?auto_114492 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_114526 - BLOCK
      ?auto_114527 - BLOCK
      ?auto_114528 - BLOCK
      ?auto_114529 - BLOCK
      ?auto_114530 - BLOCK
      ?auto_114531 - BLOCK
      ?auto_114532 - BLOCK
      ?auto_114533 - BLOCK
      ?auto_114534 - BLOCK
      ?auto_114535 - BLOCK
    )
    :vars
    (
      ?auto_114536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114535 ?auto_114536 ) ( ON-TABLE ?auto_114526 ) ( ON ?auto_114527 ?auto_114526 ) ( ON ?auto_114528 ?auto_114527 ) ( ON ?auto_114529 ?auto_114528 ) ( ON ?auto_114530 ?auto_114529 ) ( ON ?auto_114531 ?auto_114530 ) ( ON ?auto_114532 ?auto_114531 ) ( ON ?auto_114533 ?auto_114532 ) ( not ( = ?auto_114526 ?auto_114527 ) ) ( not ( = ?auto_114526 ?auto_114528 ) ) ( not ( = ?auto_114526 ?auto_114529 ) ) ( not ( = ?auto_114526 ?auto_114530 ) ) ( not ( = ?auto_114526 ?auto_114531 ) ) ( not ( = ?auto_114526 ?auto_114532 ) ) ( not ( = ?auto_114526 ?auto_114533 ) ) ( not ( = ?auto_114526 ?auto_114534 ) ) ( not ( = ?auto_114526 ?auto_114535 ) ) ( not ( = ?auto_114526 ?auto_114536 ) ) ( not ( = ?auto_114527 ?auto_114528 ) ) ( not ( = ?auto_114527 ?auto_114529 ) ) ( not ( = ?auto_114527 ?auto_114530 ) ) ( not ( = ?auto_114527 ?auto_114531 ) ) ( not ( = ?auto_114527 ?auto_114532 ) ) ( not ( = ?auto_114527 ?auto_114533 ) ) ( not ( = ?auto_114527 ?auto_114534 ) ) ( not ( = ?auto_114527 ?auto_114535 ) ) ( not ( = ?auto_114527 ?auto_114536 ) ) ( not ( = ?auto_114528 ?auto_114529 ) ) ( not ( = ?auto_114528 ?auto_114530 ) ) ( not ( = ?auto_114528 ?auto_114531 ) ) ( not ( = ?auto_114528 ?auto_114532 ) ) ( not ( = ?auto_114528 ?auto_114533 ) ) ( not ( = ?auto_114528 ?auto_114534 ) ) ( not ( = ?auto_114528 ?auto_114535 ) ) ( not ( = ?auto_114528 ?auto_114536 ) ) ( not ( = ?auto_114529 ?auto_114530 ) ) ( not ( = ?auto_114529 ?auto_114531 ) ) ( not ( = ?auto_114529 ?auto_114532 ) ) ( not ( = ?auto_114529 ?auto_114533 ) ) ( not ( = ?auto_114529 ?auto_114534 ) ) ( not ( = ?auto_114529 ?auto_114535 ) ) ( not ( = ?auto_114529 ?auto_114536 ) ) ( not ( = ?auto_114530 ?auto_114531 ) ) ( not ( = ?auto_114530 ?auto_114532 ) ) ( not ( = ?auto_114530 ?auto_114533 ) ) ( not ( = ?auto_114530 ?auto_114534 ) ) ( not ( = ?auto_114530 ?auto_114535 ) ) ( not ( = ?auto_114530 ?auto_114536 ) ) ( not ( = ?auto_114531 ?auto_114532 ) ) ( not ( = ?auto_114531 ?auto_114533 ) ) ( not ( = ?auto_114531 ?auto_114534 ) ) ( not ( = ?auto_114531 ?auto_114535 ) ) ( not ( = ?auto_114531 ?auto_114536 ) ) ( not ( = ?auto_114532 ?auto_114533 ) ) ( not ( = ?auto_114532 ?auto_114534 ) ) ( not ( = ?auto_114532 ?auto_114535 ) ) ( not ( = ?auto_114532 ?auto_114536 ) ) ( not ( = ?auto_114533 ?auto_114534 ) ) ( not ( = ?auto_114533 ?auto_114535 ) ) ( not ( = ?auto_114533 ?auto_114536 ) ) ( not ( = ?auto_114534 ?auto_114535 ) ) ( not ( = ?auto_114534 ?auto_114536 ) ) ( not ( = ?auto_114535 ?auto_114536 ) ) ( CLEAR ?auto_114533 ) ( ON ?auto_114534 ?auto_114535 ) ( CLEAR ?auto_114534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_114526 ?auto_114527 ?auto_114528 ?auto_114529 ?auto_114530 ?auto_114531 ?auto_114532 ?auto_114533 ?auto_114534 )
      ( MAKE-10PILE ?auto_114526 ?auto_114527 ?auto_114528 ?auto_114529 ?auto_114530 ?auto_114531 ?auto_114532 ?auto_114533 ?auto_114534 ?auto_114535 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_114568 - BLOCK
      ?auto_114569 - BLOCK
      ?auto_114570 - BLOCK
      ?auto_114571 - BLOCK
      ?auto_114572 - BLOCK
      ?auto_114573 - BLOCK
      ?auto_114574 - BLOCK
      ?auto_114575 - BLOCK
      ?auto_114576 - BLOCK
      ?auto_114577 - BLOCK
    )
    :vars
    (
      ?auto_114578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114577 ?auto_114578 ) ( ON-TABLE ?auto_114568 ) ( ON ?auto_114569 ?auto_114568 ) ( ON ?auto_114570 ?auto_114569 ) ( ON ?auto_114571 ?auto_114570 ) ( ON ?auto_114572 ?auto_114571 ) ( ON ?auto_114573 ?auto_114572 ) ( ON ?auto_114574 ?auto_114573 ) ( not ( = ?auto_114568 ?auto_114569 ) ) ( not ( = ?auto_114568 ?auto_114570 ) ) ( not ( = ?auto_114568 ?auto_114571 ) ) ( not ( = ?auto_114568 ?auto_114572 ) ) ( not ( = ?auto_114568 ?auto_114573 ) ) ( not ( = ?auto_114568 ?auto_114574 ) ) ( not ( = ?auto_114568 ?auto_114575 ) ) ( not ( = ?auto_114568 ?auto_114576 ) ) ( not ( = ?auto_114568 ?auto_114577 ) ) ( not ( = ?auto_114568 ?auto_114578 ) ) ( not ( = ?auto_114569 ?auto_114570 ) ) ( not ( = ?auto_114569 ?auto_114571 ) ) ( not ( = ?auto_114569 ?auto_114572 ) ) ( not ( = ?auto_114569 ?auto_114573 ) ) ( not ( = ?auto_114569 ?auto_114574 ) ) ( not ( = ?auto_114569 ?auto_114575 ) ) ( not ( = ?auto_114569 ?auto_114576 ) ) ( not ( = ?auto_114569 ?auto_114577 ) ) ( not ( = ?auto_114569 ?auto_114578 ) ) ( not ( = ?auto_114570 ?auto_114571 ) ) ( not ( = ?auto_114570 ?auto_114572 ) ) ( not ( = ?auto_114570 ?auto_114573 ) ) ( not ( = ?auto_114570 ?auto_114574 ) ) ( not ( = ?auto_114570 ?auto_114575 ) ) ( not ( = ?auto_114570 ?auto_114576 ) ) ( not ( = ?auto_114570 ?auto_114577 ) ) ( not ( = ?auto_114570 ?auto_114578 ) ) ( not ( = ?auto_114571 ?auto_114572 ) ) ( not ( = ?auto_114571 ?auto_114573 ) ) ( not ( = ?auto_114571 ?auto_114574 ) ) ( not ( = ?auto_114571 ?auto_114575 ) ) ( not ( = ?auto_114571 ?auto_114576 ) ) ( not ( = ?auto_114571 ?auto_114577 ) ) ( not ( = ?auto_114571 ?auto_114578 ) ) ( not ( = ?auto_114572 ?auto_114573 ) ) ( not ( = ?auto_114572 ?auto_114574 ) ) ( not ( = ?auto_114572 ?auto_114575 ) ) ( not ( = ?auto_114572 ?auto_114576 ) ) ( not ( = ?auto_114572 ?auto_114577 ) ) ( not ( = ?auto_114572 ?auto_114578 ) ) ( not ( = ?auto_114573 ?auto_114574 ) ) ( not ( = ?auto_114573 ?auto_114575 ) ) ( not ( = ?auto_114573 ?auto_114576 ) ) ( not ( = ?auto_114573 ?auto_114577 ) ) ( not ( = ?auto_114573 ?auto_114578 ) ) ( not ( = ?auto_114574 ?auto_114575 ) ) ( not ( = ?auto_114574 ?auto_114576 ) ) ( not ( = ?auto_114574 ?auto_114577 ) ) ( not ( = ?auto_114574 ?auto_114578 ) ) ( not ( = ?auto_114575 ?auto_114576 ) ) ( not ( = ?auto_114575 ?auto_114577 ) ) ( not ( = ?auto_114575 ?auto_114578 ) ) ( not ( = ?auto_114576 ?auto_114577 ) ) ( not ( = ?auto_114576 ?auto_114578 ) ) ( not ( = ?auto_114577 ?auto_114578 ) ) ( ON ?auto_114576 ?auto_114577 ) ( CLEAR ?auto_114574 ) ( ON ?auto_114575 ?auto_114576 ) ( CLEAR ?auto_114575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_114568 ?auto_114569 ?auto_114570 ?auto_114571 ?auto_114572 ?auto_114573 ?auto_114574 ?auto_114575 )
      ( MAKE-10PILE ?auto_114568 ?auto_114569 ?auto_114570 ?auto_114571 ?auto_114572 ?auto_114573 ?auto_114574 ?auto_114575 ?auto_114576 ?auto_114577 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_114610 - BLOCK
      ?auto_114611 - BLOCK
      ?auto_114612 - BLOCK
      ?auto_114613 - BLOCK
      ?auto_114614 - BLOCK
      ?auto_114615 - BLOCK
      ?auto_114616 - BLOCK
      ?auto_114617 - BLOCK
      ?auto_114618 - BLOCK
      ?auto_114619 - BLOCK
    )
    :vars
    (
      ?auto_114620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114619 ?auto_114620 ) ( ON-TABLE ?auto_114610 ) ( ON ?auto_114611 ?auto_114610 ) ( ON ?auto_114612 ?auto_114611 ) ( ON ?auto_114613 ?auto_114612 ) ( ON ?auto_114614 ?auto_114613 ) ( ON ?auto_114615 ?auto_114614 ) ( not ( = ?auto_114610 ?auto_114611 ) ) ( not ( = ?auto_114610 ?auto_114612 ) ) ( not ( = ?auto_114610 ?auto_114613 ) ) ( not ( = ?auto_114610 ?auto_114614 ) ) ( not ( = ?auto_114610 ?auto_114615 ) ) ( not ( = ?auto_114610 ?auto_114616 ) ) ( not ( = ?auto_114610 ?auto_114617 ) ) ( not ( = ?auto_114610 ?auto_114618 ) ) ( not ( = ?auto_114610 ?auto_114619 ) ) ( not ( = ?auto_114610 ?auto_114620 ) ) ( not ( = ?auto_114611 ?auto_114612 ) ) ( not ( = ?auto_114611 ?auto_114613 ) ) ( not ( = ?auto_114611 ?auto_114614 ) ) ( not ( = ?auto_114611 ?auto_114615 ) ) ( not ( = ?auto_114611 ?auto_114616 ) ) ( not ( = ?auto_114611 ?auto_114617 ) ) ( not ( = ?auto_114611 ?auto_114618 ) ) ( not ( = ?auto_114611 ?auto_114619 ) ) ( not ( = ?auto_114611 ?auto_114620 ) ) ( not ( = ?auto_114612 ?auto_114613 ) ) ( not ( = ?auto_114612 ?auto_114614 ) ) ( not ( = ?auto_114612 ?auto_114615 ) ) ( not ( = ?auto_114612 ?auto_114616 ) ) ( not ( = ?auto_114612 ?auto_114617 ) ) ( not ( = ?auto_114612 ?auto_114618 ) ) ( not ( = ?auto_114612 ?auto_114619 ) ) ( not ( = ?auto_114612 ?auto_114620 ) ) ( not ( = ?auto_114613 ?auto_114614 ) ) ( not ( = ?auto_114613 ?auto_114615 ) ) ( not ( = ?auto_114613 ?auto_114616 ) ) ( not ( = ?auto_114613 ?auto_114617 ) ) ( not ( = ?auto_114613 ?auto_114618 ) ) ( not ( = ?auto_114613 ?auto_114619 ) ) ( not ( = ?auto_114613 ?auto_114620 ) ) ( not ( = ?auto_114614 ?auto_114615 ) ) ( not ( = ?auto_114614 ?auto_114616 ) ) ( not ( = ?auto_114614 ?auto_114617 ) ) ( not ( = ?auto_114614 ?auto_114618 ) ) ( not ( = ?auto_114614 ?auto_114619 ) ) ( not ( = ?auto_114614 ?auto_114620 ) ) ( not ( = ?auto_114615 ?auto_114616 ) ) ( not ( = ?auto_114615 ?auto_114617 ) ) ( not ( = ?auto_114615 ?auto_114618 ) ) ( not ( = ?auto_114615 ?auto_114619 ) ) ( not ( = ?auto_114615 ?auto_114620 ) ) ( not ( = ?auto_114616 ?auto_114617 ) ) ( not ( = ?auto_114616 ?auto_114618 ) ) ( not ( = ?auto_114616 ?auto_114619 ) ) ( not ( = ?auto_114616 ?auto_114620 ) ) ( not ( = ?auto_114617 ?auto_114618 ) ) ( not ( = ?auto_114617 ?auto_114619 ) ) ( not ( = ?auto_114617 ?auto_114620 ) ) ( not ( = ?auto_114618 ?auto_114619 ) ) ( not ( = ?auto_114618 ?auto_114620 ) ) ( not ( = ?auto_114619 ?auto_114620 ) ) ( ON ?auto_114618 ?auto_114619 ) ( ON ?auto_114617 ?auto_114618 ) ( CLEAR ?auto_114615 ) ( ON ?auto_114616 ?auto_114617 ) ( CLEAR ?auto_114616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114610 ?auto_114611 ?auto_114612 ?auto_114613 ?auto_114614 ?auto_114615 ?auto_114616 )
      ( MAKE-10PILE ?auto_114610 ?auto_114611 ?auto_114612 ?auto_114613 ?auto_114614 ?auto_114615 ?auto_114616 ?auto_114617 ?auto_114618 ?auto_114619 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_114652 - BLOCK
      ?auto_114653 - BLOCK
      ?auto_114654 - BLOCK
      ?auto_114655 - BLOCK
      ?auto_114656 - BLOCK
      ?auto_114657 - BLOCK
      ?auto_114658 - BLOCK
      ?auto_114659 - BLOCK
      ?auto_114660 - BLOCK
      ?auto_114661 - BLOCK
    )
    :vars
    (
      ?auto_114662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114661 ?auto_114662 ) ( ON-TABLE ?auto_114652 ) ( ON ?auto_114653 ?auto_114652 ) ( ON ?auto_114654 ?auto_114653 ) ( ON ?auto_114655 ?auto_114654 ) ( ON ?auto_114656 ?auto_114655 ) ( not ( = ?auto_114652 ?auto_114653 ) ) ( not ( = ?auto_114652 ?auto_114654 ) ) ( not ( = ?auto_114652 ?auto_114655 ) ) ( not ( = ?auto_114652 ?auto_114656 ) ) ( not ( = ?auto_114652 ?auto_114657 ) ) ( not ( = ?auto_114652 ?auto_114658 ) ) ( not ( = ?auto_114652 ?auto_114659 ) ) ( not ( = ?auto_114652 ?auto_114660 ) ) ( not ( = ?auto_114652 ?auto_114661 ) ) ( not ( = ?auto_114652 ?auto_114662 ) ) ( not ( = ?auto_114653 ?auto_114654 ) ) ( not ( = ?auto_114653 ?auto_114655 ) ) ( not ( = ?auto_114653 ?auto_114656 ) ) ( not ( = ?auto_114653 ?auto_114657 ) ) ( not ( = ?auto_114653 ?auto_114658 ) ) ( not ( = ?auto_114653 ?auto_114659 ) ) ( not ( = ?auto_114653 ?auto_114660 ) ) ( not ( = ?auto_114653 ?auto_114661 ) ) ( not ( = ?auto_114653 ?auto_114662 ) ) ( not ( = ?auto_114654 ?auto_114655 ) ) ( not ( = ?auto_114654 ?auto_114656 ) ) ( not ( = ?auto_114654 ?auto_114657 ) ) ( not ( = ?auto_114654 ?auto_114658 ) ) ( not ( = ?auto_114654 ?auto_114659 ) ) ( not ( = ?auto_114654 ?auto_114660 ) ) ( not ( = ?auto_114654 ?auto_114661 ) ) ( not ( = ?auto_114654 ?auto_114662 ) ) ( not ( = ?auto_114655 ?auto_114656 ) ) ( not ( = ?auto_114655 ?auto_114657 ) ) ( not ( = ?auto_114655 ?auto_114658 ) ) ( not ( = ?auto_114655 ?auto_114659 ) ) ( not ( = ?auto_114655 ?auto_114660 ) ) ( not ( = ?auto_114655 ?auto_114661 ) ) ( not ( = ?auto_114655 ?auto_114662 ) ) ( not ( = ?auto_114656 ?auto_114657 ) ) ( not ( = ?auto_114656 ?auto_114658 ) ) ( not ( = ?auto_114656 ?auto_114659 ) ) ( not ( = ?auto_114656 ?auto_114660 ) ) ( not ( = ?auto_114656 ?auto_114661 ) ) ( not ( = ?auto_114656 ?auto_114662 ) ) ( not ( = ?auto_114657 ?auto_114658 ) ) ( not ( = ?auto_114657 ?auto_114659 ) ) ( not ( = ?auto_114657 ?auto_114660 ) ) ( not ( = ?auto_114657 ?auto_114661 ) ) ( not ( = ?auto_114657 ?auto_114662 ) ) ( not ( = ?auto_114658 ?auto_114659 ) ) ( not ( = ?auto_114658 ?auto_114660 ) ) ( not ( = ?auto_114658 ?auto_114661 ) ) ( not ( = ?auto_114658 ?auto_114662 ) ) ( not ( = ?auto_114659 ?auto_114660 ) ) ( not ( = ?auto_114659 ?auto_114661 ) ) ( not ( = ?auto_114659 ?auto_114662 ) ) ( not ( = ?auto_114660 ?auto_114661 ) ) ( not ( = ?auto_114660 ?auto_114662 ) ) ( not ( = ?auto_114661 ?auto_114662 ) ) ( ON ?auto_114660 ?auto_114661 ) ( ON ?auto_114659 ?auto_114660 ) ( ON ?auto_114658 ?auto_114659 ) ( CLEAR ?auto_114656 ) ( ON ?auto_114657 ?auto_114658 ) ( CLEAR ?auto_114657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114652 ?auto_114653 ?auto_114654 ?auto_114655 ?auto_114656 ?auto_114657 )
      ( MAKE-10PILE ?auto_114652 ?auto_114653 ?auto_114654 ?auto_114655 ?auto_114656 ?auto_114657 ?auto_114658 ?auto_114659 ?auto_114660 ?auto_114661 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_114694 - BLOCK
      ?auto_114695 - BLOCK
      ?auto_114696 - BLOCK
      ?auto_114697 - BLOCK
      ?auto_114698 - BLOCK
      ?auto_114699 - BLOCK
      ?auto_114700 - BLOCK
      ?auto_114701 - BLOCK
      ?auto_114702 - BLOCK
      ?auto_114703 - BLOCK
    )
    :vars
    (
      ?auto_114704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114703 ?auto_114704 ) ( ON-TABLE ?auto_114694 ) ( ON ?auto_114695 ?auto_114694 ) ( ON ?auto_114696 ?auto_114695 ) ( ON ?auto_114697 ?auto_114696 ) ( not ( = ?auto_114694 ?auto_114695 ) ) ( not ( = ?auto_114694 ?auto_114696 ) ) ( not ( = ?auto_114694 ?auto_114697 ) ) ( not ( = ?auto_114694 ?auto_114698 ) ) ( not ( = ?auto_114694 ?auto_114699 ) ) ( not ( = ?auto_114694 ?auto_114700 ) ) ( not ( = ?auto_114694 ?auto_114701 ) ) ( not ( = ?auto_114694 ?auto_114702 ) ) ( not ( = ?auto_114694 ?auto_114703 ) ) ( not ( = ?auto_114694 ?auto_114704 ) ) ( not ( = ?auto_114695 ?auto_114696 ) ) ( not ( = ?auto_114695 ?auto_114697 ) ) ( not ( = ?auto_114695 ?auto_114698 ) ) ( not ( = ?auto_114695 ?auto_114699 ) ) ( not ( = ?auto_114695 ?auto_114700 ) ) ( not ( = ?auto_114695 ?auto_114701 ) ) ( not ( = ?auto_114695 ?auto_114702 ) ) ( not ( = ?auto_114695 ?auto_114703 ) ) ( not ( = ?auto_114695 ?auto_114704 ) ) ( not ( = ?auto_114696 ?auto_114697 ) ) ( not ( = ?auto_114696 ?auto_114698 ) ) ( not ( = ?auto_114696 ?auto_114699 ) ) ( not ( = ?auto_114696 ?auto_114700 ) ) ( not ( = ?auto_114696 ?auto_114701 ) ) ( not ( = ?auto_114696 ?auto_114702 ) ) ( not ( = ?auto_114696 ?auto_114703 ) ) ( not ( = ?auto_114696 ?auto_114704 ) ) ( not ( = ?auto_114697 ?auto_114698 ) ) ( not ( = ?auto_114697 ?auto_114699 ) ) ( not ( = ?auto_114697 ?auto_114700 ) ) ( not ( = ?auto_114697 ?auto_114701 ) ) ( not ( = ?auto_114697 ?auto_114702 ) ) ( not ( = ?auto_114697 ?auto_114703 ) ) ( not ( = ?auto_114697 ?auto_114704 ) ) ( not ( = ?auto_114698 ?auto_114699 ) ) ( not ( = ?auto_114698 ?auto_114700 ) ) ( not ( = ?auto_114698 ?auto_114701 ) ) ( not ( = ?auto_114698 ?auto_114702 ) ) ( not ( = ?auto_114698 ?auto_114703 ) ) ( not ( = ?auto_114698 ?auto_114704 ) ) ( not ( = ?auto_114699 ?auto_114700 ) ) ( not ( = ?auto_114699 ?auto_114701 ) ) ( not ( = ?auto_114699 ?auto_114702 ) ) ( not ( = ?auto_114699 ?auto_114703 ) ) ( not ( = ?auto_114699 ?auto_114704 ) ) ( not ( = ?auto_114700 ?auto_114701 ) ) ( not ( = ?auto_114700 ?auto_114702 ) ) ( not ( = ?auto_114700 ?auto_114703 ) ) ( not ( = ?auto_114700 ?auto_114704 ) ) ( not ( = ?auto_114701 ?auto_114702 ) ) ( not ( = ?auto_114701 ?auto_114703 ) ) ( not ( = ?auto_114701 ?auto_114704 ) ) ( not ( = ?auto_114702 ?auto_114703 ) ) ( not ( = ?auto_114702 ?auto_114704 ) ) ( not ( = ?auto_114703 ?auto_114704 ) ) ( ON ?auto_114702 ?auto_114703 ) ( ON ?auto_114701 ?auto_114702 ) ( ON ?auto_114700 ?auto_114701 ) ( ON ?auto_114699 ?auto_114700 ) ( CLEAR ?auto_114697 ) ( ON ?auto_114698 ?auto_114699 ) ( CLEAR ?auto_114698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114694 ?auto_114695 ?auto_114696 ?auto_114697 ?auto_114698 )
      ( MAKE-10PILE ?auto_114694 ?auto_114695 ?auto_114696 ?auto_114697 ?auto_114698 ?auto_114699 ?auto_114700 ?auto_114701 ?auto_114702 ?auto_114703 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_114736 - BLOCK
      ?auto_114737 - BLOCK
      ?auto_114738 - BLOCK
      ?auto_114739 - BLOCK
      ?auto_114740 - BLOCK
      ?auto_114741 - BLOCK
      ?auto_114742 - BLOCK
      ?auto_114743 - BLOCK
      ?auto_114744 - BLOCK
      ?auto_114745 - BLOCK
    )
    :vars
    (
      ?auto_114746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114745 ?auto_114746 ) ( ON-TABLE ?auto_114736 ) ( ON ?auto_114737 ?auto_114736 ) ( ON ?auto_114738 ?auto_114737 ) ( not ( = ?auto_114736 ?auto_114737 ) ) ( not ( = ?auto_114736 ?auto_114738 ) ) ( not ( = ?auto_114736 ?auto_114739 ) ) ( not ( = ?auto_114736 ?auto_114740 ) ) ( not ( = ?auto_114736 ?auto_114741 ) ) ( not ( = ?auto_114736 ?auto_114742 ) ) ( not ( = ?auto_114736 ?auto_114743 ) ) ( not ( = ?auto_114736 ?auto_114744 ) ) ( not ( = ?auto_114736 ?auto_114745 ) ) ( not ( = ?auto_114736 ?auto_114746 ) ) ( not ( = ?auto_114737 ?auto_114738 ) ) ( not ( = ?auto_114737 ?auto_114739 ) ) ( not ( = ?auto_114737 ?auto_114740 ) ) ( not ( = ?auto_114737 ?auto_114741 ) ) ( not ( = ?auto_114737 ?auto_114742 ) ) ( not ( = ?auto_114737 ?auto_114743 ) ) ( not ( = ?auto_114737 ?auto_114744 ) ) ( not ( = ?auto_114737 ?auto_114745 ) ) ( not ( = ?auto_114737 ?auto_114746 ) ) ( not ( = ?auto_114738 ?auto_114739 ) ) ( not ( = ?auto_114738 ?auto_114740 ) ) ( not ( = ?auto_114738 ?auto_114741 ) ) ( not ( = ?auto_114738 ?auto_114742 ) ) ( not ( = ?auto_114738 ?auto_114743 ) ) ( not ( = ?auto_114738 ?auto_114744 ) ) ( not ( = ?auto_114738 ?auto_114745 ) ) ( not ( = ?auto_114738 ?auto_114746 ) ) ( not ( = ?auto_114739 ?auto_114740 ) ) ( not ( = ?auto_114739 ?auto_114741 ) ) ( not ( = ?auto_114739 ?auto_114742 ) ) ( not ( = ?auto_114739 ?auto_114743 ) ) ( not ( = ?auto_114739 ?auto_114744 ) ) ( not ( = ?auto_114739 ?auto_114745 ) ) ( not ( = ?auto_114739 ?auto_114746 ) ) ( not ( = ?auto_114740 ?auto_114741 ) ) ( not ( = ?auto_114740 ?auto_114742 ) ) ( not ( = ?auto_114740 ?auto_114743 ) ) ( not ( = ?auto_114740 ?auto_114744 ) ) ( not ( = ?auto_114740 ?auto_114745 ) ) ( not ( = ?auto_114740 ?auto_114746 ) ) ( not ( = ?auto_114741 ?auto_114742 ) ) ( not ( = ?auto_114741 ?auto_114743 ) ) ( not ( = ?auto_114741 ?auto_114744 ) ) ( not ( = ?auto_114741 ?auto_114745 ) ) ( not ( = ?auto_114741 ?auto_114746 ) ) ( not ( = ?auto_114742 ?auto_114743 ) ) ( not ( = ?auto_114742 ?auto_114744 ) ) ( not ( = ?auto_114742 ?auto_114745 ) ) ( not ( = ?auto_114742 ?auto_114746 ) ) ( not ( = ?auto_114743 ?auto_114744 ) ) ( not ( = ?auto_114743 ?auto_114745 ) ) ( not ( = ?auto_114743 ?auto_114746 ) ) ( not ( = ?auto_114744 ?auto_114745 ) ) ( not ( = ?auto_114744 ?auto_114746 ) ) ( not ( = ?auto_114745 ?auto_114746 ) ) ( ON ?auto_114744 ?auto_114745 ) ( ON ?auto_114743 ?auto_114744 ) ( ON ?auto_114742 ?auto_114743 ) ( ON ?auto_114741 ?auto_114742 ) ( ON ?auto_114740 ?auto_114741 ) ( CLEAR ?auto_114738 ) ( ON ?auto_114739 ?auto_114740 ) ( CLEAR ?auto_114739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114736 ?auto_114737 ?auto_114738 ?auto_114739 )
      ( MAKE-10PILE ?auto_114736 ?auto_114737 ?auto_114738 ?auto_114739 ?auto_114740 ?auto_114741 ?auto_114742 ?auto_114743 ?auto_114744 ?auto_114745 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_114778 - BLOCK
      ?auto_114779 - BLOCK
      ?auto_114780 - BLOCK
      ?auto_114781 - BLOCK
      ?auto_114782 - BLOCK
      ?auto_114783 - BLOCK
      ?auto_114784 - BLOCK
      ?auto_114785 - BLOCK
      ?auto_114786 - BLOCK
      ?auto_114787 - BLOCK
    )
    :vars
    (
      ?auto_114788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114787 ?auto_114788 ) ( ON-TABLE ?auto_114778 ) ( ON ?auto_114779 ?auto_114778 ) ( not ( = ?auto_114778 ?auto_114779 ) ) ( not ( = ?auto_114778 ?auto_114780 ) ) ( not ( = ?auto_114778 ?auto_114781 ) ) ( not ( = ?auto_114778 ?auto_114782 ) ) ( not ( = ?auto_114778 ?auto_114783 ) ) ( not ( = ?auto_114778 ?auto_114784 ) ) ( not ( = ?auto_114778 ?auto_114785 ) ) ( not ( = ?auto_114778 ?auto_114786 ) ) ( not ( = ?auto_114778 ?auto_114787 ) ) ( not ( = ?auto_114778 ?auto_114788 ) ) ( not ( = ?auto_114779 ?auto_114780 ) ) ( not ( = ?auto_114779 ?auto_114781 ) ) ( not ( = ?auto_114779 ?auto_114782 ) ) ( not ( = ?auto_114779 ?auto_114783 ) ) ( not ( = ?auto_114779 ?auto_114784 ) ) ( not ( = ?auto_114779 ?auto_114785 ) ) ( not ( = ?auto_114779 ?auto_114786 ) ) ( not ( = ?auto_114779 ?auto_114787 ) ) ( not ( = ?auto_114779 ?auto_114788 ) ) ( not ( = ?auto_114780 ?auto_114781 ) ) ( not ( = ?auto_114780 ?auto_114782 ) ) ( not ( = ?auto_114780 ?auto_114783 ) ) ( not ( = ?auto_114780 ?auto_114784 ) ) ( not ( = ?auto_114780 ?auto_114785 ) ) ( not ( = ?auto_114780 ?auto_114786 ) ) ( not ( = ?auto_114780 ?auto_114787 ) ) ( not ( = ?auto_114780 ?auto_114788 ) ) ( not ( = ?auto_114781 ?auto_114782 ) ) ( not ( = ?auto_114781 ?auto_114783 ) ) ( not ( = ?auto_114781 ?auto_114784 ) ) ( not ( = ?auto_114781 ?auto_114785 ) ) ( not ( = ?auto_114781 ?auto_114786 ) ) ( not ( = ?auto_114781 ?auto_114787 ) ) ( not ( = ?auto_114781 ?auto_114788 ) ) ( not ( = ?auto_114782 ?auto_114783 ) ) ( not ( = ?auto_114782 ?auto_114784 ) ) ( not ( = ?auto_114782 ?auto_114785 ) ) ( not ( = ?auto_114782 ?auto_114786 ) ) ( not ( = ?auto_114782 ?auto_114787 ) ) ( not ( = ?auto_114782 ?auto_114788 ) ) ( not ( = ?auto_114783 ?auto_114784 ) ) ( not ( = ?auto_114783 ?auto_114785 ) ) ( not ( = ?auto_114783 ?auto_114786 ) ) ( not ( = ?auto_114783 ?auto_114787 ) ) ( not ( = ?auto_114783 ?auto_114788 ) ) ( not ( = ?auto_114784 ?auto_114785 ) ) ( not ( = ?auto_114784 ?auto_114786 ) ) ( not ( = ?auto_114784 ?auto_114787 ) ) ( not ( = ?auto_114784 ?auto_114788 ) ) ( not ( = ?auto_114785 ?auto_114786 ) ) ( not ( = ?auto_114785 ?auto_114787 ) ) ( not ( = ?auto_114785 ?auto_114788 ) ) ( not ( = ?auto_114786 ?auto_114787 ) ) ( not ( = ?auto_114786 ?auto_114788 ) ) ( not ( = ?auto_114787 ?auto_114788 ) ) ( ON ?auto_114786 ?auto_114787 ) ( ON ?auto_114785 ?auto_114786 ) ( ON ?auto_114784 ?auto_114785 ) ( ON ?auto_114783 ?auto_114784 ) ( ON ?auto_114782 ?auto_114783 ) ( ON ?auto_114781 ?auto_114782 ) ( CLEAR ?auto_114779 ) ( ON ?auto_114780 ?auto_114781 ) ( CLEAR ?auto_114780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114778 ?auto_114779 ?auto_114780 )
      ( MAKE-10PILE ?auto_114778 ?auto_114779 ?auto_114780 ?auto_114781 ?auto_114782 ?auto_114783 ?auto_114784 ?auto_114785 ?auto_114786 ?auto_114787 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_114820 - BLOCK
      ?auto_114821 - BLOCK
      ?auto_114822 - BLOCK
      ?auto_114823 - BLOCK
      ?auto_114824 - BLOCK
      ?auto_114825 - BLOCK
      ?auto_114826 - BLOCK
      ?auto_114827 - BLOCK
      ?auto_114828 - BLOCK
      ?auto_114829 - BLOCK
    )
    :vars
    (
      ?auto_114830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114829 ?auto_114830 ) ( ON-TABLE ?auto_114820 ) ( not ( = ?auto_114820 ?auto_114821 ) ) ( not ( = ?auto_114820 ?auto_114822 ) ) ( not ( = ?auto_114820 ?auto_114823 ) ) ( not ( = ?auto_114820 ?auto_114824 ) ) ( not ( = ?auto_114820 ?auto_114825 ) ) ( not ( = ?auto_114820 ?auto_114826 ) ) ( not ( = ?auto_114820 ?auto_114827 ) ) ( not ( = ?auto_114820 ?auto_114828 ) ) ( not ( = ?auto_114820 ?auto_114829 ) ) ( not ( = ?auto_114820 ?auto_114830 ) ) ( not ( = ?auto_114821 ?auto_114822 ) ) ( not ( = ?auto_114821 ?auto_114823 ) ) ( not ( = ?auto_114821 ?auto_114824 ) ) ( not ( = ?auto_114821 ?auto_114825 ) ) ( not ( = ?auto_114821 ?auto_114826 ) ) ( not ( = ?auto_114821 ?auto_114827 ) ) ( not ( = ?auto_114821 ?auto_114828 ) ) ( not ( = ?auto_114821 ?auto_114829 ) ) ( not ( = ?auto_114821 ?auto_114830 ) ) ( not ( = ?auto_114822 ?auto_114823 ) ) ( not ( = ?auto_114822 ?auto_114824 ) ) ( not ( = ?auto_114822 ?auto_114825 ) ) ( not ( = ?auto_114822 ?auto_114826 ) ) ( not ( = ?auto_114822 ?auto_114827 ) ) ( not ( = ?auto_114822 ?auto_114828 ) ) ( not ( = ?auto_114822 ?auto_114829 ) ) ( not ( = ?auto_114822 ?auto_114830 ) ) ( not ( = ?auto_114823 ?auto_114824 ) ) ( not ( = ?auto_114823 ?auto_114825 ) ) ( not ( = ?auto_114823 ?auto_114826 ) ) ( not ( = ?auto_114823 ?auto_114827 ) ) ( not ( = ?auto_114823 ?auto_114828 ) ) ( not ( = ?auto_114823 ?auto_114829 ) ) ( not ( = ?auto_114823 ?auto_114830 ) ) ( not ( = ?auto_114824 ?auto_114825 ) ) ( not ( = ?auto_114824 ?auto_114826 ) ) ( not ( = ?auto_114824 ?auto_114827 ) ) ( not ( = ?auto_114824 ?auto_114828 ) ) ( not ( = ?auto_114824 ?auto_114829 ) ) ( not ( = ?auto_114824 ?auto_114830 ) ) ( not ( = ?auto_114825 ?auto_114826 ) ) ( not ( = ?auto_114825 ?auto_114827 ) ) ( not ( = ?auto_114825 ?auto_114828 ) ) ( not ( = ?auto_114825 ?auto_114829 ) ) ( not ( = ?auto_114825 ?auto_114830 ) ) ( not ( = ?auto_114826 ?auto_114827 ) ) ( not ( = ?auto_114826 ?auto_114828 ) ) ( not ( = ?auto_114826 ?auto_114829 ) ) ( not ( = ?auto_114826 ?auto_114830 ) ) ( not ( = ?auto_114827 ?auto_114828 ) ) ( not ( = ?auto_114827 ?auto_114829 ) ) ( not ( = ?auto_114827 ?auto_114830 ) ) ( not ( = ?auto_114828 ?auto_114829 ) ) ( not ( = ?auto_114828 ?auto_114830 ) ) ( not ( = ?auto_114829 ?auto_114830 ) ) ( ON ?auto_114828 ?auto_114829 ) ( ON ?auto_114827 ?auto_114828 ) ( ON ?auto_114826 ?auto_114827 ) ( ON ?auto_114825 ?auto_114826 ) ( ON ?auto_114824 ?auto_114825 ) ( ON ?auto_114823 ?auto_114824 ) ( ON ?auto_114822 ?auto_114823 ) ( CLEAR ?auto_114820 ) ( ON ?auto_114821 ?auto_114822 ) ( CLEAR ?auto_114821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114820 ?auto_114821 )
      ( MAKE-10PILE ?auto_114820 ?auto_114821 ?auto_114822 ?auto_114823 ?auto_114824 ?auto_114825 ?auto_114826 ?auto_114827 ?auto_114828 ?auto_114829 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_114862 - BLOCK
      ?auto_114863 - BLOCK
      ?auto_114864 - BLOCK
      ?auto_114865 - BLOCK
      ?auto_114866 - BLOCK
      ?auto_114867 - BLOCK
      ?auto_114868 - BLOCK
      ?auto_114869 - BLOCK
      ?auto_114870 - BLOCK
      ?auto_114871 - BLOCK
    )
    :vars
    (
      ?auto_114872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114871 ?auto_114872 ) ( not ( = ?auto_114862 ?auto_114863 ) ) ( not ( = ?auto_114862 ?auto_114864 ) ) ( not ( = ?auto_114862 ?auto_114865 ) ) ( not ( = ?auto_114862 ?auto_114866 ) ) ( not ( = ?auto_114862 ?auto_114867 ) ) ( not ( = ?auto_114862 ?auto_114868 ) ) ( not ( = ?auto_114862 ?auto_114869 ) ) ( not ( = ?auto_114862 ?auto_114870 ) ) ( not ( = ?auto_114862 ?auto_114871 ) ) ( not ( = ?auto_114862 ?auto_114872 ) ) ( not ( = ?auto_114863 ?auto_114864 ) ) ( not ( = ?auto_114863 ?auto_114865 ) ) ( not ( = ?auto_114863 ?auto_114866 ) ) ( not ( = ?auto_114863 ?auto_114867 ) ) ( not ( = ?auto_114863 ?auto_114868 ) ) ( not ( = ?auto_114863 ?auto_114869 ) ) ( not ( = ?auto_114863 ?auto_114870 ) ) ( not ( = ?auto_114863 ?auto_114871 ) ) ( not ( = ?auto_114863 ?auto_114872 ) ) ( not ( = ?auto_114864 ?auto_114865 ) ) ( not ( = ?auto_114864 ?auto_114866 ) ) ( not ( = ?auto_114864 ?auto_114867 ) ) ( not ( = ?auto_114864 ?auto_114868 ) ) ( not ( = ?auto_114864 ?auto_114869 ) ) ( not ( = ?auto_114864 ?auto_114870 ) ) ( not ( = ?auto_114864 ?auto_114871 ) ) ( not ( = ?auto_114864 ?auto_114872 ) ) ( not ( = ?auto_114865 ?auto_114866 ) ) ( not ( = ?auto_114865 ?auto_114867 ) ) ( not ( = ?auto_114865 ?auto_114868 ) ) ( not ( = ?auto_114865 ?auto_114869 ) ) ( not ( = ?auto_114865 ?auto_114870 ) ) ( not ( = ?auto_114865 ?auto_114871 ) ) ( not ( = ?auto_114865 ?auto_114872 ) ) ( not ( = ?auto_114866 ?auto_114867 ) ) ( not ( = ?auto_114866 ?auto_114868 ) ) ( not ( = ?auto_114866 ?auto_114869 ) ) ( not ( = ?auto_114866 ?auto_114870 ) ) ( not ( = ?auto_114866 ?auto_114871 ) ) ( not ( = ?auto_114866 ?auto_114872 ) ) ( not ( = ?auto_114867 ?auto_114868 ) ) ( not ( = ?auto_114867 ?auto_114869 ) ) ( not ( = ?auto_114867 ?auto_114870 ) ) ( not ( = ?auto_114867 ?auto_114871 ) ) ( not ( = ?auto_114867 ?auto_114872 ) ) ( not ( = ?auto_114868 ?auto_114869 ) ) ( not ( = ?auto_114868 ?auto_114870 ) ) ( not ( = ?auto_114868 ?auto_114871 ) ) ( not ( = ?auto_114868 ?auto_114872 ) ) ( not ( = ?auto_114869 ?auto_114870 ) ) ( not ( = ?auto_114869 ?auto_114871 ) ) ( not ( = ?auto_114869 ?auto_114872 ) ) ( not ( = ?auto_114870 ?auto_114871 ) ) ( not ( = ?auto_114870 ?auto_114872 ) ) ( not ( = ?auto_114871 ?auto_114872 ) ) ( ON ?auto_114870 ?auto_114871 ) ( ON ?auto_114869 ?auto_114870 ) ( ON ?auto_114868 ?auto_114869 ) ( ON ?auto_114867 ?auto_114868 ) ( ON ?auto_114866 ?auto_114867 ) ( ON ?auto_114865 ?auto_114866 ) ( ON ?auto_114864 ?auto_114865 ) ( ON ?auto_114863 ?auto_114864 ) ( ON ?auto_114862 ?auto_114863 ) ( CLEAR ?auto_114862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114862 )
      ( MAKE-10PILE ?auto_114862 ?auto_114863 ?auto_114864 ?auto_114865 ?auto_114866 ?auto_114867 ?auto_114868 ?auto_114869 ?auto_114870 ?auto_114871 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_114905 - BLOCK
      ?auto_114906 - BLOCK
      ?auto_114907 - BLOCK
      ?auto_114908 - BLOCK
      ?auto_114909 - BLOCK
      ?auto_114910 - BLOCK
      ?auto_114911 - BLOCK
      ?auto_114912 - BLOCK
      ?auto_114913 - BLOCK
      ?auto_114914 - BLOCK
      ?auto_114915 - BLOCK
    )
    :vars
    (
      ?auto_114916 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_114914 ) ( ON ?auto_114915 ?auto_114916 ) ( CLEAR ?auto_114915 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114905 ) ( ON ?auto_114906 ?auto_114905 ) ( ON ?auto_114907 ?auto_114906 ) ( ON ?auto_114908 ?auto_114907 ) ( ON ?auto_114909 ?auto_114908 ) ( ON ?auto_114910 ?auto_114909 ) ( ON ?auto_114911 ?auto_114910 ) ( ON ?auto_114912 ?auto_114911 ) ( ON ?auto_114913 ?auto_114912 ) ( ON ?auto_114914 ?auto_114913 ) ( not ( = ?auto_114905 ?auto_114906 ) ) ( not ( = ?auto_114905 ?auto_114907 ) ) ( not ( = ?auto_114905 ?auto_114908 ) ) ( not ( = ?auto_114905 ?auto_114909 ) ) ( not ( = ?auto_114905 ?auto_114910 ) ) ( not ( = ?auto_114905 ?auto_114911 ) ) ( not ( = ?auto_114905 ?auto_114912 ) ) ( not ( = ?auto_114905 ?auto_114913 ) ) ( not ( = ?auto_114905 ?auto_114914 ) ) ( not ( = ?auto_114905 ?auto_114915 ) ) ( not ( = ?auto_114905 ?auto_114916 ) ) ( not ( = ?auto_114906 ?auto_114907 ) ) ( not ( = ?auto_114906 ?auto_114908 ) ) ( not ( = ?auto_114906 ?auto_114909 ) ) ( not ( = ?auto_114906 ?auto_114910 ) ) ( not ( = ?auto_114906 ?auto_114911 ) ) ( not ( = ?auto_114906 ?auto_114912 ) ) ( not ( = ?auto_114906 ?auto_114913 ) ) ( not ( = ?auto_114906 ?auto_114914 ) ) ( not ( = ?auto_114906 ?auto_114915 ) ) ( not ( = ?auto_114906 ?auto_114916 ) ) ( not ( = ?auto_114907 ?auto_114908 ) ) ( not ( = ?auto_114907 ?auto_114909 ) ) ( not ( = ?auto_114907 ?auto_114910 ) ) ( not ( = ?auto_114907 ?auto_114911 ) ) ( not ( = ?auto_114907 ?auto_114912 ) ) ( not ( = ?auto_114907 ?auto_114913 ) ) ( not ( = ?auto_114907 ?auto_114914 ) ) ( not ( = ?auto_114907 ?auto_114915 ) ) ( not ( = ?auto_114907 ?auto_114916 ) ) ( not ( = ?auto_114908 ?auto_114909 ) ) ( not ( = ?auto_114908 ?auto_114910 ) ) ( not ( = ?auto_114908 ?auto_114911 ) ) ( not ( = ?auto_114908 ?auto_114912 ) ) ( not ( = ?auto_114908 ?auto_114913 ) ) ( not ( = ?auto_114908 ?auto_114914 ) ) ( not ( = ?auto_114908 ?auto_114915 ) ) ( not ( = ?auto_114908 ?auto_114916 ) ) ( not ( = ?auto_114909 ?auto_114910 ) ) ( not ( = ?auto_114909 ?auto_114911 ) ) ( not ( = ?auto_114909 ?auto_114912 ) ) ( not ( = ?auto_114909 ?auto_114913 ) ) ( not ( = ?auto_114909 ?auto_114914 ) ) ( not ( = ?auto_114909 ?auto_114915 ) ) ( not ( = ?auto_114909 ?auto_114916 ) ) ( not ( = ?auto_114910 ?auto_114911 ) ) ( not ( = ?auto_114910 ?auto_114912 ) ) ( not ( = ?auto_114910 ?auto_114913 ) ) ( not ( = ?auto_114910 ?auto_114914 ) ) ( not ( = ?auto_114910 ?auto_114915 ) ) ( not ( = ?auto_114910 ?auto_114916 ) ) ( not ( = ?auto_114911 ?auto_114912 ) ) ( not ( = ?auto_114911 ?auto_114913 ) ) ( not ( = ?auto_114911 ?auto_114914 ) ) ( not ( = ?auto_114911 ?auto_114915 ) ) ( not ( = ?auto_114911 ?auto_114916 ) ) ( not ( = ?auto_114912 ?auto_114913 ) ) ( not ( = ?auto_114912 ?auto_114914 ) ) ( not ( = ?auto_114912 ?auto_114915 ) ) ( not ( = ?auto_114912 ?auto_114916 ) ) ( not ( = ?auto_114913 ?auto_114914 ) ) ( not ( = ?auto_114913 ?auto_114915 ) ) ( not ( = ?auto_114913 ?auto_114916 ) ) ( not ( = ?auto_114914 ?auto_114915 ) ) ( not ( = ?auto_114914 ?auto_114916 ) ) ( not ( = ?auto_114915 ?auto_114916 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114915 ?auto_114916 )
      ( !STACK ?auto_114915 ?auto_114914 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_114928 - BLOCK
      ?auto_114929 - BLOCK
      ?auto_114930 - BLOCK
      ?auto_114931 - BLOCK
      ?auto_114932 - BLOCK
      ?auto_114933 - BLOCK
      ?auto_114934 - BLOCK
      ?auto_114935 - BLOCK
      ?auto_114936 - BLOCK
      ?auto_114937 - BLOCK
      ?auto_114938 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_114937 ) ( ON-TABLE ?auto_114938 ) ( CLEAR ?auto_114938 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114928 ) ( ON ?auto_114929 ?auto_114928 ) ( ON ?auto_114930 ?auto_114929 ) ( ON ?auto_114931 ?auto_114930 ) ( ON ?auto_114932 ?auto_114931 ) ( ON ?auto_114933 ?auto_114932 ) ( ON ?auto_114934 ?auto_114933 ) ( ON ?auto_114935 ?auto_114934 ) ( ON ?auto_114936 ?auto_114935 ) ( ON ?auto_114937 ?auto_114936 ) ( not ( = ?auto_114928 ?auto_114929 ) ) ( not ( = ?auto_114928 ?auto_114930 ) ) ( not ( = ?auto_114928 ?auto_114931 ) ) ( not ( = ?auto_114928 ?auto_114932 ) ) ( not ( = ?auto_114928 ?auto_114933 ) ) ( not ( = ?auto_114928 ?auto_114934 ) ) ( not ( = ?auto_114928 ?auto_114935 ) ) ( not ( = ?auto_114928 ?auto_114936 ) ) ( not ( = ?auto_114928 ?auto_114937 ) ) ( not ( = ?auto_114928 ?auto_114938 ) ) ( not ( = ?auto_114929 ?auto_114930 ) ) ( not ( = ?auto_114929 ?auto_114931 ) ) ( not ( = ?auto_114929 ?auto_114932 ) ) ( not ( = ?auto_114929 ?auto_114933 ) ) ( not ( = ?auto_114929 ?auto_114934 ) ) ( not ( = ?auto_114929 ?auto_114935 ) ) ( not ( = ?auto_114929 ?auto_114936 ) ) ( not ( = ?auto_114929 ?auto_114937 ) ) ( not ( = ?auto_114929 ?auto_114938 ) ) ( not ( = ?auto_114930 ?auto_114931 ) ) ( not ( = ?auto_114930 ?auto_114932 ) ) ( not ( = ?auto_114930 ?auto_114933 ) ) ( not ( = ?auto_114930 ?auto_114934 ) ) ( not ( = ?auto_114930 ?auto_114935 ) ) ( not ( = ?auto_114930 ?auto_114936 ) ) ( not ( = ?auto_114930 ?auto_114937 ) ) ( not ( = ?auto_114930 ?auto_114938 ) ) ( not ( = ?auto_114931 ?auto_114932 ) ) ( not ( = ?auto_114931 ?auto_114933 ) ) ( not ( = ?auto_114931 ?auto_114934 ) ) ( not ( = ?auto_114931 ?auto_114935 ) ) ( not ( = ?auto_114931 ?auto_114936 ) ) ( not ( = ?auto_114931 ?auto_114937 ) ) ( not ( = ?auto_114931 ?auto_114938 ) ) ( not ( = ?auto_114932 ?auto_114933 ) ) ( not ( = ?auto_114932 ?auto_114934 ) ) ( not ( = ?auto_114932 ?auto_114935 ) ) ( not ( = ?auto_114932 ?auto_114936 ) ) ( not ( = ?auto_114932 ?auto_114937 ) ) ( not ( = ?auto_114932 ?auto_114938 ) ) ( not ( = ?auto_114933 ?auto_114934 ) ) ( not ( = ?auto_114933 ?auto_114935 ) ) ( not ( = ?auto_114933 ?auto_114936 ) ) ( not ( = ?auto_114933 ?auto_114937 ) ) ( not ( = ?auto_114933 ?auto_114938 ) ) ( not ( = ?auto_114934 ?auto_114935 ) ) ( not ( = ?auto_114934 ?auto_114936 ) ) ( not ( = ?auto_114934 ?auto_114937 ) ) ( not ( = ?auto_114934 ?auto_114938 ) ) ( not ( = ?auto_114935 ?auto_114936 ) ) ( not ( = ?auto_114935 ?auto_114937 ) ) ( not ( = ?auto_114935 ?auto_114938 ) ) ( not ( = ?auto_114936 ?auto_114937 ) ) ( not ( = ?auto_114936 ?auto_114938 ) ) ( not ( = ?auto_114937 ?auto_114938 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_114938 )
      ( !STACK ?auto_114938 ?auto_114937 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_114950 - BLOCK
      ?auto_114951 - BLOCK
      ?auto_114952 - BLOCK
      ?auto_114953 - BLOCK
      ?auto_114954 - BLOCK
      ?auto_114955 - BLOCK
      ?auto_114956 - BLOCK
      ?auto_114957 - BLOCK
      ?auto_114958 - BLOCK
      ?auto_114959 - BLOCK
      ?auto_114960 - BLOCK
    )
    :vars
    (
      ?auto_114961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114960 ?auto_114961 ) ( ON-TABLE ?auto_114950 ) ( ON ?auto_114951 ?auto_114950 ) ( ON ?auto_114952 ?auto_114951 ) ( ON ?auto_114953 ?auto_114952 ) ( ON ?auto_114954 ?auto_114953 ) ( ON ?auto_114955 ?auto_114954 ) ( ON ?auto_114956 ?auto_114955 ) ( ON ?auto_114957 ?auto_114956 ) ( ON ?auto_114958 ?auto_114957 ) ( not ( = ?auto_114950 ?auto_114951 ) ) ( not ( = ?auto_114950 ?auto_114952 ) ) ( not ( = ?auto_114950 ?auto_114953 ) ) ( not ( = ?auto_114950 ?auto_114954 ) ) ( not ( = ?auto_114950 ?auto_114955 ) ) ( not ( = ?auto_114950 ?auto_114956 ) ) ( not ( = ?auto_114950 ?auto_114957 ) ) ( not ( = ?auto_114950 ?auto_114958 ) ) ( not ( = ?auto_114950 ?auto_114959 ) ) ( not ( = ?auto_114950 ?auto_114960 ) ) ( not ( = ?auto_114950 ?auto_114961 ) ) ( not ( = ?auto_114951 ?auto_114952 ) ) ( not ( = ?auto_114951 ?auto_114953 ) ) ( not ( = ?auto_114951 ?auto_114954 ) ) ( not ( = ?auto_114951 ?auto_114955 ) ) ( not ( = ?auto_114951 ?auto_114956 ) ) ( not ( = ?auto_114951 ?auto_114957 ) ) ( not ( = ?auto_114951 ?auto_114958 ) ) ( not ( = ?auto_114951 ?auto_114959 ) ) ( not ( = ?auto_114951 ?auto_114960 ) ) ( not ( = ?auto_114951 ?auto_114961 ) ) ( not ( = ?auto_114952 ?auto_114953 ) ) ( not ( = ?auto_114952 ?auto_114954 ) ) ( not ( = ?auto_114952 ?auto_114955 ) ) ( not ( = ?auto_114952 ?auto_114956 ) ) ( not ( = ?auto_114952 ?auto_114957 ) ) ( not ( = ?auto_114952 ?auto_114958 ) ) ( not ( = ?auto_114952 ?auto_114959 ) ) ( not ( = ?auto_114952 ?auto_114960 ) ) ( not ( = ?auto_114952 ?auto_114961 ) ) ( not ( = ?auto_114953 ?auto_114954 ) ) ( not ( = ?auto_114953 ?auto_114955 ) ) ( not ( = ?auto_114953 ?auto_114956 ) ) ( not ( = ?auto_114953 ?auto_114957 ) ) ( not ( = ?auto_114953 ?auto_114958 ) ) ( not ( = ?auto_114953 ?auto_114959 ) ) ( not ( = ?auto_114953 ?auto_114960 ) ) ( not ( = ?auto_114953 ?auto_114961 ) ) ( not ( = ?auto_114954 ?auto_114955 ) ) ( not ( = ?auto_114954 ?auto_114956 ) ) ( not ( = ?auto_114954 ?auto_114957 ) ) ( not ( = ?auto_114954 ?auto_114958 ) ) ( not ( = ?auto_114954 ?auto_114959 ) ) ( not ( = ?auto_114954 ?auto_114960 ) ) ( not ( = ?auto_114954 ?auto_114961 ) ) ( not ( = ?auto_114955 ?auto_114956 ) ) ( not ( = ?auto_114955 ?auto_114957 ) ) ( not ( = ?auto_114955 ?auto_114958 ) ) ( not ( = ?auto_114955 ?auto_114959 ) ) ( not ( = ?auto_114955 ?auto_114960 ) ) ( not ( = ?auto_114955 ?auto_114961 ) ) ( not ( = ?auto_114956 ?auto_114957 ) ) ( not ( = ?auto_114956 ?auto_114958 ) ) ( not ( = ?auto_114956 ?auto_114959 ) ) ( not ( = ?auto_114956 ?auto_114960 ) ) ( not ( = ?auto_114956 ?auto_114961 ) ) ( not ( = ?auto_114957 ?auto_114958 ) ) ( not ( = ?auto_114957 ?auto_114959 ) ) ( not ( = ?auto_114957 ?auto_114960 ) ) ( not ( = ?auto_114957 ?auto_114961 ) ) ( not ( = ?auto_114958 ?auto_114959 ) ) ( not ( = ?auto_114958 ?auto_114960 ) ) ( not ( = ?auto_114958 ?auto_114961 ) ) ( not ( = ?auto_114959 ?auto_114960 ) ) ( not ( = ?auto_114959 ?auto_114961 ) ) ( not ( = ?auto_114960 ?auto_114961 ) ) ( CLEAR ?auto_114958 ) ( ON ?auto_114959 ?auto_114960 ) ( CLEAR ?auto_114959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_114950 ?auto_114951 ?auto_114952 ?auto_114953 ?auto_114954 ?auto_114955 ?auto_114956 ?auto_114957 ?auto_114958 ?auto_114959 )
      ( MAKE-11PILE ?auto_114950 ?auto_114951 ?auto_114952 ?auto_114953 ?auto_114954 ?auto_114955 ?auto_114956 ?auto_114957 ?auto_114958 ?auto_114959 ?auto_114960 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_114973 - BLOCK
      ?auto_114974 - BLOCK
      ?auto_114975 - BLOCK
      ?auto_114976 - BLOCK
      ?auto_114977 - BLOCK
      ?auto_114978 - BLOCK
      ?auto_114979 - BLOCK
      ?auto_114980 - BLOCK
      ?auto_114981 - BLOCK
      ?auto_114982 - BLOCK
      ?auto_114983 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114983 ) ( ON-TABLE ?auto_114973 ) ( ON ?auto_114974 ?auto_114973 ) ( ON ?auto_114975 ?auto_114974 ) ( ON ?auto_114976 ?auto_114975 ) ( ON ?auto_114977 ?auto_114976 ) ( ON ?auto_114978 ?auto_114977 ) ( ON ?auto_114979 ?auto_114978 ) ( ON ?auto_114980 ?auto_114979 ) ( ON ?auto_114981 ?auto_114980 ) ( not ( = ?auto_114973 ?auto_114974 ) ) ( not ( = ?auto_114973 ?auto_114975 ) ) ( not ( = ?auto_114973 ?auto_114976 ) ) ( not ( = ?auto_114973 ?auto_114977 ) ) ( not ( = ?auto_114973 ?auto_114978 ) ) ( not ( = ?auto_114973 ?auto_114979 ) ) ( not ( = ?auto_114973 ?auto_114980 ) ) ( not ( = ?auto_114973 ?auto_114981 ) ) ( not ( = ?auto_114973 ?auto_114982 ) ) ( not ( = ?auto_114973 ?auto_114983 ) ) ( not ( = ?auto_114974 ?auto_114975 ) ) ( not ( = ?auto_114974 ?auto_114976 ) ) ( not ( = ?auto_114974 ?auto_114977 ) ) ( not ( = ?auto_114974 ?auto_114978 ) ) ( not ( = ?auto_114974 ?auto_114979 ) ) ( not ( = ?auto_114974 ?auto_114980 ) ) ( not ( = ?auto_114974 ?auto_114981 ) ) ( not ( = ?auto_114974 ?auto_114982 ) ) ( not ( = ?auto_114974 ?auto_114983 ) ) ( not ( = ?auto_114975 ?auto_114976 ) ) ( not ( = ?auto_114975 ?auto_114977 ) ) ( not ( = ?auto_114975 ?auto_114978 ) ) ( not ( = ?auto_114975 ?auto_114979 ) ) ( not ( = ?auto_114975 ?auto_114980 ) ) ( not ( = ?auto_114975 ?auto_114981 ) ) ( not ( = ?auto_114975 ?auto_114982 ) ) ( not ( = ?auto_114975 ?auto_114983 ) ) ( not ( = ?auto_114976 ?auto_114977 ) ) ( not ( = ?auto_114976 ?auto_114978 ) ) ( not ( = ?auto_114976 ?auto_114979 ) ) ( not ( = ?auto_114976 ?auto_114980 ) ) ( not ( = ?auto_114976 ?auto_114981 ) ) ( not ( = ?auto_114976 ?auto_114982 ) ) ( not ( = ?auto_114976 ?auto_114983 ) ) ( not ( = ?auto_114977 ?auto_114978 ) ) ( not ( = ?auto_114977 ?auto_114979 ) ) ( not ( = ?auto_114977 ?auto_114980 ) ) ( not ( = ?auto_114977 ?auto_114981 ) ) ( not ( = ?auto_114977 ?auto_114982 ) ) ( not ( = ?auto_114977 ?auto_114983 ) ) ( not ( = ?auto_114978 ?auto_114979 ) ) ( not ( = ?auto_114978 ?auto_114980 ) ) ( not ( = ?auto_114978 ?auto_114981 ) ) ( not ( = ?auto_114978 ?auto_114982 ) ) ( not ( = ?auto_114978 ?auto_114983 ) ) ( not ( = ?auto_114979 ?auto_114980 ) ) ( not ( = ?auto_114979 ?auto_114981 ) ) ( not ( = ?auto_114979 ?auto_114982 ) ) ( not ( = ?auto_114979 ?auto_114983 ) ) ( not ( = ?auto_114980 ?auto_114981 ) ) ( not ( = ?auto_114980 ?auto_114982 ) ) ( not ( = ?auto_114980 ?auto_114983 ) ) ( not ( = ?auto_114981 ?auto_114982 ) ) ( not ( = ?auto_114981 ?auto_114983 ) ) ( not ( = ?auto_114982 ?auto_114983 ) ) ( CLEAR ?auto_114981 ) ( ON ?auto_114982 ?auto_114983 ) ( CLEAR ?auto_114982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_114973 ?auto_114974 ?auto_114975 ?auto_114976 ?auto_114977 ?auto_114978 ?auto_114979 ?auto_114980 ?auto_114981 ?auto_114982 )
      ( MAKE-11PILE ?auto_114973 ?auto_114974 ?auto_114975 ?auto_114976 ?auto_114977 ?auto_114978 ?auto_114979 ?auto_114980 ?auto_114981 ?auto_114982 ?auto_114983 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_114995 - BLOCK
      ?auto_114996 - BLOCK
      ?auto_114997 - BLOCK
      ?auto_114998 - BLOCK
      ?auto_114999 - BLOCK
      ?auto_115000 - BLOCK
      ?auto_115001 - BLOCK
      ?auto_115002 - BLOCK
      ?auto_115003 - BLOCK
      ?auto_115004 - BLOCK
      ?auto_115005 - BLOCK
    )
    :vars
    (
      ?auto_115006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115005 ?auto_115006 ) ( ON-TABLE ?auto_114995 ) ( ON ?auto_114996 ?auto_114995 ) ( ON ?auto_114997 ?auto_114996 ) ( ON ?auto_114998 ?auto_114997 ) ( ON ?auto_114999 ?auto_114998 ) ( ON ?auto_115000 ?auto_114999 ) ( ON ?auto_115001 ?auto_115000 ) ( ON ?auto_115002 ?auto_115001 ) ( not ( = ?auto_114995 ?auto_114996 ) ) ( not ( = ?auto_114995 ?auto_114997 ) ) ( not ( = ?auto_114995 ?auto_114998 ) ) ( not ( = ?auto_114995 ?auto_114999 ) ) ( not ( = ?auto_114995 ?auto_115000 ) ) ( not ( = ?auto_114995 ?auto_115001 ) ) ( not ( = ?auto_114995 ?auto_115002 ) ) ( not ( = ?auto_114995 ?auto_115003 ) ) ( not ( = ?auto_114995 ?auto_115004 ) ) ( not ( = ?auto_114995 ?auto_115005 ) ) ( not ( = ?auto_114995 ?auto_115006 ) ) ( not ( = ?auto_114996 ?auto_114997 ) ) ( not ( = ?auto_114996 ?auto_114998 ) ) ( not ( = ?auto_114996 ?auto_114999 ) ) ( not ( = ?auto_114996 ?auto_115000 ) ) ( not ( = ?auto_114996 ?auto_115001 ) ) ( not ( = ?auto_114996 ?auto_115002 ) ) ( not ( = ?auto_114996 ?auto_115003 ) ) ( not ( = ?auto_114996 ?auto_115004 ) ) ( not ( = ?auto_114996 ?auto_115005 ) ) ( not ( = ?auto_114996 ?auto_115006 ) ) ( not ( = ?auto_114997 ?auto_114998 ) ) ( not ( = ?auto_114997 ?auto_114999 ) ) ( not ( = ?auto_114997 ?auto_115000 ) ) ( not ( = ?auto_114997 ?auto_115001 ) ) ( not ( = ?auto_114997 ?auto_115002 ) ) ( not ( = ?auto_114997 ?auto_115003 ) ) ( not ( = ?auto_114997 ?auto_115004 ) ) ( not ( = ?auto_114997 ?auto_115005 ) ) ( not ( = ?auto_114997 ?auto_115006 ) ) ( not ( = ?auto_114998 ?auto_114999 ) ) ( not ( = ?auto_114998 ?auto_115000 ) ) ( not ( = ?auto_114998 ?auto_115001 ) ) ( not ( = ?auto_114998 ?auto_115002 ) ) ( not ( = ?auto_114998 ?auto_115003 ) ) ( not ( = ?auto_114998 ?auto_115004 ) ) ( not ( = ?auto_114998 ?auto_115005 ) ) ( not ( = ?auto_114998 ?auto_115006 ) ) ( not ( = ?auto_114999 ?auto_115000 ) ) ( not ( = ?auto_114999 ?auto_115001 ) ) ( not ( = ?auto_114999 ?auto_115002 ) ) ( not ( = ?auto_114999 ?auto_115003 ) ) ( not ( = ?auto_114999 ?auto_115004 ) ) ( not ( = ?auto_114999 ?auto_115005 ) ) ( not ( = ?auto_114999 ?auto_115006 ) ) ( not ( = ?auto_115000 ?auto_115001 ) ) ( not ( = ?auto_115000 ?auto_115002 ) ) ( not ( = ?auto_115000 ?auto_115003 ) ) ( not ( = ?auto_115000 ?auto_115004 ) ) ( not ( = ?auto_115000 ?auto_115005 ) ) ( not ( = ?auto_115000 ?auto_115006 ) ) ( not ( = ?auto_115001 ?auto_115002 ) ) ( not ( = ?auto_115001 ?auto_115003 ) ) ( not ( = ?auto_115001 ?auto_115004 ) ) ( not ( = ?auto_115001 ?auto_115005 ) ) ( not ( = ?auto_115001 ?auto_115006 ) ) ( not ( = ?auto_115002 ?auto_115003 ) ) ( not ( = ?auto_115002 ?auto_115004 ) ) ( not ( = ?auto_115002 ?auto_115005 ) ) ( not ( = ?auto_115002 ?auto_115006 ) ) ( not ( = ?auto_115003 ?auto_115004 ) ) ( not ( = ?auto_115003 ?auto_115005 ) ) ( not ( = ?auto_115003 ?auto_115006 ) ) ( not ( = ?auto_115004 ?auto_115005 ) ) ( not ( = ?auto_115004 ?auto_115006 ) ) ( not ( = ?auto_115005 ?auto_115006 ) ) ( ON ?auto_115004 ?auto_115005 ) ( CLEAR ?auto_115002 ) ( ON ?auto_115003 ?auto_115004 ) ( CLEAR ?auto_115003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_114995 ?auto_114996 ?auto_114997 ?auto_114998 ?auto_114999 ?auto_115000 ?auto_115001 ?auto_115002 ?auto_115003 )
      ( MAKE-11PILE ?auto_114995 ?auto_114996 ?auto_114997 ?auto_114998 ?auto_114999 ?auto_115000 ?auto_115001 ?auto_115002 ?auto_115003 ?auto_115004 ?auto_115005 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115018 - BLOCK
      ?auto_115019 - BLOCK
      ?auto_115020 - BLOCK
      ?auto_115021 - BLOCK
      ?auto_115022 - BLOCK
      ?auto_115023 - BLOCK
      ?auto_115024 - BLOCK
      ?auto_115025 - BLOCK
      ?auto_115026 - BLOCK
      ?auto_115027 - BLOCK
      ?auto_115028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115028 ) ( ON-TABLE ?auto_115018 ) ( ON ?auto_115019 ?auto_115018 ) ( ON ?auto_115020 ?auto_115019 ) ( ON ?auto_115021 ?auto_115020 ) ( ON ?auto_115022 ?auto_115021 ) ( ON ?auto_115023 ?auto_115022 ) ( ON ?auto_115024 ?auto_115023 ) ( ON ?auto_115025 ?auto_115024 ) ( not ( = ?auto_115018 ?auto_115019 ) ) ( not ( = ?auto_115018 ?auto_115020 ) ) ( not ( = ?auto_115018 ?auto_115021 ) ) ( not ( = ?auto_115018 ?auto_115022 ) ) ( not ( = ?auto_115018 ?auto_115023 ) ) ( not ( = ?auto_115018 ?auto_115024 ) ) ( not ( = ?auto_115018 ?auto_115025 ) ) ( not ( = ?auto_115018 ?auto_115026 ) ) ( not ( = ?auto_115018 ?auto_115027 ) ) ( not ( = ?auto_115018 ?auto_115028 ) ) ( not ( = ?auto_115019 ?auto_115020 ) ) ( not ( = ?auto_115019 ?auto_115021 ) ) ( not ( = ?auto_115019 ?auto_115022 ) ) ( not ( = ?auto_115019 ?auto_115023 ) ) ( not ( = ?auto_115019 ?auto_115024 ) ) ( not ( = ?auto_115019 ?auto_115025 ) ) ( not ( = ?auto_115019 ?auto_115026 ) ) ( not ( = ?auto_115019 ?auto_115027 ) ) ( not ( = ?auto_115019 ?auto_115028 ) ) ( not ( = ?auto_115020 ?auto_115021 ) ) ( not ( = ?auto_115020 ?auto_115022 ) ) ( not ( = ?auto_115020 ?auto_115023 ) ) ( not ( = ?auto_115020 ?auto_115024 ) ) ( not ( = ?auto_115020 ?auto_115025 ) ) ( not ( = ?auto_115020 ?auto_115026 ) ) ( not ( = ?auto_115020 ?auto_115027 ) ) ( not ( = ?auto_115020 ?auto_115028 ) ) ( not ( = ?auto_115021 ?auto_115022 ) ) ( not ( = ?auto_115021 ?auto_115023 ) ) ( not ( = ?auto_115021 ?auto_115024 ) ) ( not ( = ?auto_115021 ?auto_115025 ) ) ( not ( = ?auto_115021 ?auto_115026 ) ) ( not ( = ?auto_115021 ?auto_115027 ) ) ( not ( = ?auto_115021 ?auto_115028 ) ) ( not ( = ?auto_115022 ?auto_115023 ) ) ( not ( = ?auto_115022 ?auto_115024 ) ) ( not ( = ?auto_115022 ?auto_115025 ) ) ( not ( = ?auto_115022 ?auto_115026 ) ) ( not ( = ?auto_115022 ?auto_115027 ) ) ( not ( = ?auto_115022 ?auto_115028 ) ) ( not ( = ?auto_115023 ?auto_115024 ) ) ( not ( = ?auto_115023 ?auto_115025 ) ) ( not ( = ?auto_115023 ?auto_115026 ) ) ( not ( = ?auto_115023 ?auto_115027 ) ) ( not ( = ?auto_115023 ?auto_115028 ) ) ( not ( = ?auto_115024 ?auto_115025 ) ) ( not ( = ?auto_115024 ?auto_115026 ) ) ( not ( = ?auto_115024 ?auto_115027 ) ) ( not ( = ?auto_115024 ?auto_115028 ) ) ( not ( = ?auto_115025 ?auto_115026 ) ) ( not ( = ?auto_115025 ?auto_115027 ) ) ( not ( = ?auto_115025 ?auto_115028 ) ) ( not ( = ?auto_115026 ?auto_115027 ) ) ( not ( = ?auto_115026 ?auto_115028 ) ) ( not ( = ?auto_115027 ?auto_115028 ) ) ( ON ?auto_115027 ?auto_115028 ) ( CLEAR ?auto_115025 ) ( ON ?auto_115026 ?auto_115027 ) ( CLEAR ?auto_115026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_115018 ?auto_115019 ?auto_115020 ?auto_115021 ?auto_115022 ?auto_115023 ?auto_115024 ?auto_115025 ?auto_115026 )
      ( MAKE-11PILE ?auto_115018 ?auto_115019 ?auto_115020 ?auto_115021 ?auto_115022 ?auto_115023 ?auto_115024 ?auto_115025 ?auto_115026 ?auto_115027 ?auto_115028 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115040 - BLOCK
      ?auto_115041 - BLOCK
      ?auto_115042 - BLOCK
      ?auto_115043 - BLOCK
      ?auto_115044 - BLOCK
      ?auto_115045 - BLOCK
      ?auto_115046 - BLOCK
      ?auto_115047 - BLOCK
      ?auto_115048 - BLOCK
      ?auto_115049 - BLOCK
      ?auto_115050 - BLOCK
    )
    :vars
    (
      ?auto_115051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115050 ?auto_115051 ) ( ON-TABLE ?auto_115040 ) ( ON ?auto_115041 ?auto_115040 ) ( ON ?auto_115042 ?auto_115041 ) ( ON ?auto_115043 ?auto_115042 ) ( ON ?auto_115044 ?auto_115043 ) ( ON ?auto_115045 ?auto_115044 ) ( ON ?auto_115046 ?auto_115045 ) ( not ( = ?auto_115040 ?auto_115041 ) ) ( not ( = ?auto_115040 ?auto_115042 ) ) ( not ( = ?auto_115040 ?auto_115043 ) ) ( not ( = ?auto_115040 ?auto_115044 ) ) ( not ( = ?auto_115040 ?auto_115045 ) ) ( not ( = ?auto_115040 ?auto_115046 ) ) ( not ( = ?auto_115040 ?auto_115047 ) ) ( not ( = ?auto_115040 ?auto_115048 ) ) ( not ( = ?auto_115040 ?auto_115049 ) ) ( not ( = ?auto_115040 ?auto_115050 ) ) ( not ( = ?auto_115040 ?auto_115051 ) ) ( not ( = ?auto_115041 ?auto_115042 ) ) ( not ( = ?auto_115041 ?auto_115043 ) ) ( not ( = ?auto_115041 ?auto_115044 ) ) ( not ( = ?auto_115041 ?auto_115045 ) ) ( not ( = ?auto_115041 ?auto_115046 ) ) ( not ( = ?auto_115041 ?auto_115047 ) ) ( not ( = ?auto_115041 ?auto_115048 ) ) ( not ( = ?auto_115041 ?auto_115049 ) ) ( not ( = ?auto_115041 ?auto_115050 ) ) ( not ( = ?auto_115041 ?auto_115051 ) ) ( not ( = ?auto_115042 ?auto_115043 ) ) ( not ( = ?auto_115042 ?auto_115044 ) ) ( not ( = ?auto_115042 ?auto_115045 ) ) ( not ( = ?auto_115042 ?auto_115046 ) ) ( not ( = ?auto_115042 ?auto_115047 ) ) ( not ( = ?auto_115042 ?auto_115048 ) ) ( not ( = ?auto_115042 ?auto_115049 ) ) ( not ( = ?auto_115042 ?auto_115050 ) ) ( not ( = ?auto_115042 ?auto_115051 ) ) ( not ( = ?auto_115043 ?auto_115044 ) ) ( not ( = ?auto_115043 ?auto_115045 ) ) ( not ( = ?auto_115043 ?auto_115046 ) ) ( not ( = ?auto_115043 ?auto_115047 ) ) ( not ( = ?auto_115043 ?auto_115048 ) ) ( not ( = ?auto_115043 ?auto_115049 ) ) ( not ( = ?auto_115043 ?auto_115050 ) ) ( not ( = ?auto_115043 ?auto_115051 ) ) ( not ( = ?auto_115044 ?auto_115045 ) ) ( not ( = ?auto_115044 ?auto_115046 ) ) ( not ( = ?auto_115044 ?auto_115047 ) ) ( not ( = ?auto_115044 ?auto_115048 ) ) ( not ( = ?auto_115044 ?auto_115049 ) ) ( not ( = ?auto_115044 ?auto_115050 ) ) ( not ( = ?auto_115044 ?auto_115051 ) ) ( not ( = ?auto_115045 ?auto_115046 ) ) ( not ( = ?auto_115045 ?auto_115047 ) ) ( not ( = ?auto_115045 ?auto_115048 ) ) ( not ( = ?auto_115045 ?auto_115049 ) ) ( not ( = ?auto_115045 ?auto_115050 ) ) ( not ( = ?auto_115045 ?auto_115051 ) ) ( not ( = ?auto_115046 ?auto_115047 ) ) ( not ( = ?auto_115046 ?auto_115048 ) ) ( not ( = ?auto_115046 ?auto_115049 ) ) ( not ( = ?auto_115046 ?auto_115050 ) ) ( not ( = ?auto_115046 ?auto_115051 ) ) ( not ( = ?auto_115047 ?auto_115048 ) ) ( not ( = ?auto_115047 ?auto_115049 ) ) ( not ( = ?auto_115047 ?auto_115050 ) ) ( not ( = ?auto_115047 ?auto_115051 ) ) ( not ( = ?auto_115048 ?auto_115049 ) ) ( not ( = ?auto_115048 ?auto_115050 ) ) ( not ( = ?auto_115048 ?auto_115051 ) ) ( not ( = ?auto_115049 ?auto_115050 ) ) ( not ( = ?auto_115049 ?auto_115051 ) ) ( not ( = ?auto_115050 ?auto_115051 ) ) ( ON ?auto_115049 ?auto_115050 ) ( ON ?auto_115048 ?auto_115049 ) ( CLEAR ?auto_115046 ) ( ON ?auto_115047 ?auto_115048 ) ( CLEAR ?auto_115047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_115040 ?auto_115041 ?auto_115042 ?auto_115043 ?auto_115044 ?auto_115045 ?auto_115046 ?auto_115047 )
      ( MAKE-11PILE ?auto_115040 ?auto_115041 ?auto_115042 ?auto_115043 ?auto_115044 ?auto_115045 ?auto_115046 ?auto_115047 ?auto_115048 ?auto_115049 ?auto_115050 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115063 - BLOCK
      ?auto_115064 - BLOCK
      ?auto_115065 - BLOCK
      ?auto_115066 - BLOCK
      ?auto_115067 - BLOCK
      ?auto_115068 - BLOCK
      ?auto_115069 - BLOCK
      ?auto_115070 - BLOCK
      ?auto_115071 - BLOCK
      ?auto_115072 - BLOCK
      ?auto_115073 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115073 ) ( ON-TABLE ?auto_115063 ) ( ON ?auto_115064 ?auto_115063 ) ( ON ?auto_115065 ?auto_115064 ) ( ON ?auto_115066 ?auto_115065 ) ( ON ?auto_115067 ?auto_115066 ) ( ON ?auto_115068 ?auto_115067 ) ( ON ?auto_115069 ?auto_115068 ) ( not ( = ?auto_115063 ?auto_115064 ) ) ( not ( = ?auto_115063 ?auto_115065 ) ) ( not ( = ?auto_115063 ?auto_115066 ) ) ( not ( = ?auto_115063 ?auto_115067 ) ) ( not ( = ?auto_115063 ?auto_115068 ) ) ( not ( = ?auto_115063 ?auto_115069 ) ) ( not ( = ?auto_115063 ?auto_115070 ) ) ( not ( = ?auto_115063 ?auto_115071 ) ) ( not ( = ?auto_115063 ?auto_115072 ) ) ( not ( = ?auto_115063 ?auto_115073 ) ) ( not ( = ?auto_115064 ?auto_115065 ) ) ( not ( = ?auto_115064 ?auto_115066 ) ) ( not ( = ?auto_115064 ?auto_115067 ) ) ( not ( = ?auto_115064 ?auto_115068 ) ) ( not ( = ?auto_115064 ?auto_115069 ) ) ( not ( = ?auto_115064 ?auto_115070 ) ) ( not ( = ?auto_115064 ?auto_115071 ) ) ( not ( = ?auto_115064 ?auto_115072 ) ) ( not ( = ?auto_115064 ?auto_115073 ) ) ( not ( = ?auto_115065 ?auto_115066 ) ) ( not ( = ?auto_115065 ?auto_115067 ) ) ( not ( = ?auto_115065 ?auto_115068 ) ) ( not ( = ?auto_115065 ?auto_115069 ) ) ( not ( = ?auto_115065 ?auto_115070 ) ) ( not ( = ?auto_115065 ?auto_115071 ) ) ( not ( = ?auto_115065 ?auto_115072 ) ) ( not ( = ?auto_115065 ?auto_115073 ) ) ( not ( = ?auto_115066 ?auto_115067 ) ) ( not ( = ?auto_115066 ?auto_115068 ) ) ( not ( = ?auto_115066 ?auto_115069 ) ) ( not ( = ?auto_115066 ?auto_115070 ) ) ( not ( = ?auto_115066 ?auto_115071 ) ) ( not ( = ?auto_115066 ?auto_115072 ) ) ( not ( = ?auto_115066 ?auto_115073 ) ) ( not ( = ?auto_115067 ?auto_115068 ) ) ( not ( = ?auto_115067 ?auto_115069 ) ) ( not ( = ?auto_115067 ?auto_115070 ) ) ( not ( = ?auto_115067 ?auto_115071 ) ) ( not ( = ?auto_115067 ?auto_115072 ) ) ( not ( = ?auto_115067 ?auto_115073 ) ) ( not ( = ?auto_115068 ?auto_115069 ) ) ( not ( = ?auto_115068 ?auto_115070 ) ) ( not ( = ?auto_115068 ?auto_115071 ) ) ( not ( = ?auto_115068 ?auto_115072 ) ) ( not ( = ?auto_115068 ?auto_115073 ) ) ( not ( = ?auto_115069 ?auto_115070 ) ) ( not ( = ?auto_115069 ?auto_115071 ) ) ( not ( = ?auto_115069 ?auto_115072 ) ) ( not ( = ?auto_115069 ?auto_115073 ) ) ( not ( = ?auto_115070 ?auto_115071 ) ) ( not ( = ?auto_115070 ?auto_115072 ) ) ( not ( = ?auto_115070 ?auto_115073 ) ) ( not ( = ?auto_115071 ?auto_115072 ) ) ( not ( = ?auto_115071 ?auto_115073 ) ) ( not ( = ?auto_115072 ?auto_115073 ) ) ( ON ?auto_115072 ?auto_115073 ) ( ON ?auto_115071 ?auto_115072 ) ( CLEAR ?auto_115069 ) ( ON ?auto_115070 ?auto_115071 ) ( CLEAR ?auto_115070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_115063 ?auto_115064 ?auto_115065 ?auto_115066 ?auto_115067 ?auto_115068 ?auto_115069 ?auto_115070 )
      ( MAKE-11PILE ?auto_115063 ?auto_115064 ?auto_115065 ?auto_115066 ?auto_115067 ?auto_115068 ?auto_115069 ?auto_115070 ?auto_115071 ?auto_115072 ?auto_115073 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115085 - BLOCK
      ?auto_115086 - BLOCK
      ?auto_115087 - BLOCK
      ?auto_115088 - BLOCK
      ?auto_115089 - BLOCK
      ?auto_115090 - BLOCK
      ?auto_115091 - BLOCK
      ?auto_115092 - BLOCK
      ?auto_115093 - BLOCK
      ?auto_115094 - BLOCK
      ?auto_115095 - BLOCK
    )
    :vars
    (
      ?auto_115096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115095 ?auto_115096 ) ( ON-TABLE ?auto_115085 ) ( ON ?auto_115086 ?auto_115085 ) ( ON ?auto_115087 ?auto_115086 ) ( ON ?auto_115088 ?auto_115087 ) ( ON ?auto_115089 ?auto_115088 ) ( ON ?auto_115090 ?auto_115089 ) ( not ( = ?auto_115085 ?auto_115086 ) ) ( not ( = ?auto_115085 ?auto_115087 ) ) ( not ( = ?auto_115085 ?auto_115088 ) ) ( not ( = ?auto_115085 ?auto_115089 ) ) ( not ( = ?auto_115085 ?auto_115090 ) ) ( not ( = ?auto_115085 ?auto_115091 ) ) ( not ( = ?auto_115085 ?auto_115092 ) ) ( not ( = ?auto_115085 ?auto_115093 ) ) ( not ( = ?auto_115085 ?auto_115094 ) ) ( not ( = ?auto_115085 ?auto_115095 ) ) ( not ( = ?auto_115085 ?auto_115096 ) ) ( not ( = ?auto_115086 ?auto_115087 ) ) ( not ( = ?auto_115086 ?auto_115088 ) ) ( not ( = ?auto_115086 ?auto_115089 ) ) ( not ( = ?auto_115086 ?auto_115090 ) ) ( not ( = ?auto_115086 ?auto_115091 ) ) ( not ( = ?auto_115086 ?auto_115092 ) ) ( not ( = ?auto_115086 ?auto_115093 ) ) ( not ( = ?auto_115086 ?auto_115094 ) ) ( not ( = ?auto_115086 ?auto_115095 ) ) ( not ( = ?auto_115086 ?auto_115096 ) ) ( not ( = ?auto_115087 ?auto_115088 ) ) ( not ( = ?auto_115087 ?auto_115089 ) ) ( not ( = ?auto_115087 ?auto_115090 ) ) ( not ( = ?auto_115087 ?auto_115091 ) ) ( not ( = ?auto_115087 ?auto_115092 ) ) ( not ( = ?auto_115087 ?auto_115093 ) ) ( not ( = ?auto_115087 ?auto_115094 ) ) ( not ( = ?auto_115087 ?auto_115095 ) ) ( not ( = ?auto_115087 ?auto_115096 ) ) ( not ( = ?auto_115088 ?auto_115089 ) ) ( not ( = ?auto_115088 ?auto_115090 ) ) ( not ( = ?auto_115088 ?auto_115091 ) ) ( not ( = ?auto_115088 ?auto_115092 ) ) ( not ( = ?auto_115088 ?auto_115093 ) ) ( not ( = ?auto_115088 ?auto_115094 ) ) ( not ( = ?auto_115088 ?auto_115095 ) ) ( not ( = ?auto_115088 ?auto_115096 ) ) ( not ( = ?auto_115089 ?auto_115090 ) ) ( not ( = ?auto_115089 ?auto_115091 ) ) ( not ( = ?auto_115089 ?auto_115092 ) ) ( not ( = ?auto_115089 ?auto_115093 ) ) ( not ( = ?auto_115089 ?auto_115094 ) ) ( not ( = ?auto_115089 ?auto_115095 ) ) ( not ( = ?auto_115089 ?auto_115096 ) ) ( not ( = ?auto_115090 ?auto_115091 ) ) ( not ( = ?auto_115090 ?auto_115092 ) ) ( not ( = ?auto_115090 ?auto_115093 ) ) ( not ( = ?auto_115090 ?auto_115094 ) ) ( not ( = ?auto_115090 ?auto_115095 ) ) ( not ( = ?auto_115090 ?auto_115096 ) ) ( not ( = ?auto_115091 ?auto_115092 ) ) ( not ( = ?auto_115091 ?auto_115093 ) ) ( not ( = ?auto_115091 ?auto_115094 ) ) ( not ( = ?auto_115091 ?auto_115095 ) ) ( not ( = ?auto_115091 ?auto_115096 ) ) ( not ( = ?auto_115092 ?auto_115093 ) ) ( not ( = ?auto_115092 ?auto_115094 ) ) ( not ( = ?auto_115092 ?auto_115095 ) ) ( not ( = ?auto_115092 ?auto_115096 ) ) ( not ( = ?auto_115093 ?auto_115094 ) ) ( not ( = ?auto_115093 ?auto_115095 ) ) ( not ( = ?auto_115093 ?auto_115096 ) ) ( not ( = ?auto_115094 ?auto_115095 ) ) ( not ( = ?auto_115094 ?auto_115096 ) ) ( not ( = ?auto_115095 ?auto_115096 ) ) ( ON ?auto_115094 ?auto_115095 ) ( ON ?auto_115093 ?auto_115094 ) ( ON ?auto_115092 ?auto_115093 ) ( CLEAR ?auto_115090 ) ( ON ?auto_115091 ?auto_115092 ) ( CLEAR ?auto_115091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115085 ?auto_115086 ?auto_115087 ?auto_115088 ?auto_115089 ?auto_115090 ?auto_115091 )
      ( MAKE-11PILE ?auto_115085 ?auto_115086 ?auto_115087 ?auto_115088 ?auto_115089 ?auto_115090 ?auto_115091 ?auto_115092 ?auto_115093 ?auto_115094 ?auto_115095 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115108 - BLOCK
      ?auto_115109 - BLOCK
      ?auto_115110 - BLOCK
      ?auto_115111 - BLOCK
      ?auto_115112 - BLOCK
      ?auto_115113 - BLOCK
      ?auto_115114 - BLOCK
      ?auto_115115 - BLOCK
      ?auto_115116 - BLOCK
      ?auto_115117 - BLOCK
      ?auto_115118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115118 ) ( ON-TABLE ?auto_115108 ) ( ON ?auto_115109 ?auto_115108 ) ( ON ?auto_115110 ?auto_115109 ) ( ON ?auto_115111 ?auto_115110 ) ( ON ?auto_115112 ?auto_115111 ) ( ON ?auto_115113 ?auto_115112 ) ( not ( = ?auto_115108 ?auto_115109 ) ) ( not ( = ?auto_115108 ?auto_115110 ) ) ( not ( = ?auto_115108 ?auto_115111 ) ) ( not ( = ?auto_115108 ?auto_115112 ) ) ( not ( = ?auto_115108 ?auto_115113 ) ) ( not ( = ?auto_115108 ?auto_115114 ) ) ( not ( = ?auto_115108 ?auto_115115 ) ) ( not ( = ?auto_115108 ?auto_115116 ) ) ( not ( = ?auto_115108 ?auto_115117 ) ) ( not ( = ?auto_115108 ?auto_115118 ) ) ( not ( = ?auto_115109 ?auto_115110 ) ) ( not ( = ?auto_115109 ?auto_115111 ) ) ( not ( = ?auto_115109 ?auto_115112 ) ) ( not ( = ?auto_115109 ?auto_115113 ) ) ( not ( = ?auto_115109 ?auto_115114 ) ) ( not ( = ?auto_115109 ?auto_115115 ) ) ( not ( = ?auto_115109 ?auto_115116 ) ) ( not ( = ?auto_115109 ?auto_115117 ) ) ( not ( = ?auto_115109 ?auto_115118 ) ) ( not ( = ?auto_115110 ?auto_115111 ) ) ( not ( = ?auto_115110 ?auto_115112 ) ) ( not ( = ?auto_115110 ?auto_115113 ) ) ( not ( = ?auto_115110 ?auto_115114 ) ) ( not ( = ?auto_115110 ?auto_115115 ) ) ( not ( = ?auto_115110 ?auto_115116 ) ) ( not ( = ?auto_115110 ?auto_115117 ) ) ( not ( = ?auto_115110 ?auto_115118 ) ) ( not ( = ?auto_115111 ?auto_115112 ) ) ( not ( = ?auto_115111 ?auto_115113 ) ) ( not ( = ?auto_115111 ?auto_115114 ) ) ( not ( = ?auto_115111 ?auto_115115 ) ) ( not ( = ?auto_115111 ?auto_115116 ) ) ( not ( = ?auto_115111 ?auto_115117 ) ) ( not ( = ?auto_115111 ?auto_115118 ) ) ( not ( = ?auto_115112 ?auto_115113 ) ) ( not ( = ?auto_115112 ?auto_115114 ) ) ( not ( = ?auto_115112 ?auto_115115 ) ) ( not ( = ?auto_115112 ?auto_115116 ) ) ( not ( = ?auto_115112 ?auto_115117 ) ) ( not ( = ?auto_115112 ?auto_115118 ) ) ( not ( = ?auto_115113 ?auto_115114 ) ) ( not ( = ?auto_115113 ?auto_115115 ) ) ( not ( = ?auto_115113 ?auto_115116 ) ) ( not ( = ?auto_115113 ?auto_115117 ) ) ( not ( = ?auto_115113 ?auto_115118 ) ) ( not ( = ?auto_115114 ?auto_115115 ) ) ( not ( = ?auto_115114 ?auto_115116 ) ) ( not ( = ?auto_115114 ?auto_115117 ) ) ( not ( = ?auto_115114 ?auto_115118 ) ) ( not ( = ?auto_115115 ?auto_115116 ) ) ( not ( = ?auto_115115 ?auto_115117 ) ) ( not ( = ?auto_115115 ?auto_115118 ) ) ( not ( = ?auto_115116 ?auto_115117 ) ) ( not ( = ?auto_115116 ?auto_115118 ) ) ( not ( = ?auto_115117 ?auto_115118 ) ) ( ON ?auto_115117 ?auto_115118 ) ( ON ?auto_115116 ?auto_115117 ) ( ON ?auto_115115 ?auto_115116 ) ( CLEAR ?auto_115113 ) ( ON ?auto_115114 ?auto_115115 ) ( CLEAR ?auto_115114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115108 ?auto_115109 ?auto_115110 ?auto_115111 ?auto_115112 ?auto_115113 ?auto_115114 )
      ( MAKE-11PILE ?auto_115108 ?auto_115109 ?auto_115110 ?auto_115111 ?auto_115112 ?auto_115113 ?auto_115114 ?auto_115115 ?auto_115116 ?auto_115117 ?auto_115118 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115130 - BLOCK
      ?auto_115131 - BLOCK
      ?auto_115132 - BLOCK
      ?auto_115133 - BLOCK
      ?auto_115134 - BLOCK
      ?auto_115135 - BLOCK
      ?auto_115136 - BLOCK
      ?auto_115137 - BLOCK
      ?auto_115138 - BLOCK
      ?auto_115139 - BLOCK
      ?auto_115140 - BLOCK
    )
    :vars
    (
      ?auto_115141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115140 ?auto_115141 ) ( ON-TABLE ?auto_115130 ) ( ON ?auto_115131 ?auto_115130 ) ( ON ?auto_115132 ?auto_115131 ) ( ON ?auto_115133 ?auto_115132 ) ( ON ?auto_115134 ?auto_115133 ) ( not ( = ?auto_115130 ?auto_115131 ) ) ( not ( = ?auto_115130 ?auto_115132 ) ) ( not ( = ?auto_115130 ?auto_115133 ) ) ( not ( = ?auto_115130 ?auto_115134 ) ) ( not ( = ?auto_115130 ?auto_115135 ) ) ( not ( = ?auto_115130 ?auto_115136 ) ) ( not ( = ?auto_115130 ?auto_115137 ) ) ( not ( = ?auto_115130 ?auto_115138 ) ) ( not ( = ?auto_115130 ?auto_115139 ) ) ( not ( = ?auto_115130 ?auto_115140 ) ) ( not ( = ?auto_115130 ?auto_115141 ) ) ( not ( = ?auto_115131 ?auto_115132 ) ) ( not ( = ?auto_115131 ?auto_115133 ) ) ( not ( = ?auto_115131 ?auto_115134 ) ) ( not ( = ?auto_115131 ?auto_115135 ) ) ( not ( = ?auto_115131 ?auto_115136 ) ) ( not ( = ?auto_115131 ?auto_115137 ) ) ( not ( = ?auto_115131 ?auto_115138 ) ) ( not ( = ?auto_115131 ?auto_115139 ) ) ( not ( = ?auto_115131 ?auto_115140 ) ) ( not ( = ?auto_115131 ?auto_115141 ) ) ( not ( = ?auto_115132 ?auto_115133 ) ) ( not ( = ?auto_115132 ?auto_115134 ) ) ( not ( = ?auto_115132 ?auto_115135 ) ) ( not ( = ?auto_115132 ?auto_115136 ) ) ( not ( = ?auto_115132 ?auto_115137 ) ) ( not ( = ?auto_115132 ?auto_115138 ) ) ( not ( = ?auto_115132 ?auto_115139 ) ) ( not ( = ?auto_115132 ?auto_115140 ) ) ( not ( = ?auto_115132 ?auto_115141 ) ) ( not ( = ?auto_115133 ?auto_115134 ) ) ( not ( = ?auto_115133 ?auto_115135 ) ) ( not ( = ?auto_115133 ?auto_115136 ) ) ( not ( = ?auto_115133 ?auto_115137 ) ) ( not ( = ?auto_115133 ?auto_115138 ) ) ( not ( = ?auto_115133 ?auto_115139 ) ) ( not ( = ?auto_115133 ?auto_115140 ) ) ( not ( = ?auto_115133 ?auto_115141 ) ) ( not ( = ?auto_115134 ?auto_115135 ) ) ( not ( = ?auto_115134 ?auto_115136 ) ) ( not ( = ?auto_115134 ?auto_115137 ) ) ( not ( = ?auto_115134 ?auto_115138 ) ) ( not ( = ?auto_115134 ?auto_115139 ) ) ( not ( = ?auto_115134 ?auto_115140 ) ) ( not ( = ?auto_115134 ?auto_115141 ) ) ( not ( = ?auto_115135 ?auto_115136 ) ) ( not ( = ?auto_115135 ?auto_115137 ) ) ( not ( = ?auto_115135 ?auto_115138 ) ) ( not ( = ?auto_115135 ?auto_115139 ) ) ( not ( = ?auto_115135 ?auto_115140 ) ) ( not ( = ?auto_115135 ?auto_115141 ) ) ( not ( = ?auto_115136 ?auto_115137 ) ) ( not ( = ?auto_115136 ?auto_115138 ) ) ( not ( = ?auto_115136 ?auto_115139 ) ) ( not ( = ?auto_115136 ?auto_115140 ) ) ( not ( = ?auto_115136 ?auto_115141 ) ) ( not ( = ?auto_115137 ?auto_115138 ) ) ( not ( = ?auto_115137 ?auto_115139 ) ) ( not ( = ?auto_115137 ?auto_115140 ) ) ( not ( = ?auto_115137 ?auto_115141 ) ) ( not ( = ?auto_115138 ?auto_115139 ) ) ( not ( = ?auto_115138 ?auto_115140 ) ) ( not ( = ?auto_115138 ?auto_115141 ) ) ( not ( = ?auto_115139 ?auto_115140 ) ) ( not ( = ?auto_115139 ?auto_115141 ) ) ( not ( = ?auto_115140 ?auto_115141 ) ) ( ON ?auto_115139 ?auto_115140 ) ( ON ?auto_115138 ?auto_115139 ) ( ON ?auto_115137 ?auto_115138 ) ( ON ?auto_115136 ?auto_115137 ) ( CLEAR ?auto_115134 ) ( ON ?auto_115135 ?auto_115136 ) ( CLEAR ?auto_115135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115130 ?auto_115131 ?auto_115132 ?auto_115133 ?auto_115134 ?auto_115135 )
      ( MAKE-11PILE ?auto_115130 ?auto_115131 ?auto_115132 ?auto_115133 ?auto_115134 ?auto_115135 ?auto_115136 ?auto_115137 ?auto_115138 ?auto_115139 ?auto_115140 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115153 - BLOCK
      ?auto_115154 - BLOCK
      ?auto_115155 - BLOCK
      ?auto_115156 - BLOCK
      ?auto_115157 - BLOCK
      ?auto_115158 - BLOCK
      ?auto_115159 - BLOCK
      ?auto_115160 - BLOCK
      ?auto_115161 - BLOCK
      ?auto_115162 - BLOCK
      ?auto_115163 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115163 ) ( ON-TABLE ?auto_115153 ) ( ON ?auto_115154 ?auto_115153 ) ( ON ?auto_115155 ?auto_115154 ) ( ON ?auto_115156 ?auto_115155 ) ( ON ?auto_115157 ?auto_115156 ) ( not ( = ?auto_115153 ?auto_115154 ) ) ( not ( = ?auto_115153 ?auto_115155 ) ) ( not ( = ?auto_115153 ?auto_115156 ) ) ( not ( = ?auto_115153 ?auto_115157 ) ) ( not ( = ?auto_115153 ?auto_115158 ) ) ( not ( = ?auto_115153 ?auto_115159 ) ) ( not ( = ?auto_115153 ?auto_115160 ) ) ( not ( = ?auto_115153 ?auto_115161 ) ) ( not ( = ?auto_115153 ?auto_115162 ) ) ( not ( = ?auto_115153 ?auto_115163 ) ) ( not ( = ?auto_115154 ?auto_115155 ) ) ( not ( = ?auto_115154 ?auto_115156 ) ) ( not ( = ?auto_115154 ?auto_115157 ) ) ( not ( = ?auto_115154 ?auto_115158 ) ) ( not ( = ?auto_115154 ?auto_115159 ) ) ( not ( = ?auto_115154 ?auto_115160 ) ) ( not ( = ?auto_115154 ?auto_115161 ) ) ( not ( = ?auto_115154 ?auto_115162 ) ) ( not ( = ?auto_115154 ?auto_115163 ) ) ( not ( = ?auto_115155 ?auto_115156 ) ) ( not ( = ?auto_115155 ?auto_115157 ) ) ( not ( = ?auto_115155 ?auto_115158 ) ) ( not ( = ?auto_115155 ?auto_115159 ) ) ( not ( = ?auto_115155 ?auto_115160 ) ) ( not ( = ?auto_115155 ?auto_115161 ) ) ( not ( = ?auto_115155 ?auto_115162 ) ) ( not ( = ?auto_115155 ?auto_115163 ) ) ( not ( = ?auto_115156 ?auto_115157 ) ) ( not ( = ?auto_115156 ?auto_115158 ) ) ( not ( = ?auto_115156 ?auto_115159 ) ) ( not ( = ?auto_115156 ?auto_115160 ) ) ( not ( = ?auto_115156 ?auto_115161 ) ) ( not ( = ?auto_115156 ?auto_115162 ) ) ( not ( = ?auto_115156 ?auto_115163 ) ) ( not ( = ?auto_115157 ?auto_115158 ) ) ( not ( = ?auto_115157 ?auto_115159 ) ) ( not ( = ?auto_115157 ?auto_115160 ) ) ( not ( = ?auto_115157 ?auto_115161 ) ) ( not ( = ?auto_115157 ?auto_115162 ) ) ( not ( = ?auto_115157 ?auto_115163 ) ) ( not ( = ?auto_115158 ?auto_115159 ) ) ( not ( = ?auto_115158 ?auto_115160 ) ) ( not ( = ?auto_115158 ?auto_115161 ) ) ( not ( = ?auto_115158 ?auto_115162 ) ) ( not ( = ?auto_115158 ?auto_115163 ) ) ( not ( = ?auto_115159 ?auto_115160 ) ) ( not ( = ?auto_115159 ?auto_115161 ) ) ( not ( = ?auto_115159 ?auto_115162 ) ) ( not ( = ?auto_115159 ?auto_115163 ) ) ( not ( = ?auto_115160 ?auto_115161 ) ) ( not ( = ?auto_115160 ?auto_115162 ) ) ( not ( = ?auto_115160 ?auto_115163 ) ) ( not ( = ?auto_115161 ?auto_115162 ) ) ( not ( = ?auto_115161 ?auto_115163 ) ) ( not ( = ?auto_115162 ?auto_115163 ) ) ( ON ?auto_115162 ?auto_115163 ) ( ON ?auto_115161 ?auto_115162 ) ( ON ?auto_115160 ?auto_115161 ) ( ON ?auto_115159 ?auto_115160 ) ( CLEAR ?auto_115157 ) ( ON ?auto_115158 ?auto_115159 ) ( CLEAR ?auto_115158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115153 ?auto_115154 ?auto_115155 ?auto_115156 ?auto_115157 ?auto_115158 )
      ( MAKE-11PILE ?auto_115153 ?auto_115154 ?auto_115155 ?auto_115156 ?auto_115157 ?auto_115158 ?auto_115159 ?auto_115160 ?auto_115161 ?auto_115162 ?auto_115163 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115175 - BLOCK
      ?auto_115176 - BLOCK
      ?auto_115177 - BLOCK
      ?auto_115178 - BLOCK
      ?auto_115179 - BLOCK
      ?auto_115180 - BLOCK
      ?auto_115181 - BLOCK
      ?auto_115182 - BLOCK
      ?auto_115183 - BLOCK
      ?auto_115184 - BLOCK
      ?auto_115185 - BLOCK
    )
    :vars
    (
      ?auto_115186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115185 ?auto_115186 ) ( ON-TABLE ?auto_115175 ) ( ON ?auto_115176 ?auto_115175 ) ( ON ?auto_115177 ?auto_115176 ) ( ON ?auto_115178 ?auto_115177 ) ( not ( = ?auto_115175 ?auto_115176 ) ) ( not ( = ?auto_115175 ?auto_115177 ) ) ( not ( = ?auto_115175 ?auto_115178 ) ) ( not ( = ?auto_115175 ?auto_115179 ) ) ( not ( = ?auto_115175 ?auto_115180 ) ) ( not ( = ?auto_115175 ?auto_115181 ) ) ( not ( = ?auto_115175 ?auto_115182 ) ) ( not ( = ?auto_115175 ?auto_115183 ) ) ( not ( = ?auto_115175 ?auto_115184 ) ) ( not ( = ?auto_115175 ?auto_115185 ) ) ( not ( = ?auto_115175 ?auto_115186 ) ) ( not ( = ?auto_115176 ?auto_115177 ) ) ( not ( = ?auto_115176 ?auto_115178 ) ) ( not ( = ?auto_115176 ?auto_115179 ) ) ( not ( = ?auto_115176 ?auto_115180 ) ) ( not ( = ?auto_115176 ?auto_115181 ) ) ( not ( = ?auto_115176 ?auto_115182 ) ) ( not ( = ?auto_115176 ?auto_115183 ) ) ( not ( = ?auto_115176 ?auto_115184 ) ) ( not ( = ?auto_115176 ?auto_115185 ) ) ( not ( = ?auto_115176 ?auto_115186 ) ) ( not ( = ?auto_115177 ?auto_115178 ) ) ( not ( = ?auto_115177 ?auto_115179 ) ) ( not ( = ?auto_115177 ?auto_115180 ) ) ( not ( = ?auto_115177 ?auto_115181 ) ) ( not ( = ?auto_115177 ?auto_115182 ) ) ( not ( = ?auto_115177 ?auto_115183 ) ) ( not ( = ?auto_115177 ?auto_115184 ) ) ( not ( = ?auto_115177 ?auto_115185 ) ) ( not ( = ?auto_115177 ?auto_115186 ) ) ( not ( = ?auto_115178 ?auto_115179 ) ) ( not ( = ?auto_115178 ?auto_115180 ) ) ( not ( = ?auto_115178 ?auto_115181 ) ) ( not ( = ?auto_115178 ?auto_115182 ) ) ( not ( = ?auto_115178 ?auto_115183 ) ) ( not ( = ?auto_115178 ?auto_115184 ) ) ( not ( = ?auto_115178 ?auto_115185 ) ) ( not ( = ?auto_115178 ?auto_115186 ) ) ( not ( = ?auto_115179 ?auto_115180 ) ) ( not ( = ?auto_115179 ?auto_115181 ) ) ( not ( = ?auto_115179 ?auto_115182 ) ) ( not ( = ?auto_115179 ?auto_115183 ) ) ( not ( = ?auto_115179 ?auto_115184 ) ) ( not ( = ?auto_115179 ?auto_115185 ) ) ( not ( = ?auto_115179 ?auto_115186 ) ) ( not ( = ?auto_115180 ?auto_115181 ) ) ( not ( = ?auto_115180 ?auto_115182 ) ) ( not ( = ?auto_115180 ?auto_115183 ) ) ( not ( = ?auto_115180 ?auto_115184 ) ) ( not ( = ?auto_115180 ?auto_115185 ) ) ( not ( = ?auto_115180 ?auto_115186 ) ) ( not ( = ?auto_115181 ?auto_115182 ) ) ( not ( = ?auto_115181 ?auto_115183 ) ) ( not ( = ?auto_115181 ?auto_115184 ) ) ( not ( = ?auto_115181 ?auto_115185 ) ) ( not ( = ?auto_115181 ?auto_115186 ) ) ( not ( = ?auto_115182 ?auto_115183 ) ) ( not ( = ?auto_115182 ?auto_115184 ) ) ( not ( = ?auto_115182 ?auto_115185 ) ) ( not ( = ?auto_115182 ?auto_115186 ) ) ( not ( = ?auto_115183 ?auto_115184 ) ) ( not ( = ?auto_115183 ?auto_115185 ) ) ( not ( = ?auto_115183 ?auto_115186 ) ) ( not ( = ?auto_115184 ?auto_115185 ) ) ( not ( = ?auto_115184 ?auto_115186 ) ) ( not ( = ?auto_115185 ?auto_115186 ) ) ( ON ?auto_115184 ?auto_115185 ) ( ON ?auto_115183 ?auto_115184 ) ( ON ?auto_115182 ?auto_115183 ) ( ON ?auto_115181 ?auto_115182 ) ( ON ?auto_115180 ?auto_115181 ) ( CLEAR ?auto_115178 ) ( ON ?auto_115179 ?auto_115180 ) ( CLEAR ?auto_115179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115175 ?auto_115176 ?auto_115177 ?auto_115178 ?auto_115179 )
      ( MAKE-11PILE ?auto_115175 ?auto_115176 ?auto_115177 ?auto_115178 ?auto_115179 ?auto_115180 ?auto_115181 ?auto_115182 ?auto_115183 ?auto_115184 ?auto_115185 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115198 - BLOCK
      ?auto_115199 - BLOCK
      ?auto_115200 - BLOCK
      ?auto_115201 - BLOCK
      ?auto_115202 - BLOCK
      ?auto_115203 - BLOCK
      ?auto_115204 - BLOCK
      ?auto_115205 - BLOCK
      ?auto_115206 - BLOCK
      ?auto_115207 - BLOCK
      ?auto_115208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115208 ) ( ON-TABLE ?auto_115198 ) ( ON ?auto_115199 ?auto_115198 ) ( ON ?auto_115200 ?auto_115199 ) ( ON ?auto_115201 ?auto_115200 ) ( not ( = ?auto_115198 ?auto_115199 ) ) ( not ( = ?auto_115198 ?auto_115200 ) ) ( not ( = ?auto_115198 ?auto_115201 ) ) ( not ( = ?auto_115198 ?auto_115202 ) ) ( not ( = ?auto_115198 ?auto_115203 ) ) ( not ( = ?auto_115198 ?auto_115204 ) ) ( not ( = ?auto_115198 ?auto_115205 ) ) ( not ( = ?auto_115198 ?auto_115206 ) ) ( not ( = ?auto_115198 ?auto_115207 ) ) ( not ( = ?auto_115198 ?auto_115208 ) ) ( not ( = ?auto_115199 ?auto_115200 ) ) ( not ( = ?auto_115199 ?auto_115201 ) ) ( not ( = ?auto_115199 ?auto_115202 ) ) ( not ( = ?auto_115199 ?auto_115203 ) ) ( not ( = ?auto_115199 ?auto_115204 ) ) ( not ( = ?auto_115199 ?auto_115205 ) ) ( not ( = ?auto_115199 ?auto_115206 ) ) ( not ( = ?auto_115199 ?auto_115207 ) ) ( not ( = ?auto_115199 ?auto_115208 ) ) ( not ( = ?auto_115200 ?auto_115201 ) ) ( not ( = ?auto_115200 ?auto_115202 ) ) ( not ( = ?auto_115200 ?auto_115203 ) ) ( not ( = ?auto_115200 ?auto_115204 ) ) ( not ( = ?auto_115200 ?auto_115205 ) ) ( not ( = ?auto_115200 ?auto_115206 ) ) ( not ( = ?auto_115200 ?auto_115207 ) ) ( not ( = ?auto_115200 ?auto_115208 ) ) ( not ( = ?auto_115201 ?auto_115202 ) ) ( not ( = ?auto_115201 ?auto_115203 ) ) ( not ( = ?auto_115201 ?auto_115204 ) ) ( not ( = ?auto_115201 ?auto_115205 ) ) ( not ( = ?auto_115201 ?auto_115206 ) ) ( not ( = ?auto_115201 ?auto_115207 ) ) ( not ( = ?auto_115201 ?auto_115208 ) ) ( not ( = ?auto_115202 ?auto_115203 ) ) ( not ( = ?auto_115202 ?auto_115204 ) ) ( not ( = ?auto_115202 ?auto_115205 ) ) ( not ( = ?auto_115202 ?auto_115206 ) ) ( not ( = ?auto_115202 ?auto_115207 ) ) ( not ( = ?auto_115202 ?auto_115208 ) ) ( not ( = ?auto_115203 ?auto_115204 ) ) ( not ( = ?auto_115203 ?auto_115205 ) ) ( not ( = ?auto_115203 ?auto_115206 ) ) ( not ( = ?auto_115203 ?auto_115207 ) ) ( not ( = ?auto_115203 ?auto_115208 ) ) ( not ( = ?auto_115204 ?auto_115205 ) ) ( not ( = ?auto_115204 ?auto_115206 ) ) ( not ( = ?auto_115204 ?auto_115207 ) ) ( not ( = ?auto_115204 ?auto_115208 ) ) ( not ( = ?auto_115205 ?auto_115206 ) ) ( not ( = ?auto_115205 ?auto_115207 ) ) ( not ( = ?auto_115205 ?auto_115208 ) ) ( not ( = ?auto_115206 ?auto_115207 ) ) ( not ( = ?auto_115206 ?auto_115208 ) ) ( not ( = ?auto_115207 ?auto_115208 ) ) ( ON ?auto_115207 ?auto_115208 ) ( ON ?auto_115206 ?auto_115207 ) ( ON ?auto_115205 ?auto_115206 ) ( ON ?auto_115204 ?auto_115205 ) ( ON ?auto_115203 ?auto_115204 ) ( CLEAR ?auto_115201 ) ( ON ?auto_115202 ?auto_115203 ) ( CLEAR ?auto_115202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115198 ?auto_115199 ?auto_115200 ?auto_115201 ?auto_115202 )
      ( MAKE-11PILE ?auto_115198 ?auto_115199 ?auto_115200 ?auto_115201 ?auto_115202 ?auto_115203 ?auto_115204 ?auto_115205 ?auto_115206 ?auto_115207 ?auto_115208 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115220 - BLOCK
      ?auto_115221 - BLOCK
      ?auto_115222 - BLOCK
      ?auto_115223 - BLOCK
      ?auto_115224 - BLOCK
      ?auto_115225 - BLOCK
      ?auto_115226 - BLOCK
      ?auto_115227 - BLOCK
      ?auto_115228 - BLOCK
      ?auto_115229 - BLOCK
      ?auto_115230 - BLOCK
    )
    :vars
    (
      ?auto_115231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115230 ?auto_115231 ) ( ON-TABLE ?auto_115220 ) ( ON ?auto_115221 ?auto_115220 ) ( ON ?auto_115222 ?auto_115221 ) ( not ( = ?auto_115220 ?auto_115221 ) ) ( not ( = ?auto_115220 ?auto_115222 ) ) ( not ( = ?auto_115220 ?auto_115223 ) ) ( not ( = ?auto_115220 ?auto_115224 ) ) ( not ( = ?auto_115220 ?auto_115225 ) ) ( not ( = ?auto_115220 ?auto_115226 ) ) ( not ( = ?auto_115220 ?auto_115227 ) ) ( not ( = ?auto_115220 ?auto_115228 ) ) ( not ( = ?auto_115220 ?auto_115229 ) ) ( not ( = ?auto_115220 ?auto_115230 ) ) ( not ( = ?auto_115220 ?auto_115231 ) ) ( not ( = ?auto_115221 ?auto_115222 ) ) ( not ( = ?auto_115221 ?auto_115223 ) ) ( not ( = ?auto_115221 ?auto_115224 ) ) ( not ( = ?auto_115221 ?auto_115225 ) ) ( not ( = ?auto_115221 ?auto_115226 ) ) ( not ( = ?auto_115221 ?auto_115227 ) ) ( not ( = ?auto_115221 ?auto_115228 ) ) ( not ( = ?auto_115221 ?auto_115229 ) ) ( not ( = ?auto_115221 ?auto_115230 ) ) ( not ( = ?auto_115221 ?auto_115231 ) ) ( not ( = ?auto_115222 ?auto_115223 ) ) ( not ( = ?auto_115222 ?auto_115224 ) ) ( not ( = ?auto_115222 ?auto_115225 ) ) ( not ( = ?auto_115222 ?auto_115226 ) ) ( not ( = ?auto_115222 ?auto_115227 ) ) ( not ( = ?auto_115222 ?auto_115228 ) ) ( not ( = ?auto_115222 ?auto_115229 ) ) ( not ( = ?auto_115222 ?auto_115230 ) ) ( not ( = ?auto_115222 ?auto_115231 ) ) ( not ( = ?auto_115223 ?auto_115224 ) ) ( not ( = ?auto_115223 ?auto_115225 ) ) ( not ( = ?auto_115223 ?auto_115226 ) ) ( not ( = ?auto_115223 ?auto_115227 ) ) ( not ( = ?auto_115223 ?auto_115228 ) ) ( not ( = ?auto_115223 ?auto_115229 ) ) ( not ( = ?auto_115223 ?auto_115230 ) ) ( not ( = ?auto_115223 ?auto_115231 ) ) ( not ( = ?auto_115224 ?auto_115225 ) ) ( not ( = ?auto_115224 ?auto_115226 ) ) ( not ( = ?auto_115224 ?auto_115227 ) ) ( not ( = ?auto_115224 ?auto_115228 ) ) ( not ( = ?auto_115224 ?auto_115229 ) ) ( not ( = ?auto_115224 ?auto_115230 ) ) ( not ( = ?auto_115224 ?auto_115231 ) ) ( not ( = ?auto_115225 ?auto_115226 ) ) ( not ( = ?auto_115225 ?auto_115227 ) ) ( not ( = ?auto_115225 ?auto_115228 ) ) ( not ( = ?auto_115225 ?auto_115229 ) ) ( not ( = ?auto_115225 ?auto_115230 ) ) ( not ( = ?auto_115225 ?auto_115231 ) ) ( not ( = ?auto_115226 ?auto_115227 ) ) ( not ( = ?auto_115226 ?auto_115228 ) ) ( not ( = ?auto_115226 ?auto_115229 ) ) ( not ( = ?auto_115226 ?auto_115230 ) ) ( not ( = ?auto_115226 ?auto_115231 ) ) ( not ( = ?auto_115227 ?auto_115228 ) ) ( not ( = ?auto_115227 ?auto_115229 ) ) ( not ( = ?auto_115227 ?auto_115230 ) ) ( not ( = ?auto_115227 ?auto_115231 ) ) ( not ( = ?auto_115228 ?auto_115229 ) ) ( not ( = ?auto_115228 ?auto_115230 ) ) ( not ( = ?auto_115228 ?auto_115231 ) ) ( not ( = ?auto_115229 ?auto_115230 ) ) ( not ( = ?auto_115229 ?auto_115231 ) ) ( not ( = ?auto_115230 ?auto_115231 ) ) ( ON ?auto_115229 ?auto_115230 ) ( ON ?auto_115228 ?auto_115229 ) ( ON ?auto_115227 ?auto_115228 ) ( ON ?auto_115226 ?auto_115227 ) ( ON ?auto_115225 ?auto_115226 ) ( ON ?auto_115224 ?auto_115225 ) ( CLEAR ?auto_115222 ) ( ON ?auto_115223 ?auto_115224 ) ( CLEAR ?auto_115223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115220 ?auto_115221 ?auto_115222 ?auto_115223 )
      ( MAKE-11PILE ?auto_115220 ?auto_115221 ?auto_115222 ?auto_115223 ?auto_115224 ?auto_115225 ?auto_115226 ?auto_115227 ?auto_115228 ?auto_115229 ?auto_115230 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115243 - BLOCK
      ?auto_115244 - BLOCK
      ?auto_115245 - BLOCK
      ?auto_115246 - BLOCK
      ?auto_115247 - BLOCK
      ?auto_115248 - BLOCK
      ?auto_115249 - BLOCK
      ?auto_115250 - BLOCK
      ?auto_115251 - BLOCK
      ?auto_115252 - BLOCK
      ?auto_115253 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115253 ) ( ON-TABLE ?auto_115243 ) ( ON ?auto_115244 ?auto_115243 ) ( ON ?auto_115245 ?auto_115244 ) ( not ( = ?auto_115243 ?auto_115244 ) ) ( not ( = ?auto_115243 ?auto_115245 ) ) ( not ( = ?auto_115243 ?auto_115246 ) ) ( not ( = ?auto_115243 ?auto_115247 ) ) ( not ( = ?auto_115243 ?auto_115248 ) ) ( not ( = ?auto_115243 ?auto_115249 ) ) ( not ( = ?auto_115243 ?auto_115250 ) ) ( not ( = ?auto_115243 ?auto_115251 ) ) ( not ( = ?auto_115243 ?auto_115252 ) ) ( not ( = ?auto_115243 ?auto_115253 ) ) ( not ( = ?auto_115244 ?auto_115245 ) ) ( not ( = ?auto_115244 ?auto_115246 ) ) ( not ( = ?auto_115244 ?auto_115247 ) ) ( not ( = ?auto_115244 ?auto_115248 ) ) ( not ( = ?auto_115244 ?auto_115249 ) ) ( not ( = ?auto_115244 ?auto_115250 ) ) ( not ( = ?auto_115244 ?auto_115251 ) ) ( not ( = ?auto_115244 ?auto_115252 ) ) ( not ( = ?auto_115244 ?auto_115253 ) ) ( not ( = ?auto_115245 ?auto_115246 ) ) ( not ( = ?auto_115245 ?auto_115247 ) ) ( not ( = ?auto_115245 ?auto_115248 ) ) ( not ( = ?auto_115245 ?auto_115249 ) ) ( not ( = ?auto_115245 ?auto_115250 ) ) ( not ( = ?auto_115245 ?auto_115251 ) ) ( not ( = ?auto_115245 ?auto_115252 ) ) ( not ( = ?auto_115245 ?auto_115253 ) ) ( not ( = ?auto_115246 ?auto_115247 ) ) ( not ( = ?auto_115246 ?auto_115248 ) ) ( not ( = ?auto_115246 ?auto_115249 ) ) ( not ( = ?auto_115246 ?auto_115250 ) ) ( not ( = ?auto_115246 ?auto_115251 ) ) ( not ( = ?auto_115246 ?auto_115252 ) ) ( not ( = ?auto_115246 ?auto_115253 ) ) ( not ( = ?auto_115247 ?auto_115248 ) ) ( not ( = ?auto_115247 ?auto_115249 ) ) ( not ( = ?auto_115247 ?auto_115250 ) ) ( not ( = ?auto_115247 ?auto_115251 ) ) ( not ( = ?auto_115247 ?auto_115252 ) ) ( not ( = ?auto_115247 ?auto_115253 ) ) ( not ( = ?auto_115248 ?auto_115249 ) ) ( not ( = ?auto_115248 ?auto_115250 ) ) ( not ( = ?auto_115248 ?auto_115251 ) ) ( not ( = ?auto_115248 ?auto_115252 ) ) ( not ( = ?auto_115248 ?auto_115253 ) ) ( not ( = ?auto_115249 ?auto_115250 ) ) ( not ( = ?auto_115249 ?auto_115251 ) ) ( not ( = ?auto_115249 ?auto_115252 ) ) ( not ( = ?auto_115249 ?auto_115253 ) ) ( not ( = ?auto_115250 ?auto_115251 ) ) ( not ( = ?auto_115250 ?auto_115252 ) ) ( not ( = ?auto_115250 ?auto_115253 ) ) ( not ( = ?auto_115251 ?auto_115252 ) ) ( not ( = ?auto_115251 ?auto_115253 ) ) ( not ( = ?auto_115252 ?auto_115253 ) ) ( ON ?auto_115252 ?auto_115253 ) ( ON ?auto_115251 ?auto_115252 ) ( ON ?auto_115250 ?auto_115251 ) ( ON ?auto_115249 ?auto_115250 ) ( ON ?auto_115248 ?auto_115249 ) ( ON ?auto_115247 ?auto_115248 ) ( CLEAR ?auto_115245 ) ( ON ?auto_115246 ?auto_115247 ) ( CLEAR ?auto_115246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115243 ?auto_115244 ?auto_115245 ?auto_115246 )
      ( MAKE-11PILE ?auto_115243 ?auto_115244 ?auto_115245 ?auto_115246 ?auto_115247 ?auto_115248 ?auto_115249 ?auto_115250 ?auto_115251 ?auto_115252 ?auto_115253 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115265 - BLOCK
      ?auto_115266 - BLOCK
      ?auto_115267 - BLOCK
      ?auto_115268 - BLOCK
      ?auto_115269 - BLOCK
      ?auto_115270 - BLOCK
      ?auto_115271 - BLOCK
      ?auto_115272 - BLOCK
      ?auto_115273 - BLOCK
      ?auto_115274 - BLOCK
      ?auto_115275 - BLOCK
    )
    :vars
    (
      ?auto_115276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115275 ?auto_115276 ) ( ON-TABLE ?auto_115265 ) ( ON ?auto_115266 ?auto_115265 ) ( not ( = ?auto_115265 ?auto_115266 ) ) ( not ( = ?auto_115265 ?auto_115267 ) ) ( not ( = ?auto_115265 ?auto_115268 ) ) ( not ( = ?auto_115265 ?auto_115269 ) ) ( not ( = ?auto_115265 ?auto_115270 ) ) ( not ( = ?auto_115265 ?auto_115271 ) ) ( not ( = ?auto_115265 ?auto_115272 ) ) ( not ( = ?auto_115265 ?auto_115273 ) ) ( not ( = ?auto_115265 ?auto_115274 ) ) ( not ( = ?auto_115265 ?auto_115275 ) ) ( not ( = ?auto_115265 ?auto_115276 ) ) ( not ( = ?auto_115266 ?auto_115267 ) ) ( not ( = ?auto_115266 ?auto_115268 ) ) ( not ( = ?auto_115266 ?auto_115269 ) ) ( not ( = ?auto_115266 ?auto_115270 ) ) ( not ( = ?auto_115266 ?auto_115271 ) ) ( not ( = ?auto_115266 ?auto_115272 ) ) ( not ( = ?auto_115266 ?auto_115273 ) ) ( not ( = ?auto_115266 ?auto_115274 ) ) ( not ( = ?auto_115266 ?auto_115275 ) ) ( not ( = ?auto_115266 ?auto_115276 ) ) ( not ( = ?auto_115267 ?auto_115268 ) ) ( not ( = ?auto_115267 ?auto_115269 ) ) ( not ( = ?auto_115267 ?auto_115270 ) ) ( not ( = ?auto_115267 ?auto_115271 ) ) ( not ( = ?auto_115267 ?auto_115272 ) ) ( not ( = ?auto_115267 ?auto_115273 ) ) ( not ( = ?auto_115267 ?auto_115274 ) ) ( not ( = ?auto_115267 ?auto_115275 ) ) ( not ( = ?auto_115267 ?auto_115276 ) ) ( not ( = ?auto_115268 ?auto_115269 ) ) ( not ( = ?auto_115268 ?auto_115270 ) ) ( not ( = ?auto_115268 ?auto_115271 ) ) ( not ( = ?auto_115268 ?auto_115272 ) ) ( not ( = ?auto_115268 ?auto_115273 ) ) ( not ( = ?auto_115268 ?auto_115274 ) ) ( not ( = ?auto_115268 ?auto_115275 ) ) ( not ( = ?auto_115268 ?auto_115276 ) ) ( not ( = ?auto_115269 ?auto_115270 ) ) ( not ( = ?auto_115269 ?auto_115271 ) ) ( not ( = ?auto_115269 ?auto_115272 ) ) ( not ( = ?auto_115269 ?auto_115273 ) ) ( not ( = ?auto_115269 ?auto_115274 ) ) ( not ( = ?auto_115269 ?auto_115275 ) ) ( not ( = ?auto_115269 ?auto_115276 ) ) ( not ( = ?auto_115270 ?auto_115271 ) ) ( not ( = ?auto_115270 ?auto_115272 ) ) ( not ( = ?auto_115270 ?auto_115273 ) ) ( not ( = ?auto_115270 ?auto_115274 ) ) ( not ( = ?auto_115270 ?auto_115275 ) ) ( not ( = ?auto_115270 ?auto_115276 ) ) ( not ( = ?auto_115271 ?auto_115272 ) ) ( not ( = ?auto_115271 ?auto_115273 ) ) ( not ( = ?auto_115271 ?auto_115274 ) ) ( not ( = ?auto_115271 ?auto_115275 ) ) ( not ( = ?auto_115271 ?auto_115276 ) ) ( not ( = ?auto_115272 ?auto_115273 ) ) ( not ( = ?auto_115272 ?auto_115274 ) ) ( not ( = ?auto_115272 ?auto_115275 ) ) ( not ( = ?auto_115272 ?auto_115276 ) ) ( not ( = ?auto_115273 ?auto_115274 ) ) ( not ( = ?auto_115273 ?auto_115275 ) ) ( not ( = ?auto_115273 ?auto_115276 ) ) ( not ( = ?auto_115274 ?auto_115275 ) ) ( not ( = ?auto_115274 ?auto_115276 ) ) ( not ( = ?auto_115275 ?auto_115276 ) ) ( ON ?auto_115274 ?auto_115275 ) ( ON ?auto_115273 ?auto_115274 ) ( ON ?auto_115272 ?auto_115273 ) ( ON ?auto_115271 ?auto_115272 ) ( ON ?auto_115270 ?auto_115271 ) ( ON ?auto_115269 ?auto_115270 ) ( ON ?auto_115268 ?auto_115269 ) ( CLEAR ?auto_115266 ) ( ON ?auto_115267 ?auto_115268 ) ( CLEAR ?auto_115267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115265 ?auto_115266 ?auto_115267 )
      ( MAKE-11PILE ?auto_115265 ?auto_115266 ?auto_115267 ?auto_115268 ?auto_115269 ?auto_115270 ?auto_115271 ?auto_115272 ?auto_115273 ?auto_115274 ?auto_115275 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115288 - BLOCK
      ?auto_115289 - BLOCK
      ?auto_115290 - BLOCK
      ?auto_115291 - BLOCK
      ?auto_115292 - BLOCK
      ?auto_115293 - BLOCK
      ?auto_115294 - BLOCK
      ?auto_115295 - BLOCK
      ?auto_115296 - BLOCK
      ?auto_115297 - BLOCK
      ?auto_115298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115298 ) ( ON-TABLE ?auto_115288 ) ( ON ?auto_115289 ?auto_115288 ) ( not ( = ?auto_115288 ?auto_115289 ) ) ( not ( = ?auto_115288 ?auto_115290 ) ) ( not ( = ?auto_115288 ?auto_115291 ) ) ( not ( = ?auto_115288 ?auto_115292 ) ) ( not ( = ?auto_115288 ?auto_115293 ) ) ( not ( = ?auto_115288 ?auto_115294 ) ) ( not ( = ?auto_115288 ?auto_115295 ) ) ( not ( = ?auto_115288 ?auto_115296 ) ) ( not ( = ?auto_115288 ?auto_115297 ) ) ( not ( = ?auto_115288 ?auto_115298 ) ) ( not ( = ?auto_115289 ?auto_115290 ) ) ( not ( = ?auto_115289 ?auto_115291 ) ) ( not ( = ?auto_115289 ?auto_115292 ) ) ( not ( = ?auto_115289 ?auto_115293 ) ) ( not ( = ?auto_115289 ?auto_115294 ) ) ( not ( = ?auto_115289 ?auto_115295 ) ) ( not ( = ?auto_115289 ?auto_115296 ) ) ( not ( = ?auto_115289 ?auto_115297 ) ) ( not ( = ?auto_115289 ?auto_115298 ) ) ( not ( = ?auto_115290 ?auto_115291 ) ) ( not ( = ?auto_115290 ?auto_115292 ) ) ( not ( = ?auto_115290 ?auto_115293 ) ) ( not ( = ?auto_115290 ?auto_115294 ) ) ( not ( = ?auto_115290 ?auto_115295 ) ) ( not ( = ?auto_115290 ?auto_115296 ) ) ( not ( = ?auto_115290 ?auto_115297 ) ) ( not ( = ?auto_115290 ?auto_115298 ) ) ( not ( = ?auto_115291 ?auto_115292 ) ) ( not ( = ?auto_115291 ?auto_115293 ) ) ( not ( = ?auto_115291 ?auto_115294 ) ) ( not ( = ?auto_115291 ?auto_115295 ) ) ( not ( = ?auto_115291 ?auto_115296 ) ) ( not ( = ?auto_115291 ?auto_115297 ) ) ( not ( = ?auto_115291 ?auto_115298 ) ) ( not ( = ?auto_115292 ?auto_115293 ) ) ( not ( = ?auto_115292 ?auto_115294 ) ) ( not ( = ?auto_115292 ?auto_115295 ) ) ( not ( = ?auto_115292 ?auto_115296 ) ) ( not ( = ?auto_115292 ?auto_115297 ) ) ( not ( = ?auto_115292 ?auto_115298 ) ) ( not ( = ?auto_115293 ?auto_115294 ) ) ( not ( = ?auto_115293 ?auto_115295 ) ) ( not ( = ?auto_115293 ?auto_115296 ) ) ( not ( = ?auto_115293 ?auto_115297 ) ) ( not ( = ?auto_115293 ?auto_115298 ) ) ( not ( = ?auto_115294 ?auto_115295 ) ) ( not ( = ?auto_115294 ?auto_115296 ) ) ( not ( = ?auto_115294 ?auto_115297 ) ) ( not ( = ?auto_115294 ?auto_115298 ) ) ( not ( = ?auto_115295 ?auto_115296 ) ) ( not ( = ?auto_115295 ?auto_115297 ) ) ( not ( = ?auto_115295 ?auto_115298 ) ) ( not ( = ?auto_115296 ?auto_115297 ) ) ( not ( = ?auto_115296 ?auto_115298 ) ) ( not ( = ?auto_115297 ?auto_115298 ) ) ( ON ?auto_115297 ?auto_115298 ) ( ON ?auto_115296 ?auto_115297 ) ( ON ?auto_115295 ?auto_115296 ) ( ON ?auto_115294 ?auto_115295 ) ( ON ?auto_115293 ?auto_115294 ) ( ON ?auto_115292 ?auto_115293 ) ( ON ?auto_115291 ?auto_115292 ) ( CLEAR ?auto_115289 ) ( ON ?auto_115290 ?auto_115291 ) ( CLEAR ?auto_115290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115288 ?auto_115289 ?auto_115290 )
      ( MAKE-11PILE ?auto_115288 ?auto_115289 ?auto_115290 ?auto_115291 ?auto_115292 ?auto_115293 ?auto_115294 ?auto_115295 ?auto_115296 ?auto_115297 ?auto_115298 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115310 - BLOCK
      ?auto_115311 - BLOCK
      ?auto_115312 - BLOCK
      ?auto_115313 - BLOCK
      ?auto_115314 - BLOCK
      ?auto_115315 - BLOCK
      ?auto_115316 - BLOCK
      ?auto_115317 - BLOCK
      ?auto_115318 - BLOCK
      ?auto_115319 - BLOCK
      ?auto_115320 - BLOCK
    )
    :vars
    (
      ?auto_115321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115320 ?auto_115321 ) ( ON-TABLE ?auto_115310 ) ( not ( = ?auto_115310 ?auto_115311 ) ) ( not ( = ?auto_115310 ?auto_115312 ) ) ( not ( = ?auto_115310 ?auto_115313 ) ) ( not ( = ?auto_115310 ?auto_115314 ) ) ( not ( = ?auto_115310 ?auto_115315 ) ) ( not ( = ?auto_115310 ?auto_115316 ) ) ( not ( = ?auto_115310 ?auto_115317 ) ) ( not ( = ?auto_115310 ?auto_115318 ) ) ( not ( = ?auto_115310 ?auto_115319 ) ) ( not ( = ?auto_115310 ?auto_115320 ) ) ( not ( = ?auto_115310 ?auto_115321 ) ) ( not ( = ?auto_115311 ?auto_115312 ) ) ( not ( = ?auto_115311 ?auto_115313 ) ) ( not ( = ?auto_115311 ?auto_115314 ) ) ( not ( = ?auto_115311 ?auto_115315 ) ) ( not ( = ?auto_115311 ?auto_115316 ) ) ( not ( = ?auto_115311 ?auto_115317 ) ) ( not ( = ?auto_115311 ?auto_115318 ) ) ( not ( = ?auto_115311 ?auto_115319 ) ) ( not ( = ?auto_115311 ?auto_115320 ) ) ( not ( = ?auto_115311 ?auto_115321 ) ) ( not ( = ?auto_115312 ?auto_115313 ) ) ( not ( = ?auto_115312 ?auto_115314 ) ) ( not ( = ?auto_115312 ?auto_115315 ) ) ( not ( = ?auto_115312 ?auto_115316 ) ) ( not ( = ?auto_115312 ?auto_115317 ) ) ( not ( = ?auto_115312 ?auto_115318 ) ) ( not ( = ?auto_115312 ?auto_115319 ) ) ( not ( = ?auto_115312 ?auto_115320 ) ) ( not ( = ?auto_115312 ?auto_115321 ) ) ( not ( = ?auto_115313 ?auto_115314 ) ) ( not ( = ?auto_115313 ?auto_115315 ) ) ( not ( = ?auto_115313 ?auto_115316 ) ) ( not ( = ?auto_115313 ?auto_115317 ) ) ( not ( = ?auto_115313 ?auto_115318 ) ) ( not ( = ?auto_115313 ?auto_115319 ) ) ( not ( = ?auto_115313 ?auto_115320 ) ) ( not ( = ?auto_115313 ?auto_115321 ) ) ( not ( = ?auto_115314 ?auto_115315 ) ) ( not ( = ?auto_115314 ?auto_115316 ) ) ( not ( = ?auto_115314 ?auto_115317 ) ) ( not ( = ?auto_115314 ?auto_115318 ) ) ( not ( = ?auto_115314 ?auto_115319 ) ) ( not ( = ?auto_115314 ?auto_115320 ) ) ( not ( = ?auto_115314 ?auto_115321 ) ) ( not ( = ?auto_115315 ?auto_115316 ) ) ( not ( = ?auto_115315 ?auto_115317 ) ) ( not ( = ?auto_115315 ?auto_115318 ) ) ( not ( = ?auto_115315 ?auto_115319 ) ) ( not ( = ?auto_115315 ?auto_115320 ) ) ( not ( = ?auto_115315 ?auto_115321 ) ) ( not ( = ?auto_115316 ?auto_115317 ) ) ( not ( = ?auto_115316 ?auto_115318 ) ) ( not ( = ?auto_115316 ?auto_115319 ) ) ( not ( = ?auto_115316 ?auto_115320 ) ) ( not ( = ?auto_115316 ?auto_115321 ) ) ( not ( = ?auto_115317 ?auto_115318 ) ) ( not ( = ?auto_115317 ?auto_115319 ) ) ( not ( = ?auto_115317 ?auto_115320 ) ) ( not ( = ?auto_115317 ?auto_115321 ) ) ( not ( = ?auto_115318 ?auto_115319 ) ) ( not ( = ?auto_115318 ?auto_115320 ) ) ( not ( = ?auto_115318 ?auto_115321 ) ) ( not ( = ?auto_115319 ?auto_115320 ) ) ( not ( = ?auto_115319 ?auto_115321 ) ) ( not ( = ?auto_115320 ?auto_115321 ) ) ( ON ?auto_115319 ?auto_115320 ) ( ON ?auto_115318 ?auto_115319 ) ( ON ?auto_115317 ?auto_115318 ) ( ON ?auto_115316 ?auto_115317 ) ( ON ?auto_115315 ?auto_115316 ) ( ON ?auto_115314 ?auto_115315 ) ( ON ?auto_115313 ?auto_115314 ) ( ON ?auto_115312 ?auto_115313 ) ( CLEAR ?auto_115310 ) ( ON ?auto_115311 ?auto_115312 ) ( CLEAR ?auto_115311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115310 ?auto_115311 )
      ( MAKE-11PILE ?auto_115310 ?auto_115311 ?auto_115312 ?auto_115313 ?auto_115314 ?auto_115315 ?auto_115316 ?auto_115317 ?auto_115318 ?auto_115319 ?auto_115320 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115333 - BLOCK
      ?auto_115334 - BLOCK
      ?auto_115335 - BLOCK
      ?auto_115336 - BLOCK
      ?auto_115337 - BLOCK
      ?auto_115338 - BLOCK
      ?auto_115339 - BLOCK
      ?auto_115340 - BLOCK
      ?auto_115341 - BLOCK
      ?auto_115342 - BLOCK
      ?auto_115343 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115343 ) ( ON-TABLE ?auto_115333 ) ( not ( = ?auto_115333 ?auto_115334 ) ) ( not ( = ?auto_115333 ?auto_115335 ) ) ( not ( = ?auto_115333 ?auto_115336 ) ) ( not ( = ?auto_115333 ?auto_115337 ) ) ( not ( = ?auto_115333 ?auto_115338 ) ) ( not ( = ?auto_115333 ?auto_115339 ) ) ( not ( = ?auto_115333 ?auto_115340 ) ) ( not ( = ?auto_115333 ?auto_115341 ) ) ( not ( = ?auto_115333 ?auto_115342 ) ) ( not ( = ?auto_115333 ?auto_115343 ) ) ( not ( = ?auto_115334 ?auto_115335 ) ) ( not ( = ?auto_115334 ?auto_115336 ) ) ( not ( = ?auto_115334 ?auto_115337 ) ) ( not ( = ?auto_115334 ?auto_115338 ) ) ( not ( = ?auto_115334 ?auto_115339 ) ) ( not ( = ?auto_115334 ?auto_115340 ) ) ( not ( = ?auto_115334 ?auto_115341 ) ) ( not ( = ?auto_115334 ?auto_115342 ) ) ( not ( = ?auto_115334 ?auto_115343 ) ) ( not ( = ?auto_115335 ?auto_115336 ) ) ( not ( = ?auto_115335 ?auto_115337 ) ) ( not ( = ?auto_115335 ?auto_115338 ) ) ( not ( = ?auto_115335 ?auto_115339 ) ) ( not ( = ?auto_115335 ?auto_115340 ) ) ( not ( = ?auto_115335 ?auto_115341 ) ) ( not ( = ?auto_115335 ?auto_115342 ) ) ( not ( = ?auto_115335 ?auto_115343 ) ) ( not ( = ?auto_115336 ?auto_115337 ) ) ( not ( = ?auto_115336 ?auto_115338 ) ) ( not ( = ?auto_115336 ?auto_115339 ) ) ( not ( = ?auto_115336 ?auto_115340 ) ) ( not ( = ?auto_115336 ?auto_115341 ) ) ( not ( = ?auto_115336 ?auto_115342 ) ) ( not ( = ?auto_115336 ?auto_115343 ) ) ( not ( = ?auto_115337 ?auto_115338 ) ) ( not ( = ?auto_115337 ?auto_115339 ) ) ( not ( = ?auto_115337 ?auto_115340 ) ) ( not ( = ?auto_115337 ?auto_115341 ) ) ( not ( = ?auto_115337 ?auto_115342 ) ) ( not ( = ?auto_115337 ?auto_115343 ) ) ( not ( = ?auto_115338 ?auto_115339 ) ) ( not ( = ?auto_115338 ?auto_115340 ) ) ( not ( = ?auto_115338 ?auto_115341 ) ) ( not ( = ?auto_115338 ?auto_115342 ) ) ( not ( = ?auto_115338 ?auto_115343 ) ) ( not ( = ?auto_115339 ?auto_115340 ) ) ( not ( = ?auto_115339 ?auto_115341 ) ) ( not ( = ?auto_115339 ?auto_115342 ) ) ( not ( = ?auto_115339 ?auto_115343 ) ) ( not ( = ?auto_115340 ?auto_115341 ) ) ( not ( = ?auto_115340 ?auto_115342 ) ) ( not ( = ?auto_115340 ?auto_115343 ) ) ( not ( = ?auto_115341 ?auto_115342 ) ) ( not ( = ?auto_115341 ?auto_115343 ) ) ( not ( = ?auto_115342 ?auto_115343 ) ) ( ON ?auto_115342 ?auto_115343 ) ( ON ?auto_115341 ?auto_115342 ) ( ON ?auto_115340 ?auto_115341 ) ( ON ?auto_115339 ?auto_115340 ) ( ON ?auto_115338 ?auto_115339 ) ( ON ?auto_115337 ?auto_115338 ) ( ON ?auto_115336 ?auto_115337 ) ( ON ?auto_115335 ?auto_115336 ) ( CLEAR ?auto_115333 ) ( ON ?auto_115334 ?auto_115335 ) ( CLEAR ?auto_115334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115333 ?auto_115334 )
      ( MAKE-11PILE ?auto_115333 ?auto_115334 ?auto_115335 ?auto_115336 ?auto_115337 ?auto_115338 ?auto_115339 ?auto_115340 ?auto_115341 ?auto_115342 ?auto_115343 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115355 - BLOCK
      ?auto_115356 - BLOCK
      ?auto_115357 - BLOCK
      ?auto_115358 - BLOCK
      ?auto_115359 - BLOCK
      ?auto_115360 - BLOCK
      ?auto_115361 - BLOCK
      ?auto_115362 - BLOCK
      ?auto_115363 - BLOCK
      ?auto_115364 - BLOCK
      ?auto_115365 - BLOCK
    )
    :vars
    (
      ?auto_115366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115365 ?auto_115366 ) ( not ( = ?auto_115355 ?auto_115356 ) ) ( not ( = ?auto_115355 ?auto_115357 ) ) ( not ( = ?auto_115355 ?auto_115358 ) ) ( not ( = ?auto_115355 ?auto_115359 ) ) ( not ( = ?auto_115355 ?auto_115360 ) ) ( not ( = ?auto_115355 ?auto_115361 ) ) ( not ( = ?auto_115355 ?auto_115362 ) ) ( not ( = ?auto_115355 ?auto_115363 ) ) ( not ( = ?auto_115355 ?auto_115364 ) ) ( not ( = ?auto_115355 ?auto_115365 ) ) ( not ( = ?auto_115355 ?auto_115366 ) ) ( not ( = ?auto_115356 ?auto_115357 ) ) ( not ( = ?auto_115356 ?auto_115358 ) ) ( not ( = ?auto_115356 ?auto_115359 ) ) ( not ( = ?auto_115356 ?auto_115360 ) ) ( not ( = ?auto_115356 ?auto_115361 ) ) ( not ( = ?auto_115356 ?auto_115362 ) ) ( not ( = ?auto_115356 ?auto_115363 ) ) ( not ( = ?auto_115356 ?auto_115364 ) ) ( not ( = ?auto_115356 ?auto_115365 ) ) ( not ( = ?auto_115356 ?auto_115366 ) ) ( not ( = ?auto_115357 ?auto_115358 ) ) ( not ( = ?auto_115357 ?auto_115359 ) ) ( not ( = ?auto_115357 ?auto_115360 ) ) ( not ( = ?auto_115357 ?auto_115361 ) ) ( not ( = ?auto_115357 ?auto_115362 ) ) ( not ( = ?auto_115357 ?auto_115363 ) ) ( not ( = ?auto_115357 ?auto_115364 ) ) ( not ( = ?auto_115357 ?auto_115365 ) ) ( not ( = ?auto_115357 ?auto_115366 ) ) ( not ( = ?auto_115358 ?auto_115359 ) ) ( not ( = ?auto_115358 ?auto_115360 ) ) ( not ( = ?auto_115358 ?auto_115361 ) ) ( not ( = ?auto_115358 ?auto_115362 ) ) ( not ( = ?auto_115358 ?auto_115363 ) ) ( not ( = ?auto_115358 ?auto_115364 ) ) ( not ( = ?auto_115358 ?auto_115365 ) ) ( not ( = ?auto_115358 ?auto_115366 ) ) ( not ( = ?auto_115359 ?auto_115360 ) ) ( not ( = ?auto_115359 ?auto_115361 ) ) ( not ( = ?auto_115359 ?auto_115362 ) ) ( not ( = ?auto_115359 ?auto_115363 ) ) ( not ( = ?auto_115359 ?auto_115364 ) ) ( not ( = ?auto_115359 ?auto_115365 ) ) ( not ( = ?auto_115359 ?auto_115366 ) ) ( not ( = ?auto_115360 ?auto_115361 ) ) ( not ( = ?auto_115360 ?auto_115362 ) ) ( not ( = ?auto_115360 ?auto_115363 ) ) ( not ( = ?auto_115360 ?auto_115364 ) ) ( not ( = ?auto_115360 ?auto_115365 ) ) ( not ( = ?auto_115360 ?auto_115366 ) ) ( not ( = ?auto_115361 ?auto_115362 ) ) ( not ( = ?auto_115361 ?auto_115363 ) ) ( not ( = ?auto_115361 ?auto_115364 ) ) ( not ( = ?auto_115361 ?auto_115365 ) ) ( not ( = ?auto_115361 ?auto_115366 ) ) ( not ( = ?auto_115362 ?auto_115363 ) ) ( not ( = ?auto_115362 ?auto_115364 ) ) ( not ( = ?auto_115362 ?auto_115365 ) ) ( not ( = ?auto_115362 ?auto_115366 ) ) ( not ( = ?auto_115363 ?auto_115364 ) ) ( not ( = ?auto_115363 ?auto_115365 ) ) ( not ( = ?auto_115363 ?auto_115366 ) ) ( not ( = ?auto_115364 ?auto_115365 ) ) ( not ( = ?auto_115364 ?auto_115366 ) ) ( not ( = ?auto_115365 ?auto_115366 ) ) ( ON ?auto_115364 ?auto_115365 ) ( ON ?auto_115363 ?auto_115364 ) ( ON ?auto_115362 ?auto_115363 ) ( ON ?auto_115361 ?auto_115362 ) ( ON ?auto_115360 ?auto_115361 ) ( ON ?auto_115359 ?auto_115360 ) ( ON ?auto_115358 ?auto_115359 ) ( ON ?auto_115357 ?auto_115358 ) ( ON ?auto_115356 ?auto_115357 ) ( ON ?auto_115355 ?auto_115356 ) ( CLEAR ?auto_115355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115355 )
      ( MAKE-11PILE ?auto_115355 ?auto_115356 ?auto_115357 ?auto_115358 ?auto_115359 ?auto_115360 ?auto_115361 ?auto_115362 ?auto_115363 ?auto_115364 ?auto_115365 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115378 - BLOCK
      ?auto_115379 - BLOCK
      ?auto_115380 - BLOCK
      ?auto_115381 - BLOCK
      ?auto_115382 - BLOCK
      ?auto_115383 - BLOCK
      ?auto_115384 - BLOCK
      ?auto_115385 - BLOCK
      ?auto_115386 - BLOCK
      ?auto_115387 - BLOCK
      ?auto_115388 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115388 ) ( not ( = ?auto_115378 ?auto_115379 ) ) ( not ( = ?auto_115378 ?auto_115380 ) ) ( not ( = ?auto_115378 ?auto_115381 ) ) ( not ( = ?auto_115378 ?auto_115382 ) ) ( not ( = ?auto_115378 ?auto_115383 ) ) ( not ( = ?auto_115378 ?auto_115384 ) ) ( not ( = ?auto_115378 ?auto_115385 ) ) ( not ( = ?auto_115378 ?auto_115386 ) ) ( not ( = ?auto_115378 ?auto_115387 ) ) ( not ( = ?auto_115378 ?auto_115388 ) ) ( not ( = ?auto_115379 ?auto_115380 ) ) ( not ( = ?auto_115379 ?auto_115381 ) ) ( not ( = ?auto_115379 ?auto_115382 ) ) ( not ( = ?auto_115379 ?auto_115383 ) ) ( not ( = ?auto_115379 ?auto_115384 ) ) ( not ( = ?auto_115379 ?auto_115385 ) ) ( not ( = ?auto_115379 ?auto_115386 ) ) ( not ( = ?auto_115379 ?auto_115387 ) ) ( not ( = ?auto_115379 ?auto_115388 ) ) ( not ( = ?auto_115380 ?auto_115381 ) ) ( not ( = ?auto_115380 ?auto_115382 ) ) ( not ( = ?auto_115380 ?auto_115383 ) ) ( not ( = ?auto_115380 ?auto_115384 ) ) ( not ( = ?auto_115380 ?auto_115385 ) ) ( not ( = ?auto_115380 ?auto_115386 ) ) ( not ( = ?auto_115380 ?auto_115387 ) ) ( not ( = ?auto_115380 ?auto_115388 ) ) ( not ( = ?auto_115381 ?auto_115382 ) ) ( not ( = ?auto_115381 ?auto_115383 ) ) ( not ( = ?auto_115381 ?auto_115384 ) ) ( not ( = ?auto_115381 ?auto_115385 ) ) ( not ( = ?auto_115381 ?auto_115386 ) ) ( not ( = ?auto_115381 ?auto_115387 ) ) ( not ( = ?auto_115381 ?auto_115388 ) ) ( not ( = ?auto_115382 ?auto_115383 ) ) ( not ( = ?auto_115382 ?auto_115384 ) ) ( not ( = ?auto_115382 ?auto_115385 ) ) ( not ( = ?auto_115382 ?auto_115386 ) ) ( not ( = ?auto_115382 ?auto_115387 ) ) ( not ( = ?auto_115382 ?auto_115388 ) ) ( not ( = ?auto_115383 ?auto_115384 ) ) ( not ( = ?auto_115383 ?auto_115385 ) ) ( not ( = ?auto_115383 ?auto_115386 ) ) ( not ( = ?auto_115383 ?auto_115387 ) ) ( not ( = ?auto_115383 ?auto_115388 ) ) ( not ( = ?auto_115384 ?auto_115385 ) ) ( not ( = ?auto_115384 ?auto_115386 ) ) ( not ( = ?auto_115384 ?auto_115387 ) ) ( not ( = ?auto_115384 ?auto_115388 ) ) ( not ( = ?auto_115385 ?auto_115386 ) ) ( not ( = ?auto_115385 ?auto_115387 ) ) ( not ( = ?auto_115385 ?auto_115388 ) ) ( not ( = ?auto_115386 ?auto_115387 ) ) ( not ( = ?auto_115386 ?auto_115388 ) ) ( not ( = ?auto_115387 ?auto_115388 ) ) ( ON ?auto_115387 ?auto_115388 ) ( ON ?auto_115386 ?auto_115387 ) ( ON ?auto_115385 ?auto_115386 ) ( ON ?auto_115384 ?auto_115385 ) ( ON ?auto_115383 ?auto_115384 ) ( ON ?auto_115382 ?auto_115383 ) ( ON ?auto_115381 ?auto_115382 ) ( ON ?auto_115380 ?auto_115381 ) ( ON ?auto_115379 ?auto_115380 ) ( ON ?auto_115378 ?auto_115379 ) ( CLEAR ?auto_115378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115378 )
      ( MAKE-11PILE ?auto_115378 ?auto_115379 ?auto_115380 ?auto_115381 ?auto_115382 ?auto_115383 ?auto_115384 ?auto_115385 ?auto_115386 ?auto_115387 ?auto_115388 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_115400 - BLOCK
      ?auto_115401 - BLOCK
      ?auto_115402 - BLOCK
      ?auto_115403 - BLOCK
      ?auto_115404 - BLOCK
      ?auto_115405 - BLOCK
      ?auto_115406 - BLOCK
      ?auto_115407 - BLOCK
      ?auto_115408 - BLOCK
      ?auto_115409 - BLOCK
      ?auto_115410 - BLOCK
    )
    :vars
    (
      ?auto_115411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115400 ?auto_115401 ) ) ( not ( = ?auto_115400 ?auto_115402 ) ) ( not ( = ?auto_115400 ?auto_115403 ) ) ( not ( = ?auto_115400 ?auto_115404 ) ) ( not ( = ?auto_115400 ?auto_115405 ) ) ( not ( = ?auto_115400 ?auto_115406 ) ) ( not ( = ?auto_115400 ?auto_115407 ) ) ( not ( = ?auto_115400 ?auto_115408 ) ) ( not ( = ?auto_115400 ?auto_115409 ) ) ( not ( = ?auto_115400 ?auto_115410 ) ) ( not ( = ?auto_115401 ?auto_115402 ) ) ( not ( = ?auto_115401 ?auto_115403 ) ) ( not ( = ?auto_115401 ?auto_115404 ) ) ( not ( = ?auto_115401 ?auto_115405 ) ) ( not ( = ?auto_115401 ?auto_115406 ) ) ( not ( = ?auto_115401 ?auto_115407 ) ) ( not ( = ?auto_115401 ?auto_115408 ) ) ( not ( = ?auto_115401 ?auto_115409 ) ) ( not ( = ?auto_115401 ?auto_115410 ) ) ( not ( = ?auto_115402 ?auto_115403 ) ) ( not ( = ?auto_115402 ?auto_115404 ) ) ( not ( = ?auto_115402 ?auto_115405 ) ) ( not ( = ?auto_115402 ?auto_115406 ) ) ( not ( = ?auto_115402 ?auto_115407 ) ) ( not ( = ?auto_115402 ?auto_115408 ) ) ( not ( = ?auto_115402 ?auto_115409 ) ) ( not ( = ?auto_115402 ?auto_115410 ) ) ( not ( = ?auto_115403 ?auto_115404 ) ) ( not ( = ?auto_115403 ?auto_115405 ) ) ( not ( = ?auto_115403 ?auto_115406 ) ) ( not ( = ?auto_115403 ?auto_115407 ) ) ( not ( = ?auto_115403 ?auto_115408 ) ) ( not ( = ?auto_115403 ?auto_115409 ) ) ( not ( = ?auto_115403 ?auto_115410 ) ) ( not ( = ?auto_115404 ?auto_115405 ) ) ( not ( = ?auto_115404 ?auto_115406 ) ) ( not ( = ?auto_115404 ?auto_115407 ) ) ( not ( = ?auto_115404 ?auto_115408 ) ) ( not ( = ?auto_115404 ?auto_115409 ) ) ( not ( = ?auto_115404 ?auto_115410 ) ) ( not ( = ?auto_115405 ?auto_115406 ) ) ( not ( = ?auto_115405 ?auto_115407 ) ) ( not ( = ?auto_115405 ?auto_115408 ) ) ( not ( = ?auto_115405 ?auto_115409 ) ) ( not ( = ?auto_115405 ?auto_115410 ) ) ( not ( = ?auto_115406 ?auto_115407 ) ) ( not ( = ?auto_115406 ?auto_115408 ) ) ( not ( = ?auto_115406 ?auto_115409 ) ) ( not ( = ?auto_115406 ?auto_115410 ) ) ( not ( = ?auto_115407 ?auto_115408 ) ) ( not ( = ?auto_115407 ?auto_115409 ) ) ( not ( = ?auto_115407 ?auto_115410 ) ) ( not ( = ?auto_115408 ?auto_115409 ) ) ( not ( = ?auto_115408 ?auto_115410 ) ) ( not ( = ?auto_115409 ?auto_115410 ) ) ( ON ?auto_115400 ?auto_115411 ) ( not ( = ?auto_115410 ?auto_115411 ) ) ( not ( = ?auto_115409 ?auto_115411 ) ) ( not ( = ?auto_115408 ?auto_115411 ) ) ( not ( = ?auto_115407 ?auto_115411 ) ) ( not ( = ?auto_115406 ?auto_115411 ) ) ( not ( = ?auto_115405 ?auto_115411 ) ) ( not ( = ?auto_115404 ?auto_115411 ) ) ( not ( = ?auto_115403 ?auto_115411 ) ) ( not ( = ?auto_115402 ?auto_115411 ) ) ( not ( = ?auto_115401 ?auto_115411 ) ) ( not ( = ?auto_115400 ?auto_115411 ) ) ( ON ?auto_115401 ?auto_115400 ) ( ON ?auto_115402 ?auto_115401 ) ( ON ?auto_115403 ?auto_115402 ) ( ON ?auto_115404 ?auto_115403 ) ( ON ?auto_115405 ?auto_115404 ) ( ON ?auto_115406 ?auto_115405 ) ( ON ?auto_115407 ?auto_115406 ) ( ON ?auto_115408 ?auto_115407 ) ( ON ?auto_115409 ?auto_115408 ) ( ON ?auto_115410 ?auto_115409 ) ( CLEAR ?auto_115410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_115410 ?auto_115409 ?auto_115408 ?auto_115407 ?auto_115406 ?auto_115405 ?auto_115404 ?auto_115403 ?auto_115402 ?auto_115401 ?auto_115400 )
      ( MAKE-11PILE ?auto_115400 ?auto_115401 ?auto_115402 ?auto_115403 ?auto_115404 ?auto_115405 ?auto_115406 ?auto_115407 ?auto_115408 ?auto_115409 ?auto_115410 ) )
  )

)

