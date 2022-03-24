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
      ?auto_62361 - BLOCK
    )
    :vars
    (
      ?auto_62362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62361 ?auto_62362 ) ( CLEAR ?auto_62361 ) ( HAND-EMPTY ) ( not ( = ?auto_62361 ?auto_62362 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62361 ?auto_62362 )
      ( !PUTDOWN ?auto_62361 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62364 - BLOCK
    )
    :vars
    (
      ?auto_62365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62364 ?auto_62365 ) ( CLEAR ?auto_62364 ) ( HAND-EMPTY ) ( not ( = ?auto_62364 ?auto_62365 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62364 ?auto_62365 )
      ( !PUTDOWN ?auto_62364 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62368 - BLOCK
      ?auto_62369 - BLOCK
    )
    :vars
    (
      ?auto_62370 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62368 ) ( ON ?auto_62369 ?auto_62370 ) ( CLEAR ?auto_62369 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62368 ) ( not ( = ?auto_62368 ?auto_62369 ) ) ( not ( = ?auto_62368 ?auto_62370 ) ) ( not ( = ?auto_62369 ?auto_62370 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62369 ?auto_62370 )
      ( !STACK ?auto_62369 ?auto_62368 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62373 - BLOCK
      ?auto_62374 - BLOCK
    )
    :vars
    (
      ?auto_62375 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62373 ) ( ON ?auto_62374 ?auto_62375 ) ( CLEAR ?auto_62374 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62373 ) ( not ( = ?auto_62373 ?auto_62374 ) ) ( not ( = ?auto_62373 ?auto_62375 ) ) ( not ( = ?auto_62374 ?auto_62375 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62374 ?auto_62375 )
      ( !STACK ?auto_62374 ?auto_62373 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62378 - BLOCK
      ?auto_62379 - BLOCK
    )
    :vars
    (
      ?auto_62380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62379 ?auto_62380 ) ( not ( = ?auto_62378 ?auto_62379 ) ) ( not ( = ?auto_62378 ?auto_62380 ) ) ( not ( = ?auto_62379 ?auto_62380 ) ) ( ON ?auto_62378 ?auto_62379 ) ( CLEAR ?auto_62378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62378 )
      ( MAKE-2PILE ?auto_62378 ?auto_62379 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62383 - BLOCK
      ?auto_62384 - BLOCK
    )
    :vars
    (
      ?auto_62385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62384 ?auto_62385 ) ( not ( = ?auto_62383 ?auto_62384 ) ) ( not ( = ?auto_62383 ?auto_62385 ) ) ( not ( = ?auto_62384 ?auto_62385 ) ) ( ON ?auto_62383 ?auto_62384 ) ( CLEAR ?auto_62383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62383 )
      ( MAKE-2PILE ?auto_62383 ?auto_62384 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62389 - BLOCK
      ?auto_62390 - BLOCK
      ?auto_62391 - BLOCK
    )
    :vars
    (
      ?auto_62392 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62390 ) ( ON ?auto_62391 ?auto_62392 ) ( CLEAR ?auto_62391 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62389 ) ( ON ?auto_62390 ?auto_62389 ) ( not ( = ?auto_62389 ?auto_62390 ) ) ( not ( = ?auto_62389 ?auto_62391 ) ) ( not ( = ?auto_62389 ?auto_62392 ) ) ( not ( = ?auto_62390 ?auto_62391 ) ) ( not ( = ?auto_62390 ?auto_62392 ) ) ( not ( = ?auto_62391 ?auto_62392 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62391 ?auto_62392 )
      ( !STACK ?auto_62391 ?auto_62390 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62396 - BLOCK
      ?auto_62397 - BLOCK
      ?auto_62398 - BLOCK
    )
    :vars
    (
      ?auto_62399 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62397 ) ( ON ?auto_62398 ?auto_62399 ) ( CLEAR ?auto_62398 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62396 ) ( ON ?auto_62397 ?auto_62396 ) ( not ( = ?auto_62396 ?auto_62397 ) ) ( not ( = ?auto_62396 ?auto_62398 ) ) ( not ( = ?auto_62396 ?auto_62399 ) ) ( not ( = ?auto_62397 ?auto_62398 ) ) ( not ( = ?auto_62397 ?auto_62399 ) ) ( not ( = ?auto_62398 ?auto_62399 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62398 ?auto_62399 )
      ( !STACK ?auto_62398 ?auto_62397 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62403 - BLOCK
      ?auto_62404 - BLOCK
      ?auto_62405 - BLOCK
    )
    :vars
    (
      ?auto_62406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62405 ?auto_62406 ) ( ON-TABLE ?auto_62403 ) ( not ( = ?auto_62403 ?auto_62404 ) ) ( not ( = ?auto_62403 ?auto_62405 ) ) ( not ( = ?auto_62403 ?auto_62406 ) ) ( not ( = ?auto_62404 ?auto_62405 ) ) ( not ( = ?auto_62404 ?auto_62406 ) ) ( not ( = ?auto_62405 ?auto_62406 ) ) ( CLEAR ?auto_62403 ) ( ON ?auto_62404 ?auto_62405 ) ( CLEAR ?auto_62404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62403 ?auto_62404 )
      ( MAKE-3PILE ?auto_62403 ?auto_62404 ?auto_62405 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62410 - BLOCK
      ?auto_62411 - BLOCK
      ?auto_62412 - BLOCK
    )
    :vars
    (
      ?auto_62413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62412 ?auto_62413 ) ( ON-TABLE ?auto_62410 ) ( not ( = ?auto_62410 ?auto_62411 ) ) ( not ( = ?auto_62410 ?auto_62412 ) ) ( not ( = ?auto_62410 ?auto_62413 ) ) ( not ( = ?auto_62411 ?auto_62412 ) ) ( not ( = ?auto_62411 ?auto_62413 ) ) ( not ( = ?auto_62412 ?auto_62413 ) ) ( CLEAR ?auto_62410 ) ( ON ?auto_62411 ?auto_62412 ) ( CLEAR ?auto_62411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62410 ?auto_62411 )
      ( MAKE-3PILE ?auto_62410 ?auto_62411 ?auto_62412 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62417 - BLOCK
      ?auto_62418 - BLOCK
      ?auto_62419 - BLOCK
    )
    :vars
    (
      ?auto_62420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62419 ?auto_62420 ) ( not ( = ?auto_62417 ?auto_62418 ) ) ( not ( = ?auto_62417 ?auto_62419 ) ) ( not ( = ?auto_62417 ?auto_62420 ) ) ( not ( = ?auto_62418 ?auto_62419 ) ) ( not ( = ?auto_62418 ?auto_62420 ) ) ( not ( = ?auto_62419 ?auto_62420 ) ) ( ON ?auto_62418 ?auto_62419 ) ( ON ?auto_62417 ?auto_62418 ) ( CLEAR ?auto_62417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62417 )
      ( MAKE-3PILE ?auto_62417 ?auto_62418 ?auto_62419 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62424 - BLOCK
      ?auto_62425 - BLOCK
      ?auto_62426 - BLOCK
    )
    :vars
    (
      ?auto_62427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62426 ?auto_62427 ) ( not ( = ?auto_62424 ?auto_62425 ) ) ( not ( = ?auto_62424 ?auto_62426 ) ) ( not ( = ?auto_62424 ?auto_62427 ) ) ( not ( = ?auto_62425 ?auto_62426 ) ) ( not ( = ?auto_62425 ?auto_62427 ) ) ( not ( = ?auto_62426 ?auto_62427 ) ) ( ON ?auto_62425 ?auto_62426 ) ( ON ?auto_62424 ?auto_62425 ) ( CLEAR ?auto_62424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62424 )
      ( MAKE-3PILE ?auto_62424 ?auto_62425 ?auto_62426 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62432 - BLOCK
      ?auto_62433 - BLOCK
      ?auto_62434 - BLOCK
      ?auto_62435 - BLOCK
    )
    :vars
    (
      ?auto_62436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62434 ) ( ON ?auto_62435 ?auto_62436 ) ( CLEAR ?auto_62435 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62432 ) ( ON ?auto_62433 ?auto_62432 ) ( ON ?auto_62434 ?auto_62433 ) ( not ( = ?auto_62432 ?auto_62433 ) ) ( not ( = ?auto_62432 ?auto_62434 ) ) ( not ( = ?auto_62432 ?auto_62435 ) ) ( not ( = ?auto_62432 ?auto_62436 ) ) ( not ( = ?auto_62433 ?auto_62434 ) ) ( not ( = ?auto_62433 ?auto_62435 ) ) ( not ( = ?auto_62433 ?auto_62436 ) ) ( not ( = ?auto_62434 ?auto_62435 ) ) ( not ( = ?auto_62434 ?auto_62436 ) ) ( not ( = ?auto_62435 ?auto_62436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62435 ?auto_62436 )
      ( !STACK ?auto_62435 ?auto_62434 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62441 - BLOCK
      ?auto_62442 - BLOCK
      ?auto_62443 - BLOCK
      ?auto_62444 - BLOCK
    )
    :vars
    (
      ?auto_62445 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62443 ) ( ON ?auto_62444 ?auto_62445 ) ( CLEAR ?auto_62444 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62441 ) ( ON ?auto_62442 ?auto_62441 ) ( ON ?auto_62443 ?auto_62442 ) ( not ( = ?auto_62441 ?auto_62442 ) ) ( not ( = ?auto_62441 ?auto_62443 ) ) ( not ( = ?auto_62441 ?auto_62444 ) ) ( not ( = ?auto_62441 ?auto_62445 ) ) ( not ( = ?auto_62442 ?auto_62443 ) ) ( not ( = ?auto_62442 ?auto_62444 ) ) ( not ( = ?auto_62442 ?auto_62445 ) ) ( not ( = ?auto_62443 ?auto_62444 ) ) ( not ( = ?auto_62443 ?auto_62445 ) ) ( not ( = ?auto_62444 ?auto_62445 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62444 ?auto_62445 )
      ( !STACK ?auto_62444 ?auto_62443 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62450 - BLOCK
      ?auto_62451 - BLOCK
      ?auto_62452 - BLOCK
      ?auto_62453 - BLOCK
    )
    :vars
    (
      ?auto_62454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62453 ?auto_62454 ) ( ON-TABLE ?auto_62450 ) ( ON ?auto_62451 ?auto_62450 ) ( not ( = ?auto_62450 ?auto_62451 ) ) ( not ( = ?auto_62450 ?auto_62452 ) ) ( not ( = ?auto_62450 ?auto_62453 ) ) ( not ( = ?auto_62450 ?auto_62454 ) ) ( not ( = ?auto_62451 ?auto_62452 ) ) ( not ( = ?auto_62451 ?auto_62453 ) ) ( not ( = ?auto_62451 ?auto_62454 ) ) ( not ( = ?auto_62452 ?auto_62453 ) ) ( not ( = ?auto_62452 ?auto_62454 ) ) ( not ( = ?auto_62453 ?auto_62454 ) ) ( CLEAR ?auto_62451 ) ( ON ?auto_62452 ?auto_62453 ) ( CLEAR ?auto_62452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62450 ?auto_62451 ?auto_62452 )
      ( MAKE-4PILE ?auto_62450 ?auto_62451 ?auto_62452 ?auto_62453 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62459 - BLOCK
      ?auto_62460 - BLOCK
      ?auto_62461 - BLOCK
      ?auto_62462 - BLOCK
    )
    :vars
    (
      ?auto_62463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62462 ?auto_62463 ) ( ON-TABLE ?auto_62459 ) ( ON ?auto_62460 ?auto_62459 ) ( not ( = ?auto_62459 ?auto_62460 ) ) ( not ( = ?auto_62459 ?auto_62461 ) ) ( not ( = ?auto_62459 ?auto_62462 ) ) ( not ( = ?auto_62459 ?auto_62463 ) ) ( not ( = ?auto_62460 ?auto_62461 ) ) ( not ( = ?auto_62460 ?auto_62462 ) ) ( not ( = ?auto_62460 ?auto_62463 ) ) ( not ( = ?auto_62461 ?auto_62462 ) ) ( not ( = ?auto_62461 ?auto_62463 ) ) ( not ( = ?auto_62462 ?auto_62463 ) ) ( CLEAR ?auto_62460 ) ( ON ?auto_62461 ?auto_62462 ) ( CLEAR ?auto_62461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62459 ?auto_62460 ?auto_62461 )
      ( MAKE-4PILE ?auto_62459 ?auto_62460 ?auto_62461 ?auto_62462 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62468 - BLOCK
      ?auto_62469 - BLOCK
      ?auto_62470 - BLOCK
      ?auto_62471 - BLOCK
    )
    :vars
    (
      ?auto_62472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62471 ?auto_62472 ) ( ON-TABLE ?auto_62468 ) ( not ( = ?auto_62468 ?auto_62469 ) ) ( not ( = ?auto_62468 ?auto_62470 ) ) ( not ( = ?auto_62468 ?auto_62471 ) ) ( not ( = ?auto_62468 ?auto_62472 ) ) ( not ( = ?auto_62469 ?auto_62470 ) ) ( not ( = ?auto_62469 ?auto_62471 ) ) ( not ( = ?auto_62469 ?auto_62472 ) ) ( not ( = ?auto_62470 ?auto_62471 ) ) ( not ( = ?auto_62470 ?auto_62472 ) ) ( not ( = ?auto_62471 ?auto_62472 ) ) ( ON ?auto_62470 ?auto_62471 ) ( CLEAR ?auto_62468 ) ( ON ?auto_62469 ?auto_62470 ) ( CLEAR ?auto_62469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62468 ?auto_62469 )
      ( MAKE-4PILE ?auto_62468 ?auto_62469 ?auto_62470 ?auto_62471 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62477 - BLOCK
      ?auto_62478 - BLOCK
      ?auto_62479 - BLOCK
      ?auto_62480 - BLOCK
    )
    :vars
    (
      ?auto_62481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62480 ?auto_62481 ) ( ON-TABLE ?auto_62477 ) ( not ( = ?auto_62477 ?auto_62478 ) ) ( not ( = ?auto_62477 ?auto_62479 ) ) ( not ( = ?auto_62477 ?auto_62480 ) ) ( not ( = ?auto_62477 ?auto_62481 ) ) ( not ( = ?auto_62478 ?auto_62479 ) ) ( not ( = ?auto_62478 ?auto_62480 ) ) ( not ( = ?auto_62478 ?auto_62481 ) ) ( not ( = ?auto_62479 ?auto_62480 ) ) ( not ( = ?auto_62479 ?auto_62481 ) ) ( not ( = ?auto_62480 ?auto_62481 ) ) ( ON ?auto_62479 ?auto_62480 ) ( CLEAR ?auto_62477 ) ( ON ?auto_62478 ?auto_62479 ) ( CLEAR ?auto_62478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62477 ?auto_62478 )
      ( MAKE-4PILE ?auto_62477 ?auto_62478 ?auto_62479 ?auto_62480 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62486 - BLOCK
      ?auto_62487 - BLOCK
      ?auto_62488 - BLOCK
      ?auto_62489 - BLOCK
    )
    :vars
    (
      ?auto_62490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62489 ?auto_62490 ) ( not ( = ?auto_62486 ?auto_62487 ) ) ( not ( = ?auto_62486 ?auto_62488 ) ) ( not ( = ?auto_62486 ?auto_62489 ) ) ( not ( = ?auto_62486 ?auto_62490 ) ) ( not ( = ?auto_62487 ?auto_62488 ) ) ( not ( = ?auto_62487 ?auto_62489 ) ) ( not ( = ?auto_62487 ?auto_62490 ) ) ( not ( = ?auto_62488 ?auto_62489 ) ) ( not ( = ?auto_62488 ?auto_62490 ) ) ( not ( = ?auto_62489 ?auto_62490 ) ) ( ON ?auto_62488 ?auto_62489 ) ( ON ?auto_62487 ?auto_62488 ) ( ON ?auto_62486 ?auto_62487 ) ( CLEAR ?auto_62486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62486 )
      ( MAKE-4PILE ?auto_62486 ?auto_62487 ?auto_62488 ?auto_62489 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62495 - BLOCK
      ?auto_62496 - BLOCK
      ?auto_62497 - BLOCK
      ?auto_62498 - BLOCK
    )
    :vars
    (
      ?auto_62499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62498 ?auto_62499 ) ( not ( = ?auto_62495 ?auto_62496 ) ) ( not ( = ?auto_62495 ?auto_62497 ) ) ( not ( = ?auto_62495 ?auto_62498 ) ) ( not ( = ?auto_62495 ?auto_62499 ) ) ( not ( = ?auto_62496 ?auto_62497 ) ) ( not ( = ?auto_62496 ?auto_62498 ) ) ( not ( = ?auto_62496 ?auto_62499 ) ) ( not ( = ?auto_62497 ?auto_62498 ) ) ( not ( = ?auto_62497 ?auto_62499 ) ) ( not ( = ?auto_62498 ?auto_62499 ) ) ( ON ?auto_62497 ?auto_62498 ) ( ON ?auto_62496 ?auto_62497 ) ( ON ?auto_62495 ?auto_62496 ) ( CLEAR ?auto_62495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62495 )
      ( MAKE-4PILE ?auto_62495 ?auto_62496 ?auto_62497 ?auto_62498 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62505 - BLOCK
      ?auto_62506 - BLOCK
      ?auto_62507 - BLOCK
      ?auto_62508 - BLOCK
      ?auto_62509 - BLOCK
    )
    :vars
    (
      ?auto_62510 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62508 ) ( ON ?auto_62509 ?auto_62510 ) ( CLEAR ?auto_62509 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62505 ) ( ON ?auto_62506 ?auto_62505 ) ( ON ?auto_62507 ?auto_62506 ) ( ON ?auto_62508 ?auto_62507 ) ( not ( = ?auto_62505 ?auto_62506 ) ) ( not ( = ?auto_62505 ?auto_62507 ) ) ( not ( = ?auto_62505 ?auto_62508 ) ) ( not ( = ?auto_62505 ?auto_62509 ) ) ( not ( = ?auto_62505 ?auto_62510 ) ) ( not ( = ?auto_62506 ?auto_62507 ) ) ( not ( = ?auto_62506 ?auto_62508 ) ) ( not ( = ?auto_62506 ?auto_62509 ) ) ( not ( = ?auto_62506 ?auto_62510 ) ) ( not ( = ?auto_62507 ?auto_62508 ) ) ( not ( = ?auto_62507 ?auto_62509 ) ) ( not ( = ?auto_62507 ?auto_62510 ) ) ( not ( = ?auto_62508 ?auto_62509 ) ) ( not ( = ?auto_62508 ?auto_62510 ) ) ( not ( = ?auto_62509 ?auto_62510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62509 ?auto_62510 )
      ( !STACK ?auto_62509 ?auto_62508 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62516 - BLOCK
      ?auto_62517 - BLOCK
      ?auto_62518 - BLOCK
      ?auto_62519 - BLOCK
      ?auto_62520 - BLOCK
    )
    :vars
    (
      ?auto_62521 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62519 ) ( ON ?auto_62520 ?auto_62521 ) ( CLEAR ?auto_62520 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62516 ) ( ON ?auto_62517 ?auto_62516 ) ( ON ?auto_62518 ?auto_62517 ) ( ON ?auto_62519 ?auto_62518 ) ( not ( = ?auto_62516 ?auto_62517 ) ) ( not ( = ?auto_62516 ?auto_62518 ) ) ( not ( = ?auto_62516 ?auto_62519 ) ) ( not ( = ?auto_62516 ?auto_62520 ) ) ( not ( = ?auto_62516 ?auto_62521 ) ) ( not ( = ?auto_62517 ?auto_62518 ) ) ( not ( = ?auto_62517 ?auto_62519 ) ) ( not ( = ?auto_62517 ?auto_62520 ) ) ( not ( = ?auto_62517 ?auto_62521 ) ) ( not ( = ?auto_62518 ?auto_62519 ) ) ( not ( = ?auto_62518 ?auto_62520 ) ) ( not ( = ?auto_62518 ?auto_62521 ) ) ( not ( = ?auto_62519 ?auto_62520 ) ) ( not ( = ?auto_62519 ?auto_62521 ) ) ( not ( = ?auto_62520 ?auto_62521 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62520 ?auto_62521 )
      ( !STACK ?auto_62520 ?auto_62519 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62527 - BLOCK
      ?auto_62528 - BLOCK
      ?auto_62529 - BLOCK
      ?auto_62530 - BLOCK
      ?auto_62531 - BLOCK
    )
    :vars
    (
      ?auto_62532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62531 ?auto_62532 ) ( ON-TABLE ?auto_62527 ) ( ON ?auto_62528 ?auto_62527 ) ( ON ?auto_62529 ?auto_62528 ) ( not ( = ?auto_62527 ?auto_62528 ) ) ( not ( = ?auto_62527 ?auto_62529 ) ) ( not ( = ?auto_62527 ?auto_62530 ) ) ( not ( = ?auto_62527 ?auto_62531 ) ) ( not ( = ?auto_62527 ?auto_62532 ) ) ( not ( = ?auto_62528 ?auto_62529 ) ) ( not ( = ?auto_62528 ?auto_62530 ) ) ( not ( = ?auto_62528 ?auto_62531 ) ) ( not ( = ?auto_62528 ?auto_62532 ) ) ( not ( = ?auto_62529 ?auto_62530 ) ) ( not ( = ?auto_62529 ?auto_62531 ) ) ( not ( = ?auto_62529 ?auto_62532 ) ) ( not ( = ?auto_62530 ?auto_62531 ) ) ( not ( = ?auto_62530 ?auto_62532 ) ) ( not ( = ?auto_62531 ?auto_62532 ) ) ( CLEAR ?auto_62529 ) ( ON ?auto_62530 ?auto_62531 ) ( CLEAR ?auto_62530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62527 ?auto_62528 ?auto_62529 ?auto_62530 )
      ( MAKE-5PILE ?auto_62527 ?auto_62528 ?auto_62529 ?auto_62530 ?auto_62531 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62538 - BLOCK
      ?auto_62539 - BLOCK
      ?auto_62540 - BLOCK
      ?auto_62541 - BLOCK
      ?auto_62542 - BLOCK
    )
    :vars
    (
      ?auto_62543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62542 ?auto_62543 ) ( ON-TABLE ?auto_62538 ) ( ON ?auto_62539 ?auto_62538 ) ( ON ?auto_62540 ?auto_62539 ) ( not ( = ?auto_62538 ?auto_62539 ) ) ( not ( = ?auto_62538 ?auto_62540 ) ) ( not ( = ?auto_62538 ?auto_62541 ) ) ( not ( = ?auto_62538 ?auto_62542 ) ) ( not ( = ?auto_62538 ?auto_62543 ) ) ( not ( = ?auto_62539 ?auto_62540 ) ) ( not ( = ?auto_62539 ?auto_62541 ) ) ( not ( = ?auto_62539 ?auto_62542 ) ) ( not ( = ?auto_62539 ?auto_62543 ) ) ( not ( = ?auto_62540 ?auto_62541 ) ) ( not ( = ?auto_62540 ?auto_62542 ) ) ( not ( = ?auto_62540 ?auto_62543 ) ) ( not ( = ?auto_62541 ?auto_62542 ) ) ( not ( = ?auto_62541 ?auto_62543 ) ) ( not ( = ?auto_62542 ?auto_62543 ) ) ( CLEAR ?auto_62540 ) ( ON ?auto_62541 ?auto_62542 ) ( CLEAR ?auto_62541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62538 ?auto_62539 ?auto_62540 ?auto_62541 )
      ( MAKE-5PILE ?auto_62538 ?auto_62539 ?auto_62540 ?auto_62541 ?auto_62542 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62549 - BLOCK
      ?auto_62550 - BLOCK
      ?auto_62551 - BLOCK
      ?auto_62552 - BLOCK
      ?auto_62553 - BLOCK
    )
    :vars
    (
      ?auto_62554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62553 ?auto_62554 ) ( ON-TABLE ?auto_62549 ) ( ON ?auto_62550 ?auto_62549 ) ( not ( = ?auto_62549 ?auto_62550 ) ) ( not ( = ?auto_62549 ?auto_62551 ) ) ( not ( = ?auto_62549 ?auto_62552 ) ) ( not ( = ?auto_62549 ?auto_62553 ) ) ( not ( = ?auto_62549 ?auto_62554 ) ) ( not ( = ?auto_62550 ?auto_62551 ) ) ( not ( = ?auto_62550 ?auto_62552 ) ) ( not ( = ?auto_62550 ?auto_62553 ) ) ( not ( = ?auto_62550 ?auto_62554 ) ) ( not ( = ?auto_62551 ?auto_62552 ) ) ( not ( = ?auto_62551 ?auto_62553 ) ) ( not ( = ?auto_62551 ?auto_62554 ) ) ( not ( = ?auto_62552 ?auto_62553 ) ) ( not ( = ?auto_62552 ?auto_62554 ) ) ( not ( = ?auto_62553 ?auto_62554 ) ) ( ON ?auto_62552 ?auto_62553 ) ( CLEAR ?auto_62550 ) ( ON ?auto_62551 ?auto_62552 ) ( CLEAR ?auto_62551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62549 ?auto_62550 ?auto_62551 )
      ( MAKE-5PILE ?auto_62549 ?auto_62550 ?auto_62551 ?auto_62552 ?auto_62553 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62560 - BLOCK
      ?auto_62561 - BLOCK
      ?auto_62562 - BLOCK
      ?auto_62563 - BLOCK
      ?auto_62564 - BLOCK
    )
    :vars
    (
      ?auto_62565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62564 ?auto_62565 ) ( ON-TABLE ?auto_62560 ) ( ON ?auto_62561 ?auto_62560 ) ( not ( = ?auto_62560 ?auto_62561 ) ) ( not ( = ?auto_62560 ?auto_62562 ) ) ( not ( = ?auto_62560 ?auto_62563 ) ) ( not ( = ?auto_62560 ?auto_62564 ) ) ( not ( = ?auto_62560 ?auto_62565 ) ) ( not ( = ?auto_62561 ?auto_62562 ) ) ( not ( = ?auto_62561 ?auto_62563 ) ) ( not ( = ?auto_62561 ?auto_62564 ) ) ( not ( = ?auto_62561 ?auto_62565 ) ) ( not ( = ?auto_62562 ?auto_62563 ) ) ( not ( = ?auto_62562 ?auto_62564 ) ) ( not ( = ?auto_62562 ?auto_62565 ) ) ( not ( = ?auto_62563 ?auto_62564 ) ) ( not ( = ?auto_62563 ?auto_62565 ) ) ( not ( = ?auto_62564 ?auto_62565 ) ) ( ON ?auto_62563 ?auto_62564 ) ( CLEAR ?auto_62561 ) ( ON ?auto_62562 ?auto_62563 ) ( CLEAR ?auto_62562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62560 ?auto_62561 ?auto_62562 )
      ( MAKE-5PILE ?auto_62560 ?auto_62561 ?auto_62562 ?auto_62563 ?auto_62564 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62571 - BLOCK
      ?auto_62572 - BLOCK
      ?auto_62573 - BLOCK
      ?auto_62574 - BLOCK
      ?auto_62575 - BLOCK
    )
    :vars
    (
      ?auto_62576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62575 ?auto_62576 ) ( ON-TABLE ?auto_62571 ) ( not ( = ?auto_62571 ?auto_62572 ) ) ( not ( = ?auto_62571 ?auto_62573 ) ) ( not ( = ?auto_62571 ?auto_62574 ) ) ( not ( = ?auto_62571 ?auto_62575 ) ) ( not ( = ?auto_62571 ?auto_62576 ) ) ( not ( = ?auto_62572 ?auto_62573 ) ) ( not ( = ?auto_62572 ?auto_62574 ) ) ( not ( = ?auto_62572 ?auto_62575 ) ) ( not ( = ?auto_62572 ?auto_62576 ) ) ( not ( = ?auto_62573 ?auto_62574 ) ) ( not ( = ?auto_62573 ?auto_62575 ) ) ( not ( = ?auto_62573 ?auto_62576 ) ) ( not ( = ?auto_62574 ?auto_62575 ) ) ( not ( = ?auto_62574 ?auto_62576 ) ) ( not ( = ?auto_62575 ?auto_62576 ) ) ( ON ?auto_62574 ?auto_62575 ) ( ON ?auto_62573 ?auto_62574 ) ( CLEAR ?auto_62571 ) ( ON ?auto_62572 ?auto_62573 ) ( CLEAR ?auto_62572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62571 ?auto_62572 )
      ( MAKE-5PILE ?auto_62571 ?auto_62572 ?auto_62573 ?auto_62574 ?auto_62575 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62582 - BLOCK
      ?auto_62583 - BLOCK
      ?auto_62584 - BLOCK
      ?auto_62585 - BLOCK
      ?auto_62586 - BLOCK
    )
    :vars
    (
      ?auto_62587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62586 ?auto_62587 ) ( ON-TABLE ?auto_62582 ) ( not ( = ?auto_62582 ?auto_62583 ) ) ( not ( = ?auto_62582 ?auto_62584 ) ) ( not ( = ?auto_62582 ?auto_62585 ) ) ( not ( = ?auto_62582 ?auto_62586 ) ) ( not ( = ?auto_62582 ?auto_62587 ) ) ( not ( = ?auto_62583 ?auto_62584 ) ) ( not ( = ?auto_62583 ?auto_62585 ) ) ( not ( = ?auto_62583 ?auto_62586 ) ) ( not ( = ?auto_62583 ?auto_62587 ) ) ( not ( = ?auto_62584 ?auto_62585 ) ) ( not ( = ?auto_62584 ?auto_62586 ) ) ( not ( = ?auto_62584 ?auto_62587 ) ) ( not ( = ?auto_62585 ?auto_62586 ) ) ( not ( = ?auto_62585 ?auto_62587 ) ) ( not ( = ?auto_62586 ?auto_62587 ) ) ( ON ?auto_62585 ?auto_62586 ) ( ON ?auto_62584 ?auto_62585 ) ( CLEAR ?auto_62582 ) ( ON ?auto_62583 ?auto_62584 ) ( CLEAR ?auto_62583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62582 ?auto_62583 )
      ( MAKE-5PILE ?auto_62582 ?auto_62583 ?auto_62584 ?auto_62585 ?auto_62586 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62593 - BLOCK
      ?auto_62594 - BLOCK
      ?auto_62595 - BLOCK
      ?auto_62596 - BLOCK
      ?auto_62597 - BLOCK
    )
    :vars
    (
      ?auto_62598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62597 ?auto_62598 ) ( not ( = ?auto_62593 ?auto_62594 ) ) ( not ( = ?auto_62593 ?auto_62595 ) ) ( not ( = ?auto_62593 ?auto_62596 ) ) ( not ( = ?auto_62593 ?auto_62597 ) ) ( not ( = ?auto_62593 ?auto_62598 ) ) ( not ( = ?auto_62594 ?auto_62595 ) ) ( not ( = ?auto_62594 ?auto_62596 ) ) ( not ( = ?auto_62594 ?auto_62597 ) ) ( not ( = ?auto_62594 ?auto_62598 ) ) ( not ( = ?auto_62595 ?auto_62596 ) ) ( not ( = ?auto_62595 ?auto_62597 ) ) ( not ( = ?auto_62595 ?auto_62598 ) ) ( not ( = ?auto_62596 ?auto_62597 ) ) ( not ( = ?auto_62596 ?auto_62598 ) ) ( not ( = ?auto_62597 ?auto_62598 ) ) ( ON ?auto_62596 ?auto_62597 ) ( ON ?auto_62595 ?auto_62596 ) ( ON ?auto_62594 ?auto_62595 ) ( ON ?auto_62593 ?auto_62594 ) ( CLEAR ?auto_62593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62593 )
      ( MAKE-5PILE ?auto_62593 ?auto_62594 ?auto_62595 ?auto_62596 ?auto_62597 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62604 - BLOCK
      ?auto_62605 - BLOCK
      ?auto_62606 - BLOCK
      ?auto_62607 - BLOCK
      ?auto_62608 - BLOCK
    )
    :vars
    (
      ?auto_62609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62608 ?auto_62609 ) ( not ( = ?auto_62604 ?auto_62605 ) ) ( not ( = ?auto_62604 ?auto_62606 ) ) ( not ( = ?auto_62604 ?auto_62607 ) ) ( not ( = ?auto_62604 ?auto_62608 ) ) ( not ( = ?auto_62604 ?auto_62609 ) ) ( not ( = ?auto_62605 ?auto_62606 ) ) ( not ( = ?auto_62605 ?auto_62607 ) ) ( not ( = ?auto_62605 ?auto_62608 ) ) ( not ( = ?auto_62605 ?auto_62609 ) ) ( not ( = ?auto_62606 ?auto_62607 ) ) ( not ( = ?auto_62606 ?auto_62608 ) ) ( not ( = ?auto_62606 ?auto_62609 ) ) ( not ( = ?auto_62607 ?auto_62608 ) ) ( not ( = ?auto_62607 ?auto_62609 ) ) ( not ( = ?auto_62608 ?auto_62609 ) ) ( ON ?auto_62607 ?auto_62608 ) ( ON ?auto_62606 ?auto_62607 ) ( ON ?auto_62605 ?auto_62606 ) ( ON ?auto_62604 ?auto_62605 ) ( CLEAR ?auto_62604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62604 )
      ( MAKE-5PILE ?auto_62604 ?auto_62605 ?auto_62606 ?auto_62607 ?auto_62608 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62616 - BLOCK
      ?auto_62617 - BLOCK
      ?auto_62618 - BLOCK
      ?auto_62619 - BLOCK
      ?auto_62620 - BLOCK
      ?auto_62621 - BLOCK
    )
    :vars
    (
      ?auto_62622 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62620 ) ( ON ?auto_62621 ?auto_62622 ) ( CLEAR ?auto_62621 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62616 ) ( ON ?auto_62617 ?auto_62616 ) ( ON ?auto_62618 ?auto_62617 ) ( ON ?auto_62619 ?auto_62618 ) ( ON ?auto_62620 ?auto_62619 ) ( not ( = ?auto_62616 ?auto_62617 ) ) ( not ( = ?auto_62616 ?auto_62618 ) ) ( not ( = ?auto_62616 ?auto_62619 ) ) ( not ( = ?auto_62616 ?auto_62620 ) ) ( not ( = ?auto_62616 ?auto_62621 ) ) ( not ( = ?auto_62616 ?auto_62622 ) ) ( not ( = ?auto_62617 ?auto_62618 ) ) ( not ( = ?auto_62617 ?auto_62619 ) ) ( not ( = ?auto_62617 ?auto_62620 ) ) ( not ( = ?auto_62617 ?auto_62621 ) ) ( not ( = ?auto_62617 ?auto_62622 ) ) ( not ( = ?auto_62618 ?auto_62619 ) ) ( not ( = ?auto_62618 ?auto_62620 ) ) ( not ( = ?auto_62618 ?auto_62621 ) ) ( not ( = ?auto_62618 ?auto_62622 ) ) ( not ( = ?auto_62619 ?auto_62620 ) ) ( not ( = ?auto_62619 ?auto_62621 ) ) ( not ( = ?auto_62619 ?auto_62622 ) ) ( not ( = ?auto_62620 ?auto_62621 ) ) ( not ( = ?auto_62620 ?auto_62622 ) ) ( not ( = ?auto_62621 ?auto_62622 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62621 ?auto_62622 )
      ( !STACK ?auto_62621 ?auto_62620 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62629 - BLOCK
      ?auto_62630 - BLOCK
      ?auto_62631 - BLOCK
      ?auto_62632 - BLOCK
      ?auto_62633 - BLOCK
      ?auto_62634 - BLOCK
    )
    :vars
    (
      ?auto_62635 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62633 ) ( ON ?auto_62634 ?auto_62635 ) ( CLEAR ?auto_62634 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62629 ) ( ON ?auto_62630 ?auto_62629 ) ( ON ?auto_62631 ?auto_62630 ) ( ON ?auto_62632 ?auto_62631 ) ( ON ?auto_62633 ?auto_62632 ) ( not ( = ?auto_62629 ?auto_62630 ) ) ( not ( = ?auto_62629 ?auto_62631 ) ) ( not ( = ?auto_62629 ?auto_62632 ) ) ( not ( = ?auto_62629 ?auto_62633 ) ) ( not ( = ?auto_62629 ?auto_62634 ) ) ( not ( = ?auto_62629 ?auto_62635 ) ) ( not ( = ?auto_62630 ?auto_62631 ) ) ( not ( = ?auto_62630 ?auto_62632 ) ) ( not ( = ?auto_62630 ?auto_62633 ) ) ( not ( = ?auto_62630 ?auto_62634 ) ) ( not ( = ?auto_62630 ?auto_62635 ) ) ( not ( = ?auto_62631 ?auto_62632 ) ) ( not ( = ?auto_62631 ?auto_62633 ) ) ( not ( = ?auto_62631 ?auto_62634 ) ) ( not ( = ?auto_62631 ?auto_62635 ) ) ( not ( = ?auto_62632 ?auto_62633 ) ) ( not ( = ?auto_62632 ?auto_62634 ) ) ( not ( = ?auto_62632 ?auto_62635 ) ) ( not ( = ?auto_62633 ?auto_62634 ) ) ( not ( = ?auto_62633 ?auto_62635 ) ) ( not ( = ?auto_62634 ?auto_62635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62634 ?auto_62635 )
      ( !STACK ?auto_62634 ?auto_62633 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62642 - BLOCK
      ?auto_62643 - BLOCK
      ?auto_62644 - BLOCK
      ?auto_62645 - BLOCK
      ?auto_62646 - BLOCK
      ?auto_62647 - BLOCK
    )
    :vars
    (
      ?auto_62648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62647 ?auto_62648 ) ( ON-TABLE ?auto_62642 ) ( ON ?auto_62643 ?auto_62642 ) ( ON ?auto_62644 ?auto_62643 ) ( ON ?auto_62645 ?auto_62644 ) ( not ( = ?auto_62642 ?auto_62643 ) ) ( not ( = ?auto_62642 ?auto_62644 ) ) ( not ( = ?auto_62642 ?auto_62645 ) ) ( not ( = ?auto_62642 ?auto_62646 ) ) ( not ( = ?auto_62642 ?auto_62647 ) ) ( not ( = ?auto_62642 ?auto_62648 ) ) ( not ( = ?auto_62643 ?auto_62644 ) ) ( not ( = ?auto_62643 ?auto_62645 ) ) ( not ( = ?auto_62643 ?auto_62646 ) ) ( not ( = ?auto_62643 ?auto_62647 ) ) ( not ( = ?auto_62643 ?auto_62648 ) ) ( not ( = ?auto_62644 ?auto_62645 ) ) ( not ( = ?auto_62644 ?auto_62646 ) ) ( not ( = ?auto_62644 ?auto_62647 ) ) ( not ( = ?auto_62644 ?auto_62648 ) ) ( not ( = ?auto_62645 ?auto_62646 ) ) ( not ( = ?auto_62645 ?auto_62647 ) ) ( not ( = ?auto_62645 ?auto_62648 ) ) ( not ( = ?auto_62646 ?auto_62647 ) ) ( not ( = ?auto_62646 ?auto_62648 ) ) ( not ( = ?auto_62647 ?auto_62648 ) ) ( CLEAR ?auto_62645 ) ( ON ?auto_62646 ?auto_62647 ) ( CLEAR ?auto_62646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62642 ?auto_62643 ?auto_62644 ?auto_62645 ?auto_62646 )
      ( MAKE-6PILE ?auto_62642 ?auto_62643 ?auto_62644 ?auto_62645 ?auto_62646 ?auto_62647 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62655 - BLOCK
      ?auto_62656 - BLOCK
      ?auto_62657 - BLOCK
      ?auto_62658 - BLOCK
      ?auto_62659 - BLOCK
      ?auto_62660 - BLOCK
    )
    :vars
    (
      ?auto_62661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62660 ?auto_62661 ) ( ON-TABLE ?auto_62655 ) ( ON ?auto_62656 ?auto_62655 ) ( ON ?auto_62657 ?auto_62656 ) ( ON ?auto_62658 ?auto_62657 ) ( not ( = ?auto_62655 ?auto_62656 ) ) ( not ( = ?auto_62655 ?auto_62657 ) ) ( not ( = ?auto_62655 ?auto_62658 ) ) ( not ( = ?auto_62655 ?auto_62659 ) ) ( not ( = ?auto_62655 ?auto_62660 ) ) ( not ( = ?auto_62655 ?auto_62661 ) ) ( not ( = ?auto_62656 ?auto_62657 ) ) ( not ( = ?auto_62656 ?auto_62658 ) ) ( not ( = ?auto_62656 ?auto_62659 ) ) ( not ( = ?auto_62656 ?auto_62660 ) ) ( not ( = ?auto_62656 ?auto_62661 ) ) ( not ( = ?auto_62657 ?auto_62658 ) ) ( not ( = ?auto_62657 ?auto_62659 ) ) ( not ( = ?auto_62657 ?auto_62660 ) ) ( not ( = ?auto_62657 ?auto_62661 ) ) ( not ( = ?auto_62658 ?auto_62659 ) ) ( not ( = ?auto_62658 ?auto_62660 ) ) ( not ( = ?auto_62658 ?auto_62661 ) ) ( not ( = ?auto_62659 ?auto_62660 ) ) ( not ( = ?auto_62659 ?auto_62661 ) ) ( not ( = ?auto_62660 ?auto_62661 ) ) ( CLEAR ?auto_62658 ) ( ON ?auto_62659 ?auto_62660 ) ( CLEAR ?auto_62659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62655 ?auto_62656 ?auto_62657 ?auto_62658 ?auto_62659 )
      ( MAKE-6PILE ?auto_62655 ?auto_62656 ?auto_62657 ?auto_62658 ?auto_62659 ?auto_62660 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62668 - BLOCK
      ?auto_62669 - BLOCK
      ?auto_62670 - BLOCK
      ?auto_62671 - BLOCK
      ?auto_62672 - BLOCK
      ?auto_62673 - BLOCK
    )
    :vars
    (
      ?auto_62674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62673 ?auto_62674 ) ( ON-TABLE ?auto_62668 ) ( ON ?auto_62669 ?auto_62668 ) ( ON ?auto_62670 ?auto_62669 ) ( not ( = ?auto_62668 ?auto_62669 ) ) ( not ( = ?auto_62668 ?auto_62670 ) ) ( not ( = ?auto_62668 ?auto_62671 ) ) ( not ( = ?auto_62668 ?auto_62672 ) ) ( not ( = ?auto_62668 ?auto_62673 ) ) ( not ( = ?auto_62668 ?auto_62674 ) ) ( not ( = ?auto_62669 ?auto_62670 ) ) ( not ( = ?auto_62669 ?auto_62671 ) ) ( not ( = ?auto_62669 ?auto_62672 ) ) ( not ( = ?auto_62669 ?auto_62673 ) ) ( not ( = ?auto_62669 ?auto_62674 ) ) ( not ( = ?auto_62670 ?auto_62671 ) ) ( not ( = ?auto_62670 ?auto_62672 ) ) ( not ( = ?auto_62670 ?auto_62673 ) ) ( not ( = ?auto_62670 ?auto_62674 ) ) ( not ( = ?auto_62671 ?auto_62672 ) ) ( not ( = ?auto_62671 ?auto_62673 ) ) ( not ( = ?auto_62671 ?auto_62674 ) ) ( not ( = ?auto_62672 ?auto_62673 ) ) ( not ( = ?auto_62672 ?auto_62674 ) ) ( not ( = ?auto_62673 ?auto_62674 ) ) ( ON ?auto_62672 ?auto_62673 ) ( CLEAR ?auto_62670 ) ( ON ?auto_62671 ?auto_62672 ) ( CLEAR ?auto_62671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62668 ?auto_62669 ?auto_62670 ?auto_62671 )
      ( MAKE-6PILE ?auto_62668 ?auto_62669 ?auto_62670 ?auto_62671 ?auto_62672 ?auto_62673 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62681 - BLOCK
      ?auto_62682 - BLOCK
      ?auto_62683 - BLOCK
      ?auto_62684 - BLOCK
      ?auto_62685 - BLOCK
      ?auto_62686 - BLOCK
    )
    :vars
    (
      ?auto_62687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62686 ?auto_62687 ) ( ON-TABLE ?auto_62681 ) ( ON ?auto_62682 ?auto_62681 ) ( ON ?auto_62683 ?auto_62682 ) ( not ( = ?auto_62681 ?auto_62682 ) ) ( not ( = ?auto_62681 ?auto_62683 ) ) ( not ( = ?auto_62681 ?auto_62684 ) ) ( not ( = ?auto_62681 ?auto_62685 ) ) ( not ( = ?auto_62681 ?auto_62686 ) ) ( not ( = ?auto_62681 ?auto_62687 ) ) ( not ( = ?auto_62682 ?auto_62683 ) ) ( not ( = ?auto_62682 ?auto_62684 ) ) ( not ( = ?auto_62682 ?auto_62685 ) ) ( not ( = ?auto_62682 ?auto_62686 ) ) ( not ( = ?auto_62682 ?auto_62687 ) ) ( not ( = ?auto_62683 ?auto_62684 ) ) ( not ( = ?auto_62683 ?auto_62685 ) ) ( not ( = ?auto_62683 ?auto_62686 ) ) ( not ( = ?auto_62683 ?auto_62687 ) ) ( not ( = ?auto_62684 ?auto_62685 ) ) ( not ( = ?auto_62684 ?auto_62686 ) ) ( not ( = ?auto_62684 ?auto_62687 ) ) ( not ( = ?auto_62685 ?auto_62686 ) ) ( not ( = ?auto_62685 ?auto_62687 ) ) ( not ( = ?auto_62686 ?auto_62687 ) ) ( ON ?auto_62685 ?auto_62686 ) ( CLEAR ?auto_62683 ) ( ON ?auto_62684 ?auto_62685 ) ( CLEAR ?auto_62684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62681 ?auto_62682 ?auto_62683 ?auto_62684 )
      ( MAKE-6PILE ?auto_62681 ?auto_62682 ?auto_62683 ?auto_62684 ?auto_62685 ?auto_62686 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62694 - BLOCK
      ?auto_62695 - BLOCK
      ?auto_62696 - BLOCK
      ?auto_62697 - BLOCK
      ?auto_62698 - BLOCK
      ?auto_62699 - BLOCK
    )
    :vars
    (
      ?auto_62700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62699 ?auto_62700 ) ( ON-TABLE ?auto_62694 ) ( ON ?auto_62695 ?auto_62694 ) ( not ( = ?auto_62694 ?auto_62695 ) ) ( not ( = ?auto_62694 ?auto_62696 ) ) ( not ( = ?auto_62694 ?auto_62697 ) ) ( not ( = ?auto_62694 ?auto_62698 ) ) ( not ( = ?auto_62694 ?auto_62699 ) ) ( not ( = ?auto_62694 ?auto_62700 ) ) ( not ( = ?auto_62695 ?auto_62696 ) ) ( not ( = ?auto_62695 ?auto_62697 ) ) ( not ( = ?auto_62695 ?auto_62698 ) ) ( not ( = ?auto_62695 ?auto_62699 ) ) ( not ( = ?auto_62695 ?auto_62700 ) ) ( not ( = ?auto_62696 ?auto_62697 ) ) ( not ( = ?auto_62696 ?auto_62698 ) ) ( not ( = ?auto_62696 ?auto_62699 ) ) ( not ( = ?auto_62696 ?auto_62700 ) ) ( not ( = ?auto_62697 ?auto_62698 ) ) ( not ( = ?auto_62697 ?auto_62699 ) ) ( not ( = ?auto_62697 ?auto_62700 ) ) ( not ( = ?auto_62698 ?auto_62699 ) ) ( not ( = ?auto_62698 ?auto_62700 ) ) ( not ( = ?auto_62699 ?auto_62700 ) ) ( ON ?auto_62698 ?auto_62699 ) ( ON ?auto_62697 ?auto_62698 ) ( CLEAR ?auto_62695 ) ( ON ?auto_62696 ?auto_62697 ) ( CLEAR ?auto_62696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62694 ?auto_62695 ?auto_62696 )
      ( MAKE-6PILE ?auto_62694 ?auto_62695 ?auto_62696 ?auto_62697 ?auto_62698 ?auto_62699 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62707 - BLOCK
      ?auto_62708 - BLOCK
      ?auto_62709 - BLOCK
      ?auto_62710 - BLOCK
      ?auto_62711 - BLOCK
      ?auto_62712 - BLOCK
    )
    :vars
    (
      ?auto_62713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62712 ?auto_62713 ) ( ON-TABLE ?auto_62707 ) ( ON ?auto_62708 ?auto_62707 ) ( not ( = ?auto_62707 ?auto_62708 ) ) ( not ( = ?auto_62707 ?auto_62709 ) ) ( not ( = ?auto_62707 ?auto_62710 ) ) ( not ( = ?auto_62707 ?auto_62711 ) ) ( not ( = ?auto_62707 ?auto_62712 ) ) ( not ( = ?auto_62707 ?auto_62713 ) ) ( not ( = ?auto_62708 ?auto_62709 ) ) ( not ( = ?auto_62708 ?auto_62710 ) ) ( not ( = ?auto_62708 ?auto_62711 ) ) ( not ( = ?auto_62708 ?auto_62712 ) ) ( not ( = ?auto_62708 ?auto_62713 ) ) ( not ( = ?auto_62709 ?auto_62710 ) ) ( not ( = ?auto_62709 ?auto_62711 ) ) ( not ( = ?auto_62709 ?auto_62712 ) ) ( not ( = ?auto_62709 ?auto_62713 ) ) ( not ( = ?auto_62710 ?auto_62711 ) ) ( not ( = ?auto_62710 ?auto_62712 ) ) ( not ( = ?auto_62710 ?auto_62713 ) ) ( not ( = ?auto_62711 ?auto_62712 ) ) ( not ( = ?auto_62711 ?auto_62713 ) ) ( not ( = ?auto_62712 ?auto_62713 ) ) ( ON ?auto_62711 ?auto_62712 ) ( ON ?auto_62710 ?auto_62711 ) ( CLEAR ?auto_62708 ) ( ON ?auto_62709 ?auto_62710 ) ( CLEAR ?auto_62709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62707 ?auto_62708 ?auto_62709 )
      ( MAKE-6PILE ?auto_62707 ?auto_62708 ?auto_62709 ?auto_62710 ?auto_62711 ?auto_62712 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62720 - BLOCK
      ?auto_62721 - BLOCK
      ?auto_62722 - BLOCK
      ?auto_62723 - BLOCK
      ?auto_62724 - BLOCK
      ?auto_62725 - BLOCK
    )
    :vars
    (
      ?auto_62726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62725 ?auto_62726 ) ( ON-TABLE ?auto_62720 ) ( not ( = ?auto_62720 ?auto_62721 ) ) ( not ( = ?auto_62720 ?auto_62722 ) ) ( not ( = ?auto_62720 ?auto_62723 ) ) ( not ( = ?auto_62720 ?auto_62724 ) ) ( not ( = ?auto_62720 ?auto_62725 ) ) ( not ( = ?auto_62720 ?auto_62726 ) ) ( not ( = ?auto_62721 ?auto_62722 ) ) ( not ( = ?auto_62721 ?auto_62723 ) ) ( not ( = ?auto_62721 ?auto_62724 ) ) ( not ( = ?auto_62721 ?auto_62725 ) ) ( not ( = ?auto_62721 ?auto_62726 ) ) ( not ( = ?auto_62722 ?auto_62723 ) ) ( not ( = ?auto_62722 ?auto_62724 ) ) ( not ( = ?auto_62722 ?auto_62725 ) ) ( not ( = ?auto_62722 ?auto_62726 ) ) ( not ( = ?auto_62723 ?auto_62724 ) ) ( not ( = ?auto_62723 ?auto_62725 ) ) ( not ( = ?auto_62723 ?auto_62726 ) ) ( not ( = ?auto_62724 ?auto_62725 ) ) ( not ( = ?auto_62724 ?auto_62726 ) ) ( not ( = ?auto_62725 ?auto_62726 ) ) ( ON ?auto_62724 ?auto_62725 ) ( ON ?auto_62723 ?auto_62724 ) ( ON ?auto_62722 ?auto_62723 ) ( CLEAR ?auto_62720 ) ( ON ?auto_62721 ?auto_62722 ) ( CLEAR ?auto_62721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62720 ?auto_62721 )
      ( MAKE-6PILE ?auto_62720 ?auto_62721 ?auto_62722 ?auto_62723 ?auto_62724 ?auto_62725 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62733 - BLOCK
      ?auto_62734 - BLOCK
      ?auto_62735 - BLOCK
      ?auto_62736 - BLOCK
      ?auto_62737 - BLOCK
      ?auto_62738 - BLOCK
    )
    :vars
    (
      ?auto_62739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62738 ?auto_62739 ) ( ON-TABLE ?auto_62733 ) ( not ( = ?auto_62733 ?auto_62734 ) ) ( not ( = ?auto_62733 ?auto_62735 ) ) ( not ( = ?auto_62733 ?auto_62736 ) ) ( not ( = ?auto_62733 ?auto_62737 ) ) ( not ( = ?auto_62733 ?auto_62738 ) ) ( not ( = ?auto_62733 ?auto_62739 ) ) ( not ( = ?auto_62734 ?auto_62735 ) ) ( not ( = ?auto_62734 ?auto_62736 ) ) ( not ( = ?auto_62734 ?auto_62737 ) ) ( not ( = ?auto_62734 ?auto_62738 ) ) ( not ( = ?auto_62734 ?auto_62739 ) ) ( not ( = ?auto_62735 ?auto_62736 ) ) ( not ( = ?auto_62735 ?auto_62737 ) ) ( not ( = ?auto_62735 ?auto_62738 ) ) ( not ( = ?auto_62735 ?auto_62739 ) ) ( not ( = ?auto_62736 ?auto_62737 ) ) ( not ( = ?auto_62736 ?auto_62738 ) ) ( not ( = ?auto_62736 ?auto_62739 ) ) ( not ( = ?auto_62737 ?auto_62738 ) ) ( not ( = ?auto_62737 ?auto_62739 ) ) ( not ( = ?auto_62738 ?auto_62739 ) ) ( ON ?auto_62737 ?auto_62738 ) ( ON ?auto_62736 ?auto_62737 ) ( ON ?auto_62735 ?auto_62736 ) ( CLEAR ?auto_62733 ) ( ON ?auto_62734 ?auto_62735 ) ( CLEAR ?auto_62734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62733 ?auto_62734 )
      ( MAKE-6PILE ?auto_62733 ?auto_62734 ?auto_62735 ?auto_62736 ?auto_62737 ?auto_62738 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62746 - BLOCK
      ?auto_62747 - BLOCK
      ?auto_62748 - BLOCK
      ?auto_62749 - BLOCK
      ?auto_62750 - BLOCK
      ?auto_62751 - BLOCK
    )
    :vars
    (
      ?auto_62752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62751 ?auto_62752 ) ( not ( = ?auto_62746 ?auto_62747 ) ) ( not ( = ?auto_62746 ?auto_62748 ) ) ( not ( = ?auto_62746 ?auto_62749 ) ) ( not ( = ?auto_62746 ?auto_62750 ) ) ( not ( = ?auto_62746 ?auto_62751 ) ) ( not ( = ?auto_62746 ?auto_62752 ) ) ( not ( = ?auto_62747 ?auto_62748 ) ) ( not ( = ?auto_62747 ?auto_62749 ) ) ( not ( = ?auto_62747 ?auto_62750 ) ) ( not ( = ?auto_62747 ?auto_62751 ) ) ( not ( = ?auto_62747 ?auto_62752 ) ) ( not ( = ?auto_62748 ?auto_62749 ) ) ( not ( = ?auto_62748 ?auto_62750 ) ) ( not ( = ?auto_62748 ?auto_62751 ) ) ( not ( = ?auto_62748 ?auto_62752 ) ) ( not ( = ?auto_62749 ?auto_62750 ) ) ( not ( = ?auto_62749 ?auto_62751 ) ) ( not ( = ?auto_62749 ?auto_62752 ) ) ( not ( = ?auto_62750 ?auto_62751 ) ) ( not ( = ?auto_62750 ?auto_62752 ) ) ( not ( = ?auto_62751 ?auto_62752 ) ) ( ON ?auto_62750 ?auto_62751 ) ( ON ?auto_62749 ?auto_62750 ) ( ON ?auto_62748 ?auto_62749 ) ( ON ?auto_62747 ?auto_62748 ) ( ON ?auto_62746 ?auto_62747 ) ( CLEAR ?auto_62746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62746 )
      ( MAKE-6PILE ?auto_62746 ?auto_62747 ?auto_62748 ?auto_62749 ?auto_62750 ?auto_62751 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62759 - BLOCK
      ?auto_62760 - BLOCK
      ?auto_62761 - BLOCK
      ?auto_62762 - BLOCK
      ?auto_62763 - BLOCK
      ?auto_62764 - BLOCK
    )
    :vars
    (
      ?auto_62765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62764 ?auto_62765 ) ( not ( = ?auto_62759 ?auto_62760 ) ) ( not ( = ?auto_62759 ?auto_62761 ) ) ( not ( = ?auto_62759 ?auto_62762 ) ) ( not ( = ?auto_62759 ?auto_62763 ) ) ( not ( = ?auto_62759 ?auto_62764 ) ) ( not ( = ?auto_62759 ?auto_62765 ) ) ( not ( = ?auto_62760 ?auto_62761 ) ) ( not ( = ?auto_62760 ?auto_62762 ) ) ( not ( = ?auto_62760 ?auto_62763 ) ) ( not ( = ?auto_62760 ?auto_62764 ) ) ( not ( = ?auto_62760 ?auto_62765 ) ) ( not ( = ?auto_62761 ?auto_62762 ) ) ( not ( = ?auto_62761 ?auto_62763 ) ) ( not ( = ?auto_62761 ?auto_62764 ) ) ( not ( = ?auto_62761 ?auto_62765 ) ) ( not ( = ?auto_62762 ?auto_62763 ) ) ( not ( = ?auto_62762 ?auto_62764 ) ) ( not ( = ?auto_62762 ?auto_62765 ) ) ( not ( = ?auto_62763 ?auto_62764 ) ) ( not ( = ?auto_62763 ?auto_62765 ) ) ( not ( = ?auto_62764 ?auto_62765 ) ) ( ON ?auto_62763 ?auto_62764 ) ( ON ?auto_62762 ?auto_62763 ) ( ON ?auto_62761 ?auto_62762 ) ( ON ?auto_62760 ?auto_62761 ) ( ON ?auto_62759 ?auto_62760 ) ( CLEAR ?auto_62759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62759 )
      ( MAKE-6PILE ?auto_62759 ?auto_62760 ?auto_62761 ?auto_62762 ?auto_62763 ?auto_62764 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_62773 - BLOCK
      ?auto_62774 - BLOCK
      ?auto_62775 - BLOCK
      ?auto_62776 - BLOCK
      ?auto_62777 - BLOCK
      ?auto_62778 - BLOCK
      ?auto_62779 - BLOCK
    )
    :vars
    (
      ?auto_62780 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62778 ) ( ON ?auto_62779 ?auto_62780 ) ( CLEAR ?auto_62779 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62773 ) ( ON ?auto_62774 ?auto_62773 ) ( ON ?auto_62775 ?auto_62774 ) ( ON ?auto_62776 ?auto_62775 ) ( ON ?auto_62777 ?auto_62776 ) ( ON ?auto_62778 ?auto_62777 ) ( not ( = ?auto_62773 ?auto_62774 ) ) ( not ( = ?auto_62773 ?auto_62775 ) ) ( not ( = ?auto_62773 ?auto_62776 ) ) ( not ( = ?auto_62773 ?auto_62777 ) ) ( not ( = ?auto_62773 ?auto_62778 ) ) ( not ( = ?auto_62773 ?auto_62779 ) ) ( not ( = ?auto_62773 ?auto_62780 ) ) ( not ( = ?auto_62774 ?auto_62775 ) ) ( not ( = ?auto_62774 ?auto_62776 ) ) ( not ( = ?auto_62774 ?auto_62777 ) ) ( not ( = ?auto_62774 ?auto_62778 ) ) ( not ( = ?auto_62774 ?auto_62779 ) ) ( not ( = ?auto_62774 ?auto_62780 ) ) ( not ( = ?auto_62775 ?auto_62776 ) ) ( not ( = ?auto_62775 ?auto_62777 ) ) ( not ( = ?auto_62775 ?auto_62778 ) ) ( not ( = ?auto_62775 ?auto_62779 ) ) ( not ( = ?auto_62775 ?auto_62780 ) ) ( not ( = ?auto_62776 ?auto_62777 ) ) ( not ( = ?auto_62776 ?auto_62778 ) ) ( not ( = ?auto_62776 ?auto_62779 ) ) ( not ( = ?auto_62776 ?auto_62780 ) ) ( not ( = ?auto_62777 ?auto_62778 ) ) ( not ( = ?auto_62777 ?auto_62779 ) ) ( not ( = ?auto_62777 ?auto_62780 ) ) ( not ( = ?auto_62778 ?auto_62779 ) ) ( not ( = ?auto_62778 ?auto_62780 ) ) ( not ( = ?auto_62779 ?auto_62780 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62779 ?auto_62780 )
      ( !STACK ?auto_62779 ?auto_62778 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_62788 - BLOCK
      ?auto_62789 - BLOCK
      ?auto_62790 - BLOCK
      ?auto_62791 - BLOCK
      ?auto_62792 - BLOCK
      ?auto_62793 - BLOCK
      ?auto_62794 - BLOCK
    )
    :vars
    (
      ?auto_62795 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62793 ) ( ON ?auto_62794 ?auto_62795 ) ( CLEAR ?auto_62794 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62788 ) ( ON ?auto_62789 ?auto_62788 ) ( ON ?auto_62790 ?auto_62789 ) ( ON ?auto_62791 ?auto_62790 ) ( ON ?auto_62792 ?auto_62791 ) ( ON ?auto_62793 ?auto_62792 ) ( not ( = ?auto_62788 ?auto_62789 ) ) ( not ( = ?auto_62788 ?auto_62790 ) ) ( not ( = ?auto_62788 ?auto_62791 ) ) ( not ( = ?auto_62788 ?auto_62792 ) ) ( not ( = ?auto_62788 ?auto_62793 ) ) ( not ( = ?auto_62788 ?auto_62794 ) ) ( not ( = ?auto_62788 ?auto_62795 ) ) ( not ( = ?auto_62789 ?auto_62790 ) ) ( not ( = ?auto_62789 ?auto_62791 ) ) ( not ( = ?auto_62789 ?auto_62792 ) ) ( not ( = ?auto_62789 ?auto_62793 ) ) ( not ( = ?auto_62789 ?auto_62794 ) ) ( not ( = ?auto_62789 ?auto_62795 ) ) ( not ( = ?auto_62790 ?auto_62791 ) ) ( not ( = ?auto_62790 ?auto_62792 ) ) ( not ( = ?auto_62790 ?auto_62793 ) ) ( not ( = ?auto_62790 ?auto_62794 ) ) ( not ( = ?auto_62790 ?auto_62795 ) ) ( not ( = ?auto_62791 ?auto_62792 ) ) ( not ( = ?auto_62791 ?auto_62793 ) ) ( not ( = ?auto_62791 ?auto_62794 ) ) ( not ( = ?auto_62791 ?auto_62795 ) ) ( not ( = ?auto_62792 ?auto_62793 ) ) ( not ( = ?auto_62792 ?auto_62794 ) ) ( not ( = ?auto_62792 ?auto_62795 ) ) ( not ( = ?auto_62793 ?auto_62794 ) ) ( not ( = ?auto_62793 ?auto_62795 ) ) ( not ( = ?auto_62794 ?auto_62795 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62794 ?auto_62795 )
      ( !STACK ?auto_62794 ?auto_62793 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_62803 - BLOCK
      ?auto_62804 - BLOCK
      ?auto_62805 - BLOCK
      ?auto_62806 - BLOCK
      ?auto_62807 - BLOCK
      ?auto_62808 - BLOCK
      ?auto_62809 - BLOCK
    )
    :vars
    (
      ?auto_62810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62809 ?auto_62810 ) ( ON-TABLE ?auto_62803 ) ( ON ?auto_62804 ?auto_62803 ) ( ON ?auto_62805 ?auto_62804 ) ( ON ?auto_62806 ?auto_62805 ) ( ON ?auto_62807 ?auto_62806 ) ( not ( = ?auto_62803 ?auto_62804 ) ) ( not ( = ?auto_62803 ?auto_62805 ) ) ( not ( = ?auto_62803 ?auto_62806 ) ) ( not ( = ?auto_62803 ?auto_62807 ) ) ( not ( = ?auto_62803 ?auto_62808 ) ) ( not ( = ?auto_62803 ?auto_62809 ) ) ( not ( = ?auto_62803 ?auto_62810 ) ) ( not ( = ?auto_62804 ?auto_62805 ) ) ( not ( = ?auto_62804 ?auto_62806 ) ) ( not ( = ?auto_62804 ?auto_62807 ) ) ( not ( = ?auto_62804 ?auto_62808 ) ) ( not ( = ?auto_62804 ?auto_62809 ) ) ( not ( = ?auto_62804 ?auto_62810 ) ) ( not ( = ?auto_62805 ?auto_62806 ) ) ( not ( = ?auto_62805 ?auto_62807 ) ) ( not ( = ?auto_62805 ?auto_62808 ) ) ( not ( = ?auto_62805 ?auto_62809 ) ) ( not ( = ?auto_62805 ?auto_62810 ) ) ( not ( = ?auto_62806 ?auto_62807 ) ) ( not ( = ?auto_62806 ?auto_62808 ) ) ( not ( = ?auto_62806 ?auto_62809 ) ) ( not ( = ?auto_62806 ?auto_62810 ) ) ( not ( = ?auto_62807 ?auto_62808 ) ) ( not ( = ?auto_62807 ?auto_62809 ) ) ( not ( = ?auto_62807 ?auto_62810 ) ) ( not ( = ?auto_62808 ?auto_62809 ) ) ( not ( = ?auto_62808 ?auto_62810 ) ) ( not ( = ?auto_62809 ?auto_62810 ) ) ( CLEAR ?auto_62807 ) ( ON ?auto_62808 ?auto_62809 ) ( CLEAR ?auto_62808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62803 ?auto_62804 ?auto_62805 ?auto_62806 ?auto_62807 ?auto_62808 )
      ( MAKE-7PILE ?auto_62803 ?auto_62804 ?auto_62805 ?auto_62806 ?auto_62807 ?auto_62808 ?auto_62809 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_62818 - BLOCK
      ?auto_62819 - BLOCK
      ?auto_62820 - BLOCK
      ?auto_62821 - BLOCK
      ?auto_62822 - BLOCK
      ?auto_62823 - BLOCK
      ?auto_62824 - BLOCK
    )
    :vars
    (
      ?auto_62825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62824 ?auto_62825 ) ( ON-TABLE ?auto_62818 ) ( ON ?auto_62819 ?auto_62818 ) ( ON ?auto_62820 ?auto_62819 ) ( ON ?auto_62821 ?auto_62820 ) ( ON ?auto_62822 ?auto_62821 ) ( not ( = ?auto_62818 ?auto_62819 ) ) ( not ( = ?auto_62818 ?auto_62820 ) ) ( not ( = ?auto_62818 ?auto_62821 ) ) ( not ( = ?auto_62818 ?auto_62822 ) ) ( not ( = ?auto_62818 ?auto_62823 ) ) ( not ( = ?auto_62818 ?auto_62824 ) ) ( not ( = ?auto_62818 ?auto_62825 ) ) ( not ( = ?auto_62819 ?auto_62820 ) ) ( not ( = ?auto_62819 ?auto_62821 ) ) ( not ( = ?auto_62819 ?auto_62822 ) ) ( not ( = ?auto_62819 ?auto_62823 ) ) ( not ( = ?auto_62819 ?auto_62824 ) ) ( not ( = ?auto_62819 ?auto_62825 ) ) ( not ( = ?auto_62820 ?auto_62821 ) ) ( not ( = ?auto_62820 ?auto_62822 ) ) ( not ( = ?auto_62820 ?auto_62823 ) ) ( not ( = ?auto_62820 ?auto_62824 ) ) ( not ( = ?auto_62820 ?auto_62825 ) ) ( not ( = ?auto_62821 ?auto_62822 ) ) ( not ( = ?auto_62821 ?auto_62823 ) ) ( not ( = ?auto_62821 ?auto_62824 ) ) ( not ( = ?auto_62821 ?auto_62825 ) ) ( not ( = ?auto_62822 ?auto_62823 ) ) ( not ( = ?auto_62822 ?auto_62824 ) ) ( not ( = ?auto_62822 ?auto_62825 ) ) ( not ( = ?auto_62823 ?auto_62824 ) ) ( not ( = ?auto_62823 ?auto_62825 ) ) ( not ( = ?auto_62824 ?auto_62825 ) ) ( CLEAR ?auto_62822 ) ( ON ?auto_62823 ?auto_62824 ) ( CLEAR ?auto_62823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62818 ?auto_62819 ?auto_62820 ?auto_62821 ?auto_62822 ?auto_62823 )
      ( MAKE-7PILE ?auto_62818 ?auto_62819 ?auto_62820 ?auto_62821 ?auto_62822 ?auto_62823 ?auto_62824 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_62833 - BLOCK
      ?auto_62834 - BLOCK
      ?auto_62835 - BLOCK
      ?auto_62836 - BLOCK
      ?auto_62837 - BLOCK
      ?auto_62838 - BLOCK
      ?auto_62839 - BLOCK
    )
    :vars
    (
      ?auto_62840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62839 ?auto_62840 ) ( ON-TABLE ?auto_62833 ) ( ON ?auto_62834 ?auto_62833 ) ( ON ?auto_62835 ?auto_62834 ) ( ON ?auto_62836 ?auto_62835 ) ( not ( = ?auto_62833 ?auto_62834 ) ) ( not ( = ?auto_62833 ?auto_62835 ) ) ( not ( = ?auto_62833 ?auto_62836 ) ) ( not ( = ?auto_62833 ?auto_62837 ) ) ( not ( = ?auto_62833 ?auto_62838 ) ) ( not ( = ?auto_62833 ?auto_62839 ) ) ( not ( = ?auto_62833 ?auto_62840 ) ) ( not ( = ?auto_62834 ?auto_62835 ) ) ( not ( = ?auto_62834 ?auto_62836 ) ) ( not ( = ?auto_62834 ?auto_62837 ) ) ( not ( = ?auto_62834 ?auto_62838 ) ) ( not ( = ?auto_62834 ?auto_62839 ) ) ( not ( = ?auto_62834 ?auto_62840 ) ) ( not ( = ?auto_62835 ?auto_62836 ) ) ( not ( = ?auto_62835 ?auto_62837 ) ) ( not ( = ?auto_62835 ?auto_62838 ) ) ( not ( = ?auto_62835 ?auto_62839 ) ) ( not ( = ?auto_62835 ?auto_62840 ) ) ( not ( = ?auto_62836 ?auto_62837 ) ) ( not ( = ?auto_62836 ?auto_62838 ) ) ( not ( = ?auto_62836 ?auto_62839 ) ) ( not ( = ?auto_62836 ?auto_62840 ) ) ( not ( = ?auto_62837 ?auto_62838 ) ) ( not ( = ?auto_62837 ?auto_62839 ) ) ( not ( = ?auto_62837 ?auto_62840 ) ) ( not ( = ?auto_62838 ?auto_62839 ) ) ( not ( = ?auto_62838 ?auto_62840 ) ) ( not ( = ?auto_62839 ?auto_62840 ) ) ( ON ?auto_62838 ?auto_62839 ) ( CLEAR ?auto_62836 ) ( ON ?auto_62837 ?auto_62838 ) ( CLEAR ?auto_62837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62833 ?auto_62834 ?auto_62835 ?auto_62836 ?auto_62837 )
      ( MAKE-7PILE ?auto_62833 ?auto_62834 ?auto_62835 ?auto_62836 ?auto_62837 ?auto_62838 ?auto_62839 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_62848 - BLOCK
      ?auto_62849 - BLOCK
      ?auto_62850 - BLOCK
      ?auto_62851 - BLOCK
      ?auto_62852 - BLOCK
      ?auto_62853 - BLOCK
      ?auto_62854 - BLOCK
    )
    :vars
    (
      ?auto_62855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62854 ?auto_62855 ) ( ON-TABLE ?auto_62848 ) ( ON ?auto_62849 ?auto_62848 ) ( ON ?auto_62850 ?auto_62849 ) ( ON ?auto_62851 ?auto_62850 ) ( not ( = ?auto_62848 ?auto_62849 ) ) ( not ( = ?auto_62848 ?auto_62850 ) ) ( not ( = ?auto_62848 ?auto_62851 ) ) ( not ( = ?auto_62848 ?auto_62852 ) ) ( not ( = ?auto_62848 ?auto_62853 ) ) ( not ( = ?auto_62848 ?auto_62854 ) ) ( not ( = ?auto_62848 ?auto_62855 ) ) ( not ( = ?auto_62849 ?auto_62850 ) ) ( not ( = ?auto_62849 ?auto_62851 ) ) ( not ( = ?auto_62849 ?auto_62852 ) ) ( not ( = ?auto_62849 ?auto_62853 ) ) ( not ( = ?auto_62849 ?auto_62854 ) ) ( not ( = ?auto_62849 ?auto_62855 ) ) ( not ( = ?auto_62850 ?auto_62851 ) ) ( not ( = ?auto_62850 ?auto_62852 ) ) ( not ( = ?auto_62850 ?auto_62853 ) ) ( not ( = ?auto_62850 ?auto_62854 ) ) ( not ( = ?auto_62850 ?auto_62855 ) ) ( not ( = ?auto_62851 ?auto_62852 ) ) ( not ( = ?auto_62851 ?auto_62853 ) ) ( not ( = ?auto_62851 ?auto_62854 ) ) ( not ( = ?auto_62851 ?auto_62855 ) ) ( not ( = ?auto_62852 ?auto_62853 ) ) ( not ( = ?auto_62852 ?auto_62854 ) ) ( not ( = ?auto_62852 ?auto_62855 ) ) ( not ( = ?auto_62853 ?auto_62854 ) ) ( not ( = ?auto_62853 ?auto_62855 ) ) ( not ( = ?auto_62854 ?auto_62855 ) ) ( ON ?auto_62853 ?auto_62854 ) ( CLEAR ?auto_62851 ) ( ON ?auto_62852 ?auto_62853 ) ( CLEAR ?auto_62852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62848 ?auto_62849 ?auto_62850 ?auto_62851 ?auto_62852 )
      ( MAKE-7PILE ?auto_62848 ?auto_62849 ?auto_62850 ?auto_62851 ?auto_62852 ?auto_62853 ?auto_62854 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_62863 - BLOCK
      ?auto_62864 - BLOCK
      ?auto_62865 - BLOCK
      ?auto_62866 - BLOCK
      ?auto_62867 - BLOCK
      ?auto_62868 - BLOCK
      ?auto_62869 - BLOCK
    )
    :vars
    (
      ?auto_62870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62869 ?auto_62870 ) ( ON-TABLE ?auto_62863 ) ( ON ?auto_62864 ?auto_62863 ) ( ON ?auto_62865 ?auto_62864 ) ( not ( = ?auto_62863 ?auto_62864 ) ) ( not ( = ?auto_62863 ?auto_62865 ) ) ( not ( = ?auto_62863 ?auto_62866 ) ) ( not ( = ?auto_62863 ?auto_62867 ) ) ( not ( = ?auto_62863 ?auto_62868 ) ) ( not ( = ?auto_62863 ?auto_62869 ) ) ( not ( = ?auto_62863 ?auto_62870 ) ) ( not ( = ?auto_62864 ?auto_62865 ) ) ( not ( = ?auto_62864 ?auto_62866 ) ) ( not ( = ?auto_62864 ?auto_62867 ) ) ( not ( = ?auto_62864 ?auto_62868 ) ) ( not ( = ?auto_62864 ?auto_62869 ) ) ( not ( = ?auto_62864 ?auto_62870 ) ) ( not ( = ?auto_62865 ?auto_62866 ) ) ( not ( = ?auto_62865 ?auto_62867 ) ) ( not ( = ?auto_62865 ?auto_62868 ) ) ( not ( = ?auto_62865 ?auto_62869 ) ) ( not ( = ?auto_62865 ?auto_62870 ) ) ( not ( = ?auto_62866 ?auto_62867 ) ) ( not ( = ?auto_62866 ?auto_62868 ) ) ( not ( = ?auto_62866 ?auto_62869 ) ) ( not ( = ?auto_62866 ?auto_62870 ) ) ( not ( = ?auto_62867 ?auto_62868 ) ) ( not ( = ?auto_62867 ?auto_62869 ) ) ( not ( = ?auto_62867 ?auto_62870 ) ) ( not ( = ?auto_62868 ?auto_62869 ) ) ( not ( = ?auto_62868 ?auto_62870 ) ) ( not ( = ?auto_62869 ?auto_62870 ) ) ( ON ?auto_62868 ?auto_62869 ) ( ON ?auto_62867 ?auto_62868 ) ( CLEAR ?auto_62865 ) ( ON ?auto_62866 ?auto_62867 ) ( CLEAR ?auto_62866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62863 ?auto_62864 ?auto_62865 ?auto_62866 )
      ( MAKE-7PILE ?auto_62863 ?auto_62864 ?auto_62865 ?auto_62866 ?auto_62867 ?auto_62868 ?auto_62869 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_62878 - BLOCK
      ?auto_62879 - BLOCK
      ?auto_62880 - BLOCK
      ?auto_62881 - BLOCK
      ?auto_62882 - BLOCK
      ?auto_62883 - BLOCK
      ?auto_62884 - BLOCK
    )
    :vars
    (
      ?auto_62885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62884 ?auto_62885 ) ( ON-TABLE ?auto_62878 ) ( ON ?auto_62879 ?auto_62878 ) ( ON ?auto_62880 ?auto_62879 ) ( not ( = ?auto_62878 ?auto_62879 ) ) ( not ( = ?auto_62878 ?auto_62880 ) ) ( not ( = ?auto_62878 ?auto_62881 ) ) ( not ( = ?auto_62878 ?auto_62882 ) ) ( not ( = ?auto_62878 ?auto_62883 ) ) ( not ( = ?auto_62878 ?auto_62884 ) ) ( not ( = ?auto_62878 ?auto_62885 ) ) ( not ( = ?auto_62879 ?auto_62880 ) ) ( not ( = ?auto_62879 ?auto_62881 ) ) ( not ( = ?auto_62879 ?auto_62882 ) ) ( not ( = ?auto_62879 ?auto_62883 ) ) ( not ( = ?auto_62879 ?auto_62884 ) ) ( not ( = ?auto_62879 ?auto_62885 ) ) ( not ( = ?auto_62880 ?auto_62881 ) ) ( not ( = ?auto_62880 ?auto_62882 ) ) ( not ( = ?auto_62880 ?auto_62883 ) ) ( not ( = ?auto_62880 ?auto_62884 ) ) ( not ( = ?auto_62880 ?auto_62885 ) ) ( not ( = ?auto_62881 ?auto_62882 ) ) ( not ( = ?auto_62881 ?auto_62883 ) ) ( not ( = ?auto_62881 ?auto_62884 ) ) ( not ( = ?auto_62881 ?auto_62885 ) ) ( not ( = ?auto_62882 ?auto_62883 ) ) ( not ( = ?auto_62882 ?auto_62884 ) ) ( not ( = ?auto_62882 ?auto_62885 ) ) ( not ( = ?auto_62883 ?auto_62884 ) ) ( not ( = ?auto_62883 ?auto_62885 ) ) ( not ( = ?auto_62884 ?auto_62885 ) ) ( ON ?auto_62883 ?auto_62884 ) ( ON ?auto_62882 ?auto_62883 ) ( CLEAR ?auto_62880 ) ( ON ?auto_62881 ?auto_62882 ) ( CLEAR ?auto_62881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62878 ?auto_62879 ?auto_62880 ?auto_62881 )
      ( MAKE-7PILE ?auto_62878 ?auto_62879 ?auto_62880 ?auto_62881 ?auto_62882 ?auto_62883 ?auto_62884 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_62893 - BLOCK
      ?auto_62894 - BLOCK
      ?auto_62895 - BLOCK
      ?auto_62896 - BLOCK
      ?auto_62897 - BLOCK
      ?auto_62898 - BLOCK
      ?auto_62899 - BLOCK
    )
    :vars
    (
      ?auto_62900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62899 ?auto_62900 ) ( ON-TABLE ?auto_62893 ) ( ON ?auto_62894 ?auto_62893 ) ( not ( = ?auto_62893 ?auto_62894 ) ) ( not ( = ?auto_62893 ?auto_62895 ) ) ( not ( = ?auto_62893 ?auto_62896 ) ) ( not ( = ?auto_62893 ?auto_62897 ) ) ( not ( = ?auto_62893 ?auto_62898 ) ) ( not ( = ?auto_62893 ?auto_62899 ) ) ( not ( = ?auto_62893 ?auto_62900 ) ) ( not ( = ?auto_62894 ?auto_62895 ) ) ( not ( = ?auto_62894 ?auto_62896 ) ) ( not ( = ?auto_62894 ?auto_62897 ) ) ( not ( = ?auto_62894 ?auto_62898 ) ) ( not ( = ?auto_62894 ?auto_62899 ) ) ( not ( = ?auto_62894 ?auto_62900 ) ) ( not ( = ?auto_62895 ?auto_62896 ) ) ( not ( = ?auto_62895 ?auto_62897 ) ) ( not ( = ?auto_62895 ?auto_62898 ) ) ( not ( = ?auto_62895 ?auto_62899 ) ) ( not ( = ?auto_62895 ?auto_62900 ) ) ( not ( = ?auto_62896 ?auto_62897 ) ) ( not ( = ?auto_62896 ?auto_62898 ) ) ( not ( = ?auto_62896 ?auto_62899 ) ) ( not ( = ?auto_62896 ?auto_62900 ) ) ( not ( = ?auto_62897 ?auto_62898 ) ) ( not ( = ?auto_62897 ?auto_62899 ) ) ( not ( = ?auto_62897 ?auto_62900 ) ) ( not ( = ?auto_62898 ?auto_62899 ) ) ( not ( = ?auto_62898 ?auto_62900 ) ) ( not ( = ?auto_62899 ?auto_62900 ) ) ( ON ?auto_62898 ?auto_62899 ) ( ON ?auto_62897 ?auto_62898 ) ( ON ?auto_62896 ?auto_62897 ) ( CLEAR ?auto_62894 ) ( ON ?auto_62895 ?auto_62896 ) ( CLEAR ?auto_62895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62893 ?auto_62894 ?auto_62895 )
      ( MAKE-7PILE ?auto_62893 ?auto_62894 ?auto_62895 ?auto_62896 ?auto_62897 ?auto_62898 ?auto_62899 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_62908 - BLOCK
      ?auto_62909 - BLOCK
      ?auto_62910 - BLOCK
      ?auto_62911 - BLOCK
      ?auto_62912 - BLOCK
      ?auto_62913 - BLOCK
      ?auto_62914 - BLOCK
    )
    :vars
    (
      ?auto_62915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62914 ?auto_62915 ) ( ON-TABLE ?auto_62908 ) ( ON ?auto_62909 ?auto_62908 ) ( not ( = ?auto_62908 ?auto_62909 ) ) ( not ( = ?auto_62908 ?auto_62910 ) ) ( not ( = ?auto_62908 ?auto_62911 ) ) ( not ( = ?auto_62908 ?auto_62912 ) ) ( not ( = ?auto_62908 ?auto_62913 ) ) ( not ( = ?auto_62908 ?auto_62914 ) ) ( not ( = ?auto_62908 ?auto_62915 ) ) ( not ( = ?auto_62909 ?auto_62910 ) ) ( not ( = ?auto_62909 ?auto_62911 ) ) ( not ( = ?auto_62909 ?auto_62912 ) ) ( not ( = ?auto_62909 ?auto_62913 ) ) ( not ( = ?auto_62909 ?auto_62914 ) ) ( not ( = ?auto_62909 ?auto_62915 ) ) ( not ( = ?auto_62910 ?auto_62911 ) ) ( not ( = ?auto_62910 ?auto_62912 ) ) ( not ( = ?auto_62910 ?auto_62913 ) ) ( not ( = ?auto_62910 ?auto_62914 ) ) ( not ( = ?auto_62910 ?auto_62915 ) ) ( not ( = ?auto_62911 ?auto_62912 ) ) ( not ( = ?auto_62911 ?auto_62913 ) ) ( not ( = ?auto_62911 ?auto_62914 ) ) ( not ( = ?auto_62911 ?auto_62915 ) ) ( not ( = ?auto_62912 ?auto_62913 ) ) ( not ( = ?auto_62912 ?auto_62914 ) ) ( not ( = ?auto_62912 ?auto_62915 ) ) ( not ( = ?auto_62913 ?auto_62914 ) ) ( not ( = ?auto_62913 ?auto_62915 ) ) ( not ( = ?auto_62914 ?auto_62915 ) ) ( ON ?auto_62913 ?auto_62914 ) ( ON ?auto_62912 ?auto_62913 ) ( ON ?auto_62911 ?auto_62912 ) ( CLEAR ?auto_62909 ) ( ON ?auto_62910 ?auto_62911 ) ( CLEAR ?auto_62910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62908 ?auto_62909 ?auto_62910 )
      ( MAKE-7PILE ?auto_62908 ?auto_62909 ?auto_62910 ?auto_62911 ?auto_62912 ?auto_62913 ?auto_62914 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_62923 - BLOCK
      ?auto_62924 - BLOCK
      ?auto_62925 - BLOCK
      ?auto_62926 - BLOCK
      ?auto_62927 - BLOCK
      ?auto_62928 - BLOCK
      ?auto_62929 - BLOCK
    )
    :vars
    (
      ?auto_62930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62929 ?auto_62930 ) ( ON-TABLE ?auto_62923 ) ( not ( = ?auto_62923 ?auto_62924 ) ) ( not ( = ?auto_62923 ?auto_62925 ) ) ( not ( = ?auto_62923 ?auto_62926 ) ) ( not ( = ?auto_62923 ?auto_62927 ) ) ( not ( = ?auto_62923 ?auto_62928 ) ) ( not ( = ?auto_62923 ?auto_62929 ) ) ( not ( = ?auto_62923 ?auto_62930 ) ) ( not ( = ?auto_62924 ?auto_62925 ) ) ( not ( = ?auto_62924 ?auto_62926 ) ) ( not ( = ?auto_62924 ?auto_62927 ) ) ( not ( = ?auto_62924 ?auto_62928 ) ) ( not ( = ?auto_62924 ?auto_62929 ) ) ( not ( = ?auto_62924 ?auto_62930 ) ) ( not ( = ?auto_62925 ?auto_62926 ) ) ( not ( = ?auto_62925 ?auto_62927 ) ) ( not ( = ?auto_62925 ?auto_62928 ) ) ( not ( = ?auto_62925 ?auto_62929 ) ) ( not ( = ?auto_62925 ?auto_62930 ) ) ( not ( = ?auto_62926 ?auto_62927 ) ) ( not ( = ?auto_62926 ?auto_62928 ) ) ( not ( = ?auto_62926 ?auto_62929 ) ) ( not ( = ?auto_62926 ?auto_62930 ) ) ( not ( = ?auto_62927 ?auto_62928 ) ) ( not ( = ?auto_62927 ?auto_62929 ) ) ( not ( = ?auto_62927 ?auto_62930 ) ) ( not ( = ?auto_62928 ?auto_62929 ) ) ( not ( = ?auto_62928 ?auto_62930 ) ) ( not ( = ?auto_62929 ?auto_62930 ) ) ( ON ?auto_62928 ?auto_62929 ) ( ON ?auto_62927 ?auto_62928 ) ( ON ?auto_62926 ?auto_62927 ) ( ON ?auto_62925 ?auto_62926 ) ( CLEAR ?auto_62923 ) ( ON ?auto_62924 ?auto_62925 ) ( CLEAR ?auto_62924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62923 ?auto_62924 )
      ( MAKE-7PILE ?auto_62923 ?auto_62924 ?auto_62925 ?auto_62926 ?auto_62927 ?auto_62928 ?auto_62929 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_62938 - BLOCK
      ?auto_62939 - BLOCK
      ?auto_62940 - BLOCK
      ?auto_62941 - BLOCK
      ?auto_62942 - BLOCK
      ?auto_62943 - BLOCK
      ?auto_62944 - BLOCK
    )
    :vars
    (
      ?auto_62945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62944 ?auto_62945 ) ( ON-TABLE ?auto_62938 ) ( not ( = ?auto_62938 ?auto_62939 ) ) ( not ( = ?auto_62938 ?auto_62940 ) ) ( not ( = ?auto_62938 ?auto_62941 ) ) ( not ( = ?auto_62938 ?auto_62942 ) ) ( not ( = ?auto_62938 ?auto_62943 ) ) ( not ( = ?auto_62938 ?auto_62944 ) ) ( not ( = ?auto_62938 ?auto_62945 ) ) ( not ( = ?auto_62939 ?auto_62940 ) ) ( not ( = ?auto_62939 ?auto_62941 ) ) ( not ( = ?auto_62939 ?auto_62942 ) ) ( not ( = ?auto_62939 ?auto_62943 ) ) ( not ( = ?auto_62939 ?auto_62944 ) ) ( not ( = ?auto_62939 ?auto_62945 ) ) ( not ( = ?auto_62940 ?auto_62941 ) ) ( not ( = ?auto_62940 ?auto_62942 ) ) ( not ( = ?auto_62940 ?auto_62943 ) ) ( not ( = ?auto_62940 ?auto_62944 ) ) ( not ( = ?auto_62940 ?auto_62945 ) ) ( not ( = ?auto_62941 ?auto_62942 ) ) ( not ( = ?auto_62941 ?auto_62943 ) ) ( not ( = ?auto_62941 ?auto_62944 ) ) ( not ( = ?auto_62941 ?auto_62945 ) ) ( not ( = ?auto_62942 ?auto_62943 ) ) ( not ( = ?auto_62942 ?auto_62944 ) ) ( not ( = ?auto_62942 ?auto_62945 ) ) ( not ( = ?auto_62943 ?auto_62944 ) ) ( not ( = ?auto_62943 ?auto_62945 ) ) ( not ( = ?auto_62944 ?auto_62945 ) ) ( ON ?auto_62943 ?auto_62944 ) ( ON ?auto_62942 ?auto_62943 ) ( ON ?auto_62941 ?auto_62942 ) ( ON ?auto_62940 ?auto_62941 ) ( CLEAR ?auto_62938 ) ( ON ?auto_62939 ?auto_62940 ) ( CLEAR ?auto_62939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62938 ?auto_62939 )
      ( MAKE-7PILE ?auto_62938 ?auto_62939 ?auto_62940 ?auto_62941 ?auto_62942 ?auto_62943 ?auto_62944 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_62953 - BLOCK
      ?auto_62954 - BLOCK
      ?auto_62955 - BLOCK
      ?auto_62956 - BLOCK
      ?auto_62957 - BLOCK
      ?auto_62958 - BLOCK
      ?auto_62959 - BLOCK
    )
    :vars
    (
      ?auto_62960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62959 ?auto_62960 ) ( not ( = ?auto_62953 ?auto_62954 ) ) ( not ( = ?auto_62953 ?auto_62955 ) ) ( not ( = ?auto_62953 ?auto_62956 ) ) ( not ( = ?auto_62953 ?auto_62957 ) ) ( not ( = ?auto_62953 ?auto_62958 ) ) ( not ( = ?auto_62953 ?auto_62959 ) ) ( not ( = ?auto_62953 ?auto_62960 ) ) ( not ( = ?auto_62954 ?auto_62955 ) ) ( not ( = ?auto_62954 ?auto_62956 ) ) ( not ( = ?auto_62954 ?auto_62957 ) ) ( not ( = ?auto_62954 ?auto_62958 ) ) ( not ( = ?auto_62954 ?auto_62959 ) ) ( not ( = ?auto_62954 ?auto_62960 ) ) ( not ( = ?auto_62955 ?auto_62956 ) ) ( not ( = ?auto_62955 ?auto_62957 ) ) ( not ( = ?auto_62955 ?auto_62958 ) ) ( not ( = ?auto_62955 ?auto_62959 ) ) ( not ( = ?auto_62955 ?auto_62960 ) ) ( not ( = ?auto_62956 ?auto_62957 ) ) ( not ( = ?auto_62956 ?auto_62958 ) ) ( not ( = ?auto_62956 ?auto_62959 ) ) ( not ( = ?auto_62956 ?auto_62960 ) ) ( not ( = ?auto_62957 ?auto_62958 ) ) ( not ( = ?auto_62957 ?auto_62959 ) ) ( not ( = ?auto_62957 ?auto_62960 ) ) ( not ( = ?auto_62958 ?auto_62959 ) ) ( not ( = ?auto_62958 ?auto_62960 ) ) ( not ( = ?auto_62959 ?auto_62960 ) ) ( ON ?auto_62958 ?auto_62959 ) ( ON ?auto_62957 ?auto_62958 ) ( ON ?auto_62956 ?auto_62957 ) ( ON ?auto_62955 ?auto_62956 ) ( ON ?auto_62954 ?auto_62955 ) ( ON ?auto_62953 ?auto_62954 ) ( CLEAR ?auto_62953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62953 )
      ( MAKE-7PILE ?auto_62953 ?auto_62954 ?auto_62955 ?auto_62956 ?auto_62957 ?auto_62958 ?auto_62959 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_62968 - BLOCK
      ?auto_62969 - BLOCK
      ?auto_62970 - BLOCK
      ?auto_62971 - BLOCK
      ?auto_62972 - BLOCK
      ?auto_62973 - BLOCK
      ?auto_62974 - BLOCK
    )
    :vars
    (
      ?auto_62975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62974 ?auto_62975 ) ( not ( = ?auto_62968 ?auto_62969 ) ) ( not ( = ?auto_62968 ?auto_62970 ) ) ( not ( = ?auto_62968 ?auto_62971 ) ) ( not ( = ?auto_62968 ?auto_62972 ) ) ( not ( = ?auto_62968 ?auto_62973 ) ) ( not ( = ?auto_62968 ?auto_62974 ) ) ( not ( = ?auto_62968 ?auto_62975 ) ) ( not ( = ?auto_62969 ?auto_62970 ) ) ( not ( = ?auto_62969 ?auto_62971 ) ) ( not ( = ?auto_62969 ?auto_62972 ) ) ( not ( = ?auto_62969 ?auto_62973 ) ) ( not ( = ?auto_62969 ?auto_62974 ) ) ( not ( = ?auto_62969 ?auto_62975 ) ) ( not ( = ?auto_62970 ?auto_62971 ) ) ( not ( = ?auto_62970 ?auto_62972 ) ) ( not ( = ?auto_62970 ?auto_62973 ) ) ( not ( = ?auto_62970 ?auto_62974 ) ) ( not ( = ?auto_62970 ?auto_62975 ) ) ( not ( = ?auto_62971 ?auto_62972 ) ) ( not ( = ?auto_62971 ?auto_62973 ) ) ( not ( = ?auto_62971 ?auto_62974 ) ) ( not ( = ?auto_62971 ?auto_62975 ) ) ( not ( = ?auto_62972 ?auto_62973 ) ) ( not ( = ?auto_62972 ?auto_62974 ) ) ( not ( = ?auto_62972 ?auto_62975 ) ) ( not ( = ?auto_62973 ?auto_62974 ) ) ( not ( = ?auto_62973 ?auto_62975 ) ) ( not ( = ?auto_62974 ?auto_62975 ) ) ( ON ?auto_62973 ?auto_62974 ) ( ON ?auto_62972 ?auto_62973 ) ( ON ?auto_62971 ?auto_62972 ) ( ON ?auto_62970 ?auto_62971 ) ( ON ?auto_62969 ?auto_62970 ) ( ON ?auto_62968 ?auto_62969 ) ( CLEAR ?auto_62968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62968 )
      ( MAKE-7PILE ?auto_62968 ?auto_62969 ?auto_62970 ?auto_62971 ?auto_62972 ?auto_62973 ?auto_62974 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_62984 - BLOCK
      ?auto_62985 - BLOCK
      ?auto_62986 - BLOCK
      ?auto_62987 - BLOCK
      ?auto_62988 - BLOCK
      ?auto_62989 - BLOCK
      ?auto_62990 - BLOCK
      ?auto_62991 - BLOCK
    )
    :vars
    (
      ?auto_62992 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62990 ) ( ON ?auto_62991 ?auto_62992 ) ( CLEAR ?auto_62991 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62984 ) ( ON ?auto_62985 ?auto_62984 ) ( ON ?auto_62986 ?auto_62985 ) ( ON ?auto_62987 ?auto_62986 ) ( ON ?auto_62988 ?auto_62987 ) ( ON ?auto_62989 ?auto_62988 ) ( ON ?auto_62990 ?auto_62989 ) ( not ( = ?auto_62984 ?auto_62985 ) ) ( not ( = ?auto_62984 ?auto_62986 ) ) ( not ( = ?auto_62984 ?auto_62987 ) ) ( not ( = ?auto_62984 ?auto_62988 ) ) ( not ( = ?auto_62984 ?auto_62989 ) ) ( not ( = ?auto_62984 ?auto_62990 ) ) ( not ( = ?auto_62984 ?auto_62991 ) ) ( not ( = ?auto_62984 ?auto_62992 ) ) ( not ( = ?auto_62985 ?auto_62986 ) ) ( not ( = ?auto_62985 ?auto_62987 ) ) ( not ( = ?auto_62985 ?auto_62988 ) ) ( not ( = ?auto_62985 ?auto_62989 ) ) ( not ( = ?auto_62985 ?auto_62990 ) ) ( not ( = ?auto_62985 ?auto_62991 ) ) ( not ( = ?auto_62985 ?auto_62992 ) ) ( not ( = ?auto_62986 ?auto_62987 ) ) ( not ( = ?auto_62986 ?auto_62988 ) ) ( not ( = ?auto_62986 ?auto_62989 ) ) ( not ( = ?auto_62986 ?auto_62990 ) ) ( not ( = ?auto_62986 ?auto_62991 ) ) ( not ( = ?auto_62986 ?auto_62992 ) ) ( not ( = ?auto_62987 ?auto_62988 ) ) ( not ( = ?auto_62987 ?auto_62989 ) ) ( not ( = ?auto_62987 ?auto_62990 ) ) ( not ( = ?auto_62987 ?auto_62991 ) ) ( not ( = ?auto_62987 ?auto_62992 ) ) ( not ( = ?auto_62988 ?auto_62989 ) ) ( not ( = ?auto_62988 ?auto_62990 ) ) ( not ( = ?auto_62988 ?auto_62991 ) ) ( not ( = ?auto_62988 ?auto_62992 ) ) ( not ( = ?auto_62989 ?auto_62990 ) ) ( not ( = ?auto_62989 ?auto_62991 ) ) ( not ( = ?auto_62989 ?auto_62992 ) ) ( not ( = ?auto_62990 ?auto_62991 ) ) ( not ( = ?auto_62990 ?auto_62992 ) ) ( not ( = ?auto_62991 ?auto_62992 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62991 ?auto_62992 )
      ( !STACK ?auto_62991 ?auto_62990 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_63001 - BLOCK
      ?auto_63002 - BLOCK
      ?auto_63003 - BLOCK
      ?auto_63004 - BLOCK
      ?auto_63005 - BLOCK
      ?auto_63006 - BLOCK
      ?auto_63007 - BLOCK
      ?auto_63008 - BLOCK
    )
    :vars
    (
      ?auto_63009 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63007 ) ( ON ?auto_63008 ?auto_63009 ) ( CLEAR ?auto_63008 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63001 ) ( ON ?auto_63002 ?auto_63001 ) ( ON ?auto_63003 ?auto_63002 ) ( ON ?auto_63004 ?auto_63003 ) ( ON ?auto_63005 ?auto_63004 ) ( ON ?auto_63006 ?auto_63005 ) ( ON ?auto_63007 ?auto_63006 ) ( not ( = ?auto_63001 ?auto_63002 ) ) ( not ( = ?auto_63001 ?auto_63003 ) ) ( not ( = ?auto_63001 ?auto_63004 ) ) ( not ( = ?auto_63001 ?auto_63005 ) ) ( not ( = ?auto_63001 ?auto_63006 ) ) ( not ( = ?auto_63001 ?auto_63007 ) ) ( not ( = ?auto_63001 ?auto_63008 ) ) ( not ( = ?auto_63001 ?auto_63009 ) ) ( not ( = ?auto_63002 ?auto_63003 ) ) ( not ( = ?auto_63002 ?auto_63004 ) ) ( not ( = ?auto_63002 ?auto_63005 ) ) ( not ( = ?auto_63002 ?auto_63006 ) ) ( not ( = ?auto_63002 ?auto_63007 ) ) ( not ( = ?auto_63002 ?auto_63008 ) ) ( not ( = ?auto_63002 ?auto_63009 ) ) ( not ( = ?auto_63003 ?auto_63004 ) ) ( not ( = ?auto_63003 ?auto_63005 ) ) ( not ( = ?auto_63003 ?auto_63006 ) ) ( not ( = ?auto_63003 ?auto_63007 ) ) ( not ( = ?auto_63003 ?auto_63008 ) ) ( not ( = ?auto_63003 ?auto_63009 ) ) ( not ( = ?auto_63004 ?auto_63005 ) ) ( not ( = ?auto_63004 ?auto_63006 ) ) ( not ( = ?auto_63004 ?auto_63007 ) ) ( not ( = ?auto_63004 ?auto_63008 ) ) ( not ( = ?auto_63004 ?auto_63009 ) ) ( not ( = ?auto_63005 ?auto_63006 ) ) ( not ( = ?auto_63005 ?auto_63007 ) ) ( not ( = ?auto_63005 ?auto_63008 ) ) ( not ( = ?auto_63005 ?auto_63009 ) ) ( not ( = ?auto_63006 ?auto_63007 ) ) ( not ( = ?auto_63006 ?auto_63008 ) ) ( not ( = ?auto_63006 ?auto_63009 ) ) ( not ( = ?auto_63007 ?auto_63008 ) ) ( not ( = ?auto_63007 ?auto_63009 ) ) ( not ( = ?auto_63008 ?auto_63009 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63008 ?auto_63009 )
      ( !STACK ?auto_63008 ?auto_63007 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_63018 - BLOCK
      ?auto_63019 - BLOCK
      ?auto_63020 - BLOCK
      ?auto_63021 - BLOCK
      ?auto_63022 - BLOCK
      ?auto_63023 - BLOCK
      ?auto_63024 - BLOCK
      ?auto_63025 - BLOCK
    )
    :vars
    (
      ?auto_63026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63025 ?auto_63026 ) ( ON-TABLE ?auto_63018 ) ( ON ?auto_63019 ?auto_63018 ) ( ON ?auto_63020 ?auto_63019 ) ( ON ?auto_63021 ?auto_63020 ) ( ON ?auto_63022 ?auto_63021 ) ( ON ?auto_63023 ?auto_63022 ) ( not ( = ?auto_63018 ?auto_63019 ) ) ( not ( = ?auto_63018 ?auto_63020 ) ) ( not ( = ?auto_63018 ?auto_63021 ) ) ( not ( = ?auto_63018 ?auto_63022 ) ) ( not ( = ?auto_63018 ?auto_63023 ) ) ( not ( = ?auto_63018 ?auto_63024 ) ) ( not ( = ?auto_63018 ?auto_63025 ) ) ( not ( = ?auto_63018 ?auto_63026 ) ) ( not ( = ?auto_63019 ?auto_63020 ) ) ( not ( = ?auto_63019 ?auto_63021 ) ) ( not ( = ?auto_63019 ?auto_63022 ) ) ( not ( = ?auto_63019 ?auto_63023 ) ) ( not ( = ?auto_63019 ?auto_63024 ) ) ( not ( = ?auto_63019 ?auto_63025 ) ) ( not ( = ?auto_63019 ?auto_63026 ) ) ( not ( = ?auto_63020 ?auto_63021 ) ) ( not ( = ?auto_63020 ?auto_63022 ) ) ( not ( = ?auto_63020 ?auto_63023 ) ) ( not ( = ?auto_63020 ?auto_63024 ) ) ( not ( = ?auto_63020 ?auto_63025 ) ) ( not ( = ?auto_63020 ?auto_63026 ) ) ( not ( = ?auto_63021 ?auto_63022 ) ) ( not ( = ?auto_63021 ?auto_63023 ) ) ( not ( = ?auto_63021 ?auto_63024 ) ) ( not ( = ?auto_63021 ?auto_63025 ) ) ( not ( = ?auto_63021 ?auto_63026 ) ) ( not ( = ?auto_63022 ?auto_63023 ) ) ( not ( = ?auto_63022 ?auto_63024 ) ) ( not ( = ?auto_63022 ?auto_63025 ) ) ( not ( = ?auto_63022 ?auto_63026 ) ) ( not ( = ?auto_63023 ?auto_63024 ) ) ( not ( = ?auto_63023 ?auto_63025 ) ) ( not ( = ?auto_63023 ?auto_63026 ) ) ( not ( = ?auto_63024 ?auto_63025 ) ) ( not ( = ?auto_63024 ?auto_63026 ) ) ( not ( = ?auto_63025 ?auto_63026 ) ) ( CLEAR ?auto_63023 ) ( ON ?auto_63024 ?auto_63025 ) ( CLEAR ?auto_63024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_63018 ?auto_63019 ?auto_63020 ?auto_63021 ?auto_63022 ?auto_63023 ?auto_63024 )
      ( MAKE-8PILE ?auto_63018 ?auto_63019 ?auto_63020 ?auto_63021 ?auto_63022 ?auto_63023 ?auto_63024 ?auto_63025 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_63035 - BLOCK
      ?auto_63036 - BLOCK
      ?auto_63037 - BLOCK
      ?auto_63038 - BLOCK
      ?auto_63039 - BLOCK
      ?auto_63040 - BLOCK
      ?auto_63041 - BLOCK
      ?auto_63042 - BLOCK
    )
    :vars
    (
      ?auto_63043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63042 ?auto_63043 ) ( ON-TABLE ?auto_63035 ) ( ON ?auto_63036 ?auto_63035 ) ( ON ?auto_63037 ?auto_63036 ) ( ON ?auto_63038 ?auto_63037 ) ( ON ?auto_63039 ?auto_63038 ) ( ON ?auto_63040 ?auto_63039 ) ( not ( = ?auto_63035 ?auto_63036 ) ) ( not ( = ?auto_63035 ?auto_63037 ) ) ( not ( = ?auto_63035 ?auto_63038 ) ) ( not ( = ?auto_63035 ?auto_63039 ) ) ( not ( = ?auto_63035 ?auto_63040 ) ) ( not ( = ?auto_63035 ?auto_63041 ) ) ( not ( = ?auto_63035 ?auto_63042 ) ) ( not ( = ?auto_63035 ?auto_63043 ) ) ( not ( = ?auto_63036 ?auto_63037 ) ) ( not ( = ?auto_63036 ?auto_63038 ) ) ( not ( = ?auto_63036 ?auto_63039 ) ) ( not ( = ?auto_63036 ?auto_63040 ) ) ( not ( = ?auto_63036 ?auto_63041 ) ) ( not ( = ?auto_63036 ?auto_63042 ) ) ( not ( = ?auto_63036 ?auto_63043 ) ) ( not ( = ?auto_63037 ?auto_63038 ) ) ( not ( = ?auto_63037 ?auto_63039 ) ) ( not ( = ?auto_63037 ?auto_63040 ) ) ( not ( = ?auto_63037 ?auto_63041 ) ) ( not ( = ?auto_63037 ?auto_63042 ) ) ( not ( = ?auto_63037 ?auto_63043 ) ) ( not ( = ?auto_63038 ?auto_63039 ) ) ( not ( = ?auto_63038 ?auto_63040 ) ) ( not ( = ?auto_63038 ?auto_63041 ) ) ( not ( = ?auto_63038 ?auto_63042 ) ) ( not ( = ?auto_63038 ?auto_63043 ) ) ( not ( = ?auto_63039 ?auto_63040 ) ) ( not ( = ?auto_63039 ?auto_63041 ) ) ( not ( = ?auto_63039 ?auto_63042 ) ) ( not ( = ?auto_63039 ?auto_63043 ) ) ( not ( = ?auto_63040 ?auto_63041 ) ) ( not ( = ?auto_63040 ?auto_63042 ) ) ( not ( = ?auto_63040 ?auto_63043 ) ) ( not ( = ?auto_63041 ?auto_63042 ) ) ( not ( = ?auto_63041 ?auto_63043 ) ) ( not ( = ?auto_63042 ?auto_63043 ) ) ( CLEAR ?auto_63040 ) ( ON ?auto_63041 ?auto_63042 ) ( CLEAR ?auto_63041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_63035 ?auto_63036 ?auto_63037 ?auto_63038 ?auto_63039 ?auto_63040 ?auto_63041 )
      ( MAKE-8PILE ?auto_63035 ?auto_63036 ?auto_63037 ?auto_63038 ?auto_63039 ?auto_63040 ?auto_63041 ?auto_63042 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_63052 - BLOCK
      ?auto_63053 - BLOCK
      ?auto_63054 - BLOCK
      ?auto_63055 - BLOCK
      ?auto_63056 - BLOCK
      ?auto_63057 - BLOCK
      ?auto_63058 - BLOCK
      ?auto_63059 - BLOCK
    )
    :vars
    (
      ?auto_63060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63059 ?auto_63060 ) ( ON-TABLE ?auto_63052 ) ( ON ?auto_63053 ?auto_63052 ) ( ON ?auto_63054 ?auto_63053 ) ( ON ?auto_63055 ?auto_63054 ) ( ON ?auto_63056 ?auto_63055 ) ( not ( = ?auto_63052 ?auto_63053 ) ) ( not ( = ?auto_63052 ?auto_63054 ) ) ( not ( = ?auto_63052 ?auto_63055 ) ) ( not ( = ?auto_63052 ?auto_63056 ) ) ( not ( = ?auto_63052 ?auto_63057 ) ) ( not ( = ?auto_63052 ?auto_63058 ) ) ( not ( = ?auto_63052 ?auto_63059 ) ) ( not ( = ?auto_63052 ?auto_63060 ) ) ( not ( = ?auto_63053 ?auto_63054 ) ) ( not ( = ?auto_63053 ?auto_63055 ) ) ( not ( = ?auto_63053 ?auto_63056 ) ) ( not ( = ?auto_63053 ?auto_63057 ) ) ( not ( = ?auto_63053 ?auto_63058 ) ) ( not ( = ?auto_63053 ?auto_63059 ) ) ( not ( = ?auto_63053 ?auto_63060 ) ) ( not ( = ?auto_63054 ?auto_63055 ) ) ( not ( = ?auto_63054 ?auto_63056 ) ) ( not ( = ?auto_63054 ?auto_63057 ) ) ( not ( = ?auto_63054 ?auto_63058 ) ) ( not ( = ?auto_63054 ?auto_63059 ) ) ( not ( = ?auto_63054 ?auto_63060 ) ) ( not ( = ?auto_63055 ?auto_63056 ) ) ( not ( = ?auto_63055 ?auto_63057 ) ) ( not ( = ?auto_63055 ?auto_63058 ) ) ( not ( = ?auto_63055 ?auto_63059 ) ) ( not ( = ?auto_63055 ?auto_63060 ) ) ( not ( = ?auto_63056 ?auto_63057 ) ) ( not ( = ?auto_63056 ?auto_63058 ) ) ( not ( = ?auto_63056 ?auto_63059 ) ) ( not ( = ?auto_63056 ?auto_63060 ) ) ( not ( = ?auto_63057 ?auto_63058 ) ) ( not ( = ?auto_63057 ?auto_63059 ) ) ( not ( = ?auto_63057 ?auto_63060 ) ) ( not ( = ?auto_63058 ?auto_63059 ) ) ( not ( = ?auto_63058 ?auto_63060 ) ) ( not ( = ?auto_63059 ?auto_63060 ) ) ( ON ?auto_63058 ?auto_63059 ) ( CLEAR ?auto_63056 ) ( ON ?auto_63057 ?auto_63058 ) ( CLEAR ?auto_63057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63052 ?auto_63053 ?auto_63054 ?auto_63055 ?auto_63056 ?auto_63057 )
      ( MAKE-8PILE ?auto_63052 ?auto_63053 ?auto_63054 ?auto_63055 ?auto_63056 ?auto_63057 ?auto_63058 ?auto_63059 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_63069 - BLOCK
      ?auto_63070 - BLOCK
      ?auto_63071 - BLOCK
      ?auto_63072 - BLOCK
      ?auto_63073 - BLOCK
      ?auto_63074 - BLOCK
      ?auto_63075 - BLOCK
      ?auto_63076 - BLOCK
    )
    :vars
    (
      ?auto_63077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63076 ?auto_63077 ) ( ON-TABLE ?auto_63069 ) ( ON ?auto_63070 ?auto_63069 ) ( ON ?auto_63071 ?auto_63070 ) ( ON ?auto_63072 ?auto_63071 ) ( ON ?auto_63073 ?auto_63072 ) ( not ( = ?auto_63069 ?auto_63070 ) ) ( not ( = ?auto_63069 ?auto_63071 ) ) ( not ( = ?auto_63069 ?auto_63072 ) ) ( not ( = ?auto_63069 ?auto_63073 ) ) ( not ( = ?auto_63069 ?auto_63074 ) ) ( not ( = ?auto_63069 ?auto_63075 ) ) ( not ( = ?auto_63069 ?auto_63076 ) ) ( not ( = ?auto_63069 ?auto_63077 ) ) ( not ( = ?auto_63070 ?auto_63071 ) ) ( not ( = ?auto_63070 ?auto_63072 ) ) ( not ( = ?auto_63070 ?auto_63073 ) ) ( not ( = ?auto_63070 ?auto_63074 ) ) ( not ( = ?auto_63070 ?auto_63075 ) ) ( not ( = ?auto_63070 ?auto_63076 ) ) ( not ( = ?auto_63070 ?auto_63077 ) ) ( not ( = ?auto_63071 ?auto_63072 ) ) ( not ( = ?auto_63071 ?auto_63073 ) ) ( not ( = ?auto_63071 ?auto_63074 ) ) ( not ( = ?auto_63071 ?auto_63075 ) ) ( not ( = ?auto_63071 ?auto_63076 ) ) ( not ( = ?auto_63071 ?auto_63077 ) ) ( not ( = ?auto_63072 ?auto_63073 ) ) ( not ( = ?auto_63072 ?auto_63074 ) ) ( not ( = ?auto_63072 ?auto_63075 ) ) ( not ( = ?auto_63072 ?auto_63076 ) ) ( not ( = ?auto_63072 ?auto_63077 ) ) ( not ( = ?auto_63073 ?auto_63074 ) ) ( not ( = ?auto_63073 ?auto_63075 ) ) ( not ( = ?auto_63073 ?auto_63076 ) ) ( not ( = ?auto_63073 ?auto_63077 ) ) ( not ( = ?auto_63074 ?auto_63075 ) ) ( not ( = ?auto_63074 ?auto_63076 ) ) ( not ( = ?auto_63074 ?auto_63077 ) ) ( not ( = ?auto_63075 ?auto_63076 ) ) ( not ( = ?auto_63075 ?auto_63077 ) ) ( not ( = ?auto_63076 ?auto_63077 ) ) ( ON ?auto_63075 ?auto_63076 ) ( CLEAR ?auto_63073 ) ( ON ?auto_63074 ?auto_63075 ) ( CLEAR ?auto_63074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63069 ?auto_63070 ?auto_63071 ?auto_63072 ?auto_63073 ?auto_63074 )
      ( MAKE-8PILE ?auto_63069 ?auto_63070 ?auto_63071 ?auto_63072 ?auto_63073 ?auto_63074 ?auto_63075 ?auto_63076 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_63086 - BLOCK
      ?auto_63087 - BLOCK
      ?auto_63088 - BLOCK
      ?auto_63089 - BLOCK
      ?auto_63090 - BLOCK
      ?auto_63091 - BLOCK
      ?auto_63092 - BLOCK
      ?auto_63093 - BLOCK
    )
    :vars
    (
      ?auto_63094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63093 ?auto_63094 ) ( ON-TABLE ?auto_63086 ) ( ON ?auto_63087 ?auto_63086 ) ( ON ?auto_63088 ?auto_63087 ) ( ON ?auto_63089 ?auto_63088 ) ( not ( = ?auto_63086 ?auto_63087 ) ) ( not ( = ?auto_63086 ?auto_63088 ) ) ( not ( = ?auto_63086 ?auto_63089 ) ) ( not ( = ?auto_63086 ?auto_63090 ) ) ( not ( = ?auto_63086 ?auto_63091 ) ) ( not ( = ?auto_63086 ?auto_63092 ) ) ( not ( = ?auto_63086 ?auto_63093 ) ) ( not ( = ?auto_63086 ?auto_63094 ) ) ( not ( = ?auto_63087 ?auto_63088 ) ) ( not ( = ?auto_63087 ?auto_63089 ) ) ( not ( = ?auto_63087 ?auto_63090 ) ) ( not ( = ?auto_63087 ?auto_63091 ) ) ( not ( = ?auto_63087 ?auto_63092 ) ) ( not ( = ?auto_63087 ?auto_63093 ) ) ( not ( = ?auto_63087 ?auto_63094 ) ) ( not ( = ?auto_63088 ?auto_63089 ) ) ( not ( = ?auto_63088 ?auto_63090 ) ) ( not ( = ?auto_63088 ?auto_63091 ) ) ( not ( = ?auto_63088 ?auto_63092 ) ) ( not ( = ?auto_63088 ?auto_63093 ) ) ( not ( = ?auto_63088 ?auto_63094 ) ) ( not ( = ?auto_63089 ?auto_63090 ) ) ( not ( = ?auto_63089 ?auto_63091 ) ) ( not ( = ?auto_63089 ?auto_63092 ) ) ( not ( = ?auto_63089 ?auto_63093 ) ) ( not ( = ?auto_63089 ?auto_63094 ) ) ( not ( = ?auto_63090 ?auto_63091 ) ) ( not ( = ?auto_63090 ?auto_63092 ) ) ( not ( = ?auto_63090 ?auto_63093 ) ) ( not ( = ?auto_63090 ?auto_63094 ) ) ( not ( = ?auto_63091 ?auto_63092 ) ) ( not ( = ?auto_63091 ?auto_63093 ) ) ( not ( = ?auto_63091 ?auto_63094 ) ) ( not ( = ?auto_63092 ?auto_63093 ) ) ( not ( = ?auto_63092 ?auto_63094 ) ) ( not ( = ?auto_63093 ?auto_63094 ) ) ( ON ?auto_63092 ?auto_63093 ) ( ON ?auto_63091 ?auto_63092 ) ( CLEAR ?auto_63089 ) ( ON ?auto_63090 ?auto_63091 ) ( CLEAR ?auto_63090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63086 ?auto_63087 ?auto_63088 ?auto_63089 ?auto_63090 )
      ( MAKE-8PILE ?auto_63086 ?auto_63087 ?auto_63088 ?auto_63089 ?auto_63090 ?auto_63091 ?auto_63092 ?auto_63093 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_63103 - BLOCK
      ?auto_63104 - BLOCK
      ?auto_63105 - BLOCK
      ?auto_63106 - BLOCK
      ?auto_63107 - BLOCK
      ?auto_63108 - BLOCK
      ?auto_63109 - BLOCK
      ?auto_63110 - BLOCK
    )
    :vars
    (
      ?auto_63111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63110 ?auto_63111 ) ( ON-TABLE ?auto_63103 ) ( ON ?auto_63104 ?auto_63103 ) ( ON ?auto_63105 ?auto_63104 ) ( ON ?auto_63106 ?auto_63105 ) ( not ( = ?auto_63103 ?auto_63104 ) ) ( not ( = ?auto_63103 ?auto_63105 ) ) ( not ( = ?auto_63103 ?auto_63106 ) ) ( not ( = ?auto_63103 ?auto_63107 ) ) ( not ( = ?auto_63103 ?auto_63108 ) ) ( not ( = ?auto_63103 ?auto_63109 ) ) ( not ( = ?auto_63103 ?auto_63110 ) ) ( not ( = ?auto_63103 ?auto_63111 ) ) ( not ( = ?auto_63104 ?auto_63105 ) ) ( not ( = ?auto_63104 ?auto_63106 ) ) ( not ( = ?auto_63104 ?auto_63107 ) ) ( not ( = ?auto_63104 ?auto_63108 ) ) ( not ( = ?auto_63104 ?auto_63109 ) ) ( not ( = ?auto_63104 ?auto_63110 ) ) ( not ( = ?auto_63104 ?auto_63111 ) ) ( not ( = ?auto_63105 ?auto_63106 ) ) ( not ( = ?auto_63105 ?auto_63107 ) ) ( not ( = ?auto_63105 ?auto_63108 ) ) ( not ( = ?auto_63105 ?auto_63109 ) ) ( not ( = ?auto_63105 ?auto_63110 ) ) ( not ( = ?auto_63105 ?auto_63111 ) ) ( not ( = ?auto_63106 ?auto_63107 ) ) ( not ( = ?auto_63106 ?auto_63108 ) ) ( not ( = ?auto_63106 ?auto_63109 ) ) ( not ( = ?auto_63106 ?auto_63110 ) ) ( not ( = ?auto_63106 ?auto_63111 ) ) ( not ( = ?auto_63107 ?auto_63108 ) ) ( not ( = ?auto_63107 ?auto_63109 ) ) ( not ( = ?auto_63107 ?auto_63110 ) ) ( not ( = ?auto_63107 ?auto_63111 ) ) ( not ( = ?auto_63108 ?auto_63109 ) ) ( not ( = ?auto_63108 ?auto_63110 ) ) ( not ( = ?auto_63108 ?auto_63111 ) ) ( not ( = ?auto_63109 ?auto_63110 ) ) ( not ( = ?auto_63109 ?auto_63111 ) ) ( not ( = ?auto_63110 ?auto_63111 ) ) ( ON ?auto_63109 ?auto_63110 ) ( ON ?auto_63108 ?auto_63109 ) ( CLEAR ?auto_63106 ) ( ON ?auto_63107 ?auto_63108 ) ( CLEAR ?auto_63107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63103 ?auto_63104 ?auto_63105 ?auto_63106 ?auto_63107 )
      ( MAKE-8PILE ?auto_63103 ?auto_63104 ?auto_63105 ?auto_63106 ?auto_63107 ?auto_63108 ?auto_63109 ?auto_63110 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_63120 - BLOCK
      ?auto_63121 - BLOCK
      ?auto_63122 - BLOCK
      ?auto_63123 - BLOCK
      ?auto_63124 - BLOCK
      ?auto_63125 - BLOCK
      ?auto_63126 - BLOCK
      ?auto_63127 - BLOCK
    )
    :vars
    (
      ?auto_63128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63127 ?auto_63128 ) ( ON-TABLE ?auto_63120 ) ( ON ?auto_63121 ?auto_63120 ) ( ON ?auto_63122 ?auto_63121 ) ( not ( = ?auto_63120 ?auto_63121 ) ) ( not ( = ?auto_63120 ?auto_63122 ) ) ( not ( = ?auto_63120 ?auto_63123 ) ) ( not ( = ?auto_63120 ?auto_63124 ) ) ( not ( = ?auto_63120 ?auto_63125 ) ) ( not ( = ?auto_63120 ?auto_63126 ) ) ( not ( = ?auto_63120 ?auto_63127 ) ) ( not ( = ?auto_63120 ?auto_63128 ) ) ( not ( = ?auto_63121 ?auto_63122 ) ) ( not ( = ?auto_63121 ?auto_63123 ) ) ( not ( = ?auto_63121 ?auto_63124 ) ) ( not ( = ?auto_63121 ?auto_63125 ) ) ( not ( = ?auto_63121 ?auto_63126 ) ) ( not ( = ?auto_63121 ?auto_63127 ) ) ( not ( = ?auto_63121 ?auto_63128 ) ) ( not ( = ?auto_63122 ?auto_63123 ) ) ( not ( = ?auto_63122 ?auto_63124 ) ) ( not ( = ?auto_63122 ?auto_63125 ) ) ( not ( = ?auto_63122 ?auto_63126 ) ) ( not ( = ?auto_63122 ?auto_63127 ) ) ( not ( = ?auto_63122 ?auto_63128 ) ) ( not ( = ?auto_63123 ?auto_63124 ) ) ( not ( = ?auto_63123 ?auto_63125 ) ) ( not ( = ?auto_63123 ?auto_63126 ) ) ( not ( = ?auto_63123 ?auto_63127 ) ) ( not ( = ?auto_63123 ?auto_63128 ) ) ( not ( = ?auto_63124 ?auto_63125 ) ) ( not ( = ?auto_63124 ?auto_63126 ) ) ( not ( = ?auto_63124 ?auto_63127 ) ) ( not ( = ?auto_63124 ?auto_63128 ) ) ( not ( = ?auto_63125 ?auto_63126 ) ) ( not ( = ?auto_63125 ?auto_63127 ) ) ( not ( = ?auto_63125 ?auto_63128 ) ) ( not ( = ?auto_63126 ?auto_63127 ) ) ( not ( = ?auto_63126 ?auto_63128 ) ) ( not ( = ?auto_63127 ?auto_63128 ) ) ( ON ?auto_63126 ?auto_63127 ) ( ON ?auto_63125 ?auto_63126 ) ( ON ?auto_63124 ?auto_63125 ) ( CLEAR ?auto_63122 ) ( ON ?auto_63123 ?auto_63124 ) ( CLEAR ?auto_63123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63120 ?auto_63121 ?auto_63122 ?auto_63123 )
      ( MAKE-8PILE ?auto_63120 ?auto_63121 ?auto_63122 ?auto_63123 ?auto_63124 ?auto_63125 ?auto_63126 ?auto_63127 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_63137 - BLOCK
      ?auto_63138 - BLOCK
      ?auto_63139 - BLOCK
      ?auto_63140 - BLOCK
      ?auto_63141 - BLOCK
      ?auto_63142 - BLOCK
      ?auto_63143 - BLOCK
      ?auto_63144 - BLOCK
    )
    :vars
    (
      ?auto_63145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63144 ?auto_63145 ) ( ON-TABLE ?auto_63137 ) ( ON ?auto_63138 ?auto_63137 ) ( ON ?auto_63139 ?auto_63138 ) ( not ( = ?auto_63137 ?auto_63138 ) ) ( not ( = ?auto_63137 ?auto_63139 ) ) ( not ( = ?auto_63137 ?auto_63140 ) ) ( not ( = ?auto_63137 ?auto_63141 ) ) ( not ( = ?auto_63137 ?auto_63142 ) ) ( not ( = ?auto_63137 ?auto_63143 ) ) ( not ( = ?auto_63137 ?auto_63144 ) ) ( not ( = ?auto_63137 ?auto_63145 ) ) ( not ( = ?auto_63138 ?auto_63139 ) ) ( not ( = ?auto_63138 ?auto_63140 ) ) ( not ( = ?auto_63138 ?auto_63141 ) ) ( not ( = ?auto_63138 ?auto_63142 ) ) ( not ( = ?auto_63138 ?auto_63143 ) ) ( not ( = ?auto_63138 ?auto_63144 ) ) ( not ( = ?auto_63138 ?auto_63145 ) ) ( not ( = ?auto_63139 ?auto_63140 ) ) ( not ( = ?auto_63139 ?auto_63141 ) ) ( not ( = ?auto_63139 ?auto_63142 ) ) ( not ( = ?auto_63139 ?auto_63143 ) ) ( not ( = ?auto_63139 ?auto_63144 ) ) ( not ( = ?auto_63139 ?auto_63145 ) ) ( not ( = ?auto_63140 ?auto_63141 ) ) ( not ( = ?auto_63140 ?auto_63142 ) ) ( not ( = ?auto_63140 ?auto_63143 ) ) ( not ( = ?auto_63140 ?auto_63144 ) ) ( not ( = ?auto_63140 ?auto_63145 ) ) ( not ( = ?auto_63141 ?auto_63142 ) ) ( not ( = ?auto_63141 ?auto_63143 ) ) ( not ( = ?auto_63141 ?auto_63144 ) ) ( not ( = ?auto_63141 ?auto_63145 ) ) ( not ( = ?auto_63142 ?auto_63143 ) ) ( not ( = ?auto_63142 ?auto_63144 ) ) ( not ( = ?auto_63142 ?auto_63145 ) ) ( not ( = ?auto_63143 ?auto_63144 ) ) ( not ( = ?auto_63143 ?auto_63145 ) ) ( not ( = ?auto_63144 ?auto_63145 ) ) ( ON ?auto_63143 ?auto_63144 ) ( ON ?auto_63142 ?auto_63143 ) ( ON ?auto_63141 ?auto_63142 ) ( CLEAR ?auto_63139 ) ( ON ?auto_63140 ?auto_63141 ) ( CLEAR ?auto_63140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63137 ?auto_63138 ?auto_63139 ?auto_63140 )
      ( MAKE-8PILE ?auto_63137 ?auto_63138 ?auto_63139 ?auto_63140 ?auto_63141 ?auto_63142 ?auto_63143 ?auto_63144 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_63154 - BLOCK
      ?auto_63155 - BLOCK
      ?auto_63156 - BLOCK
      ?auto_63157 - BLOCK
      ?auto_63158 - BLOCK
      ?auto_63159 - BLOCK
      ?auto_63160 - BLOCK
      ?auto_63161 - BLOCK
    )
    :vars
    (
      ?auto_63162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63161 ?auto_63162 ) ( ON-TABLE ?auto_63154 ) ( ON ?auto_63155 ?auto_63154 ) ( not ( = ?auto_63154 ?auto_63155 ) ) ( not ( = ?auto_63154 ?auto_63156 ) ) ( not ( = ?auto_63154 ?auto_63157 ) ) ( not ( = ?auto_63154 ?auto_63158 ) ) ( not ( = ?auto_63154 ?auto_63159 ) ) ( not ( = ?auto_63154 ?auto_63160 ) ) ( not ( = ?auto_63154 ?auto_63161 ) ) ( not ( = ?auto_63154 ?auto_63162 ) ) ( not ( = ?auto_63155 ?auto_63156 ) ) ( not ( = ?auto_63155 ?auto_63157 ) ) ( not ( = ?auto_63155 ?auto_63158 ) ) ( not ( = ?auto_63155 ?auto_63159 ) ) ( not ( = ?auto_63155 ?auto_63160 ) ) ( not ( = ?auto_63155 ?auto_63161 ) ) ( not ( = ?auto_63155 ?auto_63162 ) ) ( not ( = ?auto_63156 ?auto_63157 ) ) ( not ( = ?auto_63156 ?auto_63158 ) ) ( not ( = ?auto_63156 ?auto_63159 ) ) ( not ( = ?auto_63156 ?auto_63160 ) ) ( not ( = ?auto_63156 ?auto_63161 ) ) ( not ( = ?auto_63156 ?auto_63162 ) ) ( not ( = ?auto_63157 ?auto_63158 ) ) ( not ( = ?auto_63157 ?auto_63159 ) ) ( not ( = ?auto_63157 ?auto_63160 ) ) ( not ( = ?auto_63157 ?auto_63161 ) ) ( not ( = ?auto_63157 ?auto_63162 ) ) ( not ( = ?auto_63158 ?auto_63159 ) ) ( not ( = ?auto_63158 ?auto_63160 ) ) ( not ( = ?auto_63158 ?auto_63161 ) ) ( not ( = ?auto_63158 ?auto_63162 ) ) ( not ( = ?auto_63159 ?auto_63160 ) ) ( not ( = ?auto_63159 ?auto_63161 ) ) ( not ( = ?auto_63159 ?auto_63162 ) ) ( not ( = ?auto_63160 ?auto_63161 ) ) ( not ( = ?auto_63160 ?auto_63162 ) ) ( not ( = ?auto_63161 ?auto_63162 ) ) ( ON ?auto_63160 ?auto_63161 ) ( ON ?auto_63159 ?auto_63160 ) ( ON ?auto_63158 ?auto_63159 ) ( ON ?auto_63157 ?auto_63158 ) ( CLEAR ?auto_63155 ) ( ON ?auto_63156 ?auto_63157 ) ( CLEAR ?auto_63156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63154 ?auto_63155 ?auto_63156 )
      ( MAKE-8PILE ?auto_63154 ?auto_63155 ?auto_63156 ?auto_63157 ?auto_63158 ?auto_63159 ?auto_63160 ?auto_63161 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_63171 - BLOCK
      ?auto_63172 - BLOCK
      ?auto_63173 - BLOCK
      ?auto_63174 - BLOCK
      ?auto_63175 - BLOCK
      ?auto_63176 - BLOCK
      ?auto_63177 - BLOCK
      ?auto_63178 - BLOCK
    )
    :vars
    (
      ?auto_63179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63178 ?auto_63179 ) ( ON-TABLE ?auto_63171 ) ( ON ?auto_63172 ?auto_63171 ) ( not ( = ?auto_63171 ?auto_63172 ) ) ( not ( = ?auto_63171 ?auto_63173 ) ) ( not ( = ?auto_63171 ?auto_63174 ) ) ( not ( = ?auto_63171 ?auto_63175 ) ) ( not ( = ?auto_63171 ?auto_63176 ) ) ( not ( = ?auto_63171 ?auto_63177 ) ) ( not ( = ?auto_63171 ?auto_63178 ) ) ( not ( = ?auto_63171 ?auto_63179 ) ) ( not ( = ?auto_63172 ?auto_63173 ) ) ( not ( = ?auto_63172 ?auto_63174 ) ) ( not ( = ?auto_63172 ?auto_63175 ) ) ( not ( = ?auto_63172 ?auto_63176 ) ) ( not ( = ?auto_63172 ?auto_63177 ) ) ( not ( = ?auto_63172 ?auto_63178 ) ) ( not ( = ?auto_63172 ?auto_63179 ) ) ( not ( = ?auto_63173 ?auto_63174 ) ) ( not ( = ?auto_63173 ?auto_63175 ) ) ( not ( = ?auto_63173 ?auto_63176 ) ) ( not ( = ?auto_63173 ?auto_63177 ) ) ( not ( = ?auto_63173 ?auto_63178 ) ) ( not ( = ?auto_63173 ?auto_63179 ) ) ( not ( = ?auto_63174 ?auto_63175 ) ) ( not ( = ?auto_63174 ?auto_63176 ) ) ( not ( = ?auto_63174 ?auto_63177 ) ) ( not ( = ?auto_63174 ?auto_63178 ) ) ( not ( = ?auto_63174 ?auto_63179 ) ) ( not ( = ?auto_63175 ?auto_63176 ) ) ( not ( = ?auto_63175 ?auto_63177 ) ) ( not ( = ?auto_63175 ?auto_63178 ) ) ( not ( = ?auto_63175 ?auto_63179 ) ) ( not ( = ?auto_63176 ?auto_63177 ) ) ( not ( = ?auto_63176 ?auto_63178 ) ) ( not ( = ?auto_63176 ?auto_63179 ) ) ( not ( = ?auto_63177 ?auto_63178 ) ) ( not ( = ?auto_63177 ?auto_63179 ) ) ( not ( = ?auto_63178 ?auto_63179 ) ) ( ON ?auto_63177 ?auto_63178 ) ( ON ?auto_63176 ?auto_63177 ) ( ON ?auto_63175 ?auto_63176 ) ( ON ?auto_63174 ?auto_63175 ) ( CLEAR ?auto_63172 ) ( ON ?auto_63173 ?auto_63174 ) ( CLEAR ?auto_63173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63171 ?auto_63172 ?auto_63173 )
      ( MAKE-8PILE ?auto_63171 ?auto_63172 ?auto_63173 ?auto_63174 ?auto_63175 ?auto_63176 ?auto_63177 ?auto_63178 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_63188 - BLOCK
      ?auto_63189 - BLOCK
      ?auto_63190 - BLOCK
      ?auto_63191 - BLOCK
      ?auto_63192 - BLOCK
      ?auto_63193 - BLOCK
      ?auto_63194 - BLOCK
      ?auto_63195 - BLOCK
    )
    :vars
    (
      ?auto_63196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63195 ?auto_63196 ) ( ON-TABLE ?auto_63188 ) ( not ( = ?auto_63188 ?auto_63189 ) ) ( not ( = ?auto_63188 ?auto_63190 ) ) ( not ( = ?auto_63188 ?auto_63191 ) ) ( not ( = ?auto_63188 ?auto_63192 ) ) ( not ( = ?auto_63188 ?auto_63193 ) ) ( not ( = ?auto_63188 ?auto_63194 ) ) ( not ( = ?auto_63188 ?auto_63195 ) ) ( not ( = ?auto_63188 ?auto_63196 ) ) ( not ( = ?auto_63189 ?auto_63190 ) ) ( not ( = ?auto_63189 ?auto_63191 ) ) ( not ( = ?auto_63189 ?auto_63192 ) ) ( not ( = ?auto_63189 ?auto_63193 ) ) ( not ( = ?auto_63189 ?auto_63194 ) ) ( not ( = ?auto_63189 ?auto_63195 ) ) ( not ( = ?auto_63189 ?auto_63196 ) ) ( not ( = ?auto_63190 ?auto_63191 ) ) ( not ( = ?auto_63190 ?auto_63192 ) ) ( not ( = ?auto_63190 ?auto_63193 ) ) ( not ( = ?auto_63190 ?auto_63194 ) ) ( not ( = ?auto_63190 ?auto_63195 ) ) ( not ( = ?auto_63190 ?auto_63196 ) ) ( not ( = ?auto_63191 ?auto_63192 ) ) ( not ( = ?auto_63191 ?auto_63193 ) ) ( not ( = ?auto_63191 ?auto_63194 ) ) ( not ( = ?auto_63191 ?auto_63195 ) ) ( not ( = ?auto_63191 ?auto_63196 ) ) ( not ( = ?auto_63192 ?auto_63193 ) ) ( not ( = ?auto_63192 ?auto_63194 ) ) ( not ( = ?auto_63192 ?auto_63195 ) ) ( not ( = ?auto_63192 ?auto_63196 ) ) ( not ( = ?auto_63193 ?auto_63194 ) ) ( not ( = ?auto_63193 ?auto_63195 ) ) ( not ( = ?auto_63193 ?auto_63196 ) ) ( not ( = ?auto_63194 ?auto_63195 ) ) ( not ( = ?auto_63194 ?auto_63196 ) ) ( not ( = ?auto_63195 ?auto_63196 ) ) ( ON ?auto_63194 ?auto_63195 ) ( ON ?auto_63193 ?auto_63194 ) ( ON ?auto_63192 ?auto_63193 ) ( ON ?auto_63191 ?auto_63192 ) ( ON ?auto_63190 ?auto_63191 ) ( CLEAR ?auto_63188 ) ( ON ?auto_63189 ?auto_63190 ) ( CLEAR ?auto_63189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63188 ?auto_63189 )
      ( MAKE-8PILE ?auto_63188 ?auto_63189 ?auto_63190 ?auto_63191 ?auto_63192 ?auto_63193 ?auto_63194 ?auto_63195 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_63205 - BLOCK
      ?auto_63206 - BLOCK
      ?auto_63207 - BLOCK
      ?auto_63208 - BLOCK
      ?auto_63209 - BLOCK
      ?auto_63210 - BLOCK
      ?auto_63211 - BLOCK
      ?auto_63212 - BLOCK
    )
    :vars
    (
      ?auto_63213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63212 ?auto_63213 ) ( ON-TABLE ?auto_63205 ) ( not ( = ?auto_63205 ?auto_63206 ) ) ( not ( = ?auto_63205 ?auto_63207 ) ) ( not ( = ?auto_63205 ?auto_63208 ) ) ( not ( = ?auto_63205 ?auto_63209 ) ) ( not ( = ?auto_63205 ?auto_63210 ) ) ( not ( = ?auto_63205 ?auto_63211 ) ) ( not ( = ?auto_63205 ?auto_63212 ) ) ( not ( = ?auto_63205 ?auto_63213 ) ) ( not ( = ?auto_63206 ?auto_63207 ) ) ( not ( = ?auto_63206 ?auto_63208 ) ) ( not ( = ?auto_63206 ?auto_63209 ) ) ( not ( = ?auto_63206 ?auto_63210 ) ) ( not ( = ?auto_63206 ?auto_63211 ) ) ( not ( = ?auto_63206 ?auto_63212 ) ) ( not ( = ?auto_63206 ?auto_63213 ) ) ( not ( = ?auto_63207 ?auto_63208 ) ) ( not ( = ?auto_63207 ?auto_63209 ) ) ( not ( = ?auto_63207 ?auto_63210 ) ) ( not ( = ?auto_63207 ?auto_63211 ) ) ( not ( = ?auto_63207 ?auto_63212 ) ) ( not ( = ?auto_63207 ?auto_63213 ) ) ( not ( = ?auto_63208 ?auto_63209 ) ) ( not ( = ?auto_63208 ?auto_63210 ) ) ( not ( = ?auto_63208 ?auto_63211 ) ) ( not ( = ?auto_63208 ?auto_63212 ) ) ( not ( = ?auto_63208 ?auto_63213 ) ) ( not ( = ?auto_63209 ?auto_63210 ) ) ( not ( = ?auto_63209 ?auto_63211 ) ) ( not ( = ?auto_63209 ?auto_63212 ) ) ( not ( = ?auto_63209 ?auto_63213 ) ) ( not ( = ?auto_63210 ?auto_63211 ) ) ( not ( = ?auto_63210 ?auto_63212 ) ) ( not ( = ?auto_63210 ?auto_63213 ) ) ( not ( = ?auto_63211 ?auto_63212 ) ) ( not ( = ?auto_63211 ?auto_63213 ) ) ( not ( = ?auto_63212 ?auto_63213 ) ) ( ON ?auto_63211 ?auto_63212 ) ( ON ?auto_63210 ?auto_63211 ) ( ON ?auto_63209 ?auto_63210 ) ( ON ?auto_63208 ?auto_63209 ) ( ON ?auto_63207 ?auto_63208 ) ( CLEAR ?auto_63205 ) ( ON ?auto_63206 ?auto_63207 ) ( CLEAR ?auto_63206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63205 ?auto_63206 )
      ( MAKE-8PILE ?auto_63205 ?auto_63206 ?auto_63207 ?auto_63208 ?auto_63209 ?auto_63210 ?auto_63211 ?auto_63212 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_63222 - BLOCK
      ?auto_63223 - BLOCK
      ?auto_63224 - BLOCK
      ?auto_63225 - BLOCK
      ?auto_63226 - BLOCK
      ?auto_63227 - BLOCK
      ?auto_63228 - BLOCK
      ?auto_63229 - BLOCK
    )
    :vars
    (
      ?auto_63230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63229 ?auto_63230 ) ( not ( = ?auto_63222 ?auto_63223 ) ) ( not ( = ?auto_63222 ?auto_63224 ) ) ( not ( = ?auto_63222 ?auto_63225 ) ) ( not ( = ?auto_63222 ?auto_63226 ) ) ( not ( = ?auto_63222 ?auto_63227 ) ) ( not ( = ?auto_63222 ?auto_63228 ) ) ( not ( = ?auto_63222 ?auto_63229 ) ) ( not ( = ?auto_63222 ?auto_63230 ) ) ( not ( = ?auto_63223 ?auto_63224 ) ) ( not ( = ?auto_63223 ?auto_63225 ) ) ( not ( = ?auto_63223 ?auto_63226 ) ) ( not ( = ?auto_63223 ?auto_63227 ) ) ( not ( = ?auto_63223 ?auto_63228 ) ) ( not ( = ?auto_63223 ?auto_63229 ) ) ( not ( = ?auto_63223 ?auto_63230 ) ) ( not ( = ?auto_63224 ?auto_63225 ) ) ( not ( = ?auto_63224 ?auto_63226 ) ) ( not ( = ?auto_63224 ?auto_63227 ) ) ( not ( = ?auto_63224 ?auto_63228 ) ) ( not ( = ?auto_63224 ?auto_63229 ) ) ( not ( = ?auto_63224 ?auto_63230 ) ) ( not ( = ?auto_63225 ?auto_63226 ) ) ( not ( = ?auto_63225 ?auto_63227 ) ) ( not ( = ?auto_63225 ?auto_63228 ) ) ( not ( = ?auto_63225 ?auto_63229 ) ) ( not ( = ?auto_63225 ?auto_63230 ) ) ( not ( = ?auto_63226 ?auto_63227 ) ) ( not ( = ?auto_63226 ?auto_63228 ) ) ( not ( = ?auto_63226 ?auto_63229 ) ) ( not ( = ?auto_63226 ?auto_63230 ) ) ( not ( = ?auto_63227 ?auto_63228 ) ) ( not ( = ?auto_63227 ?auto_63229 ) ) ( not ( = ?auto_63227 ?auto_63230 ) ) ( not ( = ?auto_63228 ?auto_63229 ) ) ( not ( = ?auto_63228 ?auto_63230 ) ) ( not ( = ?auto_63229 ?auto_63230 ) ) ( ON ?auto_63228 ?auto_63229 ) ( ON ?auto_63227 ?auto_63228 ) ( ON ?auto_63226 ?auto_63227 ) ( ON ?auto_63225 ?auto_63226 ) ( ON ?auto_63224 ?auto_63225 ) ( ON ?auto_63223 ?auto_63224 ) ( ON ?auto_63222 ?auto_63223 ) ( CLEAR ?auto_63222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63222 )
      ( MAKE-8PILE ?auto_63222 ?auto_63223 ?auto_63224 ?auto_63225 ?auto_63226 ?auto_63227 ?auto_63228 ?auto_63229 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_63239 - BLOCK
      ?auto_63240 - BLOCK
      ?auto_63241 - BLOCK
      ?auto_63242 - BLOCK
      ?auto_63243 - BLOCK
      ?auto_63244 - BLOCK
      ?auto_63245 - BLOCK
      ?auto_63246 - BLOCK
    )
    :vars
    (
      ?auto_63247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63246 ?auto_63247 ) ( not ( = ?auto_63239 ?auto_63240 ) ) ( not ( = ?auto_63239 ?auto_63241 ) ) ( not ( = ?auto_63239 ?auto_63242 ) ) ( not ( = ?auto_63239 ?auto_63243 ) ) ( not ( = ?auto_63239 ?auto_63244 ) ) ( not ( = ?auto_63239 ?auto_63245 ) ) ( not ( = ?auto_63239 ?auto_63246 ) ) ( not ( = ?auto_63239 ?auto_63247 ) ) ( not ( = ?auto_63240 ?auto_63241 ) ) ( not ( = ?auto_63240 ?auto_63242 ) ) ( not ( = ?auto_63240 ?auto_63243 ) ) ( not ( = ?auto_63240 ?auto_63244 ) ) ( not ( = ?auto_63240 ?auto_63245 ) ) ( not ( = ?auto_63240 ?auto_63246 ) ) ( not ( = ?auto_63240 ?auto_63247 ) ) ( not ( = ?auto_63241 ?auto_63242 ) ) ( not ( = ?auto_63241 ?auto_63243 ) ) ( not ( = ?auto_63241 ?auto_63244 ) ) ( not ( = ?auto_63241 ?auto_63245 ) ) ( not ( = ?auto_63241 ?auto_63246 ) ) ( not ( = ?auto_63241 ?auto_63247 ) ) ( not ( = ?auto_63242 ?auto_63243 ) ) ( not ( = ?auto_63242 ?auto_63244 ) ) ( not ( = ?auto_63242 ?auto_63245 ) ) ( not ( = ?auto_63242 ?auto_63246 ) ) ( not ( = ?auto_63242 ?auto_63247 ) ) ( not ( = ?auto_63243 ?auto_63244 ) ) ( not ( = ?auto_63243 ?auto_63245 ) ) ( not ( = ?auto_63243 ?auto_63246 ) ) ( not ( = ?auto_63243 ?auto_63247 ) ) ( not ( = ?auto_63244 ?auto_63245 ) ) ( not ( = ?auto_63244 ?auto_63246 ) ) ( not ( = ?auto_63244 ?auto_63247 ) ) ( not ( = ?auto_63245 ?auto_63246 ) ) ( not ( = ?auto_63245 ?auto_63247 ) ) ( not ( = ?auto_63246 ?auto_63247 ) ) ( ON ?auto_63245 ?auto_63246 ) ( ON ?auto_63244 ?auto_63245 ) ( ON ?auto_63243 ?auto_63244 ) ( ON ?auto_63242 ?auto_63243 ) ( ON ?auto_63241 ?auto_63242 ) ( ON ?auto_63240 ?auto_63241 ) ( ON ?auto_63239 ?auto_63240 ) ( CLEAR ?auto_63239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63239 )
      ( MAKE-8PILE ?auto_63239 ?auto_63240 ?auto_63241 ?auto_63242 ?auto_63243 ?auto_63244 ?auto_63245 ?auto_63246 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63257 - BLOCK
      ?auto_63258 - BLOCK
      ?auto_63259 - BLOCK
      ?auto_63260 - BLOCK
      ?auto_63261 - BLOCK
      ?auto_63262 - BLOCK
      ?auto_63263 - BLOCK
      ?auto_63264 - BLOCK
      ?auto_63265 - BLOCK
    )
    :vars
    (
      ?auto_63266 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63264 ) ( ON ?auto_63265 ?auto_63266 ) ( CLEAR ?auto_63265 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63257 ) ( ON ?auto_63258 ?auto_63257 ) ( ON ?auto_63259 ?auto_63258 ) ( ON ?auto_63260 ?auto_63259 ) ( ON ?auto_63261 ?auto_63260 ) ( ON ?auto_63262 ?auto_63261 ) ( ON ?auto_63263 ?auto_63262 ) ( ON ?auto_63264 ?auto_63263 ) ( not ( = ?auto_63257 ?auto_63258 ) ) ( not ( = ?auto_63257 ?auto_63259 ) ) ( not ( = ?auto_63257 ?auto_63260 ) ) ( not ( = ?auto_63257 ?auto_63261 ) ) ( not ( = ?auto_63257 ?auto_63262 ) ) ( not ( = ?auto_63257 ?auto_63263 ) ) ( not ( = ?auto_63257 ?auto_63264 ) ) ( not ( = ?auto_63257 ?auto_63265 ) ) ( not ( = ?auto_63257 ?auto_63266 ) ) ( not ( = ?auto_63258 ?auto_63259 ) ) ( not ( = ?auto_63258 ?auto_63260 ) ) ( not ( = ?auto_63258 ?auto_63261 ) ) ( not ( = ?auto_63258 ?auto_63262 ) ) ( not ( = ?auto_63258 ?auto_63263 ) ) ( not ( = ?auto_63258 ?auto_63264 ) ) ( not ( = ?auto_63258 ?auto_63265 ) ) ( not ( = ?auto_63258 ?auto_63266 ) ) ( not ( = ?auto_63259 ?auto_63260 ) ) ( not ( = ?auto_63259 ?auto_63261 ) ) ( not ( = ?auto_63259 ?auto_63262 ) ) ( not ( = ?auto_63259 ?auto_63263 ) ) ( not ( = ?auto_63259 ?auto_63264 ) ) ( not ( = ?auto_63259 ?auto_63265 ) ) ( not ( = ?auto_63259 ?auto_63266 ) ) ( not ( = ?auto_63260 ?auto_63261 ) ) ( not ( = ?auto_63260 ?auto_63262 ) ) ( not ( = ?auto_63260 ?auto_63263 ) ) ( not ( = ?auto_63260 ?auto_63264 ) ) ( not ( = ?auto_63260 ?auto_63265 ) ) ( not ( = ?auto_63260 ?auto_63266 ) ) ( not ( = ?auto_63261 ?auto_63262 ) ) ( not ( = ?auto_63261 ?auto_63263 ) ) ( not ( = ?auto_63261 ?auto_63264 ) ) ( not ( = ?auto_63261 ?auto_63265 ) ) ( not ( = ?auto_63261 ?auto_63266 ) ) ( not ( = ?auto_63262 ?auto_63263 ) ) ( not ( = ?auto_63262 ?auto_63264 ) ) ( not ( = ?auto_63262 ?auto_63265 ) ) ( not ( = ?auto_63262 ?auto_63266 ) ) ( not ( = ?auto_63263 ?auto_63264 ) ) ( not ( = ?auto_63263 ?auto_63265 ) ) ( not ( = ?auto_63263 ?auto_63266 ) ) ( not ( = ?auto_63264 ?auto_63265 ) ) ( not ( = ?auto_63264 ?auto_63266 ) ) ( not ( = ?auto_63265 ?auto_63266 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63265 ?auto_63266 )
      ( !STACK ?auto_63265 ?auto_63264 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63276 - BLOCK
      ?auto_63277 - BLOCK
      ?auto_63278 - BLOCK
      ?auto_63279 - BLOCK
      ?auto_63280 - BLOCK
      ?auto_63281 - BLOCK
      ?auto_63282 - BLOCK
      ?auto_63283 - BLOCK
      ?auto_63284 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63283 ) ( ON-TABLE ?auto_63284 ) ( CLEAR ?auto_63284 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63276 ) ( ON ?auto_63277 ?auto_63276 ) ( ON ?auto_63278 ?auto_63277 ) ( ON ?auto_63279 ?auto_63278 ) ( ON ?auto_63280 ?auto_63279 ) ( ON ?auto_63281 ?auto_63280 ) ( ON ?auto_63282 ?auto_63281 ) ( ON ?auto_63283 ?auto_63282 ) ( not ( = ?auto_63276 ?auto_63277 ) ) ( not ( = ?auto_63276 ?auto_63278 ) ) ( not ( = ?auto_63276 ?auto_63279 ) ) ( not ( = ?auto_63276 ?auto_63280 ) ) ( not ( = ?auto_63276 ?auto_63281 ) ) ( not ( = ?auto_63276 ?auto_63282 ) ) ( not ( = ?auto_63276 ?auto_63283 ) ) ( not ( = ?auto_63276 ?auto_63284 ) ) ( not ( = ?auto_63277 ?auto_63278 ) ) ( not ( = ?auto_63277 ?auto_63279 ) ) ( not ( = ?auto_63277 ?auto_63280 ) ) ( not ( = ?auto_63277 ?auto_63281 ) ) ( not ( = ?auto_63277 ?auto_63282 ) ) ( not ( = ?auto_63277 ?auto_63283 ) ) ( not ( = ?auto_63277 ?auto_63284 ) ) ( not ( = ?auto_63278 ?auto_63279 ) ) ( not ( = ?auto_63278 ?auto_63280 ) ) ( not ( = ?auto_63278 ?auto_63281 ) ) ( not ( = ?auto_63278 ?auto_63282 ) ) ( not ( = ?auto_63278 ?auto_63283 ) ) ( not ( = ?auto_63278 ?auto_63284 ) ) ( not ( = ?auto_63279 ?auto_63280 ) ) ( not ( = ?auto_63279 ?auto_63281 ) ) ( not ( = ?auto_63279 ?auto_63282 ) ) ( not ( = ?auto_63279 ?auto_63283 ) ) ( not ( = ?auto_63279 ?auto_63284 ) ) ( not ( = ?auto_63280 ?auto_63281 ) ) ( not ( = ?auto_63280 ?auto_63282 ) ) ( not ( = ?auto_63280 ?auto_63283 ) ) ( not ( = ?auto_63280 ?auto_63284 ) ) ( not ( = ?auto_63281 ?auto_63282 ) ) ( not ( = ?auto_63281 ?auto_63283 ) ) ( not ( = ?auto_63281 ?auto_63284 ) ) ( not ( = ?auto_63282 ?auto_63283 ) ) ( not ( = ?auto_63282 ?auto_63284 ) ) ( not ( = ?auto_63283 ?auto_63284 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_63284 )
      ( !STACK ?auto_63284 ?auto_63283 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63294 - BLOCK
      ?auto_63295 - BLOCK
      ?auto_63296 - BLOCK
      ?auto_63297 - BLOCK
      ?auto_63298 - BLOCK
      ?auto_63299 - BLOCK
      ?auto_63300 - BLOCK
      ?auto_63301 - BLOCK
      ?auto_63302 - BLOCK
    )
    :vars
    (
      ?auto_63303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63302 ?auto_63303 ) ( ON-TABLE ?auto_63294 ) ( ON ?auto_63295 ?auto_63294 ) ( ON ?auto_63296 ?auto_63295 ) ( ON ?auto_63297 ?auto_63296 ) ( ON ?auto_63298 ?auto_63297 ) ( ON ?auto_63299 ?auto_63298 ) ( ON ?auto_63300 ?auto_63299 ) ( not ( = ?auto_63294 ?auto_63295 ) ) ( not ( = ?auto_63294 ?auto_63296 ) ) ( not ( = ?auto_63294 ?auto_63297 ) ) ( not ( = ?auto_63294 ?auto_63298 ) ) ( not ( = ?auto_63294 ?auto_63299 ) ) ( not ( = ?auto_63294 ?auto_63300 ) ) ( not ( = ?auto_63294 ?auto_63301 ) ) ( not ( = ?auto_63294 ?auto_63302 ) ) ( not ( = ?auto_63294 ?auto_63303 ) ) ( not ( = ?auto_63295 ?auto_63296 ) ) ( not ( = ?auto_63295 ?auto_63297 ) ) ( not ( = ?auto_63295 ?auto_63298 ) ) ( not ( = ?auto_63295 ?auto_63299 ) ) ( not ( = ?auto_63295 ?auto_63300 ) ) ( not ( = ?auto_63295 ?auto_63301 ) ) ( not ( = ?auto_63295 ?auto_63302 ) ) ( not ( = ?auto_63295 ?auto_63303 ) ) ( not ( = ?auto_63296 ?auto_63297 ) ) ( not ( = ?auto_63296 ?auto_63298 ) ) ( not ( = ?auto_63296 ?auto_63299 ) ) ( not ( = ?auto_63296 ?auto_63300 ) ) ( not ( = ?auto_63296 ?auto_63301 ) ) ( not ( = ?auto_63296 ?auto_63302 ) ) ( not ( = ?auto_63296 ?auto_63303 ) ) ( not ( = ?auto_63297 ?auto_63298 ) ) ( not ( = ?auto_63297 ?auto_63299 ) ) ( not ( = ?auto_63297 ?auto_63300 ) ) ( not ( = ?auto_63297 ?auto_63301 ) ) ( not ( = ?auto_63297 ?auto_63302 ) ) ( not ( = ?auto_63297 ?auto_63303 ) ) ( not ( = ?auto_63298 ?auto_63299 ) ) ( not ( = ?auto_63298 ?auto_63300 ) ) ( not ( = ?auto_63298 ?auto_63301 ) ) ( not ( = ?auto_63298 ?auto_63302 ) ) ( not ( = ?auto_63298 ?auto_63303 ) ) ( not ( = ?auto_63299 ?auto_63300 ) ) ( not ( = ?auto_63299 ?auto_63301 ) ) ( not ( = ?auto_63299 ?auto_63302 ) ) ( not ( = ?auto_63299 ?auto_63303 ) ) ( not ( = ?auto_63300 ?auto_63301 ) ) ( not ( = ?auto_63300 ?auto_63302 ) ) ( not ( = ?auto_63300 ?auto_63303 ) ) ( not ( = ?auto_63301 ?auto_63302 ) ) ( not ( = ?auto_63301 ?auto_63303 ) ) ( not ( = ?auto_63302 ?auto_63303 ) ) ( CLEAR ?auto_63300 ) ( ON ?auto_63301 ?auto_63302 ) ( CLEAR ?auto_63301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_63294 ?auto_63295 ?auto_63296 ?auto_63297 ?auto_63298 ?auto_63299 ?auto_63300 ?auto_63301 )
      ( MAKE-9PILE ?auto_63294 ?auto_63295 ?auto_63296 ?auto_63297 ?auto_63298 ?auto_63299 ?auto_63300 ?auto_63301 ?auto_63302 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63313 - BLOCK
      ?auto_63314 - BLOCK
      ?auto_63315 - BLOCK
      ?auto_63316 - BLOCK
      ?auto_63317 - BLOCK
      ?auto_63318 - BLOCK
      ?auto_63319 - BLOCK
      ?auto_63320 - BLOCK
      ?auto_63321 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63321 ) ( ON-TABLE ?auto_63313 ) ( ON ?auto_63314 ?auto_63313 ) ( ON ?auto_63315 ?auto_63314 ) ( ON ?auto_63316 ?auto_63315 ) ( ON ?auto_63317 ?auto_63316 ) ( ON ?auto_63318 ?auto_63317 ) ( ON ?auto_63319 ?auto_63318 ) ( not ( = ?auto_63313 ?auto_63314 ) ) ( not ( = ?auto_63313 ?auto_63315 ) ) ( not ( = ?auto_63313 ?auto_63316 ) ) ( not ( = ?auto_63313 ?auto_63317 ) ) ( not ( = ?auto_63313 ?auto_63318 ) ) ( not ( = ?auto_63313 ?auto_63319 ) ) ( not ( = ?auto_63313 ?auto_63320 ) ) ( not ( = ?auto_63313 ?auto_63321 ) ) ( not ( = ?auto_63314 ?auto_63315 ) ) ( not ( = ?auto_63314 ?auto_63316 ) ) ( not ( = ?auto_63314 ?auto_63317 ) ) ( not ( = ?auto_63314 ?auto_63318 ) ) ( not ( = ?auto_63314 ?auto_63319 ) ) ( not ( = ?auto_63314 ?auto_63320 ) ) ( not ( = ?auto_63314 ?auto_63321 ) ) ( not ( = ?auto_63315 ?auto_63316 ) ) ( not ( = ?auto_63315 ?auto_63317 ) ) ( not ( = ?auto_63315 ?auto_63318 ) ) ( not ( = ?auto_63315 ?auto_63319 ) ) ( not ( = ?auto_63315 ?auto_63320 ) ) ( not ( = ?auto_63315 ?auto_63321 ) ) ( not ( = ?auto_63316 ?auto_63317 ) ) ( not ( = ?auto_63316 ?auto_63318 ) ) ( not ( = ?auto_63316 ?auto_63319 ) ) ( not ( = ?auto_63316 ?auto_63320 ) ) ( not ( = ?auto_63316 ?auto_63321 ) ) ( not ( = ?auto_63317 ?auto_63318 ) ) ( not ( = ?auto_63317 ?auto_63319 ) ) ( not ( = ?auto_63317 ?auto_63320 ) ) ( not ( = ?auto_63317 ?auto_63321 ) ) ( not ( = ?auto_63318 ?auto_63319 ) ) ( not ( = ?auto_63318 ?auto_63320 ) ) ( not ( = ?auto_63318 ?auto_63321 ) ) ( not ( = ?auto_63319 ?auto_63320 ) ) ( not ( = ?auto_63319 ?auto_63321 ) ) ( not ( = ?auto_63320 ?auto_63321 ) ) ( CLEAR ?auto_63319 ) ( ON ?auto_63320 ?auto_63321 ) ( CLEAR ?auto_63320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_63313 ?auto_63314 ?auto_63315 ?auto_63316 ?auto_63317 ?auto_63318 ?auto_63319 ?auto_63320 )
      ( MAKE-9PILE ?auto_63313 ?auto_63314 ?auto_63315 ?auto_63316 ?auto_63317 ?auto_63318 ?auto_63319 ?auto_63320 ?auto_63321 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63331 - BLOCK
      ?auto_63332 - BLOCK
      ?auto_63333 - BLOCK
      ?auto_63334 - BLOCK
      ?auto_63335 - BLOCK
      ?auto_63336 - BLOCK
      ?auto_63337 - BLOCK
      ?auto_63338 - BLOCK
      ?auto_63339 - BLOCK
    )
    :vars
    (
      ?auto_63340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63339 ?auto_63340 ) ( ON-TABLE ?auto_63331 ) ( ON ?auto_63332 ?auto_63331 ) ( ON ?auto_63333 ?auto_63332 ) ( ON ?auto_63334 ?auto_63333 ) ( ON ?auto_63335 ?auto_63334 ) ( ON ?auto_63336 ?auto_63335 ) ( not ( = ?auto_63331 ?auto_63332 ) ) ( not ( = ?auto_63331 ?auto_63333 ) ) ( not ( = ?auto_63331 ?auto_63334 ) ) ( not ( = ?auto_63331 ?auto_63335 ) ) ( not ( = ?auto_63331 ?auto_63336 ) ) ( not ( = ?auto_63331 ?auto_63337 ) ) ( not ( = ?auto_63331 ?auto_63338 ) ) ( not ( = ?auto_63331 ?auto_63339 ) ) ( not ( = ?auto_63331 ?auto_63340 ) ) ( not ( = ?auto_63332 ?auto_63333 ) ) ( not ( = ?auto_63332 ?auto_63334 ) ) ( not ( = ?auto_63332 ?auto_63335 ) ) ( not ( = ?auto_63332 ?auto_63336 ) ) ( not ( = ?auto_63332 ?auto_63337 ) ) ( not ( = ?auto_63332 ?auto_63338 ) ) ( not ( = ?auto_63332 ?auto_63339 ) ) ( not ( = ?auto_63332 ?auto_63340 ) ) ( not ( = ?auto_63333 ?auto_63334 ) ) ( not ( = ?auto_63333 ?auto_63335 ) ) ( not ( = ?auto_63333 ?auto_63336 ) ) ( not ( = ?auto_63333 ?auto_63337 ) ) ( not ( = ?auto_63333 ?auto_63338 ) ) ( not ( = ?auto_63333 ?auto_63339 ) ) ( not ( = ?auto_63333 ?auto_63340 ) ) ( not ( = ?auto_63334 ?auto_63335 ) ) ( not ( = ?auto_63334 ?auto_63336 ) ) ( not ( = ?auto_63334 ?auto_63337 ) ) ( not ( = ?auto_63334 ?auto_63338 ) ) ( not ( = ?auto_63334 ?auto_63339 ) ) ( not ( = ?auto_63334 ?auto_63340 ) ) ( not ( = ?auto_63335 ?auto_63336 ) ) ( not ( = ?auto_63335 ?auto_63337 ) ) ( not ( = ?auto_63335 ?auto_63338 ) ) ( not ( = ?auto_63335 ?auto_63339 ) ) ( not ( = ?auto_63335 ?auto_63340 ) ) ( not ( = ?auto_63336 ?auto_63337 ) ) ( not ( = ?auto_63336 ?auto_63338 ) ) ( not ( = ?auto_63336 ?auto_63339 ) ) ( not ( = ?auto_63336 ?auto_63340 ) ) ( not ( = ?auto_63337 ?auto_63338 ) ) ( not ( = ?auto_63337 ?auto_63339 ) ) ( not ( = ?auto_63337 ?auto_63340 ) ) ( not ( = ?auto_63338 ?auto_63339 ) ) ( not ( = ?auto_63338 ?auto_63340 ) ) ( not ( = ?auto_63339 ?auto_63340 ) ) ( ON ?auto_63338 ?auto_63339 ) ( CLEAR ?auto_63336 ) ( ON ?auto_63337 ?auto_63338 ) ( CLEAR ?auto_63337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_63331 ?auto_63332 ?auto_63333 ?auto_63334 ?auto_63335 ?auto_63336 ?auto_63337 )
      ( MAKE-9PILE ?auto_63331 ?auto_63332 ?auto_63333 ?auto_63334 ?auto_63335 ?auto_63336 ?auto_63337 ?auto_63338 ?auto_63339 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63350 - BLOCK
      ?auto_63351 - BLOCK
      ?auto_63352 - BLOCK
      ?auto_63353 - BLOCK
      ?auto_63354 - BLOCK
      ?auto_63355 - BLOCK
      ?auto_63356 - BLOCK
      ?auto_63357 - BLOCK
      ?auto_63358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63358 ) ( ON-TABLE ?auto_63350 ) ( ON ?auto_63351 ?auto_63350 ) ( ON ?auto_63352 ?auto_63351 ) ( ON ?auto_63353 ?auto_63352 ) ( ON ?auto_63354 ?auto_63353 ) ( ON ?auto_63355 ?auto_63354 ) ( not ( = ?auto_63350 ?auto_63351 ) ) ( not ( = ?auto_63350 ?auto_63352 ) ) ( not ( = ?auto_63350 ?auto_63353 ) ) ( not ( = ?auto_63350 ?auto_63354 ) ) ( not ( = ?auto_63350 ?auto_63355 ) ) ( not ( = ?auto_63350 ?auto_63356 ) ) ( not ( = ?auto_63350 ?auto_63357 ) ) ( not ( = ?auto_63350 ?auto_63358 ) ) ( not ( = ?auto_63351 ?auto_63352 ) ) ( not ( = ?auto_63351 ?auto_63353 ) ) ( not ( = ?auto_63351 ?auto_63354 ) ) ( not ( = ?auto_63351 ?auto_63355 ) ) ( not ( = ?auto_63351 ?auto_63356 ) ) ( not ( = ?auto_63351 ?auto_63357 ) ) ( not ( = ?auto_63351 ?auto_63358 ) ) ( not ( = ?auto_63352 ?auto_63353 ) ) ( not ( = ?auto_63352 ?auto_63354 ) ) ( not ( = ?auto_63352 ?auto_63355 ) ) ( not ( = ?auto_63352 ?auto_63356 ) ) ( not ( = ?auto_63352 ?auto_63357 ) ) ( not ( = ?auto_63352 ?auto_63358 ) ) ( not ( = ?auto_63353 ?auto_63354 ) ) ( not ( = ?auto_63353 ?auto_63355 ) ) ( not ( = ?auto_63353 ?auto_63356 ) ) ( not ( = ?auto_63353 ?auto_63357 ) ) ( not ( = ?auto_63353 ?auto_63358 ) ) ( not ( = ?auto_63354 ?auto_63355 ) ) ( not ( = ?auto_63354 ?auto_63356 ) ) ( not ( = ?auto_63354 ?auto_63357 ) ) ( not ( = ?auto_63354 ?auto_63358 ) ) ( not ( = ?auto_63355 ?auto_63356 ) ) ( not ( = ?auto_63355 ?auto_63357 ) ) ( not ( = ?auto_63355 ?auto_63358 ) ) ( not ( = ?auto_63356 ?auto_63357 ) ) ( not ( = ?auto_63356 ?auto_63358 ) ) ( not ( = ?auto_63357 ?auto_63358 ) ) ( ON ?auto_63357 ?auto_63358 ) ( CLEAR ?auto_63355 ) ( ON ?auto_63356 ?auto_63357 ) ( CLEAR ?auto_63356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_63350 ?auto_63351 ?auto_63352 ?auto_63353 ?auto_63354 ?auto_63355 ?auto_63356 )
      ( MAKE-9PILE ?auto_63350 ?auto_63351 ?auto_63352 ?auto_63353 ?auto_63354 ?auto_63355 ?auto_63356 ?auto_63357 ?auto_63358 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63368 - BLOCK
      ?auto_63369 - BLOCK
      ?auto_63370 - BLOCK
      ?auto_63371 - BLOCK
      ?auto_63372 - BLOCK
      ?auto_63373 - BLOCK
      ?auto_63374 - BLOCK
      ?auto_63375 - BLOCK
      ?auto_63376 - BLOCK
    )
    :vars
    (
      ?auto_63377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63376 ?auto_63377 ) ( ON-TABLE ?auto_63368 ) ( ON ?auto_63369 ?auto_63368 ) ( ON ?auto_63370 ?auto_63369 ) ( ON ?auto_63371 ?auto_63370 ) ( ON ?auto_63372 ?auto_63371 ) ( not ( = ?auto_63368 ?auto_63369 ) ) ( not ( = ?auto_63368 ?auto_63370 ) ) ( not ( = ?auto_63368 ?auto_63371 ) ) ( not ( = ?auto_63368 ?auto_63372 ) ) ( not ( = ?auto_63368 ?auto_63373 ) ) ( not ( = ?auto_63368 ?auto_63374 ) ) ( not ( = ?auto_63368 ?auto_63375 ) ) ( not ( = ?auto_63368 ?auto_63376 ) ) ( not ( = ?auto_63368 ?auto_63377 ) ) ( not ( = ?auto_63369 ?auto_63370 ) ) ( not ( = ?auto_63369 ?auto_63371 ) ) ( not ( = ?auto_63369 ?auto_63372 ) ) ( not ( = ?auto_63369 ?auto_63373 ) ) ( not ( = ?auto_63369 ?auto_63374 ) ) ( not ( = ?auto_63369 ?auto_63375 ) ) ( not ( = ?auto_63369 ?auto_63376 ) ) ( not ( = ?auto_63369 ?auto_63377 ) ) ( not ( = ?auto_63370 ?auto_63371 ) ) ( not ( = ?auto_63370 ?auto_63372 ) ) ( not ( = ?auto_63370 ?auto_63373 ) ) ( not ( = ?auto_63370 ?auto_63374 ) ) ( not ( = ?auto_63370 ?auto_63375 ) ) ( not ( = ?auto_63370 ?auto_63376 ) ) ( not ( = ?auto_63370 ?auto_63377 ) ) ( not ( = ?auto_63371 ?auto_63372 ) ) ( not ( = ?auto_63371 ?auto_63373 ) ) ( not ( = ?auto_63371 ?auto_63374 ) ) ( not ( = ?auto_63371 ?auto_63375 ) ) ( not ( = ?auto_63371 ?auto_63376 ) ) ( not ( = ?auto_63371 ?auto_63377 ) ) ( not ( = ?auto_63372 ?auto_63373 ) ) ( not ( = ?auto_63372 ?auto_63374 ) ) ( not ( = ?auto_63372 ?auto_63375 ) ) ( not ( = ?auto_63372 ?auto_63376 ) ) ( not ( = ?auto_63372 ?auto_63377 ) ) ( not ( = ?auto_63373 ?auto_63374 ) ) ( not ( = ?auto_63373 ?auto_63375 ) ) ( not ( = ?auto_63373 ?auto_63376 ) ) ( not ( = ?auto_63373 ?auto_63377 ) ) ( not ( = ?auto_63374 ?auto_63375 ) ) ( not ( = ?auto_63374 ?auto_63376 ) ) ( not ( = ?auto_63374 ?auto_63377 ) ) ( not ( = ?auto_63375 ?auto_63376 ) ) ( not ( = ?auto_63375 ?auto_63377 ) ) ( not ( = ?auto_63376 ?auto_63377 ) ) ( ON ?auto_63375 ?auto_63376 ) ( ON ?auto_63374 ?auto_63375 ) ( CLEAR ?auto_63372 ) ( ON ?auto_63373 ?auto_63374 ) ( CLEAR ?auto_63373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63368 ?auto_63369 ?auto_63370 ?auto_63371 ?auto_63372 ?auto_63373 )
      ( MAKE-9PILE ?auto_63368 ?auto_63369 ?auto_63370 ?auto_63371 ?auto_63372 ?auto_63373 ?auto_63374 ?auto_63375 ?auto_63376 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63387 - BLOCK
      ?auto_63388 - BLOCK
      ?auto_63389 - BLOCK
      ?auto_63390 - BLOCK
      ?auto_63391 - BLOCK
      ?auto_63392 - BLOCK
      ?auto_63393 - BLOCK
      ?auto_63394 - BLOCK
      ?auto_63395 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63395 ) ( ON-TABLE ?auto_63387 ) ( ON ?auto_63388 ?auto_63387 ) ( ON ?auto_63389 ?auto_63388 ) ( ON ?auto_63390 ?auto_63389 ) ( ON ?auto_63391 ?auto_63390 ) ( not ( = ?auto_63387 ?auto_63388 ) ) ( not ( = ?auto_63387 ?auto_63389 ) ) ( not ( = ?auto_63387 ?auto_63390 ) ) ( not ( = ?auto_63387 ?auto_63391 ) ) ( not ( = ?auto_63387 ?auto_63392 ) ) ( not ( = ?auto_63387 ?auto_63393 ) ) ( not ( = ?auto_63387 ?auto_63394 ) ) ( not ( = ?auto_63387 ?auto_63395 ) ) ( not ( = ?auto_63388 ?auto_63389 ) ) ( not ( = ?auto_63388 ?auto_63390 ) ) ( not ( = ?auto_63388 ?auto_63391 ) ) ( not ( = ?auto_63388 ?auto_63392 ) ) ( not ( = ?auto_63388 ?auto_63393 ) ) ( not ( = ?auto_63388 ?auto_63394 ) ) ( not ( = ?auto_63388 ?auto_63395 ) ) ( not ( = ?auto_63389 ?auto_63390 ) ) ( not ( = ?auto_63389 ?auto_63391 ) ) ( not ( = ?auto_63389 ?auto_63392 ) ) ( not ( = ?auto_63389 ?auto_63393 ) ) ( not ( = ?auto_63389 ?auto_63394 ) ) ( not ( = ?auto_63389 ?auto_63395 ) ) ( not ( = ?auto_63390 ?auto_63391 ) ) ( not ( = ?auto_63390 ?auto_63392 ) ) ( not ( = ?auto_63390 ?auto_63393 ) ) ( not ( = ?auto_63390 ?auto_63394 ) ) ( not ( = ?auto_63390 ?auto_63395 ) ) ( not ( = ?auto_63391 ?auto_63392 ) ) ( not ( = ?auto_63391 ?auto_63393 ) ) ( not ( = ?auto_63391 ?auto_63394 ) ) ( not ( = ?auto_63391 ?auto_63395 ) ) ( not ( = ?auto_63392 ?auto_63393 ) ) ( not ( = ?auto_63392 ?auto_63394 ) ) ( not ( = ?auto_63392 ?auto_63395 ) ) ( not ( = ?auto_63393 ?auto_63394 ) ) ( not ( = ?auto_63393 ?auto_63395 ) ) ( not ( = ?auto_63394 ?auto_63395 ) ) ( ON ?auto_63394 ?auto_63395 ) ( ON ?auto_63393 ?auto_63394 ) ( CLEAR ?auto_63391 ) ( ON ?auto_63392 ?auto_63393 ) ( CLEAR ?auto_63392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63387 ?auto_63388 ?auto_63389 ?auto_63390 ?auto_63391 ?auto_63392 )
      ( MAKE-9PILE ?auto_63387 ?auto_63388 ?auto_63389 ?auto_63390 ?auto_63391 ?auto_63392 ?auto_63393 ?auto_63394 ?auto_63395 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63405 - BLOCK
      ?auto_63406 - BLOCK
      ?auto_63407 - BLOCK
      ?auto_63408 - BLOCK
      ?auto_63409 - BLOCK
      ?auto_63410 - BLOCK
      ?auto_63411 - BLOCK
      ?auto_63412 - BLOCK
      ?auto_63413 - BLOCK
    )
    :vars
    (
      ?auto_63414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63413 ?auto_63414 ) ( ON-TABLE ?auto_63405 ) ( ON ?auto_63406 ?auto_63405 ) ( ON ?auto_63407 ?auto_63406 ) ( ON ?auto_63408 ?auto_63407 ) ( not ( = ?auto_63405 ?auto_63406 ) ) ( not ( = ?auto_63405 ?auto_63407 ) ) ( not ( = ?auto_63405 ?auto_63408 ) ) ( not ( = ?auto_63405 ?auto_63409 ) ) ( not ( = ?auto_63405 ?auto_63410 ) ) ( not ( = ?auto_63405 ?auto_63411 ) ) ( not ( = ?auto_63405 ?auto_63412 ) ) ( not ( = ?auto_63405 ?auto_63413 ) ) ( not ( = ?auto_63405 ?auto_63414 ) ) ( not ( = ?auto_63406 ?auto_63407 ) ) ( not ( = ?auto_63406 ?auto_63408 ) ) ( not ( = ?auto_63406 ?auto_63409 ) ) ( not ( = ?auto_63406 ?auto_63410 ) ) ( not ( = ?auto_63406 ?auto_63411 ) ) ( not ( = ?auto_63406 ?auto_63412 ) ) ( not ( = ?auto_63406 ?auto_63413 ) ) ( not ( = ?auto_63406 ?auto_63414 ) ) ( not ( = ?auto_63407 ?auto_63408 ) ) ( not ( = ?auto_63407 ?auto_63409 ) ) ( not ( = ?auto_63407 ?auto_63410 ) ) ( not ( = ?auto_63407 ?auto_63411 ) ) ( not ( = ?auto_63407 ?auto_63412 ) ) ( not ( = ?auto_63407 ?auto_63413 ) ) ( not ( = ?auto_63407 ?auto_63414 ) ) ( not ( = ?auto_63408 ?auto_63409 ) ) ( not ( = ?auto_63408 ?auto_63410 ) ) ( not ( = ?auto_63408 ?auto_63411 ) ) ( not ( = ?auto_63408 ?auto_63412 ) ) ( not ( = ?auto_63408 ?auto_63413 ) ) ( not ( = ?auto_63408 ?auto_63414 ) ) ( not ( = ?auto_63409 ?auto_63410 ) ) ( not ( = ?auto_63409 ?auto_63411 ) ) ( not ( = ?auto_63409 ?auto_63412 ) ) ( not ( = ?auto_63409 ?auto_63413 ) ) ( not ( = ?auto_63409 ?auto_63414 ) ) ( not ( = ?auto_63410 ?auto_63411 ) ) ( not ( = ?auto_63410 ?auto_63412 ) ) ( not ( = ?auto_63410 ?auto_63413 ) ) ( not ( = ?auto_63410 ?auto_63414 ) ) ( not ( = ?auto_63411 ?auto_63412 ) ) ( not ( = ?auto_63411 ?auto_63413 ) ) ( not ( = ?auto_63411 ?auto_63414 ) ) ( not ( = ?auto_63412 ?auto_63413 ) ) ( not ( = ?auto_63412 ?auto_63414 ) ) ( not ( = ?auto_63413 ?auto_63414 ) ) ( ON ?auto_63412 ?auto_63413 ) ( ON ?auto_63411 ?auto_63412 ) ( ON ?auto_63410 ?auto_63411 ) ( CLEAR ?auto_63408 ) ( ON ?auto_63409 ?auto_63410 ) ( CLEAR ?auto_63409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63405 ?auto_63406 ?auto_63407 ?auto_63408 ?auto_63409 )
      ( MAKE-9PILE ?auto_63405 ?auto_63406 ?auto_63407 ?auto_63408 ?auto_63409 ?auto_63410 ?auto_63411 ?auto_63412 ?auto_63413 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63424 - BLOCK
      ?auto_63425 - BLOCK
      ?auto_63426 - BLOCK
      ?auto_63427 - BLOCK
      ?auto_63428 - BLOCK
      ?auto_63429 - BLOCK
      ?auto_63430 - BLOCK
      ?auto_63431 - BLOCK
      ?auto_63432 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63432 ) ( ON-TABLE ?auto_63424 ) ( ON ?auto_63425 ?auto_63424 ) ( ON ?auto_63426 ?auto_63425 ) ( ON ?auto_63427 ?auto_63426 ) ( not ( = ?auto_63424 ?auto_63425 ) ) ( not ( = ?auto_63424 ?auto_63426 ) ) ( not ( = ?auto_63424 ?auto_63427 ) ) ( not ( = ?auto_63424 ?auto_63428 ) ) ( not ( = ?auto_63424 ?auto_63429 ) ) ( not ( = ?auto_63424 ?auto_63430 ) ) ( not ( = ?auto_63424 ?auto_63431 ) ) ( not ( = ?auto_63424 ?auto_63432 ) ) ( not ( = ?auto_63425 ?auto_63426 ) ) ( not ( = ?auto_63425 ?auto_63427 ) ) ( not ( = ?auto_63425 ?auto_63428 ) ) ( not ( = ?auto_63425 ?auto_63429 ) ) ( not ( = ?auto_63425 ?auto_63430 ) ) ( not ( = ?auto_63425 ?auto_63431 ) ) ( not ( = ?auto_63425 ?auto_63432 ) ) ( not ( = ?auto_63426 ?auto_63427 ) ) ( not ( = ?auto_63426 ?auto_63428 ) ) ( not ( = ?auto_63426 ?auto_63429 ) ) ( not ( = ?auto_63426 ?auto_63430 ) ) ( not ( = ?auto_63426 ?auto_63431 ) ) ( not ( = ?auto_63426 ?auto_63432 ) ) ( not ( = ?auto_63427 ?auto_63428 ) ) ( not ( = ?auto_63427 ?auto_63429 ) ) ( not ( = ?auto_63427 ?auto_63430 ) ) ( not ( = ?auto_63427 ?auto_63431 ) ) ( not ( = ?auto_63427 ?auto_63432 ) ) ( not ( = ?auto_63428 ?auto_63429 ) ) ( not ( = ?auto_63428 ?auto_63430 ) ) ( not ( = ?auto_63428 ?auto_63431 ) ) ( not ( = ?auto_63428 ?auto_63432 ) ) ( not ( = ?auto_63429 ?auto_63430 ) ) ( not ( = ?auto_63429 ?auto_63431 ) ) ( not ( = ?auto_63429 ?auto_63432 ) ) ( not ( = ?auto_63430 ?auto_63431 ) ) ( not ( = ?auto_63430 ?auto_63432 ) ) ( not ( = ?auto_63431 ?auto_63432 ) ) ( ON ?auto_63431 ?auto_63432 ) ( ON ?auto_63430 ?auto_63431 ) ( ON ?auto_63429 ?auto_63430 ) ( CLEAR ?auto_63427 ) ( ON ?auto_63428 ?auto_63429 ) ( CLEAR ?auto_63428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63424 ?auto_63425 ?auto_63426 ?auto_63427 ?auto_63428 )
      ( MAKE-9PILE ?auto_63424 ?auto_63425 ?auto_63426 ?auto_63427 ?auto_63428 ?auto_63429 ?auto_63430 ?auto_63431 ?auto_63432 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63442 - BLOCK
      ?auto_63443 - BLOCK
      ?auto_63444 - BLOCK
      ?auto_63445 - BLOCK
      ?auto_63446 - BLOCK
      ?auto_63447 - BLOCK
      ?auto_63448 - BLOCK
      ?auto_63449 - BLOCK
      ?auto_63450 - BLOCK
    )
    :vars
    (
      ?auto_63451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63450 ?auto_63451 ) ( ON-TABLE ?auto_63442 ) ( ON ?auto_63443 ?auto_63442 ) ( ON ?auto_63444 ?auto_63443 ) ( not ( = ?auto_63442 ?auto_63443 ) ) ( not ( = ?auto_63442 ?auto_63444 ) ) ( not ( = ?auto_63442 ?auto_63445 ) ) ( not ( = ?auto_63442 ?auto_63446 ) ) ( not ( = ?auto_63442 ?auto_63447 ) ) ( not ( = ?auto_63442 ?auto_63448 ) ) ( not ( = ?auto_63442 ?auto_63449 ) ) ( not ( = ?auto_63442 ?auto_63450 ) ) ( not ( = ?auto_63442 ?auto_63451 ) ) ( not ( = ?auto_63443 ?auto_63444 ) ) ( not ( = ?auto_63443 ?auto_63445 ) ) ( not ( = ?auto_63443 ?auto_63446 ) ) ( not ( = ?auto_63443 ?auto_63447 ) ) ( not ( = ?auto_63443 ?auto_63448 ) ) ( not ( = ?auto_63443 ?auto_63449 ) ) ( not ( = ?auto_63443 ?auto_63450 ) ) ( not ( = ?auto_63443 ?auto_63451 ) ) ( not ( = ?auto_63444 ?auto_63445 ) ) ( not ( = ?auto_63444 ?auto_63446 ) ) ( not ( = ?auto_63444 ?auto_63447 ) ) ( not ( = ?auto_63444 ?auto_63448 ) ) ( not ( = ?auto_63444 ?auto_63449 ) ) ( not ( = ?auto_63444 ?auto_63450 ) ) ( not ( = ?auto_63444 ?auto_63451 ) ) ( not ( = ?auto_63445 ?auto_63446 ) ) ( not ( = ?auto_63445 ?auto_63447 ) ) ( not ( = ?auto_63445 ?auto_63448 ) ) ( not ( = ?auto_63445 ?auto_63449 ) ) ( not ( = ?auto_63445 ?auto_63450 ) ) ( not ( = ?auto_63445 ?auto_63451 ) ) ( not ( = ?auto_63446 ?auto_63447 ) ) ( not ( = ?auto_63446 ?auto_63448 ) ) ( not ( = ?auto_63446 ?auto_63449 ) ) ( not ( = ?auto_63446 ?auto_63450 ) ) ( not ( = ?auto_63446 ?auto_63451 ) ) ( not ( = ?auto_63447 ?auto_63448 ) ) ( not ( = ?auto_63447 ?auto_63449 ) ) ( not ( = ?auto_63447 ?auto_63450 ) ) ( not ( = ?auto_63447 ?auto_63451 ) ) ( not ( = ?auto_63448 ?auto_63449 ) ) ( not ( = ?auto_63448 ?auto_63450 ) ) ( not ( = ?auto_63448 ?auto_63451 ) ) ( not ( = ?auto_63449 ?auto_63450 ) ) ( not ( = ?auto_63449 ?auto_63451 ) ) ( not ( = ?auto_63450 ?auto_63451 ) ) ( ON ?auto_63449 ?auto_63450 ) ( ON ?auto_63448 ?auto_63449 ) ( ON ?auto_63447 ?auto_63448 ) ( ON ?auto_63446 ?auto_63447 ) ( CLEAR ?auto_63444 ) ( ON ?auto_63445 ?auto_63446 ) ( CLEAR ?auto_63445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63442 ?auto_63443 ?auto_63444 ?auto_63445 )
      ( MAKE-9PILE ?auto_63442 ?auto_63443 ?auto_63444 ?auto_63445 ?auto_63446 ?auto_63447 ?auto_63448 ?auto_63449 ?auto_63450 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63461 - BLOCK
      ?auto_63462 - BLOCK
      ?auto_63463 - BLOCK
      ?auto_63464 - BLOCK
      ?auto_63465 - BLOCK
      ?auto_63466 - BLOCK
      ?auto_63467 - BLOCK
      ?auto_63468 - BLOCK
      ?auto_63469 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63469 ) ( ON-TABLE ?auto_63461 ) ( ON ?auto_63462 ?auto_63461 ) ( ON ?auto_63463 ?auto_63462 ) ( not ( = ?auto_63461 ?auto_63462 ) ) ( not ( = ?auto_63461 ?auto_63463 ) ) ( not ( = ?auto_63461 ?auto_63464 ) ) ( not ( = ?auto_63461 ?auto_63465 ) ) ( not ( = ?auto_63461 ?auto_63466 ) ) ( not ( = ?auto_63461 ?auto_63467 ) ) ( not ( = ?auto_63461 ?auto_63468 ) ) ( not ( = ?auto_63461 ?auto_63469 ) ) ( not ( = ?auto_63462 ?auto_63463 ) ) ( not ( = ?auto_63462 ?auto_63464 ) ) ( not ( = ?auto_63462 ?auto_63465 ) ) ( not ( = ?auto_63462 ?auto_63466 ) ) ( not ( = ?auto_63462 ?auto_63467 ) ) ( not ( = ?auto_63462 ?auto_63468 ) ) ( not ( = ?auto_63462 ?auto_63469 ) ) ( not ( = ?auto_63463 ?auto_63464 ) ) ( not ( = ?auto_63463 ?auto_63465 ) ) ( not ( = ?auto_63463 ?auto_63466 ) ) ( not ( = ?auto_63463 ?auto_63467 ) ) ( not ( = ?auto_63463 ?auto_63468 ) ) ( not ( = ?auto_63463 ?auto_63469 ) ) ( not ( = ?auto_63464 ?auto_63465 ) ) ( not ( = ?auto_63464 ?auto_63466 ) ) ( not ( = ?auto_63464 ?auto_63467 ) ) ( not ( = ?auto_63464 ?auto_63468 ) ) ( not ( = ?auto_63464 ?auto_63469 ) ) ( not ( = ?auto_63465 ?auto_63466 ) ) ( not ( = ?auto_63465 ?auto_63467 ) ) ( not ( = ?auto_63465 ?auto_63468 ) ) ( not ( = ?auto_63465 ?auto_63469 ) ) ( not ( = ?auto_63466 ?auto_63467 ) ) ( not ( = ?auto_63466 ?auto_63468 ) ) ( not ( = ?auto_63466 ?auto_63469 ) ) ( not ( = ?auto_63467 ?auto_63468 ) ) ( not ( = ?auto_63467 ?auto_63469 ) ) ( not ( = ?auto_63468 ?auto_63469 ) ) ( ON ?auto_63468 ?auto_63469 ) ( ON ?auto_63467 ?auto_63468 ) ( ON ?auto_63466 ?auto_63467 ) ( ON ?auto_63465 ?auto_63466 ) ( CLEAR ?auto_63463 ) ( ON ?auto_63464 ?auto_63465 ) ( CLEAR ?auto_63464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63461 ?auto_63462 ?auto_63463 ?auto_63464 )
      ( MAKE-9PILE ?auto_63461 ?auto_63462 ?auto_63463 ?auto_63464 ?auto_63465 ?auto_63466 ?auto_63467 ?auto_63468 ?auto_63469 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63479 - BLOCK
      ?auto_63480 - BLOCK
      ?auto_63481 - BLOCK
      ?auto_63482 - BLOCK
      ?auto_63483 - BLOCK
      ?auto_63484 - BLOCK
      ?auto_63485 - BLOCK
      ?auto_63486 - BLOCK
      ?auto_63487 - BLOCK
    )
    :vars
    (
      ?auto_63488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63487 ?auto_63488 ) ( ON-TABLE ?auto_63479 ) ( ON ?auto_63480 ?auto_63479 ) ( not ( = ?auto_63479 ?auto_63480 ) ) ( not ( = ?auto_63479 ?auto_63481 ) ) ( not ( = ?auto_63479 ?auto_63482 ) ) ( not ( = ?auto_63479 ?auto_63483 ) ) ( not ( = ?auto_63479 ?auto_63484 ) ) ( not ( = ?auto_63479 ?auto_63485 ) ) ( not ( = ?auto_63479 ?auto_63486 ) ) ( not ( = ?auto_63479 ?auto_63487 ) ) ( not ( = ?auto_63479 ?auto_63488 ) ) ( not ( = ?auto_63480 ?auto_63481 ) ) ( not ( = ?auto_63480 ?auto_63482 ) ) ( not ( = ?auto_63480 ?auto_63483 ) ) ( not ( = ?auto_63480 ?auto_63484 ) ) ( not ( = ?auto_63480 ?auto_63485 ) ) ( not ( = ?auto_63480 ?auto_63486 ) ) ( not ( = ?auto_63480 ?auto_63487 ) ) ( not ( = ?auto_63480 ?auto_63488 ) ) ( not ( = ?auto_63481 ?auto_63482 ) ) ( not ( = ?auto_63481 ?auto_63483 ) ) ( not ( = ?auto_63481 ?auto_63484 ) ) ( not ( = ?auto_63481 ?auto_63485 ) ) ( not ( = ?auto_63481 ?auto_63486 ) ) ( not ( = ?auto_63481 ?auto_63487 ) ) ( not ( = ?auto_63481 ?auto_63488 ) ) ( not ( = ?auto_63482 ?auto_63483 ) ) ( not ( = ?auto_63482 ?auto_63484 ) ) ( not ( = ?auto_63482 ?auto_63485 ) ) ( not ( = ?auto_63482 ?auto_63486 ) ) ( not ( = ?auto_63482 ?auto_63487 ) ) ( not ( = ?auto_63482 ?auto_63488 ) ) ( not ( = ?auto_63483 ?auto_63484 ) ) ( not ( = ?auto_63483 ?auto_63485 ) ) ( not ( = ?auto_63483 ?auto_63486 ) ) ( not ( = ?auto_63483 ?auto_63487 ) ) ( not ( = ?auto_63483 ?auto_63488 ) ) ( not ( = ?auto_63484 ?auto_63485 ) ) ( not ( = ?auto_63484 ?auto_63486 ) ) ( not ( = ?auto_63484 ?auto_63487 ) ) ( not ( = ?auto_63484 ?auto_63488 ) ) ( not ( = ?auto_63485 ?auto_63486 ) ) ( not ( = ?auto_63485 ?auto_63487 ) ) ( not ( = ?auto_63485 ?auto_63488 ) ) ( not ( = ?auto_63486 ?auto_63487 ) ) ( not ( = ?auto_63486 ?auto_63488 ) ) ( not ( = ?auto_63487 ?auto_63488 ) ) ( ON ?auto_63486 ?auto_63487 ) ( ON ?auto_63485 ?auto_63486 ) ( ON ?auto_63484 ?auto_63485 ) ( ON ?auto_63483 ?auto_63484 ) ( ON ?auto_63482 ?auto_63483 ) ( CLEAR ?auto_63480 ) ( ON ?auto_63481 ?auto_63482 ) ( CLEAR ?auto_63481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63479 ?auto_63480 ?auto_63481 )
      ( MAKE-9PILE ?auto_63479 ?auto_63480 ?auto_63481 ?auto_63482 ?auto_63483 ?auto_63484 ?auto_63485 ?auto_63486 ?auto_63487 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63498 - BLOCK
      ?auto_63499 - BLOCK
      ?auto_63500 - BLOCK
      ?auto_63501 - BLOCK
      ?auto_63502 - BLOCK
      ?auto_63503 - BLOCK
      ?auto_63504 - BLOCK
      ?auto_63505 - BLOCK
      ?auto_63506 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63506 ) ( ON-TABLE ?auto_63498 ) ( ON ?auto_63499 ?auto_63498 ) ( not ( = ?auto_63498 ?auto_63499 ) ) ( not ( = ?auto_63498 ?auto_63500 ) ) ( not ( = ?auto_63498 ?auto_63501 ) ) ( not ( = ?auto_63498 ?auto_63502 ) ) ( not ( = ?auto_63498 ?auto_63503 ) ) ( not ( = ?auto_63498 ?auto_63504 ) ) ( not ( = ?auto_63498 ?auto_63505 ) ) ( not ( = ?auto_63498 ?auto_63506 ) ) ( not ( = ?auto_63499 ?auto_63500 ) ) ( not ( = ?auto_63499 ?auto_63501 ) ) ( not ( = ?auto_63499 ?auto_63502 ) ) ( not ( = ?auto_63499 ?auto_63503 ) ) ( not ( = ?auto_63499 ?auto_63504 ) ) ( not ( = ?auto_63499 ?auto_63505 ) ) ( not ( = ?auto_63499 ?auto_63506 ) ) ( not ( = ?auto_63500 ?auto_63501 ) ) ( not ( = ?auto_63500 ?auto_63502 ) ) ( not ( = ?auto_63500 ?auto_63503 ) ) ( not ( = ?auto_63500 ?auto_63504 ) ) ( not ( = ?auto_63500 ?auto_63505 ) ) ( not ( = ?auto_63500 ?auto_63506 ) ) ( not ( = ?auto_63501 ?auto_63502 ) ) ( not ( = ?auto_63501 ?auto_63503 ) ) ( not ( = ?auto_63501 ?auto_63504 ) ) ( not ( = ?auto_63501 ?auto_63505 ) ) ( not ( = ?auto_63501 ?auto_63506 ) ) ( not ( = ?auto_63502 ?auto_63503 ) ) ( not ( = ?auto_63502 ?auto_63504 ) ) ( not ( = ?auto_63502 ?auto_63505 ) ) ( not ( = ?auto_63502 ?auto_63506 ) ) ( not ( = ?auto_63503 ?auto_63504 ) ) ( not ( = ?auto_63503 ?auto_63505 ) ) ( not ( = ?auto_63503 ?auto_63506 ) ) ( not ( = ?auto_63504 ?auto_63505 ) ) ( not ( = ?auto_63504 ?auto_63506 ) ) ( not ( = ?auto_63505 ?auto_63506 ) ) ( ON ?auto_63505 ?auto_63506 ) ( ON ?auto_63504 ?auto_63505 ) ( ON ?auto_63503 ?auto_63504 ) ( ON ?auto_63502 ?auto_63503 ) ( ON ?auto_63501 ?auto_63502 ) ( CLEAR ?auto_63499 ) ( ON ?auto_63500 ?auto_63501 ) ( CLEAR ?auto_63500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63498 ?auto_63499 ?auto_63500 )
      ( MAKE-9PILE ?auto_63498 ?auto_63499 ?auto_63500 ?auto_63501 ?auto_63502 ?auto_63503 ?auto_63504 ?auto_63505 ?auto_63506 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63516 - BLOCK
      ?auto_63517 - BLOCK
      ?auto_63518 - BLOCK
      ?auto_63519 - BLOCK
      ?auto_63520 - BLOCK
      ?auto_63521 - BLOCK
      ?auto_63522 - BLOCK
      ?auto_63523 - BLOCK
      ?auto_63524 - BLOCK
    )
    :vars
    (
      ?auto_63525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63524 ?auto_63525 ) ( ON-TABLE ?auto_63516 ) ( not ( = ?auto_63516 ?auto_63517 ) ) ( not ( = ?auto_63516 ?auto_63518 ) ) ( not ( = ?auto_63516 ?auto_63519 ) ) ( not ( = ?auto_63516 ?auto_63520 ) ) ( not ( = ?auto_63516 ?auto_63521 ) ) ( not ( = ?auto_63516 ?auto_63522 ) ) ( not ( = ?auto_63516 ?auto_63523 ) ) ( not ( = ?auto_63516 ?auto_63524 ) ) ( not ( = ?auto_63516 ?auto_63525 ) ) ( not ( = ?auto_63517 ?auto_63518 ) ) ( not ( = ?auto_63517 ?auto_63519 ) ) ( not ( = ?auto_63517 ?auto_63520 ) ) ( not ( = ?auto_63517 ?auto_63521 ) ) ( not ( = ?auto_63517 ?auto_63522 ) ) ( not ( = ?auto_63517 ?auto_63523 ) ) ( not ( = ?auto_63517 ?auto_63524 ) ) ( not ( = ?auto_63517 ?auto_63525 ) ) ( not ( = ?auto_63518 ?auto_63519 ) ) ( not ( = ?auto_63518 ?auto_63520 ) ) ( not ( = ?auto_63518 ?auto_63521 ) ) ( not ( = ?auto_63518 ?auto_63522 ) ) ( not ( = ?auto_63518 ?auto_63523 ) ) ( not ( = ?auto_63518 ?auto_63524 ) ) ( not ( = ?auto_63518 ?auto_63525 ) ) ( not ( = ?auto_63519 ?auto_63520 ) ) ( not ( = ?auto_63519 ?auto_63521 ) ) ( not ( = ?auto_63519 ?auto_63522 ) ) ( not ( = ?auto_63519 ?auto_63523 ) ) ( not ( = ?auto_63519 ?auto_63524 ) ) ( not ( = ?auto_63519 ?auto_63525 ) ) ( not ( = ?auto_63520 ?auto_63521 ) ) ( not ( = ?auto_63520 ?auto_63522 ) ) ( not ( = ?auto_63520 ?auto_63523 ) ) ( not ( = ?auto_63520 ?auto_63524 ) ) ( not ( = ?auto_63520 ?auto_63525 ) ) ( not ( = ?auto_63521 ?auto_63522 ) ) ( not ( = ?auto_63521 ?auto_63523 ) ) ( not ( = ?auto_63521 ?auto_63524 ) ) ( not ( = ?auto_63521 ?auto_63525 ) ) ( not ( = ?auto_63522 ?auto_63523 ) ) ( not ( = ?auto_63522 ?auto_63524 ) ) ( not ( = ?auto_63522 ?auto_63525 ) ) ( not ( = ?auto_63523 ?auto_63524 ) ) ( not ( = ?auto_63523 ?auto_63525 ) ) ( not ( = ?auto_63524 ?auto_63525 ) ) ( ON ?auto_63523 ?auto_63524 ) ( ON ?auto_63522 ?auto_63523 ) ( ON ?auto_63521 ?auto_63522 ) ( ON ?auto_63520 ?auto_63521 ) ( ON ?auto_63519 ?auto_63520 ) ( ON ?auto_63518 ?auto_63519 ) ( CLEAR ?auto_63516 ) ( ON ?auto_63517 ?auto_63518 ) ( CLEAR ?auto_63517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63516 ?auto_63517 )
      ( MAKE-9PILE ?auto_63516 ?auto_63517 ?auto_63518 ?auto_63519 ?auto_63520 ?auto_63521 ?auto_63522 ?auto_63523 ?auto_63524 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63535 - BLOCK
      ?auto_63536 - BLOCK
      ?auto_63537 - BLOCK
      ?auto_63538 - BLOCK
      ?auto_63539 - BLOCK
      ?auto_63540 - BLOCK
      ?auto_63541 - BLOCK
      ?auto_63542 - BLOCK
      ?auto_63543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63543 ) ( ON-TABLE ?auto_63535 ) ( not ( = ?auto_63535 ?auto_63536 ) ) ( not ( = ?auto_63535 ?auto_63537 ) ) ( not ( = ?auto_63535 ?auto_63538 ) ) ( not ( = ?auto_63535 ?auto_63539 ) ) ( not ( = ?auto_63535 ?auto_63540 ) ) ( not ( = ?auto_63535 ?auto_63541 ) ) ( not ( = ?auto_63535 ?auto_63542 ) ) ( not ( = ?auto_63535 ?auto_63543 ) ) ( not ( = ?auto_63536 ?auto_63537 ) ) ( not ( = ?auto_63536 ?auto_63538 ) ) ( not ( = ?auto_63536 ?auto_63539 ) ) ( not ( = ?auto_63536 ?auto_63540 ) ) ( not ( = ?auto_63536 ?auto_63541 ) ) ( not ( = ?auto_63536 ?auto_63542 ) ) ( not ( = ?auto_63536 ?auto_63543 ) ) ( not ( = ?auto_63537 ?auto_63538 ) ) ( not ( = ?auto_63537 ?auto_63539 ) ) ( not ( = ?auto_63537 ?auto_63540 ) ) ( not ( = ?auto_63537 ?auto_63541 ) ) ( not ( = ?auto_63537 ?auto_63542 ) ) ( not ( = ?auto_63537 ?auto_63543 ) ) ( not ( = ?auto_63538 ?auto_63539 ) ) ( not ( = ?auto_63538 ?auto_63540 ) ) ( not ( = ?auto_63538 ?auto_63541 ) ) ( not ( = ?auto_63538 ?auto_63542 ) ) ( not ( = ?auto_63538 ?auto_63543 ) ) ( not ( = ?auto_63539 ?auto_63540 ) ) ( not ( = ?auto_63539 ?auto_63541 ) ) ( not ( = ?auto_63539 ?auto_63542 ) ) ( not ( = ?auto_63539 ?auto_63543 ) ) ( not ( = ?auto_63540 ?auto_63541 ) ) ( not ( = ?auto_63540 ?auto_63542 ) ) ( not ( = ?auto_63540 ?auto_63543 ) ) ( not ( = ?auto_63541 ?auto_63542 ) ) ( not ( = ?auto_63541 ?auto_63543 ) ) ( not ( = ?auto_63542 ?auto_63543 ) ) ( ON ?auto_63542 ?auto_63543 ) ( ON ?auto_63541 ?auto_63542 ) ( ON ?auto_63540 ?auto_63541 ) ( ON ?auto_63539 ?auto_63540 ) ( ON ?auto_63538 ?auto_63539 ) ( ON ?auto_63537 ?auto_63538 ) ( CLEAR ?auto_63535 ) ( ON ?auto_63536 ?auto_63537 ) ( CLEAR ?auto_63536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63535 ?auto_63536 )
      ( MAKE-9PILE ?auto_63535 ?auto_63536 ?auto_63537 ?auto_63538 ?auto_63539 ?auto_63540 ?auto_63541 ?auto_63542 ?auto_63543 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63553 - BLOCK
      ?auto_63554 - BLOCK
      ?auto_63555 - BLOCK
      ?auto_63556 - BLOCK
      ?auto_63557 - BLOCK
      ?auto_63558 - BLOCK
      ?auto_63559 - BLOCK
      ?auto_63560 - BLOCK
      ?auto_63561 - BLOCK
    )
    :vars
    (
      ?auto_63562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63561 ?auto_63562 ) ( not ( = ?auto_63553 ?auto_63554 ) ) ( not ( = ?auto_63553 ?auto_63555 ) ) ( not ( = ?auto_63553 ?auto_63556 ) ) ( not ( = ?auto_63553 ?auto_63557 ) ) ( not ( = ?auto_63553 ?auto_63558 ) ) ( not ( = ?auto_63553 ?auto_63559 ) ) ( not ( = ?auto_63553 ?auto_63560 ) ) ( not ( = ?auto_63553 ?auto_63561 ) ) ( not ( = ?auto_63553 ?auto_63562 ) ) ( not ( = ?auto_63554 ?auto_63555 ) ) ( not ( = ?auto_63554 ?auto_63556 ) ) ( not ( = ?auto_63554 ?auto_63557 ) ) ( not ( = ?auto_63554 ?auto_63558 ) ) ( not ( = ?auto_63554 ?auto_63559 ) ) ( not ( = ?auto_63554 ?auto_63560 ) ) ( not ( = ?auto_63554 ?auto_63561 ) ) ( not ( = ?auto_63554 ?auto_63562 ) ) ( not ( = ?auto_63555 ?auto_63556 ) ) ( not ( = ?auto_63555 ?auto_63557 ) ) ( not ( = ?auto_63555 ?auto_63558 ) ) ( not ( = ?auto_63555 ?auto_63559 ) ) ( not ( = ?auto_63555 ?auto_63560 ) ) ( not ( = ?auto_63555 ?auto_63561 ) ) ( not ( = ?auto_63555 ?auto_63562 ) ) ( not ( = ?auto_63556 ?auto_63557 ) ) ( not ( = ?auto_63556 ?auto_63558 ) ) ( not ( = ?auto_63556 ?auto_63559 ) ) ( not ( = ?auto_63556 ?auto_63560 ) ) ( not ( = ?auto_63556 ?auto_63561 ) ) ( not ( = ?auto_63556 ?auto_63562 ) ) ( not ( = ?auto_63557 ?auto_63558 ) ) ( not ( = ?auto_63557 ?auto_63559 ) ) ( not ( = ?auto_63557 ?auto_63560 ) ) ( not ( = ?auto_63557 ?auto_63561 ) ) ( not ( = ?auto_63557 ?auto_63562 ) ) ( not ( = ?auto_63558 ?auto_63559 ) ) ( not ( = ?auto_63558 ?auto_63560 ) ) ( not ( = ?auto_63558 ?auto_63561 ) ) ( not ( = ?auto_63558 ?auto_63562 ) ) ( not ( = ?auto_63559 ?auto_63560 ) ) ( not ( = ?auto_63559 ?auto_63561 ) ) ( not ( = ?auto_63559 ?auto_63562 ) ) ( not ( = ?auto_63560 ?auto_63561 ) ) ( not ( = ?auto_63560 ?auto_63562 ) ) ( not ( = ?auto_63561 ?auto_63562 ) ) ( ON ?auto_63560 ?auto_63561 ) ( ON ?auto_63559 ?auto_63560 ) ( ON ?auto_63558 ?auto_63559 ) ( ON ?auto_63557 ?auto_63558 ) ( ON ?auto_63556 ?auto_63557 ) ( ON ?auto_63555 ?auto_63556 ) ( ON ?auto_63554 ?auto_63555 ) ( ON ?auto_63553 ?auto_63554 ) ( CLEAR ?auto_63553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63553 )
      ( MAKE-9PILE ?auto_63553 ?auto_63554 ?auto_63555 ?auto_63556 ?auto_63557 ?auto_63558 ?auto_63559 ?auto_63560 ?auto_63561 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63572 - BLOCK
      ?auto_63573 - BLOCK
      ?auto_63574 - BLOCK
      ?auto_63575 - BLOCK
      ?auto_63576 - BLOCK
      ?auto_63577 - BLOCK
      ?auto_63578 - BLOCK
      ?auto_63579 - BLOCK
      ?auto_63580 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63580 ) ( not ( = ?auto_63572 ?auto_63573 ) ) ( not ( = ?auto_63572 ?auto_63574 ) ) ( not ( = ?auto_63572 ?auto_63575 ) ) ( not ( = ?auto_63572 ?auto_63576 ) ) ( not ( = ?auto_63572 ?auto_63577 ) ) ( not ( = ?auto_63572 ?auto_63578 ) ) ( not ( = ?auto_63572 ?auto_63579 ) ) ( not ( = ?auto_63572 ?auto_63580 ) ) ( not ( = ?auto_63573 ?auto_63574 ) ) ( not ( = ?auto_63573 ?auto_63575 ) ) ( not ( = ?auto_63573 ?auto_63576 ) ) ( not ( = ?auto_63573 ?auto_63577 ) ) ( not ( = ?auto_63573 ?auto_63578 ) ) ( not ( = ?auto_63573 ?auto_63579 ) ) ( not ( = ?auto_63573 ?auto_63580 ) ) ( not ( = ?auto_63574 ?auto_63575 ) ) ( not ( = ?auto_63574 ?auto_63576 ) ) ( not ( = ?auto_63574 ?auto_63577 ) ) ( not ( = ?auto_63574 ?auto_63578 ) ) ( not ( = ?auto_63574 ?auto_63579 ) ) ( not ( = ?auto_63574 ?auto_63580 ) ) ( not ( = ?auto_63575 ?auto_63576 ) ) ( not ( = ?auto_63575 ?auto_63577 ) ) ( not ( = ?auto_63575 ?auto_63578 ) ) ( not ( = ?auto_63575 ?auto_63579 ) ) ( not ( = ?auto_63575 ?auto_63580 ) ) ( not ( = ?auto_63576 ?auto_63577 ) ) ( not ( = ?auto_63576 ?auto_63578 ) ) ( not ( = ?auto_63576 ?auto_63579 ) ) ( not ( = ?auto_63576 ?auto_63580 ) ) ( not ( = ?auto_63577 ?auto_63578 ) ) ( not ( = ?auto_63577 ?auto_63579 ) ) ( not ( = ?auto_63577 ?auto_63580 ) ) ( not ( = ?auto_63578 ?auto_63579 ) ) ( not ( = ?auto_63578 ?auto_63580 ) ) ( not ( = ?auto_63579 ?auto_63580 ) ) ( ON ?auto_63579 ?auto_63580 ) ( ON ?auto_63578 ?auto_63579 ) ( ON ?auto_63577 ?auto_63578 ) ( ON ?auto_63576 ?auto_63577 ) ( ON ?auto_63575 ?auto_63576 ) ( ON ?auto_63574 ?auto_63575 ) ( ON ?auto_63573 ?auto_63574 ) ( ON ?auto_63572 ?auto_63573 ) ( CLEAR ?auto_63572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63572 )
      ( MAKE-9PILE ?auto_63572 ?auto_63573 ?auto_63574 ?auto_63575 ?auto_63576 ?auto_63577 ?auto_63578 ?auto_63579 ?auto_63580 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_63590 - BLOCK
      ?auto_63591 - BLOCK
      ?auto_63592 - BLOCK
      ?auto_63593 - BLOCK
      ?auto_63594 - BLOCK
      ?auto_63595 - BLOCK
      ?auto_63596 - BLOCK
      ?auto_63597 - BLOCK
      ?auto_63598 - BLOCK
    )
    :vars
    (
      ?auto_63599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63590 ?auto_63591 ) ) ( not ( = ?auto_63590 ?auto_63592 ) ) ( not ( = ?auto_63590 ?auto_63593 ) ) ( not ( = ?auto_63590 ?auto_63594 ) ) ( not ( = ?auto_63590 ?auto_63595 ) ) ( not ( = ?auto_63590 ?auto_63596 ) ) ( not ( = ?auto_63590 ?auto_63597 ) ) ( not ( = ?auto_63590 ?auto_63598 ) ) ( not ( = ?auto_63591 ?auto_63592 ) ) ( not ( = ?auto_63591 ?auto_63593 ) ) ( not ( = ?auto_63591 ?auto_63594 ) ) ( not ( = ?auto_63591 ?auto_63595 ) ) ( not ( = ?auto_63591 ?auto_63596 ) ) ( not ( = ?auto_63591 ?auto_63597 ) ) ( not ( = ?auto_63591 ?auto_63598 ) ) ( not ( = ?auto_63592 ?auto_63593 ) ) ( not ( = ?auto_63592 ?auto_63594 ) ) ( not ( = ?auto_63592 ?auto_63595 ) ) ( not ( = ?auto_63592 ?auto_63596 ) ) ( not ( = ?auto_63592 ?auto_63597 ) ) ( not ( = ?auto_63592 ?auto_63598 ) ) ( not ( = ?auto_63593 ?auto_63594 ) ) ( not ( = ?auto_63593 ?auto_63595 ) ) ( not ( = ?auto_63593 ?auto_63596 ) ) ( not ( = ?auto_63593 ?auto_63597 ) ) ( not ( = ?auto_63593 ?auto_63598 ) ) ( not ( = ?auto_63594 ?auto_63595 ) ) ( not ( = ?auto_63594 ?auto_63596 ) ) ( not ( = ?auto_63594 ?auto_63597 ) ) ( not ( = ?auto_63594 ?auto_63598 ) ) ( not ( = ?auto_63595 ?auto_63596 ) ) ( not ( = ?auto_63595 ?auto_63597 ) ) ( not ( = ?auto_63595 ?auto_63598 ) ) ( not ( = ?auto_63596 ?auto_63597 ) ) ( not ( = ?auto_63596 ?auto_63598 ) ) ( not ( = ?auto_63597 ?auto_63598 ) ) ( ON ?auto_63590 ?auto_63599 ) ( not ( = ?auto_63598 ?auto_63599 ) ) ( not ( = ?auto_63597 ?auto_63599 ) ) ( not ( = ?auto_63596 ?auto_63599 ) ) ( not ( = ?auto_63595 ?auto_63599 ) ) ( not ( = ?auto_63594 ?auto_63599 ) ) ( not ( = ?auto_63593 ?auto_63599 ) ) ( not ( = ?auto_63592 ?auto_63599 ) ) ( not ( = ?auto_63591 ?auto_63599 ) ) ( not ( = ?auto_63590 ?auto_63599 ) ) ( ON ?auto_63591 ?auto_63590 ) ( ON ?auto_63592 ?auto_63591 ) ( ON ?auto_63593 ?auto_63592 ) ( ON ?auto_63594 ?auto_63593 ) ( ON ?auto_63595 ?auto_63594 ) ( ON ?auto_63596 ?auto_63595 ) ( ON ?auto_63597 ?auto_63596 ) ( ON ?auto_63598 ?auto_63597 ) ( CLEAR ?auto_63598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_63598 ?auto_63597 ?auto_63596 ?auto_63595 ?auto_63594 ?auto_63593 ?auto_63592 ?auto_63591 ?auto_63590 )
      ( MAKE-9PILE ?auto_63590 ?auto_63591 ?auto_63592 ?auto_63593 ?auto_63594 ?auto_63595 ?auto_63596 ?auto_63597 ?auto_63598 ) )
  )

)

