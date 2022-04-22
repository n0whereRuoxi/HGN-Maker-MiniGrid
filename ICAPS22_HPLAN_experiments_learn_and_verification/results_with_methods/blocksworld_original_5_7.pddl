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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25429 - BLOCK
      ?auto_25430 - BLOCK
      ?auto_25431 - BLOCK
      ?auto_25432 - BLOCK
      ?auto_25433 - BLOCK
    )
    :vars
    (
      ?auto_25434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25434 ?auto_25433 ) ( CLEAR ?auto_25434 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25429 ) ( ON ?auto_25430 ?auto_25429 ) ( ON ?auto_25431 ?auto_25430 ) ( ON ?auto_25432 ?auto_25431 ) ( ON ?auto_25433 ?auto_25432 ) ( not ( = ?auto_25429 ?auto_25430 ) ) ( not ( = ?auto_25429 ?auto_25431 ) ) ( not ( = ?auto_25429 ?auto_25432 ) ) ( not ( = ?auto_25429 ?auto_25433 ) ) ( not ( = ?auto_25429 ?auto_25434 ) ) ( not ( = ?auto_25430 ?auto_25431 ) ) ( not ( = ?auto_25430 ?auto_25432 ) ) ( not ( = ?auto_25430 ?auto_25433 ) ) ( not ( = ?auto_25430 ?auto_25434 ) ) ( not ( = ?auto_25431 ?auto_25432 ) ) ( not ( = ?auto_25431 ?auto_25433 ) ) ( not ( = ?auto_25431 ?auto_25434 ) ) ( not ( = ?auto_25432 ?auto_25433 ) ) ( not ( = ?auto_25432 ?auto_25434 ) ) ( not ( = ?auto_25433 ?auto_25434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25434 ?auto_25433 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25436 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_25436 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_25436 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25437 - BLOCK
    )
    :vars
    (
      ?auto_25438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25437 ?auto_25438 ) ( CLEAR ?auto_25437 ) ( HAND-EMPTY ) ( not ( = ?auto_25437 ?auto_25438 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25437 ?auto_25438 )
      ( MAKE-1PILE ?auto_25437 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25443 - BLOCK
      ?auto_25444 - BLOCK
      ?auto_25445 - BLOCK
      ?auto_25446 - BLOCK
    )
    :vars
    (
      ?auto_25447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25447 ?auto_25446 ) ( CLEAR ?auto_25447 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25443 ) ( ON ?auto_25444 ?auto_25443 ) ( ON ?auto_25445 ?auto_25444 ) ( ON ?auto_25446 ?auto_25445 ) ( not ( = ?auto_25443 ?auto_25444 ) ) ( not ( = ?auto_25443 ?auto_25445 ) ) ( not ( = ?auto_25443 ?auto_25446 ) ) ( not ( = ?auto_25443 ?auto_25447 ) ) ( not ( = ?auto_25444 ?auto_25445 ) ) ( not ( = ?auto_25444 ?auto_25446 ) ) ( not ( = ?auto_25444 ?auto_25447 ) ) ( not ( = ?auto_25445 ?auto_25446 ) ) ( not ( = ?auto_25445 ?auto_25447 ) ) ( not ( = ?auto_25446 ?auto_25447 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25447 ?auto_25446 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25448 - BLOCK
      ?auto_25449 - BLOCK
      ?auto_25450 - BLOCK
      ?auto_25451 - BLOCK
    )
    :vars
    (
      ?auto_25452 - BLOCK
      ?auto_25453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25452 ?auto_25451 ) ( CLEAR ?auto_25452 ) ( ON-TABLE ?auto_25448 ) ( ON ?auto_25449 ?auto_25448 ) ( ON ?auto_25450 ?auto_25449 ) ( ON ?auto_25451 ?auto_25450 ) ( not ( = ?auto_25448 ?auto_25449 ) ) ( not ( = ?auto_25448 ?auto_25450 ) ) ( not ( = ?auto_25448 ?auto_25451 ) ) ( not ( = ?auto_25448 ?auto_25452 ) ) ( not ( = ?auto_25449 ?auto_25450 ) ) ( not ( = ?auto_25449 ?auto_25451 ) ) ( not ( = ?auto_25449 ?auto_25452 ) ) ( not ( = ?auto_25450 ?auto_25451 ) ) ( not ( = ?auto_25450 ?auto_25452 ) ) ( not ( = ?auto_25451 ?auto_25452 ) ) ( HOLDING ?auto_25453 ) ( not ( = ?auto_25448 ?auto_25453 ) ) ( not ( = ?auto_25449 ?auto_25453 ) ) ( not ( = ?auto_25450 ?auto_25453 ) ) ( not ( = ?auto_25451 ?auto_25453 ) ) ( not ( = ?auto_25452 ?auto_25453 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_25453 )
      ( MAKE-4PILE ?auto_25448 ?auto_25449 ?auto_25450 ?auto_25451 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25454 - BLOCK
      ?auto_25455 - BLOCK
      ?auto_25456 - BLOCK
      ?auto_25457 - BLOCK
    )
    :vars
    (
      ?auto_25458 - BLOCK
      ?auto_25459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25458 ?auto_25457 ) ( ON-TABLE ?auto_25454 ) ( ON ?auto_25455 ?auto_25454 ) ( ON ?auto_25456 ?auto_25455 ) ( ON ?auto_25457 ?auto_25456 ) ( not ( = ?auto_25454 ?auto_25455 ) ) ( not ( = ?auto_25454 ?auto_25456 ) ) ( not ( = ?auto_25454 ?auto_25457 ) ) ( not ( = ?auto_25454 ?auto_25458 ) ) ( not ( = ?auto_25455 ?auto_25456 ) ) ( not ( = ?auto_25455 ?auto_25457 ) ) ( not ( = ?auto_25455 ?auto_25458 ) ) ( not ( = ?auto_25456 ?auto_25457 ) ) ( not ( = ?auto_25456 ?auto_25458 ) ) ( not ( = ?auto_25457 ?auto_25458 ) ) ( not ( = ?auto_25454 ?auto_25459 ) ) ( not ( = ?auto_25455 ?auto_25459 ) ) ( not ( = ?auto_25456 ?auto_25459 ) ) ( not ( = ?auto_25457 ?auto_25459 ) ) ( not ( = ?auto_25458 ?auto_25459 ) ) ( ON ?auto_25459 ?auto_25458 ) ( CLEAR ?auto_25459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25454 ?auto_25455 ?auto_25456 ?auto_25457 ?auto_25458 )
      ( MAKE-4PILE ?auto_25454 ?auto_25455 ?auto_25456 ?auto_25457 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25462 - BLOCK
      ?auto_25463 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_25463 ) ( CLEAR ?auto_25462 ) ( ON-TABLE ?auto_25462 ) ( not ( = ?auto_25462 ?auto_25463 ) ) )
    :subtasks
    ( ( !STACK ?auto_25463 ?auto_25462 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25464 - BLOCK
      ?auto_25465 - BLOCK
    )
    :vars
    (
      ?auto_25466 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25464 ) ( ON-TABLE ?auto_25464 ) ( not ( = ?auto_25464 ?auto_25465 ) ) ( ON ?auto_25465 ?auto_25466 ) ( CLEAR ?auto_25465 ) ( HAND-EMPTY ) ( not ( = ?auto_25464 ?auto_25466 ) ) ( not ( = ?auto_25465 ?auto_25466 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25465 ?auto_25466 )
      ( MAKE-2PILE ?auto_25464 ?auto_25465 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25467 - BLOCK
      ?auto_25468 - BLOCK
    )
    :vars
    (
      ?auto_25469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25467 ?auto_25468 ) ) ( ON ?auto_25468 ?auto_25469 ) ( CLEAR ?auto_25468 ) ( not ( = ?auto_25467 ?auto_25469 ) ) ( not ( = ?auto_25468 ?auto_25469 ) ) ( HOLDING ?auto_25467 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25467 )
      ( MAKE-2PILE ?auto_25467 ?auto_25468 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25470 - BLOCK
      ?auto_25471 - BLOCK
    )
    :vars
    (
      ?auto_25472 - BLOCK
      ?auto_25473 - BLOCK
      ?auto_25475 - BLOCK
      ?auto_25474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25470 ?auto_25471 ) ) ( ON ?auto_25471 ?auto_25472 ) ( not ( = ?auto_25470 ?auto_25472 ) ) ( not ( = ?auto_25471 ?auto_25472 ) ) ( ON ?auto_25470 ?auto_25471 ) ( CLEAR ?auto_25470 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25473 ) ( ON ?auto_25475 ?auto_25473 ) ( ON ?auto_25474 ?auto_25475 ) ( ON ?auto_25472 ?auto_25474 ) ( not ( = ?auto_25473 ?auto_25475 ) ) ( not ( = ?auto_25473 ?auto_25474 ) ) ( not ( = ?auto_25473 ?auto_25472 ) ) ( not ( = ?auto_25473 ?auto_25471 ) ) ( not ( = ?auto_25473 ?auto_25470 ) ) ( not ( = ?auto_25475 ?auto_25474 ) ) ( not ( = ?auto_25475 ?auto_25472 ) ) ( not ( = ?auto_25475 ?auto_25471 ) ) ( not ( = ?auto_25475 ?auto_25470 ) ) ( not ( = ?auto_25474 ?auto_25472 ) ) ( not ( = ?auto_25474 ?auto_25471 ) ) ( not ( = ?auto_25474 ?auto_25470 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25473 ?auto_25475 ?auto_25474 ?auto_25472 ?auto_25471 )
      ( MAKE-2PILE ?auto_25470 ?auto_25471 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25479 - BLOCK
      ?auto_25480 - BLOCK
      ?auto_25481 - BLOCK
    )
    :vars
    (
      ?auto_25482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25482 ?auto_25481 ) ( CLEAR ?auto_25482 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25479 ) ( ON ?auto_25480 ?auto_25479 ) ( ON ?auto_25481 ?auto_25480 ) ( not ( = ?auto_25479 ?auto_25480 ) ) ( not ( = ?auto_25479 ?auto_25481 ) ) ( not ( = ?auto_25479 ?auto_25482 ) ) ( not ( = ?auto_25480 ?auto_25481 ) ) ( not ( = ?auto_25480 ?auto_25482 ) ) ( not ( = ?auto_25481 ?auto_25482 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25482 ?auto_25481 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25483 - BLOCK
      ?auto_25484 - BLOCK
      ?auto_25485 - BLOCK
    )
    :vars
    (
      ?auto_25486 - BLOCK
      ?auto_25487 - BLOCK
      ?auto_25488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25486 ?auto_25485 ) ( CLEAR ?auto_25486 ) ( ON-TABLE ?auto_25483 ) ( ON ?auto_25484 ?auto_25483 ) ( ON ?auto_25485 ?auto_25484 ) ( not ( = ?auto_25483 ?auto_25484 ) ) ( not ( = ?auto_25483 ?auto_25485 ) ) ( not ( = ?auto_25483 ?auto_25486 ) ) ( not ( = ?auto_25484 ?auto_25485 ) ) ( not ( = ?auto_25484 ?auto_25486 ) ) ( not ( = ?auto_25485 ?auto_25486 ) ) ( HOLDING ?auto_25487 ) ( CLEAR ?auto_25488 ) ( not ( = ?auto_25483 ?auto_25487 ) ) ( not ( = ?auto_25483 ?auto_25488 ) ) ( not ( = ?auto_25484 ?auto_25487 ) ) ( not ( = ?auto_25484 ?auto_25488 ) ) ( not ( = ?auto_25485 ?auto_25487 ) ) ( not ( = ?auto_25485 ?auto_25488 ) ) ( not ( = ?auto_25486 ?auto_25487 ) ) ( not ( = ?auto_25486 ?auto_25488 ) ) ( not ( = ?auto_25487 ?auto_25488 ) ) )
    :subtasks
    ( ( !STACK ?auto_25487 ?auto_25488 )
      ( MAKE-3PILE ?auto_25483 ?auto_25484 ?auto_25485 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25489 - BLOCK
      ?auto_25490 - BLOCK
      ?auto_25491 - BLOCK
    )
    :vars
    (
      ?auto_25494 - BLOCK
      ?auto_25492 - BLOCK
      ?auto_25493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25494 ?auto_25491 ) ( ON-TABLE ?auto_25489 ) ( ON ?auto_25490 ?auto_25489 ) ( ON ?auto_25491 ?auto_25490 ) ( not ( = ?auto_25489 ?auto_25490 ) ) ( not ( = ?auto_25489 ?auto_25491 ) ) ( not ( = ?auto_25489 ?auto_25494 ) ) ( not ( = ?auto_25490 ?auto_25491 ) ) ( not ( = ?auto_25490 ?auto_25494 ) ) ( not ( = ?auto_25491 ?auto_25494 ) ) ( CLEAR ?auto_25492 ) ( not ( = ?auto_25489 ?auto_25493 ) ) ( not ( = ?auto_25489 ?auto_25492 ) ) ( not ( = ?auto_25490 ?auto_25493 ) ) ( not ( = ?auto_25490 ?auto_25492 ) ) ( not ( = ?auto_25491 ?auto_25493 ) ) ( not ( = ?auto_25491 ?auto_25492 ) ) ( not ( = ?auto_25494 ?auto_25493 ) ) ( not ( = ?auto_25494 ?auto_25492 ) ) ( not ( = ?auto_25493 ?auto_25492 ) ) ( ON ?auto_25493 ?auto_25494 ) ( CLEAR ?auto_25493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25489 ?auto_25490 ?auto_25491 ?auto_25494 )
      ( MAKE-3PILE ?auto_25489 ?auto_25490 ?auto_25491 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25495 - BLOCK
      ?auto_25496 - BLOCK
      ?auto_25497 - BLOCK
    )
    :vars
    (
      ?auto_25499 - BLOCK
      ?auto_25498 - BLOCK
      ?auto_25500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25499 ?auto_25497 ) ( ON-TABLE ?auto_25495 ) ( ON ?auto_25496 ?auto_25495 ) ( ON ?auto_25497 ?auto_25496 ) ( not ( = ?auto_25495 ?auto_25496 ) ) ( not ( = ?auto_25495 ?auto_25497 ) ) ( not ( = ?auto_25495 ?auto_25499 ) ) ( not ( = ?auto_25496 ?auto_25497 ) ) ( not ( = ?auto_25496 ?auto_25499 ) ) ( not ( = ?auto_25497 ?auto_25499 ) ) ( not ( = ?auto_25495 ?auto_25498 ) ) ( not ( = ?auto_25495 ?auto_25500 ) ) ( not ( = ?auto_25496 ?auto_25498 ) ) ( not ( = ?auto_25496 ?auto_25500 ) ) ( not ( = ?auto_25497 ?auto_25498 ) ) ( not ( = ?auto_25497 ?auto_25500 ) ) ( not ( = ?auto_25499 ?auto_25498 ) ) ( not ( = ?auto_25499 ?auto_25500 ) ) ( not ( = ?auto_25498 ?auto_25500 ) ) ( ON ?auto_25498 ?auto_25499 ) ( CLEAR ?auto_25498 ) ( HOLDING ?auto_25500 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25500 )
      ( MAKE-3PILE ?auto_25495 ?auto_25496 ?auto_25497 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25501 - BLOCK
      ?auto_25502 - BLOCK
      ?auto_25503 - BLOCK
    )
    :vars
    (
      ?auto_25505 - BLOCK
      ?auto_25504 - BLOCK
      ?auto_25506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25505 ?auto_25503 ) ( ON-TABLE ?auto_25501 ) ( ON ?auto_25502 ?auto_25501 ) ( ON ?auto_25503 ?auto_25502 ) ( not ( = ?auto_25501 ?auto_25502 ) ) ( not ( = ?auto_25501 ?auto_25503 ) ) ( not ( = ?auto_25501 ?auto_25505 ) ) ( not ( = ?auto_25502 ?auto_25503 ) ) ( not ( = ?auto_25502 ?auto_25505 ) ) ( not ( = ?auto_25503 ?auto_25505 ) ) ( not ( = ?auto_25501 ?auto_25504 ) ) ( not ( = ?auto_25501 ?auto_25506 ) ) ( not ( = ?auto_25502 ?auto_25504 ) ) ( not ( = ?auto_25502 ?auto_25506 ) ) ( not ( = ?auto_25503 ?auto_25504 ) ) ( not ( = ?auto_25503 ?auto_25506 ) ) ( not ( = ?auto_25505 ?auto_25504 ) ) ( not ( = ?auto_25505 ?auto_25506 ) ) ( not ( = ?auto_25504 ?auto_25506 ) ) ( ON ?auto_25504 ?auto_25505 ) ( ON ?auto_25506 ?auto_25504 ) ( CLEAR ?auto_25506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25501 ?auto_25502 ?auto_25503 ?auto_25505 ?auto_25504 )
      ( MAKE-3PILE ?auto_25501 ?auto_25502 ?auto_25503 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25510 - BLOCK
      ?auto_25511 - BLOCK
      ?auto_25512 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_25512 ) ( CLEAR ?auto_25511 ) ( ON-TABLE ?auto_25510 ) ( ON ?auto_25511 ?auto_25510 ) ( not ( = ?auto_25510 ?auto_25511 ) ) ( not ( = ?auto_25510 ?auto_25512 ) ) ( not ( = ?auto_25511 ?auto_25512 ) ) )
    :subtasks
    ( ( !STACK ?auto_25512 ?auto_25511 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25513 - BLOCK
      ?auto_25514 - BLOCK
      ?auto_25515 - BLOCK
    )
    :vars
    (
      ?auto_25516 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25514 ) ( ON-TABLE ?auto_25513 ) ( ON ?auto_25514 ?auto_25513 ) ( not ( = ?auto_25513 ?auto_25514 ) ) ( not ( = ?auto_25513 ?auto_25515 ) ) ( not ( = ?auto_25514 ?auto_25515 ) ) ( ON ?auto_25515 ?auto_25516 ) ( CLEAR ?auto_25515 ) ( HAND-EMPTY ) ( not ( = ?auto_25513 ?auto_25516 ) ) ( not ( = ?auto_25514 ?auto_25516 ) ) ( not ( = ?auto_25515 ?auto_25516 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25515 ?auto_25516 )
      ( MAKE-3PILE ?auto_25513 ?auto_25514 ?auto_25515 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25517 - BLOCK
      ?auto_25518 - BLOCK
      ?auto_25519 - BLOCK
    )
    :vars
    (
      ?auto_25520 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25517 ) ( not ( = ?auto_25517 ?auto_25518 ) ) ( not ( = ?auto_25517 ?auto_25519 ) ) ( not ( = ?auto_25518 ?auto_25519 ) ) ( ON ?auto_25519 ?auto_25520 ) ( CLEAR ?auto_25519 ) ( not ( = ?auto_25517 ?auto_25520 ) ) ( not ( = ?auto_25518 ?auto_25520 ) ) ( not ( = ?auto_25519 ?auto_25520 ) ) ( HOLDING ?auto_25518 ) ( CLEAR ?auto_25517 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25517 ?auto_25518 )
      ( MAKE-3PILE ?auto_25517 ?auto_25518 ?auto_25519 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25521 - BLOCK
      ?auto_25522 - BLOCK
      ?auto_25523 - BLOCK
    )
    :vars
    (
      ?auto_25524 - BLOCK
      ?auto_25525 - BLOCK
      ?auto_25526 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25521 ) ( not ( = ?auto_25521 ?auto_25522 ) ) ( not ( = ?auto_25521 ?auto_25523 ) ) ( not ( = ?auto_25522 ?auto_25523 ) ) ( ON ?auto_25523 ?auto_25524 ) ( not ( = ?auto_25521 ?auto_25524 ) ) ( not ( = ?auto_25522 ?auto_25524 ) ) ( not ( = ?auto_25523 ?auto_25524 ) ) ( CLEAR ?auto_25521 ) ( ON ?auto_25522 ?auto_25523 ) ( CLEAR ?auto_25522 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25525 ) ( ON ?auto_25526 ?auto_25525 ) ( ON ?auto_25524 ?auto_25526 ) ( not ( = ?auto_25525 ?auto_25526 ) ) ( not ( = ?auto_25525 ?auto_25524 ) ) ( not ( = ?auto_25525 ?auto_25523 ) ) ( not ( = ?auto_25525 ?auto_25522 ) ) ( not ( = ?auto_25526 ?auto_25524 ) ) ( not ( = ?auto_25526 ?auto_25523 ) ) ( not ( = ?auto_25526 ?auto_25522 ) ) ( not ( = ?auto_25521 ?auto_25525 ) ) ( not ( = ?auto_25521 ?auto_25526 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25525 ?auto_25526 ?auto_25524 ?auto_25523 )
      ( MAKE-3PILE ?auto_25521 ?auto_25522 ?auto_25523 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25527 - BLOCK
      ?auto_25528 - BLOCK
      ?auto_25529 - BLOCK
    )
    :vars
    (
      ?auto_25530 - BLOCK
      ?auto_25531 - BLOCK
      ?auto_25532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25527 ?auto_25528 ) ) ( not ( = ?auto_25527 ?auto_25529 ) ) ( not ( = ?auto_25528 ?auto_25529 ) ) ( ON ?auto_25529 ?auto_25530 ) ( not ( = ?auto_25527 ?auto_25530 ) ) ( not ( = ?auto_25528 ?auto_25530 ) ) ( not ( = ?auto_25529 ?auto_25530 ) ) ( ON ?auto_25528 ?auto_25529 ) ( CLEAR ?auto_25528 ) ( ON-TABLE ?auto_25531 ) ( ON ?auto_25532 ?auto_25531 ) ( ON ?auto_25530 ?auto_25532 ) ( not ( = ?auto_25531 ?auto_25532 ) ) ( not ( = ?auto_25531 ?auto_25530 ) ) ( not ( = ?auto_25531 ?auto_25529 ) ) ( not ( = ?auto_25531 ?auto_25528 ) ) ( not ( = ?auto_25532 ?auto_25530 ) ) ( not ( = ?auto_25532 ?auto_25529 ) ) ( not ( = ?auto_25532 ?auto_25528 ) ) ( not ( = ?auto_25527 ?auto_25531 ) ) ( not ( = ?auto_25527 ?auto_25532 ) ) ( HOLDING ?auto_25527 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25527 )
      ( MAKE-3PILE ?auto_25527 ?auto_25528 ?auto_25529 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25533 - BLOCK
      ?auto_25534 - BLOCK
      ?auto_25535 - BLOCK
    )
    :vars
    (
      ?auto_25536 - BLOCK
      ?auto_25538 - BLOCK
      ?auto_25537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25533 ?auto_25534 ) ) ( not ( = ?auto_25533 ?auto_25535 ) ) ( not ( = ?auto_25534 ?auto_25535 ) ) ( ON ?auto_25535 ?auto_25536 ) ( not ( = ?auto_25533 ?auto_25536 ) ) ( not ( = ?auto_25534 ?auto_25536 ) ) ( not ( = ?auto_25535 ?auto_25536 ) ) ( ON ?auto_25534 ?auto_25535 ) ( ON-TABLE ?auto_25538 ) ( ON ?auto_25537 ?auto_25538 ) ( ON ?auto_25536 ?auto_25537 ) ( not ( = ?auto_25538 ?auto_25537 ) ) ( not ( = ?auto_25538 ?auto_25536 ) ) ( not ( = ?auto_25538 ?auto_25535 ) ) ( not ( = ?auto_25538 ?auto_25534 ) ) ( not ( = ?auto_25537 ?auto_25536 ) ) ( not ( = ?auto_25537 ?auto_25535 ) ) ( not ( = ?auto_25537 ?auto_25534 ) ) ( not ( = ?auto_25533 ?auto_25538 ) ) ( not ( = ?auto_25533 ?auto_25537 ) ) ( ON ?auto_25533 ?auto_25534 ) ( CLEAR ?auto_25533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25538 ?auto_25537 ?auto_25536 ?auto_25535 ?auto_25534 )
      ( MAKE-3PILE ?auto_25533 ?auto_25534 ?auto_25535 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25541 - BLOCK
      ?auto_25542 - BLOCK
    )
    :vars
    (
      ?auto_25543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25543 ?auto_25542 ) ( CLEAR ?auto_25543 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25541 ) ( ON ?auto_25542 ?auto_25541 ) ( not ( = ?auto_25541 ?auto_25542 ) ) ( not ( = ?auto_25541 ?auto_25543 ) ) ( not ( = ?auto_25542 ?auto_25543 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25543 ?auto_25542 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25544 - BLOCK
      ?auto_25545 - BLOCK
    )
    :vars
    (
      ?auto_25546 - BLOCK
      ?auto_25547 - BLOCK
      ?auto_25548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25546 ?auto_25545 ) ( CLEAR ?auto_25546 ) ( ON-TABLE ?auto_25544 ) ( ON ?auto_25545 ?auto_25544 ) ( not ( = ?auto_25544 ?auto_25545 ) ) ( not ( = ?auto_25544 ?auto_25546 ) ) ( not ( = ?auto_25545 ?auto_25546 ) ) ( HOLDING ?auto_25547 ) ( CLEAR ?auto_25548 ) ( not ( = ?auto_25544 ?auto_25547 ) ) ( not ( = ?auto_25544 ?auto_25548 ) ) ( not ( = ?auto_25545 ?auto_25547 ) ) ( not ( = ?auto_25545 ?auto_25548 ) ) ( not ( = ?auto_25546 ?auto_25547 ) ) ( not ( = ?auto_25546 ?auto_25548 ) ) ( not ( = ?auto_25547 ?auto_25548 ) ) )
    :subtasks
    ( ( !STACK ?auto_25547 ?auto_25548 )
      ( MAKE-2PILE ?auto_25544 ?auto_25545 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25549 - BLOCK
      ?auto_25550 - BLOCK
    )
    :vars
    (
      ?auto_25551 - BLOCK
      ?auto_25553 - BLOCK
      ?auto_25552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25551 ?auto_25550 ) ( ON-TABLE ?auto_25549 ) ( ON ?auto_25550 ?auto_25549 ) ( not ( = ?auto_25549 ?auto_25550 ) ) ( not ( = ?auto_25549 ?auto_25551 ) ) ( not ( = ?auto_25550 ?auto_25551 ) ) ( CLEAR ?auto_25553 ) ( not ( = ?auto_25549 ?auto_25552 ) ) ( not ( = ?auto_25549 ?auto_25553 ) ) ( not ( = ?auto_25550 ?auto_25552 ) ) ( not ( = ?auto_25550 ?auto_25553 ) ) ( not ( = ?auto_25551 ?auto_25552 ) ) ( not ( = ?auto_25551 ?auto_25553 ) ) ( not ( = ?auto_25552 ?auto_25553 ) ) ( ON ?auto_25552 ?auto_25551 ) ( CLEAR ?auto_25552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25549 ?auto_25550 ?auto_25551 )
      ( MAKE-2PILE ?auto_25549 ?auto_25550 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25554 - BLOCK
      ?auto_25555 - BLOCK
    )
    :vars
    (
      ?auto_25556 - BLOCK
      ?auto_25557 - BLOCK
      ?auto_25558 - BLOCK
      ?auto_25559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25556 ?auto_25555 ) ( ON-TABLE ?auto_25554 ) ( ON ?auto_25555 ?auto_25554 ) ( not ( = ?auto_25554 ?auto_25555 ) ) ( not ( = ?auto_25554 ?auto_25556 ) ) ( not ( = ?auto_25555 ?auto_25556 ) ) ( not ( = ?auto_25554 ?auto_25557 ) ) ( not ( = ?auto_25554 ?auto_25558 ) ) ( not ( = ?auto_25555 ?auto_25557 ) ) ( not ( = ?auto_25555 ?auto_25558 ) ) ( not ( = ?auto_25556 ?auto_25557 ) ) ( not ( = ?auto_25556 ?auto_25558 ) ) ( not ( = ?auto_25557 ?auto_25558 ) ) ( ON ?auto_25557 ?auto_25556 ) ( CLEAR ?auto_25557 ) ( HOLDING ?auto_25558 ) ( CLEAR ?auto_25559 ) ( ON-TABLE ?auto_25559 ) ( not ( = ?auto_25559 ?auto_25558 ) ) ( not ( = ?auto_25554 ?auto_25559 ) ) ( not ( = ?auto_25555 ?auto_25559 ) ) ( not ( = ?auto_25556 ?auto_25559 ) ) ( not ( = ?auto_25557 ?auto_25559 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25559 ?auto_25558 )
      ( MAKE-2PILE ?auto_25554 ?auto_25555 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25560 - BLOCK
      ?auto_25561 - BLOCK
    )
    :vars
    (
      ?auto_25562 - BLOCK
      ?auto_25565 - BLOCK
      ?auto_25564 - BLOCK
      ?auto_25563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25562 ?auto_25561 ) ( ON-TABLE ?auto_25560 ) ( ON ?auto_25561 ?auto_25560 ) ( not ( = ?auto_25560 ?auto_25561 ) ) ( not ( = ?auto_25560 ?auto_25562 ) ) ( not ( = ?auto_25561 ?auto_25562 ) ) ( not ( = ?auto_25560 ?auto_25565 ) ) ( not ( = ?auto_25560 ?auto_25564 ) ) ( not ( = ?auto_25561 ?auto_25565 ) ) ( not ( = ?auto_25561 ?auto_25564 ) ) ( not ( = ?auto_25562 ?auto_25565 ) ) ( not ( = ?auto_25562 ?auto_25564 ) ) ( not ( = ?auto_25565 ?auto_25564 ) ) ( ON ?auto_25565 ?auto_25562 ) ( CLEAR ?auto_25563 ) ( ON-TABLE ?auto_25563 ) ( not ( = ?auto_25563 ?auto_25564 ) ) ( not ( = ?auto_25560 ?auto_25563 ) ) ( not ( = ?auto_25561 ?auto_25563 ) ) ( not ( = ?auto_25562 ?auto_25563 ) ) ( not ( = ?auto_25565 ?auto_25563 ) ) ( ON ?auto_25564 ?auto_25565 ) ( CLEAR ?auto_25564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25560 ?auto_25561 ?auto_25562 ?auto_25565 )
      ( MAKE-2PILE ?auto_25560 ?auto_25561 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25566 - BLOCK
      ?auto_25567 - BLOCK
    )
    :vars
    (
      ?auto_25569 - BLOCK
      ?auto_25571 - BLOCK
      ?auto_25570 - BLOCK
      ?auto_25568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25569 ?auto_25567 ) ( ON-TABLE ?auto_25566 ) ( ON ?auto_25567 ?auto_25566 ) ( not ( = ?auto_25566 ?auto_25567 ) ) ( not ( = ?auto_25566 ?auto_25569 ) ) ( not ( = ?auto_25567 ?auto_25569 ) ) ( not ( = ?auto_25566 ?auto_25571 ) ) ( not ( = ?auto_25566 ?auto_25570 ) ) ( not ( = ?auto_25567 ?auto_25571 ) ) ( not ( = ?auto_25567 ?auto_25570 ) ) ( not ( = ?auto_25569 ?auto_25571 ) ) ( not ( = ?auto_25569 ?auto_25570 ) ) ( not ( = ?auto_25571 ?auto_25570 ) ) ( ON ?auto_25571 ?auto_25569 ) ( not ( = ?auto_25568 ?auto_25570 ) ) ( not ( = ?auto_25566 ?auto_25568 ) ) ( not ( = ?auto_25567 ?auto_25568 ) ) ( not ( = ?auto_25569 ?auto_25568 ) ) ( not ( = ?auto_25571 ?auto_25568 ) ) ( ON ?auto_25570 ?auto_25571 ) ( CLEAR ?auto_25570 ) ( HOLDING ?auto_25568 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25568 )
      ( MAKE-2PILE ?auto_25566 ?auto_25567 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25572 - BLOCK
      ?auto_25573 - BLOCK
    )
    :vars
    (
      ?auto_25574 - BLOCK
      ?auto_25575 - BLOCK
      ?auto_25576 - BLOCK
      ?auto_25577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25574 ?auto_25573 ) ( ON-TABLE ?auto_25572 ) ( ON ?auto_25573 ?auto_25572 ) ( not ( = ?auto_25572 ?auto_25573 ) ) ( not ( = ?auto_25572 ?auto_25574 ) ) ( not ( = ?auto_25573 ?auto_25574 ) ) ( not ( = ?auto_25572 ?auto_25575 ) ) ( not ( = ?auto_25572 ?auto_25576 ) ) ( not ( = ?auto_25573 ?auto_25575 ) ) ( not ( = ?auto_25573 ?auto_25576 ) ) ( not ( = ?auto_25574 ?auto_25575 ) ) ( not ( = ?auto_25574 ?auto_25576 ) ) ( not ( = ?auto_25575 ?auto_25576 ) ) ( ON ?auto_25575 ?auto_25574 ) ( not ( = ?auto_25577 ?auto_25576 ) ) ( not ( = ?auto_25572 ?auto_25577 ) ) ( not ( = ?auto_25573 ?auto_25577 ) ) ( not ( = ?auto_25574 ?auto_25577 ) ) ( not ( = ?auto_25575 ?auto_25577 ) ) ( ON ?auto_25576 ?auto_25575 ) ( ON ?auto_25577 ?auto_25576 ) ( CLEAR ?auto_25577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25572 ?auto_25573 ?auto_25574 ?auto_25575 ?auto_25576 )
      ( MAKE-2PILE ?auto_25572 ?auto_25573 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25582 - BLOCK
      ?auto_25583 - BLOCK
      ?auto_25584 - BLOCK
      ?auto_25585 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_25585 ) ( CLEAR ?auto_25584 ) ( ON-TABLE ?auto_25582 ) ( ON ?auto_25583 ?auto_25582 ) ( ON ?auto_25584 ?auto_25583 ) ( not ( = ?auto_25582 ?auto_25583 ) ) ( not ( = ?auto_25582 ?auto_25584 ) ) ( not ( = ?auto_25582 ?auto_25585 ) ) ( not ( = ?auto_25583 ?auto_25584 ) ) ( not ( = ?auto_25583 ?auto_25585 ) ) ( not ( = ?auto_25584 ?auto_25585 ) ) )
    :subtasks
    ( ( !STACK ?auto_25585 ?auto_25584 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25586 - BLOCK
      ?auto_25587 - BLOCK
      ?auto_25588 - BLOCK
      ?auto_25589 - BLOCK
    )
    :vars
    (
      ?auto_25590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25588 ) ( ON-TABLE ?auto_25586 ) ( ON ?auto_25587 ?auto_25586 ) ( ON ?auto_25588 ?auto_25587 ) ( not ( = ?auto_25586 ?auto_25587 ) ) ( not ( = ?auto_25586 ?auto_25588 ) ) ( not ( = ?auto_25586 ?auto_25589 ) ) ( not ( = ?auto_25587 ?auto_25588 ) ) ( not ( = ?auto_25587 ?auto_25589 ) ) ( not ( = ?auto_25588 ?auto_25589 ) ) ( ON ?auto_25589 ?auto_25590 ) ( CLEAR ?auto_25589 ) ( HAND-EMPTY ) ( not ( = ?auto_25586 ?auto_25590 ) ) ( not ( = ?auto_25587 ?auto_25590 ) ) ( not ( = ?auto_25588 ?auto_25590 ) ) ( not ( = ?auto_25589 ?auto_25590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25589 ?auto_25590 )
      ( MAKE-4PILE ?auto_25586 ?auto_25587 ?auto_25588 ?auto_25589 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25591 - BLOCK
      ?auto_25592 - BLOCK
      ?auto_25593 - BLOCK
      ?auto_25594 - BLOCK
    )
    :vars
    (
      ?auto_25595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25591 ) ( ON ?auto_25592 ?auto_25591 ) ( not ( = ?auto_25591 ?auto_25592 ) ) ( not ( = ?auto_25591 ?auto_25593 ) ) ( not ( = ?auto_25591 ?auto_25594 ) ) ( not ( = ?auto_25592 ?auto_25593 ) ) ( not ( = ?auto_25592 ?auto_25594 ) ) ( not ( = ?auto_25593 ?auto_25594 ) ) ( ON ?auto_25594 ?auto_25595 ) ( CLEAR ?auto_25594 ) ( not ( = ?auto_25591 ?auto_25595 ) ) ( not ( = ?auto_25592 ?auto_25595 ) ) ( not ( = ?auto_25593 ?auto_25595 ) ) ( not ( = ?auto_25594 ?auto_25595 ) ) ( HOLDING ?auto_25593 ) ( CLEAR ?auto_25592 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25591 ?auto_25592 ?auto_25593 )
      ( MAKE-4PILE ?auto_25591 ?auto_25592 ?auto_25593 ?auto_25594 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25596 - BLOCK
      ?auto_25597 - BLOCK
      ?auto_25598 - BLOCK
      ?auto_25599 - BLOCK
    )
    :vars
    (
      ?auto_25600 - BLOCK
      ?auto_25601 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25596 ) ( ON ?auto_25597 ?auto_25596 ) ( not ( = ?auto_25596 ?auto_25597 ) ) ( not ( = ?auto_25596 ?auto_25598 ) ) ( not ( = ?auto_25596 ?auto_25599 ) ) ( not ( = ?auto_25597 ?auto_25598 ) ) ( not ( = ?auto_25597 ?auto_25599 ) ) ( not ( = ?auto_25598 ?auto_25599 ) ) ( ON ?auto_25599 ?auto_25600 ) ( not ( = ?auto_25596 ?auto_25600 ) ) ( not ( = ?auto_25597 ?auto_25600 ) ) ( not ( = ?auto_25598 ?auto_25600 ) ) ( not ( = ?auto_25599 ?auto_25600 ) ) ( CLEAR ?auto_25597 ) ( ON ?auto_25598 ?auto_25599 ) ( CLEAR ?auto_25598 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25601 ) ( ON ?auto_25600 ?auto_25601 ) ( not ( = ?auto_25601 ?auto_25600 ) ) ( not ( = ?auto_25601 ?auto_25599 ) ) ( not ( = ?auto_25601 ?auto_25598 ) ) ( not ( = ?auto_25596 ?auto_25601 ) ) ( not ( = ?auto_25597 ?auto_25601 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25601 ?auto_25600 ?auto_25599 )
      ( MAKE-4PILE ?auto_25596 ?auto_25597 ?auto_25598 ?auto_25599 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25602 - BLOCK
      ?auto_25603 - BLOCK
      ?auto_25604 - BLOCK
      ?auto_25605 - BLOCK
    )
    :vars
    (
      ?auto_25606 - BLOCK
      ?auto_25607 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25602 ) ( not ( = ?auto_25602 ?auto_25603 ) ) ( not ( = ?auto_25602 ?auto_25604 ) ) ( not ( = ?auto_25602 ?auto_25605 ) ) ( not ( = ?auto_25603 ?auto_25604 ) ) ( not ( = ?auto_25603 ?auto_25605 ) ) ( not ( = ?auto_25604 ?auto_25605 ) ) ( ON ?auto_25605 ?auto_25606 ) ( not ( = ?auto_25602 ?auto_25606 ) ) ( not ( = ?auto_25603 ?auto_25606 ) ) ( not ( = ?auto_25604 ?auto_25606 ) ) ( not ( = ?auto_25605 ?auto_25606 ) ) ( ON ?auto_25604 ?auto_25605 ) ( CLEAR ?auto_25604 ) ( ON-TABLE ?auto_25607 ) ( ON ?auto_25606 ?auto_25607 ) ( not ( = ?auto_25607 ?auto_25606 ) ) ( not ( = ?auto_25607 ?auto_25605 ) ) ( not ( = ?auto_25607 ?auto_25604 ) ) ( not ( = ?auto_25602 ?auto_25607 ) ) ( not ( = ?auto_25603 ?auto_25607 ) ) ( HOLDING ?auto_25603 ) ( CLEAR ?auto_25602 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25602 ?auto_25603 )
      ( MAKE-4PILE ?auto_25602 ?auto_25603 ?auto_25604 ?auto_25605 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25608 - BLOCK
      ?auto_25609 - BLOCK
      ?auto_25610 - BLOCK
      ?auto_25611 - BLOCK
    )
    :vars
    (
      ?auto_25613 - BLOCK
      ?auto_25612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25608 ) ( not ( = ?auto_25608 ?auto_25609 ) ) ( not ( = ?auto_25608 ?auto_25610 ) ) ( not ( = ?auto_25608 ?auto_25611 ) ) ( not ( = ?auto_25609 ?auto_25610 ) ) ( not ( = ?auto_25609 ?auto_25611 ) ) ( not ( = ?auto_25610 ?auto_25611 ) ) ( ON ?auto_25611 ?auto_25613 ) ( not ( = ?auto_25608 ?auto_25613 ) ) ( not ( = ?auto_25609 ?auto_25613 ) ) ( not ( = ?auto_25610 ?auto_25613 ) ) ( not ( = ?auto_25611 ?auto_25613 ) ) ( ON ?auto_25610 ?auto_25611 ) ( ON-TABLE ?auto_25612 ) ( ON ?auto_25613 ?auto_25612 ) ( not ( = ?auto_25612 ?auto_25613 ) ) ( not ( = ?auto_25612 ?auto_25611 ) ) ( not ( = ?auto_25612 ?auto_25610 ) ) ( not ( = ?auto_25608 ?auto_25612 ) ) ( not ( = ?auto_25609 ?auto_25612 ) ) ( CLEAR ?auto_25608 ) ( ON ?auto_25609 ?auto_25610 ) ( CLEAR ?auto_25609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25612 ?auto_25613 ?auto_25611 ?auto_25610 )
      ( MAKE-4PILE ?auto_25608 ?auto_25609 ?auto_25610 ?auto_25611 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25614 - BLOCK
      ?auto_25615 - BLOCK
      ?auto_25616 - BLOCK
      ?auto_25617 - BLOCK
    )
    :vars
    (
      ?auto_25619 - BLOCK
      ?auto_25618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25614 ?auto_25615 ) ) ( not ( = ?auto_25614 ?auto_25616 ) ) ( not ( = ?auto_25614 ?auto_25617 ) ) ( not ( = ?auto_25615 ?auto_25616 ) ) ( not ( = ?auto_25615 ?auto_25617 ) ) ( not ( = ?auto_25616 ?auto_25617 ) ) ( ON ?auto_25617 ?auto_25619 ) ( not ( = ?auto_25614 ?auto_25619 ) ) ( not ( = ?auto_25615 ?auto_25619 ) ) ( not ( = ?auto_25616 ?auto_25619 ) ) ( not ( = ?auto_25617 ?auto_25619 ) ) ( ON ?auto_25616 ?auto_25617 ) ( ON-TABLE ?auto_25618 ) ( ON ?auto_25619 ?auto_25618 ) ( not ( = ?auto_25618 ?auto_25619 ) ) ( not ( = ?auto_25618 ?auto_25617 ) ) ( not ( = ?auto_25618 ?auto_25616 ) ) ( not ( = ?auto_25614 ?auto_25618 ) ) ( not ( = ?auto_25615 ?auto_25618 ) ) ( ON ?auto_25615 ?auto_25616 ) ( CLEAR ?auto_25615 ) ( HOLDING ?auto_25614 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25614 )
      ( MAKE-4PILE ?auto_25614 ?auto_25615 ?auto_25616 ?auto_25617 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25620 - BLOCK
      ?auto_25621 - BLOCK
      ?auto_25622 - BLOCK
      ?auto_25623 - BLOCK
    )
    :vars
    (
      ?auto_25625 - BLOCK
      ?auto_25624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25620 ?auto_25621 ) ) ( not ( = ?auto_25620 ?auto_25622 ) ) ( not ( = ?auto_25620 ?auto_25623 ) ) ( not ( = ?auto_25621 ?auto_25622 ) ) ( not ( = ?auto_25621 ?auto_25623 ) ) ( not ( = ?auto_25622 ?auto_25623 ) ) ( ON ?auto_25623 ?auto_25625 ) ( not ( = ?auto_25620 ?auto_25625 ) ) ( not ( = ?auto_25621 ?auto_25625 ) ) ( not ( = ?auto_25622 ?auto_25625 ) ) ( not ( = ?auto_25623 ?auto_25625 ) ) ( ON ?auto_25622 ?auto_25623 ) ( ON-TABLE ?auto_25624 ) ( ON ?auto_25625 ?auto_25624 ) ( not ( = ?auto_25624 ?auto_25625 ) ) ( not ( = ?auto_25624 ?auto_25623 ) ) ( not ( = ?auto_25624 ?auto_25622 ) ) ( not ( = ?auto_25620 ?auto_25624 ) ) ( not ( = ?auto_25621 ?auto_25624 ) ) ( ON ?auto_25621 ?auto_25622 ) ( ON ?auto_25620 ?auto_25621 ) ( CLEAR ?auto_25620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25624 ?auto_25625 ?auto_25623 ?auto_25622 ?auto_25621 )
      ( MAKE-4PILE ?auto_25620 ?auto_25621 ?auto_25622 ?auto_25623 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25627 - BLOCK
    )
    :vars
    (
      ?auto_25628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25628 ?auto_25627 ) ( CLEAR ?auto_25628 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25627 ) ( not ( = ?auto_25627 ?auto_25628 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25628 ?auto_25627 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25629 - BLOCK
    )
    :vars
    (
      ?auto_25630 - BLOCK
      ?auto_25631 - BLOCK
      ?auto_25632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25630 ?auto_25629 ) ( CLEAR ?auto_25630 ) ( ON-TABLE ?auto_25629 ) ( not ( = ?auto_25629 ?auto_25630 ) ) ( HOLDING ?auto_25631 ) ( CLEAR ?auto_25632 ) ( not ( = ?auto_25629 ?auto_25631 ) ) ( not ( = ?auto_25629 ?auto_25632 ) ) ( not ( = ?auto_25630 ?auto_25631 ) ) ( not ( = ?auto_25630 ?auto_25632 ) ) ( not ( = ?auto_25631 ?auto_25632 ) ) )
    :subtasks
    ( ( !STACK ?auto_25631 ?auto_25632 )
      ( MAKE-1PILE ?auto_25629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25633 - BLOCK
    )
    :vars
    (
      ?auto_25636 - BLOCK
      ?auto_25635 - BLOCK
      ?auto_25634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25636 ?auto_25633 ) ( ON-TABLE ?auto_25633 ) ( not ( = ?auto_25633 ?auto_25636 ) ) ( CLEAR ?auto_25635 ) ( not ( = ?auto_25633 ?auto_25634 ) ) ( not ( = ?auto_25633 ?auto_25635 ) ) ( not ( = ?auto_25636 ?auto_25634 ) ) ( not ( = ?auto_25636 ?auto_25635 ) ) ( not ( = ?auto_25634 ?auto_25635 ) ) ( ON ?auto_25634 ?auto_25636 ) ( CLEAR ?auto_25634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25633 ?auto_25636 )
      ( MAKE-1PILE ?auto_25633 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25637 - BLOCK
    )
    :vars
    (
      ?auto_25639 - BLOCK
      ?auto_25640 - BLOCK
      ?auto_25638 - BLOCK
      ?auto_25641 - BLOCK
      ?auto_25642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25639 ?auto_25637 ) ( ON-TABLE ?auto_25637 ) ( not ( = ?auto_25637 ?auto_25639 ) ) ( not ( = ?auto_25637 ?auto_25640 ) ) ( not ( = ?auto_25637 ?auto_25638 ) ) ( not ( = ?auto_25639 ?auto_25640 ) ) ( not ( = ?auto_25639 ?auto_25638 ) ) ( not ( = ?auto_25640 ?auto_25638 ) ) ( ON ?auto_25640 ?auto_25639 ) ( CLEAR ?auto_25640 ) ( HOLDING ?auto_25638 ) ( CLEAR ?auto_25641 ) ( ON-TABLE ?auto_25642 ) ( ON ?auto_25641 ?auto_25642 ) ( not ( = ?auto_25642 ?auto_25641 ) ) ( not ( = ?auto_25642 ?auto_25638 ) ) ( not ( = ?auto_25641 ?auto_25638 ) ) ( not ( = ?auto_25637 ?auto_25641 ) ) ( not ( = ?auto_25637 ?auto_25642 ) ) ( not ( = ?auto_25639 ?auto_25641 ) ) ( not ( = ?auto_25639 ?auto_25642 ) ) ( not ( = ?auto_25640 ?auto_25641 ) ) ( not ( = ?auto_25640 ?auto_25642 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25642 ?auto_25641 ?auto_25638 )
      ( MAKE-1PILE ?auto_25637 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25643 - BLOCK
    )
    :vars
    (
      ?auto_25647 - BLOCK
      ?auto_25645 - BLOCK
      ?auto_25644 - BLOCK
      ?auto_25646 - BLOCK
      ?auto_25648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25647 ?auto_25643 ) ( ON-TABLE ?auto_25643 ) ( not ( = ?auto_25643 ?auto_25647 ) ) ( not ( = ?auto_25643 ?auto_25645 ) ) ( not ( = ?auto_25643 ?auto_25644 ) ) ( not ( = ?auto_25647 ?auto_25645 ) ) ( not ( = ?auto_25647 ?auto_25644 ) ) ( not ( = ?auto_25645 ?auto_25644 ) ) ( ON ?auto_25645 ?auto_25647 ) ( CLEAR ?auto_25646 ) ( ON-TABLE ?auto_25648 ) ( ON ?auto_25646 ?auto_25648 ) ( not ( = ?auto_25648 ?auto_25646 ) ) ( not ( = ?auto_25648 ?auto_25644 ) ) ( not ( = ?auto_25646 ?auto_25644 ) ) ( not ( = ?auto_25643 ?auto_25646 ) ) ( not ( = ?auto_25643 ?auto_25648 ) ) ( not ( = ?auto_25647 ?auto_25646 ) ) ( not ( = ?auto_25647 ?auto_25648 ) ) ( not ( = ?auto_25645 ?auto_25646 ) ) ( not ( = ?auto_25645 ?auto_25648 ) ) ( ON ?auto_25644 ?auto_25645 ) ( CLEAR ?auto_25644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25643 ?auto_25647 ?auto_25645 )
      ( MAKE-1PILE ?auto_25643 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25649 - BLOCK
    )
    :vars
    (
      ?auto_25650 - BLOCK
      ?auto_25652 - BLOCK
      ?auto_25651 - BLOCK
      ?auto_25653 - BLOCK
      ?auto_25654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25650 ?auto_25649 ) ( ON-TABLE ?auto_25649 ) ( not ( = ?auto_25649 ?auto_25650 ) ) ( not ( = ?auto_25649 ?auto_25652 ) ) ( not ( = ?auto_25649 ?auto_25651 ) ) ( not ( = ?auto_25650 ?auto_25652 ) ) ( not ( = ?auto_25650 ?auto_25651 ) ) ( not ( = ?auto_25652 ?auto_25651 ) ) ( ON ?auto_25652 ?auto_25650 ) ( ON-TABLE ?auto_25653 ) ( not ( = ?auto_25653 ?auto_25654 ) ) ( not ( = ?auto_25653 ?auto_25651 ) ) ( not ( = ?auto_25654 ?auto_25651 ) ) ( not ( = ?auto_25649 ?auto_25654 ) ) ( not ( = ?auto_25649 ?auto_25653 ) ) ( not ( = ?auto_25650 ?auto_25654 ) ) ( not ( = ?auto_25650 ?auto_25653 ) ) ( not ( = ?auto_25652 ?auto_25654 ) ) ( not ( = ?auto_25652 ?auto_25653 ) ) ( ON ?auto_25651 ?auto_25652 ) ( CLEAR ?auto_25651 ) ( HOLDING ?auto_25654 ) ( CLEAR ?auto_25653 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25653 ?auto_25654 )
      ( MAKE-1PILE ?auto_25649 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25655 - BLOCK
    )
    :vars
    (
      ?auto_25656 - BLOCK
      ?auto_25660 - BLOCK
      ?auto_25659 - BLOCK
      ?auto_25657 - BLOCK
      ?auto_25658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25656 ?auto_25655 ) ( ON-TABLE ?auto_25655 ) ( not ( = ?auto_25655 ?auto_25656 ) ) ( not ( = ?auto_25655 ?auto_25660 ) ) ( not ( = ?auto_25655 ?auto_25659 ) ) ( not ( = ?auto_25656 ?auto_25660 ) ) ( not ( = ?auto_25656 ?auto_25659 ) ) ( not ( = ?auto_25660 ?auto_25659 ) ) ( ON ?auto_25660 ?auto_25656 ) ( ON-TABLE ?auto_25657 ) ( not ( = ?auto_25657 ?auto_25658 ) ) ( not ( = ?auto_25657 ?auto_25659 ) ) ( not ( = ?auto_25658 ?auto_25659 ) ) ( not ( = ?auto_25655 ?auto_25658 ) ) ( not ( = ?auto_25655 ?auto_25657 ) ) ( not ( = ?auto_25656 ?auto_25658 ) ) ( not ( = ?auto_25656 ?auto_25657 ) ) ( not ( = ?auto_25660 ?auto_25658 ) ) ( not ( = ?auto_25660 ?auto_25657 ) ) ( ON ?auto_25659 ?auto_25660 ) ( CLEAR ?auto_25657 ) ( ON ?auto_25658 ?auto_25659 ) ( CLEAR ?auto_25658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25655 ?auto_25656 ?auto_25660 ?auto_25659 )
      ( MAKE-1PILE ?auto_25655 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25661 - BLOCK
    )
    :vars
    (
      ?auto_25662 - BLOCK
      ?auto_25666 - BLOCK
      ?auto_25665 - BLOCK
      ?auto_25663 - BLOCK
      ?auto_25664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25662 ?auto_25661 ) ( ON-TABLE ?auto_25661 ) ( not ( = ?auto_25661 ?auto_25662 ) ) ( not ( = ?auto_25661 ?auto_25666 ) ) ( not ( = ?auto_25661 ?auto_25665 ) ) ( not ( = ?auto_25662 ?auto_25666 ) ) ( not ( = ?auto_25662 ?auto_25665 ) ) ( not ( = ?auto_25666 ?auto_25665 ) ) ( ON ?auto_25666 ?auto_25662 ) ( not ( = ?auto_25663 ?auto_25664 ) ) ( not ( = ?auto_25663 ?auto_25665 ) ) ( not ( = ?auto_25664 ?auto_25665 ) ) ( not ( = ?auto_25661 ?auto_25664 ) ) ( not ( = ?auto_25661 ?auto_25663 ) ) ( not ( = ?auto_25662 ?auto_25664 ) ) ( not ( = ?auto_25662 ?auto_25663 ) ) ( not ( = ?auto_25666 ?auto_25664 ) ) ( not ( = ?auto_25666 ?auto_25663 ) ) ( ON ?auto_25665 ?auto_25666 ) ( ON ?auto_25664 ?auto_25665 ) ( CLEAR ?auto_25664 ) ( HOLDING ?auto_25663 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25663 )
      ( MAKE-1PILE ?auto_25661 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25667 - BLOCK
    )
    :vars
    (
      ?auto_25671 - BLOCK
      ?auto_25669 - BLOCK
      ?auto_25670 - BLOCK
      ?auto_25672 - BLOCK
      ?auto_25668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25671 ?auto_25667 ) ( ON-TABLE ?auto_25667 ) ( not ( = ?auto_25667 ?auto_25671 ) ) ( not ( = ?auto_25667 ?auto_25669 ) ) ( not ( = ?auto_25667 ?auto_25670 ) ) ( not ( = ?auto_25671 ?auto_25669 ) ) ( not ( = ?auto_25671 ?auto_25670 ) ) ( not ( = ?auto_25669 ?auto_25670 ) ) ( ON ?auto_25669 ?auto_25671 ) ( not ( = ?auto_25672 ?auto_25668 ) ) ( not ( = ?auto_25672 ?auto_25670 ) ) ( not ( = ?auto_25668 ?auto_25670 ) ) ( not ( = ?auto_25667 ?auto_25668 ) ) ( not ( = ?auto_25667 ?auto_25672 ) ) ( not ( = ?auto_25671 ?auto_25668 ) ) ( not ( = ?auto_25671 ?auto_25672 ) ) ( not ( = ?auto_25669 ?auto_25668 ) ) ( not ( = ?auto_25669 ?auto_25672 ) ) ( ON ?auto_25670 ?auto_25669 ) ( ON ?auto_25668 ?auto_25670 ) ( ON ?auto_25672 ?auto_25668 ) ( CLEAR ?auto_25672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25667 ?auto_25671 ?auto_25669 ?auto_25670 ?auto_25668 )
      ( MAKE-1PILE ?auto_25667 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25678 - BLOCK
      ?auto_25679 - BLOCK
      ?auto_25680 - BLOCK
      ?auto_25681 - BLOCK
      ?auto_25682 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_25682 ) ( CLEAR ?auto_25681 ) ( ON-TABLE ?auto_25678 ) ( ON ?auto_25679 ?auto_25678 ) ( ON ?auto_25680 ?auto_25679 ) ( ON ?auto_25681 ?auto_25680 ) ( not ( = ?auto_25678 ?auto_25679 ) ) ( not ( = ?auto_25678 ?auto_25680 ) ) ( not ( = ?auto_25678 ?auto_25681 ) ) ( not ( = ?auto_25678 ?auto_25682 ) ) ( not ( = ?auto_25679 ?auto_25680 ) ) ( not ( = ?auto_25679 ?auto_25681 ) ) ( not ( = ?auto_25679 ?auto_25682 ) ) ( not ( = ?auto_25680 ?auto_25681 ) ) ( not ( = ?auto_25680 ?auto_25682 ) ) ( not ( = ?auto_25681 ?auto_25682 ) ) )
    :subtasks
    ( ( !STACK ?auto_25682 ?auto_25681 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25683 - BLOCK
      ?auto_25684 - BLOCK
      ?auto_25685 - BLOCK
      ?auto_25686 - BLOCK
      ?auto_25687 - BLOCK
    )
    :vars
    (
      ?auto_25688 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25686 ) ( ON-TABLE ?auto_25683 ) ( ON ?auto_25684 ?auto_25683 ) ( ON ?auto_25685 ?auto_25684 ) ( ON ?auto_25686 ?auto_25685 ) ( not ( = ?auto_25683 ?auto_25684 ) ) ( not ( = ?auto_25683 ?auto_25685 ) ) ( not ( = ?auto_25683 ?auto_25686 ) ) ( not ( = ?auto_25683 ?auto_25687 ) ) ( not ( = ?auto_25684 ?auto_25685 ) ) ( not ( = ?auto_25684 ?auto_25686 ) ) ( not ( = ?auto_25684 ?auto_25687 ) ) ( not ( = ?auto_25685 ?auto_25686 ) ) ( not ( = ?auto_25685 ?auto_25687 ) ) ( not ( = ?auto_25686 ?auto_25687 ) ) ( ON ?auto_25687 ?auto_25688 ) ( CLEAR ?auto_25687 ) ( HAND-EMPTY ) ( not ( = ?auto_25683 ?auto_25688 ) ) ( not ( = ?auto_25684 ?auto_25688 ) ) ( not ( = ?auto_25685 ?auto_25688 ) ) ( not ( = ?auto_25686 ?auto_25688 ) ) ( not ( = ?auto_25687 ?auto_25688 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25687 ?auto_25688 )
      ( MAKE-5PILE ?auto_25683 ?auto_25684 ?auto_25685 ?auto_25686 ?auto_25687 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25689 - BLOCK
      ?auto_25690 - BLOCK
      ?auto_25691 - BLOCK
      ?auto_25692 - BLOCK
      ?auto_25693 - BLOCK
    )
    :vars
    (
      ?auto_25694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25689 ) ( ON ?auto_25690 ?auto_25689 ) ( ON ?auto_25691 ?auto_25690 ) ( not ( = ?auto_25689 ?auto_25690 ) ) ( not ( = ?auto_25689 ?auto_25691 ) ) ( not ( = ?auto_25689 ?auto_25692 ) ) ( not ( = ?auto_25689 ?auto_25693 ) ) ( not ( = ?auto_25690 ?auto_25691 ) ) ( not ( = ?auto_25690 ?auto_25692 ) ) ( not ( = ?auto_25690 ?auto_25693 ) ) ( not ( = ?auto_25691 ?auto_25692 ) ) ( not ( = ?auto_25691 ?auto_25693 ) ) ( not ( = ?auto_25692 ?auto_25693 ) ) ( ON ?auto_25693 ?auto_25694 ) ( CLEAR ?auto_25693 ) ( not ( = ?auto_25689 ?auto_25694 ) ) ( not ( = ?auto_25690 ?auto_25694 ) ) ( not ( = ?auto_25691 ?auto_25694 ) ) ( not ( = ?auto_25692 ?auto_25694 ) ) ( not ( = ?auto_25693 ?auto_25694 ) ) ( HOLDING ?auto_25692 ) ( CLEAR ?auto_25691 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25689 ?auto_25690 ?auto_25691 ?auto_25692 )
      ( MAKE-5PILE ?auto_25689 ?auto_25690 ?auto_25691 ?auto_25692 ?auto_25693 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25695 - BLOCK
      ?auto_25696 - BLOCK
      ?auto_25697 - BLOCK
      ?auto_25698 - BLOCK
      ?auto_25699 - BLOCK
    )
    :vars
    (
      ?auto_25700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25695 ) ( ON ?auto_25696 ?auto_25695 ) ( ON ?auto_25697 ?auto_25696 ) ( not ( = ?auto_25695 ?auto_25696 ) ) ( not ( = ?auto_25695 ?auto_25697 ) ) ( not ( = ?auto_25695 ?auto_25698 ) ) ( not ( = ?auto_25695 ?auto_25699 ) ) ( not ( = ?auto_25696 ?auto_25697 ) ) ( not ( = ?auto_25696 ?auto_25698 ) ) ( not ( = ?auto_25696 ?auto_25699 ) ) ( not ( = ?auto_25697 ?auto_25698 ) ) ( not ( = ?auto_25697 ?auto_25699 ) ) ( not ( = ?auto_25698 ?auto_25699 ) ) ( ON ?auto_25699 ?auto_25700 ) ( not ( = ?auto_25695 ?auto_25700 ) ) ( not ( = ?auto_25696 ?auto_25700 ) ) ( not ( = ?auto_25697 ?auto_25700 ) ) ( not ( = ?auto_25698 ?auto_25700 ) ) ( not ( = ?auto_25699 ?auto_25700 ) ) ( CLEAR ?auto_25697 ) ( ON ?auto_25698 ?auto_25699 ) ( CLEAR ?auto_25698 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25700 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25700 ?auto_25699 )
      ( MAKE-5PILE ?auto_25695 ?auto_25696 ?auto_25697 ?auto_25698 ?auto_25699 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25701 - BLOCK
      ?auto_25702 - BLOCK
      ?auto_25703 - BLOCK
      ?auto_25704 - BLOCK
      ?auto_25705 - BLOCK
    )
    :vars
    (
      ?auto_25706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25701 ) ( ON ?auto_25702 ?auto_25701 ) ( not ( = ?auto_25701 ?auto_25702 ) ) ( not ( = ?auto_25701 ?auto_25703 ) ) ( not ( = ?auto_25701 ?auto_25704 ) ) ( not ( = ?auto_25701 ?auto_25705 ) ) ( not ( = ?auto_25702 ?auto_25703 ) ) ( not ( = ?auto_25702 ?auto_25704 ) ) ( not ( = ?auto_25702 ?auto_25705 ) ) ( not ( = ?auto_25703 ?auto_25704 ) ) ( not ( = ?auto_25703 ?auto_25705 ) ) ( not ( = ?auto_25704 ?auto_25705 ) ) ( ON ?auto_25705 ?auto_25706 ) ( not ( = ?auto_25701 ?auto_25706 ) ) ( not ( = ?auto_25702 ?auto_25706 ) ) ( not ( = ?auto_25703 ?auto_25706 ) ) ( not ( = ?auto_25704 ?auto_25706 ) ) ( not ( = ?auto_25705 ?auto_25706 ) ) ( ON ?auto_25704 ?auto_25705 ) ( CLEAR ?auto_25704 ) ( ON-TABLE ?auto_25706 ) ( HOLDING ?auto_25703 ) ( CLEAR ?auto_25702 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25701 ?auto_25702 ?auto_25703 )
      ( MAKE-5PILE ?auto_25701 ?auto_25702 ?auto_25703 ?auto_25704 ?auto_25705 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25707 - BLOCK
      ?auto_25708 - BLOCK
      ?auto_25709 - BLOCK
      ?auto_25710 - BLOCK
      ?auto_25711 - BLOCK
    )
    :vars
    (
      ?auto_25712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25707 ) ( ON ?auto_25708 ?auto_25707 ) ( not ( = ?auto_25707 ?auto_25708 ) ) ( not ( = ?auto_25707 ?auto_25709 ) ) ( not ( = ?auto_25707 ?auto_25710 ) ) ( not ( = ?auto_25707 ?auto_25711 ) ) ( not ( = ?auto_25708 ?auto_25709 ) ) ( not ( = ?auto_25708 ?auto_25710 ) ) ( not ( = ?auto_25708 ?auto_25711 ) ) ( not ( = ?auto_25709 ?auto_25710 ) ) ( not ( = ?auto_25709 ?auto_25711 ) ) ( not ( = ?auto_25710 ?auto_25711 ) ) ( ON ?auto_25711 ?auto_25712 ) ( not ( = ?auto_25707 ?auto_25712 ) ) ( not ( = ?auto_25708 ?auto_25712 ) ) ( not ( = ?auto_25709 ?auto_25712 ) ) ( not ( = ?auto_25710 ?auto_25712 ) ) ( not ( = ?auto_25711 ?auto_25712 ) ) ( ON ?auto_25710 ?auto_25711 ) ( ON-TABLE ?auto_25712 ) ( CLEAR ?auto_25708 ) ( ON ?auto_25709 ?auto_25710 ) ( CLEAR ?auto_25709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25712 ?auto_25711 ?auto_25710 )
      ( MAKE-5PILE ?auto_25707 ?auto_25708 ?auto_25709 ?auto_25710 ?auto_25711 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25713 - BLOCK
      ?auto_25714 - BLOCK
      ?auto_25715 - BLOCK
      ?auto_25716 - BLOCK
      ?auto_25717 - BLOCK
    )
    :vars
    (
      ?auto_25718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25713 ) ( not ( = ?auto_25713 ?auto_25714 ) ) ( not ( = ?auto_25713 ?auto_25715 ) ) ( not ( = ?auto_25713 ?auto_25716 ) ) ( not ( = ?auto_25713 ?auto_25717 ) ) ( not ( = ?auto_25714 ?auto_25715 ) ) ( not ( = ?auto_25714 ?auto_25716 ) ) ( not ( = ?auto_25714 ?auto_25717 ) ) ( not ( = ?auto_25715 ?auto_25716 ) ) ( not ( = ?auto_25715 ?auto_25717 ) ) ( not ( = ?auto_25716 ?auto_25717 ) ) ( ON ?auto_25717 ?auto_25718 ) ( not ( = ?auto_25713 ?auto_25718 ) ) ( not ( = ?auto_25714 ?auto_25718 ) ) ( not ( = ?auto_25715 ?auto_25718 ) ) ( not ( = ?auto_25716 ?auto_25718 ) ) ( not ( = ?auto_25717 ?auto_25718 ) ) ( ON ?auto_25716 ?auto_25717 ) ( ON-TABLE ?auto_25718 ) ( ON ?auto_25715 ?auto_25716 ) ( CLEAR ?auto_25715 ) ( HOLDING ?auto_25714 ) ( CLEAR ?auto_25713 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25713 ?auto_25714 )
      ( MAKE-5PILE ?auto_25713 ?auto_25714 ?auto_25715 ?auto_25716 ?auto_25717 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25719 - BLOCK
      ?auto_25720 - BLOCK
      ?auto_25721 - BLOCK
      ?auto_25722 - BLOCK
      ?auto_25723 - BLOCK
    )
    :vars
    (
      ?auto_25724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25719 ) ( not ( = ?auto_25719 ?auto_25720 ) ) ( not ( = ?auto_25719 ?auto_25721 ) ) ( not ( = ?auto_25719 ?auto_25722 ) ) ( not ( = ?auto_25719 ?auto_25723 ) ) ( not ( = ?auto_25720 ?auto_25721 ) ) ( not ( = ?auto_25720 ?auto_25722 ) ) ( not ( = ?auto_25720 ?auto_25723 ) ) ( not ( = ?auto_25721 ?auto_25722 ) ) ( not ( = ?auto_25721 ?auto_25723 ) ) ( not ( = ?auto_25722 ?auto_25723 ) ) ( ON ?auto_25723 ?auto_25724 ) ( not ( = ?auto_25719 ?auto_25724 ) ) ( not ( = ?auto_25720 ?auto_25724 ) ) ( not ( = ?auto_25721 ?auto_25724 ) ) ( not ( = ?auto_25722 ?auto_25724 ) ) ( not ( = ?auto_25723 ?auto_25724 ) ) ( ON ?auto_25722 ?auto_25723 ) ( ON-TABLE ?auto_25724 ) ( ON ?auto_25721 ?auto_25722 ) ( CLEAR ?auto_25719 ) ( ON ?auto_25720 ?auto_25721 ) ( CLEAR ?auto_25720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25724 ?auto_25723 ?auto_25722 ?auto_25721 )
      ( MAKE-5PILE ?auto_25719 ?auto_25720 ?auto_25721 ?auto_25722 ?auto_25723 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25725 - BLOCK
      ?auto_25726 - BLOCK
      ?auto_25727 - BLOCK
      ?auto_25728 - BLOCK
      ?auto_25729 - BLOCK
    )
    :vars
    (
      ?auto_25730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25725 ?auto_25726 ) ) ( not ( = ?auto_25725 ?auto_25727 ) ) ( not ( = ?auto_25725 ?auto_25728 ) ) ( not ( = ?auto_25725 ?auto_25729 ) ) ( not ( = ?auto_25726 ?auto_25727 ) ) ( not ( = ?auto_25726 ?auto_25728 ) ) ( not ( = ?auto_25726 ?auto_25729 ) ) ( not ( = ?auto_25727 ?auto_25728 ) ) ( not ( = ?auto_25727 ?auto_25729 ) ) ( not ( = ?auto_25728 ?auto_25729 ) ) ( ON ?auto_25729 ?auto_25730 ) ( not ( = ?auto_25725 ?auto_25730 ) ) ( not ( = ?auto_25726 ?auto_25730 ) ) ( not ( = ?auto_25727 ?auto_25730 ) ) ( not ( = ?auto_25728 ?auto_25730 ) ) ( not ( = ?auto_25729 ?auto_25730 ) ) ( ON ?auto_25728 ?auto_25729 ) ( ON-TABLE ?auto_25730 ) ( ON ?auto_25727 ?auto_25728 ) ( ON ?auto_25726 ?auto_25727 ) ( CLEAR ?auto_25726 ) ( HOLDING ?auto_25725 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25725 )
      ( MAKE-5PILE ?auto_25725 ?auto_25726 ?auto_25727 ?auto_25728 ?auto_25729 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25731 - BLOCK
      ?auto_25732 - BLOCK
      ?auto_25733 - BLOCK
      ?auto_25734 - BLOCK
      ?auto_25735 - BLOCK
    )
    :vars
    (
      ?auto_25736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25731 ?auto_25732 ) ) ( not ( = ?auto_25731 ?auto_25733 ) ) ( not ( = ?auto_25731 ?auto_25734 ) ) ( not ( = ?auto_25731 ?auto_25735 ) ) ( not ( = ?auto_25732 ?auto_25733 ) ) ( not ( = ?auto_25732 ?auto_25734 ) ) ( not ( = ?auto_25732 ?auto_25735 ) ) ( not ( = ?auto_25733 ?auto_25734 ) ) ( not ( = ?auto_25733 ?auto_25735 ) ) ( not ( = ?auto_25734 ?auto_25735 ) ) ( ON ?auto_25735 ?auto_25736 ) ( not ( = ?auto_25731 ?auto_25736 ) ) ( not ( = ?auto_25732 ?auto_25736 ) ) ( not ( = ?auto_25733 ?auto_25736 ) ) ( not ( = ?auto_25734 ?auto_25736 ) ) ( not ( = ?auto_25735 ?auto_25736 ) ) ( ON ?auto_25734 ?auto_25735 ) ( ON-TABLE ?auto_25736 ) ( ON ?auto_25733 ?auto_25734 ) ( ON ?auto_25732 ?auto_25733 ) ( ON ?auto_25731 ?auto_25732 ) ( CLEAR ?auto_25731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25736 ?auto_25735 ?auto_25734 ?auto_25733 ?auto_25732 )
      ( MAKE-5PILE ?auto_25731 ?auto_25732 ?auto_25733 ?auto_25734 ?auto_25735 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25741 - BLOCK
      ?auto_25742 - BLOCK
      ?auto_25743 - BLOCK
      ?auto_25744 - BLOCK
    )
    :vars
    (
      ?auto_25745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25745 ?auto_25744 ) ( CLEAR ?auto_25745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25741 ) ( ON ?auto_25742 ?auto_25741 ) ( ON ?auto_25743 ?auto_25742 ) ( ON ?auto_25744 ?auto_25743 ) ( not ( = ?auto_25741 ?auto_25742 ) ) ( not ( = ?auto_25741 ?auto_25743 ) ) ( not ( = ?auto_25741 ?auto_25744 ) ) ( not ( = ?auto_25741 ?auto_25745 ) ) ( not ( = ?auto_25742 ?auto_25743 ) ) ( not ( = ?auto_25742 ?auto_25744 ) ) ( not ( = ?auto_25742 ?auto_25745 ) ) ( not ( = ?auto_25743 ?auto_25744 ) ) ( not ( = ?auto_25743 ?auto_25745 ) ) ( not ( = ?auto_25744 ?auto_25745 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25745 ?auto_25744 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25757 - BLOCK
      ?auto_25758 - BLOCK
      ?auto_25759 - BLOCK
      ?auto_25760 - BLOCK
    )
    :vars
    (
      ?auto_25761 - BLOCK
      ?auto_25762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25757 ) ( ON ?auto_25758 ?auto_25757 ) ( ON ?auto_25759 ?auto_25758 ) ( not ( = ?auto_25757 ?auto_25758 ) ) ( not ( = ?auto_25757 ?auto_25759 ) ) ( not ( = ?auto_25757 ?auto_25760 ) ) ( not ( = ?auto_25757 ?auto_25761 ) ) ( not ( = ?auto_25758 ?auto_25759 ) ) ( not ( = ?auto_25758 ?auto_25760 ) ) ( not ( = ?auto_25758 ?auto_25761 ) ) ( not ( = ?auto_25759 ?auto_25760 ) ) ( not ( = ?auto_25759 ?auto_25761 ) ) ( not ( = ?auto_25760 ?auto_25761 ) ) ( ON ?auto_25761 ?auto_25762 ) ( CLEAR ?auto_25761 ) ( not ( = ?auto_25757 ?auto_25762 ) ) ( not ( = ?auto_25758 ?auto_25762 ) ) ( not ( = ?auto_25759 ?auto_25762 ) ) ( not ( = ?auto_25760 ?auto_25762 ) ) ( not ( = ?auto_25761 ?auto_25762 ) ) ( HOLDING ?auto_25760 ) ( CLEAR ?auto_25759 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25757 ?auto_25758 ?auto_25759 ?auto_25760 ?auto_25761 )
      ( MAKE-4PILE ?auto_25757 ?auto_25758 ?auto_25759 ?auto_25760 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25763 - BLOCK
      ?auto_25764 - BLOCK
      ?auto_25765 - BLOCK
      ?auto_25766 - BLOCK
    )
    :vars
    (
      ?auto_25767 - BLOCK
      ?auto_25768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25763 ) ( ON ?auto_25764 ?auto_25763 ) ( ON ?auto_25765 ?auto_25764 ) ( not ( = ?auto_25763 ?auto_25764 ) ) ( not ( = ?auto_25763 ?auto_25765 ) ) ( not ( = ?auto_25763 ?auto_25766 ) ) ( not ( = ?auto_25763 ?auto_25767 ) ) ( not ( = ?auto_25764 ?auto_25765 ) ) ( not ( = ?auto_25764 ?auto_25766 ) ) ( not ( = ?auto_25764 ?auto_25767 ) ) ( not ( = ?auto_25765 ?auto_25766 ) ) ( not ( = ?auto_25765 ?auto_25767 ) ) ( not ( = ?auto_25766 ?auto_25767 ) ) ( ON ?auto_25767 ?auto_25768 ) ( not ( = ?auto_25763 ?auto_25768 ) ) ( not ( = ?auto_25764 ?auto_25768 ) ) ( not ( = ?auto_25765 ?auto_25768 ) ) ( not ( = ?auto_25766 ?auto_25768 ) ) ( not ( = ?auto_25767 ?auto_25768 ) ) ( CLEAR ?auto_25765 ) ( ON ?auto_25766 ?auto_25767 ) ( CLEAR ?auto_25766 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25768 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25768 ?auto_25767 )
      ( MAKE-4PILE ?auto_25763 ?auto_25764 ?auto_25765 ?auto_25766 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25769 - BLOCK
      ?auto_25770 - BLOCK
      ?auto_25771 - BLOCK
      ?auto_25772 - BLOCK
    )
    :vars
    (
      ?auto_25773 - BLOCK
      ?auto_25774 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25769 ) ( ON ?auto_25770 ?auto_25769 ) ( not ( = ?auto_25769 ?auto_25770 ) ) ( not ( = ?auto_25769 ?auto_25771 ) ) ( not ( = ?auto_25769 ?auto_25772 ) ) ( not ( = ?auto_25769 ?auto_25773 ) ) ( not ( = ?auto_25770 ?auto_25771 ) ) ( not ( = ?auto_25770 ?auto_25772 ) ) ( not ( = ?auto_25770 ?auto_25773 ) ) ( not ( = ?auto_25771 ?auto_25772 ) ) ( not ( = ?auto_25771 ?auto_25773 ) ) ( not ( = ?auto_25772 ?auto_25773 ) ) ( ON ?auto_25773 ?auto_25774 ) ( not ( = ?auto_25769 ?auto_25774 ) ) ( not ( = ?auto_25770 ?auto_25774 ) ) ( not ( = ?auto_25771 ?auto_25774 ) ) ( not ( = ?auto_25772 ?auto_25774 ) ) ( not ( = ?auto_25773 ?auto_25774 ) ) ( ON ?auto_25772 ?auto_25773 ) ( CLEAR ?auto_25772 ) ( ON-TABLE ?auto_25774 ) ( HOLDING ?auto_25771 ) ( CLEAR ?auto_25770 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25769 ?auto_25770 ?auto_25771 )
      ( MAKE-4PILE ?auto_25769 ?auto_25770 ?auto_25771 ?auto_25772 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25775 - BLOCK
      ?auto_25776 - BLOCK
      ?auto_25777 - BLOCK
      ?auto_25778 - BLOCK
    )
    :vars
    (
      ?auto_25780 - BLOCK
      ?auto_25779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25775 ) ( ON ?auto_25776 ?auto_25775 ) ( not ( = ?auto_25775 ?auto_25776 ) ) ( not ( = ?auto_25775 ?auto_25777 ) ) ( not ( = ?auto_25775 ?auto_25778 ) ) ( not ( = ?auto_25775 ?auto_25780 ) ) ( not ( = ?auto_25776 ?auto_25777 ) ) ( not ( = ?auto_25776 ?auto_25778 ) ) ( not ( = ?auto_25776 ?auto_25780 ) ) ( not ( = ?auto_25777 ?auto_25778 ) ) ( not ( = ?auto_25777 ?auto_25780 ) ) ( not ( = ?auto_25778 ?auto_25780 ) ) ( ON ?auto_25780 ?auto_25779 ) ( not ( = ?auto_25775 ?auto_25779 ) ) ( not ( = ?auto_25776 ?auto_25779 ) ) ( not ( = ?auto_25777 ?auto_25779 ) ) ( not ( = ?auto_25778 ?auto_25779 ) ) ( not ( = ?auto_25780 ?auto_25779 ) ) ( ON ?auto_25778 ?auto_25780 ) ( ON-TABLE ?auto_25779 ) ( CLEAR ?auto_25776 ) ( ON ?auto_25777 ?auto_25778 ) ( CLEAR ?auto_25777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25779 ?auto_25780 ?auto_25778 )
      ( MAKE-4PILE ?auto_25775 ?auto_25776 ?auto_25777 ?auto_25778 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25781 - BLOCK
      ?auto_25782 - BLOCK
      ?auto_25783 - BLOCK
      ?auto_25784 - BLOCK
    )
    :vars
    (
      ?auto_25786 - BLOCK
      ?auto_25785 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25781 ) ( not ( = ?auto_25781 ?auto_25782 ) ) ( not ( = ?auto_25781 ?auto_25783 ) ) ( not ( = ?auto_25781 ?auto_25784 ) ) ( not ( = ?auto_25781 ?auto_25786 ) ) ( not ( = ?auto_25782 ?auto_25783 ) ) ( not ( = ?auto_25782 ?auto_25784 ) ) ( not ( = ?auto_25782 ?auto_25786 ) ) ( not ( = ?auto_25783 ?auto_25784 ) ) ( not ( = ?auto_25783 ?auto_25786 ) ) ( not ( = ?auto_25784 ?auto_25786 ) ) ( ON ?auto_25786 ?auto_25785 ) ( not ( = ?auto_25781 ?auto_25785 ) ) ( not ( = ?auto_25782 ?auto_25785 ) ) ( not ( = ?auto_25783 ?auto_25785 ) ) ( not ( = ?auto_25784 ?auto_25785 ) ) ( not ( = ?auto_25786 ?auto_25785 ) ) ( ON ?auto_25784 ?auto_25786 ) ( ON-TABLE ?auto_25785 ) ( ON ?auto_25783 ?auto_25784 ) ( CLEAR ?auto_25783 ) ( HOLDING ?auto_25782 ) ( CLEAR ?auto_25781 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25781 ?auto_25782 )
      ( MAKE-4PILE ?auto_25781 ?auto_25782 ?auto_25783 ?auto_25784 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25787 - BLOCK
      ?auto_25788 - BLOCK
      ?auto_25789 - BLOCK
      ?auto_25790 - BLOCK
    )
    :vars
    (
      ?auto_25791 - BLOCK
      ?auto_25792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25787 ) ( not ( = ?auto_25787 ?auto_25788 ) ) ( not ( = ?auto_25787 ?auto_25789 ) ) ( not ( = ?auto_25787 ?auto_25790 ) ) ( not ( = ?auto_25787 ?auto_25791 ) ) ( not ( = ?auto_25788 ?auto_25789 ) ) ( not ( = ?auto_25788 ?auto_25790 ) ) ( not ( = ?auto_25788 ?auto_25791 ) ) ( not ( = ?auto_25789 ?auto_25790 ) ) ( not ( = ?auto_25789 ?auto_25791 ) ) ( not ( = ?auto_25790 ?auto_25791 ) ) ( ON ?auto_25791 ?auto_25792 ) ( not ( = ?auto_25787 ?auto_25792 ) ) ( not ( = ?auto_25788 ?auto_25792 ) ) ( not ( = ?auto_25789 ?auto_25792 ) ) ( not ( = ?auto_25790 ?auto_25792 ) ) ( not ( = ?auto_25791 ?auto_25792 ) ) ( ON ?auto_25790 ?auto_25791 ) ( ON-TABLE ?auto_25792 ) ( ON ?auto_25789 ?auto_25790 ) ( CLEAR ?auto_25787 ) ( ON ?auto_25788 ?auto_25789 ) ( CLEAR ?auto_25788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25792 ?auto_25791 ?auto_25790 ?auto_25789 )
      ( MAKE-4PILE ?auto_25787 ?auto_25788 ?auto_25789 ?auto_25790 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25793 - BLOCK
      ?auto_25794 - BLOCK
      ?auto_25795 - BLOCK
      ?auto_25796 - BLOCK
    )
    :vars
    (
      ?auto_25798 - BLOCK
      ?auto_25797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25793 ?auto_25794 ) ) ( not ( = ?auto_25793 ?auto_25795 ) ) ( not ( = ?auto_25793 ?auto_25796 ) ) ( not ( = ?auto_25793 ?auto_25798 ) ) ( not ( = ?auto_25794 ?auto_25795 ) ) ( not ( = ?auto_25794 ?auto_25796 ) ) ( not ( = ?auto_25794 ?auto_25798 ) ) ( not ( = ?auto_25795 ?auto_25796 ) ) ( not ( = ?auto_25795 ?auto_25798 ) ) ( not ( = ?auto_25796 ?auto_25798 ) ) ( ON ?auto_25798 ?auto_25797 ) ( not ( = ?auto_25793 ?auto_25797 ) ) ( not ( = ?auto_25794 ?auto_25797 ) ) ( not ( = ?auto_25795 ?auto_25797 ) ) ( not ( = ?auto_25796 ?auto_25797 ) ) ( not ( = ?auto_25798 ?auto_25797 ) ) ( ON ?auto_25796 ?auto_25798 ) ( ON-TABLE ?auto_25797 ) ( ON ?auto_25795 ?auto_25796 ) ( ON ?auto_25794 ?auto_25795 ) ( CLEAR ?auto_25794 ) ( HOLDING ?auto_25793 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25793 )
      ( MAKE-4PILE ?auto_25793 ?auto_25794 ?auto_25795 ?auto_25796 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25799 - BLOCK
      ?auto_25800 - BLOCK
      ?auto_25801 - BLOCK
      ?auto_25802 - BLOCK
    )
    :vars
    (
      ?auto_25804 - BLOCK
      ?auto_25803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25799 ?auto_25800 ) ) ( not ( = ?auto_25799 ?auto_25801 ) ) ( not ( = ?auto_25799 ?auto_25802 ) ) ( not ( = ?auto_25799 ?auto_25804 ) ) ( not ( = ?auto_25800 ?auto_25801 ) ) ( not ( = ?auto_25800 ?auto_25802 ) ) ( not ( = ?auto_25800 ?auto_25804 ) ) ( not ( = ?auto_25801 ?auto_25802 ) ) ( not ( = ?auto_25801 ?auto_25804 ) ) ( not ( = ?auto_25802 ?auto_25804 ) ) ( ON ?auto_25804 ?auto_25803 ) ( not ( = ?auto_25799 ?auto_25803 ) ) ( not ( = ?auto_25800 ?auto_25803 ) ) ( not ( = ?auto_25801 ?auto_25803 ) ) ( not ( = ?auto_25802 ?auto_25803 ) ) ( not ( = ?auto_25804 ?auto_25803 ) ) ( ON ?auto_25802 ?auto_25804 ) ( ON-TABLE ?auto_25803 ) ( ON ?auto_25801 ?auto_25802 ) ( ON ?auto_25800 ?auto_25801 ) ( ON ?auto_25799 ?auto_25800 ) ( CLEAR ?auto_25799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25803 ?auto_25804 ?auto_25802 ?auto_25801 ?auto_25800 )
      ( MAKE-4PILE ?auto_25799 ?auto_25800 ?auto_25801 ?auto_25802 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25806 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_25806 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_25806 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25807 - BLOCK
    )
    :vars
    (
      ?auto_25808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25807 ?auto_25808 ) ( CLEAR ?auto_25807 ) ( HAND-EMPTY ) ( not ( = ?auto_25807 ?auto_25808 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25807 ?auto_25808 )
      ( MAKE-1PILE ?auto_25807 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25809 - BLOCK
    )
    :vars
    (
      ?auto_25810 - BLOCK
      ?auto_25813 - BLOCK
      ?auto_25811 - BLOCK
      ?auto_25812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25809 ?auto_25810 ) ) ( HOLDING ?auto_25809 ) ( CLEAR ?auto_25810 ) ( ON-TABLE ?auto_25813 ) ( ON ?auto_25811 ?auto_25813 ) ( ON ?auto_25812 ?auto_25811 ) ( ON ?auto_25810 ?auto_25812 ) ( not ( = ?auto_25813 ?auto_25811 ) ) ( not ( = ?auto_25813 ?auto_25812 ) ) ( not ( = ?auto_25813 ?auto_25810 ) ) ( not ( = ?auto_25813 ?auto_25809 ) ) ( not ( = ?auto_25811 ?auto_25812 ) ) ( not ( = ?auto_25811 ?auto_25810 ) ) ( not ( = ?auto_25811 ?auto_25809 ) ) ( not ( = ?auto_25812 ?auto_25810 ) ) ( not ( = ?auto_25812 ?auto_25809 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25813 ?auto_25811 ?auto_25812 ?auto_25810 ?auto_25809 )
      ( MAKE-1PILE ?auto_25809 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25814 - BLOCK
    )
    :vars
    (
      ?auto_25815 - BLOCK
      ?auto_25817 - BLOCK
      ?auto_25818 - BLOCK
      ?auto_25816 - BLOCK
      ?auto_25819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25814 ?auto_25815 ) ) ( CLEAR ?auto_25815 ) ( ON-TABLE ?auto_25817 ) ( ON ?auto_25818 ?auto_25817 ) ( ON ?auto_25816 ?auto_25818 ) ( ON ?auto_25815 ?auto_25816 ) ( not ( = ?auto_25817 ?auto_25818 ) ) ( not ( = ?auto_25817 ?auto_25816 ) ) ( not ( = ?auto_25817 ?auto_25815 ) ) ( not ( = ?auto_25817 ?auto_25814 ) ) ( not ( = ?auto_25818 ?auto_25816 ) ) ( not ( = ?auto_25818 ?auto_25815 ) ) ( not ( = ?auto_25818 ?auto_25814 ) ) ( not ( = ?auto_25816 ?auto_25815 ) ) ( not ( = ?auto_25816 ?auto_25814 ) ) ( ON ?auto_25814 ?auto_25819 ) ( CLEAR ?auto_25814 ) ( HAND-EMPTY ) ( not ( = ?auto_25814 ?auto_25819 ) ) ( not ( = ?auto_25815 ?auto_25819 ) ) ( not ( = ?auto_25817 ?auto_25819 ) ) ( not ( = ?auto_25818 ?auto_25819 ) ) ( not ( = ?auto_25816 ?auto_25819 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25814 ?auto_25819 )
      ( MAKE-1PILE ?auto_25814 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25820 - BLOCK
    )
    :vars
    (
      ?auto_25823 - BLOCK
      ?auto_25825 - BLOCK
      ?auto_25822 - BLOCK
      ?auto_25824 - BLOCK
      ?auto_25821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25820 ?auto_25823 ) ) ( ON-TABLE ?auto_25825 ) ( ON ?auto_25822 ?auto_25825 ) ( ON ?auto_25824 ?auto_25822 ) ( not ( = ?auto_25825 ?auto_25822 ) ) ( not ( = ?auto_25825 ?auto_25824 ) ) ( not ( = ?auto_25825 ?auto_25823 ) ) ( not ( = ?auto_25825 ?auto_25820 ) ) ( not ( = ?auto_25822 ?auto_25824 ) ) ( not ( = ?auto_25822 ?auto_25823 ) ) ( not ( = ?auto_25822 ?auto_25820 ) ) ( not ( = ?auto_25824 ?auto_25823 ) ) ( not ( = ?auto_25824 ?auto_25820 ) ) ( ON ?auto_25820 ?auto_25821 ) ( CLEAR ?auto_25820 ) ( not ( = ?auto_25820 ?auto_25821 ) ) ( not ( = ?auto_25823 ?auto_25821 ) ) ( not ( = ?auto_25825 ?auto_25821 ) ) ( not ( = ?auto_25822 ?auto_25821 ) ) ( not ( = ?auto_25824 ?auto_25821 ) ) ( HOLDING ?auto_25823 ) ( CLEAR ?auto_25824 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25825 ?auto_25822 ?auto_25824 ?auto_25823 )
      ( MAKE-1PILE ?auto_25820 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25826 - BLOCK
    )
    :vars
    (
      ?auto_25827 - BLOCK
      ?auto_25828 - BLOCK
      ?auto_25830 - BLOCK
      ?auto_25831 - BLOCK
      ?auto_25829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25826 ?auto_25827 ) ) ( ON-TABLE ?auto_25828 ) ( ON ?auto_25830 ?auto_25828 ) ( ON ?auto_25831 ?auto_25830 ) ( not ( = ?auto_25828 ?auto_25830 ) ) ( not ( = ?auto_25828 ?auto_25831 ) ) ( not ( = ?auto_25828 ?auto_25827 ) ) ( not ( = ?auto_25828 ?auto_25826 ) ) ( not ( = ?auto_25830 ?auto_25831 ) ) ( not ( = ?auto_25830 ?auto_25827 ) ) ( not ( = ?auto_25830 ?auto_25826 ) ) ( not ( = ?auto_25831 ?auto_25827 ) ) ( not ( = ?auto_25831 ?auto_25826 ) ) ( ON ?auto_25826 ?auto_25829 ) ( not ( = ?auto_25826 ?auto_25829 ) ) ( not ( = ?auto_25827 ?auto_25829 ) ) ( not ( = ?auto_25828 ?auto_25829 ) ) ( not ( = ?auto_25830 ?auto_25829 ) ) ( not ( = ?auto_25831 ?auto_25829 ) ) ( CLEAR ?auto_25831 ) ( ON ?auto_25827 ?auto_25826 ) ( CLEAR ?auto_25827 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25829 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25829 ?auto_25826 )
      ( MAKE-1PILE ?auto_25826 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25832 - BLOCK
    )
    :vars
    (
      ?auto_25836 - BLOCK
      ?auto_25834 - BLOCK
      ?auto_25835 - BLOCK
      ?auto_25837 - BLOCK
      ?auto_25833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25832 ?auto_25836 ) ) ( ON-TABLE ?auto_25834 ) ( ON ?auto_25835 ?auto_25834 ) ( not ( = ?auto_25834 ?auto_25835 ) ) ( not ( = ?auto_25834 ?auto_25837 ) ) ( not ( = ?auto_25834 ?auto_25836 ) ) ( not ( = ?auto_25834 ?auto_25832 ) ) ( not ( = ?auto_25835 ?auto_25837 ) ) ( not ( = ?auto_25835 ?auto_25836 ) ) ( not ( = ?auto_25835 ?auto_25832 ) ) ( not ( = ?auto_25837 ?auto_25836 ) ) ( not ( = ?auto_25837 ?auto_25832 ) ) ( ON ?auto_25832 ?auto_25833 ) ( not ( = ?auto_25832 ?auto_25833 ) ) ( not ( = ?auto_25836 ?auto_25833 ) ) ( not ( = ?auto_25834 ?auto_25833 ) ) ( not ( = ?auto_25835 ?auto_25833 ) ) ( not ( = ?auto_25837 ?auto_25833 ) ) ( ON ?auto_25836 ?auto_25832 ) ( CLEAR ?auto_25836 ) ( ON-TABLE ?auto_25833 ) ( HOLDING ?auto_25837 ) ( CLEAR ?auto_25835 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25834 ?auto_25835 ?auto_25837 )
      ( MAKE-1PILE ?auto_25832 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25838 - BLOCK
    )
    :vars
    (
      ?auto_25839 - BLOCK
      ?auto_25841 - BLOCK
      ?auto_25843 - BLOCK
      ?auto_25842 - BLOCK
      ?auto_25840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25838 ?auto_25839 ) ) ( ON-TABLE ?auto_25841 ) ( ON ?auto_25843 ?auto_25841 ) ( not ( = ?auto_25841 ?auto_25843 ) ) ( not ( = ?auto_25841 ?auto_25842 ) ) ( not ( = ?auto_25841 ?auto_25839 ) ) ( not ( = ?auto_25841 ?auto_25838 ) ) ( not ( = ?auto_25843 ?auto_25842 ) ) ( not ( = ?auto_25843 ?auto_25839 ) ) ( not ( = ?auto_25843 ?auto_25838 ) ) ( not ( = ?auto_25842 ?auto_25839 ) ) ( not ( = ?auto_25842 ?auto_25838 ) ) ( ON ?auto_25838 ?auto_25840 ) ( not ( = ?auto_25838 ?auto_25840 ) ) ( not ( = ?auto_25839 ?auto_25840 ) ) ( not ( = ?auto_25841 ?auto_25840 ) ) ( not ( = ?auto_25843 ?auto_25840 ) ) ( not ( = ?auto_25842 ?auto_25840 ) ) ( ON ?auto_25839 ?auto_25838 ) ( ON-TABLE ?auto_25840 ) ( CLEAR ?auto_25843 ) ( ON ?auto_25842 ?auto_25839 ) ( CLEAR ?auto_25842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25840 ?auto_25838 ?auto_25839 )
      ( MAKE-1PILE ?auto_25838 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25844 - BLOCK
    )
    :vars
    (
      ?auto_25846 - BLOCK
      ?auto_25848 - BLOCK
      ?auto_25845 - BLOCK
      ?auto_25847 - BLOCK
      ?auto_25849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25844 ?auto_25846 ) ) ( ON-TABLE ?auto_25848 ) ( not ( = ?auto_25848 ?auto_25845 ) ) ( not ( = ?auto_25848 ?auto_25847 ) ) ( not ( = ?auto_25848 ?auto_25846 ) ) ( not ( = ?auto_25848 ?auto_25844 ) ) ( not ( = ?auto_25845 ?auto_25847 ) ) ( not ( = ?auto_25845 ?auto_25846 ) ) ( not ( = ?auto_25845 ?auto_25844 ) ) ( not ( = ?auto_25847 ?auto_25846 ) ) ( not ( = ?auto_25847 ?auto_25844 ) ) ( ON ?auto_25844 ?auto_25849 ) ( not ( = ?auto_25844 ?auto_25849 ) ) ( not ( = ?auto_25846 ?auto_25849 ) ) ( not ( = ?auto_25848 ?auto_25849 ) ) ( not ( = ?auto_25845 ?auto_25849 ) ) ( not ( = ?auto_25847 ?auto_25849 ) ) ( ON ?auto_25846 ?auto_25844 ) ( ON-TABLE ?auto_25849 ) ( ON ?auto_25847 ?auto_25846 ) ( CLEAR ?auto_25847 ) ( HOLDING ?auto_25845 ) ( CLEAR ?auto_25848 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25848 ?auto_25845 )
      ( MAKE-1PILE ?auto_25844 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25850 - BLOCK
    )
    :vars
    (
      ?auto_25855 - BLOCK
      ?auto_25853 - BLOCK
      ?auto_25851 - BLOCK
      ?auto_25854 - BLOCK
      ?auto_25852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25850 ?auto_25855 ) ) ( ON-TABLE ?auto_25853 ) ( not ( = ?auto_25853 ?auto_25851 ) ) ( not ( = ?auto_25853 ?auto_25854 ) ) ( not ( = ?auto_25853 ?auto_25855 ) ) ( not ( = ?auto_25853 ?auto_25850 ) ) ( not ( = ?auto_25851 ?auto_25854 ) ) ( not ( = ?auto_25851 ?auto_25855 ) ) ( not ( = ?auto_25851 ?auto_25850 ) ) ( not ( = ?auto_25854 ?auto_25855 ) ) ( not ( = ?auto_25854 ?auto_25850 ) ) ( ON ?auto_25850 ?auto_25852 ) ( not ( = ?auto_25850 ?auto_25852 ) ) ( not ( = ?auto_25855 ?auto_25852 ) ) ( not ( = ?auto_25853 ?auto_25852 ) ) ( not ( = ?auto_25851 ?auto_25852 ) ) ( not ( = ?auto_25854 ?auto_25852 ) ) ( ON ?auto_25855 ?auto_25850 ) ( ON-TABLE ?auto_25852 ) ( ON ?auto_25854 ?auto_25855 ) ( CLEAR ?auto_25853 ) ( ON ?auto_25851 ?auto_25854 ) ( CLEAR ?auto_25851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25852 ?auto_25850 ?auto_25855 ?auto_25854 )
      ( MAKE-1PILE ?auto_25850 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25856 - BLOCK
    )
    :vars
    (
      ?auto_25861 - BLOCK
      ?auto_25859 - BLOCK
      ?auto_25858 - BLOCK
      ?auto_25860 - BLOCK
      ?auto_25857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25856 ?auto_25861 ) ) ( not ( = ?auto_25859 ?auto_25858 ) ) ( not ( = ?auto_25859 ?auto_25860 ) ) ( not ( = ?auto_25859 ?auto_25861 ) ) ( not ( = ?auto_25859 ?auto_25856 ) ) ( not ( = ?auto_25858 ?auto_25860 ) ) ( not ( = ?auto_25858 ?auto_25861 ) ) ( not ( = ?auto_25858 ?auto_25856 ) ) ( not ( = ?auto_25860 ?auto_25861 ) ) ( not ( = ?auto_25860 ?auto_25856 ) ) ( ON ?auto_25856 ?auto_25857 ) ( not ( = ?auto_25856 ?auto_25857 ) ) ( not ( = ?auto_25861 ?auto_25857 ) ) ( not ( = ?auto_25859 ?auto_25857 ) ) ( not ( = ?auto_25858 ?auto_25857 ) ) ( not ( = ?auto_25860 ?auto_25857 ) ) ( ON ?auto_25861 ?auto_25856 ) ( ON-TABLE ?auto_25857 ) ( ON ?auto_25860 ?auto_25861 ) ( ON ?auto_25858 ?auto_25860 ) ( CLEAR ?auto_25858 ) ( HOLDING ?auto_25859 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25859 )
      ( MAKE-1PILE ?auto_25856 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25862 - BLOCK
    )
    :vars
    (
      ?auto_25864 - BLOCK
      ?auto_25866 - BLOCK
      ?auto_25863 - BLOCK
      ?auto_25867 - BLOCK
      ?auto_25865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25862 ?auto_25864 ) ) ( not ( = ?auto_25866 ?auto_25863 ) ) ( not ( = ?auto_25866 ?auto_25867 ) ) ( not ( = ?auto_25866 ?auto_25864 ) ) ( not ( = ?auto_25866 ?auto_25862 ) ) ( not ( = ?auto_25863 ?auto_25867 ) ) ( not ( = ?auto_25863 ?auto_25864 ) ) ( not ( = ?auto_25863 ?auto_25862 ) ) ( not ( = ?auto_25867 ?auto_25864 ) ) ( not ( = ?auto_25867 ?auto_25862 ) ) ( ON ?auto_25862 ?auto_25865 ) ( not ( = ?auto_25862 ?auto_25865 ) ) ( not ( = ?auto_25864 ?auto_25865 ) ) ( not ( = ?auto_25866 ?auto_25865 ) ) ( not ( = ?auto_25863 ?auto_25865 ) ) ( not ( = ?auto_25867 ?auto_25865 ) ) ( ON ?auto_25864 ?auto_25862 ) ( ON-TABLE ?auto_25865 ) ( ON ?auto_25867 ?auto_25864 ) ( ON ?auto_25863 ?auto_25867 ) ( ON ?auto_25866 ?auto_25863 ) ( CLEAR ?auto_25866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25865 ?auto_25862 ?auto_25864 ?auto_25867 ?auto_25863 )
      ( MAKE-1PILE ?auto_25862 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25871 - BLOCK
      ?auto_25872 - BLOCK
      ?auto_25873 - BLOCK
    )
    :vars
    (
      ?auto_25874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25874 ?auto_25873 ) ( CLEAR ?auto_25874 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25871 ) ( ON ?auto_25872 ?auto_25871 ) ( ON ?auto_25873 ?auto_25872 ) ( not ( = ?auto_25871 ?auto_25872 ) ) ( not ( = ?auto_25871 ?auto_25873 ) ) ( not ( = ?auto_25871 ?auto_25874 ) ) ( not ( = ?auto_25872 ?auto_25873 ) ) ( not ( = ?auto_25872 ?auto_25874 ) ) ( not ( = ?auto_25873 ?auto_25874 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25874 ?auto_25873 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25875 - BLOCK
      ?auto_25876 - BLOCK
      ?auto_25877 - BLOCK
    )
    :vars
    (
      ?auto_25878 - BLOCK
      ?auto_25879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25878 ?auto_25877 ) ( CLEAR ?auto_25878 ) ( ON-TABLE ?auto_25875 ) ( ON ?auto_25876 ?auto_25875 ) ( ON ?auto_25877 ?auto_25876 ) ( not ( = ?auto_25875 ?auto_25876 ) ) ( not ( = ?auto_25875 ?auto_25877 ) ) ( not ( = ?auto_25875 ?auto_25878 ) ) ( not ( = ?auto_25876 ?auto_25877 ) ) ( not ( = ?auto_25876 ?auto_25878 ) ) ( not ( = ?auto_25877 ?auto_25878 ) ) ( HOLDING ?auto_25879 ) ( not ( = ?auto_25875 ?auto_25879 ) ) ( not ( = ?auto_25876 ?auto_25879 ) ) ( not ( = ?auto_25877 ?auto_25879 ) ) ( not ( = ?auto_25878 ?auto_25879 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_25879 )
      ( MAKE-3PILE ?auto_25875 ?auto_25876 ?auto_25877 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25880 - BLOCK
      ?auto_25881 - BLOCK
      ?auto_25882 - BLOCK
    )
    :vars
    (
      ?auto_25884 - BLOCK
      ?auto_25883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25884 ?auto_25882 ) ( ON-TABLE ?auto_25880 ) ( ON ?auto_25881 ?auto_25880 ) ( ON ?auto_25882 ?auto_25881 ) ( not ( = ?auto_25880 ?auto_25881 ) ) ( not ( = ?auto_25880 ?auto_25882 ) ) ( not ( = ?auto_25880 ?auto_25884 ) ) ( not ( = ?auto_25881 ?auto_25882 ) ) ( not ( = ?auto_25881 ?auto_25884 ) ) ( not ( = ?auto_25882 ?auto_25884 ) ) ( not ( = ?auto_25880 ?auto_25883 ) ) ( not ( = ?auto_25881 ?auto_25883 ) ) ( not ( = ?auto_25882 ?auto_25883 ) ) ( not ( = ?auto_25884 ?auto_25883 ) ) ( ON ?auto_25883 ?auto_25884 ) ( CLEAR ?auto_25883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25880 ?auto_25881 ?auto_25882 ?auto_25884 )
      ( MAKE-3PILE ?auto_25880 ?auto_25881 ?auto_25882 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25885 - BLOCK
      ?auto_25886 - BLOCK
      ?auto_25887 - BLOCK
    )
    :vars
    (
      ?auto_25888 - BLOCK
      ?auto_25889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25888 ?auto_25887 ) ( ON-TABLE ?auto_25885 ) ( ON ?auto_25886 ?auto_25885 ) ( ON ?auto_25887 ?auto_25886 ) ( not ( = ?auto_25885 ?auto_25886 ) ) ( not ( = ?auto_25885 ?auto_25887 ) ) ( not ( = ?auto_25885 ?auto_25888 ) ) ( not ( = ?auto_25886 ?auto_25887 ) ) ( not ( = ?auto_25886 ?auto_25888 ) ) ( not ( = ?auto_25887 ?auto_25888 ) ) ( not ( = ?auto_25885 ?auto_25889 ) ) ( not ( = ?auto_25886 ?auto_25889 ) ) ( not ( = ?auto_25887 ?auto_25889 ) ) ( not ( = ?auto_25888 ?auto_25889 ) ) ( HOLDING ?auto_25889 ) ( CLEAR ?auto_25888 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25885 ?auto_25886 ?auto_25887 ?auto_25888 ?auto_25889 )
      ( MAKE-3PILE ?auto_25885 ?auto_25886 ?auto_25887 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25890 - BLOCK
      ?auto_25891 - BLOCK
      ?auto_25892 - BLOCK
    )
    :vars
    (
      ?auto_25893 - BLOCK
      ?auto_25894 - BLOCK
      ?auto_25895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25893 ?auto_25892 ) ( ON-TABLE ?auto_25890 ) ( ON ?auto_25891 ?auto_25890 ) ( ON ?auto_25892 ?auto_25891 ) ( not ( = ?auto_25890 ?auto_25891 ) ) ( not ( = ?auto_25890 ?auto_25892 ) ) ( not ( = ?auto_25890 ?auto_25893 ) ) ( not ( = ?auto_25891 ?auto_25892 ) ) ( not ( = ?auto_25891 ?auto_25893 ) ) ( not ( = ?auto_25892 ?auto_25893 ) ) ( not ( = ?auto_25890 ?auto_25894 ) ) ( not ( = ?auto_25891 ?auto_25894 ) ) ( not ( = ?auto_25892 ?auto_25894 ) ) ( not ( = ?auto_25893 ?auto_25894 ) ) ( CLEAR ?auto_25893 ) ( ON ?auto_25894 ?auto_25895 ) ( CLEAR ?auto_25894 ) ( HAND-EMPTY ) ( not ( = ?auto_25890 ?auto_25895 ) ) ( not ( = ?auto_25891 ?auto_25895 ) ) ( not ( = ?auto_25892 ?auto_25895 ) ) ( not ( = ?auto_25893 ?auto_25895 ) ) ( not ( = ?auto_25894 ?auto_25895 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25894 ?auto_25895 )
      ( MAKE-3PILE ?auto_25890 ?auto_25891 ?auto_25892 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25908 - BLOCK
      ?auto_25909 - BLOCK
      ?auto_25910 - BLOCK
    )
    :vars
    (
      ?auto_25913 - BLOCK
      ?auto_25911 - BLOCK
      ?auto_25912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25908 ) ( ON ?auto_25909 ?auto_25908 ) ( not ( = ?auto_25908 ?auto_25909 ) ) ( not ( = ?auto_25908 ?auto_25910 ) ) ( not ( = ?auto_25908 ?auto_25913 ) ) ( not ( = ?auto_25909 ?auto_25910 ) ) ( not ( = ?auto_25909 ?auto_25913 ) ) ( not ( = ?auto_25910 ?auto_25913 ) ) ( not ( = ?auto_25908 ?auto_25911 ) ) ( not ( = ?auto_25909 ?auto_25911 ) ) ( not ( = ?auto_25910 ?auto_25911 ) ) ( not ( = ?auto_25913 ?auto_25911 ) ) ( ON ?auto_25911 ?auto_25912 ) ( not ( = ?auto_25908 ?auto_25912 ) ) ( not ( = ?auto_25909 ?auto_25912 ) ) ( not ( = ?auto_25910 ?auto_25912 ) ) ( not ( = ?auto_25913 ?auto_25912 ) ) ( not ( = ?auto_25911 ?auto_25912 ) ) ( ON ?auto_25913 ?auto_25911 ) ( CLEAR ?auto_25913 ) ( HOLDING ?auto_25910 ) ( CLEAR ?auto_25909 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25908 ?auto_25909 ?auto_25910 ?auto_25913 )
      ( MAKE-3PILE ?auto_25908 ?auto_25909 ?auto_25910 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25914 - BLOCK
      ?auto_25915 - BLOCK
      ?auto_25916 - BLOCK
    )
    :vars
    (
      ?auto_25919 - BLOCK
      ?auto_25918 - BLOCK
      ?auto_25917 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25914 ) ( ON ?auto_25915 ?auto_25914 ) ( not ( = ?auto_25914 ?auto_25915 ) ) ( not ( = ?auto_25914 ?auto_25916 ) ) ( not ( = ?auto_25914 ?auto_25919 ) ) ( not ( = ?auto_25915 ?auto_25916 ) ) ( not ( = ?auto_25915 ?auto_25919 ) ) ( not ( = ?auto_25916 ?auto_25919 ) ) ( not ( = ?auto_25914 ?auto_25918 ) ) ( not ( = ?auto_25915 ?auto_25918 ) ) ( not ( = ?auto_25916 ?auto_25918 ) ) ( not ( = ?auto_25919 ?auto_25918 ) ) ( ON ?auto_25918 ?auto_25917 ) ( not ( = ?auto_25914 ?auto_25917 ) ) ( not ( = ?auto_25915 ?auto_25917 ) ) ( not ( = ?auto_25916 ?auto_25917 ) ) ( not ( = ?auto_25919 ?auto_25917 ) ) ( not ( = ?auto_25918 ?auto_25917 ) ) ( ON ?auto_25919 ?auto_25918 ) ( CLEAR ?auto_25915 ) ( ON ?auto_25916 ?auto_25919 ) ( CLEAR ?auto_25916 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25917 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25917 ?auto_25918 ?auto_25919 )
      ( MAKE-3PILE ?auto_25914 ?auto_25915 ?auto_25916 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25920 - BLOCK
      ?auto_25921 - BLOCK
      ?auto_25922 - BLOCK
    )
    :vars
    (
      ?auto_25925 - BLOCK
      ?auto_25924 - BLOCK
      ?auto_25923 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25920 ) ( not ( = ?auto_25920 ?auto_25921 ) ) ( not ( = ?auto_25920 ?auto_25922 ) ) ( not ( = ?auto_25920 ?auto_25925 ) ) ( not ( = ?auto_25921 ?auto_25922 ) ) ( not ( = ?auto_25921 ?auto_25925 ) ) ( not ( = ?auto_25922 ?auto_25925 ) ) ( not ( = ?auto_25920 ?auto_25924 ) ) ( not ( = ?auto_25921 ?auto_25924 ) ) ( not ( = ?auto_25922 ?auto_25924 ) ) ( not ( = ?auto_25925 ?auto_25924 ) ) ( ON ?auto_25924 ?auto_25923 ) ( not ( = ?auto_25920 ?auto_25923 ) ) ( not ( = ?auto_25921 ?auto_25923 ) ) ( not ( = ?auto_25922 ?auto_25923 ) ) ( not ( = ?auto_25925 ?auto_25923 ) ) ( not ( = ?auto_25924 ?auto_25923 ) ) ( ON ?auto_25925 ?auto_25924 ) ( ON ?auto_25922 ?auto_25925 ) ( CLEAR ?auto_25922 ) ( ON-TABLE ?auto_25923 ) ( HOLDING ?auto_25921 ) ( CLEAR ?auto_25920 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25920 ?auto_25921 )
      ( MAKE-3PILE ?auto_25920 ?auto_25921 ?auto_25922 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25926 - BLOCK
      ?auto_25927 - BLOCK
      ?auto_25928 - BLOCK
    )
    :vars
    (
      ?auto_25930 - BLOCK
      ?auto_25929 - BLOCK
      ?auto_25931 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25926 ) ( not ( = ?auto_25926 ?auto_25927 ) ) ( not ( = ?auto_25926 ?auto_25928 ) ) ( not ( = ?auto_25926 ?auto_25930 ) ) ( not ( = ?auto_25927 ?auto_25928 ) ) ( not ( = ?auto_25927 ?auto_25930 ) ) ( not ( = ?auto_25928 ?auto_25930 ) ) ( not ( = ?auto_25926 ?auto_25929 ) ) ( not ( = ?auto_25927 ?auto_25929 ) ) ( not ( = ?auto_25928 ?auto_25929 ) ) ( not ( = ?auto_25930 ?auto_25929 ) ) ( ON ?auto_25929 ?auto_25931 ) ( not ( = ?auto_25926 ?auto_25931 ) ) ( not ( = ?auto_25927 ?auto_25931 ) ) ( not ( = ?auto_25928 ?auto_25931 ) ) ( not ( = ?auto_25930 ?auto_25931 ) ) ( not ( = ?auto_25929 ?auto_25931 ) ) ( ON ?auto_25930 ?auto_25929 ) ( ON ?auto_25928 ?auto_25930 ) ( ON-TABLE ?auto_25931 ) ( CLEAR ?auto_25926 ) ( ON ?auto_25927 ?auto_25928 ) ( CLEAR ?auto_25927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25931 ?auto_25929 ?auto_25930 ?auto_25928 )
      ( MAKE-3PILE ?auto_25926 ?auto_25927 ?auto_25928 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25932 - BLOCK
      ?auto_25933 - BLOCK
      ?auto_25934 - BLOCK
    )
    :vars
    (
      ?auto_25937 - BLOCK
      ?auto_25936 - BLOCK
      ?auto_25935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25932 ?auto_25933 ) ) ( not ( = ?auto_25932 ?auto_25934 ) ) ( not ( = ?auto_25932 ?auto_25937 ) ) ( not ( = ?auto_25933 ?auto_25934 ) ) ( not ( = ?auto_25933 ?auto_25937 ) ) ( not ( = ?auto_25934 ?auto_25937 ) ) ( not ( = ?auto_25932 ?auto_25936 ) ) ( not ( = ?auto_25933 ?auto_25936 ) ) ( not ( = ?auto_25934 ?auto_25936 ) ) ( not ( = ?auto_25937 ?auto_25936 ) ) ( ON ?auto_25936 ?auto_25935 ) ( not ( = ?auto_25932 ?auto_25935 ) ) ( not ( = ?auto_25933 ?auto_25935 ) ) ( not ( = ?auto_25934 ?auto_25935 ) ) ( not ( = ?auto_25937 ?auto_25935 ) ) ( not ( = ?auto_25936 ?auto_25935 ) ) ( ON ?auto_25937 ?auto_25936 ) ( ON ?auto_25934 ?auto_25937 ) ( ON-TABLE ?auto_25935 ) ( ON ?auto_25933 ?auto_25934 ) ( CLEAR ?auto_25933 ) ( HOLDING ?auto_25932 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25932 )
      ( MAKE-3PILE ?auto_25932 ?auto_25933 ?auto_25934 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25938 - BLOCK
      ?auto_25939 - BLOCK
      ?auto_25940 - BLOCK
    )
    :vars
    (
      ?auto_25943 - BLOCK
      ?auto_25942 - BLOCK
      ?auto_25941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25938 ?auto_25939 ) ) ( not ( = ?auto_25938 ?auto_25940 ) ) ( not ( = ?auto_25938 ?auto_25943 ) ) ( not ( = ?auto_25939 ?auto_25940 ) ) ( not ( = ?auto_25939 ?auto_25943 ) ) ( not ( = ?auto_25940 ?auto_25943 ) ) ( not ( = ?auto_25938 ?auto_25942 ) ) ( not ( = ?auto_25939 ?auto_25942 ) ) ( not ( = ?auto_25940 ?auto_25942 ) ) ( not ( = ?auto_25943 ?auto_25942 ) ) ( ON ?auto_25942 ?auto_25941 ) ( not ( = ?auto_25938 ?auto_25941 ) ) ( not ( = ?auto_25939 ?auto_25941 ) ) ( not ( = ?auto_25940 ?auto_25941 ) ) ( not ( = ?auto_25943 ?auto_25941 ) ) ( not ( = ?auto_25942 ?auto_25941 ) ) ( ON ?auto_25943 ?auto_25942 ) ( ON ?auto_25940 ?auto_25943 ) ( ON-TABLE ?auto_25941 ) ( ON ?auto_25939 ?auto_25940 ) ( ON ?auto_25938 ?auto_25939 ) ( CLEAR ?auto_25938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25941 ?auto_25942 ?auto_25943 ?auto_25940 ?auto_25939 )
      ( MAKE-3PILE ?auto_25938 ?auto_25939 ?auto_25940 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25946 - BLOCK
      ?auto_25947 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_25947 ) ( CLEAR ?auto_25946 ) ( ON-TABLE ?auto_25946 ) ( not ( = ?auto_25946 ?auto_25947 ) ) )
    :subtasks
    ( ( !STACK ?auto_25947 ?auto_25946 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25948 - BLOCK
      ?auto_25949 - BLOCK
    )
    :vars
    (
      ?auto_25950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25948 ) ( ON-TABLE ?auto_25948 ) ( not ( = ?auto_25948 ?auto_25949 ) ) ( ON ?auto_25949 ?auto_25950 ) ( CLEAR ?auto_25949 ) ( HAND-EMPTY ) ( not ( = ?auto_25948 ?auto_25950 ) ) ( not ( = ?auto_25949 ?auto_25950 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25949 ?auto_25950 )
      ( MAKE-2PILE ?auto_25948 ?auto_25949 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25951 - BLOCK
      ?auto_25952 - BLOCK
    )
    :vars
    (
      ?auto_25953 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25951 ?auto_25952 ) ) ( ON ?auto_25952 ?auto_25953 ) ( CLEAR ?auto_25952 ) ( not ( = ?auto_25951 ?auto_25953 ) ) ( not ( = ?auto_25952 ?auto_25953 ) ) ( HOLDING ?auto_25951 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25951 )
      ( MAKE-2PILE ?auto_25951 ?auto_25952 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25954 - BLOCK
      ?auto_25955 - BLOCK
    )
    :vars
    (
      ?auto_25956 - BLOCK
      ?auto_25958 - BLOCK
      ?auto_25957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25954 ?auto_25955 ) ) ( ON ?auto_25955 ?auto_25956 ) ( not ( = ?auto_25954 ?auto_25956 ) ) ( not ( = ?auto_25955 ?auto_25956 ) ) ( ON ?auto_25954 ?auto_25955 ) ( CLEAR ?auto_25954 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25958 ) ( ON ?auto_25957 ?auto_25958 ) ( ON ?auto_25956 ?auto_25957 ) ( not ( = ?auto_25958 ?auto_25957 ) ) ( not ( = ?auto_25958 ?auto_25956 ) ) ( not ( = ?auto_25958 ?auto_25955 ) ) ( not ( = ?auto_25958 ?auto_25954 ) ) ( not ( = ?auto_25957 ?auto_25956 ) ) ( not ( = ?auto_25957 ?auto_25955 ) ) ( not ( = ?auto_25957 ?auto_25954 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25958 ?auto_25957 ?auto_25956 ?auto_25955 )
      ( MAKE-2PILE ?auto_25954 ?auto_25955 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25959 - BLOCK
      ?auto_25960 - BLOCK
    )
    :vars
    (
      ?auto_25962 - BLOCK
      ?auto_25961 - BLOCK
      ?auto_25963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25959 ?auto_25960 ) ) ( ON ?auto_25960 ?auto_25962 ) ( not ( = ?auto_25959 ?auto_25962 ) ) ( not ( = ?auto_25960 ?auto_25962 ) ) ( ON-TABLE ?auto_25961 ) ( ON ?auto_25963 ?auto_25961 ) ( ON ?auto_25962 ?auto_25963 ) ( not ( = ?auto_25961 ?auto_25963 ) ) ( not ( = ?auto_25961 ?auto_25962 ) ) ( not ( = ?auto_25961 ?auto_25960 ) ) ( not ( = ?auto_25961 ?auto_25959 ) ) ( not ( = ?auto_25963 ?auto_25962 ) ) ( not ( = ?auto_25963 ?auto_25960 ) ) ( not ( = ?auto_25963 ?auto_25959 ) ) ( HOLDING ?auto_25959 ) ( CLEAR ?auto_25960 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25961 ?auto_25963 ?auto_25962 ?auto_25960 ?auto_25959 )
      ( MAKE-2PILE ?auto_25959 ?auto_25960 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25964 - BLOCK
      ?auto_25965 - BLOCK
    )
    :vars
    (
      ?auto_25968 - BLOCK
      ?auto_25967 - BLOCK
      ?auto_25966 - BLOCK
      ?auto_25969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25964 ?auto_25965 ) ) ( ON ?auto_25965 ?auto_25968 ) ( not ( = ?auto_25964 ?auto_25968 ) ) ( not ( = ?auto_25965 ?auto_25968 ) ) ( ON-TABLE ?auto_25967 ) ( ON ?auto_25966 ?auto_25967 ) ( ON ?auto_25968 ?auto_25966 ) ( not ( = ?auto_25967 ?auto_25966 ) ) ( not ( = ?auto_25967 ?auto_25968 ) ) ( not ( = ?auto_25967 ?auto_25965 ) ) ( not ( = ?auto_25967 ?auto_25964 ) ) ( not ( = ?auto_25966 ?auto_25968 ) ) ( not ( = ?auto_25966 ?auto_25965 ) ) ( not ( = ?auto_25966 ?auto_25964 ) ) ( CLEAR ?auto_25965 ) ( ON ?auto_25964 ?auto_25969 ) ( CLEAR ?auto_25964 ) ( HAND-EMPTY ) ( not ( = ?auto_25964 ?auto_25969 ) ) ( not ( = ?auto_25965 ?auto_25969 ) ) ( not ( = ?auto_25968 ?auto_25969 ) ) ( not ( = ?auto_25967 ?auto_25969 ) ) ( not ( = ?auto_25966 ?auto_25969 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25964 ?auto_25969 )
      ( MAKE-2PILE ?auto_25964 ?auto_25965 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25970 - BLOCK
      ?auto_25971 - BLOCK
    )
    :vars
    (
      ?auto_25972 - BLOCK
      ?auto_25974 - BLOCK
      ?auto_25975 - BLOCK
      ?auto_25973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25970 ?auto_25971 ) ) ( not ( = ?auto_25970 ?auto_25972 ) ) ( not ( = ?auto_25971 ?auto_25972 ) ) ( ON-TABLE ?auto_25974 ) ( ON ?auto_25975 ?auto_25974 ) ( ON ?auto_25972 ?auto_25975 ) ( not ( = ?auto_25974 ?auto_25975 ) ) ( not ( = ?auto_25974 ?auto_25972 ) ) ( not ( = ?auto_25974 ?auto_25971 ) ) ( not ( = ?auto_25974 ?auto_25970 ) ) ( not ( = ?auto_25975 ?auto_25972 ) ) ( not ( = ?auto_25975 ?auto_25971 ) ) ( not ( = ?auto_25975 ?auto_25970 ) ) ( ON ?auto_25970 ?auto_25973 ) ( CLEAR ?auto_25970 ) ( not ( = ?auto_25970 ?auto_25973 ) ) ( not ( = ?auto_25971 ?auto_25973 ) ) ( not ( = ?auto_25972 ?auto_25973 ) ) ( not ( = ?auto_25974 ?auto_25973 ) ) ( not ( = ?auto_25975 ?auto_25973 ) ) ( HOLDING ?auto_25971 ) ( CLEAR ?auto_25972 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25974 ?auto_25975 ?auto_25972 ?auto_25971 )
      ( MAKE-2PILE ?auto_25970 ?auto_25971 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25976 - BLOCK
      ?auto_25977 - BLOCK
    )
    :vars
    (
      ?auto_25981 - BLOCK
      ?auto_25978 - BLOCK
      ?auto_25980 - BLOCK
      ?auto_25979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25976 ?auto_25977 ) ) ( not ( = ?auto_25976 ?auto_25981 ) ) ( not ( = ?auto_25977 ?auto_25981 ) ) ( ON-TABLE ?auto_25978 ) ( ON ?auto_25980 ?auto_25978 ) ( ON ?auto_25981 ?auto_25980 ) ( not ( = ?auto_25978 ?auto_25980 ) ) ( not ( = ?auto_25978 ?auto_25981 ) ) ( not ( = ?auto_25978 ?auto_25977 ) ) ( not ( = ?auto_25978 ?auto_25976 ) ) ( not ( = ?auto_25980 ?auto_25981 ) ) ( not ( = ?auto_25980 ?auto_25977 ) ) ( not ( = ?auto_25980 ?auto_25976 ) ) ( ON ?auto_25976 ?auto_25979 ) ( not ( = ?auto_25976 ?auto_25979 ) ) ( not ( = ?auto_25977 ?auto_25979 ) ) ( not ( = ?auto_25981 ?auto_25979 ) ) ( not ( = ?auto_25978 ?auto_25979 ) ) ( not ( = ?auto_25980 ?auto_25979 ) ) ( CLEAR ?auto_25981 ) ( ON ?auto_25977 ?auto_25976 ) ( CLEAR ?auto_25977 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25979 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25979 ?auto_25976 )
      ( MAKE-2PILE ?auto_25976 ?auto_25977 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25982 - BLOCK
      ?auto_25983 - BLOCK
    )
    :vars
    (
      ?auto_25986 - BLOCK
      ?auto_25987 - BLOCK
      ?auto_25984 - BLOCK
      ?auto_25985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25982 ?auto_25983 ) ) ( not ( = ?auto_25982 ?auto_25986 ) ) ( not ( = ?auto_25983 ?auto_25986 ) ) ( ON-TABLE ?auto_25987 ) ( ON ?auto_25984 ?auto_25987 ) ( not ( = ?auto_25987 ?auto_25984 ) ) ( not ( = ?auto_25987 ?auto_25986 ) ) ( not ( = ?auto_25987 ?auto_25983 ) ) ( not ( = ?auto_25987 ?auto_25982 ) ) ( not ( = ?auto_25984 ?auto_25986 ) ) ( not ( = ?auto_25984 ?auto_25983 ) ) ( not ( = ?auto_25984 ?auto_25982 ) ) ( ON ?auto_25982 ?auto_25985 ) ( not ( = ?auto_25982 ?auto_25985 ) ) ( not ( = ?auto_25983 ?auto_25985 ) ) ( not ( = ?auto_25986 ?auto_25985 ) ) ( not ( = ?auto_25987 ?auto_25985 ) ) ( not ( = ?auto_25984 ?auto_25985 ) ) ( ON ?auto_25983 ?auto_25982 ) ( CLEAR ?auto_25983 ) ( ON-TABLE ?auto_25985 ) ( HOLDING ?auto_25986 ) ( CLEAR ?auto_25984 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25987 ?auto_25984 ?auto_25986 )
      ( MAKE-2PILE ?auto_25982 ?auto_25983 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25988 - BLOCK
      ?auto_25989 - BLOCK
    )
    :vars
    (
      ?auto_25990 - BLOCK
      ?auto_25993 - BLOCK
      ?auto_25991 - BLOCK
      ?auto_25992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25988 ?auto_25989 ) ) ( not ( = ?auto_25988 ?auto_25990 ) ) ( not ( = ?auto_25989 ?auto_25990 ) ) ( ON-TABLE ?auto_25993 ) ( ON ?auto_25991 ?auto_25993 ) ( not ( = ?auto_25993 ?auto_25991 ) ) ( not ( = ?auto_25993 ?auto_25990 ) ) ( not ( = ?auto_25993 ?auto_25989 ) ) ( not ( = ?auto_25993 ?auto_25988 ) ) ( not ( = ?auto_25991 ?auto_25990 ) ) ( not ( = ?auto_25991 ?auto_25989 ) ) ( not ( = ?auto_25991 ?auto_25988 ) ) ( ON ?auto_25988 ?auto_25992 ) ( not ( = ?auto_25988 ?auto_25992 ) ) ( not ( = ?auto_25989 ?auto_25992 ) ) ( not ( = ?auto_25990 ?auto_25992 ) ) ( not ( = ?auto_25993 ?auto_25992 ) ) ( not ( = ?auto_25991 ?auto_25992 ) ) ( ON ?auto_25989 ?auto_25988 ) ( ON-TABLE ?auto_25992 ) ( CLEAR ?auto_25991 ) ( ON ?auto_25990 ?auto_25989 ) ( CLEAR ?auto_25990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25992 ?auto_25988 ?auto_25989 )
      ( MAKE-2PILE ?auto_25988 ?auto_25989 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25994 - BLOCK
      ?auto_25995 - BLOCK
    )
    :vars
    (
      ?auto_25997 - BLOCK
      ?auto_25996 - BLOCK
      ?auto_25999 - BLOCK
      ?auto_25998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25994 ?auto_25995 ) ) ( not ( = ?auto_25994 ?auto_25997 ) ) ( not ( = ?auto_25995 ?auto_25997 ) ) ( ON-TABLE ?auto_25996 ) ( not ( = ?auto_25996 ?auto_25999 ) ) ( not ( = ?auto_25996 ?auto_25997 ) ) ( not ( = ?auto_25996 ?auto_25995 ) ) ( not ( = ?auto_25996 ?auto_25994 ) ) ( not ( = ?auto_25999 ?auto_25997 ) ) ( not ( = ?auto_25999 ?auto_25995 ) ) ( not ( = ?auto_25999 ?auto_25994 ) ) ( ON ?auto_25994 ?auto_25998 ) ( not ( = ?auto_25994 ?auto_25998 ) ) ( not ( = ?auto_25995 ?auto_25998 ) ) ( not ( = ?auto_25997 ?auto_25998 ) ) ( not ( = ?auto_25996 ?auto_25998 ) ) ( not ( = ?auto_25999 ?auto_25998 ) ) ( ON ?auto_25995 ?auto_25994 ) ( ON-TABLE ?auto_25998 ) ( ON ?auto_25997 ?auto_25995 ) ( CLEAR ?auto_25997 ) ( HOLDING ?auto_25999 ) ( CLEAR ?auto_25996 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25996 ?auto_25999 )
      ( MAKE-2PILE ?auto_25994 ?auto_25995 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26000 - BLOCK
      ?auto_26001 - BLOCK
    )
    :vars
    (
      ?auto_26004 - BLOCK
      ?auto_26003 - BLOCK
      ?auto_26005 - BLOCK
      ?auto_26002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26000 ?auto_26001 ) ) ( not ( = ?auto_26000 ?auto_26004 ) ) ( not ( = ?auto_26001 ?auto_26004 ) ) ( ON-TABLE ?auto_26003 ) ( not ( = ?auto_26003 ?auto_26005 ) ) ( not ( = ?auto_26003 ?auto_26004 ) ) ( not ( = ?auto_26003 ?auto_26001 ) ) ( not ( = ?auto_26003 ?auto_26000 ) ) ( not ( = ?auto_26005 ?auto_26004 ) ) ( not ( = ?auto_26005 ?auto_26001 ) ) ( not ( = ?auto_26005 ?auto_26000 ) ) ( ON ?auto_26000 ?auto_26002 ) ( not ( = ?auto_26000 ?auto_26002 ) ) ( not ( = ?auto_26001 ?auto_26002 ) ) ( not ( = ?auto_26004 ?auto_26002 ) ) ( not ( = ?auto_26003 ?auto_26002 ) ) ( not ( = ?auto_26005 ?auto_26002 ) ) ( ON ?auto_26001 ?auto_26000 ) ( ON-TABLE ?auto_26002 ) ( ON ?auto_26004 ?auto_26001 ) ( CLEAR ?auto_26003 ) ( ON ?auto_26005 ?auto_26004 ) ( CLEAR ?auto_26005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26002 ?auto_26000 ?auto_26001 ?auto_26004 )
      ( MAKE-2PILE ?auto_26000 ?auto_26001 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26006 - BLOCK
      ?auto_26007 - BLOCK
    )
    :vars
    (
      ?auto_26008 - BLOCK
      ?auto_26010 - BLOCK
      ?auto_26011 - BLOCK
      ?auto_26009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26006 ?auto_26007 ) ) ( not ( = ?auto_26006 ?auto_26008 ) ) ( not ( = ?auto_26007 ?auto_26008 ) ) ( not ( = ?auto_26010 ?auto_26011 ) ) ( not ( = ?auto_26010 ?auto_26008 ) ) ( not ( = ?auto_26010 ?auto_26007 ) ) ( not ( = ?auto_26010 ?auto_26006 ) ) ( not ( = ?auto_26011 ?auto_26008 ) ) ( not ( = ?auto_26011 ?auto_26007 ) ) ( not ( = ?auto_26011 ?auto_26006 ) ) ( ON ?auto_26006 ?auto_26009 ) ( not ( = ?auto_26006 ?auto_26009 ) ) ( not ( = ?auto_26007 ?auto_26009 ) ) ( not ( = ?auto_26008 ?auto_26009 ) ) ( not ( = ?auto_26010 ?auto_26009 ) ) ( not ( = ?auto_26011 ?auto_26009 ) ) ( ON ?auto_26007 ?auto_26006 ) ( ON-TABLE ?auto_26009 ) ( ON ?auto_26008 ?auto_26007 ) ( ON ?auto_26011 ?auto_26008 ) ( CLEAR ?auto_26011 ) ( HOLDING ?auto_26010 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26010 )
      ( MAKE-2PILE ?auto_26006 ?auto_26007 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26012 - BLOCK
      ?auto_26013 - BLOCK
    )
    :vars
    (
      ?auto_26014 - BLOCK
      ?auto_26015 - BLOCK
      ?auto_26016 - BLOCK
      ?auto_26017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26012 ?auto_26013 ) ) ( not ( = ?auto_26012 ?auto_26014 ) ) ( not ( = ?auto_26013 ?auto_26014 ) ) ( not ( = ?auto_26015 ?auto_26016 ) ) ( not ( = ?auto_26015 ?auto_26014 ) ) ( not ( = ?auto_26015 ?auto_26013 ) ) ( not ( = ?auto_26015 ?auto_26012 ) ) ( not ( = ?auto_26016 ?auto_26014 ) ) ( not ( = ?auto_26016 ?auto_26013 ) ) ( not ( = ?auto_26016 ?auto_26012 ) ) ( ON ?auto_26012 ?auto_26017 ) ( not ( = ?auto_26012 ?auto_26017 ) ) ( not ( = ?auto_26013 ?auto_26017 ) ) ( not ( = ?auto_26014 ?auto_26017 ) ) ( not ( = ?auto_26015 ?auto_26017 ) ) ( not ( = ?auto_26016 ?auto_26017 ) ) ( ON ?auto_26013 ?auto_26012 ) ( ON-TABLE ?auto_26017 ) ( ON ?auto_26014 ?auto_26013 ) ( ON ?auto_26016 ?auto_26014 ) ( ON ?auto_26015 ?auto_26016 ) ( CLEAR ?auto_26015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26017 ?auto_26012 ?auto_26013 ?auto_26014 ?auto_26016 )
      ( MAKE-2PILE ?auto_26012 ?auto_26013 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26020 - BLOCK
      ?auto_26021 - BLOCK
    )
    :vars
    (
      ?auto_26022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26022 ?auto_26021 ) ( CLEAR ?auto_26022 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26020 ) ( ON ?auto_26021 ?auto_26020 ) ( not ( = ?auto_26020 ?auto_26021 ) ) ( not ( = ?auto_26020 ?auto_26022 ) ) ( not ( = ?auto_26021 ?auto_26022 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26022 ?auto_26021 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26023 - BLOCK
      ?auto_26024 - BLOCK
    )
    :vars
    (
      ?auto_26025 - BLOCK
      ?auto_26026 - BLOCK
      ?auto_26027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26025 ?auto_26024 ) ( CLEAR ?auto_26025 ) ( ON-TABLE ?auto_26023 ) ( ON ?auto_26024 ?auto_26023 ) ( not ( = ?auto_26023 ?auto_26024 ) ) ( not ( = ?auto_26023 ?auto_26025 ) ) ( not ( = ?auto_26024 ?auto_26025 ) ) ( HOLDING ?auto_26026 ) ( CLEAR ?auto_26027 ) ( not ( = ?auto_26023 ?auto_26026 ) ) ( not ( = ?auto_26023 ?auto_26027 ) ) ( not ( = ?auto_26024 ?auto_26026 ) ) ( not ( = ?auto_26024 ?auto_26027 ) ) ( not ( = ?auto_26025 ?auto_26026 ) ) ( not ( = ?auto_26025 ?auto_26027 ) ) ( not ( = ?auto_26026 ?auto_26027 ) ) )
    :subtasks
    ( ( !STACK ?auto_26026 ?auto_26027 )
      ( MAKE-2PILE ?auto_26023 ?auto_26024 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26028 - BLOCK
      ?auto_26029 - BLOCK
    )
    :vars
    (
      ?auto_26031 - BLOCK
      ?auto_26030 - BLOCK
      ?auto_26032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26031 ?auto_26029 ) ( ON-TABLE ?auto_26028 ) ( ON ?auto_26029 ?auto_26028 ) ( not ( = ?auto_26028 ?auto_26029 ) ) ( not ( = ?auto_26028 ?auto_26031 ) ) ( not ( = ?auto_26029 ?auto_26031 ) ) ( CLEAR ?auto_26030 ) ( not ( = ?auto_26028 ?auto_26032 ) ) ( not ( = ?auto_26028 ?auto_26030 ) ) ( not ( = ?auto_26029 ?auto_26032 ) ) ( not ( = ?auto_26029 ?auto_26030 ) ) ( not ( = ?auto_26031 ?auto_26032 ) ) ( not ( = ?auto_26031 ?auto_26030 ) ) ( not ( = ?auto_26032 ?auto_26030 ) ) ( ON ?auto_26032 ?auto_26031 ) ( CLEAR ?auto_26032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26028 ?auto_26029 ?auto_26031 )
      ( MAKE-2PILE ?auto_26028 ?auto_26029 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26033 - BLOCK
      ?auto_26034 - BLOCK
    )
    :vars
    (
      ?auto_26035 - BLOCK
      ?auto_26036 - BLOCK
      ?auto_26037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26035 ?auto_26034 ) ( ON-TABLE ?auto_26033 ) ( ON ?auto_26034 ?auto_26033 ) ( not ( = ?auto_26033 ?auto_26034 ) ) ( not ( = ?auto_26033 ?auto_26035 ) ) ( not ( = ?auto_26034 ?auto_26035 ) ) ( not ( = ?auto_26033 ?auto_26036 ) ) ( not ( = ?auto_26033 ?auto_26037 ) ) ( not ( = ?auto_26034 ?auto_26036 ) ) ( not ( = ?auto_26034 ?auto_26037 ) ) ( not ( = ?auto_26035 ?auto_26036 ) ) ( not ( = ?auto_26035 ?auto_26037 ) ) ( not ( = ?auto_26036 ?auto_26037 ) ) ( ON ?auto_26036 ?auto_26035 ) ( CLEAR ?auto_26036 ) ( HOLDING ?auto_26037 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26037 )
      ( MAKE-2PILE ?auto_26033 ?auto_26034 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26038 - BLOCK
      ?auto_26039 - BLOCK
    )
    :vars
    (
      ?auto_26041 - BLOCK
      ?auto_26040 - BLOCK
      ?auto_26042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26041 ?auto_26039 ) ( ON-TABLE ?auto_26038 ) ( ON ?auto_26039 ?auto_26038 ) ( not ( = ?auto_26038 ?auto_26039 ) ) ( not ( = ?auto_26038 ?auto_26041 ) ) ( not ( = ?auto_26039 ?auto_26041 ) ) ( not ( = ?auto_26038 ?auto_26040 ) ) ( not ( = ?auto_26038 ?auto_26042 ) ) ( not ( = ?auto_26039 ?auto_26040 ) ) ( not ( = ?auto_26039 ?auto_26042 ) ) ( not ( = ?auto_26041 ?auto_26040 ) ) ( not ( = ?auto_26041 ?auto_26042 ) ) ( not ( = ?auto_26040 ?auto_26042 ) ) ( ON ?auto_26040 ?auto_26041 ) ( ON ?auto_26042 ?auto_26040 ) ( CLEAR ?auto_26042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26038 ?auto_26039 ?auto_26041 ?auto_26040 )
      ( MAKE-2PILE ?auto_26038 ?auto_26039 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26043 - BLOCK
      ?auto_26044 - BLOCK
    )
    :vars
    (
      ?auto_26045 - BLOCK
      ?auto_26046 - BLOCK
      ?auto_26047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26045 ?auto_26044 ) ( ON-TABLE ?auto_26043 ) ( ON ?auto_26044 ?auto_26043 ) ( not ( = ?auto_26043 ?auto_26044 ) ) ( not ( = ?auto_26043 ?auto_26045 ) ) ( not ( = ?auto_26044 ?auto_26045 ) ) ( not ( = ?auto_26043 ?auto_26046 ) ) ( not ( = ?auto_26043 ?auto_26047 ) ) ( not ( = ?auto_26044 ?auto_26046 ) ) ( not ( = ?auto_26044 ?auto_26047 ) ) ( not ( = ?auto_26045 ?auto_26046 ) ) ( not ( = ?auto_26045 ?auto_26047 ) ) ( not ( = ?auto_26046 ?auto_26047 ) ) ( ON ?auto_26046 ?auto_26045 ) ( HOLDING ?auto_26047 ) ( CLEAR ?auto_26046 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26043 ?auto_26044 ?auto_26045 ?auto_26046 ?auto_26047 )
      ( MAKE-2PILE ?auto_26043 ?auto_26044 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26048 - BLOCK
      ?auto_26049 - BLOCK
    )
    :vars
    (
      ?auto_26050 - BLOCK
      ?auto_26052 - BLOCK
      ?auto_26051 - BLOCK
      ?auto_26053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26050 ?auto_26049 ) ( ON-TABLE ?auto_26048 ) ( ON ?auto_26049 ?auto_26048 ) ( not ( = ?auto_26048 ?auto_26049 ) ) ( not ( = ?auto_26048 ?auto_26050 ) ) ( not ( = ?auto_26049 ?auto_26050 ) ) ( not ( = ?auto_26048 ?auto_26052 ) ) ( not ( = ?auto_26048 ?auto_26051 ) ) ( not ( = ?auto_26049 ?auto_26052 ) ) ( not ( = ?auto_26049 ?auto_26051 ) ) ( not ( = ?auto_26050 ?auto_26052 ) ) ( not ( = ?auto_26050 ?auto_26051 ) ) ( not ( = ?auto_26052 ?auto_26051 ) ) ( ON ?auto_26052 ?auto_26050 ) ( CLEAR ?auto_26052 ) ( ON ?auto_26051 ?auto_26053 ) ( CLEAR ?auto_26051 ) ( HAND-EMPTY ) ( not ( = ?auto_26048 ?auto_26053 ) ) ( not ( = ?auto_26049 ?auto_26053 ) ) ( not ( = ?auto_26050 ?auto_26053 ) ) ( not ( = ?auto_26052 ?auto_26053 ) ) ( not ( = ?auto_26051 ?auto_26053 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26051 ?auto_26053 )
      ( MAKE-2PILE ?auto_26048 ?auto_26049 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26054 - BLOCK
      ?auto_26055 - BLOCK
    )
    :vars
    (
      ?auto_26059 - BLOCK
      ?auto_26056 - BLOCK
      ?auto_26057 - BLOCK
      ?auto_26058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26059 ?auto_26055 ) ( ON-TABLE ?auto_26054 ) ( ON ?auto_26055 ?auto_26054 ) ( not ( = ?auto_26054 ?auto_26055 ) ) ( not ( = ?auto_26054 ?auto_26059 ) ) ( not ( = ?auto_26055 ?auto_26059 ) ) ( not ( = ?auto_26054 ?auto_26056 ) ) ( not ( = ?auto_26054 ?auto_26057 ) ) ( not ( = ?auto_26055 ?auto_26056 ) ) ( not ( = ?auto_26055 ?auto_26057 ) ) ( not ( = ?auto_26059 ?auto_26056 ) ) ( not ( = ?auto_26059 ?auto_26057 ) ) ( not ( = ?auto_26056 ?auto_26057 ) ) ( ON ?auto_26057 ?auto_26058 ) ( CLEAR ?auto_26057 ) ( not ( = ?auto_26054 ?auto_26058 ) ) ( not ( = ?auto_26055 ?auto_26058 ) ) ( not ( = ?auto_26059 ?auto_26058 ) ) ( not ( = ?auto_26056 ?auto_26058 ) ) ( not ( = ?auto_26057 ?auto_26058 ) ) ( HOLDING ?auto_26056 ) ( CLEAR ?auto_26059 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26054 ?auto_26055 ?auto_26059 ?auto_26056 )
      ( MAKE-2PILE ?auto_26054 ?auto_26055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26060 - BLOCK
      ?auto_26061 - BLOCK
    )
    :vars
    (
      ?auto_26065 - BLOCK
      ?auto_26062 - BLOCK
      ?auto_26064 - BLOCK
      ?auto_26063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26065 ?auto_26061 ) ( ON-TABLE ?auto_26060 ) ( ON ?auto_26061 ?auto_26060 ) ( not ( = ?auto_26060 ?auto_26061 ) ) ( not ( = ?auto_26060 ?auto_26065 ) ) ( not ( = ?auto_26061 ?auto_26065 ) ) ( not ( = ?auto_26060 ?auto_26062 ) ) ( not ( = ?auto_26060 ?auto_26064 ) ) ( not ( = ?auto_26061 ?auto_26062 ) ) ( not ( = ?auto_26061 ?auto_26064 ) ) ( not ( = ?auto_26065 ?auto_26062 ) ) ( not ( = ?auto_26065 ?auto_26064 ) ) ( not ( = ?auto_26062 ?auto_26064 ) ) ( ON ?auto_26064 ?auto_26063 ) ( not ( = ?auto_26060 ?auto_26063 ) ) ( not ( = ?auto_26061 ?auto_26063 ) ) ( not ( = ?auto_26065 ?auto_26063 ) ) ( not ( = ?auto_26062 ?auto_26063 ) ) ( not ( = ?auto_26064 ?auto_26063 ) ) ( CLEAR ?auto_26065 ) ( ON ?auto_26062 ?auto_26064 ) ( CLEAR ?auto_26062 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26063 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26063 ?auto_26064 )
      ( MAKE-2PILE ?auto_26060 ?auto_26061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26078 - BLOCK
      ?auto_26079 - BLOCK
    )
    :vars
    (
      ?auto_26081 - BLOCK
      ?auto_26080 - BLOCK
      ?auto_26082 - BLOCK
      ?auto_26083 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26078 ) ( not ( = ?auto_26078 ?auto_26079 ) ) ( not ( = ?auto_26078 ?auto_26081 ) ) ( not ( = ?auto_26079 ?auto_26081 ) ) ( not ( = ?auto_26078 ?auto_26080 ) ) ( not ( = ?auto_26078 ?auto_26082 ) ) ( not ( = ?auto_26079 ?auto_26080 ) ) ( not ( = ?auto_26079 ?auto_26082 ) ) ( not ( = ?auto_26081 ?auto_26080 ) ) ( not ( = ?auto_26081 ?auto_26082 ) ) ( not ( = ?auto_26080 ?auto_26082 ) ) ( ON ?auto_26082 ?auto_26083 ) ( not ( = ?auto_26078 ?auto_26083 ) ) ( not ( = ?auto_26079 ?auto_26083 ) ) ( not ( = ?auto_26081 ?auto_26083 ) ) ( not ( = ?auto_26080 ?auto_26083 ) ) ( not ( = ?auto_26082 ?auto_26083 ) ) ( ON ?auto_26080 ?auto_26082 ) ( ON-TABLE ?auto_26083 ) ( ON ?auto_26081 ?auto_26080 ) ( CLEAR ?auto_26081 ) ( HOLDING ?auto_26079 ) ( CLEAR ?auto_26078 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26078 ?auto_26079 ?auto_26081 )
      ( MAKE-2PILE ?auto_26078 ?auto_26079 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26084 - BLOCK
      ?auto_26085 - BLOCK
    )
    :vars
    (
      ?auto_26087 - BLOCK
      ?auto_26088 - BLOCK
      ?auto_26089 - BLOCK
      ?auto_26086 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26084 ) ( not ( = ?auto_26084 ?auto_26085 ) ) ( not ( = ?auto_26084 ?auto_26087 ) ) ( not ( = ?auto_26085 ?auto_26087 ) ) ( not ( = ?auto_26084 ?auto_26088 ) ) ( not ( = ?auto_26084 ?auto_26089 ) ) ( not ( = ?auto_26085 ?auto_26088 ) ) ( not ( = ?auto_26085 ?auto_26089 ) ) ( not ( = ?auto_26087 ?auto_26088 ) ) ( not ( = ?auto_26087 ?auto_26089 ) ) ( not ( = ?auto_26088 ?auto_26089 ) ) ( ON ?auto_26089 ?auto_26086 ) ( not ( = ?auto_26084 ?auto_26086 ) ) ( not ( = ?auto_26085 ?auto_26086 ) ) ( not ( = ?auto_26087 ?auto_26086 ) ) ( not ( = ?auto_26088 ?auto_26086 ) ) ( not ( = ?auto_26089 ?auto_26086 ) ) ( ON ?auto_26088 ?auto_26089 ) ( ON-TABLE ?auto_26086 ) ( ON ?auto_26087 ?auto_26088 ) ( CLEAR ?auto_26084 ) ( ON ?auto_26085 ?auto_26087 ) ( CLEAR ?auto_26085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26086 ?auto_26089 ?auto_26088 ?auto_26087 )
      ( MAKE-2PILE ?auto_26084 ?auto_26085 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26090 - BLOCK
      ?auto_26091 - BLOCK
    )
    :vars
    (
      ?auto_26092 - BLOCK
      ?auto_26094 - BLOCK
      ?auto_26093 - BLOCK
      ?auto_26095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26090 ?auto_26091 ) ) ( not ( = ?auto_26090 ?auto_26092 ) ) ( not ( = ?auto_26091 ?auto_26092 ) ) ( not ( = ?auto_26090 ?auto_26094 ) ) ( not ( = ?auto_26090 ?auto_26093 ) ) ( not ( = ?auto_26091 ?auto_26094 ) ) ( not ( = ?auto_26091 ?auto_26093 ) ) ( not ( = ?auto_26092 ?auto_26094 ) ) ( not ( = ?auto_26092 ?auto_26093 ) ) ( not ( = ?auto_26094 ?auto_26093 ) ) ( ON ?auto_26093 ?auto_26095 ) ( not ( = ?auto_26090 ?auto_26095 ) ) ( not ( = ?auto_26091 ?auto_26095 ) ) ( not ( = ?auto_26092 ?auto_26095 ) ) ( not ( = ?auto_26094 ?auto_26095 ) ) ( not ( = ?auto_26093 ?auto_26095 ) ) ( ON ?auto_26094 ?auto_26093 ) ( ON-TABLE ?auto_26095 ) ( ON ?auto_26092 ?auto_26094 ) ( ON ?auto_26091 ?auto_26092 ) ( CLEAR ?auto_26091 ) ( HOLDING ?auto_26090 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26090 )
      ( MAKE-2PILE ?auto_26090 ?auto_26091 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26096 - BLOCK
      ?auto_26097 - BLOCK
    )
    :vars
    (
      ?auto_26100 - BLOCK
      ?auto_26098 - BLOCK
      ?auto_26099 - BLOCK
      ?auto_26101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26096 ?auto_26097 ) ) ( not ( = ?auto_26096 ?auto_26100 ) ) ( not ( = ?auto_26097 ?auto_26100 ) ) ( not ( = ?auto_26096 ?auto_26098 ) ) ( not ( = ?auto_26096 ?auto_26099 ) ) ( not ( = ?auto_26097 ?auto_26098 ) ) ( not ( = ?auto_26097 ?auto_26099 ) ) ( not ( = ?auto_26100 ?auto_26098 ) ) ( not ( = ?auto_26100 ?auto_26099 ) ) ( not ( = ?auto_26098 ?auto_26099 ) ) ( ON ?auto_26099 ?auto_26101 ) ( not ( = ?auto_26096 ?auto_26101 ) ) ( not ( = ?auto_26097 ?auto_26101 ) ) ( not ( = ?auto_26100 ?auto_26101 ) ) ( not ( = ?auto_26098 ?auto_26101 ) ) ( not ( = ?auto_26099 ?auto_26101 ) ) ( ON ?auto_26098 ?auto_26099 ) ( ON-TABLE ?auto_26101 ) ( ON ?auto_26100 ?auto_26098 ) ( ON ?auto_26097 ?auto_26100 ) ( ON ?auto_26096 ?auto_26097 ) ( CLEAR ?auto_26096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26101 ?auto_26099 ?auto_26098 ?auto_26100 ?auto_26097 )
      ( MAKE-2PILE ?auto_26096 ?auto_26097 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26105 - BLOCK
      ?auto_26106 - BLOCK
      ?auto_26107 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_26107 ) ( CLEAR ?auto_26106 ) ( ON-TABLE ?auto_26105 ) ( ON ?auto_26106 ?auto_26105 ) ( not ( = ?auto_26105 ?auto_26106 ) ) ( not ( = ?auto_26105 ?auto_26107 ) ) ( not ( = ?auto_26106 ?auto_26107 ) ) )
    :subtasks
    ( ( !STACK ?auto_26107 ?auto_26106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26108 - BLOCK
      ?auto_26109 - BLOCK
      ?auto_26110 - BLOCK
    )
    :vars
    (
      ?auto_26111 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26109 ) ( ON-TABLE ?auto_26108 ) ( ON ?auto_26109 ?auto_26108 ) ( not ( = ?auto_26108 ?auto_26109 ) ) ( not ( = ?auto_26108 ?auto_26110 ) ) ( not ( = ?auto_26109 ?auto_26110 ) ) ( ON ?auto_26110 ?auto_26111 ) ( CLEAR ?auto_26110 ) ( HAND-EMPTY ) ( not ( = ?auto_26108 ?auto_26111 ) ) ( not ( = ?auto_26109 ?auto_26111 ) ) ( not ( = ?auto_26110 ?auto_26111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26110 ?auto_26111 )
      ( MAKE-3PILE ?auto_26108 ?auto_26109 ?auto_26110 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26112 - BLOCK
      ?auto_26113 - BLOCK
      ?auto_26114 - BLOCK
    )
    :vars
    (
      ?auto_26115 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26112 ) ( not ( = ?auto_26112 ?auto_26113 ) ) ( not ( = ?auto_26112 ?auto_26114 ) ) ( not ( = ?auto_26113 ?auto_26114 ) ) ( ON ?auto_26114 ?auto_26115 ) ( CLEAR ?auto_26114 ) ( not ( = ?auto_26112 ?auto_26115 ) ) ( not ( = ?auto_26113 ?auto_26115 ) ) ( not ( = ?auto_26114 ?auto_26115 ) ) ( HOLDING ?auto_26113 ) ( CLEAR ?auto_26112 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26112 ?auto_26113 )
      ( MAKE-3PILE ?auto_26112 ?auto_26113 ?auto_26114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26116 - BLOCK
      ?auto_26117 - BLOCK
      ?auto_26118 - BLOCK
    )
    :vars
    (
      ?auto_26119 - BLOCK
      ?auto_26120 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26116 ) ( not ( = ?auto_26116 ?auto_26117 ) ) ( not ( = ?auto_26116 ?auto_26118 ) ) ( not ( = ?auto_26117 ?auto_26118 ) ) ( ON ?auto_26118 ?auto_26119 ) ( not ( = ?auto_26116 ?auto_26119 ) ) ( not ( = ?auto_26117 ?auto_26119 ) ) ( not ( = ?auto_26118 ?auto_26119 ) ) ( CLEAR ?auto_26116 ) ( ON ?auto_26117 ?auto_26118 ) ( CLEAR ?auto_26117 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26120 ) ( ON ?auto_26119 ?auto_26120 ) ( not ( = ?auto_26120 ?auto_26119 ) ) ( not ( = ?auto_26120 ?auto_26118 ) ) ( not ( = ?auto_26120 ?auto_26117 ) ) ( not ( = ?auto_26116 ?auto_26120 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26120 ?auto_26119 ?auto_26118 )
      ( MAKE-3PILE ?auto_26116 ?auto_26117 ?auto_26118 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26121 - BLOCK
      ?auto_26122 - BLOCK
      ?auto_26123 - BLOCK
    )
    :vars
    (
      ?auto_26124 - BLOCK
      ?auto_26125 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26121 ?auto_26122 ) ) ( not ( = ?auto_26121 ?auto_26123 ) ) ( not ( = ?auto_26122 ?auto_26123 ) ) ( ON ?auto_26123 ?auto_26124 ) ( not ( = ?auto_26121 ?auto_26124 ) ) ( not ( = ?auto_26122 ?auto_26124 ) ) ( not ( = ?auto_26123 ?auto_26124 ) ) ( ON ?auto_26122 ?auto_26123 ) ( CLEAR ?auto_26122 ) ( ON-TABLE ?auto_26125 ) ( ON ?auto_26124 ?auto_26125 ) ( not ( = ?auto_26125 ?auto_26124 ) ) ( not ( = ?auto_26125 ?auto_26123 ) ) ( not ( = ?auto_26125 ?auto_26122 ) ) ( not ( = ?auto_26121 ?auto_26125 ) ) ( HOLDING ?auto_26121 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26121 )
      ( MAKE-3PILE ?auto_26121 ?auto_26122 ?auto_26123 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26126 - BLOCK
      ?auto_26127 - BLOCK
      ?auto_26128 - BLOCK
    )
    :vars
    (
      ?auto_26130 - BLOCK
      ?auto_26129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26126 ?auto_26127 ) ) ( not ( = ?auto_26126 ?auto_26128 ) ) ( not ( = ?auto_26127 ?auto_26128 ) ) ( ON ?auto_26128 ?auto_26130 ) ( not ( = ?auto_26126 ?auto_26130 ) ) ( not ( = ?auto_26127 ?auto_26130 ) ) ( not ( = ?auto_26128 ?auto_26130 ) ) ( ON ?auto_26127 ?auto_26128 ) ( ON-TABLE ?auto_26129 ) ( ON ?auto_26130 ?auto_26129 ) ( not ( = ?auto_26129 ?auto_26130 ) ) ( not ( = ?auto_26129 ?auto_26128 ) ) ( not ( = ?auto_26129 ?auto_26127 ) ) ( not ( = ?auto_26126 ?auto_26129 ) ) ( ON ?auto_26126 ?auto_26127 ) ( CLEAR ?auto_26126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26129 ?auto_26130 ?auto_26128 ?auto_26127 )
      ( MAKE-3PILE ?auto_26126 ?auto_26127 ?auto_26128 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26131 - BLOCK
      ?auto_26132 - BLOCK
      ?auto_26133 - BLOCK
    )
    :vars
    (
      ?auto_26134 - BLOCK
      ?auto_26135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26131 ?auto_26132 ) ) ( not ( = ?auto_26131 ?auto_26133 ) ) ( not ( = ?auto_26132 ?auto_26133 ) ) ( ON ?auto_26133 ?auto_26134 ) ( not ( = ?auto_26131 ?auto_26134 ) ) ( not ( = ?auto_26132 ?auto_26134 ) ) ( not ( = ?auto_26133 ?auto_26134 ) ) ( ON ?auto_26132 ?auto_26133 ) ( ON-TABLE ?auto_26135 ) ( ON ?auto_26134 ?auto_26135 ) ( not ( = ?auto_26135 ?auto_26134 ) ) ( not ( = ?auto_26135 ?auto_26133 ) ) ( not ( = ?auto_26135 ?auto_26132 ) ) ( not ( = ?auto_26131 ?auto_26135 ) ) ( HOLDING ?auto_26131 ) ( CLEAR ?auto_26132 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26135 ?auto_26134 ?auto_26133 ?auto_26132 ?auto_26131 )
      ( MAKE-3PILE ?auto_26131 ?auto_26132 ?auto_26133 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26136 - BLOCK
      ?auto_26137 - BLOCK
      ?auto_26138 - BLOCK
    )
    :vars
    (
      ?auto_26140 - BLOCK
      ?auto_26139 - BLOCK
      ?auto_26141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26136 ?auto_26137 ) ) ( not ( = ?auto_26136 ?auto_26138 ) ) ( not ( = ?auto_26137 ?auto_26138 ) ) ( ON ?auto_26138 ?auto_26140 ) ( not ( = ?auto_26136 ?auto_26140 ) ) ( not ( = ?auto_26137 ?auto_26140 ) ) ( not ( = ?auto_26138 ?auto_26140 ) ) ( ON ?auto_26137 ?auto_26138 ) ( ON-TABLE ?auto_26139 ) ( ON ?auto_26140 ?auto_26139 ) ( not ( = ?auto_26139 ?auto_26140 ) ) ( not ( = ?auto_26139 ?auto_26138 ) ) ( not ( = ?auto_26139 ?auto_26137 ) ) ( not ( = ?auto_26136 ?auto_26139 ) ) ( CLEAR ?auto_26137 ) ( ON ?auto_26136 ?auto_26141 ) ( CLEAR ?auto_26136 ) ( HAND-EMPTY ) ( not ( = ?auto_26136 ?auto_26141 ) ) ( not ( = ?auto_26137 ?auto_26141 ) ) ( not ( = ?auto_26138 ?auto_26141 ) ) ( not ( = ?auto_26140 ?auto_26141 ) ) ( not ( = ?auto_26139 ?auto_26141 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26136 ?auto_26141 )
      ( MAKE-3PILE ?auto_26136 ?auto_26137 ?auto_26138 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26142 - BLOCK
      ?auto_26143 - BLOCK
      ?auto_26144 - BLOCK
    )
    :vars
    (
      ?auto_26147 - BLOCK
      ?auto_26145 - BLOCK
      ?auto_26146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26142 ?auto_26143 ) ) ( not ( = ?auto_26142 ?auto_26144 ) ) ( not ( = ?auto_26143 ?auto_26144 ) ) ( ON ?auto_26144 ?auto_26147 ) ( not ( = ?auto_26142 ?auto_26147 ) ) ( not ( = ?auto_26143 ?auto_26147 ) ) ( not ( = ?auto_26144 ?auto_26147 ) ) ( ON-TABLE ?auto_26145 ) ( ON ?auto_26147 ?auto_26145 ) ( not ( = ?auto_26145 ?auto_26147 ) ) ( not ( = ?auto_26145 ?auto_26144 ) ) ( not ( = ?auto_26145 ?auto_26143 ) ) ( not ( = ?auto_26142 ?auto_26145 ) ) ( ON ?auto_26142 ?auto_26146 ) ( CLEAR ?auto_26142 ) ( not ( = ?auto_26142 ?auto_26146 ) ) ( not ( = ?auto_26143 ?auto_26146 ) ) ( not ( = ?auto_26144 ?auto_26146 ) ) ( not ( = ?auto_26147 ?auto_26146 ) ) ( not ( = ?auto_26145 ?auto_26146 ) ) ( HOLDING ?auto_26143 ) ( CLEAR ?auto_26144 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26145 ?auto_26147 ?auto_26144 ?auto_26143 )
      ( MAKE-3PILE ?auto_26142 ?auto_26143 ?auto_26144 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26148 - BLOCK
      ?auto_26149 - BLOCK
      ?auto_26150 - BLOCK
    )
    :vars
    (
      ?auto_26152 - BLOCK
      ?auto_26153 - BLOCK
      ?auto_26151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26148 ?auto_26149 ) ) ( not ( = ?auto_26148 ?auto_26150 ) ) ( not ( = ?auto_26149 ?auto_26150 ) ) ( ON ?auto_26150 ?auto_26152 ) ( not ( = ?auto_26148 ?auto_26152 ) ) ( not ( = ?auto_26149 ?auto_26152 ) ) ( not ( = ?auto_26150 ?auto_26152 ) ) ( ON-TABLE ?auto_26153 ) ( ON ?auto_26152 ?auto_26153 ) ( not ( = ?auto_26153 ?auto_26152 ) ) ( not ( = ?auto_26153 ?auto_26150 ) ) ( not ( = ?auto_26153 ?auto_26149 ) ) ( not ( = ?auto_26148 ?auto_26153 ) ) ( ON ?auto_26148 ?auto_26151 ) ( not ( = ?auto_26148 ?auto_26151 ) ) ( not ( = ?auto_26149 ?auto_26151 ) ) ( not ( = ?auto_26150 ?auto_26151 ) ) ( not ( = ?auto_26152 ?auto_26151 ) ) ( not ( = ?auto_26153 ?auto_26151 ) ) ( CLEAR ?auto_26150 ) ( ON ?auto_26149 ?auto_26148 ) ( CLEAR ?auto_26149 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26151 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26151 ?auto_26148 )
      ( MAKE-3PILE ?auto_26148 ?auto_26149 ?auto_26150 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26154 - BLOCK
      ?auto_26155 - BLOCK
      ?auto_26156 - BLOCK
    )
    :vars
    (
      ?auto_26158 - BLOCK
      ?auto_26157 - BLOCK
      ?auto_26159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26154 ?auto_26155 ) ) ( not ( = ?auto_26154 ?auto_26156 ) ) ( not ( = ?auto_26155 ?auto_26156 ) ) ( not ( = ?auto_26154 ?auto_26158 ) ) ( not ( = ?auto_26155 ?auto_26158 ) ) ( not ( = ?auto_26156 ?auto_26158 ) ) ( ON-TABLE ?auto_26157 ) ( ON ?auto_26158 ?auto_26157 ) ( not ( = ?auto_26157 ?auto_26158 ) ) ( not ( = ?auto_26157 ?auto_26156 ) ) ( not ( = ?auto_26157 ?auto_26155 ) ) ( not ( = ?auto_26154 ?auto_26157 ) ) ( ON ?auto_26154 ?auto_26159 ) ( not ( = ?auto_26154 ?auto_26159 ) ) ( not ( = ?auto_26155 ?auto_26159 ) ) ( not ( = ?auto_26156 ?auto_26159 ) ) ( not ( = ?auto_26158 ?auto_26159 ) ) ( not ( = ?auto_26157 ?auto_26159 ) ) ( ON ?auto_26155 ?auto_26154 ) ( CLEAR ?auto_26155 ) ( ON-TABLE ?auto_26159 ) ( HOLDING ?auto_26156 ) ( CLEAR ?auto_26158 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26157 ?auto_26158 ?auto_26156 )
      ( MAKE-3PILE ?auto_26154 ?auto_26155 ?auto_26156 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26160 - BLOCK
      ?auto_26161 - BLOCK
      ?auto_26162 - BLOCK
    )
    :vars
    (
      ?auto_26164 - BLOCK
      ?auto_26163 - BLOCK
      ?auto_26165 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26160 ?auto_26161 ) ) ( not ( = ?auto_26160 ?auto_26162 ) ) ( not ( = ?auto_26161 ?auto_26162 ) ) ( not ( = ?auto_26160 ?auto_26164 ) ) ( not ( = ?auto_26161 ?auto_26164 ) ) ( not ( = ?auto_26162 ?auto_26164 ) ) ( ON-TABLE ?auto_26163 ) ( ON ?auto_26164 ?auto_26163 ) ( not ( = ?auto_26163 ?auto_26164 ) ) ( not ( = ?auto_26163 ?auto_26162 ) ) ( not ( = ?auto_26163 ?auto_26161 ) ) ( not ( = ?auto_26160 ?auto_26163 ) ) ( ON ?auto_26160 ?auto_26165 ) ( not ( = ?auto_26160 ?auto_26165 ) ) ( not ( = ?auto_26161 ?auto_26165 ) ) ( not ( = ?auto_26162 ?auto_26165 ) ) ( not ( = ?auto_26164 ?auto_26165 ) ) ( not ( = ?auto_26163 ?auto_26165 ) ) ( ON ?auto_26161 ?auto_26160 ) ( ON-TABLE ?auto_26165 ) ( CLEAR ?auto_26164 ) ( ON ?auto_26162 ?auto_26161 ) ( CLEAR ?auto_26162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26165 ?auto_26160 ?auto_26161 )
      ( MAKE-3PILE ?auto_26160 ?auto_26161 ?auto_26162 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26166 - BLOCK
      ?auto_26167 - BLOCK
      ?auto_26168 - BLOCK
    )
    :vars
    (
      ?auto_26171 - BLOCK
      ?auto_26169 - BLOCK
      ?auto_26170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26166 ?auto_26167 ) ) ( not ( = ?auto_26166 ?auto_26168 ) ) ( not ( = ?auto_26167 ?auto_26168 ) ) ( not ( = ?auto_26166 ?auto_26171 ) ) ( not ( = ?auto_26167 ?auto_26171 ) ) ( not ( = ?auto_26168 ?auto_26171 ) ) ( ON-TABLE ?auto_26169 ) ( not ( = ?auto_26169 ?auto_26171 ) ) ( not ( = ?auto_26169 ?auto_26168 ) ) ( not ( = ?auto_26169 ?auto_26167 ) ) ( not ( = ?auto_26166 ?auto_26169 ) ) ( ON ?auto_26166 ?auto_26170 ) ( not ( = ?auto_26166 ?auto_26170 ) ) ( not ( = ?auto_26167 ?auto_26170 ) ) ( not ( = ?auto_26168 ?auto_26170 ) ) ( not ( = ?auto_26171 ?auto_26170 ) ) ( not ( = ?auto_26169 ?auto_26170 ) ) ( ON ?auto_26167 ?auto_26166 ) ( ON-TABLE ?auto_26170 ) ( ON ?auto_26168 ?auto_26167 ) ( CLEAR ?auto_26168 ) ( HOLDING ?auto_26171 ) ( CLEAR ?auto_26169 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26169 ?auto_26171 )
      ( MAKE-3PILE ?auto_26166 ?auto_26167 ?auto_26168 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26172 - BLOCK
      ?auto_26173 - BLOCK
      ?auto_26174 - BLOCK
    )
    :vars
    (
      ?auto_26177 - BLOCK
      ?auto_26176 - BLOCK
      ?auto_26175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26172 ?auto_26173 ) ) ( not ( = ?auto_26172 ?auto_26174 ) ) ( not ( = ?auto_26173 ?auto_26174 ) ) ( not ( = ?auto_26172 ?auto_26177 ) ) ( not ( = ?auto_26173 ?auto_26177 ) ) ( not ( = ?auto_26174 ?auto_26177 ) ) ( ON-TABLE ?auto_26176 ) ( not ( = ?auto_26176 ?auto_26177 ) ) ( not ( = ?auto_26176 ?auto_26174 ) ) ( not ( = ?auto_26176 ?auto_26173 ) ) ( not ( = ?auto_26172 ?auto_26176 ) ) ( ON ?auto_26172 ?auto_26175 ) ( not ( = ?auto_26172 ?auto_26175 ) ) ( not ( = ?auto_26173 ?auto_26175 ) ) ( not ( = ?auto_26174 ?auto_26175 ) ) ( not ( = ?auto_26177 ?auto_26175 ) ) ( not ( = ?auto_26176 ?auto_26175 ) ) ( ON ?auto_26173 ?auto_26172 ) ( ON-TABLE ?auto_26175 ) ( ON ?auto_26174 ?auto_26173 ) ( CLEAR ?auto_26176 ) ( ON ?auto_26177 ?auto_26174 ) ( CLEAR ?auto_26177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26175 ?auto_26172 ?auto_26173 ?auto_26174 )
      ( MAKE-3PILE ?auto_26172 ?auto_26173 ?auto_26174 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26178 - BLOCK
      ?auto_26179 - BLOCK
      ?auto_26180 - BLOCK
    )
    :vars
    (
      ?auto_26183 - BLOCK
      ?auto_26182 - BLOCK
      ?auto_26181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26178 ?auto_26179 ) ) ( not ( = ?auto_26178 ?auto_26180 ) ) ( not ( = ?auto_26179 ?auto_26180 ) ) ( not ( = ?auto_26178 ?auto_26183 ) ) ( not ( = ?auto_26179 ?auto_26183 ) ) ( not ( = ?auto_26180 ?auto_26183 ) ) ( not ( = ?auto_26182 ?auto_26183 ) ) ( not ( = ?auto_26182 ?auto_26180 ) ) ( not ( = ?auto_26182 ?auto_26179 ) ) ( not ( = ?auto_26178 ?auto_26182 ) ) ( ON ?auto_26178 ?auto_26181 ) ( not ( = ?auto_26178 ?auto_26181 ) ) ( not ( = ?auto_26179 ?auto_26181 ) ) ( not ( = ?auto_26180 ?auto_26181 ) ) ( not ( = ?auto_26183 ?auto_26181 ) ) ( not ( = ?auto_26182 ?auto_26181 ) ) ( ON ?auto_26179 ?auto_26178 ) ( ON-TABLE ?auto_26181 ) ( ON ?auto_26180 ?auto_26179 ) ( ON ?auto_26183 ?auto_26180 ) ( CLEAR ?auto_26183 ) ( HOLDING ?auto_26182 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26182 )
      ( MAKE-3PILE ?auto_26178 ?auto_26179 ?auto_26180 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26184 - BLOCK
      ?auto_26185 - BLOCK
      ?auto_26186 - BLOCK
    )
    :vars
    (
      ?auto_26188 - BLOCK
      ?auto_26187 - BLOCK
      ?auto_26189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26184 ?auto_26185 ) ) ( not ( = ?auto_26184 ?auto_26186 ) ) ( not ( = ?auto_26185 ?auto_26186 ) ) ( not ( = ?auto_26184 ?auto_26188 ) ) ( not ( = ?auto_26185 ?auto_26188 ) ) ( not ( = ?auto_26186 ?auto_26188 ) ) ( not ( = ?auto_26187 ?auto_26188 ) ) ( not ( = ?auto_26187 ?auto_26186 ) ) ( not ( = ?auto_26187 ?auto_26185 ) ) ( not ( = ?auto_26184 ?auto_26187 ) ) ( ON ?auto_26184 ?auto_26189 ) ( not ( = ?auto_26184 ?auto_26189 ) ) ( not ( = ?auto_26185 ?auto_26189 ) ) ( not ( = ?auto_26186 ?auto_26189 ) ) ( not ( = ?auto_26188 ?auto_26189 ) ) ( not ( = ?auto_26187 ?auto_26189 ) ) ( ON ?auto_26185 ?auto_26184 ) ( ON-TABLE ?auto_26189 ) ( ON ?auto_26186 ?auto_26185 ) ( ON ?auto_26188 ?auto_26186 ) ( ON ?auto_26187 ?auto_26188 ) ( CLEAR ?auto_26187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26189 ?auto_26184 ?auto_26185 ?auto_26186 ?auto_26188 )
      ( MAKE-3PILE ?auto_26184 ?auto_26185 ?auto_26186 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26191 - BLOCK
    )
    :vars
    (
      ?auto_26192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26192 ?auto_26191 ) ( CLEAR ?auto_26192 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26191 ) ( not ( = ?auto_26191 ?auto_26192 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26192 ?auto_26191 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26193 - BLOCK
    )
    :vars
    (
      ?auto_26194 - BLOCK
      ?auto_26195 - BLOCK
      ?auto_26196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26194 ?auto_26193 ) ( CLEAR ?auto_26194 ) ( ON-TABLE ?auto_26193 ) ( not ( = ?auto_26193 ?auto_26194 ) ) ( HOLDING ?auto_26195 ) ( CLEAR ?auto_26196 ) ( not ( = ?auto_26193 ?auto_26195 ) ) ( not ( = ?auto_26193 ?auto_26196 ) ) ( not ( = ?auto_26194 ?auto_26195 ) ) ( not ( = ?auto_26194 ?auto_26196 ) ) ( not ( = ?auto_26195 ?auto_26196 ) ) )
    :subtasks
    ( ( !STACK ?auto_26195 ?auto_26196 )
      ( MAKE-1PILE ?auto_26193 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26197 - BLOCK
    )
    :vars
    (
      ?auto_26199 - BLOCK
      ?auto_26200 - BLOCK
      ?auto_26198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26199 ?auto_26197 ) ( ON-TABLE ?auto_26197 ) ( not ( = ?auto_26197 ?auto_26199 ) ) ( CLEAR ?auto_26200 ) ( not ( = ?auto_26197 ?auto_26198 ) ) ( not ( = ?auto_26197 ?auto_26200 ) ) ( not ( = ?auto_26199 ?auto_26198 ) ) ( not ( = ?auto_26199 ?auto_26200 ) ) ( not ( = ?auto_26198 ?auto_26200 ) ) ( ON ?auto_26198 ?auto_26199 ) ( CLEAR ?auto_26198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26197 ?auto_26199 )
      ( MAKE-1PILE ?auto_26197 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26201 - BLOCK
    )
    :vars
    (
      ?auto_26204 - BLOCK
      ?auto_26203 - BLOCK
      ?auto_26202 - BLOCK
      ?auto_26205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26204 ?auto_26201 ) ( ON-TABLE ?auto_26201 ) ( not ( = ?auto_26201 ?auto_26204 ) ) ( not ( = ?auto_26201 ?auto_26203 ) ) ( not ( = ?auto_26201 ?auto_26202 ) ) ( not ( = ?auto_26204 ?auto_26203 ) ) ( not ( = ?auto_26204 ?auto_26202 ) ) ( not ( = ?auto_26203 ?auto_26202 ) ) ( ON ?auto_26203 ?auto_26204 ) ( CLEAR ?auto_26203 ) ( HOLDING ?auto_26202 ) ( CLEAR ?auto_26205 ) ( ON-TABLE ?auto_26205 ) ( not ( = ?auto_26205 ?auto_26202 ) ) ( not ( = ?auto_26201 ?auto_26205 ) ) ( not ( = ?auto_26204 ?auto_26205 ) ) ( not ( = ?auto_26203 ?auto_26205 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26205 ?auto_26202 )
      ( MAKE-1PILE ?auto_26201 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26206 - BLOCK
    )
    :vars
    (
      ?auto_26210 - BLOCK
      ?auto_26209 - BLOCK
      ?auto_26207 - BLOCK
      ?auto_26208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26210 ?auto_26206 ) ( ON-TABLE ?auto_26206 ) ( not ( = ?auto_26206 ?auto_26210 ) ) ( not ( = ?auto_26206 ?auto_26209 ) ) ( not ( = ?auto_26206 ?auto_26207 ) ) ( not ( = ?auto_26210 ?auto_26209 ) ) ( not ( = ?auto_26210 ?auto_26207 ) ) ( not ( = ?auto_26209 ?auto_26207 ) ) ( ON ?auto_26209 ?auto_26210 ) ( CLEAR ?auto_26208 ) ( ON-TABLE ?auto_26208 ) ( not ( = ?auto_26208 ?auto_26207 ) ) ( not ( = ?auto_26206 ?auto_26208 ) ) ( not ( = ?auto_26210 ?auto_26208 ) ) ( not ( = ?auto_26209 ?auto_26208 ) ) ( ON ?auto_26207 ?auto_26209 ) ( CLEAR ?auto_26207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26206 ?auto_26210 ?auto_26209 )
      ( MAKE-1PILE ?auto_26206 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26211 - BLOCK
    )
    :vars
    (
      ?auto_26215 - BLOCK
      ?auto_26214 - BLOCK
      ?auto_26212 - BLOCK
      ?auto_26213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26215 ?auto_26211 ) ( ON-TABLE ?auto_26211 ) ( not ( = ?auto_26211 ?auto_26215 ) ) ( not ( = ?auto_26211 ?auto_26214 ) ) ( not ( = ?auto_26211 ?auto_26212 ) ) ( not ( = ?auto_26215 ?auto_26214 ) ) ( not ( = ?auto_26215 ?auto_26212 ) ) ( not ( = ?auto_26214 ?auto_26212 ) ) ( ON ?auto_26214 ?auto_26215 ) ( not ( = ?auto_26213 ?auto_26212 ) ) ( not ( = ?auto_26211 ?auto_26213 ) ) ( not ( = ?auto_26215 ?auto_26213 ) ) ( not ( = ?auto_26214 ?auto_26213 ) ) ( ON ?auto_26212 ?auto_26214 ) ( CLEAR ?auto_26212 ) ( HOLDING ?auto_26213 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26213 )
      ( MAKE-1PILE ?auto_26211 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26216 - BLOCK
    )
    :vars
    (
      ?auto_26220 - BLOCK
      ?auto_26219 - BLOCK
      ?auto_26217 - BLOCK
      ?auto_26218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26220 ?auto_26216 ) ( ON-TABLE ?auto_26216 ) ( not ( = ?auto_26216 ?auto_26220 ) ) ( not ( = ?auto_26216 ?auto_26219 ) ) ( not ( = ?auto_26216 ?auto_26217 ) ) ( not ( = ?auto_26220 ?auto_26219 ) ) ( not ( = ?auto_26220 ?auto_26217 ) ) ( not ( = ?auto_26219 ?auto_26217 ) ) ( ON ?auto_26219 ?auto_26220 ) ( not ( = ?auto_26218 ?auto_26217 ) ) ( not ( = ?auto_26216 ?auto_26218 ) ) ( not ( = ?auto_26220 ?auto_26218 ) ) ( not ( = ?auto_26219 ?auto_26218 ) ) ( ON ?auto_26217 ?auto_26219 ) ( ON ?auto_26218 ?auto_26217 ) ( CLEAR ?auto_26218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26216 ?auto_26220 ?auto_26219 ?auto_26217 )
      ( MAKE-1PILE ?auto_26216 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26221 - BLOCK
    )
    :vars
    (
      ?auto_26223 - BLOCK
      ?auto_26225 - BLOCK
      ?auto_26222 - BLOCK
      ?auto_26224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26223 ?auto_26221 ) ( ON-TABLE ?auto_26221 ) ( not ( = ?auto_26221 ?auto_26223 ) ) ( not ( = ?auto_26221 ?auto_26225 ) ) ( not ( = ?auto_26221 ?auto_26222 ) ) ( not ( = ?auto_26223 ?auto_26225 ) ) ( not ( = ?auto_26223 ?auto_26222 ) ) ( not ( = ?auto_26225 ?auto_26222 ) ) ( ON ?auto_26225 ?auto_26223 ) ( not ( = ?auto_26224 ?auto_26222 ) ) ( not ( = ?auto_26221 ?auto_26224 ) ) ( not ( = ?auto_26223 ?auto_26224 ) ) ( not ( = ?auto_26225 ?auto_26224 ) ) ( ON ?auto_26222 ?auto_26225 ) ( HOLDING ?auto_26224 ) ( CLEAR ?auto_26222 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26221 ?auto_26223 ?auto_26225 ?auto_26222 ?auto_26224 )
      ( MAKE-1PILE ?auto_26221 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26226 - BLOCK
    )
    :vars
    (
      ?auto_26230 - BLOCK
      ?auto_26228 - BLOCK
      ?auto_26227 - BLOCK
      ?auto_26229 - BLOCK
      ?auto_26231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26230 ?auto_26226 ) ( ON-TABLE ?auto_26226 ) ( not ( = ?auto_26226 ?auto_26230 ) ) ( not ( = ?auto_26226 ?auto_26228 ) ) ( not ( = ?auto_26226 ?auto_26227 ) ) ( not ( = ?auto_26230 ?auto_26228 ) ) ( not ( = ?auto_26230 ?auto_26227 ) ) ( not ( = ?auto_26228 ?auto_26227 ) ) ( ON ?auto_26228 ?auto_26230 ) ( not ( = ?auto_26229 ?auto_26227 ) ) ( not ( = ?auto_26226 ?auto_26229 ) ) ( not ( = ?auto_26230 ?auto_26229 ) ) ( not ( = ?auto_26228 ?auto_26229 ) ) ( ON ?auto_26227 ?auto_26228 ) ( CLEAR ?auto_26227 ) ( ON ?auto_26229 ?auto_26231 ) ( CLEAR ?auto_26229 ) ( HAND-EMPTY ) ( not ( = ?auto_26226 ?auto_26231 ) ) ( not ( = ?auto_26230 ?auto_26231 ) ) ( not ( = ?auto_26228 ?auto_26231 ) ) ( not ( = ?auto_26227 ?auto_26231 ) ) ( not ( = ?auto_26229 ?auto_26231 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26229 ?auto_26231 )
      ( MAKE-1PILE ?auto_26226 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26232 - BLOCK
    )
    :vars
    (
      ?auto_26234 - BLOCK
      ?auto_26236 - BLOCK
      ?auto_26233 - BLOCK
      ?auto_26237 - BLOCK
      ?auto_26235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26234 ?auto_26232 ) ( ON-TABLE ?auto_26232 ) ( not ( = ?auto_26232 ?auto_26234 ) ) ( not ( = ?auto_26232 ?auto_26236 ) ) ( not ( = ?auto_26232 ?auto_26233 ) ) ( not ( = ?auto_26234 ?auto_26236 ) ) ( not ( = ?auto_26234 ?auto_26233 ) ) ( not ( = ?auto_26236 ?auto_26233 ) ) ( ON ?auto_26236 ?auto_26234 ) ( not ( = ?auto_26237 ?auto_26233 ) ) ( not ( = ?auto_26232 ?auto_26237 ) ) ( not ( = ?auto_26234 ?auto_26237 ) ) ( not ( = ?auto_26236 ?auto_26237 ) ) ( ON ?auto_26237 ?auto_26235 ) ( CLEAR ?auto_26237 ) ( not ( = ?auto_26232 ?auto_26235 ) ) ( not ( = ?auto_26234 ?auto_26235 ) ) ( not ( = ?auto_26236 ?auto_26235 ) ) ( not ( = ?auto_26233 ?auto_26235 ) ) ( not ( = ?auto_26237 ?auto_26235 ) ) ( HOLDING ?auto_26233 ) ( CLEAR ?auto_26236 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26232 ?auto_26234 ?auto_26236 ?auto_26233 )
      ( MAKE-1PILE ?auto_26232 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26238 - BLOCK
    )
    :vars
    (
      ?auto_26241 - BLOCK
      ?auto_26243 - BLOCK
      ?auto_26240 - BLOCK
      ?auto_26239 - BLOCK
      ?auto_26242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26241 ?auto_26238 ) ( ON-TABLE ?auto_26238 ) ( not ( = ?auto_26238 ?auto_26241 ) ) ( not ( = ?auto_26238 ?auto_26243 ) ) ( not ( = ?auto_26238 ?auto_26240 ) ) ( not ( = ?auto_26241 ?auto_26243 ) ) ( not ( = ?auto_26241 ?auto_26240 ) ) ( not ( = ?auto_26243 ?auto_26240 ) ) ( ON ?auto_26243 ?auto_26241 ) ( not ( = ?auto_26239 ?auto_26240 ) ) ( not ( = ?auto_26238 ?auto_26239 ) ) ( not ( = ?auto_26241 ?auto_26239 ) ) ( not ( = ?auto_26243 ?auto_26239 ) ) ( ON ?auto_26239 ?auto_26242 ) ( not ( = ?auto_26238 ?auto_26242 ) ) ( not ( = ?auto_26241 ?auto_26242 ) ) ( not ( = ?auto_26243 ?auto_26242 ) ) ( not ( = ?auto_26240 ?auto_26242 ) ) ( not ( = ?auto_26239 ?auto_26242 ) ) ( CLEAR ?auto_26243 ) ( ON ?auto_26240 ?auto_26239 ) ( CLEAR ?auto_26240 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26242 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26242 ?auto_26239 )
      ( MAKE-1PILE ?auto_26238 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26244 - BLOCK
    )
    :vars
    (
      ?auto_26246 - BLOCK
      ?auto_26249 - BLOCK
      ?auto_26247 - BLOCK
      ?auto_26248 - BLOCK
      ?auto_26245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26246 ?auto_26244 ) ( ON-TABLE ?auto_26244 ) ( not ( = ?auto_26244 ?auto_26246 ) ) ( not ( = ?auto_26244 ?auto_26249 ) ) ( not ( = ?auto_26244 ?auto_26247 ) ) ( not ( = ?auto_26246 ?auto_26249 ) ) ( not ( = ?auto_26246 ?auto_26247 ) ) ( not ( = ?auto_26249 ?auto_26247 ) ) ( not ( = ?auto_26248 ?auto_26247 ) ) ( not ( = ?auto_26244 ?auto_26248 ) ) ( not ( = ?auto_26246 ?auto_26248 ) ) ( not ( = ?auto_26249 ?auto_26248 ) ) ( ON ?auto_26248 ?auto_26245 ) ( not ( = ?auto_26244 ?auto_26245 ) ) ( not ( = ?auto_26246 ?auto_26245 ) ) ( not ( = ?auto_26249 ?auto_26245 ) ) ( not ( = ?auto_26247 ?auto_26245 ) ) ( not ( = ?auto_26248 ?auto_26245 ) ) ( ON ?auto_26247 ?auto_26248 ) ( CLEAR ?auto_26247 ) ( ON-TABLE ?auto_26245 ) ( HOLDING ?auto_26249 ) ( CLEAR ?auto_26246 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26244 ?auto_26246 ?auto_26249 )
      ( MAKE-1PILE ?auto_26244 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26250 - BLOCK
    )
    :vars
    (
      ?auto_26253 - BLOCK
      ?auto_26251 - BLOCK
      ?auto_26255 - BLOCK
      ?auto_26254 - BLOCK
      ?auto_26252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26253 ?auto_26250 ) ( ON-TABLE ?auto_26250 ) ( not ( = ?auto_26250 ?auto_26253 ) ) ( not ( = ?auto_26250 ?auto_26251 ) ) ( not ( = ?auto_26250 ?auto_26255 ) ) ( not ( = ?auto_26253 ?auto_26251 ) ) ( not ( = ?auto_26253 ?auto_26255 ) ) ( not ( = ?auto_26251 ?auto_26255 ) ) ( not ( = ?auto_26254 ?auto_26255 ) ) ( not ( = ?auto_26250 ?auto_26254 ) ) ( not ( = ?auto_26253 ?auto_26254 ) ) ( not ( = ?auto_26251 ?auto_26254 ) ) ( ON ?auto_26254 ?auto_26252 ) ( not ( = ?auto_26250 ?auto_26252 ) ) ( not ( = ?auto_26253 ?auto_26252 ) ) ( not ( = ?auto_26251 ?auto_26252 ) ) ( not ( = ?auto_26255 ?auto_26252 ) ) ( not ( = ?auto_26254 ?auto_26252 ) ) ( ON ?auto_26255 ?auto_26254 ) ( ON-TABLE ?auto_26252 ) ( CLEAR ?auto_26253 ) ( ON ?auto_26251 ?auto_26255 ) ( CLEAR ?auto_26251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26252 ?auto_26254 ?auto_26255 )
      ( MAKE-1PILE ?auto_26250 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26268 - BLOCK
    )
    :vars
    (
      ?auto_26270 - BLOCK
      ?auto_26272 - BLOCK
      ?auto_26271 - BLOCK
      ?auto_26269 - BLOCK
      ?auto_26273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26268 ?auto_26270 ) ) ( not ( = ?auto_26268 ?auto_26272 ) ) ( not ( = ?auto_26268 ?auto_26271 ) ) ( not ( = ?auto_26270 ?auto_26272 ) ) ( not ( = ?auto_26270 ?auto_26271 ) ) ( not ( = ?auto_26272 ?auto_26271 ) ) ( not ( = ?auto_26269 ?auto_26271 ) ) ( not ( = ?auto_26268 ?auto_26269 ) ) ( not ( = ?auto_26270 ?auto_26269 ) ) ( not ( = ?auto_26272 ?auto_26269 ) ) ( ON ?auto_26269 ?auto_26273 ) ( not ( = ?auto_26268 ?auto_26273 ) ) ( not ( = ?auto_26270 ?auto_26273 ) ) ( not ( = ?auto_26272 ?auto_26273 ) ) ( not ( = ?auto_26271 ?auto_26273 ) ) ( not ( = ?auto_26269 ?auto_26273 ) ) ( ON ?auto_26271 ?auto_26269 ) ( ON-TABLE ?auto_26273 ) ( ON ?auto_26272 ?auto_26271 ) ( ON ?auto_26270 ?auto_26272 ) ( CLEAR ?auto_26270 ) ( HOLDING ?auto_26268 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26268 ?auto_26270 )
      ( MAKE-1PILE ?auto_26268 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26274 - BLOCK
    )
    :vars
    (
      ?auto_26278 - BLOCK
      ?auto_26279 - BLOCK
      ?auto_26277 - BLOCK
      ?auto_26275 - BLOCK
      ?auto_26276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26274 ?auto_26278 ) ) ( not ( = ?auto_26274 ?auto_26279 ) ) ( not ( = ?auto_26274 ?auto_26277 ) ) ( not ( = ?auto_26278 ?auto_26279 ) ) ( not ( = ?auto_26278 ?auto_26277 ) ) ( not ( = ?auto_26279 ?auto_26277 ) ) ( not ( = ?auto_26275 ?auto_26277 ) ) ( not ( = ?auto_26274 ?auto_26275 ) ) ( not ( = ?auto_26278 ?auto_26275 ) ) ( not ( = ?auto_26279 ?auto_26275 ) ) ( ON ?auto_26275 ?auto_26276 ) ( not ( = ?auto_26274 ?auto_26276 ) ) ( not ( = ?auto_26278 ?auto_26276 ) ) ( not ( = ?auto_26279 ?auto_26276 ) ) ( not ( = ?auto_26277 ?auto_26276 ) ) ( not ( = ?auto_26275 ?auto_26276 ) ) ( ON ?auto_26277 ?auto_26275 ) ( ON-TABLE ?auto_26276 ) ( ON ?auto_26279 ?auto_26277 ) ( ON ?auto_26278 ?auto_26279 ) ( ON ?auto_26274 ?auto_26278 ) ( CLEAR ?auto_26274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26276 ?auto_26275 ?auto_26277 ?auto_26279 ?auto_26278 )
      ( MAKE-1PILE ?auto_26274 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26284 - BLOCK
      ?auto_26285 - BLOCK
      ?auto_26286 - BLOCK
      ?auto_26287 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_26287 ) ( CLEAR ?auto_26286 ) ( ON-TABLE ?auto_26284 ) ( ON ?auto_26285 ?auto_26284 ) ( ON ?auto_26286 ?auto_26285 ) ( not ( = ?auto_26284 ?auto_26285 ) ) ( not ( = ?auto_26284 ?auto_26286 ) ) ( not ( = ?auto_26284 ?auto_26287 ) ) ( not ( = ?auto_26285 ?auto_26286 ) ) ( not ( = ?auto_26285 ?auto_26287 ) ) ( not ( = ?auto_26286 ?auto_26287 ) ) )
    :subtasks
    ( ( !STACK ?auto_26287 ?auto_26286 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26288 - BLOCK
      ?auto_26289 - BLOCK
      ?auto_26290 - BLOCK
      ?auto_26291 - BLOCK
    )
    :vars
    (
      ?auto_26292 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26290 ) ( ON-TABLE ?auto_26288 ) ( ON ?auto_26289 ?auto_26288 ) ( ON ?auto_26290 ?auto_26289 ) ( not ( = ?auto_26288 ?auto_26289 ) ) ( not ( = ?auto_26288 ?auto_26290 ) ) ( not ( = ?auto_26288 ?auto_26291 ) ) ( not ( = ?auto_26289 ?auto_26290 ) ) ( not ( = ?auto_26289 ?auto_26291 ) ) ( not ( = ?auto_26290 ?auto_26291 ) ) ( ON ?auto_26291 ?auto_26292 ) ( CLEAR ?auto_26291 ) ( HAND-EMPTY ) ( not ( = ?auto_26288 ?auto_26292 ) ) ( not ( = ?auto_26289 ?auto_26292 ) ) ( not ( = ?auto_26290 ?auto_26292 ) ) ( not ( = ?auto_26291 ?auto_26292 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26291 ?auto_26292 )
      ( MAKE-4PILE ?auto_26288 ?auto_26289 ?auto_26290 ?auto_26291 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26293 - BLOCK
      ?auto_26294 - BLOCK
      ?auto_26295 - BLOCK
      ?auto_26296 - BLOCK
    )
    :vars
    (
      ?auto_26297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26293 ) ( ON ?auto_26294 ?auto_26293 ) ( not ( = ?auto_26293 ?auto_26294 ) ) ( not ( = ?auto_26293 ?auto_26295 ) ) ( not ( = ?auto_26293 ?auto_26296 ) ) ( not ( = ?auto_26294 ?auto_26295 ) ) ( not ( = ?auto_26294 ?auto_26296 ) ) ( not ( = ?auto_26295 ?auto_26296 ) ) ( ON ?auto_26296 ?auto_26297 ) ( CLEAR ?auto_26296 ) ( not ( = ?auto_26293 ?auto_26297 ) ) ( not ( = ?auto_26294 ?auto_26297 ) ) ( not ( = ?auto_26295 ?auto_26297 ) ) ( not ( = ?auto_26296 ?auto_26297 ) ) ( HOLDING ?auto_26295 ) ( CLEAR ?auto_26294 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26293 ?auto_26294 ?auto_26295 )
      ( MAKE-4PILE ?auto_26293 ?auto_26294 ?auto_26295 ?auto_26296 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26298 - BLOCK
      ?auto_26299 - BLOCK
      ?auto_26300 - BLOCK
      ?auto_26301 - BLOCK
    )
    :vars
    (
      ?auto_26302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26298 ) ( ON ?auto_26299 ?auto_26298 ) ( not ( = ?auto_26298 ?auto_26299 ) ) ( not ( = ?auto_26298 ?auto_26300 ) ) ( not ( = ?auto_26298 ?auto_26301 ) ) ( not ( = ?auto_26299 ?auto_26300 ) ) ( not ( = ?auto_26299 ?auto_26301 ) ) ( not ( = ?auto_26300 ?auto_26301 ) ) ( ON ?auto_26301 ?auto_26302 ) ( not ( = ?auto_26298 ?auto_26302 ) ) ( not ( = ?auto_26299 ?auto_26302 ) ) ( not ( = ?auto_26300 ?auto_26302 ) ) ( not ( = ?auto_26301 ?auto_26302 ) ) ( CLEAR ?auto_26299 ) ( ON ?auto_26300 ?auto_26301 ) ( CLEAR ?auto_26300 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26302 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26302 ?auto_26301 )
      ( MAKE-4PILE ?auto_26298 ?auto_26299 ?auto_26300 ?auto_26301 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26303 - BLOCK
      ?auto_26304 - BLOCK
      ?auto_26305 - BLOCK
      ?auto_26306 - BLOCK
    )
    :vars
    (
      ?auto_26307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26303 ) ( not ( = ?auto_26303 ?auto_26304 ) ) ( not ( = ?auto_26303 ?auto_26305 ) ) ( not ( = ?auto_26303 ?auto_26306 ) ) ( not ( = ?auto_26304 ?auto_26305 ) ) ( not ( = ?auto_26304 ?auto_26306 ) ) ( not ( = ?auto_26305 ?auto_26306 ) ) ( ON ?auto_26306 ?auto_26307 ) ( not ( = ?auto_26303 ?auto_26307 ) ) ( not ( = ?auto_26304 ?auto_26307 ) ) ( not ( = ?auto_26305 ?auto_26307 ) ) ( not ( = ?auto_26306 ?auto_26307 ) ) ( ON ?auto_26305 ?auto_26306 ) ( CLEAR ?auto_26305 ) ( ON-TABLE ?auto_26307 ) ( HOLDING ?auto_26304 ) ( CLEAR ?auto_26303 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26303 ?auto_26304 )
      ( MAKE-4PILE ?auto_26303 ?auto_26304 ?auto_26305 ?auto_26306 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26308 - BLOCK
      ?auto_26309 - BLOCK
      ?auto_26310 - BLOCK
      ?auto_26311 - BLOCK
    )
    :vars
    (
      ?auto_26312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26308 ) ( not ( = ?auto_26308 ?auto_26309 ) ) ( not ( = ?auto_26308 ?auto_26310 ) ) ( not ( = ?auto_26308 ?auto_26311 ) ) ( not ( = ?auto_26309 ?auto_26310 ) ) ( not ( = ?auto_26309 ?auto_26311 ) ) ( not ( = ?auto_26310 ?auto_26311 ) ) ( ON ?auto_26311 ?auto_26312 ) ( not ( = ?auto_26308 ?auto_26312 ) ) ( not ( = ?auto_26309 ?auto_26312 ) ) ( not ( = ?auto_26310 ?auto_26312 ) ) ( not ( = ?auto_26311 ?auto_26312 ) ) ( ON ?auto_26310 ?auto_26311 ) ( ON-TABLE ?auto_26312 ) ( CLEAR ?auto_26308 ) ( ON ?auto_26309 ?auto_26310 ) ( CLEAR ?auto_26309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26312 ?auto_26311 ?auto_26310 )
      ( MAKE-4PILE ?auto_26308 ?auto_26309 ?auto_26310 ?auto_26311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26313 - BLOCK
      ?auto_26314 - BLOCK
      ?auto_26315 - BLOCK
      ?auto_26316 - BLOCK
    )
    :vars
    (
      ?auto_26317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26313 ?auto_26314 ) ) ( not ( = ?auto_26313 ?auto_26315 ) ) ( not ( = ?auto_26313 ?auto_26316 ) ) ( not ( = ?auto_26314 ?auto_26315 ) ) ( not ( = ?auto_26314 ?auto_26316 ) ) ( not ( = ?auto_26315 ?auto_26316 ) ) ( ON ?auto_26316 ?auto_26317 ) ( not ( = ?auto_26313 ?auto_26317 ) ) ( not ( = ?auto_26314 ?auto_26317 ) ) ( not ( = ?auto_26315 ?auto_26317 ) ) ( not ( = ?auto_26316 ?auto_26317 ) ) ( ON ?auto_26315 ?auto_26316 ) ( ON-TABLE ?auto_26317 ) ( ON ?auto_26314 ?auto_26315 ) ( CLEAR ?auto_26314 ) ( HOLDING ?auto_26313 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26313 )
      ( MAKE-4PILE ?auto_26313 ?auto_26314 ?auto_26315 ?auto_26316 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26318 - BLOCK
      ?auto_26319 - BLOCK
      ?auto_26320 - BLOCK
      ?auto_26321 - BLOCK
    )
    :vars
    (
      ?auto_26322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26318 ?auto_26319 ) ) ( not ( = ?auto_26318 ?auto_26320 ) ) ( not ( = ?auto_26318 ?auto_26321 ) ) ( not ( = ?auto_26319 ?auto_26320 ) ) ( not ( = ?auto_26319 ?auto_26321 ) ) ( not ( = ?auto_26320 ?auto_26321 ) ) ( ON ?auto_26321 ?auto_26322 ) ( not ( = ?auto_26318 ?auto_26322 ) ) ( not ( = ?auto_26319 ?auto_26322 ) ) ( not ( = ?auto_26320 ?auto_26322 ) ) ( not ( = ?auto_26321 ?auto_26322 ) ) ( ON ?auto_26320 ?auto_26321 ) ( ON-TABLE ?auto_26322 ) ( ON ?auto_26319 ?auto_26320 ) ( ON ?auto_26318 ?auto_26319 ) ( CLEAR ?auto_26318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26322 ?auto_26321 ?auto_26320 ?auto_26319 )
      ( MAKE-4PILE ?auto_26318 ?auto_26319 ?auto_26320 ?auto_26321 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26323 - BLOCK
      ?auto_26324 - BLOCK
      ?auto_26325 - BLOCK
      ?auto_26326 - BLOCK
    )
    :vars
    (
      ?auto_26327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26323 ?auto_26324 ) ) ( not ( = ?auto_26323 ?auto_26325 ) ) ( not ( = ?auto_26323 ?auto_26326 ) ) ( not ( = ?auto_26324 ?auto_26325 ) ) ( not ( = ?auto_26324 ?auto_26326 ) ) ( not ( = ?auto_26325 ?auto_26326 ) ) ( ON ?auto_26326 ?auto_26327 ) ( not ( = ?auto_26323 ?auto_26327 ) ) ( not ( = ?auto_26324 ?auto_26327 ) ) ( not ( = ?auto_26325 ?auto_26327 ) ) ( not ( = ?auto_26326 ?auto_26327 ) ) ( ON ?auto_26325 ?auto_26326 ) ( ON-TABLE ?auto_26327 ) ( ON ?auto_26324 ?auto_26325 ) ( HOLDING ?auto_26323 ) ( CLEAR ?auto_26324 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26327 ?auto_26326 ?auto_26325 ?auto_26324 ?auto_26323 )
      ( MAKE-4PILE ?auto_26323 ?auto_26324 ?auto_26325 ?auto_26326 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26328 - BLOCK
      ?auto_26329 - BLOCK
      ?auto_26330 - BLOCK
      ?auto_26331 - BLOCK
    )
    :vars
    (
      ?auto_26332 - BLOCK
      ?auto_26333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26328 ?auto_26329 ) ) ( not ( = ?auto_26328 ?auto_26330 ) ) ( not ( = ?auto_26328 ?auto_26331 ) ) ( not ( = ?auto_26329 ?auto_26330 ) ) ( not ( = ?auto_26329 ?auto_26331 ) ) ( not ( = ?auto_26330 ?auto_26331 ) ) ( ON ?auto_26331 ?auto_26332 ) ( not ( = ?auto_26328 ?auto_26332 ) ) ( not ( = ?auto_26329 ?auto_26332 ) ) ( not ( = ?auto_26330 ?auto_26332 ) ) ( not ( = ?auto_26331 ?auto_26332 ) ) ( ON ?auto_26330 ?auto_26331 ) ( ON-TABLE ?auto_26332 ) ( ON ?auto_26329 ?auto_26330 ) ( CLEAR ?auto_26329 ) ( ON ?auto_26328 ?auto_26333 ) ( CLEAR ?auto_26328 ) ( HAND-EMPTY ) ( not ( = ?auto_26328 ?auto_26333 ) ) ( not ( = ?auto_26329 ?auto_26333 ) ) ( not ( = ?auto_26330 ?auto_26333 ) ) ( not ( = ?auto_26331 ?auto_26333 ) ) ( not ( = ?auto_26332 ?auto_26333 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26328 ?auto_26333 )
      ( MAKE-4PILE ?auto_26328 ?auto_26329 ?auto_26330 ?auto_26331 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26334 - BLOCK
      ?auto_26335 - BLOCK
      ?auto_26336 - BLOCK
      ?auto_26337 - BLOCK
    )
    :vars
    (
      ?auto_26339 - BLOCK
      ?auto_26338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26334 ?auto_26335 ) ) ( not ( = ?auto_26334 ?auto_26336 ) ) ( not ( = ?auto_26334 ?auto_26337 ) ) ( not ( = ?auto_26335 ?auto_26336 ) ) ( not ( = ?auto_26335 ?auto_26337 ) ) ( not ( = ?auto_26336 ?auto_26337 ) ) ( ON ?auto_26337 ?auto_26339 ) ( not ( = ?auto_26334 ?auto_26339 ) ) ( not ( = ?auto_26335 ?auto_26339 ) ) ( not ( = ?auto_26336 ?auto_26339 ) ) ( not ( = ?auto_26337 ?auto_26339 ) ) ( ON ?auto_26336 ?auto_26337 ) ( ON-TABLE ?auto_26339 ) ( ON ?auto_26334 ?auto_26338 ) ( CLEAR ?auto_26334 ) ( not ( = ?auto_26334 ?auto_26338 ) ) ( not ( = ?auto_26335 ?auto_26338 ) ) ( not ( = ?auto_26336 ?auto_26338 ) ) ( not ( = ?auto_26337 ?auto_26338 ) ) ( not ( = ?auto_26339 ?auto_26338 ) ) ( HOLDING ?auto_26335 ) ( CLEAR ?auto_26336 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26339 ?auto_26337 ?auto_26336 ?auto_26335 )
      ( MAKE-4PILE ?auto_26334 ?auto_26335 ?auto_26336 ?auto_26337 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26340 - BLOCK
      ?auto_26341 - BLOCK
      ?auto_26342 - BLOCK
      ?auto_26343 - BLOCK
    )
    :vars
    (
      ?auto_26345 - BLOCK
      ?auto_26344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26340 ?auto_26341 ) ) ( not ( = ?auto_26340 ?auto_26342 ) ) ( not ( = ?auto_26340 ?auto_26343 ) ) ( not ( = ?auto_26341 ?auto_26342 ) ) ( not ( = ?auto_26341 ?auto_26343 ) ) ( not ( = ?auto_26342 ?auto_26343 ) ) ( ON ?auto_26343 ?auto_26345 ) ( not ( = ?auto_26340 ?auto_26345 ) ) ( not ( = ?auto_26341 ?auto_26345 ) ) ( not ( = ?auto_26342 ?auto_26345 ) ) ( not ( = ?auto_26343 ?auto_26345 ) ) ( ON ?auto_26342 ?auto_26343 ) ( ON-TABLE ?auto_26345 ) ( ON ?auto_26340 ?auto_26344 ) ( not ( = ?auto_26340 ?auto_26344 ) ) ( not ( = ?auto_26341 ?auto_26344 ) ) ( not ( = ?auto_26342 ?auto_26344 ) ) ( not ( = ?auto_26343 ?auto_26344 ) ) ( not ( = ?auto_26345 ?auto_26344 ) ) ( CLEAR ?auto_26342 ) ( ON ?auto_26341 ?auto_26340 ) ( CLEAR ?auto_26341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26344 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26344 ?auto_26340 )
      ( MAKE-4PILE ?auto_26340 ?auto_26341 ?auto_26342 ?auto_26343 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26346 - BLOCK
      ?auto_26347 - BLOCK
      ?auto_26348 - BLOCK
      ?auto_26349 - BLOCK
    )
    :vars
    (
      ?auto_26351 - BLOCK
      ?auto_26350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26346 ?auto_26347 ) ) ( not ( = ?auto_26346 ?auto_26348 ) ) ( not ( = ?auto_26346 ?auto_26349 ) ) ( not ( = ?auto_26347 ?auto_26348 ) ) ( not ( = ?auto_26347 ?auto_26349 ) ) ( not ( = ?auto_26348 ?auto_26349 ) ) ( ON ?auto_26349 ?auto_26351 ) ( not ( = ?auto_26346 ?auto_26351 ) ) ( not ( = ?auto_26347 ?auto_26351 ) ) ( not ( = ?auto_26348 ?auto_26351 ) ) ( not ( = ?auto_26349 ?auto_26351 ) ) ( ON-TABLE ?auto_26351 ) ( ON ?auto_26346 ?auto_26350 ) ( not ( = ?auto_26346 ?auto_26350 ) ) ( not ( = ?auto_26347 ?auto_26350 ) ) ( not ( = ?auto_26348 ?auto_26350 ) ) ( not ( = ?auto_26349 ?auto_26350 ) ) ( not ( = ?auto_26351 ?auto_26350 ) ) ( ON ?auto_26347 ?auto_26346 ) ( CLEAR ?auto_26347 ) ( ON-TABLE ?auto_26350 ) ( HOLDING ?auto_26348 ) ( CLEAR ?auto_26349 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26351 ?auto_26349 ?auto_26348 )
      ( MAKE-4PILE ?auto_26346 ?auto_26347 ?auto_26348 ?auto_26349 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26352 - BLOCK
      ?auto_26353 - BLOCK
      ?auto_26354 - BLOCK
      ?auto_26355 - BLOCK
    )
    :vars
    (
      ?auto_26356 - BLOCK
      ?auto_26357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26352 ?auto_26353 ) ) ( not ( = ?auto_26352 ?auto_26354 ) ) ( not ( = ?auto_26352 ?auto_26355 ) ) ( not ( = ?auto_26353 ?auto_26354 ) ) ( not ( = ?auto_26353 ?auto_26355 ) ) ( not ( = ?auto_26354 ?auto_26355 ) ) ( ON ?auto_26355 ?auto_26356 ) ( not ( = ?auto_26352 ?auto_26356 ) ) ( not ( = ?auto_26353 ?auto_26356 ) ) ( not ( = ?auto_26354 ?auto_26356 ) ) ( not ( = ?auto_26355 ?auto_26356 ) ) ( ON-TABLE ?auto_26356 ) ( ON ?auto_26352 ?auto_26357 ) ( not ( = ?auto_26352 ?auto_26357 ) ) ( not ( = ?auto_26353 ?auto_26357 ) ) ( not ( = ?auto_26354 ?auto_26357 ) ) ( not ( = ?auto_26355 ?auto_26357 ) ) ( not ( = ?auto_26356 ?auto_26357 ) ) ( ON ?auto_26353 ?auto_26352 ) ( ON-TABLE ?auto_26357 ) ( CLEAR ?auto_26355 ) ( ON ?auto_26354 ?auto_26353 ) ( CLEAR ?auto_26354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26357 ?auto_26352 ?auto_26353 )
      ( MAKE-4PILE ?auto_26352 ?auto_26353 ?auto_26354 ?auto_26355 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26358 - BLOCK
      ?auto_26359 - BLOCK
      ?auto_26360 - BLOCK
      ?auto_26361 - BLOCK
    )
    :vars
    (
      ?auto_26363 - BLOCK
      ?auto_26362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26358 ?auto_26359 ) ) ( not ( = ?auto_26358 ?auto_26360 ) ) ( not ( = ?auto_26358 ?auto_26361 ) ) ( not ( = ?auto_26359 ?auto_26360 ) ) ( not ( = ?auto_26359 ?auto_26361 ) ) ( not ( = ?auto_26360 ?auto_26361 ) ) ( not ( = ?auto_26358 ?auto_26363 ) ) ( not ( = ?auto_26359 ?auto_26363 ) ) ( not ( = ?auto_26360 ?auto_26363 ) ) ( not ( = ?auto_26361 ?auto_26363 ) ) ( ON-TABLE ?auto_26363 ) ( ON ?auto_26358 ?auto_26362 ) ( not ( = ?auto_26358 ?auto_26362 ) ) ( not ( = ?auto_26359 ?auto_26362 ) ) ( not ( = ?auto_26360 ?auto_26362 ) ) ( not ( = ?auto_26361 ?auto_26362 ) ) ( not ( = ?auto_26363 ?auto_26362 ) ) ( ON ?auto_26359 ?auto_26358 ) ( ON-TABLE ?auto_26362 ) ( ON ?auto_26360 ?auto_26359 ) ( CLEAR ?auto_26360 ) ( HOLDING ?auto_26361 ) ( CLEAR ?auto_26363 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26363 ?auto_26361 )
      ( MAKE-4PILE ?auto_26358 ?auto_26359 ?auto_26360 ?auto_26361 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26364 - BLOCK
      ?auto_26365 - BLOCK
      ?auto_26366 - BLOCK
      ?auto_26367 - BLOCK
    )
    :vars
    (
      ?auto_26369 - BLOCK
      ?auto_26368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26364 ?auto_26365 ) ) ( not ( = ?auto_26364 ?auto_26366 ) ) ( not ( = ?auto_26364 ?auto_26367 ) ) ( not ( = ?auto_26365 ?auto_26366 ) ) ( not ( = ?auto_26365 ?auto_26367 ) ) ( not ( = ?auto_26366 ?auto_26367 ) ) ( not ( = ?auto_26364 ?auto_26369 ) ) ( not ( = ?auto_26365 ?auto_26369 ) ) ( not ( = ?auto_26366 ?auto_26369 ) ) ( not ( = ?auto_26367 ?auto_26369 ) ) ( ON-TABLE ?auto_26369 ) ( ON ?auto_26364 ?auto_26368 ) ( not ( = ?auto_26364 ?auto_26368 ) ) ( not ( = ?auto_26365 ?auto_26368 ) ) ( not ( = ?auto_26366 ?auto_26368 ) ) ( not ( = ?auto_26367 ?auto_26368 ) ) ( not ( = ?auto_26369 ?auto_26368 ) ) ( ON ?auto_26365 ?auto_26364 ) ( ON-TABLE ?auto_26368 ) ( ON ?auto_26366 ?auto_26365 ) ( CLEAR ?auto_26369 ) ( ON ?auto_26367 ?auto_26366 ) ( CLEAR ?auto_26367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26368 ?auto_26364 ?auto_26365 ?auto_26366 )
      ( MAKE-4PILE ?auto_26364 ?auto_26365 ?auto_26366 ?auto_26367 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26370 - BLOCK
      ?auto_26371 - BLOCK
      ?auto_26372 - BLOCK
      ?auto_26373 - BLOCK
    )
    :vars
    (
      ?auto_26375 - BLOCK
      ?auto_26374 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26370 ?auto_26371 ) ) ( not ( = ?auto_26370 ?auto_26372 ) ) ( not ( = ?auto_26370 ?auto_26373 ) ) ( not ( = ?auto_26371 ?auto_26372 ) ) ( not ( = ?auto_26371 ?auto_26373 ) ) ( not ( = ?auto_26372 ?auto_26373 ) ) ( not ( = ?auto_26370 ?auto_26375 ) ) ( not ( = ?auto_26371 ?auto_26375 ) ) ( not ( = ?auto_26372 ?auto_26375 ) ) ( not ( = ?auto_26373 ?auto_26375 ) ) ( ON ?auto_26370 ?auto_26374 ) ( not ( = ?auto_26370 ?auto_26374 ) ) ( not ( = ?auto_26371 ?auto_26374 ) ) ( not ( = ?auto_26372 ?auto_26374 ) ) ( not ( = ?auto_26373 ?auto_26374 ) ) ( not ( = ?auto_26375 ?auto_26374 ) ) ( ON ?auto_26371 ?auto_26370 ) ( ON-TABLE ?auto_26374 ) ( ON ?auto_26372 ?auto_26371 ) ( ON ?auto_26373 ?auto_26372 ) ( CLEAR ?auto_26373 ) ( HOLDING ?auto_26375 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26375 )
      ( MAKE-4PILE ?auto_26370 ?auto_26371 ?auto_26372 ?auto_26373 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26376 - BLOCK
      ?auto_26377 - BLOCK
      ?auto_26378 - BLOCK
      ?auto_26379 - BLOCK
    )
    :vars
    (
      ?auto_26381 - BLOCK
      ?auto_26380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26376 ?auto_26377 ) ) ( not ( = ?auto_26376 ?auto_26378 ) ) ( not ( = ?auto_26376 ?auto_26379 ) ) ( not ( = ?auto_26377 ?auto_26378 ) ) ( not ( = ?auto_26377 ?auto_26379 ) ) ( not ( = ?auto_26378 ?auto_26379 ) ) ( not ( = ?auto_26376 ?auto_26381 ) ) ( not ( = ?auto_26377 ?auto_26381 ) ) ( not ( = ?auto_26378 ?auto_26381 ) ) ( not ( = ?auto_26379 ?auto_26381 ) ) ( ON ?auto_26376 ?auto_26380 ) ( not ( = ?auto_26376 ?auto_26380 ) ) ( not ( = ?auto_26377 ?auto_26380 ) ) ( not ( = ?auto_26378 ?auto_26380 ) ) ( not ( = ?auto_26379 ?auto_26380 ) ) ( not ( = ?auto_26381 ?auto_26380 ) ) ( ON ?auto_26377 ?auto_26376 ) ( ON-TABLE ?auto_26380 ) ( ON ?auto_26378 ?auto_26377 ) ( ON ?auto_26379 ?auto_26378 ) ( ON ?auto_26381 ?auto_26379 ) ( CLEAR ?auto_26381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26380 ?auto_26376 ?auto_26377 ?auto_26378 ?auto_26379 )
      ( MAKE-4PILE ?auto_26376 ?auto_26377 ?auto_26378 ?auto_26379 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26387 - BLOCK
      ?auto_26388 - BLOCK
      ?auto_26389 - BLOCK
      ?auto_26390 - BLOCK
      ?auto_26391 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_26391 ) ( CLEAR ?auto_26390 ) ( ON-TABLE ?auto_26387 ) ( ON ?auto_26388 ?auto_26387 ) ( ON ?auto_26389 ?auto_26388 ) ( ON ?auto_26390 ?auto_26389 ) ( not ( = ?auto_26387 ?auto_26388 ) ) ( not ( = ?auto_26387 ?auto_26389 ) ) ( not ( = ?auto_26387 ?auto_26390 ) ) ( not ( = ?auto_26387 ?auto_26391 ) ) ( not ( = ?auto_26388 ?auto_26389 ) ) ( not ( = ?auto_26388 ?auto_26390 ) ) ( not ( = ?auto_26388 ?auto_26391 ) ) ( not ( = ?auto_26389 ?auto_26390 ) ) ( not ( = ?auto_26389 ?auto_26391 ) ) ( not ( = ?auto_26390 ?auto_26391 ) ) )
    :subtasks
    ( ( !STACK ?auto_26391 ?auto_26390 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26392 - BLOCK
      ?auto_26393 - BLOCK
      ?auto_26394 - BLOCK
      ?auto_26395 - BLOCK
      ?auto_26396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26395 ) ( ON-TABLE ?auto_26392 ) ( ON ?auto_26393 ?auto_26392 ) ( ON ?auto_26394 ?auto_26393 ) ( ON ?auto_26395 ?auto_26394 ) ( not ( = ?auto_26392 ?auto_26393 ) ) ( not ( = ?auto_26392 ?auto_26394 ) ) ( not ( = ?auto_26392 ?auto_26395 ) ) ( not ( = ?auto_26392 ?auto_26396 ) ) ( not ( = ?auto_26393 ?auto_26394 ) ) ( not ( = ?auto_26393 ?auto_26395 ) ) ( not ( = ?auto_26393 ?auto_26396 ) ) ( not ( = ?auto_26394 ?auto_26395 ) ) ( not ( = ?auto_26394 ?auto_26396 ) ) ( not ( = ?auto_26395 ?auto_26396 ) ) ( ON-TABLE ?auto_26396 ) ( CLEAR ?auto_26396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_26396 )
      ( MAKE-5PILE ?auto_26392 ?auto_26393 ?auto_26394 ?auto_26395 ?auto_26396 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26397 - BLOCK
      ?auto_26398 - BLOCK
      ?auto_26399 - BLOCK
      ?auto_26400 - BLOCK
      ?auto_26401 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26397 ) ( ON ?auto_26398 ?auto_26397 ) ( ON ?auto_26399 ?auto_26398 ) ( not ( = ?auto_26397 ?auto_26398 ) ) ( not ( = ?auto_26397 ?auto_26399 ) ) ( not ( = ?auto_26397 ?auto_26400 ) ) ( not ( = ?auto_26397 ?auto_26401 ) ) ( not ( = ?auto_26398 ?auto_26399 ) ) ( not ( = ?auto_26398 ?auto_26400 ) ) ( not ( = ?auto_26398 ?auto_26401 ) ) ( not ( = ?auto_26399 ?auto_26400 ) ) ( not ( = ?auto_26399 ?auto_26401 ) ) ( not ( = ?auto_26400 ?auto_26401 ) ) ( ON-TABLE ?auto_26401 ) ( CLEAR ?auto_26401 ) ( HOLDING ?auto_26400 ) ( CLEAR ?auto_26399 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26397 ?auto_26398 ?auto_26399 ?auto_26400 )
      ( MAKE-5PILE ?auto_26397 ?auto_26398 ?auto_26399 ?auto_26400 ?auto_26401 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26402 - BLOCK
      ?auto_26403 - BLOCK
      ?auto_26404 - BLOCK
      ?auto_26405 - BLOCK
      ?auto_26406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26402 ) ( ON ?auto_26403 ?auto_26402 ) ( ON ?auto_26404 ?auto_26403 ) ( not ( = ?auto_26402 ?auto_26403 ) ) ( not ( = ?auto_26402 ?auto_26404 ) ) ( not ( = ?auto_26402 ?auto_26405 ) ) ( not ( = ?auto_26402 ?auto_26406 ) ) ( not ( = ?auto_26403 ?auto_26404 ) ) ( not ( = ?auto_26403 ?auto_26405 ) ) ( not ( = ?auto_26403 ?auto_26406 ) ) ( not ( = ?auto_26404 ?auto_26405 ) ) ( not ( = ?auto_26404 ?auto_26406 ) ) ( not ( = ?auto_26405 ?auto_26406 ) ) ( ON-TABLE ?auto_26406 ) ( CLEAR ?auto_26404 ) ( ON ?auto_26405 ?auto_26406 ) ( CLEAR ?auto_26405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26406 )
      ( MAKE-5PILE ?auto_26402 ?auto_26403 ?auto_26404 ?auto_26405 ?auto_26406 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26407 - BLOCK
      ?auto_26408 - BLOCK
      ?auto_26409 - BLOCK
      ?auto_26410 - BLOCK
      ?auto_26411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26407 ) ( ON ?auto_26408 ?auto_26407 ) ( not ( = ?auto_26407 ?auto_26408 ) ) ( not ( = ?auto_26407 ?auto_26409 ) ) ( not ( = ?auto_26407 ?auto_26410 ) ) ( not ( = ?auto_26407 ?auto_26411 ) ) ( not ( = ?auto_26408 ?auto_26409 ) ) ( not ( = ?auto_26408 ?auto_26410 ) ) ( not ( = ?auto_26408 ?auto_26411 ) ) ( not ( = ?auto_26409 ?auto_26410 ) ) ( not ( = ?auto_26409 ?auto_26411 ) ) ( not ( = ?auto_26410 ?auto_26411 ) ) ( ON-TABLE ?auto_26411 ) ( ON ?auto_26410 ?auto_26411 ) ( CLEAR ?auto_26410 ) ( HOLDING ?auto_26409 ) ( CLEAR ?auto_26408 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26407 ?auto_26408 ?auto_26409 )
      ( MAKE-5PILE ?auto_26407 ?auto_26408 ?auto_26409 ?auto_26410 ?auto_26411 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26412 - BLOCK
      ?auto_26413 - BLOCK
      ?auto_26414 - BLOCK
      ?auto_26415 - BLOCK
      ?auto_26416 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26412 ) ( ON ?auto_26413 ?auto_26412 ) ( not ( = ?auto_26412 ?auto_26413 ) ) ( not ( = ?auto_26412 ?auto_26414 ) ) ( not ( = ?auto_26412 ?auto_26415 ) ) ( not ( = ?auto_26412 ?auto_26416 ) ) ( not ( = ?auto_26413 ?auto_26414 ) ) ( not ( = ?auto_26413 ?auto_26415 ) ) ( not ( = ?auto_26413 ?auto_26416 ) ) ( not ( = ?auto_26414 ?auto_26415 ) ) ( not ( = ?auto_26414 ?auto_26416 ) ) ( not ( = ?auto_26415 ?auto_26416 ) ) ( ON-TABLE ?auto_26416 ) ( ON ?auto_26415 ?auto_26416 ) ( CLEAR ?auto_26413 ) ( ON ?auto_26414 ?auto_26415 ) ( CLEAR ?auto_26414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26416 ?auto_26415 )
      ( MAKE-5PILE ?auto_26412 ?auto_26413 ?auto_26414 ?auto_26415 ?auto_26416 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26417 - BLOCK
      ?auto_26418 - BLOCK
      ?auto_26419 - BLOCK
      ?auto_26420 - BLOCK
      ?auto_26421 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26417 ) ( not ( = ?auto_26417 ?auto_26418 ) ) ( not ( = ?auto_26417 ?auto_26419 ) ) ( not ( = ?auto_26417 ?auto_26420 ) ) ( not ( = ?auto_26417 ?auto_26421 ) ) ( not ( = ?auto_26418 ?auto_26419 ) ) ( not ( = ?auto_26418 ?auto_26420 ) ) ( not ( = ?auto_26418 ?auto_26421 ) ) ( not ( = ?auto_26419 ?auto_26420 ) ) ( not ( = ?auto_26419 ?auto_26421 ) ) ( not ( = ?auto_26420 ?auto_26421 ) ) ( ON-TABLE ?auto_26421 ) ( ON ?auto_26420 ?auto_26421 ) ( ON ?auto_26419 ?auto_26420 ) ( CLEAR ?auto_26419 ) ( HOLDING ?auto_26418 ) ( CLEAR ?auto_26417 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26417 ?auto_26418 )
      ( MAKE-5PILE ?auto_26417 ?auto_26418 ?auto_26419 ?auto_26420 ?auto_26421 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26422 - BLOCK
      ?auto_26423 - BLOCK
      ?auto_26424 - BLOCK
      ?auto_26425 - BLOCK
      ?auto_26426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26422 ) ( not ( = ?auto_26422 ?auto_26423 ) ) ( not ( = ?auto_26422 ?auto_26424 ) ) ( not ( = ?auto_26422 ?auto_26425 ) ) ( not ( = ?auto_26422 ?auto_26426 ) ) ( not ( = ?auto_26423 ?auto_26424 ) ) ( not ( = ?auto_26423 ?auto_26425 ) ) ( not ( = ?auto_26423 ?auto_26426 ) ) ( not ( = ?auto_26424 ?auto_26425 ) ) ( not ( = ?auto_26424 ?auto_26426 ) ) ( not ( = ?auto_26425 ?auto_26426 ) ) ( ON-TABLE ?auto_26426 ) ( ON ?auto_26425 ?auto_26426 ) ( ON ?auto_26424 ?auto_26425 ) ( CLEAR ?auto_26422 ) ( ON ?auto_26423 ?auto_26424 ) ( CLEAR ?auto_26423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26426 ?auto_26425 ?auto_26424 )
      ( MAKE-5PILE ?auto_26422 ?auto_26423 ?auto_26424 ?auto_26425 ?auto_26426 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26427 - BLOCK
      ?auto_26428 - BLOCK
      ?auto_26429 - BLOCK
      ?auto_26430 - BLOCK
      ?auto_26431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26427 ?auto_26428 ) ) ( not ( = ?auto_26427 ?auto_26429 ) ) ( not ( = ?auto_26427 ?auto_26430 ) ) ( not ( = ?auto_26427 ?auto_26431 ) ) ( not ( = ?auto_26428 ?auto_26429 ) ) ( not ( = ?auto_26428 ?auto_26430 ) ) ( not ( = ?auto_26428 ?auto_26431 ) ) ( not ( = ?auto_26429 ?auto_26430 ) ) ( not ( = ?auto_26429 ?auto_26431 ) ) ( not ( = ?auto_26430 ?auto_26431 ) ) ( ON-TABLE ?auto_26431 ) ( ON ?auto_26430 ?auto_26431 ) ( ON ?auto_26429 ?auto_26430 ) ( ON ?auto_26428 ?auto_26429 ) ( CLEAR ?auto_26428 ) ( HOLDING ?auto_26427 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26427 )
      ( MAKE-5PILE ?auto_26427 ?auto_26428 ?auto_26429 ?auto_26430 ?auto_26431 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26432 - BLOCK
      ?auto_26433 - BLOCK
      ?auto_26434 - BLOCK
      ?auto_26435 - BLOCK
      ?auto_26436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26432 ?auto_26433 ) ) ( not ( = ?auto_26432 ?auto_26434 ) ) ( not ( = ?auto_26432 ?auto_26435 ) ) ( not ( = ?auto_26432 ?auto_26436 ) ) ( not ( = ?auto_26433 ?auto_26434 ) ) ( not ( = ?auto_26433 ?auto_26435 ) ) ( not ( = ?auto_26433 ?auto_26436 ) ) ( not ( = ?auto_26434 ?auto_26435 ) ) ( not ( = ?auto_26434 ?auto_26436 ) ) ( not ( = ?auto_26435 ?auto_26436 ) ) ( ON-TABLE ?auto_26436 ) ( ON ?auto_26435 ?auto_26436 ) ( ON ?auto_26434 ?auto_26435 ) ( ON ?auto_26433 ?auto_26434 ) ( ON ?auto_26432 ?auto_26433 ) ( CLEAR ?auto_26432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26436 ?auto_26435 ?auto_26434 ?auto_26433 )
      ( MAKE-5PILE ?auto_26432 ?auto_26433 ?auto_26434 ?auto_26435 ?auto_26436 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26437 - BLOCK
      ?auto_26438 - BLOCK
      ?auto_26439 - BLOCK
      ?auto_26440 - BLOCK
      ?auto_26441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26437 ?auto_26438 ) ) ( not ( = ?auto_26437 ?auto_26439 ) ) ( not ( = ?auto_26437 ?auto_26440 ) ) ( not ( = ?auto_26437 ?auto_26441 ) ) ( not ( = ?auto_26438 ?auto_26439 ) ) ( not ( = ?auto_26438 ?auto_26440 ) ) ( not ( = ?auto_26438 ?auto_26441 ) ) ( not ( = ?auto_26439 ?auto_26440 ) ) ( not ( = ?auto_26439 ?auto_26441 ) ) ( not ( = ?auto_26440 ?auto_26441 ) ) ( ON-TABLE ?auto_26441 ) ( ON ?auto_26440 ?auto_26441 ) ( ON ?auto_26439 ?auto_26440 ) ( ON ?auto_26438 ?auto_26439 ) ( HOLDING ?auto_26437 ) ( CLEAR ?auto_26438 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26441 ?auto_26440 ?auto_26439 ?auto_26438 ?auto_26437 )
      ( MAKE-5PILE ?auto_26437 ?auto_26438 ?auto_26439 ?auto_26440 ?auto_26441 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26442 - BLOCK
      ?auto_26443 - BLOCK
      ?auto_26444 - BLOCK
      ?auto_26445 - BLOCK
      ?auto_26446 - BLOCK
    )
    :vars
    (
      ?auto_26447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26442 ?auto_26443 ) ) ( not ( = ?auto_26442 ?auto_26444 ) ) ( not ( = ?auto_26442 ?auto_26445 ) ) ( not ( = ?auto_26442 ?auto_26446 ) ) ( not ( = ?auto_26443 ?auto_26444 ) ) ( not ( = ?auto_26443 ?auto_26445 ) ) ( not ( = ?auto_26443 ?auto_26446 ) ) ( not ( = ?auto_26444 ?auto_26445 ) ) ( not ( = ?auto_26444 ?auto_26446 ) ) ( not ( = ?auto_26445 ?auto_26446 ) ) ( ON-TABLE ?auto_26446 ) ( ON ?auto_26445 ?auto_26446 ) ( ON ?auto_26444 ?auto_26445 ) ( ON ?auto_26443 ?auto_26444 ) ( CLEAR ?auto_26443 ) ( ON ?auto_26442 ?auto_26447 ) ( CLEAR ?auto_26442 ) ( HAND-EMPTY ) ( not ( = ?auto_26442 ?auto_26447 ) ) ( not ( = ?auto_26443 ?auto_26447 ) ) ( not ( = ?auto_26444 ?auto_26447 ) ) ( not ( = ?auto_26445 ?auto_26447 ) ) ( not ( = ?auto_26446 ?auto_26447 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26442 ?auto_26447 )
      ( MAKE-5PILE ?auto_26442 ?auto_26443 ?auto_26444 ?auto_26445 ?auto_26446 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26448 - BLOCK
      ?auto_26449 - BLOCK
      ?auto_26450 - BLOCK
      ?auto_26451 - BLOCK
      ?auto_26452 - BLOCK
    )
    :vars
    (
      ?auto_26453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26448 ?auto_26449 ) ) ( not ( = ?auto_26448 ?auto_26450 ) ) ( not ( = ?auto_26448 ?auto_26451 ) ) ( not ( = ?auto_26448 ?auto_26452 ) ) ( not ( = ?auto_26449 ?auto_26450 ) ) ( not ( = ?auto_26449 ?auto_26451 ) ) ( not ( = ?auto_26449 ?auto_26452 ) ) ( not ( = ?auto_26450 ?auto_26451 ) ) ( not ( = ?auto_26450 ?auto_26452 ) ) ( not ( = ?auto_26451 ?auto_26452 ) ) ( ON-TABLE ?auto_26452 ) ( ON ?auto_26451 ?auto_26452 ) ( ON ?auto_26450 ?auto_26451 ) ( ON ?auto_26448 ?auto_26453 ) ( CLEAR ?auto_26448 ) ( not ( = ?auto_26448 ?auto_26453 ) ) ( not ( = ?auto_26449 ?auto_26453 ) ) ( not ( = ?auto_26450 ?auto_26453 ) ) ( not ( = ?auto_26451 ?auto_26453 ) ) ( not ( = ?auto_26452 ?auto_26453 ) ) ( HOLDING ?auto_26449 ) ( CLEAR ?auto_26450 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26452 ?auto_26451 ?auto_26450 ?auto_26449 )
      ( MAKE-5PILE ?auto_26448 ?auto_26449 ?auto_26450 ?auto_26451 ?auto_26452 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26454 - BLOCK
      ?auto_26455 - BLOCK
      ?auto_26456 - BLOCK
      ?auto_26457 - BLOCK
      ?auto_26458 - BLOCK
    )
    :vars
    (
      ?auto_26459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26454 ?auto_26455 ) ) ( not ( = ?auto_26454 ?auto_26456 ) ) ( not ( = ?auto_26454 ?auto_26457 ) ) ( not ( = ?auto_26454 ?auto_26458 ) ) ( not ( = ?auto_26455 ?auto_26456 ) ) ( not ( = ?auto_26455 ?auto_26457 ) ) ( not ( = ?auto_26455 ?auto_26458 ) ) ( not ( = ?auto_26456 ?auto_26457 ) ) ( not ( = ?auto_26456 ?auto_26458 ) ) ( not ( = ?auto_26457 ?auto_26458 ) ) ( ON-TABLE ?auto_26458 ) ( ON ?auto_26457 ?auto_26458 ) ( ON ?auto_26456 ?auto_26457 ) ( ON ?auto_26454 ?auto_26459 ) ( not ( = ?auto_26454 ?auto_26459 ) ) ( not ( = ?auto_26455 ?auto_26459 ) ) ( not ( = ?auto_26456 ?auto_26459 ) ) ( not ( = ?auto_26457 ?auto_26459 ) ) ( not ( = ?auto_26458 ?auto_26459 ) ) ( CLEAR ?auto_26456 ) ( ON ?auto_26455 ?auto_26454 ) ( CLEAR ?auto_26455 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26459 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26459 ?auto_26454 )
      ( MAKE-5PILE ?auto_26454 ?auto_26455 ?auto_26456 ?auto_26457 ?auto_26458 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26460 - BLOCK
      ?auto_26461 - BLOCK
      ?auto_26462 - BLOCK
      ?auto_26463 - BLOCK
      ?auto_26464 - BLOCK
    )
    :vars
    (
      ?auto_26465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26460 ?auto_26461 ) ) ( not ( = ?auto_26460 ?auto_26462 ) ) ( not ( = ?auto_26460 ?auto_26463 ) ) ( not ( = ?auto_26460 ?auto_26464 ) ) ( not ( = ?auto_26461 ?auto_26462 ) ) ( not ( = ?auto_26461 ?auto_26463 ) ) ( not ( = ?auto_26461 ?auto_26464 ) ) ( not ( = ?auto_26462 ?auto_26463 ) ) ( not ( = ?auto_26462 ?auto_26464 ) ) ( not ( = ?auto_26463 ?auto_26464 ) ) ( ON-TABLE ?auto_26464 ) ( ON ?auto_26463 ?auto_26464 ) ( ON ?auto_26460 ?auto_26465 ) ( not ( = ?auto_26460 ?auto_26465 ) ) ( not ( = ?auto_26461 ?auto_26465 ) ) ( not ( = ?auto_26462 ?auto_26465 ) ) ( not ( = ?auto_26463 ?auto_26465 ) ) ( not ( = ?auto_26464 ?auto_26465 ) ) ( ON ?auto_26461 ?auto_26460 ) ( CLEAR ?auto_26461 ) ( ON-TABLE ?auto_26465 ) ( HOLDING ?auto_26462 ) ( CLEAR ?auto_26463 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26464 ?auto_26463 ?auto_26462 )
      ( MAKE-5PILE ?auto_26460 ?auto_26461 ?auto_26462 ?auto_26463 ?auto_26464 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26466 - BLOCK
      ?auto_26467 - BLOCK
      ?auto_26468 - BLOCK
      ?auto_26469 - BLOCK
      ?auto_26470 - BLOCK
    )
    :vars
    (
      ?auto_26471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26466 ?auto_26467 ) ) ( not ( = ?auto_26466 ?auto_26468 ) ) ( not ( = ?auto_26466 ?auto_26469 ) ) ( not ( = ?auto_26466 ?auto_26470 ) ) ( not ( = ?auto_26467 ?auto_26468 ) ) ( not ( = ?auto_26467 ?auto_26469 ) ) ( not ( = ?auto_26467 ?auto_26470 ) ) ( not ( = ?auto_26468 ?auto_26469 ) ) ( not ( = ?auto_26468 ?auto_26470 ) ) ( not ( = ?auto_26469 ?auto_26470 ) ) ( ON-TABLE ?auto_26470 ) ( ON ?auto_26469 ?auto_26470 ) ( ON ?auto_26466 ?auto_26471 ) ( not ( = ?auto_26466 ?auto_26471 ) ) ( not ( = ?auto_26467 ?auto_26471 ) ) ( not ( = ?auto_26468 ?auto_26471 ) ) ( not ( = ?auto_26469 ?auto_26471 ) ) ( not ( = ?auto_26470 ?auto_26471 ) ) ( ON ?auto_26467 ?auto_26466 ) ( ON-TABLE ?auto_26471 ) ( CLEAR ?auto_26469 ) ( ON ?auto_26468 ?auto_26467 ) ( CLEAR ?auto_26468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26471 ?auto_26466 ?auto_26467 )
      ( MAKE-5PILE ?auto_26466 ?auto_26467 ?auto_26468 ?auto_26469 ?auto_26470 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26472 - BLOCK
      ?auto_26473 - BLOCK
      ?auto_26474 - BLOCK
      ?auto_26475 - BLOCK
      ?auto_26476 - BLOCK
    )
    :vars
    (
      ?auto_26477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26472 ?auto_26473 ) ) ( not ( = ?auto_26472 ?auto_26474 ) ) ( not ( = ?auto_26472 ?auto_26475 ) ) ( not ( = ?auto_26472 ?auto_26476 ) ) ( not ( = ?auto_26473 ?auto_26474 ) ) ( not ( = ?auto_26473 ?auto_26475 ) ) ( not ( = ?auto_26473 ?auto_26476 ) ) ( not ( = ?auto_26474 ?auto_26475 ) ) ( not ( = ?auto_26474 ?auto_26476 ) ) ( not ( = ?auto_26475 ?auto_26476 ) ) ( ON-TABLE ?auto_26476 ) ( ON ?auto_26472 ?auto_26477 ) ( not ( = ?auto_26472 ?auto_26477 ) ) ( not ( = ?auto_26473 ?auto_26477 ) ) ( not ( = ?auto_26474 ?auto_26477 ) ) ( not ( = ?auto_26475 ?auto_26477 ) ) ( not ( = ?auto_26476 ?auto_26477 ) ) ( ON ?auto_26473 ?auto_26472 ) ( ON-TABLE ?auto_26477 ) ( ON ?auto_26474 ?auto_26473 ) ( CLEAR ?auto_26474 ) ( HOLDING ?auto_26475 ) ( CLEAR ?auto_26476 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26476 ?auto_26475 )
      ( MAKE-5PILE ?auto_26472 ?auto_26473 ?auto_26474 ?auto_26475 ?auto_26476 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26478 - BLOCK
      ?auto_26479 - BLOCK
      ?auto_26480 - BLOCK
      ?auto_26481 - BLOCK
      ?auto_26482 - BLOCK
    )
    :vars
    (
      ?auto_26483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26478 ?auto_26479 ) ) ( not ( = ?auto_26478 ?auto_26480 ) ) ( not ( = ?auto_26478 ?auto_26481 ) ) ( not ( = ?auto_26478 ?auto_26482 ) ) ( not ( = ?auto_26479 ?auto_26480 ) ) ( not ( = ?auto_26479 ?auto_26481 ) ) ( not ( = ?auto_26479 ?auto_26482 ) ) ( not ( = ?auto_26480 ?auto_26481 ) ) ( not ( = ?auto_26480 ?auto_26482 ) ) ( not ( = ?auto_26481 ?auto_26482 ) ) ( ON-TABLE ?auto_26482 ) ( ON ?auto_26478 ?auto_26483 ) ( not ( = ?auto_26478 ?auto_26483 ) ) ( not ( = ?auto_26479 ?auto_26483 ) ) ( not ( = ?auto_26480 ?auto_26483 ) ) ( not ( = ?auto_26481 ?auto_26483 ) ) ( not ( = ?auto_26482 ?auto_26483 ) ) ( ON ?auto_26479 ?auto_26478 ) ( ON-TABLE ?auto_26483 ) ( ON ?auto_26480 ?auto_26479 ) ( CLEAR ?auto_26482 ) ( ON ?auto_26481 ?auto_26480 ) ( CLEAR ?auto_26481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26483 ?auto_26478 ?auto_26479 ?auto_26480 )
      ( MAKE-5PILE ?auto_26478 ?auto_26479 ?auto_26480 ?auto_26481 ?auto_26482 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26484 - BLOCK
      ?auto_26485 - BLOCK
      ?auto_26486 - BLOCK
      ?auto_26487 - BLOCK
      ?auto_26488 - BLOCK
    )
    :vars
    (
      ?auto_26489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26484 ?auto_26485 ) ) ( not ( = ?auto_26484 ?auto_26486 ) ) ( not ( = ?auto_26484 ?auto_26487 ) ) ( not ( = ?auto_26484 ?auto_26488 ) ) ( not ( = ?auto_26485 ?auto_26486 ) ) ( not ( = ?auto_26485 ?auto_26487 ) ) ( not ( = ?auto_26485 ?auto_26488 ) ) ( not ( = ?auto_26486 ?auto_26487 ) ) ( not ( = ?auto_26486 ?auto_26488 ) ) ( not ( = ?auto_26487 ?auto_26488 ) ) ( ON ?auto_26484 ?auto_26489 ) ( not ( = ?auto_26484 ?auto_26489 ) ) ( not ( = ?auto_26485 ?auto_26489 ) ) ( not ( = ?auto_26486 ?auto_26489 ) ) ( not ( = ?auto_26487 ?auto_26489 ) ) ( not ( = ?auto_26488 ?auto_26489 ) ) ( ON ?auto_26485 ?auto_26484 ) ( ON-TABLE ?auto_26489 ) ( ON ?auto_26486 ?auto_26485 ) ( ON ?auto_26487 ?auto_26486 ) ( CLEAR ?auto_26487 ) ( HOLDING ?auto_26488 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26488 )
      ( MAKE-5PILE ?auto_26484 ?auto_26485 ?auto_26486 ?auto_26487 ?auto_26488 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26490 - BLOCK
      ?auto_26491 - BLOCK
      ?auto_26492 - BLOCK
      ?auto_26493 - BLOCK
      ?auto_26494 - BLOCK
    )
    :vars
    (
      ?auto_26495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26490 ?auto_26491 ) ) ( not ( = ?auto_26490 ?auto_26492 ) ) ( not ( = ?auto_26490 ?auto_26493 ) ) ( not ( = ?auto_26490 ?auto_26494 ) ) ( not ( = ?auto_26491 ?auto_26492 ) ) ( not ( = ?auto_26491 ?auto_26493 ) ) ( not ( = ?auto_26491 ?auto_26494 ) ) ( not ( = ?auto_26492 ?auto_26493 ) ) ( not ( = ?auto_26492 ?auto_26494 ) ) ( not ( = ?auto_26493 ?auto_26494 ) ) ( ON ?auto_26490 ?auto_26495 ) ( not ( = ?auto_26490 ?auto_26495 ) ) ( not ( = ?auto_26491 ?auto_26495 ) ) ( not ( = ?auto_26492 ?auto_26495 ) ) ( not ( = ?auto_26493 ?auto_26495 ) ) ( not ( = ?auto_26494 ?auto_26495 ) ) ( ON ?auto_26491 ?auto_26490 ) ( ON-TABLE ?auto_26495 ) ( ON ?auto_26492 ?auto_26491 ) ( ON ?auto_26493 ?auto_26492 ) ( ON ?auto_26494 ?auto_26493 ) ( CLEAR ?auto_26494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26495 ?auto_26490 ?auto_26491 ?auto_26492 ?auto_26493 )
      ( MAKE-5PILE ?auto_26490 ?auto_26491 ?auto_26492 ?auto_26493 ?auto_26494 ) )
  )

)

