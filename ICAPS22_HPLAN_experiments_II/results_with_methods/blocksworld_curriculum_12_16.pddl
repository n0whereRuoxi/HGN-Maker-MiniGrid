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
      ?auto_194405 - BLOCK
    )
    :vars
    (
      ?auto_194406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194405 ?auto_194406 ) ( CLEAR ?auto_194405 ) ( HAND-EMPTY ) ( not ( = ?auto_194405 ?auto_194406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194405 ?auto_194406 )
      ( !PUTDOWN ?auto_194405 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_194408 - BLOCK
    )
    :vars
    (
      ?auto_194409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194408 ?auto_194409 ) ( CLEAR ?auto_194408 ) ( HAND-EMPTY ) ( not ( = ?auto_194408 ?auto_194409 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194408 ?auto_194409 )
      ( !PUTDOWN ?auto_194408 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_194412 - BLOCK
      ?auto_194413 - BLOCK
    )
    :vars
    (
      ?auto_194414 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_194412 ) ( ON ?auto_194413 ?auto_194414 ) ( CLEAR ?auto_194413 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194412 ) ( not ( = ?auto_194412 ?auto_194413 ) ) ( not ( = ?auto_194412 ?auto_194414 ) ) ( not ( = ?auto_194413 ?auto_194414 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194413 ?auto_194414 )
      ( !STACK ?auto_194413 ?auto_194412 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_194417 - BLOCK
      ?auto_194418 - BLOCK
    )
    :vars
    (
      ?auto_194419 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_194417 ) ( ON ?auto_194418 ?auto_194419 ) ( CLEAR ?auto_194418 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194417 ) ( not ( = ?auto_194417 ?auto_194418 ) ) ( not ( = ?auto_194417 ?auto_194419 ) ) ( not ( = ?auto_194418 ?auto_194419 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194418 ?auto_194419 )
      ( !STACK ?auto_194418 ?auto_194417 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_194422 - BLOCK
      ?auto_194423 - BLOCK
    )
    :vars
    (
      ?auto_194424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194423 ?auto_194424 ) ( not ( = ?auto_194422 ?auto_194423 ) ) ( not ( = ?auto_194422 ?auto_194424 ) ) ( not ( = ?auto_194423 ?auto_194424 ) ) ( ON ?auto_194422 ?auto_194423 ) ( CLEAR ?auto_194422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194422 )
      ( MAKE-2PILE ?auto_194422 ?auto_194423 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_194427 - BLOCK
      ?auto_194428 - BLOCK
    )
    :vars
    (
      ?auto_194429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194428 ?auto_194429 ) ( not ( = ?auto_194427 ?auto_194428 ) ) ( not ( = ?auto_194427 ?auto_194429 ) ) ( not ( = ?auto_194428 ?auto_194429 ) ) ( ON ?auto_194427 ?auto_194428 ) ( CLEAR ?auto_194427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194427 )
      ( MAKE-2PILE ?auto_194427 ?auto_194428 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194433 - BLOCK
      ?auto_194434 - BLOCK
      ?auto_194435 - BLOCK
    )
    :vars
    (
      ?auto_194436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_194434 ) ( ON ?auto_194435 ?auto_194436 ) ( CLEAR ?auto_194435 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194433 ) ( ON ?auto_194434 ?auto_194433 ) ( not ( = ?auto_194433 ?auto_194434 ) ) ( not ( = ?auto_194433 ?auto_194435 ) ) ( not ( = ?auto_194433 ?auto_194436 ) ) ( not ( = ?auto_194434 ?auto_194435 ) ) ( not ( = ?auto_194434 ?auto_194436 ) ) ( not ( = ?auto_194435 ?auto_194436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194435 ?auto_194436 )
      ( !STACK ?auto_194435 ?auto_194434 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194440 - BLOCK
      ?auto_194441 - BLOCK
      ?auto_194442 - BLOCK
    )
    :vars
    (
      ?auto_194443 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_194441 ) ( ON ?auto_194442 ?auto_194443 ) ( CLEAR ?auto_194442 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194440 ) ( ON ?auto_194441 ?auto_194440 ) ( not ( = ?auto_194440 ?auto_194441 ) ) ( not ( = ?auto_194440 ?auto_194442 ) ) ( not ( = ?auto_194440 ?auto_194443 ) ) ( not ( = ?auto_194441 ?auto_194442 ) ) ( not ( = ?auto_194441 ?auto_194443 ) ) ( not ( = ?auto_194442 ?auto_194443 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194442 ?auto_194443 )
      ( !STACK ?auto_194442 ?auto_194441 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194447 - BLOCK
      ?auto_194448 - BLOCK
      ?auto_194449 - BLOCK
    )
    :vars
    (
      ?auto_194450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194449 ?auto_194450 ) ( ON-TABLE ?auto_194447 ) ( not ( = ?auto_194447 ?auto_194448 ) ) ( not ( = ?auto_194447 ?auto_194449 ) ) ( not ( = ?auto_194447 ?auto_194450 ) ) ( not ( = ?auto_194448 ?auto_194449 ) ) ( not ( = ?auto_194448 ?auto_194450 ) ) ( not ( = ?auto_194449 ?auto_194450 ) ) ( CLEAR ?auto_194447 ) ( ON ?auto_194448 ?auto_194449 ) ( CLEAR ?auto_194448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194447 ?auto_194448 )
      ( MAKE-3PILE ?auto_194447 ?auto_194448 ?auto_194449 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194454 - BLOCK
      ?auto_194455 - BLOCK
      ?auto_194456 - BLOCK
    )
    :vars
    (
      ?auto_194457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194456 ?auto_194457 ) ( ON-TABLE ?auto_194454 ) ( not ( = ?auto_194454 ?auto_194455 ) ) ( not ( = ?auto_194454 ?auto_194456 ) ) ( not ( = ?auto_194454 ?auto_194457 ) ) ( not ( = ?auto_194455 ?auto_194456 ) ) ( not ( = ?auto_194455 ?auto_194457 ) ) ( not ( = ?auto_194456 ?auto_194457 ) ) ( CLEAR ?auto_194454 ) ( ON ?auto_194455 ?auto_194456 ) ( CLEAR ?auto_194455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194454 ?auto_194455 )
      ( MAKE-3PILE ?auto_194454 ?auto_194455 ?auto_194456 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194461 - BLOCK
      ?auto_194462 - BLOCK
      ?auto_194463 - BLOCK
    )
    :vars
    (
      ?auto_194464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194463 ?auto_194464 ) ( not ( = ?auto_194461 ?auto_194462 ) ) ( not ( = ?auto_194461 ?auto_194463 ) ) ( not ( = ?auto_194461 ?auto_194464 ) ) ( not ( = ?auto_194462 ?auto_194463 ) ) ( not ( = ?auto_194462 ?auto_194464 ) ) ( not ( = ?auto_194463 ?auto_194464 ) ) ( ON ?auto_194462 ?auto_194463 ) ( ON ?auto_194461 ?auto_194462 ) ( CLEAR ?auto_194461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194461 )
      ( MAKE-3PILE ?auto_194461 ?auto_194462 ?auto_194463 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194468 - BLOCK
      ?auto_194469 - BLOCK
      ?auto_194470 - BLOCK
    )
    :vars
    (
      ?auto_194471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194470 ?auto_194471 ) ( not ( = ?auto_194468 ?auto_194469 ) ) ( not ( = ?auto_194468 ?auto_194470 ) ) ( not ( = ?auto_194468 ?auto_194471 ) ) ( not ( = ?auto_194469 ?auto_194470 ) ) ( not ( = ?auto_194469 ?auto_194471 ) ) ( not ( = ?auto_194470 ?auto_194471 ) ) ( ON ?auto_194469 ?auto_194470 ) ( ON ?auto_194468 ?auto_194469 ) ( CLEAR ?auto_194468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194468 )
      ( MAKE-3PILE ?auto_194468 ?auto_194469 ?auto_194470 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194476 - BLOCK
      ?auto_194477 - BLOCK
      ?auto_194478 - BLOCK
      ?auto_194479 - BLOCK
    )
    :vars
    (
      ?auto_194480 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_194478 ) ( ON ?auto_194479 ?auto_194480 ) ( CLEAR ?auto_194479 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194476 ) ( ON ?auto_194477 ?auto_194476 ) ( ON ?auto_194478 ?auto_194477 ) ( not ( = ?auto_194476 ?auto_194477 ) ) ( not ( = ?auto_194476 ?auto_194478 ) ) ( not ( = ?auto_194476 ?auto_194479 ) ) ( not ( = ?auto_194476 ?auto_194480 ) ) ( not ( = ?auto_194477 ?auto_194478 ) ) ( not ( = ?auto_194477 ?auto_194479 ) ) ( not ( = ?auto_194477 ?auto_194480 ) ) ( not ( = ?auto_194478 ?auto_194479 ) ) ( not ( = ?auto_194478 ?auto_194480 ) ) ( not ( = ?auto_194479 ?auto_194480 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194479 ?auto_194480 )
      ( !STACK ?auto_194479 ?auto_194478 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194485 - BLOCK
      ?auto_194486 - BLOCK
      ?auto_194487 - BLOCK
      ?auto_194488 - BLOCK
    )
    :vars
    (
      ?auto_194489 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_194487 ) ( ON ?auto_194488 ?auto_194489 ) ( CLEAR ?auto_194488 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194485 ) ( ON ?auto_194486 ?auto_194485 ) ( ON ?auto_194487 ?auto_194486 ) ( not ( = ?auto_194485 ?auto_194486 ) ) ( not ( = ?auto_194485 ?auto_194487 ) ) ( not ( = ?auto_194485 ?auto_194488 ) ) ( not ( = ?auto_194485 ?auto_194489 ) ) ( not ( = ?auto_194486 ?auto_194487 ) ) ( not ( = ?auto_194486 ?auto_194488 ) ) ( not ( = ?auto_194486 ?auto_194489 ) ) ( not ( = ?auto_194487 ?auto_194488 ) ) ( not ( = ?auto_194487 ?auto_194489 ) ) ( not ( = ?auto_194488 ?auto_194489 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194488 ?auto_194489 )
      ( !STACK ?auto_194488 ?auto_194487 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194494 - BLOCK
      ?auto_194495 - BLOCK
      ?auto_194496 - BLOCK
      ?auto_194497 - BLOCK
    )
    :vars
    (
      ?auto_194498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194497 ?auto_194498 ) ( ON-TABLE ?auto_194494 ) ( ON ?auto_194495 ?auto_194494 ) ( not ( = ?auto_194494 ?auto_194495 ) ) ( not ( = ?auto_194494 ?auto_194496 ) ) ( not ( = ?auto_194494 ?auto_194497 ) ) ( not ( = ?auto_194494 ?auto_194498 ) ) ( not ( = ?auto_194495 ?auto_194496 ) ) ( not ( = ?auto_194495 ?auto_194497 ) ) ( not ( = ?auto_194495 ?auto_194498 ) ) ( not ( = ?auto_194496 ?auto_194497 ) ) ( not ( = ?auto_194496 ?auto_194498 ) ) ( not ( = ?auto_194497 ?auto_194498 ) ) ( CLEAR ?auto_194495 ) ( ON ?auto_194496 ?auto_194497 ) ( CLEAR ?auto_194496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194494 ?auto_194495 ?auto_194496 )
      ( MAKE-4PILE ?auto_194494 ?auto_194495 ?auto_194496 ?auto_194497 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194503 - BLOCK
      ?auto_194504 - BLOCK
      ?auto_194505 - BLOCK
      ?auto_194506 - BLOCK
    )
    :vars
    (
      ?auto_194507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194506 ?auto_194507 ) ( ON-TABLE ?auto_194503 ) ( ON ?auto_194504 ?auto_194503 ) ( not ( = ?auto_194503 ?auto_194504 ) ) ( not ( = ?auto_194503 ?auto_194505 ) ) ( not ( = ?auto_194503 ?auto_194506 ) ) ( not ( = ?auto_194503 ?auto_194507 ) ) ( not ( = ?auto_194504 ?auto_194505 ) ) ( not ( = ?auto_194504 ?auto_194506 ) ) ( not ( = ?auto_194504 ?auto_194507 ) ) ( not ( = ?auto_194505 ?auto_194506 ) ) ( not ( = ?auto_194505 ?auto_194507 ) ) ( not ( = ?auto_194506 ?auto_194507 ) ) ( CLEAR ?auto_194504 ) ( ON ?auto_194505 ?auto_194506 ) ( CLEAR ?auto_194505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194503 ?auto_194504 ?auto_194505 )
      ( MAKE-4PILE ?auto_194503 ?auto_194504 ?auto_194505 ?auto_194506 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194512 - BLOCK
      ?auto_194513 - BLOCK
      ?auto_194514 - BLOCK
      ?auto_194515 - BLOCK
    )
    :vars
    (
      ?auto_194516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194515 ?auto_194516 ) ( ON-TABLE ?auto_194512 ) ( not ( = ?auto_194512 ?auto_194513 ) ) ( not ( = ?auto_194512 ?auto_194514 ) ) ( not ( = ?auto_194512 ?auto_194515 ) ) ( not ( = ?auto_194512 ?auto_194516 ) ) ( not ( = ?auto_194513 ?auto_194514 ) ) ( not ( = ?auto_194513 ?auto_194515 ) ) ( not ( = ?auto_194513 ?auto_194516 ) ) ( not ( = ?auto_194514 ?auto_194515 ) ) ( not ( = ?auto_194514 ?auto_194516 ) ) ( not ( = ?auto_194515 ?auto_194516 ) ) ( ON ?auto_194514 ?auto_194515 ) ( CLEAR ?auto_194512 ) ( ON ?auto_194513 ?auto_194514 ) ( CLEAR ?auto_194513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194512 ?auto_194513 )
      ( MAKE-4PILE ?auto_194512 ?auto_194513 ?auto_194514 ?auto_194515 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194521 - BLOCK
      ?auto_194522 - BLOCK
      ?auto_194523 - BLOCK
      ?auto_194524 - BLOCK
    )
    :vars
    (
      ?auto_194525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194524 ?auto_194525 ) ( ON-TABLE ?auto_194521 ) ( not ( = ?auto_194521 ?auto_194522 ) ) ( not ( = ?auto_194521 ?auto_194523 ) ) ( not ( = ?auto_194521 ?auto_194524 ) ) ( not ( = ?auto_194521 ?auto_194525 ) ) ( not ( = ?auto_194522 ?auto_194523 ) ) ( not ( = ?auto_194522 ?auto_194524 ) ) ( not ( = ?auto_194522 ?auto_194525 ) ) ( not ( = ?auto_194523 ?auto_194524 ) ) ( not ( = ?auto_194523 ?auto_194525 ) ) ( not ( = ?auto_194524 ?auto_194525 ) ) ( ON ?auto_194523 ?auto_194524 ) ( CLEAR ?auto_194521 ) ( ON ?auto_194522 ?auto_194523 ) ( CLEAR ?auto_194522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194521 ?auto_194522 )
      ( MAKE-4PILE ?auto_194521 ?auto_194522 ?auto_194523 ?auto_194524 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194530 - BLOCK
      ?auto_194531 - BLOCK
      ?auto_194532 - BLOCK
      ?auto_194533 - BLOCK
    )
    :vars
    (
      ?auto_194534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194533 ?auto_194534 ) ( not ( = ?auto_194530 ?auto_194531 ) ) ( not ( = ?auto_194530 ?auto_194532 ) ) ( not ( = ?auto_194530 ?auto_194533 ) ) ( not ( = ?auto_194530 ?auto_194534 ) ) ( not ( = ?auto_194531 ?auto_194532 ) ) ( not ( = ?auto_194531 ?auto_194533 ) ) ( not ( = ?auto_194531 ?auto_194534 ) ) ( not ( = ?auto_194532 ?auto_194533 ) ) ( not ( = ?auto_194532 ?auto_194534 ) ) ( not ( = ?auto_194533 ?auto_194534 ) ) ( ON ?auto_194532 ?auto_194533 ) ( ON ?auto_194531 ?auto_194532 ) ( ON ?auto_194530 ?auto_194531 ) ( CLEAR ?auto_194530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194530 )
      ( MAKE-4PILE ?auto_194530 ?auto_194531 ?auto_194532 ?auto_194533 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194539 - BLOCK
      ?auto_194540 - BLOCK
      ?auto_194541 - BLOCK
      ?auto_194542 - BLOCK
    )
    :vars
    (
      ?auto_194543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194542 ?auto_194543 ) ( not ( = ?auto_194539 ?auto_194540 ) ) ( not ( = ?auto_194539 ?auto_194541 ) ) ( not ( = ?auto_194539 ?auto_194542 ) ) ( not ( = ?auto_194539 ?auto_194543 ) ) ( not ( = ?auto_194540 ?auto_194541 ) ) ( not ( = ?auto_194540 ?auto_194542 ) ) ( not ( = ?auto_194540 ?auto_194543 ) ) ( not ( = ?auto_194541 ?auto_194542 ) ) ( not ( = ?auto_194541 ?auto_194543 ) ) ( not ( = ?auto_194542 ?auto_194543 ) ) ( ON ?auto_194541 ?auto_194542 ) ( ON ?auto_194540 ?auto_194541 ) ( ON ?auto_194539 ?auto_194540 ) ( CLEAR ?auto_194539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194539 )
      ( MAKE-4PILE ?auto_194539 ?auto_194540 ?auto_194541 ?auto_194542 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194549 - BLOCK
      ?auto_194550 - BLOCK
      ?auto_194551 - BLOCK
      ?auto_194552 - BLOCK
      ?auto_194553 - BLOCK
    )
    :vars
    (
      ?auto_194554 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_194552 ) ( ON ?auto_194553 ?auto_194554 ) ( CLEAR ?auto_194553 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194549 ) ( ON ?auto_194550 ?auto_194549 ) ( ON ?auto_194551 ?auto_194550 ) ( ON ?auto_194552 ?auto_194551 ) ( not ( = ?auto_194549 ?auto_194550 ) ) ( not ( = ?auto_194549 ?auto_194551 ) ) ( not ( = ?auto_194549 ?auto_194552 ) ) ( not ( = ?auto_194549 ?auto_194553 ) ) ( not ( = ?auto_194549 ?auto_194554 ) ) ( not ( = ?auto_194550 ?auto_194551 ) ) ( not ( = ?auto_194550 ?auto_194552 ) ) ( not ( = ?auto_194550 ?auto_194553 ) ) ( not ( = ?auto_194550 ?auto_194554 ) ) ( not ( = ?auto_194551 ?auto_194552 ) ) ( not ( = ?auto_194551 ?auto_194553 ) ) ( not ( = ?auto_194551 ?auto_194554 ) ) ( not ( = ?auto_194552 ?auto_194553 ) ) ( not ( = ?auto_194552 ?auto_194554 ) ) ( not ( = ?auto_194553 ?auto_194554 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194553 ?auto_194554 )
      ( !STACK ?auto_194553 ?auto_194552 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194560 - BLOCK
      ?auto_194561 - BLOCK
      ?auto_194562 - BLOCK
      ?auto_194563 - BLOCK
      ?auto_194564 - BLOCK
    )
    :vars
    (
      ?auto_194565 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_194563 ) ( ON ?auto_194564 ?auto_194565 ) ( CLEAR ?auto_194564 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194560 ) ( ON ?auto_194561 ?auto_194560 ) ( ON ?auto_194562 ?auto_194561 ) ( ON ?auto_194563 ?auto_194562 ) ( not ( = ?auto_194560 ?auto_194561 ) ) ( not ( = ?auto_194560 ?auto_194562 ) ) ( not ( = ?auto_194560 ?auto_194563 ) ) ( not ( = ?auto_194560 ?auto_194564 ) ) ( not ( = ?auto_194560 ?auto_194565 ) ) ( not ( = ?auto_194561 ?auto_194562 ) ) ( not ( = ?auto_194561 ?auto_194563 ) ) ( not ( = ?auto_194561 ?auto_194564 ) ) ( not ( = ?auto_194561 ?auto_194565 ) ) ( not ( = ?auto_194562 ?auto_194563 ) ) ( not ( = ?auto_194562 ?auto_194564 ) ) ( not ( = ?auto_194562 ?auto_194565 ) ) ( not ( = ?auto_194563 ?auto_194564 ) ) ( not ( = ?auto_194563 ?auto_194565 ) ) ( not ( = ?auto_194564 ?auto_194565 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194564 ?auto_194565 )
      ( !STACK ?auto_194564 ?auto_194563 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194571 - BLOCK
      ?auto_194572 - BLOCK
      ?auto_194573 - BLOCK
      ?auto_194574 - BLOCK
      ?auto_194575 - BLOCK
    )
    :vars
    (
      ?auto_194576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194575 ?auto_194576 ) ( ON-TABLE ?auto_194571 ) ( ON ?auto_194572 ?auto_194571 ) ( ON ?auto_194573 ?auto_194572 ) ( not ( = ?auto_194571 ?auto_194572 ) ) ( not ( = ?auto_194571 ?auto_194573 ) ) ( not ( = ?auto_194571 ?auto_194574 ) ) ( not ( = ?auto_194571 ?auto_194575 ) ) ( not ( = ?auto_194571 ?auto_194576 ) ) ( not ( = ?auto_194572 ?auto_194573 ) ) ( not ( = ?auto_194572 ?auto_194574 ) ) ( not ( = ?auto_194572 ?auto_194575 ) ) ( not ( = ?auto_194572 ?auto_194576 ) ) ( not ( = ?auto_194573 ?auto_194574 ) ) ( not ( = ?auto_194573 ?auto_194575 ) ) ( not ( = ?auto_194573 ?auto_194576 ) ) ( not ( = ?auto_194574 ?auto_194575 ) ) ( not ( = ?auto_194574 ?auto_194576 ) ) ( not ( = ?auto_194575 ?auto_194576 ) ) ( CLEAR ?auto_194573 ) ( ON ?auto_194574 ?auto_194575 ) ( CLEAR ?auto_194574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194571 ?auto_194572 ?auto_194573 ?auto_194574 )
      ( MAKE-5PILE ?auto_194571 ?auto_194572 ?auto_194573 ?auto_194574 ?auto_194575 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194582 - BLOCK
      ?auto_194583 - BLOCK
      ?auto_194584 - BLOCK
      ?auto_194585 - BLOCK
      ?auto_194586 - BLOCK
    )
    :vars
    (
      ?auto_194587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194586 ?auto_194587 ) ( ON-TABLE ?auto_194582 ) ( ON ?auto_194583 ?auto_194582 ) ( ON ?auto_194584 ?auto_194583 ) ( not ( = ?auto_194582 ?auto_194583 ) ) ( not ( = ?auto_194582 ?auto_194584 ) ) ( not ( = ?auto_194582 ?auto_194585 ) ) ( not ( = ?auto_194582 ?auto_194586 ) ) ( not ( = ?auto_194582 ?auto_194587 ) ) ( not ( = ?auto_194583 ?auto_194584 ) ) ( not ( = ?auto_194583 ?auto_194585 ) ) ( not ( = ?auto_194583 ?auto_194586 ) ) ( not ( = ?auto_194583 ?auto_194587 ) ) ( not ( = ?auto_194584 ?auto_194585 ) ) ( not ( = ?auto_194584 ?auto_194586 ) ) ( not ( = ?auto_194584 ?auto_194587 ) ) ( not ( = ?auto_194585 ?auto_194586 ) ) ( not ( = ?auto_194585 ?auto_194587 ) ) ( not ( = ?auto_194586 ?auto_194587 ) ) ( CLEAR ?auto_194584 ) ( ON ?auto_194585 ?auto_194586 ) ( CLEAR ?auto_194585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194582 ?auto_194583 ?auto_194584 ?auto_194585 )
      ( MAKE-5PILE ?auto_194582 ?auto_194583 ?auto_194584 ?auto_194585 ?auto_194586 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194593 - BLOCK
      ?auto_194594 - BLOCK
      ?auto_194595 - BLOCK
      ?auto_194596 - BLOCK
      ?auto_194597 - BLOCK
    )
    :vars
    (
      ?auto_194598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194597 ?auto_194598 ) ( ON-TABLE ?auto_194593 ) ( ON ?auto_194594 ?auto_194593 ) ( not ( = ?auto_194593 ?auto_194594 ) ) ( not ( = ?auto_194593 ?auto_194595 ) ) ( not ( = ?auto_194593 ?auto_194596 ) ) ( not ( = ?auto_194593 ?auto_194597 ) ) ( not ( = ?auto_194593 ?auto_194598 ) ) ( not ( = ?auto_194594 ?auto_194595 ) ) ( not ( = ?auto_194594 ?auto_194596 ) ) ( not ( = ?auto_194594 ?auto_194597 ) ) ( not ( = ?auto_194594 ?auto_194598 ) ) ( not ( = ?auto_194595 ?auto_194596 ) ) ( not ( = ?auto_194595 ?auto_194597 ) ) ( not ( = ?auto_194595 ?auto_194598 ) ) ( not ( = ?auto_194596 ?auto_194597 ) ) ( not ( = ?auto_194596 ?auto_194598 ) ) ( not ( = ?auto_194597 ?auto_194598 ) ) ( ON ?auto_194596 ?auto_194597 ) ( CLEAR ?auto_194594 ) ( ON ?auto_194595 ?auto_194596 ) ( CLEAR ?auto_194595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194593 ?auto_194594 ?auto_194595 )
      ( MAKE-5PILE ?auto_194593 ?auto_194594 ?auto_194595 ?auto_194596 ?auto_194597 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194604 - BLOCK
      ?auto_194605 - BLOCK
      ?auto_194606 - BLOCK
      ?auto_194607 - BLOCK
      ?auto_194608 - BLOCK
    )
    :vars
    (
      ?auto_194609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194608 ?auto_194609 ) ( ON-TABLE ?auto_194604 ) ( ON ?auto_194605 ?auto_194604 ) ( not ( = ?auto_194604 ?auto_194605 ) ) ( not ( = ?auto_194604 ?auto_194606 ) ) ( not ( = ?auto_194604 ?auto_194607 ) ) ( not ( = ?auto_194604 ?auto_194608 ) ) ( not ( = ?auto_194604 ?auto_194609 ) ) ( not ( = ?auto_194605 ?auto_194606 ) ) ( not ( = ?auto_194605 ?auto_194607 ) ) ( not ( = ?auto_194605 ?auto_194608 ) ) ( not ( = ?auto_194605 ?auto_194609 ) ) ( not ( = ?auto_194606 ?auto_194607 ) ) ( not ( = ?auto_194606 ?auto_194608 ) ) ( not ( = ?auto_194606 ?auto_194609 ) ) ( not ( = ?auto_194607 ?auto_194608 ) ) ( not ( = ?auto_194607 ?auto_194609 ) ) ( not ( = ?auto_194608 ?auto_194609 ) ) ( ON ?auto_194607 ?auto_194608 ) ( CLEAR ?auto_194605 ) ( ON ?auto_194606 ?auto_194607 ) ( CLEAR ?auto_194606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194604 ?auto_194605 ?auto_194606 )
      ( MAKE-5PILE ?auto_194604 ?auto_194605 ?auto_194606 ?auto_194607 ?auto_194608 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194615 - BLOCK
      ?auto_194616 - BLOCK
      ?auto_194617 - BLOCK
      ?auto_194618 - BLOCK
      ?auto_194619 - BLOCK
    )
    :vars
    (
      ?auto_194620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194619 ?auto_194620 ) ( ON-TABLE ?auto_194615 ) ( not ( = ?auto_194615 ?auto_194616 ) ) ( not ( = ?auto_194615 ?auto_194617 ) ) ( not ( = ?auto_194615 ?auto_194618 ) ) ( not ( = ?auto_194615 ?auto_194619 ) ) ( not ( = ?auto_194615 ?auto_194620 ) ) ( not ( = ?auto_194616 ?auto_194617 ) ) ( not ( = ?auto_194616 ?auto_194618 ) ) ( not ( = ?auto_194616 ?auto_194619 ) ) ( not ( = ?auto_194616 ?auto_194620 ) ) ( not ( = ?auto_194617 ?auto_194618 ) ) ( not ( = ?auto_194617 ?auto_194619 ) ) ( not ( = ?auto_194617 ?auto_194620 ) ) ( not ( = ?auto_194618 ?auto_194619 ) ) ( not ( = ?auto_194618 ?auto_194620 ) ) ( not ( = ?auto_194619 ?auto_194620 ) ) ( ON ?auto_194618 ?auto_194619 ) ( ON ?auto_194617 ?auto_194618 ) ( CLEAR ?auto_194615 ) ( ON ?auto_194616 ?auto_194617 ) ( CLEAR ?auto_194616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194615 ?auto_194616 )
      ( MAKE-5PILE ?auto_194615 ?auto_194616 ?auto_194617 ?auto_194618 ?auto_194619 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194626 - BLOCK
      ?auto_194627 - BLOCK
      ?auto_194628 - BLOCK
      ?auto_194629 - BLOCK
      ?auto_194630 - BLOCK
    )
    :vars
    (
      ?auto_194631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194630 ?auto_194631 ) ( ON-TABLE ?auto_194626 ) ( not ( = ?auto_194626 ?auto_194627 ) ) ( not ( = ?auto_194626 ?auto_194628 ) ) ( not ( = ?auto_194626 ?auto_194629 ) ) ( not ( = ?auto_194626 ?auto_194630 ) ) ( not ( = ?auto_194626 ?auto_194631 ) ) ( not ( = ?auto_194627 ?auto_194628 ) ) ( not ( = ?auto_194627 ?auto_194629 ) ) ( not ( = ?auto_194627 ?auto_194630 ) ) ( not ( = ?auto_194627 ?auto_194631 ) ) ( not ( = ?auto_194628 ?auto_194629 ) ) ( not ( = ?auto_194628 ?auto_194630 ) ) ( not ( = ?auto_194628 ?auto_194631 ) ) ( not ( = ?auto_194629 ?auto_194630 ) ) ( not ( = ?auto_194629 ?auto_194631 ) ) ( not ( = ?auto_194630 ?auto_194631 ) ) ( ON ?auto_194629 ?auto_194630 ) ( ON ?auto_194628 ?auto_194629 ) ( CLEAR ?auto_194626 ) ( ON ?auto_194627 ?auto_194628 ) ( CLEAR ?auto_194627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194626 ?auto_194627 )
      ( MAKE-5PILE ?auto_194626 ?auto_194627 ?auto_194628 ?auto_194629 ?auto_194630 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194637 - BLOCK
      ?auto_194638 - BLOCK
      ?auto_194639 - BLOCK
      ?auto_194640 - BLOCK
      ?auto_194641 - BLOCK
    )
    :vars
    (
      ?auto_194642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194641 ?auto_194642 ) ( not ( = ?auto_194637 ?auto_194638 ) ) ( not ( = ?auto_194637 ?auto_194639 ) ) ( not ( = ?auto_194637 ?auto_194640 ) ) ( not ( = ?auto_194637 ?auto_194641 ) ) ( not ( = ?auto_194637 ?auto_194642 ) ) ( not ( = ?auto_194638 ?auto_194639 ) ) ( not ( = ?auto_194638 ?auto_194640 ) ) ( not ( = ?auto_194638 ?auto_194641 ) ) ( not ( = ?auto_194638 ?auto_194642 ) ) ( not ( = ?auto_194639 ?auto_194640 ) ) ( not ( = ?auto_194639 ?auto_194641 ) ) ( not ( = ?auto_194639 ?auto_194642 ) ) ( not ( = ?auto_194640 ?auto_194641 ) ) ( not ( = ?auto_194640 ?auto_194642 ) ) ( not ( = ?auto_194641 ?auto_194642 ) ) ( ON ?auto_194640 ?auto_194641 ) ( ON ?auto_194639 ?auto_194640 ) ( ON ?auto_194638 ?auto_194639 ) ( ON ?auto_194637 ?auto_194638 ) ( CLEAR ?auto_194637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194637 )
      ( MAKE-5PILE ?auto_194637 ?auto_194638 ?auto_194639 ?auto_194640 ?auto_194641 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194648 - BLOCK
      ?auto_194649 - BLOCK
      ?auto_194650 - BLOCK
      ?auto_194651 - BLOCK
      ?auto_194652 - BLOCK
    )
    :vars
    (
      ?auto_194653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194652 ?auto_194653 ) ( not ( = ?auto_194648 ?auto_194649 ) ) ( not ( = ?auto_194648 ?auto_194650 ) ) ( not ( = ?auto_194648 ?auto_194651 ) ) ( not ( = ?auto_194648 ?auto_194652 ) ) ( not ( = ?auto_194648 ?auto_194653 ) ) ( not ( = ?auto_194649 ?auto_194650 ) ) ( not ( = ?auto_194649 ?auto_194651 ) ) ( not ( = ?auto_194649 ?auto_194652 ) ) ( not ( = ?auto_194649 ?auto_194653 ) ) ( not ( = ?auto_194650 ?auto_194651 ) ) ( not ( = ?auto_194650 ?auto_194652 ) ) ( not ( = ?auto_194650 ?auto_194653 ) ) ( not ( = ?auto_194651 ?auto_194652 ) ) ( not ( = ?auto_194651 ?auto_194653 ) ) ( not ( = ?auto_194652 ?auto_194653 ) ) ( ON ?auto_194651 ?auto_194652 ) ( ON ?auto_194650 ?auto_194651 ) ( ON ?auto_194649 ?auto_194650 ) ( ON ?auto_194648 ?auto_194649 ) ( CLEAR ?auto_194648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194648 )
      ( MAKE-5PILE ?auto_194648 ?auto_194649 ?auto_194650 ?auto_194651 ?auto_194652 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_194660 - BLOCK
      ?auto_194661 - BLOCK
      ?auto_194662 - BLOCK
      ?auto_194663 - BLOCK
      ?auto_194664 - BLOCK
      ?auto_194665 - BLOCK
    )
    :vars
    (
      ?auto_194666 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_194664 ) ( ON ?auto_194665 ?auto_194666 ) ( CLEAR ?auto_194665 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194660 ) ( ON ?auto_194661 ?auto_194660 ) ( ON ?auto_194662 ?auto_194661 ) ( ON ?auto_194663 ?auto_194662 ) ( ON ?auto_194664 ?auto_194663 ) ( not ( = ?auto_194660 ?auto_194661 ) ) ( not ( = ?auto_194660 ?auto_194662 ) ) ( not ( = ?auto_194660 ?auto_194663 ) ) ( not ( = ?auto_194660 ?auto_194664 ) ) ( not ( = ?auto_194660 ?auto_194665 ) ) ( not ( = ?auto_194660 ?auto_194666 ) ) ( not ( = ?auto_194661 ?auto_194662 ) ) ( not ( = ?auto_194661 ?auto_194663 ) ) ( not ( = ?auto_194661 ?auto_194664 ) ) ( not ( = ?auto_194661 ?auto_194665 ) ) ( not ( = ?auto_194661 ?auto_194666 ) ) ( not ( = ?auto_194662 ?auto_194663 ) ) ( not ( = ?auto_194662 ?auto_194664 ) ) ( not ( = ?auto_194662 ?auto_194665 ) ) ( not ( = ?auto_194662 ?auto_194666 ) ) ( not ( = ?auto_194663 ?auto_194664 ) ) ( not ( = ?auto_194663 ?auto_194665 ) ) ( not ( = ?auto_194663 ?auto_194666 ) ) ( not ( = ?auto_194664 ?auto_194665 ) ) ( not ( = ?auto_194664 ?auto_194666 ) ) ( not ( = ?auto_194665 ?auto_194666 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194665 ?auto_194666 )
      ( !STACK ?auto_194665 ?auto_194664 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_194673 - BLOCK
      ?auto_194674 - BLOCK
      ?auto_194675 - BLOCK
      ?auto_194676 - BLOCK
      ?auto_194677 - BLOCK
      ?auto_194678 - BLOCK
    )
    :vars
    (
      ?auto_194679 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_194677 ) ( ON ?auto_194678 ?auto_194679 ) ( CLEAR ?auto_194678 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194673 ) ( ON ?auto_194674 ?auto_194673 ) ( ON ?auto_194675 ?auto_194674 ) ( ON ?auto_194676 ?auto_194675 ) ( ON ?auto_194677 ?auto_194676 ) ( not ( = ?auto_194673 ?auto_194674 ) ) ( not ( = ?auto_194673 ?auto_194675 ) ) ( not ( = ?auto_194673 ?auto_194676 ) ) ( not ( = ?auto_194673 ?auto_194677 ) ) ( not ( = ?auto_194673 ?auto_194678 ) ) ( not ( = ?auto_194673 ?auto_194679 ) ) ( not ( = ?auto_194674 ?auto_194675 ) ) ( not ( = ?auto_194674 ?auto_194676 ) ) ( not ( = ?auto_194674 ?auto_194677 ) ) ( not ( = ?auto_194674 ?auto_194678 ) ) ( not ( = ?auto_194674 ?auto_194679 ) ) ( not ( = ?auto_194675 ?auto_194676 ) ) ( not ( = ?auto_194675 ?auto_194677 ) ) ( not ( = ?auto_194675 ?auto_194678 ) ) ( not ( = ?auto_194675 ?auto_194679 ) ) ( not ( = ?auto_194676 ?auto_194677 ) ) ( not ( = ?auto_194676 ?auto_194678 ) ) ( not ( = ?auto_194676 ?auto_194679 ) ) ( not ( = ?auto_194677 ?auto_194678 ) ) ( not ( = ?auto_194677 ?auto_194679 ) ) ( not ( = ?auto_194678 ?auto_194679 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194678 ?auto_194679 )
      ( !STACK ?auto_194678 ?auto_194677 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_194686 - BLOCK
      ?auto_194687 - BLOCK
      ?auto_194688 - BLOCK
      ?auto_194689 - BLOCK
      ?auto_194690 - BLOCK
      ?auto_194691 - BLOCK
    )
    :vars
    (
      ?auto_194692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194691 ?auto_194692 ) ( ON-TABLE ?auto_194686 ) ( ON ?auto_194687 ?auto_194686 ) ( ON ?auto_194688 ?auto_194687 ) ( ON ?auto_194689 ?auto_194688 ) ( not ( = ?auto_194686 ?auto_194687 ) ) ( not ( = ?auto_194686 ?auto_194688 ) ) ( not ( = ?auto_194686 ?auto_194689 ) ) ( not ( = ?auto_194686 ?auto_194690 ) ) ( not ( = ?auto_194686 ?auto_194691 ) ) ( not ( = ?auto_194686 ?auto_194692 ) ) ( not ( = ?auto_194687 ?auto_194688 ) ) ( not ( = ?auto_194687 ?auto_194689 ) ) ( not ( = ?auto_194687 ?auto_194690 ) ) ( not ( = ?auto_194687 ?auto_194691 ) ) ( not ( = ?auto_194687 ?auto_194692 ) ) ( not ( = ?auto_194688 ?auto_194689 ) ) ( not ( = ?auto_194688 ?auto_194690 ) ) ( not ( = ?auto_194688 ?auto_194691 ) ) ( not ( = ?auto_194688 ?auto_194692 ) ) ( not ( = ?auto_194689 ?auto_194690 ) ) ( not ( = ?auto_194689 ?auto_194691 ) ) ( not ( = ?auto_194689 ?auto_194692 ) ) ( not ( = ?auto_194690 ?auto_194691 ) ) ( not ( = ?auto_194690 ?auto_194692 ) ) ( not ( = ?auto_194691 ?auto_194692 ) ) ( CLEAR ?auto_194689 ) ( ON ?auto_194690 ?auto_194691 ) ( CLEAR ?auto_194690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194686 ?auto_194687 ?auto_194688 ?auto_194689 ?auto_194690 )
      ( MAKE-6PILE ?auto_194686 ?auto_194687 ?auto_194688 ?auto_194689 ?auto_194690 ?auto_194691 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_194699 - BLOCK
      ?auto_194700 - BLOCK
      ?auto_194701 - BLOCK
      ?auto_194702 - BLOCK
      ?auto_194703 - BLOCK
      ?auto_194704 - BLOCK
    )
    :vars
    (
      ?auto_194705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194704 ?auto_194705 ) ( ON-TABLE ?auto_194699 ) ( ON ?auto_194700 ?auto_194699 ) ( ON ?auto_194701 ?auto_194700 ) ( ON ?auto_194702 ?auto_194701 ) ( not ( = ?auto_194699 ?auto_194700 ) ) ( not ( = ?auto_194699 ?auto_194701 ) ) ( not ( = ?auto_194699 ?auto_194702 ) ) ( not ( = ?auto_194699 ?auto_194703 ) ) ( not ( = ?auto_194699 ?auto_194704 ) ) ( not ( = ?auto_194699 ?auto_194705 ) ) ( not ( = ?auto_194700 ?auto_194701 ) ) ( not ( = ?auto_194700 ?auto_194702 ) ) ( not ( = ?auto_194700 ?auto_194703 ) ) ( not ( = ?auto_194700 ?auto_194704 ) ) ( not ( = ?auto_194700 ?auto_194705 ) ) ( not ( = ?auto_194701 ?auto_194702 ) ) ( not ( = ?auto_194701 ?auto_194703 ) ) ( not ( = ?auto_194701 ?auto_194704 ) ) ( not ( = ?auto_194701 ?auto_194705 ) ) ( not ( = ?auto_194702 ?auto_194703 ) ) ( not ( = ?auto_194702 ?auto_194704 ) ) ( not ( = ?auto_194702 ?auto_194705 ) ) ( not ( = ?auto_194703 ?auto_194704 ) ) ( not ( = ?auto_194703 ?auto_194705 ) ) ( not ( = ?auto_194704 ?auto_194705 ) ) ( CLEAR ?auto_194702 ) ( ON ?auto_194703 ?auto_194704 ) ( CLEAR ?auto_194703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194699 ?auto_194700 ?auto_194701 ?auto_194702 ?auto_194703 )
      ( MAKE-6PILE ?auto_194699 ?auto_194700 ?auto_194701 ?auto_194702 ?auto_194703 ?auto_194704 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_194712 - BLOCK
      ?auto_194713 - BLOCK
      ?auto_194714 - BLOCK
      ?auto_194715 - BLOCK
      ?auto_194716 - BLOCK
      ?auto_194717 - BLOCK
    )
    :vars
    (
      ?auto_194718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194717 ?auto_194718 ) ( ON-TABLE ?auto_194712 ) ( ON ?auto_194713 ?auto_194712 ) ( ON ?auto_194714 ?auto_194713 ) ( not ( = ?auto_194712 ?auto_194713 ) ) ( not ( = ?auto_194712 ?auto_194714 ) ) ( not ( = ?auto_194712 ?auto_194715 ) ) ( not ( = ?auto_194712 ?auto_194716 ) ) ( not ( = ?auto_194712 ?auto_194717 ) ) ( not ( = ?auto_194712 ?auto_194718 ) ) ( not ( = ?auto_194713 ?auto_194714 ) ) ( not ( = ?auto_194713 ?auto_194715 ) ) ( not ( = ?auto_194713 ?auto_194716 ) ) ( not ( = ?auto_194713 ?auto_194717 ) ) ( not ( = ?auto_194713 ?auto_194718 ) ) ( not ( = ?auto_194714 ?auto_194715 ) ) ( not ( = ?auto_194714 ?auto_194716 ) ) ( not ( = ?auto_194714 ?auto_194717 ) ) ( not ( = ?auto_194714 ?auto_194718 ) ) ( not ( = ?auto_194715 ?auto_194716 ) ) ( not ( = ?auto_194715 ?auto_194717 ) ) ( not ( = ?auto_194715 ?auto_194718 ) ) ( not ( = ?auto_194716 ?auto_194717 ) ) ( not ( = ?auto_194716 ?auto_194718 ) ) ( not ( = ?auto_194717 ?auto_194718 ) ) ( ON ?auto_194716 ?auto_194717 ) ( CLEAR ?auto_194714 ) ( ON ?auto_194715 ?auto_194716 ) ( CLEAR ?auto_194715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194712 ?auto_194713 ?auto_194714 ?auto_194715 )
      ( MAKE-6PILE ?auto_194712 ?auto_194713 ?auto_194714 ?auto_194715 ?auto_194716 ?auto_194717 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_194725 - BLOCK
      ?auto_194726 - BLOCK
      ?auto_194727 - BLOCK
      ?auto_194728 - BLOCK
      ?auto_194729 - BLOCK
      ?auto_194730 - BLOCK
    )
    :vars
    (
      ?auto_194731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194730 ?auto_194731 ) ( ON-TABLE ?auto_194725 ) ( ON ?auto_194726 ?auto_194725 ) ( ON ?auto_194727 ?auto_194726 ) ( not ( = ?auto_194725 ?auto_194726 ) ) ( not ( = ?auto_194725 ?auto_194727 ) ) ( not ( = ?auto_194725 ?auto_194728 ) ) ( not ( = ?auto_194725 ?auto_194729 ) ) ( not ( = ?auto_194725 ?auto_194730 ) ) ( not ( = ?auto_194725 ?auto_194731 ) ) ( not ( = ?auto_194726 ?auto_194727 ) ) ( not ( = ?auto_194726 ?auto_194728 ) ) ( not ( = ?auto_194726 ?auto_194729 ) ) ( not ( = ?auto_194726 ?auto_194730 ) ) ( not ( = ?auto_194726 ?auto_194731 ) ) ( not ( = ?auto_194727 ?auto_194728 ) ) ( not ( = ?auto_194727 ?auto_194729 ) ) ( not ( = ?auto_194727 ?auto_194730 ) ) ( not ( = ?auto_194727 ?auto_194731 ) ) ( not ( = ?auto_194728 ?auto_194729 ) ) ( not ( = ?auto_194728 ?auto_194730 ) ) ( not ( = ?auto_194728 ?auto_194731 ) ) ( not ( = ?auto_194729 ?auto_194730 ) ) ( not ( = ?auto_194729 ?auto_194731 ) ) ( not ( = ?auto_194730 ?auto_194731 ) ) ( ON ?auto_194729 ?auto_194730 ) ( CLEAR ?auto_194727 ) ( ON ?auto_194728 ?auto_194729 ) ( CLEAR ?auto_194728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194725 ?auto_194726 ?auto_194727 ?auto_194728 )
      ( MAKE-6PILE ?auto_194725 ?auto_194726 ?auto_194727 ?auto_194728 ?auto_194729 ?auto_194730 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_194738 - BLOCK
      ?auto_194739 - BLOCK
      ?auto_194740 - BLOCK
      ?auto_194741 - BLOCK
      ?auto_194742 - BLOCK
      ?auto_194743 - BLOCK
    )
    :vars
    (
      ?auto_194744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194743 ?auto_194744 ) ( ON-TABLE ?auto_194738 ) ( ON ?auto_194739 ?auto_194738 ) ( not ( = ?auto_194738 ?auto_194739 ) ) ( not ( = ?auto_194738 ?auto_194740 ) ) ( not ( = ?auto_194738 ?auto_194741 ) ) ( not ( = ?auto_194738 ?auto_194742 ) ) ( not ( = ?auto_194738 ?auto_194743 ) ) ( not ( = ?auto_194738 ?auto_194744 ) ) ( not ( = ?auto_194739 ?auto_194740 ) ) ( not ( = ?auto_194739 ?auto_194741 ) ) ( not ( = ?auto_194739 ?auto_194742 ) ) ( not ( = ?auto_194739 ?auto_194743 ) ) ( not ( = ?auto_194739 ?auto_194744 ) ) ( not ( = ?auto_194740 ?auto_194741 ) ) ( not ( = ?auto_194740 ?auto_194742 ) ) ( not ( = ?auto_194740 ?auto_194743 ) ) ( not ( = ?auto_194740 ?auto_194744 ) ) ( not ( = ?auto_194741 ?auto_194742 ) ) ( not ( = ?auto_194741 ?auto_194743 ) ) ( not ( = ?auto_194741 ?auto_194744 ) ) ( not ( = ?auto_194742 ?auto_194743 ) ) ( not ( = ?auto_194742 ?auto_194744 ) ) ( not ( = ?auto_194743 ?auto_194744 ) ) ( ON ?auto_194742 ?auto_194743 ) ( ON ?auto_194741 ?auto_194742 ) ( CLEAR ?auto_194739 ) ( ON ?auto_194740 ?auto_194741 ) ( CLEAR ?auto_194740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194738 ?auto_194739 ?auto_194740 )
      ( MAKE-6PILE ?auto_194738 ?auto_194739 ?auto_194740 ?auto_194741 ?auto_194742 ?auto_194743 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_194751 - BLOCK
      ?auto_194752 - BLOCK
      ?auto_194753 - BLOCK
      ?auto_194754 - BLOCK
      ?auto_194755 - BLOCK
      ?auto_194756 - BLOCK
    )
    :vars
    (
      ?auto_194757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194756 ?auto_194757 ) ( ON-TABLE ?auto_194751 ) ( ON ?auto_194752 ?auto_194751 ) ( not ( = ?auto_194751 ?auto_194752 ) ) ( not ( = ?auto_194751 ?auto_194753 ) ) ( not ( = ?auto_194751 ?auto_194754 ) ) ( not ( = ?auto_194751 ?auto_194755 ) ) ( not ( = ?auto_194751 ?auto_194756 ) ) ( not ( = ?auto_194751 ?auto_194757 ) ) ( not ( = ?auto_194752 ?auto_194753 ) ) ( not ( = ?auto_194752 ?auto_194754 ) ) ( not ( = ?auto_194752 ?auto_194755 ) ) ( not ( = ?auto_194752 ?auto_194756 ) ) ( not ( = ?auto_194752 ?auto_194757 ) ) ( not ( = ?auto_194753 ?auto_194754 ) ) ( not ( = ?auto_194753 ?auto_194755 ) ) ( not ( = ?auto_194753 ?auto_194756 ) ) ( not ( = ?auto_194753 ?auto_194757 ) ) ( not ( = ?auto_194754 ?auto_194755 ) ) ( not ( = ?auto_194754 ?auto_194756 ) ) ( not ( = ?auto_194754 ?auto_194757 ) ) ( not ( = ?auto_194755 ?auto_194756 ) ) ( not ( = ?auto_194755 ?auto_194757 ) ) ( not ( = ?auto_194756 ?auto_194757 ) ) ( ON ?auto_194755 ?auto_194756 ) ( ON ?auto_194754 ?auto_194755 ) ( CLEAR ?auto_194752 ) ( ON ?auto_194753 ?auto_194754 ) ( CLEAR ?auto_194753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194751 ?auto_194752 ?auto_194753 )
      ( MAKE-6PILE ?auto_194751 ?auto_194752 ?auto_194753 ?auto_194754 ?auto_194755 ?auto_194756 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_194764 - BLOCK
      ?auto_194765 - BLOCK
      ?auto_194766 - BLOCK
      ?auto_194767 - BLOCK
      ?auto_194768 - BLOCK
      ?auto_194769 - BLOCK
    )
    :vars
    (
      ?auto_194770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194769 ?auto_194770 ) ( ON-TABLE ?auto_194764 ) ( not ( = ?auto_194764 ?auto_194765 ) ) ( not ( = ?auto_194764 ?auto_194766 ) ) ( not ( = ?auto_194764 ?auto_194767 ) ) ( not ( = ?auto_194764 ?auto_194768 ) ) ( not ( = ?auto_194764 ?auto_194769 ) ) ( not ( = ?auto_194764 ?auto_194770 ) ) ( not ( = ?auto_194765 ?auto_194766 ) ) ( not ( = ?auto_194765 ?auto_194767 ) ) ( not ( = ?auto_194765 ?auto_194768 ) ) ( not ( = ?auto_194765 ?auto_194769 ) ) ( not ( = ?auto_194765 ?auto_194770 ) ) ( not ( = ?auto_194766 ?auto_194767 ) ) ( not ( = ?auto_194766 ?auto_194768 ) ) ( not ( = ?auto_194766 ?auto_194769 ) ) ( not ( = ?auto_194766 ?auto_194770 ) ) ( not ( = ?auto_194767 ?auto_194768 ) ) ( not ( = ?auto_194767 ?auto_194769 ) ) ( not ( = ?auto_194767 ?auto_194770 ) ) ( not ( = ?auto_194768 ?auto_194769 ) ) ( not ( = ?auto_194768 ?auto_194770 ) ) ( not ( = ?auto_194769 ?auto_194770 ) ) ( ON ?auto_194768 ?auto_194769 ) ( ON ?auto_194767 ?auto_194768 ) ( ON ?auto_194766 ?auto_194767 ) ( CLEAR ?auto_194764 ) ( ON ?auto_194765 ?auto_194766 ) ( CLEAR ?auto_194765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194764 ?auto_194765 )
      ( MAKE-6PILE ?auto_194764 ?auto_194765 ?auto_194766 ?auto_194767 ?auto_194768 ?auto_194769 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_194777 - BLOCK
      ?auto_194778 - BLOCK
      ?auto_194779 - BLOCK
      ?auto_194780 - BLOCK
      ?auto_194781 - BLOCK
      ?auto_194782 - BLOCK
    )
    :vars
    (
      ?auto_194783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194782 ?auto_194783 ) ( ON-TABLE ?auto_194777 ) ( not ( = ?auto_194777 ?auto_194778 ) ) ( not ( = ?auto_194777 ?auto_194779 ) ) ( not ( = ?auto_194777 ?auto_194780 ) ) ( not ( = ?auto_194777 ?auto_194781 ) ) ( not ( = ?auto_194777 ?auto_194782 ) ) ( not ( = ?auto_194777 ?auto_194783 ) ) ( not ( = ?auto_194778 ?auto_194779 ) ) ( not ( = ?auto_194778 ?auto_194780 ) ) ( not ( = ?auto_194778 ?auto_194781 ) ) ( not ( = ?auto_194778 ?auto_194782 ) ) ( not ( = ?auto_194778 ?auto_194783 ) ) ( not ( = ?auto_194779 ?auto_194780 ) ) ( not ( = ?auto_194779 ?auto_194781 ) ) ( not ( = ?auto_194779 ?auto_194782 ) ) ( not ( = ?auto_194779 ?auto_194783 ) ) ( not ( = ?auto_194780 ?auto_194781 ) ) ( not ( = ?auto_194780 ?auto_194782 ) ) ( not ( = ?auto_194780 ?auto_194783 ) ) ( not ( = ?auto_194781 ?auto_194782 ) ) ( not ( = ?auto_194781 ?auto_194783 ) ) ( not ( = ?auto_194782 ?auto_194783 ) ) ( ON ?auto_194781 ?auto_194782 ) ( ON ?auto_194780 ?auto_194781 ) ( ON ?auto_194779 ?auto_194780 ) ( CLEAR ?auto_194777 ) ( ON ?auto_194778 ?auto_194779 ) ( CLEAR ?auto_194778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194777 ?auto_194778 )
      ( MAKE-6PILE ?auto_194777 ?auto_194778 ?auto_194779 ?auto_194780 ?auto_194781 ?auto_194782 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_194790 - BLOCK
      ?auto_194791 - BLOCK
      ?auto_194792 - BLOCK
      ?auto_194793 - BLOCK
      ?auto_194794 - BLOCK
      ?auto_194795 - BLOCK
    )
    :vars
    (
      ?auto_194796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194795 ?auto_194796 ) ( not ( = ?auto_194790 ?auto_194791 ) ) ( not ( = ?auto_194790 ?auto_194792 ) ) ( not ( = ?auto_194790 ?auto_194793 ) ) ( not ( = ?auto_194790 ?auto_194794 ) ) ( not ( = ?auto_194790 ?auto_194795 ) ) ( not ( = ?auto_194790 ?auto_194796 ) ) ( not ( = ?auto_194791 ?auto_194792 ) ) ( not ( = ?auto_194791 ?auto_194793 ) ) ( not ( = ?auto_194791 ?auto_194794 ) ) ( not ( = ?auto_194791 ?auto_194795 ) ) ( not ( = ?auto_194791 ?auto_194796 ) ) ( not ( = ?auto_194792 ?auto_194793 ) ) ( not ( = ?auto_194792 ?auto_194794 ) ) ( not ( = ?auto_194792 ?auto_194795 ) ) ( not ( = ?auto_194792 ?auto_194796 ) ) ( not ( = ?auto_194793 ?auto_194794 ) ) ( not ( = ?auto_194793 ?auto_194795 ) ) ( not ( = ?auto_194793 ?auto_194796 ) ) ( not ( = ?auto_194794 ?auto_194795 ) ) ( not ( = ?auto_194794 ?auto_194796 ) ) ( not ( = ?auto_194795 ?auto_194796 ) ) ( ON ?auto_194794 ?auto_194795 ) ( ON ?auto_194793 ?auto_194794 ) ( ON ?auto_194792 ?auto_194793 ) ( ON ?auto_194791 ?auto_194792 ) ( ON ?auto_194790 ?auto_194791 ) ( CLEAR ?auto_194790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194790 )
      ( MAKE-6PILE ?auto_194790 ?auto_194791 ?auto_194792 ?auto_194793 ?auto_194794 ?auto_194795 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_194803 - BLOCK
      ?auto_194804 - BLOCK
      ?auto_194805 - BLOCK
      ?auto_194806 - BLOCK
      ?auto_194807 - BLOCK
      ?auto_194808 - BLOCK
    )
    :vars
    (
      ?auto_194809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194808 ?auto_194809 ) ( not ( = ?auto_194803 ?auto_194804 ) ) ( not ( = ?auto_194803 ?auto_194805 ) ) ( not ( = ?auto_194803 ?auto_194806 ) ) ( not ( = ?auto_194803 ?auto_194807 ) ) ( not ( = ?auto_194803 ?auto_194808 ) ) ( not ( = ?auto_194803 ?auto_194809 ) ) ( not ( = ?auto_194804 ?auto_194805 ) ) ( not ( = ?auto_194804 ?auto_194806 ) ) ( not ( = ?auto_194804 ?auto_194807 ) ) ( not ( = ?auto_194804 ?auto_194808 ) ) ( not ( = ?auto_194804 ?auto_194809 ) ) ( not ( = ?auto_194805 ?auto_194806 ) ) ( not ( = ?auto_194805 ?auto_194807 ) ) ( not ( = ?auto_194805 ?auto_194808 ) ) ( not ( = ?auto_194805 ?auto_194809 ) ) ( not ( = ?auto_194806 ?auto_194807 ) ) ( not ( = ?auto_194806 ?auto_194808 ) ) ( not ( = ?auto_194806 ?auto_194809 ) ) ( not ( = ?auto_194807 ?auto_194808 ) ) ( not ( = ?auto_194807 ?auto_194809 ) ) ( not ( = ?auto_194808 ?auto_194809 ) ) ( ON ?auto_194807 ?auto_194808 ) ( ON ?auto_194806 ?auto_194807 ) ( ON ?auto_194805 ?auto_194806 ) ( ON ?auto_194804 ?auto_194805 ) ( ON ?auto_194803 ?auto_194804 ) ( CLEAR ?auto_194803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194803 )
      ( MAKE-6PILE ?auto_194803 ?auto_194804 ?auto_194805 ?auto_194806 ?auto_194807 ?auto_194808 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_194817 - BLOCK
      ?auto_194818 - BLOCK
      ?auto_194819 - BLOCK
      ?auto_194820 - BLOCK
      ?auto_194821 - BLOCK
      ?auto_194822 - BLOCK
      ?auto_194823 - BLOCK
    )
    :vars
    (
      ?auto_194824 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_194822 ) ( ON ?auto_194823 ?auto_194824 ) ( CLEAR ?auto_194823 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194817 ) ( ON ?auto_194818 ?auto_194817 ) ( ON ?auto_194819 ?auto_194818 ) ( ON ?auto_194820 ?auto_194819 ) ( ON ?auto_194821 ?auto_194820 ) ( ON ?auto_194822 ?auto_194821 ) ( not ( = ?auto_194817 ?auto_194818 ) ) ( not ( = ?auto_194817 ?auto_194819 ) ) ( not ( = ?auto_194817 ?auto_194820 ) ) ( not ( = ?auto_194817 ?auto_194821 ) ) ( not ( = ?auto_194817 ?auto_194822 ) ) ( not ( = ?auto_194817 ?auto_194823 ) ) ( not ( = ?auto_194817 ?auto_194824 ) ) ( not ( = ?auto_194818 ?auto_194819 ) ) ( not ( = ?auto_194818 ?auto_194820 ) ) ( not ( = ?auto_194818 ?auto_194821 ) ) ( not ( = ?auto_194818 ?auto_194822 ) ) ( not ( = ?auto_194818 ?auto_194823 ) ) ( not ( = ?auto_194818 ?auto_194824 ) ) ( not ( = ?auto_194819 ?auto_194820 ) ) ( not ( = ?auto_194819 ?auto_194821 ) ) ( not ( = ?auto_194819 ?auto_194822 ) ) ( not ( = ?auto_194819 ?auto_194823 ) ) ( not ( = ?auto_194819 ?auto_194824 ) ) ( not ( = ?auto_194820 ?auto_194821 ) ) ( not ( = ?auto_194820 ?auto_194822 ) ) ( not ( = ?auto_194820 ?auto_194823 ) ) ( not ( = ?auto_194820 ?auto_194824 ) ) ( not ( = ?auto_194821 ?auto_194822 ) ) ( not ( = ?auto_194821 ?auto_194823 ) ) ( not ( = ?auto_194821 ?auto_194824 ) ) ( not ( = ?auto_194822 ?auto_194823 ) ) ( not ( = ?auto_194822 ?auto_194824 ) ) ( not ( = ?auto_194823 ?auto_194824 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194823 ?auto_194824 )
      ( !STACK ?auto_194823 ?auto_194822 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_194832 - BLOCK
      ?auto_194833 - BLOCK
      ?auto_194834 - BLOCK
      ?auto_194835 - BLOCK
      ?auto_194836 - BLOCK
      ?auto_194837 - BLOCK
      ?auto_194838 - BLOCK
    )
    :vars
    (
      ?auto_194839 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_194837 ) ( ON ?auto_194838 ?auto_194839 ) ( CLEAR ?auto_194838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194832 ) ( ON ?auto_194833 ?auto_194832 ) ( ON ?auto_194834 ?auto_194833 ) ( ON ?auto_194835 ?auto_194834 ) ( ON ?auto_194836 ?auto_194835 ) ( ON ?auto_194837 ?auto_194836 ) ( not ( = ?auto_194832 ?auto_194833 ) ) ( not ( = ?auto_194832 ?auto_194834 ) ) ( not ( = ?auto_194832 ?auto_194835 ) ) ( not ( = ?auto_194832 ?auto_194836 ) ) ( not ( = ?auto_194832 ?auto_194837 ) ) ( not ( = ?auto_194832 ?auto_194838 ) ) ( not ( = ?auto_194832 ?auto_194839 ) ) ( not ( = ?auto_194833 ?auto_194834 ) ) ( not ( = ?auto_194833 ?auto_194835 ) ) ( not ( = ?auto_194833 ?auto_194836 ) ) ( not ( = ?auto_194833 ?auto_194837 ) ) ( not ( = ?auto_194833 ?auto_194838 ) ) ( not ( = ?auto_194833 ?auto_194839 ) ) ( not ( = ?auto_194834 ?auto_194835 ) ) ( not ( = ?auto_194834 ?auto_194836 ) ) ( not ( = ?auto_194834 ?auto_194837 ) ) ( not ( = ?auto_194834 ?auto_194838 ) ) ( not ( = ?auto_194834 ?auto_194839 ) ) ( not ( = ?auto_194835 ?auto_194836 ) ) ( not ( = ?auto_194835 ?auto_194837 ) ) ( not ( = ?auto_194835 ?auto_194838 ) ) ( not ( = ?auto_194835 ?auto_194839 ) ) ( not ( = ?auto_194836 ?auto_194837 ) ) ( not ( = ?auto_194836 ?auto_194838 ) ) ( not ( = ?auto_194836 ?auto_194839 ) ) ( not ( = ?auto_194837 ?auto_194838 ) ) ( not ( = ?auto_194837 ?auto_194839 ) ) ( not ( = ?auto_194838 ?auto_194839 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194838 ?auto_194839 )
      ( !STACK ?auto_194838 ?auto_194837 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_194847 - BLOCK
      ?auto_194848 - BLOCK
      ?auto_194849 - BLOCK
      ?auto_194850 - BLOCK
      ?auto_194851 - BLOCK
      ?auto_194852 - BLOCK
      ?auto_194853 - BLOCK
    )
    :vars
    (
      ?auto_194854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194853 ?auto_194854 ) ( ON-TABLE ?auto_194847 ) ( ON ?auto_194848 ?auto_194847 ) ( ON ?auto_194849 ?auto_194848 ) ( ON ?auto_194850 ?auto_194849 ) ( ON ?auto_194851 ?auto_194850 ) ( not ( = ?auto_194847 ?auto_194848 ) ) ( not ( = ?auto_194847 ?auto_194849 ) ) ( not ( = ?auto_194847 ?auto_194850 ) ) ( not ( = ?auto_194847 ?auto_194851 ) ) ( not ( = ?auto_194847 ?auto_194852 ) ) ( not ( = ?auto_194847 ?auto_194853 ) ) ( not ( = ?auto_194847 ?auto_194854 ) ) ( not ( = ?auto_194848 ?auto_194849 ) ) ( not ( = ?auto_194848 ?auto_194850 ) ) ( not ( = ?auto_194848 ?auto_194851 ) ) ( not ( = ?auto_194848 ?auto_194852 ) ) ( not ( = ?auto_194848 ?auto_194853 ) ) ( not ( = ?auto_194848 ?auto_194854 ) ) ( not ( = ?auto_194849 ?auto_194850 ) ) ( not ( = ?auto_194849 ?auto_194851 ) ) ( not ( = ?auto_194849 ?auto_194852 ) ) ( not ( = ?auto_194849 ?auto_194853 ) ) ( not ( = ?auto_194849 ?auto_194854 ) ) ( not ( = ?auto_194850 ?auto_194851 ) ) ( not ( = ?auto_194850 ?auto_194852 ) ) ( not ( = ?auto_194850 ?auto_194853 ) ) ( not ( = ?auto_194850 ?auto_194854 ) ) ( not ( = ?auto_194851 ?auto_194852 ) ) ( not ( = ?auto_194851 ?auto_194853 ) ) ( not ( = ?auto_194851 ?auto_194854 ) ) ( not ( = ?auto_194852 ?auto_194853 ) ) ( not ( = ?auto_194852 ?auto_194854 ) ) ( not ( = ?auto_194853 ?auto_194854 ) ) ( CLEAR ?auto_194851 ) ( ON ?auto_194852 ?auto_194853 ) ( CLEAR ?auto_194852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194847 ?auto_194848 ?auto_194849 ?auto_194850 ?auto_194851 ?auto_194852 )
      ( MAKE-7PILE ?auto_194847 ?auto_194848 ?auto_194849 ?auto_194850 ?auto_194851 ?auto_194852 ?auto_194853 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_194862 - BLOCK
      ?auto_194863 - BLOCK
      ?auto_194864 - BLOCK
      ?auto_194865 - BLOCK
      ?auto_194866 - BLOCK
      ?auto_194867 - BLOCK
      ?auto_194868 - BLOCK
    )
    :vars
    (
      ?auto_194869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194868 ?auto_194869 ) ( ON-TABLE ?auto_194862 ) ( ON ?auto_194863 ?auto_194862 ) ( ON ?auto_194864 ?auto_194863 ) ( ON ?auto_194865 ?auto_194864 ) ( ON ?auto_194866 ?auto_194865 ) ( not ( = ?auto_194862 ?auto_194863 ) ) ( not ( = ?auto_194862 ?auto_194864 ) ) ( not ( = ?auto_194862 ?auto_194865 ) ) ( not ( = ?auto_194862 ?auto_194866 ) ) ( not ( = ?auto_194862 ?auto_194867 ) ) ( not ( = ?auto_194862 ?auto_194868 ) ) ( not ( = ?auto_194862 ?auto_194869 ) ) ( not ( = ?auto_194863 ?auto_194864 ) ) ( not ( = ?auto_194863 ?auto_194865 ) ) ( not ( = ?auto_194863 ?auto_194866 ) ) ( not ( = ?auto_194863 ?auto_194867 ) ) ( not ( = ?auto_194863 ?auto_194868 ) ) ( not ( = ?auto_194863 ?auto_194869 ) ) ( not ( = ?auto_194864 ?auto_194865 ) ) ( not ( = ?auto_194864 ?auto_194866 ) ) ( not ( = ?auto_194864 ?auto_194867 ) ) ( not ( = ?auto_194864 ?auto_194868 ) ) ( not ( = ?auto_194864 ?auto_194869 ) ) ( not ( = ?auto_194865 ?auto_194866 ) ) ( not ( = ?auto_194865 ?auto_194867 ) ) ( not ( = ?auto_194865 ?auto_194868 ) ) ( not ( = ?auto_194865 ?auto_194869 ) ) ( not ( = ?auto_194866 ?auto_194867 ) ) ( not ( = ?auto_194866 ?auto_194868 ) ) ( not ( = ?auto_194866 ?auto_194869 ) ) ( not ( = ?auto_194867 ?auto_194868 ) ) ( not ( = ?auto_194867 ?auto_194869 ) ) ( not ( = ?auto_194868 ?auto_194869 ) ) ( CLEAR ?auto_194866 ) ( ON ?auto_194867 ?auto_194868 ) ( CLEAR ?auto_194867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194862 ?auto_194863 ?auto_194864 ?auto_194865 ?auto_194866 ?auto_194867 )
      ( MAKE-7PILE ?auto_194862 ?auto_194863 ?auto_194864 ?auto_194865 ?auto_194866 ?auto_194867 ?auto_194868 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_194877 - BLOCK
      ?auto_194878 - BLOCK
      ?auto_194879 - BLOCK
      ?auto_194880 - BLOCK
      ?auto_194881 - BLOCK
      ?auto_194882 - BLOCK
      ?auto_194883 - BLOCK
    )
    :vars
    (
      ?auto_194884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194883 ?auto_194884 ) ( ON-TABLE ?auto_194877 ) ( ON ?auto_194878 ?auto_194877 ) ( ON ?auto_194879 ?auto_194878 ) ( ON ?auto_194880 ?auto_194879 ) ( not ( = ?auto_194877 ?auto_194878 ) ) ( not ( = ?auto_194877 ?auto_194879 ) ) ( not ( = ?auto_194877 ?auto_194880 ) ) ( not ( = ?auto_194877 ?auto_194881 ) ) ( not ( = ?auto_194877 ?auto_194882 ) ) ( not ( = ?auto_194877 ?auto_194883 ) ) ( not ( = ?auto_194877 ?auto_194884 ) ) ( not ( = ?auto_194878 ?auto_194879 ) ) ( not ( = ?auto_194878 ?auto_194880 ) ) ( not ( = ?auto_194878 ?auto_194881 ) ) ( not ( = ?auto_194878 ?auto_194882 ) ) ( not ( = ?auto_194878 ?auto_194883 ) ) ( not ( = ?auto_194878 ?auto_194884 ) ) ( not ( = ?auto_194879 ?auto_194880 ) ) ( not ( = ?auto_194879 ?auto_194881 ) ) ( not ( = ?auto_194879 ?auto_194882 ) ) ( not ( = ?auto_194879 ?auto_194883 ) ) ( not ( = ?auto_194879 ?auto_194884 ) ) ( not ( = ?auto_194880 ?auto_194881 ) ) ( not ( = ?auto_194880 ?auto_194882 ) ) ( not ( = ?auto_194880 ?auto_194883 ) ) ( not ( = ?auto_194880 ?auto_194884 ) ) ( not ( = ?auto_194881 ?auto_194882 ) ) ( not ( = ?auto_194881 ?auto_194883 ) ) ( not ( = ?auto_194881 ?auto_194884 ) ) ( not ( = ?auto_194882 ?auto_194883 ) ) ( not ( = ?auto_194882 ?auto_194884 ) ) ( not ( = ?auto_194883 ?auto_194884 ) ) ( ON ?auto_194882 ?auto_194883 ) ( CLEAR ?auto_194880 ) ( ON ?auto_194881 ?auto_194882 ) ( CLEAR ?auto_194881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194877 ?auto_194878 ?auto_194879 ?auto_194880 ?auto_194881 )
      ( MAKE-7PILE ?auto_194877 ?auto_194878 ?auto_194879 ?auto_194880 ?auto_194881 ?auto_194882 ?auto_194883 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_194892 - BLOCK
      ?auto_194893 - BLOCK
      ?auto_194894 - BLOCK
      ?auto_194895 - BLOCK
      ?auto_194896 - BLOCK
      ?auto_194897 - BLOCK
      ?auto_194898 - BLOCK
    )
    :vars
    (
      ?auto_194899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194898 ?auto_194899 ) ( ON-TABLE ?auto_194892 ) ( ON ?auto_194893 ?auto_194892 ) ( ON ?auto_194894 ?auto_194893 ) ( ON ?auto_194895 ?auto_194894 ) ( not ( = ?auto_194892 ?auto_194893 ) ) ( not ( = ?auto_194892 ?auto_194894 ) ) ( not ( = ?auto_194892 ?auto_194895 ) ) ( not ( = ?auto_194892 ?auto_194896 ) ) ( not ( = ?auto_194892 ?auto_194897 ) ) ( not ( = ?auto_194892 ?auto_194898 ) ) ( not ( = ?auto_194892 ?auto_194899 ) ) ( not ( = ?auto_194893 ?auto_194894 ) ) ( not ( = ?auto_194893 ?auto_194895 ) ) ( not ( = ?auto_194893 ?auto_194896 ) ) ( not ( = ?auto_194893 ?auto_194897 ) ) ( not ( = ?auto_194893 ?auto_194898 ) ) ( not ( = ?auto_194893 ?auto_194899 ) ) ( not ( = ?auto_194894 ?auto_194895 ) ) ( not ( = ?auto_194894 ?auto_194896 ) ) ( not ( = ?auto_194894 ?auto_194897 ) ) ( not ( = ?auto_194894 ?auto_194898 ) ) ( not ( = ?auto_194894 ?auto_194899 ) ) ( not ( = ?auto_194895 ?auto_194896 ) ) ( not ( = ?auto_194895 ?auto_194897 ) ) ( not ( = ?auto_194895 ?auto_194898 ) ) ( not ( = ?auto_194895 ?auto_194899 ) ) ( not ( = ?auto_194896 ?auto_194897 ) ) ( not ( = ?auto_194896 ?auto_194898 ) ) ( not ( = ?auto_194896 ?auto_194899 ) ) ( not ( = ?auto_194897 ?auto_194898 ) ) ( not ( = ?auto_194897 ?auto_194899 ) ) ( not ( = ?auto_194898 ?auto_194899 ) ) ( ON ?auto_194897 ?auto_194898 ) ( CLEAR ?auto_194895 ) ( ON ?auto_194896 ?auto_194897 ) ( CLEAR ?auto_194896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194892 ?auto_194893 ?auto_194894 ?auto_194895 ?auto_194896 )
      ( MAKE-7PILE ?auto_194892 ?auto_194893 ?auto_194894 ?auto_194895 ?auto_194896 ?auto_194897 ?auto_194898 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_194907 - BLOCK
      ?auto_194908 - BLOCK
      ?auto_194909 - BLOCK
      ?auto_194910 - BLOCK
      ?auto_194911 - BLOCK
      ?auto_194912 - BLOCK
      ?auto_194913 - BLOCK
    )
    :vars
    (
      ?auto_194914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194913 ?auto_194914 ) ( ON-TABLE ?auto_194907 ) ( ON ?auto_194908 ?auto_194907 ) ( ON ?auto_194909 ?auto_194908 ) ( not ( = ?auto_194907 ?auto_194908 ) ) ( not ( = ?auto_194907 ?auto_194909 ) ) ( not ( = ?auto_194907 ?auto_194910 ) ) ( not ( = ?auto_194907 ?auto_194911 ) ) ( not ( = ?auto_194907 ?auto_194912 ) ) ( not ( = ?auto_194907 ?auto_194913 ) ) ( not ( = ?auto_194907 ?auto_194914 ) ) ( not ( = ?auto_194908 ?auto_194909 ) ) ( not ( = ?auto_194908 ?auto_194910 ) ) ( not ( = ?auto_194908 ?auto_194911 ) ) ( not ( = ?auto_194908 ?auto_194912 ) ) ( not ( = ?auto_194908 ?auto_194913 ) ) ( not ( = ?auto_194908 ?auto_194914 ) ) ( not ( = ?auto_194909 ?auto_194910 ) ) ( not ( = ?auto_194909 ?auto_194911 ) ) ( not ( = ?auto_194909 ?auto_194912 ) ) ( not ( = ?auto_194909 ?auto_194913 ) ) ( not ( = ?auto_194909 ?auto_194914 ) ) ( not ( = ?auto_194910 ?auto_194911 ) ) ( not ( = ?auto_194910 ?auto_194912 ) ) ( not ( = ?auto_194910 ?auto_194913 ) ) ( not ( = ?auto_194910 ?auto_194914 ) ) ( not ( = ?auto_194911 ?auto_194912 ) ) ( not ( = ?auto_194911 ?auto_194913 ) ) ( not ( = ?auto_194911 ?auto_194914 ) ) ( not ( = ?auto_194912 ?auto_194913 ) ) ( not ( = ?auto_194912 ?auto_194914 ) ) ( not ( = ?auto_194913 ?auto_194914 ) ) ( ON ?auto_194912 ?auto_194913 ) ( ON ?auto_194911 ?auto_194912 ) ( CLEAR ?auto_194909 ) ( ON ?auto_194910 ?auto_194911 ) ( CLEAR ?auto_194910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194907 ?auto_194908 ?auto_194909 ?auto_194910 )
      ( MAKE-7PILE ?auto_194907 ?auto_194908 ?auto_194909 ?auto_194910 ?auto_194911 ?auto_194912 ?auto_194913 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_194922 - BLOCK
      ?auto_194923 - BLOCK
      ?auto_194924 - BLOCK
      ?auto_194925 - BLOCK
      ?auto_194926 - BLOCK
      ?auto_194927 - BLOCK
      ?auto_194928 - BLOCK
    )
    :vars
    (
      ?auto_194929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194928 ?auto_194929 ) ( ON-TABLE ?auto_194922 ) ( ON ?auto_194923 ?auto_194922 ) ( ON ?auto_194924 ?auto_194923 ) ( not ( = ?auto_194922 ?auto_194923 ) ) ( not ( = ?auto_194922 ?auto_194924 ) ) ( not ( = ?auto_194922 ?auto_194925 ) ) ( not ( = ?auto_194922 ?auto_194926 ) ) ( not ( = ?auto_194922 ?auto_194927 ) ) ( not ( = ?auto_194922 ?auto_194928 ) ) ( not ( = ?auto_194922 ?auto_194929 ) ) ( not ( = ?auto_194923 ?auto_194924 ) ) ( not ( = ?auto_194923 ?auto_194925 ) ) ( not ( = ?auto_194923 ?auto_194926 ) ) ( not ( = ?auto_194923 ?auto_194927 ) ) ( not ( = ?auto_194923 ?auto_194928 ) ) ( not ( = ?auto_194923 ?auto_194929 ) ) ( not ( = ?auto_194924 ?auto_194925 ) ) ( not ( = ?auto_194924 ?auto_194926 ) ) ( not ( = ?auto_194924 ?auto_194927 ) ) ( not ( = ?auto_194924 ?auto_194928 ) ) ( not ( = ?auto_194924 ?auto_194929 ) ) ( not ( = ?auto_194925 ?auto_194926 ) ) ( not ( = ?auto_194925 ?auto_194927 ) ) ( not ( = ?auto_194925 ?auto_194928 ) ) ( not ( = ?auto_194925 ?auto_194929 ) ) ( not ( = ?auto_194926 ?auto_194927 ) ) ( not ( = ?auto_194926 ?auto_194928 ) ) ( not ( = ?auto_194926 ?auto_194929 ) ) ( not ( = ?auto_194927 ?auto_194928 ) ) ( not ( = ?auto_194927 ?auto_194929 ) ) ( not ( = ?auto_194928 ?auto_194929 ) ) ( ON ?auto_194927 ?auto_194928 ) ( ON ?auto_194926 ?auto_194927 ) ( CLEAR ?auto_194924 ) ( ON ?auto_194925 ?auto_194926 ) ( CLEAR ?auto_194925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194922 ?auto_194923 ?auto_194924 ?auto_194925 )
      ( MAKE-7PILE ?auto_194922 ?auto_194923 ?auto_194924 ?auto_194925 ?auto_194926 ?auto_194927 ?auto_194928 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_194937 - BLOCK
      ?auto_194938 - BLOCK
      ?auto_194939 - BLOCK
      ?auto_194940 - BLOCK
      ?auto_194941 - BLOCK
      ?auto_194942 - BLOCK
      ?auto_194943 - BLOCK
    )
    :vars
    (
      ?auto_194944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194943 ?auto_194944 ) ( ON-TABLE ?auto_194937 ) ( ON ?auto_194938 ?auto_194937 ) ( not ( = ?auto_194937 ?auto_194938 ) ) ( not ( = ?auto_194937 ?auto_194939 ) ) ( not ( = ?auto_194937 ?auto_194940 ) ) ( not ( = ?auto_194937 ?auto_194941 ) ) ( not ( = ?auto_194937 ?auto_194942 ) ) ( not ( = ?auto_194937 ?auto_194943 ) ) ( not ( = ?auto_194937 ?auto_194944 ) ) ( not ( = ?auto_194938 ?auto_194939 ) ) ( not ( = ?auto_194938 ?auto_194940 ) ) ( not ( = ?auto_194938 ?auto_194941 ) ) ( not ( = ?auto_194938 ?auto_194942 ) ) ( not ( = ?auto_194938 ?auto_194943 ) ) ( not ( = ?auto_194938 ?auto_194944 ) ) ( not ( = ?auto_194939 ?auto_194940 ) ) ( not ( = ?auto_194939 ?auto_194941 ) ) ( not ( = ?auto_194939 ?auto_194942 ) ) ( not ( = ?auto_194939 ?auto_194943 ) ) ( not ( = ?auto_194939 ?auto_194944 ) ) ( not ( = ?auto_194940 ?auto_194941 ) ) ( not ( = ?auto_194940 ?auto_194942 ) ) ( not ( = ?auto_194940 ?auto_194943 ) ) ( not ( = ?auto_194940 ?auto_194944 ) ) ( not ( = ?auto_194941 ?auto_194942 ) ) ( not ( = ?auto_194941 ?auto_194943 ) ) ( not ( = ?auto_194941 ?auto_194944 ) ) ( not ( = ?auto_194942 ?auto_194943 ) ) ( not ( = ?auto_194942 ?auto_194944 ) ) ( not ( = ?auto_194943 ?auto_194944 ) ) ( ON ?auto_194942 ?auto_194943 ) ( ON ?auto_194941 ?auto_194942 ) ( ON ?auto_194940 ?auto_194941 ) ( CLEAR ?auto_194938 ) ( ON ?auto_194939 ?auto_194940 ) ( CLEAR ?auto_194939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194937 ?auto_194938 ?auto_194939 )
      ( MAKE-7PILE ?auto_194937 ?auto_194938 ?auto_194939 ?auto_194940 ?auto_194941 ?auto_194942 ?auto_194943 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_194952 - BLOCK
      ?auto_194953 - BLOCK
      ?auto_194954 - BLOCK
      ?auto_194955 - BLOCK
      ?auto_194956 - BLOCK
      ?auto_194957 - BLOCK
      ?auto_194958 - BLOCK
    )
    :vars
    (
      ?auto_194959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194958 ?auto_194959 ) ( ON-TABLE ?auto_194952 ) ( ON ?auto_194953 ?auto_194952 ) ( not ( = ?auto_194952 ?auto_194953 ) ) ( not ( = ?auto_194952 ?auto_194954 ) ) ( not ( = ?auto_194952 ?auto_194955 ) ) ( not ( = ?auto_194952 ?auto_194956 ) ) ( not ( = ?auto_194952 ?auto_194957 ) ) ( not ( = ?auto_194952 ?auto_194958 ) ) ( not ( = ?auto_194952 ?auto_194959 ) ) ( not ( = ?auto_194953 ?auto_194954 ) ) ( not ( = ?auto_194953 ?auto_194955 ) ) ( not ( = ?auto_194953 ?auto_194956 ) ) ( not ( = ?auto_194953 ?auto_194957 ) ) ( not ( = ?auto_194953 ?auto_194958 ) ) ( not ( = ?auto_194953 ?auto_194959 ) ) ( not ( = ?auto_194954 ?auto_194955 ) ) ( not ( = ?auto_194954 ?auto_194956 ) ) ( not ( = ?auto_194954 ?auto_194957 ) ) ( not ( = ?auto_194954 ?auto_194958 ) ) ( not ( = ?auto_194954 ?auto_194959 ) ) ( not ( = ?auto_194955 ?auto_194956 ) ) ( not ( = ?auto_194955 ?auto_194957 ) ) ( not ( = ?auto_194955 ?auto_194958 ) ) ( not ( = ?auto_194955 ?auto_194959 ) ) ( not ( = ?auto_194956 ?auto_194957 ) ) ( not ( = ?auto_194956 ?auto_194958 ) ) ( not ( = ?auto_194956 ?auto_194959 ) ) ( not ( = ?auto_194957 ?auto_194958 ) ) ( not ( = ?auto_194957 ?auto_194959 ) ) ( not ( = ?auto_194958 ?auto_194959 ) ) ( ON ?auto_194957 ?auto_194958 ) ( ON ?auto_194956 ?auto_194957 ) ( ON ?auto_194955 ?auto_194956 ) ( CLEAR ?auto_194953 ) ( ON ?auto_194954 ?auto_194955 ) ( CLEAR ?auto_194954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194952 ?auto_194953 ?auto_194954 )
      ( MAKE-7PILE ?auto_194952 ?auto_194953 ?auto_194954 ?auto_194955 ?auto_194956 ?auto_194957 ?auto_194958 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_194967 - BLOCK
      ?auto_194968 - BLOCK
      ?auto_194969 - BLOCK
      ?auto_194970 - BLOCK
      ?auto_194971 - BLOCK
      ?auto_194972 - BLOCK
      ?auto_194973 - BLOCK
    )
    :vars
    (
      ?auto_194974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194973 ?auto_194974 ) ( ON-TABLE ?auto_194967 ) ( not ( = ?auto_194967 ?auto_194968 ) ) ( not ( = ?auto_194967 ?auto_194969 ) ) ( not ( = ?auto_194967 ?auto_194970 ) ) ( not ( = ?auto_194967 ?auto_194971 ) ) ( not ( = ?auto_194967 ?auto_194972 ) ) ( not ( = ?auto_194967 ?auto_194973 ) ) ( not ( = ?auto_194967 ?auto_194974 ) ) ( not ( = ?auto_194968 ?auto_194969 ) ) ( not ( = ?auto_194968 ?auto_194970 ) ) ( not ( = ?auto_194968 ?auto_194971 ) ) ( not ( = ?auto_194968 ?auto_194972 ) ) ( not ( = ?auto_194968 ?auto_194973 ) ) ( not ( = ?auto_194968 ?auto_194974 ) ) ( not ( = ?auto_194969 ?auto_194970 ) ) ( not ( = ?auto_194969 ?auto_194971 ) ) ( not ( = ?auto_194969 ?auto_194972 ) ) ( not ( = ?auto_194969 ?auto_194973 ) ) ( not ( = ?auto_194969 ?auto_194974 ) ) ( not ( = ?auto_194970 ?auto_194971 ) ) ( not ( = ?auto_194970 ?auto_194972 ) ) ( not ( = ?auto_194970 ?auto_194973 ) ) ( not ( = ?auto_194970 ?auto_194974 ) ) ( not ( = ?auto_194971 ?auto_194972 ) ) ( not ( = ?auto_194971 ?auto_194973 ) ) ( not ( = ?auto_194971 ?auto_194974 ) ) ( not ( = ?auto_194972 ?auto_194973 ) ) ( not ( = ?auto_194972 ?auto_194974 ) ) ( not ( = ?auto_194973 ?auto_194974 ) ) ( ON ?auto_194972 ?auto_194973 ) ( ON ?auto_194971 ?auto_194972 ) ( ON ?auto_194970 ?auto_194971 ) ( ON ?auto_194969 ?auto_194970 ) ( CLEAR ?auto_194967 ) ( ON ?auto_194968 ?auto_194969 ) ( CLEAR ?auto_194968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194967 ?auto_194968 )
      ( MAKE-7PILE ?auto_194967 ?auto_194968 ?auto_194969 ?auto_194970 ?auto_194971 ?auto_194972 ?auto_194973 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_194982 - BLOCK
      ?auto_194983 - BLOCK
      ?auto_194984 - BLOCK
      ?auto_194985 - BLOCK
      ?auto_194986 - BLOCK
      ?auto_194987 - BLOCK
      ?auto_194988 - BLOCK
    )
    :vars
    (
      ?auto_194989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194988 ?auto_194989 ) ( ON-TABLE ?auto_194982 ) ( not ( = ?auto_194982 ?auto_194983 ) ) ( not ( = ?auto_194982 ?auto_194984 ) ) ( not ( = ?auto_194982 ?auto_194985 ) ) ( not ( = ?auto_194982 ?auto_194986 ) ) ( not ( = ?auto_194982 ?auto_194987 ) ) ( not ( = ?auto_194982 ?auto_194988 ) ) ( not ( = ?auto_194982 ?auto_194989 ) ) ( not ( = ?auto_194983 ?auto_194984 ) ) ( not ( = ?auto_194983 ?auto_194985 ) ) ( not ( = ?auto_194983 ?auto_194986 ) ) ( not ( = ?auto_194983 ?auto_194987 ) ) ( not ( = ?auto_194983 ?auto_194988 ) ) ( not ( = ?auto_194983 ?auto_194989 ) ) ( not ( = ?auto_194984 ?auto_194985 ) ) ( not ( = ?auto_194984 ?auto_194986 ) ) ( not ( = ?auto_194984 ?auto_194987 ) ) ( not ( = ?auto_194984 ?auto_194988 ) ) ( not ( = ?auto_194984 ?auto_194989 ) ) ( not ( = ?auto_194985 ?auto_194986 ) ) ( not ( = ?auto_194985 ?auto_194987 ) ) ( not ( = ?auto_194985 ?auto_194988 ) ) ( not ( = ?auto_194985 ?auto_194989 ) ) ( not ( = ?auto_194986 ?auto_194987 ) ) ( not ( = ?auto_194986 ?auto_194988 ) ) ( not ( = ?auto_194986 ?auto_194989 ) ) ( not ( = ?auto_194987 ?auto_194988 ) ) ( not ( = ?auto_194987 ?auto_194989 ) ) ( not ( = ?auto_194988 ?auto_194989 ) ) ( ON ?auto_194987 ?auto_194988 ) ( ON ?auto_194986 ?auto_194987 ) ( ON ?auto_194985 ?auto_194986 ) ( ON ?auto_194984 ?auto_194985 ) ( CLEAR ?auto_194982 ) ( ON ?auto_194983 ?auto_194984 ) ( CLEAR ?auto_194983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194982 ?auto_194983 )
      ( MAKE-7PILE ?auto_194982 ?auto_194983 ?auto_194984 ?auto_194985 ?auto_194986 ?auto_194987 ?auto_194988 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_194997 - BLOCK
      ?auto_194998 - BLOCK
      ?auto_194999 - BLOCK
      ?auto_195000 - BLOCK
      ?auto_195001 - BLOCK
      ?auto_195002 - BLOCK
      ?auto_195003 - BLOCK
    )
    :vars
    (
      ?auto_195004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195003 ?auto_195004 ) ( not ( = ?auto_194997 ?auto_194998 ) ) ( not ( = ?auto_194997 ?auto_194999 ) ) ( not ( = ?auto_194997 ?auto_195000 ) ) ( not ( = ?auto_194997 ?auto_195001 ) ) ( not ( = ?auto_194997 ?auto_195002 ) ) ( not ( = ?auto_194997 ?auto_195003 ) ) ( not ( = ?auto_194997 ?auto_195004 ) ) ( not ( = ?auto_194998 ?auto_194999 ) ) ( not ( = ?auto_194998 ?auto_195000 ) ) ( not ( = ?auto_194998 ?auto_195001 ) ) ( not ( = ?auto_194998 ?auto_195002 ) ) ( not ( = ?auto_194998 ?auto_195003 ) ) ( not ( = ?auto_194998 ?auto_195004 ) ) ( not ( = ?auto_194999 ?auto_195000 ) ) ( not ( = ?auto_194999 ?auto_195001 ) ) ( not ( = ?auto_194999 ?auto_195002 ) ) ( not ( = ?auto_194999 ?auto_195003 ) ) ( not ( = ?auto_194999 ?auto_195004 ) ) ( not ( = ?auto_195000 ?auto_195001 ) ) ( not ( = ?auto_195000 ?auto_195002 ) ) ( not ( = ?auto_195000 ?auto_195003 ) ) ( not ( = ?auto_195000 ?auto_195004 ) ) ( not ( = ?auto_195001 ?auto_195002 ) ) ( not ( = ?auto_195001 ?auto_195003 ) ) ( not ( = ?auto_195001 ?auto_195004 ) ) ( not ( = ?auto_195002 ?auto_195003 ) ) ( not ( = ?auto_195002 ?auto_195004 ) ) ( not ( = ?auto_195003 ?auto_195004 ) ) ( ON ?auto_195002 ?auto_195003 ) ( ON ?auto_195001 ?auto_195002 ) ( ON ?auto_195000 ?auto_195001 ) ( ON ?auto_194999 ?auto_195000 ) ( ON ?auto_194998 ?auto_194999 ) ( ON ?auto_194997 ?auto_194998 ) ( CLEAR ?auto_194997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194997 )
      ( MAKE-7PILE ?auto_194997 ?auto_194998 ?auto_194999 ?auto_195000 ?auto_195001 ?auto_195002 ?auto_195003 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195012 - BLOCK
      ?auto_195013 - BLOCK
      ?auto_195014 - BLOCK
      ?auto_195015 - BLOCK
      ?auto_195016 - BLOCK
      ?auto_195017 - BLOCK
      ?auto_195018 - BLOCK
    )
    :vars
    (
      ?auto_195019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195018 ?auto_195019 ) ( not ( = ?auto_195012 ?auto_195013 ) ) ( not ( = ?auto_195012 ?auto_195014 ) ) ( not ( = ?auto_195012 ?auto_195015 ) ) ( not ( = ?auto_195012 ?auto_195016 ) ) ( not ( = ?auto_195012 ?auto_195017 ) ) ( not ( = ?auto_195012 ?auto_195018 ) ) ( not ( = ?auto_195012 ?auto_195019 ) ) ( not ( = ?auto_195013 ?auto_195014 ) ) ( not ( = ?auto_195013 ?auto_195015 ) ) ( not ( = ?auto_195013 ?auto_195016 ) ) ( not ( = ?auto_195013 ?auto_195017 ) ) ( not ( = ?auto_195013 ?auto_195018 ) ) ( not ( = ?auto_195013 ?auto_195019 ) ) ( not ( = ?auto_195014 ?auto_195015 ) ) ( not ( = ?auto_195014 ?auto_195016 ) ) ( not ( = ?auto_195014 ?auto_195017 ) ) ( not ( = ?auto_195014 ?auto_195018 ) ) ( not ( = ?auto_195014 ?auto_195019 ) ) ( not ( = ?auto_195015 ?auto_195016 ) ) ( not ( = ?auto_195015 ?auto_195017 ) ) ( not ( = ?auto_195015 ?auto_195018 ) ) ( not ( = ?auto_195015 ?auto_195019 ) ) ( not ( = ?auto_195016 ?auto_195017 ) ) ( not ( = ?auto_195016 ?auto_195018 ) ) ( not ( = ?auto_195016 ?auto_195019 ) ) ( not ( = ?auto_195017 ?auto_195018 ) ) ( not ( = ?auto_195017 ?auto_195019 ) ) ( not ( = ?auto_195018 ?auto_195019 ) ) ( ON ?auto_195017 ?auto_195018 ) ( ON ?auto_195016 ?auto_195017 ) ( ON ?auto_195015 ?auto_195016 ) ( ON ?auto_195014 ?auto_195015 ) ( ON ?auto_195013 ?auto_195014 ) ( ON ?auto_195012 ?auto_195013 ) ( CLEAR ?auto_195012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_195012 )
      ( MAKE-7PILE ?auto_195012 ?auto_195013 ?auto_195014 ?auto_195015 ?auto_195016 ?auto_195017 ?auto_195018 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195028 - BLOCK
      ?auto_195029 - BLOCK
      ?auto_195030 - BLOCK
      ?auto_195031 - BLOCK
      ?auto_195032 - BLOCK
      ?auto_195033 - BLOCK
      ?auto_195034 - BLOCK
      ?auto_195035 - BLOCK
    )
    :vars
    (
      ?auto_195036 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_195034 ) ( ON ?auto_195035 ?auto_195036 ) ( CLEAR ?auto_195035 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_195028 ) ( ON ?auto_195029 ?auto_195028 ) ( ON ?auto_195030 ?auto_195029 ) ( ON ?auto_195031 ?auto_195030 ) ( ON ?auto_195032 ?auto_195031 ) ( ON ?auto_195033 ?auto_195032 ) ( ON ?auto_195034 ?auto_195033 ) ( not ( = ?auto_195028 ?auto_195029 ) ) ( not ( = ?auto_195028 ?auto_195030 ) ) ( not ( = ?auto_195028 ?auto_195031 ) ) ( not ( = ?auto_195028 ?auto_195032 ) ) ( not ( = ?auto_195028 ?auto_195033 ) ) ( not ( = ?auto_195028 ?auto_195034 ) ) ( not ( = ?auto_195028 ?auto_195035 ) ) ( not ( = ?auto_195028 ?auto_195036 ) ) ( not ( = ?auto_195029 ?auto_195030 ) ) ( not ( = ?auto_195029 ?auto_195031 ) ) ( not ( = ?auto_195029 ?auto_195032 ) ) ( not ( = ?auto_195029 ?auto_195033 ) ) ( not ( = ?auto_195029 ?auto_195034 ) ) ( not ( = ?auto_195029 ?auto_195035 ) ) ( not ( = ?auto_195029 ?auto_195036 ) ) ( not ( = ?auto_195030 ?auto_195031 ) ) ( not ( = ?auto_195030 ?auto_195032 ) ) ( not ( = ?auto_195030 ?auto_195033 ) ) ( not ( = ?auto_195030 ?auto_195034 ) ) ( not ( = ?auto_195030 ?auto_195035 ) ) ( not ( = ?auto_195030 ?auto_195036 ) ) ( not ( = ?auto_195031 ?auto_195032 ) ) ( not ( = ?auto_195031 ?auto_195033 ) ) ( not ( = ?auto_195031 ?auto_195034 ) ) ( not ( = ?auto_195031 ?auto_195035 ) ) ( not ( = ?auto_195031 ?auto_195036 ) ) ( not ( = ?auto_195032 ?auto_195033 ) ) ( not ( = ?auto_195032 ?auto_195034 ) ) ( not ( = ?auto_195032 ?auto_195035 ) ) ( not ( = ?auto_195032 ?auto_195036 ) ) ( not ( = ?auto_195033 ?auto_195034 ) ) ( not ( = ?auto_195033 ?auto_195035 ) ) ( not ( = ?auto_195033 ?auto_195036 ) ) ( not ( = ?auto_195034 ?auto_195035 ) ) ( not ( = ?auto_195034 ?auto_195036 ) ) ( not ( = ?auto_195035 ?auto_195036 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_195035 ?auto_195036 )
      ( !STACK ?auto_195035 ?auto_195034 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195045 - BLOCK
      ?auto_195046 - BLOCK
      ?auto_195047 - BLOCK
      ?auto_195048 - BLOCK
      ?auto_195049 - BLOCK
      ?auto_195050 - BLOCK
      ?auto_195051 - BLOCK
      ?auto_195052 - BLOCK
    )
    :vars
    (
      ?auto_195053 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_195051 ) ( ON ?auto_195052 ?auto_195053 ) ( CLEAR ?auto_195052 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_195045 ) ( ON ?auto_195046 ?auto_195045 ) ( ON ?auto_195047 ?auto_195046 ) ( ON ?auto_195048 ?auto_195047 ) ( ON ?auto_195049 ?auto_195048 ) ( ON ?auto_195050 ?auto_195049 ) ( ON ?auto_195051 ?auto_195050 ) ( not ( = ?auto_195045 ?auto_195046 ) ) ( not ( = ?auto_195045 ?auto_195047 ) ) ( not ( = ?auto_195045 ?auto_195048 ) ) ( not ( = ?auto_195045 ?auto_195049 ) ) ( not ( = ?auto_195045 ?auto_195050 ) ) ( not ( = ?auto_195045 ?auto_195051 ) ) ( not ( = ?auto_195045 ?auto_195052 ) ) ( not ( = ?auto_195045 ?auto_195053 ) ) ( not ( = ?auto_195046 ?auto_195047 ) ) ( not ( = ?auto_195046 ?auto_195048 ) ) ( not ( = ?auto_195046 ?auto_195049 ) ) ( not ( = ?auto_195046 ?auto_195050 ) ) ( not ( = ?auto_195046 ?auto_195051 ) ) ( not ( = ?auto_195046 ?auto_195052 ) ) ( not ( = ?auto_195046 ?auto_195053 ) ) ( not ( = ?auto_195047 ?auto_195048 ) ) ( not ( = ?auto_195047 ?auto_195049 ) ) ( not ( = ?auto_195047 ?auto_195050 ) ) ( not ( = ?auto_195047 ?auto_195051 ) ) ( not ( = ?auto_195047 ?auto_195052 ) ) ( not ( = ?auto_195047 ?auto_195053 ) ) ( not ( = ?auto_195048 ?auto_195049 ) ) ( not ( = ?auto_195048 ?auto_195050 ) ) ( not ( = ?auto_195048 ?auto_195051 ) ) ( not ( = ?auto_195048 ?auto_195052 ) ) ( not ( = ?auto_195048 ?auto_195053 ) ) ( not ( = ?auto_195049 ?auto_195050 ) ) ( not ( = ?auto_195049 ?auto_195051 ) ) ( not ( = ?auto_195049 ?auto_195052 ) ) ( not ( = ?auto_195049 ?auto_195053 ) ) ( not ( = ?auto_195050 ?auto_195051 ) ) ( not ( = ?auto_195050 ?auto_195052 ) ) ( not ( = ?auto_195050 ?auto_195053 ) ) ( not ( = ?auto_195051 ?auto_195052 ) ) ( not ( = ?auto_195051 ?auto_195053 ) ) ( not ( = ?auto_195052 ?auto_195053 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_195052 ?auto_195053 )
      ( !STACK ?auto_195052 ?auto_195051 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195062 - BLOCK
      ?auto_195063 - BLOCK
      ?auto_195064 - BLOCK
      ?auto_195065 - BLOCK
      ?auto_195066 - BLOCK
      ?auto_195067 - BLOCK
      ?auto_195068 - BLOCK
      ?auto_195069 - BLOCK
    )
    :vars
    (
      ?auto_195070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195069 ?auto_195070 ) ( ON-TABLE ?auto_195062 ) ( ON ?auto_195063 ?auto_195062 ) ( ON ?auto_195064 ?auto_195063 ) ( ON ?auto_195065 ?auto_195064 ) ( ON ?auto_195066 ?auto_195065 ) ( ON ?auto_195067 ?auto_195066 ) ( not ( = ?auto_195062 ?auto_195063 ) ) ( not ( = ?auto_195062 ?auto_195064 ) ) ( not ( = ?auto_195062 ?auto_195065 ) ) ( not ( = ?auto_195062 ?auto_195066 ) ) ( not ( = ?auto_195062 ?auto_195067 ) ) ( not ( = ?auto_195062 ?auto_195068 ) ) ( not ( = ?auto_195062 ?auto_195069 ) ) ( not ( = ?auto_195062 ?auto_195070 ) ) ( not ( = ?auto_195063 ?auto_195064 ) ) ( not ( = ?auto_195063 ?auto_195065 ) ) ( not ( = ?auto_195063 ?auto_195066 ) ) ( not ( = ?auto_195063 ?auto_195067 ) ) ( not ( = ?auto_195063 ?auto_195068 ) ) ( not ( = ?auto_195063 ?auto_195069 ) ) ( not ( = ?auto_195063 ?auto_195070 ) ) ( not ( = ?auto_195064 ?auto_195065 ) ) ( not ( = ?auto_195064 ?auto_195066 ) ) ( not ( = ?auto_195064 ?auto_195067 ) ) ( not ( = ?auto_195064 ?auto_195068 ) ) ( not ( = ?auto_195064 ?auto_195069 ) ) ( not ( = ?auto_195064 ?auto_195070 ) ) ( not ( = ?auto_195065 ?auto_195066 ) ) ( not ( = ?auto_195065 ?auto_195067 ) ) ( not ( = ?auto_195065 ?auto_195068 ) ) ( not ( = ?auto_195065 ?auto_195069 ) ) ( not ( = ?auto_195065 ?auto_195070 ) ) ( not ( = ?auto_195066 ?auto_195067 ) ) ( not ( = ?auto_195066 ?auto_195068 ) ) ( not ( = ?auto_195066 ?auto_195069 ) ) ( not ( = ?auto_195066 ?auto_195070 ) ) ( not ( = ?auto_195067 ?auto_195068 ) ) ( not ( = ?auto_195067 ?auto_195069 ) ) ( not ( = ?auto_195067 ?auto_195070 ) ) ( not ( = ?auto_195068 ?auto_195069 ) ) ( not ( = ?auto_195068 ?auto_195070 ) ) ( not ( = ?auto_195069 ?auto_195070 ) ) ( CLEAR ?auto_195067 ) ( ON ?auto_195068 ?auto_195069 ) ( CLEAR ?auto_195068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195062 ?auto_195063 ?auto_195064 ?auto_195065 ?auto_195066 ?auto_195067 ?auto_195068 )
      ( MAKE-8PILE ?auto_195062 ?auto_195063 ?auto_195064 ?auto_195065 ?auto_195066 ?auto_195067 ?auto_195068 ?auto_195069 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195079 - BLOCK
      ?auto_195080 - BLOCK
      ?auto_195081 - BLOCK
      ?auto_195082 - BLOCK
      ?auto_195083 - BLOCK
      ?auto_195084 - BLOCK
      ?auto_195085 - BLOCK
      ?auto_195086 - BLOCK
    )
    :vars
    (
      ?auto_195087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195086 ?auto_195087 ) ( ON-TABLE ?auto_195079 ) ( ON ?auto_195080 ?auto_195079 ) ( ON ?auto_195081 ?auto_195080 ) ( ON ?auto_195082 ?auto_195081 ) ( ON ?auto_195083 ?auto_195082 ) ( ON ?auto_195084 ?auto_195083 ) ( not ( = ?auto_195079 ?auto_195080 ) ) ( not ( = ?auto_195079 ?auto_195081 ) ) ( not ( = ?auto_195079 ?auto_195082 ) ) ( not ( = ?auto_195079 ?auto_195083 ) ) ( not ( = ?auto_195079 ?auto_195084 ) ) ( not ( = ?auto_195079 ?auto_195085 ) ) ( not ( = ?auto_195079 ?auto_195086 ) ) ( not ( = ?auto_195079 ?auto_195087 ) ) ( not ( = ?auto_195080 ?auto_195081 ) ) ( not ( = ?auto_195080 ?auto_195082 ) ) ( not ( = ?auto_195080 ?auto_195083 ) ) ( not ( = ?auto_195080 ?auto_195084 ) ) ( not ( = ?auto_195080 ?auto_195085 ) ) ( not ( = ?auto_195080 ?auto_195086 ) ) ( not ( = ?auto_195080 ?auto_195087 ) ) ( not ( = ?auto_195081 ?auto_195082 ) ) ( not ( = ?auto_195081 ?auto_195083 ) ) ( not ( = ?auto_195081 ?auto_195084 ) ) ( not ( = ?auto_195081 ?auto_195085 ) ) ( not ( = ?auto_195081 ?auto_195086 ) ) ( not ( = ?auto_195081 ?auto_195087 ) ) ( not ( = ?auto_195082 ?auto_195083 ) ) ( not ( = ?auto_195082 ?auto_195084 ) ) ( not ( = ?auto_195082 ?auto_195085 ) ) ( not ( = ?auto_195082 ?auto_195086 ) ) ( not ( = ?auto_195082 ?auto_195087 ) ) ( not ( = ?auto_195083 ?auto_195084 ) ) ( not ( = ?auto_195083 ?auto_195085 ) ) ( not ( = ?auto_195083 ?auto_195086 ) ) ( not ( = ?auto_195083 ?auto_195087 ) ) ( not ( = ?auto_195084 ?auto_195085 ) ) ( not ( = ?auto_195084 ?auto_195086 ) ) ( not ( = ?auto_195084 ?auto_195087 ) ) ( not ( = ?auto_195085 ?auto_195086 ) ) ( not ( = ?auto_195085 ?auto_195087 ) ) ( not ( = ?auto_195086 ?auto_195087 ) ) ( CLEAR ?auto_195084 ) ( ON ?auto_195085 ?auto_195086 ) ( CLEAR ?auto_195085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195079 ?auto_195080 ?auto_195081 ?auto_195082 ?auto_195083 ?auto_195084 ?auto_195085 )
      ( MAKE-8PILE ?auto_195079 ?auto_195080 ?auto_195081 ?auto_195082 ?auto_195083 ?auto_195084 ?auto_195085 ?auto_195086 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195096 - BLOCK
      ?auto_195097 - BLOCK
      ?auto_195098 - BLOCK
      ?auto_195099 - BLOCK
      ?auto_195100 - BLOCK
      ?auto_195101 - BLOCK
      ?auto_195102 - BLOCK
      ?auto_195103 - BLOCK
    )
    :vars
    (
      ?auto_195104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195103 ?auto_195104 ) ( ON-TABLE ?auto_195096 ) ( ON ?auto_195097 ?auto_195096 ) ( ON ?auto_195098 ?auto_195097 ) ( ON ?auto_195099 ?auto_195098 ) ( ON ?auto_195100 ?auto_195099 ) ( not ( = ?auto_195096 ?auto_195097 ) ) ( not ( = ?auto_195096 ?auto_195098 ) ) ( not ( = ?auto_195096 ?auto_195099 ) ) ( not ( = ?auto_195096 ?auto_195100 ) ) ( not ( = ?auto_195096 ?auto_195101 ) ) ( not ( = ?auto_195096 ?auto_195102 ) ) ( not ( = ?auto_195096 ?auto_195103 ) ) ( not ( = ?auto_195096 ?auto_195104 ) ) ( not ( = ?auto_195097 ?auto_195098 ) ) ( not ( = ?auto_195097 ?auto_195099 ) ) ( not ( = ?auto_195097 ?auto_195100 ) ) ( not ( = ?auto_195097 ?auto_195101 ) ) ( not ( = ?auto_195097 ?auto_195102 ) ) ( not ( = ?auto_195097 ?auto_195103 ) ) ( not ( = ?auto_195097 ?auto_195104 ) ) ( not ( = ?auto_195098 ?auto_195099 ) ) ( not ( = ?auto_195098 ?auto_195100 ) ) ( not ( = ?auto_195098 ?auto_195101 ) ) ( not ( = ?auto_195098 ?auto_195102 ) ) ( not ( = ?auto_195098 ?auto_195103 ) ) ( not ( = ?auto_195098 ?auto_195104 ) ) ( not ( = ?auto_195099 ?auto_195100 ) ) ( not ( = ?auto_195099 ?auto_195101 ) ) ( not ( = ?auto_195099 ?auto_195102 ) ) ( not ( = ?auto_195099 ?auto_195103 ) ) ( not ( = ?auto_195099 ?auto_195104 ) ) ( not ( = ?auto_195100 ?auto_195101 ) ) ( not ( = ?auto_195100 ?auto_195102 ) ) ( not ( = ?auto_195100 ?auto_195103 ) ) ( not ( = ?auto_195100 ?auto_195104 ) ) ( not ( = ?auto_195101 ?auto_195102 ) ) ( not ( = ?auto_195101 ?auto_195103 ) ) ( not ( = ?auto_195101 ?auto_195104 ) ) ( not ( = ?auto_195102 ?auto_195103 ) ) ( not ( = ?auto_195102 ?auto_195104 ) ) ( not ( = ?auto_195103 ?auto_195104 ) ) ( ON ?auto_195102 ?auto_195103 ) ( CLEAR ?auto_195100 ) ( ON ?auto_195101 ?auto_195102 ) ( CLEAR ?auto_195101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195096 ?auto_195097 ?auto_195098 ?auto_195099 ?auto_195100 ?auto_195101 )
      ( MAKE-8PILE ?auto_195096 ?auto_195097 ?auto_195098 ?auto_195099 ?auto_195100 ?auto_195101 ?auto_195102 ?auto_195103 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195113 - BLOCK
      ?auto_195114 - BLOCK
      ?auto_195115 - BLOCK
      ?auto_195116 - BLOCK
      ?auto_195117 - BLOCK
      ?auto_195118 - BLOCK
      ?auto_195119 - BLOCK
      ?auto_195120 - BLOCK
    )
    :vars
    (
      ?auto_195121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195120 ?auto_195121 ) ( ON-TABLE ?auto_195113 ) ( ON ?auto_195114 ?auto_195113 ) ( ON ?auto_195115 ?auto_195114 ) ( ON ?auto_195116 ?auto_195115 ) ( ON ?auto_195117 ?auto_195116 ) ( not ( = ?auto_195113 ?auto_195114 ) ) ( not ( = ?auto_195113 ?auto_195115 ) ) ( not ( = ?auto_195113 ?auto_195116 ) ) ( not ( = ?auto_195113 ?auto_195117 ) ) ( not ( = ?auto_195113 ?auto_195118 ) ) ( not ( = ?auto_195113 ?auto_195119 ) ) ( not ( = ?auto_195113 ?auto_195120 ) ) ( not ( = ?auto_195113 ?auto_195121 ) ) ( not ( = ?auto_195114 ?auto_195115 ) ) ( not ( = ?auto_195114 ?auto_195116 ) ) ( not ( = ?auto_195114 ?auto_195117 ) ) ( not ( = ?auto_195114 ?auto_195118 ) ) ( not ( = ?auto_195114 ?auto_195119 ) ) ( not ( = ?auto_195114 ?auto_195120 ) ) ( not ( = ?auto_195114 ?auto_195121 ) ) ( not ( = ?auto_195115 ?auto_195116 ) ) ( not ( = ?auto_195115 ?auto_195117 ) ) ( not ( = ?auto_195115 ?auto_195118 ) ) ( not ( = ?auto_195115 ?auto_195119 ) ) ( not ( = ?auto_195115 ?auto_195120 ) ) ( not ( = ?auto_195115 ?auto_195121 ) ) ( not ( = ?auto_195116 ?auto_195117 ) ) ( not ( = ?auto_195116 ?auto_195118 ) ) ( not ( = ?auto_195116 ?auto_195119 ) ) ( not ( = ?auto_195116 ?auto_195120 ) ) ( not ( = ?auto_195116 ?auto_195121 ) ) ( not ( = ?auto_195117 ?auto_195118 ) ) ( not ( = ?auto_195117 ?auto_195119 ) ) ( not ( = ?auto_195117 ?auto_195120 ) ) ( not ( = ?auto_195117 ?auto_195121 ) ) ( not ( = ?auto_195118 ?auto_195119 ) ) ( not ( = ?auto_195118 ?auto_195120 ) ) ( not ( = ?auto_195118 ?auto_195121 ) ) ( not ( = ?auto_195119 ?auto_195120 ) ) ( not ( = ?auto_195119 ?auto_195121 ) ) ( not ( = ?auto_195120 ?auto_195121 ) ) ( ON ?auto_195119 ?auto_195120 ) ( CLEAR ?auto_195117 ) ( ON ?auto_195118 ?auto_195119 ) ( CLEAR ?auto_195118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195113 ?auto_195114 ?auto_195115 ?auto_195116 ?auto_195117 ?auto_195118 )
      ( MAKE-8PILE ?auto_195113 ?auto_195114 ?auto_195115 ?auto_195116 ?auto_195117 ?auto_195118 ?auto_195119 ?auto_195120 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195130 - BLOCK
      ?auto_195131 - BLOCK
      ?auto_195132 - BLOCK
      ?auto_195133 - BLOCK
      ?auto_195134 - BLOCK
      ?auto_195135 - BLOCK
      ?auto_195136 - BLOCK
      ?auto_195137 - BLOCK
    )
    :vars
    (
      ?auto_195138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195137 ?auto_195138 ) ( ON-TABLE ?auto_195130 ) ( ON ?auto_195131 ?auto_195130 ) ( ON ?auto_195132 ?auto_195131 ) ( ON ?auto_195133 ?auto_195132 ) ( not ( = ?auto_195130 ?auto_195131 ) ) ( not ( = ?auto_195130 ?auto_195132 ) ) ( not ( = ?auto_195130 ?auto_195133 ) ) ( not ( = ?auto_195130 ?auto_195134 ) ) ( not ( = ?auto_195130 ?auto_195135 ) ) ( not ( = ?auto_195130 ?auto_195136 ) ) ( not ( = ?auto_195130 ?auto_195137 ) ) ( not ( = ?auto_195130 ?auto_195138 ) ) ( not ( = ?auto_195131 ?auto_195132 ) ) ( not ( = ?auto_195131 ?auto_195133 ) ) ( not ( = ?auto_195131 ?auto_195134 ) ) ( not ( = ?auto_195131 ?auto_195135 ) ) ( not ( = ?auto_195131 ?auto_195136 ) ) ( not ( = ?auto_195131 ?auto_195137 ) ) ( not ( = ?auto_195131 ?auto_195138 ) ) ( not ( = ?auto_195132 ?auto_195133 ) ) ( not ( = ?auto_195132 ?auto_195134 ) ) ( not ( = ?auto_195132 ?auto_195135 ) ) ( not ( = ?auto_195132 ?auto_195136 ) ) ( not ( = ?auto_195132 ?auto_195137 ) ) ( not ( = ?auto_195132 ?auto_195138 ) ) ( not ( = ?auto_195133 ?auto_195134 ) ) ( not ( = ?auto_195133 ?auto_195135 ) ) ( not ( = ?auto_195133 ?auto_195136 ) ) ( not ( = ?auto_195133 ?auto_195137 ) ) ( not ( = ?auto_195133 ?auto_195138 ) ) ( not ( = ?auto_195134 ?auto_195135 ) ) ( not ( = ?auto_195134 ?auto_195136 ) ) ( not ( = ?auto_195134 ?auto_195137 ) ) ( not ( = ?auto_195134 ?auto_195138 ) ) ( not ( = ?auto_195135 ?auto_195136 ) ) ( not ( = ?auto_195135 ?auto_195137 ) ) ( not ( = ?auto_195135 ?auto_195138 ) ) ( not ( = ?auto_195136 ?auto_195137 ) ) ( not ( = ?auto_195136 ?auto_195138 ) ) ( not ( = ?auto_195137 ?auto_195138 ) ) ( ON ?auto_195136 ?auto_195137 ) ( ON ?auto_195135 ?auto_195136 ) ( CLEAR ?auto_195133 ) ( ON ?auto_195134 ?auto_195135 ) ( CLEAR ?auto_195134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195130 ?auto_195131 ?auto_195132 ?auto_195133 ?auto_195134 )
      ( MAKE-8PILE ?auto_195130 ?auto_195131 ?auto_195132 ?auto_195133 ?auto_195134 ?auto_195135 ?auto_195136 ?auto_195137 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195147 - BLOCK
      ?auto_195148 - BLOCK
      ?auto_195149 - BLOCK
      ?auto_195150 - BLOCK
      ?auto_195151 - BLOCK
      ?auto_195152 - BLOCK
      ?auto_195153 - BLOCK
      ?auto_195154 - BLOCK
    )
    :vars
    (
      ?auto_195155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195154 ?auto_195155 ) ( ON-TABLE ?auto_195147 ) ( ON ?auto_195148 ?auto_195147 ) ( ON ?auto_195149 ?auto_195148 ) ( ON ?auto_195150 ?auto_195149 ) ( not ( = ?auto_195147 ?auto_195148 ) ) ( not ( = ?auto_195147 ?auto_195149 ) ) ( not ( = ?auto_195147 ?auto_195150 ) ) ( not ( = ?auto_195147 ?auto_195151 ) ) ( not ( = ?auto_195147 ?auto_195152 ) ) ( not ( = ?auto_195147 ?auto_195153 ) ) ( not ( = ?auto_195147 ?auto_195154 ) ) ( not ( = ?auto_195147 ?auto_195155 ) ) ( not ( = ?auto_195148 ?auto_195149 ) ) ( not ( = ?auto_195148 ?auto_195150 ) ) ( not ( = ?auto_195148 ?auto_195151 ) ) ( not ( = ?auto_195148 ?auto_195152 ) ) ( not ( = ?auto_195148 ?auto_195153 ) ) ( not ( = ?auto_195148 ?auto_195154 ) ) ( not ( = ?auto_195148 ?auto_195155 ) ) ( not ( = ?auto_195149 ?auto_195150 ) ) ( not ( = ?auto_195149 ?auto_195151 ) ) ( not ( = ?auto_195149 ?auto_195152 ) ) ( not ( = ?auto_195149 ?auto_195153 ) ) ( not ( = ?auto_195149 ?auto_195154 ) ) ( not ( = ?auto_195149 ?auto_195155 ) ) ( not ( = ?auto_195150 ?auto_195151 ) ) ( not ( = ?auto_195150 ?auto_195152 ) ) ( not ( = ?auto_195150 ?auto_195153 ) ) ( not ( = ?auto_195150 ?auto_195154 ) ) ( not ( = ?auto_195150 ?auto_195155 ) ) ( not ( = ?auto_195151 ?auto_195152 ) ) ( not ( = ?auto_195151 ?auto_195153 ) ) ( not ( = ?auto_195151 ?auto_195154 ) ) ( not ( = ?auto_195151 ?auto_195155 ) ) ( not ( = ?auto_195152 ?auto_195153 ) ) ( not ( = ?auto_195152 ?auto_195154 ) ) ( not ( = ?auto_195152 ?auto_195155 ) ) ( not ( = ?auto_195153 ?auto_195154 ) ) ( not ( = ?auto_195153 ?auto_195155 ) ) ( not ( = ?auto_195154 ?auto_195155 ) ) ( ON ?auto_195153 ?auto_195154 ) ( ON ?auto_195152 ?auto_195153 ) ( CLEAR ?auto_195150 ) ( ON ?auto_195151 ?auto_195152 ) ( CLEAR ?auto_195151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195147 ?auto_195148 ?auto_195149 ?auto_195150 ?auto_195151 )
      ( MAKE-8PILE ?auto_195147 ?auto_195148 ?auto_195149 ?auto_195150 ?auto_195151 ?auto_195152 ?auto_195153 ?auto_195154 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195164 - BLOCK
      ?auto_195165 - BLOCK
      ?auto_195166 - BLOCK
      ?auto_195167 - BLOCK
      ?auto_195168 - BLOCK
      ?auto_195169 - BLOCK
      ?auto_195170 - BLOCK
      ?auto_195171 - BLOCK
    )
    :vars
    (
      ?auto_195172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195171 ?auto_195172 ) ( ON-TABLE ?auto_195164 ) ( ON ?auto_195165 ?auto_195164 ) ( ON ?auto_195166 ?auto_195165 ) ( not ( = ?auto_195164 ?auto_195165 ) ) ( not ( = ?auto_195164 ?auto_195166 ) ) ( not ( = ?auto_195164 ?auto_195167 ) ) ( not ( = ?auto_195164 ?auto_195168 ) ) ( not ( = ?auto_195164 ?auto_195169 ) ) ( not ( = ?auto_195164 ?auto_195170 ) ) ( not ( = ?auto_195164 ?auto_195171 ) ) ( not ( = ?auto_195164 ?auto_195172 ) ) ( not ( = ?auto_195165 ?auto_195166 ) ) ( not ( = ?auto_195165 ?auto_195167 ) ) ( not ( = ?auto_195165 ?auto_195168 ) ) ( not ( = ?auto_195165 ?auto_195169 ) ) ( not ( = ?auto_195165 ?auto_195170 ) ) ( not ( = ?auto_195165 ?auto_195171 ) ) ( not ( = ?auto_195165 ?auto_195172 ) ) ( not ( = ?auto_195166 ?auto_195167 ) ) ( not ( = ?auto_195166 ?auto_195168 ) ) ( not ( = ?auto_195166 ?auto_195169 ) ) ( not ( = ?auto_195166 ?auto_195170 ) ) ( not ( = ?auto_195166 ?auto_195171 ) ) ( not ( = ?auto_195166 ?auto_195172 ) ) ( not ( = ?auto_195167 ?auto_195168 ) ) ( not ( = ?auto_195167 ?auto_195169 ) ) ( not ( = ?auto_195167 ?auto_195170 ) ) ( not ( = ?auto_195167 ?auto_195171 ) ) ( not ( = ?auto_195167 ?auto_195172 ) ) ( not ( = ?auto_195168 ?auto_195169 ) ) ( not ( = ?auto_195168 ?auto_195170 ) ) ( not ( = ?auto_195168 ?auto_195171 ) ) ( not ( = ?auto_195168 ?auto_195172 ) ) ( not ( = ?auto_195169 ?auto_195170 ) ) ( not ( = ?auto_195169 ?auto_195171 ) ) ( not ( = ?auto_195169 ?auto_195172 ) ) ( not ( = ?auto_195170 ?auto_195171 ) ) ( not ( = ?auto_195170 ?auto_195172 ) ) ( not ( = ?auto_195171 ?auto_195172 ) ) ( ON ?auto_195170 ?auto_195171 ) ( ON ?auto_195169 ?auto_195170 ) ( ON ?auto_195168 ?auto_195169 ) ( CLEAR ?auto_195166 ) ( ON ?auto_195167 ?auto_195168 ) ( CLEAR ?auto_195167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195164 ?auto_195165 ?auto_195166 ?auto_195167 )
      ( MAKE-8PILE ?auto_195164 ?auto_195165 ?auto_195166 ?auto_195167 ?auto_195168 ?auto_195169 ?auto_195170 ?auto_195171 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195181 - BLOCK
      ?auto_195182 - BLOCK
      ?auto_195183 - BLOCK
      ?auto_195184 - BLOCK
      ?auto_195185 - BLOCK
      ?auto_195186 - BLOCK
      ?auto_195187 - BLOCK
      ?auto_195188 - BLOCK
    )
    :vars
    (
      ?auto_195189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195188 ?auto_195189 ) ( ON-TABLE ?auto_195181 ) ( ON ?auto_195182 ?auto_195181 ) ( ON ?auto_195183 ?auto_195182 ) ( not ( = ?auto_195181 ?auto_195182 ) ) ( not ( = ?auto_195181 ?auto_195183 ) ) ( not ( = ?auto_195181 ?auto_195184 ) ) ( not ( = ?auto_195181 ?auto_195185 ) ) ( not ( = ?auto_195181 ?auto_195186 ) ) ( not ( = ?auto_195181 ?auto_195187 ) ) ( not ( = ?auto_195181 ?auto_195188 ) ) ( not ( = ?auto_195181 ?auto_195189 ) ) ( not ( = ?auto_195182 ?auto_195183 ) ) ( not ( = ?auto_195182 ?auto_195184 ) ) ( not ( = ?auto_195182 ?auto_195185 ) ) ( not ( = ?auto_195182 ?auto_195186 ) ) ( not ( = ?auto_195182 ?auto_195187 ) ) ( not ( = ?auto_195182 ?auto_195188 ) ) ( not ( = ?auto_195182 ?auto_195189 ) ) ( not ( = ?auto_195183 ?auto_195184 ) ) ( not ( = ?auto_195183 ?auto_195185 ) ) ( not ( = ?auto_195183 ?auto_195186 ) ) ( not ( = ?auto_195183 ?auto_195187 ) ) ( not ( = ?auto_195183 ?auto_195188 ) ) ( not ( = ?auto_195183 ?auto_195189 ) ) ( not ( = ?auto_195184 ?auto_195185 ) ) ( not ( = ?auto_195184 ?auto_195186 ) ) ( not ( = ?auto_195184 ?auto_195187 ) ) ( not ( = ?auto_195184 ?auto_195188 ) ) ( not ( = ?auto_195184 ?auto_195189 ) ) ( not ( = ?auto_195185 ?auto_195186 ) ) ( not ( = ?auto_195185 ?auto_195187 ) ) ( not ( = ?auto_195185 ?auto_195188 ) ) ( not ( = ?auto_195185 ?auto_195189 ) ) ( not ( = ?auto_195186 ?auto_195187 ) ) ( not ( = ?auto_195186 ?auto_195188 ) ) ( not ( = ?auto_195186 ?auto_195189 ) ) ( not ( = ?auto_195187 ?auto_195188 ) ) ( not ( = ?auto_195187 ?auto_195189 ) ) ( not ( = ?auto_195188 ?auto_195189 ) ) ( ON ?auto_195187 ?auto_195188 ) ( ON ?auto_195186 ?auto_195187 ) ( ON ?auto_195185 ?auto_195186 ) ( CLEAR ?auto_195183 ) ( ON ?auto_195184 ?auto_195185 ) ( CLEAR ?auto_195184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195181 ?auto_195182 ?auto_195183 ?auto_195184 )
      ( MAKE-8PILE ?auto_195181 ?auto_195182 ?auto_195183 ?auto_195184 ?auto_195185 ?auto_195186 ?auto_195187 ?auto_195188 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195198 - BLOCK
      ?auto_195199 - BLOCK
      ?auto_195200 - BLOCK
      ?auto_195201 - BLOCK
      ?auto_195202 - BLOCK
      ?auto_195203 - BLOCK
      ?auto_195204 - BLOCK
      ?auto_195205 - BLOCK
    )
    :vars
    (
      ?auto_195206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195205 ?auto_195206 ) ( ON-TABLE ?auto_195198 ) ( ON ?auto_195199 ?auto_195198 ) ( not ( = ?auto_195198 ?auto_195199 ) ) ( not ( = ?auto_195198 ?auto_195200 ) ) ( not ( = ?auto_195198 ?auto_195201 ) ) ( not ( = ?auto_195198 ?auto_195202 ) ) ( not ( = ?auto_195198 ?auto_195203 ) ) ( not ( = ?auto_195198 ?auto_195204 ) ) ( not ( = ?auto_195198 ?auto_195205 ) ) ( not ( = ?auto_195198 ?auto_195206 ) ) ( not ( = ?auto_195199 ?auto_195200 ) ) ( not ( = ?auto_195199 ?auto_195201 ) ) ( not ( = ?auto_195199 ?auto_195202 ) ) ( not ( = ?auto_195199 ?auto_195203 ) ) ( not ( = ?auto_195199 ?auto_195204 ) ) ( not ( = ?auto_195199 ?auto_195205 ) ) ( not ( = ?auto_195199 ?auto_195206 ) ) ( not ( = ?auto_195200 ?auto_195201 ) ) ( not ( = ?auto_195200 ?auto_195202 ) ) ( not ( = ?auto_195200 ?auto_195203 ) ) ( not ( = ?auto_195200 ?auto_195204 ) ) ( not ( = ?auto_195200 ?auto_195205 ) ) ( not ( = ?auto_195200 ?auto_195206 ) ) ( not ( = ?auto_195201 ?auto_195202 ) ) ( not ( = ?auto_195201 ?auto_195203 ) ) ( not ( = ?auto_195201 ?auto_195204 ) ) ( not ( = ?auto_195201 ?auto_195205 ) ) ( not ( = ?auto_195201 ?auto_195206 ) ) ( not ( = ?auto_195202 ?auto_195203 ) ) ( not ( = ?auto_195202 ?auto_195204 ) ) ( not ( = ?auto_195202 ?auto_195205 ) ) ( not ( = ?auto_195202 ?auto_195206 ) ) ( not ( = ?auto_195203 ?auto_195204 ) ) ( not ( = ?auto_195203 ?auto_195205 ) ) ( not ( = ?auto_195203 ?auto_195206 ) ) ( not ( = ?auto_195204 ?auto_195205 ) ) ( not ( = ?auto_195204 ?auto_195206 ) ) ( not ( = ?auto_195205 ?auto_195206 ) ) ( ON ?auto_195204 ?auto_195205 ) ( ON ?auto_195203 ?auto_195204 ) ( ON ?auto_195202 ?auto_195203 ) ( ON ?auto_195201 ?auto_195202 ) ( CLEAR ?auto_195199 ) ( ON ?auto_195200 ?auto_195201 ) ( CLEAR ?auto_195200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195198 ?auto_195199 ?auto_195200 )
      ( MAKE-8PILE ?auto_195198 ?auto_195199 ?auto_195200 ?auto_195201 ?auto_195202 ?auto_195203 ?auto_195204 ?auto_195205 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195215 - BLOCK
      ?auto_195216 - BLOCK
      ?auto_195217 - BLOCK
      ?auto_195218 - BLOCK
      ?auto_195219 - BLOCK
      ?auto_195220 - BLOCK
      ?auto_195221 - BLOCK
      ?auto_195222 - BLOCK
    )
    :vars
    (
      ?auto_195223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195222 ?auto_195223 ) ( ON-TABLE ?auto_195215 ) ( ON ?auto_195216 ?auto_195215 ) ( not ( = ?auto_195215 ?auto_195216 ) ) ( not ( = ?auto_195215 ?auto_195217 ) ) ( not ( = ?auto_195215 ?auto_195218 ) ) ( not ( = ?auto_195215 ?auto_195219 ) ) ( not ( = ?auto_195215 ?auto_195220 ) ) ( not ( = ?auto_195215 ?auto_195221 ) ) ( not ( = ?auto_195215 ?auto_195222 ) ) ( not ( = ?auto_195215 ?auto_195223 ) ) ( not ( = ?auto_195216 ?auto_195217 ) ) ( not ( = ?auto_195216 ?auto_195218 ) ) ( not ( = ?auto_195216 ?auto_195219 ) ) ( not ( = ?auto_195216 ?auto_195220 ) ) ( not ( = ?auto_195216 ?auto_195221 ) ) ( not ( = ?auto_195216 ?auto_195222 ) ) ( not ( = ?auto_195216 ?auto_195223 ) ) ( not ( = ?auto_195217 ?auto_195218 ) ) ( not ( = ?auto_195217 ?auto_195219 ) ) ( not ( = ?auto_195217 ?auto_195220 ) ) ( not ( = ?auto_195217 ?auto_195221 ) ) ( not ( = ?auto_195217 ?auto_195222 ) ) ( not ( = ?auto_195217 ?auto_195223 ) ) ( not ( = ?auto_195218 ?auto_195219 ) ) ( not ( = ?auto_195218 ?auto_195220 ) ) ( not ( = ?auto_195218 ?auto_195221 ) ) ( not ( = ?auto_195218 ?auto_195222 ) ) ( not ( = ?auto_195218 ?auto_195223 ) ) ( not ( = ?auto_195219 ?auto_195220 ) ) ( not ( = ?auto_195219 ?auto_195221 ) ) ( not ( = ?auto_195219 ?auto_195222 ) ) ( not ( = ?auto_195219 ?auto_195223 ) ) ( not ( = ?auto_195220 ?auto_195221 ) ) ( not ( = ?auto_195220 ?auto_195222 ) ) ( not ( = ?auto_195220 ?auto_195223 ) ) ( not ( = ?auto_195221 ?auto_195222 ) ) ( not ( = ?auto_195221 ?auto_195223 ) ) ( not ( = ?auto_195222 ?auto_195223 ) ) ( ON ?auto_195221 ?auto_195222 ) ( ON ?auto_195220 ?auto_195221 ) ( ON ?auto_195219 ?auto_195220 ) ( ON ?auto_195218 ?auto_195219 ) ( CLEAR ?auto_195216 ) ( ON ?auto_195217 ?auto_195218 ) ( CLEAR ?auto_195217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195215 ?auto_195216 ?auto_195217 )
      ( MAKE-8PILE ?auto_195215 ?auto_195216 ?auto_195217 ?auto_195218 ?auto_195219 ?auto_195220 ?auto_195221 ?auto_195222 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195232 - BLOCK
      ?auto_195233 - BLOCK
      ?auto_195234 - BLOCK
      ?auto_195235 - BLOCK
      ?auto_195236 - BLOCK
      ?auto_195237 - BLOCK
      ?auto_195238 - BLOCK
      ?auto_195239 - BLOCK
    )
    :vars
    (
      ?auto_195240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195239 ?auto_195240 ) ( ON-TABLE ?auto_195232 ) ( not ( = ?auto_195232 ?auto_195233 ) ) ( not ( = ?auto_195232 ?auto_195234 ) ) ( not ( = ?auto_195232 ?auto_195235 ) ) ( not ( = ?auto_195232 ?auto_195236 ) ) ( not ( = ?auto_195232 ?auto_195237 ) ) ( not ( = ?auto_195232 ?auto_195238 ) ) ( not ( = ?auto_195232 ?auto_195239 ) ) ( not ( = ?auto_195232 ?auto_195240 ) ) ( not ( = ?auto_195233 ?auto_195234 ) ) ( not ( = ?auto_195233 ?auto_195235 ) ) ( not ( = ?auto_195233 ?auto_195236 ) ) ( not ( = ?auto_195233 ?auto_195237 ) ) ( not ( = ?auto_195233 ?auto_195238 ) ) ( not ( = ?auto_195233 ?auto_195239 ) ) ( not ( = ?auto_195233 ?auto_195240 ) ) ( not ( = ?auto_195234 ?auto_195235 ) ) ( not ( = ?auto_195234 ?auto_195236 ) ) ( not ( = ?auto_195234 ?auto_195237 ) ) ( not ( = ?auto_195234 ?auto_195238 ) ) ( not ( = ?auto_195234 ?auto_195239 ) ) ( not ( = ?auto_195234 ?auto_195240 ) ) ( not ( = ?auto_195235 ?auto_195236 ) ) ( not ( = ?auto_195235 ?auto_195237 ) ) ( not ( = ?auto_195235 ?auto_195238 ) ) ( not ( = ?auto_195235 ?auto_195239 ) ) ( not ( = ?auto_195235 ?auto_195240 ) ) ( not ( = ?auto_195236 ?auto_195237 ) ) ( not ( = ?auto_195236 ?auto_195238 ) ) ( not ( = ?auto_195236 ?auto_195239 ) ) ( not ( = ?auto_195236 ?auto_195240 ) ) ( not ( = ?auto_195237 ?auto_195238 ) ) ( not ( = ?auto_195237 ?auto_195239 ) ) ( not ( = ?auto_195237 ?auto_195240 ) ) ( not ( = ?auto_195238 ?auto_195239 ) ) ( not ( = ?auto_195238 ?auto_195240 ) ) ( not ( = ?auto_195239 ?auto_195240 ) ) ( ON ?auto_195238 ?auto_195239 ) ( ON ?auto_195237 ?auto_195238 ) ( ON ?auto_195236 ?auto_195237 ) ( ON ?auto_195235 ?auto_195236 ) ( ON ?auto_195234 ?auto_195235 ) ( CLEAR ?auto_195232 ) ( ON ?auto_195233 ?auto_195234 ) ( CLEAR ?auto_195233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195232 ?auto_195233 )
      ( MAKE-8PILE ?auto_195232 ?auto_195233 ?auto_195234 ?auto_195235 ?auto_195236 ?auto_195237 ?auto_195238 ?auto_195239 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195249 - BLOCK
      ?auto_195250 - BLOCK
      ?auto_195251 - BLOCK
      ?auto_195252 - BLOCK
      ?auto_195253 - BLOCK
      ?auto_195254 - BLOCK
      ?auto_195255 - BLOCK
      ?auto_195256 - BLOCK
    )
    :vars
    (
      ?auto_195257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195256 ?auto_195257 ) ( ON-TABLE ?auto_195249 ) ( not ( = ?auto_195249 ?auto_195250 ) ) ( not ( = ?auto_195249 ?auto_195251 ) ) ( not ( = ?auto_195249 ?auto_195252 ) ) ( not ( = ?auto_195249 ?auto_195253 ) ) ( not ( = ?auto_195249 ?auto_195254 ) ) ( not ( = ?auto_195249 ?auto_195255 ) ) ( not ( = ?auto_195249 ?auto_195256 ) ) ( not ( = ?auto_195249 ?auto_195257 ) ) ( not ( = ?auto_195250 ?auto_195251 ) ) ( not ( = ?auto_195250 ?auto_195252 ) ) ( not ( = ?auto_195250 ?auto_195253 ) ) ( not ( = ?auto_195250 ?auto_195254 ) ) ( not ( = ?auto_195250 ?auto_195255 ) ) ( not ( = ?auto_195250 ?auto_195256 ) ) ( not ( = ?auto_195250 ?auto_195257 ) ) ( not ( = ?auto_195251 ?auto_195252 ) ) ( not ( = ?auto_195251 ?auto_195253 ) ) ( not ( = ?auto_195251 ?auto_195254 ) ) ( not ( = ?auto_195251 ?auto_195255 ) ) ( not ( = ?auto_195251 ?auto_195256 ) ) ( not ( = ?auto_195251 ?auto_195257 ) ) ( not ( = ?auto_195252 ?auto_195253 ) ) ( not ( = ?auto_195252 ?auto_195254 ) ) ( not ( = ?auto_195252 ?auto_195255 ) ) ( not ( = ?auto_195252 ?auto_195256 ) ) ( not ( = ?auto_195252 ?auto_195257 ) ) ( not ( = ?auto_195253 ?auto_195254 ) ) ( not ( = ?auto_195253 ?auto_195255 ) ) ( not ( = ?auto_195253 ?auto_195256 ) ) ( not ( = ?auto_195253 ?auto_195257 ) ) ( not ( = ?auto_195254 ?auto_195255 ) ) ( not ( = ?auto_195254 ?auto_195256 ) ) ( not ( = ?auto_195254 ?auto_195257 ) ) ( not ( = ?auto_195255 ?auto_195256 ) ) ( not ( = ?auto_195255 ?auto_195257 ) ) ( not ( = ?auto_195256 ?auto_195257 ) ) ( ON ?auto_195255 ?auto_195256 ) ( ON ?auto_195254 ?auto_195255 ) ( ON ?auto_195253 ?auto_195254 ) ( ON ?auto_195252 ?auto_195253 ) ( ON ?auto_195251 ?auto_195252 ) ( CLEAR ?auto_195249 ) ( ON ?auto_195250 ?auto_195251 ) ( CLEAR ?auto_195250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195249 ?auto_195250 )
      ( MAKE-8PILE ?auto_195249 ?auto_195250 ?auto_195251 ?auto_195252 ?auto_195253 ?auto_195254 ?auto_195255 ?auto_195256 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195266 - BLOCK
      ?auto_195267 - BLOCK
      ?auto_195268 - BLOCK
      ?auto_195269 - BLOCK
      ?auto_195270 - BLOCK
      ?auto_195271 - BLOCK
      ?auto_195272 - BLOCK
      ?auto_195273 - BLOCK
    )
    :vars
    (
      ?auto_195274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195273 ?auto_195274 ) ( not ( = ?auto_195266 ?auto_195267 ) ) ( not ( = ?auto_195266 ?auto_195268 ) ) ( not ( = ?auto_195266 ?auto_195269 ) ) ( not ( = ?auto_195266 ?auto_195270 ) ) ( not ( = ?auto_195266 ?auto_195271 ) ) ( not ( = ?auto_195266 ?auto_195272 ) ) ( not ( = ?auto_195266 ?auto_195273 ) ) ( not ( = ?auto_195266 ?auto_195274 ) ) ( not ( = ?auto_195267 ?auto_195268 ) ) ( not ( = ?auto_195267 ?auto_195269 ) ) ( not ( = ?auto_195267 ?auto_195270 ) ) ( not ( = ?auto_195267 ?auto_195271 ) ) ( not ( = ?auto_195267 ?auto_195272 ) ) ( not ( = ?auto_195267 ?auto_195273 ) ) ( not ( = ?auto_195267 ?auto_195274 ) ) ( not ( = ?auto_195268 ?auto_195269 ) ) ( not ( = ?auto_195268 ?auto_195270 ) ) ( not ( = ?auto_195268 ?auto_195271 ) ) ( not ( = ?auto_195268 ?auto_195272 ) ) ( not ( = ?auto_195268 ?auto_195273 ) ) ( not ( = ?auto_195268 ?auto_195274 ) ) ( not ( = ?auto_195269 ?auto_195270 ) ) ( not ( = ?auto_195269 ?auto_195271 ) ) ( not ( = ?auto_195269 ?auto_195272 ) ) ( not ( = ?auto_195269 ?auto_195273 ) ) ( not ( = ?auto_195269 ?auto_195274 ) ) ( not ( = ?auto_195270 ?auto_195271 ) ) ( not ( = ?auto_195270 ?auto_195272 ) ) ( not ( = ?auto_195270 ?auto_195273 ) ) ( not ( = ?auto_195270 ?auto_195274 ) ) ( not ( = ?auto_195271 ?auto_195272 ) ) ( not ( = ?auto_195271 ?auto_195273 ) ) ( not ( = ?auto_195271 ?auto_195274 ) ) ( not ( = ?auto_195272 ?auto_195273 ) ) ( not ( = ?auto_195272 ?auto_195274 ) ) ( not ( = ?auto_195273 ?auto_195274 ) ) ( ON ?auto_195272 ?auto_195273 ) ( ON ?auto_195271 ?auto_195272 ) ( ON ?auto_195270 ?auto_195271 ) ( ON ?auto_195269 ?auto_195270 ) ( ON ?auto_195268 ?auto_195269 ) ( ON ?auto_195267 ?auto_195268 ) ( ON ?auto_195266 ?auto_195267 ) ( CLEAR ?auto_195266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_195266 )
      ( MAKE-8PILE ?auto_195266 ?auto_195267 ?auto_195268 ?auto_195269 ?auto_195270 ?auto_195271 ?auto_195272 ?auto_195273 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195283 - BLOCK
      ?auto_195284 - BLOCK
      ?auto_195285 - BLOCK
      ?auto_195286 - BLOCK
      ?auto_195287 - BLOCK
      ?auto_195288 - BLOCK
      ?auto_195289 - BLOCK
      ?auto_195290 - BLOCK
    )
    :vars
    (
      ?auto_195291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195290 ?auto_195291 ) ( not ( = ?auto_195283 ?auto_195284 ) ) ( not ( = ?auto_195283 ?auto_195285 ) ) ( not ( = ?auto_195283 ?auto_195286 ) ) ( not ( = ?auto_195283 ?auto_195287 ) ) ( not ( = ?auto_195283 ?auto_195288 ) ) ( not ( = ?auto_195283 ?auto_195289 ) ) ( not ( = ?auto_195283 ?auto_195290 ) ) ( not ( = ?auto_195283 ?auto_195291 ) ) ( not ( = ?auto_195284 ?auto_195285 ) ) ( not ( = ?auto_195284 ?auto_195286 ) ) ( not ( = ?auto_195284 ?auto_195287 ) ) ( not ( = ?auto_195284 ?auto_195288 ) ) ( not ( = ?auto_195284 ?auto_195289 ) ) ( not ( = ?auto_195284 ?auto_195290 ) ) ( not ( = ?auto_195284 ?auto_195291 ) ) ( not ( = ?auto_195285 ?auto_195286 ) ) ( not ( = ?auto_195285 ?auto_195287 ) ) ( not ( = ?auto_195285 ?auto_195288 ) ) ( not ( = ?auto_195285 ?auto_195289 ) ) ( not ( = ?auto_195285 ?auto_195290 ) ) ( not ( = ?auto_195285 ?auto_195291 ) ) ( not ( = ?auto_195286 ?auto_195287 ) ) ( not ( = ?auto_195286 ?auto_195288 ) ) ( not ( = ?auto_195286 ?auto_195289 ) ) ( not ( = ?auto_195286 ?auto_195290 ) ) ( not ( = ?auto_195286 ?auto_195291 ) ) ( not ( = ?auto_195287 ?auto_195288 ) ) ( not ( = ?auto_195287 ?auto_195289 ) ) ( not ( = ?auto_195287 ?auto_195290 ) ) ( not ( = ?auto_195287 ?auto_195291 ) ) ( not ( = ?auto_195288 ?auto_195289 ) ) ( not ( = ?auto_195288 ?auto_195290 ) ) ( not ( = ?auto_195288 ?auto_195291 ) ) ( not ( = ?auto_195289 ?auto_195290 ) ) ( not ( = ?auto_195289 ?auto_195291 ) ) ( not ( = ?auto_195290 ?auto_195291 ) ) ( ON ?auto_195289 ?auto_195290 ) ( ON ?auto_195288 ?auto_195289 ) ( ON ?auto_195287 ?auto_195288 ) ( ON ?auto_195286 ?auto_195287 ) ( ON ?auto_195285 ?auto_195286 ) ( ON ?auto_195284 ?auto_195285 ) ( ON ?auto_195283 ?auto_195284 ) ( CLEAR ?auto_195283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_195283 )
      ( MAKE-8PILE ?auto_195283 ?auto_195284 ?auto_195285 ?auto_195286 ?auto_195287 ?auto_195288 ?auto_195289 ?auto_195290 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195301 - BLOCK
      ?auto_195302 - BLOCK
      ?auto_195303 - BLOCK
      ?auto_195304 - BLOCK
      ?auto_195305 - BLOCK
      ?auto_195306 - BLOCK
      ?auto_195307 - BLOCK
      ?auto_195308 - BLOCK
      ?auto_195309 - BLOCK
    )
    :vars
    (
      ?auto_195310 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_195308 ) ( ON ?auto_195309 ?auto_195310 ) ( CLEAR ?auto_195309 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_195301 ) ( ON ?auto_195302 ?auto_195301 ) ( ON ?auto_195303 ?auto_195302 ) ( ON ?auto_195304 ?auto_195303 ) ( ON ?auto_195305 ?auto_195304 ) ( ON ?auto_195306 ?auto_195305 ) ( ON ?auto_195307 ?auto_195306 ) ( ON ?auto_195308 ?auto_195307 ) ( not ( = ?auto_195301 ?auto_195302 ) ) ( not ( = ?auto_195301 ?auto_195303 ) ) ( not ( = ?auto_195301 ?auto_195304 ) ) ( not ( = ?auto_195301 ?auto_195305 ) ) ( not ( = ?auto_195301 ?auto_195306 ) ) ( not ( = ?auto_195301 ?auto_195307 ) ) ( not ( = ?auto_195301 ?auto_195308 ) ) ( not ( = ?auto_195301 ?auto_195309 ) ) ( not ( = ?auto_195301 ?auto_195310 ) ) ( not ( = ?auto_195302 ?auto_195303 ) ) ( not ( = ?auto_195302 ?auto_195304 ) ) ( not ( = ?auto_195302 ?auto_195305 ) ) ( not ( = ?auto_195302 ?auto_195306 ) ) ( not ( = ?auto_195302 ?auto_195307 ) ) ( not ( = ?auto_195302 ?auto_195308 ) ) ( not ( = ?auto_195302 ?auto_195309 ) ) ( not ( = ?auto_195302 ?auto_195310 ) ) ( not ( = ?auto_195303 ?auto_195304 ) ) ( not ( = ?auto_195303 ?auto_195305 ) ) ( not ( = ?auto_195303 ?auto_195306 ) ) ( not ( = ?auto_195303 ?auto_195307 ) ) ( not ( = ?auto_195303 ?auto_195308 ) ) ( not ( = ?auto_195303 ?auto_195309 ) ) ( not ( = ?auto_195303 ?auto_195310 ) ) ( not ( = ?auto_195304 ?auto_195305 ) ) ( not ( = ?auto_195304 ?auto_195306 ) ) ( not ( = ?auto_195304 ?auto_195307 ) ) ( not ( = ?auto_195304 ?auto_195308 ) ) ( not ( = ?auto_195304 ?auto_195309 ) ) ( not ( = ?auto_195304 ?auto_195310 ) ) ( not ( = ?auto_195305 ?auto_195306 ) ) ( not ( = ?auto_195305 ?auto_195307 ) ) ( not ( = ?auto_195305 ?auto_195308 ) ) ( not ( = ?auto_195305 ?auto_195309 ) ) ( not ( = ?auto_195305 ?auto_195310 ) ) ( not ( = ?auto_195306 ?auto_195307 ) ) ( not ( = ?auto_195306 ?auto_195308 ) ) ( not ( = ?auto_195306 ?auto_195309 ) ) ( not ( = ?auto_195306 ?auto_195310 ) ) ( not ( = ?auto_195307 ?auto_195308 ) ) ( not ( = ?auto_195307 ?auto_195309 ) ) ( not ( = ?auto_195307 ?auto_195310 ) ) ( not ( = ?auto_195308 ?auto_195309 ) ) ( not ( = ?auto_195308 ?auto_195310 ) ) ( not ( = ?auto_195309 ?auto_195310 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_195309 ?auto_195310 )
      ( !STACK ?auto_195309 ?auto_195308 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195320 - BLOCK
      ?auto_195321 - BLOCK
      ?auto_195322 - BLOCK
      ?auto_195323 - BLOCK
      ?auto_195324 - BLOCK
      ?auto_195325 - BLOCK
      ?auto_195326 - BLOCK
      ?auto_195327 - BLOCK
      ?auto_195328 - BLOCK
    )
    :vars
    (
      ?auto_195329 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_195327 ) ( ON ?auto_195328 ?auto_195329 ) ( CLEAR ?auto_195328 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_195320 ) ( ON ?auto_195321 ?auto_195320 ) ( ON ?auto_195322 ?auto_195321 ) ( ON ?auto_195323 ?auto_195322 ) ( ON ?auto_195324 ?auto_195323 ) ( ON ?auto_195325 ?auto_195324 ) ( ON ?auto_195326 ?auto_195325 ) ( ON ?auto_195327 ?auto_195326 ) ( not ( = ?auto_195320 ?auto_195321 ) ) ( not ( = ?auto_195320 ?auto_195322 ) ) ( not ( = ?auto_195320 ?auto_195323 ) ) ( not ( = ?auto_195320 ?auto_195324 ) ) ( not ( = ?auto_195320 ?auto_195325 ) ) ( not ( = ?auto_195320 ?auto_195326 ) ) ( not ( = ?auto_195320 ?auto_195327 ) ) ( not ( = ?auto_195320 ?auto_195328 ) ) ( not ( = ?auto_195320 ?auto_195329 ) ) ( not ( = ?auto_195321 ?auto_195322 ) ) ( not ( = ?auto_195321 ?auto_195323 ) ) ( not ( = ?auto_195321 ?auto_195324 ) ) ( not ( = ?auto_195321 ?auto_195325 ) ) ( not ( = ?auto_195321 ?auto_195326 ) ) ( not ( = ?auto_195321 ?auto_195327 ) ) ( not ( = ?auto_195321 ?auto_195328 ) ) ( not ( = ?auto_195321 ?auto_195329 ) ) ( not ( = ?auto_195322 ?auto_195323 ) ) ( not ( = ?auto_195322 ?auto_195324 ) ) ( not ( = ?auto_195322 ?auto_195325 ) ) ( not ( = ?auto_195322 ?auto_195326 ) ) ( not ( = ?auto_195322 ?auto_195327 ) ) ( not ( = ?auto_195322 ?auto_195328 ) ) ( not ( = ?auto_195322 ?auto_195329 ) ) ( not ( = ?auto_195323 ?auto_195324 ) ) ( not ( = ?auto_195323 ?auto_195325 ) ) ( not ( = ?auto_195323 ?auto_195326 ) ) ( not ( = ?auto_195323 ?auto_195327 ) ) ( not ( = ?auto_195323 ?auto_195328 ) ) ( not ( = ?auto_195323 ?auto_195329 ) ) ( not ( = ?auto_195324 ?auto_195325 ) ) ( not ( = ?auto_195324 ?auto_195326 ) ) ( not ( = ?auto_195324 ?auto_195327 ) ) ( not ( = ?auto_195324 ?auto_195328 ) ) ( not ( = ?auto_195324 ?auto_195329 ) ) ( not ( = ?auto_195325 ?auto_195326 ) ) ( not ( = ?auto_195325 ?auto_195327 ) ) ( not ( = ?auto_195325 ?auto_195328 ) ) ( not ( = ?auto_195325 ?auto_195329 ) ) ( not ( = ?auto_195326 ?auto_195327 ) ) ( not ( = ?auto_195326 ?auto_195328 ) ) ( not ( = ?auto_195326 ?auto_195329 ) ) ( not ( = ?auto_195327 ?auto_195328 ) ) ( not ( = ?auto_195327 ?auto_195329 ) ) ( not ( = ?auto_195328 ?auto_195329 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_195328 ?auto_195329 )
      ( !STACK ?auto_195328 ?auto_195327 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195339 - BLOCK
      ?auto_195340 - BLOCK
      ?auto_195341 - BLOCK
      ?auto_195342 - BLOCK
      ?auto_195343 - BLOCK
      ?auto_195344 - BLOCK
      ?auto_195345 - BLOCK
      ?auto_195346 - BLOCK
      ?auto_195347 - BLOCK
    )
    :vars
    (
      ?auto_195348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195347 ?auto_195348 ) ( ON-TABLE ?auto_195339 ) ( ON ?auto_195340 ?auto_195339 ) ( ON ?auto_195341 ?auto_195340 ) ( ON ?auto_195342 ?auto_195341 ) ( ON ?auto_195343 ?auto_195342 ) ( ON ?auto_195344 ?auto_195343 ) ( ON ?auto_195345 ?auto_195344 ) ( not ( = ?auto_195339 ?auto_195340 ) ) ( not ( = ?auto_195339 ?auto_195341 ) ) ( not ( = ?auto_195339 ?auto_195342 ) ) ( not ( = ?auto_195339 ?auto_195343 ) ) ( not ( = ?auto_195339 ?auto_195344 ) ) ( not ( = ?auto_195339 ?auto_195345 ) ) ( not ( = ?auto_195339 ?auto_195346 ) ) ( not ( = ?auto_195339 ?auto_195347 ) ) ( not ( = ?auto_195339 ?auto_195348 ) ) ( not ( = ?auto_195340 ?auto_195341 ) ) ( not ( = ?auto_195340 ?auto_195342 ) ) ( not ( = ?auto_195340 ?auto_195343 ) ) ( not ( = ?auto_195340 ?auto_195344 ) ) ( not ( = ?auto_195340 ?auto_195345 ) ) ( not ( = ?auto_195340 ?auto_195346 ) ) ( not ( = ?auto_195340 ?auto_195347 ) ) ( not ( = ?auto_195340 ?auto_195348 ) ) ( not ( = ?auto_195341 ?auto_195342 ) ) ( not ( = ?auto_195341 ?auto_195343 ) ) ( not ( = ?auto_195341 ?auto_195344 ) ) ( not ( = ?auto_195341 ?auto_195345 ) ) ( not ( = ?auto_195341 ?auto_195346 ) ) ( not ( = ?auto_195341 ?auto_195347 ) ) ( not ( = ?auto_195341 ?auto_195348 ) ) ( not ( = ?auto_195342 ?auto_195343 ) ) ( not ( = ?auto_195342 ?auto_195344 ) ) ( not ( = ?auto_195342 ?auto_195345 ) ) ( not ( = ?auto_195342 ?auto_195346 ) ) ( not ( = ?auto_195342 ?auto_195347 ) ) ( not ( = ?auto_195342 ?auto_195348 ) ) ( not ( = ?auto_195343 ?auto_195344 ) ) ( not ( = ?auto_195343 ?auto_195345 ) ) ( not ( = ?auto_195343 ?auto_195346 ) ) ( not ( = ?auto_195343 ?auto_195347 ) ) ( not ( = ?auto_195343 ?auto_195348 ) ) ( not ( = ?auto_195344 ?auto_195345 ) ) ( not ( = ?auto_195344 ?auto_195346 ) ) ( not ( = ?auto_195344 ?auto_195347 ) ) ( not ( = ?auto_195344 ?auto_195348 ) ) ( not ( = ?auto_195345 ?auto_195346 ) ) ( not ( = ?auto_195345 ?auto_195347 ) ) ( not ( = ?auto_195345 ?auto_195348 ) ) ( not ( = ?auto_195346 ?auto_195347 ) ) ( not ( = ?auto_195346 ?auto_195348 ) ) ( not ( = ?auto_195347 ?auto_195348 ) ) ( CLEAR ?auto_195345 ) ( ON ?auto_195346 ?auto_195347 ) ( CLEAR ?auto_195346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_195339 ?auto_195340 ?auto_195341 ?auto_195342 ?auto_195343 ?auto_195344 ?auto_195345 ?auto_195346 )
      ( MAKE-9PILE ?auto_195339 ?auto_195340 ?auto_195341 ?auto_195342 ?auto_195343 ?auto_195344 ?auto_195345 ?auto_195346 ?auto_195347 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195358 - BLOCK
      ?auto_195359 - BLOCK
      ?auto_195360 - BLOCK
      ?auto_195361 - BLOCK
      ?auto_195362 - BLOCK
      ?auto_195363 - BLOCK
      ?auto_195364 - BLOCK
      ?auto_195365 - BLOCK
      ?auto_195366 - BLOCK
    )
    :vars
    (
      ?auto_195367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195366 ?auto_195367 ) ( ON-TABLE ?auto_195358 ) ( ON ?auto_195359 ?auto_195358 ) ( ON ?auto_195360 ?auto_195359 ) ( ON ?auto_195361 ?auto_195360 ) ( ON ?auto_195362 ?auto_195361 ) ( ON ?auto_195363 ?auto_195362 ) ( ON ?auto_195364 ?auto_195363 ) ( not ( = ?auto_195358 ?auto_195359 ) ) ( not ( = ?auto_195358 ?auto_195360 ) ) ( not ( = ?auto_195358 ?auto_195361 ) ) ( not ( = ?auto_195358 ?auto_195362 ) ) ( not ( = ?auto_195358 ?auto_195363 ) ) ( not ( = ?auto_195358 ?auto_195364 ) ) ( not ( = ?auto_195358 ?auto_195365 ) ) ( not ( = ?auto_195358 ?auto_195366 ) ) ( not ( = ?auto_195358 ?auto_195367 ) ) ( not ( = ?auto_195359 ?auto_195360 ) ) ( not ( = ?auto_195359 ?auto_195361 ) ) ( not ( = ?auto_195359 ?auto_195362 ) ) ( not ( = ?auto_195359 ?auto_195363 ) ) ( not ( = ?auto_195359 ?auto_195364 ) ) ( not ( = ?auto_195359 ?auto_195365 ) ) ( not ( = ?auto_195359 ?auto_195366 ) ) ( not ( = ?auto_195359 ?auto_195367 ) ) ( not ( = ?auto_195360 ?auto_195361 ) ) ( not ( = ?auto_195360 ?auto_195362 ) ) ( not ( = ?auto_195360 ?auto_195363 ) ) ( not ( = ?auto_195360 ?auto_195364 ) ) ( not ( = ?auto_195360 ?auto_195365 ) ) ( not ( = ?auto_195360 ?auto_195366 ) ) ( not ( = ?auto_195360 ?auto_195367 ) ) ( not ( = ?auto_195361 ?auto_195362 ) ) ( not ( = ?auto_195361 ?auto_195363 ) ) ( not ( = ?auto_195361 ?auto_195364 ) ) ( not ( = ?auto_195361 ?auto_195365 ) ) ( not ( = ?auto_195361 ?auto_195366 ) ) ( not ( = ?auto_195361 ?auto_195367 ) ) ( not ( = ?auto_195362 ?auto_195363 ) ) ( not ( = ?auto_195362 ?auto_195364 ) ) ( not ( = ?auto_195362 ?auto_195365 ) ) ( not ( = ?auto_195362 ?auto_195366 ) ) ( not ( = ?auto_195362 ?auto_195367 ) ) ( not ( = ?auto_195363 ?auto_195364 ) ) ( not ( = ?auto_195363 ?auto_195365 ) ) ( not ( = ?auto_195363 ?auto_195366 ) ) ( not ( = ?auto_195363 ?auto_195367 ) ) ( not ( = ?auto_195364 ?auto_195365 ) ) ( not ( = ?auto_195364 ?auto_195366 ) ) ( not ( = ?auto_195364 ?auto_195367 ) ) ( not ( = ?auto_195365 ?auto_195366 ) ) ( not ( = ?auto_195365 ?auto_195367 ) ) ( not ( = ?auto_195366 ?auto_195367 ) ) ( CLEAR ?auto_195364 ) ( ON ?auto_195365 ?auto_195366 ) ( CLEAR ?auto_195365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_195358 ?auto_195359 ?auto_195360 ?auto_195361 ?auto_195362 ?auto_195363 ?auto_195364 ?auto_195365 )
      ( MAKE-9PILE ?auto_195358 ?auto_195359 ?auto_195360 ?auto_195361 ?auto_195362 ?auto_195363 ?auto_195364 ?auto_195365 ?auto_195366 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195377 - BLOCK
      ?auto_195378 - BLOCK
      ?auto_195379 - BLOCK
      ?auto_195380 - BLOCK
      ?auto_195381 - BLOCK
      ?auto_195382 - BLOCK
      ?auto_195383 - BLOCK
      ?auto_195384 - BLOCK
      ?auto_195385 - BLOCK
    )
    :vars
    (
      ?auto_195386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195385 ?auto_195386 ) ( ON-TABLE ?auto_195377 ) ( ON ?auto_195378 ?auto_195377 ) ( ON ?auto_195379 ?auto_195378 ) ( ON ?auto_195380 ?auto_195379 ) ( ON ?auto_195381 ?auto_195380 ) ( ON ?auto_195382 ?auto_195381 ) ( not ( = ?auto_195377 ?auto_195378 ) ) ( not ( = ?auto_195377 ?auto_195379 ) ) ( not ( = ?auto_195377 ?auto_195380 ) ) ( not ( = ?auto_195377 ?auto_195381 ) ) ( not ( = ?auto_195377 ?auto_195382 ) ) ( not ( = ?auto_195377 ?auto_195383 ) ) ( not ( = ?auto_195377 ?auto_195384 ) ) ( not ( = ?auto_195377 ?auto_195385 ) ) ( not ( = ?auto_195377 ?auto_195386 ) ) ( not ( = ?auto_195378 ?auto_195379 ) ) ( not ( = ?auto_195378 ?auto_195380 ) ) ( not ( = ?auto_195378 ?auto_195381 ) ) ( not ( = ?auto_195378 ?auto_195382 ) ) ( not ( = ?auto_195378 ?auto_195383 ) ) ( not ( = ?auto_195378 ?auto_195384 ) ) ( not ( = ?auto_195378 ?auto_195385 ) ) ( not ( = ?auto_195378 ?auto_195386 ) ) ( not ( = ?auto_195379 ?auto_195380 ) ) ( not ( = ?auto_195379 ?auto_195381 ) ) ( not ( = ?auto_195379 ?auto_195382 ) ) ( not ( = ?auto_195379 ?auto_195383 ) ) ( not ( = ?auto_195379 ?auto_195384 ) ) ( not ( = ?auto_195379 ?auto_195385 ) ) ( not ( = ?auto_195379 ?auto_195386 ) ) ( not ( = ?auto_195380 ?auto_195381 ) ) ( not ( = ?auto_195380 ?auto_195382 ) ) ( not ( = ?auto_195380 ?auto_195383 ) ) ( not ( = ?auto_195380 ?auto_195384 ) ) ( not ( = ?auto_195380 ?auto_195385 ) ) ( not ( = ?auto_195380 ?auto_195386 ) ) ( not ( = ?auto_195381 ?auto_195382 ) ) ( not ( = ?auto_195381 ?auto_195383 ) ) ( not ( = ?auto_195381 ?auto_195384 ) ) ( not ( = ?auto_195381 ?auto_195385 ) ) ( not ( = ?auto_195381 ?auto_195386 ) ) ( not ( = ?auto_195382 ?auto_195383 ) ) ( not ( = ?auto_195382 ?auto_195384 ) ) ( not ( = ?auto_195382 ?auto_195385 ) ) ( not ( = ?auto_195382 ?auto_195386 ) ) ( not ( = ?auto_195383 ?auto_195384 ) ) ( not ( = ?auto_195383 ?auto_195385 ) ) ( not ( = ?auto_195383 ?auto_195386 ) ) ( not ( = ?auto_195384 ?auto_195385 ) ) ( not ( = ?auto_195384 ?auto_195386 ) ) ( not ( = ?auto_195385 ?auto_195386 ) ) ( ON ?auto_195384 ?auto_195385 ) ( CLEAR ?auto_195382 ) ( ON ?auto_195383 ?auto_195384 ) ( CLEAR ?auto_195383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195377 ?auto_195378 ?auto_195379 ?auto_195380 ?auto_195381 ?auto_195382 ?auto_195383 )
      ( MAKE-9PILE ?auto_195377 ?auto_195378 ?auto_195379 ?auto_195380 ?auto_195381 ?auto_195382 ?auto_195383 ?auto_195384 ?auto_195385 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195396 - BLOCK
      ?auto_195397 - BLOCK
      ?auto_195398 - BLOCK
      ?auto_195399 - BLOCK
      ?auto_195400 - BLOCK
      ?auto_195401 - BLOCK
      ?auto_195402 - BLOCK
      ?auto_195403 - BLOCK
      ?auto_195404 - BLOCK
    )
    :vars
    (
      ?auto_195405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195404 ?auto_195405 ) ( ON-TABLE ?auto_195396 ) ( ON ?auto_195397 ?auto_195396 ) ( ON ?auto_195398 ?auto_195397 ) ( ON ?auto_195399 ?auto_195398 ) ( ON ?auto_195400 ?auto_195399 ) ( ON ?auto_195401 ?auto_195400 ) ( not ( = ?auto_195396 ?auto_195397 ) ) ( not ( = ?auto_195396 ?auto_195398 ) ) ( not ( = ?auto_195396 ?auto_195399 ) ) ( not ( = ?auto_195396 ?auto_195400 ) ) ( not ( = ?auto_195396 ?auto_195401 ) ) ( not ( = ?auto_195396 ?auto_195402 ) ) ( not ( = ?auto_195396 ?auto_195403 ) ) ( not ( = ?auto_195396 ?auto_195404 ) ) ( not ( = ?auto_195396 ?auto_195405 ) ) ( not ( = ?auto_195397 ?auto_195398 ) ) ( not ( = ?auto_195397 ?auto_195399 ) ) ( not ( = ?auto_195397 ?auto_195400 ) ) ( not ( = ?auto_195397 ?auto_195401 ) ) ( not ( = ?auto_195397 ?auto_195402 ) ) ( not ( = ?auto_195397 ?auto_195403 ) ) ( not ( = ?auto_195397 ?auto_195404 ) ) ( not ( = ?auto_195397 ?auto_195405 ) ) ( not ( = ?auto_195398 ?auto_195399 ) ) ( not ( = ?auto_195398 ?auto_195400 ) ) ( not ( = ?auto_195398 ?auto_195401 ) ) ( not ( = ?auto_195398 ?auto_195402 ) ) ( not ( = ?auto_195398 ?auto_195403 ) ) ( not ( = ?auto_195398 ?auto_195404 ) ) ( not ( = ?auto_195398 ?auto_195405 ) ) ( not ( = ?auto_195399 ?auto_195400 ) ) ( not ( = ?auto_195399 ?auto_195401 ) ) ( not ( = ?auto_195399 ?auto_195402 ) ) ( not ( = ?auto_195399 ?auto_195403 ) ) ( not ( = ?auto_195399 ?auto_195404 ) ) ( not ( = ?auto_195399 ?auto_195405 ) ) ( not ( = ?auto_195400 ?auto_195401 ) ) ( not ( = ?auto_195400 ?auto_195402 ) ) ( not ( = ?auto_195400 ?auto_195403 ) ) ( not ( = ?auto_195400 ?auto_195404 ) ) ( not ( = ?auto_195400 ?auto_195405 ) ) ( not ( = ?auto_195401 ?auto_195402 ) ) ( not ( = ?auto_195401 ?auto_195403 ) ) ( not ( = ?auto_195401 ?auto_195404 ) ) ( not ( = ?auto_195401 ?auto_195405 ) ) ( not ( = ?auto_195402 ?auto_195403 ) ) ( not ( = ?auto_195402 ?auto_195404 ) ) ( not ( = ?auto_195402 ?auto_195405 ) ) ( not ( = ?auto_195403 ?auto_195404 ) ) ( not ( = ?auto_195403 ?auto_195405 ) ) ( not ( = ?auto_195404 ?auto_195405 ) ) ( ON ?auto_195403 ?auto_195404 ) ( CLEAR ?auto_195401 ) ( ON ?auto_195402 ?auto_195403 ) ( CLEAR ?auto_195402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195396 ?auto_195397 ?auto_195398 ?auto_195399 ?auto_195400 ?auto_195401 ?auto_195402 )
      ( MAKE-9PILE ?auto_195396 ?auto_195397 ?auto_195398 ?auto_195399 ?auto_195400 ?auto_195401 ?auto_195402 ?auto_195403 ?auto_195404 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195415 - BLOCK
      ?auto_195416 - BLOCK
      ?auto_195417 - BLOCK
      ?auto_195418 - BLOCK
      ?auto_195419 - BLOCK
      ?auto_195420 - BLOCK
      ?auto_195421 - BLOCK
      ?auto_195422 - BLOCK
      ?auto_195423 - BLOCK
    )
    :vars
    (
      ?auto_195424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195423 ?auto_195424 ) ( ON-TABLE ?auto_195415 ) ( ON ?auto_195416 ?auto_195415 ) ( ON ?auto_195417 ?auto_195416 ) ( ON ?auto_195418 ?auto_195417 ) ( ON ?auto_195419 ?auto_195418 ) ( not ( = ?auto_195415 ?auto_195416 ) ) ( not ( = ?auto_195415 ?auto_195417 ) ) ( not ( = ?auto_195415 ?auto_195418 ) ) ( not ( = ?auto_195415 ?auto_195419 ) ) ( not ( = ?auto_195415 ?auto_195420 ) ) ( not ( = ?auto_195415 ?auto_195421 ) ) ( not ( = ?auto_195415 ?auto_195422 ) ) ( not ( = ?auto_195415 ?auto_195423 ) ) ( not ( = ?auto_195415 ?auto_195424 ) ) ( not ( = ?auto_195416 ?auto_195417 ) ) ( not ( = ?auto_195416 ?auto_195418 ) ) ( not ( = ?auto_195416 ?auto_195419 ) ) ( not ( = ?auto_195416 ?auto_195420 ) ) ( not ( = ?auto_195416 ?auto_195421 ) ) ( not ( = ?auto_195416 ?auto_195422 ) ) ( not ( = ?auto_195416 ?auto_195423 ) ) ( not ( = ?auto_195416 ?auto_195424 ) ) ( not ( = ?auto_195417 ?auto_195418 ) ) ( not ( = ?auto_195417 ?auto_195419 ) ) ( not ( = ?auto_195417 ?auto_195420 ) ) ( not ( = ?auto_195417 ?auto_195421 ) ) ( not ( = ?auto_195417 ?auto_195422 ) ) ( not ( = ?auto_195417 ?auto_195423 ) ) ( not ( = ?auto_195417 ?auto_195424 ) ) ( not ( = ?auto_195418 ?auto_195419 ) ) ( not ( = ?auto_195418 ?auto_195420 ) ) ( not ( = ?auto_195418 ?auto_195421 ) ) ( not ( = ?auto_195418 ?auto_195422 ) ) ( not ( = ?auto_195418 ?auto_195423 ) ) ( not ( = ?auto_195418 ?auto_195424 ) ) ( not ( = ?auto_195419 ?auto_195420 ) ) ( not ( = ?auto_195419 ?auto_195421 ) ) ( not ( = ?auto_195419 ?auto_195422 ) ) ( not ( = ?auto_195419 ?auto_195423 ) ) ( not ( = ?auto_195419 ?auto_195424 ) ) ( not ( = ?auto_195420 ?auto_195421 ) ) ( not ( = ?auto_195420 ?auto_195422 ) ) ( not ( = ?auto_195420 ?auto_195423 ) ) ( not ( = ?auto_195420 ?auto_195424 ) ) ( not ( = ?auto_195421 ?auto_195422 ) ) ( not ( = ?auto_195421 ?auto_195423 ) ) ( not ( = ?auto_195421 ?auto_195424 ) ) ( not ( = ?auto_195422 ?auto_195423 ) ) ( not ( = ?auto_195422 ?auto_195424 ) ) ( not ( = ?auto_195423 ?auto_195424 ) ) ( ON ?auto_195422 ?auto_195423 ) ( ON ?auto_195421 ?auto_195422 ) ( CLEAR ?auto_195419 ) ( ON ?auto_195420 ?auto_195421 ) ( CLEAR ?auto_195420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195415 ?auto_195416 ?auto_195417 ?auto_195418 ?auto_195419 ?auto_195420 )
      ( MAKE-9PILE ?auto_195415 ?auto_195416 ?auto_195417 ?auto_195418 ?auto_195419 ?auto_195420 ?auto_195421 ?auto_195422 ?auto_195423 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195434 - BLOCK
      ?auto_195435 - BLOCK
      ?auto_195436 - BLOCK
      ?auto_195437 - BLOCK
      ?auto_195438 - BLOCK
      ?auto_195439 - BLOCK
      ?auto_195440 - BLOCK
      ?auto_195441 - BLOCK
      ?auto_195442 - BLOCK
    )
    :vars
    (
      ?auto_195443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195442 ?auto_195443 ) ( ON-TABLE ?auto_195434 ) ( ON ?auto_195435 ?auto_195434 ) ( ON ?auto_195436 ?auto_195435 ) ( ON ?auto_195437 ?auto_195436 ) ( ON ?auto_195438 ?auto_195437 ) ( not ( = ?auto_195434 ?auto_195435 ) ) ( not ( = ?auto_195434 ?auto_195436 ) ) ( not ( = ?auto_195434 ?auto_195437 ) ) ( not ( = ?auto_195434 ?auto_195438 ) ) ( not ( = ?auto_195434 ?auto_195439 ) ) ( not ( = ?auto_195434 ?auto_195440 ) ) ( not ( = ?auto_195434 ?auto_195441 ) ) ( not ( = ?auto_195434 ?auto_195442 ) ) ( not ( = ?auto_195434 ?auto_195443 ) ) ( not ( = ?auto_195435 ?auto_195436 ) ) ( not ( = ?auto_195435 ?auto_195437 ) ) ( not ( = ?auto_195435 ?auto_195438 ) ) ( not ( = ?auto_195435 ?auto_195439 ) ) ( not ( = ?auto_195435 ?auto_195440 ) ) ( not ( = ?auto_195435 ?auto_195441 ) ) ( not ( = ?auto_195435 ?auto_195442 ) ) ( not ( = ?auto_195435 ?auto_195443 ) ) ( not ( = ?auto_195436 ?auto_195437 ) ) ( not ( = ?auto_195436 ?auto_195438 ) ) ( not ( = ?auto_195436 ?auto_195439 ) ) ( not ( = ?auto_195436 ?auto_195440 ) ) ( not ( = ?auto_195436 ?auto_195441 ) ) ( not ( = ?auto_195436 ?auto_195442 ) ) ( not ( = ?auto_195436 ?auto_195443 ) ) ( not ( = ?auto_195437 ?auto_195438 ) ) ( not ( = ?auto_195437 ?auto_195439 ) ) ( not ( = ?auto_195437 ?auto_195440 ) ) ( not ( = ?auto_195437 ?auto_195441 ) ) ( not ( = ?auto_195437 ?auto_195442 ) ) ( not ( = ?auto_195437 ?auto_195443 ) ) ( not ( = ?auto_195438 ?auto_195439 ) ) ( not ( = ?auto_195438 ?auto_195440 ) ) ( not ( = ?auto_195438 ?auto_195441 ) ) ( not ( = ?auto_195438 ?auto_195442 ) ) ( not ( = ?auto_195438 ?auto_195443 ) ) ( not ( = ?auto_195439 ?auto_195440 ) ) ( not ( = ?auto_195439 ?auto_195441 ) ) ( not ( = ?auto_195439 ?auto_195442 ) ) ( not ( = ?auto_195439 ?auto_195443 ) ) ( not ( = ?auto_195440 ?auto_195441 ) ) ( not ( = ?auto_195440 ?auto_195442 ) ) ( not ( = ?auto_195440 ?auto_195443 ) ) ( not ( = ?auto_195441 ?auto_195442 ) ) ( not ( = ?auto_195441 ?auto_195443 ) ) ( not ( = ?auto_195442 ?auto_195443 ) ) ( ON ?auto_195441 ?auto_195442 ) ( ON ?auto_195440 ?auto_195441 ) ( CLEAR ?auto_195438 ) ( ON ?auto_195439 ?auto_195440 ) ( CLEAR ?auto_195439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195434 ?auto_195435 ?auto_195436 ?auto_195437 ?auto_195438 ?auto_195439 )
      ( MAKE-9PILE ?auto_195434 ?auto_195435 ?auto_195436 ?auto_195437 ?auto_195438 ?auto_195439 ?auto_195440 ?auto_195441 ?auto_195442 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195453 - BLOCK
      ?auto_195454 - BLOCK
      ?auto_195455 - BLOCK
      ?auto_195456 - BLOCK
      ?auto_195457 - BLOCK
      ?auto_195458 - BLOCK
      ?auto_195459 - BLOCK
      ?auto_195460 - BLOCK
      ?auto_195461 - BLOCK
    )
    :vars
    (
      ?auto_195462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195461 ?auto_195462 ) ( ON-TABLE ?auto_195453 ) ( ON ?auto_195454 ?auto_195453 ) ( ON ?auto_195455 ?auto_195454 ) ( ON ?auto_195456 ?auto_195455 ) ( not ( = ?auto_195453 ?auto_195454 ) ) ( not ( = ?auto_195453 ?auto_195455 ) ) ( not ( = ?auto_195453 ?auto_195456 ) ) ( not ( = ?auto_195453 ?auto_195457 ) ) ( not ( = ?auto_195453 ?auto_195458 ) ) ( not ( = ?auto_195453 ?auto_195459 ) ) ( not ( = ?auto_195453 ?auto_195460 ) ) ( not ( = ?auto_195453 ?auto_195461 ) ) ( not ( = ?auto_195453 ?auto_195462 ) ) ( not ( = ?auto_195454 ?auto_195455 ) ) ( not ( = ?auto_195454 ?auto_195456 ) ) ( not ( = ?auto_195454 ?auto_195457 ) ) ( not ( = ?auto_195454 ?auto_195458 ) ) ( not ( = ?auto_195454 ?auto_195459 ) ) ( not ( = ?auto_195454 ?auto_195460 ) ) ( not ( = ?auto_195454 ?auto_195461 ) ) ( not ( = ?auto_195454 ?auto_195462 ) ) ( not ( = ?auto_195455 ?auto_195456 ) ) ( not ( = ?auto_195455 ?auto_195457 ) ) ( not ( = ?auto_195455 ?auto_195458 ) ) ( not ( = ?auto_195455 ?auto_195459 ) ) ( not ( = ?auto_195455 ?auto_195460 ) ) ( not ( = ?auto_195455 ?auto_195461 ) ) ( not ( = ?auto_195455 ?auto_195462 ) ) ( not ( = ?auto_195456 ?auto_195457 ) ) ( not ( = ?auto_195456 ?auto_195458 ) ) ( not ( = ?auto_195456 ?auto_195459 ) ) ( not ( = ?auto_195456 ?auto_195460 ) ) ( not ( = ?auto_195456 ?auto_195461 ) ) ( not ( = ?auto_195456 ?auto_195462 ) ) ( not ( = ?auto_195457 ?auto_195458 ) ) ( not ( = ?auto_195457 ?auto_195459 ) ) ( not ( = ?auto_195457 ?auto_195460 ) ) ( not ( = ?auto_195457 ?auto_195461 ) ) ( not ( = ?auto_195457 ?auto_195462 ) ) ( not ( = ?auto_195458 ?auto_195459 ) ) ( not ( = ?auto_195458 ?auto_195460 ) ) ( not ( = ?auto_195458 ?auto_195461 ) ) ( not ( = ?auto_195458 ?auto_195462 ) ) ( not ( = ?auto_195459 ?auto_195460 ) ) ( not ( = ?auto_195459 ?auto_195461 ) ) ( not ( = ?auto_195459 ?auto_195462 ) ) ( not ( = ?auto_195460 ?auto_195461 ) ) ( not ( = ?auto_195460 ?auto_195462 ) ) ( not ( = ?auto_195461 ?auto_195462 ) ) ( ON ?auto_195460 ?auto_195461 ) ( ON ?auto_195459 ?auto_195460 ) ( ON ?auto_195458 ?auto_195459 ) ( CLEAR ?auto_195456 ) ( ON ?auto_195457 ?auto_195458 ) ( CLEAR ?auto_195457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195453 ?auto_195454 ?auto_195455 ?auto_195456 ?auto_195457 )
      ( MAKE-9PILE ?auto_195453 ?auto_195454 ?auto_195455 ?auto_195456 ?auto_195457 ?auto_195458 ?auto_195459 ?auto_195460 ?auto_195461 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195472 - BLOCK
      ?auto_195473 - BLOCK
      ?auto_195474 - BLOCK
      ?auto_195475 - BLOCK
      ?auto_195476 - BLOCK
      ?auto_195477 - BLOCK
      ?auto_195478 - BLOCK
      ?auto_195479 - BLOCK
      ?auto_195480 - BLOCK
    )
    :vars
    (
      ?auto_195481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195480 ?auto_195481 ) ( ON-TABLE ?auto_195472 ) ( ON ?auto_195473 ?auto_195472 ) ( ON ?auto_195474 ?auto_195473 ) ( ON ?auto_195475 ?auto_195474 ) ( not ( = ?auto_195472 ?auto_195473 ) ) ( not ( = ?auto_195472 ?auto_195474 ) ) ( not ( = ?auto_195472 ?auto_195475 ) ) ( not ( = ?auto_195472 ?auto_195476 ) ) ( not ( = ?auto_195472 ?auto_195477 ) ) ( not ( = ?auto_195472 ?auto_195478 ) ) ( not ( = ?auto_195472 ?auto_195479 ) ) ( not ( = ?auto_195472 ?auto_195480 ) ) ( not ( = ?auto_195472 ?auto_195481 ) ) ( not ( = ?auto_195473 ?auto_195474 ) ) ( not ( = ?auto_195473 ?auto_195475 ) ) ( not ( = ?auto_195473 ?auto_195476 ) ) ( not ( = ?auto_195473 ?auto_195477 ) ) ( not ( = ?auto_195473 ?auto_195478 ) ) ( not ( = ?auto_195473 ?auto_195479 ) ) ( not ( = ?auto_195473 ?auto_195480 ) ) ( not ( = ?auto_195473 ?auto_195481 ) ) ( not ( = ?auto_195474 ?auto_195475 ) ) ( not ( = ?auto_195474 ?auto_195476 ) ) ( not ( = ?auto_195474 ?auto_195477 ) ) ( not ( = ?auto_195474 ?auto_195478 ) ) ( not ( = ?auto_195474 ?auto_195479 ) ) ( not ( = ?auto_195474 ?auto_195480 ) ) ( not ( = ?auto_195474 ?auto_195481 ) ) ( not ( = ?auto_195475 ?auto_195476 ) ) ( not ( = ?auto_195475 ?auto_195477 ) ) ( not ( = ?auto_195475 ?auto_195478 ) ) ( not ( = ?auto_195475 ?auto_195479 ) ) ( not ( = ?auto_195475 ?auto_195480 ) ) ( not ( = ?auto_195475 ?auto_195481 ) ) ( not ( = ?auto_195476 ?auto_195477 ) ) ( not ( = ?auto_195476 ?auto_195478 ) ) ( not ( = ?auto_195476 ?auto_195479 ) ) ( not ( = ?auto_195476 ?auto_195480 ) ) ( not ( = ?auto_195476 ?auto_195481 ) ) ( not ( = ?auto_195477 ?auto_195478 ) ) ( not ( = ?auto_195477 ?auto_195479 ) ) ( not ( = ?auto_195477 ?auto_195480 ) ) ( not ( = ?auto_195477 ?auto_195481 ) ) ( not ( = ?auto_195478 ?auto_195479 ) ) ( not ( = ?auto_195478 ?auto_195480 ) ) ( not ( = ?auto_195478 ?auto_195481 ) ) ( not ( = ?auto_195479 ?auto_195480 ) ) ( not ( = ?auto_195479 ?auto_195481 ) ) ( not ( = ?auto_195480 ?auto_195481 ) ) ( ON ?auto_195479 ?auto_195480 ) ( ON ?auto_195478 ?auto_195479 ) ( ON ?auto_195477 ?auto_195478 ) ( CLEAR ?auto_195475 ) ( ON ?auto_195476 ?auto_195477 ) ( CLEAR ?auto_195476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195472 ?auto_195473 ?auto_195474 ?auto_195475 ?auto_195476 )
      ( MAKE-9PILE ?auto_195472 ?auto_195473 ?auto_195474 ?auto_195475 ?auto_195476 ?auto_195477 ?auto_195478 ?auto_195479 ?auto_195480 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195491 - BLOCK
      ?auto_195492 - BLOCK
      ?auto_195493 - BLOCK
      ?auto_195494 - BLOCK
      ?auto_195495 - BLOCK
      ?auto_195496 - BLOCK
      ?auto_195497 - BLOCK
      ?auto_195498 - BLOCK
      ?auto_195499 - BLOCK
    )
    :vars
    (
      ?auto_195500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195499 ?auto_195500 ) ( ON-TABLE ?auto_195491 ) ( ON ?auto_195492 ?auto_195491 ) ( ON ?auto_195493 ?auto_195492 ) ( not ( = ?auto_195491 ?auto_195492 ) ) ( not ( = ?auto_195491 ?auto_195493 ) ) ( not ( = ?auto_195491 ?auto_195494 ) ) ( not ( = ?auto_195491 ?auto_195495 ) ) ( not ( = ?auto_195491 ?auto_195496 ) ) ( not ( = ?auto_195491 ?auto_195497 ) ) ( not ( = ?auto_195491 ?auto_195498 ) ) ( not ( = ?auto_195491 ?auto_195499 ) ) ( not ( = ?auto_195491 ?auto_195500 ) ) ( not ( = ?auto_195492 ?auto_195493 ) ) ( not ( = ?auto_195492 ?auto_195494 ) ) ( not ( = ?auto_195492 ?auto_195495 ) ) ( not ( = ?auto_195492 ?auto_195496 ) ) ( not ( = ?auto_195492 ?auto_195497 ) ) ( not ( = ?auto_195492 ?auto_195498 ) ) ( not ( = ?auto_195492 ?auto_195499 ) ) ( not ( = ?auto_195492 ?auto_195500 ) ) ( not ( = ?auto_195493 ?auto_195494 ) ) ( not ( = ?auto_195493 ?auto_195495 ) ) ( not ( = ?auto_195493 ?auto_195496 ) ) ( not ( = ?auto_195493 ?auto_195497 ) ) ( not ( = ?auto_195493 ?auto_195498 ) ) ( not ( = ?auto_195493 ?auto_195499 ) ) ( not ( = ?auto_195493 ?auto_195500 ) ) ( not ( = ?auto_195494 ?auto_195495 ) ) ( not ( = ?auto_195494 ?auto_195496 ) ) ( not ( = ?auto_195494 ?auto_195497 ) ) ( not ( = ?auto_195494 ?auto_195498 ) ) ( not ( = ?auto_195494 ?auto_195499 ) ) ( not ( = ?auto_195494 ?auto_195500 ) ) ( not ( = ?auto_195495 ?auto_195496 ) ) ( not ( = ?auto_195495 ?auto_195497 ) ) ( not ( = ?auto_195495 ?auto_195498 ) ) ( not ( = ?auto_195495 ?auto_195499 ) ) ( not ( = ?auto_195495 ?auto_195500 ) ) ( not ( = ?auto_195496 ?auto_195497 ) ) ( not ( = ?auto_195496 ?auto_195498 ) ) ( not ( = ?auto_195496 ?auto_195499 ) ) ( not ( = ?auto_195496 ?auto_195500 ) ) ( not ( = ?auto_195497 ?auto_195498 ) ) ( not ( = ?auto_195497 ?auto_195499 ) ) ( not ( = ?auto_195497 ?auto_195500 ) ) ( not ( = ?auto_195498 ?auto_195499 ) ) ( not ( = ?auto_195498 ?auto_195500 ) ) ( not ( = ?auto_195499 ?auto_195500 ) ) ( ON ?auto_195498 ?auto_195499 ) ( ON ?auto_195497 ?auto_195498 ) ( ON ?auto_195496 ?auto_195497 ) ( ON ?auto_195495 ?auto_195496 ) ( CLEAR ?auto_195493 ) ( ON ?auto_195494 ?auto_195495 ) ( CLEAR ?auto_195494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195491 ?auto_195492 ?auto_195493 ?auto_195494 )
      ( MAKE-9PILE ?auto_195491 ?auto_195492 ?auto_195493 ?auto_195494 ?auto_195495 ?auto_195496 ?auto_195497 ?auto_195498 ?auto_195499 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195510 - BLOCK
      ?auto_195511 - BLOCK
      ?auto_195512 - BLOCK
      ?auto_195513 - BLOCK
      ?auto_195514 - BLOCK
      ?auto_195515 - BLOCK
      ?auto_195516 - BLOCK
      ?auto_195517 - BLOCK
      ?auto_195518 - BLOCK
    )
    :vars
    (
      ?auto_195519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195518 ?auto_195519 ) ( ON-TABLE ?auto_195510 ) ( ON ?auto_195511 ?auto_195510 ) ( ON ?auto_195512 ?auto_195511 ) ( not ( = ?auto_195510 ?auto_195511 ) ) ( not ( = ?auto_195510 ?auto_195512 ) ) ( not ( = ?auto_195510 ?auto_195513 ) ) ( not ( = ?auto_195510 ?auto_195514 ) ) ( not ( = ?auto_195510 ?auto_195515 ) ) ( not ( = ?auto_195510 ?auto_195516 ) ) ( not ( = ?auto_195510 ?auto_195517 ) ) ( not ( = ?auto_195510 ?auto_195518 ) ) ( not ( = ?auto_195510 ?auto_195519 ) ) ( not ( = ?auto_195511 ?auto_195512 ) ) ( not ( = ?auto_195511 ?auto_195513 ) ) ( not ( = ?auto_195511 ?auto_195514 ) ) ( not ( = ?auto_195511 ?auto_195515 ) ) ( not ( = ?auto_195511 ?auto_195516 ) ) ( not ( = ?auto_195511 ?auto_195517 ) ) ( not ( = ?auto_195511 ?auto_195518 ) ) ( not ( = ?auto_195511 ?auto_195519 ) ) ( not ( = ?auto_195512 ?auto_195513 ) ) ( not ( = ?auto_195512 ?auto_195514 ) ) ( not ( = ?auto_195512 ?auto_195515 ) ) ( not ( = ?auto_195512 ?auto_195516 ) ) ( not ( = ?auto_195512 ?auto_195517 ) ) ( not ( = ?auto_195512 ?auto_195518 ) ) ( not ( = ?auto_195512 ?auto_195519 ) ) ( not ( = ?auto_195513 ?auto_195514 ) ) ( not ( = ?auto_195513 ?auto_195515 ) ) ( not ( = ?auto_195513 ?auto_195516 ) ) ( not ( = ?auto_195513 ?auto_195517 ) ) ( not ( = ?auto_195513 ?auto_195518 ) ) ( not ( = ?auto_195513 ?auto_195519 ) ) ( not ( = ?auto_195514 ?auto_195515 ) ) ( not ( = ?auto_195514 ?auto_195516 ) ) ( not ( = ?auto_195514 ?auto_195517 ) ) ( not ( = ?auto_195514 ?auto_195518 ) ) ( not ( = ?auto_195514 ?auto_195519 ) ) ( not ( = ?auto_195515 ?auto_195516 ) ) ( not ( = ?auto_195515 ?auto_195517 ) ) ( not ( = ?auto_195515 ?auto_195518 ) ) ( not ( = ?auto_195515 ?auto_195519 ) ) ( not ( = ?auto_195516 ?auto_195517 ) ) ( not ( = ?auto_195516 ?auto_195518 ) ) ( not ( = ?auto_195516 ?auto_195519 ) ) ( not ( = ?auto_195517 ?auto_195518 ) ) ( not ( = ?auto_195517 ?auto_195519 ) ) ( not ( = ?auto_195518 ?auto_195519 ) ) ( ON ?auto_195517 ?auto_195518 ) ( ON ?auto_195516 ?auto_195517 ) ( ON ?auto_195515 ?auto_195516 ) ( ON ?auto_195514 ?auto_195515 ) ( CLEAR ?auto_195512 ) ( ON ?auto_195513 ?auto_195514 ) ( CLEAR ?auto_195513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195510 ?auto_195511 ?auto_195512 ?auto_195513 )
      ( MAKE-9PILE ?auto_195510 ?auto_195511 ?auto_195512 ?auto_195513 ?auto_195514 ?auto_195515 ?auto_195516 ?auto_195517 ?auto_195518 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195529 - BLOCK
      ?auto_195530 - BLOCK
      ?auto_195531 - BLOCK
      ?auto_195532 - BLOCK
      ?auto_195533 - BLOCK
      ?auto_195534 - BLOCK
      ?auto_195535 - BLOCK
      ?auto_195536 - BLOCK
      ?auto_195537 - BLOCK
    )
    :vars
    (
      ?auto_195538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195537 ?auto_195538 ) ( ON-TABLE ?auto_195529 ) ( ON ?auto_195530 ?auto_195529 ) ( not ( = ?auto_195529 ?auto_195530 ) ) ( not ( = ?auto_195529 ?auto_195531 ) ) ( not ( = ?auto_195529 ?auto_195532 ) ) ( not ( = ?auto_195529 ?auto_195533 ) ) ( not ( = ?auto_195529 ?auto_195534 ) ) ( not ( = ?auto_195529 ?auto_195535 ) ) ( not ( = ?auto_195529 ?auto_195536 ) ) ( not ( = ?auto_195529 ?auto_195537 ) ) ( not ( = ?auto_195529 ?auto_195538 ) ) ( not ( = ?auto_195530 ?auto_195531 ) ) ( not ( = ?auto_195530 ?auto_195532 ) ) ( not ( = ?auto_195530 ?auto_195533 ) ) ( not ( = ?auto_195530 ?auto_195534 ) ) ( not ( = ?auto_195530 ?auto_195535 ) ) ( not ( = ?auto_195530 ?auto_195536 ) ) ( not ( = ?auto_195530 ?auto_195537 ) ) ( not ( = ?auto_195530 ?auto_195538 ) ) ( not ( = ?auto_195531 ?auto_195532 ) ) ( not ( = ?auto_195531 ?auto_195533 ) ) ( not ( = ?auto_195531 ?auto_195534 ) ) ( not ( = ?auto_195531 ?auto_195535 ) ) ( not ( = ?auto_195531 ?auto_195536 ) ) ( not ( = ?auto_195531 ?auto_195537 ) ) ( not ( = ?auto_195531 ?auto_195538 ) ) ( not ( = ?auto_195532 ?auto_195533 ) ) ( not ( = ?auto_195532 ?auto_195534 ) ) ( not ( = ?auto_195532 ?auto_195535 ) ) ( not ( = ?auto_195532 ?auto_195536 ) ) ( not ( = ?auto_195532 ?auto_195537 ) ) ( not ( = ?auto_195532 ?auto_195538 ) ) ( not ( = ?auto_195533 ?auto_195534 ) ) ( not ( = ?auto_195533 ?auto_195535 ) ) ( not ( = ?auto_195533 ?auto_195536 ) ) ( not ( = ?auto_195533 ?auto_195537 ) ) ( not ( = ?auto_195533 ?auto_195538 ) ) ( not ( = ?auto_195534 ?auto_195535 ) ) ( not ( = ?auto_195534 ?auto_195536 ) ) ( not ( = ?auto_195534 ?auto_195537 ) ) ( not ( = ?auto_195534 ?auto_195538 ) ) ( not ( = ?auto_195535 ?auto_195536 ) ) ( not ( = ?auto_195535 ?auto_195537 ) ) ( not ( = ?auto_195535 ?auto_195538 ) ) ( not ( = ?auto_195536 ?auto_195537 ) ) ( not ( = ?auto_195536 ?auto_195538 ) ) ( not ( = ?auto_195537 ?auto_195538 ) ) ( ON ?auto_195536 ?auto_195537 ) ( ON ?auto_195535 ?auto_195536 ) ( ON ?auto_195534 ?auto_195535 ) ( ON ?auto_195533 ?auto_195534 ) ( ON ?auto_195532 ?auto_195533 ) ( CLEAR ?auto_195530 ) ( ON ?auto_195531 ?auto_195532 ) ( CLEAR ?auto_195531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195529 ?auto_195530 ?auto_195531 )
      ( MAKE-9PILE ?auto_195529 ?auto_195530 ?auto_195531 ?auto_195532 ?auto_195533 ?auto_195534 ?auto_195535 ?auto_195536 ?auto_195537 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195548 - BLOCK
      ?auto_195549 - BLOCK
      ?auto_195550 - BLOCK
      ?auto_195551 - BLOCK
      ?auto_195552 - BLOCK
      ?auto_195553 - BLOCK
      ?auto_195554 - BLOCK
      ?auto_195555 - BLOCK
      ?auto_195556 - BLOCK
    )
    :vars
    (
      ?auto_195557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195556 ?auto_195557 ) ( ON-TABLE ?auto_195548 ) ( ON ?auto_195549 ?auto_195548 ) ( not ( = ?auto_195548 ?auto_195549 ) ) ( not ( = ?auto_195548 ?auto_195550 ) ) ( not ( = ?auto_195548 ?auto_195551 ) ) ( not ( = ?auto_195548 ?auto_195552 ) ) ( not ( = ?auto_195548 ?auto_195553 ) ) ( not ( = ?auto_195548 ?auto_195554 ) ) ( not ( = ?auto_195548 ?auto_195555 ) ) ( not ( = ?auto_195548 ?auto_195556 ) ) ( not ( = ?auto_195548 ?auto_195557 ) ) ( not ( = ?auto_195549 ?auto_195550 ) ) ( not ( = ?auto_195549 ?auto_195551 ) ) ( not ( = ?auto_195549 ?auto_195552 ) ) ( not ( = ?auto_195549 ?auto_195553 ) ) ( not ( = ?auto_195549 ?auto_195554 ) ) ( not ( = ?auto_195549 ?auto_195555 ) ) ( not ( = ?auto_195549 ?auto_195556 ) ) ( not ( = ?auto_195549 ?auto_195557 ) ) ( not ( = ?auto_195550 ?auto_195551 ) ) ( not ( = ?auto_195550 ?auto_195552 ) ) ( not ( = ?auto_195550 ?auto_195553 ) ) ( not ( = ?auto_195550 ?auto_195554 ) ) ( not ( = ?auto_195550 ?auto_195555 ) ) ( not ( = ?auto_195550 ?auto_195556 ) ) ( not ( = ?auto_195550 ?auto_195557 ) ) ( not ( = ?auto_195551 ?auto_195552 ) ) ( not ( = ?auto_195551 ?auto_195553 ) ) ( not ( = ?auto_195551 ?auto_195554 ) ) ( not ( = ?auto_195551 ?auto_195555 ) ) ( not ( = ?auto_195551 ?auto_195556 ) ) ( not ( = ?auto_195551 ?auto_195557 ) ) ( not ( = ?auto_195552 ?auto_195553 ) ) ( not ( = ?auto_195552 ?auto_195554 ) ) ( not ( = ?auto_195552 ?auto_195555 ) ) ( not ( = ?auto_195552 ?auto_195556 ) ) ( not ( = ?auto_195552 ?auto_195557 ) ) ( not ( = ?auto_195553 ?auto_195554 ) ) ( not ( = ?auto_195553 ?auto_195555 ) ) ( not ( = ?auto_195553 ?auto_195556 ) ) ( not ( = ?auto_195553 ?auto_195557 ) ) ( not ( = ?auto_195554 ?auto_195555 ) ) ( not ( = ?auto_195554 ?auto_195556 ) ) ( not ( = ?auto_195554 ?auto_195557 ) ) ( not ( = ?auto_195555 ?auto_195556 ) ) ( not ( = ?auto_195555 ?auto_195557 ) ) ( not ( = ?auto_195556 ?auto_195557 ) ) ( ON ?auto_195555 ?auto_195556 ) ( ON ?auto_195554 ?auto_195555 ) ( ON ?auto_195553 ?auto_195554 ) ( ON ?auto_195552 ?auto_195553 ) ( ON ?auto_195551 ?auto_195552 ) ( CLEAR ?auto_195549 ) ( ON ?auto_195550 ?auto_195551 ) ( CLEAR ?auto_195550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195548 ?auto_195549 ?auto_195550 )
      ( MAKE-9PILE ?auto_195548 ?auto_195549 ?auto_195550 ?auto_195551 ?auto_195552 ?auto_195553 ?auto_195554 ?auto_195555 ?auto_195556 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195567 - BLOCK
      ?auto_195568 - BLOCK
      ?auto_195569 - BLOCK
      ?auto_195570 - BLOCK
      ?auto_195571 - BLOCK
      ?auto_195572 - BLOCK
      ?auto_195573 - BLOCK
      ?auto_195574 - BLOCK
      ?auto_195575 - BLOCK
    )
    :vars
    (
      ?auto_195576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195575 ?auto_195576 ) ( ON-TABLE ?auto_195567 ) ( not ( = ?auto_195567 ?auto_195568 ) ) ( not ( = ?auto_195567 ?auto_195569 ) ) ( not ( = ?auto_195567 ?auto_195570 ) ) ( not ( = ?auto_195567 ?auto_195571 ) ) ( not ( = ?auto_195567 ?auto_195572 ) ) ( not ( = ?auto_195567 ?auto_195573 ) ) ( not ( = ?auto_195567 ?auto_195574 ) ) ( not ( = ?auto_195567 ?auto_195575 ) ) ( not ( = ?auto_195567 ?auto_195576 ) ) ( not ( = ?auto_195568 ?auto_195569 ) ) ( not ( = ?auto_195568 ?auto_195570 ) ) ( not ( = ?auto_195568 ?auto_195571 ) ) ( not ( = ?auto_195568 ?auto_195572 ) ) ( not ( = ?auto_195568 ?auto_195573 ) ) ( not ( = ?auto_195568 ?auto_195574 ) ) ( not ( = ?auto_195568 ?auto_195575 ) ) ( not ( = ?auto_195568 ?auto_195576 ) ) ( not ( = ?auto_195569 ?auto_195570 ) ) ( not ( = ?auto_195569 ?auto_195571 ) ) ( not ( = ?auto_195569 ?auto_195572 ) ) ( not ( = ?auto_195569 ?auto_195573 ) ) ( not ( = ?auto_195569 ?auto_195574 ) ) ( not ( = ?auto_195569 ?auto_195575 ) ) ( not ( = ?auto_195569 ?auto_195576 ) ) ( not ( = ?auto_195570 ?auto_195571 ) ) ( not ( = ?auto_195570 ?auto_195572 ) ) ( not ( = ?auto_195570 ?auto_195573 ) ) ( not ( = ?auto_195570 ?auto_195574 ) ) ( not ( = ?auto_195570 ?auto_195575 ) ) ( not ( = ?auto_195570 ?auto_195576 ) ) ( not ( = ?auto_195571 ?auto_195572 ) ) ( not ( = ?auto_195571 ?auto_195573 ) ) ( not ( = ?auto_195571 ?auto_195574 ) ) ( not ( = ?auto_195571 ?auto_195575 ) ) ( not ( = ?auto_195571 ?auto_195576 ) ) ( not ( = ?auto_195572 ?auto_195573 ) ) ( not ( = ?auto_195572 ?auto_195574 ) ) ( not ( = ?auto_195572 ?auto_195575 ) ) ( not ( = ?auto_195572 ?auto_195576 ) ) ( not ( = ?auto_195573 ?auto_195574 ) ) ( not ( = ?auto_195573 ?auto_195575 ) ) ( not ( = ?auto_195573 ?auto_195576 ) ) ( not ( = ?auto_195574 ?auto_195575 ) ) ( not ( = ?auto_195574 ?auto_195576 ) ) ( not ( = ?auto_195575 ?auto_195576 ) ) ( ON ?auto_195574 ?auto_195575 ) ( ON ?auto_195573 ?auto_195574 ) ( ON ?auto_195572 ?auto_195573 ) ( ON ?auto_195571 ?auto_195572 ) ( ON ?auto_195570 ?auto_195571 ) ( ON ?auto_195569 ?auto_195570 ) ( CLEAR ?auto_195567 ) ( ON ?auto_195568 ?auto_195569 ) ( CLEAR ?auto_195568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195567 ?auto_195568 )
      ( MAKE-9PILE ?auto_195567 ?auto_195568 ?auto_195569 ?auto_195570 ?auto_195571 ?auto_195572 ?auto_195573 ?auto_195574 ?auto_195575 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195586 - BLOCK
      ?auto_195587 - BLOCK
      ?auto_195588 - BLOCK
      ?auto_195589 - BLOCK
      ?auto_195590 - BLOCK
      ?auto_195591 - BLOCK
      ?auto_195592 - BLOCK
      ?auto_195593 - BLOCK
      ?auto_195594 - BLOCK
    )
    :vars
    (
      ?auto_195595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195594 ?auto_195595 ) ( ON-TABLE ?auto_195586 ) ( not ( = ?auto_195586 ?auto_195587 ) ) ( not ( = ?auto_195586 ?auto_195588 ) ) ( not ( = ?auto_195586 ?auto_195589 ) ) ( not ( = ?auto_195586 ?auto_195590 ) ) ( not ( = ?auto_195586 ?auto_195591 ) ) ( not ( = ?auto_195586 ?auto_195592 ) ) ( not ( = ?auto_195586 ?auto_195593 ) ) ( not ( = ?auto_195586 ?auto_195594 ) ) ( not ( = ?auto_195586 ?auto_195595 ) ) ( not ( = ?auto_195587 ?auto_195588 ) ) ( not ( = ?auto_195587 ?auto_195589 ) ) ( not ( = ?auto_195587 ?auto_195590 ) ) ( not ( = ?auto_195587 ?auto_195591 ) ) ( not ( = ?auto_195587 ?auto_195592 ) ) ( not ( = ?auto_195587 ?auto_195593 ) ) ( not ( = ?auto_195587 ?auto_195594 ) ) ( not ( = ?auto_195587 ?auto_195595 ) ) ( not ( = ?auto_195588 ?auto_195589 ) ) ( not ( = ?auto_195588 ?auto_195590 ) ) ( not ( = ?auto_195588 ?auto_195591 ) ) ( not ( = ?auto_195588 ?auto_195592 ) ) ( not ( = ?auto_195588 ?auto_195593 ) ) ( not ( = ?auto_195588 ?auto_195594 ) ) ( not ( = ?auto_195588 ?auto_195595 ) ) ( not ( = ?auto_195589 ?auto_195590 ) ) ( not ( = ?auto_195589 ?auto_195591 ) ) ( not ( = ?auto_195589 ?auto_195592 ) ) ( not ( = ?auto_195589 ?auto_195593 ) ) ( not ( = ?auto_195589 ?auto_195594 ) ) ( not ( = ?auto_195589 ?auto_195595 ) ) ( not ( = ?auto_195590 ?auto_195591 ) ) ( not ( = ?auto_195590 ?auto_195592 ) ) ( not ( = ?auto_195590 ?auto_195593 ) ) ( not ( = ?auto_195590 ?auto_195594 ) ) ( not ( = ?auto_195590 ?auto_195595 ) ) ( not ( = ?auto_195591 ?auto_195592 ) ) ( not ( = ?auto_195591 ?auto_195593 ) ) ( not ( = ?auto_195591 ?auto_195594 ) ) ( not ( = ?auto_195591 ?auto_195595 ) ) ( not ( = ?auto_195592 ?auto_195593 ) ) ( not ( = ?auto_195592 ?auto_195594 ) ) ( not ( = ?auto_195592 ?auto_195595 ) ) ( not ( = ?auto_195593 ?auto_195594 ) ) ( not ( = ?auto_195593 ?auto_195595 ) ) ( not ( = ?auto_195594 ?auto_195595 ) ) ( ON ?auto_195593 ?auto_195594 ) ( ON ?auto_195592 ?auto_195593 ) ( ON ?auto_195591 ?auto_195592 ) ( ON ?auto_195590 ?auto_195591 ) ( ON ?auto_195589 ?auto_195590 ) ( ON ?auto_195588 ?auto_195589 ) ( CLEAR ?auto_195586 ) ( ON ?auto_195587 ?auto_195588 ) ( CLEAR ?auto_195587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195586 ?auto_195587 )
      ( MAKE-9PILE ?auto_195586 ?auto_195587 ?auto_195588 ?auto_195589 ?auto_195590 ?auto_195591 ?auto_195592 ?auto_195593 ?auto_195594 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195605 - BLOCK
      ?auto_195606 - BLOCK
      ?auto_195607 - BLOCK
      ?auto_195608 - BLOCK
      ?auto_195609 - BLOCK
      ?auto_195610 - BLOCK
      ?auto_195611 - BLOCK
      ?auto_195612 - BLOCK
      ?auto_195613 - BLOCK
    )
    :vars
    (
      ?auto_195614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195613 ?auto_195614 ) ( not ( = ?auto_195605 ?auto_195606 ) ) ( not ( = ?auto_195605 ?auto_195607 ) ) ( not ( = ?auto_195605 ?auto_195608 ) ) ( not ( = ?auto_195605 ?auto_195609 ) ) ( not ( = ?auto_195605 ?auto_195610 ) ) ( not ( = ?auto_195605 ?auto_195611 ) ) ( not ( = ?auto_195605 ?auto_195612 ) ) ( not ( = ?auto_195605 ?auto_195613 ) ) ( not ( = ?auto_195605 ?auto_195614 ) ) ( not ( = ?auto_195606 ?auto_195607 ) ) ( not ( = ?auto_195606 ?auto_195608 ) ) ( not ( = ?auto_195606 ?auto_195609 ) ) ( not ( = ?auto_195606 ?auto_195610 ) ) ( not ( = ?auto_195606 ?auto_195611 ) ) ( not ( = ?auto_195606 ?auto_195612 ) ) ( not ( = ?auto_195606 ?auto_195613 ) ) ( not ( = ?auto_195606 ?auto_195614 ) ) ( not ( = ?auto_195607 ?auto_195608 ) ) ( not ( = ?auto_195607 ?auto_195609 ) ) ( not ( = ?auto_195607 ?auto_195610 ) ) ( not ( = ?auto_195607 ?auto_195611 ) ) ( not ( = ?auto_195607 ?auto_195612 ) ) ( not ( = ?auto_195607 ?auto_195613 ) ) ( not ( = ?auto_195607 ?auto_195614 ) ) ( not ( = ?auto_195608 ?auto_195609 ) ) ( not ( = ?auto_195608 ?auto_195610 ) ) ( not ( = ?auto_195608 ?auto_195611 ) ) ( not ( = ?auto_195608 ?auto_195612 ) ) ( not ( = ?auto_195608 ?auto_195613 ) ) ( not ( = ?auto_195608 ?auto_195614 ) ) ( not ( = ?auto_195609 ?auto_195610 ) ) ( not ( = ?auto_195609 ?auto_195611 ) ) ( not ( = ?auto_195609 ?auto_195612 ) ) ( not ( = ?auto_195609 ?auto_195613 ) ) ( not ( = ?auto_195609 ?auto_195614 ) ) ( not ( = ?auto_195610 ?auto_195611 ) ) ( not ( = ?auto_195610 ?auto_195612 ) ) ( not ( = ?auto_195610 ?auto_195613 ) ) ( not ( = ?auto_195610 ?auto_195614 ) ) ( not ( = ?auto_195611 ?auto_195612 ) ) ( not ( = ?auto_195611 ?auto_195613 ) ) ( not ( = ?auto_195611 ?auto_195614 ) ) ( not ( = ?auto_195612 ?auto_195613 ) ) ( not ( = ?auto_195612 ?auto_195614 ) ) ( not ( = ?auto_195613 ?auto_195614 ) ) ( ON ?auto_195612 ?auto_195613 ) ( ON ?auto_195611 ?auto_195612 ) ( ON ?auto_195610 ?auto_195611 ) ( ON ?auto_195609 ?auto_195610 ) ( ON ?auto_195608 ?auto_195609 ) ( ON ?auto_195607 ?auto_195608 ) ( ON ?auto_195606 ?auto_195607 ) ( ON ?auto_195605 ?auto_195606 ) ( CLEAR ?auto_195605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_195605 )
      ( MAKE-9PILE ?auto_195605 ?auto_195606 ?auto_195607 ?auto_195608 ?auto_195609 ?auto_195610 ?auto_195611 ?auto_195612 ?auto_195613 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_195624 - BLOCK
      ?auto_195625 - BLOCK
      ?auto_195626 - BLOCK
      ?auto_195627 - BLOCK
      ?auto_195628 - BLOCK
      ?auto_195629 - BLOCK
      ?auto_195630 - BLOCK
      ?auto_195631 - BLOCK
      ?auto_195632 - BLOCK
    )
    :vars
    (
      ?auto_195633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195632 ?auto_195633 ) ( not ( = ?auto_195624 ?auto_195625 ) ) ( not ( = ?auto_195624 ?auto_195626 ) ) ( not ( = ?auto_195624 ?auto_195627 ) ) ( not ( = ?auto_195624 ?auto_195628 ) ) ( not ( = ?auto_195624 ?auto_195629 ) ) ( not ( = ?auto_195624 ?auto_195630 ) ) ( not ( = ?auto_195624 ?auto_195631 ) ) ( not ( = ?auto_195624 ?auto_195632 ) ) ( not ( = ?auto_195624 ?auto_195633 ) ) ( not ( = ?auto_195625 ?auto_195626 ) ) ( not ( = ?auto_195625 ?auto_195627 ) ) ( not ( = ?auto_195625 ?auto_195628 ) ) ( not ( = ?auto_195625 ?auto_195629 ) ) ( not ( = ?auto_195625 ?auto_195630 ) ) ( not ( = ?auto_195625 ?auto_195631 ) ) ( not ( = ?auto_195625 ?auto_195632 ) ) ( not ( = ?auto_195625 ?auto_195633 ) ) ( not ( = ?auto_195626 ?auto_195627 ) ) ( not ( = ?auto_195626 ?auto_195628 ) ) ( not ( = ?auto_195626 ?auto_195629 ) ) ( not ( = ?auto_195626 ?auto_195630 ) ) ( not ( = ?auto_195626 ?auto_195631 ) ) ( not ( = ?auto_195626 ?auto_195632 ) ) ( not ( = ?auto_195626 ?auto_195633 ) ) ( not ( = ?auto_195627 ?auto_195628 ) ) ( not ( = ?auto_195627 ?auto_195629 ) ) ( not ( = ?auto_195627 ?auto_195630 ) ) ( not ( = ?auto_195627 ?auto_195631 ) ) ( not ( = ?auto_195627 ?auto_195632 ) ) ( not ( = ?auto_195627 ?auto_195633 ) ) ( not ( = ?auto_195628 ?auto_195629 ) ) ( not ( = ?auto_195628 ?auto_195630 ) ) ( not ( = ?auto_195628 ?auto_195631 ) ) ( not ( = ?auto_195628 ?auto_195632 ) ) ( not ( = ?auto_195628 ?auto_195633 ) ) ( not ( = ?auto_195629 ?auto_195630 ) ) ( not ( = ?auto_195629 ?auto_195631 ) ) ( not ( = ?auto_195629 ?auto_195632 ) ) ( not ( = ?auto_195629 ?auto_195633 ) ) ( not ( = ?auto_195630 ?auto_195631 ) ) ( not ( = ?auto_195630 ?auto_195632 ) ) ( not ( = ?auto_195630 ?auto_195633 ) ) ( not ( = ?auto_195631 ?auto_195632 ) ) ( not ( = ?auto_195631 ?auto_195633 ) ) ( not ( = ?auto_195632 ?auto_195633 ) ) ( ON ?auto_195631 ?auto_195632 ) ( ON ?auto_195630 ?auto_195631 ) ( ON ?auto_195629 ?auto_195630 ) ( ON ?auto_195628 ?auto_195629 ) ( ON ?auto_195627 ?auto_195628 ) ( ON ?auto_195626 ?auto_195627 ) ( ON ?auto_195625 ?auto_195626 ) ( ON ?auto_195624 ?auto_195625 ) ( CLEAR ?auto_195624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_195624 )
      ( MAKE-9PILE ?auto_195624 ?auto_195625 ?auto_195626 ?auto_195627 ?auto_195628 ?auto_195629 ?auto_195630 ?auto_195631 ?auto_195632 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195644 - BLOCK
      ?auto_195645 - BLOCK
      ?auto_195646 - BLOCK
      ?auto_195647 - BLOCK
      ?auto_195648 - BLOCK
      ?auto_195649 - BLOCK
      ?auto_195650 - BLOCK
      ?auto_195651 - BLOCK
      ?auto_195652 - BLOCK
      ?auto_195653 - BLOCK
    )
    :vars
    (
      ?auto_195654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_195652 ) ( ON ?auto_195653 ?auto_195654 ) ( CLEAR ?auto_195653 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_195644 ) ( ON ?auto_195645 ?auto_195644 ) ( ON ?auto_195646 ?auto_195645 ) ( ON ?auto_195647 ?auto_195646 ) ( ON ?auto_195648 ?auto_195647 ) ( ON ?auto_195649 ?auto_195648 ) ( ON ?auto_195650 ?auto_195649 ) ( ON ?auto_195651 ?auto_195650 ) ( ON ?auto_195652 ?auto_195651 ) ( not ( = ?auto_195644 ?auto_195645 ) ) ( not ( = ?auto_195644 ?auto_195646 ) ) ( not ( = ?auto_195644 ?auto_195647 ) ) ( not ( = ?auto_195644 ?auto_195648 ) ) ( not ( = ?auto_195644 ?auto_195649 ) ) ( not ( = ?auto_195644 ?auto_195650 ) ) ( not ( = ?auto_195644 ?auto_195651 ) ) ( not ( = ?auto_195644 ?auto_195652 ) ) ( not ( = ?auto_195644 ?auto_195653 ) ) ( not ( = ?auto_195644 ?auto_195654 ) ) ( not ( = ?auto_195645 ?auto_195646 ) ) ( not ( = ?auto_195645 ?auto_195647 ) ) ( not ( = ?auto_195645 ?auto_195648 ) ) ( not ( = ?auto_195645 ?auto_195649 ) ) ( not ( = ?auto_195645 ?auto_195650 ) ) ( not ( = ?auto_195645 ?auto_195651 ) ) ( not ( = ?auto_195645 ?auto_195652 ) ) ( not ( = ?auto_195645 ?auto_195653 ) ) ( not ( = ?auto_195645 ?auto_195654 ) ) ( not ( = ?auto_195646 ?auto_195647 ) ) ( not ( = ?auto_195646 ?auto_195648 ) ) ( not ( = ?auto_195646 ?auto_195649 ) ) ( not ( = ?auto_195646 ?auto_195650 ) ) ( not ( = ?auto_195646 ?auto_195651 ) ) ( not ( = ?auto_195646 ?auto_195652 ) ) ( not ( = ?auto_195646 ?auto_195653 ) ) ( not ( = ?auto_195646 ?auto_195654 ) ) ( not ( = ?auto_195647 ?auto_195648 ) ) ( not ( = ?auto_195647 ?auto_195649 ) ) ( not ( = ?auto_195647 ?auto_195650 ) ) ( not ( = ?auto_195647 ?auto_195651 ) ) ( not ( = ?auto_195647 ?auto_195652 ) ) ( not ( = ?auto_195647 ?auto_195653 ) ) ( not ( = ?auto_195647 ?auto_195654 ) ) ( not ( = ?auto_195648 ?auto_195649 ) ) ( not ( = ?auto_195648 ?auto_195650 ) ) ( not ( = ?auto_195648 ?auto_195651 ) ) ( not ( = ?auto_195648 ?auto_195652 ) ) ( not ( = ?auto_195648 ?auto_195653 ) ) ( not ( = ?auto_195648 ?auto_195654 ) ) ( not ( = ?auto_195649 ?auto_195650 ) ) ( not ( = ?auto_195649 ?auto_195651 ) ) ( not ( = ?auto_195649 ?auto_195652 ) ) ( not ( = ?auto_195649 ?auto_195653 ) ) ( not ( = ?auto_195649 ?auto_195654 ) ) ( not ( = ?auto_195650 ?auto_195651 ) ) ( not ( = ?auto_195650 ?auto_195652 ) ) ( not ( = ?auto_195650 ?auto_195653 ) ) ( not ( = ?auto_195650 ?auto_195654 ) ) ( not ( = ?auto_195651 ?auto_195652 ) ) ( not ( = ?auto_195651 ?auto_195653 ) ) ( not ( = ?auto_195651 ?auto_195654 ) ) ( not ( = ?auto_195652 ?auto_195653 ) ) ( not ( = ?auto_195652 ?auto_195654 ) ) ( not ( = ?auto_195653 ?auto_195654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_195653 ?auto_195654 )
      ( !STACK ?auto_195653 ?auto_195652 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195665 - BLOCK
      ?auto_195666 - BLOCK
      ?auto_195667 - BLOCK
      ?auto_195668 - BLOCK
      ?auto_195669 - BLOCK
      ?auto_195670 - BLOCK
      ?auto_195671 - BLOCK
      ?auto_195672 - BLOCK
      ?auto_195673 - BLOCK
      ?auto_195674 - BLOCK
    )
    :vars
    (
      ?auto_195675 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_195673 ) ( ON ?auto_195674 ?auto_195675 ) ( CLEAR ?auto_195674 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_195665 ) ( ON ?auto_195666 ?auto_195665 ) ( ON ?auto_195667 ?auto_195666 ) ( ON ?auto_195668 ?auto_195667 ) ( ON ?auto_195669 ?auto_195668 ) ( ON ?auto_195670 ?auto_195669 ) ( ON ?auto_195671 ?auto_195670 ) ( ON ?auto_195672 ?auto_195671 ) ( ON ?auto_195673 ?auto_195672 ) ( not ( = ?auto_195665 ?auto_195666 ) ) ( not ( = ?auto_195665 ?auto_195667 ) ) ( not ( = ?auto_195665 ?auto_195668 ) ) ( not ( = ?auto_195665 ?auto_195669 ) ) ( not ( = ?auto_195665 ?auto_195670 ) ) ( not ( = ?auto_195665 ?auto_195671 ) ) ( not ( = ?auto_195665 ?auto_195672 ) ) ( not ( = ?auto_195665 ?auto_195673 ) ) ( not ( = ?auto_195665 ?auto_195674 ) ) ( not ( = ?auto_195665 ?auto_195675 ) ) ( not ( = ?auto_195666 ?auto_195667 ) ) ( not ( = ?auto_195666 ?auto_195668 ) ) ( not ( = ?auto_195666 ?auto_195669 ) ) ( not ( = ?auto_195666 ?auto_195670 ) ) ( not ( = ?auto_195666 ?auto_195671 ) ) ( not ( = ?auto_195666 ?auto_195672 ) ) ( not ( = ?auto_195666 ?auto_195673 ) ) ( not ( = ?auto_195666 ?auto_195674 ) ) ( not ( = ?auto_195666 ?auto_195675 ) ) ( not ( = ?auto_195667 ?auto_195668 ) ) ( not ( = ?auto_195667 ?auto_195669 ) ) ( not ( = ?auto_195667 ?auto_195670 ) ) ( not ( = ?auto_195667 ?auto_195671 ) ) ( not ( = ?auto_195667 ?auto_195672 ) ) ( not ( = ?auto_195667 ?auto_195673 ) ) ( not ( = ?auto_195667 ?auto_195674 ) ) ( not ( = ?auto_195667 ?auto_195675 ) ) ( not ( = ?auto_195668 ?auto_195669 ) ) ( not ( = ?auto_195668 ?auto_195670 ) ) ( not ( = ?auto_195668 ?auto_195671 ) ) ( not ( = ?auto_195668 ?auto_195672 ) ) ( not ( = ?auto_195668 ?auto_195673 ) ) ( not ( = ?auto_195668 ?auto_195674 ) ) ( not ( = ?auto_195668 ?auto_195675 ) ) ( not ( = ?auto_195669 ?auto_195670 ) ) ( not ( = ?auto_195669 ?auto_195671 ) ) ( not ( = ?auto_195669 ?auto_195672 ) ) ( not ( = ?auto_195669 ?auto_195673 ) ) ( not ( = ?auto_195669 ?auto_195674 ) ) ( not ( = ?auto_195669 ?auto_195675 ) ) ( not ( = ?auto_195670 ?auto_195671 ) ) ( not ( = ?auto_195670 ?auto_195672 ) ) ( not ( = ?auto_195670 ?auto_195673 ) ) ( not ( = ?auto_195670 ?auto_195674 ) ) ( not ( = ?auto_195670 ?auto_195675 ) ) ( not ( = ?auto_195671 ?auto_195672 ) ) ( not ( = ?auto_195671 ?auto_195673 ) ) ( not ( = ?auto_195671 ?auto_195674 ) ) ( not ( = ?auto_195671 ?auto_195675 ) ) ( not ( = ?auto_195672 ?auto_195673 ) ) ( not ( = ?auto_195672 ?auto_195674 ) ) ( not ( = ?auto_195672 ?auto_195675 ) ) ( not ( = ?auto_195673 ?auto_195674 ) ) ( not ( = ?auto_195673 ?auto_195675 ) ) ( not ( = ?auto_195674 ?auto_195675 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_195674 ?auto_195675 )
      ( !STACK ?auto_195674 ?auto_195673 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195686 - BLOCK
      ?auto_195687 - BLOCK
      ?auto_195688 - BLOCK
      ?auto_195689 - BLOCK
      ?auto_195690 - BLOCK
      ?auto_195691 - BLOCK
      ?auto_195692 - BLOCK
      ?auto_195693 - BLOCK
      ?auto_195694 - BLOCK
      ?auto_195695 - BLOCK
    )
    :vars
    (
      ?auto_195696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195695 ?auto_195696 ) ( ON-TABLE ?auto_195686 ) ( ON ?auto_195687 ?auto_195686 ) ( ON ?auto_195688 ?auto_195687 ) ( ON ?auto_195689 ?auto_195688 ) ( ON ?auto_195690 ?auto_195689 ) ( ON ?auto_195691 ?auto_195690 ) ( ON ?auto_195692 ?auto_195691 ) ( ON ?auto_195693 ?auto_195692 ) ( not ( = ?auto_195686 ?auto_195687 ) ) ( not ( = ?auto_195686 ?auto_195688 ) ) ( not ( = ?auto_195686 ?auto_195689 ) ) ( not ( = ?auto_195686 ?auto_195690 ) ) ( not ( = ?auto_195686 ?auto_195691 ) ) ( not ( = ?auto_195686 ?auto_195692 ) ) ( not ( = ?auto_195686 ?auto_195693 ) ) ( not ( = ?auto_195686 ?auto_195694 ) ) ( not ( = ?auto_195686 ?auto_195695 ) ) ( not ( = ?auto_195686 ?auto_195696 ) ) ( not ( = ?auto_195687 ?auto_195688 ) ) ( not ( = ?auto_195687 ?auto_195689 ) ) ( not ( = ?auto_195687 ?auto_195690 ) ) ( not ( = ?auto_195687 ?auto_195691 ) ) ( not ( = ?auto_195687 ?auto_195692 ) ) ( not ( = ?auto_195687 ?auto_195693 ) ) ( not ( = ?auto_195687 ?auto_195694 ) ) ( not ( = ?auto_195687 ?auto_195695 ) ) ( not ( = ?auto_195687 ?auto_195696 ) ) ( not ( = ?auto_195688 ?auto_195689 ) ) ( not ( = ?auto_195688 ?auto_195690 ) ) ( not ( = ?auto_195688 ?auto_195691 ) ) ( not ( = ?auto_195688 ?auto_195692 ) ) ( not ( = ?auto_195688 ?auto_195693 ) ) ( not ( = ?auto_195688 ?auto_195694 ) ) ( not ( = ?auto_195688 ?auto_195695 ) ) ( not ( = ?auto_195688 ?auto_195696 ) ) ( not ( = ?auto_195689 ?auto_195690 ) ) ( not ( = ?auto_195689 ?auto_195691 ) ) ( not ( = ?auto_195689 ?auto_195692 ) ) ( not ( = ?auto_195689 ?auto_195693 ) ) ( not ( = ?auto_195689 ?auto_195694 ) ) ( not ( = ?auto_195689 ?auto_195695 ) ) ( not ( = ?auto_195689 ?auto_195696 ) ) ( not ( = ?auto_195690 ?auto_195691 ) ) ( not ( = ?auto_195690 ?auto_195692 ) ) ( not ( = ?auto_195690 ?auto_195693 ) ) ( not ( = ?auto_195690 ?auto_195694 ) ) ( not ( = ?auto_195690 ?auto_195695 ) ) ( not ( = ?auto_195690 ?auto_195696 ) ) ( not ( = ?auto_195691 ?auto_195692 ) ) ( not ( = ?auto_195691 ?auto_195693 ) ) ( not ( = ?auto_195691 ?auto_195694 ) ) ( not ( = ?auto_195691 ?auto_195695 ) ) ( not ( = ?auto_195691 ?auto_195696 ) ) ( not ( = ?auto_195692 ?auto_195693 ) ) ( not ( = ?auto_195692 ?auto_195694 ) ) ( not ( = ?auto_195692 ?auto_195695 ) ) ( not ( = ?auto_195692 ?auto_195696 ) ) ( not ( = ?auto_195693 ?auto_195694 ) ) ( not ( = ?auto_195693 ?auto_195695 ) ) ( not ( = ?auto_195693 ?auto_195696 ) ) ( not ( = ?auto_195694 ?auto_195695 ) ) ( not ( = ?auto_195694 ?auto_195696 ) ) ( not ( = ?auto_195695 ?auto_195696 ) ) ( CLEAR ?auto_195693 ) ( ON ?auto_195694 ?auto_195695 ) ( CLEAR ?auto_195694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_195686 ?auto_195687 ?auto_195688 ?auto_195689 ?auto_195690 ?auto_195691 ?auto_195692 ?auto_195693 ?auto_195694 )
      ( MAKE-10PILE ?auto_195686 ?auto_195687 ?auto_195688 ?auto_195689 ?auto_195690 ?auto_195691 ?auto_195692 ?auto_195693 ?auto_195694 ?auto_195695 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195707 - BLOCK
      ?auto_195708 - BLOCK
      ?auto_195709 - BLOCK
      ?auto_195710 - BLOCK
      ?auto_195711 - BLOCK
      ?auto_195712 - BLOCK
      ?auto_195713 - BLOCK
      ?auto_195714 - BLOCK
      ?auto_195715 - BLOCK
      ?auto_195716 - BLOCK
    )
    :vars
    (
      ?auto_195717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195716 ?auto_195717 ) ( ON-TABLE ?auto_195707 ) ( ON ?auto_195708 ?auto_195707 ) ( ON ?auto_195709 ?auto_195708 ) ( ON ?auto_195710 ?auto_195709 ) ( ON ?auto_195711 ?auto_195710 ) ( ON ?auto_195712 ?auto_195711 ) ( ON ?auto_195713 ?auto_195712 ) ( ON ?auto_195714 ?auto_195713 ) ( not ( = ?auto_195707 ?auto_195708 ) ) ( not ( = ?auto_195707 ?auto_195709 ) ) ( not ( = ?auto_195707 ?auto_195710 ) ) ( not ( = ?auto_195707 ?auto_195711 ) ) ( not ( = ?auto_195707 ?auto_195712 ) ) ( not ( = ?auto_195707 ?auto_195713 ) ) ( not ( = ?auto_195707 ?auto_195714 ) ) ( not ( = ?auto_195707 ?auto_195715 ) ) ( not ( = ?auto_195707 ?auto_195716 ) ) ( not ( = ?auto_195707 ?auto_195717 ) ) ( not ( = ?auto_195708 ?auto_195709 ) ) ( not ( = ?auto_195708 ?auto_195710 ) ) ( not ( = ?auto_195708 ?auto_195711 ) ) ( not ( = ?auto_195708 ?auto_195712 ) ) ( not ( = ?auto_195708 ?auto_195713 ) ) ( not ( = ?auto_195708 ?auto_195714 ) ) ( not ( = ?auto_195708 ?auto_195715 ) ) ( not ( = ?auto_195708 ?auto_195716 ) ) ( not ( = ?auto_195708 ?auto_195717 ) ) ( not ( = ?auto_195709 ?auto_195710 ) ) ( not ( = ?auto_195709 ?auto_195711 ) ) ( not ( = ?auto_195709 ?auto_195712 ) ) ( not ( = ?auto_195709 ?auto_195713 ) ) ( not ( = ?auto_195709 ?auto_195714 ) ) ( not ( = ?auto_195709 ?auto_195715 ) ) ( not ( = ?auto_195709 ?auto_195716 ) ) ( not ( = ?auto_195709 ?auto_195717 ) ) ( not ( = ?auto_195710 ?auto_195711 ) ) ( not ( = ?auto_195710 ?auto_195712 ) ) ( not ( = ?auto_195710 ?auto_195713 ) ) ( not ( = ?auto_195710 ?auto_195714 ) ) ( not ( = ?auto_195710 ?auto_195715 ) ) ( not ( = ?auto_195710 ?auto_195716 ) ) ( not ( = ?auto_195710 ?auto_195717 ) ) ( not ( = ?auto_195711 ?auto_195712 ) ) ( not ( = ?auto_195711 ?auto_195713 ) ) ( not ( = ?auto_195711 ?auto_195714 ) ) ( not ( = ?auto_195711 ?auto_195715 ) ) ( not ( = ?auto_195711 ?auto_195716 ) ) ( not ( = ?auto_195711 ?auto_195717 ) ) ( not ( = ?auto_195712 ?auto_195713 ) ) ( not ( = ?auto_195712 ?auto_195714 ) ) ( not ( = ?auto_195712 ?auto_195715 ) ) ( not ( = ?auto_195712 ?auto_195716 ) ) ( not ( = ?auto_195712 ?auto_195717 ) ) ( not ( = ?auto_195713 ?auto_195714 ) ) ( not ( = ?auto_195713 ?auto_195715 ) ) ( not ( = ?auto_195713 ?auto_195716 ) ) ( not ( = ?auto_195713 ?auto_195717 ) ) ( not ( = ?auto_195714 ?auto_195715 ) ) ( not ( = ?auto_195714 ?auto_195716 ) ) ( not ( = ?auto_195714 ?auto_195717 ) ) ( not ( = ?auto_195715 ?auto_195716 ) ) ( not ( = ?auto_195715 ?auto_195717 ) ) ( not ( = ?auto_195716 ?auto_195717 ) ) ( CLEAR ?auto_195714 ) ( ON ?auto_195715 ?auto_195716 ) ( CLEAR ?auto_195715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_195707 ?auto_195708 ?auto_195709 ?auto_195710 ?auto_195711 ?auto_195712 ?auto_195713 ?auto_195714 ?auto_195715 )
      ( MAKE-10PILE ?auto_195707 ?auto_195708 ?auto_195709 ?auto_195710 ?auto_195711 ?auto_195712 ?auto_195713 ?auto_195714 ?auto_195715 ?auto_195716 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195728 - BLOCK
      ?auto_195729 - BLOCK
      ?auto_195730 - BLOCK
      ?auto_195731 - BLOCK
      ?auto_195732 - BLOCK
      ?auto_195733 - BLOCK
      ?auto_195734 - BLOCK
      ?auto_195735 - BLOCK
      ?auto_195736 - BLOCK
      ?auto_195737 - BLOCK
    )
    :vars
    (
      ?auto_195738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195737 ?auto_195738 ) ( ON-TABLE ?auto_195728 ) ( ON ?auto_195729 ?auto_195728 ) ( ON ?auto_195730 ?auto_195729 ) ( ON ?auto_195731 ?auto_195730 ) ( ON ?auto_195732 ?auto_195731 ) ( ON ?auto_195733 ?auto_195732 ) ( ON ?auto_195734 ?auto_195733 ) ( not ( = ?auto_195728 ?auto_195729 ) ) ( not ( = ?auto_195728 ?auto_195730 ) ) ( not ( = ?auto_195728 ?auto_195731 ) ) ( not ( = ?auto_195728 ?auto_195732 ) ) ( not ( = ?auto_195728 ?auto_195733 ) ) ( not ( = ?auto_195728 ?auto_195734 ) ) ( not ( = ?auto_195728 ?auto_195735 ) ) ( not ( = ?auto_195728 ?auto_195736 ) ) ( not ( = ?auto_195728 ?auto_195737 ) ) ( not ( = ?auto_195728 ?auto_195738 ) ) ( not ( = ?auto_195729 ?auto_195730 ) ) ( not ( = ?auto_195729 ?auto_195731 ) ) ( not ( = ?auto_195729 ?auto_195732 ) ) ( not ( = ?auto_195729 ?auto_195733 ) ) ( not ( = ?auto_195729 ?auto_195734 ) ) ( not ( = ?auto_195729 ?auto_195735 ) ) ( not ( = ?auto_195729 ?auto_195736 ) ) ( not ( = ?auto_195729 ?auto_195737 ) ) ( not ( = ?auto_195729 ?auto_195738 ) ) ( not ( = ?auto_195730 ?auto_195731 ) ) ( not ( = ?auto_195730 ?auto_195732 ) ) ( not ( = ?auto_195730 ?auto_195733 ) ) ( not ( = ?auto_195730 ?auto_195734 ) ) ( not ( = ?auto_195730 ?auto_195735 ) ) ( not ( = ?auto_195730 ?auto_195736 ) ) ( not ( = ?auto_195730 ?auto_195737 ) ) ( not ( = ?auto_195730 ?auto_195738 ) ) ( not ( = ?auto_195731 ?auto_195732 ) ) ( not ( = ?auto_195731 ?auto_195733 ) ) ( not ( = ?auto_195731 ?auto_195734 ) ) ( not ( = ?auto_195731 ?auto_195735 ) ) ( not ( = ?auto_195731 ?auto_195736 ) ) ( not ( = ?auto_195731 ?auto_195737 ) ) ( not ( = ?auto_195731 ?auto_195738 ) ) ( not ( = ?auto_195732 ?auto_195733 ) ) ( not ( = ?auto_195732 ?auto_195734 ) ) ( not ( = ?auto_195732 ?auto_195735 ) ) ( not ( = ?auto_195732 ?auto_195736 ) ) ( not ( = ?auto_195732 ?auto_195737 ) ) ( not ( = ?auto_195732 ?auto_195738 ) ) ( not ( = ?auto_195733 ?auto_195734 ) ) ( not ( = ?auto_195733 ?auto_195735 ) ) ( not ( = ?auto_195733 ?auto_195736 ) ) ( not ( = ?auto_195733 ?auto_195737 ) ) ( not ( = ?auto_195733 ?auto_195738 ) ) ( not ( = ?auto_195734 ?auto_195735 ) ) ( not ( = ?auto_195734 ?auto_195736 ) ) ( not ( = ?auto_195734 ?auto_195737 ) ) ( not ( = ?auto_195734 ?auto_195738 ) ) ( not ( = ?auto_195735 ?auto_195736 ) ) ( not ( = ?auto_195735 ?auto_195737 ) ) ( not ( = ?auto_195735 ?auto_195738 ) ) ( not ( = ?auto_195736 ?auto_195737 ) ) ( not ( = ?auto_195736 ?auto_195738 ) ) ( not ( = ?auto_195737 ?auto_195738 ) ) ( ON ?auto_195736 ?auto_195737 ) ( CLEAR ?auto_195734 ) ( ON ?auto_195735 ?auto_195736 ) ( CLEAR ?auto_195735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_195728 ?auto_195729 ?auto_195730 ?auto_195731 ?auto_195732 ?auto_195733 ?auto_195734 ?auto_195735 )
      ( MAKE-10PILE ?auto_195728 ?auto_195729 ?auto_195730 ?auto_195731 ?auto_195732 ?auto_195733 ?auto_195734 ?auto_195735 ?auto_195736 ?auto_195737 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195749 - BLOCK
      ?auto_195750 - BLOCK
      ?auto_195751 - BLOCK
      ?auto_195752 - BLOCK
      ?auto_195753 - BLOCK
      ?auto_195754 - BLOCK
      ?auto_195755 - BLOCK
      ?auto_195756 - BLOCK
      ?auto_195757 - BLOCK
      ?auto_195758 - BLOCK
    )
    :vars
    (
      ?auto_195759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195758 ?auto_195759 ) ( ON-TABLE ?auto_195749 ) ( ON ?auto_195750 ?auto_195749 ) ( ON ?auto_195751 ?auto_195750 ) ( ON ?auto_195752 ?auto_195751 ) ( ON ?auto_195753 ?auto_195752 ) ( ON ?auto_195754 ?auto_195753 ) ( ON ?auto_195755 ?auto_195754 ) ( not ( = ?auto_195749 ?auto_195750 ) ) ( not ( = ?auto_195749 ?auto_195751 ) ) ( not ( = ?auto_195749 ?auto_195752 ) ) ( not ( = ?auto_195749 ?auto_195753 ) ) ( not ( = ?auto_195749 ?auto_195754 ) ) ( not ( = ?auto_195749 ?auto_195755 ) ) ( not ( = ?auto_195749 ?auto_195756 ) ) ( not ( = ?auto_195749 ?auto_195757 ) ) ( not ( = ?auto_195749 ?auto_195758 ) ) ( not ( = ?auto_195749 ?auto_195759 ) ) ( not ( = ?auto_195750 ?auto_195751 ) ) ( not ( = ?auto_195750 ?auto_195752 ) ) ( not ( = ?auto_195750 ?auto_195753 ) ) ( not ( = ?auto_195750 ?auto_195754 ) ) ( not ( = ?auto_195750 ?auto_195755 ) ) ( not ( = ?auto_195750 ?auto_195756 ) ) ( not ( = ?auto_195750 ?auto_195757 ) ) ( not ( = ?auto_195750 ?auto_195758 ) ) ( not ( = ?auto_195750 ?auto_195759 ) ) ( not ( = ?auto_195751 ?auto_195752 ) ) ( not ( = ?auto_195751 ?auto_195753 ) ) ( not ( = ?auto_195751 ?auto_195754 ) ) ( not ( = ?auto_195751 ?auto_195755 ) ) ( not ( = ?auto_195751 ?auto_195756 ) ) ( not ( = ?auto_195751 ?auto_195757 ) ) ( not ( = ?auto_195751 ?auto_195758 ) ) ( not ( = ?auto_195751 ?auto_195759 ) ) ( not ( = ?auto_195752 ?auto_195753 ) ) ( not ( = ?auto_195752 ?auto_195754 ) ) ( not ( = ?auto_195752 ?auto_195755 ) ) ( not ( = ?auto_195752 ?auto_195756 ) ) ( not ( = ?auto_195752 ?auto_195757 ) ) ( not ( = ?auto_195752 ?auto_195758 ) ) ( not ( = ?auto_195752 ?auto_195759 ) ) ( not ( = ?auto_195753 ?auto_195754 ) ) ( not ( = ?auto_195753 ?auto_195755 ) ) ( not ( = ?auto_195753 ?auto_195756 ) ) ( not ( = ?auto_195753 ?auto_195757 ) ) ( not ( = ?auto_195753 ?auto_195758 ) ) ( not ( = ?auto_195753 ?auto_195759 ) ) ( not ( = ?auto_195754 ?auto_195755 ) ) ( not ( = ?auto_195754 ?auto_195756 ) ) ( not ( = ?auto_195754 ?auto_195757 ) ) ( not ( = ?auto_195754 ?auto_195758 ) ) ( not ( = ?auto_195754 ?auto_195759 ) ) ( not ( = ?auto_195755 ?auto_195756 ) ) ( not ( = ?auto_195755 ?auto_195757 ) ) ( not ( = ?auto_195755 ?auto_195758 ) ) ( not ( = ?auto_195755 ?auto_195759 ) ) ( not ( = ?auto_195756 ?auto_195757 ) ) ( not ( = ?auto_195756 ?auto_195758 ) ) ( not ( = ?auto_195756 ?auto_195759 ) ) ( not ( = ?auto_195757 ?auto_195758 ) ) ( not ( = ?auto_195757 ?auto_195759 ) ) ( not ( = ?auto_195758 ?auto_195759 ) ) ( ON ?auto_195757 ?auto_195758 ) ( CLEAR ?auto_195755 ) ( ON ?auto_195756 ?auto_195757 ) ( CLEAR ?auto_195756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_195749 ?auto_195750 ?auto_195751 ?auto_195752 ?auto_195753 ?auto_195754 ?auto_195755 ?auto_195756 )
      ( MAKE-10PILE ?auto_195749 ?auto_195750 ?auto_195751 ?auto_195752 ?auto_195753 ?auto_195754 ?auto_195755 ?auto_195756 ?auto_195757 ?auto_195758 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195770 - BLOCK
      ?auto_195771 - BLOCK
      ?auto_195772 - BLOCK
      ?auto_195773 - BLOCK
      ?auto_195774 - BLOCK
      ?auto_195775 - BLOCK
      ?auto_195776 - BLOCK
      ?auto_195777 - BLOCK
      ?auto_195778 - BLOCK
      ?auto_195779 - BLOCK
    )
    :vars
    (
      ?auto_195780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195779 ?auto_195780 ) ( ON-TABLE ?auto_195770 ) ( ON ?auto_195771 ?auto_195770 ) ( ON ?auto_195772 ?auto_195771 ) ( ON ?auto_195773 ?auto_195772 ) ( ON ?auto_195774 ?auto_195773 ) ( ON ?auto_195775 ?auto_195774 ) ( not ( = ?auto_195770 ?auto_195771 ) ) ( not ( = ?auto_195770 ?auto_195772 ) ) ( not ( = ?auto_195770 ?auto_195773 ) ) ( not ( = ?auto_195770 ?auto_195774 ) ) ( not ( = ?auto_195770 ?auto_195775 ) ) ( not ( = ?auto_195770 ?auto_195776 ) ) ( not ( = ?auto_195770 ?auto_195777 ) ) ( not ( = ?auto_195770 ?auto_195778 ) ) ( not ( = ?auto_195770 ?auto_195779 ) ) ( not ( = ?auto_195770 ?auto_195780 ) ) ( not ( = ?auto_195771 ?auto_195772 ) ) ( not ( = ?auto_195771 ?auto_195773 ) ) ( not ( = ?auto_195771 ?auto_195774 ) ) ( not ( = ?auto_195771 ?auto_195775 ) ) ( not ( = ?auto_195771 ?auto_195776 ) ) ( not ( = ?auto_195771 ?auto_195777 ) ) ( not ( = ?auto_195771 ?auto_195778 ) ) ( not ( = ?auto_195771 ?auto_195779 ) ) ( not ( = ?auto_195771 ?auto_195780 ) ) ( not ( = ?auto_195772 ?auto_195773 ) ) ( not ( = ?auto_195772 ?auto_195774 ) ) ( not ( = ?auto_195772 ?auto_195775 ) ) ( not ( = ?auto_195772 ?auto_195776 ) ) ( not ( = ?auto_195772 ?auto_195777 ) ) ( not ( = ?auto_195772 ?auto_195778 ) ) ( not ( = ?auto_195772 ?auto_195779 ) ) ( not ( = ?auto_195772 ?auto_195780 ) ) ( not ( = ?auto_195773 ?auto_195774 ) ) ( not ( = ?auto_195773 ?auto_195775 ) ) ( not ( = ?auto_195773 ?auto_195776 ) ) ( not ( = ?auto_195773 ?auto_195777 ) ) ( not ( = ?auto_195773 ?auto_195778 ) ) ( not ( = ?auto_195773 ?auto_195779 ) ) ( not ( = ?auto_195773 ?auto_195780 ) ) ( not ( = ?auto_195774 ?auto_195775 ) ) ( not ( = ?auto_195774 ?auto_195776 ) ) ( not ( = ?auto_195774 ?auto_195777 ) ) ( not ( = ?auto_195774 ?auto_195778 ) ) ( not ( = ?auto_195774 ?auto_195779 ) ) ( not ( = ?auto_195774 ?auto_195780 ) ) ( not ( = ?auto_195775 ?auto_195776 ) ) ( not ( = ?auto_195775 ?auto_195777 ) ) ( not ( = ?auto_195775 ?auto_195778 ) ) ( not ( = ?auto_195775 ?auto_195779 ) ) ( not ( = ?auto_195775 ?auto_195780 ) ) ( not ( = ?auto_195776 ?auto_195777 ) ) ( not ( = ?auto_195776 ?auto_195778 ) ) ( not ( = ?auto_195776 ?auto_195779 ) ) ( not ( = ?auto_195776 ?auto_195780 ) ) ( not ( = ?auto_195777 ?auto_195778 ) ) ( not ( = ?auto_195777 ?auto_195779 ) ) ( not ( = ?auto_195777 ?auto_195780 ) ) ( not ( = ?auto_195778 ?auto_195779 ) ) ( not ( = ?auto_195778 ?auto_195780 ) ) ( not ( = ?auto_195779 ?auto_195780 ) ) ( ON ?auto_195778 ?auto_195779 ) ( ON ?auto_195777 ?auto_195778 ) ( CLEAR ?auto_195775 ) ( ON ?auto_195776 ?auto_195777 ) ( CLEAR ?auto_195776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195770 ?auto_195771 ?auto_195772 ?auto_195773 ?auto_195774 ?auto_195775 ?auto_195776 )
      ( MAKE-10PILE ?auto_195770 ?auto_195771 ?auto_195772 ?auto_195773 ?auto_195774 ?auto_195775 ?auto_195776 ?auto_195777 ?auto_195778 ?auto_195779 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195791 - BLOCK
      ?auto_195792 - BLOCK
      ?auto_195793 - BLOCK
      ?auto_195794 - BLOCK
      ?auto_195795 - BLOCK
      ?auto_195796 - BLOCK
      ?auto_195797 - BLOCK
      ?auto_195798 - BLOCK
      ?auto_195799 - BLOCK
      ?auto_195800 - BLOCK
    )
    :vars
    (
      ?auto_195801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195800 ?auto_195801 ) ( ON-TABLE ?auto_195791 ) ( ON ?auto_195792 ?auto_195791 ) ( ON ?auto_195793 ?auto_195792 ) ( ON ?auto_195794 ?auto_195793 ) ( ON ?auto_195795 ?auto_195794 ) ( ON ?auto_195796 ?auto_195795 ) ( not ( = ?auto_195791 ?auto_195792 ) ) ( not ( = ?auto_195791 ?auto_195793 ) ) ( not ( = ?auto_195791 ?auto_195794 ) ) ( not ( = ?auto_195791 ?auto_195795 ) ) ( not ( = ?auto_195791 ?auto_195796 ) ) ( not ( = ?auto_195791 ?auto_195797 ) ) ( not ( = ?auto_195791 ?auto_195798 ) ) ( not ( = ?auto_195791 ?auto_195799 ) ) ( not ( = ?auto_195791 ?auto_195800 ) ) ( not ( = ?auto_195791 ?auto_195801 ) ) ( not ( = ?auto_195792 ?auto_195793 ) ) ( not ( = ?auto_195792 ?auto_195794 ) ) ( not ( = ?auto_195792 ?auto_195795 ) ) ( not ( = ?auto_195792 ?auto_195796 ) ) ( not ( = ?auto_195792 ?auto_195797 ) ) ( not ( = ?auto_195792 ?auto_195798 ) ) ( not ( = ?auto_195792 ?auto_195799 ) ) ( not ( = ?auto_195792 ?auto_195800 ) ) ( not ( = ?auto_195792 ?auto_195801 ) ) ( not ( = ?auto_195793 ?auto_195794 ) ) ( not ( = ?auto_195793 ?auto_195795 ) ) ( not ( = ?auto_195793 ?auto_195796 ) ) ( not ( = ?auto_195793 ?auto_195797 ) ) ( not ( = ?auto_195793 ?auto_195798 ) ) ( not ( = ?auto_195793 ?auto_195799 ) ) ( not ( = ?auto_195793 ?auto_195800 ) ) ( not ( = ?auto_195793 ?auto_195801 ) ) ( not ( = ?auto_195794 ?auto_195795 ) ) ( not ( = ?auto_195794 ?auto_195796 ) ) ( not ( = ?auto_195794 ?auto_195797 ) ) ( not ( = ?auto_195794 ?auto_195798 ) ) ( not ( = ?auto_195794 ?auto_195799 ) ) ( not ( = ?auto_195794 ?auto_195800 ) ) ( not ( = ?auto_195794 ?auto_195801 ) ) ( not ( = ?auto_195795 ?auto_195796 ) ) ( not ( = ?auto_195795 ?auto_195797 ) ) ( not ( = ?auto_195795 ?auto_195798 ) ) ( not ( = ?auto_195795 ?auto_195799 ) ) ( not ( = ?auto_195795 ?auto_195800 ) ) ( not ( = ?auto_195795 ?auto_195801 ) ) ( not ( = ?auto_195796 ?auto_195797 ) ) ( not ( = ?auto_195796 ?auto_195798 ) ) ( not ( = ?auto_195796 ?auto_195799 ) ) ( not ( = ?auto_195796 ?auto_195800 ) ) ( not ( = ?auto_195796 ?auto_195801 ) ) ( not ( = ?auto_195797 ?auto_195798 ) ) ( not ( = ?auto_195797 ?auto_195799 ) ) ( not ( = ?auto_195797 ?auto_195800 ) ) ( not ( = ?auto_195797 ?auto_195801 ) ) ( not ( = ?auto_195798 ?auto_195799 ) ) ( not ( = ?auto_195798 ?auto_195800 ) ) ( not ( = ?auto_195798 ?auto_195801 ) ) ( not ( = ?auto_195799 ?auto_195800 ) ) ( not ( = ?auto_195799 ?auto_195801 ) ) ( not ( = ?auto_195800 ?auto_195801 ) ) ( ON ?auto_195799 ?auto_195800 ) ( ON ?auto_195798 ?auto_195799 ) ( CLEAR ?auto_195796 ) ( ON ?auto_195797 ?auto_195798 ) ( CLEAR ?auto_195797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195791 ?auto_195792 ?auto_195793 ?auto_195794 ?auto_195795 ?auto_195796 ?auto_195797 )
      ( MAKE-10PILE ?auto_195791 ?auto_195792 ?auto_195793 ?auto_195794 ?auto_195795 ?auto_195796 ?auto_195797 ?auto_195798 ?auto_195799 ?auto_195800 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195812 - BLOCK
      ?auto_195813 - BLOCK
      ?auto_195814 - BLOCK
      ?auto_195815 - BLOCK
      ?auto_195816 - BLOCK
      ?auto_195817 - BLOCK
      ?auto_195818 - BLOCK
      ?auto_195819 - BLOCK
      ?auto_195820 - BLOCK
      ?auto_195821 - BLOCK
    )
    :vars
    (
      ?auto_195822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195821 ?auto_195822 ) ( ON-TABLE ?auto_195812 ) ( ON ?auto_195813 ?auto_195812 ) ( ON ?auto_195814 ?auto_195813 ) ( ON ?auto_195815 ?auto_195814 ) ( ON ?auto_195816 ?auto_195815 ) ( not ( = ?auto_195812 ?auto_195813 ) ) ( not ( = ?auto_195812 ?auto_195814 ) ) ( not ( = ?auto_195812 ?auto_195815 ) ) ( not ( = ?auto_195812 ?auto_195816 ) ) ( not ( = ?auto_195812 ?auto_195817 ) ) ( not ( = ?auto_195812 ?auto_195818 ) ) ( not ( = ?auto_195812 ?auto_195819 ) ) ( not ( = ?auto_195812 ?auto_195820 ) ) ( not ( = ?auto_195812 ?auto_195821 ) ) ( not ( = ?auto_195812 ?auto_195822 ) ) ( not ( = ?auto_195813 ?auto_195814 ) ) ( not ( = ?auto_195813 ?auto_195815 ) ) ( not ( = ?auto_195813 ?auto_195816 ) ) ( not ( = ?auto_195813 ?auto_195817 ) ) ( not ( = ?auto_195813 ?auto_195818 ) ) ( not ( = ?auto_195813 ?auto_195819 ) ) ( not ( = ?auto_195813 ?auto_195820 ) ) ( not ( = ?auto_195813 ?auto_195821 ) ) ( not ( = ?auto_195813 ?auto_195822 ) ) ( not ( = ?auto_195814 ?auto_195815 ) ) ( not ( = ?auto_195814 ?auto_195816 ) ) ( not ( = ?auto_195814 ?auto_195817 ) ) ( not ( = ?auto_195814 ?auto_195818 ) ) ( not ( = ?auto_195814 ?auto_195819 ) ) ( not ( = ?auto_195814 ?auto_195820 ) ) ( not ( = ?auto_195814 ?auto_195821 ) ) ( not ( = ?auto_195814 ?auto_195822 ) ) ( not ( = ?auto_195815 ?auto_195816 ) ) ( not ( = ?auto_195815 ?auto_195817 ) ) ( not ( = ?auto_195815 ?auto_195818 ) ) ( not ( = ?auto_195815 ?auto_195819 ) ) ( not ( = ?auto_195815 ?auto_195820 ) ) ( not ( = ?auto_195815 ?auto_195821 ) ) ( not ( = ?auto_195815 ?auto_195822 ) ) ( not ( = ?auto_195816 ?auto_195817 ) ) ( not ( = ?auto_195816 ?auto_195818 ) ) ( not ( = ?auto_195816 ?auto_195819 ) ) ( not ( = ?auto_195816 ?auto_195820 ) ) ( not ( = ?auto_195816 ?auto_195821 ) ) ( not ( = ?auto_195816 ?auto_195822 ) ) ( not ( = ?auto_195817 ?auto_195818 ) ) ( not ( = ?auto_195817 ?auto_195819 ) ) ( not ( = ?auto_195817 ?auto_195820 ) ) ( not ( = ?auto_195817 ?auto_195821 ) ) ( not ( = ?auto_195817 ?auto_195822 ) ) ( not ( = ?auto_195818 ?auto_195819 ) ) ( not ( = ?auto_195818 ?auto_195820 ) ) ( not ( = ?auto_195818 ?auto_195821 ) ) ( not ( = ?auto_195818 ?auto_195822 ) ) ( not ( = ?auto_195819 ?auto_195820 ) ) ( not ( = ?auto_195819 ?auto_195821 ) ) ( not ( = ?auto_195819 ?auto_195822 ) ) ( not ( = ?auto_195820 ?auto_195821 ) ) ( not ( = ?auto_195820 ?auto_195822 ) ) ( not ( = ?auto_195821 ?auto_195822 ) ) ( ON ?auto_195820 ?auto_195821 ) ( ON ?auto_195819 ?auto_195820 ) ( ON ?auto_195818 ?auto_195819 ) ( CLEAR ?auto_195816 ) ( ON ?auto_195817 ?auto_195818 ) ( CLEAR ?auto_195817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195812 ?auto_195813 ?auto_195814 ?auto_195815 ?auto_195816 ?auto_195817 )
      ( MAKE-10PILE ?auto_195812 ?auto_195813 ?auto_195814 ?auto_195815 ?auto_195816 ?auto_195817 ?auto_195818 ?auto_195819 ?auto_195820 ?auto_195821 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195833 - BLOCK
      ?auto_195834 - BLOCK
      ?auto_195835 - BLOCK
      ?auto_195836 - BLOCK
      ?auto_195837 - BLOCK
      ?auto_195838 - BLOCK
      ?auto_195839 - BLOCK
      ?auto_195840 - BLOCK
      ?auto_195841 - BLOCK
      ?auto_195842 - BLOCK
    )
    :vars
    (
      ?auto_195843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195842 ?auto_195843 ) ( ON-TABLE ?auto_195833 ) ( ON ?auto_195834 ?auto_195833 ) ( ON ?auto_195835 ?auto_195834 ) ( ON ?auto_195836 ?auto_195835 ) ( ON ?auto_195837 ?auto_195836 ) ( not ( = ?auto_195833 ?auto_195834 ) ) ( not ( = ?auto_195833 ?auto_195835 ) ) ( not ( = ?auto_195833 ?auto_195836 ) ) ( not ( = ?auto_195833 ?auto_195837 ) ) ( not ( = ?auto_195833 ?auto_195838 ) ) ( not ( = ?auto_195833 ?auto_195839 ) ) ( not ( = ?auto_195833 ?auto_195840 ) ) ( not ( = ?auto_195833 ?auto_195841 ) ) ( not ( = ?auto_195833 ?auto_195842 ) ) ( not ( = ?auto_195833 ?auto_195843 ) ) ( not ( = ?auto_195834 ?auto_195835 ) ) ( not ( = ?auto_195834 ?auto_195836 ) ) ( not ( = ?auto_195834 ?auto_195837 ) ) ( not ( = ?auto_195834 ?auto_195838 ) ) ( not ( = ?auto_195834 ?auto_195839 ) ) ( not ( = ?auto_195834 ?auto_195840 ) ) ( not ( = ?auto_195834 ?auto_195841 ) ) ( not ( = ?auto_195834 ?auto_195842 ) ) ( not ( = ?auto_195834 ?auto_195843 ) ) ( not ( = ?auto_195835 ?auto_195836 ) ) ( not ( = ?auto_195835 ?auto_195837 ) ) ( not ( = ?auto_195835 ?auto_195838 ) ) ( not ( = ?auto_195835 ?auto_195839 ) ) ( not ( = ?auto_195835 ?auto_195840 ) ) ( not ( = ?auto_195835 ?auto_195841 ) ) ( not ( = ?auto_195835 ?auto_195842 ) ) ( not ( = ?auto_195835 ?auto_195843 ) ) ( not ( = ?auto_195836 ?auto_195837 ) ) ( not ( = ?auto_195836 ?auto_195838 ) ) ( not ( = ?auto_195836 ?auto_195839 ) ) ( not ( = ?auto_195836 ?auto_195840 ) ) ( not ( = ?auto_195836 ?auto_195841 ) ) ( not ( = ?auto_195836 ?auto_195842 ) ) ( not ( = ?auto_195836 ?auto_195843 ) ) ( not ( = ?auto_195837 ?auto_195838 ) ) ( not ( = ?auto_195837 ?auto_195839 ) ) ( not ( = ?auto_195837 ?auto_195840 ) ) ( not ( = ?auto_195837 ?auto_195841 ) ) ( not ( = ?auto_195837 ?auto_195842 ) ) ( not ( = ?auto_195837 ?auto_195843 ) ) ( not ( = ?auto_195838 ?auto_195839 ) ) ( not ( = ?auto_195838 ?auto_195840 ) ) ( not ( = ?auto_195838 ?auto_195841 ) ) ( not ( = ?auto_195838 ?auto_195842 ) ) ( not ( = ?auto_195838 ?auto_195843 ) ) ( not ( = ?auto_195839 ?auto_195840 ) ) ( not ( = ?auto_195839 ?auto_195841 ) ) ( not ( = ?auto_195839 ?auto_195842 ) ) ( not ( = ?auto_195839 ?auto_195843 ) ) ( not ( = ?auto_195840 ?auto_195841 ) ) ( not ( = ?auto_195840 ?auto_195842 ) ) ( not ( = ?auto_195840 ?auto_195843 ) ) ( not ( = ?auto_195841 ?auto_195842 ) ) ( not ( = ?auto_195841 ?auto_195843 ) ) ( not ( = ?auto_195842 ?auto_195843 ) ) ( ON ?auto_195841 ?auto_195842 ) ( ON ?auto_195840 ?auto_195841 ) ( ON ?auto_195839 ?auto_195840 ) ( CLEAR ?auto_195837 ) ( ON ?auto_195838 ?auto_195839 ) ( CLEAR ?auto_195838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195833 ?auto_195834 ?auto_195835 ?auto_195836 ?auto_195837 ?auto_195838 )
      ( MAKE-10PILE ?auto_195833 ?auto_195834 ?auto_195835 ?auto_195836 ?auto_195837 ?auto_195838 ?auto_195839 ?auto_195840 ?auto_195841 ?auto_195842 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195854 - BLOCK
      ?auto_195855 - BLOCK
      ?auto_195856 - BLOCK
      ?auto_195857 - BLOCK
      ?auto_195858 - BLOCK
      ?auto_195859 - BLOCK
      ?auto_195860 - BLOCK
      ?auto_195861 - BLOCK
      ?auto_195862 - BLOCK
      ?auto_195863 - BLOCK
    )
    :vars
    (
      ?auto_195864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195863 ?auto_195864 ) ( ON-TABLE ?auto_195854 ) ( ON ?auto_195855 ?auto_195854 ) ( ON ?auto_195856 ?auto_195855 ) ( ON ?auto_195857 ?auto_195856 ) ( not ( = ?auto_195854 ?auto_195855 ) ) ( not ( = ?auto_195854 ?auto_195856 ) ) ( not ( = ?auto_195854 ?auto_195857 ) ) ( not ( = ?auto_195854 ?auto_195858 ) ) ( not ( = ?auto_195854 ?auto_195859 ) ) ( not ( = ?auto_195854 ?auto_195860 ) ) ( not ( = ?auto_195854 ?auto_195861 ) ) ( not ( = ?auto_195854 ?auto_195862 ) ) ( not ( = ?auto_195854 ?auto_195863 ) ) ( not ( = ?auto_195854 ?auto_195864 ) ) ( not ( = ?auto_195855 ?auto_195856 ) ) ( not ( = ?auto_195855 ?auto_195857 ) ) ( not ( = ?auto_195855 ?auto_195858 ) ) ( not ( = ?auto_195855 ?auto_195859 ) ) ( not ( = ?auto_195855 ?auto_195860 ) ) ( not ( = ?auto_195855 ?auto_195861 ) ) ( not ( = ?auto_195855 ?auto_195862 ) ) ( not ( = ?auto_195855 ?auto_195863 ) ) ( not ( = ?auto_195855 ?auto_195864 ) ) ( not ( = ?auto_195856 ?auto_195857 ) ) ( not ( = ?auto_195856 ?auto_195858 ) ) ( not ( = ?auto_195856 ?auto_195859 ) ) ( not ( = ?auto_195856 ?auto_195860 ) ) ( not ( = ?auto_195856 ?auto_195861 ) ) ( not ( = ?auto_195856 ?auto_195862 ) ) ( not ( = ?auto_195856 ?auto_195863 ) ) ( not ( = ?auto_195856 ?auto_195864 ) ) ( not ( = ?auto_195857 ?auto_195858 ) ) ( not ( = ?auto_195857 ?auto_195859 ) ) ( not ( = ?auto_195857 ?auto_195860 ) ) ( not ( = ?auto_195857 ?auto_195861 ) ) ( not ( = ?auto_195857 ?auto_195862 ) ) ( not ( = ?auto_195857 ?auto_195863 ) ) ( not ( = ?auto_195857 ?auto_195864 ) ) ( not ( = ?auto_195858 ?auto_195859 ) ) ( not ( = ?auto_195858 ?auto_195860 ) ) ( not ( = ?auto_195858 ?auto_195861 ) ) ( not ( = ?auto_195858 ?auto_195862 ) ) ( not ( = ?auto_195858 ?auto_195863 ) ) ( not ( = ?auto_195858 ?auto_195864 ) ) ( not ( = ?auto_195859 ?auto_195860 ) ) ( not ( = ?auto_195859 ?auto_195861 ) ) ( not ( = ?auto_195859 ?auto_195862 ) ) ( not ( = ?auto_195859 ?auto_195863 ) ) ( not ( = ?auto_195859 ?auto_195864 ) ) ( not ( = ?auto_195860 ?auto_195861 ) ) ( not ( = ?auto_195860 ?auto_195862 ) ) ( not ( = ?auto_195860 ?auto_195863 ) ) ( not ( = ?auto_195860 ?auto_195864 ) ) ( not ( = ?auto_195861 ?auto_195862 ) ) ( not ( = ?auto_195861 ?auto_195863 ) ) ( not ( = ?auto_195861 ?auto_195864 ) ) ( not ( = ?auto_195862 ?auto_195863 ) ) ( not ( = ?auto_195862 ?auto_195864 ) ) ( not ( = ?auto_195863 ?auto_195864 ) ) ( ON ?auto_195862 ?auto_195863 ) ( ON ?auto_195861 ?auto_195862 ) ( ON ?auto_195860 ?auto_195861 ) ( ON ?auto_195859 ?auto_195860 ) ( CLEAR ?auto_195857 ) ( ON ?auto_195858 ?auto_195859 ) ( CLEAR ?auto_195858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195854 ?auto_195855 ?auto_195856 ?auto_195857 ?auto_195858 )
      ( MAKE-10PILE ?auto_195854 ?auto_195855 ?auto_195856 ?auto_195857 ?auto_195858 ?auto_195859 ?auto_195860 ?auto_195861 ?auto_195862 ?auto_195863 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195875 - BLOCK
      ?auto_195876 - BLOCK
      ?auto_195877 - BLOCK
      ?auto_195878 - BLOCK
      ?auto_195879 - BLOCK
      ?auto_195880 - BLOCK
      ?auto_195881 - BLOCK
      ?auto_195882 - BLOCK
      ?auto_195883 - BLOCK
      ?auto_195884 - BLOCK
    )
    :vars
    (
      ?auto_195885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195884 ?auto_195885 ) ( ON-TABLE ?auto_195875 ) ( ON ?auto_195876 ?auto_195875 ) ( ON ?auto_195877 ?auto_195876 ) ( ON ?auto_195878 ?auto_195877 ) ( not ( = ?auto_195875 ?auto_195876 ) ) ( not ( = ?auto_195875 ?auto_195877 ) ) ( not ( = ?auto_195875 ?auto_195878 ) ) ( not ( = ?auto_195875 ?auto_195879 ) ) ( not ( = ?auto_195875 ?auto_195880 ) ) ( not ( = ?auto_195875 ?auto_195881 ) ) ( not ( = ?auto_195875 ?auto_195882 ) ) ( not ( = ?auto_195875 ?auto_195883 ) ) ( not ( = ?auto_195875 ?auto_195884 ) ) ( not ( = ?auto_195875 ?auto_195885 ) ) ( not ( = ?auto_195876 ?auto_195877 ) ) ( not ( = ?auto_195876 ?auto_195878 ) ) ( not ( = ?auto_195876 ?auto_195879 ) ) ( not ( = ?auto_195876 ?auto_195880 ) ) ( not ( = ?auto_195876 ?auto_195881 ) ) ( not ( = ?auto_195876 ?auto_195882 ) ) ( not ( = ?auto_195876 ?auto_195883 ) ) ( not ( = ?auto_195876 ?auto_195884 ) ) ( not ( = ?auto_195876 ?auto_195885 ) ) ( not ( = ?auto_195877 ?auto_195878 ) ) ( not ( = ?auto_195877 ?auto_195879 ) ) ( not ( = ?auto_195877 ?auto_195880 ) ) ( not ( = ?auto_195877 ?auto_195881 ) ) ( not ( = ?auto_195877 ?auto_195882 ) ) ( not ( = ?auto_195877 ?auto_195883 ) ) ( not ( = ?auto_195877 ?auto_195884 ) ) ( not ( = ?auto_195877 ?auto_195885 ) ) ( not ( = ?auto_195878 ?auto_195879 ) ) ( not ( = ?auto_195878 ?auto_195880 ) ) ( not ( = ?auto_195878 ?auto_195881 ) ) ( not ( = ?auto_195878 ?auto_195882 ) ) ( not ( = ?auto_195878 ?auto_195883 ) ) ( not ( = ?auto_195878 ?auto_195884 ) ) ( not ( = ?auto_195878 ?auto_195885 ) ) ( not ( = ?auto_195879 ?auto_195880 ) ) ( not ( = ?auto_195879 ?auto_195881 ) ) ( not ( = ?auto_195879 ?auto_195882 ) ) ( not ( = ?auto_195879 ?auto_195883 ) ) ( not ( = ?auto_195879 ?auto_195884 ) ) ( not ( = ?auto_195879 ?auto_195885 ) ) ( not ( = ?auto_195880 ?auto_195881 ) ) ( not ( = ?auto_195880 ?auto_195882 ) ) ( not ( = ?auto_195880 ?auto_195883 ) ) ( not ( = ?auto_195880 ?auto_195884 ) ) ( not ( = ?auto_195880 ?auto_195885 ) ) ( not ( = ?auto_195881 ?auto_195882 ) ) ( not ( = ?auto_195881 ?auto_195883 ) ) ( not ( = ?auto_195881 ?auto_195884 ) ) ( not ( = ?auto_195881 ?auto_195885 ) ) ( not ( = ?auto_195882 ?auto_195883 ) ) ( not ( = ?auto_195882 ?auto_195884 ) ) ( not ( = ?auto_195882 ?auto_195885 ) ) ( not ( = ?auto_195883 ?auto_195884 ) ) ( not ( = ?auto_195883 ?auto_195885 ) ) ( not ( = ?auto_195884 ?auto_195885 ) ) ( ON ?auto_195883 ?auto_195884 ) ( ON ?auto_195882 ?auto_195883 ) ( ON ?auto_195881 ?auto_195882 ) ( ON ?auto_195880 ?auto_195881 ) ( CLEAR ?auto_195878 ) ( ON ?auto_195879 ?auto_195880 ) ( CLEAR ?auto_195879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195875 ?auto_195876 ?auto_195877 ?auto_195878 ?auto_195879 )
      ( MAKE-10PILE ?auto_195875 ?auto_195876 ?auto_195877 ?auto_195878 ?auto_195879 ?auto_195880 ?auto_195881 ?auto_195882 ?auto_195883 ?auto_195884 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195896 - BLOCK
      ?auto_195897 - BLOCK
      ?auto_195898 - BLOCK
      ?auto_195899 - BLOCK
      ?auto_195900 - BLOCK
      ?auto_195901 - BLOCK
      ?auto_195902 - BLOCK
      ?auto_195903 - BLOCK
      ?auto_195904 - BLOCK
      ?auto_195905 - BLOCK
    )
    :vars
    (
      ?auto_195906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195905 ?auto_195906 ) ( ON-TABLE ?auto_195896 ) ( ON ?auto_195897 ?auto_195896 ) ( ON ?auto_195898 ?auto_195897 ) ( not ( = ?auto_195896 ?auto_195897 ) ) ( not ( = ?auto_195896 ?auto_195898 ) ) ( not ( = ?auto_195896 ?auto_195899 ) ) ( not ( = ?auto_195896 ?auto_195900 ) ) ( not ( = ?auto_195896 ?auto_195901 ) ) ( not ( = ?auto_195896 ?auto_195902 ) ) ( not ( = ?auto_195896 ?auto_195903 ) ) ( not ( = ?auto_195896 ?auto_195904 ) ) ( not ( = ?auto_195896 ?auto_195905 ) ) ( not ( = ?auto_195896 ?auto_195906 ) ) ( not ( = ?auto_195897 ?auto_195898 ) ) ( not ( = ?auto_195897 ?auto_195899 ) ) ( not ( = ?auto_195897 ?auto_195900 ) ) ( not ( = ?auto_195897 ?auto_195901 ) ) ( not ( = ?auto_195897 ?auto_195902 ) ) ( not ( = ?auto_195897 ?auto_195903 ) ) ( not ( = ?auto_195897 ?auto_195904 ) ) ( not ( = ?auto_195897 ?auto_195905 ) ) ( not ( = ?auto_195897 ?auto_195906 ) ) ( not ( = ?auto_195898 ?auto_195899 ) ) ( not ( = ?auto_195898 ?auto_195900 ) ) ( not ( = ?auto_195898 ?auto_195901 ) ) ( not ( = ?auto_195898 ?auto_195902 ) ) ( not ( = ?auto_195898 ?auto_195903 ) ) ( not ( = ?auto_195898 ?auto_195904 ) ) ( not ( = ?auto_195898 ?auto_195905 ) ) ( not ( = ?auto_195898 ?auto_195906 ) ) ( not ( = ?auto_195899 ?auto_195900 ) ) ( not ( = ?auto_195899 ?auto_195901 ) ) ( not ( = ?auto_195899 ?auto_195902 ) ) ( not ( = ?auto_195899 ?auto_195903 ) ) ( not ( = ?auto_195899 ?auto_195904 ) ) ( not ( = ?auto_195899 ?auto_195905 ) ) ( not ( = ?auto_195899 ?auto_195906 ) ) ( not ( = ?auto_195900 ?auto_195901 ) ) ( not ( = ?auto_195900 ?auto_195902 ) ) ( not ( = ?auto_195900 ?auto_195903 ) ) ( not ( = ?auto_195900 ?auto_195904 ) ) ( not ( = ?auto_195900 ?auto_195905 ) ) ( not ( = ?auto_195900 ?auto_195906 ) ) ( not ( = ?auto_195901 ?auto_195902 ) ) ( not ( = ?auto_195901 ?auto_195903 ) ) ( not ( = ?auto_195901 ?auto_195904 ) ) ( not ( = ?auto_195901 ?auto_195905 ) ) ( not ( = ?auto_195901 ?auto_195906 ) ) ( not ( = ?auto_195902 ?auto_195903 ) ) ( not ( = ?auto_195902 ?auto_195904 ) ) ( not ( = ?auto_195902 ?auto_195905 ) ) ( not ( = ?auto_195902 ?auto_195906 ) ) ( not ( = ?auto_195903 ?auto_195904 ) ) ( not ( = ?auto_195903 ?auto_195905 ) ) ( not ( = ?auto_195903 ?auto_195906 ) ) ( not ( = ?auto_195904 ?auto_195905 ) ) ( not ( = ?auto_195904 ?auto_195906 ) ) ( not ( = ?auto_195905 ?auto_195906 ) ) ( ON ?auto_195904 ?auto_195905 ) ( ON ?auto_195903 ?auto_195904 ) ( ON ?auto_195902 ?auto_195903 ) ( ON ?auto_195901 ?auto_195902 ) ( ON ?auto_195900 ?auto_195901 ) ( CLEAR ?auto_195898 ) ( ON ?auto_195899 ?auto_195900 ) ( CLEAR ?auto_195899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195896 ?auto_195897 ?auto_195898 ?auto_195899 )
      ( MAKE-10PILE ?auto_195896 ?auto_195897 ?auto_195898 ?auto_195899 ?auto_195900 ?auto_195901 ?auto_195902 ?auto_195903 ?auto_195904 ?auto_195905 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195917 - BLOCK
      ?auto_195918 - BLOCK
      ?auto_195919 - BLOCK
      ?auto_195920 - BLOCK
      ?auto_195921 - BLOCK
      ?auto_195922 - BLOCK
      ?auto_195923 - BLOCK
      ?auto_195924 - BLOCK
      ?auto_195925 - BLOCK
      ?auto_195926 - BLOCK
    )
    :vars
    (
      ?auto_195927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195926 ?auto_195927 ) ( ON-TABLE ?auto_195917 ) ( ON ?auto_195918 ?auto_195917 ) ( ON ?auto_195919 ?auto_195918 ) ( not ( = ?auto_195917 ?auto_195918 ) ) ( not ( = ?auto_195917 ?auto_195919 ) ) ( not ( = ?auto_195917 ?auto_195920 ) ) ( not ( = ?auto_195917 ?auto_195921 ) ) ( not ( = ?auto_195917 ?auto_195922 ) ) ( not ( = ?auto_195917 ?auto_195923 ) ) ( not ( = ?auto_195917 ?auto_195924 ) ) ( not ( = ?auto_195917 ?auto_195925 ) ) ( not ( = ?auto_195917 ?auto_195926 ) ) ( not ( = ?auto_195917 ?auto_195927 ) ) ( not ( = ?auto_195918 ?auto_195919 ) ) ( not ( = ?auto_195918 ?auto_195920 ) ) ( not ( = ?auto_195918 ?auto_195921 ) ) ( not ( = ?auto_195918 ?auto_195922 ) ) ( not ( = ?auto_195918 ?auto_195923 ) ) ( not ( = ?auto_195918 ?auto_195924 ) ) ( not ( = ?auto_195918 ?auto_195925 ) ) ( not ( = ?auto_195918 ?auto_195926 ) ) ( not ( = ?auto_195918 ?auto_195927 ) ) ( not ( = ?auto_195919 ?auto_195920 ) ) ( not ( = ?auto_195919 ?auto_195921 ) ) ( not ( = ?auto_195919 ?auto_195922 ) ) ( not ( = ?auto_195919 ?auto_195923 ) ) ( not ( = ?auto_195919 ?auto_195924 ) ) ( not ( = ?auto_195919 ?auto_195925 ) ) ( not ( = ?auto_195919 ?auto_195926 ) ) ( not ( = ?auto_195919 ?auto_195927 ) ) ( not ( = ?auto_195920 ?auto_195921 ) ) ( not ( = ?auto_195920 ?auto_195922 ) ) ( not ( = ?auto_195920 ?auto_195923 ) ) ( not ( = ?auto_195920 ?auto_195924 ) ) ( not ( = ?auto_195920 ?auto_195925 ) ) ( not ( = ?auto_195920 ?auto_195926 ) ) ( not ( = ?auto_195920 ?auto_195927 ) ) ( not ( = ?auto_195921 ?auto_195922 ) ) ( not ( = ?auto_195921 ?auto_195923 ) ) ( not ( = ?auto_195921 ?auto_195924 ) ) ( not ( = ?auto_195921 ?auto_195925 ) ) ( not ( = ?auto_195921 ?auto_195926 ) ) ( not ( = ?auto_195921 ?auto_195927 ) ) ( not ( = ?auto_195922 ?auto_195923 ) ) ( not ( = ?auto_195922 ?auto_195924 ) ) ( not ( = ?auto_195922 ?auto_195925 ) ) ( not ( = ?auto_195922 ?auto_195926 ) ) ( not ( = ?auto_195922 ?auto_195927 ) ) ( not ( = ?auto_195923 ?auto_195924 ) ) ( not ( = ?auto_195923 ?auto_195925 ) ) ( not ( = ?auto_195923 ?auto_195926 ) ) ( not ( = ?auto_195923 ?auto_195927 ) ) ( not ( = ?auto_195924 ?auto_195925 ) ) ( not ( = ?auto_195924 ?auto_195926 ) ) ( not ( = ?auto_195924 ?auto_195927 ) ) ( not ( = ?auto_195925 ?auto_195926 ) ) ( not ( = ?auto_195925 ?auto_195927 ) ) ( not ( = ?auto_195926 ?auto_195927 ) ) ( ON ?auto_195925 ?auto_195926 ) ( ON ?auto_195924 ?auto_195925 ) ( ON ?auto_195923 ?auto_195924 ) ( ON ?auto_195922 ?auto_195923 ) ( ON ?auto_195921 ?auto_195922 ) ( CLEAR ?auto_195919 ) ( ON ?auto_195920 ?auto_195921 ) ( CLEAR ?auto_195920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195917 ?auto_195918 ?auto_195919 ?auto_195920 )
      ( MAKE-10PILE ?auto_195917 ?auto_195918 ?auto_195919 ?auto_195920 ?auto_195921 ?auto_195922 ?auto_195923 ?auto_195924 ?auto_195925 ?auto_195926 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195938 - BLOCK
      ?auto_195939 - BLOCK
      ?auto_195940 - BLOCK
      ?auto_195941 - BLOCK
      ?auto_195942 - BLOCK
      ?auto_195943 - BLOCK
      ?auto_195944 - BLOCK
      ?auto_195945 - BLOCK
      ?auto_195946 - BLOCK
      ?auto_195947 - BLOCK
    )
    :vars
    (
      ?auto_195948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195947 ?auto_195948 ) ( ON-TABLE ?auto_195938 ) ( ON ?auto_195939 ?auto_195938 ) ( not ( = ?auto_195938 ?auto_195939 ) ) ( not ( = ?auto_195938 ?auto_195940 ) ) ( not ( = ?auto_195938 ?auto_195941 ) ) ( not ( = ?auto_195938 ?auto_195942 ) ) ( not ( = ?auto_195938 ?auto_195943 ) ) ( not ( = ?auto_195938 ?auto_195944 ) ) ( not ( = ?auto_195938 ?auto_195945 ) ) ( not ( = ?auto_195938 ?auto_195946 ) ) ( not ( = ?auto_195938 ?auto_195947 ) ) ( not ( = ?auto_195938 ?auto_195948 ) ) ( not ( = ?auto_195939 ?auto_195940 ) ) ( not ( = ?auto_195939 ?auto_195941 ) ) ( not ( = ?auto_195939 ?auto_195942 ) ) ( not ( = ?auto_195939 ?auto_195943 ) ) ( not ( = ?auto_195939 ?auto_195944 ) ) ( not ( = ?auto_195939 ?auto_195945 ) ) ( not ( = ?auto_195939 ?auto_195946 ) ) ( not ( = ?auto_195939 ?auto_195947 ) ) ( not ( = ?auto_195939 ?auto_195948 ) ) ( not ( = ?auto_195940 ?auto_195941 ) ) ( not ( = ?auto_195940 ?auto_195942 ) ) ( not ( = ?auto_195940 ?auto_195943 ) ) ( not ( = ?auto_195940 ?auto_195944 ) ) ( not ( = ?auto_195940 ?auto_195945 ) ) ( not ( = ?auto_195940 ?auto_195946 ) ) ( not ( = ?auto_195940 ?auto_195947 ) ) ( not ( = ?auto_195940 ?auto_195948 ) ) ( not ( = ?auto_195941 ?auto_195942 ) ) ( not ( = ?auto_195941 ?auto_195943 ) ) ( not ( = ?auto_195941 ?auto_195944 ) ) ( not ( = ?auto_195941 ?auto_195945 ) ) ( not ( = ?auto_195941 ?auto_195946 ) ) ( not ( = ?auto_195941 ?auto_195947 ) ) ( not ( = ?auto_195941 ?auto_195948 ) ) ( not ( = ?auto_195942 ?auto_195943 ) ) ( not ( = ?auto_195942 ?auto_195944 ) ) ( not ( = ?auto_195942 ?auto_195945 ) ) ( not ( = ?auto_195942 ?auto_195946 ) ) ( not ( = ?auto_195942 ?auto_195947 ) ) ( not ( = ?auto_195942 ?auto_195948 ) ) ( not ( = ?auto_195943 ?auto_195944 ) ) ( not ( = ?auto_195943 ?auto_195945 ) ) ( not ( = ?auto_195943 ?auto_195946 ) ) ( not ( = ?auto_195943 ?auto_195947 ) ) ( not ( = ?auto_195943 ?auto_195948 ) ) ( not ( = ?auto_195944 ?auto_195945 ) ) ( not ( = ?auto_195944 ?auto_195946 ) ) ( not ( = ?auto_195944 ?auto_195947 ) ) ( not ( = ?auto_195944 ?auto_195948 ) ) ( not ( = ?auto_195945 ?auto_195946 ) ) ( not ( = ?auto_195945 ?auto_195947 ) ) ( not ( = ?auto_195945 ?auto_195948 ) ) ( not ( = ?auto_195946 ?auto_195947 ) ) ( not ( = ?auto_195946 ?auto_195948 ) ) ( not ( = ?auto_195947 ?auto_195948 ) ) ( ON ?auto_195946 ?auto_195947 ) ( ON ?auto_195945 ?auto_195946 ) ( ON ?auto_195944 ?auto_195945 ) ( ON ?auto_195943 ?auto_195944 ) ( ON ?auto_195942 ?auto_195943 ) ( ON ?auto_195941 ?auto_195942 ) ( CLEAR ?auto_195939 ) ( ON ?auto_195940 ?auto_195941 ) ( CLEAR ?auto_195940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195938 ?auto_195939 ?auto_195940 )
      ( MAKE-10PILE ?auto_195938 ?auto_195939 ?auto_195940 ?auto_195941 ?auto_195942 ?auto_195943 ?auto_195944 ?auto_195945 ?auto_195946 ?auto_195947 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195959 - BLOCK
      ?auto_195960 - BLOCK
      ?auto_195961 - BLOCK
      ?auto_195962 - BLOCK
      ?auto_195963 - BLOCK
      ?auto_195964 - BLOCK
      ?auto_195965 - BLOCK
      ?auto_195966 - BLOCK
      ?auto_195967 - BLOCK
      ?auto_195968 - BLOCK
    )
    :vars
    (
      ?auto_195969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195968 ?auto_195969 ) ( ON-TABLE ?auto_195959 ) ( ON ?auto_195960 ?auto_195959 ) ( not ( = ?auto_195959 ?auto_195960 ) ) ( not ( = ?auto_195959 ?auto_195961 ) ) ( not ( = ?auto_195959 ?auto_195962 ) ) ( not ( = ?auto_195959 ?auto_195963 ) ) ( not ( = ?auto_195959 ?auto_195964 ) ) ( not ( = ?auto_195959 ?auto_195965 ) ) ( not ( = ?auto_195959 ?auto_195966 ) ) ( not ( = ?auto_195959 ?auto_195967 ) ) ( not ( = ?auto_195959 ?auto_195968 ) ) ( not ( = ?auto_195959 ?auto_195969 ) ) ( not ( = ?auto_195960 ?auto_195961 ) ) ( not ( = ?auto_195960 ?auto_195962 ) ) ( not ( = ?auto_195960 ?auto_195963 ) ) ( not ( = ?auto_195960 ?auto_195964 ) ) ( not ( = ?auto_195960 ?auto_195965 ) ) ( not ( = ?auto_195960 ?auto_195966 ) ) ( not ( = ?auto_195960 ?auto_195967 ) ) ( not ( = ?auto_195960 ?auto_195968 ) ) ( not ( = ?auto_195960 ?auto_195969 ) ) ( not ( = ?auto_195961 ?auto_195962 ) ) ( not ( = ?auto_195961 ?auto_195963 ) ) ( not ( = ?auto_195961 ?auto_195964 ) ) ( not ( = ?auto_195961 ?auto_195965 ) ) ( not ( = ?auto_195961 ?auto_195966 ) ) ( not ( = ?auto_195961 ?auto_195967 ) ) ( not ( = ?auto_195961 ?auto_195968 ) ) ( not ( = ?auto_195961 ?auto_195969 ) ) ( not ( = ?auto_195962 ?auto_195963 ) ) ( not ( = ?auto_195962 ?auto_195964 ) ) ( not ( = ?auto_195962 ?auto_195965 ) ) ( not ( = ?auto_195962 ?auto_195966 ) ) ( not ( = ?auto_195962 ?auto_195967 ) ) ( not ( = ?auto_195962 ?auto_195968 ) ) ( not ( = ?auto_195962 ?auto_195969 ) ) ( not ( = ?auto_195963 ?auto_195964 ) ) ( not ( = ?auto_195963 ?auto_195965 ) ) ( not ( = ?auto_195963 ?auto_195966 ) ) ( not ( = ?auto_195963 ?auto_195967 ) ) ( not ( = ?auto_195963 ?auto_195968 ) ) ( not ( = ?auto_195963 ?auto_195969 ) ) ( not ( = ?auto_195964 ?auto_195965 ) ) ( not ( = ?auto_195964 ?auto_195966 ) ) ( not ( = ?auto_195964 ?auto_195967 ) ) ( not ( = ?auto_195964 ?auto_195968 ) ) ( not ( = ?auto_195964 ?auto_195969 ) ) ( not ( = ?auto_195965 ?auto_195966 ) ) ( not ( = ?auto_195965 ?auto_195967 ) ) ( not ( = ?auto_195965 ?auto_195968 ) ) ( not ( = ?auto_195965 ?auto_195969 ) ) ( not ( = ?auto_195966 ?auto_195967 ) ) ( not ( = ?auto_195966 ?auto_195968 ) ) ( not ( = ?auto_195966 ?auto_195969 ) ) ( not ( = ?auto_195967 ?auto_195968 ) ) ( not ( = ?auto_195967 ?auto_195969 ) ) ( not ( = ?auto_195968 ?auto_195969 ) ) ( ON ?auto_195967 ?auto_195968 ) ( ON ?auto_195966 ?auto_195967 ) ( ON ?auto_195965 ?auto_195966 ) ( ON ?auto_195964 ?auto_195965 ) ( ON ?auto_195963 ?auto_195964 ) ( ON ?auto_195962 ?auto_195963 ) ( CLEAR ?auto_195960 ) ( ON ?auto_195961 ?auto_195962 ) ( CLEAR ?auto_195961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195959 ?auto_195960 ?auto_195961 )
      ( MAKE-10PILE ?auto_195959 ?auto_195960 ?auto_195961 ?auto_195962 ?auto_195963 ?auto_195964 ?auto_195965 ?auto_195966 ?auto_195967 ?auto_195968 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_195980 - BLOCK
      ?auto_195981 - BLOCK
      ?auto_195982 - BLOCK
      ?auto_195983 - BLOCK
      ?auto_195984 - BLOCK
      ?auto_195985 - BLOCK
      ?auto_195986 - BLOCK
      ?auto_195987 - BLOCK
      ?auto_195988 - BLOCK
      ?auto_195989 - BLOCK
    )
    :vars
    (
      ?auto_195990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195989 ?auto_195990 ) ( ON-TABLE ?auto_195980 ) ( not ( = ?auto_195980 ?auto_195981 ) ) ( not ( = ?auto_195980 ?auto_195982 ) ) ( not ( = ?auto_195980 ?auto_195983 ) ) ( not ( = ?auto_195980 ?auto_195984 ) ) ( not ( = ?auto_195980 ?auto_195985 ) ) ( not ( = ?auto_195980 ?auto_195986 ) ) ( not ( = ?auto_195980 ?auto_195987 ) ) ( not ( = ?auto_195980 ?auto_195988 ) ) ( not ( = ?auto_195980 ?auto_195989 ) ) ( not ( = ?auto_195980 ?auto_195990 ) ) ( not ( = ?auto_195981 ?auto_195982 ) ) ( not ( = ?auto_195981 ?auto_195983 ) ) ( not ( = ?auto_195981 ?auto_195984 ) ) ( not ( = ?auto_195981 ?auto_195985 ) ) ( not ( = ?auto_195981 ?auto_195986 ) ) ( not ( = ?auto_195981 ?auto_195987 ) ) ( not ( = ?auto_195981 ?auto_195988 ) ) ( not ( = ?auto_195981 ?auto_195989 ) ) ( not ( = ?auto_195981 ?auto_195990 ) ) ( not ( = ?auto_195982 ?auto_195983 ) ) ( not ( = ?auto_195982 ?auto_195984 ) ) ( not ( = ?auto_195982 ?auto_195985 ) ) ( not ( = ?auto_195982 ?auto_195986 ) ) ( not ( = ?auto_195982 ?auto_195987 ) ) ( not ( = ?auto_195982 ?auto_195988 ) ) ( not ( = ?auto_195982 ?auto_195989 ) ) ( not ( = ?auto_195982 ?auto_195990 ) ) ( not ( = ?auto_195983 ?auto_195984 ) ) ( not ( = ?auto_195983 ?auto_195985 ) ) ( not ( = ?auto_195983 ?auto_195986 ) ) ( not ( = ?auto_195983 ?auto_195987 ) ) ( not ( = ?auto_195983 ?auto_195988 ) ) ( not ( = ?auto_195983 ?auto_195989 ) ) ( not ( = ?auto_195983 ?auto_195990 ) ) ( not ( = ?auto_195984 ?auto_195985 ) ) ( not ( = ?auto_195984 ?auto_195986 ) ) ( not ( = ?auto_195984 ?auto_195987 ) ) ( not ( = ?auto_195984 ?auto_195988 ) ) ( not ( = ?auto_195984 ?auto_195989 ) ) ( not ( = ?auto_195984 ?auto_195990 ) ) ( not ( = ?auto_195985 ?auto_195986 ) ) ( not ( = ?auto_195985 ?auto_195987 ) ) ( not ( = ?auto_195985 ?auto_195988 ) ) ( not ( = ?auto_195985 ?auto_195989 ) ) ( not ( = ?auto_195985 ?auto_195990 ) ) ( not ( = ?auto_195986 ?auto_195987 ) ) ( not ( = ?auto_195986 ?auto_195988 ) ) ( not ( = ?auto_195986 ?auto_195989 ) ) ( not ( = ?auto_195986 ?auto_195990 ) ) ( not ( = ?auto_195987 ?auto_195988 ) ) ( not ( = ?auto_195987 ?auto_195989 ) ) ( not ( = ?auto_195987 ?auto_195990 ) ) ( not ( = ?auto_195988 ?auto_195989 ) ) ( not ( = ?auto_195988 ?auto_195990 ) ) ( not ( = ?auto_195989 ?auto_195990 ) ) ( ON ?auto_195988 ?auto_195989 ) ( ON ?auto_195987 ?auto_195988 ) ( ON ?auto_195986 ?auto_195987 ) ( ON ?auto_195985 ?auto_195986 ) ( ON ?auto_195984 ?auto_195985 ) ( ON ?auto_195983 ?auto_195984 ) ( ON ?auto_195982 ?auto_195983 ) ( CLEAR ?auto_195980 ) ( ON ?auto_195981 ?auto_195982 ) ( CLEAR ?auto_195981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195980 ?auto_195981 )
      ( MAKE-10PILE ?auto_195980 ?auto_195981 ?auto_195982 ?auto_195983 ?auto_195984 ?auto_195985 ?auto_195986 ?auto_195987 ?auto_195988 ?auto_195989 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_196001 - BLOCK
      ?auto_196002 - BLOCK
      ?auto_196003 - BLOCK
      ?auto_196004 - BLOCK
      ?auto_196005 - BLOCK
      ?auto_196006 - BLOCK
      ?auto_196007 - BLOCK
      ?auto_196008 - BLOCK
      ?auto_196009 - BLOCK
      ?auto_196010 - BLOCK
    )
    :vars
    (
      ?auto_196011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196010 ?auto_196011 ) ( ON-TABLE ?auto_196001 ) ( not ( = ?auto_196001 ?auto_196002 ) ) ( not ( = ?auto_196001 ?auto_196003 ) ) ( not ( = ?auto_196001 ?auto_196004 ) ) ( not ( = ?auto_196001 ?auto_196005 ) ) ( not ( = ?auto_196001 ?auto_196006 ) ) ( not ( = ?auto_196001 ?auto_196007 ) ) ( not ( = ?auto_196001 ?auto_196008 ) ) ( not ( = ?auto_196001 ?auto_196009 ) ) ( not ( = ?auto_196001 ?auto_196010 ) ) ( not ( = ?auto_196001 ?auto_196011 ) ) ( not ( = ?auto_196002 ?auto_196003 ) ) ( not ( = ?auto_196002 ?auto_196004 ) ) ( not ( = ?auto_196002 ?auto_196005 ) ) ( not ( = ?auto_196002 ?auto_196006 ) ) ( not ( = ?auto_196002 ?auto_196007 ) ) ( not ( = ?auto_196002 ?auto_196008 ) ) ( not ( = ?auto_196002 ?auto_196009 ) ) ( not ( = ?auto_196002 ?auto_196010 ) ) ( not ( = ?auto_196002 ?auto_196011 ) ) ( not ( = ?auto_196003 ?auto_196004 ) ) ( not ( = ?auto_196003 ?auto_196005 ) ) ( not ( = ?auto_196003 ?auto_196006 ) ) ( not ( = ?auto_196003 ?auto_196007 ) ) ( not ( = ?auto_196003 ?auto_196008 ) ) ( not ( = ?auto_196003 ?auto_196009 ) ) ( not ( = ?auto_196003 ?auto_196010 ) ) ( not ( = ?auto_196003 ?auto_196011 ) ) ( not ( = ?auto_196004 ?auto_196005 ) ) ( not ( = ?auto_196004 ?auto_196006 ) ) ( not ( = ?auto_196004 ?auto_196007 ) ) ( not ( = ?auto_196004 ?auto_196008 ) ) ( not ( = ?auto_196004 ?auto_196009 ) ) ( not ( = ?auto_196004 ?auto_196010 ) ) ( not ( = ?auto_196004 ?auto_196011 ) ) ( not ( = ?auto_196005 ?auto_196006 ) ) ( not ( = ?auto_196005 ?auto_196007 ) ) ( not ( = ?auto_196005 ?auto_196008 ) ) ( not ( = ?auto_196005 ?auto_196009 ) ) ( not ( = ?auto_196005 ?auto_196010 ) ) ( not ( = ?auto_196005 ?auto_196011 ) ) ( not ( = ?auto_196006 ?auto_196007 ) ) ( not ( = ?auto_196006 ?auto_196008 ) ) ( not ( = ?auto_196006 ?auto_196009 ) ) ( not ( = ?auto_196006 ?auto_196010 ) ) ( not ( = ?auto_196006 ?auto_196011 ) ) ( not ( = ?auto_196007 ?auto_196008 ) ) ( not ( = ?auto_196007 ?auto_196009 ) ) ( not ( = ?auto_196007 ?auto_196010 ) ) ( not ( = ?auto_196007 ?auto_196011 ) ) ( not ( = ?auto_196008 ?auto_196009 ) ) ( not ( = ?auto_196008 ?auto_196010 ) ) ( not ( = ?auto_196008 ?auto_196011 ) ) ( not ( = ?auto_196009 ?auto_196010 ) ) ( not ( = ?auto_196009 ?auto_196011 ) ) ( not ( = ?auto_196010 ?auto_196011 ) ) ( ON ?auto_196009 ?auto_196010 ) ( ON ?auto_196008 ?auto_196009 ) ( ON ?auto_196007 ?auto_196008 ) ( ON ?auto_196006 ?auto_196007 ) ( ON ?auto_196005 ?auto_196006 ) ( ON ?auto_196004 ?auto_196005 ) ( ON ?auto_196003 ?auto_196004 ) ( CLEAR ?auto_196001 ) ( ON ?auto_196002 ?auto_196003 ) ( CLEAR ?auto_196002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_196001 ?auto_196002 )
      ( MAKE-10PILE ?auto_196001 ?auto_196002 ?auto_196003 ?auto_196004 ?auto_196005 ?auto_196006 ?auto_196007 ?auto_196008 ?auto_196009 ?auto_196010 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_196022 - BLOCK
      ?auto_196023 - BLOCK
      ?auto_196024 - BLOCK
      ?auto_196025 - BLOCK
      ?auto_196026 - BLOCK
      ?auto_196027 - BLOCK
      ?auto_196028 - BLOCK
      ?auto_196029 - BLOCK
      ?auto_196030 - BLOCK
      ?auto_196031 - BLOCK
    )
    :vars
    (
      ?auto_196032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196031 ?auto_196032 ) ( not ( = ?auto_196022 ?auto_196023 ) ) ( not ( = ?auto_196022 ?auto_196024 ) ) ( not ( = ?auto_196022 ?auto_196025 ) ) ( not ( = ?auto_196022 ?auto_196026 ) ) ( not ( = ?auto_196022 ?auto_196027 ) ) ( not ( = ?auto_196022 ?auto_196028 ) ) ( not ( = ?auto_196022 ?auto_196029 ) ) ( not ( = ?auto_196022 ?auto_196030 ) ) ( not ( = ?auto_196022 ?auto_196031 ) ) ( not ( = ?auto_196022 ?auto_196032 ) ) ( not ( = ?auto_196023 ?auto_196024 ) ) ( not ( = ?auto_196023 ?auto_196025 ) ) ( not ( = ?auto_196023 ?auto_196026 ) ) ( not ( = ?auto_196023 ?auto_196027 ) ) ( not ( = ?auto_196023 ?auto_196028 ) ) ( not ( = ?auto_196023 ?auto_196029 ) ) ( not ( = ?auto_196023 ?auto_196030 ) ) ( not ( = ?auto_196023 ?auto_196031 ) ) ( not ( = ?auto_196023 ?auto_196032 ) ) ( not ( = ?auto_196024 ?auto_196025 ) ) ( not ( = ?auto_196024 ?auto_196026 ) ) ( not ( = ?auto_196024 ?auto_196027 ) ) ( not ( = ?auto_196024 ?auto_196028 ) ) ( not ( = ?auto_196024 ?auto_196029 ) ) ( not ( = ?auto_196024 ?auto_196030 ) ) ( not ( = ?auto_196024 ?auto_196031 ) ) ( not ( = ?auto_196024 ?auto_196032 ) ) ( not ( = ?auto_196025 ?auto_196026 ) ) ( not ( = ?auto_196025 ?auto_196027 ) ) ( not ( = ?auto_196025 ?auto_196028 ) ) ( not ( = ?auto_196025 ?auto_196029 ) ) ( not ( = ?auto_196025 ?auto_196030 ) ) ( not ( = ?auto_196025 ?auto_196031 ) ) ( not ( = ?auto_196025 ?auto_196032 ) ) ( not ( = ?auto_196026 ?auto_196027 ) ) ( not ( = ?auto_196026 ?auto_196028 ) ) ( not ( = ?auto_196026 ?auto_196029 ) ) ( not ( = ?auto_196026 ?auto_196030 ) ) ( not ( = ?auto_196026 ?auto_196031 ) ) ( not ( = ?auto_196026 ?auto_196032 ) ) ( not ( = ?auto_196027 ?auto_196028 ) ) ( not ( = ?auto_196027 ?auto_196029 ) ) ( not ( = ?auto_196027 ?auto_196030 ) ) ( not ( = ?auto_196027 ?auto_196031 ) ) ( not ( = ?auto_196027 ?auto_196032 ) ) ( not ( = ?auto_196028 ?auto_196029 ) ) ( not ( = ?auto_196028 ?auto_196030 ) ) ( not ( = ?auto_196028 ?auto_196031 ) ) ( not ( = ?auto_196028 ?auto_196032 ) ) ( not ( = ?auto_196029 ?auto_196030 ) ) ( not ( = ?auto_196029 ?auto_196031 ) ) ( not ( = ?auto_196029 ?auto_196032 ) ) ( not ( = ?auto_196030 ?auto_196031 ) ) ( not ( = ?auto_196030 ?auto_196032 ) ) ( not ( = ?auto_196031 ?auto_196032 ) ) ( ON ?auto_196030 ?auto_196031 ) ( ON ?auto_196029 ?auto_196030 ) ( ON ?auto_196028 ?auto_196029 ) ( ON ?auto_196027 ?auto_196028 ) ( ON ?auto_196026 ?auto_196027 ) ( ON ?auto_196025 ?auto_196026 ) ( ON ?auto_196024 ?auto_196025 ) ( ON ?auto_196023 ?auto_196024 ) ( ON ?auto_196022 ?auto_196023 ) ( CLEAR ?auto_196022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196022 )
      ( MAKE-10PILE ?auto_196022 ?auto_196023 ?auto_196024 ?auto_196025 ?auto_196026 ?auto_196027 ?auto_196028 ?auto_196029 ?auto_196030 ?auto_196031 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_196043 - BLOCK
      ?auto_196044 - BLOCK
      ?auto_196045 - BLOCK
      ?auto_196046 - BLOCK
      ?auto_196047 - BLOCK
      ?auto_196048 - BLOCK
      ?auto_196049 - BLOCK
      ?auto_196050 - BLOCK
      ?auto_196051 - BLOCK
      ?auto_196052 - BLOCK
    )
    :vars
    (
      ?auto_196053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196052 ?auto_196053 ) ( not ( = ?auto_196043 ?auto_196044 ) ) ( not ( = ?auto_196043 ?auto_196045 ) ) ( not ( = ?auto_196043 ?auto_196046 ) ) ( not ( = ?auto_196043 ?auto_196047 ) ) ( not ( = ?auto_196043 ?auto_196048 ) ) ( not ( = ?auto_196043 ?auto_196049 ) ) ( not ( = ?auto_196043 ?auto_196050 ) ) ( not ( = ?auto_196043 ?auto_196051 ) ) ( not ( = ?auto_196043 ?auto_196052 ) ) ( not ( = ?auto_196043 ?auto_196053 ) ) ( not ( = ?auto_196044 ?auto_196045 ) ) ( not ( = ?auto_196044 ?auto_196046 ) ) ( not ( = ?auto_196044 ?auto_196047 ) ) ( not ( = ?auto_196044 ?auto_196048 ) ) ( not ( = ?auto_196044 ?auto_196049 ) ) ( not ( = ?auto_196044 ?auto_196050 ) ) ( not ( = ?auto_196044 ?auto_196051 ) ) ( not ( = ?auto_196044 ?auto_196052 ) ) ( not ( = ?auto_196044 ?auto_196053 ) ) ( not ( = ?auto_196045 ?auto_196046 ) ) ( not ( = ?auto_196045 ?auto_196047 ) ) ( not ( = ?auto_196045 ?auto_196048 ) ) ( not ( = ?auto_196045 ?auto_196049 ) ) ( not ( = ?auto_196045 ?auto_196050 ) ) ( not ( = ?auto_196045 ?auto_196051 ) ) ( not ( = ?auto_196045 ?auto_196052 ) ) ( not ( = ?auto_196045 ?auto_196053 ) ) ( not ( = ?auto_196046 ?auto_196047 ) ) ( not ( = ?auto_196046 ?auto_196048 ) ) ( not ( = ?auto_196046 ?auto_196049 ) ) ( not ( = ?auto_196046 ?auto_196050 ) ) ( not ( = ?auto_196046 ?auto_196051 ) ) ( not ( = ?auto_196046 ?auto_196052 ) ) ( not ( = ?auto_196046 ?auto_196053 ) ) ( not ( = ?auto_196047 ?auto_196048 ) ) ( not ( = ?auto_196047 ?auto_196049 ) ) ( not ( = ?auto_196047 ?auto_196050 ) ) ( not ( = ?auto_196047 ?auto_196051 ) ) ( not ( = ?auto_196047 ?auto_196052 ) ) ( not ( = ?auto_196047 ?auto_196053 ) ) ( not ( = ?auto_196048 ?auto_196049 ) ) ( not ( = ?auto_196048 ?auto_196050 ) ) ( not ( = ?auto_196048 ?auto_196051 ) ) ( not ( = ?auto_196048 ?auto_196052 ) ) ( not ( = ?auto_196048 ?auto_196053 ) ) ( not ( = ?auto_196049 ?auto_196050 ) ) ( not ( = ?auto_196049 ?auto_196051 ) ) ( not ( = ?auto_196049 ?auto_196052 ) ) ( not ( = ?auto_196049 ?auto_196053 ) ) ( not ( = ?auto_196050 ?auto_196051 ) ) ( not ( = ?auto_196050 ?auto_196052 ) ) ( not ( = ?auto_196050 ?auto_196053 ) ) ( not ( = ?auto_196051 ?auto_196052 ) ) ( not ( = ?auto_196051 ?auto_196053 ) ) ( not ( = ?auto_196052 ?auto_196053 ) ) ( ON ?auto_196051 ?auto_196052 ) ( ON ?auto_196050 ?auto_196051 ) ( ON ?auto_196049 ?auto_196050 ) ( ON ?auto_196048 ?auto_196049 ) ( ON ?auto_196047 ?auto_196048 ) ( ON ?auto_196046 ?auto_196047 ) ( ON ?auto_196045 ?auto_196046 ) ( ON ?auto_196044 ?auto_196045 ) ( ON ?auto_196043 ?auto_196044 ) ( CLEAR ?auto_196043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196043 )
      ( MAKE-10PILE ?auto_196043 ?auto_196044 ?auto_196045 ?auto_196046 ?auto_196047 ?auto_196048 ?auto_196049 ?auto_196050 ?auto_196051 ?auto_196052 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196065 - BLOCK
      ?auto_196066 - BLOCK
      ?auto_196067 - BLOCK
      ?auto_196068 - BLOCK
      ?auto_196069 - BLOCK
      ?auto_196070 - BLOCK
      ?auto_196071 - BLOCK
      ?auto_196072 - BLOCK
      ?auto_196073 - BLOCK
      ?auto_196074 - BLOCK
      ?auto_196075 - BLOCK
    )
    :vars
    (
      ?auto_196076 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_196074 ) ( ON ?auto_196075 ?auto_196076 ) ( CLEAR ?auto_196075 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196065 ) ( ON ?auto_196066 ?auto_196065 ) ( ON ?auto_196067 ?auto_196066 ) ( ON ?auto_196068 ?auto_196067 ) ( ON ?auto_196069 ?auto_196068 ) ( ON ?auto_196070 ?auto_196069 ) ( ON ?auto_196071 ?auto_196070 ) ( ON ?auto_196072 ?auto_196071 ) ( ON ?auto_196073 ?auto_196072 ) ( ON ?auto_196074 ?auto_196073 ) ( not ( = ?auto_196065 ?auto_196066 ) ) ( not ( = ?auto_196065 ?auto_196067 ) ) ( not ( = ?auto_196065 ?auto_196068 ) ) ( not ( = ?auto_196065 ?auto_196069 ) ) ( not ( = ?auto_196065 ?auto_196070 ) ) ( not ( = ?auto_196065 ?auto_196071 ) ) ( not ( = ?auto_196065 ?auto_196072 ) ) ( not ( = ?auto_196065 ?auto_196073 ) ) ( not ( = ?auto_196065 ?auto_196074 ) ) ( not ( = ?auto_196065 ?auto_196075 ) ) ( not ( = ?auto_196065 ?auto_196076 ) ) ( not ( = ?auto_196066 ?auto_196067 ) ) ( not ( = ?auto_196066 ?auto_196068 ) ) ( not ( = ?auto_196066 ?auto_196069 ) ) ( not ( = ?auto_196066 ?auto_196070 ) ) ( not ( = ?auto_196066 ?auto_196071 ) ) ( not ( = ?auto_196066 ?auto_196072 ) ) ( not ( = ?auto_196066 ?auto_196073 ) ) ( not ( = ?auto_196066 ?auto_196074 ) ) ( not ( = ?auto_196066 ?auto_196075 ) ) ( not ( = ?auto_196066 ?auto_196076 ) ) ( not ( = ?auto_196067 ?auto_196068 ) ) ( not ( = ?auto_196067 ?auto_196069 ) ) ( not ( = ?auto_196067 ?auto_196070 ) ) ( not ( = ?auto_196067 ?auto_196071 ) ) ( not ( = ?auto_196067 ?auto_196072 ) ) ( not ( = ?auto_196067 ?auto_196073 ) ) ( not ( = ?auto_196067 ?auto_196074 ) ) ( not ( = ?auto_196067 ?auto_196075 ) ) ( not ( = ?auto_196067 ?auto_196076 ) ) ( not ( = ?auto_196068 ?auto_196069 ) ) ( not ( = ?auto_196068 ?auto_196070 ) ) ( not ( = ?auto_196068 ?auto_196071 ) ) ( not ( = ?auto_196068 ?auto_196072 ) ) ( not ( = ?auto_196068 ?auto_196073 ) ) ( not ( = ?auto_196068 ?auto_196074 ) ) ( not ( = ?auto_196068 ?auto_196075 ) ) ( not ( = ?auto_196068 ?auto_196076 ) ) ( not ( = ?auto_196069 ?auto_196070 ) ) ( not ( = ?auto_196069 ?auto_196071 ) ) ( not ( = ?auto_196069 ?auto_196072 ) ) ( not ( = ?auto_196069 ?auto_196073 ) ) ( not ( = ?auto_196069 ?auto_196074 ) ) ( not ( = ?auto_196069 ?auto_196075 ) ) ( not ( = ?auto_196069 ?auto_196076 ) ) ( not ( = ?auto_196070 ?auto_196071 ) ) ( not ( = ?auto_196070 ?auto_196072 ) ) ( not ( = ?auto_196070 ?auto_196073 ) ) ( not ( = ?auto_196070 ?auto_196074 ) ) ( not ( = ?auto_196070 ?auto_196075 ) ) ( not ( = ?auto_196070 ?auto_196076 ) ) ( not ( = ?auto_196071 ?auto_196072 ) ) ( not ( = ?auto_196071 ?auto_196073 ) ) ( not ( = ?auto_196071 ?auto_196074 ) ) ( not ( = ?auto_196071 ?auto_196075 ) ) ( not ( = ?auto_196071 ?auto_196076 ) ) ( not ( = ?auto_196072 ?auto_196073 ) ) ( not ( = ?auto_196072 ?auto_196074 ) ) ( not ( = ?auto_196072 ?auto_196075 ) ) ( not ( = ?auto_196072 ?auto_196076 ) ) ( not ( = ?auto_196073 ?auto_196074 ) ) ( not ( = ?auto_196073 ?auto_196075 ) ) ( not ( = ?auto_196073 ?auto_196076 ) ) ( not ( = ?auto_196074 ?auto_196075 ) ) ( not ( = ?auto_196074 ?auto_196076 ) ) ( not ( = ?auto_196075 ?auto_196076 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196075 ?auto_196076 )
      ( !STACK ?auto_196075 ?auto_196074 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196088 - BLOCK
      ?auto_196089 - BLOCK
      ?auto_196090 - BLOCK
      ?auto_196091 - BLOCK
      ?auto_196092 - BLOCK
      ?auto_196093 - BLOCK
      ?auto_196094 - BLOCK
      ?auto_196095 - BLOCK
      ?auto_196096 - BLOCK
      ?auto_196097 - BLOCK
      ?auto_196098 - BLOCK
    )
    :vars
    (
      ?auto_196099 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_196097 ) ( ON ?auto_196098 ?auto_196099 ) ( CLEAR ?auto_196098 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196088 ) ( ON ?auto_196089 ?auto_196088 ) ( ON ?auto_196090 ?auto_196089 ) ( ON ?auto_196091 ?auto_196090 ) ( ON ?auto_196092 ?auto_196091 ) ( ON ?auto_196093 ?auto_196092 ) ( ON ?auto_196094 ?auto_196093 ) ( ON ?auto_196095 ?auto_196094 ) ( ON ?auto_196096 ?auto_196095 ) ( ON ?auto_196097 ?auto_196096 ) ( not ( = ?auto_196088 ?auto_196089 ) ) ( not ( = ?auto_196088 ?auto_196090 ) ) ( not ( = ?auto_196088 ?auto_196091 ) ) ( not ( = ?auto_196088 ?auto_196092 ) ) ( not ( = ?auto_196088 ?auto_196093 ) ) ( not ( = ?auto_196088 ?auto_196094 ) ) ( not ( = ?auto_196088 ?auto_196095 ) ) ( not ( = ?auto_196088 ?auto_196096 ) ) ( not ( = ?auto_196088 ?auto_196097 ) ) ( not ( = ?auto_196088 ?auto_196098 ) ) ( not ( = ?auto_196088 ?auto_196099 ) ) ( not ( = ?auto_196089 ?auto_196090 ) ) ( not ( = ?auto_196089 ?auto_196091 ) ) ( not ( = ?auto_196089 ?auto_196092 ) ) ( not ( = ?auto_196089 ?auto_196093 ) ) ( not ( = ?auto_196089 ?auto_196094 ) ) ( not ( = ?auto_196089 ?auto_196095 ) ) ( not ( = ?auto_196089 ?auto_196096 ) ) ( not ( = ?auto_196089 ?auto_196097 ) ) ( not ( = ?auto_196089 ?auto_196098 ) ) ( not ( = ?auto_196089 ?auto_196099 ) ) ( not ( = ?auto_196090 ?auto_196091 ) ) ( not ( = ?auto_196090 ?auto_196092 ) ) ( not ( = ?auto_196090 ?auto_196093 ) ) ( not ( = ?auto_196090 ?auto_196094 ) ) ( not ( = ?auto_196090 ?auto_196095 ) ) ( not ( = ?auto_196090 ?auto_196096 ) ) ( not ( = ?auto_196090 ?auto_196097 ) ) ( not ( = ?auto_196090 ?auto_196098 ) ) ( not ( = ?auto_196090 ?auto_196099 ) ) ( not ( = ?auto_196091 ?auto_196092 ) ) ( not ( = ?auto_196091 ?auto_196093 ) ) ( not ( = ?auto_196091 ?auto_196094 ) ) ( not ( = ?auto_196091 ?auto_196095 ) ) ( not ( = ?auto_196091 ?auto_196096 ) ) ( not ( = ?auto_196091 ?auto_196097 ) ) ( not ( = ?auto_196091 ?auto_196098 ) ) ( not ( = ?auto_196091 ?auto_196099 ) ) ( not ( = ?auto_196092 ?auto_196093 ) ) ( not ( = ?auto_196092 ?auto_196094 ) ) ( not ( = ?auto_196092 ?auto_196095 ) ) ( not ( = ?auto_196092 ?auto_196096 ) ) ( not ( = ?auto_196092 ?auto_196097 ) ) ( not ( = ?auto_196092 ?auto_196098 ) ) ( not ( = ?auto_196092 ?auto_196099 ) ) ( not ( = ?auto_196093 ?auto_196094 ) ) ( not ( = ?auto_196093 ?auto_196095 ) ) ( not ( = ?auto_196093 ?auto_196096 ) ) ( not ( = ?auto_196093 ?auto_196097 ) ) ( not ( = ?auto_196093 ?auto_196098 ) ) ( not ( = ?auto_196093 ?auto_196099 ) ) ( not ( = ?auto_196094 ?auto_196095 ) ) ( not ( = ?auto_196094 ?auto_196096 ) ) ( not ( = ?auto_196094 ?auto_196097 ) ) ( not ( = ?auto_196094 ?auto_196098 ) ) ( not ( = ?auto_196094 ?auto_196099 ) ) ( not ( = ?auto_196095 ?auto_196096 ) ) ( not ( = ?auto_196095 ?auto_196097 ) ) ( not ( = ?auto_196095 ?auto_196098 ) ) ( not ( = ?auto_196095 ?auto_196099 ) ) ( not ( = ?auto_196096 ?auto_196097 ) ) ( not ( = ?auto_196096 ?auto_196098 ) ) ( not ( = ?auto_196096 ?auto_196099 ) ) ( not ( = ?auto_196097 ?auto_196098 ) ) ( not ( = ?auto_196097 ?auto_196099 ) ) ( not ( = ?auto_196098 ?auto_196099 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196098 ?auto_196099 )
      ( !STACK ?auto_196098 ?auto_196097 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196111 - BLOCK
      ?auto_196112 - BLOCK
      ?auto_196113 - BLOCK
      ?auto_196114 - BLOCK
      ?auto_196115 - BLOCK
      ?auto_196116 - BLOCK
      ?auto_196117 - BLOCK
      ?auto_196118 - BLOCK
      ?auto_196119 - BLOCK
      ?auto_196120 - BLOCK
      ?auto_196121 - BLOCK
    )
    :vars
    (
      ?auto_196122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196121 ?auto_196122 ) ( ON-TABLE ?auto_196111 ) ( ON ?auto_196112 ?auto_196111 ) ( ON ?auto_196113 ?auto_196112 ) ( ON ?auto_196114 ?auto_196113 ) ( ON ?auto_196115 ?auto_196114 ) ( ON ?auto_196116 ?auto_196115 ) ( ON ?auto_196117 ?auto_196116 ) ( ON ?auto_196118 ?auto_196117 ) ( ON ?auto_196119 ?auto_196118 ) ( not ( = ?auto_196111 ?auto_196112 ) ) ( not ( = ?auto_196111 ?auto_196113 ) ) ( not ( = ?auto_196111 ?auto_196114 ) ) ( not ( = ?auto_196111 ?auto_196115 ) ) ( not ( = ?auto_196111 ?auto_196116 ) ) ( not ( = ?auto_196111 ?auto_196117 ) ) ( not ( = ?auto_196111 ?auto_196118 ) ) ( not ( = ?auto_196111 ?auto_196119 ) ) ( not ( = ?auto_196111 ?auto_196120 ) ) ( not ( = ?auto_196111 ?auto_196121 ) ) ( not ( = ?auto_196111 ?auto_196122 ) ) ( not ( = ?auto_196112 ?auto_196113 ) ) ( not ( = ?auto_196112 ?auto_196114 ) ) ( not ( = ?auto_196112 ?auto_196115 ) ) ( not ( = ?auto_196112 ?auto_196116 ) ) ( not ( = ?auto_196112 ?auto_196117 ) ) ( not ( = ?auto_196112 ?auto_196118 ) ) ( not ( = ?auto_196112 ?auto_196119 ) ) ( not ( = ?auto_196112 ?auto_196120 ) ) ( not ( = ?auto_196112 ?auto_196121 ) ) ( not ( = ?auto_196112 ?auto_196122 ) ) ( not ( = ?auto_196113 ?auto_196114 ) ) ( not ( = ?auto_196113 ?auto_196115 ) ) ( not ( = ?auto_196113 ?auto_196116 ) ) ( not ( = ?auto_196113 ?auto_196117 ) ) ( not ( = ?auto_196113 ?auto_196118 ) ) ( not ( = ?auto_196113 ?auto_196119 ) ) ( not ( = ?auto_196113 ?auto_196120 ) ) ( not ( = ?auto_196113 ?auto_196121 ) ) ( not ( = ?auto_196113 ?auto_196122 ) ) ( not ( = ?auto_196114 ?auto_196115 ) ) ( not ( = ?auto_196114 ?auto_196116 ) ) ( not ( = ?auto_196114 ?auto_196117 ) ) ( not ( = ?auto_196114 ?auto_196118 ) ) ( not ( = ?auto_196114 ?auto_196119 ) ) ( not ( = ?auto_196114 ?auto_196120 ) ) ( not ( = ?auto_196114 ?auto_196121 ) ) ( not ( = ?auto_196114 ?auto_196122 ) ) ( not ( = ?auto_196115 ?auto_196116 ) ) ( not ( = ?auto_196115 ?auto_196117 ) ) ( not ( = ?auto_196115 ?auto_196118 ) ) ( not ( = ?auto_196115 ?auto_196119 ) ) ( not ( = ?auto_196115 ?auto_196120 ) ) ( not ( = ?auto_196115 ?auto_196121 ) ) ( not ( = ?auto_196115 ?auto_196122 ) ) ( not ( = ?auto_196116 ?auto_196117 ) ) ( not ( = ?auto_196116 ?auto_196118 ) ) ( not ( = ?auto_196116 ?auto_196119 ) ) ( not ( = ?auto_196116 ?auto_196120 ) ) ( not ( = ?auto_196116 ?auto_196121 ) ) ( not ( = ?auto_196116 ?auto_196122 ) ) ( not ( = ?auto_196117 ?auto_196118 ) ) ( not ( = ?auto_196117 ?auto_196119 ) ) ( not ( = ?auto_196117 ?auto_196120 ) ) ( not ( = ?auto_196117 ?auto_196121 ) ) ( not ( = ?auto_196117 ?auto_196122 ) ) ( not ( = ?auto_196118 ?auto_196119 ) ) ( not ( = ?auto_196118 ?auto_196120 ) ) ( not ( = ?auto_196118 ?auto_196121 ) ) ( not ( = ?auto_196118 ?auto_196122 ) ) ( not ( = ?auto_196119 ?auto_196120 ) ) ( not ( = ?auto_196119 ?auto_196121 ) ) ( not ( = ?auto_196119 ?auto_196122 ) ) ( not ( = ?auto_196120 ?auto_196121 ) ) ( not ( = ?auto_196120 ?auto_196122 ) ) ( not ( = ?auto_196121 ?auto_196122 ) ) ( CLEAR ?auto_196119 ) ( ON ?auto_196120 ?auto_196121 ) ( CLEAR ?auto_196120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_196111 ?auto_196112 ?auto_196113 ?auto_196114 ?auto_196115 ?auto_196116 ?auto_196117 ?auto_196118 ?auto_196119 ?auto_196120 )
      ( MAKE-11PILE ?auto_196111 ?auto_196112 ?auto_196113 ?auto_196114 ?auto_196115 ?auto_196116 ?auto_196117 ?auto_196118 ?auto_196119 ?auto_196120 ?auto_196121 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196134 - BLOCK
      ?auto_196135 - BLOCK
      ?auto_196136 - BLOCK
      ?auto_196137 - BLOCK
      ?auto_196138 - BLOCK
      ?auto_196139 - BLOCK
      ?auto_196140 - BLOCK
      ?auto_196141 - BLOCK
      ?auto_196142 - BLOCK
      ?auto_196143 - BLOCK
      ?auto_196144 - BLOCK
    )
    :vars
    (
      ?auto_196145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196144 ?auto_196145 ) ( ON-TABLE ?auto_196134 ) ( ON ?auto_196135 ?auto_196134 ) ( ON ?auto_196136 ?auto_196135 ) ( ON ?auto_196137 ?auto_196136 ) ( ON ?auto_196138 ?auto_196137 ) ( ON ?auto_196139 ?auto_196138 ) ( ON ?auto_196140 ?auto_196139 ) ( ON ?auto_196141 ?auto_196140 ) ( ON ?auto_196142 ?auto_196141 ) ( not ( = ?auto_196134 ?auto_196135 ) ) ( not ( = ?auto_196134 ?auto_196136 ) ) ( not ( = ?auto_196134 ?auto_196137 ) ) ( not ( = ?auto_196134 ?auto_196138 ) ) ( not ( = ?auto_196134 ?auto_196139 ) ) ( not ( = ?auto_196134 ?auto_196140 ) ) ( not ( = ?auto_196134 ?auto_196141 ) ) ( not ( = ?auto_196134 ?auto_196142 ) ) ( not ( = ?auto_196134 ?auto_196143 ) ) ( not ( = ?auto_196134 ?auto_196144 ) ) ( not ( = ?auto_196134 ?auto_196145 ) ) ( not ( = ?auto_196135 ?auto_196136 ) ) ( not ( = ?auto_196135 ?auto_196137 ) ) ( not ( = ?auto_196135 ?auto_196138 ) ) ( not ( = ?auto_196135 ?auto_196139 ) ) ( not ( = ?auto_196135 ?auto_196140 ) ) ( not ( = ?auto_196135 ?auto_196141 ) ) ( not ( = ?auto_196135 ?auto_196142 ) ) ( not ( = ?auto_196135 ?auto_196143 ) ) ( not ( = ?auto_196135 ?auto_196144 ) ) ( not ( = ?auto_196135 ?auto_196145 ) ) ( not ( = ?auto_196136 ?auto_196137 ) ) ( not ( = ?auto_196136 ?auto_196138 ) ) ( not ( = ?auto_196136 ?auto_196139 ) ) ( not ( = ?auto_196136 ?auto_196140 ) ) ( not ( = ?auto_196136 ?auto_196141 ) ) ( not ( = ?auto_196136 ?auto_196142 ) ) ( not ( = ?auto_196136 ?auto_196143 ) ) ( not ( = ?auto_196136 ?auto_196144 ) ) ( not ( = ?auto_196136 ?auto_196145 ) ) ( not ( = ?auto_196137 ?auto_196138 ) ) ( not ( = ?auto_196137 ?auto_196139 ) ) ( not ( = ?auto_196137 ?auto_196140 ) ) ( not ( = ?auto_196137 ?auto_196141 ) ) ( not ( = ?auto_196137 ?auto_196142 ) ) ( not ( = ?auto_196137 ?auto_196143 ) ) ( not ( = ?auto_196137 ?auto_196144 ) ) ( not ( = ?auto_196137 ?auto_196145 ) ) ( not ( = ?auto_196138 ?auto_196139 ) ) ( not ( = ?auto_196138 ?auto_196140 ) ) ( not ( = ?auto_196138 ?auto_196141 ) ) ( not ( = ?auto_196138 ?auto_196142 ) ) ( not ( = ?auto_196138 ?auto_196143 ) ) ( not ( = ?auto_196138 ?auto_196144 ) ) ( not ( = ?auto_196138 ?auto_196145 ) ) ( not ( = ?auto_196139 ?auto_196140 ) ) ( not ( = ?auto_196139 ?auto_196141 ) ) ( not ( = ?auto_196139 ?auto_196142 ) ) ( not ( = ?auto_196139 ?auto_196143 ) ) ( not ( = ?auto_196139 ?auto_196144 ) ) ( not ( = ?auto_196139 ?auto_196145 ) ) ( not ( = ?auto_196140 ?auto_196141 ) ) ( not ( = ?auto_196140 ?auto_196142 ) ) ( not ( = ?auto_196140 ?auto_196143 ) ) ( not ( = ?auto_196140 ?auto_196144 ) ) ( not ( = ?auto_196140 ?auto_196145 ) ) ( not ( = ?auto_196141 ?auto_196142 ) ) ( not ( = ?auto_196141 ?auto_196143 ) ) ( not ( = ?auto_196141 ?auto_196144 ) ) ( not ( = ?auto_196141 ?auto_196145 ) ) ( not ( = ?auto_196142 ?auto_196143 ) ) ( not ( = ?auto_196142 ?auto_196144 ) ) ( not ( = ?auto_196142 ?auto_196145 ) ) ( not ( = ?auto_196143 ?auto_196144 ) ) ( not ( = ?auto_196143 ?auto_196145 ) ) ( not ( = ?auto_196144 ?auto_196145 ) ) ( CLEAR ?auto_196142 ) ( ON ?auto_196143 ?auto_196144 ) ( CLEAR ?auto_196143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_196134 ?auto_196135 ?auto_196136 ?auto_196137 ?auto_196138 ?auto_196139 ?auto_196140 ?auto_196141 ?auto_196142 ?auto_196143 )
      ( MAKE-11PILE ?auto_196134 ?auto_196135 ?auto_196136 ?auto_196137 ?auto_196138 ?auto_196139 ?auto_196140 ?auto_196141 ?auto_196142 ?auto_196143 ?auto_196144 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196157 - BLOCK
      ?auto_196158 - BLOCK
      ?auto_196159 - BLOCK
      ?auto_196160 - BLOCK
      ?auto_196161 - BLOCK
      ?auto_196162 - BLOCK
      ?auto_196163 - BLOCK
      ?auto_196164 - BLOCK
      ?auto_196165 - BLOCK
      ?auto_196166 - BLOCK
      ?auto_196167 - BLOCK
    )
    :vars
    (
      ?auto_196168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196167 ?auto_196168 ) ( ON-TABLE ?auto_196157 ) ( ON ?auto_196158 ?auto_196157 ) ( ON ?auto_196159 ?auto_196158 ) ( ON ?auto_196160 ?auto_196159 ) ( ON ?auto_196161 ?auto_196160 ) ( ON ?auto_196162 ?auto_196161 ) ( ON ?auto_196163 ?auto_196162 ) ( ON ?auto_196164 ?auto_196163 ) ( not ( = ?auto_196157 ?auto_196158 ) ) ( not ( = ?auto_196157 ?auto_196159 ) ) ( not ( = ?auto_196157 ?auto_196160 ) ) ( not ( = ?auto_196157 ?auto_196161 ) ) ( not ( = ?auto_196157 ?auto_196162 ) ) ( not ( = ?auto_196157 ?auto_196163 ) ) ( not ( = ?auto_196157 ?auto_196164 ) ) ( not ( = ?auto_196157 ?auto_196165 ) ) ( not ( = ?auto_196157 ?auto_196166 ) ) ( not ( = ?auto_196157 ?auto_196167 ) ) ( not ( = ?auto_196157 ?auto_196168 ) ) ( not ( = ?auto_196158 ?auto_196159 ) ) ( not ( = ?auto_196158 ?auto_196160 ) ) ( not ( = ?auto_196158 ?auto_196161 ) ) ( not ( = ?auto_196158 ?auto_196162 ) ) ( not ( = ?auto_196158 ?auto_196163 ) ) ( not ( = ?auto_196158 ?auto_196164 ) ) ( not ( = ?auto_196158 ?auto_196165 ) ) ( not ( = ?auto_196158 ?auto_196166 ) ) ( not ( = ?auto_196158 ?auto_196167 ) ) ( not ( = ?auto_196158 ?auto_196168 ) ) ( not ( = ?auto_196159 ?auto_196160 ) ) ( not ( = ?auto_196159 ?auto_196161 ) ) ( not ( = ?auto_196159 ?auto_196162 ) ) ( not ( = ?auto_196159 ?auto_196163 ) ) ( not ( = ?auto_196159 ?auto_196164 ) ) ( not ( = ?auto_196159 ?auto_196165 ) ) ( not ( = ?auto_196159 ?auto_196166 ) ) ( not ( = ?auto_196159 ?auto_196167 ) ) ( not ( = ?auto_196159 ?auto_196168 ) ) ( not ( = ?auto_196160 ?auto_196161 ) ) ( not ( = ?auto_196160 ?auto_196162 ) ) ( not ( = ?auto_196160 ?auto_196163 ) ) ( not ( = ?auto_196160 ?auto_196164 ) ) ( not ( = ?auto_196160 ?auto_196165 ) ) ( not ( = ?auto_196160 ?auto_196166 ) ) ( not ( = ?auto_196160 ?auto_196167 ) ) ( not ( = ?auto_196160 ?auto_196168 ) ) ( not ( = ?auto_196161 ?auto_196162 ) ) ( not ( = ?auto_196161 ?auto_196163 ) ) ( not ( = ?auto_196161 ?auto_196164 ) ) ( not ( = ?auto_196161 ?auto_196165 ) ) ( not ( = ?auto_196161 ?auto_196166 ) ) ( not ( = ?auto_196161 ?auto_196167 ) ) ( not ( = ?auto_196161 ?auto_196168 ) ) ( not ( = ?auto_196162 ?auto_196163 ) ) ( not ( = ?auto_196162 ?auto_196164 ) ) ( not ( = ?auto_196162 ?auto_196165 ) ) ( not ( = ?auto_196162 ?auto_196166 ) ) ( not ( = ?auto_196162 ?auto_196167 ) ) ( not ( = ?auto_196162 ?auto_196168 ) ) ( not ( = ?auto_196163 ?auto_196164 ) ) ( not ( = ?auto_196163 ?auto_196165 ) ) ( not ( = ?auto_196163 ?auto_196166 ) ) ( not ( = ?auto_196163 ?auto_196167 ) ) ( not ( = ?auto_196163 ?auto_196168 ) ) ( not ( = ?auto_196164 ?auto_196165 ) ) ( not ( = ?auto_196164 ?auto_196166 ) ) ( not ( = ?auto_196164 ?auto_196167 ) ) ( not ( = ?auto_196164 ?auto_196168 ) ) ( not ( = ?auto_196165 ?auto_196166 ) ) ( not ( = ?auto_196165 ?auto_196167 ) ) ( not ( = ?auto_196165 ?auto_196168 ) ) ( not ( = ?auto_196166 ?auto_196167 ) ) ( not ( = ?auto_196166 ?auto_196168 ) ) ( not ( = ?auto_196167 ?auto_196168 ) ) ( ON ?auto_196166 ?auto_196167 ) ( CLEAR ?auto_196164 ) ( ON ?auto_196165 ?auto_196166 ) ( CLEAR ?auto_196165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_196157 ?auto_196158 ?auto_196159 ?auto_196160 ?auto_196161 ?auto_196162 ?auto_196163 ?auto_196164 ?auto_196165 )
      ( MAKE-11PILE ?auto_196157 ?auto_196158 ?auto_196159 ?auto_196160 ?auto_196161 ?auto_196162 ?auto_196163 ?auto_196164 ?auto_196165 ?auto_196166 ?auto_196167 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196180 - BLOCK
      ?auto_196181 - BLOCK
      ?auto_196182 - BLOCK
      ?auto_196183 - BLOCK
      ?auto_196184 - BLOCK
      ?auto_196185 - BLOCK
      ?auto_196186 - BLOCK
      ?auto_196187 - BLOCK
      ?auto_196188 - BLOCK
      ?auto_196189 - BLOCK
      ?auto_196190 - BLOCK
    )
    :vars
    (
      ?auto_196191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196190 ?auto_196191 ) ( ON-TABLE ?auto_196180 ) ( ON ?auto_196181 ?auto_196180 ) ( ON ?auto_196182 ?auto_196181 ) ( ON ?auto_196183 ?auto_196182 ) ( ON ?auto_196184 ?auto_196183 ) ( ON ?auto_196185 ?auto_196184 ) ( ON ?auto_196186 ?auto_196185 ) ( ON ?auto_196187 ?auto_196186 ) ( not ( = ?auto_196180 ?auto_196181 ) ) ( not ( = ?auto_196180 ?auto_196182 ) ) ( not ( = ?auto_196180 ?auto_196183 ) ) ( not ( = ?auto_196180 ?auto_196184 ) ) ( not ( = ?auto_196180 ?auto_196185 ) ) ( not ( = ?auto_196180 ?auto_196186 ) ) ( not ( = ?auto_196180 ?auto_196187 ) ) ( not ( = ?auto_196180 ?auto_196188 ) ) ( not ( = ?auto_196180 ?auto_196189 ) ) ( not ( = ?auto_196180 ?auto_196190 ) ) ( not ( = ?auto_196180 ?auto_196191 ) ) ( not ( = ?auto_196181 ?auto_196182 ) ) ( not ( = ?auto_196181 ?auto_196183 ) ) ( not ( = ?auto_196181 ?auto_196184 ) ) ( not ( = ?auto_196181 ?auto_196185 ) ) ( not ( = ?auto_196181 ?auto_196186 ) ) ( not ( = ?auto_196181 ?auto_196187 ) ) ( not ( = ?auto_196181 ?auto_196188 ) ) ( not ( = ?auto_196181 ?auto_196189 ) ) ( not ( = ?auto_196181 ?auto_196190 ) ) ( not ( = ?auto_196181 ?auto_196191 ) ) ( not ( = ?auto_196182 ?auto_196183 ) ) ( not ( = ?auto_196182 ?auto_196184 ) ) ( not ( = ?auto_196182 ?auto_196185 ) ) ( not ( = ?auto_196182 ?auto_196186 ) ) ( not ( = ?auto_196182 ?auto_196187 ) ) ( not ( = ?auto_196182 ?auto_196188 ) ) ( not ( = ?auto_196182 ?auto_196189 ) ) ( not ( = ?auto_196182 ?auto_196190 ) ) ( not ( = ?auto_196182 ?auto_196191 ) ) ( not ( = ?auto_196183 ?auto_196184 ) ) ( not ( = ?auto_196183 ?auto_196185 ) ) ( not ( = ?auto_196183 ?auto_196186 ) ) ( not ( = ?auto_196183 ?auto_196187 ) ) ( not ( = ?auto_196183 ?auto_196188 ) ) ( not ( = ?auto_196183 ?auto_196189 ) ) ( not ( = ?auto_196183 ?auto_196190 ) ) ( not ( = ?auto_196183 ?auto_196191 ) ) ( not ( = ?auto_196184 ?auto_196185 ) ) ( not ( = ?auto_196184 ?auto_196186 ) ) ( not ( = ?auto_196184 ?auto_196187 ) ) ( not ( = ?auto_196184 ?auto_196188 ) ) ( not ( = ?auto_196184 ?auto_196189 ) ) ( not ( = ?auto_196184 ?auto_196190 ) ) ( not ( = ?auto_196184 ?auto_196191 ) ) ( not ( = ?auto_196185 ?auto_196186 ) ) ( not ( = ?auto_196185 ?auto_196187 ) ) ( not ( = ?auto_196185 ?auto_196188 ) ) ( not ( = ?auto_196185 ?auto_196189 ) ) ( not ( = ?auto_196185 ?auto_196190 ) ) ( not ( = ?auto_196185 ?auto_196191 ) ) ( not ( = ?auto_196186 ?auto_196187 ) ) ( not ( = ?auto_196186 ?auto_196188 ) ) ( not ( = ?auto_196186 ?auto_196189 ) ) ( not ( = ?auto_196186 ?auto_196190 ) ) ( not ( = ?auto_196186 ?auto_196191 ) ) ( not ( = ?auto_196187 ?auto_196188 ) ) ( not ( = ?auto_196187 ?auto_196189 ) ) ( not ( = ?auto_196187 ?auto_196190 ) ) ( not ( = ?auto_196187 ?auto_196191 ) ) ( not ( = ?auto_196188 ?auto_196189 ) ) ( not ( = ?auto_196188 ?auto_196190 ) ) ( not ( = ?auto_196188 ?auto_196191 ) ) ( not ( = ?auto_196189 ?auto_196190 ) ) ( not ( = ?auto_196189 ?auto_196191 ) ) ( not ( = ?auto_196190 ?auto_196191 ) ) ( ON ?auto_196189 ?auto_196190 ) ( CLEAR ?auto_196187 ) ( ON ?auto_196188 ?auto_196189 ) ( CLEAR ?auto_196188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_196180 ?auto_196181 ?auto_196182 ?auto_196183 ?auto_196184 ?auto_196185 ?auto_196186 ?auto_196187 ?auto_196188 )
      ( MAKE-11PILE ?auto_196180 ?auto_196181 ?auto_196182 ?auto_196183 ?auto_196184 ?auto_196185 ?auto_196186 ?auto_196187 ?auto_196188 ?auto_196189 ?auto_196190 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196203 - BLOCK
      ?auto_196204 - BLOCK
      ?auto_196205 - BLOCK
      ?auto_196206 - BLOCK
      ?auto_196207 - BLOCK
      ?auto_196208 - BLOCK
      ?auto_196209 - BLOCK
      ?auto_196210 - BLOCK
      ?auto_196211 - BLOCK
      ?auto_196212 - BLOCK
      ?auto_196213 - BLOCK
    )
    :vars
    (
      ?auto_196214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196213 ?auto_196214 ) ( ON-TABLE ?auto_196203 ) ( ON ?auto_196204 ?auto_196203 ) ( ON ?auto_196205 ?auto_196204 ) ( ON ?auto_196206 ?auto_196205 ) ( ON ?auto_196207 ?auto_196206 ) ( ON ?auto_196208 ?auto_196207 ) ( ON ?auto_196209 ?auto_196208 ) ( not ( = ?auto_196203 ?auto_196204 ) ) ( not ( = ?auto_196203 ?auto_196205 ) ) ( not ( = ?auto_196203 ?auto_196206 ) ) ( not ( = ?auto_196203 ?auto_196207 ) ) ( not ( = ?auto_196203 ?auto_196208 ) ) ( not ( = ?auto_196203 ?auto_196209 ) ) ( not ( = ?auto_196203 ?auto_196210 ) ) ( not ( = ?auto_196203 ?auto_196211 ) ) ( not ( = ?auto_196203 ?auto_196212 ) ) ( not ( = ?auto_196203 ?auto_196213 ) ) ( not ( = ?auto_196203 ?auto_196214 ) ) ( not ( = ?auto_196204 ?auto_196205 ) ) ( not ( = ?auto_196204 ?auto_196206 ) ) ( not ( = ?auto_196204 ?auto_196207 ) ) ( not ( = ?auto_196204 ?auto_196208 ) ) ( not ( = ?auto_196204 ?auto_196209 ) ) ( not ( = ?auto_196204 ?auto_196210 ) ) ( not ( = ?auto_196204 ?auto_196211 ) ) ( not ( = ?auto_196204 ?auto_196212 ) ) ( not ( = ?auto_196204 ?auto_196213 ) ) ( not ( = ?auto_196204 ?auto_196214 ) ) ( not ( = ?auto_196205 ?auto_196206 ) ) ( not ( = ?auto_196205 ?auto_196207 ) ) ( not ( = ?auto_196205 ?auto_196208 ) ) ( not ( = ?auto_196205 ?auto_196209 ) ) ( not ( = ?auto_196205 ?auto_196210 ) ) ( not ( = ?auto_196205 ?auto_196211 ) ) ( not ( = ?auto_196205 ?auto_196212 ) ) ( not ( = ?auto_196205 ?auto_196213 ) ) ( not ( = ?auto_196205 ?auto_196214 ) ) ( not ( = ?auto_196206 ?auto_196207 ) ) ( not ( = ?auto_196206 ?auto_196208 ) ) ( not ( = ?auto_196206 ?auto_196209 ) ) ( not ( = ?auto_196206 ?auto_196210 ) ) ( not ( = ?auto_196206 ?auto_196211 ) ) ( not ( = ?auto_196206 ?auto_196212 ) ) ( not ( = ?auto_196206 ?auto_196213 ) ) ( not ( = ?auto_196206 ?auto_196214 ) ) ( not ( = ?auto_196207 ?auto_196208 ) ) ( not ( = ?auto_196207 ?auto_196209 ) ) ( not ( = ?auto_196207 ?auto_196210 ) ) ( not ( = ?auto_196207 ?auto_196211 ) ) ( not ( = ?auto_196207 ?auto_196212 ) ) ( not ( = ?auto_196207 ?auto_196213 ) ) ( not ( = ?auto_196207 ?auto_196214 ) ) ( not ( = ?auto_196208 ?auto_196209 ) ) ( not ( = ?auto_196208 ?auto_196210 ) ) ( not ( = ?auto_196208 ?auto_196211 ) ) ( not ( = ?auto_196208 ?auto_196212 ) ) ( not ( = ?auto_196208 ?auto_196213 ) ) ( not ( = ?auto_196208 ?auto_196214 ) ) ( not ( = ?auto_196209 ?auto_196210 ) ) ( not ( = ?auto_196209 ?auto_196211 ) ) ( not ( = ?auto_196209 ?auto_196212 ) ) ( not ( = ?auto_196209 ?auto_196213 ) ) ( not ( = ?auto_196209 ?auto_196214 ) ) ( not ( = ?auto_196210 ?auto_196211 ) ) ( not ( = ?auto_196210 ?auto_196212 ) ) ( not ( = ?auto_196210 ?auto_196213 ) ) ( not ( = ?auto_196210 ?auto_196214 ) ) ( not ( = ?auto_196211 ?auto_196212 ) ) ( not ( = ?auto_196211 ?auto_196213 ) ) ( not ( = ?auto_196211 ?auto_196214 ) ) ( not ( = ?auto_196212 ?auto_196213 ) ) ( not ( = ?auto_196212 ?auto_196214 ) ) ( not ( = ?auto_196213 ?auto_196214 ) ) ( ON ?auto_196212 ?auto_196213 ) ( ON ?auto_196211 ?auto_196212 ) ( CLEAR ?auto_196209 ) ( ON ?auto_196210 ?auto_196211 ) ( CLEAR ?auto_196210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196203 ?auto_196204 ?auto_196205 ?auto_196206 ?auto_196207 ?auto_196208 ?auto_196209 ?auto_196210 )
      ( MAKE-11PILE ?auto_196203 ?auto_196204 ?auto_196205 ?auto_196206 ?auto_196207 ?auto_196208 ?auto_196209 ?auto_196210 ?auto_196211 ?auto_196212 ?auto_196213 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196226 - BLOCK
      ?auto_196227 - BLOCK
      ?auto_196228 - BLOCK
      ?auto_196229 - BLOCK
      ?auto_196230 - BLOCK
      ?auto_196231 - BLOCK
      ?auto_196232 - BLOCK
      ?auto_196233 - BLOCK
      ?auto_196234 - BLOCK
      ?auto_196235 - BLOCK
      ?auto_196236 - BLOCK
    )
    :vars
    (
      ?auto_196237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196236 ?auto_196237 ) ( ON-TABLE ?auto_196226 ) ( ON ?auto_196227 ?auto_196226 ) ( ON ?auto_196228 ?auto_196227 ) ( ON ?auto_196229 ?auto_196228 ) ( ON ?auto_196230 ?auto_196229 ) ( ON ?auto_196231 ?auto_196230 ) ( ON ?auto_196232 ?auto_196231 ) ( not ( = ?auto_196226 ?auto_196227 ) ) ( not ( = ?auto_196226 ?auto_196228 ) ) ( not ( = ?auto_196226 ?auto_196229 ) ) ( not ( = ?auto_196226 ?auto_196230 ) ) ( not ( = ?auto_196226 ?auto_196231 ) ) ( not ( = ?auto_196226 ?auto_196232 ) ) ( not ( = ?auto_196226 ?auto_196233 ) ) ( not ( = ?auto_196226 ?auto_196234 ) ) ( not ( = ?auto_196226 ?auto_196235 ) ) ( not ( = ?auto_196226 ?auto_196236 ) ) ( not ( = ?auto_196226 ?auto_196237 ) ) ( not ( = ?auto_196227 ?auto_196228 ) ) ( not ( = ?auto_196227 ?auto_196229 ) ) ( not ( = ?auto_196227 ?auto_196230 ) ) ( not ( = ?auto_196227 ?auto_196231 ) ) ( not ( = ?auto_196227 ?auto_196232 ) ) ( not ( = ?auto_196227 ?auto_196233 ) ) ( not ( = ?auto_196227 ?auto_196234 ) ) ( not ( = ?auto_196227 ?auto_196235 ) ) ( not ( = ?auto_196227 ?auto_196236 ) ) ( not ( = ?auto_196227 ?auto_196237 ) ) ( not ( = ?auto_196228 ?auto_196229 ) ) ( not ( = ?auto_196228 ?auto_196230 ) ) ( not ( = ?auto_196228 ?auto_196231 ) ) ( not ( = ?auto_196228 ?auto_196232 ) ) ( not ( = ?auto_196228 ?auto_196233 ) ) ( not ( = ?auto_196228 ?auto_196234 ) ) ( not ( = ?auto_196228 ?auto_196235 ) ) ( not ( = ?auto_196228 ?auto_196236 ) ) ( not ( = ?auto_196228 ?auto_196237 ) ) ( not ( = ?auto_196229 ?auto_196230 ) ) ( not ( = ?auto_196229 ?auto_196231 ) ) ( not ( = ?auto_196229 ?auto_196232 ) ) ( not ( = ?auto_196229 ?auto_196233 ) ) ( not ( = ?auto_196229 ?auto_196234 ) ) ( not ( = ?auto_196229 ?auto_196235 ) ) ( not ( = ?auto_196229 ?auto_196236 ) ) ( not ( = ?auto_196229 ?auto_196237 ) ) ( not ( = ?auto_196230 ?auto_196231 ) ) ( not ( = ?auto_196230 ?auto_196232 ) ) ( not ( = ?auto_196230 ?auto_196233 ) ) ( not ( = ?auto_196230 ?auto_196234 ) ) ( not ( = ?auto_196230 ?auto_196235 ) ) ( not ( = ?auto_196230 ?auto_196236 ) ) ( not ( = ?auto_196230 ?auto_196237 ) ) ( not ( = ?auto_196231 ?auto_196232 ) ) ( not ( = ?auto_196231 ?auto_196233 ) ) ( not ( = ?auto_196231 ?auto_196234 ) ) ( not ( = ?auto_196231 ?auto_196235 ) ) ( not ( = ?auto_196231 ?auto_196236 ) ) ( not ( = ?auto_196231 ?auto_196237 ) ) ( not ( = ?auto_196232 ?auto_196233 ) ) ( not ( = ?auto_196232 ?auto_196234 ) ) ( not ( = ?auto_196232 ?auto_196235 ) ) ( not ( = ?auto_196232 ?auto_196236 ) ) ( not ( = ?auto_196232 ?auto_196237 ) ) ( not ( = ?auto_196233 ?auto_196234 ) ) ( not ( = ?auto_196233 ?auto_196235 ) ) ( not ( = ?auto_196233 ?auto_196236 ) ) ( not ( = ?auto_196233 ?auto_196237 ) ) ( not ( = ?auto_196234 ?auto_196235 ) ) ( not ( = ?auto_196234 ?auto_196236 ) ) ( not ( = ?auto_196234 ?auto_196237 ) ) ( not ( = ?auto_196235 ?auto_196236 ) ) ( not ( = ?auto_196235 ?auto_196237 ) ) ( not ( = ?auto_196236 ?auto_196237 ) ) ( ON ?auto_196235 ?auto_196236 ) ( ON ?auto_196234 ?auto_196235 ) ( CLEAR ?auto_196232 ) ( ON ?auto_196233 ?auto_196234 ) ( CLEAR ?auto_196233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196226 ?auto_196227 ?auto_196228 ?auto_196229 ?auto_196230 ?auto_196231 ?auto_196232 ?auto_196233 )
      ( MAKE-11PILE ?auto_196226 ?auto_196227 ?auto_196228 ?auto_196229 ?auto_196230 ?auto_196231 ?auto_196232 ?auto_196233 ?auto_196234 ?auto_196235 ?auto_196236 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196249 - BLOCK
      ?auto_196250 - BLOCK
      ?auto_196251 - BLOCK
      ?auto_196252 - BLOCK
      ?auto_196253 - BLOCK
      ?auto_196254 - BLOCK
      ?auto_196255 - BLOCK
      ?auto_196256 - BLOCK
      ?auto_196257 - BLOCK
      ?auto_196258 - BLOCK
      ?auto_196259 - BLOCK
    )
    :vars
    (
      ?auto_196260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196259 ?auto_196260 ) ( ON-TABLE ?auto_196249 ) ( ON ?auto_196250 ?auto_196249 ) ( ON ?auto_196251 ?auto_196250 ) ( ON ?auto_196252 ?auto_196251 ) ( ON ?auto_196253 ?auto_196252 ) ( ON ?auto_196254 ?auto_196253 ) ( not ( = ?auto_196249 ?auto_196250 ) ) ( not ( = ?auto_196249 ?auto_196251 ) ) ( not ( = ?auto_196249 ?auto_196252 ) ) ( not ( = ?auto_196249 ?auto_196253 ) ) ( not ( = ?auto_196249 ?auto_196254 ) ) ( not ( = ?auto_196249 ?auto_196255 ) ) ( not ( = ?auto_196249 ?auto_196256 ) ) ( not ( = ?auto_196249 ?auto_196257 ) ) ( not ( = ?auto_196249 ?auto_196258 ) ) ( not ( = ?auto_196249 ?auto_196259 ) ) ( not ( = ?auto_196249 ?auto_196260 ) ) ( not ( = ?auto_196250 ?auto_196251 ) ) ( not ( = ?auto_196250 ?auto_196252 ) ) ( not ( = ?auto_196250 ?auto_196253 ) ) ( not ( = ?auto_196250 ?auto_196254 ) ) ( not ( = ?auto_196250 ?auto_196255 ) ) ( not ( = ?auto_196250 ?auto_196256 ) ) ( not ( = ?auto_196250 ?auto_196257 ) ) ( not ( = ?auto_196250 ?auto_196258 ) ) ( not ( = ?auto_196250 ?auto_196259 ) ) ( not ( = ?auto_196250 ?auto_196260 ) ) ( not ( = ?auto_196251 ?auto_196252 ) ) ( not ( = ?auto_196251 ?auto_196253 ) ) ( not ( = ?auto_196251 ?auto_196254 ) ) ( not ( = ?auto_196251 ?auto_196255 ) ) ( not ( = ?auto_196251 ?auto_196256 ) ) ( not ( = ?auto_196251 ?auto_196257 ) ) ( not ( = ?auto_196251 ?auto_196258 ) ) ( not ( = ?auto_196251 ?auto_196259 ) ) ( not ( = ?auto_196251 ?auto_196260 ) ) ( not ( = ?auto_196252 ?auto_196253 ) ) ( not ( = ?auto_196252 ?auto_196254 ) ) ( not ( = ?auto_196252 ?auto_196255 ) ) ( not ( = ?auto_196252 ?auto_196256 ) ) ( not ( = ?auto_196252 ?auto_196257 ) ) ( not ( = ?auto_196252 ?auto_196258 ) ) ( not ( = ?auto_196252 ?auto_196259 ) ) ( not ( = ?auto_196252 ?auto_196260 ) ) ( not ( = ?auto_196253 ?auto_196254 ) ) ( not ( = ?auto_196253 ?auto_196255 ) ) ( not ( = ?auto_196253 ?auto_196256 ) ) ( not ( = ?auto_196253 ?auto_196257 ) ) ( not ( = ?auto_196253 ?auto_196258 ) ) ( not ( = ?auto_196253 ?auto_196259 ) ) ( not ( = ?auto_196253 ?auto_196260 ) ) ( not ( = ?auto_196254 ?auto_196255 ) ) ( not ( = ?auto_196254 ?auto_196256 ) ) ( not ( = ?auto_196254 ?auto_196257 ) ) ( not ( = ?auto_196254 ?auto_196258 ) ) ( not ( = ?auto_196254 ?auto_196259 ) ) ( not ( = ?auto_196254 ?auto_196260 ) ) ( not ( = ?auto_196255 ?auto_196256 ) ) ( not ( = ?auto_196255 ?auto_196257 ) ) ( not ( = ?auto_196255 ?auto_196258 ) ) ( not ( = ?auto_196255 ?auto_196259 ) ) ( not ( = ?auto_196255 ?auto_196260 ) ) ( not ( = ?auto_196256 ?auto_196257 ) ) ( not ( = ?auto_196256 ?auto_196258 ) ) ( not ( = ?auto_196256 ?auto_196259 ) ) ( not ( = ?auto_196256 ?auto_196260 ) ) ( not ( = ?auto_196257 ?auto_196258 ) ) ( not ( = ?auto_196257 ?auto_196259 ) ) ( not ( = ?auto_196257 ?auto_196260 ) ) ( not ( = ?auto_196258 ?auto_196259 ) ) ( not ( = ?auto_196258 ?auto_196260 ) ) ( not ( = ?auto_196259 ?auto_196260 ) ) ( ON ?auto_196258 ?auto_196259 ) ( ON ?auto_196257 ?auto_196258 ) ( ON ?auto_196256 ?auto_196257 ) ( CLEAR ?auto_196254 ) ( ON ?auto_196255 ?auto_196256 ) ( CLEAR ?auto_196255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_196249 ?auto_196250 ?auto_196251 ?auto_196252 ?auto_196253 ?auto_196254 ?auto_196255 )
      ( MAKE-11PILE ?auto_196249 ?auto_196250 ?auto_196251 ?auto_196252 ?auto_196253 ?auto_196254 ?auto_196255 ?auto_196256 ?auto_196257 ?auto_196258 ?auto_196259 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196272 - BLOCK
      ?auto_196273 - BLOCK
      ?auto_196274 - BLOCK
      ?auto_196275 - BLOCK
      ?auto_196276 - BLOCK
      ?auto_196277 - BLOCK
      ?auto_196278 - BLOCK
      ?auto_196279 - BLOCK
      ?auto_196280 - BLOCK
      ?auto_196281 - BLOCK
      ?auto_196282 - BLOCK
    )
    :vars
    (
      ?auto_196283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196282 ?auto_196283 ) ( ON-TABLE ?auto_196272 ) ( ON ?auto_196273 ?auto_196272 ) ( ON ?auto_196274 ?auto_196273 ) ( ON ?auto_196275 ?auto_196274 ) ( ON ?auto_196276 ?auto_196275 ) ( ON ?auto_196277 ?auto_196276 ) ( not ( = ?auto_196272 ?auto_196273 ) ) ( not ( = ?auto_196272 ?auto_196274 ) ) ( not ( = ?auto_196272 ?auto_196275 ) ) ( not ( = ?auto_196272 ?auto_196276 ) ) ( not ( = ?auto_196272 ?auto_196277 ) ) ( not ( = ?auto_196272 ?auto_196278 ) ) ( not ( = ?auto_196272 ?auto_196279 ) ) ( not ( = ?auto_196272 ?auto_196280 ) ) ( not ( = ?auto_196272 ?auto_196281 ) ) ( not ( = ?auto_196272 ?auto_196282 ) ) ( not ( = ?auto_196272 ?auto_196283 ) ) ( not ( = ?auto_196273 ?auto_196274 ) ) ( not ( = ?auto_196273 ?auto_196275 ) ) ( not ( = ?auto_196273 ?auto_196276 ) ) ( not ( = ?auto_196273 ?auto_196277 ) ) ( not ( = ?auto_196273 ?auto_196278 ) ) ( not ( = ?auto_196273 ?auto_196279 ) ) ( not ( = ?auto_196273 ?auto_196280 ) ) ( not ( = ?auto_196273 ?auto_196281 ) ) ( not ( = ?auto_196273 ?auto_196282 ) ) ( not ( = ?auto_196273 ?auto_196283 ) ) ( not ( = ?auto_196274 ?auto_196275 ) ) ( not ( = ?auto_196274 ?auto_196276 ) ) ( not ( = ?auto_196274 ?auto_196277 ) ) ( not ( = ?auto_196274 ?auto_196278 ) ) ( not ( = ?auto_196274 ?auto_196279 ) ) ( not ( = ?auto_196274 ?auto_196280 ) ) ( not ( = ?auto_196274 ?auto_196281 ) ) ( not ( = ?auto_196274 ?auto_196282 ) ) ( not ( = ?auto_196274 ?auto_196283 ) ) ( not ( = ?auto_196275 ?auto_196276 ) ) ( not ( = ?auto_196275 ?auto_196277 ) ) ( not ( = ?auto_196275 ?auto_196278 ) ) ( not ( = ?auto_196275 ?auto_196279 ) ) ( not ( = ?auto_196275 ?auto_196280 ) ) ( not ( = ?auto_196275 ?auto_196281 ) ) ( not ( = ?auto_196275 ?auto_196282 ) ) ( not ( = ?auto_196275 ?auto_196283 ) ) ( not ( = ?auto_196276 ?auto_196277 ) ) ( not ( = ?auto_196276 ?auto_196278 ) ) ( not ( = ?auto_196276 ?auto_196279 ) ) ( not ( = ?auto_196276 ?auto_196280 ) ) ( not ( = ?auto_196276 ?auto_196281 ) ) ( not ( = ?auto_196276 ?auto_196282 ) ) ( not ( = ?auto_196276 ?auto_196283 ) ) ( not ( = ?auto_196277 ?auto_196278 ) ) ( not ( = ?auto_196277 ?auto_196279 ) ) ( not ( = ?auto_196277 ?auto_196280 ) ) ( not ( = ?auto_196277 ?auto_196281 ) ) ( not ( = ?auto_196277 ?auto_196282 ) ) ( not ( = ?auto_196277 ?auto_196283 ) ) ( not ( = ?auto_196278 ?auto_196279 ) ) ( not ( = ?auto_196278 ?auto_196280 ) ) ( not ( = ?auto_196278 ?auto_196281 ) ) ( not ( = ?auto_196278 ?auto_196282 ) ) ( not ( = ?auto_196278 ?auto_196283 ) ) ( not ( = ?auto_196279 ?auto_196280 ) ) ( not ( = ?auto_196279 ?auto_196281 ) ) ( not ( = ?auto_196279 ?auto_196282 ) ) ( not ( = ?auto_196279 ?auto_196283 ) ) ( not ( = ?auto_196280 ?auto_196281 ) ) ( not ( = ?auto_196280 ?auto_196282 ) ) ( not ( = ?auto_196280 ?auto_196283 ) ) ( not ( = ?auto_196281 ?auto_196282 ) ) ( not ( = ?auto_196281 ?auto_196283 ) ) ( not ( = ?auto_196282 ?auto_196283 ) ) ( ON ?auto_196281 ?auto_196282 ) ( ON ?auto_196280 ?auto_196281 ) ( ON ?auto_196279 ?auto_196280 ) ( CLEAR ?auto_196277 ) ( ON ?auto_196278 ?auto_196279 ) ( CLEAR ?auto_196278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_196272 ?auto_196273 ?auto_196274 ?auto_196275 ?auto_196276 ?auto_196277 ?auto_196278 )
      ( MAKE-11PILE ?auto_196272 ?auto_196273 ?auto_196274 ?auto_196275 ?auto_196276 ?auto_196277 ?auto_196278 ?auto_196279 ?auto_196280 ?auto_196281 ?auto_196282 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196295 - BLOCK
      ?auto_196296 - BLOCK
      ?auto_196297 - BLOCK
      ?auto_196298 - BLOCK
      ?auto_196299 - BLOCK
      ?auto_196300 - BLOCK
      ?auto_196301 - BLOCK
      ?auto_196302 - BLOCK
      ?auto_196303 - BLOCK
      ?auto_196304 - BLOCK
      ?auto_196305 - BLOCK
    )
    :vars
    (
      ?auto_196306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196305 ?auto_196306 ) ( ON-TABLE ?auto_196295 ) ( ON ?auto_196296 ?auto_196295 ) ( ON ?auto_196297 ?auto_196296 ) ( ON ?auto_196298 ?auto_196297 ) ( ON ?auto_196299 ?auto_196298 ) ( not ( = ?auto_196295 ?auto_196296 ) ) ( not ( = ?auto_196295 ?auto_196297 ) ) ( not ( = ?auto_196295 ?auto_196298 ) ) ( not ( = ?auto_196295 ?auto_196299 ) ) ( not ( = ?auto_196295 ?auto_196300 ) ) ( not ( = ?auto_196295 ?auto_196301 ) ) ( not ( = ?auto_196295 ?auto_196302 ) ) ( not ( = ?auto_196295 ?auto_196303 ) ) ( not ( = ?auto_196295 ?auto_196304 ) ) ( not ( = ?auto_196295 ?auto_196305 ) ) ( not ( = ?auto_196295 ?auto_196306 ) ) ( not ( = ?auto_196296 ?auto_196297 ) ) ( not ( = ?auto_196296 ?auto_196298 ) ) ( not ( = ?auto_196296 ?auto_196299 ) ) ( not ( = ?auto_196296 ?auto_196300 ) ) ( not ( = ?auto_196296 ?auto_196301 ) ) ( not ( = ?auto_196296 ?auto_196302 ) ) ( not ( = ?auto_196296 ?auto_196303 ) ) ( not ( = ?auto_196296 ?auto_196304 ) ) ( not ( = ?auto_196296 ?auto_196305 ) ) ( not ( = ?auto_196296 ?auto_196306 ) ) ( not ( = ?auto_196297 ?auto_196298 ) ) ( not ( = ?auto_196297 ?auto_196299 ) ) ( not ( = ?auto_196297 ?auto_196300 ) ) ( not ( = ?auto_196297 ?auto_196301 ) ) ( not ( = ?auto_196297 ?auto_196302 ) ) ( not ( = ?auto_196297 ?auto_196303 ) ) ( not ( = ?auto_196297 ?auto_196304 ) ) ( not ( = ?auto_196297 ?auto_196305 ) ) ( not ( = ?auto_196297 ?auto_196306 ) ) ( not ( = ?auto_196298 ?auto_196299 ) ) ( not ( = ?auto_196298 ?auto_196300 ) ) ( not ( = ?auto_196298 ?auto_196301 ) ) ( not ( = ?auto_196298 ?auto_196302 ) ) ( not ( = ?auto_196298 ?auto_196303 ) ) ( not ( = ?auto_196298 ?auto_196304 ) ) ( not ( = ?auto_196298 ?auto_196305 ) ) ( not ( = ?auto_196298 ?auto_196306 ) ) ( not ( = ?auto_196299 ?auto_196300 ) ) ( not ( = ?auto_196299 ?auto_196301 ) ) ( not ( = ?auto_196299 ?auto_196302 ) ) ( not ( = ?auto_196299 ?auto_196303 ) ) ( not ( = ?auto_196299 ?auto_196304 ) ) ( not ( = ?auto_196299 ?auto_196305 ) ) ( not ( = ?auto_196299 ?auto_196306 ) ) ( not ( = ?auto_196300 ?auto_196301 ) ) ( not ( = ?auto_196300 ?auto_196302 ) ) ( not ( = ?auto_196300 ?auto_196303 ) ) ( not ( = ?auto_196300 ?auto_196304 ) ) ( not ( = ?auto_196300 ?auto_196305 ) ) ( not ( = ?auto_196300 ?auto_196306 ) ) ( not ( = ?auto_196301 ?auto_196302 ) ) ( not ( = ?auto_196301 ?auto_196303 ) ) ( not ( = ?auto_196301 ?auto_196304 ) ) ( not ( = ?auto_196301 ?auto_196305 ) ) ( not ( = ?auto_196301 ?auto_196306 ) ) ( not ( = ?auto_196302 ?auto_196303 ) ) ( not ( = ?auto_196302 ?auto_196304 ) ) ( not ( = ?auto_196302 ?auto_196305 ) ) ( not ( = ?auto_196302 ?auto_196306 ) ) ( not ( = ?auto_196303 ?auto_196304 ) ) ( not ( = ?auto_196303 ?auto_196305 ) ) ( not ( = ?auto_196303 ?auto_196306 ) ) ( not ( = ?auto_196304 ?auto_196305 ) ) ( not ( = ?auto_196304 ?auto_196306 ) ) ( not ( = ?auto_196305 ?auto_196306 ) ) ( ON ?auto_196304 ?auto_196305 ) ( ON ?auto_196303 ?auto_196304 ) ( ON ?auto_196302 ?auto_196303 ) ( ON ?auto_196301 ?auto_196302 ) ( CLEAR ?auto_196299 ) ( ON ?auto_196300 ?auto_196301 ) ( CLEAR ?auto_196300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_196295 ?auto_196296 ?auto_196297 ?auto_196298 ?auto_196299 ?auto_196300 )
      ( MAKE-11PILE ?auto_196295 ?auto_196296 ?auto_196297 ?auto_196298 ?auto_196299 ?auto_196300 ?auto_196301 ?auto_196302 ?auto_196303 ?auto_196304 ?auto_196305 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196318 - BLOCK
      ?auto_196319 - BLOCK
      ?auto_196320 - BLOCK
      ?auto_196321 - BLOCK
      ?auto_196322 - BLOCK
      ?auto_196323 - BLOCK
      ?auto_196324 - BLOCK
      ?auto_196325 - BLOCK
      ?auto_196326 - BLOCK
      ?auto_196327 - BLOCK
      ?auto_196328 - BLOCK
    )
    :vars
    (
      ?auto_196329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196328 ?auto_196329 ) ( ON-TABLE ?auto_196318 ) ( ON ?auto_196319 ?auto_196318 ) ( ON ?auto_196320 ?auto_196319 ) ( ON ?auto_196321 ?auto_196320 ) ( ON ?auto_196322 ?auto_196321 ) ( not ( = ?auto_196318 ?auto_196319 ) ) ( not ( = ?auto_196318 ?auto_196320 ) ) ( not ( = ?auto_196318 ?auto_196321 ) ) ( not ( = ?auto_196318 ?auto_196322 ) ) ( not ( = ?auto_196318 ?auto_196323 ) ) ( not ( = ?auto_196318 ?auto_196324 ) ) ( not ( = ?auto_196318 ?auto_196325 ) ) ( not ( = ?auto_196318 ?auto_196326 ) ) ( not ( = ?auto_196318 ?auto_196327 ) ) ( not ( = ?auto_196318 ?auto_196328 ) ) ( not ( = ?auto_196318 ?auto_196329 ) ) ( not ( = ?auto_196319 ?auto_196320 ) ) ( not ( = ?auto_196319 ?auto_196321 ) ) ( not ( = ?auto_196319 ?auto_196322 ) ) ( not ( = ?auto_196319 ?auto_196323 ) ) ( not ( = ?auto_196319 ?auto_196324 ) ) ( not ( = ?auto_196319 ?auto_196325 ) ) ( not ( = ?auto_196319 ?auto_196326 ) ) ( not ( = ?auto_196319 ?auto_196327 ) ) ( not ( = ?auto_196319 ?auto_196328 ) ) ( not ( = ?auto_196319 ?auto_196329 ) ) ( not ( = ?auto_196320 ?auto_196321 ) ) ( not ( = ?auto_196320 ?auto_196322 ) ) ( not ( = ?auto_196320 ?auto_196323 ) ) ( not ( = ?auto_196320 ?auto_196324 ) ) ( not ( = ?auto_196320 ?auto_196325 ) ) ( not ( = ?auto_196320 ?auto_196326 ) ) ( not ( = ?auto_196320 ?auto_196327 ) ) ( not ( = ?auto_196320 ?auto_196328 ) ) ( not ( = ?auto_196320 ?auto_196329 ) ) ( not ( = ?auto_196321 ?auto_196322 ) ) ( not ( = ?auto_196321 ?auto_196323 ) ) ( not ( = ?auto_196321 ?auto_196324 ) ) ( not ( = ?auto_196321 ?auto_196325 ) ) ( not ( = ?auto_196321 ?auto_196326 ) ) ( not ( = ?auto_196321 ?auto_196327 ) ) ( not ( = ?auto_196321 ?auto_196328 ) ) ( not ( = ?auto_196321 ?auto_196329 ) ) ( not ( = ?auto_196322 ?auto_196323 ) ) ( not ( = ?auto_196322 ?auto_196324 ) ) ( not ( = ?auto_196322 ?auto_196325 ) ) ( not ( = ?auto_196322 ?auto_196326 ) ) ( not ( = ?auto_196322 ?auto_196327 ) ) ( not ( = ?auto_196322 ?auto_196328 ) ) ( not ( = ?auto_196322 ?auto_196329 ) ) ( not ( = ?auto_196323 ?auto_196324 ) ) ( not ( = ?auto_196323 ?auto_196325 ) ) ( not ( = ?auto_196323 ?auto_196326 ) ) ( not ( = ?auto_196323 ?auto_196327 ) ) ( not ( = ?auto_196323 ?auto_196328 ) ) ( not ( = ?auto_196323 ?auto_196329 ) ) ( not ( = ?auto_196324 ?auto_196325 ) ) ( not ( = ?auto_196324 ?auto_196326 ) ) ( not ( = ?auto_196324 ?auto_196327 ) ) ( not ( = ?auto_196324 ?auto_196328 ) ) ( not ( = ?auto_196324 ?auto_196329 ) ) ( not ( = ?auto_196325 ?auto_196326 ) ) ( not ( = ?auto_196325 ?auto_196327 ) ) ( not ( = ?auto_196325 ?auto_196328 ) ) ( not ( = ?auto_196325 ?auto_196329 ) ) ( not ( = ?auto_196326 ?auto_196327 ) ) ( not ( = ?auto_196326 ?auto_196328 ) ) ( not ( = ?auto_196326 ?auto_196329 ) ) ( not ( = ?auto_196327 ?auto_196328 ) ) ( not ( = ?auto_196327 ?auto_196329 ) ) ( not ( = ?auto_196328 ?auto_196329 ) ) ( ON ?auto_196327 ?auto_196328 ) ( ON ?auto_196326 ?auto_196327 ) ( ON ?auto_196325 ?auto_196326 ) ( ON ?auto_196324 ?auto_196325 ) ( CLEAR ?auto_196322 ) ( ON ?auto_196323 ?auto_196324 ) ( CLEAR ?auto_196323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_196318 ?auto_196319 ?auto_196320 ?auto_196321 ?auto_196322 ?auto_196323 )
      ( MAKE-11PILE ?auto_196318 ?auto_196319 ?auto_196320 ?auto_196321 ?auto_196322 ?auto_196323 ?auto_196324 ?auto_196325 ?auto_196326 ?auto_196327 ?auto_196328 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196341 - BLOCK
      ?auto_196342 - BLOCK
      ?auto_196343 - BLOCK
      ?auto_196344 - BLOCK
      ?auto_196345 - BLOCK
      ?auto_196346 - BLOCK
      ?auto_196347 - BLOCK
      ?auto_196348 - BLOCK
      ?auto_196349 - BLOCK
      ?auto_196350 - BLOCK
      ?auto_196351 - BLOCK
    )
    :vars
    (
      ?auto_196352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196351 ?auto_196352 ) ( ON-TABLE ?auto_196341 ) ( ON ?auto_196342 ?auto_196341 ) ( ON ?auto_196343 ?auto_196342 ) ( ON ?auto_196344 ?auto_196343 ) ( not ( = ?auto_196341 ?auto_196342 ) ) ( not ( = ?auto_196341 ?auto_196343 ) ) ( not ( = ?auto_196341 ?auto_196344 ) ) ( not ( = ?auto_196341 ?auto_196345 ) ) ( not ( = ?auto_196341 ?auto_196346 ) ) ( not ( = ?auto_196341 ?auto_196347 ) ) ( not ( = ?auto_196341 ?auto_196348 ) ) ( not ( = ?auto_196341 ?auto_196349 ) ) ( not ( = ?auto_196341 ?auto_196350 ) ) ( not ( = ?auto_196341 ?auto_196351 ) ) ( not ( = ?auto_196341 ?auto_196352 ) ) ( not ( = ?auto_196342 ?auto_196343 ) ) ( not ( = ?auto_196342 ?auto_196344 ) ) ( not ( = ?auto_196342 ?auto_196345 ) ) ( not ( = ?auto_196342 ?auto_196346 ) ) ( not ( = ?auto_196342 ?auto_196347 ) ) ( not ( = ?auto_196342 ?auto_196348 ) ) ( not ( = ?auto_196342 ?auto_196349 ) ) ( not ( = ?auto_196342 ?auto_196350 ) ) ( not ( = ?auto_196342 ?auto_196351 ) ) ( not ( = ?auto_196342 ?auto_196352 ) ) ( not ( = ?auto_196343 ?auto_196344 ) ) ( not ( = ?auto_196343 ?auto_196345 ) ) ( not ( = ?auto_196343 ?auto_196346 ) ) ( not ( = ?auto_196343 ?auto_196347 ) ) ( not ( = ?auto_196343 ?auto_196348 ) ) ( not ( = ?auto_196343 ?auto_196349 ) ) ( not ( = ?auto_196343 ?auto_196350 ) ) ( not ( = ?auto_196343 ?auto_196351 ) ) ( not ( = ?auto_196343 ?auto_196352 ) ) ( not ( = ?auto_196344 ?auto_196345 ) ) ( not ( = ?auto_196344 ?auto_196346 ) ) ( not ( = ?auto_196344 ?auto_196347 ) ) ( not ( = ?auto_196344 ?auto_196348 ) ) ( not ( = ?auto_196344 ?auto_196349 ) ) ( not ( = ?auto_196344 ?auto_196350 ) ) ( not ( = ?auto_196344 ?auto_196351 ) ) ( not ( = ?auto_196344 ?auto_196352 ) ) ( not ( = ?auto_196345 ?auto_196346 ) ) ( not ( = ?auto_196345 ?auto_196347 ) ) ( not ( = ?auto_196345 ?auto_196348 ) ) ( not ( = ?auto_196345 ?auto_196349 ) ) ( not ( = ?auto_196345 ?auto_196350 ) ) ( not ( = ?auto_196345 ?auto_196351 ) ) ( not ( = ?auto_196345 ?auto_196352 ) ) ( not ( = ?auto_196346 ?auto_196347 ) ) ( not ( = ?auto_196346 ?auto_196348 ) ) ( not ( = ?auto_196346 ?auto_196349 ) ) ( not ( = ?auto_196346 ?auto_196350 ) ) ( not ( = ?auto_196346 ?auto_196351 ) ) ( not ( = ?auto_196346 ?auto_196352 ) ) ( not ( = ?auto_196347 ?auto_196348 ) ) ( not ( = ?auto_196347 ?auto_196349 ) ) ( not ( = ?auto_196347 ?auto_196350 ) ) ( not ( = ?auto_196347 ?auto_196351 ) ) ( not ( = ?auto_196347 ?auto_196352 ) ) ( not ( = ?auto_196348 ?auto_196349 ) ) ( not ( = ?auto_196348 ?auto_196350 ) ) ( not ( = ?auto_196348 ?auto_196351 ) ) ( not ( = ?auto_196348 ?auto_196352 ) ) ( not ( = ?auto_196349 ?auto_196350 ) ) ( not ( = ?auto_196349 ?auto_196351 ) ) ( not ( = ?auto_196349 ?auto_196352 ) ) ( not ( = ?auto_196350 ?auto_196351 ) ) ( not ( = ?auto_196350 ?auto_196352 ) ) ( not ( = ?auto_196351 ?auto_196352 ) ) ( ON ?auto_196350 ?auto_196351 ) ( ON ?auto_196349 ?auto_196350 ) ( ON ?auto_196348 ?auto_196349 ) ( ON ?auto_196347 ?auto_196348 ) ( ON ?auto_196346 ?auto_196347 ) ( CLEAR ?auto_196344 ) ( ON ?auto_196345 ?auto_196346 ) ( CLEAR ?auto_196345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_196341 ?auto_196342 ?auto_196343 ?auto_196344 ?auto_196345 )
      ( MAKE-11PILE ?auto_196341 ?auto_196342 ?auto_196343 ?auto_196344 ?auto_196345 ?auto_196346 ?auto_196347 ?auto_196348 ?auto_196349 ?auto_196350 ?auto_196351 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196364 - BLOCK
      ?auto_196365 - BLOCK
      ?auto_196366 - BLOCK
      ?auto_196367 - BLOCK
      ?auto_196368 - BLOCK
      ?auto_196369 - BLOCK
      ?auto_196370 - BLOCK
      ?auto_196371 - BLOCK
      ?auto_196372 - BLOCK
      ?auto_196373 - BLOCK
      ?auto_196374 - BLOCK
    )
    :vars
    (
      ?auto_196375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196374 ?auto_196375 ) ( ON-TABLE ?auto_196364 ) ( ON ?auto_196365 ?auto_196364 ) ( ON ?auto_196366 ?auto_196365 ) ( ON ?auto_196367 ?auto_196366 ) ( not ( = ?auto_196364 ?auto_196365 ) ) ( not ( = ?auto_196364 ?auto_196366 ) ) ( not ( = ?auto_196364 ?auto_196367 ) ) ( not ( = ?auto_196364 ?auto_196368 ) ) ( not ( = ?auto_196364 ?auto_196369 ) ) ( not ( = ?auto_196364 ?auto_196370 ) ) ( not ( = ?auto_196364 ?auto_196371 ) ) ( not ( = ?auto_196364 ?auto_196372 ) ) ( not ( = ?auto_196364 ?auto_196373 ) ) ( not ( = ?auto_196364 ?auto_196374 ) ) ( not ( = ?auto_196364 ?auto_196375 ) ) ( not ( = ?auto_196365 ?auto_196366 ) ) ( not ( = ?auto_196365 ?auto_196367 ) ) ( not ( = ?auto_196365 ?auto_196368 ) ) ( not ( = ?auto_196365 ?auto_196369 ) ) ( not ( = ?auto_196365 ?auto_196370 ) ) ( not ( = ?auto_196365 ?auto_196371 ) ) ( not ( = ?auto_196365 ?auto_196372 ) ) ( not ( = ?auto_196365 ?auto_196373 ) ) ( not ( = ?auto_196365 ?auto_196374 ) ) ( not ( = ?auto_196365 ?auto_196375 ) ) ( not ( = ?auto_196366 ?auto_196367 ) ) ( not ( = ?auto_196366 ?auto_196368 ) ) ( not ( = ?auto_196366 ?auto_196369 ) ) ( not ( = ?auto_196366 ?auto_196370 ) ) ( not ( = ?auto_196366 ?auto_196371 ) ) ( not ( = ?auto_196366 ?auto_196372 ) ) ( not ( = ?auto_196366 ?auto_196373 ) ) ( not ( = ?auto_196366 ?auto_196374 ) ) ( not ( = ?auto_196366 ?auto_196375 ) ) ( not ( = ?auto_196367 ?auto_196368 ) ) ( not ( = ?auto_196367 ?auto_196369 ) ) ( not ( = ?auto_196367 ?auto_196370 ) ) ( not ( = ?auto_196367 ?auto_196371 ) ) ( not ( = ?auto_196367 ?auto_196372 ) ) ( not ( = ?auto_196367 ?auto_196373 ) ) ( not ( = ?auto_196367 ?auto_196374 ) ) ( not ( = ?auto_196367 ?auto_196375 ) ) ( not ( = ?auto_196368 ?auto_196369 ) ) ( not ( = ?auto_196368 ?auto_196370 ) ) ( not ( = ?auto_196368 ?auto_196371 ) ) ( not ( = ?auto_196368 ?auto_196372 ) ) ( not ( = ?auto_196368 ?auto_196373 ) ) ( not ( = ?auto_196368 ?auto_196374 ) ) ( not ( = ?auto_196368 ?auto_196375 ) ) ( not ( = ?auto_196369 ?auto_196370 ) ) ( not ( = ?auto_196369 ?auto_196371 ) ) ( not ( = ?auto_196369 ?auto_196372 ) ) ( not ( = ?auto_196369 ?auto_196373 ) ) ( not ( = ?auto_196369 ?auto_196374 ) ) ( not ( = ?auto_196369 ?auto_196375 ) ) ( not ( = ?auto_196370 ?auto_196371 ) ) ( not ( = ?auto_196370 ?auto_196372 ) ) ( not ( = ?auto_196370 ?auto_196373 ) ) ( not ( = ?auto_196370 ?auto_196374 ) ) ( not ( = ?auto_196370 ?auto_196375 ) ) ( not ( = ?auto_196371 ?auto_196372 ) ) ( not ( = ?auto_196371 ?auto_196373 ) ) ( not ( = ?auto_196371 ?auto_196374 ) ) ( not ( = ?auto_196371 ?auto_196375 ) ) ( not ( = ?auto_196372 ?auto_196373 ) ) ( not ( = ?auto_196372 ?auto_196374 ) ) ( not ( = ?auto_196372 ?auto_196375 ) ) ( not ( = ?auto_196373 ?auto_196374 ) ) ( not ( = ?auto_196373 ?auto_196375 ) ) ( not ( = ?auto_196374 ?auto_196375 ) ) ( ON ?auto_196373 ?auto_196374 ) ( ON ?auto_196372 ?auto_196373 ) ( ON ?auto_196371 ?auto_196372 ) ( ON ?auto_196370 ?auto_196371 ) ( ON ?auto_196369 ?auto_196370 ) ( CLEAR ?auto_196367 ) ( ON ?auto_196368 ?auto_196369 ) ( CLEAR ?auto_196368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_196364 ?auto_196365 ?auto_196366 ?auto_196367 ?auto_196368 )
      ( MAKE-11PILE ?auto_196364 ?auto_196365 ?auto_196366 ?auto_196367 ?auto_196368 ?auto_196369 ?auto_196370 ?auto_196371 ?auto_196372 ?auto_196373 ?auto_196374 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196387 - BLOCK
      ?auto_196388 - BLOCK
      ?auto_196389 - BLOCK
      ?auto_196390 - BLOCK
      ?auto_196391 - BLOCK
      ?auto_196392 - BLOCK
      ?auto_196393 - BLOCK
      ?auto_196394 - BLOCK
      ?auto_196395 - BLOCK
      ?auto_196396 - BLOCK
      ?auto_196397 - BLOCK
    )
    :vars
    (
      ?auto_196398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196397 ?auto_196398 ) ( ON-TABLE ?auto_196387 ) ( ON ?auto_196388 ?auto_196387 ) ( ON ?auto_196389 ?auto_196388 ) ( not ( = ?auto_196387 ?auto_196388 ) ) ( not ( = ?auto_196387 ?auto_196389 ) ) ( not ( = ?auto_196387 ?auto_196390 ) ) ( not ( = ?auto_196387 ?auto_196391 ) ) ( not ( = ?auto_196387 ?auto_196392 ) ) ( not ( = ?auto_196387 ?auto_196393 ) ) ( not ( = ?auto_196387 ?auto_196394 ) ) ( not ( = ?auto_196387 ?auto_196395 ) ) ( not ( = ?auto_196387 ?auto_196396 ) ) ( not ( = ?auto_196387 ?auto_196397 ) ) ( not ( = ?auto_196387 ?auto_196398 ) ) ( not ( = ?auto_196388 ?auto_196389 ) ) ( not ( = ?auto_196388 ?auto_196390 ) ) ( not ( = ?auto_196388 ?auto_196391 ) ) ( not ( = ?auto_196388 ?auto_196392 ) ) ( not ( = ?auto_196388 ?auto_196393 ) ) ( not ( = ?auto_196388 ?auto_196394 ) ) ( not ( = ?auto_196388 ?auto_196395 ) ) ( not ( = ?auto_196388 ?auto_196396 ) ) ( not ( = ?auto_196388 ?auto_196397 ) ) ( not ( = ?auto_196388 ?auto_196398 ) ) ( not ( = ?auto_196389 ?auto_196390 ) ) ( not ( = ?auto_196389 ?auto_196391 ) ) ( not ( = ?auto_196389 ?auto_196392 ) ) ( not ( = ?auto_196389 ?auto_196393 ) ) ( not ( = ?auto_196389 ?auto_196394 ) ) ( not ( = ?auto_196389 ?auto_196395 ) ) ( not ( = ?auto_196389 ?auto_196396 ) ) ( not ( = ?auto_196389 ?auto_196397 ) ) ( not ( = ?auto_196389 ?auto_196398 ) ) ( not ( = ?auto_196390 ?auto_196391 ) ) ( not ( = ?auto_196390 ?auto_196392 ) ) ( not ( = ?auto_196390 ?auto_196393 ) ) ( not ( = ?auto_196390 ?auto_196394 ) ) ( not ( = ?auto_196390 ?auto_196395 ) ) ( not ( = ?auto_196390 ?auto_196396 ) ) ( not ( = ?auto_196390 ?auto_196397 ) ) ( not ( = ?auto_196390 ?auto_196398 ) ) ( not ( = ?auto_196391 ?auto_196392 ) ) ( not ( = ?auto_196391 ?auto_196393 ) ) ( not ( = ?auto_196391 ?auto_196394 ) ) ( not ( = ?auto_196391 ?auto_196395 ) ) ( not ( = ?auto_196391 ?auto_196396 ) ) ( not ( = ?auto_196391 ?auto_196397 ) ) ( not ( = ?auto_196391 ?auto_196398 ) ) ( not ( = ?auto_196392 ?auto_196393 ) ) ( not ( = ?auto_196392 ?auto_196394 ) ) ( not ( = ?auto_196392 ?auto_196395 ) ) ( not ( = ?auto_196392 ?auto_196396 ) ) ( not ( = ?auto_196392 ?auto_196397 ) ) ( not ( = ?auto_196392 ?auto_196398 ) ) ( not ( = ?auto_196393 ?auto_196394 ) ) ( not ( = ?auto_196393 ?auto_196395 ) ) ( not ( = ?auto_196393 ?auto_196396 ) ) ( not ( = ?auto_196393 ?auto_196397 ) ) ( not ( = ?auto_196393 ?auto_196398 ) ) ( not ( = ?auto_196394 ?auto_196395 ) ) ( not ( = ?auto_196394 ?auto_196396 ) ) ( not ( = ?auto_196394 ?auto_196397 ) ) ( not ( = ?auto_196394 ?auto_196398 ) ) ( not ( = ?auto_196395 ?auto_196396 ) ) ( not ( = ?auto_196395 ?auto_196397 ) ) ( not ( = ?auto_196395 ?auto_196398 ) ) ( not ( = ?auto_196396 ?auto_196397 ) ) ( not ( = ?auto_196396 ?auto_196398 ) ) ( not ( = ?auto_196397 ?auto_196398 ) ) ( ON ?auto_196396 ?auto_196397 ) ( ON ?auto_196395 ?auto_196396 ) ( ON ?auto_196394 ?auto_196395 ) ( ON ?auto_196393 ?auto_196394 ) ( ON ?auto_196392 ?auto_196393 ) ( ON ?auto_196391 ?auto_196392 ) ( CLEAR ?auto_196389 ) ( ON ?auto_196390 ?auto_196391 ) ( CLEAR ?auto_196390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_196387 ?auto_196388 ?auto_196389 ?auto_196390 )
      ( MAKE-11PILE ?auto_196387 ?auto_196388 ?auto_196389 ?auto_196390 ?auto_196391 ?auto_196392 ?auto_196393 ?auto_196394 ?auto_196395 ?auto_196396 ?auto_196397 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196410 - BLOCK
      ?auto_196411 - BLOCK
      ?auto_196412 - BLOCK
      ?auto_196413 - BLOCK
      ?auto_196414 - BLOCK
      ?auto_196415 - BLOCK
      ?auto_196416 - BLOCK
      ?auto_196417 - BLOCK
      ?auto_196418 - BLOCK
      ?auto_196419 - BLOCK
      ?auto_196420 - BLOCK
    )
    :vars
    (
      ?auto_196421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196420 ?auto_196421 ) ( ON-TABLE ?auto_196410 ) ( ON ?auto_196411 ?auto_196410 ) ( ON ?auto_196412 ?auto_196411 ) ( not ( = ?auto_196410 ?auto_196411 ) ) ( not ( = ?auto_196410 ?auto_196412 ) ) ( not ( = ?auto_196410 ?auto_196413 ) ) ( not ( = ?auto_196410 ?auto_196414 ) ) ( not ( = ?auto_196410 ?auto_196415 ) ) ( not ( = ?auto_196410 ?auto_196416 ) ) ( not ( = ?auto_196410 ?auto_196417 ) ) ( not ( = ?auto_196410 ?auto_196418 ) ) ( not ( = ?auto_196410 ?auto_196419 ) ) ( not ( = ?auto_196410 ?auto_196420 ) ) ( not ( = ?auto_196410 ?auto_196421 ) ) ( not ( = ?auto_196411 ?auto_196412 ) ) ( not ( = ?auto_196411 ?auto_196413 ) ) ( not ( = ?auto_196411 ?auto_196414 ) ) ( not ( = ?auto_196411 ?auto_196415 ) ) ( not ( = ?auto_196411 ?auto_196416 ) ) ( not ( = ?auto_196411 ?auto_196417 ) ) ( not ( = ?auto_196411 ?auto_196418 ) ) ( not ( = ?auto_196411 ?auto_196419 ) ) ( not ( = ?auto_196411 ?auto_196420 ) ) ( not ( = ?auto_196411 ?auto_196421 ) ) ( not ( = ?auto_196412 ?auto_196413 ) ) ( not ( = ?auto_196412 ?auto_196414 ) ) ( not ( = ?auto_196412 ?auto_196415 ) ) ( not ( = ?auto_196412 ?auto_196416 ) ) ( not ( = ?auto_196412 ?auto_196417 ) ) ( not ( = ?auto_196412 ?auto_196418 ) ) ( not ( = ?auto_196412 ?auto_196419 ) ) ( not ( = ?auto_196412 ?auto_196420 ) ) ( not ( = ?auto_196412 ?auto_196421 ) ) ( not ( = ?auto_196413 ?auto_196414 ) ) ( not ( = ?auto_196413 ?auto_196415 ) ) ( not ( = ?auto_196413 ?auto_196416 ) ) ( not ( = ?auto_196413 ?auto_196417 ) ) ( not ( = ?auto_196413 ?auto_196418 ) ) ( not ( = ?auto_196413 ?auto_196419 ) ) ( not ( = ?auto_196413 ?auto_196420 ) ) ( not ( = ?auto_196413 ?auto_196421 ) ) ( not ( = ?auto_196414 ?auto_196415 ) ) ( not ( = ?auto_196414 ?auto_196416 ) ) ( not ( = ?auto_196414 ?auto_196417 ) ) ( not ( = ?auto_196414 ?auto_196418 ) ) ( not ( = ?auto_196414 ?auto_196419 ) ) ( not ( = ?auto_196414 ?auto_196420 ) ) ( not ( = ?auto_196414 ?auto_196421 ) ) ( not ( = ?auto_196415 ?auto_196416 ) ) ( not ( = ?auto_196415 ?auto_196417 ) ) ( not ( = ?auto_196415 ?auto_196418 ) ) ( not ( = ?auto_196415 ?auto_196419 ) ) ( not ( = ?auto_196415 ?auto_196420 ) ) ( not ( = ?auto_196415 ?auto_196421 ) ) ( not ( = ?auto_196416 ?auto_196417 ) ) ( not ( = ?auto_196416 ?auto_196418 ) ) ( not ( = ?auto_196416 ?auto_196419 ) ) ( not ( = ?auto_196416 ?auto_196420 ) ) ( not ( = ?auto_196416 ?auto_196421 ) ) ( not ( = ?auto_196417 ?auto_196418 ) ) ( not ( = ?auto_196417 ?auto_196419 ) ) ( not ( = ?auto_196417 ?auto_196420 ) ) ( not ( = ?auto_196417 ?auto_196421 ) ) ( not ( = ?auto_196418 ?auto_196419 ) ) ( not ( = ?auto_196418 ?auto_196420 ) ) ( not ( = ?auto_196418 ?auto_196421 ) ) ( not ( = ?auto_196419 ?auto_196420 ) ) ( not ( = ?auto_196419 ?auto_196421 ) ) ( not ( = ?auto_196420 ?auto_196421 ) ) ( ON ?auto_196419 ?auto_196420 ) ( ON ?auto_196418 ?auto_196419 ) ( ON ?auto_196417 ?auto_196418 ) ( ON ?auto_196416 ?auto_196417 ) ( ON ?auto_196415 ?auto_196416 ) ( ON ?auto_196414 ?auto_196415 ) ( CLEAR ?auto_196412 ) ( ON ?auto_196413 ?auto_196414 ) ( CLEAR ?auto_196413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_196410 ?auto_196411 ?auto_196412 ?auto_196413 )
      ( MAKE-11PILE ?auto_196410 ?auto_196411 ?auto_196412 ?auto_196413 ?auto_196414 ?auto_196415 ?auto_196416 ?auto_196417 ?auto_196418 ?auto_196419 ?auto_196420 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196433 - BLOCK
      ?auto_196434 - BLOCK
      ?auto_196435 - BLOCK
      ?auto_196436 - BLOCK
      ?auto_196437 - BLOCK
      ?auto_196438 - BLOCK
      ?auto_196439 - BLOCK
      ?auto_196440 - BLOCK
      ?auto_196441 - BLOCK
      ?auto_196442 - BLOCK
      ?auto_196443 - BLOCK
    )
    :vars
    (
      ?auto_196444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196443 ?auto_196444 ) ( ON-TABLE ?auto_196433 ) ( ON ?auto_196434 ?auto_196433 ) ( not ( = ?auto_196433 ?auto_196434 ) ) ( not ( = ?auto_196433 ?auto_196435 ) ) ( not ( = ?auto_196433 ?auto_196436 ) ) ( not ( = ?auto_196433 ?auto_196437 ) ) ( not ( = ?auto_196433 ?auto_196438 ) ) ( not ( = ?auto_196433 ?auto_196439 ) ) ( not ( = ?auto_196433 ?auto_196440 ) ) ( not ( = ?auto_196433 ?auto_196441 ) ) ( not ( = ?auto_196433 ?auto_196442 ) ) ( not ( = ?auto_196433 ?auto_196443 ) ) ( not ( = ?auto_196433 ?auto_196444 ) ) ( not ( = ?auto_196434 ?auto_196435 ) ) ( not ( = ?auto_196434 ?auto_196436 ) ) ( not ( = ?auto_196434 ?auto_196437 ) ) ( not ( = ?auto_196434 ?auto_196438 ) ) ( not ( = ?auto_196434 ?auto_196439 ) ) ( not ( = ?auto_196434 ?auto_196440 ) ) ( not ( = ?auto_196434 ?auto_196441 ) ) ( not ( = ?auto_196434 ?auto_196442 ) ) ( not ( = ?auto_196434 ?auto_196443 ) ) ( not ( = ?auto_196434 ?auto_196444 ) ) ( not ( = ?auto_196435 ?auto_196436 ) ) ( not ( = ?auto_196435 ?auto_196437 ) ) ( not ( = ?auto_196435 ?auto_196438 ) ) ( not ( = ?auto_196435 ?auto_196439 ) ) ( not ( = ?auto_196435 ?auto_196440 ) ) ( not ( = ?auto_196435 ?auto_196441 ) ) ( not ( = ?auto_196435 ?auto_196442 ) ) ( not ( = ?auto_196435 ?auto_196443 ) ) ( not ( = ?auto_196435 ?auto_196444 ) ) ( not ( = ?auto_196436 ?auto_196437 ) ) ( not ( = ?auto_196436 ?auto_196438 ) ) ( not ( = ?auto_196436 ?auto_196439 ) ) ( not ( = ?auto_196436 ?auto_196440 ) ) ( not ( = ?auto_196436 ?auto_196441 ) ) ( not ( = ?auto_196436 ?auto_196442 ) ) ( not ( = ?auto_196436 ?auto_196443 ) ) ( not ( = ?auto_196436 ?auto_196444 ) ) ( not ( = ?auto_196437 ?auto_196438 ) ) ( not ( = ?auto_196437 ?auto_196439 ) ) ( not ( = ?auto_196437 ?auto_196440 ) ) ( not ( = ?auto_196437 ?auto_196441 ) ) ( not ( = ?auto_196437 ?auto_196442 ) ) ( not ( = ?auto_196437 ?auto_196443 ) ) ( not ( = ?auto_196437 ?auto_196444 ) ) ( not ( = ?auto_196438 ?auto_196439 ) ) ( not ( = ?auto_196438 ?auto_196440 ) ) ( not ( = ?auto_196438 ?auto_196441 ) ) ( not ( = ?auto_196438 ?auto_196442 ) ) ( not ( = ?auto_196438 ?auto_196443 ) ) ( not ( = ?auto_196438 ?auto_196444 ) ) ( not ( = ?auto_196439 ?auto_196440 ) ) ( not ( = ?auto_196439 ?auto_196441 ) ) ( not ( = ?auto_196439 ?auto_196442 ) ) ( not ( = ?auto_196439 ?auto_196443 ) ) ( not ( = ?auto_196439 ?auto_196444 ) ) ( not ( = ?auto_196440 ?auto_196441 ) ) ( not ( = ?auto_196440 ?auto_196442 ) ) ( not ( = ?auto_196440 ?auto_196443 ) ) ( not ( = ?auto_196440 ?auto_196444 ) ) ( not ( = ?auto_196441 ?auto_196442 ) ) ( not ( = ?auto_196441 ?auto_196443 ) ) ( not ( = ?auto_196441 ?auto_196444 ) ) ( not ( = ?auto_196442 ?auto_196443 ) ) ( not ( = ?auto_196442 ?auto_196444 ) ) ( not ( = ?auto_196443 ?auto_196444 ) ) ( ON ?auto_196442 ?auto_196443 ) ( ON ?auto_196441 ?auto_196442 ) ( ON ?auto_196440 ?auto_196441 ) ( ON ?auto_196439 ?auto_196440 ) ( ON ?auto_196438 ?auto_196439 ) ( ON ?auto_196437 ?auto_196438 ) ( ON ?auto_196436 ?auto_196437 ) ( CLEAR ?auto_196434 ) ( ON ?auto_196435 ?auto_196436 ) ( CLEAR ?auto_196435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_196433 ?auto_196434 ?auto_196435 )
      ( MAKE-11PILE ?auto_196433 ?auto_196434 ?auto_196435 ?auto_196436 ?auto_196437 ?auto_196438 ?auto_196439 ?auto_196440 ?auto_196441 ?auto_196442 ?auto_196443 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196456 - BLOCK
      ?auto_196457 - BLOCK
      ?auto_196458 - BLOCK
      ?auto_196459 - BLOCK
      ?auto_196460 - BLOCK
      ?auto_196461 - BLOCK
      ?auto_196462 - BLOCK
      ?auto_196463 - BLOCK
      ?auto_196464 - BLOCK
      ?auto_196465 - BLOCK
      ?auto_196466 - BLOCK
    )
    :vars
    (
      ?auto_196467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196466 ?auto_196467 ) ( ON-TABLE ?auto_196456 ) ( ON ?auto_196457 ?auto_196456 ) ( not ( = ?auto_196456 ?auto_196457 ) ) ( not ( = ?auto_196456 ?auto_196458 ) ) ( not ( = ?auto_196456 ?auto_196459 ) ) ( not ( = ?auto_196456 ?auto_196460 ) ) ( not ( = ?auto_196456 ?auto_196461 ) ) ( not ( = ?auto_196456 ?auto_196462 ) ) ( not ( = ?auto_196456 ?auto_196463 ) ) ( not ( = ?auto_196456 ?auto_196464 ) ) ( not ( = ?auto_196456 ?auto_196465 ) ) ( not ( = ?auto_196456 ?auto_196466 ) ) ( not ( = ?auto_196456 ?auto_196467 ) ) ( not ( = ?auto_196457 ?auto_196458 ) ) ( not ( = ?auto_196457 ?auto_196459 ) ) ( not ( = ?auto_196457 ?auto_196460 ) ) ( not ( = ?auto_196457 ?auto_196461 ) ) ( not ( = ?auto_196457 ?auto_196462 ) ) ( not ( = ?auto_196457 ?auto_196463 ) ) ( not ( = ?auto_196457 ?auto_196464 ) ) ( not ( = ?auto_196457 ?auto_196465 ) ) ( not ( = ?auto_196457 ?auto_196466 ) ) ( not ( = ?auto_196457 ?auto_196467 ) ) ( not ( = ?auto_196458 ?auto_196459 ) ) ( not ( = ?auto_196458 ?auto_196460 ) ) ( not ( = ?auto_196458 ?auto_196461 ) ) ( not ( = ?auto_196458 ?auto_196462 ) ) ( not ( = ?auto_196458 ?auto_196463 ) ) ( not ( = ?auto_196458 ?auto_196464 ) ) ( not ( = ?auto_196458 ?auto_196465 ) ) ( not ( = ?auto_196458 ?auto_196466 ) ) ( not ( = ?auto_196458 ?auto_196467 ) ) ( not ( = ?auto_196459 ?auto_196460 ) ) ( not ( = ?auto_196459 ?auto_196461 ) ) ( not ( = ?auto_196459 ?auto_196462 ) ) ( not ( = ?auto_196459 ?auto_196463 ) ) ( not ( = ?auto_196459 ?auto_196464 ) ) ( not ( = ?auto_196459 ?auto_196465 ) ) ( not ( = ?auto_196459 ?auto_196466 ) ) ( not ( = ?auto_196459 ?auto_196467 ) ) ( not ( = ?auto_196460 ?auto_196461 ) ) ( not ( = ?auto_196460 ?auto_196462 ) ) ( not ( = ?auto_196460 ?auto_196463 ) ) ( not ( = ?auto_196460 ?auto_196464 ) ) ( not ( = ?auto_196460 ?auto_196465 ) ) ( not ( = ?auto_196460 ?auto_196466 ) ) ( not ( = ?auto_196460 ?auto_196467 ) ) ( not ( = ?auto_196461 ?auto_196462 ) ) ( not ( = ?auto_196461 ?auto_196463 ) ) ( not ( = ?auto_196461 ?auto_196464 ) ) ( not ( = ?auto_196461 ?auto_196465 ) ) ( not ( = ?auto_196461 ?auto_196466 ) ) ( not ( = ?auto_196461 ?auto_196467 ) ) ( not ( = ?auto_196462 ?auto_196463 ) ) ( not ( = ?auto_196462 ?auto_196464 ) ) ( not ( = ?auto_196462 ?auto_196465 ) ) ( not ( = ?auto_196462 ?auto_196466 ) ) ( not ( = ?auto_196462 ?auto_196467 ) ) ( not ( = ?auto_196463 ?auto_196464 ) ) ( not ( = ?auto_196463 ?auto_196465 ) ) ( not ( = ?auto_196463 ?auto_196466 ) ) ( not ( = ?auto_196463 ?auto_196467 ) ) ( not ( = ?auto_196464 ?auto_196465 ) ) ( not ( = ?auto_196464 ?auto_196466 ) ) ( not ( = ?auto_196464 ?auto_196467 ) ) ( not ( = ?auto_196465 ?auto_196466 ) ) ( not ( = ?auto_196465 ?auto_196467 ) ) ( not ( = ?auto_196466 ?auto_196467 ) ) ( ON ?auto_196465 ?auto_196466 ) ( ON ?auto_196464 ?auto_196465 ) ( ON ?auto_196463 ?auto_196464 ) ( ON ?auto_196462 ?auto_196463 ) ( ON ?auto_196461 ?auto_196462 ) ( ON ?auto_196460 ?auto_196461 ) ( ON ?auto_196459 ?auto_196460 ) ( CLEAR ?auto_196457 ) ( ON ?auto_196458 ?auto_196459 ) ( CLEAR ?auto_196458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_196456 ?auto_196457 ?auto_196458 )
      ( MAKE-11PILE ?auto_196456 ?auto_196457 ?auto_196458 ?auto_196459 ?auto_196460 ?auto_196461 ?auto_196462 ?auto_196463 ?auto_196464 ?auto_196465 ?auto_196466 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196479 - BLOCK
      ?auto_196480 - BLOCK
      ?auto_196481 - BLOCK
      ?auto_196482 - BLOCK
      ?auto_196483 - BLOCK
      ?auto_196484 - BLOCK
      ?auto_196485 - BLOCK
      ?auto_196486 - BLOCK
      ?auto_196487 - BLOCK
      ?auto_196488 - BLOCK
      ?auto_196489 - BLOCK
    )
    :vars
    (
      ?auto_196490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196489 ?auto_196490 ) ( ON-TABLE ?auto_196479 ) ( not ( = ?auto_196479 ?auto_196480 ) ) ( not ( = ?auto_196479 ?auto_196481 ) ) ( not ( = ?auto_196479 ?auto_196482 ) ) ( not ( = ?auto_196479 ?auto_196483 ) ) ( not ( = ?auto_196479 ?auto_196484 ) ) ( not ( = ?auto_196479 ?auto_196485 ) ) ( not ( = ?auto_196479 ?auto_196486 ) ) ( not ( = ?auto_196479 ?auto_196487 ) ) ( not ( = ?auto_196479 ?auto_196488 ) ) ( not ( = ?auto_196479 ?auto_196489 ) ) ( not ( = ?auto_196479 ?auto_196490 ) ) ( not ( = ?auto_196480 ?auto_196481 ) ) ( not ( = ?auto_196480 ?auto_196482 ) ) ( not ( = ?auto_196480 ?auto_196483 ) ) ( not ( = ?auto_196480 ?auto_196484 ) ) ( not ( = ?auto_196480 ?auto_196485 ) ) ( not ( = ?auto_196480 ?auto_196486 ) ) ( not ( = ?auto_196480 ?auto_196487 ) ) ( not ( = ?auto_196480 ?auto_196488 ) ) ( not ( = ?auto_196480 ?auto_196489 ) ) ( not ( = ?auto_196480 ?auto_196490 ) ) ( not ( = ?auto_196481 ?auto_196482 ) ) ( not ( = ?auto_196481 ?auto_196483 ) ) ( not ( = ?auto_196481 ?auto_196484 ) ) ( not ( = ?auto_196481 ?auto_196485 ) ) ( not ( = ?auto_196481 ?auto_196486 ) ) ( not ( = ?auto_196481 ?auto_196487 ) ) ( not ( = ?auto_196481 ?auto_196488 ) ) ( not ( = ?auto_196481 ?auto_196489 ) ) ( not ( = ?auto_196481 ?auto_196490 ) ) ( not ( = ?auto_196482 ?auto_196483 ) ) ( not ( = ?auto_196482 ?auto_196484 ) ) ( not ( = ?auto_196482 ?auto_196485 ) ) ( not ( = ?auto_196482 ?auto_196486 ) ) ( not ( = ?auto_196482 ?auto_196487 ) ) ( not ( = ?auto_196482 ?auto_196488 ) ) ( not ( = ?auto_196482 ?auto_196489 ) ) ( not ( = ?auto_196482 ?auto_196490 ) ) ( not ( = ?auto_196483 ?auto_196484 ) ) ( not ( = ?auto_196483 ?auto_196485 ) ) ( not ( = ?auto_196483 ?auto_196486 ) ) ( not ( = ?auto_196483 ?auto_196487 ) ) ( not ( = ?auto_196483 ?auto_196488 ) ) ( not ( = ?auto_196483 ?auto_196489 ) ) ( not ( = ?auto_196483 ?auto_196490 ) ) ( not ( = ?auto_196484 ?auto_196485 ) ) ( not ( = ?auto_196484 ?auto_196486 ) ) ( not ( = ?auto_196484 ?auto_196487 ) ) ( not ( = ?auto_196484 ?auto_196488 ) ) ( not ( = ?auto_196484 ?auto_196489 ) ) ( not ( = ?auto_196484 ?auto_196490 ) ) ( not ( = ?auto_196485 ?auto_196486 ) ) ( not ( = ?auto_196485 ?auto_196487 ) ) ( not ( = ?auto_196485 ?auto_196488 ) ) ( not ( = ?auto_196485 ?auto_196489 ) ) ( not ( = ?auto_196485 ?auto_196490 ) ) ( not ( = ?auto_196486 ?auto_196487 ) ) ( not ( = ?auto_196486 ?auto_196488 ) ) ( not ( = ?auto_196486 ?auto_196489 ) ) ( not ( = ?auto_196486 ?auto_196490 ) ) ( not ( = ?auto_196487 ?auto_196488 ) ) ( not ( = ?auto_196487 ?auto_196489 ) ) ( not ( = ?auto_196487 ?auto_196490 ) ) ( not ( = ?auto_196488 ?auto_196489 ) ) ( not ( = ?auto_196488 ?auto_196490 ) ) ( not ( = ?auto_196489 ?auto_196490 ) ) ( ON ?auto_196488 ?auto_196489 ) ( ON ?auto_196487 ?auto_196488 ) ( ON ?auto_196486 ?auto_196487 ) ( ON ?auto_196485 ?auto_196486 ) ( ON ?auto_196484 ?auto_196485 ) ( ON ?auto_196483 ?auto_196484 ) ( ON ?auto_196482 ?auto_196483 ) ( ON ?auto_196481 ?auto_196482 ) ( CLEAR ?auto_196479 ) ( ON ?auto_196480 ?auto_196481 ) ( CLEAR ?auto_196480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_196479 ?auto_196480 )
      ( MAKE-11PILE ?auto_196479 ?auto_196480 ?auto_196481 ?auto_196482 ?auto_196483 ?auto_196484 ?auto_196485 ?auto_196486 ?auto_196487 ?auto_196488 ?auto_196489 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196502 - BLOCK
      ?auto_196503 - BLOCK
      ?auto_196504 - BLOCK
      ?auto_196505 - BLOCK
      ?auto_196506 - BLOCK
      ?auto_196507 - BLOCK
      ?auto_196508 - BLOCK
      ?auto_196509 - BLOCK
      ?auto_196510 - BLOCK
      ?auto_196511 - BLOCK
      ?auto_196512 - BLOCK
    )
    :vars
    (
      ?auto_196513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196512 ?auto_196513 ) ( ON-TABLE ?auto_196502 ) ( not ( = ?auto_196502 ?auto_196503 ) ) ( not ( = ?auto_196502 ?auto_196504 ) ) ( not ( = ?auto_196502 ?auto_196505 ) ) ( not ( = ?auto_196502 ?auto_196506 ) ) ( not ( = ?auto_196502 ?auto_196507 ) ) ( not ( = ?auto_196502 ?auto_196508 ) ) ( not ( = ?auto_196502 ?auto_196509 ) ) ( not ( = ?auto_196502 ?auto_196510 ) ) ( not ( = ?auto_196502 ?auto_196511 ) ) ( not ( = ?auto_196502 ?auto_196512 ) ) ( not ( = ?auto_196502 ?auto_196513 ) ) ( not ( = ?auto_196503 ?auto_196504 ) ) ( not ( = ?auto_196503 ?auto_196505 ) ) ( not ( = ?auto_196503 ?auto_196506 ) ) ( not ( = ?auto_196503 ?auto_196507 ) ) ( not ( = ?auto_196503 ?auto_196508 ) ) ( not ( = ?auto_196503 ?auto_196509 ) ) ( not ( = ?auto_196503 ?auto_196510 ) ) ( not ( = ?auto_196503 ?auto_196511 ) ) ( not ( = ?auto_196503 ?auto_196512 ) ) ( not ( = ?auto_196503 ?auto_196513 ) ) ( not ( = ?auto_196504 ?auto_196505 ) ) ( not ( = ?auto_196504 ?auto_196506 ) ) ( not ( = ?auto_196504 ?auto_196507 ) ) ( not ( = ?auto_196504 ?auto_196508 ) ) ( not ( = ?auto_196504 ?auto_196509 ) ) ( not ( = ?auto_196504 ?auto_196510 ) ) ( not ( = ?auto_196504 ?auto_196511 ) ) ( not ( = ?auto_196504 ?auto_196512 ) ) ( not ( = ?auto_196504 ?auto_196513 ) ) ( not ( = ?auto_196505 ?auto_196506 ) ) ( not ( = ?auto_196505 ?auto_196507 ) ) ( not ( = ?auto_196505 ?auto_196508 ) ) ( not ( = ?auto_196505 ?auto_196509 ) ) ( not ( = ?auto_196505 ?auto_196510 ) ) ( not ( = ?auto_196505 ?auto_196511 ) ) ( not ( = ?auto_196505 ?auto_196512 ) ) ( not ( = ?auto_196505 ?auto_196513 ) ) ( not ( = ?auto_196506 ?auto_196507 ) ) ( not ( = ?auto_196506 ?auto_196508 ) ) ( not ( = ?auto_196506 ?auto_196509 ) ) ( not ( = ?auto_196506 ?auto_196510 ) ) ( not ( = ?auto_196506 ?auto_196511 ) ) ( not ( = ?auto_196506 ?auto_196512 ) ) ( not ( = ?auto_196506 ?auto_196513 ) ) ( not ( = ?auto_196507 ?auto_196508 ) ) ( not ( = ?auto_196507 ?auto_196509 ) ) ( not ( = ?auto_196507 ?auto_196510 ) ) ( not ( = ?auto_196507 ?auto_196511 ) ) ( not ( = ?auto_196507 ?auto_196512 ) ) ( not ( = ?auto_196507 ?auto_196513 ) ) ( not ( = ?auto_196508 ?auto_196509 ) ) ( not ( = ?auto_196508 ?auto_196510 ) ) ( not ( = ?auto_196508 ?auto_196511 ) ) ( not ( = ?auto_196508 ?auto_196512 ) ) ( not ( = ?auto_196508 ?auto_196513 ) ) ( not ( = ?auto_196509 ?auto_196510 ) ) ( not ( = ?auto_196509 ?auto_196511 ) ) ( not ( = ?auto_196509 ?auto_196512 ) ) ( not ( = ?auto_196509 ?auto_196513 ) ) ( not ( = ?auto_196510 ?auto_196511 ) ) ( not ( = ?auto_196510 ?auto_196512 ) ) ( not ( = ?auto_196510 ?auto_196513 ) ) ( not ( = ?auto_196511 ?auto_196512 ) ) ( not ( = ?auto_196511 ?auto_196513 ) ) ( not ( = ?auto_196512 ?auto_196513 ) ) ( ON ?auto_196511 ?auto_196512 ) ( ON ?auto_196510 ?auto_196511 ) ( ON ?auto_196509 ?auto_196510 ) ( ON ?auto_196508 ?auto_196509 ) ( ON ?auto_196507 ?auto_196508 ) ( ON ?auto_196506 ?auto_196507 ) ( ON ?auto_196505 ?auto_196506 ) ( ON ?auto_196504 ?auto_196505 ) ( CLEAR ?auto_196502 ) ( ON ?auto_196503 ?auto_196504 ) ( CLEAR ?auto_196503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_196502 ?auto_196503 )
      ( MAKE-11PILE ?auto_196502 ?auto_196503 ?auto_196504 ?auto_196505 ?auto_196506 ?auto_196507 ?auto_196508 ?auto_196509 ?auto_196510 ?auto_196511 ?auto_196512 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196525 - BLOCK
      ?auto_196526 - BLOCK
      ?auto_196527 - BLOCK
      ?auto_196528 - BLOCK
      ?auto_196529 - BLOCK
      ?auto_196530 - BLOCK
      ?auto_196531 - BLOCK
      ?auto_196532 - BLOCK
      ?auto_196533 - BLOCK
      ?auto_196534 - BLOCK
      ?auto_196535 - BLOCK
    )
    :vars
    (
      ?auto_196536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196535 ?auto_196536 ) ( not ( = ?auto_196525 ?auto_196526 ) ) ( not ( = ?auto_196525 ?auto_196527 ) ) ( not ( = ?auto_196525 ?auto_196528 ) ) ( not ( = ?auto_196525 ?auto_196529 ) ) ( not ( = ?auto_196525 ?auto_196530 ) ) ( not ( = ?auto_196525 ?auto_196531 ) ) ( not ( = ?auto_196525 ?auto_196532 ) ) ( not ( = ?auto_196525 ?auto_196533 ) ) ( not ( = ?auto_196525 ?auto_196534 ) ) ( not ( = ?auto_196525 ?auto_196535 ) ) ( not ( = ?auto_196525 ?auto_196536 ) ) ( not ( = ?auto_196526 ?auto_196527 ) ) ( not ( = ?auto_196526 ?auto_196528 ) ) ( not ( = ?auto_196526 ?auto_196529 ) ) ( not ( = ?auto_196526 ?auto_196530 ) ) ( not ( = ?auto_196526 ?auto_196531 ) ) ( not ( = ?auto_196526 ?auto_196532 ) ) ( not ( = ?auto_196526 ?auto_196533 ) ) ( not ( = ?auto_196526 ?auto_196534 ) ) ( not ( = ?auto_196526 ?auto_196535 ) ) ( not ( = ?auto_196526 ?auto_196536 ) ) ( not ( = ?auto_196527 ?auto_196528 ) ) ( not ( = ?auto_196527 ?auto_196529 ) ) ( not ( = ?auto_196527 ?auto_196530 ) ) ( not ( = ?auto_196527 ?auto_196531 ) ) ( not ( = ?auto_196527 ?auto_196532 ) ) ( not ( = ?auto_196527 ?auto_196533 ) ) ( not ( = ?auto_196527 ?auto_196534 ) ) ( not ( = ?auto_196527 ?auto_196535 ) ) ( not ( = ?auto_196527 ?auto_196536 ) ) ( not ( = ?auto_196528 ?auto_196529 ) ) ( not ( = ?auto_196528 ?auto_196530 ) ) ( not ( = ?auto_196528 ?auto_196531 ) ) ( not ( = ?auto_196528 ?auto_196532 ) ) ( not ( = ?auto_196528 ?auto_196533 ) ) ( not ( = ?auto_196528 ?auto_196534 ) ) ( not ( = ?auto_196528 ?auto_196535 ) ) ( not ( = ?auto_196528 ?auto_196536 ) ) ( not ( = ?auto_196529 ?auto_196530 ) ) ( not ( = ?auto_196529 ?auto_196531 ) ) ( not ( = ?auto_196529 ?auto_196532 ) ) ( not ( = ?auto_196529 ?auto_196533 ) ) ( not ( = ?auto_196529 ?auto_196534 ) ) ( not ( = ?auto_196529 ?auto_196535 ) ) ( not ( = ?auto_196529 ?auto_196536 ) ) ( not ( = ?auto_196530 ?auto_196531 ) ) ( not ( = ?auto_196530 ?auto_196532 ) ) ( not ( = ?auto_196530 ?auto_196533 ) ) ( not ( = ?auto_196530 ?auto_196534 ) ) ( not ( = ?auto_196530 ?auto_196535 ) ) ( not ( = ?auto_196530 ?auto_196536 ) ) ( not ( = ?auto_196531 ?auto_196532 ) ) ( not ( = ?auto_196531 ?auto_196533 ) ) ( not ( = ?auto_196531 ?auto_196534 ) ) ( not ( = ?auto_196531 ?auto_196535 ) ) ( not ( = ?auto_196531 ?auto_196536 ) ) ( not ( = ?auto_196532 ?auto_196533 ) ) ( not ( = ?auto_196532 ?auto_196534 ) ) ( not ( = ?auto_196532 ?auto_196535 ) ) ( not ( = ?auto_196532 ?auto_196536 ) ) ( not ( = ?auto_196533 ?auto_196534 ) ) ( not ( = ?auto_196533 ?auto_196535 ) ) ( not ( = ?auto_196533 ?auto_196536 ) ) ( not ( = ?auto_196534 ?auto_196535 ) ) ( not ( = ?auto_196534 ?auto_196536 ) ) ( not ( = ?auto_196535 ?auto_196536 ) ) ( ON ?auto_196534 ?auto_196535 ) ( ON ?auto_196533 ?auto_196534 ) ( ON ?auto_196532 ?auto_196533 ) ( ON ?auto_196531 ?auto_196532 ) ( ON ?auto_196530 ?auto_196531 ) ( ON ?auto_196529 ?auto_196530 ) ( ON ?auto_196528 ?auto_196529 ) ( ON ?auto_196527 ?auto_196528 ) ( ON ?auto_196526 ?auto_196527 ) ( ON ?auto_196525 ?auto_196526 ) ( CLEAR ?auto_196525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196525 )
      ( MAKE-11PILE ?auto_196525 ?auto_196526 ?auto_196527 ?auto_196528 ?auto_196529 ?auto_196530 ?auto_196531 ?auto_196532 ?auto_196533 ?auto_196534 ?auto_196535 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_196548 - BLOCK
      ?auto_196549 - BLOCK
      ?auto_196550 - BLOCK
      ?auto_196551 - BLOCK
      ?auto_196552 - BLOCK
      ?auto_196553 - BLOCK
      ?auto_196554 - BLOCK
      ?auto_196555 - BLOCK
      ?auto_196556 - BLOCK
      ?auto_196557 - BLOCK
      ?auto_196558 - BLOCK
    )
    :vars
    (
      ?auto_196559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196558 ?auto_196559 ) ( not ( = ?auto_196548 ?auto_196549 ) ) ( not ( = ?auto_196548 ?auto_196550 ) ) ( not ( = ?auto_196548 ?auto_196551 ) ) ( not ( = ?auto_196548 ?auto_196552 ) ) ( not ( = ?auto_196548 ?auto_196553 ) ) ( not ( = ?auto_196548 ?auto_196554 ) ) ( not ( = ?auto_196548 ?auto_196555 ) ) ( not ( = ?auto_196548 ?auto_196556 ) ) ( not ( = ?auto_196548 ?auto_196557 ) ) ( not ( = ?auto_196548 ?auto_196558 ) ) ( not ( = ?auto_196548 ?auto_196559 ) ) ( not ( = ?auto_196549 ?auto_196550 ) ) ( not ( = ?auto_196549 ?auto_196551 ) ) ( not ( = ?auto_196549 ?auto_196552 ) ) ( not ( = ?auto_196549 ?auto_196553 ) ) ( not ( = ?auto_196549 ?auto_196554 ) ) ( not ( = ?auto_196549 ?auto_196555 ) ) ( not ( = ?auto_196549 ?auto_196556 ) ) ( not ( = ?auto_196549 ?auto_196557 ) ) ( not ( = ?auto_196549 ?auto_196558 ) ) ( not ( = ?auto_196549 ?auto_196559 ) ) ( not ( = ?auto_196550 ?auto_196551 ) ) ( not ( = ?auto_196550 ?auto_196552 ) ) ( not ( = ?auto_196550 ?auto_196553 ) ) ( not ( = ?auto_196550 ?auto_196554 ) ) ( not ( = ?auto_196550 ?auto_196555 ) ) ( not ( = ?auto_196550 ?auto_196556 ) ) ( not ( = ?auto_196550 ?auto_196557 ) ) ( not ( = ?auto_196550 ?auto_196558 ) ) ( not ( = ?auto_196550 ?auto_196559 ) ) ( not ( = ?auto_196551 ?auto_196552 ) ) ( not ( = ?auto_196551 ?auto_196553 ) ) ( not ( = ?auto_196551 ?auto_196554 ) ) ( not ( = ?auto_196551 ?auto_196555 ) ) ( not ( = ?auto_196551 ?auto_196556 ) ) ( not ( = ?auto_196551 ?auto_196557 ) ) ( not ( = ?auto_196551 ?auto_196558 ) ) ( not ( = ?auto_196551 ?auto_196559 ) ) ( not ( = ?auto_196552 ?auto_196553 ) ) ( not ( = ?auto_196552 ?auto_196554 ) ) ( not ( = ?auto_196552 ?auto_196555 ) ) ( not ( = ?auto_196552 ?auto_196556 ) ) ( not ( = ?auto_196552 ?auto_196557 ) ) ( not ( = ?auto_196552 ?auto_196558 ) ) ( not ( = ?auto_196552 ?auto_196559 ) ) ( not ( = ?auto_196553 ?auto_196554 ) ) ( not ( = ?auto_196553 ?auto_196555 ) ) ( not ( = ?auto_196553 ?auto_196556 ) ) ( not ( = ?auto_196553 ?auto_196557 ) ) ( not ( = ?auto_196553 ?auto_196558 ) ) ( not ( = ?auto_196553 ?auto_196559 ) ) ( not ( = ?auto_196554 ?auto_196555 ) ) ( not ( = ?auto_196554 ?auto_196556 ) ) ( not ( = ?auto_196554 ?auto_196557 ) ) ( not ( = ?auto_196554 ?auto_196558 ) ) ( not ( = ?auto_196554 ?auto_196559 ) ) ( not ( = ?auto_196555 ?auto_196556 ) ) ( not ( = ?auto_196555 ?auto_196557 ) ) ( not ( = ?auto_196555 ?auto_196558 ) ) ( not ( = ?auto_196555 ?auto_196559 ) ) ( not ( = ?auto_196556 ?auto_196557 ) ) ( not ( = ?auto_196556 ?auto_196558 ) ) ( not ( = ?auto_196556 ?auto_196559 ) ) ( not ( = ?auto_196557 ?auto_196558 ) ) ( not ( = ?auto_196557 ?auto_196559 ) ) ( not ( = ?auto_196558 ?auto_196559 ) ) ( ON ?auto_196557 ?auto_196558 ) ( ON ?auto_196556 ?auto_196557 ) ( ON ?auto_196555 ?auto_196556 ) ( ON ?auto_196554 ?auto_196555 ) ( ON ?auto_196553 ?auto_196554 ) ( ON ?auto_196552 ?auto_196553 ) ( ON ?auto_196551 ?auto_196552 ) ( ON ?auto_196550 ?auto_196551 ) ( ON ?auto_196549 ?auto_196550 ) ( ON ?auto_196548 ?auto_196549 ) ( CLEAR ?auto_196548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196548 )
      ( MAKE-11PILE ?auto_196548 ?auto_196549 ?auto_196550 ?auto_196551 ?auto_196552 ?auto_196553 ?auto_196554 ?auto_196555 ?auto_196556 ?auto_196557 ?auto_196558 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196572 - BLOCK
      ?auto_196573 - BLOCK
      ?auto_196574 - BLOCK
      ?auto_196575 - BLOCK
      ?auto_196576 - BLOCK
      ?auto_196577 - BLOCK
      ?auto_196578 - BLOCK
      ?auto_196579 - BLOCK
      ?auto_196580 - BLOCK
      ?auto_196581 - BLOCK
      ?auto_196582 - BLOCK
      ?auto_196583 - BLOCK
    )
    :vars
    (
      ?auto_196584 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_196582 ) ( ON ?auto_196583 ?auto_196584 ) ( CLEAR ?auto_196583 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196572 ) ( ON ?auto_196573 ?auto_196572 ) ( ON ?auto_196574 ?auto_196573 ) ( ON ?auto_196575 ?auto_196574 ) ( ON ?auto_196576 ?auto_196575 ) ( ON ?auto_196577 ?auto_196576 ) ( ON ?auto_196578 ?auto_196577 ) ( ON ?auto_196579 ?auto_196578 ) ( ON ?auto_196580 ?auto_196579 ) ( ON ?auto_196581 ?auto_196580 ) ( ON ?auto_196582 ?auto_196581 ) ( not ( = ?auto_196572 ?auto_196573 ) ) ( not ( = ?auto_196572 ?auto_196574 ) ) ( not ( = ?auto_196572 ?auto_196575 ) ) ( not ( = ?auto_196572 ?auto_196576 ) ) ( not ( = ?auto_196572 ?auto_196577 ) ) ( not ( = ?auto_196572 ?auto_196578 ) ) ( not ( = ?auto_196572 ?auto_196579 ) ) ( not ( = ?auto_196572 ?auto_196580 ) ) ( not ( = ?auto_196572 ?auto_196581 ) ) ( not ( = ?auto_196572 ?auto_196582 ) ) ( not ( = ?auto_196572 ?auto_196583 ) ) ( not ( = ?auto_196572 ?auto_196584 ) ) ( not ( = ?auto_196573 ?auto_196574 ) ) ( not ( = ?auto_196573 ?auto_196575 ) ) ( not ( = ?auto_196573 ?auto_196576 ) ) ( not ( = ?auto_196573 ?auto_196577 ) ) ( not ( = ?auto_196573 ?auto_196578 ) ) ( not ( = ?auto_196573 ?auto_196579 ) ) ( not ( = ?auto_196573 ?auto_196580 ) ) ( not ( = ?auto_196573 ?auto_196581 ) ) ( not ( = ?auto_196573 ?auto_196582 ) ) ( not ( = ?auto_196573 ?auto_196583 ) ) ( not ( = ?auto_196573 ?auto_196584 ) ) ( not ( = ?auto_196574 ?auto_196575 ) ) ( not ( = ?auto_196574 ?auto_196576 ) ) ( not ( = ?auto_196574 ?auto_196577 ) ) ( not ( = ?auto_196574 ?auto_196578 ) ) ( not ( = ?auto_196574 ?auto_196579 ) ) ( not ( = ?auto_196574 ?auto_196580 ) ) ( not ( = ?auto_196574 ?auto_196581 ) ) ( not ( = ?auto_196574 ?auto_196582 ) ) ( not ( = ?auto_196574 ?auto_196583 ) ) ( not ( = ?auto_196574 ?auto_196584 ) ) ( not ( = ?auto_196575 ?auto_196576 ) ) ( not ( = ?auto_196575 ?auto_196577 ) ) ( not ( = ?auto_196575 ?auto_196578 ) ) ( not ( = ?auto_196575 ?auto_196579 ) ) ( not ( = ?auto_196575 ?auto_196580 ) ) ( not ( = ?auto_196575 ?auto_196581 ) ) ( not ( = ?auto_196575 ?auto_196582 ) ) ( not ( = ?auto_196575 ?auto_196583 ) ) ( not ( = ?auto_196575 ?auto_196584 ) ) ( not ( = ?auto_196576 ?auto_196577 ) ) ( not ( = ?auto_196576 ?auto_196578 ) ) ( not ( = ?auto_196576 ?auto_196579 ) ) ( not ( = ?auto_196576 ?auto_196580 ) ) ( not ( = ?auto_196576 ?auto_196581 ) ) ( not ( = ?auto_196576 ?auto_196582 ) ) ( not ( = ?auto_196576 ?auto_196583 ) ) ( not ( = ?auto_196576 ?auto_196584 ) ) ( not ( = ?auto_196577 ?auto_196578 ) ) ( not ( = ?auto_196577 ?auto_196579 ) ) ( not ( = ?auto_196577 ?auto_196580 ) ) ( not ( = ?auto_196577 ?auto_196581 ) ) ( not ( = ?auto_196577 ?auto_196582 ) ) ( not ( = ?auto_196577 ?auto_196583 ) ) ( not ( = ?auto_196577 ?auto_196584 ) ) ( not ( = ?auto_196578 ?auto_196579 ) ) ( not ( = ?auto_196578 ?auto_196580 ) ) ( not ( = ?auto_196578 ?auto_196581 ) ) ( not ( = ?auto_196578 ?auto_196582 ) ) ( not ( = ?auto_196578 ?auto_196583 ) ) ( not ( = ?auto_196578 ?auto_196584 ) ) ( not ( = ?auto_196579 ?auto_196580 ) ) ( not ( = ?auto_196579 ?auto_196581 ) ) ( not ( = ?auto_196579 ?auto_196582 ) ) ( not ( = ?auto_196579 ?auto_196583 ) ) ( not ( = ?auto_196579 ?auto_196584 ) ) ( not ( = ?auto_196580 ?auto_196581 ) ) ( not ( = ?auto_196580 ?auto_196582 ) ) ( not ( = ?auto_196580 ?auto_196583 ) ) ( not ( = ?auto_196580 ?auto_196584 ) ) ( not ( = ?auto_196581 ?auto_196582 ) ) ( not ( = ?auto_196581 ?auto_196583 ) ) ( not ( = ?auto_196581 ?auto_196584 ) ) ( not ( = ?auto_196582 ?auto_196583 ) ) ( not ( = ?auto_196582 ?auto_196584 ) ) ( not ( = ?auto_196583 ?auto_196584 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196583 ?auto_196584 )
      ( !STACK ?auto_196583 ?auto_196582 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196597 - BLOCK
      ?auto_196598 - BLOCK
      ?auto_196599 - BLOCK
      ?auto_196600 - BLOCK
      ?auto_196601 - BLOCK
      ?auto_196602 - BLOCK
      ?auto_196603 - BLOCK
      ?auto_196604 - BLOCK
      ?auto_196605 - BLOCK
      ?auto_196606 - BLOCK
      ?auto_196607 - BLOCK
      ?auto_196608 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_196607 ) ( ON-TABLE ?auto_196608 ) ( CLEAR ?auto_196608 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196597 ) ( ON ?auto_196598 ?auto_196597 ) ( ON ?auto_196599 ?auto_196598 ) ( ON ?auto_196600 ?auto_196599 ) ( ON ?auto_196601 ?auto_196600 ) ( ON ?auto_196602 ?auto_196601 ) ( ON ?auto_196603 ?auto_196602 ) ( ON ?auto_196604 ?auto_196603 ) ( ON ?auto_196605 ?auto_196604 ) ( ON ?auto_196606 ?auto_196605 ) ( ON ?auto_196607 ?auto_196606 ) ( not ( = ?auto_196597 ?auto_196598 ) ) ( not ( = ?auto_196597 ?auto_196599 ) ) ( not ( = ?auto_196597 ?auto_196600 ) ) ( not ( = ?auto_196597 ?auto_196601 ) ) ( not ( = ?auto_196597 ?auto_196602 ) ) ( not ( = ?auto_196597 ?auto_196603 ) ) ( not ( = ?auto_196597 ?auto_196604 ) ) ( not ( = ?auto_196597 ?auto_196605 ) ) ( not ( = ?auto_196597 ?auto_196606 ) ) ( not ( = ?auto_196597 ?auto_196607 ) ) ( not ( = ?auto_196597 ?auto_196608 ) ) ( not ( = ?auto_196598 ?auto_196599 ) ) ( not ( = ?auto_196598 ?auto_196600 ) ) ( not ( = ?auto_196598 ?auto_196601 ) ) ( not ( = ?auto_196598 ?auto_196602 ) ) ( not ( = ?auto_196598 ?auto_196603 ) ) ( not ( = ?auto_196598 ?auto_196604 ) ) ( not ( = ?auto_196598 ?auto_196605 ) ) ( not ( = ?auto_196598 ?auto_196606 ) ) ( not ( = ?auto_196598 ?auto_196607 ) ) ( not ( = ?auto_196598 ?auto_196608 ) ) ( not ( = ?auto_196599 ?auto_196600 ) ) ( not ( = ?auto_196599 ?auto_196601 ) ) ( not ( = ?auto_196599 ?auto_196602 ) ) ( not ( = ?auto_196599 ?auto_196603 ) ) ( not ( = ?auto_196599 ?auto_196604 ) ) ( not ( = ?auto_196599 ?auto_196605 ) ) ( not ( = ?auto_196599 ?auto_196606 ) ) ( not ( = ?auto_196599 ?auto_196607 ) ) ( not ( = ?auto_196599 ?auto_196608 ) ) ( not ( = ?auto_196600 ?auto_196601 ) ) ( not ( = ?auto_196600 ?auto_196602 ) ) ( not ( = ?auto_196600 ?auto_196603 ) ) ( not ( = ?auto_196600 ?auto_196604 ) ) ( not ( = ?auto_196600 ?auto_196605 ) ) ( not ( = ?auto_196600 ?auto_196606 ) ) ( not ( = ?auto_196600 ?auto_196607 ) ) ( not ( = ?auto_196600 ?auto_196608 ) ) ( not ( = ?auto_196601 ?auto_196602 ) ) ( not ( = ?auto_196601 ?auto_196603 ) ) ( not ( = ?auto_196601 ?auto_196604 ) ) ( not ( = ?auto_196601 ?auto_196605 ) ) ( not ( = ?auto_196601 ?auto_196606 ) ) ( not ( = ?auto_196601 ?auto_196607 ) ) ( not ( = ?auto_196601 ?auto_196608 ) ) ( not ( = ?auto_196602 ?auto_196603 ) ) ( not ( = ?auto_196602 ?auto_196604 ) ) ( not ( = ?auto_196602 ?auto_196605 ) ) ( not ( = ?auto_196602 ?auto_196606 ) ) ( not ( = ?auto_196602 ?auto_196607 ) ) ( not ( = ?auto_196602 ?auto_196608 ) ) ( not ( = ?auto_196603 ?auto_196604 ) ) ( not ( = ?auto_196603 ?auto_196605 ) ) ( not ( = ?auto_196603 ?auto_196606 ) ) ( not ( = ?auto_196603 ?auto_196607 ) ) ( not ( = ?auto_196603 ?auto_196608 ) ) ( not ( = ?auto_196604 ?auto_196605 ) ) ( not ( = ?auto_196604 ?auto_196606 ) ) ( not ( = ?auto_196604 ?auto_196607 ) ) ( not ( = ?auto_196604 ?auto_196608 ) ) ( not ( = ?auto_196605 ?auto_196606 ) ) ( not ( = ?auto_196605 ?auto_196607 ) ) ( not ( = ?auto_196605 ?auto_196608 ) ) ( not ( = ?auto_196606 ?auto_196607 ) ) ( not ( = ?auto_196606 ?auto_196608 ) ) ( not ( = ?auto_196607 ?auto_196608 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_196608 )
      ( !STACK ?auto_196608 ?auto_196607 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196621 - BLOCK
      ?auto_196622 - BLOCK
      ?auto_196623 - BLOCK
      ?auto_196624 - BLOCK
      ?auto_196625 - BLOCK
      ?auto_196626 - BLOCK
      ?auto_196627 - BLOCK
      ?auto_196628 - BLOCK
      ?auto_196629 - BLOCK
      ?auto_196630 - BLOCK
      ?auto_196631 - BLOCK
      ?auto_196632 - BLOCK
    )
    :vars
    (
      ?auto_196633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196632 ?auto_196633 ) ( ON-TABLE ?auto_196621 ) ( ON ?auto_196622 ?auto_196621 ) ( ON ?auto_196623 ?auto_196622 ) ( ON ?auto_196624 ?auto_196623 ) ( ON ?auto_196625 ?auto_196624 ) ( ON ?auto_196626 ?auto_196625 ) ( ON ?auto_196627 ?auto_196626 ) ( ON ?auto_196628 ?auto_196627 ) ( ON ?auto_196629 ?auto_196628 ) ( ON ?auto_196630 ?auto_196629 ) ( not ( = ?auto_196621 ?auto_196622 ) ) ( not ( = ?auto_196621 ?auto_196623 ) ) ( not ( = ?auto_196621 ?auto_196624 ) ) ( not ( = ?auto_196621 ?auto_196625 ) ) ( not ( = ?auto_196621 ?auto_196626 ) ) ( not ( = ?auto_196621 ?auto_196627 ) ) ( not ( = ?auto_196621 ?auto_196628 ) ) ( not ( = ?auto_196621 ?auto_196629 ) ) ( not ( = ?auto_196621 ?auto_196630 ) ) ( not ( = ?auto_196621 ?auto_196631 ) ) ( not ( = ?auto_196621 ?auto_196632 ) ) ( not ( = ?auto_196621 ?auto_196633 ) ) ( not ( = ?auto_196622 ?auto_196623 ) ) ( not ( = ?auto_196622 ?auto_196624 ) ) ( not ( = ?auto_196622 ?auto_196625 ) ) ( not ( = ?auto_196622 ?auto_196626 ) ) ( not ( = ?auto_196622 ?auto_196627 ) ) ( not ( = ?auto_196622 ?auto_196628 ) ) ( not ( = ?auto_196622 ?auto_196629 ) ) ( not ( = ?auto_196622 ?auto_196630 ) ) ( not ( = ?auto_196622 ?auto_196631 ) ) ( not ( = ?auto_196622 ?auto_196632 ) ) ( not ( = ?auto_196622 ?auto_196633 ) ) ( not ( = ?auto_196623 ?auto_196624 ) ) ( not ( = ?auto_196623 ?auto_196625 ) ) ( not ( = ?auto_196623 ?auto_196626 ) ) ( not ( = ?auto_196623 ?auto_196627 ) ) ( not ( = ?auto_196623 ?auto_196628 ) ) ( not ( = ?auto_196623 ?auto_196629 ) ) ( not ( = ?auto_196623 ?auto_196630 ) ) ( not ( = ?auto_196623 ?auto_196631 ) ) ( not ( = ?auto_196623 ?auto_196632 ) ) ( not ( = ?auto_196623 ?auto_196633 ) ) ( not ( = ?auto_196624 ?auto_196625 ) ) ( not ( = ?auto_196624 ?auto_196626 ) ) ( not ( = ?auto_196624 ?auto_196627 ) ) ( not ( = ?auto_196624 ?auto_196628 ) ) ( not ( = ?auto_196624 ?auto_196629 ) ) ( not ( = ?auto_196624 ?auto_196630 ) ) ( not ( = ?auto_196624 ?auto_196631 ) ) ( not ( = ?auto_196624 ?auto_196632 ) ) ( not ( = ?auto_196624 ?auto_196633 ) ) ( not ( = ?auto_196625 ?auto_196626 ) ) ( not ( = ?auto_196625 ?auto_196627 ) ) ( not ( = ?auto_196625 ?auto_196628 ) ) ( not ( = ?auto_196625 ?auto_196629 ) ) ( not ( = ?auto_196625 ?auto_196630 ) ) ( not ( = ?auto_196625 ?auto_196631 ) ) ( not ( = ?auto_196625 ?auto_196632 ) ) ( not ( = ?auto_196625 ?auto_196633 ) ) ( not ( = ?auto_196626 ?auto_196627 ) ) ( not ( = ?auto_196626 ?auto_196628 ) ) ( not ( = ?auto_196626 ?auto_196629 ) ) ( not ( = ?auto_196626 ?auto_196630 ) ) ( not ( = ?auto_196626 ?auto_196631 ) ) ( not ( = ?auto_196626 ?auto_196632 ) ) ( not ( = ?auto_196626 ?auto_196633 ) ) ( not ( = ?auto_196627 ?auto_196628 ) ) ( not ( = ?auto_196627 ?auto_196629 ) ) ( not ( = ?auto_196627 ?auto_196630 ) ) ( not ( = ?auto_196627 ?auto_196631 ) ) ( not ( = ?auto_196627 ?auto_196632 ) ) ( not ( = ?auto_196627 ?auto_196633 ) ) ( not ( = ?auto_196628 ?auto_196629 ) ) ( not ( = ?auto_196628 ?auto_196630 ) ) ( not ( = ?auto_196628 ?auto_196631 ) ) ( not ( = ?auto_196628 ?auto_196632 ) ) ( not ( = ?auto_196628 ?auto_196633 ) ) ( not ( = ?auto_196629 ?auto_196630 ) ) ( not ( = ?auto_196629 ?auto_196631 ) ) ( not ( = ?auto_196629 ?auto_196632 ) ) ( not ( = ?auto_196629 ?auto_196633 ) ) ( not ( = ?auto_196630 ?auto_196631 ) ) ( not ( = ?auto_196630 ?auto_196632 ) ) ( not ( = ?auto_196630 ?auto_196633 ) ) ( not ( = ?auto_196631 ?auto_196632 ) ) ( not ( = ?auto_196631 ?auto_196633 ) ) ( not ( = ?auto_196632 ?auto_196633 ) ) ( CLEAR ?auto_196630 ) ( ON ?auto_196631 ?auto_196632 ) ( CLEAR ?auto_196631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_196621 ?auto_196622 ?auto_196623 ?auto_196624 ?auto_196625 ?auto_196626 ?auto_196627 ?auto_196628 ?auto_196629 ?auto_196630 ?auto_196631 )
      ( MAKE-12PILE ?auto_196621 ?auto_196622 ?auto_196623 ?auto_196624 ?auto_196625 ?auto_196626 ?auto_196627 ?auto_196628 ?auto_196629 ?auto_196630 ?auto_196631 ?auto_196632 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196646 - BLOCK
      ?auto_196647 - BLOCK
      ?auto_196648 - BLOCK
      ?auto_196649 - BLOCK
      ?auto_196650 - BLOCK
      ?auto_196651 - BLOCK
      ?auto_196652 - BLOCK
      ?auto_196653 - BLOCK
      ?auto_196654 - BLOCK
      ?auto_196655 - BLOCK
      ?auto_196656 - BLOCK
      ?auto_196657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196657 ) ( ON-TABLE ?auto_196646 ) ( ON ?auto_196647 ?auto_196646 ) ( ON ?auto_196648 ?auto_196647 ) ( ON ?auto_196649 ?auto_196648 ) ( ON ?auto_196650 ?auto_196649 ) ( ON ?auto_196651 ?auto_196650 ) ( ON ?auto_196652 ?auto_196651 ) ( ON ?auto_196653 ?auto_196652 ) ( ON ?auto_196654 ?auto_196653 ) ( ON ?auto_196655 ?auto_196654 ) ( not ( = ?auto_196646 ?auto_196647 ) ) ( not ( = ?auto_196646 ?auto_196648 ) ) ( not ( = ?auto_196646 ?auto_196649 ) ) ( not ( = ?auto_196646 ?auto_196650 ) ) ( not ( = ?auto_196646 ?auto_196651 ) ) ( not ( = ?auto_196646 ?auto_196652 ) ) ( not ( = ?auto_196646 ?auto_196653 ) ) ( not ( = ?auto_196646 ?auto_196654 ) ) ( not ( = ?auto_196646 ?auto_196655 ) ) ( not ( = ?auto_196646 ?auto_196656 ) ) ( not ( = ?auto_196646 ?auto_196657 ) ) ( not ( = ?auto_196647 ?auto_196648 ) ) ( not ( = ?auto_196647 ?auto_196649 ) ) ( not ( = ?auto_196647 ?auto_196650 ) ) ( not ( = ?auto_196647 ?auto_196651 ) ) ( not ( = ?auto_196647 ?auto_196652 ) ) ( not ( = ?auto_196647 ?auto_196653 ) ) ( not ( = ?auto_196647 ?auto_196654 ) ) ( not ( = ?auto_196647 ?auto_196655 ) ) ( not ( = ?auto_196647 ?auto_196656 ) ) ( not ( = ?auto_196647 ?auto_196657 ) ) ( not ( = ?auto_196648 ?auto_196649 ) ) ( not ( = ?auto_196648 ?auto_196650 ) ) ( not ( = ?auto_196648 ?auto_196651 ) ) ( not ( = ?auto_196648 ?auto_196652 ) ) ( not ( = ?auto_196648 ?auto_196653 ) ) ( not ( = ?auto_196648 ?auto_196654 ) ) ( not ( = ?auto_196648 ?auto_196655 ) ) ( not ( = ?auto_196648 ?auto_196656 ) ) ( not ( = ?auto_196648 ?auto_196657 ) ) ( not ( = ?auto_196649 ?auto_196650 ) ) ( not ( = ?auto_196649 ?auto_196651 ) ) ( not ( = ?auto_196649 ?auto_196652 ) ) ( not ( = ?auto_196649 ?auto_196653 ) ) ( not ( = ?auto_196649 ?auto_196654 ) ) ( not ( = ?auto_196649 ?auto_196655 ) ) ( not ( = ?auto_196649 ?auto_196656 ) ) ( not ( = ?auto_196649 ?auto_196657 ) ) ( not ( = ?auto_196650 ?auto_196651 ) ) ( not ( = ?auto_196650 ?auto_196652 ) ) ( not ( = ?auto_196650 ?auto_196653 ) ) ( not ( = ?auto_196650 ?auto_196654 ) ) ( not ( = ?auto_196650 ?auto_196655 ) ) ( not ( = ?auto_196650 ?auto_196656 ) ) ( not ( = ?auto_196650 ?auto_196657 ) ) ( not ( = ?auto_196651 ?auto_196652 ) ) ( not ( = ?auto_196651 ?auto_196653 ) ) ( not ( = ?auto_196651 ?auto_196654 ) ) ( not ( = ?auto_196651 ?auto_196655 ) ) ( not ( = ?auto_196651 ?auto_196656 ) ) ( not ( = ?auto_196651 ?auto_196657 ) ) ( not ( = ?auto_196652 ?auto_196653 ) ) ( not ( = ?auto_196652 ?auto_196654 ) ) ( not ( = ?auto_196652 ?auto_196655 ) ) ( not ( = ?auto_196652 ?auto_196656 ) ) ( not ( = ?auto_196652 ?auto_196657 ) ) ( not ( = ?auto_196653 ?auto_196654 ) ) ( not ( = ?auto_196653 ?auto_196655 ) ) ( not ( = ?auto_196653 ?auto_196656 ) ) ( not ( = ?auto_196653 ?auto_196657 ) ) ( not ( = ?auto_196654 ?auto_196655 ) ) ( not ( = ?auto_196654 ?auto_196656 ) ) ( not ( = ?auto_196654 ?auto_196657 ) ) ( not ( = ?auto_196655 ?auto_196656 ) ) ( not ( = ?auto_196655 ?auto_196657 ) ) ( not ( = ?auto_196656 ?auto_196657 ) ) ( CLEAR ?auto_196655 ) ( ON ?auto_196656 ?auto_196657 ) ( CLEAR ?auto_196656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_196646 ?auto_196647 ?auto_196648 ?auto_196649 ?auto_196650 ?auto_196651 ?auto_196652 ?auto_196653 ?auto_196654 ?auto_196655 ?auto_196656 )
      ( MAKE-12PILE ?auto_196646 ?auto_196647 ?auto_196648 ?auto_196649 ?auto_196650 ?auto_196651 ?auto_196652 ?auto_196653 ?auto_196654 ?auto_196655 ?auto_196656 ?auto_196657 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196670 - BLOCK
      ?auto_196671 - BLOCK
      ?auto_196672 - BLOCK
      ?auto_196673 - BLOCK
      ?auto_196674 - BLOCK
      ?auto_196675 - BLOCK
      ?auto_196676 - BLOCK
      ?auto_196677 - BLOCK
      ?auto_196678 - BLOCK
      ?auto_196679 - BLOCK
      ?auto_196680 - BLOCK
      ?auto_196681 - BLOCK
    )
    :vars
    (
      ?auto_196682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196681 ?auto_196682 ) ( ON-TABLE ?auto_196670 ) ( ON ?auto_196671 ?auto_196670 ) ( ON ?auto_196672 ?auto_196671 ) ( ON ?auto_196673 ?auto_196672 ) ( ON ?auto_196674 ?auto_196673 ) ( ON ?auto_196675 ?auto_196674 ) ( ON ?auto_196676 ?auto_196675 ) ( ON ?auto_196677 ?auto_196676 ) ( ON ?auto_196678 ?auto_196677 ) ( not ( = ?auto_196670 ?auto_196671 ) ) ( not ( = ?auto_196670 ?auto_196672 ) ) ( not ( = ?auto_196670 ?auto_196673 ) ) ( not ( = ?auto_196670 ?auto_196674 ) ) ( not ( = ?auto_196670 ?auto_196675 ) ) ( not ( = ?auto_196670 ?auto_196676 ) ) ( not ( = ?auto_196670 ?auto_196677 ) ) ( not ( = ?auto_196670 ?auto_196678 ) ) ( not ( = ?auto_196670 ?auto_196679 ) ) ( not ( = ?auto_196670 ?auto_196680 ) ) ( not ( = ?auto_196670 ?auto_196681 ) ) ( not ( = ?auto_196670 ?auto_196682 ) ) ( not ( = ?auto_196671 ?auto_196672 ) ) ( not ( = ?auto_196671 ?auto_196673 ) ) ( not ( = ?auto_196671 ?auto_196674 ) ) ( not ( = ?auto_196671 ?auto_196675 ) ) ( not ( = ?auto_196671 ?auto_196676 ) ) ( not ( = ?auto_196671 ?auto_196677 ) ) ( not ( = ?auto_196671 ?auto_196678 ) ) ( not ( = ?auto_196671 ?auto_196679 ) ) ( not ( = ?auto_196671 ?auto_196680 ) ) ( not ( = ?auto_196671 ?auto_196681 ) ) ( not ( = ?auto_196671 ?auto_196682 ) ) ( not ( = ?auto_196672 ?auto_196673 ) ) ( not ( = ?auto_196672 ?auto_196674 ) ) ( not ( = ?auto_196672 ?auto_196675 ) ) ( not ( = ?auto_196672 ?auto_196676 ) ) ( not ( = ?auto_196672 ?auto_196677 ) ) ( not ( = ?auto_196672 ?auto_196678 ) ) ( not ( = ?auto_196672 ?auto_196679 ) ) ( not ( = ?auto_196672 ?auto_196680 ) ) ( not ( = ?auto_196672 ?auto_196681 ) ) ( not ( = ?auto_196672 ?auto_196682 ) ) ( not ( = ?auto_196673 ?auto_196674 ) ) ( not ( = ?auto_196673 ?auto_196675 ) ) ( not ( = ?auto_196673 ?auto_196676 ) ) ( not ( = ?auto_196673 ?auto_196677 ) ) ( not ( = ?auto_196673 ?auto_196678 ) ) ( not ( = ?auto_196673 ?auto_196679 ) ) ( not ( = ?auto_196673 ?auto_196680 ) ) ( not ( = ?auto_196673 ?auto_196681 ) ) ( not ( = ?auto_196673 ?auto_196682 ) ) ( not ( = ?auto_196674 ?auto_196675 ) ) ( not ( = ?auto_196674 ?auto_196676 ) ) ( not ( = ?auto_196674 ?auto_196677 ) ) ( not ( = ?auto_196674 ?auto_196678 ) ) ( not ( = ?auto_196674 ?auto_196679 ) ) ( not ( = ?auto_196674 ?auto_196680 ) ) ( not ( = ?auto_196674 ?auto_196681 ) ) ( not ( = ?auto_196674 ?auto_196682 ) ) ( not ( = ?auto_196675 ?auto_196676 ) ) ( not ( = ?auto_196675 ?auto_196677 ) ) ( not ( = ?auto_196675 ?auto_196678 ) ) ( not ( = ?auto_196675 ?auto_196679 ) ) ( not ( = ?auto_196675 ?auto_196680 ) ) ( not ( = ?auto_196675 ?auto_196681 ) ) ( not ( = ?auto_196675 ?auto_196682 ) ) ( not ( = ?auto_196676 ?auto_196677 ) ) ( not ( = ?auto_196676 ?auto_196678 ) ) ( not ( = ?auto_196676 ?auto_196679 ) ) ( not ( = ?auto_196676 ?auto_196680 ) ) ( not ( = ?auto_196676 ?auto_196681 ) ) ( not ( = ?auto_196676 ?auto_196682 ) ) ( not ( = ?auto_196677 ?auto_196678 ) ) ( not ( = ?auto_196677 ?auto_196679 ) ) ( not ( = ?auto_196677 ?auto_196680 ) ) ( not ( = ?auto_196677 ?auto_196681 ) ) ( not ( = ?auto_196677 ?auto_196682 ) ) ( not ( = ?auto_196678 ?auto_196679 ) ) ( not ( = ?auto_196678 ?auto_196680 ) ) ( not ( = ?auto_196678 ?auto_196681 ) ) ( not ( = ?auto_196678 ?auto_196682 ) ) ( not ( = ?auto_196679 ?auto_196680 ) ) ( not ( = ?auto_196679 ?auto_196681 ) ) ( not ( = ?auto_196679 ?auto_196682 ) ) ( not ( = ?auto_196680 ?auto_196681 ) ) ( not ( = ?auto_196680 ?auto_196682 ) ) ( not ( = ?auto_196681 ?auto_196682 ) ) ( ON ?auto_196680 ?auto_196681 ) ( CLEAR ?auto_196678 ) ( ON ?auto_196679 ?auto_196680 ) ( CLEAR ?auto_196679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_196670 ?auto_196671 ?auto_196672 ?auto_196673 ?auto_196674 ?auto_196675 ?auto_196676 ?auto_196677 ?auto_196678 ?auto_196679 )
      ( MAKE-12PILE ?auto_196670 ?auto_196671 ?auto_196672 ?auto_196673 ?auto_196674 ?auto_196675 ?auto_196676 ?auto_196677 ?auto_196678 ?auto_196679 ?auto_196680 ?auto_196681 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196695 - BLOCK
      ?auto_196696 - BLOCK
      ?auto_196697 - BLOCK
      ?auto_196698 - BLOCK
      ?auto_196699 - BLOCK
      ?auto_196700 - BLOCK
      ?auto_196701 - BLOCK
      ?auto_196702 - BLOCK
      ?auto_196703 - BLOCK
      ?auto_196704 - BLOCK
      ?auto_196705 - BLOCK
      ?auto_196706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196706 ) ( ON-TABLE ?auto_196695 ) ( ON ?auto_196696 ?auto_196695 ) ( ON ?auto_196697 ?auto_196696 ) ( ON ?auto_196698 ?auto_196697 ) ( ON ?auto_196699 ?auto_196698 ) ( ON ?auto_196700 ?auto_196699 ) ( ON ?auto_196701 ?auto_196700 ) ( ON ?auto_196702 ?auto_196701 ) ( ON ?auto_196703 ?auto_196702 ) ( not ( = ?auto_196695 ?auto_196696 ) ) ( not ( = ?auto_196695 ?auto_196697 ) ) ( not ( = ?auto_196695 ?auto_196698 ) ) ( not ( = ?auto_196695 ?auto_196699 ) ) ( not ( = ?auto_196695 ?auto_196700 ) ) ( not ( = ?auto_196695 ?auto_196701 ) ) ( not ( = ?auto_196695 ?auto_196702 ) ) ( not ( = ?auto_196695 ?auto_196703 ) ) ( not ( = ?auto_196695 ?auto_196704 ) ) ( not ( = ?auto_196695 ?auto_196705 ) ) ( not ( = ?auto_196695 ?auto_196706 ) ) ( not ( = ?auto_196696 ?auto_196697 ) ) ( not ( = ?auto_196696 ?auto_196698 ) ) ( not ( = ?auto_196696 ?auto_196699 ) ) ( not ( = ?auto_196696 ?auto_196700 ) ) ( not ( = ?auto_196696 ?auto_196701 ) ) ( not ( = ?auto_196696 ?auto_196702 ) ) ( not ( = ?auto_196696 ?auto_196703 ) ) ( not ( = ?auto_196696 ?auto_196704 ) ) ( not ( = ?auto_196696 ?auto_196705 ) ) ( not ( = ?auto_196696 ?auto_196706 ) ) ( not ( = ?auto_196697 ?auto_196698 ) ) ( not ( = ?auto_196697 ?auto_196699 ) ) ( not ( = ?auto_196697 ?auto_196700 ) ) ( not ( = ?auto_196697 ?auto_196701 ) ) ( not ( = ?auto_196697 ?auto_196702 ) ) ( not ( = ?auto_196697 ?auto_196703 ) ) ( not ( = ?auto_196697 ?auto_196704 ) ) ( not ( = ?auto_196697 ?auto_196705 ) ) ( not ( = ?auto_196697 ?auto_196706 ) ) ( not ( = ?auto_196698 ?auto_196699 ) ) ( not ( = ?auto_196698 ?auto_196700 ) ) ( not ( = ?auto_196698 ?auto_196701 ) ) ( not ( = ?auto_196698 ?auto_196702 ) ) ( not ( = ?auto_196698 ?auto_196703 ) ) ( not ( = ?auto_196698 ?auto_196704 ) ) ( not ( = ?auto_196698 ?auto_196705 ) ) ( not ( = ?auto_196698 ?auto_196706 ) ) ( not ( = ?auto_196699 ?auto_196700 ) ) ( not ( = ?auto_196699 ?auto_196701 ) ) ( not ( = ?auto_196699 ?auto_196702 ) ) ( not ( = ?auto_196699 ?auto_196703 ) ) ( not ( = ?auto_196699 ?auto_196704 ) ) ( not ( = ?auto_196699 ?auto_196705 ) ) ( not ( = ?auto_196699 ?auto_196706 ) ) ( not ( = ?auto_196700 ?auto_196701 ) ) ( not ( = ?auto_196700 ?auto_196702 ) ) ( not ( = ?auto_196700 ?auto_196703 ) ) ( not ( = ?auto_196700 ?auto_196704 ) ) ( not ( = ?auto_196700 ?auto_196705 ) ) ( not ( = ?auto_196700 ?auto_196706 ) ) ( not ( = ?auto_196701 ?auto_196702 ) ) ( not ( = ?auto_196701 ?auto_196703 ) ) ( not ( = ?auto_196701 ?auto_196704 ) ) ( not ( = ?auto_196701 ?auto_196705 ) ) ( not ( = ?auto_196701 ?auto_196706 ) ) ( not ( = ?auto_196702 ?auto_196703 ) ) ( not ( = ?auto_196702 ?auto_196704 ) ) ( not ( = ?auto_196702 ?auto_196705 ) ) ( not ( = ?auto_196702 ?auto_196706 ) ) ( not ( = ?auto_196703 ?auto_196704 ) ) ( not ( = ?auto_196703 ?auto_196705 ) ) ( not ( = ?auto_196703 ?auto_196706 ) ) ( not ( = ?auto_196704 ?auto_196705 ) ) ( not ( = ?auto_196704 ?auto_196706 ) ) ( not ( = ?auto_196705 ?auto_196706 ) ) ( ON ?auto_196705 ?auto_196706 ) ( CLEAR ?auto_196703 ) ( ON ?auto_196704 ?auto_196705 ) ( CLEAR ?auto_196704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_196695 ?auto_196696 ?auto_196697 ?auto_196698 ?auto_196699 ?auto_196700 ?auto_196701 ?auto_196702 ?auto_196703 ?auto_196704 )
      ( MAKE-12PILE ?auto_196695 ?auto_196696 ?auto_196697 ?auto_196698 ?auto_196699 ?auto_196700 ?auto_196701 ?auto_196702 ?auto_196703 ?auto_196704 ?auto_196705 ?auto_196706 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196719 - BLOCK
      ?auto_196720 - BLOCK
      ?auto_196721 - BLOCK
      ?auto_196722 - BLOCK
      ?auto_196723 - BLOCK
      ?auto_196724 - BLOCK
      ?auto_196725 - BLOCK
      ?auto_196726 - BLOCK
      ?auto_196727 - BLOCK
      ?auto_196728 - BLOCK
      ?auto_196729 - BLOCK
      ?auto_196730 - BLOCK
    )
    :vars
    (
      ?auto_196731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196730 ?auto_196731 ) ( ON-TABLE ?auto_196719 ) ( ON ?auto_196720 ?auto_196719 ) ( ON ?auto_196721 ?auto_196720 ) ( ON ?auto_196722 ?auto_196721 ) ( ON ?auto_196723 ?auto_196722 ) ( ON ?auto_196724 ?auto_196723 ) ( ON ?auto_196725 ?auto_196724 ) ( ON ?auto_196726 ?auto_196725 ) ( not ( = ?auto_196719 ?auto_196720 ) ) ( not ( = ?auto_196719 ?auto_196721 ) ) ( not ( = ?auto_196719 ?auto_196722 ) ) ( not ( = ?auto_196719 ?auto_196723 ) ) ( not ( = ?auto_196719 ?auto_196724 ) ) ( not ( = ?auto_196719 ?auto_196725 ) ) ( not ( = ?auto_196719 ?auto_196726 ) ) ( not ( = ?auto_196719 ?auto_196727 ) ) ( not ( = ?auto_196719 ?auto_196728 ) ) ( not ( = ?auto_196719 ?auto_196729 ) ) ( not ( = ?auto_196719 ?auto_196730 ) ) ( not ( = ?auto_196719 ?auto_196731 ) ) ( not ( = ?auto_196720 ?auto_196721 ) ) ( not ( = ?auto_196720 ?auto_196722 ) ) ( not ( = ?auto_196720 ?auto_196723 ) ) ( not ( = ?auto_196720 ?auto_196724 ) ) ( not ( = ?auto_196720 ?auto_196725 ) ) ( not ( = ?auto_196720 ?auto_196726 ) ) ( not ( = ?auto_196720 ?auto_196727 ) ) ( not ( = ?auto_196720 ?auto_196728 ) ) ( not ( = ?auto_196720 ?auto_196729 ) ) ( not ( = ?auto_196720 ?auto_196730 ) ) ( not ( = ?auto_196720 ?auto_196731 ) ) ( not ( = ?auto_196721 ?auto_196722 ) ) ( not ( = ?auto_196721 ?auto_196723 ) ) ( not ( = ?auto_196721 ?auto_196724 ) ) ( not ( = ?auto_196721 ?auto_196725 ) ) ( not ( = ?auto_196721 ?auto_196726 ) ) ( not ( = ?auto_196721 ?auto_196727 ) ) ( not ( = ?auto_196721 ?auto_196728 ) ) ( not ( = ?auto_196721 ?auto_196729 ) ) ( not ( = ?auto_196721 ?auto_196730 ) ) ( not ( = ?auto_196721 ?auto_196731 ) ) ( not ( = ?auto_196722 ?auto_196723 ) ) ( not ( = ?auto_196722 ?auto_196724 ) ) ( not ( = ?auto_196722 ?auto_196725 ) ) ( not ( = ?auto_196722 ?auto_196726 ) ) ( not ( = ?auto_196722 ?auto_196727 ) ) ( not ( = ?auto_196722 ?auto_196728 ) ) ( not ( = ?auto_196722 ?auto_196729 ) ) ( not ( = ?auto_196722 ?auto_196730 ) ) ( not ( = ?auto_196722 ?auto_196731 ) ) ( not ( = ?auto_196723 ?auto_196724 ) ) ( not ( = ?auto_196723 ?auto_196725 ) ) ( not ( = ?auto_196723 ?auto_196726 ) ) ( not ( = ?auto_196723 ?auto_196727 ) ) ( not ( = ?auto_196723 ?auto_196728 ) ) ( not ( = ?auto_196723 ?auto_196729 ) ) ( not ( = ?auto_196723 ?auto_196730 ) ) ( not ( = ?auto_196723 ?auto_196731 ) ) ( not ( = ?auto_196724 ?auto_196725 ) ) ( not ( = ?auto_196724 ?auto_196726 ) ) ( not ( = ?auto_196724 ?auto_196727 ) ) ( not ( = ?auto_196724 ?auto_196728 ) ) ( not ( = ?auto_196724 ?auto_196729 ) ) ( not ( = ?auto_196724 ?auto_196730 ) ) ( not ( = ?auto_196724 ?auto_196731 ) ) ( not ( = ?auto_196725 ?auto_196726 ) ) ( not ( = ?auto_196725 ?auto_196727 ) ) ( not ( = ?auto_196725 ?auto_196728 ) ) ( not ( = ?auto_196725 ?auto_196729 ) ) ( not ( = ?auto_196725 ?auto_196730 ) ) ( not ( = ?auto_196725 ?auto_196731 ) ) ( not ( = ?auto_196726 ?auto_196727 ) ) ( not ( = ?auto_196726 ?auto_196728 ) ) ( not ( = ?auto_196726 ?auto_196729 ) ) ( not ( = ?auto_196726 ?auto_196730 ) ) ( not ( = ?auto_196726 ?auto_196731 ) ) ( not ( = ?auto_196727 ?auto_196728 ) ) ( not ( = ?auto_196727 ?auto_196729 ) ) ( not ( = ?auto_196727 ?auto_196730 ) ) ( not ( = ?auto_196727 ?auto_196731 ) ) ( not ( = ?auto_196728 ?auto_196729 ) ) ( not ( = ?auto_196728 ?auto_196730 ) ) ( not ( = ?auto_196728 ?auto_196731 ) ) ( not ( = ?auto_196729 ?auto_196730 ) ) ( not ( = ?auto_196729 ?auto_196731 ) ) ( not ( = ?auto_196730 ?auto_196731 ) ) ( ON ?auto_196729 ?auto_196730 ) ( ON ?auto_196728 ?auto_196729 ) ( CLEAR ?auto_196726 ) ( ON ?auto_196727 ?auto_196728 ) ( CLEAR ?auto_196727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_196719 ?auto_196720 ?auto_196721 ?auto_196722 ?auto_196723 ?auto_196724 ?auto_196725 ?auto_196726 ?auto_196727 )
      ( MAKE-12PILE ?auto_196719 ?auto_196720 ?auto_196721 ?auto_196722 ?auto_196723 ?auto_196724 ?auto_196725 ?auto_196726 ?auto_196727 ?auto_196728 ?auto_196729 ?auto_196730 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196744 - BLOCK
      ?auto_196745 - BLOCK
      ?auto_196746 - BLOCK
      ?auto_196747 - BLOCK
      ?auto_196748 - BLOCK
      ?auto_196749 - BLOCK
      ?auto_196750 - BLOCK
      ?auto_196751 - BLOCK
      ?auto_196752 - BLOCK
      ?auto_196753 - BLOCK
      ?auto_196754 - BLOCK
      ?auto_196755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196755 ) ( ON-TABLE ?auto_196744 ) ( ON ?auto_196745 ?auto_196744 ) ( ON ?auto_196746 ?auto_196745 ) ( ON ?auto_196747 ?auto_196746 ) ( ON ?auto_196748 ?auto_196747 ) ( ON ?auto_196749 ?auto_196748 ) ( ON ?auto_196750 ?auto_196749 ) ( ON ?auto_196751 ?auto_196750 ) ( not ( = ?auto_196744 ?auto_196745 ) ) ( not ( = ?auto_196744 ?auto_196746 ) ) ( not ( = ?auto_196744 ?auto_196747 ) ) ( not ( = ?auto_196744 ?auto_196748 ) ) ( not ( = ?auto_196744 ?auto_196749 ) ) ( not ( = ?auto_196744 ?auto_196750 ) ) ( not ( = ?auto_196744 ?auto_196751 ) ) ( not ( = ?auto_196744 ?auto_196752 ) ) ( not ( = ?auto_196744 ?auto_196753 ) ) ( not ( = ?auto_196744 ?auto_196754 ) ) ( not ( = ?auto_196744 ?auto_196755 ) ) ( not ( = ?auto_196745 ?auto_196746 ) ) ( not ( = ?auto_196745 ?auto_196747 ) ) ( not ( = ?auto_196745 ?auto_196748 ) ) ( not ( = ?auto_196745 ?auto_196749 ) ) ( not ( = ?auto_196745 ?auto_196750 ) ) ( not ( = ?auto_196745 ?auto_196751 ) ) ( not ( = ?auto_196745 ?auto_196752 ) ) ( not ( = ?auto_196745 ?auto_196753 ) ) ( not ( = ?auto_196745 ?auto_196754 ) ) ( not ( = ?auto_196745 ?auto_196755 ) ) ( not ( = ?auto_196746 ?auto_196747 ) ) ( not ( = ?auto_196746 ?auto_196748 ) ) ( not ( = ?auto_196746 ?auto_196749 ) ) ( not ( = ?auto_196746 ?auto_196750 ) ) ( not ( = ?auto_196746 ?auto_196751 ) ) ( not ( = ?auto_196746 ?auto_196752 ) ) ( not ( = ?auto_196746 ?auto_196753 ) ) ( not ( = ?auto_196746 ?auto_196754 ) ) ( not ( = ?auto_196746 ?auto_196755 ) ) ( not ( = ?auto_196747 ?auto_196748 ) ) ( not ( = ?auto_196747 ?auto_196749 ) ) ( not ( = ?auto_196747 ?auto_196750 ) ) ( not ( = ?auto_196747 ?auto_196751 ) ) ( not ( = ?auto_196747 ?auto_196752 ) ) ( not ( = ?auto_196747 ?auto_196753 ) ) ( not ( = ?auto_196747 ?auto_196754 ) ) ( not ( = ?auto_196747 ?auto_196755 ) ) ( not ( = ?auto_196748 ?auto_196749 ) ) ( not ( = ?auto_196748 ?auto_196750 ) ) ( not ( = ?auto_196748 ?auto_196751 ) ) ( not ( = ?auto_196748 ?auto_196752 ) ) ( not ( = ?auto_196748 ?auto_196753 ) ) ( not ( = ?auto_196748 ?auto_196754 ) ) ( not ( = ?auto_196748 ?auto_196755 ) ) ( not ( = ?auto_196749 ?auto_196750 ) ) ( not ( = ?auto_196749 ?auto_196751 ) ) ( not ( = ?auto_196749 ?auto_196752 ) ) ( not ( = ?auto_196749 ?auto_196753 ) ) ( not ( = ?auto_196749 ?auto_196754 ) ) ( not ( = ?auto_196749 ?auto_196755 ) ) ( not ( = ?auto_196750 ?auto_196751 ) ) ( not ( = ?auto_196750 ?auto_196752 ) ) ( not ( = ?auto_196750 ?auto_196753 ) ) ( not ( = ?auto_196750 ?auto_196754 ) ) ( not ( = ?auto_196750 ?auto_196755 ) ) ( not ( = ?auto_196751 ?auto_196752 ) ) ( not ( = ?auto_196751 ?auto_196753 ) ) ( not ( = ?auto_196751 ?auto_196754 ) ) ( not ( = ?auto_196751 ?auto_196755 ) ) ( not ( = ?auto_196752 ?auto_196753 ) ) ( not ( = ?auto_196752 ?auto_196754 ) ) ( not ( = ?auto_196752 ?auto_196755 ) ) ( not ( = ?auto_196753 ?auto_196754 ) ) ( not ( = ?auto_196753 ?auto_196755 ) ) ( not ( = ?auto_196754 ?auto_196755 ) ) ( ON ?auto_196754 ?auto_196755 ) ( ON ?auto_196753 ?auto_196754 ) ( CLEAR ?auto_196751 ) ( ON ?auto_196752 ?auto_196753 ) ( CLEAR ?auto_196752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_196744 ?auto_196745 ?auto_196746 ?auto_196747 ?auto_196748 ?auto_196749 ?auto_196750 ?auto_196751 ?auto_196752 )
      ( MAKE-12PILE ?auto_196744 ?auto_196745 ?auto_196746 ?auto_196747 ?auto_196748 ?auto_196749 ?auto_196750 ?auto_196751 ?auto_196752 ?auto_196753 ?auto_196754 ?auto_196755 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196768 - BLOCK
      ?auto_196769 - BLOCK
      ?auto_196770 - BLOCK
      ?auto_196771 - BLOCK
      ?auto_196772 - BLOCK
      ?auto_196773 - BLOCK
      ?auto_196774 - BLOCK
      ?auto_196775 - BLOCK
      ?auto_196776 - BLOCK
      ?auto_196777 - BLOCK
      ?auto_196778 - BLOCK
      ?auto_196779 - BLOCK
    )
    :vars
    (
      ?auto_196780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196779 ?auto_196780 ) ( ON-TABLE ?auto_196768 ) ( ON ?auto_196769 ?auto_196768 ) ( ON ?auto_196770 ?auto_196769 ) ( ON ?auto_196771 ?auto_196770 ) ( ON ?auto_196772 ?auto_196771 ) ( ON ?auto_196773 ?auto_196772 ) ( ON ?auto_196774 ?auto_196773 ) ( not ( = ?auto_196768 ?auto_196769 ) ) ( not ( = ?auto_196768 ?auto_196770 ) ) ( not ( = ?auto_196768 ?auto_196771 ) ) ( not ( = ?auto_196768 ?auto_196772 ) ) ( not ( = ?auto_196768 ?auto_196773 ) ) ( not ( = ?auto_196768 ?auto_196774 ) ) ( not ( = ?auto_196768 ?auto_196775 ) ) ( not ( = ?auto_196768 ?auto_196776 ) ) ( not ( = ?auto_196768 ?auto_196777 ) ) ( not ( = ?auto_196768 ?auto_196778 ) ) ( not ( = ?auto_196768 ?auto_196779 ) ) ( not ( = ?auto_196768 ?auto_196780 ) ) ( not ( = ?auto_196769 ?auto_196770 ) ) ( not ( = ?auto_196769 ?auto_196771 ) ) ( not ( = ?auto_196769 ?auto_196772 ) ) ( not ( = ?auto_196769 ?auto_196773 ) ) ( not ( = ?auto_196769 ?auto_196774 ) ) ( not ( = ?auto_196769 ?auto_196775 ) ) ( not ( = ?auto_196769 ?auto_196776 ) ) ( not ( = ?auto_196769 ?auto_196777 ) ) ( not ( = ?auto_196769 ?auto_196778 ) ) ( not ( = ?auto_196769 ?auto_196779 ) ) ( not ( = ?auto_196769 ?auto_196780 ) ) ( not ( = ?auto_196770 ?auto_196771 ) ) ( not ( = ?auto_196770 ?auto_196772 ) ) ( not ( = ?auto_196770 ?auto_196773 ) ) ( not ( = ?auto_196770 ?auto_196774 ) ) ( not ( = ?auto_196770 ?auto_196775 ) ) ( not ( = ?auto_196770 ?auto_196776 ) ) ( not ( = ?auto_196770 ?auto_196777 ) ) ( not ( = ?auto_196770 ?auto_196778 ) ) ( not ( = ?auto_196770 ?auto_196779 ) ) ( not ( = ?auto_196770 ?auto_196780 ) ) ( not ( = ?auto_196771 ?auto_196772 ) ) ( not ( = ?auto_196771 ?auto_196773 ) ) ( not ( = ?auto_196771 ?auto_196774 ) ) ( not ( = ?auto_196771 ?auto_196775 ) ) ( not ( = ?auto_196771 ?auto_196776 ) ) ( not ( = ?auto_196771 ?auto_196777 ) ) ( not ( = ?auto_196771 ?auto_196778 ) ) ( not ( = ?auto_196771 ?auto_196779 ) ) ( not ( = ?auto_196771 ?auto_196780 ) ) ( not ( = ?auto_196772 ?auto_196773 ) ) ( not ( = ?auto_196772 ?auto_196774 ) ) ( not ( = ?auto_196772 ?auto_196775 ) ) ( not ( = ?auto_196772 ?auto_196776 ) ) ( not ( = ?auto_196772 ?auto_196777 ) ) ( not ( = ?auto_196772 ?auto_196778 ) ) ( not ( = ?auto_196772 ?auto_196779 ) ) ( not ( = ?auto_196772 ?auto_196780 ) ) ( not ( = ?auto_196773 ?auto_196774 ) ) ( not ( = ?auto_196773 ?auto_196775 ) ) ( not ( = ?auto_196773 ?auto_196776 ) ) ( not ( = ?auto_196773 ?auto_196777 ) ) ( not ( = ?auto_196773 ?auto_196778 ) ) ( not ( = ?auto_196773 ?auto_196779 ) ) ( not ( = ?auto_196773 ?auto_196780 ) ) ( not ( = ?auto_196774 ?auto_196775 ) ) ( not ( = ?auto_196774 ?auto_196776 ) ) ( not ( = ?auto_196774 ?auto_196777 ) ) ( not ( = ?auto_196774 ?auto_196778 ) ) ( not ( = ?auto_196774 ?auto_196779 ) ) ( not ( = ?auto_196774 ?auto_196780 ) ) ( not ( = ?auto_196775 ?auto_196776 ) ) ( not ( = ?auto_196775 ?auto_196777 ) ) ( not ( = ?auto_196775 ?auto_196778 ) ) ( not ( = ?auto_196775 ?auto_196779 ) ) ( not ( = ?auto_196775 ?auto_196780 ) ) ( not ( = ?auto_196776 ?auto_196777 ) ) ( not ( = ?auto_196776 ?auto_196778 ) ) ( not ( = ?auto_196776 ?auto_196779 ) ) ( not ( = ?auto_196776 ?auto_196780 ) ) ( not ( = ?auto_196777 ?auto_196778 ) ) ( not ( = ?auto_196777 ?auto_196779 ) ) ( not ( = ?auto_196777 ?auto_196780 ) ) ( not ( = ?auto_196778 ?auto_196779 ) ) ( not ( = ?auto_196778 ?auto_196780 ) ) ( not ( = ?auto_196779 ?auto_196780 ) ) ( ON ?auto_196778 ?auto_196779 ) ( ON ?auto_196777 ?auto_196778 ) ( ON ?auto_196776 ?auto_196777 ) ( CLEAR ?auto_196774 ) ( ON ?auto_196775 ?auto_196776 ) ( CLEAR ?auto_196775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196768 ?auto_196769 ?auto_196770 ?auto_196771 ?auto_196772 ?auto_196773 ?auto_196774 ?auto_196775 )
      ( MAKE-12PILE ?auto_196768 ?auto_196769 ?auto_196770 ?auto_196771 ?auto_196772 ?auto_196773 ?auto_196774 ?auto_196775 ?auto_196776 ?auto_196777 ?auto_196778 ?auto_196779 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196793 - BLOCK
      ?auto_196794 - BLOCK
      ?auto_196795 - BLOCK
      ?auto_196796 - BLOCK
      ?auto_196797 - BLOCK
      ?auto_196798 - BLOCK
      ?auto_196799 - BLOCK
      ?auto_196800 - BLOCK
      ?auto_196801 - BLOCK
      ?auto_196802 - BLOCK
      ?auto_196803 - BLOCK
      ?auto_196804 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196804 ) ( ON-TABLE ?auto_196793 ) ( ON ?auto_196794 ?auto_196793 ) ( ON ?auto_196795 ?auto_196794 ) ( ON ?auto_196796 ?auto_196795 ) ( ON ?auto_196797 ?auto_196796 ) ( ON ?auto_196798 ?auto_196797 ) ( ON ?auto_196799 ?auto_196798 ) ( not ( = ?auto_196793 ?auto_196794 ) ) ( not ( = ?auto_196793 ?auto_196795 ) ) ( not ( = ?auto_196793 ?auto_196796 ) ) ( not ( = ?auto_196793 ?auto_196797 ) ) ( not ( = ?auto_196793 ?auto_196798 ) ) ( not ( = ?auto_196793 ?auto_196799 ) ) ( not ( = ?auto_196793 ?auto_196800 ) ) ( not ( = ?auto_196793 ?auto_196801 ) ) ( not ( = ?auto_196793 ?auto_196802 ) ) ( not ( = ?auto_196793 ?auto_196803 ) ) ( not ( = ?auto_196793 ?auto_196804 ) ) ( not ( = ?auto_196794 ?auto_196795 ) ) ( not ( = ?auto_196794 ?auto_196796 ) ) ( not ( = ?auto_196794 ?auto_196797 ) ) ( not ( = ?auto_196794 ?auto_196798 ) ) ( not ( = ?auto_196794 ?auto_196799 ) ) ( not ( = ?auto_196794 ?auto_196800 ) ) ( not ( = ?auto_196794 ?auto_196801 ) ) ( not ( = ?auto_196794 ?auto_196802 ) ) ( not ( = ?auto_196794 ?auto_196803 ) ) ( not ( = ?auto_196794 ?auto_196804 ) ) ( not ( = ?auto_196795 ?auto_196796 ) ) ( not ( = ?auto_196795 ?auto_196797 ) ) ( not ( = ?auto_196795 ?auto_196798 ) ) ( not ( = ?auto_196795 ?auto_196799 ) ) ( not ( = ?auto_196795 ?auto_196800 ) ) ( not ( = ?auto_196795 ?auto_196801 ) ) ( not ( = ?auto_196795 ?auto_196802 ) ) ( not ( = ?auto_196795 ?auto_196803 ) ) ( not ( = ?auto_196795 ?auto_196804 ) ) ( not ( = ?auto_196796 ?auto_196797 ) ) ( not ( = ?auto_196796 ?auto_196798 ) ) ( not ( = ?auto_196796 ?auto_196799 ) ) ( not ( = ?auto_196796 ?auto_196800 ) ) ( not ( = ?auto_196796 ?auto_196801 ) ) ( not ( = ?auto_196796 ?auto_196802 ) ) ( not ( = ?auto_196796 ?auto_196803 ) ) ( not ( = ?auto_196796 ?auto_196804 ) ) ( not ( = ?auto_196797 ?auto_196798 ) ) ( not ( = ?auto_196797 ?auto_196799 ) ) ( not ( = ?auto_196797 ?auto_196800 ) ) ( not ( = ?auto_196797 ?auto_196801 ) ) ( not ( = ?auto_196797 ?auto_196802 ) ) ( not ( = ?auto_196797 ?auto_196803 ) ) ( not ( = ?auto_196797 ?auto_196804 ) ) ( not ( = ?auto_196798 ?auto_196799 ) ) ( not ( = ?auto_196798 ?auto_196800 ) ) ( not ( = ?auto_196798 ?auto_196801 ) ) ( not ( = ?auto_196798 ?auto_196802 ) ) ( not ( = ?auto_196798 ?auto_196803 ) ) ( not ( = ?auto_196798 ?auto_196804 ) ) ( not ( = ?auto_196799 ?auto_196800 ) ) ( not ( = ?auto_196799 ?auto_196801 ) ) ( not ( = ?auto_196799 ?auto_196802 ) ) ( not ( = ?auto_196799 ?auto_196803 ) ) ( not ( = ?auto_196799 ?auto_196804 ) ) ( not ( = ?auto_196800 ?auto_196801 ) ) ( not ( = ?auto_196800 ?auto_196802 ) ) ( not ( = ?auto_196800 ?auto_196803 ) ) ( not ( = ?auto_196800 ?auto_196804 ) ) ( not ( = ?auto_196801 ?auto_196802 ) ) ( not ( = ?auto_196801 ?auto_196803 ) ) ( not ( = ?auto_196801 ?auto_196804 ) ) ( not ( = ?auto_196802 ?auto_196803 ) ) ( not ( = ?auto_196802 ?auto_196804 ) ) ( not ( = ?auto_196803 ?auto_196804 ) ) ( ON ?auto_196803 ?auto_196804 ) ( ON ?auto_196802 ?auto_196803 ) ( ON ?auto_196801 ?auto_196802 ) ( CLEAR ?auto_196799 ) ( ON ?auto_196800 ?auto_196801 ) ( CLEAR ?auto_196800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196793 ?auto_196794 ?auto_196795 ?auto_196796 ?auto_196797 ?auto_196798 ?auto_196799 ?auto_196800 )
      ( MAKE-12PILE ?auto_196793 ?auto_196794 ?auto_196795 ?auto_196796 ?auto_196797 ?auto_196798 ?auto_196799 ?auto_196800 ?auto_196801 ?auto_196802 ?auto_196803 ?auto_196804 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196817 - BLOCK
      ?auto_196818 - BLOCK
      ?auto_196819 - BLOCK
      ?auto_196820 - BLOCK
      ?auto_196821 - BLOCK
      ?auto_196822 - BLOCK
      ?auto_196823 - BLOCK
      ?auto_196824 - BLOCK
      ?auto_196825 - BLOCK
      ?auto_196826 - BLOCK
      ?auto_196827 - BLOCK
      ?auto_196828 - BLOCK
    )
    :vars
    (
      ?auto_196829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196828 ?auto_196829 ) ( ON-TABLE ?auto_196817 ) ( ON ?auto_196818 ?auto_196817 ) ( ON ?auto_196819 ?auto_196818 ) ( ON ?auto_196820 ?auto_196819 ) ( ON ?auto_196821 ?auto_196820 ) ( ON ?auto_196822 ?auto_196821 ) ( not ( = ?auto_196817 ?auto_196818 ) ) ( not ( = ?auto_196817 ?auto_196819 ) ) ( not ( = ?auto_196817 ?auto_196820 ) ) ( not ( = ?auto_196817 ?auto_196821 ) ) ( not ( = ?auto_196817 ?auto_196822 ) ) ( not ( = ?auto_196817 ?auto_196823 ) ) ( not ( = ?auto_196817 ?auto_196824 ) ) ( not ( = ?auto_196817 ?auto_196825 ) ) ( not ( = ?auto_196817 ?auto_196826 ) ) ( not ( = ?auto_196817 ?auto_196827 ) ) ( not ( = ?auto_196817 ?auto_196828 ) ) ( not ( = ?auto_196817 ?auto_196829 ) ) ( not ( = ?auto_196818 ?auto_196819 ) ) ( not ( = ?auto_196818 ?auto_196820 ) ) ( not ( = ?auto_196818 ?auto_196821 ) ) ( not ( = ?auto_196818 ?auto_196822 ) ) ( not ( = ?auto_196818 ?auto_196823 ) ) ( not ( = ?auto_196818 ?auto_196824 ) ) ( not ( = ?auto_196818 ?auto_196825 ) ) ( not ( = ?auto_196818 ?auto_196826 ) ) ( not ( = ?auto_196818 ?auto_196827 ) ) ( not ( = ?auto_196818 ?auto_196828 ) ) ( not ( = ?auto_196818 ?auto_196829 ) ) ( not ( = ?auto_196819 ?auto_196820 ) ) ( not ( = ?auto_196819 ?auto_196821 ) ) ( not ( = ?auto_196819 ?auto_196822 ) ) ( not ( = ?auto_196819 ?auto_196823 ) ) ( not ( = ?auto_196819 ?auto_196824 ) ) ( not ( = ?auto_196819 ?auto_196825 ) ) ( not ( = ?auto_196819 ?auto_196826 ) ) ( not ( = ?auto_196819 ?auto_196827 ) ) ( not ( = ?auto_196819 ?auto_196828 ) ) ( not ( = ?auto_196819 ?auto_196829 ) ) ( not ( = ?auto_196820 ?auto_196821 ) ) ( not ( = ?auto_196820 ?auto_196822 ) ) ( not ( = ?auto_196820 ?auto_196823 ) ) ( not ( = ?auto_196820 ?auto_196824 ) ) ( not ( = ?auto_196820 ?auto_196825 ) ) ( not ( = ?auto_196820 ?auto_196826 ) ) ( not ( = ?auto_196820 ?auto_196827 ) ) ( not ( = ?auto_196820 ?auto_196828 ) ) ( not ( = ?auto_196820 ?auto_196829 ) ) ( not ( = ?auto_196821 ?auto_196822 ) ) ( not ( = ?auto_196821 ?auto_196823 ) ) ( not ( = ?auto_196821 ?auto_196824 ) ) ( not ( = ?auto_196821 ?auto_196825 ) ) ( not ( = ?auto_196821 ?auto_196826 ) ) ( not ( = ?auto_196821 ?auto_196827 ) ) ( not ( = ?auto_196821 ?auto_196828 ) ) ( not ( = ?auto_196821 ?auto_196829 ) ) ( not ( = ?auto_196822 ?auto_196823 ) ) ( not ( = ?auto_196822 ?auto_196824 ) ) ( not ( = ?auto_196822 ?auto_196825 ) ) ( not ( = ?auto_196822 ?auto_196826 ) ) ( not ( = ?auto_196822 ?auto_196827 ) ) ( not ( = ?auto_196822 ?auto_196828 ) ) ( not ( = ?auto_196822 ?auto_196829 ) ) ( not ( = ?auto_196823 ?auto_196824 ) ) ( not ( = ?auto_196823 ?auto_196825 ) ) ( not ( = ?auto_196823 ?auto_196826 ) ) ( not ( = ?auto_196823 ?auto_196827 ) ) ( not ( = ?auto_196823 ?auto_196828 ) ) ( not ( = ?auto_196823 ?auto_196829 ) ) ( not ( = ?auto_196824 ?auto_196825 ) ) ( not ( = ?auto_196824 ?auto_196826 ) ) ( not ( = ?auto_196824 ?auto_196827 ) ) ( not ( = ?auto_196824 ?auto_196828 ) ) ( not ( = ?auto_196824 ?auto_196829 ) ) ( not ( = ?auto_196825 ?auto_196826 ) ) ( not ( = ?auto_196825 ?auto_196827 ) ) ( not ( = ?auto_196825 ?auto_196828 ) ) ( not ( = ?auto_196825 ?auto_196829 ) ) ( not ( = ?auto_196826 ?auto_196827 ) ) ( not ( = ?auto_196826 ?auto_196828 ) ) ( not ( = ?auto_196826 ?auto_196829 ) ) ( not ( = ?auto_196827 ?auto_196828 ) ) ( not ( = ?auto_196827 ?auto_196829 ) ) ( not ( = ?auto_196828 ?auto_196829 ) ) ( ON ?auto_196827 ?auto_196828 ) ( ON ?auto_196826 ?auto_196827 ) ( ON ?auto_196825 ?auto_196826 ) ( ON ?auto_196824 ?auto_196825 ) ( CLEAR ?auto_196822 ) ( ON ?auto_196823 ?auto_196824 ) ( CLEAR ?auto_196823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_196817 ?auto_196818 ?auto_196819 ?auto_196820 ?auto_196821 ?auto_196822 ?auto_196823 )
      ( MAKE-12PILE ?auto_196817 ?auto_196818 ?auto_196819 ?auto_196820 ?auto_196821 ?auto_196822 ?auto_196823 ?auto_196824 ?auto_196825 ?auto_196826 ?auto_196827 ?auto_196828 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196842 - BLOCK
      ?auto_196843 - BLOCK
      ?auto_196844 - BLOCK
      ?auto_196845 - BLOCK
      ?auto_196846 - BLOCK
      ?auto_196847 - BLOCK
      ?auto_196848 - BLOCK
      ?auto_196849 - BLOCK
      ?auto_196850 - BLOCK
      ?auto_196851 - BLOCK
      ?auto_196852 - BLOCK
      ?auto_196853 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196853 ) ( ON-TABLE ?auto_196842 ) ( ON ?auto_196843 ?auto_196842 ) ( ON ?auto_196844 ?auto_196843 ) ( ON ?auto_196845 ?auto_196844 ) ( ON ?auto_196846 ?auto_196845 ) ( ON ?auto_196847 ?auto_196846 ) ( not ( = ?auto_196842 ?auto_196843 ) ) ( not ( = ?auto_196842 ?auto_196844 ) ) ( not ( = ?auto_196842 ?auto_196845 ) ) ( not ( = ?auto_196842 ?auto_196846 ) ) ( not ( = ?auto_196842 ?auto_196847 ) ) ( not ( = ?auto_196842 ?auto_196848 ) ) ( not ( = ?auto_196842 ?auto_196849 ) ) ( not ( = ?auto_196842 ?auto_196850 ) ) ( not ( = ?auto_196842 ?auto_196851 ) ) ( not ( = ?auto_196842 ?auto_196852 ) ) ( not ( = ?auto_196842 ?auto_196853 ) ) ( not ( = ?auto_196843 ?auto_196844 ) ) ( not ( = ?auto_196843 ?auto_196845 ) ) ( not ( = ?auto_196843 ?auto_196846 ) ) ( not ( = ?auto_196843 ?auto_196847 ) ) ( not ( = ?auto_196843 ?auto_196848 ) ) ( not ( = ?auto_196843 ?auto_196849 ) ) ( not ( = ?auto_196843 ?auto_196850 ) ) ( not ( = ?auto_196843 ?auto_196851 ) ) ( not ( = ?auto_196843 ?auto_196852 ) ) ( not ( = ?auto_196843 ?auto_196853 ) ) ( not ( = ?auto_196844 ?auto_196845 ) ) ( not ( = ?auto_196844 ?auto_196846 ) ) ( not ( = ?auto_196844 ?auto_196847 ) ) ( not ( = ?auto_196844 ?auto_196848 ) ) ( not ( = ?auto_196844 ?auto_196849 ) ) ( not ( = ?auto_196844 ?auto_196850 ) ) ( not ( = ?auto_196844 ?auto_196851 ) ) ( not ( = ?auto_196844 ?auto_196852 ) ) ( not ( = ?auto_196844 ?auto_196853 ) ) ( not ( = ?auto_196845 ?auto_196846 ) ) ( not ( = ?auto_196845 ?auto_196847 ) ) ( not ( = ?auto_196845 ?auto_196848 ) ) ( not ( = ?auto_196845 ?auto_196849 ) ) ( not ( = ?auto_196845 ?auto_196850 ) ) ( not ( = ?auto_196845 ?auto_196851 ) ) ( not ( = ?auto_196845 ?auto_196852 ) ) ( not ( = ?auto_196845 ?auto_196853 ) ) ( not ( = ?auto_196846 ?auto_196847 ) ) ( not ( = ?auto_196846 ?auto_196848 ) ) ( not ( = ?auto_196846 ?auto_196849 ) ) ( not ( = ?auto_196846 ?auto_196850 ) ) ( not ( = ?auto_196846 ?auto_196851 ) ) ( not ( = ?auto_196846 ?auto_196852 ) ) ( not ( = ?auto_196846 ?auto_196853 ) ) ( not ( = ?auto_196847 ?auto_196848 ) ) ( not ( = ?auto_196847 ?auto_196849 ) ) ( not ( = ?auto_196847 ?auto_196850 ) ) ( not ( = ?auto_196847 ?auto_196851 ) ) ( not ( = ?auto_196847 ?auto_196852 ) ) ( not ( = ?auto_196847 ?auto_196853 ) ) ( not ( = ?auto_196848 ?auto_196849 ) ) ( not ( = ?auto_196848 ?auto_196850 ) ) ( not ( = ?auto_196848 ?auto_196851 ) ) ( not ( = ?auto_196848 ?auto_196852 ) ) ( not ( = ?auto_196848 ?auto_196853 ) ) ( not ( = ?auto_196849 ?auto_196850 ) ) ( not ( = ?auto_196849 ?auto_196851 ) ) ( not ( = ?auto_196849 ?auto_196852 ) ) ( not ( = ?auto_196849 ?auto_196853 ) ) ( not ( = ?auto_196850 ?auto_196851 ) ) ( not ( = ?auto_196850 ?auto_196852 ) ) ( not ( = ?auto_196850 ?auto_196853 ) ) ( not ( = ?auto_196851 ?auto_196852 ) ) ( not ( = ?auto_196851 ?auto_196853 ) ) ( not ( = ?auto_196852 ?auto_196853 ) ) ( ON ?auto_196852 ?auto_196853 ) ( ON ?auto_196851 ?auto_196852 ) ( ON ?auto_196850 ?auto_196851 ) ( ON ?auto_196849 ?auto_196850 ) ( CLEAR ?auto_196847 ) ( ON ?auto_196848 ?auto_196849 ) ( CLEAR ?auto_196848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_196842 ?auto_196843 ?auto_196844 ?auto_196845 ?auto_196846 ?auto_196847 ?auto_196848 )
      ( MAKE-12PILE ?auto_196842 ?auto_196843 ?auto_196844 ?auto_196845 ?auto_196846 ?auto_196847 ?auto_196848 ?auto_196849 ?auto_196850 ?auto_196851 ?auto_196852 ?auto_196853 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196866 - BLOCK
      ?auto_196867 - BLOCK
      ?auto_196868 - BLOCK
      ?auto_196869 - BLOCK
      ?auto_196870 - BLOCK
      ?auto_196871 - BLOCK
      ?auto_196872 - BLOCK
      ?auto_196873 - BLOCK
      ?auto_196874 - BLOCK
      ?auto_196875 - BLOCK
      ?auto_196876 - BLOCK
      ?auto_196877 - BLOCK
    )
    :vars
    (
      ?auto_196878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196877 ?auto_196878 ) ( ON-TABLE ?auto_196866 ) ( ON ?auto_196867 ?auto_196866 ) ( ON ?auto_196868 ?auto_196867 ) ( ON ?auto_196869 ?auto_196868 ) ( ON ?auto_196870 ?auto_196869 ) ( not ( = ?auto_196866 ?auto_196867 ) ) ( not ( = ?auto_196866 ?auto_196868 ) ) ( not ( = ?auto_196866 ?auto_196869 ) ) ( not ( = ?auto_196866 ?auto_196870 ) ) ( not ( = ?auto_196866 ?auto_196871 ) ) ( not ( = ?auto_196866 ?auto_196872 ) ) ( not ( = ?auto_196866 ?auto_196873 ) ) ( not ( = ?auto_196866 ?auto_196874 ) ) ( not ( = ?auto_196866 ?auto_196875 ) ) ( not ( = ?auto_196866 ?auto_196876 ) ) ( not ( = ?auto_196866 ?auto_196877 ) ) ( not ( = ?auto_196866 ?auto_196878 ) ) ( not ( = ?auto_196867 ?auto_196868 ) ) ( not ( = ?auto_196867 ?auto_196869 ) ) ( not ( = ?auto_196867 ?auto_196870 ) ) ( not ( = ?auto_196867 ?auto_196871 ) ) ( not ( = ?auto_196867 ?auto_196872 ) ) ( not ( = ?auto_196867 ?auto_196873 ) ) ( not ( = ?auto_196867 ?auto_196874 ) ) ( not ( = ?auto_196867 ?auto_196875 ) ) ( not ( = ?auto_196867 ?auto_196876 ) ) ( not ( = ?auto_196867 ?auto_196877 ) ) ( not ( = ?auto_196867 ?auto_196878 ) ) ( not ( = ?auto_196868 ?auto_196869 ) ) ( not ( = ?auto_196868 ?auto_196870 ) ) ( not ( = ?auto_196868 ?auto_196871 ) ) ( not ( = ?auto_196868 ?auto_196872 ) ) ( not ( = ?auto_196868 ?auto_196873 ) ) ( not ( = ?auto_196868 ?auto_196874 ) ) ( not ( = ?auto_196868 ?auto_196875 ) ) ( not ( = ?auto_196868 ?auto_196876 ) ) ( not ( = ?auto_196868 ?auto_196877 ) ) ( not ( = ?auto_196868 ?auto_196878 ) ) ( not ( = ?auto_196869 ?auto_196870 ) ) ( not ( = ?auto_196869 ?auto_196871 ) ) ( not ( = ?auto_196869 ?auto_196872 ) ) ( not ( = ?auto_196869 ?auto_196873 ) ) ( not ( = ?auto_196869 ?auto_196874 ) ) ( not ( = ?auto_196869 ?auto_196875 ) ) ( not ( = ?auto_196869 ?auto_196876 ) ) ( not ( = ?auto_196869 ?auto_196877 ) ) ( not ( = ?auto_196869 ?auto_196878 ) ) ( not ( = ?auto_196870 ?auto_196871 ) ) ( not ( = ?auto_196870 ?auto_196872 ) ) ( not ( = ?auto_196870 ?auto_196873 ) ) ( not ( = ?auto_196870 ?auto_196874 ) ) ( not ( = ?auto_196870 ?auto_196875 ) ) ( not ( = ?auto_196870 ?auto_196876 ) ) ( not ( = ?auto_196870 ?auto_196877 ) ) ( not ( = ?auto_196870 ?auto_196878 ) ) ( not ( = ?auto_196871 ?auto_196872 ) ) ( not ( = ?auto_196871 ?auto_196873 ) ) ( not ( = ?auto_196871 ?auto_196874 ) ) ( not ( = ?auto_196871 ?auto_196875 ) ) ( not ( = ?auto_196871 ?auto_196876 ) ) ( not ( = ?auto_196871 ?auto_196877 ) ) ( not ( = ?auto_196871 ?auto_196878 ) ) ( not ( = ?auto_196872 ?auto_196873 ) ) ( not ( = ?auto_196872 ?auto_196874 ) ) ( not ( = ?auto_196872 ?auto_196875 ) ) ( not ( = ?auto_196872 ?auto_196876 ) ) ( not ( = ?auto_196872 ?auto_196877 ) ) ( not ( = ?auto_196872 ?auto_196878 ) ) ( not ( = ?auto_196873 ?auto_196874 ) ) ( not ( = ?auto_196873 ?auto_196875 ) ) ( not ( = ?auto_196873 ?auto_196876 ) ) ( not ( = ?auto_196873 ?auto_196877 ) ) ( not ( = ?auto_196873 ?auto_196878 ) ) ( not ( = ?auto_196874 ?auto_196875 ) ) ( not ( = ?auto_196874 ?auto_196876 ) ) ( not ( = ?auto_196874 ?auto_196877 ) ) ( not ( = ?auto_196874 ?auto_196878 ) ) ( not ( = ?auto_196875 ?auto_196876 ) ) ( not ( = ?auto_196875 ?auto_196877 ) ) ( not ( = ?auto_196875 ?auto_196878 ) ) ( not ( = ?auto_196876 ?auto_196877 ) ) ( not ( = ?auto_196876 ?auto_196878 ) ) ( not ( = ?auto_196877 ?auto_196878 ) ) ( ON ?auto_196876 ?auto_196877 ) ( ON ?auto_196875 ?auto_196876 ) ( ON ?auto_196874 ?auto_196875 ) ( ON ?auto_196873 ?auto_196874 ) ( ON ?auto_196872 ?auto_196873 ) ( CLEAR ?auto_196870 ) ( ON ?auto_196871 ?auto_196872 ) ( CLEAR ?auto_196871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_196866 ?auto_196867 ?auto_196868 ?auto_196869 ?auto_196870 ?auto_196871 )
      ( MAKE-12PILE ?auto_196866 ?auto_196867 ?auto_196868 ?auto_196869 ?auto_196870 ?auto_196871 ?auto_196872 ?auto_196873 ?auto_196874 ?auto_196875 ?auto_196876 ?auto_196877 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196891 - BLOCK
      ?auto_196892 - BLOCK
      ?auto_196893 - BLOCK
      ?auto_196894 - BLOCK
      ?auto_196895 - BLOCK
      ?auto_196896 - BLOCK
      ?auto_196897 - BLOCK
      ?auto_196898 - BLOCK
      ?auto_196899 - BLOCK
      ?auto_196900 - BLOCK
      ?auto_196901 - BLOCK
      ?auto_196902 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196902 ) ( ON-TABLE ?auto_196891 ) ( ON ?auto_196892 ?auto_196891 ) ( ON ?auto_196893 ?auto_196892 ) ( ON ?auto_196894 ?auto_196893 ) ( ON ?auto_196895 ?auto_196894 ) ( not ( = ?auto_196891 ?auto_196892 ) ) ( not ( = ?auto_196891 ?auto_196893 ) ) ( not ( = ?auto_196891 ?auto_196894 ) ) ( not ( = ?auto_196891 ?auto_196895 ) ) ( not ( = ?auto_196891 ?auto_196896 ) ) ( not ( = ?auto_196891 ?auto_196897 ) ) ( not ( = ?auto_196891 ?auto_196898 ) ) ( not ( = ?auto_196891 ?auto_196899 ) ) ( not ( = ?auto_196891 ?auto_196900 ) ) ( not ( = ?auto_196891 ?auto_196901 ) ) ( not ( = ?auto_196891 ?auto_196902 ) ) ( not ( = ?auto_196892 ?auto_196893 ) ) ( not ( = ?auto_196892 ?auto_196894 ) ) ( not ( = ?auto_196892 ?auto_196895 ) ) ( not ( = ?auto_196892 ?auto_196896 ) ) ( not ( = ?auto_196892 ?auto_196897 ) ) ( not ( = ?auto_196892 ?auto_196898 ) ) ( not ( = ?auto_196892 ?auto_196899 ) ) ( not ( = ?auto_196892 ?auto_196900 ) ) ( not ( = ?auto_196892 ?auto_196901 ) ) ( not ( = ?auto_196892 ?auto_196902 ) ) ( not ( = ?auto_196893 ?auto_196894 ) ) ( not ( = ?auto_196893 ?auto_196895 ) ) ( not ( = ?auto_196893 ?auto_196896 ) ) ( not ( = ?auto_196893 ?auto_196897 ) ) ( not ( = ?auto_196893 ?auto_196898 ) ) ( not ( = ?auto_196893 ?auto_196899 ) ) ( not ( = ?auto_196893 ?auto_196900 ) ) ( not ( = ?auto_196893 ?auto_196901 ) ) ( not ( = ?auto_196893 ?auto_196902 ) ) ( not ( = ?auto_196894 ?auto_196895 ) ) ( not ( = ?auto_196894 ?auto_196896 ) ) ( not ( = ?auto_196894 ?auto_196897 ) ) ( not ( = ?auto_196894 ?auto_196898 ) ) ( not ( = ?auto_196894 ?auto_196899 ) ) ( not ( = ?auto_196894 ?auto_196900 ) ) ( not ( = ?auto_196894 ?auto_196901 ) ) ( not ( = ?auto_196894 ?auto_196902 ) ) ( not ( = ?auto_196895 ?auto_196896 ) ) ( not ( = ?auto_196895 ?auto_196897 ) ) ( not ( = ?auto_196895 ?auto_196898 ) ) ( not ( = ?auto_196895 ?auto_196899 ) ) ( not ( = ?auto_196895 ?auto_196900 ) ) ( not ( = ?auto_196895 ?auto_196901 ) ) ( not ( = ?auto_196895 ?auto_196902 ) ) ( not ( = ?auto_196896 ?auto_196897 ) ) ( not ( = ?auto_196896 ?auto_196898 ) ) ( not ( = ?auto_196896 ?auto_196899 ) ) ( not ( = ?auto_196896 ?auto_196900 ) ) ( not ( = ?auto_196896 ?auto_196901 ) ) ( not ( = ?auto_196896 ?auto_196902 ) ) ( not ( = ?auto_196897 ?auto_196898 ) ) ( not ( = ?auto_196897 ?auto_196899 ) ) ( not ( = ?auto_196897 ?auto_196900 ) ) ( not ( = ?auto_196897 ?auto_196901 ) ) ( not ( = ?auto_196897 ?auto_196902 ) ) ( not ( = ?auto_196898 ?auto_196899 ) ) ( not ( = ?auto_196898 ?auto_196900 ) ) ( not ( = ?auto_196898 ?auto_196901 ) ) ( not ( = ?auto_196898 ?auto_196902 ) ) ( not ( = ?auto_196899 ?auto_196900 ) ) ( not ( = ?auto_196899 ?auto_196901 ) ) ( not ( = ?auto_196899 ?auto_196902 ) ) ( not ( = ?auto_196900 ?auto_196901 ) ) ( not ( = ?auto_196900 ?auto_196902 ) ) ( not ( = ?auto_196901 ?auto_196902 ) ) ( ON ?auto_196901 ?auto_196902 ) ( ON ?auto_196900 ?auto_196901 ) ( ON ?auto_196899 ?auto_196900 ) ( ON ?auto_196898 ?auto_196899 ) ( ON ?auto_196897 ?auto_196898 ) ( CLEAR ?auto_196895 ) ( ON ?auto_196896 ?auto_196897 ) ( CLEAR ?auto_196896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_196891 ?auto_196892 ?auto_196893 ?auto_196894 ?auto_196895 ?auto_196896 )
      ( MAKE-12PILE ?auto_196891 ?auto_196892 ?auto_196893 ?auto_196894 ?auto_196895 ?auto_196896 ?auto_196897 ?auto_196898 ?auto_196899 ?auto_196900 ?auto_196901 ?auto_196902 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196915 - BLOCK
      ?auto_196916 - BLOCK
      ?auto_196917 - BLOCK
      ?auto_196918 - BLOCK
      ?auto_196919 - BLOCK
      ?auto_196920 - BLOCK
      ?auto_196921 - BLOCK
      ?auto_196922 - BLOCK
      ?auto_196923 - BLOCK
      ?auto_196924 - BLOCK
      ?auto_196925 - BLOCK
      ?auto_196926 - BLOCK
    )
    :vars
    (
      ?auto_196927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196926 ?auto_196927 ) ( ON-TABLE ?auto_196915 ) ( ON ?auto_196916 ?auto_196915 ) ( ON ?auto_196917 ?auto_196916 ) ( ON ?auto_196918 ?auto_196917 ) ( not ( = ?auto_196915 ?auto_196916 ) ) ( not ( = ?auto_196915 ?auto_196917 ) ) ( not ( = ?auto_196915 ?auto_196918 ) ) ( not ( = ?auto_196915 ?auto_196919 ) ) ( not ( = ?auto_196915 ?auto_196920 ) ) ( not ( = ?auto_196915 ?auto_196921 ) ) ( not ( = ?auto_196915 ?auto_196922 ) ) ( not ( = ?auto_196915 ?auto_196923 ) ) ( not ( = ?auto_196915 ?auto_196924 ) ) ( not ( = ?auto_196915 ?auto_196925 ) ) ( not ( = ?auto_196915 ?auto_196926 ) ) ( not ( = ?auto_196915 ?auto_196927 ) ) ( not ( = ?auto_196916 ?auto_196917 ) ) ( not ( = ?auto_196916 ?auto_196918 ) ) ( not ( = ?auto_196916 ?auto_196919 ) ) ( not ( = ?auto_196916 ?auto_196920 ) ) ( not ( = ?auto_196916 ?auto_196921 ) ) ( not ( = ?auto_196916 ?auto_196922 ) ) ( not ( = ?auto_196916 ?auto_196923 ) ) ( not ( = ?auto_196916 ?auto_196924 ) ) ( not ( = ?auto_196916 ?auto_196925 ) ) ( not ( = ?auto_196916 ?auto_196926 ) ) ( not ( = ?auto_196916 ?auto_196927 ) ) ( not ( = ?auto_196917 ?auto_196918 ) ) ( not ( = ?auto_196917 ?auto_196919 ) ) ( not ( = ?auto_196917 ?auto_196920 ) ) ( not ( = ?auto_196917 ?auto_196921 ) ) ( not ( = ?auto_196917 ?auto_196922 ) ) ( not ( = ?auto_196917 ?auto_196923 ) ) ( not ( = ?auto_196917 ?auto_196924 ) ) ( not ( = ?auto_196917 ?auto_196925 ) ) ( not ( = ?auto_196917 ?auto_196926 ) ) ( not ( = ?auto_196917 ?auto_196927 ) ) ( not ( = ?auto_196918 ?auto_196919 ) ) ( not ( = ?auto_196918 ?auto_196920 ) ) ( not ( = ?auto_196918 ?auto_196921 ) ) ( not ( = ?auto_196918 ?auto_196922 ) ) ( not ( = ?auto_196918 ?auto_196923 ) ) ( not ( = ?auto_196918 ?auto_196924 ) ) ( not ( = ?auto_196918 ?auto_196925 ) ) ( not ( = ?auto_196918 ?auto_196926 ) ) ( not ( = ?auto_196918 ?auto_196927 ) ) ( not ( = ?auto_196919 ?auto_196920 ) ) ( not ( = ?auto_196919 ?auto_196921 ) ) ( not ( = ?auto_196919 ?auto_196922 ) ) ( not ( = ?auto_196919 ?auto_196923 ) ) ( not ( = ?auto_196919 ?auto_196924 ) ) ( not ( = ?auto_196919 ?auto_196925 ) ) ( not ( = ?auto_196919 ?auto_196926 ) ) ( not ( = ?auto_196919 ?auto_196927 ) ) ( not ( = ?auto_196920 ?auto_196921 ) ) ( not ( = ?auto_196920 ?auto_196922 ) ) ( not ( = ?auto_196920 ?auto_196923 ) ) ( not ( = ?auto_196920 ?auto_196924 ) ) ( not ( = ?auto_196920 ?auto_196925 ) ) ( not ( = ?auto_196920 ?auto_196926 ) ) ( not ( = ?auto_196920 ?auto_196927 ) ) ( not ( = ?auto_196921 ?auto_196922 ) ) ( not ( = ?auto_196921 ?auto_196923 ) ) ( not ( = ?auto_196921 ?auto_196924 ) ) ( not ( = ?auto_196921 ?auto_196925 ) ) ( not ( = ?auto_196921 ?auto_196926 ) ) ( not ( = ?auto_196921 ?auto_196927 ) ) ( not ( = ?auto_196922 ?auto_196923 ) ) ( not ( = ?auto_196922 ?auto_196924 ) ) ( not ( = ?auto_196922 ?auto_196925 ) ) ( not ( = ?auto_196922 ?auto_196926 ) ) ( not ( = ?auto_196922 ?auto_196927 ) ) ( not ( = ?auto_196923 ?auto_196924 ) ) ( not ( = ?auto_196923 ?auto_196925 ) ) ( not ( = ?auto_196923 ?auto_196926 ) ) ( not ( = ?auto_196923 ?auto_196927 ) ) ( not ( = ?auto_196924 ?auto_196925 ) ) ( not ( = ?auto_196924 ?auto_196926 ) ) ( not ( = ?auto_196924 ?auto_196927 ) ) ( not ( = ?auto_196925 ?auto_196926 ) ) ( not ( = ?auto_196925 ?auto_196927 ) ) ( not ( = ?auto_196926 ?auto_196927 ) ) ( ON ?auto_196925 ?auto_196926 ) ( ON ?auto_196924 ?auto_196925 ) ( ON ?auto_196923 ?auto_196924 ) ( ON ?auto_196922 ?auto_196923 ) ( ON ?auto_196921 ?auto_196922 ) ( ON ?auto_196920 ?auto_196921 ) ( CLEAR ?auto_196918 ) ( ON ?auto_196919 ?auto_196920 ) ( CLEAR ?auto_196919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_196915 ?auto_196916 ?auto_196917 ?auto_196918 ?auto_196919 )
      ( MAKE-12PILE ?auto_196915 ?auto_196916 ?auto_196917 ?auto_196918 ?auto_196919 ?auto_196920 ?auto_196921 ?auto_196922 ?auto_196923 ?auto_196924 ?auto_196925 ?auto_196926 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196940 - BLOCK
      ?auto_196941 - BLOCK
      ?auto_196942 - BLOCK
      ?auto_196943 - BLOCK
      ?auto_196944 - BLOCK
      ?auto_196945 - BLOCK
      ?auto_196946 - BLOCK
      ?auto_196947 - BLOCK
      ?auto_196948 - BLOCK
      ?auto_196949 - BLOCK
      ?auto_196950 - BLOCK
      ?auto_196951 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196951 ) ( ON-TABLE ?auto_196940 ) ( ON ?auto_196941 ?auto_196940 ) ( ON ?auto_196942 ?auto_196941 ) ( ON ?auto_196943 ?auto_196942 ) ( not ( = ?auto_196940 ?auto_196941 ) ) ( not ( = ?auto_196940 ?auto_196942 ) ) ( not ( = ?auto_196940 ?auto_196943 ) ) ( not ( = ?auto_196940 ?auto_196944 ) ) ( not ( = ?auto_196940 ?auto_196945 ) ) ( not ( = ?auto_196940 ?auto_196946 ) ) ( not ( = ?auto_196940 ?auto_196947 ) ) ( not ( = ?auto_196940 ?auto_196948 ) ) ( not ( = ?auto_196940 ?auto_196949 ) ) ( not ( = ?auto_196940 ?auto_196950 ) ) ( not ( = ?auto_196940 ?auto_196951 ) ) ( not ( = ?auto_196941 ?auto_196942 ) ) ( not ( = ?auto_196941 ?auto_196943 ) ) ( not ( = ?auto_196941 ?auto_196944 ) ) ( not ( = ?auto_196941 ?auto_196945 ) ) ( not ( = ?auto_196941 ?auto_196946 ) ) ( not ( = ?auto_196941 ?auto_196947 ) ) ( not ( = ?auto_196941 ?auto_196948 ) ) ( not ( = ?auto_196941 ?auto_196949 ) ) ( not ( = ?auto_196941 ?auto_196950 ) ) ( not ( = ?auto_196941 ?auto_196951 ) ) ( not ( = ?auto_196942 ?auto_196943 ) ) ( not ( = ?auto_196942 ?auto_196944 ) ) ( not ( = ?auto_196942 ?auto_196945 ) ) ( not ( = ?auto_196942 ?auto_196946 ) ) ( not ( = ?auto_196942 ?auto_196947 ) ) ( not ( = ?auto_196942 ?auto_196948 ) ) ( not ( = ?auto_196942 ?auto_196949 ) ) ( not ( = ?auto_196942 ?auto_196950 ) ) ( not ( = ?auto_196942 ?auto_196951 ) ) ( not ( = ?auto_196943 ?auto_196944 ) ) ( not ( = ?auto_196943 ?auto_196945 ) ) ( not ( = ?auto_196943 ?auto_196946 ) ) ( not ( = ?auto_196943 ?auto_196947 ) ) ( not ( = ?auto_196943 ?auto_196948 ) ) ( not ( = ?auto_196943 ?auto_196949 ) ) ( not ( = ?auto_196943 ?auto_196950 ) ) ( not ( = ?auto_196943 ?auto_196951 ) ) ( not ( = ?auto_196944 ?auto_196945 ) ) ( not ( = ?auto_196944 ?auto_196946 ) ) ( not ( = ?auto_196944 ?auto_196947 ) ) ( not ( = ?auto_196944 ?auto_196948 ) ) ( not ( = ?auto_196944 ?auto_196949 ) ) ( not ( = ?auto_196944 ?auto_196950 ) ) ( not ( = ?auto_196944 ?auto_196951 ) ) ( not ( = ?auto_196945 ?auto_196946 ) ) ( not ( = ?auto_196945 ?auto_196947 ) ) ( not ( = ?auto_196945 ?auto_196948 ) ) ( not ( = ?auto_196945 ?auto_196949 ) ) ( not ( = ?auto_196945 ?auto_196950 ) ) ( not ( = ?auto_196945 ?auto_196951 ) ) ( not ( = ?auto_196946 ?auto_196947 ) ) ( not ( = ?auto_196946 ?auto_196948 ) ) ( not ( = ?auto_196946 ?auto_196949 ) ) ( not ( = ?auto_196946 ?auto_196950 ) ) ( not ( = ?auto_196946 ?auto_196951 ) ) ( not ( = ?auto_196947 ?auto_196948 ) ) ( not ( = ?auto_196947 ?auto_196949 ) ) ( not ( = ?auto_196947 ?auto_196950 ) ) ( not ( = ?auto_196947 ?auto_196951 ) ) ( not ( = ?auto_196948 ?auto_196949 ) ) ( not ( = ?auto_196948 ?auto_196950 ) ) ( not ( = ?auto_196948 ?auto_196951 ) ) ( not ( = ?auto_196949 ?auto_196950 ) ) ( not ( = ?auto_196949 ?auto_196951 ) ) ( not ( = ?auto_196950 ?auto_196951 ) ) ( ON ?auto_196950 ?auto_196951 ) ( ON ?auto_196949 ?auto_196950 ) ( ON ?auto_196948 ?auto_196949 ) ( ON ?auto_196947 ?auto_196948 ) ( ON ?auto_196946 ?auto_196947 ) ( ON ?auto_196945 ?auto_196946 ) ( CLEAR ?auto_196943 ) ( ON ?auto_196944 ?auto_196945 ) ( CLEAR ?auto_196944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_196940 ?auto_196941 ?auto_196942 ?auto_196943 ?auto_196944 )
      ( MAKE-12PILE ?auto_196940 ?auto_196941 ?auto_196942 ?auto_196943 ?auto_196944 ?auto_196945 ?auto_196946 ?auto_196947 ?auto_196948 ?auto_196949 ?auto_196950 ?auto_196951 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196964 - BLOCK
      ?auto_196965 - BLOCK
      ?auto_196966 - BLOCK
      ?auto_196967 - BLOCK
      ?auto_196968 - BLOCK
      ?auto_196969 - BLOCK
      ?auto_196970 - BLOCK
      ?auto_196971 - BLOCK
      ?auto_196972 - BLOCK
      ?auto_196973 - BLOCK
      ?auto_196974 - BLOCK
      ?auto_196975 - BLOCK
    )
    :vars
    (
      ?auto_196976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196975 ?auto_196976 ) ( ON-TABLE ?auto_196964 ) ( ON ?auto_196965 ?auto_196964 ) ( ON ?auto_196966 ?auto_196965 ) ( not ( = ?auto_196964 ?auto_196965 ) ) ( not ( = ?auto_196964 ?auto_196966 ) ) ( not ( = ?auto_196964 ?auto_196967 ) ) ( not ( = ?auto_196964 ?auto_196968 ) ) ( not ( = ?auto_196964 ?auto_196969 ) ) ( not ( = ?auto_196964 ?auto_196970 ) ) ( not ( = ?auto_196964 ?auto_196971 ) ) ( not ( = ?auto_196964 ?auto_196972 ) ) ( not ( = ?auto_196964 ?auto_196973 ) ) ( not ( = ?auto_196964 ?auto_196974 ) ) ( not ( = ?auto_196964 ?auto_196975 ) ) ( not ( = ?auto_196964 ?auto_196976 ) ) ( not ( = ?auto_196965 ?auto_196966 ) ) ( not ( = ?auto_196965 ?auto_196967 ) ) ( not ( = ?auto_196965 ?auto_196968 ) ) ( not ( = ?auto_196965 ?auto_196969 ) ) ( not ( = ?auto_196965 ?auto_196970 ) ) ( not ( = ?auto_196965 ?auto_196971 ) ) ( not ( = ?auto_196965 ?auto_196972 ) ) ( not ( = ?auto_196965 ?auto_196973 ) ) ( not ( = ?auto_196965 ?auto_196974 ) ) ( not ( = ?auto_196965 ?auto_196975 ) ) ( not ( = ?auto_196965 ?auto_196976 ) ) ( not ( = ?auto_196966 ?auto_196967 ) ) ( not ( = ?auto_196966 ?auto_196968 ) ) ( not ( = ?auto_196966 ?auto_196969 ) ) ( not ( = ?auto_196966 ?auto_196970 ) ) ( not ( = ?auto_196966 ?auto_196971 ) ) ( not ( = ?auto_196966 ?auto_196972 ) ) ( not ( = ?auto_196966 ?auto_196973 ) ) ( not ( = ?auto_196966 ?auto_196974 ) ) ( not ( = ?auto_196966 ?auto_196975 ) ) ( not ( = ?auto_196966 ?auto_196976 ) ) ( not ( = ?auto_196967 ?auto_196968 ) ) ( not ( = ?auto_196967 ?auto_196969 ) ) ( not ( = ?auto_196967 ?auto_196970 ) ) ( not ( = ?auto_196967 ?auto_196971 ) ) ( not ( = ?auto_196967 ?auto_196972 ) ) ( not ( = ?auto_196967 ?auto_196973 ) ) ( not ( = ?auto_196967 ?auto_196974 ) ) ( not ( = ?auto_196967 ?auto_196975 ) ) ( not ( = ?auto_196967 ?auto_196976 ) ) ( not ( = ?auto_196968 ?auto_196969 ) ) ( not ( = ?auto_196968 ?auto_196970 ) ) ( not ( = ?auto_196968 ?auto_196971 ) ) ( not ( = ?auto_196968 ?auto_196972 ) ) ( not ( = ?auto_196968 ?auto_196973 ) ) ( not ( = ?auto_196968 ?auto_196974 ) ) ( not ( = ?auto_196968 ?auto_196975 ) ) ( not ( = ?auto_196968 ?auto_196976 ) ) ( not ( = ?auto_196969 ?auto_196970 ) ) ( not ( = ?auto_196969 ?auto_196971 ) ) ( not ( = ?auto_196969 ?auto_196972 ) ) ( not ( = ?auto_196969 ?auto_196973 ) ) ( not ( = ?auto_196969 ?auto_196974 ) ) ( not ( = ?auto_196969 ?auto_196975 ) ) ( not ( = ?auto_196969 ?auto_196976 ) ) ( not ( = ?auto_196970 ?auto_196971 ) ) ( not ( = ?auto_196970 ?auto_196972 ) ) ( not ( = ?auto_196970 ?auto_196973 ) ) ( not ( = ?auto_196970 ?auto_196974 ) ) ( not ( = ?auto_196970 ?auto_196975 ) ) ( not ( = ?auto_196970 ?auto_196976 ) ) ( not ( = ?auto_196971 ?auto_196972 ) ) ( not ( = ?auto_196971 ?auto_196973 ) ) ( not ( = ?auto_196971 ?auto_196974 ) ) ( not ( = ?auto_196971 ?auto_196975 ) ) ( not ( = ?auto_196971 ?auto_196976 ) ) ( not ( = ?auto_196972 ?auto_196973 ) ) ( not ( = ?auto_196972 ?auto_196974 ) ) ( not ( = ?auto_196972 ?auto_196975 ) ) ( not ( = ?auto_196972 ?auto_196976 ) ) ( not ( = ?auto_196973 ?auto_196974 ) ) ( not ( = ?auto_196973 ?auto_196975 ) ) ( not ( = ?auto_196973 ?auto_196976 ) ) ( not ( = ?auto_196974 ?auto_196975 ) ) ( not ( = ?auto_196974 ?auto_196976 ) ) ( not ( = ?auto_196975 ?auto_196976 ) ) ( ON ?auto_196974 ?auto_196975 ) ( ON ?auto_196973 ?auto_196974 ) ( ON ?auto_196972 ?auto_196973 ) ( ON ?auto_196971 ?auto_196972 ) ( ON ?auto_196970 ?auto_196971 ) ( ON ?auto_196969 ?auto_196970 ) ( ON ?auto_196968 ?auto_196969 ) ( CLEAR ?auto_196966 ) ( ON ?auto_196967 ?auto_196968 ) ( CLEAR ?auto_196967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_196964 ?auto_196965 ?auto_196966 ?auto_196967 )
      ( MAKE-12PILE ?auto_196964 ?auto_196965 ?auto_196966 ?auto_196967 ?auto_196968 ?auto_196969 ?auto_196970 ?auto_196971 ?auto_196972 ?auto_196973 ?auto_196974 ?auto_196975 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_196989 - BLOCK
      ?auto_196990 - BLOCK
      ?auto_196991 - BLOCK
      ?auto_196992 - BLOCK
      ?auto_196993 - BLOCK
      ?auto_196994 - BLOCK
      ?auto_196995 - BLOCK
      ?auto_196996 - BLOCK
      ?auto_196997 - BLOCK
      ?auto_196998 - BLOCK
      ?auto_196999 - BLOCK
      ?auto_197000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197000 ) ( ON-TABLE ?auto_196989 ) ( ON ?auto_196990 ?auto_196989 ) ( ON ?auto_196991 ?auto_196990 ) ( not ( = ?auto_196989 ?auto_196990 ) ) ( not ( = ?auto_196989 ?auto_196991 ) ) ( not ( = ?auto_196989 ?auto_196992 ) ) ( not ( = ?auto_196989 ?auto_196993 ) ) ( not ( = ?auto_196989 ?auto_196994 ) ) ( not ( = ?auto_196989 ?auto_196995 ) ) ( not ( = ?auto_196989 ?auto_196996 ) ) ( not ( = ?auto_196989 ?auto_196997 ) ) ( not ( = ?auto_196989 ?auto_196998 ) ) ( not ( = ?auto_196989 ?auto_196999 ) ) ( not ( = ?auto_196989 ?auto_197000 ) ) ( not ( = ?auto_196990 ?auto_196991 ) ) ( not ( = ?auto_196990 ?auto_196992 ) ) ( not ( = ?auto_196990 ?auto_196993 ) ) ( not ( = ?auto_196990 ?auto_196994 ) ) ( not ( = ?auto_196990 ?auto_196995 ) ) ( not ( = ?auto_196990 ?auto_196996 ) ) ( not ( = ?auto_196990 ?auto_196997 ) ) ( not ( = ?auto_196990 ?auto_196998 ) ) ( not ( = ?auto_196990 ?auto_196999 ) ) ( not ( = ?auto_196990 ?auto_197000 ) ) ( not ( = ?auto_196991 ?auto_196992 ) ) ( not ( = ?auto_196991 ?auto_196993 ) ) ( not ( = ?auto_196991 ?auto_196994 ) ) ( not ( = ?auto_196991 ?auto_196995 ) ) ( not ( = ?auto_196991 ?auto_196996 ) ) ( not ( = ?auto_196991 ?auto_196997 ) ) ( not ( = ?auto_196991 ?auto_196998 ) ) ( not ( = ?auto_196991 ?auto_196999 ) ) ( not ( = ?auto_196991 ?auto_197000 ) ) ( not ( = ?auto_196992 ?auto_196993 ) ) ( not ( = ?auto_196992 ?auto_196994 ) ) ( not ( = ?auto_196992 ?auto_196995 ) ) ( not ( = ?auto_196992 ?auto_196996 ) ) ( not ( = ?auto_196992 ?auto_196997 ) ) ( not ( = ?auto_196992 ?auto_196998 ) ) ( not ( = ?auto_196992 ?auto_196999 ) ) ( not ( = ?auto_196992 ?auto_197000 ) ) ( not ( = ?auto_196993 ?auto_196994 ) ) ( not ( = ?auto_196993 ?auto_196995 ) ) ( not ( = ?auto_196993 ?auto_196996 ) ) ( not ( = ?auto_196993 ?auto_196997 ) ) ( not ( = ?auto_196993 ?auto_196998 ) ) ( not ( = ?auto_196993 ?auto_196999 ) ) ( not ( = ?auto_196993 ?auto_197000 ) ) ( not ( = ?auto_196994 ?auto_196995 ) ) ( not ( = ?auto_196994 ?auto_196996 ) ) ( not ( = ?auto_196994 ?auto_196997 ) ) ( not ( = ?auto_196994 ?auto_196998 ) ) ( not ( = ?auto_196994 ?auto_196999 ) ) ( not ( = ?auto_196994 ?auto_197000 ) ) ( not ( = ?auto_196995 ?auto_196996 ) ) ( not ( = ?auto_196995 ?auto_196997 ) ) ( not ( = ?auto_196995 ?auto_196998 ) ) ( not ( = ?auto_196995 ?auto_196999 ) ) ( not ( = ?auto_196995 ?auto_197000 ) ) ( not ( = ?auto_196996 ?auto_196997 ) ) ( not ( = ?auto_196996 ?auto_196998 ) ) ( not ( = ?auto_196996 ?auto_196999 ) ) ( not ( = ?auto_196996 ?auto_197000 ) ) ( not ( = ?auto_196997 ?auto_196998 ) ) ( not ( = ?auto_196997 ?auto_196999 ) ) ( not ( = ?auto_196997 ?auto_197000 ) ) ( not ( = ?auto_196998 ?auto_196999 ) ) ( not ( = ?auto_196998 ?auto_197000 ) ) ( not ( = ?auto_196999 ?auto_197000 ) ) ( ON ?auto_196999 ?auto_197000 ) ( ON ?auto_196998 ?auto_196999 ) ( ON ?auto_196997 ?auto_196998 ) ( ON ?auto_196996 ?auto_196997 ) ( ON ?auto_196995 ?auto_196996 ) ( ON ?auto_196994 ?auto_196995 ) ( ON ?auto_196993 ?auto_196994 ) ( CLEAR ?auto_196991 ) ( ON ?auto_196992 ?auto_196993 ) ( CLEAR ?auto_196992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_196989 ?auto_196990 ?auto_196991 ?auto_196992 )
      ( MAKE-12PILE ?auto_196989 ?auto_196990 ?auto_196991 ?auto_196992 ?auto_196993 ?auto_196994 ?auto_196995 ?auto_196996 ?auto_196997 ?auto_196998 ?auto_196999 ?auto_197000 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_197013 - BLOCK
      ?auto_197014 - BLOCK
      ?auto_197015 - BLOCK
      ?auto_197016 - BLOCK
      ?auto_197017 - BLOCK
      ?auto_197018 - BLOCK
      ?auto_197019 - BLOCK
      ?auto_197020 - BLOCK
      ?auto_197021 - BLOCK
      ?auto_197022 - BLOCK
      ?auto_197023 - BLOCK
      ?auto_197024 - BLOCK
    )
    :vars
    (
      ?auto_197025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197024 ?auto_197025 ) ( ON-TABLE ?auto_197013 ) ( ON ?auto_197014 ?auto_197013 ) ( not ( = ?auto_197013 ?auto_197014 ) ) ( not ( = ?auto_197013 ?auto_197015 ) ) ( not ( = ?auto_197013 ?auto_197016 ) ) ( not ( = ?auto_197013 ?auto_197017 ) ) ( not ( = ?auto_197013 ?auto_197018 ) ) ( not ( = ?auto_197013 ?auto_197019 ) ) ( not ( = ?auto_197013 ?auto_197020 ) ) ( not ( = ?auto_197013 ?auto_197021 ) ) ( not ( = ?auto_197013 ?auto_197022 ) ) ( not ( = ?auto_197013 ?auto_197023 ) ) ( not ( = ?auto_197013 ?auto_197024 ) ) ( not ( = ?auto_197013 ?auto_197025 ) ) ( not ( = ?auto_197014 ?auto_197015 ) ) ( not ( = ?auto_197014 ?auto_197016 ) ) ( not ( = ?auto_197014 ?auto_197017 ) ) ( not ( = ?auto_197014 ?auto_197018 ) ) ( not ( = ?auto_197014 ?auto_197019 ) ) ( not ( = ?auto_197014 ?auto_197020 ) ) ( not ( = ?auto_197014 ?auto_197021 ) ) ( not ( = ?auto_197014 ?auto_197022 ) ) ( not ( = ?auto_197014 ?auto_197023 ) ) ( not ( = ?auto_197014 ?auto_197024 ) ) ( not ( = ?auto_197014 ?auto_197025 ) ) ( not ( = ?auto_197015 ?auto_197016 ) ) ( not ( = ?auto_197015 ?auto_197017 ) ) ( not ( = ?auto_197015 ?auto_197018 ) ) ( not ( = ?auto_197015 ?auto_197019 ) ) ( not ( = ?auto_197015 ?auto_197020 ) ) ( not ( = ?auto_197015 ?auto_197021 ) ) ( not ( = ?auto_197015 ?auto_197022 ) ) ( not ( = ?auto_197015 ?auto_197023 ) ) ( not ( = ?auto_197015 ?auto_197024 ) ) ( not ( = ?auto_197015 ?auto_197025 ) ) ( not ( = ?auto_197016 ?auto_197017 ) ) ( not ( = ?auto_197016 ?auto_197018 ) ) ( not ( = ?auto_197016 ?auto_197019 ) ) ( not ( = ?auto_197016 ?auto_197020 ) ) ( not ( = ?auto_197016 ?auto_197021 ) ) ( not ( = ?auto_197016 ?auto_197022 ) ) ( not ( = ?auto_197016 ?auto_197023 ) ) ( not ( = ?auto_197016 ?auto_197024 ) ) ( not ( = ?auto_197016 ?auto_197025 ) ) ( not ( = ?auto_197017 ?auto_197018 ) ) ( not ( = ?auto_197017 ?auto_197019 ) ) ( not ( = ?auto_197017 ?auto_197020 ) ) ( not ( = ?auto_197017 ?auto_197021 ) ) ( not ( = ?auto_197017 ?auto_197022 ) ) ( not ( = ?auto_197017 ?auto_197023 ) ) ( not ( = ?auto_197017 ?auto_197024 ) ) ( not ( = ?auto_197017 ?auto_197025 ) ) ( not ( = ?auto_197018 ?auto_197019 ) ) ( not ( = ?auto_197018 ?auto_197020 ) ) ( not ( = ?auto_197018 ?auto_197021 ) ) ( not ( = ?auto_197018 ?auto_197022 ) ) ( not ( = ?auto_197018 ?auto_197023 ) ) ( not ( = ?auto_197018 ?auto_197024 ) ) ( not ( = ?auto_197018 ?auto_197025 ) ) ( not ( = ?auto_197019 ?auto_197020 ) ) ( not ( = ?auto_197019 ?auto_197021 ) ) ( not ( = ?auto_197019 ?auto_197022 ) ) ( not ( = ?auto_197019 ?auto_197023 ) ) ( not ( = ?auto_197019 ?auto_197024 ) ) ( not ( = ?auto_197019 ?auto_197025 ) ) ( not ( = ?auto_197020 ?auto_197021 ) ) ( not ( = ?auto_197020 ?auto_197022 ) ) ( not ( = ?auto_197020 ?auto_197023 ) ) ( not ( = ?auto_197020 ?auto_197024 ) ) ( not ( = ?auto_197020 ?auto_197025 ) ) ( not ( = ?auto_197021 ?auto_197022 ) ) ( not ( = ?auto_197021 ?auto_197023 ) ) ( not ( = ?auto_197021 ?auto_197024 ) ) ( not ( = ?auto_197021 ?auto_197025 ) ) ( not ( = ?auto_197022 ?auto_197023 ) ) ( not ( = ?auto_197022 ?auto_197024 ) ) ( not ( = ?auto_197022 ?auto_197025 ) ) ( not ( = ?auto_197023 ?auto_197024 ) ) ( not ( = ?auto_197023 ?auto_197025 ) ) ( not ( = ?auto_197024 ?auto_197025 ) ) ( ON ?auto_197023 ?auto_197024 ) ( ON ?auto_197022 ?auto_197023 ) ( ON ?auto_197021 ?auto_197022 ) ( ON ?auto_197020 ?auto_197021 ) ( ON ?auto_197019 ?auto_197020 ) ( ON ?auto_197018 ?auto_197019 ) ( ON ?auto_197017 ?auto_197018 ) ( ON ?auto_197016 ?auto_197017 ) ( CLEAR ?auto_197014 ) ( ON ?auto_197015 ?auto_197016 ) ( CLEAR ?auto_197015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197013 ?auto_197014 ?auto_197015 )
      ( MAKE-12PILE ?auto_197013 ?auto_197014 ?auto_197015 ?auto_197016 ?auto_197017 ?auto_197018 ?auto_197019 ?auto_197020 ?auto_197021 ?auto_197022 ?auto_197023 ?auto_197024 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_197038 - BLOCK
      ?auto_197039 - BLOCK
      ?auto_197040 - BLOCK
      ?auto_197041 - BLOCK
      ?auto_197042 - BLOCK
      ?auto_197043 - BLOCK
      ?auto_197044 - BLOCK
      ?auto_197045 - BLOCK
      ?auto_197046 - BLOCK
      ?auto_197047 - BLOCK
      ?auto_197048 - BLOCK
      ?auto_197049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197049 ) ( ON-TABLE ?auto_197038 ) ( ON ?auto_197039 ?auto_197038 ) ( not ( = ?auto_197038 ?auto_197039 ) ) ( not ( = ?auto_197038 ?auto_197040 ) ) ( not ( = ?auto_197038 ?auto_197041 ) ) ( not ( = ?auto_197038 ?auto_197042 ) ) ( not ( = ?auto_197038 ?auto_197043 ) ) ( not ( = ?auto_197038 ?auto_197044 ) ) ( not ( = ?auto_197038 ?auto_197045 ) ) ( not ( = ?auto_197038 ?auto_197046 ) ) ( not ( = ?auto_197038 ?auto_197047 ) ) ( not ( = ?auto_197038 ?auto_197048 ) ) ( not ( = ?auto_197038 ?auto_197049 ) ) ( not ( = ?auto_197039 ?auto_197040 ) ) ( not ( = ?auto_197039 ?auto_197041 ) ) ( not ( = ?auto_197039 ?auto_197042 ) ) ( not ( = ?auto_197039 ?auto_197043 ) ) ( not ( = ?auto_197039 ?auto_197044 ) ) ( not ( = ?auto_197039 ?auto_197045 ) ) ( not ( = ?auto_197039 ?auto_197046 ) ) ( not ( = ?auto_197039 ?auto_197047 ) ) ( not ( = ?auto_197039 ?auto_197048 ) ) ( not ( = ?auto_197039 ?auto_197049 ) ) ( not ( = ?auto_197040 ?auto_197041 ) ) ( not ( = ?auto_197040 ?auto_197042 ) ) ( not ( = ?auto_197040 ?auto_197043 ) ) ( not ( = ?auto_197040 ?auto_197044 ) ) ( not ( = ?auto_197040 ?auto_197045 ) ) ( not ( = ?auto_197040 ?auto_197046 ) ) ( not ( = ?auto_197040 ?auto_197047 ) ) ( not ( = ?auto_197040 ?auto_197048 ) ) ( not ( = ?auto_197040 ?auto_197049 ) ) ( not ( = ?auto_197041 ?auto_197042 ) ) ( not ( = ?auto_197041 ?auto_197043 ) ) ( not ( = ?auto_197041 ?auto_197044 ) ) ( not ( = ?auto_197041 ?auto_197045 ) ) ( not ( = ?auto_197041 ?auto_197046 ) ) ( not ( = ?auto_197041 ?auto_197047 ) ) ( not ( = ?auto_197041 ?auto_197048 ) ) ( not ( = ?auto_197041 ?auto_197049 ) ) ( not ( = ?auto_197042 ?auto_197043 ) ) ( not ( = ?auto_197042 ?auto_197044 ) ) ( not ( = ?auto_197042 ?auto_197045 ) ) ( not ( = ?auto_197042 ?auto_197046 ) ) ( not ( = ?auto_197042 ?auto_197047 ) ) ( not ( = ?auto_197042 ?auto_197048 ) ) ( not ( = ?auto_197042 ?auto_197049 ) ) ( not ( = ?auto_197043 ?auto_197044 ) ) ( not ( = ?auto_197043 ?auto_197045 ) ) ( not ( = ?auto_197043 ?auto_197046 ) ) ( not ( = ?auto_197043 ?auto_197047 ) ) ( not ( = ?auto_197043 ?auto_197048 ) ) ( not ( = ?auto_197043 ?auto_197049 ) ) ( not ( = ?auto_197044 ?auto_197045 ) ) ( not ( = ?auto_197044 ?auto_197046 ) ) ( not ( = ?auto_197044 ?auto_197047 ) ) ( not ( = ?auto_197044 ?auto_197048 ) ) ( not ( = ?auto_197044 ?auto_197049 ) ) ( not ( = ?auto_197045 ?auto_197046 ) ) ( not ( = ?auto_197045 ?auto_197047 ) ) ( not ( = ?auto_197045 ?auto_197048 ) ) ( not ( = ?auto_197045 ?auto_197049 ) ) ( not ( = ?auto_197046 ?auto_197047 ) ) ( not ( = ?auto_197046 ?auto_197048 ) ) ( not ( = ?auto_197046 ?auto_197049 ) ) ( not ( = ?auto_197047 ?auto_197048 ) ) ( not ( = ?auto_197047 ?auto_197049 ) ) ( not ( = ?auto_197048 ?auto_197049 ) ) ( ON ?auto_197048 ?auto_197049 ) ( ON ?auto_197047 ?auto_197048 ) ( ON ?auto_197046 ?auto_197047 ) ( ON ?auto_197045 ?auto_197046 ) ( ON ?auto_197044 ?auto_197045 ) ( ON ?auto_197043 ?auto_197044 ) ( ON ?auto_197042 ?auto_197043 ) ( ON ?auto_197041 ?auto_197042 ) ( CLEAR ?auto_197039 ) ( ON ?auto_197040 ?auto_197041 ) ( CLEAR ?auto_197040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197038 ?auto_197039 ?auto_197040 )
      ( MAKE-12PILE ?auto_197038 ?auto_197039 ?auto_197040 ?auto_197041 ?auto_197042 ?auto_197043 ?auto_197044 ?auto_197045 ?auto_197046 ?auto_197047 ?auto_197048 ?auto_197049 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_197062 - BLOCK
      ?auto_197063 - BLOCK
      ?auto_197064 - BLOCK
      ?auto_197065 - BLOCK
      ?auto_197066 - BLOCK
      ?auto_197067 - BLOCK
      ?auto_197068 - BLOCK
      ?auto_197069 - BLOCK
      ?auto_197070 - BLOCK
      ?auto_197071 - BLOCK
      ?auto_197072 - BLOCK
      ?auto_197073 - BLOCK
    )
    :vars
    (
      ?auto_197074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197073 ?auto_197074 ) ( ON-TABLE ?auto_197062 ) ( not ( = ?auto_197062 ?auto_197063 ) ) ( not ( = ?auto_197062 ?auto_197064 ) ) ( not ( = ?auto_197062 ?auto_197065 ) ) ( not ( = ?auto_197062 ?auto_197066 ) ) ( not ( = ?auto_197062 ?auto_197067 ) ) ( not ( = ?auto_197062 ?auto_197068 ) ) ( not ( = ?auto_197062 ?auto_197069 ) ) ( not ( = ?auto_197062 ?auto_197070 ) ) ( not ( = ?auto_197062 ?auto_197071 ) ) ( not ( = ?auto_197062 ?auto_197072 ) ) ( not ( = ?auto_197062 ?auto_197073 ) ) ( not ( = ?auto_197062 ?auto_197074 ) ) ( not ( = ?auto_197063 ?auto_197064 ) ) ( not ( = ?auto_197063 ?auto_197065 ) ) ( not ( = ?auto_197063 ?auto_197066 ) ) ( not ( = ?auto_197063 ?auto_197067 ) ) ( not ( = ?auto_197063 ?auto_197068 ) ) ( not ( = ?auto_197063 ?auto_197069 ) ) ( not ( = ?auto_197063 ?auto_197070 ) ) ( not ( = ?auto_197063 ?auto_197071 ) ) ( not ( = ?auto_197063 ?auto_197072 ) ) ( not ( = ?auto_197063 ?auto_197073 ) ) ( not ( = ?auto_197063 ?auto_197074 ) ) ( not ( = ?auto_197064 ?auto_197065 ) ) ( not ( = ?auto_197064 ?auto_197066 ) ) ( not ( = ?auto_197064 ?auto_197067 ) ) ( not ( = ?auto_197064 ?auto_197068 ) ) ( not ( = ?auto_197064 ?auto_197069 ) ) ( not ( = ?auto_197064 ?auto_197070 ) ) ( not ( = ?auto_197064 ?auto_197071 ) ) ( not ( = ?auto_197064 ?auto_197072 ) ) ( not ( = ?auto_197064 ?auto_197073 ) ) ( not ( = ?auto_197064 ?auto_197074 ) ) ( not ( = ?auto_197065 ?auto_197066 ) ) ( not ( = ?auto_197065 ?auto_197067 ) ) ( not ( = ?auto_197065 ?auto_197068 ) ) ( not ( = ?auto_197065 ?auto_197069 ) ) ( not ( = ?auto_197065 ?auto_197070 ) ) ( not ( = ?auto_197065 ?auto_197071 ) ) ( not ( = ?auto_197065 ?auto_197072 ) ) ( not ( = ?auto_197065 ?auto_197073 ) ) ( not ( = ?auto_197065 ?auto_197074 ) ) ( not ( = ?auto_197066 ?auto_197067 ) ) ( not ( = ?auto_197066 ?auto_197068 ) ) ( not ( = ?auto_197066 ?auto_197069 ) ) ( not ( = ?auto_197066 ?auto_197070 ) ) ( not ( = ?auto_197066 ?auto_197071 ) ) ( not ( = ?auto_197066 ?auto_197072 ) ) ( not ( = ?auto_197066 ?auto_197073 ) ) ( not ( = ?auto_197066 ?auto_197074 ) ) ( not ( = ?auto_197067 ?auto_197068 ) ) ( not ( = ?auto_197067 ?auto_197069 ) ) ( not ( = ?auto_197067 ?auto_197070 ) ) ( not ( = ?auto_197067 ?auto_197071 ) ) ( not ( = ?auto_197067 ?auto_197072 ) ) ( not ( = ?auto_197067 ?auto_197073 ) ) ( not ( = ?auto_197067 ?auto_197074 ) ) ( not ( = ?auto_197068 ?auto_197069 ) ) ( not ( = ?auto_197068 ?auto_197070 ) ) ( not ( = ?auto_197068 ?auto_197071 ) ) ( not ( = ?auto_197068 ?auto_197072 ) ) ( not ( = ?auto_197068 ?auto_197073 ) ) ( not ( = ?auto_197068 ?auto_197074 ) ) ( not ( = ?auto_197069 ?auto_197070 ) ) ( not ( = ?auto_197069 ?auto_197071 ) ) ( not ( = ?auto_197069 ?auto_197072 ) ) ( not ( = ?auto_197069 ?auto_197073 ) ) ( not ( = ?auto_197069 ?auto_197074 ) ) ( not ( = ?auto_197070 ?auto_197071 ) ) ( not ( = ?auto_197070 ?auto_197072 ) ) ( not ( = ?auto_197070 ?auto_197073 ) ) ( not ( = ?auto_197070 ?auto_197074 ) ) ( not ( = ?auto_197071 ?auto_197072 ) ) ( not ( = ?auto_197071 ?auto_197073 ) ) ( not ( = ?auto_197071 ?auto_197074 ) ) ( not ( = ?auto_197072 ?auto_197073 ) ) ( not ( = ?auto_197072 ?auto_197074 ) ) ( not ( = ?auto_197073 ?auto_197074 ) ) ( ON ?auto_197072 ?auto_197073 ) ( ON ?auto_197071 ?auto_197072 ) ( ON ?auto_197070 ?auto_197071 ) ( ON ?auto_197069 ?auto_197070 ) ( ON ?auto_197068 ?auto_197069 ) ( ON ?auto_197067 ?auto_197068 ) ( ON ?auto_197066 ?auto_197067 ) ( ON ?auto_197065 ?auto_197066 ) ( ON ?auto_197064 ?auto_197065 ) ( CLEAR ?auto_197062 ) ( ON ?auto_197063 ?auto_197064 ) ( CLEAR ?auto_197063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197062 ?auto_197063 )
      ( MAKE-12PILE ?auto_197062 ?auto_197063 ?auto_197064 ?auto_197065 ?auto_197066 ?auto_197067 ?auto_197068 ?auto_197069 ?auto_197070 ?auto_197071 ?auto_197072 ?auto_197073 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_197087 - BLOCK
      ?auto_197088 - BLOCK
      ?auto_197089 - BLOCK
      ?auto_197090 - BLOCK
      ?auto_197091 - BLOCK
      ?auto_197092 - BLOCK
      ?auto_197093 - BLOCK
      ?auto_197094 - BLOCK
      ?auto_197095 - BLOCK
      ?auto_197096 - BLOCK
      ?auto_197097 - BLOCK
      ?auto_197098 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197098 ) ( ON-TABLE ?auto_197087 ) ( not ( = ?auto_197087 ?auto_197088 ) ) ( not ( = ?auto_197087 ?auto_197089 ) ) ( not ( = ?auto_197087 ?auto_197090 ) ) ( not ( = ?auto_197087 ?auto_197091 ) ) ( not ( = ?auto_197087 ?auto_197092 ) ) ( not ( = ?auto_197087 ?auto_197093 ) ) ( not ( = ?auto_197087 ?auto_197094 ) ) ( not ( = ?auto_197087 ?auto_197095 ) ) ( not ( = ?auto_197087 ?auto_197096 ) ) ( not ( = ?auto_197087 ?auto_197097 ) ) ( not ( = ?auto_197087 ?auto_197098 ) ) ( not ( = ?auto_197088 ?auto_197089 ) ) ( not ( = ?auto_197088 ?auto_197090 ) ) ( not ( = ?auto_197088 ?auto_197091 ) ) ( not ( = ?auto_197088 ?auto_197092 ) ) ( not ( = ?auto_197088 ?auto_197093 ) ) ( not ( = ?auto_197088 ?auto_197094 ) ) ( not ( = ?auto_197088 ?auto_197095 ) ) ( not ( = ?auto_197088 ?auto_197096 ) ) ( not ( = ?auto_197088 ?auto_197097 ) ) ( not ( = ?auto_197088 ?auto_197098 ) ) ( not ( = ?auto_197089 ?auto_197090 ) ) ( not ( = ?auto_197089 ?auto_197091 ) ) ( not ( = ?auto_197089 ?auto_197092 ) ) ( not ( = ?auto_197089 ?auto_197093 ) ) ( not ( = ?auto_197089 ?auto_197094 ) ) ( not ( = ?auto_197089 ?auto_197095 ) ) ( not ( = ?auto_197089 ?auto_197096 ) ) ( not ( = ?auto_197089 ?auto_197097 ) ) ( not ( = ?auto_197089 ?auto_197098 ) ) ( not ( = ?auto_197090 ?auto_197091 ) ) ( not ( = ?auto_197090 ?auto_197092 ) ) ( not ( = ?auto_197090 ?auto_197093 ) ) ( not ( = ?auto_197090 ?auto_197094 ) ) ( not ( = ?auto_197090 ?auto_197095 ) ) ( not ( = ?auto_197090 ?auto_197096 ) ) ( not ( = ?auto_197090 ?auto_197097 ) ) ( not ( = ?auto_197090 ?auto_197098 ) ) ( not ( = ?auto_197091 ?auto_197092 ) ) ( not ( = ?auto_197091 ?auto_197093 ) ) ( not ( = ?auto_197091 ?auto_197094 ) ) ( not ( = ?auto_197091 ?auto_197095 ) ) ( not ( = ?auto_197091 ?auto_197096 ) ) ( not ( = ?auto_197091 ?auto_197097 ) ) ( not ( = ?auto_197091 ?auto_197098 ) ) ( not ( = ?auto_197092 ?auto_197093 ) ) ( not ( = ?auto_197092 ?auto_197094 ) ) ( not ( = ?auto_197092 ?auto_197095 ) ) ( not ( = ?auto_197092 ?auto_197096 ) ) ( not ( = ?auto_197092 ?auto_197097 ) ) ( not ( = ?auto_197092 ?auto_197098 ) ) ( not ( = ?auto_197093 ?auto_197094 ) ) ( not ( = ?auto_197093 ?auto_197095 ) ) ( not ( = ?auto_197093 ?auto_197096 ) ) ( not ( = ?auto_197093 ?auto_197097 ) ) ( not ( = ?auto_197093 ?auto_197098 ) ) ( not ( = ?auto_197094 ?auto_197095 ) ) ( not ( = ?auto_197094 ?auto_197096 ) ) ( not ( = ?auto_197094 ?auto_197097 ) ) ( not ( = ?auto_197094 ?auto_197098 ) ) ( not ( = ?auto_197095 ?auto_197096 ) ) ( not ( = ?auto_197095 ?auto_197097 ) ) ( not ( = ?auto_197095 ?auto_197098 ) ) ( not ( = ?auto_197096 ?auto_197097 ) ) ( not ( = ?auto_197096 ?auto_197098 ) ) ( not ( = ?auto_197097 ?auto_197098 ) ) ( ON ?auto_197097 ?auto_197098 ) ( ON ?auto_197096 ?auto_197097 ) ( ON ?auto_197095 ?auto_197096 ) ( ON ?auto_197094 ?auto_197095 ) ( ON ?auto_197093 ?auto_197094 ) ( ON ?auto_197092 ?auto_197093 ) ( ON ?auto_197091 ?auto_197092 ) ( ON ?auto_197090 ?auto_197091 ) ( ON ?auto_197089 ?auto_197090 ) ( CLEAR ?auto_197087 ) ( ON ?auto_197088 ?auto_197089 ) ( CLEAR ?auto_197088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197087 ?auto_197088 )
      ( MAKE-12PILE ?auto_197087 ?auto_197088 ?auto_197089 ?auto_197090 ?auto_197091 ?auto_197092 ?auto_197093 ?auto_197094 ?auto_197095 ?auto_197096 ?auto_197097 ?auto_197098 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_197111 - BLOCK
      ?auto_197112 - BLOCK
      ?auto_197113 - BLOCK
      ?auto_197114 - BLOCK
      ?auto_197115 - BLOCK
      ?auto_197116 - BLOCK
      ?auto_197117 - BLOCK
      ?auto_197118 - BLOCK
      ?auto_197119 - BLOCK
      ?auto_197120 - BLOCK
      ?auto_197121 - BLOCK
      ?auto_197122 - BLOCK
    )
    :vars
    (
      ?auto_197123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197122 ?auto_197123 ) ( not ( = ?auto_197111 ?auto_197112 ) ) ( not ( = ?auto_197111 ?auto_197113 ) ) ( not ( = ?auto_197111 ?auto_197114 ) ) ( not ( = ?auto_197111 ?auto_197115 ) ) ( not ( = ?auto_197111 ?auto_197116 ) ) ( not ( = ?auto_197111 ?auto_197117 ) ) ( not ( = ?auto_197111 ?auto_197118 ) ) ( not ( = ?auto_197111 ?auto_197119 ) ) ( not ( = ?auto_197111 ?auto_197120 ) ) ( not ( = ?auto_197111 ?auto_197121 ) ) ( not ( = ?auto_197111 ?auto_197122 ) ) ( not ( = ?auto_197111 ?auto_197123 ) ) ( not ( = ?auto_197112 ?auto_197113 ) ) ( not ( = ?auto_197112 ?auto_197114 ) ) ( not ( = ?auto_197112 ?auto_197115 ) ) ( not ( = ?auto_197112 ?auto_197116 ) ) ( not ( = ?auto_197112 ?auto_197117 ) ) ( not ( = ?auto_197112 ?auto_197118 ) ) ( not ( = ?auto_197112 ?auto_197119 ) ) ( not ( = ?auto_197112 ?auto_197120 ) ) ( not ( = ?auto_197112 ?auto_197121 ) ) ( not ( = ?auto_197112 ?auto_197122 ) ) ( not ( = ?auto_197112 ?auto_197123 ) ) ( not ( = ?auto_197113 ?auto_197114 ) ) ( not ( = ?auto_197113 ?auto_197115 ) ) ( not ( = ?auto_197113 ?auto_197116 ) ) ( not ( = ?auto_197113 ?auto_197117 ) ) ( not ( = ?auto_197113 ?auto_197118 ) ) ( not ( = ?auto_197113 ?auto_197119 ) ) ( not ( = ?auto_197113 ?auto_197120 ) ) ( not ( = ?auto_197113 ?auto_197121 ) ) ( not ( = ?auto_197113 ?auto_197122 ) ) ( not ( = ?auto_197113 ?auto_197123 ) ) ( not ( = ?auto_197114 ?auto_197115 ) ) ( not ( = ?auto_197114 ?auto_197116 ) ) ( not ( = ?auto_197114 ?auto_197117 ) ) ( not ( = ?auto_197114 ?auto_197118 ) ) ( not ( = ?auto_197114 ?auto_197119 ) ) ( not ( = ?auto_197114 ?auto_197120 ) ) ( not ( = ?auto_197114 ?auto_197121 ) ) ( not ( = ?auto_197114 ?auto_197122 ) ) ( not ( = ?auto_197114 ?auto_197123 ) ) ( not ( = ?auto_197115 ?auto_197116 ) ) ( not ( = ?auto_197115 ?auto_197117 ) ) ( not ( = ?auto_197115 ?auto_197118 ) ) ( not ( = ?auto_197115 ?auto_197119 ) ) ( not ( = ?auto_197115 ?auto_197120 ) ) ( not ( = ?auto_197115 ?auto_197121 ) ) ( not ( = ?auto_197115 ?auto_197122 ) ) ( not ( = ?auto_197115 ?auto_197123 ) ) ( not ( = ?auto_197116 ?auto_197117 ) ) ( not ( = ?auto_197116 ?auto_197118 ) ) ( not ( = ?auto_197116 ?auto_197119 ) ) ( not ( = ?auto_197116 ?auto_197120 ) ) ( not ( = ?auto_197116 ?auto_197121 ) ) ( not ( = ?auto_197116 ?auto_197122 ) ) ( not ( = ?auto_197116 ?auto_197123 ) ) ( not ( = ?auto_197117 ?auto_197118 ) ) ( not ( = ?auto_197117 ?auto_197119 ) ) ( not ( = ?auto_197117 ?auto_197120 ) ) ( not ( = ?auto_197117 ?auto_197121 ) ) ( not ( = ?auto_197117 ?auto_197122 ) ) ( not ( = ?auto_197117 ?auto_197123 ) ) ( not ( = ?auto_197118 ?auto_197119 ) ) ( not ( = ?auto_197118 ?auto_197120 ) ) ( not ( = ?auto_197118 ?auto_197121 ) ) ( not ( = ?auto_197118 ?auto_197122 ) ) ( not ( = ?auto_197118 ?auto_197123 ) ) ( not ( = ?auto_197119 ?auto_197120 ) ) ( not ( = ?auto_197119 ?auto_197121 ) ) ( not ( = ?auto_197119 ?auto_197122 ) ) ( not ( = ?auto_197119 ?auto_197123 ) ) ( not ( = ?auto_197120 ?auto_197121 ) ) ( not ( = ?auto_197120 ?auto_197122 ) ) ( not ( = ?auto_197120 ?auto_197123 ) ) ( not ( = ?auto_197121 ?auto_197122 ) ) ( not ( = ?auto_197121 ?auto_197123 ) ) ( not ( = ?auto_197122 ?auto_197123 ) ) ( ON ?auto_197121 ?auto_197122 ) ( ON ?auto_197120 ?auto_197121 ) ( ON ?auto_197119 ?auto_197120 ) ( ON ?auto_197118 ?auto_197119 ) ( ON ?auto_197117 ?auto_197118 ) ( ON ?auto_197116 ?auto_197117 ) ( ON ?auto_197115 ?auto_197116 ) ( ON ?auto_197114 ?auto_197115 ) ( ON ?auto_197113 ?auto_197114 ) ( ON ?auto_197112 ?auto_197113 ) ( ON ?auto_197111 ?auto_197112 ) ( CLEAR ?auto_197111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197111 )
      ( MAKE-12PILE ?auto_197111 ?auto_197112 ?auto_197113 ?auto_197114 ?auto_197115 ?auto_197116 ?auto_197117 ?auto_197118 ?auto_197119 ?auto_197120 ?auto_197121 ?auto_197122 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_197136 - BLOCK
      ?auto_197137 - BLOCK
      ?auto_197138 - BLOCK
      ?auto_197139 - BLOCK
      ?auto_197140 - BLOCK
      ?auto_197141 - BLOCK
      ?auto_197142 - BLOCK
      ?auto_197143 - BLOCK
      ?auto_197144 - BLOCK
      ?auto_197145 - BLOCK
      ?auto_197146 - BLOCK
      ?auto_197147 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197147 ) ( not ( = ?auto_197136 ?auto_197137 ) ) ( not ( = ?auto_197136 ?auto_197138 ) ) ( not ( = ?auto_197136 ?auto_197139 ) ) ( not ( = ?auto_197136 ?auto_197140 ) ) ( not ( = ?auto_197136 ?auto_197141 ) ) ( not ( = ?auto_197136 ?auto_197142 ) ) ( not ( = ?auto_197136 ?auto_197143 ) ) ( not ( = ?auto_197136 ?auto_197144 ) ) ( not ( = ?auto_197136 ?auto_197145 ) ) ( not ( = ?auto_197136 ?auto_197146 ) ) ( not ( = ?auto_197136 ?auto_197147 ) ) ( not ( = ?auto_197137 ?auto_197138 ) ) ( not ( = ?auto_197137 ?auto_197139 ) ) ( not ( = ?auto_197137 ?auto_197140 ) ) ( not ( = ?auto_197137 ?auto_197141 ) ) ( not ( = ?auto_197137 ?auto_197142 ) ) ( not ( = ?auto_197137 ?auto_197143 ) ) ( not ( = ?auto_197137 ?auto_197144 ) ) ( not ( = ?auto_197137 ?auto_197145 ) ) ( not ( = ?auto_197137 ?auto_197146 ) ) ( not ( = ?auto_197137 ?auto_197147 ) ) ( not ( = ?auto_197138 ?auto_197139 ) ) ( not ( = ?auto_197138 ?auto_197140 ) ) ( not ( = ?auto_197138 ?auto_197141 ) ) ( not ( = ?auto_197138 ?auto_197142 ) ) ( not ( = ?auto_197138 ?auto_197143 ) ) ( not ( = ?auto_197138 ?auto_197144 ) ) ( not ( = ?auto_197138 ?auto_197145 ) ) ( not ( = ?auto_197138 ?auto_197146 ) ) ( not ( = ?auto_197138 ?auto_197147 ) ) ( not ( = ?auto_197139 ?auto_197140 ) ) ( not ( = ?auto_197139 ?auto_197141 ) ) ( not ( = ?auto_197139 ?auto_197142 ) ) ( not ( = ?auto_197139 ?auto_197143 ) ) ( not ( = ?auto_197139 ?auto_197144 ) ) ( not ( = ?auto_197139 ?auto_197145 ) ) ( not ( = ?auto_197139 ?auto_197146 ) ) ( not ( = ?auto_197139 ?auto_197147 ) ) ( not ( = ?auto_197140 ?auto_197141 ) ) ( not ( = ?auto_197140 ?auto_197142 ) ) ( not ( = ?auto_197140 ?auto_197143 ) ) ( not ( = ?auto_197140 ?auto_197144 ) ) ( not ( = ?auto_197140 ?auto_197145 ) ) ( not ( = ?auto_197140 ?auto_197146 ) ) ( not ( = ?auto_197140 ?auto_197147 ) ) ( not ( = ?auto_197141 ?auto_197142 ) ) ( not ( = ?auto_197141 ?auto_197143 ) ) ( not ( = ?auto_197141 ?auto_197144 ) ) ( not ( = ?auto_197141 ?auto_197145 ) ) ( not ( = ?auto_197141 ?auto_197146 ) ) ( not ( = ?auto_197141 ?auto_197147 ) ) ( not ( = ?auto_197142 ?auto_197143 ) ) ( not ( = ?auto_197142 ?auto_197144 ) ) ( not ( = ?auto_197142 ?auto_197145 ) ) ( not ( = ?auto_197142 ?auto_197146 ) ) ( not ( = ?auto_197142 ?auto_197147 ) ) ( not ( = ?auto_197143 ?auto_197144 ) ) ( not ( = ?auto_197143 ?auto_197145 ) ) ( not ( = ?auto_197143 ?auto_197146 ) ) ( not ( = ?auto_197143 ?auto_197147 ) ) ( not ( = ?auto_197144 ?auto_197145 ) ) ( not ( = ?auto_197144 ?auto_197146 ) ) ( not ( = ?auto_197144 ?auto_197147 ) ) ( not ( = ?auto_197145 ?auto_197146 ) ) ( not ( = ?auto_197145 ?auto_197147 ) ) ( not ( = ?auto_197146 ?auto_197147 ) ) ( ON ?auto_197146 ?auto_197147 ) ( ON ?auto_197145 ?auto_197146 ) ( ON ?auto_197144 ?auto_197145 ) ( ON ?auto_197143 ?auto_197144 ) ( ON ?auto_197142 ?auto_197143 ) ( ON ?auto_197141 ?auto_197142 ) ( ON ?auto_197140 ?auto_197141 ) ( ON ?auto_197139 ?auto_197140 ) ( ON ?auto_197138 ?auto_197139 ) ( ON ?auto_197137 ?auto_197138 ) ( ON ?auto_197136 ?auto_197137 ) ( CLEAR ?auto_197136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197136 )
      ( MAKE-12PILE ?auto_197136 ?auto_197137 ?auto_197138 ?auto_197139 ?auto_197140 ?auto_197141 ?auto_197142 ?auto_197143 ?auto_197144 ?auto_197145 ?auto_197146 ?auto_197147 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_197160 - BLOCK
      ?auto_197161 - BLOCK
      ?auto_197162 - BLOCK
      ?auto_197163 - BLOCK
      ?auto_197164 - BLOCK
      ?auto_197165 - BLOCK
      ?auto_197166 - BLOCK
      ?auto_197167 - BLOCK
      ?auto_197168 - BLOCK
      ?auto_197169 - BLOCK
      ?auto_197170 - BLOCK
      ?auto_197171 - BLOCK
    )
    :vars
    (
      ?auto_197172 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197160 ?auto_197161 ) ) ( not ( = ?auto_197160 ?auto_197162 ) ) ( not ( = ?auto_197160 ?auto_197163 ) ) ( not ( = ?auto_197160 ?auto_197164 ) ) ( not ( = ?auto_197160 ?auto_197165 ) ) ( not ( = ?auto_197160 ?auto_197166 ) ) ( not ( = ?auto_197160 ?auto_197167 ) ) ( not ( = ?auto_197160 ?auto_197168 ) ) ( not ( = ?auto_197160 ?auto_197169 ) ) ( not ( = ?auto_197160 ?auto_197170 ) ) ( not ( = ?auto_197160 ?auto_197171 ) ) ( not ( = ?auto_197161 ?auto_197162 ) ) ( not ( = ?auto_197161 ?auto_197163 ) ) ( not ( = ?auto_197161 ?auto_197164 ) ) ( not ( = ?auto_197161 ?auto_197165 ) ) ( not ( = ?auto_197161 ?auto_197166 ) ) ( not ( = ?auto_197161 ?auto_197167 ) ) ( not ( = ?auto_197161 ?auto_197168 ) ) ( not ( = ?auto_197161 ?auto_197169 ) ) ( not ( = ?auto_197161 ?auto_197170 ) ) ( not ( = ?auto_197161 ?auto_197171 ) ) ( not ( = ?auto_197162 ?auto_197163 ) ) ( not ( = ?auto_197162 ?auto_197164 ) ) ( not ( = ?auto_197162 ?auto_197165 ) ) ( not ( = ?auto_197162 ?auto_197166 ) ) ( not ( = ?auto_197162 ?auto_197167 ) ) ( not ( = ?auto_197162 ?auto_197168 ) ) ( not ( = ?auto_197162 ?auto_197169 ) ) ( not ( = ?auto_197162 ?auto_197170 ) ) ( not ( = ?auto_197162 ?auto_197171 ) ) ( not ( = ?auto_197163 ?auto_197164 ) ) ( not ( = ?auto_197163 ?auto_197165 ) ) ( not ( = ?auto_197163 ?auto_197166 ) ) ( not ( = ?auto_197163 ?auto_197167 ) ) ( not ( = ?auto_197163 ?auto_197168 ) ) ( not ( = ?auto_197163 ?auto_197169 ) ) ( not ( = ?auto_197163 ?auto_197170 ) ) ( not ( = ?auto_197163 ?auto_197171 ) ) ( not ( = ?auto_197164 ?auto_197165 ) ) ( not ( = ?auto_197164 ?auto_197166 ) ) ( not ( = ?auto_197164 ?auto_197167 ) ) ( not ( = ?auto_197164 ?auto_197168 ) ) ( not ( = ?auto_197164 ?auto_197169 ) ) ( not ( = ?auto_197164 ?auto_197170 ) ) ( not ( = ?auto_197164 ?auto_197171 ) ) ( not ( = ?auto_197165 ?auto_197166 ) ) ( not ( = ?auto_197165 ?auto_197167 ) ) ( not ( = ?auto_197165 ?auto_197168 ) ) ( not ( = ?auto_197165 ?auto_197169 ) ) ( not ( = ?auto_197165 ?auto_197170 ) ) ( not ( = ?auto_197165 ?auto_197171 ) ) ( not ( = ?auto_197166 ?auto_197167 ) ) ( not ( = ?auto_197166 ?auto_197168 ) ) ( not ( = ?auto_197166 ?auto_197169 ) ) ( not ( = ?auto_197166 ?auto_197170 ) ) ( not ( = ?auto_197166 ?auto_197171 ) ) ( not ( = ?auto_197167 ?auto_197168 ) ) ( not ( = ?auto_197167 ?auto_197169 ) ) ( not ( = ?auto_197167 ?auto_197170 ) ) ( not ( = ?auto_197167 ?auto_197171 ) ) ( not ( = ?auto_197168 ?auto_197169 ) ) ( not ( = ?auto_197168 ?auto_197170 ) ) ( not ( = ?auto_197168 ?auto_197171 ) ) ( not ( = ?auto_197169 ?auto_197170 ) ) ( not ( = ?auto_197169 ?auto_197171 ) ) ( not ( = ?auto_197170 ?auto_197171 ) ) ( ON ?auto_197160 ?auto_197172 ) ( not ( = ?auto_197171 ?auto_197172 ) ) ( not ( = ?auto_197170 ?auto_197172 ) ) ( not ( = ?auto_197169 ?auto_197172 ) ) ( not ( = ?auto_197168 ?auto_197172 ) ) ( not ( = ?auto_197167 ?auto_197172 ) ) ( not ( = ?auto_197166 ?auto_197172 ) ) ( not ( = ?auto_197165 ?auto_197172 ) ) ( not ( = ?auto_197164 ?auto_197172 ) ) ( not ( = ?auto_197163 ?auto_197172 ) ) ( not ( = ?auto_197162 ?auto_197172 ) ) ( not ( = ?auto_197161 ?auto_197172 ) ) ( not ( = ?auto_197160 ?auto_197172 ) ) ( ON ?auto_197161 ?auto_197160 ) ( ON ?auto_197162 ?auto_197161 ) ( ON ?auto_197163 ?auto_197162 ) ( ON ?auto_197164 ?auto_197163 ) ( ON ?auto_197165 ?auto_197164 ) ( ON ?auto_197166 ?auto_197165 ) ( ON ?auto_197167 ?auto_197166 ) ( ON ?auto_197168 ?auto_197167 ) ( ON ?auto_197169 ?auto_197168 ) ( ON ?auto_197170 ?auto_197169 ) ( ON ?auto_197171 ?auto_197170 ) ( CLEAR ?auto_197171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_197171 ?auto_197170 ?auto_197169 ?auto_197168 ?auto_197167 ?auto_197166 ?auto_197165 ?auto_197164 ?auto_197163 ?auto_197162 ?auto_197161 ?auto_197160 )
      ( MAKE-12PILE ?auto_197160 ?auto_197161 ?auto_197162 ?auto_197163 ?auto_197164 ?auto_197165 ?auto_197166 ?auto_197167 ?auto_197168 ?auto_197169 ?auto_197170 ?auto_197171 ) )
  )

)

