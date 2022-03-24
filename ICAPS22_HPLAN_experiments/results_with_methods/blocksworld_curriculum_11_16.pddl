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
      ?auto_141429 - BLOCK
    )
    :vars
    (
      ?auto_141430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141429 ?auto_141430 ) ( CLEAR ?auto_141429 ) ( HAND-EMPTY ) ( not ( = ?auto_141429 ?auto_141430 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141429 ?auto_141430 )
      ( !PUTDOWN ?auto_141429 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_141432 - BLOCK
    )
    :vars
    (
      ?auto_141433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141432 ?auto_141433 ) ( CLEAR ?auto_141432 ) ( HAND-EMPTY ) ( not ( = ?auto_141432 ?auto_141433 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141432 ?auto_141433 )
      ( !PUTDOWN ?auto_141432 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141436 - BLOCK
      ?auto_141437 - BLOCK
    )
    :vars
    (
      ?auto_141438 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141436 ) ( ON ?auto_141437 ?auto_141438 ) ( CLEAR ?auto_141437 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141436 ) ( not ( = ?auto_141436 ?auto_141437 ) ) ( not ( = ?auto_141436 ?auto_141438 ) ) ( not ( = ?auto_141437 ?auto_141438 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141437 ?auto_141438 )
      ( !STACK ?auto_141437 ?auto_141436 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141441 - BLOCK
      ?auto_141442 - BLOCK
    )
    :vars
    (
      ?auto_141443 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141441 ) ( ON ?auto_141442 ?auto_141443 ) ( CLEAR ?auto_141442 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141441 ) ( not ( = ?auto_141441 ?auto_141442 ) ) ( not ( = ?auto_141441 ?auto_141443 ) ) ( not ( = ?auto_141442 ?auto_141443 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141442 ?auto_141443 )
      ( !STACK ?auto_141442 ?auto_141441 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141446 - BLOCK
      ?auto_141447 - BLOCK
    )
    :vars
    (
      ?auto_141448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141447 ?auto_141448 ) ( not ( = ?auto_141446 ?auto_141447 ) ) ( not ( = ?auto_141446 ?auto_141448 ) ) ( not ( = ?auto_141447 ?auto_141448 ) ) ( ON ?auto_141446 ?auto_141447 ) ( CLEAR ?auto_141446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141446 )
      ( MAKE-2PILE ?auto_141446 ?auto_141447 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141451 - BLOCK
      ?auto_141452 - BLOCK
    )
    :vars
    (
      ?auto_141453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141452 ?auto_141453 ) ( not ( = ?auto_141451 ?auto_141452 ) ) ( not ( = ?auto_141451 ?auto_141453 ) ) ( not ( = ?auto_141452 ?auto_141453 ) ) ( ON ?auto_141451 ?auto_141452 ) ( CLEAR ?auto_141451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141451 )
      ( MAKE-2PILE ?auto_141451 ?auto_141452 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141457 - BLOCK
      ?auto_141458 - BLOCK
      ?auto_141459 - BLOCK
    )
    :vars
    (
      ?auto_141460 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141458 ) ( ON ?auto_141459 ?auto_141460 ) ( CLEAR ?auto_141459 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141457 ) ( ON ?auto_141458 ?auto_141457 ) ( not ( = ?auto_141457 ?auto_141458 ) ) ( not ( = ?auto_141457 ?auto_141459 ) ) ( not ( = ?auto_141457 ?auto_141460 ) ) ( not ( = ?auto_141458 ?auto_141459 ) ) ( not ( = ?auto_141458 ?auto_141460 ) ) ( not ( = ?auto_141459 ?auto_141460 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141459 ?auto_141460 )
      ( !STACK ?auto_141459 ?auto_141458 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141464 - BLOCK
      ?auto_141465 - BLOCK
      ?auto_141466 - BLOCK
    )
    :vars
    (
      ?auto_141467 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141465 ) ( ON ?auto_141466 ?auto_141467 ) ( CLEAR ?auto_141466 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141464 ) ( ON ?auto_141465 ?auto_141464 ) ( not ( = ?auto_141464 ?auto_141465 ) ) ( not ( = ?auto_141464 ?auto_141466 ) ) ( not ( = ?auto_141464 ?auto_141467 ) ) ( not ( = ?auto_141465 ?auto_141466 ) ) ( not ( = ?auto_141465 ?auto_141467 ) ) ( not ( = ?auto_141466 ?auto_141467 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141466 ?auto_141467 )
      ( !STACK ?auto_141466 ?auto_141465 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141471 - BLOCK
      ?auto_141472 - BLOCK
      ?auto_141473 - BLOCK
    )
    :vars
    (
      ?auto_141474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141473 ?auto_141474 ) ( ON-TABLE ?auto_141471 ) ( not ( = ?auto_141471 ?auto_141472 ) ) ( not ( = ?auto_141471 ?auto_141473 ) ) ( not ( = ?auto_141471 ?auto_141474 ) ) ( not ( = ?auto_141472 ?auto_141473 ) ) ( not ( = ?auto_141472 ?auto_141474 ) ) ( not ( = ?auto_141473 ?auto_141474 ) ) ( CLEAR ?auto_141471 ) ( ON ?auto_141472 ?auto_141473 ) ( CLEAR ?auto_141472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141471 ?auto_141472 )
      ( MAKE-3PILE ?auto_141471 ?auto_141472 ?auto_141473 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141478 - BLOCK
      ?auto_141479 - BLOCK
      ?auto_141480 - BLOCK
    )
    :vars
    (
      ?auto_141481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141480 ?auto_141481 ) ( ON-TABLE ?auto_141478 ) ( not ( = ?auto_141478 ?auto_141479 ) ) ( not ( = ?auto_141478 ?auto_141480 ) ) ( not ( = ?auto_141478 ?auto_141481 ) ) ( not ( = ?auto_141479 ?auto_141480 ) ) ( not ( = ?auto_141479 ?auto_141481 ) ) ( not ( = ?auto_141480 ?auto_141481 ) ) ( CLEAR ?auto_141478 ) ( ON ?auto_141479 ?auto_141480 ) ( CLEAR ?auto_141479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141478 ?auto_141479 )
      ( MAKE-3PILE ?auto_141478 ?auto_141479 ?auto_141480 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141485 - BLOCK
      ?auto_141486 - BLOCK
      ?auto_141487 - BLOCK
    )
    :vars
    (
      ?auto_141488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141487 ?auto_141488 ) ( not ( = ?auto_141485 ?auto_141486 ) ) ( not ( = ?auto_141485 ?auto_141487 ) ) ( not ( = ?auto_141485 ?auto_141488 ) ) ( not ( = ?auto_141486 ?auto_141487 ) ) ( not ( = ?auto_141486 ?auto_141488 ) ) ( not ( = ?auto_141487 ?auto_141488 ) ) ( ON ?auto_141486 ?auto_141487 ) ( ON ?auto_141485 ?auto_141486 ) ( CLEAR ?auto_141485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141485 )
      ( MAKE-3PILE ?auto_141485 ?auto_141486 ?auto_141487 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141492 - BLOCK
      ?auto_141493 - BLOCK
      ?auto_141494 - BLOCK
    )
    :vars
    (
      ?auto_141495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141494 ?auto_141495 ) ( not ( = ?auto_141492 ?auto_141493 ) ) ( not ( = ?auto_141492 ?auto_141494 ) ) ( not ( = ?auto_141492 ?auto_141495 ) ) ( not ( = ?auto_141493 ?auto_141494 ) ) ( not ( = ?auto_141493 ?auto_141495 ) ) ( not ( = ?auto_141494 ?auto_141495 ) ) ( ON ?auto_141493 ?auto_141494 ) ( ON ?auto_141492 ?auto_141493 ) ( CLEAR ?auto_141492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141492 )
      ( MAKE-3PILE ?auto_141492 ?auto_141493 ?auto_141494 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141500 - BLOCK
      ?auto_141501 - BLOCK
      ?auto_141502 - BLOCK
      ?auto_141503 - BLOCK
    )
    :vars
    (
      ?auto_141504 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141502 ) ( ON ?auto_141503 ?auto_141504 ) ( CLEAR ?auto_141503 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141500 ) ( ON ?auto_141501 ?auto_141500 ) ( ON ?auto_141502 ?auto_141501 ) ( not ( = ?auto_141500 ?auto_141501 ) ) ( not ( = ?auto_141500 ?auto_141502 ) ) ( not ( = ?auto_141500 ?auto_141503 ) ) ( not ( = ?auto_141500 ?auto_141504 ) ) ( not ( = ?auto_141501 ?auto_141502 ) ) ( not ( = ?auto_141501 ?auto_141503 ) ) ( not ( = ?auto_141501 ?auto_141504 ) ) ( not ( = ?auto_141502 ?auto_141503 ) ) ( not ( = ?auto_141502 ?auto_141504 ) ) ( not ( = ?auto_141503 ?auto_141504 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141503 ?auto_141504 )
      ( !STACK ?auto_141503 ?auto_141502 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141509 - BLOCK
      ?auto_141510 - BLOCK
      ?auto_141511 - BLOCK
      ?auto_141512 - BLOCK
    )
    :vars
    (
      ?auto_141513 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141511 ) ( ON ?auto_141512 ?auto_141513 ) ( CLEAR ?auto_141512 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141509 ) ( ON ?auto_141510 ?auto_141509 ) ( ON ?auto_141511 ?auto_141510 ) ( not ( = ?auto_141509 ?auto_141510 ) ) ( not ( = ?auto_141509 ?auto_141511 ) ) ( not ( = ?auto_141509 ?auto_141512 ) ) ( not ( = ?auto_141509 ?auto_141513 ) ) ( not ( = ?auto_141510 ?auto_141511 ) ) ( not ( = ?auto_141510 ?auto_141512 ) ) ( not ( = ?auto_141510 ?auto_141513 ) ) ( not ( = ?auto_141511 ?auto_141512 ) ) ( not ( = ?auto_141511 ?auto_141513 ) ) ( not ( = ?auto_141512 ?auto_141513 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141512 ?auto_141513 )
      ( !STACK ?auto_141512 ?auto_141511 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141518 - BLOCK
      ?auto_141519 - BLOCK
      ?auto_141520 - BLOCK
      ?auto_141521 - BLOCK
    )
    :vars
    (
      ?auto_141522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141521 ?auto_141522 ) ( ON-TABLE ?auto_141518 ) ( ON ?auto_141519 ?auto_141518 ) ( not ( = ?auto_141518 ?auto_141519 ) ) ( not ( = ?auto_141518 ?auto_141520 ) ) ( not ( = ?auto_141518 ?auto_141521 ) ) ( not ( = ?auto_141518 ?auto_141522 ) ) ( not ( = ?auto_141519 ?auto_141520 ) ) ( not ( = ?auto_141519 ?auto_141521 ) ) ( not ( = ?auto_141519 ?auto_141522 ) ) ( not ( = ?auto_141520 ?auto_141521 ) ) ( not ( = ?auto_141520 ?auto_141522 ) ) ( not ( = ?auto_141521 ?auto_141522 ) ) ( CLEAR ?auto_141519 ) ( ON ?auto_141520 ?auto_141521 ) ( CLEAR ?auto_141520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141518 ?auto_141519 ?auto_141520 )
      ( MAKE-4PILE ?auto_141518 ?auto_141519 ?auto_141520 ?auto_141521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141527 - BLOCK
      ?auto_141528 - BLOCK
      ?auto_141529 - BLOCK
      ?auto_141530 - BLOCK
    )
    :vars
    (
      ?auto_141531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141530 ?auto_141531 ) ( ON-TABLE ?auto_141527 ) ( ON ?auto_141528 ?auto_141527 ) ( not ( = ?auto_141527 ?auto_141528 ) ) ( not ( = ?auto_141527 ?auto_141529 ) ) ( not ( = ?auto_141527 ?auto_141530 ) ) ( not ( = ?auto_141527 ?auto_141531 ) ) ( not ( = ?auto_141528 ?auto_141529 ) ) ( not ( = ?auto_141528 ?auto_141530 ) ) ( not ( = ?auto_141528 ?auto_141531 ) ) ( not ( = ?auto_141529 ?auto_141530 ) ) ( not ( = ?auto_141529 ?auto_141531 ) ) ( not ( = ?auto_141530 ?auto_141531 ) ) ( CLEAR ?auto_141528 ) ( ON ?auto_141529 ?auto_141530 ) ( CLEAR ?auto_141529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141527 ?auto_141528 ?auto_141529 )
      ( MAKE-4PILE ?auto_141527 ?auto_141528 ?auto_141529 ?auto_141530 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141536 - BLOCK
      ?auto_141537 - BLOCK
      ?auto_141538 - BLOCK
      ?auto_141539 - BLOCK
    )
    :vars
    (
      ?auto_141540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141539 ?auto_141540 ) ( ON-TABLE ?auto_141536 ) ( not ( = ?auto_141536 ?auto_141537 ) ) ( not ( = ?auto_141536 ?auto_141538 ) ) ( not ( = ?auto_141536 ?auto_141539 ) ) ( not ( = ?auto_141536 ?auto_141540 ) ) ( not ( = ?auto_141537 ?auto_141538 ) ) ( not ( = ?auto_141537 ?auto_141539 ) ) ( not ( = ?auto_141537 ?auto_141540 ) ) ( not ( = ?auto_141538 ?auto_141539 ) ) ( not ( = ?auto_141538 ?auto_141540 ) ) ( not ( = ?auto_141539 ?auto_141540 ) ) ( ON ?auto_141538 ?auto_141539 ) ( CLEAR ?auto_141536 ) ( ON ?auto_141537 ?auto_141538 ) ( CLEAR ?auto_141537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141536 ?auto_141537 )
      ( MAKE-4PILE ?auto_141536 ?auto_141537 ?auto_141538 ?auto_141539 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141545 - BLOCK
      ?auto_141546 - BLOCK
      ?auto_141547 - BLOCK
      ?auto_141548 - BLOCK
    )
    :vars
    (
      ?auto_141549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141548 ?auto_141549 ) ( ON-TABLE ?auto_141545 ) ( not ( = ?auto_141545 ?auto_141546 ) ) ( not ( = ?auto_141545 ?auto_141547 ) ) ( not ( = ?auto_141545 ?auto_141548 ) ) ( not ( = ?auto_141545 ?auto_141549 ) ) ( not ( = ?auto_141546 ?auto_141547 ) ) ( not ( = ?auto_141546 ?auto_141548 ) ) ( not ( = ?auto_141546 ?auto_141549 ) ) ( not ( = ?auto_141547 ?auto_141548 ) ) ( not ( = ?auto_141547 ?auto_141549 ) ) ( not ( = ?auto_141548 ?auto_141549 ) ) ( ON ?auto_141547 ?auto_141548 ) ( CLEAR ?auto_141545 ) ( ON ?auto_141546 ?auto_141547 ) ( CLEAR ?auto_141546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141545 ?auto_141546 )
      ( MAKE-4PILE ?auto_141545 ?auto_141546 ?auto_141547 ?auto_141548 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141554 - BLOCK
      ?auto_141555 - BLOCK
      ?auto_141556 - BLOCK
      ?auto_141557 - BLOCK
    )
    :vars
    (
      ?auto_141558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141557 ?auto_141558 ) ( not ( = ?auto_141554 ?auto_141555 ) ) ( not ( = ?auto_141554 ?auto_141556 ) ) ( not ( = ?auto_141554 ?auto_141557 ) ) ( not ( = ?auto_141554 ?auto_141558 ) ) ( not ( = ?auto_141555 ?auto_141556 ) ) ( not ( = ?auto_141555 ?auto_141557 ) ) ( not ( = ?auto_141555 ?auto_141558 ) ) ( not ( = ?auto_141556 ?auto_141557 ) ) ( not ( = ?auto_141556 ?auto_141558 ) ) ( not ( = ?auto_141557 ?auto_141558 ) ) ( ON ?auto_141556 ?auto_141557 ) ( ON ?auto_141555 ?auto_141556 ) ( ON ?auto_141554 ?auto_141555 ) ( CLEAR ?auto_141554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141554 )
      ( MAKE-4PILE ?auto_141554 ?auto_141555 ?auto_141556 ?auto_141557 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141563 - BLOCK
      ?auto_141564 - BLOCK
      ?auto_141565 - BLOCK
      ?auto_141566 - BLOCK
    )
    :vars
    (
      ?auto_141567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141566 ?auto_141567 ) ( not ( = ?auto_141563 ?auto_141564 ) ) ( not ( = ?auto_141563 ?auto_141565 ) ) ( not ( = ?auto_141563 ?auto_141566 ) ) ( not ( = ?auto_141563 ?auto_141567 ) ) ( not ( = ?auto_141564 ?auto_141565 ) ) ( not ( = ?auto_141564 ?auto_141566 ) ) ( not ( = ?auto_141564 ?auto_141567 ) ) ( not ( = ?auto_141565 ?auto_141566 ) ) ( not ( = ?auto_141565 ?auto_141567 ) ) ( not ( = ?auto_141566 ?auto_141567 ) ) ( ON ?auto_141565 ?auto_141566 ) ( ON ?auto_141564 ?auto_141565 ) ( ON ?auto_141563 ?auto_141564 ) ( CLEAR ?auto_141563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141563 )
      ( MAKE-4PILE ?auto_141563 ?auto_141564 ?auto_141565 ?auto_141566 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141573 - BLOCK
      ?auto_141574 - BLOCK
      ?auto_141575 - BLOCK
      ?auto_141576 - BLOCK
      ?auto_141577 - BLOCK
    )
    :vars
    (
      ?auto_141578 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141576 ) ( ON ?auto_141577 ?auto_141578 ) ( CLEAR ?auto_141577 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141573 ) ( ON ?auto_141574 ?auto_141573 ) ( ON ?auto_141575 ?auto_141574 ) ( ON ?auto_141576 ?auto_141575 ) ( not ( = ?auto_141573 ?auto_141574 ) ) ( not ( = ?auto_141573 ?auto_141575 ) ) ( not ( = ?auto_141573 ?auto_141576 ) ) ( not ( = ?auto_141573 ?auto_141577 ) ) ( not ( = ?auto_141573 ?auto_141578 ) ) ( not ( = ?auto_141574 ?auto_141575 ) ) ( not ( = ?auto_141574 ?auto_141576 ) ) ( not ( = ?auto_141574 ?auto_141577 ) ) ( not ( = ?auto_141574 ?auto_141578 ) ) ( not ( = ?auto_141575 ?auto_141576 ) ) ( not ( = ?auto_141575 ?auto_141577 ) ) ( not ( = ?auto_141575 ?auto_141578 ) ) ( not ( = ?auto_141576 ?auto_141577 ) ) ( not ( = ?auto_141576 ?auto_141578 ) ) ( not ( = ?auto_141577 ?auto_141578 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141577 ?auto_141578 )
      ( !STACK ?auto_141577 ?auto_141576 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141584 - BLOCK
      ?auto_141585 - BLOCK
      ?auto_141586 - BLOCK
      ?auto_141587 - BLOCK
      ?auto_141588 - BLOCK
    )
    :vars
    (
      ?auto_141589 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141587 ) ( ON ?auto_141588 ?auto_141589 ) ( CLEAR ?auto_141588 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141584 ) ( ON ?auto_141585 ?auto_141584 ) ( ON ?auto_141586 ?auto_141585 ) ( ON ?auto_141587 ?auto_141586 ) ( not ( = ?auto_141584 ?auto_141585 ) ) ( not ( = ?auto_141584 ?auto_141586 ) ) ( not ( = ?auto_141584 ?auto_141587 ) ) ( not ( = ?auto_141584 ?auto_141588 ) ) ( not ( = ?auto_141584 ?auto_141589 ) ) ( not ( = ?auto_141585 ?auto_141586 ) ) ( not ( = ?auto_141585 ?auto_141587 ) ) ( not ( = ?auto_141585 ?auto_141588 ) ) ( not ( = ?auto_141585 ?auto_141589 ) ) ( not ( = ?auto_141586 ?auto_141587 ) ) ( not ( = ?auto_141586 ?auto_141588 ) ) ( not ( = ?auto_141586 ?auto_141589 ) ) ( not ( = ?auto_141587 ?auto_141588 ) ) ( not ( = ?auto_141587 ?auto_141589 ) ) ( not ( = ?auto_141588 ?auto_141589 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141588 ?auto_141589 )
      ( !STACK ?auto_141588 ?auto_141587 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141595 - BLOCK
      ?auto_141596 - BLOCK
      ?auto_141597 - BLOCK
      ?auto_141598 - BLOCK
      ?auto_141599 - BLOCK
    )
    :vars
    (
      ?auto_141600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141599 ?auto_141600 ) ( ON-TABLE ?auto_141595 ) ( ON ?auto_141596 ?auto_141595 ) ( ON ?auto_141597 ?auto_141596 ) ( not ( = ?auto_141595 ?auto_141596 ) ) ( not ( = ?auto_141595 ?auto_141597 ) ) ( not ( = ?auto_141595 ?auto_141598 ) ) ( not ( = ?auto_141595 ?auto_141599 ) ) ( not ( = ?auto_141595 ?auto_141600 ) ) ( not ( = ?auto_141596 ?auto_141597 ) ) ( not ( = ?auto_141596 ?auto_141598 ) ) ( not ( = ?auto_141596 ?auto_141599 ) ) ( not ( = ?auto_141596 ?auto_141600 ) ) ( not ( = ?auto_141597 ?auto_141598 ) ) ( not ( = ?auto_141597 ?auto_141599 ) ) ( not ( = ?auto_141597 ?auto_141600 ) ) ( not ( = ?auto_141598 ?auto_141599 ) ) ( not ( = ?auto_141598 ?auto_141600 ) ) ( not ( = ?auto_141599 ?auto_141600 ) ) ( CLEAR ?auto_141597 ) ( ON ?auto_141598 ?auto_141599 ) ( CLEAR ?auto_141598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141595 ?auto_141596 ?auto_141597 ?auto_141598 )
      ( MAKE-5PILE ?auto_141595 ?auto_141596 ?auto_141597 ?auto_141598 ?auto_141599 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141606 - BLOCK
      ?auto_141607 - BLOCK
      ?auto_141608 - BLOCK
      ?auto_141609 - BLOCK
      ?auto_141610 - BLOCK
    )
    :vars
    (
      ?auto_141611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141610 ?auto_141611 ) ( ON-TABLE ?auto_141606 ) ( ON ?auto_141607 ?auto_141606 ) ( ON ?auto_141608 ?auto_141607 ) ( not ( = ?auto_141606 ?auto_141607 ) ) ( not ( = ?auto_141606 ?auto_141608 ) ) ( not ( = ?auto_141606 ?auto_141609 ) ) ( not ( = ?auto_141606 ?auto_141610 ) ) ( not ( = ?auto_141606 ?auto_141611 ) ) ( not ( = ?auto_141607 ?auto_141608 ) ) ( not ( = ?auto_141607 ?auto_141609 ) ) ( not ( = ?auto_141607 ?auto_141610 ) ) ( not ( = ?auto_141607 ?auto_141611 ) ) ( not ( = ?auto_141608 ?auto_141609 ) ) ( not ( = ?auto_141608 ?auto_141610 ) ) ( not ( = ?auto_141608 ?auto_141611 ) ) ( not ( = ?auto_141609 ?auto_141610 ) ) ( not ( = ?auto_141609 ?auto_141611 ) ) ( not ( = ?auto_141610 ?auto_141611 ) ) ( CLEAR ?auto_141608 ) ( ON ?auto_141609 ?auto_141610 ) ( CLEAR ?auto_141609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141606 ?auto_141607 ?auto_141608 ?auto_141609 )
      ( MAKE-5PILE ?auto_141606 ?auto_141607 ?auto_141608 ?auto_141609 ?auto_141610 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141617 - BLOCK
      ?auto_141618 - BLOCK
      ?auto_141619 - BLOCK
      ?auto_141620 - BLOCK
      ?auto_141621 - BLOCK
    )
    :vars
    (
      ?auto_141622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141621 ?auto_141622 ) ( ON-TABLE ?auto_141617 ) ( ON ?auto_141618 ?auto_141617 ) ( not ( = ?auto_141617 ?auto_141618 ) ) ( not ( = ?auto_141617 ?auto_141619 ) ) ( not ( = ?auto_141617 ?auto_141620 ) ) ( not ( = ?auto_141617 ?auto_141621 ) ) ( not ( = ?auto_141617 ?auto_141622 ) ) ( not ( = ?auto_141618 ?auto_141619 ) ) ( not ( = ?auto_141618 ?auto_141620 ) ) ( not ( = ?auto_141618 ?auto_141621 ) ) ( not ( = ?auto_141618 ?auto_141622 ) ) ( not ( = ?auto_141619 ?auto_141620 ) ) ( not ( = ?auto_141619 ?auto_141621 ) ) ( not ( = ?auto_141619 ?auto_141622 ) ) ( not ( = ?auto_141620 ?auto_141621 ) ) ( not ( = ?auto_141620 ?auto_141622 ) ) ( not ( = ?auto_141621 ?auto_141622 ) ) ( ON ?auto_141620 ?auto_141621 ) ( CLEAR ?auto_141618 ) ( ON ?auto_141619 ?auto_141620 ) ( CLEAR ?auto_141619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141617 ?auto_141618 ?auto_141619 )
      ( MAKE-5PILE ?auto_141617 ?auto_141618 ?auto_141619 ?auto_141620 ?auto_141621 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141628 - BLOCK
      ?auto_141629 - BLOCK
      ?auto_141630 - BLOCK
      ?auto_141631 - BLOCK
      ?auto_141632 - BLOCK
    )
    :vars
    (
      ?auto_141633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141632 ?auto_141633 ) ( ON-TABLE ?auto_141628 ) ( ON ?auto_141629 ?auto_141628 ) ( not ( = ?auto_141628 ?auto_141629 ) ) ( not ( = ?auto_141628 ?auto_141630 ) ) ( not ( = ?auto_141628 ?auto_141631 ) ) ( not ( = ?auto_141628 ?auto_141632 ) ) ( not ( = ?auto_141628 ?auto_141633 ) ) ( not ( = ?auto_141629 ?auto_141630 ) ) ( not ( = ?auto_141629 ?auto_141631 ) ) ( not ( = ?auto_141629 ?auto_141632 ) ) ( not ( = ?auto_141629 ?auto_141633 ) ) ( not ( = ?auto_141630 ?auto_141631 ) ) ( not ( = ?auto_141630 ?auto_141632 ) ) ( not ( = ?auto_141630 ?auto_141633 ) ) ( not ( = ?auto_141631 ?auto_141632 ) ) ( not ( = ?auto_141631 ?auto_141633 ) ) ( not ( = ?auto_141632 ?auto_141633 ) ) ( ON ?auto_141631 ?auto_141632 ) ( CLEAR ?auto_141629 ) ( ON ?auto_141630 ?auto_141631 ) ( CLEAR ?auto_141630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141628 ?auto_141629 ?auto_141630 )
      ( MAKE-5PILE ?auto_141628 ?auto_141629 ?auto_141630 ?auto_141631 ?auto_141632 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141639 - BLOCK
      ?auto_141640 - BLOCK
      ?auto_141641 - BLOCK
      ?auto_141642 - BLOCK
      ?auto_141643 - BLOCK
    )
    :vars
    (
      ?auto_141644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141643 ?auto_141644 ) ( ON-TABLE ?auto_141639 ) ( not ( = ?auto_141639 ?auto_141640 ) ) ( not ( = ?auto_141639 ?auto_141641 ) ) ( not ( = ?auto_141639 ?auto_141642 ) ) ( not ( = ?auto_141639 ?auto_141643 ) ) ( not ( = ?auto_141639 ?auto_141644 ) ) ( not ( = ?auto_141640 ?auto_141641 ) ) ( not ( = ?auto_141640 ?auto_141642 ) ) ( not ( = ?auto_141640 ?auto_141643 ) ) ( not ( = ?auto_141640 ?auto_141644 ) ) ( not ( = ?auto_141641 ?auto_141642 ) ) ( not ( = ?auto_141641 ?auto_141643 ) ) ( not ( = ?auto_141641 ?auto_141644 ) ) ( not ( = ?auto_141642 ?auto_141643 ) ) ( not ( = ?auto_141642 ?auto_141644 ) ) ( not ( = ?auto_141643 ?auto_141644 ) ) ( ON ?auto_141642 ?auto_141643 ) ( ON ?auto_141641 ?auto_141642 ) ( CLEAR ?auto_141639 ) ( ON ?auto_141640 ?auto_141641 ) ( CLEAR ?auto_141640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141639 ?auto_141640 )
      ( MAKE-5PILE ?auto_141639 ?auto_141640 ?auto_141641 ?auto_141642 ?auto_141643 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141650 - BLOCK
      ?auto_141651 - BLOCK
      ?auto_141652 - BLOCK
      ?auto_141653 - BLOCK
      ?auto_141654 - BLOCK
    )
    :vars
    (
      ?auto_141655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141654 ?auto_141655 ) ( ON-TABLE ?auto_141650 ) ( not ( = ?auto_141650 ?auto_141651 ) ) ( not ( = ?auto_141650 ?auto_141652 ) ) ( not ( = ?auto_141650 ?auto_141653 ) ) ( not ( = ?auto_141650 ?auto_141654 ) ) ( not ( = ?auto_141650 ?auto_141655 ) ) ( not ( = ?auto_141651 ?auto_141652 ) ) ( not ( = ?auto_141651 ?auto_141653 ) ) ( not ( = ?auto_141651 ?auto_141654 ) ) ( not ( = ?auto_141651 ?auto_141655 ) ) ( not ( = ?auto_141652 ?auto_141653 ) ) ( not ( = ?auto_141652 ?auto_141654 ) ) ( not ( = ?auto_141652 ?auto_141655 ) ) ( not ( = ?auto_141653 ?auto_141654 ) ) ( not ( = ?auto_141653 ?auto_141655 ) ) ( not ( = ?auto_141654 ?auto_141655 ) ) ( ON ?auto_141653 ?auto_141654 ) ( ON ?auto_141652 ?auto_141653 ) ( CLEAR ?auto_141650 ) ( ON ?auto_141651 ?auto_141652 ) ( CLEAR ?auto_141651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141650 ?auto_141651 )
      ( MAKE-5PILE ?auto_141650 ?auto_141651 ?auto_141652 ?auto_141653 ?auto_141654 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141661 - BLOCK
      ?auto_141662 - BLOCK
      ?auto_141663 - BLOCK
      ?auto_141664 - BLOCK
      ?auto_141665 - BLOCK
    )
    :vars
    (
      ?auto_141666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141665 ?auto_141666 ) ( not ( = ?auto_141661 ?auto_141662 ) ) ( not ( = ?auto_141661 ?auto_141663 ) ) ( not ( = ?auto_141661 ?auto_141664 ) ) ( not ( = ?auto_141661 ?auto_141665 ) ) ( not ( = ?auto_141661 ?auto_141666 ) ) ( not ( = ?auto_141662 ?auto_141663 ) ) ( not ( = ?auto_141662 ?auto_141664 ) ) ( not ( = ?auto_141662 ?auto_141665 ) ) ( not ( = ?auto_141662 ?auto_141666 ) ) ( not ( = ?auto_141663 ?auto_141664 ) ) ( not ( = ?auto_141663 ?auto_141665 ) ) ( not ( = ?auto_141663 ?auto_141666 ) ) ( not ( = ?auto_141664 ?auto_141665 ) ) ( not ( = ?auto_141664 ?auto_141666 ) ) ( not ( = ?auto_141665 ?auto_141666 ) ) ( ON ?auto_141664 ?auto_141665 ) ( ON ?auto_141663 ?auto_141664 ) ( ON ?auto_141662 ?auto_141663 ) ( ON ?auto_141661 ?auto_141662 ) ( CLEAR ?auto_141661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141661 )
      ( MAKE-5PILE ?auto_141661 ?auto_141662 ?auto_141663 ?auto_141664 ?auto_141665 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141672 - BLOCK
      ?auto_141673 - BLOCK
      ?auto_141674 - BLOCK
      ?auto_141675 - BLOCK
      ?auto_141676 - BLOCK
    )
    :vars
    (
      ?auto_141677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141676 ?auto_141677 ) ( not ( = ?auto_141672 ?auto_141673 ) ) ( not ( = ?auto_141672 ?auto_141674 ) ) ( not ( = ?auto_141672 ?auto_141675 ) ) ( not ( = ?auto_141672 ?auto_141676 ) ) ( not ( = ?auto_141672 ?auto_141677 ) ) ( not ( = ?auto_141673 ?auto_141674 ) ) ( not ( = ?auto_141673 ?auto_141675 ) ) ( not ( = ?auto_141673 ?auto_141676 ) ) ( not ( = ?auto_141673 ?auto_141677 ) ) ( not ( = ?auto_141674 ?auto_141675 ) ) ( not ( = ?auto_141674 ?auto_141676 ) ) ( not ( = ?auto_141674 ?auto_141677 ) ) ( not ( = ?auto_141675 ?auto_141676 ) ) ( not ( = ?auto_141675 ?auto_141677 ) ) ( not ( = ?auto_141676 ?auto_141677 ) ) ( ON ?auto_141675 ?auto_141676 ) ( ON ?auto_141674 ?auto_141675 ) ( ON ?auto_141673 ?auto_141674 ) ( ON ?auto_141672 ?auto_141673 ) ( CLEAR ?auto_141672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141672 )
      ( MAKE-5PILE ?auto_141672 ?auto_141673 ?auto_141674 ?auto_141675 ?auto_141676 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141684 - BLOCK
      ?auto_141685 - BLOCK
      ?auto_141686 - BLOCK
      ?auto_141687 - BLOCK
      ?auto_141688 - BLOCK
      ?auto_141689 - BLOCK
    )
    :vars
    (
      ?auto_141690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141688 ) ( ON ?auto_141689 ?auto_141690 ) ( CLEAR ?auto_141689 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141684 ) ( ON ?auto_141685 ?auto_141684 ) ( ON ?auto_141686 ?auto_141685 ) ( ON ?auto_141687 ?auto_141686 ) ( ON ?auto_141688 ?auto_141687 ) ( not ( = ?auto_141684 ?auto_141685 ) ) ( not ( = ?auto_141684 ?auto_141686 ) ) ( not ( = ?auto_141684 ?auto_141687 ) ) ( not ( = ?auto_141684 ?auto_141688 ) ) ( not ( = ?auto_141684 ?auto_141689 ) ) ( not ( = ?auto_141684 ?auto_141690 ) ) ( not ( = ?auto_141685 ?auto_141686 ) ) ( not ( = ?auto_141685 ?auto_141687 ) ) ( not ( = ?auto_141685 ?auto_141688 ) ) ( not ( = ?auto_141685 ?auto_141689 ) ) ( not ( = ?auto_141685 ?auto_141690 ) ) ( not ( = ?auto_141686 ?auto_141687 ) ) ( not ( = ?auto_141686 ?auto_141688 ) ) ( not ( = ?auto_141686 ?auto_141689 ) ) ( not ( = ?auto_141686 ?auto_141690 ) ) ( not ( = ?auto_141687 ?auto_141688 ) ) ( not ( = ?auto_141687 ?auto_141689 ) ) ( not ( = ?auto_141687 ?auto_141690 ) ) ( not ( = ?auto_141688 ?auto_141689 ) ) ( not ( = ?auto_141688 ?auto_141690 ) ) ( not ( = ?auto_141689 ?auto_141690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141689 ?auto_141690 )
      ( !STACK ?auto_141689 ?auto_141688 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141697 - BLOCK
      ?auto_141698 - BLOCK
      ?auto_141699 - BLOCK
      ?auto_141700 - BLOCK
      ?auto_141701 - BLOCK
      ?auto_141702 - BLOCK
    )
    :vars
    (
      ?auto_141703 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141701 ) ( ON ?auto_141702 ?auto_141703 ) ( CLEAR ?auto_141702 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141697 ) ( ON ?auto_141698 ?auto_141697 ) ( ON ?auto_141699 ?auto_141698 ) ( ON ?auto_141700 ?auto_141699 ) ( ON ?auto_141701 ?auto_141700 ) ( not ( = ?auto_141697 ?auto_141698 ) ) ( not ( = ?auto_141697 ?auto_141699 ) ) ( not ( = ?auto_141697 ?auto_141700 ) ) ( not ( = ?auto_141697 ?auto_141701 ) ) ( not ( = ?auto_141697 ?auto_141702 ) ) ( not ( = ?auto_141697 ?auto_141703 ) ) ( not ( = ?auto_141698 ?auto_141699 ) ) ( not ( = ?auto_141698 ?auto_141700 ) ) ( not ( = ?auto_141698 ?auto_141701 ) ) ( not ( = ?auto_141698 ?auto_141702 ) ) ( not ( = ?auto_141698 ?auto_141703 ) ) ( not ( = ?auto_141699 ?auto_141700 ) ) ( not ( = ?auto_141699 ?auto_141701 ) ) ( not ( = ?auto_141699 ?auto_141702 ) ) ( not ( = ?auto_141699 ?auto_141703 ) ) ( not ( = ?auto_141700 ?auto_141701 ) ) ( not ( = ?auto_141700 ?auto_141702 ) ) ( not ( = ?auto_141700 ?auto_141703 ) ) ( not ( = ?auto_141701 ?auto_141702 ) ) ( not ( = ?auto_141701 ?auto_141703 ) ) ( not ( = ?auto_141702 ?auto_141703 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141702 ?auto_141703 )
      ( !STACK ?auto_141702 ?auto_141701 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141710 - BLOCK
      ?auto_141711 - BLOCK
      ?auto_141712 - BLOCK
      ?auto_141713 - BLOCK
      ?auto_141714 - BLOCK
      ?auto_141715 - BLOCK
    )
    :vars
    (
      ?auto_141716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141715 ?auto_141716 ) ( ON-TABLE ?auto_141710 ) ( ON ?auto_141711 ?auto_141710 ) ( ON ?auto_141712 ?auto_141711 ) ( ON ?auto_141713 ?auto_141712 ) ( not ( = ?auto_141710 ?auto_141711 ) ) ( not ( = ?auto_141710 ?auto_141712 ) ) ( not ( = ?auto_141710 ?auto_141713 ) ) ( not ( = ?auto_141710 ?auto_141714 ) ) ( not ( = ?auto_141710 ?auto_141715 ) ) ( not ( = ?auto_141710 ?auto_141716 ) ) ( not ( = ?auto_141711 ?auto_141712 ) ) ( not ( = ?auto_141711 ?auto_141713 ) ) ( not ( = ?auto_141711 ?auto_141714 ) ) ( not ( = ?auto_141711 ?auto_141715 ) ) ( not ( = ?auto_141711 ?auto_141716 ) ) ( not ( = ?auto_141712 ?auto_141713 ) ) ( not ( = ?auto_141712 ?auto_141714 ) ) ( not ( = ?auto_141712 ?auto_141715 ) ) ( not ( = ?auto_141712 ?auto_141716 ) ) ( not ( = ?auto_141713 ?auto_141714 ) ) ( not ( = ?auto_141713 ?auto_141715 ) ) ( not ( = ?auto_141713 ?auto_141716 ) ) ( not ( = ?auto_141714 ?auto_141715 ) ) ( not ( = ?auto_141714 ?auto_141716 ) ) ( not ( = ?auto_141715 ?auto_141716 ) ) ( CLEAR ?auto_141713 ) ( ON ?auto_141714 ?auto_141715 ) ( CLEAR ?auto_141714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141710 ?auto_141711 ?auto_141712 ?auto_141713 ?auto_141714 )
      ( MAKE-6PILE ?auto_141710 ?auto_141711 ?auto_141712 ?auto_141713 ?auto_141714 ?auto_141715 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141723 - BLOCK
      ?auto_141724 - BLOCK
      ?auto_141725 - BLOCK
      ?auto_141726 - BLOCK
      ?auto_141727 - BLOCK
      ?auto_141728 - BLOCK
    )
    :vars
    (
      ?auto_141729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141728 ?auto_141729 ) ( ON-TABLE ?auto_141723 ) ( ON ?auto_141724 ?auto_141723 ) ( ON ?auto_141725 ?auto_141724 ) ( ON ?auto_141726 ?auto_141725 ) ( not ( = ?auto_141723 ?auto_141724 ) ) ( not ( = ?auto_141723 ?auto_141725 ) ) ( not ( = ?auto_141723 ?auto_141726 ) ) ( not ( = ?auto_141723 ?auto_141727 ) ) ( not ( = ?auto_141723 ?auto_141728 ) ) ( not ( = ?auto_141723 ?auto_141729 ) ) ( not ( = ?auto_141724 ?auto_141725 ) ) ( not ( = ?auto_141724 ?auto_141726 ) ) ( not ( = ?auto_141724 ?auto_141727 ) ) ( not ( = ?auto_141724 ?auto_141728 ) ) ( not ( = ?auto_141724 ?auto_141729 ) ) ( not ( = ?auto_141725 ?auto_141726 ) ) ( not ( = ?auto_141725 ?auto_141727 ) ) ( not ( = ?auto_141725 ?auto_141728 ) ) ( not ( = ?auto_141725 ?auto_141729 ) ) ( not ( = ?auto_141726 ?auto_141727 ) ) ( not ( = ?auto_141726 ?auto_141728 ) ) ( not ( = ?auto_141726 ?auto_141729 ) ) ( not ( = ?auto_141727 ?auto_141728 ) ) ( not ( = ?auto_141727 ?auto_141729 ) ) ( not ( = ?auto_141728 ?auto_141729 ) ) ( CLEAR ?auto_141726 ) ( ON ?auto_141727 ?auto_141728 ) ( CLEAR ?auto_141727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141723 ?auto_141724 ?auto_141725 ?auto_141726 ?auto_141727 )
      ( MAKE-6PILE ?auto_141723 ?auto_141724 ?auto_141725 ?auto_141726 ?auto_141727 ?auto_141728 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141736 - BLOCK
      ?auto_141737 - BLOCK
      ?auto_141738 - BLOCK
      ?auto_141739 - BLOCK
      ?auto_141740 - BLOCK
      ?auto_141741 - BLOCK
    )
    :vars
    (
      ?auto_141742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141741 ?auto_141742 ) ( ON-TABLE ?auto_141736 ) ( ON ?auto_141737 ?auto_141736 ) ( ON ?auto_141738 ?auto_141737 ) ( not ( = ?auto_141736 ?auto_141737 ) ) ( not ( = ?auto_141736 ?auto_141738 ) ) ( not ( = ?auto_141736 ?auto_141739 ) ) ( not ( = ?auto_141736 ?auto_141740 ) ) ( not ( = ?auto_141736 ?auto_141741 ) ) ( not ( = ?auto_141736 ?auto_141742 ) ) ( not ( = ?auto_141737 ?auto_141738 ) ) ( not ( = ?auto_141737 ?auto_141739 ) ) ( not ( = ?auto_141737 ?auto_141740 ) ) ( not ( = ?auto_141737 ?auto_141741 ) ) ( not ( = ?auto_141737 ?auto_141742 ) ) ( not ( = ?auto_141738 ?auto_141739 ) ) ( not ( = ?auto_141738 ?auto_141740 ) ) ( not ( = ?auto_141738 ?auto_141741 ) ) ( not ( = ?auto_141738 ?auto_141742 ) ) ( not ( = ?auto_141739 ?auto_141740 ) ) ( not ( = ?auto_141739 ?auto_141741 ) ) ( not ( = ?auto_141739 ?auto_141742 ) ) ( not ( = ?auto_141740 ?auto_141741 ) ) ( not ( = ?auto_141740 ?auto_141742 ) ) ( not ( = ?auto_141741 ?auto_141742 ) ) ( ON ?auto_141740 ?auto_141741 ) ( CLEAR ?auto_141738 ) ( ON ?auto_141739 ?auto_141740 ) ( CLEAR ?auto_141739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141736 ?auto_141737 ?auto_141738 ?auto_141739 )
      ( MAKE-6PILE ?auto_141736 ?auto_141737 ?auto_141738 ?auto_141739 ?auto_141740 ?auto_141741 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141749 - BLOCK
      ?auto_141750 - BLOCK
      ?auto_141751 - BLOCK
      ?auto_141752 - BLOCK
      ?auto_141753 - BLOCK
      ?auto_141754 - BLOCK
    )
    :vars
    (
      ?auto_141755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141754 ?auto_141755 ) ( ON-TABLE ?auto_141749 ) ( ON ?auto_141750 ?auto_141749 ) ( ON ?auto_141751 ?auto_141750 ) ( not ( = ?auto_141749 ?auto_141750 ) ) ( not ( = ?auto_141749 ?auto_141751 ) ) ( not ( = ?auto_141749 ?auto_141752 ) ) ( not ( = ?auto_141749 ?auto_141753 ) ) ( not ( = ?auto_141749 ?auto_141754 ) ) ( not ( = ?auto_141749 ?auto_141755 ) ) ( not ( = ?auto_141750 ?auto_141751 ) ) ( not ( = ?auto_141750 ?auto_141752 ) ) ( not ( = ?auto_141750 ?auto_141753 ) ) ( not ( = ?auto_141750 ?auto_141754 ) ) ( not ( = ?auto_141750 ?auto_141755 ) ) ( not ( = ?auto_141751 ?auto_141752 ) ) ( not ( = ?auto_141751 ?auto_141753 ) ) ( not ( = ?auto_141751 ?auto_141754 ) ) ( not ( = ?auto_141751 ?auto_141755 ) ) ( not ( = ?auto_141752 ?auto_141753 ) ) ( not ( = ?auto_141752 ?auto_141754 ) ) ( not ( = ?auto_141752 ?auto_141755 ) ) ( not ( = ?auto_141753 ?auto_141754 ) ) ( not ( = ?auto_141753 ?auto_141755 ) ) ( not ( = ?auto_141754 ?auto_141755 ) ) ( ON ?auto_141753 ?auto_141754 ) ( CLEAR ?auto_141751 ) ( ON ?auto_141752 ?auto_141753 ) ( CLEAR ?auto_141752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141749 ?auto_141750 ?auto_141751 ?auto_141752 )
      ( MAKE-6PILE ?auto_141749 ?auto_141750 ?auto_141751 ?auto_141752 ?auto_141753 ?auto_141754 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141762 - BLOCK
      ?auto_141763 - BLOCK
      ?auto_141764 - BLOCK
      ?auto_141765 - BLOCK
      ?auto_141766 - BLOCK
      ?auto_141767 - BLOCK
    )
    :vars
    (
      ?auto_141768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141767 ?auto_141768 ) ( ON-TABLE ?auto_141762 ) ( ON ?auto_141763 ?auto_141762 ) ( not ( = ?auto_141762 ?auto_141763 ) ) ( not ( = ?auto_141762 ?auto_141764 ) ) ( not ( = ?auto_141762 ?auto_141765 ) ) ( not ( = ?auto_141762 ?auto_141766 ) ) ( not ( = ?auto_141762 ?auto_141767 ) ) ( not ( = ?auto_141762 ?auto_141768 ) ) ( not ( = ?auto_141763 ?auto_141764 ) ) ( not ( = ?auto_141763 ?auto_141765 ) ) ( not ( = ?auto_141763 ?auto_141766 ) ) ( not ( = ?auto_141763 ?auto_141767 ) ) ( not ( = ?auto_141763 ?auto_141768 ) ) ( not ( = ?auto_141764 ?auto_141765 ) ) ( not ( = ?auto_141764 ?auto_141766 ) ) ( not ( = ?auto_141764 ?auto_141767 ) ) ( not ( = ?auto_141764 ?auto_141768 ) ) ( not ( = ?auto_141765 ?auto_141766 ) ) ( not ( = ?auto_141765 ?auto_141767 ) ) ( not ( = ?auto_141765 ?auto_141768 ) ) ( not ( = ?auto_141766 ?auto_141767 ) ) ( not ( = ?auto_141766 ?auto_141768 ) ) ( not ( = ?auto_141767 ?auto_141768 ) ) ( ON ?auto_141766 ?auto_141767 ) ( ON ?auto_141765 ?auto_141766 ) ( CLEAR ?auto_141763 ) ( ON ?auto_141764 ?auto_141765 ) ( CLEAR ?auto_141764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141762 ?auto_141763 ?auto_141764 )
      ( MAKE-6PILE ?auto_141762 ?auto_141763 ?auto_141764 ?auto_141765 ?auto_141766 ?auto_141767 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141775 - BLOCK
      ?auto_141776 - BLOCK
      ?auto_141777 - BLOCK
      ?auto_141778 - BLOCK
      ?auto_141779 - BLOCK
      ?auto_141780 - BLOCK
    )
    :vars
    (
      ?auto_141781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141780 ?auto_141781 ) ( ON-TABLE ?auto_141775 ) ( ON ?auto_141776 ?auto_141775 ) ( not ( = ?auto_141775 ?auto_141776 ) ) ( not ( = ?auto_141775 ?auto_141777 ) ) ( not ( = ?auto_141775 ?auto_141778 ) ) ( not ( = ?auto_141775 ?auto_141779 ) ) ( not ( = ?auto_141775 ?auto_141780 ) ) ( not ( = ?auto_141775 ?auto_141781 ) ) ( not ( = ?auto_141776 ?auto_141777 ) ) ( not ( = ?auto_141776 ?auto_141778 ) ) ( not ( = ?auto_141776 ?auto_141779 ) ) ( not ( = ?auto_141776 ?auto_141780 ) ) ( not ( = ?auto_141776 ?auto_141781 ) ) ( not ( = ?auto_141777 ?auto_141778 ) ) ( not ( = ?auto_141777 ?auto_141779 ) ) ( not ( = ?auto_141777 ?auto_141780 ) ) ( not ( = ?auto_141777 ?auto_141781 ) ) ( not ( = ?auto_141778 ?auto_141779 ) ) ( not ( = ?auto_141778 ?auto_141780 ) ) ( not ( = ?auto_141778 ?auto_141781 ) ) ( not ( = ?auto_141779 ?auto_141780 ) ) ( not ( = ?auto_141779 ?auto_141781 ) ) ( not ( = ?auto_141780 ?auto_141781 ) ) ( ON ?auto_141779 ?auto_141780 ) ( ON ?auto_141778 ?auto_141779 ) ( CLEAR ?auto_141776 ) ( ON ?auto_141777 ?auto_141778 ) ( CLEAR ?auto_141777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141775 ?auto_141776 ?auto_141777 )
      ( MAKE-6PILE ?auto_141775 ?auto_141776 ?auto_141777 ?auto_141778 ?auto_141779 ?auto_141780 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141788 - BLOCK
      ?auto_141789 - BLOCK
      ?auto_141790 - BLOCK
      ?auto_141791 - BLOCK
      ?auto_141792 - BLOCK
      ?auto_141793 - BLOCK
    )
    :vars
    (
      ?auto_141794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141793 ?auto_141794 ) ( ON-TABLE ?auto_141788 ) ( not ( = ?auto_141788 ?auto_141789 ) ) ( not ( = ?auto_141788 ?auto_141790 ) ) ( not ( = ?auto_141788 ?auto_141791 ) ) ( not ( = ?auto_141788 ?auto_141792 ) ) ( not ( = ?auto_141788 ?auto_141793 ) ) ( not ( = ?auto_141788 ?auto_141794 ) ) ( not ( = ?auto_141789 ?auto_141790 ) ) ( not ( = ?auto_141789 ?auto_141791 ) ) ( not ( = ?auto_141789 ?auto_141792 ) ) ( not ( = ?auto_141789 ?auto_141793 ) ) ( not ( = ?auto_141789 ?auto_141794 ) ) ( not ( = ?auto_141790 ?auto_141791 ) ) ( not ( = ?auto_141790 ?auto_141792 ) ) ( not ( = ?auto_141790 ?auto_141793 ) ) ( not ( = ?auto_141790 ?auto_141794 ) ) ( not ( = ?auto_141791 ?auto_141792 ) ) ( not ( = ?auto_141791 ?auto_141793 ) ) ( not ( = ?auto_141791 ?auto_141794 ) ) ( not ( = ?auto_141792 ?auto_141793 ) ) ( not ( = ?auto_141792 ?auto_141794 ) ) ( not ( = ?auto_141793 ?auto_141794 ) ) ( ON ?auto_141792 ?auto_141793 ) ( ON ?auto_141791 ?auto_141792 ) ( ON ?auto_141790 ?auto_141791 ) ( CLEAR ?auto_141788 ) ( ON ?auto_141789 ?auto_141790 ) ( CLEAR ?auto_141789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141788 ?auto_141789 )
      ( MAKE-6PILE ?auto_141788 ?auto_141789 ?auto_141790 ?auto_141791 ?auto_141792 ?auto_141793 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141801 - BLOCK
      ?auto_141802 - BLOCK
      ?auto_141803 - BLOCK
      ?auto_141804 - BLOCK
      ?auto_141805 - BLOCK
      ?auto_141806 - BLOCK
    )
    :vars
    (
      ?auto_141807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141806 ?auto_141807 ) ( ON-TABLE ?auto_141801 ) ( not ( = ?auto_141801 ?auto_141802 ) ) ( not ( = ?auto_141801 ?auto_141803 ) ) ( not ( = ?auto_141801 ?auto_141804 ) ) ( not ( = ?auto_141801 ?auto_141805 ) ) ( not ( = ?auto_141801 ?auto_141806 ) ) ( not ( = ?auto_141801 ?auto_141807 ) ) ( not ( = ?auto_141802 ?auto_141803 ) ) ( not ( = ?auto_141802 ?auto_141804 ) ) ( not ( = ?auto_141802 ?auto_141805 ) ) ( not ( = ?auto_141802 ?auto_141806 ) ) ( not ( = ?auto_141802 ?auto_141807 ) ) ( not ( = ?auto_141803 ?auto_141804 ) ) ( not ( = ?auto_141803 ?auto_141805 ) ) ( not ( = ?auto_141803 ?auto_141806 ) ) ( not ( = ?auto_141803 ?auto_141807 ) ) ( not ( = ?auto_141804 ?auto_141805 ) ) ( not ( = ?auto_141804 ?auto_141806 ) ) ( not ( = ?auto_141804 ?auto_141807 ) ) ( not ( = ?auto_141805 ?auto_141806 ) ) ( not ( = ?auto_141805 ?auto_141807 ) ) ( not ( = ?auto_141806 ?auto_141807 ) ) ( ON ?auto_141805 ?auto_141806 ) ( ON ?auto_141804 ?auto_141805 ) ( ON ?auto_141803 ?auto_141804 ) ( CLEAR ?auto_141801 ) ( ON ?auto_141802 ?auto_141803 ) ( CLEAR ?auto_141802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141801 ?auto_141802 )
      ( MAKE-6PILE ?auto_141801 ?auto_141802 ?auto_141803 ?auto_141804 ?auto_141805 ?auto_141806 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141814 - BLOCK
      ?auto_141815 - BLOCK
      ?auto_141816 - BLOCK
      ?auto_141817 - BLOCK
      ?auto_141818 - BLOCK
      ?auto_141819 - BLOCK
    )
    :vars
    (
      ?auto_141820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141819 ?auto_141820 ) ( not ( = ?auto_141814 ?auto_141815 ) ) ( not ( = ?auto_141814 ?auto_141816 ) ) ( not ( = ?auto_141814 ?auto_141817 ) ) ( not ( = ?auto_141814 ?auto_141818 ) ) ( not ( = ?auto_141814 ?auto_141819 ) ) ( not ( = ?auto_141814 ?auto_141820 ) ) ( not ( = ?auto_141815 ?auto_141816 ) ) ( not ( = ?auto_141815 ?auto_141817 ) ) ( not ( = ?auto_141815 ?auto_141818 ) ) ( not ( = ?auto_141815 ?auto_141819 ) ) ( not ( = ?auto_141815 ?auto_141820 ) ) ( not ( = ?auto_141816 ?auto_141817 ) ) ( not ( = ?auto_141816 ?auto_141818 ) ) ( not ( = ?auto_141816 ?auto_141819 ) ) ( not ( = ?auto_141816 ?auto_141820 ) ) ( not ( = ?auto_141817 ?auto_141818 ) ) ( not ( = ?auto_141817 ?auto_141819 ) ) ( not ( = ?auto_141817 ?auto_141820 ) ) ( not ( = ?auto_141818 ?auto_141819 ) ) ( not ( = ?auto_141818 ?auto_141820 ) ) ( not ( = ?auto_141819 ?auto_141820 ) ) ( ON ?auto_141818 ?auto_141819 ) ( ON ?auto_141817 ?auto_141818 ) ( ON ?auto_141816 ?auto_141817 ) ( ON ?auto_141815 ?auto_141816 ) ( ON ?auto_141814 ?auto_141815 ) ( CLEAR ?auto_141814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141814 )
      ( MAKE-6PILE ?auto_141814 ?auto_141815 ?auto_141816 ?auto_141817 ?auto_141818 ?auto_141819 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141827 - BLOCK
      ?auto_141828 - BLOCK
      ?auto_141829 - BLOCK
      ?auto_141830 - BLOCK
      ?auto_141831 - BLOCK
      ?auto_141832 - BLOCK
    )
    :vars
    (
      ?auto_141833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141832 ?auto_141833 ) ( not ( = ?auto_141827 ?auto_141828 ) ) ( not ( = ?auto_141827 ?auto_141829 ) ) ( not ( = ?auto_141827 ?auto_141830 ) ) ( not ( = ?auto_141827 ?auto_141831 ) ) ( not ( = ?auto_141827 ?auto_141832 ) ) ( not ( = ?auto_141827 ?auto_141833 ) ) ( not ( = ?auto_141828 ?auto_141829 ) ) ( not ( = ?auto_141828 ?auto_141830 ) ) ( not ( = ?auto_141828 ?auto_141831 ) ) ( not ( = ?auto_141828 ?auto_141832 ) ) ( not ( = ?auto_141828 ?auto_141833 ) ) ( not ( = ?auto_141829 ?auto_141830 ) ) ( not ( = ?auto_141829 ?auto_141831 ) ) ( not ( = ?auto_141829 ?auto_141832 ) ) ( not ( = ?auto_141829 ?auto_141833 ) ) ( not ( = ?auto_141830 ?auto_141831 ) ) ( not ( = ?auto_141830 ?auto_141832 ) ) ( not ( = ?auto_141830 ?auto_141833 ) ) ( not ( = ?auto_141831 ?auto_141832 ) ) ( not ( = ?auto_141831 ?auto_141833 ) ) ( not ( = ?auto_141832 ?auto_141833 ) ) ( ON ?auto_141831 ?auto_141832 ) ( ON ?auto_141830 ?auto_141831 ) ( ON ?auto_141829 ?auto_141830 ) ( ON ?auto_141828 ?auto_141829 ) ( ON ?auto_141827 ?auto_141828 ) ( CLEAR ?auto_141827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141827 )
      ( MAKE-6PILE ?auto_141827 ?auto_141828 ?auto_141829 ?auto_141830 ?auto_141831 ?auto_141832 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_141841 - BLOCK
      ?auto_141842 - BLOCK
      ?auto_141843 - BLOCK
      ?auto_141844 - BLOCK
      ?auto_141845 - BLOCK
      ?auto_141846 - BLOCK
      ?auto_141847 - BLOCK
    )
    :vars
    (
      ?auto_141848 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141846 ) ( ON ?auto_141847 ?auto_141848 ) ( CLEAR ?auto_141847 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141841 ) ( ON ?auto_141842 ?auto_141841 ) ( ON ?auto_141843 ?auto_141842 ) ( ON ?auto_141844 ?auto_141843 ) ( ON ?auto_141845 ?auto_141844 ) ( ON ?auto_141846 ?auto_141845 ) ( not ( = ?auto_141841 ?auto_141842 ) ) ( not ( = ?auto_141841 ?auto_141843 ) ) ( not ( = ?auto_141841 ?auto_141844 ) ) ( not ( = ?auto_141841 ?auto_141845 ) ) ( not ( = ?auto_141841 ?auto_141846 ) ) ( not ( = ?auto_141841 ?auto_141847 ) ) ( not ( = ?auto_141841 ?auto_141848 ) ) ( not ( = ?auto_141842 ?auto_141843 ) ) ( not ( = ?auto_141842 ?auto_141844 ) ) ( not ( = ?auto_141842 ?auto_141845 ) ) ( not ( = ?auto_141842 ?auto_141846 ) ) ( not ( = ?auto_141842 ?auto_141847 ) ) ( not ( = ?auto_141842 ?auto_141848 ) ) ( not ( = ?auto_141843 ?auto_141844 ) ) ( not ( = ?auto_141843 ?auto_141845 ) ) ( not ( = ?auto_141843 ?auto_141846 ) ) ( not ( = ?auto_141843 ?auto_141847 ) ) ( not ( = ?auto_141843 ?auto_141848 ) ) ( not ( = ?auto_141844 ?auto_141845 ) ) ( not ( = ?auto_141844 ?auto_141846 ) ) ( not ( = ?auto_141844 ?auto_141847 ) ) ( not ( = ?auto_141844 ?auto_141848 ) ) ( not ( = ?auto_141845 ?auto_141846 ) ) ( not ( = ?auto_141845 ?auto_141847 ) ) ( not ( = ?auto_141845 ?auto_141848 ) ) ( not ( = ?auto_141846 ?auto_141847 ) ) ( not ( = ?auto_141846 ?auto_141848 ) ) ( not ( = ?auto_141847 ?auto_141848 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141847 ?auto_141848 )
      ( !STACK ?auto_141847 ?auto_141846 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_141856 - BLOCK
      ?auto_141857 - BLOCK
      ?auto_141858 - BLOCK
      ?auto_141859 - BLOCK
      ?auto_141860 - BLOCK
      ?auto_141861 - BLOCK
      ?auto_141862 - BLOCK
    )
    :vars
    (
      ?auto_141863 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141861 ) ( ON ?auto_141862 ?auto_141863 ) ( CLEAR ?auto_141862 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141856 ) ( ON ?auto_141857 ?auto_141856 ) ( ON ?auto_141858 ?auto_141857 ) ( ON ?auto_141859 ?auto_141858 ) ( ON ?auto_141860 ?auto_141859 ) ( ON ?auto_141861 ?auto_141860 ) ( not ( = ?auto_141856 ?auto_141857 ) ) ( not ( = ?auto_141856 ?auto_141858 ) ) ( not ( = ?auto_141856 ?auto_141859 ) ) ( not ( = ?auto_141856 ?auto_141860 ) ) ( not ( = ?auto_141856 ?auto_141861 ) ) ( not ( = ?auto_141856 ?auto_141862 ) ) ( not ( = ?auto_141856 ?auto_141863 ) ) ( not ( = ?auto_141857 ?auto_141858 ) ) ( not ( = ?auto_141857 ?auto_141859 ) ) ( not ( = ?auto_141857 ?auto_141860 ) ) ( not ( = ?auto_141857 ?auto_141861 ) ) ( not ( = ?auto_141857 ?auto_141862 ) ) ( not ( = ?auto_141857 ?auto_141863 ) ) ( not ( = ?auto_141858 ?auto_141859 ) ) ( not ( = ?auto_141858 ?auto_141860 ) ) ( not ( = ?auto_141858 ?auto_141861 ) ) ( not ( = ?auto_141858 ?auto_141862 ) ) ( not ( = ?auto_141858 ?auto_141863 ) ) ( not ( = ?auto_141859 ?auto_141860 ) ) ( not ( = ?auto_141859 ?auto_141861 ) ) ( not ( = ?auto_141859 ?auto_141862 ) ) ( not ( = ?auto_141859 ?auto_141863 ) ) ( not ( = ?auto_141860 ?auto_141861 ) ) ( not ( = ?auto_141860 ?auto_141862 ) ) ( not ( = ?auto_141860 ?auto_141863 ) ) ( not ( = ?auto_141861 ?auto_141862 ) ) ( not ( = ?auto_141861 ?auto_141863 ) ) ( not ( = ?auto_141862 ?auto_141863 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141862 ?auto_141863 )
      ( !STACK ?auto_141862 ?auto_141861 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_141871 - BLOCK
      ?auto_141872 - BLOCK
      ?auto_141873 - BLOCK
      ?auto_141874 - BLOCK
      ?auto_141875 - BLOCK
      ?auto_141876 - BLOCK
      ?auto_141877 - BLOCK
    )
    :vars
    (
      ?auto_141878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141877 ?auto_141878 ) ( ON-TABLE ?auto_141871 ) ( ON ?auto_141872 ?auto_141871 ) ( ON ?auto_141873 ?auto_141872 ) ( ON ?auto_141874 ?auto_141873 ) ( ON ?auto_141875 ?auto_141874 ) ( not ( = ?auto_141871 ?auto_141872 ) ) ( not ( = ?auto_141871 ?auto_141873 ) ) ( not ( = ?auto_141871 ?auto_141874 ) ) ( not ( = ?auto_141871 ?auto_141875 ) ) ( not ( = ?auto_141871 ?auto_141876 ) ) ( not ( = ?auto_141871 ?auto_141877 ) ) ( not ( = ?auto_141871 ?auto_141878 ) ) ( not ( = ?auto_141872 ?auto_141873 ) ) ( not ( = ?auto_141872 ?auto_141874 ) ) ( not ( = ?auto_141872 ?auto_141875 ) ) ( not ( = ?auto_141872 ?auto_141876 ) ) ( not ( = ?auto_141872 ?auto_141877 ) ) ( not ( = ?auto_141872 ?auto_141878 ) ) ( not ( = ?auto_141873 ?auto_141874 ) ) ( not ( = ?auto_141873 ?auto_141875 ) ) ( not ( = ?auto_141873 ?auto_141876 ) ) ( not ( = ?auto_141873 ?auto_141877 ) ) ( not ( = ?auto_141873 ?auto_141878 ) ) ( not ( = ?auto_141874 ?auto_141875 ) ) ( not ( = ?auto_141874 ?auto_141876 ) ) ( not ( = ?auto_141874 ?auto_141877 ) ) ( not ( = ?auto_141874 ?auto_141878 ) ) ( not ( = ?auto_141875 ?auto_141876 ) ) ( not ( = ?auto_141875 ?auto_141877 ) ) ( not ( = ?auto_141875 ?auto_141878 ) ) ( not ( = ?auto_141876 ?auto_141877 ) ) ( not ( = ?auto_141876 ?auto_141878 ) ) ( not ( = ?auto_141877 ?auto_141878 ) ) ( CLEAR ?auto_141875 ) ( ON ?auto_141876 ?auto_141877 ) ( CLEAR ?auto_141876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141871 ?auto_141872 ?auto_141873 ?auto_141874 ?auto_141875 ?auto_141876 )
      ( MAKE-7PILE ?auto_141871 ?auto_141872 ?auto_141873 ?auto_141874 ?auto_141875 ?auto_141876 ?auto_141877 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_141886 - BLOCK
      ?auto_141887 - BLOCK
      ?auto_141888 - BLOCK
      ?auto_141889 - BLOCK
      ?auto_141890 - BLOCK
      ?auto_141891 - BLOCK
      ?auto_141892 - BLOCK
    )
    :vars
    (
      ?auto_141893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141892 ?auto_141893 ) ( ON-TABLE ?auto_141886 ) ( ON ?auto_141887 ?auto_141886 ) ( ON ?auto_141888 ?auto_141887 ) ( ON ?auto_141889 ?auto_141888 ) ( ON ?auto_141890 ?auto_141889 ) ( not ( = ?auto_141886 ?auto_141887 ) ) ( not ( = ?auto_141886 ?auto_141888 ) ) ( not ( = ?auto_141886 ?auto_141889 ) ) ( not ( = ?auto_141886 ?auto_141890 ) ) ( not ( = ?auto_141886 ?auto_141891 ) ) ( not ( = ?auto_141886 ?auto_141892 ) ) ( not ( = ?auto_141886 ?auto_141893 ) ) ( not ( = ?auto_141887 ?auto_141888 ) ) ( not ( = ?auto_141887 ?auto_141889 ) ) ( not ( = ?auto_141887 ?auto_141890 ) ) ( not ( = ?auto_141887 ?auto_141891 ) ) ( not ( = ?auto_141887 ?auto_141892 ) ) ( not ( = ?auto_141887 ?auto_141893 ) ) ( not ( = ?auto_141888 ?auto_141889 ) ) ( not ( = ?auto_141888 ?auto_141890 ) ) ( not ( = ?auto_141888 ?auto_141891 ) ) ( not ( = ?auto_141888 ?auto_141892 ) ) ( not ( = ?auto_141888 ?auto_141893 ) ) ( not ( = ?auto_141889 ?auto_141890 ) ) ( not ( = ?auto_141889 ?auto_141891 ) ) ( not ( = ?auto_141889 ?auto_141892 ) ) ( not ( = ?auto_141889 ?auto_141893 ) ) ( not ( = ?auto_141890 ?auto_141891 ) ) ( not ( = ?auto_141890 ?auto_141892 ) ) ( not ( = ?auto_141890 ?auto_141893 ) ) ( not ( = ?auto_141891 ?auto_141892 ) ) ( not ( = ?auto_141891 ?auto_141893 ) ) ( not ( = ?auto_141892 ?auto_141893 ) ) ( CLEAR ?auto_141890 ) ( ON ?auto_141891 ?auto_141892 ) ( CLEAR ?auto_141891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141886 ?auto_141887 ?auto_141888 ?auto_141889 ?auto_141890 ?auto_141891 )
      ( MAKE-7PILE ?auto_141886 ?auto_141887 ?auto_141888 ?auto_141889 ?auto_141890 ?auto_141891 ?auto_141892 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_141901 - BLOCK
      ?auto_141902 - BLOCK
      ?auto_141903 - BLOCK
      ?auto_141904 - BLOCK
      ?auto_141905 - BLOCK
      ?auto_141906 - BLOCK
      ?auto_141907 - BLOCK
    )
    :vars
    (
      ?auto_141908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141907 ?auto_141908 ) ( ON-TABLE ?auto_141901 ) ( ON ?auto_141902 ?auto_141901 ) ( ON ?auto_141903 ?auto_141902 ) ( ON ?auto_141904 ?auto_141903 ) ( not ( = ?auto_141901 ?auto_141902 ) ) ( not ( = ?auto_141901 ?auto_141903 ) ) ( not ( = ?auto_141901 ?auto_141904 ) ) ( not ( = ?auto_141901 ?auto_141905 ) ) ( not ( = ?auto_141901 ?auto_141906 ) ) ( not ( = ?auto_141901 ?auto_141907 ) ) ( not ( = ?auto_141901 ?auto_141908 ) ) ( not ( = ?auto_141902 ?auto_141903 ) ) ( not ( = ?auto_141902 ?auto_141904 ) ) ( not ( = ?auto_141902 ?auto_141905 ) ) ( not ( = ?auto_141902 ?auto_141906 ) ) ( not ( = ?auto_141902 ?auto_141907 ) ) ( not ( = ?auto_141902 ?auto_141908 ) ) ( not ( = ?auto_141903 ?auto_141904 ) ) ( not ( = ?auto_141903 ?auto_141905 ) ) ( not ( = ?auto_141903 ?auto_141906 ) ) ( not ( = ?auto_141903 ?auto_141907 ) ) ( not ( = ?auto_141903 ?auto_141908 ) ) ( not ( = ?auto_141904 ?auto_141905 ) ) ( not ( = ?auto_141904 ?auto_141906 ) ) ( not ( = ?auto_141904 ?auto_141907 ) ) ( not ( = ?auto_141904 ?auto_141908 ) ) ( not ( = ?auto_141905 ?auto_141906 ) ) ( not ( = ?auto_141905 ?auto_141907 ) ) ( not ( = ?auto_141905 ?auto_141908 ) ) ( not ( = ?auto_141906 ?auto_141907 ) ) ( not ( = ?auto_141906 ?auto_141908 ) ) ( not ( = ?auto_141907 ?auto_141908 ) ) ( ON ?auto_141906 ?auto_141907 ) ( CLEAR ?auto_141904 ) ( ON ?auto_141905 ?auto_141906 ) ( CLEAR ?auto_141905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141901 ?auto_141902 ?auto_141903 ?auto_141904 ?auto_141905 )
      ( MAKE-7PILE ?auto_141901 ?auto_141902 ?auto_141903 ?auto_141904 ?auto_141905 ?auto_141906 ?auto_141907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_141916 - BLOCK
      ?auto_141917 - BLOCK
      ?auto_141918 - BLOCK
      ?auto_141919 - BLOCK
      ?auto_141920 - BLOCK
      ?auto_141921 - BLOCK
      ?auto_141922 - BLOCK
    )
    :vars
    (
      ?auto_141923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141922 ?auto_141923 ) ( ON-TABLE ?auto_141916 ) ( ON ?auto_141917 ?auto_141916 ) ( ON ?auto_141918 ?auto_141917 ) ( ON ?auto_141919 ?auto_141918 ) ( not ( = ?auto_141916 ?auto_141917 ) ) ( not ( = ?auto_141916 ?auto_141918 ) ) ( not ( = ?auto_141916 ?auto_141919 ) ) ( not ( = ?auto_141916 ?auto_141920 ) ) ( not ( = ?auto_141916 ?auto_141921 ) ) ( not ( = ?auto_141916 ?auto_141922 ) ) ( not ( = ?auto_141916 ?auto_141923 ) ) ( not ( = ?auto_141917 ?auto_141918 ) ) ( not ( = ?auto_141917 ?auto_141919 ) ) ( not ( = ?auto_141917 ?auto_141920 ) ) ( not ( = ?auto_141917 ?auto_141921 ) ) ( not ( = ?auto_141917 ?auto_141922 ) ) ( not ( = ?auto_141917 ?auto_141923 ) ) ( not ( = ?auto_141918 ?auto_141919 ) ) ( not ( = ?auto_141918 ?auto_141920 ) ) ( not ( = ?auto_141918 ?auto_141921 ) ) ( not ( = ?auto_141918 ?auto_141922 ) ) ( not ( = ?auto_141918 ?auto_141923 ) ) ( not ( = ?auto_141919 ?auto_141920 ) ) ( not ( = ?auto_141919 ?auto_141921 ) ) ( not ( = ?auto_141919 ?auto_141922 ) ) ( not ( = ?auto_141919 ?auto_141923 ) ) ( not ( = ?auto_141920 ?auto_141921 ) ) ( not ( = ?auto_141920 ?auto_141922 ) ) ( not ( = ?auto_141920 ?auto_141923 ) ) ( not ( = ?auto_141921 ?auto_141922 ) ) ( not ( = ?auto_141921 ?auto_141923 ) ) ( not ( = ?auto_141922 ?auto_141923 ) ) ( ON ?auto_141921 ?auto_141922 ) ( CLEAR ?auto_141919 ) ( ON ?auto_141920 ?auto_141921 ) ( CLEAR ?auto_141920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141916 ?auto_141917 ?auto_141918 ?auto_141919 ?auto_141920 )
      ( MAKE-7PILE ?auto_141916 ?auto_141917 ?auto_141918 ?auto_141919 ?auto_141920 ?auto_141921 ?auto_141922 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_141931 - BLOCK
      ?auto_141932 - BLOCK
      ?auto_141933 - BLOCK
      ?auto_141934 - BLOCK
      ?auto_141935 - BLOCK
      ?auto_141936 - BLOCK
      ?auto_141937 - BLOCK
    )
    :vars
    (
      ?auto_141938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141937 ?auto_141938 ) ( ON-TABLE ?auto_141931 ) ( ON ?auto_141932 ?auto_141931 ) ( ON ?auto_141933 ?auto_141932 ) ( not ( = ?auto_141931 ?auto_141932 ) ) ( not ( = ?auto_141931 ?auto_141933 ) ) ( not ( = ?auto_141931 ?auto_141934 ) ) ( not ( = ?auto_141931 ?auto_141935 ) ) ( not ( = ?auto_141931 ?auto_141936 ) ) ( not ( = ?auto_141931 ?auto_141937 ) ) ( not ( = ?auto_141931 ?auto_141938 ) ) ( not ( = ?auto_141932 ?auto_141933 ) ) ( not ( = ?auto_141932 ?auto_141934 ) ) ( not ( = ?auto_141932 ?auto_141935 ) ) ( not ( = ?auto_141932 ?auto_141936 ) ) ( not ( = ?auto_141932 ?auto_141937 ) ) ( not ( = ?auto_141932 ?auto_141938 ) ) ( not ( = ?auto_141933 ?auto_141934 ) ) ( not ( = ?auto_141933 ?auto_141935 ) ) ( not ( = ?auto_141933 ?auto_141936 ) ) ( not ( = ?auto_141933 ?auto_141937 ) ) ( not ( = ?auto_141933 ?auto_141938 ) ) ( not ( = ?auto_141934 ?auto_141935 ) ) ( not ( = ?auto_141934 ?auto_141936 ) ) ( not ( = ?auto_141934 ?auto_141937 ) ) ( not ( = ?auto_141934 ?auto_141938 ) ) ( not ( = ?auto_141935 ?auto_141936 ) ) ( not ( = ?auto_141935 ?auto_141937 ) ) ( not ( = ?auto_141935 ?auto_141938 ) ) ( not ( = ?auto_141936 ?auto_141937 ) ) ( not ( = ?auto_141936 ?auto_141938 ) ) ( not ( = ?auto_141937 ?auto_141938 ) ) ( ON ?auto_141936 ?auto_141937 ) ( ON ?auto_141935 ?auto_141936 ) ( CLEAR ?auto_141933 ) ( ON ?auto_141934 ?auto_141935 ) ( CLEAR ?auto_141934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141931 ?auto_141932 ?auto_141933 ?auto_141934 )
      ( MAKE-7PILE ?auto_141931 ?auto_141932 ?auto_141933 ?auto_141934 ?auto_141935 ?auto_141936 ?auto_141937 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_141946 - BLOCK
      ?auto_141947 - BLOCK
      ?auto_141948 - BLOCK
      ?auto_141949 - BLOCK
      ?auto_141950 - BLOCK
      ?auto_141951 - BLOCK
      ?auto_141952 - BLOCK
    )
    :vars
    (
      ?auto_141953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141952 ?auto_141953 ) ( ON-TABLE ?auto_141946 ) ( ON ?auto_141947 ?auto_141946 ) ( ON ?auto_141948 ?auto_141947 ) ( not ( = ?auto_141946 ?auto_141947 ) ) ( not ( = ?auto_141946 ?auto_141948 ) ) ( not ( = ?auto_141946 ?auto_141949 ) ) ( not ( = ?auto_141946 ?auto_141950 ) ) ( not ( = ?auto_141946 ?auto_141951 ) ) ( not ( = ?auto_141946 ?auto_141952 ) ) ( not ( = ?auto_141946 ?auto_141953 ) ) ( not ( = ?auto_141947 ?auto_141948 ) ) ( not ( = ?auto_141947 ?auto_141949 ) ) ( not ( = ?auto_141947 ?auto_141950 ) ) ( not ( = ?auto_141947 ?auto_141951 ) ) ( not ( = ?auto_141947 ?auto_141952 ) ) ( not ( = ?auto_141947 ?auto_141953 ) ) ( not ( = ?auto_141948 ?auto_141949 ) ) ( not ( = ?auto_141948 ?auto_141950 ) ) ( not ( = ?auto_141948 ?auto_141951 ) ) ( not ( = ?auto_141948 ?auto_141952 ) ) ( not ( = ?auto_141948 ?auto_141953 ) ) ( not ( = ?auto_141949 ?auto_141950 ) ) ( not ( = ?auto_141949 ?auto_141951 ) ) ( not ( = ?auto_141949 ?auto_141952 ) ) ( not ( = ?auto_141949 ?auto_141953 ) ) ( not ( = ?auto_141950 ?auto_141951 ) ) ( not ( = ?auto_141950 ?auto_141952 ) ) ( not ( = ?auto_141950 ?auto_141953 ) ) ( not ( = ?auto_141951 ?auto_141952 ) ) ( not ( = ?auto_141951 ?auto_141953 ) ) ( not ( = ?auto_141952 ?auto_141953 ) ) ( ON ?auto_141951 ?auto_141952 ) ( ON ?auto_141950 ?auto_141951 ) ( CLEAR ?auto_141948 ) ( ON ?auto_141949 ?auto_141950 ) ( CLEAR ?auto_141949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141946 ?auto_141947 ?auto_141948 ?auto_141949 )
      ( MAKE-7PILE ?auto_141946 ?auto_141947 ?auto_141948 ?auto_141949 ?auto_141950 ?auto_141951 ?auto_141952 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_141961 - BLOCK
      ?auto_141962 - BLOCK
      ?auto_141963 - BLOCK
      ?auto_141964 - BLOCK
      ?auto_141965 - BLOCK
      ?auto_141966 - BLOCK
      ?auto_141967 - BLOCK
    )
    :vars
    (
      ?auto_141968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141967 ?auto_141968 ) ( ON-TABLE ?auto_141961 ) ( ON ?auto_141962 ?auto_141961 ) ( not ( = ?auto_141961 ?auto_141962 ) ) ( not ( = ?auto_141961 ?auto_141963 ) ) ( not ( = ?auto_141961 ?auto_141964 ) ) ( not ( = ?auto_141961 ?auto_141965 ) ) ( not ( = ?auto_141961 ?auto_141966 ) ) ( not ( = ?auto_141961 ?auto_141967 ) ) ( not ( = ?auto_141961 ?auto_141968 ) ) ( not ( = ?auto_141962 ?auto_141963 ) ) ( not ( = ?auto_141962 ?auto_141964 ) ) ( not ( = ?auto_141962 ?auto_141965 ) ) ( not ( = ?auto_141962 ?auto_141966 ) ) ( not ( = ?auto_141962 ?auto_141967 ) ) ( not ( = ?auto_141962 ?auto_141968 ) ) ( not ( = ?auto_141963 ?auto_141964 ) ) ( not ( = ?auto_141963 ?auto_141965 ) ) ( not ( = ?auto_141963 ?auto_141966 ) ) ( not ( = ?auto_141963 ?auto_141967 ) ) ( not ( = ?auto_141963 ?auto_141968 ) ) ( not ( = ?auto_141964 ?auto_141965 ) ) ( not ( = ?auto_141964 ?auto_141966 ) ) ( not ( = ?auto_141964 ?auto_141967 ) ) ( not ( = ?auto_141964 ?auto_141968 ) ) ( not ( = ?auto_141965 ?auto_141966 ) ) ( not ( = ?auto_141965 ?auto_141967 ) ) ( not ( = ?auto_141965 ?auto_141968 ) ) ( not ( = ?auto_141966 ?auto_141967 ) ) ( not ( = ?auto_141966 ?auto_141968 ) ) ( not ( = ?auto_141967 ?auto_141968 ) ) ( ON ?auto_141966 ?auto_141967 ) ( ON ?auto_141965 ?auto_141966 ) ( ON ?auto_141964 ?auto_141965 ) ( CLEAR ?auto_141962 ) ( ON ?auto_141963 ?auto_141964 ) ( CLEAR ?auto_141963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141961 ?auto_141962 ?auto_141963 )
      ( MAKE-7PILE ?auto_141961 ?auto_141962 ?auto_141963 ?auto_141964 ?auto_141965 ?auto_141966 ?auto_141967 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_141976 - BLOCK
      ?auto_141977 - BLOCK
      ?auto_141978 - BLOCK
      ?auto_141979 - BLOCK
      ?auto_141980 - BLOCK
      ?auto_141981 - BLOCK
      ?auto_141982 - BLOCK
    )
    :vars
    (
      ?auto_141983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141982 ?auto_141983 ) ( ON-TABLE ?auto_141976 ) ( ON ?auto_141977 ?auto_141976 ) ( not ( = ?auto_141976 ?auto_141977 ) ) ( not ( = ?auto_141976 ?auto_141978 ) ) ( not ( = ?auto_141976 ?auto_141979 ) ) ( not ( = ?auto_141976 ?auto_141980 ) ) ( not ( = ?auto_141976 ?auto_141981 ) ) ( not ( = ?auto_141976 ?auto_141982 ) ) ( not ( = ?auto_141976 ?auto_141983 ) ) ( not ( = ?auto_141977 ?auto_141978 ) ) ( not ( = ?auto_141977 ?auto_141979 ) ) ( not ( = ?auto_141977 ?auto_141980 ) ) ( not ( = ?auto_141977 ?auto_141981 ) ) ( not ( = ?auto_141977 ?auto_141982 ) ) ( not ( = ?auto_141977 ?auto_141983 ) ) ( not ( = ?auto_141978 ?auto_141979 ) ) ( not ( = ?auto_141978 ?auto_141980 ) ) ( not ( = ?auto_141978 ?auto_141981 ) ) ( not ( = ?auto_141978 ?auto_141982 ) ) ( not ( = ?auto_141978 ?auto_141983 ) ) ( not ( = ?auto_141979 ?auto_141980 ) ) ( not ( = ?auto_141979 ?auto_141981 ) ) ( not ( = ?auto_141979 ?auto_141982 ) ) ( not ( = ?auto_141979 ?auto_141983 ) ) ( not ( = ?auto_141980 ?auto_141981 ) ) ( not ( = ?auto_141980 ?auto_141982 ) ) ( not ( = ?auto_141980 ?auto_141983 ) ) ( not ( = ?auto_141981 ?auto_141982 ) ) ( not ( = ?auto_141981 ?auto_141983 ) ) ( not ( = ?auto_141982 ?auto_141983 ) ) ( ON ?auto_141981 ?auto_141982 ) ( ON ?auto_141980 ?auto_141981 ) ( ON ?auto_141979 ?auto_141980 ) ( CLEAR ?auto_141977 ) ( ON ?auto_141978 ?auto_141979 ) ( CLEAR ?auto_141978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141976 ?auto_141977 ?auto_141978 )
      ( MAKE-7PILE ?auto_141976 ?auto_141977 ?auto_141978 ?auto_141979 ?auto_141980 ?auto_141981 ?auto_141982 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_141991 - BLOCK
      ?auto_141992 - BLOCK
      ?auto_141993 - BLOCK
      ?auto_141994 - BLOCK
      ?auto_141995 - BLOCK
      ?auto_141996 - BLOCK
      ?auto_141997 - BLOCK
    )
    :vars
    (
      ?auto_141998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141997 ?auto_141998 ) ( ON-TABLE ?auto_141991 ) ( not ( = ?auto_141991 ?auto_141992 ) ) ( not ( = ?auto_141991 ?auto_141993 ) ) ( not ( = ?auto_141991 ?auto_141994 ) ) ( not ( = ?auto_141991 ?auto_141995 ) ) ( not ( = ?auto_141991 ?auto_141996 ) ) ( not ( = ?auto_141991 ?auto_141997 ) ) ( not ( = ?auto_141991 ?auto_141998 ) ) ( not ( = ?auto_141992 ?auto_141993 ) ) ( not ( = ?auto_141992 ?auto_141994 ) ) ( not ( = ?auto_141992 ?auto_141995 ) ) ( not ( = ?auto_141992 ?auto_141996 ) ) ( not ( = ?auto_141992 ?auto_141997 ) ) ( not ( = ?auto_141992 ?auto_141998 ) ) ( not ( = ?auto_141993 ?auto_141994 ) ) ( not ( = ?auto_141993 ?auto_141995 ) ) ( not ( = ?auto_141993 ?auto_141996 ) ) ( not ( = ?auto_141993 ?auto_141997 ) ) ( not ( = ?auto_141993 ?auto_141998 ) ) ( not ( = ?auto_141994 ?auto_141995 ) ) ( not ( = ?auto_141994 ?auto_141996 ) ) ( not ( = ?auto_141994 ?auto_141997 ) ) ( not ( = ?auto_141994 ?auto_141998 ) ) ( not ( = ?auto_141995 ?auto_141996 ) ) ( not ( = ?auto_141995 ?auto_141997 ) ) ( not ( = ?auto_141995 ?auto_141998 ) ) ( not ( = ?auto_141996 ?auto_141997 ) ) ( not ( = ?auto_141996 ?auto_141998 ) ) ( not ( = ?auto_141997 ?auto_141998 ) ) ( ON ?auto_141996 ?auto_141997 ) ( ON ?auto_141995 ?auto_141996 ) ( ON ?auto_141994 ?auto_141995 ) ( ON ?auto_141993 ?auto_141994 ) ( CLEAR ?auto_141991 ) ( ON ?auto_141992 ?auto_141993 ) ( CLEAR ?auto_141992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141991 ?auto_141992 )
      ( MAKE-7PILE ?auto_141991 ?auto_141992 ?auto_141993 ?auto_141994 ?auto_141995 ?auto_141996 ?auto_141997 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142006 - BLOCK
      ?auto_142007 - BLOCK
      ?auto_142008 - BLOCK
      ?auto_142009 - BLOCK
      ?auto_142010 - BLOCK
      ?auto_142011 - BLOCK
      ?auto_142012 - BLOCK
    )
    :vars
    (
      ?auto_142013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142012 ?auto_142013 ) ( ON-TABLE ?auto_142006 ) ( not ( = ?auto_142006 ?auto_142007 ) ) ( not ( = ?auto_142006 ?auto_142008 ) ) ( not ( = ?auto_142006 ?auto_142009 ) ) ( not ( = ?auto_142006 ?auto_142010 ) ) ( not ( = ?auto_142006 ?auto_142011 ) ) ( not ( = ?auto_142006 ?auto_142012 ) ) ( not ( = ?auto_142006 ?auto_142013 ) ) ( not ( = ?auto_142007 ?auto_142008 ) ) ( not ( = ?auto_142007 ?auto_142009 ) ) ( not ( = ?auto_142007 ?auto_142010 ) ) ( not ( = ?auto_142007 ?auto_142011 ) ) ( not ( = ?auto_142007 ?auto_142012 ) ) ( not ( = ?auto_142007 ?auto_142013 ) ) ( not ( = ?auto_142008 ?auto_142009 ) ) ( not ( = ?auto_142008 ?auto_142010 ) ) ( not ( = ?auto_142008 ?auto_142011 ) ) ( not ( = ?auto_142008 ?auto_142012 ) ) ( not ( = ?auto_142008 ?auto_142013 ) ) ( not ( = ?auto_142009 ?auto_142010 ) ) ( not ( = ?auto_142009 ?auto_142011 ) ) ( not ( = ?auto_142009 ?auto_142012 ) ) ( not ( = ?auto_142009 ?auto_142013 ) ) ( not ( = ?auto_142010 ?auto_142011 ) ) ( not ( = ?auto_142010 ?auto_142012 ) ) ( not ( = ?auto_142010 ?auto_142013 ) ) ( not ( = ?auto_142011 ?auto_142012 ) ) ( not ( = ?auto_142011 ?auto_142013 ) ) ( not ( = ?auto_142012 ?auto_142013 ) ) ( ON ?auto_142011 ?auto_142012 ) ( ON ?auto_142010 ?auto_142011 ) ( ON ?auto_142009 ?auto_142010 ) ( ON ?auto_142008 ?auto_142009 ) ( CLEAR ?auto_142006 ) ( ON ?auto_142007 ?auto_142008 ) ( CLEAR ?auto_142007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142006 ?auto_142007 )
      ( MAKE-7PILE ?auto_142006 ?auto_142007 ?auto_142008 ?auto_142009 ?auto_142010 ?auto_142011 ?auto_142012 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142021 - BLOCK
      ?auto_142022 - BLOCK
      ?auto_142023 - BLOCK
      ?auto_142024 - BLOCK
      ?auto_142025 - BLOCK
      ?auto_142026 - BLOCK
      ?auto_142027 - BLOCK
    )
    :vars
    (
      ?auto_142028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142027 ?auto_142028 ) ( not ( = ?auto_142021 ?auto_142022 ) ) ( not ( = ?auto_142021 ?auto_142023 ) ) ( not ( = ?auto_142021 ?auto_142024 ) ) ( not ( = ?auto_142021 ?auto_142025 ) ) ( not ( = ?auto_142021 ?auto_142026 ) ) ( not ( = ?auto_142021 ?auto_142027 ) ) ( not ( = ?auto_142021 ?auto_142028 ) ) ( not ( = ?auto_142022 ?auto_142023 ) ) ( not ( = ?auto_142022 ?auto_142024 ) ) ( not ( = ?auto_142022 ?auto_142025 ) ) ( not ( = ?auto_142022 ?auto_142026 ) ) ( not ( = ?auto_142022 ?auto_142027 ) ) ( not ( = ?auto_142022 ?auto_142028 ) ) ( not ( = ?auto_142023 ?auto_142024 ) ) ( not ( = ?auto_142023 ?auto_142025 ) ) ( not ( = ?auto_142023 ?auto_142026 ) ) ( not ( = ?auto_142023 ?auto_142027 ) ) ( not ( = ?auto_142023 ?auto_142028 ) ) ( not ( = ?auto_142024 ?auto_142025 ) ) ( not ( = ?auto_142024 ?auto_142026 ) ) ( not ( = ?auto_142024 ?auto_142027 ) ) ( not ( = ?auto_142024 ?auto_142028 ) ) ( not ( = ?auto_142025 ?auto_142026 ) ) ( not ( = ?auto_142025 ?auto_142027 ) ) ( not ( = ?auto_142025 ?auto_142028 ) ) ( not ( = ?auto_142026 ?auto_142027 ) ) ( not ( = ?auto_142026 ?auto_142028 ) ) ( not ( = ?auto_142027 ?auto_142028 ) ) ( ON ?auto_142026 ?auto_142027 ) ( ON ?auto_142025 ?auto_142026 ) ( ON ?auto_142024 ?auto_142025 ) ( ON ?auto_142023 ?auto_142024 ) ( ON ?auto_142022 ?auto_142023 ) ( ON ?auto_142021 ?auto_142022 ) ( CLEAR ?auto_142021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142021 )
      ( MAKE-7PILE ?auto_142021 ?auto_142022 ?auto_142023 ?auto_142024 ?auto_142025 ?auto_142026 ?auto_142027 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142036 - BLOCK
      ?auto_142037 - BLOCK
      ?auto_142038 - BLOCK
      ?auto_142039 - BLOCK
      ?auto_142040 - BLOCK
      ?auto_142041 - BLOCK
      ?auto_142042 - BLOCK
    )
    :vars
    (
      ?auto_142043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142042 ?auto_142043 ) ( not ( = ?auto_142036 ?auto_142037 ) ) ( not ( = ?auto_142036 ?auto_142038 ) ) ( not ( = ?auto_142036 ?auto_142039 ) ) ( not ( = ?auto_142036 ?auto_142040 ) ) ( not ( = ?auto_142036 ?auto_142041 ) ) ( not ( = ?auto_142036 ?auto_142042 ) ) ( not ( = ?auto_142036 ?auto_142043 ) ) ( not ( = ?auto_142037 ?auto_142038 ) ) ( not ( = ?auto_142037 ?auto_142039 ) ) ( not ( = ?auto_142037 ?auto_142040 ) ) ( not ( = ?auto_142037 ?auto_142041 ) ) ( not ( = ?auto_142037 ?auto_142042 ) ) ( not ( = ?auto_142037 ?auto_142043 ) ) ( not ( = ?auto_142038 ?auto_142039 ) ) ( not ( = ?auto_142038 ?auto_142040 ) ) ( not ( = ?auto_142038 ?auto_142041 ) ) ( not ( = ?auto_142038 ?auto_142042 ) ) ( not ( = ?auto_142038 ?auto_142043 ) ) ( not ( = ?auto_142039 ?auto_142040 ) ) ( not ( = ?auto_142039 ?auto_142041 ) ) ( not ( = ?auto_142039 ?auto_142042 ) ) ( not ( = ?auto_142039 ?auto_142043 ) ) ( not ( = ?auto_142040 ?auto_142041 ) ) ( not ( = ?auto_142040 ?auto_142042 ) ) ( not ( = ?auto_142040 ?auto_142043 ) ) ( not ( = ?auto_142041 ?auto_142042 ) ) ( not ( = ?auto_142041 ?auto_142043 ) ) ( not ( = ?auto_142042 ?auto_142043 ) ) ( ON ?auto_142041 ?auto_142042 ) ( ON ?auto_142040 ?auto_142041 ) ( ON ?auto_142039 ?auto_142040 ) ( ON ?auto_142038 ?auto_142039 ) ( ON ?auto_142037 ?auto_142038 ) ( ON ?auto_142036 ?auto_142037 ) ( CLEAR ?auto_142036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142036 )
      ( MAKE-7PILE ?auto_142036 ?auto_142037 ?auto_142038 ?auto_142039 ?auto_142040 ?auto_142041 ?auto_142042 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142052 - BLOCK
      ?auto_142053 - BLOCK
      ?auto_142054 - BLOCK
      ?auto_142055 - BLOCK
      ?auto_142056 - BLOCK
      ?auto_142057 - BLOCK
      ?auto_142058 - BLOCK
      ?auto_142059 - BLOCK
    )
    :vars
    (
      ?auto_142060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_142058 ) ( ON ?auto_142059 ?auto_142060 ) ( CLEAR ?auto_142059 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142052 ) ( ON ?auto_142053 ?auto_142052 ) ( ON ?auto_142054 ?auto_142053 ) ( ON ?auto_142055 ?auto_142054 ) ( ON ?auto_142056 ?auto_142055 ) ( ON ?auto_142057 ?auto_142056 ) ( ON ?auto_142058 ?auto_142057 ) ( not ( = ?auto_142052 ?auto_142053 ) ) ( not ( = ?auto_142052 ?auto_142054 ) ) ( not ( = ?auto_142052 ?auto_142055 ) ) ( not ( = ?auto_142052 ?auto_142056 ) ) ( not ( = ?auto_142052 ?auto_142057 ) ) ( not ( = ?auto_142052 ?auto_142058 ) ) ( not ( = ?auto_142052 ?auto_142059 ) ) ( not ( = ?auto_142052 ?auto_142060 ) ) ( not ( = ?auto_142053 ?auto_142054 ) ) ( not ( = ?auto_142053 ?auto_142055 ) ) ( not ( = ?auto_142053 ?auto_142056 ) ) ( not ( = ?auto_142053 ?auto_142057 ) ) ( not ( = ?auto_142053 ?auto_142058 ) ) ( not ( = ?auto_142053 ?auto_142059 ) ) ( not ( = ?auto_142053 ?auto_142060 ) ) ( not ( = ?auto_142054 ?auto_142055 ) ) ( not ( = ?auto_142054 ?auto_142056 ) ) ( not ( = ?auto_142054 ?auto_142057 ) ) ( not ( = ?auto_142054 ?auto_142058 ) ) ( not ( = ?auto_142054 ?auto_142059 ) ) ( not ( = ?auto_142054 ?auto_142060 ) ) ( not ( = ?auto_142055 ?auto_142056 ) ) ( not ( = ?auto_142055 ?auto_142057 ) ) ( not ( = ?auto_142055 ?auto_142058 ) ) ( not ( = ?auto_142055 ?auto_142059 ) ) ( not ( = ?auto_142055 ?auto_142060 ) ) ( not ( = ?auto_142056 ?auto_142057 ) ) ( not ( = ?auto_142056 ?auto_142058 ) ) ( not ( = ?auto_142056 ?auto_142059 ) ) ( not ( = ?auto_142056 ?auto_142060 ) ) ( not ( = ?auto_142057 ?auto_142058 ) ) ( not ( = ?auto_142057 ?auto_142059 ) ) ( not ( = ?auto_142057 ?auto_142060 ) ) ( not ( = ?auto_142058 ?auto_142059 ) ) ( not ( = ?auto_142058 ?auto_142060 ) ) ( not ( = ?auto_142059 ?auto_142060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142059 ?auto_142060 )
      ( !STACK ?auto_142059 ?auto_142058 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142069 - BLOCK
      ?auto_142070 - BLOCK
      ?auto_142071 - BLOCK
      ?auto_142072 - BLOCK
      ?auto_142073 - BLOCK
      ?auto_142074 - BLOCK
      ?auto_142075 - BLOCK
      ?auto_142076 - BLOCK
    )
    :vars
    (
      ?auto_142077 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_142075 ) ( ON ?auto_142076 ?auto_142077 ) ( CLEAR ?auto_142076 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142069 ) ( ON ?auto_142070 ?auto_142069 ) ( ON ?auto_142071 ?auto_142070 ) ( ON ?auto_142072 ?auto_142071 ) ( ON ?auto_142073 ?auto_142072 ) ( ON ?auto_142074 ?auto_142073 ) ( ON ?auto_142075 ?auto_142074 ) ( not ( = ?auto_142069 ?auto_142070 ) ) ( not ( = ?auto_142069 ?auto_142071 ) ) ( not ( = ?auto_142069 ?auto_142072 ) ) ( not ( = ?auto_142069 ?auto_142073 ) ) ( not ( = ?auto_142069 ?auto_142074 ) ) ( not ( = ?auto_142069 ?auto_142075 ) ) ( not ( = ?auto_142069 ?auto_142076 ) ) ( not ( = ?auto_142069 ?auto_142077 ) ) ( not ( = ?auto_142070 ?auto_142071 ) ) ( not ( = ?auto_142070 ?auto_142072 ) ) ( not ( = ?auto_142070 ?auto_142073 ) ) ( not ( = ?auto_142070 ?auto_142074 ) ) ( not ( = ?auto_142070 ?auto_142075 ) ) ( not ( = ?auto_142070 ?auto_142076 ) ) ( not ( = ?auto_142070 ?auto_142077 ) ) ( not ( = ?auto_142071 ?auto_142072 ) ) ( not ( = ?auto_142071 ?auto_142073 ) ) ( not ( = ?auto_142071 ?auto_142074 ) ) ( not ( = ?auto_142071 ?auto_142075 ) ) ( not ( = ?auto_142071 ?auto_142076 ) ) ( not ( = ?auto_142071 ?auto_142077 ) ) ( not ( = ?auto_142072 ?auto_142073 ) ) ( not ( = ?auto_142072 ?auto_142074 ) ) ( not ( = ?auto_142072 ?auto_142075 ) ) ( not ( = ?auto_142072 ?auto_142076 ) ) ( not ( = ?auto_142072 ?auto_142077 ) ) ( not ( = ?auto_142073 ?auto_142074 ) ) ( not ( = ?auto_142073 ?auto_142075 ) ) ( not ( = ?auto_142073 ?auto_142076 ) ) ( not ( = ?auto_142073 ?auto_142077 ) ) ( not ( = ?auto_142074 ?auto_142075 ) ) ( not ( = ?auto_142074 ?auto_142076 ) ) ( not ( = ?auto_142074 ?auto_142077 ) ) ( not ( = ?auto_142075 ?auto_142076 ) ) ( not ( = ?auto_142075 ?auto_142077 ) ) ( not ( = ?auto_142076 ?auto_142077 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142076 ?auto_142077 )
      ( !STACK ?auto_142076 ?auto_142075 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142086 - BLOCK
      ?auto_142087 - BLOCK
      ?auto_142088 - BLOCK
      ?auto_142089 - BLOCK
      ?auto_142090 - BLOCK
      ?auto_142091 - BLOCK
      ?auto_142092 - BLOCK
      ?auto_142093 - BLOCK
    )
    :vars
    (
      ?auto_142094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142093 ?auto_142094 ) ( ON-TABLE ?auto_142086 ) ( ON ?auto_142087 ?auto_142086 ) ( ON ?auto_142088 ?auto_142087 ) ( ON ?auto_142089 ?auto_142088 ) ( ON ?auto_142090 ?auto_142089 ) ( ON ?auto_142091 ?auto_142090 ) ( not ( = ?auto_142086 ?auto_142087 ) ) ( not ( = ?auto_142086 ?auto_142088 ) ) ( not ( = ?auto_142086 ?auto_142089 ) ) ( not ( = ?auto_142086 ?auto_142090 ) ) ( not ( = ?auto_142086 ?auto_142091 ) ) ( not ( = ?auto_142086 ?auto_142092 ) ) ( not ( = ?auto_142086 ?auto_142093 ) ) ( not ( = ?auto_142086 ?auto_142094 ) ) ( not ( = ?auto_142087 ?auto_142088 ) ) ( not ( = ?auto_142087 ?auto_142089 ) ) ( not ( = ?auto_142087 ?auto_142090 ) ) ( not ( = ?auto_142087 ?auto_142091 ) ) ( not ( = ?auto_142087 ?auto_142092 ) ) ( not ( = ?auto_142087 ?auto_142093 ) ) ( not ( = ?auto_142087 ?auto_142094 ) ) ( not ( = ?auto_142088 ?auto_142089 ) ) ( not ( = ?auto_142088 ?auto_142090 ) ) ( not ( = ?auto_142088 ?auto_142091 ) ) ( not ( = ?auto_142088 ?auto_142092 ) ) ( not ( = ?auto_142088 ?auto_142093 ) ) ( not ( = ?auto_142088 ?auto_142094 ) ) ( not ( = ?auto_142089 ?auto_142090 ) ) ( not ( = ?auto_142089 ?auto_142091 ) ) ( not ( = ?auto_142089 ?auto_142092 ) ) ( not ( = ?auto_142089 ?auto_142093 ) ) ( not ( = ?auto_142089 ?auto_142094 ) ) ( not ( = ?auto_142090 ?auto_142091 ) ) ( not ( = ?auto_142090 ?auto_142092 ) ) ( not ( = ?auto_142090 ?auto_142093 ) ) ( not ( = ?auto_142090 ?auto_142094 ) ) ( not ( = ?auto_142091 ?auto_142092 ) ) ( not ( = ?auto_142091 ?auto_142093 ) ) ( not ( = ?auto_142091 ?auto_142094 ) ) ( not ( = ?auto_142092 ?auto_142093 ) ) ( not ( = ?auto_142092 ?auto_142094 ) ) ( not ( = ?auto_142093 ?auto_142094 ) ) ( CLEAR ?auto_142091 ) ( ON ?auto_142092 ?auto_142093 ) ( CLEAR ?auto_142092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142086 ?auto_142087 ?auto_142088 ?auto_142089 ?auto_142090 ?auto_142091 ?auto_142092 )
      ( MAKE-8PILE ?auto_142086 ?auto_142087 ?auto_142088 ?auto_142089 ?auto_142090 ?auto_142091 ?auto_142092 ?auto_142093 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142103 - BLOCK
      ?auto_142104 - BLOCK
      ?auto_142105 - BLOCK
      ?auto_142106 - BLOCK
      ?auto_142107 - BLOCK
      ?auto_142108 - BLOCK
      ?auto_142109 - BLOCK
      ?auto_142110 - BLOCK
    )
    :vars
    (
      ?auto_142111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142110 ?auto_142111 ) ( ON-TABLE ?auto_142103 ) ( ON ?auto_142104 ?auto_142103 ) ( ON ?auto_142105 ?auto_142104 ) ( ON ?auto_142106 ?auto_142105 ) ( ON ?auto_142107 ?auto_142106 ) ( ON ?auto_142108 ?auto_142107 ) ( not ( = ?auto_142103 ?auto_142104 ) ) ( not ( = ?auto_142103 ?auto_142105 ) ) ( not ( = ?auto_142103 ?auto_142106 ) ) ( not ( = ?auto_142103 ?auto_142107 ) ) ( not ( = ?auto_142103 ?auto_142108 ) ) ( not ( = ?auto_142103 ?auto_142109 ) ) ( not ( = ?auto_142103 ?auto_142110 ) ) ( not ( = ?auto_142103 ?auto_142111 ) ) ( not ( = ?auto_142104 ?auto_142105 ) ) ( not ( = ?auto_142104 ?auto_142106 ) ) ( not ( = ?auto_142104 ?auto_142107 ) ) ( not ( = ?auto_142104 ?auto_142108 ) ) ( not ( = ?auto_142104 ?auto_142109 ) ) ( not ( = ?auto_142104 ?auto_142110 ) ) ( not ( = ?auto_142104 ?auto_142111 ) ) ( not ( = ?auto_142105 ?auto_142106 ) ) ( not ( = ?auto_142105 ?auto_142107 ) ) ( not ( = ?auto_142105 ?auto_142108 ) ) ( not ( = ?auto_142105 ?auto_142109 ) ) ( not ( = ?auto_142105 ?auto_142110 ) ) ( not ( = ?auto_142105 ?auto_142111 ) ) ( not ( = ?auto_142106 ?auto_142107 ) ) ( not ( = ?auto_142106 ?auto_142108 ) ) ( not ( = ?auto_142106 ?auto_142109 ) ) ( not ( = ?auto_142106 ?auto_142110 ) ) ( not ( = ?auto_142106 ?auto_142111 ) ) ( not ( = ?auto_142107 ?auto_142108 ) ) ( not ( = ?auto_142107 ?auto_142109 ) ) ( not ( = ?auto_142107 ?auto_142110 ) ) ( not ( = ?auto_142107 ?auto_142111 ) ) ( not ( = ?auto_142108 ?auto_142109 ) ) ( not ( = ?auto_142108 ?auto_142110 ) ) ( not ( = ?auto_142108 ?auto_142111 ) ) ( not ( = ?auto_142109 ?auto_142110 ) ) ( not ( = ?auto_142109 ?auto_142111 ) ) ( not ( = ?auto_142110 ?auto_142111 ) ) ( CLEAR ?auto_142108 ) ( ON ?auto_142109 ?auto_142110 ) ( CLEAR ?auto_142109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142103 ?auto_142104 ?auto_142105 ?auto_142106 ?auto_142107 ?auto_142108 ?auto_142109 )
      ( MAKE-8PILE ?auto_142103 ?auto_142104 ?auto_142105 ?auto_142106 ?auto_142107 ?auto_142108 ?auto_142109 ?auto_142110 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142120 - BLOCK
      ?auto_142121 - BLOCK
      ?auto_142122 - BLOCK
      ?auto_142123 - BLOCK
      ?auto_142124 - BLOCK
      ?auto_142125 - BLOCK
      ?auto_142126 - BLOCK
      ?auto_142127 - BLOCK
    )
    :vars
    (
      ?auto_142128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142127 ?auto_142128 ) ( ON-TABLE ?auto_142120 ) ( ON ?auto_142121 ?auto_142120 ) ( ON ?auto_142122 ?auto_142121 ) ( ON ?auto_142123 ?auto_142122 ) ( ON ?auto_142124 ?auto_142123 ) ( not ( = ?auto_142120 ?auto_142121 ) ) ( not ( = ?auto_142120 ?auto_142122 ) ) ( not ( = ?auto_142120 ?auto_142123 ) ) ( not ( = ?auto_142120 ?auto_142124 ) ) ( not ( = ?auto_142120 ?auto_142125 ) ) ( not ( = ?auto_142120 ?auto_142126 ) ) ( not ( = ?auto_142120 ?auto_142127 ) ) ( not ( = ?auto_142120 ?auto_142128 ) ) ( not ( = ?auto_142121 ?auto_142122 ) ) ( not ( = ?auto_142121 ?auto_142123 ) ) ( not ( = ?auto_142121 ?auto_142124 ) ) ( not ( = ?auto_142121 ?auto_142125 ) ) ( not ( = ?auto_142121 ?auto_142126 ) ) ( not ( = ?auto_142121 ?auto_142127 ) ) ( not ( = ?auto_142121 ?auto_142128 ) ) ( not ( = ?auto_142122 ?auto_142123 ) ) ( not ( = ?auto_142122 ?auto_142124 ) ) ( not ( = ?auto_142122 ?auto_142125 ) ) ( not ( = ?auto_142122 ?auto_142126 ) ) ( not ( = ?auto_142122 ?auto_142127 ) ) ( not ( = ?auto_142122 ?auto_142128 ) ) ( not ( = ?auto_142123 ?auto_142124 ) ) ( not ( = ?auto_142123 ?auto_142125 ) ) ( not ( = ?auto_142123 ?auto_142126 ) ) ( not ( = ?auto_142123 ?auto_142127 ) ) ( not ( = ?auto_142123 ?auto_142128 ) ) ( not ( = ?auto_142124 ?auto_142125 ) ) ( not ( = ?auto_142124 ?auto_142126 ) ) ( not ( = ?auto_142124 ?auto_142127 ) ) ( not ( = ?auto_142124 ?auto_142128 ) ) ( not ( = ?auto_142125 ?auto_142126 ) ) ( not ( = ?auto_142125 ?auto_142127 ) ) ( not ( = ?auto_142125 ?auto_142128 ) ) ( not ( = ?auto_142126 ?auto_142127 ) ) ( not ( = ?auto_142126 ?auto_142128 ) ) ( not ( = ?auto_142127 ?auto_142128 ) ) ( ON ?auto_142126 ?auto_142127 ) ( CLEAR ?auto_142124 ) ( ON ?auto_142125 ?auto_142126 ) ( CLEAR ?auto_142125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142120 ?auto_142121 ?auto_142122 ?auto_142123 ?auto_142124 ?auto_142125 )
      ( MAKE-8PILE ?auto_142120 ?auto_142121 ?auto_142122 ?auto_142123 ?auto_142124 ?auto_142125 ?auto_142126 ?auto_142127 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142137 - BLOCK
      ?auto_142138 - BLOCK
      ?auto_142139 - BLOCK
      ?auto_142140 - BLOCK
      ?auto_142141 - BLOCK
      ?auto_142142 - BLOCK
      ?auto_142143 - BLOCK
      ?auto_142144 - BLOCK
    )
    :vars
    (
      ?auto_142145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142144 ?auto_142145 ) ( ON-TABLE ?auto_142137 ) ( ON ?auto_142138 ?auto_142137 ) ( ON ?auto_142139 ?auto_142138 ) ( ON ?auto_142140 ?auto_142139 ) ( ON ?auto_142141 ?auto_142140 ) ( not ( = ?auto_142137 ?auto_142138 ) ) ( not ( = ?auto_142137 ?auto_142139 ) ) ( not ( = ?auto_142137 ?auto_142140 ) ) ( not ( = ?auto_142137 ?auto_142141 ) ) ( not ( = ?auto_142137 ?auto_142142 ) ) ( not ( = ?auto_142137 ?auto_142143 ) ) ( not ( = ?auto_142137 ?auto_142144 ) ) ( not ( = ?auto_142137 ?auto_142145 ) ) ( not ( = ?auto_142138 ?auto_142139 ) ) ( not ( = ?auto_142138 ?auto_142140 ) ) ( not ( = ?auto_142138 ?auto_142141 ) ) ( not ( = ?auto_142138 ?auto_142142 ) ) ( not ( = ?auto_142138 ?auto_142143 ) ) ( not ( = ?auto_142138 ?auto_142144 ) ) ( not ( = ?auto_142138 ?auto_142145 ) ) ( not ( = ?auto_142139 ?auto_142140 ) ) ( not ( = ?auto_142139 ?auto_142141 ) ) ( not ( = ?auto_142139 ?auto_142142 ) ) ( not ( = ?auto_142139 ?auto_142143 ) ) ( not ( = ?auto_142139 ?auto_142144 ) ) ( not ( = ?auto_142139 ?auto_142145 ) ) ( not ( = ?auto_142140 ?auto_142141 ) ) ( not ( = ?auto_142140 ?auto_142142 ) ) ( not ( = ?auto_142140 ?auto_142143 ) ) ( not ( = ?auto_142140 ?auto_142144 ) ) ( not ( = ?auto_142140 ?auto_142145 ) ) ( not ( = ?auto_142141 ?auto_142142 ) ) ( not ( = ?auto_142141 ?auto_142143 ) ) ( not ( = ?auto_142141 ?auto_142144 ) ) ( not ( = ?auto_142141 ?auto_142145 ) ) ( not ( = ?auto_142142 ?auto_142143 ) ) ( not ( = ?auto_142142 ?auto_142144 ) ) ( not ( = ?auto_142142 ?auto_142145 ) ) ( not ( = ?auto_142143 ?auto_142144 ) ) ( not ( = ?auto_142143 ?auto_142145 ) ) ( not ( = ?auto_142144 ?auto_142145 ) ) ( ON ?auto_142143 ?auto_142144 ) ( CLEAR ?auto_142141 ) ( ON ?auto_142142 ?auto_142143 ) ( CLEAR ?auto_142142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142137 ?auto_142138 ?auto_142139 ?auto_142140 ?auto_142141 ?auto_142142 )
      ( MAKE-8PILE ?auto_142137 ?auto_142138 ?auto_142139 ?auto_142140 ?auto_142141 ?auto_142142 ?auto_142143 ?auto_142144 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142154 - BLOCK
      ?auto_142155 - BLOCK
      ?auto_142156 - BLOCK
      ?auto_142157 - BLOCK
      ?auto_142158 - BLOCK
      ?auto_142159 - BLOCK
      ?auto_142160 - BLOCK
      ?auto_142161 - BLOCK
    )
    :vars
    (
      ?auto_142162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142161 ?auto_142162 ) ( ON-TABLE ?auto_142154 ) ( ON ?auto_142155 ?auto_142154 ) ( ON ?auto_142156 ?auto_142155 ) ( ON ?auto_142157 ?auto_142156 ) ( not ( = ?auto_142154 ?auto_142155 ) ) ( not ( = ?auto_142154 ?auto_142156 ) ) ( not ( = ?auto_142154 ?auto_142157 ) ) ( not ( = ?auto_142154 ?auto_142158 ) ) ( not ( = ?auto_142154 ?auto_142159 ) ) ( not ( = ?auto_142154 ?auto_142160 ) ) ( not ( = ?auto_142154 ?auto_142161 ) ) ( not ( = ?auto_142154 ?auto_142162 ) ) ( not ( = ?auto_142155 ?auto_142156 ) ) ( not ( = ?auto_142155 ?auto_142157 ) ) ( not ( = ?auto_142155 ?auto_142158 ) ) ( not ( = ?auto_142155 ?auto_142159 ) ) ( not ( = ?auto_142155 ?auto_142160 ) ) ( not ( = ?auto_142155 ?auto_142161 ) ) ( not ( = ?auto_142155 ?auto_142162 ) ) ( not ( = ?auto_142156 ?auto_142157 ) ) ( not ( = ?auto_142156 ?auto_142158 ) ) ( not ( = ?auto_142156 ?auto_142159 ) ) ( not ( = ?auto_142156 ?auto_142160 ) ) ( not ( = ?auto_142156 ?auto_142161 ) ) ( not ( = ?auto_142156 ?auto_142162 ) ) ( not ( = ?auto_142157 ?auto_142158 ) ) ( not ( = ?auto_142157 ?auto_142159 ) ) ( not ( = ?auto_142157 ?auto_142160 ) ) ( not ( = ?auto_142157 ?auto_142161 ) ) ( not ( = ?auto_142157 ?auto_142162 ) ) ( not ( = ?auto_142158 ?auto_142159 ) ) ( not ( = ?auto_142158 ?auto_142160 ) ) ( not ( = ?auto_142158 ?auto_142161 ) ) ( not ( = ?auto_142158 ?auto_142162 ) ) ( not ( = ?auto_142159 ?auto_142160 ) ) ( not ( = ?auto_142159 ?auto_142161 ) ) ( not ( = ?auto_142159 ?auto_142162 ) ) ( not ( = ?auto_142160 ?auto_142161 ) ) ( not ( = ?auto_142160 ?auto_142162 ) ) ( not ( = ?auto_142161 ?auto_142162 ) ) ( ON ?auto_142160 ?auto_142161 ) ( ON ?auto_142159 ?auto_142160 ) ( CLEAR ?auto_142157 ) ( ON ?auto_142158 ?auto_142159 ) ( CLEAR ?auto_142158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142154 ?auto_142155 ?auto_142156 ?auto_142157 ?auto_142158 )
      ( MAKE-8PILE ?auto_142154 ?auto_142155 ?auto_142156 ?auto_142157 ?auto_142158 ?auto_142159 ?auto_142160 ?auto_142161 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142171 - BLOCK
      ?auto_142172 - BLOCK
      ?auto_142173 - BLOCK
      ?auto_142174 - BLOCK
      ?auto_142175 - BLOCK
      ?auto_142176 - BLOCK
      ?auto_142177 - BLOCK
      ?auto_142178 - BLOCK
    )
    :vars
    (
      ?auto_142179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142178 ?auto_142179 ) ( ON-TABLE ?auto_142171 ) ( ON ?auto_142172 ?auto_142171 ) ( ON ?auto_142173 ?auto_142172 ) ( ON ?auto_142174 ?auto_142173 ) ( not ( = ?auto_142171 ?auto_142172 ) ) ( not ( = ?auto_142171 ?auto_142173 ) ) ( not ( = ?auto_142171 ?auto_142174 ) ) ( not ( = ?auto_142171 ?auto_142175 ) ) ( not ( = ?auto_142171 ?auto_142176 ) ) ( not ( = ?auto_142171 ?auto_142177 ) ) ( not ( = ?auto_142171 ?auto_142178 ) ) ( not ( = ?auto_142171 ?auto_142179 ) ) ( not ( = ?auto_142172 ?auto_142173 ) ) ( not ( = ?auto_142172 ?auto_142174 ) ) ( not ( = ?auto_142172 ?auto_142175 ) ) ( not ( = ?auto_142172 ?auto_142176 ) ) ( not ( = ?auto_142172 ?auto_142177 ) ) ( not ( = ?auto_142172 ?auto_142178 ) ) ( not ( = ?auto_142172 ?auto_142179 ) ) ( not ( = ?auto_142173 ?auto_142174 ) ) ( not ( = ?auto_142173 ?auto_142175 ) ) ( not ( = ?auto_142173 ?auto_142176 ) ) ( not ( = ?auto_142173 ?auto_142177 ) ) ( not ( = ?auto_142173 ?auto_142178 ) ) ( not ( = ?auto_142173 ?auto_142179 ) ) ( not ( = ?auto_142174 ?auto_142175 ) ) ( not ( = ?auto_142174 ?auto_142176 ) ) ( not ( = ?auto_142174 ?auto_142177 ) ) ( not ( = ?auto_142174 ?auto_142178 ) ) ( not ( = ?auto_142174 ?auto_142179 ) ) ( not ( = ?auto_142175 ?auto_142176 ) ) ( not ( = ?auto_142175 ?auto_142177 ) ) ( not ( = ?auto_142175 ?auto_142178 ) ) ( not ( = ?auto_142175 ?auto_142179 ) ) ( not ( = ?auto_142176 ?auto_142177 ) ) ( not ( = ?auto_142176 ?auto_142178 ) ) ( not ( = ?auto_142176 ?auto_142179 ) ) ( not ( = ?auto_142177 ?auto_142178 ) ) ( not ( = ?auto_142177 ?auto_142179 ) ) ( not ( = ?auto_142178 ?auto_142179 ) ) ( ON ?auto_142177 ?auto_142178 ) ( ON ?auto_142176 ?auto_142177 ) ( CLEAR ?auto_142174 ) ( ON ?auto_142175 ?auto_142176 ) ( CLEAR ?auto_142175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142171 ?auto_142172 ?auto_142173 ?auto_142174 ?auto_142175 )
      ( MAKE-8PILE ?auto_142171 ?auto_142172 ?auto_142173 ?auto_142174 ?auto_142175 ?auto_142176 ?auto_142177 ?auto_142178 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142188 - BLOCK
      ?auto_142189 - BLOCK
      ?auto_142190 - BLOCK
      ?auto_142191 - BLOCK
      ?auto_142192 - BLOCK
      ?auto_142193 - BLOCK
      ?auto_142194 - BLOCK
      ?auto_142195 - BLOCK
    )
    :vars
    (
      ?auto_142196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142195 ?auto_142196 ) ( ON-TABLE ?auto_142188 ) ( ON ?auto_142189 ?auto_142188 ) ( ON ?auto_142190 ?auto_142189 ) ( not ( = ?auto_142188 ?auto_142189 ) ) ( not ( = ?auto_142188 ?auto_142190 ) ) ( not ( = ?auto_142188 ?auto_142191 ) ) ( not ( = ?auto_142188 ?auto_142192 ) ) ( not ( = ?auto_142188 ?auto_142193 ) ) ( not ( = ?auto_142188 ?auto_142194 ) ) ( not ( = ?auto_142188 ?auto_142195 ) ) ( not ( = ?auto_142188 ?auto_142196 ) ) ( not ( = ?auto_142189 ?auto_142190 ) ) ( not ( = ?auto_142189 ?auto_142191 ) ) ( not ( = ?auto_142189 ?auto_142192 ) ) ( not ( = ?auto_142189 ?auto_142193 ) ) ( not ( = ?auto_142189 ?auto_142194 ) ) ( not ( = ?auto_142189 ?auto_142195 ) ) ( not ( = ?auto_142189 ?auto_142196 ) ) ( not ( = ?auto_142190 ?auto_142191 ) ) ( not ( = ?auto_142190 ?auto_142192 ) ) ( not ( = ?auto_142190 ?auto_142193 ) ) ( not ( = ?auto_142190 ?auto_142194 ) ) ( not ( = ?auto_142190 ?auto_142195 ) ) ( not ( = ?auto_142190 ?auto_142196 ) ) ( not ( = ?auto_142191 ?auto_142192 ) ) ( not ( = ?auto_142191 ?auto_142193 ) ) ( not ( = ?auto_142191 ?auto_142194 ) ) ( not ( = ?auto_142191 ?auto_142195 ) ) ( not ( = ?auto_142191 ?auto_142196 ) ) ( not ( = ?auto_142192 ?auto_142193 ) ) ( not ( = ?auto_142192 ?auto_142194 ) ) ( not ( = ?auto_142192 ?auto_142195 ) ) ( not ( = ?auto_142192 ?auto_142196 ) ) ( not ( = ?auto_142193 ?auto_142194 ) ) ( not ( = ?auto_142193 ?auto_142195 ) ) ( not ( = ?auto_142193 ?auto_142196 ) ) ( not ( = ?auto_142194 ?auto_142195 ) ) ( not ( = ?auto_142194 ?auto_142196 ) ) ( not ( = ?auto_142195 ?auto_142196 ) ) ( ON ?auto_142194 ?auto_142195 ) ( ON ?auto_142193 ?auto_142194 ) ( ON ?auto_142192 ?auto_142193 ) ( CLEAR ?auto_142190 ) ( ON ?auto_142191 ?auto_142192 ) ( CLEAR ?auto_142191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142188 ?auto_142189 ?auto_142190 ?auto_142191 )
      ( MAKE-8PILE ?auto_142188 ?auto_142189 ?auto_142190 ?auto_142191 ?auto_142192 ?auto_142193 ?auto_142194 ?auto_142195 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142205 - BLOCK
      ?auto_142206 - BLOCK
      ?auto_142207 - BLOCK
      ?auto_142208 - BLOCK
      ?auto_142209 - BLOCK
      ?auto_142210 - BLOCK
      ?auto_142211 - BLOCK
      ?auto_142212 - BLOCK
    )
    :vars
    (
      ?auto_142213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142212 ?auto_142213 ) ( ON-TABLE ?auto_142205 ) ( ON ?auto_142206 ?auto_142205 ) ( ON ?auto_142207 ?auto_142206 ) ( not ( = ?auto_142205 ?auto_142206 ) ) ( not ( = ?auto_142205 ?auto_142207 ) ) ( not ( = ?auto_142205 ?auto_142208 ) ) ( not ( = ?auto_142205 ?auto_142209 ) ) ( not ( = ?auto_142205 ?auto_142210 ) ) ( not ( = ?auto_142205 ?auto_142211 ) ) ( not ( = ?auto_142205 ?auto_142212 ) ) ( not ( = ?auto_142205 ?auto_142213 ) ) ( not ( = ?auto_142206 ?auto_142207 ) ) ( not ( = ?auto_142206 ?auto_142208 ) ) ( not ( = ?auto_142206 ?auto_142209 ) ) ( not ( = ?auto_142206 ?auto_142210 ) ) ( not ( = ?auto_142206 ?auto_142211 ) ) ( not ( = ?auto_142206 ?auto_142212 ) ) ( not ( = ?auto_142206 ?auto_142213 ) ) ( not ( = ?auto_142207 ?auto_142208 ) ) ( not ( = ?auto_142207 ?auto_142209 ) ) ( not ( = ?auto_142207 ?auto_142210 ) ) ( not ( = ?auto_142207 ?auto_142211 ) ) ( not ( = ?auto_142207 ?auto_142212 ) ) ( not ( = ?auto_142207 ?auto_142213 ) ) ( not ( = ?auto_142208 ?auto_142209 ) ) ( not ( = ?auto_142208 ?auto_142210 ) ) ( not ( = ?auto_142208 ?auto_142211 ) ) ( not ( = ?auto_142208 ?auto_142212 ) ) ( not ( = ?auto_142208 ?auto_142213 ) ) ( not ( = ?auto_142209 ?auto_142210 ) ) ( not ( = ?auto_142209 ?auto_142211 ) ) ( not ( = ?auto_142209 ?auto_142212 ) ) ( not ( = ?auto_142209 ?auto_142213 ) ) ( not ( = ?auto_142210 ?auto_142211 ) ) ( not ( = ?auto_142210 ?auto_142212 ) ) ( not ( = ?auto_142210 ?auto_142213 ) ) ( not ( = ?auto_142211 ?auto_142212 ) ) ( not ( = ?auto_142211 ?auto_142213 ) ) ( not ( = ?auto_142212 ?auto_142213 ) ) ( ON ?auto_142211 ?auto_142212 ) ( ON ?auto_142210 ?auto_142211 ) ( ON ?auto_142209 ?auto_142210 ) ( CLEAR ?auto_142207 ) ( ON ?auto_142208 ?auto_142209 ) ( CLEAR ?auto_142208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142205 ?auto_142206 ?auto_142207 ?auto_142208 )
      ( MAKE-8PILE ?auto_142205 ?auto_142206 ?auto_142207 ?auto_142208 ?auto_142209 ?auto_142210 ?auto_142211 ?auto_142212 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142222 - BLOCK
      ?auto_142223 - BLOCK
      ?auto_142224 - BLOCK
      ?auto_142225 - BLOCK
      ?auto_142226 - BLOCK
      ?auto_142227 - BLOCK
      ?auto_142228 - BLOCK
      ?auto_142229 - BLOCK
    )
    :vars
    (
      ?auto_142230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142229 ?auto_142230 ) ( ON-TABLE ?auto_142222 ) ( ON ?auto_142223 ?auto_142222 ) ( not ( = ?auto_142222 ?auto_142223 ) ) ( not ( = ?auto_142222 ?auto_142224 ) ) ( not ( = ?auto_142222 ?auto_142225 ) ) ( not ( = ?auto_142222 ?auto_142226 ) ) ( not ( = ?auto_142222 ?auto_142227 ) ) ( not ( = ?auto_142222 ?auto_142228 ) ) ( not ( = ?auto_142222 ?auto_142229 ) ) ( not ( = ?auto_142222 ?auto_142230 ) ) ( not ( = ?auto_142223 ?auto_142224 ) ) ( not ( = ?auto_142223 ?auto_142225 ) ) ( not ( = ?auto_142223 ?auto_142226 ) ) ( not ( = ?auto_142223 ?auto_142227 ) ) ( not ( = ?auto_142223 ?auto_142228 ) ) ( not ( = ?auto_142223 ?auto_142229 ) ) ( not ( = ?auto_142223 ?auto_142230 ) ) ( not ( = ?auto_142224 ?auto_142225 ) ) ( not ( = ?auto_142224 ?auto_142226 ) ) ( not ( = ?auto_142224 ?auto_142227 ) ) ( not ( = ?auto_142224 ?auto_142228 ) ) ( not ( = ?auto_142224 ?auto_142229 ) ) ( not ( = ?auto_142224 ?auto_142230 ) ) ( not ( = ?auto_142225 ?auto_142226 ) ) ( not ( = ?auto_142225 ?auto_142227 ) ) ( not ( = ?auto_142225 ?auto_142228 ) ) ( not ( = ?auto_142225 ?auto_142229 ) ) ( not ( = ?auto_142225 ?auto_142230 ) ) ( not ( = ?auto_142226 ?auto_142227 ) ) ( not ( = ?auto_142226 ?auto_142228 ) ) ( not ( = ?auto_142226 ?auto_142229 ) ) ( not ( = ?auto_142226 ?auto_142230 ) ) ( not ( = ?auto_142227 ?auto_142228 ) ) ( not ( = ?auto_142227 ?auto_142229 ) ) ( not ( = ?auto_142227 ?auto_142230 ) ) ( not ( = ?auto_142228 ?auto_142229 ) ) ( not ( = ?auto_142228 ?auto_142230 ) ) ( not ( = ?auto_142229 ?auto_142230 ) ) ( ON ?auto_142228 ?auto_142229 ) ( ON ?auto_142227 ?auto_142228 ) ( ON ?auto_142226 ?auto_142227 ) ( ON ?auto_142225 ?auto_142226 ) ( CLEAR ?auto_142223 ) ( ON ?auto_142224 ?auto_142225 ) ( CLEAR ?auto_142224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142222 ?auto_142223 ?auto_142224 )
      ( MAKE-8PILE ?auto_142222 ?auto_142223 ?auto_142224 ?auto_142225 ?auto_142226 ?auto_142227 ?auto_142228 ?auto_142229 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142239 - BLOCK
      ?auto_142240 - BLOCK
      ?auto_142241 - BLOCK
      ?auto_142242 - BLOCK
      ?auto_142243 - BLOCK
      ?auto_142244 - BLOCK
      ?auto_142245 - BLOCK
      ?auto_142246 - BLOCK
    )
    :vars
    (
      ?auto_142247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142246 ?auto_142247 ) ( ON-TABLE ?auto_142239 ) ( ON ?auto_142240 ?auto_142239 ) ( not ( = ?auto_142239 ?auto_142240 ) ) ( not ( = ?auto_142239 ?auto_142241 ) ) ( not ( = ?auto_142239 ?auto_142242 ) ) ( not ( = ?auto_142239 ?auto_142243 ) ) ( not ( = ?auto_142239 ?auto_142244 ) ) ( not ( = ?auto_142239 ?auto_142245 ) ) ( not ( = ?auto_142239 ?auto_142246 ) ) ( not ( = ?auto_142239 ?auto_142247 ) ) ( not ( = ?auto_142240 ?auto_142241 ) ) ( not ( = ?auto_142240 ?auto_142242 ) ) ( not ( = ?auto_142240 ?auto_142243 ) ) ( not ( = ?auto_142240 ?auto_142244 ) ) ( not ( = ?auto_142240 ?auto_142245 ) ) ( not ( = ?auto_142240 ?auto_142246 ) ) ( not ( = ?auto_142240 ?auto_142247 ) ) ( not ( = ?auto_142241 ?auto_142242 ) ) ( not ( = ?auto_142241 ?auto_142243 ) ) ( not ( = ?auto_142241 ?auto_142244 ) ) ( not ( = ?auto_142241 ?auto_142245 ) ) ( not ( = ?auto_142241 ?auto_142246 ) ) ( not ( = ?auto_142241 ?auto_142247 ) ) ( not ( = ?auto_142242 ?auto_142243 ) ) ( not ( = ?auto_142242 ?auto_142244 ) ) ( not ( = ?auto_142242 ?auto_142245 ) ) ( not ( = ?auto_142242 ?auto_142246 ) ) ( not ( = ?auto_142242 ?auto_142247 ) ) ( not ( = ?auto_142243 ?auto_142244 ) ) ( not ( = ?auto_142243 ?auto_142245 ) ) ( not ( = ?auto_142243 ?auto_142246 ) ) ( not ( = ?auto_142243 ?auto_142247 ) ) ( not ( = ?auto_142244 ?auto_142245 ) ) ( not ( = ?auto_142244 ?auto_142246 ) ) ( not ( = ?auto_142244 ?auto_142247 ) ) ( not ( = ?auto_142245 ?auto_142246 ) ) ( not ( = ?auto_142245 ?auto_142247 ) ) ( not ( = ?auto_142246 ?auto_142247 ) ) ( ON ?auto_142245 ?auto_142246 ) ( ON ?auto_142244 ?auto_142245 ) ( ON ?auto_142243 ?auto_142244 ) ( ON ?auto_142242 ?auto_142243 ) ( CLEAR ?auto_142240 ) ( ON ?auto_142241 ?auto_142242 ) ( CLEAR ?auto_142241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142239 ?auto_142240 ?auto_142241 )
      ( MAKE-8PILE ?auto_142239 ?auto_142240 ?auto_142241 ?auto_142242 ?auto_142243 ?auto_142244 ?auto_142245 ?auto_142246 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142256 - BLOCK
      ?auto_142257 - BLOCK
      ?auto_142258 - BLOCK
      ?auto_142259 - BLOCK
      ?auto_142260 - BLOCK
      ?auto_142261 - BLOCK
      ?auto_142262 - BLOCK
      ?auto_142263 - BLOCK
    )
    :vars
    (
      ?auto_142264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142263 ?auto_142264 ) ( ON-TABLE ?auto_142256 ) ( not ( = ?auto_142256 ?auto_142257 ) ) ( not ( = ?auto_142256 ?auto_142258 ) ) ( not ( = ?auto_142256 ?auto_142259 ) ) ( not ( = ?auto_142256 ?auto_142260 ) ) ( not ( = ?auto_142256 ?auto_142261 ) ) ( not ( = ?auto_142256 ?auto_142262 ) ) ( not ( = ?auto_142256 ?auto_142263 ) ) ( not ( = ?auto_142256 ?auto_142264 ) ) ( not ( = ?auto_142257 ?auto_142258 ) ) ( not ( = ?auto_142257 ?auto_142259 ) ) ( not ( = ?auto_142257 ?auto_142260 ) ) ( not ( = ?auto_142257 ?auto_142261 ) ) ( not ( = ?auto_142257 ?auto_142262 ) ) ( not ( = ?auto_142257 ?auto_142263 ) ) ( not ( = ?auto_142257 ?auto_142264 ) ) ( not ( = ?auto_142258 ?auto_142259 ) ) ( not ( = ?auto_142258 ?auto_142260 ) ) ( not ( = ?auto_142258 ?auto_142261 ) ) ( not ( = ?auto_142258 ?auto_142262 ) ) ( not ( = ?auto_142258 ?auto_142263 ) ) ( not ( = ?auto_142258 ?auto_142264 ) ) ( not ( = ?auto_142259 ?auto_142260 ) ) ( not ( = ?auto_142259 ?auto_142261 ) ) ( not ( = ?auto_142259 ?auto_142262 ) ) ( not ( = ?auto_142259 ?auto_142263 ) ) ( not ( = ?auto_142259 ?auto_142264 ) ) ( not ( = ?auto_142260 ?auto_142261 ) ) ( not ( = ?auto_142260 ?auto_142262 ) ) ( not ( = ?auto_142260 ?auto_142263 ) ) ( not ( = ?auto_142260 ?auto_142264 ) ) ( not ( = ?auto_142261 ?auto_142262 ) ) ( not ( = ?auto_142261 ?auto_142263 ) ) ( not ( = ?auto_142261 ?auto_142264 ) ) ( not ( = ?auto_142262 ?auto_142263 ) ) ( not ( = ?auto_142262 ?auto_142264 ) ) ( not ( = ?auto_142263 ?auto_142264 ) ) ( ON ?auto_142262 ?auto_142263 ) ( ON ?auto_142261 ?auto_142262 ) ( ON ?auto_142260 ?auto_142261 ) ( ON ?auto_142259 ?auto_142260 ) ( ON ?auto_142258 ?auto_142259 ) ( CLEAR ?auto_142256 ) ( ON ?auto_142257 ?auto_142258 ) ( CLEAR ?auto_142257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142256 ?auto_142257 )
      ( MAKE-8PILE ?auto_142256 ?auto_142257 ?auto_142258 ?auto_142259 ?auto_142260 ?auto_142261 ?auto_142262 ?auto_142263 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142273 - BLOCK
      ?auto_142274 - BLOCK
      ?auto_142275 - BLOCK
      ?auto_142276 - BLOCK
      ?auto_142277 - BLOCK
      ?auto_142278 - BLOCK
      ?auto_142279 - BLOCK
      ?auto_142280 - BLOCK
    )
    :vars
    (
      ?auto_142281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142280 ?auto_142281 ) ( ON-TABLE ?auto_142273 ) ( not ( = ?auto_142273 ?auto_142274 ) ) ( not ( = ?auto_142273 ?auto_142275 ) ) ( not ( = ?auto_142273 ?auto_142276 ) ) ( not ( = ?auto_142273 ?auto_142277 ) ) ( not ( = ?auto_142273 ?auto_142278 ) ) ( not ( = ?auto_142273 ?auto_142279 ) ) ( not ( = ?auto_142273 ?auto_142280 ) ) ( not ( = ?auto_142273 ?auto_142281 ) ) ( not ( = ?auto_142274 ?auto_142275 ) ) ( not ( = ?auto_142274 ?auto_142276 ) ) ( not ( = ?auto_142274 ?auto_142277 ) ) ( not ( = ?auto_142274 ?auto_142278 ) ) ( not ( = ?auto_142274 ?auto_142279 ) ) ( not ( = ?auto_142274 ?auto_142280 ) ) ( not ( = ?auto_142274 ?auto_142281 ) ) ( not ( = ?auto_142275 ?auto_142276 ) ) ( not ( = ?auto_142275 ?auto_142277 ) ) ( not ( = ?auto_142275 ?auto_142278 ) ) ( not ( = ?auto_142275 ?auto_142279 ) ) ( not ( = ?auto_142275 ?auto_142280 ) ) ( not ( = ?auto_142275 ?auto_142281 ) ) ( not ( = ?auto_142276 ?auto_142277 ) ) ( not ( = ?auto_142276 ?auto_142278 ) ) ( not ( = ?auto_142276 ?auto_142279 ) ) ( not ( = ?auto_142276 ?auto_142280 ) ) ( not ( = ?auto_142276 ?auto_142281 ) ) ( not ( = ?auto_142277 ?auto_142278 ) ) ( not ( = ?auto_142277 ?auto_142279 ) ) ( not ( = ?auto_142277 ?auto_142280 ) ) ( not ( = ?auto_142277 ?auto_142281 ) ) ( not ( = ?auto_142278 ?auto_142279 ) ) ( not ( = ?auto_142278 ?auto_142280 ) ) ( not ( = ?auto_142278 ?auto_142281 ) ) ( not ( = ?auto_142279 ?auto_142280 ) ) ( not ( = ?auto_142279 ?auto_142281 ) ) ( not ( = ?auto_142280 ?auto_142281 ) ) ( ON ?auto_142279 ?auto_142280 ) ( ON ?auto_142278 ?auto_142279 ) ( ON ?auto_142277 ?auto_142278 ) ( ON ?auto_142276 ?auto_142277 ) ( ON ?auto_142275 ?auto_142276 ) ( CLEAR ?auto_142273 ) ( ON ?auto_142274 ?auto_142275 ) ( CLEAR ?auto_142274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142273 ?auto_142274 )
      ( MAKE-8PILE ?auto_142273 ?auto_142274 ?auto_142275 ?auto_142276 ?auto_142277 ?auto_142278 ?auto_142279 ?auto_142280 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142290 - BLOCK
      ?auto_142291 - BLOCK
      ?auto_142292 - BLOCK
      ?auto_142293 - BLOCK
      ?auto_142294 - BLOCK
      ?auto_142295 - BLOCK
      ?auto_142296 - BLOCK
      ?auto_142297 - BLOCK
    )
    :vars
    (
      ?auto_142298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142297 ?auto_142298 ) ( not ( = ?auto_142290 ?auto_142291 ) ) ( not ( = ?auto_142290 ?auto_142292 ) ) ( not ( = ?auto_142290 ?auto_142293 ) ) ( not ( = ?auto_142290 ?auto_142294 ) ) ( not ( = ?auto_142290 ?auto_142295 ) ) ( not ( = ?auto_142290 ?auto_142296 ) ) ( not ( = ?auto_142290 ?auto_142297 ) ) ( not ( = ?auto_142290 ?auto_142298 ) ) ( not ( = ?auto_142291 ?auto_142292 ) ) ( not ( = ?auto_142291 ?auto_142293 ) ) ( not ( = ?auto_142291 ?auto_142294 ) ) ( not ( = ?auto_142291 ?auto_142295 ) ) ( not ( = ?auto_142291 ?auto_142296 ) ) ( not ( = ?auto_142291 ?auto_142297 ) ) ( not ( = ?auto_142291 ?auto_142298 ) ) ( not ( = ?auto_142292 ?auto_142293 ) ) ( not ( = ?auto_142292 ?auto_142294 ) ) ( not ( = ?auto_142292 ?auto_142295 ) ) ( not ( = ?auto_142292 ?auto_142296 ) ) ( not ( = ?auto_142292 ?auto_142297 ) ) ( not ( = ?auto_142292 ?auto_142298 ) ) ( not ( = ?auto_142293 ?auto_142294 ) ) ( not ( = ?auto_142293 ?auto_142295 ) ) ( not ( = ?auto_142293 ?auto_142296 ) ) ( not ( = ?auto_142293 ?auto_142297 ) ) ( not ( = ?auto_142293 ?auto_142298 ) ) ( not ( = ?auto_142294 ?auto_142295 ) ) ( not ( = ?auto_142294 ?auto_142296 ) ) ( not ( = ?auto_142294 ?auto_142297 ) ) ( not ( = ?auto_142294 ?auto_142298 ) ) ( not ( = ?auto_142295 ?auto_142296 ) ) ( not ( = ?auto_142295 ?auto_142297 ) ) ( not ( = ?auto_142295 ?auto_142298 ) ) ( not ( = ?auto_142296 ?auto_142297 ) ) ( not ( = ?auto_142296 ?auto_142298 ) ) ( not ( = ?auto_142297 ?auto_142298 ) ) ( ON ?auto_142296 ?auto_142297 ) ( ON ?auto_142295 ?auto_142296 ) ( ON ?auto_142294 ?auto_142295 ) ( ON ?auto_142293 ?auto_142294 ) ( ON ?auto_142292 ?auto_142293 ) ( ON ?auto_142291 ?auto_142292 ) ( ON ?auto_142290 ?auto_142291 ) ( CLEAR ?auto_142290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142290 )
      ( MAKE-8PILE ?auto_142290 ?auto_142291 ?auto_142292 ?auto_142293 ?auto_142294 ?auto_142295 ?auto_142296 ?auto_142297 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142307 - BLOCK
      ?auto_142308 - BLOCK
      ?auto_142309 - BLOCK
      ?auto_142310 - BLOCK
      ?auto_142311 - BLOCK
      ?auto_142312 - BLOCK
      ?auto_142313 - BLOCK
      ?auto_142314 - BLOCK
    )
    :vars
    (
      ?auto_142315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142314 ?auto_142315 ) ( not ( = ?auto_142307 ?auto_142308 ) ) ( not ( = ?auto_142307 ?auto_142309 ) ) ( not ( = ?auto_142307 ?auto_142310 ) ) ( not ( = ?auto_142307 ?auto_142311 ) ) ( not ( = ?auto_142307 ?auto_142312 ) ) ( not ( = ?auto_142307 ?auto_142313 ) ) ( not ( = ?auto_142307 ?auto_142314 ) ) ( not ( = ?auto_142307 ?auto_142315 ) ) ( not ( = ?auto_142308 ?auto_142309 ) ) ( not ( = ?auto_142308 ?auto_142310 ) ) ( not ( = ?auto_142308 ?auto_142311 ) ) ( not ( = ?auto_142308 ?auto_142312 ) ) ( not ( = ?auto_142308 ?auto_142313 ) ) ( not ( = ?auto_142308 ?auto_142314 ) ) ( not ( = ?auto_142308 ?auto_142315 ) ) ( not ( = ?auto_142309 ?auto_142310 ) ) ( not ( = ?auto_142309 ?auto_142311 ) ) ( not ( = ?auto_142309 ?auto_142312 ) ) ( not ( = ?auto_142309 ?auto_142313 ) ) ( not ( = ?auto_142309 ?auto_142314 ) ) ( not ( = ?auto_142309 ?auto_142315 ) ) ( not ( = ?auto_142310 ?auto_142311 ) ) ( not ( = ?auto_142310 ?auto_142312 ) ) ( not ( = ?auto_142310 ?auto_142313 ) ) ( not ( = ?auto_142310 ?auto_142314 ) ) ( not ( = ?auto_142310 ?auto_142315 ) ) ( not ( = ?auto_142311 ?auto_142312 ) ) ( not ( = ?auto_142311 ?auto_142313 ) ) ( not ( = ?auto_142311 ?auto_142314 ) ) ( not ( = ?auto_142311 ?auto_142315 ) ) ( not ( = ?auto_142312 ?auto_142313 ) ) ( not ( = ?auto_142312 ?auto_142314 ) ) ( not ( = ?auto_142312 ?auto_142315 ) ) ( not ( = ?auto_142313 ?auto_142314 ) ) ( not ( = ?auto_142313 ?auto_142315 ) ) ( not ( = ?auto_142314 ?auto_142315 ) ) ( ON ?auto_142313 ?auto_142314 ) ( ON ?auto_142312 ?auto_142313 ) ( ON ?auto_142311 ?auto_142312 ) ( ON ?auto_142310 ?auto_142311 ) ( ON ?auto_142309 ?auto_142310 ) ( ON ?auto_142308 ?auto_142309 ) ( ON ?auto_142307 ?auto_142308 ) ( CLEAR ?auto_142307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142307 )
      ( MAKE-8PILE ?auto_142307 ?auto_142308 ?auto_142309 ?auto_142310 ?auto_142311 ?auto_142312 ?auto_142313 ?auto_142314 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142325 - BLOCK
      ?auto_142326 - BLOCK
      ?auto_142327 - BLOCK
      ?auto_142328 - BLOCK
      ?auto_142329 - BLOCK
      ?auto_142330 - BLOCK
      ?auto_142331 - BLOCK
      ?auto_142332 - BLOCK
      ?auto_142333 - BLOCK
    )
    :vars
    (
      ?auto_142334 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_142332 ) ( ON ?auto_142333 ?auto_142334 ) ( CLEAR ?auto_142333 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142325 ) ( ON ?auto_142326 ?auto_142325 ) ( ON ?auto_142327 ?auto_142326 ) ( ON ?auto_142328 ?auto_142327 ) ( ON ?auto_142329 ?auto_142328 ) ( ON ?auto_142330 ?auto_142329 ) ( ON ?auto_142331 ?auto_142330 ) ( ON ?auto_142332 ?auto_142331 ) ( not ( = ?auto_142325 ?auto_142326 ) ) ( not ( = ?auto_142325 ?auto_142327 ) ) ( not ( = ?auto_142325 ?auto_142328 ) ) ( not ( = ?auto_142325 ?auto_142329 ) ) ( not ( = ?auto_142325 ?auto_142330 ) ) ( not ( = ?auto_142325 ?auto_142331 ) ) ( not ( = ?auto_142325 ?auto_142332 ) ) ( not ( = ?auto_142325 ?auto_142333 ) ) ( not ( = ?auto_142325 ?auto_142334 ) ) ( not ( = ?auto_142326 ?auto_142327 ) ) ( not ( = ?auto_142326 ?auto_142328 ) ) ( not ( = ?auto_142326 ?auto_142329 ) ) ( not ( = ?auto_142326 ?auto_142330 ) ) ( not ( = ?auto_142326 ?auto_142331 ) ) ( not ( = ?auto_142326 ?auto_142332 ) ) ( not ( = ?auto_142326 ?auto_142333 ) ) ( not ( = ?auto_142326 ?auto_142334 ) ) ( not ( = ?auto_142327 ?auto_142328 ) ) ( not ( = ?auto_142327 ?auto_142329 ) ) ( not ( = ?auto_142327 ?auto_142330 ) ) ( not ( = ?auto_142327 ?auto_142331 ) ) ( not ( = ?auto_142327 ?auto_142332 ) ) ( not ( = ?auto_142327 ?auto_142333 ) ) ( not ( = ?auto_142327 ?auto_142334 ) ) ( not ( = ?auto_142328 ?auto_142329 ) ) ( not ( = ?auto_142328 ?auto_142330 ) ) ( not ( = ?auto_142328 ?auto_142331 ) ) ( not ( = ?auto_142328 ?auto_142332 ) ) ( not ( = ?auto_142328 ?auto_142333 ) ) ( not ( = ?auto_142328 ?auto_142334 ) ) ( not ( = ?auto_142329 ?auto_142330 ) ) ( not ( = ?auto_142329 ?auto_142331 ) ) ( not ( = ?auto_142329 ?auto_142332 ) ) ( not ( = ?auto_142329 ?auto_142333 ) ) ( not ( = ?auto_142329 ?auto_142334 ) ) ( not ( = ?auto_142330 ?auto_142331 ) ) ( not ( = ?auto_142330 ?auto_142332 ) ) ( not ( = ?auto_142330 ?auto_142333 ) ) ( not ( = ?auto_142330 ?auto_142334 ) ) ( not ( = ?auto_142331 ?auto_142332 ) ) ( not ( = ?auto_142331 ?auto_142333 ) ) ( not ( = ?auto_142331 ?auto_142334 ) ) ( not ( = ?auto_142332 ?auto_142333 ) ) ( not ( = ?auto_142332 ?auto_142334 ) ) ( not ( = ?auto_142333 ?auto_142334 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142333 ?auto_142334 )
      ( !STACK ?auto_142333 ?auto_142332 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142344 - BLOCK
      ?auto_142345 - BLOCK
      ?auto_142346 - BLOCK
      ?auto_142347 - BLOCK
      ?auto_142348 - BLOCK
      ?auto_142349 - BLOCK
      ?auto_142350 - BLOCK
      ?auto_142351 - BLOCK
      ?auto_142352 - BLOCK
    )
    :vars
    (
      ?auto_142353 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_142351 ) ( ON ?auto_142352 ?auto_142353 ) ( CLEAR ?auto_142352 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142344 ) ( ON ?auto_142345 ?auto_142344 ) ( ON ?auto_142346 ?auto_142345 ) ( ON ?auto_142347 ?auto_142346 ) ( ON ?auto_142348 ?auto_142347 ) ( ON ?auto_142349 ?auto_142348 ) ( ON ?auto_142350 ?auto_142349 ) ( ON ?auto_142351 ?auto_142350 ) ( not ( = ?auto_142344 ?auto_142345 ) ) ( not ( = ?auto_142344 ?auto_142346 ) ) ( not ( = ?auto_142344 ?auto_142347 ) ) ( not ( = ?auto_142344 ?auto_142348 ) ) ( not ( = ?auto_142344 ?auto_142349 ) ) ( not ( = ?auto_142344 ?auto_142350 ) ) ( not ( = ?auto_142344 ?auto_142351 ) ) ( not ( = ?auto_142344 ?auto_142352 ) ) ( not ( = ?auto_142344 ?auto_142353 ) ) ( not ( = ?auto_142345 ?auto_142346 ) ) ( not ( = ?auto_142345 ?auto_142347 ) ) ( not ( = ?auto_142345 ?auto_142348 ) ) ( not ( = ?auto_142345 ?auto_142349 ) ) ( not ( = ?auto_142345 ?auto_142350 ) ) ( not ( = ?auto_142345 ?auto_142351 ) ) ( not ( = ?auto_142345 ?auto_142352 ) ) ( not ( = ?auto_142345 ?auto_142353 ) ) ( not ( = ?auto_142346 ?auto_142347 ) ) ( not ( = ?auto_142346 ?auto_142348 ) ) ( not ( = ?auto_142346 ?auto_142349 ) ) ( not ( = ?auto_142346 ?auto_142350 ) ) ( not ( = ?auto_142346 ?auto_142351 ) ) ( not ( = ?auto_142346 ?auto_142352 ) ) ( not ( = ?auto_142346 ?auto_142353 ) ) ( not ( = ?auto_142347 ?auto_142348 ) ) ( not ( = ?auto_142347 ?auto_142349 ) ) ( not ( = ?auto_142347 ?auto_142350 ) ) ( not ( = ?auto_142347 ?auto_142351 ) ) ( not ( = ?auto_142347 ?auto_142352 ) ) ( not ( = ?auto_142347 ?auto_142353 ) ) ( not ( = ?auto_142348 ?auto_142349 ) ) ( not ( = ?auto_142348 ?auto_142350 ) ) ( not ( = ?auto_142348 ?auto_142351 ) ) ( not ( = ?auto_142348 ?auto_142352 ) ) ( not ( = ?auto_142348 ?auto_142353 ) ) ( not ( = ?auto_142349 ?auto_142350 ) ) ( not ( = ?auto_142349 ?auto_142351 ) ) ( not ( = ?auto_142349 ?auto_142352 ) ) ( not ( = ?auto_142349 ?auto_142353 ) ) ( not ( = ?auto_142350 ?auto_142351 ) ) ( not ( = ?auto_142350 ?auto_142352 ) ) ( not ( = ?auto_142350 ?auto_142353 ) ) ( not ( = ?auto_142351 ?auto_142352 ) ) ( not ( = ?auto_142351 ?auto_142353 ) ) ( not ( = ?auto_142352 ?auto_142353 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142352 ?auto_142353 )
      ( !STACK ?auto_142352 ?auto_142351 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142363 - BLOCK
      ?auto_142364 - BLOCK
      ?auto_142365 - BLOCK
      ?auto_142366 - BLOCK
      ?auto_142367 - BLOCK
      ?auto_142368 - BLOCK
      ?auto_142369 - BLOCK
      ?auto_142370 - BLOCK
      ?auto_142371 - BLOCK
    )
    :vars
    (
      ?auto_142372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142371 ?auto_142372 ) ( ON-TABLE ?auto_142363 ) ( ON ?auto_142364 ?auto_142363 ) ( ON ?auto_142365 ?auto_142364 ) ( ON ?auto_142366 ?auto_142365 ) ( ON ?auto_142367 ?auto_142366 ) ( ON ?auto_142368 ?auto_142367 ) ( ON ?auto_142369 ?auto_142368 ) ( not ( = ?auto_142363 ?auto_142364 ) ) ( not ( = ?auto_142363 ?auto_142365 ) ) ( not ( = ?auto_142363 ?auto_142366 ) ) ( not ( = ?auto_142363 ?auto_142367 ) ) ( not ( = ?auto_142363 ?auto_142368 ) ) ( not ( = ?auto_142363 ?auto_142369 ) ) ( not ( = ?auto_142363 ?auto_142370 ) ) ( not ( = ?auto_142363 ?auto_142371 ) ) ( not ( = ?auto_142363 ?auto_142372 ) ) ( not ( = ?auto_142364 ?auto_142365 ) ) ( not ( = ?auto_142364 ?auto_142366 ) ) ( not ( = ?auto_142364 ?auto_142367 ) ) ( not ( = ?auto_142364 ?auto_142368 ) ) ( not ( = ?auto_142364 ?auto_142369 ) ) ( not ( = ?auto_142364 ?auto_142370 ) ) ( not ( = ?auto_142364 ?auto_142371 ) ) ( not ( = ?auto_142364 ?auto_142372 ) ) ( not ( = ?auto_142365 ?auto_142366 ) ) ( not ( = ?auto_142365 ?auto_142367 ) ) ( not ( = ?auto_142365 ?auto_142368 ) ) ( not ( = ?auto_142365 ?auto_142369 ) ) ( not ( = ?auto_142365 ?auto_142370 ) ) ( not ( = ?auto_142365 ?auto_142371 ) ) ( not ( = ?auto_142365 ?auto_142372 ) ) ( not ( = ?auto_142366 ?auto_142367 ) ) ( not ( = ?auto_142366 ?auto_142368 ) ) ( not ( = ?auto_142366 ?auto_142369 ) ) ( not ( = ?auto_142366 ?auto_142370 ) ) ( not ( = ?auto_142366 ?auto_142371 ) ) ( not ( = ?auto_142366 ?auto_142372 ) ) ( not ( = ?auto_142367 ?auto_142368 ) ) ( not ( = ?auto_142367 ?auto_142369 ) ) ( not ( = ?auto_142367 ?auto_142370 ) ) ( not ( = ?auto_142367 ?auto_142371 ) ) ( not ( = ?auto_142367 ?auto_142372 ) ) ( not ( = ?auto_142368 ?auto_142369 ) ) ( not ( = ?auto_142368 ?auto_142370 ) ) ( not ( = ?auto_142368 ?auto_142371 ) ) ( not ( = ?auto_142368 ?auto_142372 ) ) ( not ( = ?auto_142369 ?auto_142370 ) ) ( not ( = ?auto_142369 ?auto_142371 ) ) ( not ( = ?auto_142369 ?auto_142372 ) ) ( not ( = ?auto_142370 ?auto_142371 ) ) ( not ( = ?auto_142370 ?auto_142372 ) ) ( not ( = ?auto_142371 ?auto_142372 ) ) ( CLEAR ?auto_142369 ) ( ON ?auto_142370 ?auto_142371 ) ( CLEAR ?auto_142370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142363 ?auto_142364 ?auto_142365 ?auto_142366 ?auto_142367 ?auto_142368 ?auto_142369 ?auto_142370 )
      ( MAKE-9PILE ?auto_142363 ?auto_142364 ?auto_142365 ?auto_142366 ?auto_142367 ?auto_142368 ?auto_142369 ?auto_142370 ?auto_142371 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142382 - BLOCK
      ?auto_142383 - BLOCK
      ?auto_142384 - BLOCK
      ?auto_142385 - BLOCK
      ?auto_142386 - BLOCK
      ?auto_142387 - BLOCK
      ?auto_142388 - BLOCK
      ?auto_142389 - BLOCK
      ?auto_142390 - BLOCK
    )
    :vars
    (
      ?auto_142391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142390 ?auto_142391 ) ( ON-TABLE ?auto_142382 ) ( ON ?auto_142383 ?auto_142382 ) ( ON ?auto_142384 ?auto_142383 ) ( ON ?auto_142385 ?auto_142384 ) ( ON ?auto_142386 ?auto_142385 ) ( ON ?auto_142387 ?auto_142386 ) ( ON ?auto_142388 ?auto_142387 ) ( not ( = ?auto_142382 ?auto_142383 ) ) ( not ( = ?auto_142382 ?auto_142384 ) ) ( not ( = ?auto_142382 ?auto_142385 ) ) ( not ( = ?auto_142382 ?auto_142386 ) ) ( not ( = ?auto_142382 ?auto_142387 ) ) ( not ( = ?auto_142382 ?auto_142388 ) ) ( not ( = ?auto_142382 ?auto_142389 ) ) ( not ( = ?auto_142382 ?auto_142390 ) ) ( not ( = ?auto_142382 ?auto_142391 ) ) ( not ( = ?auto_142383 ?auto_142384 ) ) ( not ( = ?auto_142383 ?auto_142385 ) ) ( not ( = ?auto_142383 ?auto_142386 ) ) ( not ( = ?auto_142383 ?auto_142387 ) ) ( not ( = ?auto_142383 ?auto_142388 ) ) ( not ( = ?auto_142383 ?auto_142389 ) ) ( not ( = ?auto_142383 ?auto_142390 ) ) ( not ( = ?auto_142383 ?auto_142391 ) ) ( not ( = ?auto_142384 ?auto_142385 ) ) ( not ( = ?auto_142384 ?auto_142386 ) ) ( not ( = ?auto_142384 ?auto_142387 ) ) ( not ( = ?auto_142384 ?auto_142388 ) ) ( not ( = ?auto_142384 ?auto_142389 ) ) ( not ( = ?auto_142384 ?auto_142390 ) ) ( not ( = ?auto_142384 ?auto_142391 ) ) ( not ( = ?auto_142385 ?auto_142386 ) ) ( not ( = ?auto_142385 ?auto_142387 ) ) ( not ( = ?auto_142385 ?auto_142388 ) ) ( not ( = ?auto_142385 ?auto_142389 ) ) ( not ( = ?auto_142385 ?auto_142390 ) ) ( not ( = ?auto_142385 ?auto_142391 ) ) ( not ( = ?auto_142386 ?auto_142387 ) ) ( not ( = ?auto_142386 ?auto_142388 ) ) ( not ( = ?auto_142386 ?auto_142389 ) ) ( not ( = ?auto_142386 ?auto_142390 ) ) ( not ( = ?auto_142386 ?auto_142391 ) ) ( not ( = ?auto_142387 ?auto_142388 ) ) ( not ( = ?auto_142387 ?auto_142389 ) ) ( not ( = ?auto_142387 ?auto_142390 ) ) ( not ( = ?auto_142387 ?auto_142391 ) ) ( not ( = ?auto_142388 ?auto_142389 ) ) ( not ( = ?auto_142388 ?auto_142390 ) ) ( not ( = ?auto_142388 ?auto_142391 ) ) ( not ( = ?auto_142389 ?auto_142390 ) ) ( not ( = ?auto_142389 ?auto_142391 ) ) ( not ( = ?auto_142390 ?auto_142391 ) ) ( CLEAR ?auto_142388 ) ( ON ?auto_142389 ?auto_142390 ) ( CLEAR ?auto_142389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142382 ?auto_142383 ?auto_142384 ?auto_142385 ?auto_142386 ?auto_142387 ?auto_142388 ?auto_142389 )
      ( MAKE-9PILE ?auto_142382 ?auto_142383 ?auto_142384 ?auto_142385 ?auto_142386 ?auto_142387 ?auto_142388 ?auto_142389 ?auto_142390 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142401 - BLOCK
      ?auto_142402 - BLOCK
      ?auto_142403 - BLOCK
      ?auto_142404 - BLOCK
      ?auto_142405 - BLOCK
      ?auto_142406 - BLOCK
      ?auto_142407 - BLOCK
      ?auto_142408 - BLOCK
      ?auto_142409 - BLOCK
    )
    :vars
    (
      ?auto_142410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142409 ?auto_142410 ) ( ON-TABLE ?auto_142401 ) ( ON ?auto_142402 ?auto_142401 ) ( ON ?auto_142403 ?auto_142402 ) ( ON ?auto_142404 ?auto_142403 ) ( ON ?auto_142405 ?auto_142404 ) ( ON ?auto_142406 ?auto_142405 ) ( not ( = ?auto_142401 ?auto_142402 ) ) ( not ( = ?auto_142401 ?auto_142403 ) ) ( not ( = ?auto_142401 ?auto_142404 ) ) ( not ( = ?auto_142401 ?auto_142405 ) ) ( not ( = ?auto_142401 ?auto_142406 ) ) ( not ( = ?auto_142401 ?auto_142407 ) ) ( not ( = ?auto_142401 ?auto_142408 ) ) ( not ( = ?auto_142401 ?auto_142409 ) ) ( not ( = ?auto_142401 ?auto_142410 ) ) ( not ( = ?auto_142402 ?auto_142403 ) ) ( not ( = ?auto_142402 ?auto_142404 ) ) ( not ( = ?auto_142402 ?auto_142405 ) ) ( not ( = ?auto_142402 ?auto_142406 ) ) ( not ( = ?auto_142402 ?auto_142407 ) ) ( not ( = ?auto_142402 ?auto_142408 ) ) ( not ( = ?auto_142402 ?auto_142409 ) ) ( not ( = ?auto_142402 ?auto_142410 ) ) ( not ( = ?auto_142403 ?auto_142404 ) ) ( not ( = ?auto_142403 ?auto_142405 ) ) ( not ( = ?auto_142403 ?auto_142406 ) ) ( not ( = ?auto_142403 ?auto_142407 ) ) ( not ( = ?auto_142403 ?auto_142408 ) ) ( not ( = ?auto_142403 ?auto_142409 ) ) ( not ( = ?auto_142403 ?auto_142410 ) ) ( not ( = ?auto_142404 ?auto_142405 ) ) ( not ( = ?auto_142404 ?auto_142406 ) ) ( not ( = ?auto_142404 ?auto_142407 ) ) ( not ( = ?auto_142404 ?auto_142408 ) ) ( not ( = ?auto_142404 ?auto_142409 ) ) ( not ( = ?auto_142404 ?auto_142410 ) ) ( not ( = ?auto_142405 ?auto_142406 ) ) ( not ( = ?auto_142405 ?auto_142407 ) ) ( not ( = ?auto_142405 ?auto_142408 ) ) ( not ( = ?auto_142405 ?auto_142409 ) ) ( not ( = ?auto_142405 ?auto_142410 ) ) ( not ( = ?auto_142406 ?auto_142407 ) ) ( not ( = ?auto_142406 ?auto_142408 ) ) ( not ( = ?auto_142406 ?auto_142409 ) ) ( not ( = ?auto_142406 ?auto_142410 ) ) ( not ( = ?auto_142407 ?auto_142408 ) ) ( not ( = ?auto_142407 ?auto_142409 ) ) ( not ( = ?auto_142407 ?auto_142410 ) ) ( not ( = ?auto_142408 ?auto_142409 ) ) ( not ( = ?auto_142408 ?auto_142410 ) ) ( not ( = ?auto_142409 ?auto_142410 ) ) ( ON ?auto_142408 ?auto_142409 ) ( CLEAR ?auto_142406 ) ( ON ?auto_142407 ?auto_142408 ) ( CLEAR ?auto_142407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142401 ?auto_142402 ?auto_142403 ?auto_142404 ?auto_142405 ?auto_142406 ?auto_142407 )
      ( MAKE-9PILE ?auto_142401 ?auto_142402 ?auto_142403 ?auto_142404 ?auto_142405 ?auto_142406 ?auto_142407 ?auto_142408 ?auto_142409 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142420 - BLOCK
      ?auto_142421 - BLOCK
      ?auto_142422 - BLOCK
      ?auto_142423 - BLOCK
      ?auto_142424 - BLOCK
      ?auto_142425 - BLOCK
      ?auto_142426 - BLOCK
      ?auto_142427 - BLOCK
      ?auto_142428 - BLOCK
    )
    :vars
    (
      ?auto_142429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142428 ?auto_142429 ) ( ON-TABLE ?auto_142420 ) ( ON ?auto_142421 ?auto_142420 ) ( ON ?auto_142422 ?auto_142421 ) ( ON ?auto_142423 ?auto_142422 ) ( ON ?auto_142424 ?auto_142423 ) ( ON ?auto_142425 ?auto_142424 ) ( not ( = ?auto_142420 ?auto_142421 ) ) ( not ( = ?auto_142420 ?auto_142422 ) ) ( not ( = ?auto_142420 ?auto_142423 ) ) ( not ( = ?auto_142420 ?auto_142424 ) ) ( not ( = ?auto_142420 ?auto_142425 ) ) ( not ( = ?auto_142420 ?auto_142426 ) ) ( not ( = ?auto_142420 ?auto_142427 ) ) ( not ( = ?auto_142420 ?auto_142428 ) ) ( not ( = ?auto_142420 ?auto_142429 ) ) ( not ( = ?auto_142421 ?auto_142422 ) ) ( not ( = ?auto_142421 ?auto_142423 ) ) ( not ( = ?auto_142421 ?auto_142424 ) ) ( not ( = ?auto_142421 ?auto_142425 ) ) ( not ( = ?auto_142421 ?auto_142426 ) ) ( not ( = ?auto_142421 ?auto_142427 ) ) ( not ( = ?auto_142421 ?auto_142428 ) ) ( not ( = ?auto_142421 ?auto_142429 ) ) ( not ( = ?auto_142422 ?auto_142423 ) ) ( not ( = ?auto_142422 ?auto_142424 ) ) ( not ( = ?auto_142422 ?auto_142425 ) ) ( not ( = ?auto_142422 ?auto_142426 ) ) ( not ( = ?auto_142422 ?auto_142427 ) ) ( not ( = ?auto_142422 ?auto_142428 ) ) ( not ( = ?auto_142422 ?auto_142429 ) ) ( not ( = ?auto_142423 ?auto_142424 ) ) ( not ( = ?auto_142423 ?auto_142425 ) ) ( not ( = ?auto_142423 ?auto_142426 ) ) ( not ( = ?auto_142423 ?auto_142427 ) ) ( not ( = ?auto_142423 ?auto_142428 ) ) ( not ( = ?auto_142423 ?auto_142429 ) ) ( not ( = ?auto_142424 ?auto_142425 ) ) ( not ( = ?auto_142424 ?auto_142426 ) ) ( not ( = ?auto_142424 ?auto_142427 ) ) ( not ( = ?auto_142424 ?auto_142428 ) ) ( not ( = ?auto_142424 ?auto_142429 ) ) ( not ( = ?auto_142425 ?auto_142426 ) ) ( not ( = ?auto_142425 ?auto_142427 ) ) ( not ( = ?auto_142425 ?auto_142428 ) ) ( not ( = ?auto_142425 ?auto_142429 ) ) ( not ( = ?auto_142426 ?auto_142427 ) ) ( not ( = ?auto_142426 ?auto_142428 ) ) ( not ( = ?auto_142426 ?auto_142429 ) ) ( not ( = ?auto_142427 ?auto_142428 ) ) ( not ( = ?auto_142427 ?auto_142429 ) ) ( not ( = ?auto_142428 ?auto_142429 ) ) ( ON ?auto_142427 ?auto_142428 ) ( CLEAR ?auto_142425 ) ( ON ?auto_142426 ?auto_142427 ) ( CLEAR ?auto_142426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142420 ?auto_142421 ?auto_142422 ?auto_142423 ?auto_142424 ?auto_142425 ?auto_142426 )
      ( MAKE-9PILE ?auto_142420 ?auto_142421 ?auto_142422 ?auto_142423 ?auto_142424 ?auto_142425 ?auto_142426 ?auto_142427 ?auto_142428 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142439 - BLOCK
      ?auto_142440 - BLOCK
      ?auto_142441 - BLOCK
      ?auto_142442 - BLOCK
      ?auto_142443 - BLOCK
      ?auto_142444 - BLOCK
      ?auto_142445 - BLOCK
      ?auto_142446 - BLOCK
      ?auto_142447 - BLOCK
    )
    :vars
    (
      ?auto_142448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142447 ?auto_142448 ) ( ON-TABLE ?auto_142439 ) ( ON ?auto_142440 ?auto_142439 ) ( ON ?auto_142441 ?auto_142440 ) ( ON ?auto_142442 ?auto_142441 ) ( ON ?auto_142443 ?auto_142442 ) ( not ( = ?auto_142439 ?auto_142440 ) ) ( not ( = ?auto_142439 ?auto_142441 ) ) ( not ( = ?auto_142439 ?auto_142442 ) ) ( not ( = ?auto_142439 ?auto_142443 ) ) ( not ( = ?auto_142439 ?auto_142444 ) ) ( not ( = ?auto_142439 ?auto_142445 ) ) ( not ( = ?auto_142439 ?auto_142446 ) ) ( not ( = ?auto_142439 ?auto_142447 ) ) ( not ( = ?auto_142439 ?auto_142448 ) ) ( not ( = ?auto_142440 ?auto_142441 ) ) ( not ( = ?auto_142440 ?auto_142442 ) ) ( not ( = ?auto_142440 ?auto_142443 ) ) ( not ( = ?auto_142440 ?auto_142444 ) ) ( not ( = ?auto_142440 ?auto_142445 ) ) ( not ( = ?auto_142440 ?auto_142446 ) ) ( not ( = ?auto_142440 ?auto_142447 ) ) ( not ( = ?auto_142440 ?auto_142448 ) ) ( not ( = ?auto_142441 ?auto_142442 ) ) ( not ( = ?auto_142441 ?auto_142443 ) ) ( not ( = ?auto_142441 ?auto_142444 ) ) ( not ( = ?auto_142441 ?auto_142445 ) ) ( not ( = ?auto_142441 ?auto_142446 ) ) ( not ( = ?auto_142441 ?auto_142447 ) ) ( not ( = ?auto_142441 ?auto_142448 ) ) ( not ( = ?auto_142442 ?auto_142443 ) ) ( not ( = ?auto_142442 ?auto_142444 ) ) ( not ( = ?auto_142442 ?auto_142445 ) ) ( not ( = ?auto_142442 ?auto_142446 ) ) ( not ( = ?auto_142442 ?auto_142447 ) ) ( not ( = ?auto_142442 ?auto_142448 ) ) ( not ( = ?auto_142443 ?auto_142444 ) ) ( not ( = ?auto_142443 ?auto_142445 ) ) ( not ( = ?auto_142443 ?auto_142446 ) ) ( not ( = ?auto_142443 ?auto_142447 ) ) ( not ( = ?auto_142443 ?auto_142448 ) ) ( not ( = ?auto_142444 ?auto_142445 ) ) ( not ( = ?auto_142444 ?auto_142446 ) ) ( not ( = ?auto_142444 ?auto_142447 ) ) ( not ( = ?auto_142444 ?auto_142448 ) ) ( not ( = ?auto_142445 ?auto_142446 ) ) ( not ( = ?auto_142445 ?auto_142447 ) ) ( not ( = ?auto_142445 ?auto_142448 ) ) ( not ( = ?auto_142446 ?auto_142447 ) ) ( not ( = ?auto_142446 ?auto_142448 ) ) ( not ( = ?auto_142447 ?auto_142448 ) ) ( ON ?auto_142446 ?auto_142447 ) ( ON ?auto_142445 ?auto_142446 ) ( CLEAR ?auto_142443 ) ( ON ?auto_142444 ?auto_142445 ) ( CLEAR ?auto_142444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142439 ?auto_142440 ?auto_142441 ?auto_142442 ?auto_142443 ?auto_142444 )
      ( MAKE-9PILE ?auto_142439 ?auto_142440 ?auto_142441 ?auto_142442 ?auto_142443 ?auto_142444 ?auto_142445 ?auto_142446 ?auto_142447 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142458 - BLOCK
      ?auto_142459 - BLOCK
      ?auto_142460 - BLOCK
      ?auto_142461 - BLOCK
      ?auto_142462 - BLOCK
      ?auto_142463 - BLOCK
      ?auto_142464 - BLOCK
      ?auto_142465 - BLOCK
      ?auto_142466 - BLOCK
    )
    :vars
    (
      ?auto_142467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142466 ?auto_142467 ) ( ON-TABLE ?auto_142458 ) ( ON ?auto_142459 ?auto_142458 ) ( ON ?auto_142460 ?auto_142459 ) ( ON ?auto_142461 ?auto_142460 ) ( ON ?auto_142462 ?auto_142461 ) ( not ( = ?auto_142458 ?auto_142459 ) ) ( not ( = ?auto_142458 ?auto_142460 ) ) ( not ( = ?auto_142458 ?auto_142461 ) ) ( not ( = ?auto_142458 ?auto_142462 ) ) ( not ( = ?auto_142458 ?auto_142463 ) ) ( not ( = ?auto_142458 ?auto_142464 ) ) ( not ( = ?auto_142458 ?auto_142465 ) ) ( not ( = ?auto_142458 ?auto_142466 ) ) ( not ( = ?auto_142458 ?auto_142467 ) ) ( not ( = ?auto_142459 ?auto_142460 ) ) ( not ( = ?auto_142459 ?auto_142461 ) ) ( not ( = ?auto_142459 ?auto_142462 ) ) ( not ( = ?auto_142459 ?auto_142463 ) ) ( not ( = ?auto_142459 ?auto_142464 ) ) ( not ( = ?auto_142459 ?auto_142465 ) ) ( not ( = ?auto_142459 ?auto_142466 ) ) ( not ( = ?auto_142459 ?auto_142467 ) ) ( not ( = ?auto_142460 ?auto_142461 ) ) ( not ( = ?auto_142460 ?auto_142462 ) ) ( not ( = ?auto_142460 ?auto_142463 ) ) ( not ( = ?auto_142460 ?auto_142464 ) ) ( not ( = ?auto_142460 ?auto_142465 ) ) ( not ( = ?auto_142460 ?auto_142466 ) ) ( not ( = ?auto_142460 ?auto_142467 ) ) ( not ( = ?auto_142461 ?auto_142462 ) ) ( not ( = ?auto_142461 ?auto_142463 ) ) ( not ( = ?auto_142461 ?auto_142464 ) ) ( not ( = ?auto_142461 ?auto_142465 ) ) ( not ( = ?auto_142461 ?auto_142466 ) ) ( not ( = ?auto_142461 ?auto_142467 ) ) ( not ( = ?auto_142462 ?auto_142463 ) ) ( not ( = ?auto_142462 ?auto_142464 ) ) ( not ( = ?auto_142462 ?auto_142465 ) ) ( not ( = ?auto_142462 ?auto_142466 ) ) ( not ( = ?auto_142462 ?auto_142467 ) ) ( not ( = ?auto_142463 ?auto_142464 ) ) ( not ( = ?auto_142463 ?auto_142465 ) ) ( not ( = ?auto_142463 ?auto_142466 ) ) ( not ( = ?auto_142463 ?auto_142467 ) ) ( not ( = ?auto_142464 ?auto_142465 ) ) ( not ( = ?auto_142464 ?auto_142466 ) ) ( not ( = ?auto_142464 ?auto_142467 ) ) ( not ( = ?auto_142465 ?auto_142466 ) ) ( not ( = ?auto_142465 ?auto_142467 ) ) ( not ( = ?auto_142466 ?auto_142467 ) ) ( ON ?auto_142465 ?auto_142466 ) ( ON ?auto_142464 ?auto_142465 ) ( CLEAR ?auto_142462 ) ( ON ?auto_142463 ?auto_142464 ) ( CLEAR ?auto_142463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142458 ?auto_142459 ?auto_142460 ?auto_142461 ?auto_142462 ?auto_142463 )
      ( MAKE-9PILE ?auto_142458 ?auto_142459 ?auto_142460 ?auto_142461 ?auto_142462 ?auto_142463 ?auto_142464 ?auto_142465 ?auto_142466 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142477 - BLOCK
      ?auto_142478 - BLOCK
      ?auto_142479 - BLOCK
      ?auto_142480 - BLOCK
      ?auto_142481 - BLOCK
      ?auto_142482 - BLOCK
      ?auto_142483 - BLOCK
      ?auto_142484 - BLOCK
      ?auto_142485 - BLOCK
    )
    :vars
    (
      ?auto_142486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142485 ?auto_142486 ) ( ON-TABLE ?auto_142477 ) ( ON ?auto_142478 ?auto_142477 ) ( ON ?auto_142479 ?auto_142478 ) ( ON ?auto_142480 ?auto_142479 ) ( not ( = ?auto_142477 ?auto_142478 ) ) ( not ( = ?auto_142477 ?auto_142479 ) ) ( not ( = ?auto_142477 ?auto_142480 ) ) ( not ( = ?auto_142477 ?auto_142481 ) ) ( not ( = ?auto_142477 ?auto_142482 ) ) ( not ( = ?auto_142477 ?auto_142483 ) ) ( not ( = ?auto_142477 ?auto_142484 ) ) ( not ( = ?auto_142477 ?auto_142485 ) ) ( not ( = ?auto_142477 ?auto_142486 ) ) ( not ( = ?auto_142478 ?auto_142479 ) ) ( not ( = ?auto_142478 ?auto_142480 ) ) ( not ( = ?auto_142478 ?auto_142481 ) ) ( not ( = ?auto_142478 ?auto_142482 ) ) ( not ( = ?auto_142478 ?auto_142483 ) ) ( not ( = ?auto_142478 ?auto_142484 ) ) ( not ( = ?auto_142478 ?auto_142485 ) ) ( not ( = ?auto_142478 ?auto_142486 ) ) ( not ( = ?auto_142479 ?auto_142480 ) ) ( not ( = ?auto_142479 ?auto_142481 ) ) ( not ( = ?auto_142479 ?auto_142482 ) ) ( not ( = ?auto_142479 ?auto_142483 ) ) ( not ( = ?auto_142479 ?auto_142484 ) ) ( not ( = ?auto_142479 ?auto_142485 ) ) ( not ( = ?auto_142479 ?auto_142486 ) ) ( not ( = ?auto_142480 ?auto_142481 ) ) ( not ( = ?auto_142480 ?auto_142482 ) ) ( not ( = ?auto_142480 ?auto_142483 ) ) ( not ( = ?auto_142480 ?auto_142484 ) ) ( not ( = ?auto_142480 ?auto_142485 ) ) ( not ( = ?auto_142480 ?auto_142486 ) ) ( not ( = ?auto_142481 ?auto_142482 ) ) ( not ( = ?auto_142481 ?auto_142483 ) ) ( not ( = ?auto_142481 ?auto_142484 ) ) ( not ( = ?auto_142481 ?auto_142485 ) ) ( not ( = ?auto_142481 ?auto_142486 ) ) ( not ( = ?auto_142482 ?auto_142483 ) ) ( not ( = ?auto_142482 ?auto_142484 ) ) ( not ( = ?auto_142482 ?auto_142485 ) ) ( not ( = ?auto_142482 ?auto_142486 ) ) ( not ( = ?auto_142483 ?auto_142484 ) ) ( not ( = ?auto_142483 ?auto_142485 ) ) ( not ( = ?auto_142483 ?auto_142486 ) ) ( not ( = ?auto_142484 ?auto_142485 ) ) ( not ( = ?auto_142484 ?auto_142486 ) ) ( not ( = ?auto_142485 ?auto_142486 ) ) ( ON ?auto_142484 ?auto_142485 ) ( ON ?auto_142483 ?auto_142484 ) ( ON ?auto_142482 ?auto_142483 ) ( CLEAR ?auto_142480 ) ( ON ?auto_142481 ?auto_142482 ) ( CLEAR ?auto_142481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142477 ?auto_142478 ?auto_142479 ?auto_142480 ?auto_142481 )
      ( MAKE-9PILE ?auto_142477 ?auto_142478 ?auto_142479 ?auto_142480 ?auto_142481 ?auto_142482 ?auto_142483 ?auto_142484 ?auto_142485 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142496 - BLOCK
      ?auto_142497 - BLOCK
      ?auto_142498 - BLOCK
      ?auto_142499 - BLOCK
      ?auto_142500 - BLOCK
      ?auto_142501 - BLOCK
      ?auto_142502 - BLOCK
      ?auto_142503 - BLOCK
      ?auto_142504 - BLOCK
    )
    :vars
    (
      ?auto_142505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142504 ?auto_142505 ) ( ON-TABLE ?auto_142496 ) ( ON ?auto_142497 ?auto_142496 ) ( ON ?auto_142498 ?auto_142497 ) ( ON ?auto_142499 ?auto_142498 ) ( not ( = ?auto_142496 ?auto_142497 ) ) ( not ( = ?auto_142496 ?auto_142498 ) ) ( not ( = ?auto_142496 ?auto_142499 ) ) ( not ( = ?auto_142496 ?auto_142500 ) ) ( not ( = ?auto_142496 ?auto_142501 ) ) ( not ( = ?auto_142496 ?auto_142502 ) ) ( not ( = ?auto_142496 ?auto_142503 ) ) ( not ( = ?auto_142496 ?auto_142504 ) ) ( not ( = ?auto_142496 ?auto_142505 ) ) ( not ( = ?auto_142497 ?auto_142498 ) ) ( not ( = ?auto_142497 ?auto_142499 ) ) ( not ( = ?auto_142497 ?auto_142500 ) ) ( not ( = ?auto_142497 ?auto_142501 ) ) ( not ( = ?auto_142497 ?auto_142502 ) ) ( not ( = ?auto_142497 ?auto_142503 ) ) ( not ( = ?auto_142497 ?auto_142504 ) ) ( not ( = ?auto_142497 ?auto_142505 ) ) ( not ( = ?auto_142498 ?auto_142499 ) ) ( not ( = ?auto_142498 ?auto_142500 ) ) ( not ( = ?auto_142498 ?auto_142501 ) ) ( not ( = ?auto_142498 ?auto_142502 ) ) ( not ( = ?auto_142498 ?auto_142503 ) ) ( not ( = ?auto_142498 ?auto_142504 ) ) ( not ( = ?auto_142498 ?auto_142505 ) ) ( not ( = ?auto_142499 ?auto_142500 ) ) ( not ( = ?auto_142499 ?auto_142501 ) ) ( not ( = ?auto_142499 ?auto_142502 ) ) ( not ( = ?auto_142499 ?auto_142503 ) ) ( not ( = ?auto_142499 ?auto_142504 ) ) ( not ( = ?auto_142499 ?auto_142505 ) ) ( not ( = ?auto_142500 ?auto_142501 ) ) ( not ( = ?auto_142500 ?auto_142502 ) ) ( not ( = ?auto_142500 ?auto_142503 ) ) ( not ( = ?auto_142500 ?auto_142504 ) ) ( not ( = ?auto_142500 ?auto_142505 ) ) ( not ( = ?auto_142501 ?auto_142502 ) ) ( not ( = ?auto_142501 ?auto_142503 ) ) ( not ( = ?auto_142501 ?auto_142504 ) ) ( not ( = ?auto_142501 ?auto_142505 ) ) ( not ( = ?auto_142502 ?auto_142503 ) ) ( not ( = ?auto_142502 ?auto_142504 ) ) ( not ( = ?auto_142502 ?auto_142505 ) ) ( not ( = ?auto_142503 ?auto_142504 ) ) ( not ( = ?auto_142503 ?auto_142505 ) ) ( not ( = ?auto_142504 ?auto_142505 ) ) ( ON ?auto_142503 ?auto_142504 ) ( ON ?auto_142502 ?auto_142503 ) ( ON ?auto_142501 ?auto_142502 ) ( CLEAR ?auto_142499 ) ( ON ?auto_142500 ?auto_142501 ) ( CLEAR ?auto_142500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142496 ?auto_142497 ?auto_142498 ?auto_142499 ?auto_142500 )
      ( MAKE-9PILE ?auto_142496 ?auto_142497 ?auto_142498 ?auto_142499 ?auto_142500 ?auto_142501 ?auto_142502 ?auto_142503 ?auto_142504 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142515 - BLOCK
      ?auto_142516 - BLOCK
      ?auto_142517 - BLOCK
      ?auto_142518 - BLOCK
      ?auto_142519 - BLOCK
      ?auto_142520 - BLOCK
      ?auto_142521 - BLOCK
      ?auto_142522 - BLOCK
      ?auto_142523 - BLOCK
    )
    :vars
    (
      ?auto_142524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142523 ?auto_142524 ) ( ON-TABLE ?auto_142515 ) ( ON ?auto_142516 ?auto_142515 ) ( ON ?auto_142517 ?auto_142516 ) ( not ( = ?auto_142515 ?auto_142516 ) ) ( not ( = ?auto_142515 ?auto_142517 ) ) ( not ( = ?auto_142515 ?auto_142518 ) ) ( not ( = ?auto_142515 ?auto_142519 ) ) ( not ( = ?auto_142515 ?auto_142520 ) ) ( not ( = ?auto_142515 ?auto_142521 ) ) ( not ( = ?auto_142515 ?auto_142522 ) ) ( not ( = ?auto_142515 ?auto_142523 ) ) ( not ( = ?auto_142515 ?auto_142524 ) ) ( not ( = ?auto_142516 ?auto_142517 ) ) ( not ( = ?auto_142516 ?auto_142518 ) ) ( not ( = ?auto_142516 ?auto_142519 ) ) ( not ( = ?auto_142516 ?auto_142520 ) ) ( not ( = ?auto_142516 ?auto_142521 ) ) ( not ( = ?auto_142516 ?auto_142522 ) ) ( not ( = ?auto_142516 ?auto_142523 ) ) ( not ( = ?auto_142516 ?auto_142524 ) ) ( not ( = ?auto_142517 ?auto_142518 ) ) ( not ( = ?auto_142517 ?auto_142519 ) ) ( not ( = ?auto_142517 ?auto_142520 ) ) ( not ( = ?auto_142517 ?auto_142521 ) ) ( not ( = ?auto_142517 ?auto_142522 ) ) ( not ( = ?auto_142517 ?auto_142523 ) ) ( not ( = ?auto_142517 ?auto_142524 ) ) ( not ( = ?auto_142518 ?auto_142519 ) ) ( not ( = ?auto_142518 ?auto_142520 ) ) ( not ( = ?auto_142518 ?auto_142521 ) ) ( not ( = ?auto_142518 ?auto_142522 ) ) ( not ( = ?auto_142518 ?auto_142523 ) ) ( not ( = ?auto_142518 ?auto_142524 ) ) ( not ( = ?auto_142519 ?auto_142520 ) ) ( not ( = ?auto_142519 ?auto_142521 ) ) ( not ( = ?auto_142519 ?auto_142522 ) ) ( not ( = ?auto_142519 ?auto_142523 ) ) ( not ( = ?auto_142519 ?auto_142524 ) ) ( not ( = ?auto_142520 ?auto_142521 ) ) ( not ( = ?auto_142520 ?auto_142522 ) ) ( not ( = ?auto_142520 ?auto_142523 ) ) ( not ( = ?auto_142520 ?auto_142524 ) ) ( not ( = ?auto_142521 ?auto_142522 ) ) ( not ( = ?auto_142521 ?auto_142523 ) ) ( not ( = ?auto_142521 ?auto_142524 ) ) ( not ( = ?auto_142522 ?auto_142523 ) ) ( not ( = ?auto_142522 ?auto_142524 ) ) ( not ( = ?auto_142523 ?auto_142524 ) ) ( ON ?auto_142522 ?auto_142523 ) ( ON ?auto_142521 ?auto_142522 ) ( ON ?auto_142520 ?auto_142521 ) ( ON ?auto_142519 ?auto_142520 ) ( CLEAR ?auto_142517 ) ( ON ?auto_142518 ?auto_142519 ) ( CLEAR ?auto_142518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142515 ?auto_142516 ?auto_142517 ?auto_142518 )
      ( MAKE-9PILE ?auto_142515 ?auto_142516 ?auto_142517 ?auto_142518 ?auto_142519 ?auto_142520 ?auto_142521 ?auto_142522 ?auto_142523 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142534 - BLOCK
      ?auto_142535 - BLOCK
      ?auto_142536 - BLOCK
      ?auto_142537 - BLOCK
      ?auto_142538 - BLOCK
      ?auto_142539 - BLOCK
      ?auto_142540 - BLOCK
      ?auto_142541 - BLOCK
      ?auto_142542 - BLOCK
    )
    :vars
    (
      ?auto_142543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142542 ?auto_142543 ) ( ON-TABLE ?auto_142534 ) ( ON ?auto_142535 ?auto_142534 ) ( ON ?auto_142536 ?auto_142535 ) ( not ( = ?auto_142534 ?auto_142535 ) ) ( not ( = ?auto_142534 ?auto_142536 ) ) ( not ( = ?auto_142534 ?auto_142537 ) ) ( not ( = ?auto_142534 ?auto_142538 ) ) ( not ( = ?auto_142534 ?auto_142539 ) ) ( not ( = ?auto_142534 ?auto_142540 ) ) ( not ( = ?auto_142534 ?auto_142541 ) ) ( not ( = ?auto_142534 ?auto_142542 ) ) ( not ( = ?auto_142534 ?auto_142543 ) ) ( not ( = ?auto_142535 ?auto_142536 ) ) ( not ( = ?auto_142535 ?auto_142537 ) ) ( not ( = ?auto_142535 ?auto_142538 ) ) ( not ( = ?auto_142535 ?auto_142539 ) ) ( not ( = ?auto_142535 ?auto_142540 ) ) ( not ( = ?auto_142535 ?auto_142541 ) ) ( not ( = ?auto_142535 ?auto_142542 ) ) ( not ( = ?auto_142535 ?auto_142543 ) ) ( not ( = ?auto_142536 ?auto_142537 ) ) ( not ( = ?auto_142536 ?auto_142538 ) ) ( not ( = ?auto_142536 ?auto_142539 ) ) ( not ( = ?auto_142536 ?auto_142540 ) ) ( not ( = ?auto_142536 ?auto_142541 ) ) ( not ( = ?auto_142536 ?auto_142542 ) ) ( not ( = ?auto_142536 ?auto_142543 ) ) ( not ( = ?auto_142537 ?auto_142538 ) ) ( not ( = ?auto_142537 ?auto_142539 ) ) ( not ( = ?auto_142537 ?auto_142540 ) ) ( not ( = ?auto_142537 ?auto_142541 ) ) ( not ( = ?auto_142537 ?auto_142542 ) ) ( not ( = ?auto_142537 ?auto_142543 ) ) ( not ( = ?auto_142538 ?auto_142539 ) ) ( not ( = ?auto_142538 ?auto_142540 ) ) ( not ( = ?auto_142538 ?auto_142541 ) ) ( not ( = ?auto_142538 ?auto_142542 ) ) ( not ( = ?auto_142538 ?auto_142543 ) ) ( not ( = ?auto_142539 ?auto_142540 ) ) ( not ( = ?auto_142539 ?auto_142541 ) ) ( not ( = ?auto_142539 ?auto_142542 ) ) ( not ( = ?auto_142539 ?auto_142543 ) ) ( not ( = ?auto_142540 ?auto_142541 ) ) ( not ( = ?auto_142540 ?auto_142542 ) ) ( not ( = ?auto_142540 ?auto_142543 ) ) ( not ( = ?auto_142541 ?auto_142542 ) ) ( not ( = ?auto_142541 ?auto_142543 ) ) ( not ( = ?auto_142542 ?auto_142543 ) ) ( ON ?auto_142541 ?auto_142542 ) ( ON ?auto_142540 ?auto_142541 ) ( ON ?auto_142539 ?auto_142540 ) ( ON ?auto_142538 ?auto_142539 ) ( CLEAR ?auto_142536 ) ( ON ?auto_142537 ?auto_142538 ) ( CLEAR ?auto_142537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142534 ?auto_142535 ?auto_142536 ?auto_142537 )
      ( MAKE-9PILE ?auto_142534 ?auto_142535 ?auto_142536 ?auto_142537 ?auto_142538 ?auto_142539 ?auto_142540 ?auto_142541 ?auto_142542 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142553 - BLOCK
      ?auto_142554 - BLOCK
      ?auto_142555 - BLOCK
      ?auto_142556 - BLOCK
      ?auto_142557 - BLOCK
      ?auto_142558 - BLOCK
      ?auto_142559 - BLOCK
      ?auto_142560 - BLOCK
      ?auto_142561 - BLOCK
    )
    :vars
    (
      ?auto_142562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142561 ?auto_142562 ) ( ON-TABLE ?auto_142553 ) ( ON ?auto_142554 ?auto_142553 ) ( not ( = ?auto_142553 ?auto_142554 ) ) ( not ( = ?auto_142553 ?auto_142555 ) ) ( not ( = ?auto_142553 ?auto_142556 ) ) ( not ( = ?auto_142553 ?auto_142557 ) ) ( not ( = ?auto_142553 ?auto_142558 ) ) ( not ( = ?auto_142553 ?auto_142559 ) ) ( not ( = ?auto_142553 ?auto_142560 ) ) ( not ( = ?auto_142553 ?auto_142561 ) ) ( not ( = ?auto_142553 ?auto_142562 ) ) ( not ( = ?auto_142554 ?auto_142555 ) ) ( not ( = ?auto_142554 ?auto_142556 ) ) ( not ( = ?auto_142554 ?auto_142557 ) ) ( not ( = ?auto_142554 ?auto_142558 ) ) ( not ( = ?auto_142554 ?auto_142559 ) ) ( not ( = ?auto_142554 ?auto_142560 ) ) ( not ( = ?auto_142554 ?auto_142561 ) ) ( not ( = ?auto_142554 ?auto_142562 ) ) ( not ( = ?auto_142555 ?auto_142556 ) ) ( not ( = ?auto_142555 ?auto_142557 ) ) ( not ( = ?auto_142555 ?auto_142558 ) ) ( not ( = ?auto_142555 ?auto_142559 ) ) ( not ( = ?auto_142555 ?auto_142560 ) ) ( not ( = ?auto_142555 ?auto_142561 ) ) ( not ( = ?auto_142555 ?auto_142562 ) ) ( not ( = ?auto_142556 ?auto_142557 ) ) ( not ( = ?auto_142556 ?auto_142558 ) ) ( not ( = ?auto_142556 ?auto_142559 ) ) ( not ( = ?auto_142556 ?auto_142560 ) ) ( not ( = ?auto_142556 ?auto_142561 ) ) ( not ( = ?auto_142556 ?auto_142562 ) ) ( not ( = ?auto_142557 ?auto_142558 ) ) ( not ( = ?auto_142557 ?auto_142559 ) ) ( not ( = ?auto_142557 ?auto_142560 ) ) ( not ( = ?auto_142557 ?auto_142561 ) ) ( not ( = ?auto_142557 ?auto_142562 ) ) ( not ( = ?auto_142558 ?auto_142559 ) ) ( not ( = ?auto_142558 ?auto_142560 ) ) ( not ( = ?auto_142558 ?auto_142561 ) ) ( not ( = ?auto_142558 ?auto_142562 ) ) ( not ( = ?auto_142559 ?auto_142560 ) ) ( not ( = ?auto_142559 ?auto_142561 ) ) ( not ( = ?auto_142559 ?auto_142562 ) ) ( not ( = ?auto_142560 ?auto_142561 ) ) ( not ( = ?auto_142560 ?auto_142562 ) ) ( not ( = ?auto_142561 ?auto_142562 ) ) ( ON ?auto_142560 ?auto_142561 ) ( ON ?auto_142559 ?auto_142560 ) ( ON ?auto_142558 ?auto_142559 ) ( ON ?auto_142557 ?auto_142558 ) ( ON ?auto_142556 ?auto_142557 ) ( CLEAR ?auto_142554 ) ( ON ?auto_142555 ?auto_142556 ) ( CLEAR ?auto_142555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142553 ?auto_142554 ?auto_142555 )
      ( MAKE-9PILE ?auto_142553 ?auto_142554 ?auto_142555 ?auto_142556 ?auto_142557 ?auto_142558 ?auto_142559 ?auto_142560 ?auto_142561 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142572 - BLOCK
      ?auto_142573 - BLOCK
      ?auto_142574 - BLOCK
      ?auto_142575 - BLOCK
      ?auto_142576 - BLOCK
      ?auto_142577 - BLOCK
      ?auto_142578 - BLOCK
      ?auto_142579 - BLOCK
      ?auto_142580 - BLOCK
    )
    :vars
    (
      ?auto_142581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142580 ?auto_142581 ) ( ON-TABLE ?auto_142572 ) ( ON ?auto_142573 ?auto_142572 ) ( not ( = ?auto_142572 ?auto_142573 ) ) ( not ( = ?auto_142572 ?auto_142574 ) ) ( not ( = ?auto_142572 ?auto_142575 ) ) ( not ( = ?auto_142572 ?auto_142576 ) ) ( not ( = ?auto_142572 ?auto_142577 ) ) ( not ( = ?auto_142572 ?auto_142578 ) ) ( not ( = ?auto_142572 ?auto_142579 ) ) ( not ( = ?auto_142572 ?auto_142580 ) ) ( not ( = ?auto_142572 ?auto_142581 ) ) ( not ( = ?auto_142573 ?auto_142574 ) ) ( not ( = ?auto_142573 ?auto_142575 ) ) ( not ( = ?auto_142573 ?auto_142576 ) ) ( not ( = ?auto_142573 ?auto_142577 ) ) ( not ( = ?auto_142573 ?auto_142578 ) ) ( not ( = ?auto_142573 ?auto_142579 ) ) ( not ( = ?auto_142573 ?auto_142580 ) ) ( not ( = ?auto_142573 ?auto_142581 ) ) ( not ( = ?auto_142574 ?auto_142575 ) ) ( not ( = ?auto_142574 ?auto_142576 ) ) ( not ( = ?auto_142574 ?auto_142577 ) ) ( not ( = ?auto_142574 ?auto_142578 ) ) ( not ( = ?auto_142574 ?auto_142579 ) ) ( not ( = ?auto_142574 ?auto_142580 ) ) ( not ( = ?auto_142574 ?auto_142581 ) ) ( not ( = ?auto_142575 ?auto_142576 ) ) ( not ( = ?auto_142575 ?auto_142577 ) ) ( not ( = ?auto_142575 ?auto_142578 ) ) ( not ( = ?auto_142575 ?auto_142579 ) ) ( not ( = ?auto_142575 ?auto_142580 ) ) ( not ( = ?auto_142575 ?auto_142581 ) ) ( not ( = ?auto_142576 ?auto_142577 ) ) ( not ( = ?auto_142576 ?auto_142578 ) ) ( not ( = ?auto_142576 ?auto_142579 ) ) ( not ( = ?auto_142576 ?auto_142580 ) ) ( not ( = ?auto_142576 ?auto_142581 ) ) ( not ( = ?auto_142577 ?auto_142578 ) ) ( not ( = ?auto_142577 ?auto_142579 ) ) ( not ( = ?auto_142577 ?auto_142580 ) ) ( not ( = ?auto_142577 ?auto_142581 ) ) ( not ( = ?auto_142578 ?auto_142579 ) ) ( not ( = ?auto_142578 ?auto_142580 ) ) ( not ( = ?auto_142578 ?auto_142581 ) ) ( not ( = ?auto_142579 ?auto_142580 ) ) ( not ( = ?auto_142579 ?auto_142581 ) ) ( not ( = ?auto_142580 ?auto_142581 ) ) ( ON ?auto_142579 ?auto_142580 ) ( ON ?auto_142578 ?auto_142579 ) ( ON ?auto_142577 ?auto_142578 ) ( ON ?auto_142576 ?auto_142577 ) ( ON ?auto_142575 ?auto_142576 ) ( CLEAR ?auto_142573 ) ( ON ?auto_142574 ?auto_142575 ) ( CLEAR ?auto_142574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142572 ?auto_142573 ?auto_142574 )
      ( MAKE-9PILE ?auto_142572 ?auto_142573 ?auto_142574 ?auto_142575 ?auto_142576 ?auto_142577 ?auto_142578 ?auto_142579 ?auto_142580 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142591 - BLOCK
      ?auto_142592 - BLOCK
      ?auto_142593 - BLOCK
      ?auto_142594 - BLOCK
      ?auto_142595 - BLOCK
      ?auto_142596 - BLOCK
      ?auto_142597 - BLOCK
      ?auto_142598 - BLOCK
      ?auto_142599 - BLOCK
    )
    :vars
    (
      ?auto_142600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142599 ?auto_142600 ) ( ON-TABLE ?auto_142591 ) ( not ( = ?auto_142591 ?auto_142592 ) ) ( not ( = ?auto_142591 ?auto_142593 ) ) ( not ( = ?auto_142591 ?auto_142594 ) ) ( not ( = ?auto_142591 ?auto_142595 ) ) ( not ( = ?auto_142591 ?auto_142596 ) ) ( not ( = ?auto_142591 ?auto_142597 ) ) ( not ( = ?auto_142591 ?auto_142598 ) ) ( not ( = ?auto_142591 ?auto_142599 ) ) ( not ( = ?auto_142591 ?auto_142600 ) ) ( not ( = ?auto_142592 ?auto_142593 ) ) ( not ( = ?auto_142592 ?auto_142594 ) ) ( not ( = ?auto_142592 ?auto_142595 ) ) ( not ( = ?auto_142592 ?auto_142596 ) ) ( not ( = ?auto_142592 ?auto_142597 ) ) ( not ( = ?auto_142592 ?auto_142598 ) ) ( not ( = ?auto_142592 ?auto_142599 ) ) ( not ( = ?auto_142592 ?auto_142600 ) ) ( not ( = ?auto_142593 ?auto_142594 ) ) ( not ( = ?auto_142593 ?auto_142595 ) ) ( not ( = ?auto_142593 ?auto_142596 ) ) ( not ( = ?auto_142593 ?auto_142597 ) ) ( not ( = ?auto_142593 ?auto_142598 ) ) ( not ( = ?auto_142593 ?auto_142599 ) ) ( not ( = ?auto_142593 ?auto_142600 ) ) ( not ( = ?auto_142594 ?auto_142595 ) ) ( not ( = ?auto_142594 ?auto_142596 ) ) ( not ( = ?auto_142594 ?auto_142597 ) ) ( not ( = ?auto_142594 ?auto_142598 ) ) ( not ( = ?auto_142594 ?auto_142599 ) ) ( not ( = ?auto_142594 ?auto_142600 ) ) ( not ( = ?auto_142595 ?auto_142596 ) ) ( not ( = ?auto_142595 ?auto_142597 ) ) ( not ( = ?auto_142595 ?auto_142598 ) ) ( not ( = ?auto_142595 ?auto_142599 ) ) ( not ( = ?auto_142595 ?auto_142600 ) ) ( not ( = ?auto_142596 ?auto_142597 ) ) ( not ( = ?auto_142596 ?auto_142598 ) ) ( not ( = ?auto_142596 ?auto_142599 ) ) ( not ( = ?auto_142596 ?auto_142600 ) ) ( not ( = ?auto_142597 ?auto_142598 ) ) ( not ( = ?auto_142597 ?auto_142599 ) ) ( not ( = ?auto_142597 ?auto_142600 ) ) ( not ( = ?auto_142598 ?auto_142599 ) ) ( not ( = ?auto_142598 ?auto_142600 ) ) ( not ( = ?auto_142599 ?auto_142600 ) ) ( ON ?auto_142598 ?auto_142599 ) ( ON ?auto_142597 ?auto_142598 ) ( ON ?auto_142596 ?auto_142597 ) ( ON ?auto_142595 ?auto_142596 ) ( ON ?auto_142594 ?auto_142595 ) ( ON ?auto_142593 ?auto_142594 ) ( CLEAR ?auto_142591 ) ( ON ?auto_142592 ?auto_142593 ) ( CLEAR ?auto_142592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142591 ?auto_142592 )
      ( MAKE-9PILE ?auto_142591 ?auto_142592 ?auto_142593 ?auto_142594 ?auto_142595 ?auto_142596 ?auto_142597 ?auto_142598 ?auto_142599 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142610 - BLOCK
      ?auto_142611 - BLOCK
      ?auto_142612 - BLOCK
      ?auto_142613 - BLOCK
      ?auto_142614 - BLOCK
      ?auto_142615 - BLOCK
      ?auto_142616 - BLOCK
      ?auto_142617 - BLOCK
      ?auto_142618 - BLOCK
    )
    :vars
    (
      ?auto_142619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142618 ?auto_142619 ) ( ON-TABLE ?auto_142610 ) ( not ( = ?auto_142610 ?auto_142611 ) ) ( not ( = ?auto_142610 ?auto_142612 ) ) ( not ( = ?auto_142610 ?auto_142613 ) ) ( not ( = ?auto_142610 ?auto_142614 ) ) ( not ( = ?auto_142610 ?auto_142615 ) ) ( not ( = ?auto_142610 ?auto_142616 ) ) ( not ( = ?auto_142610 ?auto_142617 ) ) ( not ( = ?auto_142610 ?auto_142618 ) ) ( not ( = ?auto_142610 ?auto_142619 ) ) ( not ( = ?auto_142611 ?auto_142612 ) ) ( not ( = ?auto_142611 ?auto_142613 ) ) ( not ( = ?auto_142611 ?auto_142614 ) ) ( not ( = ?auto_142611 ?auto_142615 ) ) ( not ( = ?auto_142611 ?auto_142616 ) ) ( not ( = ?auto_142611 ?auto_142617 ) ) ( not ( = ?auto_142611 ?auto_142618 ) ) ( not ( = ?auto_142611 ?auto_142619 ) ) ( not ( = ?auto_142612 ?auto_142613 ) ) ( not ( = ?auto_142612 ?auto_142614 ) ) ( not ( = ?auto_142612 ?auto_142615 ) ) ( not ( = ?auto_142612 ?auto_142616 ) ) ( not ( = ?auto_142612 ?auto_142617 ) ) ( not ( = ?auto_142612 ?auto_142618 ) ) ( not ( = ?auto_142612 ?auto_142619 ) ) ( not ( = ?auto_142613 ?auto_142614 ) ) ( not ( = ?auto_142613 ?auto_142615 ) ) ( not ( = ?auto_142613 ?auto_142616 ) ) ( not ( = ?auto_142613 ?auto_142617 ) ) ( not ( = ?auto_142613 ?auto_142618 ) ) ( not ( = ?auto_142613 ?auto_142619 ) ) ( not ( = ?auto_142614 ?auto_142615 ) ) ( not ( = ?auto_142614 ?auto_142616 ) ) ( not ( = ?auto_142614 ?auto_142617 ) ) ( not ( = ?auto_142614 ?auto_142618 ) ) ( not ( = ?auto_142614 ?auto_142619 ) ) ( not ( = ?auto_142615 ?auto_142616 ) ) ( not ( = ?auto_142615 ?auto_142617 ) ) ( not ( = ?auto_142615 ?auto_142618 ) ) ( not ( = ?auto_142615 ?auto_142619 ) ) ( not ( = ?auto_142616 ?auto_142617 ) ) ( not ( = ?auto_142616 ?auto_142618 ) ) ( not ( = ?auto_142616 ?auto_142619 ) ) ( not ( = ?auto_142617 ?auto_142618 ) ) ( not ( = ?auto_142617 ?auto_142619 ) ) ( not ( = ?auto_142618 ?auto_142619 ) ) ( ON ?auto_142617 ?auto_142618 ) ( ON ?auto_142616 ?auto_142617 ) ( ON ?auto_142615 ?auto_142616 ) ( ON ?auto_142614 ?auto_142615 ) ( ON ?auto_142613 ?auto_142614 ) ( ON ?auto_142612 ?auto_142613 ) ( CLEAR ?auto_142610 ) ( ON ?auto_142611 ?auto_142612 ) ( CLEAR ?auto_142611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142610 ?auto_142611 )
      ( MAKE-9PILE ?auto_142610 ?auto_142611 ?auto_142612 ?auto_142613 ?auto_142614 ?auto_142615 ?auto_142616 ?auto_142617 ?auto_142618 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142629 - BLOCK
      ?auto_142630 - BLOCK
      ?auto_142631 - BLOCK
      ?auto_142632 - BLOCK
      ?auto_142633 - BLOCK
      ?auto_142634 - BLOCK
      ?auto_142635 - BLOCK
      ?auto_142636 - BLOCK
      ?auto_142637 - BLOCK
    )
    :vars
    (
      ?auto_142638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142637 ?auto_142638 ) ( not ( = ?auto_142629 ?auto_142630 ) ) ( not ( = ?auto_142629 ?auto_142631 ) ) ( not ( = ?auto_142629 ?auto_142632 ) ) ( not ( = ?auto_142629 ?auto_142633 ) ) ( not ( = ?auto_142629 ?auto_142634 ) ) ( not ( = ?auto_142629 ?auto_142635 ) ) ( not ( = ?auto_142629 ?auto_142636 ) ) ( not ( = ?auto_142629 ?auto_142637 ) ) ( not ( = ?auto_142629 ?auto_142638 ) ) ( not ( = ?auto_142630 ?auto_142631 ) ) ( not ( = ?auto_142630 ?auto_142632 ) ) ( not ( = ?auto_142630 ?auto_142633 ) ) ( not ( = ?auto_142630 ?auto_142634 ) ) ( not ( = ?auto_142630 ?auto_142635 ) ) ( not ( = ?auto_142630 ?auto_142636 ) ) ( not ( = ?auto_142630 ?auto_142637 ) ) ( not ( = ?auto_142630 ?auto_142638 ) ) ( not ( = ?auto_142631 ?auto_142632 ) ) ( not ( = ?auto_142631 ?auto_142633 ) ) ( not ( = ?auto_142631 ?auto_142634 ) ) ( not ( = ?auto_142631 ?auto_142635 ) ) ( not ( = ?auto_142631 ?auto_142636 ) ) ( not ( = ?auto_142631 ?auto_142637 ) ) ( not ( = ?auto_142631 ?auto_142638 ) ) ( not ( = ?auto_142632 ?auto_142633 ) ) ( not ( = ?auto_142632 ?auto_142634 ) ) ( not ( = ?auto_142632 ?auto_142635 ) ) ( not ( = ?auto_142632 ?auto_142636 ) ) ( not ( = ?auto_142632 ?auto_142637 ) ) ( not ( = ?auto_142632 ?auto_142638 ) ) ( not ( = ?auto_142633 ?auto_142634 ) ) ( not ( = ?auto_142633 ?auto_142635 ) ) ( not ( = ?auto_142633 ?auto_142636 ) ) ( not ( = ?auto_142633 ?auto_142637 ) ) ( not ( = ?auto_142633 ?auto_142638 ) ) ( not ( = ?auto_142634 ?auto_142635 ) ) ( not ( = ?auto_142634 ?auto_142636 ) ) ( not ( = ?auto_142634 ?auto_142637 ) ) ( not ( = ?auto_142634 ?auto_142638 ) ) ( not ( = ?auto_142635 ?auto_142636 ) ) ( not ( = ?auto_142635 ?auto_142637 ) ) ( not ( = ?auto_142635 ?auto_142638 ) ) ( not ( = ?auto_142636 ?auto_142637 ) ) ( not ( = ?auto_142636 ?auto_142638 ) ) ( not ( = ?auto_142637 ?auto_142638 ) ) ( ON ?auto_142636 ?auto_142637 ) ( ON ?auto_142635 ?auto_142636 ) ( ON ?auto_142634 ?auto_142635 ) ( ON ?auto_142633 ?auto_142634 ) ( ON ?auto_142632 ?auto_142633 ) ( ON ?auto_142631 ?auto_142632 ) ( ON ?auto_142630 ?auto_142631 ) ( ON ?auto_142629 ?auto_142630 ) ( CLEAR ?auto_142629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142629 )
      ( MAKE-9PILE ?auto_142629 ?auto_142630 ?auto_142631 ?auto_142632 ?auto_142633 ?auto_142634 ?auto_142635 ?auto_142636 ?auto_142637 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_142648 - BLOCK
      ?auto_142649 - BLOCK
      ?auto_142650 - BLOCK
      ?auto_142651 - BLOCK
      ?auto_142652 - BLOCK
      ?auto_142653 - BLOCK
      ?auto_142654 - BLOCK
      ?auto_142655 - BLOCK
      ?auto_142656 - BLOCK
    )
    :vars
    (
      ?auto_142657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142656 ?auto_142657 ) ( not ( = ?auto_142648 ?auto_142649 ) ) ( not ( = ?auto_142648 ?auto_142650 ) ) ( not ( = ?auto_142648 ?auto_142651 ) ) ( not ( = ?auto_142648 ?auto_142652 ) ) ( not ( = ?auto_142648 ?auto_142653 ) ) ( not ( = ?auto_142648 ?auto_142654 ) ) ( not ( = ?auto_142648 ?auto_142655 ) ) ( not ( = ?auto_142648 ?auto_142656 ) ) ( not ( = ?auto_142648 ?auto_142657 ) ) ( not ( = ?auto_142649 ?auto_142650 ) ) ( not ( = ?auto_142649 ?auto_142651 ) ) ( not ( = ?auto_142649 ?auto_142652 ) ) ( not ( = ?auto_142649 ?auto_142653 ) ) ( not ( = ?auto_142649 ?auto_142654 ) ) ( not ( = ?auto_142649 ?auto_142655 ) ) ( not ( = ?auto_142649 ?auto_142656 ) ) ( not ( = ?auto_142649 ?auto_142657 ) ) ( not ( = ?auto_142650 ?auto_142651 ) ) ( not ( = ?auto_142650 ?auto_142652 ) ) ( not ( = ?auto_142650 ?auto_142653 ) ) ( not ( = ?auto_142650 ?auto_142654 ) ) ( not ( = ?auto_142650 ?auto_142655 ) ) ( not ( = ?auto_142650 ?auto_142656 ) ) ( not ( = ?auto_142650 ?auto_142657 ) ) ( not ( = ?auto_142651 ?auto_142652 ) ) ( not ( = ?auto_142651 ?auto_142653 ) ) ( not ( = ?auto_142651 ?auto_142654 ) ) ( not ( = ?auto_142651 ?auto_142655 ) ) ( not ( = ?auto_142651 ?auto_142656 ) ) ( not ( = ?auto_142651 ?auto_142657 ) ) ( not ( = ?auto_142652 ?auto_142653 ) ) ( not ( = ?auto_142652 ?auto_142654 ) ) ( not ( = ?auto_142652 ?auto_142655 ) ) ( not ( = ?auto_142652 ?auto_142656 ) ) ( not ( = ?auto_142652 ?auto_142657 ) ) ( not ( = ?auto_142653 ?auto_142654 ) ) ( not ( = ?auto_142653 ?auto_142655 ) ) ( not ( = ?auto_142653 ?auto_142656 ) ) ( not ( = ?auto_142653 ?auto_142657 ) ) ( not ( = ?auto_142654 ?auto_142655 ) ) ( not ( = ?auto_142654 ?auto_142656 ) ) ( not ( = ?auto_142654 ?auto_142657 ) ) ( not ( = ?auto_142655 ?auto_142656 ) ) ( not ( = ?auto_142655 ?auto_142657 ) ) ( not ( = ?auto_142656 ?auto_142657 ) ) ( ON ?auto_142655 ?auto_142656 ) ( ON ?auto_142654 ?auto_142655 ) ( ON ?auto_142653 ?auto_142654 ) ( ON ?auto_142652 ?auto_142653 ) ( ON ?auto_142651 ?auto_142652 ) ( ON ?auto_142650 ?auto_142651 ) ( ON ?auto_142649 ?auto_142650 ) ( ON ?auto_142648 ?auto_142649 ) ( CLEAR ?auto_142648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142648 )
      ( MAKE-9PILE ?auto_142648 ?auto_142649 ?auto_142650 ?auto_142651 ?auto_142652 ?auto_142653 ?auto_142654 ?auto_142655 ?auto_142656 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_142668 - BLOCK
      ?auto_142669 - BLOCK
      ?auto_142670 - BLOCK
      ?auto_142671 - BLOCK
      ?auto_142672 - BLOCK
      ?auto_142673 - BLOCK
      ?auto_142674 - BLOCK
      ?auto_142675 - BLOCK
      ?auto_142676 - BLOCK
      ?auto_142677 - BLOCK
    )
    :vars
    (
      ?auto_142678 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_142676 ) ( ON ?auto_142677 ?auto_142678 ) ( CLEAR ?auto_142677 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142668 ) ( ON ?auto_142669 ?auto_142668 ) ( ON ?auto_142670 ?auto_142669 ) ( ON ?auto_142671 ?auto_142670 ) ( ON ?auto_142672 ?auto_142671 ) ( ON ?auto_142673 ?auto_142672 ) ( ON ?auto_142674 ?auto_142673 ) ( ON ?auto_142675 ?auto_142674 ) ( ON ?auto_142676 ?auto_142675 ) ( not ( = ?auto_142668 ?auto_142669 ) ) ( not ( = ?auto_142668 ?auto_142670 ) ) ( not ( = ?auto_142668 ?auto_142671 ) ) ( not ( = ?auto_142668 ?auto_142672 ) ) ( not ( = ?auto_142668 ?auto_142673 ) ) ( not ( = ?auto_142668 ?auto_142674 ) ) ( not ( = ?auto_142668 ?auto_142675 ) ) ( not ( = ?auto_142668 ?auto_142676 ) ) ( not ( = ?auto_142668 ?auto_142677 ) ) ( not ( = ?auto_142668 ?auto_142678 ) ) ( not ( = ?auto_142669 ?auto_142670 ) ) ( not ( = ?auto_142669 ?auto_142671 ) ) ( not ( = ?auto_142669 ?auto_142672 ) ) ( not ( = ?auto_142669 ?auto_142673 ) ) ( not ( = ?auto_142669 ?auto_142674 ) ) ( not ( = ?auto_142669 ?auto_142675 ) ) ( not ( = ?auto_142669 ?auto_142676 ) ) ( not ( = ?auto_142669 ?auto_142677 ) ) ( not ( = ?auto_142669 ?auto_142678 ) ) ( not ( = ?auto_142670 ?auto_142671 ) ) ( not ( = ?auto_142670 ?auto_142672 ) ) ( not ( = ?auto_142670 ?auto_142673 ) ) ( not ( = ?auto_142670 ?auto_142674 ) ) ( not ( = ?auto_142670 ?auto_142675 ) ) ( not ( = ?auto_142670 ?auto_142676 ) ) ( not ( = ?auto_142670 ?auto_142677 ) ) ( not ( = ?auto_142670 ?auto_142678 ) ) ( not ( = ?auto_142671 ?auto_142672 ) ) ( not ( = ?auto_142671 ?auto_142673 ) ) ( not ( = ?auto_142671 ?auto_142674 ) ) ( not ( = ?auto_142671 ?auto_142675 ) ) ( not ( = ?auto_142671 ?auto_142676 ) ) ( not ( = ?auto_142671 ?auto_142677 ) ) ( not ( = ?auto_142671 ?auto_142678 ) ) ( not ( = ?auto_142672 ?auto_142673 ) ) ( not ( = ?auto_142672 ?auto_142674 ) ) ( not ( = ?auto_142672 ?auto_142675 ) ) ( not ( = ?auto_142672 ?auto_142676 ) ) ( not ( = ?auto_142672 ?auto_142677 ) ) ( not ( = ?auto_142672 ?auto_142678 ) ) ( not ( = ?auto_142673 ?auto_142674 ) ) ( not ( = ?auto_142673 ?auto_142675 ) ) ( not ( = ?auto_142673 ?auto_142676 ) ) ( not ( = ?auto_142673 ?auto_142677 ) ) ( not ( = ?auto_142673 ?auto_142678 ) ) ( not ( = ?auto_142674 ?auto_142675 ) ) ( not ( = ?auto_142674 ?auto_142676 ) ) ( not ( = ?auto_142674 ?auto_142677 ) ) ( not ( = ?auto_142674 ?auto_142678 ) ) ( not ( = ?auto_142675 ?auto_142676 ) ) ( not ( = ?auto_142675 ?auto_142677 ) ) ( not ( = ?auto_142675 ?auto_142678 ) ) ( not ( = ?auto_142676 ?auto_142677 ) ) ( not ( = ?auto_142676 ?auto_142678 ) ) ( not ( = ?auto_142677 ?auto_142678 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142677 ?auto_142678 )
      ( !STACK ?auto_142677 ?auto_142676 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_142689 - BLOCK
      ?auto_142690 - BLOCK
      ?auto_142691 - BLOCK
      ?auto_142692 - BLOCK
      ?auto_142693 - BLOCK
      ?auto_142694 - BLOCK
      ?auto_142695 - BLOCK
      ?auto_142696 - BLOCK
      ?auto_142697 - BLOCK
      ?auto_142698 - BLOCK
    )
    :vars
    (
      ?auto_142699 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_142697 ) ( ON ?auto_142698 ?auto_142699 ) ( CLEAR ?auto_142698 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142689 ) ( ON ?auto_142690 ?auto_142689 ) ( ON ?auto_142691 ?auto_142690 ) ( ON ?auto_142692 ?auto_142691 ) ( ON ?auto_142693 ?auto_142692 ) ( ON ?auto_142694 ?auto_142693 ) ( ON ?auto_142695 ?auto_142694 ) ( ON ?auto_142696 ?auto_142695 ) ( ON ?auto_142697 ?auto_142696 ) ( not ( = ?auto_142689 ?auto_142690 ) ) ( not ( = ?auto_142689 ?auto_142691 ) ) ( not ( = ?auto_142689 ?auto_142692 ) ) ( not ( = ?auto_142689 ?auto_142693 ) ) ( not ( = ?auto_142689 ?auto_142694 ) ) ( not ( = ?auto_142689 ?auto_142695 ) ) ( not ( = ?auto_142689 ?auto_142696 ) ) ( not ( = ?auto_142689 ?auto_142697 ) ) ( not ( = ?auto_142689 ?auto_142698 ) ) ( not ( = ?auto_142689 ?auto_142699 ) ) ( not ( = ?auto_142690 ?auto_142691 ) ) ( not ( = ?auto_142690 ?auto_142692 ) ) ( not ( = ?auto_142690 ?auto_142693 ) ) ( not ( = ?auto_142690 ?auto_142694 ) ) ( not ( = ?auto_142690 ?auto_142695 ) ) ( not ( = ?auto_142690 ?auto_142696 ) ) ( not ( = ?auto_142690 ?auto_142697 ) ) ( not ( = ?auto_142690 ?auto_142698 ) ) ( not ( = ?auto_142690 ?auto_142699 ) ) ( not ( = ?auto_142691 ?auto_142692 ) ) ( not ( = ?auto_142691 ?auto_142693 ) ) ( not ( = ?auto_142691 ?auto_142694 ) ) ( not ( = ?auto_142691 ?auto_142695 ) ) ( not ( = ?auto_142691 ?auto_142696 ) ) ( not ( = ?auto_142691 ?auto_142697 ) ) ( not ( = ?auto_142691 ?auto_142698 ) ) ( not ( = ?auto_142691 ?auto_142699 ) ) ( not ( = ?auto_142692 ?auto_142693 ) ) ( not ( = ?auto_142692 ?auto_142694 ) ) ( not ( = ?auto_142692 ?auto_142695 ) ) ( not ( = ?auto_142692 ?auto_142696 ) ) ( not ( = ?auto_142692 ?auto_142697 ) ) ( not ( = ?auto_142692 ?auto_142698 ) ) ( not ( = ?auto_142692 ?auto_142699 ) ) ( not ( = ?auto_142693 ?auto_142694 ) ) ( not ( = ?auto_142693 ?auto_142695 ) ) ( not ( = ?auto_142693 ?auto_142696 ) ) ( not ( = ?auto_142693 ?auto_142697 ) ) ( not ( = ?auto_142693 ?auto_142698 ) ) ( not ( = ?auto_142693 ?auto_142699 ) ) ( not ( = ?auto_142694 ?auto_142695 ) ) ( not ( = ?auto_142694 ?auto_142696 ) ) ( not ( = ?auto_142694 ?auto_142697 ) ) ( not ( = ?auto_142694 ?auto_142698 ) ) ( not ( = ?auto_142694 ?auto_142699 ) ) ( not ( = ?auto_142695 ?auto_142696 ) ) ( not ( = ?auto_142695 ?auto_142697 ) ) ( not ( = ?auto_142695 ?auto_142698 ) ) ( not ( = ?auto_142695 ?auto_142699 ) ) ( not ( = ?auto_142696 ?auto_142697 ) ) ( not ( = ?auto_142696 ?auto_142698 ) ) ( not ( = ?auto_142696 ?auto_142699 ) ) ( not ( = ?auto_142697 ?auto_142698 ) ) ( not ( = ?auto_142697 ?auto_142699 ) ) ( not ( = ?auto_142698 ?auto_142699 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142698 ?auto_142699 )
      ( !STACK ?auto_142698 ?auto_142697 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_142710 - BLOCK
      ?auto_142711 - BLOCK
      ?auto_142712 - BLOCK
      ?auto_142713 - BLOCK
      ?auto_142714 - BLOCK
      ?auto_142715 - BLOCK
      ?auto_142716 - BLOCK
      ?auto_142717 - BLOCK
      ?auto_142718 - BLOCK
      ?auto_142719 - BLOCK
    )
    :vars
    (
      ?auto_142720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142719 ?auto_142720 ) ( ON-TABLE ?auto_142710 ) ( ON ?auto_142711 ?auto_142710 ) ( ON ?auto_142712 ?auto_142711 ) ( ON ?auto_142713 ?auto_142712 ) ( ON ?auto_142714 ?auto_142713 ) ( ON ?auto_142715 ?auto_142714 ) ( ON ?auto_142716 ?auto_142715 ) ( ON ?auto_142717 ?auto_142716 ) ( not ( = ?auto_142710 ?auto_142711 ) ) ( not ( = ?auto_142710 ?auto_142712 ) ) ( not ( = ?auto_142710 ?auto_142713 ) ) ( not ( = ?auto_142710 ?auto_142714 ) ) ( not ( = ?auto_142710 ?auto_142715 ) ) ( not ( = ?auto_142710 ?auto_142716 ) ) ( not ( = ?auto_142710 ?auto_142717 ) ) ( not ( = ?auto_142710 ?auto_142718 ) ) ( not ( = ?auto_142710 ?auto_142719 ) ) ( not ( = ?auto_142710 ?auto_142720 ) ) ( not ( = ?auto_142711 ?auto_142712 ) ) ( not ( = ?auto_142711 ?auto_142713 ) ) ( not ( = ?auto_142711 ?auto_142714 ) ) ( not ( = ?auto_142711 ?auto_142715 ) ) ( not ( = ?auto_142711 ?auto_142716 ) ) ( not ( = ?auto_142711 ?auto_142717 ) ) ( not ( = ?auto_142711 ?auto_142718 ) ) ( not ( = ?auto_142711 ?auto_142719 ) ) ( not ( = ?auto_142711 ?auto_142720 ) ) ( not ( = ?auto_142712 ?auto_142713 ) ) ( not ( = ?auto_142712 ?auto_142714 ) ) ( not ( = ?auto_142712 ?auto_142715 ) ) ( not ( = ?auto_142712 ?auto_142716 ) ) ( not ( = ?auto_142712 ?auto_142717 ) ) ( not ( = ?auto_142712 ?auto_142718 ) ) ( not ( = ?auto_142712 ?auto_142719 ) ) ( not ( = ?auto_142712 ?auto_142720 ) ) ( not ( = ?auto_142713 ?auto_142714 ) ) ( not ( = ?auto_142713 ?auto_142715 ) ) ( not ( = ?auto_142713 ?auto_142716 ) ) ( not ( = ?auto_142713 ?auto_142717 ) ) ( not ( = ?auto_142713 ?auto_142718 ) ) ( not ( = ?auto_142713 ?auto_142719 ) ) ( not ( = ?auto_142713 ?auto_142720 ) ) ( not ( = ?auto_142714 ?auto_142715 ) ) ( not ( = ?auto_142714 ?auto_142716 ) ) ( not ( = ?auto_142714 ?auto_142717 ) ) ( not ( = ?auto_142714 ?auto_142718 ) ) ( not ( = ?auto_142714 ?auto_142719 ) ) ( not ( = ?auto_142714 ?auto_142720 ) ) ( not ( = ?auto_142715 ?auto_142716 ) ) ( not ( = ?auto_142715 ?auto_142717 ) ) ( not ( = ?auto_142715 ?auto_142718 ) ) ( not ( = ?auto_142715 ?auto_142719 ) ) ( not ( = ?auto_142715 ?auto_142720 ) ) ( not ( = ?auto_142716 ?auto_142717 ) ) ( not ( = ?auto_142716 ?auto_142718 ) ) ( not ( = ?auto_142716 ?auto_142719 ) ) ( not ( = ?auto_142716 ?auto_142720 ) ) ( not ( = ?auto_142717 ?auto_142718 ) ) ( not ( = ?auto_142717 ?auto_142719 ) ) ( not ( = ?auto_142717 ?auto_142720 ) ) ( not ( = ?auto_142718 ?auto_142719 ) ) ( not ( = ?auto_142718 ?auto_142720 ) ) ( not ( = ?auto_142719 ?auto_142720 ) ) ( CLEAR ?auto_142717 ) ( ON ?auto_142718 ?auto_142719 ) ( CLEAR ?auto_142718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_142710 ?auto_142711 ?auto_142712 ?auto_142713 ?auto_142714 ?auto_142715 ?auto_142716 ?auto_142717 ?auto_142718 )
      ( MAKE-10PILE ?auto_142710 ?auto_142711 ?auto_142712 ?auto_142713 ?auto_142714 ?auto_142715 ?auto_142716 ?auto_142717 ?auto_142718 ?auto_142719 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_142731 - BLOCK
      ?auto_142732 - BLOCK
      ?auto_142733 - BLOCK
      ?auto_142734 - BLOCK
      ?auto_142735 - BLOCK
      ?auto_142736 - BLOCK
      ?auto_142737 - BLOCK
      ?auto_142738 - BLOCK
      ?auto_142739 - BLOCK
      ?auto_142740 - BLOCK
    )
    :vars
    (
      ?auto_142741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142740 ?auto_142741 ) ( ON-TABLE ?auto_142731 ) ( ON ?auto_142732 ?auto_142731 ) ( ON ?auto_142733 ?auto_142732 ) ( ON ?auto_142734 ?auto_142733 ) ( ON ?auto_142735 ?auto_142734 ) ( ON ?auto_142736 ?auto_142735 ) ( ON ?auto_142737 ?auto_142736 ) ( ON ?auto_142738 ?auto_142737 ) ( not ( = ?auto_142731 ?auto_142732 ) ) ( not ( = ?auto_142731 ?auto_142733 ) ) ( not ( = ?auto_142731 ?auto_142734 ) ) ( not ( = ?auto_142731 ?auto_142735 ) ) ( not ( = ?auto_142731 ?auto_142736 ) ) ( not ( = ?auto_142731 ?auto_142737 ) ) ( not ( = ?auto_142731 ?auto_142738 ) ) ( not ( = ?auto_142731 ?auto_142739 ) ) ( not ( = ?auto_142731 ?auto_142740 ) ) ( not ( = ?auto_142731 ?auto_142741 ) ) ( not ( = ?auto_142732 ?auto_142733 ) ) ( not ( = ?auto_142732 ?auto_142734 ) ) ( not ( = ?auto_142732 ?auto_142735 ) ) ( not ( = ?auto_142732 ?auto_142736 ) ) ( not ( = ?auto_142732 ?auto_142737 ) ) ( not ( = ?auto_142732 ?auto_142738 ) ) ( not ( = ?auto_142732 ?auto_142739 ) ) ( not ( = ?auto_142732 ?auto_142740 ) ) ( not ( = ?auto_142732 ?auto_142741 ) ) ( not ( = ?auto_142733 ?auto_142734 ) ) ( not ( = ?auto_142733 ?auto_142735 ) ) ( not ( = ?auto_142733 ?auto_142736 ) ) ( not ( = ?auto_142733 ?auto_142737 ) ) ( not ( = ?auto_142733 ?auto_142738 ) ) ( not ( = ?auto_142733 ?auto_142739 ) ) ( not ( = ?auto_142733 ?auto_142740 ) ) ( not ( = ?auto_142733 ?auto_142741 ) ) ( not ( = ?auto_142734 ?auto_142735 ) ) ( not ( = ?auto_142734 ?auto_142736 ) ) ( not ( = ?auto_142734 ?auto_142737 ) ) ( not ( = ?auto_142734 ?auto_142738 ) ) ( not ( = ?auto_142734 ?auto_142739 ) ) ( not ( = ?auto_142734 ?auto_142740 ) ) ( not ( = ?auto_142734 ?auto_142741 ) ) ( not ( = ?auto_142735 ?auto_142736 ) ) ( not ( = ?auto_142735 ?auto_142737 ) ) ( not ( = ?auto_142735 ?auto_142738 ) ) ( not ( = ?auto_142735 ?auto_142739 ) ) ( not ( = ?auto_142735 ?auto_142740 ) ) ( not ( = ?auto_142735 ?auto_142741 ) ) ( not ( = ?auto_142736 ?auto_142737 ) ) ( not ( = ?auto_142736 ?auto_142738 ) ) ( not ( = ?auto_142736 ?auto_142739 ) ) ( not ( = ?auto_142736 ?auto_142740 ) ) ( not ( = ?auto_142736 ?auto_142741 ) ) ( not ( = ?auto_142737 ?auto_142738 ) ) ( not ( = ?auto_142737 ?auto_142739 ) ) ( not ( = ?auto_142737 ?auto_142740 ) ) ( not ( = ?auto_142737 ?auto_142741 ) ) ( not ( = ?auto_142738 ?auto_142739 ) ) ( not ( = ?auto_142738 ?auto_142740 ) ) ( not ( = ?auto_142738 ?auto_142741 ) ) ( not ( = ?auto_142739 ?auto_142740 ) ) ( not ( = ?auto_142739 ?auto_142741 ) ) ( not ( = ?auto_142740 ?auto_142741 ) ) ( CLEAR ?auto_142738 ) ( ON ?auto_142739 ?auto_142740 ) ( CLEAR ?auto_142739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_142731 ?auto_142732 ?auto_142733 ?auto_142734 ?auto_142735 ?auto_142736 ?auto_142737 ?auto_142738 ?auto_142739 )
      ( MAKE-10PILE ?auto_142731 ?auto_142732 ?auto_142733 ?auto_142734 ?auto_142735 ?auto_142736 ?auto_142737 ?auto_142738 ?auto_142739 ?auto_142740 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_142752 - BLOCK
      ?auto_142753 - BLOCK
      ?auto_142754 - BLOCK
      ?auto_142755 - BLOCK
      ?auto_142756 - BLOCK
      ?auto_142757 - BLOCK
      ?auto_142758 - BLOCK
      ?auto_142759 - BLOCK
      ?auto_142760 - BLOCK
      ?auto_142761 - BLOCK
    )
    :vars
    (
      ?auto_142762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142761 ?auto_142762 ) ( ON-TABLE ?auto_142752 ) ( ON ?auto_142753 ?auto_142752 ) ( ON ?auto_142754 ?auto_142753 ) ( ON ?auto_142755 ?auto_142754 ) ( ON ?auto_142756 ?auto_142755 ) ( ON ?auto_142757 ?auto_142756 ) ( ON ?auto_142758 ?auto_142757 ) ( not ( = ?auto_142752 ?auto_142753 ) ) ( not ( = ?auto_142752 ?auto_142754 ) ) ( not ( = ?auto_142752 ?auto_142755 ) ) ( not ( = ?auto_142752 ?auto_142756 ) ) ( not ( = ?auto_142752 ?auto_142757 ) ) ( not ( = ?auto_142752 ?auto_142758 ) ) ( not ( = ?auto_142752 ?auto_142759 ) ) ( not ( = ?auto_142752 ?auto_142760 ) ) ( not ( = ?auto_142752 ?auto_142761 ) ) ( not ( = ?auto_142752 ?auto_142762 ) ) ( not ( = ?auto_142753 ?auto_142754 ) ) ( not ( = ?auto_142753 ?auto_142755 ) ) ( not ( = ?auto_142753 ?auto_142756 ) ) ( not ( = ?auto_142753 ?auto_142757 ) ) ( not ( = ?auto_142753 ?auto_142758 ) ) ( not ( = ?auto_142753 ?auto_142759 ) ) ( not ( = ?auto_142753 ?auto_142760 ) ) ( not ( = ?auto_142753 ?auto_142761 ) ) ( not ( = ?auto_142753 ?auto_142762 ) ) ( not ( = ?auto_142754 ?auto_142755 ) ) ( not ( = ?auto_142754 ?auto_142756 ) ) ( not ( = ?auto_142754 ?auto_142757 ) ) ( not ( = ?auto_142754 ?auto_142758 ) ) ( not ( = ?auto_142754 ?auto_142759 ) ) ( not ( = ?auto_142754 ?auto_142760 ) ) ( not ( = ?auto_142754 ?auto_142761 ) ) ( not ( = ?auto_142754 ?auto_142762 ) ) ( not ( = ?auto_142755 ?auto_142756 ) ) ( not ( = ?auto_142755 ?auto_142757 ) ) ( not ( = ?auto_142755 ?auto_142758 ) ) ( not ( = ?auto_142755 ?auto_142759 ) ) ( not ( = ?auto_142755 ?auto_142760 ) ) ( not ( = ?auto_142755 ?auto_142761 ) ) ( not ( = ?auto_142755 ?auto_142762 ) ) ( not ( = ?auto_142756 ?auto_142757 ) ) ( not ( = ?auto_142756 ?auto_142758 ) ) ( not ( = ?auto_142756 ?auto_142759 ) ) ( not ( = ?auto_142756 ?auto_142760 ) ) ( not ( = ?auto_142756 ?auto_142761 ) ) ( not ( = ?auto_142756 ?auto_142762 ) ) ( not ( = ?auto_142757 ?auto_142758 ) ) ( not ( = ?auto_142757 ?auto_142759 ) ) ( not ( = ?auto_142757 ?auto_142760 ) ) ( not ( = ?auto_142757 ?auto_142761 ) ) ( not ( = ?auto_142757 ?auto_142762 ) ) ( not ( = ?auto_142758 ?auto_142759 ) ) ( not ( = ?auto_142758 ?auto_142760 ) ) ( not ( = ?auto_142758 ?auto_142761 ) ) ( not ( = ?auto_142758 ?auto_142762 ) ) ( not ( = ?auto_142759 ?auto_142760 ) ) ( not ( = ?auto_142759 ?auto_142761 ) ) ( not ( = ?auto_142759 ?auto_142762 ) ) ( not ( = ?auto_142760 ?auto_142761 ) ) ( not ( = ?auto_142760 ?auto_142762 ) ) ( not ( = ?auto_142761 ?auto_142762 ) ) ( ON ?auto_142760 ?auto_142761 ) ( CLEAR ?auto_142758 ) ( ON ?auto_142759 ?auto_142760 ) ( CLEAR ?auto_142759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142752 ?auto_142753 ?auto_142754 ?auto_142755 ?auto_142756 ?auto_142757 ?auto_142758 ?auto_142759 )
      ( MAKE-10PILE ?auto_142752 ?auto_142753 ?auto_142754 ?auto_142755 ?auto_142756 ?auto_142757 ?auto_142758 ?auto_142759 ?auto_142760 ?auto_142761 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_142773 - BLOCK
      ?auto_142774 - BLOCK
      ?auto_142775 - BLOCK
      ?auto_142776 - BLOCK
      ?auto_142777 - BLOCK
      ?auto_142778 - BLOCK
      ?auto_142779 - BLOCK
      ?auto_142780 - BLOCK
      ?auto_142781 - BLOCK
      ?auto_142782 - BLOCK
    )
    :vars
    (
      ?auto_142783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142782 ?auto_142783 ) ( ON-TABLE ?auto_142773 ) ( ON ?auto_142774 ?auto_142773 ) ( ON ?auto_142775 ?auto_142774 ) ( ON ?auto_142776 ?auto_142775 ) ( ON ?auto_142777 ?auto_142776 ) ( ON ?auto_142778 ?auto_142777 ) ( ON ?auto_142779 ?auto_142778 ) ( not ( = ?auto_142773 ?auto_142774 ) ) ( not ( = ?auto_142773 ?auto_142775 ) ) ( not ( = ?auto_142773 ?auto_142776 ) ) ( not ( = ?auto_142773 ?auto_142777 ) ) ( not ( = ?auto_142773 ?auto_142778 ) ) ( not ( = ?auto_142773 ?auto_142779 ) ) ( not ( = ?auto_142773 ?auto_142780 ) ) ( not ( = ?auto_142773 ?auto_142781 ) ) ( not ( = ?auto_142773 ?auto_142782 ) ) ( not ( = ?auto_142773 ?auto_142783 ) ) ( not ( = ?auto_142774 ?auto_142775 ) ) ( not ( = ?auto_142774 ?auto_142776 ) ) ( not ( = ?auto_142774 ?auto_142777 ) ) ( not ( = ?auto_142774 ?auto_142778 ) ) ( not ( = ?auto_142774 ?auto_142779 ) ) ( not ( = ?auto_142774 ?auto_142780 ) ) ( not ( = ?auto_142774 ?auto_142781 ) ) ( not ( = ?auto_142774 ?auto_142782 ) ) ( not ( = ?auto_142774 ?auto_142783 ) ) ( not ( = ?auto_142775 ?auto_142776 ) ) ( not ( = ?auto_142775 ?auto_142777 ) ) ( not ( = ?auto_142775 ?auto_142778 ) ) ( not ( = ?auto_142775 ?auto_142779 ) ) ( not ( = ?auto_142775 ?auto_142780 ) ) ( not ( = ?auto_142775 ?auto_142781 ) ) ( not ( = ?auto_142775 ?auto_142782 ) ) ( not ( = ?auto_142775 ?auto_142783 ) ) ( not ( = ?auto_142776 ?auto_142777 ) ) ( not ( = ?auto_142776 ?auto_142778 ) ) ( not ( = ?auto_142776 ?auto_142779 ) ) ( not ( = ?auto_142776 ?auto_142780 ) ) ( not ( = ?auto_142776 ?auto_142781 ) ) ( not ( = ?auto_142776 ?auto_142782 ) ) ( not ( = ?auto_142776 ?auto_142783 ) ) ( not ( = ?auto_142777 ?auto_142778 ) ) ( not ( = ?auto_142777 ?auto_142779 ) ) ( not ( = ?auto_142777 ?auto_142780 ) ) ( not ( = ?auto_142777 ?auto_142781 ) ) ( not ( = ?auto_142777 ?auto_142782 ) ) ( not ( = ?auto_142777 ?auto_142783 ) ) ( not ( = ?auto_142778 ?auto_142779 ) ) ( not ( = ?auto_142778 ?auto_142780 ) ) ( not ( = ?auto_142778 ?auto_142781 ) ) ( not ( = ?auto_142778 ?auto_142782 ) ) ( not ( = ?auto_142778 ?auto_142783 ) ) ( not ( = ?auto_142779 ?auto_142780 ) ) ( not ( = ?auto_142779 ?auto_142781 ) ) ( not ( = ?auto_142779 ?auto_142782 ) ) ( not ( = ?auto_142779 ?auto_142783 ) ) ( not ( = ?auto_142780 ?auto_142781 ) ) ( not ( = ?auto_142780 ?auto_142782 ) ) ( not ( = ?auto_142780 ?auto_142783 ) ) ( not ( = ?auto_142781 ?auto_142782 ) ) ( not ( = ?auto_142781 ?auto_142783 ) ) ( not ( = ?auto_142782 ?auto_142783 ) ) ( ON ?auto_142781 ?auto_142782 ) ( CLEAR ?auto_142779 ) ( ON ?auto_142780 ?auto_142781 ) ( CLEAR ?auto_142780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142773 ?auto_142774 ?auto_142775 ?auto_142776 ?auto_142777 ?auto_142778 ?auto_142779 ?auto_142780 )
      ( MAKE-10PILE ?auto_142773 ?auto_142774 ?auto_142775 ?auto_142776 ?auto_142777 ?auto_142778 ?auto_142779 ?auto_142780 ?auto_142781 ?auto_142782 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_142794 - BLOCK
      ?auto_142795 - BLOCK
      ?auto_142796 - BLOCK
      ?auto_142797 - BLOCK
      ?auto_142798 - BLOCK
      ?auto_142799 - BLOCK
      ?auto_142800 - BLOCK
      ?auto_142801 - BLOCK
      ?auto_142802 - BLOCK
      ?auto_142803 - BLOCK
    )
    :vars
    (
      ?auto_142804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142803 ?auto_142804 ) ( ON-TABLE ?auto_142794 ) ( ON ?auto_142795 ?auto_142794 ) ( ON ?auto_142796 ?auto_142795 ) ( ON ?auto_142797 ?auto_142796 ) ( ON ?auto_142798 ?auto_142797 ) ( ON ?auto_142799 ?auto_142798 ) ( not ( = ?auto_142794 ?auto_142795 ) ) ( not ( = ?auto_142794 ?auto_142796 ) ) ( not ( = ?auto_142794 ?auto_142797 ) ) ( not ( = ?auto_142794 ?auto_142798 ) ) ( not ( = ?auto_142794 ?auto_142799 ) ) ( not ( = ?auto_142794 ?auto_142800 ) ) ( not ( = ?auto_142794 ?auto_142801 ) ) ( not ( = ?auto_142794 ?auto_142802 ) ) ( not ( = ?auto_142794 ?auto_142803 ) ) ( not ( = ?auto_142794 ?auto_142804 ) ) ( not ( = ?auto_142795 ?auto_142796 ) ) ( not ( = ?auto_142795 ?auto_142797 ) ) ( not ( = ?auto_142795 ?auto_142798 ) ) ( not ( = ?auto_142795 ?auto_142799 ) ) ( not ( = ?auto_142795 ?auto_142800 ) ) ( not ( = ?auto_142795 ?auto_142801 ) ) ( not ( = ?auto_142795 ?auto_142802 ) ) ( not ( = ?auto_142795 ?auto_142803 ) ) ( not ( = ?auto_142795 ?auto_142804 ) ) ( not ( = ?auto_142796 ?auto_142797 ) ) ( not ( = ?auto_142796 ?auto_142798 ) ) ( not ( = ?auto_142796 ?auto_142799 ) ) ( not ( = ?auto_142796 ?auto_142800 ) ) ( not ( = ?auto_142796 ?auto_142801 ) ) ( not ( = ?auto_142796 ?auto_142802 ) ) ( not ( = ?auto_142796 ?auto_142803 ) ) ( not ( = ?auto_142796 ?auto_142804 ) ) ( not ( = ?auto_142797 ?auto_142798 ) ) ( not ( = ?auto_142797 ?auto_142799 ) ) ( not ( = ?auto_142797 ?auto_142800 ) ) ( not ( = ?auto_142797 ?auto_142801 ) ) ( not ( = ?auto_142797 ?auto_142802 ) ) ( not ( = ?auto_142797 ?auto_142803 ) ) ( not ( = ?auto_142797 ?auto_142804 ) ) ( not ( = ?auto_142798 ?auto_142799 ) ) ( not ( = ?auto_142798 ?auto_142800 ) ) ( not ( = ?auto_142798 ?auto_142801 ) ) ( not ( = ?auto_142798 ?auto_142802 ) ) ( not ( = ?auto_142798 ?auto_142803 ) ) ( not ( = ?auto_142798 ?auto_142804 ) ) ( not ( = ?auto_142799 ?auto_142800 ) ) ( not ( = ?auto_142799 ?auto_142801 ) ) ( not ( = ?auto_142799 ?auto_142802 ) ) ( not ( = ?auto_142799 ?auto_142803 ) ) ( not ( = ?auto_142799 ?auto_142804 ) ) ( not ( = ?auto_142800 ?auto_142801 ) ) ( not ( = ?auto_142800 ?auto_142802 ) ) ( not ( = ?auto_142800 ?auto_142803 ) ) ( not ( = ?auto_142800 ?auto_142804 ) ) ( not ( = ?auto_142801 ?auto_142802 ) ) ( not ( = ?auto_142801 ?auto_142803 ) ) ( not ( = ?auto_142801 ?auto_142804 ) ) ( not ( = ?auto_142802 ?auto_142803 ) ) ( not ( = ?auto_142802 ?auto_142804 ) ) ( not ( = ?auto_142803 ?auto_142804 ) ) ( ON ?auto_142802 ?auto_142803 ) ( ON ?auto_142801 ?auto_142802 ) ( CLEAR ?auto_142799 ) ( ON ?auto_142800 ?auto_142801 ) ( CLEAR ?auto_142800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142794 ?auto_142795 ?auto_142796 ?auto_142797 ?auto_142798 ?auto_142799 ?auto_142800 )
      ( MAKE-10PILE ?auto_142794 ?auto_142795 ?auto_142796 ?auto_142797 ?auto_142798 ?auto_142799 ?auto_142800 ?auto_142801 ?auto_142802 ?auto_142803 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_142815 - BLOCK
      ?auto_142816 - BLOCK
      ?auto_142817 - BLOCK
      ?auto_142818 - BLOCK
      ?auto_142819 - BLOCK
      ?auto_142820 - BLOCK
      ?auto_142821 - BLOCK
      ?auto_142822 - BLOCK
      ?auto_142823 - BLOCK
      ?auto_142824 - BLOCK
    )
    :vars
    (
      ?auto_142825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142824 ?auto_142825 ) ( ON-TABLE ?auto_142815 ) ( ON ?auto_142816 ?auto_142815 ) ( ON ?auto_142817 ?auto_142816 ) ( ON ?auto_142818 ?auto_142817 ) ( ON ?auto_142819 ?auto_142818 ) ( ON ?auto_142820 ?auto_142819 ) ( not ( = ?auto_142815 ?auto_142816 ) ) ( not ( = ?auto_142815 ?auto_142817 ) ) ( not ( = ?auto_142815 ?auto_142818 ) ) ( not ( = ?auto_142815 ?auto_142819 ) ) ( not ( = ?auto_142815 ?auto_142820 ) ) ( not ( = ?auto_142815 ?auto_142821 ) ) ( not ( = ?auto_142815 ?auto_142822 ) ) ( not ( = ?auto_142815 ?auto_142823 ) ) ( not ( = ?auto_142815 ?auto_142824 ) ) ( not ( = ?auto_142815 ?auto_142825 ) ) ( not ( = ?auto_142816 ?auto_142817 ) ) ( not ( = ?auto_142816 ?auto_142818 ) ) ( not ( = ?auto_142816 ?auto_142819 ) ) ( not ( = ?auto_142816 ?auto_142820 ) ) ( not ( = ?auto_142816 ?auto_142821 ) ) ( not ( = ?auto_142816 ?auto_142822 ) ) ( not ( = ?auto_142816 ?auto_142823 ) ) ( not ( = ?auto_142816 ?auto_142824 ) ) ( not ( = ?auto_142816 ?auto_142825 ) ) ( not ( = ?auto_142817 ?auto_142818 ) ) ( not ( = ?auto_142817 ?auto_142819 ) ) ( not ( = ?auto_142817 ?auto_142820 ) ) ( not ( = ?auto_142817 ?auto_142821 ) ) ( not ( = ?auto_142817 ?auto_142822 ) ) ( not ( = ?auto_142817 ?auto_142823 ) ) ( not ( = ?auto_142817 ?auto_142824 ) ) ( not ( = ?auto_142817 ?auto_142825 ) ) ( not ( = ?auto_142818 ?auto_142819 ) ) ( not ( = ?auto_142818 ?auto_142820 ) ) ( not ( = ?auto_142818 ?auto_142821 ) ) ( not ( = ?auto_142818 ?auto_142822 ) ) ( not ( = ?auto_142818 ?auto_142823 ) ) ( not ( = ?auto_142818 ?auto_142824 ) ) ( not ( = ?auto_142818 ?auto_142825 ) ) ( not ( = ?auto_142819 ?auto_142820 ) ) ( not ( = ?auto_142819 ?auto_142821 ) ) ( not ( = ?auto_142819 ?auto_142822 ) ) ( not ( = ?auto_142819 ?auto_142823 ) ) ( not ( = ?auto_142819 ?auto_142824 ) ) ( not ( = ?auto_142819 ?auto_142825 ) ) ( not ( = ?auto_142820 ?auto_142821 ) ) ( not ( = ?auto_142820 ?auto_142822 ) ) ( not ( = ?auto_142820 ?auto_142823 ) ) ( not ( = ?auto_142820 ?auto_142824 ) ) ( not ( = ?auto_142820 ?auto_142825 ) ) ( not ( = ?auto_142821 ?auto_142822 ) ) ( not ( = ?auto_142821 ?auto_142823 ) ) ( not ( = ?auto_142821 ?auto_142824 ) ) ( not ( = ?auto_142821 ?auto_142825 ) ) ( not ( = ?auto_142822 ?auto_142823 ) ) ( not ( = ?auto_142822 ?auto_142824 ) ) ( not ( = ?auto_142822 ?auto_142825 ) ) ( not ( = ?auto_142823 ?auto_142824 ) ) ( not ( = ?auto_142823 ?auto_142825 ) ) ( not ( = ?auto_142824 ?auto_142825 ) ) ( ON ?auto_142823 ?auto_142824 ) ( ON ?auto_142822 ?auto_142823 ) ( CLEAR ?auto_142820 ) ( ON ?auto_142821 ?auto_142822 ) ( CLEAR ?auto_142821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142815 ?auto_142816 ?auto_142817 ?auto_142818 ?auto_142819 ?auto_142820 ?auto_142821 )
      ( MAKE-10PILE ?auto_142815 ?auto_142816 ?auto_142817 ?auto_142818 ?auto_142819 ?auto_142820 ?auto_142821 ?auto_142822 ?auto_142823 ?auto_142824 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_142836 - BLOCK
      ?auto_142837 - BLOCK
      ?auto_142838 - BLOCK
      ?auto_142839 - BLOCK
      ?auto_142840 - BLOCK
      ?auto_142841 - BLOCK
      ?auto_142842 - BLOCK
      ?auto_142843 - BLOCK
      ?auto_142844 - BLOCK
      ?auto_142845 - BLOCK
    )
    :vars
    (
      ?auto_142846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142845 ?auto_142846 ) ( ON-TABLE ?auto_142836 ) ( ON ?auto_142837 ?auto_142836 ) ( ON ?auto_142838 ?auto_142837 ) ( ON ?auto_142839 ?auto_142838 ) ( ON ?auto_142840 ?auto_142839 ) ( not ( = ?auto_142836 ?auto_142837 ) ) ( not ( = ?auto_142836 ?auto_142838 ) ) ( not ( = ?auto_142836 ?auto_142839 ) ) ( not ( = ?auto_142836 ?auto_142840 ) ) ( not ( = ?auto_142836 ?auto_142841 ) ) ( not ( = ?auto_142836 ?auto_142842 ) ) ( not ( = ?auto_142836 ?auto_142843 ) ) ( not ( = ?auto_142836 ?auto_142844 ) ) ( not ( = ?auto_142836 ?auto_142845 ) ) ( not ( = ?auto_142836 ?auto_142846 ) ) ( not ( = ?auto_142837 ?auto_142838 ) ) ( not ( = ?auto_142837 ?auto_142839 ) ) ( not ( = ?auto_142837 ?auto_142840 ) ) ( not ( = ?auto_142837 ?auto_142841 ) ) ( not ( = ?auto_142837 ?auto_142842 ) ) ( not ( = ?auto_142837 ?auto_142843 ) ) ( not ( = ?auto_142837 ?auto_142844 ) ) ( not ( = ?auto_142837 ?auto_142845 ) ) ( not ( = ?auto_142837 ?auto_142846 ) ) ( not ( = ?auto_142838 ?auto_142839 ) ) ( not ( = ?auto_142838 ?auto_142840 ) ) ( not ( = ?auto_142838 ?auto_142841 ) ) ( not ( = ?auto_142838 ?auto_142842 ) ) ( not ( = ?auto_142838 ?auto_142843 ) ) ( not ( = ?auto_142838 ?auto_142844 ) ) ( not ( = ?auto_142838 ?auto_142845 ) ) ( not ( = ?auto_142838 ?auto_142846 ) ) ( not ( = ?auto_142839 ?auto_142840 ) ) ( not ( = ?auto_142839 ?auto_142841 ) ) ( not ( = ?auto_142839 ?auto_142842 ) ) ( not ( = ?auto_142839 ?auto_142843 ) ) ( not ( = ?auto_142839 ?auto_142844 ) ) ( not ( = ?auto_142839 ?auto_142845 ) ) ( not ( = ?auto_142839 ?auto_142846 ) ) ( not ( = ?auto_142840 ?auto_142841 ) ) ( not ( = ?auto_142840 ?auto_142842 ) ) ( not ( = ?auto_142840 ?auto_142843 ) ) ( not ( = ?auto_142840 ?auto_142844 ) ) ( not ( = ?auto_142840 ?auto_142845 ) ) ( not ( = ?auto_142840 ?auto_142846 ) ) ( not ( = ?auto_142841 ?auto_142842 ) ) ( not ( = ?auto_142841 ?auto_142843 ) ) ( not ( = ?auto_142841 ?auto_142844 ) ) ( not ( = ?auto_142841 ?auto_142845 ) ) ( not ( = ?auto_142841 ?auto_142846 ) ) ( not ( = ?auto_142842 ?auto_142843 ) ) ( not ( = ?auto_142842 ?auto_142844 ) ) ( not ( = ?auto_142842 ?auto_142845 ) ) ( not ( = ?auto_142842 ?auto_142846 ) ) ( not ( = ?auto_142843 ?auto_142844 ) ) ( not ( = ?auto_142843 ?auto_142845 ) ) ( not ( = ?auto_142843 ?auto_142846 ) ) ( not ( = ?auto_142844 ?auto_142845 ) ) ( not ( = ?auto_142844 ?auto_142846 ) ) ( not ( = ?auto_142845 ?auto_142846 ) ) ( ON ?auto_142844 ?auto_142845 ) ( ON ?auto_142843 ?auto_142844 ) ( ON ?auto_142842 ?auto_142843 ) ( CLEAR ?auto_142840 ) ( ON ?auto_142841 ?auto_142842 ) ( CLEAR ?auto_142841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142836 ?auto_142837 ?auto_142838 ?auto_142839 ?auto_142840 ?auto_142841 )
      ( MAKE-10PILE ?auto_142836 ?auto_142837 ?auto_142838 ?auto_142839 ?auto_142840 ?auto_142841 ?auto_142842 ?auto_142843 ?auto_142844 ?auto_142845 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_142857 - BLOCK
      ?auto_142858 - BLOCK
      ?auto_142859 - BLOCK
      ?auto_142860 - BLOCK
      ?auto_142861 - BLOCK
      ?auto_142862 - BLOCK
      ?auto_142863 - BLOCK
      ?auto_142864 - BLOCK
      ?auto_142865 - BLOCK
      ?auto_142866 - BLOCK
    )
    :vars
    (
      ?auto_142867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142866 ?auto_142867 ) ( ON-TABLE ?auto_142857 ) ( ON ?auto_142858 ?auto_142857 ) ( ON ?auto_142859 ?auto_142858 ) ( ON ?auto_142860 ?auto_142859 ) ( ON ?auto_142861 ?auto_142860 ) ( not ( = ?auto_142857 ?auto_142858 ) ) ( not ( = ?auto_142857 ?auto_142859 ) ) ( not ( = ?auto_142857 ?auto_142860 ) ) ( not ( = ?auto_142857 ?auto_142861 ) ) ( not ( = ?auto_142857 ?auto_142862 ) ) ( not ( = ?auto_142857 ?auto_142863 ) ) ( not ( = ?auto_142857 ?auto_142864 ) ) ( not ( = ?auto_142857 ?auto_142865 ) ) ( not ( = ?auto_142857 ?auto_142866 ) ) ( not ( = ?auto_142857 ?auto_142867 ) ) ( not ( = ?auto_142858 ?auto_142859 ) ) ( not ( = ?auto_142858 ?auto_142860 ) ) ( not ( = ?auto_142858 ?auto_142861 ) ) ( not ( = ?auto_142858 ?auto_142862 ) ) ( not ( = ?auto_142858 ?auto_142863 ) ) ( not ( = ?auto_142858 ?auto_142864 ) ) ( not ( = ?auto_142858 ?auto_142865 ) ) ( not ( = ?auto_142858 ?auto_142866 ) ) ( not ( = ?auto_142858 ?auto_142867 ) ) ( not ( = ?auto_142859 ?auto_142860 ) ) ( not ( = ?auto_142859 ?auto_142861 ) ) ( not ( = ?auto_142859 ?auto_142862 ) ) ( not ( = ?auto_142859 ?auto_142863 ) ) ( not ( = ?auto_142859 ?auto_142864 ) ) ( not ( = ?auto_142859 ?auto_142865 ) ) ( not ( = ?auto_142859 ?auto_142866 ) ) ( not ( = ?auto_142859 ?auto_142867 ) ) ( not ( = ?auto_142860 ?auto_142861 ) ) ( not ( = ?auto_142860 ?auto_142862 ) ) ( not ( = ?auto_142860 ?auto_142863 ) ) ( not ( = ?auto_142860 ?auto_142864 ) ) ( not ( = ?auto_142860 ?auto_142865 ) ) ( not ( = ?auto_142860 ?auto_142866 ) ) ( not ( = ?auto_142860 ?auto_142867 ) ) ( not ( = ?auto_142861 ?auto_142862 ) ) ( not ( = ?auto_142861 ?auto_142863 ) ) ( not ( = ?auto_142861 ?auto_142864 ) ) ( not ( = ?auto_142861 ?auto_142865 ) ) ( not ( = ?auto_142861 ?auto_142866 ) ) ( not ( = ?auto_142861 ?auto_142867 ) ) ( not ( = ?auto_142862 ?auto_142863 ) ) ( not ( = ?auto_142862 ?auto_142864 ) ) ( not ( = ?auto_142862 ?auto_142865 ) ) ( not ( = ?auto_142862 ?auto_142866 ) ) ( not ( = ?auto_142862 ?auto_142867 ) ) ( not ( = ?auto_142863 ?auto_142864 ) ) ( not ( = ?auto_142863 ?auto_142865 ) ) ( not ( = ?auto_142863 ?auto_142866 ) ) ( not ( = ?auto_142863 ?auto_142867 ) ) ( not ( = ?auto_142864 ?auto_142865 ) ) ( not ( = ?auto_142864 ?auto_142866 ) ) ( not ( = ?auto_142864 ?auto_142867 ) ) ( not ( = ?auto_142865 ?auto_142866 ) ) ( not ( = ?auto_142865 ?auto_142867 ) ) ( not ( = ?auto_142866 ?auto_142867 ) ) ( ON ?auto_142865 ?auto_142866 ) ( ON ?auto_142864 ?auto_142865 ) ( ON ?auto_142863 ?auto_142864 ) ( CLEAR ?auto_142861 ) ( ON ?auto_142862 ?auto_142863 ) ( CLEAR ?auto_142862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142857 ?auto_142858 ?auto_142859 ?auto_142860 ?auto_142861 ?auto_142862 )
      ( MAKE-10PILE ?auto_142857 ?auto_142858 ?auto_142859 ?auto_142860 ?auto_142861 ?auto_142862 ?auto_142863 ?auto_142864 ?auto_142865 ?auto_142866 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_142878 - BLOCK
      ?auto_142879 - BLOCK
      ?auto_142880 - BLOCK
      ?auto_142881 - BLOCK
      ?auto_142882 - BLOCK
      ?auto_142883 - BLOCK
      ?auto_142884 - BLOCK
      ?auto_142885 - BLOCK
      ?auto_142886 - BLOCK
      ?auto_142887 - BLOCK
    )
    :vars
    (
      ?auto_142888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142887 ?auto_142888 ) ( ON-TABLE ?auto_142878 ) ( ON ?auto_142879 ?auto_142878 ) ( ON ?auto_142880 ?auto_142879 ) ( ON ?auto_142881 ?auto_142880 ) ( not ( = ?auto_142878 ?auto_142879 ) ) ( not ( = ?auto_142878 ?auto_142880 ) ) ( not ( = ?auto_142878 ?auto_142881 ) ) ( not ( = ?auto_142878 ?auto_142882 ) ) ( not ( = ?auto_142878 ?auto_142883 ) ) ( not ( = ?auto_142878 ?auto_142884 ) ) ( not ( = ?auto_142878 ?auto_142885 ) ) ( not ( = ?auto_142878 ?auto_142886 ) ) ( not ( = ?auto_142878 ?auto_142887 ) ) ( not ( = ?auto_142878 ?auto_142888 ) ) ( not ( = ?auto_142879 ?auto_142880 ) ) ( not ( = ?auto_142879 ?auto_142881 ) ) ( not ( = ?auto_142879 ?auto_142882 ) ) ( not ( = ?auto_142879 ?auto_142883 ) ) ( not ( = ?auto_142879 ?auto_142884 ) ) ( not ( = ?auto_142879 ?auto_142885 ) ) ( not ( = ?auto_142879 ?auto_142886 ) ) ( not ( = ?auto_142879 ?auto_142887 ) ) ( not ( = ?auto_142879 ?auto_142888 ) ) ( not ( = ?auto_142880 ?auto_142881 ) ) ( not ( = ?auto_142880 ?auto_142882 ) ) ( not ( = ?auto_142880 ?auto_142883 ) ) ( not ( = ?auto_142880 ?auto_142884 ) ) ( not ( = ?auto_142880 ?auto_142885 ) ) ( not ( = ?auto_142880 ?auto_142886 ) ) ( not ( = ?auto_142880 ?auto_142887 ) ) ( not ( = ?auto_142880 ?auto_142888 ) ) ( not ( = ?auto_142881 ?auto_142882 ) ) ( not ( = ?auto_142881 ?auto_142883 ) ) ( not ( = ?auto_142881 ?auto_142884 ) ) ( not ( = ?auto_142881 ?auto_142885 ) ) ( not ( = ?auto_142881 ?auto_142886 ) ) ( not ( = ?auto_142881 ?auto_142887 ) ) ( not ( = ?auto_142881 ?auto_142888 ) ) ( not ( = ?auto_142882 ?auto_142883 ) ) ( not ( = ?auto_142882 ?auto_142884 ) ) ( not ( = ?auto_142882 ?auto_142885 ) ) ( not ( = ?auto_142882 ?auto_142886 ) ) ( not ( = ?auto_142882 ?auto_142887 ) ) ( not ( = ?auto_142882 ?auto_142888 ) ) ( not ( = ?auto_142883 ?auto_142884 ) ) ( not ( = ?auto_142883 ?auto_142885 ) ) ( not ( = ?auto_142883 ?auto_142886 ) ) ( not ( = ?auto_142883 ?auto_142887 ) ) ( not ( = ?auto_142883 ?auto_142888 ) ) ( not ( = ?auto_142884 ?auto_142885 ) ) ( not ( = ?auto_142884 ?auto_142886 ) ) ( not ( = ?auto_142884 ?auto_142887 ) ) ( not ( = ?auto_142884 ?auto_142888 ) ) ( not ( = ?auto_142885 ?auto_142886 ) ) ( not ( = ?auto_142885 ?auto_142887 ) ) ( not ( = ?auto_142885 ?auto_142888 ) ) ( not ( = ?auto_142886 ?auto_142887 ) ) ( not ( = ?auto_142886 ?auto_142888 ) ) ( not ( = ?auto_142887 ?auto_142888 ) ) ( ON ?auto_142886 ?auto_142887 ) ( ON ?auto_142885 ?auto_142886 ) ( ON ?auto_142884 ?auto_142885 ) ( ON ?auto_142883 ?auto_142884 ) ( CLEAR ?auto_142881 ) ( ON ?auto_142882 ?auto_142883 ) ( CLEAR ?auto_142882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142878 ?auto_142879 ?auto_142880 ?auto_142881 ?auto_142882 )
      ( MAKE-10PILE ?auto_142878 ?auto_142879 ?auto_142880 ?auto_142881 ?auto_142882 ?auto_142883 ?auto_142884 ?auto_142885 ?auto_142886 ?auto_142887 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_142899 - BLOCK
      ?auto_142900 - BLOCK
      ?auto_142901 - BLOCK
      ?auto_142902 - BLOCK
      ?auto_142903 - BLOCK
      ?auto_142904 - BLOCK
      ?auto_142905 - BLOCK
      ?auto_142906 - BLOCK
      ?auto_142907 - BLOCK
      ?auto_142908 - BLOCK
    )
    :vars
    (
      ?auto_142909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142908 ?auto_142909 ) ( ON-TABLE ?auto_142899 ) ( ON ?auto_142900 ?auto_142899 ) ( ON ?auto_142901 ?auto_142900 ) ( ON ?auto_142902 ?auto_142901 ) ( not ( = ?auto_142899 ?auto_142900 ) ) ( not ( = ?auto_142899 ?auto_142901 ) ) ( not ( = ?auto_142899 ?auto_142902 ) ) ( not ( = ?auto_142899 ?auto_142903 ) ) ( not ( = ?auto_142899 ?auto_142904 ) ) ( not ( = ?auto_142899 ?auto_142905 ) ) ( not ( = ?auto_142899 ?auto_142906 ) ) ( not ( = ?auto_142899 ?auto_142907 ) ) ( not ( = ?auto_142899 ?auto_142908 ) ) ( not ( = ?auto_142899 ?auto_142909 ) ) ( not ( = ?auto_142900 ?auto_142901 ) ) ( not ( = ?auto_142900 ?auto_142902 ) ) ( not ( = ?auto_142900 ?auto_142903 ) ) ( not ( = ?auto_142900 ?auto_142904 ) ) ( not ( = ?auto_142900 ?auto_142905 ) ) ( not ( = ?auto_142900 ?auto_142906 ) ) ( not ( = ?auto_142900 ?auto_142907 ) ) ( not ( = ?auto_142900 ?auto_142908 ) ) ( not ( = ?auto_142900 ?auto_142909 ) ) ( not ( = ?auto_142901 ?auto_142902 ) ) ( not ( = ?auto_142901 ?auto_142903 ) ) ( not ( = ?auto_142901 ?auto_142904 ) ) ( not ( = ?auto_142901 ?auto_142905 ) ) ( not ( = ?auto_142901 ?auto_142906 ) ) ( not ( = ?auto_142901 ?auto_142907 ) ) ( not ( = ?auto_142901 ?auto_142908 ) ) ( not ( = ?auto_142901 ?auto_142909 ) ) ( not ( = ?auto_142902 ?auto_142903 ) ) ( not ( = ?auto_142902 ?auto_142904 ) ) ( not ( = ?auto_142902 ?auto_142905 ) ) ( not ( = ?auto_142902 ?auto_142906 ) ) ( not ( = ?auto_142902 ?auto_142907 ) ) ( not ( = ?auto_142902 ?auto_142908 ) ) ( not ( = ?auto_142902 ?auto_142909 ) ) ( not ( = ?auto_142903 ?auto_142904 ) ) ( not ( = ?auto_142903 ?auto_142905 ) ) ( not ( = ?auto_142903 ?auto_142906 ) ) ( not ( = ?auto_142903 ?auto_142907 ) ) ( not ( = ?auto_142903 ?auto_142908 ) ) ( not ( = ?auto_142903 ?auto_142909 ) ) ( not ( = ?auto_142904 ?auto_142905 ) ) ( not ( = ?auto_142904 ?auto_142906 ) ) ( not ( = ?auto_142904 ?auto_142907 ) ) ( not ( = ?auto_142904 ?auto_142908 ) ) ( not ( = ?auto_142904 ?auto_142909 ) ) ( not ( = ?auto_142905 ?auto_142906 ) ) ( not ( = ?auto_142905 ?auto_142907 ) ) ( not ( = ?auto_142905 ?auto_142908 ) ) ( not ( = ?auto_142905 ?auto_142909 ) ) ( not ( = ?auto_142906 ?auto_142907 ) ) ( not ( = ?auto_142906 ?auto_142908 ) ) ( not ( = ?auto_142906 ?auto_142909 ) ) ( not ( = ?auto_142907 ?auto_142908 ) ) ( not ( = ?auto_142907 ?auto_142909 ) ) ( not ( = ?auto_142908 ?auto_142909 ) ) ( ON ?auto_142907 ?auto_142908 ) ( ON ?auto_142906 ?auto_142907 ) ( ON ?auto_142905 ?auto_142906 ) ( ON ?auto_142904 ?auto_142905 ) ( CLEAR ?auto_142902 ) ( ON ?auto_142903 ?auto_142904 ) ( CLEAR ?auto_142903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142899 ?auto_142900 ?auto_142901 ?auto_142902 ?auto_142903 )
      ( MAKE-10PILE ?auto_142899 ?auto_142900 ?auto_142901 ?auto_142902 ?auto_142903 ?auto_142904 ?auto_142905 ?auto_142906 ?auto_142907 ?auto_142908 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_142920 - BLOCK
      ?auto_142921 - BLOCK
      ?auto_142922 - BLOCK
      ?auto_142923 - BLOCK
      ?auto_142924 - BLOCK
      ?auto_142925 - BLOCK
      ?auto_142926 - BLOCK
      ?auto_142927 - BLOCK
      ?auto_142928 - BLOCK
      ?auto_142929 - BLOCK
    )
    :vars
    (
      ?auto_142930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142929 ?auto_142930 ) ( ON-TABLE ?auto_142920 ) ( ON ?auto_142921 ?auto_142920 ) ( ON ?auto_142922 ?auto_142921 ) ( not ( = ?auto_142920 ?auto_142921 ) ) ( not ( = ?auto_142920 ?auto_142922 ) ) ( not ( = ?auto_142920 ?auto_142923 ) ) ( not ( = ?auto_142920 ?auto_142924 ) ) ( not ( = ?auto_142920 ?auto_142925 ) ) ( not ( = ?auto_142920 ?auto_142926 ) ) ( not ( = ?auto_142920 ?auto_142927 ) ) ( not ( = ?auto_142920 ?auto_142928 ) ) ( not ( = ?auto_142920 ?auto_142929 ) ) ( not ( = ?auto_142920 ?auto_142930 ) ) ( not ( = ?auto_142921 ?auto_142922 ) ) ( not ( = ?auto_142921 ?auto_142923 ) ) ( not ( = ?auto_142921 ?auto_142924 ) ) ( not ( = ?auto_142921 ?auto_142925 ) ) ( not ( = ?auto_142921 ?auto_142926 ) ) ( not ( = ?auto_142921 ?auto_142927 ) ) ( not ( = ?auto_142921 ?auto_142928 ) ) ( not ( = ?auto_142921 ?auto_142929 ) ) ( not ( = ?auto_142921 ?auto_142930 ) ) ( not ( = ?auto_142922 ?auto_142923 ) ) ( not ( = ?auto_142922 ?auto_142924 ) ) ( not ( = ?auto_142922 ?auto_142925 ) ) ( not ( = ?auto_142922 ?auto_142926 ) ) ( not ( = ?auto_142922 ?auto_142927 ) ) ( not ( = ?auto_142922 ?auto_142928 ) ) ( not ( = ?auto_142922 ?auto_142929 ) ) ( not ( = ?auto_142922 ?auto_142930 ) ) ( not ( = ?auto_142923 ?auto_142924 ) ) ( not ( = ?auto_142923 ?auto_142925 ) ) ( not ( = ?auto_142923 ?auto_142926 ) ) ( not ( = ?auto_142923 ?auto_142927 ) ) ( not ( = ?auto_142923 ?auto_142928 ) ) ( not ( = ?auto_142923 ?auto_142929 ) ) ( not ( = ?auto_142923 ?auto_142930 ) ) ( not ( = ?auto_142924 ?auto_142925 ) ) ( not ( = ?auto_142924 ?auto_142926 ) ) ( not ( = ?auto_142924 ?auto_142927 ) ) ( not ( = ?auto_142924 ?auto_142928 ) ) ( not ( = ?auto_142924 ?auto_142929 ) ) ( not ( = ?auto_142924 ?auto_142930 ) ) ( not ( = ?auto_142925 ?auto_142926 ) ) ( not ( = ?auto_142925 ?auto_142927 ) ) ( not ( = ?auto_142925 ?auto_142928 ) ) ( not ( = ?auto_142925 ?auto_142929 ) ) ( not ( = ?auto_142925 ?auto_142930 ) ) ( not ( = ?auto_142926 ?auto_142927 ) ) ( not ( = ?auto_142926 ?auto_142928 ) ) ( not ( = ?auto_142926 ?auto_142929 ) ) ( not ( = ?auto_142926 ?auto_142930 ) ) ( not ( = ?auto_142927 ?auto_142928 ) ) ( not ( = ?auto_142927 ?auto_142929 ) ) ( not ( = ?auto_142927 ?auto_142930 ) ) ( not ( = ?auto_142928 ?auto_142929 ) ) ( not ( = ?auto_142928 ?auto_142930 ) ) ( not ( = ?auto_142929 ?auto_142930 ) ) ( ON ?auto_142928 ?auto_142929 ) ( ON ?auto_142927 ?auto_142928 ) ( ON ?auto_142926 ?auto_142927 ) ( ON ?auto_142925 ?auto_142926 ) ( ON ?auto_142924 ?auto_142925 ) ( CLEAR ?auto_142922 ) ( ON ?auto_142923 ?auto_142924 ) ( CLEAR ?auto_142923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142920 ?auto_142921 ?auto_142922 ?auto_142923 )
      ( MAKE-10PILE ?auto_142920 ?auto_142921 ?auto_142922 ?auto_142923 ?auto_142924 ?auto_142925 ?auto_142926 ?auto_142927 ?auto_142928 ?auto_142929 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_142941 - BLOCK
      ?auto_142942 - BLOCK
      ?auto_142943 - BLOCK
      ?auto_142944 - BLOCK
      ?auto_142945 - BLOCK
      ?auto_142946 - BLOCK
      ?auto_142947 - BLOCK
      ?auto_142948 - BLOCK
      ?auto_142949 - BLOCK
      ?auto_142950 - BLOCK
    )
    :vars
    (
      ?auto_142951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142950 ?auto_142951 ) ( ON-TABLE ?auto_142941 ) ( ON ?auto_142942 ?auto_142941 ) ( ON ?auto_142943 ?auto_142942 ) ( not ( = ?auto_142941 ?auto_142942 ) ) ( not ( = ?auto_142941 ?auto_142943 ) ) ( not ( = ?auto_142941 ?auto_142944 ) ) ( not ( = ?auto_142941 ?auto_142945 ) ) ( not ( = ?auto_142941 ?auto_142946 ) ) ( not ( = ?auto_142941 ?auto_142947 ) ) ( not ( = ?auto_142941 ?auto_142948 ) ) ( not ( = ?auto_142941 ?auto_142949 ) ) ( not ( = ?auto_142941 ?auto_142950 ) ) ( not ( = ?auto_142941 ?auto_142951 ) ) ( not ( = ?auto_142942 ?auto_142943 ) ) ( not ( = ?auto_142942 ?auto_142944 ) ) ( not ( = ?auto_142942 ?auto_142945 ) ) ( not ( = ?auto_142942 ?auto_142946 ) ) ( not ( = ?auto_142942 ?auto_142947 ) ) ( not ( = ?auto_142942 ?auto_142948 ) ) ( not ( = ?auto_142942 ?auto_142949 ) ) ( not ( = ?auto_142942 ?auto_142950 ) ) ( not ( = ?auto_142942 ?auto_142951 ) ) ( not ( = ?auto_142943 ?auto_142944 ) ) ( not ( = ?auto_142943 ?auto_142945 ) ) ( not ( = ?auto_142943 ?auto_142946 ) ) ( not ( = ?auto_142943 ?auto_142947 ) ) ( not ( = ?auto_142943 ?auto_142948 ) ) ( not ( = ?auto_142943 ?auto_142949 ) ) ( not ( = ?auto_142943 ?auto_142950 ) ) ( not ( = ?auto_142943 ?auto_142951 ) ) ( not ( = ?auto_142944 ?auto_142945 ) ) ( not ( = ?auto_142944 ?auto_142946 ) ) ( not ( = ?auto_142944 ?auto_142947 ) ) ( not ( = ?auto_142944 ?auto_142948 ) ) ( not ( = ?auto_142944 ?auto_142949 ) ) ( not ( = ?auto_142944 ?auto_142950 ) ) ( not ( = ?auto_142944 ?auto_142951 ) ) ( not ( = ?auto_142945 ?auto_142946 ) ) ( not ( = ?auto_142945 ?auto_142947 ) ) ( not ( = ?auto_142945 ?auto_142948 ) ) ( not ( = ?auto_142945 ?auto_142949 ) ) ( not ( = ?auto_142945 ?auto_142950 ) ) ( not ( = ?auto_142945 ?auto_142951 ) ) ( not ( = ?auto_142946 ?auto_142947 ) ) ( not ( = ?auto_142946 ?auto_142948 ) ) ( not ( = ?auto_142946 ?auto_142949 ) ) ( not ( = ?auto_142946 ?auto_142950 ) ) ( not ( = ?auto_142946 ?auto_142951 ) ) ( not ( = ?auto_142947 ?auto_142948 ) ) ( not ( = ?auto_142947 ?auto_142949 ) ) ( not ( = ?auto_142947 ?auto_142950 ) ) ( not ( = ?auto_142947 ?auto_142951 ) ) ( not ( = ?auto_142948 ?auto_142949 ) ) ( not ( = ?auto_142948 ?auto_142950 ) ) ( not ( = ?auto_142948 ?auto_142951 ) ) ( not ( = ?auto_142949 ?auto_142950 ) ) ( not ( = ?auto_142949 ?auto_142951 ) ) ( not ( = ?auto_142950 ?auto_142951 ) ) ( ON ?auto_142949 ?auto_142950 ) ( ON ?auto_142948 ?auto_142949 ) ( ON ?auto_142947 ?auto_142948 ) ( ON ?auto_142946 ?auto_142947 ) ( ON ?auto_142945 ?auto_142946 ) ( CLEAR ?auto_142943 ) ( ON ?auto_142944 ?auto_142945 ) ( CLEAR ?auto_142944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142941 ?auto_142942 ?auto_142943 ?auto_142944 )
      ( MAKE-10PILE ?auto_142941 ?auto_142942 ?auto_142943 ?auto_142944 ?auto_142945 ?auto_142946 ?auto_142947 ?auto_142948 ?auto_142949 ?auto_142950 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_142962 - BLOCK
      ?auto_142963 - BLOCK
      ?auto_142964 - BLOCK
      ?auto_142965 - BLOCK
      ?auto_142966 - BLOCK
      ?auto_142967 - BLOCK
      ?auto_142968 - BLOCK
      ?auto_142969 - BLOCK
      ?auto_142970 - BLOCK
      ?auto_142971 - BLOCK
    )
    :vars
    (
      ?auto_142972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142971 ?auto_142972 ) ( ON-TABLE ?auto_142962 ) ( ON ?auto_142963 ?auto_142962 ) ( not ( = ?auto_142962 ?auto_142963 ) ) ( not ( = ?auto_142962 ?auto_142964 ) ) ( not ( = ?auto_142962 ?auto_142965 ) ) ( not ( = ?auto_142962 ?auto_142966 ) ) ( not ( = ?auto_142962 ?auto_142967 ) ) ( not ( = ?auto_142962 ?auto_142968 ) ) ( not ( = ?auto_142962 ?auto_142969 ) ) ( not ( = ?auto_142962 ?auto_142970 ) ) ( not ( = ?auto_142962 ?auto_142971 ) ) ( not ( = ?auto_142962 ?auto_142972 ) ) ( not ( = ?auto_142963 ?auto_142964 ) ) ( not ( = ?auto_142963 ?auto_142965 ) ) ( not ( = ?auto_142963 ?auto_142966 ) ) ( not ( = ?auto_142963 ?auto_142967 ) ) ( not ( = ?auto_142963 ?auto_142968 ) ) ( not ( = ?auto_142963 ?auto_142969 ) ) ( not ( = ?auto_142963 ?auto_142970 ) ) ( not ( = ?auto_142963 ?auto_142971 ) ) ( not ( = ?auto_142963 ?auto_142972 ) ) ( not ( = ?auto_142964 ?auto_142965 ) ) ( not ( = ?auto_142964 ?auto_142966 ) ) ( not ( = ?auto_142964 ?auto_142967 ) ) ( not ( = ?auto_142964 ?auto_142968 ) ) ( not ( = ?auto_142964 ?auto_142969 ) ) ( not ( = ?auto_142964 ?auto_142970 ) ) ( not ( = ?auto_142964 ?auto_142971 ) ) ( not ( = ?auto_142964 ?auto_142972 ) ) ( not ( = ?auto_142965 ?auto_142966 ) ) ( not ( = ?auto_142965 ?auto_142967 ) ) ( not ( = ?auto_142965 ?auto_142968 ) ) ( not ( = ?auto_142965 ?auto_142969 ) ) ( not ( = ?auto_142965 ?auto_142970 ) ) ( not ( = ?auto_142965 ?auto_142971 ) ) ( not ( = ?auto_142965 ?auto_142972 ) ) ( not ( = ?auto_142966 ?auto_142967 ) ) ( not ( = ?auto_142966 ?auto_142968 ) ) ( not ( = ?auto_142966 ?auto_142969 ) ) ( not ( = ?auto_142966 ?auto_142970 ) ) ( not ( = ?auto_142966 ?auto_142971 ) ) ( not ( = ?auto_142966 ?auto_142972 ) ) ( not ( = ?auto_142967 ?auto_142968 ) ) ( not ( = ?auto_142967 ?auto_142969 ) ) ( not ( = ?auto_142967 ?auto_142970 ) ) ( not ( = ?auto_142967 ?auto_142971 ) ) ( not ( = ?auto_142967 ?auto_142972 ) ) ( not ( = ?auto_142968 ?auto_142969 ) ) ( not ( = ?auto_142968 ?auto_142970 ) ) ( not ( = ?auto_142968 ?auto_142971 ) ) ( not ( = ?auto_142968 ?auto_142972 ) ) ( not ( = ?auto_142969 ?auto_142970 ) ) ( not ( = ?auto_142969 ?auto_142971 ) ) ( not ( = ?auto_142969 ?auto_142972 ) ) ( not ( = ?auto_142970 ?auto_142971 ) ) ( not ( = ?auto_142970 ?auto_142972 ) ) ( not ( = ?auto_142971 ?auto_142972 ) ) ( ON ?auto_142970 ?auto_142971 ) ( ON ?auto_142969 ?auto_142970 ) ( ON ?auto_142968 ?auto_142969 ) ( ON ?auto_142967 ?auto_142968 ) ( ON ?auto_142966 ?auto_142967 ) ( ON ?auto_142965 ?auto_142966 ) ( CLEAR ?auto_142963 ) ( ON ?auto_142964 ?auto_142965 ) ( CLEAR ?auto_142964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142962 ?auto_142963 ?auto_142964 )
      ( MAKE-10PILE ?auto_142962 ?auto_142963 ?auto_142964 ?auto_142965 ?auto_142966 ?auto_142967 ?auto_142968 ?auto_142969 ?auto_142970 ?auto_142971 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_142983 - BLOCK
      ?auto_142984 - BLOCK
      ?auto_142985 - BLOCK
      ?auto_142986 - BLOCK
      ?auto_142987 - BLOCK
      ?auto_142988 - BLOCK
      ?auto_142989 - BLOCK
      ?auto_142990 - BLOCK
      ?auto_142991 - BLOCK
      ?auto_142992 - BLOCK
    )
    :vars
    (
      ?auto_142993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142992 ?auto_142993 ) ( ON-TABLE ?auto_142983 ) ( ON ?auto_142984 ?auto_142983 ) ( not ( = ?auto_142983 ?auto_142984 ) ) ( not ( = ?auto_142983 ?auto_142985 ) ) ( not ( = ?auto_142983 ?auto_142986 ) ) ( not ( = ?auto_142983 ?auto_142987 ) ) ( not ( = ?auto_142983 ?auto_142988 ) ) ( not ( = ?auto_142983 ?auto_142989 ) ) ( not ( = ?auto_142983 ?auto_142990 ) ) ( not ( = ?auto_142983 ?auto_142991 ) ) ( not ( = ?auto_142983 ?auto_142992 ) ) ( not ( = ?auto_142983 ?auto_142993 ) ) ( not ( = ?auto_142984 ?auto_142985 ) ) ( not ( = ?auto_142984 ?auto_142986 ) ) ( not ( = ?auto_142984 ?auto_142987 ) ) ( not ( = ?auto_142984 ?auto_142988 ) ) ( not ( = ?auto_142984 ?auto_142989 ) ) ( not ( = ?auto_142984 ?auto_142990 ) ) ( not ( = ?auto_142984 ?auto_142991 ) ) ( not ( = ?auto_142984 ?auto_142992 ) ) ( not ( = ?auto_142984 ?auto_142993 ) ) ( not ( = ?auto_142985 ?auto_142986 ) ) ( not ( = ?auto_142985 ?auto_142987 ) ) ( not ( = ?auto_142985 ?auto_142988 ) ) ( not ( = ?auto_142985 ?auto_142989 ) ) ( not ( = ?auto_142985 ?auto_142990 ) ) ( not ( = ?auto_142985 ?auto_142991 ) ) ( not ( = ?auto_142985 ?auto_142992 ) ) ( not ( = ?auto_142985 ?auto_142993 ) ) ( not ( = ?auto_142986 ?auto_142987 ) ) ( not ( = ?auto_142986 ?auto_142988 ) ) ( not ( = ?auto_142986 ?auto_142989 ) ) ( not ( = ?auto_142986 ?auto_142990 ) ) ( not ( = ?auto_142986 ?auto_142991 ) ) ( not ( = ?auto_142986 ?auto_142992 ) ) ( not ( = ?auto_142986 ?auto_142993 ) ) ( not ( = ?auto_142987 ?auto_142988 ) ) ( not ( = ?auto_142987 ?auto_142989 ) ) ( not ( = ?auto_142987 ?auto_142990 ) ) ( not ( = ?auto_142987 ?auto_142991 ) ) ( not ( = ?auto_142987 ?auto_142992 ) ) ( not ( = ?auto_142987 ?auto_142993 ) ) ( not ( = ?auto_142988 ?auto_142989 ) ) ( not ( = ?auto_142988 ?auto_142990 ) ) ( not ( = ?auto_142988 ?auto_142991 ) ) ( not ( = ?auto_142988 ?auto_142992 ) ) ( not ( = ?auto_142988 ?auto_142993 ) ) ( not ( = ?auto_142989 ?auto_142990 ) ) ( not ( = ?auto_142989 ?auto_142991 ) ) ( not ( = ?auto_142989 ?auto_142992 ) ) ( not ( = ?auto_142989 ?auto_142993 ) ) ( not ( = ?auto_142990 ?auto_142991 ) ) ( not ( = ?auto_142990 ?auto_142992 ) ) ( not ( = ?auto_142990 ?auto_142993 ) ) ( not ( = ?auto_142991 ?auto_142992 ) ) ( not ( = ?auto_142991 ?auto_142993 ) ) ( not ( = ?auto_142992 ?auto_142993 ) ) ( ON ?auto_142991 ?auto_142992 ) ( ON ?auto_142990 ?auto_142991 ) ( ON ?auto_142989 ?auto_142990 ) ( ON ?auto_142988 ?auto_142989 ) ( ON ?auto_142987 ?auto_142988 ) ( ON ?auto_142986 ?auto_142987 ) ( CLEAR ?auto_142984 ) ( ON ?auto_142985 ?auto_142986 ) ( CLEAR ?auto_142985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142983 ?auto_142984 ?auto_142985 )
      ( MAKE-10PILE ?auto_142983 ?auto_142984 ?auto_142985 ?auto_142986 ?auto_142987 ?auto_142988 ?auto_142989 ?auto_142990 ?auto_142991 ?auto_142992 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_143004 - BLOCK
      ?auto_143005 - BLOCK
      ?auto_143006 - BLOCK
      ?auto_143007 - BLOCK
      ?auto_143008 - BLOCK
      ?auto_143009 - BLOCK
      ?auto_143010 - BLOCK
      ?auto_143011 - BLOCK
      ?auto_143012 - BLOCK
      ?auto_143013 - BLOCK
    )
    :vars
    (
      ?auto_143014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143013 ?auto_143014 ) ( ON-TABLE ?auto_143004 ) ( not ( = ?auto_143004 ?auto_143005 ) ) ( not ( = ?auto_143004 ?auto_143006 ) ) ( not ( = ?auto_143004 ?auto_143007 ) ) ( not ( = ?auto_143004 ?auto_143008 ) ) ( not ( = ?auto_143004 ?auto_143009 ) ) ( not ( = ?auto_143004 ?auto_143010 ) ) ( not ( = ?auto_143004 ?auto_143011 ) ) ( not ( = ?auto_143004 ?auto_143012 ) ) ( not ( = ?auto_143004 ?auto_143013 ) ) ( not ( = ?auto_143004 ?auto_143014 ) ) ( not ( = ?auto_143005 ?auto_143006 ) ) ( not ( = ?auto_143005 ?auto_143007 ) ) ( not ( = ?auto_143005 ?auto_143008 ) ) ( not ( = ?auto_143005 ?auto_143009 ) ) ( not ( = ?auto_143005 ?auto_143010 ) ) ( not ( = ?auto_143005 ?auto_143011 ) ) ( not ( = ?auto_143005 ?auto_143012 ) ) ( not ( = ?auto_143005 ?auto_143013 ) ) ( not ( = ?auto_143005 ?auto_143014 ) ) ( not ( = ?auto_143006 ?auto_143007 ) ) ( not ( = ?auto_143006 ?auto_143008 ) ) ( not ( = ?auto_143006 ?auto_143009 ) ) ( not ( = ?auto_143006 ?auto_143010 ) ) ( not ( = ?auto_143006 ?auto_143011 ) ) ( not ( = ?auto_143006 ?auto_143012 ) ) ( not ( = ?auto_143006 ?auto_143013 ) ) ( not ( = ?auto_143006 ?auto_143014 ) ) ( not ( = ?auto_143007 ?auto_143008 ) ) ( not ( = ?auto_143007 ?auto_143009 ) ) ( not ( = ?auto_143007 ?auto_143010 ) ) ( not ( = ?auto_143007 ?auto_143011 ) ) ( not ( = ?auto_143007 ?auto_143012 ) ) ( not ( = ?auto_143007 ?auto_143013 ) ) ( not ( = ?auto_143007 ?auto_143014 ) ) ( not ( = ?auto_143008 ?auto_143009 ) ) ( not ( = ?auto_143008 ?auto_143010 ) ) ( not ( = ?auto_143008 ?auto_143011 ) ) ( not ( = ?auto_143008 ?auto_143012 ) ) ( not ( = ?auto_143008 ?auto_143013 ) ) ( not ( = ?auto_143008 ?auto_143014 ) ) ( not ( = ?auto_143009 ?auto_143010 ) ) ( not ( = ?auto_143009 ?auto_143011 ) ) ( not ( = ?auto_143009 ?auto_143012 ) ) ( not ( = ?auto_143009 ?auto_143013 ) ) ( not ( = ?auto_143009 ?auto_143014 ) ) ( not ( = ?auto_143010 ?auto_143011 ) ) ( not ( = ?auto_143010 ?auto_143012 ) ) ( not ( = ?auto_143010 ?auto_143013 ) ) ( not ( = ?auto_143010 ?auto_143014 ) ) ( not ( = ?auto_143011 ?auto_143012 ) ) ( not ( = ?auto_143011 ?auto_143013 ) ) ( not ( = ?auto_143011 ?auto_143014 ) ) ( not ( = ?auto_143012 ?auto_143013 ) ) ( not ( = ?auto_143012 ?auto_143014 ) ) ( not ( = ?auto_143013 ?auto_143014 ) ) ( ON ?auto_143012 ?auto_143013 ) ( ON ?auto_143011 ?auto_143012 ) ( ON ?auto_143010 ?auto_143011 ) ( ON ?auto_143009 ?auto_143010 ) ( ON ?auto_143008 ?auto_143009 ) ( ON ?auto_143007 ?auto_143008 ) ( ON ?auto_143006 ?auto_143007 ) ( CLEAR ?auto_143004 ) ( ON ?auto_143005 ?auto_143006 ) ( CLEAR ?auto_143005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143004 ?auto_143005 )
      ( MAKE-10PILE ?auto_143004 ?auto_143005 ?auto_143006 ?auto_143007 ?auto_143008 ?auto_143009 ?auto_143010 ?auto_143011 ?auto_143012 ?auto_143013 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_143025 - BLOCK
      ?auto_143026 - BLOCK
      ?auto_143027 - BLOCK
      ?auto_143028 - BLOCK
      ?auto_143029 - BLOCK
      ?auto_143030 - BLOCK
      ?auto_143031 - BLOCK
      ?auto_143032 - BLOCK
      ?auto_143033 - BLOCK
      ?auto_143034 - BLOCK
    )
    :vars
    (
      ?auto_143035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143034 ?auto_143035 ) ( ON-TABLE ?auto_143025 ) ( not ( = ?auto_143025 ?auto_143026 ) ) ( not ( = ?auto_143025 ?auto_143027 ) ) ( not ( = ?auto_143025 ?auto_143028 ) ) ( not ( = ?auto_143025 ?auto_143029 ) ) ( not ( = ?auto_143025 ?auto_143030 ) ) ( not ( = ?auto_143025 ?auto_143031 ) ) ( not ( = ?auto_143025 ?auto_143032 ) ) ( not ( = ?auto_143025 ?auto_143033 ) ) ( not ( = ?auto_143025 ?auto_143034 ) ) ( not ( = ?auto_143025 ?auto_143035 ) ) ( not ( = ?auto_143026 ?auto_143027 ) ) ( not ( = ?auto_143026 ?auto_143028 ) ) ( not ( = ?auto_143026 ?auto_143029 ) ) ( not ( = ?auto_143026 ?auto_143030 ) ) ( not ( = ?auto_143026 ?auto_143031 ) ) ( not ( = ?auto_143026 ?auto_143032 ) ) ( not ( = ?auto_143026 ?auto_143033 ) ) ( not ( = ?auto_143026 ?auto_143034 ) ) ( not ( = ?auto_143026 ?auto_143035 ) ) ( not ( = ?auto_143027 ?auto_143028 ) ) ( not ( = ?auto_143027 ?auto_143029 ) ) ( not ( = ?auto_143027 ?auto_143030 ) ) ( not ( = ?auto_143027 ?auto_143031 ) ) ( not ( = ?auto_143027 ?auto_143032 ) ) ( not ( = ?auto_143027 ?auto_143033 ) ) ( not ( = ?auto_143027 ?auto_143034 ) ) ( not ( = ?auto_143027 ?auto_143035 ) ) ( not ( = ?auto_143028 ?auto_143029 ) ) ( not ( = ?auto_143028 ?auto_143030 ) ) ( not ( = ?auto_143028 ?auto_143031 ) ) ( not ( = ?auto_143028 ?auto_143032 ) ) ( not ( = ?auto_143028 ?auto_143033 ) ) ( not ( = ?auto_143028 ?auto_143034 ) ) ( not ( = ?auto_143028 ?auto_143035 ) ) ( not ( = ?auto_143029 ?auto_143030 ) ) ( not ( = ?auto_143029 ?auto_143031 ) ) ( not ( = ?auto_143029 ?auto_143032 ) ) ( not ( = ?auto_143029 ?auto_143033 ) ) ( not ( = ?auto_143029 ?auto_143034 ) ) ( not ( = ?auto_143029 ?auto_143035 ) ) ( not ( = ?auto_143030 ?auto_143031 ) ) ( not ( = ?auto_143030 ?auto_143032 ) ) ( not ( = ?auto_143030 ?auto_143033 ) ) ( not ( = ?auto_143030 ?auto_143034 ) ) ( not ( = ?auto_143030 ?auto_143035 ) ) ( not ( = ?auto_143031 ?auto_143032 ) ) ( not ( = ?auto_143031 ?auto_143033 ) ) ( not ( = ?auto_143031 ?auto_143034 ) ) ( not ( = ?auto_143031 ?auto_143035 ) ) ( not ( = ?auto_143032 ?auto_143033 ) ) ( not ( = ?auto_143032 ?auto_143034 ) ) ( not ( = ?auto_143032 ?auto_143035 ) ) ( not ( = ?auto_143033 ?auto_143034 ) ) ( not ( = ?auto_143033 ?auto_143035 ) ) ( not ( = ?auto_143034 ?auto_143035 ) ) ( ON ?auto_143033 ?auto_143034 ) ( ON ?auto_143032 ?auto_143033 ) ( ON ?auto_143031 ?auto_143032 ) ( ON ?auto_143030 ?auto_143031 ) ( ON ?auto_143029 ?auto_143030 ) ( ON ?auto_143028 ?auto_143029 ) ( ON ?auto_143027 ?auto_143028 ) ( CLEAR ?auto_143025 ) ( ON ?auto_143026 ?auto_143027 ) ( CLEAR ?auto_143026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143025 ?auto_143026 )
      ( MAKE-10PILE ?auto_143025 ?auto_143026 ?auto_143027 ?auto_143028 ?auto_143029 ?auto_143030 ?auto_143031 ?auto_143032 ?auto_143033 ?auto_143034 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_143046 - BLOCK
      ?auto_143047 - BLOCK
      ?auto_143048 - BLOCK
      ?auto_143049 - BLOCK
      ?auto_143050 - BLOCK
      ?auto_143051 - BLOCK
      ?auto_143052 - BLOCK
      ?auto_143053 - BLOCK
      ?auto_143054 - BLOCK
      ?auto_143055 - BLOCK
    )
    :vars
    (
      ?auto_143056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143055 ?auto_143056 ) ( not ( = ?auto_143046 ?auto_143047 ) ) ( not ( = ?auto_143046 ?auto_143048 ) ) ( not ( = ?auto_143046 ?auto_143049 ) ) ( not ( = ?auto_143046 ?auto_143050 ) ) ( not ( = ?auto_143046 ?auto_143051 ) ) ( not ( = ?auto_143046 ?auto_143052 ) ) ( not ( = ?auto_143046 ?auto_143053 ) ) ( not ( = ?auto_143046 ?auto_143054 ) ) ( not ( = ?auto_143046 ?auto_143055 ) ) ( not ( = ?auto_143046 ?auto_143056 ) ) ( not ( = ?auto_143047 ?auto_143048 ) ) ( not ( = ?auto_143047 ?auto_143049 ) ) ( not ( = ?auto_143047 ?auto_143050 ) ) ( not ( = ?auto_143047 ?auto_143051 ) ) ( not ( = ?auto_143047 ?auto_143052 ) ) ( not ( = ?auto_143047 ?auto_143053 ) ) ( not ( = ?auto_143047 ?auto_143054 ) ) ( not ( = ?auto_143047 ?auto_143055 ) ) ( not ( = ?auto_143047 ?auto_143056 ) ) ( not ( = ?auto_143048 ?auto_143049 ) ) ( not ( = ?auto_143048 ?auto_143050 ) ) ( not ( = ?auto_143048 ?auto_143051 ) ) ( not ( = ?auto_143048 ?auto_143052 ) ) ( not ( = ?auto_143048 ?auto_143053 ) ) ( not ( = ?auto_143048 ?auto_143054 ) ) ( not ( = ?auto_143048 ?auto_143055 ) ) ( not ( = ?auto_143048 ?auto_143056 ) ) ( not ( = ?auto_143049 ?auto_143050 ) ) ( not ( = ?auto_143049 ?auto_143051 ) ) ( not ( = ?auto_143049 ?auto_143052 ) ) ( not ( = ?auto_143049 ?auto_143053 ) ) ( not ( = ?auto_143049 ?auto_143054 ) ) ( not ( = ?auto_143049 ?auto_143055 ) ) ( not ( = ?auto_143049 ?auto_143056 ) ) ( not ( = ?auto_143050 ?auto_143051 ) ) ( not ( = ?auto_143050 ?auto_143052 ) ) ( not ( = ?auto_143050 ?auto_143053 ) ) ( not ( = ?auto_143050 ?auto_143054 ) ) ( not ( = ?auto_143050 ?auto_143055 ) ) ( not ( = ?auto_143050 ?auto_143056 ) ) ( not ( = ?auto_143051 ?auto_143052 ) ) ( not ( = ?auto_143051 ?auto_143053 ) ) ( not ( = ?auto_143051 ?auto_143054 ) ) ( not ( = ?auto_143051 ?auto_143055 ) ) ( not ( = ?auto_143051 ?auto_143056 ) ) ( not ( = ?auto_143052 ?auto_143053 ) ) ( not ( = ?auto_143052 ?auto_143054 ) ) ( not ( = ?auto_143052 ?auto_143055 ) ) ( not ( = ?auto_143052 ?auto_143056 ) ) ( not ( = ?auto_143053 ?auto_143054 ) ) ( not ( = ?auto_143053 ?auto_143055 ) ) ( not ( = ?auto_143053 ?auto_143056 ) ) ( not ( = ?auto_143054 ?auto_143055 ) ) ( not ( = ?auto_143054 ?auto_143056 ) ) ( not ( = ?auto_143055 ?auto_143056 ) ) ( ON ?auto_143054 ?auto_143055 ) ( ON ?auto_143053 ?auto_143054 ) ( ON ?auto_143052 ?auto_143053 ) ( ON ?auto_143051 ?auto_143052 ) ( ON ?auto_143050 ?auto_143051 ) ( ON ?auto_143049 ?auto_143050 ) ( ON ?auto_143048 ?auto_143049 ) ( ON ?auto_143047 ?auto_143048 ) ( ON ?auto_143046 ?auto_143047 ) ( CLEAR ?auto_143046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143046 )
      ( MAKE-10PILE ?auto_143046 ?auto_143047 ?auto_143048 ?auto_143049 ?auto_143050 ?auto_143051 ?auto_143052 ?auto_143053 ?auto_143054 ?auto_143055 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_143067 - BLOCK
      ?auto_143068 - BLOCK
      ?auto_143069 - BLOCK
      ?auto_143070 - BLOCK
      ?auto_143071 - BLOCK
      ?auto_143072 - BLOCK
      ?auto_143073 - BLOCK
      ?auto_143074 - BLOCK
      ?auto_143075 - BLOCK
      ?auto_143076 - BLOCK
    )
    :vars
    (
      ?auto_143077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143076 ?auto_143077 ) ( not ( = ?auto_143067 ?auto_143068 ) ) ( not ( = ?auto_143067 ?auto_143069 ) ) ( not ( = ?auto_143067 ?auto_143070 ) ) ( not ( = ?auto_143067 ?auto_143071 ) ) ( not ( = ?auto_143067 ?auto_143072 ) ) ( not ( = ?auto_143067 ?auto_143073 ) ) ( not ( = ?auto_143067 ?auto_143074 ) ) ( not ( = ?auto_143067 ?auto_143075 ) ) ( not ( = ?auto_143067 ?auto_143076 ) ) ( not ( = ?auto_143067 ?auto_143077 ) ) ( not ( = ?auto_143068 ?auto_143069 ) ) ( not ( = ?auto_143068 ?auto_143070 ) ) ( not ( = ?auto_143068 ?auto_143071 ) ) ( not ( = ?auto_143068 ?auto_143072 ) ) ( not ( = ?auto_143068 ?auto_143073 ) ) ( not ( = ?auto_143068 ?auto_143074 ) ) ( not ( = ?auto_143068 ?auto_143075 ) ) ( not ( = ?auto_143068 ?auto_143076 ) ) ( not ( = ?auto_143068 ?auto_143077 ) ) ( not ( = ?auto_143069 ?auto_143070 ) ) ( not ( = ?auto_143069 ?auto_143071 ) ) ( not ( = ?auto_143069 ?auto_143072 ) ) ( not ( = ?auto_143069 ?auto_143073 ) ) ( not ( = ?auto_143069 ?auto_143074 ) ) ( not ( = ?auto_143069 ?auto_143075 ) ) ( not ( = ?auto_143069 ?auto_143076 ) ) ( not ( = ?auto_143069 ?auto_143077 ) ) ( not ( = ?auto_143070 ?auto_143071 ) ) ( not ( = ?auto_143070 ?auto_143072 ) ) ( not ( = ?auto_143070 ?auto_143073 ) ) ( not ( = ?auto_143070 ?auto_143074 ) ) ( not ( = ?auto_143070 ?auto_143075 ) ) ( not ( = ?auto_143070 ?auto_143076 ) ) ( not ( = ?auto_143070 ?auto_143077 ) ) ( not ( = ?auto_143071 ?auto_143072 ) ) ( not ( = ?auto_143071 ?auto_143073 ) ) ( not ( = ?auto_143071 ?auto_143074 ) ) ( not ( = ?auto_143071 ?auto_143075 ) ) ( not ( = ?auto_143071 ?auto_143076 ) ) ( not ( = ?auto_143071 ?auto_143077 ) ) ( not ( = ?auto_143072 ?auto_143073 ) ) ( not ( = ?auto_143072 ?auto_143074 ) ) ( not ( = ?auto_143072 ?auto_143075 ) ) ( not ( = ?auto_143072 ?auto_143076 ) ) ( not ( = ?auto_143072 ?auto_143077 ) ) ( not ( = ?auto_143073 ?auto_143074 ) ) ( not ( = ?auto_143073 ?auto_143075 ) ) ( not ( = ?auto_143073 ?auto_143076 ) ) ( not ( = ?auto_143073 ?auto_143077 ) ) ( not ( = ?auto_143074 ?auto_143075 ) ) ( not ( = ?auto_143074 ?auto_143076 ) ) ( not ( = ?auto_143074 ?auto_143077 ) ) ( not ( = ?auto_143075 ?auto_143076 ) ) ( not ( = ?auto_143075 ?auto_143077 ) ) ( not ( = ?auto_143076 ?auto_143077 ) ) ( ON ?auto_143075 ?auto_143076 ) ( ON ?auto_143074 ?auto_143075 ) ( ON ?auto_143073 ?auto_143074 ) ( ON ?auto_143072 ?auto_143073 ) ( ON ?auto_143071 ?auto_143072 ) ( ON ?auto_143070 ?auto_143071 ) ( ON ?auto_143069 ?auto_143070 ) ( ON ?auto_143068 ?auto_143069 ) ( ON ?auto_143067 ?auto_143068 ) ( CLEAR ?auto_143067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143067 )
      ( MAKE-10PILE ?auto_143067 ?auto_143068 ?auto_143069 ?auto_143070 ?auto_143071 ?auto_143072 ?auto_143073 ?auto_143074 ?auto_143075 ?auto_143076 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143089 - BLOCK
      ?auto_143090 - BLOCK
      ?auto_143091 - BLOCK
      ?auto_143092 - BLOCK
      ?auto_143093 - BLOCK
      ?auto_143094 - BLOCK
      ?auto_143095 - BLOCK
      ?auto_143096 - BLOCK
      ?auto_143097 - BLOCK
      ?auto_143098 - BLOCK
      ?auto_143099 - BLOCK
    )
    :vars
    (
      ?auto_143100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143098 ) ( ON ?auto_143099 ?auto_143100 ) ( CLEAR ?auto_143099 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143089 ) ( ON ?auto_143090 ?auto_143089 ) ( ON ?auto_143091 ?auto_143090 ) ( ON ?auto_143092 ?auto_143091 ) ( ON ?auto_143093 ?auto_143092 ) ( ON ?auto_143094 ?auto_143093 ) ( ON ?auto_143095 ?auto_143094 ) ( ON ?auto_143096 ?auto_143095 ) ( ON ?auto_143097 ?auto_143096 ) ( ON ?auto_143098 ?auto_143097 ) ( not ( = ?auto_143089 ?auto_143090 ) ) ( not ( = ?auto_143089 ?auto_143091 ) ) ( not ( = ?auto_143089 ?auto_143092 ) ) ( not ( = ?auto_143089 ?auto_143093 ) ) ( not ( = ?auto_143089 ?auto_143094 ) ) ( not ( = ?auto_143089 ?auto_143095 ) ) ( not ( = ?auto_143089 ?auto_143096 ) ) ( not ( = ?auto_143089 ?auto_143097 ) ) ( not ( = ?auto_143089 ?auto_143098 ) ) ( not ( = ?auto_143089 ?auto_143099 ) ) ( not ( = ?auto_143089 ?auto_143100 ) ) ( not ( = ?auto_143090 ?auto_143091 ) ) ( not ( = ?auto_143090 ?auto_143092 ) ) ( not ( = ?auto_143090 ?auto_143093 ) ) ( not ( = ?auto_143090 ?auto_143094 ) ) ( not ( = ?auto_143090 ?auto_143095 ) ) ( not ( = ?auto_143090 ?auto_143096 ) ) ( not ( = ?auto_143090 ?auto_143097 ) ) ( not ( = ?auto_143090 ?auto_143098 ) ) ( not ( = ?auto_143090 ?auto_143099 ) ) ( not ( = ?auto_143090 ?auto_143100 ) ) ( not ( = ?auto_143091 ?auto_143092 ) ) ( not ( = ?auto_143091 ?auto_143093 ) ) ( not ( = ?auto_143091 ?auto_143094 ) ) ( not ( = ?auto_143091 ?auto_143095 ) ) ( not ( = ?auto_143091 ?auto_143096 ) ) ( not ( = ?auto_143091 ?auto_143097 ) ) ( not ( = ?auto_143091 ?auto_143098 ) ) ( not ( = ?auto_143091 ?auto_143099 ) ) ( not ( = ?auto_143091 ?auto_143100 ) ) ( not ( = ?auto_143092 ?auto_143093 ) ) ( not ( = ?auto_143092 ?auto_143094 ) ) ( not ( = ?auto_143092 ?auto_143095 ) ) ( not ( = ?auto_143092 ?auto_143096 ) ) ( not ( = ?auto_143092 ?auto_143097 ) ) ( not ( = ?auto_143092 ?auto_143098 ) ) ( not ( = ?auto_143092 ?auto_143099 ) ) ( not ( = ?auto_143092 ?auto_143100 ) ) ( not ( = ?auto_143093 ?auto_143094 ) ) ( not ( = ?auto_143093 ?auto_143095 ) ) ( not ( = ?auto_143093 ?auto_143096 ) ) ( not ( = ?auto_143093 ?auto_143097 ) ) ( not ( = ?auto_143093 ?auto_143098 ) ) ( not ( = ?auto_143093 ?auto_143099 ) ) ( not ( = ?auto_143093 ?auto_143100 ) ) ( not ( = ?auto_143094 ?auto_143095 ) ) ( not ( = ?auto_143094 ?auto_143096 ) ) ( not ( = ?auto_143094 ?auto_143097 ) ) ( not ( = ?auto_143094 ?auto_143098 ) ) ( not ( = ?auto_143094 ?auto_143099 ) ) ( not ( = ?auto_143094 ?auto_143100 ) ) ( not ( = ?auto_143095 ?auto_143096 ) ) ( not ( = ?auto_143095 ?auto_143097 ) ) ( not ( = ?auto_143095 ?auto_143098 ) ) ( not ( = ?auto_143095 ?auto_143099 ) ) ( not ( = ?auto_143095 ?auto_143100 ) ) ( not ( = ?auto_143096 ?auto_143097 ) ) ( not ( = ?auto_143096 ?auto_143098 ) ) ( not ( = ?auto_143096 ?auto_143099 ) ) ( not ( = ?auto_143096 ?auto_143100 ) ) ( not ( = ?auto_143097 ?auto_143098 ) ) ( not ( = ?auto_143097 ?auto_143099 ) ) ( not ( = ?auto_143097 ?auto_143100 ) ) ( not ( = ?auto_143098 ?auto_143099 ) ) ( not ( = ?auto_143098 ?auto_143100 ) ) ( not ( = ?auto_143099 ?auto_143100 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143099 ?auto_143100 )
      ( !STACK ?auto_143099 ?auto_143098 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143112 - BLOCK
      ?auto_143113 - BLOCK
      ?auto_143114 - BLOCK
      ?auto_143115 - BLOCK
      ?auto_143116 - BLOCK
      ?auto_143117 - BLOCK
      ?auto_143118 - BLOCK
      ?auto_143119 - BLOCK
      ?auto_143120 - BLOCK
      ?auto_143121 - BLOCK
      ?auto_143122 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143121 ) ( ON-TABLE ?auto_143122 ) ( CLEAR ?auto_143122 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143112 ) ( ON ?auto_143113 ?auto_143112 ) ( ON ?auto_143114 ?auto_143113 ) ( ON ?auto_143115 ?auto_143114 ) ( ON ?auto_143116 ?auto_143115 ) ( ON ?auto_143117 ?auto_143116 ) ( ON ?auto_143118 ?auto_143117 ) ( ON ?auto_143119 ?auto_143118 ) ( ON ?auto_143120 ?auto_143119 ) ( ON ?auto_143121 ?auto_143120 ) ( not ( = ?auto_143112 ?auto_143113 ) ) ( not ( = ?auto_143112 ?auto_143114 ) ) ( not ( = ?auto_143112 ?auto_143115 ) ) ( not ( = ?auto_143112 ?auto_143116 ) ) ( not ( = ?auto_143112 ?auto_143117 ) ) ( not ( = ?auto_143112 ?auto_143118 ) ) ( not ( = ?auto_143112 ?auto_143119 ) ) ( not ( = ?auto_143112 ?auto_143120 ) ) ( not ( = ?auto_143112 ?auto_143121 ) ) ( not ( = ?auto_143112 ?auto_143122 ) ) ( not ( = ?auto_143113 ?auto_143114 ) ) ( not ( = ?auto_143113 ?auto_143115 ) ) ( not ( = ?auto_143113 ?auto_143116 ) ) ( not ( = ?auto_143113 ?auto_143117 ) ) ( not ( = ?auto_143113 ?auto_143118 ) ) ( not ( = ?auto_143113 ?auto_143119 ) ) ( not ( = ?auto_143113 ?auto_143120 ) ) ( not ( = ?auto_143113 ?auto_143121 ) ) ( not ( = ?auto_143113 ?auto_143122 ) ) ( not ( = ?auto_143114 ?auto_143115 ) ) ( not ( = ?auto_143114 ?auto_143116 ) ) ( not ( = ?auto_143114 ?auto_143117 ) ) ( not ( = ?auto_143114 ?auto_143118 ) ) ( not ( = ?auto_143114 ?auto_143119 ) ) ( not ( = ?auto_143114 ?auto_143120 ) ) ( not ( = ?auto_143114 ?auto_143121 ) ) ( not ( = ?auto_143114 ?auto_143122 ) ) ( not ( = ?auto_143115 ?auto_143116 ) ) ( not ( = ?auto_143115 ?auto_143117 ) ) ( not ( = ?auto_143115 ?auto_143118 ) ) ( not ( = ?auto_143115 ?auto_143119 ) ) ( not ( = ?auto_143115 ?auto_143120 ) ) ( not ( = ?auto_143115 ?auto_143121 ) ) ( not ( = ?auto_143115 ?auto_143122 ) ) ( not ( = ?auto_143116 ?auto_143117 ) ) ( not ( = ?auto_143116 ?auto_143118 ) ) ( not ( = ?auto_143116 ?auto_143119 ) ) ( not ( = ?auto_143116 ?auto_143120 ) ) ( not ( = ?auto_143116 ?auto_143121 ) ) ( not ( = ?auto_143116 ?auto_143122 ) ) ( not ( = ?auto_143117 ?auto_143118 ) ) ( not ( = ?auto_143117 ?auto_143119 ) ) ( not ( = ?auto_143117 ?auto_143120 ) ) ( not ( = ?auto_143117 ?auto_143121 ) ) ( not ( = ?auto_143117 ?auto_143122 ) ) ( not ( = ?auto_143118 ?auto_143119 ) ) ( not ( = ?auto_143118 ?auto_143120 ) ) ( not ( = ?auto_143118 ?auto_143121 ) ) ( not ( = ?auto_143118 ?auto_143122 ) ) ( not ( = ?auto_143119 ?auto_143120 ) ) ( not ( = ?auto_143119 ?auto_143121 ) ) ( not ( = ?auto_143119 ?auto_143122 ) ) ( not ( = ?auto_143120 ?auto_143121 ) ) ( not ( = ?auto_143120 ?auto_143122 ) ) ( not ( = ?auto_143121 ?auto_143122 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_143122 )
      ( !STACK ?auto_143122 ?auto_143121 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143134 - BLOCK
      ?auto_143135 - BLOCK
      ?auto_143136 - BLOCK
      ?auto_143137 - BLOCK
      ?auto_143138 - BLOCK
      ?auto_143139 - BLOCK
      ?auto_143140 - BLOCK
      ?auto_143141 - BLOCK
      ?auto_143142 - BLOCK
      ?auto_143143 - BLOCK
      ?auto_143144 - BLOCK
    )
    :vars
    (
      ?auto_143145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143144 ?auto_143145 ) ( ON-TABLE ?auto_143134 ) ( ON ?auto_143135 ?auto_143134 ) ( ON ?auto_143136 ?auto_143135 ) ( ON ?auto_143137 ?auto_143136 ) ( ON ?auto_143138 ?auto_143137 ) ( ON ?auto_143139 ?auto_143138 ) ( ON ?auto_143140 ?auto_143139 ) ( ON ?auto_143141 ?auto_143140 ) ( ON ?auto_143142 ?auto_143141 ) ( not ( = ?auto_143134 ?auto_143135 ) ) ( not ( = ?auto_143134 ?auto_143136 ) ) ( not ( = ?auto_143134 ?auto_143137 ) ) ( not ( = ?auto_143134 ?auto_143138 ) ) ( not ( = ?auto_143134 ?auto_143139 ) ) ( not ( = ?auto_143134 ?auto_143140 ) ) ( not ( = ?auto_143134 ?auto_143141 ) ) ( not ( = ?auto_143134 ?auto_143142 ) ) ( not ( = ?auto_143134 ?auto_143143 ) ) ( not ( = ?auto_143134 ?auto_143144 ) ) ( not ( = ?auto_143134 ?auto_143145 ) ) ( not ( = ?auto_143135 ?auto_143136 ) ) ( not ( = ?auto_143135 ?auto_143137 ) ) ( not ( = ?auto_143135 ?auto_143138 ) ) ( not ( = ?auto_143135 ?auto_143139 ) ) ( not ( = ?auto_143135 ?auto_143140 ) ) ( not ( = ?auto_143135 ?auto_143141 ) ) ( not ( = ?auto_143135 ?auto_143142 ) ) ( not ( = ?auto_143135 ?auto_143143 ) ) ( not ( = ?auto_143135 ?auto_143144 ) ) ( not ( = ?auto_143135 ?auto_143145 ) ) ( not ( = ?auto_143136 ?auto_143137 ) ) ( not ( = ?auto_143136 ?auto_143138 ) ) ( not ( = ?auto_143136 ?auto_143139 ) ) ( not ( = ?auto_143136 ?auto_143140 ) ) ( not ( = ?auto_143136 ?auto_143141 ) ) ( not ( = ?auto_143136 ?auto_143142 ) ) ( not ( = ?auto_143136 ?auto_143143 ) ) ( not ( = ?auto_143136 ?auto_143144 ) ) ( not ( = ?auto_143136 ?auto_143145 ) ) ( not ( = ?auto_143137 ?auto_143138 ) ) ( not ( = ?auto_143137 ?auto_143139 ) ) ( not ( = ?auto_143137 ?auto_143140 ) ) ( not ( = ?auto_143137 ?auto_143141 ) ) ( not ( = ?auto_143137 ?auto_143142 ) ) ( not ( = ?auto_143137 ?auto_143143 ) ) ( not ( = ?auto_143137 ?auto_143144 ) ) ( not ( = ?auto_143137 ?auto_143145 ) ) ( not ( = ?auto_143138 ?auto_143139 ) ) ( not ( = ?auto_143138 ?auto_143140 ) ) ( not ( = ?auto_143138 ?auto_143141 ) ) ( not ( = ?auto_143138 ?auto_143142 ) ) ( not ( = ?auto_143138 ?auto_143143 ) ) ( not ( = ?auto_143138 ?auto_143144 ) ) ( not ( = ?auto_143138 ?auto_143145 ) ) ( not ( = ?auto_143139 ?auto_143140 ) ) ( not ( = ?auto_143139 ?auto_143141 ) ) ( not ( = ?auto_143139 ?auto_143142 ) ) ( not ( = ?auto_143139 ?auto_143143 ) ) ( not ( = ?auto_143139 ?auto_143144 ) ) ( not ( = ?auto_143139 ?auto_143145 ) ) ( not ( = ?auto_143140 ?auto_143141 ) ) ( not ( = ?auto_143140 ?auto_143142 ) ) ( not ( = ?auto_143140 ?auto_143143 ) ) ( not ( = ?auto_143140 ?auto_143144 ) ) ( not ( = ?auto_143140 ?auto_143145 ) ) ( not ( = ?auto_143141 ?auto_143142 ) ) ( not ( = ?auto_143141 ?auto_143143 ) ) ( not ( = ?auto_143141 ?auto_143144 ) ) ( not ( = ?auto_143141 ?auto_143145 ) ) ( not ( = ?auto_143142 ?auto_143143 ) ) ( not ( = ?auto_143142 ?auto_143144 ) ) ( not ( = ?auto_143142 ?auto_143145 ) ) ( not ( = ?auto_143143 ?auto_143144 ) ) ( not ( = ?auto_143143 ?auto_143145 ) ) ( not ( = ?auto_143144 ?auto_143145 ) ) ( CLEAR ?auto_143142 ) ( ON ?auto_143143 ?auto_143144 ) ( CLEAR ?auto_143143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_143134 ?auto_143135 ?auto_143136 ?auto_143137 ?auto_143138 ?auto_143139 ?auto_143140 ?auto_143141 ?auto_143142 ?auto_143143 )
      ( MAKE-11PILE ?auto_143134 ?auto_143135 ?auto_143136 ?auto_143137 ?auto_143138 ?auto_143139 ?auto_143140 ?auto_143141 ?auto_143142 ?auto_143143 ?auto_143144 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143157 - BLOCK
      ?auto_143158 - BLOCK
      ?auto_143159 - BLOCK
      ?auto_143160 - BLOCK
      ?auto_143161 - BLOCK
      ?auto_143162 - BLOCK
      ?auto_143163 - BLOCK
      ?auto_143164 - BLOCK
      ?auto_143165 - BLOCK
      ?auto_143166 - BLOCK
      ?auto_143167 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143167 ) ( ON-TABLE ?auto_143157 ) ( ON ?auto_143158 ?auto_143157 ) ( ON ?auto_143159 ?auto_143158 ) ( ON ?auto_143160 ?auto_143159 ) ( ON ?auto_143161 ?auto_143160 ) ( ON ?auto_143162 ?auto_143161 ) ( ON ?auto_143163 ?auto_143162 ) ( ON ?auto_143164 ?auto_143163 ) ( ON ?auto_143165 ?auto_143164 ) ( not ( = ?auto_143157 ?auto_143158 ) ) ( not ( = ?auto_143157 ?auto_143159 ) ) ( not ( = ?auto_143157 ?auto_143160 ) ) ( not ( = ?auto_143157 ?auto_143161 ) ) ( not ( = ?auto_143157 ?auto_143162 ) ) ( not ( = ?auto_143157 ?auto_143163 ) ) ( not ( = ?auto_143157 ?auto_143164 ) ) ( not ( = ?auto_143157 ?auto_143165 ) ) ( not ( = ?auto_143157 ?auto_143166 ) ) ( not ( = ?auto_143157 ?auto_143167 ) ) ( not ( = ?auto_143158 ?auto_143159 ) ) ( not ( = ?auto_143158 ?auto_143160 ) ) ( not ( = ?auto_143158 ?auto_143161 ) ) ( not ( = ?auto_143158 ?auto_143162 ) ) ( not ( = ?auto_143158 ?auto_143163 ) ) ( not ( = ?auto_143158 ?auto_143164 ) ) ( not ( = ?auto_143158 ?auto_143165 ) ) ( not ( = ?auto_143158 ?auto_143166 ) ) ( not ( = ?auto_143158 ?auto_143167 ) ) ( not ( = ?auto_143159 ?auto_143160 ) ) ( not ( = ?auto_143159 ?auto_143161 ) ) ( not ( = ?auto_143159 ?auto_143162 ) ) ( not ( = ?auto_143159 ?auto_143163 ) ) ( not ( = ?auto_143159 ?auto_143164 ) ) ( not ( = ?auto_143159 ?auto_143165 ) ) ( not ( = ?auto_143159 ?auto_143166 ) ) ( not ( = ?auto_143159 ?auto_143167 ) ) ( not ( = ?auto_143160 ?auto_143161 ) ) ( not ( = ?auto_143160 ?auto_143162 ) ) ( not ( = ?auto_143160 ?auto_143163 ) ) ( not ( = ?auto_143160 ?auto_143164 ) ) ( not ( = ?auto_143160 ?auto_143165 ) ) ( not ( = ?auto_143160 ?auto_143166 ) ) ( not ( = ?auto_143160 ?auto_143167 ) ) ( not ( = ?auto_143161 ?auto_143162 ) ) ( not ( = ?auto_143161 ?auto_143163 ) ) ( not ( = ?auto_143161 ?auto_143164 ) ) ( not ( = ?auto_143161 ?auto_143165 ) ) ( not ( = ?auto_143161 ?auto_143166 ) ) ( not ( = ?auto_143161 ?auto_143167 ) ) ( not ( = ?auto_143162 ?auto_143163 ) ) ( not ( = ?auto_143162 ?auto_143164 ) ) ( not ( = ?auto_143162 ?auto_143165 ) ) ( not ( = ?auto_143162 ?auto_143166 ) ) ( not ( = ?auto_143162 ?auto_143167 ) ) ( not ( = ?auto_143163 ?auto_143164 ) ) ( not ( = ?auto_143163 ?auto_143165 ) ) ( not ( = ?auto_143163 ?auto_143166 ) ) ( not ( = ?auto_143163 ?auto_143167 ) ) ( not ( = ?auto_143164 ?auto_143165 ) ) ( not ( = ?auto_143164 ?auto_143166 ) ) ( not ( = ?auto_143164 ?auto_143167 ) ) ( not ( = ?auto_143165 ?auto_143166 ) ) ( not ( = ?auto_143165 ?auto_143167 ) ) ( not ( = ?auto_143166 ?auto_143167 ) ) ( CLEAR ?auto_143165 ) ( ON ?auto_143166 ?auto_143167 ) ( CLEAR ?auto_143166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_143157 ?auto_143158 ?auto_143159 ?auto_143160 ?auto_143161 ?auto_143162 ?auto_143163 ?auto_143164 ?auto_143165 ?auto_143166 )
      ( MAKE-11PILE ?auto_143157 ?auto_143158 ?auto_143159 ?auto_143160 ?auto_143161 ?auto_143162 ?auto_143163 ?auto_143164 ?auto_143165 ?auto_143166 ?auto_143167 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143179 - BLOCK
      ?auto_143180 - BLOCK
      ?auto_143181 - BLOCK
      ?auto_143182 - BLOCK
      ?auto_143183 - BLOCK
      ?auto_143184 - BLOCK
      ?auto_143185 - BLOCK
      ?auto_143186 - BLOCK
      ?auto_143187 - BLOCK
      ?auto_143188 - BLOCK
      ?auto_143189 - BLOCK
    )
    :vars
    (
      ?auto_143190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143189 ?auto_143190 ) ( ON-TABLE ?auto_143179 ) ( ON ?auto_143180 ?auto_143179 ) ( ON ?auto_143181 ?auto_143180 ) ( ON ?auto_143182 ?auto_143181 ) ( ON ?auto_143183 ?auto_143182 ) ( ON ?auto_143184 ?auto_143183 ) ( ON ?auto_143185 ?auto_143184 ) ( ON ?auto_143186 ?auto_143185 ) ( not ( = ?auto_143179 ?auto_143180 ) ) ( not ( = ?auto_143179 ?auto_143181 ) ) ( not ( = ?auto_143179 ?auto_143182 ) ) ( not ( = ?auto_143179 ?auto_143183 ) ) ( not ( = ?auto_143179 ?auto_143184 ) ) ( not ( = ?auto_143179 ?auto_143185 ) ) ( not ( = ?auto_143179 ?auto_143186 ) ) ( not ( = ?auto_143179 ?auto_143187 ) ) ( not ( = ?auto_143179 ?auto_143188 ) ) ( not ( = ?auto_143179 ?auto_143189 ) ) ( not ( = ?auto_143179 ?auto_143190 ) ) ( not ( = ?auto_143180 ?auto_143181 ) ) ( not ( = ?auto_143180 ?auto_143182 ) ) ( not ( = ?auto_143180 ?auto_143183 ) ) ( not ( = ?auto_143180 ?auto_143184 ) ) ( not ( = ?auto_143180 ?auto_143185 ) ) ( not ( = ?auto_143180 ?auto_143186 ) ) ( not ( = ?auto_143180 ?auto_143187 ) ) ( not ( = ?auto_143180 ?auto_143188 ) ) ( not ( = ?auto_143180 ?auto_143189 ) ) ( not ( = ?auto_143180 ?auto_143190 ) ) ( not ( = ?auto_143181 ?auto_143182 ) ) ( not ( = ?auto_143181 ?auto_143183 ) ) ( not ( = ?auto_143181 ?auto_143184 ) ) ( not ( = ?auto_143181 ?auto_143185 ) ) ( not ( = ?auto_143181 ?auto_143186 ) ) ( not ( = ?auto_143181 ?auto_143187 ) ) ( not ( = ?auto_143181 ?auto_143188 ) ) ( not ( = ?auto_143181 ?auto_143189 ) ) ( not ( = ?auto_143181 ?auto_143190 ) ) ( not ( = ?auto_143182 ?auto_143183 ) ) ( not ( = ?auto_143182 ?auto_143184 ) ) ( not ( = ?auto_143182 ?auto_143185 ) ) ( not ( = ?auto_143182 ?auto_143186 ) ) ( not ( = ?auto_143182 ?auto_143187 ) ) ( not ( = ?auto_143182 ?auto_143188 ) ) ( not ( = ?auto_143182 ?auto_143189 ) ) ( not ( = ?auto_143182 ?auto_143190 ) ) ( not ( = ?auto_143183 ?auto_143184 ) ) ( not ( = ?auto_143183 ?auto_143185 ) ) ( not ( = ?auto_143183 ?auto_143186 ) ) ( not ( = ?auto_143183 ?auto_143187 ) ) ( not ( = ?auto_143183 ?auto_143188 ) ) ( not ( = ?auto_143183 ?auto_143189 ) ) ( not ( = ?auto_143183 ?auto_143190 ) ) ( not ( = ?auto_143184 ?auto_143185 ) ) ( not ( = ?auto_143184 ?auto_143186 ) ) ( not ( = ?auto_143184 ?auto_143187 ) ) ( not ( = ?auto_143184 ?auto_143188 ) ) ( not ( = ?auto_143184 ?auto_143189 ) ) ( not ( = ?auto_143184 ?auto_143190 ) ) ( not ( = ?auto_143185 ?auto_143186 ) ) ( not ( = ?auto_143185 ?auto_143187 ) ) ( not ( = ?auto_143185 ?auto_143188 ) ) ( not ( = ?auto_143185 ?auto_143189 ) ) ( not ( = ?auto_143185 ?auto_143190 ) ) ( not ( = ?auto_143186 ?auto_143187 ) ) ( not ( = ?auto_143186 ?auto_143188 ) ) ( not ( = ?auto_143186 ?auto_143189 ) ) ( not ( = ?auto_143186 ?auto_143190 ) ) ( not ( = ?auto_143187 ?auto_143188 ) ) ( not ( = ?auto_143187 ?auto_143189 ) ) ( not ( = ?auto_143187 ?auto_143190 ) ) ( not ( = ?auto_143188 ?auto_143189 ) ) ( not ( = ?auto_143188 ?auto_143190 ) ) ( not ( = ?auto_143189 ?auto_143190 ) ) ( ON ?auto_143188 ?auto_143189 ) ( CLEAR ?auto_143186 ) ( ON ?auto_143187 ?auto_143188 ) ( CLEAR ?auto_143187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_143179 ?auto_143180 ?auto_143181 ?auto_143182 ?auto_143183 ?auto_143184 ?auto_143185 ?auto_143186 ?auto_143187 )
      ( MAKE-11PILE ?auto_143179 ?auto_143180 ?auto_143181 ?auto_143182 ?auto_143183 ?auto_143184 ?auto_143185 ?auto_143186 ?auto_143187 ?auto_143188 ?auto_143189 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143202 - BLOCK
      ?auto_143203 - BLOCK
      ?auto_143204 - BLOCK
      ?auto_143205 - BLOCK
      ?auto_143206 - BLOCK
      ?auto_143207 - BLOCK
      ?auto_143208 - BLOCK
      ?auto_143209 - BLOCK
      ?auto_143210 - BLOCK
      ?auto_143211 - BLOCK
      ?auto_143212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143212 ) ( ON-TABLE ?auto_143202 ) ( ON ?auto_143203 ?auto_143202 ) ( ON ?auto_143204 ?auto_143203 ) ( ON ?auto_143205 ?auto_143204 ) ( ON ?auto_143206 ?auto_143205 ) ( ON ?auto_143207 ?auto_143206 ) ( ON ?auto_143208 ?auto_143207 ) ( ON ?auto_143209 ?auto_143208 ) ( not ( = ?auto_143202 ?auto_143203 ) ) ( not ( = ?auto_143202 ?auto_143204 ) ) ( not ( = ?auto_143202 ?auto_143205 ) ) ( not ( = ?auto_143202 ?auto_143206 ) ) ( not ( = ?auto_143202 ?auto_143207 ) ) ( not ( = ?auto_143202 ?auto_143208 ) ) ( not ( = ?auto_143202 ?auto_143209 ) ) ( not ( = ?auto_143202 ?auto_143210 ) ) ( not ( = ?auto_143202 ?auto_143211 ) ) ( not ( = ?auto_143202 ?auto_143212 ) ) ( not ( = ?auto_143203 ?auto_143204 ) ) ( not ( = ?auto_143203 ?auto_143205 ) ) ( not ( = ?auto_143203 ?auto_143206 ) ) ( not ( = ?auto_143203 ?auto_143207 ) ) ( not ( = ?auto_143203 ?auto_143208 ) ) ( not ( = ?auto_143203 ?auto_143209 ) ) ( not ( = ?auto_143203 ?auto_143210 ) ) ( not ( = ?auto_143203 ?auto_143211 ) ) ( not ( = ?auto_143203 ?auto_143212 ) ) ( not ( = ?auto_143204 ?auto_143205 ) ) ( not ( = ?auto_143204 ?auto_143206 ) ) ( not ( = ?auto_143204 ?auto_143207 ) ) ( not ( = ?auto_143204 ?auto_143208 ) ) ( not ( = ?auto_143204 ?auto_143209 ) ) ( not ( = ?auto_143204 ?auto_143210 ) ) ( not ( = ?auto_143204 ?auto_143211 ) ) ( not ( = ?auto_143204 ?auto_143212 ) ) ( not ( = ?auto_143205 ?auto_143206 ) ) ( not ( = ?auto_143205 ?auto_143207 ) ) ( not ( = ?auto_143205 ?auto_143208 ) ) ( not ( = ?auto_143205 ?auto_143209 ) ) ( not ( = ?auto_143205 ?auto_143210 ) ) ( not ( = ?auto_143205 ?auto_143211 ) ) ( not ( = ?auto_143205 ?auto_143212 ) ) ( not ( = ?auto_143206 ?auto_143207 ) ) ( not ( = ?auto_143206 ?auto_143208 ) ) ( not ( = ?auto_143206 ?auto_143209 ) ) ( not ( = ?auto_143206 ?auto_143210 ) ) ( not ( = ?auto_143206 ?auto_143211 ) ) ( not ( = ?auto_143206 ?auto_143212 ) ) ( not ( = ?auto_143207 ?auto_143208 ) ) ( not ( = ?auto_143207 ?auto_143209 ) ) ( not ( = ?auto_143207 ?auto_143210 ) ) ( not ( = ?auto_143207 ?auto_143211 ) ) ( not ( = ?auto_143207 ?auto_143212 ) ) ( not ( = ?auto_143208 ?auto_143209 ) ) ( not ( = ?auto_143208 ?auto_143210 ) ) ( not ( = ?auto_143208 ?auto_143211 ) ) ( not ( = ?auto_143208 ?auto_143212 ) ) ( not ( = ?auto_143209 ?auto_143210 ) ) ( not ( = ?auto_143209 ?auto_143211 ) ) ( not ( = ?auto_143209 ?auto_143212 ) ) ( not ( = ?auto_143210 ?auto_143211 ) ) ( not ( = ?auto_143210 ?auto_143212 ) ) ( not ( = ?auto_143211 ?auto_143212 ) ) ( ON ?auto_143211 ?auto_143212 ) ( CLEAR ?auto_143209 ) ( ON ?auto_143210 ?auto_143211 ) ( CLEAR ?auto_143210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_143202 ?auto_143203 ?auto_143204 ?auto_143205 ?auto_143206 ?auto_143207 ?auto_143208 ?auto_143209 ?auto_143210 )
      ( MAKE-11PILE ?auto_143202 ?auto_143203 ?auto_143204 ?auto_143205 ?auto_143206 ?auto_143207 ?auto_143208 ?auto_143209 ?auto_143210 ?auto_143211 ?auto_143212 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143224 - BLOCK
      ?auto_143225 - BLOCK
      ?auto_143226 - BLOCK
      ?auto_143227 - BLOCK
      ?auto_143228 - BLOCK
      ?auto_143229 - BLOCK
      ?auto_143230 - BLOCK
      ?auto_143231 - BLOCK
      ?auto_143232 - BLOCK
      ?auto_143233 - BLOCK
      ?auto_143234 - BLOCK
    )
    :vars
    (
      ?auto_143235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143234 ?auto_143235 ) ( ON-TABLE ?auto_143224 ) ( ON ?auto_143225 ?auto_143224 ) ( ON ?auto_143226 ?auto_143225 ) ( ON ?auto_143227 ?auto_143226 ) ( ON ?auto_143228 ?auto_143227 ) ( ON ?auto_143229 ?auto_143228 ) ( ON ?auto_143230 ?auto_143229 ) ( not ( = ?auto_143224 ?auto_143225 ) ) ( not ( = ?auto_143224 ?auto_143226 ) ) ( not ( = ?auto_143224 ?auto_143227 ) ) ( not ( = ?auto_143224 ?auto_143228 ) ) ( not ( = ?auto_143224 ?auto_143229 ) ) ( not ( = ?auto_143224 ?auto_143230 ) ) ( not ( = ?auto_143224 ?auto_143231 ) ) ( not ( = ?auto_143224 ?auto_143232 ) ) ( not ( = ?auto_143224 ?auto_143233 ) ) ( not ( = ?auto_143224 ?auto_143234 ) ) ( not ( = ?auto_143224 ?auto_143235 ) ) ( not ( = ?auto_143225 ?auto_143226 ) ) ( not ( = ?auto_143225 ?auto_143227 ) ) ( not ( = ?auto_143225 ?auto_143228 ) ) ( not ( = ?auto_143225 ?auto_143229 ) ) ( not ( = ?auto_143225 ?auto_143230 ) ) ( not ( = ?auto_143225 ?auto_143231 ) ) ( not ( = ?auto_143225 ?auto_143232 ) ) ( not ( = ?auto_143225 ?auto_143233 ) ) ( not ( = ?auto_143225 ?auto_143234 ) ) ( not ( = ?auto_143225 ?auto_143235 ) ) ( not ( = ?auto_143226 ?auto_143227 ) ) ( not ( = ?auto_143226 ?auto_143228 ) ) ( not ( = ?auto_143226 ?auto_143229 ) ) ( not ( = ?auto_143226 ?auto_143230 ) ) ( not ( = ?auto_143226 ?auto_143231 ) ) ( not ( = ?auto_143226 ?auto_143232 ) ) ( not ( = ?auto_143226 ?auto_143233 ) ) ( not ( = ?auto_143226 ?auto_143234 ) ) ( not ( = ?auto_143226 ?auto_143235 ) ) ( not ( = ?auto_143227 ?auto_143228 ) ) ( not ( = ?auto_143227 ?auto_143229 ) ) ( not ( = ?auto_143227 ?auto_143230 ) ) ( not ( = ?auto_143227 ?auto_143231 ) ) ( not ( = ?auto_143227 ?auto_143232 ) ) ( not ( = ?auto_143227 ?auto_143233 ) ) ( not ( = ?auto_143227 ?auto_143234 ) ) ( not ( = ?auto_143227 ?auto_143235 ) ) ( not ( = ?auto_143228 ?auto_143229 ) ) ( not ( = ?auto_143228 ?auto_143230 ) ) ( not ( = ?auto_143228 ?auto_143231 ) ) ( not ( = ?auto_143228 ?auto_143232 ) ) ( not ( = ?auto_143228 ?auto_143233 ) ) ( not ( = ?auto_143228 ?auto_143234 ) ) ( not ( = ?auto_143228 ?auto_143235 ) ) ( not ( = ?auto_143229 ?auto_143230 ) ) ( not ( = ?auto_143229 ?auto_143231 ) ) ( not ( = ?auto_143229 ?auto_143232 ) ) ( not ( = ?auto_143229 ?auto_143233 ) ) ( not ( = ?auto_143229 ?auto_143234 ) ) ( not ( = ?auto_143229 ?auto_143235 ) ) ( not ( = ?auto_143230 ?auto_143231 ) ) ( not ( = ?auto_143230 ?auto_143232 ) ) ( not ( = ?auto_143230 ?auto_143233 ) ) ( not ( = ?auto_143230 ?auto_143234 ) ) ( not ( = ?auto_143230 ?auto_143235 ) ) ( not ( = ?auto_143231 ?auto_143232 ) ) ( not ( = ?auto_143231 ?auto_143233 ) ) ( not ( = ?auto_143231 ?auto_143234 ) ) ( not ( = ?auto_143231 ?auto_143235 ) ) ( not ( = ?auto_143232 ?auto_143233 ) ) ( not ( = ?auto_143232 ?auto_143234 ) ) ( not ( = ?auto_143232 ?auto_143235 ) ) ( not ( = ?auto_143233 ?auto_143234 ) ) ( not ( = ?auto_143233 ?auto_143235 ) ) ( not ( = ?auto_143234 ?auto_143235 ) ) ( ON ?auto_143233 ?auto_143234 ) ( ON ?auto_143232 ?auto_143233 ) ( CLEAR ?auto_143230 ) ( ON ?auto_143231 ?auto_143232 ) ( CLEAR ?auto_143231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143224 ?auto_143225 ?auto_143226 ?auto_143227 ?auto_143228 ?auto_143229 ?auto_143230 ?auto_143231 )
      ( MAKE-11PILE ?auto_143224 ?auto_143225 ?auto_143226 ?auto_143227 ?auto_143228 ?auto_143229 ?auto_143230 ?auto_143231 ?auto_143232 ?auto_143233 ?auto_143234 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143247 - BLOCK
      ?auto_143248 - BLOCK
      ?auto_143249 - BLOCK
      ?auto_143250 - BLOCK
      ?auto_143251 - BLOCK
      ?auto_143252 - BLOCK
      ?auto_143253 - BLOCK
      ?auto_143254 - BLOCK
      ?auto_143255 - BLOCK
      ?auto_143256 - BLOCK
      ?auto_143257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143257 ) ( ON-TABLE ?auto_143247 ) ( ON ?auto_143248 ?auto_143247 ) ( ON ?auto_143249 ?auto_143248 ) ( ON ?auto_143250 ?auto_143249 ) ( ON ?auto_143251 ?auto_143250 ) ( ON ?auto_143252 ?auto_143251 ) ( ON ?auto_143253 ?auto_143252 ) ( not ( = ?auto_143247 ?auto_143248 ) ) ( not ( = ?auto_143247 ?auto_143249 ) ) ( not ( = ?auto_143247 ?auto_143250 ) ) ( not ( = ?auto_143247 ?auto_143251 ) ) ( not ( = ?auto_143247 ?auto_143252 ) ) ( not ( = ?auto_143247 ?auto_143253 ) ) ( not ( = ?auto_143247 ?auto_143254 ) ) ( not ( = ?auto_143247 ?auto_143255 ) ) ( not ( = ?auto_143247 ?auto_143256 ) ) ( not ( = ?auto_143247 ?auto_143257 ) ) ( not ( = ?auto_143248 ?auto_143249 ) ) ( not ( = ?auto_143248 ?auto_143250 ) ) ( not ( = ?auto_143248 ?auto_143251 ) ) ( not ( = ?auto_143248 ?auto_143252 ) ) ( not ( = ?auto_143248 ?auto_143253 ) ) ( not ( = ?auto_143248 ?auto_143254 ) ) ( not ( = ?auto_143248 ?auto_143255 ) ) ( not ( = ?auto_143248 ?auto_143256 ) ) ( not ( = ?auto_143248 ?auto_143257 ) ) ( not ( = ?auto_143249 ?auto_143250 ) ) ( not ( = ?auto_143249 ?auto_143251 ) ) ( not ( = ?auto_143249 ?auto_143252 ) ) ( not ( = ?auto_143249 ?auto_143253 ) ) ( not ( = ?auto_143249 ?auto_143254 ) ) ( not ( = ?auto_143249 ?auto_143255 ) ) ( not ( = ?auto_143249 ?auto_143256 ) ) ( not ( = ?auto_143249 ?auto_143257 ) ) ( not ( = ?auto_143250 ?auto_143251 ) ) ( not ( = ?auto_143250 ?auto_143252 ) ) ( not ( = ?auto_143250 ?auto_143253 ) ) ( not ( = ?auto_143250 ?auto_143254 ) ) ( not ( = ?auto_143250 ?auto_143255 ) ) ( not ( = ?auto_143250 ?auto_143256 ) ) ( not ( = ?auto_143250 ?auto_143257 ) ) ( not ( = ?auto_143251 ?auto_143252 ) ) ( not ( = ?auto_143251 ?auto_143253 ) ) ( not ( = ?auto_143251 ?auto_143254 ) ) ( not ( = ?auto_143251 ?auto_143255 ) ) ( not ( = ?auto_143251 ?auto_143256 ) ) ( not ( = ?auto_143251 ?auto_143257 ) ) ( not ( = ?auto_143252 ?auto_143253 ) ) ( not ( = ?auto_143252 ?auto_143254 ) ) ( not ( = ?auto_143252 ?auto_143255 ) ) ( not ( = ?auto_143252 ?auto_143256 ) ) ( not ( = ?auto_143252 ?auto_143257 ) ) ( not ( = ?auto_143253 ?auto_143254 ) ) ( not ( = ?auto_143253 ?auto_143255 ) ) ( not ( = ?auto_143253 ?auto_143256 ) ) ( not ( = ?auto_143253 ?auto_143257 ) ) ( not ( = ?auto_143254 ?auto_143255 ) ) ( not ( = ?auto_143254 ?auto_143256 ) ) ( not ( = ?auto_143254 ?auto_143257 ) ) ( not ( = ?auto_143255 ?auto_143256 ) ) ( not ( = ?auto_143255 ?auto_143257 ) ) ( not ( = ?auto_143256 ?auto_143257 ) ) ( ON ?auto_143256 ?auto_143257 ) ( ON ?auto_143255 ?auto_143256 ) ( CLEAR ?auto_143253 ) ( ON ?auto_143254 ?auto_143255 ) ( CLEAR ?auto_143254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143247 ?auto_143248 ?auto_143249 ?auto_143250 ?auto_143251 ?auto_143252 ?auto_143253 ?auto_143254 )
      ( MAKE-11PILE ?auto_143247 ?auto_143248 ?auto_143249 ?auto_143250 ?auto_143251 ?auto_143252 ?auto_143253 ?auto_143254 ?auto_143255 ?auto_143256 ?auto_143257 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143269 - BLOCK
      ?auto_143270 - BLOCK
      ?auto_143271 - BLOCK
      ?auto_143272 - BLOCK
      ?auto_143273 - BLOCK
      ?auto_143274 - BLOCK
      ?auto_143275 - BLOCK
      ?auto_143276 - BLOCK
      ?auto_143277 - BLOCK
      ?auto_143278 - BLOCK
      ?auto_143279 - BLOCK
    )
    :vars
    (
      ?auto_143280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143279 ?auto_143280 ) ( ON-TABLE ?auto_143269 ) ( ON ?auto_143270 ?auto_143269 ) ( ON ?auto_143271 ?auto_143270 ) ( ON ?auto_143272 ?auto_143271 ) ( ON ?auto_143273 ?auto_143272 ) ( ON ?auto_143274 ?auto_143273 ) ( not ( = ?auto_143269 ?auto_143270 ) ) ( not ( = ?auto_143269 ?auto_143271 ) ) ( not ( = ?auto_143269 ?auto_143272 ) ) ( not ( = ?auto_143269 ?auto_143273 ) ) ( not ( = ?auto_143269 ?auto_143274 ) ) ( not ( = ?auto_143269 ?auto_143275 ) ) ( not ( = ?auto_143269 ?auto_143276 ) ) ( not ( = ?auto_143269 ?auto_143277 ) ) ( not ( = ?auto_143269 ?auto_143278 ) ) ( not ( = ?auto_143269 ?auto_143279 ) ) ( not ( = ?auto_143269 ?auto_143280 ) ) ( not ( = ?auto_143270 ?auto_143271 ) ) ( not ( = ?auto_143270 ?auto_143272 ) ) ( not ( = ?auto_143270 ?auto_143273 ) ) ( not ( = ?auto_143270 ?auto_143274 ) ) ( not ( = ?auto_143270 ?auto_143275 ) ) ( not ( = ?auto_143270 ?auto_143276 ) ) ( not ( = ?auto_143270 ?auto_143277 ) ) ( not ( = ?auto_143270 ?auto_143278 ) ) ( not ( = ?auto_143270 ?auto_143279 ) ) ( not ( = ?auto_143270 ?auto_143280 ) ) ( not ( = ?auto_143271 ?auto_143272 ) ) ( not ( = ?auto_143271 ?auto_143273 ) ) ( not ( = ?auto_143271 ?auto_143274 ) ) ( not ( = ?auto_143271 ?auto_143275 ) ) ( not ( = ?auto_143271 ?auto_143276 ) ) ( not ( = ?auto_143271 ?auto_143277 ) ) ( not ( = ?auto_143271 ?auto_143278 ) ) ( not ( = ?auto_143271 ?auto_143279 ) ) ( not ( = ?auto_143271 ?auto_143280 ) ) ( not ( = ?auto_143272 ?auto_143273 ) ) ( not ( = ?auto_143272 ?auto_143274 ) ) ( not ( = ?auto_143272 ?auto_143275 ) ) ( not ( = ?auto_143272 ?auto_143276 ) ) ( not ( = ?auto_143272 ?auto_143277 ) ) ( not ( = ?auto_143272 ?auto_143278 ) ) ( not ( = ?auto_143272 ?auto_143279 ) ) ( not ( = ?auto_143272 ?auto_143280 ) ) ( not ( = ?auto_143273 ?auto_143274 ) ) ( not ( = ?auto_143273 ?auto_143275 ) ) ( not ( = ?auto_143273 ?auto_143276 ) ) ( not ( = ?auto_143273 ?auto_143277 ) ) ( not ( = ?auto_143273 ?auto_143278 ) ) ( not ( = ?auto_143273 ?auto_143279 ) ) ( not ( = ?auto_143273 ?auto_143280 ) ) ( not ( = ?auto_143274 ?auto_143275 ) ) ( not ( = ?auto_143274 ?auto_143276 ) ) ( not ( = ?auto_143274 ?auto_143277 ) ) ( not ( = ?auto_143274 ?auto_143278 ) ) ( not ( = ?auto_143274 ?auto_143279 ) ) ( not ( = ?auto_143274 ?auto_143280 ) ) ( not ( = ?auto_143275 ?auto_143276 ) ) ( not ( = ?auto_143275 ?auto_143277 ) ) ( not ( = ?auto_143275 ?auto_143278 ) ) ( not ( = ?auto_143275 ?auto_143279 ) ) ( not ( = ?auto_143275 ?auto_143280 ) ) ( not ( = ?auto_143276 ?auto_143277 ) ) ( not ( = ?auto_143276 ?auto_143278 ) ) ( not ( = ?auto_143276 ?auto_143279 ) ) ( not ( = ?auto_143276 ?auto_143280 ) ) ( not ( = ?auto_143277 ?auto_143278 ) ) ( not ( = ?auto_143277 ?auto_143279 ) ) ( not ( = ?auto_143277 ?auto_143280 ) ) ( not ( = ?auto_143278 ?auto_143279 ) ) ( not ( = ?auto_143278 ?auto_143280 ) ) ( not ( = ?auto_143279 ?auto_143280 ) ) ( ON ?auto_143278 ?auto_143279 ) ( ON ?auto_143277 ?auto_143278 ) ( ON ?auto_143276 ?auto_143277 ) ( CLEAR ?auto_143274 ) ( ON ?auto_143275 ?auto_143276 ) ( CLEAR ?auto_143275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143269 ?auto_143270 ?auto_143271 ?auto_143272 ?auto_143273 ?auto_143274 ?auto_143275 )
      ( MAKE-11PILE ?auto_143269 ?auto_143270 ?auto_143271 ?auto_143272 ?auto_143273 ?auto_143274 ?auto_143275 ?auto_143276 ?auto_143277 ?auto_143278 ?auto_143279 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143292 - BLOCK
      ?auto_143293 - BLOCK
      ?auto_143294 - BLOCK
      ?auto_143295 - BLOCK
      ?auto_143296 - BLOCK
      ?auto_143297 - BLOCK
      ?auto_143298 - BLOCK
      ?auto_143299 - BLOCK
      ?auto_143300 - BLOCK
      ?auto_143301 - BLOCK
      ?auto_143302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143302 ) ( ON-TABLE ?auto_143292 ) ( ON ?auto_143293 ?auto_143292 ) ( ON ?auto_143294 ?auto_143293 ) ( ON ?auto_143295 ?auto_143294 ) ( ON ?auto_143296 ?auto_143295 ) ( ON ?auto_143297 ?auto_143296 ) ( not ( = ?auto_143292 ?auto_143293 ) ) ( not ( = ?auto_143292 ?auto_143294 ) ) ( not ( = ?auto_143292 ?auto_143295 ) ) ( not ( = ?auto_143292 ?auto_143296 ) ) ( not ( = ?auto_143292 ?auto_143297 ) ) ( not ( = ?auto_143292 ?auto_143298 ) ) ( not ( = ?auto_143292 ?auto_143299 ) ) ( not ( = ?auto_143292 ?auto_143300 ) ) ( not ( = ?auto_143292 ?auto_143301 ) ) ( not ( = ?auto_143292 ?auto_143302 ) ) ( not ( = ?auto_143293 ?auto_143294 ) ) ( not ( = ?auto_143293 ?auto_143295 ) ) ( not ( = ?auto_143293 ?auto_143296 ) ) ( not ( = ?auto_143293 ?auto_143297 ) ) ( not ( = ?auto_143293 ?auto_143298 ) ) ( not ( = ?auto_143293 ?auto_143299 ) ) ( not ( = ?auto_143293 ?auto_143300 ) ) ( not ( = ?auto_143293 ?auto_143301 ) ) ( not ( = ?auto_143293 ?auto_143302 ) ) ( not ( = ?auto_143294 ?auto_143295 ) ) ( not ( = ?auto_143294 ?auto_143296 ) ) ( not ( = ?auto_143294 ?auto_143297 ) ) ( not ( = ?auto_143294 ?auto_143298 ) ) ( not ( = ?auto_143294 ?auto_143299 ) ) ( not ( = ?auto_143294 ?auto_143300 ) ) ( not ( = ?auto_143294 ?auto_143301 ) ) ( not ( = ?auto_143294 ?auto_143302 ) ) ( not ( = ?auto_143295 ?auto_143296 ) ) ( not ( = ?auto_143295 ?auto_143297 ) ) ( not ( = ?auto_143295 ?auto_143298 ) ) ( not ( = ?auto_143295 ?auto_143299 ) ) ( not ( = ?auto_143295 ?auto_143300 ) ) ( not ( = ?auto_143295 ?auto_143301 ) ) ( not ( = ?auto_143295 ?auto_143302 ) ) ( not ( = ?auto_143296 ?auto_143297 ) ) ( not ( = ?auto_143296 ?auto_143298 ) ) ( not ( = ?auto_143296 ?auto_143299 ) ) ( not ( = ?auto_143296 ?auto_143300 ) ) ( not ( = ?auto_143296 ?auto_143301 ) ) ( not ( = ?auto_143296 ?auto_143302 ) ) ( not ( = ?auto_143297 ?auto_143298 ) ) ( not ( = ?auto_143297 ?auto_143299 ) ) ( not ( = ?auto_143297 ?auto_143300 ) ) ( not ( = ?auto_143297 ?auto_143301 ) ) ( not ( = ?auto_143297 ?auto_143302 ) ) ( not ( = ?auto_143298 ?auto_143299 ) ) ( not ( = ?auto_143298 ?auto_143300 ) ) ( not ( = ?auto_143298 ?auto_143301 ) ) ( not ( = ?auto_143298 ?auto_143302 ) ) ( not ( = ?auto_143299 ?auto_143300 ) ) ( not ( = ?auto_143299 ?auto_143301 ) ) ( not ( = ?auto_143299 ?auto_143302 ) ) ( not ( = ?auto_143300 ?auto_143301 ) ) ( not ( = ?auto_143300 ?auto_143302 ) ) ( not ( = ?auto_143301 ?auto_143302 ) ) ( ON ?auto_143301 ?auto_143302 ) ( ON ?auto_143300 ?auto_143301 ) ( ON ?auto_143299 ?auto_143300 ) ( CLEAR ?auto_143297 ) ( ON ?auto_143298 ?auto_143299 ) ( CLEAR ?auto_143298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143292 ?auto_143293 ?auto_143294 ?auto_143295 ?auto_143296 ?auto_143297 ?auto_143298 )
      ( MAKE-11PILE ?auto_143292 ?auto_143293 ?auto_143294 ?auto_143295 ?auto_143296 ?auto_143297 ?auto_143298 ?auto_143299 ?auto_143300 ?auto_143301 ?auto_143302 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143314 - BLOCK
      ?auto_143315 - BLOCK
      ?auto_143316 - BLOCK
      ?auto_143317 - BLOCK
      ?auto_143318 - BLOCK
      ?auto_143319 - BLOCK
      ?auto_143320 - BLOCK
      ?auto_143321 - BLOCK
      ?auto_143322 - BLOCK
      ?auto_143323 - BLOCK
      ?auto_143324 - BLOCK
    )
    :vars
    (
      ?auto_143325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143324 ?auto_143325 ) ( ON-TABLE ?auto_143314 ) ( ON ?auto_143315 ?auto_143314 ) ( ON ?auto_143316 ?auto_143315 ) ( ON ?auto_143317 ?auto_143316 ) ( ON ?auto_143318 ?auto_143317 ) ( not ( = ?auto_143314 ?auto_143315 ) ) ( not ( = ?auto_143314 ?auto_143316 ) ) ( not ( = ?auto_143314 ?auto_143317 ) ) ( not ( = ?auto_143314 ?auto_143318 ) ) ( not ( = ?auto_143314 ?auto_143319 ) ) ( not ( = ?auto_143314 ?auto_143320 ) ) ( not ( = ?auto_143314 ?auto_143321 ) ) ( not ( = ?auto_143314 ?auto_143322 ) ) ( not ( = ?auto_143314 ?auto_143323 ) ) ( not ( = ?auto_143314 ?auto_143324 ) ) ( not ( = ?auto_143314 ?auto_143325 ) ) ( not ( = ?auto_143315 ?auto_143316 ) ) ( not ( = ?auto_143315 ?auto_143317 ) ) ( not ( = ?auto_143315 ?auto_143318 ) ) ( not ( = ?auto_143315 ?auto_143319 ) ) ( not ( = ?auto_143315 ?auto_143320 ) ) ( not ( = ?auto_143315 ?auto_143321 ) ) ( not ( = ?auto_143315 ?auto_143322 ) ) ( not ( = ?auto_143315 ?auto_143323 ) ) ( not ( = ?auto_143315 ?auto_143324 ) ) ( not ( = ?auto_143315 ?auto_143325 ) ) ( not ( = ?auto_143316 ?auto_143317 ) ) ( not ( = ?auto_143316 ?auto_143318 ) ) ( not ( = ?auto_143316 ?auto_143319 ) ) ( not ( = ?auto_143316 ?auto_143320 ) ) ( not ( = ?auto_143316 ?auto_143321 ) ) ( not ( = ?auto_143316 ?auto_143322 ) ) ( not ( = ?auto_143316 ?auto_143323 ) ) ( not ( = ?auto_143316 ?auto_143324 ) ) ( not ( = ?auto_143316 ?auto_143325 ) ) ( not ( = ?auto_143317 ?auto_143318 ) ) ( not ( = ?auto_143317 ?auto_143319 ) ) ( not ( = ?auto_143317 ?auto_143320 ) ) ( not ( = ?auto_143317 ?auto_143321 ) ) ( not ( = ?auto_143317 ?auto_143322 ) ) ( not ( = ?auto_143317 ?auto_143323 ) ) ( not ( = ?auto_143317 ?auto_143324 ) ) ( not ( = ?auto_143317 ?auto_143325 ) ) ( not ( = ?auto_143318 ?auto_143319 ) ) ( not ( = ?auto_143318 ?auto_143320 ) ) ( not ( = ?auto_143318 ?auto_143321 ) ) ( not ( = ?auto_143318 ?auto_143322 ) ) ( not ( = ?auto_143318 ?auto_143323 ) ) ( not ( = ?auto_143318 ?auto_143324 ) ) ( not ( = ?auto_143318 ?auto_143325 ) ) ( not ( = ?auto_143319 ?auto_143320 ) ) ( not ( = ?auto_143319 ?auto_143321 ) ) ( not ( = ?auto_143319 ?auto_143322 ) ) ( not ( = ?auto_143319 ?auto_143323 ) ) ( not ( = ?auto_143319 ?auto_143324 ) ) ( not ( = ?auto_143319 ?auto_143325 ) ) ( not ( = ?auto_143320 ?auto_143321 ) ) ( not ( = ?auto_143320 ?auto_143322 ) ) ( not ( = ?auto_143320 ?auto_143323 ) ) ( not ( = ?auto_143320 ?auto_143324 ) ) ( not ( = ?auto_143320 ?auto_143325 ) ) ( not ( = ?auto_143321 ?auto_143322 ) ) ( not ( = ?auto_143321 ?auto_143323 ) ) ( not ( = ?auto_143321 ?auto_143324 ) ) ( not ( = ?auto_143321 ?auto_143325 ) ) ( not ( = ?auto_143322 ?auto_143323 ) ) ( not ( = ?auto_143322 ?auto_143324 ) ) ( not ( = ?auto_143322 ?auto_143325 ) ) ( not ( = ?auto_143323 ?auto_143324 ) ) ( not ( = ?auto_143323 ?auto_143325 ) ) ( not ( = ?auto_143324 ?auto_143325 ) ) ( ON ?auto_143323 ?auto_143324 ) ( ON ?auto_143322 ?auto_143323 ) ( ON ?auto_143321 ?auto_143322 ) ( ON ?auto_143320 ?auto_143321 ) ( CLEAR ?auto_143318 ) ( ON ?auto_143319 ?auto_143320 ) ( CLEAR ?auto_143319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143314 ?auto_143315 ?auto_143316 ?auto_143317 ?auto_143318 ?auto_143319 )
      ( MAKE-11PILE ?auto_143314 ?auto_143315 ?auto_143316 ?auto_143317 ?auto_143318 ?auto_143319 ?auto_143320 ?auto_143321 ?auto_143322 ?auto_143323 ?auto_143324 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143337 - BLOCK
      ?auto_143338 - BLOCK
      ?auto_143339 - BLOCK
      ?auto_143340 - BLOCK
      ?auto_143341 - BLOCK
      ?auto_143342 - BLOCK
      ?auto_143343 - BLOCK
      ?auto_143344 - BLOCK
      ?auto_143345 - BLOCK
      ?auto_143346 - BLOCK
      ?auto_143347 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143347 ) ( ON-TABLE ?auto_143337 ) ( ON ?auto_143338 ?auto_143337 ) ( ON ?auto_143339 ?auto_143338 ) ( ON ?auto_143340 ?auto_143339 ) ( ON ?auto_143341 ?auto_143340 ) ( not ( = ?auto_143337 ?auto_143338 ) ) ( not ( = ?auto_143337 ?auto_143339 ) ) ( not ( = ?auto_143337 ?auto_143340 ) ) ( not ( = ?auto_143337 ?auto_143341 ) ) ( not ( = ?auto_143337 ?auto_143342 ) ) ( not ( = ?auto_143337 ?auto_143343 ) ) ( not ( = ?auto_143337 ?auto_143344 ) ) ( not ( = ?auto_143337 ?auto_143345 ) ) ( not ( = ?auto_143337 ?auto_143346 ) ) ( not ( = ?auto_143337 ?auto_143347 ) ) ( not ( = ?auto_143338 ?auto_143339 ) ) ( not ( = ?auto_143338 ?auto_143340 ) ) ( not ( = ?auto_143338 ?auto_143341 ) ) ( not ( = ?auto_143338 ?auto_143342 ) ) ( not ( = ?auto_143338 ?auto_143343 ) ) ( not ( = ?auto_143338 ?auto_143344 ) ) ( not ( = ?auto_143338 ?auto_143345 ) ) ( not ( = ?auto_143338 ?auto_143346 ) ) ( not ( = ?auto_143338 ?auto_143347 ) ) ( not ( = ?auto_143339 ?auto_143340 ) ) ( not ( = ?auto_143339 ?auto_143341 ) ) ( not ( = ?auto_143339 ?auto_143342 ) ) ( not ( = ?auto_143339 ?auto_143343 ) ) ( not ( = ?auto_143339 ?auto_143344 ) ) ( not ( = ?auto_143339 ?auto_143345 ) ) ( not ( = ?auto_143339 ?auto_143346 ) ) ( not ( = ?auto_143339 ?auto_143347 ) ) ( not ( = ?auto_143340 ?auto_143341 ) ) ( not ( = ?auto_143340 ?auto_143342 ) ) ( not ( = ?auto_143340 ?auto_143343 ) ) ( not ( = ?auto_143340 ?auto_143344 ) ) ( not ( = ?auto_143340 ?auto_143345 ) ) ( not ( = ?auto_143340 ?auto_143346 ) ) ( not ( = ?auto_143340 ?auto_143347 ) ) ( not ( = ?auto_143341 ?auto_143342 ) ) ( not ( = ?auto_143341 ?auto_143343 ) ) ( not ( = ?auto_143341 ?auto_143344 ) ) ( not ( = ?auto_143341 ?auto_143345 ) ) ( not ( = ?auto_143341 ?auto_143346 ) ) ( not ( = ?auto_143341 ?auto_143347 ) ) ( not ( = ?auto_143342 ?auto_143343 ) ) ( not ( = ?auto_143342 ?auto_143344 ) ) ( not ( = ?auto_143342 ?auto_143345 ) ) ( not ( = ?auto_143342 ?auto_143346 ) ) ( not ( = ?auto_143342 ?auto_143347 ) ) ( not ( = ?auto_143343 ?auto_143344 ) ) ( not ( = ?auto_143343 ?auto_143345 ) ) ( not ( = ?auto_143343 ?auto_143346 ) ) ( not ( = ?auto_143343 ?auto_143347 ) ) ( not ( = ?auto_143344 ?auto_143345 ) ) ( not ( = ?auto_143344 ?auto_143346 ) ) ( not ( = ?auto_143344 ?auto_143347 ) ) ( not ( = ?auto_143345 ?auto_143346 ) ) ( not ( = ?auto_143345 ?auto_143347 ) ) ( not ( = ?auto_143346 ?auto_143347 ) ) ( ON ?auto_143346 ?auto_143347 ) ( ON ?auto_143345 ?auto_143346 ) ( ON ?auto_143344 ?auto_143345 ) ( ON ?auto_143343 ?auto_143344 ) ( CLEAR ?auto_143341 ) ( ON ?auto_143342 ?auto_143343 ) ( CLEAR ?auto_143342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143337 ?auto_143338 ?auto_143339 ?auto_143340 ?auto_143341 ?auto_143342 )
      ( MAKE-11PILE ?auto_143337 ?auto_143338 ?auto_143339 ?auto_143340 ?auto_143341 ?auto_143342 ?auto_143343 ?auto_143344 ?auto_143345 ?auto_143346 ?auto_143347 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143359 - BLOCK
      ?auto_143360 - BLOCK
      ?auto_143361 - BLOCK
      ?auto_143362 - BLOCK
      ?auto_143363 - BLOCK
      ?auto_143364 - BLOCK
      ?auto_143365 - BLOCK
      ?auto_143366 - BLOCK
      ?auto_143367 - BLOCK
      ?auto_143368 - BLOCK
      ?auto_143369 - BLOCK
    )
    :vars
    (
      ?auto_143370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143369 ?auto_143370 ) ( ON-TABLE ?auto_143359 ) ( ON ?auto_143360 ?auto_143359 ) ( ON ?auto_143361 ?auto_143360 ) ( ON ?auto_143362 ?auto_143361 ) ( not ( = ?auto_143359 ?auto_143360 ) ) ( not ( = ?auto_143359 ?auto_143361 ) ) ( not ( = ?auto_143359 ?auto_143362 ) ) ( not ( = ?auto_143359 ?auto_143363 ) ) ( not ( = ?auto_143359 ?auto_143364 ) ) ( not ( = ?auto_143359 ?auto_143365 ) ) ( not ( = ?auto_143359 ?auto_143366 ) ) ( not ( = ?auto_143359 ?auto_143367 ) ) ( not ( = ?auto_143359 ?auto_143368 ) ) ( not ( = ?auto_143359 ?auto_143369 ) ) ( not ( = ?auto_143359 ?auto_143370 ) ) ( not ( = ?auto_143360 ?auto_143361 ) ) ( not ( = ?auto_143360 ?auto_143362 ) ) ( not ( = ?auto_143360 ?auto_143363 ) ) ( not ( = ?auto_143360 ?auto_143364 ) ) ( not ( = ?auto_143360 ?auto_143365 ) ) ( not ( = ?auto_143360 ?auto_143366 ) ) ( not ( = ?auto_143360 ?auto_143367 ) ) ( not ( = ?auto_143360 ?auto_143368 ) ) ( not ( = ?auto_143360 ?auto_143369 ) ) ( not ( = ?auto_143360 ?auto_143370 ) ) ( not ( = ?auto_143361 ?auto_143362 ) ) ( not ( = ?auto_143361 ?auto_143363 ) ) ( not ( = ?auto_143361 ?auto_143364 ) ) ( not ( = ?auto_143361 ?auto_143365 ) ) ( not ( = ?auto_143361 ?auto_143366 ) ) ( not ( = ?auto_143361 ?auto_143367 ) ) ( not ( = ?auto_143361 ?auto_143368 ) ) ( not ( = ?auto_143361 ?auto_143369 ) ) ( not ( = ?auto_143361 ?auto_143370 ) ) ( not ( = ?auto_143362 ?auto_143363 ) ) ( not ( = ?auto_143362 ?auto_143364 ) ) ( not ( = ?auto_143362 ?auto_143365 ) ) ( not ( = ?auto_143362 ?auto_143366 ) ) ( not ( = ?auto_143362 ?auto_143367 ) ) ( not ( = ?auto_143362 ?auto_143368 ) ) ( not ( = ?auto_143362 ?auto_143369 ) ) ( not ( = ?auto_143362 ?auto_143370 ) ) ( not ( = ?auto_143363 ?auto_143364 ) ) ( not ( = ?auto_143363 ?auto_143365 ) ) ( not ( = ?auto_143363 ?auto_143366 ) ) ( not ( = ?auto_143363 ?auto_143367 ) ) ( not ( = ?auto_143363 ?auto_143368 ) ) ( not ( = ?auto_143363 ?auto_143369 ) ) ( not ( = ?auto_143363 ?auto_143370 ) ) ( not ( = ?auto_143364 ?auto_143365 ) ) ( not ( = ?auto_143364 ?auto_143366 ) ) ( not ( = ?auto_143364 ?auto_143367 ) ) ( not ( = ?auto_143364 ?auto_143368 ) ) ( not ( = ?auto_143364 ?auto_143369 ) ) ( not ( = ?auto_143364 ?auto_143370 ) ) ( not ( = ?auto_143365 ?auto_143366 ) ) ( not ( = ?auto_143365 ?auto_143367 ) ) ( not ( = ?auto_143365 ?auto_143368 ) ) ( not ( = ?auto_143365 ?auto_143369 ) ) ( not ( = ?auto_143365 ?auto_143370 ) ) ( not ( = ?auto_143366 ?auto_143367 ) ) ( not ( = ?auto_143366 ?auto_143368 ) ) ( not ( = ?auto_143366 ?auto_143369 ) ) ( not ( = ?auto_143366 ?auto_143370 ) ) ( not ( = ?auto_143367 ?auto_143368 ) ) ( not ( = ?auto_143367 ?auto_143369 ) ) ( not ( = ?auto_143367 ?auto_143370 ) ) ( not ( = ?auto_143368 ?auto_143369 ) ) ( not ( = ?auto_143368 ?auto_143370 ) ) ( not ( = ?auto_143369 ?auto_143370 ) ) ( ON ?auto_143368 ?auto_143369 ) ( ON ?auto_143367 ?auto_143368 ) ( ON ?auto_143366 ?auto_143367 ) ( ON ?auto_143365 ?auto_143366 ) ( ON ?auto_143364 ?auto_143365 ) ( CLEAR ?auto_143362 ) ( ON ?auto_143363 ?auto_143364 ) ( CLEAR ?auto_143363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143359 ?auto_143360 ?auto_143361 ?auto_143362 ?auto_143363 )
      ( MAKE-11PILE ?auto_143359 ?auto_143360 ?auto_143361 ?auto_143362 ?auto_143363 ?auto_143364 ?auto_143365 ?auto_143366 ?auto_143367 ?auto_143368 ?auto_143369 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143382 - BLOCK
      ?auto_143383 - BLOCK
      ?auto_143384 - BLOCK
      ?auto_143385 - BLOCK
      ?auto_143386 - BLOCK
      ?auto_143387 - BLOCK
      ?auto_143388 - BLOCK
      ?auto_143389 - BLOCK
      ?auto_143390 - BLOCK
      ?auto_143391 - BLOCK
      ?auto_143392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143392 ) ( ON-TABLE ?auto_143382 ) ( ON ?auto_143383 ?auto_143382 ) ( ON ?auto_143384 ?auto_143383 ) ( ON ?auto_143385 ?auto_143384 ) ( not ( = ?auto_143382 ?auto_143383 ) ) ( not ( = ?auto_143382 ?auto_143384 ) ) ( not ( = ?auto_143382 ?auto_143385 ) ) ( not ( = ?auto_143382 ?auto_143386 ) ) ( not ( = ?auto_143382 ?auto_143387 ) ) ( not ( = ?auto_143382 ?auto_143388 ) ) ( not ( = ?auto_143382 ?auto_143389 ) ) ( not ( = ?auto_143382 ?auto_143390 ) ) ( not ( = ?auto_143382 ?auto_143391 ) ) ( not ( = ?auto_143382 ?auto_143392 ) ) ( not ( = ?auto_143383 ?auto_143384 ) ) ( not ( = ?auto_143383 ?auto_143385 ) ) ( not ( = ?auto_143383 ?auto_143386 ) ) ( not ( = ?auto_143383 ?auto_143387 ) ) ( not ( = ?auto_143383 ?auto_143388 ) ) ( not ( = ?auto_143383 ?auto_143389 ) ) ( not ( = ?auto_143383 ?auto_143390 ) ) ( not ( = ?auto_143383 ?auto_143391 ) ) ( not ( = ?auto_143383 ?auto_143392 ) ) ( not ( = ?auto_143384 ?auto_143385 ) ) ( not ( = ?auto_143384 ?auto_143386 ) ) ( not ( = ?auto_143384 ?auto_143387 ) ) ( not ( = ?auto_143384 ?auto_143388 ) ) ( not ( = ?auto_143384 ?auto_143389 ) ) ( not ( = ?auto_143384 ?auto_143390 ) ) ( not ( = ?auto_143384 ?auto_143391 ) ) ( not ( = ?auto_143384 ?auto_143392 ) ) ( not ( = ?auto_143385 ?auto_143386 ) ) ( not ( = ?auto_143385 ?auto_143387 ) ) ( not ( = ?auto_143385 ?auto_143388 ) ) ( not ( = ?auto_143385 ?auto_143389 ) ) ( not ( = ?auto_143385 ?auto_143390 ) ) ( not ( = ?auto_143385 ?auto_143391 ) ) ( not ( = ?auto_143385 ?auto_143392 ) ) ( not ( = ?auto_143386 ?auto_143387 ) ) ( not ( = ?auto_143386 ?auto_143388 ) ) ( not ( = ?auto_143386 ?auto_143389 ) ) ( not ( = ?auto_143386 ?auto_143390 ) ) ( not ( = ?auto_143386 ?auto_143391 ) ) ( not ( = ?auto_143386 ?auto_143392 ) ) ( not ( = ?auto_143387 ?auto_143388 ) ) ( not ( = ?auto_143387 ?auto_143389 ) ) ( not ( = ?auto_143387 ?auto_143390 ) ) ( not ( = ?auto_143387 ?auto_143391 ) ) ( not ( = ?auto_143387 ?auto_143392 ) ) ( not ( = ?auto_143388 ?auto_143389 ) ) ( not ( = ?auto_143388 ?auto_143390 ) ) ( not ( = ?auto_143388 ?auto_143391 ) ) ( not ( = ?auto_143388 ?auto_143392 ) ) ( not ( = ?auto_143389 ?auto_143390 ) ) ( not ( = ?auto_143389 ?auto_143391 ) ) ( not ( = ?auto_143389 ?auto_143392 ) ) ( not ( = ?auto_143390 ?auto_143391 ) ) ( not ( = ?auto_143390 ?auto_143392 ) ) ( not ( = ?auto_143391 ?auto_143392 ) ) ( ON ?auto_143391 ?auto_143392 ) ( ON ?auto_143390 ?auto_143391 ) ( ON ?auto_143389 ?auto_143390 ) ( ON ?auto_143388 ?auto_143389 ) ( ON ?auto_143387 ?auto_143388 ) ( CLEAR ?auto_143385 ) ( ON ?auto_143386 ?auto_143387 ) ( CLEAR ?auto_143386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143382 ?auto_143383 ?auto_143384 ?auto_143385 ?auto_143386 )
      ( MAKE-11PILE ?auto_143382 ?auto_143383 ?auto_143384 ?auto_143385 ?auto_143386 ?auto_143387 ?auto_143388 ?auto_143389 ?auto_143390 ?auto_143391 ?auto_143392 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143404 - BLOCK
      ?auto_143405 - BLOCK
      ?auto_143406 - BLOCK
      ?auto_143407 - BLOCK
      ?auto_143408 - BLOCK
      ?auto_143409 - BLOCK
      ?auto_143410 - BLOCK
      ?auto_143411 - BLOCK
      ?auto_143412 - BLOCK
      ?auto_143413 - BLOCK
      ?auto_143414 - BLOCK
    )
    :vars
    (
      ?auto_143415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143414 ?auto_143415 ) ( ON-TABLE ?auto_143404 ) ( ON ?auto_143405 ?auto_143404 ) ( ON ?auto_143406 ?auto_143405 ) ( not ( = ?auto_143404 ?auto_143405 ) ) ( not ( = ?auto_143404 ?auto_143406 ) ) ( not ( = ?auto_143404 ?auto_143407 ) ) ( not ( = ?auto_143404 ?auto_143408 ) ) ( not ( = ?auto_143404 ?auto_143409 ) ) ( not ( = ?auto_143404 ?auto_143410 ) ) ( not ( = ?auto_143404 ?auto_143411 ) ) ( not ( = ?auto_143404 ?auto_143412 ) ) ( not ( = ?auto_143404 ?auto_143413 ) ) ( not ( = ?auto_143404 ?auto_143414 ) ) ( not ( = ?auto_143404 ?auto_143415 ) ) ( not ( = ?auto_143405 ?auto_143406 ) ) ( not ( = ?auto_143405 ?auto_143407 ) ) ( not ( = ?auto_143405 ?auto_143408 ) ) ( not ( = ?auto_143405 ?auto_143409 ) ) ( not ( = ?auto_143405 ?auto_143410 ) ) ( not ( = ?auto_143405 ?auto_143411 ) ) ( not ( = ?auto_143405 ?auto_143412 ) ) ( not ( = ?auto_143405 ?auto_143413 ) ) ( not ( = ?auto_143405 ?auto_143414 ) ) ( not ( = ?auto_143405 ?auto_143415 ) ) ( not ( = ?auto_143406 ?auto_143407 ) ) ( not ( = ?auto_143406 ?auto_143408 ) ) ( not ( = ?auto_143406 ?auto_143409 ) ) ( not ( = ?auto_143406 ?auto_143410 ) ) ( not ( = ?auto_143406 ?auto_143411 ) ) ( not ( = ?auto_143406 ?auto_143412 ) ) ( not ( = ?auto_143406 ?auto_143413 ) ) ( not ( = ?auto_143406 ?auto_143414 ) ) ( not ( = ?auto_143406 ?auto_143415 ) ) ( not ( = ?auto_143407 ?auto_143408 ) ) ( not ( = ?auto_143407 ?auto_143409 ) ) ( not ( = ?auto_143407 ?auto_143410 ) ) ( not ( = ?auto_143407 ?auto_143411 ) ) ( not ( = ?auto_143407 ?auto_143412 ) ) ( not ( = ?auto_143407 ?auto_143413 ) ) ( not ( = ?auto_143407 ?auto_143414 ) ) ( not ( = ?auto_143407 ?auto_143415 ) ) ( not ( = ?auto_143408 ?auto_143409 ) ) ( not ( = ?auto_143408 ?auto_143410 ) ) ( not ( = ?auto_143408 ?auto_143411 ) ) ( not ( = ?auto_143408 ?auto_143412 ) ) ( not ( = ?auto_143408 ?auto_143413 ) ) ( not ( = ?auto_143408 ?auto_143414 ) ) ( not ( = ?auto_143408 ?auto_143415 ) ) ( not ( = ?auto_143409 ?auto_143410 ) ) ( not ( = ?auto_143409 ?auto_143411 ) ) ( not ( = ?auto_143409 ?auto_143412 ) ) ( not ( = ?auto_143409 ?auto_143413 ) ) ( not ( = ?auto_143409 ?auto_143414 ) ) ( not ( = ?auto_143409 ?auto_143415 ) ) ( not ( = ?auto_143410 ?auto_143411 ) ) ( not ( = ?auto_143410 ?auto_143412 ) ) ( not ( = ?auto_143410 ?auto_143413 ) ) ( not ( = ?auto_143410 ?auto_143414 ) ) ( not ( = ?auto_143410 ?auto_143415 ) ) ( not ( = ?auto_143411 ?auto_143412 ) ) ( not ( = ?auto_143411 ?auto_143413 ) ) ( not ( = ?auto_143411 ?auto_143414 ) ) ( not ( = ?auto_143411 ?auto_143415 ) ) ( not ( = ?auto_143412 ?auto_143413 ) ) ( not ( = ?auto_143412 ?auto_143414 ) ) ( not ( = ?auto_143412 ?auto_143415 ) ) ( not ( = ?auto_143413 ?auto_143414 ) ) ( not ( = ?auto_143413 ?auto_143415 ) ) ( not ( = ?auto_143414 ?auto_143415 ) ) ( ON ?auto_143413 ?auto_143414 ) ( ON ?auto_143412 ?auto_143413 ) ( ON ?auto_143411 ?auto_143412 ) ( ON ?auto_143410 ?auto_143411 ) ( ON ?auto_143409 ?auto_143410 ) ( ON ?auto_143408 ?auto_143409 ) ( CLEAR ?auto_143406 ) ( ON ?auto_143407 ?auto_143408 ) ( CLEAR ?auto_143407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143404 ?auto_143405 ?auto_143406 ?auto_143407 )
      ( MAKE-11PILE ?auto_143404 ?auto_143405 ?auto_143406 ?auto_143407 ?auto_143408 ?auto_143409 ?auto_143410 ?auto_143411 ?auto_143412 ?auto_143413 ?auto_143414 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143427 - BLOCK
      ?auto_143428 - BLOCK
      ?auto_143429 - BLOCK
      ?auto_143430 - BLOCK
      ?auto_143431 - BLOCK
      ?auto_143432 - BLOCK
      ?auto_143433 - BLOCK
      ?auto_143434 - BLOCK
      ?auto_143435 - BLOCK
      ?auto_143436 - BLOCK
      ?auto_143437 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143437 ) ( ON-TABLE ?auto_143427 ) ( ON ?auto_143428 ?auto_143427 ) ( ON ?auto_143429 ?auto_143428 ) ( not ( = ?auto_143427 ?auto_143428 ) ) ( not ( = ?auto_143427 ?auto_143429 ) ) ( not ( = ?auto_143427 ?auto_143430 ) ) ( not ( = ?auto_143427 ?auto_143431 ) ) ( not ( = ?auto_143427 ?auto_143432 ) ) ( not ( = ?auto_143427 ?auto_143433 ) ) ( not ( = ?auto_143427 ?auto_143434 ) ) ( not ( = ?auto_143427 ?auto_143435 ) ) ( not ( = ?auto_143427 ?auto_143436 ) ) ( not ( = ?auto_143427 ?auto_143437 ) ) ( not ( = ?auto_143428 ?auto_143429 ) ) ( not ( = ?auto_143428 ?auto_143430 ) ) ( not ( = ?auto_143428 ?auto_143431 ) ) ( not ( = ?auto_143428 ?auto_143432 ) ) ( not ( = ?auto_143428 ?auto_143433 ) ) ( not ( = ?auto_143428 ?auto_143434 ) ) ( not ( = ?auto_143428 ?auto_143435 ) ) ( not ( = ?auto_143428 ?auto_143436 ) ) ( not ( = ?auto_143428 ?auto_143437 ) ) ( not ( = ?auto_143429 ?auto_143430 ) ) ( not ( = ?auto_143429 ?auto_143431 ) ) ( not ( = ?auto_143429 ?auto_143432 ) ) ( not ( = ?auto_143429 ?auto_143433 ) ) ( not ( = ?auto_143429 ?auto_143434 ) ) ( not ( = ?auto_143429 ?auto_143435 ) ) ( not ( = ?auto_143429 ?auto_143436 ) ) ( not ( = ?auto_143429 ?auto_143437 ) ) ( not ( = ?auto_143430 ?auto_143431 ) ) ( not ( = ?auto_143430 ?auto_143432 ) ) ( not ( = ?auto_143430 ?auto_143433 ) ) ( not ( = ?auto_143430 ?auto_143434 ) ) ( not ( = ?auto_143430 ?auto_143435 ) ) ( not ( = ?auto_143430 ?auto_143436 ) ) ( not ( = ?auto_143430 ?auto_143437 ) ) ( not ( = ?auto_143431 ?auto_143432 ) ) ( not ( = ?auto_143431 ?auto_143433 ) ) ( not ( = ?auto_143431 ?auto_143434 ) ) ( not ( = ?auto_143431 ?auto_143435 ) ) ( not ( = ?auto_143431 ?auto_143436 ) ) ( not ( = ?auto_143431 ?auto_143437 ) ) ( not ( = ?auto_143432 ?auto_143433 ) ) ( not ( = ?auto_143432 ?auto_143434 ) ) ( not ( = ?auto_143432 ?auto_143435 ) ) ( not ( = ?auto_143432 ?auto_143436 ) ) ( not ( = ?auto_143432 ?auto_143437 ) ) ( not ( = ?auto_143433 ?auto_143434 ) ) ( not ( = ?auto_143433 ?auto_143435 ) ) ( not ( = ?auto_143433 ?auto_143436 ) ) ( not ( = ?auto_143433 ?auto_143437 ) ) ( not ( = ?auto_143434 ?auto_143435 ) ) ( not ( = ?auto_143434 ?auto_143436 ) ) ( not ( = ?auto_143434 ?auto_143437 ) ) ( not ( = ?auto_143435 ?auto_143436 ) ) ( not ( = ?auto_143435 ?auto_143437 ) ) ( not ( = ?auto_143436 ?auto_143437 ) ) ( ON ?auto_143436 ?auto_143437 ) ( ON ?auto_143435 ?auto_143436 ) ( ON ?auto_143434 ?auto_143435 ) ( ON ?auto_143433 ?auto_143434 ) ( ON ?auto_143432 ?auto_143433 ) ( ON ?auto_143431 ?auto_143432 ) ( CLEAR ?auto_143429 ) ( ON ?auto_143430 ?auto_143431 ) ( CLEAR ?auto_143430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143427 ?auto_143428 ?auto_143429 ?auto_143430 )
      ( MAKE-11PILE ?auto_143427 ?auto_143428 ?auto_143429 ?auto_143430 ?auto_143431 ?auto_143432 ?auto_143433 ?auto_143434 ?auto_143435 ?auto_143436 ?auto_143437 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143449 - BLOCK
      ?auto_143450 - BLOCK
      ?auto_143451 - BLOCK
      ?auto_143452 - BLOCK
      ?auto_143453 - BLOCK
      ?auto_143454 - BLOCK
      ?auto_143455 - BLOCK
      ?auto_143456 - BLOCK
      ?auto_143457 - BLOCK
      ?auto_143458 - BLOCK
      ?auto_143459 - BLOCK
    )
    :vars
    (
      ?auto_143460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143459 ?auto_143460 ) ( ON-TABLE ?auto_143449 ) ( ON ?auto_143450 ?auto_143449 ) ( not ( = ?auto_143449 ?auto_143450 ) ) ( not ( = ?auto_143449 ?auto_143451 ) ) ( not ( = ?auto_143449 ?auto_143452 ) ) ( not ( = ?auto_143449 ?auto_143453 ) ) ( not ( = ?auto_143449 ?auto_143454 ) ) ( not ( = ?auto_143449 ?auto_143455 ) ) ( not ( = ?auto_143449 ?auto_143456 ) ) ( not ( = ?auto_143449 ?auto_143457 ) ) ( not ( = ?auto_143449 ?auto_143458 ) ) ( not ( = ?auto_143449 ?auto_143459 ) ) ( not ( = ?auto_143449 ?auto_143460 ) ) ( not ( = ?auto_143450 ?auto_143451 ) ) ( not ( = ?auto_143450 ?auto_143452 ) ) ( not ( = ?auto_143450 ?auto_143453 ) ) ( not ( = ?auto_143450 ?auto_143454 ) ) ( not ( = ?auto_143450 ?auto_143455 ) ) ( not ( = ?auto_143450 ?auto_143456 ) ) ( not ( = ?auto_143450 ?auto_143457 ) ) ( not ( = ?auto_143450 ?auto_143458 ) ) ( not ( = ?auto_143450 ?auto_143459 ) ) ( not ( = ?auto_143450 ?auto_143460 ) ) ( not ( = ?auto_143451 ?auto_143452 ) ) ( not ( = ?auto_143451 ?auto_143453 ) ) ( not ( = ?auto_143451 ?auto_143454 ) ) ( not ( = ?auto_143451 ?auto_143455 ) ) ( not ( = ?auto_143451 ?auto_143456 ) ) ( not ( = ?auto_143451 ?auto_143457 ) ) ( not ( = ?auto_143451 ?auto_143458 ) ) ( not ( = ?auto_143451 ?auto_143459 ) ) ( not ( = ?auto_143451 ?auto_143460 ) ) ( not ( = ?auto_143452 ?auto_143453 ) ) ( not ( = ?auto_143452 ?auto_143454 ) ) ( not ( = ?auto_143452 ?auto_143455 ) ) ( not ( = ?auto_143452 ?auto_143456 ) ) ( not ( = ?auto_143452 ?auto_143457 ) ) ( not ( = ?auto_143452 ?auto_143458 ) ) ( not ( = ?auto_143452 ?auto_143459 ) ) ( not ( = ?auto_143452 ?auto_143460 ) ) ( not ( = ?auto_143453 ?auto_143454 ) ) ( not ( = ?auto_143453 ?auto_143455 ) ) ( not ( = ?auto_143453 ?auto_143456 ) ) ( not ( = ?auto_143453 ?auto_143457 ) ) ( not ( = ?auto_143453 ?auto_143458 ) ) ( not ( = ?auto_143453 ?auto_143459 ) ) ( not ( = ?auto_143453 ?auto_143460 ) ) ( not ( = ?auto_143454 ?auto_143455 ) ) ( not ( = ?auto_143454 ?auto_143456 ) ) ( not ( = ?auto_143454 ?auto_143457 ) ) ( not ( = ?auto_143454 ?auto_143458 ) ) ( not ( = ?auto_143454 ?auto_143459 ) ) ( not ( = ?auto_143454 ?auto_143460 ) ) ( not ( = ?auto_143455 ?auto_143456 ) ) ( not ( = ?auto_143455 ?auto_143457 ) ) ( not ( = ?auto_143455 ?auto_143458 ) ) ( not ( = ?auto_143455 ?auto_143459 ) ) ( not ( = ?auto_143455 ?auto_143460 ) ) ( not ( = ?auto_143456 ?auto_143457 ) ) ( not ( = ?auto_143456 ?auto_143458 ) ) ( not ( = ?auto_143456 ?auto_143459 ) ) ( not ( = ?auto_143456 ?auto_143460 ) ) ( not ( = ?auto_143457 ?auto_143458 ) ) ( not ( = ?auto_143457 ?auto_143459 ) ) ( not ( = ?auto_143457 ?auto_143460 ) ) ( not ( = ?auto_143458 ?auto_143459 ) ) ( not ( = ?auto_143458 ?auto_143460 ) ) ( not ( = ?auto_143459 ?auto_143460 ) ) ( ON ?auto_143458 ?auto_143459 ) ( ON ?auto_143457 ?auto_143458 ) ( ON ?auto_143456 ?auto_143457 ) ( ON ?auto_143455 ?auto_143456 ) ( ON ?auto_143454 ?auto_143455 ) ( ON ?auto_143453 ?auto_143454 ) ( ON ?auto_143452 ?auto_143453 ) ( CLEAR ?auto_143450 ) ( ON ?auto_143451 ?auto_143452 ) ( CLEAR ?auto_143451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143449 ?auto_143450 ?auto_143451 )
      ( MAKE-11PILE ?auto_143449 ?auto_143450 ?auto_143451 ?auto_143452 ?auto_143453 ?auto_143454 ?auto_143455 ?auto_143456 ?auto_143457 ?auto_143458 ?auto_143459 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143472 - BLOCK
      ?auto_143473 - BLOCK
      ?auto_143474 - BLOCK
      ?auto_143475 - BLOCK
      ?auto_143476 - BLOCK
      ?auto_143477 - BLOCK
      ?auto_143478 - BLOCK
      ?auto_143479 - BLOCK
      ?auto_143480 - BLOCK
      ?auto_143481 - BLOCK
      ?auto_143482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143482 ) ( ON-TABLE ?auto_143472 ) ( ON ?auto_143473 ?auto_143472 ) ( not ( = ?auto_143472 ?auto_143473 ) ) ( not ( = ?auto_143472 ?auto_143474 ) ) ( not ( = ?auto_143472 ?auto_143475 ) ) ( not ( = ?auto_143472 ?auto_143476 ) ) ( not ( = ?auto_143472 ?auto_143477 ) ) ( not ( = ?auto_143472 ?auto_143478 ) ) ( not ( = ?auto_143472 ?auto_143479 ) ) ( not ( = ?auto_143472 ?auto_143480 ) ) ( not ( = ?auto_143472 ?auto_143481 ) ) ( not ( = ?auto_143472 ?auto_143482 ) ) ( not ( = ?auto_143473 ?auto_143474 ) ) ( not ( = ?auto_143473 ?auto_143475 ) ) ( not ( = ?auto_143473 ?auto_143476 ) ) ( not ( = ?auto_143473 ?auto_143477 ) ) ( not ( = ?auto_143473 ?auto_143478 ) ) ( not ( = ?auto_143473 ?auto_143479 ) ) ( not ( = ?auto_143473 ?auto_143480 ) ) ( not ( = ?auto_143473 ?auto_143481 ) ) ( not ( = ?auto_143473 ?auto_143482 ) ) ( not ( = ?auto_143474 ?auto_143475 ) ) ( not ( = ?auto_143474 ?auto_143476 ) ) ( not ( = ?auto_143474 ?auto_143477 ) ) ( not ( = ?auto_143474 ?auto_143478 ) ) ( not ( = ?auto_143474 ?auto_143479 ) ) ( not ( = ?auto_143474 ?auto_143480 ) ) ( not ( = ?auto_143474 ?auto_143481 ) ) ( not ( = ?auto_143474 ?auto_143482 ) ) ( not ( = ?auto_143475 ?auto_143476 ) ) ( not ( = ?auto_143475 ?auto_143477 ) ) ( not ( = ?auto_143475 ?auto_143478 ) ) ( not ( = ?auto_143475 ?auto_143479 ) ) ( not ( = ?auto_143475 ?auto_143480 ) ) ( not ( = ?auto_143475 ?auto_143481 ) ) ( not ( = ?auto_143475 ?auto_143482 ) ) ( not ( = ?auto_143476 ?auto_143477 ) ) ( not ( = ?auto_143476 ?auto_143478 ) ) ( not ( = ?auto_143476 ?auto_143479 ) ) ( not ( = ?auto_143476 ?auto_143480 ) ) ( not ( = ?auto_143476 ?auto_143481 ) ) ( not ( = ?auto_143476 ?auto_143482 ) ) ( not ( = ?auto_143477 ?auto_143478 ) ) ( not ( = ?auto_143477 ?auto_143479 ) ) ( not ( = ?auto_143477 ?auto_143480 ) ) ( not ( = ?auto_143477 ?auto_143481 ) ) ( not ( = ?auto_143477 ?auto_143482 ) ) ( not ( = ?auto_143478 ?auto_143479 ) ) ( not ( = ?auto_143478 ?auto_143480 ) ) ( not ( = ?auto_143478 ?auto_143481 ) ) ( not ( = ?auto_143478 ?auto_143482 ) ) ( not ( = ?auto_143479 ?auto_143480 ) ) ( not ( = ?auto_143479 ?auto_143481 ) ) ( not ( = ?auto_143479 ?auto_143482 ) ) ( not ( = ?auto_143480 ?auto_143481 ) ) ( not ( = ?auto_143480 ?auto_143482 ) ) ( not ( = ?auto_143481 ?auto_143482 ) ) ( ON ?auto_143481 ?auto_143482 ) ( ON ?auto_143480 ?auto_143481 ) ( ON ?auto_143479 ?auto_143480 ) ( ON ?auto_143478 ?auto_143479 ) ( ON ?auto_143477 ?auto_143478 ) ( ON ?auto_143476 ?auto_143477 ) ( ON ?auto_143475 ?auto_143476 ) ( CLEAR ?auto_143473 ) ( ON ?auto_143474 ?auto_143475 ) ( CLEAR ?auto_143474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143472 ?auto_143473 ?auto_143474 )
      ( MAKE-11PILE ?auto_143472 ?auto_143473 ?auto_143474 ?auto_143475 ?auto_143476 ?auto_143477 ?auto_143478 ?auto_143479 ?auto_143480 ?auto_143481 ?auto_143482 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143494 - BLOCK
      ?auto_143495 - BLOCK
      ?auto_143496 - BLOCK
      ?auto_143497 - BLOCK
      ?auto_143498 - BLOCK
      ?auto_143499 - BLOCK
      ?auto_143500 - BLOCK
      ?auto_143501 - BLOCK
      ?auto_143502 - BLOCK
      ?auto_143503 - BLOCK
      ?auto_143504 - BLOCK
    )
    :vars
    (
      ?auto_143505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143504 ?auto_143505 ) ( ON-TABLE ?auto_143494 ) ( not ( = ?auto_143494 ?auto_143495 ) ) ( not ( = ?auto_143494 ?auto_143496 ) ) ( not ( = ?auto_143494 ?auto_143497 ) ) ( not ( = ?auto_143494 ?auto_143498 ) ) ( not ( = ?auto_143494 ?auto_143499 ) ) ( not ( = ?auto_143494 ?auto_143500 ) ) ( not ( = ?auto_143494 ?auto_143501 ) ) ( not ( = ?auto_143494 ?auto_143502 ) ) ( not ( = ?auto_143494 ?auto_143503 ) ) ( not ( = ?auto_143494 ?auto_143504 ) ) ( not ( = ?auto_143494 ?auto_143505 ) ) ( not ( = ?auto_143495 ?auto_143496 ) ) ( not ( = ?auto_143495 ?auto_143497 ) ) ( not ( = ?auto_143495 ?auto_143498 ) ) ( not ( = ?auto_143495 ?auto_143499 ) ) ( not ( = ?auto_143495 ?auto_143500 ) ) ( not ( = ?auto_143495 ?auto_143501 ) ) ( not ( = ?auto_143495 ?auto_143502 ) ) ( not ( = ?auto_143495 ?auto_143503 ) ) ( not ( = ?auto_143495 ?auto_143504 ) ) ( not ( = ?auto_143495 ?auto_143505 ) ) ( not ( = ?auto_143496 ?auto_143497 ) ) ( not ( = ?auto_143496 ?auto_143498 ) ) ( not ( = ?auto_143496 ?auto_143499 ) ) ( not ( = ?auto_143496 ?auto_143500 ) ) ( not ( = ?auto_143496 ?auto_143501 ) ) ( not ( = ?auto_143496 ?auto_143502 ) ) ( not ( = ?auto_143496 ?auto_143503 ) ) ( not ( = ?auto_143496 ?auto_143504 ) ) ( not ( = ?auto_143496 ?auto_143505 ) ) ( not ( = ?auto_143497 ?auto_143498 ) ) ( not ( = ?auto_143497 ?auto_143499 ) ) ( not ( = ?auto_143497 ?auto_143500 ) ) ( not ( = ?auto_143497 ?auto_143501 ) ) ( not ( = ?auto_143497 ?auto_143502 ) ) ( not ( = ?auto_143497 ?auto_143503 ) ) ( not ( = ?auto_143497 ?auto_143504 ) ) ( not ( = ?auto_143497 ?auto_143505 ) ) ( not ( = ?auto_143498 ?auto_143499 ) ) ( not ( = ?auto_143498 ?auto_143500 ) ) ( not ( = ?auto_143498 ?auto_143501 ) ) ( not ( = ?auto_143498 ?auto_143502 ) ) ( not ( = ?auto_143498 ?auto_143503 ) ) ( not ( = ?auto_143498 ?auto_143504 ) ) ( not ( = ?auto_143498 ?auto_143505 ) ) ( not ( = ?auto_143499 ?auto_143500 ) ) ( not ( = ?auto_143499 ?auto_143501 ) ) ( not ( = ?auto_143499 ?auto_143502 ) ) ( not ( = ?auto_143499 ?auto_143503 ) ) ( not ( = ?auto_143499 ?auto_143504 ) ) ( not ( = ?auto_143499 ?auto_143505 ) ) ( not ( = ?auto_143500 ?auto_143501 ) ) ( not ( = ?auto_143500 ?auto_143502 ) ) ( not ( = ?auto_143500 ?auto_143503 ) ) ( not ( = ?auto_143500 ?auto_143504 ) ) ( not ( = ?auto_143500 ?auto_143505 ) ) ( not ( = ?auto_143501 ?auto_143502 ) ) ( not ( = ?auto_143501 ?auto_143503 ) ) ( not ( = ?auto_143501 ?auto_143504 ) ) ( not ( = ?auto_143501 ?auto_143505 ) ) ( not ( = ?auto_143502 ?auto_143503 ) ) ( not ( = ?auto_143502 ?auto_143504 ) ) ( not ( = ?auto_143502 ?auto_143505 ) ) ( not ( = ?auto_143503 ?auto_143504 ) ) ( not ( = ?auto_143503 ?auto_143505 ) ) ( not ( = ?auto_143504 ?auto_143505 ) ) ( ON ?auto_143503 ?auto_143504 ) ( ON ?auto_143502 ?auto_143503 ) ( ON ?auto_143501 ?auto_143502 ) ( ON ?auto_143500 ?auto_143501 ) ( ON ?auto_143499 ?auto_143500 ) ( ON ?auto_143498 ?auto_143499 ) ( ON ?auto_143497 ?auto_143498 ) ( ON ?auto_143496 ?auto_143497 ) ( CLEAR ?auto_143494 ) ( ON ?auto_143495 ?auto_143496 ) ( CLEAR ?auto_143495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143494 ?auto_143495 )
      ( MAKE-11PILE ?auto_143494 ?auto_143495 ?auto_143496 ?auto_143497 ?auto_143498 ?auto_143499 ?auto_143500 ?auto_143501 ?auto_143502 ?auto_143503 ?auto_143504 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143517 - BLOCK
      ?auto_143518 - BLOCK
      ?auto_143519 - BLOCK
      ?auto_143520 - BLOCK
      ?auto_143521 - BLOCK
      ?auto_143522 - BLOCK
      ?auto_143523 - BLOCK
      ?auto_143524 - BLOCK
      ?auto_143525 - BLOCK
      ?auto_143526 - BLOCK
      ?auto_143527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143527 ) ( ON-TABLE ?auto_143517 ) ( not ( = ?auto_143517 ?auto_143518 ) ) ( not ( = ?auto_143517 ?auto_143519 ) ) ( not ( = ?auto_143517 ?auto_143520 ) ) ( not ( = ?auto_143517 ?auto_143521 ) ) ( not ( = ?auto_143517 ?auto_143522 ) ) ( not ( = ?auto_143517 ?auto_143523 ) ) ( not ( = ?auto_143517 ?auto_143524 ) ) ( not ( = ?auto_143517 ?auto_143525 ) ) ( not ( = ?auto_143517 ?auto_143526 ) ) ( not ( = ?auto_143517 ?auto_143527 ) ) ( not ( = ?auto_143518 ?auto_143519 ) ) ( not ( = ?auto_143518 ?auto_143520 ) ) ( not ( = ?auto_143518 ?auto_143521 ) ) ( not ( = ?auto_143518 ?auto_143522 ) ) ( not ( = ?auto_143518 ?auto_143523 ) ) ( not ( = ?auto_143518 ?auto_143524 ) ) ( not ( = ?auto_143518 ?auto_143525 ) ) ( not ( = ?auto_143518 ?auto_143526 ) ) ( not ( = ?auto_143518 ?auto_143527 ) ) ( not ( = ?auto_143519 ?auto_143520 ) ) ( not ( = ?auto_143519 ?auto_143521 ) ) ( not ( = ?auto_143519 ?auto_143522 ) ) ( not ( = ?auto_143519 ?auto_143523 ) ) ( not ( = ?auto_143519 ?auto_143524 ) ) ( not ( = ?auto_143519 ?auto_143525 ) ) ( not ( = ?auto_143519 ?auto_143526 ) ) ( not ( = ?auto_143519 ?auto_143527 ) ) ( not ( = ?auto_143520 ?auto_143521 ) ) ( not ( = ?auto_143520 ?auto_143522 ) ) ( not ( = ?auto_143520 ?auto_143523 ) ) ( not ( = ?auto_143520 ?auto_143524 ) ) ( not ( = ?auto_143520 ?auto_143525 ) ) ( not ( = ?auto_143520 ?auto_143526 ) ) ( not ( = ?auto_143520 ?auto_143527 ) ) ( not ( = ?auto_143521 ?auto_143522 ) ) ( not ( = ?auto_143521 ?auto_143523 ) ) ( not ( = ?auto_143521 ?auto_143524 ) ) ( not ( = ?auto_143521 ?auto_143525 ) ) ( not ( = ?auto_143521 ?auto_143526 ) ) ( not ( = ?auto_143521 ?auto_143527 ) ) ( not ( = ?auto_143522 ?auto_143523 ) ) ( not ( = ?auto_143522 ?auto_143524 ) ) ( not ( = ?auto_143522 ?auto_143525 ) ) ( not ( = ?auto_143522 ?auto_143526 ) ) ( not ( = ?auto_143522 ?auto_143527 ) ) ( not ( = ?auto_143523 ?auto_143524 ) ) ( not ( = ?auto_143523 ?auto_143525 ) ) ( not ( = ?auto_143523 ?auto_143526 ) ) ( not ( = ?auto_143523 ?auto_143527 ) ) ( not ( = ?auto_143524 ?auto_143525 ) ) ( not ( = ?auto_143524 ?auto_143526 ) ) ( not ( = ?auto_143524 ?auto_143527 ) ) ( not ( = ?auto_143525 ?auto_143526 ) ) ( not ( = ?auto_143525 ?auto_143527 ) ) ( not ( = ?auto_143526 ?auto_143527 ) ) ( ON ?auto_143526 ?auto_143527 ) ( ON ?auto_143525 ?auto_143526 ) ( ON ?auto_143524 ?auto_143525 ) ( ON ?auto_143523 ?auto_143524 ) ( ON ?auto_143522 ?auto_143523 ) ( ON ?auto_143521 ?auto_143522 ) ( ON ?auto_143520 ?auto_143521 ) ( ON ?auto_143519 ?auto_143520 ) ( CLEAR ?auto_143517 ) ( ON ?auto_143518 ?auto_143519 ) ( CLEAR ?auto_143518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143517 ?auto_143518 )
      ( MAKE-11PILE ?auto_143517 ?auto_143518 ?auto_143519 ?auto_143520 ?auto_143521 ?auto_143522 ?auto_143523 ?auto_143524 ?auto_143525 ?auto_143526 ?auto_143527 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143539 - BLOCK
      ?auto_143540 - BLOCK
      ?auto_143541 - BLOCK
      ?auto_143542 - BLOCK
      ?auto_143543 - BLOCK
      ?auto_143544 - BLOCK
      ?auto_143545 - BLOCK
      ?auto_143546 - BLOCK
      ?auto_143547 - BLOCK
      ?auto_143548 - BLOCK
      ?auto_143549 - BLOCK
    )
    :vars
    (
      ?auto_143550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143549 ?auto_143550 ) ( not ( = ?auto_143539 ?auto_143540 ) ) ( not ( = ?auto_143539 ?auto_143541 ) ) ( not ( = ?auto_143539 ?auto_143542 ) ) ( not ( = ?auto_143539 ?auto_143543 ) ) ( not ( = ?auto_143539 ?auto_143544 ) ) ( not ( = ?auto_143539 ?auto_143545 ) ) ( not ( = ?auto_143539 ?auto_143546 ) ) ( not ( = ?auto_143539 ?auto_143547 ) ) ( not ( = ?auto_143539 ?auto_143548 ) ) ( not ( = ?auto_143539 ?auto_143549 ) ) ( not ( = ?auto_143539 ?auto_143550 ) ) ( not ( = ?auto_143540 ?auto_143541 ) ) ( not ( = ?auto_143540 ?auto_143542 ) ) ( not ( = ?auto_143540 ?auto_143543 ) ) ( not ( = ?auto_143540 ?auto_143544 ) ) ( not ( = ?auto_143540 ?auto_143545 ) ) ( not ( = ?auto_143540 ?auto_143546 ) ) ( not ( = ?auto_143540 ?auto_143547 ) ) ( not ( = ?auto_143540 ?auto_143548 ) ) ( not ( = ?auto_143540 ?auto_143549 ) ) ( not ( = ?auto_143540 ?auto_143550 ) ) ( not ( = ?auto_143541 ?auto_143542 ) ) ( not ( = ?auto_143541 ?auto_143543 ) ) ( not ( = ?auto_143541 ?auto_143544 ) ) ( not ( = ?auto_143541 ?auto_143545 ) ) ( not ( = ?auto_143541 ?auto_143546 ) ) ( not ( = ?auto_143541 ?auto_143547 ) ) ( not ( = ?auto_143541 ?auto_143548 ) ) ( not ( = ?auto_143541 ?auto_143549 ) ) ( not ( = ?auto_143541 ?auto_143550 ) ) ( not ( = ?auto_143542 ?auto_143543 ) ) ( not ( = ?auto_143542 ?auto_143544 ) ) ( not ( = ?auto_143542 ?auto_143545 ) ) ( not ( = ?auto_143542 ?auto_143546 ) ) ( not ( = ?auto_143542 ?auto_143547 ) ) ( not ( = ?auto_143542 ?auto_143548 ) ) ( not ( = ?auto_143542 ?auto_143549 ) ) ( not ( = ?auto_143542 ?auto_143550 ) ) ( not ( = ?auto_143543 ?auto_143544 ) ) ( not ( = ?auto_143543 ?auto_143545 ) ) ( not ( = ?auto_143543 ?auto_143546 ) ) ( not ( = ?auto_143543 ?auto_143547 ) ) ( not ( = ?auto_143543 ?auto_143548 ) ) ( not ( = ?auto_143543 ?auto_143549 ) ) ( not ( = ?auto_143543 ?auto_143550 ) ) ( not ( = ?auto_143544 ?auto_143545 ) ) ( not ( = ?auto_143544 ?auto_143546 ) ) ( not ( = ?auto_143544 ?auto_143547 ) ) ( not ( = ?auto_143544 ?auto_143548 ) ) ( not ( = ?auto_143544 ?auto_143549 ) ) ( not ( = ?auto_143544 ?auto_143550 ) ) ( not ( = ?auto_143545 ?auto_143546 ) ) ( not ( = ?auto_143545 ?auto_143547 ) ) ( not ( = ?auto_143545 ?auto_143548 ) ) ( not ( = ?auto_143545 ?auto_143549 ) ) ( not ( = ?auto_143545 ?auto_143550 ) ) ( not ( = ?auto_143546 ?auto_143547 ) ) ( not ( = ?auto_143546 ?auto_143548 ) ) ( not ( = ?auto_143546 ?auto_143549 ) ) ( not ( = ?auto_143546 ?auto_143550 ) ) ( not ( = ?auto_143547 ?auto_143548 ) ) ( not ( = ?auto_143547 ?auto_143549 ) ) ( not ( = ?auto_143547 ?auto_143550 ) ) ( not ( = ?auto_143548 ?auto_143549 ) ) ( not ( = ?auto_143548 ?auto_143550 ) ) ( not ( = ?auto_143549 ?auto_143550 ) ) ( ON ?auto_143548 ?auto_143549 ) ( ON ?auto_143547 ?auto_143548 ) ( ON ?auto_143546 ?auto_143547 ) ( ON ?auto_143545 ?auto_143546 ) ( ON ?auto_143544 ?auto_143545 ) ( ON ?auto_143543 ?auto_143544 ) ( ON ?auto_143542 ?auto_143543 ) ( ON ?auto_143541 ?auto_143542 ) ( ON ?auto_143540 ?auto_143541 ) ( ON ?auto_143539 ?auto_143540 ) ( CLEAR ?auto_143539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143539 )
      ( MAKE-11PILE ?auto_143539 ?auto_143540 ?auto_143541 ?auto_143542 ?auto_143543 ?auto_143544 ?auto_143545 ?auto_143546 ?auto_143547 ?auto_143548 ?auto_143549 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143562 - BLOCK
      ?auto_143563 - BLOCK
      ?auto_143564 - BLOCK
      ?auto_143565 - BLOCK
      ?auto_143566 - BLOCK
      ?auto_143567 - BLOCK
      ?auto_143568 - BLOCK
      ?auto_143569 - BLOCK
      ?auto_143570 - BLOCK
      ?auto_143571 - BLOCK
      ?auto_143572 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143572 ) ( not ( = ?auto_143562 ?auto_143563 ) ) ( not ( = ?auto_143562 ?auto_143564 ) ) ( not ( = ?auto_143562 ?auto_143565 ) ) ( not ( = ?auto_143562 ?auto_143566 ) ) ( not ( = ?auto_143562 ?auto_143567 ) ) ( not ( = ?auto_143562 ?auto_143568 ) ) ( not ( = ?auto_143562 ?auto_143569 ) ) ( not ( = ?auto_143562 ?auto_143570 ) ) ( not ( = ?auto_143562 ?auto_143571 ) ) ( not ( = ?auto_143562 ?auto_143572 ) ) ( not ( = ?auto_143563 ?auto_143564 ) ) ( not ( = ?auto_143563 ?auto_143565 ) ) ( not ( = ?auto_143563 ?auto_143566 ) ) ( not ( = ?auto_143563 ?auto_143567 ) ) ( not ( = ?auto_143563 ?auto_143568 ) ) ( not ( = ?auto_143563 ?auto_143569 ) ) ( not ( = ?auto_143563 ?auto_143570 ) ) ( not ( = ?auto_143563 ?auto_143571 ) ) ( not ( = ?auto_143563 ?auto_143572 ) ) ( not ( = ?auto_143564 ?auto_143565 ) ) ( not ( = ?auto_143564 ?auto_143566 ) ) ( not ( = ?auto_143564 ?auto_143567 ) ) ( not ( = ?auto_143564 ?auto_143568 ) ) ( not ( = ?auto_143564 ?auto_143569 ) ) ( not ( = ?auto_143564 ?auto_143570 ) ) ( not ( = ?auto_143564 ?auto_143571 ) ) ( not ( = ?auto_143564 ?auto_143572 ) ) ( not ( = ?auto_143565 ?auto_143566 ) ) ( not ( = ?auto_143565 ?auto_143567 ) ) ( not ( = ?auto_143565 ?auto_143568 ) ) ( not ( = ?auto_143565 ?auto_143569 ) ) ( not ( = ?auto_143565 ?auto_143570 ) ) ( not ( = ?auto_143565 ?auto_143571 ) ) ( not ( = ?auto_143565 ?auto_143572 ) ) ( not ( = ?auto_143566 ?auto_143567 ) ) ( not ( = ?auto_143566 ?auto_143568 ) ) ( not ( = ?auto_143566 ?auto_143569 ) ) ( not ( = ?auto_143566 ?auto_143570 ) ) ( not ( = ?auto_143566 ?auto_143571 ) ) ( not ( = ?auto_143566 ?auto_143572 ) ) ( not ( = ?auto_143567 ?auto_143568 ) ) ( not ( = ?auto_143567 ?auto_143569 ) ) ( not ( = ?auto_143567 ?auto_143570 ) ) ( not ( = ?auto_143567 ?auto_143571 ) ) ( not ( = ?auto_143567 ?auto_143572 ) ) ( not ( = ?auto_143568 ?auto_143569 ) ) ( not ( = ?auto_143568 ?auto_143570 ) ) ( not ( = ?auto_143568 ?auto_143571 ) ) ( not ( = ?auto_143568 ?auto_143572 ) ) ( not ( = ?auto_143569 ?auto_143570 ) ) ( not ( = ?auto_143569 ?auto_143571 ) ) ( not ( = ?auto_143569 ?auto_143572 ) ) ( not ( = ?auto_143570 ?auto_143571 ) ) ( not ( = ?auto_143570 ?auto_143572 ) ) ( not ( = ?auto_143571 ?auto_143572 ) ) ( ON ?auto_143571 ?auto_143572 ) ( ON ?auto_143570 ?auto_143571 ) ( ON ?auto_143569 ?auto_143570 ) ( ON ?auto_143568 ?auto_143569 ) ( ON ?auto_143567 ?auto_143568 ) ( ON ?auto_143566 ?auto_143567 ) ( ON ?auto_143565 ?auto_143566 ) ( ON ?auto_143564 ?auto_143565 ) ( ON ?auto_143563 ?auto_143564 ) ( ON ?auto_143562 ?auto_143563 ) ( CLEAR ?auto_143562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143562 )
      ( MAKE-11PILE ?auto_143562 ?auto_143563 ?auto_143564 ?auto_143565 ?auto_143566 ?auto_143567 ?auto_143568 ?auto_143569 ?auto_143570 ?auto_143571 ?auto_143572 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_143584 - BLOCK
      ?auto_143585 - BLOCK
      ?auto_143586 - BLOCK
      ?auto_143587 - BLOCK
      ?auto_143588 - BLOCK
      ?auto_143589 - BLOCK
      ?auto_143590 - BLOCK
      ?auto_143591 - BLOCK
      ?auto_143592 - BLOCK
      ?auto_143593 - BLOCK
      ?auto_143594 - BLOCK
    )
    :vars
    (
      ?auto_143595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143584 ?auto_143585 ) ) ( not ( = ?auto_143584 ?auto_143586 ) ) ( not ( = ?auto_143584 ?auto_143587 ) ) ( not ( = ?auto_143584 ?auto_143588 ) ) ( not ( = ?auto_143584 ?auto_143589 ) ) ( not ( = ?auto_143584 ?auto_143590 ) ) ( not ( = ?auto_143584 ?auto_143591 ) ) ( not ( = ?auto_143584 ?auto_143592 ) ) ( not ( = ?auto_143584 ?auto_143593 ) ) ( not ( = ?auto_143584 ?auto_143594 ) ) ( not ( = ?auto_143585 ?auto_143586 ) ) ( not ( = ?auto_143585 ?auto_143587 ) ) ( not ( = ?auto_143585 ?auto_143588 ) ) ( not ( = ?auto_143585 ?auto_143589 ) ) ( not ( = ?auto_143585 ?auto_143590 ) ) ( not ( = ?auto_143585 ?auto_143591 ) ) ( not ( = ?auto_143585 ?auto_143592 ) ) ( not ( = ?auto_143585 ?auto_143593 ) ) ( not ( = ?auto_143585 ?auto_143594 ) ) ( not ( = ?auto_143586 ?auto_143587 ) ) ( not ( = ?auto_143586 ?auto_143588 ) ) ( not ( = ?auto_143586 ?auto_143589 ) ) ( not ( = ?auto_143586 ?auto_143590 ) ) ( not ( = ?auto_143586 ?auto_143591 ) ) ( not ( = ?auto_143586 ?auto_143592 ) ) ( not ( = ?auto_143586 ?auto_143593 ) ) ( not ( = ?auto_143586 ?auto_143594 ) ) ( not ( = ?auto_143587 ?auto_143588 ) ) ( not ( = ?auto_143587 ?auto_143589 ) ) ( not ( = ?auto_143587 ?auto_143590 ) ) ( not ( = ?auto_143587 ?auto_143591 ) ) ( not ( = ?auto_143587 ?auto_143592 ) ) ( not ( = ?auto_143587 ?auto_143593 ) ) ( not ( = ?auto_143587 ?auto_143594 ) ) ( not ( = ?auto_143588 ?auto_143589 ) ) ( not ( = ?auto_143588 ?auto_143590 ) ) ( not ( = ?auto_143588 ?auto_143591 ) ) ( not ( = ?auto_143588 ?auto_143592 ) ) ( not ( = ?auto_143588 ?auto_143593 ) ) ( not ( = ?auto_143588 ?auto_143594 ) ) ( not ( = ?auto_143589 ?auto_143590 ) ) ( not ( = ?auto_143589 ?auto_143591 ) ) ( not ( = ?auto_143589 ?auto_143592 ) ) ( not ( = ?auto_143589 ?auto_143593 ) ) ( not ( = ?auto_143589 ?auto_143594 ) ) ( not ( = ?auto_143590 ?auto_143591 ) ) ( not ( = ?auto_143590 ?auto_143592 ) ) ( not ( = ?auto_143590 ?auto_143593 ) ) ( not ( = ?auto_143590 ?auto_143594 ) ) ( not ( = ?auto_143591 ?auto_143592 ) ) ( not ( = ?auto_143591 ?auto_143593 ) ) ( not ( = ?auto_143591 ?auto_143594 ) ) ( not ( = ?auto_143592 ?auto_143593 ) ) ( not ( = ?auto_143592 ?auto_143594 ) ) ( not ( = ?auto_143593 ?auto_143594 ) ) ( ON ?auto_143584 ?auto_143595 ) ( not ( = ?auto_143594 ?auto_143595 ) ) ( not ( = ?auto_143593 ?auto_143595 ) ) ( not ( = ?auto_143592 ?auto_143595 ) ) ( not ( = ?auto_143591 ?auto_143595 ) ) ( not ( = ?auto_143590 ?auto_143595 ) ) ( not ( = ?auto_143589 ?auto_143595 ) ) ( not ( = ?auto_143588 ?auto_143595 ) ) ( not ( = ?auto_143587 ?auto_143595 ) ) ( not ( = ?auto_143586 ?auto_143595 ) ) ( not ( = ?auto_143585 ?auto_143595 ) ) ( not ( = ?auto_143584 ?auto_143595 ) ) ( ON ?auto_143585 ?auto_143584 ) ( ON ?auto_143586 ?auto_143585 ) ( ON ?auto_143587 ?auto_143586 ) ( ON ?auto_143588 ?auto_143587 ) ( ON ?auto_143589 ?auto_143588 ) ( ON ?auto_143590 ?auto_143589 ) ( ON ?auto_143591 ?auto_143590 ) ( ON ?auto_143592 ?auto_143591 ) ( ON ?auto_143593 ?auto_143592 ) ( ON ?auto_143594 ?auto_143593 ) ( CLEAR ?auto_143594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_143594 ?auto_143593 ?auto_143592 ?auto_143591 ?auto_143590 ?auto_143589 ?auto_143588 ?auto_143587 ?auto_143586 ?auto_143585 ?auto_143584 )
      ( MAKE-11PILE ?auto_143584 ?auto_143585 ?auto_143586 ?auto_143587 ?auto_143588 ?auto_143589 ?auto_143590 ?auto_143591 ?auto_143592 ?auto_143593 ?auto_143594 ) )
  )

)

