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
      ?auto_158408 - BLOCK
    )
    :vars
    (
      ?auto_158409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158408 ?auto_158409 ) ( CLEAR ?auto_158408 ) ( HAND-EMPTY ) ( not ( = ?auto_158408 ?auto_158409 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158408 ?auto_158409 )
      ( !PUTDOWN ?auto_158408 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158415 - BLOCK
      ?auto_158416 - BLOCK
    )
    :vars
    (
      ?auto_158417 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158415 ) ( ON ?auto_158416 ?auto_158417 ) ( CLEAR ?auto_158416 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158415 ) ( not ( = ?auto_158415 ?auto_158416 ) ) ( not ( = ?auto_158415 ?auto_158417 ) ) ( not ( = ?auto_158416 ?auto_158417 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158416 ?auto_158417 )
      ( !STACK ?auto_158416 ?auto_158415 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158425 - BLOCK
      ?auto_158426 - BLOCK
    )
    :vars
    (
      ?auto_158427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158426 ?auto_158427 ) ( not ( = ?auto_158425 ?auto_158426 ) ) ( not ( = ?auto_158425 ?auto_158427 ) ) ( not ( = ?auto_158426 ?auto_158427 ) ) ( ON ?auto_158425 ?auto_158426 ) ( CLEAR ?auto_158425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158425 )
      ( MAKE-2PILE ?auto_158425 ?auto_158426 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158436 - BLOCK
      ?auto_158437 - BLOCK
      ?auto_158438 - BLOCK
    )
    :vars
    (
      ?auto_158439 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158437 ) ( ON ?auto_158438 ?auto_158439 ) ( CLEAR ?auto_158438 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158436 ) ( ON ?auto_158437 ?auto_158436 ) ( not ( = ?auto_158436 ?auto_158437 ) ) ( not ( = ?auto_158436 ?auto_158438 ) ) ( not ( = ?auto_158436 ?auto_158439 ) ) ( not ( = ?auto_158437 ?auto_158438 ) ) ( not ( = ?auto_158437 ?auto_158439 ) ) ( not ( = ?auto_158438 ?auto_158439 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158438 ?auto_158439 )
      ( !STACK ?auto_158438 ?auto_158437 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158450 - BLOCK
      ?auto_158451 - BLOCK
      ?auto_158452 - BLOCK
    )
    :vars
    (
      ?auto_158453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158452 ?auto_158453 ) ( ON-TABLE ?auto_158450 ) ( not ( = ?auto_158450 ?auto_158451 ) ) ( not ( = ?auto_158450 ?auto_158452 ) ) ( not ( = ?auto_158450 ?auto_158453 ) ) ( not ( = ?auto_158451 ?auto_158452 ) ) ( not ( = ?auto_158451 ?auto_158453 ) ) ( not ( = ?auto_158452 ?auto_158453 ) ) ( CLEAR ?auto_158450 ) ( ON ?auto_158451 ?auto_158452 ) ( CLEAR ?auto_158451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158450 ?auto_158451 )
      ( MAKE-3PILE ?auto_158450 ?auto_158451 ?auto_158452 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158464 - BLOCK
      ?auto_158465 - BLOCK
      ?auto_158466 - BLOCK
    )
    :vars
    (
      ?auto_158467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158466 ?auto_158467 ) ( not ( = ?auto_158464 ?auto_158465 ) ) ( not ( = ?auto_158464 ?auto_158466 ) ) ( not ( = ?auto_158464 ?auto_158467 ) ) ( not ( = ?auto_158465 ?auto_158466 ) ) ( not ( = ?auto_158465 ?auto_158467 ) ) ( not ( = ?auto_158466 ?auto_158467 ) ) ( ON ?auto_158465 ?auto_158466 ) ( ON ?auto_158464 ?auto_158465 ) ( CLEAR ?auto_158464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158464 )
      ( MAKE-3PILE ?auto_158464 ?auto_158465 ?auto_158466 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158479 - BLOCK
      ?auto_158480 - BLOCK
      ?auto_158481 - BLOCK
      ?auto_158482 - BLOCK
    )
    :vars
    (
      ?auto_158483 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158481 ) ( ON ?auto_158482 ?auto_158483 ) ( CLEAR ?auto_158482 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158479 ) ( ON ?auto_158480 ?auto_158479 ) ( ON ?auto_158481 ?auto_158480 ) ( not ( = ?auto_158479 ?auto_158480 ) ) ( not ( = ?auto_158479 ?auto_158481 ) ) ( not ( = ?auto_158479 ?auto_158482 ) ) ( not ( = ?auto_158479 ?auto_158483 ) ) ( not ( = ?auto_158480 ?auto_158481 ) ) ( not ( = ?auto_158480 ?auto_158482 ) ) ( not ( = ?auto_158480 ?auto_158483 ) ) ( not ( = ?auto_158481 ?auto_158482 ) ) ( not ( = ?auto_158481 ?auto_158483 ) ) ( not ( = ?auto_158482 ?auto_158483 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158482 ?auto_158483 )
      ( !STACK ?auto_158482 ?auto_158481 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158497 - BLOCK
      ?auto_158498 - BLOCK
      ?auto_158499 - BLOCK
      ?auto_158500 - BLOCK
    )
    :vars
    (
      ?auto_158501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158500 ?auto_158501 ) ( ON-TABLE ?auto_158497 ) ( ON ?auto_158498 ?auto_158497 ) ( not ( = ?auto_158497 ?auto_158498 ) ) ( not ( = ?auto_158497 ?auto_158499 ) ) ( not ( = ?auto_158497 ?auto_158500 ) ) ( not ( = ?auto_158497 ?auto_158501 ) ) ( not ( = ?auto_158498 ?auto_158499 ) ) ( not ( = ?auto_158498 ?auto_158500 ) ) ( not ( = ?auto_158498 ?auto_158501 ) ) ( not ( = ?auto_158499 ?auto_158500 ) ) ( not ( = ?auto_158499 ?auto_158501 ) ) ( not ( = ?auto_158500 ?auto_158501 ) ) ( CLEAR ?auto_158498 ) ( ON ?auto_158499 ?auto_158500 ) ( CLEAR ?auto_158499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158497 ?auto_158498 ?auto_158499 )
      ( MAKE-4PILE ?auto_158497 ?auto_158498 ?auto_158499 ?auto_158500 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158515 - BLOCK
      ?auto_158516 - BLOCK
      ?auto_158517 - BLOCK
      ?auto_158518 - BLOCK
    )
    :vars
    (
      ?auto_158519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158518 ?auto_158519 ) ( ON-TABLE ?auto_158515 ) ( not ( = ?auto_158515 ?auto_158516 ) ) ( not ( = ?auto_158515 ?auto_158517 ) ) ( not ( = ?auto_158515 ?auto_158518 ) ) ( not ( = ?auto_158515 ?auto_158519 ) ) ( not ( = ?auto_158516 ?auto_158517 ) ) ( not ( = ?auto_158516 ?auto_158518 ) ) ( not ( = ?auto_158516 ?auto_158519 ) ) ( not ( = ?auto_158517 ?auto_158518 ) ) ( not ( = ?auto_158517 ?auto_158519 ) ) ( not ( = ?auto_158518 ?auto_158519 ) ) ( ON ?auto_158517 ?auto_158518 ) ( CLEAR ?auto_158515 ) ( ON ?auto_158516 ?auto_158517 ) ( CLEAR ?auto_158516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158515 ?auto_158516 )
      ( MAKE-4PILE ?auto_158515 ?auto_158516 ?auto_158517 ?auto_158518 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158533 - BLOCK
      ?auto_158534 - BLOCK
      ?auto_158535 - BLOCK
      ?auto_158536 - BLOCK
    )
    :vars
    (
      ?auto_158537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158536 ?auto_158537 ) ( not ( = ?auto_158533 ?auto_158534 ) ) ( not ( = ?auto_158533 ?auto_158535 ) ) ( not ( = ?auto_158533 ?auto_158536 ) ) ( not ( = ?auto_158533 ?auto_158537 ) ) ( not ( = ?auto_158534 ?auto_158535 ) ) ( not ( = ?auto_158534 ?auto_158536 ) ) ( not ( = ?auto_158534 ?auto_158537 ) ) ( not ( = ?auto_158535 ?auto_158536 ) ) ( not ( = ?auto_158535 ?auto_158537 ) ) ( not ( = ?auto_158536 ?auto_158537 ) ) ( ON ?auto_158535 ?auto_158536 ) ( ON ?auto_158534 ?auto_158535 ) ( ON ?auto_158533 ?auto_158534 ) ( CLEAR ?auto_158533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158533 )
      ( MAKE-4PILE ?auto_158533 ?auto_158534 ?auto_158535 ?auto_158536 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158552 - BLOCK
      ?auto_158553 - BLOCK
      ?auto_158554 - BLOCK
      ?auto_158555 - BLOCK
      ?auto_158556 - BLOCK
    )
    :vars
    (
      ?auto_158557 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158555 ) ( ON ?auto_158556 ?auto_158557 ) ( CLEAR ?auto_158556 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158552 ) ( ON ?auto_158553 ?auto_158552 ) ( ON ?auto_158554 ?auto_158553 ) ( ON ?auto_158555 ?auto_158554 ) ( not ( = ?auto_158552 ?auto_158553 ) ) ( not ( = ?auto_158552 ?auto_158554 ) ) ( not ( = ?auto_158552 ?auto_158555 ) ) ( not ( = ?auto_158552 ?auto_158556 ) ) ( not ( = ?auto_158552 ?auto_158557 ) ) ( not ( = ?auto_158553 ?auto_158554 ) ) ( not ( = ?auto_158553 ?auto_158555 ) ) ( not ( = ?auto_158553 ?auto_158556 ) ) ( not ( = ?auto_158553 ?auto_158557 ) ) ( not ( = ?auto_158554 ?auto_158555 ) ) ( not ( = ?auto_158554 ?auto_158556 ) ) ( not ( = ?auto_158554 ?auto_158557 ) ) ( not ( = ?auto_158555 ?auto_158556 ) ) ( not ( = ?auto_158555 ?auto_158557 ) ) ( not ( = ?auto_158556 ?auto_158557 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158556 ?auto_158557 )
      ( !STACK ?auto_158556 ?auto_158555 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158574 - BLOCK
      ?auto_158575 - BLOCK
      ?auto_158576 - BLOCK
      ?auto_158577 - BLOCK
      ?auto_158578 - BLOCK
    )
    :vars
    (
      ?auto_158579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158578 ?auto_158579 ) ( ON-TABLE ?auto_158574 ) ( ON ?auto_158575 ?auto_158574 ) ( ON ?auto_158576 ?auto_158575 ) ( not ( = ?auto_158574 ?auto_158575 ) ) ( not ( = ?auto_158574 ?auto_158576 ) ) ( not ( = ?auto_158574 ?auto_158577 ) ) ( not ( = ?auto_158574 ?auto_158578 ) ) ( not ( = ?auto_158574 ?auto_158579 ) ) ( not ( = ?auto_158575 ?auto_158576 ) ) ( not ( = ?auto_158575 ?auto_158577 ) ) ( not ( = ?auto_158575 ?auto_158578 ) ) ( not ( = ?auto_158575 ?auto_158579 ) ) ( not ( = ?auto_158576 ?auto_158577 ) ) ( not ( = ?auto_158576 ?auto_158578 ) ) ( not ( = ?auto_158576 ?auto_158579 ) ) ( not ( = ?auto_158577 ?auto_158578 ) ) ( not ( = ?auto_158577 ?auto_158579 ) ) ( not ( = ?auto_158578 ?auto_158579 ) ) ( CLEAR ?auto_158576 ) ( ON ?auto_158577 ?auto_158578 ) ( CLEAR ?auto_158577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158574 ?auto_158575 ?auto_158576 ?auto_158577 )
      ( MAKE-5PILE ?auto_158574 ?auto_158575 ?auto_158576 ?auto_158577 ?auto_158578 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158596 - BLOCK
      ?auto_158597 - BLOCK
      ?auto_158598 - BLOCK
      ?auto_158599 - BLOCK
      ?auto_158600 - BLOCK
    )
    :vars
    (
      ?auto_158601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158600 ?auto_158601 ) ( ON-TABLE ?auto_158596 ) ( ON ?auto_158597 ?auto_158596 ) ( not ( = ?auto_158596 ?auto_158597 ) ) ( not ( = ?auto_158596 ?auto_158598 ) ) ( not ( = ?auto_158596 ?auto_158599 ) ) ( not ( = ?auto_158596 ?auto_158600 ) ) ( not ( = ?auto_158596 ?auto_158601 ) ) ( not ( = ?auto_158597 ?auto_158598 ) ) ( not ( = ?auto_158597 ?auto_158599 ) ) ( not ( = ?auto_158597 ?auto_158600 ) ) ( not ( = ?auto_158597 ?auto_158601 ) ) ( not ( = ?auto_158598 ?auto_158599 ) ) ( not ( = ?auto_158598 ?auto_158600 ) ) ( not ( = ?auto_158598 ?auto_158601 ) ) ( not ( = ?auto_158599 ?auto_158600 ) ) ( not ( = ?auto_158599 ?auto_158601 ) ) ( not ( = ?auto_158600 ?auto_158601 ) ) ( ON ?auto_158599 ?auto_158600 ) ( CLEAR ?auto_158597 ) ( ON ?auto_158598 ?auto_158599 ) ( CLEAR ?auto_158598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158596 ?auto_158597 ?auto_158598 )
      ( MAKE-5PILE ?auto_158596 ?auto_158597 ?auto_158598 ?auto_158599 ?auto_158600 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158618 - BLOCK
      ?auto_158619 - BLOCK
      ?auto_158620 - BLOCK
      ?auto_158621 - BLOCK
      ?auto_158622 - BLOCK
    )
    :vars
    (
      ?auto_158623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158622 ?auto_158623 ) ( ON-TABLE ?auto_158618 ) ( not ( = ?auto_158618 ?auto_158619 ) ) ( not ( = ?auto_158618 ?auto_158620 ) ) ( not ( = ?auto_158618 ?auto_158621 ) ) ( not ( = ?auto_158618 ?auto_158622 ) ) ( not ( = ?auto_158618 ?auto_158623 ) ) ( not ( = ?auto_158619 ?auto_158620 ) ) ( not ( = ?auto_158619 ?auto_158621 ) ) ( not ( = ?auto_158619 ?auto_158622 ) ) ( not ( = ?auto_158619 ?auto_158623 ) ) ( not ( = ?auto_158620 ?auto_158621 ) ) ( not ( = ?auto_158620 ?auto_158622 ) ) ( not ( = ?auto_158620 ?auto_158623 ) ) ( not ( = ?auto_158621 ?auto_158622 ) ) ( not ( = ?auto_158621 ?auto_158623 ) ) ( not ( = ?auto_158622 ?auto_158623 ) ) ( ON ?auto_158621 ?auto_158622 ) ( ON ?auto_158620 ?auto_158621 ) ( CLEAR ?auto_158618 ) ( ON ?auto_158619 ?auto_158620 ) ( CLEAR ?auto_158619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158618 ?auto_158619 )
      ( MAKE-5PILE ?auto_158618 ?auto_158619 ?auto_158620 ?auto_158621 ?auto_158622 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158640 - BLOCK
      ?auto_158641 - BLOCK
      ?auto_158642 - BLOCK
      ?auto_158643 - BLOCK
      ?auto_158644 - BLOCK
    )
    :vars
    (
      ?auto_158645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158644 ?auto_158645 ) ( not ( = ?auto_158640 ?auto_158641 ) ) ( not ( = ?auto_158640 ?auto_158642 ) ) ( not ( = ?auto_158640 ?auto_158643 ) ) ( not ( = ?auto_158640 ?auto_158644 ) ) ( not ( = ?auto_158640 ?auto_158645 ) ) ( not ( = ?auto_158641 ?auto_158642 ) ) ( not ( = ?auto_158641 ?auto_158643 ) ) ( not ( = ?auto_158641 ?auto_158644 ) ) ( not ( = ?auto_158641 ?auto_158645 ) ) ( not ( = ?auto_158642 ?auto_158643 ) ) ( not ( = ?auto_158642 ?auto_158644 ) ) ( not ( = ?auto_158642 ?auto_158645 ) ) ( not ( = ?auto_158643 ?auto_158644 ) ) ( not ( = ?auto_158643 ?auto_158645 ) ) ( not ( = ?auto_158644 ?auto_158645 ) ) ( ON ?auto_158643 ?auto_158644 ) ( ON ?auto_158642 ?auto_158643 ) ( ON ?auto_158641 ?auto_158642 ) ( ON ?auto_158640 ?auto_158641 ) ( CLEAR ?auto_158640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158640 )
      ( MAKE-5PILE ?auto_158640 ?auto_158641 ?auto_158642 ?auto_158643 ?auto_158644 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158663 - BLOCK
      ?auto_158664 - BLOCK
      ?auto_158665 - BLOCK
      ?auto_158666 - BLOCK
      ?auto_158667 - BLOCK
      ?auto_158668 - BLOCK
    )
    :vars
    (
      ?auto_158669 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158667 ) ( ON ?auto_158668 ?auto_158669 ) ( CLEAR ?auto_158668 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158663 ) ( ON ?auto_158664 ?auto_158663 ) ( ON ?auto_158665 ?auto_158664 ) ( ON ?auto_158666 ?auto_158665 ) ( ON ?auto_158667 ?auto_158666 ) ( not ( = ?auto_158663 ?auto_158664 ) ) ( not ( = ?auto_158663 ?auto_158665 ) ) ( not ( = ?auto_158663 ?auto_158666 ) ) ( not ( = ?auto_158663 ?auto_158667 ) ) ( not ( = ?auto_158663 ?auto_158668 ) ) ( not ( = ?auto_158663 ?auto_158669 ) ) ( not ( = ?auto_158664 ?auto_158665 ) ) ( not ( = ?auto_158664 ?auto_158666 ) ) ( not ( = ?auto_158664 ?auto_158667 ) ) ( not ( = ?auto_158664 ?auto_158668 ) ) ( not ( = ?auto_158664 ?auto_158669 ) ) ( not ( = ?auto_158665 ?auto_158666 ) ) ( not ( = ?auto_158665 ?auto_158667 ) ) ( not ( = ?auto_158665 ?auto_158668 ) ) ( not ( = ?auto_158665 ?auto_158669 ) ) ( not ( = ?auto_158666 ?auto_158667 ) ) ( not ( = ?auto_158666 ?auto_158668 ) ) ( not ( = ?auto_158666 ?auto_158669 ) ) ( not ( = ?auto_158667 ?auto_158668 ) ) ( not ( = ?auto_158667 ?auto_158669 ) ) ( not ( = ?auto_158668 ?auto_158669 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158668 ?auto_158669 )
      ( !STACK ?auto_158668 ?auto_158667 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158689 - BLOCK
      ?auto_158690 - BLOCK
      ?auto_158691 - BLOCK
      ?auto_158692 - BLOCK
      ?auto_158693 - BLOCK
      ?auto_158694 - BLOCK
    )
    :vars
    (
      ?auto_158695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158694 ?auto_158695 ) ( ON-TABLE ?auto_158689 ) ( ON ?auto_158690 ?auto_158689 ) ( ON ?auto_158691 ?auto_158690 ) ( ON ?auto_158692 ?auto_158691 ) ( not ( = ?auto_158689 ?auto_158690 ) ) ( not ( = ?auto_158689 ?auto_158691 ) ) ( not ( = ?auto_158689 ?auto_158692 ) ) ( not ( = ?auto_158689 ?auto_158693 ) ) ( not ( = ?auto_158689 ?auto_158694 ) ) ( not ( = ?auto_158689 ?auto_158695 ) ) ( not ( = ?auto_158690 ?auto_158691 ) ) ( not ( = ?auto_158690 ?auto_158692 ) ) ( not ( = ?auto_158690 ?auto_158693 ) ) ( not ( = ?auto_158690 ?auto_158694 ) ) ( not ( = ?auto_158690 ?auto_158695 ) ) ( not ( = ?auto_158691 ?auto_158692 ) ) ( not ( = ?auto_158691 ?auto_158693 ) ) ( not ( = ?auto_158691 ?auto_158694 ) ) ( not ( = ?auto_158691 ?auto_158695 ) ) ( not ( = ?auto_158692 ?auto_158693 ) ) ( not ( = ?auto_158692 ?auto_158694 ) ) ( not ( = ?auto_158692 ?auto_158695 ) ) ( not ( = ?auto_158693 ?auto_158694 ) ) ( not ( = ?auto_158693 ?auto_158695 ) ) ( not ( = ?auto_158694 ?auto_158695 ) ) ( CLEAR ?auto_158692 ) ( ON ?auto_158693 ?auto_158694 ) ( CLEAR ?auto_158693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158689 ?auto_158690 ?auto_158691 ?auto_158692 ?auto_158693 )
      ( MAKE-6PILE ?auto_158689 ?auto_158690 ?auto_158691 ?auto_158692 ?auto_158693 ?auto_158694 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158715 - BLOCK
      ?auto_158716 - BLOCK
      ?auto_158717 - BLOCK
      ?auto_158718 - BLOCK
      ?auto_158719 - BLOCK
      ?auto_158720 - BLOCK
    )
    :vars
    (
      ?auto_158721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158720 ?auto_158721 ) ( ON-TABLE ?auto_158715 ) ( ON ?auto_158716 ?auto_158715 ) ( ON ?auto_158717 ?auto_158716 ) ( not ( = ?auto_158715 ?auto_158716 ) ) ( not ( = ?auto_158715 ?auto_158717 ) ) ( not ( = ?auto_158715 ?auto_158718 ) ) ( not ( = ?auto_158715 ?auto_158719 ) ) ( not ( = ?auto_158715 ?auto_158720 ) ) ( not ( = ?auto_158715 ?auto_158721 ) ) ( not ( = ?auto_158716 ?auto_158717 ) ) ( not ( = ?auto_158716 ?auto_158718 ) ) ( not ( = ?auto_158716 ?auto_158719 ) ) ( not ( = ?auto_158716 ?auto_158720 ) ) ( not ( = ?auto_158716 ?auto_158721 ) ) ( not ( = ?auto_158717 ?auto_158718 ) ) ( not ( = ?auto_158717 ?auto_158719 ) ) ( not ( = ?auto_158717 ?auto_158720 ) ) ( not ( = ?auto_158717 ?auto_158721 ) ) ( not ( = ?auto_158718 ?auto_158719 ) ) ( not ( = ?auto_158718 ?auto_158720 ) ) ( not ( = ?auto_158718 ?auto_158721 ) ) ( not ( = ?auto_158719 ?auto_158720 ) ) ( not ( = ?auto_158719 ?auto_158721 ) ) ( not ( = ?auto_158720 ?auto_158721 ) ) ( ON ?auto_158719 ?auto_158720 ) ( CLEAR ?auto_158717 ) ( ON ?auto_158718 ?auto_158719 ) ( CLEAR ?auto_158718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158715 ?auto_158716 ?auto_158717 ?auto_158718 )
      ( MAKE-6PILE ?auto_158715 ?auto_158716 ?auto_158717 ?auto_158718 ?auto_158719 ?auto_158720 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158741 - BLOCK
      ?auto_158742 - BLOCK
      ?auto_158743 - BLOCK
      ?auto_158744 - BLOCK
      ?auto_158745 - BLOCK
      ?auto_158746 - BLOCK
    )
    :vars
    (
      ?auto_158747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158746 ?auto_158747 ) ( ON-TABLE ?auto_158741 ) ( ON ?auto_158742 ?auto_158741 ) ( not ( = ?auto_158741 ?auto_158742 ) ) ( not ( = ?auto_158741 ?auto_158743 ) ) ( not ( = ?auto_158741 ?auto_158744 ) ) ( not ( = ?auto_158741 ?auto_158745 ) ) ( not ( = ?auto_158741 ?auto_158746 ) ) ( not ( = ?auto_158741 ?auto_158747 ) ) ( not ( = ?auto_158742 ?auto_158743 ) ) ( not ( = ?auto_158742 ?auto_158744 ) ) ( not ( = ?auto_158742 ?auto_158745 ) ) ( not ( = ?auto_158742 ?auto_158746 ) ) ( not ( = ?auto_158742 ?auto_158747 ) ) ( not ( = ?auto_158743 ?auto_158744 ) ) ( not ( = ?auto_158743 ?auto_158745 ) ) ( not ( = ?auto_158743 ?auto_158746 ) ) ( not ( = ?auto_158743 ?auto_158747 ) ) ( not ( = ?auto_158744 ?auto_158745 ) ) ( not ( = ?auto_158744 ?auto_158746 ) ) ( not ( = ?auto_158744 ?auto_158747 ) ) ( not ( = ?auto_158745 ?auto_158746 ) ) ( not ( = ?auto_158745 ?auto_158747 ) ) ( not ( = ?auto_158746 ?auto_158747 ) ) ( ON ?auto_158745 ?auto_158746 ) ( ON ?auto_158744 ?auto_158745 ) ( CLEAR ?auto_158742 ) ( ON ?auto_158743 ?auto_158744 ) ( CLEAR ?auto_158743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158741 ?auto_158742 ?auto_158743 )
      ( MAKE-6PILE ?auto_158741 ?auto_158742 ?auto_158743 ?auto_158744 ?auto_158745 ?auto_158746 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158767 - BLOCK
      ?auto_158768 - BLOCK
      ?auto_158769 - BLOCK
      ?auto_158770 - BLOCK
      ?auto_158771 - BLOCK
      ?auto_158772 - BLOCK
    )
    :vars
    (
      ?auto_158773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158772 ?auto_158773 ) ( ON-TABLE ?auto_158767 ) ( not ( = ?auto_158767 ?auto_158768 ) ) ( not ( = ?auto_158767 ?auto_158769 ) ) ( not ( = ?auto_158767 ?auto_158770 ) ) ( not ( = ?auto_158767 ?auto_158771 ) ) ( not ( = ?auto_158767 ?auto_158772 ) ) ( not ( = ?auto_158767 ?auto_158773 ) ) ( not ( = ?auto_158768 ?auto_158769 ) ) ( not ( = ?auto_158768 ?auto_158770 ) ) ( not ( = ?auto_158768 ?auto_158771 ) ) ( not ( = ?auto_158768 ?auto_158772 ) ) ( not ( = ?auto_158768 ?auto_158773 ) ) ( not ( = ?auto_158769 ?auto_158770 ) ) ( not ( = ?auto_158769 ?auto_158771 ) ) ( not ( = ?auto_158769 ?auto_158772 ) ) ( not ( = ?auto_158769 ?auto_158773 ) ) ( not ( = ?auto_158770 ?auto_158771 ) ) ( not ( = ?auto_158770 ?auto_158772 ) ) ( not ( = ?auto_158770 ?auto_158773 ) ) ( not ( = ?auto_158771 ?auto_158772 ) ) ( not ( = ?auto_158771 ?auto_158773 ) ) ( not ( = ?auto_158772 ?auto_158773 ) ) ( ON ?auto_158771 ?auto_158772 ) ( ON ?auto_158770 ?auto_158771 ) ( ON ?auto_158769 ?auto_158770 ) ( CLEAR ?auto_158767 ) ( ON ?auto_158768 ?auto_158769 ) ( CLEAR ?auto_158768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158767 ?auto_158768 )
      ( MAKE-6PILE ?auto_158767 ?auto_158768 ?auto_158769 ?auto_158770 ?auto_158771 ?auto_158772 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158793 - BLOCK
      ?auto_158794 - BLOCK
      ?auto_158795 - BLOCK
      ?auto_158796 - BLOCK
      ?auto_158797 - BLOCK
      ?auto_158798 - BLOCK
    )
    :vars
    (
      ?auto_158799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158798 ?auto_158799 ) ( not ( = ?auto_158793 ?auto_158794 ) ) ( not ( = ?auto_158793 ?auto_158795 ) ) ( not ( = ?auto_158793 ?auto_158796 ) ) ( not ( = ?auto_158793 ?auto_158797 ) ) ( not ( = ?auto_158793 ?auto_158798 ) ) ( not ( = ?auto_158793 ?auto_158799 ) ) ( not ( = ?auto_158794 ?auto_158795 ) ) ( not ( = ?auto_158794 ?auto_158796 ) ) ( not ( = ?auto_158794 ?auto_158797 ) ) ( not ( = ?auto_158794 ?auto_158798 ) ) ( not ( = ?auto_158794 ?auto_158799 ) ) ( not ( = ?auto_158795 ?auto_158796 ) ) ( not ( = ?auto_158795 ?auto_158797 ) ) ( not ( = ?auto_158795 ?auto_158798 ) ) ( not ( = ?auto_158795 ?auto_158799 ) ) ( not ( = ?auto_158796 ?auto_158797 ) ) ( not ( = ?auto_158796 ?auto_158798 ) ) ( not ( = ?auto_158796 ?auto_158799 ) ) ( not ( = ?auto_158797 ?auto_158798 ) ) ( not ( = ?auto_158797 ?auto_158799 ) ) ( not ( = ?auto_158798 ?auto_158799 ) ) ( ON ?auto_158797 ?auto_158798 ) ( ON ?auto_158796 ?auto_158797 ) ( ON ?auto_158795 ?auto_158796 ) ( ON ?auto_158794 ?auto_158795 ) ( ON ?auto_158793 ?auto_158794 ) ( CLEAR ?auto_158793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158793 )
      ( MAKE-6PILE ?auto_158793 ?auto_158794 ?auto_158795 ?auto_158796 ?auto_158797 ?auto_158798 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158820 - BLOCK
      ?auto_158821 - BLOCK
      ?auto_158822 - BLOCK
      ?auto_158823 - BLOCK
      ?auto_158824 - BLOCK
      ?auto_158825 - BLOCK
      ?auto_158826 - BLOCK
    )
    :vars
    (
      ?auto_158827 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158825 ) ( ON ?auto_158826 ?auto_158827 ) ( CLEAR ?auto_158826 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158820 ) ( ON ?auto_158821 ?auto_158820 ) ( ON ?auto_158822 ?auto_158821 ) ( ON ?auto_158823 ?auto_158822 ) ( ON ?auto_158824 ?auto_158823 ) ( ON ?auto_158825 ?auto_158824 ) ( not ( = ?auto_158820 ?auto_158821 ) ) ( not ( = ?auto_158820 ?auto_158822 ) ) ( not ( = ?auto_158820 ?auto_158823 ) ) ( not ( = ?auto_158820 ?auto_158824 ) ) ( not ( = ?auto_158820 ?auto_158825 ) ) ( not ( = ?auto_158820 ?auto_158826 ) ) ( not ( = ?auto_158820 ?auto_158827 ) ) ( not ( = ?auto_158821 ?auto_158822 ) ) ( not ( = ?auto_158821 ?auto_158823 ) ) ( not ( = ?auto_158821 ?auto_158824 ) ) ( not ( = ?auto_158821 ?auto_158825 ) ) ( not ( = ?auto_158821 ?auto_158826 ) ) ( not ( = ?auto_158821 ?auto_158827 ) ) ( not ( = ?auto_158822 ?auto_158823 ) ) ( not ( = ?auto_158822 ?auto_158824 ) ) ( not ( = ?auto_158822 ?auto_158825 ) ) ( not ( = ?auto_158822 ?auto_158826 ) ) ( not ( = ?auto_158822 ?auto_158827 ) ) ( not ( = ?auto_158823 ?auto_158824 ) ) ( not ( = ?auto_158823 ?auto_158825 ) ) ( not ( = ?auto_158823 ?auto_158826 ) ) ( not ( = ?auto_158823 ?auto_158827 ) ) ( not ( = ?auto_158824 ?auto_158825 ) ) ( not ( = ?auto_158824 ?auto_158826 ) ) ( not ( = ?auto_158824 ?auto_158827 ) ) ( not ( = ?auto_158825 ?auto_158826 ) ) ( not ( = ?auto_158825 ?auto_158827 ) ) ( not ( = ?auto_158826 ?auto_158827 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158826 ?auto_158827 )
      ( !STACK ?auto_158826 ?auto_158825 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158850 - BLOCK
      ?auto_158851 - BLOCK
      ?auto_158852 - BLOCK
      ?auto_158853 - BLOCK
      ?auto_158854 - BLOCK
      ?auto_158855 - BLOCK
      ?auto_158856 - BLOCK
    )
    :vars
    (
      ?auto_158857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158856 ?auto_158857 ) ( ON-TABLE ?auto_158850 ) ( ON ?auto_158851 ?auto_158850 ) ( ON ?auto_158852 ?auto_158851 ) ( ON ?auto_158853 ?auto_158852 ) ( ON ?auto_158854 ?auto_158853 ) ( not ( = ?auto_158850 ?auto_158851 ) ) ( not ( = ?auto_158850 ?auto_158852 ) ) ( not ( = ?auto_158850 ?auto_158853 ) ) ( not ( = ?auto_158850 ?auto_158854 ) ) ( not ( = ?auto_158850 ?auto_158855 ) ) ( not ( = ?auto_158850 ?auto_158856 ) ) ( not ( = ?auto_158850 ?auto_158857 ) ) ( not ( = ?auto_158851 ?auto_158852 ) ) ( not ( = ?auto_158851 ?auto_158853 ) ) ( not ( = ?auto_158851 ?auto_158854 ) ) ( not ( = ?auto_158851 ?auto_158855 ) ) ( not ( = ?auto_158851 ?auto_158856 ) ) ( not ( = ?auto_158851 ?auto_158857 ) ) ( not ( = ?auto_158852 ?auto_158853 ) ) ( not ( = ?auto_158852 ?auto_158854 ) ) ( not ( = ?auto_158852 ?auto_158855 ) ) ( not ( = ?auto_158852 ?auto_158856 ) ) ( not ( = ?auto_158852 ?auto_158857 ) ) ( not ( = ?auto_158853 ?auto_158854 ) ) ( not ( = ?auto_158853 ?auto_158855 ) ) ( not ( = ?auto_158853 ?auto_158856 ) ) ( not ( = ?auto_158853 ?auto_158857 ) ) ( not ( = ?auto_158854 ?auto_158855 ) ) ( not ( = ?auto_158854 ?auto_158856 ) ) ( not ( = ?auto_158854 ?auto_158857 ) ) ( not ( = ?auto_158855 ?auto_158856 ) ) ( not ( = ?auto_158855 ?auto_158857 ) ) ( not ( = ?auto_158856 ?auto_158857 ) ) ( CLEAR ?auto_158854 ) ( ON ?auto_158855 ?auto_158856 ) ( CLEAR ?auto_158855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158850 ?auto_158851 ?auto_158852 ?auto_158853 ?auto_158854 ?auto_158855 )
      ( MAKE-7PILE ?auto_158850 ?auto_158851 ?auto_158852 ?auto_158853 ?auto_158854 ?auto_158855 ?auto_158856 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158880 - BLOCK
      ?auto_158881 - BLOCK
      ?auto_158882 - BLOCK
      ?auto_158883 - BLOCK
      ?auto_158884 - BLOCK
      ?auto_158885 - BLOCK
      ?auto_158886 - BLOCK
    )
    :vars
    (
      ?auto_158887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158886 ?auto_158887 ) ( ON-TABLE ?auto_158880 ) ( ON ?auto_158881 ?auto_158880 ) ( ON ?auto_158882 ?auto_158881 ) ( ON ?auto_158883 ?auto_158882 ) ( not ( = ?auto_158880 ?auto_158881 ) ) ( not ( = ?auto_158880 ?auto_158882 ) ) ( not ( = ?auto_158880 ?auto_158883 ) ) ( not ( = ?auto_158880 ?auto_158884 ) ) ( not ( = ?auto_158880 ?auto_158885 ) ) ( not ( = ?auto_158880 ?auto_158886 ) ) ( not ( = ?auto_158880 ?auto_158887 ) ) ( not ( = ?auto_158881 ?auto_158882 ) ) ( not ( = ?auto_158881 ?auto_158883 ) ) ( not ( = ?auto_158881 ?auto_158884 ) ) ( not ( = ?auto_158881 ?auto_158885 ) ) ( not ( = ?auto_158881 ?auto_158886 ) ) ( not ( = ?auto_158881 ?auto_158887 ) ) ( not ( = ?auto_158882 ?auto_158883 ) ) ( not ( = ?auto_158882 ?auto_158884 ) ) ( not ( = ?auto_158882 ?auto_158885 ) ) ( not ( = ?auto_158882 ?auto_158886 ) ) ( not ( = ?auto_158882 ?auto_158887 ) ) ( not ( = ?auto_158883 ?auto_158884 ) ) ( not ( = ?auto_158883 ?auto_158885 ) ) ( not ( = ?auto_158883 ?auto_158886 ) ) ( not ( = ?auto_158883 ?auto_158887 ) ) ( not ( = ?auto_158884 ?auto_158885 ) ) ( not ( = ?auto_158884 ?auto_158886 ) ) ( not ( = ?auto_158884 ?auto_158887 ) ) ( not ( = ?auto_158885 ?auto_158886 ) ) ( not ( = ?auto_158885 ?auto_158887 ) ) ( not ( = ?auto_158886 ?auto_158887 ) ) ( ON ?auto_158885 ?auto_158886 ) ( CLEAR ?auto_158883 ) ( ON ?auto_158884 ?auto_158885 ) ( CLEAR ?auto_158884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158880 ?auto_158881 ?auto_158882 ?auto_158883 ?auto_158884 )
      ( MAKE-7PILE ?auto_158880 ?auto_158881 ?auto_158882 ?auto_158883 ?auto_158884 ?auto_158885 ?auto_158886 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158910 - BLOCK
      ?auto_158911 - BLOCK
      ?auto_158912 - BLOCK
      ?auto_158913 - BLOCK
      ?auto_158914 - BLOCK
      ?auto_158915 - BLOCK
      ?auto_158916 - BLOCK
    )
    :vars
    (
      ?auto_158917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158916 ?auto_158917 ) ( ON-TABLE ?auto_158910 ) ( ON ?auto_158911 ?auto_158910 ) ( ON ?auto_158912 ?auto_158911 ) ( not ( = ?auto_158910 ?auto_158911 ) ) ( not ( = ?auto_158910 ?auto_158912 ) ) ( not ( = ?auto_158910 ?auto_158913 ) ) ( not ( = ?auto_158910 ?auto_158914 ) ) ( not ( = ?auto_158910 ?auto_158915 ) ) ( not ( = ?auto_158910 ?auto_158916 ) ) ( not ( = ?auto_158910 ?auto_158917 ) ) ( not ( = ?auto_158911 ?auto_158912 ) ) ( not ( = ?auto_158911 ?auto_158913 ) ) ( not ( = ?auto_158911 ?auto_158914 ) ) ( not ( = ?auto_158911 ?auto_158915 ) ) ( not ( = ?auto_158911 ?auto_158916 ) ) ( not ( = ?auto_158911 ?auto_158917 ) ) ( not ( = ?auto_158912 ?auto_158913 ) ) ( not ( = ?auto_158912 ?auto_158914 ) ) ( not ( = ?auto_158912 ?auto_158915 ) ) ( not ( = ?auto_158912 ?auto_158916 ) ) ( not ( = ?auto_158912 ?auto_158917 ) ) ( not ( = ?auto_158913 ?auto_158914 ) ) ( not ( = ?auto_158913 ?auto_158915 ) ) ( not ( = ?auto_158913 ?auto_158916 ) ) ( not ( = ?auto_158913 ?auto_158917 ) ) ( not ( = ?auto_158914 ?auto_158915 ) ) ( not ( = ?auto_158914 ?auto_158916 ) ) ( not ( = ?auto_158914 ?auto_158917 ) ) ( not ( = ?auto_158915 ?auto_158916 ) ) ( not ( = ?auto_158915 ?auto_158917 ) ) ( not ( = ?auto_158916 ?auto_158917 ) ) ( ON ?auto_158915 ?auto_158916 ) ( ON ?auto_158914 ?auto_158915 ) ( CLEAR ?auto_158912 ) ( ON ?auto_158913 ?auto_158914 ) ( CLEAR ?auto_158913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158910 ?auto_158911 ?auto_158912 ?auto_158913 )
      ( MAKE-7PILE ?auto_158910 ?auto_158911 ?auto_158912 ?auto_158913 ?auto_158914 ?auto_158915 ?auto_158916 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158940 - BLOCK
      ?auto_158941 - BLOCK
      ?auto_158942 - BLOCK
      ?auto_158943 - BLOCK
      ?auto_158944 - BLOCK
      ?auto_158945 - BLOCK
      ?auto_158946 - BLOCK
    )
    :vars
    (
      ?auto_158947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158946 ?auto_158947 ) ( ON-TABLE ?auto_158940 ) ( ON ?auto_158941 ?auto_158940 ) ( not ( = ?auto_158940 ?auto_158941 ) ) ( not ( = ?auto_158940 ?auto_158942 ) ) ( not ( = ?auto_158940 ?auto_158943 ) ) ( not ( = ?auto_158940 ?auto_158944 ) ) ( not ( = ?auto_158940 ?auto_158945 ) ) ( not ( = ?auto_158940 ?auto_158946 ) ) ( not ( = ?auto_158940 ?auto_158947 ) ) ( not ( = ?auto_158941 ?auto_158942 ) ) ( not ( = ?auto_158941 ?auto_158943 ) ) ( not ( = ?auto_158941 ?auto_158944 ) ) ( not ( = ?auto_158941 ?auto_158945 ) ) ( not ( = ?auto_158941 ?auto_158946 ) ) ( not ( = ?auto_158941 ?auto_158947 ) ) ( not ( = ?auto_158942 ?auto_158943 ) ) ( not ( = ?auto_158942 ?auto_158944 ) ) ( not ( = ?auto_158942 ?auto_158945 ) ) ( not ( = ?auto_158942 ?auto_158946 ) ) ( not ( = ?auto_158942 ?auto_158947 ) ) ( not ( = ?auto_158943 ?auto_158944 ) ) ( not ( = ?auto_158943 ?auto_158945 ) ) ( not ( = ?auto_158943 ?auto_158946 ) ) ( not ( = ?auto_158943 ?auto_158947 ) ) ( not ( = ?auto_158944 ?auto_158945 ) ) ( not ( = ?auto_158944 ?auto_158946 ) ) ( not ( = ?auto_158944 ?auto_158947 ) ) ( not ( = ?auto_158945 ?auto_158946 ) ) ( not ( = ?auto_158945 ?auto_158947 ) ) ( not ( = ?auto_158946 ?auto_158947 ) ) ( ON ?auto_158945 ?auto_158946 ) ( ON ?auto_158944 ?auto_158945 ) ( ON ?auto_158943 ?auto_158944 ) ( CLEAR ?auto_158941 ) ( ON ?auto_158942 ?auto_158943 ) ( CLEAR ?auto_158942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158940 ?auto_158941 ?auto_158942 )
      ( MAKE-7PILE ?auto_158940 ?auto_158941 ?auto_158942 ?auto_158943 ?auto_158944 ?auto_158945 ?auto_158946 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158970 - BLOCK
      ?auto_158971 - BLOCK
      ?auto_158972 - BLOCK
      ?auto_158973 - BLOCK
      ?auto_158974 - BLOCK
      ?auto_158975 - BLOCK
      ?auto_158976 - BLOCK
    )
    :vars
    (
      ?auto_158977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158976 ?auto_158977 ) ( ON-TABLE ?auto_158970 ) ( not ( = ?auto_158970 ?auto_158971 ) ) ( not ( = ?auto_158970 ?auto_158972 ) ) ( not ( = ?auto_158970 ?auto_158973 ) ) ( not ( = ?auto_158970 ?auto_158974 ) ) ( not ( = ?auto_158970 ?auto_158975 ) ) ( not ( = ?auto_158970 ?auto_158976 ) ) ( not ( = ?auto_158970 ?auto_158977 ) ) ( not ( = ?auto_158971 ?auto_158972 ) ) ( not ( = ?auto_158971 ?auto_158973 ) ) ( not ( = ?auto_158971 ?auto_158974 ) ) ( not ( = ?auto_158971 ?auto_158975 ) ) ( not ( = ?auto_158971 ?auto_158976 ) ) ( not ( = ?auto_158971 ?auto_158977 ) ) ( not ( = ?auto_158972 ?auto_158973 ) ) ( not ( = ?auto_158972 ?auto_158974 ) ) ( not ( = ?auto_158972 ?auto_158975 ) ) ( not ( = ?auto_158972 ?auto_158976 ) ) ( not ( = ?auto_158972 ?auto_158977 ) ) ( not ( = ?auto_158973 ?auto_158974 ) ) ( not ( = ?auto_158973 ?auto_158975 ) ) ( not ( = ?auto_158973 ?auto_158976 ) ) ( not ( = ?auto_158973 ?auto_158977 ) ) ( not ( = ?auto_158974 ?auto_158975 ) ) ( not ( = ?auto_158974 ?auto_158976 ) ) ( not ( = ?auto_158974 ?auto_158977 ) ) ( not ( = ?auto_158975 ?auto_158976 ) ) ( not ( = ?auto_158975 ?auto_158977 ) ) ( not ( = ?auto_158976 ?auto_158977 ) ) ( ON ?auto_158975 ?auto_158976 ) ( ON ?auto_158974 ?auto_158975 ) ( ON ?auto_158973 ?auto_158974 ) ( ON ?auto_158972 ?auto_158973 ) ( CLEAR ?auto_158970 ) ( ON ?auto_158971 ?auto_158972 ) ( CLEAR ?auto_158971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158970 ?auto_158971 )
      ( MAKE-7PILE ?auto_158970 ?auto_158971 ?auto_158972 ?auto_158973 ?auto_158974 ?auto_158975 ?auto_158976 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159000 - BLOCK
      ?auto_159001 - BLOCK
      ?auto_159002 - BLOCK
      ?auto_159003 - BLOCK
      ?auto_159004 - BLOCK
      ?auto_159005 - BLOCK
      ?auto_159006 - BLOCK
    )
    :vars
    (
      ?auto_159007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159006 ?auto_159007 ) ( not ( = ?auto_159000 ?auto_159001 ) ) ( not ( = ?auto_159000 ?auto_159002 ) ) ( not ( = ?auto_159000 ?auto_159003 ) ) ( not ( = ?auto_159000 ?auto_159004 ) ) ( not ( = ?auto_159000 ?auto_159005 ) ) ( not ( = ?auto_159000 ?auto_159006 ) ) ( not ( = ?auto_159000 ?auto_159007 ) ) ( not ( = ?auto_159001 ?auto_159002 ) ) ( not ( = ?auto_159001 ?auto_159003 ) ) ( not ( = ?auto_159001 ?auto_159004 ) ) ( not ( = ?auto_159001 ?auto_159005 ) ) ( not ( = ?auto_159001 ?auto_159006 ) ) ( not ( = ?auto_159001 ?auto_159007 ) ) ( not ( = ?auto_159002 ?auto_159003 ) ) ( not ( = ?auto_159002 ?auto_159004 ) ) ( not ( = ?auto_159002 ?auto_159005 ) ) ( not ( = ?auto_159002 ?auto_159006 ) ) ( not ( = ?auto_159002 ?auto_159007 ) ) ( not ( = ?auto_159003 ?auto_159004 ) ) ( not ( = ?auto_159003 ?auto_159005 ) ) ( not ( = ?auto_159003 ?auto_159006 ) ) ( not ( = ?auto_159003 ?auto_159007 ) ) ( not ( = ?auto_159004 ?auto_159005 ) ) ( not ( = ?auto_159004 ?auto_159006 ) ) ( not ( = ?auto_159004 ?auto_159007 ) ) ( not ( = ?auto_159005 ?auto_159006 ) ) ( not ( = ?auto_159005 ?auto_159007 ) ) ( not ( = ?auto_159006 ?auto_159007 ) ) ( ON ?auto_159005 ?auto_159006 ) ( ON ?auto_159004 ?auto_159005 ) ( ON ?auto_159003 ?auto_159004 ) ( ON ?auto_159002 ?auto_159003 ) ( ON ?auto_159001 ?auto_159002 ) ( ON ?auto_159000 ?auto_159001 ) ( CLEAR ?auto_159000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159000 )
      ( MAKE-7PILE ?auto_159000 ?auto_159001 ?auto_159002 ?auto_159003 ?auto_159004 ?auto_159005 ?auto_159006 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159031 - BLOCK
      ?auto_159032 - BLOCK
      ?auto_159033 - BLOCK
      ?auto_159034 - BLOCK
      ?auto_159035 - BLOCK
      ?auto_159036 - BLOCK
      ?auto_159037 - BLOCK
      ?auto_159038 - BLOCK
    )
    :vars
    (
      ?auto_159039 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_159037 ) ( ON ?auto_159038 ?auto_159039 ) ( CLEAR ?auto_159038 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159031 ) ( ON ?auto_159032 ?auto_159031 ) ( ON ?auto_159033 ?auto_159032 ) ( ON ?auto_159034 ?auto_159033 ) ( ON ?auto_159035 ?auto_159034 ) ( ON ?auto_159036 ?auto_159035 ) ( ON ?auto_159037 ?auto_159036 ) ( not ( = ?auto_159031 ?auto_159032 ) ) ( not ( = ?auto_159031 ?auto_159033 ) ) ( not ( = ?auto_159031 ?auto_159034 ) ) ( not ( = ?auto_159031 ?auto_159035 ) ) ( not ( = ?auto_159031 ?auto_159036 ) ) ( not ( = ?auto_159031 ?auto_159037 ) ) ( not ( = ?auto_159031 ?auto_159038 ) ) ( not ( = ?auto_159031 ?auto_159039 ) ) ( not ( = ?auto_159032 ?auto_159033 ) ) ( not ( = ?auto_159032 ?auto_159034 ) ) ( not ( = ?auto_159032 ?auto_159035 ) ) ( not ( = ?auto_159032 ?auto_159036 ) ) ( not ( = ?auto_159032 ?auto_159037 ) ) ( not ( = ?auto_159032 ?auto_159038 ) ) ( not ( = ?auto_159032 ?auto_159039 ) ) ( not ( = ?auto_159033 ?auto_159034 ) ) ( not ( = ?auto_159033 ?auto_159035 ) ) ( not ( = ?auto_159033 ?auto_159036 ) ) ( not ( = ?auto_159033 ?auto_159037 ) ) ( not ( = ?auto_159033 ?auto_159038 ) ) ( not ( = ?auto_159033 ?auto_159039 ) ) ( not ( = ?auto_159034 ?auto_159035 ) ) ( not ( = ?auto_159034 ?auto_159036 ) ) ( not ( = ?auto_159034 ?auto_159037 ) ) ( not ( = ?auto_159034 ?auto_159038 ) ) ( not ( = ?auto_159034 ?auto_159039 ) ) ( not ( = ?auto_159035 ?auto_159036 ) ) ( not ( = ?auto_159035 ?auto_159037 ) ) ( not ( = ?auto_159035 ?auto_159038 ) ) ( not ( = ?auto_159035 ?auto_159039 ) ) ( not ( = ?auto_159036 ?auto_159037 ) ) ( not ( = ?auto_159036 ?auto_159038 ) ) ( not ( = ?auto_159036 ?auto_159039 ) ) ( not ( = ?auto_159037 ?auto_159038 ) ) ( not ( = ?auto_159037 ?auto_159039 ) ) ( not ( = ?auto_159038 ?auto_159039 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159038 ?auto_159039 )
      ( !STACK ?auto_159038 ?auto_159037 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159065 - BLOCK
      ?auto_159066 - BLOCK
      ?auto_159067 - BLOCK
      ?auto_159068 - BLOCK
      ?auto_159069 - BLOCK
      ?auto_159070 - BLOCK
      ?auto_159071 - BLOCK
      ?auto_159072 - BLOCK
    )
    :vars
    (
      ?auto_159073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159072 ?auto_159073 ) ( ON-TABLE ?auto_159065 ) ( ON ?auto_159066 ?auto_159065 ) ( ON ?auto_159067 ?auto_159066 ) ( ON ?auto_159068 ?auto_159067 ) ( ON ?auto_159069 ?auto_159068 ) ( ON ?auto_159070 ?auto_159069 ) ( not ( = ?auto_159065 ?auto_159066 ) ) ( not ( = ?auto_159065 ?auto_159067 ) ) ( not ( = ?auto_159065 ?auto_159068 ) ) ( not ( = ?auto_159065 ?auto_159069 ) ) ( not ( = ?auto_159065 ?auto_159070 ) ) ( not ( = ?auto_159065 ?auto_159071 ) ) ( not ( = ?auto_159065 ?auto_159072 ) ) ( not ( = ?auto_159065 ?auto_159073 ) ) ( not ( = ?auto_159066 ?auto_159067 ) ) ( not ( = ?auto_159066 ?auto_159068 ) ) ( not ( = ?auto_159066 ?auto_159069 ) ) ( not ( = ?auto_159066 ?auto_159070 ) ) ( not ( = ?auto_159066 ?auto_159071 ) ) ( not ( = ?auto_159066 ?auto_159072 ) ) ( not ( = ?auto_159066 ?auto_159073 ) ) ( not ( = ?auto_159067 ?auto_159068 ) ) ( not ( = ?auto_159067 ?auto_159069 ) ) ( not ( = ?auto_159067 ?auto_159070 ) ) ( not ( = ?auto_159067 ?auto_159071 ) ) ( not ( = ?auto_159067 ?auto_159072 ) ) ( not ( = ?auto_159067 ?auto_159073 ) ) ( not ( = ?auto_159068 ?auto_159069 ) ) ( not ( = ?auto_159068 ?auto_159070 ) ) ( not ( = ?auto_159068 ?auto_159071 ) ) ( not ( = ?auto_159068 ?auto_159072 ) ) ( not ( = ?auto_159068 ?auto_159073 ) ) ( not ( = ?auto_159069 ?auto_159070 ) ) ( not ( = ?auto_159069 ?auto_159071 ) ) ( not ( = ?auto_159069 ?auto_159072 ) ) ( not ( = ?auto_159069 ?auto_159073 ) ) ( not ( = ?auto_159070 ?auto_159071 ) ) ( not ( = ?auto_159070 ?auto_159072 ) ) ( not ( = ?auto_159070 ?auto_159073 ) ) ( not ( = ?auto_159071 ?auto_159072 ) ) ( not ( = ?auto_159071 ?auto_159073 ) ) ( not ( = ?auto_159072 ?auto_159073 ) ) ( CLEAR ?auto_159070 ) ( ON ?auto_159071 ?auto_159072 ) ( CLEAR ?auto_159071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159065 ?auto_159066 ?auto_159067 ?auto_159068 ?auto_159069 ?auto_159070 ?auto_159071 )
      ( MAKE-8PILE ?auto_159065 ?auto_159066 ?auto_159067 ?auto_159068 ?auto_159069 ?auto_159070 ?auto_159071 ?auto_159072 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159099 - BLOCK
      ?auto_159100 - BLOCK
      ?auto_159101 - BLOCK
      ?auto_159102 - BLOCK
      ?auto_159103 - BLOCK
      ?auto_159104 - BLOCK
      ?auto_159105 - BLOCK
      ?auto_159106 - BLOCK
    )
    :vars
    (
      ?auto_159107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159106 ?auto_159107 ) ( ON-TABLE ?auto_159099 ) ( ON ?auto_159100 ?auto_159099 ) ( ON ?auto_159101 ?auto_159100 ) ( ON ?auto_159102 ?auto_159101 ) ( ON ?auto_159103 ?auto_159102 ) ( not ( = ?auto_159099 ?auto_159100 ) ) ( not ( = ?auto_159099 ?auto_159101 ) ) ( not ( = ?auto_159099 ?auto_159102 ) ) ( not ( = ?auto_159099 ?auto_159103 ) ) ( not ( = ?auto_159099 ?auto_159104 ) ) ( not ( = ?auto_159099 ?auto_159105 ) ) ( not ( = ?auto_159099 ?auto_159106 ) ) ( not ( = ?auto_159099 ?auto_159107 ) ) ( not ( = ?auto_159100 ?auto_159101 ) ) ( not ( = ?auto_159100 ?auto_159102 ) ) ( not ( = ?auto_159100 ?auto_159103 ) ) ( not ( = ?auto_159100 ?auto_159104 ) ) ( not ( = ?auto_159100 ?auto_159105 ) ) ( not ( = ?auto_159100 ?auto_159106 ) ) ( not ( = ?auto_159100 ?auto_159107 ) ) ( not ( = ?auto_159101 ?auto_159102 ) ) ( not ( = ?auto_159101 ?auto_159103 ) ) ( not ( = ?auto_159101 ?auto_159104 ) ) ( not ( = ?auto_159101 ?auto_159105 ) ) ( not ( = ?auto_159101 ?auto_159106 ) ) ( not ( = ?auto_159101 ?auto_159107 ) ) ( not ( = ?auto_159102 ?auto_159103 ) ) ( not ( = ?auto_159102 ?auto_159104 ) ) ( not ( = ?auto_159102 ?auto_159105 ) ) ( not ( = ?auto_159102 ?auto_159106 ) ) ( not ( = ?auto_159102 ?auto_159107 ) ) ( not ( = ?auto_159103 ?auto_159104 ) ) ( not ( = ?auto_159103 ?auto_159105 ) ) ( not ( = ?auto_159103 ?auto_159106 ) ) ( not ( = ?auto_159103 ?auto_159107 ) ) ( not ( = ?auto_159104 ?auto_159105 ) ) ( not ( = ?auto_159104 ?auto_159106 ) ) ( not ( = ?auto_159104 ?auto_159107 ) ) ( not ( = ?auto_159105 ?auto_159106 ) ) ( not ( = ?auto_159105 ?auto_159107 ) ) ( not ( = ?auto_159106 ?auto_159107 ) ) ( ON ?auto_159105 ?auto_159106 ) ( CLEAR ?auto_159103 ) ( ON ?auto_159104 ?auto_159105 ) ( CLEAR ?auto_159104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159099 ?auto_159100 ?auto_159101 ?auto_159102 ?auto_159103 ?auto_159104 )
      ( MAKE-8PILE ?auto_159099 ?auto_159100 ?auto_159101 ?auto_159102 ?auto_159103 ?auto_159104 ?auto_159105 ?auto_159106 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159133 - BLOCK
      ?auto_159134 - BLOCK
      ?auto_159135 - BLOCK
      ?auto_159136 - BLOCK
      ?auto_159137 - BLOCK
      ?auto_159138 - BLOCK
      ?auto_159139 - BLOCK
      ?auto_159140 - BLOCK
    )
    :vars
    (
      ?auto_159141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159140 ?auto_159141 ) ( ON-TABLE ?auto_159133 ) ( ON ?auto_159134 ?auto_159133 ) ( ON ?auto_159135 ?auto_159134 ) ( ON ?auto_159136 ?auto_159135 ) ( not ( = ?auto_159133 ?auto_159134 ) ) ( not ( = ?auto_159133 ?auto_159135 ) ) ( not ( = ?auto_159133 ?auto_159136 ) ) ( not ( = ?auto_159133 ?auto_159137 ) ) ( not ( = ?auto_159133 ?auto_159138 ) ) ( not ( = ?auto_159133 ?auto_159139 ) ) ( not ( = ?auto_159133 ?auto_159140 ) ) ( not ( = ?auto_159133 ?auto_159141 ) ) ( not ( = ?auto_159134 ?auto_159135 ) ) ( not ( = ?auto_159134 ?auto_159136 ) ) ( not ( = ?auto_159134 ?auto_159137 ) ) ( not ( = ?auto_159134 ?auto_159138 ) ) ( not ( = ?auto_159134 ?auto_159139 ) ) ( not ( = ?auto_159134 ?auto_159140 ) ) ( not ( = ?auto_159134 ?auto_159141 ) ) ( not ( = ?auto_159135 ?auto_159136 ) ) ( not ( = ?auto_159135 ?auto_159137 ) ) ( not ( = ?auto_159135 ?auto_159138 ) ) ( not ( = ?auto_159135 ?auto_159139 ) ) ( not ( = ?auto_159135 ?auto_159140 ) ) ( not ( = ?auto_159135 ?auto_159141 ) ) ( not ( = ?auto_159136 ?auto_159137 ) ) ( not ( = ?auto_159136 ?auto_159138 ) ) ( not ( = ?auto_159136 ?auto_159139 ) ) ( not ( = ?auto_159136 ?auto_159140 ) ) ( not ( = ?auto_159136 ?auto_159141 ) ) ( not ( = ?auto_159137 ?auto_159138 ) ) ( not ( = ?auto_159137 ?auto_159139 ) ) ( not ( = ?auto_159137 ?auto_159140 ) ) ( not ( = ?auto_159137 ?auto_159141 ) ) ( not ( = ?auto_159138 ?auto_159139 ) ) ( not ( = ?auto_159138 ?auto_159140 ) ) ( not ( = ?auto_159138 ?auto_159141 ) ) ( not ( = ?auto_159139 ?auto_159140 ) ) ( not ( = ?auto_159139 ?auto_159141 ) ) ( not ( = ?auto_159140 ?auto_159141 ) ) ( ON ?auto_159139 ?auto_159140 ) ( ON ?auto_159138 ?auto_159139 ) ( CLEAR ?auto_159136 ) ( ON ?auto_159137 ?auto_159138 ) ( CLEAR ?auto_159137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159133 ?auto_159134 ?auto_159135 ?auto_159136 ?auto_159137 )
      ( MAKE-8PILE ?auto_159133 ?auto_159134 ?auto_159135 ?auto_159136 ?auto_159137 ?auto_159138 ?auto_159139 ?auto_159140 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159167 - BLOCK
      ?auto_159168 - BLOCK
      ?auto_159169 - BLOCK
      ?auto_159170 - BLOCK
      ?auto_159171 - BLOCK
      ?auto_159172 - BLOCK
      ?auto_159173 - BLOCK
      ?auto_159174 - BLOCK
    )
    :vars
    (
      ?auto_159175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159174 ?auto_159175 ) ( ON-TABLE ?auto_159167 ) ( ON ?auto_159168 ?auto_159167 ) ( ON ?auto_159169 ?auto_159168 ) ( not ( = ?auto_159167 ?auto_159168 ) ) ( not ( = ?auto_159167 ?auto_159169 ) ) ( not ( = ?auto_159167 ?auto_159170 ) ) ( not ( = ?auto_159167 ?auto_159171 ) ) ( not ( = ?auto_159167 ?auto_159172 ) ) ( not ( = ?auto_159167 ?auto_159173 ) ) ( not ( = ?auto_159167 ?auto_159174 ) ) ( not ( = ?auto_159167 ?auto_159175 ) ) ( not ( = ?auto_159168 ?auto_159169 ) ) ( not ( = ?auto_159168 ?auto_159170 ) ) ( not ( = ?auto_159168 ?auto_159171 ) ) ( not ( = ?auto_159168 ?auto_159172 ) ) ( not ( = ?auto_159168 ?auto_159173 ) ) ( not ( = ?auto_159168 ?auto_159174 ) ) ( not ( = ?auto_159168 ?auto_159175 ) ) ( not ( = ?auto_159169 ?auto_159170 ) ) ( not ( = ?auto_159169 ?auto_159171 ) ) ( not ( = ?auto_159169 ?auto_159172 ) ) ( not ( = ?auto_159169 ?auto_159173 ) ) ( not ( = ?auto_159169 ?auto_159174 ) ) ( not ( = ?auto_159169 ?auto_159175 ) ) ( not ( = ?auto_159170 ?auto_159171 ) ) ( not ( = ?auto_159170 ?auto_159172 ) ) ( not ( = ?auto_159170 ?auto_159173 ) ) ( not ( = ?auto_159170 ?auto_159174 ) ) ( not ( = ?auto_159170 ?auto_159175 ) ) ( not ( = ?auto_159171 ?auto_159172 ) ) ( not ( = ?auto_159171 ?auto_159173 ) ) ( not ( = ?auto_159171 ?auto_159174 ) ) ( not ( = ?auto_159171 ?auto_159175 ) ) ( not ( = ?auto_159172 ?auto_159173 ) ) ( not ( = ?auto_159172 ?auto_159174 ) ) ( not ( = ?auto_159172 ?auto_159175 ) ) ( not ( = ?auto_159173 ?auto_159174 ) ) ( not ( = ?auto_159173 ?auto_159175 ) ) ( not ( = ?auto_159174 ?auto_159175 ) ) ( ON ?auto_159173 ?auto_159174 ) ( ON ?auto_159172 ?auto_159173 ) ( ON ?auto_159171 ?auto_159172 ) ( CLEAR ?auto_159169 ) ( ON ?auto_159170 ?auto_159171 ) ( CLEAR ?auto_159170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159167 ?auto_159168 ?auto_159169 ?auto_159170 )
      ( MAKE-8PILE ?auto_159167 ?auto_159168 ?auto_159169 ?auto_159170 ?auto_159171 ?auto_159172 ?auto_159173 ?auto_159174 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159201 - BLOCK
      ?auto_159202 - BLOCK
      ?auto_159203 - BLOCK
      ?auto_159204 - BLOCK
      ?auto_159205 - BLOCK
      ?auto_159206 - BLOCK
      ?auto_159207 - BLOCK
      ?auto_159208 - BLOCK
    )
    :vars
    (
      ?auto_159209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159208 ?auto_159209 ) ( ON-TABLE ?auto_159201 ) ( ON ?auto_159202 ?auto_159201 ) ( not ( = ?auto_159201 ?auto_159202 ) ) ( not ( = ?auto_159201 ?auto_159203 ) ) ( not ( = ?auto_159201 ?auto_159204 ) ) ( not ( = ?auto_159201 ?auto_159205 ) ) ( not ( = ?auto_159201 ?auto_159206 ) ) ( not ( = ?auto_159201 ?auto_159207 ) ) ( not ( = ?auto_159201 ?auto_159208 ) ) ( not ( = ?auto_159201 ?auto_159209 ) ) ( not ( = ?auto_159202 ?auto_159203 ) ) ( not ( = ?auto_159202 ?auto_159204 ) ) ( not ( = ?auto_159202 ?auto_159205 ) ) ( not ( = ?auto_159202 ?auto_159206 ) ) ( not ( = ?auto_159202 ?auto_159207 ) ) ( not ( = ?auto_159202 ?auto_159208 ) ) ( not ( = ?auto_159202 ?auto_159209 ) ) ( not ( = ?auto_159203 ?auto_159204 ) ) ( not ( = ?auto_159203 ?auto_159205 ) ) ( not ( = ?auto_159203 ?auto_159206 ) ) ( not ( = ?auto_159203 ?auto_159207 ) ) ( not ( = ?auto_159203 ?auto_159208 ) ) ( not ( = ?auto_159203 ?auto_159209 ) ) ( not ( = ?auto_159204 ?auto_159205 ) ) ( not ( = ?auto_159204 ?auto_159206 ) ) ( not ( = ?auto_159204 ?auto_159207 ) ) ( not ( = ?auto_159204 ?auto_159208 ) ) ( not ( = ?auto_159204 ?auto_159209 ) ) ( not ( = ?auto_159205 ?auto_159206 ) ) ( not ( = ?auto_159205 ?auto_159207 ) ) ( not ( = ?auto_159205 ?auto_159208 ) ) ( not ( = ?auto_159205 ?auto_159209 ) ) ( not ( = ?auto_159206 ?auto_159207 ) ) ( not ( = ?auto_159206 ?auto_159208 ) ) ( not ( = ?auto_159206 ?auto_159209 ) ) ( not ( = ?auto_159207 ?auto_159208 ) ) ( not ( = ?auto_159207 ?auto_159209 ) ) ( not ( = ?auto_159208 ?auto_159209 ) ) ( ON ?auto_159207 ?auto_159208 ) ( ON ?auto_159206 ?auto_159207 ) ( ON ?auto_159205 ?auto_159206 ) ( ON ?auto_159204 ?auto_159205 ) ( CLEAR ?auto_159202 ) ( ON ?auto_159203 ?auto_159204 ) ( CLEAR ?auto_159203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159201 ?auto_159202 ?auto_159203 )
      ( MAKE-8PILE ?auto_159201 ?auto_159202 ?auto_159203 ?auto_159204 ?auto_159205 ?auto_159206 ?auto_159207 ?auto_159208 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159235 - BLOCK
      ?auto_159236 - BLOCK
      ?auto_159237 - BLOCK
      ?auto_159238 - BLOCK
      ?auto_159239 - BLOCK
      ?auto_159240 - BLOCK
      ?auto_159241 - BLOCK
      ?auto_159242 - BLOCK
    )
    :vars
    (
      ?auto_159243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159242 ?auto_159243 ) ( ON-TABLE ?auto_159235 ) ( not ( = ?auto_159235 ?auto_159236 ) ) ( not ( = ?auto_159235 ?auto_159237 ) ) ( not ( = ?auto_159235 ?auto_159238 ) ) ( not ( = ?auto_159235 ?auto_159239 ) ) ( not ( = ?auto_159235 ?auto_159240 ) ) ( not ( = ?auto_159235 ?auto_159241 ) ) ( not ( = ?auto_159235 ?auto_159242 ) ) ( not ( = ?auto_159235 ?auto_159243 ) ) ( not ( = ?auto_159236 ?auto_159237 ) ) ( not ( = ?auto_159236 ?auto_159238 ) ) ( not ( = ?auto_159236 ?auto_159239 ) ) ( not ( = ?auto_159236 ?auto_159240 ) ) ( not ( = ?auto_159236 ?auto_159241 ) ) ( not ( = ?auto_159236 ?auto_159242 ) ) ( not ( = ?auto_159236 ?auto_159243 ) ) ( not ( = ?auto_159237 ?auto_159238 ) ) ( not ( = ?auto_159237 ?auto_159239 ) ) ( not ( = ?auto_159237 ?auto_159240 ) ) ( not ( = ?auto_159237 ?auto_159241 ) ) ( not ( = ?auto_159237 ?auto_159242 ) ) ( not ( = ?auto_159237 ?auto_159243 ) ) ( not ( = ?auto_159238 ?auto_159239 ) ) ( not ( = ?auto_159238 ?auto_159240 ) ) ( not ( = ?auto_159238 ?auto_159241 ) ) ( not ( = ?auto_159238 ?auto_159242 ) ) ( not ( = ?auto_159238 ?auto_159243 ) ) ( not ( = ?auto_159239 ?auto_159240 ) ) ( not ( = ?auto_159239 ?auto_159241 ) ) ( not ( = ?auto_159239 ?auto_159242 ) ) ( not ( = ?auto_159239 ?auto_159243 ) ) ( not ( = ?auto_159240 ?auto_159241 ) ) ( not ( = ?auto_159240 ?auto_159242 ) ) ( not ( = ?auto_159240 ?auto_159243 ) ) ( not ( = ?auto_159241 ?auto_159242 ) ) ( not ( = ?auto_159241 ?auto_159243 ) ) ( not ( = ?auto_159242 ?auto_159243 ) ) ( ON ?auto_159241 ?auto_159242 ) ( ON ?auto_159240 ?auto_159241 ) ( ON ?auto_159239 ?auto_159240 ) ( ON ?auto_159238 ?auto_159239 ) ( ON ?auto_159237 ?auto_159238 ) ( CLEAR ?auto_159235 ) ( ON ?auto_159236 ?auto_159237 ) ( CLEAR ?auto_159236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159235 ?auto_159236 )
      ( MAKE-8PILE ?auto_159235 ?auto_159236 ?auto_159237 ?auto_159238 ?auto_159239 ?auto_159240 ?auto_159241 ?auto_159242 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159269 - BLOCK
      ?auto_159270 - BLOCK
      ?auto_159271 - BLOCK
      ?auto_159272 - BLOCK
      ?auto_159273 - BLOCK
      ?auto_159274 - BLOCK
      ?auto_159275 - BLOCK
      ?auto_159276 - BLOCK
    )
    :vars
    (
      ?auto_159277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159276 ?auto_159277 ) ( not ( = ?auto_159269 ?auto_159270 ) ) ( not ( = ?auto_159269 ?auto_159271 ) ) ( not ( = ?auto_159269 ?auto_159272 ) ) ( not ( = ?auto_159269 ?auto_159273 ) ) ( not ( = ?auto_159269 ?auto_159274 ) ) ( not ( = ?auto_159269 ?auto_159275 ) ) ( not ( = ?auto_159269 ?auto_159276 ) ) ( not ( = ?auto_159269 ?auto_159277 ) ) ( not ( = ?auto_159270 ?auto_159271 ) ) ( not ( = ?auto_159270 ?auto_159272 ) ) ( not ( = ?auto_159270 ?auto_159273 ) ) ( not ( = ?auto_159270 ?auto_159274 ) ) ( not ( = ?auto_159270 ?auto_159275 ) ) ( not ( = ?auto_159270 ?auto_159276 ) ) ( not ( = ?auto_159270 ?auto_159277 ) ) ( not ( = ?auto_159271 ?auto_159272 ) ) ( not ( = ?auto_159271 ?auto_159273 ) ) ( not ( = ?auto_159271 ?auto_159274 ) ) ( not ( = ?auto_159271 ?auto_159275 ) ) ( not ( = ?auto_159271 ?auto_159276 ) ) ( not ( = ?auto_159271 ?auto_159277 ) ) ( not ( = ?auto_159272 ?auto_159273 ) ) ( not ( = ?auto_159272 ?auto_159274 ) ) ( not ( = ?auto_159272 ?auto_159275 ) ) ( not ( = ?auto_159272 ?auto_159276 ) ) ( not ( = ?auto_159272 ?auto_159277 ) ) ( not ( = ?auto_159273 ?auto_159274 ) ) ( not ( = ?auto_159273 ?auto_159275 ) ) ( not ( = ?auto_159273 ?auto_159276 ) ) ( not ( = ?auto_159273 ?auto_159277 ) ) ( not ( = ?auto_159274 ?auto_159275 ) ) ( not ( = ?auto_159274 ?auto_159276 ) ) ( not ( = ?auto_159274 ?auto_159277 ) ) ( not ( = ?auto_159275 ?auto_159276 ) ) ( not ( = ?auto_159275 ?auto_159277 ) ) ( not ( = ?auto_159276 ?auto_159277 ) ) ( ON ?auto_159275 ?auto_159276 ) ( ON ?auto_159274 ?auto_159275 ) ( ON ?auto_159273 ?auto_159274 ) ( ON ?auto_159272 ?auto_159273 ) ( ON ?auto_159271 ?auto_159272 ) ( ON ?auto_159270 ?auto_159271 ) ( ON ?auto_159269 ?auto_159270 ) ( CLEAR ?auto_159269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159269 )
      ( MAKE-8PILE ?auto_159269 ?auto_159270 ?auto_159271 ?auto_159272 ?auto_159273 ?auto_159274 ?auto_159275 ?auto_159276 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_159304 - BLOCK
      ?auto_159305 - BLOCK
      ?auto_159306 - BLOCK
      ?auto_159307 - BLOCK
      ?auto_159308 - BLOCK
      ?auto_159309 - BLOCK
      ?auto_159310 - BLOCK
      ?auto_159311 - BLOCK
      ?auto_159312 - BLOCK
    )
    :vars
    (
      ?auto_159313 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_159311 ) ( ON ?auto_159312 ?auto_159313 ) ( CLEAR ?auto_159312 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159304 ) ( ON ?auto_159305 ?auto_159304 ) ( ON ?auto_159306 ?auto_159305 ) ( ON ?auto_159307 ?auto_159306 ) ( ON ?auto_159308 ?auto_159307 ) ( ON ?auto_159309 ?auto_159308 ) ( ON ?auto_159310 ?auto_159309 ) ( ON ?auto_159311 ?auto_159310 ) ( not ( = ?auto_159304 ?auto_159305 ) ) ( not ( = ?auto_159304 ?auto_159306 ) ) ( not ( = ?auto_159304 ?auto_159307 ) ) ( not ( = ?auto_159304 ?auto_159308 ) ) ( not ( = ?auto_159304 ?auto_159309 ) ) ( not ( = ?auto_159304 ?auto_159310 ) ) ( not ( = ?auto_159304 ?auto_159311 ) ) ( not ( = ?auto_159304 ?auto_159312 ) ) ( not ( = ?auto_159304 ?auto_159313 ) ) ( not ( = ?auto_159305 ?auto_159306 ) ) ( not ( = ?auto_159305 ?auto_159307 ) ) ( not ( = ?auto_159305 ?auto_159308 ) ) ( not ( = ?auto_159305 ?auto_159309 ) ) ( not ( = ?auto_159305 ?auto_159310 ) ) ( not ( = ?auto_159305 ?auto_159311 ) ) ( not ( = ?auto_159305 ?auto_159312 ) ) ( not ( = ?auto_159305 ?auto_159313 ) ) ( not ( = ?auto_159306 ?auto_159307 ) ) ( not ( = ?auto_159306 ?auto_159308 ) ) ( not ( = ?auto_159306 ?auto_159309 ) ) ( not ( = ?auto_159306 ?auto_159310 ) ) ( not ( = ?auto_159306 ?auto_159311 ) ) ( not ( = ?auto_159306 ?auto_159312 ) ) ( not ( = ?auto_159306 ?auto_159313 ) ) ( not ( = ?auto_159307 ?auto_159308 ) ) ( not ( = ?auto_159307 ?auto_159309 ) ) ( not ( = ?auto_159307 ?auto_159310 ) ) ( not ( = ?auto_159307 ?auto_159311 ) ) ( not ( = ?auto_159307 ?auto_159312 ) ) ( not ( = ?auto_159307 ?auto_159313 ) ) ( not ( = ?auto_159308 ?auto_159309 ) ) ( not ( = ?auto_159308 ?auto_159310 ) ) ( not ( = ?auto_159308 ?auto_159311 ) ) ( not ( = ?auto_159308 ?auto_159312 ) ) ( not ( = ?auto_159308 ?auto_159313 ) ) ( not ( = ?auto_159309 ?auto_159310 ) ) ( not ( = ?auto_159309 ?auto_159311 ) ) ( not ( = ?auto_159309 ?auto_159312 ) ) ( not ( = ?auto_159309 ?auto_159313 ) ) ( not ( = ?auto_159310 ?auto_159311 ) ) ( not ( = ?auto_159310 ?auto_159312 ) ) ( not ( = ?auto_159310 ?auto_159313 ) ) ( not ( = ?auto_159311 ?auto_159312 ) ) ( not ( = ?auto_159311 ?auto_159313 ) ) ( not ( = ?auto_159312 ?auto_159313 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159312 ?auto_159313 )
      ( !STACK ?auto_159312 ?auto_159311 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_159342 - BLOCK
      ?auto_159343 - BLOCK
      ?auto_159344 - BLOCK
      ?auto_159345 - BLOCK
      ?auto_159346 - BLOCK
      ?auto_159347 - BLOCK
      ?auto_159348 - BLOCK
      ?auto_159349 - BLOCK
      ?auto_159350 - BLOCK
    )
    :vars
    (
      ?auto_159351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159350 ?auto_159351 ) ( ON-TABLE ?auto_159342 ) ( ON ?auto_159343 ?auto_159342 ) ( ON ?auto_159344 ?auto_159343 ) ( ON ?auto_159345 ?auto_159344 ) ( ON ?auto_159346 ?auto_159345 ) ( ON ?auto_159347 ?auto_159346 ) ( ON ?auto_159348 ?auto_159347 ) ( not ( = ?auto_159342 ?auto_159343 ) ) ( not ( = ?auto_159342 ?auto_159344 ) ) ( not ( = ?auto_159342 ?auto_159345 ) ) ( not ( = ?auto_159342 ?auto_159346 ) ) ( not ( = ?auto_159342 ?auto_159347 ) ) ( not ( = ?auto_159342 ?auto_159348 ) ) ( not ( = ?auto_159342 ?auto_159349 ) ) ( not ( = ?auto_159342 ?auto_159350 ) ) ( not ( = ?auto_159342 ?auto_159351 ) ) ( not ( = ?auto_159343 ?auto_159344 ) ) ( not ( = ?auto_159343 ?auto_159345 ) ) ( not ( = ?auto_159343 ?auto_159346 ) ) ( not ( = ?auto_159343 ?auto_159347 ) ) ( not ( = ?auto_159343 ?auto_159348 ) ) ( not ( = ?auto_159343 ?auto_159349 ) ) ( not ( = ?auto_159343 ?auto_159350 ) ) ( not ( = ?auto_159343 ?auto_159351 ) ) ( not ( = ?auto_159344 ?auto_159345 ) ) ( not ( = ?auto_159344 ?auto_159346 ) ) ( not ( = ?auto_159344 ?auto_159347 ) ) ( not ( = ?auto_159344 ?auto_159348 ) ) ( not ( = ?auto_159344 ?auto_159349 ) ) ( not ( = ?auto_159344 ?auto_159350 ) ) ( not ( = ?auto_159344 ?auto_159351 ) ) ( not ( = ?auto_159345 ?auto_159346 ) ) ( not ( = ?auto_159345 ?auto_159347 ) ) ( not ( = ?auto_159345 ?auto_159348 ) ) ( not ( = ?auto_159345 ?auto_159349 ) ) ( not ( = ?auto_159345 ?auto_159350 ) ) ( not ( = ?auto_159345 ?auto_159351 ) ) ( not ( = ?auto_159346 ?auto_159347 ) ) ( not ( = ?auto_159346 ?auto_159348 ) ) ( not ( = ?auto_159346 ?auto_159349 ) ) ( not ( = ?auto_159346 ?auto_159350 ) ) ( not ( = ?auto_159346 ?auto_159351 ) ) ( not ( = ?auto_159347 ?auto_159348 ) ) ( not ( = ?auto_159347 ?auto_159349 ) ) ( not ( = ?auto_159347 ?auto_159350 ) ) ( not ( = ?auto_159347 ?auto_159351 ) ) ( not ( = ?auto_159348 ?auto_159349 ) ) ( not ( = ?auto_159348 ?auto_159350 ) ) ( not ( = ?auto_159348 ?auto_159351 ) ) ( not ( = ?auto_159349 ?auto_159350 ) ) ( not ( = ?auto_159349 ?auto_159351 ) ) ( not ( = ?auto_159350 ?auto_159351 ) ) ( CLEAR ?auto_159348 ) ( ON ?auto_159349 ?auto_159350 ) ( CLEAR ?auto_159349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159342 ?auto_159343 ?auto_159344 ?auto_159345 ?auto_159346 ?auto_159347 ?auto_159348 ?auto_159349 )
      ( MAKE-9PILE ?auto_159342 ?auto_159343 ?auto_159344 ?auto_159345 ?auto_159346 ?auto_159347 ?auto_159348 ?auto_159349 ?auto_159350 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_159380 - BLOCK
      ?auto_159381 - BLOCK
      ?auto_159382 - BLOCK
      ?auto_159383 - BLOCK
      ?auto_159384 - BLOCK
      ?auto_159385 - BLOCK
      ?auto_159386 - BLOCK
      ?auto_159387 - BLOCK
      ?auto_159388 - BLOCK
    )
    :vars
    (
      ?auto_159389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159388 ?auto_159389 ) ( ON-TABLE ?auto_159380 ) ( ON ?auto_159381 ?auto_159380 ) ( ON ?auto_159382 ?auto_159381 ) ( ON ?auto_159383 ?auto_159382 ) ( ON ?auto_159384 ?auto_159383 ) ( ON ?auto_159385 ?auto_159384 ) ( not ( = ?auto_159380 ?auto_159381 ) ) ( not ( = ?auto_159380 ?auto_159382 ) ) ( not ( = ?auto_159380 ?auto_159383 ) ) ( not ( = ?auto_159380 ?auto_159384 ) ) ( not ( = ?auto_159380 ?auto_159385 ) ) ( not ( = ?auto_159380 ?auto_159386 ) ) ( not ( = ?auto_159380 ?auto_159387 ) ) ( not ( = ?auto_159380 ?auto_159388 ) ) ( not ( = ?auto_159380 ?auto_159389 ) ) ( not ( = ?auto_159381 ?auto_159382 ) ) ( not ( = ?auto_159381 ?auto_159383 ) ) ( not ( = ?auto_159381 ?auto_159384 ) ) ( not ( = ?auto_159381 ?auto_159385 ) ) ( not ( = ?auto_159381 ?auto_159386 ) ) ( not ( = ?auto_159381 ?auto_159387 ) ) ( not ( = ?auto_159381 ?auto_159388 ) ) ( not ( = ?auto_159381 ?auto_159389 ) ) ( not ( = ?auto_159382 ?auto_159383 ) ) ( not ( = ?auto_159382 ?auto_159384 ) ) ( not ( = ?auto_159382 ?auto_159385 ) ) ( not ( = ?auto_159382 ?auto_159386 ) ) ( not ( = ?auto_159382 ?auto_159387 ) ) ( not ( = ?auto_159382 ?auto_159388 ) ) ( not ( = ?auto_159382 ?auto_159389 ) ) ( not ( = ?auto_159383 ?auto_159384 ) ) ( not ( = ?auto_159383 ?auto_159385 ) ) ( not ( = ?auto_159383 ?auto_159386 ) ) ( not ( = ?auto_159383 ?auto_159387 ) ) ( not ( = ?auto_159383 ?auto_159388 ) ) ( not ( = ?auto_159383 ?auto_159389 ) ) ( not ( = ?auto_159384 ?auto_159385 ) ) ( not ( = ?auto_159384 ?auto_159386 ) ) ( not ( = ?auto_159384 ?auto_159387 ) ) ( not ( = ?auto_159384 ?auto_159388 ) ) ( not ( = ?auto_159384 ?auto_159389 ) ) ( not ( = ?auto_159385 ?auto_159386 ) ) ( not ( = ?auto_159385 ?auto_159387 ) ) ( not ( = ?auto_159385 ?auto_159388 ) ) ( not ( = ?auto_159385 ?auto_159389 ) ) ( not ( = ?auto_159386 ?auto_159387 ) ) ( not ( = ?auto_159386 ?auto_159388 ) ) ( not ( = ?auto_159386 ?auto_159389 ) ) ( not ( = ?auto_159387 ?auto_159388 ) ) ( not ( = ?auto_159387 ?auto_159389 ) ) ( not ( = ?auto_159388 ?auto_159389 ) ) ( ON ?auto_159387 ?auto_159388 ) ( CLEAR ?auto_159385 ) ( ON ?auto_159386 ?auto_159387 ) ( CLEAR ?auto_159386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159380 ?auto_159381 ?auto_159382 ?auto_159383 ?auto_159384 ?auto_159385 ?auto_159386 )
      ( MAKE-9PILE ?auto_159380 ?auto_159381 ?auto_159382 ?auto_159383 ?auto_159384 ?auto_159385 ?auto_159386 ?auto_159387 ?auto_159388 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_159418 - BLOCK
      ?auto_159419 - BLOCK
      ?auto_159420 - BLOCK
      ?auto_159421 - BLOCK
      ?auto_159422 - BLOCK
      ?auto_159423 - BLOCK
      ?auto_159424 - BLOCK
      ?auto_159425 - BLOCK
      ?auto_159426 - BLOCK
    )
    :vars
    (
      ?auto_159427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159426 ?auto_159427 ) ( ON-TABLE ?auto_159418 ) ( ON ?auto_159419 ?auto_159418 ) ( ON ?auto_159420 ?auto_159419 ) ( ON ?auto_159421 ?auto_159420 ) ( ON ?auto_159422 ?auto_159421 ) ( not ( = ?auto_159418 ?auto_159419 ) ) ( not ( = ?auto_159418 ?auto_159420 ) ) ( not ( = ?auto_159418 ?auto_159421 ) ) ( not ( = ?auto_159418 ?auto_159422 ) ) ( not ( = ?auto_159418 ?auto_159423 ) ) ( not ( = ?auto_159418 ?auto_159424 ) ) ( not ( = ?auto_159418 ?auto_159425 ) ) ( not ( = ?auto_159418 ?auto_159426 ) ) ( not ( = ?auto_159418 ?auto_159427 ) ) ( not ( = ?auto_159419 ?auto_159420 ) ) ( not ( = ?auto_159419 ?auto_159421 ) ) ( not ( = ?auto_159419 ?auto_159422 ) ) ( not ( = ?auto_159419 ?auto_159423 ) ) ( not ( = ?auto_159419 ?auto_159424 ) ) ( not ( = ?auto_159419 ?auto_159425 ) ) ( not ( = ?auto_159419 ?auto_159426 ) ) ( not ( = ?auto_159419 ?auto_159427 ) ) ( not ( = ?auto_159420 ?auto_159421 ) ) ( not ( = ?auto_159420 ?auto_159422 ) ) ( not ( = ?auto_159420 ?auto_159423 ) ) ( not ( = ?auto_159420 ?auto_159424 ) ) ( not ( = ?auto_159420 ?auto_159425 ) ) ( not ( = ?auto_159420 ?auto_159426 ) ) ( not ( = ?auto_159420 ?auto_159427 ) ) ( not ( = ?auto_159421 ?auto_159422 ) ) ( not ( = ?auto_159421 ?auto_159423 ) ) ( not ( = ?auto_159421 ?auto_159424 ) ) ( not ( = ?auto_159421 ?auto_159425 ) ) ( not ( = ?auto_159421 ?auto_159426 ) ) ( not ( = ?auto_159421 ?auto_159427 ) ) ( not ( = ?auto_159422 ?auto_159423 ) ) ( not ( = ?auto_159422 ?auto_159424 ) ) ( not ( = ?auto_159422 ?auto_159425 ) ) ( not ( = ?auto_159422 ?auto_159426 ) ) ( not ( = ?auto_159422 ?auto_159427 ) ) ( not ( = ?auto_159423 ?auto_159424 ) ) ( not ( = ?auto_159423 ?auto_159425 ) ) ( not ( = ?auto_159423 ?auto_159426 ) ) ( not ( = ?auto_159423 ?auto_159427 ) ) ( not ( = ?auto_159424 ?auto_159425 ) ) ( not ( = ?auto_159424 ?auto_159426 ) ) ( not ( = ?auto_159424 ?auto_159427 ) ) ( not ( = ?auto_159425 ?auto_159426 ) ) ( not ( = ?auto_159425 ?auto_159427 ) ) ( not ( = ?auto_159426 ?auto_159427 ) ) ( ON ?auto_159425 ?auto_159426 ) ( ON ?auto_159424 ?auto_159425 ) ( CLEAR ?auto_159422 ) ( ON ?auto_159423 ?auto_159424 ) ( CLEAR ?auto_159423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159418 ?auto_159419 ?auto_159420 ?auto_159421 ?auto_159422 ?auto_159423 )
      ( MAKE-9PILE ?auto_159418 ?auto_159419 ?auto_159420 ?auto_159421 ?auto_159422 ?auto_159423 ?auto_159424 ?auto_159425 ?auto_159426 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_159456 - BLOCK
      ?auto_159457 - BLOCK
      ?auto_159458 - BLOCK
      ?auto_159459 - BLOCK
      ?auto_159460 - BLOCK
      ?auto_159461 - BLOCK
      ?auto_159462 - BLOCK
      ?auto_159463 - BLOCK
      ?auto_159464 - BLOCK
    )
    :vars
    (
      ?auto_159465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159464 ?auto_159465 ) ( ON-TABLE ?auto_159456 ) ( ON ?auto_159457 ?auto_159456 ) ( ON ?auto_159458 ?auto_159457 ) ( ON ?auto_159459 ?auto_159458 ) ( not ( = ?auto_159456 ?auto_159457 ) ) ( not ( = ?auto_159456 ?auto_159458 ) ) ( not ( = ?auto_159456 ?auto_159459 ) ) ( not ( = ?auto_159456 ?auto_159460 ) ) ( not ( = ?auto_159456 ?auto_159461 ) ) ( not ( = ?auto_159456 ?auto_159462 ) ) ( not ( = ?auto_159456 ?auto_159463 ) ) ( not ( = ?auto_159456 ?auto_159464 ) ) ( not ( = ?auto_159456 ?auto_159465 ) ) ( not ( = ?auto_159457 ?auto_159458 ) ) ( not ( = ?auto_159457 ?auto_159459 ) ) ( not ( = ?auto_159457 ?auto_159460 ) ) ( not ( = ?auto_159457 ?auto_159461 ) ) ( not ( = ?auto_159457 ?auto_159462 ) ) ( not ( = ?auto_159457 ?auto_159463 ) ) ( not ( = ?auto_159457 ?auto_159464 ) ) ( not ( = ?auto_159457 ?auto_159465 ) ) ( not ( = ?auto_159458 ?auto_159459 ) ) ( not ( = ?auto_159458 ?auto_159460 ) ) ( not ( = ?auto_159458 ?auto_159461 ) ) ( not ( = ?auto_159458 ?auto_159462 ) ) ( not ( = ?auto_159458 ?auto_159463 ) ) ( not ( = ?auto_159458 ?auto_159464 ) ) ( not ( = ?auto_159458 ?auto_159465 ) ) ( not ( = ?auto_159459 ?auto_159460 ) ) ( not ( = ?auto_159459 ?auto_159461 ) ) ( not ( = ?auto_159459 ?auto_159462 ) ) ( not ( = ?auto_159459 ?auto_159463 ) ) ( not ( = ?auto_159459 ?auto_159464 ) ) ( not ( = ?auto_159459 ?auto_159465 ) ) ( not ( = ?auto_159460 ?auto_159461 ) ) ( not ( = ?auto_159460 ?auto_159462 ) ) ( not ( = ?auto_159460 ?auto_159463 ) ) ( not ( = ?auto_159460 ?auto_159464 ) ) ( not ( = ?auto_159460 ?auto_159465 ) ) ( not ( = ?auto_159461 ?auto_159462 ) ) ( not ( = ?auto_159461 ?auto_159463 ) ) ( not ( = ?auto_159461 ?auto_159464 ) ) ( not ( = ?auto_159461 ?auto_159465 ) ) ( not ( = ?auto_159462 ?auto_159463 ) ) ( not ( = ?auto_159462 ?auto_159464 ) ) ( not ( = ?auto_159462 ?auto_159465 ) ) ( not ( = ?auto_159463 ?auto_159464 ) ) ( not ( = ?auto_159463 ?auto_159465 ) ) ( not ( = ?auto_159464 ?auto_159465 ) ) ( ON ?auto_159463 ?auto_159464 ) ( ON ?auto_159462 ?auto_159463 ) ( ON ?auto_159461 ?auto_159462 ) ( CLEAR ?auto_159459 ) ( ON ?auto_159460 ?auto_159461 ) ( CLEAR ?auto_159460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159456 ?auto_159457 ?auto_159458 ?auto_159459 ?auto_159460 )
      ( MAKE-9PILE ?auto_159456 ?auto_159457 ?auto_159458 ?auto_159459 ?auto_159460 ?auto_159461 ?auto_159462 ?auto_159463 ?auto_159464 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_159494 - BLOCK
      ?auto_159495 - BLOCK
      ?auto_159496 - BLOCK
      ?auto_159497 - BLOCK
      ?auto_159498 - BLOCK
      ?auto_159499 - BLOCK
      ?auto_159500 - BLOCK
      ?auto_159501 - BLOCK
      ?auto_159502 - BLOCK
    )
    :vars
    (
      ?auto_159503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159502 ?auto_159503 ) ( ON-TABLE ?auto_159494 ) ( ON ?auto_159495 ?auto_159494 ) ( ON ?auto_159496 ?auto_159495 ) ( not ( = ?auto_159494 ?auto_159495 ) ) ( not ( = ?auto_159494 ?auto_159496 ) ) ( not ( = ?auto_159494 ?auto_159497 ) ) ( not ( = ?auto_159494 ?auto_159498 ) ) ( not ( = ?auto_159494 ?auto_159499 ) ) ( not ( = ?auto_159494 ?auto_159500 ) ) ( not ( = ?auto_159494 ?auto_159501 ) ) ( not ( = ?auto_159494 ?auto_159502 ) ) ( not ( = ?auto_159494 ?auto_159503 ) ) ( not ( = ?auto_159495 ?auto_159496 ) ) ( not ( = ?auto_159495 ?auto_159497 ) ) ( not ( = ?auto_159495 ?auto_159498 ) ) ( not ( = ?auto_159495 ?auto_159499 ) ) ( not ( = ?auto_159495 ?auto_159500 ) ) ( not ( = ?auto_159495 ?auto_159501 ) ) ( not ( = ?auto_159495 ?auto_159502 ) ) ( not ( = ?auto_159495 ?auto_159503 ) ) ( not ( = ?auto_159496 ?auto_159497 ) ) ( not ( = ?auto_159496 ?auto_159498 ) ) ( not ( = ?auto_159496 ?auto_159499 ) ) ( not ( = ?auto_159496 ?auto_159500 ) ) ( not ( = ?auto_159496 ?auto_159501 ) ) ( not ( = ?auto_159496 ?auto_159502 ) ) ( not ( = ?auto_159496 ?auto_159503 ) ) ( not ( = ?auto_159497 ?auto_159498 ) ) ( not ( = ?auto_159497 ?auto_159499 ) ) ( not ( = ?auto_159497 ?auto_159500 ) ) ( not ( = ?auto_159497 ?auto_159501 ) ) ( not ( = ?auto_159497 ?auto_159502 ) ) ( not ( = ?auto_159497 ?auto_159503 ) ) ( not ( = ?auto_159498 ?auto_159499 ) ) ( not ( = ?auto_159498 ?auto_159500 ) ) ( not ( = ?auto_159498 ?auto_159501 ) ) ( not ( = ?auto_159498 ?auto_159502 ) ) ( not ( = ?auto_159498 ?auto_159503 ) ) ( not ( = ?auto_159499 ?auto_159500 ) ) ( not ( = ?auto_159499 ?auto_159501 ) ) ( not ( = ?auto_159499 ?auto_159502 ) ) ( not ( = ?auto_159499 ?auto_159503 ) ) ( not ( = ?auto_159500 ?auto_159501 ) ) ( not ( = ?auto_159500 ?auto_159502 ) ) ( not ( = ?auto_159500 ?auto_159503 ) ) ( not ( = ?auto_159501 ?auto_159502 ) ) ( not ( = ?auto_159501 ?auto_159503 ) ) ( not ( = ?auto_159502 ?auto_159503 ) ) ( ON ?auto_159501 ?auto_159502 ) ( ON ?auto_159500 ?auto_159501 ) ( ON ?auto_159499 ?auto_159500 ) ( ON ?auto_159498 ?auto_159499 ) ( CLEAR ?auto_159496 ) ( ON ?auto_159497 ?auto_159498 ) ( CLEAR ?auto_159497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159494 ?auto_159495 ?auto_159496 ?auto_159497 )
      ( MAKE-9PILE ?auto_159494 ?auto_159495 ?auto_159496 ?auto_159497 ?auto_159498 ?auto_159499 ?auto_159500 ?auto_159501 ?auto_159502 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_159532 - BLOCK
      ?auto_159533 - BLOCK
      ?auto_159534 - BLOCK
      ?auto_159535 - BLOCK
      ?auto_159536 - BLOCK
      ?auto_159537 - BLOCK
      ?auto_159538 - BLOCK
      ?auto_159539 - BLOCK
      ?auto_159540 - BLOCK
    )
    :vars
    (
      ?auto_159541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159540 ?auto_159541 ) ( ON-TABLE ?auto_159532 ) ( ON ?auto_159533 ?auto_159532 ) ( not ( = ?auto_159532 ?auto_159533 ) ) ( not ( = ?auto_159532 ?auto_159534 ) ) ( not ( = ?auto_159532 ?auto_159535 ) ) ( not ( = ?auto_159532 ?auto_159536 ) ) ( not ( = ?auto_159532 ?auto_159537 ) ) ( not ( = ?auto_159532 ?auto_159538 ) ) ( not ( = ?auto_159532 ?auto_159539 ) ) ( not ( = ?auto_159532 ?auto_159540 ) ) ( not ( = ?auto_159532 ?auto_159541 ) ) ( not ( = ?auto_159533 ?auto_159534 ) ) ( not ( = ?auto_159533 ?auto_159535 ) ) ( not ( = ?auto_159533 ?auto_159536 ) ) ( not ( = ?auto_159533 ?auto_159537 ) ) ( not ( = ?auto_159533 ?auto_159538 ) ) ( not ( = ?auto_159533 ?auto_159539 ) ) ( not ( = ?auto_159533 ?auto_159540 ) ) ( not ( = ?auto_159533 ?auto_159541 ) ) ( not ( = ?auto_159534 ?auto_159535 ) ) ( not ( = ?auto_159534 ?auto_159536 ) ) ( not ( = ?auto_159534 ?auto_159537 ) ) ( not ( = ?auto_159534 ?auto_159538 ) ) ( not ( = ?auto_159534 ?auto_159539 ) ) ( not ( = ?auto_159534 ?auto_159540 ) ) ( not ( = ?auto_159534 ?auto_159541 ) ) ( not ( = ?auto_159535 ?auto_159536 ) ) ( not ( = ?auto_159535 ?auto_159537 ) ) ( not ( = ?auto_159535 ?auto_159538 ) ) ( not ( = ?auto_159535 ?auto_159539 ) ) ( not ( = ?auto_159535 ?auto_159540 ) ) ( not ( = ?auto_159535 ?auto_159541 ) ) ( not ( = ?auto_159536 ?auto_159537 ) ) ( not ( = ?auto_159536 ?auto_159538 ) ) ( not ( = ?auto_159536 ?auto_159539 ) ) ( not ( = ?auto_159536 ?auto_159540 ) ) ( not ( = ?auto_159536 ?auto_159541 ) ) ( not ( = ?auto_159537 ?auto_159538 ) ) ( not ( = ?auto_159537 ?auto_159539 ) ) ( not ( = ?auto_159537 ?auto_159540 ) ) ( not ( = ?auto_159537 ?auto_159541 ) ) ( not ( = ?auto_159538 ?auto_159539 ) ) ( not ( = ?auto_159538 ?auto_159540 ) ) ( not ( = ?auto_159538 ?auto_159541 ) ) ( not ( = ?auto_159539 ?auto_159540 ) ) ( not ( = ?auto_159539 ?auto_159541 ) ) ( not ( = ?auto_159540 ?auto_159541 ) ) ( ON ?auto_159539 ?auto_159540 ) ( ON ?auto_159538 ?auto_159539 ) ( ON ?auto_159537 ?auto_159538 ) ( ON ?auto_159536 ?auto_159537 ) ( ON ?auto_159535 ?auto_159536 ) ( CLEAR ?auto_159533 ) ( ON ?auto_159534 ?auto_159535 ) ( CLEAR ?auto_159534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159532 ?auto_159533 ?auto_159534 )
      ( MAKE-9PILE ?auto_159532 ?auto_159533 ?auto_159534 ?auto_159535 ?auto_159536 ?auto_159537 ?auto_159538 ?auto_159539 ?auto_159540 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_159570 - BLOCK
      ?auto_159571 - BLOCK
      ?auto_159572 - BLOCK
      ?auto_159573 - BLOCK
      ?auto_159574 - BLOCK
      ?auto_159575 - BLOCK
      ?auto_159576 - BLOCK
      ?auto_159577 - BLOCK
      ?auto_159578 - BLOCK
    )
    :vars
    (
      ?auto_159579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159578 ?auto_159579 ) ( ON-TABLE ?auto_159570 ) ( not ( = ?auto_159570 ?auto_159571 ) ) ( not ( = ?auto_159570 ?auto_159572 ) ) ( not ( = ?auto_159570 ?auto_159573 ) ) ( not ( = ?auto_159570 ?auto_159574 ) ) ( not ( = ?auto_159570 ?auto_159575 ) ) ( not ( = ?auto_159570 ?auto_159576 ) ) ( not ( = ?auto_159570 ?auto_159577 ) ) ( not ( = ?auto_159570 ?auto_159578 ) ) ( not ( = ?auto_159570 ?auto_159579 ) ) ( not ( = ?auto_159571 ?auto_159572 ) ) ( not ( = ?auto_159571 ?auto_159573 ) ) ( not ( = ?auto_159571 ?auto_159574 ) ) ( not ( = ?auto_159571 ?auto_159575 ) ) ( not ( = ?auto_159571 ?auto_159576 ) ) ( not ( = ?auto_159571 ?auto_159577 ) ) ( not ( = ?auto_159571 ?auto_159578 ) ) ( not ( = ?auto_159571 ?auto_159579 ) ) ( not ( = ?auto_159572 ?auto_159573 ) ) ( not ( = ?auto_159572 ?auto_159574 ) ) ( not ( = ?auto_159572 ?auto_159575 ) ) ( not ( = ?auto_159572 ?auto_159576 ) ) ( not ( = ?auto_159572 ?auto_159577 ) ) ( not ( = ?auto_159572 ?auto_159578 ) ) ( not ( = ?auto_159572 ?auto_159579 ) ) ( not ( = ?auto_159573 ?auto_159574 ) ) ( not ( = ?auto_159573 ?auto_159575 ) ) ( not ( = ?auto_159573 ?auto_159576 ) ) ( not ( = ?auto_159573 ?auto_159577 ) ) ( not ( = ?auto_159573 ?auto_159578 ) ) ( not ( = ?auto_159573 ?auto_159579 ) ) ( not ( = ?auto_159574 ?auto_159575 ) ) ( not ( = ?auto_159574 ?auto_159576 ) ) ( not ( = ?auto_159574 ?auto_159577 ) ) ( not ( = ?auto_159574 ?auto_159578 ) ) ( not ( = ?auto_159574 ?auto_159579 ) ) ( not ( = ?auto_159575 ?auto_159576 ) ) ( not ( = ?auto_159575 ?auto_159577 ) ) ( not ( = ?auto_159575 ?auto_159578 ) ) ( not ( = ?auto_159575 ?auto_159579 ) ) ( not ( = ?auto_159576 ?auto_159577 ) ) ( not ( = ?auto_159576 ?auto_159578 ) ) ( not ( = ?auto_159576 ?auto_159579 ) ) ( not ( = ?auto_159577 ?auto_159578 ) ) ( not ( = ?auto_159577 ?auto_159579 ) ) ( not ( = ?auto_159578 ?auto_159579 ) ) ( ON ?auto_159577 ?auto_159578 ) ( ON ?auto_159576 ?auto_159577 ) ( ON ?auto_159575 ?auto_159576 ) ( ON ?auto_159574 ?auto_159575 ) ( ON ?auto_159573 ?auto_159574 ) ( ON ?auto_159572 ?auto_159573 ) ( CLEAR ?auto_159570 ) ( ON ?auto_159571 ?auto_159572 ) ( CLEAR ?auto_159571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159570 ?auto_159571 )
      ( MAKE-9PILE ?auto_159570 ?auto_159571 ?auto_159572 ?auto_159573 ?auto_159574 ?auto_159575 ?auto_159576 ?auto_159577 ?auto_159578 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_159608 - BLOCK
      ?auto_159609 - BLOCK
      ?auto_159610 - BLOCK
      ?auto_159611 - BLOCK
      ?auto_159612 - BLOCK
      ?auto_159613 - BLOCK
      ?auto_159614 - BLOCK
      ?auto_159615 - BLOCK
      ?auto_159616 - BLOCK
    )
    :vars
    (
      ?auto_159617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159616 ?auto_159617 ) ( not ( = ?auto_159608 ?auto_159609 ) ) ( not ( = ?auto_159608 ?auto_159610 ) ) ( not ( = ?auto_159608 ?auto_159611 ) ) ( not ( = ?auto_159608 ?auto_159612 ) ) ( not ( = ?auto_159608 ?auto_159613 ) ) ( not ( = ?auto_159608 ?auto_159614 ) ) ( not ( = ?auto_159608 ?auto_159615 ) ) ( not ( = ?auto_159608 ?auto_159616 ) ) ( not ( = ?auto_159608 ?auto_159617 ) ) ( not ( = ?auto_159609 ?auto_159610 ) ) ( not ( = ?auto_159609 ?auto_159611 ) ) ( not ( = ?auto_159609 ?auto_159612 ) ) ( not ( = ?auto_159609 ?auto_159613 ) ) ( not ( = ?auto_159609 ?auto_159614 ) ) ( not ( = ?auto_159609 ?auto_159615 ) ) ( not ( = ?auto_159609 ?auto_159616 ) ) ( not ( = ?auto_159609 ?auto_159617 ) ) ( not ( = ?auto_159610 ?auto_159611 ) ) ( not ( = ?auto_159610 ?auto_159612 ) ) ( not ( = ?auto_159610 ?auto_159613 ) ) ( not ( = ?auto_159610 ?auto_159614 ) ) ( not ( = ?auto_159610 ?auto_159615 ) ) ( not ( = ?auto_159610 ?auto_159616 ) ) ( not ( = ?auto_159610 ?auto_159617 ) ) ( not ( = ?auto_159611 ?auto_159612 ) ) ( not ( = ?auto_159611 ?auto_159613 ) ) ( not ( = ?auto_159611 ?auto_159614 ) ) ( not ( = ?auto_159611 ?auto_159615 ) ) ( not ( = ?auto_159611 ?auto_159616 ) ) ( not ( = ?auto_159611 ?auto_159617 ) ) ( not ( = ?auto_159612 ?auto_159613 ) ) ( not ( = ?auto_159612 ?auto_159614 ) ) ( not ( = ?auto_159612 ?auto_159615 ) ) ( not ( = ?auto_159612 ?auto_159616 ) ) ( not ( = ?auto_159612 ?auto_159617 ) ) ( not ( = ?auto_159613 ?auto_159614 ) ) ( not ( = ?auto_159613 ?auto_159615 ) ) ( not ( = ?auto_159613 ?auto_159616 ) ) ( not ( = ?auto_159613 ?auto_159617 ) ) ( not ( = ?auto_159614 ?auto_159615 ) ) ( not ( = ?auto_159614 ?auto_159616 ) ) ( not ( = ?auto_159614 ?auto_159617 ) ) ( not ( = ?auto_159615 ?auto_159616 ) ) ( not ( = ?auto_159615 ?auto_159617 ) ) ( not ( = ?auto_159616 ?auto_159617 ) ) ( ON ?auto_159615 ?auto_159616 ) ( ON ?auto_159614 ?auto_159615 ) ( ON ?auto_159613 ?auto_159614 ) ( ON ?auto_159612 ?auto_159613 ) ( ON ?auto_159611 ?auto_159612 ) ( ON ?auto_159610 ?auto_159611 ) ( ON ?auto_159609 ?auto_159610 ) ( ON ?auto_159608 ?auto_159609 ) ( CLEAR ?auto_159608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159608 )
      ( MAKE-9PILE ?auto_159608 ?auto_159609 ?auto_159610 ?auto_159611 ?auto_159612 ?auto_159613 ?auto_159614 ?auto_159615 ?auto_159616 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_159647 - BLOCK
      ?auto_159648 - BLOCK
      ?auto_159649 - BLOCK
      ?auto_159650 - BLOCK
      ?auto_159651 - BLOCK
      ?auto_159652 - BLOCK
      ?auto_159653 - BLOCK
      ?auto_159654 - BLOCK
      ?auto_159655 - BLOCK
      ?auto_159656 - BLOCK
    )
    :vars
    (
      ?auto_159657 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_159655 ) ( ON ?auto_159656 ?auto_159657 ) ( CLEAR ?auto_159656 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159647 ) ( ON ?auto_159648 ?auto_159647 ) ( ON ?auto_159649 ?auto_159648 ) ( ON ?auto_159650 ?auto_159649 ) ( ON ?auto_159651 ?auto_159650 ) ( ON ?auto_159652 ?auto_159651 ) ( ON ?auto_159653 ?auto_159652 ) ( ON ?auto_159654 ?auto_159653 ) ( ON ?auto_159655 ?auto_159654 ) ( not ( = ?auto_159647 ?auto_159648 ) ) ( not ( = ?auto_159647 ?auto_159649 ) ) ( not ( = ?auto_159647 ?auto_159650 ) ) ( not ( = ?auto_159647 ?auto_159651 ) ) ( not ( = ?auto_159647 ?auto_159652 ) ) ( not ( = ?auto_159647 ?auto_159653 ) ) ( not ( = ?auto_159647 ?auto_159654 ) ) ( not ( = ?auto_159647 ?auto_159655 ) ) ( not ( = ?auto_159647 ?auto_159656 ) ) ( not ( = ?auto_159647 ?auto_159657 ) ) ( not ( = ?auto_159648 ?auto_159649 ) ) ( not ( = ?auto_159648 ?auto_159650 ) ) ( not ( = ?auto_159648 ?auto_159651 ) ) ( not ( = ?auto_159648 ?auto_159652 ) ) ( not ( = ?auto_159648 ?auto_159653 ) ) ( not ( = ?auto_159648 ?auto_159654 ) ) ( not ( = ?auto_159648 ?auto_159655 ) ) ( not ( = ?auto_159648 ?auto_159656 ) ) ( not ( = ?auto_159648 ?auto_159657 ) ) ( not ( = ?auto_159649 ?auto_159650 ) ) ( not ( = ?auto_159649 ?auto_159651 ) ) ( not ( = ?auto_159649 ?auto_159652 ) ) ( not ( = ?auto_159649 ?auto_159653 ) ) ( not ( = ?auto_159649 ?auto_159654 ) ) ( not ( = ?auto_159649 ?auto_159655 ) ) ( not ( = ?auto_159649 ?auto_159656 ) ) ( not ( = ?auto_159649 ?auto_159657 ) ) ( not ( = ?auto_159650 ?auto_159651 ) ) ( not ( = ?auto_159650 ?auto_159652 ) ) ( not ( = ?auto_159650 ?auto_159653 ) ) ( not ( = ?auto_159650 ?auto_159654 ) ) ( not ( = ?auto_159650 ?auto_159655 ) ) ( not ( = ?auto_159650 ?auto_159656 ) ) ( not ( = ?auto_159650 ?auto_159657 ) ) ( not ( = ?auto_159651 ?auto_159652 ) ) ( not ( = ?auto_159651 ?auto_159653 ) ) ( not ( = ?auto_159651 ?auto_159654 ) ) ( not ( = ?auto_159651 ?auto_159655 ) ) ( not ( = ?auto_159651 ?auto_159656 ) ) ( not ( = ?auto_159651 ?auto_159657 ) ) ( not ( = ?auto_159652 ?auto_159653 ) ) ( not ( = ?auto_159652 ?auto_159654 ) ) ( not ( = ?auto_159652 ?auto_159655 ) ) ( not ( = ?auto_159652 ?auto_159656 ) ) ( not ( = ?auto_159652 ?auto_159657 ) ) ( not ( = ?auto_159653 ?auto_159654 ) ) ( not ( = ?auto_159653 ?auto_159655 ) ) ( not ( = ?auto_159653 ?auto_159656 ) ) ( not ( = ?auto_159653 ?auto_159657 ) ) ( not ( = ?auto_159654 ?auto_159655 ) ) ( not ( = ?auto_159654 ?auto_159656 ) ) ( not ( = ?auto_159654 ?auto_159657 ) ) ( not ( = ?auto_159655 ?auto_159656 ) ) ( not ( = ?auto_159655 ?auto_159657 ) ) ( not ( = ?auto_159656 ?auto_159657 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159656 ?auto_159657 )
      ( !STACK ?auto_159656 ?auto_159655 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_159689 - BLOCK
      ?auto_159690 - BLOCK
      ?auto_159691 - BLOCK
      ?auto_159692 - BLOCK
      ?auto_159693 - BLOCK
      ?auto_159694 - BLOCK
      ?auto_159695 - BLOCK
      ?auto_159696 - BLOCK
      ?auto_159697 - BLOCK
      ?auto_159698 - BLOCK
    )
    :vars
    (
      ?auto_159699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159698 ?auto_159699 ) ( ON-TABLE ?auto_159689 ) ( ON ?auto_159690 ?auto_159689 ) ( ON ?auto_159691 ?auto_159690 ) ( ON ?auto_159692 ?auto_159691 ) ( ON ?auto_159693 ?auto_159692 ) ( ON ?auto_159694 ?auto_159693 ) ( ON ?auto_159695 ?auto_159694 ) ( ON ?auto_159696 ?auto_159695 ) ( not ( = ?auto_159689 ?auto_159690 ) ) ( not ( = ?auto_159689 ?auto_159691 ) ) ( not ( = ?auto_159689 ?auto_159692 ) ) ( not ( = ?auto_159689 ?auto_159693 ) ) ( not ( = ?auto_159689 ?auto_159694 ) ) ( not ( = ?auto_159689 ?auto_159695 ) ) ( not ( = ?auto_159689 ?auto_159696 ) ) ( not ( = ?auto_159689 ?auto_159697 ) ) ( not ( = ?auto_159689 ?auto_159698 ) ) ( not ( = ?auto_159689 ?auto_159699 ) ) ( not ( = ?auto_159690 ?auto_159691 ) ) ( not ( = ?auto_159690 ?auto_159692 ) ) ( not ( = ?auto_159690 ?auto_159693 ) ) ( not ( = ?auto_159690 ?auto_159694 ) ) ( not ( = ?auto_159690 ?auto_159695 ) ) ( not ( = ?auto_159690 ?auto_159696 ) ) ( not ( = ?auto_159690 ?auto_159697 ) ) ( not ( = ?auto_159690 ?auto_159698 ) ) ( not ( = ?auto_159690 ?auto_159699 ) ) ( not ( = ?auto_159691 ?auto_159692 ) ) ( not ( = ?auto_159691 ?auto_159693 ) ) ( not ( = ?auto_159691 ?auto_159694 ) ) ( not ( = ?auto_159691 ?auto_159695 ) ) ( not ( = ?auto_159691 ?auto_159696 ) ) ( not ( = ?auto_159691 ?auto_159697 ) ) ( not ( = ?auto_159691 ?auto_159698 ) ) ( not ( = ?auto_159691 ?auto_159699 ) ) ( not ( = ?auto_159692 ?auto_159693 ) ) ( not ( = ?auto_159692 ?auto_159694 ) ) ( not ( = ?auto_159692 ?auto_159695 ) ) ( not ( = ?auto_159692 ?auto_159696 ) ) ( not ( = ?auto_159692 ?auto_159697 ) ) ( not ( = ?auto_159692 ?auto_159698 ) ) ( not ( = ?auto_159692 ?auto_159699 ) ) ( not ( = ?auto_159693 ?auto_159694 ) ) ( not ( = ?auto_159693 ?auto_159695 ) ) ( not ( = ?auto_159693 ?auto_159696 ) ) ( not ( = ?auto_159693 ?auto_159697 ) ) ( not ( = ?auto_159693 ?auto_159698 ) ) ( not ( = ?auto_159693 ?auto_159699 ) ) ( not ( = ?auto_159694 ?auto_159695 ) ) ( not ( = ?auto_159694 ?auto_159696 ) ) ( not ( = ?auto_159694 ?auto_159697 ) ) ( not ( = ?auto_159694 ?auto_159698 ) ) ( not ( = ?auto_159694 ?auto_159699 ) ) ( not ( = ?auto_159695 ?auto_159696 ) ) ( not ( = ?auto_159695 ?auto_159697 ) ) ( not ( = ?auto_159695 ?auto_159698 ) ) ( not ( = ?auto_159695 ?auto_159699 ) ) ( not ( = ?auto_159696 ?auto_159697 ) ) ( not ( = ?auto_159696 ?auto_159698 ) ) ( not ( = ?auto_159696 ?auto_159699 ) ) ( not ( = ?auto_159697 ?auto_159698 ) ) ( not ( = ?auto_159697 ?auto_159699 ) ) ( not ( = ?auto_159698 ?auto_159699 ) ) ( CLEAR ?auto_159696 ) ( ON ?auto_159697 ?auto_159698 ) ( CLEAR ?auto_159697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_159689 ?auto_159690 ?auto_159691 ?auto_159692 ?auto_159693 ?auto_159694 ?auto_159695 ?auto_159696 ?auto_159697 )
      ( MAKE-10PILE ?auto_159689 ?auto_159690 ?auto_159691 ?auto_159692 ?auto_159693 ?auto_159694 ?auto_159695 ?auto_159696 ?auto_159697 ?auto_159698 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_159731 - BLOCK
      ?auto_159732 - BLOCK
      ?auto_159733 - BLOCK
      ?auto_159734 - BLOCK
      ?auto_159735 - BLOCK
      ?auto_159736 - BLOCK
      ?auto_159737 - BLOCK
      ?auto_159738 - BLOCK
      ?auto_159739 - BLOCK
      ?auto_159740 - BLOCK
    )
    :vars
    (
      ?auto_159741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159740 ?auto_159741 ) ( ON-TABLE ?auto_159731 ) ( ON ?auto_159732 ?auto_159731 ) ( ON ?auto_159733 ?auto_159732 ) ( ON ?auto_159734 ?auto_159733 ) ( ON ?auto_159735 ?auto_159734 ) ( ON ?auto_159736 ?auto_159735 ) ( ON ?auto_159737 ?auto_159736 ) ( not ( = ?auto_159731 ?auto_159732 ) ) ( not ( = ?auto_159731 ?auto_159733 ) ) ( not ( = ?auto_159731 ?auto_159734 ) ) ( not ( = ?auto_159731 ?auto_159735 ) ) ( not ( = ?auto_159731 ?auto_159736 ) ) ( not ( = ?auto_159731 ?auto_159737 ) ) ( not ( = ?auto_159731 ?auto_159738 ) ) ( not ( = ?auto_159731 ?auto_159739 ) ) ( not ( = ?auto_159731 ?auto_159740 ) ) ( not ( = ?auto_159731 ?auto_159741 ) ) ( not ( = ?auto_159732 ?auto_159733 ) ) ( not ( = ?auto_159732 ?auto_159734 ) ) ( not ( = ?auto_159732 ?auto_159735 ) ) ( not ( = ?auto_159732 ?auto_159736 ) ) ( not ( = ?auto_159732 ?auto_159737 ) ) ( not ( = ?auto_159732 ?auto_159738 ) ) ( not ( = ?auto_159732 ?auto_159739 ) ) ( not ( = ?auto_159732 ?auto_159740 ) ) ( not ( = ?auto_159732 ?auto_159741 ) ) ( not ( = ?auto_159733 ?auto_159734 ) ) ( not ( = ?auto_159733 ?auto_159735 ) ) ( not ( = ?auto_159733 ?auto_159736 ) ) ( not ( = ?auto_159733 ?auto_159737 ) ) ( not ( = ?auto_159733 ?auto_159738 ) ) ( not ( = ?auto_159733 ?auto_159739 ) ) ( not ( = ?auto_159733 ?auto_159740 ) ) ( not ( = ?auto_159733 ?auto_159741 ) ) ( not ( = ?auto_159734 ?auto_159735 ) ) ( not ( = ?auto_159734 ?auto_159736 ) ) ( not ( = ?auto_159734 ?auto_159737 ) ) ( not ( = ?auto_159734 ?auto_159738 ) ) ( not ( = ?auto_159734 ?auto_159739 ) ) ( not ( = ?auto_159734 ?auto_159740 ) ) ( not ( = ?auto_159734 ?auto_159741 ) ) ( not ( = ?auto_159735 ?auto_159736 ) ) ( not ( = ?auto_159735 ?auto_159737 ) ) ( not ( = ?auto_159735 ?auto_159738 ) ) ( not ( = ?auto_159735 ?auto_159739 ) ) ( not ( = ?auto_159735 ?auto_159740 ) ) ( not ( = ?auto_159735 ?auto_159741 ) ) ( not ( = ?auto_159736 ?auto_159737 ) ) ( not ( = ?auto_159736 ?auto_159738 ) ) ( not ( = ?auto_159736 ?auto_159739 ) ) ( not ( = ?auto_159736 ?auto_159740 ) ) ( not ( = ?auto_159736 ?auto_159741 ) ) ( not ( = ?auto_159737 ?auto_159738 ) ) ( not ( = ?auto_159737 ?auto_159739 ) ) ( not ( = ?auto_159737 ?auto_159740 ) ) ( not ( = ?auto_159737 ?auto_159741 ) ) ( not ( = ?auto_159738 ?auto_159739 ) ) ( not ( = ?auto_159738 ?auto_159740 ) ) ( not ( = ?auto_159738 ?auto_159741 ) ) ( not ( = ?auto_159739 ?auto_159740 ) ) ( not ( = ?auto_159739 ?auto_159741 ) ) ( not ( = ?auto_159740 ?auto_159741 ) ) ( ON ?auto_159739 ?auto_159740 ) ( CLEAR ?auto_159737 ) ( ON ?auto_159738 ?auto_159739 ) ( CLEAR ?auto_159738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159731 ?auto_159732 ?auto_159733 ?auto_159734 ?auto_159735 ?auto_159736 ?auto_159737 ?auto_159738 )
      ( MAKE-10PILE ?auto_159731 ?auto_159732 ?auto_159733 ?auto_159734 ?auto_159735 ?auto_159736 ?auto_159737 ?auto_159738 ?auto_159739 ?auto_159740 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_159773 - BLOCK
      ?auto_159774 - BLOCK
      ?auto_159775 - BLOCK
      ?auto_159776 - BLOCK
      ?auto_159777 - BLOCK
      ?auto_159778 - BLOCK
      ?auto_159779 - BLOCK
      ?auto_159780 - BLOCK
      ?auto_159781 - BLOCK
      ?auto_159782 - BLOCK
    )
    :vars
    (
      ?auto_159783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159782 ?auto_159783 ) ( ON-TABLE ?auto_159773 ) ( ON ?auto_159774 ?auto_159773 ) ( ON ?auto_159775 ?auto_159774 ) ( ON ?auto_159776 ?auto_159775 ) ( ON ?auto_159777 ?auto_159776 ) ( ON ?auto_159778 ?auto_159777 ) ( not ( = ?auto_159773 ?auto_159774 ) ) ( not ( = ?auto_159773 ?auto_159775 ) ) ( not ( = ?auto_159773 ?auto_159776 ) ) ( not ( = ?auto_159773 ?auto_159777 ) ) ( not ( = ?auto_159773 ?auto_159778 ) ) ( not ( = ?auto_159773 ?auto_159779 ) ) ( not ( = ?auto_159773 ?auto_159780 ) ) ( not ( = ?auto_159773 ?auto_159781 ) ) ( not ( = ?auto_159773 ?auto_159782 ) ) ( not ( = ?auto_159773 ?auto_159783 ) ) ( not ( = ?auto_159774 ?auto_159775 ) ) ( not ( = ?auto_159774 ?auto_159776 ) ) ( not ( = ?auto_159774 ?auto_159777 ) ) ( not ( = ?auto_159774 ?auto_159778 ) ) ( not ( = ?auto_159774 ?auto_159779 ) ) ( not ( = ?auto_159774 ?auto_159780 ) ) ( not ( = ?auto_159774 ?auto_159781 ) ) ( not ( = ?auto_159774 ?auto_159782 ) ) ( not ( = ?auto_159774 ?auto_159783 ) ) ( not ( = ?auto_159775 ?auto_159776 ) ) ( not ( = ?auto_159775 ?auto_159777 ) ) ( not ( = ?auto_159775 ?auto_159778 ) ) ( not ( = ?auto_159775 ?auto_159779 ) ) ( not ( = ?auto_159775 ?auto_159780 ) ) ( not ( = ?auto_159775 ?auto_159781 ) ) ( not ( = ?auto_159775 ?auto_159782 ) ) ( not ( = ?auto_159775 ?auto_159783 ) ) ( not ( = ?auto_159776 ?auto_159777 ) ) ( not ( = ?auto_159776 ?auto_159778 ) ) ( not ( = ?auto_159776 ?auto_159779 ) ) ( not ( = ?auto_159776 ?auto_159780 ) ) ( not ( = ?auto_159776 ?auto_159781 ) ) ( not ( = ?auto_159776 ?auto_159782 ) ) ( not ( = ?auto_159776 ?auto_159783 ) ) ( not ( = ?auto_159777 ?auto_159778 ) ) ( not ( = ?auto_159777 ?auto_159779 ) ) ( not ( = ?auto_159777 ?auto_159780 ) ) ( not ( = ?auto_159777 ?auto_159781 ) ) ( not ( = ?auto_159777 ?auto_159782 ) ) ( not ( = ?auto_159777 ?auto_159783 ) ) ( not ( = ?auto_159778 ?auto_159779 ) ) ( not ( = ?auto_159778 ?auto_159780 ) ) ( not ( = ?auto_159778 ?auto_159781 ) ) ( not ( = ?auto_159778 ?auto_159782 ) ) ( not ( = ?auto_159778 ?auto_159783 ) ) ( not ( = ?auto_159779 ?auto_159780 ) ) ( not ( = ?auto_159779 ?auto_159781 ) ) ( not ( = ?auto_159779 ?auto_159782 ) ) ( not ( = ?auto_159779 ?auto_159783 ) ) ( not ( = ?auto_159780 ?auto_159781 ) ) ( not ( = ?auto_159780 ?auto_159782 ) ) ( not ( = ?auto_159780 ?auto_159783 ) ) ( not ( = ?auto_159781 ?auto_159782 ) ) ( not ( = ?auto_159781 ?auto_159783 ) ) ( not ( = ?auto_159782 ?auto_159783 ) ) ( ON ?auto_159781 ?auto_159782 ) ( ON ?auto_159780 ?auto_159781 ) ( CLEAR ?auto_159778 ) ( ON ?auto_159779 ?auto_159780 ) ( CLEAR ?auto_159779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159773 ?auto_159774 ?auto_159775 ?auto_159776 ?auto_159777 ?auto_159778 ?auto_159779 )
      ( MAKE-10PILE ?auto_159773 ?auto_159774 ?auto_159775 ?auto_159776 ?auto_159777 ?auto_159778 ?auto_159779 ?auto_159780 ?auto_159781 ?auto_159782 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_159815 - BLOCK
      ?auto_159816 - BLOCK
      ?auto_159817 - BLOCK
      ?auto_159818 - BLOCK
      ?auto_159819 - BLOCK
      ?auto_159820 - BLOCK
      ?auto_159821 - BLOCK
      ?auto_159822 - BLOCK
      ?auto_159823 - BLOCK
      ?auto_159824 - BLOCK
    )
    :vars
    (
      ?auto_159825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159824 ?auto_159825 ) ( ON-TABLE ?auto_159815 ) ( ON ?auto_159816 ?auto_159815 ) ( ON ?auto_159817 ?auto_159816 ) ( ON ?auto_159818 ?auto_159817 ) ( ON ?auto_159819 ?auto_159818 ) ( not ( = ?auto_159815 ?auto_159816 ) ) ( not ( = ?auto_159815 ?auto_159817 ) ) ( not ( = ?auto_159815 ?auto_159818 ) ) ( not ( = ?auto_159815 ?auto_159819 ) ) ( not ( = ?auto_159815 ?auto_159820 ) ) ( not ( = ?auto_159815 ?auto_159821 ) ) ( not ( = ?auto_159815 ?auto_159822 ) ) ( not ( = ?auto_159815 ?auto_159823 ) ) ( not ( = ?auto_159815 ?auto_159824 ) ) ( not ( = ?auto_159815 ?auto_159825 ) ) ( not ( = ?auto_159816 ?auto_159817 ) ) ( not ( = ?auto_159816 ?auto_159818 ) ) ( not ( = ?auto_159816 ?auto_159819 ) ) ( not ( = ?auto_159816 ?auto_159820 ) ) ( not ( = ?auto_159816 ?auto_159821 ) ) ( not ( = ?auto_159816 ?auto_159822 ) ) ( not ( = ?auto_159816 ?auto_159823 ) ) ( not ( = ?auto_159816 ?auto_159824 ) ) ( not ( = ?auto_159816 ?auto_159825 ) ) ( not ( = ?auto_159817 ?auto_159818 ) ) ( not ( = ?auto_159817 ?auto_159819 ) ) ( not ( = ?auto_159817 ?auto_159820 ) ) ( not ( = ?auto_159817 ?auto_159821 ) ) ( not ( = ?auto_159817 ?auto_159822 ) ) ( not ( = ?auto_159817 ?auto_159823 ) ) ( not ( = ?auto_159817 ?auto_159824 ) ) ( not ( = ?auto_159817 ?auto_159825 ) ) ( not ( = ?auto_159818 ?auto_159819 ) ) ( not ( = ?auto_159818 ?auto_159820 ) ) ( not ( = ?auto_159818 ?auto_159821 ) ) ( not ( = ?auto_159818 ?auto_159822 ) ) ( not ( = ?auto_159818 ?auto_159823 ) ) ( not ( = ?auto_159818 ?auto_159824 ) ) ( not ( = ?auto_159818 ?auto_159825 ) ) ( not ( = ?auto_159819 ?auto_159820 ) ) ( not ( = ?auto_159819 ?auto_159821 ) ) ( not ( = ?auto_159819 ?auto_159822 ) ) ( not ( = ?auto_159819 ?auto_159823 ) ) ( not ( = ?auto_159819 ?auto_159824 ) ) ( not ( = ?auto_159819 ?auto_159825 ) ) ( not ( = ?auto_159820 ?auto_159821 ) ) ( not ( = ?auto_159820 ?auto_159822 ) ) ( not ( = ?auto_159820 ?auto_159823 ) ) ( not ( = ?auto_159820 ?auto_159824 ) ) ( not ( = ?auto_159820 ?auto_159825 ) ) ( not ( = ?auto_159821 ?auto_159822 ) ) ( not ( = ?auto_159821 ?auto_159823 ) ) ( not ( = ?auto_159821 ?auto_159824 ) ) ( not ( = ?auto_159821 ?auto_159825 ) ) ( not ( = ?auto_159822 ?auto_159823 ) ) ( not ( = ?auto_159822 ?auto_159824 ) ) ( not ( = ?auto_159822 ?auto_159825 ) ) ( not ( = ?auto_159823 ?auto_159824 ) ) ( not ( = ?auto_159823 ?auto_159825 ) ) ( not ( = ?auto_159824 ?auto_159825 ) ) ( ON ?auto_159823 ?auto_159824 ) ( ON ?auto_159822 ?auto_159823 ) ( ON ?auto_159821 ?auto_159822 ) ( CLEAR ?auto_159819 ) ( ON ?auto_159820 ?auto_159821 ) ( CLEAR ?auto_159820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159815 ?auto_159816 ?auto_159817 ?auto_159818 ?auto_159819 ?auto_159820 )
      ( MAKE-10PILE ?auto_159815 ?auto_159816 ?auto_159817 ?auto_159818 ?auto_159819 ?auto_159820 ?auto_159821 ?auto_159822 ?auto_159823 ?auto_159824 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_159857 - BLOCK
      ?auto_159858 - BLOCK
      ?auto_159859 - BLOCK
      ?auto_159860 - BLOCK
      ?auto_159861 - BLOCK
      ?auto_159862 - BLOCK
      ?auto_159863 - BLOCK
      ?auto_159864 - BLOCK
      ?auto_159865 - BLOCK
      ?auto_159866 - BLOCK
    )
    :vars
    (
      ?auto_159867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159866 ?auto_159867 ) ( ON-TABLE ?auto_159857 ) ( ON ?auto_159858 ?auto_159857 ) ( ON ?auto_159859 ?auto_159858 ) ( ON ?auto_159860 ?auto_159859 ) ( not ( = ?auto_159857 ?auto_159858 ) ) ( not ( = ?auto_159857 ?auto_159859 ) ) ( not ( = ?auto_159857 ?auto_159860 ) ) ( not ( = ?auto_159857 ?auto_159861 ) ) ( not ( = ?auto_159857 ?auto_159862 ) ) ( not ( = ?auto_159857 ?auto_159863 ) ) ( not ( = ?auto_159857 ?auto_159864 ) ) ( not ( = ?auto_159857 ?auto_159865 ) ) ( not ( = ?auto_159857 ?auto_159866 ) ) ( not ( = ?auto_159857 ?auto_159867 ) ) ( not ( = ?auto_159858 ?auto_159859 ) ) ( not ( = ?auto_159858 ?auto_159860 ) ) ( not ( = ?auto_159858 ?auto_159861 ) ) ( not ( = ?auto_159858 ?auto_159862 ) ) ( not ( = ?auto_159858 ?auto_159863 ) ) ( not ( = ?auto_159858 ?auto_159864 ) ) ( not ( = ?auto_159858 ?auto_159865 ) ) ( not ( = ?auto_159858 ?auto_159866 ) ) ( not ( = ?auto_159858 ?auto_159867 ) ) ( not ( = ?auto_159859 ?auto_159860 ) ) ( not ( = ?auto_159859 ?auto_159861 ) ) ( not ( = ?auto_159859 ?auto_159862 ) ) ( not ( = ?auto_159859 ?auto_159863 ) ) ( not ( = ?auto_159859 ?auto_159864 ) ) ( not ( = ?auto_159859 ?auto_159865 ) ) ( not ( = ?auto_159859 ?auto_159866 ) ) ( not ( = ?auto_159859 ?auto_159867 ) ) ( not ( = ?auto_159860 ?auto_159861 ) ) ( not ( = ?auto_159860 ?auto_159862 ) ) ( not ( = ?auto_159860 ?auto_159863 ) ) ( not ( = ?auto_159860 ?auto_159864 ) ) ( not ( = ?auto_159860 ?auto_159865 ) ) ( not ( = ?auto_159860 ?auto_159866 ) ) ( not ( = ?auto_159860 ?auto_159867 ) ) ( not ( = ?auto_159861 ?auto_159862 ) ) ( not ( = ?auto_159861 ?auto_159863 ) ) ( not ( = ?auto_159861 ?auto_159864 ) ) ( not ( = ?auto_159861 ?auto_159865 ) ) ( not ( = ?auto_159861 ?auto_159866 ) ) ( not ( = ?auto_159861 ?auto_159867 ) ) ( not ( = ?auto_159862 ?auto_159863 ) ) ( not ( = ?auto_159862 ?auto_159864 ) ) ( not ( = ?auto_159862 ?auto_159865 ) ) ( not ( = ?auto_159862 ?auto_159866 ) ) ( not ( = ?auto_159862 ?auto_159867 ) ) ( not ( = ?auto_159863 ?auto_159864 ) ) ( not ( = ?auto_159863 ?auto_159865 ) ) ( not ( = ?auto_159863 ?auto_159866 ) ) ( not ( = ?auto_159863 ?auto_159867 ) ) ( not ( = ?auto_159864 ?auto_159865 ) ) ( not ( = ?auto_159864 ?auto_159866 ) ) ( not ( = ?auto_159864 ?auto_159867 ) ) ( not ( = ?auto_159865 ?auto_159866 ) ) ( not ( = ?auto_159865 ?auto_159867 ) ) ( not ( = ?auto_159866 ?auto_159867 ) ) ( ON ?auto_159865 ?auto_159866 ) ( ON ?auto_159864 ?auto_159865 ) ( ON ?auto_159863 ?auto_159864 ) ( ON ?auto_159862 ?auto_159863 ) ( CLEAR ?auto_159860 ) ( ON ?auto_159861 ?auto_159862 ) ( CLEAR ?auto_159861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159857 ?auto_159858 ?auto_159859 ?auto_159860 ?auto_159861 )
      ( MAKE-10PILE ?auto_159857 ?auto_159858 ?auto_159859 ?auto_159860 ?auto_159861 ?auto_159862 ?auto_159863 ?auto_159864 ?auto_159865 ?auto_159866 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_159899 - BLOCK
      ?auto_159900 - BLOCK
      ?auto_159901 - BLOCK
      ?auto_159902 - BLOCK
      ?auto_159903 - BLOCK
      ?auto_159904 - BLOCK
      ?auto_159905 - BLOCK
      ?auto_159906 - BLOCK
      ?auto_159907 - BLOCK
      ?auto_159908 - BLOCK
    )
    :vars
    (
      ?auto_159909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159908 ?auto_159909 ) ( ON-TABLE ?auto_159899 ) ( ON ?auto_159900 ?auto_159899 ) ( ON ?auto_159901 ?auto_159900 ) ( not ( = ?auto_159899 ?auto_159900 ) ) ( not ( = ?auto_159899 ?auto_159901 ) ) ( not ( = ?auto_159899 ?auto_159902 ) ) ( not ( = ?auto_159899 ?auto_159903 ) ) ( not ( = ?auto_159899 ?auto_159904 ) ) ( not ( = ?auto_159899 ?auto_159905 ) ) ( not ( = ?auto_159899 ?auto_159906 ) ) ( not ( = ?auto_159899 ?auto_159907 ) ) ( not ( = ?auto_159899 ?auto_159908 ) ) ( not ( = ?auto_159899 ?auto_159909 ) ) ( not ( = ?auto_159900 ?auto_159901 ) ) ( not ( = ?auto_159900 ?auto_159902 ) ) ( not ( = ?auto_159900 ?auto_159903 ) ) ( not ( = ?auto_159900 ?auto_159904 ) ) ( not ( = ?auto_159900 ?auto_159905 ) ) ( not ( = ?auto_159900 ?auto_159906 ) ) ( not ( = ?auto_159900 ?auto_159907 ) ) ( not ( = ?auto_159900 ?auto_159908 ) ) ( not ( = ?auto_159900 ?auto_159909 ) ) ( not ( = ?auto_159901 ?auto_159902 ) ) ( not ( = ?auto_159901 ?auto_159903 ) ) ( not ( = ?auto_159901 ?auto_159904 ) ) ( not ( = ?auto_159901 ?auto_159905 ) ) ( not ( = ?auto_159901 ?auto_159906 ) ) ( not ( = ?auto_159901 ?auto_159907 ) ) ( not ( = ?auto_159901 ?auto_159908 ) ) ( not ( = ?auto_159901 ?auto_159909 ) ) ( not ( = ?auto_159902 ?auto_159903 ) ) ( not ( = ?auto_159902 ?auto_159904 ) ) ( not ( = ?auto_159902 ?auto_159905 ) ) ( not ( = ?auto_159902 ?auto_159906 ) ) ( not ( = ?auto_159902 ?auto_159907 ) ) ( not ( = ?auto_159902 ?auto_159908 ) ) ( not ( = ?auto_159902 ?auto_159909 ) ) ( not ( = ?auto_159903 ?auto_159904 ) ) ( not ( = ?auto_159903 ?auto_159905 ) ) ( not ( = ?auto_159903 ?auto_159906 ) ) ( not ( = ?auto_159903 ?auto_159907 ) ) ( not ( = ?auto_159903 ?auto_159908 ) ) ( not ( = ?auto_159903 ?auto_159909 ) ) ( not ( = ?auto_159904 ?auto_159905 ) ) ( not ( = ?auto_159904 ?auto_159906 ) ) ( not ( = ?auto_159904 ?auto_159907 ) ) ( not ( = ?auto_159904 ?auto_159908 ) ) ( not ( = ?auto_159904 ?auto_159909 ) ) ( not ( = ?auto_159905 ?auto_159906 ) ) ( not ( = ?auto_159905 ?auto_159907 ) ) ( not ( = ?auto_159905 ?auto_159908 ) ) ( not ( = ?auto_159905 ?auto_159909 ) ) ( not ( = ?auto_159906 ?auto_159907 ) ) ( not ( = ?auto_159906 ?auto_159908 ) ) ( not ( = ?auto_159906 ?auto_159909 ) ) ( not ( = ?auto_159907 ?auto_159908 ) ) ( not ( = ?auto_159907 ?auto_159909 ) ) ( not ( = ?auto_159908 ?auto_159909 ) ) ( ON ?auto_159907 ?auto_159908 ) ( ON ?auto_159906 ?auto_159907 ) ( ON ?auto_159905 ?auto_159906 ) ( ON ?auto_159904 ?auto_159905 ) ( ON ?auto_159903 ?auto_159904 ) ( CLEAR ?auto_159901 ) ( ON ?auto_159902 ?auto_159903 ) ( CLEAR ?auto_159902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159899 ?auto_159900 ?auto_159901 ?auto_159902 )
      ( MAKE-10PILE ?auto_159899 ?auto_159900 ?auto_159901 ?auto_159902 ?auto_159903 ?auto_159904 ?auto_159905 ?auto_159906 ?auto_159907 ?auto_159908 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_159941 - BLOCK
      ?auto_159942 - BLOCK
      ?auto_159943 - BLOCK
      ?auto_159944 - BLOCK
      ?auto_159945 - BLOCK
      ?auto_159946 - BLOCK
      ?auto_159947 - BLOCK
      ?auto_159948 - BLOCK
      ?auto_159949 - BLOCK
      ?auto_159950 - BLOCK
    )
    :vars
    (
      ?auto_159951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159950 ?auto_159951 ) ( ON-TABLE ?auto_159941 ) ( ON ?auto_159942 ?auto_159941 ) ( not ( = ?auto_159941 ?auto_159942 ) ) ( not ( = ?auto_159941 ?auto_159943 ) ) ( not ( = ?auto_159941 ?auto_159944 ) ) ( not ( = ?auto_159941 ?auto_159945 ) ) ( not ( = ?auto_159941 ?auto_159946 ) ) ( not ( = ?auto_159941 ?auto_159947 ) ) ( not ( = ?auto_159941 ?auto_159948 ) ) ( not ( = ?auto_159941 ?auto_159949 ) ) ( not ( = ?auto_159941 ?auto_159950 ) ) ( not ( = ?auto_159941 ?auto_159951 ) ) ( not ( = ?auto_159942 ?auto_159943 ) ) ( not ( = ?auto_159942 ?auto_159944 ) ) ( not ( = ?auto_159942 ?auto_159945 ) ) ( not ( = ?auto_159942 ?auto_159946 ) ) ( not ( = ?auto_159942 ?auto_159947 ) ) ( not ( = ?auto_159942 ?auto_159948 ) ) ( not ( = ?auto_159942 ?auto_159949 ) ) ( not ( = ?auto_159942 ?auto_159950 ) ) ( not ( = ?auto_159942 ?auto_159951 ) ) ( not ( = ?auto_159943 ?auto_159944 ) ) ( not ( = ?auto_159943 ?auto_159945 ) ) ( not ( = ?auto_159943 ?auto_159946 ) ) ( not ( = ?auto_159943 ?auto_159947 ) ) ( not ( = ?auto_159943 ?auto_159948 ) ) ( not ( = ?auto_159943 ?auto_159949 ) ) ( not ( = ?auto_159943 ?auto_159950 ) ) ( not ( = ?auto_159943 ?auto_159951 ) ) ( not ( = ?auto_159944 ?auto_159945 ) ) ( not ( = ?auto_159944 ?auto_159946 ) ) ( not ( = ?auto_159944 ?auto_159947 ) ) ( not ( = ?auto_159944 ?auto_159948 ) ) ( not ( = ?auto_159944 ?auto_159949 ) ) ( not ( = ?auto_159944 ?auto_159950 ) ) ( not ( = ?auto_159944 ?auto_159951 ) ) ( not ( = ?auto_159945 ?auto_159946 ) ) ( not ( = ?auto_159945 ?auto_159947 ) ) ( not ( = ?auto_159945 ?auto_159948 ) ) ( not ( = ?auto_159945 ?auto_159949 ) ) ( not ( = ?auto_159945 ?auto_159950 ) ) ( not ( = ?auto_159945 ?auto_159951 ) ) ( not ( = ?auto_159946 ?auto_159947 ) ) ( not ( = ?auto_159946 ?auto_159948 ) ) ( not ( = ?auto_159946 ?auto_159949 ) ) ( not ( = ?auto_159946 ?auto_159950 ) ) ( not ( = ?auto_159946 ?auto_159951 ) ) ( not ( = ?auto_159947 ?auto_159948 ) ) ( not ( = ?auto_159947 ?auto_159949 ) ) ( not ( = ?auto_159947 ?auto_159950 ) ) ( not ( = ?auto_159947 ?auto_159951 ) ) ( not ( = ?auto_159948 ?auto_159949 ) ) ( not ( = ?auto_159948 ?auto_159950 ) ) ( not ( = ?auto_159948 ?auto_159951 ) ) ( not ( = ?auto_159949 ?auto_159950 ) ) ( not ( = ?auto_159949 ?auto_159951 ) ) ( not ( = ?auto_159950 ?auto_159951 ) ) ( ON ?auto_159949 ?auto_159950 ) ( ON ?auto_159948 ?auto_159949 ) ( ON ?auto_159947 ?auto_159948 ) ( ON ?auto_159946 ?auto_159947 ) ( ON ?auto_159945 ?auto_159946 ) ( ON ?auto_159944 ?auto_159945 ) ( CLEAR ?auto_159942 ) ( ON ?auto_159943 ?auto_159944 ) ( CLEAR ?auto_159943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159941 ?auto_159942 ?auto_159943 )
      ( MAKE-10PILE ?auto_159941 ?auto_159942 ?auto_159943 ?auto_159944 ?auto_159945 ?auto_159946 ?auto_159947 ?auto_159948 ?auto_159949 ?auto_159950 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_159983 - BLOCK
      ?auto_159984 - BLOCK
      ?auto_159985 - BLOCK
      ?auto_159986 - BLOCK
      ?auto_159987 - BLOCK
      ?auto_159988 - BLOCK
      ?auto_159989 - BLOCK
      ?auto_159990 - BLOCK
      ?auto_159991 - BLOCK
      ?auto_159992 - BLOCK
    )
    :vars
    (
      ?auto_159993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159992 ?auto_159993 ) ( ON-TABLE ?auto_159983 ) ( not ( = ?auto_159983 ?auto_159984 ) ) ( not ( = ?auto_159983 ?auto_159985 ) ) ( not ( = ?auto_159983 ?auto_159986 ) ) ( not ( = ?auto_159983 ?auto_159987 ) ) ( not ( = ?auto_159983 ?auto_159988 ) ) ( not ( = ?auto_159983 ?auto_159989 ) ) ( not ( = ?auto_159983 ?auto_159990 ) ) ( not ( = ?auto_159983 ?auto_159991 ) ) ( not ( = ?auto_159983 ?auto_159992 ) ) ( not ( = ?auto_159983 ?auto_159993 ) ) ( not ( = ?auto_159984 ?auto_159985 ) ) ( not ( = ?auto_159984 ?auto_159986 ) ) ( not ( = ?auto_159984 ?auto_159987 ) ) ( not ( = ?auto_159984 ?auto_159988 ) ) ( not ( = ?auto_159984 ?auto_159989 ) ) ( not ( = ?auto_159984 ?auto_159990 ) ) ( not ( = ?auto_159984 ?auto_159991 ) ) ( not ( = ?auto_159984 ?auto_159992 ) ) ( not ( = ?auto_159984 ?auto_159993 ) ) ( not ( = ?auto_159985 ?auto_159986 ) ) ( not ( = ?auto_159985 ?auto_159987 ) ) ( not ( = ?auto_159985 ?auto_159988 ) ) ( not ( = ?auto_159985 ?auto_159989 ) ) ( not ( = ?auto_159985 ?auto_159990 ) ) ( not ( = ?auto_159985 ?auto_159991 ) ) ( not ( = ?auto_159985 ?auto_159992 ) ) ( not ( = ?auto_159985 ?auto_159993 ) ) ( not ( = ?auto_159986 ?auto_159987 ) ) ( not ( = ?auto_159986 ?auto_159988 ) ) ( not ( = ?auto_159986 ?auto_159989 ) ) ( not ( = ?auto_159986 ?auto_159990 ) ) ( not ( = ?auto_159986 ?auto_159991 ) ) ( not ( = ?auto_159986 ?auto_159992 ) ) ( not ( = ?auto_159986 ?auto_159993 ) ) ( not ( = ?auto_159987 ?auto_159988 ) ) ( not ( = ?auto_159987 ?auto_159989 ) ) ( not ( = ?auto_159987 ?auto_159990 ) ) ( not ( = ?auto_159987 ?auto_159991 ) ) ( not ( = ?auto_159987 ?auto_159992 ) ) ( not ( = ?auto_159987 ?auto_159993 ) ) ( not ( = ?auto_159988 ?auto_159989 ) ) ( not ( = ?auto_159988 ?auto_159990 ) ) ( not ( = ?auto_159988 ?auto_159991 ) ) ( not ( = ?auto_159988 ?auto_159992 ) ) ( not ( = ?auto_159988 ?auto_159993 ) ) ( not ( = ?auto_159989 ?auto_159990 ) ) ( not ( = ?auto_159989 ?auto_159991 ) ) ( not ( = ?auto_159989 ?auto_159992 ) ) ( not ( = ?auto_159989 ?auto_159993 ) ) ( not ( = ?auto_159990 ?auto_159991 ) ) ( not ( = ?auto_159990 ?auto_159992 ) ) ( not ( = ?auto_159990 ?auto_159993 ) ) ( not ( = ?auto_159991 ?auto_159992 ) ) ( not ( = ?auto_159991 ?auto_159993 ) ) ( not ( = ?auto_159992 ?auto_159993 ) ) ( ON ?auto_159991 ?auto_159992 ) ( ON ?auto_159990 ?auto_159991 ) ( ON ?auto_159989 ?auto_159990 ) ( ON ?auto_159988 ?auto_159989 ) ( ON ?auto_159987 ?auto_159988 ) ( ON ?auto_159986 ?auto_159987 ) ( ON ?auto_159985 ?auto_159986 ) ( CLEAR ?auto_159983 ) ( ON ?auto_159984 ?auto_159985 ) ( CLEAR ?auto_159984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159983 ?auto_159984 )
      ( MAKE-10PILE ?auto_159983 ?auto_159984 ?auto_159985 ?auto_159986 ?auto_159987 ?auto_159988 ?auto_159989 ?auto_159990 ?auto_159991 ?auto_159992 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_160025 - BLOCK
      ?auto_160026 - BLOCK
      ?auto_160027 - BLOCK
      ?auto_160028 - BLOCK
      ?auto_160029 - BLOCK
      ?auto_160030 - BLOCK
      ?auto_160031 - BLOCK
      ?auto_160032 - BLOCK
      ?auto_160033 - BLOCK
      ?auto_160034 - BLOCK
    )
    :vars
    (
      ?auto_160035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160034 ?auto_160035 ) ( not ( = ?auto_160025 ?auto_160026 ) ) ( not ( = ?auto_160025 ?auto_160027 ) ) ( not ( = ?auto_160025 ?auto_160028 ) ) ( not ( = ?auto_160025 ?auto_160029 ) ) ( not ( = ?auto_160025 ?auto_160030 ) ) ( not ( = ?auto_160025 ?auto_160031 ) ) ( not ( = ?auto_160025 ?auto_160032 ) ) ( not ( = ?auto_160025 ?auto_160033 ) ) ( not ( = ?auto_160025 ?auto_160034 ) ) ( not ( = ?auto_160025 ?auto_160035 ) ) ( not ( = ?auto_160026 ?auto_160027 ) ) ( not ( = ?auto_160026 ?auto_160028 ) ) ( not ( = ?auto_160026 ?auto_160029 ) ) ( not ( = ?auto_160026 ?auto_160030 ) ) ( not ( = ?auto_160026 ?auto_160031 ) ) ( not ( = ?auto_160026 ?auto_160032 ) ) ( not ( = ?auto_160026 ?auto_160033 ) ) ( not ( = ?auto_160026 ?auto_160034 ) ) ( not ( = ?auto_160026 ?auto_160035 ) ) ( not ( = ?auto_160027 ?auto_160028 ) ) ( not ( = ?auto_160027 ?auto_160029 ) ) ( not ( = ?auto_160027 ?auto_160030 ) ) ( not ( = ?auto_160027 ?auto_160031 ) ) ( not ( = ?auto_160027 ?auto_160032 ) ) ( not ( = ?auto_160027 ?auto_160033 ) ) ( not ( = ?auto_160027 ?auto_160034 ) ) ( not ( = ?auto_160027 ?auto_160035 ) ) ( not ( = ?auto_160028 ?auto_160029 ) ) ( not ( = ?auto_160028 ?auto_160030 ) ) ( not ( = ?auto_160028 ?auto_160031 ) ) ( not ( = ?auto_160028 ?auto_160032 ) ) ( not ( = ?auto_160028 ?auto_160033 ) ) ( not ( = ?auto_160028 ?auto_160034 ) ) ( not ( = ?auto_160028 ?auto_160035 ) ) ( not ( = ?auto_160029 ?auto_160030 ) ) ( not ( = ?auto_160029 ?auto_160031 ) ) ( not ( = ?auto_160029 ?auto_160032 ) ) ( not ( = ?auto_160029 ?auto_160033 ) ) ( not ( = ?auto_160029 ?auto_160034 ) ) ( not ( = ?auto_160029 ?auto_160035 ) ) ( not ( = ?auto_160030 ?auto_160031 ) ) ( not ( = ?auto_160030 ?auto_160032 ) ) ( not ( = ?auto_160030 ?auto_160033 ) ) ( not ( = ?auto_160030 ?auto_160034 ) ) ( not ( = ?auto_160030 ?auto_160035 ) ) ( not ( = ?auto_160031 ?auto_160032 ) ) ( not ( = ?auto_160031 ?auto_160033 ) ) ( not ( = ?auto_160031 ?auto_160034 ) ) ( not ( = ?auto_160031 ?auto_160035 ) ) ( not ( = ?auto_160032 ?auto_160033 ) ) ( not ( = ?auto_160032 ?auto_160034 ) ) ( not ( = ?auto_160032 ?auto_160035 ) ) ( not ( = ?auto_160033 ?auto_160034 ) ) ( not ( = ?auto_160033 ?auto_160035 ) ) ( not ( = ?auto_160034 ?auto_160035 ) ) ( ON ?auto_160033 ?auto_160034 ) ( ON ?auto_160032 ?auto_160033 ) ( ON ?auto_160031 ?auto_160032 ) ( ON ?auto_160030 ?auto_160031 ) ( ON ?auto_160029 ?auto_160030 ) ( ON ?auto_160028 ?auto_160029 ) ( ON ?auto_160027 ?auto_160028 ) ( ON ?auto_160026 ?auto_160027 ) ( ON ?auto_160025 ?auto_160026 ) ( CLEAR ?auto_160025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160025 )
      ( MAKE-10PILE ?auto_160025 ?auto_160026 ?auto_160027 ?auto_160028 ?auto_160029 ?auto_160030 ?auto_160031 ?auto_160032 ?auto_160033 ?auto_160034 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_160068 - BLOCK
      ?auto_160069 - BLOCK
      ?auto_160070 - BLOCK
      ?auto_160071 - BLOCK
      ?auto_160072 - BLOCK
      ?auto_160073 - BLOCK
      ?auto_160074 - BLOCK
      ?auto_160075 - BLOCK
      ?auto_160076 - BLOCK
      ?auto_160077 - BLOCK
      ?auto_160078 - BLOCK
    )
    :vars
    (
      ?auto_160079 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_160077 ) ( ON ?auto_160078 ?auto_160079 ) ( CLEAR ?auto_160078 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160068 ) ( ON ?auto_160069 ?auto_160068 ) ( ON ?auto_160070 ?auto_160069 ) ( ON ?auto_160071 ?auto_160070 ) ( ON ?auto_160072 ?auto_160071 ) ( ON ?auto_160073 ?auto_160072 ) ( ON ?auto_160074 ?auto_160073 ) ( ON ?auto_160075 ?auto_160074 ) ( ON ?auto_160076 ?auto_160075 ) ( ON ?auto_160077 ?auto_160076 ) ( not ( = ?auto_160068 ?auto_160069 ) ) ( not ( = ?auto_160068 ?auto_160070 ) ) ( not ( = ?auto_160068 ?auto_160071 ) ) ( not ( = ?auto_160068 ?auto_160072 ) ) ( not ( = ?auto_160068 ?auto_160073 ) ) ( not ( = ?auto_160068 ?auto_160074 ) ) ( not ( = ?auto_160068 ?auto_160075 ) ) ( not ( = ?auto_160068 ?auto_160076 ) ) ( not ( = ?auto_160068 ?auto_160077 ) ) ( not ( = ?auto_160068 ?auto_160078 ) ) ( not ( = ?auto_160068 ?auto_160079 ) ) ( not ( = ?auto_160069 ?auto_160070 ) ) ( not ( = ?auto_160069 ?auto_160071 ) ) ( not ( = ?auto_160069 ?auto_160072 ) ) ( not ( = ?auto_160069 ?auto_160073 ) ) ( not ( = ?auto_160069 ?auto_160074 ) ) ( not ( = ?auto_160069 ?auto_160075 ) ) ( not ( = ?auto_160069 ?auto_160076 ) ) ( not ( = ?auto_160069 ?auto_160077 ) ) ( not ( = ?auto_160069 ?auto_160078 ) ) ( not ( = ?auto_160069 ?auto_160079 ) ) ( not ( = ?auto_160070 ?auto_160071 ) ) ( not ( = ?auto_160070 ?auto_160072 ) ) ( not ( = ?auto_160070 ?auto_160073 ) ) ( not ( = ?auto_160070 ?auto_160074 ) ) ( not ( = ?auto_160070 ?auto_160075 ) ) ( not ( = ?auto_160070 ?auto_160076 ) ) ( not ( = ?auto_160070 ?auto_160077 ) ) ( not ( = ?auto_160070 ?auto_160078 ) ) ( not ( = ?auto_160070 ?auto_160079 ) ) ( not ( = ?auto_160071 ?auto_160072 ) ) ( not ( = ?auto_160071 ?auto_160073 ) ) ( not ( = ?auto_160071 ?auto_160074 ) ) ( not ( = ?auto_160071 ?auto_160075 ) ) ( not ( = ?auto_160071 ?auto_160076 ) ) ( not ( = ?auto_160071 ?auto_160077 ) ) ( not ( = ?auto_160071 ?auto_160078 ) ) ( not ( = ?auto_160071 ?auto_160079 ) ) ( not ( = ?auto_160072 ?auto_160073 ) ) ( not ( = ?auto_160072 ?auto_160074 ) ) ( not ( = ?auto_160072 ?auto_160075 ) ) ( not ( = ?auto_160072 ?auto_160076 ) ) ( not ( = ?auto_160072 ?auto_160077 ) ) ( not ( = ?auto_160072 ?auto_160078 ) ) ( not ( = ?auto_160072 ?auto_160079 ) ) ( not ( = ?auto_160073 ?auto_160074 ) ) ( not ( = ?auto_160073 ?auto_160075 ) ) ( not ( = ?auto_160073 ?auto_160076 ) ) ( not ( = ?auto_160073 ?auto_160077 ) ) ( not ( = ?auto_160073 ?auto_160078 ) ) ( not ( = ?auto_160073 ?auto_160079 ) ) ( not ( = ?auto_160074 ?auto_160075 ) ) ( not ( = ?auto_160074 ?auto_160076 ) ) ( not ( = ?auto_160074 ?auto_160077 ) ) ( not ( = ?auto_160074 ?auto_160078 ) ) ( not ( = ?auto_160074 ?auto_160079 ) ) ( not ( = ?auto_160075 ?auto_160076 ) ) ( not ( = ?auto_160075 ?auto_160077 ) ) ( not ( = ?auto_160075 ?auto_160078 ) ) ( not ( = ?auto_160075 ?auto_160079 ) ) ( not ( = ?auto_160076 ?auto_160077 ) ) ( not ( = ?auto_160076 ?auto_160078 ) ) ( not ( = ?auto_160076 ?auto_160079 ) ) ( not ( = ?auto_160077 ?auto_160078 ) ) ( not ( = ?auto_160077 ?auto_160079 ) ) ( not ( = ?auto_160078 ?auto_160079 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160078 ?auto_160079 )
      ( !STACK ?auto_160078 ?auto_160077 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_160114 - BLOCK
      ?auto_160115 - BLOCK
      ?auto_160116 - BLOCK
      ?auto_160117 - BLOCK
      ?auto_160118 - BLOCK
      ?auto_160119 - BLOCK
      ?auto_160120 - BLOCK
      ?auto_160121 - BLOCK
      ?auto_160122 - BLOCK
      ?auto_160123 - BLOCK
      ?auto_160124 - BLOCK
    )
    :vars
    (
      ?auto_160125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160124 ?auto_160125 ) ( ON-TABLE ?auto_160114 ) ( ON ?auto_160115 ?auto_160114 ) ( ON ?auto_160116 ?auto_160115 ) ( ON ?auto_160117 ?auto_160116 ) ( ON ?auto_160118 ?auto_160117 ) ( ON ?auto_160119 ?auto_160118 ) ( ON ?auto_160120 ?auto_160119 ) ( ON ?auto_160121 ?auto_160120 ) ( ON ?auto_160122 ?auto_160121 ) ( not ( = ?auto_160114 ?auto_160115 ) ) ( not ( = ?auto_160114 ?auto_160116 ) ) ( not ( = ?auto_160114 ?auto_160117 ) ) ( not ( = ?auto_160114 ?auto_160118 ) ) ( not ( = ?auto_160114 ?auto_160119 ) ) ( not ( = ?auto_160114 ?auto_160120 ) ) ( not ( = ?auto_160114 ?auto_160121 ) ) ( not ( = ?auto_160114 ?auto_160122 ) ) ( not ( = ?auto_160114 ?auto_160123 ) ) ( not ( = ?auto_160114 ?auto_160124 ) ) ( not ( = ?auto_160114 ?auto_160125 ) ) ( not ( = ?auto_160115 ?auto_160116 ) ) ( not ( = ?auto_160115 ?auto_160117 ) ) ( not ( = ?auto_160115 ?auto_160118 ) ) ( not ( = ?auto_160115 ?auto_160119 ) ) ( not ( = ?auto_160115 ?auto_160120 ) ) ( not ( = ?auto_160115 ?auto_160121 ) ) ( not ( = ?auto_160115 ?auto_160122 ) ) ( not ( = ?auto_160115 ?auto_160123 ) ) ( not ( = ?auto_160115 ?auto_160124 ) ) ( not ( = ?auto_160115 ?auto_160125 ) ) ( not ( = ?auto_160116 ?auto_160117 ) ) ( not ( = ?auto_160116 ?auto_160118 ) ) ( not ( = ?auto_160116 ?auto_160119 ) ) ( not ( = ?auto_160116 ?auto_160120 ) ) ( not ( = ?auto_160116 ?auto_160121 ) ) ( not ( = ?auto_160116 ?auto_160122 ) ) ( not ( = ?auto_160116 ?auto_160123 ) ) ( not ( = ?auto_160116 ?auto_160124 ) ) ( not ( = ?auto_160116 ?auto_160125 ) ) ( not ( = ?auto_160117 ?auto_160118 ) ) ( not ( = ?auto_160117 ?auto_160119 ) ) ( not ( = ?auto_160117 ?auto_160120 ) ) ( not ( = ?auto_160117 ?auto_160121 ) ) ( not ( = ?auto_160117 ?auto_160122 ) ) ( not ( = ?auto_160117 ?auto_160123 ) ) ( not ( = ?auto_160117 ?auto_160124 ) ) ( not ( = ?auto_160117 ?auto_160125 ) ) ( not ( = ?auto_160118 ?auto_160119 ) ) ( not ( = ?auto_160118 ?auto_160120 ) ) ( not ( = ?auto_160118 ?auto_160121 ) ) ( not ( = ?auto_160118 ?auto_160122 ) ) ( not ( = ?auto_160118 ?auto_160123 ) ) ( not ( = ?auto_160118 ?auto_160124 ) ) ( not ( = ?auto_160118 ?auto_160125 ) ) ( not ( = ?auto_160119 ?auto_160120 ) ) ( not ( = ?auto_160119 ?auto_160121 ) ) ( not ( = ?auto_160119 ?auto_160122 ) ) ( not ( = ?auto_160119 ?auto_160123 ) ) ( not ( = ?auto_160119 ?auto_160124 ) ) ( not ( = ?auto_160119 ?auto_160125 ) ) ( not ( = ?auto_160120 ?auto_160121 ) ) ( not ( = ?auto_160120 ?auto_160122 ) ) ( not ( = ?auto_160120 ?auto_160123 ) ) ( not ( = ?auto_160120 ?auto_160124 ) ) ( not ( = ?auto_160120 ?auto_160125 ) ) ( not ( = ?auto_160121 ?auto_160122 ) ) ( not ( = ?auto_160121 ?auto_160123 ) ) ( not ( = ?auto_160121 ?auto_160124 ) ) ( not ( = ?auto_160121 ?auto_160125 ) ) ( not ( = ?auto_160122 ?auto_160123 ) ) ( not ( = ?auto_160122 ?auto_160124 ) ) ( not ( = ?auto_160122 ?auto_160125 ) ) ( not ( = ?auto_160123 ?auto_160124 ) ) ( not ( = ?auto_160123 ?auto_160125 ) ) ( not ( = ?auto_160124 ?auto_160125 ) ) ( CLEAR ?auto_160122 ) ( ON ?auto_160123 ?auto_160124 ) ( CLEAR ?auto_160123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_160114 ?auto_160115 ?auto_160116 ?auto_160117 ?auto_160118 ?auto_160119 ?auto_160120 ?auto_160121 ?auto_160122 ?auto_160123 )
      ( MAKE-11PILE ?auto_160114 ?auto_160115 ?auto_160116 ?auto_160117 ?auto_160118 ?auto_160119 ?auto_160120 ?auto_160121 ?auto_160122 ?auto_160123 ?auto_160124 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_160160 - BLOCK
      ?auto_160161 - BLOCK
      ?auto_160162 - BLOCK
      ?auto_160163 - BLOCK
      ?auto_160164 - BLOCK
      ?auto_160165 - BLOCK
      ?auto_160166 - BLOCK
      ?auto_160167 - BLOCK
      ?auto_160168 - BLOCK
      ?auto_160169 - BLOCK
      ?auto_160170 - BLOCK
    )
    :vars
    (
      ?auto_160171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160170 ?auto_160171 ) ( ON-TABLE ?auto_160160 ) ( ON ?auto_160161 ?auto_160160 ) ( ON ?auto_160162 ?auto_160161 ) ( ON ?auto_160163 ?auto_160162 ) ( ON ?auto_160164 ?auto_160163 ) ( ON ?auto_160165 ?auto_160164 ) ( ON ?auto_160166 ?auto_160165 ) ( ON ?auto_160167 ?auto_160166 ) ( not ( = ?auto_160160 ?auto_160161 ) ) ( not ( = ?auto_160160 ?auto_160162 ) ) ( not ( = ?auto_160160 ?auto_160163 ) ) ( not ( = ?auto_160160 ?auto_160164 ) ) ( not ( = ?auto_160160 ?auto_160165 ) ) ( not ( = ?auto_160160 ?auto_160166 ) ) ( not ( = ?auto_160160 ?auto_160167 ) ) ( not ( = ?auto_160160 ?auto_160168 ) ) ( not ( = ?auto_160160 ?auto_160169 ) ) ( not ( = ?auto_160160 ?auto_160170 ) ) ( not ( = ?auto_160160 ?auto_160171 ) ) ( not ( = ?auto_160161 ?auto_160162 ) ) ( not ( = ?auto_160161 ?auto_160163 ) ) ( not ( = ?auto_160161 ?auto_160164 ) ) ( not ( = ?auto_160161 ?auto_160165 ) ) ( not ( = ?auto_160161 ?auto_160166 ) ) ( not ( = ?auto_160161 ?auto_160167 ) ) ( not ( = ?auto_160161 ?auto_160168 ) ) ( not ( = ?auto_160161 ?auto_160169 ) ) ( not ( = ?auto_160161 ?auto_160170 ) ) ( not ( = ?auto_160161 ?auto_160171 ) ) ( not ( = ?auto_160162 ?auto_160163 ) ) ( not ( = ?auto_160162 ?auto_160164 ) ) ( not ( = ?auto_160162 ?auto_160165 ) ) ( not ( = ?auto_160162 ?auto_160166 ) ) ( not ( = ?auto_160162 ?auto_160167 ) ) ( not ( = ?auto_160162 ?auto_160168 ) ) ( not ( = ?auto_160162 ?auto_160169 ) ) ( not ( = ?auto_160162 ?auto_160170 ) ) ( not ( = ?auto_160162 ?auto_160171 ) ) ( not ( = ?auto_160163 ?auto_160164 ) ) ( not ( = ?auto_160163 ?auto_160165 ) ) ( not ( = ?auto_160163 ?auto_160166 ) ) ( not ( = ?auto_160163 ?auto_160167 ) ) ( not ( = ?auto_160163 ?auto_160168 ) ) ( not ( = ?auto_160163 ?auto_160169 ) ) ( not ( = ?auto_160163 ?auto_160170 ) ) ( not ( = ?auto_160163 ?auto_160171 ) ) ( not ( = ?auto_160164 ?auto_160165 ) ) ( not ( = ?auto_160164 ?auto_160166 ) ) ( not ( = ?auto_160164 ?auto_160167 ) ) ( not ( = ?auto_160164 ?auto_160168 ) ) ( not ( = ?auto_160164 ?auto_160169 ) ) ( not ( = ?auto_160164 ?auto_160170 ) ) ( not ( = ?auto_160164 ?auto_160171 ) ) ( not ( = ?auto_160165 ?auto_160166 ) ) ( not ( = ?auto_160165 ?auto_160167 ) ) ( not ( = ?auto_160165 ?auto_160168 ) ) ( not ( = ?auto_160165 ?auto_160169 ) ) ( not ( = ?auto_160165 ?auto_160170 ) ) ( not ( = ?auto_160165 ?auto_160171 ) ) ( not ( = ?auto_160166 ?auto_160167 ) ) ( not ( = ?auto_160166 ?auto_160168 ) ) ( not ( = ?auto_160166 ?auto_160169 ) ) ( not ( = ?auto_160166 ?auto_160170 ) ) ( not ( = ?auto_160166 ?auto_160171 ) ) ( not ( = ?auto_160167 ?auto_160168 ) ) ( not ( = ?auto_160167 ?auto_160169 ) ) ( not ( = ?auto_160167 ?auto_160170 ) ) ( not ( = ?auto_160167 ?auto_160171 ) ) ( not ( = ?auto_160168 ?auto_160169 ) ) ( not ( = ?auto_160168 ?auto_160170 ) ) ( not ( = ?auto_160168 ?auto_160171 ) ) ( not ( = ?auto_160169 ?auto_160170 ) ) ( not ( = ?auto_160169 ?auto_160171 ) ) ( not ( = ?auto_160170 ?auto_160171 ) ) ( ON ?auto_160169 ?auto_160170 ) ( CLEAR ?auto_160167 ) ( ON ?auto_160168 ?auto_160169 ) ( CLEAR ?auto_160168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_160160 ?auto_160161 ?auto_160162 ?auto_160163 ?auto_160164 ?auto_160165 ?auto_160166 ?auto_160167 ?auto_160168 )
      ( MAKE-11PILE ?auto_160160 ?auto_160161 ?auto_160162 ?auto_160163 ?auto_160164 ?auto_160165 ?auto_160166 ?auto_160167 ?auto_160168 ?auto_160169 ?auto_160170 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_160206 - BLOCK
      ?auto_160207 - BLOCK
      ?auto_160208 - BLOCK
      ?auto_160209 - BLOCK
      ?auto_160210 - BLOCK
      ?auto_160211 - BLOCK
      ?auto_160212 - BLOCK
      ?auto_160213 - BLOCK
      ?auto_160214 - BLOCK
      ?auto_160215 - BLOCK
      ?auto_160216 - BLOCK
    )
    :vars
    (
      ?auto_160217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160216 ?auto_160217 ) ( ON-TABLE ?auto_160206 ) ( ON ?auto_160207 ?auto_160206 ) ( ON ?auto_160208 ?auto_160207 ) ( ON ?auto_160209 ?auto_160208 ) ( ON ?auto_160210 ?auto_160209 ) ( ON ?auto_160211 ?auto_160210 ) ( ON ?auto_160212 ?auto_160211 ) ( not ( = ?auto_160206 ?auto_160207 ) ) ( not ( = ?auto_160206 ?auto_160208 ) ) ( not ( = ?auto_160206 ?auto_160209 ) ) ( not ( = ?auto_160206 ?auto_160210 ) ) ( not ( = ?auto_160206 ?auto_160211 ) ) ( not ( = ?auto_160206 ?auto_160212 ) ) ( not ( = ?auto_160206 ?auto_160213 ) ) ( not ( = ?auto_160206 ?auto_160214 ) ) ( not ( = ?auto_160206 ?auto_160215 ) ) ( not ( = ?auto_160206 ?auto_160216 ) ) ( not ( = ?auto_160206 ?auto_160217 ) ) ( not ( = ?auto_160207 ?auto_160208 ) ) ( not ( = ?auto_160207 ?auto_160209 ) ) ( not ( = ?auto_160207 ?auto_160210 ) ) ( not ( = ?auto_160207 ?auto_160211 ) ) ( not ( = ?auto_160207 ?auto_160212 ) ) ( not ( = ?auto_160207 ?auto_160213 ) ) ( not ( = ?auto_160207 ?auto_160214 ) ) ( not ( = ?auto_160207 ?auto_160215 ) ) ( not ( = ?auto_160207 ?auto_160216 ) ) ( not ( = ?auto_160207 ?auto_160217 ) ) ( not ( = ?auto_160208 ?auto_160209 ) ) ( not ( = ?auto_160208 ?auto_160210 ) ) ( not ( = ?auto_160208 ?auto_160211 ) ) ( not ( = ?auto_160208 ?auto_160212 ) ) ( not ( = ?auto_160208 ?auto_160213 ) ) ( not ( = ?auto_160208 ?auto_160214 ) ) ( not ( = ?auto_160208 ?auto_160215 ) ) ( not ( = ?auto_160208 ?auto_160216 ) ) ( not ( = ?auto_160208 ?auto_160217 ) ) ( not ( = ?auto_160209 ?auto_160210 ) ) ( not ( = ?auto_160209 ?auto_160211 ) ) ( not ( = ?auto_160209 ?auto_160212 ) ) ( not ( = ?auto_160209 ?auto_160213 ) ) ( not ( = ?auto_160209 ?auto_160214 ) ) ( not ( = ?auto_160209 ?auto_160215 ) ) ( not ( = ?auto_160209 ?auto_160216 ) ) ( not ( = ?auto_160209 ?auto_160217 ) ) ( not ( = ?auto_160210 ?auto_160211 ) ) ( not ( = ?auto_160210 ?auto_160212 ) ) ( not ( = ?auto_160210 ?auto_160213 ) ) ( not ( = ?auto_160210 ?auto_160214 ) ) ( not ( = ?auto_160210 ?auto_160215 ) ) ( not ( = ?auto_160210 ?auto_160216 ) ) ( not ( = ?auto_160210 ?auto_160217 ) ) ( not ( = ?auto_160211 ?auto_160212 ) ) ( not ( = ?auto_160211 ?auto_160213 ) ) ( not ( = ?auto_160211 ?auto_160214 ) ) ( not ( = ?auto_160211 ?auto_160215 ) ) ( not ( = ?auto_160211 ?auto_160216 ) ) ( not ( = ?auto_160211 ?auto_160217 ) ) ( not ( = ?auto_160212 ?auto_160213 ) ) ( not ( = ?auto_160212 ?auto_160214 ) ) ( not ( = ?auto_160212 ?auto_160215 ) ) ( not ( = ?auto_160212 ?auto_160216 ) ) ( not ( = ?auto_160212 ?auto_160217 ) ) ( not ( = ?auto_160213 ?auto_160214 ) ) ( not ( = ?auto_160213 ?auto_160215 ) ) ( not ( = ?auto_160213 ?auto_160216 ) ) ( not ( = ?auto_160213 ?auto_160217 ) ) ( not ( = ?auto_160214 ?auto_160215 ) ) ( not ( = ?auto_160214 ?auto_160216 ) ) ( not ( = ?auto_160214 ?auto_160217 ) ) ( not ( = ?auto_160215 ?auto_160216 ) ) ( not ( = ?auto_160215 ?auto_160217 ) ) ( not ( = ?auto_160216 ?auto_160217 ) ) ( ON ?auto_160215 ?auto_160216 ) ( ON ?auto_160214 ?auto_160215 ) ( CLEAR ?auto_160212 ) ( ON ?auto_160213 ?auto_160214 ) ( CLEAR ?auto_160213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_160206 ?auto_160207 ?auto_160208 ?auto_160209 ?auto_160210 ?auto_160211 ?auto_160212 ?auto_160213 )
      ( MAKE-11PILE ?auto_160206 ?auto_160207 ?auto_160208 ?auto_160209 ?auto_160210 ?auto_160211 ?auto_160212 ?auto_160213 ?auto_160214 ?auto_160215 ?auto_160216 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_160252 - BLOCK
      ?auto_160253 - BLOCK
      ?auto_160254 - BLOCK
      ?auto_160255 - BLOCK
      ?auto_160256 - BLOCK
      ?auto_160257 - BLOCK
      ?auto_160258 - BLOCK
      ?auto_160259 - BLOCK
      ?auto_160260 - BLOCK
      ?auto_160261 - BLOCK
      ?auto_160262 - BLOCK
    )
    :vars
    (
      ?auto_160263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160262 ?auto_160263 ) ( ON-TABLE ?auto_160252 ) ( ON ?auto_160253 ?auto_160252 ) ( ON ?auto_160254 ?auto_160253 ) ( ON ?auto_160255 ?auto_160254 ) ( ON ?auto_160256 ?auto_160255 ) ( ON ?auto_160257 ?auto_160256 ) ( not ( = ?auto_160252 ?auto_160253 ) ) ( not ( = ?auto_160252 ?auto_160254 ) ) ( not ( = ?auto_160252 ?auto_160255 ) ) ( not ( = ?auto_160252 ?auto_160256 ) ) ( not ( = ?auto_160252 ?auto_160257 ) ) ( not ( = ?auto_160252 ?auto_160258 ) ) ( not ( = ?auto_160252 ?auto_160259 ) ) ( not ( = ?auto_160252 ?auto_160260 ) ) ( not ( = ?auto_160252 ?auto_160261 ) ) ( not ( = ?auto_160252 ?auto_160262 ) ) ( not ( = ?auto_160252 ?auto_160263 ) ) ( not ( = ?auto_160253 ?auto_160254 ) ) ( not ( = ?auto_160253 ?auto_160255 ) ) ( not ( = ?auto_160253 ?auto_160256 ) ) ( not ( = ?auto_160253 ?auto_160257 ) ) ( not ( = ?auto_160253 ?auto_160258 ) ) ( not ( = ?auto_160253 ?auto_160259 ) ) ( not ( = ?auto_160253 ?auto_160260 ) ) ( not ( = ?auto_160253 ?auto_160261 ) ) ( not ( = ?auto_160253 ?auto_160262 ) ) ( not ( = ?auto_160253 ?auto_160263 ) ) ( not ( = ?auto_160254 ?auto_160255 ) ) ( not ( = ?auto_160254 ?auto_160256 ) ) ( not ( = ?auto_160254 ?auto_160257 ) ) ( not ( = ?auto_160254 ?auto_160258 ) ) ( not ( = ?auto_160254 ?auto_160259 ) ) ( not ( = ?auto_160254 ?auto_160260 ) ) ( not ( = ?auto_160254 ?auto_160261 ) ) ( not ( = ?auto_160254 ?auto_160262 ) ) ( not ( = ?auto_160254 ?auto_160263 ) ) ( not ( = ?auto_160255 ?auto_160256 ) ) ( not ( = ?auto_160255 ?auto_160257 ) ) ( not ( = ?auto_160255 ?auto_160258 ) ) ( not ( = ?auto_160255 ?auto_160259 ) ) ( not ( = ?auto_160255 ?auto_160260 ) ) ( not ( = ?auto_160255 ?auto_160261 ) ) ( not ( = ?auto_160255 ?auto_160262 ) ) ( not ( = ?auto_160255 ?auto_160263 ) ) ( not ( = ?auto_160256 ?auto_160257 ) ) ( not ( = ?auto_160256 ?auto_160258 ) ) ( not ( = ?auto_160256 ?auto_160259 ) ) ( not ( = ?auto_160256 ?auto_160260 ) ) ( not ( = ?auto_160256 ?auto_160261 ) ) ( not ( = ?auto_160256 ?auto_160262 ) ) ( not ( = ?auto_160256 ?auto_160263 ) ) ( not ( = ?auto_160257 ?auto_160258 ) ) ( not ( = ?auto_160257 ?auto_160259 ) ) ( not ( = ?auto_160257 ?auto_160260 ) ) ( not ( = ?auto_160257 ?auto_160261 ) ) ( not ( = ?auto_160257 ?auto_160262 ) ) ( not ( = ?auto_160257 ?auto_160263 ) ) ( not ( = ?auto_160258 ?auto_160259 ) ) ( not ( = ?auto_160258 ?auto_160260 ) ) ( not ( = ?auto_160258 ?auto_160261 ) ) ( not ( = ?auto_160258 ?auto_160262 ) ) ( not ( = ?auto_160258 ?auto_160263 ) ) ( not ( = ?auto_160259 ?auto_160260 ) ) ( not ( = ?auto_160259 ?auto_160261 ) ) ( not ( = ?auto_160259 ?auto_160262 ) ) ( not ( = ?auto_160259 ?auto_160263 ) ) ( not ( = ?auto_160260 ?auto_160261 ) ) ( not ( = ?auto_160260 ?auto_160262 ) ) ( not ( = ?auto_160260 ?auto_160263 ) ) ( not ( = ?auto_160261 ?auto_160262 ) ) ( not ( = ?auto_160261 ?auto_160263 ) ) ( not ( = ?auto_160262 ?auto_160263 ) ) ( ON ?auto_160261 ?auto_160262 ) ( ON ?auto_160260 ?auto_160261 ) ( ON ?auto_160259 ?auto_160260 ) ( CLEAR ?auto_160257 ) ( ON ?auto_160258 ?auto_160259 ) ( CLEAR ?auto_160258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160252 ?auto_160253 ?auto_160254 ?auto_160255 ?auto_160256 ?auto_160257 ?auto_160258 )
      ( MAKE-11PILE ?auto_160252 ?auto_160253 ?auto_160254 ?auto_160255 ?auto_160256 ?auto_160257 ?auto_160258 ?auto_160259 ?auto_160260 ?auto_160261 ?auto_160262 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_160298 - BLOCK
      ?auto_160299 - BLOCK
      ?auto_160300 - BLOCK
      ?auto_160301 - BLOCK
      ?auto_160302 - BLOCK
      ?auto_160303 - BLOCK
      ?auto_160304 - BLOCK
      ?auto_160305 - BLOCK
      ?auto_160306 - BLOCK
      ?auto_160307 - BLOCK
      ?auto_160308 - BLOCK
    )
    :vars
    (
      ?auto_160309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160308 ?auto_160309 ) ( ON-TABLE ?auto_160298 ) ( ON ?auto_160299 ?auto_160298 ) ( ON ?auto_160300 ?auto_160299 ) ( ON ?auto_160301 ?auto_160300 ) ( ON ?auto_160302 ?auto_160301 ) ( not ( = ?auto_160298 ?auto_160299 ) ) ( not ( = ?auto_160298 ?auto_160300 ) ) ( not ( = ?auto_160298 ?auto_160301 ) ) ( not ( = ?auto_160298 ?auto_160302 ) ) ( not ( = ?auto_160298 ?auto_160303 ) ) ( not ( = ?auto_160298 ?auto_160304 ) ) ( not ( = ?auto_160298 ?auto_160305 ) ) ( not ( = ?auto_160298 ?auto_160306 ) ) ( not ( = ?auto_160298 ?auto_160307 ) ) ( not ( = ?auto_160298 ?auto_160308 ) ) ( not ( = ?auto_160298 ?auto_160309 ) ) ( not ( = ?auto_160299 ?auto_160300 ) ) ( not ( = ?auto_160299 ?auto_160301 ) ) ( not ( = ?auto_160299 ?auto_160302 ) ) ( not ( = ?auto_160299 ?auto_160303 ) ) ( not ( = ?auto_160299 ?auto_160304 ) ) ( not ( = ?auto_160299 ?auto_160305 ) ) ( not ( = ?auto_160299 ?auto_160306 ) ) ( not ( = ?auto_160299 ?auto_160307 ) ) ( not ( = ?auto_160299 ?auto_160308 ) ) ( not ( = ?auto_160299 ?auto_160309 ) ) ( not ( = ?auto_160300 ?auto_160301 ) ) ( not ( = ?auto_160300 ?auto_160302 ) ) ( not ( = ?auto_160300 ?auto_160303 ) ) ( not ( = ?auto_160300 ?auto_160304 ) ) ( not ( = ?auto_160300 ?auto_160305 ) ) ( not ( = ?auto_160300 ?auto_160306 ) ) ( not ( = ?auto_160300 ?auto_160307 ) ) ( not ( = ?auto_160300 ?auto_160308 ) ) ( not ( = ?auto_160300 ?auto_160309 ) ) ( not ( = ?auto_160301 ?auto_160302 ) ) ( not ( = ?auto_160301 ?auto_160303 ) ) ( not ( = ?auto_160301 ?auto_160304 ) ) ( not ( = ?auto_160301 ?auto_160305 ) ) ( not ( = ?auto_160301 ?auto_160306 ) ) ( not ( = ?auto_160301 ?auto_160307 ) ) ( not ( = ?auto_160301 ?auto_160308 ) ) ( not ( = ?auto_160301 ?auto_160309 ) ) ( not ( = ?auto_160302 ?auto_160303 ) ) ( not ( = ?auto_160302 ?auto_160304 ) ) ( not ( = ?auto_160302 ?auto_160305 ) ) ( not ( = ?auto_160302 ?auto_160306 ) ) ( not ( = ?auto_160302 ?auto_160307 ) ) ( not ( = ?auto_160302 ?auto_160308 ) ) ( not ( = ?auto_160302 ?auto_160309 ) ) ( not ( = ?auto_160303 ?auto_160304 ) ) ( not ( = ?auto_160303 ?auto_160305 ) ) ( not ( = ?auto_160303 ?auto_160306 ) ) ( not ( = ?auto_160303 ?auto_160307 ) ) ( not ( = ?auto_160303 ?auto_160308 ) ) ( not ( = ?auto_160303 ?auto_160309 ) ) ( not ( = ?auto_160304 ?auto_160305 ) ) ( not ( = ?auto_160304 ?auto_160306 ) ) ( not ( = ?auto_160304 ?auto_160307 ) ) ( not ( = ?auto_160304 ?auto_160308 ) ) ( not ( = ?auto_160304 ?auto_160309 ) ) ( not ( = ?auto_160305 ?auto_160306 ) ) ( not ( = ?auto_160305 ?auto_160307 ) ) ( not ( = ?auto_160305 ?auto_160308 ) ) ( not ( = ?auto_160305 ?auto_160309 ) ) ( not ( = ?auto_160306 ?auto_160307 ) ) ( not ( = ?auto_160306 ?auto_160308 ) ) ( not ( = ?auto_160306 ?auto_160309 ) ) ( not ( = ?auto_160307 ?auto_160308 ) ) ( not ( = ?auto_160307 ?auto_160309 ) ) ( not ( = ?auto_160308 ?auto_160309 ) ) ( ON ?auto_160307 ?auto_160308 ) ( ON ?auto_160306 ?auto_160307 ) ( ON ?auto_160305 ?auto_160306 ) ( ON ?auto_160304 ?auto_160305 ) ( CLEAR ?auto_160302 ) ( ON ?auto_160303 ?auto_160304 ) ( CLEAR ?auto_160303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160298 ?auto_160299 ?auto_160300 ?auto_160301 ?auto_160302 ?auto_160303 )
      ( MAKE-11PILE ?auto_160298 ?auto_160299 ?auto_160300 ?auto_160301 ?auto_160302 ?auto_160303 ?auto_160304 ?auto_160305 ?auto_160306 ?auto_160307 ?auto_160308 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_160344 - BLOCK
      ?auto_160345 - BLOCK
      ?auto_160346 - BLOCK
      ?auto_160347 - BLOCK
      ?auto_160348 - BLOCK
      ?auto_160349 - BLOCK
      ?auto_160350 - BLOCK
      ?auto_160351 - BLOCK
      ?auto_160352 - BLOCK
      ?auto_160353 - BLOCK
      ?auto_160354 - BLOCK
    )
    :vars
    (
      ?auto_160355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160354 ?auto_160355 ) ( ON-TABLE ?auto_160344 ) ( ON ?auto_160345 ?auto_160344 ) ( ON ?auto_160346 ?auto_160345 ) ( ON ?auto_160347 ?auto_160346 ) ( not ( = ?auto_160344 ?auto_160345 ) ) ( not ( = ?auto_160344 ?auto_160346 ) ) ( not ( = ?auto_160344 ?auto_160347 ) ) ( not ( = ?auto_160344 ?auto_160348 ) ) ( not ( = ?auto_160344 ?auto_160349 ) ) ( not ( = ?auto_160344 ?auto_160350 ) ) ( not ( = ?auto_160344 ?auto_160351 ) ) ( not ( = ?auto_160344 ?auto_160352 ) ) ( not ( = ?auto_160344 ?auto_160353 ) ) ( not ( = ?auto_160344 ?auto_160354 ) ) ( not ( = ?auto_160344 ?auto_160355 ) ) ( not ( = ?auto_160345 ?auto_160346 ) ) ( not ( = ?auto_160345 ?auto_160347 ) ) ( not ( = ?auto_160345 ?auto_160348 ) ) ( not ( = ?auto_160345 ?auto_160349 ) ) ( not ( = ?auto_160345 ?auto_160350 ) ) ( not ( = ?auto_160345 ?auto_160351 ) ) ( not ( = ?auto_160345 ?auto_160352 ) ) ( not ( = ?auto_160345 ?auto_160353 ) ) ( not ( = ?auto_160345 ?auto_160354 ) ) ( not ( = ?auto_160345 ?auto_160355 ) ) ( not ( = ?auto_160346 ?auto_160347 ) ) ( not ( = ?auto_160346 ?auto_160348 ) ) ( not ( = ?auto_160346 ?auto_160349 ) ) ( not ( = ?auto_160346 ?auto_160350 ) ) ( not ( = ?auto_160346 ?auto_160351 ) ) ( not ( = ?auto_160346 ?auto_160352 ) ) ( not ( = ?auto_160346 ?auto_160353 ) ) ( not ( = ?auto_160346 ?auto_160354 ) ) ( not ( = ?auto_160346 ?auto_160355 ) ) ( not ( = ?auto_160347 ?auto_160348 ) ) ( not ( = ?auto_160347 ?auto_160349 ) ) ( not ( = ?auto_160347 ?auto_160350 ) ) ( not ( = ?auto_160347 ?auto_160351 ) ) ( not ( = ?auto_160347 ?auto_160352 ) ) ( not ( = ?auto_160347 ?auto_160353 ) ) ( not ( = ?auto_160347 ?auto_160354 ) ) ( not ( = ?auto_160347 ?auto_160355 ) ) ( not ( = ?auto_160348 ?auto_160349 ) ) ( not ( = ?auto_160348 ?auto_160350 ) ) ( not ( = ?auto_160348 ?auto_160351 ) ) ( not ( = ?auto_160348 ?auto_160352 ) ) ( not ( = ?auto_160348 ?auto_160353 ) ) ( not ( = ?auto_160348 ?auto_160354 ) ) ( not ( = ?auto_160348 ?auto_160355 ) ) ( not ( = ?auto_160349 ?auto_160350 ) ) ( not ( = ?auto_160349 ?auto_160351 ) ) ( not ( = ?auto_160349 ?auto_160352 ) ) ( not ( = ?auto_160349 ?auto_160353 ) ) ( not ( = ?auto_160349 ?auto_160354 ) ) ( not ( = ?auto_160349 ?auto_160355 ) ) ( not ( = ?auto_160350 ?auto_160351 ) ) ( not ( = ?auto_160350 ?auto_160352 ) ) ( not ( = ?auto_160350 ?auto_160353 ) ) ( not ( = ?auto_160350 ?auto_160354 ) ) ( not ( = ?auto_160350 ?auto_160355 ) ) ( not ( = ?auto_160351 ?auto_160352 ) ) ( not ( = ?auto_160351 ?auto_160353 ) ) ( not ( = ?auto_160351 ?auto_160354 ) ) ( not ( = ?auto_160351 ?auto_160355 ) ) ( not ( = ?auto_160352 ?auto_160353 ) ) ( not ( = ?auto_160352 ?auto_160354 ) ) ( not ( = ?auto_160352 ?auto_160355 ) ) ( not ( = ?auto_160353 ?auto_160354 ) ) ( not ( = ?auto_160353 ?auto_160355 ) ) ( not ( = ?auto_160354 ?auto_160355 ) ) ( ON ?auto_160353 ?auto_160354 ) ( ON ?auto_160352 ?auto_160353 ) ( ON ?auto_160351 ?auto_160352 ) ( ON ?auto_160350 ?auto_160351 ) ( ON ?auto_160349 ?auto_160350 ) ( CLEAR ?auto_160347 ) ( ON ?auto_160348 ?auto_160349 ) ( CLEAR ?auto_160348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160344 ?auto_160345 ?auto_160346 ?auto_160347 ?auto_160348 )
      ( MAKE-11PILE ?auto_160344 ?auto_160345 ?auto_160346 ?auto_160347 ?auto_160348 ?auto_160349 ?auto_160350 ?auto_160351 ?auto_160352 ?auto_160353 ?auto_160354 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_160390 - BLOCK
      ?auto_160391 - BLOCK
      ?auto_160392 - BLOCK
      ?auto_160393 - BLOCK
      ?auto_160394 - BLOCK
      ?auto_160395 - BLOCK
      ?auto_160396 - BLOCK
      ?auto_160397 - BLOCK
      ?auto_160398 - BLOCK
      ?auto_160399 - BLOCK
      ?auto_160400 - BLOCK
    )
    :vars
    (
      ?auto_160401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160400 ?auto_160401 ) ( ON-TABLE ?auto_160390 ) ( ON ?auto_160391 ?auto_160390 ) ( ON ?auto_160392 ?auto_160391 ) ( not ( = ?auto_160390 ?auto_160391 ) ) ( not ( = ?auto_160390 ?auto_160392 ) ) ( not ( = ?auto_160390 ?auto_160393 ) ) ( not ( = ?auto_160390 ?auto_160394 ) ) ( not ( = ?auto_160390 ?auto_160395 ) ) ( not ( = ?auto_160390 ?auto_160396 ) ) ( not ( = ?auto_160390 ?auto_160397 ) ) ( not ( = ?auto_160390 ?auto_160398 ) ) ( not ( = ?auto_160390 ?auto_160399 ) ) ( not ( = ?auto_160390 ?auto_160400 ) ) ( not ( = ?auto_160390 ?auto_160401 ) ) ( not ( = ?auto_160391 ?auto_160392 ) ) ( not ( = ?auto_160391 ?auto_160393 ) ) ( not ( = ?auto_160391 ?auto_160394 ) ) ( not ( = ?auto_160391 ?auto_160395 ) ) ( not ( = ?auto_160391 ?auto_160396 ) ) ( not ( = ?auto_160391 ?auto_160397 ) ) ( not ( = ?auto_160391 ?auto_160398 ) ) ( not ( = ?auto_160391 ?auto_160399 ) ) ( not ( = ?auto_160391 ?auto_160400 ) ) ( not ( = ?auto_160391 ?auto_160401 ) ) ( not ( = ?auto_160392 ?auto_160393 ) ) ( not ( = ?auto_160392 ?auto_160394 ) ) ( not ( = ?auto_160392 ?auto_160395 ) ) ( not ( = ?auto_160392 ?auto_160396 ) ) ( not ( = ?auto_160392 ?auto_160397 ) ) ( not ( = ?auto_160392 ?auto_160398 ) ) ( not ( = ?auto_160392 ?auto_160399 ) ) ( not ( = ?auto_160392 ?auto_160400 ) ) ( not ( = ?auto_160392 ?auto_160401 ) ) ( not ( = ?auto_160393 ?auto_160394 ) ) ( not ( = ?auto_160393 ?auto_160395 ) ) ( not ( = ?auto_160393 ?auto_160396 ) ) ( not ( = ?auto_160393 ?auto_160397 ) ) ( not ( = ?auto_160393 ?auto_160398 ) ) ( not ( = ?auto_160393 ?auto_160399 ) ) ( not ( = ?auto_160393 ?auto_160400 ) ) ( not ( = ?auto_160393 ?auto_160401 ) ) ( not ( = ?auto_160394 ?auto_160395 ) ) ( not ( = ?auto_160394 ?auto_160396 ) ) ( not ( = ?auto_160394 ?auto_160397 ) ) ( not ( = ?auto_160394 ?auto_160398 ) ) ( not ( = ?auto_160394 ?auto_160399 ) ) ( not ( = ?auto_160394 ?auto_160400 ) ) ( not ( = ?auto_160394 ?auto_160401 ) ) ( not ( = ?auto_160395 ?auto_160396 ) ) ( not ( = ?auto_160395 ?auto_160397 ) ) ( not ( = ?auto_160395 ?auto_160398 ) ) ( not ( = ?auto_160395 ?auto_160399 ) ) ( not ( = ?auto_160395 ?auto_160400 ) ) ( not ( = ?auto_160395 ?auto_160401 ) ) ( not ( = ?auto_160396 ?auto_160397 ) ) ( not ( = ?auto_160396 ?auto_160398 ) ) ( not ( = ?auto_160396 ?auto_160399 ) ) ( not ( = ?auto_160396 ?auto_160400 ) ) ( not ( = ?auto_160396 ?auto_160401 ) ) ( not ( = ?auto_160397 ?auto_160398 ) ) ( not ( = ?auto_160397 ?auto_160399 ) ) ( not ( = ?auto_160397 ?auto_160400 ) ) ( not ( = ?auto_160397 ?auto_160401 ) ) ( not ( = ?auto_160398 ?auto_160399 ) ) ( not ( = ?auto_160398 ?auto_160400 ) ) ( not ( = ?auto_160398 ?auto_160401 ) ) ( not ( = ?auto_160399 ?auto_160400 ) ) ( not ( = ?auto_160399 ?auto_160401 ) ) ( not ( = ?auto_160400 ?auto_160401 ) ) ( ON ?auto_160399 ?auto_160400 ) ( ON ?auto_160398 ?auto_160399 ) ( ON ?auto_160397 ?auto_160398 ) ( ON ?auto_160396 ?auto_160397 ) ( ON ?auto_160395 ?auto_160396 ) ( ON ?auto_160394 ?auto_160395 ) ( CLEAR ?auto_160392 ) ( ON ?auto_160393 ?auto_160394 ) ( CLEAR ?auto_160393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160390 ?auto_160391 ?auto_160392 ?auto_160393 )
      ( MAKE-11PILE ?auto_160390 ?auto_160391 ?auto_160392 ?auto_160393 ?auto_160394 ?auto_160395 ?auto_160396 ?auto_160397 ?auto_160398 ?auto_160399 ?auto_160400 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_160436 - BLOCK
      ?auto_160437 - BLOCK
      ?auto_160438 - BLOCK
      ?auto_160439 - BLOCK
      ?auto_160440 - BLOCK
      ?auto_160441 - BLOCK
      ?auto_160442 - BLOCK
      ?auto_160443 - BLOCK
      ?auto_160444 - BLOCK
      ?auto_160445 - BLOCK
      ?auto_160446 - BLOCK
    )
    :vars
    (
      ?auto_160447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160446 ?auto_160447 ) ( ON-TABLE ?auto_160436 ) ( ON ?auto_160437 ?auto_160436 ) ( not ( = ?auto_160436 ?auto_160437 ) ) ( not ( = ?auto_160436 ?auto_160438 ) ) ( not ( = ?auto_160436 ?auto_160439 ) ) ( not ( = ?auto_160436 ?auto_160440 ) ) ( not ( = ?auto_160436 ?auto_160441 ) ) ( not ( = ?auto_160436 ?auto_160442 ) ) ( not ( = ?auto_160436 ?auto_160443 ) ) ( not ( = ?auto_160436 ?auto_160444 ) ) ( not ( = ?auto_160436 ?auto_160445 ) ) ( not ( = ?auto_160436 ?auto_160446 ) ) ( not ( = ?auto_160436 ?auto_160447 ) ) ( not ( = ?auto_160437 ?auto_160438 ) ) ( not ( = ?auto_160437 ?auto_160439 ) ) ( not ( = ?auto_160437 ?auto_160440 ) ) ( not ( = ?auto_160437 ?auto_160441 ) ) ( not ( = ?auto_160437 ?auto_160442 ) ) ( not ( = ?auto_160437 ?auto_160443 ) ) ( not ( = ?auto_160437 ?auto_160444 ) ) ( not ( = ?auto_160437 ?auto_160445 ) ) ( not ( = ?auto_160437 ?auto_160446 ) ) ( not ( = ?auto_160437 ?auto_160447 ) ) ( not ( = ?auto_160438 ?auto_160439 ) ) ( not ( = ?auto_160438 ?auto_160440 ) ) ( not ( = ?auto_160438 ?auto_160441 ) ) ( not ( = ?auto_160438 ?auto_160442 ) ) ( not ( = ?auto_160438 ?auto_160443 ) ) ( not ( = ?auto_160438 ?auto_160444 ) ) ( not ( = ?auto_160438 ?auto_160445 ) ) ( not ( = ?auto_160438 ?auto_160446 ) ) ( not ( = ?auto_160438 ?auto_160447 ) ) ( not ( = ?auto_160439 ?auto_160440 ) ) ( not ( = ?auto_160439 ?auto_160441 ) ) ( not ( = ?auto_160439 ?auto_160442 ) ) ( not ( = ?auto_160439 ?auto_160443 ) ) ( not ( = ?auto_160439 ?auto_160444 ) ) ( not ( = ?auto_160439 ?auto_160445 ) ) ( not ( = ?auto_160439 ?auto_160446 ) ) ( not ( = ?auto_160439 ?auto_160447 ) ) ( not ( = ?auto_160440 ?auto_160441 ) ) ( not ( = ?auto_160440 ?auto_160442 ) ) ( not ( = ?auto_160440 ?auto_160443 ) ) ( not ( = ?auto_160440 ?auto_160444 ) ) ( not ( = ?auto_160440 ?auto_160445 ) ) ( not ( = ?auto_160440 ?auto_160446 ) ) ( not ( = ?auto_160440 ?auto_160447 ) ) ( not ( = ?auto_160441 ?auto_160442 ) ) ( not ( = ?auto_160441 ?auto_160443 ) ) ( not ( = ?auto_160441 ?auto_160444 ) ) ( not ( = ?auto_160441 ?auto_160445 ) ) ( not ( = ?auto_160441 ?auto_160446 ) ) ( not ( = ?auto_160441 ?auto_160447 ) ) ( not ( = ?auto_160442 ?auto_160443 ) ) ( not ( = ?auto_160442 ?auto_160444 ) ) ( not ( = ?auto_160442 ?auto_160445 ) ) ( not ( = ?auto_160442 ?auto_160446 ) ) ( not ( = ?auto_160442 ?auto_160447 ) ) ( not ( = ?auto_160443 ?auto_160444 ) ) ( not ( = ?auto_160443 ?auto_160445 ) ) ( not ( = ?auto_160443 ?auto_160446 ) ) ( not ( = ?auto_160443 ?auto_160447 ) ) ( not ( = ?auto_160444 ?auto_160445 ) ) ( not ( = ?auto_160444 ?auto_160446 ) ) ( not ( = ?auto_160444 ?auto_160447 ) ) ( not ( = ?auto_160445 ?auto_160446 ) ) ( not ( = ?auto_160445 ?auto_160447 ) ) ( not ( = ?auto_160446 ?auto_160447 ) ) ( ON ?auto_160445 ?auto_160446 ) ( ON ?auto_160444 ?auto_160445 ) ( ON ?auto_160443 ?auto_160444 ) ( ON ?auto_160442 ?auto_160443 ) ( ON ?auto_160441 ?auto_160442 ) ( ON ?auto_160440 ?auto_160441 ) ( ON ?auto_160439 ?auto_160440 ) ( CLEAR ?auto_160437 ) ( ON ?auto_160438 ?auto_160439 ) ( CLEAR ?auto_160438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160436 ?auto_160437 ?auto_160438 )
      ( MAKE-11PILE ?auto_160436 ?auto_160437 ?auto_160438 ?auto_160439 ?auto_160440 ?auto_160441 ?auto_160442 ?auto_160443 ?auto_160444 ?auto_160445 ?auto_160446 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_160482 - BLOCK
      ?auto_160483 - BLOCK
      ?auto_160484 - BLOCK
      ?auto_160485 - BLOCK
      ?auto_160486 - BLOCK
      ?auto_160487 - BLOCK
      ?auto_160488 - BLOCK
      ?auto_160489 - BLOCK
      ?auto_160490 - BLOCK
      ?auto_160491 - BLOCK
      ?auto_160492 - BLOCK
    )
    :vars
    (
      ?auto_160493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160492 ?auto_160493 ) ( ON-TABLE ?auto_160482 ) ( not ( = ?auto_160482 ?auto_160483 ) ) ( not ( = ?auto_160482 ?auto_160484 ) ) ( not ( = ?auto_160482 ?auto_160485 ) ) ( not ( = ?auto_160482 ?auto_160486 ) ) ( not ( = ?auto_160482 ?auto_160487 ) ) ( not ( = ?auto_160482 ?auto_160488 ) ) ( not ( = ?auto_160482 ?auto_160489 ) ) ( not ( = ?auto_160482 ?auto_160490 ) ) ( not ( = ?auto_160482 ?auto_160491 ) ) ( not ( = ?auto_160482 ?auto_160492 ) ) ( not ( = ?auto_160482 ?auto_160493 ) ) ( not ( = ?auto_160483 ?auto_160484 ) ) ( not ( = ?auto_160483 ?auto_160485 ) ) ( not ( = ?auto_160483 ?auto_160486 ) ) ( not ( = ?auto_160483 ?auto_160487 ) ) ( not ( = ?auto_160483 ?auto_160488 ) ) ( not ( = ?auto_160483 ?auto_160489 ) ) ( not ( = ?auto_160483 ?auto_160490 ) ) ( not ( = ?auto_160483 ?auto_160491 ) ) ( not ( = ?auto_160483 ?auto_160492 ) ) ( not ( = ?auto_160483 ?auto_160493 ) ) ( not ( = ?auto_160484 ?auto_160485 ) ) ( not ( = ?auto_160484 ?auto_160486 ) ) ( not ( = ?auto_160484 ?auto_160487 ) ) ( not ( = ?auto_160484 ?auto_160488 ) ) ( not ( = ?auto_160484 ?auto_160489 ) ) ( not ( = ?auto_160484 ?auto_160490 ) ) ( not ( = ?auto_160484 ?auto_160491 ) ) ( not ( = ?auto_160484 ?auto_160492 ) ) ( not ( = ?auto_160484 ?auto_160493 ) ) ( not ( = ?auto_160485 ?auto_160486 ) ) ( not ( = ?auto_160485 ?auto_160487 ) ) ( not ( = ?auto_160485 ?auto_160488 ) ) ( not ( = ?auto_160485 ?auto_160489 ) ) ( not ( = ?auto_160485 ?auto_160490 ) ) ( not ( = ?auto_160485 ?auto_160491 ) ) ( not ( = ?auto_160485 ?auto_160492 ) ) ( not ( = ?auto_160485 ?auto_160493 ) ) ( not ( = ?auto_160486 ?auto_160487 ) ) ( not ( = ?auto_160486 ?auto_160488 ) ) ( not ( = ?auto_160486 ?auto_160489 ) ) ( not ( = ?auto_160486 ?auto_160490 ) ) ( not ( = ?auto_160486 ?auto_160491 ) ) ( not ( = ?auto_160486 ?auto_160492 ) ) ( not ( = ?auto_160486 ?auto_160493 ) ) ( not ( = ?auto_160487 ?auto_160488 ) ) ( not ( = ?auto_160487 ?auto_160489 ) ) ( not ( = ?auto_160487 ?auto_160490 ) ) ( not ( = ?auto_160487 ?auto_160491 ) ) ( not ( = ?auto_160487 ?auto_160492 ) ) ( not ( = ?auto_160487 ?auto_160493 ) ) ( not ( = ?auto_160488 ?auto_160489 ) ) ( not ( = ?auto_160488 ?auto_160490 ) ) ( not ( = ?auto_160488 ?auto_160491 ) ) ( not ( = ?auto_160488 ?auto_160492 ) ) ( not ( = ?auto_160488 ?auto_160493 ) ) ( not ( = ?auto_160489 ?auto_160490 ) ) ( not ( = ?auto_160489 ?auto_160491 ) ) ( not ( = ?auto_160489 ?auto_160492 ) ) ( not ( = ?auto_160489 ?auto_160493 ) ) ( not ( = ?auto_160490 ?auto_160491 ) ) ( not ( = ?auto_160490 ?auto_160492 ) ) ( not ( = ?auto_160490 ?auto_160493 ) ) ( not ( = ?auto_160491 ?auto_160492 ) ) ( not ( = ?auto_160491 ?auto_160493 ) ) ( not ( = ?auto_160492 ?auto_160493 ) ) ( ON ?auto_160491 ?auto_160492 ) ( ON ?auto_160490 ?auto_160491 ) ( ON ?auto_160489 ?auto_160490 ) ( ON ?auto_160488 ?auto_160489 ) ( ON ?auto_160487 ?auto_160488 ) ( ON ?auto_160486 ?auto_160487 ) ( ON ?auto_160485 ?auto_160486 ) ( ON ?auto_160484 ?auto_160485 ) ( CLEAR ?auto_160482 ) ( ON ?auto_160483 ?auto_160484 ) ( CLEAR ?auto_160483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160482 ?auto_160483 )
      ( MAKE-11PILE ?auto_160482 ?auto_160483 ?auto_160484 ?auto_160485 ?auto_160486 ?auto_160487 ?auto_160488 ?auto_160489 ?auto_160490 ?auto_160491 ?auto_160492 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_160528 - BLOCK
      ?auto_160529 - BLOCK
      ?auto_160530 - BLOCK
      ?auto_160531 - BLOCK
      ?auto_160532 - BLOCK
      ?auto_160533 - BLOCK
      ?auto_160534 - BLOCK
      ?auto_160535 - BLOCK
      ?auto_160536 - BLOCK
      ?auto_160537 - BLOCK
      ?auto_160538 - BLOCK
    )
    :vars
    (
      ?auto_160539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160538 ?auto_160539 ) ( not ( = ?auto_160528 ?auto_160529 ) ) ( not ( = ?auto_160528 ?auto_160530 ) ) ( not ( = ?auto_160528 ?auto_160531 ) ) ( not ( = ?auto_160528 ?auto_160532 ) ) ( not ( = ?auto_160528 ?auto_160533 ) ) ( not ( = ?auto_160528 ?auto_160534 ) ) ( not ( = ?auto_160528 ?auto_160535 ) ) ( not ( = ?auto_160528 ?auto_160536 ) ) ( not ( = ?auto_160528 ?auto_160537 ) ) ( not ( = ?auto_160528 ?auto_160538 ) ) ( not ( = ?auto_160528 ?auto_160539 ) ) ( not ( = ?auto_160529 ?auto_160530 ) ) ( not ( = ?auto_160529 ?auto_160531 ) ) ( not ( = ?auto_160529 ?auto_160532 ) ) ( not ( = ?auto_160529 ?auto_160533 ) ) ( not ( = ?auto_160529 ?auto_160534 ) ) ( not ( = ?auto_160529 ?auto_160535 ) ) ( not ( = ?auto_160529 ?auto_160536 ) ) ( not ( = ?auto_160529 ?auto_160537 ) ) ( not ( = ?auto_160529 ?auto_160538 ) ) ( not ( = ?auto_160529 ?auto_160539 ) ) ( not ( = ?auto_160530 ?auto_160531 ) ) ( not ( = ?auto_160530 ?auto_160532 ) ) ( not ( = ?auto_160530 ?auto_160533 ) ) ( not ( = ?auto_160530 ?auto_160534 ) ) ( not ( = ?auto_160530 ?auto_160535 ) ) ( not ( = ?auto_160530 ?auto_160536 ) ) ( not ( = ?auto_160530 ?auto_160537 ) ) ( not ( = ?auto_160530 ?auto_160538 ) ) ( not ( = ?auto_160530 ?auto_160539 ) ) ( not ( = ?auto_160531 ?auto_160532 ) ) ( not ( = ?auto_160531 ?auto_160533 ) ) ( not ( = ?auto_160531 ?auto_160534 ) ) ( not ( = ?auto_160531 ?auto_160535 ) ) ( not ( = ?auto_160531 ?auto_160536 ) ) ( not ( = ?auto_160531 ?auto_160537 ) ) ( not ( = ?auto_160531 ?auto_160538 ) ) ( not ( = ?auto_160531 ?auto_160539 ) ) ( not ( = ?auto_160532 ?auto_160533 ) ) ( not ( = ?auto_160532 ?auto_160534 ) ) ( not ( = ?auto_160532 ?auto_160535 ) ) ( not ( = ?auto_160532 ?auto_160536 ) ) ( not ( = ?auto_160532 ?auto_160537 ) ) ( not ( = ?auto_160532 ?auto_160538 ) ) ( not ( = ?auto_160532 ?auto_160539 ) ) ( not ( = ?auto_160533 ?auto_160534 ) ) ( not ( = ?auto_160533 ?auto_160535 ) ) ( not ( = ?auto_160533 ?auto_160536 ) ) ( not ( = ?auto_160533 ?auto_160537 ) ) ( not ( = ?auto_160533 ?auto_160538 ) ) ( not ( = ?auto_160533 ?auto_160539 ) ) ( not ( = ?auto_160534 ?auto_160535 ) ) ( not ( = ?auto_160534 ?auto_160536 ) ) ( not ( = ?auto_160534 ?auto_160537 ) ) ( not ( = ?auto_160534 ?auto_160538 ) ) ( not ( = ?auto_160534 ?auto_160539 ) ) ( not ( = ?auto_160535 ?auto_160536 ) ) ( not ( = ?auto_160535 ?auto_160537 ) ) ( not ( = ?auto_160535 ?auto_160538 ) ) ( not ( = ?auto_160535 ?auto_160539 ) ) ( not ( = ?auto_160536 ?auto_160537 ) ) ( not ( = ?auto_160536 ?auto_160538 ) ) ( not ( = ?auto_160536 ?auto_160539 ) ) ( not ( = ?auto_160537 ?auto_160538 ) ) ( not ( = ?auto_160537 ?auto_160539 ) ) ( not ( = ?auto_160538 ?auto_160539 ) ) ( ON ?auto_160537 ?auto_160538 ) ( ON ?auto_160536 ?auto_160537 ) ( ON ?auto_160535 ?auto_160536 ) ( ON ?auto_160534 ?auto_160535 ) ( ON ?auto_160533 ?auto_160534 ) ( ON ?auto_160532 ?auto_160533 ) ( ON ?auto_160531 ?auto_160532 ) ( ON ?auto_160530 ?auto_160531 ) ( ON ?auto_160529 ?auto_160530 ) ( ON ?auto_160528 ?auto_160529 ) ( CLEAR ?auto_160528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160528 )
      ( MAKE-11PILE ?auto_160528 ?auto_160529 ?auto_160530 ?auto_160531 ?auto_160532 ?auto_160533 ?auto_160534 ?auto_160535 ?auto_160536 ?auto_160537 ?auto_160538 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160575 - BLOCK
      ?auto_160576 - BLOCK
      ?auto_160577 - BLOCK
      ?auto_160578 - BLOCK
      ?auto_160579 - BLOCK
      ?auto_160580 - BLOCK
      ?auto_160581 - BLOCK
      ?auto_160582 - BLOCK
      ?auto_160583 - BLOCK
      ?auto_160584 - BLOCK
      ?auto_160585 - BLOCK
      ?auto_160586 - BLOCK
    )
    :vars
    (
      ?auto_160587 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_160585 ) ( ON ?auto_160586 ?auto_160587 ) ( CLEAR ?auto_160586 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160575 ) ( ON ?auto_160576 ?auto_160575 ) ( ON ?auto_160577 ?auto_160576 ) ( ON ?auto_160578 ?auto_160577 ) ( ON ?auto_160579 ?auto_160578 ) ( ON ?auto_160580 ?auto_160579 ) ( ON ?auto_160581 ?auto_160580 ) ( ON ?auto_160582 ?auto_160581 ) ( ON ?auto_160583 ?auto_160582 ) ( ON ?auto_160584 ?auto_160583 ) ( ON ?auto_160585 ?auto_160584 ) ( not ( = ?auto_160575 ?auto_160576 ) ) ( not ( = ?auto_160575 ?auto_160577 ) ) ( not ( = ?auto_160575 ?auto_160578 ) ) ( not ( = ?auto_160575 ?auto_160579 ) ) ( not ( = ?auto_160575 ?auto_160580 ) ) ( not ( = ?auto_160575 ?auto_160581 ) ) ( not ( = ?auto_160575 ?auto_160582 ) ) ( not ( = ?auto_160575 ?auto_160583 ) ) ( not ( = ?auto_160575 ?auto_160584 ) ) ( not ( = ?auto_160575 ?auto_160585 ) ) ( not ( = ?auto_160575 ?auto_160586 ) ) ( not ( = ?auto_160575 ?auto_160587 ) ) ( not ( = ?auto_160576 ?auto_160577 ) ) ( not ( = ?auto_160576 ?auto_160578 ) ) ( not ( = ?auto_160576 ?auto_160579 ) ) ( not ( = ?auto_160576 ?auto_160580 ) ) ( not ( = ?auto_160576 ?auto_160581 ) ) ( not ( = ?auto_160576 ?auto_160582 ) ) ( not ( = ?auto_160576 ?auto_160583 ) ) ( not ( = ?auto_160576 ?auto_160584 ) ) ( not ( = ?auto_160576 ?auto_160585 ) ) ( not ( = ?auto_160576 ?auto_160586 ) ) ( not ( = ?auto_160576 ?auto_160587 ) ) ( not ( = ?auto_160577 ?auto_160578 ) ) ( not ( = ?auto_160577 ?auto_160579 ) ) ( not ( = ?auto_160577 ?auto_160580 ) ) ( not ( = ?auto_160577 ?auto_160581 ) ) ( not ( = ?auto_160577 ?auto_160582 ) ) ( not ( = ?auto_160577 ?auto_160583 ) ) ( not ( = ?auto_160577 ?auto_160584 ) ) ( not ( = ?auto_160577 ?auto_160585 ) ) ( not ( = ?auto_160577 ?auto_160586 ) ) ( not ( = ?auto_160577 ?auto_160587 ) ) ( not ( = ?auto_160578 ?auto_160579 ) ) ( not ( = ?auto_160578 ?auto_160580 ) ) ( not ( = ?auto_160578 ?auto_160581 ) ) ( not ( = ?auto_160578 ?auto_160582 ) ) ( not ( = ?auto_160578 ?auto_160583 ) ) ( not ( = ?auto_160578 ?auto_160584 ) ) ( not ( = ?auto_160578 ?auto_160585 ) ) ( not ( = ?auto_160578 ?auto_160586 ) ) ( not ( = ?auto_160578 ?auto_160587 ) ) ( not ( = ?auto_160579 ?auto_160580 ) ) ( not ( = ?auto_160579 ?auto_160581 ) ) ( not ( = ?auto_160579 ?auto_160582 ) ) ( not ( = ?auto_160579 ?auto_160583 ) ) ( not ( = ?auto_160579 ?auto_160584 ) ) ( not ( = ?auto_160579 ?auto_160585 ) ) ( not ( = ?auto_160579 ?auto_160586 ) ) ( not ( = ?auto_160579 ?auto_160587 ) ) ( not ( = ?auto_160580 ?auto_160581 ) ) ( not ( = ?auto_160580 ?auto_160582 ) ) ( not ( = ?auto_160580 ?auto_160583 ) ) ( not ( = ?auto_160580 ?auto_160584 ) ) ( not ( = ?auto_160580 ?auto_160585 ) ) ( not ( = ?auto_160580 ?auto_160586 ) ) ( not ( = ?auto_160580 ?auto_160587 ) ) ( not ( = ?auto_160581 ?auto_160582 ) ) ( not ( = ?auto_160581 ?auto_160583 ) ) ( not ( = ?auto_160581 ?auto_160584 ) ) ( not ( = ?auto_160581 ?auto_160585 ) ) ( not ( = ?auto_160581 ?auto_160586 ) ) ( not ( = ?auto_160581 ?auto_160587 ) ) ( not ( = ?auto_160582 ?auto_160583 ) ) ( not ( = ?auto_160582 ?auto_160584 ) ) ( not ( = ?auto_160582 ?auto_160585 ) ) ( not ( = ?auto_160582 ?auto_160586 ) ) ( not ( = ?auto_160582 ?auto_160587 ) ) ( not ( = ?auto_160583 ?auto_160584 ) ) ( not ( = ?auto_160583 ?auto_160585 ) ) ( not ( = ?auto_160583 ?auto_160586 ) ) ( not ( = ?auto_160583 ?auto_160587 ) ) ( not ( = ?auto_160584 ?auto_160585 ) ) ( not ( = ?auto_160584 ?auto_160586 ) ) ( not ( = ?auto_160584 ?auto_160587 ) ) ( not ( = ?auto_160585 ?auto_160586 ) ) ( not ( = ?auto_160585 ?auto_160587 ) ) ( not ( = ?auto_160586 ?auto_160587 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160586 ?auto_160587 )
      ( !STACK ?auto_160586 ?auto_160585 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160600 - BLOCK
      ?auto_160601 - BLOCK
      ?auto_160602 - BLOCK
      ?auto_160603 - BLOCK
      ?auto_160604 - BLOCK
      ?auto_160605 - BLOCK
      ?auto_160606 - BLOCK
      ?auto_160607 - BLOCK
      ?auto_160608 - BLOCK
      ?auto_160609 - BLOCK
      ?auto_160610 - BLOCK
      ?auto_160611 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_160610 ) ( ON-TABLE ?auto_160611 ) ( CLEAR ?auto_160611 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160600 ) ( ON ?auto_160601 ?auto_160600 ) ( ON ?auto_160602 ?auto_160601 ) ( ON ?auto_160603 ?auto_160602 ) ( ON ?auto_160604 ?auto_160603 ) ( ON ?auto_160605 ?auto_160604 ) ( ON ?auto_160606 ?auto_160605 ) ( ON ?auto_160607 ?auto_160606 ) ( ON ?auto_160608 ?auto_160607 ) ( ON ?auto_160609 ?auto_160608 ) ( ON ?auto_160610 ?auto_160609 ) ( not ( = ?auto_160600 ?auto_160601 ) ) ( not ( = ?auto_160600 ?auto_160602 ) ) ( not ( = ?auto_160600 ?auto_160603 ) ) ( not ( = ?auto_160600 ?auto_160604 ) ) ( not ( = ?auto_160600 ?auto_160605 ) ) ( not ( = ?auto_160600 ?auto_160606 ) ) ( not ( = ?auto_160600 ?auto_160607 ) ) ( not ( = ?auto_160600 ?auto_160608 ) ) ( not ( = ?auto_160600 ?auto_160609 ) ) ( not ( = ?auto_160600 ?auto_160610 ) ) ( not ( = ?auto_160600 ?auto_160611 ) ) ( not ( = ?auto_160601 ?auto_160602 ) ) ( not ( = ?auto_160601 ?auto_160603 ) ) ( not ( = ?auto_160601 ?auto_160604 ) ) ( not ( = ?auto_160601 ?auto_160605 ) ) ( not ( = ?auto_160601 ?auto_160606 ) ) ( not ( = ?auto_160601 ?auto_160607 ) ) ( not ( = ?auto_160601 ?auto_160608 ) ) ( not ( = ?auto_160601 ?auto_160609 ) ) ( not ( = ?auto_160601 ?auto_160610 ) ) ( not ( = ?auto_160601 ?auto_160611 ) ) ( not ( = ?auto_160602 ?auto_160603 ) ) ( not ( = ?auto_160602 ?auto_160604 ) ) ( not ( = ?auto_160602 ?auto_160605 ) ) ( not ( = ?auto_160602 ?auto_160606 ) ) ( not ( = ?auto_160602 ?auto_160607 ) ) ( not ( = ?auto_160602 ?auto_160608 ) ) ( not ( = ?auto_160602 ?auto_160609 ) ) ( not ( = ?auto_160602 ?auto_160610 ) ) ( not ( = ?auto_160602 ?auto_160611 ) ) ( not ( = ?auto_160603 ?auto_160604 ) ) ( not ( = ?auto_160603 ?auto_160605 ) ) ( not ( = ?auto_160603 ?auto_160606 ) ) ( not ( = ?auto_160603 ?auto_160607 ) ) ( not ( = ?auto_160603 ?auto_160608 ) ) ( not ( = ?auto_160603 ?auto_160609 ) ) ( not ( = ?auto_160603 ?auto_160610 ) ) ( not ( = ?auto_160603 ?auto_160611 ) ) ( not ( = ?auto_160604 ?auto_160605 ) ) ( not ( = ?auto_160604 ?auto_160606 ) ) ( not ( = ?auto_160604 ?auto_160607 ) ) ( not ( = ?auto_160604 ?auto_160608 ) ) ( not ( = ?auto_160604 ?auto_160609 ) ) ( not ( = ?auto_160604 ?auto_160610 ) ) ( not ( = ?auto_160604 ?auto_160611 ) ) ( not ( = ?auto_160605 ?auto_160606 ) ) ( not ( = ?auto_160605 ?auto_160607 ) ) ( not ( = ?auto_160605 ?auto_160608 ) ) ( not ( = ?auto_160605 ?auto_160609 ) ) ( not ( = ?auto_160605 ?auto_160610 ) ) ( not ( = ?auto_160605 ?auto_160611 ) ) ( not ( = ?auto_160606 ?auto_160607 ) ) ( not ( = ?auto_160606 ?auto_160608 ) ) ( not ( = ?auto_160606 ?auto_160609 ) ) ( not ( = ?auto_160606 ?auto_160610 ) ) ( not ( = ?auto_160606 ?auto_160611 ) ) ( not ( = ?auto_160607 ?auto_160608 ) ) ( not ( = ?auto_160607 ?auto_160609 ) ) ( not ( = ?auto_160607 ?auto_160610 ) ) ( not ( = ?auto_160607 ?auto_160611 ) ) ( not ( = ?auto_160608 ?auto_160609 ) ) ( not ( = ?auto_160608 ?auto_160610 ) ) ( not ( = ?auto_160608 ?auto_160611 ) ) ( not ( = ?auto_160609 ?auto_160610 ) ) ( not ( = ?auto_160609 ?auto_160611 ) ) ( not ( = ?auto_160610 ?auto_160611 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_160611 )
      ( !STACK ?auto_160611 ?auto_160610 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160624 - BLOCK
      ?auto_160625 - BLOCK
      ?auto_160626 - BLOCK
      ?auto_160627 - BLOCK
      ?auto_160628 - BLOCK
      ?auto_160629 - BLOCK
      ?auto_160630 - BLOCK
      ?auto_160631 - BLOCK
      ?auto_160632 - BLOCK
      ?auto_160633 - BLOCK
      ?auto_160634 - BLOCK
      ?auto_160635 - BLOCK
    )
    :vars
    (
      ?auto_160636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160635 ?auto_160636 ) ( ON-TABLE ?auto_160624 ) ( ON ?auto_160625 ?auto_160624 ) ( ON ?auto_160626 ?auto_160625 ) ( ON ?auto_160627 ?auto_160626 ) ( ON ?auto_160628 ?auto_160627 ) ( ON ?auto_160629 ?auto_160628 ) ( ON ?auto_160630 ?auto_160629 ) ( ON ?auto_160631 ?auto_160630 ) ( ON ?auto_160632 ?auto_160631 ) ( ON ?auto_160633 ?auto_160632 ) ( not ( = ?auto_160624 ?auto_160625 ) ) ( not ( = ?auto_160624 ?auto_160626 ) ) ( not ( = ?auto_160624 ?auto_160627 ) ) ( not ( = ?auto_160624 ?auto_160628 ) ) ( not ( = ?auto_160624 ?auto_160629 ) ) ( not ( = ?auto_160624 ?auto_160630 ) ) ( not ( = ?auto_160624 ?auto_160631 ) ) ( not ( = ?auto_160624 ?auto_160632 ) ) ( not ( = ?auto_160624 ?auto_160633 ) ) ( not ( = ?auto_160624 ?auto_160634 ) ) ( not ( = ?auto_160624 ?auto_160635 ) ) ( not ( = ?auto_160624 ?auto_160636 ) ) ( not ( = ?auto_160625 ?auto_160626 ) ) ( not ( = ?auto_160625 ?auto_160627 ) ) ( not ( = ?auto_160625 ?auto_160628 ) ) ( not ( = ?auto_160625 ?auto_160629 ) ) ( not ( = ?auto_160625 ?auto_160630 ) ) ( not ( = ?auto_160625 ?auto_160631 ) ) ( not ( = ?auto_160625 ?auto_160632 ) ) ( not ( = ?auto_160625 ?auto_160633 ) ) ( not ( = ?auto_160625 ?auto_160634 ) ) ( not ( = ?auto_160625 ?auto_160635 ) ) ( not ( = ?auto_160625 ?auto_160636 ) ) ( not ( = ?auto_160626 ?auto_160627 ) ) ( not ( = ?auto_160626 ?auto_160628 ) ) ( not ( = ?auto_160626 ?auto_160629 ) ) ( not ( = ?auto_160626 ?auto_160630 ) ) ( not ( = ?auto_160626 ?auto_160631 ) ) ( not ( = ?auto_160626 ?auto_160632 ) ) ( not ( = ?auto_160626 ?auto_160633 ) ) ( not ( = ?auto_160626 ?auto_160634 ) ) ( not ( = ?auto_160626 ?auto_160635 ) ) ( not ( = ?auto_160626 ?auto_160636 ) ) ( not ( = ?auto_160627 ?auto_160628 ) ) ( not ( = ?auto_160627 ?auto_160629 ) ) ( not ( = ?auto_160627 ?auto_160630 ) ) ( not ( = ?auto_160627 ?auto_160631 ) ) ( not ( = ?auto_160627 ?auto_160632 ) ) ( not ( = ?auto_160627 ?auto_160633 ) ) ( not ( = ?auto_160627 ?auto_160634 ) ) ( not ( = ?auto_160627 ?auto_160635 ) ) ( not ( = ?auto_160627 ?auto_160636 ) ) ( not ( = ?auto_160628 ?auto_160629 ) ) ( not ( = ?auto_160628 ?auto_160630 ) ) ( not ( = ?auto_160628 ?auto_160631 ) ) ( not ( = ?auto_160628 ?auto_160632 ) ) ( not ( = ?auto_160628 ?auto_160633 ) ) ( not ( = ?auto_160628 ?auto_160634 ) ) ( not ( = ?auto_160628 ?auto_160635 ) ) ( not ( = ?auto_160628 ?auto_160636 ) ) ( not ( = ?auto_160629 ?auto_160630 ) ) ( not ( = ?auto_160629 ?auto_160631 ) ) ( not ( = ?auto_160629 ?auto_160632 ) ) ( not ( = ?auto_160629 ?auto_160633 ) ) ( not ( = ?auto_160629 ?auto_160634 ) ) ( not ( = ?auto_160629 ?auto_160635 ) ) ( not ( = ?auto_160629 ?auto_160636 ) ) ( not ( = ?auto_160630 ?auto_160631 ) ) ( not ( = ?auto_160630 ?auto_160632 ) ) ( not ( = ?auto_160630 ?auto_160633 ) ) ( not ( = ?auto_160630 ?auto_160634 ) ) ( not ( = ?auto_160630 ?auto_160635 ) ) ( not ( = ?auto_160630 ?auto_160636 ) ) ( not ( = ?auto_160631 ?auto_160632 ) ) ( not ( = ?auto_160631 ?auto_160633 ) ) ( not ( = ?auto_160631 ?auto_160634 ) ) ( not ( = ?auto_160631 ?auto_160635 ) ) ( not ( = ?auto_160631 ?auto_160636 ) ) ( not ( = ?auto_160632 ?auto_160633 ) ) ( not ( = ?auto_160632 ?auto_160634 ) ) ( not ( = ?auto_160632 ?auto_160635 ) ) ( not ( = ?auto_160632 ?auto_160636 ) ) ( not ( = ?auto_160633 ?auto_160634 ) ) ( not ( = ?auto_160633 ?auto_160635 ) ) ( not ( = ?auto_160633 ?auto_160636 ) ) ( not ( = ?auto_160634 ?auto_160635 ) ) ( not ( = ?auto_160634 ?auto_160636 ) ) ( not ( = ?auto_160635 ?auto_160636 ) ) ( CLEAR ?auto_160633 ) ( ON ?auto_160634 ?auto_160635 ) ( CLEAR ?auto_160634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_160624 ?auto_160625 ?auto_160626 ?auto_160627 ?auto_160628 ?auto_160629 ?auto_160630 ?auto_160631 ?auto_160632 ?auto_160633 ?auto_160634 )
      ( MAKE-12PILE ?auto_160624 ?auto_160625 ?auto_160626 ?auto_160627 ?auto_160628 ?auto_160629 ?auto_160630 ?auto_160631 ?auto_160632 ?auto_160633 ?auto_160634 ?auto_160635 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160649 - BLOCK
      ?auto_160650 - BLOCK
      ?auto_160651 - BLOCK
      ?auto_160652 - BLOCK
      ?auto_160653 - BLOCK
      ?auto_160654 - BLOCK
      ?auto_160655 - BLOCK
      ?auto_160656 - BLOCK
      ?auto_160657 - BLOCK
      ?auto_160658 - BLOCK
      ?auto_160659 - BLOCK
      ?auto_160660 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160660 ) ( ON-TABLE ?auto_160649 ) ( ON ?auto_160650 ?auto_160649 ) ( ON ?auto_160651 ?auto_160650 ) ( ON ?auto_160652 ?auto_160651 ) ( ON ?auto_160653 ?auto_160652 ) ( ON ?auto_160654 ?auto_160653 ) ( ON ?auto_160655 ?auto_160654 ) ( ON ?auto_160656 ?auto_160655 ) ( ON ?auto_160657 ?auto_160656 ) ( ON ?auto_160658 ?auto_160657 ) ( not ( = ?auto_160649 ?auto_160650 ) ) ( not ( = ?auto_160649 ?auto_160651 ) ) ( not ( = ?auto_160649 ?auto_160652 ) ) ( not ( = ?auto_160649 ?auto_160653 ) ) ( not ( = ?auto_160649 ?auto_160654 ) ) ( not ( = ?auto_160649 ?auto_160655 ) ) ( not ( = ?auto_160649 ?auto_160656 ) ) ( not ( = ?auto_160649 ?auto_160657 ) ) ( not ( = ?auto_160649 ?auto_160658 ) ) ( not ( = ?auto_160649 ?auto_160659 ) ) ( not ( = ?auto_160649 ?auto_160660 ) ) ( not ( = ?auto_160650 ?auto_160651 ) ) ( not ( = ?auto_160650 ?auto_160652 ) ) ( not ( = ?auto_160650 ?auto_160653 ) ) ( not ( = ?auto_160650 ?auto_160654 ) ) ( not ( = ?auto_160650 ?auto_160655 ) ) ( not ( = ?auto_160650 ?auto_160656 ) ) ( not ( = ?auto_160650 ?auto_160657 ) ) ( not ( = ?auto_160650 ?auto_160658 ) ) ( not ( = ?auto_160650 ?auto_160659 ) ) ( not ( = ?auto_160650 ?auto_160660 ) ) ( not ( = ?auto_160651 ?auto_160652 ) ) ( not ( = ?auto_160651 ?auto_160653 ) ) ( not ( = ?auto_160651 ?auto_160654 ) ) ( not ( = ?auto_160651 ?auto_160655 ) ) ( not ( = ?auto_160651 ?auto_160656 ) ) ( not ( = ?auto_160651 ?auto_160657 ) ) ( not ( = ?auto_160651 ?auto_160658 ) ) ( not ( = ?auto_160651 ?auto_160659 ) ) ( not ( = ?auto_160651 ?auto_160660 ) ) ( not ( = ?auto_160652 ?auto_160653 ) ) ( not ( = ?auto_160652 ?auto_160654 ) ) ( not ( = ?auto_160652 ?auto_160655 ) ) ( not ( = ?auto_160652 ?auto_160656 ) ) ( not ( = ?auto_160652 ?auto_160657 ) ) ( not ( = ?auto_160652 ?auto_160658 ) ) ( not ( = ?auto_160652 ?auto_160659 ) ) ( not ( = ?auto_160652 ?auto_160660 ) ) ( not ( = ?auto_160653 ?auto_160654 ) ) ( not ( = ?auto_160653 ?auto_160655 ) ) ( not ( = ?auto_160653 ?auto_160656 ) ) ( not ( = ?auto_160653 ?auto_160657 ) ) ( not ( = ?auto_160653 ?auto_160658 ) ) ( not ( = ?auto_160653 ?auto_160659 ) ) ( not ( = ?auto_160653 ?auto_160660 ) ) ( not ( = ?auto_160654 ?auto_160655 ) ) ( not ( = ?auto_160654 ?auto_160656 ) ) ( not ( = ?auto_160654 ?auto_160657 ) ) ( not ( = ?auto_160654 ?auto_160658 ) ) ( not ( = ?auto_160654 ?auto_160659 ) ) ( not ( = ?auto_160654 ?auto_160660 ) ) ( not ( = ?auto_160655 ?auto_160656 ) ) ( not ( = ?auto_160655 ?auto_160657 ) ) ( not ( = ?auto_160655 ?auto_160658 ) ) ( not ( = ?auto_160655 ?auto_160659 ) ) ( not ( = ?auto_160655 ?auto_160660 ) ) ( not ( = ?auto_160656 ?auto_160657 ) ) ( not ( = ?auto_160656 ?auto_160658 ) ) ( not ( = ?auto_160656 ?auto_160659 ) ) ( not ( = ?auto_160656 ?auto_160660 ) ) ( not ( = ?auto_160657 ?auto_160658 ) ) ( not ( = ?auto_160657 ?auto_160659 ) ) ( not ( = ?auto_160657 ?auto_160660 ) ) ( not ( = ?auto_160658 ?auto_160659 ) ) ( not ( = ?auto_160658 ?auto_160660 ) ) ( not ( = ?auto_160659 ?auto_160660 ) ) ( CLEAR ?auto_160658 ) ( ON ?auto_160659 ?auto_160660 ) ( CLEAR ?auto_160659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_160649 ?auto_160650 ?auto_160651 ?auto_160652 ?auto_160653 ?auto_160654 ?auto_160655 ?auto_160656 ?auto_160657 ?auto_160658 ?auto_160659 )
      ( MAKE-12PILE ?auto_160649 ?auto_160650 ?auto_160651 ?auto_160652 ?auto_160653 ?auto_160654 ?auto_160655 ?auto_160656 ?auto_160657 ?auto_160658 ?auto_160659 ?auto_160660 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160673 - BLOCK
      ?auto_160674 - BLOCK
      ?auto_160675 - BLOCK
      ?auto_160676 - BLOCK
      ?auto_160677 - BLOCK
      ?auto_160678 - BLOCK
      ?auto_160679 - BLOCK
      ?auto_160680 - BLOCK
      ?auto_160681 - BLOCK
      ?auto_160682 - BLOCK
      ?auto_160683 - BLOCK
      ?auto_160684 - BLOCK
    )
    :vars
    (
      ?auto_160685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160684 ?auto_160685 ) ( ON-TABLE ?auto_160673 ) ( ON ?auto_160674 ?auto_160673 ) ( ON ?auto_160675 ?auto_160674 ) ( ON ?auto_160676 ?auto_160675 ) ( ON ?auto_160677 ?auto_160676 ) ( ON ?auto_160678 ?auto_160677 ) ( ON ?auto_160679 ?auto_160678 ) ( ON ?auto_160680 ?auto_160679 ) ( ON ?auto_160681 ?auto_160680 ) ( not ( = ?auto_160673 ?auto_160674 ) ) ( not ( = ?auto_160673 ?auto_160675 ) ) ( not ( = ?auto_160673 ?auto_160676 ) ) ( not ( = ?auto_160673 ?auto_160677 ) ) ( not ( = ?auto_160673 ?auto_160678 ) ) ( not ( = ?auto_160673 ?auto_160679 ) ) ( not ( = ?auto_160673 ?auto_160680 ) ) ( not ( = ?auto_160673 ?auto_160681 ) ) ( not ( = ?auto_160673 ?auto_160682 ) ) ( not ( = ?auto_160673 ?auto_160683 ) ) ( not ( = ?auto_160673 ?auto_160684 ) ) ( not ( = ?auto_160673 ?auto_160685 ) ) ( not ( = ?auto_160674 ?auto_160675 ) ) ( not ( = ?auto_160674 ?auto_160676 ) ) ( not ( = ?auto_160674 ?auto_160677 ) ) ( not ( = ?auto_160674 ?auto_160678 ) ) ( not ( = ?auto_160674 ?auto_160679 ) ) ( not ( = ?auto_160674 ?auto_160680 ) ) ( not ( = ?auto_160674 ?auto_160681 ) ) ( not ( = ?auto_160674 ?auto_160682 ) ) ( not ( = ?auto_160674 ?auto_160683 ) ) ( not ( = ?auto_160674 ?auto_160684 ) ) ( not ( = ?auto_160674 ?auto_160685 ) ) ( not ( = ?auto_160675 ?auto_160676 ) ) ( not ( = ?auto_160675 ?auto_160677 ) ) ( not ( = ?auto_160675 ?auto_160678 ) ) ( not ( = ?auto_160675 ?auto_160679 ) ) ( not ( = ?auto_160675 ?auto_160680 ) ) ( not ( = ?auto_160675 ?auto_160681 ) ) ( not ( = ?auto_160675 ?auto_160682 ) ) ( not ( = ?auto_160675 ?auto_160683 ) ) ( not ( = ?auto_160675 ?auto_160684 ) ) ( not ( = ?auto_160675 ?auto_160685 ) ) ( not ( = ?auto_160676 ?auto_160677 ) ) ( not ( = ?auto_160676 ?auto_160678 ) ) ( not ( = ?auto_160676 ?auto_160679 ) ) ( not ( = ?auto_160676 ?auto_160680 ) ) ( not ( = ?auto_160676 ?auto_160681 ) ) ( not ( = ?auto_160676 ?auto_160682 ) ) ( not ( = ?auto_160676 ?auto_160683 ) ) ( not ( = ?auto_160676 ?auto_160684 ) ) ( not ( = ?auto_160676 ?auto_160685 ) ) ( not ( = ?auto_160677 ?auto_160678 ) ) ( not ( = ?auto_160677 ?auto_160679 ) ) ( not ( = ?auto_160677 ?auto_160680 ) ) ( not ( = ?auto_160677 ?auto_160681 ) ) ( not ( = ?auto_160677 ?auto_160682 ) ) ( not ( = ?auto_160677 ?auto_160683 ) ) ( not ( = ?auto_160677 ?auto_160684 ) ) ( not ( = ?auto_160677 ?auto_160685 ) ) ( not ( = ?auto_160678 ?auto_160679 ) ) ( not ( = ?auto_160678 ?auto_160680 ) ) ( not ( = ?auto_160678 ?auto_160681 ) ) ( not ( = ?auto_160678 ?auto_160682 ) ) ( not ( = ?auto_160678 ?auto_160683 ) ) ( not ( = ?auto_160678 ?auto_160684 ) ) ( not ( = ?auto_160678 ?auto_160685 ) ) ( not ( = ?auto_160679 ?auto_160680 ) ) ( not ( = ?auto_160679 ?auto_160681 ) ) ( not ( = ?auto_160679 ?auto_160682 ) ) ( not ( = ?auto_160679 ?auto_160683 ) ) ( not ( = ?auto_160679 ?auto_160684 ) ) ( not ( = ?auto_160679 ?auto_160685 ) ) ( not ( = ?auto_160680 ?auto_160681 ) ) ( not ( = ?auto_160680 ?auto_160682 ) ) ( not ( = ?auto_160680 ?auto_160683 ) ) ( not ( = ?auto_160680 ?auto_160684 ) ) ( not ( = ?auto_160680 ?auto_160685 ) ) ( not ( = ?auto_160681 ?auto_160682 ) ) ( not ( = ?auto_160681 ?auto_160683 ) ) ( not ( = ?auto_160681 ?auto_160684 ) ) ( not ( = ?auto_160681 ?auto_160685 ) ) ( not ( = ?auto_160682 ?auto_160683 ) ) ( not ( = ?auto_160682 ?auto_160684 ) ) ( not ( = ?auto_160682 ?auto_160685 ) ) ( not ( = ?auto_160683 ?auto_160684 ) ) ( not ( = ?auto_160683 ?auto_160685 ) ) ( not ( = ?auto_160684 ?auto_160685 ) ) ( ON ?auto_160683 ?auto_160684 ) ( CLEAR ?auto_160681 ) ( ON ?auto_160682 ?auto_160683 ) ( CLEAR ?auto_160682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_160673 ?auto_160674 ?auto_160675 ?auto_160676 ?auto_160677 ?auto_160678 ?auto_160679 ?auto_160680 ?auto_160681 ?auto_160682 )
      ( MAKE-12PILE ?auto_160673 ?auto_160674 ?auto_160675 ?auto_160676 ?auto_160677 ?auto_160678 ?auto_160679 ?auto_160680 ?auto_160681 ?auto_160682 ?auto_160683 ?auto_160684 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160698 - BLOCK
      ?auto_160699 - BLOCK
      ?auto_160700 - BLOCK
      ?auto_160701 - BLOCK
      ?auto_160702 - BLOCK
      ?auto_160703 - BLOCK
      ?auto_160704 - BLOCK
      ?auto_160705 - BLOCK
      ?auto_160706 - BLOCK
      ?auto_160707 - BLOCK
      ?auto_160708 - BLOCK
      ?auto_160709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160709 ) ( ON-TABLE ?auto_160698 ) ( ON ?auto_160699 ?auto_160698 ) ( ON ?auto_160700 ?auto_160699 ) ( ON ?auto_160701 ?auto_160700 ) ( ON ?auto_160702 ?auto_160701 ) ( ON ?auto_160703 ?auto_160702 ) ( ON ?auto_160704 ?auto_160703 ) ( ON ?auto_160705 ?auto_160704 ) ( ON ?auto_160706 ?auto_160705 ) ( not ( = ?auto_160698 ?auto_160699 ) ) ( not ( = ?auto_160698 ?auto_160700 ) ) ( not ( = ?auto_160698 ?auto_160701 ) ) ( not ( = ?auto_160698 ?auto_160702 ) ) ( not ( = ?auto_160698 ?auto_160703 ) ) ( not ( = ?auto_160698 ?auto_160704 ) ) ( not ( = ?auto_160698 ?auto_160705 ) ) ( not ( = ?auto_160698 ?auto_160706 ) ) ( not ( = ?auto_160698 ?auto_160707 ) ) ( not ( = ?auto_160698 ?auto_160708 ) ) ( not ( = ?auto_160698 ?auto_160709 ) ) ( not ( = ?auto_160699 ?auto_160700 ) ) ( not ( = ?auto_160699 ?auto_160701 ) ) ( not ( = ?auto_160699 ?auto_160702 ) ) ( not ( = ?auto_160699 ?auto_160703 ) ) ( not ( = ?auto_160699 ?auto_160704 ) ) ( not ( = ?auto_160699 ?auto_160705 ) ) ( not ( = ?auto_160699 ?auto_160706 ) ) ( not ( = ?auto_160699 ?auto_160707 ) ) ( not ( = ?auto_160699 ?auto_160708 ) ) ( not ( = ?auto_160699 ?auto_160709 ) ) ( not ( = ?auto_160700 ?auto_160701 ) ) ( not ( = ?auto_160700 ?auto_160702 ) ) ( not ( = ?auto_160700 ?auto_160703 ) ) ( not ( = ?auto_160700 ?auto_160704 ) ) ( not ( = ?auto_160700 ?auto_160705 ) ) ( not ( = ?auto_160700 ?auto_160706 ) ) ( not ( = ?auto_160700 ?auto_160707 ) ) ( not ( = ?auto_160700 ?auto_160708 ) ) ( not ( = ?auto_160700 ?auto_160709 ) ) ( not ( = ?auto_160701 ?auto_160702 ) ) ( not ( = ?auto_160701 ?auto_160703 ) ) ( not ( = ?auto_160701 ?auto_160704 ) ) ( not ( = ?auto_160701 ?auto_160705 ) ) ( not ( = ?auto_160701 ?auto_160706 ) ) ( not ( = ?auto_160701 ?auto_160707 ) ) ( not ( = ?auto_160701 ?auto_160708 ) ) ( not ( = ?auto_160701 ?auto_160709 ) ) ( not ( = ?auto_160702 ?auto_160703 ) ) ( not ( = ?auto_160702 ?auto_160704 ) ) ( not ( = ?auto_160702 ?auto_160705 ) ) ( not ( = ?auto_160702 ?auto_160706 ) ) ( not ( = ?auto_160702 ?auto_160707 ) ) ( not ( = ?auto_160702 ?auto_160708 ) ) ( not ( = ?auto_160702 ?auto_160709 ) ) ( not ( = ?auto_160703 ?auto_160704 ) ) ( not ( = ?auto_160703 ?auto_160705 ) ) ( not ( = ?auto_160703 ?auto_160706 ) ) ( not ( = ?auto_160703 ?auto_160707 ) ) ( not ( = ?auto_160703 ?auto_160708 ) ) ( not ( = ?auto_160703 ?auto_160709 ) ) ( not ( = ?auto_160704 ?auto_160705 ) ) ( not ( = ?auto_160704 ?auto_160706 ) ) ( not ( = ?auto_160704 ?auto_160707 ) ) ( not ( = ?auto_160704 ?auto_160708 ) ) ( not ( = ?auto_160704 ?auto_160709 ) ) ( not ( = ?auto_160705 ?auto_160706 ) ) ( not ( = ?auto_160705 ?auto_160707 ) ) ( not ( = ?auto_160705 ?auto_160708 ) ) ( not ( = ?auto_160705 ?auto_160709 ) ) ( not ( = ?auto_160706 ?auto_160707 ) ) ( not ( = ?auto_160706 ?auto_160708 ) ) ( not ( = ?auto_160706 ?auto_160709 ) ) ( not ( = ?auto_160707 ?auto_160708 ) ) ( not ( = ?auto_160707 ?auto_160709 ) ) ( not ( = ?auto_160708 ?auto_160709 ) ) ( ON ?auto_160708 ?auto_160709 ) ( CLEAR ?auto_160706 ) ( ON ?auto_160707 ?auto_160708 ) ( CLEAR ?auto_160707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_160698 ?auto_160699 ?auto_160700 ?auto_160701 ?auto_160702 ?auto_160703 ?auto_160704 ?auto_160705 ?auto_160706 ?auto_160707 )
      ( MAKE-12PILE ?auto_160698 ?auto_160699 ?auto_160700 ?auto_160701 ?auto_160702 ?auto_160703 ?auto_160704 ?auto_160705 ?auto_160706 ?auto_160707 ?auto_160708 ?auto_160709 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160722 - BLOCK
      ?auto_160723 - BLOCK
      ?auto_160724 - BLOCK
      ?auto_160725 - BLOCK
      ?auto_160726 - BLOCK
      ?auto_160727 - BLOCK
      ?auto_160728 - BLOCK
      ?auto_160729 - BLOCK
      ?auto_160730 - BLOCK
      ?auto_160731 - BLOCK
      ?auto_160732 - BLOCK
      ?auto_160733 - BLOCK
    )
    :vars
    (
      ?auto_160734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160733 ?auto_160734 ) ( ON-TABLE ?auto_160722 ) ( ON ?auto_160723 ?auto_160722 ) ( ON ?auto_160724 ?auto_160723 ) ( ON ?auto_160725 ?auto_160724 ) ( ON ?auto_160726 ?auto_160725 ) ( ON ?auto_160727 ?auto_160726 ) ( ON ?auto_160728 ?auto_160727 ) ( ON ?auto_160729 ?auto_160728 ) ( not ( = ?auto_160722 ?auto_160723 ) ) ( not ( = ?auto_160722 ?auto_160724 ) ) ( not ( = ?auto_160722 ?auto_160725 ) ) ( not ( = ?auto_160722 ?auto_160726 ) ) ( not ( = ?auto_160722 ?auto_160727 ) ) ( not ( = ?auto_160722 ?auto_160728 ) ) ( not ( = ?auto_160722 ?auto_160729 ) ) ( not ( = ?auto_160722 ?auto_160730 ) ) ( not ( = ?auto_160722 ?auto_160731 ) ) ( not ( = ?auto_160722 ?auto_160732 ) ) ( not ( = ?auto_160722 ?auto_160733 ) ) ( not ( = ?auto_160722 ?auto_160734 ) ) ( not ( = ?auto_160723 ?auto_160724 ) ) ( not ( = ?auto_160723 ?auto_160725 ) ) ( not ( = ?auto_160723 ?auto_160726 ) ) ( not ( = ?auto_160723 ?auto_160727 ) ) ( not ( = ?auto_160723 ?auto_160728 ) ) ( not ( = ?auto_160723 ?auto_160729 ) ) ( not ( = ?auto_160723 ?auto_160730 ) ) ( not ( = ?auto_160723 ?auto_160731 ) ) ( not ( = ?auto_160723 ?auto_160732 ) ) ( not ( = ?auto_160723 ?auto_160733 ) ) ( not ( = ?auto_160723 ?auto_160734 ) ) ( not ( = ?auto_160724 ?auto_160725 ) ) ( not ( = ?auto_160724 ?auto_160726 ) ) ( not ( = ?auto_160724 ?auto_160727 ) ) ( not ( = ?auto_160724 ?auto_160728 ) ) ( not ( = ?auto_160724 ?auto_160729 ) ) ( not ( = ?auto_160724 ?auto_160730 ) ) ( not ( = ?auto_160724 ?auto_160731 ) ) ( not ( = ?auto_160724 ?auto_160732 ) ) ( not ( = ?auto_160724 ?auto_160733 ) ) ( not ( = ?auto_160724 ?auto_160734 ) ) ( not ( = ?auto_160725 ?auto_160726 ) ) ( not ( = ?auto_160725 ?auto_160727 ) ) ( not ( = ?auto_160725 ?auto_160728 ) ) ( not ( = ?auto_160725 ?auto_160729 ) ) ( not ( = ?auto_160725 ?auto_160730 ) ) ( not ( = ?auto_160725 ?auto_160731 ) ) ( not ( = ?auto_160725 ?auto_160732 ) ) ( not ( = ?auto_160725 ?auto_160733 ) ) ( not ( = ?auto_160725 ?auto_160734 ) ) ( not ( = ?auto_160726 ?auto_160727 ) ) ( not ( = ?auto_160726 ?auto_160728 ) ) ( not ( = ?auto_160726 ?auto_160729 ) ) ( not ( = ?auto_160726 ?auto_160730 ) ) ( not ( = ?auto_160726 ?auto_160731 ) ) ( not ( = ?auto_160726 ?auto_160732 ) ) ( not ( = ?auto_160726 ?auto_160733 ) ) ( not ( = ?auto_160726 ?auto_160734 ) ) ( not ( = ?auto_160727 ?auto_160728 ) ) ( not ( = ?auto_160727 ?auto_160729 ) ) ( not ( = ?auto_160727 ?auto_160730 ) ) ( not ( = ?auto_160727 ?auto_160731 ) ) ( not ( = ?auto_160727 ?auto_160732 ) ) ( not ( = ?auto_160727 ?auto_160733 ) ) ( not ( = ?auto_160727 ?auto_160734 ) ) ( not ( = ?auto_160728 ?auto_160729 ) ) ( not ( = ?auto_160728 ?auto_160730 ) ) ( not ( = ?auto_160728 ?auto_160731 ) ) ( not ( = ?auto_160728 ?auto_160732 ) ) ( not ( = ?auto_160728 ?auto_160733 ) ) ( not ( = ?auto_160728 ?auto_160734 ) ) ( not ( = ?auto_160729 ?auto_160730 ) ) ( not ( = ?auto_160729 ?auto_160731 ) ) ( not ( = ?auto_160729 ?auto_160732 ) ) ( not ( = ?auto_160729 ?auto_160733 ) ) ( not ( = ?auto_160729 ?auto_160734 ) ) ( not ( = ?auto_160730 ?auto_160731 ) ) ( not ( = ?auto_160730 ?auto_160732 ) ) ( not ( = ?auto_160730 ?auto_160733 ) ) ( not ( = ?auto_160730 ?auto_160734 ) ) ( not ( = ?auto_160731 ?auto_160732 ) ) ( not ( = ?auto_160731 ?auto_160733 ) ) ( not ( = ?auto_160731 ?auto_160734 ) ) ( not ( = ?auto_160732 ?auto_160733 ) ) ( not ( = ?auto_160732 ?auto_160734 ) ) ( not ( = ?auto_160733 ?auto_160734 ) ) ( ON ?auto_160732 ?auto_160733 ) ( ON ?auto_160731 ?auto_160732 ) ( CLEAR ?auto_160729 ) ( ON ?auto_160730 ?auto_160731 ) ( CLEAR ?auto_160730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_160722 ?auto_160723 ?auto_160724 ?auto_160725 ?auto_160726 ?auto_160727 ?auto_160728 ?auto_160729 ?auto_160730 )
      ( MAKE-12PILE ?auto_160722 ?auto_160723 ?auto_160724 ?auto_160725 ?auto_160726 ?auto_160727 ?auto_160728 ?auto_160729 ?auto_160730 ?auto_160731 ?auto_160732 ?auto_160733 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160747 - BLOCK
      ?auto_160748 - BLOCK
      ?auto_160749 - BLOCK
      ?auto_160750 - BLOCK
      ?auto_160751 - BLOCK
      ?auto_160752 - BLOCK
      ?auto_160753 - BLOCK
      ?auto_160754 - BLOCK
      ?auto_160755 - BLOCK
      ?auto_160756 - BLOCK
      ?auto_160757 - BLOCK
      ?auto_160758 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160758 ) ( ON-TABLE ?auto_160747 ) ( ON ?auto_160748 ?auto_160747 ) ( ON ?auto_160749 ?auto_160748 ) ( ON ?auto_160750 ?auto_160749 ) ( ON ?auto_160751 ?auto_160750 ) ( ON ?auto_160752 ?auto_160751 ) ( ON ?auto_160753 ?auto_160752 ) ( ON ?auto_160754 ?auto_160753 ) ( not ( = ?auto_160747 ?auto_160748 ) ) ( not ( = ?auto_160747 ?auto_160749 ) ) ( not ( = ?auto_160747 ?auto_160750 ) ) ( not ( = ?auto_160747 ?auto_160751 ) ) ( not ( = ?auto_160747 ?auto_160752 ) ) ( not ( = ?auto_160747 ?auto_160753 ) ) ( not ( = ?auto_160747 ?auto_160754 ) ) ( not ( = ?auto_160747 ?auto_160755 ) ) ( not ( = ?auto_160747 ?auto_160756 ) ) ( not ( = ?auto_160747 ?auto_160757 ) ) ( not ( = ?auto_160747 ?auto_160758 ) ) ( not ( = ?auto_160748 ?auto_160749 ) ) ( not ( = ?auto_160748 ?auto_160750 ) ) ( not ( = ?auto_160748 ?auto_160751 ) ) ( not ( = ?auto_160748 ?auto_160752 ) ) ( not ( = ?auto_160748 ?auto_160753 ) ) ( not ( = ?auto_160748 ?auto_160754 ) ) ( not ( = ?auto_160748 ?auto_160755 ) ) ( not ( = ?auto_160748 ?auto_160756 ) ) ( not ( = ?auto_160748 ?auto_160757 ) ) ( not ( = ?auto_160748 ?auto_160758 ) ) ( not ( = ?auto_160749 ?auto_160750 ) ) ( not ( = ?auto_160749 ?auto_160751 ) ) ( not ( = ?auto_160749 ?auto_160752 ) ) ( not ( = ?auto_160749 ?auto_160753 ) ) ( not ( = ?auto_160749 ?auto_160754 ) ) ( not ( = ?auto_160749 ?auto_160755 ) ) ( not ( = ?auto_160749 ?auto_160756 ) ) ( not ( = ?auto_160749 ?auto_160757 ) ) ( not ( = ?auto_160749 ?auto_160758 ) ) ( not ( = ?auto_160750 ?auto_160751 ) ) ( not ( = ?auto_160750 ?auto_160752 ) ) ( not ( = ?auto_160750 ?auto_160753 ) ) ( not ( = ?auto_160750 ?auto_160754 ) ) ( not ( = ?auto_160750 ?auto_160755 ) ) ( not ( = ?auto_160750 ?auto_160756 ) ) ( not ( = ?auto_160750 ?auto_160757 ) ) ( not ( = ?auto_160750 ?auto_160758 ) ) ( not ( = ?auto_160751 ?auto_160752 ) ) ( not ( = ?auto_160751 ?auto_160753 ) ) ( not ( = ?auto_160751 ?auto_160754 ) ) ( not ( = ?auto_160751 ?auto_160755 ) ) ( not ( = ?auto_160751 ?auto_160756 ) ) ( not ( = ?auto_160751 ?auto_160757 ) ) ( not ( = ?auto_160751 ?auto_160758 ) ) ( not ( = ?auto_160752 ?auto_160753 ) ) ( not ( = ?auto_160752 ?auto_160754 ) ) ( not ( = ?auto_160752 ?auto_160755 ) ) ( not ( = ?auto_160752 ?auto_160756 ) ) ( not ( = ?auto_160752 ?auto_160757 ) ) ( not ( = ?auto_160752 ?auto_160758 ) ) ( not ( = ?auto_160753 ?auto_160754 ) ) ( not ( = ?auto_160753 ?auto_160755 ) ) ( not ( = ?auto_160753 ?auto_160756 ) ) ( not ( = ?auto_160753 ?auto_160757 ) ) ( not ( = ?auto_160753 ?auto_160758 ) ) ( not ( = ?auto_160754 ?auto_160755 ) ) ( not ( = ?auto_160754 ?auto_160756 ) ) ( not ( = ?auto_160754 ?auto_160757 ) ) ( not ( = ?auto_160754 ?auto_160758 ) ) ( not ( = ?auto_160755 ?auto_160756 ) ) ( not ( = ?auto_160755 ?auto_160757 ) ) ( not ( = ?auto_160755 ?auto_160758 ) ) ( not ( = ?auto_160756 ?auto_160757 ) ) ( not ( = ?auto_160756 ?auto_160758 ) ) ( not ( = ?auto_160757 ?auto_160758 ) ) ( ON ?auto_160757 ?auto_160758 ) ( ON ?auto_160756 ?auto_160757 ) ( CLEAR ?auto_160754 ) ( ON ?auto_160755 ?auto_160756 ) ( CLEAR ?auto_160755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_160747 ?auto_160748 ?auto_160749 ?auto_160750 ?auto_160751 ?auto_160752 ?auto_160753 ?auto_160754 ?auto_160755 )
      ( MAKE-12PILE ?auto_160747 ?auto_160748 ?auto_160749 ?auto_160750 ?auto_160751 ?auto_160752 ?auto_160753 ?auto_160754 ?auto_160755 ?auto_160756 ?auto_160757 ?auto_160758 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160771 - BLOCK
      ?auto_160772 - BLOCK
      ?auto_160773 - BLOCK
      ?auto_160774 - BLOCK
      ?auto_160775 - BLOCK
      ?auto_160776 - BLOCK
      ?auto_160777 - BLOCK
      ?auto_160778 - BLOCK
      ?auto_160779 - BLOCK
      ?auto_160780 - BLOCK
      ?auto_160781 - BLOCK
      ?auto_160782 - BLOCK
    )
    :vars
    (
      ?auto_160783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160782 ?auto_160783 ) ( ON-TABLE ?auto_160771 ) ( ON ?auto_160772 ?auto_160771 ) ( ON ?auto_160773 ?auto_160772 ) ( ON ?auto_160774 ?auto_160773 ) ( ON ?auto_160775 ?auto_160774 ) ( ON ?auto_160776 ?auto_160775 ) ( ON ?auto_160777 ?auto_160776 ) ( not ( = ?auto_160771 ?auto_160772 ) ) ( not ( = ?auto_160771 ?auto_160773 ) ) ( not ( = ?auto_160771 ?auto_160774 ) ) ( not ( = ?auto_160771 ?auto_160775 ) ) ( not ( = ?auto_160771 ?auto_160776 ) ) ( not ( = ?auto_160771 ?auto_160777 ) ) ( not ( = ?auto_160771 ?auto_160778 ) ) ( not ( = ?auto_160771 ?auto_160779 ) ) ( not ( = ?auto_160771 ?auto_160780 ) ) ( not ( = ?auto_160771 ?auto_160781 ) ) ( not ( = ?auto_160771 ?auto_160782 ) ) ( not ( = ?auto_160771 ?auto_160783 ) ) ( not ( = ?auto_160772 ?auto_160773 ) ) ( not ( = ?auto_160772 ?auto_160774 ) ) ( not ( = ?auto_160772 ?auto_160775 ) ) ( not ( = ?auto_160772 ?auto_160776 ) ) ( not ( = ?auto_160772 ?auto_160777 ) ) ( not ( = ?auto_160772 ?auto_160778 ) ) ( not ( = ?auto_160772 ?auto_160779 ) ) ( not ( = ?auto_160772 ?auto_160780 ) ) ( not ( = ?auto_160772 ?auto_160781 ) ) ( not ( = ?auto_160772 ?auto_160782 ) ) ( not ( = ?auto_160772 ?auto_160783 ) ) ( not ( = ?auto_160773 ?auto_160774 ) ) ( not ( = ?auto_160773 ?auto_160775 ) ) ( not ( = ?auto_160773 ?auto_160776 ) ) ( not ( = ?auto_160773 ?auto_160777 ) ) ( not ( = ?auto_160773 ?auto_160778 ) ) ( not ( = ?auto_160773 ?auto_160779 ) ) ( not ( = ?auto_160773 ?auto_160780 ) ) ( not ( = ?auto_160773 ?auto_160781 ) ) ( not ( = ?auto_160773 ?auto_160782 ) ) ( not ( = ?auto_160773 ?auto_160783 ) ) ( not ( = ?auto_160774 ?auto_160775 ) ) ( not ( = ?auto_160774 ?auto_160776 ) ) ( not ( = ?auto_160774 ?auto_160777 ) ) ( not ( = ?auto_160774 ?auto_160778 ) ) ( not ( = ?auto_160774 ?auto_160779 ) ) ( not ( = ?auto_160774 ?auto_160780 ) ) ( not ( = ?auto_160774 ?auto_160781 ) ) ( not ( = ?auto_160774 ?auto_160782 ) ) ( not ( = ?auto_160774 ?auto_160783 ) ) ( not ( = ?auto_160775 ?auto_160776 ) ) ( not ( = ?auto_160775 ?auto_160777 ) ) ( not ( = ?auto_160775 ?auto_160778 ) ) ( not ( = ?auto_160775 ?auto_160779 ) ) ( not ( = ?auto_160775 ?auto_160780 ) ) ( not ( = ?auto_160775 ?auto_160781 ) ) ( not ( = ?auto_160775 ?auto_160782 ) ) ( not ( = ?auto_160775 ?auto_160783 ) ) ( not ( = ?auto_160776 ?auto_160777 ) ) ( not ( = ?auto_160776 ?auto_160778 ) ) ( not ( = ?auto_160776 ?auto_160779 ) ) ( not ( = ?auto_160776 ?auto_160780 ) ) ( not ( = ?auto_160776 ?auto_160781 ) ) ( not ( = ?auto_160776 ?auto_160782 ) ) ( not ( = ?auto_160776 ?auto_160783 ) ) ( not ( = ?auto_160777 ?auto_160778 ) ) ( not ( = ?auto_160777 ?auto_160779 ) ) ( not ( = ?auto_160777 ?auto_160780 ) ) ( not ( = ?auto_160777 ?auto_160781 ) ) ( not ( = ?auto_160777 ?auto_160782 ) ) ( not ( = ?auto_160777 ?auto_160783 ) ) ( not ( = ?auto_160778 ?auto_160779 ) ) ( not ( = ?auto_160778 ?auto_160780 ) ) ( not ( = ?auto_160778 ?auto_160781 ) ) ( not ( = ?auto_160778 ?auto_160782 ) ) ( not ( = ?auto_160778 ?auto_160783 ) ) ( not ( = ?auto_160779 ?auto_160780 ) ) ( not ( = ?auto_160779 ?auto_160781 ) ) ( not ( = ?auto_160779 ?auto_160782 ) ) ( not ( = ?auto_160779 ?auto_160783 ) ) ( not ( = ?auto_160780 ?auto_160781 ) ) ( not ( = ?auto_160780 ?auto_160782 ) ) ( not ( = ?auto_160780 ?auto_160783 ) ) ( not ( = ?auto_160781 ?auto_160782 ) ) ( not ( = ?auto_160781 ?auto_160783 ) ) ( not ( = ?auto_160782 ?auto_160783 ) ) ( ON ?auto_160781 ?auto_160782 ) ( ON ?auto_160780 ?auto_160781 ) ( ON ?auto_160779 ?auto_160780 ) ( CLEAR ?auto_160777 ) ( ON ?auto_160778 ?auto_160779 ) ( CLEAR ?auto_160778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_160771 ?auto_160772 ?auto_160773 ?auto_160774 ?auto_160775 ?auto_160776 ?auto_160777 ?auto_160778 )
      ( MAKE-12PILE ?auto_160771 ?auto_160772 ?auto_160773 ?auto_160774 ?auto_160775 ?auto_160776 ?auto_160777 ?auto_160778 ?auto_160779 ?auto_160780 ?auto_160781 ?auto_160782 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160796 - BLOCK
      ?auto_160797 - BLOCK
      ?auto_160798 - BLOCK
      ?auto_160799 - BLOCK
      ?auto_160800 - BLOCK
      ?auto_160801 - BLOCK
      ?auto_160802 - BLOCK
      ?auto_160803 - BLOCK
      ?auto_160804 - BLOCK
      ?auto_160805 - BLOCK
      ?auto_160806 - BLOCK
      ?auto_160807 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160807 ) ( ON-TABLE ?auto_160796 ) ( ON ?auto_160797 ?auto_160796 ) ( ON ?auto_160798 ?auto_160797 ) ( ON ?auto_160799 ?auto_160798 ) ( ON ?auto_160800 ?auto_160799 ) ( ON ?auto_160801 ?auto_160800 ) ( ON ?auto_160802 ?auto_160801 ) ( not ( = ?auto_160796 ?auto_160797 ) ) ( not ( = ?auto_160796 ?auto_160798 ) ) ( not ( = ?auto_160796 ?auto_160799 ) ) ( not ( = ?auto_160796 ?auto_160800 ) ) ( not ( = ?auto_160796 ?auto_160801 ) ) ( not ( = ?auto_160796 ?auto_160802 ) ) ( not ( = ?auto_160796 ?auto_160803 ) ) ( not ( = ?auto_160796 ?auto_160804 ) ) ( not ( = ?auto_160796 ?auto_160805 ) ) ( not ( = ?auto_160796 ?auto_160806 ) ) ( not ( = ?auto_160796 ?auto_160807 ) ) ( not ( = ?auto_160797 ?auto_160798 ) ) ( not ( = ?auto_160797 ?auto_160799 ) ) ( not ( = ?auto_160797 ?auto_160800 ) ) ( not ( = ?auto_160797 ?auto_160801 ) ) ( not ( = ?auto_160797 ?auto_160802 ) ) ( not ( = ?auto_160797 ?auto_160803 ) ) ( not ( = ?auto_160797 ?auto_160804 ) ) ( not ( = ?auto_160797 ?auto_160805 ) ) ( not ( = ?auto_160797 ?auto_160806 ) ) ( not ( = ?auto_160797 ?auto_160807 ) ) ( not ( = ?auto_160798 ?auto_160799 ) ) ( not ( = ?auto_160798 ?auto_160800 ) ) ( not ( = ?auto_160798 ?auto_160801 ) ) ( not ( = ?auto_160798 ?auto_160802 ) ) ( not ( = ?auto_160798 ?auto_160803 ) ) ( not ( = ?auto_160798 ?auto_160804 ) ) ( not ( = ?auto_160798 ?auto_160805 ) ) ( not ( = ?auto_160798 ?auto_160806 ) ) ( not ( = ?auto_160798 ?auto_160807 ) ) ( not ( = ?auto_160799 ?auto_160800 ) ) ( not ( = ?auto_160799 ?auto_160801 ) ) ( not ( = ?auto_160799 ?auto_160802 ) ) ( not ( = ?auto_160799 ?auto_160803 ) ) ( not ( = ?auto_160799 ?auto_160804 ) ) ( not ( = ?auto_160799 ?auto_160805 ) ) ( not ( = ?auto_160799 ?auto_160806 ) ) ( not ( = ?auto_160799 ?auto_160807 ) ) ( not ( = ?auto_160800 ?auto_160801 ) ) ( not ( = ?auto_160800 ?auto_160802 ) ) ( not ( = ?auto_160800 ?auto_160803 ) ) ( not ( = ?auto_160800 ?auto_160804 ) ) ( not ( = ?auto_160800 ?auto_160805 ) ) ( not ( = ?auto_160800 ?auto_160806 ) ) ( not ( = ?auto_160800 ?auto_160807 ) ) ( not ( = ?auto_160801 ?auto_160802 ) ) ( not ( = ?auto_160801 ?auto_160803 ) ) ( not ( = ?auto_160801 ?auto_160804 ) ) ( not ( = ?auto_160801 ?auto_160805 ) ) ( not ( = ?auto_160801 ?auto_160806 ) ) ( not ( = ?auto_160801 ?auto_160807 ) ) ( not ( = ?auto_160802 ?auto_160803 ) ) ( not ( = ?auto_160802 ?auto_160804 ) ) ( not ( = ?auto_160802 ?auto_160805 ) ) ( not ( = ?auto_160802 ?auto_160806 ) ) ( not ( = ?auto_160802 ?auto_160807 ) ) ( not ( = ?auto_160803 ?auto_160804 ) ) ( not ( = ?auto_160803 ?auto_160805 ) ) ( not ( = ?auto_160803 ?auto_160806 ) ) ( not ( = ?auto_160803 ?auto_160807 ) ) ( not ( = ?auto_160804 ?auto_160805 ) ) ( not ( = ?auto_160804 ?auto_160806 ) ) ( not ( = ?auto_160804 ?auto_160807 ) ) ( not ( = ?auto_160805 ?auto_160806 ) ) ( not ( = ?auto_160805 ?auto_160807 ) ) ( not ( = ?auto_160806 ?auto_160807 ) ) ( ON ?auto_160806 ?auto_160807 ) ( ON ?auto_160805 ?auto_160806 ) ( ON ?auto_160804 ?auto_160805 ) ( CLEAR ?auto_160802 ) ( ON ?auto_160803 ?auto_160804 ) ( CLEAR ?auto_160803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_160796 ?auto_160797 ?auto_160798 ?auto_160799 ?auto_160800 ?auto_160801 ?auto_160802 ?auto_160803 )
      ( MAKE-12PILE ?auto_160796 ?auto_160797 ?auto_160798 ?auto_160799 ?auto_160800 ?auto_160801 ?auto_160802 ?auto_160803 ?auto_160804 ?auto_160805 ?auto_160806 ?auto_160807 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160820 - BLOCK
      ?auto_160821 - BLOCK
      ?auto_160822 - BLOCK
      ?auto_160823 - BLOCK
      ?auto_160824 - BLOCK
      ?auto_160825 - BLOCK
      ?auto_160826 - BLOCK
      ?auto_160827 - BLOCK
      ?auto_160828 - BLOCK
      ?auto_160829 - BLOCK
      ?auto_160830 - BLOCK
      ?auto_160831 - BLOCK
    )
    :vars
    (
      ?auto_160832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160831 ?auto_160832 ) ( ON-TABLE ?auto_160820 ) ( ON ?auto_160821 ?auto_160820 ) ( ON ?auto_160822 ?auto_160821 ) ( ON ?auto_160823 ?auto_160822 ) ( ON ?auto_160824 ?auto_160823 ) ( ON ?auto_160825 ?auto_160824 ) ( not ( = ?auto_160820 ?auto_160821 ) ) ( not ( = ?auto_160820 ?auto_160822 ) ) ( not ( = ?auto_160820 ?auto_160823 ) ) ( not ( = ?auto_160820 ?auto_160824 ) ) ( not ( = ?auto_160820 ?auto_160825 ) ) ( not ( = ?auto_160820 ?auto_160826 ) ) ( not ( = ?auto_160820 ?auto_160827 ) ) ( not ( = ?auto_160820 ?auto_160828 ) ) ( not ( = ?auto_160820 ?auto_160829 ) ) ( not ( = ?auto_160820 ?auto_160830 ) ) ( not ( = ?auto_160820 ?auto_160831 ) ) ( not ( = ?auto_160820 ?auto_160832 ) ) ( not ( = ?auto_160821 ?auto_160822 ) ) ( not ( = ?auto_160821 ?auto_160823 ) ) ( not ( = ?auto_160821 ?auto_160824 ) ) ( not ( = ?auto_160821 ?auto_160825 ) ) ( not ( = ?auto_160821 ?auto_160826 ) ) ( not ( = ?auto_160821 ?auto_160827 ) ) ( not ( = ?auto_160821 ?auto_160828 ) ) ( not ( = ?auto_160821 ?auto_160829 ) ) ( not ( = ?auto_160821 ?auto_160830 ) ) ( not ( = ?auto_160821 ?auto_160831 ) ) ( not ( = ?auto_160821 ?auto_160832 ) ) ( not ( = ?auto_160822 ?auto_160823 ) ) ( not ( = ?auto_160822 ?auto_160824 ) ) ( not ( = ?auto_160822 ?auto_160825 ) ) ( not ( = ?auto_160822 ?auto_160826 ) ) ( not ( = ?auto_160822 ?auto_160827 ) ) ( not ( = ?auto_160822 ?auto_160828 ) ) ( not ( = ?auto_160822 ?auto_160829 ) ) ( not ( = ?auto_160822 ?auto_160830 ) ) ( not ( = ?auto_160822 ?auto_160831 ) ) ( not ( = ?auto_160822 ?auto_160832 ) ) ( not ( = ?auto_160823 ?auto_160824 ) ) ( not ( = ?auto_160823 ?auto_160825 ) ) ( not ( = ?auto_160823 ?auto_160826 ) ) ( not ( = ?auto_160823 ?auto_160827 ) ) ( not ( = ?auto_160823 ?auto_160828 ) ) ( not ( = ?auto_160823 ?auto_160829 ) ) ( not ( = ?auto_160823 ?auto_160830 ) ) ( not ( = ?auto_160823 ?auto_160831 ) ) ( not ( = ?auto_160823 ?auto_160832 ) ) ( not ( = ?auto_160824 ?auto_160825 ) ) ( not ( = ?auto_160824 ?auto_160826 ) ) ( not ( = ?auto_160824 ?auto_160827 ) ) ( not ( = ?auto_160824 ?auto_160828 ) ) ( not ( = ?auto_160824 ?auto_160829 ) ) ( not ( = ?auto_160824 ?auto_160830 ) ) ( not ( = ?auto_160824 ?auto_160831 ) ) ( not ( = ?auto_160824 ?auto_160832 ) ) ( not ( = ?auto_160825 ?auto_160826 ) ) ( not ( = ?auto_160825 ?auto_160827 ) ) ( not ( = ?auto_160825 ?auto_160828 ) ) ( not ( = ?auto_160825 ?auto_160829 ) ) ( not ( = ?auto_160825 ?auto_160830 ) ) ( not ( = ?auto_160825 ?auto_160831 ) ) ( not ( = ?auto_160825 ?auto_160832 ) ) ( not ( = ?auto_160826 ?auto_160827 ) ) ( not ( = ?auto_160826 ?auto_160828 ) ) ( not ( = ?auto_160826 ?auto_160829 ) ) ( not ( = ?auto_160826 ?auto_160830 ) ) ( not ( = ?auto_160826 ?auto_160831 ) ) ( not ( = ?auto_160826 ?auto_160832 ) ) ( not ( = ?auto_160827 ?auto_160828 ) ) ( not ( = ?auto_160827 ?auto_160829 ) ) ( not ( = ?auto_160827 ?auto_160830 ) ) ( not ( = ?auto_160827 ?auto_160831 ) ) ( not ( = ?auto_160827 ?auto_160832 ) ) ( not ( = ?auto_160828 ?auto_160829 ) ) ( not ( = ?auto_160828 ?auto_160830 ) ) ( not ( = ?auto_160828 ?auto_160831 ) ) ( not ( = ?auto_160828 ?auto_160832 ) ) ( not ( = ?auto_160829 ?auto_160830 ) ) ( not ( = ?auto_160829 ?auto_160831 ) ) ( not ( = ?auto_160829 ?auto_160832 ) ) ( not ( = ?auto_160830 ?auto_160831 ) ) ( not ( = ?auto_160830 ?auto_160832 ) ) ( not ( = ?auto_160831 ?auto_160832 ) ) ( ON ?auto_160830 ?auto_160831 ) ( ON ?auto_160829 ?auto_160830 ) ( ON ?auto_160828 ?auto_160829 ) ( ON ?auto_160827 ?auto_160828 ) ( CLEAR ?auto_160825 ) ( ON ?auto_160826 ?auto_160827 ) ( CLEAR ?auto_160826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160820 ?auto_160821 ?auto_160822 ?auto_160823 ?auto_160824 ?auto_160825 ?auto_160826 )
      ( MAKE-12PILE ?auto_160820 ?auto_160821 ?auto_160822 ?auto_160823 ?auto_160824 ?auto_160825 ?auto_160826 ?auto_160827 ?auto_160828 ?auto_160829 ?auto_160830 ?auto_160831 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160845 - BLOCK
      ?auto_160846 - BLOCK
      ?auto_160847 - BLOCK
      ?auto_160848 - BLOCK
      ?auto_160849 - BLOCK
      ?auto_160850 - BLOCK
      ?auto_160851 - BLOCK
      ?auto_160852 - BLOCK
      ?auto_160853 - BLOCK
      ?auto_160854 - BLOCK
      ?auto_160855 - BLOCK
      ?auto_160856 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160856 ) ( ON-TABLE ?auto_160845 ) ( ON ?auto_160846 ?auto_160845 ) ( ON ?auto_160847 ?auto_160846 ) ( ON ?auto_160848 ?auto_160847 ) ( ON ?auto_160849 ?auto_160848 ) ( ON ?auto_160850 ?auto_160849 ) ( not ( = ?auto_160845 ?auto_160846 ) ) ( not ( = ?auto_160845 ?auto_160847 ) ) ( not ( = ?auto_160845 ?auto_160848 ) ) ( not ( = ?auto_160845 ?auto_160849 ) ) ( not ( = ?auto_160845 ?auto_160850 ) ) ( not ( = ?auto_160845 ?auto_160851 ) ) ( not ( = ?auto_160845 ?auto_160852 ) ) ( not ( = ?auto_160845 ?auto_160853 ) ) ( not ( = ?auto_160845 ?auto_160854 ) ) ( not ( = ?auto_160845 ?auto_160855 ) ) ( not ( = ?auto_160845 ?auto_160856 ) ) ( not ( = ?auto_160846 ?auto_160847 ) ) ( not ( = ?auto_160846 ?auto_160848 ) ) ( not ( = ?auto_160846 ?auto_160849 ) ) ( not ( = ?auto_160846 ?auto_160850 ) ) ( not ( = ?auto_160846 ?auto_160851 ) ) ( not ( = ?auto_160846 ?auto_160852 ) ) ( not ( = ?auto_160846 ?auto_160853 ) ) ( not ( = ?auto_160846 ?auto_160854 ) ) ( not ( = ?auto_160846 ?auto_160855 ) ) ( not ( = ?auto_160846 ?auto_160856 ) ) ( not ( = ?auto_160847 ?auto_160848 ) ) ( not ( = ?auto_160847 ?auto_160849 ) ) ( not ( = ?auto_160847 ?auto_160850 ) ) ( not ( = ?auto_160847 ?auto_160851 ) ) ( not ( = ?auto_160847 ?auto_160852 ) ) ( not ( = ?auto_160847 ?auto_160853 ) ) ( not ( = ?auto_160847 ?auto_160854 ) ) ( not ( = ?auto_160847 ?auto_160855 ) ) ( not ( = ?auto_160847 ?auto_160856 ) ) ( not ( = ?auto_160848 ?auto_160849 ) ) ( not ( = ?auto_160848 ?auto_160850 ) ) ( not ( = ?auto_160848 ?auto_160851 ) ) ( not ( = ?auto_160848 ?auto_160852 ) ) ( not ( = ?auto_160848 ?auto_160853 ) ) ( not ( = ?auto_160848 ?auto_160854 ) ) ( not ( = ?auto_160848 ?auto_160855 ) ) ( not ( = ?auto_160848 ?auto_160856 ) ) ( not ( = ?auto_160849 ?auto_160850 ) ) ( not ( = ?auto_160849 ?auto_160851 ) ) ( not ( = ?auto_160849 ?auto_160852 ) ) ( not ( = ?auto_160849 ?auto_160853 ) ) ( not ( = ?auto_160849 ?auto_160854 ) ) ( not ( = ?auto_160849 ?auto_160855 ) ) ( not ( = ?auto_160849 ?auto_160856 ) ) ( not ( = ?auto_160850 ?auto_160851 ) ) ( not ( = ?auto_160850 ?auto_160852 ) ) ( not ( = ?auto_160850 ?auto_160853 ) ) ( not ( = ?auto_160850 ?auto_160854 ) ) ( not ( = ?auto_160850 ?auto_160855 ) ) ( not ( = ?auto_160850 ?auto_160856 ) ) ( not ( = ?auto_160851 ?auto_160852 ) ) ( not ( = ?auto_160851 ?auto_160853 ) ) ( not ( = ?auto_160851 ?auto_160854 ) ) ( not ( = ?auto_160851 ?auto_160855 ) ) ( not ( = ?auto_160851 ?auto_160856 ) ) ( not ( = ?auto_160852 ?auto_160853 ) ) ( not ( = ?auto_160852 ?auto_160854 ) ) ( not ( = ?auto_160852 ?auto_160855 ) ) ( not ( = ?auto_160852 ?auto_160856 ) ) ( not ( = ?auto_160853 ?auto_160854 ) ) ( not ( = ?auto_160853 ?auto_160855 ) ) ( not ( = ?auto_160853 ?auto_160856 ) ) ( not ( = ?auto_160854 ?auto_160855 ) ) ( not ( = ?auto_160854 ?auto_160856 ) ) ( not ( = ?auto_160855 ?auto_160856 ) ) ( ON ?auto_160855 ?auto_160856 ) ( ON ?auto_160854 ?auto_160855 ) ( ON ?auto_160853 ?auto_160854 ) ( ON ?auto_160852 ?auto_160853 ) ( CLEAR ?auto_160850 ) ( ON ?auto_160851 ?auto_160852 ) ( CLEAR ?auto_160851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160845 ?auto_160846 ?auto_160847 ?auto_160848 ?auto_160849 ?auto_160850 ?auto_160851 )
      ( MAKE-12PILE ?auto_160845 ?auto_160846 ?auto_160847 ?auto_160848 ?auto_160849 ?auto_160850 ?auto_160851 ?auto_160852 ?auto_160853 ?auto_160854 ?auto_160855 ?auto_160856 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160869 - BLOCK
      ?auto_160870 - BLOCK
      ?auto_160871 - BLOCK
      ?auto_160872 - BLOCK
      ?auto_160873 - BLOCK
      ?auto_160874 - BLOCK
      ?auto_160875 - BLOCK
      ?auto_160876 - BLOCK
      ?auto_160877 - BLOCK
      ?auto_160878 - BLOCK
      ?auto_160879 - BLOCK
      ?auto_160880 - BLOCK
    )
    :vars
    (
      ?auto_160881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160880 ?auto_160881 ) ( ON-TABLE ?auto_160869 ) ( ON ?auto_160870 ?auto_160869 ) ( ON ?auto_160871 ?auto_160870 ) ( ON ?auto_160872 ?auto_160871 ) ( ON ?auto_160873 ?auto_160872 ) ( not ( = ?auto_160869 ?auto_160870 ) ) ( not ( = ?auto_160869 ?auto_160871 ) ) ( not ( = ?auto_160869 ?auto_160872 ) ) ( not ( = ?auto_160869 ?auto_160873 ) ) ( not ( = ?auto_160869 ?auto_160874 ) ) ( not ( = ?auto_160869 ?auto_160875 ) ) ( not ( = ?auto_160869 ?auto_160876 ) ) ( not ( = ?auto_160869 ?auto_160877 ) ) ( not ( = ?auto_160869 ?auto_160878 ) ) ( not ( = ?auto_160869 ?auto_160879 ) ) ( not ( = ?auto_160869 ?auto_160880 ) ) ( not ( = ?auto_160869 ?auto_160881 ) ) ( not ( = ?auto_160870 ?auto_160871 ) ) ( not ( = ?auto_160870 ?auto_160872 ) ) ( not ( = ?auto_160870 ?auto_160873 ) ) ( not ( = ?auto_160870 ?auto_160874 ) ) ( not ( = ?auto_160870 ?auto_160875 ) ) ( not ( = ?auto_160870 ?auto_160876 ) ) ( not ( = ?auto_160870 ?auto_160877 ) ) ( not ( = ?auto_160870 ?auto_160878 ) ) ( not ( = ?auto_160870 ?auto_160879 ) ) ( not ( = ?auto_160870 ?auto_160880 ) ) ( not ( = ?auto_160870 ?auto_160881 ) ) ( not ( = ?auto_160871 ?auto_160872 ) ) ( not ( = ?auto_160871 ?auto_160873 ) ) ( not ( = ?auto_160871 ?auto_160874 ) ) ( not ( = ?auto_160871 ?auto_160875 ) ) ( not ( = ?auto_160871 ?auto_160876 ) ) ( not ( = ?auto_160871 ?auto_160877 ) ) ( not ( = ?auto_160871 ?auto_160878 ) ) ( not ( = ?auto_160871 ?auto_160879 ) ) ( not ( = ?auto_160871 ?auto_160880 ) ) ( not ( = ?auto_160871 ?auto_160881 ) ) ( not ( = ?auto_160872 ?auto_160873 ) ) ( not ( = ?auto_160872 ?auto_160874 ) ) ( not ( = ?auto_160872 ?auto_160875 ) ) ( not ( = ?auto_160872 ?auto_160876 ) ) ( not ( = ?auto_160872 ?auto_160877 ) ) ( not ( = ?auto_160872 ?auto_160878 ) ) ( not ( = ?auto_160872 ?auto_160879 ) ) ( not ( = ?auto_160872 ?auto_160880 ) ) ( not ( = ?auto_160872 ?auto_160881 ) ) ( not ( = ?auto_160873 ?auto_160874 ) ) ( not ( = ?auto_160873 ?auto_160875 ) ) ( not ( = ?auto_160873 ?auto_160876 ) ) ( not ( = ?auto_160873 ?auto_160877 ) ) ( not ( = ?auto_160873 ?auto_160878 ) ) ( not ( = ?auto_160873 ?auto_160879 ) ) ( not ( = ?auto_160873 ?auto_160880 ) ) ( not ( = ?auto_160873 ?auto_160881 ) ) ( not ( = ?auto_160874 ?auto_160875 ) ) ( not ( = ?auto_160874 ?auto_160876 ) ) ( not ( = ?auto_160874 ?auto_160877 ) ) ( not ( = ?auto_160874 ?auto_160878 ) ) ( not ( = ?auto_160874 ?auto_160879 ) ) ( not ( = ?auto_160874 ?auto_160880 ) ) ( not ( = ?auto_160874 ?auto_160881 ) ) ( not ( = ?auto_160875 ?auto_160876 ) ) ( not ( = ?auto_160875 ?auto_160877 ) ) ( not ( = ?auto_160875 ?auto_160878 ) ) ( not ( = ?auto_160875 ?auto_160879 ) ) ( not ( = ?auto_160875 ?auto_160880 ) ) ( not ( = ?auto_160875 ?auto_160881 ) ) ( not ( = ?auto_160876 ?auto_160877 ) ) ( not ( = ?auto_160876 ?auto_160878 ) ) ( not ( = ?auto_160876 ?auto_160879 ) ) ( not ( = ?auto_160876 ?auto_160880 ) ) ( not ( = ?auto_160876 ?auto_160881 ) ) ( not ( = ?auto_160877 ?auto_160878 ) ) ( not ( = ?auto_160877 ?auto_160879 ) ) ( not ( = ?auto_160877 ?auto_160880 ) ) ( not ( = ?auto_160877 ?auto_160881 ) ) ( not ( = ?auto_160878 ?auto_160879 ) ) ( not ( = ?auto_160878 ?auto_160880 ) ) ( not ( = ?auto_160878 ?auto_160881 ) ) ( not ( = ?auto_160879 ?auto_160880 ) ) ( not ( = ?auto_160879 ?auto_160881 ) ) ( not ( = ?auto_160880 ?auto_160881 ) ) ( ON ?auto_160879 ?auto_160880 ) ( ON ?auto_160878 ?auto_160879 ) ( ON ?auto_160877 ?auto_160878 ) ( ON ?auto_160876 ?auto_160877 ) ( ON ?auto_160875 ?auto_160876 ) ( CLEAR ?auto_160873 ) ( ON ?auto_160874 ?auto_160875 ) ( CLEAR ?auto_160874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160869 ?auto_160870 ?auto_160871 ?auto_160872 ?auto_160873 ?auto_160874 )
      ( MAKE-12PILE ?auto_160869 ?auto_160870 ?auto_160871 ?auto_160872 ?auto_160873 ?auto_160874 ?auto_160875 ?auto_160876 ?auto_160877 ?auto_160878 ?auto_160879 ?auto_160880 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160894 - BLOCK
      ?auto_160895 - BLOCK
      ?auto_160896 - BLOCK
      ?auto_160897 - BLOCK
      ?auto_160898 - BLOCK
      ?auto_160899 - BLOCK
      ?auto_160900 - BLOCK
      ?auto_160901 - BLOCK
      ?auto_160902 - BLOCK
      ?auto_160903 - BLOCK
      ?auto_160904 - BLOCK
      ?auto_160905 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160905 ) ( ON-TABLE ?auto_160894 ) ( ON ?auto_160895 ?auto_160894 ) ( ON ?auto_160896 ?auto_160895 ) ( ON ?auto_160897 ?auto_160896 ) ( ON ?auto_160898 ?auto_160897 ) ( not ( = ?auto_160894 ?auto_160895 ) ) ( not ( = ?auto_160894 ?auto_160896 ) ) ( not ( = ?auto_160894 ?auto_160897 ) ) ( not ( = ?auto_160894 ?auto_160898 ) ) ( not ( = ?auto_160894 ?auto_160899 ) ) ( not ( = ?auto_160894 ?auto_160900 ) ) ( not ( = ?auto_160894 ?auto_160901 ) ) ( not ( = ?auto_160894 ?auto_160902 ) ) ( not ( = ?auto_160894 ?auto_160903 ) ) ( not ( = ?auto_160894 ?auto_160904 ) ) ( not ( = ?auto_160894 ?auto_160905 ) ) ( not ( = ?auto_160895 ?auto_160896 ) ) ( not ( = ?auto_160895 ?auto_160897 ) ) ( not ( = ?auto_160895 ?auto_160898 ) ) ( not ( = ?auto_160895 ?auto_160899 ) ) ( not ( = ?auto_160895 ?auto_160900 ) ) ( not ( = ?auto_160895 ?auto_160901 ) ) ( not ( = ?auto_160895 ?auto_160902 ) ) ( not ( = ?auto_160895 ?auto_160903 ) ) ( not ( = ?auto_160895 ?auto_160904 ) ) ( not ( = ?auto_160895 ?auto_160905 ) ) ( not ( = ?auto_160896 ?auto_160897 ) ) ( not ( = ?auto_160896 ?auto_160898 ) ) ( not ( = ?auto_160896 ?auto_160899 ) ) ( not ( = ?auto_160896 ?auto_160900 ) ) ( not ( = ?auto_160896 ?auto_160901 ) ) ( not ( = ?auto_160896 ?auto_160902 ) ) ( not ( = ?auto_160896 ?auto_160903 ) ) ( not ( = ?auto_160896 ?auto_160904 ) ) ( not ( = ?auto_160896 ?auto_160905 ) ) ( not ( = ?auto_160897 ?auto_160898 ) ) ( not ( = ?auto_160897 ?auto_160899 ) ) ( not ( = ?auto_160897 ?auto_160900 ) ) ( not ( = ?auto_160897 ?auto_160901 ) ) ( not ( = ?auto_160897 ?auto_160902 ) ) ( not ( = ?auto_160897 ?auto_160903 ) ) ( not ( = ?auto_160897 ?auto_160904 ) ) ( not ( = ?auto_160897 ?auto_160905 ) ) ( not ( = ?auto_160898 ?auto_160899 ) ) ( not ( = ?auto_160898 ?auto_160900 ) ) ( not ( = ?auto_160898 ?auto_160901 ) ) ( not ( = ?auto_160898 ?auto_160902 ) ) ( not ( = ?auto_160898 ?auto_160903 ) ) ( not ( = ?auto_160898 ?auto_160904 ) ) ( not ( = ?auto_160898 ?auto_160905 ) ) ( not ( = ?auto_160899 ?auto_160900 ) ) ( not ( = ?auto_160899 ?auto_160901 ) ) ( not ( = ?auto_160899 ?auto_160902 ) ) ( not ( = ?auto_160899 ?auto_160903 ) ) ( not ( = ?auto_160899 ?auto_160904 ) ) ( not ( = ?auto_160899 ?auto_160905 ) ) ( not ( = ?auto_160900 ?auto_160901 ) ) ( not ( = ?auto_160900 ?auto_160902 ) ) ( not ( = ?auto_160900 ?auto_160903 ) ) ( not ( = ?auto_160900 ?auto_160904 ) ) ( not ( = ?auto_160900 ?auto_160905 ) ) ( not ( = ?auto_160901 ?auto_160902 ) ) ( not ( = ?auto_160901 ?auto_160903 ) ) ( not ( = ?auto_160901 ?auto_160904 ) ) ( not ( = ?auto_160901 ?auto_160905 ) ) ( not ( = ?auto_160902 ?auto_160903 ) ) ( not ( = ?auto_160902 ?auto_160904 ) ) ( not ( = ?auto_160902 ?auto_160905 ) ) ( not ( = ?auto_160903 ?auto_160904 ) ) ( not ( = ?auto_160903 ?auto_160905 ) ) ( not ( = ?auto_160904 ?auto_160905 ) ) ( ON ?auto_160904 ?auto_160905 ) ( ON ?auto_160903 ?auto_160904 ) ( ON ?auto_160902 ?auto_160903 ) ( ON ?auto_160901 ?auto_160902 ) ( ON ?auto_160900 ?auto_160901 ) ( CLEAR ?auto_160898 ) ( ON ?auto_160899 ?auto_160900 ) ( CLEAR ?auto_160899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160894 ?auto_160895 ?auto_160896 ?auto_160897 ?auto_160898 ?auto_160899 )
      ( MAKE-12PILE ?auto_160894 ?auto_160895 ?auto_160896 ?auto_160897 ?auto_160898 ?auto_160899 ?auto_160900 ?auto_160901 ?auto_160902 ?auto_160903 ?auto_160904 ?auto_160905 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160918 - BLOCK
      ?auto_160919 - BLOCK
      ?auto_160920 - BLOCK
      ?auto_160921 - BLOCK
      ?auto_160922 - BLOCK
      ?auto_160923 - BLOCK
      ?auto_160924 - BLOCK
      ?auto_160925 - BLOCK
      ?auto_160926 - BLOCK
      ?auto_160927 - BLOCK
      ?auto_160928 - BLOCK
      ?auto_160929 - BLOCK
    )
    :vars
    (
      ?auto_160930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160929 ?auto_160930 ) ( ON-TABLE ?auto_160918 ) ( ON ?auto_160919 ?auto_160918 ) ( ON ?auto_160920 ?auto_160919 ) ( ON ?auto_160921 ?auto_160920 ) ( not ( = ?auto_160918 ?auto_160919 ) ) ( not ( = ?auto_160918 ?auto_160920 ) ) ( not ( = ?auto_160918 ?auto_160921 ) ) ( not ( = ?auto_160918 ?auto_160922 ) ) ( not ( = ?auto_160918 ?auto_160923 ) ) ( not ( = ?auto_160918 ?auto_160924 ) ) ( not ( = ?auto_160918 ?auto_160925 ) ) ( not ( = ?auto_160918 ?auto_160926 ) ) ( not ( = ?auto_160918 ?auto_160927 ) ) ( not ( = ?auto_160918 ?auto_160928 ) ) ( not ( = ?auto_160918 ?auto_160929 ) ) ( not ( = ?auto_160918 ?auto_160930 ) ) ( not ( = ?auto_160919 ?auto_160920 ) ) ( not ( = ?auto_160919 ?auto_160921 ) ) ( not ( = ?auto_160919 ?auto_160922 ) ) ( not ( = ?auto_160919 ?auto_160923 ) ) ( not ( = ?auto_160919 ?auto_160924 ) ) ( not ( = ?auto_160919 ?auto_160925 ) ) ( not ( = ?auto_160919 ?auto_160926 ) ) ( not ( = ?auto_160919 ?auto_160927 ) ) ( not ( = ?auto_160919 ?auto_160928 ) ) ( not ( = ?auto_160919 ?auto_160929 ) ) ( not ( = ?auto_160919 ?auto_160930 ) ) ( not ( = ?auto_160920 ?auto_160921 ) ) ( not ( = ?auto_160920 ?auto_160922 ) ) ( not ( = ?auto_160920 ?auto_160923 ) ) ( not ( = ?auto_160920 ?auto_160924 ) ) ( not ( = ?auto_160920 ?auto_160925 ) ) ( not ( = ?auto_160920 ?auto_160926 ) ) ( not ( = ?auto_160920 ?auto_160927 ) ) ( not ( = ?auto_160920 ?auto_160928 ) ) ( not ( = ?auto_160920 ?auto_160929 ) ) ( not ( = ?auto_160920 ?auto_160930 ) ) ( not ( = ?auto_160921 ?auto_160922 ) ) ( not ( = ?auto_160921 ?auto_160923 ) ) ( not ( = ?auto_160921 ?auto_160924 ) ) ( not ( = ?auto_160921 ?auto_160925 ) ) ( not ( = ?auto_160921 ?auto_160926 ) ) ( not ( = ?auto_160921 ?auto_160927 ) ) ( not ( = ?auto_160921 ?auto_160928 ) ) ( not ( = ?auto_160921 ?auto_160929 ) ) ( not ( = ?auto_160921 ?auto_160930 ) ) ( not ( = ?auto_160922 ?auto_160923 ) ) ( not ( = ?auto_160922 ?auto_160924 ) ) ( not ( = ?auto_160922 ?auto_160925 ) ) ( not ( = ?auto_160922 ?auto_160926 ) ) ( not ( = ?auto_160922 ?auto_160927 ) ) ( not ( = ?auto_160922 ?auto_160928 ) ) ( not ( = ?auto_160922 ?auto_160929 ) ) ( not ( = ?auto_160922 ?auto_160930 ) ) ( not ( = ?auto_160923 ?auto_160924 ) ) ( not ( = ?auto_160923 ?auto_160925 ) ) ( not ( = ?auto_160923 ?auto_160926 ) ) ( not ( = ?auto_160923 ?auto_160927 ) ) ( not ( = ?auto_160923 ?auto_160928 ) ) ( not ( = ?auto_160923 ?auto_160929 ) ) ( not ( = ?auto_160923 ?auto_160930 ) ) ( not ( = ?auto_160924 ?auto_160925 ) ) ( not ( = ?auto_160924 ?auto_160926 ) ) ( not ( = ?auto_160924 ?auto_160927 ) ) ( not ( = ?auto_160924 ?auto_160928 ) ) ( not ( = ?auto_160924 ?auto_160929 ) ) ( not ( = ?auto_160924 ?auto_160930 ) ) ( not ( = ?auto_160925 ?auto_160926 ) ) ( not ( = ?auto_160925 ?auto_160927 ) ) ( not ( = ?auto_160925 ?auto_160928 ) ) ( not ( = ?auto_160925 ?auto_160929 ) ) ( not ( = ?auto_160925 ?auto_160930 ) ) ( not ( = ?auto_160926 ?auto_160927 ) ) ( not ( = ?auto_160926 ?auto_160928 ) ) ( not ( = ?auto_160926 ?auto_160929 ) ) ( not ( = ?auto_160926 ?auto_160930 ) ) ( not ( = ?auto_160927 ?auto_160928 ) ) ( not ( = ?auto_160927 ?auto_160929 ) ) ( not ( = ?auto_160927 ?auto_160930 ) ) ( not ( = ?auto_160928 ?auto_160929 ) ) ( not ( = ?auto_160928 ?auto_160930 ) ) ( not ( = ?auto_160929 ?auto_160930 ) ) ( ON ?auto_160928 ?auto_160929 ) ( ON ?auto_160927 ?auto_160928 ) ( ON ?auto_160926 ?auto_160927 ) ( ON ?auto_160925 ?auto_160926 ) ( ON ?auto_160924 ?auto_160925 ) ( ON ?auto_160923 ?auto_160924 ) ( CLEAR ?auto_160921 ) ( ON ?auto_160922 ?auto_160923 ) ( CLEAR ?auto_160922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160918 ?auto_160919 ?auto_160920 ?auto_160921 ?auto_160922 )
      ( MAKE-12PILE ?auto_160918 ?auto_160919 ?auto_160920 ?auto_160921 ?auto_160922 ?auto_160923 ?auto_160924 ?auto_160925 ?auto_160926 ?auto_160927 ?auto_160928 ?auto_160929 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160943 - BLOCK
      ?auto_160944 - BLOCK
      ?auto_160945 - BLOCK
      ?auto_160946 - BLOCK
      ?auto_160947 - BLOCK
      ?auto_160948 - BLOCK
      ?auto_160949 - BLOCK
      ?auto_160950 - BLOCK
      ?auto_160951 - BLOCK
      ?auto_160952 - BLOCK
      ?auto_160953 - BLOCK
      ?auto_160954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160954 ) ( ON-TABLE ?auto_160943 ) ( ON ?auto_160944 ?auto_160943 ) ( ON ?auto_160945 ?auto_160944 ) ( ON ?auto_160946 ?auto_160945 ) ( not ( = ?auto_160943 ?auto_160944 ) ) ( not ( = ?auto_160943 ?auto_160945 ) ) ( not ( = ?auto_160943 ?auto_160946 ) ) ( not ( = ?auto_160943 ?auto_160947 ) ) ( not ( = ?auto_160943 ?auto_160948 ) ) ( not ( = ?auto_160943 ?auto_160949 ) ) ( not ( = ?auto_160943 ?auto_160950 ) ) ( not ( = ?auto_160943 ?auto_160951 ) ) ( not ( = ?auto_160943 ?auto_160952 ) ) ( not ( = ?auto_160943 ?auto_160953 ) ) ( not ( = ?auto_160943 ?auto_160954 ) ) ( not ( = ?auto_160944 ?auto_160945 ) ) ( not ( = ?auto_160944 ?auto_160946 ) ) ( not ( = ?auto_160944 ?auto_160947 ) ) ( not ( = ?auto_160944 ?auto_160948 ) ) ( not ( = ?auto_160944 ?auto_160949 ) ) ( not ( = ?auto_160944 ?auto_160950 ) ) ( not ( = ?auto_160944 ?auto_160951 ) ) ( not ( = ?auto_160944 ?auto_160952 ) ) ( not ( = ?auto_160944 ?auto_160953 ) ) ( not ( = ?auto_160944 ?auto_160954 ) ) ( not ( = ?auto_160945 ?auto_160946 ) ) ( not ( = ?auto_160945 ?auto_160947 ) ) ( not ( = ?auto_160945 ?auto_160948 ) ) ( not ( = ?auto_160945 ?auto_160949 ) ) ( not ( = ?auto_160945 ?auto_160950 ) ) ( not ( = ?auto_160945 ?auto_160951 ) ) ( not ( = ?auto_160945 ?auto_160952 ) ) ( not ( = ?auto_160945 ?auto_160953 ) ) ( not ( = ?auto_160945 ?auto_160954 ) ) ( not ( = ?auto_160946 ?auto_160947 ) ) ( not ( = ?auto_160946 ?auto_160948 ) ) ( not ( = ?auto_160946 ?auto_160949 ) ) ( not ( = ?auto_160946 ?auto_160950 ) ) ( not ( = ?auto_160946 ?auto_160951 ) ) ( not ( = ?auto_160946 ?auto_160952 ) ) ( not ( = ?auto_160946 ?auto_160953 ) ) ( not ( = ?auto_160946 ?auto_160954 ) ) ( not ( = ?auto_160947 ?auto_160948 ) ) ( not ( = ?auto_160947 ?auto_160949 ) ) ( not ( = ?auto_160947 ?auto_160950 ) ) ( not ( = ?auto_160947 ?auto_160951 ) ) ( not ( = ?auto_160947 ?auto_160952 ) ) ( not ( = ?auto_160947 ?auto_160953 ) ) ( not ( = ?auto_160947 ?auto_160954 ) ) ( not ( = ?auto_160948 ?auto_160949 ) ) ( not ( = ?auto_160948 ?auto_160950 ) ) ( not ( = ?auto_160948 ?auto_160951 ) ) ( not ( = ?auto_160948 ?auto_160952 ) ) ( not ( = ?auto_160948 ?auto_160953 ) ) ( not ( = ?auto_160948 ?auto_160954 ) ) ( not ( = ?auto_160949 ?auto_160950 ) ) ( not ( = ?auto_160949 ?auto_160951 ) ) ( not ( = ?auto_160949 ?auto_160952 ) ) ( not ( = ?auto_160949 ?auto_160953 ) ) ( not ( = ?auto_160949 ?auto_160954 ) ) ( not ( = ?auto_160950 ?auto_160951 ) ) ( not ( = ?auto_160950 ?auto_160952 ) ) ( not ( = ?auto_160950 ?auto_160953 ) ) ( not ( = ?auto_160950 ?auto_160954 ) ) ( not ( = ?auto_160951 ?auto_160952 ) ) ( not ( = ?auto_160951 ?auto_160953 ) ) ( not ( = ?auto_160951 ?auto_160954 ) ) ( not ( = ?auto_160952 ?auto_160953 ) ) ( not ( = ?auto_160952 ?auto_160954 ) ) ( not ( = ?auto_160953 ?auto_160954 ) ) ( ON ?auto_160953 ?auto_160954 ) ( ON ?auto_160952 ?auto_160953 ) ( ON ?auto_160951 ?auto_160952 ) ( ON ?auto_160950 ?auto_160951 ) ( ON ?auto_160949 ?auto_160950 ) ( ON ?auto_160948 ?auto_160949 ) ( CLEAR ?auto_160946 ) ( ON ?auto_160947 ?auto_160948 ) ( CLEAR ?auto_160947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160943 ?auto_160944 ?auto_160945 ?auto_160946 ?auto_160947 )
      ( MAKE-12PILE ?auto_160943 ?auto_160944 ?auto_160945 ?auto_160946 ?auto_160947 ?auto_160948 ?auto_160949 ?auto_160950 ?auto_160951 ?auto_160952 ?auto_160953 ?auto_160954 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160967 - BLOCK
      ?auto_160968 - BLOCK
      ?auto_160969 - BLOCK
      ?auto_160970 - BLOCK
      ?auto_160971 - BLOCK
      ?auto_160972 - BLOCK
      ?auto_160973 - BLOCK
      ?auto_160974 - BLOCK
      ?auto_160975 - BLOCK
      ?auto_160976 - BLOCK
      ?auto_160977 - BLOCK
      ?auto_160978 - BLOCK
    )
    :vars
    (
      ?auto_160979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160978 ?auto_160979 ) ( ON-TABLE ?auto_160967 ) ( ON ?auto_160968 ?auto_160967 ) ( ON ?auto_160969 ?auto_160968 ) ( not ( = ?auto_160967 ?auto_160968 ) ) ( not ( = ?auto_160967 ?auto_160969 ) ) ( not ( = ?auto_160967 ?auto_160970 ) ) ( not ( = ?auto_160967 ?auto_160971 ) ) ( not ( = ?auto_160967 ?auto_160972 ) ) ( not ( = ?auto_160967 ?auto_160973 ) ) ( not ( = ?auto_160967 ?auto_160974 ) ) ( not ( = ?auto_160967 ?auto_160975 ) ) ( not ( = ?auto_160967 ?auto_160976 ) ) ( not ( = ?auto_160967 ?auto_160977 ) ) ( not ( = ?auto_160967 ?auto_160978 ) ) ( not ( = ?auto_160967 ?auto_160979 ) ) ( not ( = ?auto_160968 ?auto_160969 ) ) ( not ( = ?auto_160968 ?auto_160970 ) ) ( not ( = ?auto_160968 ?auto_160971 ) ) ( not ( = ?auto_160968 ?auto_160972 ) ) ( not ( = ?auto_160968 ?auto_160973 ) ) ( not ( = ?auto_160968 ?auto_160974 ) ) ( not ( = ?auto_160968 ?auto_160975 ) ) ( not ( = ?auto_160968 ?auto_160976 ) ) ( not ( = ?auto_160968 ?auto_160977 ) ) ( not ( = ?auto_160968 ?auto_160978 ) ) ( not ( = ?auto_160968 ?auto_160979 ) ) ( not ( = ?auto_160969 ?auto_160970 ) ) ( not ( = ?auto_160969 ?auto_160971 ) ) ( not ( = ?auto_160969 ?auto_160972 ) ) ( not ( = ?auto_160969 ?auto_160973 ) ) ( not ( = ?auto_160969 ?auto_160974 ) ) ( not ( = ?auto_160969 ?auto_160975 ) ) ( not ( = ?auto_160969 ?auto_160976 ) ) ( not ( = ?auto_160969 ?auto_160977 ) ) ( not ( = ?auto_160969 ?auto_160978 ) ) ( not ( = ?auto_160969 ?auto_160979 ) ) ( not ( = ?auto_160970 ?auto_160971 ) ) ( not ( = ?auto_160970 ?auto_160972 ) ) ( not ( = ?auto_160970 ?auto_160973 ) ) ( not ( = ?auto_160970 ?auto_160974 ) ) ( not ( = ?auto_160970 ?auto_160975 ) ) ( not ( = ?auto_160970 ?auto_160976 ) ) ( not ( = ?auto_160970 ?auto_160977 ) ) ( not ( = ?auto_160970 ?auto_160978 ) ) ( not ( = ?auto_160970 ?auto_160979 ) ) ( not ( = ?auto_160971 ?auto_160972 ) ) ( not ( = ?auto_160971 ?auto_160973 ) ) ( not ( = ?auto_160971 ?auto_160974 ) ) ( not ( = ?auto_160971 ?auto_160975 ) ) ( not ( = ?auto_160971 ?auto_160976 ) ) ( not ( = ?auto_160971 ?auto_160977 ) ) ( not ( = ?auto_160971 ?auto_160978 ) ) ( not ( = ?auto_160971 ?auto_160979 ) ) ( not ( = ?auto_160972 ?auto_160973 ) ) ( not ( = ?auto_160972 ?auto_160974 ) ) ( not ( = ?auto_160972 ?auto_160975 ) ) ( not ( = ?auto_160972 ?auto_160976 ) ) ( not ( = ?auto_160972 ?auto_160977 ) ) ( not ( = ?auto_160972 ?auto_160978 ) ) ( not ( = ?auto_160972 ?auto_160979 ) ) ( not ( = ?auto_160973 ?auto_160974 ) ) ( not ( = ?auto_160973 ?auto_160975 ) ) ( not ( = ?auto_160973 ?auto_160976 ) ) ( not ( = ?auto_160973 ?auto_160977 ) ) ( not ( = ?auto_160973 ?auto_160978 ) ) ( not ( = ?auto_160973 ?auto_160979 ) ) ( not ( = ?auto_160974 ?auto_160975 ) ) ( not ( = ?auto_160974 ?auto_160976 ) ) ( not ( = ?auto_160974 ?auto_160977 ) ) ( not ( = ?auto_160974 ?auto_160978 ) ) ( not ( = ?auto_160974 ?auto_160979 ) ) ( not ( = ?auto_160975 ?auto_160976 ) ) ( not ( = ?auto_160975 ?auto_160977 ) ) ( not ( = ?auto_160975 ?auto_160978 ) ) ( not ( = ?auto_160975 ?auto_160979 ) ) ( not ( = ?auto_160976 ?auto_160977 ) ) ( not ( = ?auto_160976 ?auto_160978 ) ) ( not ( = ?auto_160976 ?auto_160979 ) ) ( not ( = ?auto_160977 ?auto_160978 ) ) ( not ( = ?auto_160977 ?auto_160979 ) ) ( not ( = ?auto_160978 ?auto_160979 ) ) ( ON ?auto_160977 ?auto_160978 ) ( ON ?auto_160976 ?auto_160977 ) ( ON ?auto_160975 ?auto_160976 ) ( ON ?auto_160974 ?auto_160975 ) ( ON ?auto_160973 ?auto_160974 ) ( ON ?auto_160972 ?auto_160973 ) ( ON ?auto_160971 ?auto_160972 ) ( CLEAR ?auto_160969 ) ( ON ?auto_160970 ?auto_160971 ) ( CLEAR ?auto_160970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160967 ?auto_160968 ?auto_160969 ?auto_160970 )
      ( MAKE-12PILE ?auto_160967 ?auto_160968 ?auto_160969 ?auto_160970 ?auto_160971 ?auto_160972 ?auto_160973 ?auto_160974 ?auto_160975 ?auto_160976 ?auto_160977 ?auto_160978 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_160992 - BLOCK
      ?auto_160993 - BLOCK
      ?auto_160994 - BLOCK
      ?auto_160995 - BLOCK
      ?auto_160996 - BLOCK
      ?auto_160997 - BLOCK
      ?auto_160998 - BLOCK
      ?auto_160999 - BLOCK
      ?auto_161000 - BLOCK
      ?auto_161001 - BLOCK
      ?auto_161002 - BLOCK
      ?auto_161003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161003 ) ( ON-TABLE ?auto_160992 ) ( ON ?auto_160993 ?auto_160992 ) ( ON ?auto_160994 ?auto_160993 ) ( not ( = ?auto_160992 ?auto_160993 ) ) ( not ( = ?auto_160992 ?auto_160994 ) ) ( not ( = ?auto_160992 ?auto_160995 ) ) ( not ( = ?auto_160992 ?auto_160996 ) ) ( not ( = ?auto_160992 ?auto_160997 ) ) ( not ( = ?auto_160992 ?auto_160998 ) ) ( not ( = ?auto_160992 ?auto_160999 ) ) ( not ( = ?auto_160992 ?auto_161000 ) ) ( not ( = ?auto_160992 ?auto_161001 ) ) ( not ( = ?auto_160992 ?auto_161002 ) ) ( not ( = ?auto_160992 ?auto_161003 ) ) ( not ( = ?auto_160993 ?auto_160994 ) ) ( not ( = ?auto_160993 ?auto_160995 ) ) ( not ( = ?auto_160993 ?auto_160996 ) ) ( not ( = ?auto_160993 ?auto_160997 ) ) ( not ( = ?auto_160993 ?auto_160998 ) ) ( not ( = ?auto_160993 ?auto_160999 ) ) ( not ( = ?auto_160993 ?auto_161000 ) ) ( not ( = ?auto_160993 ?auto_161001 ) ) ( not ( = ?auto_160993 ?auto_161002 ) ) ( not ( = ?auto_160993 ?auto_161003 ) ) ( not ( = ?auto_160994 ?auto_160995 ) ) ( not ( = ?auto_160994 ?auto_160996 ) ) ( not ( = ?auto_160994 ?auto_160997 ) ) ( not ( = ?auto_160994 ?auto_160998 ) ) ( not ( = ?auto_160994 ?auto_160999 ) ) ( not ( = ?auto_160994 ?auto_161000 ) ) ( not ( = ?auto_160994 ?auto_161001 ) ) ( not ( = ?auto_160994 ?auto_161002 ) ) ( not ( = ?auto_160994 ?auto_161003 ) ) ( not ( = ?auto_160995 ?auto_160996 ) ) ( not ( = ?auto_160995 ?auto_160997 ) ) ( not ( = ?auto_160995 ?auto_160998 ) ) ( not ( = ?auto_160995 ?auto_160999 ) ) ( not ( = ?auto_160995 ?auto_161000 ) ) ( not ( = ?auto_160995 ?auto_161001 ) ) ( not ( = ?auto_160995 ?auto_161002 ) ) ( not ( = ?auto_160995 ?auto_161003 ) ) ( not ( = ?auto_160996 ?auto_160997 ) ) ( not ( = ?auto_160996 ?auto_160998 ) ) ( not ( = ?auto_160996 ?auto_160999 ) ) ( not ( = ?auto_160996 ?auto_161000 ) ) ( not ( = ?auto_160996 ?auto_161001 ) ) ( not ( = ?auto_160996 ?auto_161002 ) ) ( not ( = ?auto_160996 ?auto_161003 ) ) ( not ( = ?auto_160997 ?auto_160998 ) ) ( not ( = ?auto_160997 ?auto_160999 ) ) ( not ( = ?auto_160997 ?auto_161000 ) ) ( not ( = ?auto_160997 ?auto_161001 ) ) ( not ( = ?auto_160997 ?auto_161002 ) ) ( not ( = ?auto_160997 ?auto_161003 ) ) ( not ( = ?auto_160998 ?auto_160999 ) ) ( not ( = ?auto_160998 ?auto_161000 ) ) ( not ( = ?auto_160998 ?auto_161001 ) ) ( not ( = ?auto_160998 ?auto_161002 ) ) ( not ( = ?auto_160998 ?auto_161003 ) ) ( not ( = ?auto_160999 ?auto_161000 ) ) ( not ( = ?auto_160999 ?auto_161001 ) ) ( not ( = ?auto_160999 ?auto_161002 ) ) ( not ( = ?auto_160999 ?auto_161003 ) ) ( not ( = ?auto_161000 ?auto_161001 ) ) ( not ( = ?auto_161000 ?auto_161002 ) ) ( not ( = ?auto_161000 ?auto_161003 ) ) ( not ( = ?auto_161001 ?auto_161002 ) ) ( not ( = ?auto_161001 ?auto_161003 ) ) ( not ( = ?auto_161002 ?auto_161003 ) ) ( ON ?auto_161002 ?auto_161003 ) ( ON ?auto_161001 ?auto_161002 ) ( ON ?auto_161000 ?auto_161001 ) ( ON ?auto_160999 ?auto_161000 ) ( ON ?auto_160998 ?auto_160999 ) ( ON ?auto_160997 ?auto_160998 ) ( ON ?auto_160996 ?auto_160997 ) ( CLEAR ?auto_160994 ) ( ON ?auto_160995 ?auto_160996 ) ( CLEAR ?auto_160995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160992 ?auto_160993 ?auto_160994 ?auto_160995 )
      ( MAKE-12PILE ?auto_160992 ?auto_160993 ?auto_160994 ?auto_160995 ?auto_160996 ?auto_160997 ?auto_160998 ?auto_160999 ?auto_161000 ?auto_161001 ?auto_161002 ?auto_161003 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_161016 - BLOCK
      ?auto_161017 - BLOCK
      ?auto_161018 - BLOCK
      ?auto_161019 - BLOCK
      ?auto_161020 - BLOCK
      ?auto_161021 - BLOCK
      ?auto_161022 - BLOCK
      ?auto_161023 - BLOCK
      ?auto_161024 - BLOCK
      ?auto_161025 - BLOCK
      ?auto_161026 - BLOCK
      ?auto_161027 - BLOCK
    )
    :vars
    (
      ?auto_161028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161027 ?auto_161028 ) ( ON-TABLE ?auto_161016 ) ( ON ?auto_161017 ?auto_161016 ) ( not ( = ?auto_161016 ?auto_161017 ) ) ( not ( = ?auto_161016 ?auto_161018 ) ) ( not ( = ?auto_161016 ?auto_161019 ) ) ( not ( = ?auto_161016 ?auto_161020 ) ) ( not ( = ?auto_161016 ?auto_161021 ) ) ( not ( = ?auto_161016 ?auto_161022 ) ) ( not ( = ?auto_161016 ?auto_161023 ) ) ( not ( = ?auto_161016 ?auto_161024 ) ) ( not ( = ?auto_161016 ?auto_161025 ) ) ( not ( = ?auto_161016 ?auto_161026 ) ) ( not ( = ?auto_161016 ?auto_161027 ) ) ( not ( = ?auto_161016 ?auto_161028 ) ) ( not ( = ?auto_161017 ?auto_161018 ) ) ( not ( = ?auto_161017 ?auto_161019 ) ) ( not ( = ?auto_161017 ?auto_161020 ) ) ( not ( = ?auto_161017 ?auto_161021 ) ) ( not ( = ?auto_161017 ?auto_161022 ) ) ( not ( = ?auto_161017 ?auto_161023 ) ) ( not ( = ?auto_161017 ?auto_161024 ) ) ( not ( = ?auto_161017 ?auto_161025 ) ) ( not ( = ?auto_161017 ?auto_161026 ) ) ( not ( = ?auto_161017 ?auto_161027 ) ) ( not ( = ?auto_161017 ?auto_161028 ) ) ( not ( = ?auto_161018 ?auto_161019 ) ) ( not ( = ?auto_161018 ?auto_161020 ) ) ( not ( = ?auto_161018 ?auto_161021 ) ) ( not ( = ?auto_161018 ?auto_161022 ) ) ( not ( = ?auto_161018 ?auto_161023 ) ) ( not ( = ?auto_161018 ?auto_161024 ) ) ( not ( = ?auto_161018 ?auto_161025 ) ) ( not ( = ?auto_161018 ?auto_161026 ) ) ( not ( = ?auto_161018 ?auto_161027 ) ) ( not ( = ?auto_161018 ?auto_161028 ) ) ( not ( = ?auto_161019 ?auto_161020 ) ) ( not ( = ?auto_161019 ?auto_161021 ) ) ( not ( = ?auto_161019 ?auto_161022 ) ) ( not ( = ?auto_161019 ?auto_161023 ) ) ( not ( = ?auto_161019 ?auto_161024 ) ) ( not ( = ?auto_161019 ?auto_161025 ) ) ( not ( = ?auto_161019 ?auto_161026 ) ) ( not ( = ?auto_161019 ?auto_161027 ) ) ( not ( = ?auto_161019 ?auto_161028 ) ) ( not ( = ?auto_161020 ?auto_161021 ) ) ( not ( = ?auto_161020 ?auto_161022 ) ) ( not ( = ?auto_161020 ?auto_161023 ) ) ( not ( = ?auto_161020 ?auto_161024 ) ) ( not ( = ?auto_161020 ?auto_161025 ) ) ( not ( = ?auto_161020 ?auto_161026 ) ) ( not ( = ?auto_161020 ?auto_161027 ) ) ( not ( = ?auto_161020 ?auto_161028 ) ) ( not ( = ?auto_161021 ?auto_161022 ) ) ( not ( = ?auto_161021 ?auto_161023 ) ) ( not ( = ?auto_161021 ?auto_161024 ) ) ( not ( = ?auto_161021 ?auto_161025 ) ) ( not ( = ?auto_161021 ?auto_161026 ) ) ( not ( = ?auto_161021 ?auto_161027 ) ) ( not ( = ?auto_161021 ?auto_161028 ) ) ( not ( = ?auto_161022 ?auto_161023 ) ) ( not ( = ?auto_161022 ?auto_161024 ) ) ( not ( = ?auto_161022 ?auto_161025 ) ) ( not ( = ?auto_161022 ?auto_161026 ) ) ( not ( = ?auto_161022 ?auto_161027 ) ) ( not ( = ?auto_161022 ?auto_161028 ) ) ( not ( = ?auto_161023 ?auto_161024 ) ) ( not ( = ?auto_161023 ?auto_161025 ) ) ( not ( = ?auto_161023 ?auto_161026 ) ) ( not ( = ?auto_161023 ?auto_161027 ) ) ( not ( = ?auto_161023 ?auto_161028 ) ) ( not ( = ?auto_161024 ?auto_161025 ) ) ( not ( = ?auto_161024 ?auto_161026 ) ) ( not ( = ?auto_161024 ?auto_161027 ) ) ( not ( = ?auto_161024 ?auto_161028 ) ) ( not ( = ?auto_161025 ?auto_161026 ) ) ( not ( = ?auto_161025 ?auto_161027 ) ) ( not ( = ?auto_161025 ?auto_161028 ) ) ( not ( = ?auto_161026 ?auto_161027 ) ) ( not ( = ?auto_161026 ?auto_161028 ) ) ( not ( = ?auto_161027 ?auto_161028 ) ) ( ON ?auto_161026 ?auto_161027 ) ( ON ?auto_161025 ?auto_161026 ) ( ON ?auto_161024 ?auto_161025 ) ( ON ?auto_161023 ?auto_161024 ) ( ON ?auto_161022 ?auto_161023 ) ( ON ?auto_161021 ?auto_161022 ) ( ON ?auto_161020 ?auto_161021 ) ( ON ?auto_161019 ?auto_161020 ) ( CLEAR ?auto_161017 ) ( ON ?auto_161018 ?auto_161019 ) ( CLEAR ?auto_161018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161016 ?auto_161017 ?auto_161018 )
      ( MAKE-12PILE ?auto_161016 ?auto_161017 ?auto_161018 ?auto_161019 ?auto_161020 ?auto_161021 ?auto_161022 ?auto_161023 ?auto_161024 ?auto_161025 ?auto_161026 ?auto_161027 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_161041 - BLOCK
      ?auto_161042 - BLOCK
      ?auto_161043 - BLOCK
      ?auto_161044 - BLOCK
      ?auto_161045 - BLOCK
      ?auto_161046 - BLOCK
      ?auto_161047 - BLOCK
      ?auto_161048 - BLOCK
      ?auto_161049 - BLOCK
      ?auto_161050 - BLOCK
      ?auto_161051 - BLOCK
      ?auto_161052 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161052 ) ( ON-TABLE ?auto_161041 ) ( ON ?auto_161042 ?auto_161041 ) ( not ( = ?auto_161041 ?auto_161042 ) ) ( not ( = ?auto_161041 ?auto_161043 ) ) ( not ( = ?auto_161041 ?auto_161044 ) ) ( not ( = ?auto_161041 ?auto_161045 ) ) ( not ( = ?auto_161041 ?auto_161046 ) ) ( not ( = ?auto_161041 ?auto_161047 ) ) ( not ( = ?auto_161041 ?auto_161048 ) ) ( not ( = ?auto_161041 ?auto_161049 ) ) ( not ( = ?auto_161041 ?auto_161050 ) ) ( not ( = ?auto_161041 ?auto_161051 ) ) ( not ( = ?auto_161041 ?auto_161052 ) ) ( not ( = ?auto_161042 ?auto_161043 ) ) ( not ( = ?auto_161042 ?auto_161044 ) ) ( not ( = ?auto_161042 ?auto_161045 ) ) ( not ( = ?auto_161042 ?auto_161046 ) ) ( not ( = ?auto_161042 ?auto_161047 ) ) ( not ( = ?auto_161042 ?auto_161048 ) ) ( not ( = ?auto_161042 ?auto_161049 ) ) ( not ( = ?auto_161042 ?auto_161050 ) ) ( not ( = ?auto_161042 ?auto_161051 ) ) ( not ( = ?auto_161042 ?auto_161052 ) ) ( not ( = ?auto_161043 ?auto_161044 ) ) ( not ( = ?auto_161043 ?auto_161045 ) ) ( not ( = ?auto_161043 ?auto_161046 ) ) ( not ( = ?auto_161043 ?auto_161047 ) ) ( not ( = ?auto_161043 ?auto_161048 ) ) ( not ( = ?auto_161043 ?auto_161049 ) ) ( not ( = ?auto_161043 ?auto_161050 ) ) ( not ( = ?auto_161043 ?auto_161051 ) ) ( not ( = ?auto_161043 ?auto_161052 ) ) ( not ( = ?auto_161044 ?auto_161045 ) ) ( not ( = ?auto_161044 ?auto_161046 ) ) ( not ( = ?auto_161044 ?auto_161047 ) ) ( not ( = ?auto_161044 ?auto_161048 ) ) ( not ( = ?auto_161044 ?auto_161049 ) ) ( not ( = ?auto_161044 ?auto_161050 ) ) ( not ( = ?auto_161044 ?auto_161051 ) ) ( not ( = ?auto_161044 ?auto_161052 ) ) ( not ( = ?auto_161045 ?auto_161046 ) ) ( not ( = ?auto_161045 ?auto_161047 ) ) ( not ( = ?auto_161045 ?auto_161048 ) ) ( not ( = ?auto_161045 ?auto_161049 ) ) ( not ( = ?auto_161045 ?auto_161050 ) ) ( not ( = ?auto_161045 ?auto_161051 ) ) ( not ( = ?auto_161045 ?auto_161052 ) ) ( not ( = ?auto_161046 ?auto_161047 ) ) ( not ( = ?auto_161046 ?auto_161048 ) ) ( not ( = ?auto_161046 ?auto_161049 ) ) ( not ( = ?auto_161046 ?auto_161050 ) ) ( not ( = ?auto_161046 ?auto_161051 ) ) ( not ( = ?auto_161046 ?auto_161052 ) ) ( not ( = ?auto_161047 ?auto_161048 ) ) ( not ( = ?auto_161047 ?auto_161049 ) ) ( not ( = ?auto_161047 ?auto_161050 ) ) ( not ( = ?auto_161047 ?auto_161051 ) ) ( not ( = ?auto_161047 ?auto_161052 ) ) ( not ( = ?auto_161048 ?auto_161049 ) ) ( not ( = ?auto_161048 ?auto_161050 ) ) ( not ( = ?auto_161048 ?auto_161051 ) ) ( not ( = ?auto_161048 ?auto_161052 ) ) ( not ( = ?auto_161049 ?auto_161050 ) ) ( not ( = ?auto_161049 ?auto_161051 ) ) ( not ( = ?auto_161049 ?auto_161052 ) ) ( not ( = ?auto_161050 ?auto_161051 ) ) ( not ( = ?auto_161050 ?auto_161052 ) ) ( not ( = ?auto_161051 ?auto_161052 ) ) ( ON ?auto_161051 ?auto_161052 ) ( ON ?auto_161050 ?auto_161051 ) ( ON ?auto_161049 ?auto_161050 ) ( ON ?auto_161048 ?auto_161049 ) ( ON ?auto_161047 ?auto_161048 ) ( ON ?auto_161046 ?auto_161047 ) ( ON ?auto_161045 ?auto_161046 ) ( ON ?auto_161044 ?auto_161045 ) ( CLEAR ?auto_161042 ) ( ON ?auto_161043 ?auto_161044 ) ( CLEAR ?auto_161043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161041 ?auto_161042 ?auto_161043 )
      ( MAKE-12PILE ?auto_161041 ?auto_161042 ?auto_161043 ?auto_161044 ?auto_161045 ?auto_161046 ?auto_161047 ?auto_161048 ?auto_161049 ?auto_161050 ?auto_161051 ?auto_161052 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_161065 - BLOCK
      ?auto_161066 - BLOCK
      ?auto_161067 - BLOCK
      ?auto_161068 - BLOCK
      ?auto_161069 - BLOCK
      ?auto_161070 - BLOCK
      ?auto_161071 - BLOCK
      ?auto_161072 - BLOCK
      ?auto_161073 - BLOCK
      ?auto_161074 - BLOCK
      ?auto_161075 - BLOCK
      ?auto_161076 - BLOCK
    )
    :vars
    (
      ?auto_161077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161076 ?auto_161077 ) ( ON-TABLE ?auto_161065 ) ( not ( = ?auto_161065 ?auto_161066 ) ) ( not ( = ?auto_161065 ?auto_161067 ) ) ( not ( = ?auto_161065 ?auto_161068 ) ) ( not ( = ?auto_161065 ?auto_161069 ) ) ( not ( = ?auto_161065 ?auto_161070 ) ) ( not ( = ?auto_161065 ?auto_161071 ) ) ( not ( = ?auto_161065 ?auto_161072 ) ) ( not ( = ?auto_161065 ?auto_161073 ) ) ( not ( = ?auto_161065 ?auto_161074 ) ) ( not ( = ?auto_161065 ?auto_161075 ) ) ( not ( = ?auto_161065 ?auto_161076 ) ) ( not ( = ?auto_161065 ?auto_161077 ) ) ( not ( = ?auto_161066 ?auto_161067 ) ) ( not ( = ?auto_161066 ?auto_161068 ) ) ( not ( = ?auto_161066 ?auto_161069 ) ) ( not ( = ?auto_161066 ?auto_161070 ) ) ( not ( = ?auto_161066 ?auto_161071 ) ) ( not ( = ?auto_161066 ?auto_161072 ) ) ( not ( = ?auto_161066 ?auto_161073 ) ) ( not ( = ?auto_161066 ?auto_161074 ) ) ( not ( = ?auto_161066 ?auto_161075 ) ) ( not ( = ?auto_161066 ?auto_161076 ) ) ( not ( = ?auto_161066 ?auto_161077 ) ) ( not ( = ?auto_161067 ?auto_161068 ) ) ( not ( = ?auto_161067 ?auto_161069 ) ) ( not ( = ?auto_161067 ?auto_161070 ) ) ( not ( = ?auto_161067 ?auto_161071 ) ) ( not ( = ?auto_161067 ?auto_161072 ) ) ( not ( = ?auto_161067 ?auto_161073 ) ) ( not ( = ?auto_161067 ?auto_161074 ) ) ( not ( = ?auto_161067 ?auto_161075 ) ) ( not ( = ?auto_161067 ?auto_161076 ) ) ( not ( = ?auto_161067 ?auto_161077 ) ) ( not ( = ?auto_161068 ?auto_161069 ) ) ( not ( = ?auto_161068 ?auto_161070 ) ) ( not ( = ?auto_161068 ?auto_161071 ) ) ( not ( = ?auto_161068 ?auto_161072 ) ) ( not ( = ?auto_161068 ?auto_161073 ) ) ( not ( = ?auto_161068 ?auto_161074 ) ) ( not ( = ?auto_161068 ?auto_161075 ) ) ( not ( = ?auto_161068 ?auto_161076 ) ) ( not ( = ?auto_161068 ?auto_161077 ) ) ( not ( = ?auto_161069 ?auto_161070 ) ) ( not ( = ?auto_161069 ?auto_161071 ) ) ( not ( = ?auto_161069 ?auto_161072 ) ) ( not ( = ?auto_161069 ?auto_161073 ) ) ( not ( = ?auto_161069 ?auto_161074 ) ) ( not ( = ?auto_161069 ?auto_161075 ) ) ( not ( = ?auto_161069 ?auto_161076 ) ) ( not ( = ?auto_161069 ?auto_161077 ) ) ( not ( = ?auto_161070 ?auto_161071 ) ) ( not ( = ?auto_161070 ?auto_161072 ) ) ( not ( = ?auto_161070 ?auto_161073 ) ) ( not ( = ?auto_161070 ?auto_161074 ) ) ( not ( = ?auto_161070 ?auto_161075 ) ) ( not ( = ?auto_161070 ?auto_161076 ) ) ( not ( = ?auto_161070 ?auto_161077 ) ) ( not ( = ?auto_161071 ?auto_161072 ) ) ( not ( = ?auto_161071 ?auto_161073 ) ) ( not ( = ?auto_161071 ?auto_161074 ) ) ( not ( = ?auto_161071 ?auto_161075 ) ) ( not ( = ?auto_161071 ?auto_161076 ) ) ( not ( = ?auto_161071 ?auto_161077 ) ) ( not ( = ?auto_161072 ?auto_161073 ) ) ( not ( = ?auto_161072 ?auto_161074 ) ) ( not ( = ?auto_161072 ?auto_161075 ) ) ( not ( = ?auto_161072 ?auto_161076 ) ) ( not ( = ?auto_161072 ?auto_161077 ) ) ( not ( = ?auto_161073 ?auto_161074 ) ) ( not ( = ?auto_161073 ?auto_161075 ) ) ( not ( = ?auto_161073 ?auto_161076 ) ) ( not ( = ?auto_161073 ?auto_161077 ) ) ( not ( = ?auto_161074 ?auto_161075 ) ) ( not ( = ?auto_161074 ?auto_161076 ) ) ( not ( = ?auto_161074 ?auto_161077 ) ) ( not ( = ?auto_161075 ?auto_161076 ) ) ( not ( = ?auto_161075 ?auto_161077 ) ) ( not ( = ?auto_161076 ?auto_161077 ) ) ( ON ?auto_161075 ?auto_161076 ) ( ON ?auto_161074 ?auto_161075 ) ( ON ?auto_161073 ?auto_161074 ) ( ON ?auto_161072 ?auto_161073 ) ( ON ?auto_161071 ?auto_161072 ) ( ON ?auto_161070 ?auto_161071 ) ( ON ?auto_161069 ?auto_161070 ) ( ON ?auto_161068 ?auto_161069 ) ( ON ?auto_161067 ?auto_161068 ) ( CLEAR ?auto_161065 ) ( ON ?auto_161066 ?auto_161067 ) ( CLEAR ?auto_161066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161065 ?auto_161066 )
      ( MAKE-12PILE ?auto_161065 ?auto_161066 ?auto_161067 ?auto_161068 ?auto_161069 ?auto_161070 ?auto_161071 ?auto_161072 ?auto_161073 ?auto_161074 ?auto_161075 ?auto_161076 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_161090 - BLOCK
      ?auto_161091 - BLOCK
      ?auto_161092 - BLOCK
      ?auto_161093 - BLOCK
      ?auto_161094 - BLOCK
      ?auto_161095 - BLOCK
      ?auto_161096 - BLOCK
      ?auto_161097 - BLOCK
      ?auto_161098 - BLOCK
      ?auto_161099 - BLOCK
      ?auto_161100 - BLOCK
      ?auto_161101 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161101 ) ( ON-TABLE ?auto_161090 ) ( not ( = ?auto_161090 ?auto_161091 ) ) ( not ( = ?auto_161090 ?auto_161092 ) ) ( not ( = ?auto_161090 ?auto_161093 ) ) ( not ( = ?auto_161090 ?auto_161094 ) ) ( not ( = ?auto_161090 ?auto_161095 ) ) ( not ( = ?auto_161090 ?auto_161096 ) ) ( not ( = ?auto_161090 ?auto_161097 ) ) ( not ( = ?auto_161090 ?auto_161098 ) ) ( not ( = ?auto_161090 ?auto_161099 ) ) ( not ( = ?auto_161090 ?auto_161100 ) ) ( not ( = ?auto_161090 ?auto_161101 ) ) ( not ( = ?auto_161091 ?auto_161092 ) ) ( not ( = ?auto_161091 ?auto_161093 ) ) ( not ( = ?auto_161091 ?auto_161094 ) ) ( not ( = ?auto_161091 ?auto_161095 ) ) ( not ( = ?auto_161091 ?auto_161096 ) ) ( not ( = ?auto_161091 ?auto_161097 ) ) ( not ( = ?auto_161091 ?auto_161098 ) ) ( not ( = ?auto_161091 ?auto_161099 ) ) ( not ( = ?auto_161091 ?auto_161100 ) ) ( not ( = ?auto_161091 ?auto_161101 ) ) ( not ( = ?auto_161092 ?auto_161093 ) ) ( not ( = ?auto_161092 ?auto_161094 ) ) ( not ( = ?auto_161092 ?auto_161095 ) ) ( not ( = ?auto_161092 ?auto_161096 ) ) ( not ( = ?auto_161092 ?auto_161097 ) ) ( not ( = ?auto_161092 ?auto_161098 ) ) ( not ( = ?auto_161092 ?auto_161099 ) ) ( not ( = ?auto_161092 ?auto_161100 ) ) ( not ( = ?auto_161092 ?auto_161101 ) ) ( not ( = ?auto_161093 ?auto_161094 ) ) ( not ( = ?auto_161093 ?auto_161095 ) ) ( not ( = ?auto_161093 ?auto_161096 ) ) ( not ( = ?auto_161093 ?auto_161097 ) ) ( not ( = ?auto_161093 ?auto_161098 ) ) ( not ( = ?auto_161093 ?auto_161099 ) ) ( not ( = ?auto_161093 ?auto_161100 ) ) ( not ( = ?auto_161093 ?auto_161101 ) ) ( not ( = ?auto_161094 ?auto_161095 ) ) ( not ( = ?auto_161094 ?auto_161096 ) ) ( not ( = ?auto_161094 ?auto_161097 ) ) ( not ( = ?auto_161094 ?auto_161098 ) ) ( not ( = ?auto_161094 ?auto_161099 ) ) ( not ( = ?auto_161094 ?auto_161100 ) ) ( not ( = ?auto_161094 ?auto_161101 ) ) ( not ( = ?auto_161095 ?auto_161096 ) ) ( not ( = ?auto_161095 ?auto_161097 ) ) ( not ( = ?auto_161095 ?auto_161098 ) ) ( not ( = ?auto_161095 ?auto_161099 ) ) ( not ( = ?auto_161095 ?auto_161100 ) ) ( not ( = ?auto_161095 ?auto_161101 ) ) ( not ( = ?auto_161096 ?auto_161097 ) ) ( not ( = ?auto_161096 ?auto_161098 ) ) ( not ( = ?auto_161096 ?auto_161099 ) ) ( not ( = ?auto_161096 ?auto_161100 ) ) ( not ( = ?auto_161096 ?auto_161101 ) ) ( not ( = ?auto_161097 ?auto_161098 ) ) ( not ( = ?auto_161097 ?auto_161099 ) ) ( not ( = ?auto_161097 ?auto_161100 ) ) ( not ( = ?auto_161097 ?auto_161101 ) ) ( not ( = ?auto_161098 ?auto_161099 ) ) ( not ( = ?auto_161098 ?auto_161100 ) ) ( not ( = ?auto_161098 ?auto_161101 ) ) ( not ( = ?auto_161099 ?auto_161100 ) ) ( not ( = ?auto_161099 ?auto_161101 ) ) ( not ( = ?auto_161100 ?auto_161101 ) ) ( ON ?auto_161100 ?auto_161101 ) ( ON ?auto_161099 ?auto_161100 ) ( ON ?auto_161098 ?auto_161099 ) ( ON ?auto_161097 ?auto_161098 ) ( ON ?auto_161096 ?auto_161097 ) ( ON ?auto_161095 ?auto_161096 ) ( ON ?auto_161094 ?auto_161095 ) ( ON ?auto_161093 ?auto_161094 ) ( ON ?auto_161092 ?auto_161093 ) ( CLEAR ?auto_161090 ) ( ON ?auto_161091 ?auto_161092 ) ( CLEAR ?auto_161091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161090 ?auto_161091 )
      ( MAKE-12PILE ?auto_161090 ?auto_161091 ?auto_161092 ?auto_161093 ?auto_161094 ?auto_161095 ?auto_161096 ?auto_161097 ?auto_161098 ?auto_161099 ?auto_161100 ?auto_161101 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_161114 - BLOCK
      ?auto_161115 - BLOCK
      ?auto_161116 - BLOCK
      ?auto_161117 - BLOCK
      ?auto_161118 - BLOCK
      ?auto_161119 - BLOCK
      ?auto_161120 - BLOCK
      ?auto_161121 - BLOCK
      ?auto_161122 - BLOCK
      ?auto_161123 - BLOCK
      ?auto_161124 - BLOCK
      ?auto_161125 - BLOCK
    )
    :vars
    (
      ?auto_161126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161125 ?auto_161126 ) ( not ( = ?auto_161114 ?auto_161115 ) ) ( not ( = ?auto_161114 ?auto_161116 ) ) ( not ( = ?auto_161114 ?auto_161117 ) ) ( not ( = ?auto_161114 ?auto_161118 ) ) ( not ( = ?auto_161114 ?auto_161119 ) ) ( not ( = ?auto_161114 ?auto_161120 ) ) ( not ( = ?auto_161114 ?auto_161121 ) ) ( not ( = ?auto_161114 ?auto_161122 ) ) ( not ( = ?auto_161114 ?auto_161123 ) ) ( not ( = ?auto_161114 ?auto_161124 ) ) ( not ( = ?auto_161114 ?auto_161125 ) ) ( not ( = ?auto_161114 ?auto_161126 ) ) ( not ( = ?auto_161115 ?auto_161116 ) ) ( not ( = ?auto_161115 ?auto_161117 ) ) ( not ( = ?auto_161115 ?auto_161118 ) ) ( not ( = ?auto_161115 ?auto_161119 ) ) ( not ( = ?auto_161115 ?auto_161120 ) ) ( not ( = ?auto_161115 ?auto_161121 ) ) ( not ( = ?auto_161115 ?auto_161122 ) ) ( not ( = ?auto_161115 ?auto_161123 ) ) ( not ( = ?auto_161115 ?auto_161124 ) ) ( not ( = ?auto_161115 ?auto_161125 ) ) ( not ( = ?auto_161115 ?auto_161126 ) ) ( not ( = ?auto_161116 ?auto_161117 ) ) ( not ( = ?auto_161116 ?auto_161118 ) ) ( not ( = ?auto_161116 ?auto_161119 ) ) ( not ( = ?auto_161116 ?auto_161120 ) ) ( not ( = ?auto_161116 ?auto_161121 ) ) ( not ( = ?auto_161116 ?auto_161122 ) ) ( not ( = ?auto_161116 ?auto_161123 ) ) ( not ( = ?auto_161116 ?auto_161124 ) ) ( not ( = ?auto_161116 ?auto_161125 ) ) ( not ( = ?auto_161116 ?auto_161126 ) ) ( not ( = ?auto_161117 ?auto_161118 ) ) ( not ( = ?auto_161117 ?auto_161119 ) ) ( not ( = ?auto_161117 ?auto_161120 ) ) ( not ( = ?auto_161117 ?auto_161121 ) ) ( not ( = ?auto_161117 ?auto_161122 ) ) ( not ( = ?auto_161117 ?auto_161123 ) ) ( not ( = ?auto_161117 ?auto_161124 ) ) ( not ( = ?auto_161117 ?auto_161125 ) ) ( not ( = ?auto_161117 ?auto_161126 ) ) ( not ( = ?auto_161118 ?auto_161119 ) ) ( not ( = ?auto_161118 ?auto_161120 ) ) ( not ( = ?auto_161118 ?auto_161121 ) ) ( not ( = ?auto_161118 ?auto_161122 ) ) ( not ( = ?auto_161118 ?auto_161123 ) ) ( not ( = ?auto_161118 ?auto_161124 ) ) ( not ( = ?auto_161118 ?auto_161125 ) ) ( not ( = ?auto_161118 ?auto_161126 ) ) ( not ( = ?auto_161119 ?auto_161120 ) ) ( not ( = ?auto_161119 ?auto_161121 ) ) ( not ( = ?auto_161119 ?auto_161122 ) ) ( not ( = ?auto_161119 ?auto_161123 ) ) ( not ( = ?auto_161119 ?auto_161124 ) ) ( not ( = ?auto_161119 ?auto_161125 ) ) ( not ( = ?auto_161119 ?auto_161126 ) ) ( not ( = ?auto_161120 ?auto_161121 ) ) ( not ( = ?auto_161120 ?auto_161122 ) ) ( not ( = ?auto_161120 ?auto_161123 ) ) ( not ( = ?auto_161120 ?auto_161124 ) ) ( not ( = ?auto_161120 ?auto_161125 ) ) ( not ( = ?auto_161120 ?auto_161126 ) ) ( not ( = ?auto_161121 ?auto_161122 ) ) ( not ( = ?auto_161121 ?auto_161123 ) ) ( not ( = ?auto_161121 ?auto_161124 ) ) ( not ( = ?auto_161121 ?auto_161125 ) ) ( not ( = ?auto_161121 ?auto_161126 ) ) ( not ( = ?auto_161122 ?auto_161123 ) ) ( not ( = ?auto_161122 ?auto_161124 ) ) ( not ( = ?auto_161122 ?auto_161125 ) ) ( not ( = ?auto_161122 ?auto_161126 ) ) ( not ( = ?auto_161123 ?auto_161124 ) ) ( not ( = ?auto_161123 ?auto_161125 ) ) ( not ( = ?auto_161123 ?auto_161126 ) ) ( not ( = ?auto_161124 ?auto_161125 ) ) ( not ( = ?auto_161124 ?auto_161126 ) ) ( not ( = ?auto_161125 ?auto_161126 ) ) ( ON ?auto_161124 ?auto_161125 ) ( ON ?auto_161123 ?auto_161124 ) ( ON ?auto_161122 ?auto_161123 ) ( ON ?auto_161121 ?auto_161122 ) ( ON ?auto_161120 ?auto_161121 ) ( ON ?auto_161119 ?auto_161120 ) ( ON ?auto_161118 ?auto_161119 ) ( ON ?auto_161117 ?auto_161118 ) ( ON ?auto_161116 ?auto_161117 ) ( ON ?auto_161115 ?auto_161116 ) ( ON ?auto_161114 ?auto_161115 ) ( CLEAR ?auto_161114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161114 )
      ( MAKE-12PILE ?auto_161114 ?auto_161115 ?auto_161116 ?auto_161117 ?auto_161118 ?auto_161119 ?auto_161120 ?auto_161121 ?auto_161122 ?auto_161123 ?auto_161124 ?auto_161125 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_161139 - BLOCK
      ?auto_161140 - BLOCK
      ?auto_161141 - BLOCK
      ?auto_161142 - BLOCK
      ?auto_161143 - BLOCK
      ?auto_161144 - BLOCK
      ?auto_161145 - BLOCK
      ?auto_161146 - BLOCK
      ?auto_161147 - BLOCK
      ?auto_161148 - BLOCK
      ?auto_161149 - BLOCK
      ?auto_161150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161150 ) ( not ( = ?auto_161139 ?auto_161140 ) ) ( not ( = ?auto_161139 ?auto_161141 ) ) ( not ( = ?auto_161139 ?auto_161142 ) ) ( not ( = ?auto_161139 ?auto_161143 ) ) ( not ( = ?auto_161139 ?auto_161144 ) ) ( not ( = ?auto_161139 ?auto_161145 ) ) ( not ( = ?auto_161139 ?auto_161146 ) ) ( not ( = ?auto_161139 ?auto_161147 ) ) ( not ( = ?auto_161139 ?auto_161148 ) ) ( not ( = ?auto_161139 ?auto_161149 ) ) ( not ( = ?auto_161139 ?auto_161150 ) ) ( not ( = ?auto_161140 ?auto_161141 ) ) ( not ( = ?auto_161140 ?auto_161142 ) ) ( not ( = ?auto_161140 ?auto_161143 ) ) ( not ( = ?auto_161140 ?auto_161144 ) ) ( not ( = ?auto_161140 ?auto_161145 ) ) ( not ( = ?auto_161140 ?auto_161146 ) ) ( not ( = ?auto_161140 ?auto_161147 ) ) ( not ( = ?auto_161140 ?auto_161148 ) ) ( not ( = ?auto_161140 ?auto_161149 ) ) ( not ( = ?auto_161140 ?auto_161150 ) ) ( not ( = ?auto_161141 ?auto_161142 ) ) ( not ( = ?auto_161141 ?auto_161143 ) ) ( not ( = ?auto_161141 ?auto_161144 ) ) ( not ( = ?auto_161141 ?auto_161145 ) ) ( not ( = ?auto_161141 ?auto_161146 ) ) ( not ( = ?auto_161141 ?auto_161147 ) ) ( not ( = ?auto_161141 ?auto_161148 ) ) ( not ( = ?auto_161141 ?auto_161149 ) ) ( not ( = ?auto_161141 ?auto_161150 ) ) ( not ( = ?auto_161142 ?auto_161143 ) ) ( not ( = ?auto_161142 ?auto_161144 ) ) ( not ( = ?auto_161142 ?auto_161145 ) ) ( not ( = ?auto_161142 ?auto_161146 ) ) ( not ( = ?auto_161142 ?auto_161147 ) ) ( not ( = ?auto_161142 ?auto_161148 ) ) ( not ( = ?auto_161142 ?auto_161149 ) ) ( not ( = ?auto_161142 ?auto_161150 ) ) ( not ( = ?auto_161143 ?auto_161144 ) ) ( not ( = ?auto_161143 ?auto_161145 ) ) ( not ( = ?auto_161143 ?auto_161146 ) ) ( not ( = ?auto_161143 ?auto_161147 ) ) ( not ( = ?auto_161143 ?auto_161148 ) ) ( not ( = ?auto_161143 ?auto_161149 ) ) ( not ( = ?auto_161143 ?auto_161150 ) ) ( not ( = ?auto_161144 ?auto_161145 ) ) ( not ( = ?auto_161144 ?auto_161146 ) ) ( not ( = ?auto_161144 ?auto_161147 ) ) ( not ( = ?auto_161144 ?auto_161148 ) ) ( not ( = ?auto_161144 ?auto_161149 ) ) ( not ( = ?auto_161144 ?auto_161150 ) ) ( not ( = ?auto_161145 ?auto_161146 ) ) ( not ( = ?auto_161145 ?auto_161147 ) ) ( not ( = ?auto_161145 ?auto_161148 ) ) ( not ( = ?auto_161145 ?auto_161149 ) ) ( not ( = ?auto_161145 ?auto_161150 ) ) ( not ( = ?auto_161146 ?auto_161147 ) ) ( not ( = ?auto_161146 ?auto_161148 ) ) ( not ( = ?auto_161146 ?auto_161149 ) ) ( not ( = ?auto_161146 ?auto_161150 ) ) ( not ( = ?auto_161147 ?auto_161148 ) ) ( not ( = ?auto_161147 ?auto_161149 ) ) ( not ( = ?auto_161147 ?auto_161150 ) ) ( not ( = ?auto_161148 ?auto_161149 ) ) ( not ( = ?auto_161148 ?auto_161150 ) ) ( not ( = ?auto_161149 ?auto_161150 ) ) ( ON ?auto_161149 ?auto_161150 ) ( ON ?auto_161148 ?auto_161149 ) ( ON ?auto_161147 ?auto_161148 ) ( ON ?auto_161146 ?auto_161147 ) ( ON ?auto_161145 ?auto_161146 ) ( ON ?auto_161144 ?auto_161145 ) ( ON ?auto_161143 ?auto_161144 ) ( ON ?auto_161142 ?auto_161143 ) ( ON ?auto_161141 ?auto_161142 ) ( ON ?auto_161140 ?auto_161141 ) ( ON ?auto_161139 ?auto_161140 ) ( CLEAR ?auto_161139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161139 )
      ( MAKE-12PILE ?auto_161139 ?auto_161140 ?auto_161141 ?auto_161142 ?auto_161143 ?auto_161144 ?auto_161145 ?auto_161146 ?auto_161147 ?auto_161148 ?auto_161149 ?auto_161150 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_161163 - BLOCK
      ?auto_161164 - BLOCK
      ?auto_161165 - BLOCK
      ?auto_161166 - BLOCK
      ?auto_161167 - BLOCK
      ?auto_161168 - BLOCK
      ?auto_161169 - BLOCK
      ?auto_161170 - BLOCK
      ?auto_161171 - BLOCK
      ?auto_161172 - BLOCK
      ?auto_161173 - BLOCK
      ?auto_161174 - BLOCK
    )
    :vars
    (
      ?auto_161175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161163 ?auto_161164 ) ) ( not ( = ?auto_161163 ?auto_161165 ) ) ( not ( = ?auto_161163 ?auto_161166 ) ) ( not ( = ?auto_161163 ?auto_161167 ) ) ( not ( = ?auto_161163 ?auto_161168 ) ) ( not ( = ?auto_161163 ?auto_161169 ) ) ( not ( = ?auto_161163 ?auto_161170 ) ) ( not ( = ?auto_161163 ?auto_161171 ) ) ( not ( = ?auto_161163 ?auto_161172 ) ) ( not ( = ?auto_161163 ?auto_161173 ) ) ( not ( = ?auto_161163 ?auto_161174 ) ) ( not ( = ?auto_161164 ?auto_161165 ) ) ( not ( = ?auto_161164 ?auto_161166 ) ) ( not ( = ?auto_161164 ?auto_161167 ) ) ( not ( = ?auto_161164 ?auto_161168 ) ) ( not ( = ?auto_161164 ?auto_161169 ) ) ( not ( = ?auto_161164 ?auto_161170 ) ) ( not ( = ?auto_161164 ?auto_161171 ) ) ( not ( = ?auto_161164 ?auto_161172 ) ) ( not ( = ?auto_161164 ?auto_161173 ) ) ( not ( = ?auto_161164 ?auto_161174 ) ) ( not ( = ?auto_161165 ?auto_161166 ) ) ( not ( = ?auto_161165 ?auto_161167 ) ) ( not ( = ?auto_161165 ?auto_161168 ) ) ( not ( = ?auto_161165 ?auto_161169 ) ) ( not ( = ?auto_161165 ?auto_161170 ) ) ( not ( = ?auto_161165 ?auto_161171 ) ) ( not ( = ?auto_161165 ?auto_161172 ) ) ( not ( = ?auto_161165 ?auto_161173 ) ) ( not ( = ?auto_161165 ?auto_161174 ) ) ( not ( = ?auto_161166 ?auto_161167 ) ) ( not ( = ?auto_161166 ?auto_161168 ) ) ( not ( = ?auto_161166 ?auto_161169 ) ) ( not ( = ?auto_161166 ?auto_161170 ) ) ( not ( = ?auto_161166 ?auto_161171 ) ) ( not ( = ?auto_161166 ?auto_161172 ) ) ( not ( = ?auto_161166 ?auto_161173 ) ) ( not ( = ?auto_161166 ?auto_161174 ) ) ( not ( = ?auto_161167 ?auto_161168 ) ) ( not ( = ?auto_161167 ?auto_161169 ) ) ( not ( = ?auto_161167 ?auto_161170 ) ) ( not ( = ?auto_161167 ?auto_161171 ) ) ( not ( = ?auto_161167 ?auto_161172 ) ) ( not ( = ?auto_161167 ?auto_161173 ) ) ( not ( = ?auto_161167 ?auto_161174 ) ) ( not ( = ?auto_161168 ?auto_161169 ) ) ( not ( = ?auto_161168 ?auto_161170 ) ) ( not ( = ?auto_161168 ?auto_161171 ) ) ( not ( = ?auto_161168 ?auto_161172 ) ) ( not ( = ?auto_161168 ?auto_161173 ) ) ( not ( = ?auto_161168 ?auto_161174 ) ) ( not ( = ?auto_161169 ?auto_161170 ) ) ( not ( = ?auto_161169 ?auto_161171 ) ) ( not ( = ?auto_161169 ?auto_161172 ) ) ( not ( = ?auto_161169 ?auto_161173 ) ) ( not ( = ?auto_161169 ?auto_161174 ) ) ( not ( = ?auto_161170 ?auto_161171 ) ) ( not ( = ?auto_161170 ?auto_161172 ) ) ( not ( = ?auto_161170 ?auto_161173 ) ) ( not ( = ?auto_161170 ?auto_161174 ) ) ( not ( = ?auto_161171 ?auto_161172 ) ) ( not ( = ?auto_161171 ?auto_161173 ) ) ( not ( = ?auto_161171 ?auto_161174 ) ) ( not ( = ?auto_161172 ?auto_161173 ) ) ( not ( = ?auto_161172 ?auto_161174 ) ) ( not ( = ?auto_161173 ?auto_161174 ) ) ( ON ?auto_161163 ?auto_161175 ) ( not ( = ?auto_161174 ?auto_161175 ) ) ( not ( = ?auto_161173 ?auto_161175 ) ) ( not ( = ?auto_161172 ?auto_161175 ) ) ( not ( = ?auto_161171 ?auto_161175 ) ) ( not ( = ?auto_161170 ?auto_161175 ) ) ( not ( = ?auto_161169 ?auto_161175 ) ) ( not ( = ?auto_161168 ?auto_161175 ) ) ( not ( = ?auto_161167 ?auto_161175 ) ) ( not ( = ?auto_161166 ?auto_161175 ) ) ( not ( = ?auto_161165 ?auto_161175 ) ) ( not ( = ?auto_161164 ?auto_161175 ) ) ( not ( = ?auto_161163 ?auto_161175 ) ) ( ON ?auto_161164 ?auto_161163 ) ( ON ?auto_161165 ?auto_161164 ) ( ON ?auto_161166 ?auto_161165 ) ( ON ?auto_161167 ?auto_161166 ) ( ON ?auto_161168 ?auto_161167 ) ( ON ?auto_161169 ?auto_161168 ) ( ON ?auto_161170 ?auto_161169 ) ( ON ?auto_161171 ?auto_161170 ) ( ON ?auto_161172 ?auto_161171 ) ( ON ?auto_161173 ?auto_161172 ) ( ON ?auto_161174 ?auto_161173 ) ( CLEAR ?auto_161174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_161174 ?auto_161173 ?auto_161172 ?auto_161171 ?auto_161170 ?auto_161169 ?auto_161168 ?auto_161167 ?auto_161166 ?auto_161165 ?auto_161164 ?auto_161163 )
      ( MAKE-12PILE ?auto_161163 ?auto_161164 ?auto_161165 ?auto_161166 ?auto_161167 ?auto_161168 ?auto_161169 ?auto_161170 ?auto_161171 ?auto_161172 ?auto_161173 ?auto_161174 ) )
  )

)

