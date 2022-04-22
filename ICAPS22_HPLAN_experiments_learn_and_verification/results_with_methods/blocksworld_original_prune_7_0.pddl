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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_66447 - BLOCK
      ?auto_66448 - BLOCK
      ?auto_66449 - BLOCK
      ?auto_66450 - BLOCK
      ?auto_66451 - BLOCK
      ?auto_66452 - BLOCK
      ?auto_66453 - BLOCK
    )
    :vars
    (
      ?auto_66454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66454 ?auto_66453 ) ( CLEAR ?auto_66454 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66447 ) ( ON ?auto_66448 ?auto_66447 ) ( ON ?auto_66449 ?auto_66448 ) ( ON ?auto_66450 ?auto_66449 ) ( ON ?auto_66451 ?auto_66450 ) ( ON ?auto_66452 ?auto_66451 ) ( ON ?auto_66453 ?auto_66452 ) ( not ( = ?auto_66447 ?auto_66448 ) ) ( not ( = ?auto_66447 ?auto_66449 ) ) ( not ( = ?auto_66447 ?auto_66450 ) ) ( not ( = ?auto_66447 ?auto_66451 ) ) ( not ( = ?auto_66447 ?auto_66452 ) ) ( not ( = ?auto_66447 ?auto_66453 ) ) ( not ( = ?auto_66447 ?auto_66454 ) ) ( not ( = ?auto_66448 ?auto_66449 ) ) ( not ( = ?auto_66448 ?auto_66450 ) ) ( not ( = ?auto_66448 ?auto_66451 ) ) ( not ( = ?auto_66448 ?auto_66452 ) ) ( not ( = ?auto_66448 ?auto_66453 ) ) ( not ( = ?auto_66448 ?auto_66454 ) ) ( not ( = ?auto_66449 ?auto_66450 ) ) ( not ( = ?auto_66449 ?auto_66451 ) ) ( not ( = ?auto_66449 ?auto_66452 ) ) ( not ( = ?auto_66449 ?auto_66453 ) ) ( not ( = ?auto_66449 ?auto_66454 ) ) ( not ( = ?auto_66450 ?auto_66451 ) ) ( not ( = ?auto_66450 ?auto_66452 ) ) ( not ( = ?auto_66450 ?auto_66453 ) ) ( not ( = ?auto_66450 ?auto_66454 ) ) ( not ( = ?auto_66451 ?auto_66452 ) ) ( not ( = ?auto_66451 ?auto_66453 ) ) ( not ( = ?auto_66451 ?auto_66454 ) ) ( not ( = ?auto_66452 ?auto_66453 ) ) ( not ( = ?auto_66452 ?auto_66454 ) ) ( not ( = ?auto_66453 ?auto_66454 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66454 ?auto_66453 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66456 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_66456 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_66456 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66457 - BLOCK
    )
    :vars
    (
      ?auto_66458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66457 ?auto_66458 ) ( CLEAR ?auto_66457 ) ( HAND-EMPTY ) ( not ( = ?auto_66457 ?auto_66458 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66457 ?auto_66458 )
      ( MAKE-1PILE ?auto_66457 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66465 - BLOCK
      ?auto_66466 - BLOCK
      ?auto_66467 - BLOCK
      ?auto_66468 - BLOCK
      ?auto_66469 - BLOCK
      ?auto_66470 - BLOCK
    )
    :vars
    (
      ?auto_66471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66471 ?auto_66470 ) ( CLEAR ?auto_66471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66465 ) ( ON ?auto_66466 ?auto_66465 ) ( ON ?auto_66467 ?auto_66466 ) ( ON ?auto_66468 ?auto_66467 ) ( ON ?auto_66469 ?auto_66468 ) ( ON ?auto_66470 ?auto_66469 ) ( not ( = ?auto_66465 ?auto_66466 ) ) ( not ( = ?auto_66465 ?auto_66467 ) ) ( not ( = ?auto_66465 ?auto_66468 ) ) ( not ( = ?auto_66465 ?auto_66469 ) ) ( not ( = ?auto_66465 ?auto_66470 ) ) ( not ( = ?auto_66465 ?auto_66471 ) ) ( not ( = ?auto_66466 ?auto_66467 ) ) ( not ( = ?auto_66466 ?auto_66468 ) ) ( not ( = ?auto_66466 ?auto_66469 ) ) ( not ( = ?auto_66466 ?auto_66470 ) ) ( not ( = ?auto_66466 ?auto_66471 ) ) ( not ( = ?auto_66467 ?auto_66468 ) ) ( not ( = ?auto_66467 ?auto_66469 ) ) ( not ( = ?auto_66467 ?auto_66470 ) ) ( not ( = ?auto_66467 ?auto_66471 ) ) ( not ( = ?auto_66468 ?auto_66469 ) ) ( not ( = ?auto_66468 ?auto_66470 ) ) ( not ( = ?auto_66468 ?auto_66471 ) ) ( not ( = ?auto_66469 ?auto_66470 ) ) ( not ( = ?auto_66469 ?auto_66471 ) ) ( not ( = ?auto_66470 ?auto_66471 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66471 ?auto_66470 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66472 - BLOCK
      ?auto_66473 - BLOCK
      ?auto_66474 - BLOCK
      ?auto_66475 - BLOCK
      ?auto_66476 - BLOCK
      ?auto_66477 - BLOCK
    )
    :vars
    (
      ?auto_66478 - BLOCK
      ?auto_66479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66478 ?auto_66477 ) ( CLEAR ?auto_66478 ) ( ON-TABLE ?auto_66472 ) ( ON ?auto_66473 ?auto_66472 ) ( ON ?auto_66474 ?auto_66473 ) ( ON ?auto_66475 ?auto_66474 ) ( ON ?auto_66476 ?auto_66475 ) ( ON ?auto_66477 ?auto_66476 ) ( not ( = ?auto_66472 ?auto_66473 ) ) ( not ( = ?auto_66472 ?auto_66474 ) ) ( not ( = ?auto_66472 ?auto_66475 ) ) ( not ( = ?auto_66472 ?auto_66476 ) ) ( not ( = ?auto_66472 ?auto_66477 ) ) ( not ( = ?auto_66472 ?auto_66478 ) ) ( not ( = ?auto_66473 ?auto_66474 ) ) ( not ( = ?auto_66473 ?auto_66475 ) ) ( not ( = ?auto_66473 ?auto_66476 ) ) ( not ( = ?auto_66473 ?auto_66477 ) ) ( not ( = ?auto_66473 ?auto_66478 ) ) ( not ( = ?auto_66474 ?auto_66475 ) ) ( not ( = ?auto_66474 ?auto_66476 ) ) ( not ( = ?auto_66474 ?auto_66477 ) ) ( not ( = ?auto_66474 ?auto_66478 ) ) ( not ( = ?auto_66475 ?auto_66476 ) ) ( not ( = ?auto_66475 ?auto_66477 ) ) ( not ( = ?auto_66475 ?auto_66478 ) ) ( not ( = ?auto_66476 ?auto_66477 ) ) ( not ( = ?auto_66476 ?auto_66478 ) ) ( not ( = ?auto_66477 ?auto_66478 ) ) ( HOLDING ?auto_66479 ) ( not ( = ?auto_66472 ?auto_66479 ) ) ( not ( = ?auto_66473 ?auto_66479 ) ) ( not ( = ?auto_66474 ?auto_66479 ) ) ( not ( = ?auto_66475 ?auto_66479 ) ) ( not ( = ?auto_66476 ?auto_66479 ) ) ( not ( = ?auto_66477 ?auto_66479 ) ) ( not ( = ?auto_66478 ?auto_66479 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_66479 )
      ( MAKE-6PILE ?auto_66472 ?auto_66473 ?auto_66474 ?auto_66475 ?auto_66476 ?auto_66477 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66480 - BLOCK
      ?auto_66481 - BLOCK
      ?auto_66482 - BLOCK
      ?auto_66483 - BLOCK
      ?auto_66484 - BLOCK
      ?auto_66485 - BLOCK
    )
    :vars
    (
      ?auto_66486 - BLOCK
      ?auto_66487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66486 ?auto_66485 ) ( ON-TABLE ?auto_66480 ) ( ON ?auto_66481 ?auto_66480 ) ( ON ?auto_66482 ?auto_66481 ) ( ON ?auto_66483 ?auto_66482 ) ( ON ?auto_66484 ?auto_66483 ) ( ON ?auto_66485 ?auto_66484 ) ( not ( = ?auto_66480 ?auto_66481 ) ) ( not ( = ?auto_66480 ?auto_66482 ) ) ( not ( = ?auto_66480 ?auto_66483 ) ) ( not ( = ?auto_66480 ?auto_66484 ) ) ( not ( = ?auto_66480 ?auto_66485 ) ) ( not ( = ?auto_66480 ?auto_66486 ) ) ( not ( = ?auto_66481 ?auto_66482 ) ) ( not ( = ?auto_66481 ?auto_66483 ) ) ( not ( = ?auto_66481 ?auto_66484 ) ) ( not ( = ?auto_66481 ?auto_66485 ) ) ( not ( = ?auto_66481 ?auto_66486 ) ) ( not ( = ?auto_66482 ?auto_66483 ) ) ( not ( = ?auto_66482 ?auto_66484 ) ) ( not ( = ?auto_66482 ?auto_66485 ) ) ( not ( = ?auto_66482 ?auto_66486 ) ) ( not ( = ?auto_66483 ?auto_66484 ) ) ( not ( = ?auto_66483 ?auto_66485 ) ) ( not ( = ?auto_66483 ?auto_66486 ) ) ( not ( = ?auto_66484 ?auto_66485 ) ) ( not ( = ?auto_66484 ?auto_66486 ) ) ( not ( = ?auto_66485 ?auto_66486 ) ) ( not ( = ?auto_66480 ?auto_66487 ) ) ( not ( = ?auto_66481 ?auto_66487 ) ) ( not ( = ?auto_66482 ?auto_66487 ) ) ( not ( = ?auto_66483 ?auto_66487 ) ) ( not ( = ?auto_66484 ?auto_66487 ) ) ( not ( = ?auto_66485 ?auto_66487 ) ) ( not ( = ?auto_66486 ?auto_66487 ) ) ( ON ?auto_66487 ?auto_66486 ) ( CLEAR ?auto_66487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_66480 ?auto_66481 ?auto_66482 ?auto_66483 ?auto_66484 ?auto_66485 ?auto_66486 )
      ( MAKE-6PILE ?auto_66480 ?auto_66481 ?auto_66482 ?auto_66483 ?auto_66484 ?auto_66485 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66490 - BLOCK
      ?auto_66491 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_66491 ) ( CLEAR ?auto_66490 ) ( ON-TABLE ?auto_66490 ) ( not ( = ?auto_66490 ?auto_66491 ) ) )
    :subtasks
    ( ( !STACK ?auto_66491 ?auto_66490 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66492 - BLOCK
      ?auto_66493 - BLOCK
    )
    :vars
    (
      ?auto_66494 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66492 ) ( ON-TABLE ?auto_66492 ) ( not ( = ?auto_66492 ?auto_66493 ) ) ( ON ?auto_66493 ?auto_66494 ) ( CLEAR ?auto_66493 ) ( HAND-EMPTY ) ( not ( = ?auto_66492 ?auto_66494 ) ) ( not ( = ?auto_66493 ?auto_66494 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66493 ?auto_66494 )
      ( MAKE-2PILE ?auto_66492 ?auto_66493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66495 - BLOCK
      ?auto_66496 - BLOCK
    )
    :vars
    (
      ?auto_66497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66495 ?auto_66496 ) ) ( ON ?auto_66496 ?auto_66497 ) ( CLEAR ?auto_66496 ) ( not ( = ?auto_66495 ?auto_66497 ) ) ( not ( = ?auto_66496 ?auto_66497 ) ) ( HOLDING ?auto_66495 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66495 )
      ( MAKE-2PILE ?auto_66495 ?auto_66496 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66498 - BLOCK
      ?auto_66499 - BLOCK
    )
    :vars
    (
      ?auto_66500 - BLOCK
      ?auto_66503 - BLOCK
      ?auto_66505 - BLOCK
      ?auto_66504 - BLOCK
      ?auto_66502 - BLOCK
      ?auto_66501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66498 ?auto_66499 ) ) ( ON ?auto_66499 ?auto_66500 ) ( not ( = ?auto_66498 ?auto_66500 ) ) ( not ( = ?auto_66499 ?auto_66500 ) ) ( ON ?auto_66498 ?auto_66499 ) ( CLEAR ?auto_66498 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66503 ) ( ON ?auto_66505 ?auto_66503 ) ( ON ?auto_66504 ?auto_66505 ) ( ON ?auto_66502 ?auto_66504 ) ( ON ?auto_66501 ?auto_66502 ) ( ON ?auto_66500 ?auto_66501 ) ( not ( = ?auto_66503 ?auto_66505 ) ) ( not ( = ?auto_66503 ?auto_66504 ) ) ( not ( = ?auto_66503 ?auto_66502 ) ) ( not ( = ?auto_66503 ?auto_66501 ) ) ( not ( = ?auto_66503 ?auto_66500 ) ) ( not ( = ?auto_66503 ?auto_66499 ) ) ( not ( = ?auto_66503 ?auto_66498 ) ) ( not ( = ?auto_66505 ?auto_66504 ) ) ( not ( = ?auto_66505 ?auto_66502 ) ) ( not ( = ?auto_66505 ?auto_66501 ) ) ( not ( = ?auto_66505 ?auto_66500 ) ) ( not ( = ?auto_66505 ?auto_66499 ) ) ( not ( = ?auto_66505 ?auto_66498 ) ) ( not ( = ?auto_66504 ?auto_66502 ) ) ( not ( = ?auto_66504 ?auto_66501 ) ) ( not ( = ?auto_66504 ?auto_66500 ) ) ( not ( = ?auto_66504 ?auto_66499 ) ) ( not ( = ?auto_66504 ?auto_66498 ) ) ( not ( = ?auto_66502 ?auto_66501 ) ) ( not ( = ?auto_66502 ?auto_66500 ) ) ( not ( = ?auto_66502 ?auto_66499 ) ) ( not ( = ?auto_66502 ?auto_66498 ) ) ( not ( = ?auto_66501 ?auto_66500 ) ) ( not ( = ?auto_66501 ?auto_66499 ) ) ( not ( = ?auto_66501 ?auto_66498 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_66503 ?auto_66505 ?auto_66504 ?auto_66502 ?auto_66501 ?auto_66500 ?auto_66499 )
      ( MAKE-2PILE ?auto_66498 ?auto_66499 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66511 - BLOCK
      ?auto_66512 - BLOCK
      ?auto_66513 - BLOCK
      ?auto_66514 - BLOCK
      ?auto_66515 - BLOCK
    )
    :vars
    (
      ?auto_66516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66516 ?auto_66515 ) ( CLEAR ?auto_66516 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66511 ) ( ON ?auto_66512 ?auto_66511 ) ( ON ?auto_66513 ?auto_66512 ) ( ON ?auto_66514 ?auto_66513 ) ( ON ?auto_66515 ?auto_66514 ) ( not ( = ?auto_66511 ?auto_66512 ) ) ( not ( = ?auto_66511 ?auto_66513 ) ) ( not ( = ?auto_66511 ?auto_66514 ) ) ( not ( = ?auto_66511 ?auto_66515 ) ) ( not ( = ?auto_66511 ?auto_66516 ) ) ( not ( = ?auto_66512 ?auto_66513 ) ) ( not ( = ?auto_66512 ?auto_66514 ) ) ( not ( = ?auto_66512 ?auto_66515 ) ) ( not ( = ?auto_66512 ?auto_66516 ) ) ( not ( = ?auto_66513 ?auto_66514 ) ) ( not ( = ?auto_66513 ?auto_66515 ) ) ( not ( = ?auto_66513 ?auto_66516 ) ) ( not ( = ?auto_66514 ?auto_66515 ) ) ( not ( = ?auto_66514 ?auto_66516 ) ) ( not ( = ?auto_66515 ?auto_66516 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66516 ?auto_66515 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66517 - BLOCK
      ?auto_66518 - BLOCK
      ?auto_66519 - BLOCK
      ?auto_66520 - BLOCK
      ?auto_66521 - BLOCK
    )
    :vars
    (
      ?auto_66522 - BLOCK
      ?auto_66523 - BLOCK
      ?auto_66524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66522 ?auto_66521 ) ( CLEAR ?auto_66522 ) ( ON-TABLE ?auto_66517 ) ( ON ?auto_66518 ?auto_66517 ) ( ON ?auto_66519 ?auto_66518 ) ( ON ?auto_66520 ?auto_66519 ) ( ON ?auto_66521 ?auto_66520 ) ( not ( = ?auto_66517 ?auto_66518 ) ) ( not ( = ?auto_66517 ?auto_66519 ) ) ( not ( = ?auto_66517 ?auto_66520 ) ) ( not ( = ?auto_66517 ?auto_66521 ) ) ( not ( = ?auto_66517 ?auto_66522 ) ) ( not ( = ?auto_66518 ?auto_66519 ) ) ( not ( = ?auto_66518 ?auto_66520 ) ) ( not ( = ?auto_66518 ?auto_66521 ) ) ( not ( = ?auto_66518 ?auto_66522 ) ) ( not ( = ?auto_66519 ?auto_66520 ) ) ( not ( = ?auto_66519 ?auto_66521 ) ) ( not ( = ?auto_66519 ?auto_66522 ) ) ( not ( = ?auto_66520 ?auto_66521 ) ) ( not ( = ?auto_66520 ?auto_66522 ) ) ( not ( = ?auto_66521 ?auto_66522 ) ) ( HOLDING ?auto_66523 ) ( CLEAR ?auto_66524 ) ( not ( = ?auto_66517 ?auto_66523 ) ) ( not ( = ?auto_66517 ?auto_66524 ) ) ( not ( = ?auto_66518 ?auto_66523 ) ) ( not ( = ?auto_66518 ?auto_66524 ) ) ( not ( = ?auto_66519 ?auto_66523 ) ) ( not ( = ?auto_66519 ?auto_66524 ) ) ( not ( = ?auto_66520 ?auto_66523 ) ) ( not ( = ?auto_66520 ?auto_66524 ) ) ( not ( = ?auto_66521 ?auto_66523 ) ) ( not ( = ?auto_66521 ?auto_66524 ) ) ( not ( = ?auto_66522 ?auto_66523 ) ) ( not ( = ?auto_66522 ?auto_66524 ) ) ( not ( = ?auto_66523 ?auto_66524 ) ) )
    :subtasks
    ( ( !STACK ?auto_66523 ?auto_66524 )
      ( MAKE-5PILE ?auto_66517 ?auto_66518 ?auto_66519 ?auto_66520 ?auto_66521 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67443 - BLOCK
      ?auto_67444 - BLOCK
      ?auto_67445 - BLOCK
      ?auto_67446 - BLOCK
      ?auto_67447 - BLOCK
    )
    :vars
    (
      ?auto_67448 - BLOCK
      ?auto_67449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67448 ?auto_67447 ) ( ON-TABLE ?auto_67443 ) ( ON ?auto_67444 ?auto_67443 ) ( ON ?auto_67445 ?auto_67444 ) ( ON ?auto_67446 ?auto_67445 ) ( ON ?auto_67447 ?auto_67446 ) ( not ( = ?auto_67443 ?auto_67444 ) ) ( not ( = ?auto_67443 ?auto_67445 ) ) ( not ( = ?auto_67443 ?auto_67446 ) ) ( not ( = ?auto_67443 ?auto_67447 ) ) ( not ( = ?auto_67443 ?auto_67448 ) ) ( not ( = ?auto_67444 ?auto_67445 ) ) ( not ( = ?auto_67444 ?auto_67446 ) ) ( not ( = ?auto_67444 ?auto_67447 ) ) ( not ( = ?auto_67444 ?auto_67448 ) ) ( not ( = ?auto_67445 ?auto_67446 ) ) ( not ( = ?auto_67445 ?auto_67447 ) ) ( not ( = ?auto_67445 ?auto_67448 ) ) ( not ( = ?auto_67446 ?auto_67447 ) ) ( not ( = ?auto_67446 ?auto_67448 ) ) ( not ( = ?auto_67447 ?auto_67448 ) ) ( not ( = ?auto_67443 ?auto_67449 ) ) ( not ( = ?auto_67444 ?auto_67449 ) ) ( not ( = ?auto_67445 ?auto_67449 ) ) ( not ( = ?auto_67446 ?auto_67449 ) ) ( not ( = ?auto_67447 ?auto_67449 ) ) ( not ( = ?auto_67448 ?auto_67449 ) ) ( ON ?auto_67449 ?auto_67448 ) ( CLEAR ?auto_67449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67443 ?auto_67444 ?auto_67445 ?auto_67446 ?auto_67447 ?auto_67448 )
      ( MAKE-5PILE ?auto_67443 ?auto_67444 ?auto_67445 ?auto_67446 ?auto_67447 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66533 - BLOCK
      ?auto_66534 - BLOCK
      ?auto_66535 - BLOCK
      ?auto_66536 - BLOCK
      ?auto_66537 - BLOCK
    )
    :vars
    (
      ?auto_66538 - BLOCK
      ?auto_66539 - BLOCK
      ?auto_66540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66538 ?auto_66537 ) ( ON-TABLE ?auto_66533 ) ( ON ?auto_66534 ?auto_66533 ) ( ON ?auto_66535 ?auto_66534 ) ( ON ?auto_66536 ?auto_66535 ) ( ON ?auto_66537 ?auto_66536 ) ( not ( = ?auto_66533 ?auto_66534 ) ) ( not ( = ?auto_66533 ?auto_66535 ) ) ( not ( = ?auto_66533 ?auto_66536 ) ) ( not ( = ?auto_66533 ?auto_66537 ) ) ( not ( = ?auto_66533 ?auto_66538 ) ) ( not ( = ?auto_66534 ?auto_66535 ) ) ( not ( = ?auto_66534 ?auto_66536 ) ) ( not ( = ?auto_66534 ?auto_66537 ) ) ( not ( = ?auto_66534 ?auto_66538 ) ) ( not ( = ?auto_66535 ?auto_66536 ) ) ( not ( = ?auto_66535 ?auto_66537 ) ) ( not ( = ?auto_66535 ?auto_66538 ) ) ( not ( = ?auto_66536 ?auto_66537 ) ) ( not ( = ?auto_66536 ?auto_66538 ) ) ( not ( = ?auto_66537 ?auto_66538 ) ) ( not ( = ?auto_66533 ?auto_66539 ) ) ( not ( = ?auto_66533 ?auto_66540 ) ) ( not ( = ?auto_66534 ?auto_66539 ) ) ( not ( = ?auto_66534 ?auto_66540 ) ) ( not ( = ?auto_66535 ?auto_66539 ) ) ( not ( = ?auto_66535 ?auto_66540 ) ) ( not ( = ?auto_66536 ?auto_66539 ) ) ( not ( = ?auto_66536 ?auto_66540 ) ) ( not ( = ?auto_66537 ?auto_66539 ) ) ( not ( = ?auto_66537 ?auto_66540 ) ) ( not ( = ?auto_66538 ?auto_66539 ) ) ( not ( = ?auto_66538 ?auto_66540 ) ) ( not ( = ?auto_66539 ?auto_66540 ) ) ( ON ?auto_66539 ?auto_66538 ) ( CLEAR ?auto_66539 ) ( HOLDING ?auto_66540 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66540 )
      ( MAKE-5PILE ?auto_66533 ?auto_66534 ?auto_66535 ?auto_66536 ?auto_66537 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66541 - BLOCK
      ?auto_66542 - BLOCK
      ?auto_66543 - BLOCK
      ?auto_66544 - BLOCK
      ?auto_66545 - BLOCK
    )
    :vars
    (
      ?auto_66546 - BLOCK
      ?auto_66548 - BLOCK
      ?auto_66547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66546 ?auto_66545 ) ( ON-TABLE ?auto_66541 ) ( ON ?auto_66542 ?auto_66541 ) ( ON ?auto_66543 ?auto_66542 ) ( ON ?auto_66544 ?auto_66543 ) ( ON ?auto_66545 ?auto_66544 ) ( not ( = ?auto_66541 ?auto_66542 ) ) ( not ( = ?auto_66541 ?auto_66543 ) ) ( not ( = ?auto_66541 ?auto_66544 ) ) ( not ( = ?auto_66541 ?auto_66545 ) ) ( not ( = ?auto_66541 ?auto_66546 ) ) ( not ( = ?auto_66542 ?auto_66543 ) ) ( not ( = ?auto_66542 ?auto_66544 ) ) ( not ( = ?auto_66542 ?auto_66545 ) ) ( not ( = ?auto_66542 ?auto_66546 ) ) ( not ( = ?auto_66543 ?auto_66544 ) ) ( not ( = ?auto_66543 ?auto_66545 ) ) ( not ( = ?auto_66543 ?auto_66546 ) ) ( not ( = ?auto_66544 ?auto_66545 ) ) ( not ( = ?auto_66544 ?auto_66546 ) ) ( not ( = ?auto_66545 ?auto_66546 ) ) ( not ( = ?auto_66541 ?auto_66548 ) ) ( not ( = ?auto_66541 ?auto_66547 ) ) ( not ( = ?auto_66542 ?auto_66548 ) ) ( not ( = ?auto_66542 ?auto_66547 ) ) ( not ( = ?auto_66543 ?auto_66548 ) ) ( not ( = ?auto_66543 ?auto_66547 ) ) ( not ( = ?auto_66544 ?auto_66548 ) ) ( not ( = ?auto_66544 ?auto_66547 ) ) ( not ( = ?auto_66545 ?auto_66548 ) ) ( not ( = ?auto_66545 ?auto_66547 ) ) ( not ( = ?auto_66546 ?auto_66548 ) ) ( not ( = ?auto_66546 ?auto_66547 ) ) ( not ( = ?auto_66548 ?auto_66547 ) ) ( ON ?auto_66548 ?auto_66546 ) ( ON ?auto_66547 ?auto_66548 ) ( CLEAR ?auto_66547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_66541 ?auto_66542 ?auto_66543 ?auto_66544 ?auto_66545 ?auto_66546 ?auto_66548 )
      ( MAKE-5PILE ?auto_66541 ?auto_66542 ?auto_66543 ?auto_66544 ?auto_66545 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66552 - BLOCK
      ?auto_66553 - BLOCK
      ?auto_66554 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_66554 ) ( CLEAR ?auto_66553 ) ( ON-TABLE ?auto_66552 ) ( ON ?auto_66553 ?auto_66552 ) ( not ( = ?auto_66552 ?auto_66553 ) ) ( not ( = ?auto_66552 ?auto_66554 ) ) ( not ( = ?auto_66553 ?auto_66554 ) ) )
    :subtasks
    ( ( !STACK ?auto_66554 ?auto_66553 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66555 - BLOCK
      ?auto_66556 - BLOCK
      ?auto_66557 - BLOCK
    )
    :vars
    (
      ?auto_66558 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66556 ) ( ON-TABLE ?auto_66555 ) ( ON ?auto_66556 ?auto_66555 ) ( not ( = ?auto_66555 ?auto_66556 ) ) ( not ( = ?auto_66555 ?auto_66557 ) ) ( not ( = ?auto_66556 ?auto_66557 ) ) ( ON ?auto_66557 ?auto_66558 ) ( CLEAR ?auto_66557 ) ( HAND-EMPTY ) ( not ( = ?auto_66555 ?auto_66558 ) ) ( not ( = ?auto_66556 ?auto_66558 ) ) ( not ( = ?auto_66557 ?auto_66558 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66557 ?auto_66558 )
      ( MAKE-3PILE ?auto_66555 ?auto_66556 ?auto_66557 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66559 - BLOCK
      ?auto_66560 - BLOCK
      ?auto_66561 - BLOCK
    )
    :vars
    (
      ?auto_66562 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66559 ) ( not ( = ?auto_66559 ?auto_66560 ) ) ( not ( = ?auto_66559 ?auto_66561 ) ) ( not ( = ?auto_66560 ?auto_66561 ) ) ( ON ?auto_66561 ?auto_66562 ) ( CLEAR ?auto_66561 ) ( not ( = ?auto_66559 ?auto_66562 ) ) ( not ( = ?auto_66560 ?auto_66562 ) ) ( not ( = ?auto_66561 ?auto_66562 ) ) ( HOLDING ?auto_66560 ) ( CLEAR ?auto_66559 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66559 ?auto_66560 )
      ( MAKE-3PILE ?auto_66559 ?auto_66560 ?auto_66561 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66563 - BLOCK
      ?auto_66564 - BLOCK
      ?auto_66565 - BLOCK
    )
    :vars
    (
      ?auto_66566 - BLOCK
      ?auto_66570 - BLOCK
      ?auto_66568 - BLOCK
      ?auto_66569 - BLOCK
      ?auto_66567 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66563 ) ( not ( = ?auto_66563 ?auto_66564 ) ) ( not ( = ?auto_66563 ?auto_66565 ) ) ( not ( = ?auto_66564 ?auto_66565 ) ) ( ON ?auto_66565 ?auto_66566 ) ( not ( = ?auto_66563 ?auto_66566 ) ) ( not ( = ?auto_66564 ?auto_66566 ) ) ( not ( = ?auto_66565 ?auto_66566 ) ) ( CLEAR ?auto_66563 ) ( ON ?auto_66564 ?auto_66565 ) ( CLEAR ?auto_66564 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66570 ) ( ON ?auto_66568 ?auto_66570 ) ( ON ?auto_66569 ?auto_66568 ) ( ON ?auto_66567 ?auto_66569 ) ( ON ?auto_66566 ?auto_66567 ) ( not ( = ?auto_66570 ?auto_66568 ) ) ( not ( = ?auto_66570 ?auto_66569 ) ) ( not ( = ?auto_66570 ?auto_66567 ) ) ( not ( = ?auto_66570 ?auto_66566 ) ) ( not ( = ?auto_66570 ?auto_66565 ) ) ( not ( = ?auto_66570 ?auto_66564 ) ) ( not ( = ?auto_66568 ?auto_66569 ) ) ( not ( = ?auto_66568 ?auto_66567 ) ) ( not ( = ?auto_66568 ?auto_66566 ) ) ( not ( = ?auto_66568 ?auto_66565 ) ) ( not ( = ?auto_66568 ?auto_66564 ) ) ( not ( = ?auto_66569 ?auto_66567 ) ) ( not ( = ?auto_66569 ?auto_66566 ) ) ( not ( = ?auto_66569 ?auto_66565 ) ) ( not ( = ?auto_66569 ?auto_66564 ) ) ( not ( = ?auto_66567 ?auto_66566 ) ) ( not ( = ?auto_66567 ?auto_66565 ) ) ( not ( = ?auto_66567 ?auto_66564 ) ) ( not ( = ?auto_66563 ?auto_66570 ) ) ( not ( = ?auto_66563 ?auto_66568 ) ) ( not ( = ?auto_66563 ?auto_66569 ) ) ( not ( = ?auto_66563 ?auto_66567 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66570 ?auto_66568 ?auto_66569 ?auto_66567 ?auto_66566 ?auto_66565 )
      ( MAKE-3PILE ?auto_66563 ?auto_66564 ?auto_66565 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66571 - BLOCK
      ?auto_66572 - BLOCK
      ?auto_66573 - BLOCK
    )
    :vars
    (
      ?auto_66575 - BLOCK
      ?auto_66576 - BLOCK
      ?auto_66574 - BLOCK
      ?auto_66578 - BLOCK
      ?auto_66577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66571 ?auto_66572 ) ) ( not ( = ?auto_66571 ?auto_66573 ) ) ( not ( = ?auto_66572 ?auto_66573 ) ) ( ON ?auto_66573 ?auto_66575 ) ( not ( = ?auto_66571 ?auto_66575 ) ) ( not ( = ?auto_66572 ?auto_66575 ) ) ( not ( = ?auto_66573 ?auto_66575 ) ) ( ON ?auto_66572 ?auto_66573 ) ( CLEAR ?auto_66572 ) ( ON-TABLE ?auto_66576 ) ( ON ?auto_66574 ?auto_66576 ) ( ON ?auto_66578 ?auto_66574 ) ( ON ?auto_66577 ?auto_66578 ) ( ON ?auto_66575 ?auto_66577 ) ( not ( = ?auto_66576 ?auto_66574 ) ) ( not ( = ?auto_66576 ?auto_66578 ) ) ( not ( = ?auto_66576 ?auto_66577 ) ) ( not ( = ?auto_66576 ?auto_66575 ) ) ( not ( = ?auto_66576 ?auto_66573 ) ) ( not ( = ?auto_66576 ?auto_66572 ) ) ( not ( = ?auto_66574 ?auto_66578 ) ) ( not ( = ?auto_66574 ?auto_66577 ) ) ( not ( = ?auto_66574 ?auto_66575 ) ) ( not ( = ?auto_66574 ?auto_66573 ) ) ( not ( = ?auto_66574 ?auto_66572 ) ) ( not ( = ?auto_66578 ?auto_66577 ) ) ( not ( = ?auto_66578 ?auto_66575 ) ) ( not ( = ?auto_66578 ?auto_66573 ) ) ( not ( = ?auto_66578 ?auto_66572 ) ) ( not ( = ?auto_66577 ?auto_66575 ) ) ( not ( = ?auto_66577 ?auto_66573 ) ) ( not ( = ?auto_66577 ?auto_66572 ) ) ( not ( = ?auto_66571 ?auto_66576 ) ) ( not ( = ?auto_66571 ?auto_66574 ) ) ( not ( = ?auto_66571 ?auto_66578 ) ) ( not ( = ?auto_66571 ?auto_66577 ) ) ( HOLDING ?auto_66571 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66571 )
      ( MAKE-3PILE ?auto_66571 ?auto_66572 ?auto_66573 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66579 - BLOCK
      ?auto_66580 - BLOCK
      ?auto_66581 - BLOCK
    )
    :vars
    (
      ?auto_66583 - BLOCK
      ?auto_66585 - BLOCK
      ?auto_66586 - BLOCK
      ?auto_66582 - BLOCK
      ?auto_66584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66579 ?auto_66580 ) ) ( not ( = ?auto_66579 ?auto_66581 ) ) ( not ( = ?auto_66580 ?auto_66581 ) ) ( ON ?auto_66581 ?auto_66583 ) ( not ( = ?auto_66579 ?auto_66583 ) ) ( not ( = ?auto_66580 ?auto_66583 ) ) ( not ( = ?auto_66581 ?auto_66583 ) ) ( ON ?auto_66580 ?auto_66581 ) ( ON-TABLE ?auto_66585 ) ( ON ?auto_66586 ?auto_66585 ) ( ON ?auto_66582 ?auto_66586 ) ( ON ?auto_66584 ?auto_66582 ) ( ON ?auto_66583 ?auto_66584 ) ( not ( = ?auto_66585 ?auto_66586 ) ) ( not ( = ?auto_66585 ?auto_66582 ) ) ( not ( = ?auto_66585 ?auto_66584 ) ) ( not ( = ?auto_66585 ?auto_66583 ) ) ( not ( = ?auto_66585 ?auto_66581 ) ) ( not ( = ?auto_66585 ?auto_66580 ) ) ( not ( = ?auto_66586 ?auto_66582 ) ) ( not ( = ?auto_66586 ?auto_66584 ) ) ( not ( = ?auto_66586 ?auto_66583 ) ) ( not ( = ?auto_66586 ?auto_66581 ) ) ( not ( = ?auto_66586 ?auto_66580 ) ) ( not ( = ?auto_66582 ?auto_66584 ) ) ( not ( = ?auto_66582 ?auto_66583 ) ) ( not ( = ?auto_66582 ?auto_66581 ) ) ( not ( = ?auto_66582 ?auto_66580 ) ) ( not ( = ?auto_66584 ?auto_66583 ) ) ( not ( = ?auto_66584 ?auto_66581 ) ) ( not ( = ?auto_66584 ?auto_66580 ) ) ( not ( = ?auto_66579 ?auto_66585 ) ) ( not ( = ?auto_66579 ?auto_66586 ) ) ( not ( = ?auto_66579 ?auto_66582 ) ) ( not ( = ?auto_66579 ?auto_66584 ) ) ( ON ?auto_66579 ?auto_66580 ) ( CLEAR ?auto_66579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_66585 ?auto_66586 ?auto_66582 ?auto_66584 ?auto_66583 ?auto_66581 ?auto_66580 )
      ( MAKE-3PILE ?auto_66579 ?auto_66580 ?auto_66581 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66591 - BLOCK
      ?auto_66592 - BLOCK
      ?auto_66593 - BLOCK
      ?auto_66594 - BLOCK
    )
    :vars
    (
      ?auto_66595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66595 ?auto_66594 ) ( CLEAR ?auto_66595 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66591 ) ( ON ?auto_66592 ?auto_66591 ) ( ON ?auto_66593 ?auto_66592 ) ( ON ?auto_66594 ?auto_66593 ) ( not ( = ?auto_66591 ?auto_66592 ) ) ( not ( = ?auto_66591 ?auto_66593 ) ) ( not ( = ?auto_66591 ?auto_66594 ) ) ( not ( = ?auto_66591 ?auto_66595 ) ) ( not ( = ?auto_66592 ?auto_66593 ) ) ( not ( = ?auto_66592 ?auto_66594 ) ) ( not ( = ?auto_66592 ?auto_66595 ) ) ( not ( = ?auto_66593 ?auto_66594 ) ) ( not ( = ?auto_66593 ?auto_66595 ) ) ( not ( = ?auto_66594 ?auto_66595 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66595 ?auto_66594 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66596 - BLOCK
      ?auto_66597 - BLOCK
      ?auto_66598 - BLOCK
      ?auto_66599 - BLOCK
    )
    :vars
    (
      ?auto_66600 - BLOCK
      ?auto_66601 - BLOCK
      ?auto_66602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66600 ?auto_66599 ) ( CLEAR ?auto_66600 ) ( ON-TABLE ?auto_66596 ) ( ON ?auto_66597 ?auto_66596 ) ( ON ?auto_66598 ?auto_66597 ) ( ON ?auto_66599 ?auto_66598 ) ( not ( = ?auto_66596 ?auto_66597 ) ) ( not ( = ?auto_66596 ?auto_66598 ) ) ( not ( = ?auto_66596 ?auto_66599 ) ) ( not ( = ?auto_66596 ?auto_66600 ) ) ( not ( = ?auto_66597 ?auto_66598 ) ) ( not ( = ?auto_66597 ?auto_66599 ) ) ( not ( = ?auto_66597 ?auto_66600 ) ) ( not ( = ?auto_66598 ?auto_66599 ) ) ( not ( = ?auto_66598 ?auto_66600 ) ) ( not ( = ?auto_66599 ?auto_66600 ) ) ( HOLDING ?auto_66601 ) ( CLEAR ?auto_66602 ) ( not ( = ?auto_66596 ?auto_66601 ) ) ( not ( = ?auto_66596 ?auto_66602 ) ) ( not ( = ?auto_66597 ?auto_66601 ) ) ( not ( = ?auto_66597 ?auto_66602 ) ) ( not ( = ?auto_66598 ?auto_66601 ) ) ( not ( = ?auto_66598 ?auto_66602 ) ) ( not ( = ?auto_66599 ?auto_66601 ) ) ( not ( = ?auto_66599 ?auto_66602 ) ) ( not ( = ?auto_66600 ?auto_66601 ) ) ( not ( = ?auto_66600 ?auto_66602 ) ) ( not ( = ?auto_66601 ?auto_66602 ) ) )
    :subtasks
    ( ( !STACK ?auto_66601 ?auto_66602 )
      ( MAKE-4PILE ?auto_66596 ?auto_66597 ?auto_66598 ?auto_66599 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66603 - BLOCK
      ?auto_66604 - BLOCK
      ?auto_66605 - BLOCK
      ?auto_66606 - BLOCK
    )
    :vars
    (
      ?auto_66608 - BLOCK
      ?auto_66607 - BLOCK
      ?auto_66609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66608 ?auto_66606 ) ( ON-TABLE ?auto_66603 ) ( ON ?auto_66604 ?auto_66603 ) ( ON ?auto_66605 ?auto_66604 ) ( ON ?auto_66606 ?auto_66605 ) ( not ( = ?auto_66603 ?auto_66604 ) ) ( not ( = ?auto_66603 ?auto_66605 ) ) ( not ( = ?auto_66603 ?auto_66606 ) ) ( not ( = ?auto_66603 ?auto_66608 ) ) ( not ( = ?auto_66604 ?auto_66605 ) ) ( not ( = ?auto_66604 ?auto_66606 ) ) ( not ( = ?auto_66604 ?auto_66608 ) ) ( not ( = ?auto_66605 ?auto_66606 ) ) ( not ( = ?auto_66605 ?auto_66608 ) ) ( not ( = ?auto_66606 ?auto_66608 ) ) ( CLEAR ?auto_66607 ) ( not ( = ?auto_66603 ?auto_66609 ) ) ( not ( = ?auto_66603 ?auto_66607 ) ) ( not ( = ?auto_66604 ?auto_66609 ) ) ( not ( = ?auto_66604 ?auto_66607 ) ) ( not ( = ?auto_66605 ?auto_66609 ) ) ( not ( = ?auto_66605 ?auto_66607 ) ) ( not ( = ?auto_66606 ?auto_66609 ) ) ( not ( = ?auto_66606 ?auto_66607 ) ) ( not ( = ?auto_66608 ?auto_66609 ) ) ( not ( = ?auto_66608 ?auto_66607 ) ) ( not ( = ?auto_66609 ?auto_66607 ) ) ( ON ?auto_66609 ?auto_66608 ) ( CLEAR ?auto_66609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66603 ?auto_66604 ?auto_66605 ?auto_66606 ?auto_66608 )
      ( MAKE-4PILE ?auto_66603 ?auto_66604 ?auto_66605 ?auto_66606 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66610 - BLOCK
      ?auto_66611 - BLOCK
      ?auto_66612 - BLOCK
      ?auto_66613 - BLOCK
    )
    :vars
    (
      ?auto_66615 - BLOCK
      ?auto_66614 - BLOCK
      ?auto_66616 - BLOCK
      ?auto_66617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66615 ?auto_66613 ) ( ON-TABLE ?auto_66610 ) ( ON ?auto_66611 ?auto_66610 ) ( ON ?auto_66612 ?auto_66611 ) ( ON ?auto_66613 ?auto_66612 ) ( not ( = ?auto_66610 ?auto_66611 ) ) ( not ( = ?auto_66610 ?auto_66612 ) ) ( not ( = ?auto_66610 ?auto_66613 ) ) ( not ( = ?auto_66610 ?auto_66615 ) ) ( not ( = ?auto_66611 ?auto_66612 ) ) ( not ( = ?auto_66611 ?auto_66613 ) ) ( not ( = ?auto_66611 ?auto_66615 ) ) ( not ( = ?auto_66612 ?auto_66613 ) ) ( not ( = ?auto_66612 ?auto_66615 ) ) ( not ( = ?auto_66613 ?auto_66615 ) ) ( not ( = ?auto_66610 ?auto_66614 ) ) ( not ( = ?auto_66610 ?auto_66616 ) ) ( not ( = ?auto_66611 ?auto_66614 ) ) ( not ( = ?auto_66611 ?auto_66616 ) ) ( not ( = ?auto_66612 ?auto_66614 ) ) ( not ( = ?auto_66612 ?auto_66616 ) ) ( not ( = ?auto_66613 ?auto_66614 ) ) ( not ( = ?auto_66613 ?auto_66616 ) ) ( not ( = ?auto_66615 ?auto_66614 ) ) ( not ( = ?auto_66615 ?auto_66616 ) ) ( not ( = ?auto_66614 ?auto_66616 ) ) ( ON ?auto_66614 ?auto_66615 ) ( CLEAR ?auto_66614 ) ( HOLDING ?auto_66616 ) ( CLEAR ?auto_66617 ) ( ON-TABLE ?auto_66617 ) ( not ( = ?auto_66617 ?auto_66616 ) ) ( not ( = ?auto_66610 ?auto_66617 ) ) ( not ( = ?auto_66611 ?auto_66617 ) ) ( not ( = ?auto_66612 ?auto_66617 ) ) ( not ( = ?auto_66613 ?auto_66617 ) ) ( not ( = ?auto_66615 ?auto_66617 ) ) ( not ( = ?auto_66614 ?auto_66617 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66617 ?auto_66616 )
      ( MAKE-4PILE ?auto_66610 ?auto_66611 ?auto_66612 ?auto_66613 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67672 - BLOCK
      ?auto_67673 - BLOCK
      ?auto_67674 - BLOCK
      ?auto_67675 - BLOCK
    )
    :vars
    (
      ?auto_67676 - BLOCK
      ?auto_67678 - BLOCK
      ?auto_67677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67676 ?auto_67675 ) ( ON-TABLE ?auto_67672 ) ( ON ?auto_67673 ?auto_67672 ) ( ON ?auto_67674 ?auto_67673 ) ( ON ?auto_67675 ?auto_67674 ) ( not ( = ?auto_67672 ?auto_67673 ) ) ( not ( = ?auto_67672 ?auto_67674 ) ) ( not ( = ?auto_67672 ?auto_67675 ) ) ( not ( = ?auto_67672 ?auto_67676 ) ) ( not ( = ?auto_67673 ?auto_67674 ) ) ( not ( = ?auto_67673 ?auto_67675 ) ) ( not ( = ?auto_67673 ?auto_67676 ) ) ( not ( = ?auto_67674 ?auto_67675 ) ) ( not ( = ?auto_67674 ?auto_67676 ) ) ( not ( = ?auto_67675 ?auto_67676 ) ) ( not ( = ?auto_67672 ?auto_67678 ) ) ( not ( = ?auto_67672 ?auto_67677 ) ) ( not ( = ?auto_67673 ?auto_67678 ) ) ( not ( = ?auto_67673 ?auto_67677 ) ) ( not ( = ?auto_67674 ?auto_67678 ) ) ( not ( = ?auto_67674 ?auto_67677 ) ) ( not ( = ?auto_67675 ?auto_67678 ) ) ( not ( = ?auto_67675 ?auto_67677 ) ) ( not ( = ?auto_67676 ?auto_67678 ) ) ( not ( = ?auto_67676 ?auto_67677 ) ) ( not ( = ?auto_67678 ?auto_67677 ) ) ( ON ?auto_67678 ?auto_67676 ) ( ON ?auto_67677 ?auto_67678 ) ( CLEAR ?auto_67677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67672 ?auto_67673 ?auto_67674 ?auto_67675 ?auto_67676 ?auto_67678 )
      ( MAKE-4PILE ?auto_67672 ?auto_67673 ?auto_67674 ?auto_67675 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66626 - BLOCK
      ?auto_66627 - BLOCK
      ?auto_66628 - BLOCK
      ?auto_66629 - BLOCK
    )
    :vars
    (
      ?auto_66632 - BLOCK
      ?auto_66631 - BLOCK
      ?auto_66630 - BLOCK
      ?auto_66633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66632 ?auto_66629 ) ( ON-TABLE ?auto_66626 ) ( ON ?auto_66627 ?auto_66626 ) ( ON ?auto_66628 ?auto_66627 ) ( ON ?auto_66629 ?auto_66628 ) ( not ( = ?auto_66626 ?auto_66627 ) ) ( not ( = ?auto_66626 ?auto_66628 ) ) ( not ( = ?auto_66626 ?auto_66629 ) ) ( not ( = ?auto_66626 ?auto_66632 ) ) ( not ( = ?auto_66627 ?auto_66628 ) ) ( not ( = ?auto_66627 ?auto_66629 ) ) ( not ( = ?auto_66627 ?auto_66632 ) ) ( not ( = ?auto_66628 ?auto_66629 ) ) ( not ( = ?auto_66628 ?auto_66632 ) ) ( not ( = ?auto_66629 ?auto_66632 ) ) ( not ( = ?auto_66626 ?auto_66631 ) ) ( not ( = ?auto_66626 ?auto_66630 ) ) ( not ( = ?auto_66627 ?auto_66631 ) ) ( not ( = ?auto_66627 ?auto_66630 ) ) ( not ( = ?auto_66628 ?auto_66631 ) ) ( not ( = ?auto_66628 ?auto_66630 ) ) ( not ( = ?auto_66629 ?auto_66631 ) ) ( not ( = ?auto_66629 ?auto_66630 ) ) ( not ( = ?auto_66632 ?auto_66631 ) ) ( not ( = ?auto_66632 ?auto_66630 ) ) ( not ( = ?auto_66631 ?auto_66630 ) ) ( ON ?auto_66631 ?auto_66632 ) ( not ( = ?auto_66633 ?auto_66630 ) ) ( not ( = ?auto_66626 ?auto_66633 ) ) ( not ( = ?auto_66627 ?auto_66633 ) ) ( not ( = ?auto_66628 ?auto_66633 ) ) ( not ( = ?auto_66629 ?auto_66633 ) ) ( not ( = ?auto_66632 ?auto_66633 ) ) ( not ( = ?auto_66631 ?auto_66633 ) ) ( ON ?auto_66630 ?auto_66631 ) ( CLEAR ?auto_66630 ) ( HOLDING ?auto_66633 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66633 )
      ( MAKE-4PILE ?auto_66626 ?auto_66627 ?auto_66628 ?auto_66629 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66634 - BLOCK
      ?auto_66635 - BLOCK
      ?auto_66636 - BLOCK
      ?auto_66637 - BLOCK
    )
    :vars
    (
      ?auto_66640 - BLOCK
      ?auto_66638 - BLOCK
      ?auto_66639 - BLOCK
      ?auto_66641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66640 ?auto_66637 ) ( ON-TABLE ?auto_66634 ) ( ON ?auto_66635 ?auto_66634 ) ( ON ?auto_66636 ?auto_66635 ) ( ON ?auto_66637 ?auto_66636 ) ( not ( = ?auto_66634 ?auto_66635 ) ) ( not ( = ?auto_66634 ?auto_66636 ) ) ( not ( = ?auto_66634 ?auto_66637 ) ) ( not ( = ?auto_66634 ?auto_66640 ) ) ( not ( = ?auto_66635 ?auto_66636 ) ) ( not ( = ?auto_66635 ?auto_66637 ) ) ( not ( = ?auto_66635 ?auto_66640 ) ) ( not ( = ?auto_66636 ?auto_66637 ) ) ( not ( = ?auto_66636 ?auto_66640 ) ) ( not ( = ?auto_66637 ?auto_66640 ) ) ( not ( = ?auto_66634 ?auto_66638 ) ) ( not ( = ?auto_66634 ?auto_66639 ) ) ( not ( = ?auto_66635 ?auto_66638 ) ) ( not ( = ?auto_66635 ?auto_66639 ) ) ( not ( = ?auto_66636 ?auto_66638 ) ) ( not ( = ?auto_66636 ?auto_66639 ) ) ( not ( = ?auto_66637 ?auto_66638 ) ) ( not ( = ?auto_66637 ?auto_66639 ) ) ( not ( = ?auto_66640 ?auto_66638 ) ) ( not ( = ?auto_66640 ?auto_66639 ) ) ( not ( = ?auto_66638 ?auto_66639 ) ) ( ON ?auto_66638 ?auto_66640 ) ( not ( = ?auto_66641 ?auto_66639 ) ) ( not ( = ?auto_66634 ?auto_66641 ) ) ( not ( = ?auto_66635 ?auto_66641 ) ) ( not ( = ?auto_66636 ?auto_66641 ) ) ( not ( = ?auto_66637 ?auto_66641 ) ) ( not ( = ?auto_66640 ?auto_66641 ) ) ( not ( = ?auto_66638 ?auto_66641 ) ) ( ON ?auto_66639 ?auto_66638 ) ( ON ?auto_66641 ?auto_66639 ) ( CLEAR ?auto_66641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_66634 ?auto_66635 ?auto_66636 ?auto_66637 ?auto_66640 ?auto_66638 ?auto_66639 )
      ( MAKE-4PILE ?auto_66634 ?auto_66635 ?auto_66636 ?auto_66637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66646 - BLOCK
      ?auto_66647 - BLOCK
      ?auto_66648 - BLOCK
      ?auto_66649 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_66649 ) ( CLEAR ?auto_66648 ) ( ON-TABLE ?auto_66646 ) ( ON ?auto_66647 ?auto_66646 ) ( ON ?auto_66648 ?auto_66647 ) ( not ( = ?auto_66646 ?auto_66647 ) ) ( not ( = ?auto_66646 ?auto_66648 ) ) ( not ( = ?auto_66646 ?auto_66649 ) ) ( not ( = ?auto_66647 ?auto_66648 ) ) ( not ( = ?auto_66647 ?auto_66649 ) ) ( not ( = ?auto_66648 ?auto_66649 ) ) )
    :subtasks
    ( ( !STACK ?auto_66649 ?auto_66648 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66650 - BLOCK
      ?auto_66651 - BLOCK
      ?auto_66652 - BLOCK
      ?auto_66653 - BLOCK
    )
    :vars
    (
      ?auto_66654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66652 ) ( ON-TABLE ?auto_66650 ) ( ON ?auto_66651 ?auto_66650 ) ( ON ?auto_66652 ?auto_66651 ) ( not ( = ?auto_66650 ?auto_66651 ) ) ( not ( = ?auto_66650 ?auto_66652 ) ) ( not ( = ?auto_66650 ?auto_66653 ) ) ( not ( = ?auto_66651 ?auto_66652 ) ) ( not ( = ?auto_66651 ?auto_66653 ) ) ( not ( = ?auto_66652 ?auto_66653 ) ) ( ON ?auto_66653 ?auto_66654 ) ( CLEAR ?auto_66653 ) ( HAND-EMPTY ) ( not ( = ?auto_66650 ?auto_66654 ) ) ( not ( = ?auto_66651 ?auto_66654 ) ) ( not ( = ?auto_66652 ?auto_66654 ) ) ( not ( = ?auto_66653 ?auto_66654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66653 ?auto_66654 )
      ( MAKE-4PILE ?auto_66650 ?auto_66651 ?auto_66652 ?auto_66653 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66655 - BLOCK
      ?auto_66656 - BLOCK
      ?auto_66657 - BLOCK
      ?auto_66658 - BLOCK
    )
    :vars
    (
      ?auto_66659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66655 ) ( ON ?auto_66656 ?auto_66655 ) ( not ( = ?auto_66655 ?auto_66656 ) ) ( not ( = ?auto_66655 ?auto_66657 ) ) ( not ( = ?auto_66655 ?auto_66658 ) ) ( not ( = ?auto_66656 ?auto_66657 ) ) ( not ( = ?auto_66656 ?auto_66658 ) ) ( not ( = ?auto_66657 ?auto_66658 ) ) ( ON ?auto_66658 ?auto_66659 ) ( CLEAR ?auto_66658 ) ( not ( = ?auto_66655 ?auto_66659 ) ) ( not ( = ?auto_66656 ?auto_66659 ) ) ( not ( = ?auto_66657 ?auto_66659 ) ) ( not ( = ?auto_66658 ?auto_66659 ) ) ( HOLDING ?auto_66657 ) ( CLEAR ?auto_66656 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66655 ?auto_66656 ?auto_66657 )
      ( MAKE-4PILE ?auto_66655 ?auto_66656 ?auto_66657 ?auto_66658 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66660 - BLOCK
      ?auto_66661 - BLOCK
      ?auto_66662 - BLOCK
      ?auto_66663 - BLOCK
    )
    :vars
    (
      ?auto_66664 - BLOCK
      ?auto_66667 - BLOCK
      ?auto_66665 - BLOCK
      ?auto_66666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66660 ) ( ON ?auto_66661 ?auto_66660 ) ( not ( = ?auto_66660 ?auto_66661 ) ) ( not ( = ?auto_66660 ?auto_66662 ) ) ( not ( = ?auto_66660 ?auto_66663 ) ) ( not ( = ?auto_66661 ?auto_66662 ) ) ( not ( = ?auto_66661 ?auto_66663 ) ) ( not ( = ?auto_66662 ?auto_66663 ) ) ( ON ?auto_66663 ?auto_66664 ) ( not ( = ?auto_66660 ?auto_66664 ) ) ( not ( = ?auto_66661 ?auto_66664 ) ) ( not ( = ?auto_66662 ?auto_66664 ) ) ( not ( = ?auto_66663 ?auto_66664 ) ) ( CLEAR ?auto_66661 ) ( ON ?auto_66662 ?auto_66663 ) ( CLEAR ?auto_66662 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66667 ) ( ON ?auto_66665 ?auto_66667 ) ( ON ?auto_66666 ?auto_66665 ) ( ON ?auto_66664 ?auto_66666 ) ( not ( = ?auto_66667 ?auto_66665 ) ) ( not ( = ?auto_66667 ?auto_66666 ) ) ( not ( = ?auto_66667 ?auto_66664 ) ) ( not ( = ?auto_66667 ?auto_66663 ) ) ( not ( = ?auto_66667 ?auto_66662 ) ) ( not ( = ?auto_66665 ?auto_66666 ) ) ( not ( = ?auto_66665 ?auto_66664 ) ) ( not ( = ?auto_66665 ?auto_66663 ) ) ( not ( = ?auto_66665 ?auto_66662 ) ) ( not ( = ?auto_66666 ?auto_66664 ) ) ( not ( = ?auto_66666 ?auto_66663 ) ) ( not ( = ?auto_66666 ?auto_66662 ) ) ( not ( = ?auto_66660 ?auto_66667 ) ) ( not ( = ?auto_66660 ?auto_66665 ) ) ( not ( = ?auto_66660 ?auto_66666 ) ) ( not ( = ?auto_66661 ?auto_66667 ) ) ( not ( = ?auto_66661 ?auto_66665 ) ) ( not ( = ?auto_66661 ?auto_66666 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66667 ?auto_66665 ?auto_66666 ?auto_66664 ?auto_66663 )
      ( MAKE-4PILE ?auto_66660 ?auto_66661 ?auto_66662 ?auto_66663 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66668 - BLOCK
      ?auto_66669 - BLOCK
      ?auto_66670 - BLOCK
      ?auto_66671 - BLOCK
    )
    :vars
    (
      ?auto_66672 - BLOCK
      ?auto_66675 - BLOCK
      ?auto_66674 - BLOCK
      ?auto_66673 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66668 ) ( not ( = ?auto_66668 ?auto_66669 ) ) ( not ( = ?auto_66668 ?auto_66670 ) ) ( not ( = ?auto_66668 ?auto_66671 ) ) ( not ( = ?auto_66669 ?auto_66670 ) ) ( not ( = ?auto_66669 ?auto_66671 ) ) ( not ( = ?auto_66670 ?auto_66671 ) ) ( ON ?auto_66671 ?auto_66672 ) ( not ( = ?auto_66668 ?auto_66672 ) ) ( not ( = ?auto_66669 ?auto_66672 ) ) ( not ( = ?auto_66670 ?auto_66672 ) ) ( not ( = ?auto_66671 ?auto_66672 ) ) ( ON ?auto_66670 ?auto_66671 ) ( CLEAR ?auto_66670 ) ( ON-TABLE ?auto_66675 ) ( ON ?auto_66674 ?auto_66675 ) ( ON ?auto_66673 ?auto_66674 ) ( ON ?auto_66672 ?auto_66673 ) ( not ( = ?auto_66675 ?auto_66674 ) ) ( not ( = ?auto_66675 ?auto_66673 ) ) ( not ( = ?auto_66675 ?auto_66672 ) ) ( not ( = ?auto_66675 ?auto_66671 ) ) ( not ( = ?auto_66675 ?auto_66670 ) ) ( not ( = ?auto_66674 ?auto_66673 ) ) ( not ( = ?auto_66674 ?auto_66672 ) ) ( not ( = ?auto_66674 ?auto_66671 ) ) ( not ( = ?auto_66674 ?auto_66670 ) ) ( not ( = ?auto_66673 ?auto_66672 ) ) ( not ( = ?auto_66673 ?auto_66671 ) ) ( not ( = ?auto_66673 ?auto_66670 ) ) ( not ( = ?auto_66668 ?auto_66675 ) ) ( not ( = ?auto_66668 ?auto_66674 ) ) ( not ( = ?auto_66668 ?auto_66673 ) ) ( not ( = ?auto_66669 ?auto_66675 ) ) ( not ( = ?auto_66669 ?auto_66674 ) ) ( not ( = ?auto_66669 ?auto_66673 ) ) ( HOLDING ?auto_66669 ) ( CLEAR ?auto_66668 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66668 ?auto_66669 )
      ( MAKE-4PILE ?auto_66668 ?auto_66669 ?auto_66670 ?auto_66671 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66676 - BLOCK
      ?auto_66677 - BLOCK
      ?auto_66678 - BLOCK
      ?auto_66679 - BLOCK
    )
    :vars
    (
      ?auto_66680 - BLOCK
      ?auto_66682 - BLOCK
      ?auto_66683 - BLOCK
      ?auto_66681 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66676 ) ( not ( = ?auto_66676 ?auto_66677 ) ) ( not ( = ?auto_66676 ?auto_66678 ) ) ( not ( = ?auto_66676 ?auto_66679 ) ) ( not ( = ?auto_66677 ?auto_66678 ) ) ( not ( = ?auto_66677 ?auto_66679 ) ) ( not ( = ?auto_66678 ?auto_66679 ) ) ( ON ?auto_66679 ?auto_66680 ) ( not ( = ?auto_66676 ?auto_66680 ) ) ( not ( = ?auto_66677 ?auto_66680 ) ) ( not ( = ?auto_66678 ?auto_66680 ) ) ( not ( = ?auto_66679 ?auto_66680 ) ) ( ON ?auto_66678 ?auto_66679 ) ( ON-TABLE ?auto_66682 ) ( ON ?auto_66683 ?auto_66682 ) ( ON ?auto_66681 ?auto_66683 ) ( ON ?auto_66680 ?auto_66681 ) ( not ( = ?auto_66682 ?auto_66683 ) ) ( not ( = ?auto_66682 ?auto_66681 ) ) ( not ( = ?auto_66682 ?auto_66680 ) ) ( not ( = ?auto_66682 ?auto_66679 ) ) ( not ( = ?auto_66682 ?auto_66678 ) ) ( not ( = ?auto_66683 ?auto_66681 ) ) ( not ( = ?auto_66683 ?auto_66680 ) ) ( not ( = ?auto_66683 ?auto_66679 ) ) ( not ( = ?auto_66683 ?auto_66678 ) ) ( not ( = ?auto_66681 ?auto_66680 ) ) ( not ( = ?auto_66681 ?auto_66679 ) ) ( not ( = ?auto_66681 ?auto_66678 ) ) ( not ( = ?auto_66676 ?auto_66682 ) ) ( not ( = ?auto_66676 ?auto_66683 ) ) ( not ( = ?auto_66676 ?auto_66681 ) ) ( not ( = ?auto_66677 ?auto_66682 ) ) ( not ( = ?auto_66677 ?auto_66683 ) ) ( not ( = ?auto_66677 ?auto_66681 ) ) ( CLEAR ?auto_66676 ) ( ON ?auto_66677 ?auto_66678 ) ( CLEAR ?auto_66677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66682 ?auto_66683 ?auto_66681 ?auto_66680 ?auto_66679 ?auto_66678 )
      ( MAKE-4PILE ?auto_66676 ?auto_66677 ?auto_66678 ?auto_66679 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66684 - BLOCK
      ?auto_66685 - BLOCK
      ?auto_66686 - BLOCK
      ?auto_66687 - BLOCK
    )
    :vars
    (
      ?auto_66689 - BLOCK
      ?auto_66688 - BLOCK
      ?auto_66690 - BLOCK
      ?auto_66691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66684 ?auto_66685 ) ) ( not ( = ?auto_66684 ?auto_66686 ) ) ( not ( = ?auto_66684 ?auto_66687 ) ) ( not ( = ?auto_66685 ?auto_66686 ) ) ( not ( = ?auto_66685 ?auto_66687 ) ) ( not ( = ?auto_66686 ?auto_66687 ) ) ( ON ?auto_66687 ?auto_66689 ) ( not ( = ?auto_66684 ?auto_66689 ) ) ( not ( = ?auto_66685 ?auto_66689 ) ) ( not ( = ?auto_66686 ?auto_66689 ) ) ( not ( = ?auto_66687 ?auto_66689 ) ) ( ON ?auto_66686 ?auto_66687 ) ( ON-TABLE ?auto_66688 ) ( ON ?auto_66690 ?auto_66688 ) ( ON ?auto_66691 ?auto_66690 ) ( ON ?auto_66689 ?auto_66691 ) ( not ( = ?auto_66688 ?auto_66690 ) ) ( not ( = ?auto_66688 ?auto_66691 ) ) ( not ( = ?auto_66688 ?auto_66689 ) ) ( not ( = ?auto_66688 ?auto_66687 ) ) ( not ( = ?auto_66688 ?auto_66686 ) ) ( not ( = ?auto_66690 ?auto_66691 ) ) ( not ( = ?auto_66690 ?auto_66689 ) ) ( not ( = ?auto_66690 ?auto_66687 ) ) ( not ( = ?auto_66690 ?auto_66686 ) ) ( not ( = ?auto_66691 ?auto_66689 ) ) ( not ( = ?auto_66691 ?auto_66687 ) ) ( not ( = ?auto_66691 ?auto_66686 ) ) ( not ( = ?auto_66684 ?auto_66688 ) ) ( not ( = ?auto_66684 ?auto_66690 ) ) ( not ( = ?auto_66684 ?auto_66691 ) ) ( not ( = ?auto_66685 ?auto_66688 ) ) ( not ( = ?auto_66685 ?auto_66690 ) ) ( not ( = ?auto_66685 ?auto_66691 ) ) ( ON ?auto_66685 ?auto_66686 ) ( CLEAR ?auto_66685 ) ( HOLDING ?auto_66684 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66684 )
      ( MAKE-4PILE ?auto_66684 ?auto_66685 ?auto_66686 ?auto_66687 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66692 - BLOCK
      ?auto_66693 - BLOCK
      ?auto_66694 - BLOCK
      ?auto_66695 - BLOCK
    )
    :vars
    (
      ?auto_66698 - BLOCK
      ?auto_66699 - BLOCK
      ?auto_66696 - BLOCK
      ?auto_66697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66692 ?auto_66693 ) ) ( not ( = ?auto_66692 ?auto_66694 ) ) ( not ( = ?auto_66692 ?auto_66695 ) ) ( not ( = ?auto_66693 ?auto_66694 ) ) ( not ( = ?auto_66693 ?auto_66695 ) ) ( not ( = ?auto_66694 ?auto_66695 ) ) ( ON ?auto_66695 ?auto_66698 ) ( not ( = ?auto_66692 ?auto_66698 ) ) ( not ( = ?auto_66693 ?auto_66698 ) ) ( not ( = ?auto_66694 ?auto_66698 ) ) ( not ( = ?auto_66695 ?auto_66698 ) ) ( ON ?auto_66694 ?auto_66695 ) ( ON-TABLE ?auto_66699 ) ( ON ?auto_66696 ?auto_66699 ) ( ON ?auto_66697 ?auto_66696 ) ( ON ?auto_66698 ?auto_66697 ) ( not ( = ?auto_66699 ?auto_66696 ) ) ( not ( = ?auto_66699 ?auto_66697 ) ) ( not ( = ?auto_66699 ?auto_66698 ) ) ( not ( = ?auto_66699 ?auto_66695 ) ) ( not ( = ?auto_66699 ?auto_66694 ) ) ( not ( = ?auto_66696 ?auto_66697 ) ) ( not ( = ?auto_66696 ?auto_66698 ) ) ( not ( = ?auto_66696 ?auto_66695 ) ) ( not ( = ?auto_66696 ?auto_66694 ) ) ( not ( = ?auto_66697 ?auto_66698 ) ) ( not ( = ?auto_66697 ?auto_66695 ) ) ( not ( = ?auto_66697 ?auto_66694 ) ) ( not ( = ?auto_66692 ?auto_66699 ) ) ( not ( = ?auto_66692 ?auto_66696 ) ) ( not ( = ?auto_66692 ?auto_66697 ) ) ( not ( = ?auto_66693 ?auto_66699 ) ) ( not ( = ?auto_66693 ?auto_66696 ) ) ( not ( = ?auto_66693 ?auto_66697 ) ) ( ON ?auto_66693 ?auto_66694 ) ( ON ?auto_66692 ?auto_66693 ) ( CLEAR ?auto_66692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_66699 ?auto_66696 ?auto_66697 ?auto_66698 ?auto_66695 ?auto_66694 ?auto_66693 )
      ( MAKE-4PILE ?auto_66692 ?auto_66693 ?auto_66694 ?auto_66695 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66703 - BLOCK
      ?auto_66704 - BLOCK
      ?auto_66705 - BLOCK
    )
    :vars
    (
      ?auto_66706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66706 ?auto_66705 ) ( CLEAR ?auto_66706 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66703 ) ( ON ?auto_66704 ?auto_66703 ) ( ON ?auto_66705 ?auto_66704 ) ( not ( = ?auto_66703 ?auto_66704 ) ) ( not ( = ?auto_66703 ?auto_66705 ) ) ( not ( = ?auto_66703 ?auto_66706 ) ) ( not ( = ?auto_66704 ?auto_66705 ) ) ( not ( = ?auto_66704 ?auto_66706 ) ) ( not ( = ?auto_66705 ?auto_66706 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66706 ?auto_66705 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66707 - BLOCK
      ?auto_66708 - BLOCK
      ?auto_66709 - BLOCK
    )
    :vars
    (
      ?auto_66710 - BLOCK
      ?auto_66711 - BLOCK
      ?auto_66712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66710 ?auto_66709 ) ( CLEAR ?auto_66710 ) ( ON-TABLE ?auto_66707 ) ( ON ?auto_66708 ?auto_66707 ) ( ON ?auto_66709 ?auto_66708 ) ( not ( = ?auto_66707 ?auto_66708 ) ) ( not ( = ?auto_66707 ?auto_66709 ) ) ( not ( = ?auto_66707 ?auto_66710 ) ) ( not ( = ?auto_66708 ?auto_66709 ) ) ( not ( = ?auto_66708 ?auto_66710 ) ) ( not ( = ?auto_66709 ?auto_66710 ) ) ( HOLDING ?auto_66711 ) ( CLEAR ?auto_66712 ) ( not ( = ?auto_66707 ?auto_66711 ) ) ( not ( = ?auto_66707 ?auto_66712 ) ) ( not ( = ?auto_66708 ?auto_66711 ) ) ( not ( = ?auto_66708 ?auto_66712 ) ) ( not ( = ?auto_66709 ?auto_66711 ) ) ( not ( = ?auto_66709 ?auto_66712 ) ) ( not ( = ?auto_66710 ?auto_66711 ) ) ( not ( = ?auto_66710 ?auto_66712 ) ) ( not ( = ?auto_66711 ?auto_66712 ) ) )
    :subtasks
    ( ( !STACK ?auto_66711 ?auto_66712 )
      ( MAKE-3PILE ?auto_66707 ?auto_66708 ?auto_66709 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66713 - BLOCK
      ?auto_66714 - BLOCK
      ?auto_66715 - BLOCK
    )
    :vars
    (
      ?auto_66716 - BLOCK
      ?auto_66718 - BLOCK
      ?auto_66717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66716 ?auto_66715 ) ( ON-TABLE ?auto_66713 ) ( ON ?auto_66714 ?auto_66713 ) ( ON ?auto_66715 ?auto_66714 ) ( not ( = ?auto_66713 ?auto_66714 ) ) ( not ( = ?auto_66713 ?auto_66715 ) ) ( not ( = ?auto_66713 ?auto_66716 ) ) ( not ( = ?auto_66714 ?auto_66715 ) ) ( not ( = ?auto_66714 ?auto_66716 ) ) ( not ( = ?auto_66715 ?auto_66716 ) ) ( CLEAR ?auto_66718 ) ( not ( = ?auto_66713 ?auto_66717 ) ) ( not ( = ?auto_66713 ?auto_66718 ) ) ( not ( = ?auto_66714 ?auto_66717 ) ) ( not ( = ?auto_66714 ?auto_66718 ) ) ( not ( = ?auto_66715 ?auto_66717 ) ) ( not ( = ?auto_66715 ?auto_66718 ) ) ( not ( = ?auto_66716 ?auto_66717 ) ) ( not ( = ?auto_66716 ?auto_66718 ) ) ( not ( = ?auto_66717 ?auto_66718 ) ) ( ON ?auto_66717 ?auto_66716 ) ( CLEAR ?auto_66717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66713 ?auto_66714 ?auto_66715 ?auto_66716 )
      ( MAKE-3PILE ?auto_66713 ?auto_66714 ?auto_66715 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66719 - BLOCK
      ?auto_66720 - BLOCK
      ?auto_66721 - BLOCK
    )
    :vars
    (
      ?auto_66723 - BLOCK
      ?auto_66724 - BLOCK
      ?auto_66722 - BLOCK
      ?auto_66726 - BLOCK
      ?auto_66725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66723 ?auto_66721 ) ( ON-TABLE ?auto_66719 ) ( ON ?auto_66720 ?auto_66719 ) ( ON ?auto_66721 ?auto_66720 ) ( not ( = ?auto_66719 ?auto_66720 ) ) ( not ( = ?auto_66719 ?auto_66721 ) ) ( not ( = ?auto_66719 ?auto_66723 ) ) ( not ( = ?auto_66720 ?auto_66721 ) ) ( not ( = ?auto_66720 ?auto_66723 ) ) ( not ( = ?auto_66721 ?auto_66723 ) ) ( not ( = ?auto_66719 ?auto_66724 ) ) ( not ( = ?auto_66719 ?auto_66722 ) ) ( not ( = ?auto_66720 ?auto_66724 ) ) ( not ( = ?auto_66720 ?auto_66722 ) ) ( not ( = ?auto_66721 ?auto_66724 ) ) ( not ( = ?auto_66721 ?auto_66722 ) ) ( not ( = ?auto_66723 ?auto_66724 ) ) ( not ( = ?auto_66723 ?auto_66722 ) ) ( not ( = ?auto_66724 ?auto_66722 ) ) ( ON ?auto_66724 ?auto_66723 ) ( CLEAR ?auto_66724 ) ( HOLDING ?auto_66722 ) ( CLEAR ?auto_66726 ) ( ON-TABLE ?auto_66725 ) ( ON ?auto_66726 ?auto_66725 ) ( not ( = ?auto_66725 ?auto_66726 ) ) ( not ( = ?auto_66725 ?auto_66722 ) ) ( not ( = ?auto_66726 ?auto_66722 ) ) ( not ( = ?auto_66719 ?auto_66726 ) ) ( not ( = ?auto_66719 ?auto_66725 ) ) ( not ( = ?auto_66720 ?auto_66726 ) ) ( not ( = ?auto_66720 ?auto_66725 ) ) ( not ( = ?auto_66721 ?auto_66726 ) ) ( not ( = ?auto_66721 ?auto_66725 ) ) ( not ( = ?auto_66723 ?auto_66726 ) ) ( not ( = ?auto_66723 ?auto_66725 ) ) ( not ( = ?auto_66724 ?auto_66726 ) ) ( not ( = ?auto_66724 ?auto_66725 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66725 ?auto_66726 ?auto_66722 )
      ( MAKE-3PILE ?auto_66719 ?auto_66720 ?auto_66721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66727 - BLOCK
      ?auto_66728 - BLOCK
      ?auto_66729 - BLOCK
    )
    :vars
    (
      ?auto_66731 - BLOCK
      ?auto_66734 - BLOCK
      ?auto_66730 - BLOCK
      ?auto_66733 - BLOCK
      ?auto_66732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66731 ?auto_66729 ) ( ON-TABLE ?auto_66727 ) ( ON ?auto_66728 ?auto_66727 ) ( ON ?auto_66729 ?auto_66728 ) ( not ( = ?auto_66727 ?auto_66728 ) ) ( not ( = ?auto_66727 ?auto_66729 ) ) ( not ( = ?auto_66727 ?auto_66731 ) ) ( not ( = ?auto_66728 ?auto_66729 ) ) ( not ( = ?auto_66728 ?auto_66731 ) ) ( not ( = ?auto_66729 ?auto_66731 ) ) ( not ( = ?auto_66727 ?auto_66734 ) ) ( not ( = ?auto_66727 ?auto_66730 ) ) ( not ( = ?auto_66728 ?auto_66734 ) ) ( not ( = ?auto_66728 ?auto_66730 ) ) ( not ( = ?auto_66729 ?auto_66734 ) ) ( not ( = ?auto_66729 ?auto_66730 ) ) ( not ( = ?auto_66731 ?auto_66734 ) ) ( not ( = ?auto_66731 ?auto_66730 ) ) ( not ( = ?auto_66734 ?auto_66730 ) ) ( ON ?auto_66734 ?auto_66731 ) ( CLEAR ?auto_66733 ) ( ON-TABLE ?auto_66732 ) ( ON ?auto_66733 ?auto_66732 ) ( not ( = ?auto_66732 ?auto_66733 ) ) ( not ( = ?auto_66732 ?auto_66730 ) ) ( not ( = ?auto_66733 ?auto_66730 ) ) ( not ( = ?auto_66727 ?auto_66733 ) ) ( not ( = ?auto_66727 ?auto_66732 ) ) ( not ( = ?auto_66728 ?auto_66733 ) ) ( not ( = ?auto_66728 ?auto_66732 ) ) ( not ( = ?auto_66729 ?auto_66733 ) ) ( not ( = ?auto_66729 ?auto_66732 ) ) ( not ( = ?auto_66731 ?auto_66733 ) ) ( not ( = ?auto_66731 ?auto_66732 ) ) ( not ( = ?auto_66734 ?auto_66733 ) ) ( not ( = ?auto_66734 ?auto_66732 ) ) ( ON ?auto_66730 ?auto_66734 ) ( CLEAR ?auto_66730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66727 ?auto_66728 ?auto_66729 ?auto_66731 ?auto_66734 )
      ( MAKE-3PILE ?auto_66727 ?auto_66728 ?auto_66729 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66735 - BLOCK
      ?auto_66736 - BLOCK
      ?auto_66737 - BLOCK
    )
    :vars
    (
      ?auto_66738 - BLOCK
      ?auto_66741 - BLOCK
      ?auto_66739 - BLOCK
      ?auto_66740 - BLOCK
      ?auto_66742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66738 ?auto_66737 ) ( ON-TABLE ?auto_66735 ) ( ON ?auto_66736 ?auto_66735 ) ( ON ?auto_66737 ?auto_66736 ) ( not ( = ?auto_66735 ?auto_66736 ) ) ( not ( = ?auto_66735 ?auto_66737 ) ) ( not ( = ?auto_66735 ?auto_66738 ) ) ( not ( = ?auto_66736 ?auto_66737 ) ) ( not ( = ?auto_66736 ?auto_66738 ) ) ( not ( = ?auto_66737 ?auto_66738 ) ) ( not ( = ?auto_66735 ?auto_66741 ) ) ( not ( = ?auto_66735 ?auto_66739 ) ) ( not ( = ?auto_66736 ?auto_66741 ) ) ( not ( = ?auto_66736 ?auto_66739 ) ) ( not ( = ?auto_66737 ?auto_66741 ) ) ( not ( = ?auto_66737 ?auto_66739 ) ) ( not ( = ?auto_66738 ?auto_66741 ) ) ( not ( = ?auto_66738 ?auto_66739 ) ) ( not ( = ?auto_66741 ?auto_66739 ) ) ( ON ?auto_66741 ?auto_66738 ) ( ON-TABLE ?auto_66740 ) ( not ( = ?auto_66740 ?auto_66742 ) ) ( not ( = ?auto_66740 ?auto_66739 ) ) ( not ( = ?auto_66742 ?auto_66739 ) ) ( not ( = ?auto_66735 ?auto_66742 ) ) ( not ( = ?auto_66735 ?auto_66740 ) ) ( not ( = ?auto_66736 ?auto_66742 ) ) ( not ( = ?auto_66736 ?auto_66740 ) ) ( not ( = ?auto_66737 ?auto_66742 ) ) ( not ( = ?auto_66737 ?auto_66740 ) ) ( not ( = ?auto_66738 ?auto_66742 ) ) ( not ( = ?auto_66738 ?auto_66740 ) ) ( not ( = ?auto_66741 ?auto_66742 ) ) ( not ( = ?auto_66741 ?auto_66740 ) ) ( ON ?auto_66739 ?auto_66741 ) ( CLEAR ?auto_66739 ) ( HOLDING ?auto_66742 ) ( CLEAR ?auto_66740 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66740 ?auto_66742 )
      ( MAKE-3PILE ?auto_66735 ?auto_66736 ?auto_66737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67920 - BLOCK
      ?auto_67921 - BLOCK
      ?auto_67922 - BLOCK
    )
    :vars
    (
      ?auto_67924 - BLOCK
      ?auto_67925 - BLOCK
      ?auto_67926 - BLOCK
      ?auto_67923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67924 ?auto_67922 ) ( ON-TABLE ?auto_67920 ) ( ON ?auto_67921 ?auto_67920 ) ( ON ?auto_67922 ?auto_67921 ) ( not ( = ?auto_67920 ?auto_67921 ) ) ( not ( = ?auto_67920 ?auto_67922 ) ) ( not ( = ?auto_67920 ?auto_67924 ) ) ( not ( = ?auto_67921 ?auto_67922 ) ) ( not ( = ?auto_67921 ?auto_67924 ) ) ( not ( = ?auto_67922 ?auto_67924 ) ) ( not ( = ?auto_67920 ?auto_67925 ) ) ( not ( = ?auto_67920 ?auto_67926 ) ) ( not ( = ?auto_67921 ?auto_67925 ) ) ( not ( = ?auto_67921 ?auto_67926 ) ) ( not ( = ?auto_67922 ?auto_67925 ) ) ( not ( = ?auto_67922 ?auto_67926 ) ) ( not ( = ?auto_67924 ?auto_67925 ) ) ( not ( = ?auto_67924 ?auto_67926 ) ) ( not ( = ?auto_67925 ?auto_67926 ) ) ( ON ?auto_67925 ?auto_67924 ) ( not ( = ?auto_67923 ?auto_67926 ) ) ( not ( = ?auto_67920 ?auto_67923 ) ) ( not ( = ?auto_67921 ?auto_67923 ) ) ( not ( = ?auto_67922 ?auto_67923 ) ) ( not ( = ?auto_67924 ?auto_67923 ) ) ( not ( = ?auto_67925 ?auto_67923 ) ) ( ON ?auto_67926 ?auto_67925 ) ( ON ?auto_67923 ?auto_67926 ) ( CLEAR ?auto_67923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67920 ?auto_67921 ?auto_67922 ?auto_67924 ?auto_67925 ?auto_67926 )
      ( MAKE-3PILE ?auto_67920 ?auto_67921 ?auto_67922 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66751 - BLOCK
      ?auto_66752 - BLOCK
      ?auto_66753 - BLOCK
    )
    :vars
    (
      ?auto_66756 - BLOCK
      ?auto_66758 - BLOCK
      ?auto_66757 - BLOCK
      ?auto_66754 - BLOCK
      ?auto_66755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66756 ?auto_66753 ) ( ON-TABLE ?auto_66751 ) ( ON ?auto_66752 ?auto_66751 ) ( ON ?auto_66753 ?auto_66752 ) ( not ( = ?auto_66751 ?auto_66752 ) ) ( not ( = ?auto_66751 ?auto_66753 ) ) ( not ( = ?auto_66751 ?auto_66756 ) ) ( not ( = ?auto_66752 ?auto_66753 ) ) ( not ( = ?auto_66752 ?auto_66756 ) ) ( not ( = ?auto_66753 ?auto_66756 ) ) ( not ( = ?auto_66751 ?auto_66758 ) ) ( not ( = ?auto_66751 ?auto_66757 ) ) ( not ( = ?auto_66752 ?auto_66758 ) ) ( not ( = ?auto_66752 ?auto_66757 ) ) ( not ( = ?auto_66753 ?auto_66758 ) ) ( not ( = ?auto_66753 ?auto_66757 ) ) ( not ( = ?auto_66756 ?auto_66758 ) ) ( not ( = ?auto_66756 ?auto_66757 ) ) ( not ( = ?auto_66758 ?auto_66757 ) ) ( ON ?auto_66758 ?auto_66756 ) ( not ( = ?auto_66754 ?auto_66755 ) ) ( not ( = ?auto_66754 ?auto_66757 ) ) ( not ( = ?auto_66755 ?auto_66757 ) ) ( not ( = ?auto_66751 ?auto_66755 ) ) ( not ( = ?auto_66751 ?auto_66754 ) ) ( not ( = ?auto_66752 ?auto_66755 ) ) ( not ( = ?auto_66752 ?auto_66754 ) ) ( not ( = ?auto_66753 ?auto_66755 ) ) ( not ( = ?auto_66753 ?auto_66754 ) ) ( not ( = ?auto_66756 ?auto_66755 ) ) ( not ( = ?auto_66756 ?auto_66754 ) ) ( not ( = ?auto_66758 ?auto_66755 ) ) ( not ( = ?auto_66758 ?auto_66754 ) ) ( ON ?auto_66757 ?auto_66758 ) ( ON ?auto_66755 ?auto_66757 ) ( CLEAR ?auto_66755 ) ( HOLDING ?auto_66754 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66754 )
      ( MAKE-3PILE ?auto_66751 ?auto_66752 ?auto_66753 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66759 - BLOCK
      ?auto_66760 - BLOCK
      ?auto_66761 - BLOCK
    )
    :vars
    (
      ?auto_66764 - BLOCK
      ?auto_66765 - BLOCK
      ?auto_66763 - BLOCK
      ?auto_66762 - BLOCK
      ?auto_66766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66764 ?auto_66761 ) ( ON-TABLE ?auto_66759 ) ( ON ?auto_66760 ?auto_66759 ) ( ON ?auto_66761 ?auto_66760 ) ( not ( = ?auto_66759 ?auto_66760 ) ) ( not ( = ?auto_66759 ?auto_66761 ) ) ( not ( = ?auto_66759 ?auto_66764 ) ) ( not ( = ?auto_66760 ?auto_66761 ) ) ( not ( = ?auto_66760 ?auto_66764 ) ) ( not ( = ?auto_66761 ?auto_66764 ) ) ( not ( = ?auto_66759 ?auto_66765 ) ) ( not ( = ?auto_66759 ?auto_66763 ) ) ( not ( = ?auto_66760 ?auto_66765 ) ) ( not ( = ?auto_66760 ?auto_66763 ) ) ( not ( = ?auto_66761 ?auto_66765 ) ) ( not ( = ?auto_66761 ?auto_66763 ) ) ( not ( = ?auto_66764 ?auto_66765 ) ) ( not ( = ?auto_66764 ?auto_66763 ) ) ( not ( = ?auto_66765 ?auto_66763 ) ) ( ON ?auto_66765 ?auto_66764 ) ( not ( = ?auto_66762 ?auto_66766 ) ) ( not ( = ?auto_66762 ?auto_66763 ) ) ( not ( = ?auto_66766 ?auto_66763 ) ) ( not ( = ?auto_66759 ?auto_66766 ) ) ( not ( = ?auto_66759 ?auto_66762 ) ) ( not ( = ?auto_66760 ?auto_66766 ) ) ( not ( = ?auto_66760 ?auto_66762 ) ) ( not ( = ?auto_66761 ?auto_66766 ) ) ( not ( = ?auto_66761 ?auto_66762 ) ) ( not ( = ?auto_66764 ?auto_66766 ) ) ( not ( = ?auto_66764 ?auto_66762 ) ) ( not ( = ?auto_66765 ?auto_66766 ) ) ( not ( = ?auto_66765 ?auto_66762 ) ) ( ON ?auto_66763 ?auto_66765 ) ( ON ?auto_66766 ?auto_66763 ) ( ON ?auto_66762 ?auto_66766 ) ( CLEAR ?auto_66762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_66759 ?auto_66760 ?auto_66761 ?auto_66764 ?auto_66765 ?auto_66763 ?auto_66766 )
      ( MAKE-3PILE ?auto_66759 ?auto_66760 ?auto_66761 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66772 - BLOCK
      ?auto_66773 - BLOCK
      ?auto_66774 - BLOCK
      ?auto_66775 - BLOCK
      ?auto_66776 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_66776 ) ( CLEAR ?auto_66775 ) ( ON-TABLE ?auto_66772 ) ( ON ?auto_66773 ?auto_66772 ) ( ON ?auto_66774 ?auto_66773 ) ( ON ?auto_66775 ?auto_66774 ) ( not ( = ?auto_66772 ?auto_66773 ) ) ( not ( = ?auto_66772 ?auto_66774 ) ) ( not ( = ?auto_66772 ?auto_66775 ) ) ( not ( = ?auto_66772 ?auto_66776 ) ) ( not ( = ?auto_66773 ?auto_66774 ) ) ( not ( = ?auto_66773 ?auto_66775 ) ) ( not ( = ?auto_66773 ?auto_66776 ) ) ( not ( = ?auto_66774 ?auto_66775 ) ) ( not ( = ?auto_66774 ?auto_66776 ) ) ( not ( = ?auto_66775 ?auto_66776 ) ) )
    :subtasks
    ( ( !STACK ?auto_66776 ?auto_66775 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66777 - BLOCK
      ?auto_66778 - BLOCK
      ?auto_66779 - BLOCK
      ?auto_66780 - BLOCK
      ?auto_66781 - BLOCK
    )
    :vars
    (
      ?auto_66782 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66780 ) ( ON-TABLE ?auto_66777 ) ( ON ?auto_66778 ?auto_66777 ) ( ON ?auto_66779 ?auto_66778 ) ( ON ?auto_66780 ?auto_66779 ) ( not ( = ?auto_66777 ?auto_66778 ) ) ( not ( = ?auto_66777 ?auto_66779 ) ) ( not ( = ?auto_66777 ?auto_66780 ) ) ( not ( = ?auto_66777 ?auto_66781 ) ) ( not ( = ?auto_66778 ?auto_66779 ) ) ( not ( = ?auto_66778 ?auto_66780 ) ) ( not ( = ?auto_66778 ?auto_66781 ) ) ( not ( = ?auto_66779 ?auto_66780 ) ) ( not ( = ?auto_66779 ?auto_66781 ) ) ( not ( = ?auto_66780 ?auto_66781 ) ) ( ON ?auto_66781 ?auto_66782 ) ( CLEAR ?auto_66781 ) ( HAND-EMPTY ) ( not ( = ?auto_66777 ?auto_66782 ) ) ( not ( = ?auto_66778 ?auto_66782 ) ) ( not ( = ?auto_66779 ?auto_66782 ) ) ( not ( = ?auto_66780 ?auto_66782 ) ) ( not ( = ?auto_66781 ?auto_66782 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66781 ?auto_66782 )
      ( MAKE-5PILE ?auto_66777 ?auto_66778 ?auto_66779 ?auto_66780 ?auto_66781 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66783 - BLOCK
      ?auto_66784 - BLOCK
      ?auto_66785 - BLOCK
      ?auto_66786 - BLOCK
      ?auto_66787 - BLOCK
    )
    :vars
    (
      ?auto_66788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66783 ) ( ON ?auto_66784 ?auto_66783 ) ( ON ?auto_66785 ?auto_66784 ) ( not ( = ?auto_66783 ?auto_66784 ) ) ( not ( = ?auto_66783 ?auto_66785 ) ) ( not ( = ?auto_66783 ?auto_66786 ) ) ( not ( = ?auto_66783 ?auto_66787 ) ) ( not ( = ?auto_66784 ?auto_66785 ) ) ( not ( = ?auto_66784 ?auto_66786 ) ) ( not ( = ?auto_66784 ?auto_66787 ) ) ( not ( = ?auto_66785 ?auto_66786 ) ) ( not ( = ?auto_66785 ?auto_66787 ) ) ( not ( = ?auto_66786 ?auto_66787 ) ) ( ON ?auto_66787 ?auto_66788 ) ( CLEAR ?auto_66787 ) ( not ( = ?auto_66783 ?auto_66788 ) ) ( not ( = ?auto_66784 ?auto_66788 ) ) ( not ( = ?auto_66785 ?auto_66788 ) ) ( not ( = ?auto_66786 ?auto_66788 ) ) ( not ( = ?auto_66787 ?auto_66788 ) ) ( HOLDING ?auto_66786 ) ( CLEAR ?auto_66785 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66783 ?auto_66784 ?auto_66785 ?auto_66786 )
      ( MAKE-5PILE ?auto_66783 ?auto_66784 ?auto_66785 ?auto_66786 ?auto_66787 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66789 - BLOCK
      ?auto_66790 - BLOCK
      ?auto_66791 - BLOCK
      ?auto_66792 - BLOCK
      ?auto_66793 - BLOCK
    )
    :vars
    (
      ?auto_66794 - BLOCK
      ?auto_66796 - BLOCK
      ?auto_66795 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66789 ) ( ON ?auto_66790 ?auto_66789 ) ( ON ?auto_66791 ?auto_66790 ) ( not ( = ?auto_66789 ?auto_66790 ) ) ( not ( = ?auto_66789 ?auto_66791 ) ) ( not ( = ?auto_66789 ?auto_66792 ) ) ( not ( = ?auto_66789 ?auto_66793 ) ) ( not ( = ?auto_66790 ?auto_66791 ) ) ( not ( = ?auto_66790 ?auto_66792 ) ) ( not ( = ?auto_66790 ?auto_66793 ) ) ( not ( = ?auto_66791 ?auto_66792 ) ) ( not ( = ?auto_66791 ?auto_66793 ) ) ( not ( = ?auto_66792 ?auto_66793 ) ) ( ON ?auto_66793 ?auto_66794 ) ( not ( = ?auto_66789 ?auto_66794 ) ) ( not ( = ?auto_66790 ?auto_66794 ) ) ( not ( = ?auto_66791 ?auto_66794 ) ) ( not ( = ?auto_66792 ?auto_66794 ) ) ( not ( = ?auto_66793 ?auto_66794 ) ) ( CLEAR ?auto_66791 ) ( ON ?auto_66792 ?auto_66793 ) ( CLEAR ?auto_66792 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66796 ) ( ON ?auto_66795 ?auto_66796 ) ( ON ?auto_66794 ?auto_66795 ) ( not ( = ?auto_66796 ?auto_66795 ) ) ( not ( = ?auto_66796 ?auto_66794 ) ) ( not ( = ?auto_66796 ?auto_66793 ) ) ( not ( = ?auto_66796 ?auto_66792 ) ) ( not ( = ?auto_66795 ?auto_66794 ) ) ( not ( = ?auto_66795 ?auto_66793 ) ) ( not ( = ?auto_66795 ?auto_66792 ) ) ( not ( = ?auto_66789 ?auto_66796 ) ) ( not ( = ?auto_66789 ?auto_66795 ) ) ( not ( = ?auto_66790 ?auto_66796 ) ) ( not ( = ?auto_66790 ?auto_66795 ) ) ( not ( = ?auto_66791 ?auto_66796 ) ) ( not ( = ?auto_66791 ?auto_66795 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66796 ?auto_66795 ?auto_66794 ?auto_66793 )
      ( MAKE-5PILE ?auto_66789 ?auto_66790 ?auto_66791 ?auto_66792 ?auto_66793 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66797 - BLOCK
      ?auto_66798 - BLOCK
      ?auto_66799 - BLOCK
      ?auto_66800 - BLOCK
      ?auto_66801 - BLOCK
    )
    :vars
    (
      ?auto_66804 - BLOCK
      ?auto_66803 - BLOCK
      ?auto_66802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66797 ) ( ON ?auto_66798 ?auto_66797 ) ( not ( = ?auto_66797 ?auto_66798 ) ) ( not ( = ?auto_66797 ?auto_66799 ) ) ( not ( = ?auto_66797 ?auto_66800 ) ) ( not ( = ?auto_66797 ?auto_66801 ) ) ( not ( = ?auto_66798 ?auto_66799 ) ) ( not ( = ?auto_66798 ?auto_66800 ) ) ( not ( = ?auto_66798 ?auto_66801 ) ) ( not ( = ?auto_66799 ?auto_66800 ) ) ( not ( = ?auto_66799 ?auto_66801 ) ) ( not ( = ?auto_66800 ?auto_66801 ) ) ( ON ?auto_66801 ?auto_66804 ) ( not ( = ?auto_66797 ?auto_66804 ) ) ( not ( = ?auto_66798 ?auto_66804 ) ) ( not ( = ?auto_66799 ?auto_66804 ) ) ( not ( = ?auto_66800 ?auto_66804 ) ) ( not ( = ?auto_66801 ?auto_66804 ) ) ( ON ?auto_66800 ?auto_66801 ) ( CLEAR ?auto_66800 ) ( ON-TABLE ?auto_66803 ) ( ON ?auto_66802 ?auto_66803 ) ( ON ?auto_66804 ?auto_66802 ) ( not ( = ?auto_66803 ?auto_66802 ) ) ( not ( = ?auto_66803 ?auto_66804 ) ) ( not ( = ?auto_66803 ?auto_66801 ) ) ( not ( = ?auto_66803 ?auto_66800 ) ) ( not ( = ?auto_66802 ?auto_66804 ) ) ( not ( = ?auto_66802 ?auto_66801 ) ) ( not ( = ?auto_66802 ?auto_66800 ) ) ( not ( = ?auto_66797 ?auto_66803 ) ) ( not ( = ?auto_66797 ?auto_66802 ) ) ( not ( = ?auto_66798 ?auto_66803 ) ) ( not ( = ?auto_66798 ?auto_66802 ) ) ( not ( = ?auto_66799 ?auto_66803 ) ) ( not ( = ?auto_66799 ?auto_66802 ) ) ( HOLDING ?auto_66799 ) ( CLEAR ?auto_66798 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66797 ?auto_66798 ?auto_66799 )
      ( MAKE-5PILE ?auto_66797 ?auto_66798 ?auto_66799 ?auto_66800 ?auto_66801 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66805 - BLOCK
      ?auto_66806 - BLOCK
      ?auto_66807 - BLOCK
      ?auto_66808 - BLOCK
      ?auto_66809 - BLOCK
    )
    :vars
    (
      ?auto_66811 - BLOCK
      ?auto_66810 - BLOCK
      ?auto_66812 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66805 ) ( ON ?auto_66806 ?auto_66805 ) ( not ( = ?auto_66805 ?auto_66806 ) ) ( not ( = ?auto_66805 ?auto_66807 ) ) ( not ( = ?auto_66805 ?auto_66808 ) ) ( not ( = ?auto_66805 ?auto_66809 ) ) ( not ( = ?auto_66806 ?auto_66807 ) ) ( not ( = ?auto_66806 ?auto_66808 ) ) ( not ( = ?auto_66806 ?auto_66809 ) ) ( not ( = ?auto_66807 ?auto_66808 ) ) ( not ( = ?auto_66807 ?auto_66809 ) ) ( not ( = ?auto_66808 ?auto_66809 ) ) ( ON ?auto_66809 ?auto_66811 ) ( not ( = ?auto_66805 ?auto_66811 ) ) ( not ( = ?auto_66806 ?auto_66811 ) ) ( not ( = ?auto_66807 ?auto_66811 ) ) ( not ( = ?auto_66808 ?auto_66811 ) ) ( not ( = ?auto_66809 ?auto_66811 ) ) ( ON ?auto_66808 ?auto_66809 ) ( ON-TABLE ?auto_66810 ) ( ON ?auto_66812 ?auto_66810 ) ( ON ?auto_66811 ?auto_66812 ) ( not ( = ?auto_66810 ?auto_66812 ) ) ( not ( = ?auto_66810 ?auto_66811 ) ) ( not ( = ?auto_66810 ?auto_66809 ) ) ( not ( = ?auto_66810 ?auto_66808 ) ) ( not ( = ?auto_66812 ?auto_66811 ) ) ( not ( = ?auto_66812 ?auto_66809 ) ) ( not ( = ?auto_66812 ?auto_66808 ) ) ( not ( = ?auto_66805 ?auto_66810 ) ) ( not ( = ?auto_66805 ?auto_66812 ) ) ( not ( = ?auto_66806 ?auto_66810 ) ) ( not ( = ?auto_66806 ?auto_66812 ) ) ( not ( = ?auto_66807 ?auto_66810 ) ) ( not ( = ?auto_66807 ?auto_66812 ) ) ( CLEAR ?auto_66806 ) ( ON ?auto_66807 ?auto_66808 ) ( CLEAR ?auto_66807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66810 ?auto_66812 ?auto_66811 ?auto_66809 ?auto_66808 )
      ( MAKE-5PILE ?auto_66805 ?auto_66806 ?auto_66807 ?auto_66808 ?auto_66809 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66813 - BLOCK
      ?auto_66814 - BLOCK
      ?auto_66815 - BLOCK
      ?auto_66816 - BLOCK
      ?auto_66817 - BLOCK
    )
    :vars
    (
      ?auto_66820 - BLOCK
      ?auto_66818 - BLOCK
      ?auto_66819 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66813 ) ( not ( = ?auto_66813 ?auto_66814 ) ) ( not ( = ?auto_66813 ?auto_66815 ) ) ( not ( = ?auto_66813 ?auto_66816 ) ) ( not ( = ?auto_66813 ?auto_66817 ) ) ( not ( = ?auto_66814 ?auto_66815 ) ) ( not ( = ?auto_66814 ?auto_66816 ) ) ( not ( = ?auto_66814 ?auto_66817 ) ) ( not ( = ?auto_66815 ?auto_66816 ) ) ( not ( = ?auto_66815 ?auto_66817 ) ) ( not ( = ?auto_66816 ?auto_66817 ) ) ( ON ?auto_66817 ?auto_66820 ) ( not ( = ?auto_66813 ?auto_66820 ) ) ( not ( = ?auto_66814 ?auto_66820 ) ) ( not ( = ?auto_66815 ?auto_66820 ) ) ( not ( = ?auto_66816 ?auto_66820 ) ) ( not ( = ?auto_66817 ?auto_66820 ) ) ( ON ?auto_66816 ?auto_66817 ) ( ON-TABLE ?auto_66818 ) ( ON ?auto_66819 ?auto_66818 ) ( ON ?auto_66820 ?auto_66819 ) ( not ( = ?auto_66818 ?auto_66819 ) ) ( not ( = ?auto_66818 ?auto_66820 ) ) ( not ( = ?auto_66818 ?auto_66817 ) ) ( not ( = ?auto_66818 ?auto_66816 ) ) ( not ( = ?auto_66819 ?auto_66820 ) ) ( not ( = ?auto_66819 ?auto_66817 ) ) ( not ( = ?auto_66819 ?auto_66816 ) ) ( not ( = ?auto_66813 ?auto_66818 ) ) ( not ( = ?auto_66813 ?auto_66819 ) ) ( not ( = ?auto_66814 ?auto_66818 ) ) ( not ( = ?auto_66814 ?auto_66819 ) ) ( not ( = ?auto_66815 ?auto_66818 ) ) ( not ( = ?auto_66815 ?auto_66819 ) ) ( ON ?auto_66815 ?auto_66816 ) ( CLEAR ?auto_66815 ) ( HOLDING ?auto_66814 ) ( CLEAR ?auto_66813 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66813 ?auto_66814 )
      ( MAKE-5PILE ?auto_66813 ?auto_66814 ?auto_66815 ?auto_66816 ?auto_66817 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66821 - BLOCK
      ?auto_66822 - BLOCK
      ?auto_66823 - BLOCK
      ?auto_66824 - BLOCK
      ?auto_66825 - BLOCK
    )
    :vars
    (
      ?auto_66828 - BLOCK
      ?auto_66827 - BLOCK
      ?auto_66826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66821 ) ( not ( = ?auto_66821 ?auto_66822 ) ) ( not ( = ?auto_66821 ?auto_66823 ) ) ( not ( = ?auto_66821 ?auto_66824 ) ) ( not ( = ?auto_66821 ?auto_66825 ) ) ( not ( = ?auto_66822 ?auto_66823 ) ) ( not ( = ?auto_66822 ?auto_66824 ) ) ( not ( = ?auto_66822 ?auto_66825 ) ) ( not ( = ?auto_66823 ?auto_66824 ) ) ( not ( = ?auto_66823 ?auto_66825 ) ) ( not ( = ?auto_66824 ?auto_66825 ) ) ( ON ?auto_66825 ?auto_66828 ) ( not ( = ?auto_66821 ?auto_66828 ) ) ( not ( = ?auto_66822 ?auto_66828 ) ) ( not ( = ?auto_66823 ?auto_66828 ) ) ( not ( = ?auto_66824 ?auto_66828 ) ) ( not ( = ?auto_66825 ?auto_66828 ) ) ( ON ?auto_66824 ?auto_66825 ) ( ON-TABLE ?auto_66827 ) ( ON ?auto_66826 ?auto_66827 ) ( ON ?auto_66828 ?auto_66826 ) ( not ( = ?auto_66827 ?auto_66826 ) ) ( not ( = ?auto_66827 ?auto_66828 ) ) ( not ( = ?auto_66827 ?auto_66825 ) ) ( not ( = ?auto_66827 ?auto_66824 ) ) ( not ( = ?auto_66826 ?auto_66828 ) ) ( not ( = ?auto_66826 ?auto_66825 ) ) ( not ( = ?auto_66826 ?auto_66824 ) ) ( not ( = ?auto_66821 ?auto_66827 ) ) ( not ( = ?auto_66821 ?auto_66826 ) ) ( not ( = ?auto_66822 ?auto_66827 ) ) ( not ( = ?auto_66822 ?auto_66826 ) ) ( not ( = ?auto_66823 ?auto_66827 ) ) ( not ( = ?auto_66823 ?auto_66826 ) ) ( ON ?auto_66823 ?auto_66824 ) ( CLEAR ?auto_66821 ) ( ON ?auto_66822 ?auto_66823 ) ( CLEAR ?auto_66822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66827 ?auto_66826 ?auto_66828 ?auto_66825 ?auto_66824 ?auto_66823 )
      ( MAKE-5PILE ?auto_66821 ?auto_66822 ?auto_66823 ?auto_66824 ?auto_66825 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66829 - BLOCK
      ?auto_66830 - BLOCK
      ?auto_66831 - BLOCK
      ?auto_66832 - BLOCK
      ?auto_66833 - BLOCK
    )
    :vars
    (
      ?auto_66835 - BLOCK
      ?auto_66836 - BLOCK
      ?auto_66834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66829 ?auto_66830 ) ) ( not ( = ?auto_66829 ?auto_66831 ) ) ( not ( = ?auto_66829 ?auto_66832 ) ) ( not ( = ?auto_66829 ?auto_66833 ) ) ( not ( = ?auto_66830 ?auto_66831 ) ) ( not ( = ?auto_66830 ?auto_66832 ) ) ( not ( = ?auto_66830 ?auto_66833 ) ) ( not ( = ?auto_66831 ?auto_66832 ) ) ( not ( = ?auto_66831 ?auto_66833 ) ) ( not ( = ?auto_66832 ?auto_66833 ) ) ( ON ?auto_66833 ?auto_66835 ) ( not ( = ?auto_66829 ?auto_66835 ) ) ( not ( = ?auto_66830 ?auto_66835 ) ) ( not ( = ?auto_66831 ?auto_66835 ) ) ( not ( = ?auto_66832 ?auto_66835 ) ) ( not ( = ?auto_66833 ?auto_66835 ) ) ( ON ?auto_66832 ?auto_66833 ) ( ON-TABLE ?auto_66836 ) ( ON ?auto_66834 ?auto_66836 ) ( ON ?auto_66835 ?auto_66834 ) ( not ( = ?auto_66836 ?auto_66834 ) ) ( not ( = ?auto_66836 ?auto_66835 ) ) ( not ( = ?auto_66836 ?auto_66833 ) ) ( not ( = ?auto_66836 ?auto_66832 ) ) ( not ( = ?auto_66834 ?auto_66835 ) ) ( not ( = ?auto_66834 ?auto_66833 ) ) ( not ( = ?auto_66834 ?auto_66832 ) ) ( not ( = ?auto_66829 ?auto_66836 ) ) ( not ( = ?auto_66829 ?auto_66834 ) ) ( not ( = ?auto_66830 ?auto_66836 ) ) ( not ( = ?auto_66830 ?auto_66834 ) ) ( not ( = ?auto_66831 ?auto_66836 ) ) ( not ( = ?auto_66831 ?auto_66834 ) ) ( ON ?auto_66831 ?auto_66832 ) ( ON ?auto_66830 ?auto_66831 ) ( CLEAR ?auto_66830 ) ( HOLDING ?auto_66829 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66829 )
      ( MAKE-5PILE ?auto_66829 ?auto_66830 ?auto_66831 ?auto_66832 ?auto_66833 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66837 - BLOCK
      ?auto_66838 - BLOCK
      ?auto_66839 - BLOCK
      ?auto_66840 - BLOCK
      ?auto_66841 - BLOCK
    )
    :vars
    (
      ?auto_66843 - BLOCK
      ?auto_66842 - BLOCK
      ?auto_66844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66837 ?auto_66838 ) ) ( not ( = ?auto_66837 ?auto_66839 ) ) ( not ( = ?auto_66837 ?auto_66840 ) ) ( not ( = ?auto_66837 ?auto_66841 ) ) ( not ( = ?auto_66838 ?auto_66839 ) ) ( not ( = ?auto_66838 ?auto_66840 ) ) ( not ( = ?auto_66838 ?auto_66841 ) ) ( not ( = ?auto_66839 ?auto_66840 ) ) ( not ( = ?auto_66839 ?auto_66841 ) ) ( not ( = ?auto_66840 ?auto_66841 ) ) ( ON ?auto_66841 ?auto_66843 ) ( not ( = ?auto_66837 ?auto_66843 ) ) ( not ( = ?auto_66838 ?auto_66843 ) ) ( not ( = ?auto_66839 ?auto_66843 ) ) ( not ( = ?auto_66840 ?auto_66843 ) ) ( not ( = ?auto_66841 ?auto_66843 ) ) ( ON ?auto_66840 ?auto_66841 ) ( ON-TABLE ?auto_66842 ) ( ON ?auto_66844 ?auto_66842 ) ( ON ?auto_66843 ?auto_66844 ) ( not ( = ?auto_66842 ?auto_66844 ) ) ( not ( = ?auto_66842 ?auto_66843 ) ) ( not ( = ?auto_66842 ?auto_66841 ) ) ( not ( = ?auto_66842 ?auto_66840 ) ) ( not ( = ?auto_66844 ?auto_66843 ) ) ( not ( = ?auto_66844 ?auto_66841 ) ) ( not ( = ?auto_66844 ?auto_66840 ) ) ( not ( = ?auto_66837 ?auto_66842 ) ) ( not ( = ?auto_66837 ?auto_66844 ) ) ( not ( = ?auto_66838 ?auto_66842 ) ) ( not ( = ?auto_66838 ?auto_66844 ) ) ( not ( = ?auto_66839 ?auto_66842 ) ) ( not ( = ?auto_66839 ?auto_66844 ) ) ( ON ?auto_66839 ?auto_66840 ) ( ON ?auto_66838 ?auto_66839 ) ( ON ?auto_66837 ?auto_66838 ) ( CLEAR ?auto_66837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_66842 ?auto_66844 ?auto_66843 ?auto_66841 ?auto_66840 ?auto_66839 ?auto_66838 )
      ( MAKE-5PILE ?auto_66837 ?auto_66838 ?auto_66839 ?auto_66840 ?auto_66841 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66847 - BLOCK
      ?auto_66848 - BLOCK
    )
    :vars
    (
      ?auto_66849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66849 ?auto_66848 ) ( CLEAR ?auto_66849 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66847 ) ( ON ?auto_66848 ?auto_66847 ) ( not ( = ?auto_66847 ?auto_66848 ) ) ( not ( = ?auto_66847 ?auto_66849 ) ) ( not ( = ?auto_66848 ?auto_66849 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66849 ?auto_66848 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66850 - BLOCK
      ?auto_66851 - BLOCK
    )
    :vars
    (
      ?auto_66852 - BLOCK
      ?auto_66853 - BLOCK
      ?auto_66854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66852 ?auto_66851 ) ( CLEAR ?auto_66852 ) ( ON-TABLE ?auto_66850 ) ( ON ?auto_66851 ?auto_66850 ) ( not ( = ?auto_66850 ?auto_66851 ) ) ( not ( = ?auto_66850 ?auto_66852 ) ) ( not ( = ?auto_66851 ?auto_66852 ) ) ( HOLDING ?auto_66853 ) ( CLEAR ?auto_66854 ) ( not ( = ?auto_66850 ?auto_66853 ) ) ( not ( = ?auto_66850 ?auto_66854 ) ) ( not ( = ?auto_66851 ?auto_66853 ) ) ( not ( = ?auto_66851 ?auto_66854 ) ) ( not ( = ?auto_66852 ?auto_66853 ) ) ( not ( = ?auto_66852 ?auto_66854 ) ) ( not ( = ?auto_66853 ?auto_66854 ) ) )
    :subtasks
    ( ( !STACK ?auto_66853 ?auto_66854 )
      ( MAKE-2PILE ?auto_66850 ?auto_66851 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66855 - BLOCK
      ?auto_66856 - BLOCK
    )
    :vars
    (
      ?auto_66857 - BLOCK
      ?auto_66858 - BLOCK
      ?auto_66859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66857 ?auto_66856 ) ( ON-TABLE ?auto_66855 ) ( ON ?auto_66856 ?auto_66855 ) ( not ( = ?auto_66855 ?auto_66856 ) ) ( not ( = ?auto_66855 ?auto_66857 ) ) ( not ( = ?auto_66856 ?auto_66857 ) ) ( CLEAR ?auto_66858 ) ( not ( = ?auto_66855 ?auto_66859 ) ) ( not ( = ?auto_66855 ?auto_66858 ) ) ( not ( = ?auto_66856 ?auto_66859 ) ) ( not ( = ?auto_66856 ?auto_66858 ) ) ( not ( = ?auto_66857 ?auto_66859 ) ) ( not ( = ?auto_66857 ?auto_66858 ) ) ( not ( = ?auto_66859 ?auto_66858 ) ) ( ON ?auto_66859 ?auto_66857 ) ( CLEAR ?auto_66859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66855 ?auto_66856 ?auto_66857 )
      ( MAKE-2PILE ?auto_66855 ?auto_66856 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66860 - BLOCK
      ?auto_66861 - BLOCK
    )
    :vars
    (
      ?auto_66862 - BLOCK
      ?auto_66864 - BLOCK
      ?auto_66863 - BLOCK
      ?auto_66866 - BLOCK
      ?auto_66865 - BLOCK
      ?auto_66867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66862 ?auto_66861 ) ( ON-TABLE ?auto_66860 ) ( ON ?auto_66861 ?auto_66860 ) ( not ( = ?auto_66860 ?auto_66861 ) ) ( not ( = ?auto_66860 ?auto_66862 ) ) ( not ( = ?auto_66861 ?auto_66862 ) ) ( not ( = ?auto_66860 ?auto_66864 ) ) ( not ( = ?auto_66860 ?auto_66863 ) ) ( not ( = ?auto_66861 ?auto_66864 ) ) ( not ( = ?auto_66861 ?auto_66863 ) ) ( not ( = ?auto_66862 ?auto_66864 ) ) ( not ( = ?auto_66862 ?auto_66863 ) ) ( not ( = ?auto_66864 ?auto_66863 ) ) ( ON ?auto_66864 ?auto_66862 ) ( CLEAR ?auto_66864 ) ( HOLDING ?auto_66863 ) ( CLEAR ?auto_66866 ) ( ON-TABLE ?auto_66865 ) ( ON ?auto_66867 ?auto_66865 ) ( ON ?auto_66866 ?auto_66867 ) ( not ( = ?auto_66865 ?auto_66867 ) ) ( not ( = ?auto_66865 ?auto_66866 ) ) ( not ( = ?auto_66865 ?auto_66863 ) ) ( not ( = ?auto_66867 ?auto_66866 ) ) ( not ( = ?auto_66867 ?auto_66863 ) ) ( not ( = ?auto_66866 ?auto_66863 ) ) ( not ( = ?auto_66860 ?auto_66866 ) ) ( not ( = ?auto_66860 ?auto_66865 ) ) ( not ( = ?auto_66860 ?auto_66867 ) ) ( not ( = ?auto_66861 ?auto_66866 ) ) ( not ( = ?auto_66861 ?auto_66865 ) ) ( not ( = ?auto_66861 ?auto_66867 ) ) ( not ( = ?auto_66862 ?auto_66866 ) ) ( not ( = ?auto_66862 ?auto_66865 ) ) ( not ( = ?auto_66862 ?auto_66867 ) ) ( not ( = ?auto_66864 ?auto_66866 ) ) ( not ( = ?auto_66864 ?auto_66865 ) ) ( not ( = ?auto_66864 ?auto_66867 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66865 ?auto_66867 ?auto_66866 ?auto_66863 )
      ( MAKE-2PILE ?auto_66860 ?auto_66861 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66868 - BLOCK
      ?auto_66869 - BLOCK
    )
    :vars
    (
      ?auto_66875 - BLOCK
      ?auto_66873 - BLOCK
      ?auto_66872 - BLOCK
      ?auto_66871 - BLOCK
      ?auto_66874 - BLOCK
      ?auto_66870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66875 ?auto_66869 ) ( ON-TABLE ?auto_66868 ) ( ON ?auto_66869 ?auto_66868 ) ( not ( = ?auto_66868 ?auto_66869 ) ) ( not ( = ?auto_66868 ?auto_66875 ) ) ( not ( = ?auto_66869 ?auto_66875 ) ) ( not ( = ?auto_66868 ?auto_66873 ) ) ( not ( = ?auto_66868 ?auto_66872 ) ) ( not ( = ?auto_66869 ?auto_66873 ) ) ( not ( = ?auto_66869 ?auto_66872 ) ) ( not ( = ?auto_66875 ?auto_66873 ) ) ( not ( = ?auto_66875 ?auto_66872 ) ) ( not ( = ?auto_66873 ?auto_66872 ) ) ( ON ?auto_66873 ?auto_66875 ) ( CLEAR ?auto_66871 ) ( ON-TABLE ?auto_66874 ) ( ON ?auto_66870 ?auto_66874 ) ( ON ?auto_66871 ?auto_66870 ) ( not ( = ?auto_66874 ?auto_66870 ) ) ( not ( = ?auto_66874 ?auto_66871 ) ) ( not ( = ?auto_66874 ?auto_66872 ) ) ( not ( = ?auto_66870 ?auto_66871 ) ) ( not ( = ?auto_66870 ?auto_66872 ) ) ( not ( = ?auto_66871 ?auto_66872 ) ) ( not ( = ?auto_66868 ?auto_66871 ) ) ( not ( = ?auto_66868 ?auto_66874 ) ) ( not ( = ?auto_66868 ?auto_66870 ) ) ( not ( = ?auto_66869 ?auto_66871 ) ) ( not ( = ?auto_66869 ?auto_66874 ) ) ( not ( = ?auto_66869 ?auto_66870 ) ) ( not ( = ?auto_66875 ?auto_66871 ) ) ( not ( = ?auto_66875 ?auto_66874 ) ) ( not ( = ?auto_66875 ?auto_66870 ) ) ( not ( = ?auto_66873 ?auto_66871 ) ) ( not ( = ?auto_66873 ?auto_66874 ) ) ( not ( = ?auto_66873 ?auto_66870 ) ) ( ON ?auto_66872 ?auto_66873 ) ( CLEAR ?auto_66872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66868 ?auto_66869 ?auto_66875 ?auto_66873 )
      ( MAKE-2PILE ?auto_66868 ?auto_66869 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66876 - BLOCK
      ?auto_66877 - BLOCK
    )
    :vars
    (
      ?auto_66880 - BLOCK
      ?auto_66883 - BLOCK
      ?auto_66882 - BLOCK
      ?auto_66881 - BLOCK
      ?auto_66878 - BLOCK
      ?auto_66879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66880 ?auto_66877 ) ( ON-TABLE ?auto_66876 ) ( ON ?auto_66877 ?auto_66876 ) ( not ( = ?auto_66876 ?auto_66877 ) ) ( not ( = ?auto_66876 ?auto_66880 ) ) ( not ( = ?auto_66877 ?auto_66880 ) ) ( not ( = ?auto_66876 ?auto_66883 ) ) ( not ( = ?auto_66876 ?auto_66882 ) ) ( not ( = ?auto_66877 ?auto_66883 ) ) ( not ( = ?auto_66877 ?auto_66882 ) ) ( not ( = ?auto_66880 ?auto_66883 ) ) ( not ( = ?auto_66880 ?auto_66882 ) ) ( not ( = ?auto_66883 ?auto_66882 ) ) ( ON ?auto_66883 ?auto_66880 ) ( ON-TABLE ?auto_66881 ) ( ON ?auto_66878 ?auto_66881 ) ( not ( = ?auto_66881 ?auto_66878 ) ) ( not ( = ?auto_66881 ?auto_66879 ) ) ( not ( = ?auto_66881 ?auto_66882 ) ) ( not ( = ?auto_66878 ?auto_66879 ) ) ( not ( = ?auto_66878 ?auto_66882 ) ) ( not ( = ?auto_66879 ?auto_66882 ) ) ( not ( = ?auto_66876 ?auto_66879 ) ) ( not ( = ?auto_66876 ?auto_66881 ) ) ( not ( = ?auto_66876 ?auto_66878 ) ) ( not ( = ?auto_66877 ?auto_66879 ) ) ( not ( = ?auto_66877 ?auto_66881 ) ) ( not ( = ?auto_66877 ?auto_66878 ) ) ( not ( = ?auto_66880 ?auto_66879 ) ) ( not ( = ?auto_66880 ?auto_66881 ) ) ( not ( = ?auto_66880 ?auto_66878 ) ) ( not ( = ?auto_66883 ?auto_66879 ) ) ( not ( = ?auto_66883 ?auto_66881 ) ) ( not ( = ?auto_66883 ?auto_66878 ) ) ( ON ?auto_66882 ?auto_66883 ) ( CLEAR ?auto_66882 ) ( HOLDING ?auto_66879 ) ( CLEAR ?auto_66878 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66881 ?auto_66878 ?auto_66879 )
      ( MAKE-2PILE ?auto_66876 ?auto_66877 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66884 - BLOCK
      ?auto_66885 - BLOCK
    )
    :vars
    (
      ?auto_66888 - BLOCK
      ?auto_66890 - BLOCK
      ?auto_66886 - BLOCK
      ?auto_66891 - BLOCK
      ?auto_66887 - BLOCK
      ?auto_66889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66888 ?auto_66885 ) ( ON-TABLE ?auto_66884 ) ( ON ?auto_66885 ?auto_66884 ) ( not ( = ?auto_66884 ?auto_66885 ) ) ( not ( = ?auto_66884 ?auto_66888 ) ) ( not ( = ?auto_66885 ?auto_66888 ) ) ( not ( = ?auto_66884 ?auto_66890 ) ) ( not ( = ?auto_66884 ?auto_66886 ) ) ( not ( = ?auto_66885 ?auto_66890 ) ) ( not ( = ?auto_66885 ?auto_66886 ) ) ( not ( = ?auto_66888 ?auto_66890 ) ) ( not ( = ?auto_66888 ?auto_66886 ) ) ( not ( = ?auto_66890 ?auto_66886 ) ) ( ON ?auto_66890 ?auto_66888 ) ( ON-TABLE ?auto_66891 ) ( ON ?auto_66887 ?auto_66891 ) ( not ( = ?auto_66891 ?auto_66887 ) ) ( not ( = ?auto_66891 ?auto_66889 ) ) ( not ( = ?auto_66891 ?auto_66886 ) ) ( not ( = ?auto_66887 ?auto_66889 ) ) ( not ( = ?auto_66887 ?auto_66886 ) ) ( not ( = ?auto_66889 ?auto_66886 ) ) ( not ( = ?auto_66884 ?auto_66889 ) ) ( not ( = ?auto_66884 ?auto_66891 ) ) ( not ( = ?auto_66884 ?auto_66887 ) ) ( not ( = ?auto_66885 ?auto_66889 ) ) ( not ( = ?auto_66885 ?auto_66891 ) ) ( not ( = ?auto_66885 ?auto_66887 ) ) ( not ( = ?auto_66888 ?auto_66889 ) ) ( not ( = ?auto_66888 ?auto_66891 ) ) ( not ( = ?auto_66888 ?auto_66887 ) ) ( not ( = ?auto_66890 ?auto_66889 ) ) ( not ( = ?auto_66890 ?auto_66891 ) ) ( not ( = ?auto_66890 ?auto_66887 ) ) ( ON ?auto_66886 ?auto_66890 ) ( CLEAR ?auto_66887 ) ( ON ?auto_66889 ?auto_66886 ) ( CLEAR ?auto_66889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66884 ?auto_66885 ?auto_66888 ?auto_66890 ?auto_66886 )
      ( MAKE-2PILE ?auto_66884 ?auto_66885 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66892 - BLOCK
      ?auto_66893 - BLOCK
    )
    :vars
    (
      ?auto_66895 - BLOCK
      ?auto_66894 - BLOCK
      ?auto_66896 - BLOCK
      ?auto_66898 - BLOCK
      ?auto_66899 - BLOCK
      ?auto_66897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66895 ?auto_66893 ) ( ON-TABLE ?auto_66892 ) ( ON ?auto_66893 ?auto_66892 ) ( not ( = ?auto_66892 ?auto_66893 ) ) ( not ( = ?auto_66892 ?auto_66895 ) ) ( not ( = ?auto_66893 ?auto_66895 ) ) ( not ( = ?auto_66892 ?auto_66894 ) ) ( not ( = ?auto_66892 ?auto_66896 ) ) ( not ( = ?auto_66893 ?auto_66894 ) ) ( not ( = ?auto_66893 ?auto_66896 ) ) ( not ( = ?auto_66895 ?auto_66894 ) ) ( not ( = ?auto_66895 ?auto_66896 ) ) ( not ( = ?auto_66894 ?auto_66896 ) ) ( ON ?auto_66894 ?auto_66895 ) ( ON-TABLE ?auto_66898 ) ( not ( = ?auto_66898 ?auto_66899 ) ) ( not ( = ?auto_66898 ?auto_66897 ) ) ( not ( = ?auto_66898 ?auto_66896 ) ) ( not ( = ?auto_66899 ?auto_66897 ) ) ( not ( = ?auto_66899 ?auto_66896 ) ) ( not ( = ?auto_66897 ?auto_66896 ) ) ( not ( = ?auto_66892 ?auto_66897 ) ) ( not ( = ?auto_66892 ?auto_66898 ) ) ( not ( = ?auto_66892 ?auto_66899 ) ) ( not ( = ?auto_66893 ?auto_66897 ) ) ( not ( = ?auto_66893 ?auto_66898 ) ) ( not ( = ?auto_66893 ?auto_66899 ) ) ( not ( = ?auto_66895 ?auto_66897 ) ) ( not ( = ?auto_66895 ?auto_66898 ) ) ( not ( = ?auto_66895 ?auto_66899 ) ) ( not ( = ?auto_66894 ?auto_66897 ) ) ( not ( = ?auto_66894 ?auto_66898 ) ) ( not ( = ?auto_66894 ?auto_66899 ) ) ( ON ?auto_66896 ?auto_66894 ) ( ON ?auto_66897 ?auto_66896 ) ( CLEAR ?auto_66897 ) ( HOLDING ?auto_66899 ) ( CLEAR ?auto_66898 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66898 ?auto_66899 )
      ( MAKE-2PILE ?auto_66892 ?auto_66893 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68193 - BLOCK
      ?auto_68194 - BLOCK
    )
    :vars
    (
      ?auto_68198 - BLOCK
      ?auto_68197 - BLOCK
      ?auto_68196 - BLOCK
      ?auto_68199 - BLOCK
      ?auto_68195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68198 ?auto_68194 ) ( ON-TABLE ?auto_68193 ) ( ON ?auto_68194 ?auto_68193 ) ( not ( = ?auto_68193 ?auto_68194 ) ) ( not ( = ?auto_68193 ?auto_68198 ) ) ( not ( = ?auto_68194 ?auto_68198 ) ) ( not ( = ?auto_68193 ?auto_68197 ) ) ( not ( = ?auto_68193 ?auto_68196 ) ) ( not ( = ?auto_68194 ?auto_68197 ) ) ( not ( = ?auto_68194 ?auto_68196 ) ) ( not ( = ?auto_68198 ?auto_68197 ) ) ( not ( = ?auto_68198 ?auto_68196 ) ) ( not ( = ?auto_68197 ?auto_68196 ) ) ( ON ?auto_68197 ?auto_68198 ) ( not ( = ?auto_68199 ?auto_68195 ) ) ( not ( = ?auto_68199 ?auto_68196 ) ) ( not ( = ?auto_68195 ?auto_68196 ) ) ( not ( = ?auto_68193 ?auto_68195 ) ) ( not ( = ?auto_68193 ?auto_68199 ) ) ( not ( = ?auto_68194 ?auto_68195 ) ) ( not ( = ?auto_68194 ?auto_68199 ) ) ( not ( = ?auto_68198 ?auto_68195 ) ) ( not ( = ?auto_68198 ?auto_68199 ) ) ( not ( = ?auto_68197 ?auto_68195 ) ) ( not ( = ?auto_68197 ?auto_68199 ) ) ( ON ?auto_68196 ?auto_68197 ) ( ON ?auto_68195 ?auto_68196 ) ( ON ?auto_68199 ?auto_68195 ) ( CLEAR ?auto_68199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68193 ?auto_68194 ?auto_68198 ?auto_68197 ?auto_68196 ?auto_68195 )
      ( MAKE-2PILE ?auto_68193 ?auto_68194 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66908 - BLOCK
      ?auto_66909 - BLOCK
    )
    :vars
    (
      ?auto_66911 - BLOCK
      ?auto_66912 - BLOCK
      ?auto_66913 - BLOCK
      ?auto_66910 - BLOCK
      ?auto_66915 - BLOCK
      ?auto_66914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66911 ?auto_66909 ) ( ON-TABLE ?auto_66908 ) ( ON ?auto_66909 ?auto_66908 ) ( not ( = ?auto_66908 ?auto_66909 ) ) ( not ( = ?auto_66908 ?auto_66911 ) ) ( not ( = ?auto_66909 ?auto_66911 ) ) ( not ( = ?auto_66908 ?auto_66912 ) ) ( not ( = ?auto_66908 ?auto_66913 ) ) ( not ( = ?auto_66909 ?auto_66912 ) ) ( not ( = ?auto_66909 ?auto_66913 ) ) ( not ( = ?auto_66911 ?auto_66912 ) ) ( not ( = ?auto_66911 ?auto_66913 ) ) ( not ( = ?auto_66912 ?auto_66913 ) ) ( ON ?auto_66912 ?auto_66911 ) ( not ( = ?auto_66910 ?auto_66915 ) ) ( not ( = ?auto_66910 ?auto_66914 ) ) ( not ( = ?auto_66910 ?auto_66913 ) ) ( not ( = ?auto_66915 ?auto_66914 ) ) ( not ( = ?auto_66915 ?auto_66913 ) ) ( not ( = ?auto_66914 ?auto_66913 ) ) ( not ( = ?auto_66908 ?auto_66914 ) ) ( not ( = ?auto_66908 ?auto_66910 ) ) ( not ( = ?auto_66908 ?auto_66915 ) ) ( not ( = ?auto_66909 ?auto_66914 ) ) ( not ( = ?auto_66909 ?auto_66910 ) ) ( not ( = ?auto_66909 ?auto_66915 ) ) ( not ( = ?auto_66911 ?auto_66914 ) ) ( not ( = ?auto_66911 ?auto_66910 ) ) ( not ( = ?auto_66911 ?auto_66915 ) ) ( not ( = ?auto_66912 ?auto_66914 ) ) ( not ( = ?auto_66912 ?auto_66910 ) ) ( not ( = ?auto_66912 ?auto_66915 ) ) ( ON ?auto_66913 ?auto_66912 ) ( ON ?auto_66914 ?auto_66913 ) ( ON ?auto_66915 ?auto_66914 ) ( CLEAR ?auto_66915 ) ( HOLDING ?auto_66910 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66910 )
      ( MAKE-2PILE ?auto_66908 ?auto_66909 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66916 - BLOCK
      ?auto_66917 - BLOCK
    )
    :vars
    (
      ?auto_66919 - BLOCK
      ?auto_66923 - BLOCK
      ?auto_66918 - BLOCK
      ?auto_66922 - BLOCK
      ?auto_66921 - BLOCK
      ?auto_66920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66919 ?auto_66917 ) ( ON-TABLE ?auto_66916 ) ( ON ?auto_66917 ?auto_66916 ) ( not ( = ?auto_66916 ?auto_66917 ) ) ( not ( = ?auto_66916 ?auto_66919 ) ) ( not ( = ?auto_66917 ?auto_66919 ) ) ( not ( = ?auto_66916 ?auto_66923 ) ) ( not ( = ?auto_66916 ?auto_66918 ) ) ( not ( = ?auto_66917 ?auto_66923 ) ) ( not ( = ?auto_66917 ?auto_66918 ) ) ( not ( = ?auto_66919 ?auto_66923 ) ) ( not ( = ?auto_66919 ?auto_66918 ) ) ( not ( = ?auto_66923 ?auto_66918 ) ) ( ON ?auto_66923 ?auto_66919 ) ( not ( = ?auto_66922 ?auto_66921 ) ) ( not ( = ?auto_66922 ?auto_66920 ) ) ( not ( = ?auto_66922 ?auto_66918 ) ) ( not ( = ?auto_66921 ?auto_66920 ) ) ( not ( = ?auto_66921 ?auto_66918 ) ) ( not ( = ?auto_66920 ?auto_66918 ) ) ( not ( = ?auto_66916 ?auto_66920 ) ) ( not ( = ?auto_66916 ?auto_66922 ) ) ( not ( = ?auto_66916 ?auto_66921 ) ) ( not ( = ?auto_66917 ?auto_66920 ) ) ( not ( = ?auto_66917 ?auto_66922 ) ) ( not ( = ?auto_66917 ?auto_66921 ) ) ( not ( = ?auto_66919 ?auto_66920 ) ) ( not ( = ?auto_66919 ?auto_66922 ) ) ( not ( = ?auto_66919 ?auto_66921 ) ) ( not ( = ?auto_66923 ?auto_66920 ) ) ( not ( = ?auto_66923 ?auto_66922 ) ) ( not ( = ?auto_66923 ?auto_66921 ) ) ( ON ?auto_66918 ?auto_66923 ) ( ON ?auto_66920 ?auto_66918 ) ( ON ?auto_66921 ?auto_66920 ) ( ON ?auto_66922 ?auto_66921 ) ( CLEAR ?auto_66922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_66916 ?auto_66917 ?auto_66919 ?auto_66923 ?auto_66918 ?auto_66920 ?auto_66921 )
      ( MAKE-2PILE ?auto_66916 ?auto_66917 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66930 - BLOCK
      ?auto_66931 - BLOCK
      ?auto_66932 - BLOCK
      ?auto_66933 - BLOCK
      ?auto_66934 - BLOCK
      ?auto_66935 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_66935 ) ( CLEAR ?auto_66934 ) ( ON-TABLE ?auto_66930 ) ( ON ?auto_66931 ?auto_66930 ) ( ON ?auto_66932 ?auto_66931 ) ( ON ?auto_66933 ?auto_66932 ) ( ON ?auto_66934 ?auto_66933 ) ( not ( = ?auto_66930 ?auto_66931 ) ) ( not ( = ?auto_66930 ?auto_66932 ) ) ( not ( = ?auto_66930 ?auto_66933 ) ) ( not ( = ?auto_66930 ?auto_66934 ) ) ( not ( = ?auto_66930 ?auto_66935 ) ) ( not ( = ?auto_66931 ?auto_66932 ) ) ( not ( = ?auto_66931 ?auto_66933 ) ) ( not ( = ?auto_66931 ?auto_66934 ) ) ( not ( = ?auto_66931 ?auto_66935 ) ) ( not ( = ?auto_66932 ?auto_66933 ) ) ( not ( = ?auto_66932 ?auto_66934 ) ) ( not ( = ?auto_66932 ?auto_66935 ) ) ( not ( = ?auto_66933 ?auto_66934 ) ) ( not ( = ?auto_66933 ?auto_66935 ) ) ( not ( = ?auto_66934 ?auto_66935 ) ) )
    :subtasks
    ( ( !STACK ?auto_66935 ?auto_66934 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66936 - BLOCK
      ?auto_66937 - BLOCK
      ?auto_66938 - BLOCK
      ?auto_66939 - BLOCK
      ?auto_66940 - BLOCK
      ?auto_66941 - BLOCK
    )
    :vars
    (
      ?auto_66942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66940 ) ( ON-TABLE ?auto_66936 ) ( ON ?auto_66937 ?auto_66936 ) ( ON ?auto_66938 ?auto_66937 ) ( ON ?auto_66939 ?auto_66938 ) ( ON ?auto_66940 ?auto_66939 ) ( not ( = ?auto_66936 ?auto_66937 ) ) ( not ( = ?auto_66936 ?auto_66938 ) ) ( not ( = ?auto_66936 ?auto_66939 ) ) ( not ( = ?auto_66936 ?auto_66940 ) ) ( not ( = ?auto_66936 ?auto_66941 ) ) ( not ( = ?auto_66937 ?auto_66938 ) ) ( not ( = ?auto_66937 ?auto_66939 ) ) ( not ( = ?auto_66937 ?auto_66940 ) ) ( not ( = ?auto_66937 ?auto_66941 ) ) ( not ( = ?auto_66938 ?auto_66939 ) ) ( not ( = ?auto_66938 ?auto_66940 ) ) ( not ( = ?auto_66938 ?auto_66941 ) ) ( not ( = ?auto_66939 ?auto_66940 ) ) ( not ( = ?auto_66939 ?auto_66941 ) ) ( not ( = ?auto_66940 ?auto_66941 ) ) ( ON ?auto_66941 ?auto_66942 ) ( CLEAR ?auto_66941 ) ( HAND-EMPTY ) ( not ( = ?auto_66936 ?auto_66942 ) ) ( not ( = ?auto_66937 ?auto_66942 ) ) ( not ( = ?auto_66938 ?auto_66942 ) ) ( not ( = ?auto_66939 ?auto_66942 ) ) ( not ( = ?auto_66940 ?auto_66942 ) ) ( not ( = ?auto_66941 ?auto_66942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66941 ?auto_66942 )
      ( MAKE-6PILE ?auto_66936 ?auto_66937 ?auto_66938 ?auto_66939 ?auto_66940 ?auto_66941 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66943 - BLOCK
      ?auto_66944 - BLOCK
      ?auto_66945 - BLOCK
      ?auto_66946 - BLOCK
      ?auto_66947 - BLOCK
      ?auto_66948 - BLOCK
    )
    :vars
    (
      ?auto_66949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66943 ) ( ON ?auto_66944 ?auto_66943 ) ( ON ?auto_66945 ?auto_66944 ) ( ON ?auto_66946 ?auto_66945 ) ( not ( = ?auto_66943 ?auto_66944 ) ) ( not ( = ?auto_66943 ?auto_66945 ) ) ( not ( = ?auto_66943 ?auto_66946 ) ) ( not ( = ?auto_66943 ?auto_66947 ) ) ( not ( = ?auto_66943 ?auto_66948 ) ) ( not ( = ?auto_66944 ?auto_66945 ) ) ( not ( = ?auto_66944 ?auto_66946 ) ) ( not ( = ?auto_66944 ?auto_66947 ) ) ( not ( = ?auto_66944 ?auto_66948 ) ) ( not ( = ?auto_66945 ?auto_66946 ) ) ( not ( = ?auto_66945 ?auto_66947 ) ) ( not ( = ?auto_66945 ?auto_66948 ) ) ( not ( = ?auto_66946 ?auto_66947 ) ) ( not ( = ?auto_66946 ?auto_66948 ) ) ( not ( = ?auto_66947 ?auto_66948 ) ) ( ON ?auto_66948 ?auto_66949 ) ( CLEAR ?auto_66948 ) ( not ( = ?auto_66943 ?auto_66949 ) ) ( not ( = ?auto_66944 ?auto_66949 ) ) ( not ( = ?auto_66945 ?auto_66949 ) ) ( not ( = ?auto_66946 ?auto_66949 ) ) ( not ( = ?auto_66947 ?auto_66949 ) ) ( not ( = ?auto_66948 ?auto_66949 ) ) ( HOLDING ?auto_66947 ) ( CLEAR ?auto_66946 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66943 ?auto_66944 ?auto_66945 ?auto_66946 ?auto_66947 )
      ( MAKE-6PILE ?auto_66943 ?auto_66944 ?auto_66945 ?auto_66946 ?auto_66947 ?auto_66948 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66950 - BLOCK
      ?auto_66951 - BLOCK
      ?auto_66952 - BLOCK
      ?auto_66953 - BLOCK
      ?auto_66954 - BLOCK
      ?auto_66955 - BLOCK
    )
    :vars
    (
      ?auto_66956 - BLOCK
      ?auto_66957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66950 ) ( ON ?auto_66951 ?auto_66950 ) ( ON ?auto_66952 ?auto_66951 ) ( ON ?auto_66953 ?auto_66952 ) ( not ( = ?auto_66950 ?auto_66951 ) ) ( not ( = ?auto_66950 ?auto_66952 ) ) ( not ( = ?auto_66950 ?auto_66953 ) ) ( not ( = ?auto_66950 ?auto_66954 ) ) ( not ( = ?auto_66950 ?auto_66955 ) ) ( not ( = ?auto_66951 ?auto_66952 ) ) ( not ( = ?auto_66951 ?auto_66953 ) ) ( not ( = ?auto_66951 ?auto_66954 ) ) ( not ( = ?auto_66951 ?auto_66955 ) ) ( not ( = ?auto_66952 ?auto_66953 ) ) ( not ( = ?auto_66952 ?auto_66954 ) ) ( not ( = ?auto_66952 ?auto_66955 ) ) ( not ( = ?auto_66953 ?auto_66954 ) ) ( not ( = ?auto_66953 ?auto_66955 ) ) ( not ( = ?auto_66954 ?auto_66955 ) ) ( ON ?auto_66955 ?auto_66956 ) ( not ( = ?auto_66950 ?auto_66956 ) ) ( not ( = ?auto_66951 ?auto_66956 ) ) ( not ( = ?auto_66952 ?auto_66956 ) ) ( not ( = ?auto_66953 ?auto_66956 ) ) ( not ( = ?auto_66954 ?auto_66956 ) ) ( not ( = ?auto_66955 ?auto_66956 ) ) ( CLEAR ?auto_66953 ) ( ON ?auto_66954 ?auto_66955 ) ( CLEAR ?auto_66954 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66957 ) ( ON ?auto_66956 ?auto_66957 ) ( not ( = ?auto_66957 ?auto_66956 ) ) ( not ( = ?auto_66957 ?auto_66955 ) ) ( not ( = ?auto_66957 ?auto_66954 ) ) ( not ( = ?auto_66950 ?auto_66957 ) ) ( not ( = ?auto_66951 ?auto_66957 ) ) ( not ( = ?auto_66952 ?auto_66957 ) ) ( not ( = ?auto_66953 ?auto_66957 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66957 ?auto_66956 ?auto_66955 )
      ( MAKE-6PILE ?auto_66950 ?auto_66951 ?auto_66952 ?auto_66953 ?auto_66954 ?auto_66955 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66958 - BLOCK
      ?auto_66959 - BLOCK
      ?auto_66960 - BLOCK
      ?auto_66961 - BLOCK
      ?auto_66962 - BLOCK
      ?auto_66963 - BLOCK
    )
    :vars
    (
      ?auto_66964 - BLOCK
      ?auto_66965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66958 ) ( ON ?auto_66959 ?auto_66958 ) ( ON ?auto_66960 ?auto_66959 ) ( not ( = ?auto_66958 ?auto_66959 ) ) ( not ( = ?auto_66958 ?auto_66960 ) ) ( not ( = ?auto_66958 ?auto_66961 ) ) ( not ( = ?auto_66958 ?auto_66962 ) ) ( not ( = ?auto_66958 ?auto_66963 ) ) ( not ( = ?auto_66959 ?auto_66960 ) ) ( not ( = ?auto_66959 ?auto_66961 ) ) ( not ( = ?auto_66959 ?auto_66962 ) ) ( not ( = ?auto_66959 ?auto_66963 ) ) ( not ( = ?auto_66960 ?auto_66961 ) ) ( not ( = ?auto_66960 ?auto_66962 ) ) ( not ( = ?auto_66960 ?auto_66963 ) ) ( not ( = ?auto_66961 ?auto_66962 ) ) ( not ( = ?auto_66961 ?auto_66963 ) ) ( not ( = ?auto_66962 ?auto_66963 ) ) ( ON ?auto_66963 ?auto_66964 ) ( not ( = ?auto_66958 ?auto_66964 ) ) ( not ( = ?auto_66959 ?auto_66964 ) ) ( not ( = ?auto_66960 ?auto_66964 ) ) ( not ( = ?auto_66961 ?auto_66964 ) ) ( not ( = ?auto_66962 ?auto_66964 ) ) ( not ( = ?auto_66963 ?auto_66964 ) ) ( ON ?auto_66962 ?auto_66963 ) ( CLEAR ?auto_66962 ) ( ON-TABLE ?auto_66965 ) ( ON ?auto_66964 ?auto_66965 ) ( not ( = ?auto_66965 ?auto_66964 ) ) ( not ( = ?auto_66965 ?auto_66963 ) ) ( not ( = ?auto_66965 ?auto_66962 ) ) ( not ( = ?auto_66958 ?auto_66965 ) ) ( not ( = ?auto_66959 ?auto_66965 ) ) ( not ( = ?auto_66960 ?auto_66965 ) ) ( not ( = ?auto_66961 ?auto_66965 ) ) ( HOLDING ?auto_66961 ) ( CLEAR ?auto_66960 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66958 ?auto_66959 ?auto_66960 ?auto_66961 )
      ( MAKE-6PILE ?auto_66958 ?auto_66959 ?auto_66960 ?auto_66961 ?auto_66962 ?auto_66963 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66966 - BLOCK
      ?auto_66967 - BLOCK
      ?auto_66968 - BLOCK
      ?auto_66969 - BLOCK
      ?auto_66970 - BLOCK
      ?auto_66971 - BLOCK
    )
    :vars
    (
      ?auto_66973 - BLOCK
      ?auto_66972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66966 ) ( ON ?auto_66967 ?auto_66966 ) ( ON ?auto_66968 ?auto_66967 ) ( not ( = ?auto_66966 ?auto_66967 ) ) ( not ( = ?auto_66966 ?auto_66968 ) ) ( not ( = ?auto_66966 ?auto_66969 ) ) ( not ( = ?auto_66966 ?auto_66970 ) ) ( not ( = ?auto_66966 ?auto_66971 ) ) ( not ( = ?auto_66967 ?auto_66968 ) ) ( not ( = ?auto_66967 ?auto_66969 ) ) ( not ( = ?auto_66967 ?auto_66970 ) ) ( not ( = ?auto_66967 ?auto_66971 ) ) ( not ( = ?auto_66968 ?auto_66969 ) ) ( not ( = ?auto_66968 ?auto_66970 ) ) ( not ( = ?auto_66968 ?auto_66971 ) ) ( not ( = ?auto_66969 ?auto_66970 ) ) ( not ( = ?auto_66969 ?auto_66971 ) ) ( not ( = ?auto_66970 ?auto_66971 ) ) ( ON ?auto_66971 ?auto_66973 ) ( not ( = ?auto_66966 ?auto_66973 ) ) ( not ( = ?auto_66967 ?auto_66973 ) ) ( not ( = ?auto_66968 ?auto_66973 ) ) ( not ( = ?auto_66969 ?auto_66973 ) ) ( not ( = ?auto_66970 ?auto_66973 ) ) ( not ( = ?auto_66971 ?auto_66973 ) ) ( ON ?auto_66970 ?auto_66971 ) ( ON-TABLE ?auto_66972 ) ( ON ?auto_66973 ?auto_66972 ) ( not ( = ?auto_66972 ?auto_66973 ) ) ( not ( = ?auto_66972 ?auto_66971 ) ) ( not ( = ?auto_66972 ?auto_66970 ) ) ( not ( = ?auto_66966 ?auto_66972 ) ) ( not ( = ?auto_66967 ?auto_66972 ) ) ( not ( = ?auto_66968 ?auto_66972 ) ) ( not ( = ?auto_66969 ?auto_66972 ) ) ( CLEAR ?auto_66968 ) ( ON ?auto_66969 ?auto_66970 ) ( CLEAR ?auto_66969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66972 ?auto_66973 ?auto_66971 ?auto_66970 )
      ( MAKE-6PILE ?auto_66966 ?auto_66967 ?auto_66968 ?auto_66969 ?auto_66970 ?auto_66971 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66974 - BLOCK
      ?auto_66975 - BLOCK
      ?auto_66976 - BLOCK
      ?auto_66977 - BLOCK
      ?auto_66978 - BLOCK
      ?auto_66979 - BLOCK
    )
    :vars
    (
      ?auto_66981 - BLOCK
      ?auto_66980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66974 ) ( ON ?auto_66975 ?auto_66974 ) ( not ( = ?auto_66974 ?auto_66975 ) ) ( not ( = ?auto_66974 ?auto_66976 ) ) ( not ( = ?auto_66974 ?auto_66977 ) ) ( not ( = ?auto_66974 ?auto_66978 ) ) ( not ( = ?auto_66974 ?auto_66979 ) ) ( not ( = ?auto_66975 ?auto_66976 ) ) ( not ( = ?auto_66975 ?auto_66977 ) ) ( not ( = ?auto_66975 ?auto_66978 ) ) ( not ( = ?auto_66975 ?auto_66979 ) ) ( not ( = ?auto_66976 ?auto_66977 ) ) ( not ( = ?auto_66976 ?auto_66978 ) ) ( not ( = ?auto_66976 ?auto_66979 ) ) ( not ( = ?auto_66977 ?auto_66978 ) ) ( not ( = ?auto_66977 ?auto_66979 ) ) ( not ( = ?auto_66978 ?auto_66979 ) ) ( ON ?auto_66979 ?auto_66981 ) ( not ( = ?auto_66974 ?auto_66981 ) ) ( not ( = ?auto_66975 ?auto_66981 ) ) ( not ( = ?auto_66976 ?auto_66981 ) ) ( not ( = ?auto_66977 ?auto_66981 ) ) ( not ( = ?auto_66978 ?auto_66981 ) ) ( not ( = ?auto_66979 ?auto_66981 ) ) ( ON ?auto_66978 ?auto_66979 ) ( ON-TABLE ?auto_66980 ) ( ON ?auto_66981 ?auto_66980 ) ( not ( = ?auto_66980 ?auto_66981 ) ) ( not ( = ?auto_66980 ?auto_66979 ) ) ( not ( = ?auto_66980 ?auto_66978 ) ) ( not ( = ?auto_66974 ?auto_66980 ) ) ( not ( = ?auto_66975 ?auto_66980 ) ) ( not ( = ?auto_66976 ?auto_66980 ) ) ( not ( = ?auto_66977 ?auto_66980 ) ) ( ON ?auto_66977 ?auto_66978 ) ( CLEAR ?auto_66977 ) ( HOLDING ?auto_66976 ) ( CLEAR ?auto_66975 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66974 ?auto_66975 ?auto_66976 )
      ( MAKE-6PILE ?auto_66974 ?auto_66975 ?auto_66976 ?auto_66977 ?auto_66978 ?auto_66979 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66982 - BLOCK
      ?auto_66983 - BLOCK
      ?auto_66984 - BLOCK
      ?auto_66985 - BLOCK
      ?auto_66986 - BLOCK
      ?auto_66987 - BLOCK
    )
    :vars
    (
      ?auto_66989 - BLOCK
      ?auto_66988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66982 ) ( ON ?auto_66983 ?auto_66982 ) ( not ( = ?auto_66982 ?auto_66983 ) ) ( not ( = ?auto_66982 ?auto_66984 ) ) ( not ( = ?auto_66982 ?auto_66985 ) ) ( not ( = ?auto_66982 ?auto_66986 ) ) ( not ( = ?auto_66982 ?auto_66987 ) ) ( not ( = ?auto_66983 ?auto_66984 ) ) ( not ( = ?auto_66983 ?auto_66985 ) ) ( not ( = ?auto_66983 ?auto_66986 ) ) ( not ( = ?auto_66983 ?auto_66987 ) ) ( not ( = ?auto_66984 ?auto_66985 ) ) ( not ( = ?auto_66984 ?auto_66986 ) ) ( not ( = ?auto_66984 ?auto_66987 ) ) ( not ( = ?auto_66985 ?auto_66986 ) ) ( not ( = ?auto_66985 ?auto_66987 ) ) ( not ( = ?auto_66986 ?auto_66987 ) ) ( ON ?auto_66987 ?auto_66989 ) ( not ( = ?auto_66982 ?auto_66989 ) ) ( not ( = ?auto_66983 ?auto_66989 ) ) ( not ( = ?auto_66984 ?auto_66989 ) ) ( not ( = ?auto_66985 ?auto_66989 ) ) ( not ( = ?auto_66986 ?auto_66989 ) ) ( not ( = ?auto_66987 ?auto_66989 ) ) ( ON ?auto_66986 ?auto_66987 ) ( ON-TABLE ?auto_66988 ) ( ON ?auto_66989 ?auto_66988 ) ( not ( = ?auto_66988 ?auto_66989 ) ) ( not ( = ?auto_66988 ?auto_66987 ) ) ( not ( = ?auto_66988 ?auto_66986 ) ) ( not ( = ?auto_66982 ?auto_66988 ) ) ( not ( = ?auto_66983 ?auto_66988 ) ) ( not ( = ?auto_66984 ?auto_66988 ) ) ( not ( = ?auto_66985 ?auto_66988 ) ) ( ON ?auto_66985 ?auto_66986 ) ( CLEAR ?auto_66983 ) ( ON ?auto_66984 ?auto_66985 ) ( CLEAR ?auto_66984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66988 ?auto_66989 ?auto_66987 ?auto_66986 ?auto_66985 )
      ( MAKE-6PILE ?auto_66982 ?auto_66983 ?auto_66984 ?auto_66985 ?auto_66986 ?auto_66987 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66990 - BLOCK
      ?auto_66991 - BLOCK
      ?auto_66992 - BLOCK
      ?auto_66993 - BLOCK
      ?auto_66994 - BLOCK
      ?auto_66995 - BLOCK
    )
    :vars
    (
      ?auto_66997 - BLOCK
      ?auto_66996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66990 ) ( not ( = ?auto_66990 ?auto_66991 ) ) ( not ( = ?auto_66990 ?auto_66992 ) ) ( not ( = ?auto_66990 ?auto_66993 ) ) ( not ( = ?auto_66990 ?auto_66994 ) ) ( not ( = ?auto_66990 ?auto_66995 ) ) ( not ( = ?auto_66991 ?auto_66992 ) ) ( not ( = ?auto_66991 ?auto_66993 ) ) ( not ( = ?auto_66991 ?auto_66994 ) ) ( not ( = ?auto_66991 ?auto_66995 ) ) ( not ( = ?auto_66992 ?auto_66993 ) ) ( not ( = ?auto_66992 ?auto_66994 ) ) ( not ( = ?auto_66992 ?auto_66995 ) ) ( not ( = ?auto_66993 ?auto_66994 ) ) ( not ( = ?auto_66993 ?auto_66995 ) ) ( not ( = ?auto_66994 ?auto_66995 ) ) ( ON ?auto_66995 ?auto_66997 ) ( not ( = ?auto_66990 ?auto_66997 ) ) ( not ( = ?auto_66991 ?auto_66997 ) ) ( not ( = ?auto_66992 ?auto_66997 ) ) ( not ( = ?auto_66993 ?auto_66997 ) ) ( not ( = ?auto_66994 ?auto_66997 ) ) ( not ( = ?auto_66995 ?auto_66997 ) ) ( ON ?auto_66994 ?auto_66995 ) ( ON-TABLE ?auto_66996 ) ( ON ?auto_66997 ?auto_66996 ) ( not ( = ?auto_66996 ?auto_66997 ) ) ( not ( = ?auto_66996 ?auto_66995 ) ) ( not ( = ?auto_66996 ?auto_66994 ) ) ( not ( = ?auto_66990 ?auto_66996 ) ) ( not ( = ?auto_66991 ?auto_66996 ) ) ( not ( = ?auto_66992 ?auto_66996 ) ) ( not ( = ?auto_66993 ?auto_66996 ) ) ( ON ?auto_66993 ?auto_66994 ) ( ON ?auto_66992 ?auto_66993 ) ( CLEAR ?auto_66992 ) ( HOLDING ?auto_66991 ) ( CLEAR ?auto_66990 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66990 ?auto_66991 )
      ( MAKE-6PILE ?auto_66990 ?auto_66991 ?auto_66992 ?auto_66993 ?auto_66994 ?auto_66995 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66998 - BLOCK
      ?auto_66999 - BLOCK
      ?auto_67000 - BLOCK
      ?auto_67001 - BLOCK
      ?auto_67002 - BLOCK
      ?auto_67003 - BLOCK
    )
    :vars
    (
      ?auto_67005 - BLOCK
      ?auto_67004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66998 ) ( not ( = ?auto_66998 ?auto_66999 ) ) ( not ( = ?auto_66998 ?auto_67000 ) ) ( not ( = ?auto_66998 ?auto_67001 ) ) ( not ( = ?auto_66998 ?auto_67002 ) ) ( not ( = ?auto_66998 ?auto_67003 ) ) ( not ( = ?auto_66999 ?auto_67000 ) ) ( not ( = ?auto_66999 ?auto_67001 ) ) ( not ( = ?auto_66999 ?auto_67002 ) ) ( not ( = ?auto_66999 ?auto_67003 ) ) ( not ( = ?auto_67000 ?auto_67001 ) ) ( not ( = ?auto_67000 ?auto_67002 ) ) ( not ( = ?auto_67000 ?auto_67003 ) ) ( not ( = ?auto_67001 ?auto_67002 ) ) ( not ( = ?auto_67001 ?auto_67003 ) ) ( not ( = ?auto_67002 ?auto_67003 ) ) ( ON ?auto_67003 ?auto_67005 ) ( not ( = ?auto_66998 ?auto_67005 ) ) ( not ( = ?auto_66999 ?auto_67005 ) ) ( not ( = ?auto_67000 ?auto_67005 ) ) ( not ( = ?auto_67001 ?auto_67005 ) ) ( not ( = ?auto_67002 ?auto_67005 ) ) ( not ( = ?auto_67003 ?auto_67005 ) ) ( ON ?auto_67002 ?auto_67003 ) ( ON-TABLE ?auto_67004 ) ( ON ?auto_67005 ?auto_67004 ) ( not ( = ?auto_67004 ?auto_67005 ) ) ( not ( = ?auto_67004 ?auto_67003 ) ) ( not ( = ?auto_67004 ?auto_67002 ) ) ( not ( = ?auto_66998 ?auto_67004 ) ) ( not ( = ?auto_66999 ?auto_67004 ) ) ( not ( = ?auto_67000 ?auto_67004 ) ) ( not ( = ?auto_67001 ?auto_67004 ) ) ( ON ?auto_67001 ?auto_67002 ) ( ON ?auto_67000 ?auto_67001 ) ( CLEAR ?auto_66998 ) ( ON ?auto_66999 ?auto_67000 ) ( CLEAR ?auto_66999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67004 ?auto_67005 ?auto_67003 ?auto_67002 ?auto_67001 ?auto_67000 )
      ( MAKE-6PILE ?auto_66998 ?auto_66999 ?auto_67000 ?auto_67001 ?auto_67002 ?auto_67003 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67006 - BLOCK
      ?auto_67007 - BLOCK
      ?auto_67008 - BLOCK
      ?auto_67009 - BLOCK
      ?auto_67010 - BLOCK
      ?auto_67011 - BLOCK
    )
    :vars
    (
      ?auto_67012 - BLOCK
      ?auto_67013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67006 ?auto_67007 ) ) ( not ( = ?auto_67006 ?auto_67008 ) ) ( not ( = ?auto_67006 ?auto_67009 ) ) ( not ( = ?auto_67006 ?auto_67010 ) ) ( not ( = ?auto_67006 ?auto_67011 ) ) ( not ( = ?auto_67007 ?auto_67008 ) ) ( not ( = ?auto_67007 ?auto_67009 ) ) ( not ( = ?auto_67007 ?auto_67010 ) ) ( not ( = ?auto_67007 ?auto_67011 ) ) ( not ( = ?auto_67008 ?auto_67009 ) ) ( not ( = ?auto_67008 ?auto_67010 ) ) ( not ( = ?auto_67008 ?auto_67011 ) ) ( not ( = ?auto_67009 ?auto_67010 ) ) ( not ( = ?auto_67009 ?auto_67011 ) ) ( not ( = ?auto_67010 ?auto_67011 ) ) ( ON ?auto_67011 ?auto_67012 ) ( not ( = ?auto_67006 ?auto_67012 ) ) ( not ( = ?auto_67007 ?auto_67012 ) ) ( not ( = ?auto_67008 ?auto_67012 ) ) ( not ( = ?auto_67009 ?auto_67012 ) ) ( not ( = ?auto_67010 ?auto_67012 ) ) ( not ( = ?auto_67011 ?auto_67012 ) ) ( ON ?auto_67010 ?auto_67011 ) ( ON-TABLE ?auto_67013 ) ( ON ?auto_67012 ?auto_67013 ) ( not ( = ?auto_67013 ?auto_67012 ) ) ( not ( = ?auto_67013 ?auto_67011 ) ) ( not ( = ?auto_67013 ?auto_67010 ) ) ( not ( = ?auto_67006 ?auto_67013 ) ) ( not ( = ?auto_67007 ?auto_67013 ) ) ( not ( = ?auto_67008 ?auto_67013 ) ) ( not ( = ?auto_67009 ?auto_67013 ) ) ( ON ?auto_67009 ?auto_67010 ) ( ON ?auto_67008 ?auto_67009 ) ( ON ?auto_67007 ?auto_67008 ) ( CLEAR ?auto_67007 ) ( HOLDING ?auto_67006 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67006 )
      ( MAKE-6PILE ?auto_67006 ?auto_67007 ?auto_67008 ?auto_67009 ?auto_67010 ?auto_67011 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67014 - BLOCK
      ?auto_67015 - BLOCK
      ?auto_67016 - BLOCK
      ?auto_67017 - BLOCK
      ?auto_67018 - BLOCK
      ?auto_67019 - BLOCK
    )
    :vars
    (
      ?auto_67020 - BLOCK
      ?auto_67021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67014 ?auto_67015 ) ) ( not ( = ?auto_67014 ?auto_67016 ) ) ( not ( = ?auto_67014 ?auto_67017 ) ) ( not ( = ?auto_67014 ?auto_67018 ) ) ( not ( = ?auto_67014 ?auto_67019 ) ) ( not ( = ?auto_67015 ?auto_67016 ) ) ( not ( = ?auto_67015 ?auto_67017 ) ) ( not ( = ?auto_67015 ?auto_67018 ) ) ( not ( = ?auto_67015 ?auto_67019 ) ) ( not ( = ?auto_67016 ?auto_67017 ) ) ( not ( = ?auto_67016 ?auto_67018 ) ) ( not ( = ?auto_67016 ?auto_67019 ) ) ( not ( = ?auto_67017 ?auto_67018 ) ) ( not ( = ?auto_67017 ?auto_67019 ) ) ( not ( = ?auto_67018 ?auto_67019 ) ) ( ON ?auto_67019 ?auto_67020 ) ( not ( = ?auto_67014 ?auto_67020 ) ) ( not ( = ?auto_67015 ?auto_67020 ) ) ( not ( = ?auto_67016 ?auto_67020 ) ) ( not ( = ?auto_67017 ?auto_67020 ) ) ( not ( = ?auto_67018 ?auto_67020 ) ) ( not ( = ?auto_67019 ?auto_67020 ) ) ( ON ?auto_67018 ?auto_67019 ) ( ON-TABLE ?auto_67021 ) ( ON ?auto_67020 ?auto_67021 ) ( not ( = ?auto_67021 ?auto_67020 ) ) ( not ( = ?auto_67021 ?auto_67019 ) ) ( not ( = ?auto_67021 ?auto_67018 ) ) ( not ( = ?auto_67014 ?auto_67021 ) ) ( not ( = ?auto_67015 ?auto_67021 ) ) ( not ( = ?auto_67016 ?auto_67021 ) ) ( not ( = ?auto_67017 ?auto_67021 ) ) ( ON ?auto_67017 ?auto_67018 ) ( ON ?auto_67016 ?auto_67017 ) ( ON ?auto_67015 ?auto_67016 ) ( ON ?auto_67014 ?auto_67015 ) ( CLEAR ?auto_67014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_67021 ?auto_67020 ?auto_67019 ?auto_67018 ?auto_67017 ?auto_67016 ?auto_67015 )
      ( MAKE-6PILE ?auto_67014 ?auto_67015 ?auto_67016 ?auto_67017 ?auto_67018 ?auto_67019 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67023 - BLOCK
    )
    :vars
    (
      ?auto_67024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67024 ?auto_67023 ) ( CLEAR ?auto_67024 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67023 ) ( not ( = ?auto_67023 ?auto_67024 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67024 ?auto_67023 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67025 - BLOCK
    )
    :vars
    (
      ?auto_67026 - BLOCK
      ?auto_67027 - BLOCK
      ?auto_67028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67026 ?auto_67025 ) ( CLEAR ?auto_67026 ) ( ON-TABLE ?auto_67025 ) ( not ( = ?auto_67025 ?auto_67026 ) ) ( HOLDING ?auto_67027 ) ( CLEAR ?auto_67028 ) ( not ( = ?auto_67025 ?auto_67027 ) ) ( not ( = ?auto_67025 ?auto_67028 ) ) ( not ( = ?auto_67026 ?auto_67027 ) ) ( not ( = ?auto_67026 ?auto_67028 ) ) ( not ( = ?auto_67027 ?auto_67028 ) ) )
    :subtasks
    ( ( !STACK ?auto_67027 ?auto_67028 )
      ( MAKE-1PILE ?auto_67025 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67029 - BLOCK
    )
    :vars
    (
      ?auto_67030 - BLOCK
      ?auto_67031 - BLOCK
      ?auto_67032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67030 ?auto_67029 ) ( ON-TABLE ?auto_67029 ) ( not ( = ?auto_67029 ?auto_67030 ) ) ( CLEAR ?auto_67031 ) ( not ( = ?auto_67029 ?auto_67032 ) ) ( not ( = ?auto_67029 ?auto_67031 ) ) ( not ( = ?auto_67030 ?auto_67032 ) ) ( not ( = ?auto_67030 ?auto_67031 ) ) ( not ( = ?auto_67032 ?auto_67031 ) ) ( ON ?auto_67032 ?auto_67030 ) ( CLEAR ?auto_67032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67029 ?auto_67030 )
      ( MAKE-1PILE ?auto_67029 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67033 - BLOCK
    )
    :vars
    (
      ?auto_67036 - BLOCK
      ?auto_67034 - BLOCK
      ?auto_67035 - BLOCK
      ?auto_67040 - BLOCK
      ?auto_67037 - BLOCK
      ?auto_67038 - BLOCK
      ?auto_67039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67036 ?auto_67033 ) ( ON-TABLE ?auto_67033 ) ( not ( = ?auto_67033 ?auto_67036 ) ) ( not ( = ?auto_67033 ?auto_67034 ) ) ( not ( = ?auto_67033 ?auto_67035 ) ) ( not ( = ?auto_67036 ?auto_67034 ) ) ( not ( = ?auto_67036 ?auto_67035 ) ) ( not ( = ?auto_67034 ?auto_67035 ) ) ( ON ?auto_67034 ?auto_67036 ) ( CLEAR ?auto_67034 ) ( HOLDING ?auto_67035 ) ( CLEAR ?auto_67040 ) ( ON-TABLE ?auto_67037 ) ( ON ?auto_67038 ?auto_67037 ) ( ON ?auto_67039 ?auto_67038 ) ( ON ?auto_67040 ?auto_67039 ) ( not ( = ?auto_67037 ?auto_67038 ) ) ( not ( = ?auto_67037 ?auto_67039 ) ) ( not ( = ?auto_67037 ?auto_67040 ) ) ( not ( = ?auto_67037 ?auto_67035 ) ) ( not ( = ?auto_67038 ?auto_67039 ) ) ( not ( = ?auto_67038 ?auto_67040 ) ) ( not ( = ?auto_67038 ?auto_67035 ) ) ( not ( = ?auto_67039 ?auto_67040 ) ) ( not ( = ?auto_67039 ?auto_67035 ) ) ( not ( = ?auto_67040 ?auto_67035 ) ) ( not ( = ?auto_67033 ?auto_67040 ) ) ( not ( = ?auto_67033 ?auto_67037 ) ) ( not ( = ?auto_67033 ?auto_67038 ) ) ( not ( = ?auto_67033 ?auto_67039 ) ) ( not ( = ?auto_67036 ?auto_67040 ) ) ( not ( = ?auto_67036 ?auto_67037 ) ) ( not ( = ?auto_67036 ?auto_67038 ) ) ( not ( = ?auto_67036 ?auto_67039 ) ) ( not ( = ?auto_67034 ?auto_67040 ) ) ( not ( = ?auto_67034 ?auto_67037 ) ) ( not ( = ?auto_67034 ?auto_67038 ) ) ( not ( = ?auto_67034 ?auto_67039 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67037 ?auto_67038 ?auto_67039 ?auto_67040 ?auto_67035 )
      ( MAKE-1PILE ?auto_67033 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67041 - BLOCK
    )
    :vars
    (
      ?auto_67046 - BLOCK
      ?auto_67045 - BLOCK
      ?auto_67047 - BLOCK
      ?auto_67042 - BLOCK
      ?auto_67044 - BLOCK
      ?auto_67048 - BLOCK
      ?auto_67043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67046 ?auto_67041 ) ( ON-TABLE ?auto_67041 ) ( not ( = ?auto_67041 ?auto_67046 ) ) ( not ( = ?auto_67041 ?auto_67045 ) ) ( not ( = ?auto_67041 ?auto_67047 ) ) ( not ( = ?auto_67046 ?auto_67045 ) ) ( not ( = ?auto_67046 ?auto_67047 ) ) ( not ( = ?auto_67045 ?auto_67047 ) ) ( ON ?auto_67045 ?auto_67046 ) ( CLEAR ?auto_67042 ) ( ON-TABLE ?auto_67044 ) ( ON ?auto_67048 ?auto_67044 ) ( ON ?auto_67043 ?auto_67048 ) ( ON ?auto_67042 ?auto_67043 ) ( not ( = ?auto_67044 ?auto_67048 ) ) ( not ( = ?auto_67044 ?auto_67043 ) ) ( not ( = ?auto_67044 ?auto_67042 ) ) ( not ( = ?auto_67044 ?auto_67047 ) ) ( not ( = ?auto_67048 ?auto_67043 ) ) ( not ( = ?auto_67048 ?auto_67042 ) ) ( not ( = ?auto_67048 ?auto_67047 ) ) ( not ( = ?auto_67043 ?auto_67042 ) ) ( not ( = ?auto_67043 ?auto_67047 ) ) ( not ( = ?auto_67042 ?auto_67047 ) ) ( not ( = ?auto_67041 ?auto_67042 ) ) ( not ( = ?auto_67041 ?auto_67044 ) ) ( not ( = ?auto_67041 ?auto_67048 ) ) ( not ( = ?auto_67041 ?auto_67043 ) ) ( not ( = ?auto_67046 ?auto_67042 ) ) ( not ( = ?auto_67046 ?auto_67044 ) ) ( not ( = ?auto_67046 ?auto_67048 ) ) ( not ( = ?auto_67046 ?auto_67043 ) ) ( not ( = ?auto_67045 ?auto_67042 ) ) ( not ( = ?auto_67045 ?auto_67044 ) ) ( not ( = ?auto_67045 ?auto_67048 ) ) ( not ( = ?auto_67045 ?auto_67043 ) ) ( ON ?auto_67047 ?auto_67045 ) ( CLEAR ?auto_67047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67041 ?auto_67046 ?auto_67045 )
      ( MAKE-1PILE ?auto_67041 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67049 - BLOCK
    )
    :vars
    (
      ?auto_67054 - BLOCK
      ?auto_67052 - BLOCK
      ?auto_67055 - BLOCK
      ?auto_67050 - BLOCK
      ?auto_67056 - BLOCK
      ?auto_67051 - BLOCK
      ?auto_67053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67054 ?auto_67049 ) ( ON-TABLE ?auto_67049 ) ( not ( = ?auto_67049 ?auto_67054 ) ) ( not ( = ?auto_67049 ?auto_67052 ) ) ( not ( = ?auto_67049 ?auto_67055 ) ) ( not ( = ?auto_67054 ?auto_67052 ) ) ( not ( = ?auto_67054 ?auto_67055 ) ) ( not ( = ?auto_67052 ?auto_67055 ) ) ( ON ?auto_67052 ?auto_67054 ) ( ON-TABLE ?auto_67050 ) ( ON ?auto_67056 ?auto_67050 ) ( ON ?auto_67051 ?auto_67056 ) ( not ( = ?auto_67050 ?auto_67056 ) ) ( not ( = ?auto_67050 ?auto_67051 ) ) ( not ( = ?auto_67050 ?auto_67053 ) ) ( not ( = ?auto_67050 ?auto_67055 ) ) ( not ( = ?auto_67056 ?auto_67051 ) ) ( not ( = ?auto_67056 ?auto_67053 ) ) ( not ( = ?auto_67056 ?auto_67055 ) ) ( not ( = ?auto_67051 ?auto_67053 ) ) ( not ( = ?auto_67051 ?auto_67055 ) ) ( not ( = ?auto_67053 ?auto_67055 ) ) ( not ( = ?auto_67049 ?auto_67053 ) ) ( not ( = ?auto_67049 ?auto_67050 ) ) ( not ( = ?auto_67049 ?auto_67056 ) ) ( not ( = ?auto_67049 ?auto_67051 ) ) ( not ( = ?auto_67054 ?auto_67053 ) ) ( not ( = ?auto_67054 ?auto_67050 ) ) ( not ( = ?auto_67054 ?auto_67056 ) ) ( not ( = ?auto_67054 ?auto_67051 ) ) ( not ( = ?auto_67052 ?auto_67053 ) ) ( not ( = ?auto_67052 ?auto_67050 ) ) ( not ( = ?auto_67052 ?auto_67056 ) ) ( not ( = ?auto_67052 ?auto_67051 ) ) ( ON ?auto_67055 ?auto_67052 ) ( CLEAR ?auto_67055 ) ( HOLDING ?auto_67053 ) ( CLEAR ?auto_67051 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67050 ?auto_67056 ?auto_67051 ?auto_67053 )
      ( MAKE-1PILE ?auto_67049 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67057 - BLOCK
    )
    :vars
    (
      ?auto_67063 - BLOCK
      ?auto_67064 - BLOCK
      ?auto_67058 - BLOCK
      ?auto_67062 - BLOCK
      ?auto_67061 - BLOCK
      ?auto_67059 - BLOCK
      ?auto_67060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67063 ?auto_67057 ) ( ON-TABLE ?auto_67057 ) ( not ( = ?auto_67057 ?auto_67063 ) ) ( not ( = ?auto_67057 ?auto_67064 ) ) ( not ( = ?auto_67057 ?auto_67058 ) ) ( not ( = ?auto_67063 ?auto_67064 ) ) ( not ( = ?auto_67063 ?auto_67058 ) ) ( not ( = ?auto_67064 ?auto_67058 ) ) ( ON ?auto_67064 ?auto_67063 ) ( ON-TABLE ?auto_67062 ) ( ON ?auto_67061 ?auto_67062 ) ( ON ?auto_67059 ?auto_67061 ) ( not ( = ?auto_67062 ?auto_67061 ) ) ( not ( = ?auto_67062 ?auto_67059 ) ) ( not ( = ?auto_67062 ?auto_67060 ) ) ( not ( = ?auto_67062 ?auto_67058 ) ) ( not ( = ?auto_67061 ?auto_67059 ) ) ( not ( = ?auto_67061 ?auto_67060 ) ) ( not ( = ?auto_67061 ?auto_67058 ) ) ( not ( = ?auto_67059 ?auto_67060 ) ) ( not ( = ?auto_67059 ?auto_67058 ) ) ( not ( = ?auto_67060 ?auto_67058 ) ) ( not ( = ?auto_67057 ?auto_67060 ) ) ( not ( = ?auto_67057 ?auto_67062 ) ) ( not ( = ?auto_67057 ?auto_67061 ) ) ( not ( = ?auto_67057 ?auto_67059 ) ) ( not ( = ?auto_67063 ?auto_67060 ) ) ( not ( = ?auto_67063 ?auto_67062 ) ) ( not ( = ?auto_67063 ?auto_67061 ) ) ( not ( = ?auto_67063 ?auto_67059 ) ) ( not ( = ?auto_67064 ?auto_67060 ) ) ( not ( = ?auto_67064 ?auto_67062 ) ) ( not ( = ?auto_67064 ?auto_67061 ) ) ( not ( = ?auto_67064 ?auto_67059 ) ) ( ON ?auto_67058 ?auto_67064 ) ( CLEAR ?auto_67059 ) ( ON ?auto_67060 ?auto_67058 ) ( CLEAR ?auto_67060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67057 ?auto_67063 ?auto_67064 ?auto_67058 )
      ( MAKE-1PILE ?auto_67057 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67065 - BLOCK
    )
    :vars
    (
      ?auto_67070 - BLOCK
      ?auto_67067 - BLOCK
      ?auto_67072 - BLOCK
      ?auto_67066 - BLOCK
      ?auto_67071 - BLOCK
      ?auto_67069 - BLOCK
      ?auto_67068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67070 ?auto_67065 ) ( ON-TABLE ?auto_67065 ) ( not ( = ?auto_67065 ?auto_67070 ) ) ( not ( = ?auto_67065 ?auto_67067 ) ) ( not ( = ?auto_67065 ?auto_67072 ) ) ( not ( = ?auto_67070 ?auto_67067 ) ) ( not ( = ?auto_67070 ?auto_67072 ) ) ( not ( = ?auto_67067 ?auto_67072 ) ) ( ON ?auto_67067 ?auto_67070 ) ( ON-TABLE ?auto_67066 ) ( ON ?auto_67071 ?auto_67066 ) ( not ( = ?auto_67066 ?auto_67071 ) ) ( not ( = ?auto_67066 ?auto_67069 ) ) ( not ( = ?auto_67066 ?auto_67068 ) ) ( not ( = ?auto_67066 ?auto_67072 ) ) ( not ( = ?auto_67071 ?auto_67069 ) ) ( not ( = ?auto_67071 ?auto_67068 ) ) ( not ( = ?auto_67071 ?auto_67072 ) ) ( not ( = ?auto_67069 ?auto_67068 ) ) ( not ( = ?auto_67069 ?auto_67072 ) ) ( not ( = ?auto_67068 ?auto_67072 ) ) ( not ( = ?auto_67065 ?auto_67068 ) ) ( not ( = ?auto_67065 ?auto_67066 ) ) ( not ( = ?auto_67065 ?auto_67071 ) ) ( not ( = ?auto_67065 ?auto_67069 ) ) ( not ( = ?auto_67070 ?auto_67068 ) ) ( not ( = ?auto_67070 ?auto_67066 ) ) ( not ( = ?auto_67070 ?auto_67071 ) ) ( not ( = ?auto_67070 ?auto_67069 ) ) ( not ( = ?auto_67067 ?auto_67068 ) ) ( not ( = ?auto_67067 ?auto_67066 ) ) ( not ( = ?auto_67067 ?auto_67071 ) ) ( not ( = ?auto_67067 ?auto_67069 ) ) ( ON ?auto_67072 ?auto_67067 ) ( ON ?auto_67068 ?auto_67072 ) ( CLEAR ?auto_67068 ) ( HOLDING ?auto_67069 ) ( CLEAR ?auto_67071 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67066 ?auto_67071 ?auto_67069 )
      ( MAKE-1PILE ?auto_67065 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67073 - BLOCK
    )
    :vars
    (
      ?auto_67076 - BLOCK
      ?auto_67078 - BLOCK
      ?auto_67075 - BLOCK
      ?auto_67074 - BLOCK
      ?auto_67079 - BLOCK
      ?auto_67077 - BLOCK
      ?auto_67080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67076 ?auto_67073 ) ( ON-TABLE ?auto_67073 ) ( not ( = ?auto_67073 ?auto_67076 ) ) ( not ( = ?auto_67073 ?auto_67078 ) ) ( not ( = ?auto_67073 ?auto_67075 ) ) ( not ( = ?auto_67076 ?auto_67078 ) ) ( not ( = ?auto_67076 ?auto_67075 ) ) ( not ( = ?auto_67078 ?auto_67075 ) ) ( ON ?auto_67078 ?auto_67076 ) ( ON-TABLE ?auto_67074 ) ( ON ?auto_67079 ?auto_67074 ) ( not ( = ?auto_67074 ?auto_67079 ) ) ( not ( = ?auto_67074 ?auto_67077 ) ) ( not ( = ?auto_67074 ?auto_67080 ) ) ( not ( = ?auto_67074 ?auto_67075 ) ) ( not ( = ?auto_67079 ?auto_67077 ) ) ( not ( = ?auto_67079 ?auto_67080 ) ) ( not ( = ?auto_67079 ?auto_67075 ) ) ( not ( = ?auto_67077 ?auto_67080 ) ) ( not ( = ?auto_67077 ?auto_67075 ) ) ( not ( = ?auto_67080 ?auto_67075 ) ) ( not ( = ?auto_67073 ?auto_67080 ) ) ( not ( = ?auto_67073 ?auto_67074 ) ) ( not ( = ?auto_67073 ?auto_67079 ) ) ( not ( = ?auto_67073 ?auto_67077 ) ) ( not ( = ?auto_67076 ?auto_67080 ) ) ( not ( = ?auto_67076 ?auto_67074 ) ) ( not ( = ?auto_67076 ?auto_67079 ) ) ( not ( = ?auto_67076 ?auto_67077 ) ) ( not ( = ?auto_67078 ?auto_67080 ) ) ( not ( = ?auto_67078 ?auto_67074 ) ) ( not ( = ?auto_67078 ?auto_67079 ) ) ( not ( = ?auto_67078 ?auto_67077 ) ) ( ON ?auto_67075 ?auto_67078 ) ( ON ?auto_67080 ?auto_67075 ) ( CLEAR ?auto_67079 ) ( ON ?auto_67077 ?auto_67080 ) ( CLEAR ?auto_67077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67073 ?auto_67076 ?auto_67078 ?auto_67075 ?auto_67080 )
      ( MAKE-1PILE ?auto_67073 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67081 - BLOCK
    )
    :vars
    (
      ?auto_67087 - BLOCK
      ?auto_67083 - BLOCK
      ?auto_67088 - BLOCK
      ?auto_67086 - BLOCK
      ?auto_67082 - BLOCK
      ?auto_67084 - BLOCK
      ?auto_67085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67087 ?auto_67081 ) ( ON-TABLE ?auto_67081 ) ( not ( = ?auto_67081 ?auto_67087 ) ) ( not ( = ?auto_67081 ?auto_67083 ) ) ( not ( = ?auto_67081 ?auto_67088 ) ) ( not ( = ?auto_67087 ?auto_67083 ) ) ( not ( = ?auto_67087 ?auto_67088 ) ) ( not ( = ?auto_67083 ?auto_67088 ) ) ( ON ?auto_67083 ?auto_67087 ) ( ON-TABLE ?auto_67086 ) ( not ( = ?auto_67086 ?auto_67082 ) ) ( not ( = ?auto_67086 ?auto_67084 ) ) ( not ( = ?auto_67086 ?auto_67085 ) ) ( not ( = ?auto_67086 ?auto_67088 ) ) ( not ( = ?auto_67082 ?auto_67084 ) ) ( not ( = ?auto_67082 ?auto_67085 ) ) ( not ( = ?auto_67082 ?auto_67088 ) ) ( not ( = ?auto_67084 ?auto_67085 ) ) ( not ( = ?auto_67084 ?auto_67088 ) ) ( not ( = ?auto_67085 ?auto_67088 ) ) ( not ( = ?auto_67081 ?auto_67085 ) ) ( not ( = ?auto_67081 ?auto_67086 ) ) ( not ( = ?auto_67081 ?auto_67082 ) ) ( not ( = ?auto_67081 ?auto_67084 ) ) ( not ( = ?auto_67087 ?auto_67085 ) ) ( not ( = ?auto_67087 ?auto_67086 ) ) ( not ( = ?auto_67087 ?auto_67082 ) ) ( not ( = ?auto_67087 ?auto_67084 ) ) ( not ( = ?auto_67083 ?auto_67085 ) ) ( not ( = ?auto_67083 ?auto_67086 ) ) ( not ( = ?auto_67083 ?auto_67082 ) ) ( not ( = ?auto_67083 ?auto_67084 ) ) ( ON ?auto_67088 ?auto_67083 ) ( ON ?auto_67085 ?auto_67088 ) ( ON ?auto_67084 ?auto_67085 ) ( CLEAR ?auto_67084 ) ( HOLDING ?auto_67082 ) ( CLEAR ?auto_67086 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67086 ?auto_67082 )
      ( MAKE-1PILE ?auto_67081 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68495 - BLOCK
    )
    :vars
    (
      ?auto_68497 - BLOCK
      ?auto_68500 - BLOCK
      ?auto_68498 - BLOCK
      ?auto_68499 - BLOCK
      ?auto_68496 - BLOCK
      ?auto_68501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68497 ?auto_68495 ) ( ON-TABLE ?auto_68495 ) ( not ( = ?auto_68495 ?auto_68497 ) ) ( not ( = ?auto_68495 ?auto_68500 ) ) ( not ( = ?auto_68495 ?auto_68498 ) ) ( not ( = ?auto_68497 ?auto_68500 ) ) ( not ( = ?auto_68497 ?auto_68498 ) ) ( not ( = ?auto_68500 ?auto_68498 ) ) ( ON ?auto_68500 ?auto_68497 ) ( not ( = ?auto_68499 ?auto_68496 ) ) ( not ( = ?auto_68499 ?auto_68501 ) ) ( not ( = ?auto_68499 ?auto_68498 ) ) ( not ( = ?auto_68496 ?auto_68501 ) ) ( not ( = ?auto_68496 ?auto_68498 ) ) ( not ( = ?auto_68501 ?auto_68498 ) ) ( not ( = ?auto_68495 ?auto_68501 ) ) ( not ( = ?auto_68495 ?auto_68499 ) ) ( not ( = ?auto_68495 ?auto_68496 ) ) ( not ( = ?auto_68497 ?auto_68501 ) ) ( not ( = ?auto_68497 ?auto_68499 ) ) ( not ( = ?auto_68497 ?auto_68496 ) ) ( not ( = ?auto_68500 ?auto_68501 ) ) ( not ( = ?auto_68500 ?auto_68499 ) ) ( not ( = ?auto_68500 ?auto_68496 ) ) ( ON ?auto_68498 ?auto_68500 ) ( ON ?auto_68501 ?auto_68498 ) ( ON ?auto_68496 ?auto_68501 ) ( ON ?auto_68499 ?auto_68496 ) ( CLEAR ?auto_68499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68495 ?auto_68497 ?auto_68500 ?auto_68498 ?auto_68501 ?auto_68496 )
      ( MAKE-1PILE ?auto_68495 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67097 - BLOCK
    )
    :vars
    (
      ?auto_67102 - BLOCK
      ?auto_67098 - BLOCK
      ?auto_67100 - BLOCK
      ?auto_67104 - BLOCK
      ?auto_67099 - BLOCK
      ?auto_67103 - BLOCK
      ?auto_67101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67102 ?auto_67097 ) ( ON-TABLE ?auto_67097 ) ( not ( = ?auto_67097 ?auto_67102 ) ) ( not ( = ?auto_67097 ?auto_67098 ) ) ( not ( = ?auto_67097 ?auto_67100 ) ) ( not ( = ?auto_67102 ?auto_67098 ) ) ( not ( = ?auto_67102 ?auto_67100 ) ) ( not ( = ?auto_67098 ?auto_67100 ) ) ( ON ?auto_67098 ?auto_67102 ) ( not ( = ?auto_67104 ?auto_67099 ) ) ( not ( = ?auto_67104 ?auto_67103 ) ) ( not ( = ?auto_67104 ?auto_67101 ) ) ( not ( = ?auto_67104 ?auto_67100 ) ) ( not ( = ?auto_67099 ?auto_67103 ) ) ( not ( = ?auto_67099 ?auto_67101 ) ) ( not ( = ?auto_67099 ?auto_67100 ) ) ( not ( = ?auto_67103 ?auto_67101 ) ) ( not ( = ?auto_67103 ?auto_67100 ) ) ( not ( = ?auto_67101 ?auto_67100 ) ) ( not ( = ?auto_67097 ?auto_67101 ) ) ( not ( = ?auto_67097 ?auto_67104 ) ) ( not ( = ?auto_67097 ?auto_67099 ) ) ( not ( = ?auto_67097 ?auto_67103 ) ) ( not ( = ?auto_67102 ?auto_67101 ) ) ( not ( = ?auto_67102 ?auto_67104 ) ) ( not ( = ?auto_67102 ?auto_67099 ) ) ( not ( = ?auto_67102 ?auto_67103 ) ) ( not ( = ?auto_67098 ?auto_67101 ) ) ( not ( = ?auto_67098 ?auto_67104 ) ) ( not ( = ?auto_67098 ?auto_67099 ) ) ( not ( = ?auto_67098 ?auto_67103 ) ) ( ON ?auto_67100 ?auto_67098 ) ( ON ?auto_67101 ?auto_67100 ) ( ON ?auto_67103 ?auto_67101 ) ( ON ?auto_67099 ?auto_67103 ) ( CLEAR ?auto_67099 ) ( HOLDING ?auto_67104 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67104 )
      ( MAKE-1PILE ?auto_67097 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67105 - BLOCK
    )
    :vars
    (
      ?auto_67112 - BLOCK
      ?auto_67107 - BLOCK
      ?auto_67109 - BLOCK
      ?auto_67108 - BLOCK
      ?auto_67106 - BLOCK
      ?auto_67111 - BLOCK
      ?auto_67110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67112 ?auto_67105 ) ( ON-TABLE ?auto_67105 ) ( not ( = ?auto_67105 ?auto_67112 ) ) ( not ( = ?auto_67105 ?auto_67107 ) ) ( not ( = ?auto_67105 ?auto_67109 ) ) ( not ( = ?auto_67112 ?auto_67107 ) ) ( not ( = ?auto_67112 ?auto_67109 ) ) ( not ( = ?auto_67107 ?auto_67109 ) ) ( ON ?auto_67107 ?auto_67112 ) ( not ( = ?auto_67108 ?auto_67106 ) ) ( not ( = ?auto_67108 ?auto_67111 ) ) ( not ( = ?auto_67108 ?auto_67110 ) ) ( not ( = ?auto_67108 ?auto_67109 ) ) ( not ( = ?auto_67106 ?auto_67111 ) ) ( not ( = ?auto_67106 ?auto_67110 ) ) ( not ( = ?auto_67106 ?auto_67109 ) ) ( not ( = ?auto_67111 ?auto_67110 ) ) ( not ( = ?auto_67111 ?auto_67109 ) ) ( not ( = ?auto_67110 ?auto_67109 ) ) ( not ( = ?auto_67105 ?auto_67110 ) ) ( not ( = ?auto_67105 ?auto_67108 ) ) ( not ( = ?auto_67105 ?auto_67106 ) ) ( not ( = ?auto_67105 ?auto_67111 ) ) ( not ( = ?auto_67112 ?auto_67110 ) ) ( not ( = ?auto_67112 ?auto_67108 ) ) ( not ( = ?auto_67112 ?auto_67106 ) ) ( not ( = ?auto_67112 ?auto_67111 ) ) ( not ( = ?auto_67107 ?auto_67110 ) ) ( not ( = ?auto_67107 ?auto_67108 ) ) ( not ( = ?auto_67107 ?auto_67106 ) ) ( not ( = ?auto_67107 ?auto_67111 ) ) ( ON ?auto_67109 ?auto_67107 ) ( ON ?auto_67110 ?auto_67109 ) ( ON ?auto_67111 ?auto_67110 ) ( ON ?auto_67106 ?auto_67111 ) ( ON ?auto_67108 ?auto_67106 ) ( CLEAR ?auto_67108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_67105 ?auto_67112 ?auto_67107 ?auto_67109 ?auto_67110 ?auto_67111 ?auto_67106 )
      ( MAKE-1PILE ?auto_67105 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67120 - BLOCK
      ?auto_67121 - BLOCK
      ?auto_67122 - BLOCK
      ?auto_67123 - BLOCK
      ?auto_67124 - BLOCK
      ?auto_67125 - BLOCK
      ?auto_67126 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_67126 ) ( CLEAR ?auto_67125 ) ( ON-TABLE ?auto_67120 ) ( ON ?auto_67121 ?auto_67120 ) ( ON ?auto_67122 ?auto_67121 ) ( ON ?auto_67123 ?auto_67122 ) ( ON ?auto_67124 ?auto_67123 ) ( ON ?auto_67125 ?auto_67124 ) ( not ( = ?auto_67120 ?auto_67121 ) ) ( not ( = ?auto_67120 ?auto_67122 ) ) ( not ( = ?auto_67120 ?auto_67123 ) ) ( not ( = ?auto_67120 ?auto_67124 ) ) ( not ( = ?auto_67120 ?auto_67125 ) ) ( not ( = ?auto_67120 ?auto_67126 ) ) ( not ( = ?auto_67121 ?auto_67122 ) ) ( not ( = ?auto_67121 ?auto_67123 ) ) ( not ( = ?auto_67121 ?auto_67124 ) ) ( not ( = ?auto_67121 ?auto_67125 ) ) ( not ( = ?auto_67121 ?auto_67126 ) ) ( not ( = ?auto_67122 ?auto_67123 ) ) ( not ( = ?auto_67122 ?auto_67124 ) ) ( not ( = ?auto_67122 ?auto_67125 ) ) ( not ( = ?auto_67122 ?auto_67126 ) ) ( not ( = ?auto_67123 ?auto_67124 ) ) ( not ( = ?auto_67123 ?auto_67125 ) ) ( not ( = ?auto_67123 ?auto_67126 ) ) ( not ( = ?auto_67124 ?auto_67125 ) ) ( not ( = ?auto_67124 ?auto_67126 ) ) ( not ( = ?auto_67125 ?auto_67126 ) ) )
    :subtasks
    ( ( !STACK ?auto_67126 ?auto_67125 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67127 - BLOCK
      ?auto_67128 - BLOCK
      ?auto_67129 - BLOCK
      ?auto_67130 - BLOCK
      ?auto_67131 - BLOCK
      ?auto_67132 - BLOCK
      ?auto_67133 - BLOCK
    )
    :vars
    (
      ?auto_67134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_67132 ) ( ON-TABLE ?auto_67127 ) ( ON ?auto_67128 ?auto_67127 ) ( ON ?auto_67129 ?auto_67128 ) ( ON ?auto_67130 ?auto_67129 ) ( ON ?auto_67131 ?auto_67130 ) ( ON ?auto_67132 ?auto_67131 ) ( not ( = ?auto_67127 ?auto_67128 ) ) ( not ( = ?auto_67127 ?auto_67129 ) ) ( not ( = ?auto_67127 ?auto_67130 ) ) ( not ( = ?auto_67127 ?auto_67131 ) ) ( not ( = ?auto_67127 ?auto_67132 ) ) ( not ( = ?auto_67127 ?auto_67133 ) ) ( not ( = ?auto_67128 ?auto_67129 ) ) ( not ( = ?auto_67128 ?auto_67130 ) ) ( not ( = ?auto_67128 ?auto_67131 ) ) ( not ( = ?auto_67128 ?auto_67132 ) ) ( not ( = ?auto_67128 ?auto_67133 ) ) ( not ( = ?auto_67129 ?auto_67130 ) ) ( not ( = ?auto_67129 ?auto_67131 ) ) ( not ( = ?auto_67129 ?auto_67132 ) ) ( not ( = ?auto_67129 ?auto_67133 ) ) ( not ( = ?auto_67130 ?auto_67131 ) ) ( not ( = ?auto_67130 ?auto_67132 ) ) ( not ( = ?auto_67130 ?auto_67133 ) ) ( not ( = ?auto_67131 ?auto_67132 ) ) ( not ( = ?auto_67131 ?auto_67133 ) ) ( not ( = ?auto_67132 ?auto_67133 ) ) ( ON ?auto_67133 ?auto_67134 ) ( CLEAR ?auto_67133 ) ( HAND-EMPTY ) ( not ( = ?auto_67127 ?auto_67134 ) ) ( not ( = ?auto_67128 ?auto_67134 ) ) ( not ( = ?auto_67129 ?auto_67134 ) ) ( not ( = ?auto_67130 ?auto_67134 ) ) ( not ( = ?auto_67131 ?auto_67134 ) ) ( not ( = ?auto_67132 ?auto_67134 ) ) ( not ( = ?auto_67133 ?auto_67134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67133 ?auto_67134 )
      ( MAKE-7PILE ?auto_67127 ?auto_67128 ?auto_67129 ?auto_67130 ?auto_67131 ?auto_67132 ?auto_67133 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67135 - BLOCK
      ?auto_67136 - BLOCK
      ?auto_67137 - BLOCK
      ?auto_67138 - BLOCK
      ?auto_67139 - BLOCK
      ?auto_67140 - BLOCK
      ?auto_67141 - BLOCK
    )
    :vars
    (
      ?auto_67142 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67135 ) ( ON ?auto_67136 ?auto_67135 ) ( ON ?auto_67137 ?auto_67136 ) ( ON ?auto_67138 ?auto_67137 ) ( ON ?auto_67139 ?auto_67138 ) ( not ( = ?auto_67135 ?auto_67136 ) ) ( not ( = ?auto_67135 ?auto_67137 ) ) ( not ( = ?auto_67135 ?auto_67138 ) ) ( not ( = ?auto_67135 ?auto_67139 ) ) ( not ( = ?auto_67135 ?auto_67140 ) ) ( not ( = ?auto_67135 ?auto_67141 ) ) ( not ( = ?auto_67136 ?auto_67137 ) ) ( not ( = ?auto_67136 ?auto_67138 ) ) ( not ( = ?auto_67136 ?auto_67139 ) ) ( not ( = ?auto_67136 ?auto_67140 ) ) ( not ( = ?auto_67136 ?auto_67141 ) ) ( not ( = ?auto_67137 ?auto_67138 ) ) ( not ( = ?auto_67137 ?auto_67139 ) ) ( not ( = ?auto_67137 ?auto_67140 ) ) ( not ( = ?auto_67137 ?auto_67141 ) ) ( not ( = ?auto_67138 ?auto_67139 ) ) ( not ( = ?auto_67138 ?auto_67140 ) ) ( not ( = ?auto_67138 ?auto_67141 ) ) ( not ( = ?auto_67139 ?auto_67140 ) ) ( not ( = ?auto_67139 ?auto_67141 ) ) ( not ( = ?auto_67140 ?auto_67141 ) ) ( ON ?auto_67141 ?auto_67142 ) ( CLEAR ?auto_67141 ) ( not ( = ?auto_67135 ?auto_67142 ) ) ( not ( = ?auto_67136 ?auto_67142 ) ) ( not ( = ?auto_67137 ?auto_67142 ) ) ( not ( = ?auto_67138 ?auto_67142 ) ) ( not ( = ?auto_67139 ?auto_67142 ) ) ( not ( = ?auto_67140 ?auto_67142 ) ) ( not ( = ?auto_67141 ?auto_67142 ) ) ( HOLDING ?auto_67140 ) ( CLEAR ?auto_67139 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67135 ?auto_67136 ?auto_67137 ?auto_67138 ?auto_67139 ?auto_67140 )
      ( MAKE-7PILE ?auto_67135 ?auto_67136 ?auto_67137 ?auto_67138 ?auto_67139 ?auto_67140 ?auto_67141 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67143 - BLOCK
      ?auto_67144 - BLOCK
      ?auto_67145 - BLOCK
      ?auto_67146 - BLOCK
      ?auto_67147 - BLOCK
      ?auto_67148 - BLOCK
      ?auto_67149 - BLOCK
    )
    :vars
    (
      ?auto_67150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67143 ) ( ON ?auto_67144 ?auto_67143 ) ( ON ?auto_67145 ?auto_67144 ) ( ON ?auto_67146 ?auto_67145 ) ( ON ?auto_67147 ?auto_67146 ) ( not ( = ?auto_67143 ?auto_67144 ) ) ( not ( = ?auto_67143 ?auto_67145 ) ) ( not ( = ?auto_67143 ?auto_67146 ) ) ( not ( = ?auto_67143 ?auto_67147 ) ) ( not ( = ?auto_67143 ?auto_67148 ) ) ( not ( = ?auto_67143 ?auto_67149 ) ) ( not ( = ?auto_67144 ?auto_67145 ) ) ( not ( = ?auto_67144 ?auto_67146 ) ) ( not ( = ?auto_67144 ?auto_67147 ) ) ( not ( = ?auto_67144 ?auto_67148 ) ) ( not ( = ?auto_67144 ?auto_67149 ) ) ( not ( = ?auto_67145 ?auto_67146 ) ) ( not ( = ?auto_67145 ?auto_67147 ) ) ( not ( = ?auto_67145 ?auto_67148 ) ) ( not ( = ?auto_67145 ?auto_67149 ) ) ( not ( = ?auto_67146 ?auto_67147 ) ) ( not ( = ?auto_67146 ?auto_67148 ) ) ( not ( = ?auto_67146 ?auto_67149 ) ) ( not ( = ?auto_67147 ?auto_67148 ) ) ( not ( = ?auto_67147 ?auto_67149 ) ) ( not ( = ?auto_67148 ?auto_67149 ) ) ( ON ?auto_67149 ?auto_67150 ) ( not ( = ?auto_67143 ?auto_67150 ) ) ( not ( = ?auto_67144 ?auto_67150 ) ) ( not ( = ?auto_67145 ?auto_67150 ) ) ( not ( = ?auto_67146 ?auto_67150 ) ) ( not ( = ?auto_67147 ?auto_67150 ) ) ( not ( = ?auto_67148 ?auto_67150 ) ) ( not ( = ?auto_67149 ?auto_67150 ) ) ( CLEAR ?auto_67147 ) ( ON ?auto_67148 ?auto_67149 ) ( CLEAR ?auto_67148 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67150 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67150 ?auto_67149 )
      ( MAKE-7PILE ?auto_67143 ?auto_67144 ?auto_67145 ?auto_67146 ?auto_67147 ?auto_67148 ?auto_67149 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67151 - BLOCK
      ?auto_67152 - BLOCK
      ?auto_67153 - BLOCK
      ?auto_67154 - BLOCK
      ?auto_67155 - BLOCK
      ?auto_67156 - BLOCK
      ?auto_67157 - BLOCK
    )
    :vars
    (
      ?auto_67158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67151 ) ( ON ?auto_67152 ?auto_67151 ) ( ON ?auto_67153 ?auto_67152 ) ( ON ?auto_67154 ?auto_67153 ) ( not ( = ?auto_67151 ?auto_67152 ) ) ( not ( = ?auto_67151 ?auto_67153 ) ) ( not ( = ?auto_67151 ?auto_67154 ) ) ( not ( = ?auto_67151 ?auto_67155 ) ) ( not ( = ?auto_67151 ?auto_67156 ) ) ( not ( = ?auto_67151 ?auto_67157 ) ) ( not ( = ?auto_67152 ?auto_67153 ) ) ( not ( = ?auto_67152 ?auto_67154 ) ) ( not ( = ?auto_67152 ?auto_67155 ) ) ( not ( = ?auto_67152 ?auto_67156 ) ) ( not ( = ?auto_67152 ?auto_67157 ) ) ( not ( = ?auto_67153 ?auto_67154 ) ) ( not ( = ?auto_67153 ?auto_67155 ) ) ( not ( = ?auto_67153 ?auto_67156 ) ) ( not ( = ?auto_67153 ?auto_67157 ) ) ( not ( = ?auto_67154 ?auto_67155 ) ) ( not ( = ?auto_67154 ?auto_67156 ) ) ( not ( = ?auto_67154 ?auto_67157 ) ) ( not ( = ?auto_67155 ?auto_67156 ) ) ( not ( = ?auto_67155 ?auto_67157 ) ) ( not ( = ?auto_67156 ?auto_67157 ) ) ( ON ?auto_67157 ?auto_67158 ) ( not ( = ?auto_67151 ?auto_67158 ) ) ( not ( = ?auto_67152 ?auto_67158 ) ) ( not ( = ?auto_67153 ?auto_67158 ) ) ( not ( = ?auto_67154 ?auto_67158 ) ) ( not ( = ?auto_67155 ?auto_67158 ) ) ( not ( = ?auto_67156 ?auto_67158 ) ) ( not ( = ?auto_67157 ?auto_67158 ) ) ( ON ?auto_67156 ?auto_67157 ) ( CLEAR ?auto_67156 ) ( ON-TABLE ?auto_67158 ) ( HOLDING ?auto_67155 ) ( CLEAR ?auto_67154 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67151 ?auto_67152 ?auto_67153 ?auto_67154 ?auto_67155 )
      ( MAKE-7PILE ?auto_67151 ?auto_67152 ?auto_67153 ?auto_67154 ?auto_67155 ?auto_67156 ?auto_67157 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67159 - BLOCK
      ?auto_67160 - BLOCK
      ?auto_67161 - BLOCK
      ?auto_67162 - BLOCK
      ?auto_67163 - BLOCK
      ?auto_67164 - BLOCK
      ?auto_67165 - BLOCK
    )
    :vars
    (
      ?auto_67166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67159 ) ( ON ?auto_67160 ?auto_67159 ) ( ON ?auto_67161 ?auto_67160 ) ( ON ?auto_67162 ?auto_67161 ) ( not ( = ?auto_67159 ?auto_67160 ) ) ( not ( = ?auto_67159 ?auto_67161 ) ) ( not ( = ?auto_67159 ?auto_67162 ) ) ( not ( = ?auto_67159 ?auto_67163 ) ) ( not ( = ?auto_67159 ?auto_67164 ) ) ( not ( = ?auto_67159 ?auto_67165 ) ) ( not ( = ?auto_67160 ?auto_67161 ) ) ( not ( = ?auto_67160 ?auto_67162 ) ) ( not ( = ?auto_67160 ?auto_67163 ) ) ( not ( = ?auto_67160 ?auto_67164 ) ) ( not ( = ?auto_67160 ?auto_67165 ) ) ( not ( = ?auto_67161 ?auto_67162 ) ) ( not ( = ?auto_67161 ?auto_67163 ) ) ( not ( = ?auto_67161 ?auto_67164 ) ) ( not ( = ?auto_67161 ?auto_67165 ) ) ( not ( = ?auto_67162 ?auto_67163 ) ) ( not ( = ?auto_67162 ?auto_67164 ) ) ( not ( = ?auto_67162 ?auto_67165 ) ) ( not ( = ?auto_67163 ?auto_67164 ) ) ( not ( = ?auto_67163 ?auto_67165 ) ) ( not ( = ?auto_67164 ?auto_67165 ) ) ( ON ?auto_67165 ?auto_67166 ) ( not ( = ?auto_67159 ?auto_67166 ) ) ( not ( = ?auto_67160 ?auto_67166 ) ) ( not ( = ?auto_67161 ?auto_67166 ) ) ( not ( = ?auto_67162 ?auto_67166 ) ) ( not ( = ?auto_67163 ?auto_67166 ) ) ( not ( = ?auto_67164 ?auto_67166 ) ) ( not ( = ?auto_67165 ?auto_67166 ) ) ( ON ?auto_67164 ?auto_67165 ) ( ON-TABLE ?auto_67166 ) ( CLEAR ?auto_67162 ) ( ON ?auto_67163 ?auto_67164 ) ( CLEAR ?auto_67163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67166 ?auto_67165 ?auto_67164 )
      ( MAKE-7PILE ?auto_67159 ?auto_67160 ?auto_67161 ?auto_67162 ?auto_67163 ?auto_67164 ?auto_67165 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67167 - BLOCK
      ?auto_67168 - BLOCK
      ?auto_67169 - BLOCK
      ?auto_67170 - BLOCK
      ?auto_67171 - BLOCK
      ?auto_67172 - BLOCK
      ?auto_67173 - BLOCK
    )
    :vars
    (
      ?auto_67174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67167 ) ( ON ?auto_67168 ?auto_67167 ) ( ON ?auto_67169 ?auto_67168 ) ( not ( = ?auto_67167 ?auto_67168 ) ) ( not ( = ?auto_67167 ?auto_67169 ) ) ( not ( = ?auto_67167 ?auto_67170 ) ) ( not ( = ?auto_67167 ?auto_67171 ) ) ( not ( = ?auto_67167 ?auto_67172 ) ) ( not ( = ?auto_67167 ?auto_67173 ) ) ( not ( = ?auto_67168 ?auto_67169 ) ) ( not ( = ?auto_67168 ?auto_67170 ) ) ( not ( = ?auto_67168 ?auto_67171 ) ) ( not ( = ?auto_67168 ?auto_67172 ) ) ( not ( = ?auto_67168 ?auto_67173 ) ) ( not ( = ?auto_67169 ?auto_67170 ) ) ( not ( = ?auto_67169 ?auto_67171 ) ) ( not ( = ?auto_67169 ?auto_67172 ) ) ( not ( = ?auto_67169 ?auto_67173 ) ) ( not ( = ?auto_67170 ?auto_67171 ) ) ( not ( = ?auto_67170 ?auto_67172 ) ) ( not ( = ?auto_67170 ?auto_67173 ) ) ( not ( = ?auto_67171 ?auto_67172 ) ) ( not ( = ?auto_67171 ?auto_67173 ) ) ( not ( = ?auto_67172 ?auto_67173 ) ) ( ON ?auto_67173 ?auto_67174 ) ( not ( = ?auto_67167 ?auto_67174 ) ) ( not ( = ?auto_67168 ?auto_67174 ) ) ( not ( = ?auto_67169 ?auto_67174 ) ) ( not ( = ?auto_67170 ?auto_67174 ) ) ( not ( = ?auto_67171 ?auto_67174 ) ) ( not ( = ?auto_67172 ?auto_67174 ) ) ( not ( = ?auto_67173 ?auto_67174 ) ) ( ON ?auto_67172 ?auto_67173 ) ( ON-TABLE ?auto_67174 ) ( ON ?auto_67171 ?auto_67172 ) ( CLEAR ?auto_67171 ) ( HOLDING ?auto_67170 ) ( CLEAR ?auto_67169 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67167 ?auto_67168 ?auto_67169 ?auto_67170 )
      ( MAKE-7PILE ?auto_67167 ?auto_67168 ?auto_67169 ?auto_67170 ?auto_67171 ?auto_67172 ?auto_67173 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67175 - BLOCK
      ?auto_67176 - BLOCK
      ?auto_67177 - BLOCK
      ?auto_67178 - BLOCK
      ?auto_67179 - BLOCK
      ?auto_67180 - BLOCK
      ?auto_67181 - BLOCK
    )
    :vars
    (
      ?auto_67182 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67175 ) ( ON ?auto_67176 ?auto_67175 ) ( ON ?auto_67177 ?auto_67176 ) ( not ( = ?auto_67175 ?auto_67176 ) ) ( not ( = ?auto_67175 ?auto_67177 ) ) ( not ( = ?auto_67175 ?auto_67178 ) ) ( not ( = ?auto_67175 ?auto_67179 ) ) ( not ( = ?auto_67175 ?auto_67180 ) ) ( not ( = ?auto_67175 ?auto_67181 ) ) ( not ( = ?auto_67176 ?auto_67177 ) ) ( not ( = ?auto_67176 ?auto_67178 ) ) ( not ( = ?auto_67176 ?auto_67179 ) ) ( not ( = ?auto_67176 ?auto_67180 ) ) ( not ( = ?auto_67176 ?auto_67181 ) ) ( not ( = ?auto_67177 ?auto_67178 ) ) ( not ( = ?auto_67177 ?auto_67179 ) ) ( not ( = ?auto_67177 ?auto_67180 ) ) ( not ( = ?auto_67177 ?auto_67181 ) ) ( not ( = ?auto_67178 ?auto_67179 ) ) ( not ( = ?auto_67178 ?auto_67180 ) ) ( not ( = ?auto_67178 ?auto_67181 ) ) ( not ( = ?auto_67179 ?auto_67180 ) ) ( not ( = ?auto_67179 ?auto_67181 ) ) ( not ( = ?auto_67180 ?auto_67181 ) ) ( ON ?auto_67181 ?auto_67182 ) ( not ( = ?auto_67175 ?auto_67182 ) ) ( not ( = ?auto_67176 ?auto_67182 ) ) ( not ( = ?auto_67177 ?auto_67182 ) ) ( not ( = ?auto_67178 ?auto_67182 ) ) ( not ( = ?auto_67179 ?auto_67182 ) ) ( not ( = ?auto_67180 ?auto_67182 ) ) ( not ( = ?auto_67181 ?auto_67182 ) ) ( ON ?auto_67180 ?auto_67181 ) ( ON-TABLE ?auto_67182 ) ( ON ?auto_67179 ?auto_67180 ) ( CLEAR ?auto_67177 ) ( ON ?auto_67178 ?auto_67179 ) ( CLEAR ?auto_67178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67182 ?auto_67181 ?auto_67180 ?auto_67179 )
      ( MAKE-7PILE ?auto_67175 ?auto_67176 ?auto_67177 ?auto_67178 ?auto_67179 ?auto_67180 ?auto_67181 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67183 - BLOCK
      ?auto_67184 - BLOCK
      ?auto_67185 - BLOCK
      ?auto_67186 - BLOCK
      ?auto_67187 - BLOCK
      ?auto_67188 - BLOCK
      ?auto_67189 - BLOCK
    )
    :vars
    (
      ?auto_67190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67183 ) ( ON ?auto_67184 ?auto_67183 ) ( not ( = ?auto_67183 ?auto_67184 ) ) ( not ( = ?auto_67183 ?auto_67185 ) ) ( not ( = ?auto_67183 ?auto_67186 ) ) ( not ( = ?auto_67183 ?auto_67187 ) ) ( not ( = ?auto_67183 ?auto_67188 ) ) ( not ( = ?auto_67183 ?auto_67189 ) ) ( not ( = ?auto_67184 ?auto_67185 ) ) ( not ( = ?auto_67184 ?auto_67186 ) ) ( not ( = ?auto_67184 ?auto_67187 ) ) ( not ( = ?auto_67184 ?auto_67188 ) ) ( not ( = ?auto_67184 ?auto_67189 ) ) ( not ( = ?auto_67185 ?auto_67186 ) ) ( not ( = ?auto_67185 ?auto_67187 ) ) ( not ( = ?auto_67185 ?auto_67188 ) ) ( not ( = ?auto_67185 ?auto_67189 ) ) ( not ( = ?auto_67186 ?auto_67187 ) ) ( not ( = ?auto_67186 ?auto_67188 ) ) ( not ( = ?auto_67186 ?auto_67189 ) ) ( not ( = ?auto_67187 ?auto_67188 ) ) ( not ( = ?auto_67187 ?auto_67189 ) ) ( not ( = ?auto_67188 ?auto_67189 ) ) ( ON ?auto_67189 ?auto_67190 ) ( not ( = ?auto_67183 ?auto_67190 ) ) ( not ( = ?auto_67184 ?auto_67190 ) ) ( not ( = ?auto_67185 ?auto_67190 ) ) ( not ( = ?auto_67186 ?auto_67190 ) ) ( not ( = ?auto_67187 ?auto_67190 ) ) ( not ( = ?auto_67188 ?auto_67190 ) ) ( not ( = ?auto_67189 ?auto_67190 ) ) ( ON ?auto_67188 ?auto_67189 ) ( ON-TABLE ?auto_67190 ) ( ON ?auto_67187 ?auto_67188 ) ( ON ?auto_67186 ?auto_67187 ) ( CLEAR ?auto_67186 ) ( HOLDING ?auto_67185 ) ( CLEAR ?auto_67184 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67183 ?auto_67184 ?auto_67185 )
      ( MAKE-7PILE ?auto_67183 ?auto_67184 ?auto_67185 ?auto_67186 ?auto_67187 ?auto_67188 ?auto_67189 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67191 - BLOCK
      ?auto_67192 - BLOCK
      ?auto_67193 - BLOCK
      ?auto_67194 - BLOCK
      ?auto_67195 - BLOCK
      ?auto_67196 - BLOCK
      ?auto_67197 - BLOCK
    )
    :vars
    (
      ?auto_67198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67191 ) ( ON ?auto_67192 ?auto_67191 ) ( not ( = ?auto_67191 ?auto_67192 ) ) ( not ( = ?auto_67191 ?auto_67193 ) ) ( not ( = ?auto_67191 ?auto_67194 ) ) ( not ( = ?auto_67191 ?auto_67195 ) ) ( not ( = ?auto_67191 ?auto_67196 ) ) ( not ( = ?auto_67191 ?auto_67197 ) ) ( not ( = ?auto_67192 ?auto_67193 ) ) ( not ( = ?auto_67192 ?auto_67194 ) ) ( not ( = ?auto_67192 ?auto_67195 ) ) ( not ( = ?auto_67192 ?auto_67196 ) ) ( not ( = ?auto_67192 ?auto_67197 ) ) ( not ( = ?auto_67193 ?auto_67194 ) ) ( not ( = ?auto_67193 ?auto_67195 ) ) ( not ( = ?auto_67193 ?auto_67196 ) ) ( not ( = ?auto_67193 ?auto_67197 ) ) ( not ( = ?auto_67194 ?auto_67195 ) ) ( not ( = ?auto_67194 ?auto_67196 ) ) ( not ( = ?auto_67194 ?auto_67197 ) ) ( not ( = ?auto_67195 ?auto_67196 ) ) ( not ( = ?auto_67195 ?auto_67197 ) ) ( not ( = ?auto_67196 ?auto_67197 ) ) ( ON ?auto_67197 ?auto_67198 ) ( not ( = ?auto_67191 ?auto_67198 ) ) ( not ( = ?auto_67192 ?auto_67198 ) ) ( not ( = ?auto_67193 ?auto_67198 ) ) ( not ( = ?auto_67194 ?auto_67198 ) ) ( not ( = ?auto_67195 ?auto_67198 ) ) ( not ( = ?auto_67196 ?auto_67198 ) ) ( not ( = ?auto_67197 ?auto_67198 ) ) ( ON ?auto_67196 ?auto_67197 ) ( ON-TABLE ?auto_67198 ) ( ON ?auto_67195 ?auto_67196 ) ( ON ?auto_67194 ?auto_67195 ) ( CLEAR ?auto_67192 ) ( ON ?auto_67193 ?auto_67194 ) ( CLEAR ?auto_67193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67198 ?auto_67197 ?auto_67196 ?auto_67195 ?auto_67194 )
      ( MAKE-7PILE ?auto_67191 ?auto_67192 ?auto_67193 ?auto_67194 ?auto_67195 ?auto_67196 ?auto_67197 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67199 - BLOCK
      ?auto_67200 - BLOCK
      ?auto_67201 - BLOCK
      ?auto_67202 - BLOCK
      ?auto_67203 - BLOCK
      ?auto_67204 - BLOCK
      ?auto_67205 - BLOCK
    )
    :vars
    (
      ?auto_67206 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67199 ) ( not ( = ?auto_67199 ?auto_67200 ) ) ( not ( = ?auto_67199 ?auto_67201 ) ) ( not ( = ?auto_67199 ?auto_67202 ) ) ( not ( = ?auto_67199 ?auto_67203 ) ) ( not ( = ?auto_67199 ?auto_67204 ) ) ( not ( = ?auto_67199 ?auto_67205 ) ) ( not ( = ?auto_67200 ?auto_67201 ) ) ( not ( = ?auto_67200 ?auto_67202 ) ) ( not ( = ?auto_67200 ?auto_67203 ) ) ( not ( = ?auto_67200 ?auto_67204 ) ) ( not ( = ?auto_67200 ?auto_67205 ) ) ( not ( = ?auto_67201 ?auto_67202 ) ) ( not ( = ?auto_67201 ?auto_67203 ) ) ( not ( = ?auto_67201 ?auto_67204 ) ) ( not ( = ?auto_67201 ?auto_67205 ) ) ( not ( = ?auto_67202 ?auto_67203 ) ) ( not ( = ?auto_67202 ?auto_67204 ) ) ( not ( = ?auto_67202 ?auto_67205 ) ) ( not ( = ?auto_67203 ?auto_67204 ) ) ( not ( = ?auto_67203 ?auto_67205 ) ) ( not ( = ?auto_67204 ?auto_67205 ) ) ( ON ?auto_67205 ?auto_67206 ) ( not ( = ?auto_67199 ?auto_67206 ) ) ( not ( = ?auto_67200 ?auto_67206 ) ) ( not ( = ?auto_67201 ?auto_67206 ) ) ( not ( = ?auto_67202 ?auto_67206 ) ) ( not ( = ?auto_67203 ?auto_67206 ) ) ( not ( = ?auto_67204 ?auto_67206 ) ) ( not ( = ?auto_67205 ?auto_67206 ) ) ( ON ?auto_67204 ?auto_67205 ) ( ON-TABLE ?auto_67206 ) ( ON ?auto_67203 ?auto_67204 ) ( ON ?auto_67202 ?auto_67203 ) ( ON ?auto_67201 ?auto_67202 ) ( CLEAR ?auto_67201 ) ( HOLDING ?auto_67200 ) ( CLEAR ?auto_67199 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67199 ?auto_67200 )
      ( MAKE-7PILE ?auto_67199 ?auto_67200 ?auto_67201 ?auto_67202 ?auto_67203 ?auto_67204 ?auto_67205 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67207 - BLOCK
      ?auto_67208 - BLOCK
      ?auto_67209 - BLOCK
      ?auto_67210 - BLOCK
      ?auto_67211 - BLOCK
      ?auto_67212 - BLOCK
      ?auto_67213 - BLOCK
    )
    :vars
    (
      ?auto_67214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67207 ) ( not ( = ?auto_67207 ?auto_67208 ) ) ( not ( = ?auto_67207 ?auto_67209 ) ) ( not ( = ?auto_67207 ?auto_67210 ) ) ( not ( = ?auto_67207 ?auto_67211 ) ) ( not ( = ?auto_67207 ?auto_67212 ) ) ( not ( = ?auto_67207 ?auto_67213 ) ) ( not ( = ?auto_67208 ?auto_67209 ) ) ( not ( = ?auto_67208 ?auto_67210 ) ) ( not ( = ?auto_67208 ?auto_67211 ) ) ( not ( = ?auto_67208 ?auto_67212 ) ) ( not ( = ?auto_67208 ?auto_67213 ) ) ( not ( = ?auto_67209 ?auto_67210 ) ) ( not ( = ?auto_67209 ?auto_67211 ) ) ( not ( = ?auto_67209 ?auto_67212 ) ) ( not ( = ?auto_67209 ?auto_67213 ) ) ( not ( = ?auto_67210 ?auto_67211 ) ) ( not ( = ?auto_67210 ?auto_67212 ) ) ( not ( = ?auto_67210 ?auto_67213 ) ) ( not ( = ?auto_67211 ?auto_67212 ) ) ( not ( = ?auto_67211 ?auto_67213 ) ) ( not ( = ?auto_67212 ?auto_67213 ) ) ( ON ?auto_67213 ?auto_67214 ) ( not ( = ?auto_67207 ?auto_67214 ) ) ( not ( = ?auto_67208 ?auto_67214 ) ) ( not ( = ?auto_67209 ?auto_67214 ) ) ( not ( = ?auto_67210 ?auto_67214 ) ) ( not ( = ?auto_67211 ?auto_67214 ) ) ( not ( = ?auto_67212 ?auto_67214 ) ) ( not ( = ?auto_67213 ?auto_67214 ) ) ( ON ?auto_67212 ?auto_67213 ) ( ON-TABLE ?auto_67214 ) ( ON ?auto_67211 ?auto_67212 ) ( ON ?auto_67210 ?auto_67211 ) ( ON ?auto_67209 ?auto_67210 ) ( CLEAR ?auto_67207 ) ( ON ?auto_67208 ?auto_67209 ) ( CLEAR ?auto_67208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67214 ?auto_67213 ?auto_67212 ?auto_67211 ?auto_67210 ?auto_67209 )
      ( MAKE-7PILE ?auto_67207 ?auto_67208 ?auto_67209 ?auto_67210 ?auto_67211 ?auto_67212 ?auto_67213 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67215 - BLOCK
      ?auto_67216 - BLOCK
      ?auto_67217 - BLOCK
      ?auto_67218 - BLOCK
      ?auto_67219 - BLOCK
      ?auto_67220 - BLOCK
      ?auto_67221 - BLOCK
    )
    :vars
    (
      ?auto_67222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67215 ?auto_67216 ) ) ( not ( = ?auto_67215 ?auto_67217 ) ) ( not ( = ?auto_67215 ?auto_67218 ) ) ( not ( = ?auto_67215 ?auto_67219 ) ) ( not ( = ?auto_67215 ?auto_67220 ) ) ( not ( = ?auto_67215 ?auto_67221 ) ) ( not ( = ?auto_67216 ?auto_67217 ) ) ( not ( = ?auto_67216 ?auto_67218 ) ) ( not ( = ?auto_67216 ?auto_67219 ) ) ( not ( = ?auto_67216 ?auto_67220 ) ) ( not ( = ?auto_67216 ?auto_67221 ) ) ( not ( = ?auto_67217 ?auto_67218 ) ) ( not ( = ?auto_67217 ?auto_67219 ) ) ( not ( = ?auto_67217 ?auto_67220 ) ) ( not ( = ?auto_67217 ?auto_67221 ) ) ( not ( = ?auto_67218 ?auto_67219 ) ) ( not ( = ?auto_67218 ?auto_67220 ) ) ( not ( = ?auto_67218 ?auto_67221 ) ) ( not ( = ?auto_67219 ?auto_67220 ) ) ( not ( = ?auto_67219 ?auto_67221 ) ) ( not ( = ?auto_67220 ?auto_67221 ) ) ( ON ?auto_67221 ?auto_67222 ) ( not ( = ?auto_67215 ?auto_67222 ) ) ( not ( = ?auto_67216 ?auto_67222 ) ) ( not ( = ?auto_67217 ?auto_67222 ) ) ( not ( = ?auto_67218 ?auto_67222 ) ) ( not ( = ?auto_67219 ?auto_67222 ) ) ( not ( = ?auto_67220 ?auto_67222 ) ) ( not ( = ?auto_67221 ?auto_67222 ) ) ( ON ?auto_67220 ?auto_67221 ) ( ON-TABLE ?auto_67222 ) ( ON ?auto_67219 ?auto_67220 ) ( ON ?auto_67218 ?auto_67219 ) ( ON ?auto_67217 ?auto_67218 ) ( ON ?auto_67216 ?auto_67217 ) ( CLEAR ?auto_67216 ) ( HOLDING ?auto_67215 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67215 )
      ( MAKE-7PILE ?auto_67215 ?auto_67216 ?auto_67217 ?auto_67218 ?auto_67219 ?auto_67220 ?auto_67221 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67223 - BLOCK
      ?auto_67224 - BLOCK
      ?auto_67225 - BLOCK
      ?auto_67226 - BLOCK
      ?auto_67227 - BLOCK
      ?auto_67228 - BLOCK
      ?auto_67229 - BLOCK
    )
    :vars
    (
      ?auto_67230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67223 ?auto_67224 ) ) ( not ( = ?auto_67223 ?auto_67225 ) ) ( not ( = ?auto_67223 ?auto_67226 ) ) ( not ( = ?auto_67223 ?auto_67227 ) ) ( not ( = ?auto_67223 ?auto_67228 ) ) ( not ( = ?auto_67223 ?auto_67229 ) ) ( not ( = ?auto_67224 ?auto_67225 ) ) ( not ( = ?auto_67224 ?auto_67226 ) ) ( not ( = ?auto_67224 ?auto_67227 ) ) ( not ( = ?auto_67224 ?auto_67228 ) ) ( not ( = ?auto_67224 ?auto_67229 ) ) ( not ( = ?auto_67225 ?auto_67226 ) ) ( not ( = ?auto_67225 ?auto_67227 ) ) ( not ( = ?auto_67225 ?auto_67228 ) ) ( not ( = ?auto_67225 ?auto_67229 ) ) ( not ( = ?auto_67226 ?auto_67227 ) ) ( not ( = ?auto_67226 ?auto_67228 ) ) ( not ( = ?auto_67226 ?auto_67229 ) ) ( not ( = ?auto_67227 ?auto_67228 ) ) ( not ( = ?auto_67227 ?auto_67229 ) ) ( not ( = ?auto_67228 ?auto_67229 ) ) ( ON ?auto_67229 ?auto_67230 ) ( not ( = ?auto_67223 ?auto_67230 ) ) ( not ( = ?auto_67224 ?auto_67230 ) ) ( not ( = ?auto_67225 ?auto_67230 ) ) ( not ( = ?auto_67226 ?auto_67230 ) ) ( not ( = ?auto_67227 ?auto_67230 ) ) ( not ( = ?auto_67228 ?auto_67230 ) ) ( not ( = ?auto_67229 ?auto_67230 ) ) ( ON ?auto_67228 ?auto_67229 ) ( ON-TABLE ?auto_67230 ) ( ON ?auto_67227 ?auto_67228 ) ( ON ?auto_67226 ?auto_67227 ) ( ON ?auto_67225 ?auto_67226 ) ( ON ?auto_67224 ?auto_67225 ) ( ON ?auto_67223 ?auto_67224 ) ( CLEAR ?auto_67223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_67230 ?auto_67229 ?auto_67228 ?auto_67227 ?auto_67226 ?auto_67225 ?auto_67224 )
      ( MAKE-7PILE ?auto_67223 ?auto_67224 ?auto_67225 ?auto_67226 ?auto_67227 ?auto_67228 ?auto_67229 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67337 - BLOCK
    )
    :vars
    (
      ?auto_67338 - BLOCK
      ?auto_67339 - BLOCK
      ?auto_67340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67337 ?auto_67338 ) ( CLEAR ?auto_67337 ) ( not ( = ?auto_67337 ?auto_67338 ) ) ( HOLDING ?auto_67339 ) ( CLEAR ?auto_67340 ) ( not ( = ?auto_67337 ?auto_67339 ) ) ( not ( = ?auto_67337 ?auto_67340 ) ) ( not ( = ?auto_67338 ?auto_67339 ) ) ( not ( = ?auto_67338 ?auto_67340 ) ) ( not ( = ?auto_67339 ?auto_67340 ) ) )
    :subtasks
    ( ( !STACK ?auto_67339 ?auto_67340 )
      ( MAKE-1PILE ?auto_67337 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67341 - BLOCK
    )
    :vars
    (
      ?auto_67342 - BLOCK
      ?auto_67344 - BLOCK
      ?auto_67343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67341 ?auto_67342 ) ( not ( = ?auto_67341 ?auto_67342 ) ) ( CLEAR ?auto_67344 ) ( not ( = ?auto_67341 ?auto_67343 ) ) ( not ( = ?auto_67341 ?auto_67344 ) ) ( not ( = ?auto_67342 ?auto_67343 ) ) ( not ( = ?auto_67342 ?auto_67344 ) ) ( not ( = ?auto_67343 ?auto_67344 ) ) ( ON ?auto_67343 ?auto_67341 ) ( CLEAR ?auto_67343 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67342 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67342 ?auto_67341 )
      ( MAKE-1PILE ?auto_67341 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67345 - BLOCK
    )
    :vars
    (
      ?auto_67348 - BLOCK
      ?auto_67346 - BLOCK
      ?auto_67347 - BLOCK
      ?auto_67352 - BLOCK
      ?auto_67349 - BLOCK
      ?auto_67350 - BLOCK
      ?auto_67351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67345 ?auto_67348 ) ( not ( = ?auto_67345 ?auto_67348 ) ) ( not ( = ?auto_67345 ?auto_67346 ) ) ( not ( = ?auto_67345 ?auto_67347 ) ) ( not ( = ?auto_67348 ?auto_67346 ) ) ( not ( = ?auto_67348 ?auto_67347 ) ) ( not ( = ?auto_67346 ?auto_67347 ) ) ( ON ?auto_67346 ?auto_67345 ) ( CLEAR ?auto_67346 ) ( ON-TABLE ?auto_67348 ) ( HOLDING ?auto_67347 ) ( CLEAR ?auto_67352 ) ( ON-TABLE ?auto_67349 ) ( ON ?auto_67350 ?auto_67349 ) ( ON ?auto_67351 ?auto_67350 ) ( ON ?auto_67352 ?auto_67351 ) ( not ( = ?auto_67349 ?auto_67350 ) ) ( not ( = ?auto_67349 ?auto_67351 ) ) ( not ( = ?auto_67349 ?auto_67352 ) ) ( not ( = ?auto_67349 ?auto_67347 ) ) ( not ( = ?auto_67350 ?auto_67351 ) ) ( not ( = ?auto_67350 ?auto_67352 ) ) ( not ( = ?auto_67350 ?auto_67347 ) ) ( not ( = ?auto_67351 ?auto_67352 ) ) ( not ( = ?auto_67351 ?auto_67347 ) ) ( not ( = ?auto_67352 ?auto_67347 ) ) ( not ( = ?auto_67345 ?auto_67352 ) ) ( not ( = ?auto_67345 ?auto_67349 ) ) ( not ( = ?auto_67345 ?auto_67350 ) ) ( not ( = ?auto_67345 ?auto_67351 ) ) ( not ( = ?auto_67348 ?auto_67352 ) ) ( not ( = ?auto_67348 ?auto_67349 ) ) ( not ( = ?auto_67348 ?auto_67350 ) ) ( not ( = ?auto_67348 ?auto_67351 ) ) ( not ( = ?auto_67346 ?auto_67352 ) ) ( not ( = ?auto_67346 ?auto_67349 ) ) ( not ( = ?auto_67346 ?auto_67350 ) ) ( not ( = ?auto_67346 ?auto_67351 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67349 ?auto_67350 ?auto_67351 ?auto_67352 ?auto_67347 )
      ( MAKE-1PILE ?auto_67345 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67353 - BLOCK
    )
    :vars
    (
      ?auto_67359 - BLOCK
      ?auto_67357 - BLOCK
      ?auto_67360 - BLOCK
      ?auto_67358 - BLOCK
      ?auto_67354 - BLOCK
      ?auto_67355 - BLOCK
      ?auto_67356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67353 ?auto_67359 ) ( not ( = ?auto_67353 ?auto_67359 ) ) ( not ( = ?auto_67353 ?auto_67357 ) ) ( not ( = ?auto_67353 ?auto_67360 ) ) ( not ( = ?auto_67359 ?auto_67357 ) ) ( not ( = ?auto_67359 ?auto_67360 ) ) ( not ( = ?auto_67357 ?auto_67360 ) ) ( ON ?auto_67357 ?auto_67353 ) ( ON-TABLE ?auto_67359 ) ( CLEAR ?auto_67358 ) ( ON-TABLE ?auto_67354 ) ( ON ?auto_67355 ?auto_67354 ) ( ON ?auto_67356 ?auto_67355 ) ( ON ?auto_67358 ?auto_67356 ) ( not ( = ?auto_67354 ?auto_67355 ) ) ( not ( = ?auto_67354 ?auto_67356 ) ) ( not ( = ?auto_67354 ?auto_67358 ) ) ( not ( = ?auto_67354 ?auto_67360 ) ) ( not ( = ?auto_67355 ?auto_67356 ) ) ( not ( = ?auto_67355 ?auto_67358 ) ) ( not ( = ?auto_67355 ?auto_67360 ) ) ( not ( = ?auto_67356 ?auto_67358 ) ) ( not ( = ?auto_67356 ?auto_67360 ) ) ( not ( = ?auto_67358 ?auto_67360 ) ) ( not ( = ?auto_67353 ?auto_67358 ) ) ( not ( = ?auto_67353 ?auto_67354 ) ) ( not ( = ?auto_67353 ?auto_67355 ) ) ( not ( = ?auto_67353 ?auto_67356 ) ) ( not ( = ?auto_67359 ?auto_67358 ) ) ( not ( = ?auto_67359 ?auto_67354 ) ) ( not ( = ?auto_67359 ?auto_67355 ) ) ( not ( = ?auto_67359 ?auto_67356 ) ) ( not ( = ?auto_67357 ?auto_67358 ) ) ( not ( = ?auto_67357 ?auto_67354 ) ) ( not ( = ?auto_67357 ?auto_67355 ) ) ( not ( = ?auto_67357 ?auto_67356 ) ) ( ON ?auto_67360 ?auto_67357 ) ( CLEAR ?auto_67360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67359 ?auto_67353 ?auto_67357 )
      ( MAKE-1PILE ?auto_67353 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67361 - BLOCK
    )
    :vars
    (
      ?auto_67368 - BLOCK
      ?auto_67367 - BLOCK
      ?auto_67364 - BLOCK
      ?auto_67363 - BLOCK
      ?auto_67362 - BLOCK
      ?auto_67365 - BLOCK
      ?auto_67366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67361 ?auto_67368 ) ( not ( = ?auto_67361 ?auto_67368 ) ) ( not ( = ?auto_67361 ?auto_67367 ) ) ( not ( = ?auto_67361 ?auto_67364 ) ) ( not ( = ?auto_67368 ?auto_67367 ) ) ( not ( = ?auto_67368 ?auto_67364 ) ) ( not ( = ?auto_67367 ?auto_67364 ) ) ( ON ?auto_67367 ?auto_67361 ) ( ON-TABLE ?auto_67368 ) ( ON-TABLE ?auto_67363 ) ( ON ?auto_67362 ?auto_67363 ) ( ON ?auto_67365 ?auto_67362 ) ( not ( = ?auto_67363 ?auto_67362 ) ) ( not ( = ?auto_67363 ?auto_67365 ) ) ( not ( = ?auto_67363 ?auto_67366 ) ) ( not ( = ?auto_67363 ?auto_67364 ) ) ( not ( = ?auto_67362 ?auto_67365 ) ) ( not ( = ?auto_67362 ?auto_67366 ) ) ( not ( = ?auto_67362 ?auto_67364 ) ) ( not ( = ?auto_67365 ?auto_67366 ) ) ( not ( = ?auto_67365 ?auto_67364 ) ) ( not ( = ?auto_67366 ?auto_67364 ) ) ( not ( = ?auto_67361 ?auto_67366 ) ) ( not ( = ?auto_67361 ?auto_67363 ) ) ( not ( = ?auto_67361 ?auto_67362 ) ) ( not ( = ?auto_67361 ?auto_67365 ) ) ( not ( = ?auto_67368 ?auto_67366 ) ) ( not ( = ?auto_67368 ?auto_67363 ) ) ( not ( = ?auto_67368 ?auto_67362 ) ) ( not ( = ?auto_67368 ?auto_67365 ) ) ( not ( = ?auto_67367 ?auto_67366 ) ) ( not ( = ?auto_67367 ?auto_67363 ) ) ( not ( = ?auto_67367 ?auto_67362 ) ) ( not ( = ?auto_67367 ?auto_67365 ) ) ( ON ?auto_67364 ?auto_67367 ) ( CLEAR ?auto_67364 ) ( HOLDING ?auto_67366 ) ( CLEAR ?auto_67365 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67363 ?auto_67362 ?auto_67365 ?auto_67366 )
      ( MAKE-1PILE ?auto_67361 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67369 - BLOCK
    )
    :vars
    (
      ?auto_67370 - BLOCK
      ?auto_67375 - BLOCK
      ?auto_67376 - BLOCK
      ?auto_67374 - BLOCK
      ?auto_67373 - BLOCK
      ?auto_67372 - BLOCK
      ?auto_67371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67369 ?auto_67370 ) ( not ( = ?auto_67369 ?auto_67370 ) ) ( not ( = ?auto_67369 ?auto_67375 ) ) ( not ( = ?auto_67369 ?auto_67376 ) ) ( not ( = ?auto_67370 ?auto_67375 ) ) ( not ( = ?auto_67370 ?auto_67376 ) ) ( not ( = ?auto_67375 ?auto_67376 ) ) ( ON ?auto_67375 ?auto_67369 ) ( ON-TABLE ?auto_67370 ) ( ON-TABLE ?auto_67374 ) ( ON ?auto_67373 ?auto_67374 ) ( ON ?auto_67372 ?auto_67373 ) ( not ( = ?auto_67374 ?auto_67373 ) ) ( not ( = ?auto_67374 ?auto_67372 ) ) ( not ( = ?auto_67374 ?auto_67371 ) ) ( not ( = ?auto_67374 ?auto_67376 ) ) ( not ( = ?auto_67373 ?auto_67372 ) ) ( not ( = ?auto_67373 ?auto_67371 ) ) ( not ( = ?auto_67373 ?auto_67376 ) ) ( not ( = ?auto_67372 ?auto_67371 ) ) ( not ( = ?auto_67372 ?auto_67376 ) ) ( not ( = ?auto_67371 ?auto_67376 ) ) ( not ( = ?auto_67369 ?auto_67371 ) ) ( not ( = ?auto_67369 ?auto_67374 ) ) ( not ( = ?auto_67369 ?auto_67373 ) ) ( not ( = ?auto_67369 ?auto_67372 ) ) ( not ( = ?auto_67370 ?auto_67371 ) ) ( not ( = ?auto_67370 ?auto_67374 ) ) ( not ( = ?auto_67370 ?auto_67373 ) ) ( not ( = ?auto_67370 ?auto_67372 ) ) ( not ( = ?auto_67375 ?auto_67371 ) ) ( not ( = ?auto_67375 ?auto_67374 ) ) ( not ( = ?auto_67375 ?auto_67373 ) ) ( not ( = ?auto_67375 ?auto_67372 ) ) ( ON ?auto_67376 ?auto_67375 ) ( CLEAR ?auto_67372 ) ( ON ?auto_67371 ?auto_67376 ) ( CLEAR ?auto_67371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67370 ?auto_67369 ?auto_67375 ?auto_67376 )
      ( MAKE-1PILE ?auto_67369 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67377 - BLOCK
    )
    :vars
    (
      ?auto_67380 - BLOCK
      ?auto_67383 - BLOCK
      ?auto_67382 - BLOCK
      ?auto_67381 - BLOCK
      ?auto_67378 - BLOCK
      ?auto_67379 - BLOCK
      ?auto_67384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67377 ?auto_67380 ) ( not ( = ?auto_67377 ?auto_67380 ) ) ( not ( = ?auto_67377 ?auto_67383 ) ) ( not ( = ?auto_67377 ?auto_67382 ) ) ( not ( = ?auto_67380 ?auto_67383 ) ) ( not ( = ?auto_67380 ?auto_67382 ) ) ( not ( = ?auto_67383 ?auto_67382 ) ) ( ON ?auto_67383 ?auto_67377 ) ( ON-TABLE ?auto_67380 ) ( ON-TABLE ?auto_67381 ) ( ON ?auto_67378 ?auto_67381 ) ( not ( = ?auto_67381 ?auto_67378 ) ) ( not ( = ?auto_67381 ?auto_67379 ) ) ( not ( = ?auto_67381 ?auto_67384 ) ) ( not ( = ?auto_67381 ?auto_67382 ) ) ( not ( = ?auto_67378 ?auto_67379 ) ) ( not ( = ?auto_67378 ?auto_67384 ) ) ( not ( = ?auto_67378 ?auto_67382 ) ) ( not ( = ?auto_67379 ?auto_67384 ) ) ( not ( = ?auto_67379 ?auto_67382 ) ) ( not ( = ?auto_67384 ?auto_67382 ) ) ( not ( = ?auto_67377 ?auto_67384 ) ) ( not ( = ?auto_67377 ?auto_67381 ) ) ( not ( = ?auto_67377 ?auto_67378 ) ) ( not ( = ?auto_67377 ?auto_67379 ) ) ( not ( = ?auto_67380 ?auto_67384 ) ) ( not ( = ?auto_67380 ?auto_67381 ) ) ( not ( = ?auto_67380 ?auto_67378 ) ) ( not ( = ?auto_67380 ?auto_67379 ) ) ( not ( = ?auto_67383 ?auto_67384 ) ) ( not ( = ?auto_67383 ?auto_67381 ) ) ( not ( = ?auto_67383 ?auto_67378 ) ) ( not ( = ?auto_67383 ?auto_67379 ) ) ( ON ?auto_67382 ?auto_67383 ) ( ON ?auto_67384 ?auto_67382 ) ( CLEAR ?auto_67384 ) ( HOLDING ?auto_67379 ) ( CLEAR ?auto_67378 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67381 ?auto_67378 ?auto_67379 )
      ( MAKE-1PILE ?auto_67377 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67385 - BLOCK
    )
    :vars
    (
      ?auto_67391 - BLOCK
      ?auto_67392 - BLOCK
      ?auto_67387 - BLOCK
      ?auto_67388 - BLOCK
      ?auto_67389 - BLOCK
      ?auto_67386 - BLOCK
      ?auto_67390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67385 ?auto_67391 ) ( not ( = ?auto_67385 ?auto_67391 ) ) ( not ( = ?auto_67385 ?auto_67392 ) ) ( not ( = ?auto_67385 ?auto_67387 ) ) ( not ( = ?auto_67391 ?auto_67392 ) ) ( not ( = ?auto_67391 ?auto_67387 ) ) ( not ( = ?auto_67392 ?auto_67387 ) ) ( ON ?auto_67392 ?auto_67385 ) ( ON-TABLE ?auto_67391 ) ( ON-TABLE ?auto_67388 ) ( ON ?auto_67389 ?auto_67388 ) ( not ( = ?auto_67388 ?auto_67389 ) ) ( not ( = ?auto_67388 ?auto_67386 ) ) ( not ( = ?auto_67388 ?auto_67390 ) ) ( not ( = ?auto_67388 ?auto_67387 ) ) ( not ( = ?auto_67389 ?auto_67386 ) ) ( not ( = ?auto_67389 ?auto_67390 ) ) ( not ( = ?auto_67389 ?auto_67387 ) ) ( not ( = ?auto_67386 ?auto_67390 ) ) ( not ( = ?auto_67386 ?auto_67387 ) ) ( not ( = ?auto_67390 ?auto_67387 ) ) ( not ( = ?auto_67385 ?auto_67390 ) ) ( not ( = ?auto_67385 ?auto_67388 ) ) ( not ( = ?auto_67385 ?auto_67389 ) ) ( not ( = ?auto_67385 ?auto_67386 ) ) ( not ( = ?auto_67391 ?auto_67390 ) ) ( not ( = ?auto_67391 ?auto_67388 ) ) ( not ( = ?auto_67391 ?auto_67389 ) ) ( not ( = ?auto_67391 ?auto_67386 ) ) ( not ( = ?auto_67392 ?auto_67390 ) ) ( not ( = ?auto_67392 ?auto_67388 ) ) ( not ( = ?auto_67392 ?auto_67389 ) ) ( not ( = ?auto_67392 ?auto_67386 ) ) ( ON ?auto_67387 ?auto_67392 ) ( ON ?auto_67390 ?auto_67387 ) ( CLEAR ?auto_67389 ) ( ON ?auto_67386 ?auto_67390 ) ( CLEAR ?auto_67386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67391 ?auto_67385 ?auto_67392 ?auto_67387 ?auto_67390 )
      ( MAKE-1PILE ?auto_67385 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67393 - BLOCK
    )
    :vars
    (
      ?auto_67400 - BLOCK
      ?auto_67399 - BLOCK
      ?auto_67397 - BLOCK
      ?auto_67398 - BLOCK
      ?auto_67394 - BLOCK
      ?auto_67395 - BLOCK
      ?auto_67396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67393 ?auto_67400 ) ( not ( = ?auto_67393 ?auto_67400 ) ) ( not ( = ?auto_67393 ?auto_67399 ) ) ( not ( = ?auto_67393 ?auto_67397 ) ) ( not ( = ?auto_67400 ?auto_67399 ) ) ( not ( = ?auto_67400 ?auto_67397 ) ) ( not ( = ?auto_67399 ?auto_67397 ) ) ( ON ?auto_67399 ?auto_67393 ) ( ON-TABLE ?auto_67400 ) ( ON-TABLE ?auto_67398 ) ( not ( = ?auto_67398 ?auto_67394 ) ) ( not ( = ?auto_67398 ?auto_67395 ) ) ( not ( = ?auto_67398 ?auto_67396 ) ) ( not ( = ?auto_67398 ?auto_67397 ) ) ( not ( = ?auto_67394 ?auto_67395 ) ) ( not ( = ?auto_67394 ?auto_67396 ) ) ( not ( = ?auto_67394 ?auto_67397 ) ) ( not ( = ?auto_67395 ?auto_67396 ) ) ( not ( = ?auto_67395 ?auto_67397 ) ) ( not ( = ?auto_67396 ?auto_67397 ) ) ( not ( = ?auto_67393 ?auto_67396 ) ) ( not ( = ?auto_67393 ?auto_67398 ) ) ( not ( = ?auto_67393 ?auto_67394 ) ) ( not ( = ?auto_67393 ?auto_67395 ) ) ( not ( = ?auto_67400 ?auto_67396 ) ) ( not ( = ?auto_67400 ?auto_67398 ) ) ( not ( = ?auto_67400 ?auto_67394 ) ) ( not ( = ?auto_67400 ?auto_67395 ) ) ( not ( = ?auto_67399 ?auto_67396 ) ) ( not ( = ?auto_67399 ?auto_67398 ) ) ( not ( = ?auto_67399 ?auto_67394 ) ) ( not ( = ?auto_67399 ?auto_67395 ) ) ( ON ?auto_67397 ?auto_67399 ) ( ON ?auto_67396 ?auto_67397 ) ( ON ?auto_67395 ?auto_67396 ) ( CLEAR ?auto_67395 ) ( HOLDING ?auto_67394 ) ( CLEAR ?auto_67398 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67398 ?auto_67394 )
      ( MAKE-1PILE ?auto_67393 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67401 - BLOCK
    )
    :vars
    (
      ?auto_67405 - BLOCK
      ?auto_67407 - BLOCK
      ?auto_67404 - BLOCK
      ?auto_67402 - BLOCK
      ?auto_67403 - BLOCK
      ?auto_67406 - BLOCK
      ?auto_67408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67401 ?auto_67405 ) ( not ( = ?auto_67401 ?auto_67405 ) ) ( not ( = ?auto_67401 ?auto_67407 ) ) ( not ( = ?auto_67401 ?auto_67404 ) ) ( not ( = ?auto_67405 ?auto_67407 ) ) ( not ( = ?auto_67405 ?auto_67404 ) ) ( not ( = ?auto_67407 ?auto_67404 ) ) ( ON ?auto_67407 ?auto_67401 ) ( ON-TABLE ?auto_67405 ) ( ON-TABLE ?auto_67402 ) ( not ( = ?auto_67402 ?auto_67403 ) ) ( not ( = ?auto_67402 ?auto_67406 ) ) ( not ( = ?auto_67402 ?auto_67408 ) ) ( not ( = ?auto_67402 ?auto_67404 ) ) ( not ( = ?auto_67403 ?auto_67406 ) ) ( not ( = ?auto_67403 ?auto_67408 ) ) ( not ( = ?auto_67403 ?auto_67404 ) ) ( not ( = ?auto_67406 ?auto_67408 ) ) ( not ( = ?auto_67406 ?auto_67404 ) ) ( not ( = ?auto_67408 ?auto_67404 ) ) ( not ( = ?auto_67401 ?auto_67408 ) ) ( not ( = ?auto_67401 ?auto_67402 ) ) ( not ( = ?auto_67401 ?auto_67403 ) ) ( not ( = ?auto_67401 ?auto_67406 ) ) ( not ( = ?auto_67405 ?auto_67408 ) ) ( not ( = ?auto_67405 ?auto_67402 ) ) ( not ( = ?auto_67405 ?auto_67403 ) ) ( not ( = ?auto_67405 ?auto_67406 ) ) ( not ( = ?auto_67407 ?auto_67408 ) ) ( not ( = ?auto_67407 ?auto_67402 ) ) ( not ( = ?auto_67407 ?auto_67403 ) ) ( not ( = ?auto_67407 ?auto_67406 ) ) ( ON ?auto_67404 ?auto_67407 ) ( ON ?auto_67408 ?auto_67404 ) ( ON ?auto_67406 ?auto_67408 ) ( CLEAR ?auto_67402 ) ( ON ?auto_67403 ?auto_67406 ) ( CLEAR ?auto_67403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67405 ?auto_67401 ?auto_67407 ?auto_67404 ?auto_67408 ?auto_67406 )
      ( MAKE-1PILE ?auto_67401 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67409 - BLOCK
    )
    :vars
    (
      ?auto_67416 - BLOCK
      ?auto_67410 - BLOCK
      ?auto_67415 - BLOCK
      ?auto_67411 - BLOCK
      ?auto_67412 - BLOCK
      ?auto_67414 - BLOCK
      ?auto_67413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67409 ?auto_67416 ) ( not ( = ?auto_67409 ?auto_67416 ) ) ( not ( = ?auto_67409 ?auto_67410 ) ) ( not ( = ?auto_67409 ?auto_67415 ) ) ( not ( = ?auto_67416 ?auto_67410 ) ) ( not ( = ?auto_67416 ?auto_67415 ) ) ( not ( = ?auto_67410 ?auto_67415 ) ) ( ON ?auto_67410 ?auto_67409 ) ( ON-TABLE ?auto_67416 ) ( not ( = ?auto_67411 ?auto_67412 ) ) ( not ( = ?auto_67411 ?auto_67414 ) ) ( not ( = ?auto_67411 ?auto_67413 ) ) ( not ( = ?auto_67411 ?auto_67415 ) ) ( not ( = ?auto_67412 ?auto_67414 ) ) ( not ( = ?auto_67412 ?auto_67413 ) ) ( not ( = ?auto_67412 ?auto_67415 ) ) ( not ( = ?auto_67414 ?auto_67413 ) ) ( not ( = ?auto_67414 ?auto_67415 ) ) ( not ( = ?auto_67413 ?auto_67415 ) ) ( not ( = ?auto_67409 ?auto_67413 ) ) ( not ( = ?auto_67409 ?auto_67411 ) ) ( not ( = ?auto_67409 ?auto_67412 ) ) ( not ( = ?auto_67409 ?auto_67414 ) ) ( not ( = ?auto_67416 ?auto_67413 ) ) ( not ( = ?auto_67416 ?auto_67411 ) ) ( not ( = ?auto_67416 ?auto_67412 ) ) ( not ( = ?auto_67416 ?auto_67414 ) ) ( not ( = ?auto_67410 ?auto_67413 ) ) ( not ( = ?auto_67410 ?auto_67411 ) ) ( not ( = ?auto_67410 ?auto_67412 ) ) ( not ( = ?auto_67410 ?auto_67414 ) ) ( ON ?auto_67415 ?auto_67410 ) ( ON ?auto_67413 ?auto_67415 ) ( ON ?auto_67414 ?auto_67413 ) ( ON ?auto_67412 ?auto_67414 ) ( CLEAR ?auto_67412 ) ( HOLDING ?auto_67411 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67411 )
      ( MAKE-1PILE ?auto_67409 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67417 - BLOCK
    )
    :vars
    (
      ?auto_67418 - BLOCK
      ?auto_67423 - BLOCK
      ?auto_67420 - BLOCK
      ?auto_67419 - BLOCK
      ?auto_67424 - BLOCK
      ?auto_67421 - BLOCK
      ?auto_67422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67417 ?auto_67418 ) ( not ( = ?auto_67417 ?auto_67418 ) ) ( not ( = ?auto_67417 ?auto_67423 ) ) ( not ( = ?auto_67417 ?auto_67420 ) ) ( not ( = ?auto_67418 ?auto_67423 ) ) ( not ( = ?auto_67418 ?auto_67420 ) ) ( not ( = ?auto_67423 ?auto_67420 ) ) ( ON ?auto_67423 ?auto_67417 ) ( ON-TABLE ?auto_67418 ) ( not ( = ?auto_67419 ?auto_67424 ) ) ( not ( = ?auto_67419 ?auto_67421 ) ) ( not ( = ?auto_67419 ?auto_67422 ) ) ( not ( = ?auto_67419 ?auto_67420 ) ) ( not ( = ?auto_67424 ?auto_67421 ) ) ( not ( = ?auto_67424 ?auto_67422 ) ) ( not ( = ?auto_67424 ?auto_67420 ) ) ( not ( = ?auto_67421 ?auto_67422 ) ) ( not ( = ?auto_67421 ?auto_67420 ) ) ( not ( = ?auto_67422 ?auto_67420 ) ) ( not ( = ?auto_67417 ?auto_67422 ) ) ( not ( = ?auto_67417 ?auto_67419 ) ) ( not ( = ?auto_67417 ?auto_67424 ) ) ( not ( = ?auto_67417 ?auto_67421 ) ) ( not ( = ?auto_67418 ?auto_67422 ) ) ( not ( = ?auto_67418 ?auto_67419 ) ) ( not ( = ?auto_67418 ?auto_67424 ) ) ( not ( = ?auto_67418 ?auto_67421 ) ) ( not ( = ?auto_67423 ?auto_67422 ) ) ( not ( = ?auto_67423 ?auto_67419 ) ) ( not ( = ?auto_67423 ?auto_67424 ) ) ( not ( = ?auto_67423 ?auto_67421 ) ) ( ON ?auto_67420 ?auto_67423 ) ( ON ?auto_67422 ?auto_67420 ) ( ON ?auto_67421 ?auto_67422 ) ( ON ?auto_67424 ?auto_67421 ) ( ON ?auto_67419 ?auto_67424 ) ( CLEAR ?auto_67419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_67418 ?auto_67417 ?auto_67423 ?auto_67420 ?auto_67422 ?auto_67421 ?auto_67424 )
      ( MAKE-1PILE ?auto_67417 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67436 - BLOCK
      ?auto_67437 - BLOCK
      ?auto_67438 - BLOCK
      ?auto_67439 - BLOCK
      ?auto_67440 - BLOCK
    )
    :vars
    (
      ?auto_67441 - BLOCK
      ?auto_67442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67441 ?auto_67440 ) ( CLEAR ?auto_67441 ) ( ON-TABLE ?auto_67436 ) ( ON ?auto_67437 ?auto_67436 ) ( ON ?auto_67438 ?auto_67437 ) ( ON ?auto_67439 ?auto_67438 ) ( ON ?auto_67440 ?auto_67439 ) ( not ( = ?auto_67436 ?auto_67437 ) ) ( not ( = ?auto_67436 ?auto_67438 ) ) ( not ( = ?auto_67436 ?auto_67439 ) ) ( not ( = ?auto_67436 ?auto_67440 ) ) ( not ( = ?auto_67436 ?auto_67441 ) ) ( not ( = ?auto_67437 ?auto_67438 ) ) ( not ( = ?auto_67437 ?auto_67439 ) ) ( not ( = ?auto_67437 ?auto_67440 ) ) ( not ( = ?auto_67437 ?auto_67441 ) ) ( not ( = ?auto_67438 ?auto_67439 ) ) ( not ( = ?auto_67438 ?auto_67440 ) ) ( not ( = ?auto_67438 ?auto_67441 ) ) ( not ( = ?auto_67439 ?auto_67440 ) ) ( not ( = ?auto_67439 ?auto_67441 ) ) ( not ( = ?auto_67440 ?auto_67441 ) ) ( HOLDING ?auto_67442 ) ( not ( = ?auto_67436 ?auto_67442 ) ) ( not ( = ?auto_67437 ?auto_67442 ) ) ( not ( = ?auto_67438 ?auto_67442 ) ) ( not ( = ?auto_67439 ?auto_67442 ) ) ( not ( = ?auto_67440 ?auto_67442 ) ) ( not ( = ?auto_67441 ?auto_67442 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_67442 )
      ( MAKE-5PILE ?auto_67436 ?auto_67437 ?auto_67438 ?auto_67439 ?auto_67440 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67533 - BLOCK
      ?auto_67534 - BLOCK
    )
    :vars
    (
      ?auto_67535 - BLOCK
      ?auto_67537 - BLOCK
      ?auto_67536 - BLOCK
      ?auto_67539 - BLOCK
      ?auto_67538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67533 ?auto_67534 ) ) ( ON ?auto_67534 ?auto_67535 ) ( not ( = ?auto_67533 ?auto_67535 ) ) ( not ( = ?auto_67534 ?auto_67535 ) ) ( ON ?auto_67533 ?auto_67534 ) ( CLEAR ?auto_67533 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67537 ) ( ON ?auto_67536 ?auto_67537 ) ( ON ?auto_67539 ?auto_67536 ) ( ON ?auto_67538 ?auto_67539 ) ( ON ?auto_67535 ?auto_67538 ) ( not ( = ?auto_67537 ?auto_67536 ) ) ( not ( = ?auto_67537 ?auto_67539 ) ) ( not ( = ?auto_67537 ?auto_67538 ) ) ( not ( = ?auto_67537 ?auto_67535 ) ) ( not ( = ?auto_67537 ?auto_67534 ) ) ( not ( = ?auto_67537 ?auto_67533 ) ) ( not ( = ?auto_67536 ?auto_67539 ) ) ( not ( = ?auto_67536 ?auto_67538 ) ) ( not ( = ?auto_67536 ?auto_67535 ) ) ( not ( = ?auto_67536 ?auto_67534 ) ) ( not ( = ?auto_67536 ?auto_67533 ) ) ( not ( = ?auto_67539 ?auto_67538 ) ) ( not ( = ?auto_67539 ?auto_67535 ) ) ( not ( = ?auto_67539 ?auto_67534 ) ) ( not ( = ?auto_67539 ?auto_67533 ) ) ( not ( = ?auto_67538 ?auto_67535 ) ) ( not ( = ?auto_67538 ?auto_67534 ) ) ( not ( = ?auto_67538 ?auto_67533 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67537 ?auto_67536 ?auto_67539 ?auto_67538 ?auto_67535 ?auto_67534 )
      ( MAKE-2PILE ?auto_67533 ?auto_67534 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67542 - BLOCK
      ?auto_67543 - BLOCK
    )
    :vars
    (
      ?auto_67544 - BLOCK
      ?auto_67545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67542 ?auto_67543 ) ) ( ON ?auto_67543 ?auto_67544 ) ( CLEAR ?auto_67543 ) ( not ( = ?auto_67542 ?auto_67544 ) ) ( not ( = ?auto_67543 ?auto_67544 ) ) ( ON ?auto_67542 ?auto_67545 ) ( CLEAR ?auto_67542 ) ( HAND-EMPTY ) ( not ( = ?auto_67542 ?auto_67545 ) ) ( not ( = ?auto_67543 ?auto_67545 ) ) ( not ( = ?auto_67544 ?auto_67545 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67542 ?auto_67545 )
      ( MAKE-2PILE ?auto_67542 ?auto_67543 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67546 - BLOCK
      ?auto_67547 - BLOCK
    )
    :vars
    (
      ?auto_67549 - BLOCK
      ?auto_67548 - BLOCK
      ?auto_67553 - BLOCK
      ?auto_67550 - BLOCK
      ?auto_67551 - BLOCK
      ?auto_67552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67546 ?auto_67547 ) ) ( not ( = ?auto_67546 ?auto_67549 ) ) ( not ( = ?auto_67547 ?auto_67549 ) ) ( ON ?auto_67546 ?auto_67548 ) ( CLEAR ?auto_67546 ) ( not ( = ?auto_67546 ?auto_67548 ) ) ( not ( = ?auto_67547 ?auto_67548 ) ) ( not ( = ?auto_67549 ?auto_67548 ) ) ( HOLDING ?auto_67547 ) ( CLEAR ?auto_67549 ) ( ON-TABLE ?auto_67553 ) ( ON ?auto_67550 ?auto_67553 ) ( ON ?auto_67551 ?auto_67550 ) ( ON ?auto_67552 ?auto_67551 ) ( ON ?auto_67549 ?auto_67552 ) ( not ( = ?auto_67553 ?auto_67550 ) ) ( not ( = ?auto_67553 ?auto_67551 ) ) ( not ( = ?auto_67553 ?auto_67552 ) ) ( not ( = ?auto_67553 ?auto_67549 ) ) ( not ( = ?auto_67553 ?auto_67547 ) ) ( not ( = ?auto_67550 ?auto_67551 ) ) ( not ( = ?auto_67550 ?auto_67552 ) ) ( not ( = ?auto_67550 ?auto_67549 ) ) ( not ( = ?auto_67550 ?auto_67547 ) ) ( not ( = ?auto_67551 ?auto_67552 ) ) ( not ( = ?auto_67551 ?auto_67549 ) ) ( not ( = ?auto_67551 ?auto_67547 ) ) ( not ( = ?auto_67552 ?auto_67549 ) ) ( not ( = ?auto_67552 ?auto_67547 ) ) ( not ( = ?auto_67546 ?auto_67553 ) ) ( not ( = ?auto_67546 ?auto_67550 ) ) ( not ( = ?auto_67546 ?auto_67551 ) ) ( not ( = ?auto_67546 ?auto_67552 ) ) ( not ( = ?auto_67548 ?auto_67553 ) ) ( not ( = ?auto_67548 ?auto_67550 ) ) ( not ( = ?auto_67548 ?auto_67551 ) ) ( not ( = ?auto_67548 ?auto_67552 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67553 ?auto_67550 ?auto_67551 ?auto_67552 ?auto_67549 ?auto_67547 )
      ( MAKE-2PILE ?auto_67546 ?auto_67547 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67554 - BLOCK
      ?auto_67555 - BLOCK
    )
    :vars
    (
      ?auto_67561 - BLOCK
      ?auto_67559 - BLOCK
      ?auto_67557 - BLOCK
      ?auto_67556 - BLOCK
      ?auto_67560 - BLOCK
      ?auto_67558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67554 ?auto_67555 ) ) ( not ( = ?auto_67554 ?auto_67561 ) ) ( not ( = ?auto_67555 ?auto_67561 ) ) ( ON ?auto_67554 ?auto_67559 ) ( not ( = ?auto_67554 ?auto_67559 ) ) ( not ( = ?auto_67555 ?auto_67559 ) ) ( not ( = ?auto_67561 ?auto_67559 ) ) ( CLEAR ?auto_67561 ) ( ON-TABLE ?auto_67557 ) ( ON ?auto_67556 ?auto_67557 ) ( ON ?auto_67560 ?auto_67556 ) ( ON ?auto_67558 ?auto_67560 ) ( ON ?auto_67561 ?auto_67558 ) ( not ( = ?auto_67557 ?auto_67556 ) ) ( not ( = ?auto_67557 ?auto_67560 ) ) ( not ( = ?auto_67557 ?auto_67558 ) ) ( not ( = ?auto_67557 ?auto_67561 ) ) ( not ( = ?auto_67557 ?auto_67555 ) ) ( not ( = ?auto_67556 ?auto_67560 ) ) ( not ( = ?auto_67556 ?auto_67558 ) ) ( not ( = ?auto_67556 ?auto_67561 ) ) ( not ( = ?auto_67556 ?auto_67555 ) ) ( not ( = ?auto_67560 ?auto_67558 ) ) ( not ( = ?auto_67560 ?auto_67561 ) ) ( not ( = ?auto_67560 ?auto_67555 ) ) ( not ( = ?auto_67558 ?auto_67561 ) ) ( not ( = ?auto_67558 ?auto_67555 ) ) ( not ( = ?auto_67554 ?auto_67557 ) ) ( not ( = ?auto_67554 ?auto_67556 ) ) ( not ( = ?auto_67554 ?auto_67560 ) ) ( not ( = ?auto_67554 ?auto_67558 ) ) ( not ( = ?auto_67559 ?auto_67557 ) ) ( not ( = ?auto_67559 ?auto_67556 ) ) ( not ( = ?auto_67559 ?auto_67560 ) ) ( not ( = ?auto_67559 ?auto_67558 ) ) ( ON ?auto_67555 ?auto_67554 ) ( CLEAR ?auto_67555 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67559 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67559 ?auto_67554 )
      ( MAKE-2PILE ?auto_67554 ?auto_67555 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67562 - BLOCK
      ?auto_67563 - BLOCK
    )
    :vars
    (
      ?auto_67569 - BLOCK
      ?auto_67566 - BLOCK
      ?auto_67568 - BLOCK
      ?auto_67567 - BLOCK
      ?auto_67564 - BLOCK
      ?auto_67565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67562 ?auto_67563 ) ) ( not ( = ?auto_67562 ?auto_67569 ) ) ( not ( = ?auto_67563 ?auto_67569 ) ) ( ON ?auto_67562 ?auto_67566 ) ( not ( = ?auto_67562 ?auto_67566 ) ) ( not ( = ?auto_67563 ?auto_67566 ) ) ( not ( = ?auto_67569 ?auto_67566 ) ) ( ON-TABLE ?auto_67568 ) ( ON ?auto_67567 ?auto_67568 ) ( ON ?auto_67564 ?auto_67567 ) ( ON ?auto_67565 ?auto_67564 ) ( not ( = ?auto_67568 ?auto_67567 ) ) ( not ( = ?auto_67568 ?auto_67564 ) ) ( not ( = ?auto_67568 ?auto_67565 ) ) ( not ( = ?auto_67568 ?auto_67569 ) ) ( not ( = ?auto_67568 ?auto_67563 ) ) ( not ( = ?auto_67567 ?auto_67564 ) ) ( not ( = ?auto_67567 ?auto_67565 ) ) ( not ( = ?auto_67567 ?auto_67569 ) ) ( not ( = ?auto_67567 ?auto_67563 ) ) ( not ( = ?auto_67564 ?auto_67565 ) ) ( not ( = ?auto_67564 ?auto_67569 ) ) ( not ( = ?auto_67564 ?auto_67563 ) ) ( not ( = ?auto_67565 ?auto_67569 ) ) ( not ( = ?auto_67565 ?auto_67563 ) ) ( not ( = ?auto_67562 ?auto_67568 ) ) ( not ( = ?auto_67562 ?auto_67567 ) ) ( not ( = ?auto_67562 ?auto_67564 ) ) ( not ( = ?auto_67562 ?auto_67565 ) ) ( not ( = ?auto_67566 ?auto_67568 ) ) ( not ( = ?auto_67566 ?auto_67567 ) ) ( not ( = ?auto_67566 ?auto_67564 ) ) ( not ( = ?auto_67566 ?auto_67565 ) ) ( ON ?auto_67563 ?auto_67562 ) ( CLEAR ?auto_67563 ) ( ON-TABLE ?auto_67566 ) ( HOLDING ?auto_67569 ) ( CLEAR ?auto_67565 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67568 ?auto_67567 ?auto_67564 ?auto_67565 ?auto_67569 )
      ( MAKE-2PILE ?auto_67562 ?auto_67563 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67570 - BLOCK
      ?auto_67571 - BLOCK
    )
    :vars
    (
      ?auto_67577 - BLOCK
      ?auto_67576 - BLOCK
      ?auto_67573 - BLOCK
      ?auto_67572 - BLOCK
      ?auto_67575 - BLOCK
      ?auto_67574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67570 ?auto_67571 ) ) ( not ( = ?auto_67570 ?auto_67577 ) ) ( not ( = ?auto_67571 ?auto_67577 ) ) ( ON ?auto_67570 ?auto_67576 ) ( not ( = ?auto_67570 ?auto_67576 ) ) ( not ( = ?auto_67571 ?auto_67576 ) ) ( not ( = ?auto_67577 ?auto_67576 ) ) ( ON-TABLE ?auto_67573 ) ( ON ?auto_67572 ?auto_67573 ) ( ON ?auto_67575 ?auto_67572 ) ( ON ?auto_67574 ?auto_67575 ) ( not ( = ?auto_67573 ?auto_67572 ) ) ( not ( = ?auto_67573 ?auto_67575 ) ) ( not ( = ?auto_67573 ?auto_67574 ) ) ( not ( = ?auto_67573 ?auto_67577 ) ) ( not ( = ?auto_67573 ?auto_67571 ) ) ( not ( = ?auto_67572 ?auto_67575 ) ) ( not ( = ?auto_67572 ?auto_67574 ) ) ( not ( = ?auto_67572 ?auto_67577 ) ) ( not ( = ?auto_67572 ?auto_67571 ) ) ( not ( = ?auto_67575 ?auto_67574 ) ) ( not ( = ?auto_67575 ?auto_67577 ) ) ( not ( = ?auto_67575 ?auto_67571 ) ) ( not ( = ?auto_67574 ?auto_67577 ) ) ( not ( = ?auto_67574 ?auto_67571 ) ) ( not ( = ?auto_67570 ?auto_67573 ) ) ( not ( = ?auto_67570 ?auto_67572 ) ) ( not ( = ?auto_67570 ?auto_67575 ) ) ( not ( = ?auto_67570 ?auto_67574 ) ) ( not ( = ?auto_67576 ?auto_67573 ) ) ( not ( = ?auto_67576 ?auto_67572 ) ) ( not ( = ?auto_67576 ?auto_67575 ) ) ( not ( = ?auto_67576 ?auto_67574 ) ) ( ON ?auto_67571 ?auto_67570 ) ( ON-TABLE ?auto_67576 ) ( CLEAR ?auto_67574 ) ( ON ?auto_67577 ?auto_67571 ) ( CLEAR ?auto_67577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67576 ?auto_67570 ?auto_67571 )
      ( MAKE-2PILE ?auto_67570 ?auto_67571 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67578 - BLOCK
      ?auto_67579 - BLOCK
    )
    :vars
    (
      ?auto_67582 - BLOCK
      ?auto_67581 - BLOCK
      ?auto_67584 - BLOCK
      ?auto_67583 - BLOCK
      ?auto_67580 - BLOCK
      ?auto_67585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67578 ?auto_67579 ) ) ( not ( = ?auto_67578 ?auto_67582 ) ) ( not ( = ?auto_67579 ?auto_67582 ) ) ( ON ?auto_67578 ?auto_67581 ) ( not ( = ?auto_67578 ?auto_67581 ) ) ( not ( = ?auto_67579 ?auto_67581 ) ) ( not ( = ?auto_67582 ?auto_67581 ) ) ( ON-TABLE ?auto_67584 ) ( ON ?auto_67583 ?auto_67584 ) ( ON ?auto_67580 ?auto_67583 ) ( not ( = ?auto_67584 ?auto_67583 ) ) ( not ( = ?auto_67584 ?auto_67580 ) ) ( not ( = ?auto_67584 ?auto_67585 ) ) ( not ( = ?auto_67584 ?auto_67582 ) ) ( not ( = ?auto_67584 ?auto_67579 ) ) ( not ( = ?auto_67583 ?auto_67580 ) ) ( not ( = ?auto_67583 ?auto_67585 ) ) ( not ( = ?auto_67583 ?auto_67582 ) ) ( not ( = ?auto_67583 ?auto_67579 ) ) ( not ( = ?auto_67580 ?auto_67585 ) ) ( not ( = ?auto_67580 ?auto_67582 ) ) ( not ( = ?auto_67580 ?auto_67579 ) ) ( not ( = ?auto_67585 ?auto_67582 ) ) ( not ( = ?auto_67585 ?auto_67579 ) ) ( not ( = ?auto_67578 ?auto_67584 ) ) ( not ( = ?auto_67578 ?auto_67583 ) ) ( not ( = ?auto_67578 ?auto_67580 ) ) ( not ( = ?auto_67578 ?auto_67585 ) ) ( not ( = ?auto_67581 ?auto_67584 ) ) ( not ( = ?auto_67581 ?auto_67583 ) ) ( not ( = ?auto_67581 ?auto_67580 ) ) ( not ( = ?auto_67581 ?auto_67585 ) ) ( ON ?auto_67579 ?auto_67578 ) ( ON-TABLE ?auto_67581 ) ( ON ?auto_67582 ?auto_67579 ) ( CLEAR ?auto_67582 ) ( HOLDING ?auto_67585 ) ( CLEAR ?auto_67580 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67584 ?auto_67583 ?auto_67580 ?auto_67585 )
      ( MAKE-2PILE ?auto_67578 ?auto_67579 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67586 - BLOCK
      ?auto_67587 - BLOCK
    )
    :vars
    (
      ?auto_67588 - BLOCK
      ?auto_67589 - BLOCK
      ?auto_67593 - BLOCK
      ?auto_67590 - BLOCK
      ?auto_67591 - BLOCK
      ?auto_67592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67586 ?auto_67587 ) ) ( not ( = ?auto_67586 ?auto_67588 ) ) ( not ( = ?auto_67587 ?auto_67588 ) ) ( ON ?auto_67586 ?auto_67589 ) ( not ( = ?auto_67586 ?auto_67589 ) ) ( not ( = ?auto_67587 ?auto_67589 ) ) ( not ( = ?auto_67588 ?auto_67589 ) ) ( ON-TABLE ?auto_67593 ) ( ON ?auto_67590 ?auto_67593 ) ( ON ?auto_67591 ?auto_67590 ) ( not ( = ?auto_67593 ?auto_67590 ) ) ( not ( = ?auto_67593 ?auto_67591 ) ) ( not ( = ?auto_67593 ?auto_67592 ) ) ( not ( = ?auto_67593 ?auto_67588 ) ) ( not ( = ?auto_67593 ?auto_67587 ) ) ( not ( = ?auto_67590 ?auto_67591 ) ) ( not ( = ?auto_67590 ?auto_67592 ) ) ( not ( = ?auto_67590 ?auto_67588 ) ) ( not ( = ?auto_67590 ?auto_67587 ) ) ( not ( = ?auto_67591 ?auto_67592 ) ) ( not ( = ?auto_67591 ?auto_67588 ) ) ( not ( = ?auto_67591 ?auto_67587 ) ) ( not ( = ?auto_67592 ?auto_67588 ) ) ( not ( = ?auto_67592 ?auto_67587 ) ) ( not ( = ?auto_67586 ?auto_67593 ) ) ( not ( = ?auto_67586 ?auto_67590 ) ) ( not ( = ?auto_67586 ?auto_67591 ) ) ( not ( = ?auto_67586 ?auto_67592 ) ) ( not ( = ?auto_67589 ?auto_67593 ) ) ( not ( = ?auto_67589 ?auto_67590 ) ) ( not ( = ?auto_67589 ?auto_67591 ) ) ( not ( = ?auto_67589 ?auto_67592 ) ) ( ON ?auto_67587 ?auto_67586 ) ( ON-TABLE ?auto_67589 ) ( ON ?auto_67588 ?auto_67587 ) ( CLEAR ?auto_67591 ) ( ON ?auto_67592 ?auto_67588 ) ( CLEAR ?auto_67592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67589 ?auto_67586 ?auto_67587 ?auto_67588 )
      ( MAKE-2PILE ?auto_67586 ?auto_67587 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67594 - BLOCK
      ?auto_67595 - BLOCK
    )
    :vars
    (
      ?auto_67598 - BLOCK
      ?auto_67597 - BLOCK
      ?auto_67600 - BLOCK
      ?auto_67596 - BLOCK
      ?auto_67599 - BLOCK
      ?auto_67601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67594 ?auto_67595 ) ) ( not ( = ?auto_67594 ?auto_67598 ) ) ( not ( = ?auto_67595 ?auto_67598 ) ) ( ON ?auto_67594 ?auto_67597 ) ( not ( = ?auto_67594 ?auto_67597 ) ) ( not ( = ?auto_67595 ?auto_67597 ) ) ( not ( = ?auto_67598 ?auto_67597 ) ) ( ON-TABLE ?auto_67600 ) ( ON ?auto_67596 ?auto_67600 ) ( not ( = ?auto_67600 ?auto_67596 ) ) ( not ( = ?auto_67600 ?auto_67599 ) ) ( not ( = ?auto_67600 ?auto_67601 ) ) ( not ( = ?auto_67600 ?auto_67598 ) ) ( not ( = ?auto_67600 ?auto_67595 ) ) ( not ( = ?auto_67596 ?auto_67599 ) ) ( not ( = ?auto_67596 ?auto_67601 ) ) ( not ( = ?auto_67596 ?auto_67598 ) ) ( not ( = ?auto_67596 ?auto_67595 ) ) ( not ( = ?auto_67599 ?auto_67601 ) ) ( not ( = ?auto_67599 ?auto_67598 ) ) ( not ( = ?auto_67599 ?auto_67595 ) ) ( not ( = ?auto_67601 ?auto_67598 ) ) ( not ( = ?auto_67601 ?auto_67595 ) ) ( not ( = ?auto_67594 ?auto_67600 ) ) ( not ( = ?auto_67594 ?auto_67596 ) ) ( not ( = ?auto_67594 ?auto_67599 ) ) ( not ( = ?auto_67594 ?auto_67601 ) ) ( not ( = ?auto_67597 ?auto_67600 ) ) ( not ( = ?auto_67597 ?auto_67596 ) ) ( not ( = ?auto_67597 ?auto_67599 ) ) ( not ( = ?auto_67597 ?auto_67601 ) ) ( ON ?auto_67595 ?auto_67594 ) ( ON-TABLE ?auto_67597 ) ( ON ?auto_67598 ?auto_67595 ) ( ON ?auto_67601 ?auto_67598 ) ( CLEAR ?auto_67601 ) ( HOLDING ?auto_67599 ) ( CLEAR ?auto_67596 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67600 ?auto_67596 ?auto_67599 )
      ( MAKE-2PILE ?auto_67594 ?auto_67595 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67602 - BLOCK
      ?auto_67603 - BLOCK
    )
    :vars
    (
      ?auto_67604 - BLOCK
      ?auto_67606 - BLOCK
      ?auto_67607 - BLOCK
      ?auto_67608 - BLOCK
      ?auto_67609 - BLOCK
      ?auto_67605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67602 ?auto_67603 ) ) ( not ( = ?auto_67602 ?auto_67604 ) ) ( not ( = ?auto_67603 ?auto_67604 ) ) ( ON ?auto_67602 ?auto_67606 ) ( not ( = ?auto_67602 ?auto_67606 ) ) ( not ( = ?auto_67603 ?auto_67606 ) ) ( not ( = ?auto_67604 ?auto_67606 ) ) ( ON-TABLE ?auto_67607 ) ( ON ?auto_67608 ?auto_67607 ) ( not ( = ?auto_67607 ?auto_67608 ) ) ( not ( = ?auto_67607 ?auto_67609 ) ) ( not ( = ?auto_67607 ?auto_67605 ) ) ( not ( = ?auto_67607 ?auto_67604 ) ) ( not ( = ?auto_67607 ?auto_67603 ) ) ( not ( = ?auto_67608 ?auto_67609 ) ) ( not ( = ?auto_67608 ?auto_67605 ) ) ( not ( = ?auto_67608 ?auto_67604 ) ) ( not ( = ?auto_67608 ?auto_67603 ) ) ( not ( = ?auto_67609 ?auto_67605 ) ) ( not ( = ?auto_67609 ?auto_67604 ) ) ( not ( = ?auto_67609 ?auto_67603 ) ) ( not ( = ?auto_67605 ?auto_67604 ) ) ( not ( = ?auto_67605 ?auto_67603 ) ) ( not ( = ?auto_67602 ?auto_67607 ) ) ( not ( = ?auto_67602 ?auto_67608 ) ) ( not ( = ?auto_67602 ?auto_67609 ) ) ( not ( = ?auto_67602 ?auto_67605 ) ) ( not ( = ?auto_67606 ?auto_67607 ) ) ( not ( = ?auto_67606 ?auto_67608 ) ) ( not ( = ?auto_67606 ?auto_67609 ) ) ( not ( = ?auto_67606 ?auto_67605 ) ) ( ON ?auto_67603 ?auto_67602 ) ( ON-TABLE ?auto_67606 ) ( ON ?auto_67604 ?auto_67603 ) ( ON ?auto_67605 ?auto_67604 ) ( CLEAR ?auto_67608 ) ( ON ?auto_67609 ?auto_67605 ) ( CLEAR ?auto_67609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67606 ?auto_67602 ?auto_67603 ?auto_67604 ?auto_67605 )
      ( MAKE-2PILE ?auto_67602 ?auto_67603 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67610 - BLOCK
      ?auto_67611 - BLOCK
    )
    :vars
    (
      ?auto_67617 - BLOCK
      ?auto_67613 - BLOCK
      ?auto_67614 - BLOCK
      ?auto_67615 - BLOCK
      ?auto_67616 - BLOCK
      ?auto_67612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67610 ?auto_67611 ) ) ( not ( = ?auto_67610 ?auto_67617 ) ) ( not ( = ?auto_67611 ?auto_67617 ) ) ( ON ?auto_67610 ?auto_67613 ) ( not ( = ?auto_67610 ?auto_67613 ) ) ( not ( = ?auto_67611 ?auto_67613 ) ) ( not ( = ?auto_67617 ?auto_67613 ) ) ( ON-TABLE ?auto_67614 ) ( not ( = ?auto_67614 ?auto_67615 ) ) ( not ( = ?auto_67614 ?auto_67616 ) ) ( not ( = ?auto_67614 ?auto_67612 ) ) ( not ( = ?auto_67614 ?auto_67617 ) ) ( not ( = ?auto_67614 ?auto_67611 ) ) ( not ( = ?auto_67615 ?auto_67616 ) ) ( not ( = ?auto_67615 ?auto_67612 ) ) ( not ( = ?auto_67615 ?auto_67617 ) ) ( not ( = ?auto_67615 ?auto_67611 ) ) ( not ( = ?auto_67616 ?auto_67612 ) ) ( not ( = ?auto_67616 ?auto_67617 ) ) ( not ( = ?auto_67616 ?auto_67611 ) ) ( not ( = ?auto_67612 ?auto_67617 ) ) ( not ( = ?auto_67612 ?auto_67611 ) ) ( not ( = ?auto_67610 ?auto_67614 ) ) ( not ( = ?auto_67610 ?auto_67615 ) ) ( not ( = ?auto_67610 ?auto_67616 ) ) ( not ( = ?auto_67610 ?auto_67612 ) ) ( not ( = ?auto_67613 ?auto_67614 ) ) ( not ( = ?auto_67613 ?auto_67615 ) ) ( not ( = ?auto_67613 ?auto_67616 ) ) ( not ( = ?auto_67613 ?auto_67612 ) ) ( ON ?auto_67611 ?auto_67610 ) ( ON-TABLE ?auto_67613 ) ( ON ?auto_67617 ?auto_67611 ) ( ON ?auto_67612 ?auto_67617 ) ( ON ?auto_67616 ?auto_67612 ) ( CLEAR ?auto_67616 ) ( HOLDING ?auto_67615 ) ( CLEAR ?auto_67614 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67614 ?auto_67615 )
      ( MAKE-2PILE ?auto_67610 ?auto_67611 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67618 - BLOCK
      ?auto_67619 - BLOCK
    )
    :vars
    (
      ?auto_67621 - BLOCK
      ?auto_67622 - BLOCK
      ?auto_67625 - BLOCK
      ?auto_67624 - BLOCK
      ?auto_67623 - BLOCK
      ?auto_67620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67618 ?auto_67619 ) ) ( not ( = ?auto_67618 ?auto_67621 ) ) ( not ( = ?auto_67619 ?auto_67621 ) ) ( ON ?auto_67618 ?auto_67622 ) ( not ( = ?auto_67618 ?auto_67622 ) ) ( not ( = ?auto_67619 ?auto_67622 ) ) ( not ( = ?auto_67621 ?auto_67622 ) ) ( ON-TABLE ?auto_67625 ) ( not ( = ?auto_67625 ?auto_67624 ) ) ( not ( = ?auto_67625 ?auto_67623 ) ) ( not ( = ?auto_67625 ?auto_67620 ) ) ( not ( = ?auto_67625 ?auto_67621 ) ) ( not ( = ?auto_67625 ?auto_67619 ) ) ( not ( = ?auto_67624 ?auto_67623 ) ) ( not ( = ?auto_67624 ?auto_67620 ) ) ( not ( = ?auto_67624 ?auto_67621 ) ) ( not ( = ?auto_67624 ?auto_67619 ) ) ( not ( = ?auto_67623 ?auto_67620 ) ) ( not ( = ?auto_67623 ?auto_67621 ) ) ( not ( = ?auto_67623 ?auto_67619 ) ) ( not ( = ?auto_67620 ?auto_67621 ) ) ( not ( = ?auto_67620 ?auto_67619 ) ) ( not ( = ?auto_67618 ?auto_67625 ) ) ( not ( = ?auto_67618 ?auto_67624 ) ) ( not ( = ?auto_67618 ?auto_67623 ) ) ( not ( = ?auto_67618 ?auto_67620 ) ) ( not ( = ?auto_67622 ?auto_67625 ) ) ( not ( = ?auto_67622 ?auto_67624 ) ) ( not ( = ?auto_67622 ?auto_67623 ) ) ( not ( = ?auto_67622 ?auto_67620 ) ) ( ON ?auto_67619 ?auto_67618 ) ( ON-TABLE ?auto_67622 ) ( ON ?auto_67621 ?auto_67619 ) ( ON ?auto_67620 ?auto_67621 ) ( ON ?auto_67623 ?auto_67620 ) ( CLEAR ?auto_67625 ) ( ON ?auto_67624 ?auto_67623 ) ( CLEAR ?auto_67624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67622 ?auto_67618 ?auto_67619 ?auto_67621 ?auto_67620 ?auto_67623 )
      ( MAKE-2PILE ?auto_67618 ?auto_67619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67626 - BLOCK
      ?auto_67627 - BLOCK
    )
    :vars
    (
      ?auto_67631 - BLOCK
      ?auto_67628 - BLOCK
      ?auto_67630 - BLOCK
      ?auto_67632 - BLOCK
      ?auto_67629 - BLOCK
      ?auto_67633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67626 ?auto_67627 ) ) ( not ( = ?auto_67626 ?auto_67631 ) ) ( not ( = ?auto_67627 ?auto_67631 ) ) ( ON ?auto_67626 ?auto_67628 ) ( not ( = ?auto_67626 ?auto_67628 ) ) ( not ( = ?auto_67627 ?auto_67628 ) ) ( not ( = ?auto_67631 ?auto_67628 ) ) ( not ( = ?auto_67630 ?auto_67632 ) ) ( not ( = ?auto_67630 ?auto_67629 ) ) ( not ( = ?auto_67630 ?auto_67633 ) ) ( not ( = ?auto_67630 ?auto_67631 ) ) ( not ( = ?auto_67630 ?auto_67627 ) ) ( not ( = ?auto_67632 ?auto_67629 ) ) ( not ( = ?auto_67632 ?auto_67633 ) ) ( not ( = ?auto_67632 ?auto_67631 ) ) ( not ( = ?auto_67632 ?auto_67627 ) ) ( not ( = ?auto_67629 ?auto_67633 ) ) ( not ( = ?auto_67629 ?auto_67631 ) ) ( not ( = ?auto_67629 ?auto_67627 ) ) ( not ( = ?auto_67633 ?auto_67631 ) ) ( not ( = ?auto_67633 ?auto_67627 ) ) ( not ( = ?auto_67626 ?auto_67630 ) ) ( not ( = ?auto_67626 ?auto_67632 ) ) ( not ( = ?auto_67626 ?auto_67629 ) ) ( not ( = ?auto_67626 ?auto_67633 ) ) ( not ( = ?auto_67628 ?auto_67630 ) ) ( not ( = ?auto_67628 ?auto_67632 ) ) ( not ( = ?auto_67628 ?auto_67629 ) ) ( not ( = ?auto_67628 ?auto_67633 ) ) ( ON ?auto_67627 ?auto_67626 ) ( ON-TABLE ?auto_67628 ) ( ON ?auto_67631 ?auto_67627 ) ( ON ?auto_67633 ?auto_67631 ) ( ON ?auto_67629 ?auto_67633 ) ( ON ?auto_67632 ?auto_67629 ) ( CLEAR ?auto_67632 ) ( HOLDING ?auto_67630 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67630 )
      ( MAKE-2PILE ?auto_67626 ?auto_67627 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67634 - BLOCK
      ?auto_67635 - BLOCK
    )
    :vars
    (
      ?auto_67638 - BLOCK
      ?auto_67639 - BLOCK
      ?auto_67637 - BLOCK
      ?auto_67640 - BLOCK
      ?auto_67636 - BLOCK
      ?auto_67641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67634 ?auto_67635 ) ) ( not ( = ?auto_67634 ?auto_67638 ) ) ( not ( = ?auto_67635 ?auto_67638 ) ) ( ON ?auto_67634 ?auto_67639 ) ( not ( = ?auto_67634 ?auto_67639 ) ) ( not ( = ?auto_67635 ?auto_67639 ) ) ( not ( = ?auto_67638 ?auto_67639 ) ) ( not ( = ?auto_67637 ?auto_67640 ) ) ( not ( = ?auto_67637 ?auto_67636 ) ) ( not ( = ?auto_67637 ?auto_67641 ) ) ( not ( = ?auto_67637 ?auto_67638 ) ) ( not ( = ?auto_67637 ?auto_67635 ) ) ( not ( = ?auto_67640 ?auto_67636 ) ) ( not ( = ?auto_67640 ?auto_67641 ) ) ( not ( = ?auto_67640 ?auto_67638 ) ) ( not ( = ?auto_67640 ?auto_67635 ) ) ( not ( = ?auto_67636 ?auto_67641 ) ) ( not ( = ?auto_67636 ?auto_67638 ) ) ( not ( = ?auto_67636 ?auto_67635 ) ) ( not ( = ?auto_67641 ?auto_67638 ) ) ( not ( = ?auto_67641 ?auto_67635 ) ) ( not ( = ?auto_67634 ?auto_67637 ) ) ( not ( = ?auto_67634 ?auto_67640 ) ) ( not ( = ?auto_67634 ?auto_67636 ) ) ( not ( = ?auto_67634 ?auto_67641 ) ) ( not ( = ?auto_67639 ?auto_67637 ) ) ( not ( = ?auto_67639 ?auto_67640 ) ) ( not ( = ?auto_67639 ?auto_67636 ) ) ( not ( = ?auto_67639 ?auto_67641 ) ) ( ON ?auto_67635 ?auto_67634 ) ( ON-TABLE ?auto_67639 ) ( ON ?auto_67638 ?auto_67635 ) ( ON ?auto_67641 ?auto_67638 ) ( ON ?auto_67636 ?auto_67641 ) ( ON ?auto_67640 ?auto_67636 ) ( ON ?auto_67637 ?auto_67640 ) ( CLEAR ?auto_67637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_67639 ?auto_67634 ?auto_67635 ?auto_67638 ?auto_67641 ?auto_67636 ?auto_67640 )
      ( MAKE-2PILE ?auto_67634 ?auto_67635 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67665 - BLOCK
      ?auto_67666 - BLOCK
      ?auto_67667 - BLOCK
      ?auto_67668 - BLOCK
    )
    :vars
    (
      ?auto_67669 - BLOCK
      ?auto_67671 - BLOCK
      ?auto_67670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67669 ?auto_67668 ) ( ON-TABLE ?auto_67665 ) ( ON ?auto_67666 ?auto_67665 ) ( ON ?auto_67667 ?auto_67666 ) ( ON ?auto_67668 ?auto_67667 ) ( not ( = ?auto_67665 ?auto_67666 ) ) ( not ( = ?auto_67665 ?auto_67667 ) ) ( not ( = ?auto_67665 ?auto_67668 ) ) ( not ( = ?auto_67665 ?auto_67669 ) ) ( not ( = ?auto_67666 ?auto_67667 ) ) ( not ( = ?auto_67666 ?auto_67668 ) ) ( not ( = ?auto_67666 ?auto_67669 ) ) ( not ( = ?auto_67667 ?auto_67668 ) ) ( not ( = ?auto_67667 ?auto_67669 ) ) ( not ( = ?auto_67668 ?auto_67669 ) ) ( not ( = ?auto_67665 ?auto_67671 ) ) ( not ( = ?auto_67665 ?auto_67670 ) ) ( not ( = ?auto_67666 ?auto_67671 ) ) ( not ( = ?auto_67666 ?auto_67670 ) ) ( not ( = ?auto_67667 ?auto_67671 ) ) ( not ( = ?auto_67667 ?auto_67670 ) ) ( not ( = ?auto_67668 ?auto_67671 ) ) ( not ( = ?auto_67668 ?auto_67670 ) ) ( not ( = ?auto_67669 ?auto_67671 ) ) ( not ( = ?auto_67669 ?auto_67670 ) ) ( not ( = ?auto_67671 ?auto_67670 ) ) ( ON ?auto_67671 ?auto_67669 ) ( CLEAR ?auto_67671 ) ( HOLDING ?auto_67670 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67670 )
      ( MAKE-4PILE ?auto_67665 ?auto_67666 ?auto_67667 ?auto_67668 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67752 - BLOCK
      ?auto_67753 - BLOCK
      ?auto_67754 - BLOCK
    )
    :vars
    (
      ?auto_67755 - BLOCK
      ?auto_67757 - BLOCK
      ?auto_67758 - BLOCK
      ?auto_67756 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67752 ) ( not ( = ?auto_67752 ?auto_67753 ) ) ( not ( = ?auto_67752 ?auto_67754 ) ) ( not ( = ?auto_67753 ?auto_67754 ) ) ( ON ?auto_67754 ?auto_67755 ) ( not ( = ?auto_67752 ?auto_67755 ) ) ( not ( = ?auto_67753 ?auto_67755 ) ) ( not ( = ?auto_67754 ?auto_67755 ) ) ( CLEAR ?auto_67752 ) ( ON ?auto_67753 ?auto_67754 ) ( CLEAR ?auto_67753 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67757 ) ( ON ?auto_67758 ?auto_67757 ) ( ON ?auto_67756 ?auto_67758 ) ( ON ?auto_67755 ?auto_67756 ) ( not ( = ?auto_67757 ?auto_67758 ) ) ( not ( = ?auto_67757 ?auto_67756 ) ) ( not ( = ?auto_67757 ?auto_67755 ) ) ( not ( = ?auto_67757 ?auto_67754 ) ) ( not ( = ?auto_67757 ?auto_67753 ) ) ( not ( = ?auto_67758 ?auto_67756 ) ) ( not ( = ?auto_67758 ?auto_67755 ) ) ( not ( = ?auto_67758 ?auto_67754 ) ) ( not ( = ?auto_67758 ?auto_67753 ) ) ( not ( = ?auto_67756 ?auto_67755 ) ) ( not ( = ?auto_67756 ?auto_67754 ) ) ( not ( = ?auto_67756 ?auto_67753 ) ) ( not ( = ?auto_67752 ?auto_67757 ) ) ( not ( = ?auto_67752 ?auto_67758 ) ) ( not ( = ?auto_67752 ?auto_67756 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67757 ?auto_67758 ?auto_67756 ?auto_67755 ?auto_67754 )
      ( MAKE-3PILE ?auto_67752 ?auto_67753 ?auto_67754 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67759 - BLOCK
      ?auto_67760 - BLOCK
      ?auto_67761 - BLOCK
    )
    :vars
    (
      ?auto_67763 - BLOCK
      ?auto_67765 - BLOCK
      ?auto_67762 - BLOCK
      ?auto_67764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67759 ?auto_67760 ) ) ( not ( = ?auto_67759 ?auto_67761 ) ) ( not ( = ?auto_67760 ?auto_67761 ) ) ( ON ?auto_67761 ?auto_67763 ) ( not ( = ?auto_67759 ?auto_67763 ) ) ( not ( = ?auto_67760 ?auto_67763 ) ) ( not ( = ?auto_67761 ?auto_67763 ) ) ( ON ?auto_67760 ?auto_67761 ) ( CLEAR ?auto_67760 ) ( ON-TABLE ?auto_67765 ) ( ON ?auto_67762 ?auto_67765 ) ( ON ?auto_67764 ?auto_67762 ) ( ON ?auto_67763 ?auto_67764 ) ( not ( = ?auto_67765 ?auto_67762 ) ) ( not ( = ?auto_67765 ?auto_67764 ) ) ( not ( = ?auto_67765 ?auto_67763 ) ) ( not ( = ?auto_67765 ?auto_67761 ) ) ( not ( = ?auto_67765 ?auto_67760 ) ) ( not ( = ?auto_67762 ?auto_67764 ) ) ( not ( = ?auto_67762 ?auto_67763 ) ) ( not ( = ?auto_67762 ?auto_67761 ) ) ( not ( = ?auto_67762 ?auto_67760 ) ) ( not ( = ?auto_67764 ?auto_67763 ) ) ( not ( = ?auto_67764 ?auto_67761 ) ) ( not ( = ?auto_67764 ?auto_67760 ) ) ( not ( = ?auto_67759 ?auto_67765 ) ) ( not ( = ?auto_67759 ?auto_67762 ) ) ( not ( = ?auto_67759 ?auto_67764 ) ) ( HOLDING ?auto_67759 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67759 )
      ( MAKE-3PILE ?auto_67759 ?auto_67760 ?auto_67761 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67766 - BLOCK
      ?auto_67767 - BLOCK
      ?auto_67768 - BLOCK
    )
    :vars
    (
      ?auto_67769 - BLOCK
      ?auto_67770 - BLOCK
      ?auto_67771 - BLOCK
      ?auto_67772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67766 ?auto_67767 ) ) ( not ( = ?auto_67766 ?auto_67768 ) ) ( not ( = ?auto_67767 ?auto_67768 ) ) ( ON ?auto_67768 ?auto_67769 ) ( not ( = ?auto_67766 ?auto_67769 ) ) ( not ( = ?auto_67767 ?auto_67769 ) ) ( not ( = ?auto_67768 ?auto_67769 ) ) ( ON ?auto_67767 ?auto_67768 ) ( ON-TABLE ?auto_67770 ) ( ON ?auto_67771 ?auto_67770 ) ( ON ?auto_67772 ?auto_67771 ) ( ON ?auto_67769 ?auto_67772 ) ( not ( = ?auto_67770 ?auto_67771 ) ) ( not ( = ?auto_67770 ?auto_67772 ) ) ( not ( = ?auto_67770 ?auto_67769 ) ) ( not ( = ?auto_67770 ?auto_67768 ) ) ( not ( = ?auto_67770 ?auto_67767 ) ) ( not ( = ?auto_67771 ?auto_67772 ) ) ( not ( = ?auto_67771 ?auto_67769 ) ) ( not ( = ?auto_67771 ?auto_67768 ) ) ( not ( = ?auto_67771 ?auto_67767 ) ) ( not ( = ?auto_67772 ?auto_67769 ) ) ( not ( = ?auto_67772 ?auto_67768 ) ) ( not ( = ?auto_67772 ?auto_67767 ) ) ( not ( = ?auto_67766 ?auto_67770 ) ) ( not ( = ?auto_67766 ?auto_67771 ) ) ( not ( = ?auto_67766 ?auto_67772 ) ) ( ON ?auto_67766 ?auto_67767 ) ( CLEAR ?auto_67766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67770 ?auto_67771 ?auto_67772 ?auto_67769 ?auto_67768 ?auto_67767 )
      ( MAKE-3PILE ?auto_67766 ?auto_67767 ?auto_67768 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67776 - BLOCK
      ?auto_67777 - BLOCK
      ?auto_67778 - BLOCK
    )
    :vars
    (
      ?auto_67780 - BLOCK
      ?auto_67782 - BLOCK
      ?auto_67779 - BLOCK
      ?auto_67781 - BLOCK
      ?auto_67783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67776 ?auto_67777 ) ) ( not ( = ?auto_67776 ?auto_67778 ) ) ( not ( = ?auto_67777 ?auto_67778 ) ) ( ON ?auto_67778 ?auto_67780 ) ( not ( = ?auto_67776 ?auto_67780 ) ) ( not ( = ?auto_67777 ?auto_67780 ) ) ( not ( = ?auto_67778 ?auto_67780 ) ) ( ON ?auto_67777 ?auto_67778 ) ( CLEAR ?auto_67777 ) ( ON-TABLE ?auto_67782 ) ( ON ?auto_67779 ?auto_67782 ) ( ON ?auto_67781 ?auto_67779 ) ( ON ?auto_67780 ?auto_67781 ) ( not ( = ?auto_67782 ?auto_67779 ) ) ( not ( = ?auto_67782 ?auto_67781 ) ) ( not ( = ?auto_67782 ?auto_67780 ) ) ( not ( = ?auto_67782 ?auto_67778 ) ) ( not ( = ?auto_67782 ?auto_67777 ) ) ( not ( = ?auto_67779 ?auto_67781 ) ) ( not ( = ?auto_67779 ?auto_67780 ) ) ( not ( = ?auto_67779 ?auto_67778 ) ) ( not ( = ?auto_67779 ?auto_67777 ) ) ( not ( = ?auto_67781 ?auto_67780 ) ) ( not ( = ?auto_67781 ?auto_67778 ) ) ( not ( = ?auto_67781 ?auto_67777 ) ) ( not ( = ?auto_67776 ?auto_67782 ) ) ( not ( = ?auto_67776 ?auto_67779 ) ) ( not ( = ?auto_67776 ?auto_67781 ) ) ( ON ?auto_67776 ?auto_67783 ) ( CLEAR ?auto_67776 ) ( HAND-EMPTY ) ( not ( = ?auto_67776 ?auto_67783 ) ) ( not ( = ?auto_67777 ?auto_67783 ) ) ( not ( = ?auto_67778 ?auto_67783 ) ) ( not ( = ?auto_67780 ?auto_67783 ) ) ( not ( = ?auto_67782 ?auto_67783 ) ) ( not ( = ?auto_67779 ?auto_67783 ) ) ( not ( = ?auto_67781 ?auto_67783 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67776 ?auto_67783 )
      ( MAKE-3PILE ?auto_67776 ?auto_67777 ?auto_67778 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67784 - BLOCK
      ?auto_67785 - BLOCK
      ?auto_67786 - BLOCK
    )
    :vars
    (
      ?auto_67788 - BLOCK
      ?auto_67791 - BLOCK
      ?auto_67790 - BLOCK
      ?auto_67789 - BLOCK
      ?auto_67787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67784 ?auto_67785 ) ) ( not ( = ?auto_67784 ?auto_67786 ) ) ( not ( = ?auto_67785 ?auto_67786 ) ) ( ON ?auto_67786 ?auto_67788 ) ( not ( = ?auto_67784 ?auto_67788 ) ) ( not ( = ?auto_67785 ?auto_67788 ) ) ( not ( = ?auto_67786 ?auto_67788 ) ) ( ON-TABLE ?auto_67791 ) ( ON ?auto_67790 ?auto_67791 ) ( ON ?auto_67789 ?auto_67790 ) ( ON ?auto_67788 ?auto_67789 ) ( not ( = ?auto_67791 ?auto_67790 ) ) ( not ( = ?auto_67791 ?auto_67789 ) ) ( not ( = ?auto_67791 ?auto_67788 ) ) ( not ( = ?auto_67791 ?auto_67786 ) ) ( not ( = ?auto_67791 ?auto_67785 ) ) ( not ( = ?auto_67790 ?auto_67789 ) ) ( not ( = ?auto_67790 ?auto_67788 ) ) ( not ( = ?auto_67790 ?auto_67786 ) ) ( not ( = ?auto_67790 ?auto_67785 ) ) ( not ( = ?auto_67789 ?auto_67788 ) ) ( not ( = ?auto_67789 ?auto_67786 ) ) ( not ( = ?auto_67789 ?auto_67785 ) ) ( not ( = ?auto_67784 ?auto_67791 ) ) ( not ( = ?auto_67784 ?auto_67790 ) ) ( not ( = ?auto_67784 ?auto_67789 ) ) ( ON ?auto_67784 ?auto_67787 ) ( CLEAR ?auto_67784 ) ( not ( = ?auto_67784 ?auto_67787 ) ) ( not ( = ?auto_67785 ?auto_67787 ) ) ( not ( = ?auto_67786 ?auto_67787 ) ) ( not ( = ?auto_67788 ?auto_67787 ) ) ( not ( = ?auto_67791 ?auto_67787 ) ) ( not ( = ?auto_67790 ?auto_67787 ) ) ( not ( = ?auto_67789 ?auto_67787 ) ) ( HOLDING ?auto_67785 ) ( CLEAR ?auto_67786 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67791 ?auto_67790 ?auto_67789 ?auto_67788 ?auto_67786 ?auto_67785 )
      ( MAKE-3PILE ?auto_67784 ?auto_67785 ?auto_67786 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67792 - BLOCK
      ?auto_67793 - BLOCK
      ?auto_67794 - BLOCK
    )
    :vars
    (
      ?auto_67798 - BLOCK
      ?auto_67797 - BLOCK
      ?auto_67795 - BLOCK
      ?auto_67799 - BLOCK
      ?auto_67796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67792 ?auto_67793 ) ) ( not ( = ?auto_67792 ?auto_67794 ) ) ( not ( = ?auto_67793 ?auto_67794 ) ) ( ON ?auto_67794 ?auto_67798 ) ( not ( = ?auto_67792 ?auto_67798 ) ) ( not ( = ?auto_67793 ?auto_67798 ) ) ( not ( = ?auto_67794 ?auto_67798 ) ) ( ON-TABLE ?auto_67797 ) ( ON ?auto_67795 ?auto_67797 ) ( ON ?auto_67799 ?auto_67795 ) ( ON ?auto_67798 ?auto_67799 ) ( not ( = ?auto_67797 ?auto_67795 ) ) ( not ( = ?auto_67797 ?auto_67799 ) ) ( not ( = ?auto_67797 ?auto_67798 ) ) ( not ( = ?auto_67797 ?auto_67794 ) ) ( not ( = ?auto_67797 ?auto_67793 ) ) ( not ( = ?auto_67795 ?auto_67799 ) ) ( not ( = ?auto_67795 ?auto_67798 ) ) ( not ( = ?auto_67795 ?auto_67794 ) ) ( not ( = ?auto_67795 ?auto_67793 ) ) ( not ( = ?auto_67799 ?auto_67798 ) ) ( not ( = ?auto_67799 ?auto_67794 ) ) ( not ( = ?auto_67799 ?auto_67793 ) ) ( not ( = ?auto_67792 ?auto_67797 ) ) ( not ( = ?auto_67792 ?auto_67795 ) ) ( not ( = ?auto_67792 ?auto_67799 ) ) ( ON ?auto_67792 ?auto_67796 ) ( not ( = ?auto_67792 ?auto_67796 ) ) ( not ( = ?auto_67793 ?auto_67796 ) ) ( not ( = ?auto_67794 ?auto_67796 ) ) ( not ( = ?auto_67798 ?auto_67796 ) ) ( not ( = ?auto_67797 ?auto_67796 ) ) ( not ( = ?auto_67795 ?auto_67796 ) ) ( not ( = ?auto_67799 ?auto_67796 ) ) ( CLEAR ?auto_67794 ) ( ON ?auto_67793 ?auto_67792 ) ( CLEAR ?auto_67793 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67796 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67796 ?auto_67792 )
      ( MAKE-3PILE ?auto_67792 ?auto_67793 ?auto_67794 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67800 - BLOCK
      ?auto_67801 - BLOCK
      ?auto_67802 - BLOCK
    )
    :vars
    (
      ?auto_67807 - BLOCK
      ?auto_67805 - BLOCK
      ?auto_67806 - BLOCK
      ?auto_67804 - BLOCK
      ?auto_67803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67800 ?auto_67801 ) ) ( not ( = ?auto_67800 ?auto_67802 ) ) ( not ( = ?auto_67801 ?auto_67802 ) ) ( not ( = ?auto_67800 ?auto_67807 ) ) ( not ( = ?auto_67801 ?auto_67807 ) ) ( not ( = ?auto_67802 ?auto_67807 ) ) ( ON-TABLE ?auto_67805 ) ( ON ?auto_67806 ?auto_67805 ) ( ON ?auto_67804 ?auto_67806 ) ( ON ?auto_67807 ?auto_67804 ) ( not ( = ?auto_67805 ?auto_67806 ) ) ( not ( = ?auto_67805 ?auto_67804 ) ) ( not ( = ?auto_67805 ?auto_67807 ) ) ( not ( = ?auto_67805 ?auto_67802 ) ) ( not ( = ?auto_67805 ?auto_67801 ) ) ( not ( = ?auto_67806 ?auto_67804 ) ) ( not ( = ?auto_67806 ?auto_67807 ) ) ( not ( = ?auto_67806 ?auto_67802 ) ) ( not ( = ?auto_67806 ?auto_67801 ) ) ( not ( = ?auto_67804 ?auto_67807 ) ) ( not ( = ?auto_67804 ?auto_67802 ) ) ( not ( = ?auto_67804 ?auto_67801 ) ) ( not ( = ?auto_67800 ?auto_67805 ) ) ( not ( = ?auto_67800 ?auto_67806 ) ) ( not ( = ?auto_67800 ?auto_67804 ) ) ( ON ?auto_67800 ?auto_67803 ) ( not ( = ?auto_67800 ?auto_67803 ) ) ( not ( = ?auto_67801 ?auto_67803 ) ) ( not ( = ?auto_67802 ?auto_67803 ) ) ( not ( = ?auto_67807 ?auto_67803 ) ) ( not ( = ?auto_67805 ?auto_67803 ) ) ( not ( = ?auto_67806 ?auto_67803 ) ) ( not ( = ?auto_67804 ?auto_67803 ) ) ( ON ?auto_67801 ?auto_67800 ) ( CLEAR ?auto_67801 ) ( ON-TABLE ?auto_67803 ) ( HOLDING ?auto_67802 ) ( CLEAR ?auto_67807 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67805 ?auto_67806 ?auto_67804 ?auto_67807 ?auto_67802 )
      ( MAKE-3PILE ?auto_67800 ?auto_67801 ?auto_67802 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67808 - BLOCK
      ?auto_67809 - BLOCK
      ?auto_67810 - BLOCK
    )
    :vars
    (
      ?auto_67815 - BLOCK
      ?auto_67813 - BLOCK
      ?auto_67814 - BLOCK
      ?auto_67812 - BLOCK
      ?auto_67811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67808 ?auto_67809 ) ) ( not ( = ?auto_67808 ?auto_67810 ) ) ( not ( = ?auto_67809 ?auto_67810 ) ) ( not ( = ?auto_67808 ?auto_67815 ) ) ( not ( = ?auto_67809 ?auto_67815 ) ) ( not ( = ?auto_67810 ?auto_67815 ) ) ( ON-TABLE ?auto_67813 ) ( ON ?auto_67814 ?auto_67813 ) ( ON ?auto_67812 ?auto_67814 ) ( ON ?auto_67815 ?auto_67812 ) ( not ( = ?auto_67813 ?auto_67814 ) ) ( not ( = ?auto_67813 ?auto_67812 ) ) ( not ( = ?auto_67813 ?auto_67815 ) ) ( not ( = ?auto_67813 ?auto_67810 ) ) ( not ( = ?auto_67813 ?auto_67809 ) ) ( not ( = ?auto_67814 ?auto_67812 ) ) ( not ( = ?auto_67814 ?auto_67815 ) ) ( not ( = ?auto_67814 ?auto_67810 ) ) ( not ( = ?auto_67814 ?auto_67809 ) ) ( not ( = ?auto_67812 ?auto_67815 ) ) ( not ( = ?auto_67812 ?auto_67810 ) ) ( not ( = ?auto_67812 ?auto_67809 ) ) ( not ( = ?auto_67808 ?auto_67813 ) ) ( not ( = ?auto_67808 ?auto_67814 ) ) ( not ( = ?auto_67808 ?auto_67812 ) ) ( ON ?auto_67808 ?auto_67811 ) ( not ( = ?auto_67808 ?auto_67811 ) ) ( not ( = ?auto_67809 ?auto_67811 ) ) ( not ( = ?auto_67810 ?auto_67811 ) ) ( not ( = ?auto_67815 ?auto_67811 ) ) ( not ( = ?auto_67813 ?auto_67811 ) ) ( not ( = ?auto_67814 ?auto_67811 ) ) ( not ( = ?auto_67812 ?auto_67811 ) ) ( ON ?auto_67809 ?auto_67808 ) ( ON-TABLE ?auto_67811 ) ( CLEAR ?auto_67815 ) ( ON ?auto_67810 ?auto_67809 ) ( CLEAR ?auto_67810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67811 ?auto_67808 ?auto_67809 )
      ( MAKE-3PILE ?auto_67808 ?auto_67809 ?auto_67810 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67816 - BLOCK
      ?auto_67817 - BLOCK
      ?auto_67818 - BLOCK
    )
    :vars
    (
      ?auto_67820 - BLOCK
      ?auto_67819 - BLOCK
      ?auto_67822 - BLOCK
      ?auto_67821 - BLOCK
      ?auto_67823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67816 ?auto_67817 ) ) ( not ( = ?auto_67816 ?auto_67818 ) ) ( not ( = ?auto_67817 ?auto_67818 ) ) ( not ( = ?auto_67816 ?auto_67820 ) ) ( not ( = ?auto_67817 ?auto_67820 ) ) ( not ( = ?auto_67818 ?auto_67820 ) ) ( ON-TABLE ?auto_67819 ) ( ON ?auto_67822 ?auto_67819 ) ( ON ?auto_67821 ?auto_67822 ) ( not ( = ?auto_67819 ?auto_67822 ) ) ( not ( = ?auto_67819 ?auto_67821 ) ) ( not ( = ?auto_67819 ?auto_67820 ) ) ( not ( = ?auto_67819 ?auto_67818 ) ) ( not ( = ?auto_67819 ?auto_67817 ) ) ( not ( = ?auto_67822 ?auto_67821 ) ) ( not ( = ?auto_67822 ?auto_67820 ) ) ( not ( = ?auto_67822 ?auto_67818 ) ) ( not ( = ?auto_67822 ?auto_67817 ) ) ( not ( = ?auto_67821 ?auto_67820 ) ) ( not ( = ?auto_67821 ?auto_67818 ) ) ( not ( = ?auto_67821 ?auto_67817 ) ) ( not ( = ?auto_67816 ?auto_67819 ) ) ( not ( = ?auto_67816 ?auto_67822 ) ) ( not ( = ?auto_67816 ?auto_67821 ) ) ( ON ?auto_67816 ?auto_67823 ) ( not ( = ?auto_67816 ?auto_67823 ) ) ( not ( = ?auto_67817 ?auto_67823 ) ) ( not ( = ?auto_67818 ?auto_67823 ) ) ( not ( = ?auto_67820 ?auto_67823 ) ) ( not ( = ?auto_67819 ?auto_67823 ) ) ( not ( = ?auto_67822 ?auto_67823 ) ) ( not ( = ?auto_67821 ?auto_67823 ) ) ( ON ?auto_67817 ?auto_67816 ) ( ON-TABLE ?auto_67823 ) ( ON ?auto_67818 ?auto_67817 ) ( CLEAR ?auto_67818 ) ( HOLDING ?auto_67820 ) ( CLEAR ?auto_67821 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67819 ?auto_67822 ?auto_67821 ?auto_67820 )
      ( MAKE-3PILE ?auto_67816 ?auto_67817 ?auto_67818 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67824 - BLOCK
      ?auto_67825 - BLOCK
      ?auto_67826 - BLOCK
    )
    :vars
    (
      ?auto_67828 - BLOCK
      ?auto_67831 - BLOCK
      ?auto_67827 - BLOCK
      ?auto_67830 - BLOCK
      ?auto_67829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67824 ?auto_67825 ) ) ( not ( = ?auto_67824 ?auto_67826 ) ) ( not ( = ?auto_67825 ?auto_67826 ) ) ( not ( = ?auto_67824 ?auto_67828 ) ) ( not ( = ?auto_67825 ?auto_67828 ) ) ( not ( = ?auto_67826 ?auto_67828 ) ) ( ON-TABLE ?auto_67831 ) ( ON ?auto_67827 ?auto_67831 ) ( ON ?auto_67830 ?auto_67827 ) ( not ( = ?auto_67831 ?auto_67827 ) ) ( not ( = ?auto_67831 ?auto_67830 ) ) ( not ( = ?auto_67831 ?auto_67828 ) ) ( not ( = ?auto_67831 ?auto_67826 ) ) ( not ( = ?auto_67831 ?auto_67825 ) ) ( not ( = ?auto_67827 ?auto_67830 ) ) ( not ( = ?auto_67827 ?auto_67828 ) ) ( not ( = ?auto_67827 ?auto_67826 ) ) ( not ( = ?auto_67827 ?auto_67825 ) ) ( not ( = ?auto_67830 ?auto_67828 ) ) ( not ( = ?auto_67830 ?auto_67826 ) ) ( not ( = ?auto_67830 ?auto_67825 ) ) ( not ( = ?auto_67824 ?auto_67831 ) ) ( not ( = ?auto_67824 ?auto_67827 ) ) ( not ( = ?auto_67824 ?auto_67830 ) ) ( ON ?auto_67824 ?auto_67829 ) ( not ( = ?auto_67824 ?auto_67829 ) ) ( not ( = ?auto_67825 ?auto_67829 ) ) ( not ( = ?auto_67826 ?auto_67829 ) ) ( not ( = ?auto_67828 ?auto_67829 ) ) ( not ( = ?auto_67831 ?auto_67829 ) ) ( not ( = ?auto_67827 ?auto_67829 ) ) ( not ( = ?auto_67830 ?auto_67829 ) ) ( ON ?auto_67825 ?auto_67824 ) ( ON-TABLE ?auto_67829 ) ( ON ?auto_67826 ?auto_67825 ) ( CLEAR ?auto_67830 ) ( ON ?auto_67828 ?auto_67826 ) ( CLEAR ?auto_67828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67829 ?auto_67824 ?auto_67825 ?auto_67826 )
      ( MAKE-3PILE ?auto_67824 ?auto_67825 ?auto_67826 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67832 - BLOCK
      ?auto_67833 - BLOCK
      ?auto_67834 - BLOCK
    )
    :vars
    (
      ?auto_67837 - BLOCK
      ?auto_67839 - BLOCK
      ?auto_67835 - BLOCK
      ?auto_67836 - BLOCK
      ?auto_67838 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67832 ?auto_67833 ) ) ( not ( = ?auto_67832 ?auto_67834 ) ) ( not ( = ?auto_67833 ?auto_67834 ) ) ( not ( = ?auto_67832 ?auto_67837 ) ) ( not ( = ?auto_67833 ?auto_67837 ) ) ( not ( = ?auto_67834 ?auto_67837 ) ) ( ON-TABLE ?auto_67839 ) ( ON ?auto_67835 ?auto_67839 ) ( not ( = ?auto_67839 ?auto_67835 ) ) ( not ( = ?auto_67839 ?auto_67836 ) ) ( not ( = ?auto_67839 ?auto_67837 ) ) ( not ( = ?auto_67839 ?auto_67834 ) ) ( not ( = ?auto_67839 ?auto_67833 ) ) ( not ( = ?auto_67835 ?auto_67836 ) ) ( not ( = ?auto_67835 ?auto_67837 ) ) ( not ( = ?auto_67835 ?auto_67834 ) ) ( not ( = ?auto_67835 ?auto_67833 ) ) ( not ( = ?auto_67836 ?auto_67837 ) ) ( not ( = ?auto_67836 ?auto_67834 ) ) ( not ( = ?auto_67836 ?auto_67833 ) ) ( not ( = ?auto_67832 ?auto_67839 ) ) ( not ( = ?auto_67832 ?auto_67835 ) ) ( not ( = ?auto_67832 ?auto_67836 ) ) ( ON ?auto_67832 ?auto_67838 ) ( not ( = ?auto_67832 ?auto_67838 ) ) ( not ( = ?auto_67833 ?auto_67838 ) ) ( not ( = ?auto_67834 ?auto_67838 ) ) ( not ( = ?auto_67837 ?auto_67838 ) ) ( not ( = ?auto_67839 ?auto_67838 ) ) ( not ( = ?auto_67835 ?auto_67838 ) ) ( not ( = ?auto_67836 ?auto_67838 ) ) ( ON ?auto_67833 ?auto_67832 ) ( ON-TABLE ?auto_67838 ) ( ON ?auto_67834 ?auto_67833 ) ( ON ?auto_67837 ?auto_67834 ) ( CLEAR ?auto_67837 ) ( HOLDING ?auto_67836 ) ( CLEAR ?auto_67835 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67839 ?auto_67835 ?auto_67836 )
      ( MAKE-3PILE ?auto_67832 ?auto_67833 ?auto_67834 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67840 - BLOCK
      ?auto_67841 - BLOCK
      ?auto_67842 - BLOCK
    )
    :vars
    (
      ?auto_67846 - BLOCK
      ?auto_67847 - BLOCK
      ?auto_67844 - BLOCK
      ?auto_67843 - BLOCK
      ?auto_67845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67840 ?auto_67841 ) ) ( not ( = ?auto_67840 ?auto_67842 ) ) ( not ( = ?auto_67841 ?auto_67842 ) ) ( not ( = ?auto_67840 ?auto_67846 ) ) ( not ( = ?auto_67841 ?auto_67846 ) ) ( not ( = ?auto_67842 ?auto_67846 ) ) ( ON-TABLE ?auto_67847 ) ( ON ?auto_67844 ?auto_67847 ) ( not ( = ?auto_67847 ?auto_67844 ) ) ( not ( = ?auto_67847 ?auto_67843 ) ) ( not ( = ?auto_67847 ?auto_67846 ) ) ( not ( = ?auto_67847 ?auto_67842 ) ) ( not ( = ?auto_67847 ?auto_67841 ) ) ( not ( = ?auto_67844 ?auto_67843 ) ) ( not ( = ?auto_67844 ?auto_67846 ) ) ( not ( = ?auto_67844 ?auto_67842 ) ) ( not ( = ?auto_67844 ?auto_67841 ) ) ( not ( = ?auto_67843 ?auto_67846 ) ) ( not ( = ?auto_67843 ?auto_67842 ) ) ( not ( = ?auto_67843 ?auto_67841 ) ) ( not ( = ?auto_67840 ?auto_67847 ) ) ( not ( = ?auto_67840 ?auto_67844 ) ) ( not ( = ?auto_67840 ?auto_67843 ) ) ( ON ?auto_67840 ?auto_67845 ) ( not ( = ?auto_67840 ?auto_67845 ) ) ( not ( = ?auto_67841 ?auto_67845 ) ) ( not ( = ?auto_67842 ?auto_67845 ) ) ( not ( = ?auto_67846 ?auto_67845 ) ) ( not ( = ?auto_67847 ?auto_67845 ) ) ( not ( = ?auto_67844 ?auto_67845 ) ) ( not ( = ?auto_67843 ?auto_67845 ) ) ( ON ?auto_67841 ?auto_67840 ) ( ON-TABLE ?auto_67845 ) ( ON ?auto_67842 ?auto_67841 ) ( ON ?auto_67846 ?auto_67842 ) ( CLEAR ?auto_67844 ) ( ON ?auto_67843 ?auto_67846 ) ( CLEAR ?auto_67843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67845 ?auto_67840 ?auto_67841 ?auto_67842 ?auto_67846 )
      ( MAKE-3PILE ?auto_67840 ?auto_67841 ?auto_67842 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67848 - BLOCK
      ?auto_67849 - BLOCK
      ?auto_67850 - BLOCK
    )
    :vars
    (
      ?auto_67851 - BLOCK
      ?auto_67853 - BLOCK
      ?auto_67854 - BLOCK
      ?auto_67855 - BLOCK
      ?auto_67852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67848 ?auto_67849 ) ) ( not ( = ?auto_67848 ?auto_67850 ) ) ( not ( = ?auto_67849 ?auto_67850 ) ) ( not ( = ?auto_67848 ?auto_67851 ) ) ( not ( = ?auto_67849 ?auto_67851 ) ) ( not ( = ?auto_67850 ?auto_67851 ) ) ( ON-TABLE ?auto_67853 ) ( not ( = ?auto_67853 ?auto_67854 ) ) ( not ( = ?auto_67853 ?auto_67855 ) ) ( not ( = ?auto_67853 ?auto_67851 ) ) ( not ( = ?auto_67853 ?auto_67850 ) ) ( not ( = ?auto_67853 ?auto_67849 ) ) ( not ( = ?auto_67854 ?auto_67855 ) ) ( not ( = ?auto_67854 ?auto_67851 ) ) ( not ( = ?auto_67854 ?auto_67850 ) ) ( not ( = ?auto_67854 ?auto_67849 ) ) ( not ( = ?auto_67855 ?auto_67851 ) ) ( not ( = ?auto_67855 ?auto_67850 ) ) ( not ( = ?auto_67855 ?auto_67849 ) ) ( not ( = ?auto_67848 ?auto_67853 ) ) ( not ( = ?auto_67848 ?auto_67854 ) ) ( not ( = ?auto_67848 ?auto_67855 ) ) ( ON ?auto_67848 ?auto_67852 ) ( not ( = ?auto_67848 ?auto_67852 ) ) ( not ( = ?auto_67849 ?auto_67852 ) ) ( not ( = ?auto_67850 ?auto_67852 ) ) ( not ( = ?auto_67851 ?auto_67852 ) ) ( not ( = ?auto_67853 ?auto_67852 ) ) ( not ( = ?auto_67854 ?auto_67852 ) ) ( not ( = ?auto_67855 ?auto_67852 ) ) ( ON ?auto_67849 ?auto_67848 ) ( ON-TABLE ?auto_67852 ) ( ON ?auto_67850 ?auto_67849 ) ( ON ?auto_67851 ?auto_67850 ) ( ON ?auto_67855 ?auto_67851 ) ( CLEAR ?auto_67855 ) ( HOLDING ?auto_67854 ) ( CLEAR ?auto_67853 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67853 ?auto_67854 )
      ( MAKE-3PILE ?auto_67848 ?auto_67849 ?auto_67850 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67856 - BLOCK
      ?auto_67857 - BLOCK
      ?auto_67858 - BLOCK
    )
    :vars
    (
      ?auto_67861 - BLOCK
      ?auto_67860 - BLOCK
      ?auto_67859 - BLOCK
      ?auto_67863 - BLOCK
      ?auto_67862 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67856 ?auto_67857 ) ) ( not ( = ?auto_67856 ?auto_67858 ) ) ( not ( = ?auto_67857 ?auto_67858 ) ) ( not ( = ?auto_67856 ?auto_67861 ) ) ( not ( = ?auto_67857 ?auto_67861 ) ) ( not ( = ?auto_67858 ?auto_67861 ) ) ( ON-TABLE ?auto_67860 ) ( not ( = ?auto_67860 ?auto_67859 ) ) ( not ( = ?auto_67860 ?auto_67863 ) ) ( not ( = ?auto_67860 ?auto_67861 ) ) ( not ( = ?auto_67860 ?auto_67858 ) ) ( not ( = ?auto_67860 ?auto_67857 ) ) ( not ( = ?auto_67859 ?auto_67863 ) ) ( not ( = ?auto_67859 ?auto_67861 ) ) ( not ( = ?auto_67859 ?auto_67858 ) ) ( not ( = ?auto_67859 ?auto_67857 ) ) ( not ( = ?auto_67863 ?auto_67861 ) ) ( not ( = ?auto_67863 ?auto_67858 ) ) ( not ( = ?auto_67863 ?auto_67857 ) ) ( not ( = ?auto_67856 ?auto_67860 ) ) ( not ( = ?auto_67856 ?auto_67859 ) ) ( not ( = ?auto_67856 ?auto_67863 ) ) ( ON ?auto_67856 ?auto_67862 ) ( not ( = ?auto_67856 ?auto_67862 ) ) ( not ( = ?auto_67857 ?auto_67862 ) ) ( not ( = ?auto_67858 ?auto_67862 ) ) ( not ( = ?auto_67861 ?auto_67862 ) ) ( not ( = ?auto_67860 ?auto_67862 ) ) ( not ( = ?auto_67859 ?auto_67862 ) ) ( not ( = ?auto_67863 ?auto_67862 ) ) ( ON ?auto_67857 ?auto_67856 ) ( ON-TABLE ?auto_67862 ) ( ON ?auto_67858 ?auto_67857 ) ( ON ?auto_67861 ?auto_67858 ) ( ON ?auto_67863 ?auto_67861 ) ( CLEAR ?auto_67860 ) ( ON ?auto_67859 ?auto_67863 ) ( CLEAR ?auto_67859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67862 ?auto_67856 ?auto_67857 ?auto_67858 ?auto_67861 ?auto_67863 )
      ( MAKE-3PILE ?auto_67856 ?auto_67857 ?auto_67858 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67864 - BLOCK
      ?auto_67865 - BLOCK
      ?auto_67866 - BLOCK
    )
    :vars
    (
      ?auto_67868 - BLOCK
      ?auto_67871 - BLOCK
      ?auto_67869 - BLOCK
      ?auto_67867 - BLOCK
      ?auto_67870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67864 ?auto_67865 ) ) ( not ( = ?auto_67864 ?auto_67866 ) ) ( not ( = ?auto_67865 ?auto_67866 ) ) ( not ( = ?auto_67864 ?auto_67868 ) ) ( not ( = ?auto_67865 ?auto_67868 ) ) ( not ( = ?auto_67866 ?auto_67868 ) ) ( not ( = ?auto_67871 ?auto_67869 ) ) ( not ( = ?auto_67871 ?auto_67867 ) ) ( not ( = ?auto_67871 ?auto_67868 ) ) ( not ( = ?auto_67871 ?auto_67866 ) ) ( not ( = ?auto_67871 ?auto_67865 ) ) ( not ( = ?auto_67869 ?auto_67867 ) ) ( not ( = ?auto_67869 ?auto_67868 ) ) ( not ( = ?auto_67869 ?auto_67866 ) ) ( not ( = ?auto_67869 ?auto_67865 ) ) ( not ( = ?auto_67867 ?auto_67868 ) ) ( not ( = ?auto_67867 ?auto_67866 ) ) ( not ( = ?auto_67867 ?auto_67865 ) ) ( not ( = ?auto_67864 ?auto_67871 ) ) ( not ( = ?auto_67864 ?auto_67869 ) ) ( not ( = ?auto_67864 ?auto_67867 ) ) ( ON ?auto_67864 ?auto_67870 ) ( not ( = ?auto_67864 ?auto_67870 ) ) ( not ( = ?auto_67865 ?auto_67870 ) ) ( not ( = ?auto_67866 ?auto_67870 ) ) ( not ( = ?auto_67868 ?auto_67870 ) ) ( not ( = ?auto_67871 ?auto_67870 ) ) ( not ( = ?auto_67869 ?auto_67870 ) ) ( not ( = ?auto_67867 ?auto_67870 ) ) ( ON ?auto_67865 ?auto_67864 ) ( ON-TABLE ?auto_67870 ) ( ON ?auto_67866 ?auto_67865 ) ( ON ?auto_67868 ?auto_67866 ) ( ON ?auto_67867 ?auto_67868 ) ( ON ?auto_67869 ?auto_67867 ) ( CLEAR ?auto_67869 ) ( HOLDING ?auto_67871 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67871 )
      ( MAKE-3PILE ?auto_67864 ?auto_67865 ?auto_67866 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67872 - BLOCK
      ?auto_67873 - BLOCK
      ?auto_67874 - BLOCK
    )
    :vars
    (
      ?auto_67879 - BLOCK
      ?auto_67875 - BLOCK
      ?auto_67877 - BLOCK
      ?auto_67878 - BLOCK
      ?auto_67876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67872 ?auto_67873 ) ) ( not ( = ?auto_67872 ?auto_67874 ) ) ( not ( = ?auto_67873 ?auto_67874 ) ) ( not ( = ?auto_67872 ?auto_67879 ) ) ( not ( = ?auto_67873 ?auto_67879 ) ) ( not ( = ?auto_67874 ?auto_67879 ) ) ( not ( = ?auto_67875 ?auto_67877 ) ) ( not ( = ?auto_67875 ?auto_67878 ) ) ( not ( = ?auto_67875 ?auto_67879 ) ) ( not ( = ?auto_67875 ?auto_67874 ) ) ( not ( = ?auto_67875 ?auto_67873 ) ) ( not ( = ?auto_67877 ?auto_67878 ) ) ( not ( = ?auto_67877 ?auto_67879 ) ) ( not ( = ?auto_67877 ?auto_67874 ) ) ( not ( = ?auto_67877 ?auto_67873 ) ) ( not ( = ?auto_67878 ?auto_67879 ) ) ( not ( = ?auto_67878 ?auto_67874 ) ) ( not ( = ?auto_67878 ?auto_67873 ) ) ( not ( = ?auto_67872 ?auto_67875 ) ) ( not ( = ?auto_67872 ?auto_67877 ) ) ( not ( = ?auto_67872 ?auto_67878 ) ) ( ON ?auto_67872 ?auto_67876 ) ( not ( = ?auto_67872 ?auto_67876 ) ) ( not ( = ?auto_67873 ?auto_67876 ) ) ( not ( = ?auto_67874 ?auto_67876 ) ) ( not ( = ?auto_67879 ?auto_67876 ) ) ( not ( = ?auto_67875 ?auto_67876 ) ) ( not ( = ?auto_67877 ?auto_67876 ) ) ( not ( = ?auto_67878 ?auto_67876 ) ) ( ON ?auto_67873 ?auto_67872 ) ( ON-TABLE ?auto_67876 ) ( ON ?auto_67874 ?auto_67873 ) ( ON ?auto_67879 ?auto_67874 ) ( ON ?auto_67878 ?auto_67879 ) ( ON ?auto_67877 ?auto_67878 ) ( ON ?auto_67875 ?auto_67877 ) ( CLEAR ?auto_67875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_67876 ?auto_67872 ?auto_67873 ?auto_67874 ?auto_67879 ?auto_67878 ?auto_67877 )
      ( MAKE-3PILE ?auto_67872 ?auto_67873 ?auto_67874 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67899 - BLOCK
      ?auto_67900 - BLOCK
      ?auto_67901 - BLOCK
    )
    :vars
    (
      ?auto_67903 - BLOCK
      ?auto_67904 - BLOCK
      ?auto_67902 - BLOCK
      ?auto_67905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67903 ?auto_67901 ) ( ON-TABLE ?auto_67899 ) ( ON ?auto_67900 ?auto_67899 ) ( ON ?auto_67901 ?auto_67900 ) ( not ( = ?auto_67899 ?auto_67900 ) ) ( not ( = ?auto_67899 ?auto_67901 ) ) ( not ( = ?auto_67899 ?auto_67903 ) ) ( not ( = ?auto_67900 ?auto_67901 ) ) ( not ( = ?auto_67900 ?auto_67903 ) ) ( not ( = ?auto_67901 ?auto_67903 ) ) ( not ( = ?auto_67899 ?auto_67904 ) ) ( not ( = ?auto_67899 ?auto_67902 ) ) ( not ( = ?auto_67900 ?auto_67904 ) ) ( not ( = ?auto_67900 ?auto_67902 ) ) ( not ( = ?auto_67901 ?auto_67904 ) ) ( not ( = ?auto_67901 ?auto_67902 ) ) ( not ( = ?auto_67903 ?auto_67904 ) ) ( not ( = ?auto_67903 ?auto_67902 ) ) ( not ( = ?auto_67904 ?auto_67902 ) ) ( ON ?auto_67904 ?auto_67903 ) ( CLEAR ?auto_67904 ) ( HOLDING ?auto_67902 ) ( CLEAR ?auto_67905 ) ( ON-TABLE ?auto_67905 ) ( not ( = ?auto_67905 ?auto_67902 ) ) ( not ( = ?auto_67899 ?auto_67905 ) ) ( not ( = ?auto_67900 ?auto_67905 ) ) ( not ( = ?auto_67901 ?auto_67905 ) ) ( not ( = ?auto_67903 ?auto_67905 ) ) ( not ( = ?auto_67904 ?auto_67905 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67905 ?auto_67902 )
      ( MAKE-3PILE ?auto_67899 ?auto_67900 ?auto_67901 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67906 - BLOCK
      ?auto_67907 - BLOCK
      ?auto_67908 - BLOCK
    )
    :vars
    (
      ?auto_67912 - BLOCK
      ?auto_67910 - BLOCK
      ?auto_67909 - BLOCK
      ?auto_67911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67912 ?auto_67908 ) ( ON-TABLE ?auto_67906 ) ( ON ?auto_67907 ?auto_67906 ) ( ON ?auto_67908 ?auto_67907 ) ( not ( = ?auto_67906 ?auto_67907 ) ) ( not ( = ?auto_67906 ?auto_67908 ) ) ( not ( = ?auto_67906 ?auto_67912 ) ) ( not ( = ?auto_67907 ?auto_67908 ) ) ( not ( = ?auto_67907 ?auto_67912 ) ) ( not ( = ?auto_67908 ?auto_67912 ) ) ( not ( = ?auto_67906 ?auto_67910 ) ) ( not ( = ?auto_67906 ?auto_67909 ) ) ( not ( = ?auto_67907 ?auto_67910 ) ) ( not ( = ?auto_67907 ?auto_67909 ) ) ( not ( = ?auto_67908 ?auto_67910 ) ) ( not ( = ?auto_67908 ?auto_67909 ) ) ( not ( = ?auto_67912 ?auto_67910 ) ) ( not ( = ?auto_67912 ?auto_67909 ) ) ( not ( = ?auto_67910 ?auto_67909 ) ) ( ON ?auto_67910 ?auto_67912 ) ( CLEAR ?auto_67911 ) ( ON-TABLE ?auto_67911 ) ( not ( = ?auto_67911 ?auto_67909 ) ) ( not ( = ?auto_67906 ?auto_67911 ) ) ( not ( = ?auto_67907 ?auto_67911 ) ) ( not ( = ?auto_67908 ?auto_67911 ) ) ( not ( = ?auto_67912 ?auto_67911 ) ) ( not ( = ?auto_67910 ?auto_67911 ) ) ( ON ?auto_67909 ?auto_67910 ) ( CLEAR ?auto_67909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67906 ?auto_67907 ?auto_67908 ?auto_67912 ?auto_67910 )
      ( MAKE-3PILE ?auto_67906 ?auto_67907 ?auto_67908 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67913 - BLOCK
      ?auto_67914 - BLOCK
      ?auto_67915 - BLOCK
    )
    :vars
    (
      ?auto_67919 - BLOCK
      ?auto_67916 - BLOCK
      ?auto_67917 - BLOCK
      ?auto_67918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67919 ?auto_67915 ) ( ON-TABLE ?auto_67913 ) ( ON ?auto_67914 ?auto_67913 ) ( ON ?auto_67915 ?auto_67914 ) ( not ( = ?auto_67913 ?auto_67914 ) ) ( not ( = ?auto_67913 ?auto_67915 ) ) ( not ( = ?auto_67913 ?auto_67919 ) ) ( not ( = ?auto_67914 ?auto_67915 ) ) ( not ( = ?auto_67914 ?auto_67919 ) ) ( not ( = ?auto_67915 ?auto_67919 ) ) ( not ( = ?auto_67913 ?auto_67916 ) ) ( not ( = ?auto_67913 ?auto_67917 ) ) ( not ( = ?auto_67914 ?auto_67916 ) ) ( not ( = ?auto_67914 ?auto_67917 ) ) ( not ( = ?auto_67915 ?auto_67916 ) ) ( not ( = ?auto_67915 ?auto_67917 ) ) ( not ( = ?auto_67919 ?auto_67916 ) ) ( not ( = ?auto_67919 ?auto_67917 ) ) ( not ( = ?auto_67916 ?auto_67917 ) ) ( ON ?auto_67916 ?auto_67919 ) ( not ( = ?auto_67918 ?auto_67917 ) ) ( not ( = ?auto_67913 ?auto_67918 ) ) ( not ( = ?auto_67914 ?auto_67918 ) ) ( not ( = ?auto_67915 ?auto_67918 ) ) ( not ( = ?auto_67919 ?auto_67918 ) ) ( not ( = ?auto_67916 ?auto_67918 ) ) ( ON ?auto_67917 ?auto_67916 ) ( CLEAR ?auto_67917 ) ( HOLDING ?auto_67918 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67918 )
      ( MAKE-3PILE ?auto_67913 ?auto_67914 ?auto_67915 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67930 - BLOCK
      ?auto_67931 - BLOCK
      ?auto_67932 - BLOCK
    )
    :vars
    (
      ?auto_67933 - BLOCK
      ?auto_67934 - BLOCK
      ?auto_67936 - BLOCK
      ?auto_67935 - BLOCK
      ?auto_67937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67933 ?auto_67932 ) ( ON-TABLE ?auto_67930 ) ( ON ?auto_67931 ?auto_67930 ) ( ON ?auto_67932 ?auto_67931 ) ( not ( = ?auto_67930 ?auto_67931 ) ) ( not ( = ?auto_67930 ?auto_67932 ) ) ( not ( = ?auto_67930 ?auto_67933 ) ) ( not ( = ?auto_67931 ?auto_67932 ) ) ( not ( = ?auto_67931 ?auto_67933 ) ) ( not ( = ?auto_67932 ?auto_67933 ) ) ( not ( = ?auto_67930 ?auto_67934 ) ) ( not ( = ?auto_67930 ?auto_67936 ) ) ( not ( = ?auto_67931 ?auto_67934 ) ) ( not ( = ?auto_67931 ?auto_67936 ) ) ( not ( = ?auto_67932 ?auto_67934 ) ) ( not ( = ?auto_67932 ?auto_67936 ) ) ( not ( = ?auto_67933 ?auto_67934 ) ) ( not ( = ?auto_67933 ?auto_67936 ) ) ( not ( = ?auto_67934 ?auto_67936 ) ) ( ON ?auto_67934 ?auto_67933 ) ( not ( = ?auto_67935 ?auto_67936 ) ) ( not ( = ?auto_67930 ?auto_67935 ) ) ( not ( = ?auto_67931 ?auto_67935 ) ) ( not ( = ?auto_67932 ?auto_67935 ) ) ( not ( = ?auto_67933 ?auto_67935 ) ) ( not ( = ?auto_67934 ?auto_67935 ) ) ( ON ?auto_67936 ?auto_67934 ) ( CLEAR ?auto_67936 ) ( ON ?auto_67935 ?auto_67937 ) ( CLEAR ?auto_67935 ) ( HAND-EMPTY ) ( not ( = ?auto_67930 ?auto_67937 ) ) ( not ( = ?auto_67931 ?auto_67937 ) ) ( not ( = ?auto_67932 ?auto_67937 ) ) ( not ( = ?auto_67933 ?auto_67937 ) ) ( not ( = ?auto_67934 ?auto_67937 ) ) ( not ( = ?auto_67936 ?auto_67937 ) ) ( not ( = ?auto_67935 ?auto_67937 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67935 ?auto_67937 )
      ( MAKE-3PILE ?auto_67930 ?auto_67931 ?auto_67932 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67938 - BLOCK
      ?auto_67939 - BLOCK
      ?auto_67940 - BLOCK
    )
    :vars
    (
      ?auto_67944 - BLOCK
      ?auto_67945 - BLOCK
      ?auto_67942 - BLOCK
      ?auto_67941 - BLOCK
      ?auto_67943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67944 ?auto_67940 ) ( ON-TABLE ?auto_67938 ) ( ON ?auto_67939 ?auto_67938 ) ( ON ?auto_67940 ?auto_67939 ) ( not ( = ?auto_67938 ?auto_67939 ) ) ( not ( = ?auto_67938 ?auto_67940 ) ) ( not ( = ?auto_67938 ?auto_67944 ) ) ( not ( = ?auto_67939 ?auto_67940 ) ) ( not ( = ?auto_67939 ?auto_67944 ) ) ( not ( = ?auto_67940 ?auto_67944 ) ) ( not ( = ?auto_67938 ?auto_67945 ) ) ( not ( = ?auto_67938 ?auto_67942 ) ) ( not ( = ?auto_67939 ?auto_67945 ) ) ( not ( = ?auto_67939 ?auto_67942 ) ) ( not ( = ?auto_67940 ?auto_67945 ) ) ( not ( = ?auto_67940 ?auto_67942 ) ) ( not ( = ?auto_67944 ?auto_67945 ) ) ( not ( = ?auto_67944 ?auto_67942 ) ) ( not ( = ?auto_67945 ?auto_67942 ) ) ( ON ?auto_67945 ?auto_67944 ) ( not ( = ?auto_67941 ?auto_67942 ) ) ( not ( = ?auto_67938 ?auto_67941 ) ) ( not ( = ?auto_67939 ?auto_67941 ) ) ( not ( = ?auto_67940 ?auto_67941 ) ) ( not ( = ?auto_67944 ?auto_67941 ) ) ( not ( = ?auto_67945 ?auto_67941 ) ) ( ON ?auto_67941 ?auto_67943 ) ( CLEAR ?auto_67941 ) ( not ( = ?auto_67938 ?auto_67943 ) ) ( not ( = ?auto_67939 ?auto_67943 ) ) ( not ( = ?auto_67940 ?auto_67943 ) ) ( not ( = ?auto_67944 ?auto_67943 ) ) ( not ( = ?auto_67945 ?auto_67943 ) ) ( not ( = ?auto_67942 ?auto_67943 ) ) ( not ( = ?auto_67941 ?auto_67943 ) ) ( HOLDING ?auto_67942 ) ( CLEAR ?auto_67945 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67938 ?auto_67939 ?auto_67940 ?auto_67944 ?auto_67945 ?auto_67942 )
      ( MAKE-3PILE ?auto_67938 ?auto_67939 ?auto_67940 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68000 - BLOCK
      ?auto_68001 - BLOCK
      ?auto_68002 - BLOCK
      ?auto_68003 - BLOCK
    )
    :vars
    (
      ?auto_68004 - BLOCK
      ?auto_68006 - BLOCK
      ?auto_68005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68000 ) ( ON ?auto_68001 ?auto_68000 ) ( not ( = ?auto_68000 ?auto_68001 ) ) ( not ( = ?auto_68000 ?auto_68002 ) ) ( not ( = ?auto_68000 ?auto_68003 ) ) ( not ( = ?auto_68001 ?auto_68002 ) ) ( not ( = ?auto_68001 ?auto_68003 ) ) ( not ( = ?auto_68002 ?auto_68003 ) ) ( ON ?auto_68003 ?auto_68004 ) ( not ( = ?auto_68000 ?auto_68004 ) ) ( not ( = ?auto_68001 ?auto_68004 ) ) ( not ( = ?auto_68002 ?auto_68004 ) ) ( not ( = ?auto_68003 ?auto_68004 ) ) ( CLEAR ?auto_68001 ) ( ON ?auto_68002 ?auto_68003 ) ( CLEAR ?auto_68002 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68006 ) ( ON ?auto_68005 ?auto_68006 ) ( ON ?auto_68004 ?auto_68005 ) ( not ( = ?auto_68006 ?auto_68005 ) ) ( not ( = ?auto_68006 ?auto_68004 ) ) ( not ( = ?auto_68006 ?auto_68003 ) ) ( not ( = ?auto_68006 ?auto_68002 ) ) ( not ( = ?auto_68005 ?auto_68004 ) ) ( not ( = ?auto_68005 ?auto_68003 ) ) ( not ( = ?auto_68005 ?auto_68002 ) ) ( not ( = ?auto_68000 ?auto_68006 ) ) ( not ( = ?auto_68000 ?auto_68005 ) ) ( not ( = ?auto_68001 ?auto_68006 ) ) ( not ( = ?auto_68001 ?auto_68005 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68006 ?auto_68005 ?auto_68004 ?auto_68003 )
      ( MAKE-4PILE ?auto_68000 ?auto_68001 ?auto_68002 ?auto_68003 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68007 - BLOCK
      ?auto_68008 - BLOCK
      ?auto_68009 - BLOCK
      ?auto_68010 - BLOCK
    )
    :vars
    (
      ?auto_68013 - BLOCK
      ?auto_68011 - BLOCK
      ?auto_68012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68007 ) ( not ( = ?auto_68007 ?auto_68008 ) ) ( not ( = ?auto_68007 ?auto_68009 ) ) ( not ( = ?auto_68007 ?auto_68010 ) ) ( not ( = ?auto_68008 ?auto_68009 ) ) ( not ( = ?auto_68008 ?auto_68010 ) ) ( not ( = ?auto_68009 ?auto_68010 ) ) ( ON ?auto_68010 ?auto_68013 ) ( not ( = ?auto_68007 ?auto_68013 ) ) ( not ( = ?auto_68008 ?auto_68013 ) ) ( not ( = ?auto_68009 ?auto_68013 ) ) ( not ( = ?auto_68010 ?auto_68013 ) ) ( ON ?auto_68009 ?auto_68010 ) ( CLEAR ?auto_68009 ) ( ON-TABLE ?auto_68011 ) ( ON ?auto_68012 ?auto_68011 ) ( ON ?auto_68013 ?auto_68012 ) ( not ( = ?auto_68011 ?auto_68012 ) ) ( not ( = ?auto_68011 ?auto_68013 ) ) ( not ( = ?auto_68011 ?auto_68010 ) ) ( not ( = ?auto_68011 ?auto_68009 ) ) ( not ( = ?auto_68012 ?auto_68013 ) ) ( not ( = ?auto_68012 ?auto_68010 ) ) ( not ( = ?auto_68012 ?auto_68009 ) ) ( not ( = ?auto_68007 ?auto_68011 ) ) ( not ( = ?auto_68007 ?auto_68012 ) ) ( not ( = ?auto_68008 ?auto_68011 ) ) ( not ( = ?auto_68008 ?auto_68012 ) ) ( HOLDING ?auto_68008 ) ( CLEAR ?auto_68007 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68007 ?auto_68008 )
      ( MAKE-4PILE ?auto_68007 ?auto_68008 ?auto_68009 ?auto_68010 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68014 - BLOCK
      ?auto_68015 - BLOCK
      ?auto_68016 - BLOCK
      ?auto_68017 - BLOCK
    )
    :vars
    (
      ?auto_68020 - BLOCK
      ?auto_68018 - BLOCK
      ?auto_68019 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68014 ) ( not ( = ?auto_68014 ?auto_68015 ) ) ( not ( = ?auto_68014 ?auto_68016 ) ) ( not ( = ?auto_68014 ?auto_68017 ) ) ( not ( = ?auto_68015 ?auto_68016 ) ) ( not ( = ?auto_68015 ?auto_68017 ) ) ( not ( = ?auto_68016 ?auto_68017 ) ) ( ON ?auto_68017 ?auto_68020 ) ( not ( = ?auto_68014 ?auto_68020 ) ) ( not ( = ?auto_68015 ?auto_68020 ) ) ( not ( = ?auto_68016 ?auto_68020 ) ) ( not ( = ?auto_68017 ?auto_68020 ) ) ( ON ?auto_68016 ?auto_68017 ) ( ON-TABLE ?auto_68018 ) ( ON ?auto_68019 ?auto_68018 ) ( ON ?auto_68020 ?auto_68019 ) ( not ( = ?auto_68018 ?auto_68019 ) ) ( not ( = ?auto_68018 ?auto_68020 ) ) ( not ( = ?auto_68018 ?auto_68017 ) ) ( not ( = ?auto_68018 ?auto_68016 ) ) ( not ( = ?auto_68019 ?auto_68020 ) ) ( not ( = ?auto_68019 ?auto_68017 ) ) ( not ( = ?auto_68019 ?auto_68016 ) ) ( not ( = ?auto_68014 ?auto_68018 ) ) ( not ( = ?auto_68014 ?auto_68019 ) ) ( not ( = ?auto_68015 ?auto_68018 ) ) ( not ( = ?auto_68015 ?auto_68019 ) ) ( CLEAR ?auto_68014 ) ( ON ?auto_68015 ?auto_68016 ) ( CLEAR ?auto_68015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68018 ?auto_68019 ?auto_68020 ?auto_68017 ?auto_68016 )
      ( MAKE-4PILE ?auto_68014 ?auto_68015 ?auto_68016 ?auto_68017 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68021 - BLOCK
      ?auto_68022 - BLOCK
      ?auto_68023 - BLOCK
      ?auto_68024 - BLOCK
    )
    :vars
    (
      ?auto_68025 - BLOCK
      ?auto_68027 - BLOCK
      ?auto_68026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68021 ?auto_68022 ) ) ( not ( = ?auto_68021 ?auto_68023 ) ) ( not ( = ?auto_68021 ?auto_68024 ) ) ( not ( = ?auto_68022 ?auto_68023 ) ) ( not ( = ?auto_68022 ?auto_68024 ) ) ( not ( = ?auto_68023 ?auto_68024 ) ) ( ON ?auto_68024 ?auto_68025 ) ( not ( = ?auto_68021 ?auto_68025 ) ) ( not ( = ?auto_68022 ?auto_68025 ) ) ( not ( = ?auto_68023 ?auto_68025 ) ) ( not ( = ?auto_68024 ?auto_68025 ) ) ( ON ?auto_68023 ?auto_68024 ) ( ON-TABLE ?auto_68027 ) ( ON ?auto_68026 ?auto_68027 ) ( ON ?auto_68025 ?auto_68026 ) ( not ( = ?auto_68027 ?auto_68026 ) ) ( not ( = ?auto_68027 ?auto_68025 ) ) ( not ( = ?auto_68027 ?auto_68024 ) ) ( not ( = ?auto_68027 ?auto_68023 ) ) ( not ( = ?auto_68026 ?auto_68025 ) ) ( not ( = ?auto_68026 ?auto_68024 ) ) ( not ( = ?auto_68026 ?auto_68023 ) ) ( not ( = ?auto_68021 ?auto_68027 ) ) ( not ( = ?auto_68021 ?auto_68026 ) ) ( not ( = ?auto_68022 ?auto_68027 ) ) ( not ( = ?auto_68022 ?auto_68026 ) ) ( ON ?auto_68022 ?auto_68023 ) ( CLEAR ?auto_68022 ) ( HOLDING ?auto_68021 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68021 )
      ( MAKE-4PILE ?auto_68021 ?auto_68022 ?auto_68023 ?auto_68024 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68028 - BLOCK
      ?auto_68029 - BLOCK
      ?auto_68030 - BLOCK
      ?auto_68031 - BLOCK
    )
    :vars
    (
      ?auto_68034 - BLOCK
      ?auto_68032 - BLOCK
      ?auto_68033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68028 ?auto_68029 ) ) ( not ( = ?auto_68028 ?auto_68030 ) ) ( not ( = ?auto_68028 ?auto_68031 ) ) ( not ( = ?auto_68029 ?auto_68030 ) ) ( not ( = ?auto_68029 ?auto_68031 ) ) ( not ( = ?auto_68030 ?auto_68031 ) ) ( ON ?auto_68031 ?auto_68034 ) ( not ( = ?auto_68028 ?auto_68034 ) ) ( not ( = ?auto_68029 ?auto_68034 ) ) ( not ( = ?auto_68030 ?auto_68034 ) ) ( not ( = ?auto_68031 ?auto_68034 ) ) ( ON ?auto_68030 ?auto_68031 ) ( ON-TABLE ?auto_68032 ) ( ON ?auto_68033 ?auto_68032 ) ( ON ?auto_68034 ?auto_68033 ) ( not ( = ?auto_68032 ?auto_68033 ) ) ( not ( = ?auto_68032 ?auto_68034 ) ) ( not ( = ?auto_68032 ?auto_68031 ) ) ( not ( = ?auto_68032 ?auto_68030 ) ) ( not ( = ?auto_68033 ?auto_68034 ) ) ( not ( = ?auto_68033 ?auto_68031 ) ) ( not ( = ?auto_68033 ?auto_68030 ) ) ( not ( = ?auto_68028 ?auto_68032 ) ) ( not ( = ?auto_68028 ?auto_68033 ) ) ( not ( = ?auto_68029 ?auto_68032 ) ) ( not ( = ?auto_68029 ?auto_68033 ) ) ( ON ?auto_68029 ?auto_68030 ) ( ON ?auto_68028 ?auto_68029 ) ( CLEAR ?auto_68028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68032 ?auto_68033 ?auto_68034 ?auto_68031 ?auto_68030 ?auto_68029 )
      ( MAKE-4PILE ?auto_68028 ?auto_68029 ?auto_68030 ?auto_68031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68039 - BLOCK
      ?auto_68040 - BLOCK
      ?auto_68041 - BLOCK
      ?auto_68042 - BLOCK
    )
    :vars
    (
      ?auto_68044 - BLOCK
      ?auto_68043 - BLOCK
      ?auto_68045 - BLOCK
      ?auto_68046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68039 ?auto_68040 ) ) ( not ( = ?auto_68039 ?auto_68041 ) ) ( not ( = ?auto_68039 ?auto_68042 ) ) ( not ( = ?auto_68040 ?auto_68041 ) ) ( not ( = ?auto_68040 ?auto_68042 ) ) ( not ( = ?auto_68041 ?auto_68042 ) ) ( ON ?auto_68042 ?auto_68044 ) ( not ( = ?auto_68039 ?auto_68044 ) ) ( not ( = ?auto_68040 ?auto_68044 ) ) ( not ( = ?auto_68041 ?auto_68044 ) ) ( not ( = ?auto_68042 ?auto_68044 ) ) ( ON ?auto_68041 ?auto_68042 ) ( ON-TABLE ?auto_68043 ) ( ON ?auto_68045 ?auto_68043 ) ( ON ?auto_68044 ?auto_68045 ) ( not ( = ?auto_68043 ?auto_68045 ) ) ( not ( = ?auto_68043 ?auto_68044 ) ) ( not ( = ?auto_68043 ?auto_68042 ) ) ( not ( = ?auto_68043 ?auto_68041 ) ) ( not ( = ?auto_68045 ?auto_68044 ) ) ( not ( = ?auto_68045 ?auto_68042 ) ) ( not ( = ?auto_68045 ?auto_68041 ) ) ( not ( = ?auto_68039 ?auto_68043 ) ) ( not ( = ?auto_68039 ?auto_68045 ) ) ( not ( = ?auto_68040 ?auto_68043 ) ) ( not ( = ?auto_68040 ?auto_68045 ) ) ( ON ?auto_68040 ?auto_68041 ) ( CLEAR ?auto_68040 ) ( ON ?auto_68039 ?auto_68046 ) ( CLEAR ?auto_68039 ) ( HAND-EMPTY ) ( not ( = ?auto_68039 ?auto_68046 ) ) ( not ( = ?auto_68040 ?auto_68046 ) ) ( not ( = ?auto_68041 ?auto_68046 ) ) ( not ( = ?auto_68042 ?auto_68046 ) ) ( not ( = ?auto_68044 ?auto_68046 ) ) ( not ( = ?auto_68043 ?auto_68046 ) ) ( not ( = ?auto_68045 ?auto_68046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68039 ?auto_68046 )
      ( MAKE-4PILE ?auto_68039 ?auto_68040 ?auto_68041 ?auto_68042 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68047 - BLOCK
      ?auto_68048 - BLOCK
      ?auto_68049 - BLOCK
      ?auto_68050 - BLOCK
    )
    :vars
    (
      ?auto_68052 - BLOCK
      ?auto_68053 - BLOCK
      ?auto_68054 - BLOCK
      ?auto_68051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68047 ?auto_68048 ) ) ( not ( = ?auto_68047 ?auto_68049 ) ) ( not ( = ?auto_68047 ?auto_68050 ) ) ( not ( = ?auto_68048 ?auto_68049 ) ) ( not ( = ?auto_68048 ?auto_68050 ) ) ( not ( = ?auto_68049 ?auto_68050 ) ) ( ON ?auto_68050 ?auto_68052 ) ( not ( = ?auto_68047 ?auto_68052 ) ) ( not ( = ?auto_68048 ?auto_68052 ) ) ( not ( = ?auto_68049 ?auto_68052 ) ) ( not ( = ?auto_68050 ?auto_68052 ) ) ( ON ?auto_68049 ?auto_68050 ) ( ON-TABLE ?auto_68053 ) ( ON ?auto_68054 ?auto_68053 ) ( ON ?auto_68052 ?auto_68054 ) ( not ( = ?auto_68053 ?auto_68054 ) ) ( not ( = ?auto_68053 ?auto_68052 ) ) ( not ( = ?auto_68053 ?auto_68050 ) ) ( not ( = ?auto_68053 ?auto_68049 ) ) ( not ( = ?auto_68054 ?auto_68052 ) ) ( not ( = ?auto_68054 ?auto_68050 ) ) ( not ( = ?auto_68054 ?auto_68049 ) ) ( not ( = ?auto_68047 ?auto_68053 ) ) ( not ( = ?auto_68047 ?auto_68054 ) ) ( not ( = ?auto_68048 ?auto_68053 ) ) ( not ( = ?auto_68048 ?auto_68054 ) ) ( ON ?auto_68047 ?auto_68051 ) ( CLEAR ?auto_68047 ) ( not ( = ?auto_68047 ?auto_68051 ) ) ( not ( = ?auto_68048 ?auto_68051 ) ) ( not ( = ?auto_68049 ?auto_68051 ) ) ( not ( = ?auto_68050 ?auto_68051 ) ) ( not ( = ?auto_68052 ?auto_68051 ) ) ( not ( = ?auto_68053 ?auto_68051 ) ) ( not ( = ?auto_68054 ?auto_68051 ) ) ( HOLDING ?auto_68048 ) ( CLEAR ?auto_68049 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68053 ?auto_68054 ?auto_68052 ?auto_68050 ?auto_68049 ?auto_68048 )
      ( MAKE-4PILE ?auto_68047 ?auto_68048 ?auto_68049 ?auto_68050 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68055 - BLOCK
      ?auto_68056 - BLOCK
      ?auto_68057 - BLOCK
      ?auto_68058 - BLOCK
    )
    :vars
    (
      ?auto_68061 - BLOCK
      ?auto_68062 - BLOCK
      ?auto_68060 - BLOCK
      ?auto_68059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68055 ?auto_68056 ) ) ( not ( = ?auto_68055 ?auto_68057 ) ) ( not ( = ?auto_68055 ?auto_68058 ) ) ( not ( = ?auto_68056 ?auto_68057 ) ) ( not ( = ?auto_68056 ?auto_68058 ) ) ( not ( = ?auto_68057 ?auto_68058 ) ) ( ON ?auto_68058 ?auto_68061 ) ( not ( = ?auto_68055 ?auto_68061 ) ) ( not ( = ?auto_68056 ?auto_68061 ) ) ( not ( = ?auto_68057 ?auto_68061 ) ) ( not ( = ?auto_68058 ?auto_68061 ) ) ( ON ?auto_68057 ?auto_68058 ) ( ON-TABLE ?auto_68062 ) ( ON ?auto_68060 ?auto_68062 ) ( ON ?auto_68061 ?auto_68060 ) ( not ( = ?auto_68062 ?auto_68060 ) ) ( not ( = ?auto_68062 ?auto_68061 ) ) ( not ( = ?auto_68062 ?auto_68058 ) ) ( not ( = ?auto_68062 ?auto_68057 ) ) ( not ( = ?auto_68060 ?auto_68061 ) ) ( not ( = ?auto_68060 ?auto_68058 ) ) ( not ( = ?auto_68060 ?auto_68057 ) ) ( not ( = ?auto_68055 ?auto_68062 ) ) ( not ( = ?auto_68055 ?auto_68060 ) ) ( not ( = ?auto_68056 ?auto_68062 ) ) ( not ( = ?auto_68056 ?auto_68060 ) ) ( ON ?auto_68055 ?auto_68059 ) ( not ( = ?auto_68055 ?auto_68059 ) ) ( not ( = ?auto_68056 ?auto_68059 ) ) ( not ( = ?auto_68057 ?auto_68059 ) ) ( not ( = ?auto_68058 ?auto_68059 ) ) ( not ( = ?auto_68061 ?auto_68059 ) ) ( not ( = ?auto_68062 ?auto_68059 ) ) ( not ( = ?auto_68060 ?auto_68059 ) ) ( CLEAR ?auto_68057 ) ( ON ?auto_68056 ?auto_68055 ) ( CLEAR ?auto_68056 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68059 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68059 ?auto_68055 )
      ( MAKE-4PILE ?auto_68055 ?auto_68056 ?auto_68057 ?auto_68058 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68063 - BLOCK
      ?auto_68064 - BLOCK
      ?auto_68065 - BLOCK
      ?auto_68066 - BLOCK
    )
    :vars
    (
      ?auto_68068 - BLOCK
      ?auto_68069 - BLOCK
      ?auto_68070 - BLOCK
      ?auto_68067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68063 ?auto_68064 ) ) ( not ( = ?auto_68063 ?auto_68065 ) ) ( not ( = ?auto_68063 ?auto_68066 ) ) ( not ( = ?auto_68064 ?auto_68065 ) ) ( not ( = ?auto_68064 ?auto_68066 ) ) ( not ( = ?auto_68065 ?auto_68066 ) ) ( ON ?auto_68066 ?auto_68068 ) ( not ( = ?auto_68063 ?auto_68068 ) ) ( not ( = ?auto_68064 ?auto_68068 ) ) ( not ( = ?auto_68065 ?auto_68068 ) ) ( not ( = ?auto_68066 ?auto_68068 ) ) ( ON-TABLE ?auto_68069 ) ( ON ?auto_68070 ?auto_68069 ) ( ON ?auto_68068 ?auto_68070 ) ( not ( = ?auto_68069 ?auto_68070 ) ) ( not ( = ?auto_68069 ?auto_68068 ) ) ( not ( = ?auto_68069 ?auto_68066 ) ) ( not ( = ?auto_68069 ?auto_68065 ) ) ( not ( = ?auto_68070 ?auto_68068 ) ) ( not ( = ?auto_68070 ?auto_68066 ) ) ( not ( = ?auto_68070 ?auto_68065 ) ) ( not ( = ?auto_68063 ?auto_68069 ) ) ( not ( = ?auto_68063 ?auto_68070 ) ) ( not ( = ?auto_68064 ?auto_68069 ) ) ( not ( = ?auto_68064 ?auto_68070 ) ) ( ON ?auto_68063 ?auto_68067 ) ( not ( = ?auto_68063 ?auto_68067 ) ) ( not ( = ?auto_68064 ?auto_68067 ) ) ( not ( = ?auto_68065 ?auto_68067 ) ) ( not ( = ?auto_68066 ?auto_68067 ) ) ( not ( = ?auto_68068 ?auto_68067 ) ) ( not ( = ?auto_68069 ?auto_68067 ) ) ( not ( = ?auto_68070 ?auto_68067 ) ) ( ON ?auto_68064 ?auto_68063 ) ( CLEAR ?auto_68064 ) ( ON-TABLE ?auto_68067 ) ( HOLDING ?auto_68065 ) ( CLEAR ?auto_68066 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68069 ?auto_68070 ?auto_68068 ?auto_68066 ?auto_68065 )
      ( MAKE-4PILE ?auto_68063 ?auto_68064 ?auto_68065 ?auto_68066 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68071 - BLOCK
      ?auto_68072 - BLOCK
      ?auto_68073 - BLOCK
      ?auto_68074 - BLOCK
    )
    :vars
    (
      ?auto_68077 - BLOCK
      ?auto_68078 - BLOCK
      ?auto_68076 - BLOCK
      ?auto_68075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68071 ?auto_68072 ) ) ( not ( = ?auto_68071 ?auto_68073 ) ) ( not ( = ?auto_68071 ?auto_68074 ) ) ( not ( = ?auto_68072 ?auto_68073 ) ) ( not ( = ?auto_68072 ?auto_68074 ) ) ( not ( = ?auto_68073 ?auto_68074 ) ) ( ON ?auto_68074 ?auto_68077 ) ( not ( = ?auto_68071 ?auto_68077 ) ) ( not ( = ?auto_68072 ?auto_68077 ) ) ( not ( = ?auto_68073 ?auto_68077 ) ) ( not ( = ?auto_68074 ?auto_68077 ) ) ( ON-TABLE ?auto_68078 ) ( ON ?auto_68076 ?auto_68078 ) ( ON ?auto_68077 ?auto_68076 ) ( not ( = ?auto_68078 ?auto_68076 ) ) ( not ( = ?auto_68078 ?auto_68077 ) ) ( not ( = ?auto_68078 ?auto_68074 ) ) ( not ( = ?auto_68078 ?auto_68073 ) ) ( not ( = ?auto_68076 ?auto_68077 ) ) ( not ( = ?auto_68076 ?auto_68074 ) ) ( not ( = ?auto_68076 ?auto_68073 ) ) ( not ( = ?auto_68071 ?auto_68078 ) ) ( not ( = ?auto_68071 ?auto_68076 ) ) ( not ( = ?auto_68072 ?auto_68078 ) ) ( not ( = ?auto_68072 ?auto_68076 ) ) ( ON ?auto_68071 ?auto_68075 ) ( not ( = ?auto_68071 ?auto_68075 ) ) ( not ( = ?auto_68072 ?auto_68075 ) ) ( not ( = ?auto_68073 ?auto_68075 ) ) ( not ( = ?auto_68074 ?auto_68075 ) ) ( not ( = ?auto_68077 ?auto_68075 ) ) ( not ( = ?auto_68078 ?auto_68075 ) ) ( not ( = ?auto_68076 ?auto_68075 ) ) ( ON ?auto_68072 ?auto_68071 ) ( ON-TABLE ?auto_68075 ) ( CLEAR ?auto_68074 ) ( ON ?auto_68073 ?auto_68072 ) ( CLEAR ?auto_68073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68075 ?auto_68071 ?auto_68072 )
      ( MAKE-4PILE ?auto_68071 ?auto_68072 ?auto_68073 ?auto_68074 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68079 - BLOCK
      ?auto_68080 - BLOCK
      ?auto_68081 - BLOCK
      ?auto_68082 - BLOCK
    )
    :vars
    (
      ?auto_68083 - BLOCK
      ?auto_68084 - BLOCK
      ?auto_68086 - BLOCK
      ?auto_68085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68079 ?auto_68080 ) ) ( not ( = ?auto_68079 ?auto_68081 ) ) ( not ( = ?auto_68079 ?auto_68082 ) ) ( not ( = ?auto_68080 ?auto_68081 ) ) ( not ( = ?auto_68080 ?auto_68082 ) ) ( not ( = ?auto_68081 ?auto_68082 ) ) ( not ( = ?auto_68079 ?auto_68083 ) ) ( not ( = ?auto_68080 ?auto_68083 ) ) ( not ( = ?auto_68081 ?auto_68083 ) ) ( not ( = ?auto_68082 ?auto_68083 ) ) ( ON-TABLE ?auto_68084 ) ( ON ?auto_68086 ?auto_68084 ) ( ON ?auto_68083 ?auto_68086 ) ( not ( = ?auto_68084 ?auto_68086 ) ) ( not ( = ?auto_68084 ?auto_68083 ) ) ( not ( = ?auto_68084 ?auto_68082 ) ) ( not ( = ?auto_68084 ?auto_68081 ) ) ( not ( = ?auto_68086 ?auto_68083 ) ) ( not ( = ?auto_68086 ?auto_68082 ) ) ( not ( = ?auto_68086 ?auto_68081 ) ) ( not ( = ?auto_68079 ?auto_68084 ) ) ( not ( = ?auto_68079 ?auto_68086 ) ) ( not ( = ?auto_68080 ?auto_68084 ) ) ( not ( = ?auto_68080 ?auto_68086 ) ) ( ON ?auto_68079 ?auto_68085 ) ( not ( = ?auto_68079 ?auto_68085 ) ) ( not ( = ?auto_68080 ?auto_68085 ) ) ( not ( = ?auto_68081 ?auto_68085 ) ) ( not ( = ?auto_68082 ?auto_68085 ) ) ( not ( = ?auto_68083 ?auto_68085 ) ) ( not ( = ?auto_68084 ?auto_68085 ) ) ( not ( = ?auto_68086 ?auto_68085 ) ) ( ON ?auto_68080 ?auto_68079 ) ( ON-TABLE ?auto_68085 ) ( ON ?auto_68081 ?auto_68080 ) ( CLEAR ?auto_68081 ) ( HOLDING ?auto_68082 ) ( CLEAR ?auto_68083 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68084 ?auto_68086 ?auto_68083 ?auto_68082 )
      ( MAKE-4PILE ?auto_68079 ?auto_68080 ?auto_68081 ?auto_68082 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68087 - BLOCK
      ?auto_68088 - BLOCK
      ?auto_68089 - BLOCK
      ?auto_68090 - BLOCK
    )
    :vars
    (
      ?auto_68094 - BLOCK
      ?auto_68093 - BLOCK
      ?auto_68091 - BLOCK
      ?auto_68092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68087 ?auto_68088 ) ) ( not ( = ?auto_68087 ?auto_68089 ) ) ( not ( = ?auto_68087 ?auto_68090 ) ) ( not ( = ?auto_68088 ?auto_68089 ) ) ( not ( = ?auto_68088 ?auto_68090 ) ) ( not ( = ?auto_68089 ?auto_68090 ) ) ( not ( = ?auto_68087 ?auto_68094 ) ) ( not ( = ?auto_68088 ?auto_68094 ) ) ( not ( = ?auto_68089 ?auto_68094 ) ) ( not ( = ?auto_68090 ?auto_68094 ) ) ( ON-TABLE ?auto_68093 ) ( ON ?auto_68091 ?auto_68093 ) ( ON ?auto_68094 ?auto_68091 ) ( not ( = ?auto_68093 ?auto_68091 ) ) ( not ( = ?auto_68093 ?auto_68094 ) ) ( not ( = ?auto_68093 ?auto_68090 ) ) ( not ( = ?auto_68093 ?auto_68089 ) ) ( not ( = ?auto_68091 ?auto_68094 ) ) ( not ( = ?auto_68091 ?auto_68090 ) ) ( not ( = ?auto_68091 ?auto_68089 ) ) ( not ( = ?auto_68087 ?auto_68093 ) ) ( not ( = ?auto_68087 ?auto_68091 ) ) ( not ( = ?auto_68088 ?auto_68093 ) ) ( not ( = ?auto_68088 ?auto_68091 ) ) ( ON ?auto_68087 ?auto_68092 ) ( not ( = ?auto_68087 ?auto_68092 ) ) ( not ( = ?auto_68088 ?auto_68092 ) ) ( not ( = ?auto_68089 ?auto_68092 ) ) ( not ( = ?auto_68090 ?auto_68092 ) ) ( not ( = ?auto_68094 ?auto_68092 ) ) ( not ( = ?auto_68093 ?auto_68092 ) ) ( not ( = ?auto_68091 ?auto_68092 ) ) ( ON ?auto_68088 ?auto_68087 ) ( ON-TABLE ?auto_68092 ) ( ON ?auto_68089 ?auto_68088 ) ( CLEAR ?auto_68094 ) ( ON ?auto_68090 ?auto_68089 ) ( CLEAR ?auto_68090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68092 ?auto_68087 ?auto_68088 ?auto_68089 )
      ( MAKE-4PILE ?auto_68087 ?auto_68088 ?auto_68089 ?auto_68090 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68095 - BLOCK
      ?auto_68096 - BLOCK
      ?auto_68097 - BLOCK
      ?auto_68098 - BLOCK
    )
    :vars
    (
      ?auto_68102 - BLOCK
      ?auto_68099 - BLOCK
      ?auto_68100 - BLOCK
      ?auto_68101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68095 ?auto_68096 ) ) ( not ( = ?auto_68095 ?auto_68097 ) ) ( not ( = ?auto_68095 ?auto_68098 ) ) ( not ( = ?auto_68096 ?auto_68097 ) ) ( not ( = ?auto_68096 ?auto_68098 ) ) ( not ( = ?auto_68097 ?auto_68098 ) ) ( not ( = ?auto_68095 ?auto_68102 ) ) ( not ( = ?auto_68096 ?auto_68102 ) ) ( not ( = ?auto_68097 ?auto_68102 ) ) ( not ( = ?auto_68098 ?auto_68102 ) ) ( ON-TABLE ?auto_68099 ) ( ON ?auto_68100 ?auto_68099 ) ( not ( = ?auto_68099 ?auto_68100 ) ) ( not ( = ?auto_68099 ?auto_68102 ) ) ( not ( = ?auto_68099 ?auto_68098 ) ) ( not ( = ?auto_68099 ?auto_68097 ) ) ( not ( = ?auto_68100 ?auto_68102 ) ) ( not ( = ?auto_68100 ?auto_68098 ) ) ( not ( = ?auto_68100 ?auto_68097 ) ) ( not ( = ?auto_68095 ?auto_68099 ) ) ( not ( = ?auto_68095 ?auto_68100 ) ) ( not ( = ?auto_68096 ?auto_68099 ) ) ( not ( = ?auto_68096 ?auto_68100 ) ) ( ON ?auto_68095 ?auto_68101 ) ( not ( = ?auto_68095 ?auto_68101 ) ) ( not ( = ?auto_68096 ?auto_68101 ) ) ( not ( = ?auto_68097 ?auto_68101 ) ) ( not ( = ?auto_68098 ?auto_68101 ) ) ( not ( = ?auto_68102 ?auto_68101 ) ) ( not ( = ?auto_68099 ?auto_68101 ) ) ( not ( = ?auto_68100 ?auto_68101 ) ) ( ON ?auto_68096 ?auto_68095 ) ( ON-TABLE ?auto_68101 ) ( ON ?auto_68097 ?auto_68096 ) ( ON ?auto_68098 ?auto_68097 ) ( CLEAR ?auto_68098 ) ( HOLDING ?auto_68102 ) ( CLEAR ?auto_68100 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68099 ?auto_68100 ?auto_68102 )
      ( MAKE-4PILE ?auto_68095 ?auto_68096 ?auto_68097 ?auto_68098 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68103 - BLOCK
      ?auto_68104 - BLOCK
      ?auto_68105 - BLOCK
      ?auto_68106 - BLOCK
    )
    :vars
    (
      ?auto_68110 - BLOCK
      ?auto_68107 - BLOCK
      ?auto_68109 - BLOCK
      ?auto_68108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68103 ?auto_68104 ) ) ( not ( = ?auto_68103 ?auto_68105 ) ) ( not ( = ?auto_68103 ?auto_68106 ) ) ( not ( = ?auto_68104 ?auto_68105 ) ) ( not ( = ?auto_68104 ?auto_68106 ) ) ( not ( = ?auto_68105 ?auto_68106 ) ) ( not ( = ?auto_68103 ?auto_68110 ) ) ( not ( = ?auto_68104 ?auto_68110 ) ) ( not ( = ?auto_68105 ?auto_68110 ) ) ( not ( = ?auto_68106 ?auto_68110 ) ) ( ON-TABLE ?auto_68107 ) ( ON ?auto_68109 ?auto_68107 ) ( not ( = ?auto_68107 ?auto_68109 ) ) ( not ( = ?auto_68107 ?auto_68110 ) ) ( not ( = ?auto_68107 ?auto_68106 ) ) ( not ( = ?auto_68107 ?auto_68105 ) ) ( not ( = ?auto_68109 ?auto_68110 ) ) ( not ( = ?auto_68109 ?auto_68106 ) ) ( not ( = ?auto_68109 ?auto_68105 ) ) ( not ( = ?auto_68103 ?auto_68107 ) ) ( not ( = ?auto_68103 ?auto_68109 ) ) ( not ( = ?auto_68104 ?auto_68107 ) ) ( not ( = ?auto_68104 ?auto_68109 ) ) ( ON ?auto_68103 ?auto_68108 ) ( not ( = ?auto_68103 ?auto_68108 ) ) ( not ( = ?auto_68104 ?auto_68108 ) ) ( not ( = ?auto_68105 ?auto_68108 ) ) ( not ( = ?auto_68106 ?auto_68108 ) ) ( not ( = ?auto_68110 ?auto_68108 ) ) ( not ( = ?auto_68107 ?auto_68108 ) ) ( not ( = ?auto_68109 ?auto_68108 ) ) ( ON ?auto_68104 ?auto_68103 ) ( ON-TABLE ?auto_68108 ) ( ON ?auto_68105 ?auto_68104 ) ( ON ?auto_68106 ?auto_68105 ) ( CLEAR ?auto_68109 ) ( ON ?auto_68110 ?auto_68106 ) ( CLEAR ?auto_68110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68108 ?auto_68103 ?auto_68104 ?auto_68105 ?auto_68106 )
      ( MAKE-4PILE ?auto_68103 ?auto_68104 ?auto_68105 ?auto_68106 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68111 - BLOCK
      ?auto_68112 - BLOCK
      ?auto_68113 - BLOCK
      ?auto_68114 - BLOCK
    )
    :vars
    (
      ?auto_68118 - BLOCK
      ?auto_68117 - BLOCK
      ?auto_68116 - BLOCK
      ?auto_68115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68111 ?auto_68112 ) ) ( not ( = ?auto_68111 ?auto_68113 ) ) ( not ( = ?auto_68111 ?auto_68114 ) ) ( not ( = ?auto_68112 ?auto_68113 ) ) ( not ( = ?auto_68112 ?auto_68114 ) ) ( not ( = ?auto_68113 ?auto_68114 ) ) ( not ( = ?auto_68111 ?auto_68118 ) ) ( not ( = ?auto_68112 ?auto_68118 ) ) ( not ( = ?auto_68113 ?auto_68118 ) ) ( not ( = ?auto_68114 ?auto_68118 ) ) ( ON-TABLE ?auto_68117 ) ( not ( = ?auto_68117 ?auto_68116 ) ) ( not ( = ?auto_68117 ?auto_68118 ) ) ( not ( = ?auto_68117 ?auto_68114 ) ) ( not ( = ?auto_68117 ?auto_68113 ) ) ( not ( = ?auto_68116 ?auto_68118 ) ) ( not ( = ?auto_68116 ?auto_68114 ) ) ( not ( = ?auto_68116 ?auto_68113 ) ) ( not ( = ?auto_68111 ?auto_68117 ) ) ( not ( = ?auto_68111 ?auto_68116 ) ) ( not ( = ?auto_68112 ?auto_68117 ) ) ( not ( = ?auto_68112 ?auto_68116 ) ) ( ON ?auto_68111 ?auto_68115 ) ( not ( = ?auto_68111 ?auto_68115 ) ) ( not ( = ?auto_68112 ?auto_68115 ) ) ( not ( = ?auto_68113 ?auto_68115 ) ) ( not ( = ?auto_68114 ?auto_68115 ) ) ( not ( = ?auto_68118 ?auto_68115 ) ) ( not ( = ?auto_68117 ?auto_68115 ) ) ( not ( = ?auto_68116 ?auto_68115 ) ) ( ON ?auto_68112 ?auto_68111 ) ( ON-TABLE ?auto_68115 ) ( ON ?auto_68113 ?auto_68112 ) ( ON ?auto_68114 ?auto_68113 ) ( ON ?auto_68118 ?auto_68114 ) ( CLEAR ?auto_68118 ) ( HOLDING ?auto_68116 ) ( CLEAR ?auto_68117 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68117 ?auto_68116 )
      ( MAKE-4PILE ?auto_68111 ?auto_68112 ?auto_68113 ?auto_68114 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68119 - BLOCK
      ?auto_68120 - BLOCK
      ?auto_68121 - BLOCK
      ?auto_68122 - BLOCK
    )
    :vars
    (
      ?auto_68125 - BLOCK
      ?auto_68123 - BLOCK
      ?auto_68124 - BLOCK
      ?auto_68126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68119 ?auto_68120 ) ) ( not ( = ?auto_68119 ?auto_68121 ) ) ( not ( = ?auto_68119 ?auto_68122 ) ) ( not ( = ?auto_68120 ?auto_68121 ) ) ( not ( = ?auto_68120 ?auto_68122 ) ) ( not ( = ?auto_68121 ?auto_68122 ) ) ( not ( = ?auto_68119 ?auto_68125 ) ) ( not ( = ?auto_68120 ?auto_68125 ) ) ( not ( = ?auto_68121 ?auto_68125 ) ) ( not ( = ?auto_68122 ?auto_68125 ) ) ( ON-TABLE ?auto_68123 ) ( not ( = ?auto_68123 ?auto_68124 ) ) ( not ( = ?auto_68123 ?auto_68125 ) ) ( not ( = ?auto_68123 ?auto_68122 ) ) ( not ( = ?auto_68123 ?auto_68121 ) ) ( not ( = ?auto_68124 ?auto_68125 ) ) ( not ( = ?auto_68124 ?auto_68122 ) ) ( not ( = ?auto_68124 ?auto_68121 ) ) ( not ( = ?auto_68119 ?auto_68123 ) ) ( not ( = ?auto_68119 ?auto_68124 ) ) ( not ( = ?auto_68120 ?auto_68123 ) ) ( not ( = ?auto_68120 ?auto_68124 ) ) ( ON ?auto_68119 ?auto_68126 ) ( not ( = ?auto_68119 ?auto_68126 ) ) ( not ( = ?auto_68120 ?auto_68126 ) ) ( not ( = ?auto_68121 ?auto_68126 ) ) ( not ( = ?auto_68122 ?auto_68126 ) ) ( not ( = ?auto_68125 ?auto_68126 ) ) ( not ( = ?auto_68123 ?auto_68126 ) ) ( not ( = ?auto_68124 ?auto_68126 ) ) ( ON ?auto_68120 ?auto_68119 ) ( ON-TABLE ?auto_68126 ) ( ON ?auto_68121 ?auto_68120 ) ( ON ?auto_68122 ?auto_68121 ) ( ON ?auto_68125 ?auto_68122 ) ( CLEAR ?auto_68123 ) ( ON ?auto_68124 ?auto_68125 ) ( CLEAR ?auto_68124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68126 ?auto_68119 ?auto_68120 ?auto_68121 ?auto_68122 ?auto_68125 )
      ( MAKE-4PILE ?auto_68119 ?auto_68120 ?auto_68121 ?auto_68122 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68127 - BLOCK
      ?auto_68128 - BLOCK
      ?auto_68129 - BLOCK
      ?auto_68130 - BLOCK
    )
    :vars
    (
      ?auto_68131 - BLOCK
      ?auto_68134 - BLOCK
      ?auto_68133 - BLOCK
      ?auto_68132 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68127 ?auto_68128 ) ) ( not ( = ?auto_68127 ?auto_68129 ) ) ( not ( = ?auto_68127 ?auto_68130 ) ) ( not ( = ?auto_68128 ?auto_68129 ) ) ( not ( = ?auto_68128 ?auto_68130 ) ) ( not ( = ?auto_68129 ?auto_68130 ) ) ( not ( = ?auto_68127 ?auto_68131 ) ) ( not ( = ?auto_68128 ?auto_68131 ) ) ( not ( = ?auto_68129 ?auto_68131 ) ) ( not ( = ?auto_68130 ?auto_68131 ) ) ( not ( = ?auto_68134 ?auto_68133 ) ) ( not ( = ?auto_68134 ?auto_68131 ) ) ( not ( = ?auto_68134 ?auto_68130 ) ) ( not ( = ?auto_68134 ?auto_68129 ) ) ( not ( = ?auto_68133 ?auto_68131 ) ) ( not ( = ?auto_68133 ?auto_68130 ) ) ( not ( = ?auto_68133 ?auto_68129 ) ) ( not ( = ?auto_68127 ?auto_68134 ) ) ( not ( = ?auto_68127 ?auto_68133 ) ) ( not ( = ?auto_68128 ?auto_68134 ) ) ( not ( = ?auto_68128 ?auto_68133 ) ) ( ON ?auto_68127 ?auto_68132 ) ( not ( = ?auto_68127 ?auto_68132 ) ) ( not ( = ?auto_68128 ?auto_68132 ) ) ( not ( = ?auto_68129 ?auto_68132 ) ) ( not ( = ?auto_68130 ?auto_68132 ) ) ( not ( = ?auto_68131 ?auto_68132 ) ) ( not ( = ?auto_68134 ?auto_68132 ) ) ( not ( = ?auto_68133 ?auto_68132 ) ) ( ON ?auto_68128 ?auto_68127 ) ( ON-TABLE ?auto_68132 ) ( ON ?auto_68129 ?auto_68128 ) ( ON ?auto_68130 ?auto_68129 ) ( ON ?auto_68131 ?auto_68130 ) ( ON ?auto_68133 ?auto_68131 ) ( CLEAR ?auto_68133 ) ( HOLDING ?auto_68134 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68134 )
      ( MAKE-4PILE ?auto_68127 ?auto_68128 ?auto_68129 ?auto_68130 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68135 - BLOCK
      ?auto_68136 - BLOCK
      ?auto_68137 - BLOCK
      ?auto_68138 - BLOCK
    )
    :vars
    (
      ?auto_68139 - BLOCK
      ?auto_68140 - BLOCK
      ?auto_68141 - BLOCK
      ?auto_68142 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68135 ?auto_68136 ) ) ( not ( = ?auto_68135 ?auto_68137 ) ) ( not ( = ?auto_68135 ?auto_68138 ) ) ( not ( = ?auto_68136 ?auto_68137 ) ) ( not ( = ?auto_68136 ?auto_68138 ) ) ( not ( = ?auto_68137 ?auto_68138 ) ) ( not ( = ?auto_68135 ?auto_68139 ) ) ( not ( = ?auto_68136 ?auto_68139 ) ) ( not ( = ?auto_68137 ?auto_68139 ) ) ( not ( = ?auto_68138 ?auto_68139 ) ) ( not ( = ?auto_68140 ?auto_68141 ) ) ( not ( = ?auto_68140 ?auto_68139 ) ) ( not ( = ?auto_68140 ?auto_68138 ) ) ( not ( = ?auto_68140 ?auto_68137 ) ) ( not ( = ?auto_68141 ?auto_68139 ) ) ( not ( = ?auto_68141 ?auto_68138 ) ) ( not ( = ?auto_68141 ?auto_68137 ) ) ( not ( = ?auto_68135 ?auto_68140 ) ) ( not ( = ?auto_68135 ?auto_68141 ) ) ( not ( = ?auto_68136 ?auto_68140 ) ) ( not ( = ?auto_68136 ?auto_68141 ) ) ( ON ?auto_68135 ?auto_68142 ) ( not ( = ?auto_68135 ?auto_68142 ) ) ( not ( = ?auto_68136 ?auto_68142 ) ) ( not ( = ?auto_68137 ?auto_68142 ) ) ( not ( = ?auto_68138 ?auto_68142 ) ) ( not ( = ?auto_68139 ?auto_68142 ) ) ( not ( = ?auto_68140 ?auto_68142 ) ) ( not ( = ?auto_68141 ?auto_68142 ) ) ( ON ?auto_68136 ?auto_68135 ) ( ON-TABLE ?auto_68142 ) ( ON ?auto_68137 ?auto_68136 ) ( ON ?auto_68138 ?auto_68137 ) ( ON ?auto_68139 ?auto_68138 ) ( ON ?auto_68141 ?auto_68139 ) ( ON ?auto_68140 ?auto_68141 ) ( CLEAR ?auto_68140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_68142 ?auto_68135 ?auto_68136 ?auto_68137 ?auto_68138 ?auto_68139 ?auto_68141 )
      ( MAKE-4PILE ?auto_68135 ?auto_68136 ?auto_68137 ?auto_68138 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68158 - BLOCK
      ?auto_68159 - BLOCK
    )
    :vars
    (
      ?auto_68162 - BLOCK
      ?auto_68160 - BLOCK
      ?auto_68161 - BLOCK
      ?auto_68164 - BLOCK
      ?auto_68163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68162 ?auto_68159 ) ( ON-TABLE ?auto_68158 ) ( ON ?auto_68159 ?auto_68158 ) ( not ( = ?auto_68158 ?auto_68159 ) ) ( not ( = ?auto_68158 ?auto_68162 ) ) ( not ( = ?auto_68159 ?auto_68162 ) ) ( not ( = ?auto_68158 ?auto_68160 ) ) ( not ( = ?auto_68158 ?auto_68161 ) ) ( not ( = ?auto_68159 ?auto_68160 ) ) ( not ( = ?auto_68159 ?auto_68161 ) ) ( not ( = ?auto_68162 ?auto_68160 ) ) ( not ( = ?auto_68162 ?auto_68161 ) ) ( not ( = ?auto_68160 ?auto_68161 ) ) ( ON ?auto_68160 ?auto_68162 ) ( CLEAR ?auto_68160 ) ( HOLDING ?auto_68161 ) ( CLEAR ?auto_68164 ) ( ON-TABLE ?auto_68163 ) ( ON ?auto_68164 ?auto_68163 ) ( not ( = ?auto_68163 ?auto_68164 ) ) ( not ( = ?auto_68163 ?auto_68161 ) ) ( not ( = ?auto_68164 ?auto_68161 ) ) ( not ( = ?auto_68158 ?auto_68164 ) ) ( not ( = ?auto_68158 ?auto_68163 ) ) ( not ( = ?auto_68159 ?auto_68164 ) ) ( not ( = ?auto_68159 ?auto_68163 ) ) ( not ( = ?auto_68162 ?auto_68164 ) ) ( not ( = ?auto_68162 ?auto_68163 ) ) ( not ( = ?auto_68160 ?auto_68164 ) ) ( not ( = ?auto_68160 ?auto_68163 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68163 ?auto_68164 ?auto_68161 )
      ( MAKE-2PILE ?auto_68158 ?auto_68159 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68165 - BLOCK
      ?auto_68166 - BLOCK
    )
    :vars
    (
      ?auto_68171 - BLOCK
      ?auto_68169 - BLOCK
      ?auto_68168 - BLOCK
      ?auto_68170 - BLOCK
      ?auto_68167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68171 ?auto_68166 ) ( ON-TABLE ?auto_68165 ) ( ON ?auto_68166 ?auto_68165 ) ( not ( = ?auto_68165 ?auto_68166 ) ) ( not ( = ?auto_68165 ?auto_68171 ) ) ( not ( = ?auto_68166 ?auto_68171 ) ) ( not ( = ?auto_68165 ?auto_68169 ) ) ( not ( = ?auto_68165 ?auto_68168 ) ) ( not ( = ?auto_68166 ?auto_68169 ) ) ( not ( = ?auto_68166 ?auto_68168 ) ) ( not ( = ?auto_68171 ?auto_68169 ) ) ( not ( = ?auto_68171 ?auto_68168 ) ) ( not ( = ?auto_68169 ?auto_68168 ) ) ( ON ?auto_68169 ?auto_68171 ) ( CLEAR ?auto_68170 ) ( ON-TABLE ?auto_68167 ) ( ON ?auto_68170 ?auto_68167 ) ( not ( = ?auto_68167 ?auto_68170 ) ) ( not ( = ?auto_68167 ?auto_68168 ) ) ( not ( = ?auto_68170 ?auto_68168 ) ) ( not ( = ?auto_68165 ?auto_68170 ) ) ( not ( = ?auto_68165 ?auto_68167 ) ) ( not ( = ?auto_68166 ?auto_68170 ) ) ( not ( = ?auto_68166 ?auto_68167 ) ) ( not ( = ?auto_68171 ?auto_68170 ) ) ( not ( = ?auto_68171 ?auto_68167 ) ) ( not ( = ?auto_68169 ?auto_68170 ) ) ( not ( = ?auto_68169 ?auto_68167 ) ) ( ON ?auto_68168 ?auto_68169 ) ( CLEAR ?auto_68168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68165 ?auto_68166 ?auto_68171 ?auto_68169 )
      ( MAKE-2PILE ?auto_68165 ?auto_68166 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68172 - BLOCK
      ?auto_68173 - BLOCK
    )
    :vars
    (
      ?auto_68175 - BLOCK
      ?auto_68176 - BLOCK
      ?auto_68178 - BLOCK
      ?auto_68177 - BLOCK
      ?auto_68174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68175 ?auto_68173 ) ( ON-TABLE ?auto_68172 ) ( ON ?auto_68173 ?auto_68172 ) ( not ( = ?auto_68172 ?auto_68173 ) ) ( not ( = ?auto_68172 ?auto_68175 ) ) ( not ( = ?auto_68173 ?auto_68175 ) ) ( not ( = ?auto_68172 ?auto_68176 ) ) ( not ( = ?auto_68172 ?auto_68178 ) ) ( not ( = ?auto_68173 ?auto_68176 ) ) ( not ( = ?auto_68173 ?auto_68178 ) ) ( not ( = ?auto_68175 ?auto_68176 ) ) ( not ( = ?auto_68175 ?auto_68178 ) ) ( not ( = ?auto_68176 ?auto_68178 ) ) ( ON ?auto_68176 ?auto_68175 ) ( ON-TABLE ?auto_68177 ) ( not ( = ?auto_68177 ?auto_68174 ) ) ( not ( = ?auto_68177 ?auto_68178 ) ) ( not ( = ?auto_68174 ?auto_68178 ) ) ( not ( = ?auto_68172 ?auto_68174 ) ) ( not ( = ?auto_68172 ?auto_68177 ) ) ( not ( = ?auto_68173 ?auto_68174 ) ) ( not ( = ?auto_68173 ?auto_68177 ) ) ( not ( = ?auto_68175 ?auto_68174 ) ) ( not ( = ?auto_68175 ?auto_68177 ) ) ( not ( = ?auto_68176 ?auto_68174 ) ) ( not ( = ?auto_68176 ?auto_68177 ) ) ( ON ?auto_68178 ?auto_68176 ) ( CLEAR ?auto_68178 ) ( HOLDING ?auto_68174 ) ( CLEAR ?auto_68177 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68177 ?auto_68174 )
      ( MAKE-2PILE ?auto_68172 ?auto_68173 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68179 - BLOCK
      ?auto_68180 - BLOCK
    )
    :vars
    (
      ?auto_68184 - BLOCK
      ?auto_68182 - BLOCK
      ?auto_68181 - BLOCK
      ?auto_68185 - BLOCK
      ?auto_68183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68184 ?auto_68180 ) ( ON-TABLE ?auto_68179 ) ( ON ?auto_68180 ?auto_68179 ) ( not ( = ?auto_68179 ?auto_68180 ) ) ( not ( = ?auto_68179 ?auto_68184 ) ) ( not ( = ?auto_68180 ?auto_68184 ) ) ( not ( = ?auto_68179 ?auto_68182 ) ) ( not ( = ?auto_68179 ?auto_68181 ) ) ( not ( = ?auto_68180 ?auto_68182 ) ) ( not ( = ?auto_68180 ?auto_68181 ) ) ( not ( = ?auto_68184 ?auto_68182 ) ) ( not ( = ?auto_68184 ?auto_68181 ) ) ( not ( = ?auto_68182 ?auto_68181 ) ) ( ON ?auto_68182 ?auto_68184 ) ( ON-TABLE ?auto_68185 ) ( not ( = ?auto_68185 ?auto_68183 ) ) ( not ( = ?auto_68185 ?auto_68181 ) ) ( not ( = ?auto_68183 ?auto_68181 ) ) ( not ( = ?auto_68179 ?auto_68183 ) ) ( not ( = ?auto_68179 ?auto_68185 ) ) ( not ( = ?auto_68180 ?auto_68183 ) ) ( not ( = ?auto_68180 ?auto_68185 ) ) ( not ( = ?auto_68184 ?auto_68183 ) ) ( not ( = ?auto_68184 ?auto_68185 ) ) ( not ( = ?auto_68182 ?auto_68183 ) ) ( not ( = ?auto_68182 ?auto_68185 ) ) ( ON ?auto_68181 ?auto_68182 ) ( CLEAR ?auto_68185 ) ( ON ?auto_68183 ?auto_68181 ) ( CLEAR ?auto_68183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68179 ?auto_68180 ?auto_68184 ?auto_68182 ?auto_68181 )
      ( MAKE-2PILE ?auto_68179 ?auto_68180 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68186 - BLOCK
      ?auto_68187 - BLOCK
    )
    :vars
    (
      ?auto_68192 - BLOCK
      ?auto_68190 - BLOCK
      ?auto_68191 - BLOCK
      ?auto_68189 - BLOCK
      ?auto_68188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68192 ?auto_68187 ) ( ON-TABLE ?auto_68186 ) ( ON ?auto_68187 ?auto_68186 ) ( not ( = ?auto_68186 ?auto_68187 ) ) ( not ( = ?auto_68186 ?auto_68192 ) ) ( not ( = ?auto_68187 ?auto_68192 ) ) ( not ( = ?auto_68186 ?auto_68190 ) ) ( not ( = ?auto_68186 ?auto_68191 ) ) ( not ( = ?auto_68187 ?auto_68190 ) ) ( not ( = ?auto_68187 ?auto_68191 ) ) ( not ( = ?auto_68192 ?auto_68190 ) ) ( not ( = ?auto_68192 ?auto_68191 ) ) ( not ( = ?auto_68190 ?auto_68191 ) ) ( ON ?auto_68190 ?auto_68192 ) ( not ( = ?auto_68189 ?auto_68188 ) ) ( not ( = ?auto_68189 ?auto_68191 ) ) ( not ( = ?auto_68188 ?auto_68191 ) ) ( not ( = ?auto_68186 ?auto_68188 ) ) ( not ( = ?auto_68186 ?auto_68189 ) ) ( not ( = ?auto_68187 ?auto_68188 ) ) ( not ( = ?auto_68187 ?auto_68189 ) ) ( not ( = ?auto_68192 ?auto_68188 ) ) ( not ( = ?auto_68192 ?auto_68189 ) ) ( not ( = ?auto_68190 ?auto_68188 ) ) ( not ( = ?auto_68190 ?auto_68189 ) ) ( ON ?auto_68191 ?auto_68190 ) ( ON ?auto_68188 ?auto_68191 ) ( CLEAR ?auto_68188 ) ( HOLDING ?auto_68189 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68189 )
      ( MAKE-2PILE ?auto_68186 ?auto_68187 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68202 - BLOCK
      ?auto_68203 - BLOCK
    )
    :vars
    (
      ?auto_68205 - BLOCK
      ?auto_68207 - BLOCK
      ?auto_68206 - BLOCK
      ?auto_68204 - BLOCK
      ?auto_68208 - BLOCK
      ?auto_68209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68205 ?auto_68203 ) ( ON-TABLE ?auto_68202 ) ( ON ?auto_68203 ?auto_68202 ) ( not ( = ?auto_68202 ?auto_68203 ) ) ( not ( = ?auto_68202 ?auto_68205 ) ) ( not ( = ?auto_68203 ?auto_68205 ) ) ( not ( = ?auto_68202 ?auto_68207 ) ) ( not ( = ?auto_68202 ?auto_68206 ) ) ( not ( = ?auto_68203 ?auto_68207 ) ) ( not ( = ?auto_68203 ?auto_68206 ) ) ( not ( = ?auto_68205 ?auto_68207 ) ) ( not ( = ?auto_68205 ?auto_68206 ) ) ( not ( = ?auto_68207 ?auto_68206 ) ) ( ON ?auto_68207 ?auto_68205 ) ( not ( = ?auto_68204 ?auto_68208 ) ) ( not ( = ?auto_68204 ?auto_68206 ) ) ( not ( = ?auto_68208 ?auto_68206 ) ) ( not ( = ?auto_68202 ?auto_68208 ) ) ( not ( = ?auto_68202 ?auto_68204 ) ) ( not ( = ?auto_68203 ?auto_68208 ) ) ( not ( = ?auto_68203 ?auto_68204 ) ) ( not ( = ?auto_68205 ?auto_68208 ) ) ( not ( = ?auto_68205 ?auto_68204 ) ) ( not ( = ?auto_68207 ?auto_68208 ) ) ( not ( = ?auto_68207 ?auto_68204 ) ) ( ON ?auto_68206 ?auto_68207 ) ( ON ?auto_68208 ?auto_68206 ) ( CLEAR ?auto_68208 ) ( ON ?auto_68204 ?auto_68209 ) ( CLEAR ?auto_68204 ) ( HAND-EMPTY ) ( not ( = ?auto_68202 ?auto_68209 ) ) ( not ( = ?auto_68203 ?auto_68209 ) ) ( not ( = ?auto_68205 ?auto_68209 ) ) ( not ( = ?auto_68207 ?auto_68209 ) ) ( not ( = ?auto_68206 ?auto_68209 ) ) ( not ( = ?auto_68204 ?auto_68209 ) ) ( not ( = ?auto_68208 ?auto_68209 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68204 ?auto_68209 )
      ( MAKE-2PILE ?auto_68202 ?auto_68203 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68210 - BLOCK
      ?auto_68211 - BLOCK
    )
    :vars
    (
      ?auto_68214 - BLOCK
      ?auto_68217 - BLOCK
      ?auto_68213 - BLOCK
      ?auto_68215 - BLOCK
      ?auto_68212 - BLOCK
      ?auto_68216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68214 ?auto_68211 ) ( ON-TABLE ?auto_68210 ) ( ON ?auto_68211 ?auto_68210 ) ( not ( = ?auto_68210 ?auto_68211 ) ) ( not ( = ?auto_68210 ?auto_68214 ) ) ( not ( = ?auto_68211 ?auto_68214 ) ) ( not ( = ?auto_68210 ?auto_68217 ) ) ( not ( = ?auto_68210 ?auto_68213 ) ) ( not ( = ?auto_68211 ?auto_68217 ) ) ( not ( = ?auto_68211 ?auto_68213 ) ) ( not ( = ?auto_68214 ?auto_68217 ) ) ( not ( = ?auto_68214 ?auto_68213 ) ) ( not ( = ?auto_68217 ?auto_68213 ) ) ( ON ?auto_68217 ?auto_68214 ) ( not ( = ?auto_68215 ?auto_68212 ) ) ( not ( = ?auto_68215 ?auto_68213 ) ) ( not ( = ?auto_68212 ?auto_68213 ) ) ( not ( = ?auto_68210 ?auto_68212 ) ) ( not ( = ?auto_68210 ?auto_68215 ) ) ( not ( = ?auto_68211 ?auto_68212 ) ) ( not ( = ?auto_68211 ?auto_68215 ) ) ( not ( = ?auto_68214 ?auto_68212 ) ) ( not ( = ?auto_68214 ?auto_68215 ) ) ( not ( = ?auto_68217 ?auto_68212 ) ) ( not ( = ?auto_68217 ?auto_68215 ) ) ( ON ?auto_68213 ?auto_68217 ) ( ON ?auto_68215 ?auto_68216 ) ( CLEAR ?auto_68215 ) ( not ( = ?auto_68210 ?auto_68216 ) ) ( not ( = ?auto_68211 ?auto_68216 ) ) ( not ( = ?auto_68214 ?auto_68216 ) ) ( not ( = ?auto_68217 ?auto_68216 ) ) ( not ( = ?auto_68213 ?auto_68216 ) ) ( not ( = ?auto_68215 ?auto_68216 ) ) ( not ( = ?auto_68212 ?auto_68216 ) ) ( HOLDING ?auto_68212 ) ( CLEAR ?auto_68213 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68210 ?auto_68211 ?auto_68214 ?auto_68217 ?auto_68213 ?auto_68212 )
      ( MAKE-2PILE ?auto_68210 ?auto_68211 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68218 - BLOCK
      ?auto_68219 - BLOCK
    )
    :vars
    (
      ?auto_68224 - BLOCK
      ?auto_68221 - BLOCK
      ?auto_68223 - BLOCK
      ?auto_68225 - BLOCK
      ?auto_68222 - BLOCK
      ?auto_68220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68224 ?auto_68219 ) ( ON-TABLE ?auto_68218 ) ( ON ?auto_68219 ?auto_68218 ) ( not ( = ?auto_68218 ?auto_68219 ) ) ( not ( = ?auto_68218 ?auto_68224 ) ) ( not ( = ?auto_68219 ?auto_68224 ) ) ( not ( = ?auto_68218 ?auto_68221 ) ) ( not ( = ?auto_68218 ?auto_68223 ) ) ( not ( = ?auto_68219 ?auto_68221 ) ) ( not ( = ?auto_68219 ?auto_68223 ) ) ( not ( = ?auto_68224 ?auto_68221 ) ) ( not ( = ?auto_68224 ?auto_68223 ) ) ( not ( = ?auto_68221 ?auto_68223 ) ) ( ON ?auto_68221 ?auto_68224 ) ( not ( = ?auto_68225 ?auto_68222 ) ) ( not ( = ?auto_68225 ?auto_68223 ) ) ( not ( = ?auto_68222 ?auto_68223 ) ) ( not ( = ?auto_68218 ?auto_68222 ) ) ( not ( = ?auto_68218 ?auto_68225 ) ) ( not ( = ?auto_68219 ?auto_68222 ) ) ( not ( = ?auto_68219 ?auto_68225 ) ) ( not ( = ?auto_68224 ?auto_68222 ) ) ( not ( = ?auto_68224 ?auto_68225 ) ) ( not ( = ?auto_68221 ?auto_68222 ) ) ( not ( = ?auto_68221 ?auto_68225 ) ) ( ON ?auto_68223 ?auto_68221 ) ( ON ?auto_68225 ?auto_68220 ) ( not ( = ?auto_68218 ?auto_68220 ) ) ( not ( = ?auto_68219 ?auto_68220 ) ) ( not ( = ?auto_68224 ?auto_68220 ) ) ( not ( = ?auto_68221 ?auto_68220 ) ) ( not ( = ?auto_68223 ?auto_68220 ) ) ( not ( = ?auto_68225 ?auto_68220 ) ) ( not ( = ?auto_68222 ?auto_68220 ) ) ( CLEAR ?auto_68223 ) ( ON ?auto_68222 ?auto_68225 ) ( CLEAR ?auto_68222 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68220 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68220 ?auto_68225 )
      ( MAKE-2PILE ?auto_68218 ?auto_68219 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68226 - BLOCK
      ?auto_68227 - BLOCK
    )
    :vars
    (
      ?auto_68228 - BLOCK
      ?auto_68231 - BLOCK
      ?auto_68230 - BLOCK
      ?auto_68233 - BLOCK
      ?auto_68232 - BLOCK
      ?auto_68229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68228 ?auto_68227 ) ( ON-TABLE ?auto_68226 ) ( ON ?auto_68227 ?auto_68226 ) ( not ( = ?auto_68226 ?auto_68227 ) ) ( not ( = ?auto_68226 ?auto_68228 ) ) ( not ( = ?auto_68227 ?auto_68228 ) ) ( not ( = ?auto_68226 ?auto_68231 ) ) ( not ( = ?auto_68226 ?auto_68230 ) ) ( not ( = ?auto_68227 ?auto_68231 ) ) ( not ( = ?auto_68227 ?auto_68230 ) ) ( not ( = ?auto_68228 ?auto_68231 ) ) ( not ( = ?auto_68228 ?auto_68230 ) ) ( not ( = ?auto_68231 ?auto_68230 ) ) ( ON ?auto_68231 ?auto_68228 ) ( not ( = ?auto_68233 ?auto_68232 ) ) ( not ( = ?auto_68233 ?auto_68230 ) ) ( not ( = ?auto_68232 ?auto_68230 ) ) ( not ( = ?auto_68226 ?auto_68232 ) ) ( not ( = ?auto_68226 ?auto_68233 ) ) ( not ( = ?auto_68227 ?auto_68232 ) ) ( not ( = ?auto_68227 ?auto_68233 ) ) ( not ( = ?auto_68228 ?auto_68232 ) ) ( not ( = ?auto_68228 ?auto_68233 ) ) ( not ( = ?auto_68231 ?auto_68232 ) ) ( not ( = ?auto_68231 ?auto_68233 ) ) ( ON ?auto_68233 ?auto_68229 ) ( not ( = ?auto_68226 ?auto_68229 ) ) ( not ( = ?auto_68227 ?auto_68229 ) ) ( not ( = ?auto_68228 ?auto_68229 ) ) ( not ( = ?auto_68231 ?auto_68229 ) ) ( not ( = ?auto_68230 ?auto_68229 ) ) ( not ( = ?auto_68233 ?auto_68229 ) ) ( not ( = ?auto_68232 ?auto_68229 ) ) ( ON ?auto_68232 ?auto_68233 ) ( CLEAR ?auto_68232 ) ( ON-TABLE ?auto_68229 ) ( HOLDING ?auto_68230 ) ( CLEAR ?auto_68231 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68226 ?auto_68227 ?auto_68228 ?auto_68231 ?auto_68230 )
      ( MAKE-2PILE ?auto_68226 ?auto_68227 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68277 - BLOCK
      ?auto_68278 - BLOCK
      ?auto_68279 - BLOCK
      ?auto_68280 - BLOCK
      ?auto_68281 - BLOCK
    )
    :vars
    (
      ?auto_68282 - BLOCK
      ?auto_68283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68277 ) ( ON ?auto_68278 ?auto_68277 ) ( ON ?auto_68279 ?auto_68278 ) ( not ( = ?auto_68277 ?auto_68278 ) ) ( not ( = ?auto_68277 ?auto_68279 ) ) ( not ( = ?auto_68277 ?auto_68280 ) ) ( not ( = ?auto_68277 ?auto_68281 ) ) ( not ( = ?auto_68278 ?auto_68279 ) ) ( not ( = ?auto_68278 ?auto_68280 ) ) ( not ( = ?auto_68278 ?auto_68281 ) ) ( not ( = ?auto_68279 ?auto_68280 ) ) ( not ( = ?auto_68279 ?auto_68281 ) ) ( not ( = ?auto_68280 ?auto_68281 ) ) ( ON ?auto_68281 ?auto_68282 ) ( not ( = ?auto_68277 ?auto_68282 ) ) ( not ( = ?auto_68278 ?auto_68282 ) ) ( not ( = ?auto_68279 ?auto_68282 ) ) ( not ( = ?auto_68280 ?auto_68282 ) ) ( not ( = ?auto_68281 ?auto_68282 ) ) ( CLEAR ?auto_68279 ) ( ON ?auto_68280 ?auto_68281 ) ( CLEAR ?auto_68280 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68283 ) ( ON ?auto_68282 ?auto_68283 ) ( not ( = ?auto_68283 ?auto_68282 ) ) ( not ( = ?auto_68283 ?auto_68281 ) ) ( not ( = ?auto_68283 ?auto_68280 ) ) ( not ( = ?auto_68277 ?auto_68283 ) ) ( not ( = ?auto_68278 ?auto_68283 ) ) ( not ( = ?auto_68279 ?auto_68283 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68283 ?auto_68282 ?auto_68281 )
      ( MAKE-5PILE ?auto_68277 ?auto_68278 ?auto_68279 ?auto_68280 ?auto_68281 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68284 - BLOCK
      ?auto_68285 - BLOCK
      ?auto_68286 - BLOCK
      ?auto_68287 - BLOCK
      ?auto_68288 - BLOCK
    )
    :vars
    (
      ?auto_68290 - BLOCK
      ?auto_68289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68284 ) ( ON ?auto_68285 ?auto_68284 ) ( not ( = ?auto_68284 ?auto_68285 ) ) ( not ( = ?auto_68284 ?auto_68286 ) ) ( not ( = ?auto_68284 ?auto_68287 ) ) ( not ( = ?auto_68284 ?auto_68288 ) ) ( not ( = ?auto_68285 ?auto_68286 ) ) ( not ( = ?auto_68285 ?auto_68287 ) ) ( not ( = ?auto_68285 ?auto_68288 ) ) ( not ( = ?auto_68286 ?auto_68287 ) ) ( not ( = ?auto_68286 ?auto_68288 ) ) ( not ( = ?auto_68287 ?auto_68288 ) ) ( ON ?auto_68288 ?auto_68290 ) ( not ( = ?auto_68284 ?auto_68290 ) ) ( not ( = ?auto_68285 ?auto_68290 ) ) ( not ( = ?auto_68286 ?auto_68290 ) ) ( not ( = ?auto_68287 ?auto_68290 ) ) ( not ( = ?auto_68288 ?auto_68290 ) ) ( ON ?auto_68287 ?auto_68288 ) ( CLEAR ?auto_68287 ) ( ON-TABLE ?auto_68289 ) ( ON ?auto_68290 ?auto_68289 ) ( not ( = ?auto_68289 ?auto_68290 ) ) ( not ( = ?auto_68289 ?auto_68288 ) ) ( not ( = ?auto_68289 ?auto_68287 ) ) ( not ( = ?auto_68284 ?auto_68289 ) ) ( not ( = ?auto_68285 ?auto_68289 ) ) ( not ( = ?auto_68286 ?auto_68289 ) ) ( HOLDING ?auto_68286 ) ( CLEAR ?auto_68285 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68284 ?auto_68285 ?auto_68286 )
      ( MAKE-5PILE ?auto_68284 ?auto_68285 ?auto_68286 ?auto_68287 ?auto_68288 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68291 - BLOCK
      ?auto_68292 - BLOCK
      ?auto_68293 - BLOCK
      ?auto_68294 - BLOCK
      ?auto_68295 - BLOCK
    )
    :vars
    (
      ?auto_68296 - BLOCK
      ?auto_68297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68291 ) ( ON ?auto_68292 ?auto_68291 ) ( not ( = ?auto_68291 ?auto_68292 ) ) ( not ( = ?auto_68291 ?auto_68293 ) ) ( not ( = ?auto_68291 ?auto_68294 ) ) ( not ( = ?auto_68291 ?auto_68295 ) ) ( not ( = ?auto_68292 ?auto_68293 ) ) ( not ( = ?auto_68292 ?auto_68294 ) ) ( not ( = ?auto_68292 ?auto_68295 ) ) ( not ( = ?auto_68293 ?auto_68294 ) ) ( not ( = ?auto_68293 ?auto_68295 ) ) ( not ( = ?auto_68294 ?auto_68295 ) ) ( ON ?auto_68295 ?auto_68296 ) ( not ( = ?auto_68291 ?auto_68296 ) ) ( not ( = ?auto_68292 ?auto_68296 ) ) ( not ( = ?auto_68293 ?auto_68296 ) ) ( not ( = ?auto_68294 ?auto_68296 ) ) ( not ( = ?auto_68295 ?auto_68296 ) ) ( ON ?auto_68294 ?auto_68295 ) ( ON-TABLE ?auto_68297 ) ( ON ?auto_68296 ?auto_68297 ) ( not ( = ?auto_68297 ?auto_68296 ) ) ( not ( = ?auto_68297 ?auto_68295 ) ) ( not ( = ?auto_68297 ?auto_68294 ) ) ( not ( = ?auto_68291 ?auto_68297 ) ) ( not ( = ?auto_68292 ?auto_68297 ) ) ( not ( = ?auto_68293 ?auto_68297 ) ) ( CLEAR ?auto_68292 ) ( ON ?auto_68293 ?auto_68294 ) ( CLEAR ?auto_68293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68297 ?auto_68296 ?auto_68295 ?auto_68294 )
      ( MAKE-5PILE ?auto_68291 ?auto_68292 ?auto_68293 ?auto_68294 ?auto_68295 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68298 - BLOCK
      ?auto_68299 - BLOCK
      ?auto_68300 - BLOCK
      ?auto_68301 - BLOCK
      ?auto_68302 - BLOCK
    )
    :vars
    (
      ?auto_68304 - BLOCK
      ?auto_68303 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68298 ) ( not ( = ?auto_68298 ?auto_68299 ) ) ( not ( = ?auto_68298 ?auto_68300 ) ) ( not ( = ?auto_68298 ?auto_68301 ) ) ( not ( = ?auto_68298 ?auto_68302 ) ) ( not ( = ?auto_68299 ?auto_68300 ) ) ( not ( = ?auto_68299 ?auto_68301 ) ) ( not ( = ?auto_68299 ?auto_68302 ) ) ( not ( = ?auto_68300 ?auto_68301 ) ) ( not ( = ?auto_68300 ?auto_68302 ) ) ( not ( = ?auto_68301 ?auto_68302 ) ) ( ON ?auto_68302 ?auto_68304 ) ( not ( = ?auto_68298 ?auto_68304 ) ) ( not ( = ?auto_68299 ?auto_68304 ) ) ( not ( = ?auto_68300 ?auto_68304 ) ) ( not ( = ?auto_68301 ?auto_68304 ) ) ( not ( = ?auto_68302 ?auto_68304 ) ) ( ON ?auto_68301 ?auto_68302 ) ( ON-TABLE ?auto_68303 ) ( ON ?auto_68304 ?auto_68303 ) ( not ( = ?auto_68303 ?auto_68304 ) ) ( not ( = ?auto_68303 ?auto_68302 ) ) ( not ( = ?auto_68303 ?auto_68301 ) ) ( not ( = ?auto_68298 ?auto_68303 ) ) ( not ( = ?auto_68299 ?auto_68303 ) ) ( not ( = ?auto_68300 ?auto_68303 ) ) ( ON ?auto_68300 ?auto_68301 ) ( CLEAR ?auto_68300 ) ( HOLDING ?auto_68299 ) ( CLEAR ?auto_68298 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68298 ?auto_68299 )
      ( MAKE-5PILE ?auto_68298 ?auto_68299 ?auto_68300 ?auto_68301 ?auto_68302 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68305 - BLOCK
      ?auto_68306 - BLOCK
      ?auto_68307 - BLOCK
      ?auto_68308 - BLOCK
      ?auto_68309 - BLOCK
    )
    :vars
    (
      ?auto_68311 - BLOCK
      ?auto_68310 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68305 ) ( not ( = ?auto_68305 ?auto_68306 ) ) ( not ( = ?auto_68305 ?auto_68307 ) ) ( not ( = ?auto_68305 ?auto_68308 ) ) ( not ( = ?auto_68305 ?auto_68309 ) ) ( not ( = ?auto_68306 ?auto_68307 ) ) ( not ( = ?auto_68306 ?auto_68308 ) ) ( not ( = ?auto_68306 ?auto_68309 ) ) ( not ( = ?auto_68307 ?auto_68308 ) ) ( not ( = ?auto_68307 ?auto_68309 ) ) ( not ( = ?auto_68308 ?auto_68309 ) ) ( ON ?auto_68309 ?auto_68311 ) ( not ( = ?auto_68305 ?auto_68311 ) ) ( not ( = ?auto_68306 ?auto_68311 ) ) ( not ( = ?auto_68307 ?auto_68311 ) ) ( not ( = ?auto_68308 ?auto_68311 ) ) ( not ( = ?auto_68309 ?auto_68311 ) ) ( ON ?auto_68308 ?auto_68309 ) ( ON-TABLE ?auto_68310 ) ( ON ?auto_68311 ?auto_68310 ) ( not ( = ?auto_68310 ?auto_68311 ) ) ( not ( = ?auto_68310 ?auto_68309 ) ) ( not ( = ?auto_68310 ?auto_68308 ) ) ( not ( = ?auto_68305 ?auto_68310 ) ) ( not ( = ?auto_68306 ?auto_68310 ) ) ( not ( = ?auto_68307 ?auto_68310 ) ) ( ON ?auto_68307 ?auto_68308 ) ( CLEAR ?auto_68305 ) ( ON ?auto_68306 ?auto_68307 ) ( CLEAR ?auto_68306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68310 ?auto_68311 ?auto_68309 ?auto_68308 ?auto_68307 )
      ( MAKE-5PILE ?auto_68305 ?auto_68306 ?auto_68307 ?auto_68308 ?auto_68309 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68312 - BLOCK
      ?auto_68313 - BLOCK
      ?auto_68314 - BLOCK
      ?auto_68315 - BLOCK
      ?auto_68316 - BLOCK
    )
    :vars
    (
      ?auto_68317 - BLOCK
      ?auto_68318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68312 ?auto_68313 ) ) ( not ( = ?auto_68312 ?auto_68314 ) ) ( not ( = ?auto_68312 ?auto_68315 ) ) ( not ( = ?auto_68312 ?auto_68316 ) ) ( not ( = ?auto_68313 ?auto_68314 ) ) ( not ( = ?auto_68313 ?auto_68315 ) ) ( not ( = ?auto_68313 ?auto_68316 ) ) ( not ( = ?auto_68314 ?auto_68315 ) ) ( not ( = ?auto_68314 ?auto_68316 ) ) ( not ( = ?auto_68315 ?auto_68316 ) ) ( ON ?auto_68316 ?auto_68317 ) ( not ( = ?auto_68312 ?auto_68317 ) ) ( not ( = ?auto_68313 ?auto_68317 ) ) ( not ( = ?auto_68314 ?auto_68317 ) ) ( not ( = ?auto_68315 ?auto_68317 ) ) ( not ( = ?auto_68316 ?auto_68317 ) ) ( ON ?auto_68315 ?auto_68316 ) ( ON-TABLE ?auto_68318 ) ( ON ?auto_68317 ?auto_68318 ) ( not ( = ?auto_68318 ?auto_68317 ) ) ( not ( = ?auto_68318 ?auto_68316 ) ) ( not ( = ?auto_68318 ?auto_68315 ) ) ( not ( = ?auto_68312 ?auto_68318 ) ) ( not ( = ?auto_68313 ?auto_68318 ) ) ( not ( = ?auto_68314 ?auto_68318 ) ) ( ON ?auto_68314 ?auto_68315 ) ( ON ?auto_68313 ?auto_68314 ) ( CLEAR ?auto_68313 ) ( HOLDING ?auto_68312 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68312 )
      ( MAKE-5PILE ?auto_68312 ?auto_68313 ?auto_68314 ?auto_68315 ?auto_68316 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68319 - BLOCK
      ?auto_68320 - BLOCK
      ?auto_68321 - BLOCK
      ?auto_68322 - BLOCK
      ?auto_68323 - BLOCK
    )
    :vars
    (
      ?auto_68325 - BLOCK
      ?auto_68324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68319 ?auto_68320 ) ) ( not ( = ?auto_68319 ?auto_68321 ) ) ( not ( = ?auto_68319 ?auto_68322 ) ) ( not ( = ?auto_68319 ?auto_68323 ) ) ( not ( = ?auto_68320 ?auto_68321 ) ) ( not ( = ?auto_68320 ?auto_68322 ) ) ( not ( = ?auto_68320 ?auto_68323 ) ) ( not ( = ?auto_68321 ?auto_68322 ) ) ( not ( = ?auto_68321 ?auto_68323 ) ) ( not ( = ?auto_68322 ?auto_68323 ) ) ( ON ?auto_68323 ?auto_68325 ) ( not ( = ?auto_68319 ?auto_68325 ) ) ( not ( = ?auto_68320 ?auto_68325 ) ) ( not ( = ?auto_68321 ?auto_68325 ) ) ( not ( = ?auto_68322 ?auto_68325 ) ) ( not ( = ?auto_68323 ?auto_68325 ) ) ( ON ?auto_68322 ?auto_68323 ) ( ON-TABLE ?auto_68324 ) ( ON ?auto_68325 ?auto_68324 ) ( not ( = ?auto_68324 ?auto_68325 ) ) ( not ( = ?auto_68324 ?auto_68323 ) ) ( not ( = ?auto_68324 ?auto_68322 ) ) ( not ( = ?auto_68319 ?auto_68324 ) ) ( not ( = ?auto_68320 ?auto_68324 ) ) ( not ( = ?auto_68321 ?auto_68324 ) ) ( ON ?auto_68321 ?auto_68322 ) ( ON ?auto_68320 ?auto_68321 ) ( ON ?auto_68319 ?auto_68320 ) ( CLEAR ?auto_68319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68324 ?auto_68325 ?auto_68323 ?auto_68322 ?auto_68321 ?auto_68320 )
      ( MAKE-5PILE ?auto_68319 ?auto_68320 ?auto_68321 ?auto_68322 ?auto_68323 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68331 - BLOCK
      ?auto_68332 - BLOCK
      ?auto_68333 - BLOCK
      ?auto_68334 - BLOCK
      ?auto_68335 - BLOCK
    )
    :vars
    (
      ?auto_68337 - BLOCK
      ?auto_68336 - BLOCK
      ?auto_68338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68331 ?auto_68332 ) ) ( not ( = ?auto_68331 ?auto_68333 ) ) ( not ( = ?auto_68331 ?auto_68334 ) ) ( not ( = ?auto_68331 ?auto_68335 ) ) ( not ( = ?auto_68332 ?auto_68333 ) ) ( not ( = ?auto_68332 ?auto_68334 ) ) ( not ( = ?auto_68332 ?auto_68335 ) ) ( not ( = ?auto_68333 ?auto_68334 ) ) ( not ( = ?auto_68333 ?auto_68335 ) ) ( not ( = ?auto_68334 ?auto_68335 ) ) ( ON ?auto_68335 ?auto_68337 ) ( not ( = ?auto_68331 ?auto_68337 ) ) ( not ( = ?auto_68332 ?auto_68337 ) ) ( not ( = ?auto_68333 ?auto_68337 ) ) ( not ( = ?auto_68334 ?auto_68337 ) ) ( not ( = ?auto_68335 ?auto_68337 ) ) ( ON ?auto_68334 ?auto_68335 ) ( ON-TABLE ?auto_68336 ) ( ON ?auto_68337 ?auto_68336 ) ( not ( = ?auto_68336 ?auto_68337 ) ) ( not ( = ?auto_68336 ?auto_68335 ) ) ( not ( = ?auto_68336 ?auto_68334 ) ) ( not ( = ?auto_68331 ?auto_68336 ) ) ( not ( = ?auto_68332 ?auto_68336 ) ) ( not ( = ?auto_68333 ?auto_68336 ) ) ( ON ?auto_68333 ?auto_68334 ) ( ON ?auto_68332 ?auto_68333 ) ( CLEAR ?auto_68332 ) ( ON ?auto_68331 ?auto_68338 ) ( CLEAR ?auto_68331 ) ( HAND-EMPTY ) ( not ( = ?auto_68331 ?auto_68338 ) ) ( not ( = ?auto_68332 ?auto_68338 ) ) ( not ( = ?auto_68333 ?auto_68338 ) ) ( not ( = ?auto_68334 ?auto_68338 ) ) ( not ( = ?auto_68335 ?auto_68338 ) ) ( not ( = ?auto_68337 ?auto_68338 ) ) ( not ( = ?auto_68336 ?auto_68338 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68331 ?auto_68338 )
      ( MAKE-5PILE ?auto_68331 ?auto_68332 ?auto_68333 ?auto_68334 ?auto_68335 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68339 - BLOCK
      ?auto_68340 - BLOCK
      ?auto_68341 - BLOCK
      ?auto_68342 - BLOCK
      ?auto_68343 - BLOCK
    )
    :vars
    (
      ?auto_68345 - BLOCK
      ?auto_68346 - BLOCK
      ?auto_68344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68339 ?auto_68340 ) ) ( not ( = ?auto_68339 ?auto_68341 ) ) ( not ( = ?auto_68339 ?auto_68342 ) ) ( not ( = ?auto_68339 ?auto_68343 ) ) ( not ( = ?auto_68340 ?auto_68341 ) ) ( not ( = ?auto_68340 ?auto_68342 ) ) ( not ( = ?auto_68340 ?auto_68343 ) ) ( not ( = ?auto_68341 ?auto_68342 ) ) ( not ( = ?auto_68341 ?auto_68343 ) ) ( not ( = ?auto_68342 ?auto_68343 ) ) ( ON ?auto_68343 ?auto_68345 ) ( not ( = ?auto_68339 ?auto_68345 ) ) ( not ( = ?auto_68340 ?auto_68345 ) ) ( not ( = ?auto_68341 ?auto_68345 ) ) ( not ( = ?auto_68342 ?auto_68345 ) ) ( not ( = ?auto_68343 ?auto_68345 ) ) ( ON ?auto_68342 ?auto_68343 ) ( ON-TABLE ?auto_68346 ) ( ON ?auto_68345 ?auto_68346 ) ( not ( = ?auto_68346 ?auto_68345 ) ) ( not ( = ?auto_68346 ?auto_68343 ) ) ( not ( = ?auto_68346 ?auto_68342 ) ) ( not ( = ?auto_68339 ?auto_68346 ) ) ( not ( = ?auto_68340 ?auto_68346 ) ) ( not ( = ?auto_68341 ?auto_68346 ) ) ( ON ?auto_68341 ?auto_68342 ) ( ON ?auto_68339 ?auto_68344 ) ( CLEAR ?auto_68339 ) ( not ( = ?auto_68339 ?auto_68344 ) ) ( not ( = ?auto_68340 ?auto_68344 ) ) ( not ( = ?auto_68341 ?auto_68344 ) ) ( not ( = ?auto_68342 ?auto_68344 ) ) ( not ( = ?auto_68343 ?auto_68344 ) ) ( not ( = ?auto_68345 ?auto_68344 ) ) ( not ( = ?auto_68346 ?auto_68344 ) ) ( HOLDING ?auto_68340 ) ( CLEAR ?auto_68341 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68346 ?auto_68345 ?auto_68343 ?auto_68342 ?auto_68341 ?auto_68340 )
      ( MAKE-5PILE ?auto_68339 ?auto_68340 ?auto_68341 ?auto_68342 ?auto_68343 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68347 - BLOCK
      ?auto_68348 - BLOCK
      ?auto_68349 - BLOCK
      ?auto_68350 - BLOCK
      ?auto_68351 - BLOCK
    )
    :vars
    (
      ?auto_68352 - BLOCK
      ?auto_68354 - BLOCK
      ?auto_68353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68347 ?auto_68348 ) ) ( not ( = ?auto_68347 ?auto_68349 ) ) ( not ( = ?auto_68347 ?auto_68350 ) ) ( not ( = ?auto_68347 ?auto_68351 ) ) ( not ( = ?auto_68348 ?auto_68349 ) ) ( not ( = ?auto_68348 ?auto_68350 ) ) ( not ( = ?auto_68348 ?auto_68351 ) ) ( not ( = ?auto_68349 ?auto_68350 ) ) ( not ( = ?auto_68349 ?auto_68351 ) ) ( not ( = ?auto_68350 ?auto_68351 ) ) ( ON ?auto_68351 ?auto_68352 ) ( not ( = ?auto_68347 ?auto_68352 ) ) ( not ( = ?auto_68348 ?auto_68352 ) ) ( not ( = ?auto_68349 ?auto_68352 ) ) ( not ( = ?auto_68350 ?auto_68352 ) ) ( not ( = ?auto_68351 ?auto_68352 ) ) ( ON ?auto_68350 ?auto_68351 ) ( ON-TABLE ?auto_68354 ) ( ON ?auto_68352 ?auto_68354 ) ( not ( = ?auto_68354 ?auto_68352 ) ) ( not ( = ?auto_68354 ?auto_68351 ) ) ( not ( = ?auto_68354 ?auto_68350 ) ) ( not ( = ?auto_68347 ?auto_68354 ) ) ( not ( = ?auto_68348 ?auto_68354 ) ) ( not ( = ?auto_68349 ?auto_68354 ) ) ( ON ?auto_68349 ?auto_68350 ) ( ON ?auto_68347 ?auto_68353 ) ( not ( = ?auto_68347 ?auto_68353 ) ) ( not ( = ?auto_68348 ?auto_68353 ) ) ( not ( = ?auto_68349 ?auto_68353 ) ) ( not ( = ?auto_68350 ?auto_68353 ) ) ( not ( = ?auto_68351 ?auto_68353 ) ) ( not ( = ?auto_68352 ?auto_68353 ) ) ( not ( = ?auto_68354 ?auto_68353 ) ) ( CLEAR ?auto_68349 ) ( ON ?auto_68348 ?auto_68347 ) ( CLEAR ?auto_68348 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68353 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68353 ?auto_68347 )
      ( MAKE-5PILE ?auto_68347 ?auto_68348 ?auto_68349 ?auto_68350 ?auto_68351 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68355 - BLOCK
      ?auto_68356 - BLOCK
      ?auto_68357 - BLOCK
      ?auto_68358 - BLOCK
      ?auto_68359 - BLOCK
    )
    :vars
    (
      ?auto_68361 - BLOCK
      ?auto_68360 - BLOCK
      ?auto_68362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68355 ?auto_68356 ) ) ( not ( = ?auto_68355 ?auto_68357 ) ) ( not ( = ?auto_68355 ?auto_68358 ) ) ( not ( = ?auto_68355 ?auto_68359 ) ) ( not ( = ?auto_68356 ?auto_68357 ) ) ( not ( = ?auto_68356 ?auto_68358 ) ) ( not ( = ?auto_68356 ?auto_68359 ) ) ( not ( = ?auto_68357 ?auto_68358 ) ) ( not ( = ?auto_68357 ?auto_68359 ) ) ( not ( = ?auto_68358 ?auto_68359 ) ) ( ON ?auto_68359 ?auto_68361 ) ( not ( = ?auto_68355 ?auto_68361 ) ) ( not ( = ?auto_68356 ?auto_68361 ) ) ( not ( = ?auto_68357 ?auto_68361 ) ) ( not ( = ?auto_68358 ?auto_68361 ) ) ( not ( = ?auto_68359 ?auto_68361 ) ) ( ON ?auto_68358 ?auto_68359 ) ( ON-TABLE ?auto_68360 ) ( ON ?auto_68361 ?auto_68360 ) ( not ( = ?auto_68360 ?auto_68361 ) ) ( not ( = ?auto_68360 ?auto_68359 ) ) ( not ( = ?auto_68360 ?auto_68358 ) ) ( not ( = ?auto_68355 ?auto_68360 ) ) ( not ( = ?auto_68356 ?auto_68360 ) ) ( not ( = ?auto_68357 ?auto_68360 ) ) ( ON ?auto_68355 ?auto_68362 ) ( not ( = ?auto_68355 ?auto_68362 ) ) ( not ( = ?auto_68356 ?auto_68362 ) ) ( not ( = ?auto_68357 ?auto_68362 ) ) ( not ( = ?auto_68358 ?auto_68362 ) ) ( not ( = ?auto_68359 ?auto_68362 ) ) ( not ( = ?auto_68361 ?auto_68362 ) ) ( not ( = ?auto_68360 ?auto_68362 ) ) ( ON ?auto_68356 ?auto_68355 ) ( CLEAR ?auto_68356 ) ( ON-TABLE ?auto_68362 ) ( HOLDING ?auto_68357 ) ( CLEAR ?auto_68358 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68360 ?auto_68361 ?auto_68359 ?auto_68358 ?auto_68357 )
      ( MAKE-5PILE ?auto_68355 ?auto_68356 ?auto_68357 ?auto_68358 ?auto_68359 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68363 - BLOCK
      ?auto_68364 - BLOCK
      ?auto_68365 - BLOCK
      ?auto_68366 - BLOCK
      ?auto_68367 - BLOCK
    )
    :vars
    (
      ?auto_68370 - BLOCK
      ?auto_68368 - BLOCK
      ?auto_68369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68363 ?auto_68364 ) ) ( not ( = ?auto_68363 ?auto_68365 ) ) ( not ( = ?auto_68363 ?auto_68366 ) ) ( not ( = ?auto_68363 ?auto_68367 ) ) ( not ( = ?auto_68364 ?auto_68365 ) ) ( not ( = ?auto_68364 ?auto_68366 ) ) ( not ( = ?auto_68364 ?auto_68367 ) ) ( not ( = ?auto_68365 ?auto_68366 ) ) ( not ( = ?auto_68365 ?auto_68367 ) ) ( not ( = ?auto_68366 ?auto_68367 ) ) ( ON ?auto_68367 ?auto_68370 ) ( not ( = ?auto_68363 ?auto_68370 ) ) ( not ( = ?auto_68364 ?auto_68370 ) ) ( not ( = ?auto_68365 ?auto_68370 ) ) ( not ( = ?auto_68366 ?auto_68370 ) ) ( not ( = ?auto_68367 ?auto_68370 ) ) ( ON ?auto_68366 ?auto_68367 ) ( ON-TABLE ?auto_68368 ) ( ON ?auto_68370 ?auto_68368 ) ( not ( = ?auto_68368 ?auto_68370 ) ) ( not ( = ?auto_68368 ?auto_68367 ) ) ( not ( = ?auto_68368 ?auto_68366 ) ) ( not ( = ?auto_68363 ?auto_68368 ) ) ( not ( = ?auto_68364 ?auto_68368 ) ) ( not ( = ?auto_68365 ?auto_68368 ) ) ( ON ?auto_68363 ?auto_68369 ) ( not ( = ?auto_68363 ?auto_68369 ) ) ( not ( = ?auto_68364 ?auto_68369 ) ) ( not ( = ?auto_68365 ?auto_68369 ) ) ( not ( = ?auto_68366 ?auto_68369 ) ) ( not ( = ?auto_68367 ?auto_68369 ) ) ( not ( = ?auto_68370 ?auto_68369 ) ) ( not ( = ?auto_68368 ?auto_68369 ) ) ( ON ?auto_68364 ?auto_68363 ) ( ON-TABLE ?auto_68369 ) ( CLEAR ?auto_68366 ) ( ON ?auto_68365 ?auto_68364 ) ( CLEAR ?auto_68365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68369 ?auto_68363 ?auto_68364 )
      ( MAKE-5PILE ?auto_68363 ?auto_68364 ?auto_68365 ?auto_68366 ?auto_68367 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68371 - BLOCK
      ?auto_68372 - BLOCK
      ?auto_68373 - BLOCK
      ?auto_68374 - BLOCK
      ?auto_68375 - BLOCK
    )
    :vars
    (
      ?auto_68376 - BLOCK
      ?auto_68377 - BLOCK
      ?auto_68378 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68371 ?auto_68372 ) ) ( not ( = ?auto_68371 ?auto_68373 ) ) ( not ( = ?auto_68371 ?auto_68374 ) ) ( not ( = ?auto_68371 ?auto_68375 ) ) ( not ( = ?auto_68372 ?auto_68373 ) ) ( not ( = ?auto_68372 ?auto_68374 ) ) ( not ( = ?auto_68372 ?auto_68375 ) ) ( not ( = ?auto_68373 ?auto_68374 ) ) ( not ( = ?auto_68373 ?auto_68375 ) ) ( not ( = ?auto_68374 ?auto_68375 ) ) ( ON ?auto_68375 ?auto_68376 ) ( not ( = ?auto_68371 ?auto_68376 ) ) ( not ( = ?auto_68372 ?auto_68376 ) ) ( not ( = ?auto_68373 ?auto_68376 ) ) ( not ( = ?auto_68374 ?auto_68376 ) ) ( not ( = ?auto_68375 ?auto_68376 ) ) ( ON-TABLE ?auto_68377 ) ( ON ?auto_68376 ?auto_68377 ) ( not ( = ?auto_68377 ?auto_68376 ) ) ( not ( = ?auto_68377 ?auto_68375 ) ) ( not ( = ?auto_68377 ?auto_68374 ) ) ( not ( = ?auto_68371 ?auto_68377 ) ) ( not ( = ?auto_68372 ?auto_68377 ) ) ( not ( = ?auto_68373 ?auto_68377 ) ) ( ON ?auto_68371 ?auto_68378 ) ( not ( = ?auto_68371 ?auto_68378 ) ) ( not ( = ?auto_68372 ?auto_68378 ) ) ( not ( = ?auto_68373 ?auto_68378 ) ) ( not ( = ?auto_68374 ?auto_68378 ) ) ( not ( = ?auto_68375 ?auto_68378 ) ) ( not ( = ?auto_68376 ?auto_68378 ) ) ( not ( = ?auto_68377 ?auto_68378 ) ) ( ON ?auto_68372 ?auto_68371 ) ( ON-TABLE ?auto_68378 ) ( ON ?auto_68373 ?auto_68372 ) ( CLEAR ?auto_68373 ) ( HOLDING ?auto_68374 ) ( CLEAR ?auto_68375 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68377 ?auto_68376 ?auto_68375 ?auto_68374 )
      ( MAKE-5PILE ?auto_68371 ?auto_68372 ?auto_68373 ?auto_68374 ?auto_68375 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68379 - BLOCK
      ?auto_68380 - BLOCK
      ?auto_68381 - BLOCK
      ?auto_68382 - BLOCK
      ?auto_68383 - BLOCK
    )
    :vars
    (
      ?auto_68385 - BLOCK
      ?auto_68386 - BLOCK
      ?auto_68384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68379 ?auto_68380 ) ) ( not ( = ?auto_68379 ?auto_68381 ) ) ( not ( = ?auto_68379 ?auto_68382 ) ) ( not ( = ?auto_68379 ?auto_68383 ) ) ( not ( = ?auto_68380 ?auto_68381 ) ) ( not ( = ?auto_68380 ?auto_68382 ) ) ( not ( = ?auto_68380 ?auto_68383 ) ) ( not ( = ?auto_68381 ?auto_68382 ) ) ( not ( = ?auto_68381 ?auto_68383 ) ) ( not ( = ?auto_68382 ?auto_68383 ) ) ( ON ?auto_68383 ?auto_68385 ) ( not ( = ?auto_68379 ?auto_68385 ) ) ( not ( = ?auto_68380 ?auto_68385 ) ) ( not ( = ?auto_68381 ?auto_68385 ) ) ( not ( = ?auto_68382 ?auto_68385 ) ) ( not ( = ?auto_68383 ?auto_68385 ) ) ( ON-TABLE ?auto_68386 ) ( ON ?auto_68385 ?auto_68386 ) ( not ( = ?auto_68386 ?auto_68385 ) ) ( not ( = ?auto_68386 ?auto_68383 ) ) ( not ( = ?auto_68386 ?auto_68382 ) ) ( not ( = ?auto_68379 ?auto_68386 ) ) ( not ( = ?auto_68380 ?auto_68386 ) ) ( not ( = ?auto_68381 ?auto_68386 ) ) ( ON ?auto_68379 ?auto_68384 ) ( not ( = ?auto_68379 ?auto_68384 ) ) ( not ( = ?auto_68380 ?auto_68384 ) ) ( not ( = ?auto_68381 ?auto_68384 ) ) ( not ( = ?auto_68382 ?auto_68384 ) ) ( not ( = ?auto_68383 ?auto_68384 ) ) ( not ( = ?auto_68385 ?auto_68384 ) ) ( not ( = ?auto_68386 ?auto_68384 ) ) ( ON ?auto_68380 ?auto_68379 ) ( ON-TABLE ?auto_68384 ) ( ON ?auto_68381 ?auto_68380 ) ( CLEAR ?auto_68383 ) ( ON ?auto_68382 ?auto_68381 ) ( CLEAR ?auto_68382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68384 ?auto_68379 ?auto_68380 ?auto_68381 )
      ( MAKE-5PILE ?auto_68379 ?auto_68380 ?auto_68381 ?auto_68382 ?auto_68383 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68387 - BLOCK
      ?auto_68388 - BLOCK
      ?auto_68389 - BLOCK
      ?auto_68390 - BLOCK
      ?auto_68391 - BLOCK
    )
    :vars
    (
      ?auto_68393 - BLOCK
      ?auto_68394 - BLOCK
      ?auto_68392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68387 ?auto_68388 ) ) ( not ( = ?auto_68387 ?auto_68389 ) ) ( not ( = ?auto_68387 ?auto_68390 ) ) ( not ( = ?auto_68387 ?auto_68391 ) ) ( not ( = ?auto_68388 ?auto_68389 ) ) ( not ( = ?auto_68388 ?auto_68390 ) ) ( not ( = ?auto_68388 ?auto_68391 ) ) ( not ( = ?auto_68389 ?auto_68390 ) ) ( not ( = ?auto_68389 ?auto_68391 ) ) ( not ( = ?auto_68390 ?auto_68391 ) ) ( not ( = ?auto_68387 ?auto_68393 ) ) ( not ( = ?auto_68388 ?auto_68393 ) ) ( not ( = ?auto_68389 ?auto_68393 ) ) ( not ( = ?auto_68390 ?auto_68393 ) ) ( not ( = ?auto_68391 ?auto_68393 ) ) ( ON-TABLE ?auto_68394 ) ( ON ?auto_68393 ?auto_68394 ) ( not ( = ?auto_68394 ?auto_68393 ) ) ( not ( = ?auto_68394 ?auto_68391 ) ) ( not ( = ?auto_68394 ?auto_68390 ) ) ( not ( = ?auto_68387 ?auto_68394 ) ) ( not ( = ?auto_68388 ?auto_68394 ) ) ( not ( = ?auto_68389 ?auto_68394 ) ) ( ON ?auto_68387 ?auto_68392 ) ( not ( = ?auto_68387 ?auto_68392 ) ) ( not ( = ?auto_68388 ?auto_68392 ) ) ( not ( = ?auto_68389 ?auto_68392 ) ) ( not ( = ?auto_68390 ?auto_68392 ) ) ( not ( = ?auto_68391 ?auto_68392 ) ) ( not ( = ?auto_68393 ?auto_68392 ) ) ( not ( = ?auto_68394 ?auto_68392 ) ) ( ON ?auto_68388 ?auto_68387 ) ( ON-TABLE ?auto_68392 ) ( ON ?auto_68389 ?auto_68388 ) ( ON ?auto_68390 ?auto_68389 ) ( CLEAR ?auto_68390 ) ( HOLDING ?auto_68391 ) ( CLEAR ?auto_68393 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68394 ?auto_68393 ?auto_68391 )
      ( MAKE-5PILE ?auto_68387 ?auto_68388 ?auto_68389 ?auto_68390 ?auto_68391 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68395 - BLOCK
      ?auto_68396 - BLOCK
      ?auto_68397 - BLOCK
      ?auto_68398 - BLOCK
      ?auto_68399 - BLOCK
    )
    :vars
    (
      ?auto_68400 - BLOCK
      ?auto_68402 - BLOCK
      ?auto_68401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68395 ?auto_68396 ) ) ( not ( = ?auto_68395 ?auto_68397 ) ) ( not ( = ?auto_68395 ?auto_68398 ) ) ( not ( = ?auto_68395 ?auto_68399 ) ) ( not ( = ?auto_68396 ?auto_68397 ) ) ( not ( = ?auto_68396 ?auto_68398 ) ) ( not ( = ?auto_68396 ?auto_68399 ) ) ( not ( = ?auto_68397 ?auto_68398 ) ) ( not ( = ?auto_68397 ?auto_68399 ) ) ( not ( = ?auto_68398 ?auto_68399 ) ) ( not ( = ?auto_68395 ?auto_68400 ) ) ( not ( = ?auto_68396 ?auto_68400 ) ) ( not ( = ?auto_68397 ?auto_68400 ) ) ( not ( = ?auto_68398 ?auto_68400 ) ) ( not ( = ?auto_68399 ?auto_68400 ) ) ( ON-TABLE ?auto_68402 ) ( ON ?auto_68400 ?auto_68402 ) ( not ( = ?auto_68402 ?auto_68400 ) ) ( not ( = ?auto_68402 ?auto_68399 ) ) ( not ( = ?auto_68402 ?auto_68398 ) ) ( not ( = ?auto_68395 ?auto_68402 ) ) ( not ( = ?auto_68396 ?auto_68402 ) ) ( not ( = ?auto_68397 ?auto_68402 ) ) ( ON ?auto_68395 ?auto_68401 ) ( not ( = ?auto_68395 ?auto_68401 ) ) ( not ( = ?auto_68396 ?auto_68401 ) ) ( not ( = ?auto_68397 ?auto_68401 ) ) ( not ( = ?auto_68398 ?auto_68401 ) ) ( not ( = ?auto_68399 ?auto_68401 ) ) ( not ( = ?auto_68400 ?auto_68401 ) ) ( not ( = ?auto_68402 ?auto_68401 ) ) ( ON ?auto_68396 ?auto_68395 ) ( ON-TABLE ?auto_68401 ) ( ON ?auto_68397 ?auto_68396 ) ( ON ?auto_68398 ?auto_68397 ) ( CLEAR ?auto_68400 ) ( ON ?auto_68399 ?auto_68398 ) ( CLEAR ?auto_68399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68401 ?auto_68395 ?auto_68396 ?auto_68397 ?auto_68398 )
      ( MAKE-5PILE ?auto_68395 ?auto_68396 ?auto_68397 ?auto_68398 ?auto_68399 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68403 - BLOCK
      ?auto_68404 - BLOCK
      ?auto_68405 - BLOCK
      ?auto_68406 - BLOCK
      ?auto_68407 - BLOCK
    )
    :vars
    (
      ?auto_68408 - BLOCK
      ?auto_68409 - BLOCK
      ?auto_68410 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68403 ?auto_68404 ) ) ( not ( = ?auto_68403 ?auto_68405 ) ) ( not ( = ?auto_68403 ?auto_68406 ) ) ( not ( = ?auto_68403 ?auto_68407 ) ) ( not ( = ?auto_68404 ?auto_68405 ) ) ( not ( = ?auto_68404 ?auto_68406 ) ) ( not ( = ?auto_68404 ?auto_68407 ) ) ( not ( = ?auto_68405 ?auto_68406 ) ) ( not ( = ?auto_68405 ?auto_68407 ) ) ( not ( = ?auto_68406 ?auto_68407 ) ) ( not ( = ?auto_68403 ?auto_68408 ) ) ( not ( = ?auto_68404 ?auto_68408 ) ) ( not ( = ?auto_68405 ?auto_68408 ) ) ( not ( = ?auto_68406 ?auto_68408 ) ) ( not ( = ?auto_68407 ?auto_68408 ) ) ( ON-TABLE ?auto_68409 ) ( not ( = ?auto_68409 ?auto_68408 ) ) ( not ( = ?auto_68409 ?auto_68407 ) ) ( not ( = ?auto_68409 ?auto_68406 ) ) ( not ( = ?auto_68403 ?auto_68409 ) ) ( not ( = ?auto_68404 ?auto_68409 ) ) ( not ( = ?auto_68405 ?auto_68409 ) ) ( ON ?auto_68403 ?auto_68410 ) ( not ( = ?auto_68403 ?auto_68410 ) ) ( not ( = ?auto_68404 ?auto_68410 ) ) ( not ( = ?auto_68405 ?auto_68410 ) ) ( not ( = ?auto_68406 ?auto_68410 ) ) ( not ( = ?auto_68407 ?auto_68410 ) ) ( not ( = ?auto_68408 ?auto_68410 ) ) ( not ( = ?auto_68409 ?auto_68410 ) ) ( ON ?auto_68404 ?auto_68403 ) ( ON-TABLE ?auto_68410 ) ( ON ?auto_68405 ?auto_68404 ) ( ON ?auto_68406 ?auto_68405 ) ( ON ?auto_68407 ?auto_68406 ) ( CLEAR ?auto_68407 ) ( HOLDING ?auto_68408 ) ( CLEAR ?auto_68409 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68409 ?auto_68408 )
      ( MAKE-5PILE ?auto_68403 ?auto_68404 ?auto_68405 ?auto_68406 ?auto_68407 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68411 - BLOCK
      ?auto_68412 - BLOCK
      ?auto_68413 - BLOCK
      ?auto_68414 - BLOCK
      ?auto_68415 - BLOCK
    )
    :vars
    (
      ?auto_68416 - BLOCK
      ?auto_68418 - BLOCK
      ?auto_68417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68411 ?auto_68412 ) ) ( not ( = ?auto_68411 ?auto_68413 ) ) ( not ( = ?auto_68411 ?auto_68414 ) ) ( not ( = ?auto_68411 ?auto_68415 ) ) ( not ( = ?auto_68412 ?auto_68413 ) ) ( not ( = ?auto_68412 ?auto_68414 ) ) ( not ( = ?auto_68412 ?auto_68415 ) ) ( not ( = ?auto_68413 ?auto_68414 ) ) ( not ( = ?auto_68413 ?auto_68415 ) ) ( not ( = ?auto_68414 ?auto_68415 ) ) ( not ( = ?auto_68411 ?auto_68416 ) ) ( not ( = ?auto_68412 ?auto_68416 ) ) ( not ( = ?auto_68413 ?auto_68416 ) ) ( not ( = ?auto_68414 ?auto_68416 ) ) ( not ( = ?auto_68415 ?auto_68416 ) ) ( ON-TABLE ?auto_68418 ) ( not ( = ?auto_68418 ?auto_68416 ) ) ( not ( = ?auto_68418 ?auto_68415 ) ) ( not ( = ?auto_68418 ?auto_68414 ) ) ( not ( = ?auto_68411 ?auto_68418 ) ) ( not ( = ?auto_68412 ?auto_68418 ) ) ( not ( = ?auto_68413 ?auto_68418 ) ) ( ON ?auto_68411 ?auto_68417 ) ( not ( = ?auto_68411 ?auto_68417 ) ) ( not ( = ?auto_68412 ?auto_68417 ) ) ( not ( = ?auto_68413 ?auto_68417 ) ) ( not ( = ?auto_68414 ?auto_68417 ) ) ( not ( = ?auto_68415 ?auto_68417 ) ) ( not ( = ?auto_68416 ?auto_68417 ) ) ( not ( = ?auto_68418 ?auto_68417 ) ) ( ON ?auto_68412 ?auto_68411 ) ( ON-TABLE ?auto_68417 ) ( ON ?auto_68413 ?auto_68412 ) ( ON ?auto_68414 ?auto_68413 ) ( ON ?auto_68415 ?auto_68414 ) ( CLEAR ?auto_68418 ) ( ON ?auto_68416 ?auto_68415 ) ( CLEAR ?auto_68416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68417 ?auto_68411 ?auto_68412 ?auto_68413 ?auto_68414 ?auto_68415 )
      ( MAKE-5PILE ?auto_68411 ?auto_68412 ?auto_68413 ?auto_68414 ?auto_68415 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68419 - BLOCK
      ?auto_68420 - BLOCK
      ?auto_68421 - BLOCK
      ?auto_68422 - BLOCK
      ?auto_68423 - BLOCK
    )
    :vars
    (
      ?auto_68426 - BLOCK
      ?auto_68425 - BLOCK
      ?auto_68424 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68419 ?auto_68420 ) ) ( not ( = ?auto_68419 ?auto_68421 ) ) ( not ( = ?auto_68419 ?auto_68422 ) ) ( not ( = ?auto_68419 ?auto_68423 ) ) ( not ( = ?auto_68420 ?auto_68421 ) ) ( not ( = ?auto_68420 ?auto_68422 ) ) ( not ( = ?auto_68420 ?auto_68423 ) ) ( not ( = ?auto_68421 ?auto_68422 ) ) ( not ( = ?auto_68421 ?auto_68423 ) ) ( not ( = ?auto_68422 ?auto_68423 ) ) ( not ( = ?auto_68419 ?auto_68426 ) ) ( not ( = ?auto_68420 ?auto_68426 ) ) ( not ( = ?auto_68421 ?auto_68426 ) ) ( not ( = ?auto_68422 ?auto_68426 ) ) ( not ( = ?auto_68423 ?auto_68426 ) ) ( not ( = ?auto_68425 ?auto_68426 ) ) ( not ( = ?auto_68425 ?auto_68423 ) ) ( not ( = ?auto_68425 ?auto_68422 ) ) ( not ( = ?auto_68419 ?auto_68425 ) ) ( not ( = ?auto_68420 ?auto_68425 ) ) ( not ( = ?auto_68421 ?auto_68425 ) ) ( ON ?auto_68419 ?auto_68424 ) ( not ( = ?auto_68419 ?auto_68424 ) ) ( not ( = ?auto_68420 ?auto_68424 ) ) ( not ( = ?auto_68421 ?auto_68424 ) ) ( not ( = ?auto_68422 ?auto_68424 ) ) ( not ( = ?auto_68423 ?auto_68424 ) ) ( not ( = ?auto_68426 ?auto_68424 ) ) ( not ( = ?auto_68425 ?auto_68424 ) ) ( ON ?auto_68420 ?auto_68419 ) ( ON-TABLE ?auto_68424 ) ( ON ?auto_68421 ?auto_68420 ) ( ON ?auto_68422 ?auto_68421 ) ( ON ?auto_68423 ?auto_68422 ) ( ON ?auto_68426 ?auto_68423 ) ( CLEAR ?auto_68426 ) ( HOLDING ?auto_68425 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68425 )
      ( MAKE-5PILE ?auto_68419 ?auto_68420 ?auto_68421 ?auto_68422 ?auto_68423 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68427 - BLOCK
      ?auto_68428 - BLOCK
      ?auto_68429 - BLOCK
      ?auto_68430 - BLOCK
      ?auto_68431 - BLOCK
    )
    :vars
    (
      ?auto_68434 - BLOCK
      ?auto_68433 - BLOCK
      ?auto_68432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68427 ?auto_68428 ) ) ( not ( = ?auto_68427 ?auto_68429 ) ) ( not ( = ?auto_68427 ?auto_68430 ) ) ( not ( = ?auto_68427 ?auto_68431 ) ) ( not ( = ?auto_68428 ?auto_68429 ) ) ( not ( = ?auto_68428 ?auto_68430 ) ) ( not ( = ?auto_68428 ?auto_68431 ) ) ( not ( = ?auto_68429 ?auto_68430 ) ) ( not ( = ?auto_68429 ?auto_68431 ) ) ( not ( = ?auto_68430 ?auto_68431 ) ) ( not ( = ?auto_68427 ?auto_68434 ) ) ( not ( = ?auto_68428 ?auto_68434 ) ) ( not ( = ?auto_68429 ?auto_68434 ) ) ( not ( = ?auto_68430 ?auto_68434 ) ) ( not ( = ?auto_68431 ?auto_68434 ) ) ( not ( = ?auto_68433 ?auto_68434 ) ) ( not ( = ?auto_68433 ?auto_68431 ) ) ( not ( = ?auto_68433 ?auto_68430 ) ) ( not ( = ?auto_68427 ?auto_68433 ) ) ( not ( = ?auto_68428 ?auto_68433 ) ) ( not ( = ?auto_68429 ?auto_68433 ) ) ( ON ?auto_68427 ?auto_68432 ) ( not ( = ?auto_68427 ?auto_68432 ) ) ( not ( = ?auto_68428 ?auto_68432 ) ) ( not ( = ?auto_68429 ?auto_68432 ) ) ( not ( = ?auto_68430 ?auto_68432 ) ) ( not ( = ?auto_68431 ?auto_68432 ) ) ( not ( = ?auto_68434 ?auto_68432 ) ) ( not ( = ?auto_68433 ?auto_68432 ) ) ( ON ?auto_68428 ?auto_68427 ) ( ON-TABLE ?auto_68432 ) ( ON ?auto_68429 ?auto_68428 ) ( ON ?auto_68430 ?auto_68429 ) ( ON ?auto_68431 ?auto_68430 ) ( ON ?auto_68434 ?auto_68431 ) ( ON ?auto_68433 ?auto_68434 ) ( CLEAR ?auto_68433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_68432 ?auto_68427 ?auto_68428 ?auto_68429 ?auto_68430 ?auto_68431 ?auto_68434 )
      ( MAKE-5PILE ?auto_68427 ?auto_68428 ?auto_68429 ?auto_68430 ?auto_68431 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68446 - BLOCK
    )
    :vars
    (
      ?auto_68449 - BLOCK
      ?auto_68448 - BLOCK
      ?auto_68447 - BLOCK
      ?auto_68451 - BLOCK
      ?auto_68450 - BLOCK
      ?auto_68452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68449 ?auto_68446 ) ( ON-TABLE ?auto_68446 ) ( not ( = ?auto_68446 ?auto_68449 ) ) ( not ( = ?auto_68446 ?auto_68448 ) ) ( not ( = ?auto_68446 ?auto_68447 ) ) ( not ( = ?auto_68449 ?auto_68448 ) ) ( not ( = ?auto_68449 ?auto_68447 ) ) ( not ( = ?auto_68448 ?auto_68447 ) ) ( ON ?auto_68448 ?auto_68449 ) ( CLEAR ?auto_68448 ) ( HOLDING ?auto_68447 ) ( CLEAR ?auto_68451 ) ( ON-TABLE ?auto_68450 ) ( ON ?auto_68452 ?auto_68450 ) ( ON ?auto_68451 ?auto_68452 ) ( not ( = ?auto_68450 ?auto_68452 ) ) ( not ( = ?auto_68450 ?auto_68451 ) ) ( not ( = ?auto_68450 ?auto_68447 ) ) ( not ( = ?auto_68452 ?auto_68451 ) ) ( not ( = ?auto_68452 ?auto_68447 ) ) ( not ( = ?auto_68451 ?auto_68447 ) ) ( not ( = ?auto_68446 ?auto_68451 ) ) ( not ( = ?auto_68446 ?auto_68450 ) ) ( not ( = ?auto_68446 ?auto_68452 ) ) ( not ( = ?auto_68449 ?auto_68451 ) ) ( not ( = ?auto_68449 ?auto_68450 ) ) ( not ( = ?auto_68449 ?auto_68452 ) ) ( not ( = ?auto_68448 ?auto_68451 ) ) ( not ( = ?auto_68448 ?auto_68450 ) ) ( not ( = ?auto_68448 ?auto_68452 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68450 ?auto_68452 ?auto_68451 ?auto_68447 )
      ( MAKE-1PILE ?auto_68446 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68453 - BLOCK
    )
    :vars
    (
      ?auto_68459 - BLOCK
      ?auto_68458 - BLOCK
      ?auto_68457 - BLOCK
      ?auto_68455 - BLOCK
      ?auto_68456 - BLOCK
      ?auto_68454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68459 ?auto_68453 ) ( ON-TABLE ?auto_68453 ) ( not ( = ?auto_68453 ?auto_68459 ) ) ( not ( = ?auto_68453 ?auto_68458 ) ) ( not ( = ?auto_68453 ?auto_68457 ) ) ( not ( = ?auto_68459 ?auto_68458 ) ) ( not ( = ?auto_68459 ?auto_68457 ) ) ( not ( = ?auto_68458 ?auto_68457 ) ) ( ON ?auto_68458 ?auto_68459 ) ( CLEAR ?auto_68455 ) ( ON-TABLE ?auto_68456 ) ( ON ?auto_68454 ?auto_68456 ) ( ON ?auto_68455 ?auto_68454 ) ( not ( = ?auto_68456 ?auto_68454 ) ) ( not ( = ?auto_68456 ?auto_68455 ) ) ( not ( = ?auto_68456 ?auto_68457 ) ) ( not ( = ?auto_68454 ?auto_68455 ) ) ( not ( = ?auto_68454 ?auto_68457 ) ) ( not ( = ?auto_68455 ?auto_68457 ) ) ( not ( = ?auto_68453 ?auto_68455 ) ) ( not ( = ?auto_68453 ?auto_68456 ) ) ( not ( = ?auto_68453 ?auto_68454 ) ) ( not ( = ?auto_68459 ?auto_68455 ) ) ( not ( = ?auto_68459 ?auto_68456 ) ) ( not ( = ?auto_68459 ?auto_68454 ) ) ( not ( = ?auto_68458 ?auto_68455 ) ) ( not ( = ?auto_68458 ?auto_68456 ) ) ( not ( = ?auto_68458 ?auto_68454 ) ) ( ON ?auto_68457 ?auto_68458 ) ( CLEAR ?auto_68457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68453 ?auto_68459 ?auto_68458 )
      ( MAKE-1PILE ?auto_68453 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68460 - BLOCK
    )
    :vars
    (
      ?auto_68466 - BLOCK
      ?auto_68464 - BLOCK
      ?auto_68461 - BLOCK
      ?auto_68463 - BLOCK
      ?auto_68465 - BLOCK
      ?auto_68462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68466 ?auto_68460 ) ( ON-TABLE ?auto_68460 ) ( not ( = ?auto_68460 ?auto_68466 ) ) ( not ( = ?auto_68460 ?auto_68464 ) ) ( not ( = ?auto_68460 ?auto_68461 ) ) ( not ( = ?auto_68466 ?auto_68464 ) ) ( not ( = ?auto_68466 ?auto_68461 ) ) ( not ( = ?auto_68464 ?auto_68461 ) ) ( ON ?auto_68464 ?auto_68466 ) ( ON-TABLE ?auto_68463 ) ( ON ?auto_68465 ?auto_68463 ) ( not ( = ?auto_68463 ?auto_68465 ) ) ( not ( = ?auto_68463 ?auto_68462 ) ) ( not ( = ?auto_68463 ?auto_68461 ) ) ( not ( = ?auto_68465 ?auto_68462 ) ) ( not ( = ?auto_68465 ?auto_68461 ) ) ( not ( = ?auto_68462 ?auto_68461 ) ) ( not ( = ?auto_68460 ?auto_68462 ) ) ( not ( = ?auto_68460 ?auto_68463 ) ) ( not ( = ?auto_68460 ?auto_68465 ) ) ( not ( = ?auto_68466 ?auto_68462 ) ) ( not ( = ?auto_68466 ?auto_68463 ) ) ( not ( = ?auto_68466 ?auto_68465 ) ) ( not ( = ?auto_68464 ?auto_68462 ) ) ( not ( = ?auto_68464 ?auto_68463 ) ) ( not ( = ?auto_68464 ?auto_68465 ) ) ( ON ?auto_68461 ?auto_68464 ) ( CLEAR ?auto_68461 ) ( HOLDING ?auto_68462 ) ( CLEAR ?auto_68465 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68463 ?auto_68465 ?auto_68462 )
      ( MAKE-1PILE ?auto_68460 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68467 - BLOCK
    )
    :vars
    (
      ?auto_68471 - BLOCK
      ?auto_68473 - BLOCK
      ?auto_68469 - BLOCK
      ?auto_68472 - BLOCK
      ?auto_68468 - BLOCK
      ?auto_68470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68471 ?auto_68467 ) ( ON-TABLE ?auto_68467 ) ( not ( = ?auto_68467 ?auto_68471 ) ) ( not ( = ?auto_68467 ?auto_68473 ) ) ( not ( = ?auto_68467 ?auto_68469 ) ) ( not ( = ?auto_68471 ?auto_68473 ) ) ( not ( = ?auto_68471 ?auto_68469 ) ) ( not ( = ?auto_68473 ?auto_68469 ) ) ( ON ?auto_68473 ?auto_68471 ) ( ON-TABLE ?auto_68472 ) ( ON ?auto_68468 ?auto_68472 ) ( not ( = ?auto_68472 ?auto_68468 ) ) ( not ( = ?auto_68472 ?auto_68470 ) ) ( not ( = ?auto_68472 ?auto_68469 ) ) ( not ( = ?auto_68468 ?auto_68470 ) ) ( not ( = ?auto_68468 ?auto_68469 ) ) ( not ( = ?auto_68470 ?auto_68469 ) ) ( not ( = ?auto_68467 ?auto_68470 ) ) ( not ( = ?auto_68467 ?auto_68472 ) ) ( not ( = ?auto_68467 ?auto_68468 ) ) ( not ( = ?auto_68471 ?auto_68470 ) ) ( not ( = ?auto_68471 ?auto_68472 ) ) ( not ( = ?auto_68471 ?auto_68468 ) ) ( not ( = ?auto_68473 ?auto_68470 ) ) ( not ( = ?auto_68473 ?auto_68472 ) ) ( not ( = ?auto_68473 ?auto_68468 ) ) ( ON ?auto_68469 ?auto_68473 ) ( CLEAR ?auto_68468 ) ( ON ?auto_68470 ?auto_68469 ) ( CLEAR ?auto_68470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68467 ?auto_68471 ?auto_68473 ?auto_68469 )
      ( MAKE-1PILE ?auto_68467 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68474 - BLOCK
    )
    :vars
    (
      ?auto_68475 - BLOCK
      ?auto_68480 - BLOCK
      ?auto_68479 - BLOCK
      ?auto_68478 - BLOCK
      ?auto_68477 - BLOCK
      ?auto_68476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68475 ?auto_68474 ) ( ON-TABLE ?auto_68474 ) ( not ( = ?auto_68474 ?auto_68475 ) ) ( not ( = ?auto_68474 ?auto_68480 ) ) ( not ( = ?auto_68474 ?auto_68479 ) ) ( not ( = ?auto_68475 ?auto_68480 ) ) ( not ( = ?auto_68475 ?auto_68479 ) ) ( not ( = ?auto_68480 ?auto_68479 ) ) ( ON ?auto_68480 ?auto_68475 ) ( ON-TABLE ?auto_68478 ) ( not ( = ?auto_68478 ?auto_68477 ) ) ( not ( = ?auto_68478 ?auto_68476 ) ) ( not ( = ?auto_68478 ?auto_68479 ) ) ( not ( = ?auto_68477 ?auto_68476 ) ) ( not ( = ?auto_68477 ?auto_68479 ) ) ( not ( = ?auto_68476 ?auto_68479 ) ) ( not ( = ?auto_68474 ?auto_68476 ) ) ( not ( = ?auto_68474 ?auto_68478 ) ) ( not ( = ?auto_68474 ?auto_68477 ) ) ( not ( = ?auto_68475 ?auto_68476 ) ) ( not ( = ?auto_68475 ?auto_68478 ) ) ( not ( = ?auto_68475 ?auto_68477 ) ) ( not ( = ?auto_68480 ?auto_68476 ) ) ( not ( = ?auto_68480 ?auto_68478 ) ) ( not ( = ?auto_68480 ?auto_68477 ) ) ( ON ?auto_68479 ?auto_68480 ) ( ON ?auto_68476 ?auto_68479 ) ( CLEAR ?auto_68476 ) ( HOLDING ?auto_68477 ) ( CLEAR ?auto_68478 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68478 ?auto_68477 )
      ( MAKE-1PILE ?auto_68474 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68481 - BLOCK
    )
    :vars
    (
      ?auto_68485 - BLOCK
      ?auto_68486 - BLOCK
      ?auto_68482 - BLOCK
      ?auto_68484 - BLOCK
      ?auto_68483 - BLOCK
      ?auto_68487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68485 ?auto_68481 ) ( ON-TABLE ?auto_68481 ) ( not ( = ?auto_68481 ?auto_68485 ) ) ( not ( = ?auto_68481 ?auto_68486 ) ) ( not ( = ?auto_68481 ?auto_68482 ) ) ( not ( = ?auto_68485 ?auto_68486 ) ) ( not ( = ?auto_68485 ?auto_68482 ) ) ( not ( = ?auto_68486 ?auto_68482 ) ) ( ON ?auto_68486 ?auto_68485 ) ( ON-TABLE ?auto_68484 ) ( not ( = ?auto_68484 ?auto_68483 ) ) ( not ( = ?auto_68484 ?auto_68487 ) ) ( not ( = ?auto_68484 ?auto_68482 ) ) ( not ( = ?auto_68483 ?auto_68487 ) ) ( not ( = ?auto_68483 ?auto_68482 ) ) ( not ( = ?auto_68487 ?auto_68482 ) ) ( not ( = ?auto_68481 ?auto_68487 ) ) ( not ( = ?auto_68481 ?auto_68484 ) ) ( not ( = ?auto_68481 ?auto_68483 ) ) ( not ( = ?auto_68485 ?auto_68487 ) ) ( not ( = ?auto_68485 ?auto_68484 ) ) ( not ( = ?auto_68485 ?auto_68483 ) ) ( not ( = ?auto_68486 ?auto_68487 ) ) ( not ( = ?auto_68486 ?auto_68484 ) ) ( not ( = ?auto_68486 ?auto_68483 ) ) ( ON ?auto_68482 ?auto_68486 ) ( ON ?auto_68487 ?auto_68482 ) ( CLEAR ?auto_68484 ) ( ON ?auto_68483 ?auto_68487 ) ( CLEAR ?auto_68483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68481 ?auto_68485 ?auto_68486 ?auto_68482 ?auto_68487 )
      ( MAKE-1PILE ?auto_68481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68488 - BLOCK
    )
    :vars
    (
      ?auto_68490 - BLOCK
      ?auto_68492 - BLOCK
      ?auto_68489 - BLOCK
      ?auto_68493 - BLOCK
      ?auto_68494 - BLOCK
      ?auto_68491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68490 ?auto_68488 ) ( ON-TABLE ?auto_68488 ) ( not ( = ?auto_68488 ?auto_68490 ) ) ( not ( = ?auto_68488 ?auto_68492 ) ) ( not ( = ?auto_68488 ?auto_68489 ) ) ( not ( = ?auto_68490 ?auto_68492 ) ) ( not ( = ?auto_68490 ?auto_68489 ) ) ( not ( = ?auto_68492 ?auto_68489 ) ) ( ON ?auto_68492 ?auto_68490 ) ( not ( = ?auto_68493 ?auto_68494 ) ) ( not ( = ?auto_68493 ?auto_68491 ) ) ( not ( = ?auto_68493 ?auto_68489 ) ) ( not ( = ?auto_68494 ?auto_68491 ) ) ( not ( = ?auto_68494 ?auto_68489 ) ) ( not ( = ?auto_68491 ?auto_68489 ) ) ( not ( = ?auto_68488 ?auto_68491 ) ) ( not ( = ?auto_68488 ?auto_68493 ) ) ( not ( = ?auto_68488 ?auto_68494 ) ) ( not ( = ?auto_68490 ?auto_68491 ) ) ( not ( = ?auto_68490 ?auto_68493 ) ) ( not ( = ?auto_68490 ?auto_68494 ) ) ( not ( = ?auto_68492 ?auto_68491 ) ) ( not ( = ?auto_68492 ?auto_68493 ) ) ( not ( = ?auto_68492 ?auto_68494 ) ) ( ON ?auto_68489 ?auto_68492 ) ( ON ?auto_68491 ?auto_68489 ) ( ON ?auto_68494 ?auto_68491 ) ( CLEAR ?auto_68494 ) ( HOLDING ?auto_68493 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68493 )
      ( MAKE-1PILE ?auto_68488 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68503 - BLOCK
    )
    :vars
    (
      ?auto_68507 - BLOCK
      ?auto_68508 - BLOCK
      ?auto_68504 - BLOCK
      ?auto_68506 - BLOCK
      ?auto_68505 - BLOCK
      ?auto_68509 - BLOCK
      ?auto_68510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68507 ?auto_68503 ) ( ON-TABLE ?auto_68503 ) ( not ( = ?auto_68503 ?auto_68507 ) ) ( not ( = ?auto_68503 ?auto_68508 ) ) ( not ( = ?auto_68503 ?auto_68504 ) ) ( not ( = ?auto_68507 ?auto_68508 ) ) ( not ( = ?auto_68507 ?auto_68504 ) ) ( not ( = ?auto_68508 ?auto_68504 ) ) ( ON ?auto_68508 ?auto_68507 ) ( not ( = ?auto_68506 ?auto_68505 ) ) ( not ( = ?auto_68506 ?auto_68509 ) ) ( not ( = ?auto_68506 ?auto_68504 ) ) ( not ( = ?auto_68505 ?auto_68509 ) ) ( not ( = ?auto_68505 ?auto_68504 ) ) ( not ( = ?auto_68509 ?auto_68504 ) ) ( not ( = ?auto_68503 ?auto_68509 ) ) ( not ( = ?auto_68503 ?auto_68506 ) ) ( not ( = ?auto_68503 ?auto_68505 ) ) ( not ( = ?auto_68507 ?auto_68509 ) ) ( not ( = ?auto_68507 ?auto_68506 ) ) ( not ( = ?auto_68507 ?auto_68505 ) ) ( not ( = ?auto_68508 ?auto_68509 ) ) ( not ( = ?auto_68508 ?auto_68506 ) ) ( not ( = ?auto_68508 ?auto_68505 ) ) ( ON ?auto_68504 ?auto_68508 ) ( ON ?auto_68509 ?auto_68504 ) ( ON ?auto_68505 ?auto_68509 ) ( CLEAR ?auto_68505 ) ( ON ?auto_68506 ?auto_68510 ) ( CLEAR ?auto_68506 ) ( HAND-EMPTY ) ( not ( = ?auto_68503 ?auto_68510 ) ) ( not ( = ?auto_68507 ?auto_68510 ) ) ( not ( = ?auto_68508 ?auto_68510 ) ) ( not ( = ?auto_68504 ?auto_68510 ) ) ( not ( = ?auto_68506 ?auto_68510 ) ) ( not ( = ?auto_68505 ?auto_68510 ) ) ( not ( = ?auto_68509 ?auto_68510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68506 ?auto_68510 )
      ( MAKE-1PILE ?auto_68503 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68511 - BLOCK
    )
    :vars
    (
      ?auto_68514 - BLOCK
      ?auto_68518 - BLOCK
      ?auto_68513 - BLOCK
      ?auto_68517 - BLOCK
      ?auto_68512 - BLOCK
      ?auto_68515 - BLOCK
      ?auto_68516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68514 ?auto_68511 ) ( ON-TABLE ?auto_68511 ) ( not ( = ?auto_68511 ?auto_68514 ) ) ( not ( = ?auto_68511 ?auto_68518 ) ) ( not ( = ?auto_68511 ?auto_68513 ) ) ( not ( = ?auto_68514 ?auto_68518 ) ) ( not ( = ?auto_68514 ?auto_68513 ) ) ( not ( = ?auto_68518 ?auto_68513 ) ) ( ON ?auto_68518 ?auto_68514 ) ( not ( = ?auto_68517 ?auto_68512 ) ) ( not ( = ?auto_68517 ?auto_68515 ) ) ( not ( = ?auto_68517 ?auto_68513 ) ) ( not ( = ?auto_68512 ?auto_68515 ) ) ( not ( = ?auto_68512 ?auto_68513 ) ) ( not ( = ?auto_68515 ?auto_68513 ) ) ( not ( = ?auto_68511 ?auto_68515 ) ) ( not ( = ?auto_68511 ?auto_68517 ) ) ( not ( = ?auto_68511 ?auto_68512 ) ) ( not ( = ?auto_68514 ?auto_68515 ) ) ( not ( = ?auto_68514 ?auto_68517 ) ) ( not ( = ?auto_68514 ?auto_68512 ) ) ( not ( = ?auto_68518 ?auto_68515 ) ) ( not ( = ?auto_68518 ?auto_68517 ) ) ( not ( = ?auto_68518 ?auto_68512 ) ) ( ON ?auto_68513 ?auto_68518 ) ( ON ?auto_68515 ?auto_68513 ) ( ON ?auto_68517 ?auto_68516 ) ( CLEAR ?auto_68517 ) ( not ( = ?auto_68511 ?auto_68516 ) ) ( not ( = ?auto_68514 ?auto_68516 ) ) ( not ( = ?auto_68518 ?auto_68516 ) ) ( not ( = ?auto_68513 ?auto_68516 ) ) ( not ( = ?auto_68517 ?auto_68516 ) ) ( not ( = ?auto_68512 ?auto_68516 ) ) ( not ( = ?auto_68515 ?auto_68516 ) ) ( HOLDING ?auto_68512 ) ( CLEAR ?auto_68515 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68511 ?auto_68514 ?auto_68518 ?auto_68513 ?auto_68515 ?auto_68512 )
      ( MAKE-1PILE ?auto_68511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68519 - BLOCK
    )
    :vars
    (
      ?auto_68523 - BLOCK
      ?auto_68526 - BLOCK
      ?auto_68522 - BLOCK
      ?auto_68520 - BLOCK
      ?auto_68521 - BLOCK
      ?auto_68525 - BLOCK
      ?auto_68524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68523 ?auto_68519 ) ( ON-TABLE ?auto_68519 ) ( not ( = ?auto_68519 ?auto_68523 ) ) ( not ( = ?auto_68519 ?auto_68526 ) ) ( not ( = ?auto_68519 ?auto_68522 ) ) ( not ( = ?auto_68523 ?auto_68526 ) ) ( not ( = ?auto_68523 ?auto_68522 ) ) ( not ( = ?auto_68526 ?auto_68522 ) ) ( ON ?auto_68526 ?auto_68523 ) ( not ( = ?auto_68520 ?auto_68521 ) ) ( not ( = ?auto_68520 ?auto_68525 ) ) ( not ( = ?auto_68520 ?auto_68522 ) ) ( not ( = ?auto_68521 ?auto_68525 ) ) ( not ( = ?auto_68521 ?auto_68522 ) ) ( not ( = ?auto_68525 ?auto_68522 ) ) ( not ( = ?auto_68519 ?auto_68525 ) ) ( not ( = ?auto_68519 ?auto_68520 ) ) ( not ( = ?auto_68519 ?auto_68521 ) ) ( not ( = ?auto_68523 ?auto_68525 ) ) ( not ( = ?auto_68523 ?auto_68520 ) ) ( not ( = ?auto_68523 ?auto_68521 ) ) ( not ( = ?auto_68526 ?auto_68525 ) ) ( not ( = ?auto_68526 ?auto_68520 ) ) ( not ( = ?auto_68526 ?auto_68521 ) ) ( ON ?auto_68522 ?auto_68526 ) ( ON ?auto_68525 ?auto_68522 ) ( ON ?auto_68520 ?auto_68524 ) ( not ( = ?auto_68519 ?auto_68524 ) ) ( not ( = ?auto_68523 ?auto_68524 ) ) ( not ( = ?auto_68526 ?auto_68524 ) ) ( not ( = ?auto_68522 ?auto_68524 ) ) ( not ( = ?auto_68520 ?auto_68524 ) ) ( not ( = ?auto_68521 ?auto_68524 ) ) ( not ( = ?auto_68525 ?auto_68524 ) ) ( CLEAR ?auto_68525 ) ( ON ?auto_68521 ?auto_68520 ) ( CLEAR ?auto_68521 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68524 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68524 ?auto_68520 )
      ( MAKE-1PILE ?auto_68519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68527 - BLOCK
    )
    :vars
    (
      ?auto_68532 - BLOCK
      ?auto_68531 - BLOCK
      ?auto_68529 - BLOCK
      ?auto_68528 - BLOCK
      ?auto_68530 - BLOCK
      ?auto_68533 - BLOCK
      ?auto_68534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68532 ?auto_68527 ) ( ON-TABLE ?auto_68527 ) ( not ( = ?auto_68527 ?auto_68532 ) ) ( not ( = ?auto_68527 ?auto_68531 ) ) ( not ( = ?auto_68527 ?auto_68529 ) ) ( not ( = ?auto_68532 ?auto_68531 ) ) ( not ( = ?auto_68532 ?auto_68529 ) ) ( not ( = ?auto_68531 ?auto_68529 ) ) ( ON ?auto_68531 ?auto_68532 ) ( not ( = ?auto_68528 ?auto_68530 ) ) ( not ( = ?auto_68528 ?auto_68533 ) ) ( not ( = ?auto_68528 ?auto_68529 ) ) ( not ( = ?auto_68530 ?auto_68533 ) ) ( not ( = ?auto_68530 ?auto_68529 ) ) ( not ( = ?auto_68533 ?auto_68529 ) ) ( not ( = ?auto_68527 ?auto_68533 ) ) ( not ( = ?auto_68527 ?auto_68528 ) ) ( not ( = ?auto_68527 ?auto_68530 ) ) ( not ( = ?auto_68532 ?auto_68533 ) ) ( not ( = ?auto_68532 ?auto_68528 ) ) ( not ( = ?auto_68532 ?auto_68530 ) ) ( not ( = ?auto_68531 ?auto_68533 ) ) ( not ( = ?auto_68531 ?auto_68528 ) ) ( not ( = ?auto_68531 ?auto_68530 ) ) ( ON ?auto_68529 ?auto_68531 ) ( ON ?auto_68528 ?auto_68534 ) ( not ( = ?auto_68527 ?auto_68534 ) ) ( not ( = ?auto_68532 ?auto_68534 ) ) ( not ( = ?auto_68531 ?auto_68534 ) ) ( not ( = ?auto_68529 ?auto_68534 ) ) ( not ( = ?auto_68528 ?auto_68534 ) ) ( not ( = ?auto_68530 ?auto_68534 ) ) ( not ( = ?auto_68533 ?auto_68534 ) ) ( ON ?auto_68530 ?auto_68528 ) ( CLEAR ?auto_68530 ) ( ON-TABLE ?auto_68534 ) ( HOLDING ?auto_68533 ) ( CLEAR ?auto_68529 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68527 ?auto_68532 ?auto_68531 ?auto_68529 ?auto_68533 )
      ( MAKE-1PILE ?auto_68527 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68573 - BLOCK
      ?auto_68574 - BLOCK
      ?auto_68575 - BLOCK
      ?auto_68576 - BLOCK
      ?auto_68577 - BLOCK
      ?auto_68578 - BLOCK
    )
    :vars
    (
      ?auto_68579 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68573 ) ( ON ?auto_68574 ?auto_68573 ) ( ON ?auto_68575 ?auto_68574 ) ( ON ?auto_68576 ?auto_68575 ) ( not ( = ?auto_68573 ?auto_68574 ) ) ( not ( = ?auto_68573 ?auto_68575 ) ) ( not ( = ?auto_68573 ?auto_68576 ) ) ( not ( = ?auto_68573 ?auto_68577 ) ) ( not ( = ?auto_68573 ?auto_68578 ) ) ( not ( = ?auto_68574 ?auto_68575 ) ) ( not ( = ?auto_68574 ?auto_68576 ) ) ( not ( = ?auto_68574 ?auto_68577 ) ) ( not ( = ?auto_68574 ?auto_68578 ) ) ( not ( = ?auto_68575 ?auto_68576 ) ) ( not ( = ?auto_68575 ?auto_68577 ) ) ( not ( = ?auto_68575 ?auto_68578 ) ) ( not ( = ?auto_68576 ?auto_68577 ) ) ( not ( = ?auto_68576 ?auto_68578 ) ) ( not ( = ?auto_68577 ?auto_68578 ) ) ( ON ?auto_68578 ?auto_68579 ) ( not ( = ?auto_68573 ?auto_68579 ) ) ( not ( = ?auto_68574 ?auto_68579 ) ) ( not ( = ?auto_68575 ?auto_68579 ) ) ( not ( = ?auto_68576 ?auto_68579 ) ) ( not ( = ?auto_68577 ?auto_68579 ) ) ( not ( = ?auto_68578 ?auto_68579 ) ) ( CLEAR ?auto_68576 ) ( ON ?auto_68577 ?auto_68578 ) ( CLEAR ?auto_68577 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68579 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68579 ?auto_68578 )
      ( MAKE-6PILE ?auto_68573 ?auto_68574 ?auto_68575 ?auto_68576 ?auto_68577 ?auto_68578 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68580 - BLOCK
      ?auto_68581 - BLOCK
      ?auto_68582 - BLOCK
      ?auto_68583 - BLOCK
      ?auto_68584 - BLOCK
      ?auto_68585 - BLOCK
    )
    :vars
    (
      ?auto_68586 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68580 ) ( ON ?auto_68581 ?auto_68580 ) ( ON ?auto_68582 ?auto_68581 ) ( not ( = ?auto_68580 ?auto_68581 ) ) ( not ( = ?auto_68580 ?auto_68582 ) ) ( not ( = ?auto_68580 ?auto_68583 ) ) ( not ( = ?auto_68580 ?auto_68584 ) ) ( not ( = ?auto_68580 ?auto_68585 ) ) ( not ( = ?auto_68581 ?auto_68582 ) ) ( not ( = ?auto_68581 ?auto_68583 ) ) ( not ( = ?auto_68581 ?auto_68584 ) ) ( not ( = ?auto_68581 ?auto_68585 ) ) ( not ( = ?auto_68582 ?auto_68583 ) ) ( not ( = ?auto_68582 ?auto_68584 ) ) ( not ( = ?auto_68582 ?auto_68585 ) ) ( not ( = ?auto_68583 ?auto_68584 ) ) ( not ( = ?auto_68583 ?auto_68585 ) ) ( not ( = ?auto_68584 ?auto_68585 ) ) ( ON ?auto_68585 ?auto_68586 ) ( not ( = ?auto_68580 ?auto_68586 ) ) ( not ( = ?auto_68581 ?auto_68586 ) ) ( not ( = ?auto_68582 ?auto_68586 ) ) ( not ( = ?auto_68583 ?auto_68586 ) ) ( not ( = ?auto_68584 ?auto_68586 ) ) ( not ( = ?auto_68585 ?auto_68586 ) ) ( ON ?auto_68584 ?auto_68585 ) ( CLEAR ?auto_68584 ) ( ON-TABLE ?auto_68586 ) ( HOLDING ?auto_68583 ) ( CLEAR ?auto_68582 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68580 ?auto_68581 ?auto_68582 ?auto_68583 )
      ( MAKE-6PILE ?auto_68580 ?auto_68581 ?auto_68582 ?auto_68583 ?auto_68584 ?auto_68585 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68587 - BLOCK
      ?auto_68588 - BLOCK
      ?auto_68589 - BLOCK
      ?auto_68590 - BLOCK
      ?auto_68591 - BLOCK
      ?auto_68592 - BLOCK
    )
    :vars
    (
      ?auto_68593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68587 ) ( ON ?auto_68588 ?auto_68587 ) ( ON ?auto_68589 ?auto_68588 ) ( not ( = ?auto_68587 ?auto_68588 ) ) ( not ( = ?auto_68587 ?auto_68589 ) ) ( not ( = ?auto_68587 ?auto_68590 ) ) ( not ( = ?auto_68587 ?auto_68591 ) ) ( not ( = ?auto_68587 ?auto_68592 ) ) ( not ( = ?auto_68588 ?auto_68589 ) ) ( not ( = ?auto_68588 ?auto_68590 ) ) ( not ( = ?auto_68588 ?auto_68591 ) ) ( not ( = ?auto_68588 ?auto_68592 ) ) ( not ( = ?auto_68589 ?auto_68590 ) ) ( not ( = ?auto_68589 ?auto_68591 ) ) ( not ( = ?auto_68589 ?auto_68592 ) ) ( not ( = ?auto_68590 ?auto_68591 ) ) ( not ( = ?auto_68590 ?auto_68592 ) ) ( not ( = ?auto_68591 ?auto_68592 ) ) ( ON ?auto_68592 ?auto_68593 ) ( not ( = ?auto_68587 ?auto_68593 ) ) ( not ( = ?auto_68588 ?auto_68593 ) ) ( not ( = ?auto_68589 ?auto_68593 ) ) ( not ( = ?auto_68590 ?auto_68593 ) ) ( not ( = ?auto_68591 ?auto_68593 ) ) ( not ( = ?auto_68592 ?auto_68593 ) ) ( ON ?auto_68591 ?auto_68592 ) ( ON-TABLE ?auto_68593 ) ( CLEAR ?auto_68589 ) ( ON ?auto_68590 ?auto_68591 ) ( CLEAR ?auto_68590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68593 ?auto_68592 ?auto_68591 )
      ( MAKE-6PILE ?auto_68587 ?auto_68588 ?auto_68589 ?auto_68590 ?auto_68591 ?auto_68592 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68594 - BLOCK
      ?auto_68595 - BLOCK
      ?auto_68596 - BLOCK
      ?auto_68597 - BLOCK
      ?auto_68598 - BLOCK
      ?auto_68599 - BLOCK
    )
    :vars
    (
      ?auto_68600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68594 ) ( ON ?auto_68595 ?auto_68594 ) ( not ( = ?auto_68594 ?auto_68595 ) ) ( not ( = ?auto_68594 ?auto_68596 ) ) ( not ( = ?auto_68594 ?auto_68597 ) ) ( not ( = ?auto_68594 ?auto_68598 ) ) ( not ( = ?auto_68594 ?auto_68599 ) ) ( not ( = ?auto_68595 ?auto_68596 ) ) ( not ( = ?auto_68595 ?auto_68597 ) ) ( not ( = ?auto_68595 ?auto_68598 ) ) ( not ( = ?auto_68595 ?auto_68599 ) ) ( not ( = ?auto_68596 ?auto_68597 ) ) ( not ( = ?auto_68596 ?auto_68598 ) ) ( not ( = ?auto_68596 ?auto_68599 ) ) ( not ( = ?auto_68597 ?auto_68598 ) ) ( not ( = ?auto_68597 ?auto_68599 ) ) ( not ( = ?auto_68598 ?auto_68599 ) ) ( ON ?auto_68599 ?auto_68600 ) ( not ( = ?auto_68594 ?auto_68600 ) ) ( not ( = ?auto_68595 ?auto_68600 ) ) ( not ( = ?auto_68596 ?auto_68600 ) ) ( not ( = ?auto_68597 ?auto_68600 ) ) ( not ( = ?auto_68598 ?auto_68600 ) ) ( not ( = ?auto_68599 ?auto_68600 ) ) ( ON ?auto_68598 ?auto_68599 ) ( ON-TABLE ?auto_68600 ) ( ON ?auto_68597 ?auto_68598 ) ( CLEAR ?auto_68597 ) ( HOLDING ?auto_68596 ) ( CLEAR ?auto_68595 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68594 ?auto_68595 ?auto_68596 )
      ( MAKE-6PILE ?auto_68594 ?auto_68595 ?auto_68596 ?auto_68597 ?auto_68598 ?auto_68599 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68601 - BLOCK
      ?auto_68602 - BLOCK
      ?auto_68603 - BLOCK
      ?auto_68604 - BLOCK
      ?auto_68605 - BLOCK
      ?auto_68606 - BLOCK
    )
    :vars
    (
      ?auto_68607 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68601 ) ( ON ?auto_68602 ?auto_68601 ) ( not ( = ?auto_68601 ?auto_68602 ) ) ( not ( = ?auto_68601 ?auto_68603 ) ) ( not ( = ?auto_68601 ?auto_68604 ) ) ( not ( = ?auto_68601 ?auto_68605 ) ) ( not ( = ?auto_68601 ?auto_68606 ) ) ( not ( = ?auto_68602 ?auto_68603 ) ) ( not ( = ?auto_68602 ?auto_68604 ) ) ( not ( = ?auto_68602 ?auto_68605 ) ) ( not ( = ?auto_68602 ?auto_68606 ) ) ( not ( = ?auto_68603 ?auto_68604 ) ) ( not ( = ?auto_68603 ?auto_68605 ) ) ( not ( = ?auto_68603 ?auto_68606 ) ) ( not ( = ?auto_68604 ?auto_68605 ) ) ( not ( = ?auto_68604 ?auto_68606 ) ) ( not ( = ?auto_68605 ?auto_68606 ) ) ( ON ?auto_68606 ?auto_68607 ) ( not ( = ?auto_68601 ?auto_68607 ) ) ( not ( = ?auto_68602 ?auto_68607 ) ) ( not ( = ?auto_68603 ?auto_68607 ) ) ( not ( = ?auto_68604 ?auto_68607 ) ) ( not ( = ?auto_68605 ?auto_68607 ) ) ( not ( = ?auto_68606 ?auto_68607 ) ) ( ON ?auto_68605 ?auto_68606 ) ( ON-TABLE ?auto_68607 ) ( ON ?auto_68604 ?auto_68605 ) ( CLEAR ?auto_68602 ) ( ON ?auto_68603 ?auto_68604 ) ( CLEAR ?auto_68603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68607 ?auto_68606 ?auto_68605 ?auto_68604 )
      ( MAKE-6PILE ?auto_68601 ?auto_68602 ?auto_68603 ?auto_68604 ?auto_68605 ?auto_68606 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68608 - BLOCK
      ?auto_68609 - BLOCK
      ?auto_68610 - BLOCK
      ?auto_68611 - BLOCK
      ?auto_68612 - BLOCK
      ?auto_68613 - BLOCK
    )
    :vars
    (
      ?auto_68614 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68608 ) ( not ( = ?auto_68608 ?auto_68609 ) ) ( not ( = ?auto_68608 ?auto_68610 ) ) ( not ( = ?auto_68608 ?auto_68611 ) ) ( not ( = ?auto_68608 ?auto_68612 ) ) ( not ( = ?auto_68608 ?auto_68613 ) ) ( not ( = ?auto_68609 ?auto_68610 ) ) ( not ( = ?auto_68609 ?auto_68611 ) ) ( not ( = ?auto_68609 ?auto_68612 ) ) ( not ( = ?auto_68609 ?auto_68613 ) ) ( not ( = ?auto_68610 ?auto_68611 ) ) ( not ( = ?auto_68610 ?auto_68612 ) ) ( not ( = ?auto_68610 ?auto_68613 ) ) ( not ( = ?auto_68611 ?auto_68612 ) ) ( not ( = ?auto_68611 ?auto_68613 ) ) ( not ( = ?auto_68612 ?auto_68613 ) ) ( ON ?auto_68613 ?auto_68614 ) ( not ( = ?auto_68608 ?auto_68614 ) ) ( not ( = ?auto_68609 ?auto_68614 ) ) ( not ( = ?auto_68610 ?auto_68614 ) ) ( not ( = ?auto_68611 ?auto_68614 ) ) ( not ( = ?auto_68612 ?auto_68614 ) ) ( not ( = ?auto_68613 ?auto_68614 ) ) ( ON ?auto_68612 ?auto_68613 ) ( ON-TABLE ?auto_68614 ) ( ON ?auto_68611 ?auto_68612 ) ( ON ?auto_68610 ?auto_68611 ) ( CLEAR ?auto_68610 ) ( HOLDING ?auto_68609 ) ( CLEAR ?auto_68608 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68608 ?auto_68609 )
      ( MAKE-6PILE ?auto_68608 ?auto_68609 ?auto_68610 ?auto_68611 ?auto_68612 ?auto_68613 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68615 - BLOCK
      ?auto_68616 - BLOCK
      ?auto_68617 - BLOCK
      ?auto_68618 - BLOCK
      ?auto_68619 - BLOCK
      ?auto_68620 - BLOCK
    )
    :vars
    (
      ?auto_68621 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68615 ) ( not ( = ?auto_68615 ?auto_68616 ) ) ( not ( = ?auto_68615 ?auto_68617 ) ) ( not ( = ?auto_68615 ?auto_68618 ) ) ( not ( = ?auto_68615 ?auto_68619 ) ) ( not ( = ?auto_68615 ?auto_68620 ) ) ( not ( = ?auto_68616 ?auto_68617 ) ) ( not ( = ?auto_68616 ?auto_68618 ) ) ( not ( = ?auto_68616 ?auto_68619 ) ) ( not ( = ?auto_68616 ?auto_68620 ) ) ( not ( = ?auto_68617 ?auto_68618 ) ) ( not ( = ?auto_68617 ?auto_68619 ) ) ( not ( = ?auto_68617 ?auto_68620 ) ) ( not ( = ?auto_68618 ?auto_68619 ) ) ( not ( = ?auto_68618 ?auto_68620 ) ) ( not ( = ?auto_68619 ?auto_68620 ) ) ( ON ?auto_68620 ?auto_68621 ) ( not ( = ?auto_68615 ?auto_68621 ) ) ( not ( = ?auto_68616 ?auto_68621 ) ) ( not ( = ?auto_68617 ?auto_68621 ) ) ( not ( = ?auto_68618 ?auto_68621 ) ) ( not ( = ?auto_68619 ?auto_68621 ) ) ( not ( = ?auto_68620 ?auto_68621 ) ) ( ON ?auto_68619 ?auto_68620 ) ( ON-TABLE ?auto_68621 ) ( ON ?auto_68618 ?auto_68619 ) ( ON ?auto_68617 ?auto_68618 ) ( CLEAR ?auto_68615 ) ( ON ?auto_68616 ?auto_68617 ) ( CLEAR ?auto_68616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68621 ?auto_68620 ?auto_68619 ?auto_68618 ?auto_68617 )
      ( MAKE-6PILE ?auto_68615 ?auto_68616 ?auto_68617 ?auto_68618 ?auto_68619 ?auto_68620 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68622 - BLOCK
      ?auto_68623 - BLOCK
      ?auto_68624 - BLOCK
      ?auto_68625 - BLOCK
      ?auto_68626 - BLOCK
      ?auto_68627 - BLOCK
    )
    :vars
    (
      ?auto_68628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68622 ?auto_68623 ) ) ( not ( = ?auto_68622 ?auto_68624 ) ) ( not ( = ?auto_68622 ?auto_68625 ) ) ( not ( = ?auto_68622 ?auto_68626 ) ) ( not ( = ?auto_68622 ?auto_68627 ) ) ( not ( = ?auto_68623 ?auto_68624 ) ) ( not ( = ?auto_68623 ?auto_68625 ) ) ( not ( = ?auto_68623 ?auto_68626 ) ) ( not ( = ?auto_68623 ?auto_68627 ) ) ( not ( = ?auto_68624 ?auto_68625 ) ) ( not ( = ?auto_68624 ?auto_68626 ) ) ( not ( = ?auto_68624 ?auto_68627 ) ) ( not ( = ?auto_68625 ?auto_68626 ) ) ( not ( = ?auto_68625 ?auto_68627 ) ) ( not ( = ?auto_68626 ?auto_68627 ) ) ( ON ?auto_68627 ?auto_68628 ) ( not ( = ?auto_68622 ?auto_68628 ) ) ( not ( = ?auto_68623 ?auto_68628 ) ) ( not ( = ?auto_68624 ?auto_68628 ) ) ( not ( = ?auto_68625 ?auto_68628 ) ) ( not ( = ?auto_68626 ?auto_68628 ) ) ( not ( = ?auto_68627 ?auto_68628 ) ) ( ON ?auto_68626 ?auto_68627 ) ( ON-TABLE ?auto_68628 ) ( ON ?auto_68625 ?auto_68626 ) ( ON ?auto_68624 ?auto_68625 ) ( ON ?auto_68623 ?auto_68624 ) ( CLEAR ?auto_68623 ) ( HOLDING ?auto_68622 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68622 )
      ( MAKE-6PILE ?auto_68622 ?auto_68623 ?auto_68624 ?auto_68625 ?auto_68626 ?auto_68627 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68629 - BLOCK
      ?auto_68630 - BLOCK
      ?auto_68631 - BLOCK
      ?auto_68632 - BLOCK
      ?auto_68633 - BLOCK
      ?auto_68634 - BLOCK
    )
    :vars
    (
      ?auto_68635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68629 ?auto_68630 ) ) ( not ( = ?auto_68629 ?auto_68631 ) ) ( not ( = ?auto_68629 ?auto_68632 ) ) ( not ( = ?auto_68629 ?auto_68633 ) ) ( not ( = ?auto_68629 ?auto_68634 ) ) ( not ( = ?auto_68630 ?auto_68631 ) ) ( not ( = ?auto_68630 ?auto_68632 ) ) ( not ( = ?auto_68630 ?auto_68633 ) ) ( not ( = ?auto_68630 ?auto_68634 ) ) ( not ( = ?auto_68631 ?auto_68632 ) ) ( not ( = ?auto_68631 ?auto_68633 ) ) ( not ( = ?auto_68631 ?auto_68634 ) ) ( not ( = ?auto_68632 ?auto_68633 ) ) ( not ( = ?auto_68632 ?auto_68634 ) ) ( not ( = ?auto_68633 ?auto_68634 ) ) ( ON ?auto_68634 ?auto_68635 ) ( not ( = ?auto_68629 ?auto_68635 ) ) ( not ( = ?auto_68630 ?auto_68635 ) ) ( not ( = ?auto_68631 ?auto_68635 ) ) ( not ( = ?auto_68632 ?auto_68635 ) ) ( not ( = ?auto_68633 ?auto_68635 ) ) ( not ( = ?auto_68634 ?auto_68635 ) ) ( ON ?auto_68633 ?auto_68634 ) ( ON-TABLE ?auto_68635 ) ( ON ?auto_68632 ?auto_68633 ) ( ON ?auto_68631 ?auto_68632 ) ( ON ?auto_68630 ?auto_68631 ) ( ON ?auto_68629 ?auto_68630 ) ( CLEAR ?auto_68629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68635 ?auto_68634 ?auto_68633 ?auto_68632 ?auto_68631 ?auto_68630 )
      ( MAKE-6PILE ?auto_68629 ?auto_68630 ?auto_68631 ?auto_68632 ?auto_68633 ?auto_68634 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68642 - BLOCK
      ?auto_68643 - BLOCK
      ?auto_68644 - BLOCK
      ?auto_68645 - BLOCK
      ?auto_68646 - BLOCK
      ?auto_68647 - BLOCK
    )
    :vars
    (
      ?auto_68648 - BLOCK
      ?auto_68649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68642 ?auto_68643 ) ) ( not ( = ?auto_68642 ?auto_68644 ) ) ( not ( = ?auto_68642 ?auto_68645 ) ) ( not ( = ?auto_68642 ?auto_68646 ) ) ( not ( = ?auto_68642 ?auto_68647 ) ) ( not ( = ?auto_68643 ?auto_68644 ) ) ( not ( = ?auto_68643 ?auto_68645 ) ) ( not ( = ?auto_68643 ?auto_68646 ) ) ( not ( = ?auto_68643 ?auto_68647 ) ) ( not ( = ?auto_68644 ?auto_68645 ) ) ( not ( = ?auto_68644 ?auto_68646 ) ) ( not ( = ?auto_68644 ?auto_68647 ) ) ( not ( = ?auto_68645 ?auto_68646 ) ) ( not ( = ?auto_68645 ?auto_68647 ) ) ( not ( = ?auto_68646 ?auto_68647 ) ) ( ON ?auto_68647 ?auto_68648 ) ( not ( = ?auto_68642 ?auto_68648 ) ) ( not ( = ?auto_68643 ?auto_68648 ) ) ( not ( = ?auto_68644 ?auto_68648 ) ) ( not ( = ?auto_68645 ?auto_68648 ) ) ( not ( = ?auto_68646 ?auto_68648 ) ) ( not ( = ?auto_68647 ?auto_68648 ) ) ( ON ?auto_68646 ?auto_68647 ) ( ON-TABLE ?auto_68648 ) ( ON ?auto_68645 ?auto_68646 ) ( ON ?auto_68644 ?auto_68645 ) ( ON ?auto_68643 ?auto_68644 ) ( CLEAR ?auto_68643 ) ( ON ?auto_68642 ?auto_68649 ) ( CLEAR ?auto_68642 ) ( HAND-EMPTY ) ( not ( = ?auto_68642 ?auto_68649 ) ) ( not ( = ?auto_68643 ?auto_68649 ) ) ( not ( = ?auto_68644 ?auto_68649 ) ) ( not ( = ?auto_68645 ?auto_68649 ) ) ( not ( = ?auto_68646 ?auto_68649 ) ) ( not ( = ?auto_68647 ?auto_68649 ) ) ( not ( = ?auto_68648 ?auto_68649 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68642 ?auto_68649 )
      ( MAKE-6PILE ?auto_68642 ?auto_68643 ?auto_68644 ?auto_68645 ?auto_68646 ?auto_68647 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68650 - BLOCK
      ?auto_68651 - BLOCK
      ?auto_68652 - BLOCK
      ?auto_68653 - BLOCK
      ?auto_68654 - BLOCK
      ?auto_68655 - BLOCK
    )
    :vars
    (
      ?auto_68657 - BLOCK
      ?auto_68656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68650 ?auto_68651 ) ) ( not ( = ?auto_68650 ?auto_68652 ) ) ( not ( = ?auto_68650 ?auto_68653 ) ) ( not ( = ?auto_68650 ?auto_68654 ) ) ( not ( = ?auto_68650 ?auto_68655 ) ) ( not ( = ?auto_68651 ?auto_68652 ) ) ( not ( = ?auto_68651 ?auto_68653 ) ) ( not ( = ?auto_68651 ?auto_68654 ) ) ( not ( = ?auto_68651 ?auto_68655 ) ) ( not ( = ?auto_68652 ?auto_68653 ) ) ( not ( = ?auto_68652 ?auto_68654 ) ) ( not ( = ?auto_68652 ?auto_68655 ) ) ( not ( = ?auto_68653 ?auto_68654 ) ) ( not ( = ?auto_68653 ?auto_68655 ) ) ( not ( = ?auto_68654 ?auto_68655 ) ) ( ON ?auto_68655 ?auto_68657 ) ( not ( = ?auto_68650 ?auto_68657 ) ) ( not ( = ?auto_68651 ?auto_68657 ) ) ( not ( = ?auto_68652 ?auto_68657 ) ) ( not ( = ?auto_68653 ?auto_68657 ) ) ( not ( = ?auto_68654 ?auto_68657 ) ) ( not ( = ?auto_68655 ?auto_68657 ) ) ( ON ?auto_68654 ?auto_68655 ) ( ON-TABLE ?auto_68657 ) ( ON ?auto_68653 ?auto_68654 ) ( ON ?auto_68652 ?auto_68653 ) ( ON ?auto_68650 ?auto_68656 ) ( CLEAR ?auto_68650 ) ( not ( = ?auto_68650 ?auto_68656 ) ) ( not ( = ?auto_68651 ?auto_68656 ) ) ( not ( = ?auto_68652 ?auto_68656 ) ) ( not ( = ?auto_68653 ?auto_68656 ) ) ( not ( = ?auto_68654 ?auto_68656 ) ) ( not ( = ?auto_68655 ?auto_68656 ) ) ( not ( = ?auto_68657 ?auto_68656 ) ) ( HOLDING ?auto_68651 ) ( CLEAR ?auto_68652 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68657 ?auto_68655 ?auto_68654 ?auto_68653 ?auto_68652 ?auto_68651 )
      ( MAKE-6PILE ?auto_68650 ?auto_68651 ?auto_68652 ?auto_68653 ?auto_68654 ?auto_68655 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68658 - BLOCK
      ?auto_68659 - BLOCK
      ?auto_68660 - BLOCK
      ?auto_68661 - BLOCK
      ?auto_68662 - BLOCK
      ?auto_68663 - BLOCK
    )
    :vars
    (
      ?auto_68665 - BLOCK
      ?auto_68664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68658 ?auto_68659 ) ) ( not ( = ?auto_68658 ?auto_68660 ) ) ( not ( = ?auto_68658 ?auto_68661 ) ) ( not ( = ?auto_68658 ?auto_68662 ) ) ( not ( = ?auto_68658 ?auto_68663 ) ) ( not ( = ?auto_68659 ?auto_68660 ) ) ( not ( = ?auto_68659 ?auto_68661 ) ) ( not ( = ?auto_68659 ?auto_68662 ) ) ( not ( = ?auto_68659 ?auto_68663 ) ) ( not ( = ?auto_68660 ?auto_68661 ) ) ( not ( = ?auto_68660 ?auto_68662 ) ) ( not ( = ?auto_68660 ?auto_68663 ) ) ( not ( = ?auto_68661 ?auto_68662 ) ) ( not ( = ?auto_68661 ?auto_68663 ) ) ( not ( = ?auto_68662 ?auto_68663 ) ) ( ON ?auto_68663 ?auto_68665 ) ( not ( = ?auto_68658 ?auto_68665 ) ) ( not ( = ?auto_68659 ?auto_68665 ) ) ( not ( = ?auto_68660 ?auto_68665 ) ) ( not ( = ?auto_68661 ?auto_68665 ) ) ( not ( = ?auto_68662 ?auto_68665 ) ) ( not ( = ?auto_68663 ?auto_68665 ) ) ( ON ?auto_68662 ?auto_68663 ) ( ON-TABLE ?auto_68665 ) ( ON ?auto_68661 ?auto_68662 ) ( ON ?auto_68660 ?auto_68661 ) ( ON ?auto_68658 ?auto_68664 ) ( not ( = ?auto_68658 ?auto_68664 ) ) ( not ( = ?auto_68659 ?auto_68664 ) ) ( not ( = ?auto_68660 ?auto_68664 ) ) ( not ( = ?auto_68661 ?auto_68664 ) ) ( not ( = ?auto_68662 ?auto_68664 ) ) ( not ( = ?auto_68663 ?auto_68664 ) ) ( not ( = ?auto_68665 ?auto_68664 ) ) ( CLEAR ?auto_68660 ) ( ON ?auto_68659 ?auto_68658 ) ( CLEAR ?auto_68659 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68664 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68664 ?auto_68658 )
      ( MAKE-6PILE ?auto_68658 ?auto_68659 ?auto_68660 ?auto_68661 ?auto_68662 ?auto_68663 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68666 - BLOCK
      ?auto_68667 - BLOCK
      ?auto_68668 - BLOCK
      ?auto_68669 - BLOCK
      ?auto_68670 - BLOCK
      ?auto_68671 - BLOCK
    )
    :vars
    (
      ?auto_68672 - BLOCK
      ?auto_68673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68666 ?auto_68667 ) ) ( not ( = ?auto_68666 ?auto_68668 ) ) ( not ( = ?auto_68666 ?auto_68669 ) ) ( not ( = ?auto_68666 ?auto_68670 ) ) ( not ( = ?auto_68666 ?auto_68671 ) ) ( not ( = ?auto_68667 ?auto_68668 ) ) ( not ( = ?auto_68667 ?auto_68669 ) ) ( not ( = ?auto_68667 ?auto_68670 ) ) ( not ( = ?auto_68667 ?auto_68671 ) ) ( not ( = ?auto_68668 ?auto_68669 ) ) ( not ( = ?auto_68668 ?auto_68670 ) ) ( not ( = ?auto_68668 ?auto_68671 ) ) ( not ( = ?auto_68669 ?auto_68670 ) ) ( not ( = ?auto_68669 ?auto_68671 ) ) ( not ( = ?auto_68670 ?auto_68671 ) ) ( ON ?auto_68671 ?auto_68672 ) ( not ( = ?auto_68666 ?auto_68672 ) ) ( not ( = ?auto_68667 ?auto_68672 ) ) ( not ( = ?auto_68668 ?auto_68672 ) ) ( not ( = ?auto_68669 ?auto_68672 ) ) ( not ( = ?auto_68670 ?auto_68672 ) ) ( not ( = ?auto_68671 ?auto_68672 ) ) ( ON ?auto_68670 ?auto_68671 ) ( ON-TABLE ?auto_68672 ) ( ON ?auto_68669 ?auto_68670 ) ( ON ?auto_68666 ?auto_68673 ) ( not ( = ?auto_68666 ?auto_68673 ) ) ( not ( = ?auto_68667 ?auto_68673 ) ) ( not ( = ?auto_68668 ?auto_68673 ) ) ( not ( = ?auto_68669 ?auto_68673 ) ) ( not ( = ?auto_68670 ?auto_68673 ) ) ( not ( = ?auto_68671 ?auto_68673 ) ) ( not ( = ?auto_68672 ?auto_68673 ) ) ( ON ?auto_68667 ?auto_68666 ) ( CLEAR ?auto_68667 ) ( ON-TABLE ?auto_68673 ) ( HOLDING ?auto_68668 ) ( CLEAR ?auto_68669 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68672 ?auto_68671 ?auto_68670 ?auto_68669 ?auto_68668 )
      ( MAKE-6PILE ?auto_68666 ?auto_68667 ?auto_68668 ?auto_68669 ?auto_68670 ?auto_68671 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68674 - BLOCK
      ?auto_68675 - BLOCK
      ?auto_68676 - BLOCK
      ?auto_68677 - BLOCK
      ?auto_68678 - BLOCK
      ?auto_68679 - BLOCK
    )
    :vars
    (
      ?auto_68681 - BLOCK
      ?auto_68680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68674 ?auto_68675 ) ) ( not ( = ?auto_68674 ?auto_68676 ) ) ( not ( = ?auto_68674 ?auto_68677 ) ) ( not ( = ?auto_68674 ?auto_68678 ) ) ( not ( = ?auto_68674 ?auto_68679 ) ) ( not ( = ?auto_68675 ?auto_68676 ) ) ( not ( = ?auto_68675 ?auto_68677 ) ) ( not ( = ?auto_68675 ?auto_68678 ) ) ( not ( = ?auto_68675 ?auto_68679 ) ) ( not ( = ?auto_68676 ?auto_68677 ) ) ( not ( = ?auto_68676 ?auto_68678 ) ) ( not ( = ?auto_68676 ?auto_68679 ) ) ( not ( = ?auto_68677 ?auto_68678 ) ) ( not ( = ?auto_68677 ?auto_68679 ) ) ( not ( = ?auto_68678 ?auto_68679 ) ) ( ON ?auto_68679 ?auto_68681 ) ( not ( = ?auto_68674 ?auto_68681 ) ) ( not ( = ?auto_68675 ?auto_68681 ) ) ( not ( = ?auto_68676 ?auto_68681 ) ) ( not ( = ?auto_68677 ?auto_68681 ) ) ( not ( = ?auto_68678 ?auto_68681 ) ) ( not ( = ?auto_68679 ?auto_68681 ) ) ( ON ?auto_68678 ?auto_68679 ) ( ON-TABLE ?auto_68681 ) ( ON ?auto_68677 ?auto_68678 ) ( ON ?auto_68674 ?auto_68680 ) ( not ( = ?auto_68674 ?auto_68680 ) ) ( not ( = ?auto_68675 ?auto_68680 ) ) ( not ( = ?auto_68676 ?auto_68680 ) ) ( not ( = ?auto_68677 ?auto_68680 ) ) ( not ( = ?auto_68678 ?auto_68680 ) ) ( not ( = ?auto_68679 ?auto_68680 ) ) ( not ( = ?auto_68681 ?auto_68680 ) ) ( ON ?auto_68675 ?auto_68674 ) ( ON-TABLE ?auto_68680 ) ( CLEAR ?auto_68677 ) ( ON ?auto_68676 ?auto_68675 ) ( CLEAR ?auto_68676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68680 ?auto_68674 ?auto_68675 )
      ( MAKE-6PILE ?auto_68674 ?auto_68675 ?auto_68676 ?auto_68677 ?auto_68678 ?auto_68679 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68682 - BLOCK
      ?auto_68683 - BLOCK
      ?auto_68684 - BLOCK
      ?auto_68685 - BLOCK
      ?auto_68686 - BLOCK
      ?auto_68687 - BLOCK
    )
    :vars
    (
      ?auto_68689 - BLOCK
      ?auto_68688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68682 ?auto_68683 ) ) ( not ( = ?auto_68682 ?auto_68684 ) ) ( not ( = ?auto_68682 ?auto_68685 ) ) ( not ( = ?auto_68682 ?auto_68686 ) ) ( not ( = ?auto_68682 ?auto_68687 ) ) ( not ( = ?auto_68683 ?auto_68684 ) ) ( not ( = ?auto_68683 ?auto_68685 ) ) ( not ( = ?auto_68683 ?auto_68686 ) ) ( not ( = ?auto_68683 ?auto_68687 ) ) ( not ( = ?auto_68684 ?auto_68685 ) ) ( not ( = ?auto_68684 ?auto_68686 ) ) ( not ( = ?auto_68684 ?auto_68687 ) ) ( not ( = ?auto_68685 ?auto_68686 ) ) ( not ( = ?auto_68685 ?auto_68687 ) ) ( not ( = ?auto_68686 ?auto_68687 ) ) ( ON ?auto_68687 ?auto_68689 ) ( not ( = ?auto_68682 ?auto_68689 ) ) ( not ( = ?auto_68683 ?auto_68689 ) ) ( not ( = ?auto_68684 ?auto_68689 ) ) ( not ( = ?auto_68685 ?auto_68689 ) ) ( not ( = ?auto_68686 ?auto_68689 ) ) ( not ( = ?auto_68687 ?auto_68689 ) ) ( ON ?auto_68686 ?auto_68687 ) ( ON-TABLE ?auto_68689 ) ( ON ?auto_68682 ?auto_68688 ) ( not ( = ?auto_68682 ?auto_68688 ) ) ( not ( = ?auto_68683 ?auto_68688 ) ) ( not ( = ?auto_68684 ?auto_68688 ) ) ( not ( = ?auto_68685 ?auto_68688 ) ) ( not ( = ?auto_68686 ?auto_68688 ) ) ( not ( = ?auto_68687 ?auto_68688 ) ) ( not ( = ?auto_68689 ?auto_68688 ) ) ( ON ?auto_68683 ?auto_68682 ) ( ON-TABLE ?auto_68688 ) ( ON ?auto_68684 ?auto_68683 ) ( CLEAR ?auto_68684 ) ( HOLDING ?auto_68685 ) ( CLEAR ?auto_68686 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68689 ?auto_68687 ?auto_68686 ?auto_68685 )
      ( MAKE-6PILE ?auto_68682 ?auto_68683 ?auto_68684 ?auto_68685 ?auto_68686 ?auto_68687 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68690 - BLOCK
      ?auto_68691 - BLOCK
      ?auto_68692 - BLOCK
      ?auto_68693 - BLOCK
      ?auto_68694 - BLOCK
      ?auto_68695 - BLOCK
    )
    :vars
    (
      ?auto_68697 - BLOCK
      ?auto_68696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68690 ?auto_68691 ) ) ( not ( = ?auto_68690 ?auto_68692 ) ) ( not ( = ?auto_68690 ?auto_68693 ) ) ( not ( = ?auto_68690 ?auto_68694 ) ) ( not ( = ?auto_68690 ?auto_68695 ) ) ( not ( = ?auto_68691 ?auto_68692 ) ) ( not ( = ?auto_68691 ?auto_68693 ) ) ( not ( = ?auto_68691 ?auto_68694 ) ) ( not ( = ?auto_68691 ?auto_68695 ) ) ( not ( = ?auto_68692 ?auto_68693 ) ) ( not ( = ?auto_68692 ?auto_68694 ) ) ( not ( = ?auto_68692 ?auto_68695 ) ) ( not ( = ?auto_68693 ?auto_68694 ) ) ( not ( = ?auto_68693 ?auto_68695 ) ) ( not ( = ?auto_68694 ?auto_68695 ) ) ( ON ?auto_68695 ?auto_68697 ) ( not ( = ?auto_68690 ?auto_68697 ) ) ( not ( = ?auto_68691 ?auto_68697 ) ) ( not ( = ?auto_68692 ?auto_68697 ) ) ( not ( = ?auto_68693 ?auto_68697 ) ) ( not ( = ?auto_68694 ?auto_68697 ) ) ( not ( = ?auto_68695 ?auto_68697 ) ) ( ON ?auto_68694 ?auto_68695 ) ( ON-TABLE ?auto_68697 ) ( ON ?auto_68690 ?auto_68696 ) ( not ( = ?auto_68690 ?auto_68696 ) ) ( not ( = ?auto_68691 ?auto_68696 ) ) ( not ( = ?auto_68692 ?auto_68696 ) ) ( not ( = ?auto_68693 ?auto_68696 ) ) ( not ( = ?auto_68694 ?auto_68696 ) ) ( not ( = ?auto_68695 ?auto_68696 ) ) ( not ( = ?auto_68697 ?auto_68696 ) ) ( ON ?auto_68691 ?auto_68690 ) ( ON-TABLE ?auto_68696 ) ( ON ?auto_68692 ?auto_68691 ) ( CLEAR ?auto_68694 ) ( ON ?auto_68693 ?auto_68692 ) ( CLEAR ?auto_68693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68696 ?auto_68690 ?auto_68691 ?auto_68692 )
      ( MAKE-6PILE ?auto_68690 ?auto_68691 ?auto_68692 ?auto_68693 ?auto_68694 ?auto_68695 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68698 - BLOCK
      ?auto_68699 - BLOCK
      ?auto_68700 - BLOCK
      ?auto_68701 - BLOCK
      ?auto_68702 - BLOCK
      ?auto_68703 - BLOCK
    )
    :vars
    (
      ?auto_68705 - BLOCK
      ?auto_68704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68698 ?auto_68699 ) ) ( not ( = ?auto_68698 ?auto_68700 ) ) ( not ( = ?auto_68698 ?auto_68701 ) ) ( not ( = ?auto_68698 ?auto_68702 ) ) ( not ( = ?auto_68698 ?auto_68703 ) ) ( not ( = ?auto_68699 ?auto_68700 ) ) ( not ( = ?auto_68699 ?auto_68701 ) ) ( not ( = ?auto_68699 ?auto_68702 ) ) ( not ( = ?auto_68699 ?auto_68703 ) ) ( not ( = ?auto_68700 ?auto_68701 ) ) ( not ( = ?auto_68700 ?auto_68702 ) ) ( not ( = ?auto_68700 ?auto_68703 ) ) ( not ( = ?auto_68701 ?auto_68702 ) ) ( not ( = ?auto_68701 ?auto_68703 ) ) ( not ( = ?auto_68702 ?auto_68703 ) ) ( ON ?auto_68703 ?auto_68705 ) ( not ( = ?auto_68698 ?auto_68705 ) ) ( not ( = ?auto_68699 ?auto_68705 ) ) ( not ( = ?auto_68700 ?auto_68705 ) ) ( not ( = ?auto_68701 ?auto_68705 ) ) ( not ( = ?auto_68702 ?auto_68705 ) ) ( not ( = ?auto_68703 ?auto_68705 ) ) ( ON-TABLE ?auto_68705 ) ( ON ?auto_68698 ?auto_68704 ) ( not ( = ?auto_68698 ?auto_68704 ) ) ( not ( = ?auto_68699 ?auto_68704 ) ) ( not ( = ?auto_68700 ?auto_68704 ) ) ( not ( = ?auto_68701 ?auto_68704 ) ) ( not ( = ?auto_68702 ?auto_68704 ) ) ( not ( = ?auto_68703 ?auto_68704 ) ) ( not ( = ?auto_68705 ?auto_68704 ) ) ( ON ?auto_68699 ?auto_68698 ) ( ON-TABLE ?auto_68704 ) ( ON ?auto_68700 ?auto_68699 ) ( ON ?auto_68701 ?auto_68700 ) ( CLEAR ?auto_68701 ) ( HOLDING ?auto_68702 ) ( CLEAR ?auto_68703 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68705 ?auto_68703 ?auto_68702 )
      ( MAKE-6PILE ?auto_68698 ?auto_68699 ?auto_68700 ?auto_68701 ?auto_68702 ?auto_68703 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68706 - BLOCK
      ?auto_68707 - BLOCK
      ?auto_68708 - BLOCK
      ?auto_68709 - BLOCK
      ?auto_68710 - BLOCK
      ?auto_68711 - BLOCK
    )
    :vars
    (
      ?auto_68712 - BLOCK
      ?auto_68713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68706 ?auto_68707 ) ) ( not ( = ?auto_68706 ?auto_68708 ) ) ( not ( = ?auto_68706 ?auto_68709 ) ) ( not ( = ?auto_68706 ?auto_68710 ) ) ( not ( = ?auto_68706 ?auto_68711 ) ) ( not ( = ?auto_68707 ?auto_68708 ) ) ( not ( = ?auto_68707 ?auto_68709 ) ) ( not ( = ?auto_68707 ?auto_68710 ) ) ( not ( = ?auto_68707 ?auto_68711 ) ) ( not ( = ?auto_68708 ?auto_68709 ) ) ( not ( = ?auto_68708 ?auto_68710 ) ) ( not ( = ?auto_68708 ?auto_68711 ) ) ( not ( = ?auto_68709 ?auto_68710 ) ) ( not ( = ?auto_68709 ?auto_68711 ) ) ( not ( = ?auto_68710 ?auto_68711 ) ) ( ON ?auto_68711 ?auto_68712 ) ( not ( = ?auto_68706 ?auto_68712 ) ) ( not ( = ?auto_68707 ?auto_68712 ) ) ( not ( = ?auto_68708 ?auto_68712 ) ) ( not ( = ?auto_68709 ?auto_68712 ) ) ( not ( = ?auto_68710 ?auto_68712 ) ) ( not ( = ?auto_68711 ?auto_68712 ) ) ( ON-TABLE ?auto_68712 ) ( ON ?auto_68706 ?auto_68713 ) ( not ( = ?auto_68706 ?auto_68713 ) ) ( not ( = ?auto_68707 ?auto_68713 ) ) ( not ( = ?auto_68708 ?auto_68713 ) ) ( not ( = ?auto_68709 ?auto_68713 ) ) ( not ( = ?auto_68710 ?auto_68713 ) ) ( not ( = ?auto_68711 ?auto_68713 ) ) ( not ( = ?auto_68712 ?auto_68713 ) ) ( ON ?auto_68707 ?auto_68706 ) ( ON-TABLE ?auto_68713 ) ( ON ?auto_68708 ?auto_68707 ) ( ON ?auto_68709 ?auto_68708 ) ( CLEAR ?auto_68711 ) ( ON ?auto_68710 ?auto_68709 ) ( CLEAR ?auto_68710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68713 ?auto_68706 ?auto_68707 ?auto_68708 ?auto_68709 )
      ( MAKE-6PILE ?auto_68706 ?auto_68707 ?auto_68708 ?auto_68709 ?auto_68710 ?auto_68711 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68714 - BLOCK
      ?auto_68715 - BLOCK
      ?auto_68716 - BLOCK
      ?auto_68717 - BLOCK
      ?auto_68718 - BLOCK
      ?auto_68719 - BLOCK
    )
    :vars
    (
      ?auto_68720 - BLOCK
      ?auto_68721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68714 ?auto_68715 ) ) ( not ( = ?auto_68714 ?auto_68716 ) ) ( not ( = ?auto_68714 ?auto_68717 ) ) ( not ( = ?auto_68714 ?auto_68718 ) ) ( not ( = ?auto_68714 ?auto_68719 ) ) ( not ( = ?auto_68715 ?auto_68716 ) ) ( not ( = ?auto_68715 ?auto_68717 ) ) ( not ( = ?auto_68715 ?auto_68718 ) ) ( not ( = ?auto_68715 ?auto_68719 ) ) ( not ( = ?auto_68716 ?auto_68717 ) ) ( not ( = ?auto_68716 ?auto_68718 ) ) ( not ( = ?auto_68716 ?auto_68719 ) ) ( not ( = ?auto_68717 ?auto_68718 ) ) ( not ( = ?auto_68717 ?auto_68719 ) ) ( not ( = ?auto_68718 ?auto_68719 ) ) ( not ( = ?auto_68714 ?auto_68720 ) ) ( not ( = ?auto_68715 ?auto_68720 ) ) ( not ( = ?auto_68716 ?auto_68720 ) ) ( not ( = ?auto_68717 ?auto_68720 ) ) ( not ( = ?auto_68718 ?auto_68720 ) ) ( not ( = ?auto_68719 ?auto_68720 ) ) ( ON-TABLE ?auto_68720 ) ( ON ?auto_68714 ?auto_68721 ) ( not ( = ?auto_68714 ?auto_68721 ) ) ( not ( = ?auto_68715 ?auto_68721 ) ) ( not ( = ?auto_68716 ?auto_68721 ) ) ( not ( = ?auto_68717 ?auto_68721 ) ) ( not ( = ?auto_68718 ?auto_68721 ) ) ( not ( = ?auto_68719 ?auto_68721 ) ) ( not ( = ?auto_68720 ?auto_68721 ) ) ( ON ?auto_68715 ?auto_68714 ) ( ON-TABLE ?auto_68721 ) ( ON ?auto_68716 ?auto_68715 ) ( ON ?auto_68717 ?auto_68716 ) ( ON ?auto_68718 ?auto_68717 ) ( CLEAR ?auto_68718 ) ( HOLDING ?auto_68719 ) ( CLEAR ?auto_68720 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68720 ?auto_68719 )
      ( MAKE-6PILE ?auto_68714 ?auto_68715 ?auto_68716 ?auto_68717 ?auto_68718 ?auto_68719 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68722 - BLOCK
      ?auto_68723 - BLOCK
      ?auto_68724 - BLOCK
      ?auto_68725 - BLOCK
      ?auto_68726 - BLOCK
      ?auto_68727 - BLOCK
    )
    :vars
    (
      ?auto_68729 - BLOCK
      ?auto_68728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68722 ?auto_68723 ) ) ( not ( = ?auto_68722 ?auto_68724 ) ) ( not ( = ?auto_68722 ?auto_68725 ) ) ( not ( = ?auto_68722 ?auto_68726 ) ) ( not ( = ?auto_68722 ?auto_68727 ) ) ( not ( = ?auto_68723 ?auto_68724 ) ) ( not ( = ?auto_68723 ?auto_68725 ) ) ( not ( = ?auto_68723 ?auto_68726 ) ) ( not ( = ?auto_68723 ?auto_68727 ) ) ( not ( = ?auto_68724 ?auto_68725 ) ) ( not ( = ?auto_68724 ?auto_68726 ) ) ( not ( = ?auto_68724 ?auto_68727 ) ) ( not ( = ?auto_68725 ?auto_68726 ) ) ( not ( = ?auto_68725 ?auto_68727 ) ) ( not ( = ?auto_68726 ?auto_68727 ) ) ( not ( = ?auto_68722 ?auto_68729 ) ) ( not ( = ?auto_68723 ?auto_68729 ) ) ( not ( = ?auto_68724 ?auto_68729 ) ) ( not ( = ?auto_68725 ?auto_68729 ) ) ( not ( = ?auto_68726 ?auto_68729 ) ) ( not ( = ?auto_68727 ?auto_68729 ) ) ( ON-TABLE ?auto_68729 ) ( ON ?auto_68722 ?auto_68728 ) ( not ( = ?auto_68722 ?auto_68728 ) ) ( not ( = ?auto_68723 ?auto_68728 ) ) ( not ( = ?auto_68724 ?auto_68728 ) ) ( not ( = ?auto_68725 ?auto_68728 ) ) ( not ( = ?auto_68726 ?auto_68728 ) ) ( not ( = ?auto_68727 ?auto_68728 ) ) ( not ( = ?auto_68729 ?auto_68728 ) ) ( ON ?auto_68723 ?auto_68722 ) ( ON-TABLE ?auto_68728 ) ( ON ?auto_68724 ?auto_68723 ) ( ON ?auto_68725 ?auto_68724 ) ( ON ?auto_68726 ?auto_68725 ) ( CLEAR ?auto_68729 ) ( ON ?auto_68727 ?auto_68726 ) ( CLEAR ?auto_68727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68728 ?auto_68722 ?auto_68723 ?auto_68724 ?auto_68725 ?auto_68726 )
      ( MAKE-6PILE ?auto_68722 ?auto_68723 ?auto_68724 ?auto_68725 ?auto_68726 ?auto_68727 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68730 - BLOCK
      ?auto_68731 - BLOCK
      ?auto_68732 - BLOCK
      ?auto_68733 - BLOCK
      ?auto_68734 - BLOCK
      ?auto_68735 - BLOCK
    )
    :vars
    (
      ?auto_68736 - BLOCK
      ?auto_68737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68730 ?auto_68731 ) ) ( not ( = ?auto_68730 ?auto_68732 ) ) ( not ( = ?auto_68730 ?auto_68733 ) ) ( not ( = ?auto_68730 ?auto_68734 ) ) ( not ( = ?auto_68730 ?auto_68735 ) ) ( not ( = ?auto_68731 ?auto_68732 ) ) ( not ( = ?auto_68731 ?auto_68733 ) ) ( not ( = ?auto_68731 ?auto_68734 ) ) ( not ( = ?auto_68731 ?auto_68735 ) ) ( not ( = ?auto_68732 ?auto_68733 ) ) ( not ( = ?auto_68732 ?auto_68734 ) ) ( not ( = ?auto_68732 ?auto_68735 ) ) ( not ( = ?auto_68733 ?auto_68734 ) ) ( not ( = ?auto_68733 ?auto_68735 ) ) ( not ( = ?auto_68734 ?auto_68735 ) ) ( not ( = ?auto_68730 ?auto_68736 ) ) ( not ( = ?auto_68731 ?auto_68736 ) ) ( not ( = ?auto_68732 ?auto_68736 ) ) ( not ( = ?auto_68733 ?auto_68736 ) ) ( not ( = ?auto_68734 ?auto_68736 ) ) ( not ( = ?auto_68735 ?auto_68736 ) ) ( ON ?auto_68730 ?auto_68737 ) ( not ( = ?auto_68730 ?auto_68737 ) ) ( not ( = ?auto_68731 ?auto_68737 ) ) ( not ( = ?auto_68732 ?auto_68737 ) ) ( not ( = ?auto_68733 ?auto_68737 ) ) ( not ( = ?auto_68734 ?auto_68737 ) ) ( not ( = ?auto_68735 ?auto_68737 ) ) ( not ( = ?auto_68736 ?auto_68737 ) ) ( ON ?auto_68731 ?auto_68730 ) ( ON-TABLE ?auto_68737 ) ( ON ?auto_68732 ?auto_68731 ) ( ON ?auto_68733 ?auto_68732 ) ( ON ?auto_68734 ?auto_68733 ) ( ON ?auto_68735 ?auto_68734 ) ( CLEAR ?auto_68735 ) ( HOLDING ?auto_68736 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68736 )
      ( MAKE-6PILE ?auto_68730 ?auto_68731 ?auto_68732 ?auto_68733 ?auto_68734 ?auto_68735 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68738 - BLOCK
      ?auto_68739 - BLOCK
      ?auto_68740 - BLOCK
      ?auto_68741 - BLOCK
      ?auto_68742 - BLOCK
      ?auto_68743 - BLOCK
    )
    :vars
    (
      ?auto_68745 - BLOCK
      ?auto_68744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68738 ?auto_68739 ) ) ( not ( = ?auto_68738 ?auto_68740 ) ) ( not ( = ?auto_68738 ?auto_68741 ) ) ( not ( = ?auto_68738 ?auto_68742 ) ) ( not ( = ?auto_68738 ?auto_68743 ) ) ( not ( = ?auto_68739 ?auto_68740 ) ) ( not ( = ?auto_68739 ?auto_68741 ) ) ( not ( = ?auto_68739 ?auto_68742 ) ) ( not ( = ?auto_68739 ?auto_68743 ) ) ( not ( = ?auto_68740 ?auto_68741 ) ) ( not ( = ?auto_68740 ?auto_68742 ) ) ( not ( = ?auto_68740 ?auto_68743 ) ) ( not ( = ?auto_68741 ?auto_68742 ) ) ( not ( = ?auto_68741 ?auto_68743 ) ) ( not ( = ?auto_68742 ?auto_68743 ) ) ( not ( = ?auto_68738 ?auto_68745 ) ) ( not ( = ?auto_68739 ?auto_68745 ) ) ( not ( = ?auto_68740 ?auto_68745 ) ) ( not ( = ?auto_68741 ?auto_68745 ) ) ( not ( = ?auto_68742 ?auto_68745 ) ) ( not ( = ?auto_68743 ?auto_68745 ) ) ( ON ?auto_68738 ?auto_68744 ) ( not ( = ?auto_68738 ?auto_68744 ) ) ( not ( = ?auto_68739 ?auto_68744 ) ) ( not ( = ?auto_68740 ?auto_68744 ) ) ( not ( = ?auto_68741 ?auto_68744 ) ) ( not ( = ?auto_68742 ?auto_68744 ) ) ( not ( = ?auto_68743 ?auto_68744 ) ) ( not ( = ?auto_68745 ?auto_68744 ) ) ( ON ?auto_68739 ?auto_68738 ) ( ON-TABLE ?auto_68744 ) ( ON ?auto_68740 ?auto_68739 ) ( ON ?auto_68741 ?auto_68740 ) ( ON ?auto_68742 ?auto_68741 ) ( ON ?auto_68743 ?auto_68742 ) ( ON ?auto_68745 ?auto_68743 ) ( CLEAR ?auto_68745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_68744 ?auto_68738 ?auto_68739 ?auto_68740 ?auto_68741 ?auto_68742 ?auto_68743 )
      ( MAKE-6PILE ?auto_68738 ?auto_68739 ?auto_68740 ?auto_68741 ?auto_68742 ?auto_68743 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68760 - BLOCK
      ?auto_68761 - BLOCK
      ?auto_68762 - BLOCK
      ?auto_68763 - BLOCK
      ?auto_68764 - BLOCK
      ?auto_68765 - BLOCK
      ?auto_68766 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68765 ) ( ON-TABLE ?auto_68760 ) ( ON ?auto_68761 ?auto_68760 ) ( ON ?auto_68762 ?auto_68761 ) ( ON ?auto_68763 ?auto_68762 ) ( ON ?auto_68764 ?auto_68763 ) ( ON ?auto_68765 ?auto_68764 ) ( not ( = ?auto_68760 ?auto_68761 ) ) ( not ( = ?auto_68760 ?auto_68762 ) ) ( not ( = ?auto_68760 ?auto_68763 ) ) ( not ( = ?auto_68760 ?auto_68764 ) ) ( not ( = ?auto_68760 ?auto_68765 ) ) ( not ( = ?auto_68760 ?auto_68766 ) ) ( not ( = ?auto_68761 ?auto_68762 ) ) ( not ( = ?auto_68761 ?auto_68763 ) ) ( not ( = ?auto_68761 ?auto_68764 ) ) ( not ( = ?auto_68761 ?auto_68765 ) ) ( not ( = ?auto_68761 ?auto_68766 ) ) ( not ( = ?auto_68762 ?auto_68763 ) ) ( not ( = ?auto_68762 ?auto_68764 ) ) ( not ( = ?auto_68762 ?auto_68765 ) ) ( not ( = ?auto_68762 ?auto_68766 ) ) ( not ( = ?auto_68763 ?auto_68764 ) ) ( not ( = ?auto_68763 ?auto_68765 ) ) ( not ( = ?auto_68763 ?auto_68766 ) ) ( not ( = ?auto_68764 ?auto_68765 ) ) ( not ( = ?auto_68764 ?auto_68766 ) ) ( not ( = ?auto_68765 ?auto_68766 ) ) ( ON-TABLE ?auto_68766 ) ( CLEAR ?auto_68766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_68766 )
      ( MAKE-7PILE ?auto_68760 ?auto_68761 ?auto_68762 ?auto_68763 ?auto_68764 ?auto_68765 ?auto_68766 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68767 - BLOCK
      ?auto_68768 - BLOCK
      ?auto_68769 - BLOCK
      ?auto_68770 - BLOCK
      ?auto_68771 - BLOCK
      ?auto_68772 - BLOCK
      ?auto_68773 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68767 ) ( ON ?auto_68768 ?auto_68767 ) ( ON ?auto_68769 ?auto_68768 ) ( ON ?auto_68770 ?auto_68769 ) ( ON ?auto_68771 ?auto_68770 ) ( not ( = ?auto_68767 ?auto_68768 ) ) ( not ( = ?auto_68767 ?auto_68769 ) ) ( not ( = ?auto_68767 ?auto_68770 ) ) ( not ( = ?auto_68767 ?auto_68771 ) ) ( not ( = ?auto_68767 ?auto_68772 ) ) ( not ( = ?auto_68767 ?auto_68773 ) ) ( not ( = ?auto_68768 ?auto_68769 ) ) ( not ( = ?auto_68768 ?auto_68770 ) ) ( not ( = ?auto_68768 ?auto_68771 ) ) ( not ( = ?auto_68768 ?auto_68772 ) ) ( not ( = ?auto_68768 ?auto_68773 ) ) ( not ( = ?auto_68769 ?auto_68770 ) ) ( not ( = ?auto_68769 ?auto_68771 ) ) ( not ( = ?auto_68769 ?auto_68772 ) ) ( not ( = ?auto_68769 ?auto_68773 ) ) ( not ( = ?auto_68770 ?auto_68771 ) ) ( not ( = ?auto_68770 ?auto_68772 ) ) ( not ( = ?auto_68770 ?auto_68773 ) ) ( not ( = ?auto_68771 ?auto_68772 ) ) ( not ( = ?auto_68771 ?auto_68773 ) ) ( not ( = ?auto_68772 ?auto_68773 ) ) ( ON-TABLE ?auto_68773 ) ( CLEAR ?auto_68773 ) ( HOLDING ?auto_68772 ) ( CLEAR ?auto_68771 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68767 ?auto_68768 ?auto_68769 ?auto_68770 ?auto_68771 ?auto_68772 )
      ( MAKE-7PILE ?auto_68767 ?auto_68768 ?auto_68769 ?auto_68770 ?auto_68771 ?auto_68772 ?auto_68773 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68774 - BLOCK
      ?auto_68775 - BLOCK
      ?auto_68776 - BLOCK
      ?auto_68777 - BLOCK
      ?auto_68778 - BLOCK
      ?auto_68779 - BLOCK
      ?auto_68780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68774 ) ( ON ?auto_68775 ?auto_68774 ) ( ON ?auto_68776 ?auto_68775 ) ( ON ?auto_68777 ?auto_68776 ) ( ON ?auto_68778 ?auto_68777 ) ( not ( = ?auto_68774 ?auto_68775 ) ) ( not ( = ?auto_68774 ?auto_68776 ) ) ( not ( = ?auto_68774 ?auto_68777 ) ) ( not ( = ?auto_68774 ?auto_68778 ) ) ( not ( = ?auto_68774 ?auto_68779 ) ) ( not ( = ?auto_68774 ?auto_68780 ) ) ( not ( = ?auto_68775 ?auto_68776 ) ) ( not ( = ?auto_68775 ?auto_68777 ) ) ( not ( = ?auto_68775 ?auto_68778 ) ) ( not ( = ?auto_68775 ?auto_68779 ) ) ( not ( = ?auto_68775 ?auto_68780 ) ) ( not ( = ?auto_68776 ?auto_68777 ) ) ( not ( = ?auto_68776 ?auto_68778 ) ) ( not ( = ?auto_68776 ?auto_68779 ) ) ( not ( = ?auto_68776 ?auto_68780 ) ) ( not ( = ?auto_68777 ?auto_68778 ) ) ( not ( = ?auto_68777 ?auto_68779 ) ) ( not ( = ?auto_68777 ?auto_68780 ) ) ( not ( = ?auto_68778 ?auto_68779 ) ) ( not ( = ?auto_68778 ?auto_68780 ) ) ( not ( = ?auto_68779 ?auto_68780 ) ) ( ON-TABLE ?auto_68780 ) ( CLEAR ?auto_68778 ) ( ON ?auto_68779 ?auto_68780 ) ( CLEAR ?auto_68779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68780 )
      ( MAKE-7PILE ?auto_68774 ?auto_68775 ?auto_68776 ?auto_68777 ?auto_68778 ?auto_68779 ?auto_68780 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68781 - BLOCK
      ?auto_68782 - BLOCK
      ?auto_68783 - BLOCK
      ?auto_68784 - BLOCK
      ?auto_68785 - BLOCK
      ?auto_68786 - BLOCK
      ?auto_68787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68781 ) ( ON ?auto_68782 ?auto_68781 ) ( ON ?auto_68783 ?auto_68782 ) ( ON ?auto_68784 ?auto_68783 ) ( not ( = ?auto_68781 ?auto_68782 ) ) ( not ( = ?auto_68781 ?auto_68783 ) ) ( not ( = ?auto_68781 ?auto_68784 ) ) ( not ( = ?auto_68781 ?auto_68785 ) ) ( not ( = ?auto_68781 ?auto_68786 ) ) ( not ( = ?auto_68781 ?auto_68787 ) ) ( not ( = ?auto_68782 ?auto_68783 ) ) ( not ( = ?auto_68782 ?auto_68784 ) ) ( not ( = ?auto_68782 ?auto_68785 ) ) ( not ( = ?auto_68782 ?auto_68786 ) ) ( not ( = ?auto_68782 ?auto_68787 ) ) ( not ( = ?auto_68783 ?auto_68784 ) ) ( not ( = ?auto_68783 ?auto_68785 ) ) ( not ( = ?auto_68783 ?auto_68786 ) ) ( not ( = ?auto_68783 ?auto_68787 ) ) ( not ( = ?auto_68784 ?auto_68785 ) ) ( not ( = ?auto_68784 ?auto_68786 ) ) ( not ( = ?auto_68784 ?auto_68787 ) ) ( not ( = ?auto_68785 ?auto_68786 ) ) ( not ( = ?auto_68785 ?auto_68787 ) ) ( not ( = ?auto_68786 ?auto_68787 ) ) ( ON-TABLE ?auto_68787 ) ( ON ?auto_68786 ?auto_68787 ) ( CLEAR ?auto_68786 ) ( HOLDING ?auto_68785 ) ( CLEAR ?auto_68784 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68781 ?auto_68782 ?auto_68783 ?auto_68784 ?auto_68785 )
      ( MAKE-7PILE ?auto_68781 ?auto_68782 ?auto_68783 ?auto_68784 ?auto_68785 ?auto_68786 ?auto_68787 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68788 - BLOCK
      ?auto_68789 - BLOCK
      ?auto_68790 - BLOCK
      ?auto_68791 - BLOCK
      ?auto_68792 - BLOCK
      ?auto_68793 - BLOCK
      ?auto_68794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68788 ) ( ON ?auto_68789 ?auto_68788 ) ( ON ?auto_68790 ?auto_68789 ) ( ON ?auto_68791 ?auto_68790 ) ( not ( = ?auto_68788 ?auto_68789 ) ) ( not ( = ?auto_68788 ?auto_68790 ) ) ( not ( = ?auto_68788 ?auto_68791 ) ) ( not ( = ?auto_68788 ?auto_68792 ) ) ( not ( = ?auto_68788 ?auto_68793 ) ) ( not ( = ?auto_68788 ?auto_68794 ) ) ( not ( = ?auto_68789 ?auto_68790 ) ) ( not ( = ?auto_68789 ?auto_68791 ) ) ( not ( = ?auto_68789 ?auto_68792 ) ) ( not ( = ?auto_68789 ?auto_68793 ) ) ( not ( = ?auto_68789 ?auto_68794 ) ) ( not ( = ?auto_68790 ?auto_68791 ) ) ( not ( = ?auto_68790 ?auto_68792 ) ) ( not ( = ?auto_68790 ?auto_68793 ) ) ( not ( = ?auto_68790 ?auto_68794 ) ) ( not ( = ?auto_68791 ?auto_68792 ) ) ( not ( = ?auto_68791 ?auto_68793 ) ) ( not ( = ?auto_68791 ?auto_68794 ) ) ( not ( = ?auto_68792 ?auto_68793 ) ) ( not ( = ?auto_68792 ?auto_68794 ) ) ( not ( = ?auto_68793 ?auto_68794 ) ) ( ON-TABLE ?auto_68794 ) ( ON ?auto_68793 ?auto_68794 ) ( CLEAR ?auto_68791 ) ( ON ?auto_68792 ?auto_68793 ) ( CLEAR ?auto_68792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68794 ?auto_68793 )
      ( MAKE-7PILE ?auto_68788 ?auto_68789 ?auto_68790 ?auto_68791 ?auto_68792 ?auto_68793 ?auto_68794 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68795 - BLOCK
      ?auto_68796 - BLOCK
      ?auto_68797 - BLOCK
      ?auto_68798 - BLOCK
      ?auto_68799 - BLOCK
      ?auto_68800 - BLOCK
      ?auto_68801 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68795 ) ( ON ?auto_68796 ?auto_68795 ) ( ON ?auto_68797 ?auto_68796 ) ( not ( = ?auto_68795 ?auto_68796 ) ) ( not ( = ?auto_68795 ?auto_68797 ) ) ( not ( = ?auto_68795 ?auto_68798 ) ) ( not ( = ?auto_68795 ?auto_68799 ) ) ( not ( = ?auto_68795 ?auto_68800 ) ) ( not ( = ?auto_68795 ?auto_68801 ) ) ( not ( = ?auto_68796 ?auto_68797 ) ) ( not ( = ?auto_68796 ?auto_68798 ) ) ( not ( = ?auto_68796 ?auto_68799 ) ) ( not ( = ?auto_68796 ?auto_68800 ) ) ( not ( = ?auto_68796 ?auto_68801 ) ) ( not ( = ?auto_68797 ?auto_68798 ) ) ( not ( = ?auto_68797 ?auto_68799 ) ) ( not ( = ?auto_68797 ?auto_68800 ) ) ( not ( = ?auto_68797 ?auto_68801 ) ) ( not ( = ?auto_68798 ?auto_68799 ) ) ( not ( = ?auto_68798 ?auto_68800 ) ) ( not ( = ?auto_68798 ?auto_68801 ) ) ( not ( = ?auto_68799 ?auto_68800 ) ) ( not ( = ?auto_68799 ?auto_68801 ) ) ( not ( = ?auto_68800 ?auto_68801 ) ) ( ON-TABLE ?auto_68801 ) ( ON ?auto_68800 ?auto_68801 ) ( ON ?auto_68799 ?auto_68800 ) ( CLEAR ?auto_68799 ) ( HOLDING ?auto_68798 ) ( CLEAR ?auto_68797 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68795 ?auto_68796 ?auto_68797 ?auto_68798 )
      ( MAKE-7PILE ?auto_68795 ?auto_68796 ?auto_68797 ?auto_68798 ?auto_68799 ?auto_68800 ?auto_68801 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68802 - BLOCK
      ?auto_68803 - BLOCK
      ?auto_68804 - BLOCK
      ?auto_68805 - BLOCK
      ?auto_68806 - BLOCK
      ?auto_68807 - BLOCK
      ?auto_68808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68802 ) ( ON ?auto_68803 ?auto_68802 ) ( ON ?auto_68804 ?auto_68803 ) ( not ( = ?auto_68802 ?auto_68803 ) ) ( not ( = ?auto_68802 ?auto_68804 ) ) ( not ( = ?auto_68802 ?auto_68805 ) ) ( not ( = ?auto_68802 ?auto_68806 ) ) ( not ( = ?auto_68802 ?auto_68807 ) ) ( not ( = ?auto_68802 ?auto_68808 ) ) ( not ( = ?auto_68803 ?auto_68804 ) ) ( not ( = ?auto_68803 ?auto_68805 ) ) ( not ( = ?auto_68803 ?auto_68806 ) ) ( not ( = ?auto_68803 ?auto_68807 ) ) ( not ( = ?auto_68803 ?auto_68808 ) ) ( not ( = ?auto_68804 ?auto_68805 ) ) ( not ( = ?auto_68804 ?auto_68806 ) ) ( not ( = ?auto_68804 ?auto_68807 ) ) ( not ( = ?auto_68804 ?auto_68808 ) ) ( not ( = ?auto_68805 ?auto_68806 ) ) ( not ( = ?auto_68805 ?auto_68807 ) ) ( not ( = ?auto_68805 ?auto_68808 ) ) ( not ( = ?auto_68806 ?auto_68807 ) ) ( not ( = ?auto_68806 ?auto_68808 ) ) ( not ( = ?auto_68807 ?auto_68808 ) ) ( ON-TABLE ?auto_68808 ) ( ON ?auto_68807 ?auto_68808 ) ( ON ?auto_68806 ?auto_68807 ) ( CLEAR ?auto_68804 ) ( ON ?auto_68805 ?auto_68806 ) ( CLEAR ?auto_68805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68808 ?auto_68807 ?auto_68806 )
      ( MAKE-7PILE ?auto_68802 ?auto_68803 ?auto_68804 ?auto_68805 ?auto_68806 ?auto_68807 ?auto_68808 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68809 - BLOCK
      ?auto_68810 - BLOCK
      ?auto_68811 - BLOCK
      ?auto_68812 - BLOCK
      ?auto_68813 - BLOCK
      ?auto_68814 - BLOCK
      ?auto_68815 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68809 ) ( ON ?auto_68810 ?auto_68809 ) ( not ( = ?auto_68809 ?auto_68810 ) ) ( not ( = ?auto_68809 ?auto_68811 ) ) ( not ( = ?auto_68809 ?auto_68812 ) ) ( not ( = ?auto_68809 ?auto_68813 ) ) ( not ( = ?auto_68809 ?auto_68814 ) ) ( not ( = ?auto_68809 ?auto_68815 ) ) ( not ( = ?auto_68810 ?auto_68811 ) ) ( not ( = ?auto_68810 ?auto_68812 ) ) ( not ( = ?auto_68810 ?auto_68813 ) ) ( not ( = ?auto_68810 ?auto_68814 ) ) ( not ( = ?auto_68810 ?auto_68815 ) ) ( not ( = ?auto_68811 ?auto_68812 ) ) ( not ( = ?auto_68811 ?auto_68813 ) ) ( not ( = ?auto_68811 ?auto_68814 ) ) ( not ( = ?auto_68811 ?auto_68815 ) ) ( not ( = ?auto_68812 ?auto_68813 ) ) ( not ( = ?auto_68812 ?auto_68814 ) ) ( not ( = ?auto_68812 ?auto_68815 ) ) ( not ( = ?auto_68813 ?auto_68814 ) ) ( not ( = ?auto_68813 ?auto_68815 ) ) ( not ( = ?auto_68814 ?auto_68815 ) ) ( ON-TABLE ?auto_68815 ) ( ON ?auto_68814 ?auto_68815 ) ( ON ?auto_68813 ?auto_68814 ) ( ON ?auto_68812 ?auto_68813 ) ( CLEAR ?auto_68812 ) ( HOLDING ?auto_68811 ) ( CLEAR ?auto_68810 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68809 ?auto_68810 ?auto_68811 )
      ( MAKE-7PILE ?auto_68809 ?auto_68810 ?auto_68811 ?auto_68812 ?auto_68813 ?auto_68814 ?auto_68815 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68816 - BLOCK
      ?auto_68817 - BLOCK
      ?auto_68818 - BLOCK
      ?auto_68819 - BLOCK
      ?auto_68820 - BLOCK
      ?auto_68821 - BLOCK
      ?auto_68822 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68816 ) ( ON ?auto_68817 ?auto_68816 ) ( not ( = ?auto_68816 ?auto_68817 ) ) ( not ( = ?auto_68816 ?auto_68818 ) ) ( not ( = ?auto_68816 ?auto_68819 ) ) ( not ( = ?auto_68816 ?auto_68820 ) ) ( not ( = ?auto_68816 ?auto_68821 ) ) ( not ( = ?auto_68816 ?auto_68822 ) ) ( not ( = ?auto_68817 ?auto_68818 ) ) ( not ( = ?auto_68817 ?auto_68819 ) ) ( not ( = ?auto_68817 ?auto_68820 ) ) ( not ( = ?auto_68817 ?auto_68821 ) ) ( not ( = ?auto_68817 ?auto_68822 ) ) ( not ( = ?auto_68818 ?auto_68819 ) ) ( not ( = ?auto_68818 ?auto_68820 ) ) ( not ( = ?auto_68818 ?auto_68821 ) ) ( not ( = ?auto_68818 ?auto_68822 ) ) ( not ( = ?auto_68819 ?auto_68820 ) ) ( not ( = ?auto_68819 ?auto_68821 ) ) ( not ( = ?auto_68819 ?auto_68822 ) ) ( not ( = ?auto_68820 ?auto_68821 ) ) ( not ( = ?auto_68820 ?auto_68822 ) ) ( not ( = ?auto_68821 ?auto_68822 ) ) ( ON-TABLE ?auto_68822 ) ( ON ?auto_68821 ?auto_68822 ) ( ON ?auto_68820 ?auto_68821 ) ( ON ?auto_68819 ?auto_68820 ) ( CLEAR ?auto_68817 ) ( ON ?auto_68818 ?auto_68819 ) ( CLEAR ?auto_68818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68822 ?auto_68821 ?auto_68820 ?auto_68819 )
      ( MAKE-7PILE ?auto_68816 ?auto_68817 ?auto_68818 ?auto_68819 ?auto_68820 ?auto_68821 ?auto_68822 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68823 - BLOCK
      ?auto_68824 - BLOCK
      ?auto_68825 - BLOCK
      ?auto_68826 - BLOCK
      ?auto_68827 - BLOCK
      ?auto_68828 - BLOCK
      ?auto_68829 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68823 ) ( not ( = ?auto_68823 ?auto_68824 ) ) ( not ( = ?auto_68823 ?auto_68825 ) ) ( not ( = ?auto_68823 ?auto_68826 ) ) ( not ( = ?auto_68823 ?auto_68827 ) ) ( not ( = ?auto_68823 ?auto_68828 ) ) ( not ( = ?auto_68823 ?auto_68829 ) ) ( not ( = ?auto_68824 ?auto_68825 ) ) ( not ( = ?auto_68824 ?auto_68826 ) ) ( not ( = ?auto_68824 ?auto_68827 ) ) ( not ( = ?auto_68824 ?auto_68828 ) ) ( not ( = ?auto_68824 ?auto_68829 ) ) ( not ( = ?auto_68825 ?auto_68826 ) ) ( not ( = ?auto_68825 ?auto_68827 ) ) ( not ( = ?auto_68825 ?auto_68828 ) ) ( not ( = ?auto_68825 ?auto_68829 ) ) ( not ( = ?auto_68826 ?auto_68827 ) ) ( not ( = ?auto_68826 ?auto_68828 ) ) ( not ( = ?auto_68826 ?auto_68829 ) ) ( not ( = ?auto_68827 ?auto_68828 ) ) ( not ( = ?auto_68827 ?auto_68829 ) ) ( not ( = ?auto_68828 ?auto_68829 ) ) ( ON-TABLE ?auto_68829 ) ( ON ?auto_68828 ?auto_68829 ) ( ON ?auto_68827 ?auto_68828 ) ( ON ?auto_68826 ?auto_68827 ) ( ON ?auto_68825 ?auto_68826 ) ( CLEAR ?auto_68825 ) ( HOLDING ?auto_68824 ) ( CLEAR ?auto_68823 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68823 ?auto_68824 )
      ( MAKE-7PILE ?auto_68823 ?auto_68824 ?auto_68825 ?auto_68826 ?auto_68827 ?auto_68828 ?auto_68829 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68830 - BLOCK
      ?auto_68831 - BLOCK
      ?auto_68832 - BLOCK
      ?auto_68833 - BLOCK
      ?auto_68834 - BLOCK
      ?auto_68835 - BLOCK
      ?auto_68836 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68830 ) ( not ( = ?auto_68830 ?auto_68831 ) ) ( not ( = ?auto_68830 ?auto_68832 ) ) ( not ( = ?auto_68830 ?auto_68833 ) ) ( not ( = ?auto_68830 ?auto_68834 ) ) ( not ( = ?auto_68830 ?auto_68835 ) ) ( not ( = ?auto_68830 ?auto_68836 ) ) ( not ( = ?auto_68831 ?auto_68832 ) ) ( not ( = ?auto_68831 ?auto_68833 ) ) ( not ( = ?auto_68831 ?auto_68834 ) ) ( not ( = ?auto_68831 ?auto_68835 ) ) ( not ( = ?auto_68831 ?auto_68836 ) ) ( not ( = ?auto_68832 ?auto_68833 ) ) ( not ( = ?auto_68832 ?auto_68834 ) ) ( not ( = ?auto_68832 ?auto_68835 ) ) ( not ( = ?auto_68832 ?auto_68836 ) ) ( not ( = ?auto_68833 ?auto_68834 ) ) ( not ( = ?auto_68833 ?auto_68835 ) ) ( not ( = ?auto_68833 ?auto_68836 ) ) ( not ( = ?auto_68834 ?auto_68835 ) ) ( not ( = ?auto_68834 ?auto_68836 ) ) ( not ( = ?auto_68835 ?auto_68836 ) ) ( ON-TABLE ?auto_68836 ) ( ON ?auto_68835 ?auto_68836 ) ( ON ?auto_68834 ?auto_68835 ) ( ON ?auto_68833 ?auto_68834 ) ( ON ?auto_68832 ?auto_68833 ) ( CLEAR ?auto_68830 ) ( ON ?auto_68831 ?auto_68832 ) ( CLEAR ?auto_68831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68836 ?auto_68835 ?auto_68834 ?auto_68833 ?auto_68832 )
      ( MAKE-7PILE ?auto_68830 ?auto_68831 ?auto_68832 ?auto_68833 ?auto_68834 ?auto_68835 ?auto_68836 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68837 - BLOCK
      ?auto_68838 - BLOCK
      ?auto_68839 - BLOCK
      ?auto_68840 - BLOCK
      ?auto_68841 - BLOCK
      ?auto_68842 - BLOCK
      ?auto_68843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68837 ?auto_68838 ) ) ( not ( = ?auto_68837 ?auto_68839 ) ) ( not ( = ?auto_68837 ?auto_68840 ) ) ( not ( = ?auto_68837 ?auto_68841 ) ) ( not ( = ?auto_68837 ?auto_68842 ) ) ( not ( = ?auto_68837 ?auto_68843 ) ) ( not ( = ?auto_68838 ?auto_68839 ) ) ( not ( = ?auto_68838 ?auto_68840 ) ) ( not ( = ?auto_68838 ?auto_68841 ) ) ( not ( = ?auto_68838 ?auto_68842 ) ) ( not ( = ?auto_68838 ?auto_68843 ) ) ( not ( = ?auto_68839 ?auto_68840 ) ) ( not ( = ?auto_68839 ?auto_68841 ) ) ( not ( = ?auto_68839 ?auto_68842 ) ) ( not ( = ?auto_68839 ?auto_68843 ) ) ( not ( = ?auto_68840 ?auto_68841 ) ) ( not ( = ?auto_68840 ?auto_68842 ) ) ( not ( = ?auto_68840 ?auto_68843 ) ) ( not ( = ?auto_68841 ?auto_68842 ) ) ( not ( = ?auto_68841 ?auto_68843 ) ) ( not ( = ?auto_68842 ?auto_68843 ) ) ( ON-TABLE ?auto_68843 ) ( ON ?auto_68842 ?auto_68843 ) ( ON ?auto_68841 ?auto_68842 ) ( ON ?auto_68840 ?auto_68841 ) ( ON ?auto_68839 ?auto_68840 ) ( ON ?auto_68838 ?auto_68839 ) ( CLEAR ?auto_68838 ) ( HOLDING ?auto_68837 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68837 )
      ( MAKE-7PILE ?auto_68837 ?auto_68838 ?auto_68839 ?auto_68840 ?auto_68841 ?auto_68842 ?auto_68843 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68844 - BLOCK
      ?auto_68845 - BLOCK
      ?auto_68846 - BLOCK
      ?auto_68847 - BLOCK
      ?auto_68848 - BLOCK
      ?auto_68849 - BLOCK
      ?auto_68850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68844 ?auto_68845 ) ) ( not ( = ?auto_68844 ?auto_68846 ) ) ( not ( = ?auto_68844 ?auto_68847 ) ) ( not ( = ?auto_68844 ?auto_68848 ) ) ( not ( = ?auto_68844 ?auto_68849 ) ) ( not ( = ?auto_68844 ?auto_68850 ) ) ( not ( = ?auto_68845 ?auto_68846 ) ) ( not ( = ?auto_68845 ?auto_68847 ) ) ( not ( = ?auto_68845 ?auto_68848 ) ) ( not ( = ?auto_68845 ?auto_68849 ) ) ( not ( = ?auto_68845 ?auto_68850 ) ) ( not ( = ?auto_68846 ?auto_68847 ) ) ( not ( = ?auto_68846 ?auto_68848 ) ) ( not ( = ?auto_68846 ?auto_68849 ) ) ( not ( = ?auto_68846 ?auto_68850 ) ) ( not ( = ?auto_68847 ?auto_68848 ) ) ( not ( = ?auto_68847 ?auto_68849 ) ) ( not ( = ?auto_68847 ?auto_68850 ) ) ( not ( = ?auto_68848 ?auto_68849 ) ) ( not ( = ?auto_68848 ?auto_68850 ) ) ( not ( = ?auto_68849 ?auto_68850 ) ) ( ON-TABLE ?auto_68850 ) ( ON ?auto_68849 ?auto_68850 ) ( ON ?auto_68848 ?auto_68849 ) ( ON ?auto_68847 ?auto_68848 ) ( ON ?auto_68846 ?auto_68847 ) ( ON ?auto_68845 ?auto_68846 ) ( ON ?auto_68844 ?auto_68845 ) ( CLEAR ?auto_68844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68850 ?auto_68849 ?auto_68848 ?auto_68847 ?auto_68846 ?auto_68845 )
      ( MAKE-7PILE ?auto_68844 ?auto_68845 ?auto_68846 ?auto_68847 ?auto_68848 ?auto_68849 ?auto_68850 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68858 - BLOCK
      ?auto_68859 - BLOCK
      ?auto_68860 - BLOCK
      ?auto_68861 - BLOCK
      ?auto_68862 - BLOCK
      ?auto_68863 - BLOCK
      ?auto_68864 - BLOCK
    )
    :vars
    (
      ?auto_68865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68858 ?auto_68859 ) ) ( not ( = ?auto_68858 ?auto_68860 ) ) ( not ( = ?auto_68858 ?auto_68861 ) ) ( not ( = ?auto_68858 ?auto_68862 ) ) ( not ( = ?auto_68858 ?auto_68863 ) ) ( not ( = ?auto_68858 ?auto_68864 ) ) ( not ( = ?auto_68859 ?auto_68860 ) ) ( not ( = ?auto_68859 ?auto_68861 ) ) ( not ( = ?auto_68859 ?auto_68862 ) ) ( not ( = ?auto_68859 ?auto_68863 ) ) ( not ( = ?auto_68859 ?auto_68864 ) ) ( not ( = ?auto_68860 ?auto_68861 ) ) ( not ( = ?auto_68860 ?auto_68862 ) ) ( not ( = ?auto_68860 ?auto_68863 ) ) ( not ( = ?auto_68860 ?auto_68864 ) ) ( not ( = ?auto_68861 ?auto_68862 ) ) ( not ( = ?auto_68861 ?auto_68863 ) ) ( not ( = ?auto_68861 ?auto_68864 ) ) ( not ( = ?auto_68862 ?auto_68863 ) ) ( not ( = ?auto_68862 ?auto_68864 ) ) ( not ( = ?auto_68863 ?auto_68864 ) ) ( ON-TABLE ?auto_68864 ) ( ON ?auto_68863 ?auto_68864 ) ( ON ?auto_68862 ?auto_68863 ) ( ON ?auto_68861 ?auto_68862 ) ( ON ?auto_68860 ?auto_68861 ) ( ON ?auto_68859 ?auto_68860 ) ( CLEAR ?auto_68859 ) ( ON ?auto_68858 ?auto_68865 ) ( CLEAR ?auto_68858 ) ( HAND-EMPTY ) ( not ( = ?auto_68858 ?auto_68865 ) ) ( not ( = ?auto_68859 ?auto_68865 ) ) ( not ( = ?auto_68860 ?auto_68865 ) ) ( not ( = ?auto_68861 ?auto_68865 ) ) ( not ( = ?auto_68862 ?auto_68865 ) ) ( not ( = ?auto_68863 ?auto_68865 ) ) ( not ( = ?auto_68864 ?auto_68865 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68858 ?auto_68865 )
      ( MAKE-7PILE ?auto_68858 ?auto_68859 ?auto_68860 ?auto_68861 ?auto_68862 ?auto_68863 ?auto_68864 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68866 - BLOCK
      ?auto_68867 - BLOCK
      ?auto_68868 - BLOCK
      ?auto_68869 - BLOCK
      ?auto_68870 - BLOCK
      ?auto_68871 - BLOCK
      ?auto_68872 - BLOCK
    )
    :vars
    (
      ?auto_68873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68866 ?auto_68867 ) ) ( not ( = ?auto_68866 ?auto_68868 ) ) ( not ( = ?auto_68866 ?auto_68869 ) ) ( not ( = ?auto_68866 ?auto_68870 ) ) ( not ( = ?auto_68866 ?auto_68871 ) ) ( not ( = ?auto_68866 ?auto_68872 ) ) ( not ( = ?auto_68867 ?auto_68868 ) ) ( not ( = ?auto_68867 ?auto_68869 ) ) ( not ( = ?auto_68867 ?auto_68870 ) ) ( not ( = ?auto_68867 ?auto_68871 ) ) ( not ( = ?auto_68867 ?auto_68872 ) ) ( not ( = ?auto_68868 ?auto_68869 ) ) ( not ( = ?auto_68868 ?auto_68870 ) ) ( not ( = ?auto_68868 ?auto_68871 ) ) ( not ( = ?auto_68868 ?auto_68872 ) ) ( not ( = ?auto_68869 ?auto_68870 ) ) ( not ( = ?auto_68869 ?auto_68871 ) ) ( not ( = ?auto_68869 ?auto_68872 ) ) ( not ( = ?auto_68870 ?auto_68871 ) ) ( not ( = ?auto_68870 ?auto_68872 ) ) ( not ( = ?auto_68871 ?auto_68872 ) ) ( ON-TABLE ?auto_68872 ) ( ON ?auto_68871 ?auto_68872 ) ( ON ?auto_68870 ?auto_68871 ) ( ON ?auto_68869 ?auto_68870 ) ( ON ?auto_68868 ?auto_68869 ) ( ON ?auto_68866 ?auto_68873 ) ( CLEAR ?auto_68866 ) ( not ( = ?auto_68866 ?auto_68873 ) ) ( not ( = ?auto_68867 ?auto_68873 ) ) ( not ( = ?auto_68868 ?auto_68873 ) ) ( not ( = ?auto_68869 ?auto_68873 ) ) ( not ( = ?auto_68870 ?auto_68873 ) ) ( not ( = ?auto_68871 ?auto_68873 ) ) ( not ( = ?auto_68872 ?auto_68873 ) ) ( HOLDING ?auto_68867 ) ( CLEAR ?auto_68868 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68872 ?auto_68871 ?auto_68870 ?auto_68869 ?auto_68868 ?auto_68867 )
      ( MAKE-7PILE ?auto_68866 ?auto_68867 ?auto_68868 ?auto_68869 ?auto_68870 ?auto_68871 ?auto_68872 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68874 - BLOCK
      ?auto_68875 - BLOCK
      ?auto_68876 - BLOCK
      ?auto_68877 - BLOCK
      ?auto_68878 - BLOCK
      ?auto_68879 - BLOCK
      ?auto_68880 - BLOCK
    )
    :vars
    (
      ?auto_68881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68874 ?auto_68875 ) ) ( not ( = ?auto_68874 ?auto_68876 ) ) ( not ( = ?auto_68874 ?auto_68877 ) ) ( not ( = ?auto_68874 ?auto_68878 ) ) ( not ( = ?auto_68874 ?auto_68879 ) ) ( not ( = ?auto_68874 ?auto_68880 ) ) ( not ( = ?auto_68875 ?auto_68876 ) ) ( not ( = ?auto_68875 ?auto_68877 ) ) ( not ( = ?auto_68875 ?auto_68878 ) ) ( not ( = ?auto_68875 ?auto_68879 ) ) ( not ( = ?auto_68875 ?auto_68880 ) ) ( not ( = ?auto_68876 ?auto_68877 ) ) ( not ( = ?auto_68876 ?auto_68878 ) ) ( not ( = ?auto_68876 ?auto_68879 ) ) ( not ( = ?auto_68876 ?auto_68880 ) ) ( not ( = ?auto_68877 ?auto_68878 ) ) ( not ( = ?auto_68877 ?auto_68879 ) ) ( not ( = ?auto_68877 ?auto_68880 ) ) ( not ( = ?auto_68878 ?auto_68879 ) ) ( not ( = ?auto_68878 ?auto_68880 ) ) ( not ( = ?auto_68879 ?auto_68880 ) ) ( ON-TABLE ?auto_68880 ) ( ON ?auto_68879 ?auto_68880 ) ( ON ?auto_68878 ?auto_68879 ) ( ON ?auto_68877 ?auto_68878 ) ( ON ?auto_68876 ?auto_68877 ) ( ON ?auto_68874 ?auto_68881 ) ( not ( = ?auto_68874 ?auto_68881 ) ) ( not ( = ?auto_68875 ?auto_68881 ) ) ( not ( = ?auto_68876 ?auto_68881 ) ) ( not ( = ?auto_68877 ?auto_68881 ) ) ( not ( = ?auto_68878 ?auto_68881 ) ) ( not ( = ?auto_68879 ?auto_68881 ) ) ( not ( = ?auto_68880 ?auto_68881 ) ) ( CLEAR ?auto_68876 ) ( ON ?auto_68875 ?auto_68874 ) ( CLEAR ?auto_68875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68881 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68881 ?auto_68874 )
      ( MAKE-7PILE ?auto_68874 ?auto_68875 ?auto_68876 ?auto_68877 ?auto_68878 ?auto_68879 ?auto_68880 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68882 - BLOCK
      ?auto_68883 - BLOCK
      ?auto_68884 - BLOCK
      ?auto_68885 - BLOCK
      ?auto_68886 - BLOCK
      ?auto_68887 - BLOCK
      ?auto_68888 - BLOCK
    )
    :vars
    (
      ?auto_68889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68882 ?auto_68883 ) ) ( not ( = ?auto_68882 ?auto_68884 ) ) ( not ( = ?auto_68882 ?auto_68885 ) ) ( not ( = ?auto_68882 ?auto_68886 ) ) ( not ( = ?auto_68882 ?auto_68887 ) ) ( not ( = ?auto_68882 ?auto_68888 ) ) ( not ( = ?auto_68883 ?auto_68884 ) ) ( not ( = ?auto_68883 ?auto_68885 ) ) ( not ( = ?auto_68883 ?auto_68886 ) ) ( not ( = ?auto_68883 ?auto_68887 ) ) ( not ( = ?auto_68883 ?auto_68888 ) ) ( not ( = ?auto_68884 ?auto_68885 ) ) ( not ( = ?auto_68884 ?auto_68886 ) ) ( not ( = ?auto_68884 ?auto_68887 ) ) ( not ( = ?auto_68884 ?auto_68888 ) ) ( not ( = ?auto_68885 ?auto_68886 ) ) ( not ( = ?auto_68885 ?auto_68887 ) ) ( not ( = ?auto_68885 ?auto_68888 ) ) ( not ( = ?auto_68886 ?auto_68887 ) ) ( not ( = ?auto_68886 ?auto_68888 ) ) ( not ( = ?auto_68887 ?auto_68888 ) ) ( ON-TABLE ?auto_68888 ) ( ON ?auto_68887 ?auto_68888 ) ( ON ?auto_68886 ?auto_68887 ) ( ON ?auto_68885 ?auto_68886 ) ( ON ?auto_68882 ?auto_68889 ) ( not ( = ?auto_68882 ?auto_68889 ) ) ( not ( = ?auto_68883 ?auto_68889 ) ) ( not ( = ?auto_68884 ?auto_68889 ) ) ( not ( = ?auto_68885 ?auto_68889 ) ) ( not ( = ?auto_68886 ?auto_68889 ) ) ( not ( = ?auto_68887 ?auto_68889 ) ) ( not ( = ?auto_68888 ?auto_68889 ) ) ( ON ?auto_68883 ?auto_68882 ) ( CLEAR ?auto_68883 ) ( ON-TABLE ?auto_68889 ) ( HOLDING ?auto_68884 ) ( CLEAR ?auto_68885 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68888 ?auto_68887 ?auto_68886 ?auto_68885 ?auto_68884 )
      ( MAKE-7PILE ?auto_68882 ?auto_68883 ?auto_68884 ?auto_68885 ?auto_68886 ?auto_68887 ?auto_68888 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68890 - BLOCK
      ?auto_68891 - BLOCK
      ?auto_68892 - BLOCK
      ?auto_68893 - BLOCK
      ?auto_68894 - BLOCK
      ?auto_68895 - BLOCK
      ?auto_68896 - BLOCK
    )
    :vars
    (
      ?auto_68897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68890 ?auto_68891 ) ) ( not ( = ?auto_68890 ?auto_68892 ) ) ( not ( = ?auto_68890 ?auto_68893 ) ) ( not ( = ?auto_68890 ?auto_68894 ) ) ( not ( = ?auto_68890 ?auto_68895 ) ) ( not ( = ?auto_68890 ?auto_68896 ) ) ( not ( = ?auto_68891 ?auto_68892 ) ) ( not ( = ?auto_68891 ?auto_68893 ) ) ( not ( = ?auto_68891 ?auto_68894 ) ) ( not ( = ?auto_68891 ?auto_68895 ) ) ( not ( = ?auto_68891 ?auto_68896 ) ) ( not ( = ?auto_68892 ?auto_68893 ) ) ( not ( = ?auto_68892 ?auto_68894 ) ) ( not ( = ?auto_68892 ?auto_68895 ) ) ( not ( = ?auto_68892 ?auto_68896 ) ) ( not ( = ?auto_68893 ?auto_68894 ) ) ( not ( = ?auto_68893 ?auto_68895 ) ) ( not ( = ?auto_68893 ?auto_68896 ) ) ( not ( = ?auto_68894 ?auto_68895 ) ) ( not ( = ?auto_68894 ?auto_68896 ) ) ( not ( = ?auto_68895 ?auto_68896 ) ) ( ON-TABLE ?auto_68896 ) ( ON ?auto_68895 ?auto_68896 ) ( ON ?auto_68894 ?auto_68895 ) ( ON ?auto_68893 ?auto_68894 ) ( ON ?auto_68890 ?auto_68897 ) ( not ( = ?auto_68890 ?auto_68897 ) ) ( not ( = ?auto_68891 ?auto_68897 ) ) ( not ( = ?auto_68892 ?auto_68897 ) ) ( not ( = ?auto_68893 ?auto_68897 ) ) ( not ( = ?auto_68894 ?auto_68897 ) ) ( not ( = ?auto_68895 ?auto_68897 ) ) ( not ( = ?auto_68896 ?auto_68897 ) ) ( ON ?auto_68891 ?auto_68890 ) ( ON-TABLE ?auto_68897 ) ( CLEAR ?auto_68893 ) ( ON ?auto_68892 ?auto_68891 ) ( CLEAR ?auto_68892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68897 ?auto_68890 ?auto_68891 )
      ( MAKE-7PILE ?auto_68890 ?auto_68891 ?auto_68892 ?auto_68893 ?auto_68894 ?auto_68895 ?auto_68896 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68898 - BLOCK
      ?auto_68899 - BLOCK
      ?auto_68900 - BLOCK
      ?auto_68901 - BLOCK
      ?auto_68902 - BLOCK
      ?auto_68903 - BLOCK
      ?auto_68904 - BLOCK
    )
    :vars
    (
      ?auto_68905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68898 ?auto_68899 ) ) ( not ( = ?auto_68898 ?auto_68900 ) ) ( not ( = ?auto_68898 ?auto_68901 ) ) ( not ( = ?auto_68898 ?auto_68902 ) ) ( not ( = ?auto_68898 ?auto_68903 ) ) ( not ( = ?auto_68898 ?auto_68904 ) ) ( not ( = ?auto_68899 ?auto_68900 ) ) ( not ( = ?auto_68899 ?auto_68901 ) ) ( not ( = ?auto_68899 ?auto_68902 ) ) ( not ( = ?auto_68899 ?auto_68903 ) ) ( not ( = ?auto_68899 ?auto_68904 ) ) ( not ( = ?auto_68900 ?auto_68901 ) ) ( not ( = ?auto_68900 ?auto_68902 ) ) ( not ( = ?auto_68900 ?auto_68903 ) ) ( not ( = ?auto_68900 ?auto_68904 ) ) ( not ( = ?auto_68901 ?auto_68902 ) ) ( not ( = ?auto_68901 ?auto_68903 ) ) ( not ( = ?auto_68901 ?auto_68904 ) ) ( not ( = ?auto_68902 ?auto_68903 ) ) ( not ( = ?auto_68902 ?auto_68904 ) ) ( not ( = ?auto_68903 ?auto_68904 ) ) ( ON-TABLE ?auto_68904 ) ( ON ?auto_68903 ?auto_68904 ) ( ON ?auto_68902 ?auto_68903 ) ( ON ?auto_68898 ?auto_68905 ) ( not ( = ?auto_68898 ?auto_68905 ) ) ( not ( = ?auto_68899 ?auto_68905 ) ) ( not ( = ?auto_68900 ?auto_68905 ) ) ( not ( = ?auto_68901 ?auto_68905 ) ) ( not ( = ?auto_68902 ?auto_68905 ) ) ( not ( = ?auto_68903 ?auto_68905 ) ) ( not ( = ?auto_68904 ?auto_68905 ) ) ( ON ?auto_68899 ?auto_68898 ) ( ON-TABLE ?auto_68905 ) ( ON ?auto_68900 ?auto_68899 ) ( CLEAR ?auto_68900 ) ( HOLDING ?auto_68901 ) ( CLEAR ?auto_68902 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68904 ?auto_68903 ?auto_68902 ?auto_68901 )
      ( MAKE-7PILE ?auto_68898 ?auto_68899 ?auto_68900 ?auto_68901 ?auto_68902 ?auto_68903 ?auto_68904 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68906 - BLOCK
      ?auto_68907 - BLOCK
      ?auto_68908 - BLOCK
      ?auto_68909 - BLOCK
      ?auto_68910 - BLOCK
      ?auto_68911 - BLOCK
      ?auto_68912 - BLOCK
    )
    :vars
    (
      ?auto_68913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68906 ?auto_68907 ) ) ( not ( = ?auto_68906 ?auto_68908 ) ) ( not ( = ?auto_68906 ?auto_68909 ) ) ( not ( = ?auto_68906 ?auto_68910 ) ) ( not ( = ?auto_68906 ?auto_68911 ) ) ( not ( = ?auto_68906 ?auto_68912 ) ) ( not ( = ?auto_68907 ?auto_68908 ) ) ( not ( = ?auto_68907 ?auto_68909 ) ) ( not ( = ?auto_68907 ?auto_68910 ) ) ( not ( = ?auto_68907 ?auto_68911 ) ) ( not ( = ?auto_68907 ?auto_68912 ) ) ( not ( = ?auto_68908 ?auto_68909 ) ) ( not ( = ?auto_68908 ?auto_68910 ) ) ( not ( = ?auto_68908 ?auto_68911 ) ) ( not ( = ?auto_68908 ?auto_68912 ) ) ( not ( = ?auto_68909 ?auto_68910 ) ) ( not ( = ?auto_68909 ?auto_68911 ) ) ( not ( = ?auto_68909 ?auto_68912 ) ) ( not ( = ?auto_68910 ?auto_68911 ) ) ( not ( = ?auto_68910 ?auto_68912 ) ) ( not ( = ?auto_68911 ?auto_68912 ) ) ( ON-TABLE ?auto_68912 ) ( ON ?auto_68911 ?auto_68912 ) ( ON ?auto_68910 ?auto_68911 ) ( ON ?auto_68906 ?auto_68913 ) ( not ( = ?auto_68906 ?auto_68913 ) ) ( not ( = ?auto_68907 ?auto_68913 ) ) ( not ( = ?auto_68908 ?auto_68913 ) ) ( not ( = ?auto_68909 ?auto_68913 ) ) ( not ( = ?auto_68910 ?auto_68913 ) ) ( not ( = ?auto_68911 ?auto_68913 ) ) ( not ( = ?auto_68912 ?auto_68913 ) ) ( ON ?auto_68907 ?auto_68906 ) ( ON-TABLE ?auto_68913 ) ( ON ?auto_68908 ?auto_68907 ) ( CLEAR ?auto_68910 ) ( ON ?auto_68909 ?auto_68908 ) ( CLEAR ?auto_68909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68913 ?auto_68906 ?auto_68907 ?auto_68908 )
      ( MAKE-7PILE ?auto_68906 ?auto_68907 ?auto_68908 ?auto_68909 ?auto_68910 ?auto_68911 ?auto_68912 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68914 - BLOCK
      ?auto_68915 - BLOCK
      ?auto_68916 - BLOCK
      ?auto_68917 - BLOCK
      ?auto_68918 - BLOCK
      ?auto_68919 - BLOCK
      ?auto_68920 - BLOCK
    )
    :vars
    (
      ?auto_68921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68914 ?auto_68915 ) ) ( not ( = ?auto_68914 ?auto_68916 ) ) ( not ( = ?auto_68914 ?auto_68917 ) ) ( not ( = ?auto_68914 ?auto_68918 ) ) ( not ( = ?auto_68914 ?auto_68919 ) ) ( not ( = ?auto_68914 ?auto_68920 ) ) ( not ( = ?auto_68915 ?auto_68916 ) ) ( not ( = ?auto_68915 ?auto_68917 ) ) ( not ( = ?auto_68915 ?auto_68918 ) ) ( not ( = ?auto_68915 ?auto_68919 ) ) ( not ( = ?auto_68915 ?auto_68920 ) ) ( not ( = ?auto_68916 ?auto_68917 ) ) ( not ( = ?auto_68916 ?auto_68918 ) ) ( not ( = ?auto_68916 ?auto_68919 ) ) ( not ( = ?auto_68916 ?auto_68920 ) ) ( not ( = ?auto_68917 ?auto_68918 ) ) ( not ( = ?auto_68917 ?auto_68919 ) ) ( not ( = ?auto_68917 ?auto_68920 ) ) ( not ( = ?auto_68918 ?auto_68919 ) ) ( not ( = ?auto_68918 ?auto_68920 ) ) ( not ( = ?auto_68919 ?auto_68920 ) ) ( ON-TABLE ?auto_68920 ) ( ON ?auto_68919 ?auto_68920 ) ( ON ?auto_68914 ?auto_68921 ) ( not ( = ?auto_68914 ?auto_68921 ) ) ( not ( = ?auto_68915 ?auto_68921 ) ) ( not ( = ?auto_68916 ?auto_68921 ) ) ( not ( = ?auto_68917 ?auto_68921 ) ) ( not ( = ?auto_68918 ?auto_68921 ) ) ( not ( = ?auto_68919 ?auto_68921 ) ) ( not ( = ?auto_68920 ?auto_68921 ) ) ( ON ?auto_68915 ?auto_68914 ) ( ON-TABLE ?auto_68921 ) ( ON ?auto_68916 ?auto_68915 ) ( ON ?auto_68917 ?auto_68916 ) ( CLEAR ?auto_68917 ) ( HOLDING ?auto_68918 ) ( CLEAR ?auto_68919 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68920 ?auto_68919 ?auto_68918 )
      ( MAKE-7PILE ?auto_68914 ?auto_68915 ?auto_68916 ?auto_68917 ?auto_68918 ?auto_68919 ?auto_68920 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68922 - BLOCK
      ?auto_68923 - BLOCK
      ?auto_68924 - BLOCK
      ?auto_68925 - BLOCK
      ?auto_68926 - BLOCK
      ?auto_68927 - BLOCK
      ?auto_68928 - BLOCK
    )
    :vars
    (
      ?auto_68929 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68922 ?auto_68923 ) ) ( not ( = ?auto_68922 ?auto_68924 ) ) ( not ( = ?auto_68922 ?auto_68925 ) ) ( not ( = ?auto_68922 ?auto_68926 ) ) ( not ( = ?auto_68922 ?auto_68927 ) ) ( not ( = ?auto_68922 ?auto_68928 ) ) ( not ( = ?auto_68923 ?auto_68924 ) ) ( not ( = ?auto_68923 ?auto_68925 ) ) ( not ( = ?auto_68923 ?auto_68926 ) ) ( not ( = ?auto_68923 ?auto_68927 ) ) ( not ( = ?auto_68923 ?auto_68928 ) ) ( not ( = ?auto_68924 ?auto_68925 ) ) ( not ( = ?auto_68924 ?auto_68926 ) ) ( not ( = ?auto_68924 ?auto_68927 ) ) ( not ( = ?auto_68924 ?auto_68928 ) ) ( not ( = ?auto_68925 ?auto_68926 ) ) ( not ( = ?auto_68925 ?auto_68927 ) ) ( not ( = ?auto_68925 ?auto_68928 ) ) ( not ( = ?auto_68926 ?auto_68927 ) ) ( not ( = ?auto_68926 ?auto_68928 ) ) ( not ( = ?auto_68927 ?auto_68928 ) ) ( ON-TABLE ?auto_68928 ) ( ON ?auto_68927 ?auto_68928 ) ( ON ?auto_68922 ?auto_68929 ) ( not ( = ?auto_68922 ?auto_68929 ) ) ( not ( = ?auto_68923 ?auto_68929 ) ) ( not ( = ?auto_68924 ?auto_68929 ) ) ( not ( = ?auto_68925 ?auto_68929 ) ) ( not ( = ?auto_68926 ?auto_68929 ) ) ( not ( = ?auto_68927 ?auto_68929 ) ) ( not ( = ?auto_68928 ?auto_68929 ) ) ( ON ?auto_68923 ?auto_68922 ) ( ON-TABLE ?auto_68929 ) ( ON ?auto_68924 ?auto_68923 ) ( ON ?auto_68925 ?auto_68924 ) ( CLEAR ?auto_68927 ) ( ON ?auto_68926 ?auto_68925 ) ( CLEAR ?auto_68926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68929 ?auto_68922 ?auto_68923 ?auto_68924 ?auto_68925 )
      ( MAKE-7PILE ?auto_68922 ?auto_68923 ?auto_68924 ?auto_68925 ?auto_68926 ?auto_68927 ?auto_68928 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68930 - BLOCK
      ?auto_68931 - BLOCK
      ?auto_68932 - BLOCK
      ?auto_68933 - BLOCK
      ?auto_68934 - BLOCK
      ?auto_68935 - BLOCK
      ?auto_68936 - BLOCK
    )
    :vars
    (
      ?auto_68937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68930 ?auto_68931 ) ) ( not ( = ?auto_68930 ?auto_68932 ) ) ( not ( = ?auto_68930 ?auto_68933 ) ) ( not ( = ?auto_68930 ?auto_68934 ) ) ( not ( = ?auto_68930 ?auto_68935 ) ) ( not ( = ?auto_68930 ?auto_68936 ) ) ( not ( = ?auto_68931 ?auto_68932 ) ) ( not ( = ?auto_68931 ?auto_68933 ) ) ( not ( = ?auto_68931 ?auto_68934 ) ) ( not ( = ?auto_68931 ?auto_68935 ) ) ( not ( = ?auto_68931 ?auto_68936 ) ) ( not ( = ?auto_68932 ?auto_68933 ) ) ( not ( = ?auto_68932 ?auto_68934 ) ) ( not ( = ?auto_68932 ?auto_68935 ) ) ( not ( = ?auto_68932 ?auto_68936 ) ) ( not ( = ?auto_68933 ?auto_68934 ) ) ( not ( = ?auto_68933 ?auto_68935 ) ) ( not ( = ?auto_68933 ?auto_68936 ) ) ( not ( = ?auto_68934 ?auto_68935 ) ) ( not ( = ?auto_68934 ?auto_68936 ) ) ( not ( = ?auto_68935 ?auto_68936 ) ) ( ON-TABLE ?auto_68936 ) ( ON ?auto_68930 ?auto_68937 ) ( not ( = ?auto_68930 ?auto_68937 ) ) ( not ( = ?auto_68931 ?auto_68937 ) ) ( not ( = ?auto_68932 ?auto_68937 ) ) ( not ( = ?auto_68933 ?auto_68937 ) ) ( not ( = ?auto_68934 ?auto_68937 ) ) ( not ( = ?auto_68935 ?auto_68937 ) ) ( not ( = ?auto_68936 ?auto_68937 ) ) ( ON ?auto_68931 ?auto_68930 ) ( ON-TABLE ?auto_68937 ) ( ON ?auto_68932 ?auto_68931 ) ( ON ?auto_68933 ?auto_68932 ) ( ON ?auto_68934 ?auto_68933 ) ( CLEAR ?auto_68934 ) ( HOLDING ?auto_68935 ) ( CLEAR ?auto_68936 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68936 ?auto_68935 )
      ( MAKE-7PILE ?auto_68930 ?auto_68931 ?auto_68932 ?auto_68933 ?auto_68934 ?auto_68935 ?auto_68936 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68938 - BLOCK
      ?auto_68939 - BLOCK
      ?auto_68940 - BLOCK
      ?auto_68941 - BLOCK
      ?auto_68942 - BLOCK
      ?auto_68943 - BLOCK
      ?auto_68944 - BLOCK
    )
    :vars
    (
      ?auto_68945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68938 ?auto_68939 ) ) ( not ( = ?auto_68938 ?auto_68940 ) ) ( not ( = ?auto_68938 ?auto_68941 ) ) ( not ( = ?auto_68938 ?auto_68942 ) ) ( not ( = ?auto_68938 ?auto_68943 ) ) ( not ( = ?auto_68938 ?auto_68944 ) ) ( not ( = ?auto_68939 ?auto_68940 ) ) ( not ( = ?auto_68939 ?auto_68941 ) ) ( not ( = ?auto_68939 ?auto_68942 ) ) ( not ( = ?auto_68939 ?auto_68943 ) ) ( not ( = ?auto_68939 ?auto_68944 ) ) ( not ( = ?auto_68940 ?auto_68941 ) ) ( not ( = ?auto_68940 ?auto_68942 ) ) ( not ( = ?auto_68940 ?auto_68943 ) ) ( not ( = ?auto_68940 ?auto_68944 ) ) ( not ( = ?auto_68941 ?auto_68942 ) ) ( not ( = ?auto_68941 ?auto_68943 ) ) ( not ( = ?auto_68941 ?auto_68944 ) ) ( not ( = ?auto_68942 ?auto_68943 ) ) ( not ( = ?auto_68942 ?auto_68944 ) ) ( not ( = ?auto_68943 ?auto_68944 ) ) ( ON-TABLE ?auto_68944 ) ( ON ?auto_68938 ?auto_68945 ) ( not ( = ?auto_68938 ?auto_68945 ) ) ( not ( = ?auto_68939 ?auto_68945 ) ) ( not ( = ?auto_68940 ?auto_68945 ) ) ( not ( = ?auto_68941 ?auto_68945 ) ) ( not ( = ?auto_68942 ?auto_68945 ) ) ( not ( = ?auto_68943 ?auto_68945 ) ) ( not ( = ?auto_68944 ?auto_68945 ) ) ( ON ?auto_68939 ?auto_68938 ) ( ON-TABLE ?auto_68945 ) ( ON ?auto_68940 ?auto_68939 ) ( ON ?auto_68941 ?auto_68940 ) ( ON ?auto_68942 ?auto_68941 ) ( CLEAR ?auto_68944 ) ( ON ?auto_68943 ?auto_68942 ) ( CLEAR ?auto_68943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68945 ?auto_68938 ?auto_68939 ?auto_68940 ?auto_68941 ?auto_68942 )
      ( MAKE-7PILE ?auto_68938 ?auto_68939 ?auto_68940 ?auto_68941 ?auto_68942 ?auto_68943 ?auto_68944 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68946 - BLOCK
      ?auto_68947 - BLOCK
      ?auto_68948 - BLOCK
      ?auto_68949 - BLOCK
      ?auto_68950 - BLOCK
      ?auto_68951 - BLOCK
      ?auto_68952 - BLOCK
    )
    :vars
    (
      ?auto_68953 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68946 ?auto_68947 ) ) ( not ( = ?auto_68946 ?auto_68948 ) ) ( not ( = ?auto_68946 ?auto_68949 ) ) ( not ( = ?auto_68946 ?auto_68950 ) ) ( not ( = ?auto_68946 ?auto_68951 ) ) ( not ( = ?auto_68946 ?auto_68952 ) ) ( not ( = ?auto_68947 ?auto_68948 ) ) ( not ( = ?auto_68947 ?auto_68949 ) ) ( not ( = ?auto_68947 ?auto_68950 ) ) ( not ( = ?auto_68947 ?auto_68951 ) ) ( not ( = ?auto_68947 ?auto_68952 ) ) ( not ( = ?auto_68948 ?auto_68949 ) ) ( not ( = ?auto_68948 ?auto_68950 ) ) ( not ( = ?auto_68948 ?auto_68951 ) ) ( not ( = ?auto_68948 ?auto_68952 ) ) ( not ( = ?auto_68949 ?auto_68950 ) ) ( not ( = ?auto_68949 ?auto_68951 ) ) ( not ( = ?auto_68949 ?auto_68952 ) ) ( not ( = ?auto_68950 ?auto_68951 ) ) ( not ( = ?auto_68950 ?auto_68952 ) ) ( not ( = ?auto_68951 ?auto_68952 ) ) ( ON ?auto_68946 ?auto_68953 ) ( not ( = ?auto_68946 ?auto_68953 ) ) ( not ( = ?auto_68947 ?auto_68953 ) ) ( not ( = ?auto_68948 ?auto_68953 ) ) ( not ( = ?auto_68949 ?auto_68953 ) ) ( not ( = ?auto_68950 ?auto_68953 ) ) ( not ( = ?auto_68951 ?auto_68953 ) ) ( not ( = ?auto_68952 ?auto_68953 ) ) ( ON ?auto_68947 ?auto_68946 ) ( ON-TABLE ?auto_68953 ) ( ON ?auto_68948 ?auto_68947 ) ( ON ?auto_68949 ?auto_68948 ) ( ON ?auto_68950 ?auto_68949 ) ( ON ?auto_68951 ?auto_68950 ) ( CLEAR ?auto_68951 ) ( HOLDING ?auto_68952 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68952 )
      ( MAKE-7PILE ?auto_68946 ?auto_68947 ?auto_68948 ?auto_68949 ?auto_68950 ?auto_68951 ?auto_68952 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68954 - BLOCK
      ?auto_68955 - BLOCK
      ?auto_68956 - BLOCK
      ?auto_68957 - BLOCK
      ?auto_68958 - BLOCK
      ?auto_68959 - BLOCK
      ?auto_68960 - BLOCK
    )
    :vars
    (
      ?auto_68961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68954 ?auto_68955 ) ) ( not ( = ?auto_68954 ?auto_68956 ) ) ( not ( = ?auto_68954 ?auto_68957 ) ) ( not ( = ?auto_68954 ?auto_68958 ) ) ( not ( = ?auto_68954 ?auto_68959 ) ) ( not ( = ?auto_68954 ?auto_68960 ) ) ( not ( = ?auto_68955 ?auto_68956 ) ) ( not ( = ?auto_68955 ?auto_68957 ) ) ( not ( = ?auto_68955 ?auto_68958 ) ) ( not ( = ?auto_68955 ?auto_68959 ) ) ( not ( = ?auto_68955 ?auto_68960 ) ) ( not ( = ?auto_68956 ?auto_68957 ) ) ( not ( = ?auto_68956 ?auto_68958 ) ) ( not ( = ?auto_68956 ?auto_68959 ) ) ( not ( = ?auto_68956 ?auto_68960 ) ) ( not ( = ?auto_68957 ?auto_68958 ) ) ( not ( = ?auto_68957 ?auto_68959 ) ) ( not ( = ?auto_68957 ?auto_68960 ) ) ( not ( = ?auto_68958 ?auto_68959 ) ) ( not ( = ?auto_68958 ?auto_68960 ) ) ( not ( = ?auto_68959 ?auto_68960 ) ) ( ON ?auto_68954 ?auto_68961 ) ( not ( = ?auto_68954 ?auto_68961 ) ) ( not ( = ?auto_68955 ?auto_68961 ) ) ( not ( = ?auto_68956 ?auto_68961 ) ) ( not ( = ?auto_68957 ?auto_68961 ) ) ( not ( = ?auto_68958 ?auto_68961 ) ) ( not ( = ?auto_68959 ?auto_68961 ) ) ( not ( = ?auto_68960 ?auto_68961 ) ) ( ON ?auto_68955 ?auto_68954 ) ( ON-TABLE ?auto_68961 ) ( ON ?auto_68956 ?auto_68955 ) ( ON ?auto_68957 ?auto_68956 ) ( ON ?auto_68958 ?auto_68957 ) ( ON ?auto_68959 ?auto_68958 ) ( ON ?auto_68960 ?auto_68959 ) ( CLEAR ?auto_68960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_68961 ?auto_68954 ?auto_68955 ?auto_68956 ?auto_68957 ?auto_68958 ?auto_68959 )
      ( MAKE-7PILE ?auto_68954 ?auto_68955 ?auto_68956 ?auto_68957 ?auto_68958 ?auto_68959 ?auto_68960 ) )
  )

)

