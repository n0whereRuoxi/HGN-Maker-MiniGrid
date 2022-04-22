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
      ?auto_169484 - BLOCK
    )
    :vars
    (
      ?auto_169485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169484 ?auto_169485 ) ( CLEAR ?auto_169484 ) ( HAND-EMPTY ) ( not ( = ?auto_169484 ?auto_169485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169484 ?auto_169485 )
      ( !PUTDOWN ?auto_169484 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_169487 - BLOCK
    )
    :vars
    (
      ?auto_169488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169487 ?auto_169488 ) ( CLEAR ?auto_169487 ) ( HAND-EMPTY ) ( not ( = ?auto_169487 ?auto_169488 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169487 ?auto_169488 )
      ( !PUTDOWN ?auto_169487 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169491 - BLOCK
      ?auto_169492 - BLOCK
    )
    :vars
    (
      ?auto_169493 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169491 ) ( ON ?auto_169492 ?auto_169493 ) ( CLEAR ?auto_169492 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169491 ) ( not ( = ?auto_169491 ?auto_169492 ) ) ( not ( = ?auto_169491 ?auto_169493 ) ) ( not ( = ?auto_169492 ?auto_169493 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169492 ?auto_169493 )
      ( !STACK ?auto_169492 ?auto_169491 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169496 - BLOCK
      ?auto_169497 - BLOCK
    )
    :vars
    (
      ?auto_169498 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169496 ) ( ON ?auto_169497 ?auto_169498 ) ( CLEAR ?auto_169497 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169496 ) ( not ( = ?auto_169496 ?auto_169497 ) ) ( not ( = ?auto_169496 ?auto_169498 ) ) ( not ( = ?auto_169497 ?auto_169498 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169497 ?auto_169498 )
      ( !STACK ?auto_169497 ?auto_169496 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169501 - BLOCK
      ?auto_169502 - BLOCK
    )
    :vars
    (
      ?auto_169503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169502 ?auto_169503 ) ( not ( = ?auto_169501 ?auto_169502 ) ) ( not ( = ?auto_169501 ?auto_169503 ) ) ( not ( = ?auto_169502 ?auto_169503 ) ) ( ON ?auto_169501 ?auto_169502 ) ( CLEAR ?auto_169501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169501 )
      ( MAKE-2PILE ?auto_169501 ?auto_169502 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169506 - BLOCK
      ?auto_169507 - BLOCK
    )
    :vars
    (
      ?auto_169508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169507 ?auto_169508 ) ( not ( = ?auto_169506 ?auto_169507 ) ) ( not ( = ?auto_169506 ?auto_169508 ) ) ( not ( = ?auto_169507 ?auto_169508 ) ) ( ON ?auto_169506 ?auto_169507 ) ( CLEAR ?auto_169506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169506 )
      ( MAKE-2PILE ?auto_169506 ?auto_169507 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169512 - BLOCK
      ?auto_169513 - BLOCK
      ?auto_169514 - BLOCK
    )
    :vars
    (
      ?auto_169515 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169513 ) ( ON ?auto_169514 ?auto_169515 ) ( CLEAR ?auto_169514 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169512 ) ( ON ?auto_169513 ?auto_169512 ) ( not ( = ?auto_169512 ?auto_169513 ) ) ( not ( = ?auto_169512 ?auto_169514 ) ) ( not ( = ?auto_169512 ?auto_169515 ) ) ( not ( = ?auto_169513 ?auto_169514 ) ) ( not ( = ?auto_169513 ?auto_169515 ) ) ( not ( = ?auto_169514 ?auto_169515 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169514 ?auto_169515 )
      ( !STACK ?auto_169514 ?auto_169513 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169519 - BLOCK
      ?auto_169520 - BLOCK
      ?auto_169521 - BLOCK
    )
    :vars
    (
      ?auto_169522 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169520 ) ( ON ?auto_169521 ?auto_169522 ) ( CLEAR ?auto_169521 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169519 ) ( ON ?auto_169520 ?auto_169519 ) ( not ( = ?auto_169519 ?auto_169520 ) ) ( not ( = ?auto_169519 ?auto_169521 ) ) ( not ( = ?auto_169519 ?auto_169522 ) ) ( not ( = ?auto_169520 ?auto_169521 ) ) ( not ( = ?auto_169520 ?auto_169522 ) ) ( not ( = ?auto_169521 ?auto_169522 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169521 ?auto_169522 )
      ( !STACK ?auto_169521 ?auto_169520 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169526 - BLOCK
      ?auto_169527 - BLOCK
      ?auto_169528 - BLOCK
    )
    :vars
    (
      ?auto_169529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169528 ?auto_169529 ) ( ON-TABLE ?auto_169526 ) ( not ( = ?auto_169526 ?auto_169527 ) ) ( not ( = ?auto_169526 ?auto_169528 ) ) ( not ( = ?auto_169526 ?auto_169529 ) ) ( not ( = ?auto_169527 ?auto_169528 ) ) ( not ( = ?auto_169527 ?auto_169529 ) ) ( not ( = ?auto_169528 ?auto_169529 ) ) ( CLEAR ?auto_169526 ) ( ON ?auto_169527 ?auto_169528 ) ( CLEAR ?auto_169527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169526 ?auto_169527 )
      ( MAKE-3PILE ?auto_169526 ?auto_169527 ?auto_169528 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169533 - BLOCK
      ?auto_169534 - BLOCK
      ?auto_169535 - BLOCK
    )
    :vars
    (
      ?auto_169536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169535 ?auto_169536 ) ( ON-TABLE ?auto_169533 ) ( not ( = ?auto_169533 ?auto_169534 ) ) ( not ( = ?auto_169533 ?auto_169535 ) ) ( not ( = ?auto_169533 ?auto_169536 ) ) ( not ( = ?auto_169534 ?auto_169535 ) ) ( not ( = ?auto_169534 ?auto_169536 ) ) ( not ( = ?auto_169535 ?auto_169536 ) ) ( CLEAR ?auto_169533 ) ( ON ?auto_169534 ?auto_169535 ) ( CLEAR ?auto_169534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169533 ?auto_169534 )
      ( MAKE-3PILE ?auto_169533 ?auto_169534 ?auto_169535 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169540 - BLOCK
      ?auto_169541 - BLOCK
      ?auto_169542 - BLOCK
    )
    :vars
    (
      ?auto_169543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169542 ?auto_169543 ) ( not ( = ?auto_169540 ?auto_169541 ) ) ( not ( = ?auto_169540 ?auto_169542 ) ) ( not ( = ?auto_169540 ?auto_169543 ) ) ( not ( = ?auto_169541 ?auto_169542 ) ) ( not ( = ?auto_169541 ?auto_169543 ) ) ( not ( = ?auto_169542 ?auto_169543 ) ) ( ON ?auto_169541 ?auto_169542 ) ( ON ?auto_169540 ?auto_169541 ) ( CLEAR ?auto_169540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169540 )
      ( MAKE-3PILE ?auto_169540 ?auto_169541 ?auto_169542 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169547 - BLOCK
      ?auto_169548 - BLOCK
      ?auto_169549 - BLOCK
    )
    :vars
    (
      ?auto_169550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169549 ?auto_169550 ) ( not ( = ?auto_169547 ?auto_169548 ) ) ( not ( = ?auto_169547 ?auto_169549 ) ) ( not ( = ?auto_169547 ?auto_169550 ) ) ( not ( = ?auto_169548 ?auto_169549 ) ) ( not ( = ?auto_169548 ?auto_169550 ) ) ( not ( = ?auto_169549 ?auto_169550 ) ) ( ON ?auto_169548 ?auto_169549 ) ( ON ?auto_169547 ?auto_169548 ) ( CLEAR ?auto_169547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169547 )
      ( MAKE-3PILE ?auto_169547 ?auto_169548 ?auto_169549 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169555 - BLOCK
      ?auto_169556 - BLOCK
      ?auto_169557 - BLOCK
      ?auto_169558 - BLOCK
    )
    :vars
    (
      ?auto_169559 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169557 ) ( ON ?auto_169558 ?auto_169559 ) ( CLEAR ?auto_169558 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169555 ) ( ON ?auto_169556 ?auto_169555 ) ( ON ?auto_169557 ?auto_169556 ) ( not ( = ?auto_169555 ?auto_169556 ) ) ( not ( = ?auto_169555 ?auto_169557 ) ) ( not ( = ?auto_169555 ?auto_169558 ) ) ( not ( = ?auto_169555 ?auto_169559 ) ) ( not ( = ?auto_169556 ?auto_169557 ) ) ( not ( = ?auto_169556 ?auto_169558 ) ) ( not ( = ?auto_169556 ?auto_169559 ) ) ( not ( = ?auto_169557 ?auto_169558 ) ) ( not ( = ?auto_169557 ?auto_169559 ) ) ( not ( = ?auto_169558 ?auto_169559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169558 ?auto_169559 )
      ( !STACK ?auto_169558 ?auto_169557 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169564 - BLOCK
      ?auto_169565 - BLOCK
      ?auto_169566 - BLOCK
      ?auto_169567 - BLOCK
    )
    :vars
    (
      ?auto_169568 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169566 ) ( ON ?auto_169567 ?auto_169568 ) ( CLEAR ?auto_169567 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169564 ) ( ON ?auto_169565 ?auto_169564 ) ( ON ?auto_169566 ?auto_169565 ) ( not ( = ?auto_169564 ?auto_169565 ) ) ( not ( = ?auto_169564 ?auto_169566 ) ) ( not ( = ?auto_169564 ?auto_169567 ) ) ( not ( = ?auto_169564 ?auto_169568 ) ) ( not ( = ?auto_169565 ?auto_169566 ) ) ( not ( = ?auto_169565 ?auto_169567 ) ) ( not ( = ?auto_169565 ?auto_169568 ) ) ( not ( = ?auto_169566 ?auto_169567 ) ) ( not ( = ?auto_169566 ?auto_169568 ) ) ( not ( = ?auto_169567 ?auto_169568 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169567 ?auto_169568 )
      ( !STACK ?auto_169567 ?auto_169566 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169573 - BLOCK
      ?auto_169574 - BLOCK
      ?auto_169575 - BLOCK
      ?auto_169576 - BLOCK
    )
    :vars
    (
      ?auto_169577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169576 ?auto_169577 ) ( ON-TABLE ?auto_169573 ) ( ON ?auto_169574 ?auto_169573 ) ( not ( = ?auto_169573 ?auto_169574 ) ) ( not ( = ?auto_169573 ?auto_169575 ) ) ( not ( = ?auto_169573 ?auto_169576 ) ) ( not ( = ?auto_169573 ?auto_169577 ) ) ( not ( = ?auto_169574 ?auto_169575 ) ) ( not ( = ?auto_169574 ?auto_169576 ) ) ( not ( = ?auto_169574 ?auto_169577 ) ) ( not ( = ?auto_169575 ?auto_169576 ) ) ( not ( = ?auto_169575 ?auto_169577 ) ) ( not ( = ?auto_169576 ?auto_169577 ) ) ( CLEAR ?auto_169574 ) ( ON ?auto_169575 ?auto_169576 ) ( CLEAR ?auto_169575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169573 ?auto_169574 ?auto_169575 )
      ( MAKE-4PILE ?auto_169573 ?auto_169574 ?auto_169575 ?auto_169576 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169582 - BLOCK
      ?auto_169583 - BLOCK
      ?auto_169584 - BLOCK
      ?auto_169585 - BLOCK
    )
    :vars
    (
      ?auto_169586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169585 ?auto_169586 ) ( ON-TABLE ?auto_169582 ) ( ON ?auto_169583 ?auto_169582 ) ( not ( = ?auto_169582 ?auto_169583 ) ) ( not ( = ?auto_169582 ?auto_169584 ) ) ( not ( = ?auto_169582 ?auto_169585 ) ) ( not ( = ?auto_169582 ?auto_169586 ) ) ( not ( = ?auto_169583 ?auto_169584 ) ) ( not ( = ?auto_169583 ?auto_169585 ) ) ( not ( = ?auto_169583 ?auto_169586 ) ) ( not ( = ?auto_169584 ?auto_169585 ) ) ( not ( = ?auto_169584 ?auto_169586 ) ) ( not ( = ?auto_169585 ?auto_169586 ) ) ( CLEAR ?auto_169583 ) ( ON ?auto_169584 ?auto_169585 ) ( CLEAR ?auto_169584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169582 ?auto_169583 ?auto_169584 )
      ( MAKE-4PILE ?auto_169582 ?auto_169583 ?auto_169584 ?auto_169585 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169591 - BLOCK
      ?auto_169592 - BLOCK
      ?auto_169593 - BLOCK
      ?auto_169594 - BLOCK
    )
    :vars
    (
      ?auto_169595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169594 ?auto_169595 ) ( ON-TABLE ?auto_169591 ) ( not ( = ?auto_169591 ?auto_169592 ) ) ( not ( = ?auto_169591 ?auto_169593 ) ) ( not ( = ?auto_169591 ?auto_169594 ) ) ( not ( = ?auto_169591 ?auto_169595 ) ) ( not ( = ?auto_169592 ?auto_169593 ) ) ( not ( = ?auto_169592 ?auto_169594 ) ) ( not ( = ?auto_169592 ?auto_169595 ) ) ( not ( = ?auto_169593 ?auto_169594 ) ) ( not ( = ?auto_169593 ?auto_169595 ) ) ( not ( = ?auto_169594 ?auto_169595 ) ) ( ON ?auto_169593 ?auto_169594 ) ( CLEAR ?auto_169591 ) ( ON ?auto_169592 ?auto_169593 ) ( CLEAR ?auto_169592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169591 ?auto_169592 )
      ( MAKE-4PILE ?auto_169591 ?auto_169592 ?auto_169593 ?auto_169594 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169600 - BLOCK
      ?auto_169601 - BLOCK
      ?auto_169602 - BLOCK
      ?auto_169603 - BLOCK
    )
    :vars
    (
      ?auto_169604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169603 ?auto_169604 ) ( ON-TABLE ?auto_169600 ) ( not ( = ?auto_169600 ?auto_169601 ) ) ( not ( = ?auto_169600 ?auto_169602 ) ) ( not ( = ?auto_169600 ?auto_169603 ) ) ( not ( = ?auto_169600 ?auto_169604 ) ) ( not ( = ?auto_169601 ?auto_169602 ) ) ( not ( = ?auto_169601 ?auto_169603 ) ) ( not ( = ?auto_169601 ?auto_169604 ) ) ( not ( = ?auto_169602 ?auto_169603 ) ) ( not ( = ?auto_169602 ?auto_169604 ) ) ( not ( = ?auto_169603 ?auto_169604 ) ) ( ON ?auto_169602 ?auto_169603 ) ( CLEAR ?auto_169600 ) ( ON ?auto_169601 ?auto_169602 ) ( CLEAR ?auto_169601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169600 ?auto_169601 )
      ( MAKE-4PILE ?auto_169600 ?auto_169601 ?auto_169602 ?auto_169603 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169609 - BLOCK
      ?auto_169610 - BLOCK
      ?auto_169611 - BLOCK
      ?auto_169612 - BLOCK
    )
    :vars
    (
      ?auto_169613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169612 ?auto_169613 ) ( not ( = ?auto_169609 ?auto_169610 ) ) ( not ( = ?auto_169609 ?auto_169611 ) ) ( not ( = ?auto_169609 ?auto_169612 ) ) ( not ( = ?auto_169609 ?auto_169613 ) ) ( not ( = ?auto_169610 ?auto_169611 ) ) ( not ( = ?auto_169610 ?auto_169612 ) ) ( not ( = ?auto_169610 ?auto_169613 ) ) ( not ( = ?auto_169611 ?auto_169612 ) ) ( not ( = ?auto_169611 ?auto_169613 ) ) ( not ( = ?auto_169612 ?auto_169613 ) ) ( ON ?auto_169611 ?auto_169612 ) ( ON ?auto_169610 ?auto_169611 ) ( ON ?auto_169609 ?auto_169610 ) ( CLEAR ?auto_169609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169609 )
      ( MAKE-4PILE ?auto_169609 ?auto_169610 ?auto_169611 ?auto_169612 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169618 - BLOCK
      ?auto_169619 - BLOCK
      ?auto_169620 - BLOCK
      ?auto_169621 - BLOCK
    )
    :vars
    (
      ?auto_169622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169621 ?auto_169622 ) ( not ( = ?auto_169618 ?auto_169619 ) ) ( not ( = ?auto_169618 ?auto_169620 ) ) ( not ( = ?auto_169618 ?auto_169621 ) ) ( not ( = ?auto_169618 ?auto_169622 ) ) ( not ( = ?auto_169619 ?auto_169620 ) ) ( not ( = ?auto_169619 ?auto_169621 ) ) ( not ( = ?auto_169619 ?auto_169622 ) ) ( not ( = ?auto_169620 ?auto_169621 ) ) ( not ( = ?auto_169620 ?auto_169622 ) ) ( not ( = ?auto_169621 ?auto_169622 ) ) ( ON ?auto_169620 ?auto_169621 ) ( ON ?auto_169619 ?auto_169620 ) ( ON ?auto_169618 ?auto_169619 ) ( CLEAR ?auto_169618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169618 )
      ( MAKE-4PILE ?auto_169618 ?auto_169619 ?auto_169620 ?auto_169621 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169628 - BLOCK
      ?auto_169629 - BLOCK
      ?auto_169630 - BLOCK
      ?auto_169631 - BLOCK
      ?auto_169632 - BLOCK
    )
    :vars
    (
      ?auto_169633 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169631 ) ( ON ?auto_169632 ?auto_169633 ) ( CLEAR ?auto_169632 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169628 ) ( ON ?auto_169629 ?auto_169628 ) ( ON ?auto_169630 ?auto_169629 ) ( ON ?auto_169631 ?auto_169630 ) ( not ( = ?auto_169628 ?auto_169629 ) ) ( not ( = ?auto_169628 ?auto_169630 ) ) ( not ( = ?auto_169628 ?auto_169631 ) ) ( not ( = ?auto_169628 ?auto_169632 ) ) ( not ( = ?auto_169628 ?auto_169633 ) ) ( not ( = ?auto_169629 ?auto_169630 ) ) ( not ( = ?auto_169629 ?auto_169631 ) ) ( not ( = ?auto_169629 ?auto_169632 ) ) ( not ( = ?auto_169629 ?auto_169633 ) ) ( not ( = ?auto_169630 ?auto_169631 ) ) ( not ( = ?auto_169630 ?auto_169632 ) ) ( not ( = ?auto_169630 ?auto_169633 ) ) ( not ( = ?auto_169631 ?auto_169632 ) ) ( not ( = ?auto_169631 ?auto_169633 ) ) ( not ( = ?auto_169632 ?auto_169633 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169632 ?auto_169633 )
      ( !STACK ?auto_169632 ?auto_169631 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169639 - BLOCK
      ?auto_169640 - BLOCK
      ?auto_169641 - BLOCK
      ?auto_169642 - BLOCK
      ?auto_169643 - BLOCK
    )
    :vars
    (
      ?auto_169644 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169642 ) ( ON ?auto_169643 ?auto_169644 ) ( CLEAR ?auto_169643 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169639 ) ( ON ?auto_169640 ?auto_169639 ) ( ON ?auto_169641 ?auto_169640 ) ( ON ?auto_169642 ?auto_169641 ) ( not ( = ?auto_169639 ?auto_169640 ) ) ( not ( = ?auto_169639 ?auto_169641 ) ) ( not ( = ?auto_169639 ?auto_169642 ) ) ( not ( = ?auto_169639 ?auto_169643 ) ) ( not ( = ?auto_169639 ?auto_169644 ) ) ( not ( = ?auto_169640 ?auto_169641 ) ) ( not ( = ?auto_169640 ?auto_169642 ) ) ( not ( = ?auto_169640 ?auto_169643 ) ) ( not ( = ?auto_169640 ?auto_169644 ) ) ( not ( = ?auto_169641 ?auto_169642 ) ) ( not ( = ?auto_169641 ?auto_169643 ) ) ( not ( = ?auto_169641 ?auto_169644 ) ) ( not ( = ?auto_169642 ?auto_169643 ) ) ( not ( = ?auto_169642 ?auto_169644 ) ) ( not ( = ?auto_169643 ?auto_169644 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169643 ?auto_169644 )
      ( !STACK ?auto_169643 ?auto_169642 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169650 - BLOCK
      ?auto_169651 - BLOCK
      ?auto_169652 - BLOCK
      ?auto_169653 - BLOCK
      ?auto_169654 - BLOCK
    )
    :vars
    (
      ?auto_169655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169654 ?auto_169655 ) ( ON-TABLE ?auto_169650 ) ( ON ?auto_169651 ?auto_169650 ) ( ON ?auto_169652 ?auto_169651 ) ( not ( = ?auto_169650 ?auto_169651 ) ) ( not ( = ?auto_169650 ?auto_169652 ) ) ( not ( = ?auto_169650 ?auto_169653 ) ) ( not ( = ?auto_169650 ?auto_169654 ) ) ( not ( = ?auto_169650 ?auto_169655 ) ) ( not ( = ?auto_169651 ?auto_169652 ) ) ( not ( = ?auto_169651 ?auto_169653 ) ) ( not ( = ?auto_169651 ?auto_169654 ) ) ( not ( = ?auto_169651 ?auto_169655 ) ) ( not ( = ?auto_169652 ?auto_169653 ) ) ( not ( = ?auto_169652 ?auto_169654 ) ) ( not ( = ?auto_169652 ?auto_169655 ) ) ( not ( = ?auto_169653 ?auto_169654 ) ) ( not ( = ?auto_169653 ?auto_169655 ) ) ( not ( = ?auto_169654 ?auto_169655 ) ) ( CLEAR ?auto_169652 ) ( ON ?auto_169653 ?auto_169654 ) ( CLEAR ?auto_169653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169650 ?auto_169651 ?auto_169652 ?auto_169653 )
      ( MAKE-5PILE ?auto_169650 ?auto_169651 ?auto_169652 ?auto_169653 ?auto_169654 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169661 - BLOCK
      ?auto_169662 - BLOCK
      ?auto_169663 - BLOCK
      ?auto_169664 - BLOCK
      ?auto_169665 - BLOCK
    )
    :vars
    (
      ?auto_169666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169665 ?auto_169666 ) ( ON-TABLE ?auto_169661 ) ( ON ?auto_169662 ?auto_169661 ) ( ON ?auto_169663 ?auto_169662 ) ( not ( = ?auto_169661 ?auto_169662 ) ) ( not ( = ?auto_169661 ?auto_169663 ) ) ( not ( = ?auto_169661 ?auto_169664 ) ) ( not ( = ?auto_169661 ?auto_169665 ) ) ( not ( = ?auto_169661 ?auto_169666 ) ) ( not ( = ?auto_169662 ?auto_169663 ) ) ( not ( = ?auto_169662 ?auto_169664 ) ) ( not ( = ?auto_169662 ?auto_169665 ) ) ( not ( = ?auto_169662 ?auto_169666 ) ) ( not ( = ?auto_169663 ?auto_169664 ) ) ( not ( = ?auto_169663 ?auto_169665 ) ) ( not ( = ?auto_169663 ?auto_169666 ) ) ( not ( = ?auto_169664 ?auto_169665 ) ) ( not ( = ?auto_169664 ?auto_169666 ) ) ( not ( = ?auto_169665 ?auto_169666 ) ) ( CLEAR ?auto_169663 ) ( ON ?auto_169664 ?auto_169665 ) ( CLEAR ?auto_169664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169661 ?auto_169662 ?auto_169663 ?auto_169664 )
      ( MAKE-5PILE ?auto_169661 ?auto_169662 ?auto_169663 ?auto_169664 ?auto_169665 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169672 - BLOCK
      ?auto_169673 - BLOCK
      ?auto_169674 - BLOCK
      ?auto_169675 - BLOCK
      ?auto_169676 - BLOCK
    )
    :vars
    (
      ?auto_169677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169676 ?auto_169677 ) ( ON-TABLE ?auto_169672 ) ( ON ?auto_169673 ?auto_169672 ) ( not ( = ?auto_169672 ?auto_169673 ) ) ( not ( = ?auto_169672 ?auto_169674 ) ) ( not ( = ?auto_169672 ?auto_169675 ) ) ( not ( = ?auto_169672 ?auto_169676 ) ) ( not ( = ?auto_169672 ?auto_169677 ) ) ( not ( = ?auto_169673 ?auto_169674 ) ) ( not ( = ?auto_169673 ?auto_169675 ) ) ( not ( = ?auto_169673 ?auto_169676 ) ) ( not ( = ?auto_169673 ?auto_169677 ) ) ( not ( = ?auto_169674 ?auto_169675 ) ) ( not ( = ?auto_169674 ?auto_169676 ) ) ( not ( = ?auto_169674 ?auto_169677 ) ) ( not ( = ?auto_169675 ?auto_169676 ) ) ( not ( = ?auto_169675 ?auto_169677 ) ) ( not ( = ?auto_169676 ?auto_169677 ) ) ( ON ?auto_169675 ?auto_169676 ) ( CLEAR ?auto_169673 ) ( ON ?auto_169674 ?auto_169675 ) ( CLEAR ?auto_169674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169672 ?auto_169673 ?auto_169674 )
      ( MAKE-5PILE ?auto_169672 ?auto_169673 ?auto_169674 ?auto_169675 ?auto_169676 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169683 - BLOCK
      ?auto_169684 - BLOCK
      ?auto_169685 - BLOCK
      ?auto_169686 - BLOCK
      ?auto_169687 - BLOCK
    )
    :vars
    (
      ?auto_169688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169687 ?auto_169688 ) ( ON-TABLE ?auto_169683 ) ( ON ?auto_169684 ?auto_169683 ) ( not ( = ?auto_169683 ?auto_169684 ) ) ( not ( = ?auto_169683 ?auto_169685 ) ) ( not ( = ?auto_169683 ?auto_169686 ) ) ( not ( = ?auto_169683 ?auto_169687 ) ) ( not ( = ?auto_169683 ?auto_169688 ) ) ( not ( = ?auto_169684 ?auto_169685 ) ) ( not ( = ?auto_169684 ?auto_169686 ) ) ( not ( = ?auto_169684 ?auto_169687 ) ) ( not ( = ?auto_169684 ?auto_169688 ) ) ( not ( = ?auto_169685 ?auto_169686 ) ) ( not ( = ?auto_169685 ?auto_169687 ) ) ( not ( = ?auto_169685 ?auto_169688 ) ) ( not ( = ?auto_169686 ?auto_169687 ) ) ( not ( = ?auto_169686 ?auto_169688 ) ) ( not ( = ?auto_169687 ?auto_169688 ) ) ( ON ?auto_169686 ?auto_169687 ) ( CLEAR ?auto_169684 ) ( ON ?auto_169685 ?auto_169686 ) ( CLEAR ?auto_169685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169683 ?auto_169684 ?auto_169685 )
      ( MAKE-5PILE ?auto_169683 ?auto_169684 ?auto_169685 ?auto_169686 ?auto_169687 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169694 - BLOCK
      ?auto_169695 - BLOCK
      ?auto_169696 - BLOCK
      ?auto_169697 - BLOCK
      ?auto_169698 - BLOCK
    )
    :vars
    (
      ?auto_169699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169698 ?auto_169699 ) ( ON-TABLE ?auto_169694 ) ( not ( = ?auto_169694 ?auto_169695 ) ) ( not ( = ?auto_169694 ?auto_169696 ) ) ( not ( = ?auto_169694 ?auto_169697 ) ) ( not ( = ?auto_169694 ?auto_169698 ) ) ( not ( = ?auto_169694 ?auto_169699 ) ) ( not ( = ?auto_169695 ?auto_169696 ) ) ( not ( = ?auto_169695 ?auto_169697 ) ) ( not ( = ?auto_169695 ?auto_169698 ) ) ( not ( = ?auto_169695 ?auto_169699 ) ) ( not ( = ?auto_169696 ?auto_169697 ) ) ( not ( = ?auto_169696 ?auto_169698 ) ) ( not ( = ?auto_169696 ?auto_169699 ) ) ( not ( = ?auto_169697 ?auto_169698 ) ) ( not ( = ?auto_169697 ?auto_169699 ) ) ( not ( = ?auto_169698 ?auto_169699 ) ) ( ON ?auto_169697 ?auto_169698 ) ( ON ?auto_169696 ?auto_169697 ) ( CLEAR ?auto_169694 ) ( ON ?auto_169695 ?auto_169696 ) ( CLEAR ?auto_169695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169694 ?auto_169695 )
      ( MAKE-5PILE ?auto_169694 ?auto_169695 ?auto_169696 ?auto_169697 ?auto_169698 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169705 - BLOCK
      ?auto_169706 - BLOCK
      ?auto_169707 - BLOCK
      ?auto_169708 - BLOCK
      ?auto_169709 - BLOCK
    )
    :vars
    (
      ?auto_169710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169709 ?auto_169710 ) ( ON-TABLE ?auto_169705 ) ( not ( = ?auto_169705 ?auto_169706 ) ) ( not ( = ?auto_169705 ?auto_169707 ) ) ( not ( = ?auto_169705 ?auto_169708 ) ) ( not ( = ?auto_169705 ?auto_169709 ) ) ( not ( = ?auto_169705 ?auto_169710 ) ) ( not ( = ?auto_169706 ?auto_169707 ) ) ( not ( = ?auto_169706 ?auto_169708 ) ) ( not ( = ?auto_169706 ?auto_169709 ) ) ( not ( = ?auto_169706 ?auto_169710 ) ) ( not ( = ?auto_169707 ?auto_169708 ) ) ( not ( = ?auto_169707 ?auto_169709 ) ) ( not ( = ?auto_169707 ?auto_169710 ) ) ( not ( = ?auto_169708 ?auto_169709 ) ) ( not ( = ?auto_169708 ?auto_169710 ) ) ( not ( = ?auto_169709 ?auto_169710 ) ) ( ON ?auto_169708 ?auto_169709 ) ( ON ?auto_169707 ?auto_169708 ) ( CLEAR ?auto_169705 ) ( ON ?auto_169706 ?auto_169707 ) ( CLEAR ?auto_169706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169705 ?auto_169706 )
      ( MAKE-5PILE ?auto_169705 ?auto_169706 ?auto_169707 ?auto_169708 ?auto_169709 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169716 - BLOCK
      ?auto_169717 - BLOCK
      ?auto_169718 - BLOCK
      ?auto_169719 - BLOCK
      ?auto_169720 - BLOCK
    )
    :vars
    (
      ?auto_169721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169720 ?auto_169721 ) ( not ( = ?auto_169716 ?auto_169717 ) ) ( not ( = ?auto_169716 ?auto_169718 ) ) ( not ( = ?auto_169716 ?auto_169719 ) ) ( not ( = ?auto_169716 ?auto_169720 ) ) ( not ( = ?auto_169716 ?auto_169721 ) ) ( not ( = ?auto_169717 ?auto_169718 ) ) ( not ( = ?auto_169717 ?auto_169719 ) ) ( not ( = ?auto_169717 ?auto_169720 ) ) ( not ( = ?auto_169717 ?auto_169721 ) ) ( not ( = ?auto_169718 ?auto_169719 ) ) ( not ( = ?auto_169718 ?auto_169720 ) ) ( not ( = ?auto_169718 ?auto_169721 ) ) ( not ( = ?auto_169719 ?auto_169720 ) ) ( not ( = ?auto_169719 ?auto_169721 ) ) ( not ( = ?auto_169720 ?auto_169721 ) ) ( ON ?auto_169719 ?auto_169720 ) ( ON ?auto_169718 ?auto_169719 ) ( ON ?auto_169717 ?auto_169718 ) ( ON ?auto_169716 ?auto_169717 ) ( CLEAR ?auto_169716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169716 )
      ( MAKE-5PILE ?auto_169716 ?auto_169717 ?auto_169718 ?auto_169719 ?auto_169720 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169727 - BLOCK
      ?auto_169728 - BLOCK
      ?auto_169729 - BLOCK
      ?auto_169730 - BLOCK
      ?auto_169731 - BLOCK
    )
    :vars
    (
      ?auto_169732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169731 ?auto_169732 ) ( not ( = ?auto_169727 ?auto_169728 ) ) ( not ( = ?auto_169727 ?auto_169729 ) ) ( not ( = ?auto_169727 ?auto_169730 ) ) ( not ( = ?auto_169727 ?auto_169731 ) ) ( not ( = ?auto_169727 ?auto_169732 ) ) ( not ( = ?auto_169728 ?auto_169729 ) ) ( not ( = ?auto_169728 ?auto_169730 ) ) ( not ( = ?auto_169728 ?auto_169731 ) ) ( not ( = ?auto_169728 ?auto_169732 ) ) ( not ( = ?auto_169729 ?auto_169730 ) ) ( not ( = ?auto_169729 ?auto_169731 ) ) ( not ( = ?auto_169729 ?auto_169732 ) ) ( not ( = ?auto_169730 ?auto_169731 ) ) ( not ( = ?auto_169730 ?auto_169732 ) ) ( not ( = ?auto_169731 ?auto_169732 ) ) ( ON ?auto_169730 ?auto_169731 ) ( ON ?auto_169729 ?auto_169730 ) ( ON ?auto_169728 ?auto_169729 ) ( ON ?auto_169727 ?auto_169728 ) ( CLEAR ?auto_169727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169727 )
      ( MAKE-5PILE ?auto_169727 ?auto_169728 ?auto_169729 ?auto_169730 ?auto_169731 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169739 - BLOCK
      ?auto_169740 - BLOCK
      ?auto_169741 - BLOCK
      ?auto_169742 - BLOCK
      ?auto_169743 - BLOCK
      ?auto_169744 - BLOCK
    )
    :vars
    (
      ?auto_169745 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169743 ) ( ON ?auto_169744 ?auto_169745 ) ( CLEAR ?auto_169744 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169739 ) ( ON ?auto_169740 ?auto_169739 ) ( ON ?auto_169741 ?auto_169740 ) ( ON ?auto_169742 ?auto_169741 ) ( ON ?auto_169743 ?auto_169742 ) ( not ( = ?auto_169739 ?auto_169740 ) ) ( not ( = ?auto_169739 ?auto_169741 ) ) ( not ( = ?auto_169739 ?auto_169742 ) ) ( not ( = ?auto_169739 ?auto_169743 ) ) ( not ( = ?auto_169739 ?auto_169744 ) ) ( not ( = ?auto_169739 ?auto_169745 ) ) ( not ( = ?auto_169740 ?auto_169741 ) ) ( not ( = ?auto_169740 ?auto_169742 ) ) ( not ( = ?auto_169740 ?auto_169743 ) ) ( not ( = ?auto_169740 ?auto_169744 ) ) ( not ( = ?auto_169740 ?auto_169745 ) ) ( not ( = ?auto_169741 ?auto_169742 ) ) ( not ( = ?auto_169741 ?auto_169743 ) ) ( not ( = ?auto_169741 ?auto_169744 ) ) ( not ( = ?auto_169741 ?auto_169745 ) ) ( not ( = ?auto_169742 ?auto_169743 ) ) ( not ( = ?auto_169742 ?auto_169744 ) ) ( not ( = ?auto_169742 ?auto_169745 ) ) ( not ( = ?auto_169743 ?auto_169744 ) ) ( not ( = ?auto_169743 ?auto_169745 ) ) ( not ( = ?auto_169744 ?auto_169745 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169744 ?auto_169745 )
      ( !STACK ?auto_169744 ?auto_169743 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169752 - BLOCK
      ?auto_169753 - BLOCK
      ?auto_169754 - BLOCK
      ?auto_169755 - BLOCK
      ?auto_169756 - BLOCK
      ?auto_169757 - BLOCK
    )
    :vars
    (
      ?auto_169758 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169756 ) ( ON ?auto_169757 ?auto_169758 ) ( CLEAR ?auto_169757 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169752 ) ( ON ?auto_169753 ?auto_169752 ) ( ON ?auto_169754 ?auto_169753 ) ( ON ?auto_169755 ?auto_169754 ) ( ON ?auto_169756 ?auto_169755 ) ( not ( = ?auto_169752 ?auto_169753 ) ) ( not ( = ?auto_169752 ?auto_169754 ) ) ( not ( = ?auto_169752 ?auto_169755 ) ) ( not ( = ?auto_169752 ?auto_169756 ) ) ( not ( = ?auto_169752 ?auto_169757 ) ) ( not ( = ?auto_169752 ?auto_169758 ) ) ( not ( = ?auto_169753 ?auto_169754 ) ) ( not ( = ?auto_169753 ?auto_169755 ) ) ( not ( = ?auto_169753 ?auto_169756 ) ) ( not ( = ?auto_169753 ?auto_169757 ) ) ( not ( = ?auto_169753 ?auto_169758 ) ) ( not ( = ?auto_169754 ?auto_169755 ) ) ( not ( = ?auto_169754 ?auto_169756 ) ) ( not ( = ?auto_169754 ?auto_169757 ) ) ( not ( = ?auto_169754 ?auto_169758 ) ) ( not ( = ?auto_169755 ?auto_169756 ) ) ( not ( = ?auto_169755 ?auto_169757 ) ) ( not ( = ?auto_169755 ?auto_169758 ) ) ( not ( = ?auto_169756 ?auto_169757 ) ) ( not ( = ?auto_169756 ?auto_169758 ) ) ( not ( = ?auto_169757 ?auto_169758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169757 ?auto_169758 )
      ( !STACK ?auto_169757 ?auto_169756 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169765 - BLOCK
      ?auto_169766 - BLOCK
      ?auto_169767 - BLOCK
      ?auto_169768 - BLOCK
      ?auto_169769 - BLOCK
      ?auto_169770 - BLOCK
    )
    :vars
    (
      ?auto_169771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169770 ?auto_169771 ) ( ON-TABLE ?auto_169765 ) ( ON ?auto_169766 ?auto_169765 ) ( ON ?auto_169767 ?auto_169766 ) ( ON ?auto_169768 ?auto_169767 ) ( not ( = ?auto_169765 ?auto_169766 ) ) ( not ( = ?auto_169765 ?auto_169767 ) ) ( not ( = ?auto_169765 ?auto_169768 ) ) ( not ( = ?auto_169765 ?auto_169769 ) ) ( not ( = ?auto_169765 ?auto_169770 ) ) ( not ( = ?auto_169765 ?auto_169771 ) ) ( not ( = ?auto_169766 ?auto_169767 ) ) ( not ( = ?auto_169766 ?auto_169768 ) ) ( not ( = ?auto_169766 ?auto_169769 ) ) ( not ( = ?auto_169766 ?auto_169770 ) ) ( not ( = ?auto_169766 ?auto_169771 ) ) ( not ( = ?auto_169767 ?auto_169768 ) ) ( not ( = ?auto_169767 ?auto_169769 ) ) ( not ( = ?auto_169767 ?auto_169770 ) ) ( not ( = ?auto_169767 ?auto_169771 ) ) ( not ( = ?auto_169768 ?auto_169769 ) ) ( not ( = ?auto_169768 ?auto_169770 ) ) ( not ( = ?auto_169768 ?auto_169771 ) ) ( not ( = ?auto_169769 ?auto_169770 ) ) ( not ( = ?auto_169769 ?auto_169771 ) ) ( not ( = ?auto_169770 ?auto_169771 ) ) ( CLEAR ?auto_169768 ) ( ON ?auto_169769 ?auto_169770 ) ( CLEAR ?auto_169769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169765 ?auto_169766 ?auto_169767 ?auto_169768 ?auto_169769 )
      ( MAKE-6PILE ?auto_169765 ?auto_169766 ?auto_169767 ?auto_169768 ?auto_169769 ?auto_169770 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169778 - BLOCK
      ?auto_169779 - BLOCK
      ?auto_169780 - BLOCK
      ?auto_169781 - BLOCK
      ?auto_169782 - BLOCK
      ?auto_169783 - BLOCK
    )
    :vars
    (
      ?auto_169784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169783 ?auto_169784 ) ( ON-TABLE ?auto_169778 ) ( ON ?auto_169779 ?auto_169778 ) ( ON ?auto_169780 ?auto_169779 ) ( ON ?auto_169781 ?auto_169780 ) ( not ( = ?auto_169778 ?auto_169779 ) ) ( not ( = ?auto_169778 ?auto_169780 ) ) ( not ( = ?auto_169778 ?auto_169781 ) ) ( not ( = ?auto_169778 ?auto_169782 ) ) ( not ( = ?auto_169778 ?auto_169783 ) ) ( not ( = ?auto_169778 ?auto_169784 ) ) ( not ( = ?auto_169779 ?auto_169780 ) ) ( not ( = ?auto_169779 ?auto_169781 ) ) ( not ( = ?auto_169779 ?auto_169782 ) ) ( not ( = ?auto_169779 ?auto_169783 ) ) ( not ( = ?auto_169779 ?auto_169784 ) ) ( not ( = ?auto_169780 ?auto_169781 ) ) ( not ( = ?auto_169780 ?auto_169782 ) ) ( not ( = ?auto_169780 ?auto_169783 ) ) ( not ( = ?auto_169780 ?auto_169784 ) ) ( not ( = ?auto_169781 ?auto_169782 ) ) ( not ( = ?auto_169781 ?auto_169783 ) ) ( not ( = ?auto_169781 ?auto_169784 ) ) ( not ( = ?auto_169782 ?auto_169783 ) ) ( not ( = ?auto_169782 ?auto_169784 ) ) ( not ( = ?auto_169783 ?auto_169784 ) ) ( CLEAR ?auto_169781 ) ( ON ?auto_169782 ?auto_169783 ) ( CLEAR ?auto_169782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169778 ?auto_169779 ?auto_169780 ?auto_169781 ?auto_169782 )
      ( MAKE-6PILE ?auto_169778 ?auto_169779 ?auto_169780 ?auto_169781 ?auto_169782 ?auto_169783 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169791 - BLOCK
      ?auto_169792 - BLOCK
      ?auto_169793 - BLOCK
      ?auto_169794 - BLOCK
      ?auto_169795 - BLOCK
      ?auto_169796 - BLOCK
    )
    :vars
    (
      ?auto_169797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169796 ?auto_169797 ) ( ON-TABLE ?auto_169791 ) ( ON ?auto_169792 ?auto_169791 ) ( ON ?auto_169793 ?auto_169792 ) ( not ( = ?auto_169791 ?auto_169792 ) ) ( not ( = ?auto_169791 ?auto_169793 ) ) ( not ( = ?auto_169791 ?auto_169794 ) ) ( not ( = ?auto_169791 ?auto_169795 ) ) ( not ( = ?auto_169791 ?auto_169796 ) ) ( not ( = ?auto_169791 ?auto_169797 ) ) ( not ( = ?auto_169792 ?auto_169793 ) ) ( not ( = ?auto_169792 ?auto_169794 ) ) ( not ( = ?auto_169792 ?auto_169795 ) ) ( not ( = ?auto_169792 ?auto_169796 ) ) ( not ( = ?auto_169792 ?auto_169797 ) ) ( not ( = ?auto_169793 ?auto_169794 ) ) ( not ( = ?auto_169793 ?auto_169795 ) ) ( not ( = ?auto_169793 ?auto_169796 ) ) ( not ( = ?auto_169793 ?auto_169797 ) ) ( not ( = ?auto_169794 ?auto_169795 ) ) ( not ( = ?auto_169794 ?auto_169796 ) ) ( not ( = ?auto_169794 ?auto_169797 ) ) ( not ( = ?auto_169795 ?auto_169796 ) ) ( not ( = ?auto_169795 ?auto_169797 ) ) ( not ( = ?auto_169796 ?auto_169797 ) ) ( ON ?auto_169795 ?auto_169796 ) ( CLEAR ?auto_169793 ) ( ON ?auto_169794 ?auto_169795 ) ( CLEAR ?auto_169794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169791 ?auto_169792 ?auto_169793 ?auto_169794 )
      ( MAKE-6PILE ?auto_169791 ?auto_169792 ?auto_169793 ?auto_169794 ?auto_169795 ?auto_169796 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169804 - BLOCK
      ?auto_169805 - BLOCK
      ?auto_169806 - BLOCK
      ?auto_169807 - BLOCK
      ?auto_169808 - BLOCK
      ?auto_169809 - BLOCK
    )
    :vars
    (
      ?auto_169810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169809 ?auto_169810 ) ( ON-TABLE ?auto_169804 ) ( ON ?auto_169805 ?auto_169804 ) ( ON ?auto_169806 ?auto_169805 ) ( not ( = ?auto_169804 ?auto_169805 ) ) ( not ( = ?auto_169804 ?auto_169806 ) ) ( not ( = ?auto_169804 ?auto_169807 ) ) ( not ( = ?auto_169804 ?auto_169808 ) ) ( not ( = ?auto_169804 ?auto_169809 ) ) ( not ( = ?auto_169804 ?auto_169810 ) ) ( not ( = ?auto_169805 ?auto_169806 ) ) ( not ( = ?auto_169805 ?auto_169807 ) ) ( not ( = ?auto_169805 ?auto_169808 ) ) ( not ( = ?auto_169805 ?auto_169809 ) ) ( not ( = ?auto_169805 ?auto_169810 ) ) ( not ( = ?auto_169806 ?auto_169807 ) ) ( not ( = ?auto_169806 ?auto_169808 ) ) ( not ( = ?auto_169806 ?auto_169809 ) ) ( not ( = ?auto_169806 ?auto_169810 ) ) ( not ( = ?auto_169807 ?auto_169808 ) ) ( not ( = ?auto_169807 ?auto_169809 ) ) ( not ( = ?auto_169807 ?auto_169810 ) ) ( not ( = ?auto_169808 ?auto_169809 ) ) ( not ( = ?auto_169808 ?auto_169810 ) ) ( not ( = ?auto_169809 ?auto_169810 ) ) ( ON ?auto_169808 ?auto_169809 ) ( CLEAR ?auto_169806 ) ( ON ?auto_169807 ?auto_169808 ) ( CLEAR ?auto_169807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169804 ?auto_169805 ?auto_169806 ?auto_169807 )
      ( MAKE-6PILE ?auto_169804 ?auto_169805 ?auto_169806 ?auto_169807 ?auto_169808 ?auto_169809 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169817 - BLOCK
      ?auto_169818 - BLOCK
      ?auto_169819 - BLOCK
      ?auto_169820 - BLOCK
      ?auto_169821 - BLOCK
      ?auto_169822 - BLOCK
    )
    :vars
    (
      ?auto_169823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169822 ?auto_169823 ) ( ON-TABLE ?auto_169817 ) ( ON ?auto_169818 ?auto_169817 ) ( not ( = ?auto_169817 ?auto_169818 ) ) ( not ( = ?auto_169817 ?auto_169819 ) ) ( not ( = ?auto_169817 ?auto_169820 ) ) ( not ( = ?auto_169817 ?auto_169821 ) ) ( not ( = ?auto_169817 ?auto_169822 ) ) ( not ( = ?auto_169817 ?auto_169823 ) ) ( not ( = ?auto_169818 ?auto_169819 ) ) ( not ( = ?auto_169818 ?auto_169820 ) ) ( not ( = ?auto_169818 ?auto_169821 ) ) ( not ( = ?auto_169818 ?auto_169822 ) ) ( not ( = ?auto_169818 ?auto_169823 ) ) ( not ( = ?auto_169819 ?auto_169820 ) ) ( not ( = ?auto_169819 ?auto_169821 ) ) ( not ( = ?auto_169819 ?auto_169822 ) ) ( not ( = ?auto_169819 ?auto_169823 ) ) ( not ( = ?auto_169820 ?auto_169821 ) ) ( not ( = ?auto_169820 ?auto_169822 ) ) ( not ( = ?auto_169820 ?auto_169823 ) ) ( not ( = ?auto_169821 ?auto_169822 ) ) ( not ( = ?auto_169821 ?auto_169823 ) ) ( not ( = ?auto_169822 ?auto_169823 ) ) ( ON ?auto_169821 ?auto_169822 ) ( ON ?auto_169820 ?auto_169821 ) ( CLEAR ?auto_169818 ) ( ON ?auto_169819 ?auto_169820 ) ( CLEAR ?auto_169819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169817 ?auto_169818 ?auto_169819 )
      ( MAKE-6PILE ?auto_169817 ?auto_169818 ?auto_169819 ?auto_169820 ?auto_169821 ?auto_169822 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169830 - BLOCK
      ?auto_169831 - BLOCK
      ?auto_169832 - BLOCK
      ?auto_169833 - BLOCK
      ?auto_169834 - BLOCK
      ?auto_169835 - BLOCK
    )
    :vars
    (
      ?auto_169836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169835 ?auto_169836 ) ( ON-TABLE ?auto_169830 ) ( ON ?auto_169831 ?auto_169830 ) ( not ( = ?auto_169830 ?auto_169831 ) ) ( not ( = ?auto_169830 ?auto_169832 ) ) ( not ( = ?auto_169830 ?auto_169833 ) ) ( not ( = ?auto_169830 ?auto_169834 ) ) ( not ( = ?auto_169830 ?auto_169835 ) ) ( not ( = ?auto_169830 ?auto_169836 ) ) ( not ( = ?auto_169831 ?auto_169832 ) ) ( not ( = ?auto_169831 ?auto_169833 ) ) ( not ( = ?auto_169831 ?auto_169834 ) ) ( not ( = ?auto_169831 ?auto_169835 ) ) ( not ( = ?auto_169831 ?auto_169836 ) ) ( not ( = ?auto_169832 ?auto_169833 ) ) ( not ( = ?auto_169832 ?auto_169834 ) ) ( not ( = ?auto_169832 ?auto_169835 ) ) ( not ( = ?auto_169832 ?auto_169836 ) ) ( not ( = ?auto_169833 ?auto_169834 ) ) ( not ( = ?auto_169833 ?auto_169835 ) ) ( not ( = ?auto_169833 ?auto_169836 ) ) ( not ( = ?auto_169834 ?auto_169835 ) ) ( not ( = ?auto_169834 ?auto_169836 ) ) ( not ( = ?auto_169835 ?auto_169836 ) ) ( ON ?auto_169834 ?auto_169835 ) ( ON ?auto_169833 ?auto_169834 ) ( CLEAR ?auto_169831 ) ( ON ?auto_169832 ?auto_169833 ) ( CLEAR ?auto_169832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169830 ?auto_169831 ?auto_169832 )
      ( MAKE-6PILE ?auto_169830 ?auto_169831 ?auto_169832 ?auto_169833 ?auto_169834 ?auto_169835 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169843 - BLOCK
      ?auto_169844 - BLOCK
      ?auto_169845 - BLOCK
      ?auto_169846 - BLOCK
      ?auto_169847 - BLOCK
      ?auto_169848 - BLOCK
    )
    :vars
    (
      ?auto_169849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169848 ?auto_169849 ) ( ON-TABLE ?auto_169843 ) ( not ( = ?auto_169843 ?auto_169844 ) ) ( not ( = ?auto_169843 ?auto_169845 ) ) ( not ( = ?auto_169843 ?auto_169846 ) ) ( not ( = ?auto_169843 ?auto_169847 ) ) ( not ( = ?auto_169843 ?auto_169848 ) ) ( not ( = ?auto_169843 ?auto_169849 ) ) ( not ( = ?auto_169844 ?auto_169845 ) ) ( not ( = ?auto_169844 ?auto_169846 ) ) ( not ( = ?auto_169844 ?auto_169847 ) ) ( not ( = ?auto_169844 ?auto_169848 ) ) ( not ( = ?auto_169844 ?auto_169849 ) ) ( not ( = ?auto_169845 ?auto_169846 ) ) ( not ( = ?auto_169845 ?auto_169847 ) ) ( not ( = ?auto_169845 ?auto_169848 ) ) ( not ( = ?auto_169845 ?auto_169849 ) ) ( not ( = ?auto_169846 ?auto_169847 ) ) ( not ( = ?auto_169846 ?auto_169848 ) ) ( not ( = ?auto_169846 ?auto_169849 ) ) ( not ( = ?auto_169847 ?auto_169848 ) ) ( not ( = ?auto_169847 ?auto_169849 ) ) ( not ( = ?auto_169848 ?auto_169849 ) ) ( ON ?auto_169847 ?auto_169848 ) ( ON ?auto_169846 ?auto_169847 ) ( ON ?auto_169845 ?auto_169846 ) ( CLEAR ?auto_169843 ) ( ON ?auto_169844 ?auto_169845 ) ( CLEAR ?auto_169844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169843 ?auto_169844 )
      ( MAKE-6PILE ?auto_169843 ?auto_169844 ?auto_169845 ?auto_169846 ?auto_169847 ?auto_169848 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169856 - BLOCK
      ?auto_169857 - BLOCK
      ?auto_169858 - BLOCK
      ?auto_169859 - BLOCK
      ?auto_169860 - BLOCK
      ?auto_169861 - BLOCK
    )
    :vars
    (
      ?auto_169862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169861 ?auto_169862 ) ( ON-TABLE ?auto_169856 ) ( not ( = ?auto_169856 ?auto_169857 ) ) ( not ( = ?auto_169856 ?auto_169858 ) ) ( not ( = ?auto_169856 ?auto_169859 ) ) ( not ( = ?auto_169856 ?auto_169860 ) ) ( not ( = ?auto_169856 ?auto_169861 ) ) ( not ( = ?auto_169856 ?auto_169862 ) ) ( not ( = ?auto_169857 ?auto_169858 ) ) ( not ( = ?auto_169857 ?auto_169859 ) ) ( not ( = ?auto_169857 ?auto_169860 ) ) ( not ( = ?auto_169857 ?auto_169861 ) ) ( not ( = ?auto_169857 ?auto_169862 ) ) ( not ( = ?auto_169858 ?auto_169859 ) ) ( not ( = ?auto_169858 ?auto_169860 ) ) ( not ( = ?auto_169858 ?auto_169861 ) ) ( not ( = ?auto_169858 ?auto_169862 ) ) ( not ( = ?auto_169859 ?auto_169860 ) ) ( not ( = ?auto_169859 ?auto_169861 ) ) ( not ( = ?auto_169859 ?auto_169862 ) ) ( not ( = ?auto_169860 ?auto_169861 ) ) ( not ( = ?auto_169860 ?auto_169862 ) ) ( not ( = ?auto_169861 ?auto_169862 ) ) ( ON ?auto_169860 ?auto_169861 ) ( ON ?auto_169859 ?auto_169860 ) ( ON ?auto_169858 ?auto_169859 ) ( CLEAR ?auto_169856 ) ( ON ?auto_169857 ?auto_169858 ) ( CLEAR ?auto_169857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169856 ?auto_169857 )
      ( MAKE-6PILE ?auto_169856 ?auto_169857 ?auto_169858 ?auto_169859 ?auto_169860 ?auto_169861 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169869 - BLOCK
      ?auto_169870 - BLOCK
      ?auto_169871 - BLOCK
      ?auto_169872 - BLOCK
      ?auto_169873 - BLOCK
      ?auto_169874 - BLOCK
    )
    :vars
    (
      ?auto_169875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169874 ?auto_169875 ) ( not ( = ?auto_169869 ?auto_169870 ) ) ( not ( = ?auto_169869 ?auto_169871 ) ) ( not ( = ?auto_169869 ?auto_169872 ) ) ( not ( = ?auto_169869 ?auto_169873 ) ) ( not ( = ?auto_169869 ?auto_169874 ) ) ( not ( = ?auto_169869 ?auto_169875 ) ) ( not ( = ?auto_169870 ?auto_169871 ) ) ( not ( = ?auto_169870 ?auto_169872 ) ) ( not ( = ?auto_169870 ?auto_169873 ) ) ( not ( = ?auto_169870 ?auto_169874 ) ) ( not ( = ?auto_169870 ?auto_169875 ) ) ( not ( = ?auto_169871 ?auto_169872 ) ) ( not ( = ?auto_169871 ?auto_169873 ) ) ( not ( = ?auto_169871 ?auto_169874 ) ) ( not ( = ?auto_169871 ?auto_169875 ) ) ( not ( = ?auto_169872 ?auto_169873 ) ) ( not ( = ?auto_169872 ?auto_169874 ) ) ( not ( = ?auto_169872 ?auto_169875 ) ) ( not ( = ?auto_169873 ?auto_169874 ) ) ( not ( = ?auto_169873 ?auto_169875 ) ) ( not ( = ?auto_169874 ?auto_169875 ) ) ( ON ?auto_169873 ?auto_169874 ) ( ON ?auto_169872 ?auto_169873 ) ( ON ?auto_169871 ?auto_169872 ) ( ON ?auto_169870 ?auto_169871 ) ( ON ?auto_169869 ?auto_169870 ) ( CLEAR ?auto_169869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169869 )
      ( MAKE-6PILE ?auto_169869 ?auto_169870 ?auto_169871 ?auto_169872 ?auto_169873 ?auto_169874 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169882 - BLOCK
      ?auto_169883 - BLOCK
      ?auto_169884 - BLOCK
      ?auto_169885 - BLOCK
      ?auto_169886 - BLOCK
      ?auto_169887 - BLOCK
    )
    :vars
    (
      ?auto_169888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169887 ?auto_169888 ) ( not ( = ?auto_169882 ?auto_169883 ) ) ( not ( = ?auto_169882 ?auto_169884 ) ) ( not ( = ?auto_169882 ?auto_169885 ) ) ( not ( = ?auto_169882 ?auto_169886 ) ) ( not ( = ?auto_169882 ?auto_169887 ) ) ( not ( = ?auto_169882 ?auto_169888 ) ) ( not ( = ?auto_169883 ?auto_169884 ) ) ( not ( = ?auto_169883 ?auto_169885 ) ) ( not ( = ?auto_169883 ?auto_169886 ) ) ( not ( = ?auto_169883 ?auto_169887 ) ) ( not ( = ?auto_169883 ?auto_169888 ) ) ( not ( = ?auto_169884 ?auto_169885 ) ) ( not ( = ?auto_169884 ?auto_169886 ) ) ( not ( = ?auto_169884 ?auto_169887 ) ) ( not ( = ?auto_169884 ?auto_169888 ) ) ( not ( = ?auto_169885 ?auto_169886 ) ) ( not ( = ?auto_169885 ?auto_169887 ) ) ( not ( = ?auto_169885 ?auto_169888 ) ) ( not ( = ?auto_169886 ?auto_169887 ) ) ( not ( = ?auto_169886 ?auto_169888 ) ) ( not ( = ?auto_169887 ?auto_169888 ) ) ( ON ?auto_169886 ?auto_169887 ) ( ON ?auto_169885 ?auto_169886 ) ( ON ?auto_169884 ?auto_169885 ) ( ON ?auto_169883 ?auto_169884 ) ( ON ?auto_169882 ?auto_169883 ) ( CLEAR ?auto_169882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169882 )
      ( MAKE-6PILE ?auto_169882 ?auto_169883 ?auto_169884 ?auto_169885 ?auto_169886 ?auto_169887 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169896 - BLOCK
      ?auto_169897 - BLOCK
      ?auto_169898 - BLOCK
      ?auto_169899 - BLOCK
      ?auto_169900 - BLOCK
      ?auto_169901 - BLOCK
      ?auto_169902 - BLOCK
    )
    :vars
    (
      ?auto_169903 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169901 ) ( ON ?auto_169902 ?auto_169903 ) ( CLEAR ?auto_169902 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169896 ) ( ON ?auto_169897 ?auto_169896 ) ( ON ?auto_169898 ?auto_169897 ) ( ON ?auto_169899 ?auto_169898 ) ( ON ?auto_169900 ?auto_169899 ) ( ON ?auto_169901 ?auto_169900 ) ( not ( = ?auto_169896 ?auto_169897 ) ) ( not ( = ?auto_169896 ?auto_169898 ) ) ( not ( = ?auto_169896 ?auto_169899 ) ) ( not ( = ?auto_169896 ?auto_169900 ) ) ( not ( = ?auto_169896 ?auto_169901 ) ) ( not ( = ?auto_169896 ?auto_169902 ) ) ( not ( = ?auto_169896 ?auto_169903 ) ) ( not ( = ?auto_169897 ?auto_169898 ) ) ( not ( = ?auto_169897 ?auto_169899 ) ) ( not ( = ?auto_169897 ?auto_169900 ) ) ( not ( = ?auto_169897 ?auto_169901 ) ) ( not ( = ?auto_169897 ?auto_169902 ) ) ( not ( = ?auto_169897 ?auto_169903 ) ) ( not ( = ?auto_169898 ?auto_169899 ) ) ( not ( = ?auto_169898 ?auto_169900 ) ) ( not ( = ?auto_169898 ?auto_169901 ) ) ( not ( = ?auto_169898 ?auto_169902 ) ) ( not ( = ?auto_169898 ?auto_169903 ) ) ( not ( = ?auto_169899 ?auto_169900 ) ) ( not ( = ?auto_169899 ?auto_169901 ) ) ( not ( = ?auto_169899 ?auto_169902 ) ) ( not ( = ?auto_169899 ?auto_169903 ) ) ( not ( = ?auto_169900 ?auto_169901 ) ) ( not ( = ?auto_169900 ?auto_169902 ) ) ( not ( = ?auto_169900 ?auto_169903 ) ) ( not ( = ?auto_169901 ?auto_169902 ) ) ( not ( = ?auto_169901 ?auto_169903 ) ) ( not ( = ?auto_169902 ?auto_169903 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169902 ?auto_169903 )
      ( !STACK ?auto_169902 ?auto_169901 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169911 - BLOCK
      ?auto_169912 - BLOCK
      ?auto_169913 - BLOCK
      ?auto_169914 - BLOCK
      ?auto_169915 - BLOCK
      ?auto_169916 - BLOCK
      ?auto_169917 - BLOCK
    )
    :vars
    (
      ?auto_169918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169916 ) ( ON ?auto_169917 ?auto_169918 ) ( CLEAR ?auto_169917 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169911 ) ( ON ?auto_169912 ?auto_169911 ) ( ON ?auto_169913 ?auto_169912 ) ( ON ?auto_169914 ?auto_169913 ) ( ON ?auto_169915 ?auto_169914 ) ( ON ?auto_169916 ?auto_169915 ) ( not ( = ?auto_169911 ?auto_169912 ) ) ( not ( = ?auto_169911 ?auto_169913 ) ) ( not ( = ?auto_169911 ?auto_169914 ) ) ( not ( = ?auto_169911 ?auto_169915 ) ) ( not ( = ?auto_169911 ?auto_169916 ) ) ( not ( = ?auto_169911 ?auto_169917 ) ) ( not ( = ?auto_169911 ?auto_169918 ) ) ( not ( = ?auto_169912 ?auto_169913 ) ) ( not ( = ?auto_169912 ?auto_169914 ) ) ( not ( = ?auto_169912 ?auto_169915 ) ) ( not ( = ?auto_169912 ?auto_169916 ) ) ( not ( = ?auto_169912 ?auto_169917 ) ) ( not ( = ?auto_169912 ?auto_169918 ) ) ( not ( = ?auto_169913 ?auto_169914 ) ) ( not ( = ?auto_169913 ?auto_169915 ) ) ( not ( = ?auto_169913 ?auto_169916 ) ) ( not ( = ?auto_169913 ?auto_169917 ) ) ( not ( = ?auto_169913 ?auto_169918 ) ) ( not ( = ?auto_169914 ?auto_169915 ) ) ( not ( = ?auto_169914 ?auto_169916 ) ) ( not ( = ?auto_169914 ?auto_169917 ) ) ( not ( = ?auto_169914 ?auto_169918 ) ) ( not ( = ?auto_169915 ?auto_169916 ) ) ( not ( = ?auto_169915 ?auto_169917 ) ) ( not ( = ?auto_169915 ?auto_169918 ) ) ( not ( = ?auto_169916 ?auto_169917 ) ) ( not ( = ?auto_169916 ?auto_169918 ) ) ( not ( = ?auto_169917 ?auto_169918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169917 ?auto_169918 )
      ( !STACK ?auto_169917 ?auto_169916 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169926 - BLOCK
      ?auto_169927 - BLOCK
      ?auto_169928 - BLOCK
      ?auto_169929 - BLOCK
      ?auto_169930 - BLOCK
      ?auto_169931 - BLOCK
      ?auto_169932 - BLOCK
    )
    :vars
    (
      ?auto_169933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169932 ?auto_169933 ) ( ON-TABLE ?auto_169926 ) ( ON ?auto_169927 ?auto_169926 ) ( ON ?auto_169928 ?auto_169927 ) ( ON ?auto_169929 ?auto_169928 ) ( ON ?auto_169930 ?auto_169929 ) ( not ( = ?auto_169926 ?auto_169927 ) ) ( not ( = ?auto_169926 ?auto_169928 ) ) ( not ( = ?auto_169926 ?auto_169929 ) ) ( not ( = ?auto_169926 ?auto_169930 ) ) ( not ( = ?auto_169926 ?auto_169931 ) ) ( not ( = ?auto_169926 ?auto_169932 ) ) ( not ( = ?auto_169926 ?auto_169933 ) ) ( not ( = ?auto_169927 ?auto_169928 ) ) ( not ( = ?auto_169927 ?auto_169929 ) ) ( not ( = ?auto_169927 ?auto_169930 ) ) ( not ( = ?auto_169927 ?auto_169931 ) ) ( not ( = ?auto_169927 ?auto_169932 ) ) ( not ( = ?auto_169927 ?auto_169933 ) ) ( not ( = ?auto_169928 ?auto_169929 ) ) ( not ( = ?auto_169928 ?auto_169930 ) ) ( not ( = ?auto_169928 ?auto_169931 ) ) ( not ( = ?auto_169928 ?auto_169932 ) ) ( not ( = ?auto_169928 ?auto_169933 ) ) ( not ( = ?auto_169929 ?auto_169930 ) ) ( not ( = ?auto_169929 ?auto_169931 ) ) ( not ( = ?auto_169929 ?auto_169932 ) ) ( not ( = ?auto_169929 ?auto_169933 ) ) ( not ( = ?auto_169930 ?auto_169931 ) ) ( not ( = ?auto_169930 ?auto_169932 ) ) ( not ( = ?auto_169930 ?auto_169933 ) ) ( not ( = ?auto_169931 ?auto_169932 ) ) ( not ( = ?auto_169931 ?auto_169933 ) ) ( not ( = ?auto_169932 ?auto_169933 ) ) ( CLEAR ?auto_169930 ) ( ON ?auto_169931 ?auto_169932 ) ( CLEAR ?auto_169931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169926 ?auto_169927 ?auto_169928 ?auto_169929 ?auto_169930 ?auto_169931 )
      ( MAKE-7PILE ?auto_169926 ?auto_169927 ?auto_169928 ?auto_169929 ?auto_169930 ?auto_169931 ?auto_169932 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169941 - BLOCK
      ?auto_169942 - BLOCK
      ?auto_169943 - BLOCK
      ?auto_169944 - BLOCK
      ?auto_169945 - BLOCK
      ?auto_169946 - BLOCK
      ?auto_169947 - BLOCK
    )
    :vars
    (
      ?auto_169948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169947 ?auto_169948 ) ( ON-TABLE ?auto_169941 ) ( ON ?auto_169942 ?auto_169941 ) ( ON ?auto_169943 ?auto_169942 ) ( ON ?auto_169944 ?auto_169943 ) ( ON ?auto_169945 ?auto_169944 ) ( not ( = ?auto_169941 ?auto_169942 ) ) ( not ( = ?auto_169941 ?auto_169943 ) ) ( not ( = ?auto_169941 ?auto_169944 ) ) ( not ( = ?auto_169941 ?auto_169945 ) ) ( not ( = ?auto_169941 ?auto_169946 ) ) ( not ( = ?auto_169941 ?auto_169947 ) ) ( not ( = ?auto_169941 ?auto_169948 ) ) ( not ( = ?auto_169942 ?auto_169943 ) ) ( not ( = ?auto_169942 ?auto_169944 ) ) ( not ( = ?auto_169942 ?auto_169945 ) ) ( not ( = ?auto_169942 ?auto_169946 ) ) ( not ( = ?auto_169942 ?auto_169947 ) ) ( not ( = ?auto_169942 ?auto_169948 ) ) ( not ( = ?auto_169943 ?auto_169944 ) ) ( not ( = ?auto_169943 ?auto_169945 ) ) ( not ( = ?auto_169943 ?auto_169946 ) ) ( not ( = ?auto_169943 ?auto_169947 ) ) ( not ( = ?auto_169943 ?auto_169948 ) ) ( not ( = ?auto_169944 ?auto_169945 ) ) ( not ( = ?auto_169944 ?auto_169946 ) ) ( not ( = ?auto_169944 ?auto_169947 ) ) ( not ( = ?auto_169944 ?auto_169948 ) ) ( not ( = ?auto_169945 ?auto_169946 ) ) ( not ( = ?auto_169945 ?auto_169947 ) ) ( not ( = ?auto_169945 ?auto_169948 ) ) ( not ( = ?auto_169946 ?auto_169947 ) ) ( not ( = ?auto_169946 ?auto_169948 ) ) ( not ( = ?auto_169947 ?auto_169948 ) ) ( CLEAR ?auto_169945 ) ( ON ?auto_169946 ?auto_169947 ) ( CLEAR ?auto_169946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169941 ?auto_169942 ?auto_169943 ?auto_169944 ?auto_169945 ?auto_169946 )
      ( MAKE-7PILE ?auto_169941 ?auto_169942 ?auto_169943 ?auto_169944 ?auto_169945 ?auto_169946 ?auto_169947 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169956 - BLOCK
      ?auto_169957 - BLOCK
      ?auto_169958 - BLOCK
      ?auto_169959 - BLOCK
      ?auto_169960 - BLOCK
      ?auto_169961 - BLOCK
      ?auto_169962 - BLOCK
    )
    :vars
    (
      ?auto_169963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169962 ?auto_169963 ) ( ON-TABLE ?auto_169956 ) ( ON ?auto_169957 ?auto_169956 ) ( ON ?auto_169958 ?auto_169957 ) ( ON ?auto_169959 ?auto_169958 ) ( not ( = ?auto_169956 ?auto_169957 ) ) ( not ( = ?auto_169956 ?auto_169958 ) ) ( not ( = ?auto_169956 ?auto_169959 ) ) ( not ( = ?auto_169956 ?auto_169960 ) ) ( not ( = ?auto_169956 ?auto_169961 ) ) ( not ( = ?auto_169956 ?auto_169962 ) ) ( not ( = ?auto_169956 ?auto_169963 ) ) ( not ( = ?auto_169957 ?auto_169958 ) ) ( not ( = ?auto_169957 ?auto_169959 ) ) ( not ( = ?auto_169957 ?auto_169960 ) ) ( not ( = ?auto_169957 ?auto_169961 ) ) ( not ( = ?auto_169957 ?auto_169962 ) ) ( not ( = ?auto_169957 ?auto_169963 ) ) ( not ( = ?auto_169958 ?auto_169959 ) ) ( not ( = ?auto_169958 ?auto_169960 ) ) ( not ( = ?auto_169958 ?auto_169961 ) ) ( not ( = ?auto_169958 ?auto_169962 ) ) ( not ( = ?auto_169958 ?auto_169963 ) ) ( not ( = ?auto_169959 ?auto_169960 ) ) ( not ( = ?auto_169959 ?auto_169961 ) ) ( not ( = ?auto_169959 ?auto_169962 ) ) ( not ( = ?auto_169959 ?auto_169963 ) ) ( not ( = ?auto_169960 ?auto_169961 ) ) ( not ( = ?auto_169960 ?auto_169962 ) ) ( not ( = ?auto_169960 ?auto_169963 ) ) ( not ( = ?auto_169961 ?auto_169962 ) ) ( not ( = ?auto_169961 ?auto_169963 ) ) ( not ( = ?auto_169962 ?auto_169963 ) ) ( ON ?auto_169961 ?auto_169962 ) ( CLEAR ?auto_169959 ) ( ON ?auto_169960 ?auto_169961 ) ( CLEAR ?auto_169960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169956 ?auto_169957 ?auto_169958 ?auto_169959 ?auto_169960 )
      ( MAKE-7PILE ?auto_169956 ?auto_169957 ?auto_169958 ?auto_169959 ?auto_169960 ?auto_169961 ?auto_169962 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169971 - BLOCK
      ?auto_169972 - BLOCK
      ?auto_169973 - BLOCK
      ?auto_169974 - BLOCK
      ?auto_169975 - BLOCK
      ?auto_169976 - BLOCK
      ?auto_169977 - BLOCK
    )
    :vars
    (
      ?auto_169978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169977 ?auto_169978 ) ( ON-TABLE ?auto_169971 ) ( ON ?auto_169972 ?auto_169971 ) ( ON ?auto_169973 ?auto_169972 ) ( ON ?auto_169974 ?auto_169973 ) ( not ( = ?auto_169971 ?auto_169972 ) ) ( not ( = ?auto_169971 ?auto_169973 ) ) ( not ( = ?auto_169971 ?auto_169974 ) ) ( not ( = ?auto_169971 ?auto_169975 ) ) ( not ( = ?auto_169971 ?auto_169976 ) ) ( not ( = ?auto_169971 ?auto_169977 ) ) ( not ( = ?auto_169971 ?auto_169978 ) ) ( not ( = ?auto_169972 ?auto_169973 ) ) ( not ( = ?auto_169972 ?auto_169974 ) ) ( not ( = ?auto_169972 ?auto_169975 ) ) ( not ( = ?auto_169972 ?auto_169976 ) ) ( not ( = ?auto_169972 ?auto_169977 ) ) ( not ( = ?auto_169972 ?auto_169978 ) ) ( not ( = ?auto_169973 ?auto_169974 ) ) ( not ( = ?auto_169973 ?auto_169975 ) ) ( not ( = ?auto_169973 ?auto_169976 ) ) ( not ( = ?auto_169973 ?auto_169977 ) ) ( not ( = ?auto_169973 ?auto_169978 ) ) ( not ( = ?auto_169974 ?auto_169975 ) ) ( not ( = ?auto_169974 ?auto_169976 ) ) ( not ( = ?auto_169974 ?auto_169977 ) ) ( not ( = ?auto_169974 ?auto_169978 ) ) ( not ( = ?auto_169975 ?auto_169976 ) ) ( not ( = ?auto_169975 ?auto_169977 ) ) ( not ( = ?auto_169975 ?auto_169978 ) ) ( not ( = ?auto_169976 ?auto_169977 ) ) ( not ( = ?auto_169976 ?auto_169978 ) ) ( not ( = ?auto_169977 ?auto_169978 ) ) ( ON ?auto_169976 ?auto_169977 ) ( CLEAR ?auto_169974 ) ( ON ?auto_169975 ?auto_169976 ) ( CLEAR ?auto_169975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169971 ?auto_169972 ?auto_169973 ?auto_169974 ?auto_169975 )
      ( MAKE-7PILE ?auto_169971 ?auto_169972 ?auto_169973 ?auto_169974 ?auto_169975 ?auto_169976 ?auto_169977 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169986 - BLOCK
      ?auto_169987 - BLOCK
      ?auto_169988 - BLOCK
      ?auto_169989 - BLOCK
      ?auto_169990 - BLOCK
      ?auto_169991 - BLOCK
      ?auto_169992 - BLOCK
    )
    :vars
    (
      ?auto_169993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169992 ?auto_169993 ) ( ON-TABLE ?auto_169986 ) ( ON ?auto_169987 ?auto_169986 ) ( ON ?auto_169988 ?auto_169987 ) ( not ( = ?auto_169986 ?auto_169987 ) ) ( not ( = ?auto_169986 ?auto_169988 ) ) ( not ( = ?auto_169986 ?auto_169989 ) ) ( not ( = ?auto_169986 ?auto_169990 ) ) ( not ( = ?auto_169986 ?auto_169991 ) ) ( not ( = ?auto_169986 ?auto_169992 ) ) ( not ( = ?auto_169986 ?auto_169993 ) ) ( not ( = ?auto_169987 ?auto_169988 ) ) ( not ( = ?auto_169987 ?auto_169989 ) ) ( not ( = ?auto_169987 ?auto_169990 ) ) ( not ( = ?auto_169987 ?auto_169991 ) ) ( not ( = ?auto_169987 ?auto_169992 ) ) ( not ( = ?auto_169987 ?auto_169993 ) ) ( not ( = ?auto_169988 ?auto_169989 ) ) ( not ( = ?auto_169988 ?auto_169990 ) ) ( not ( = ?auto_169988 ?auto_169991 ) ) ( not ( = ?auto_169988 ?auto_169992 ) ) ( not ( = ?auto_169988 ?auto_169993 ) ) ( not ( = ?auto_169989 ?auto_169990 ) ) ( not ( = ?auto_169989 ?auto_169991 ) ) ( not ( = ?auto_169989 ?auto_169992 ) ) ( not ( = ?auto_169989 ?auto_169993 ) ) ( not ( = ?auto_169990 ?auto_169991 ) ) ( not ( = ?auto_169990 ?auto_169992 ) ) ( not ( = ?auto_169990 ?auto_169993 ) ) ( not ( = ?auto_169991 ?auto_169992 ) ) ( not ( = ?auto_169991 ?auto_169993 ) ) ( not ( = ?auto_169992 ?auto_169993 ) ) ( ON ?auto_169991 ?auto_169992 ) ( ON ?auto_169990 ?auto_169991 ) ( CLEAR ?auto_169988 ) ( ON ?auto_169989 ?auto_169990 ) ( CLEAR ?auto_169989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169986 ?auto_169987 ?auto_169988 ?auto_169989 )
      ( MAKE-7PILE ?auto_169986 ?auto_169987 ?auto_169988 ?auto_169989 ?auto_169990 ?auto_169991 ?auto_169992 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170001 - BLOCK
      ?auto_170002 - BLOCK
      ?auto_170003 - BLOCK
      ?auto_170004 - BLOCK
      ?auto_170005 - BLOCK
      ?auto_170006 - BLOCK
      ?auto_170007 - BLOCK
    )
    :vars
    (
      ?auto_170008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170007 ?auto_170008 ) ( ON-TABLE ?auto_170001 ) ( ON ?auto_170002 ?auto_170001 ) ( ON ?auto_170003 ?auto_170002 ) ( not ( = ?auto_170001 ?auto_170002 ) ) ( not ( = ?auto_170001 ?auto_170003 ) ) ( not ( = ?auto_170001 ?auto_170004 ) ) ( not ( = ?auto_170001 ?auto_170005 ) ) ( not ( = ?auto_170001 ?auto_170006 ) ) ( not ( = ?auto_170001 ?auto_170007 ) ) ( not ( = ?auto_170001 ?auto_170008 ) ) ( not ( = ?auto_170002 ?auto_170003 ) ) ( not ( = ?auto_170002 ?auto_170004 ) ) ( not ( = ?auto_170002 ?auto_170005 ) ) ( not ( = ?auto_170002 ?auto_170006 ) ) ( not ( = ?auto_170002 ?auto_170007 ) ) ( not ( = ?auto_170002 ?auto_170008 ) ) ( not ( = ?auto_170003 ?auto_170004 ) ) ( not ( = ?auto_170003 ?auto_170005 ) ) ( not ( = ?auto_170003 ?auto_170006 ) ) ( not ( = ?auto_170003 ?auto_170007 ) ) ( not ( = ?auto_170003 ?auto_170008 ) ) ( not ( = ?auto_170004 ?auto_170005 ) ) ( not ( = ?auto_170004 ?auto_170006 ) ) ( not ( = ?auto_170004 ?auto_170007 ) ) ( not ( = ?auto_170004 ?auto_170008 ) ) ( not ( = ?auto_170005 ?auto_170006 ) ) ( not ( = ?auto_170005 ?auto_170007 ) ) ( not ( = ?auto_170005 ?auto_170008 ) ) ( not ( = ?auto_170006 ?auto_170007 ) ) ( not ( = ?auto_170006 ?auto_170008 ) ) ( not ( = ?auto_170007 ?auto_170008 ) ) ( ON ?auto_170006 ?auto_170007 ) ( ON ?auto_170005 ?auto_170006 ) ( CLEAR ?auto_170003 ) ( ON ?auto_170004 ?auto_170005 ) ( CLEAR ?auto_170004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170001 ?auto_170002 ?auto_170003 ?auto_170004 )
      ( MAKE-7PILE ?auto_170001 ?auto_170002 ?auto_170003 ?auto_170004 ?auto_170005 ?auto_170006 ?auto_170007 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170016 - BLOCK
      ?auto_170017 - BLOCK
      ?auto_170018 - BLOCK
      ?auto_170019 - BLOCK
      ?auto_170020 - BLOCK
      ?auto_170021 - BLOCK
      ?auto_170022 - BLOCK
    )
    :vars
    (
      ?auto_170023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170022 ?auto_170023 ) ( ON-TABLE ?auto_170016 ) ( ON ?auto_170017 ?auto_170016 ) ( not ( = ?auto_170016 ?auto_170017 ) ) ( not ( = ?auto_170016 ?auto_170018 ) ) ( not ( = ?auto_170016 ?auto_170019 ) ) ( not ( = ?auto_170016 ?auto_170020 ) ) ( not ( = ?auto_170016 ?auto_170021 ) ) ( not ( = ?auto_170016 ?auto_170022 ) ) ( not ( = ?auto_170016 ?auto_170023 ) ) ( not ( = ?auto_170017 ?auto_170018 ) ) ( not ( = ?auto_170017 ?auto_170019 ) ) ( not ( = ?auto_170017 ?auto_170020 ) ) ( not ( = ?auto_170017 ?auto_170021 ) ) ( not ( = ?auto_170017 ?auto_170022 ) ) ( not ( = ?auto_170017 ?auto_170023 ) ) ( not ( = ?auto_170018 ?auto_170019 ) ) ( not ( = ?auto_170018 ?auto_170020 ) ) ( not ( = ?auto_170018 ?auto_170021 ) ) ( not ( = ?auto_170018 ?auto_170022 ) ) ( not ( = ?auto_170018 ?auto_170023 ) ) ( not ( = ?auto_170019 ?auto_170020 ) ) ( not ( = ?auto_170019 ?auto_170021 ) ) ( not ( = ?auto_170019 ?auto_170022 ) ) ( not ( = ?auto_170019 ?auto_170023 ) ) ( not ( = ?auto_170020 ?auto_170021 ) ) ( not ( = ?auto_170020 ?auto_170022 ) ) ( not ( = ?auto_170020 ?auto_170023 ) ) ( not ( = ?auto_170021 ?auto_170022 ) ) ( not ( = ?auto_170021 ?auto_170023 ) ) ( not ( = ?auto_170022 ?auto_170023 ) ) ( ON ?auto_170021 ?auto_170022 ) ( ON ?auto_170020 ?auto_170021 ) ( ON ?auto_170019 ?auto_170020 ) ( CLEAR ?auto_170017 ) ( ON ?auto_170018 ?auto_170019 ) ( CLEAR ?auto_170018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170016 ?auto_170017 ?auto_170018 )
      ( MAKE-7PILE ?auto_170016 ?auto_170017 ?auto_170018 ?auto_170019 ?auto_170020 ?auto_170021 ?auto_170022 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170031 - BLOCK
      ?auto_170032 - BLOCK
      ?auto_170033 - BLOCK
      ?auto_170034 - BLOCK
      ?auto_170035 - BLOCK
      ?auto_170036 - BLOCK
      ?auto_170037 - BLOCK
    )
    :vars
    (
      ?auto_170038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170037 ?auto_170038 ) ( ON-TABLE ?auto_170031 ) ( ON ?auto_170032 ?auto_170031 ) ( not ( = ?auto_170031 ?auto_170032 ) ) ( not ( = ?auto_170031 ?auto_170033 ) ) ( not ( = ?auto_170031 ?auto_170034 ) ) ( not ( = ?auto_170031 ?auto_170035 ) ) ( not ( = ?auto_170031 ?auto_170036 ) ) ( not ( = ?auto_170031 ?auto_170037 ) ) ( not ( = ?auto_170031 ?auto_170038 ) ) ( not ( = ?auto_170032 ?auto_170033 ) ) ( not ( = ?auto_170032 ?auto_170034 ) ) ( not ( = ?auto_170032 ?auto_170035 ) ) ( not ( = ?auto_170032 ?auto_170036 ) ) ( not ( = ?auto_170032 ?auto_170037 ) ) ( not ( = ?auto_170032 ?auto_170038 ) ) ( not ( = ?auto_170033 ?auto_170034 ) ) ( not ( = ?auto_170033 ?auto_170035 ) ) ( not ( = ?auto_170033 ?auto_170036 ) ) ( not ( = ?auto_170033 ?auto_170037 ) ) ( not ( = ?auto_170033 ?auto_170038 ) ) ( not ( = ?auto_170034 ?auto_170035 ) ) ( not ( = ?auto_170034 ?auto_170036 ) ) ( not ( = ?auto_170034 ?auto_170037 ) ) ( not ( = ?auto_170034 ?auto_170038 ) ) ( not ( = ?auto_170035 ?auto_170036 ) ) ( not ( = ?auto_170035 ?auto_170037 ) ) ( not ( = ?auto_170035 ?auto_170038 ) ) ( not ( = ?auto_170036 ?auto_170037 ) ) ( not ( = ?auto_170036 ?auto_170038 ) ) ( not ( = ?auto_170037 ?auto_170038 ) ) ( ON ?auto_170036 ?auto_170037 ) ( ON ?auto_170035 ?auto_170036 ) ( ON ?auto_170034 ?auto_170035 ) ( CLEAR ?auto_170032 ) ( ON ?auto_170033 ?auto_170034 ) ( CLEAR ?auto_170033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170031 ?auto_170032 ?auto_170033 )
      ( MAKE-7PILE ?auto_170031 ?auto_170032 ?auto_170033 ?auto_170034 ?auto_170035 ?auto_170036 ?auto_170037 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170046 - BLOCK
      ?auto_170047 - BLOCK
      ?auto_170048 - BLOCK
      ?auto_170049 - BLOCK
      ?auto_170050 - BLOCK
      ?auto_170051 - BLOCK
      ?auto_170052 - BLOCK
    )
    :vars
    (
      ?auto_170053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170052 ?auto_170053 ) ( ON-TABLE ?auto_170046 ) ( not ( = ?auto_170046 ?auto_170047 ) ) ( not ( = ?auto_170046 ?auto_170048 ) ) ( not ( = ?auto_170046 ?auto_170049 ) ) ( not ( = ?auto_170046 ?auto_170050 ) ) ( not ( = ?auto_170046 ?auto_170051 ) ) ( not ( = ?auto_170046 ?auto_170052 ) ) ( not ( = ?auto_170046 ?auto_170053 ) ) ( not ( = ?auto_170047 ?auto_170048 ) ) ( not ( = ?auto_170047 ?auto_170049 ) ) ( not ( = ?auto_170047 ?auto_170050 ) ) ( not ( = ?auto_170047 ?auto_170051 ) ) ( not ( = ?auto_170047 ?auto_170052 ) ) ( not ( = ?auto_170047 ?auto_170053 ) ) ( not ( = ?auto_170048 ?auto_170049 ) ) ( not ( = ?auto_170048 ?auto_170050 ) ) ( not ( = ?auto_170048 ?auto_170051 ) ) ( not ( = ?auto_170048 ?auto_170052 ) ) ( not ( = ?auto_170048 ?auto_170053 ) ) ( not ( = ?auto_170049 ?auto_170050 ) ) ( not ( = ?auto_170049 ?auto_170051 ) ) ( not ( = ?auto_170049 ?auto_170052 ) ) ( not ( = ?auto_170049 ?auto_170053 ) ) ( not ( = ?auto_170050 ?auto_170051 ) ) ( not ( = ?auto_170050 ?auto_170052 ) ) ( not ( = ?auto_170050 ?auto_170053 ) ) ( not ( = ?auto_170051 ?auto_170052 ) ) ( not ( = ?auto_170051 ?auto_170053 ) ) ( not ( = ?auto_170052 ?auto_170053 ) ) ( ON ?auto_170051 ?auto_170052 ) ( ON ?auto_170050 ?auto_170051 ) ( ON ?auto_170049 ?auto_170050 ) ( ON ?auto_170048 ?auto_170049 ) ( CLEAR ?auto_170046 ) ( ON ?auto_170047 ?auto_170048 ) ( CLEAR ?auto_170047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170046 ?auto_170047 )
      ( MAKE-7PILE ?auto_170046 ?auto_170047 ?auto_170048 ?auto_170049 ?auto_170050 ?auto_170051 ?auto_170052 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170061 - BLOCK
      ?auto_170062 - BLOCK
      ?auto_170063 - BLOCK
      ?auto_170064 - BLOCK
      ?auto_170065 - BLOCK
      ?auto_170066 - BLOCK
      ?auto_170067 - BLOCK
    )
    :vars
    (
      ?auto_170068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170067 ?auto_170068 ) ( ON-TABLE ?auto_170061 ) ( not ( = ?auto_170061 ?auto_170062 ) ) ( not ( = ?auto_170061 ?auto_170063 ) ) ( not ( = ?auto_170061 ?auto_170064 ) ) ( not ( = ?auto_170061 ?auto_170065 ) ) ( not ( = ?auto_170061 ?auto_170066 ) ) ( not ( = ?auto_170061 ?auto_170067 ) ) ( not ( = ?auto_170061 ?auto_170068 ) ) ( not ( = ?auto_170062 ?auto_170063 ) ) ( not ( = ?auto_170062 ?auto_170064 ) ) ( not ( = ?auto_170062 ?auto_170065 ) ) ( not ( = ?auto_170062 ?auto_170066 ) ) ( not ( = ?auto_170062 ?auto_170067 ) ) ( not ( = ?auto_170062 ?auto_170068 ) ) ( not ( = ?auto_170063 ?auto_170064 ) ) ( not ( = ?auto_170063 ?auto_170065 ) ) ( not ( = ?auto_170063 ?auto_170066 ) ) ( not ( = ?auto_170063 ?auto_170067 ) ) ( not ( = ?auto_170063 ?auto_170068 ) ) ( not ( = ?auto_170064 ?auto_170065 ) ) ( not ( = ?auto_170064 ?auto_170066 ) ) ( not ( = ?auto_170064 ?auto_170067 ) ) ( not ( = ?auto_170064 ?auto_170068 ) ) ( not ( = ?auto_170065 ?auto_170066 ) ) ( not ( = ?auto_170065 ?auto_170067 ) ) ( not ( = ?auto_170065 ?auto_170068 ) ) ( not ( = ?auto_170066 ?auto_170067 ) ) ( not ( = ?auto_170066 ?auto_170068 ) ) ( not ( = ?auto_170067 ?auto_170068 ) ) ( ON ?auto_170066 ?auto_170067 ) ( ON ?auto_170065 ?auto_170066 ) ( ON ?auto_170064 ?auto_170065 ) ( ON ?auto_170063 ?auto_170064 ) ( CLEAR ?auto_170061 ) ( ON ?auto_170062 ?auto_170063 ) ( CLEAR ?auto_170062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170061 ?auto_170062 )
      ( MAKE-7PILE ?auto_170061 ?auto_170062 ?auto_170063 ?auto_170064 ?auto_170065 ?auto_170066 ?auto_170067 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170076 - BLOCK
      ?auto_170077 - BLOCK
      ?auto_170078 - BLOCK
      ?auto_170079 - BLOCK
      ?auto_170080 - BLOCK
      ?auto_170081 - BLOCK
      ?auto_170082 - BLOCK
    )
    :vars
    (
      ?auto_170083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170082 ?auto_170083 ) ( not ( = ?auto_170076 ?auto_170077 ) ) ( not ( = ?auto_170076 ?auto_170078 ) ) ( not ( = ?auto_170076 ?auto_170079 ) ) ( not ( = ?auto_170076 ?auto_170080 ) ) ( not ( = ?auto_170076 ?auto_170081 ) ) ( not ( = ?auto_170076 ?auto_170082 ) ) ( not ( = ?auto_170076 ?auto_170083 ) ) ( not ( = ?auto_170077 ?auto_170078 ) ) ( not ( = ?auto_170077 ?auto_170079 ) ) ( not ( = ?auto_170077 ?auto_170080 ) ) ( not ( = ?auto_170077 ?auto_170081 ) ) ( not ( = ?auto_170077 ?auto_170082 ) ) ( not ( = ?auto_170077 ?auto_170083 ) ) ( not ( = ?auto_170078 ?auto_170079 ) ) ( not ( = ?auto_170078 ?auto_170080 ) ) ( not ( = ?auto_170078 ?auto_170081 ) ) ( not ( = ?auto_170078 ?auto_170082 ) ) ( not ( = ?auto_170078 ?auto_170083 ) ) ( not ( = ?auto_170079 ?auto_170080 ) ) ( not ( = ?auto_170079 ?auto_170081 ) ) ( not ( = ?auto_170079 ?auto_170082 ) ) ( not ( = ?auto_170079 ?auto_170083 ) ) ( not ( = ?auto_170080 ?auto_170081 ) ) ( not ( = ?auto_170080 ?auto_170082 ) ) ( not ( = ?auto_170080 ?auto_170083 ) ) ( not ( = ?auto_170081 ?auto_170082 ) ) ( not ( = ?auto_170081 ?auto_170083 ) ) ( not ( = ?auto_170082 ?auto_170083 ) ) ( ON ?auto_170081 ?auto_170082 ) ( ON ?auto_170080 ?auto_170081 ) ( ON ?auto_170079 ?auto_170080 ) ( ON ?auto_170078 ?auto_170079 ) ( ON ?auto_170077 ?auto_170078 ) ( ON ?auto_170076 ?auto_170077 ) ( CLEAR ?auto_170076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170076 )
      ( MAKE-7PILE ?auto_170076 ?auto_170077 ?auto_170078 ?auto_170079 ?auto_170080 ?auto_170081 ?auto_170082 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170091 - BLOCK
      ?auto_170092 - BLOCK
      ?auto_170093 - BLOCK
      ?auto_170094 - BLOCK
      ?auto_170095 - BLOCK
      ?auto_170096 - BLOCK
      ?auto_170097 - BLOCK
    )
    :vars
    (
      ?auto_170098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170097 ?auto_170098 ) ( not ( = ?auto_170091 ?auto_170092 ) ) ( not ( = ?auto_170091 ?auto_170093 ) ) ( not ( = ?auto_170091 ?auto_170094 ) ) ( not ( = ?auto_170091 ?auto_170095 ) ) ( not ( = ?auto_170091 ?auto_170096 ) ) ( not ( = ?auto_170091 ?auto_170097 ) ) ( not ( = ?auto_170091 ?auto_170098 ) ) ( not ( = ?auto_170092 ?auto_170093 ) ) ( not ( = ?auto_170092 ?auto_170094 ) ) ( not ( = ?auto_170092 ?auto_170095 ) ) ( not ( = ?auto_170092 ?auto_170096 ) ) ( not ( = ?auto_170092 ?auto_170097 ) ) ( not ( = ?auto_170092 ?auto_170098 ) ) ( not ( = ?auto_170093 ?auto_170094 ) ) ( not ( = ?auto_170093 ?auto_170095 ) ) ( not ( = ?auto_170093 ?auto_170096 ) ) ( not ( = ?auto_170093 ?auto_170097 ) ) ( not ( = ?auto_170093 ?auto_170098 ) ) ( not ( = ?auto_170094 ?auto_170095 ) ) ( not ( = ?auto_170094 ?auto_170096 ) ) ( not ( = ?auto_170094 ?auto_170097 ) ) ( not ( = ?auto_170094 ?auto_170098 ) ) ( not ( = ?auto_170095 ?auto_170096 ) ) ( not ( = ?auto_170095 ?auto_170097 ) ) ( not ( = ?auto_170095 ?auto_170098 ) ) ( not ( = ?auto_170096 ?auto_170097 ) ) ( not ( = ?auto_170096 ?auto_170098 ) ) ( not ( = ?auto_170097 ?auto_170098 ) ) ( ON ?auto_170096 ?auto_170097 ) ( ON ?auto_170095 ?auto_170096 ) ( ON ?auto_170094 ?auto_170095 ) ( ON ?auto_170093 ?auto_170094 ) ( ON ?auto_170092 ?auto_170093 ) ( ON ?auto_170091 ?auto_170092 ) ( CLEAR ?auto_170091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170091 )
      ( MAKE-7PILE ?auto_170091 ?auto_170092 ?auto_170093 ?auto_170094 ?auto_170095 ?auto_170096 ?auto_170097 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170107 - BLOCK
      ?auto_170108 - BLOCK
      ?auto_170109 - BLOCK
      ?auto_170110 - BLOCK
      ?auto_170111 - BLOCK
      ?auto_170112 - BLOCK
      ?auto_170113 - BLOCK
      ?auto_170114 - BLOCK
    )
    :vars
    (
      ?auto_170115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_170113 ) ( ON ?auto_170114 ?auto_170115 ) ( CLEAR ?auto_170114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170107 ) ( ON ?auto_170108 ?auto_170107 ) ( ON ?auto_170109 ?auto_170108 ) ( ON ?auto_170110 ?auto_170109 ) ( ON ?auto_170111 ?auto_170110 ) ( ON ?auto_170112 ?auto_170111 ) ( ON ?auto_170113 ?auto_170112 ) ( not ( = ?auto_170107 ?auto_170108 ) ) ( not ( = ?auto_170107 ?auto_170109 ) ) ( not ( = ?auto_170107 ?auto_170110 ) ) ( not ( = ?auto_170107 ?auto_170111 ) ) ( not ( = ?auto_170107 ?auto_170112 ) ) ( not ( = ?auto_170107 ?auto_170113 ) ) ( not ( = ?auto_170107 ?auto_170114 ) ) ( not ( = ?auto_170107 ?auto_170115 ) ) ( not ( = ?auto_170108 ?auto_170109 ) ) ( not ( = ?auto_170108 ?auto_170110 ) ) ( not ( = ?auto_170108 ?auto_170111 ) ) ( not ( = ?auto_170108 ?auto_170112 ) ) ( not ( = ?auto_170108 ?auto_170113 ) ) ( not ( = ?auto_170108 ?auto_170114 ) ) ( not ( = ?auto_170108 ?auto_170115 ) ) ( not ( = ?auto_170109 ?auto_170110 ) ) ( not ( = ?auto_170109 ?auto_170111 ) ) ( not ( = ?auto_170109 ?auto_170112 ) ) ( not ( = ?auto_170109 ?auto_170113 ) ) ( not ( = ?auto_170109 ?auto_170114 ) ) ( not ( = ?auto_170109 ?auto_170115 ) ) ( not ( = ?auto_170110 ?auto_170111 ) ) ( not ( = ?auto_170110 ?auto_170112 ) ) ( not ( = ?auto_170110 ?auto_170113 ) ) ( not ( = ?auto_170110 ?auto_170114 ) ) ( not ( = ?auto_170110 ?auto_170115 ) ) ( not ( = ?auto_170111 ?auto_170112 ) ) ( not ( = ?auto_170111 ?auto_170113 ) ) ( not ( = ?auto_170111 ?auto_170114 ) ) ( not ( = ?auto_170111 ?auto_170115 ) ) ( not ( = ?auto_170112 ?auto_170113 ) ) ( not ( = ?auto_170112 ?auto_170114 ) ) ( not ( = ?auto_170112 ?auto_170115 ) ) ( not ( = ?auto_170113 ?auto_170114 ) ) ( not ( = ?auto_170113 ?auto_170115 ) ) ( not ( = ?auto_170114 ?auto_170115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170114 ?auto_170115 )
      ( !STACK ?auto_170114 ?auto_170113 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170124 - BLOCK
      ?auto_170125 - BLOCK
      ?auto_170126 - BLOCK
      ?auto_170127 - BLOCK
      ?auto_170128 - BLOCK
      ?auto_170129 - BLOCK
      ?auto_170130 - BLOCK
      ?auto_170131 - BLOCK
    )
    :vars
    (
      ?auto_170132 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_170130 ) ( ON ?auto_170131 ?auto_170132 ) ( CLEAR ?auto_170131 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170124 ) ( ON ?auto_170125 ?auto_170124 ) ( ON ?auto_170126 ?auto_170125 ) ( ON ?auto_170127 ?auto_170126 ) ( ON ?auto_170128 ?auto_170127 ) ( ON ?auto_170129 ?auto_170128 ) ( ON ?auto_170130 ?auto_170129 ) ( not ( = ?auto_170124 ?auto_170125 ) ) ( not ( = ?auto_170124 ?auto_170126 ) ) ( not ( = ?auto_170124 ?auto_170127 ) ) ( not ( = ?auto_170124 ?auto_170128 ) ) ( not ( = ?auto_170124 ?auto_170129 ) ) ( not ( = ?auto_170124 ?auto_170130 ) ) ( not ( = ?auto_170124 ?auto_170131 ) ) ( not ( = ?auto_170124 ?auto_170132 ) ) ( not ( = ?auto_170125 ?auto_170126 ) ) ( not ( = ?auto_170125 ?auto_170127 ) ) ( not ( = ?auto_170125 ?auto_170128 ) ) ( not ( = ?auto_170125 ?auto_170129 ) ) ( not ( = ?auto_170125 ?auto_170130 ) ) ( not ( = ?auto_170125 ?auto_170131 ) ) ( not ( = ?auto_170125 ?auto_170132 ) ) ( not ( = ?auto_170126 ?auto_170127 ) ) ( not ( = ?auto_170126 ?auto_170128 ) ) ( not ( = ?auto_170126 ?auto_170129 ) ) ( not ( = ?auto_170126 ?auto_170130 ) ) ( not ( = ?auto_170126 ?auto_170131 ) ) ( not ( = ?auto_170126 ?auto_170132 ) ) ( not ( = ?auto_170127 ?auto_170128 ) ) ( not ( = ?auto_170127 ?auto_170129 ) ) ( not ( = ?auto_170127 ?auto_170130 ) ) ( not ( = ?auto_170127 ?auto_170131 ) ) ( not ( = ?auto_170127 ?auto_170132 ) ) ( not ( = ?auto_170128 ?auto_170129 ) ) ( not ( = ?auto_170128 ?auto_170130 ) ) ( not ( = ?auto_170128 ?auto_170131 ) ) ( not ( = ?auto_170128 ?auto_170132 ) ) ( not ( = ?auto_170129 ?auto_170130 ) ) ( not ( = ?auto_170129 ?auto_170131 ) ) ( not ( = ?auto_170129 ?auto_170132 ) ) ( not ( = ?auto_170130 ?auto_170131 ) ) ( not ( = ?auto_170130 ?auto_170132 ) ) ( not ( = ?auto_170131 ?auto_170132 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170131 ?auto_170132 )
      ( !STACK ?auto_170131 ?auto_170130 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170141 - BLOCK
      ?auto_170142 - BLOCK
      ?auto_170143 - BLOCK
      ?auto_170144 - BLOCK
      ?auto_170145 - BLOCK
      ?auto_170146 - BLOCK
      ?auto_170147 - BLOCK
      ?auto_170148 - BLOCK
    )
    :vars
    (
      ?auto_170149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170148 ?auto_170149 ) ( ON-TABLE ?auto_170141 ) ( ON ?auto_170142 ?auto_170141 ) ( ON ?auto_170143 ?auto_170142 ) ( ON ?auto_170144 ?auto_170143 ) ( ON ?auto_170145 ?auto_170144 ) ( ON ?auto_170146 ?auto_170145 ) ( not ( = ?auto_170141 ?auto_170142 ) ) ( not ( = ?auto_170141 ?auto_170143 ) ) ( not ( = ?auto_170141 ?auto_170144 ) ) ( not ( = ?auto_170141 ?auto_170145 ) ) ( not ( = ?auto_170141 ?auto_170146 ) ) ( not ( = ?auto_170141 ?auto_170147 ) ) ( not ( = ?auto_170141 ?auto_170148 ) ) ( not ( = ?auto_170141 ?auto_170149 ) ) ( not ( = ?auto_170142 ?auto_170143 ) ) ( not ( = ?auto_170142 ?auto_170144 ) ) ( not ( = ?auto_170142 ?auto_170145 ) ) ( not ( = ?auto_170142 ?auto_170146 ) ) ( not ( = ?auto_170142 ?auto_170147 ) ) ( not ( = ?auto_170142 ?auto_170148 ) ) ( not ( = ?auto_170142 ?auto_170149 ) ) ( not ( = ?auto_170143 ?auto_170144 ) ) ( not ( = ?auto_170143 ?auto_170145 ) ) ( not ( = ?auto_170143 ?auto_170146 ) ) ( not ( = ?auto_170143 ?auto_170147 ) ) ( not ( = ?auto_170143 ?auto_170148 ) ) ( not ( = ?auto_170143 ?auto_170149 ) ) ( not ( = ?auto_170144 ?auto_170145 ) ) ( not ( = ?auto_170144 ?auto_170146 ) ) ( not ( = ?auto_170144 ?auto_170147 ) ) ( not ( = ?auto_170144 ?auto_170148 ) ) ( not ( = ?auto_170144 ?auto_170149 ) ) ( not ( = ?auto_170145 ?auto_170146 ) ) ( not ( = ?auto_170145 ?auto_170147 ) ) ( not ( = ?auto_170145 ?auto_170148 ) ) ( not ( = ?auto_170145 ?auto_170149 ) ) ( not ( = ?auto_170146 ?auto_170147 ) ) ( not ( = ?auto_170146 ?auto_170148 ) ) ( not ( = ?auto_170146 ?auto_170149 ) ) ( not ( = ?auto_170147 ?auto_170148 ) ) ( not ( = ?auto_170147 ?auto_170149 ) ) ( not ( = ?auto_170148 ?auto_170149 ) ) ( CLEAR ?auto_170146 ) ( ON ?auto_170147 ?auto_170148 ) ( CLEAR ?auto_170147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170141 ?auto_170142 ?auto_170143 ?auto_170144 ?auto_170145 ?auto_170146 ?auto_170147 )
      ( MAKE-8PILE ?auto_170141 ?auto_170142 ?auto_170143 ?auto_170144 ?auto_170145 ?auto_170146 ?auto_170147 ?auto_170148 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170158 - BLOCK
      ?auto_170159 - BLOCK
      ?auto_170160 - BLOCK
      ?auto_170161 - BLOCK
      ?auto_170162 - BLOCK
      ?auto_170163 - BLOCK
      ?auto_170164 - BLOCK
      ?auto_170165 - BLOCK
    )
    :vars
    (
      ?auto_170166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170165 ?auto_170166 ) ( ON-TABLE ?auto_170158 ) ( ON ?auto_170159 ?auto_170158 ) ( ON ?auto_170160 ?auto_170159 ) ( ON ?auto_170161 ?auto_170160 ) ( ON ?auto_170162 ?auto_170161 ) ( ON ?auto_170163 ?auto_170162 ) ( not ( = ?auto_170158 ?auto_170159 ) ) ( not ( = ?auto_170158 ?auto_170160 ) ) ( not ( = ?auto_170158 ?auto_170161 ) ) ( not ( = ?auto_170158 ?auto_170162 ) ) ( not ( = ?auto_170158 ?auto_170163 ) ) ( not ( = ?auto_170158 ?auto_170164 ) ) ( not ( = ?auto_170158 ?auto_170165 ) ) ( not ( = ?auto_170158 ?auto_170166 ) ) ( not ( = ?auto_170159 ?auto_170160 ) ) ( not ( = ?auto_170159 ?auto_170161 ) ) ( not ( = ?auto_170159 ?auto_170162 ) ) ( not ( = ?auto_170159 ?auto_170163 ) ) ( not ( = ?auto_170159 ?auto_170164 ) ) ( not ( = ?auto_170159 ?auto_170165 ) ) ( not ( = ?auto_170159 ?auto_170166 ) ) ( not ( = ?auto_170160 ?auto_170161 ) ) ( not ( = ?auto_170160 ?auto_170162 ) ) ( not ( = ?auto_170160 ?auto_170163 ) ) ( not ( = ?auto_170160 ?auto_170164 ) ) ( not ( = ?auto_170160 ?auto_170165 ) ) ( not ( = ?auto_170160 ?auto_170166 ) ) ( not ( = ?auto_170161 ?auto_170162 ) ) ( not ( = ?auto_170161 ?auto_170163 ) ) ( not ( = ?auto_170161 ?auto_170164 ) ) ( not ( = ?auto_170161 ?auto_170165 ) ) ( not ( = ?auto_170161 ?auto_170166 ) ) ( not ( = ?auto_170162 ?auto_170163 ) ) ( not ( = ?auto_170162 ?auto_170164 ) ) ( not ( = ?auto_170162 ?auto_170165 ) ) ( not ( = ?auto_170162 ?auto_170166 ) ) ( not ( = ?auto_170163 ?auto_170164 ) ) ( not ( = ?auto_170163 ?auto_170165 ) ) ( not ( = ?auto_170163 ?auto_170166 ) ) ( not ( = ?auto_170164 ?auto_170165 ) ) ( not ( = ?auto_170164 ?auto_170166 ) ) ( not ( = ?auto_170165 ?auto_170166 ) ) ( CLEAR ?auto_170163 ) ( ON ?auto_170164 ?auto_170165 ) ( CLEAR ?auto_170164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170158 ?auto_170159 ?auto_170160 ?auto_170161 ?auto_170162 ?auto_170163 ?auto_170164 )
      ( MAKE-8PILE ?auto_170158 ?auto_170159 ?auto_170160 ?auto_170161 ?auto_170162 ?auto_170163 ?auto_170164 ?auto_170165 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170175 - BLOCK
      ?auto_170176 - BLOCK
      ?auto_170177 - BLOCK
      ?auto_170178 - BLOCK
      ?auto_170179 - BLOCK
      ?auto_170180 - BLOCK
      ?auto_170181 - BLOCK
      ?auto_170182 - BLOCK
    )
    :vars
    (
      ?auto_170183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170182 ?auto_170183 ) ( ON-TABLE ?auto_170175 ) ( ON ?auto_170176 ?auto_170175 ) ( ON ?auto_170177 ?auto_170176 ) ( ON ?auto_170178 ?auto_170177 ) ( ON ?auto_170179 ?auto_170178 ) ( not ( = ?auto_170175 ?auto_170176 ) ) ( not ( = ?auto_170175 ?auto_170177 ) ) ( not ( = ?auto_170175 ?auto_170178 ) ) ( not ( = ?auto_170175 ?auto_170179 ) ) ( not ( = ?auto_170175 ?auto_170180 ) ) ( not ( = ?auto_170175 ?auto_170181 ) ) ( not ( = ?auto_170175 ?auto_170182 ) ) ( not ( = ?auto_170175 ?auto_170183 ) ) ( not ( = ?auto_170176 ?auto_170177 ) ) ( not ( = ?auto_170176 ?auto_170178 ) ) ( not ( = ?auto_170176 ?auto_170179 ) ) ( not ( = ?auto_170176 ?auto_170180 ) ) ( not ( = ?auto_170176 ?auto_170181 ) ) ( not ( = ?auto_170176 ?auto_170182 ) ) ( not ( = ?auto_170176 ?auto_170183 ) ) ( not ( = ?auto_170177 ?auto_170178 ) ) ( not ( = ?auto_170177 ?auto_170179 ) ) ( not ( = ?auto_170177 ?auto_170180 ) ) ( not ( = ?auto_170177 ?auto_170181 ) ) ( not ( = ?auto_170177 ?auto_170182 ) ) ( not ( = ?auto_170177 ?auto_170183 ) ) ( not ( = ?auto_170178 ?auto_170179 ) ) ( not ( = ?auto_170178 ?auto_170180 ) ) ( not ( = ?auto_170178 ?auto_170181 ) ) ( not ( = ?auto_170178 ?auto_170182 ) ) ( not ( = ?auto_170178 ?auto_170183 ) ) ( not ( = ?auto_170179 ?auto_170180 ) ) ( not ( = ?auto_170179 ?auto_170181 ) ) ( not ( = ?auto_170179 ?auto_170182 ) ) ( not ( = ?auto_170179 ?auto_170183 ) ) ( not ( = ?auto_170180 ?auto_170181 ) ) ( not ( = ?auto_170180 ?auto_170182 ) ) ( not ( = ?auto_170180 ?auto_170183 ) ) ( not ( = ?auto_170181 ?auto_170182 ) ) ( not ( = ?auto_170181 ?auto_170183 ) ) ( not ( = ?auto_170182 ?auto_170183 ) ) ( ON ?auto_170181 ?auto_170182 ) ( CLEAR ?auto_170179 ) ( ON ?auto_170180 ?auto_170181 ) ( CLEAR ?auto_170180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170175 ?auto_170176 ?auto_170177 ?auto_170178 ?auto_170179 ?auto_170180 )
      ( MAKE-8PILE ?auto_170175 ?auto_170176 ?auto_170177 ?auto_170178 ?auto_170179 ?auto_170180 ?auto_170181 ?auto_170182 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170192 - BLOCK
      ?auto_170193 - BLOCK
      ?auto_170194 - BLOCK
      ?auto_170195 - BLOCK
      ?auto_170196 - BLOCK
      ?auto_170197 - BLOCK
      ?auto_170198 - BLOCK
      ?auto_170199 - BLOCK
    )
    :vars
    (
      ?auto_170200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170199 ?auto_170200 ) ( ON-TABLE ?auto_170192 ) ( ON ?auto_170193 ?auto_170192 ) ( ON ?auto_170194 ?auto_170193 ) ( ON ?auto_170195 ?auto_170194 ) ( ON ?auto_170196 ?auto_170195 ) ( not ( = ?auto_170192 ?auto_170193 ) ) ( not ( = ?auto_170192 ?auto_170194 ) ) ( not ( = ?auto_170192 ?auto_170195 ) ) ( not ( = ?auto_170192 ?auto_170196 ) ) ( not ( = ?auto_170192 ?auto_170197 ) ) ( not ( = ?auto_170192 ?auto_170198 ) ) ( not ( = ?auto_170192 ?auto_170199 ) ) ( not ( = ?auto_170192 ?auto_170200 ) ) ( not ( = ?auto_170193 ?auto_170194 ) ) ( not ( = ?auto_170193 ?auto_170195 ) ) ( not ( = ?auto_170193 ?auto_170196 ) ) ( not ( = ?auto_170193 ?auto_170197 ) ) ( not ( = ?auto_170193 ?auto_170198 ) ) ( not ( = ?auto_170193 ?auto_170199 ) ) ( not ( = ?auto_170193 ?auto_170200 ) ) ( not ( = ?auto_170194 ?auto_170195 ) ) ( not ( = ?auto_170194 ?auto_170196 ) ) ( not ( = ?auto_170194 ?auto_170197 ) ) ( not ( = ?auto_170194 ?auto_170198 ) ) ( not ( = ?auto_170194 ?auto_170199 ) ) ( not ( = ?auto_170194 ?auto_170200 ) ) ( not ( = ?auto_170195 ?auto_170196 ) ) ( not ( = ?auto_170195 ?auto_170197 ) ) ( not ( = ?auto_170195 ?auto_170198 ) ) ( not ( = ?auto_170195 ?auto_170199 ) ) ( not ( = ?auto_170195 ?auto_170200 ) ) ( not ( = ?auto_170196 ?auto_170197 ) ) ( not ( = ?auto_170196 ?auto_170198 ) ) ( not ( = ?auto_170196 ?auto_170199 ) ) ( not ( = ?auto_170196 ?auto_170200 ) ) ( not ( = ?auto_170197 ?auto_170198 ) ) ( not ( = ?auto_170197 ?auto_170199 ) ) ( not ( = ?auto_170197 ?auto_170200 ) ) ( not ( = ?auto_170198 ?auto_170199 ) ) ( not ( = ?auto_170198 ?auto_170200 ) ) ( not ( = ?auto_170199 ?auto_170200 ) ) ( ON ?auto_170198 ?auto_170199 ) ( CLEAR ?auto_170196 ) ( ON ?auto_170197 ?auto_170198 ) ( CLEAR ?auto_170197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170192 ?auto_170193 ?auto_170194 ?auto_170195 ?auto_170196 ?auto_170197 )
      ( MAKE-8PILE ?auto_170192 ?auto_170193 ?auto_170194 ?auto_170195 ?auto_170196 ?auto_170197 ?auto_170198 ?auto_170199 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170209 - BLOCK
      ?auto_170210 - BLOCK
      ?auto_170211 - BLOCK
      ?auto_170212 - BLOCK
      ?auto_170213 - BLOCK
      ?auto_170214 - BLOCK
      ?auto_170215 - BLOCK
      ?auto_170216 - BLOCK
    )
    :vars
    (
      ?auto_170217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170216 ?auto_170217 ) ( ON-TABLE ?auto_170209 ) ( ON ?auto_170210 ?auto_170209 ) ( ON ?auto_170211 ?auto_170210 ) ( ON ?auto_170212 ?auto_170211 ) ( not ( = ?auto_170209 ?auto_170210 ) ) ( not ( = ?auto_170209 ?auto_170211 ) ) ( not ( = ?auto_170209 ?auto_170212 ) ) ( not ( = ?auto_170209 ?auto_170213 ) ) ( not ( = ?auto_170209 ?auto_170214 ) ) ( not ( = ?auto_170209 ?auto_170215 ) ) ( not ( = ?auto_170209 ?auto_170216 ) ) ( not ( = ?auto_170209 ?auto_170217 ) ) ( not ( = ?auto_170210 ?auto_170211 ) ) ( not ( = ?auto_170210 ?auto_170212 ) ) ( not ( = ?auto_170210 ?auto_170213 ) ) ( not ( = ?auto_170210 ?auto_170214 ) ) ( not ( = ?auto_170210 ?auto_170215 ) ) ( not ( = ?auto_170210 ?auto_170216 ) ) ( not ( = ?auto_170210 ?auto_170217 ) ) ( not ( = ?auto_170211 ?auto_170212 ) ) ( not ( = ?auto_170211 ?auto_170213 ) ) ( not ( = ?auto_170211 ?auto_170214 ) ) ( not ( = ?auto_170211 ?auto_170215 ) ) ( not ( = ?auto_170211 ?auto_170216 ) ) ( not ( = ?auto_170211 ?auto_170217 ) ) ( not ( = ?auto_170212 ?auto_170213 ) ) ( not ( = ?auto_170212 ?auto_170214 ) ) ( not ( = ?auto_170212 ?auto_170215 ) ) ( not ( = ?auto_170212 ?auto_170216 ) ) ( not ( = ?auto_170212 ?auto_170217 ) ) ( not ( = ?auto_170213 ?auto_170214 ) ) ( not ( = ?auto_170213 ?auto_170215 ) ) ( not ( = ?auto_170213 ?auto_170216 ) ) ( not ( = ?auto_170213 ?auto_170217 ) ) ( not ( = ?auto_170214 ?auto_170215 ) ) ( not ( = ?auto_170214 ?auto_170216 ) ) ( not ( = ?auto_170214 ?auto_170217 ) ) ( not ( = ?auto_170215 ?auto_170216 ) ) ( not ( = ?auto_170215 ?auto_170217 ) ) ( not ( = ?auto_170216 ?auto_170217 ) ) ( ON ?auto_170215 ?auto_170216 ) ( ON ?auto_170214 ?auto_170215 ) ( CLEAR ?auto_170212 ) ( ON ?auto_170213 ?auto_170214 ) ( CLEAR ?auto_170213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170209 ?auto_170210 ?auto_170211 ?auto_170212 ?auto_170213 )
      ( MAKE-8PILE ?auto_170209 ?auto_170210 ?auto_170211 ?auto_170212 ?auto_170213 ?auto_170214 ?auto_170215 ?auto_170216 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170226 - BLOCK
      ?auto_170227 - BLOCK
      ?auto_170228 - BLOCK
      ?auto_170229 - BLOCK
      ?auto_170230 - BLOCK
      ?auto_170231 - BLOCK
      ?auto_170232 - BLOCK
      ?auto_170233 - BLOCK
    )
    :vars
    (
      ?auto_170234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170233 ?auto_170234 ) ( ON-TABLE ?auto_170226 ) ( ON ?auto_170227 ?auto_170226 ) ( ON ?auto_170228 ?auto_170227 ) ( ON ?auto_170229 ?auto_170228 ) ( not ( = ?auto_170226 ?auto_170227 ) ) ( not ( = ?auto_170226 ?auto_170228 ) ) ( not ( = ?auto_170226 ?auto_170229 ) ) ( not ( = ?auto_170226 ?auto_170230 ) ) ( not ( = ?auto_170226 ?auto_170231 ) ) ( not ( = ?auto_170226 ?auto_170232 ) ) ( not ( = ?auto_170226 ?auto_170233 ) ) ( not ( = ?auto_170226 ?auto_170234 ) ) ( not ( = ?auto_170227 ?auto_170228 ) ) ( not ( = ?auto_170227 ?auto_170229 ) ) ( not ( = ?auto_170227 ?auto_170230 ) ) ( not ( = ?auto_170227 ?auto_170231 ) ) ( not ( = ?auto_170227 ?auto_170232 ) ) ( not ( = ?auto_170227 ?auto_170233 ) ) ( not ( = ?auto_170227 ?auto_170234 ) ) ( not ( = ?auto_170228 ?auto_170229 ) ) ( not ( = ?auto_170228 ?auto_170230 ) ) ( not ( = ?auto_170228 ?auto_170231 ) ) ( not ( = ?auto_170228 ?auto_170232 ) ) ( not ( = ?auto_170228 ?auto_170233 ) ) ( not ( = ?auto_170228 ?auto_170234 ) ) ( not ( = ?auto_170229 ?auto_170230 ) ) ( not ( = ?auto_170229 ?auto_170231 ) ) ( not ( = ?auto_170229 ?auto_170232 ) ) ( not ( = ?auto_170229 ?auto_170233 ) ) ( not ( = ?auto_170229 ?auto_170234 ) ) ( not ( = ?auto_170230 ?auto_170231 ) ) ( not ( = ?auto_170230 ?auto_170232 ) ) ( not ( = ?auto_170230 ?auto_170233 ) ) ( not ( = ?auto_170230 ?auto_170234 ) ) ( not ( = ?auto_170231 ?auto_170232 ) ) ( not ( = ?auto_170231 ?auto_170233 ) ) ( not ( = ?auto_170231 ?auto_170234 ) ) ( not ( = ?auto_170232 ?auto_170233 ) ) ( not ( = ?auto_170232 ?auto_170234 ) ) ( not ( = ?auto_170233 ?auto_170234 ) ) ( ON ?auto_170232 ?auto_170233 ) ( ON ?auto_170231 ?auto_170232 ) ( CLEAR ?auto_170229 ) ( ON ?auto_170230 ?auto_170231 ) ( CLEAR ?auto_170230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170226 ?auto_170227 ?auto_170228 ?auto_170229 ?auto_170230 )
      ( MAKE-8PILE ?auto_170226 ?auto_170227 ?auto_170228 ?auto_170229 ?auto_170230 ?auto_170231 ?auto_170232 ?auto_170233 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170243 - BLOCK
      ?auto_170244 - BLOCK
      ?auto_170245 - BLOCK
      ?auto_170246 - BLOCK
      ?auto_170247 - BLOCK
      ?auto_170248 - BLOCK
      ?auto_170249 - BLOCK
      ?auto_170250 - BLOCK
    )
    :vars
    (
      ?auto_170251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170250 ?auto_170251 ) ( ON-TABLE ?auto_170243 ) ( ON ?auto_170244 ?auto_170243 ) ( ON ?auto_170245 ?auto_170244 ) ( not ( = ?auto_170243 ?auto_170244 ) ) ( not ( = ?auto_170243 ?auto_170245 ) ) ( not ( = ?auto_170243 ?auto_170246 ) ) ( not ( = ?auto_170243 ?auto_170247 ) ) ( not ( = ?auto_170243 ?auto_170248 ) ) ( not ( = ?auto_170243 ?auto_170249 ) ) ( not ( = ?auto_170243 ?auto_170250 ) ) ( not ( = ?auto_170243 ?auto_170251 ) ) ( not ( = ?auto_170244 ?auto_170245 ) ) ( not ( = ?auto_170244 ?auto_170246 ) ) ( not ( = ?auto_170244 ?auto_170247 ) ) ( not ( = ?auto_170244 ?auto_170248 ) ) ( not ( = ?auto_170244 ?auto_170249 ) ) ( not ( = ?auto_170244 ?auto_170250 ) ) ( not ( = ?auto_170244 ?auto_170251 ) ) ( not ( = ?auto_170245 ?auto_170246 ) ) ( not ( = ?auto_170245 ?auto_170247 ) ) ( not ( = ?auto_170245 ?auto_170248 ) ) ( not ( = ?auto_170245 ?auto_170249 ) ) ( not ( = ?auto_170245 ?auto_170250 ) ) ( not ( = ?auto_170245 ?auto_170251 ) ) ( not ( = ?auto_170246 ?auto_170247 ) ) ( not ( = ?auto_170246 ?auto_170248 ) ) ( not ( = ?auto_170246 ?auto_170249 ) ) ( not ( = ?auto_170246 ?auto_170250 ) ) ( not ( = ?auto_170246 ?auto_170251 ) ) ( not ( = ?auto_170247 ?auto_170248 ) ) ( not ( = ?auto_170247 ?auto_170249 ) ) ( not ( = ?auto_170247 ?auto_170250 ) ) ( not ( = ?auto_170247 ?auto_170251 ) ) ( not ( = ?auto_170248 ?auto_170249 ) ) ( not ( = ?auto_170248 ?auto_170250 ) ) ( not ( = ?auto_170248 ?auto_170251 ) ) ( not ( = ?auto_170249 ?auto_170250 ) ) ( not ( = ?auto_170249 ?auto_170251 ) ) ( not ( = ?auto_170250 ?auto_170251 ) ) ( ON ?auto_170249 ?auto_170250 ) ( ON ?auto_170248 ?auto_170249 ) ( ON ?auto_170247 ?auto_170248 ) ( CLEAR ?auto_170245 ) ( ON ?auto_170246 ?auto_170247 ) ( CLEAR ?auto_170246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170243 ?auto_170244 ?auto_170245 ?auto_170246 )
      ( MAKE-8PILE ?auto_170243 ?auto_170244 ?auto_170245 ?auto_170246 ?auto_170247 ?auto_170248 ?auto_170249 ?auto_170250 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170260 - BLOCK
      ?auto_170261 - BLOCK
      ?auto_170262 - BLOCK
      ?auto_170263 - BLOCK
      ?auto_170264 - BLOCK
      ?auto_170265 - BLOCK
      ?auto_170266 - BLOCK
      ?auto_170267 - BLOCK
    )
    :vars
    (
      ?auto_170268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170267 ?auto_170268 ) ( ON-TABLE ?auto_170260 ) ( ON ?auto_170261 ?auto_170260 ) ( ON ?auto_170262 ?auto_170261 ) ( not ( = ?auto_170260 ?auto_170261 ) ) ( not ( = ?auto_170260 ?auto_170262 ) ) ( not ( = ?auto_170260 ?auto_170263 ) ) ( not ( = ?auto_170260 ?auto_170264 ) ) ( not ( = ?auto_170260 ?auto_170265 ) ) ( not ( = ?auto_170260 ?auto_170266 ) ) ( not ( = ?auto_170260 ?auto_170267 ) ) ( not ( = ?auto_170260 ?auto_170268 ) ) ( not ( = ?auto_170261 ?auto_170262 ) ) ( not ( = ?auto_170261 ?auto_170263 ) ) ( not ( = ?auto_170261 ?auto_170264 ) ) ( not ( = ?auto_170261 ?auto_170265 ) ) ( not ( = ?auto_170261 ?auto_170266 ) ) ( not ( = ?auto_170261 ?auto_170267 ) ) ( not ( = ?auto_170261 ?auto_170268 ) ) ( not ( = ?auto_170262 ?auto_170263 ) ) ( not ( = ?auto_170262 ?auto_170264 ) ) ( not ( = ?auto_170262 ?auto_170265 ) ) ( not ( = ?auto_170262 ?auto_170266 ) ) ( not ( = ?auto_170262 ?auto_170267 ) ) ( not ( = ?auto_170262 ?auto_170268 ) ) ( not ( = ?auto_170263 ?auto_170264 ) ) ( not ( = ?auto_170263 ?auto_170265 ) ) ( not ( = ?auto_170263 ?auto_170266 ) ) ( not ( = ?auto_170263 ?auto_170267 ) ) ( not ( = ?auto_170263 ?auto_170268 ) ) ( not ( = ?auto_170264 ?auto_170265 ) ) ( not ( = ?auto_170264 ?auto_170266 ) ) ( not ( = ?auto_170264 ?auto_170267 ) ) ( not ( = ?auto_170264 ?auto_170268 ) ) ( not ( = ?auto_170265 ?auto_170266 ) ) ( not ( = ?auto_170265 ?auto_170267 ) ) ( not ( = ?auto_170265 ?auto_170268 ) ) ( not ( = ?auto_170266 ?auto_170267 ) ) ( not ( = ?auto_170266 ?auto_170268 ) ) ( not ( = ?auto_170267 ?auto_170268 ) ) ( ON ?auto_170266 ?auto_170267 ) ( ON ?auto_170265 ?auto_170266 ) ( ON ?auto_170264 ?auto_170265 ) ( CLEAR ?auto_170262 ) ( ON ?auto_170263 ?auto_170264 ) ( CLEAR ?auto_170263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170260 ?auto_170261 ?auto_170262 ?auto_170263 )
      ( MAKE-8PILE ?auto_170260 ?auto_170261 ?auto_170262 ?auto_170263 ?auto_170264 ?auto_170265 ?auto_170266 ?auto_170267 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170277 - BLOCK
      ?auto_170278 - BLOCK
      ?auto_170279 - BLOCK
      ?auto_170280 - BLOCK
      ?auto_170281 - BLOCK
      ?auto_170282 - BLOCK
      ?auto_170283 - BLOCK
      ?auto_170284 - BLOCK
    )
    :vars
    (
      ?auto_170285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170284 ?auto_170285 ) ( ON-TABLE ?auto_170277 ) ( ON ?auto_170278 ?auto_170277 ) ( not ( = ?auto_170277 ?auto_170278 ) ) ( not ( = ?auto_170277 ?auto_170279 ) ) ( not ( = ?auto_170277 ?auto_170280 ) ) ( not ( = ?auto_170277 ?auto_170281 ) ) ( not ( = ?auto_170277 ?auto_170282 ) ) ( not ( = ?auto_170277 ?auto_170283 ) ) ( not ( = ?auto_170277 ?auto_170284 ) ) ( not ( = ?auto_170277 ?auto_170285 ) ) ( not ( = ?auto_170278 ?auto_170279 ) ) ( not ( = ?auto_170278 ?auto_170280 ) ) ( not ( = ?auto_170278 ?auto_170281 ) ) ( not ( = ?auto_170278 ?auto_170282 ) ) ( not ( = ?auto_170278 ?auto_170283 ) ) ( not ( = ?auto_170278 ?auto_170284 ) ) ( not ( = ?auto_170278 ?auto_170285 ) ) ( not ( = ?auto_170279 ?auto_170280 ) ) ( not ( = ?auto_170279 ?auto_170281 ) ) ( not ( = ?auto_170279 ?auto_170282 ) ) ( not ( = ?auto_170279 ?auto_170283 ) ) ( not ( = ?auto_170279 ?auto_170284 ) ) ( not ( = ?auto_170279 ?auto_170285 ) ) ( not ( = ?auto_170280 ?auto_170281 ) ) ( not ( = ?auto_170280 ?auto_170282 ) ) ( not ( = ?auto_170280 ?auto_170283 ) ) ( not ( = ?auto_170280 ?auto_170284 ) ) ( not ( = ?auto_170280 ?auto_170285 ) ) ( not ( = ?auto_170281 ?auto_170282 ) ) ( not ( = ?auto_170281 ?auto_170283 ) ) ( not ( = ?auto_170281 ?auto_170284 ) ) ( not ( = ?auto_170281 ?auto_170285 ) ) ( not ( = ?auto_170282 ?auto_170283 ) ) ( not ( = ?auto_170282 ?auto_170284 ) ) ( not ( = ?auto_170282 ?auto_170285 ) ) ( not ( = ?auto_170283 ?auto_170284 ) ) ( not ( = ?auto_170283 ?auto_170285 ) ) ( not ( = ?auto_170284 ?auto_170285 ) ) ( ON ?auto_170283 ?auto_170284 ) ( ON ?auto_170282 ?auto_170283 ) ( ON ?auto_170281 ?auto_170282 ) ( ON ?auto_170280 ?auto_170281 ) ( CLEAR ?auto_170278 ) ( ON ?auto_170279 ?auto_170280 ) ( CLEAR ?auto_170279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170277 ?auto_170278 ?auto_170279 )
      ( MAKE-8PILE ?auto_170277 ?auto_170278 ?auto_170279 ?auto_170280 ?auto_170281 ?auto_170282 ?auto_170283 ?auto_170284 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170294 - BLOCK
      ?auto_170295 - BLOCK
      ?auto_170296 - BLOCK
      ?auto_170297 - BLOCK
      ?auto_170298 - BLOCK
      ?auto_170299 - BLOCK
      ?auto_170300 - BLOCK
      ?auto_170301 - BLOCK
    )
    :vars
    (
      ?auto_170302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170301 ?auto_170302 ) ( ON-TABLE ?auto_170294 ) ( ON ?auto_170295 ?auto_170294 ) ( not ( = ?auto_170294 ?auto_170295 ) ) ( not ( = ?auto_170294 ?auto_170296 ) ) ( not ( = ?auto_170294 ?auto_170297 ) ) ( not ( = ?auto_170294 ?auto_170298 ) ) ( not ( = ?auto_170294 ?auto_170299 ) ) ( not ( = ?auto_170294 ?auto_170300 ) ) ( not ( = ?auto_170294 ?auto_170301 ) ) ( not ( = ?auto_170294 ?auto_170302 ) ) ( not ( = ?auto_170295 ?auto_170296 ) ) ( not ( = ?auto_170295 ?auto_170297 ) ) ( not ( = ?auto_170295 ?auto_170298 ) ) ( not ( = ?auto_170295 ?auto_170299 ) ) ( not ( = ?auto_170295 ?auto_170300 ) ) ( not ( = ?auto_170295 ?auto_170301 ) ) ( not ( = ?auto_170295 ?auto_170302 ) ) ( not ( = ?auto_170296 ?auto_170297 ) ) ( not ( = ?auto_170296 ?auto_170298 ) ) ( not ( = ?auto_170296 ?auto_170299 ) ) ( not ( = ?auto_170296 ?auto_170300 ) ) ( not ( = ?auto_170296 ?auto_170301 ) ) ( not ( = ?auto_170296 ?auto_170302 ) ) ( not ( = ?auto_170297 ?auto_170298 ) ) ( not ( = ?auto_170297 ?auto_170299 ) ) ( not ( = ?auto_170297 ?auto_170300 ) ) ( not ( = ?auto_170297 ?auto_170301 ) ) ( not ( = ?auto_170297 ?auto_170302 ) ) ( not ( = ?auto_170298 ?auto_170299 ) ) ( not ( = ?auto_170298 ?auto_170300 ) ) ( not ( = ?auto_170298 ?auto_170301 ) ) ( not ( = ?auto_170298 ?auto_170302 ) ) ( not ( = ?auto_170299 ?auto_170300 ) ) ( not ( = ?auto_170299 ?auto_170301 ) ) ( not ( = ?auto_170299 ?auto_170302 ) ) ( not ( = ?auto_170300 ?auto_170301 ) ) ( not ( = ?auto_170300 ?auto_170302 ) ) ( not ( = ?auto_170301 ?auto_170302 ) ) ( ON ?auto_170300 ?auto_170301 ) ( ON ?auto_170299 ?auto_170300 ) ( ON ?auto_170298 ?auto_170299 ) ( ON ?auto_170297 ?auto_170298 ) ( CLEAR ?auto_170295 ) ( ON ?auto_170296 ?auto_170297 ) ( CLEAR ?auto_170296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170294 ?auto_170295 ?auto_170296 )
      ( MAKE-8PILE ?auto_170294 ?auto_170295 ?auto_170296 ?auto_170297 ?auto_170298 ?auto_170299 ?auto_170300 ?auto_170301 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170311 - BLOCK
      ?auto_170312 - BLOCK
      ?auto_170313 - BLOCK
      ?auto_170314 - BLOCK
      ?auto_170315 - BLOCK
      ?auto_170316 - BLOCK
      ?auto_170317 - BLOCK
      ?auto_170318 - BLOCK
    )
    :vars
    (
      ?auto_170319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170318 ?auto_170319 ) ( ON-TABLE ?auto_170311 ) ( not ( = ?auto_170311 ?auto_170312 ) ) ( not ( = ?auto_170311 ?auto_170313 ) ) ( not ( = ?auto_170311 ?auto_170314 ) ) ( not ( = ?auto_170311 ?auto_170315 ) ) ( not ( = ?auto_170311 ?auto_170316 ) ) ( not ( = ?auto_170311 ?auto_170317 ) ) ( not ( = ?auto_170311 ?auto_170318 ) ) ( not ( = ?auto_170311 ?auto_170319 ) ) ( not ( = ?auto_170312 ?auto_170313 ) ) ( not ( = ?auto_170312 ?auto_170314 ) ) ( not ( = ?auto_170312 ?auto_170315 ) ) ( not ( = ?auto_170312 ?auto_170316 ) ) ( not ( = ?auto_170312 ?auto_170317 ) ) ( not ( = ?auto_170312 ?auto_170318 ) ) ( not ( = ?auto_170312 ?auto_170319 ) ) ( not ( = ?auto_170313 ?auto_170314 ) ) ( not ( = ?auto_170313 ?auto_170315 ) ) ( not ( = ?auto_170313 ?auto_170316 ) ) ( not ( = ?auto_170313 ?auto_170317 ) ) ( not ( = ?auto_170313 ?auto_170318 ) ) ( not ( = ?auto_170313 ?auto_170319 ) ) ( not ( = ?auto_170314 ?auto_170315 ) ) ( not ( = ?auto_170314 ?auto_170316 ) ) ( not ( = ?auto_170314 ?auto_170317 ) ) ( not ( = ?auto_170314 ?auto_170318 ) ) ( not ( = ?auto_170314 ?auto_170319 ) ) ( not ( = ?auto_170315 ?auto_170316 ) ) ( not ( = ?auto_170315 ?auto_170317 ) ) ( not ( = ?auto_170315 ?auto_170318 ) ) ( not ( = ?auto_170315 ?auto_170319 ) ) ( not ( = ?auto_170316 ?auto_170317 ) ) ( not ( = ?auto_170316 ?auto_170318 ) ) ( not ( = ?auto_170316 ?auto_170319 ) ) ( not ( = ?auto_170317 ?auto_170318 ) ) ( not ( = ?auto_170317 ?auto_170319 ) ) ( not ( = ?auto_170318 ?auto_170319 ) ) ( ON ?auto_170317 ?auto_170318 ) ( ON ?auto_170316 ?auto_170317 ) ( ON ?auto_170315 ?auto_170316 ) ( ON ?auto_170314 ?auto_170315 ) ( ON ?auto_170313 ?auto_170314 ) ( CLEAR ?auto_170311 ) ( ON ?auto_170312 ?auto_170313 ) ( CLEAR ?auto_170312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170311 ?auto_170312 )
      ( MAKE-8PILE ?auto_170311 ?auto_170312 ?auto_170313 ?auto_170314 ?auto_170315 ?auto_170316 ?auto_170317 ?auto_170318 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170328 - BLOCK
      ?auto_170329 - BLOCK
      ?auto_170330 - BLOCK
      ?auto_170331 - BLOCK
      ?auto_170332 - BLOCK
      ?auto_170333 - BLOCK
      ?auto_170334 - BLOCK
      ?auto_170335 - BLOCK
    )
    :vars
    (
      ?auto_170336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170335 ?auto_170336 ) ( ON-TABLE ?auto_170328 ) ( not ( = ?auto_170328 ?auto_170329 ) ) ( not ( = ?auto_170328 ?auto_170330 ) ) ( not ( = ?auto_170328 ?auto_170331 ) ) ( not ( = ?auto_170328 ?auto_170332 ) ) ( not ( = ?auto_170328 ?auto_170333 ) ) ( not ( = ?auto_170328 ?auto_170334 ) ) ( not ( = ?auto_170328 ?auto_170335 ) ) ( not ( = ?auto_170328 ?auto_170336 ) ) ( not ( = ?auto_170329 ?auto_170330 ) ) ( not ( = ?auto_170329 ?auto_170331 ) ) ( not ( = ?auto_170329 ?auto_170332 ) ) ( not ( = ?auto_170329 ?auto_170333 ) ) ( not ( = ?auto_170329 ?auto_170334 ) ) ( not ( = ?auto_170329 ?auto_170335 ) ) ( not ( = ?auto_170329 ?auto_170336 ) ) ( not ( = ?auto_170330 ?auto_170331 ) ) ( not ( = ?auto_170330 ?auto_170332 ) ) ( not ( = ?auto_170330 ?auto_170333 ) ) ( not ( = ?auto_170330 ?auto_170334 ) ) ( not ( = ?auto_170330 ?auto_170335 ) ) ( not ( = ?auto_170330 ?auto_170336 ) ) ( not ( = ?auto_170331 ?auto_170332 ) ) ( not ( = ?auto_170331 ?auto_170333 ) ) ( not ( = ?auto_170331 ?auto_170334 ) ) ( not ( = ?auto_170331 ?auto_170335 ) ) ( not ( = ?auto_170331 ?auto_170336 ) ) ( not ( = ?auto_170332 ?auto_170333 ) ) ( not ( = ?auto_170332 ?auto_170334 ) ) ( not ( = ?auto_170332 ?auto_170335 ) ) ( not ( = ?auto_170332 ?auto_170336 ) ) ( not ( = ?auto_170333 ?auto_170334 ) ) ( not ( = ?auto_170333 ?auto_170335 ) ) ( not ( = ?auto_170333 ?auto_170336 ) ) ( not ( = ?auto_170334 ?auto_170335 ) ) ( not ( = ?auto_170334 ?auto_170336 ) ) ( not ( = ?auto_170335 ?auto_170336 ) ) ( ON ?auto_170334 ?auto_170335 ) ( ON ?auto_170333 ?auto_170334 ) ( ON ?auto_170332 ?auto_170333 ) ( ON ?auto_170331 ?auto_170332 ) ( ON ?auto_170330 ?auto_170331 ) ( CLEAR ?auto_170328 ) ( ON ?auto_170329 ?auto_170330 ) ( CLEAR ?auto_170329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170328 ?auto_170329 )
      ( MAKE-8PILE ?auto_170328 ?auto_170329 ?auto_170330 ?auto_170331 ?auto_170332 ?auto_170333 ?auto_170334 ?auto_170335 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170345 - BLOCK
      ?auto_170346 - BLOCK
      ?auto_170347 - BLOCK
      ?auto_170348 - BLOCK
      ?auto_170349 - BLOCK
      ?auto_170350 - BLOCK
      ?auto_170351 - BLOCK
      ?auto_170352 - BLOCK
    )
    :vars
    (
      ?auto_170353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170352 ?auto_170353 ) ( not ( = ?auto_170345 ?auto_170346 ) ) ( not ( = ?auto_170345 ?auto_170347 ) ) ( not ( = ?auto_170345 ?auto_170348 ) ) ( not ( = ?auto_170345 ?auto_170349 ) ) ( not ( = ?auto_170345 ?auto_170350 ) ) ( not ( = ?auto_170345 ?auto_170351 ) ) ( not ( = ?auto_170345 ?auto_170352 ) ) ( not ( = ?auto_170345 ?auto_170353 ) ) ( not ( = ?auto_170346 ?auto_170347 ) ) ( not ( = ?auto_170346 ?auto_170348 ) ) ( not ( = ?auto_170346 ?auto_170349 ) ) ( not ( = ?auto_170346 ?auto_170350 ) ) ( not ( = ?auto_170346 ?auto_170351 ) ) ( not ( = ?auto_170346 ?auto_170352 ) ) ( not ( = ?auto_170346 ?auto_170353 ) ) ( not ( = ?auto_170347 ?auto_170348 ) ) ( not ( = ?auto_170347 ?auto_170349 ) ) ( not ( = ?auto_170347 ?auto_170350 ) ) ( not ( = ?auto_170347 ?auto_170351 ) ) ( not ( = ?auto_170347 ?auto_170352 ) ) ( not ( = ?auto_170347 ?auto_170353 ) ) ( not ( = ?auto_170348 ?auto_170349 ) ) ( not ( = ?auto_170348 ?auto_170350 ) ) ( not ( = ?auto_170348 ?auto_170351 ) ) ( not ( = ?auto_170348 ?auto_170352 ) ) ( not ( = ?auto_170348 ?auto_170353 ) ) ( not ( = ?auto_170349 ?auto_170350 ) ) ( not ( = ?auto_170349 ?auto_170351 ) ) ( not ( = ?auto_170349 ?auto_170352 ) ) ( not ( = ?auto_170349 ?auto_170353 ) ) ( not ( = ?auto_170350 ?auto_170351 ) ) ( not ( = ?auto_170350 ?auto_170352 ) ) ( not ( = ?auto_170350 ?auto_170353 ) ) ( not ( = ?auto_170351 ?auto_170352 ) ) ( not ( = ?auto_170351 ?auto_170353 ) ) ( not ( = ?auto_170352 ?auto_170353 ) ) ( ON ?auto_170351 ?auto_170352 ) ( ON ?auto_170350 ?auto_170351 ) ( ON ?auto_170349 ?auto_170350 ) ( ON ?auto_170348 ?auto_170349 ) ( ON ?auto_170347 ?auto_170348 ) ( ON ?auto_170346 ?auto_170347 ) ( ON ?auto_170345 ?auto_170346 ) ( CLEAR ?auto_170345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170345 )
      ( MAKE-8PILE ?auto_170345 ?auto_170346 ?auto_170347 ?auto_170348 ?auto_170349 ?auto_170350 ?auto_170351 ?auto_170352 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170362 - BLOCK
      ?auto_170363 - BLOCK
      ?auto_170364 - BLOCK
      ?auto_170365 - BLOCK
      ?auto_170366 - BLOCK
      ?auto_170367 - BLOCK
      ?auto_170368 - BLOCK
      ?auto_170369 - BLOCK
    )
    :vars
    (
      ?auto_170370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170369 ?auto_170370 ) ( not ( = ?auto_170362 ?auto_170363 ) ) ( not ( = ?auto_170362 ?auto_170364 ) ) ( not ( = ?auto_170362 ?auto_170365 ) ) ( not ( = ?auto_170362 ?auto_170366 ) ) ( not ( = ?auto_170362 ?auto_170367 ) ) ( not ( = ?auto_170362 ?auto_170368 ) ) ( not ( = ?auto_170362 ?auto_170369 ) ) ( not ( = ?auto_170362 ?auto_170370 ) ) ( not ( = ?auto_170363 ?auto_170364 ) ) ( not ( = ?auto_170363 ?auto_170365 ) ) ( not ( = ?auto_170363 ?auto_170366 ) ) ( not ( = ?auto_170363 ?auto_170367 ) ) ( not ( = ?auto_170363 ?auto_170368 ) ) ( not ( = ?auto_170363 ?auto_170369 ) ) ( not ( = ?auto_170363 ?auto_170370 ) ) ( not ( = ?auto_170364 ?auto_170365 ) ) ( not ( = ?auto_170364 ?auto_170366 ) ) ( not ( = ?auto_170364 ?auto_170367 ) ) ( not ( = ?auto_170364 ?auto_170368 ) ) ( not ( = ?auto_170364 ?auto_170369 ) ) ( not ( = ?auto_170364 ?auto_170370 ) ) ( not ( = ?auto_170365 ?auto_170366 ) ) ( not ( = ?auto_170365 ?auto_170367 ) ) ( not ( = ?auto_170365 ?auto_170368 ) ) ( not ( = ?auto_170365 ?auto_170369 ) ) ( not ( = ?auto_170365 ?auto_170370 ) ) ( not ( = ?auto_170366 ?auto_170367 ) ) ( not ( = ?auto_170366 ?auto_170368 ) ) ( not ( = ?auto_170366 ?auto_170369 ) ) ( not ( = ?auto_170366 ?auto_170370 ) ) ( not ( = ?auto_170367 ?auto_170368 ) ) ( not ( = ?auto_170367 ?auto_170369 ) ) ( not ( = ?auto_170367 ?auto_170370 ) ) ( not ( = ?auto_170368 ?auto_170369 ) ) ( not ( = ?auto_170368 ?auto_170370 ) ) ( not ( = ?auto_170369 ?auto_170370 ) ) ( ON ?auto_170368 ?auto_170369 ) ( ON ?auto_170367 ?auto_170368 ) ( ON ?auto_170366 ?auto_170367 ) ( ON ?auto_170365 ?auto_170366 ) ( ON ?auto_170364 ?auto_170365 ) ( ON ?auto_170363 ?auto_170364 ) ( ON ?auto_170362 ?auto_170363 ) ( CLEAR ?auto_170362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170362 )
      ( MAKE-8PILE ?auto_170362 ?auto_170363 ?auto_170364 ?auto_170365 ?auto_170366 ?auto_170367 ?auto_170368 ?auto_170369 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170380 - BLOCK
      ?auto_170381 - BLOCK
      ?auto_170382 - BLOCK
      ?auto_170383 - BLOCK
      ?auto_170384 - BLOCK
      ?auto_170385 - BLOCK
      ?auto_170386 - BLOCK
      ?auto_170387 - BLOCK
      ?auto_170388 - BLOCK
    )
    :vars
    (
      ?auto_170389 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_170387 ) ( ON ?auto_170388 ?auto_170389 ) ( CLEAR ?auto_170388 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170380 ) ( ON ?auto_170381 ?auto_170380 ) ( ON ?auto_170382 ?auto_170381 ) ( ON ?auto_170383 ?auto_170382 ) ( ON ?auto_170384 ?auto_170383 ) ( ON ?auto_170385 ?auto_170384 ) ( ON ?auto_170386 ?auto_170385 ) ( ON ?auto_170387 ?auto_170386 ) ( not ( = ?auto_170380 ?auto_170381 ) ) ( not ( = ?auto_170380 ?auto_170382 ) ) ( not ( = ?auto_170380 ?auto_170383 ) ) ( not ( = ?auto_170380 ?auto_170384 ) ) ( not ( = ?auto_170380 ?auto_170385 ) ) ( not ( = ?auto_170380 ?auto_170386 ) ) ( not ( = ?auto_170380 ?auto_170387 ) ) ( not ( = ?auto_170380 ?auto_170388 ) ) ( not ( = ?auto_170380 ?auto_170389 ) ) ( not ( = ?auto_170381 ?auto_170382 ) ) ( not ( = ?auto_170381 ?auto_170383 ) ) ( not ( = ?auto_170381 ?auto_170384 ) ) ( not ( = ?auto_170381 ?auto_170385 ) ) ( not ( = ?auto_170381 ?auto_170386 ) ) ( not ( = ?auto_170381 ?auto_170387 ) ) ( not ( = ?auto_170381 ?auto_170388 ) ) ( not ( = ?auto_170381 ?auto_170389 ) ) ( not ( = ?auto_170382 ?auto_170383 ) ) ( not ( = ?auto_170382 ?auto_170384 ) ) ( not ( = ?auto_170382 ?auto_170385 ) ) ( not ( = ?auto_170382 ?auto_170386 ) ) ( not ( = ?auto_170382 ?auto_170387 ) ) ( not ( = ?auto_170382 ?auto_170388 ) ) ( not ( = ?auto_170382 ?auto_170389 ) ) ( not ( = ?auto_170383 ?auto_170384 ) ) ( not ( = ?auto_170383 ?auto_170385 ) ) ( not ( = ?auto_170383 ?auto_170386 ) ) ( not ( = ?auto_170383 ?auto_170387 ) ) ( not ( = ?auto_170383 ?auto_170388 ) ) ( not ( = ?auto_170383 ?auto_170389 ) ) ( not ( = ?auto_170384 ?auto_170385 ) ) ( not ( = ?auto_170384 ?auto_170386 ) ) ( not ( = ?auto_170384 ?auto_170387 ) ) ( not ( = ?auto_170384 ?auto_170388 ) ) ( not ( = ?auto_170384 ?auto_170389 ) ) ( not ( = ?auto_170385 ?auto_170386 ) ) ( not ( = ?auto_170385 ?auto_170387 ) ) ( not ( = ?auto_170385 ?auto_170388 ) ) ( not ( = ?auto_170385 ?auto_170389 ) ) ( not ( = ?auto_170386 ?auto_170387 ) ) ( not ( = ?auto_170386 ?auto_170388 ) ) ( not ( = ?auto_170386 ?auto_170389 ) ) ( not ( = ?auto_170387 ?auto_170388 ) ) ( not ( = ?auto_170387 ?auto_170389 ) ) ( not ( = ?auto_170388 ?auto_170389 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170388 ?auto_170389 )
      ( !STACK ?auto_170388 ?auto_170387 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170399 - BLOCK
      ?auto_170400 - BLOCK
      ?auto_170401 - BLOCK
      ?auto_170402 - BLOCK
      ?auto_170403 - BLOCK
      ?auto_170404 - BLOCK
      ?auto_170405 - BLOCK
      ?auto_170406 - BLOCK
      ?auto_170407 - BLOCK
    )
    :vars
    (
      ?auto_170408 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_170406 ) ( ON ?auto_170407 ?auto_170408 ) ( CLEAR ?auto_170407 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170399 ) ( ON ?auto_170400 ?auto_170399 ) ( ON ?auto_170401 ?auto_170400 ) ( ON ?auto_170402 ?auto_170401 ) ( ON ?auto_170403 ?auto_170402 ) ( ON ?auto_170404 ?auto_170403 ) ( ON ?auto_170405 ?auto_170404 ) ( ON ?auto_170406 ?auto_170405 ) ( not ( = ?auto_170399 ?auto_170400 ) ) ( not ( = ?auto_170399 ?auto_170401 ) ) ( not ( = ?auto_170399 ?auto_170402 ) ) ( not ( = ?auto_170399 ?auto_170403 ) ) ( not ( = ?auto_170399 ?auto_170404 ) ) ( not ( = ?auto_170399 ?auto_170405 ) ) ( not ( = ?auto_170399 ?auto_170406 ) ) ( not ( = ?auto_170399 ?auto_170407 ) ) ( not ( = ?auto_170399 ?auto_170408 ) ) ( not ( = ?auto_170400 ?auto_170401 ) ) ( not ( = ?auto_170400 ?auto_170402 ) ) ( not ( = ?auto_170400 ?auto_170403 ) ) ( not ( = ?auto_170400 ?auto_170404 ) ) ( not ( = ?auto_170400 ?auto_170405 ) ) ( not ( = ?auto_170400 ?auto_170406 ) ) ( not ( = ?auto_170400 ?auto_170407 ) ) ( not ( = ?auto_170400 ?auto_170408 ) ) ( not ( = ?auto_170401 ?auto_170402 ) ) ( not ( = ?auto_170401 ?auto_170403 ) ) ( not ( = ?auto_170401 ?auto_170404 ) ) ( not ( = ?auto_170401 ?auto_170405 ) ) ( not ( = ?auto_170401 ?auto_170406 ) ) ( not ( = ?auto_170401 ?auto_170407 ) ) ( not ( = ?auto_170401 ?auto_170408 ) ) ( not ( = ?auto_170402 ?auto_170403 ) ) ( not ( = ?auto_170402 ?auto_170404 ) ) ( not ( = ?auto_170402 ?auto_170405 ) ) ( not ( = ?auto_170402 ?auto_170406 ) ) ( not ( = ?auto_170402 ?auto_170407 ) ) ( not ( = ?auto_170402 ?auto_170408 ) ) ( not ( = ?auto_170403 ?auto_170404 ) ) ( not ( = ?auto_170403 ?auto_170405 ) ) ( not ( = ?auto_170403 ?auto_170406 ) ) ( not ( = ?auto_170403 ?auto_170407 ) ) ( not ( = ?auto_170403 ?auto_170408 ) ) ( not ( = ?auto_170404 ?auto_170405 ) ) ( not ( = ?auto_170404 ?auto_170406 ) ) ( not ( = ?auto_170404 ?auto_170407 ) ) ( not ( = ?auto_170404 ?auto_170408 ) ) ( not ( = ?auto_170405 ?auto_170406 ) ) ( not ( = ?auto_170405 ?auto_170407 ) ) ( not ( = ?auto_170405 ?auto_170408 ) ) ( not ( = ?auto_170406 ?auto_170407 ) ) ( not ( = ?auto_170406 ?auto_170408 ) ) ( not ( = ?auto_170407 ?auto_170408 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170407 ?auto_170408 )
      ( !STACK ?auto_170407 ?auto_170406 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170418 - BLOCK
      ?auto_170419 - BLOCK
      ?auto_170420 - BLOCK
      ?auto_170421 - BLOCK
      ?auto_170422 - BLOCK
      ?auto_170423 - BLOCK
      ?auto_170424 - BLOCK
      ?auto_170425 - BLOCK
      ?auto_170426 - BLOCK
    )
    :vars
    (
      ?auto_170427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170426 ?auto_170427 ) ( ON-TABLE ?auto_170418 ) ( ON ?auto_170419 ?auto_170418 ) ( ON ?auto_170420 ?auto_170419 ) ( ON ?auto_170421 ?auto_170420 ) ( ON ?auto_170422 ?auto_170421 ) ( ON ?auto_170423 ?auto_170422 ) ( ON ?auto_170424 ?auto_170423 ) ( not ( = ?auto_170418 ?auto_170419 ) ) ( not ( = ?auto_170418 ?auto_170420 ) ) ( not ( = ?auto_170418 ?auto_170421 ) ) ( not ( = ?auto_170418 ?auto_170422 ) ) ( not ( = ?auto_170418 ?auto_170423 ) ) ( not ( = ?auto_170418 ?auto_170424 ) ) ( not ( = ?auto_170418 ?auto_170425 ) ) ( not ( = ?auto_170418 ?auto_170426 ) ) ( not ( = ?auto_170418 ?auto_170427 ) ) ( not ( = ?auto_170419 ?auto_170420 ) ) ( not ( = ?auto_170419 ?auto_170421 ) ) ( not ( = ?auto_170419 ?auto_170422 ) ) ( not ( = ?auto_170419 ?auto_170423 ) ) ( not ( = ?auto_170419 ?auto_170424 ) ) ( not ( = ?auto_170419 ?auto_170425 ) ) ( not ( = ?auto_170419 ?auto_170426 ) ) ( not ( = ?auto_170419 ?auto_170427 ) ) ( not ( = ?auto_170420 ?auto_170421 ) ) ( not ( = ?auto_170420 ?auto_170422 ) ) ( not ( = ?auto_170420 ?auto_170423 ) ) ( not ( = ?auto_170420 ?auto_170424 ) ) ( not ( = ?auto_170420 ?auto_170425 ) ) ( not ( = ?auto_170420 ?auto_170426 ) ) ( not ( = ?auto_170420 ?auto_170427 ) ) ( not ( = ?auto_170421 ?auto_170422 ) ) ( not ( = ?auto_170421 ?auto_170423 ) ) ( not ( = ?auto_170421 ?auto_170424 ) ) ( not ( = ?auto_170421 ?auto_170425 ) ) ( not ( = ?auto_170421 ?auto_170426 ) ) ( not ( = ?auto_170421 ?auto_170427 ) ) ( not ( = ?auto_170422 ?auto_170423 ) ) ( not ( = ?auto_170422 ?auto_170424 ) ) ( not ( = ?auto_170422 ?auto_170425 ) ) ( not ( = ?auto_170422 ?auto_170426 ) ) ( not ( = ?auto_170422 ?auto_170427 ) ) ( not ( = ?auto_170423 ?auto_170424 ) ) ( not ( = ?auto_170423 ?auto_170425 ) ) ( not ( = ?auto_170423 ?auto_170426 ) ) ( not ( = ?auto_170423 ?auto_170427 ) ) ( not ( = ?auto_170424 ?auto_170425 ) ) ( not ( = ?auto_170424 ?auto_170426 ) ) ( not ( = ?auto_170424 ?auto_170427 ) ) ( not ( = ?auto_170425 ?auto_170426 ) ) ( not ( = ?auto_170425 ?auto_170427 ) ) ( not ( = ?auto_170426 ?auto_170427 ) ) ( CLEAR ?auto_170424 ) ( ON ?auto_170425 ?auto_170426 ) ( CLEAR ?auto_170425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170418 ?auto_170419 ?auto_170420 ?auto_170421 ?auto_170422 ?auto_170423 ?auto_170424 ?auto_170425 )
      ( MAKE-9PILE ?auto_170418 ?auto_170419 ?auto_170420 ?auto_170421 ?auto_170422 ?auto_170423 ?auto_170424 ?auto_170425 ?auto_170426 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170437 - BLOCK
      ?auto_170438 - BLOCK
      ?auto_170439 - BLOCK
      ?auto_170440 - BLOCK
      ?auto_170441 - BLOCK
      ?auto_170442 - BLOCK
      ?auto_170443 - BLOCK
      ?auto_170444 - BLOCK
      ?auto_170445 - BLOCK
    )
    :vars
    (
      ?auto_170446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170445 ?auto_170446 ) ( ON-TABLE ?auto_170437 ) ( ON ?auto_170438 ?auto_170437 ) ( ON ?auto_170439 ?auto_170438 ) ( ON ?auto_170440 ?auto_170439 ) ( ON ?auto_170441 ?auto_170440 ) ( ON ?auto_170442 ?auto_170441 ) ( ON ?auto_170443 ?auto_170442 ) ( not ( = ?auto_170437 ?auto_170438 ) ) ( not ( = ?auto_170437 ?auto_170439 ) ) ( not ( = ?auto_170437 ?auto_170440 ) ) ( not ( = ?auto_170437 ?auto_170441 ) ) ( not ( = ?auto_170437 ?auto_170442 ) ) ( not ( = ?auto_170437 ?auto_170443 ) ) ( not ( = ?auto_170437 ?auto_170444 ) ) ( not ( = ?auto_170437 ?auto_170445 ) ) ( not ( = ?auto_170437 ?auto_170446 ) ) ( not ( = ?auto_170438 ?auto_170439 ) ) ( not ( = ?auto_170438 ?auto_170440 ) ) ( not ( = ?auto_170438 ?auto_170441 ) ) ( not ( = ?auto_170438 ?auto_170442 ) ) ( not ( = ?auto_170438 ?auto_170443 ) ) ( not ( = ?auto_170438 ?auto_170444 ) ) ( not ( = ?auto_170438 ?auto_170445 ) ) ( not ( = ?auto_170438 ?auto_170446 ) ) ( not ( = ?auto_170439 ?auto_170440 ) ) ( not ( = ?auto_170439 ?auto_170441 ) ) ( not ( = ?auto_170439 ?auto_170442 ) ) ( not ( = ?auto_170439 ?auto_170443 ) ) ( not ( = ?auto_170439 ?auto_170444 ) ) ( not ( = ?auto_170439 ?auto_170445 ) ) ( not ( = ?auto_170439 ?auto_170446 ) ) ( not ( = ?auto_170440 ?auto_170441 ) ) ( not ( = ?auto_170440 ?auto_170442 ) ) ( not ( = ?auto_170440 ?auto_170443 ) ) ( not ( = ?auto_170440 ?auto_170444 ) ) ( not ( = ?auto_170440 ?auto_170445 ) ) ( not ( = ?auto_170440 ?auto_170446 ) ) ( not ( = ?auto_170441 ?auto_170442 ) ) ( not ( = ?auto_170441 ?auto_170443 ) ) ( not ( = ?auto_170441 ?auto_170444 ) ) ( not ( = ?auto_170441 ?auto_170445 ) ) ( not ( = ?auto_170441 ?auto_170446 ) ) ( not ( = ?auto_170442 ?auto_170443 ) ) ( not ( = ?auto_170442 ?auto_170444 ) ) ( not ( = ?auto_170442 ?auto_170445 ) ) ( not ( = ?auto_170442 ?auto_170446 ) ) ( not ( = ?auto_170443 ?auto_170444 ) ) ( not ( = ?auto_170443 ?auto_170445 ) ) ( not ( = ?auto_170443 ?auto_170446 ) ) ( not ( = ?auto_170444 ?auto_170445 ) ) ( not ( = ?auto_170444 ?auto_170446 ) ) ( not ( = ?auto_170445 ?auto_170446 ) ) ( CLEAR ?auto_170443 ) ( ON ?auto_170444 ?auto_170445 ) ( CLEAR ?auto_170444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170437 ?auto_170438 ?auto_170439 ?auto_170440 ?auto_170441 ?auto_170442 ?auto_170443 ?auto_170444 )
      ( MAKE-9PILE ?auto_170437 ?auto_170438 ?auto_170439 ?auto_170440 ?auto_170441 ?auto_170442 ?auto_170443 ?auto_170444 ?auto_170445 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170456 - BLOCK
      ?auto_170457 - BLOCK
      ?auto_170458 - BLOCK
      ?auto_170459 - BLOCK
      ?auto_170460 - BLOCK
      ?auto_170461 - BLOCK
      ?auto_170462 - BLOCK
      ?auto_170463 - BLOCK
      ?auto_170464 - BLOCK
    )
    :vars
    (
      ?auto_170465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170464 ?auto_170465 ) ( ON-TABLE ?auto_170456 ) ( ON ?auto_170457 ?auto_170456 ) ( ON ?auto_170458 ?auto_170457 ) ( ON ?auto_170459 ?auto_170458 ) ( ON ?auto_170460 ?auto_170459 ) ( ON ?auto_170461 ?auto_170460 ) ( not ( = ?auto_170456 ?auto_170457 ) ) ( not ( = ?auto_170456 ?auto_170458 ) ) ( not ( = ?auto_170456 ?auto_170459 ) ) ( not ( = ?auto_170456 ?auto_170460 ) ) ( not ( = ?auto_170456 ?auto_170461 ) ) ( not ( = ?auto_170456 ?auto_170462 ) ) ( not ( = ?auto_170456 ?auto_170463 ) ) ( not ( = ?auto_170456 ?auto_170464 ) ) ( not ( = ?auto_170456 ?auto_170465 ) ) ( not ( = ?auto_170457 ?auto_170458 ) ) ( not ( = ?auto_170457 ?auto_170459 ) ) ( not ( = ?auto_170457 ?auto_170460 ) ) ( not ( = ?auto_170457 ?auto_170461 ) ) ( not ( = ?auto_170457 ?auto_170462 ) ) ( not ( = ?auto_170457 ?auto_170463 ) ) ( not ( = ?auto_170457 ?auto_170464 ) ) ( not ( = ?auto_170457 ?auto_170465 ) ) ( not ( = ?auto_170458 ?auto_170459 ) ) ( not ( = ?auto_170458 ?auto_170460 ) ) ( not ( = ?auto_170458 ?auto_170461 ) ) ( not ( = ?auto_170458 ?auto_170462 ) ) ( not ( = ?auto_170458 ?auto_170463 ) ) ( not ( = ?auto_170458 ?auto_170464 ) ) ( not ( = ?auto_170458 ?auto_170465 ) ) ( not ( = ?auto_170459 ?auto_170460 ) ) ( not ( = ?auto_170459 ?auto_170461 ) ) ( not ( = ?auto_170459 ?auto_170462 ) ) ( not ( = ?auto_170459 ?auto_170463 ) ) ( not ( = ?auto_170459 ?auto_170464 ) ) ( not ( = ?auto_170459 ?auto_170465 ) ) ( not ( = ?auto_170460 ?auto_170461 ) ) ( not ( = ?auto_170460 ?auto_170462 ) ) ( not ( = ?auto_170460 ?auto_170463 ) ) ( not ( = ?auto_170460 ?auto_170464 ) ) ( not ( = ?auto_170460 ?auto_170465 ) ) ( not ( = ?auto_170461 ?auto_170462 ) ) ( not ( = ?auto_170461 ?auto_170463 ) ) ( not ( = ?auto_170461 ?auto_170464 ) ) ( not ( = ?auto_170461 ?auto_170465 ) ) ( not ( = ?auto_170462 ?auto_170463 ) ) ( not ( = ?auto_170462 ?auto_170464 ) ) ( not ( = ?auto_170462 ?auto_170465 ) ) ( not ( = ?auto_170463 ?auto_170464 ) ) ( not ( = ?auto_170463 ?auto_170465 ) ) ( not ( = ?auto_170464 ?auto_170465 ) ) ( ON ?auto_170463 ?auto_170464 ) ( CLEAR ?auto_170461 ) ( ON ?auto_170462 ?auto_170463 ) ( CLEAR ?auto_170462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170456 ?auto_170457 ?auto_170458 ?auto_170459 ?auto_170460 ?auto_170461 ?auto_170462 )
      ( MAKE-9PILE ?auto_170456 ?auto_170457 ?auto_170458 ?auto_170459 ?auto_170460 ?auto_170461 ?auto_170462 ?auto_170463 ?auto_170464 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170475 - BLOCK
      ?auto_170476 - BLOCK
      ?auto_170477 - BLOCK
      ?auto_170478 - BLOCK
      ?auto_170479 - BLOCK
      ?auto_170480 - BLOCK
      ?auto_170481 - BLOCK
      ?auto_170482 - BLOCK
      ?auto_170483 - BLOCK
    )
    :vars
    (
      ?auto_170484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170483 ?auto_170484 ) ( ON-TABLE ?auto_170475 ) ( ON ?auto_170476 ?auto_170475 ) ( ON ?auto_170477 ?auto_170476 ) ( ON ?auto_170478 ?auto_170477 ) ( ON ?auto_170479 ?auto_170478 ) ( ON ?auto_170480 ?auto_170479 ) ( not ( = ?auto_170475 ?auto_170476 ) ) ( not ( = ?auto_170475 ?auto_170477 ) ) ( not ( = ?auto_170475 ?auto_170478 ) ) ( not ( = ?auto_170475 ?auto_170479 ) ) ( not ( = ?auto_170475 ?auto_170480 ) ) ( not ( = ?auto_170475 ?auto_170481 ) ) ( not ( = ?auto_170475 ?auto_170482 ) ) ( not ( = ?auto_170475 ?auto_170483 ) ) ( not ( = ?auto_170475 ?auto_170484 ) ) ( not ( = ?auto_170476 ?auto_170477 ) ) ( not ( = ?auto_170476 ?auto_170478 ) ) ( not ( = ?auto_170476 ?auto_170479 ) ) ( not ( = ?auto_170476 ?auto_170480 ) ) ( not ( = ?auto_170476 ?auto_170481 ) ) ( not ( = ?auto_170476 ?auto_170482 ) ) ( not ( = ?auto_170476 ?auto_170483 ) ) ( not ( = ?auto_170476 ?auto_170484 ) ) ( not ( = ?auto_170477 ?auto_170478 ) ) ( not ( = ?auto_170477 ?auto_170479 ) ) ( not ( = ?auto_170477 ?auto_170480 ) ) ( not ( = ?auto_170477 ?auto_170481 ) ) ( not ( = ?auto_170477 ?auto_170482 ) ) ( not ( = ?auto_170477 ?auto_170483 ) ) ( not ( = ?auto_170477 ?auto_170484 ) ) ( not ( = ?auto_170478 ?auto_170479 ) ) ( not ( = ?auto_170478 ?auto_170480 ) ) ( not ( = ?auto_170478 ?auto_170481 ) ) ( not ( = ?auto_170478 ?auto_170482 ) ) ( not ( = ?auto_170478 ?auto_170483 ) ) ( not ( = ?auto_170478 ?auto_170484 ) ) ( not ( = ?auto_170479 ?auto_170480 ) ) ( not ( = ?auto_170479 ?auto_170481 ) ) ( not ( = ?auto_170479 ?auto_170482 ) ) ( not ( = ?auto_170479 ?auto_170483 ) ) ( not ( = ?auto_170479 ?auto_170484 ) ) ( not ( = ?auto_170480 ?auto_170481 ) ) ( not ( = ?auto_170480 ?auto_170482 ) ) ( not ( = ?auto_170480 ?auto_170483 ) ) ( not ( = ?auto_170480 ?auto_170484 ) ) ( not ( = ?auto_170481 ?auto_170482 ) ) ( not ( = ?auto_170481 ?auto_170483 ) ) ( not ( = ?auto_170481 ?auto_170484 ) ) ( not ( = ?auto_170482 ?auto_170483 ) ) ( not ( = ?auto_170482 ?auto_170484 ) ) ( not ( = ?auto_170483 ?auto_170484 ) ) ( ON ?auto_170482 ?auto_170483 ) ( CLEAR ?auto_170480 ) ( ON ?auto_170481 ?auto_170482 ) ( CLEAR ?auto_170481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170475 ?auto_170476 ?auto_170477 ?auto_170478 ?auto_170479 ?auto_170480 ?auto_170481 )
      ( MAKE-9PILE ?auto_170475 ?auto_170476 ?auto_170477 ?auto_170478 ?auto_170479 ?auto_170480 ?auto_170481 ?auto_170482 ?auto_170483 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170494 - BLOCK
      ?auto_170495 - BLOCK
      ?auto_170496 - BLOCK
      ?auto_170497 - BLOCK
      ?auto_170498 - BLOCK
      ?auto_170499 - BLOCK
      ?auto_170500 - BLOCK
      ?auto_170501 - BLOCK
      ?auto_170502 - BLOCK
    )
    :vars
    (
      ?auto_170503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170502 ?auto_170503 ) ( ON-TABLE ?auto_170494 ) ( ON ?auto_170495 ?auto_170494 ) ( ON ?auto_170496 ?auto_170495 ) ( ON ?auto_170497 ?auto_170496 ) ( ON ?auto_170498 ?auto_170497 ) ( not ( = ?auto_170494 ?auto_170495 ) ) ( not ( = ?auto_170494 ?auto_170496 ) ) ( not ( = ?auto_170494 ?auto_170497 ) ) ( not ( = ?auto_170494 ?auto_170498 ) ) ( not ( = ?auto_170494 ?auto_170499 ) ) ( not ( = ?auto_170494 ?auto_170500 ) ) ( not ( = ?auto_170494 ?auto_170501 ) ) ( not ( = ?auto_170494 ?auto_170502 ) ) ( not ( = ?auto_170494 ?auto_170503 ) ) ( not ( = ?auto_170495 ?auto_170496 ) ) ( not ( = ?auto_170495 ?auto_170497 ) ) ( not ( = ?auto_170495 ?auto_170498 ) ) ( not ( = ?auto_170495 ?auto_170499 ) ) ( not ( = ?auto_170495 ?auto_170500 ) ) ( not ( = ?auto_170495 ?auto_170501 ) ) ( not ( = ?auto_170495 ?auto_170502 ) ) ( not ( = ?auto_170495 ?auto_170503 ) ) ( not ( = ?auto_170496 ?auto_170497 ) ) ( not ( = ?auto_170496 ?auto_170498 ) ) ( not ( = ?auto_170496 ?auto_170499 ) ) ( not ( = ?auto_170496 ?auto_170500 ) ) ( not ( = ?auto_170496 ?auto_170501 ) ) ( not ( = ?auto_170496 ?auto_170502 ) ) ( not ( = ?auto_170496 ?auto_170503 ) ) ( not ( = ?auto_170497 ?auto_170498 ) ) ( not ( = ?auto_170497 ?auto_170499 ) ) ( not ( = ?auto_170497 ?auto_170500 ) ) ( not ( = ?auto_170497 ?auto_170501 ) ) ( not ( = ?auto_170497 ?auto_170502 ) ) ( not ( = ?auto_170497 ?auto_170503 ) ) ( not ( = ?auto_170498 ?auto_170499 ) ) ( not ( = ?auto_170498 ?auto_170500 ) ) ( not ( = ?auto_170498 ?auto_170501 ) ) ( not ( = ?auto_170498 ?auto_170502 ) ) ( not ( = ?auto_170498 ?auto_170503 ) ) ( not ( = ?auto_170499 ?auto_170500 ) ) ( not ( = ?auto_170499 ?auto_170501 ) ) ( not ( = ?auto_170499 ?auto_170502 ) ) ( not ( = ?auto_170499 ?auto_170503 ) ) ( not ( = ?auto_170500 ?auto_170501 ) ) ( not ( = ?auto_170500 ?auto_170502 ) ) ( not ( = ?auto_170500 ?auto_170503 ) ) ( not ( = ?auto_170501 ?auto_170502 ) ) ( not ( = ?auto_170501 ?auto_170503 ) ) ( not ( = ?auto_170502 ?auto_170503 ) ) ( ON ?auto_170501 ?auto_170502 ) ( ON ?auto_170500 ?auto_170501 ) ( CLEAR ?auto_170498 ) ( ON ?auto_170499 ?auto_170500 ) ( CLEAR ?auto_170499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170494 ?auto_170495 ?auto_170496 ?auto_170497 ?auto_170498 ?auto_170499 )
      ( MAKE-9PILE ?auto_170494 ?auto_170495 ?auto_170496 ?auto_170497 ?auto_170498 ?auto_170499 ?auto_170500 ?auto_170501 ?auto_170502 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170513 - BLOCK
      ?auto_170514 - BLOCK
      ?auto_170515 - BLOCK
      ?auto_170516 - BLOCK
      ?auto_170517 - BLOCK
      ?auto_170518 - BLOCK
      ?auto_170519 - BLOCK
      ?auto_170520 - BLOCK
      ?auto_170521 - BLOCK
    )
    :vars
    (
      ?auto_170522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170521 ?auto_170522 ) ( ON-TABLE ?auto_170513 ) ( ON ?auto_170514 ?auto_170513 ) ( ON ?auto_170515 ?auto_170514 ) ( ON ?auto_170516 ?auto_170515 ) ( ON ?auto_170517 ?auto_170516 ) ( not ( = ?auto_170513 ?auto_170514 ) ) ( not ( = ?auto_170513 ?auto_170515 ) ) ( not ( = ?auto_170513 ?auto_170516 ) ) ( not ( = ?auto_170513 ?auto_170517 ) ) ( not ( = ?auto_170513 ?auto_170518 ) ) ( not ( = ?auto_170513 ?auto_170519 ) ) ( not ( = ?auto_170513 ?auto_170520 ) ) ( not ( = ?auto_170513 ?auto_170521 ) ) ( not ( = ?auto_170513 ?auto_170522 ) ) ( not ( = ?auto_170514 ?auto_170515 ) ) ( not ( = ?auto_170514 ?auto_170516 ) ) ( not ( = ?auto_170514 ?auto_170517 ) ) ( not ( = ?auto_170514 ?auto_170518 ) ) ( not ( = ?auto_170514 ?auto_170519 ) ) ( not ( = ?auto_170514 ?auto_170520 ) ) ( not ( = ?auto_170514 ?auto_170521 ) ) ( not ( = ?auto_170514 ?auto_170522 ) ) ( not ( = ?auto_170515 ?auto_170516 ) ) ( not ( = ?auto_170515 ?auto_170517 ) ) ( not ( = ?auto_170515 ?auto_170518 ) ) ( not ( = ?auto_170515 ?auto_170519 ) ) ( not ( = ?auto_170515 ?auto_170520 ) ) ( not ( = ?auto_170515 ?auto_170521 ) ) ( not ( = ?auto_170515 ?auto_170522 ) ) ( not ( = ?auto_170516 ?auto_170517 ) ) ( not ( = ?auto_170516 ?auto_170518 ) ) ( not ( = ?auto_170516 ?auto_170519 ) ) ( not ( = ?auto_170516 ?auto_170520 ) ) ( not ( = ?auto_170516 ?auto_170521 ) ) ( not ( = ?auto_170516 ?auto_170522 ) ) ( not ( = ?auto_170517 ?auto_170518 ) ) ( not ( = ?auto_170517 ?auto_170519 ) ) ( not ( = ?auto_170517 ?auto_170520 ) ) ( not ( = ?auto_170517 ?auto_170521 ) ) ( not ( = ?auto_170517 ?auto_170522 ) ) ( not ( = ?auto_170518 ?auto_170519 ) ) ( not ( = ?auto_170518 ?auto_170520 ) ) ( not ( = ?auto_170518 ?auto_170521 ) ) ( not ( = ?auto_170518 ?auto_170522 ) ) ( not ( = ?auto_170519 ?auto_170520 ) ) ( not ( = ?auto_170519 ?auto_170521 ) ) ( not ( = ?auto_170519 ?auto_170522 ) ) ( not ( = ?auto_170520 ?auto_170521 ) ) ( not ( = ?auto_170520 ?auto_170522 ) ) ( not ( = ?auto_170521 ?auto_170522 ) ) ( ON ?auto_170520 ?auto_170521 ) ( ON ?auto_170519 ?auto_170520 ) ( CLEAR ?auto_170517 ) ( ON ?auto_170518 ?auto_170519 ) ( CLEAR ?auto_170518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170513 ?auto_170514 ?auto_170515 ?auto_170516 ?auto_170517 ?auto_170518 )
      ( MAKE-9PILE ?auto_170513 ?auto_170514 ?auto_170515 ?auto_170516 ?auto_170517 ?auto_170518 ?auto_170519 ?auto_170520 ?auto_170521 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170532 - BLOCK
      ?auto_170533 - BLOCK
      ?auto_170534 - BLOCK
      ?auto_170535 - BLOCK
      ?auto_170536 - BLOCK
      ?auto_170537 - BLOCK
      ?auto_170538 - BLOCK
      ?auto_170539 - BLOCK
      ?auto_170540 - BLOCK
    )
    :vars
    (
      ?auto_170541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170540 ?auto_170541 ) ( ON-TABLE ?auto_170532 ) ( ON ?auto_170533 ?auto_170532 ) ( ON ?auto_170534 ?auto_170533 ) ( ON ?auto_170535 ?auto_170534 ) ( not ( = ?auto_170532 ?auto_170533 ) ) ( not ( = ?auto_170532 ?auto_170534 ) ) ( not ( = ?auto_170532 ?auto_170535 ) ) ( not ( = ?auto_170532 ?auto_170536 ) ) ( not ( = ?auto_170532 ?auto_170537 ) ) ( not ( = ?auto_170532 ?auto_170538 ) ) ( not ( = ?auto_170532 ?auto_170539 ) ) ( not ( = ?auto_170532 ?auto_170540 ) ) ( not ( = ?auto_170532 ?auto_170541 ) ) ( not ( = ?auto_170533 ?auto_170534 ) ) ( not ( = ?auto_170533 ?auto_170535 ) ) ( not ( = ?auto_170533 ?auto_170536 ) ) ( not ( = ?auto_170533 ?auto_170537 ) ) ( not ( = ?auto_170533 ?auto_170538 ) ) ( not ( = ?auto_170533 ?auto_170539 ) ) ( not ( = ?auto_170533 ?auto_170540 ) ) ( not ( = ?auto_170533 ?auto_170541 ) ) ( not ( = ?auto_170534 ?auto_170535 ) ) ( not ( = ?auto_170534 ?auto_170536 ) ) ( not ( = ?auto_170534 ?auto_170537 ) ) ( not ( = ?auto_170534 ?auto_170538 ) ) ( not ( = ?auto_170534 ?auto_170539 ) ) ( not ( = ?auto_170534 ?auto_170540 ) ) ( not ( = ?auto_170534 ?auto_170541 ) ) ( not ( = ?auto_170535 ?auto_170536 ) ) ( not ( = ?auto_170535 ?auto_170537 ) ) ( not ( = ?auto_170535 ?auto_170538 ) ) ( not ( = ?auto_170535 ?auto_170539 ) ) ( not ( = ?auto_170535 ?auto_170540 ) ) ( not ( = ?auto_170535 ?auto_170541 ) ) ( not ( = ?auto_170536 ?auto_170537 ) ) ( not ( = ?auto_170536 ?auto_170538 ) ) ( not ( = ?auto_170536 ?auto_170539 ) ) ( not ( = ?auto_170536 ?auto_170540 ) ) ( not ( = ?auto_170536 ?auto_170541 ) ) ( not ( = ?auto_170537 ?auto_170538 ) ) ( not ( = ?auto_170537 ?auto_170539 ) ) ( not ( = ?auto_170537 ?auto_170540 ) ) ( not ( = ?auto_170537 ?auto_170541 ) ) ( not ( = ?auto_170538 ?auto_170539 ) ) ( not ( = ?auto_170538 ?auto_170540 ) ) ( not ( = ?auto_170538 ?auto_170541 ) ) ( not ( = ?auto_170539 ?auto_170540 ) ) ( not ( = ?auto_170539 ?auto_170541 ) ) ( not ( = ?auto_170540 ?auto_170541 ) ) ( ON ?auto_170539 ?auto_170540 ) ( ON ?auto_170538 ?auto_170539 ) ( ON ?auto_170537 ?auto_170538 ) ( CLEAR ?auto_170535 ) ( ON ?auto_170536 ?auto_170537 ) ( CLEAR ?auto_170536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170532 ?auto_170533 ?auto_170534 ?auto_170535 ?auto_170536 )
      ( MAKE-9PILE ?auto_170532 ?auto_170533 ?auto_170534 ?auto_170535 ?auto_170536 ?auto_170537 ?auto_170538 ?auto_170539 ?auto_170540 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170551 - BLOCK
      ?auto_170552 - BLOCK
      ?auto_170553 - BLOCK
      ?auto_170554 - BLOCK
      ?auto_170555 - BLOCK
      ?auto_170556 - BLOCK
      ?auto_170557 - BLOCK
      ?auto_170558 - BLOCK
      ?auto_170559 - BLOCK
    )
    :vars
    (
      ?auto_170560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170559 ?auto_170560 ) ( ON-TABLE ?auto_170551 ) ( ON ?auto_170552 ?auto_170551 ) ( ON ?auto_170553 ?auto_170552 ) ( ON ?auto_170554 ?auto_170553 ) ( not ( = ?auto_170551 ?auto_170552 ) ) ( not ( = ?auto_170551 ?auto_170553 ) ) ( not ( = ?auto_170551 ?auto_170554 ) ) ( not ( = ?auto_170551 ?auto_170555 ) ) ( not ( = ?auto_170551 ?auto_170556 ) ) ( not ( = ?auto_170551 ?auto_170557 ) ) ( not ( = ?auto_170551 ?auto_170558 ) ) ( not ( = ?auto_170551 ?auto_170559 ) ) ( not ( = ?auto_170551 ?auto_170560 ) ) ( not ( = ?auto_170552 ?auto_170553 ) ) ( not ( = ?auto_170552 ?auto_170554 ) ) ( not ( = ?auto_170552 ?auto_170555 ) ) ( not ( = ?auto_170552 ?auto_170556 ) ) ( not ( = ?auto_170552 ?auto_170557 ) ) ( not ( = ?auto_170552 ?auto_170558 ) ) ( not ( = ?auto_170552 ?auto_170559 ) ) ( not ( = ?auto_170552 ?auto_170560 ) ) ( not ( = ?auto_170553 ?auto_170554 ) ) ( not ( = ?auto_170553 ?auto_170555 ) ) ( not ( = ?auto_170553 ?auto_170556 ) ) ( not ( = ?auto_170553 ?auto_170557 ) ) ( not ( = ?auto_170553 ?auto_170558 ) ) ( not ( = ?auto_170553 ?auto_170559 ) ) ( not ( = ?auto_170553 ?auto_170560 ) ) ( not ( = ?auto_170554 ?auto_170555 ) ) ( not ( = ?auto_170554 ?auto_170556 ) ) ( not ( = ?auto_170554 ?auto_170557 ) ) ( not ( = ?auto_170554 ?auto_170558 ) ) ( not ( = ?auto_170554 ?auto_170559 ) ) ( not ( = ?auto_170554 ?auto_170560 ) ) ( not ( = ?auto_170555 ?auto_170556 ) ) ( not ( = ?auto_170555 ?auto_170557 ) ) ( not ( = ?auto_170555 ?auto_170558 ) ) ( not ( = ?auto_170555 ?auto_170559 ) ) ( not ( = ?auto_170555 ?auto_170560 ) ) ( not ( = ?auto_170556 ?auto_170557 ) ) ( not ( = ?auto_170556 ?auto_170558 ) ) ( not ( = ?auto_170556 ?auto_170559 ) ) ( not ( = ?auto_170556 ?auto_170560 ) ) ( not ( = ?auto_170557 ?auto_170558 ) ) ( not ( = ?auto_170557 ?auto_170559 ) ) ( not ( = ?auto_170557 ?auto_170560 ) ) ( not ( = ?auto_170558 ?auto_170559 ) ) ( not ( = ?auto_170558 ?auto_170560 ) ) ( not ( = ?auto_170559 ?auto_170560 ) ) ( ON ?auto_170558 ?auto_170559 ) ( ON ?auto_170557 ?auto_170558 ) ( ON ?auto_170556 ?auto_170557 ) ( CLEAR ?auto_170554 ) ( ON ?auto_170555 ?auto_170556 ) ( CLEAR ?auto_170555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170551 ?auto_170552 ?auto_170553 ?auto_170554 ?auto_170555 )
      ( MAKE-9PILE ?auto_170551 ?auto_170552 ?auto_170553 ?auto_170554 ?auto_170555 ?auto_170556 ?auto_170557 ?auto_170558 ?auto_170559 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170570 - BLOCK
      ?auto_170571 - BLOCK
      ?auto_170572 - BLOCK
      ?auto_170573 - BLOCK
      ?auto_170574 - BLOCK
      ?auto_170575 - BLOCK
      ?auto_170576 - BLOCK
      ?auto_170577 - BLOCK
      ?auto_170578 - BLOCK
    )
    :vars
    (
      ?auto_170579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170578 ?auto_170579 ) ( ON-TABLE ?auto_170570 ) ( ON ?auto_170571 ?auto_170570 ) ( ON ?auto_170572 ?auto_170571 ) ( not ( = ?auto_170570 ?auto_170571 ) ) ( not ( = ?auto_170570 ?auto_170572 ) ) ( not ( = ?auto_170570 ?auto_170573 ) ) ( not ( = ?auto_170570 ?auto_170574 ) ) ( not ( = ?auto_170570 ?auto_170575 ) ) ( not ( = ?auto_170570 ?auto_170576 ) ) ( not ( = ?auto_170570 ?auto_170577 ) ) ( not ( = ?auto_170570 ?auto_170578 ) ) ( not ( = ?auto_170570 ?auto_170579 ) ) ( not ( = ?auto_170571 ?auto_170572 ) ) ( not ( = ?auto_170571 ?auto_170573 ) ) ( not ( = ?auto_170571 ?auto_170574 ) ) ( not ( = ?auto_170571 ?auto_170575 ) ) ( not ( = ?auto_170571 ?auto_170576 ) ) ( not ( = ?auto_170571 ?auto_170577 ) ) ( not ( = ?auto_170571 ?auto_170578 ) ) ( not ( = ?auto_170571 ?auto_170579 ) ) ( not ( = ?auto_170572 ?auto_170573 ) ) ( not ( = ?auto_170572 ?auto_170574 ) ) ( not ( = ?auto_170572 ?auto_170575 ) ) ( not ( = ?auto_170572 ?auto_170576 ) ) ( not ( = ?auto_170572 ?auto_170577 ) ) ( not ( = ?auto_170572 ?auto_170578 ) ) ( not ( = ?auto_170572 ?auto_170579 ) ) ( not ( = ?auto_170573 ?auto_170574 ) ) ( not ( = ?auto_170573 ?auto_170575 ) ) ( not ( = ?auto_170573 ?auto_170576 ) ) ( not ( = ?auto_170573 ?auto_170577 ) ) ( not ( = ?auto_170573 ?auto_170578 ) ) ( not ( = ?auto_170573 ?auto_170579 ) ) ( not ( = ?auto_170574 ?auto_170575 ) ) ( not ( = ?auto_170574 ?auto_170576 ) ) ( not ( = ?auto_170574 ?auto_170577 ) ) ( not ( = ?auto_170574 ?auto_170578 ) ) ( not ( = ?auto_170574 ?auto_170579 ) ) ( not ( = ?auto_170575 ?auto_170576 ) ) ( not ( = ?auto_170575 ?auto_170577 ) ) ( not ( = ?auto_170575 ?auto_170578 ) ) ( not ( = ?auto_170575 ?auto_170579 ) ) ( not ( = ?auto_170576 ?auto_170577 ) ) ( not ( = ?auto_170576 ?auto_170578 ) ) ( not ( = ?auto_170576 ?auto_170579 ) ) ( not ( = ?auto_170577 ?auto_170578 ) ) ( not ( = ?auto_170577 ?auto_170579 ) ) ( not ( = ?auto_170578 ?auto_170579 ) ) ( ON ?auto_170577 ?auto_170578 ) ( ON ?auto_170576 ?auto_170577 ) ( ON ?auto_170575 ?auto_170576 ) ( ON ?auto_170574 ?auto_170575 ) ( CLEAR ?auto_170572 ) ( ON ?auto_170573 ?auto_170574 ) ( CLEAR ?auto_170573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170570 ?auto_170571 ?auto_170572 ?auto_170573 )
      ( MAKE-9PILE ?auto_170570 ?auto_170571 ?auto_170572 ?auto_170573 ?auto_170574 ?auto_170575 ?auto_170576 ?auto_170577 ?auto_170578 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170589 - BLOCK
      ?auto_170590 - BLOCK
      ?auto_170591 - BLOCK
      ?auto_170592 - BLOCK
      ?auto_170593 - BLOCK
      ?auto_170594 - BLOCK
      ?auto_170595 - BLOCK
      ?auto_170596 - BLOCK
      ?auto_170597 - BLOCK
    )
    :vars
    (
      ?auto_170598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170597 ?auto_170598 ) ( ON-TABLE ?auto_170589 ) ( ON ?auto_170590 ?auto_170589 ) ( ON ?auto_170591 ?auto_170590 ) ( not ( = ?auto_170589 ?auto_170590 ) ) ( not ( = ?auto_170589 ?auto_170591 ) ) ( not ( = ?auto_170589 ?auto_170592 ) ) ( not ( = ?auto_170589 ?auto_170593 ) ) ( not ( = ?auto_170589 ?auto_170594 ) ) ( not ( = ?auto_170589 ?auto_170595 ) ) ( not ( = ?auto_170589 ?auto_170596 ) ) ( not ( = ?auto_170589 ?auto_170597 ) ) ( not ( = ?auto_170589 ?auto_170598 ) ) ( not ( = ?auto_170590 ?auto_170591 ) ) ( not ( = ?auto_170590 ?auto_170592 ) ) ( not ( = ?auto_170590 ?auto_170593 ) ) ( not ( = ?auto_170590 ?auto_170594 ) ) ( not ( = ?auto_170590 ?auto_170595 ) ) ( not ( = ?auto_170590 ?auto_170596 ) ) ( not ( = ?auto_170590 ?auto_170597 ) ) ( not ( = ?auto_170590 ?auto_170598 ) ) ( not ( = ?auto_170591 ?auto_170592 ) ) ( not ( = ?auto_170591 ?auto_170593 ) ) ( not ( = ?auto_170591 ?auto_170594 ) ) ( not ( = ?auto_170591 ?auto_170595 ) ) ( not ( = ?auto_170591 ?auto_170596 ) ) ( not ( = ?auto_170591 ?auto_170597 ) ) ( not ( = ?auto_170591 ?auto_170598 ) ) ( not ( = ?auto_170592 ?auto_170593 ) ) ( not ( = ?auto_170592 ?auto_170594 ) ) ( not ( = ?auto_170592 ?auto_170595 ) ) ( not ( = ?auto_170592 ?auto_170596 ) ) ( not ( = ?auto_170592 ?auto_170597 ) ) ( not ( = ?auto_170592 ?auto_170598 ) ) ( not ( = ?auto_170593 ?auto_170594 ) ) ( not ( = ?auto_170593 ?auto_170595 ) ) ( not ( = ?auto_170593 ?auto_170596 ) ) ( not ( = ?auto_170593 ?auto_170597 ) ) ( not ( = ?auto_170593 ?auto_170598 ) ) ( not ( = ?auto_170594 ?auto_170595 ) ) ( not ( = ?auto_170594 ?auto_170596 ) ) ( not ( = ?auto_170594 ?auto_170597 ) ) ( not ( = ?auto_170594 ?auto_170598 ) ) ( not ( = ?auto_170595 ?auto_170596 ) ) ( not ( = ?auto_170595 ?auto_170597 ) ) ( not ( = ?auto_170595 ?auto_170598 ) ) ( not ( = ?auto_170596 ?auto_170597 ) ) ( not ( = ?auto_170596 ?auto_170598 ) ) ( not ( = ?auto_170597 ?auto_170598 ) ) ( ON ?auto_170596 ?auto_170597 ) ( ON ?auto_170595 ?auto_170596 ) ( ON ?auto_170594 ?auto_170595 ) ( ON ?auto_170593 ?auto_170594 ) ( CLEAR ?auto_170591 ) ( ON ?auto_170592 ?auto_170593 ) ( CLEAR ?auto_170592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170589 ?auto_170590 ?auto_170591 ?auto_170592 )
      ( MAKE-9PILE ?auto_170589 ?auto_170590 ?auto_170591 ?auto_170592 ?auto_170593 ?auto_170594 ?auto_170595 ?auto_170596 ?auto_170597 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170608 - BLOCK
      ?auto_170609 - BLOCK
      ?auto_170610 - BLOCK
      ?auto_170611 - BLOCK
      ?auto_170612 - BLOCK
      ?auto_170613 - BLOCK
      ?auto_170614 - BLOCK
      ?auto_170615 - BLOCK
      ?auto_170616 - BLOCK
    )
    :vars
    (
      ?auto_170617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170616 ?auto_170617 ) ( ON-TABLE ?auto_170608 ) ( ON ?auto_170609 ?auto_170608 ) ( not ( = ?auto_170608 ?auto_170609 ) ) ( not ( = ?auto_170608 ?auto_170610 ) ) ( not ( = ?auto_170608 ?auto_170611 ) ) ( not ( = ?auto_170608 ?auto_170612 ) ) ( not ( = ?auto_170608 ?auto_170613 ) ) ( not ( = ?auto_170608 ?auto_170614 ) ) ( not ( = ?auto_170608 ?auto_170615 ) ) ( not ( = ?auto_170608 ?auto_170616 ) ) ( not ( = ?auto_170608 ?auto_170617 ) ) ( not ( = ?auto_170609 ?auto_170610 ) ) ( not ( = ?auto_170609 ?auto_170611 ) ) ( not ( = ?auto_170609 ?auto_170612 ) ) ( not ( = ?auto_170609 ?auto_170613 ) ) ( not ( = ?auto_170609 ?auto_170614 ) ) ( not ( = ?auto_170609 ?auto_170615 ) ) ( not ( = ?auto_170609 ?auto_170616 ) ) ( not ( = ?auto_170609 ?auto_170617 ) ) ( not ( = ?auto_170610 ?auto_170611 ) ) ( not ( = ?auto_170610 ?auto_170612 ) ) ( not ( = ?auto_170610 ?auto_170613 ) ) ( not ( = ?auto_170610 ?auto_170614 ) ) ( not ( = ?auto_170610 ?auto_170615 ) ) ( not ( = ?auto_170610 ?auto_170616 ) ) ( not ( = ?auto_170610 ?auto_170617 ) ) ( not ( = ?auto_170611 ?auto_170612 ) ) ( not ( = ?auto_170611 ?auto_170613 ) ) ( not ( = ?auto_170611 ?auto_170614 ) ) ( not ( = ?auto_170611 ?auto_170615 ) ) ( not ( = ?auto_170611 ?auto_170616 ) ) ( not ( = ?auto_170611 ?auto_170617 ) ) ( not ( = ?auto_170612 ?auto_170613 ) ) ( not ( = ?auto_170612 ?auto_170614 ) ) ( not ( = ?auto_170612 ?auto_170615 ) ) ( not ( = ?auto_170612 ?auto_170616 ) ) ( not ( = ?auto_170612 ?auto_170617 ) ) ( not ( = ?auto_170613 ?auto_170614 ) ) ( not ( = ?auto_170613 ?auto_170615 ) ) ( not ( = ?auto_170613 ?auto_170616 ) ) ( not ( = ?auto_170613 ?auto_170617 ) ) ( not ( = ?auto_170614 ?auto_170615 ) ) ( not ( = ?auto_170614 ?auto_170616 ) ) ( not ( = ?auto_170614 ?auto_170617 ) ) ( not ( = ?auto_170615 ?auto_170616 ) ) ( not ( = ?auto_170615 ?auto_170617 ) ) ( not ( = ?auto_170616 ?auto_170617 ) ) ( ON ?auto_170615 ?auto_170616 ) ( ON ?auto_170614 ?auto_170615 ) ( ON ?auto_170613 ?auto_170614 ) ( ON ?auto_170612 ?auto_170613 ) ( ON ?auto_170611 ?auto_170612 ) ( CLEAR ?auto_170609 ) ( ON ?auto_170610 ?auto_170611 ) ( CLEAR ?auto_170610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170608 ?auto_170609 ?auto_170610 )
      ( MAKE-9PILE ?auto_170608 ?auto_170609 ?auto_170610 ?auto_170611 ?auto_170612 ?auto_170613 ?auto_170614 ?auto_170615 ?auto_170616 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170627 - BLOCK
      ?auto_170628 - BLOCK
      ?auto_170629 - BLOCK
      ?auto_170630 - BLOCK
      ?auto_170631 - BLOCK
      ?auto_170632 - BLOCK
      ?auto_170633 - BLOCK
      ?auto_170634 - BLOCK
      ?auto_170635 - BLOCK
    )
    :vars
    (
      ?auto_170636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170635 ?auto_170636 ) ( ON-TABLE ?auto_170627 ) ( ON ?auto_170628 ?auto_170627 ) ( not ( = ?auto_170627 ?auto_170628 ) ) ( not ( = ?auto_170627 ?auto_170629 ) ) ( not ( = ?auto_170627 ?auto_170630 ) ) ( not ( = ?auto_170627 ?auto_170631 ) ) ( not ( = ?auto_170627 ?auto_170632 ) ) ( not ( = ?auto_170627 ?auto_170633 ) ) ( not ( = ?auto_170627 ?auto_170634 ) ) ( not ( = ?auto_170627 ?auto_170635 ) ) ( not ( = ?auto_170627 ?auto_170636 ) ) ( not ( = ?auto_170628 ?auto_170629 ) ) ( not ( = ?auto_170628 ?auto_170630 ) ) ( not ( = ?auto_170628 ?auto_170631 ) ) ( not ( = ?auto_170628 ?auto_170632 ) ) ( not ( = ?auto_170628 ?auto_170633 ) ) ( not ( = ?auto_170628 ?auto_170634 ) ) ( not ( = ?auto_170628 ?auto_170635 ) ) ( not ( = ?auto_170628 ?auto_170636 ) ) ( not ( = ?auto_170629 ?auto_170630 ) ) ( not ( = ?auto_170629 ?auto_170631 ) ) ( not ( = ?auto_170629 ?auto_170632 ) ) ( not ( = ?auto_170629 ?auto_170633 ) ) ( not ( = ?auto_170629 ?auto_170634 ) ) ( not ( = ?auto_170629 ?auto_170635 ) ) ( not ( = ?auto_170629 ?auto_170636 ) ) ( not ( = ?auto_170630 ?auto_170631 ) ) ( not ( = ?auto_170630 ?auto_170632 ) ) ( not ( = ?auto_170630 ?auto_170633 ) ) ( not ( = ?auto_170630 ?auto_170634 ) ) ( not ( = ?auto_170630 ?auto_170635 ) ) ( not ( = ?auto_170630 ?auto_170636 ) ) ( not ( = ?auto_170631 ?auto_170632 ) ) ( not ( = ?auto_170631 ?auto_170633 ) ) ( not ( = ?auto_170631 ?auto_170634 ) ) ( not ( = ?auto_170631 ?auto_170635 ) ) ( not ( = ?auto_170631 ?auto_170636 ) ) ( not ( = ?auto_170632 ?auto_170633 ) ) ( not ( = ?auto_170632 ?auto_170634 ) ) ( not ( = ?auto_170632 ?auto_170635 ) ) ( not ( = ?auto_170632 ?auto_170636 ) ) ( not ( = ?auto_170633 ?auto_170634 ) ) ( not ( = ?auto_170633 ?auto_170635 ) ) ( not ( = ?auto_170633 ?auto_170636 ) ) ( not ( = ?auto_170634 ?auto_170635 ) ) ( not ( = ?auto_170634 ?auto_170636 ) ) ( not ( = ?auto_170635 ?auto_170636 ) ) ( ON ?auto_170634 ?auto_170635 ) ( ON ?auto_170633 ?auto_170634 ) ( ON ?auto_170632 ?auto_170633 ) ( ON ?auto_170631 ?auto_170632 ) ( ON ?auto_170630 ?auto_170631 ) ( CLEAR ?auto_170628 ) ( ON ?auto_170629 ?auto_170630 ) ( CLEAR ?auto_170629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170627 ?auto_170628 ?auto_170629 )
      ( MAKE-9PILE ?auto_170627 ?auto_170628 ?auto_170629 ?auto_170630 ?auto_170631 ?auto_170632 ?auto_170633 ?auto_170634 ?auto_170635 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170646 - BLOCK
      ?auto_170647 - BLOCK
      ?auto_170648 - BLOCK
      ?auto_170649 - BLOCK
      ?auto_170650 - BLOCK
      ?auto_170651 - BLOCK
      ?auto_170652 - BLOCK
      ?auto_170653 - BLOCK
      ?auto_170654 - BLOCK
    )
    :vars
    (
      ?auto_170655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170654 ?auto_170655 ) ( ON-TABLE ?auto_170646 ) ( not ( = ?auto_170646 ?auto_170647 ) ) ( not ( = ?auto_170646 ?auto_170648 ) ) ( not ( = ?auto_170646 ?auto_170649 ) ) ( not ( = ?auto_170646 ?auto_170650 ) ) ( not ( = ?auto_170646 ?auto_170651 ) ) ( not ( = ?auto_170646 ?auto_170652 ) ) ( not ( = ?auto_170646 ?auto_170653 ) ) ( not ( = ?auto_170646 ?auto_170654 ) ) ( not ( = ?auto_170646 ?auto_170655 ) ) ( not ( = ?auto_170647 ?auto_170648 ) ) ( not ( = ?auto_170647 ?auto_170649 ) ) ( not ( = ?auto_170647 ?auto_170650 ) ) ( not ( = ?auto_170647 ?auto_170651 ) ) ( not ( = ?auto_170647 ?auto_170652 ) ) ( not ( = ?auto_170647 ?auto_170653 ) ) ( not ( = ?auto_170647 ?auto_170654 ) ) ( not ( = ?auto_170647 ?auto_170655 ) ) ( not ( = ?auto_170648 ?auto_170649 ) ) ( not ( = ?auto_170648 ?auto_170650 ) ) ( not ( = ?auto_170648 ?auto_170651 ) ) ( not ( = ?auto_170648 ?auto_170652 ) ) ( not ( = ?auto_170648 ?auto_170653 ) ) ( not ( = ?auto_170648 ?auto_170654 ) ) ( not ( = ?auto_170648 ?auto_170655 ) ) ( not ( = ?auto_170649 ?auto_170650 ) ) ( not ( = ?auto_170649 ?auto_170651 ) ) ( not ( = ?auto_170649 ?auto_170652 ) ) ( not ( = ?auto_170649 ?auto_170653 ) ) ( not ( = ?auto_170649 ?auto_170654 ) ) ( not ( = ?auto_170649 ?auto_170655 ) ) ( not ( = ?auto_170650 ?auto_170651 ) ) ( not ( = ?auto_170650 ?auto_170652 ) ) ( not ( = ?auto_170650 ?auto_170653 ) ) ( not ( = ?auto_170650 ?auto_170654 ) ) ( not ( = ?auto_170650 ?auto_170655 ) ) ( not ( = ?auto_170651 ?auto_170652 ) ) ( not ( = ?auto_170651 ?auto_170653 ) ) ( not ( = ?auto_170651 ?auto_170654 ) ) ( not ( = ?auto_170651 ?auto_170655 ) ) ( not ( = ?auto_170652 ?auto_170653 ) ) ( not ( = ?auto_170652 ?auto_170654 ) ) ( not ( = ?auto_170652 ?auto_170655 ) ) ( not ( = ?auto_170653 ?auto_170654 ) ) ( not ( = ?auto_170653 ?auto_170655 ) ) ( not ( = ?auto_170654 ?auto_170655 ) ) ( ON ?auto_170653 ?auto_170654 ) ( ON ?auto_170652 ?auto_170653 ) ( ON ?auto_170651 ?auto_170652 ) ( ON ?auto_170650 ?auto_170651 ) ( ON ?auto_170649 ?auto_170650 ) ( ON ?auto_170648 ?auto_170649 ) ( CLEAR ?auto_170646 ) ( ON ?auto_170647 ?auto_170648 ) ( CLEAR ?auto_170647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170646 ?auto_170647 )
      ( MAKE-9PILE ?auto_170646 ?auto_170647 ?auto_170648 ?auto_170649 ?auto_170650 ?auto_170651 ?auto_170652 ?auto_170653 ?auto_170654 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170665 - BLOCK
      ?auto_170666 - BLOCK
      ?auto_170667 - BLOCK
      ?auto_170668 - BLOCK
      ?auto_170669 - BLOCK
      ?auto_170670 - BLOCK
      ?auto_170671 - BLOCK
      ?auto_170672 - BLOCK
      ?auto_170673 - BLOCK
    )
    :vars
    (
      ?auto_170674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170673 ?auto_170674 ) ( ON-TABLE ?auto_170665 ) ( not ( = ?auto_170665 ?auto_170666 ) ) ( not ( = ?auto_170665 ?auto_170667 ) ) ( not ( = ?auto_170665 ?auto_170668 ) ) ( not ( = ?auto_170665 ?auto_170669 ) ) ( not ( = ?auto_170665 ?auto_170670 ) ) ( not ( = ?auto_170665 ?auto_170671 ) ) ( not ( = ?auto_170665 ?auto_170672 ) ) ( not ( = ?auto_170665 ?auto_170673 ) ) ( not ( = ?auto_170665 ?auto_170674 ) ) ( not ( = ?auto_170666 ?auto_170667 ) ) ( not ( = ?auto_170666 ?auto_170668 ) ) ( not ( = ?auto_170666 ?auto_170669 ) ) ( not ( = ?auto_170666 ?auto_170670 ) ) ( not ( = ?auto_170666 ?auto_170671 ) ) ( not ( = ?auto_170666 ?auto_170672 ) ) ( not ( = ?auto_170666 ?auto_170673 ) ) ( not ( = ?auto_170666 ?auto_170674 ) ) ( not ( = ?auto_170667 ?auto_170668 ) ) ( not ( = ?auto_170667 ?auto_170669 ) ) ( not ( = ?auto_170667 ?auto_170670 ) ) ( not ( = ?auto_170667 ?auto_170671 ) ) ( not ( = ?auto_170667 ?auto_170672 ) ) ( not ( = ?auto_170667 ?auto_170673 ) ) ( not ( = ?auto_170667 ?auto_170674 ) ) ( not ( = ?auto_170668 ?auto_170669 ) ) ( not ( = ?auto_170668 ?auto_170670 ) ) ( not ( = ?auto_170668 ?auto_170671 ) ) ( not ( = ?auto_170668 ?auto_170672 ) ) ( not ( = ?auto_170668 ?auto_170673 ) ) ( not ( = ?auto_170668 ?auto_170674 ) ) ( not ( = ?auto_170669 ?auto_170670 ) ) ( not ( = ?auto_170669 ?auto_170671 ) ) ( not ( = ?auto_170669 ?auto_170672 ) ) ( not ( = ?auto_170669 ?auto_170673 ) ) ( not ( = ?auto_170669 ?auto_170674 ) ) ( not ( = ?auto_170670 ?auto_170671 ) ) ( not ( = ?auto_170670 ?auto_170672 ) ) ( not ( = ?auto_170670 ?auto_170673 ) ) ( not ( = ?auto_170670 ?auto_170674 ) ) ( not ( = ?auto_170671 ?auto_170672 ) ) ( not ( = ?auto_170671 ?auto_170673 ) ) ( not ( = ?auto_170671 ?auto_170674 ) ) ( not ( = ?auto_170672 ?auto_170673 ) ) ( not ( = ?auto_170672 ?auto_170674 ) ) ( not ( = ?auto_170673 ?auto_170674 ) ) ( ON ?auto_170672 ?auto_170673 ) ( ON ?auto_170671 ?auto_170672 ) ( ON ?auto_170670 ?auto_170671 ) ( ON ?auto_170669 ?auto_170670 ) ( ON ?auto_170668 ?auto_170669 ) ( ON ?auto_170667 ?auto_170668 ) ( CLEAR ?auto_170665 ) ( ON ?auto_170666 ?auto_170667 ) ( CLEAR ?auto_170666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170665 ?auto_170666 )
      ( MAKE-9PILE ?auto_170665 ?auto_170666 ?auto_170667 ?auto_170668 ?auto_170669 ?auto_170670 ?auto_170671 ?auto_170672 ?auto_170673 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170684 - BLOCK
      ?auto_170685 - BLOCK
      ?auto_170686 - BLOCK
      ?auto_170687 - BLOCK
      ?auto_170688 - BLOCK
      ?auto_170689 - BLOCK
      ?auto_170690 - BLOCK
      ?auto_170691 - BLOCK
      ?auto_170692 - BLOCK
    )
    :vars
    (
      ?auto_170693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170692 ?auto_170693 ) ( not ( = ?auto_170684 ?auto_170685 ) ) ( not ( = ?auto_170684 ?auto_170686 ) ) ( not ( = ?auto_170684 ?auto_170687 ) ) ( not ( = ?auto_170684 ?auto_170688 ) ) ( not ( = ?auto_170684 ?auto_170689 ) ) ( not ( = ?auto_170684 ?auto_170690 ) ) ( not ( = ?auto_170684 ?auto_170691 ) ) ( not ( = ?auto_170684 ?auto_170692 ) ) ( not ( = ?auto_170684 ?auto_170693 ) ) ( not ( = ?auto_170685 ?auto_170686 ) ) ( not ( = ?auto_170685 ?auto_170687 ) ) ( not ( = ?auto_170685 ?auto_170688 ) ) ( not ( = ?auto_170685 ?auto_170689 ) ) ( not ( = ?auto_170685 ?auto_170690 ) ) ( not ( = ?auto_170685 ?auto_170691 ) ) ( not ( = ?auto_170685 ?auto_170692 ) ) ( not ( = ?auto_170685 ?auto_170693 ) ) ( not ( = ?auto_170686 ?auto_170687 ) ) ( not ( = ?auto_170686 ?auto_170688 ) ) ( not ( = ?auto_170686 ?auto_170689 ) ) ( not ( = ?auto_170686 ?auto_170690 ) ) ( not ( = ?auto_170686 ?auto_170691 ) ) ( not ( = ?auto_170686 ?auto_170692 ) ) ( not ( = ?auto_170686 ?auto_170693 ) ) ( not ( = ?auto_170687 ?auto_170688 ) ) ( not ( = ?auto_170687 ?auto_170689 ) ) ( not ( = ?auto_170687 ?auto_170690 ) ) ( not ( = ?auto_170687 ?auto_170691 ) ) ( not ( = ?auto_170687 ?auto_170692 ) ) ( not ( = ?auto_170687 ?auto_170693 ) ) ( not ( = ?auto_170688 ?auto_170689 ) ) ( not ( = ?auto_170688 ?auto_170690 ) ) ( not ( = ?auto_170688 ?auto_170691 ) ) ( not ( = ?auto_170688 ?auto_170692 ) ) ( not ( = ?auto_170688 ?auto_170693 ) ) ( not ( = ?auto_170689 ?auto_170690 ) ) ( not ( = ?auto_170689 ?auto_170691 ) ) ( not ( = ?auto_170689 ?auto_170692 ) ) ( not ( = ?auto_170689 ?auto_170693 ) ) ( not ( = ?auto_170690 ?auto_170691 ) ) ( not ( = ?auto_170690 ?auto_170692 ) ) ( not ( = ?auto_170690 ?auto_170693 ) ) ( not ( = ?auto_170691 ?auto_170692 ) ) ( not ( = ?auto_170691 ?auto_170693 ) ) ( not ( = ?auto_170692 ?auto_170693 ) ) ( ON ?auto_170691 ?auto_170692 ) ( ON ?auto_170690 ?auto_170691 ) ( ON ?auto_170689 ?auto_170690 ) ( ON ?auto_170688 ?auto_170689 ) ( ON ?auto_170687 ?auto_170688 ) ( ON ?auto_170686 ?auto_170687 ) ( ON ?auto_170685 ?auto_170686 ) ( ON ?auto_170684 ?auto_170685 ) ( CLEAR ?auto_170684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170684 )
      ( MAKE-9PILE ?auto_170684 ?auto_170685 ?auto_170686 ?auto_170687 ?auto_170688 ?auto_170689 ?auto_170690 ?auto_170691 ?auto_170692 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170703 - BLOCK
      ?auto_170704 - BLOCK
      ?auto_170705 - BLOCK
      ?auto_170706 - BLOCK
      ?auto_170707 - BLOCK
      ?auto_170708 - BLOCK
      ?auto_170709 - BLOCK
      ?auto_170710 - BLOCK
      ?auto_170711 - BLOCK
    )
    :vars
    (
      ?auto_170712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170711 ?auto_170712 ) ( not ( = ?auto_170703 ?auto_170704 ) ) ( not ( = ?auto_170703 ?auto_170705 ) ) ( not ( = ?auto_170703 ?auto_170706 ) ) ( not ( = ?auto_170703 ?auto_170707 ) ) ( not ( = ?auto_170703 ?auto_170708 ) ) ( not ( = ?auto_170703 ?auto_170709 ) ) ( not ( = ?auto_170703 ?auto_170710 ) ) ( not ( = ?auto_170703 ?auto_170711 ) ) ( not ( = ?auto_170703 ?auto_170712 ) ) ( not ( = ?auto_170704 ?auto_170705 ) ) ( not ( = ?auto_170704 ?auto_170706 ) ) ( not ( = ?auto_170704 ?auto_170707 ) ) ( not ( = ?auto_170704 ?auto_170708 ) ) ( not ( = ?auto_170704 ?auto_170709 ) ) ( not ( = ?auto_170704 ?auto_170710 ) ) ( not ( = ?auto_170704 ?auto_170711 ) ) ( not ( = ?auto_170704 ?auto_170712 ) ) ( not ( = ?auto_170705 ?auto_170706 ) ) ( not ( = ?auto_170705 ?auto_170707 ) ) ( not ( = ?auto_170705 ?auto_170708 ) ) ( not ( = ?auto_170705 ?auto_170709 ) ) ( not ( = ?auto_170705 ?auto_170710 ) ) ( not ( = ?auto_170705 ?auto_170711 ) ) ( not ( = ?auto_170705 ?auto_170712 ) ) ( not ( = ?auto_170706 ?auto_170707 ) ) ( not ( = ?auto_170706 ?auto_170708 ) ) ( not ( = ?auto_170706 ?auto_170709 ) ) ( not ( = ?auto_170706 ?auto_170710 ) ) ( not ( = ?auto_170706 ?auto_170711 ) ) ( not ( = ?auto_170706 ?auto_170712 ) ) ( not ( = ?auto_170707 ?auto_170708 ) ) ( not ( = ?auto_170707 ?auto_170709 ) ) ( not ( = ?auto_170707 ?auto_170710 ) ) ( not ( = ?auto_170707 ?auto_170711 ) ) ( not ( = ?auto_170707 ?auto_170712 ) ) ( not ( = ?auto_170708 ?auto_170709 ) ) ( not ( = ?auto_170708 ?auto_170710 ) ) ( not ( = ?auto_170708 ?auto_170711 ) ) ( not ( = ?auto_170708 ?auto_170712 ) ) ( not ( = ?auto_170709 ?auto_170710 ) ) ( not ( = ?auto_170709 ?auto_170711 ) ) ( not ( = ?auto_170709 ?auto_170712 ) ) ( not ( = ?auto_170710 ?auto_170711 ) ) ( not ( = ?auto_170710 ?auto_170712 ) ) ( not ( = ?auto_170711 ?auto_170712 ) ) ( ON ?auto_170710 ?auto_170711 ) ( ON ?auto_170709 ?auto_170710 ) ( ON ?auto_170708 ?auto_170709 ) ( ON ?auto_170707 ?auto_170708 ) ( ON ?auto_170706 ?auto_170707 ) ( ON ?auto_170705 ?auto_170706 ) ( ON ?auto_170704 ?auto_170705 ) ( ON ?auto_170703 ?auto_170704 ) ( CLEAR ?auto_170703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170703 )
      ( MAKE-9PILE ?auto_170703 ?auto_170704 ?auto_170705 ?auto_170706 ?auto_170707 ?auto_170708 ?auto_170709 ?auto_170710 ?auto_170711 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170723 - BLOCK
      ?auto_170724 - BLOCK
      ?auto_170725 - BLOCK
      ?auto_170726 - BLOCK
      ?auto_170727 - BLOCK
      ?auto_170728 - BLOCK
      ?auto_170729 - BLOCK
      ?auto_170730 - BLOCK
      ?auto_170731 - BLOCK
      ?auto_170732 - BLOCK
    )
    :vars
    (
      ?auto_170733 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_170731 ) ( ON ?auto_170732 ?auto_170733 ) ( CLEAR ?auto_170732 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170723 ) ( ON ?auto_170724 ?auto_170723 ) ( ON ?auto_170725 ?auto_170724 ) ( ON ?auto_170726 ?auto_170725 ) ( ON ?auto_170727 ?auto_170726 ) ( ON ?auto_170728 ?auto_170727 ) ( ON ?auto_170729 ?auto_170728 ) ( ON ?auto_170730 ?auto_170729 ) ( ON ?auto_170731 ?auto_170730 ) ( not ( = ?auto_170723 ?auto_170724 ) ) ( not ( = ?auto_170723 ?auto_170725 ) ) ( not ( = ?auto_170723 ?auto_170726 ) ) ( not ( = ?auto_170723 ?auto_170727 ) ) ( not ( = ?auto_170723 ?auto_170728 ) ) ( not ( = ?auto_170723 ?auto_170729 ) ) ( not ( = ?auto_170723 ?auto_170730 ) ) ( not ( = ?auto_170723 ?auto_170731 ) ) ( not ( = ?auto_170723 ?auto_170732 ) ) ( not ( = ?auto_170723 ?auto_170733 ) ) ( not ( = ?auto_170724 ?auto_170725 ) ) ( not ( = ?auto_170724 ?auto_170726 ) ) ( not ( = ?auto_170724 ?auto_170727 ) ) ( not ( = ?auto_170724 ?auto_170728 ) ) ( not ( = ?auto_170724 ?auto_170729 ) ) ( not ( = ?auto_170724 ?auto_170730 ) ) ( not ( = ?auto_170724 ?auto_170731 ) ) ( not ( = ?auto_170724 ?auto_170732 ) ) ( not ( = ?auto_170724 ?auto_170733 ) ) ( not ( = ?auto_170725 ?auto_170726 ) ) ( not ( = ?auto_170725 ?auto_170727 ) ) ( not ( = ?auto_170725 ?auto_170728 ) ) ( not ( = ?auto_170725 ?auto_170729 ) ) ( not ( = ?auto_170725 ?auto_170730 ) ) ( not ( = ?auto_170725 ?auto_170731 ) ) ( not ( = ?auto_170725 ?auto_170732 ) ) ( not ( = ?auto_170725 ?auto_170733 ) ) ( not ( = ?auto_170726 ?auto_170727 ) ) ( not ( = ?auto_170726 ?auto_170728 ) ) ( not ( = ?auto_170726 ?auto_170729 ) ) ( not ( = ?auto_170726 ?auto_170730 ) ) ( not ( = ?auto_170726 ?auto_170731 ) ) ( not ( = ?auto_170726 ?auto_170732 ) ) ( not ( = ?auto_170726 ?auto_170733 ) ) ( not ( = ?auto_170727 ?auto_170728 ) ) ( not ( = ?auto_170727 ?auto_170729 ) ) ( not ( = ?auto_170727 ?auto_170730 ) ) ( not ( = ?auto_170727 ?auto_170731 ) ) ( not ( = ?auto_170727 ?auto_170732 ) ) ( not ( = ?auto_170727 ?auto_170733 ) ) ( not ( = ?auto_170728 ?auto_170729 ) ) ( not ( = ?auto_170728 ?auto_170730 ) ) ( not ( = ?auto_170728 ?auto_170731 ) ) ( not ( = ?auto_170728 ?auto_170732 ) ) ( not ( = ?auto_170728 ?auto_170733 ) ) ( not ( = ?auto_170729 ?auto_170730 ) ) ( not ( = ?auto_170729 ?auto_170731 ) ) ( not ( = ?auto_170729 ?auto_170732 ) ) ( not ( = ?auto_170729 ?auto_170733 ) ) ( not ( = ?auto_170730 ?auto_170731 ) ) ( not ( = ?auto_170730 ?auto_170732 ) ) ( not ( = ?auto_170730 ?auto_170733 ) ) ( not ( = ?auto_170731 ?auto_170732 ) ) ( not ( = ?auto_170731 ?auto_170733 ) ) ( not ( = ?auto_170732 ?auto_170733 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170732 ?auto_170733 )
      ( !STACK ?auto_170732 ?auto_170731 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170744 - BLOCK
      ?auto_170745 - BLOCK
      ?auto_170746 - BLOCK
      ?auto_170747 - BLOCK
      ?auto_170748 - BLOCK
      ?auto_170749 - BLOCK
      ?auto_170750 - BLOCK
      ?auto_170751 - BLOCK
      ?auto_170752 - BLOCK
      ?auto_170753 - BLOCK
    )
    :vars
    (
      ?auto_170754 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_170752 ) ( ON ?auto_170753 ?auto_170754 ) ( CLEAR ?auto_170753 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170744 ) ( ON ?auto_170745 ?auto_170744 ) ( ON ?auto_170746 ?auto_170745 ) ( ON ?auto_170747 ?auto_170746 ) ( ON ?auto_170748 ?auto_170747 ) ( ON ?auto_170749 ?auto_170748 ) ( ON ?auto_170750 ?auto_170749 ) ( ON ?auto_170751 ?auto_170750 ) ( ON ?auto_170752 ?auto_170751 ) ( not ( = ?auto_170744 ?auto_170745 ) ) ( not ( = ?auto_170744 ?auto_170746 ) ) ( not ( = ?auto_170744 ?auto_170747 ) ) ( not ( = ?auto_170744 ?auto_170748 ) ) ( not ( = ?auto_170744 ?auto_170749 ) ) ( not ( = ?auto_170744 ?auto_170750 ) ) ( not ( = ?auto_170744 ?auto_170751 ) ) ( not ( = ?auto_170744 ?auto_170752 ) ) ( not ( = ?auto_170744 ?auto_170753 ) ) ( not ( = ?auto_170744 ?auto_170754 ) ) ( not ( = ?auto_170745 ?auto_170746 ) ) ( not ( = ?auto_170745 ?auto_170747 ) ) ( not ( = ?auto_170745 ?auto_170748 ) ) ( not ( = ?auto_170745 ?auto_170749 ) ) ( not ( = ?auto_170745 ?auto_170750 ) ) ( not ( = ?auto_170745 ?auto_170751 ) ) ( not ( = ?auto_170745 ?auto_170752 ) ) ( not ( = ?auto_170745 ?auto_170753 ) ) ( not ( = ?auto_170745 ?auto_170754 ) ) ( not ( = ?auto_170746 ?auto_170747 ) ) ( not ( = ?auto_170746 ?auto_170748 ) ) ( not ( = ?auto_170746 ?auto_170749 ) ) ( not ( = ?auto_170746 ?auto_170750 ) ) ( not ( = ?auto_170746 ?auto_170751 ) ) ( not ( = ?auto_170746 ?auto_170752 ) ) ( not ( = ?auto_170746 ?auto_170753 ) ) ( not ( = ?auto_170746 ?auto_170754 ) ) ( not ( = ?auto_170747 ?auto_170748 ) ) ( not ( = ?auto_170747 ?auto_170749 ) ) ( not ( = ?auto_170747 ?auto_170750 ) ) ( not ( = ?auto_170747 ?auto_170751 ) ) ( not ( = ?auto_170747 ?auto_170752 ) ) ( not ( = ?auto_170747 ?auto_170753 ) ) ( not ( = ?auto_170747 ?auto_170754 ) ) ( not ( = ?auto_170748 ?auto_170749 ) ) ( not ( = ?auto_170748 ?auto_170750 ) ) ( not ( = ?auto_170748 ?auto_170751 ) ) ( not ( = ?auto_170748 ?auto_170752 ) ) ( not ( = ?auto_170748 ?auto_170753 ) ) ( not ( = ?auto_170748 ?auto_170754 ) ) ( not ( = ?auto_170749 ?auto_170750 ) ) ( not ( = ?auto_170749 ?auto_170751 ) ) ( not ( = ?auto_170749 ?auto_170752 ) ) ( not ( = ?auto_170749 ?auto_170753 ) ) ( not ( = ?auto_170749 ?auto_170754 ) ) ( not ( = ?auto_170750 ?auto_170751 ) ) ( not ( = ?auto_170750 ?auto_170752 ) ) ( not ( = ?auto_170750 ?auto_170753 ) ) ( not ( = ?auto_170750 ?auto_170754 ) ) ( not ( = ?auto_170751 ?auto_170752 ) ) ( not ( = ?auto_170751 ?auto_170753 ) ) ( not ( = ?auto_170751 ?auto_170754 ) ) ( not ( = ?auto_170752 ?auto_170753 ) ) ( not ( = ?auto_170752 ?auto_170754 ) ) ( not ( = ?auto_170753 ?auto_170754 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170753 ?auto_170754 )
      ( !STACK ?auto_170753 ?auto_170752 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170765 - BLOCK
      ?auto_170766 - BLOCK
      ?auto_170767 - BLOCK
      ?auto_170768 - BLOCK
      ?auto_170769 - BLOCK
      ?auto_170770 - BLOCK
      ?auto_170771 - BLOCK
      ?auto_170772 - BLOCK
      ?auto_170773 - BLOCK
      ?auto_170774 - BLOCK
    )
    :vars
    (
      ?auto_170775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170774 ?auto_170775 ) ( ON-TABLE ?auto_170765 ) ( ON ?auto_170766 ?auto_170765 ) ( ON ?auto_170767 ?auto_170766 ) ( ON ?auto_170768 ?auto_170767 ) ( ON ?auto_170769 ?auto_170768 ) ( ON ?auto_170770 ?auto_170769 ) ( ON ?auto_170771 ?auto_170770 ) ( ON ?auto_170772 ?auto_170771 ) ( not ( = ?auto_170765 ?auto_170766 ) ) ( not ( = ?auto_170765 ?auto_170767 ) ) ( not ( = ?auto_170765 ?auto_170768 ) ) ( not ( = ?auto_170765 ?auto_170769 ) ) ( not ( = ?auto_170765 ?auto_170770 ) ) ( not ( = ?auto_170765 ?auto_170771 ) ) ( not ( = ?auto_170765 ?auto_170772 ) ) ( not ( = ?auto_170765 ?auto_170773 ) ) ( not ( = ?auto_170765 ?auto_170774 ) ) ( not ( = ?auto_170765 ?auto_170775 ) ) ( not ( = ?auto_170766 ?auto_170767 ) ) ( not ( = ?auto_170766 ?auto_170768 ) ) ( not ( = ?auto_170766 ?auto_170769 ) ) ( not ( = ?auto_170766 ?auto_170770 ) ) ( not ( = ?auto_170766 ?auto_170771 ) ) ( not ( = ?auto_170766 ?auto_170772 ) ) ( not ( = ?auto_170766 ?auto_170773 ) ) ( not ( = ?auto_170766 ?auto_170774 ) ) ( not ( = ?auto_170766 ?auto_170775 ) ) ( not ( = ?auto_170767 ?auto_170768 ) ) ( not ( = ?auto_170767 ?auto_170769 ) ) ( not ( = ?auto_170767 ?auto_170770 ) ) ( not ( = ?auto_170767 ?auto_170771 ) ) ( not ( = ?auto_170767 ?auto_170772 ) ) ( not ( = ?auto_170767 ?auto_170773 ) ) ( not ( = ?auto_170767 ?auto_170774 ) ) ( not ( = ?auto_170767 ?auto_170775 ) ) ( not ( = ?auto_170768 ?auto_170769 ) ) ( not ( = ?auto_170768 ?auto_170770 ) ) ( not ( = ?auto_170768 ?auto_170771 ) ) ( not ( = ?auto_170768 ?auto_170772 ) ) ( not ( = ?auto_170768 ?auto_170773 ) ) ( not ( = ?auto_170768 ?auto_170774 ) ) ( not ( = ?auto_170768 ?auto_170775 ) ) ( not ( = ?auto_170769 ?auto_170770 ) ) ( not ( = ?auto_170769 ?auto_170771 ) ) ( not ( = ?auto_170769 ?auto_170772 ) ) ( not ( = ?auto_170769 ?auto_170773 ) ) ( not ( = ?auto_170769 ?auto_170774 ) ) ( not ( = ?auto_170769 ?auto_170775 ) ) ( not ( = ?auto_170770 ?auto_170771 ) ) ( not ( = ?auto_170770 ?auto_170772 ) ) ( not ( = ?auto_170770 ?auto_170773 ) ) ( not ( = ?auto_170770 ?auto_170774 ) ) ( not ( = ?auto_170770 ?auto_170775 ) ) ( not ( = ?auto_170771 ?auto_170772 ) ) ( not ( = ?auto_170771 ?auto_170773 ) ) ( not ( = ?auto_170771 ?auto_170774 ) ) ( not ( = ?auto_170771 ?auto_170775 ) ) ( not ( = ?auto_170772 ?auto_170773 ) ) ( not ( = ?auto_170772 ?auto_170774 ) ) ( not ( = ?auto_170772 ?auto_170775 ) ) ( not ( = ?auto_170773 ?auto_170774 ) ) ( not ( = ?auto_170773 ?auto_170775 ) ) ( not ( = ?auto_170774 ?auto_170775 ) ) ( CLEAR ?auto_170772 ) ( ON ?auto_170773 ?auto_170774 ) ( CLEAR ?auto_170773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_170765 ?auto_170766 ?auto_170767 ?auto_170768 ?auto_170769 ?auto_170770 ?auto_170771 ?auto_170772 ?auto_170773 )
      ( MAKE-10PILE ?auto_170765 ?auto_170766 ?auto_170767 ?auto_170768 ?auto_170769 ?auto_170770 ?auto_170771 ?auto_170772 ?auto_170773 ?auto_170774 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170786 - BLOCK
      ?auto_170787 - BLOCK
      ?auto_170788 - BLOCK
      ?auto_170789 - BLOCK
      ?auto_170790 - BLOCK
      ?auto_170791 - BLOCK
      ?auto_170792 - BLOCK
      ?auto_170793 - BLOCK
      ?auto_170794 - BLOCK
      ?auto_170795 - BLOCK
    )
    :vars
    (
      ?auto_170796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170795 ?auto_170796 ) ( ON-TABLE ?auto_170786 ) ( ON ?auto_170787 ?auto_170786 ) ( ON ?auto_170788 ?auto_170787 ) ( ON ?auto_170789 ?auto_170788 ) ( ON ?auto_170790 ?auto_170789 ) ( ON ?auto_170791 ?auto_170790 ) ( ON ?auto_170792 ?auto_170791 ) ( ON ?auto_170793 ?auto_170792 ) ( not ( = ?auto_170786 ?auto_170787 ) ) ( not ( = ?auto_170786 ?auto_170788 ) ) ( not ( = ?auto_170786 ?auto_170789 ) ) ( not ( = ?auto_170786 ?auto_170790 ) ) ( not ( = ?auto_170786 ?auto_170791 ) ) ( not ( = ?auto_170786 ?auto_170792 ) ) ( not ( = ?auto_170786 ?auto_170793 ) ) ( not ( = ?auto_170786 ?auto_170794 ) ) ( not ( = ?auto_170786 ?auto_170795 ) ) ( not ( = ?auto_170786 ?auto_170796 ) ) ( not ( = ?auto_170787 ?auto_170788 ) ) ( not ( = ?auto_170787 ?auto_170789 ) ) ( not ( = ?auto_170787 ?auto_170790 ) ) ( not ( = ?auto_170787 ?auto_170791 ) ) ( not ( = ?auto_170787 ?auto_170792 ) ) ( not ( = ?auto_170787 ?auto_170793 ) ) ( not ( = ?auto_170787 ?auto_170794 ) ) ( not ( = ?auto_170787 ?auto_170795 ) ) ( not ( = ?auto_170787 ?auto_170796 ) ) ( not ( = ?auto_170788 ?auto_170789 ) ) ( not ( = ?auto_170788 ?auto_170790 ) ) ( not ( = ?auto_170788 ?auto_170791 ) ) ( not ( = ?auto_170788 ?auto_170792 ) ) ( not ( = ?auto_170788 ?auto_170793 ) ) ( not ( = ?auto_170788 ?auto_170794 ) ) ( not ( = ?auto_170788 ?auto_170795 ) ) ( not ( = ?auto_170788 ?auto_170796 ) ) ( not ( = ?auto_170789 ?auto_170790 ) ) ( not ( = ?auto_170789 ?auto_170791 ) ) ( not ( = ?auto_170789 ?auto_170792 ) ) ( not ( = ?auto_170789 ?auto_170793 ) ) ( not ( = ?auto_170789 ?auto_170794 ) ) ( not ( = ?auto_170789 ?auto_170795 ) ) ( not ( = ?auto_170789 ?auto_170796 ) ) ( not ( = ?auto_170790 ?auto_170791 ) ) ( not ( = ?auto_170790 ?auto_170792 ) ) ( not ( = ?auto_170790 ?auto_170793 ) ) ( not ( = ?auto_170790 ?auto_170794 ) ) ( not ( = ?auto_170790 ?auto_170795 ) ) ( not ( = ?auto_170790 ?auto_170796 ) ) ( not ( = ?auto_170791 ?auto_170792 ) ) ( not ( = ?auto_170791 ?auto_170793 ) ) ( not ( = ?auto_170791 ?auto_170794 ) ) ( not ( = ?auto_170791 ?auto_170795 ) ) ( not ( = ?auto_170791 ?auto_170796 ) ) ( not ( = ?auto_170792 ?auto_170793 ) ) ( not ( = ?auto_170792 ?auto_170794 ) ) ( not ( = ?auto_170792 ?auto_170795 ) ) ( not ( = ?auto_170792 ?auto_170796 ) ) ( not ( = ?auto_170793 ?auto_170794 ) ) ( not ( = ?auto_170793 ?auto_170795 ) ) ( not ( = ?auto_170793 ?auto_170796 ) ) ( not ( = ?auto_170794 ?auto_170795 ) ) ( not ( = ?auto_170794 ?auto_170796 ) ) ( not ( = ?auto_170795 ?auto_170796 ) ) ( CLEAR ?auto_170793 ) ( ON ?auto_170794 ?auto_170795 ) ( CLEAR ?auto_170794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_170786 ?auto_170787 ?auto_170788 ?auto_170789 ?auto_170790 ?auto_170791 ?auto_170792 ?auto_170793 ?auto_170794 )
      ( MAKE-10PILE ?auto_170786 ?auto_170787 ?auto_170788 ?auto_170789 ?auto_170790 ?auto_170791 ?auto_170792 ?auto_170793 ?auto_170794 ?auto_170795 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170807 - BLOCK
      ?auto_170808 - BLOCK
      ?auto_170809 - BLOCK
      ?auto_170810 - BLOCK
      ?auto_170811 - BLOCK
      ?auto_170812 - BLOCK
      ?auto_170813 - BLOCK
      ?auto_170814 - BLOCK
      ?auto_170815 - BLOCK
      ?auto_170816 - BLOCK
    )
    :vars
    (
      ?auto_170817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170816 ?auto_170817 ) ( ON-TABLE ?auto_170807 ) ( ON ?auto_170808 ?auto_170807 ) ( ON ?auto_170809 ?auto_170808 ) ( ON ?auto_170810 ?auto_170809 ) ( ON ?auto_170811 ?auto_170810 ) ( ON ?auto_170812 ?auto_170811 ) ( ON ?auto_170813 ?auto_170812 ) ( not ( = ?auto_170807 ?auto_170808 ) ) ( not ( = ?auto_170807 ?auto_170809 ) ) ( not ( = ?auto_170807 ?auto_170810 ) ) ( not ( = ?auto_170807 ?auto_170811 ) ) ( not ( = ?auto_170807 ?auto_170812 ) ) ( not ( = ?auto_170807 ?auto_170813 ) ) ( not ( = ?auto_170807 ?auto_170814 ) ) ( not ( = ?auto_170807 ?auto_170815 ) ) ( not ( = ?auto_170807 ?auto_170816 ) ) ( not ( = ?auto_170807 ?auto_170817 ) ) ( not ( = ?auto_170808 ?auto_170809 ) ) ( not ( = ?auto_170808 ?auto_170810 ) ) ( not ( = ?auto_170808 ?auto_170811 ) ) ( not ( = ?auto_170808 ?auto_170812 ) ) ( not ( = ?auto_170808 ?auto_170813 ) ) ( not ( = ?auto_170808 ?auto_170814 ) ) ( not ( = ?auto_170808 ?auto_170815 ) ) ( not ( = ?auto_170808 ?auto_170816 ) ) ( not ( = ?auto_170808 ?auto_170817 ) ) ( not ( = ?auto_170809 ?auto_170810 ) ) ( not ( = ?auto_170809 ?auto_170811 ) ) ( not ( = ?auto_170809 ?auto_170812 ) ) ( not ( = ?auto_170809 ?auto_170813 ) ) ( not ( = ?auto_170809 ?auto_170814 ) ) ( not ( = ?auto_170809 ?auto_170815 ) ) ( not ( = ?auto_170809 ?auto_170816 ) ) ( not ( = ?auto_170809 ?auto_170817 ) ) ( not ( = ?auto_170810 ?auto_170811 ) ) ( not ( = ?auto_170810 ?auto_170812 ) ) ( not ( = ?auto_170810 ?auto_170813 ) ) ( not ( = ?auto_170810 ?auto_170814 ) ) ( not ( = ?auto_170810 ?auto_170815 ) ) ( not ( = ?auto_170810 ?auto_170816 ) ) ( not ( = ?auto_170810 ?auto_170817 ) ) ( not ( = ?auto_170811 ?auto_170812 ) ) ( not ( = ?auto_170811 ?auto_170813 ) ) ( not ( = ?auto_170811 ?auto_170814 ) ) ( not ( = ?auto_170811 ?auto_170815 ) ) ( not ( = ?auto_170811 ?auto_170816 ) ) ( not ( = ?auto_170811 ?auto_170817 ) ) ( not ( = ?auto_170812 ?auto_170813 ) ) ( not ( = ?auto_170812 ?auto_170814 ) ) ( not ( = ?auto_170812 ?auto_170815 ) ) ( not ( = ?auto_170812 ?auto_170816 ) ) ( not ( = ?auto_170812 ?auto_170817 ) ) ( not ( = ?auto_170813 ?auto_170814 ) ) ( not ( = ?auto_170813 ?auto_170815 ) ) ( not ( = ?auto_170813 ?auto_170816 ) ) ( not ( = ?auto_170813 ?auto_170817 ) ) ( not ( = ?auto_170814 ?auto_170815 ) ) ( not ( = ?auto_170814 ?auto_170816 ) ) ( not ( = ?auto_170814 ?auto_170817 ) ) ( not ( = ?auto_170815 ?auto_170816 ) ) ( not ( = ?auto_170815 ?auto_170817 ) ) ( not ( = ?auto_170816 ?auto_170817 ) ) ( ON ?auto_170815 ?auto_170816 ) ( CLEAR ?auto_170813 ) ( ON ?auto_170814 ?auto_170815 ) ( CLEAR ?auto_170814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170807 ?auto_170808 ?auto_170809 ?auto_170810 ?auto_170811 ?auto_170812 ?auto_170813 ?auto_170814 )
      ( MAKE-10PILE ?auto_170807 ?auto_170808 ?auto_170809 ?auto_170810 ?auto_170811 ?auto_170812 ?auto_170813 ?auto_170814 ?auto_170815 ?auto_170816 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170828 - BLOCK
      ?auto_170829 - BLOCK
      ?auto_170830 - BLOCK
      ?auto_170831 - BLOCK
      ?auto_170832 - BLOCK
      ?auto_170833 - BLOCK
      ?auto_170834 - BLOCK
      ?auto_170835 - BLOCK
      ?auto_170836 - BLOCK
      ?auto_170837 - BLOCK
    )
    :vars
    (
      ?auto_170838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170837 ?auto_170838 ) ( ON-TABLE ?auto_170828 ) ( ON ?auto_170829 ?auto_170828 ) ( ON ?auto_170830 ?auto_170829 ) ( ON ?auto_170831 ?auto_170830 ) ( ON ?auto_170832 ?auto_170831 ) ( ON ?auto_170833 ?auto_170832 ) ( ON ?auto_170834 ?auto_170833 ) ( not ( = ?auto_170828 ?auto_170829 ) ) ( not ( = ?auto_170828 ?auto_170830 ) ) ( not ( = ?auto_170828 ?auto_170831 ) ) ( not ( = ?auto_170828 ?auto_170832 ) ) ( not ( = ?auto_170828 ?auto_170833 ) ) ( not ( = ?auto_170828 ?auto_170834 ) ) ( not ( = ?auto_170828 ?auto_170835 ) ) ( not ( = ?auto_170828 ?auto_170836 ) ) ( not ( = ?auto_170828 ?auto_170837 ) ) ( not ( = ?auto_170828 ?auto_170838 ) ) ( not ( = ?auto_170829 ?auto_170830 ) ) ( not ( = ?auto_170829 ?auto_170831 ) ) ( not ( = ?auto_170829 ?auto_170832 ) ) ( not ( = ?auto_170829 ?auto_170833 ) ) ( not ( = ?auto_170829 ?auto_170834 ) ) ( not ( = ?auto_170829 ?auto_170835 ) ) ( not ( = ?auto_170829 ?auto_170836 ) ) ( not ( = ?auto_170829 ?auto_170837 ) ) ( not ( = ?auto_170829 ?auto_170838 ) ) ( not ( = ?auto_170830 ?auto_170831 ) ) ( not ( = ?auto_170830 ?auto_170832 ) ) ( not ( = ?auto_170830 ?auto_170833 ) ) ( not ( = ?auto_170830 ?auto_170834 ) ) ( not ( = ?auto_170830 ?auto_170835 ) ) ( not ( = ?auto_170830 ?auto_170836 ) ) ( not ( = ?auto_170830 ?auto_170837 ) ) ( not ( = ?auto_170830 ?auto_170838 ) ) ( not ( = ?auto_170831 ?auto_170832 ) ) ( not ( = ?auto_170831 ?auto_170833 ) ) ( not ( = ?auto_170831 ?auto_170834 ) ) ( not ( = ?auto_170831 ?auto_170835 ) ) ( not ( = ?auto_170831 ?auto_170836 ) ) ( not ( = ?auto_170831 ?auto_170837 ) ) ( not ( = ?auto_170831 ?auto_170838 ) ) ( not ( = ?auto_170832 ?auto_170833 ) ) ( not ( = ?auto_170832 ?auto_170834 ) ) ( not ( = ?auto_170832 ?auto_170835 ) ) ( not ( = ?auto_170832 ?auto_170836 ) ) ( not ( = ?auto_170832 ?auto_170837 ) ) ( not ( = ?auto_170832 ?auto_170838 ) ) ( not ( = ?auto_170833 ?auto_170834 ) ) ( not ( = ?auto_170833 ?auto_170835 ) ) ( not ( = ?auto_170833 ?auto_170836 ) ) ( not ( = ?auto_170833 ?auto_170837 ) ) ( not ( = ?auto_170833 ?auto_170838 ) ) ( not ( = ?auto_170834 ?auto_170835 ) ) ( not ( = ?auto_170834 ?auto_170836 ) ) ( not ( = ?auto_170834 ?auto_170837 ) ) ( not ( = ?auto_170834 ?auto_170838 ) ) ( not ( = ?auto_170835 ?auto_170836 ) ) ( not ( = ?auto_170835 ?auto_170837 ) ) ( not ( = ?auto_170835 ?auto_170838 ) ) ( not ( = ?auto_170836 ?auto_170837 ) ) ( not ( = ?auto_170836 ?auto_170838 ) ) ( not ( = ?auto_170837 ?auto_170838 ) ) ( ON ?auto_170836 ?auto_170837 ) ( CLEAR ?auto_170834 ) ( ON ?auto_170835 ?auto_170836 ) ( CLEAR ?auto_170835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170828 ?auto_170829 ?auto_170830 ?auto_170831 ?auto_170832 ?auto_170833 ?auto_170834 ?auto_170835 )
      ( MAKE-10PILE ?auto_170828 ?auto_170829 ?auto_170830 ?auto_170831 ?auto_170832 ?auto_170833 ?auto_170834 ?auto_170835 ?auto_170836 ?auto_170837 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170849 - BLOCK
      ?auto_170850 - BLOCK
      ?auto_170851 - BLOCK
      ?auto_170852 - BLOCK
      ?auto_170853 - BLOCK
      ?auto_170854 - BLOCK
      ?auto_170855 - BLOCK
      ?auto_170856 - BLOCK
      ?auto_170857 - BLOCK
      ?auto_170858 - BLOCK
    )
    :vars
    (
      ?auto_170859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170858 ?auto_170859 ) ( ON-TABLE ?auto_170849 ) ( ON ?auto_170850 ?auto_170849 ) ( ON ?auto_170851 ?auto_170850 ) ( ON ?auto_170852 ?auto_170851 ) ( ON ?auto_170853 ?auto_170852 ) ( ON ?auto_170854 ?auto_170853 ) ( not ( = ?auto_170849 ?auto_170850 ) ) ( not ( = ?auto_170849 ?auto_170851 ) ) ( not ( = ?auto_170849 ?auto_170852 ) ) ( not ( = ?auto_170849 ?auto_170853 ) ) ( not ( = ?auto_170849 ?auto_170854 ) ) ( not ( = ?auto_170849 ?auto_170855 ) ) ( not ( = ?auto_170849 ?auto_170856 ) ) ( not ( = ?auto_170849 ?auto_170857 ) ) ( not ( = ?auto_170849 ?auto_170858 ) ) ( not ( = ?auto_170849 ?auto_170859 ) ) ( not ( = ?auto_170850 ?auto_170851 ) ) ( not ( = ?auto_170850 ?auto_170852 ) ) ( not ( = ?auto_170850 ?auto_170853 ) ) ( not ( = ?auto_170850 ?auto_170854 ) ) ( not ( = ?auto_170850 ?auto_170855 ) ) ( not ( = ?auto_170850 ?auto_170856 ) ) ( not ( = ?auto_170850 ?auto_170857 ) ) ( not ( = ?auto_170850 ?auto_170858 ) ) ( not ( = ?auto_170850 ?auto_170859 ) ) ( not ( = ?auto_170851 ?auto_170852 ) ) ( not ( = ?auto_170851 ?auto_170853 ) ) ( not ( = ?auto_170851 ?auto_170854 ) ) ( not ( = ?auto_170851 ?auto_170855 ) ) ( not ( = ?auto_170851 ?auto_170856 ) ) ( not ( = ?auto_170851 ?auto_170857 ) ) ( not ( = ?auto_170851 ?auto_170858 ) ) ( not ( = ?auto_170851 ?auto_170859 ) ) ( not ( = ?auto_170852 ?auto_170853 ) ) ( not ( = ?auto_170852 ?auto_170854 ) ) ( not ( = ?auto_170852 ?auto_170855 ) ) ( not ( = ?auto_170852 ?auto_170856 ) ) ( not ( = ?auto_170852 ?auto_170857 ) ) ( not ( = ?auto_170852 ?auto_170858 ) ) ( not ( = ?auto_170852 ?auto_170859 ) ) ( not ( = ?auto_170853 ?auto_170854 ) ) ( not ( = ?auto_170853 ?auto_170855 ) ) ( not ( = ?auto_170853 ?auto_170856 ) ) ( not ( = ?auto_170853 ?auto_170857 ) ) ( not ( = ?auto_170853 ?auto_170858 ) ) ( not ( = ?auto_170853 ?auto_170859 ) ) ( not ( = ?auto_170854 ?auto_170855 ) ) ( not ( = ?auto_170854 ?auto_170856 ) ) ( not ( = ?auto_170854 ?auto_170857 ) ) ( not ( = ?auto_170854 ?auto_170858 ) ) ( not ( = ?auto_170854 ?auto_170859 ) ) ( not ( = ?auto_170855 ?auto_170856 ) ) ( not ( = ?auto_170855 ?auto_170857 ) ) ( not ( = ?auto_170855 ?auto_170858 ) ) ( not ( = ?auto_170855 ?auto_170859 ) ) ( not ( = ?auto_170856 ?auto_170857 ) ) ( not ( = ?auto_170856 ?auto_170858 ) ) ( not ( = ?auto_170856 ?auto_170859 ) ) ( not ( = ?auto_170857 ?auto_170858 ) ) ( not ( = ?auto_170857 ?auto_170859 ) ) ( not ( = ?auto_170858 ?auto_170859 ) ) ( ON ?auto_170857 ?auto_170858 ) ( ON ?auto_170856 ?auto_170857 ) ( CLEAR ?auto_170854 ) ( ON ?auto_170855 ?auto_170856 ) ( CLEAR ?auto_170855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170849 ?auto_170850 ?auto_170851 ?auto_170852 ?auto_170853 ?auto_170854 ?auto_170855 )
      ( MAKE-10PILE ?auto_170849 ?auto_170850 ?auto_170851 ?auto_170852 ?auto_170853 ?auto_170854 ?auto_170855 ?auto_170856 ?auto_170857 ?auto_170858 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170870 - BLOCK
      ?auto_170871 - BLOCK
      ?auto_170872 - BLOCK
      ?auto_170873 - BLOCK
      ?auto_170874 - BLOCK
      ?auto_170875 - BLOCK
      ?auto_170876 - BLOCK
      ?auto_170877 - BLOCK
      ?auto_170878 - BLOCK
      ?auto_170879 - BLOCK
    )
    :vars
    (
      ?auto_170880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170879 ?auto_170880 ) ( ON-TABLE ?auto_170870 ) ( ON ?auto_170871 ?auto_170870 ) ( ON ?auto_170872 ?auto_170871 ) ( ON ?auto_170873 ?auto_170872 ) ( ON ?auto_170874 ?auto_170873 ) ( ON ?auto_170875 ?auto_170874 ) ( not ( = ?auto_170870 ?auto_170871 ) ) ( not ( = ?auto_170870 ?auto_170872 ) ) ( not ( = ?auto_170870 ?auto_170873 ) ) ( not ( = ?auto_170870 ?auto_170874 ) ) ( not ( = ?auto_170870 ?auto_170875 ) ) ( not ( = ?auto_170870 ?auto_170876 ) ) ( not ( = ?auto_170870 ?auto_170877 ) ) ( not ( = ?auto_170870 ?auto_170878 ) ) ( not ( = ?auto_170870 ?auto_170879 ) ) ( not ( = ?auto_170870 ?auto_170880 ) ) ( not ( = ?auto_170871 ?auto_170872 ) ) ( not ( = ?auto_170871 ?auto_170873 ) ) ( not ( = ?auto_170871 ?auto_170874 ) ) ( not ( = ?auto_170871 ?auto_170875 ) ) ( not ( = ?auto_170871 ?auto_170876 ) ) ( not ( = ?auto_170871 ?auto_170877 ) ) ( not ( = ?auto_170871 ?auto_170878 ) ) ( not ( = ?auto_170871 ?auto_170879 ) ) ( not ( = ?auto_170871 ?auto_170880 ) ) ( not ( = ?auto_170872 ?auto_170873 ) ) ( not ( = ?auto_170872 ?auto_170874 ) ) ( not ( = ?auto_170872 ?auto_170875 ) ) ( not ( = ?auto_170872 ?auto_170876 ) ) ( not ( = ?auto_170872 ?auto_170877 ) ) ( not ( = ?auto_170872 ?auto_170878 ) ) ( not ( = ?auto_170872 ?auto_170879 ) ) ( not ( = ?auto_170872 ?auto_170880 ) ) ( not ( = ?auto_170873 ?auto_170874 ) ) ( not ( = ?auto_170873 ?auto_170875 ) ) ( not ( = ?auto_170873 ?auto_170876 ) ) ( not ( = ?auto_170873 ?auto_170877 ) ) ( not ( = ?auto_170873 ?auto_170878 ) ) ( not ( = ?auto_170873 ?auto_170879 ) ) ( not ( = ?auto_170873 ?auto_170880 ) ) ( not ( = ?auto_170874 ?auto_170875 ) ) ( not ( = ?auto_170874 ?auto_170876 ) ) ( not ( = ?auto_170874 ?auto_170877 ) ) ( not ( = ?auto_170874 ?auto_170878 ) ) ( not ( = ?auto_170874 ?auto_170879 ) ) ( not ( = ?auto_170874 ?auto_170880 ) ) ( not ( = ?auto_170875 ?auto_170876 ) ) ( not ( = ?auto_170875 ?auto_170877 ) ) ( not ( = ?auto_170875 ?auto_170878 ) ) ( not ( = ?auto_170875 ?auto_170879 ) ) ( not ( = ?auto_170875 ?auto_170880 ) ) ( not ( = ?auto_170876 ?auto_170877 ) ) ( not ( = ?auto_170876 ?auto_170878 ) ) ( not ( = ?auto_170876 ?auto_170879 ) ) ( not ( = ?auto_170876 ?auto_170880 ) ) ( not ( = ?auto_170877 ?auto_170878 ) ) ( not ( = ?auto_170877 ?auto_170879 ) ) ( not ( = ?auto_170877 ?auto_170880 ) ) ( not ( = ?auto_170878 ?auto_170879 ) ) ( not ( = ?auto_170878 ?auto_170880 ) ) ( not ( = ?auto_170879 ?auto_170880 ) ) ( ON ?auto_170878 ?auto_170879 ) ( ON ?auto_170877 ?auto_170878 ) ( CLEAR ?auto_170875 ) ( ON ?auto_170876 ?auto_170877 ) ( CLEAR ?auto_170876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170870 ?auto_170871 ?auto_170872 ?auto_170873 ?auto_170874 ?auto_170875 ?auto_170876 )
      ( MAKE-10PILE ?auto_170870 ?auto_170871 ?auto_170872 ?auto_170873 ?auto_170874 ?auto_170875 ?auto_170876 ?auto_170877 ?auto_170878 ?auto_170879 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170891 - BLOCK
      ?auto_170892 - BLOCK
      ?auto_170893 - BLOCK
      ?auto_170894 - BLOCK
      ?auto_170895 - BLOCK
      ?auto_170896 - BLOCK
      ?auto_170897 - BLOCK
      ?auto_170898 - BLOCK
      ?auto_170899 - BLOCK
      ?auto_170900 - BLOCK
    )
    :vars
    (
      ?auto_170901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170900 ?auto_170901 ) ( ON-TABLE ?auto_170891 ) ( ON ?auto_170892 ?auto_170891 ) ( ON ?auto_170893 ?auto_170892 ) ( ON ?auto_170894 ?auto_170893 ) ( ON ?auto_170895 ?auto_170894 ) ( not ( = ?auto_170891 ?auto_170892 ) ) ( not ( = ?auto_170891 ?auto_170893 ) ) ( not ( = ?auto_170891 ?auto_170894 ) ) ( not ( = ?auto_170891 ?auto_170895 ) ) ( not ( = ?auto_170891 ?auto_170896 ) ) ( not ( = ?auto_170891 ?auto_170897 ) ) ( not ( = ?auto_170891 ?auto_170898 ) ) ( not ( = ?auto_170891 ?auto_170899 ) ) ( not ( = ?auto_170891 ?auto_170900 ) ) ( not ( = ?auto_170891 ?auto_170901 ) ) ( not ( = ?auto_170892 ?auto_170893 ) ) ( not ( = ?auto_170892 ?auto_170894 ) ) ( not ( = ?auto_170892 ?auto_170895 ) ) ( not ( = ?auto_170892 ?auto_170896 ) ) ( not ( = ?auto_170892 ?auto_170897 ) ) ( not ( = ?auto_170892 ?auto_170898 ) ) ( not ( = ?auto_170892 ?auto_170899 ) ) ( not ( = ?auto_170892 ?auto_170900 ) ) ( not ( = ?auto_170892 ?auto_170901 ) ) ( not ( = ?auto_170893 ?auto_170894 ) ) ( not ( = ?auto_170893 ?auto_170895 ) ) ( not ( = ?auto_170893 ?auto_170896 ) ) ( not ( = ?auto_170893 ?auto_170897 ) ) ( not ( = ?auto_170893 ?auto_170898 ) ) ( not ( = ?auto_170893 ?auto_170899 ) ) ( not ( = ?auto_170893 ?auto_170900 ) ) ( not ( = ?auto_170893 ?auto_170901 ) ) ( not ( = ?auto_170894 ?auto_170895 ) ) ( not ( = ?auto_170894 ?auto_170896 ) ) ( not ( = ?auto_170894 ?auto_170897 ) ) ( not ( = ?auto_170894 ?auto_170898 ) ) ( not ( = ?auto_170894 ?auto_170899 ) ) ( not ( = ?auto_170894 ?auto_170900 ) ) ( not ( = ?auto_170894 ?auto_170901 ) ) ( not ( = ?auto_170895 ?auto_170896 ) ) ( not ( = ?auto_170895 ?auto_170897 ) ) ( not ( = ?auto_170895 ?auto_170898 ) ) ( not ( = ?auto_170895 ?auto_170899 ) ) ( not ( = ?auto_170895 ?auto_170900 ) ) ( not ( = ?auto_170895 ?auto_170901 ) ) ( not ( = ?auto_170896 ?auto_170897 ) ) ( not ( = ?auto_170896 ?auto_170898 ) ) ( not ( = ?auto_170896 ?auto_170899 ) ) ( not ( = ?auto_170896 ?auto_170900 ) ) ( not ( = ?auto_170896 ?auto_170901 ) ) ( not ( = ?auto_170897 ?auto_170898 ) ) ( not ( = ?auto_170897 ?auto_170899 ) ) ( not ( = ?auto_170897 ?auto_170900 ) ) ( not ( = ?auto_170897 ?auto_170901 ) ) ( not ( = ?auto_170898 ?auto_170899 ) ) ( not ( = ?auto_170898 ?auto_170900 ) ) ( not ( = ?auto_170898 ?auto_170901 ) ) ( not ( = ?auto_170899 ?auto_170900 ) ) ( not ( = ?auto_170899 ?auto_170901 ) ) ( not ( = ?auto_170900 ?auto_170901 ) ) ( ON ?auto_170899 ?auto_170900 ) ( ON ?auto_170898 ?auto_170899 ) ( ON ?auto_170897 ?auto_170898 ) ( CLEAR ?auto_170895 ) ( ON ?auto_170896 ?auto_170897 ) ( CLEAR ?auto_170896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170891 ?auto_170892 ?auto_170893 ?auto_170894 ?auto_170895 ?auto_170896 )
      ( MAKE-10PILE ?auto_170891 ?auto_170892 ?auto_170893 ?auto_170894 ?auto_170895 ?auto_170896 ?auto_170897 ?auto_170898 ?auto_170899 ?auto_170900 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170912 - BLOCK
      ?auto_170913 - BLOCK
      ?auto_170914 - BLOCK
      ?auto_170915 - BLOCK
      ?auto_170916 - BLOCK
      ?auto_170917 - BLOCK
      ?auto_170918 - BLOCK
      ?auto_170919 - BLOCK
      ?auto_170920 - BLOCK
      ?auto_170921 - BLOCK
    )
    :vars
    (
      ?auto_170922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170921 ?auto_170922 ) ( ON-TABLE ?auto_170912 ) ( ON ?auto_170913 ?auto_170912 ) ( ON ?auto_170914 ?auto_170913 ) ( ON ?auto_170915 ?auto_170914 ) ( ON ?auto_170916 ?auto_170915 ) ( not ( = ?auto_170912 ?auto_170913 ) ) ( not ( = ?auto_170912 ?auto_170914 ) ) ( not ( = ?auto_170912 ?auto_170915 ) ) ( not ( = ?auto_170912 ?auto_170916 ) ) ( not ( = ?auto_170912 ?auto_170917 ) ) ( not ( = ?auto_170912 ?auto_170918 ) ) ( not ( = ?auto_170912 ?auto_170919 ) ) ( not ( = ?auto_170912 ?auto_170920 ) ) ( not ( = ?auto_170912 ?auto_170921 ) ) ( not ( = ?auto_170912 ?auto_170922 ) ) ( not ( = ?auto_170913 ?auto_170914 ) ) ( not ( = ?auto_170913 ?auto_170915 ) ) ( not ( = ?auto_170913 ?auto_170916 ) ) ( not ( = ?auto_170913 ?auto_170917 ) ) ( not ( = ?auto_170913 ?auto_170918 ) ) ( not ( = ?auto_170913 ?auto_170919 ) ) ( not ( = ?auto_170913 ?auto_170920 ) ) ( not ( = ?auto_170913 ?auto_170921 ) ) ( not ( = ?auto_170913 ?auto_170922 ) ) ( not ( = ?auto_170914 ?auto_170915 ) ) ( not ( = ?auto_170914 ?auto_170916 ) ) ( not ( = ?auto_170914 ?auto_170917 ) ) ( not ( = ?auto_170914 ?auto_170918 ) ) ( not ( = ?auto_170914 ?auto_170919 ) ) ( not ( = ?auto_170914 ?auto_170920 ) ) ( not ( = ?auto_170914 ?auto_170921 ) ) ( not ( = ?auto_170914 ?auto_170922 ) ) ( not ( = ?auto_170915 ?auto_170916 ) ) ( not ( = ?auto_170915 ?auto_170917 ) ) ( not ( = ?auto_170915 ?auto_170918 ) ) ( not ( = ?auto_170915 ?auto_170919 ) ) ( not ( = ?auto_170915 ?auto_170920 ) ) ( not ( = ?auto_170915 ?auto_170921 ) ) ( not ( = ?auto_170915 ?auto_170922 ) ) ( not ( = ?auto_170916 ?auto_170917 ) ) ( not ( = ?auto_170916 ?auto_170918 ) ) ( not ( = ?auto_170916 ?auto_170919 ) ) ( not ( = ?auto_170916 ?auto_170920 ) ) ( not ( = ?auto_170916 ?auto_170921 ) ) ( not ( = ?auto_170916 ?auto_170922 ) ) ( not ( = ?auto_170917 ?auto_170918 ) ) ( not ( = ?auto_170917 ?auto_170919 ) ) ( not ( = ?auto_170917 ?auto_170920 ) ) ( not ( = ?auto_170917 ?auto_170921 ) ) ( not ( = ?auto_170917 ?auto_170922 ) ) ( not ( = ?auto_170918 ?auto_170919 ) ) ( not ( = ?auto_170918 ?auto_170920 ) ) ( not ( = ?auto_170918 ?auto_170921 ) ) ( not ( = ?auto_170918 ?auto_170922 ) ) ( not ( = ?auto_170919 ?auto_170920 ) ) ( not ( = ?auto_170919 ?auto_170921 ) ) ( not ( = ?auto_170919 ?auto_170922 ) ) ( not ( = ?auto_170920 ?auto_170921 ) ) ( not ( = ?auto_170920 ?auto_170922 ) ) ( not ( = ?auto_170921 ?auto_170922 ) ) ( ON ?auto_170920 ?auto_170921 ) ( ON ?auto_170919 ?auto_170920 ) ( ON ?auto_170918 ?auto_170919 ) ( CLEAR ?auto_170916 ) ( ON ?auto_170917 ?auto_170918 ) ( CLEAR ?auto_170917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170912 ?auto_170913 ?auto_170914 ?auto_170915 ?auto_170916 ?auto_170917 )
      ( MAKE-10PILE ?auto_170912 ?auto_170913 ?auto_170914 ?auto_170915 ?auto_170916 ?auto_170917 ?auto_170918 ?auto_170919 ?auto_170920 ?auto_170921 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170933 - BLOCK
      ?auto_170934 - BLOCK
      ?auto_170935 - BLOCK
      ?auto_170936 - BLOCK
      ?auto_170937 - BLOCK
      ?auto_170938 - BLOCK
      ?auto_170939 - BLOCK
      ?auto_170940 - BLOCK
      ?auto_170941 - BLOCK
      ?auto_170942 - BLOCK
    )
    :vars
    (
      ?auto_170943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170942 ?auto_170943 ) ( ON-TABLE ?auto_170933 ) ( ON ?auto_170934 ?auto_170933 ) ( ON ?auto_170935 ?auto_170934 ) ( ON ?auto_170936 ?auto_170935 ) ( not ( = ?auto_170933 ?auto_170934 ) ) ( not ( = ?auto_170933 ?auto_170935 ) ) ( not ( = ?auto_170933 ?auto_170936 ) ) ( not ( = ?auto_170933 ?auto_170937 ) ) ( not ( = ?auto_170933 ?auto_170938 ) ) ( not ( = ?auto_170933 ?auto_170939 ) ) ( not ( = ?auto_170933 ?auto_170940 ) ) ( not ( = ?auto_170933 ?auto_170941 ) ) ( not ( = ?auto_170933 ?auto_170942 ) ) ( not ( = ?auto_170933 ?auto_170943 ) ) ( not ( = ?auto_170934 ?auto_170935 ) ) ( not ( = ?auto_170934 ?auto_170936 ) ) ( not ( = ?auto_170934 ?auto_170937 ) ) ( not ( = ?auto_170934 ?auto_170938 ) ) ( not ( = ?auto_170934 ?auto_170939 ) ) ( not ( = ?auto_170934 ?auto_170940 ) ) ( not ( = ?auto_170934 ?auto_170941 ) ) ( not ( = ?auto_170934 ?auto_170942 ) ) ( not ( = ?auto_170934 ?auto_170943 ) ) ( not ( = ?auto_170935 ?auto_170936 ) ) ( not ( = ?auto_170935 ?auto_170937 ) ) ( not ( = ?auto_170935 ?auto_170938 ) ) ( not ( = ?auto_170935 ?auto_170939 ) ) ( not ( = ?auto_170935 ?auto_170940 ) ) ( not ( = ?auto_170935 ?auto_170941 ) ) ( not ( = ?auto_170935 ?auto_170942 ) ) ( not ( = ?auto_170935 ?auto_170943 ) ) ( not ( = ?auto_170936 ?auto_170937 ) ) ( not ( = ?auto_170936 ?auto_170938 ) ) ( not ( = ?auto_170936 ?auto_170939 ) ) ( not ( = ?auto_170936 ?auto_170940 ) ) ( not ( = ?auto_170936 ?auto_170941 ) ) ( not ( = ?auto_170936 ?auto_170942 ) ) ( not ( = ?auto_170936 ?auto_170943 ) ) ( not ( = ?auto_170937 ?auto_170938 ) ) ( not ( = ?auto_170937 ?auto_170939 ) ) ( not ( = ?auto_170937 ?auto_170940 ) ) ( not ( = ?auto_170937 ?auto_170941 ) ) ( not ( = ?auto_170937 ?auto_170942 ) ) ( not ( = ?auto_170937 ?auto_170943 ) ) ( not ( = ?auto_170938 ?auto_170939 ) ) ( not ( = ?auto_170938 ?auto_170940 ) ) ( not ( = ?auto_170938 ?auto_170941 ) ) ( not ( = ?auto_170938 ?auto_170942 ) ) ( not ( = ?auto_170938 ?auto_170943 ) ) ( not ( = ?auto_170939 ?auto_170940 ) ) ( not ( = ?auto_170939 ?auto_170941 ) ) ( not ( = ?auto_170939 ?auto_170942 ) ) ( not ( = ?auto_170939 ?auto_170943 ) ) ( not ( = ?auto_170940 ?auto_170941 ) ) ( not ( = ?auto_170940 ?auto_170942 ) ) ( not ( = ?auto_170940 ?auto_170943 ) ) ( not ( = ?auto_170941 ?auto_170942 ) ) ( not ( = ?auto_170941 ?auto_170943 ) ) ( not ( = ?auto_170942 ?auto_170943 ) ) ( ON ?auto_170941 ?auto_170942 ) ( ON ?auto_170940 ?auto_170941 ) ( ON ?auto_170939 ?auto_170940 ) ( ON ?auto_170938 ?auto_170939 ) ( CLEAR ?auto_170936 ) ( ON ?auto_170937 ?auto_170938 ) ( CLEAR ?auto_170937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170933 ?auto_170934 ?auto_170935 ?auto_170936 ?auto_170937 )
      ( MAKE-10PILE ?auto_170933 ?auto_170934 ?auto_170935 ?auto_170936 ?auto_170937 ?auto_170938 ?auto_170939 ?auto_170940 ?auto_170941 ?auto_170942 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170954 - BLOCK
      ?auto_170955 - BLOCK
      ?auto_170956 - BLOCK
      ?auto_170957 - BLOCK
      ?auto_170958 - BLOCK
      ?auto_170959 - BLOCK
      ?auto_170960 - BLOCK
      ?auto_170961 - BLOCK
      ?auto_170962 - BLOCK
      ?auto_170963 - BLOCK
    )
    :vars
    (
      ?auto_170964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170963 ?auto_170964 ) ( ON-TABLE ?auto_170954 ) ( ON ?auto_170955 ?auto_170954 ) ( ON ?auto_170956 ?auto_170955 ) ( ON ?auto_170957 ?auto_170956 ) ( not ( = ?auto_170954 ?auto_170955 ) ) ( not ( = ?auto_170954 ?auto_170956 ) ) ( not ( = ?auto_170954 ?auto_170957 ) ) ( not ( = ?auto_170954 ?auto_170958 ) ) ( not ( = ?auto_170954 ?auto_170959 ) ) ( not ( = ?auto_170954 ?auto_170960 ) ) ( not ( = ?auto_170954 ?auto_170961 ) ) ( not ( = ?auto_170954 ?auto_170962 ) ) ( not ( = ?auto_170954 ?auto_170963 ) ) ( not ( = ?auto_170954 ?auto_170964 ) ) ( not ( = ?auto_170955 ?auto_170956 ) ) ( not ( = ?auto_170955 ?auto_170957 ) ) ( not ( = ?auto_170955 ?auto_170958 ) ) ( not ( = ?auto_170955 ?auto_170959 ) ) ( not ( = ?auto_170955 ?auto_170960 ) ) ( not ( = ?auto_170955 ?auto_170961 ) ) ( not ( = ?auto_170955 ?auto_170962 ) ) ( not ( = ?auto_170955 ?auto_170963 ) ) ( not ( = ?auto_170955 ?auto_170964 ) ) ( not ( = ?auto_170956 ?auto_170957 ) ) ( not ( = ?auto_170956 ?auto_170958 ) ) ( not ( = ?auto_170956 ?auto_170959 ) ) ( not ( = ?auto_170956 ?auto_170960 ) ) ( not ( = ?auto_170956 ?auto_170961 ) ) ( not ( = ?auto_170956 ?auto_170962 ) ) ( not ( = ?auto_170956 ?auto_170963 ) ) ( not ( = ?auto_170956 ?auto_170964 ) ) ( not ( = ?auto_170957 ?auto_170958 ) ) ( not ( = ?auto_170957 ?auto_170959 ) ) ( not ( = ?auto_170957 ?auto_170960 ) ) ( not ( = ?auto_170957 ?auto_170961 ) ) ( not ( = ?auto_170957 ?auto_170962 ) ) ( not ( = ?auto_170957 ?auto_170963 ) ) ( not ( = ?auto_170957 ?auto_170964 ) ) ( not ( = ?auto_170958 ?auto_170959 ) ) ( not ( = ?auto_170958 ?auto_170960 ) ) ( not ( = ?auto_170958 ?auto_170961 ) ) ( not ( = ?auto_170958 ?auto_170962 ) ) ( not ( = ?auto_170958 ?auto_170963 ) ) ( not ( = ?auto_170958 ?auto_170964 ) ) ( not ( = ?auto_170959 ?auto_170960 ) ) ( not ( = ?auto_170959 ?auto_170961 ) ) ( not ( = ?auto_170959 ?auto_170962 ) ) ( not ( = ?auto_170959 ?auto_170963 ) ) ( not ( = ?auto_170959 ?auto_170964 ) ) ( not ( = ?auto_170960 ?auto_170961 ) ) ( not ( = ?auto_170960 ?auto_170962 ) ) ( not ( = ?auto_170960 ?auto_170963 ) ) ( not ( = ?auto_170960 ?auto_170964 ) ) ( not ( = ?auto_170961 ?auto_170962 ) ) ( not ( = ?auto_170961 ?auto_170963 ) ) ( not ( = ?auto_170961 ?auto_170964 ) ) ( not ( = ?auto_170962 ?auto_170963 ) ) ( not ( = ?auto_170962 ?auto_170964 ) ) ( not ( = ?auto_170963 ?auto_170964 ) ) ( ON ?auto_170962 ?auto_170963 ) ( ON ?auto_170961 ?auto_170962 ) ( ON ?auto_170960 ?auto_170961 ) ( ON ?auto_170959 ?auto_170960 ) ( CLEAR ?auto_170957 ) ( ON ?auto_170958 ?auto_170959 ) ( CLEAR ?auto_170958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170954 ?auto_170955 ?auto_170956 ?auto_170957 ?auto_170958 )
      ( MAKE-10PILE ?auto_170954 ?auto_170955 ?auto_170956 ?auto_170957 ?auto_170958 ?auto_170959 ?auto_170960 ?auto_170961 ?auto_170962 ?auto_170963 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170975 - BLOCK
      ?auto_170976 - BLOCK
      ?auto_170977 - BLOCK
      ?auto_170978 - BLOCK
      ?auto_170979 - BLOCK
      ?auto_170980 - BLOCK
      ?auto_170981 - BLOCK
      ?auto_170982 - BLOCK
      ?auto_170983 - BLOCK
      ?auto_170984 - BLOCK
    )
    :vars
    (
      ?auto_170985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170984 ?auto_170985 ) ( ON-TABLE ?auto_170975 ) ( ON ?auto_170976 ?auto_170975 ) ( ON ?auto_170977 ?auto_170976 ) ( not ( = ?auto_170975 ?auto_170976 ) ) ( not ( = ?auto_170975 ?auto_170977 ) ) ( not ( = ?auto_170975 ?auto_170978 ) ) ( not ( = ?auto_170975 ?auto_170979 ) ) ( not ( = ?auto_170975 ?auto_170980 ) ) ( not ( = ?auto_170975 ?auto_170981 ) ) ( not ( = ?auto_170975 ?auto_170982 ) ) ( not ( = ?auto_170975 ?auto_170983 ) ) ( not ( = ?auto_170975 ?auto_170984 ) ) ( not ( = ?auto_170975 ?auto_170985 ) ) ( not ( = ?auto_170976 ?auto_170977 ) ) ( not ( = ?auto_170976 ?auto_170978 ) ) ( not ( = ?auto_170976 ?auto_170979 ) ) ( not ( = ?auto_170976 ?auto_170980 ) ) ( not ( = ?auto_170976 ?auto_170981 ) ) ( not ( = ?auto_170976 ?auto_170982 ) ) ( not ( = ?auto_170976 ?auto_170983 ) ) ( not ( = ?auto_170976 ?auto_170984 ) ) ( not ( = ?auto_170976 ?auto_170985 ) ) ( not ( = ?auto_170977 ?auto_170978 ) ) ( not ( = ?auto_170977 ?auto_170979 ) ) ( not ( = ?auto_170977 ?auto_170980 ) ) ( not ( = ?auto_170977 ?auto_170981 ) ) ( not ( = ?auto_170977 ?auto_170982 ) ) ( not ( = ?auto_170977 ?auto_170983 ) ) ( not ( = ?auto_170977 ?auto_170984 ) ) ( not ( = ?auto_170977 ?auto_170985 ) ) ( not ( = ?auto_170978 ?auto_170979 ) ) ( not ( = ?auto_170978 ?auto_170980 ) ) ( not ( = ?auto_170978 ?auto_170981 ) ) ( not ( = ?auto_170978 ?auto_170982 ) ) ( not ( = ?auto_170978 ?auto_170983 ) ) ( not ( = ?auto_170978 ?auto_170984 ) ) ( not ( = ?auto_170978 ?auto_170985 ) ) ( not ( = ?auto_170979 ?auto_170980 ) ) ( not ( = ?auto_170979 ?auto_170981 ) ) ( not ( = ?auto_170979 ?auto_170982 ) ) ( not ( = ?auto_170979 ?auto_170983 ) ) ( not ( = ?auto_170979 ?auto_170984 ) ) ( not ( = ?auto_170979 ?auto_170985 ) ) ( not ( = ?auto_170980 ?auto_170981 ) ) ( not ( = ?auto_170980 ?auto_170982 ) ) ( not ( = ?auto_170980 ?auto_170983 ) ) ( not ( = ?auto_170980 ?auto_170984 ) ) ( not ( = ?auto_170980 ?auto_170985 ) ) ( not ( = ?auto_170981 ?auto_170982 ) ) ( not ( = ?auto_170981 ?auto_170983 ) ) ( not ( = ?auto_170981 ?auto_170984 ) ) ( not ( = ?auto_170981 ?auto_170985 ) ) ( not ( = ?auto_170982 ?auto_170983 ) ) ( not ( = ?auto_170982 ?auto_170984 ) ) ( not ( = ?auto_170982 ?auto_170985 ) ) ( not ( = ?auto_170983 ?auto_170984 ) ) ( not ( = ?auto_170983 ?auto_170985 ) ) ( not ( = ?auto_170984 ?auto_170985 ) ) ( ON ?auto_170983 ?auto_170984 ) ( ON ?auto_170982 ?auto_170983 ) ( ON ?auto_170981 ?auto_170982 ) ( ON ?auto_170980 ?auto_170981 ) ( ON ?auto_170979 ?auto_170980 ) ( CLEAR ?auto_170977 ) ( ON ?auto_170978 ?auto_170979 ) ( CLEAR ?auto_170978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170975 ?auto_170976 ?auto_170977 ?auto_170978 )
      ( MAKE-10PILE ?auto_170975 ?auto_170976 ?auto_170977 ?auto_170978 ?auto_170979 ?auto_170980 ?auto_170981 ?auto_170982 ?auto_170983 ?auto_170984 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170996 - BLOCK
      ?auto_170997 - BLOCK
      ?auto_170998 - BLOCK
      ?auto_170999 - BLOCK
      ?auto_171000 - BLOCK
      ?auto_171001 - BLOCK
      ?auto_171002 - BLOCK
      ?auto_171003 - BLOCK
      ?auto_171004 - BLOCK
      ?auto_171005 - BLOCK
    )
    :vars
    (
      ?auto_171006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171005 ?auto_171006 ) ( ON-TABLE ?auto_170996 ) ( ON ?auto_170997 ?auto_170996 ) ( ON ?auto_170998 ?auto_170997 ) ( not ( = ?auto_170996 ?auto_170997 ) ) ( not ( = ?auto_170996 ?auto_170998 ) ) ( not ( = ?auto_170996 ?auto_170999 ) ) ( not ( = ?auto_170996 ?auto_171000 ) ) ( not ( = ?auto_170996 ?auto_171001 ) ) ( not ( = ?auto_170996 ?auto_171002 ) ) ( not ( = ?auto_170996 ?auto_171003 ) ) ( not ( = ?auto_170996 ?auto_171004 ) ) ( not ( = ?auto_170996 ?auto_171005 ) ) ( not ( = ?auto_170996 ?auto_171006 ) ) ( not ( = ?auto_170997 ?auto_170998 ) ) ( not ( = ?auto_170997 ?auto_170999 ) ) ( not ( = ?auto_170997 ?auto_171000 ) ) ( not ( = ?auto_170997 ?auto_171001 ) ) ( not ( = ?auto_170997 ?auto_171002 ) ) ( not ( = ?auto_170997 ?auto_171003 ) ) ( not ( = ?auto_170997 ?auto_171004 ) ) ( not ( = ?auto_170997 ?auto_171005 ) ) ( not ( = ?auto_170997 ?auto_171006 ) ) ( not ( = ?auto_170998 ?auto_170999 ) ) ( not ( = ?auto_170998 ?auto_171000 ) ) ( not ( = ?auto_170998 ?auto_171001 ) ) ( not ( = ?auto_170998 ?auto_171002 ) ) ( not ( = ?auto_170998 ?auto_171003 ) ) ( not ( = ?auto_170998 ?auto_171004 ) ) ( not ( = ?auto_170998 ?auto_171005 ) ) ( not ( = ?auto_170998 ?auto_171006 ) ) ( not ( = ?auto_170999 ?auto_171000 ) ) ( not ( = ?auto_170999 ?auto_171001 ) ) ( not ( = ?auto_170999 ?auto_171002 ) ) ( not ( = ?auto_170999 ?auto_171003 ) ) ( not ( = ?auto_170999 ?auto_171004 ) ) ( not ( = ?auto_170999 ?auto_171005 ) ) ( not ( = ?auto_170999 ?auto_171006 ) ) ( not ( = ?auto_171000 ?auto_171001 ) ) ( not ( = ?auto_171000 ?auto_171002 ) ) ( not ( = ?auto_171000 ?auto_171003 ) ) ( not ( = ?auto_171000 ?auto_171004 ) ) ( not ( = ?auto_171000 ?auto_171005 ) ) ( not ( = ?auto_171000 ?auto_171006 ) ) ( not ( = ?auto_171001 ?auto_171002 ) ) ( not ( = ?auto_171001 ?auto_171003 ) ) ( not ( = ?auto_171001 ?auto_171004 ) ) ( not ( = ?auto_171001 ?auto_171005 ) ) ( not ( = ?auto_171001 ?auto_171006 ) ) ( not ( = ?auto_171002 ?auto_171003 ) ) ( not ( = ?auto_171002 ?auto_171004 ) ) ( not ( = ?auto_171002 ?auto_171005 ) ) ( not ( = ?auto_171002 ?auto_171006 ) ) ( not ( = ?auto_171003 ?auto_171004 ) ) ( not ( = ?auto_171003 ?auto_171005 ) ) ( not ( = ?auto_171003 ?auto_171006 ) ) ( not ( = ?auto_171004 ?auto_171005 ) ) ( not ( = ?auto_171004 ?auto_171006 ) ) ( not ( = ?auto_171005 ?auto_171006 ) ) ( ON ?auto_171004 ?auto_171005 ) ( ON ?auto_171003 ?auto_171004 ) ( ON ?auto_171002 ?auto_171003 ) ( ON ?auto_171001 ?auto_171002 ) ( ON ?auto_171000 ?auto_171001 ) ( CLEAR ?auto_170998 ) ( ON ?auto_170999 ?auto_171000 ) ( CLEAR ?auto_170999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170996 ?auto_170997 ?auto_170998 ?auto_170999 )
      ( MAKE-10PILE ?auto_170996 ?auto_170997 ?auto_170998 ?auto_170999 ?auto_171000 ?auto_171001 ?auto_171002 ?auto_171003 ?auto_171004 ?auto_171005 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_171017 - BLOCK
      ?auto_171018 - BLOCK
      ?auto_171019 - BLOCK
      ?auto_171020 - BLOCK
      ?auto_171021 - BLOCK
      ?auto_171022 - BLOCK
      ?auto_171023 - BLOCK
      ?auto_171024 - BLOCK
      ?auto_171025 - BLOCK
      ?auto_171026 - BLOCK
    )
    :vars
    (
      ?auto_171027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171026 ?auto_171027 ) ( ON-TABLE ?auto_171017 ) ( ON ?auto_171018 ?auto_171017 ) ( not ( = ?auto_171017 ?auto_171018 ) ) ( not ( = ?auto_171017 ?auto_171019 ) ) ( not ( = ?auto_171017 ?auto_171020 ) ) ( not ( = ?auto_171017 ?auto_171021 ) ) ( not ( = ?auto_171017 ?auto_171022 ) ) ( not ( = ?auto_171017 ?auto_171023 ) ) ( not ( = ?auto_171017 ?auto_171024 ) ) ( not ( = ?auto_171017 ?auto_171025 ) ) ( not ( = ?auto_171017 ?auto_171026 ) ) ( not ( = ?auto_171017 ?auto_171027 ) ) ( not ( = ?auto_171018 ?auto_171019 ) ) ( not ( = ?auto_171018 ?auto_171020 ) ) ( not ( = ?auto_171018 ?auto_171021 ) ) ( not ( = ?auto_171018 ?auto_171022 ) ) ( not ( = ?auto_171018 ?auto_171023 ) ) ( not ( = ?auto_171018 ?auto_171024 ) ) ( not ( = ?auto_171018 ?auto_171025 ) ) ( not ( = ?auto_171018 ?auto_171026 ) ) ( not ( = ?auto_171018 ?auto_171027 ) ) ( not ( = ?auto_171019 ?auto_171020 ) ) ( not ( = ?auto_171019 ?auto_171021 ) ) ( not ( = ?auto_171019 ?auto_171022 ) ) ( not ( = ?auto_171019 ?auto_171023 ) ) ( not ( = ?auto_171019 ?auto_171024 ) ) ( not ( = ?auto_171019 ?auto_171025 ) ) ( not ( = ?auto_171019 ?auto_171026 ) ) ( not ( = ?auto_171019 ?auto_171027 ) ) ( not ( = ?auto_171020 ?auto_171021 ) ) ( not ( = ?auto_171020 ?auto_171022 ) ) ( not ( = ?auto_171020 ?auto_171023 ) ) ( not ( = ?auto_171020 ?auto_171024 ) ) ( not ( = ?auto_171020 ?auto_171025 ) ) ( not ( = ?auto_171020 ?auto_171026 ) ) ( not ( = ?auto_171020 ?auto_171027 ) ) ( not ( = ?auto_171021 ?auto_171022 ) ) ( not ( = ?auto_171021 ?auto_171023 ) ) ( not ( = ?auto_171021 ?auto_171024 ) ) ( not ( = ?auto_171021 ?auto_171025 ) ) ( not ( = ?auto_171021 ?auto_171026 ) ) ( not ( = ?auto_171021 ?auto_171027 ) ) ( not ( = ?auto_171022 ?auto_171023 ) ) ( not ( = ?auto_171022 ?auto_171024 ) ) ( not ( = ?auto_171022 ?auto_171025 ) ) ( not ( = ?auto_171022 ?auto_171026 ) ) ( not ( = ?auto_171022 ?auto_171027 ) ) ( not ( = ?auto_171023 ?auto_171024 ) ) ( not ( = ?auto_171023 ?auto_171025 ) ) ( not ( = ?auto_171023 ?auto_171026 ) ) ( not ( = ?auto_171023 ?auto_171027 ) ) ( not ( = ?auto_171024 ?auto_171025 ) ) ( not ( = ?auto_171024 ?auto_171026 ) ) ( not ( = ?auto_171024 ?auto_171027 ) ) ( not ( = ?auto_171025 ?auto_171026 ) ) ( not ( = ?auto_171025 ?auto_171027 ) ) ( not ( = ?auto_171026 ?auto_171027 ) ) ( ON ?auto_171025 ?auto_171026 ) ( ON ?auto_171024 ?auto_171025 ) ( ON ?auto_171023 ?auto_171024 ) ( ON ?auto_171022 ?auto_171023 ) ( ON ?auto_171021 ?auto_171022 ) ( ON ?auto_171020 ?auto_171021 ) ( CLEAR ?auto_171018 ) ( ON ?auto_171019 ?auto_171020 ) ( CLEAR ?auto_171019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171017 ?auto_171018 ?auto_171019 )
      ( MAKE-10PILE ?auto_171017 ?auto_171018 ?auto_171019 ?auto_171020 ?auto_171021 ?auto_171022 ?auto_171023 ?auto_171024 ?auto_171025 ?auto_171026 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_171038 - BLOCK
      ?auto_171039 - BLOCK
      ?auto_171040 - BLOCK
      ?auto_171041 - BLOCK
      ?auto_171042 - BLOCK
      ?auto_171043 - BLOCK
      ?auto_171044 - BLOCK
      ?auto_171045 - BLOCK
      ?auto_171046 - BLOCK
      ?auto_171047 - BLOCK
    )
    :vars
    (
      ?auto_171048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171047 ?auto_171048 ) ( ON-TABLE ?auto_171038 ) ( ON ?auto_171039 ?auto_171038 ) ( not ( = ?auto_171038 ?auto_171039 ) ) ( not ( = ?auto_171038 ?auto_171040 ) ) ( not ( = ?auto_171038 ?auto_171041 ) ) ( not ( = ?auto_171038 ?auto_171042 ) ) ( not ( = ?auto_171038 ?auto_171043 ) ) ( not ( = ?auto_171038 ?auto_171044 ) ) ( not ( = ?auto_171038 ?auto_171045 ) ) ( not ( = ?auto_171038 ?auto_171046 ) ) ( not ( = ?auto_171038 ?auto_171047 ) ) ( not ( = ?auto_171038 ?auto_171048 ) ) ( not ( = ?auto_171039 ?auto_171040 ) ) ( not ( = ?auto_171039 ?auto_171041 ) ) ( not ( = ?auto_171039 ?auto_171042 ) ) ( not ( = ?auto_171039 ?auto_171043 ) ) ( not ( = ?auto_171039 ?auto_171044 ) ) ( not ( = ?auto_171039 ?auto_171045 ) ) ( not ( = ?auto_171039 ?auto_171046 ) ) ( not ( = ?auto_171039 ?auto_171047 ) ) ( not ( = ?auto_171039 ?auto_171048 ) ) ( not ( = ?auto_171040 ?auto_171041 ) ) ( not ( = ?auto_171040 ?auto_171042 ) ) ( not ( = ?auto_171040 ?auto_171043 ) ) ( not ( = ?auto_171040 ?auto_171044 ) ) ( not ( = ?auto_171040 ?auto_171045 ) ) ( not ( = ?auto_171040 ?auto_171046 ) ) ( not ( = ?auto_171040 ?auto_171047 ) ) ( not ( = ?auto_171040 ?auto_171048 ) ) ( not ( = ?auto_171041 ?auto_171042 ) ) ( not ( = ?auto_171041 ?auto_171043 ) ) ( not ( = ?auto_171041 ?auto_171044 ) ) ( not ( = ?auto_171041 ?auto_171045 ) ) ( not ( = ?auto_171041 ?auto_171046 ) ) ( not ( = ?auto_171041 ?auto_171047 ) ) ( not ( = ?auto_171041 ?auto_171048 ) ) ( not ( = ?auto_171042 ?auto_171043 ) ) ( not ( = ?auto_171042 ?auto_171044 ) ) ( not ( = ?auto_171042 ?auto_171045 ) ) ( not ( = ?auto_171042 ?auto_171046 ) ) ( not ( = ?auto_171042 ?auto_171047 ) ) ( not ( = ?auto_171042 ?auto_171048 ) ) ( not ( = ?auto_171043 ?auto_171044 ) ) ( not ( = ?auto_171043 ?auto_171045 ) ) ( not ( = ?auto_171043 ?auto_171046 ) ) ( not ( = ?auto_171043 ?auto_171047 ) ) ( not ( = ?auto_171043 ?auto_171048 ) ) ( not ( = ?auto_171044 ?auto_171045 ) ) ( not ( = ?auto_171044 ?auto_171046 ) ) ( not ( = ?auto_171044 ?auto_171047 ) ) ( not ( = ?auto_171044 ?auto_171048 ) ) ( not ( = ?auto_171045 ?auto_171046 ) ) ( not ( = ?auto_171045 ?auto_171047 ) ) ( not ( = ?auto_171045 ?auto_171048 ) ) ( not ( = ?auto_171046 ?auto_171047 ) ) ( not ( = ?auto_171046 ?auto_171048 ) ) ( not ( = ?auto_171047 ?auto_171048 ) ) ( ON ?auto_171046 ?auto_171047 ) ( ON ?auto_171045 ?auto_171046 ) ( ON ?auto_171044 ?auto_171045 ) ( ON ?auto_171043 ?auto_171044 ) ( ON ?auto_171042 ?auto_171043 ) ( ON ?auto_171041 ?auto_171042 ) ( CLEAR ?auto_171039 ) ( ON ?auto_171040 ?auto_171041 ) ( CLEAR ?auto_171040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171038 ?auto_171039 ?auto_171040 )
      ( MAKE-10PILE ?auto_171038 ?auto_171039 ?auto_171040 ?auto_171041 ?auto_171042 ?auto_171043 ?auto_171044 ?auto_171045 ?auto_171046 ?auto_171047 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_171059 - BLOCK
      ?auto_171060 - BLOCK
      ?auto_171061 - BLOCK
      ?auto_171062 - BLOCK
      ?auto_171063 - BLOCK
      ?auto_171064 - BLOCK
      ?auto_171065 - BLOCK
      ?auto_171066 - BLOCK
      ?auto_171067 - BLOCK
      ?auto_171068 - BLOCK
    )
    :vars
    (
      ?auto_171069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171068 ?auto_171069 ) ( ON-TABLE ?auto_171059 ) ( not ( = ?auto_171059 ?auto_171060 ) ) ( not ( = ?auto_171059 ?auto_171061 ) ) ( not ( = ?auto_171059 ?auto_171062 ) ) ( not ( = ?auto_171059 ?auto_171063 ) ) ( not ( = ?auto_171059 ?auto_171064 ) ) ( not ( = ?auto_171059 ?auto_171065 ) ) ( not ( = ?auto_171059 ?auto_171066 ) ) ( not ( = ?auto_171059 ?auto_171067 ) ) ( not ( = ?auto_171059 ?auto_171068 ) ) ( not ( = ?auto_171059 ?auto_171069 ) ) ( not ( = ?auto_171060 ?auto_171061 ) ) ( not ( = ?auto_171060 ?auto_171062 ) ) ( not ( = ?auto_171060 ?auto_171063 ) ) ( not ( = ?auto_171060 ?auto_171064 ) ) ( not ( = ?auto_171060 ?auto_171065 ) ) ( not ( = ?auto_171060 ?auto_171066 ) ) ( not ( = ?auto_171060 ?auto_171067 ) ) ( not ( = ?auto_171060 ?auto_171068 ) ) ( not ( = ?auto_171060 ?auto_171069 ) ) ( not ( = ?auto_171061 ?auto_171062 ) ) ( not ( = ?auto_171061 ?auto_171063 ) ) ( not ( = ?auto_171061 ?auto_171064 ) ) ( not ( = ?auto_171061 ?auto_171065 ) ) ( not ( = ?auto_171061 ?auto_171066 ) ) ( not ( = ?auto_171061 ?auto_171067 ) ) ( not ( = ?auto_171061 ?auto_171068 ) ) ( not ( = ?auto_171061 ?auto_171069 ) ) ( not ( = ?auto_171062 ?auto_171063 ) ) ( not ( = ?auto_171062 ?auto_171064 ) ) ( not ( = ?auto_171062 ?auto_171065 ) ) ( not ( = ?auto_171062 ?auto_171066 ) ) ( not ( = ?auto_171062 ?auto_171067 ) ) ( not ( = ?auto_171062 ?auto_171068 ) ) ( not ( = ?auto_171062 ?auto_171069 ) ) ( not ( = ?auto_171063 ?auto_171064 ) ) ( not ( = ?auto_171063 ?auto_171065 ) ) ( not ( = ?auto_171063 ?auto_171066 ) ) ( not ( = ?auto_171063 ?auto_171067 ) ) ( not ( = ?auto_171063 ?auto_171068 ) ) ( not ( = ?auto_171063 ?auto_171069 ) ) ( not ( = ?auto_171064 ?auto_171065 ) ) ( not ( = ?auto_171064 ?auto_171066 ) ) ( not ( = ?auto_171064 ?auto_171067 ) ) ( not ( = ?auto_171064 ?auto_171068 ) ) ( not ( = ?auto_171064 ?auto_171069 ) ) ( not ( = ?auto_171065 ?auto_171066 ) ) ( not ( = ?auto_171065 ?auto_171067 ) ) ( not ( = ?auto_171065 ?auto_171068 ) ) ( not ( = ?auto_171065 ?auto_171069 ) ) ( not ( = ?auto_171066 ?auto_171067 ) ) ( not ( = ?auto_171066 ?auto_171068 ) ) ( not ( = ?auto_171066 ?auto_171069 ) ) ( not ( = ?auto_171067 ?auto_171068 ) ) ( not ( = ?auto_171067 ?auto_171069 ) ) ( not ( = ?auto_171068 ?auto_171069 ) ) ( ON ?auto_171067 ?auto_171068 ) ( ON ?auto_171066 ?auto_171067 ) ( ON ?auto_171065 ?auto_171066 ) ( ON ?auto_171064 ?auto_171065 ) ( ON ?auto_171063 ?auto_171064 ) ( ON ?auto_171062 ?auto_171063 ) ( ON ?auto_171061 ?auto_171062 ) ( CLEAR ?auto_171059 ) ( ON ?auto_171060 ?auto_171061 ) ( CLEAR ?auto_171060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171059 ?auto_171060 )
      ( MAKE-10PILE ?auto_171059 ?auto_171060 ?auto_171061 ?auto_171062 ?auto_171063 ?auto_171064 ?auto_171065 ?auto_171066 ?auto_171067 ?auto_171068 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_171080 - BLOCK
      ?auto_171081 - BLOCK
      ?auto_171082 - BLOCK
      ?auto_171083 - BLOCK
      ?auto_171084 - BLOCK
      ?auto_171085 - BLOCK
      ?auto_171086 - BLOCK
      ?auto_171087 - BLOCK
      ?auto_171088 - BLOCK
      ?auto_171089 - BLOCK
    )
    :vars
    (
      ?auto_171090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171089 ?auto_171090 ) ( ON-TABLE ?auto_171080 ) ( not ( = ?auto_171080 ?auto_171081 ) ) ( not ( = ?auto_171080 ?auto_171082 ) ) ( not ( = ?auto_171080 ?auto_171083 ) ) ( not ( = ?auto_171080 ?auto_171084 ) ) ( not ( = ?auto_171080 ?auto_171085 ) ) ( not ( = ?auto_171080 ?auto_171086 ) ) ( not ( = ?auto_171080 ?auto_171087 ) ) ( not ( = ?auto_171080 ?auto_171088 ) ) ( not ( = ?auto_171080 ?auto_171089 ) ) ( not ( = ?auto_171080 ?auto_171090 ) ) ( not ( = ?auto_171081 ?auto_171082 ) ) ( not ( = ?auto_171081 ?auto_171083 ) ) ( not ( = ?auto_171081 ?auto_171084 ) ) ( not ( = ?auto_171081 ?auto_171085 ) ) ( not ( = ?auto_171081 ?auto_171086 ) ) ( not ( = ?auto_171081 ?auto_171087 ) ) ( not ( = ?auto_171081 ?auto_171088 ) ) ( not ( = ?auto_171081 ?auto_171089 ) ) ( not ( = ?auto_171081 ?auto_171090 ) ) ( not ( = ?auto_171082 ?auto_171083 ) ) ( not ( = ?auto_171082 ?auto_171084 ) ) ( not ( = ?auto_171082 ?auto_171085 ) ) ( not ( = ?auto_171082 ?auto_171086 ) ) ( not ( = ?auto_171082 ?auto_171087 ) ) ( not ( = ?auto_171082 ?auto_171088 ) ) ( not ( = ?auto_171082 ?auto_171089 ) ) ( not ( = ?auto_171082 ?auto_171090 ) ) ( not ( = ?auto_171083 ?auto_171084 ) ) ( not ( = ?auto_171083 ?auto_171085 ) ) ( not ( = ?auto_171083 ?auto_171086 ) ) ( not ( = ?auto_171083 ?auto_171087 ) ) ( not ( = ?auto_171083 ?auto_171088 ) ) ( not ( = ?auto_171083 ?auto_171089 ) ) ( not ( = ?auto_171083 ?auto_171090 ) ) ( not ( = ?auto_171084 ?auto_171085 ) ) ( not ( = ?auto_171084 ?auto_171086 ) ) ( not ( = ?auto_171084 ?auto_171087 ) ) ( not ( = ?auto_171084 ?auto_171088 ) ) ( not ( = ?auto_171084 ?auto_171089 ) ) ( not ( = ?auto_171084 ?auto_171090 ) ) ( not ( = ?auto_171085 ?auto_171086 ) ) ( not ( = ?auto_171085 ?auto_171087 ) ) ( not ( = ?auto_171085 ?auto_171088 ) ) ( not ( = ?auto_171085 ?auto_171089 ) ) ( not ( = ?auto_171085 ?auto_171090 ) ) ( not ( = ?auto_171086 ?auto_171087 ) ) ( not ( = ?auto_171086 ?auto_171088 ) ) ( not ( = ?auto_171086 ?auto_171089 ) ) ( not ( = ?auto_171086 ?auto_171090 ) ) ( not ( = ?auto_171087 ?auto_171088 ) ) ( not ( = ?auto_171087 ?auto_171089 ) ) ( not ( = ?auto_171087 ?auto_171090 ) ) ( not ( = ?auto_171088 ?auto_171089 ) ) ( not ( = ?auto_171088 ?auto_171090 ) ) ( not ( = ?auto_171089 ?auto_171090 ) ) ( ON ?auto_171088 ?auto_171089 ) ( ON ?auto_171087 ?auto_171088 ) ( ON ?auto_171086 ?auto_171087 ) ( ON ?auto_171085 ?auto_171086 ) ( ON ?auto_171084 ?auto_171085 ) ( ON ?auto_171083 ?auto_171084 ) ( ON ?auto_171082 ?auto_171083 ) ( CLEAR ?auto_171080 ) ( ON ?auto_171081 ?auto_171082 ) ( CLEAR ?auto_171081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171080 ?auto_171081 )
      ( MAKE-10PILE ?auto_171080 ?auto_171081 ?auto_171082 ?auto_171083 ?auto_171084 ?auto_171085 ?auto_171086 ?auto_171087 ?auto_171088 ?auto_171089 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_171101 - BLOCK
      ?auto_171102 - BLOCK
      ?auto_171103 - BLOCK
      ?auto_171104 - BLOCK
      ?auto_171105 - BLOCK
      ?auto_171106 - BLOCK
      ?auto_171107 - BLOCK
      ?auto_171108 - BLOCK
      ?auto_171109 - BLOCK
      ?auto_171110 - BLOCK
    )
    :vars
    (
      ?auto_171111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171110 ?auto_171111 ) ( not ( = ?auto_171101 ?auto_171102 ) ) ( not ( = ?auto_171101 ?auto_171103 ) ) ( not ( = ?auto_171101 ?auto_171104 ) ) ( not ( = ?auto_171101 ?auto_171105 ) ) ( not ( = ?auto_171101 ?auto_171106 ) ) ( not ( = ?auto_171101 ?auto_171107 ) ) ( not ( = ?auto_171101 ?auto_171108 ) ) ( not ( = ?auto_171101 ?auto_171109 ) ) ( not ( = ?auto_171101 ?auto_171110 ) ) ( not ( = ?auto_171101 ?auto_171111 ) ) ( not ( = ?auto_171102 ?auto_171103 ) ) ( not ( = ?auto_171102 ?auto_171104 ) ) ( not ( = ?auto_171102 ?auto_171105 ) ) ( not ( = ?auto_171102 ?auto_171106 ) ) ( not ( = ?auto_171102 ?auto_171107 ) ) ( not ( = ?auto_171102 ?auto_171108 ) ) ( not ( = ?auto_171102 ?auto_171109 ) ) ( not ( = ?auto_171102 ?auto_171110 ) ) ( not ( = ?auto_171102 ?auto_171111 ) ) ( not ( = ?auto_171103 ?auto_171104 ) ) ( not ( = ?auto_171103 ?auto_171105 ) ) ( not ( = ?auto_171103 ?auto_171106 ) ) ( not ( = ?auto_171103 ?auto_171107 ) ) ( not ( = ?auto_171103 ?auto_171108 ) ) ( not ( = ?auto_171103 ?auto_171109 ) ) ( not ( = ?auto_171103 ?auto_171110 ) ) ( not ( = ?auto_171103 ?auto_171111 ) ) ( not ( = ?auto_171104 ?auto_171105 ) ) ( not ( = ?auto_171104 ?auto_171106 ) ) ( not ( = ?auto_171104 ?auto_171107 ) ) ( not ( = ?auto_171104 ?auto_171108 ) ) ( not ( = ?auto_171104 ?auto_171109 ) ) ( not ( = ?auto_171104 ?auto_171110 ) ) ( not ( = ?auto_171104 ?auto_171111 ) ) ( not ( = ?auto_171105 ?auto_171106 ) ) ( not ( = ?auto_171105 ?auto_171107 ) ) ( not ( = ?auto_171105 ?auto_171108 ) ) ( not ( = ?auto_171105 ?auto_171109 ) ) ( not ( = ?auto_171105 ?auto_171110 ) ) ( not ( = ?auto_171105 ?auto_171111 ) ) ( not ( = ?auto_171106 ?auto_171107 ) ) ( not ( = ?auto_171106 ?auto_171108 ) ) ( not ( = ?auto_171106 ?auto_171109 ) ) ( not ( = ?auto_171106 ?auto_171110 ) ) ( not ( = ?auto_171106 ?auto_171111 ) ) ( not ( = ?auto_171107 ?auto_171108 ) ) ( not ( = ?auto_171107 ?auto_171109 ) ) ( not ( = ?auto_171107 ?auto_171110 ) ) ( not ( = ?auto_171107 ?auto_171111 ) ) ( not ( = ?auto_171108 ?auto_171109 ) ) ( not ( = ?auto_171108 ?auto_171110 ) ) ( not ( = ?auto_171108 ?auto_171111 ) ) ( not ( = ?auto_171109 ?auto_171110 ) ) ( not ( = ?auto_171109 ?auto_171111 ) ) ( not ( = ?auto_171110 ?auto_171111 ) ) ( ON ?auto_171109 ?auto_171110 ) ( ON ?auto_171108 ?auto_171109 ) ( ON ?auto_171107 ?auto_171108 ) ( ON ?auto_171106 ?auto_171107 ) ( ON ?auto_171105 ?auto_171106 ) ( ON ?auto_171104 ?auto_171105 ) ( ON ?auto_171103 ?auto_171104 ) ( ON ?auto_171102 ?auto_171103 ) ( ON ?auto_171101 ?auto_171102 ) ( CLEAR ?auto_171101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171101 )
      ( MAKE-10PILE ?auto_171101 ?auto_171102 ?auto_171103 ?auto_171104 ?auto_171105 ?auto_171106 ?auto_171107 ?auto_171108 ?auto_171109 ?auto_171110 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_171122 - BLOCK
      ?auto_171123 - BLOCK
      ?auto_171124 - BLOCK
      ?auto_171125 - BLOCK
      ?auto_171126 - BLOCK
      ?auto_171127 - BLOCK
      ?auto_171128 - BLOCK
      ?auto_171129 - BLOCK
      ?auto_171130 - BLOCK
      ?auto_171131 - BLOCK
    )
    :vars
    (
      ?auto_171132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171131 ?auto_171132 ) ( not ( = ?auto_171122 ?auto_171123 ) ) ( not ( = ?auto_171122 ?auto_171124 ) ) ( not ( = ?auto_171122 ?auto_171125 ) ) ( not ( = ?auto_171122 ?auto_171126 ) ) ( not ( = ?auto_171122 ?auto_171127 ) ) ( not ( = ?auto_171122 ?auto_171128 ) ) ( not ( = ?auto_171122 ?auto_171129 ) ) ( not ( = ?auto_171122 ?auto_171130 ) ) ( not ( = ?auto_171122 ?auto_171131 ) ) ( not ( = ?auto_171122 ?auto_171132 ) ) ( not ( = ?auto_171123 ?auto_171124 ) ) ( not ( = ?auto_171123 ?auto_171125 ) ) ( not ( = ?auto_171123 ?auto_171126 ) ) ( not ( = ?auto_171123 ?auto_171127 ) ) ( not ( = ?auto_171123 ?auto_171128 ) ) ( not ( = ?auto_171123 ?auto_171129 ) ) ( not ( = ?auto_171123 ?auto_171130 ) ) ( not ( = ?auto_171123 ?auto_171131 ) ) ( not ( = ?auto_171123 ?auto_171132 ) ) ( not ( = ?auto_171124 ?auto_171125 ) ) ( not ( = ?auto_171124 ?auto_171126 ) ) ( not ( = ?auto_171124 ?auto_171127 ) ) ( not ( = ?auto_171124 ?auto_171128 ) ) ( not ( = ?auto_171124 ?auto_171129 ) ) ( not ( = ?auto_171124 ?auto_171130 ) ) ( not ( = ?auto_171124 ?auto_171131 ) ) ( not ( = ?auto_171124 ?auto_171132 ) ) ( not ( = ?auto_171125 ?auto_171126 ) ) ( not ( = ?auto_171125 ?auto_171127 ) ) ( not ( = ?auto_171125 ?auto_171128 ) ) ( not ( = ?auto_171125 ?auto_171129 ) ) ( not ( = ?auto_171125 ?auto_171130 ) ) ( not ( = ?auto_171125 ?auto_171131 ) ) ( not ( = ?auto_171125 ?auto_171132 ) ) ( not ( = ?auto_171126 ?auto_171127 ) ) ( not ( = ?auto_171126 ?auto_171128 ) ) ( not ( = ?auto_171126 ?auto_171129 ) ) ( not ( = ?auto_171126 ?auto_171130 ) ) ( not ( = ?auto_171126 ?auto_171131 ) ) ( not ( = ?auto_171126 ?auto_171132 ) ) ( not ( = ?auto_171127 ?auto_171128 ) ) ( not ( = ?auto_171127 ?auto_171129 ) ) ( not ( = ?auto_171127 ?auto_171130 ) ) ( not ( = ?auto_171127 ?auto_171131 ) ) ( not ( = ?auto_171127 ?auto_171132 ) ) ( not ( = ?auto_171128 ?auto_171129 ) ) ( not ( = ?auto_171128 ?auto_171130 ) ) ( not ( = ?auto_171128 ?auto_171131 ) ) ( not ( = ?auto_171128 ?auto_171132 ) ) ( not ( = ?auto_171129 ?auto_171130 ) ) ( not ( = ?auto_171129 ?auto_171131 ) ) ( not ( = ?auto_171129 ?auto_171132 ) ) ( not ( = ?auto_171130 ?auto_171131 ) ) ( not ( = ?auto_171130 ?auto_171132 ) ) ( not ( = ?auto_171131 ?auto_171132 ) ) ( ON ?auto_171130 ?auto_171131 ) ( ON ?auto_171129 ?auto_171130 ) ( ON ?auto_171128 ?auto_171129 ) ( ON ?auto_171127 ?auto_171128 ) ( ON ?auto_171126 ?auto_171127 ) ( ON ?auto_171125 ?auto_171126 ) ( ON ?auto_171124 ?auto_171125 ) ( ON ?auto_171123 ?auto_171124 ) ( ON ?auto_171122 ?auto_171123 ) ( CLEAR ?auto_171122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171122 )
      ( MAKE-10PILE ?auto_171122 ?auto_171123 ?auto_171124 ?auto_171125 ?auto_171126 ?auto_171127 ?auto_171128 ?auto_171129 ?auto_171130 ?auto_171131 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171144 - BLOCK
      ?auto_171145 - BLOCK
      ?auto_171146 - BLOCK
      ?auto_171147 - BLOCK
      ?auto_171148 - BLOCK
      ?auto_171149 - BLOCK
      ?auto_171150 - BLOCK
      ?auto_171151 - BLOCK
      ?auto_171152 - BLOCK
      ?auto_171153 - BLOCK
      ?auto_171154 - BLOCK
    )
    :vars
    (
      ?auto_171155 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_171153 ) ( ON ?auto_171154 ?auto_171155 ) ( CLEAR ?auto_171154 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171144 ) ( ON ?auto_171145 ?auto_171144 ) ( ON ?auto_171146 ?auto_171145 ) ( ON ?auto_171147 ?auto_171146 ) ( ON ?auto_171148 ?auto_171147 ) ( ON ?auto_171149 ?auto_171148 ) ( ON ?auto_171150 ?auto_171149 ) ( ON ?auto_171151 ?auto_171150 ) ( ON ?auto_171152 ?auto_171151 ) ( ON ?auto_171153 ?auto_171152 ) ( not ( = ?auto_171144 ?auto_171145 ) ) ( not ( = ?auto_171144 ?auto_171146 ) ) ( not ( = ?auto_171144 ?auto_171147 ) ) ( not ( = ?auto_171144 ?auto_171148 ) ) ( not ( = ?auto_171144 ?auto_171149 ) ) ( not ( = ?auto_171144 ?auto_171150 ) ) ( not ( = ?auto_171144 ?auto_171151 ) ) ( not ( = ?auto_171144 ?auto_171152 ) ) ( not ( = ?auto_171144 ?auto_171153 ) ) ( not ( = ?auto_171144 ?auto_171154 ) ) ( not ( = ?auto_171144 ?auto_171155 ) ) ( not ( = ?auto_171145 ?auto_171146 ) ) ( not ( = ?auto_171145 ?auto_171147 ) ) ( not ( = ?auto_171145 ?auto_171148 ) ) ( not ( = ?auto_171145 ?auto_171149 ) ) ( not ( = ?auto_171145 ?auto_171150 ) ) ( not ( = ?auto_171145 ?auto_171151 ) ) ( not ( = ?auto_171145 ?auto_171152 ) ) ( not ( = ?auto_171145 ?auto_171153 ) ) ( not ( = ?auto_171145 ?auto_171154 ) ) ( not ( = ?auto_171145 ?auto_171155 ) ) ( not ( = ?auto_171146 ?auto_171147 ) ) ( not ( = ?auto_171146 ?auto_171148 ) ) ( not ( = ?auto_171146 ?auto_171149 ) ) ( not ( = ?auto_171146 ?auto_171150 ) ) ( not ( = ?auto_171146 ?auto_171151 ) ) ( not ( = ?auto_171146 ?auto_171152 ) ) ( not ( = ?auto_171146 ?auto_171153 ) ) ( not ( = ?auto_171146 ?auto_171154 ) ) ( not ( = ?auto_171146 ?auto_171155 ) ) ( not ( = ?auto_171147 ?auto_171148 ) ) ( not ( = ?auto_171147 ?auto_171149 ) ) ( not ( = ?auto_171147 ?auto_171150 ) ) ( not ( = ?auto_171147 ?auto_171151 ) ) ( not ( = ?auto_171147 ?auto_171152 ) ) ( not ( = ?auto_171147 ?auto_171153 ) ) ( not ( = ?auto_171147 ?auto_171154 ) ) ( not ( = ?auto_171147 ?auto_171155 ) ) ( not ( = ?auto_171148 ?auto_171149 ) ) ( not ( = ?auto_171148 ?auto_171150 ) ) ( not ( = ?auto_171148 ?auto_171151 ) ) ( not ( = ?auto_171148 ?auto_171152 ) ) ( not ( = ?auto_171148 ?auto_171153 ) ) ( not ( = ?auto_171148 ?auto_171154 ) ) ( not ( = ?auto_171148 ?auto_171155 ) ) ( not ( = ?auto_171149 ?auto_171150 ) ) ( not ( = ?auto_171149 ?auto_171151 ) ) ( not ( = ?auto_171149 ?auto_171152 ) ) ( not ( = ?auto_171149 ?auto_171153 ) ) ( not ( = ?auto_171149 ?auto_171154 ) ) ( not ( = ?auto_171149 ?auto_171155 ) ) ( not ( = ?auto_171150 ?auto_171151 ) ) ( not ( = ?auto_171150 ?auto_171152 ) ) ( not ( = ?auto_171150 ?auto_171153 ) ) ( not ( = ?auto_171150 ?auto_171154 ) ) ( not ( = ?auto_171150 ?auto_171155 ) ) ( not ( = ?auto_171151 ?auto_171152 ) ) ( not ( = ?auto_171151 ?auto_171153 ) ) ( not ( = ?auto_171151 ?auto_171154 ) ) ( not ( = ?auto_171151 ?auto_171155 ) ) ( not ( = ?auto_171152 ?auto_171153 ) ) ( not ( = ?auto_171152 ?auto_171154 ) ) ( not ( = ?auto_171152 ?auto_171155 ) ) ( not ( = ?auto_171153 ?auto_171154 ) ) ( not ( = ?auto_171153 ?auto_171155 ) ) ( not ( = ?auto_171154 ?auto_171155 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171154 ?auto_171155 )
      ( !STACK ?auto_171154 ?auto_171153 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171167 - BLOCK
      ?auto_171168 - BLOCK
      ?auto_171169 - BLOCK
      ?auto_171170 - BLOCK
      ?auto_171171 - BLOCK
      ?auto_171172 - BLOCK
      ?auto_171173 - BLOCK
      ?auto_171174 - BLOCK
      ?auto_171175 - BLOCK
      ?auto_171176 - BLOCK
      ?auto_171177 - BLOCK
    )
    :vars
    (
      ?auto_171178 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_171176 ) ( ON ?auto_171177 ?auto_171178 ) ( CLEAR ?auto_171177 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171167 ) ( ON ?auto_171168 ?auto_171167 ) ( ON ?auto_171169 ?auto_171168 ) ( ON ?auto_171170 ?auto_171169 ) ( ON ?auto_171171 ?auto_171170 ) ( ON ?auto_171172 ?auto_171171 ) ( ON ?auto_171173 ?auto_171172 ) ( ON ?auto_171174 ?auto_171173 ) ( ON ?auto_171175 ?auto_171174 ) ( ON ?auto_171176 ?auto_171175 ) ( not ( = ?auto_171167 ?auto_171168 ) ) ( not ( = ?auto_171167 ?auto_171169 ) ) ( not ( = ?auto_171167 ?auto_171170 ) ) ( not ( = ?auto_171167 ?auto_171171 ) ) ( not ( = ?auto_171167 ?auto_171172 ) ) ( not ( = ?auto_171167 ?auto_171173 ) ) ( not ( = ?auto_171167 ?auto_171174 ) ) ( not ( = ?auto_171167 ?auto_171175 ) ) ( not ( = ?auto_171167 ?auto_171176 ) ) ( not ( = ?auto_171167 ?auto_171177 ) ) ( not ( = ?auto_171167 ?auto_171178 ) ) ( not ( = ?auto_171168 ?auto_171169 ) ) ( not ( = ?auto_171168 ?auto_171170 ) ) ( not ( = ?auto_171168 ?auto_171171 ) ) ( not ( = ?auto_171168 ?auto_171172 ) ) ( not ( = ?auto_171168 ?auto_171173 ) ) ( not ( = ?auto_171168 ?auto_171174 ) ) ( not ( = ?auto_171168 ?auto_171175 ) ) ( not ( = ?auto_171168 ?auto_171176 ) ) ( not ( = ?auto_171168 ?auto_171177 ) ) ( not ( = ?auto_171168 ?auto_171178 ) ) ( not ( = ?auto_171169 ?auto_171170 ) ) ( not ( = ?auto_171169 ?auto_171171 ) ) ( not ( = ?auto_171169 ?auto_171172 ) ) ( not ( = ?auto_171169 ?auto_171173 ) ) ( not ( = ?auto_171169 ?auto_171174 ) ) ( not ( = ?auto_171169 ?auto_171175 ) ) ( not ( = ?auto_171169 ?auto_171176 ) ) ( not ( = ?auto_171169 ?auto_171177 ) ) ( not ( = ?auto_171169 ?auto_171178 ) ) ( not ( = ?auto_171170 ?auto_171171 ) ) ( not ( = ?auto_171170 ?auto_171172 ) ) ( not ( = ?auto_171170 ?auto_171173 ) ) ( not ( = ?auto_171170 ?auto_171174 ) ) ( not ( = ?auto_171170 ?auto_171175 ) ) ( not ( = ?auto_171170 ?auto_171176 ) ) ( not ( = ?auto_171170 ?auto_171177 ) ) ( not ( = ?auto_171170 ?auto_171178 ) ) ( not ( = ?auto_171171 ?auto_171172 ) ) ( not ( = ?auto_171171 ?auto_171173 ) ) ( not ( = ?auto_171171 ?auto_171174 ) ) ( not ( = ?auto_171171 ?auto_171175 ) ) ( not ( = ?auto_171171 ?auto_171176 ) ) ( not ( = ?auto_171171 ?auto_171177 ) ) ( not ( = ?auto_171171 ?auto_171178 ) ) ( not ( = ?auto_171172 ?auto_171173 ) ) ( not ( = ?auto_171172 ?auto_171174 ) ) ( not ( = ?auto_171172 ?auto_171175 ) ) ( not ( = ?auto_171172 ?auto_171176 ) ) ( not ( = ?auto_171172 ?auto_171177 ) ) ( not ( = ?auto_171172 ?auto_171178 ) ) ( not ( = ?auto_171173 ?auto_171174 ) ) ( not ( = ?auto_171173 ?auto_171175 ) ) ( not ( = ?auto_171173 ?auto_171176 ) ) ( not ( = ?auto_171173 ?auto_171177 ) ) ( not ( = ?auto_171173 ?auto_171178 ) ) ( not ( = ?auto_171174 ?auto_171175 ) ) ( not ( = ?auto_171174 ?auto_171176 ) ) ( not ( = ?auto_171174 ?auto_171177 ) ) ( not ( = ?auto_171174 ?auto_171178 ) ) ( not ( = ?auto_171175 ?auto_171176 ) ) ( not ( = ?auto_171175 ?auto_171177 ) ) ( not ( = ?auto_171175 ?auto_171178 ) ) ( not ( = ?auto_171176 ?auto_171177 ) ) ( not ( = ?auto_171176 ?auto_171178 ) ) ( not ( = ?auto_171177 ?auto_171178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171177 ?auto_171178 )
      ( !STACK ?auto_171177 ?auto_171176 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171190 - BLOCK
      ?auto_171191 - BLOCK
      ?auto_171192 - BLOCK
      ?auto_171193 - BLOCK
      ?auto_171194 - BLOCK
      ?auto_171195 - BLOCK
      ?auto_171196 - BLOCK
      ?auto_171197 - BLOCK
      ?auto_171198 - BLOCK
      ?auto_171199 - BLOCK
      ?auto_171200 - BLOCK
    )
    :vars
    (
      ?auto_171201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171200 ?auto_171201 ) ( ON-TABLE ?auto_171190 ) ( ON ?auto_171191 ?auto_171190 ) ( ON ?auto_171192 ?auto_171191 ) ( ON ?auto_171193 ?auto_171192 ) ( ON ?auto_171194 ?auto_171193 ) ( ON ?auto_171195 ?auto_171194 ) ( ON ?auto_171196 ?auto_171195 ) ( ON ?auto_171197 ?auto_171196 ) ( ON ?auto_171198 ?auto_171197 ) ( not ( = ?auto_171190 ?auto_171191 ) ) ( not ( = ?auto_171190 ?auto_171192 ) ) ( not ( = ?auto_171190 ?auto_171193 ) ) ( not ( = ?auto_171190 ?auto_171194 ) ) ( not ( = ?auto_171190 ?auto_171195 ) ) ( not ( = ?auto_171190 ?auto_171196 ) ) ( not ( = ?auto_171190 ?auto_171197 ) ) ( not ( = ?auto_171190 ?auto_171198 ) ) ( not ( = ?auto_171190 ?auto_171199 ) ) ( not ( = ?auto_171190 ?auto_171200 ) ) ( not ( = ?auto_171190 ?auto_171201 ) ) ( not ( = ?auto_171191 ?auto_171192 ) ) ( not ( = ?auto_171191 ?auto_171193 ) ) ( not ( = ?auto_171191 ?auto_171194 ) ) ( not ( = ?auto_171191 ?auto_171195 ) ) ( not ( = ?auto_171191 ?auto_171196 ) ) ( not ( = ?auto_171191 ?auto_171197 ) ) ( not ( = ?auto_171191 ?auto_171198 ) ) ( not ( = ?auto_171191 ?auto_171199 ) ) ( not ( = ?auto_171191 ?auto_171200 ) ) ( not ( = ?auto_171191 ?auto_171201 ) ) ( not ( = ?auto_171192 ?auto_171193 ) ) ( not ( = ?auto_171192 ?auto_171194 ) ) ( not ( = ?auto_171192 ?auto_171195 ) ) ( not ( = ?auto_171192 ?auto_171196 ) ) ( not ( = ?auto_171192 ?auto_171197 ) ) ( not ( = ?auto_171192 ?auto_171198 ) ) ( not ( = ?auto_171192 ?auto_171199 ) ) ( not ( = ?auto_171192 ?auto_171200 ) ) ( not ( = ?auto_171192 ?auto_171201 ) ) ( not ( = ?auto_171193 ?auto_171194 ) ) ( not ( = ?auto_171193 ?auto_171195 ) ) ( not ( = ?auto_171193 ?auto_171196 ) ) ( not ( = ?auto_171193 ?auto_171197 ) ) ( not ( = ?auto_171193 ?auto_171198 ) ) ( not ( = ?auto_171193 ?auto_171199 ) ) ( not ( = ?auto_171193 ?auto_171200 ) ) ( not ( = ?auto_171193 ?auto_171201 ) ) ( not ( = ?auto_171194 ?auto_171195 ) ) ( not ( = ?auto_171194 ?auto_171196 ) ) ( not ( = ?auto_171194 ?auto_171197 ) ) ( not ( = ?auto_171194 ?auto_171198 ) ) ( not ( = ?auto_171194 ?auto_171199 ) ) ( not ( = ?auto_171194 ?auto_171200 ) ) ( not ( = ?auto_171194 ?auto_171201 ) ) ( not ( = ?auto_171195 ?auto_171196 ) ) ( not ( = ?auto_171195 ?auto_171197 ) ) ( not ( = ?auto_171195 ?auto_171198 ) ) ( not ( = ?auto_171195 ?auto_171199 ) ) ( not ( = ?auto_171195 ?auto_171200 ) ) ( not ( = ?auto_171195 ?auto_171201 ) ) ( not ( = ?auto_171196 ?auto_171197 ) ) ( not ( = ?auto_171196 ?auto_171198 ) ) ( not ( = ?auto_171196 ?auto_171199 ) ) ( not ( = ?auto_171196 ?auto_171200 ) ) ( not ( = ?auto_171196 ?auto_171201 ) ) ( not ( = ?auto_171197 ?auto_171198 ) ) ( not ( = ?auto_171197 ?auto_171199 ) ) ( not ( = ?auto_171197 ?auto_171200 ) ) ( not ( = ?auto_171197 ?auto_171201 ) ) ( not ( = ?auto_171198 ?auto_171199 ) ) ( not ( = ?auto_171198 ?auto_171200 ) ) ( not ( = ?auto_171198 ?auto_171201 ) ) ( not ( = ?auto_171199 ?auto_171200 ) ) ( not ( = ?auto_171199 ?auto_171201 ) ) ( not ( = ?auto_171200 ?auto_171201 ) ) ( CLEAR ?auto_171198 ) ( ON ?auto_171199 ?auto_171200 ) ( CLEAR ?auto_171199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_171190 ?auto_171191 ?auto_171192 ?auto_171193 ?auto_171194 ?auto_171195 ?auto_171196 ?auto_171197 ?auto_171198 ?auto_171199 )
      ( MAKE-11PILE ?auto_171190 ?auto_171191 ?auto_171192 ?auto_171193 ?auto_171194 ?auto_171195 ?auto_171196 ?auto_171197 ?auto_171198 ?auto_171199 ?auto_171200 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171213 - BLOCK
      ?auto_171214 - BLOCK
      ?auto_171215 - BLOCK
      ?auto_171216 - BLOCK
      ?auto_171217 - BLOCK
      ?auto_171218 - BLOCK
      ?auto_171219 - BLOCK
      ?auto_171220 - BLOCK
      ?auto_171221 - BLOCK
      ?auto_171222 - BLOCK
      ?auto_171223 - BLOCK
    )
    :vars
    (
      ?auto_171224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171223 ?auto_171224 ) ( ON-TABLE ?auto_171213 ) ( ON ?auto_171214 ?auto_171213 ) ( ON ?auto_171215 ?auto_171214 ) ( ON ?auto_171216 ?auto_171215 ) ( ON ?auto_171217 ?auto_171216 ) ( ON ?auto_171218 ?auto_171217 ) ( ON ?auto_171219 ?auto_171218 ) ( ON ?auto_171220 ?auto_171219 ) ( ON ?auto_171221 ?auto_171220 ) ( not ( = ?auto_171213 ?auto_171214 ) ) ( not ( = ?auto_171213 ?auto_171215 ) ) ( not ( = ?auto_171213 ?auto_171216 ) ) ( not ( = ?auto_171213 ?auto_171217 ) ) ( not ( = ?auto_171213 ?auto_171218 ) ) ( not ( = ?auto_171213 ?auto_171219 ) ) ( not ( = ?auto_171213 ?auto_171220 ) ) ( not ( = ?auto_171213 ?auto_171221 ) ) ( not ( = ?auto_171213 ?auto_171222 ) ) ( not ( = ?auto_171213 ?auto_171223 ) ) ( not ( = ?auto_171213 ?auto_171224 ) ) ( not ( = ?auto_171214 ?auto_171215 ) ) ( not ( = ?auto_171214 ?auto_171216 ) ) ( not ( = ?auto_171214 ?auto_171217 ) ) ( not ( = ?auto_171214 ?auto_171218 ) ) ( not ( = ?auto_171214 ?auto_171219 ) ) ( not ( = ?auto_171214 ?auto_171220 ) ) ( not ( = ?auto_171214 ?auto_171221 ) ) ( not ( = ?auto_171214 ?auto_171222 ) ) ( not ( = ?auto_171214 ?auto_171223 ) ) ( not ( = ?auto_171214 ?auto_171224 ) ) ( not ( = ?auto_171215 ?auto_171216 ) ) ( not ( = ?auto_171215 ?auto_171217 ) ) ( not ( = ?auto_171215 ?auto_171218 ) ) ( not ( = ?auto_171215 ?auto_171219 ) ) ( not ( = ?auto_171215 ?auto_171220 ) ) ( not ( = ?auto_171215 ?auto_171221 ) ) ( not ( = ?auto_171215 ?auto_171222 ) ) ( not ( = ?auto_171215 ?auto_171223 ) ) ( not ( = ?auto_171215 ?auto_171224 ) ) ( not ( = ?auto_171216 ?auto_171217 ) ) ( not ( = ?auto_171216 ?auto_171218 ) ) ( not ( = ?auto_171216 ?auto_171219 ) ) ( not ( = ?auto_171216 ?auto_171220 ) ) ( not ( = ?auto_171216 ?auto_171221 ) ) ( not ( = ?auto_171216 ?auto_171222 ) ) ( not ( = ?auto_171216 ?auto_171223 ) ) ( not ( = ?auto_171216 ?auto_171224 ) ) ( not ( = ?auto_171217 ?auto_171218 ) ) ( not ( = ?auto_171217 ?auto_171219 ) ) ( not ( = ?auto_171217 ?auto_171220 ) ) ( not ( = ?auto_171217 ?auto_171221 ) ) ( not ( = ?auto_171217 ?auto_171222 ) ) ( not ( = ?auto_171217 ?auto_171223 ) ) ( not ( = ?auto_171217 ?auto_171224 ) ) ( not ( = ?auto_171218 ?auto_171219 ) ) ( not ( = ?auto_171218 ?auto_171220 ) ) ( not ( = ?auto_171218 ?auto_171221 ) ) ( not ( = ?auto_171218 ?auto_171222 ) ) ( not ( = ?auto_171218 ?auto_171223 ) ) ( not ( = ?auto_171218 ?auto_171224 ) ) ( not ( = ?auto_171219 ?auto_171220 ) ) ( not ( = ?auto_171219 ?auto_171221 ) ) ( not ( = ?auto_171219 ?auto_171222 ) ) ( not ( = ?auto_171219 ?auto_171223 ) ) ( not ( = ?auto_171219 ?auto_171224 ) ) ( not ( = ?auto_171220 ?auto_171221 ) ) ( not ( = ?auto_171220 ?auto_171222 ) ) ( not ( = ?auto_171220 ?auto_171223 ) ) ( not ( = ?auto_171220 ?auto_171224 ) ) ( not ( = ?auto_171221 ?auto_171222 ) ) ( not ( = ?auto_171221 ?auto_171223 ) ) ( not ( = ?auto_171221 ?auto_171224 ) ) ( not ( = ?auto_171222 ?auto_171223 ) ) ( not ( = ?auto_171222 ?auto_171224 ) ) ( not ( = ?auto_171223 ?auto_171224 ) ) ( CLEAR ?auto_171221 ) ( ON ?auto_171222 ?auto_171223 ) ( CLEAR ?auto_171222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_171213 ?auto_171214 ?auto_171215 ?auto_171216 ?auto_171217 ?auto_171218 ?auto_171219 ?auto_171220 ?auto_171221 ?auto_171222 )
      ( MAKE-11PILE ?auto_171213 ?auto_171214 ?auto_171215 ?auto_171216 ?auto_171217 ?auto_171218 ?auto_171219 ?auto_171220 ?auto_171221 ?auto_171222 ?auto_171223 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171236 - BLOCK
      ?auto_171237 - BLOCK
      ?auto_171238 - BLOCK
      ?auto_171239 - BLOCK
      ?auto_171240 - BLOCK
      ?auto_171241 - BLOCK
      ?auto_171242 - BLOCK
      ?auto_171243 - BLOCK
      ?auto_171244 - BLOCK
      ?auto_171245 - BLOCK
      ?auto_171246 - BLOCK
    )
    :vars
    (
      ?auto_171247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171246 ?auto_171247 ) ( ON-TABLE ?auto_171236 ) ( ON ?auto_171237 ?auto_171236 ) ( ON ?auto_171238 ?auto_171237 ) ( ON ?auto_171239 ?auto_171238 ) ( ON ?auto_171240 ?auto_171239 ) ( ON ?auto_171241 ?auto_171240 ) ( ON ?auto_171242 ?auto_171241 ) ( ON ?auto_171243 ?auto_171242 ) ( not ( = ?auto_171236 ?auto_171237 ) ) ( not ( = ?auto_171236 ?auto_171238 ) ) ( not ( = ?auto_171236 ?auto_171239 ) ) ( not ( = ?auto_171236 ?auto_171240 ) ) ( not ( = ?auto_171236 ?auto_171241 ) ) ( not ( = ?auto_171236 ?auto_171242 ) ) ( not ( = ?auto_171236 ?auto_171243 ) ) ( not ( = ?auto_171236 ?auto_171244 ) ) ( not ( = ?auto_171236 ?auto_171245 ) ) ( not ( = ?auto_171236 ?auto_171246 ) ) ( not ( = ?auto_171236 ?auto_171247 ) ) ( not ( = ?auto_171237 ?auto_171238 ) ) ( not ( = ?auto_171237 ?auto_171239 ) ) ( not ( = ?auto_171237 ?auto_171240 ) ) ( not ( = ?auto_171237 ?auto_171241 ) ) ( not ( = ?auto_171237 ?auto_171242 ) ) ( not ( = ?auto_171237 ?auto_171243 ) ) ( not ( = ?auto_171237 ?auto_171244 ) ) ( not ( = ?auto_171237 ?auto_171245 ) ) ( not ( = ?auto_171237 ?auto_171246 ) ) ( not ( = ?auto_171237 ?auto_171247 ) ) ( not ( = ?auto_171238 ?auto_171239 ) ) ( not ( = ?auto_171238 ?auto_171240 ) ) ( not ( = ?auto_171238 ?auto_171241 ) ) ( not ( = ?auto_171238 ?auto_171242 ) ) ( not ( = ?auto_171238 ?auto_171243 ) ) ( not ( = ?auto_171238 ?auto_171244 ) ) ( not ( = ?auto_171238 ?auto_171245 ) ) ( not ( = ?auto_171238 ?auto_171246 ) ) ( not ( = ?auto_171238 ?auto_171247 ) ) ( not ( = ?auto_171239 ?auto_171240 ) ) ( not ( = ?auto_171239 ?auto_171241 ) ) ( not ( = ?auto_171239 ?auto_171242 ) ) ( not ( = ?auto_171239 ?auto_171243 ) ) ( not ( = ?auto_171239 ?auto_171244 ) ) ( not ( = ?auto_171239 ?auto_171245 ) ) ( not ( = ?auto_171239 ?auto_171246 ) ) ( not ( = ?auto_171239 ?auto_171247 ) ) ( not ( = ?auto_171240 ?auto_171241 ) ) ( not ( = ?auto_171240 ?auto_171242 ) ) ( not ( = ?auto_171240 ?auto_171243 ) ) ( not ( = ?auto_171240 ?auto_171244 ) ) ( not ( = ?auto_171240 ?auto_171245 ) ) ( not ( = ?auto_171240 ?auto_171246 ) ) ( not ( = ?auto_171240 ?auto_171247 ) ) ( not ( = ?auto_171241 ?auto_171242 ) ) ( not ( = ?auto_171241 ?auto_171243 ) ) ( not ( = ?auto_171241 ?auto_171244 ) ) ( not ( = ?auto_171241 ?auto_171245 ) ) ( not ( = ?auto_171241 ?auto_171246 ) ) ( not ( = ?auto_171241 ?auto_171247 ) ) ( not ( = ?auto_171242 ?auto_171243 ) ) ( not ( = ?auto_171242 ?auto_171244 ) ) ( not ( = ?auto_171242 ?auto_171245 ) ) ( not ( = ?auto_171242 ?auto_171246 ) ) ( not ( = ?auto_171242 ?auto_171247 ) ) ( not ( = ?auto_171243 ?auto_171244 ) ) ( not ( = ?auto_171243 ?auto_171245 ) ) ( not ( = ?auto_171243 ?auto_171246 ) ) ( not ( = ?auto_171243 ?auto_171247 ) ) ( not ( = ?auto_171244 ?auto_171245 ) ) ( not ( = ?auto_171244 ?auto_171246 ) ) ( not ( = ?auto_171244 ?auto_171247 ) ) ( not ( = ?auto_171245 ?auto_171246 ) ) ( not ( = ?auto_171245 ?auto_171247 ) ) ( not ( = ?auto_171246 ?auto_171247 ) ) ( ON ?auto_171245 ?auto_171246 ) ( CLEAR ?auto_171243 ) ( ON ?auto_171244 ?auto_171245 ) ( CLEAR ?auto_171244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_171236 ?auto_171237 ?auto_171238 ?auto_171239 ?auto_171240 ?auto_171241 ?auto_171242 ?auto_171243 ?auto_171244 )
      ( MAKE-11PILE ?auto_171236 ?auto_171237 ?auto_171238 ?auto_171239 ?auto_171240 ?auto_171241 ?auto_171242 ?auto_171243 ?auto_171244 ?auto_171245 ?auto_171246 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171259 - BLOCK
      ?auto_171260 - BLOCK
      ?auto_171261 - BLOCK
      ?auto_171262 - BLOCK
      ?auto_171263 - BLOCK
      ?auto_171264 - BLOCK
      ?auto_171265 - BLOCK
      ?auto_171266 - BLOCK
      ?auto_171267 - BLOCK
      ?auto_171268 - BLOCK
      ?auto_171269 - BLOCK
    )
    :vars
    (
      ?auto_171270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171269 ?auto_171270 ) ( ON-TABLE ?auto_171259 ) ( ON ?auto_171260 ?auto_171259 ) ( ON ?auto_171261 ?auto_171260 ) ( ON ?auto_171262 ?auto_171261 ) ( ON ?auto_171263 ?auto_171262 ) ( ON ?auto_171264 ?auto_171263 ) ( ON ?auto_171265 ?auto_171264 ) ( ON ?auto_171266 ?auto_171265 ) ( not ( = ?auto_171259 ?auto_171260 ) ) ( not ( = ?auto_171259 ?auto_171261 ) ) ( not ( = ?auto_171259 ?auto_171262 ) ) ( not ( = ?auto_171259 ?auto_171263 ) ) ( not ( = ?auto_171259 ?auto_171264 ) ) ( not ( = ?auto_171259 ?auto_171265 ) ) ( not ( = ?auto_171259 ?auto_171266 ) ) ( not ( = ?auto_171259 ?auto_171267 ) ) ( not ( = ?auto_171259 ?auto_171268 ) ) ( not ( = ?auto_171259 ?auto_171269 ) ) ( not ( = ?auto_171259 ?auto_171270 ) ) ( not ( = ?auto_171260 ?auto_171261 ) ) ( not ( = ?auto_171260 ?auto_171262 ) ) ( not ( = ?auto_171260 ?auto_171263 ) ) ( not ( = ?auto_171260 ?auto_171264 ) ) ( not ( = ?auto_171260 ?auto_171265 ) ) ( not ( = ?auto_171260 ?auto_171266 ) ) ( not ( = ?auto_171260 ?auto_171267 ) ) ( not ( = ?auto_171260 ?auto_171268 ) ) ( not ( = ?auto_171260 ?auto_171269 ) ) ( not ( = ?auto_171260 ?auto_171270 ) ) ( not ( = ?auto_171261 ?auto_171262 ) ) ( not ( = ?auto_171261 ?auto_171263 ) ) ( not ( = ?auto_171261 ?auto_171264 ) ) ( not ( = ?auto_171261 ?auto_171265 ) ) ( not ( = ?auto_171261 ?auto_171266 ) ) ( not ( = ?auto_171261 ?auto_171267 ) ) ( not ( = ?auto_171261 ?auto_171268 ) ) ( not ( = ?auto_171261 ?auto_171269 ) ) ( not ( = ?auto_171261 ?auto_171270 ) ) ( not ( = ?auto_171262 ?auto_171263 ) ) ( not ( = ?auto_171262 ?auto_171264 ) ) ( not ( = ?auto_171262 ?auto_171265 ) ) ( not ( = ?auto_171262 ?auto_171266 ) ) ( not ( = ?auto_171262 ?auto_171267 ) ) ( not ( = ?auto_171262 ?auto_171268 ) ) ( not ( = ?auto_171262 ?auto_171269 ) ) ( not ( = ?auto_171262 ?auto_171270 ) ) ( not ( = ?auto_171263 ?auto_171264 ) ) ( not ( = ?auto_171263 ?auto_171265 ) ) ( not ( = ?auto_171263 ?auto_171266 ) ) ( not ( = ?auto_171263 ?auto_171267 ) ) ( not ( = ?auto_171263 ?auto_171268 ) ) ( not ( = ?auto_171263 ?auto_171269 ) ) ( not ( = ?auto_171263 ?auto_171270 ) ) ( not ( = ?auto_171264 ?auto_171265 ) ) ( not ( = ?auto_171264 ?auto_171266 ) ) ( not ( = ?auto_171264 ?auto_171267 ) ) ( not ( = ?auto_171264 ?auto_171268 ) ) ( not ( = ?auto_171264 ?auto_171269 ) ) ( not ( = ?auto_171264 ?auto_171270 ) ) ( not ( = ?auto_171265 ?auto_171266 ) ) ( not ( = ?auto_171265 ?auto_171267 ) ) ( not ( = ?auto_171265 ?auto_171268 ) ) ( not ( = ?auto_171265 ?auto_171269 ) ) ( not ( = ?auto_171265 ?auto_171270 ) ) ( not ( = ?auto_171266 ?auto_171267 ) ) ( not ( = ?auto_171266 ?auto_171268 ) ) ( not ( = ?auto_171266 ?auto_171269 ) ) ( not ( = ?auto_171266 ?auto_171270 ) ) ( not ( = ?auto_171267 ?auto_171268 ) ) ( not ( = ?auto_171267 ?auto_171269 ) ) ( not ( = ?auto_171267 ?auto_171270 ) ) ( not ( = ?auto_171268 ?auto_171269 ) ) ( not ( = ?auto_171268 ?auto_171270 ) ) ( not ( = ?auto_171269 ?auto_171270 ) ) ( ON ?auto_171268 ?auto_171269 ) ( CLEAR ?auto_171266 ) ( ON ?auto_171267 ?auto_171268 ) ( CLEAR ?auto_171267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_171259 ?auto_171260 ?auto_171261 ?auto_171262 ?auto_171263 ?auto_171264 ?auto_171265 ?auto_171266 ?auto_171267 )
      ( MAKE-11PILE ?auto_171259 ?auto_171260 ?auto_171261 ?auto_171262 ?auto_171263 ?auto_171264 ?auto_171265 ?auto_171266 ?auto_171267 ?auto_171268 ?auto_171269 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171282 - BLOCK
      ?auto_171283 - BLOCK
      ?auto_171284 - BLOCK
      ?auto_171285 - BLOCK
      ?auto_171286 - BLOCK
      ?auto_171287 - BLOCK
      ?auto_171288 - BLOCK
      ?auto_171289 - BLOCK
      ?auto_171290 - BLOCK
      ?auto_171291 - BLOCK
      ?auto_171292 - BLOCK
    )
    :vars
    (
      ?auto_171293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171292 ?auto_171293 ) ( ON-TABLE ?auto_171282 ) ( ON ?auto_171283 ?auto_171282 ) ( ON ?auto_171284 ?auto_171283 ) ( ON ?auto_171285 ?auto_171284 ) ( ON ?auto_171286 ?auto_171285 ) ( ON ?auto_171287 ?auto_171286 ) ( ON ?auto_171288 ?auto_171287 ) ( not ( = ?auto_171282 ?auto_171283 ) ) ( not ( = ?auto_171282 ?auto_171284 ) ) ( not ( = ?auto_171282 ?auto_171285 ) ) ( not ( = ?auto_171282 ?auto_171286 ) ) ( not ( = ?auto_171282 ?auto_171287 ) ) ( not ( = ?auto_171282 ?auto_171288 ) ) ( not ( = ?auto_171282 ?auto_171289 ) ) ( not ( = ?auto_171282 ?auto_171290 ) ) ( not ( = ?auto_171282 ?auto_171291 ) ) ( not ( = ?auto_171282 ?auto_171292 ) ) ( not ( = ?auto_171282 ?auto_171293 ) ) ( not ( = ?auto_171283 ?auto_171284 ) ) ( not ( = ?auto_171283 ?auto_171285 ) ) ( not ( = ?auto_171283 ?auto_171286 ) ) ( not ( = ?auto_171283 ?auto_171287 ) ) ( not ( = ?auto_171283 ?auto_171288 ) ) ( not ( = ?auto_171283 ?auto_171289 ) ) ( not ( = ?auto_171283 ?auto_171290 ) ) ( not ( = ?auto_171283 ?auto_171291 ) ) ( not ( = ?auto_171283 ?auto_171292 ) ) ( not ( = ?auto_171283 ?auto_171293 ) ) ( not ( = ?auto_171284 ?auto_171285 ) ) ( not ( = ?auto_171284 ?auto_171286 ) ) ( not ( = ?auto_171284 ?auto_171287 ) ) ( not ( = ?auto_171284 ?auto_171288 ) ) ( not ( = ?auto_171284 ?auto_171289 ) ) ( not ( = ?auto_171284 ?auto_171290 ) ) ( not ( = ?auto_171284 ?auto_171291 ) ) ( not ( = ?auto_171284 ?auto_171292 ) ) ( not ( = ?auto_171284 ?auto_171293 ) ) ( not ( = ?auto_171285 ?auto_171286 ) ) ( not ( = ?auto_171285 ?auto_171287 ) ) ( not ( = ?auto_171285 ?auto_171288 ) ) ( not ( = ?auto_171285 ?auto_171289 ) ) ( not ( = ?auto_171285 ?auto_171290 ) ) ( not ( = ?auto_171285 ?auto_171291 ) ) ( not ( = ?auto_171285 ?auto_171292 ) ) ( not ( = ?auto_171285 ?auto_171293 ) ) ( not ( = ?auto_171286 ?auto_171287 ) ) ( not ( = ?auto_171286 ?auto_171288 ) ) ( not ( = ?auto_171286 ?auto_171289 ) ) ( not ( = ?auto_171286 ?auto_171290 ) ) ( not ( = ?auto_171286 ?auto_171291 ) ) ( not ( = ?auto_171286 ?auto_171292 ) ) ( not ( = ?auto_171286 ?auto_171293 ) ) ( not ( = ?auto_171287 ?auto_171288 ) ) ( not ( = ?auto_171287 ?auto_171289 ) ) ( not ( = ?auto_171287 ?auto_171290 ) ) ( not ( = ?auto_171287 ?auto_171291 ) ) ( not ( = ?auto_171287 ?auto_171292 ) ) ( not ( = ?auto_171287 ?auto_171293 ) ) ( not ( = ?auto_171288 ?auto_171289 ) ) ( not ( = ?auto_171288 ?auto_171290 ) ) ( not ( = ?auto_171288 ?auto_171291 ) ) ( not ( = ?auto_171288 ?auto_171292 ) ) ( not ( = ?auto_171288 ?auto_171293 ) ) ( not ( = ?auto_171289 ?auto_171290 ) ) ( not ( = ?auto_171289 ?auto_171291 ) ) ( not ( = ?auto_171289 ?auto_171292 ) ) ( not ( = ?auto_171289 ?auto_171293 ) ) ( not ( = ?auto_171290 ?auto_171291 ) ) ( not ( = ?auto_171290 ?auto_171292 ) ) ( not ( = ?auto_171290 ?auto_171293 ) ) ( not ( = ?auto_171291 ?auto_171292 ) ) ( not ( = ?auto_171291 ?auto_171293 ) ) ( not ( = ?auto_171292 ?auto_171293 ) ) ( ON ?auto_171291 ?auto_171292 ) ( ON ?auto_171290 ?auto_171291 ) ( CLEAR ?auto_171288 ) ( ON ?auto_171289 ?auto_171290 ) ( CLEAR ?auto_171289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171282 ?auto_171283 ?auto_171284 ?auto_171285 ?auto_171286 ?auto_171287 ?auto_171288 ?auto_171289 )
      ( MAKE-11PILE ?auto_171282 ?auto_171283 ?auto_171284 ?auto_171285 ?auto_171286 ?auto_171287 ?auto_171288 ?auto_171289 ?auto_171290 ?auto_171291 ?auto_171292 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171305 - BLOCK
      ?auto_171306 - BLOCK
      ?auto_171307 - BLOCK
      ?auto_171308 - BLOCK
      ?auto_171309 - BLOCK
      ?auto_171310 - BLOCK
      ?auto_171311 - BLOCK
      ?auto_171312 - BLOCK
      ?auto_171313 - BLOCK
      ?auto_171314 - BLOCK
      ?auto_171315 - BLOCK
    )
    :vars
    (
      ?auto_171316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171315 ?auto_171316 ) ( ON-TABLE ?auto_171305 ) ( ON ?auto_171306 ?auto_171305 ) ( ON ?auto_171307 ?auto_171306 ) ( ON ?auto_171308 ?auto_171307 ) ( ON ?auto_171309 ?auto_171308 ) ( ON ?auto_171310 ?auto_171309 ) ( ON ?auto_171311 ?auto_171310 ) ( not ( = ?auto_171305 ?auto_171306 ) ) ( not ( = ?auto_171305 ?auto_171307 ) ) ( not ( = ?auto_171305 ?auto_171308 ) ) ( not ( = ?auto_171305 ?auto_171309 ) ) ( not ( = ?auto_171305 ?auto_171310 ) ) ( not ( = ?auto_171305 ?auto_171311 ) ) ( not ( = ?auto_171305 ?auto_171312 ) ) ( not ( = ?auto_171305 ?auto_171313 ) ) ( not ( = ?auto_171305 ?auto_171314 ) ) ( not ( = ?auto_171305 ?auto_171315 ) ) ( not ( = ?auto_171305 ?auto_171316 ) ) ( not ( = ?auto_171306 ?auto_171307 ) ) ( not ( = ?auto_171306 ?auto_171308 ) ) ( not ( = ?auto_171306 ?auto_171309 ) ) ( not ( = ?auto_171306 ?auto_171310 ) ) ( not ( = ?auto_171306 ?auto_171311 ) ) ( not ( = ?auto_171306 ?auto_171312 ) ) ( not ( = ?auto_171306 ?auto_171313 ) ) ( not ( = ?auto_171306 ?auto_171314 ) ) ( not ( = ?auto_171306 ?auto_171315 ) ) ( not ( = ?auto_171306 ?auto_171316 ) ) ( not ( = ?auto_171307 ?auto_171308 ) ) ( not ( = ?auto_171307 ?auto_171309 ) ) ( not ( = ?auto_171307 ?auto_171310 ) ) ( not ( = ?auto_171307 ?auto_171311 ) ) ( not ( = ?auto_171307 ?auto_171312 ) ) ( not ( = ?auto_171307 ?auto_171313 ) ) ( not ( = ?auto_171307 ?auto_171314 ) ) ( not ( = ?auto_171307 ?auto_171315 ) ) ( not ( = ?auto_171307 ?auto_171316 ) ) ( not ( = ?auto_171308 ?auto_171309 ) ) ( not ( = ?auto_171308 ?auto_171310 ) ) ( not ( = ?auto_171308 ?auto_171311 ) ) ( not ( = ?auto_171308 ?auto_171312 ) ) ( not ( = ?auto_171308 ?auto_171313 ) ) ( not ( = ?auto_171308 ?auto_171314 ) ) ( not ( = ?auto_171308 ?auto_171315 ) ) ( not ( = ?auto_171308 ?auto_171316 ) ) ( not ( = ?auto_171309 ?auto_171310 ) ) ( not ( = ?auto_171309 ?auto_171311 ) ) ( not ( = ?auto_171309 ?auto_171312 ) ) ( not ( = ?auto_171309 ?auto_171313 ) ) ( not ( = ?auto_171309 ?auto_171314 ) ) ( not ( = ?auto_171309 ?auto_171315 ) ) ( not ( = ?auto_171309 ?auto_171316 ) ) ( not ( = ?auto_171310 ?auto_171311 ) ) ( not ( = ?auto_171310 ?auto_171312 ) ) ( not ( = ?auto_171310 ?auto_171313 ) ) ( not ( = ?auto_171310 ?auto_171314 ) ) ( not ( = ?auto_171310 ?auto_171315 ) ) ( not ( = ?auto_171310 ?auto_171316 ) ) ( not ( = ?auto_171311 ?auto_171312 ) ) ( not ( = ?auto_171311 ?auto_171313 ) ) ( not ( = ?auto_171311 ?auto_171314 ) ) ( not ( = ?auto_171311 ?auto_171315 ) ) ( not ( = ?auto_171311 ?auto_171316 ) ) ( not ( = ?auto_171312 ?auto_171313 ) ) ( not ( = ?auto_171312 ?auto_171314 ) ) ( not ( = ?auto_171312 ?auto_171315 ) ) ( not ( = ?auto_171312 ?auto_171316 ) ) ( not ( = ?auto_171313 ?auto_171314 ) ) ( not ( = ?auto_171313 ?auto_171315 ) ) ( not ( = ?auto_171313 ?auto_171316 ) ) ( not ( = ?auto_171314 ?auto_171315 ) ) ( not ( = ?auto_171314 ?auto_171316 ) ) ( not ( = ?auto_171315 ?auto_171316 ) ) ( ON ?auto_171314 ?auto_171315 ) ( ON ?auto_171313 ?auto_171314 ) ( CLEAR ?auto_171311 ) ( ON ?auto_171312 ?auto_171313 ) ( CLEAR ?auto_171312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171305 ?auto_171306 ?auto_171307 ?auto_171308 ?auto_171309 ?auto_171310 ?auto_171311 ?auto_171312 )
      ( MAKE-11PILE ?auto_171305 ?auto_171306 ?auto_171307 ?auto_171308 ?auto_171309 ?auto_171310 ?auto_171311 ?auto_171312 ?auto_171313 ?auto_171314 ?auto_171315 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171328 - BLOCK
      ?auto_171329 - BLOCK
      ?auto_171330 - BLOCK
      ?auto_171331 - BLOCK
      ?auto_171332 - BLOCK
      ?auto_171333 - BLOCK
      ?auto_171334 - BLOCK
      ?auto_171335 - BLOCK
      ?auto_171336 - BLOCK
      ?auto_171337 - BLOCK
      ?auto_171338 - BLOCK
    )
    :vars
    (
      ?auto_171339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171338 ?auto_171339 ) ( ON-TABLE ?auto_171328 ) ( ON ?auto_171329 ?auto_171328 ) ( ON ?auto_171330 ?auto_171329 ) ( ON ?auto_171331 ?auto_171330 ) ( ON ?auto_171332 ?auto_171331 ) ( ON ?auto_171333 ?auto_171332 ) ( not ( = ?auto_171328 ?auto_171329 ) ) ( not ( = ?auto_171328 ?auto_171330 ) ) ( not ( = ?auto_171328 ?auto_171331 ) ) ( not ( = ?auto_171328 ?auto_171332 ) ) ( not ( = ?auto_171328 ?auto_171333 ) ) ( not ( = ?auto_171328 ?auto_171334 ) ) ( not ( = ?auto_171328 ?auto_171335 ) ) ( not ( = ?auto_171328 ?auto_171336 ) ) ( not ( = ?auto_171328 ?auto_171337 ) ) ( not ( = ?auto_171328 ?auto_171338 ) ) ( not ( = ?auto_171328 ?auto_171339 ) ) ( not ( = ?auto_171329 ?auto_171330 ) ) ( not ( = ?auto_171329 ?auto_171331 ) ) ( not ( = ?auto_171329 ?auto_171332 ) ) ( not ( = ?auto_171329 ?auto_171333 ) ) ( not ( = ?auto_171329 ?auto_171334 ) ) ( not ( = ?auto_171329 ?auto_171335 ) ) ( not ( = ?auto_171329 ?auto_171336 ) ) ( not ( = ?auto_171329 ?auto_171337 ) ) ( not ( = ?auto_171329 ?auto_171338 ) ) ( not ( = ?auto_171329 ?auto_171339 ) ) ( not ( = ?auto_171330 ?auto_171331 ) ) ( not ( = ?auto_171330 ?auto_171332 ) ) ( not ( = ?auto_171330 ?auto_171333 ) ) ( not ( = ?auto_171330 ?auto_171334 ) ) ( not ( = ?auto_171330 ?auto_171335 ) ) ( not ( = ?auto_171330 ?auto_171336 ) ) ( not ( = ?auto_171330 ?auto_171337 ) ) ( not ( = ?auto_171330 ?auto_171338 ) ) ( not ( = ?auto_171330 ?auto_171339 ) ) ( not ( = ?auto_171331 ?auto_171332 ) ) ( not ( = ?auto_171331 ?auto_171333 ) ) ( not ( = ?auto_171331 ?auto_171334 ) ) ( not ( = ?auto_171331 ?auto_171335 ) ) ( not ( = ?auto_171331 ?auto_171336 ) ) ( not ( = ?auto_171331 ?auto_171337 ) ) ( not ( = ?auto_171331 ?auto_171338 ) ) ( not ( = ?auto_171331 ?auto_171339 ) ) ( not ( = ?auto_171332 ?auto_171333 ) ) ( not ( = ?auto_171332 ?auto_171334 ) ) ( not ( = ?auto_171332 ?auto_171335 ) ) ( not ( = ?auto_171332 ?auto_171336 ) ) ( not ( = ?auto_171332 ?auto_171337 ) ) ( not ( = ?auto_171332 ?auto_171338 ) ) ( not ( = ?auto_171332 ?auto_171339 ) ) ( not ( = ?auto_171333 ?auto_171334 ) ) ( not ( = ?auto_171333 ?auto_171335 ) ) ( not ( = ?auto_171333 ?auto_171336 ) ) ( not ( = ?auto_171333 ?auto_171337 ) ) ( not ( = ?auto_171333 ?auto_171338 ) ) ( not ( = ?auto_171333 ?auto_171339 ) ) ( not ( = ?auto_171334 ?auto_171335 ) ) ( not ( = ?auto_171334 ?auto_171336 ) ) ( not ( = ?auto_171334 ?auto_171337 ) ) ( not ( = ?auto_171334 ?auto_171338 ) ) ( not ( = ?auto_171334 ?auto_171339 ) ) ( not ( = ?auto_171335 ?auto_171336 ) ) ( not ( = ?auto_171335 ?auto_171337 ) ) ( not ( = ?auto_171335 ?auto_171338 ) ) ( not ( = ?auto_171335 ?auto_171339 ) ) ( not ( = ?auto_171336 ?auto_171337 ) ) ( not ( = ?auto_171336 ?auto_171338 ) ) ( not ( = ?auto_171336 ?auto_171339 ) ) ( not ( = ?auto_171337 ?auto_171338 ) ) ( not ( = ?auto_171337 ?auto_171339 ) ) ( not ( = ?auto_171338 ?auto_171339 ) ) ( ON ?auto_171337 ?auto_171338 ) ( ON ?auto_171336 ?auto_171337 ) ( ON ?auto_171335 ?auto_171336 ) ( CLEAR ?auto_171333 ) ( ON ?auto_171334 ?auto_171335 ) ( CLEAR ?auto_171334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171328 ?auto_171329 ?auto_171330 ?auto_171331 ?auto_171332 ?auto_171333 ?auto_171334 )
      ( MAKE-11PILE ?auto_171328 ?auto_171329 ?auto_171330 ?auto_171331 ?auto_171332 ?auto_171333 ?auto_171334 ?auto_171335 ?auto_171336 ?auto_171337 ?auto_171338 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171351 - BLOCK
      ?auto_171352 - BLOCK
      ?auto_171353 - BLOCK
      ?auto_171354 - BLOCK
      ?auto_171355 - BLOCK
      ?auto_171356 - BLOCK
      ?auto_171357 - BLOCK
      ?auto_171358 - BLOCK
      ?auto_171359 - BLOCK
      ?auto_171360 - BLOCK
      ?auto_171361 - BLOCK
    )
    :vars
    (
      ?auto_171362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171361 ?auto_171362 ) ( ON-TABLE ?auto_171351 ) ( ON ?auto_171352 ?auto_171351 ) ( ON ?auto_171353 ?auto_171352 ) ( ON ?auto_171354 ?auto_171353 ) ( ON ?auto_171355 ?auto_171354 ) ( ON ?auto_171356 ?auto_171355 ) ( not ( = ?auto_171351 ?auto_171352 ) ) ( not ( = ?auto_171351 ?auto_171353 ) ) ( not ( = ?auto_171351 ?auto_171354 ) ) ( not ( = ?auto_171351 ?auto_171355 ) ) ( not ( = ?auto_171351 ?auto_171356 ) ) ( not ( = ?auto_171351 ?auto_171357 ) ) ( not ( = ?auto_171351 ?auto_171358 ) ) ( not ( = ?auto_171351 ?auto_171359 ) ) ( not ( = ?auto_171351 ?auto_171360 ) ) ( not ( = ?auto_171351 ?auto_171361 ) ) ( not ( = ?auto_171351 ?auto_171362 ) ) ( not ( = ?auto_171352 ?auto_171353 ) ) ( not ( = ?auto_171352 ?auto_171354 ) ) ( not ( = ?auto_171352 ?auto_171355 ) ) ( not ( = ?auto_171352 ?auto_171356 ) ) ( not ( = ?auto_171352 ?auto_171357 ) ) ( not ( = ?auto_171352 ?auto_171358 ) ) ( not ( = ?auto_171352 ?auto_171359 ) ) ( not ( = ?auto_171352 ?auto_171360 ) ) ( not ( = ?auto_171352 ?auto_171361 ) ) ( not ( = ?auto_171352 ?auto_171362 ) ) ( not ( = ?auto_171353 ?auto_171354 ) ) ( not ( = ?auto_171353 ?auto_171355 ) ) ( not ( = ?auto_171353 ?auto_171356 ) ) ( not ( = ?auto_171353 ?auto_171357 ) ) ( not ( = ?auto_171353 ?auto_171358 ) ) ( not ( = ?auto_171353 ?auto_171359 ) ) ( not ( = ?auto_171353 ?auto_171360 ) ) ( not ( = ?auto_171353 ?auto_171361 ) ) ( not ( = ?auto_171353 ?auto_171362 ) ) ( not ( = ?auto_171354 ?auto_171355 ) ) ( not ( = ?auto_171354 ?auto_171356 ) ) ( not ( = ?auto_171354 ?auto_171357 ) ) ( not ( = ?auto_171354 ?auto_171358 ) ) ( not ( = ?auto_171354 ?auto_171359 ) ) ( not ( = ?auto_171354 ?auto_171360 ) ) ( not ( = ?auto_171354 ?auto_171361 ) ) ( not ( = ?auto_171354 ?auto_171362 ) ) ( not ( = ?auto_171355 ?auto_171356 ) ) ( not ( = ?auto_171355 ?auto_171357 ) ) ( not ( = ?auto_171355 ?auto_171358 ) ) ( not ( = ?auto_171355 ?auto_171359 ) ) ( not ( = ?auto_171355 ?auto_171360 ) ) ( not ( = ?auto_171355 ?auto_171361 ) ) ( not ( = ?auto_171355 ?auto_171362 ) ) ( not ( = ?auto_171356 ?auto_171357 ) ) ( not ( = ?auto_171356 ?auto_171358 ) ) ( not ( = ?auto_171356 ?auto_171359 ) ) ( not ( = ?auto_171356 ?auto_171360 ) ) ( not ( = ?auto_171356 ?auto_171361 ) ) ( not ( = ?auto_171356 ?auto_171362 ) ) ( not ( = ?auto_171357 ?auto_171358 ) ) ( not ( = ?auto_171357 ?auto_171359 ) ) ( not ( = ?auto_171357 ?auto_171360 ) ) ( not ( = ?auto_171357 ?auto_171361 ) ) ( not ( = ?auto_171357 ?auto_171362 ) ) ( not ( = ?auto_171358 ?auto_171359 ) ) ( not ( = ?auto_171358 ?auto_171360 ) ) ( not ( = ?auto_171358 ?auto_171361 ) ) ( not ( = ?auto_171358 ?auto_171362 ) ) ( not ( = ?auto_171359 ?auto_171360 ) ) ( not ( = ?auto_171359 ?auto_171361 ) ) ( not ( = ?auto_171359 ?auto_171362 ) ) ( not ( = ?auto_171360 ?auto_171361 ) ) ( not ( = ?auto_171360 ?auto_171362 ) ) ( not ( = ?auto_171361 ?auto_171362 ) ) ( ON ?auto_171360 ?auto_171361 ) ( ON ?auto_171359 ?auto_171360 ) ( ON ?auto_171358 ?auto_171359 ) ( CLEAR ?auto_171356 ) ( ON ?auto_171357 ?auto_171358 ) ( CLEAR ?auto_171357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171351 ?auto_171352 ?auto_171353 ?auto_171354 ?auto_171355 ?auto_171356 ?auto_171357 )
      ( MAKE-11PILE ?auto_171351 ?auto_171352 ?auto_171353 ?auto_171354 ?auto_171355 ?auto_171356 ?auto_171357 ?auto_171358 ?auto_171359 ?auto_171360 ?auto_171361 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171374 - BLOCK
      ?auto_171375 - BLOCK
      ?auto_171376 - BLOCK
      ?auto_171377 - BLOCK
      ?auto_171378 - BLOCK
      ?auto_171379 - BLOCK
      ?auto_171380 - BLOCK
      ?auto_171381 - BLOCK
      ?auto_171382 - BLOCK
      ?auto_171383 - BLOCK
      ?auto_171384 - BLOCK
    )
    :vars
    (
      ?auto_171385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171384 ?auto_171385 ) ( ON-TABLE ?auto_171374 ) ( ON ?auto_171375 ?auto_171374 ) ( ON ?auto_171376 ?auto_171375 ) ( ON ?auto_171377 ?auto_171376 ) ( ON ?auto_171378 ?auto_171377 ) ( not ( = ?auto_171374 ?auto_171375 ) ) ( not ( = ?auto_171374 ?auto_171376 ) ) ( not ( = ?auto_171374 ?auto_171377 ) ) ( not ( = ?auto_171374 ?auto_171378 ) ) ( not ( = ?auto_171374 ?auto_171379 ) ) ( not ( = ?auto_171374 ?auto_171380 ) ) ( not ( = ?auto_171374 ?auto_171381 ) ) ( not ( = ?auto_171374 ?auto_171382 ) ) ( not ( = ?auto_171374 ?auto_171383 ) ) ( not ( = ?auto_171374 ?auto_171384 ) ) ( not ( = ?auto_171374 ?auto_171385 ) ) ( not ( = ?auto_171375 ?auto_171376 ) ) ( not ( = ?auto_171375 ?auto_171377 ) ) ( not ( = ?auto_171375 ?auto_171378 ) ) ( not ( = ?auto_171375 ?auto_171379 ) ) ( not ( = ?auto_171375 ?auto_171380 ) ) ( not ( = ?auto_171375 ?auto_171381 ) ) ( not ( = ?auto_171375 ?auto_171382 ) ) ( not ( = ?auto_171375 ?auto_171383 ) ) ( not ( = ?auto_171375 ?auto_171384 ) ) ( not ( = ?auto_171375 ?auto_171385 ) ) ( not ( = ?auto_171376 ?auto_171377 ) ) ( not ( = ?auto_171376 ?auto_171378 ) ) ( not ( = ?auto_171376 ?auto_171379 ) ) ( not ( = ?auto_171376 ?auto_171380 ) ) ( not ( = ?auto_171376 ?auto_171381 ) ) ( not ( = ?auto_171376 ?auto_171382 ) ) ( not ( = ?auto_171376 ?auto_171383 ) ) ( not ( = ?auto_171376 ?auto_171384 ) ) ( not ( = ?auto_171376 ?auto_171385 ) ) ( not ( = ?auto_171377 ?auto_171378 ) ) ( not ( = ?auto_171377 ?auto_171379 ) ) ( not ( = ?auto_171377 ?auto_171380 ) ) ( not ( = ?auto_171377 ?auto_171381 ) ) ( not ( = ?auto_171377 ?auto_171382 ) ) ( not ( = ?auto_171377 ?auto_171383 ) ) ( not ( = ?auto_171377 ?auto_171384 ) ) ( not ( = ?auto_171377 ?auto_171385 ) ) ( not ( = ?auto_171378 ?auto_171379 ) ) ( not ( = ?auto_171378 ?auto_171380 ) ) ( not ( = ?auto_171378 ?auto_171381 ) ) ( not ( = ?auto_171378 ?auto_171382 ) ) ( not ( = ?auto_171378 ?auto_171383 ) ) ( not ( = ?auto_171378 ?auto_171384 ) ) ( not ( = ?auto_171378 ?auto_171385 ) ) ( not ( = ?auto_171379 ?auto_171380 ) ) ( not ( = ?auto_171379 ?auto_171381 ) ) ( not ( = ?auto_171379 ?auto_171382 ) ) ( not ( = ?auto_171379 ?auto_171383 ) ) ( not ( = ?auto_171379 ?auto_171384 ) ) ( not ( = ?auto_171379 ?auto_171385 ) ) ( not ( = ?auto_171380 ?auto_171381 ) ) ( not ( = ?auto_171380 ?auto_171382 ) ) ( not ( = ?auto_171380 ?auto_171383 ) ) ( not ( = ?auto_171380 ?auto_171384 ) ) ( not ( = ?auto_171380 ?auto_171385 ) ) ( not ( = ?auto_171381 ?auto_171382 ) ) ( not ( = ?auto_171381 ?auto_171383 ) ) ( not ( = ?auto_171381 ?auto_171384 ) ) ( not ( = ?auto_171381 ?auto_171385 ) ) ( not ( = ?auto_171382 ?auto_171383 ) ) ( not ( = ?auto_171382 ?auto_171384 ) ) ( not ( = ?auto_171382 ?auto_171385 ) ) ( not ( = ?auto_171383 ?auto_171384 ) ) ( not ( = ?auto_171383 ?auto_171385 ) ) ( not ( = ?auto_171384 ?auto_171385 ) ) ( ON ?auto_171383 ?auto_171384 ) ( ON ?auto_171382 ?auto_171383 ) ( ON ?auto_171381 ?auto_171382 ) ( ON ?auto_171380 ?auto_171381 ) ( CLEAR ?auto_171378 ) ( ON ?auto_171379 ?auto_171380 ) ( CLEAR ?auto_171379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171374 ?auto_171375 ?auto_171376 ?auto_171377 ?auto_171378 ?auto_171379 )
      ( MAKE-11PILE ?auto_171374 ?auto_171375 ?auto_171376 ?auto_171377 ?auto_171378 ?auto_171379 ?auto_171380 ?auto_171381 ?auto_171382 ?auto_171383 ?auto_171384 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171397 - BLOCK
      ?auto_171398 - BLOCK
      ?auto_171399 - BLOCK
      ?auto_171400 - BLOCK
      ?auto_171401 - BLOCK
      ?auto_171402 - BLOCK
      ?auto_171403 - BLOCK
      ?auto_171404 - BLOCK
      ?auto_171405 - BLOCK
      ?auto_171406 - BLOCK
      ?auto_171407 - BLOCK
    )
    :vars
    (
      ?auto_171408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171407 ?auto_171408 ) ( ON-TABLE ?auto_171397 ) ( ON ?auto_171398 ?auto_171397 ) ( ON ?auto_171399 ?auto_171398 ) ( ON ?auto_171400 ?auto_171399 ) ( ON ?auto_171401 ?auto_171400 ) ( not ( = ?auto_171397 ?auto_171398 ) ) ( not ( = ?auto_171397 ?auto_171399 ) ) ( not ( = ?auto_171397 ?auto_171400 ) ) ( not ( = ?auto_171397 ?auto_171401 ) ) ( not ( = ?auto_171397 ?auto_171402 ) ) ( not ( = ?auto_171397 ?auto_171403 ) ) ( not ( = ?auto_171397 ?auto_171404 ) ) ( not ( = ?auto_171397 ?auto_171405 ) ) ( not ( = ?auto_171397 ?auto_171406 ) ) ( not ( = ?auto_171397 ?auto_171407 ) ) ( not ( = ?auto_171397 ?auto_171408 ) ) ( not ( = ?auto_171398 ?auto_171399 ) ) ( not ( = ?auto_171398 ?auto_171400 ) ) ( not ( = ?auto_171398 ?auto_171401 ) ) ( not ( = ?auto_171398 ?auto_171402 ) ) ( not ( = ?auto_171398 ?auto_171403 ) ) ( not ( = ?auto_171398 ?auto_171404 ) ) ( not ( = ?auto_171398 ?auto_171405 ) ) ( not ( = ?auto_171398 ?auto_171406 ) ) ( not ( = ?auto_171398 ?auto_171407 ) ) ( not ( = ?auto_171398 ?auto_171408 ) ) ( not ( = ?auto_171399 ?auto_171400 ) ) ( not ( = ?auto_171399 ?auto_171401 ) ) ( not ( = ?auto_171399 ?auto_171402 ) ) ( not ( = ?auto_171399 ?auto_171403 ) ) ( not ( = ?auto_171399 ?auto_171404 ) ) ( not ( = ?auto_171399 ?auto_171405 ) ) ( not ( = ?auto_171399 ?auto_171406 ) ) ( not ( = ?auto_171399 ?auto_171407 ) ) ( not ( = ?auto_171399 ?auto_171408 ) ) ( not ( = ?auto_171400 ?auto_171401 ) ) ( not ( = ?auto_171400 ?auto_171402 ) ) ( not ( = ?auto_171400 ?auto_171403 ) ) ( not ( = ?auto_171400 ?auto_171404 ) ) ( not ( = ?auto_171400 ?auto_171405 ) ) ( not ( = ?auto_171400 ?auto_171406 ) ) ( not ( = ?auto_171400 ?auto_171407 ) ) ( not ( = ?auto_171400 ?auto_171408 ) ) ( not ( = ?auto_171401 ?auto_171402 ) ) ( not ( = ?auto_171401 ?auto_171403 ) ) ( not ( = ?auto_171401 ?auto_171404 ) ) ( not ( = ?auto_171401 ?auto_171405 ) ) ( not ( = ?auto_171401 ?auto_171406 ) ) ( not ( = ?auto_171401 ?auto_171407 ) ) ( not ( = ?auto_171401 ?auto_171408 ) ) ( not ( = ?auto_171402 ?auto_171403 ) ) ( not ( = ?auto_171402 ?auto_171404 ) ) ( not ( = ?auto_171402 ?auto_171405 ) ) ( not ( = ?auto_171402 ?auto_171406 ) ) ( not ( = ?auto_171402 ?auto_171407 ) ) ( not ( = ?auto_171402 ?auto_171408 ) ) ( not ( = ?auto_171403 ?auto_171404 ) ) ( not ( = ?auto_171403 ?auto_171405 ) ) ( not ( = ?auto_171403 ?auto_171406 ) ) ( not ( = ?auto_171403 ?auto_171407 ) ) ( not ( = ?auto_171403 ?auto_171408 ) ) ( not ( = ?auto_171404 ?auto_171405 ) ) ( not ( = ?auto_171404 ?auto_171406 ) ) ( not ( = ?auto_171404 ?auto_171407 ) ) ( not ( = ?auto_171404 ?auto_171408 ) ) ( not ( = ?auto_171405 ?auto_171406 ) ) ( not ( = ?auto_171405 ?auto_171407 ) ) ( not ( = ?auto_171405 ?auto_171408 ) ) ( not ( = ?auto_171406 ?auto_171407 ) ) ( not ( = ?auto_171406 ?auto_171408 ) ) ( not ( = ?auto_171407 ?auto_171408 ) ) ( ON ?auto_171406 ?auto_171407 ) ( ON ?auto_171405 ?auto_171406 ) ( ON ?auto_171404 ?auto_171405 ) ( ON ?auto_171403 ?auto_171404 ) ( CLEAR ?auto_171401 ) ( ON ?auto_171402 ?auto_171403 ) ( CLEAR ?auto_171402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171397 ?auto_171398 ?auto_171399 ?auto_171400 ?auto_171401 ?auto_171402 )
      ( MAKE-11PILE ?auto_171397 ?auto_171398 ?auto_171399 ?auto_171400 ?auto_171401 ?auto_171402 ?auto_171403 ?auto_171404 ?auto_171405 ?auto_171406 ?auto_171407 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171420 - BLOCK
      ?auto_171421 - BLOCK
      ?auto_171422 - BLOCK
      ?auto_171423 - BLOCK
      ?auto_171424 - BLOCK
      ?auto_171425 - BLOCK
      ?auto_171426 - BLOCK
      ?auto_171427 - BLOCK
      ?auto_171428 - BLOCK
      ?auto_171429 - BLOCK
      ?auto_171430 - BLOCK
    )
    :vars
    (
      ?auto_171431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171430 ?auto_171431 ) ( ON-TABLE ?auto_171420 ) ( ON ?auto_171421 ?auto_171420 ) ( ON ?auto_171422 ?auto_171421 ) ( ON ?auto_171423 ?auto_171422 ) ( not ( = ?auto_171420 ?auto_171421 ) ) ( not ( = ?auto_171420 ?auto_171422 ) ) ( not ( = ?auto_171420 ?auto_171423 ) ) ( not ( = ?auto_171420 ?auto_171424 ) ) ( not ( = ?auto_171420 ?auto_171425 ) ) ( not ( = ?auto_171420 ?auto_171426 ) ) ( not ( = ?auto_171420 ?auto_171427 ) ) ( not ( = ?auto_171420 ?auto_171428 ) ) ( not ( = ?auto_171420 ?auto_171429 ) ) ( not ( = ?auto_171420 ?auto_171430 ) ) ( not ( = ?auto_171420 ?auto_171431 ) ) ( not ( = ?auto_171421 ?auto_171422 ) ) ( not ( = ?auto_171421 ?auto_171423 ) ) ( not ( = ?auto_171421 ?auto_171424 ) ) ( not ( = ?auto_171421 ?auto_171425 ) ) ( not ( = ?auto_171421 ?auto_171426 ) ) ( not ( = ?auto_171421 ?auto_171427 ) ) ( not ( = ?auto_171421 ?auto_171428 ) ) ( not ( = ?auto_171421 ?auto_171429 ) ) ( not ( = ?auto_171421 ?auto_171430 ) ) ( not ( = ?auto_171421 ?auto_171431 ) ) ( not ( = ?auto_171422 ?auto_171423 ) ) ( not ( = ?auto_171422 ?auto_171424 ) ) ( not ( = ?auto_171422 ?auto_171425 ) ) ( not ( = ?auto_171422 ?auto_171426 ) ) ( not ( = ?auto_171422 ?auto_171427 ) ) ( not ( = ?auto_171422 ?auto_171428 ) ) ( not ( = ?auto_171422 ?auto_171429 ) ) ( not ( = ?auto_171422 ?auto_171430 ) ) ( not ( = ?auto_171422 ?auto_171431 ) ) ( not ( = ?auto_171423 ?auto_171424 ) ) ( not ( = ?auto_171423 ?auto_171425 ) ) ( not ( = ?auto_171423 ?auto_171426 ) ) ( not ( = ?auto_171423 ?auto_171427 ) ) ( not ( = ?auto_171423 ?auto_171428 ) ) ( not ( = ?auto_171423 ?auto_171429 ) ) ( not ( = ?auto_171423 ?auto_171430 ) ) ( not ( = ?auto_171423 ?auto_171431 ) ) ( not ( = ?auto_171424 ?auto_171425 ) ) ( not ( = ?auto_171424 ?auto_171426 ) ) ( not ( = ?auto_171424 ?auto_171427 ) ) ( not ( = ?auto_171424 ?auto_171428 ) ) ( not ( = ?auto_171424 ?auto_171429 ) ) ( not ( = ?auto_171424 ?auto_171430 ) ) ( not ( = ?auto_171424 ?auto_171431 ) ) ( not ( = ?auto_171425 ?auto_171426 ) ) ( not ( = ?auto_171425 ?auto_171427 ) ) ( not ( = ?auto_171425 ?auto_171428 ) ) ( not ( = ?auto_171425 ?auto_171429 ) ) ( not ( = ?auto_171425 ?auto_171430 ) ) ( not ( = ?auto_171425 ?auto_171431 ) ) ( not ( = ?auto_171426 ?auto_171427 ) ) ( not ( = ?auto_171426 ?auto_171428 ) ) ( not ( = ?auto_171426 ?auto_171429 ) ) ( not ( = ?auto_171426 ?auto_171430 ) ) ( not ( = ?auto_171426 ?auto_171431 ) ) ( not ( = ?auto_171427 ?auto_171428 ) ) ( not ( = ?auto_171427 ?auto_171429 ) ) ( not ( = ?auto_171427 ?auto_171430 ) ) ( not ( = ?auto_171427 ?auto_171431 ) ) ( not ( = ?auto_171428 ?auto_171429 ) ) ( not ( = ?auto_171428 ?auto_171430 ) ) ( not ( = ?auto_171428 ?auto_171431 ) ) ( not ( = ?auto_171429 ?auto_171430 ) ) ( not ( = ?auto_171429 ?auto_171431 ) ) ( not ( = ?auto_171430 ?auto_171431 ) ) ( ON ?auto_171429 ?auto_171430 ) ( ON ?auto_171428 ?auto_171429 ) ( ON ?auto_171427 ?auto_171428 ) ( ON ?auto_171426 ?auto_171427 ) ( ON ?auto_171425 ?auto_171426 ) ( CLEAR ?auto_171423 ) ( ON ?auto_171424 ?auto_171425 ) ( CLEAR ?auto_171424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171420 ?auto_171421 ?auto_171422 ?auto_171423 ?auto_171424 )
      ( MAKE-11PILE ?auto_171420 ?auto_171421 ?auto_171422 ?auto_171423 ?auto_171424 ?auto_171425 ?auto_171426 ?auto_171427 ?auto_171428 ?auto_171429 ?auto_171430 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171443 - BLOCK
      ?auto_171444 - BLOCK
      ?auto_171445 - BLOCK
      ?auto_171446 - BLOCK
      ?auto_171447 - BLOCK
      ?auto_171448 - BLOCK
      ?auto_171449 - BLOCK
      ?auto_171450 - BLOCK
      ?auto_171451 - BLOCK
      ?auto_171452 - BLOCK
      ?auto_171453 - BLOCK
    )
    :vars
    (
      ?auto_171454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171453 ?auto_171454 ) ( ON-TABLE ?auto_171443 ) ( ON ?auto_171444 ?auto_171443 ) ( ON ?auto_171445 ?auto_171444 ) ( ON ?auto_171446 ?auto_171445 ) ( not ( = ?auto_171443 ?auto_171444 ) ) ( not ( = ?auto_171443 ?auto_171445 ) ) ( not ( = ?auto_171443 ?auto_171446 ) ) ( not ( = ?auto_171443 ?auto_171447 ) ) ( not ( = ?auto_171443 ?auto_171448 ) ) ( not ( = ?auto_171443 ?auto_171449 ) ) ( not ( = ?auto_171443 ?auto_171450 ) ) ( not ( = ?auto_171443 ?auto_171451 ) ) ( not ( = ?auto_171443 ?auto_171452 ) ) ( not ( = ?auto_171443 ?auto_171453 ) ) ( not ( = ?auto_171443 ?auto_171454 ) ) ( not ( = ?auto_171444 ?auto_171445 ) ) ( not ( = ?auto_171444 ?auto_171446 ) ) ( not ( = ?auto_171444 ?auto_171447 ) ) ( not ( = ?auto_171444 ?auto_171448 ) ) ( not ( = ?auto_171444 ?auto_171449 ) ) ( not ( = ?auto_171444 ?auto_171450 ) ) ( not ( = ?auto_171444 ?auto_171451 ) ) ( not ( = ?auto_171444 ?auto_171452 ) ) ( not ( = ?auto_171444 ?auto_171453 ) ) ( not ( = ?auto_171444 ?auto_171454 ) ) ( not ( = ?auto_171445 ?auto_171446 ) ) ( not ( = ?auto_171445 ?auto_171447 ) ) ( not ( = ?auto_171445 ?auto_171448 ) ) ( not ( = ?auto_171445 ?auto_171449 ) ) ( not ( = ?auto_171445 ?auto_171450 ) ) ( not ( = ?auto_171445 ?auto_171451 ) ) ( not ( = ?auto_171445 ?auto_171452 ) ) ( not ( = ?auto_171445 ?auto_171453 ) ) ( not ( = ?auto_171445 ?auto_171454 ) ) ( not ( = ?auto_171446 ?auto_171447 ) ) ( not ( = ?auto_171446 ?auto_171448 ) ) ( not ( = ?auto_171446 ?auto_171449 ) ) ( not ( = ?auto_171446 ?auto_171450 ) ) ( not ( = ?auto_171446 ?auto_171451 ) ) ( not ( = ?auto_171446 ?auto_171452 ) ) ( not ( = ?auto_171446 ?auto_171453 ) ) ( not ( = ?auto_171446 ?auto_171454 ) ) ( not ( = ?auto_171447 ?auto_171448 ) ) ( not ( = ?auto_171447 ?auto_171449 ) ) ( not ( = ?auto_171447 ?auto_171450 ) ) ( not ( = ?auto_171447 ?auto_171451 ) ) ( not ( = ?auto_171447 ?auto_171452 ) ) ( not ( = ?auto_171447 ?auto_171453 ) ) ( not ( = ?auto_171447 ?auto_171454 ) ) ( not ( = ?auto_171448 ?auto_171449 ) ) ( not ( = ?auto_171448 ?auto_171450 ) ) ( not ( = ?auto_171448 ?auto_171451 ) ) ( not ( = ?auto_171448 ?auto_171452 ) ) ( not ( = ?auto_171448 ?auto_171453 ) ) ( not ( = ?auto_171448 ?auto_171454 ) ) ( not ( = ?auto_171449 ?auto_171450 ) ) ( not ( = ?auto_171449 ?auto_171451 ) ) ( not ( = ?auto_171449 ?auto_171452 ) ) ( not ( = ?auto_171449 ?auto_171453 ) ) ( not ( = ?auto_171449 ?auto_171454 ) ) ( not ( = ?auto_171450 ?auto_171451 ) ) ( not ( = ?auto_171450 ?auto_171452 ) ) ( not ( = ?auto_171450 ?auto_171453 ) ) ( not ( = ?auto_171450 ?auto_171454 ) ) ( not ( = ?auto_171451 ?auto_171452 ) ) ( not ( = ?auto_171451 ?auto_171453 ) ) ( not ( = ?auto_171451 ?auto_171454 ) ) ( not ( = ?auto_171452 ?auto_171453 ) ) ( not ( = ?auto_171452 ?auto_171454 ) ) ( not ( = ?auto_171453 ?auto_171454 ) ) ( ON ?auto_171452 ?auto_171453 ) ( ON ?auto_171451 ?auto_171452 ) ( ON ?auto_171450 ?auto_171451 ) ( ON ?auto_171449 ?auto_171450 ) ( ON ?auto_171448 ?auto_171449 ) ( CLEAR ?auto_171446 ) ( ON ?auto_171447 ?auto_171448 ) ( CLEAR ?auto_171447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171443 ?auto_171444 ?auto_171445 ?auto_171446 ?auto_171447 )
      ( MAKE-11PILE ?auto_171443 ?auto_171444 ?auto_171445 ?auto_171446 ?auto_171447 ?auto_171448 ?auto_171449 ?auto_171450 ?auto_171451 ?auto_171452 ?auto_171453 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171466 - BLOCK
      ?auto_171467 - BLOCK
      ?auto_171468 - BLOCK
      ?auto_171469 - BLOCK
      ?auto_171470 - BLOCK
      ?auto_171471 - BLOCK
      ?auto_171472 - BLOCK
      ?auto_171473 - BLOCK
      ?auto_171474 - BLOCK
      ?auto_171475 - BLOCK
      ?auto_171476 - BLOCK
    )
    :vars
    (
      ?auto_171477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171476 ?auto_171477 ) ( ON-TABLE ?auto_171466 ) ( ON ?auto_171467 ?auto_171466 ) ( ON ?auto_171468 ?auto_171467 ) ( not ( = ?auto_171466 ?auto_171467 ) ) ( not ( = ?auto_171466 ?auto_171468 ) ) ( not ( = ?auto_171466 ?auto_171469 ) ) ( not ( = ?auto_171466 ?auto_171470 ) ) ( not ( = ?auto_171466 ?auto_171471 ) ) ( not ( = ?auto_171466 ?auto_171472 ) ) ( not ( = ?auto_171466 ?auto_171473 ) ) ( not ( = ?auto_171466 ?auto_171474 ) ) ( not ( = ?auto_171466 ?auto_171475 ) ) ( not ( = ?auto_171466 ?auto_171476 ) ) ( not ( = ?auto_171466 ?auto_171477 ) ) ( not ( = ?auto_171467 ?auto_171468 ) ) ( not ( = ?auto_171467 ?auto_171469 ) ) ( not ( = ?auto_171467 ?auto_171470 ) ) ( not ( = ?auto_171467 ?auto_171471 ) ) ( not ( = ?auto_171467 ?auto_171472 ) ) ( not ( = ?auto_171467 ?auto_171473 ) ) ( not ( = ?auto_171467 ?auto_171474 ) ) ( not ( = ?auto_171467 ?auto_171475 ) ) ( not ( = ?auto_171467 ?auto_171476 ) ) ( not ( = ?auto_171467 ?auto_171477 ) ) ( not ( = ?auto_171468 ?auto_171469 ) ) ( not ( = ?auto_171468 ?auto_171470 ) ) ( not ( = ?auto_171468 ?auto_171471 ) ) ( not ( = ?auto_171468 ?auto_171472 ) ) ( not ( = ?auto_171468 ?auto_171473 ) ) ( not ( = ?auto_171468 ?auto_171474 ) ) ( not ( = ?auto_171468 ?auto_171475 ) ) ( not ( = ?auto_171468 ?auto_171476 ) ) ( not ( = ?auto_171468 ?auto_171477 ) ) ( not ( = ?auto_171469 ?auto_171470 ) ) ( not ( = ?auto_171469 ?auto_171471 ) ) ( not ( = ?auto_171469 ?auto_171472 ) ) ( not ( = ?auto_171469 ?auto_171473 ) ) ( not ( = ?auto_171469 ?auto_171474 ) ) ( not ( = ?auto_171469 ?auto_171475 ) ) ( not ( = ?auto_171469 ?auto_171476 ) ) ( not ( = ?auto_171469 ?auto_171477 ) ) ( not ( = ?auto_171470 ?auto_171471 ) ) ( not ( = ?auto_171470 ?auto_171472 ) ) ( not ( = ?auto_171470 ?auto_171473 ) ) ( not ( = ?auto_171470 ?auto_171474 ) ) ( not ( = ?auto_171470 ?auto_171475 ) ) ( not ( = ?auto_171470 ?auto_171476 ) ) ( not ( = ?auto_171470 ?auto_171477 ) ) ( not ( = ?auto_171471 ?auto_171472 ) ) ( not ( = ?auto_171471 ?auto_171473 ) ) ( not ( = ?auto_171471 ?auto_171474 ) ) ( not ( = ?auto_171471 ?auto_171475 ) ) ( not ( = ?auto_171471 ?auto_171476 ) ) ( not ( = ?auto_171471 ?auto_171477 ) ) ( not ( = ?auto_171472 ?auto_171473 ) ) ( not ( = ?auto_171472 ?auto_171474 ) ) ( not ( = ?auto_171472 ?auto_171475 ) ) ( not ( = ?auto_171472 ?auto_171476 ) ) ( not ( = ?auto_171472 ?auto_171477 ) ) ( not ( = ?auto_171473 ?auto_171474 ) ) ( not ( = ?auto_171473 ?auto_171475 ) ) ( not ( = ?auto_171473 ?auto_171476 ) ) ( not ( = ?auto_171473 ?auto_171477 ) ) ( not ( = ?auto_171474 ?auto_171475 ) ) ( not ( = ?auto_171474 ?auto_171476 ) ) ( not ( = ?auto_171474 ?auto_171477 ) ) ( not ( = ?auto_171475 ?auto_171476 ) ) ( not ( = ?auto_171475 ?auto_171477 ) ) ( not ( = ?auto_171476 ?auto_171477 ) ) ( ON ?auto_171475 ?auto_171476 ) ( ON ?auto_171474 ?auto_171475 ) ( ON ?auto_171473 ?auto_171474 ) ( ON ?auto_171472 ?auto_171473 ) ( ON ?auto_171471 ?auto_171472 ) ( ON ?auto_171470 ?auto_171471 ) ( CLEAR ?auto_171468 ) ( ON ?auto_171469 ?auto_171470 ) ( CLEAR ?auto_171469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171466 ?auto_171467 ?auto_171468 ?auto_171469 )
      ( MAKE-11PILE ?auto_171466 ?auto_171467 ?auto_171468 ?auto_171469 ?auto_171470 ?auto_171471 ?auto_171472 ?auto_171473 ?auto_171474 ?auto_171475 ?auto_171476 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171489 - BLOCK
      ?auto_171490 - BLOCK
      ?auto_171491 - BLOCK
      ?auto_171492 - BLOCK
      ?auto_171493 - BLOCK
      ?auto_171494 - BLOCK
      ?auto_171495 - BLOCK
      ?auto_171496 - BLOCK
      ?auto_171497 - BLOCK
      ?auto_171498 - BLOCK
      ?auto_171499 - BLOCK
    )
    :vars
    (
      ?auto_171500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171499 ?auto_171500 ) ( ON-TABLE ?auto_171489 ) ( ON ?auto_171490 ?auto_171489 ) ( ON ?auto_171491 ?auto_171490 ) ( not ( = ?auto_171489 ?auto_171490 ) ) ( not ( = ?auto_171489 ?auto_171491 ) ) ( not ( = ?auto_171489 ?auto_171492 ) ) ( not ( = ?auto_171489 ?auto_171493 ) ) ( not ( = ?auto_171489 ?auto_171494 ) ) ( not ( = ?auto_171489 ?auto_171495 ) ) ( not ( = ?auto_171489 ?auto_171496 ) ) ( not ( = ?auto_171489 ?auto_171497 ) ) ( not ( = ?auto_171489 ?auto_171498 ) ) ( not ( = ?auto_171489 ?auto_171499 ) ) ( not ( = ?auto_171489 ?auto_171500 ) ) ( not ( = ?auto_171490 ?auto_171491 ) ) ( not ( = ?auto_171490 ?auto_171492 ) ) ( not ( = ?auto_171490 ?auto_171493 ) ) ( not ( = ?auto_171490 ?auto_171494 ) ) ( not ( = ?auto_171490 ?auto_171495 ) ) ( not ( = ?auto_171490 ?auto_171496 ) ) ( not ( = ?auto_171490 ?auto_171497 ) ) ( not ( = ?auto_171490 ?auto_171498 ) ) ( not ( = ?auto_171490 ?auto_171499 ) ) ( not ( = ?auto_171490 ?auto_171500 ) ) ( not ( = ?auto_171491 ?auto_171492 ) ) ( not ( = ?auto_171491 ?auto_171493 ) ) ( not ( = ?auto_171491 ?auto_171494 ) ) ( not ( = ?auto_171491 ?auto_171495 ) ) ( not ( = ?auto_171491 ?auto_171496 ) ) ( not ( = ?auto_171491 ?auto_171497 ) ) ( not ( = ?auto_171491 ?auto_171498 ) ) ( not ( = ?auto_171491 ?auto_171499 ) ) ( not ( = ?auto_171491 ?auto_171500 ) ) ( not ( = ?auto_171492 ?auto_171493 ) ) ( not ( = ?auto_171492 ?auto_171494 ) ) ( not ( = ?auto_171492 ?auto_171495 ) ) ( not ( = ?auto_171492 ?auto_171496 ) ) ( not ( = ?auto_171492 ?auto_171497 ) ) ( not ( = ?auto_171492 ?auto_171498 ) ) ( not ( = ?auto_171492 ?auto_171499 ) ) ( not ( = ?auto_171492 ?auto_171500 ) ) ( not ( = ?auto_171493 ?auto_171494 ) ) ( not ( = ?auto_171493 ?auto_171495 ) ) ( not ( = ?auto_171493 ?auto_171496 ) ) ( not ( = ?auto_171493 ?auto_171497 ) ) ( not ( = ?auto_171493 ?auto_171498 ) ) ( not ( = ?auto_171493 ?auto_171499 ) ) ( not ( = ?auto_171493 ?auto_171500 ) ) ( not ( = ?auto_171494 ?auto_171495 ) ) ( not ( = ?auto_171494 ?auto_171496 ) ) ( not ( = ?auto_171494 ?auto_171497 ) ) ( not ( = ?auto_171494 ?auto_171498 ) ) ( not ( = ?auto_171494 ?auto_171499 ) ) ( not ( = ?auto_171494 ?auto_171500 ) ) ( not ( = ?auto_171495 ?auto_171496 ) ) ( not ( = ?auto_171495 ?auto_171497 ) ) ( not ( = ?auto_171495 ?auto_171498 ) ) ( not ( = ?auto_171495 ?auto_171499 ) ) ( not ( = ?auto_171495 ?auto_171500 ) ) ( not ( = ?auto_171496 ?auto_171497 ) ) ( not ( = ?auto_171496 ?auto_171498 ) ) ( not ( = ?auto_171496 ?auto_171499 ) ) ( not ( = ?auto_171496 ?auto_171500 ) ) ( not ( = ?auto_171497 ?auto_171498 ) ) ( not ( = ?auto_171497 ?auto_171499 ) ) ( not ( = ?auto_171497 ?auto_171500 ) ) ( not ( = ?auto_171498 ?auto_171499 ) ) ( not ( = ?auto_171498 ?auto_171500 ) ) ( not ( = ?auto_171499 ?auto_171500 ) ) ( ON ?auto_171498 ?auto_171499 ) ( ON ?auto_171497 ?auto_171498 ) ( ON ?auto_171496 ?auto_171497 ) ( ON ?auto_171495 ?auto_171496 ) ( ON ?auto_171494 ?auto_171495 ) ( ON ?auto_171493 ?auto_171494 ) ( CLEAR ?auto_171491 ) ( ON ?auto_171492 ?auto_171493 ) ( CLEAR ?auto_171492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171489 ?auto_171490 ?auto_171491 ?auto_171492 )
      ( MAKE-11PILE ?auto_171489 ?auto_171490 ?auto_171491 ?auto_171492 ?auto_171493 ?auto_171494 ?auto_171495 ?auto_171496 ?auto_171497 ?auto_171498 ?auto_171499 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171512 - BLOCK
      ?auto_171513 - BLOCK
      ?auto_171514 - BLOCK
      ?auto_171515 - BLOCK
      ?auto_171516 - BLOCK
      ?auto_171517 - BLOCK
      ?auto_171518 - BLOCK
      ?auto_171519 - BLOCK
      ?auto_171520 - BLOCK
      ?auto_171521 - BLOCK
      ?auto_171522 - BLOCK
    )
    :vars
    (
      ?auto_171523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171522 ?auto_171523 ) ( ON-TABLE ?auto_171512 ) ( ON ?auto_171513 ?auto_171512 ) ( not ( = ?auto_171512 ?auto_171513 ) ) ( not ( = ?auto_171512 ?auto_171514 ) ) ( not ( = ?auto_171512 ?auto_171515 ) ) ( not ( = ?auto_171512 ?auto_171516 ) ) ( not ( = ?auto_171512 ?auto_171517 ) ) ( not ( = ?auto_171512 ?auto_171518 ) ) ( not ( = ?auto_171512 ?auto_171519 ) ) ( not ( = ?auto_171512 ?auto_171520 ) ) ( not ( = ?auto_171512 ?auto_171521 ) ) ( not ( = ?auto_171512 ?auto_171522 ) ) ( not ( = ?auto_171512 ?auto_171523 ) ) ( not ( = ?auto_171513 ?auto_171514 ) ) ( not ( = ?auto_171513 ?auto_171515 ) ) ( not ( = ?auto_171513 ?auto_171516 ) ) ( not ( = ?auto_171513 ?auto_171517 ) ) ( not ( = ?auto_171513 ?auto_171518 ) ) ( not ( = ?auto_171513 ?auto_171519 ) ) ( not ( = ?auto_171513 ?auto_171520 ) ) ( not ( = ?auto_171513 ?auto_171521 ) ) ( not ( = ?auto_171513 ?auto_171522 ) ) ( not ( = ?auto_171513 ?auto_171523 ) ) ( not ( = ?auto_171514 ?auto_171515 ) ) ( not ( = ?auto_171514 ?auto_171516 ) ) ( not ( = ?auto_171514 ?auto_171517 ) ) ( not ( = ?auto_171514 ?auto_171518 ) ) ( not ( = ?auto_171514 ?auto_171519 ) ) ( not ( = ?auto_171514 ?auto_171520 ) ) ( not ( = ?auto_171514 ?auto_171521 ) ) ( not ( = ?auto_171514 ?auto_171522 ) ) ( not ( = ?auto_171514 ?auto_171523 ) ) ( not ( = ?auto_171515 ?auto_171516 ) ) ( not ( = ?auto_171515 ?auto_171517 ) ) ( not ( = ?auto_171515 ?auto_171518 ) ) ( not ( = ?auto_171515 ?auto_171519 ) ) ( not ( = ?auto_171515 ?auto_171520 ) ) ( not ( = ?auto_171515 ?auto_171521 ) ) ( not ( = ?auto_171515 ?auto_171522 ) ) ( not ( = ?auto_171515 ?auto_171523 ) ) ( not ( = ?auto_171516 ?auto_171517 ) ) ( not ( = ?auto_171516 ?auto_171518 ) ) ( not ( = ?auto_171516 ?auto_171519 ) ) ( not ( = ?auto_171516 ?auto_171520 ) ) ( not ( = ?auto_171516 ?auto_171521 ) ) ( not ( = ?auto_171516 ?auto_171522 ) ) ( not ( = ?auto_171516 ?auto_171523 ) ) ( not ( = ?auto_171517 ?auto_171518 ) ) ( not ( = ?auto_171517 ?auto_171519 ) ) ( not ( = ?auto_171517 ?auto_171520 ) ) ( not ( = ?auto_171517 ?auto_171521 ) ) ( not ( = ?auto_171517 ?auto_171522 ) ) ( not ( = ?auto_171517 ?auto_171523 ) ) ( not ( = ?auto_171518 ?auto_171519 ) ) ( not ( = ?auto_171518 ?auto_171520 ) ) ( not ( = ?auto_171518 ?auto_171521 ) ) ( not ( = ?auto_171518 ?auto_171522 ) ) ( not ( = ?auto_171518 ?auto_171523 ) ) ( not ( = ?auto_171519 ?auto_171520 ) ) ( not ( = ?auto_171519 ?auto_171521 ) ) ( not ( = ?auto_171519 ?auto_171522 ) ) ( not ( = ?auto_171519 ?auto_171523 ) ) ( not ( = ?auto_171520 ?auto_171521 ) ) ( not ( = ?auto_171520 ?auto_171522 ) ) ( not ( = ?auto_171520 ?auto_171523 ) ) ( not ( = ?auto_171521 ?auto_171522 ) ) ( not ( = ?auto_171521 ?auto_171523 ) ) ( not ( = ?auto_171522 ?auto_171523 ) ) ( ON ?auto_171521 ?auto_171522 ) ( ON ?auto_171520 ?auto_171521 ) ( ON ?auto_171519 ?auto_171520 ) ( ON ?auto_171518 ?auto_171519 ) ( ON ?auto_171517 ?auto_171518 ) ( ON ?auto_171516 ?auto_171517 ) ( ON ?auto_171515 ?auto_171516 ) ( CLEAR ?auto_171513 ) ( ON ?auto_171514 ?auto_171515 ) ( CLEAR ?auto_171514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171512 ?auto_171513 ?auto_171514 )
      ( MAKE-11PILE ?auto_171512 ?auto_171513 ?auto_171514 ?auto_171515 ?auto_171516 ?auto_171517 ?auto_171518 ?auto_171519 ?auto_171520 ?auto_171521 ?auto_171522 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171535 - BLOCK
      ?auto_171536 - BLOCK
      ?auto_171537 - BLOCK
      ?auto_171538 - BLOCK
      ?auto_171539 - BLOCK
      ?auto_171540 - BLOCK
      ?auto_171541 - BLOCK
      ?auto_171542 - BLOCK
      ?auto_171543 - BLOCK
      ?auto_171544 - BLOCK
      ?auto_171545 - BLOCK
    )
    :vars
    (
      ?auto_171546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171545 ?auto_171546 ) ( ON-TABLE ?auto_171535 ) ( ON ?auto_171536 ?auto_171535 ) ( not ( = ?auto_171535 ?auto_171536 ) ) ( not ( = ?auto_171535 ?auto_171537 ) ) ( not ( = ?auto_171535 ?auto_171538 ) ) ( not ( = ?auto_171535 ?auto_171539 ) ) ( not ( = ?auto_171535 ?auto_171540 ) ) ( not ( = ?auto_171535 ?auto_171541 ) ) ( not ( = ?auto_171535 ?auto_171542 ) ) ( not ( = ?auto_171535 ?auto_171543 ) ) ( not ( = ?auto_171535 ?auto_171544 ) ) ( not ( = ?auto_171535 ?auto_171545 ) ) ( not ( = ?auto_171535 ?auto_171546 ) ) ( not ( = ?auto_171536 ?auto_171537 ) ) ( not ( = ?auto_171536 ?auto_171538 ) ) ( not ( = ?auto_171536 ?auto_171539 ) ) ( not ( = ?auto_171536 ?auto_171540 ) ) ( not ( = ?auto_171536 ?auto_171541 ) ) ( not ( = ?auto_171536 ?auto_171542 ) ) ( not ( = ?auto_171536 ?auto_171543 ) ) ( not ( = ?auto_171536 ?auto_171544 ) ) ( not ( = ?auto_171536 ?auto_171545 ) ) ( not ( = ?auto_171536 ?auto_171546 ) ) ( not ( = ?auto_171537 ?auto_171538 ) ) ( not ( = ?auto_171537 ?auto_171539 ) ) ( not ( = ?auto_171537 ?auto_171540 ) ) ( not ( = ?auto_171537 ?auto_171541 ) ) ( not ( = ?auto_171537 ?auto_171542 ) ) ( not ( = ?auto_171537 ?auto_171543 ) ) ( not ( = ?auto_171537 ?auto_171544 ) ) ( not ( = ?auto_171537 ?auto_171545 ) ) ( not ( = ?auto_171537 ?auto_171546 ) ) ( not ( = ?auto_171538 ?auto_171539 ) ) ( not ( = ?auto_171538 ?auto_171540 ) ) ( not ( = ?auto_171538 ?auto_171541 ) ) ( not ( = ?auto_171538 ?auto_171542 ) ) ( not ( = ?auto_171538 ?auto_171543 ) ) ( not ( = ?auto_171538 ?auto_171544 ) ) ( not ( = ?auto_171538 ?auto_171545 ) ) ( not ( = ?auto_171538 ?auto_171546 ) ) ( not ( = ?auto_171539 ?auto_171540 ) ) ( not ( = ?auto_171539 ?auto_171541 ) ) ( not ( = ?auto_171539 ?auto_171542 ) ) ( not ( = ?auto_171539 ?auto_171543 ) ) ( not ( = ?auto_171539 ?auto_171544 ) ) ( not ( = ?auto_171539 ?auto_171545 ) ) ( not ( = ?auto_171539 ?auto_171546 ) ) ( not ( = ?auto_171540 ?auto_171541 ) ) ( not ( = ?auto_171540 ?auto_171542 ) ) ( not ( = ?auto_171540 ?auto_171543 ) ) ( not ( = ?auto_171540 ?auto_171544 ) ) ( not ( = ?auto_171540 ?auto_171545 ) ) ( not ( = ?auto_171540 ?auto_171546 ) ) ( not ( = ?auto_171541 ?auto_171542 ) ) ( not ( = ?auto_171541 ?auto_171543 ) ) ( not ( = ?auto_171541 ?auto_171544 ) ) ( not ( = ?auto_171541 ?auto_171545 ) ) ( not ( = ?auto_171541 ?auto_171546 ) ) ( not ( = ?auto_171542 ?auto_171543 ) ) ( not ( = ?auto_171542 ?auto_171544 ) ) ( not ( = ?auto_171542 ?auto_171545 ) ) ( not ( = ?auto_171542 ?auto_171546 ) ) ( not ( = ?auto_171543 ?auto_171544 ) ) ( not ( = ?auto_171543 ?auto_171545 ) ) ( not ( = ?auto_171543 ?auto_171546 ) ) ( not ( = ?auto_171544 ?auto_171545 ) ) ( not ( = ?auto_171544 ?auto_171546 ) ) ( not ( = ?auto_171545 ?auto_171546 ) ) ( ON ?auto_171544 ?auto_171545 ) ( ON ?auto_171543 ?auto_171544 ) ( ON ?auto_171542 ?auto_171543 ) ( ON ?auto_171541 ?auto_171542 ) ( ON ?auto_171540 ?auto_171541 ) ( ON ?auto_171539 ?auto_171540 ) ( ON ?auto_171538 ?auto_171539 ) ( CLEAR ?auto_171536 ) ( ON ?auto_171537 ?auto_171538 ) ( CLEAR ?auto_171537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171535 ?auto_171536 ?auto_171537 )
      ( MAKE-11PILE ?auto_171535 ?auto_171536 ?auto_171537 ?auto_171538 ?auto_171539 ?auto_171540 ?auto_171541 ?auto_171542 ?auto_171543 ?auto_171544 ?auto_171545 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171558 - BLOCK
      ?auto_171559 - BLOCK
      ?auto_171560 - BLOCK
      ?auto_171561 - BLOCK
      ?auto_171562 - BLOCK
      ?auto_171563 - BLOCK
      ?auto_171564 - BLOCK
      ?auto_171565 - BLOCK
      ?auto_171566 - BLOCK
      ?auto_171567 - BLOCK
      ?auto_171568 - BLOCK
    )
    :vars
    (
      ?auto_171569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171568 ?auto_171569 ) ( ON-TABLE ?auto_171558 ) ( not ( = ?auto_171558 ?auto_171559 ) ) ( not ( = ?auto_171558 ?auto_171560 ) ) ( not ( = ?auto_171558 ?auto_171561 ) ) ( not ( = ?auto_171558 ?auto_171562 ) ) ( not ( = ?auto_171558 ?auto_171563 ) ) ( not ( = ?auto_171558 ?auto_171564 ) ) ( not ( = ?auto_171558 ?auto_171565 ) ) ( not ( = ?auto_171558 ?auto_171566 ) ) ( not ( = ?auto_171558 ?auto_171567 ) ) ( not ( = ?auto_171558 ?auto_171568 ) ) ( not ( = ?auto_171558 ?auto_171569 ) ) ( not ( = ?auto_171559 ?auto_171560 ) ) ( not ( = ?auto_171559 ?auto_171561 ) ) ( not ( = ?auto_171559 ?auto_171562 ) ) ( not ( = ?auto_171559 ?auto_171563 ) ) ( not ( = ?auto_171559 ?auto_171564 ) ) ( not ( = ?auto_171559 ?auto_171565 ) ) ( not ( = ?auto_171559 ?auto_171566 ) ) ( not ( = ?auto_171559 ?auto_171567 ) ) ( not ( = ?auto_171559 ?auto_171568 ) ) ( not ( = ?auto_171559 ?auto_171569 ) ) ( not ( = ?auto_171560 ?auto_171561 ) ) ( not ( = ?auto_171560 ?auto_171562 ) ) ( not ( = ?auto_171560 ?auto_171563 ) ) ( not ( = ?auto_171560 ?auto_171564 ) ) ( not ( = ?auto_171560 ?auto_171565 ) ) ( not ( = ?auto_171560 ?auto_171566 ) ) ( not ( = ?auto_171560 ?auto_171567 ) ) ( not ( = ?auto_171560 ?auto_171568 ) ) ( not ( = ?auto_171560 ?auto_171569 ) ) ( not ( = ?auto_171561 ?auto_171562 ) ) ( not ( = ?auto_171561 ?auto_171563 ) ) ( not ( = ?auto_171561 ?auto_171564 ) ) ( not ( = ?auto_171561 ?auto_171565 ) ) ( not ( = ?auto_171561 ?auto_171566 ) ) ( not ( = ?auto_171561 ?auto_171567 ) ) ( not ( = ?auto_171561 ?auto_171568 ) ) ( not ( = ?auto_171561 ?auto_171569 ) ) ( not ( = ?auto_171562 ?auto_171563 ) ) ( not ( = ?auto_171562 ?auto_171564 ) ) ( not ( = ?auto_171562 ?auto_171565 ) ) ( not ( = ?auto_171562 ?auto_171566 ) ) ( not ( = ?auto_171562 ?auto_171567 ) ) ( not ( = ?auto_171562 ?auto_171568 ) ) ( not ( = ?auto_171562 ?auto_171569 ) ) ( not ( = ?auto_171563 ?auto_171564 ) ) ( not ( = ?auto_171563 ?auto_171565 ) ) ( not ( = ?auto_171563 ?auto_171566 ) ) ( not ( = ?auto_171563 ?auto_171567 ) ) ( not ( = ?auto_171563 ?auto_171568 ) ) ( not ( = ?auto_171563 ?auto_171569 ) ) ( not ( = ?auto_171564 ?auto_171565 ) ) ( not ( = ?auto_171564 ?auto_171566 ) ) ( not ( = ?auto_171564 ?auto_171567 ) ) ( not ( = ?auto_171564 ?auto_171568 ) ) ( not ( = ?auto_171564 ?auto_171569 ) ) ( not ( = ?auto_171565 ?auto_171566 ) ) ( not ( = ?auto_171565 ?auto_171567 ) ) ( not ( = ?auto_171565 ?auto_171568 ) ) ( not ( = ?auto_171565 ?auto_171569 ) ) ( not ( = ?auto_171566 ?auto_171567 ) ) ( not ( = ?auto_171566 ?auto_171568 ) ) ( not ( = ?auto_171566 ?auto_171569 ) ) ( not ( = ?auto_171567 ?auto_171568 ) ) ( not ( = ?auto_171567 ?auto_171569 ) ) ( not ( = ?auto_171568 ?auto_171569 ) ) ( ON ?auto_171567 ?auto_171568 ) ( ON ?auto_171566 ?auto_171567 ) ( ON ?auto_171565 ?auto_171566 ) ( ON ?auto_171564 ?auto_171565 ) ( ON ?auto_171563 ?auto_171564 ) ( ON ?auto_171562 ?auto_171563 ) ( ON ?auto_171561 ?auto_171562 ) ( ON ?auto_171560 ?auto_171561 ) ( CLEAR ?auto_171558 ) ( ON ?auto_171559 ?auto_171560 ) ( CLEAR ?auto_171559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171558 ?auto_171559 )
      ( MAKE-11PILE ?auto_171558 ?auto_171559 ?auto_171560 ?auto_171561 ?auto_171562 ?auto_171563 ?auto_171564 ?auto_171565 ?auto_171566 ?auto_171567 ?auto_171568 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171581 - BLOCK
      ?auto_171582 - BLOCK
      ?auto_171583 - BLOCK
      ?auto_171584 - BLOCK
      ?auto_171585 - BLOCK
      ?auto_171586 - BLOCK
      ?auto_171587 - BLOCK
      ?auto_171588 - BLOCK
      ?auto_171589 - BLOCK
      ?auto_171590 - BLOCK
      ?auto_171591 - BLOCK
    )
    :vars
    (
      ?auto_171592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171591 ?auto_171592 ) ( ON-TABLE ?auto_171581 ) ( not ( = ?auto_171581 ?auto_171582 ) ) ( not ( = ?auto_171581 ?auto_171583 ) ) ( not ( = ?auto_171581 ?auto_171584 ) ) ( not ( = ?auto_171581 ?auto_171585 ) ) ( not ( = ?auto_171581 ?auto_171586 ) ) ( not ( = ?auto_171581 ?auto_171587 ) ) ( not ( = ?auto_171581 ?auto_171588 ) ) ( not ( = ?auto_171581 ?auto_171589 ) ) ( not ( = ?auto_171581 ?auto_171590 ) ) ( not ( = ?auto_171581 ?auto_171591 ) ) ( not ( = ?auto_171581 ?auto_171592 ) ) ( not ( = ?auto_171582 ?auto_171583 ) ) ( not ( = ?auto_171582 ?auto_171584 ) ) ( not ( = ?auto_171582 ?auto_171585 ) ) ( not ( = ?auto_171582 ?auto_171586 ) ) ( not ( = ?auto_171582 ?auto_171587 ) ) ( not ( = ?auto_171582 ?auto_171588 ) ) ( not ( = ?auto_171582 ?auto_171589 ) ) ( not ( = ?auto_171582 ?auto_171590 ) ) ( not ( = ?auto_171582 ?auto_171591 ) ) ( not ( = ?auto_171582 ?auto_171592 ) ) ( not ( = ?auto_171583 ?auto_171584 ) ) ( not ( = ?auto_171583 ?auto_171585 ) ) ( not ( = ?auto_171583 ?auto_171586 ) ) ( not ( = ?auto_171583 ?auto_171587 ) ) ( not ( = ?auto_171583 ?auto_171588 ) ) ( not ( = ?auto_171583 ?auto_171589 ) ) ( not ( = ?auto_171583 ?auto_171590 ) ) ( not ( = ?auto_171583 ?auto_171591 ) ) ( not ( = ?auto_171583 ?auto_171592 ) ) ( not ( = ?auto_171584 ?auto_171585 ) ) ( not ( = ?auto_171584 ?auto_171586 ) ) ( not ( = ?auto_171584 ?auto_171587 ) ) ( not ( = ?auto_171584 ?auto_171588 ) ) ( not ( = ?auto_171584 ?auto_171589 ) ) ( not ( = ?auto_171584 ?auto_171590 ) ) ( not ( = ?auto_171584 ?auto_171591 ) ) ( not ( = ?auto_171584 ?auto_171592 ) ) ( not ( = ?auto_171585 ?auto_171586 ) ) ( not ( = ?auto_171585 ?auto_171587 ) ) ( not ( = ?auto_171585 ?auto_171588 ) ) ( not ( = ?auto_171585 ?auto_171589 ) ) ( not ( = ?auto_171585 ?auto_171590 ) ) ( not ( = ?auto_171585 ?auto_171591 ) ) ( not ( = ?auto_171585 ?auto_171592 ) ) ( not ( = ?auto_171586 ?auto_171587 ) ) ( not ( = ?auto_171586 ?auto_171588 ) ) ( not ( = ?auto_171586 ?auto_171589 ) ) ( not ( = ?auto_171586 ?auto_171590 ) ) ( not ( = ?auto_171586 ?auto_171591 ) ) ( not ( = ?auto_171586 ?auto_171592 ) ) ( not ( = ?auto_171587 ?auto_171588 ) ) ( not ( = ?auto_171587 ?auto_171589 ) ) ( not ( = ?auto_171587 ?auto_171590 ) ) ( not ( = ?auto_171587 ?auto_171591 ) ) ( not ( = ?auto_171587 ?auto_171592 ) ) ( not ( = ?auto_171588 ?auto_171589 ) ) ( not ( = ?auto_171588 ?auto_171590 ) ) ( not ( = ?auto_171588 ?auto_171591 ) ) ( not ( = ?auto_171588 ?auto_171592 ) ) ( not ( = ?auto_171589 ?auto_171590 ) ) ( not ( = ?auto_171589 ?auto_171591 ) ) ( not ( = ?auto_171589 ?auto_171592 ) ) ( not ( = ?auto_171590 ?auto_171591 ) ) ( not ( = ?auto_171590 ?auto_171592 ) ) ( not ( = ?auto_171591 ?auto_171592 ) ) ( ON ?auto_171590 ?auto_171591 ) ( ON ?auto_171589 ?auto_171590 ) ( ON ?auto_171588 ?auto_171589 ) ( ON ?auto_171587 ?auto_171588 ) ( ON ?auto_171586 ?auto_171587 ) ( ON ?auto_171585 ?auto_171586 ) ( ON ?auto_171584 ?auto_171585 ) ( ON ?auto_171583 ?auto_171584 ) ( CLEAR ?auto_171581 ) ( ON ?auto_171582 ?auto_171583 ) ( CLEAR ?auto_171582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171581 ?auto_171582 )
      ( MAKE-11PILE ?auto_171581 ?auto_171582 ?auto_171583 ?auto_171584 ?auto_171585 ?auto_171586 ?auto_171587 ?auto_171588 ?auto_171589 ?auto_171590 ?auto_171591 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171604 - BLOCK
      ?auto_171605 - BLOCK
      ?auto_171606 - BLOCK
      ?auto_171607 - BLOCK
      ?auto_171608 - BLOCK
      ?auto_171609 - BLOCK
      ?auto_171610 - BLOCK
      ?auto_171611 - BLOCK
      ?auto_171612 - BLOCK
      ?auto_171613 - BLOCK
      ?auto_171614 - BLOCK
    )
    :vars
    (
      ?auto_171615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171614 ?auto_171615 ) ( not ( = ?auto_171604 ?auto_171605 ) ) ( not ( = ?auto_171604 ?auto_171606 ) ) ( not ( = ?auto_171604 ?auto_171607 ) ) ( not ( = ?auto_171604 ?auto_171608 ) ) ( not ( = ?auto_171604 ?auto_171609 ) ) ( not ( = ?auto_171604 ?auto_171610 ) ) ( not ( = ?auto_171604 ?auto_171611 ) ) ( not ( = ?auto_171604 ?auto_171612 ) ) ( not ( = ?auto_171604 ?auto_171613 ) ) ( not ( = ?auto_171604 ?auto_171614 ) ) ( not ( = ?auto_171604 ?auto_171615 ) ) ( not ( = ?auto_171605 ?auto_171606 ) ) ( not ( = ?auto_171605 ?auto_171607 ) ) ( not ( = ?auto_171605 ?auto_171608 ) ) ( not ( = ?auto_171605 ?auto_171609 ) ) ( not ( = ?auto_171605 ?auto_171610 ) ) ( not ( = ?auto_171605 ?auto_171611 ) ) ( not ( = ?auto_171605 ?auto_171612 ) ) ( not ( = ?auto_171605 ?auto_171613 ) ) ( not ( = ?auto_171605 ?auto_171614 ) ) ( not ( = ?auto_171605 ?auto_171615 ) ) ( not ( = ?auto_171606 ?auto_171607 ) ) ( not ( = ?auto_171606 ?auto_171608 ) ) ( not ( = ?auto_171606 ?auto_171609 ) ) ( not ( = ?auto_171606 ?auto_171610 ) ) ( not ( = ?auto_171606 ?auto_171611 ) ) ( not ( = ?auto_171606 ?auto_171612 ) ) ( not ( = ?auto_171606 ?auto_171613 ) ) ( not ( = ?auto_171606 ?auto_171614 ) ) ( not ( = ?auto_171606 ?auto_171615 ) ) ( not ( = ?auto_171607 ?auto_171608 ) ) ( not ( = ?auto_171607 ?auto_171609 ) ) ( not ( = ?auto_171607 ?auto_171610 ) ) ( not ( = ?auto_171607 ?auto_171611 ) ) ( not ( = ?auto_171607 ?auto_171612 ) ) ( not ( = ?auto_171607 ?auto_171613 ) ) ( not ( = ?auto_171607 ?auto_171614 ) ) ( not ( = ?auto_171607 ?auto_171615 ) ) ( not ( = ?auto_171608 ?auto_171609 ) ) ( not ( = ?auto_171608 ?auto_171610 ) ) ( not ( = ?auto_171608 ?auto_171611 ) ) ( not ( = ?auto_171608 ?auto_171612 ) ) ( not ( = ?auto_171608 ?auto_171613 ) ) ( not ( = ?auto_171608 ?auto_171614 ) ) ( not ( = ?auto_171608 ?auto_171615 ) ) ( not ( = ?auto_171609 ?auto_171610 ) ) ( not ( = ?auto_171609 ?auto_171611 ) ) ( not ( = ?auto_171609 ?auto_171612 ) ) ( not ( = ?auto_171609 ?auto_171613 ) ) ( not ( = ?auto_171609 ?auto_171614 ) ) ( not ( = ?auto_171609 ?auto_171615 ) ) ( not ( = ?auto_171610 ?auto_171611 ) ) ( not ( = ?auto_171610 ?auto_171612 ) ) ( not ( = ?auto_171610 ?auto_171613 ) ) ( not ( = ?auto_171610 ?auto_171614 ) ) ( not ( = ?auto_171610 ?auto_171615 ) ) ( not ( = ?auto_171611 ?auto_171612 ) ) ( not ( = ?auto_171611 ?auto_171613 ) ) ( not ( = ?auto_171611 ?auto_171614 ) ) ( not ( = ?auto_171611 ?auto_171615 ) ) ( not ( = ?auto_171612 ?auto_171613 ) ) ( not ( = ?auto_171612 ?auto_171614 ) ) ( not ( = ?auto_171612 ?auto_171615 ) ) ( not ( = ?auto_171613 ?auto_171614 ) ) ( not ( = ?auto_171613 ?auto_171615 ) ) ( not ( = ?auto_171614 ?auto_171615 ) ) ( ON ?auto_171613 ?auto_171614 ) ( ON ?auto_171612 ?auto_171613 ) ( ON ?auto_171611 ?auto_171612 ) ( ON ?auto_171610 ?auto_171611 ) ( ON ?auto_171609 ?auto_171610 ) ( ON ?auto_171608 ?auto_171609 ) ( ON ?auto_171607 ?auto_171608 ) ( ON ?auto_171606 ?auto_171607 ) ( ON ?auto_171605 ?auto_171606 ) ( ON ?auto_171604 ?auto_171605 ) ( CLEAR ?auto_171604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171604 )
      ( MAKE-11PILE ?auto_171604 ?auto_171605 ?auto_171606 ?auto_171607 ?auto_171608 ?auto_171609 ?auto_171610 ?auto_171611 ?auto_171612 ?auto_171613 ?auto_171614 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171627 - BLOCK
      ?auto_171628 - BLOCK
      ?auto_171629 - BLOCK
      ?auto_171630 - BLOCK
      ?auto_171631 - BLOCK
      ?auto_171632 - BLOCK
      ?auto_171633 - BLOCK
      ?auto_171634 - BLOCK
      ?auto_171635 - BLOCK
      ?auto_171636 - BLOCK
      ?auto_171637 - BLOCK
    )
    :vars
    (
      ?auto_171638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171637 ?auto_171638 ) ( not ( = ?auto_171627 ?auto_171628 ) ) ( not ( = ?auto_171627 ?auto_171629 ) ) ( not ( = ?auto_171627 ?auto_171630 ) ) ( not ( = ?auto_171627 ?auto_171631 ) ) ( not ( = ?auto_171627 ?auto_171632 ) ) ( not ( = ?auto_171627 ?auto_171633 ) ) ( not ( = ?auto_171627 ?auto_171634 ) ) ( not ( = ?auto_171627 ?auto_171635 ) ) ( not ( = ?auto_171627 ?auto_171636 ) ) ( not ( = ?auto_171627 ?auto_171637 ) ) ( not ( = ?auto_171627 ?auto_171638 ) ) ( not ( = ?auto_171628 ?auto_171629 ) ) ( not ( = ?auto_171628 ?auto_171630 ) ) ( not ( = ?auto_171628 ?auto_171631 ) ) ( not ( = ?auto_171628 ?auto_171632 ) ) ( not ( = ?auto_171628 ?auto_171633 ) ) ( not ( = ?auto_171628 ?auto_171634 ) ) ( not ( = ?auto_171628 ?auto_171635 ) ) ( not ( = ?auto_171628 ?auto_171636 ) ) ( not ( = ?auto_171628 ?auto_171637 ) ) ( not ( = ?auto_171628 ?auto_171638 ) ) ( not ( = ?auto_171629 ?auto_171630 ) ) ( not ( = ?auto_171629 ?auto_171631 ) ) ( not ( = ?auto_171629 ?auto_171632 ) ) ( not ( = ?auto_171629 ?auto_171633 ) ) ( not ( = ?auto_171629 ?auto_171634 ) ) ( not ( = ?auto_171629 ?auto_171635 ) ) ( not ( = ?auto_171629 ?auto_171636 ) ) ( not ( = ?auto_171629 ?auto_171637 ) ) ( not ( = ?auto_171629 ?auto_171638 ) ) ( not ( = ?auto_171630 ?auto_171631 ) ) ( not ( = ?auto_171630 ?auto_171632 ) ) ( not ( = ?auto_171630 ?auto_171633 ) ) ( not ( = ?auto_171630 ?auto_171634 ) ) ( not ( = ?auto_171630 ?auto_171635 ) ) ( not ( = ?auto_171630 ?auto_171636 ) ) ( not ( = ?auto_171630 ?auto_171637 ) ) ( not ( = ?auto_171630 ?auto_171638 ) ) ( not ( = ?auto_171631 ?auto_171632 ) ) ( not ( = ?auto_171631 ?auto_171633 ) ) ( not ( = ?auto_171631 ?auto_171634 ) ) ( not ( = ?auto_171631 ?auto_171635 ) ) ( not ( = ?auto_171631 ?auto_171636 ) ) ( not ( = ?auto_171631 ?auto_171637 ) ) ( not ( = ?auto_171631 ?auto_171638 ) ) ( not ( = ?auto_171632 ?auto_171633 ) ) ( not ( = ?auto_171632 ?auto_171634 ) ) ( not ( = ?auto_171632 ?auto_171635 ) ) ( not ( = ?auto_171632 ?auto_171636 ) ) ( not ( = ?auto_171632 ?auto_171637 ) ) ( not ( = ?auto_171632 ?auto_171638 ) ) ( not ( = ?auto_171633 ?auto_171634 ) ) ( not ( = ?auto_171633 ?auto_171635 ) ) ( not ( = ?auto_171633 ?auto_171636 ) ) ( not ( = ?auto_171633 ?auto_171637 ) ) ( not ( = ?auto_171633 ?auto_171638 ) ) ( not ( = ?auto_171634 ?auto_171635 ) ) ( not ( = ?auto_171634 ?auto_171636 ) ) ( not ( = ?auto_171634 ?auto_171637 ) ) ( not ( = ?auto_171634 ?auto_171638 ) ) ( not ( = ?auto_171635 ?auto_171636 ) ) ( not ( = ?auto_171635 ?auto_171637 ) ) ( not ( = ?auto_171635 ?auto_171638 ) ) ( not ( = ?auto_171636 ?auto_171637 ) ) ( not ( = ?auto_171636 ?auto_171638 ) ) ( not ( = ?auto_171637 ?auto_171638 ) ) ( ON ?auto_171636 ?auto_171637 ) ( ON ?auto_171635 ?auto_171636 ) ( ON ?auto_171634 ?auto_171635 ) ( ON ?auto_171633 ?auto_171634 ) ( ON ?auto_171632 ?auto_171633 ) ( ON ?auto_171631 ?auto_171632 ) ( ON ?auto_171630 ?auto_171631 ) ( ON ?auto_171629 ?auto_171630 ) ( ON ?auto_171628 ?auto_171629 ) ( ON ?auto_171627 ?auto_171628 ) ( CLEAR ?auto_171627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171627 )
      ( MAKE-11PILE ?auto_171627 ?auto_171628 ?auto_171629 ?auto_171630 ?auto_171631 ?auto_171632 ?auto_171633 ?auto_171634 ?auto_171635 ?auto_171636 ?auto_171637 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171651 - BLOCK
      ?auto_171652 - BLOCK
      ?auto_171653 - BLOCK
      ?auto_171654 - BLOCK
      ?auto_171655 - BLOCK
      ?auto_171656 - BLOCK
      ?auto_171657 - BLOCK
      ?auto_171658 - BLOCK
      ?auto_171659 - BLOCK
      ?auto_171660 - BLOCK
      ?auto_171661 - BLOCK
      ?auto_171662 - BLOCK
    )
    :vars
    (
      ?auto_171663 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_171661 ) ( ON ?auto_171662 ?auto_171663 ) ( CLEAR ?auto_171662 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171651 ) ( ON ?auto_171652 ?auto_171651 ) ( ON ?auto_171653 ?auto_171652 ) ( ON ?auto_171654 ?auto_171653 ) ( ON ?auto_171655 ?auto_171654 ) ( ON ?auto_171656 ?auto_171655 ) ( ON ?auto_171657 ?auto_171656 ) ( ON ?auto_171658 ?auto_171657 ) ( ON ?auto_171659 ?auto_171658 ) ( ON ?auto_171660 ?auto_171659 ) ( ON ?auto_171661 ?auto_171660 ) ( not ( = ?auto_171651 ?auto_171652 ) ) ( not ( = ?auto_171651 ?auto_171653 ) ) ( not ( = ?auto_171651 ?auto_171654 ) ) ( not ( = ?auto_171651 ?auto_171655 ) ) ( not ( = ?auto_171651 ?auto_171656 ) ) ( not ( = ?auto_171651 ?auto_171657 ) ) ( not ( = ?auto_171651 ?auto_171658 ) ) ( not ( = ?auto_171651 ?auto_171659 ) ) ( not ( = ?auto_171651 ?auto_171660 ) ) ( not ( = ?auto_171651 ?auto_171661 ) ) ( not ( = ?auto_171651 ?auto_171662 ) ) ( not ( = ?auto_171651 ?auto_171663 ) ) ( not ( = ?auto_171652 ?auto_171653 ) ) ( not ( = ?auto_171652 ?auto_171654 ) ) ( not ( = ?auto_171652 ?auto_171655 ) ) ( not ( = ?auto_171652 ?auto_171656 ) ) ( not ( = ?auto_171652 ?auto_171657 ) ) ( not ( = ?auto_171652 ?auto_171658 ) ) ( not ( = ?auto_171652 ?auto_171659 ) ) ( not ( = ?auto_171652 ?auto_171660 ) ) ( not ( = ?auto_171652 ?auto_171661 ) ) ( not ( = ?auto_171652 ?auto_171662 ) ) ( not ( = ?auto_171652 ?auto_171663 ) ) ( not ( = ?auto_171653 ?auto_171654 ) ) ( not ( = ?auto_171653 ?auto_171655 ) ) ( not ( = ?auto_171653 ?auto_171656 ) ) ( not ( = ?auto_171653 ?auto_171657 ) ) ( not ( = ?auto_171653 ?auto_171658 ) ) ( not ( = ?auto_171653 ?auto_171659 ) ) ( not ( = ?auto_171653 ?auto_171660 ) ) ( not ( = ?auto_171653 ?auto_171661 ) ) ( not ( = ?auto_171653 ?auto_171662 ) ) ( not ( = ?auto_171653 ?auto_171663 ) ) ( not ( = ?auto_171654 ?auto_171655 ) ) ( not ( = ?auto_171654 ?auto_171656 ) ) ( not ( = ?auto_171654 ?auto_171657 ) ) ( not ( = ?auto_171654 ?auto_171658 ) ) ( not ( = ?auto_171654 ?auto_171659 ) ) ( not ( = ?auto_171654 ?auto_171660 ) ) ( not ( = ?auto_171654 ?auto_171661 ) ) ( not ( = ?auto_171654 ?auto_171662 ) ) ( not ( = ?auto_171654 ?auto_171663 ) ) ( not ( = ?auto_171655 ?auto_171656 ) ) ( not ( = ?auto_171655 ?auto_171657 ) ) ( not ( = ?auto_171655 ?auto_171658 ) ) ( not ( = ?auto_171655 ?auto_171659 ) ) ( not ( = ?auto_171655 ?auto_171660 ) ) ( not ( = ?auto_171655 ?auto_171661 ) ) ( not ( = ?auto_171655 ?auto_171662 ) ) ( not ( = ?auto_171655 ?auto_171663 ) ) ( not ( = ?auto_171656 ?auto_171657 ) ) ( not ( = ?auto_171656 ?auto_171658 ) ) ( not ( = ?auto_171656 ?auto_171659 ) ) ( not ( = ?auto_171656 ?auto_171660 ) ) ( not ( = ?auto_171656 ?auto_171661 ) ) ( not ( = ?auto_171656 ?auto_171662 ) ) ( not ( = ?auto_171656 ?auto_171663 ) ) ( not ( = ?auto_171657 ?auto_171658 ) ) ( not ( = ?auto_171657 ?auto_171659 ) ) ( not ( = ?auto_171657 ?auto_171660 ) ) ( not ( = ?auto_171657 ?auto_171661 ) ) ( not ( = ?auto_171657 ?auto_171662 ) ) ( not ( = ?auto_171657 ?auto_171663 ) ) ( not ( = ?auto_171658 ?auto_171659 ) ) ( not ( = ?auto_171658 ?auto_171660 ) ) ( not ( = ?auto_171658 ?auto_171661 ) ) ( not ( = ?auto_171658 ?auto_171662 ) ) ( not ( = ?auto_171658 ?auto_171663 ) ) ( not ( = ?auto_171659 ?auto_171660 ) ) ( not ( = ?auto_171659 ?auto_171661 ) ) ( not ( = ?auto_171659 ?auto_171662 ) ) ( not ( = ?auto_171659 ?auto_171663 ) ) ( not ( = ?auto_171660 ?auto_171661 ) ) ( not ( = ?auto_171660 ?auto_171662 ) ) ( not ( = ?auto_171660 ?auto_171663 ) ) ( not ( = ?auto_171661 ?auto_171662 ) ) ( not ( = ?auto_171661 ?auto_171663 ) ) ( not ( = ?auto_171662 ?auto_171663 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171662 ?auto_171663 )
      ( !STACK ?auto_171662 ?auto_171661 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171676 - BLOCK
      ?auto_171677 - BLOCK
      ?auto_171678 - BLOCK
      ?auto_171679 - BLOCK
      ?auto_171680 - BLOCK
      ?auto_171681 - BLOCK
      ?auto_171682 - BLOCK
      ?auto_171683 - BLOCK
      ?auto_171684 - BLOCK
      ?auto_171685 - BLOCK
      ?auto_171686 - BLOCK
      ?auto_171687 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_171686 ) ( ON-TABLE ?auto_171687 ) ( CLEAR ?auto_171687 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171676 ) ( ON ?auto_171677 ?auto_171676 ) ( ON ?auto_171678 ?auto_171677 ) ( ON ?auto_171679 ?auto_171678 ) ( ON ?auto_171680 ?auto_171679 ) ( ON ?auto_171681 ?auto_171680 ) ( ON ?auto_171682 ?auto_171681 ) ( ON ?auto_171683 ?auto_171682 ) ( ON ?auto_171684 ?auto_171683 ) ( ON ?auto_171685 ?auto_171684 ) ( ON ?auto_171686 ?auto_171685 ) ( not ( = ?auto_171676 ?auto_171677 ) ) ( not ( = ?auto_171676 ?auto_171678 ) ) ( not ( = ?auto_171676 ?auto_171679 ) ) ( not ( = ?auto_171676 ?auto_171680 ) ) ( not ( = ?auto_171676 ?auto_171681 ) ) ( not ( = ?auto_171676 ?auto_171682 ) ) ( not ( = ?auto_171676 ?auto_171683 ) ) ( not ( = ?auto_171676 ?auto_171684 ) ) ( not ( = ?auto_171676 ?auto_171685 ) ) ( not ( = ?auto_171676 ?auto_171686 ) ) ( not ( = ?auto_171676 ?auto_171687 ) ) ( not ( = ?auto_171677 ?auto_171678 ) ) ( not ( = ?auto_171677 ?auto_171679 ) ) ( not ( = ?auto_171677 ?auto_171680 ) ) ( not ( = ?auto_171677 ?auto_171681 ) ) ( not ( = ?auto_171677 ?auto_171682 ) ) ( not ( = ?auto_171677 ?auto_171683 ) ) ( not ( = ?auto_171677 ?auto_171684 ) ) ( not ( = ?auto_171677 ?auto_171685 ) ) ( not ( = ?auto_171677 ?auto_171686 ) ) ( not ( = ?auto_171677 ?auto_171687 ) ) ( not ( = ?auto_171678 ?auto_171679 ) ) ( not ( = ?auto_171678 ?auto_171680 ) ) ( not ( = ?auto_171678 ?auto_171681 ) ) ( not ( = ?auto_171678 ?auto_171682 ) ) ( not ( = ?auto_171678 ?auto_171683 ) ) ( not ( = ?auto_171678 ?auto_171684 ) ) ( not ( = ?auto_171678 ?auto_171685 ) ) ( not ( = ?auto_171678 ?auto_171686 ) ) ( not ( = ?auto_171678 ?auto_171687 ) ) ( not ( = ?auto_171679 ?auto_171680 ) ) ( not ( = ?auto_171679 ?auto_171681 ) ) ( not ( = ?auto_171679 ?auto_171682 ) ) ( not ( = ?auto_171679 ?auto_171683 ) ) ( not ( = ?auto_171679 ?auto_171684 ) ) ( not ( = ?auto_171679 ?auto_171685 ) ) ( not ( = ?auto_171679 ?auto_171686 ) ) ( not ( = ?auto_171679 ?auto_171687 ) ) ( not ( = ?auto_171680 ?auto_171681 ) ) ( not ( = ?auto_171680 ?auto_171682 ) ) ( not ( = ?auto_171680 ?auto_171683 ) ) ( not ( = ?auto_171680 ?auto_171684 ) ) ( not ( = ?auto_171680 ?auto_171685 ) ) ( not ( = ?auto_171680 ?auto_171686 ) ) ( not ( = ?auto_171680 ?auto_171687 ) ) ( not ( = ?auto_171681 ?auto_171682 ) ) ( not ( = ?auto_171681 ?auto_171683 ) ) ( not ( = ?auto_171681 ?auto_171684 ) ) ( not ( = ?auto_171681 ?auto_171685 ) ) ( not ( = ?auto_171681 ?auto_171686 ) ) ( not ( = ?auto_171681 ?auto_171687 ) ) ( not ( = ?auto_171682 ?auto_171683 ) ) ( not ( = ?auto_171682 ?auto_171684 ) ) ( not ( = ?auto_171682 ?auto_171685 ) ) ( not ( = ?auto_171682 ?auto_171686 ) ) ( not ( = ?auto_171682 ?auto_171687 ) ) ( not ( = ?auto_171683 ?auto_171684 ) ) ( not ( = ?auto_171683 ?auto_171685 ) ) ( not ( = ?auto_171683 ?auto_171686 ) ) ( not ( = ?auto_171683 ?auto_171687 ) ) ( not ( = ?auto_171684 ?auto_171685 ) ) ( not ( = ?auto_171684 ?auto_171686 ) ) ( not ( = ?auto_171684 ?auto_171687 ) ) ( not ( = ?auto_171685 ?auto_171686 ) ) ( not ( = ?auto_171685 ?auto_171687 ) ) ( not ( = ?auto_171686 ?auto_171687 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_171687 )
      ( !STACK ?auto_171687 ?auto_171686 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171700 - BLOCK
      ?auto_171701 - BLOCK
      ?auto_171702 - BLOCK
      ?auto_171703 - BLOCK
      ?auto_171704 - BLOCK
      ?auto_171705 - BLOCK
      ?auto_171706 - BLOCK
      ?auto_171707 - BLOCK
      ?auto_171708 - BLOCK
      ?auto_171709 - BLOCK
      ?auto_171710 - BLOCK
      ?auto_171711 - BLOCK
    )
    :vars
    (
      ?auto_171712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171711 ?auto_171712 ) ( ON-TABLE ?auto_171700 ) ( ON ?auto_171701 ?auto_171700 ) ( ON ?auto_171702 ?auto_171701 ) ( ON ?auto_171703 ?auto_171702 ) ( ON ?auto_171704 ?auto_171703 ) ( ON ?auto_171705 ?auto_171704 ) ( ON ?auto_171706 ?auto_171705 ) ( ON ?auto_171707 ?auto_171706 ) ( ON ?auto_171708 ?auto_171707 ) ( ON ?auto_171709 ?auto_171708 ) ( not ( = ?auto_171700 ?auto_171701 ) ) ( not ( = ?auto_171700 ?auto_171702 ) ) ( not ( = ?auto_171700 ?auto_171703 ) ) ( not ( = ?auto_171700 ?auto_171704 ) ) ( not ( = ?auto_171700 ?auto_171705 ) ) ( not ( = ?auto_171700 ?auto_171706 ) ) ( not ( = ?auto_171700 ?auto_171707 ) ) ( not ( = ?auto_171700 ?auto_171708 ) ) ( not ( = ?auto_171700 ?auto_171709 ) ) ( not ( = ?auto_171700 ?auto_171710 ) ) ( not ( = ?auto_171700 ?auto_171711 ) ) ( not ( = ?auto_171700 ?auto_171712 ) ) ( not ( = ?auto_171701 ?auto_171702 ) ) ( not ( = ?auto_171701 ?auto_171703 ) ) ( not ( = ?auto_171701 ?auto_171704 ) ) ( not ( = ?auto_171701 ?auto_171705 ) ) ( not ( = ?auto_171701 ?auto_171706 ) ) ( not ( = ?auto_171701 ?auto_171707 ) ) ( not ( = ?auto_171701 ?auto_171708 ) ) ( not ( = ?auto_171701 ?auto_171709 ) ) ( not ( = ?auto_171701 ?auto_171710 ) ) ( not ( = ?auto_171701 ?auto_171711 ) ) ( not ( = ?auto_171701 ?auto_171712 ) ) ( not ( = ?auto_171702 ?auto_171703 ) ) ( not ( = ?auto_171702 ?auto_171704 ) ) ( not ( = ?auto_171702 ?auto_171705 ) ) ( not ( = ?auto_171702 ?auto_171706 ) ) ( not ( = ?auto_171702 ?auto_171707 ) ) ( not ( = ?auto_171702 ?auto_171708 ) ) ( not ( = ?auto_171702 ?auto_171709 ) ) ( not ( = ?auto_171702 ?auto_171710 ) ) ( not ( = ?auto_171702 ?auto_171711 ) ) ( not ( = ?auto_171702 ?auto_171712 ) ) ( not ( = ?auto_171703 ?auto_171704 ) ) ( not ( = ?auto_171703 ?auto_171705 ) ) ( not ( = ?auto_171703 ?auto_171706 ) ) ( not ( = ?auto_171703 ?auto_171707 ) ) ( not ( = ?auto_171703 ?auto_171708 ) ) ( not ( = ?auto_171703 ?auto_171709 ) ) ( not ( = ?auto_171703 ?auto_171710 ) ) ( not ( = ?auto_171703 ?auto_171711 ) ) ( not ( = ?auto_171703 ?auto_171712 ) ) ( not ( = ?auto_171704 ?auto_171705 ) ) ( not ( = ?auto_171704 ?auto_171706 ) ) ( not ( = ?auto_171704 ?auto_171707 ) ) ( not ( = ?auto_171704 ?auto_171708 ) ) ( not ( = ?auto_171704 ?auto_171709 ) ) ( not ( = ?auto_171704 ?auto_171710 ) ) ( not ( = ?auto_171704 ?auto_171711 ) ) ( not ( = ?auto_171704 ?auto_171712 ) ) ( not ( = ?auto_171705 ?auto_171706 ) ) ( not ( = ?auto_171705 ?auto_171707 ) ) ( not ( = ?auto_171705 ?auto_171708 ) ) ( not ( = ?auto_171705 ?auto_171709 ) ) ( not ( = ?auto_171705 ?auto_171710 ) ) ( not ( = ?auto_171705 ?auto_171711 ) ) ( not ( = ?auto_171705 ?auto_171712 ) ) ( not ( = ?auto_171706 ?auto_171707 ) ) ( not ( = ?auto_171706 ?auto_171708 ) ) ( not ( = ?auto_171706 ?auto_171709 ) ) ( not ( = ?auto_171706 ?auto_171710 ) ) ( not ( = ?auto_171706 ?auto_171711 ) ) ( not ( = ?auto_171706 ?auto_171712 ) ) ( not ( = ?auto_171707 ?auto_171708 ) ) ( not ( = ?auto_171707 ?auto_171709 ) ) ( not ( = ?auto_171707 ?auto_171710 ) ) ( not ( = ?auto_171707 ?auto_171711 ) ) ( not ( = ?auto_171707 ?auto_171712 ) ) ( not ( = ?auto_171708 ?auto_171709 ) ) ( not ( = ?auto_171708 ?auto_171710 ) ) ( not ( = ?auto_171708 ?auto_171711 ) ) ( not ( = ?auto_171708 ?auto_171712 ) ) ( not ( = ?auto_171709 ?auto_171710 ) ) ( not ( = ?auto_171709 ?auto_171711 ) ) ( not ( = ?auto_171709 ?auto_171712 ) ) ( not ( = ?auto_171710 ?auto_171711 ) ) ( not ( = ?auto_171710 ?auto_171712 ) ) ( not ( = ?auto_171711 ?auto_171712 ) ) ( CLEAR ?auto_171709 ) ( ON ?auto_171710 ?auto_171711 ) ( CLEAR ?auto_171710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_171700 ?auto_171701 ?auto_171702 ?auto_171703 ?auto_171704 ?auto_171705 ?auto_171706 ?auto_171707 ?auto_171708 ?auto_171709 ?auto_171710 )
      ( MAKE-12PILE ?auto_171700 ?auto_171701 ?auto_171702 ?auto_171703 ?auto_171704 ?auto_171705 ?auto_171706 ?auto_171707 ?auto_171708 ?auto_171709 ?auto_171710 ?auto_171711 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171725 - BLOCK
      ?auto_171726 - BLOCK
      ?auto_171727 - BLOCK
      ?auto_171728 - BLOCK
      ?auto_171729 - BLOCK
      ?auto_171730 - BLOCK
      ?auto_171731 - BLOCK
      ?auto_171732 - BLOCK
      ?auto_171733 - BLOCK
      ?auto_171734 - BLOCK
      ?auto_171735 - BLOCK
      ?auto_171736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171736 ) ( ON-TABLE ?auto_171725 ) ( ON ?auto_171726 ?auto_171725 ) ( ON ?auto_171727 ?auto_171726 ) ( ON ?auto_171728 ?auto_171727 ) ( ON ?auto_171729 ?auto_171728 ) ( ON ?auto_171730 ?auto_171729 ) ( ON ?auto_171731 ?auto_171730 ) ( ON ?auto_171732 ?auto_171731 ) ( ON ?auto_171733 ?auto_171732 ) ( ON ?auto_171734 ?auto_171733 ) ( not ( = ?auto_171725 ?auto_171726 ) ) ( not ( = ?auto_171725 ?auto_171727 ) ) ( not ( = ?auto_171725 ?auto_171728 ) ) ( not ( = ?auto_171725 ?auto_171729 ) ) ( not ( = ?auto_171725 ?auto_171730 ) ) ( not ( = ?auto_171725 ?auto_171731 ) ) ( not ( = ?auto_171725 ?auto_171732 ) ) ( not ( = ?auto_171725 ?auto_171733 ) ) ( not ( = ?auto_171725 ?auto_171734 ) ) ( not ( = ?auto_171725 ?auto_171735 ) ) ( not ( = ?auto_171725 ?auto_171736 ) ) ( not ( = ?auto_171726 ?auto_171727 ) ) ( not ( = ?auto_171726 ?auto_171728 ) ) ( not ( = ?auto_171726 ?auto_171729 ) ) ( not ( = ?auto_171726 ?auto_171730 ) ) ( not ( = ?auto_171726 ?auto_171731 ) ) ( not ( = ?auto_171726 ?auto_171732 ) ) ( not ( = ?auto_171726 ?auto_171733 ) ) ( not ( = ?auto_171726 ?auto_171734 ) ) ( not ( = ?auto_171726 ?auto_171735 ) ) ( not ( = ?auto_171726 ?auto_171736 ) ) ( not ( = ?auto_171727 ?auto_171728 ) ) ( not ( = ?auto_171727 ?auto_171729 ) ) ( not ( = ?auto_171727 ?auto_171730 ) ) ( not ( = ?auto_171727 ?auto_171731 ) ) ( not ( = ?auto_171727 ?auto_171732 ) ) ( not ( = ?auto_171727 ?auto_171733 ) ) ( not ( = ?auto_171727 ?auto_171734 ) ) ( not ( = ?auto_171727 ?auto_171735 ) ) ( not ( = ?auto_171727 ?auto_171736 ) ) ( not ( = ?auto_171728 ?auto_171729 ) ) ( not ( = ?auto_171728 ?auto_171730 ) ) ( not ( = ?auto_171728 ?auto_171731 ) ) ( not ( = ?auto_171728 ?auto_171732 ) ) ( not ( = ?auto_171728 ?auto_171733 ) ) ( not ( = ?auto_171728 ?auto_171734 ) ) ( not ( = ?auto_171728 ?auto_171735 ) ) ( not ( = ?auto_171728 ?auto_171736 ) ) ( not ( = ?auto_171729 ?auto_171730 ) ) ( not ( = ?auto_171729 ?auto_171731 ) ) ( not ( = ?auto_171729 ?auto_171732 ) ) ( not ( = ?auto_171729 ?auto_171733 ) ) ( not ( = ?auto_171729 ?auto_171734 ) ) ( not ( = ?auto_171729 ?auto_171735 ) ) ( not ( = ?auto_171729 ?auto_171736 ) ) ( not ( = ?auto_171730 ?auto_171731 ) ) ( not ( = ?auto_171730 ?auto_171732 ) ) ( not ( = ?auto_171730 ?auto_171733 ) ) ( not ( = ?auto_171730 ?auto_171734 ) ) ( not ( = ?auto_171730 ?auto_171735 ) ) ( not ( = ?auto_171730 ?auto_171736 ) ) ( not ( = ?auto_171731 ?auto_171732 ) ) ( not ( = ?auto_171731 ?auto_171733 ) ) ( not ( = ?auto_171731 ?auto_171734 ) ) ( not ( = ?auto_171731 ?auto_171735 ) ) ( not ( = ?auto_171731 ?auto_171736 ) ) ( not ( = ?auto_171732 ?auto_171733 ) ) ( not ( = ?auto_171732 ?auto_171734 ) ) ( not ( = ?auto_171732 ?auto_171735 ) ) ( not ( = ?auto_171732 ?auto_171736 ) ) ( not ( = ?auto_171733 ?auto_171734 ) ) ( not ( = ?auto_171733 ?auto_171735 ) ) ( not ( = ?auto_171733 ?auto_171736 ) ) ( not ( = ?auto_171734 ?auto_171735 ) ) ( not ( = ?auto_171734 ?auto_171736 ) ) ( not ( = ?auto_171735 ?auto_171736 ) ) ( CLEAR ?auto_171734 ) ( ON ?auto_171735 ?auto_171736 ) ( CLEAR ?auto_171735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_171725 ?auto_171726 ?auto_171727 ?auto_171728 ?auto_171729 ?auto_171730 ?auto_171731 ?auto_171732 ?auto_171733 ?auto_171734 ?auto_171735 )
      ( MAKE-12PILE ?auto_171725 ?auto_171726 ?auto_171727 ?auto_171728 ?auto_171729 ?auto_171730 ?auto_171731 ?auto_171732 ?auto_171733 ?auto_171734 ?auto_171735 ?auto_171736 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171749 - BLOCK
      ?auto_171750 - BLOCK
      ?auto_171751 - BLOCK
      ?auto_171752 - BLOCK
      ?auto_171753 - BLOCK
      ?auto_171754 - BLOCK
      ?auto_171755 - BLOCK
      ?auto_171756 - BLOCK
      ?auto_171757 - BLOCK
      ?auto_171758 - BLOCK
      ?auto_171759 - BLOCK
      ?auto_171760 - BLOCK
    )
    :vars
    (
      ?auto_171761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171760 ?auto_171761 ) ( ON-TABLE ?auto_171749 ) ( ON ?auto_171750 ?auto_171749 ) ( ON ?auto_171751 ?auto_171750 ) ( ON ?auto_171752 ?auto_171751 ) ( ON ?auto_171753 ?auto_171752 ) ( ON ?auto_171754 ?auto_171753 ) ( ON ?auto_171755 ?auto_171754 ) ( ON ?auto_171756 ?auto_171755 ) ( ON ?auto_171757 ?auto_171756 ) ( not ( = ?auto_171749 ?auto_171750 ) ) ( not ( = ?auto_171749 ?auto_171751 ) ) ( not ( = ?auto_171749 ?auto_171752 ) ) ( not ( = ?auto_171749 ?auto_171753 ) ) ( not ( = ?auto_171749 ?auto_171754 ) ) ( not ( = ?auto_171749 ?auto_171755 ) ) ( not ( = ?auto_171749 ?auto_171756 ) ) ( not ( = ?auto_171749 ?auto_171757 ) ) ( not ( = ?auto_171749 ?auto_171758 ) ) ( not ( = ?auto_171749 ?auto_171759 ) ) ( not ( = ?auto_171749 ?auto_171760 ) ) ( not ( = ?auto_171749 ?auto_171761 ) ) ( not ( = ?auto_171750 ?auto_171751 ) ) ( not ( = ?auto_171750 ?auto_171752 ) ) ( not ( = ?auto_171750 ?auto_171753 ) ) ( not ( = ?auto_171750 ?auto_171754 ) ) ( not ( = ?auto_171750 ?auto_171755 ) ) ( not ( = ?auto_171750 ?auto_171756 ) ) ( not ( = ?auto_171750 ?auto_171757 ) ) ( not ( = ?auto_171750 ?auto_171758 ) ) ( not ( = ?auto_171750 ?auto_171759 ) ) ( not ( = ?auto_171750 ?auto_171760 ) ) ( not ( = ?auto_171750 ?auto_171761 ) ) ( not ( = ?auto_171751 ?auto_171752 ) ) ( not ( = ?auto_171751 ?auto_171753 ) ) ( not ( = ?auto_171751 ?auto_171754 ) ) ( not ( = ?auto_171751 ?auto_171755 ) ) ( not ( = ?auto_171751 ?auto_171756 ) ) ( not ( = ?auto_171751 ?auto_171757 ) ) ( not ( = ?auto_171751 ?auto_171758 ) ) ( not ( = ?auto_171751 ?auto_171759 ) ) ( not ( = ?auto_171751 ?auto_171760 ) ) ( not ( = ?auto_171751 ?auto_171761 ) ) ( not ( = ?auto_171752 ?auto_171753 ) ) ( not ( = ?auto_171752 ?auto_171754 ) ) ( not ( = ?auto_171752 ?auto_171755 ) ) ( not ( = ?auto_171752 ?auto_171756 ) ) ( not ( = ?auto_171752 ?auto_171757 ) ) ( not ( = ?auto_171752 ?auto_171758 ) ) ( not ( = ?auto_171752 ?auto_171759 ) ) ( not ( = ?auto_171752 ?auto_171760 ) ) ( not ( = ?auto_171752 ?auto_171761 ) ) ( not ( = ?auto_171753 ?auto_171754 ) ) ( not ( = ?auto_171753 ?auto_171755 ) ) ( not ( = ?auto_171753 ?auto_171756 ) ) ( not ( = ?auto_171753 ?auto_171757 ) ) ( not ( = ?auto_171753 ?auto_171758 ) ) ( not ( = ?auto_171753 ?auto_171759 ) ) ( not ( = ?auto_171753 ?auto_171760 ) ) ( not ( = ?auto_171753 ?auto_171761 ) ) ( not ( = ?auto_171754 ?auto_171755 ) ) ( not ( = ?auto_171754 ?auto_171756 ) ) ( not ( = ?auto_171754 ?auto_171757 ) ) ( not ( = ?auto_171754 ?auto_171758 ) ) ( not ( = ?auto_171754 ?auto_171759 ) ) ( not ( = ?auto_171754 ?auto_171760 ) ) ( not ( = ?auto_171754 ?auto_171761 ) ) ( not ( = ?auto_171755 ?auto_171756 ) ) ( not ( = ?auto_171755 ?auto_171757 ) ) ( not ( = ?auto_171755 ?auto_171758 ) ) ( not ( = ?auto_171755 ?auto_171759 ) ) ( not ( = ?auto_171755 ?auto_171760 ) ) ( not ( = ?auto_171755 ?auto_171761 ) ) ( not ( = ?auto_171756 ?auto_171757 ) ) ( not ( = ?auto_171756 ?auto_171758 ) ) ( not ( = ?auto_171756 ?auto_171759 ) ) ( not ( = ?auto_171756 ?auto_171760 ) ) ( not ( = ?auto_171756 ?auto_171761 ) ) ( not ( = ?auto_171757 ?auto_171758 ) ) ( not ( = ?auto_171757 ?auto_171759 ) ) ( not ( = ?auto_171757 ?auto_171760 ) ) ( not ( = ?auto_171757 ?auto_171761 ) ) ( not ( = ?auto_171758 ?auto_171759 ) ) ( not ( = ?auto_171758 ?auto_171760 ) ) ( not ( = ?auto_171758 ?auto_171761 ) ) ( not ( = ?auto_171759 ?auto_171760 ) ) ( not ( = ?auto_171759 ?auto_171761 ) ) ( not ( = ?auto_171760 ?auto_171761 ) ) ( ON ?auto_171759 ?auto_171760 ) ( CLEAR ?auto_171757 ) ( ON ?auto_171758 ?auto_171759 ) ( CLEAR ?auto_171758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_171749 ?auto_171750 ?auto_171751 ?auto_171752 ?auto_171753 ?auto_171754 ?auto_171755 ?auto_171756 ?auto_171757 ?auto_171758 )
      ( MAKE-12PILE ?auto_171749 ?auto_171750 ?auto_171751 ?auto_171752 ?auto_171753 ?auto_171754 ?auto_171755 ?auto_171756 ?auto_171757 ?auto_171758 ?auto_171759 ?auto_171760 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171774 - BLOCK
      ?auto_171775 - BLOCK
      ?auto_171776 - BLOCK
      ?auto_171777 - BLOCK
      ?auto_171778 - BLOCK
      ?auto_171779 - BLOCK
      ?auto_171780 - BLOCK
      ?auto_171781 - BLOCK
      ?auto_171782 - BLOCK
      ?auto_171783 - BLOCK
      ?auto_171784 - BLOCK
      ?auto_171785 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171785 ) ( ON-TABLE ?auto_171774 ) ( ON ?auto_171775 ?auto_171774 ) ( ON ?auto_171776 ?auto_171775 ) ( ON ?auto_171777 ?auto_171776 ) ( ON ?auto_171778 ?auto_171777 ) ( ON ?auto_171779 ?auto_171778 ) ( ON ?auto_171780 ?auto_171779 ) ( ON ?auto_171781 ?auto_171780 ) ( ON ?auto_171782 ?auto_171781 ) ( not ( = ?auto_171774 ?auto_171775 ) ) ( not ( = ?auto_171774 ?auto_171776 ) ) ( not ( = ?auto_171774 ?auto_171777 ) ) ( not ( = ?auto_171774 ?auto_171778 ) ) ( not ( = ?auto_171774 ?auto_171779 ) ) ( not ( = ?auto_171774 ?auto_171780 ) ) ( not ( = ?auto_171774 ?auto_171781 ) ) ( not ( = ?auto_171774 ?auto_171782 ) ) ( not ( = ?auto_171774 ?auto_171783 ) ) ( not ( = ?auto_171774 ?auto_171784 ) ) ( not ( = ?auto_171774 ?auto_171785 ) ) ( not ( = ?auto_171775 ?auto_171776 ) ) ( not ( = ?auto_171775 ?auto_171777 ) ) ( not ( = ?auto_171775 ?auto_171778 ) ) ( not ( = ?auto_171775 ?auto_171779 ) ) ( not ( = ?auto_171775 ?auto_171780 ) ) ( not ( = ?auto_171775 ?auto_171781 ) ) ( not ( = ?auto_171775 ?auto_171782 ) ) ( not ( = ?auto_171775 ?auto_171783 ) ) ( not ( = ?auto_171775 ?auto_171784 ) ) ( not ( = ?auto_171775 ?auto_171785 ) ) ( not ( = ?auto_171776 ?auto_171777 ) ) ( not ( = ?auto_171776 ?auto_171778 ) ) ( not ( = ?auto_171776 ?auto_171779 ) ) ( not ( = ?auto_171776 ?auto_171780 ) ) ( not ( = ?auto_171776 ?auto_171781 ) ) ( not ( = ?auto_171776 ?auto_171782 ) ) ( not ( = ?auto_171776 ?auto_171783 ) ) ( not ( = ?auto_171776 ?auto_171784 ) ) ( not ( = ?auto_171776 ?auto_171785 ) ) ( not ( = ?auto_171777 ?auto_171778 ) ) ( not ( = ?auto_171777 ?auto_171779 ) ) ( not ( = ?auto_171777 ?auto_171780 ) ) ( not ( = ?auto_171777 ?auto_171781 ) ) ( not ( = ?auto_171777 ?auto_171782 ) ) ( not ( = ?auto_171777 ?auto_171783 ) ) ( not ( = ?auto_171777 ?auto_171784 ) ) ( not ( = ?auto_171777 ?auto_171785 ) ) ( not ( = ?auto_171778 ?auto_171779 ) ) ( not ( = ?auto_171778 ?auto_171780 ) ) ( not ( = ?auto_171778 ?auto_171781 ) ) ( not ( = ?auto_171778 ?auto_171782 ) ) ( not ( = ?auto_171778 ?auto_171783 ) ) ( not ( = ?auto_171778 ?auto_171784 ) ) ( not ( = ?auto_171778 ?auto_171785 ) ) ( not ( = ?auto_171779 ?auto_171780 ) ) ( not ( = ?auto_171779 ?auto_171781 ) ) ( not ( = ?auto_171779 ?auto_171782 ) ) ( not ( = ?auto_171779 ?auto_171783 ) ) ( not ( = ?auto_171779 ?auto_171784 ) ) ( not ( = ?auto_171779 ?auto_171785 ) ) ( not ( = ?auto_171780 ?auto_171781 ) ) ( not ( = ?auto_171780 ?auto_171782 ) ) ( not ( = ?auto_171780 ?auto_171783 ) ) ( not ( = ?auto_171780 ?auto_171784 ) ) ( not ( = ?auto_171780 ?auto_171785 ) ) ( not ( = ?auto_171781 ?auto_171782 ) ) ( not ( = ?auto_171781 ?auto_171783 ) ) ( not ( = ?auto_171781 ?auto_171784 ) ) ( not ( = ?auto_171781 ?auto_171785 ) ) ( not ( = ?auto_171782 ?auto_171783 ) ) ( not ( = ?auto_171782 ?auto_171784 ) ) ( not ( = ?auto_171782 ?auto_171785 ) ) ( not ( = ?auto_171783 ?auto_171784 ) ) ( not ( = ?auto_171783 ?auto_171785 ) ) ( not ( = ?auto_171784 ?auto_171785 ) ) ( ON ?auto_171784 ?auto_171785 ) ( CLEAR ?auto_171782 ) ( ON ?auto_171783 ?auto_171784 ) ( CLEAR ?auto_171783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_171774 ?auto_171775 ?auto_171776 ?auto_171777 ?auto_171778 ?auto_171779 ?auto_171780 ?auto_171781 ?auto_171782 ?auto_171783 )
      ( MAKE-12PILE ?auto_171774 ?auto_171775 ?auto_171776 ?auto_171777 ?auto_171778 ?auto_171779 ?auto_171780 ?auto_171781 ?auto_171782 ?auto_171783 ?auto_171784 ?auto_171785 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171798 - BLOCK
      ?auto_171799 - BLOCK
      ?auto_171800 - BLOCK
      ?auto_171801 - BLOCK
      ?auto_171802 - BLOCK
      ?auto_171803 - BLOCK
      ?auto_171804 - BLOCK
      ?auto_171805 - BLOCK
      ?auto_171806 - BLOCK
      ?auto_171807 - BLOCK
      ?auto_171808 - BLOCK
      ?auto_171809 - BLOCK
    )
    :vars
    (
      ?auto_171810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171809 ?auto_171810 ) ( ON-TABLE ?auto_171798 ) ( ON ?auto_171799 ?auto_171798 ) ( ON ?auto_171800 ?auto_171799 ) ( ON ?auto_171801 ?auto_171800 ) ( ON ?auto_171802 ?auto_171801 ) ( ON ?auto_171803 ?auto_171802 ) ( ON ?auto_171804 ?auto_171803 ) ( ON ?auto_171805 ?auto_171804 ) ( not ( = ?auto_171798 ?auto_171799 ) ) ( not ( = ?auto_171798 ?auto_171800 ) ) ( not ( = ?auto_171798 ?auto_171801 ) ) ( not ( = ?auto_171798 ?auto_171802 ) ) ( not ( = ?auto_171798 ?auto_171803 ) ) ( not ( = ?auto_171798 ?auto_171804 ) ) ( not ( = ?auto_171798 ?auto_171805 ) ) ( not ( = ?auto_171798 ?auto_171806 ) ) ( not ( = ?auto_171798 ?auto_171807 ) ) ( not ( = ?auto_171798 ?auto_171808 ) ) ( not ( = ?auto_171798 ?auto_171809 ) ) ( not ( = ?auto_171798 ?auto_171810 ) ) ( not ( = ?auto_171799 ?auto_171800 ) ) ( not ( = ?auto_171799 ?auto_171801 ) ) ( not ( = ?auto_171799 ?auto_171802 ) ) ( not ( = ?auto_171799 ?auto_171803 ) ) ( not ( = ?auto_171799 ?auto_171804 ) ) ( not ( = ?auto_171799 ?auto_171805 ) ) ( not ( = ?auto_171799 ?auto_171806 ) ) ( not ( = ?auto_171799 ?auto_171807 ) ) ( not ( = ?auto_171799 ?auto_171808 ) ) ( not ( = ?auto_171799 ?auto_171809 ) ) ( not ( = ?auto_171799 ?auto_171810 ) ) ( not ( = ?auto_171800 ?auto_171801 ) ) ( not ( = ?auto_171800 ?auto_171802 ) ) ( not ( = ?auto_171800 ?auto_171803 ) ) ( not ( = ?auto_171800 ?auto_171804 ) ) ( not ( = ?auto_171800 ?auto_171805 ) ) ( not ( = ?auto_171800 ?auto_171806 ) ) ( not ( = ?auto_171800 ?auto_171807 ) ) ( not ( = ?auto_171800 ?auto_171808 ) ) ( not ( = ?auto_171800 ?auto_171809 ) ) ( not ( = ?auto_171800 ?auto_171810 ) ) ( not ( = ?auto_171801 ?auto_171802 ) ) ( not ( = ?auto_171801 ?auto_171803 ) ) ( not ( = ?auto_171801 ?auto_171804 ) ) ( not ( = ?auto_171801 ?auto_171805 ) ) ( not ( = ?auto_171801 ?auto_171806 ) ) ( not ( = ?auto_171801 ?auto_171807 ) ) ( not ( = ?auto_171801 ?auto_171808 ) ) ( not ( = ?auto_171801 ?auto_171809 ) ) ( not ( = ?auto_171801 ?auto_171810 ) ) ( not ( = ?auto_171802 ?auto_171803 ) ) ( not ( = ?auto_171802 ?auto_171804 ) ) ( not ( = ?auto_171802 ?auto_171805 ) ) ( not ( = ?auto_171802 ?auto_171806 ) ) ( not ( = ?auto_171802 ?auto_171807 ) ) ( not ( = ?auto_171802 ?auto_171808 ) ) ( not ( = ?auto_171802 ?auto_171809 ) ) ( not ( = ?auto_171802 ?auto_171810 ) ) ( not ( = ?auto_171803 ?auto_171804 ) ) ( not ( = ?auto_171803 ?auto_171805 ) ) ( not ( = ?auto_171803 ?auto_171806 ) ) ( not ( = ?auto_171803 ?auto_171807 ) ) ( not ( = ?auto_171803 ?auto_171808 ) ) ( not ( = ?auto_171803 ?auto_171809 ) ) ( not ( = ?auto_171803 ?auto_171810 ) ) ( not ( = ?auto_171804 ?auto_171805 ) ) ( not ( = ?auto_171804 ?auto_171806 ) ) ( not ( = ?auto_171804 ?auto_171807 ) ) ( not ( = ?auto_171804 ?auto_171808 ) ) ( not ( = ?auto_171804 ?auto_171809 ) ) ( not ( = ?auto_171804 ?auto_171810 ) ) ( not ( = ?auto_171805 ?auto_171806 ) ) ( not ( = ?auto_171805 ?auto_171807 ) ) ( not ( = ?auto_171805 ?auto_171808 ) ) ( not ( = ?auto_171805 ?auto_171809 ) ) ( not ( = ?auto_171805 ?auto_171810 ) ) ( not ( = ?auto_171806 ?auto_171807 ) ) ( not ( = ?auto_171806 ?auto_171808 ) ) ( not ( = ?auto_171806 ?auto_171809 ) ) ( not ( = ?auto_171806 ?auto_171810 ) ) ( not ( = ?auto_171807 ?auto_171808 ) ) ( not ( = ?auto_171807 ?auto_171809 ) ) ( not ( = ?auto_171807 ?auto_171810 ) ) ( not ( = ?auto_171808 ?auto_171809 ) ) ( not ( = ?auto_171808 ?auto_171810 ) ) ( not ( = ?auto_171809 ?auto_171810 ) ) ( ON ?auto_171808 ?auto_171809 ) ( ON ?auto_171807 ?auto_171808 ) ( CLEAR ?auto_171805 ) ( ON ?auto_171806 ?auto_171807 ) ( CLEAR ?auto_171806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_171798 ?auto_171799 ?auto_171800 ?auto_171801 ?auto_171802 ?auto_171803 ?auto_171804 ?auto_171805 ?auto_171806 )
      ( MAKE-12PILE ?auto_171798 ?auto_171799 ?auto_171800 ?auto_171801 ?auto_171802 ?auto_171803 ?auto_171804 ?auto_171805 ?auto_171806 ?auto_171807 ?auto_171808 ?auto_171809 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171823 - BLOCK
      ?auto_171824 - BLOCK
      ?auto_171825 - BLOCK
      ?auto_171826 - BLOCK
      ?auto_171827 - BLOCK
      ?auto_171828 - BLOCK
      ?auto_171829 - BLOCK
      ?auto_171830 - BLOCK
      ?auto_171831 - BLOCK
      ?auto_171832 - BLOCK
      ?auto_171833 - BLOCK
      ?auto_171834 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171834 ) ( ON-TABLE ?auto_171823 ) ( ON ?auto_171824 ?auto_171823 ) ( ON ?auto_171825 ?auto_171824 ) ( ON ?auto_171826 ?auto_171825 ) ( ON ?auto_171827 ?auto_171826 ) ( ON ?auto_171828 ?auto_171827 ) ( ON ?auto_171829 ?auto_171828 ) ( ON ?auto_171830 ?auto_171829 ) ( not ( = ?auto_171823 ?auto_171824 ) ) ( not ( = ?auto_171823 ?auto_171825 ) ) ( not ( = ?auto_171823 ?auto_171826 ) ) ( not ( = ?auto_171823 ?auto_171827 ) ) ( not ( = ?auto_171823 ?auto_171828 ) ) ( not ( = ?auto_171823 ?auto_171829 ) ) ( not ( = ?auto_171823 ?auto_171830 ) ) ( not ( = ?auto_171823 ?auto_171831 ) ) ( not ( = ?auto_171823 ?auto_171832 ) ) ( not ( = ?auto_171823 ?auto_171833 ) ) ( not ( = ?auto_171823 ?auto_171834 ) ) ( not ( = ?auto_171824 ?auto_171825 ) ) ( not ( = ?auto_171824 ?auto_171826 ) ) ( not ( = ?auto_171824 ?auto_171827 ) ) ( not ( = ?auto_171824 ?auto_171828 ) ) ( not ( = ?auto_171824 ?auto_171829 ) ) ( not ( = ?auto_171824 ?auto_171830 ) ) ( not ( = ?auto_171824 ?auto_171831 ) ) ( not ( = ?auto_171824 ?auto_171832 ) ) ( not ( = ?auto_171824 ?auto_171833 ) ) ( not ( = ?auto_171824 ?auto_171834 ) ) ( not ( = ?auto_171825 ?auto_171826 ) ) ( not ( = ?auto_171825 ?auto_171827 ) ) ( not ( = ?auto_171825 ?auto_171828 ) ) ( not ( = ?auto_171825 ?auto_171829 ) ) ( not ( = ?auto_171825 ?auto_171830 ) ) ( not ( = ?auto_171825 ?auto_171831 ) ) ( not ( = ?auto_171825 ?auto_171832 ) ) ( not ( = ?auto_171825 ?auto_171833 ) ) ( not ( = ?auto_171825 ?auto_171834 ) ) ( not ( = ?auto_171826 ?auto_171827 ) ) ( not ( = ?auto_171826 ?auto_171828 ) ) ( not ( = ?auto_171826 ?auto_171829 ) ) ( not ( = ?auto_171826 ?auto_171830 ) ) ( not ( = ?auto_171826 ?auto_171831 ) ) ( not ( = ?auto_171826 ?auto_171832 ) ) ( not ( = ?auto_171826 ?auto_171833 ) ) ( not ( = ?auto_171826 ?auto_171834 ) ) ( not ( = ?auto_171827 ?auto_171828 ) ) ( not ( = ?auto_171827 ?auto_171829 ) ) ( not ( = ?auto_171827 ?auto_171830 ) ) ( not ( = ?auto_171827 ?auto_171831 ) ) ( not ( = ?auto_171827 ?auto_171832 ) ) ( not ( = ?auto_171827 ?auto_171833 ) ) ( not ( = ?auto_171827 ?auto_171834 ) ) ( not ( = ?auto_171828 ?auto_171829 ) ) ( not ( = ?auto_171828 ?auto_171830 ) ) ( not ( = ?auto_171828 ?auto_171831 ) ) ( not ( = ?auto_171828 ?auto_171832 ) ) ( not ( = ?auto_171828 ?auto_171833 ) ) ( not ( = ?auto_171828 ?auto_171834 ) ) ( not ( = ?auto_171829 ?auto_171830 ) ) ( not ( = ?auto_171829 ?auto_171831 ) ) ( not ( = ?auto_171829 ?auto_171832 ) ) ( not ( = ?auto_171829 ?auto_171833 ) ) ( not ( = ?auto_171829 ?auto_171834 ) ) ( not ( = ?auto_171830 ?auto_171831 ) ) ( not ( = ?auto_171830 ?auto_171832 ) ) ( not ( = ?auto_171830 ?auto_171833 ) ) ( not ( = ?auto_171830 ?auto_171834 ) ) ( not ( = ?auto_171831 ?auto_171832 ) ) ( not ( = ?auto_171831 ?auto_171833 ) ) ( not ( = ?auto_171831 ?auto_171834 ) ) ( not ( = ?auto_171832 ?auto_171833 ) ) ( not ( = ?auto_171832 ?auto_171834 ) ) ( not ( = ?auto_171833 ?auto_171834 ) ) ( ON ?auto_171833 ?auto_171834 ) ( ON ?auto_171832 ?auto_171833 ) ( CLEAR ?auto_171830 ) ( ON ?auto_171831 ?auto_171832 ) ( CLEAR ?auto_171831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_171823 ?auto_171824 ?auto_171825 ?auto_171826 ?auto_171827 ?auto_171828 ?auto_171829 ?auto_171830 ?auto_171831 )
      ( MAKE-12PILE ?auto_171823 ?auto_171824 ?auto_171825 ?auto_171826 ?auto_171827 ?auto_171828 ?auto_171829 ?auto_171830 ?auto_171831 ?auto_171832 ?auto_171833 ?auto_171834 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171847 - BLOCK
      ?auto_171848 - BLOCK
      ?auto_171849 - BLOCK
      ?auto_171850 - BLOCK
      ?auto_171851 - BLOCK
      ?auto_171852 - BLOCK
      ?auto_171853 - BLOCK
      ?auto_171854 - BLOCK
      ?auto_171855 - BLOCK
      ?auto_171856 - BLOCK
      ?auto_171857 - BLOCK
      ?auto_171858 - BLOCK
    )
    :vars
    (
      ?auto_171859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171858 ?auto_171859 ) ( ON-TABLE ?auto_171847 ) ( ON ?auto_171848 ?auto_171847 ) ( ON ?auto_171849 ?auto_171848 ) ( ON ?auto_171850 ?auto_171849 ) ( ON ?auto_171851 ?auto_171850 ) ( ON ?auto_171852 ?auto_171851 ) ( ON ?auto_171853 ?auto_171852 ) ( not ( = ?auto_171847 ?auto_171848 ) ) ( not ( = ?auto_171847 ?auto_171849 ) ) ( not ( = ?auto_171847 ?auto_171850 ) ) ( not ( = ?auto_171847 ?auto_171851 ) ) ( not ( = ?auto_171847 ?auto_171852 ) ) ( not ( = ?auto_171847 ?auto_171853 ) ) ( not ( = ?auto_171847 ?auto_171854 ) ) ( not ( = ?auto_171847 ?auto_171855 ) ) ( not ( = ?auto_171847 ?auto_171856 ) ) ( not ( = ?auto_171847 ?auto_171857 ) ) ( not ( = ?auto_171847 ?auto_171858 ) ) ( not ( = ?auto_171847 ?auto_171859 ) ) ( not ( = ?auto_171848 ?auto_171849 ) ) ( not ( = ?auto_171848 ?auto_171850 ) ) ( not ( = ?auto_171848 ?auto_171851 ) ) ( not ( = ?auto_171848 ?auto_171852 ) ) ( not ( = ?auto_171848 ?auto_171853 ) ) ( not ( = ?auto_171848 ?auto_171854 ) ) ( not ( = ?auto_171848 ?auto_171855 ) ) ( not ( = ?auto_171848 ?auto_171856 ) ) ( not ( = ?auto_171848 ?auto_171857 ) ) ( not ( = ?auto_171848 ?auto_171858 ) ) ( not ( = ?auto_171848 ?auto_171859 ) ) ( not ( = ?auto_171849 ?auto_171850 ) ) ( not ( = ?auto_171849 ?auto_171851 ) ) ( not ( = ?auto_171849 ?auto_171852 ) ) ( not ( = ?auto_171849 ?auto_171853 ) ) ( not ( = ?auto_171849 ?auto_171854 ) ) ( not ( = ?auto_171849 ?auto_171855 ) ) ( not ( = ?auto_171849 ?auto_171856 ) ) ( not ( = ?auto_171849 ?auto_171857 ) ) ( not ( = ?auto_171849 ?auto_171858 ) ) ( not ( = ?auto_171849 ?auto_171859 ) ) ( not ( = ?auto_171850 ?auto_171851 ) ) ( not ( = ?auto_171850 ?auto_171852 ) ) ( not ( = ?auto_171850 ?auto_171853 ) ) ( not ( = ?auto_171850 ?auto_171854 ) ) ( not ( = ?auto_171850 ?auto_171855 ) ) ( not ( = ?auto_171850 ?auto_171856 ) ) ( not ( = ?auto_171850 ?auto_171857 ) ) ( not ( = ?auto_171850 ?auto_171858 ) ) ( not ( = ?auto_171850 ?auto_171859 ) ) ( not ( = ?auto_171851 ?auto_171852 ) ) ( not ( = ?auto_171851 ?auto_171853 ) ) ( not ( = ?auto_171851 ?auto_171854 ) ) ( not ( = ?auto_171851 ?auto_171855 ) ) ( not ( = ?auto_171851 ?auto_171856 ) ) ( not ( = ?auto_171851 ?auto_171857 ) ) ( not ( = ?auto_171851 ?auto_171858 ) ) ( not ( = ?auto_171851 ?auto_171859 ) ) ( not ( = ?auto_171852 ?auto_171853 ) ) ( not ( = ?auto_171852 ?auto_171854 ) ) ( not ( = ?auto_171852 ?auto_171855 ) ) ( not ( = ?auto_171852 ?auto_171856 ) ) ( not ( = ?auto_171852 ?auto_171857 ) ) ( not ( = ?auto_171852 ?auto_171858 ) ) ( not ( = ?auto_171852 ?auto_171859 ) ) ( not ( = ?auto_171853 ?auto_171854 ) ) ( not ( = ?auto_171853 ?auto_171855 ) ) ( not ( = ?auto_171853 ?auto_171856 ) ) ( not ( = ?auto_171853 ?auto_171857 ) ) ( not ( = ?auto_171853 ?auto_171858 ) ) ( not ( = ?auto_171853 ?auto_171859 ) ) ( not ( = ?auto_171854 ?auto_171855 ) ) ( not ( = ?auto_171854 ?auto_171856 ) ) ( not ( = ?auto_171854 ?auto_171857 ) ) ( not ( = ?auto_171854 ?auto_171858 ) ) ( not ( = ?auto_171854 ?auto_171859 ) ) ( not ( = ?auto_171855 ?auto_171856 ) ) ( not ( = ?auto_171855 ?auto_171857 ) ) ( not ( = ?auto_171855 ?auto_171858 ) ) ( not ( = ?auto_171855 ?auto_171859 ) ) ( not ( = ?auto_171856 ?auto_171857 ) ) ( not ( = ?auto_171856 ?auto_171858 ) ) ( not ( = ?auto_171856 ?auto_171859 ) ) ( not ( = ?auto_171857 ?auto_171858 ) ) ( not ( = ?auto_171857 ?auto_171859 ) ) ( not ( = ?auto_171858 ?auto_171859 ) ) ( ON ?auto_171857 ?auto_171858 ) ( ON ?auto_171856 ?auto_171857 ) ( ON ?auto_171855 ?auto_171856 ) ( CLEAR ?auto_171853 ) ( ON ?auto_171854 ?auto_171855 ) ( CLEAR ?auto_171854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171847 ?auto_171848 ?auto_171849 ?auto_171850 ?auto_171851 ?auto_171852 ?auto_171853 ?auto_171854 )
      ( MAKE-12PILE ?auto_171847 ?auto_171848 ?auto_171849 ?auto_171850 ?auto_171851 ?auto_171852 ?auto_171853 ?auto_171854 ?auto_171855 ?auto_171856 ?auto_171857 ?auto_171858 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171872 - BLOCK
      ?auto_171873 - BLOCK
      ?auto_171874 - BLOCK
      ?auto_171875 - BLOCK
      ?auto_171876 - BLOCK
      ?auto_171877 - BLOCK
      ?auto_171878 - BLOCK
      ?auto_171879 - BLOCK
      ?auto_171880 - BLOCK
      ?auto_171881 - BLOCK
      ?auto_171882 - BLOCK
      ?auto_171883 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171883 ) ( ON-TABLE ?auto_171872 ) ( ON ?auto_171873 ?auto_171872 ) ( ON ?auto_171874 ?auto_171873 ) ( ON ?auto_171875 ?auto_171874 ) ( ON ?auto_171876 ?auto_171875 ) ( ON ?auto_171877 ?auto_171876 ) ( ON ?auto_171878 ?auto_171877 ) ( not ( = ?auto_171872 ?auto_171873 ) ) ( not ( = ?auto_171872 ?auto_171874 ) ) ( not ( = ?auto_171872 ?auto_171875 ) ) ( not ( = ?auto_171872 ?auto_171876 ) ) ( not ( = ?auto_171872 ?auto_171877 ) ) ( not ( = ?auto_171872 ?auto_171878 ) ) ( not ( = ?auto_171872 ?auto_171879 ) ) ( not ( = ?auto_171872 ?auto_171880 ) ) ( not ( = ?auto_171872 ?auto_171881 ) ) ( not ( = ?auto_171872 ?auto_171882 ) ) ( not ( = ?auto_171872 ?auto_171883 ) ) ( not ( = ?auto_171873 ?auto_171874 ) ) ( not ( = ?auto_171873 ?auto_171875 ) ) ( not ( = ?auto_171873 ?auto_171876 ) ) ( not ( = ?auto_171873 ?auto_171877 ) ) ( not ( = ?auto_171873 ?auto_171878 ) ) ( not ( = ?auto_171873 ?auto_171879 ) ) ( not ( = ?auto_171873 ?auto_171880 ) ) ( not ( = ?auto_171873 ?auto_171881 ) ) ( not ( = ?auto_171873 ?auto_171882 ) ) ( not ( = ?auto_171873 ?auto_171883 ) ) ( not ( = ?auto_171874 ?auto_171875 ) ) ( not ( = ?auto_171874 ?auto_171876 ) ) ( not ( = ?auto_171874 ?auto_171877 ) ) ( not ( = ?auto_171874 ?auto_171878 ) ) ( not ( = ?auto_171874 ?auto_171879 ) ) ( not ( = ?auto_171874 ?auto_171880 ) ) ( not ( = ?auto_171874 ?auto_171881 ) ) ( not ( = ?auto_171874 ?auto_171882 ) ) ( not ( = ?auto_171874 ?auto_171883 ) ) ( not ( = ?auto_171875 ?auto_171876 ) ) ( not ( = ?auto_171875 ?auto_171877 ) ) ( not ( = ?auto_171875 ?auto_171878 ) ) ( not ( = ?auto_171875 ?auto_171879 ) ) ( not ( = ?auto_171875 ?auto_171880 ) ) ( not ( = ?auto_171875 ?auto_171881 ) ) ( not ( = ?auto_171875 ?auto_171882 ) ) ( not ( = ?auto_171875 ?auto_171883 ) ) ( not ( = ?auto_171876 ?auto_171877 ) ) ( not ( = ?auto_171876 ?auto_171878 ) ) ( not ( = ?auto_171876 ?auto_171879 ) ) ( not ( = ?auto_171876 ?auto_171880 ) ) ( not ( = ?auto_171876 ?auto_171881 ) ) ( not ( = ?auto_171876 ?auto_171882 ) ) ( not ( = ?auto_171876 ?auto_171883 ) ) ( not ( = ?auto_171877 ?auto_171878 ) ) ( not ( = ?auto_171877 ?auto_171879 ) ) ( not ( = ?auto_171877 ?auto_171880 ) ) ( not ( = ?auto_171877 ?auto_171881 ) ) ( not ( = ?auto_171877 ?auto_171882 ) ) ( not ( = ?auto_171877 ?auto_171883 ) ) ( not ( = ?auto_171878 ?auto_171879 ) ) ( not ( = ?auto_171878 ?auto_171880 ) ) ( not ( = ?auto_171878 ?auto_171881 ) ) ( not ( = ?auto_171878 ?auto_171882 ) ) ( not ( = ?auto_171878 ?auto_171883 ) ) ( not ( = ?auto_171879 ?auto_171880 ) ) ( not ( = ?auto_171879 ?auto_171881 ) ) ( not ( = ?auto_171879 ?auto_171882 ) ) ( not ( = ?auto_171879 ?auto_171883 ) ) ( not ( = ?auto_171880 ?auto_171881 ) ) ( not ( = ?auto_171880 ?auto_171882 ) ) ( not ( = ?auto_171880 ?auto_171883 ) ) ( not ( = ?auto_171881 ?auto_171882 ) ) ( not ( = ?auto_171881 ?auto_171883 ) ) ( not ( = ?auto_171882 ?auto_171883 ) ) ( ON ?auto_171882 ?auto_171883 ) ( ON ?auto_171881 ?auto_171882 ) ( ON ?auto_171880 ?auto_171881 ) ( CLEAR ?auto_171878 ) ( ON ?auto_171879 ?auto_171880 ) ( CLEAR ?auto_171879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171872 ?auto_171873 ?auto_171874 ?auto_171875 ?auto_171876 ?auto_171877 ?auto_171878 ?auto_171879 )
      ( MAKE-12PILE ?auto_171872 ?auto_171873 ?auto_171874 ?auto_171875 ?auto_171876 ?auto_171877 ?auto_171878 ?auto_171879 ?auto_171880 ?auto_171881 ?auto_171882 ?auto_171883 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171896 - BLOCK
      ?auto_171897 - BLOCK
      ?auto_171898 - BLOCK
      ?auto_171899 - BLOCK
      ?auto_171900 - BLOCK
      ?auto_171901 - BLOCK
      ?auto_171902 - BLOCK
      ?auto_171903 - BLOCK
      ?auto_171904 - BLOCK
      ?auto_171905 - BLOCK
      ?auto_171906 - BLOCK
      ?auto_171907 - BLOCK
    )
    :vars
    (
      ?auto_171908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171907 ?auto_171908 ) ( ON-TABLE ?auto_171896 ) ( ON ?auto_171897 ?auto_171896 ) ( ON ?auto_171898 ?auto_171897 ) ( ON ?auto_171899 ?auto_171898 ) ( ON ?auto_171900 ?auto_171899 ) ( ON ?auto_171901 ?auto_171900 ) ( not ( = ?auto_171896 ?auto_171897 ) ) ( not ( = ?auto_171896 ?auto_171898 ) ) ( not ( = ?auto_171896 ?auto_171899 ) ) ( not ( = ?auto_171896 ?auto_171900 ) ) ( not ( = ?auto_171896 ?auto_171901 ) ) ( not ( = ?auto_171896 ?auto_171902 ) ) ( not ( = ?auto_171896 ?auto_171903 ) ) ( not ( = ?auto_171896 ?auto_171904 ) ) ( not ( = ?auto_171896 ?auto_171905 ) ) ( not ( = ?auto_171896 ?auto_171906 ) ) ( not ( = ?auto_171896 ?auto_171907 ) ) ( not ( = ?auto_171896 ?auto_171908 ) ) ( not ( = ?auto_171897 ?auto_171898 ) ) ( not ( = ?auto_171897 ?auto_171899 ) ) ( not ( = ?auto_171897 ?auto_171900 ) ) ( not ( = ?auto_171897 ?auto_171901 ) ) ( not ( = ?auto_171897 ?auto_171902 ) ) ( not ( = ?auto_171897 ?auto_171903 ) ) ( not ( = ?auto_171897 ?auto_171904 ) ) ( not ( = ?auto_171897 ?auto_171905 ) ) ( not ( = ?auto_171897 ?auto_171906 ) ) ( not ( = ?auto_171897 ?auto_171907 ) ) ( not ( = ?auto_171897 ?auto_171908 ) ) ( not ( = ?auto_171898 ?auto_171899 ) ) ( not ( = ?auto_171898 ?auto_171900 ) ) ( not ( = ?auto_171898 ?auto_171901 ) ) ( not ( = ?auto_171898 ?auto_171902 ) ) ( not ( = ?auto_171898 ?auto_171903 ) ) ( not ( = ?auto_171898 ?auto_171904 ) ) ( not ( = ?auto_171898 ?auto_171905 ) ) ( not ( = ?auto_171898 ?auto_171906 ) ) ( not ( = ?auto_171898 ?auto_171907 ) ) ( not ( = ?auto_171898 ?auto_171908 ) ) ( not ( = ?auto_171899 ?auto_171900 ) ) ( not ( = ?auto_171899 ?auto_171901 ) ) ( not ( = ?auto_171899 ?auto_171902 ) ) ( not ( = ?auto_171899 ?auto_171903 ) ) ( not ( = ?auto_171899 ?auto_171904 ) ) ( not ( = ?auto_171899 ?auto_171905 ) ) ( not ( = ?auto_171899 ?auto_171906 ) ) ( not ( = ?auto_171899 ?auto_171907 ) ) ( not ( = ?auto_171899 ?auto_171908 ) ) ( not ( = ?auto_171900 ?auto_171901 ) ) ( not ( = ?auto_171900 ?auto_171902 ) ) ( not ( = ?auto_171900 ?auto_171903 ) ) ( not ( = ?auto_171900 ?auto_171904 ) ) ( not ( = ?auto_171900 ?auto_171905 ) ) ( not ( = ?auto_171900 ?auto_171906 ) ) ( not ( = ?auto_171900 ?auto_171907 ) ) ( not ( = ?auto_171900 ?auto_171908 ) ) ( not ( = ?auto_171901 ?auto_171902 ) ) ( not ( = ?auto_171901 ?auto_171903 ) ) ( not ( = ?auto_171901 ?auto_171904 ) ) ( not ( = ?auto_171901 ?auto_171905 ) ) ( not ( = ?auto_171901 ?auto_171906 ) ) ( not ( = ?auto_171901 ?auto_171907 ) ) ( not ( = ?auto_171901 ?auto_171908 ) ) ( not ( = ?auto_171902 ?auto_171903 ) ) ( not ( = ?auto_171902 ?auto_171904 ) ) ( not ( = ?auto_171902 ?auto_171905 ) ) ( not ( = ?auto_171902 ?auto_171906 ) ) ( not ( = ?auto_171902 ?auto_171907 ) ) ( not ( = ?auto_171902 ?auto_171908 ) ) ( not ( = ?auto_171903 ?auto_171904 ) ) ( not ( = ?auto_171903 ?auto_171905 ) ) ( not ( = ?auto_171903 ?auto_171906 ) ) ( not ( = ?auto_171903 ?auto_171907 ) ) ( not ( = ?auto_171903 ?auto_171908 ) ) ( not ( = ?auto_171904 ?auto_171905 ) ) ( not ( = ?auto_171904 ?auto_171906 ) ) ( not ( = ?auto_171904 ?auto_171907 ) ) ( not ( = ?auto_171904 ?auto_171908 ) ) ( not ( = ?auto_171905 ?auto_171906 ) ) ( not ( = ?auto_171905 ?auto_171907 ) ) ( not ( = ?auto_171905 ?auto_171908 ) ) ( not ( = ?auto_171906 ?auto_171907 ) ) ( not ( = ?auto_171906 ?auto_171908 ) ) ( not ( = ?auto_171907 ?auto_171908 ) ) ( ON ?auto_171906 ?auto_171907 ) ( ON ?auto_171905 ?auto_171906 ) ( ON ?auto_171904 ?auto_171905 ) ( ON ?auto_171903 ?auto_171904 ) ( CLEAR ?auto_171901 ) ( ON ?auto_171902 ?auto_171903 ) ( CLEAR ?auto_171902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171896 ?auto_171897 ?auto_171898 ?auto_171899 ?auto_171900 ?auto_171901 ?auto_171902 )
      ( MAKE-12PILE ?auto_171896 ?auto_171897 ?auto_171898 ?auto_171899 ?auto_171900 ?auto_171901 ?auto_171902 ?auto_171903 ?auto_171904 ?auto_171905 ?auto_171906 ?auto_171907 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171921 - BLOCK
      ?auto_171922 - BLOCK
      ?auto_171923 - BLOCK
      ?auto_171924 - BLOCK
      ?auto_171925 - BLOCK
      ?auto_171926 - BLOCK
      ?auto_171927 - BLOCK
      ?auto_171928 - BLOCK
      ?auto_171929 - BLOCK
      ?auto_171930 - BLOCK
      ?auto_171931 - BLOCK
      ?auto_171932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171932 ) ( ON-TABLE ?auto_171921 ) ( ON ?auto_171922 ?auto_171921 ) ( ON ?auto_171923 ?auto_171922 ) ( ON ?auto_171924 ?auto_171923 ) ( ON ?auto_171925 ?auto_171924 ) ( ON ?auto_171926 ?auto_171925 ) ( not ( = ?auto_171921 ?auto_171922 ) ) ( not ( = ?auto_171921 ?auto_171923 ) ) ( not ( = ?auto_171921 ?auto_171924 ) ) ( not ( = ?auto_171921 ?auto_171925 ) ) ( not ( = ?auto_171921 ?auto_171926 ) ) ( not ( = ?auto_171921 ?auto_171927 ) ) ( not ( = ?auto_171921 ?auto_171928 ) ) ( not ( = ?auto_171921 ?auto_171929 ) ) ( not ( = ?auto_171921 ?auto_171930 ) ) ( not ( = ?auto_171921 ?auto_171931 ) ) ( not ( = ?auto_171921 ?auto_171932 ) ) ( not ( = ?auto_171922 ?auto_171923 ) ) ( not ( = ?auto_171922 ?auto_171924 ) ) ( not ( = ?auto_171922 ?auto_171925 ) ) ( not ( = ?auto_171922 ?auto_171926 ) ) ( not ( = ?auto_171922 ?auto_171927 ) ) ( not ( = ?auto_171922 ?auto_171928 ) ) ( not ( = ?auto_171922 ?auto_171929 ) ) ( not ( = ?auto_171922 ?auto_171930 ) ) ( not ( = ?auto_171922 ?auto_171931 ) ) ( not ( = ?auto_171922 ?auto_171932 ) ) ( not ( = ?auto_171923 ?auto_171924 ) ) ( not ( = ?auto_171923 ?auto_171925 ) ) ( not ( = ?auto_171923 ?auto_171926 ) ) ( not ( = ?auto_171923 ?auto_171927 ) ) ( not ( = ?auto_171923 ?auto_171928 ) ) ( not ( = ?auto_171923 ?auto_171929 ) ) ( not ( = ?auto_171923 ?auto_171930 ) ) ( not ( = ?auto_171923 ?auto_171931 ) ) ( not ( = ?auto_171923 ?auto_171932 ) ) ( not ( = ?auto_171924 ?auto_171925 ) ) ( not ( = ?auto_171924 ?auto_171926 ) ) ( not ( = ?auto_171924 ?auto_171927 ) ) ( not ( = ?auto_171924 ?auto_171928 ) ) ( not ( = ?auto_171924 ?auto_171929 ) ) ( not ( = ?auto_171924 ?auto_171930 ) ) ( not ( = ?auto_171924 ?auto_171931 ) ) ( not ( = ?auto_171924 ?auto_171932 ) ) ( not ( = ?auto_171925 ?auto_171926 ) ) ( not ( = ?auto_171925 ?auto_171927 ) ) ( not ( = ?auto_171925 ?auto_171928 ) ) ( not ( = ?auto_171925 ?auto_171929 ) ) ( not ( = ?auto_171925 ?auto_171930 ) ) ( not ( = ?auto_171925 ?auto_171931 ) ) ( not ( = ?auto_171925 ?auto_171932 ) ) ( not ( = ?auto_171926 ?auto_171927 ) ) ( not ( = ?auto_171926 ?auto_171928 ) ) ( not ( = ?auto_171926 ?auto_171929 ) ) ( not ( = ?auto_171926 ?auto_171930 ) ) ( not ( = ?auto_171926 ?auto_171931 ) ) ( not ( = ?auto_171926 ?auto_171932 ) ) ( not ( = ?auto_171927 ?auto_171928 ) ) ( not ( = ?auto_171927 ?auto_171929 ) ) ( not ( = ?auto_171927 ?auto_171930 ) ) ( not ( = ?auto_171927 ?auto_171931 ) ) ( not ( = ?auto_171927 ?auto_171932 ) ) ( not ( = ?auto_171928 ?auto_171929 ) ) ( not ( = ?auto_171928 ?auto_171930 ) ) ( not ( = ?auto_171928 ?auto_171931 ) ) ( not ( = ?auto_171928 ?auto_171932 ) ) ( not ( = ?auto_171929 ?auto_171930 ) ) ( not ( = ?auto_171929 ?auto_171931 ) ) ( not ( = ?auto_171929 ?auto_171932 ) ) ( not ( = ?auto_171930 ?auto_171931 ) ) ( not ( = ?auto_171930 ?auto_171932 ) ) ( not ( = ?auto_171931 ?auto_171932 ) ) ( ON ?auto_171931 ?auto_171932 ) ( ON ?auto_171930 ?auto_171931 ) ( ON ?auto_171929 ?auto_171930 ) ( ON ?auto_171928 ?auto_171929 ) ( CLEAR ?auto_171926 ) ( ON ?auto_171927 ?auto_171928 ) ( CLEAR ?auto_171927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171921 ?auto_171922 ?auto_171923 ?auto_171924 ?auto_171925 ?auto_171926 ?auto_171927 )
      ( MAKE-12PILE ?auto_171921 ?auto_171922 ?auto_171923 ?auto_171924 ?auto_171925 ?auto_171926 ?auto_171927 ?auto_171928 ?auto_171929 ?auto_171930 ?auto_171931 ?auto_171932 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171945 - BLOCK
      ?auto_171946 - BLOCK
      ?auto_171947 - BLOCK
      ?auto_171948 - BLOCK
      ?auto_171949 - BLOCK
      ?auto_171950 - BLOCK
      ?auto_171951 - BLOCK
      ?auto_171952 - BLOCK
      ?auto_171953 - BLOCK
      ?auto_171954 - BLOCK
      ?auto_171955 - BLOCK
      ?auto_171956 - BLOCK
    )
    :vars
    (
      ?auto_171957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171956 ?auto_171957 ) ( ON-TABLE ?auto_171945 ) ( ON ?auto_171946 ?auto_171945 ) ( ON ?auto_171947 ?auto_171946 ) ( ON ?auto_171948 ?auto_171947 ) ( ON ?auto_171949 ?auto_171948 ) ( not ( = ?auto_171945 ?auto_171946 ) ) ( not ( = ?auto_171945 ?auto_171947 ) ) ( not ( = ?auto_171945 ?auto_171948 ) ) ( not ( = ?auto_171945 ?auto_171949 ) ) ( not ( = ?auto_171945 ?auto_171950 ) ) ( not ( = ?auto_171945 ?auto_171951 ) ) ( not ( = ?auto_171945 ?auto_171952 ) ) ( not ( = ?auto_171945 ?auto_171953 ) ) ( not ( = ?auto_171945 ?auto_171954 ) ) ( not ( = ?auto_171945 ?auto_171955 ) ) ( not ( = ?auto_171945 ?auto_171956 ) ) ( not ( = ?auto_171945 ?auto_171957 ) ) ( not ( = ?auto_171946 ?auto_171947 ) ) ( not ( = ?auto_171946 ?auto_171948 ) ) ( not ( = ?auto_171946 ?auto_171949 ) ) ( not ( = ?auto_171946 ?auto_171950 ) ) ( not ( = ?auto_171946 ?auto_171951 ) ) ( not ( = ?auto_171946 ?auto_171952 ) ) ( not ( = ?auto_171946 ?auto_171953 ) ) ( not ( = ?auto_171946 ?auto_171954 ) ) ( not ( = ?auto_171946 ?auto_171955 ) ) ( not ( = ?auto_171946 ?auto_171956 ) ) ( not ( = ?auto_171946 ?auto_171957 ) ) ( not ( = ?auto_171947 ?auto_171948 ) ) ( not ( = ?auto_171947 ?auto_171949 ) ) ( not ( = ?auto_171947 ?auto_171950 ) ) ( not ( = ?auto_171947 ?auto_171951 ) ) ( not ( = ?auto_171947 ?auto_171952 ) ) ( not ( = ?auto_171947 ?auto_171953 ) ) ( not ( = ?auto_171947 ?auto_171954 ) ) ( not ( = ?auto_171947 ?auto_171955 ) ) ( not ( = ?auto_171947 ?auto_171956 ) ) ( not ( = ?auto_171947 ?auto_171957 ) ) ( not ( = ?auto_171948 ?auto_171949 ) ) ( not ( = ?auto_171948 ?auto_171950 ) ) ( not ( = ?auto_171948 ?auto_171951 ) ) ( not ( = ?auto_171948 ?auto_171952 ) ) ( not ( = ?auto_171948 ?auto_171953 ) ) ( not ( = ?auto_171948 ?auto_171954 ) ) ( not ( = ?auto_171948 ?auto_171955 ) ) ( not ( = ?auto_171948 ?auto_171956 ) ) ( not ( = ?auto_171948 ?auto_171957 ) ) ( not ( = ?auto_171949 ?auto_171950 ) ) ( not ( = ?auto_171949 ?auto_171951 ) ) ( not ( = ?auto_171949 ?auto_171952 ) ) ( not ( = ?auto_171949 ?auto_171953 ) ) ( not ( = ?auto_171949 ?auto_171954 ) ) ( not ( = ?auto_171949 ?auto_171955 ) ) ( not ( = ?auto_171949 ?auto_171956 ) ) ( not ( = ?auto_171949 ?auto_171957 ) ) ( not ( = ?auto_171950 ?auto_171951 ) ) ( not ( = ?auto_171950 ?auto_171952 ) ) ( not ( = ?auto_171950 ?auto_171953 ) ) ( not ( = ?auto_171950 ?auto_171954 ) ) ( not ( = ?auto_171950 ?auto_171955 ) ) ( not ( = ?auto_171950 ?auto_171956 ) ) ( not ( = ?auto_171950 ?auto_171957 ) ) ( not ( = ?auto_171951 ?auto_171952 ) ) ( not ( = ?auto_171951 ?auto_171953 ) ) ( not ( = ?auto_171951 ?auto_171954 ) ) ( not ( = ?auto_171951 ?auto_171955 ) ) ( not ( = ?auto_171951 ?auto_171956 ) ) ( not ( = ?auto_171951 ?auto_171957 ) ) ( not ( = ?auto_171952 ?auto_171953 ) ) ( not ( = ?auto_171952 ?auto_171954 ) ) ( not ( = ?auto_171952 ?auto_171955 ) ) ( not ( = ?auto_171952 ?auto_171956 ) ) ( not ( = ?auto_171952 ?auto_171957 ) ) ( not ( = ?auto_171953 ?auto_171954 ) ) ( not ( = ?auto_171953 ?auto_171955 ) ) ( not ( = ?auto_171953 ?auto_171956 ) ) ( not ( = ?auto_171953 ?auto_171957 ) ) ( not ( = ?auto_171954 ?auto_171955 ) ) ( not ( = ?auto_171954 ?auto_171956 ) ) ( not ( = ?auto_171954 ?auto_171957 ) ) ( not ( = ?auto_171955 ?auto_171956 ) ) ( not ( = ?auto_171955 ?auto_171957 ) ) ( not ( = ?auto_171956 ?auto_171957 ) ) ( ON ?auto_171955 ?auto_171956 ) ( ON ?auto_171954 ?auto_171955 ) ( ON ?auto_171953 ?auto_171954 ) ( ON ?auto_171952 ?auto_171953 ) ( ON ?auto_171951 ?auto_171952 ) ( CLEAR ?auto_171949 ) ( ON ?auto_171950 ?auto_171951 ) ( CLEAR ?auto_171950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171945 ?auto_171946 ?auto_171947 ?auto_171948 ?auto_171949 ?auto_171950 )
      ( MAKE-12PILE ?auto_171945 ?auto_171946 ?auto_171947 ?auto_171948 ?auto_171949 ?auto_171950 ?auto_171951 ?auto_171952 ?auto_171953 ?auto_171954 ?auto_171955 ?auto_171956 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171970 - BLOCK
      ?auto_171971 - BLOCK
      ?auto_171972 - BLOCK
      ?auto_171973 - BLOCK
      ?auto_171974 - BLOCK
      ?auto_171975 - BLOCK
      ?auto_171976 - BLOCK
      ?auto_171977 - BLOCK
      ?auto_171978 - BLOCK
      ?auto_171979 - BLOCK
      ?auto_171980 - BLOCK
      ?auto_171981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171981 ) ( ON-TABLE ?auto_171970 ) ( ON ?auto_171971 ?auto_171970 ) ( ON ?auto_171972 ?auto_171971 ) ( ON ?auto_171973 ?auto_171972 ) ( ON ?auto_171974 ?auto_171973 ) ( not ( = ?auto_171970 ?auto_171971 ) ) ( not ( = ?auto_171970 ?auto_171972 ) ) ( not ( = ?auto_171970 ?auto_171973 ) ) ( not ( = ?auto_171970 ?auto_171974 ) ) ( not ( = ?auto_171970 ?auto_171975 ) ) ( not ( = ?auto_171970 ?auto_171976 ) ) ( not ( = ?auto_171970 ?auto_171977 ) ) ( not ( = ?auto_171970 ?auto_171978 ) ) ( not ( = ?auto_171970 ?auto_171979 ) ) ( not ( = ?auto_171970 ?auto_171980 ) ) ( not ( = ?auto_171970 ?auto_171981 ) ) ( not ( = ?auto_171971 ?auto_171972 ) ) ( not ( = ?auto_171971 ?auto_171973 ) ) ( not ( = ?auto_171971 ?auto_171974 ) ) ( not ( = ?auto_171971 ?auto_171975 ) ) ( not ( = ?auto_171971 ?auto_171976 ) ) ( not ( = ?auto_171971 ?auto_171977 ) ) ( not ( = ?auto_171971 ?auto_171978 ) ) ( not ( = ?auto_171971 ?auto_171979 ) ) ( not ( = ?auto_171971 ?auto_171980 ) ) ( not ( = ?auto_171971 ?auto_171981 ) ) ( not ( = ?auto_171972 ?auto_171973 ) ) ( not ( = ?auto_171972 ?auto_171974 ) ) ( not ( = ?auto_171972 ?auto_171975 ) ) ( not ( = ?auto_171972 ?auto_171976 ) ) ( not ( = ?auto_171972 ?auto_171977 ) ) ( not ( = ?auto_171972 ?auto_171978 ) ) ( not ( = ?auto_171972 ?auto_171979 ) ) ( not ( = ?auto_171972 ?auto_171980 ) ) ( not ( = ?auto_171972 ?auto_171981 ) ) ( not ( = ?auto_171973 ?auto_171974 ) ) ( not ( = ?auto_171973 ?auto_171975 ) ) ( not ( = ?auto_171973 ?auto_171976 ) ) ( not ( = ?auto_171973 ?auto_171977 ) ) ( not ( = ?auto_171973 ?auto_171978 ) ) ( not ( = ?auto_171973 ?auto_171979 ) ) ( not ( = ?auto_171973 ?auto_171980 ) ) ( not ( = ?auto_171973 ?auto_171981 ) ) ( not ( = ?auto_171974 ?auto_171975 ) ) ( not ( = ?auto_171974 ?auto_171976 ) ) ( not ( = ?auto_171974 ?auto_171977 ) ) ( not ( = ?auto_171974 ?auto_171978 ) ) ( not ( = ?auto_171974 ?auto_171979 ) ) ( not ( = ?auto_171974 ?auto_171980 ) ) ( not ( = ?auto_171974 ?auto_171981 ) ) ( not ( = ?auto_171975 ?auto_171976 ) ) ( not ( = ?auto_171975 ?auto_171977 ) ) ( not ( = ?auto_171975 ?auto_171978 ) ) ( not ( = ?auto_171975 ?auto_171979 ) ) ( not ( = ?auto_171975 ?auto_171980 ) ) ( not ( = ?auto_171975 ?auto_171981 ) ) ( not ( = ?auto_171976 ?auto_171977 ) ) ( not ( = ?auto_171976 ?auto_171978 ) ) ( not ( = ?auto_171976 ?auto_171979 ) ) ( not ( = ?auto_171976 ?auto_171980 ) ) ( not ( = ?auto_171976 ?auto_171981 ) ) ( not ( = ?auto_171977 ?auto_171978 ) ) ( not ( = ?auto_171977 ?auto_171979 ) ) ( not ( = ?auto_171977 ?auto_171980 ) ) ( not ( = ?auto_171977 ?auto_171981 ) ) ( not ( = ?auto_171978 ?auto_171979 ) ) ( not ( = ?auto_171978 ?auto_171980 ) ) ( not ( = ?auto_171978 ?auto_171981 ) ) ( not ( = ?auto_171979 ?auto_171980 ) ) ( not ( = ?auto_171979 ?auto_171981 ) ) ( not ( = ?auto_171980 ?auto_171981 ) ) ( ON ?auto_171980 ?auto_171981 ) ( ON ?auto_171979 ?auto_171980 ) ( ON ?auto_171978 ?auto_171979 ) ( ON ?auto_171977 ?auto_171978 ) ( ON ?auto_171976 ?auto_171977 ) ( CLEAR ?auto_171974 ) ( ON ?auto_171975 ?auto_171976 ) ( CLEAR ?auto_171975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171970 ?auto_171971 ?auto_171972 ?auto_171973 ?auto_171974 ?auto_171975 )
      ( MAKE-12PILE ?auto_171970 ?auto_171971 ?auto_171972 ?auto_171973 ?auto_171974 ?auto_171975 ?auto_171976 ?auto_171977 ?auto_171978 ?auto_171979 ?auto_171980 ?auto_171981 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171994 - BLOCK
      ?auto_171995 - BLOCK
      ?auto_171996 - BLOCK
      ?auto_171997 - BLOCK
      ?auto_171998 - BLOCK
      ?auto_171999 - BLOCK
      ?auto_172000 - BLOCK
      ?auto_172001 - BLOCK
      ?auto_172002 - BLOCK
      ?auto_172003 - BLOCK
      ?auto_172004 - BLOCK
      ?auto_172005 - BLOCK
    )
    :vars
    (
      ?auto_172006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172005 ?auto_172006 ) ( ON-TABLE ?auto_171994 ) ( ON ?auto_171995 ?auto_171994 ) ( ON ?auto_171996 ?auto_171995 ) ( ON ?auto_171997 ?auto_171996 ) ( not ( = ?auto_171994 ?auto_171995 ) ) ( not ( = ?auto_171994 ?auto_171996 ) ) ( not ( = ?auto_171994 ?auto_171997 ) ) ( not ( = ?auto_171994 ?auto_171998 ) ) ( not ( = ?auto_171994 ?auto_171999 ) ) ( not ( = ?auto_171994 ?auto_172000 ) ) ( not ( = ?auto_171994 ?auto_172001 ) ) ( not ( = ?auto_171994 ?auto_172002 ) ) ( not ( = ?auto_171994 ?auto_172003 ) ) ( not ( = ?auto_171994 ?auto_172004 ) ) ( not ( = ?auto_171994 ?auto_172005 ) ) ( not ( = ?auto_171994 ?auto_172006 ) ) ( not ( = ?auto_171995 ?auto_171996 ) ) ( not ( = ?auto_171995 ?auto_171997 ) ) ( not ( = ?auto_171995 ?auto_171998 ) ) ( not ( = ?auto_171995 ?auto_171999 ) ) ( not ( = ?auto_171995 ?auto_172000 ) ) ( not ( = ?auto_171995 ?auto_172001 ) ) ( not ( = ?auto_171995 ?auto_172002 ) ) ( not ( = ?auto_171995 ?auto_172003 ) ) ( not ( = ?auto_171995 ?auto_172004 ) ) ( not ( = ?auto_171995 ?auto_172005 ) ) ( not ( = ?auto_171995 ?auto_172006 ) ) ( not ( = ?auto_171996 ?auto_171997 ) ) ( not ( = ?auto_171996 ?auto_171998 ) ) ( not ( = ?auto_171996 ?auto_171999 ) ) ( not ( = ?auto_171996 ?auto_172000 ) ) ( not ( = ?auto_171996 ?auto_172001 ) ) ( not ( = ?auto_171996 ?auto_172002 ) ) ( not ( = ?auto_171996 ?auto_172003 ) ) ( not ( = ?auto_171996 ?auto_172004 ) ) ( not ( = ?auto_171996 ?auto_172005 ) ) ( not ( = ?auto_171996 ?auto_172006 ) ) ( not ( = ?auto_171997 ?auto_171998 ) ) ( not ( = ?auto_171997 ?auto_171999 ) ) ( not ( = ?auto_171997 ?auto_172000 ) ) ( not ( = ?auto_171997 ?auto_172001 ) ) ( not ( = ?auto_171997 ?auto_172002 ) ) ( not ( = ?auto_171997 ?auto_172003 ) ) ( not ( = ?auto_171997 ?auto_172004 ) ) ( not ( = ?auto_171997 ?auto_172005 ) ) ( not ( = ?auto_171997 ?auto_172006 ) ) ( not ( = ?auto_171998 ?auto_171999 ) ) ( not ( = ?auto_171998 ?auto_172000 ) ) ( not ( = ?auto_171998 ?auto_172001 ) ) ( not ( = ?auto_171998 ?auto_172002 ) ) ( not ( = ?auto_171998 ?auto_172003 ) ) ( not ( = ?auto_171998 ?auto_172004 ) ) ( not ( = ?auto_171998 ?auto_172005 ) ) ( not ( = ?auto_171998 ?auto_172006 ) ) ( not ( = ?auto_171999 ?auto_172000 ) ) ( not ( = ?auto_171999 ?auto_172001 ) ) ( not ( = ?auto_171999 ?auto_172002 ) ) ( not ( = ?auto_171999 ?auto_172003 ) ) ( not ( = ?auto_171999 ?auto_172004 ) ) ( not ( = ?auto_171999 ?auto_172005 ) ) ( not ( = ?auto_171999 ?auto_172006 ) ) ( not ( = ?auto_172000 ?auto_172001 ) ) ( not ( = ?auto_172000 ?auto_172002 ) ) ( not ( = ?auto_172000 ?auto_172003 ) ) ( not ( = ?auto_172000 ?auto_172004 ) ) ( not ( = ?auto_172000 ?auto_172005 ) ) ( not ( = ?auto_172000 ?auto_172006 ) ) ( not ( = ?auto_172001 ?auto_172002 ) ) ( not ( = ?auto_172001 ?auto_172003 ) ) ( not ( = ?auto_172001 ?auto_172004 ) ) ( not ( = ?auto_172001 ?auto_172005 ) ) ( not ( = ?auto_172001 ?auto_172006 ) ) ( not ( = ?auto_172002 ?auto_172003 ) ) ( not ( = ?auto_172002 ?auto_172004 ) ) ( not ( = ?auto_172002 ?auto_172005 ) ) ( not ( = ?auto_172002 ?auto_172006 ) ) ( not ( = ?auto_172003 ?auto_172004 ) ) ( not ( = ?auto_172003 ?auto_172005 ) ) ( not ( = ?auto_172003 ?auto_172006 ) ) ( not ( = ?auto_172004 ?auto_172005 ) ) ( not ( = ?auto_172004 ?auto_172006 ) ) ( not ( = ?auto_172005 ?auto_172006 ) ) ( ON ?auto_172004 ?auto_172005 ) ( ON ?auto_172003 ?auto_172004 ) ( ON ?auto_172002 ?auto_172003 ) ( ON ?auto_172001 ?auto_172002 ) ( ON ?auto_172000 ?auto_172001 ) ( ON ?auto_171999 ?auto_172000 ) ( CLEAR ?auto_171997 ) ( ON ?auto_171998 ?auto_171999 ) ( CLEAR ?auto_171998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171994 ?auto_171995 ?auto_171996 ?auto_171997 ?auto_171998 )
      ( MAKE-12PILE ?auto_171994 ?auto_171995 ?auto_171996 ?auto_171997 ?auto_171998 ?auto_171999 ?auto_172000 ?auto_172001 ?auto_172002 ?auto_172003 ?auto_172004 ?auto_172005 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172019 - BLOCK
      ?auto_172020 - BLOCK
      ?auto_172021 - BLOCK
      ?auto_172022 - BLOCK
      ?auto_172023 - BLOCK
      ?auto_172024 - BLOCK
      ?auto_172025 - BLOCK
      ?auto_172026 - BLOCK
      ?auto_172027 - BLOCK
      ?auto_172028 - BLOCK
      ?auto_172029 - BLOCK
      ?auto_172030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172030 ) ( ON-TABLE ?auto_172019 ) ( ON ?auto_172020 ?auto_172019 ) ( ON ?auto_172021 ?auto_172020 ) ( ON ?auto_172022 ?auto_172021 ) ( not ( = ?auto_172019 ?auto_172020 ) ) ( not ( = ?auto_172019 ?auto_172021 ) ) ( not ( = ?auto_172019 ?auto_172022 ) ) ( not ( = ?auto_172019 ?auto_172023 ) ) ( not ( = ?auto_172019 ?auto_172024 ) ) ( not ( = ?auto_172019 ?auto_172025 ) ) ( not ( = ?auto_172019 ?auto_172026 ) ) ( not ( = ?auto_172019 ?auto_172027 ) ) ( not ( = ?auto_172019 ?auto_172028 ) ) ( not ( = ?auto_172019 ?auto_172029 ) ) ( not ( = ?auto_172019 ?auto_172030 ) ) ( not ( = ?auto_172020 ?auto_172021 ) ) ( not ( = ?auto_172020 ?auto_172022 ) ) ( not ( = ?auto_172020 ?auto_172023 ) ) ( not ( = ?auto_172020 ?auto_172024 ) ) ( not ( = ?auto_172020 ?auto_172025 ) ) ( not ( = ?auto_172020 ?auto_172026 ) ) ( not ( = ?auto_172020 ?auto_172027 ) ) ( not ( = ?auto_172020 ?auto_172028 ) ) ( not ( = ?auto_172020 ?auto_172029 ) ) ( not ( = ?auto_172020 ?auto_172030 ) ) ( not ( = ?auto_172021 ?auto_172022 ) ) ( not ( = ?auto_172021 ?auto_172023 ) ) ( not ( = ?auto_172021 ?auto_172024 ) ) ( not ( = ?auto_172021 ?auto_172025 ) ) ( not ( = ?auto_172021 ?auto_172026 ) ) ( not ( = ?auto_172021 ?auto_172027 ) ) ( not ( = ?auto_172021 ?auto_172028 ) ) ( not ( = ?auto_172021 ?auto_172029 ) ) ( not ( = ?auto_172021 ?auto_172030 ) ) ( not ( = ?auto_172022 ?auto_172023 ) ) ( not ( = ?auto_172022 ?auto_172024 ) ) ( not ( = ?auto_172022 ?auto_172025 ) ) ( not ( = ?auto_172022 ?auto_172026 ) ) ( not ( = ?auto_172022 ?auto_172027 ) ) ( not ( = ?auto_172022 ?auto_172028 ) ) ( not ( = ?auto_172022 ?auto_172029 ) ) ( not ( = ?auto_172022 ?auto_172030 ) ) ( not ( = ?auto_172023 ?auto_172024 ) ) ( not ( = ?auto_172023 ?auto_172025 ) ) ( not ( = ?auto_172023 ?auto_172026 ) ) ( not ( = ?auto_172023 ?auto_172027 ) ) ( not ( = ?auto_172023 ?auto_172028 ) ) ( not ( = ?auto_172023 ?auto_172029 ) ) ( not ( = ?auto_172023 ?auto_172030 ) ) ( not ( = ?auto_172024 ?auto_172025 ) ) ( not ( = ?auto_172024 ?auto_172026 ) ) ( not ( = ?auto_172024 ?auto_172027 ) ) ( not ( = ?auto_172024 ?auto_172028 ) ) ( not ( = ?auto_172024 ?auto_172029 ) ) ( not ( = ?auto_172024 ?auto_172030 ) ) ( not ( = ?auto_172025 ?auto_172026 ) ) ( not ( = ?auto_172025 ?auto_172027 ) ) ( not ( = ?auto_172025 ?auto_172028 ) ) ( not ( = ?auto_172025 ?auto_172029 ) ) ( not ( = ?auto_172025 ?auto_172030 ) ) ( not ( = ?auto_172026 ?auto_172027 ) ) ( not ( = ?auto_172026 ?auto_172028 ) ) ( not ( = ?auto_172026 ?auto_172029 ) ) ( not ( = ?auto_172026 ?auto_172030 ) ) ( not ( = ?auto_172027 ?auto_172028 ) ) ( not ( = ?auto_172027 ?auto_172029 ) ) ( not ( = ?auto_172027 ?auto_172030 ) ) ( not ( = ?auto_172028 ?auto_172029 ) ) ( not ( = ?auto_172028 ?auto_172030 ) ) ( not ( = ?auto_172029 ?auto_172030 ) ) ( ON ?auto_172029 ?auto_172030 ) ( ON ?auto_172028 ?auto_172029 ) ( ON ?auto_172027 ?auto_172028 ) ( ON ?auto_172026 ?auto_172027 ) ( ON ?auto_172025 ?auto_172026 ) ( ON ?auto_172024 ?auto_172025 ) ( CLEAR ?auto_172022 ) ( ON ?auto_172023 ?auto_172024 ) ( CLEAR ?auto_172023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172019 ?auto_172020 ?auto_172021 ?auto_172022 ?auto_172023 )
      ( MAKE-12PILE ?auto_172019 ?auto_172020 ?auto_172021 ?auto_172022 ?auto_172023 ?auto_172024 ?auto_172025 ?auto_172026 ?auto_172027 ?auto_172028 ?auto_172029 ?auto_172030 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172043 - BLOCK
      ?auto_172044 - BLOCK
      ?auto_172045 - BLOCK
      ?auto_172046 - BLOCK
      ?auto_172047 - BLOCK
      ?auto_172048 - BLOCK
      ?auto_172049 - BLOCK
      ?auto_172050 - BLOCK
      ?auto_172051 - BLOCK
      ?auto_172052 - BLOCK
      ?auto_172053 - BLOCK
      ?auto_172054 - BLOCK
    )
    :vars
    (
      ?auto_172055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172054 ?auto_172055 ) ( ON-TABLE ?auto_172043 ) ( ON ?auto_172044 ?auto_172043 ) ( ON ?auto_172045 ?auto_172044 ) ( not ( = ?auto_172043 ?auto_172044 ) ) ( not ( = ?auto_172043 ?auto_172045 ) ) ( not ( = ?auto_172043 ?auto_172046 ) ) ( not ( = ?auto_172043 ?auto_172047 ) ) ( not ( = ?auto_172043 ?auto_172048 ) ) ( not ( = ?auto_172043 ?auto_172049 ) ) ( not ( = ?auto_172043 ?auto_172050 ) ) ( not ( = ?auto_172043 ?auto_172051 ) ) ( not ( = ?auto_172043 ?auto_172052 ) ) ( not ( = ?auto_172043 ?auto_172053 ) ) ( not ( = ?auto_172043 ?auto_172054 ) ) ( not ( = ?auto_172043 ?auto_172055 ) ) ( not ( = ?auto_172044 ?auto_172045 ) ) ( not ( = ?auto_172044 ?auto_172046 ) ) ( not ( = ?auto_172044 ?auto_172047 ) ) ( not ( = ?auto_172044 ?auto_172048 ) ) ( not ( = ?auto_172044 ?auto_172049 ) ) ( not ( = ?auto_172044 ?auto_172050 ) ) ( not ( = ?auto_172044 ?auto_172051 ) ) ( not ( = ?auto_172044 ?auto_172052 ) ) ( not ( = ?auto_172044 ?auto_172053 ) ) ( not ( = ?auto_172044 ?auto_172054 ) ) ( not ( = ?auto_172044 ?auto_172055 ) ) ( not ( = ?auto_172045 ?auto_172046 ) ) ( not ( = ?auto_172045 ?auto_172047 ) ) ( not ( = ?auto_172045 ?auto_172048 ) ) ( not ( = ?auto_172045 ?auto_172049 ) ) ( not ( = ?auto_172045 ?auto_172050 ) ) ( not ( = ?auto_172045 ?auto_172051 ) ) ( not ( = ?auto_172045 ?auto_172052 ) ) ( not ( = ?auto_172045 ?auto_172053 ) ) ( not ( = ?auto_172045 ?auto_172054 ) ) ( not ( = ?auto_172045 ?auto_172055 ) ) ( not ( = ?auto_172046 ?auto_172047 ) ) ( not ( = ?auto_172046 ?auto_172048 ) ) ( not ( = ?auto_172046 ?auto_172049 ) ) ( not ( = ?auto_172046 ?auto_172050 ) ) ( not ( = ?auto_172046 ?auto_172051 ) ) ( not ( = ?auto_172046 ?auto_172052 ) ) ( not ( = ?auto_172046 ?auto_172053 ) ) ( not ( = ?auto_172046 ?auto_172054 ) ) ( not ( = ?auto_172046 ?auto_172055 ) ) ( not ( = ?auto_172047 ?auto_172048 ) ) ( not ( = ?auto_172047 ?auto_172049 ) ) ( not ( = ?auto_172047 ?auto_172050 ) ) ( not ( = ?auto_172047 ?auto_172051 ) ) ( not ( = ?auto_172047 ?auto_172052 ) ) ( not ( = ?auto_172047 ?auto_172053 ) ) ( not ( = ?auto_172047 ?auto_172054 ) ) ( not ( = ?auto_172047 ?auto_172055 ) ) ( not ( = ?auto_172048 ?auto_172049 ) ) ( not ( = ?auto_172048 ?auto_172050 ) ) ( not ( = ?auto_172048 ?auto_172051 ) ) ( not ( = ?auto_172048 ?auto_172052 ) ) ( not ( = ?auto_172048 ?auto_172053 ) ) ( not ( = ?auto_172048 ?auto_172054 ) ) ( not ( = ?auto_172048 ?auto_172055 ) ) ( not ( = ?auto_172049 ?auto_172050 ) ) ( not ( = ?auto_172049 ?auto_172051 ) ) ( not ( = ?auto_172049 ?auto_172052 ) ) ( not ( = ?auto_172049 ?auto_172053 ) ) ( not ( = ?auto_172049 ?auto_172054 ) ) ( not ( = ?auto_172049 ?auto_172055 ) ) ( not ( = ?auto_172050 ?auto_172051 ) ) ( not ( = ?auto_172050 ?auto_172052 ) ) ( not ( = ?auto_172050 ?auto_172053 ) ) ( not ( = ?auto_172050 ?auto_172054 ) ) ( not ( = ?auto_172050 ?auto_172055 ) ) ( not ( = ?auto_172051 ?auto_172052 ) ) ( not ( = ?auto_172051 ?auto_172053 ) ) ( not ( = ?auto_172051 ?auto_172054 ) ) ( not ( = ?auto_172051 ?auto_172055 ) ) ( not ( = ?auto_172052 ?auto_172053 ) ) ( not ( = ?auto_172052 ?auto_172054 ) ) ( not ( = ?auto_172052 ?auto_172055 ) ) ( not ( = ?auto_172053 ?auto_172054 ) ) ( not ( = ?auto_172053 ?auto_172055 ) ) ( not ( = ?auto_172054 ?auto_172055 ) ) ( ON ?auto_172053 ?auto_172054 ) ( ON ?auto_172052 ?auto_172053 ) ( ON ?auto_172051 ?auto_172052 ) ( ON ?auto_172050 ?auto_172051 ) ( ON ?auto_172049 ?auto_172050 ) ( ON ?auto_172048 ?auto_172049 ) ( ON ?auto_172047 ?auto_172048 ) ( CLEAR ?auto_172045 ) ( ON ?auto_172046 ?auto_172047 ) ( CLEAR ?auto_172046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172043 ?auto_172044 ?auto_172045 ?auto_172046 )
      ( MAKE-12PILE ?auto_172043 ?auto_172044 ?auto_172045 ?auto_172046 ?auto_172047 ?auto_172048 ?auto_172049 ?auto_172050 ?auto_172051 ?auto_172052 ?auto_172053 ?auto_172054 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172068 - BLOCK
      ?auto_172069 - BLOCK
      ?auto_172070 - BLOCK
      ?auto_172071 - BLOCK
      ?auto_172072 - BLOCK
      ?auto_172073 - BLOCK
      ?auto_172074 - BLOCK
      ?auto_172075 - BLOCK
      ?auto_172076 - BLOCK
      ?auto_172077 - BLOCK
      ?auto_172078 - BLOCK
      ?auto_172079 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172079 ) ( ON-TABLE ?auto_172068 ) ( ON ?auto_172069 ?auto_172068 ) ( ON ?auto_172070 ?auto_172069 ) ( not ( = ?auto_172068 ?auto_172069 ) ) ( not ( = ?auto_172068 ?auto_172070 ) ) ( not ( = ?auto_172068 ?auto_172071 ) ) ( not ( = ?auto_172068 ?auto_172072 ) ) ( not ( = ?auto_172068 ?auto_172073 ) ) ( not ( = ?auto_172068 ?auto_172074 ) ) ( not ( = ?auto_172068 ?auto_172075 ) ) ( not ( = ?auto_172068 ?auto_172076 ) ) ( not ( = ?auto_172068 ?auto_172077 ) ) ( not ( = ?auto_172068 ?auto_172078 ) ) ( not ( = ?auto_172068 ?auto_172079 ) ) ( not ( = ?auto_172069 ?auto_172070 ) ) ( not ( = ?auto_172069 ?auto_172071 ) ) ( not ( = ?auto_172069 ?auto_172072 ) ) ( not ( = ?auto_172069 ?auto_172073 ) ) ( not ( = ?auto_172069 ?auto_172074 ) ) ( not ( = ?auto_172069 ?auto_172075 ) ) ( not ( = ?auto_172069 ?auto_172076 ) ) ( not ( = ?auto_172069 ?auto_172077 ) ) ( not ( = ?auto_172069 ?auto_172078 ) ) ( not ( = ?auto_172069 ?auto_172079 ) ) ( not ( = ?auto_172070 ?auto_172071 ) ) ( not ( = ?auto_172070 ?auto_172072 ) ) ( not ( = ?auto_172070 ?auto_172073 ) ) ( not ( = ?auto_172070 ?auto_172074 ) ) ( not ( = ?auto_172070 ?auto_172075 ) ) ( not ( = ?auto_172070 ?auto_172076 ) ) ( not ( = ?auto_172070 ?auto_172077 ) ) ( not ( = ?auto_172070 ?auto_172078 ) ) ( not ( = ?auto_172070 ?auto_172079 ) ) ( not ( = ?auto_172071 ?auto_172072 ) ) ( not ( = ?auto_172071 ?auto_172073 ) ) ( not ( = ?auto_172071 ?auto_172074 ) ) ( not ( = ?auto_172071 ?auto_172075 ) ) ( not ( = ?auto_172071 ?auto_172076 ) ) ( not ( = ?auto_172071 ?auto_172077 ) ) ( not ( = ?auto_172071 ?auto_172078 ) ) ( not ( = ?auto_172071 ?auto_172079 ) ) ( not ( = ?auto_172072 ?auto_172073 ) ) ( not ( = ?auto_172072 ?auto_172074 ) ) ( not ( = ?auto_172072 ?auto_172075 ) ) ( not ( = ?auto_172072 ?auto_172076 ) ) ( not ( = ?auto_172072 ?auto_172077 ) ) ( not ( = ?auto_172072 ?auto_172078 ) ) ( not ( = ?auto_172072 ?auto_172079 ) ) ( not ( = ?auto_172073 ?auto_172074 ) ) ( not ( = ?auto_172073 ?auto_172075 ) ) ( not ( = ?auto_172073 ?auto_172076 ) ) ( not ( = ?auto_172073 ?auto_172077 ) ) ( not ( = ?auto_172073 ?auto_172078 ) ) ( not ( = ?auto_172073 ?auto_172079 ) ) ( not ( = ?auto_172074 ?auto_172075 ) ) ( not ( = ?auto_172074 ?auto_172076 ) ) ( not ( = ?auto_172074 ?auto_172077 ) ) ( not ( = ?auto_172074 ?auto_172078 ) ) ( not ( = ?auto_172074 ?auto_172079 ) ) ( not ( = ?auto_172075 ?auto_172076 ) ) ( not ( = ?auto_172075 ?auto_172077 ) ) ( not ( = ?auto_172075 ?auto_172078 ) ) ( not ( = ?auto_172075 ?auto_172079 ) ) ( not ( = ?auto_172076 ?auto_172077 ) ) ( not ( = ?auto_172076 ?auto_172078 ) ) ( not ( = ?auto_172076 ?auto_172079 ) ) ( not ( = ?auto_172077 ?auto_172078 ) ) ( not ( = ?auto_172077 ?auto_172079 ) ) ( not ( = ?auto_172078 ?auto_172079 ) ) ( ON ?auto_172078 ?auto_172079 ) ( ON ?auto_172077 ?auto_172078 ) ( ON ?auto_172076 ?auto_172077 ) ( ON ?auto_172075 ?auto_172076 ) ( ON ?auto_172074 ?auto_172075 ) ( ON ?auto_172073 ?auto_172074 ) ( ON ?auto_172072 ?auto_172073 ) ( CLEAR ?auto_172070 ) ( ON ?auto_172071 ?auto_172072 ) ( CLEAR ?auto_172071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172068 ?auto_172069 ?auto_172070 ?auto_172071 )
      ( MAKE-12PILE ?auto_172068 ?auto_172069 ?auto_172070 ?auto_172071 ?auto_172072 ?auto_172073 ?auto_172074 ?auto_172075 ?auto_172076 ?auto_172077 ?auto_172078 ?auto_172079 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172092 - BLOCK
      ?auto_172093 - BLOCK
      ?auto_172094 - BLOCK
      ?auto_172095 - BLOCK
      ?auto_172096 - BLOCK
      ?auto_172097 - BLOCK
      ?auto_172098 - BLOCK
      ?auto_172099 - BLOCK
      ?auto_172100 - BLOCK
      ?auto_172101 - BLOCK
      ?auto_172102 - BLOCK
      ?auto_172103 - BLOCK
    )
    :vars
    (
      ?auto_172104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172103 ?auto_172104 ) ( ON-TABLE ?auto_172092 ) ( ON ?auto_172093 ?auto_172092 ) ( not ( = ?auto_172092 ?auto_172093 ) ) ( not ( = ?auto_172092 ?auto_172094 ) ) ( not ( = ?auto_172092 ?auto_172095 ) ) ( not ( = ?auto_172092 ?auto_172096 ) ) ( not ( = ?auto_172092 ?auto_172097 ) ) ( not ( = ?auto_172092 ?auto_172098 ) ) ( not ( = ?auto_172092 ?auto_172099 ) ) ( not ( = ?auto_172092 ?auto_172100 ) ) ( not ( = ?auto_172092 ?auto_172101 ) ) ( not ( = ?auto_172092 ?auto_172102 ) ) ( not ( = ?auto_172092 ?auto_172103 ) ) ( not ( = ?auto_172092 ?auto_172104 ) ) ( not ( = ?auto_172093 ?auto_172094 ) ) ( not ( = ?auto_172093 ?auto_172095 ) ) ( not ( = ?auto_172093 ?auto_172096 ) ) ( not ( = ?auto_172093 ?auto_172097 ) ) ( not ( = ?auto_172093 ?auto_172098 ) ) ( not ( = ?auto_172093 ?auto_172099 ) ) ( not ( = ?auto_172093 ?auto_172100 ) ) ( not ( = ?auto_172093 ?auto_172101 ) ) ( not ( = ?auto_172093 ?auto_172102 ) ) ( not ( = ?auto_172093 ?auto_172103 ) ) ( not ( = ?auto_172093 ?auto_172104 ) ) ( not ( = ?auto_172094 ?auto_172095 ) ) ( not ( = ?auto_172094 ?auto_172096 ) ) ( not ( = ?auto_172094 ?auto_172097 ) ) ( not ( = ?auto_172094 ?auto_172098 ) ) ( not ( = ?auto_172094 ?auto_172099 ) ) ( not ( = ?auto_172094 ?auto_172100 ) ) ( not ( = ?auto_172094 ?auto_172101 ) ) ( not ( = ?auto_172094 ?auto_172102 ) ) ( not ( = ?auto_172094 ?auto_172103 ) ) ( not ( = ?auto_172094 ?auto_172104 ) ) ( not ( = ?auto_172095 ?auto_172096 ) ) ( not ( = ?auto_172095 ?auto_172097 ) ) ( not ( = ?auto_172095 ?auto_172098 ) ) ( not ( = ?auto_172095 ?auto_172099 ) ) ( not ( = ?auto_172095 ?auto_172100 ) ) ( not ( = ?auto_172095 ?auto_172101 ) ) ( not ( = ?auto_172095 ?auto_172102 ) ) ( not ( = ?auto_172095 ?auto_172103 ) ) ( not ( = ?auto_172095 ?auto_172104 ) ) ( not ( = ?auto_172096 ?auto_172097 ) ) ( not ( = ?auto_172096 ?auto_172098 ) ) ( not ( = ?auto_172096 ?auto_172099 ) ) ( not ( = ?auto_172096 ?auto_172100 ) ) ( not ( = ?auto_172096 ?auto_172101 ) ) ( not ( = ?auto_172096 ?auto_172102 ) ) ( not ( = ?auto_172096 ?auto_172103 ) ) ( not ( = ?auto_172096 ?auto_172104 ) ) ( not ( = ?auto_172097 ?auto_172098 ) ) ( not ( = ?auto_172097 ?auto_172099 ) ) ( not ( = ?auto_172097 ?auto_172100 ) ) ( not ( = ?auto_172097 ?auto_172101 ) ) ( not ( = ?auto_172097 ?auto_172102 ) ) ( not ( = ?auto_172097 ?auto_172103 ) ) ( not ( = ?auto_172097 ?auto_172104 ) ) ( not ( = ?auto_172098 ?auto_172099 ) ) ( not ( = ?auto_172098 ?auto_172100 ) ) ( not ( = ?auto_172098 ?auto_172101 ) ) ( not ( = ?auto_172098 ?auto_172102 ) ) ( not ( = ?auto_172098 ?auto_172103 ) ) ( not ( = ?auto_172098 ?auto_172104 ) ) ( not ( = ?auto_172099 ?auto_172100 ) ) ( not ( = ?auto_172099 ?auto_172101 ) ) ( not ( = ?auto_172099 ?auto_172102 ) ) ( not ( = ?auto_172099 ?auto_172103 ) ) ( not ( = ?auto_172099 ?auto_172104 ) ) ( not ( = ?auto_172100 ?auto_172101 ) ) ( not ( = ?auto_172100 ?auto_172102 ) ) ( not ( = ?auto_172100 ?auto_172103 ) ) ( not ( = ?auto_172100 ?auto_172104 ) ) ( not ( = ?auto_172101 ?auto_172102 ) ) ( not ( = ?auto_172101 ?auto_172103 ) ) ( not ( = ?auto_172101 ?auto_172104 ) ) ( not ( = ?auto_172102 ?auto_172103 ) ) ( not ( = ?auto_172102 ?auto_172104 ) ) ( not ( = ?auto_172103 ?auto_172104 ) ) ( ON ?auto_172102 ?auto_172103 ) ( ON ?auto_172101 ?auto_172102 ) ( ON ?auto_172100 ?auto_172101 ) ( ON ?auto_172099 ?auto_172100 ) ( ON ?auto_172098 ?auto_172099 ) ( ON ?auto_172097 ?auto_172098 ) ( ON ?auto_172096 ?auto_172097 ) ( ON ?auto_172095 ?auto_172096 ) ( CLEAR ?auto_172093 ) ( ON ?auto_172094 ?auto_172095 ) ( CLEAR ?auto_172094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172092 ?auto_172093 ?auto_172094 )
      ( MAKE-12PILE ?auto_172092 ?auto_172093 ?auto_172094 ?auto_172095 ?auto_172096 ?auto_172097 ?auto_172098 ?auto_172099 ?auto_172100 ?auto_172101 ?auto_172102 ?auto_172103 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172117 - BLOCK
      ?auto_172118 - BLOCK
      ?auto_172119 - BLOCK
      ?auto_172120 - BLOCK
      ?auto_172121 - BLOCK
      ?auto_172122 - BLOCK
      ?auto_172123 - BLOCK
      ?auto_172124 - BLOCK
      ?auto_172125 - BLOCK
      ?auto_172126 - BLOCK
      ?auto_172127 - BLOCK
      ?auto_172128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172128 ) ( ON-TABLE ?auto_172117 ) ( ON ?auto_172118 ?auto_172117 ) ( not ( = ?auto_172117 ?auto_172118 ) ) ( not ( = ?auto_172117 ?auto_172119 ) ) ( not ( = ?auto_172117 ?auto_172120 ) ) ( not ( = ?auto_172117 ?auto_172121 ) ) ( not ( = ?auto_172117 ?auto_172122 ) ) ( not ( = ?auto_172117 ?auto_172123 ) ) ( not ( = ?auto_172117 ?auto_172124 ) ) ( not ( = ?auto_172117 ?auto_172125 ) ) ( not ( = ?auto_172117 ?auto_172126 ) ) ( not ( = ?auto_172117 ?auto_172127 ) ) ( not ( = ?auto_172117 ?auto_172128 ) ) ( not ( = ?auto_172118 ?auto_172119 ) ) ( not ( = ?auto_172118 ?auto_172120 ) ) ( not ( = ?auto_172118 ?auto_172121 ) ) ( not ( = ?auto_172118 ?auto_172122 ) ) ( not ( = ?auto_172118 ?auto_172123 ) ) ( not ( = ?auto_172118 ?auto_172124 ) ) ( not ( = ?auto_172118 ?auto_172125 ) ) ( not ( = ?auto_172118 ?auto_172126 ) ) ( not ( = ?auto_172118 ?auto_172127 ) ) ( not ( = ?auto_172118 ?auto_172128 ) ) ( not ( = ?auto_172119 ?auto_172120 ) ) ( not ( = ?auto_172119 ?auto_172121 ) ) ( not ( = ?auto_172119 ?auto_172122 ) ) ( not ( = ?auto_172119 ?auto_172123 ) ) ( not ( = ?auto_172119 ?auto_172124 ) ) ( not ( = ?auto_172119 ?auto_172125 ) ) ( not ( = ?auto_172119 ?auto_172126 ) ) ( not ( = ?auto_172119 ?auto_172127 ) ) ( not ( = ?auto_172119 ?auto_172128 ) ) ( not ( = ?auto_172120 ?auto_172121 ) ) ( not ( = ?auto_172120 ?auto_172122 ) ) ( not ( = ?auto_172120 ?auto_172123 ) ) ( not ( = ?auto_172120 ?auto_172124 ) ) ( not ( = ?auto_172120 ?auto_172125 ) ) ( not ( = ?auto_172120 ?auto_172126 ) ) ( not ( = ?auto_172120 ?auto_172127 ) ) ( not ( = ?auto_172120 ?auto_172128 ) ) ( not ( = ?auto_172121 ?auto_172122 ) ) ( not ( = ?auto_172121 ?auto_172123 ) ) ( not ( = ?auto_172121 ?auto_172124 ) ) ( not ( = ?auto_172121 ?auto_172125 ) ) ( not ( = ?auto_172121 ?auto_172126 ) ) ( not ( = ?auto_172121 ?auto_172127 ) ) ( not ( = ?auto_172121 ?auto_172128 ) ) ( not ( = ?auto_172122 ?auto_172123 ) ) ( not ( = ?auto_172122 ?auto_172124 ) ) ( not ( = ?auto_172122 ?auto_172125 ) ) ( not ( = ?auto_172122 ?auto_172126 ) ) ( not ( = ?auto_172122 ?auto_172127 ) ) ( not ( = ?auto_172122 ?auto_172128 ) ) ( not ( = ?auto_172123 ?auto_172124 ) ) ( not ( = ?auto_172123 ?auto_172125 ) ) ( not ( = ?auto_172123 ?auto_172126 ) ) ( not ( = ?auto_172123 ?auto_172127 ) ) ( not ( = ?auto_172123 ?auto_172128 ) ) ( not ( = ?auto_172124 ?auto_172125 ) ) ( not ( = ?auto_172124 ?auto_172126 ) ) ( not ( = ?auto_172124 ?auto_172127 ) ) ( not ( = ?auto_172124 ?auto_172128 ) ) ( not ( = ?auto_172125 ?auto_172126 ) ) ( not ( = ?auto_172125 ?auto_172127 ) ) ( not ( = ?auto_172125 ?auto_172128 ) ) ( not ( = ?auto_172126 ?auto_172127 ) ) ( not ( = ?auto_172126 ?auto_172128 ) ) ( not ( = ?auto_172127 ?auto_172128 ) ) ( ON ?auto_172127 ?auto_172128 ) ( ON ?auto_172126 ?auto_172127 ) ( ON ?auto_172125 ?auto_172126 ) ( ON ?auto_172124 ?auto_172125 ) ( ON ?auto_172123 ?auto_172124 ) ( ON ?auto_172122 ?auto_172123 ) ( ON ?auto_172121 ?auto_172122 ) ( ON ?auto_172120 ?auto_172121 ) ( CLEAR ?auto_172118 ) ( ON ?auto_172119 ?auto_172120 ) ( CLEAR ?auto_172119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172117 ?auto_172118 ?auto_172119 )
      ( MAKE-12PILE ?auto_172117 ?auto_172118 ?auto_172119 ?auto_172120 ?auto_172121 ?auto_172122 ?auto_172123 ?auto_172124 ?auto_172125 ?auto_172126 ?auto_172127 ?auto_172128 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172141 - BLOCK
      ?auto_172142 - BLOCK
      ?auto_172143 - BLOCK
      ?auto_172144 - BLOCK
      ?auto_172145 - BLOCK
      ?auto_172146 - BLOCK
      ?auto_172147 - BLOCK
      ?auto_172148 - BLOCK
      ?auto_172149 - BLOCK
      ?auto_172150 - BLOCK
      ?auto_172151 - BLOCK
      ?auto_172152 - BLOCK
    )
    :vars
    (
      ?auto_172153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172152 ?auto_172153 ) ( ON-TABLE ?auto_172141 ) ( not ( = ?auto_172141 ?auto_172142 ) ) ( not ( = ?auto_172141 ?auto_172143 ) ) ( not ( = ?auto_172141 ?auto_172144 ) ) ( not ( = ?auto_172141 ?auto_172145 ) ) ( not ( = ?auto_172141 ?auto_172146 ) ) ( not ( = ?auto_172141 ?auto_172147 ) ) ( not ( = ?auto_172141 ?auto_172148 ) ) ( not ( = ?auto_172141 ?auto_172149 ) ) ( not ( = ?auto_172141 ?auto_172150 ) ) ( not ( = ?auto_172141 ?auto_172151 ) ) ( not ( = ?auto_172141 ?auto_172152 ) ) ( not ( = ?auto_172141 ?auto_172153 ) ) ( not ( = ?auto_172142 ?auto_172143 ) ) ( not ( = ?auto_172142 ?auto_172144 ) ) ( not ( = ?auto_172142 ?auto_172145 ) ) ( not ( = ?auto_172142 ?auto_172146 ) ) ( not ( = ?auto_172142 ?auto_172147 ) ) ( not ( = ?auto_172142 ?auto_172148 ) ) ( not ( = ?auto_172142 ?auto_172149 ) ) ( not ( = ?auto_172142 ?auto_172150 ) ) ( not ( = ?auto_172142 ?auto_172151 ) ) ( not ( = ?auto_172142 ?auto_172152 ) ) ( not ( = ?auto_172142 ?auto_172153 ) ) ( not ( = ?auto_172143 ?auto_172144 ) ) ( not ( = ?auto_172143 ?auto_172145 ) ) ( not ( = ?auto_172143 ?auto_172146 ) ) ( not ( = ?auto_172143 ?auto_172147 ) ) ( not ( = ?auto_172143 ?auto_172148 ) ) ( not ( = ?auto_172143 ?auto_172149 ) ) ( not ( = ?auto_172143 ?auto_172150 ) ) ( not ( = ?auto_172143 ?auto_172151 ) ) ( not ( = ?auto_172143 ?auto_172152 ) ) ( not ( = ?auto_172143 ?auto_172153 ) ) ( not ( = ?auto_172144 ?auto_172145 ) ) ( not ( = ?auto_172144 ?auto_172146 ) ) ( not ( = ?auto_172144 ?auto_172147 ) ) ( not ( = ?auto_172144 ?auto_172148 ) ) ( not ( = ?auto_172144 ?auto_172149 ) ) ( not ( = ?auto_172144 ?auto_172150 ) ) ( not ( = ?auto_172144 ?auto_172151 ) ) ( not ( = ?auto_172144 ?auto_172152 ) ) ( not ( = ?auto_172144 ?auto_172153 ) ) ( not ( = ?auto_172145 ?auto_172146 ) ) ( not ( = ?auto_172145 ?auto_172147 ) ) ( not ( = ?auto_172145 ?auto_172148 ) ) ( not ( = ?auto_172145 ?auto_172149 ) ) ( not ( = ?auto_172145 ?auto_172150 ) ) ( not ( = ?auto_172145 ?auto_172151 ) ) ( not ( = ?auto_172145 ?auto_172152 ) ) ( not ( = ?auto_172145 ?auto_172153 ) ) ( not ( = ?auto_172146 ?auto_172147 ) ) ( not ( = ?auto_172146 ?auto_172148 ) ) ( not ( = ?auto_172146 ?auto_172149 ) ) ( not ( = ?auto_172146 ?auto_172150 ) ) ( not ( = ?auto_172146 ?auto_172151 ) ) ( not ( = ?auto_172146 ?auto_172152 ) ) ( not ( = ?auto_172146 ?auto_172153 ) ) ( not ( = ?auto_172147 ?auto_172148 ) ) ( not ( = ?auto_172147 ?auto_172149 ) ) ( not ( = ?auto_172147 ?auto_172150 ) ) ( not ( = ?auto_172147 ?auto_172151 ) ) ( not ( = ?auto_172147 ?auto_172152 ) ) ( not ( = ?auto_172147 ?auto_172153 ) ) ( not ( = ?auto_172148 ?auto_172149 ) ) ( not ( = ?auto_172148 ?auto_172150 ) ) ( not ( = ?auto_172148 ?auto_172151 ) ) ( not ( = ?auto_172148 ?auto_172152 ) ) ( not ( = ?auto_172148 ?auto_172153 ) ) ( not ( = ?auto_172149 ?auto_172150 ) ) ( not ( = ?auto_172149 ?auto_172151 ) ) ( not ( = ?auto_172149 ?auto_172152 ) ) ( not ( = ?auto_172149 ?auto_172153 ) ) ( not ( = ?auto_172150 ?auto_172151 ) ) ( not ( = ?auto_172150 ?auto_172152 ) ) ( not ( = ?auto_172150 ?auto_172153 ) ) ( not ( = ?auto_172151 ?auto_172152 ) ) ( not ( = ?auto_172151 ?auto_172153 ) ) ( not ( = ?auto_172152 ?auto_172153 ) ) ( ON ?auto_172151 ?auto_172152 ) ( ON ?auto_172150 ?auto_172151 ) ( ON ?auto_172149 ?auto_172150 ) ( ON ?auto_172148 ?auto_172149 ) ( ON ?auto_172147 ?auto_172148 ) ( ON ?auto_172146 ?auto_172147 ) ( ON ?auto_172145 ?auto_172146 ) ( ON ?auto_172144 ?auto_172145 ) ( ON ?auto_172143 ?auto_172144 ) ( CLEAR ?auto_172141 ) ( ON ?auto_172142 ?auto_172143 ) ( CLEAR ?auto_172142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172141 ?auto_172142 )
      ( MAKE-12PILE ?auto_172141 ?auto_172142 ?auto_172143 ?auto_172144 ?auto_172145 ?auto_172146 ?auto_172147 ?auto_172148 ?auto_172149 ?auto_172150 ?auto_172151 ?auto_172152 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172166 - BLOCK
      ?auto_172167 - BLOCK
      ?auto_172168 - BLOCK
      ?auto_172169 - BLOCK
      ?auto_172170 - BLOCK
      ?auto_172171 - BLOCK
      ?auto_172172 - BLOCK
      ?auto_172173 - BLOCK
      ?auto_172174 - BLOCK
      ?auto_172175 - BLOCK
      ?auto_172176 - BLOCK
      ?auto_172177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172177 ) ( ON-TABLE ?auto_172166 ) ( not ( = ?auto_172166 ?auto_172167 ) ) ( not ( = ?auto_172166 ?auto_172168 ) ) ( not ( = ?auto_172166 ?auto_172169 ) ) ( not ( = ?auto_172166 ?auto_172170 ) ) ( not ( = ?auto_172166 ?auto_172171 ) ) ( not ( = ?auto_172166 ?auto_172172 ) ) ( not ( = ?auto_172166 ?auto_172173 ) ) ( not ( = ?auto_172166 ?auto_172174 ) ) ( not ( = ?auto_172166 ?auto_172175 ) ) ( not ( = ?auto_172166 ?auto_172176 ) ) ( not ( = ?auto_172166 ?auto_172177 ) ) ( not ( = ?auto_172167 ?auto_172168 ) ) ( not ( = ?auto_172167 ?auto_172169 ) ) ( not ( = ?auto_172167 ?auto_172170 ) ) ( not ( = ?auto_172167 ?auto_172171 ) ) ( not ( = ?auto_172167 ?auto_172172 ) ) ( not ( = ?auto_172167 ?auto_172173 ) ) ( not ( = ?auto_172167 ?auto_172174 ) ) ( not ( = ?auto_172167 ?auto_172175 ) ) ( not ( = ?auto_172167 ?auto_172176 ) ) ( not ( = ?auto_172167 ?auto_172177 ) ) ( not ( = ?auto_172168 ?auto_172169 ) ) ( not ( = ?auto_172168 ?auto_172170 ) ) ( not ( = ?auto_172168 ?auto_172171 ) ) ( not ( = ?auto_172168 ?auto_172172 ) ) ( not ( = ?auto_172168 ?auto_172173 ) ) ( not ( = ?auto_172168 ?auto_172174 ) ) ( not ( = ?auto_172168 ?auto_172175 ) ) ( not ( = ?auto_172168 ?auto_172176 ) ) ( not ( = ?auto_172168 ?auto_172177 ) ) ( not ( = ?auto_172169 ?auto_172170 ) ) ( not ( = ?auto_172169 ?auto_172171 ) ) ( not ( = ?auto_172169 ?auto_172172 ) ) ( not ( = ?auto_172169 ?auto_172173 ) ) ( not ( = ?auto_172169 ?auto_172174 ) ) ( not ( = ?auto_172169 ?auto_172175 ) ) ( not ( = ?auto_172169 ?auto_172176 ) ) ( not ( = ?auto_172169 ?auto_172177 ) ) ( not ( = ?auto_172170 ?auto_172171 ) ) ( not ( = ?auto_172170 ?auto_172172 ) ) ( not ( = ?auto_172170 ?auto_172173 ) ) ( not ( = ?auto_172170 ?auto_172174 ) ) ( not ( = ?auto_172170 ?auto_172175 ) ) ( not ( = ?auto_172170 ?auto_172176 ) ) ( not ( = ?auto_172170 ?auto_172177 ) ) ( not ( = ?auto_172171 ?auto_172172 ) ) ( not ( = ?auto_172171 ?auto_172173 ) ) ( not ( = ?auto_172171 ?auto_172174 ) ) ( not ( = ?auto_172171 ?auto_172175 ) ) ( not ( = ?auto_172171 ?auto_172176 ) ) ( not ( = ?auto_172171 ?auto_172177 ) ) ( not ( = ?auto_172172 ?auto_172173 ) ) ( not ( = ?auto_172172 ?auto_172174 ) ) ( not ( = ?auto_172172 ?auto_172175 ) ) ( not ( = ?auto_172172 ?auto_172176 ) ) ( not ( = ?auto_172172 ?auto_172177 ) ) ( not ( = ?auto_172173 ?auto_172174 ) ) ( not ( = ?auto_172173 ?auto_172175 ) ) ( not ( = ?auto_172173 ?auto_172176 ) ) ( not ( = ?auto_172173 ?auto_172177 ) ) ( not ( = ?auto_172174 ?auto_172175 ) ) ( not ( = ?auto_172174 ?auto_172176 ) ) ( not ( = ?auto_172174 ?auto_172177 ) ) ( not ( = ?auto_172175 ?auto_172176 ) ) ( not ( = ?auto_172175 ?auto_172177 ) ) ( not ( = ?auto_172176 ?auto_172177 ) ) ( ON ?auto_172176 ?auto_172177 ) ( ON ?auto_172175 ?auto_172176 ) ( ON ?auto_172174 ?auto_172175 ) ( ON ?auto_172173 ?auto_172174 ) ( ON ?auto_172172 ?auto_172173 ) ( ON ?auto_172171 ?auto_172172 ) ( ON ?auto_172170 ?auto_172171 ) ( ON ?auto_172169 ?auto_172170 ) ( ON ?auto_172168 ?auto_172169 ) ( CLEAR ?auto_172166 ) ( ON ?auto_172167 ?auto_172168 ) ( CLEAR ?auto_172167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172166 ?auto_172167 )
      ( MAKE-12PILE ?auto_172166 ?auto_172167 ?auto_172168 ?auto_172169 ?auto_172170 ?auto_172171 ?auto_172172 ?auto_172173 ?auto_172174 ?auto_172175 ?auto_172176 ?auto_172177 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172190 - BLOCK
      ?auto_172191 - BLOCK
      ?auto_172192 - BLOCK
      ?auto_172193 - BLOCK
      ?auto_172194 - BLOCK
      ?auto_172195 - BLOCK
      ?auto_172196 - BLOCK
      ?auto_172197 - BLOCK
      ?auto_172198 - BLOCK
      ?auto_172199 - BLOCK
      ?auto_172200 - BLOCK
      ?auto_172201 - BLOCK
    )
    :vars
    (
      ?auto_172202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172201 ?auto_172202 ) ( not ( = ?auto_172190 ?auto_172191 ) ) ( not ( = ?auto_172190 ?auto_172192 ) ) ( not ( = ?auto_172190 ?auto_172193 ) ) ( not ( = ?auto_172190 ?auto_172194 ) ) ( not ( = ?auto_172190 ?auto_172195 ) ) ( not ( = ?auto_172190 ?auto_172196 ) ) ( not ( = ?auto_172190 ?auto_172197 ) ) ( not ( = ?auto_172190 ?auto_172198 ) ) ( not ( = ?auto_172190 ?auto_172199 ) ) ( not ( = ?auto_172190 ?auto_172200 ) ) ( not ( = ?auto_172190 ?auto_172201 ) ) ( not ( = ?auto_172190 ?auto_172202 ) ) ( not ( = ?auto_172191 ?auto_172192 ) ) ( not ( = ?auto_172191 ?auto_172193 ) ) ( not ( = ?auto_172191 ?auto_172194 ) ) ( not ( = ?auto_172191 ?auto_172195 ) ) ( not ( = ?auto_172191 ?auto_172196 ) ) ( not ( = ?auto_172191 ?auto_172197 ) ) ( not ( = ?auto_172191 ?auto_172198 ) ) ( not ( = ?auto_172191 ?auto_172199 ) ) ( not ( = ?auto_172191 ?auto_172200 ) ) ( not ( = ?auto_172191 ?auto_172201 ) ) ( not ( = ?auto_172191 ?auto_172202 ) ) ( not ( = ?auto_172192 ?auto_172193 ) ) ( not ( = ?auto_172192 ?auto_172194 ) ) ( not ( = ?auto_172192 ?auto_172195 ) ) ( not ( = ?auto_172192 ?auto_172196 ) ) ( not ( = ?auto_172192 ?auto_172197 ) ) ( not ( = ?auto_172192 ?auto_172198 ) ) ( not ( = ?auto_172192 ?auto_172199 ) ) ( not ( = ?auto_172192 ?auto_172200 ) ) ( not ( = ?auto_172192 ?auto_172201 ) ) ( not ( = ?auto_172192 ?auto_172202 ) ) ( not ( = ?auto_172193 ?auto_172194 ) ) ( not ( = ?auto_172193 ?auto_172195 ) ) ( not ( = ?auto_172193 ?auto_172196 ) ) ( not ( = ?auto_172193 ?auto_172197 ) ) ( not ( = ?auto_172193 ?auto_172198 ) ) ( not ( = ?auto_172193 ?auto_172199 ) ) ( not ( = ?auto_172193 ?auto_172200 ) ) ( not ( = ?auto_172193 ?auto_172201 ) ) ( not ( = ?auto_172193 ?auto_172202 ) ) ( not ( = ?auto_172194 ?auto_172195 ) ) ( not ( = ?auto_172194 ?auto_172196 ) ) ( not ( = ?auto_172194 ?auto_172197 ) ) ( not ( = ?auto_172194 ?auto_172198 ) ) ( not ( = ?auto_172194 ?auto_172199 ) ) ( not ( = ?auto_172194 ?auto_172200 ) ) ( not ( = ?auto_172194 ?auto_172201 ) ) ( not ( = ?auto_172194 ?auto_172202 ) ) ( not ( = ?auto_172195 ?auto_172196 ) ) ( not ( = ?auto_172195 ?auto_172197 ) ) ( not ( = ?auto_172195 ?auto_172198 ) ) ( not ( = ?auto_172195 ?auto_172199 ) ) ( not ( = ?auto_172195 ?auto_172200 ) ) ( not ( = ?auto_172195 ?auto_172201 ) ) ( not ( = ?auto_172195 ?auto_172202 ) ) ( not ( = ?auto_172196 ?auto_172197 ) ) ( not ( = ?auto_172196 ?auto_172198 ) ) ( not ( = ?auto_172196 ?auto_172199 ) ) ( not ( = ?auto_172196 ?auto_172200 ) ) ( not ( = ?auto_172196 ?auto_172201 ) ) ( not ( = ?auto_172196 ?auto_172202 ) ) ( not ( = ?auto_172197 ?auto_172198 ) ) ( not ( = ?auto_172197 ?auto_172199 ) ) ( not ( = ?auto_172197 ?auto_172200 ) ) ( not ( = ?auto_172197 ?auto_172201 ) ) ( not ( = ?auto_172197 ?auto_172202 ) ) ( not ( = ?auto_172198 ?auto_172199 ) ) ( not ( = ?auto_172198 ?auto_172200 ) ) ( not ( = ?auto_172198 ?auto_172201 ) ) ( not ( = ?auto_172198 ?auto_172202 ) ) ( not ( = ?auto_172199 ?auto_172200 ) ) ( not ( = ?auto_172199 ?auto_172201 ) ) ( not ( = ?auto_172199 ?auto_172202 ) ) ( not ( = ?auto_172200 ?auto_172201 ) ) ( not ( = ?auto_172200 ?auto_172202 ) ) ( not ( = ?auto_172201 ?auto_172202 ) ) ( ON ?auto_172200 ?auto_172201 ) ( ON ?auto_172199 ?auto_172200 ) ( ON ?auto_172198 ?auto_172199 ) ( ON ?auto_172197 ?auto_172198 ) ( ON ?auto_172196 ?auto_172197 ) ( ON ?auto_172195 ?auto_172196 ) ( ON ?auto_172194 ?auto_172195 ) ( ON ?auto_172193 ?auto_172194 ) ( ON ?auto_172192 ?auto_172193 ) ( ON ?auto_172191 ?auto_172192 ) ( ON ?auto_172190 ?auto_172191 ) ( CLEAR ?auto_172190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172190 )
      ( MAKE-12PILE ?auto_172190 ?auto_172191 ?auto_172192 ?auto_172193 ?auto_172194 ?auto_172195 ?auto_172196 ?auto_172197 ?auto_172198 ?auto_172199 ?auto_172200 ?auto_172201 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172215 - BLOCK
      ?auto_172216 - BLOCK
      ?auto_172217 - BLOCK
      ?auto_172218 - BLOCK
      ?auto_172219 - BLOCK
      ?auto_172220 - BLOCK
      ?auto_172221 - BLOCK
      ?auto_172222 - BLOCK
      ?auto_172223 - BLOCK
      ?auto_172224 - BLOCK
      ?auto_172225 - BLOCK
      ?auto_172226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172226 ) ( not ( = ?auto_172215 ?auto_172216 ) ) ( not ( = ?auto_172215 ?auto_172217 ) ) ( not ( = ?auto_172215 ?auto_172218 ) ) ( not ( = ?auto_172215 ?auto_172219 ) ) ( not ( = ?auto_172215 ?auto_172220 ) ) ( not ( = ?auto_172215 ?auto_172221 ) ) ( not ( = ?auto_172215 ?auto_172222 ) ) ( not ( = ?auto_172215 ?auto_172223 ) ) ( not ( = ?auto_172215 ?auto_172224 ) ) ( not ( = ?auto_172215 ?auto_172225 ) ) ( not ( = ?auto_172215 ?auto_172226 ) ) ( not ( = ?auto_172216 ?auto_172217 ) ) ( not ( = ?auto_172216 ?auto_172218 ) ) ( not ( = ?auto_172216 ?auto_172219 ) ) ( not ( = ?auto_172216 ?auto_172220 ) ) ( not ( = ?auto_172216 ?auto_172221 ) ) ( not ( = ?auto_172216 ?auto_172222 ) ) ( not ( = ?auto_172216 ?auto_172223 ) ) ( not ( = ?auto_172216 ?auto_172224 ) ) ( not ( = ?auto_172216 ?auto_172225 ) ) ( not ( = ?auto_172216 ?auto_172226 ) ) ( not ( = ?auto_172217 ?auto_172218 ) ) ( not ( = ?auto_172217 ?auto_172219 ) ) ( not ( = ?auto_172217 ?auto_172220 ) ) ( not ( = ?auto_172217 ?auto_172221 ) ) ( not ( = ?auto_172217 ?auto_172222 ) ) ( not ( = ?auto_172217 ?auto_172223 ) ) ( not ( = ?auto_172217 ?auto_172224 ) ) ( not ( = ?auto_172217 ?auto_172225 ) ) ( not ( = ?auto_172217 ?auto_172226 ) ) ( not ( = ?auto_172218 ?auto_172219 ) ) ( not ( = ?auto_172218 ?auto_172220 ) ) ( not ( = ?auto_172218 ?auto_172221 ) ) ( not ( = ?auto_172218 ?auto_172222 ) ) ( not ( = ?auto_172218 ?auto_172223 ) ) ( not ( = ?auto_172218 ?auto_172224 ) ) ( not ( = ?auto_172218 ?auto_172225 ) ) ( not ( = ?auto_172218 ?auto_172226 ) ) ( not ( = ?auto_172219 ?auto_172220 ) ) ( not ( = ?auto_172219 ?auto_172221 ) ) ( not ( = ?auto_172219 ?auto_172222 ) ) ( not ( = ?auto_172219 ?auto_172223 ) ) ( not ( = ?auto_172219 ?auto_172224 ) ) ( not ( = ?auto_172219 ?auto_172225 ) ) ( not ( = ?auto_172219 ?auto_172226 ) ) ( not ( = ?auto_172220 ?auto_172221 ) ) ( not ( = ?auto_172220 ?auto_172222 ) ) ( not ( = ?auto_172220 ?auto_172223 ) ) ( not ( = ?auto_172220 ?auto_172224 ) ) ( not ( = ?auto_172220 ?auto_172225 ) ) ( not ( = ?auto_172220 ?auto_172226 ) ) ( not ( = ?auto_172221 ?auto_172222 ) ) ( not ( = ?auto_172221 ?auto_172223 ) ) ( not ( = ?auto_172221 ?auto_172224 ) ) ( not ( = ?auto_172221 ?auto_172225 ) ) ( not ( = ?auto_172221 ?auto_172226 ) ) ( not ( = ?auto_172222 ?auto_172223 ) ) ( not ( = ?auto_172222 ?auto_172224 ) ) ( not ( = ?auto_172222 ?auto_172225 ) ) ( not ( = ?auto_172222 ?auto_172226 ) ) ( not ( = ?auto_172223 ?auto_172224 ) ) ( not ( = ?auto_172223 ?auto_172225 ) ) ( not ( = ?auto_172223 ?auto_172226 ) ) ( not ( = ?auto_172224 ?auto_172225 ) ) ( not ( = ?auto_172224 ?auto_172226 ) ) ( not ( = ?auto_172225 ?auto_172226 ) ) ( ON ?auto_172225 ?auto_172226 ) ( ON ?auto_172224 ?auto_172225 ) ( ON ?auto_172223 ?auto_172224 ) ( ON ?auto_172222 ?auto_172223 ) ( ON ?auto_172221 ?auto_172222 ) ( ON ?auto_172220 ?auto_172221 ) ( ON ?auto_172219 ?auto_172220 ) ( ON ?auto_172218 ?auto_172219 ) ( ON ?auto_172217 ?auto_172218 ) ( ON ?auto_172216 ?auto_172217 ) ( ON ?auto_172215 ?auto_172216 ) ( CLEAR ?auto_172215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172215 )
      ( MAKE-12PILE ?auto_172215 ?auto_172216 ?auto_172217 ?auto_172218 ?auto_172219 ?auto_172220 ?auto_172221 ?auto_172222 ?auto_172223 ?auto_172224 ?auto_172225 ?auto_172226 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172239 - BLOCK
      ?auto_172240 - BLOCK
      ?auto_172241 - BLOCK
      ?auto_172242 - BLOCK
      ?auto_172243 - BLOCK
      ?auto_172244 - BLOCK
      ?auto_172245 - BLOCK
      ?auto_172246 - BLOCK
      ?auto_172247 - BLOCK
      ?auto_172248 - BLOCK
      ?auto_172249 - BLOCK
      ?auto_172250 - BLOCK
    )
    :vars
    (
      ?auto_172251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172239 ?auto_172240 ) ) ( not ( = ?auto_172239 ?auto_172241 ) ) ( not ( = ?auto_172239 ?auto_172242 ) ) ( not ( = ?auto_172239 ?auto_172243 ) ) ( not ( = ?auto_172239 ?auto_172244 ) ) ( not ( = ?auto_172239 ?auto_172245 ) ) ( not ( = ?auto_172239 ?auto_172246 ) ) ( not ( = ?auto_172239 ?auto_172247 ) ) ( not ( = ?auto_172239 ?auto_172248 ) ) ( not ( = ?auto_172239 ?auto_172249 ) ) ( not ( = ?auto_172239 ?auto_172250 ) ) ( not ( = ?auto_172240 ?auto_172241 ) ) ( not ( = ?auto_172240 ?auto_172242 ) ) ( not ( = ?auto_172240 ?auto_172243 ) ) ( not ( = ?auto_172240 ?auto_172244 ) ) ( not ( = ?auto_172240 ?auto_172245 ) ) ( not ( = ?auto_172240 ?auto_172246 ) ) ( not ( = ?auto_172240 ?auto_172247 ) ) ( not ( = ?auto_172240 ?auto_172248 ) ) ( not ( = ?auto_172240 ?auto_172249 ) ) ( not ( = ?auto_172240 ?auto_172250 ) ) ( not ( = ?auto_172241 ?auto_172242 ) ) ( not ( = ?auto_172241 ?auto_172243 ) ) ( not ( = ?auto_172241 ?auto_172244 ) ) ( not ( = ?auto_172241 ?auto_172245 ) ) ( not ( = ?auto_172241 ?auto_172246 ) ) ( not ( = ?auto_172241 ?auto_172247 ) ) ( not ( = ?auto_172241 ?auto_172248 ) ) ( not ( = ?auto_172241 ?auto_172249 ) ) ( not ( = ?auto_172241 ?auto_172250 ) ) ( not ( = ?auto_172242 ?auto_172243 ) ) ( not ( = ?auto_172242 ?auto_172244 ) ) ( not ( = ?auto_172242 ?auto_172245 ) ) ( not ( = ?auto_172242 ?auto_172246 ) ) ( not ( = ?auto_172242 ?auto_172247 ) ) ( not ( = ?auto_172242 ?auto_172248 ) ) ( not ( = ?auto_172242 ?auto_172249 ) ) ( not ( = ?auto_172242 ?auto_172250 ) ) ( not ( = ?auto_172243 ?auto_172244 ) ) ( not ( = ?auto_172243 ?auto_172245 ) ) ( not ( = ?auto_172243 ?auto_172246 ) ) ( not ( = ?auto_172243 ?auto_172247 ) ) ( not ( = ?auto_172243 ?auto_172248 ) ) ( not ( = ?auto_172243 ?auto_172249 ) ) ( not ( = ?auto_172243 ?auto_172250 ) ) ( not ( = ?auto_172244 ?auto_172245 ) ) ( not ( = ?auto_172244 ?auto_172246 ) ) ( not ( = ?auto_172244 ?auto_172247 ) ) ( not ( = ?auto_172244 ?auto_172248 ) ) ( not ( = ?auto_172244 ?auto_172249 ) ) ( not ( = ?auto_172244 ?auto_172250 ) ) ( not ( = ?auto_172245 ?auto_172246 ) ) ( not ( = ?auto_172245 ?auto_172247 ) ) ( not ( = ?auto_172245 ?auto_172248 ) ) ( not ( = ?auto_172245 ?auto_172249 ) ) ( not ( = ?auto_172245 ?auto_172250 ) ) ( not ( = ?auto_172246 ?auto_172247 ) ) ( not ( = ?auto_172246 ?auto_172248 ) ) ( not ( = ?auto_172246 ?auto_172249 ) ) ( not ( = ?auto_172246 ?auto_172250 ) ) ( not ( = ?auto_172247 ?auto_172248 ) ) ( not ( = ?auto_172247 ?auto_172249 ) ) ( not ( = ?auto_172247 ?auto_172250 ) ) ( not ( = ?auto_172248 ?auto_172249 ) ) ( not ( = ?auto_172248 ?auto_172250 ) ) ( not ( = ?auto_172249 ?auto_172250 ) ) ( ON ?auto_172239 ?auto_172251 ) ( not ( = ?auto_172250 ?auto_172251 ) ) ( not ( = ?auto_172249 ?auto_172251 ) ) ( not ( = ?auto_172248 ?auto_172251 ) ) ( not ( = ?auto_172247 ?auto_172251 ) ) ( not ( = ?auto_172246 ?auto_172251 ) ) ( not ( = ?auto_172245 ?auto_172251 ) ) ( not ( = ?auto_172244 ?auto_172251 ) ) ( not ( = ?auto_172243 ?auto_172251 ) ) ( not ( = ?auto_172242 ?auto_172251 ) ) ( not ( = ?auto_172241 ?auto_172251 ) ) ( not ( = ?auto_172240 ?auto_172251 ) ) ( not ( = ?auto_172239 ?auto_172251 ) ) ( ON ?auto_172240 ?auto_172239 ) ( ON ?auto_172241 ?auto_172240 ) ( ON ?auto_172242 ?auto_172241 ) ( ON ?auto_172243 ?auto_172242 ) ( ON ?auto_172244 ?auto_172243 ) ( ON ?auto_172245 ?auto_172244 ) ( ON ?auto_172246 ?auto_172245 ) ( ON ?auto_172247 ?auto_172246 ) ( ON ?auto_172248 ?auto_172247 ) ( ON ?auto_172249 ?auto_172248 ) ( ON ?auto_172250 ?auto_172249 ) ( CLEAR ?auto_172250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_172250 ?auto_172249 ?auto_172248 ?auto_172247 ?auto_172246 ?auto_172245 ?auto_172244 ?auto_172243 ?auto_172242 ?auto_172241 ?auto_172240 ?auto_172239 )
      ( MAKE-12PILE ?auto_172239 ?auto_172240 ?auto_172241 ?auto_172242 ?auto_172243 ?auto_172244 ?auto_172245 ?auto_172246 ?auto_172247 ?auto_172248 ?auto_172249 ?auto_172250 ) )
  )

)

