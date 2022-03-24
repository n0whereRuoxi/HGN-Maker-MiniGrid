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
      ?auto_10454 - BLOCK
    )
    :vars
    (
      ?auto_10455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10454 ?auto_10455 ) ( CLEAR ?auto_10454 ) ( HAND-EMPTY ) ( not ( = ?auto_10454 ?auto_10455 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10454 ?auto_10455 )
      ( !PUTDOWN ?auto_10454 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10461 - BLOCK
      ?auto_10462 - BLOCK
    )
    :vars
    (
      ?auto_10463 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10461 ) ( ON ?auto_10462 ?auto_10463 ) ( CLEAR ?auto_10462 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10461 ) ( not ( = ?auto_10461 ?auto_10462 ) ) ( not ( = ?auto_10461 ?auto_10463 ) ) ( not ( = ?auto_10462 ?auto_10463 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10462 ?auto_10463 )
      ( !STACK ?auto_10462 ?auto_10461 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10471 - BLOCK
      ?auto_10472 - BLOCK
    )
    :vars
    (
      ?auto_10473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10472 ?auto_10473 ) ( not ( = ?auto_10471 ?auto_10472 ) ) ( not ( = ?auto_10471 ?auto_10473 ) ) ( not ( = ?auto_10472 ?auto_10473 ) ) ( ON ?auto_10471 ?auto_10472 ) ( CLEAR ?auto_10471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10471 )
      ( MAKE-2PILE ?auto_10471 ?auto_10472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10482 - BLOCK
      ?auto_10483 - BLOCK
      ?auto_10484 - BLOCK
    )
    :vars
    (
      ?auto_10485 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10483 ) ( ON ?auto_10484 ?auto_10485 ) ( CLEAR ?auto_10484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10482 ) ( ON ?auto_10483 ?auto_10482 ) ( not ( = ?auto_10482 ?auto_10483 ) ) ( not ( = ?auto_10482 ?auto_10484 ) ) ( not ( = ?auto_10482 ?auto_10485 ) ) ( not ( = ?auto_10483 ?auto_10484 ) ) ( not ( = ?auto_10483 ?auto_10485 ) ) ( not ( = ?auto_10484 ?auto_10485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10484 ?auto_10485 )
      ( !STACK ?auto_10484 ?auto_10483 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10496 - BLOCK
      ?auto_10497 - BLOCK
      ?auto_10498 - BLOCK
    )
    :vars
    (
      ?auto_10499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10498 ?auto_10499 ) ( ON-TABLE ?auto_10496 ) ( not ( = ?auto_10496 ?auto_10497 ) ) ( not ( = ?auto_10496 ?auto_10498 ) ) ( not ( = ?auto_10496 ?auto_10499 ) ) ( not ( = ?auto_10497 ?auto_10498 ) ) ( not ( = ?auto_10497 ?auto_10499 ) ) ( not ( = ?auto_10498 ?auto_10499 ) ) ( CLEAR ?auto_10496 ) ( ON ?auto_10497 ?auto_10498 ) ( CLEAR ?auto_10497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10496 ?auto_10497 )
      ( MAKE-3PILE ?auto_10496 ?auto_10497 ?auto_10498 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10510 - BLOCK
      ?auto_10511 - BLOCK
      ?auto_10512 - BLOCK
    )
    :vars
    (
      ?auto_10513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10512 ?auto_10513 ) ( not ( = ?auto_10510 ?auto_10511 ) ) ( not ( = ?auto_10510 ?auto_10512 ) ) ( not ( = ?auto_10510 ?auto_10513 ) ) ( not ( = ?auto_10511 ?auto_10512 ) ) ( not ( = ?auto_10511 ?auto_10513 ) ) ( not ( = ?auto_10512 ?auto_10513 ) ) ( ON ?auto_10511 ?auto_10512 ) ( ON ?auto_10510 ?auto_10511 ) ( CLEAR ?auto_10510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10510 )
      ( MAKE-3PILE ?auto_10510 ?auto_10511 ?auto_10512 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10525 - BLOCK
      ?auto_10526 - BLOCK
      ?auto_10527 - BLOCK
      ?auto_10528 - BLOCK
    )
    :vars
    (
      ?auto_10529 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10527 ) ( ON ?auto_10528 ?auto_10529 ) ( CLEAR ?auto_10528 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10525 ) ( ON ?auto_10526 ?auto_10525 ) ( ON ?auto_10527 ?auto_10526 ) ( not ( = ?auto_10525 ?auto_10526 ) ) ( not ( = ?auto_10525 ?auto_10527 ) ) ( not ( = ?auto_10525 ?auto_10528 ) ) ( not ( = ?auto_10525 ?auto_10529 ) ) ( not ( = ?auto_10526 ?auto_10527 ) ) ( not ( = ?auto_10526 ?auto_10528 ) ) ( not ( = ?auto_10526 ?auto_10529 ) ) ( not ( = ?auto_10527 ?auto_10528 ) ) ( not ( = ?auto_10527 ?auto_10529 ) ) ( not ( = ?auto_10528 ?auto_10529 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10528 ?auto_10529 )
      ( !STACK ?auto_10528 ?auto_10527 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10543 - BLOCK
      ?auto_10544 - BLOCK
      ?auto_10545 - BLOCK
      ?auto_10546 - BLOCK
    )
    :vars
    (
      ?auto_10547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10546 ?auto_10547 ) ( ON-TABLE ?auto_10543 ) ( ON ?auto_10544 ?auto_10543 ) ( not ( = ?auto_10543 ?auto_10544 ) ) ( not ( = ?auto_10543 ?auto_10545 ) ) ( not ( = ?auto_10543 ?auto_10546 ) ) ( not ( = ?auto_10543 ?auto_10547 ) ) ( not ( = ?auto_10544 ?auto_10545 ) ) ( not ( = ?auto_10544 ?auto_10546 ) ) ( not ( = ?auto_10544 ?auto_10547 ) ) ( not ( = ?auto_10545 ?auto_10546 ) ) ( not ( = ?auto_10545 ?auto_10547 ) ) ( not ( = ?auto_10546 ?auto_10547 ) ) ( CLEAR ?auto_10544 ) ( ON ?auto_10545 ?auto_10546 ) ( CLEAR ?auto_10545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10543 ?auto_10544 ?auto_10545 )
      ( MAKE-4PILE ?auto_10543 ?auto_10544 ?auto_10545 ?auto_10546 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10561 - BLOCK
      ?auto_10562 - BLOCK
      ?auto_10563 - BLOCK
      ?auto_10564 - BLOCK
    )
    :vars
    (
      ?auto_10565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10564 ?auto_10565 ) ( ON-TABLE ?auto_10561 ) ( not ( = ?auto_10561 ?auto_10562 ) ) ( not ( = ?auto_10561 ?auto_10563 ) ) ( not ( = ?auto_10561 ?auto_10564 ) ) ( not ( = ?auto_10561 ?auto_10565 ) ) ( not ( = ?auto_10562 ?auto_10563 ) ) ( not ( = ?auto_10562 ?auto_10564 ) ) ( not ( = ?auto_10562 ?auto_10565 ) ) ( not ( = ?auto_10563 ?auto_10564 ) ) ( not ( = ?auto_10563 ?auto_10565 ) ) ( not ( = ?auto_10564 ?auto_10565 ) ) ( ON ?auto_10563 ?auto_10564 ) ( CLEAR ?auto_10561 ) ( ON ?auto_10562 ?auto_10563 ) ( CLEAR ?auto_10562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10561 ?auto_10562 )
      ( MAKE-4PILE ?auto_10561 ?auto_10562 ?auto_10563 ?auto_10564 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10579 - BLOCK
      ?auto_10580 - BLOCK
      ?auto_10581 - BLOCK
      ?auto_10582 - BLOCK
    )
    :vars
    (
      ?auto_10583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10582 ?auto_10583 ) ( not ( = ?auto_10579 ?auto_10580 ) ) ( not ( = ?auto_10579 ?auto_10581 ) ) ( not ( = ?auto_10579 ?auto_10582 ) ) ( not ( = ?auto_10579 ?auto_10583 ) ) ( not ( = ?auto_10580 ?auto_10581 ) ) ( not ( = ?auto_10580 ?auto_10582 ) ) ( not ( = ?auto_10580 ?auto_10583 ) ) ( not ( = ?auto_10581 ?auto_10582 ) ) ( not ( = ?auto_10581 ?auto_10583 ) ) ( not ( = ?auto_10582 ?auto_10583 ) ) ( ON ?auto_10581 ?auto_10582 ) ( ON ?auto_10580 ?auto_10581 ) ( ON ?auto_10579 ?auto_10580 ) ( CLEAR ?auto_10579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10579 )
      ( MAKE-4PILE ?auto_10579 ?auto_10580 ?auto_10581 ?auto_10582 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_10598 - BLOCK
      ?auto_10599 - BLOCK
      ?auto_10600 - BLOCK
      ?auto_10601 - BLOCK
      ?auto_10602 - BLOCK
    )
    :vars
    (
      ?auto_10603 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10601 ) ( ON ?auto_10602 ?auto_10603 ) ( CLEAR ?auto_10602 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10598 ) ( ON ?auto_10599 ?auto_10598 ) ( ON ?auto_10600 ?auto_10599 ) ( ON ?auto_10601 ?auto_10600 ) ( not ( = ?auto_10598 ?auto_10599 ) ) ( not ( = ?auto_10598 ?auto_10600 ) ) ( not ( = ?auto_10598 ?auto_10601 ) ) ( not ( = ?auto_10598 ?auto_10602 ) ) ( not ( = ?auto_10598 ?auto_10603 ) ) ( not ( = ?auto_10599 ?auto_10600 ) ) ( not ( = ?auto_10599 ?auto_10601 ) ) ( not ( = ?auto_10599 ?auto_10602 ) ) ( not ( = ?auto_10599 ?auto_10603 ) ) ( not ( = ?auto_10600 ?auto_10601 ) ) ( not ( = ?auto_10600 ?auto_10602 ) ) ( not ( = ?auto_10600 ?auto_10603 ) ) ( not ( = ?auto_10601 ?auto_10602 ) ) ( not ( = ?auto_10601 ?auto_10603 ) ) ( not ( = ?auto_10602 ?auto_10603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10602 ?auto_10603 )
      ( !STACK ?auto_10602 ?auto_10601 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_10620 - BLOCK
      ?auto_10621 - BLOCK
      ?auto_10622 - BLOCK
      ?auto_10623 - BLOCK
      ?auto_10624 - BLOCK
    )
    :vars
    (
      ?auto_10625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10624 ?auto_10625 ) ( ON-TABLE ?auto_10620 ) ( ON ?auto_10621 ?auto_10620 ) ( ON ?auto_10622 ?auto_10621 ) ( not ( = ?auto_10620 ?auto_10621 ) ) ( not ( = ?auto_10620 ?auto_10622 ) ) ( not ( = ?auto_10620 ?auto_10623 ) ) ( not ( = ?auto_10620 ?auto_10624 ) ) ( not ( = ?auto_10620 ?auto_10625 ) ) ( not ( = ?auto_10621 ?auto_10622 ) ) ( not ( = ?auto_10621 ?auto_10623 ) ) ( not ( = ?auto_10621 ?auto_10624 ) ) ( not ( = ?auto_10621 ?auto_10625 ) ) ( not ( = ?auto_10622 ?auto_10623 ) ) ( not ( = ?auto_10622 ?auto_10624 ) ) ( not ( = ?auto_10622 ?auto_10625 ) ) ( not ( = ?auto_10623 ?auto_10624 ) ) ( not ( = ?auto_10623 ?auto_10625 ) ) ( not ( = ?auto_10624 ?auto_10625 ) ) ( CLEAR ?auto_10622 ) ( ON ?auto_10623 ?auto_10624 ) ( CLEAR ?auto_10623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10620 ?auto_10621 ?auto_10622 ?auto_10623 )
      ( MAKE-5PILE ?auto_10620 ?auto_10621 ?auto_10622 ?auto_10623 ?auto_10624 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_10642 - BLOCK
      ?auto_10643 - BLOCK
      ?auto_10644 - BLOCK
      ?auto_10645 - BLOCK
      ?auto_10646 - BLOCK
    )
    :vars
    (
      ?auto_10647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10646 ?auto_10647 ) ( ON-TABLE ?auto_10642 ) ( ON ?auto_10643 ?auto_10642 ) ( not ( = ?auto_10642 ?auto_10643 ) ) ( not ( = ?auto_10642 ?auto_10644 ) ) ( not ( = ?auto_10642 ?auto_10645 ) ) ( not ( = ?auto_10642 ?auto_10646 ) ) ( not ( = ?auto_10642 ?auto_10647 ) ) ( not ( = ?auto_10643 ?auto_10644 ) ) ( not ( = ?auto_10643 ?auto_10645 ) ) ( not ( = ?auto_10643 ?auto_10646 ) ) ( not ( = ?auto_10643 ?auto_10647 ) ) ( not ( = ?auto_10644 ?auto_10645 ) ) ( not ( = ?auto_10644 ?auto_10646 ) ) ( not ( = ?auto_10644 ?auto_10647 ) ) ( not ( = ?auto_10645 ?auto_10646 ) ) ( not ( = ?auto_10645 ?auto_10647 ) ) ( not ( = ?auto_10646 ?auto_10647 ) ) ( ON ?auto_10645 ?auto_10646 ) ( CLEAR ?auto_10643 ) ( ON ?auto_10644 ?auto_10645 ) ( CLEAR ?auto_10644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10642 ?auto_10643 ?auto_10644 )
      ( MAKE-5PILE ?auto_10642 ?auto_10643 ?auto_10644 ?auto_10645 ?auto_10646 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_10664 - BLOCK
      ?auto_10665 - BLOCK
      ?auto_10666 - BLOCK
      ?auto_10667 - BLOCK
      ?auto_10668 - BLOCK
    )
    :vars
    (
      ?auto_10669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10668 ?auto_10669 ) ( ON-TABLE ?auto_10664 ) ( not ( = ?auto_10664 ?auto_10665 ) ) ( not ( = ?auto_10664 ?auto_10666 ) ) ( not ( = ?auto_10664 ?auto_10667 ) ) ( not ( = ?auto_10664 ?auto_10668 ) ) ( not ( = ?auto_10664 ?auto_10669 ) ) ( not ( = ?auto_10665 ?auto_10666 ) ) ( not ( = ?auto_10665 ?auto_10667 ) ) ( not ( = ?auto_10665 ?auto_10668 ) ) ( not ( = ?auto_10665 ?auto_10669 ) ) ( not ( = ?auto_10666 ?auto_10667 ) ) ( not ( = ?auto_10666 ?auto_10668 ) ) ( not ( = ?auto_10666 ?auto_10669 ) ) ( not ( = ?auto_10667 ?auto_10668 ) ) ( not ( = ?auto_10667 ?auto_10669 ) ) ( not ( = ?auto_10668 ?auto_10669 ) ) ( ON ?auto_10667 ?auto_10668 ) ( ON ?auto_10666 ?auto_10667 ) ( CLEAR ?auto_10664 ) ( ON ?auto_10665 ?auto_10666 ) ( CLEAR ?auto_10665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10664 ?auto_10665 )
      ( MAKE-5PILE ?auto_10664 ?auto_10665 ?auto_10666 ?auto_10667 ?auto_10668 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_10686 - BLOCK
      ?auto_10687 - BLOCK
      ?auto_10688 - BLOCK
      ?auto_10689 - BLOCK
      ?auto_10690 - BLOCK
    )
    :vars
    (
      ?auto_10691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10690 ?auto_10691 ) ( not ( = ?auto_10686 ?auto_10687 ) ) ( not ( = ?auto_10686 ?auto_10688 ) ) ( not ( = ?auto_10686 ?auto_10689 ) ) ( not ( = ?auto_10686 ?auto_10690 ) ) ( not ( = ?auto_10686 ?auto_10691 ) ) ( not ( = ?auto_10687 ?auto_10688 ) ) ( not ( = ?auto_10687 ?auto_10689 ) ) ( not ( = ?auto_10687 ?auto_10690 ) ) ( not ( = ?auto_10687 ?auto_10691 ) ) ( not ( = ?auto_10688 ?auto_10689 ) ) ( not ( = ?auto_10688 ?auto_10690 ) ) ( not ( = ?auto_10688 ?auto_10691 ) ) ( not ( = ?auto_10689 ?auto_10690 ) ) ( not ( = ?auto_10689 ?auto_10691 ) ) ( not ( = ?auto_10690 ?auto_10691 ) ) ( ON ?auto_10689 ?auto_10690 ) ( ON ?auto_10688 ?auto_10689 ) ( ON ?auto_10687 ?auto_10688 ) ( ON ?auto_10686 ?auto_10687 ) ( CLEAR ?auto_10686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10686 )
      ( MAKE-5PILE ?auto_10686 ?auto_10687 ?auto_10688 ?auto_10689 ?auto_10690 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10709 - BLOCK
      ?auto_10710 - BLOCK
      ?auto_10711 - BLOCK
      ?auto_10712 - BLOCK
      ?auto_10713 - BLOCK
      ?auto_10714 - BLOCK
    )
    :vars
    (
      ?auto_10715 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10713 ) ( ON ?auto_10714 ?auto_10715 ) ( CLEAR ?auto_10714 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10709 ) ( ON ?auto_10710 ?auto_10709 ) ( ON ?auto_10711 ?auto_10710 ) ( ON ?auto_10712 ?auto_10711 ) ( ON ?auto_10713 ?auto_10712 ) ( not ( = ?auto_10709 ?auto_10710 ) ) ( not ( = ?auto_10709 ?auto_10711 ) ) ( not ( = ?auto_10709 ?auto_10712 ) ) ( not ( = ?auto_10709 ?auto_10713 ) ) ( not ( = ?auto_10709 ?auto_10714 ) ) ( not ( = ?auto_10709 ?auto_10715 ) ) ( not ( = ?auto_10710 ?auto_10711 ) ) ( not ( = ?auto_10710 ?auto_10712 ) ) ( not ( = ?auto_10710 ?auto_10713 ) ) ( not ( = ?auto_10710 ?auto_10714 ) ) ( not ( = ?auto_10710 ?auto_10715 ) ) ( not ( = ?auto_10711 ?auto_10712 ) ) ( not ( = ?auto_10711 ?auto_10713 ) ) ( not ( = ?auto_10711 ?auto_10714 ) ) ( not ( = ?auto_10711 ?auto_10715 ) ) ( not ( = ?auto_10712 ?auto_10713 ) ) ( not ( = ?auto_10712 ?auto_10714 ) ) ( not ( = ?auto_10712 ?auto_10715 ) ) ( not ( = ?auto_10713 ?auto_10714 ) ) ( not ( = ?auto_10713 ?auto_10715 ) ) ( not ( = ?auto_10714 ?auto_10715 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10714 ?auto_10715 )
      ( !STACK ?auto_10714 ?auto_10713 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10722 - BLOCK
      ?auto_10723 - BLOCK
      ?auto_10724 - BLOCK
      ?auto_10725 - BLOCK
      ?auto_10726 - BLOCK
      ?auto_10727 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10726 ) ( ON-TABLE ?auto_10727 ) ( CLEAR ?auto_10727 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10722 ) ( ON ?auto_10723 ?auto_10722 ) ( ON ?auto_10724 ?auto_10723 ) ( ON ?auto_10725 ?auto_10724 ) ( ON ?auto_10726 ?auto_10725 ) ( not ( = ?auto_10722 ?auto_10723 ) ) ( not ( = ?auto_10722 ?auto_10724 ) ) ( not ( = ?auto_10722 ?auto_10725 ) ) ( not ( = ?auto_10722 ?auto_10726 ) ) ( not ( = ?auto_10722 ?auto_10727 ) ) ( not ( = ?auto_10723 ?auto_10724 ) ) ( not ( = ?auto_10723 ?auto_10725 ) ) ( not ( = ?auto_10723 ?auto_10726 ) ) ( not ( = ?auto_10723 ?auto_10727 ) ) ( not ( = ?auto_10724 ?auto_10725 ) ) ( not ( = ?auto_10724 ?auto_10726 ) ) ( not ( = ?auto_10724 ?auto_10727 ) ) ( not ( = ?auto_10725 ?auto_10726 ) ) ( not ( = ?auto_10725 ?auto_10727 ) ) ( not ( = ?auto_10726 ?auto_10727 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_10727 )
      ( !STACK ?auto_10727 ?auto_10726 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10734 - BLOCK
      ?auto_10735 - BLOCK
      ?auto_10736 - BLOCK
      ?auto_10737 - BLOCK
      ?auto_10738 - BLOCK
      ?auto_10739 - BLOCK
    )
    :vars
    (
      ?auto_10740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10739 ?auto_10740 ) ( ON-TABLE ?auto_10734 ) ( ON ?auto_10735 ?auto_10734 ) ( ON ?auto_10736 ?auto_10735 ) ( ON ?auto_10737 ?auto_10736 ) ( not ( = ?auto_10734 ?auto_10735 ) ) ( not ( = ?auto_10734 ?auto_10736 ) ) ( not ( = ?auto_10734 ?auto_10737 ) ) ( not ( = ?auto_10734 ?auto_10738 ) ) ( not ( = ?auto_10734 ?auto_10739 ) ) ( not ( = ?auto_10734 ?auto_10740 ) ) ( not ( = ?auto_10735 ?auto_10736 ) ) ( not ( = ?auto_10735 ?auto_10737 ) ) ( not ( = ?auto_10735 ?auto_10738 ) ) ( not ( = ?auto_10735 ?auto_10739 ) ) ( not ( = ?auto_10735 ?auto_10740 ) ) ( not ( = ?auto_10736 ?auto_10737 ) ) ( not ( = ?auto_10736 ?auto_10738 ) ) ( not ( = ?auto_10736 ?auto_10739 ) ) ( not ( = ?auto_10736 ?auto_10740 ) ) ( not ( = ?auto_10737 ?auto_10738 ) ) ( not ( = ?auto_10737 ?auto_10739 ) ) ( not ( = ?auto_10737 ?auto_10740 ) ) ( not ( = ?auto_10738 ?auto_10739 ) ) ( not ( = ?auto_10738 ?auto_10740 ) ) ( not ( = ?auto_10739 ?auto_10740 ) ) ( CLEAR ?auto_10737 ) ( ON ?auto_10738 ?auto_10739 ) ( CLEAR ?auto_10738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_10734 ?auto_10735 ?auto_10736 ?auto_10737 ?auto_10738 )
      ( MAKE-6PILE ?auto_10734 ?auto_10735 ?auto_10736 ?auto_10737 ?auto_10738 ?auto_10739 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10747 - BLOCK
      ?auto_10748 - BLOCK
      ?auto_10749 - BLOCK
      ?auto_10750 - BLOCK
      ?auto_10751 - BLOCK
      ?auto_10752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10752 ) ( ON-TABLE ?auto_10747 ) ( ON ?auto_10748 ?auto_10747 ) ( ON ?auto_10749 ?auto_10748 ) ( ON ?auto_10750 ?auto_10749 ) ( not ( = ?auto_10747 ?auto_10748 ) ) ( not ( = ?auto_10747 ?auto_10749 ) ) ( not ( = ?auto_10747 ?auto_10750 ) ) ( not ( = ?auto_10747 ?auto_10751 ) ) ( not ( = ?auto_10747 ?auto_10752 ) ) ( not ( = ?auto_10748 ?auto_10749 ) ) ( not ( = ?auto_10748 ?auto_10750 ) ) ( not ( = ?auto_10748 ?auto_10751 ) ) ( not ( = ?auto_10748 ?auto_10752 ) ) ( not ( = ?auto_10749 ?auto_10750 ) ) ( not ( = ?auto_10749 ?auto_10751 ) ) ( not ( = ?auto_10749 ?auto_10752 ) ) ( not ( = ?auto_10750 ?auto_10751 ) ) ( not ( = ?auto_10750 ?auto_10752 ) ) ( not ( = ?auto_10751 ?auto_10752 ) ) ( CLEAR ?auto_10750 ) ( ON ?auto_10751 ?auto_10752 ) ( CLEAR ?auto_10751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_10747 ?auto_10748 ?auto_10749 ?auto_10750 ?auto_10751 )
      ( MAKE-6PILE ?auto_10747 ?auto_10748 ?auto_10749 ?auto_10750 ?auto_10751 ?auto_10752 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10759 - BLOCK
      ?auto_10760 - BLOCK
      ?auto_10761 - BLOCK
      ?auto_10762 - BLOCK
      ?auto_10763 - BLOCK
      ?auto_10764 - BLOCK
    )
    :vars
    (
      ?auto_10765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10764 ?auto_10765 ) ( ON-TABLE ?auto_10759 ) ( ON ?auto_10760 ?auto_10759 ) ( ON ?auto_10761 ?auto_10760 ) ( not ( = ?auto_10759 ?auto_10760 ) ) ( not ( = ?auto_10759 ?auto_10761 ) ) ( not ( = ?auto_10759 ?auto_10762 ) ) ( not ( = ?auto_10759 ?auto_10763 ) ) ( not ( = ?auto_10759 ?auto_10764 ) ) ( not ( = ?auto_10759 ?auto_10765 ) ) ( not ( = ?auto_10760 ?auto_10761 ) ) ( not ( = ?auto_10760 ?auto_10762 ) ) ( not ( = ?auto_10760 ?auto_10763 ) ) ( not ( = ?auto_10760 ?auto_10764 ) ) ( not ( = ?auto_10760 ?auto_10765 ) ) ( not ( = ?auto_10761 ?auto_10762 ) ) ( not ( = ?auto_10761 ?auto_10763 ) ) ( not ( = ?auto_10761 ?auto_10764 ) ) ( not ( = ?auto_10761 ?auto_10765 ) ) ( not ( = ?auto_10762 ?auto_10763 ) ) ( not ( = ?auto_10762 ?auto_10764 ) ) ( not ( = ?auto_10762 ?auto_10765 ) ) ( not ( = ?auto_10763 ?auto_10764 ) ) ( not ( = ?auto_10763 ?auto_10765 ) ) ( not ( = ?auto_10764 ?auto_10765 ) ) ( ON ?auto_10763 ?auto_10764 ) ( CLEAR ?auto_10761 ) ( ON ?auto_10762 ?auto_10763 ) ( CLEAR ?auto_10762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10759 ?auto_10760 ?auto_10761 ?auto_10762 )
      ( MAKE-6PILE ?auto_10759 ?auto_10760 ?auto_10761 ?auto_10762 ?auto_10763 ?auto_10764 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10772 - BLOCK
      ?auto_10773 - BLOCK
      ?auto_10774 - BLOCK
      ?auto_10775 - BLOCK
      ?auto_10776 - BLOCK
      ?auto_10777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10777 ) ( ON-TABLE ?auto_10772 ) ( ON ?auto_10773 ?auto_10772 ) ( ON ?auto_10774 ?auto_10773 ) ( not ( = ?auto_10772 ?auto_10773 ) ) ( not ( = ?auto_10772 ?auto_10774 ) ) ( not ( = ?auto_10772 ?auto_10775 ) ) ( not ( = ?auto_10772 ?auto_10776 ) ) ( not ( = ?auto_10772 ?auto_10777 ) ) ( not ( = ?auto_10773 ?auto_10774 ) ) ( not ( = ?auto_10773 ?auto_10775 ) ) ( not ( = ?auto_10773 ?auto_10776 ) ) ( not ( = ?auto_10773 ?auto_10777 ) ) ( not ( = ?auto_10774 ?auto_10775 ) ) ( not ( = ?auto_10774 ?auto_10776 ) ) ( not ( = ?auto_10774 ?auto_10777 ) ) ( not ( = ?auto_10775 ?auto_10776 ) ) ( not ( = ?auto_10775 ?auto_10777 ) ) ( not ( = ?auto_10776 ?auto_10777 ) ) ( ON ?auto_10776 ?auto_10777 ) ( CLEAR ?auto_10774 ) ( ON ?auto_10775 ?auto_10776 ) ( CLEAR ?auto_10775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10772 ?auto_10773 ?auto_10774 ?auto_10775 )
      ( MAKE-6PILE ?auto_10772 ?auto_10773 ?auto_10774 ?auto_10775 ?auto_10776 ?auto_10777 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10784 - BLOCK
      ?auto_10785 - BLOCK
      ?auto_10786 - BLOCK
      ?auto_10787 - BLOCK
      ?auto_10788 - BLOCK
      ?auto_10789 - BLOCK
    )
    :vars
    (
      ?auto_10790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10789 ?auto_10790 ) ( ON-TABLE ?auto_10784 ) ( ON ?auto_10785 ?auto_10784 ) ( not ( = ?auto_10784 ?auto_10785 ) ) ( not ( = ?auto_10784 ?auto_10786 ) ) ( not ( = ?auto_10784 ?auto_10787 ) ) ( not ( = ?auto_10784 ?auto_10788 ) ) ( not ( = ?auto_10784 ?auto_10789 ) ) ( not ( = ?auto_10784 ?auto_10790 ) ) ( not ( = ?auto_10785 ?auto_10786 ) ) ( not ( = ?auto_10785 ?auto_10787 ) ) ( not ( = ?auto_10785 ?auto_10788 ) ) ( not ( = ?auto_10785 ?auto_10789 ) ) ( not ( = ?auto_10785 ?auto_10790 ) ) ( not ( = ?auto_10786 ?auto_10787 ) ) ( not ( = ?auto_10786 ?auto_10788 ) ) ( not ( = ?auto_10786 ?auto_10789 ) ) ( not ( = ?auto_10786 ?auto_10790 ) ) ( not ( = ?auto_10787 ?auto_10788 ) ) ( not ( = ?auto_10787 ?auto_10789 ) ) ( not ( = ?auto_10787 ?auto_10790 ) ) ( not ( = ?auto_10788 ?auto_10789 ) ) ( not ( = ?auto_10788 ?auto_10790 ) ) ( not ( = ?auto_10789 ?auto_10790 ) ) ( ON ?auto_10788 ?auto_10789 ) ( ON ?auto_10787 ?auto_10788 ) ( CLEAR ?auto_10785 ) ( ON ?auto_10786 ?auto_10787 ) ( CLEAR ?auto_10786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10784 ?auto_10785 ?auto_10786 )
      ( MAKE-6PILE ?auto_10784 ?auto_10785 ?auto_10786 ?auto_10787 ?auto_10788 ?auto_10789 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10797 - BLOCK
      ?auto_10798 - BLOCK
      ?auto_10799 - BLOCK
      ?auto_10800 - BLOCK
      ?auto_10801 - BLOCK
      ?auto_10802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10802 ) ( ON-TABLE ?auto_10797 ) ( ON ?auto_10798 ?auto_10797 ) ( not ( = ?auto_10797 ?auto_10798 ) ) ( not ( = ?auto_10797 ?auto_10799 ) ) ( not ( = ?auto_10797 ?auto_10800 ) ) ( not ( = ?auto_10797 ?auto_10801 ) ) ( not ( = ?auto_10797 ?auto_10802 ) ) ( not ( = ?auto_10798 ?auto_10799 ) ) ( not ( = ?auto_10798 ?auto_10800 ) ) ( not ( = ?auto_10798 ?auto_10801 ) ) ( not ( = ?auto_10798 ?auto_10802 ) ) ( not ( = ?auto_10799 ?auto_10800 ) ) ( not ( = ?auto_10799 ?auto_10801 ) ) ( not ( = ?auto_10799 ?auto_10802 ) ) ( not ( = ?auto_10800 ?auto_10801 ) ) ( not ( = ?auto_10800 ?auto_10802 ) ) ( not ( = ?auto_10801 ?auto_10802 ) ) ( ON ?auto_10801 ?auto_10802 ) ( ON ?auto_10800 ?auto_10801 ) ( CLEAR ?auto_10798 ) ( ON ?auto_10799 ?auto_10800 ) ( CLEAR ?auto_10799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10797 ?auto_10798 ?auto_10799 )
      ( MAKE-6PILE ?auto_10797 ?auto_10798 ?auto_10799 ?auto_10800 ?auto_10801 ?auto_10802 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10809 - BLOCK
      ?auto_10810 - BLOCK
      ?auto_10811 - BLOCK
      ?auto_10812 - BLOCK
      ?auto_10813 - BLOCK
      ?auto_10814 - BLOCK
    )
    :vars
    (
      ?auto_10815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10814 ?auto_10815 ) ( ON-TABLE ?auto_10809 ) ( not ( = ?auto_10809 ?auto_10810 ) ) ( not ( = ?auto_10809 ?auto_10811 ) ) ( not ( = ?auto_10809 ?auto_10812 ) ) ( not ( = ?auto_10809 ?auto_10813 ) ) ( not ( = ?auto_10809 ?auto_10814 ) ) ( not ( = ?auto_10809 ?auto_10815 ) ) ( not ( = ?auto_10810 ?auto_10811 ) ) ( not ( = ?auto_10810 ?auto_10812 ) ) ( not ( = ?auto_10810 ?auto_10813 ) ) ( not ( = ?auto_10810 ?auto_10814 ) ) ( not ( = ?auto_10810 ?auto_10815 ) ) ( not ( = ?auto_10811 ?auto_10812 ) ) ( not ( = ?auto_10811 ?auto_10813 ) ) ( not ( = ?auto_10811 ?auto_10814 ) ) ( not ( = ?auto_10811 ?auto_10815 ) ) ( not ( = ?auto_10812 ?auto_10813 ) ) ( not ( = ?auto_10812 ?auto_10814 ) ) ( not ( = ?auto_10812 ?auto_10815 ) ) ( not ( = ?auto_10813 ?auto_10814 ) ) ( not ( = ?auto_10813 ?auto_10815 ) ) ( not ( = ?auto_10814 ?auto_10815 ) ) ( ON ?auto_10813 ?auto_10814 ) ( ON ?auto_10812 ?auto_10813 ) ( ON ?auto_10811 ?auto_10812 ) ( CLEAR ?auto_10809 ) ( ON ?auto_10810 ?auto_10811 ) ( CLEAR ?auto_10810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10809 ?auto_10810 )
      ( MAKE-6PILE ?auto_10809 ?auto_10810 ?auto_10811 ?auto_10812 ?auto_10813 ?auto_10814 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10822 - BLOCK
      ?auto_10823 - BLOCK
      ?auto_10824 - BLOCK
      ?auto_10825 - BLOCK
      ?auto_10826 - BLOCK
      ?auto_10827 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10827 ) ( ON-TABLE ?auto_10822 ) ( not ( = ?auto_10822 ?auto_10823 ) ) ( not ( = ?auto_10822 ?auto_10824 ) ) ( not ( = ?auto_10822 ?auto_10825 ) ) ( not ( = ?auto_10822 ?auto_10826 ) ) ( not ( = ?auto_10822 ?auto_10827 ) ) ( not ( = ?auto_10823 ?auto_10824 ) ) ( not ( = ?auto_10823 ?auto_10825 ) ) ( not ( = ?auto_10823 ?auto_10826 ) ) ( not ( = ?auto_10823 ?auto_10827 ) ) ( not ( = ?auto_10824 ?auto_10825 ) ) ( not ( = ?auto_10824 ?auto_10826 ) ) ( not ( = ?auto_10824 ?auto_10827 ) ) ( not ( = ?auto_10825 ?auto_10826 ) ) ( not ( = ?auto_10825 ?auto_10827 ) ) ( not ( = ?auto_10826 ?auto_10827 ) ) ( ON ?auto_10826 ?auto_10827 ) ( ON ?auto_10825 ?auto_10826 ) ( ON ?auto_10824 ?auto_10825 ) ( CLEAR ?auto_10822 ) ( ON ?auto_10823 ?auto_10824 ) ( CLEAR ?auto_10823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10822 ?auto_10823 )
      ( MAKE-6PILE ?auto_10822 ?auto_10823 ?auto_10824 ?auto_10825 ?auto_10826 ?auto_10827 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10834 - BLOCK
      ?auto_10835 - BLOCK
      ?auto_10836 - BLOCK
      ?auto_10837 - BLOCK
      ?auto_10838 - BLOCK
      ?auto_10839 - BLOCK
    )
    :vars
    (
      ?auto_10840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10839 ?auto_10840 ) ( not ( = ?auto_10834 ?auto_10835 ) ) ( not ( = ?auto_10834 ?auto_10836 ) ) ( not ( = ?auto_10834 ?auto_10837 ) ) ( not ( = ?auto_10834 ?auto_10838 ) ) ( not ( = ?auto_10834 ?auto_10839 ) ) ( not ( = ?auto_10834 ?auto_10840 ) ) ( not ( = ?auto_10835 ?auto_10836 ) ) ( not ( = ?auto_10835 ?auto_10837 ) ) ( not ( = ?auto_10835 ?auto_10838 ) ) ( not ( = ?auto_10835 ?auto_10839 ) ) ( not ( = ?auto_10835 ?auto_10840 ) ) ( not ( = ?auto_10836 ?auto_10837 ) ) ( not ( = ?auto_10836 ?auto_10838 ) ) ( not ( = ?auto_10836 ?auto_10839 ) ) ( not ( = ?auto_10836 ?auto_10840 ) ) ( not ( = ?auto_10837 ?auto_10838 ) ) ( not ( = ?auto_10837 ?auto_10839 ) ) ( not ( = ?auto_10837 ?auto_10840 ) ) ( not ( = ?auto_10838 ?auto_10839 ) ) ( not ( = ?auto_10838 ?auto_10840 ) ) ( not ( = ?auto_10839 ?auto_10840 ) ) ( ON ?auto_10838 ?auto_10839 ) ( ON ?auto_10837 ?auto_10838 ) ( ON ?auto_10836 ?auto_10837 ) ( ON ?auto_10835 ?auto_10836 ) ( ON ?auto_10834 ?auto_10835 ) ( CLEAR ?auto_10834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10834 )
      ( MAKE-6PILE ?auto_10834 ?auto_10835 ?auto_10836 ?auto_10837 ?auto_10838 ?auto_10839 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10847 - BLOCK
      ?auto_10848 - BLOCK
      ?auto_10849 - BLOCK
      ?auto_10850 - BLOCK
      ?auto_10851 - BLOCK
      ?auto_10852 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10852 ) ( not ( = ?auto_10847 ?auto_10848 ) ) ( not ( = ?auto_10847 ?auto_10849 ) ) ( not ( = ?auto_10847 ?auto_10850 ) ) ( not ( = ?auto_10847 ?auto_10851 ) ) ( not ( = ?auto_10847 ?auto_10852 ) ) ( not ( = ?auto_10848 ?auto_10849 ) ) ( not ( = ?auto_10848 ?auto_10850 ) ) ( not ( = ?auto_10848 ?auto_10851 ) ) ( not ( = ?auto_10848 ?auto_10852 ) ) ( not ( = ?auto_10849 ?auto_10850 ) ) ( not ( = ?auto_10849 ?auto_10851 ) ) ( not ( = ?auto_10849 ?auto_10852 ) ) ( not ( = ?auto_10850 ?auto_10851 ) ) ( not ( = ?auto_10850 ?auto_10852 ) ) ( not ( = ?auto_10851 ?auto_10852 ) ) ( ON ?auto_10851 ?auto_10852 ) ( ON ?auto_10850 ?auto_10851 ) ( ON ?auto_10849 ?auto_10850 ) ( ON ?auto_10848 ?auto_10849 ) ( ON ?auto_10847 ?auto_10848 ) ( CLEAR ?auto_10847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10847 )
      ( MAKE-6PILE ?auto_10847 ?auto_10848 ?auto_10849 ?auto_10850 ?auto_10851 ?auto_10852 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_10859 - BLOCK
      ?auto_10860 - BLOCK
      ?auto_10861 - BLOCK
      ?auto_10862 - BLOCK
      ?auto_10863 - BLOCK
      ?auto_10864 - BLOCK
    )
    :vars
    (
      ?auto_10865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10859 ?auto_10860 ) ) ( not ( = ?auto_10859 ?auto_10861 ) ) ( not ( = ?auto_10859 ?auto_10862 ) ) ( not ( = ?auto_10859 ?auto_10863 ) ) ( not ( = ?auto_10859 ?auto_10864 ) ) ( not ( = ?auto_10860 ?auto_10861 ) ) ( not ( = ?auto_10860 ?auto_10862 ) ) ( not ( = ?auto_10860 ?auto_10863 ) ) ( not ( = ?auto_10860 ?auto_10864 ) ) ( not ( = ?auto_10861 ?auto_10862 ) ) ( not ( = ?auto_10861 ?auto_10863 ) ) ( not ( = ?auto_10861 ?auto_10864 ) ) ( not ( = ?auto_10862 ?auto_10863 ) ) ( not ( = ?auto_10862 ?auto_10864 ) ) ( not ( = ?auto_10863 ?auto_10864 ) ) ( ON ?auto_10859 ?auto_10865 ) ( not ( = ?auto_10864 ?auto_10865 ) ) ( not ( = ?auto_10863 ?auto_10865 ) ) ( not ( = ?auto_10862 ?auto_10865 ) ) ( not ( = ?auto_10861 ?auto_10865 ) ) ( not ( = ?auto_10860 ?auto_10865 ) ) ( not ( = ?auto_10859 ?auto_10865 ) ) ( ON ?auto_10860 ?auto_10859 ) ( ON ?auto_10861 ?auto_10860 ) ( ON ?auto_10862 ?auto_10861 ) ( ON ?auto_10863 ?auto_10862 ) ( ON ?auto_10864 ?auto_10863 ) ( CLEAR ?auto_10864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_10864 ?auto_10863 ?auto_10862 ?auto_10861 ?auto_10860 ?auto_10859 )
      ( MAKE-6PILE ?auto_10859 ?auto_10860 ?auto_10861 ?auto_10862 ?auto_10863 ?auto_10864 ) )
  )

)

