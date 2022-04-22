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
      ?auto_81579 - BLOCK
      ?auto_81580 - BLOCK
      ?auto_81581 - BLOCK
      ?auto_81582 - BLOCK
      ?auto_81583 - BLOCK
      ?auto_81584 - BLOCK
      ?auto_81585 - BLOCK
    )
    :vars
    (
      ?auto_81586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81586 ?auto_81585 ) ( CLEAR ?auto_81586 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81579 ) ( ON ?auto_81580 ?auto_81579 ) ( ON ?auto_81581 ?auto_81580 ) ( ON ?auto_81582 ?auto_81581 ) ( ON ?auto_81583 ?auto_81582 ) ( ON ?auto_81584 ?auto_81583 ) ( ON ?auto_81585 ?auto_81584 ) ( not ( = ?auto_81579 ?auto_81580 ) ) ( not ( = ?auto_81579 ?auto_81581 ) ) ( not ( = ?auto_81579 ?auto_81582 ) ) ( not ( = ?auto_81579 ?auto_81583 ) ) ( not ( = ?auto_81579 ?auto_81584 ) ) ( not ( = ?auto_81579 ?auto_81585 ) ) ( not ( = ?auto_81579 ?auto_81586 ) ) ( not ( = ?auto_81580 ?auto_81581 ) ) ( not ( = ?auto_81580 ?auto_81582 ) ) ( not ( = ?auto_81580 ?auto_81583 ) ) ( not ( = ?auto_81580 ?auto_81584 ) ) ( not ( = ?auto_81580 ?auto_81585 ) ) ( not ( = ?auto_81580 ?auto_81586 ) ) ( not ( = ?auto_81581 ?auto_81582 ) ) ( not ( = ?auto_81581 ?auto_81583 ) ) ( not ( = ?auto_81581 ?auto_81584 ) ) ( not ( = ?auto_81581 ?auto_81585 ) ) ( not ( = ?auto_81581 ?auto_81586 ) ) ( not ( = ?auto_81582 ?auto_81583 ) ) ( not ( = ?auto_81582 ?auto_81584 ) ) ( not ( = ?auto_81582 ?auto_81585 ) ) ( not ( = ?auto_81582 ?auto_81586 ) ) ( not ( = ?auto_81583 ?auto_81584 ) ) ( not ( = ?auto_81583 ?auto_81585 ) ) ( not ( = ?auto_81583 ?auto_81586 ) ) ( not ( = ?auto_81584 ?auto_81585 ) ) ( not ( = ?auto_81584 ?auto_81586 ) ) ( not ( = ?auto_81585 ?auto_81586 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81586 ?auto_81585 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81588 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_81588 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_81588 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81589 - BLOCK
    )
    :vars
    (
      ?auto_81590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81589 ?auto_81590 ) ( CLEAR ?auto_81589 ) ( HAND-EMPTY ) ( not ( = ?auto_81589 ?auto_81590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81589 ?auto_81590 )
      ( MAKE-1PILE ?auto_81589 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81597 - BLOCK
      ?auto_81598 - BLOCK
      ?auto_81599 - BLOCK
      ?auto_81600 - BLOCK
      ?auto_81601 - BLOCK
      ?auto_81602 - BLOCK
    )
    :vars
    (
      ?auto_81603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81603 ?auto_81602 ) ( CLEAR ?auto_81603 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81597 ) ( ON ?auto_81598 ?auto_81597 ) ( ON ?auto_81599 ?auto_81598 ) ( ON ?auto_81600 ?auto_81599 ) ( ON ?auto_81601 ?auto_81600 ) ( ON ?auto_81602 ?auto_81601 ) ( not ( = ?auto_81597 ?auto_81598 ) ) ( not ( = ?auto_81597 ?auto_81599 ) ) ( not ( = ?auto_81597 ?auto_81600 ) ) ( not ( = ?auto_81597 ?auto_81601 ) ) ( not ( = ?auto_81597 ?auto_81602 ) ) ( not ( = ?auto_81597 ?auto_81603 ) ) ( not ( = ?auto_81598 ?auto_81599 ) ) ( not ( = ?auto_81598 ?auto_81600 ) ) ( not ( = ?auto_81598 ?auto_81601 ) ) ( not ( = ?auto_81598 ?auto_81602 ) ) ( not ( = ?auto_81598 ?auto_81603 ) ) ( not ( = ?auto_81599 ?auto_81600 ) ) ( not ( = ?auto_81599 ?auto_81601 ) ) ( not ( = ?auto_81599 ?auto_81602 ) ) ( not ( = ?auto_81599 ?auto_81603 ) ) ( not ( = ?auto_81600 ?auto_81601 ) ) ( not ( = ?auto_81600 ?auto_81602 ) ) ( not ( = ?auto_81600 ?auto_81603 ) ) ( not ( = ?auto_81601 ?auto_81602 ) ) ( not ( = ?auto_81601 ?auto_81603 ) ) ( not ( = ?auto_81602 ?auto_81603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81603 ?auto_81602 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81604 - BLOCK
      ?auto_81605 - BLOCK
      ?auto_81606 - BLOCK
      ?auto_81607 - BLOCK
      ?auto_81608 - BLOCK
      ?auto_81609 - BLOCK
    )
    :vars
    (
      ?auto_81610 - BLOCK
      ?auto_81611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81610 ?auto_81609 ) ( CLEAR ?auto_81610 ) ( ON-TABLE ?auto_81604 ) ( ON ?auto_81605 ?auto_81604 ) ( ON ?auto_81606 ?auto_81605 ) ( ON ?auto_81607 ?auto_81606 ) ( ON ?auto_81608 ?auto_81607 ) ( ON ?auto_81609 ?auto_81608 ) ( not ( = ?auto_81604 ?auto_81605 ) ) ( not ( = ?auto_81604 ?auto_81606 ) ) ( not ( = ?auto_81604 ?auto_81607 ) ) ( not ( = ?auto_81604 ?auto_81608 ) ) ( not ( = ?auto_81604 ?auto_81609 ) ) ( not ( = ?auto_81604 ?auto_81610 ) ) ( not ( = ?auto_81605 ?auto_81606 ) ) ( not ( = ?auto_81605 ?auto_81607 ) ) ( not ( = ?auto_81605 ?auto_81608 ) ) ( not ( = ?auto_81605 ?auto_81609 ) ) ( not ( = ?auto_81605 ?auto_81610 ) ) ( not ( = ?auto_81606 ?auto_81607 ) ) ( not ( = ?auto_81606 ?auto_81608 ) ) ( not ( = ?auto_81606 ?auto_81609 ) ) ( not ( = ?auto_81606 ?auto_81610 ) ) ( not ( = ?auto_81607 ?auto_81608 ) ) ( not ( = ?auto_81607 ?auto_81609 ) ) ( not ( = ?auto_81607 ?auto_81610 ) ) ( not ( = ?auto_81608 ?auto_81609 ) ) ( not ( = ?auto_81608 ?auto_81610 ) ) ( not ( = ?auto_81609 ?auto_81610 ) ) ( HOLDING ?auto_81611 ) ( not ( = ?auto_81604 ?auto_81611 ) ) ( not ( = ?auto_81605 ?auto_81611 ) ) ( not ( = ?auto_81606 ?auto_81611 ) ) ( not ( = ?auto_81607 ?auto_81611 ) ) ( not ( = ?auto_81608 ?auto_81611 ) ) ( not ( = ?auto_81609 ?auto_81611 ) ) ( not ( = ?auto_81610 ?auto_81611 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_81611 )
      ( MAKE-6PILE ?auto_81604 ?auto_81605 ?auto_81606 ?auto_81607 ?auto_81608 ?auto_81609 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81612 - BLOCK
      ?auto_81613 - BLOCK
      ?auto_81614 - BLOCK
      ?auto_81615 - BLOCK
      ?auto_81616 - BLOCK
      ?auto_81617 - BLOCK
    )
    :vars
    (
      ?auto_81618 - BLOCK
      ?auto_81619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81618 ?auto_81617 ) ( ON-TABLE ?auto_81612 ) ( ON ?auto_81613 ?auto_81612 ) ( ON ?auto_81614 ?auto_81613 ) ( ON ?auto_81615 ?auto_81614 ) ( ON ?auto_81616 ?auto_81615 ) ( ON ?auto_81617 ?auto_81616 ) ( not ( = ?auto_81612 ?auto_81613 ) ) ( not ( = ?auto_81612 ?auto_81614 ) ) ( not ( = ?auto_81612 ?auto_81615 ) ) ( not ( = ?auto_81612 ?auto_81616 ) ) ( not ( = ?auto_81612 ?auto_81617 ) ) ( not ( = ?auto_81612 ?auto_81618 ) ) ( not ( = ?auto_81613 ?auto_81614 ) ) ( not ( = ?auto_81613 ?auto_81615 ) ) ( not ( = ?auto_81613 ?auto_81616 ) ) ( not ( = ?auto_81613 ?auto_81617 ) ) ( not ( = ?auto_81613 ?auto_81618 ) ) ( not ( = ?auto_81614 ?auto_81615 ) ) ( not ( = ?auto_81614 ?auto_81616 ) ) ( not ( = ?auto_81614 ?auto_81617 ) ) ( not ( = ?auto_81614 ?auto_81618 ) ) ( not ( = ?auto_81615 ?auto_81616 ) ) ( not ( = ?auto_81615 ?auto_81617 ) ) ( not ( = ?auto_81615 ?auto_81618 ) ) ( not ( = ?auto_81616 ?auto_81617 ) ) ( not ( = ?auto_81616 ?auto_81618 ) ) ( not ( = ?auto_81617 ?auto_81618 ) ) ( not ( = ?auto_81612 ?auto_81619 ) ) ( not ( = ?auto_81613 ?auto_81619 ) ) ( not ( = ?auto_81614 ?auto_81619 ) ) ( not ( = ?auto_81615 ?auto_81619 ) ) ( not ( = ?auto_81616 ?auto_81619 ) ) ( not ( = ?auto_81617 ?auto_81619 ) ) ( not ( = ?auto_81618 ?auto_81619 ) ) ( ON ?auto_81619 ?auto_81618 ) ( CLEAR ?auto_81619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81612 ?auto_81613 ?auto_81614 ?auto_81615 ?auto_81616 ?auto_81617 ?auto_81618 )
      ( MAKE-6PILE ?auto_81612 ?auto_81613 ?auto_81614 ?auto_81615 ?auto_81616 ?auto_81617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81622 - BLOCK
      ?auto_81623 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_81623 ) ( CLEAR ?auto_81622 ) ( ON-TABLE ?auto_81622 ) ( not ( = ?auto_81622 ?auto_81623 ) ) )
    :subtasks
    ( ( !STACK ?auto_81623 ?auto_81622 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81624 - BLOCK
      ?auto_81625 - BLOCK
    )
    :vars
    (
      ?auto_81626 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81624 ) ( ON-TABLE ?auto_81624 ) ( not ( = ?auto_81624 ?auto_81625 ) ) ( ON ?auto_81625 ?auto_81626 ) ( CLEAR ?auto_81625 ) ( HAND-EMPTY ) ( not ( = ?auto_81624 ?auto_81626 ) ) ( not ( = ?auto_81625 ?auto_81626 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81625 ?auto_81626 )
      ( MAKE-2PILE ?auto_81624 ?auto_81625 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81627 - BLOCK
      ?auto_81628 - BLOCK
    )
    :vars
    (
      ?auto_81629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81627 ?auto_81628 ) ) ( ON ?auto_81628 ?auto_81629 ) ( CLEAR ?auto_81628 ) ( not ( = ?auto_81627 ?auto_81629 ) ) ( not ( = ?auto_81628 ?auto_81629 ) ) ( HOLDING ?auto_81627 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81627 )
      ( MAKE-2PILE ?auto_81627 ?auto_81628 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81630 - BLOCK
      ?auto_81631 - BLOCK
    )
    :vars
    (
      ?auto_81632 - BLOCK
      ?auto_81634 - BLOCK
      ?auto_81633 - BLOCK
      ?auto_81637 - BLOCK
      ?auto_81636 - BLOCK
      ?auto_81635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81630 ?auto_81631 ) ) ( ON ?auto_81631 ?auto_81632 ) ( not ( = ?auto_81630 ?auto_81632 ) ) ( not ( = ?auto_81631 ?auto_81632 ) ) ( ON ?auto_81630 ?auto_81631 ) ( CLEAR ?auto_81630 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81634 ) ( ON ?auto_81633 ?auto_81634 ) ( ON ?auto_81637 ?auto_81633 ) ( ON ?auto_81636 ?auto_81637 ) ( ON ?auto_81635 ?auto_81636 ) ( ON ?auto_81632 ?auto_81635 ) ( not ( = ?auto_81634 ?auto_81633 ) ) ( not ( = ?auto_81634 ?auto_81637 ) ) ( not ( = ?auto_81634 ?auto_81636 ) ) ( not ( = ?auto_81634 ?auto_81635 ) ) ( not ( = ?auto_81634 ?auto_81632 ) ) ( not ( = ?auto_81634 ?auto_81631 ) ) ( not ( = ?auto_81634 ?auto_81630 ) ) ( not ( = ?auto_81633 ?auto_81637 ) ) ( not ( = ?auto_81633 ?auto_81636 ) ) ( not ( = ?auto_81633 ?auto_81635 ) ) ( not ( = ?auto_81633 ?auto_81632 ) ) ( not ( = ?auto_81633 ?auto_81631 ) ) ( not ( = ?auto_81633 ?auto_81630 ) ) ( not ( = ?auto_81637 ?auto_81636 ) ) ( not ( = ?auto_81637 ?auto_81635 ) ) ( not ( = ?auto_81637 ?auto_81632 ) ) ( not ( = ?auto_81637 ?auto_81631 ) ) ( not ( = ?auto_81637 ?auto_81630 ) ) ( not ( = ?auto_81636 ?auto_81635 ) ) ( not ( = ?auto_81636 ?auto_81632 ) ) ( not ( = ?auto_81636 ?auto_81631 ) ) ( not ( = ?auto_81636 ?auto_81630 ) ) ( not ( = ?auto_81635 ?auto_81632 ) ) ( not ( = ?auto_81635 ?auto_81631 ) ) ( not ( = ?auto_81635 ?auto_81630 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81634 ?auto_81633 ?auto_81637 ?auto_81636 ?auto_81635 ?auto_81632 ?auto_81631 )
      ( MAKE-2PILE ?auto_81630 ?auto_81631 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81643 - BLOCK
      ?auto_81644 - BLOCK
      ?auto_81645 - BLOCK
      ?auto_81646 - BLOCK
      ?auto_81647 - BLOCK
    )
    :vars
    (
      ?auto_81648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81648 ?auto_81647 ) ( CLEAR ?auto_81648 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81643 ) ( ON ?auto_81644 ?auto_81643 ) ( ON ?auto_81645 ?auto_81644 ) ( ON ?auto_81646 ?auto_81645 ) ( ON ?auto_81647 ?auto_81646 ) ( not ( = ?auto_81643 ?auto_81644 ) ) ( not ( = ?auto_81643 ?auto_81645 ) ) ( not ( = ?auto_81643 ?auto_81646 ) ) ( not ( = ?auto_81643 ?auto_81647 ) ) ( not ( = ?auto_81643 ?auto_81648 ) ) ( not ( = ?auto_81644 ?auto_81645 ) ) ( not ( = ?auto_81644 ?auto_81646 ) ) ( not ( = ?auto_81644 ?auto_81647 ) ) ( not ( = ?auto_81644 ?auto_81648 ) ) ( not ( = ?auto_81645 ?auto_81646 ) ) ( not ( = ?auto_81645 ?auto_81647 ) ) ( not ( = ?auto_81645 ?auto_81648 ) ) ( not ( = ?auto_81646 ?auto_81647 ) ) ( not ( = ?auto_81646 ?auto_81648 ) ) ( not ( = ?auto_81647 ?auto_81648 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81648 ?auto_81647 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81649 - BLOCK
      ?auto_81650 - BLOCK
      ?auto_81651 - BLOCK
      ?auto_81652 - BLOCK
      ?auto_81653 - BLOCK
    )
    :vars
    (
      ?auto_81654 - BLOCK
      ?auto_81655 - BLOCK
      ?auto_81656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81654 ?auto_81653 ) ( CLEAR ?auto_81654 ) ( ON-TABLE ?auto_81649 ) ( ON ?auto_81650 ?auto_81649 ) ( ON ?auto_81651 ?auto_81650 ) ( ON ?auto_81652 ?auto_81651 ) ( ON ?auto_81653 ?auto_81652 ) ( not ( = ?auto_81649 ?auto_81650 ) ) ( not ( = ?auto_81649 ?auto_81651 ) ) ( not ( = ?auto_81649 ?auto_81652 ) ) ( not ( = ?auto_81649 ?auto_81653 ) ) ( not ( = ?auto_81649 ?auto_81654 ) ) ( not ( = ?auto_81650 ?auto_81651 ) ) ( not ( = ?auto_81650 ?auto_81652 ) ) ( not ( = ?auto_81650 ?auto_81653 ) ) ( not ( = ?auto_81650 ?auto_81654 ) ) ( not ( = ?auto_81651 ?auto_81652 ) ) ( not ( = ?auto_81651 ?auto_81653 ) ) ( not ( = ?auto_81651 ?auto_81654 ) ) ( not ( = ?auto_81652 ?auto_81653 ) ) ( not ( = ?auto_81652 ?auto_81654 ) ) ( not ( = ?auto_81653 ?auto_81654 ) ) ( HOLDING ?auto_81655 ) ( CLEAR ?auto_81656 ) ( not ( = ?auto_81649 ?auto_81655 ) ) ( not ( = ?auto_81649 ?auto_81656 ) ) ( not ( = ?auto_81650 ?auto_81655 ) ) ( not ( = ?auto_81650 ?auto_81656 ) ) ( not ( = ?auto_81651 ?auto_81655 ) ) ( not ( = ?auto_81651 ?auto_81656 ) ) ( not ( = ?auto_81652 ?auto_81655 ) ) ( not ( = ?auto_81652 ?auto_81656 ) ) ( not ( = ?auto_81653 ?auto_81655 ) ) ( not ( = ?auto_81653 ?auto_81656 ) ) ( not ( = ?auto_81654 ?auto_81655 ) ) ( not ( = ?auto_81654 ?auto_81656 ) ) ( not ( = ?auto_81655 ?auto_81656 ) ) )
    :subtasks
    ( ( !STACK ?auto_81655 ?auto_81656 )
      ( MAKE-5PILE ?auto_81649 ?auto_81650 ?auto_81651 ?auto_81652 ?auto_81653 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82575 - BLOCK
      ?auto_82576 - BLOCK
      ?auto_82577 - BLOCK
      ?auto_82578 - BLOCK
      ?auto_82579 - BLOCK
    )
    :vars
    (
      ?auto_82580 - BLOCK
      ?auto_82581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82580 ?auto_82579 ) ( ON-TABLE ?auto_82575 ) ( ON ?auto_82576 ?auto_82575 ) ( ON ?auto_82577 ?auto_82576 ) ( ON ?auto_82578 ?auto_82577 ) ( ON ?auto_82579 ?auto_82578 ) ( not ( = ?auto_82575 ?auto_82576 ) ) ( not ( = ?auto_82575 ?auto_82577 ) ) ( not ( = ?auto_82575 ?auto_82578 ) ) ( not ( = ?auto_82575 ?auto_82579 ) ) ( not ( = ?auto_82575 ?auto_82580 ) ) ( not ( = ?auto_82576 ?auto_82577 ) ) ( not ( = ?auto_82576 ?auto_82578 ) ) ( not ( = ?auto_82576 ?auto_82579 ) ) ( not ( = ?auto_82576 ?auto_82580 ) ) ( not ( = ?auto_82577 ?auto_82578 ) ) ( not ( = ?auto_82577 ?auto_82579 ) ) ( not ( = ?auto_82577 ?auto_82580 ) ) ( not ( = ?auto_82578 ?auto_82579 ) ) ( not ( = ?auto_82578 ?auto_82580 ) ) ( not ( = ?auto_82579 ?auto_82580 ) ) ( not ( = ?auto_82575 ?auto_82581 ) ) ( not ( = ?auto_82576 ?auto_82581 ) ) ( not ( = ?auto_82577 ?auto_82581 ) ) ( not ( = ?auto_82578 ?auto_82581 ) ) ( not ( = ?auto_82579 ?auto_82581 ) ) ( not ( = ?auto_82580 ?auto_82581 ) ) ( ON ?auto_82581 ?auto_82580 ) ( CLEAR ?auto_82581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82575 ?auto_82576 ?auto_82577 ?auto_82578 ?auto_82579 ?auto_82580 )
      ( MAKE-5PILE ?auto_82575 ?auto_82576 ?auto_82577 ?auto_82578 ?auto_82579 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81665 - BLOCK
      ?auto_81666 - BLOCK
      ?auto_81667 - BLOCK
      ?auto_81668 - BLOCK
      ?auto_81669 - BLOCK
    )
    :vars
    (
      ?auto_81672 - BLOCK
      ?auto_81671 - BLOCK
      ?auto_81670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81672 ?auto_81669 ) ( ON-TABLE ?auto_81665 ) ( ON ?auto_81666 ?auto_81665 ) ( ON ?auto_81667 ?auto_81666 ) ( ON ?auto_81668 ?auto_81667 ) ( ON ?auto_81669 ?auto_81668 ) ( not ( = ?auto_81665 ?auto_81666 ) ) ( not ( = ?auto_81665 ?auto_81667 ) ) ( not ( = ?auto_81665 ?auto_81668 ) ) ( not ( = ?auto_81665 ?auto_81669 ) ) ( not ( = ?auto_81665 ?auto_81672 ) ) ( not ( = ?auto_81666 ?auto_81667 ) ) ( not ( = ?auto_81666 ?auto_81668 ) ) ( not ( = ?auto_81666 ?auto_81669 ) ) ( not ( = ?auto_81666 ?auto_81672 ) ) ( not ( = ?auto_81667 ?auto_81668 ) ) ( not ( = ?auto_81667 ?auto_81669 ) ) ( not ( = ?auto_81667 ?auto_81672 ) ) ( not ( = ?auto_81668 ?auto_81669 ) ) ( not ( = ?auto_81668 ?auto_81672 ) ) ( not ( = ?auto_81669 ?auto_81672 ) ) ( not ( = ?auto_81665 ?auto_81671 ) ) ( not ( = ?auto_81665 ?auto_81670 ) ) ( not ( = ?auto_81666 ?auto_81671 ) ) ( not ( = ?auto_81666 ?auto_81670 ) ) ( not ( = ?auto_81667 ?auto_81671 ) ) ( not ( = ?auto_81667 ?auto_81670 ) ) ( not ( = ?auto_81668 ?auto_81671 ) ) ( not ( = ?auto_81668 ?auto_81670 ) ) ( not ( = ?auto_81669 ?auto_81671 ) ) ( not ( = ?auto_81669 ?auto_81670 ) ) ( not ( = ?auto_81672 ?auto_81671 ) ) ( not ( = ?auto_81672 ?auto_81670 ) ) ( not ( = ?auto_81671 ?auto_81670 ) ) ( ON ?auto_81671 ?auto_81672 ) ( CLEAR ?auto_81671 ) ( HOLDING ?auto_81670 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81670 )
      ( MAKE-5PILE ?auto_81665 ?auto_81666 ?auto_81667 ?auto_81668 ?auto_81669 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81673 - BLOCK
      ?auto_81674 - BLOCK
      ?auto_81675 - BLOCK
      ?auto_81676 - BLOCK
      ?auto_81677 - BLOCK
    )
    :vars
    (
      ?auto_81679 - BLOCK
      ?auto_81678 - BLOCK
      ?auto_81680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81679 ?auto_81677 ) ( ON-TABLE ?auto_81673 ) ( ON ?auto_81674 ?auto_81673 ) ( ON ?auto_81675 ?auto_81674 ) ( ON ?auto_81676 ?auto_81675 ) ( ON ?auto_81677 ?auto_81676 ) ( not ( = ?auto_81673 ?auto_81674 ) ) ( not ( = ?auto_81673 ?auto_81675 ) ) ( not ( = ?auto_81673 ?auto_81676 ) ) ( not ( = ?auto_81673 ?auto_81677 ) ) ( not ( = ?auto_81673 ?auto_81679 ) ) ( not ( = ?auto_81674 ?auto_81675 ) ) ( not ( = ?auto_81674 ?auto_81676 ) ) ( not ( = ?auto_81674 ?auto_81677 ) ) ( not ( = ?auto_81674 ?auto_81679 ) ) ( not ( = ?auto_81675 ?auto_81676 ) ) ( not ( = ?auto_81675 ?auto_81677 ) ) ( not ( = ?auto_81675 ?auto_81679 ) ) ( not ( = ?auto_81676 ?auto_81677 ) ) ( not ( = ?auto_81676 ?auto_81679 ) ) ( not ( = ?auto_81677 ?auto_81679 ) ) ( not ( = ?auto_81673 ?auto_81678 ) ) ( not ( = ?auto_81673 ?auto_81680 ) ) ( not ( = ?auto_81674 ?auto_81678 ) ) ( not ( = ?auto_81674 ?auto_81680 ) ) ( not ( = ?auto_81675 ?auto_81678 ) ) ( not ( = ?auto_81675 ?auto_81680 ) ) ( not ( = ?auto_81676 ?auto_81678 ) ) ( not ( = ?auto_81676 ?auto_81680 ) ) ( not ( = ?auto_81677 ?auto_81678 ) ) ( not ( = ?auto_81677 ?auto_81680 ) ) ( not ( = ?auto_81679 ?auto_81678 ) ) ( not ( = ?auto_81679 ?auto_81680 ) ) ( not ( = ?auto_81678 ?auto_81680 ) ) ( ON ?auto_81678 ?auto_81679 ) ( ON ?auto_81680 ?auto_81678 ) ( CLEAR ?auto_81680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81673 ?auto_81674 ?auto_81675 ?auto_81676 ?auto_81677 ?auto_81679 ?auto_81678 )
      ( MAKE-5PILE ?auto_81673 ?auto_81674 ?auto_81675 ?auto_81676 ?auto_81677 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81684 - BLOCK
      ?auto_81685 - BLOCK
      ?auto_81686 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_81686 ) ( CLEAR ?auto_81685 ) ( ON-TABLE ?auto_81684 ) ( ON ?auto_81685 ?auto_81684 ) ( not ( = ?auto_81684 ?auto_81685 ) ) ( not ( = ?auto_81684 ?auto_81686 ) ) ( not ( = ?auto_81685 ?auto_81686 ) ) )
    :subtasks
    ( ( !STACK ?auto_81686 ?auto_81685 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81687 - BLOCK
      ?auto_81688 - BLOCK
      ?auto_81689 - BLOCK
    )
    :vars
    (
      ?auto_81690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81688 ) ( ON-TABLE ?auto_81687 ) ( ON ?auto_81688 ?auto_81687 ) ( not ( = ?auto_81687 ?auto_81688 ) ) ( not ( = ?auto_81687 ?auto_81689 ) ) ( not ( = ?auto_81688 ?auto_81689 ) ) ( ON ?auto_81689 ?auto_81690 ) ( CLEAR ?auto_81689 ) ( HAND-EMPTY ) ( not ( = ?auto_81687 ?auto_81690 ) ) ( not ( = ?auto_81688 ?auto_81690 ) ) ( not ( = ?auto_81689 ?auto_81690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81689 ?auto_81690 )
      ( MAKE-3PILE ?auto_81687 ?auto_81688 ?auto_81689 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81691 - BLOCK
      ?auto_81692 - BLOCK
      ?auto_81693 - BLOCK
    )
    :vars
    (
      ?auto_81694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81691 ) ( not ( = ?auto_81691 ?auto_81692 ) ) ( not ( = ?auto_81691 ?auto_81693 ) ) ( not ( = ?auto_81692 ?auto_81693 ) ) ( ON ?auto_81693 ?auto_81694 ) ( CLEAR ?auto_81693 ) ( not ( = ?auto_81691 ?auto_81694 ) ) ( not ( = ?auto_81692 ?auto_81694 ) ) ( not ( = ?auto_81693 ?auto_81694 ) ) ( HOLDING ?auto_81692 ) ( CLEAR ?auto_81691 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81691 ?auto_81692 )
      ( MAKE-3PILE ?auto_81691 ?auto_81692 ?auto_81693 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81695 - BLOCK
      ?auto_81696 - BLOCK
      ?auto_81697 - BLOCK
    )
    :vars
    (
      ?auto_81698 - BLOCK
      ?auto_81701 - BLOCK
      ?auto_81700 - BLOCK
      ?auto_81702 - BLOCK
      ?auto_81699 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81695 ) ( not ( = ?auto_81695 ?auto_81696 ) ) ( not ( = ?auto_81695 ?auto_81697 ) ) ( not ( = ?auto_81696 ?auto_81697 ) ) ( ON ?auto_81697 ?auto_81698 ) ( not ( = ?auto_81695 ?auto_81698 ) ) ( not ( = ?auto_81696 ?auto_81698 ) ) ( not ( = ?auto_81697 ?auto_81698 ) ) ( CLEAR ?auto_81695 ) ( ON ?auto_81696 ?auto_81697 ) ( CLEAR ?auto_81696 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81701 ) ( ON ?auto_81700 ?auto_81701 ) ( ON ?auto_81702 ?auto_81700 ) ( ON ?auto_81699 ?auto_81702 ) ( ON ?auto_81698 ?auto_81699 ) ( not ( = ?auto_81701 ?auto_81700 ) ) ( not ( = ?auto_81701 ?auto_81702 ) ) ( not ( = ?auto_81701 ?auto_81699 ) ) ( not ( = ?auto_81701 ?auto_81698 ) ) ( not ( = ?auto_81701 ?auto_81697 ) ) ( not ( = ?auto_81701 ?auto_81696 ) ) ( not ( = ?auto_81700 ?auto_81702 ) ) ( not ( = ?auto_81700 ?auto_81699 ) ) ( not ( = ?auto_81700 ?auto_81698 ) ) ( not ( = ?auto_81700 ?auto_81697 ) ) ( not ( = ?auto_81700 ?auto_81696 ) ) ( not ( = ?auto_81702 ?auto_81699 ) ) ( not ( = ?auto_81702 ?auto_81698 ) ) ( not ( = ?auto_81702 ?auto_81697 ) ) ( not ( = ?auto_81702 ?auto_81696 ) ) ( not ( = ?auto_81699 ?auto_81698 ) ) ( not ( = ?auto_81699 ?auto_81697 ) ) ( not ( = ?auto_81699 ?auto_81696 ) ) ( not ( = ?auto_81695 ?auto_81701 ) ) ( not ( = ?auto_81695 ?auto_81700 ) ) ( not ( = ?auto_81695 ?auto_81702 ) ) ( not ( = ?auto_81695 ?auto_81699 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81701 ?auto_81700 ?auto_81702 ?auto_81699 ?auto_81698 ?auto_81697 )
      ( MAKE-3PILE ?auto_81695 ?auto_81696 ?auto_81697 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81703 - BLOCK
      ?auto_81704 - BLOCK
      ?auto_81705 - BLOCK
    )
    :vars
    (
      ?auto_81706 - BLOCK
      ?auto_81707 - BLOCK
      ?auto_81709 - BLOCK
      ?auto_81710 - BLOCK
      ?auto_81708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81703 ?auto_81704 ) ) ( not ( = ?auto_81703 ?auto_81705 ) ) ( not ( = ?auto_81704 ?auto_81705 ) ) ( ON ?auto_81705 ?auto_81706 ) ( not ( = ?auto_81703 ?auto_81706 ) ) ( not ( = ?auto_81704 ?auto_81706 ) ) ( not ( = ?auto_81705 ?auto_81706 ) ) ( ON ?auto_81704 ?auto_81705 ) ( CLEAR ?auto_81704 ) ( ON-TABLE ?auto_81707 ) ( ON ?auto_81709 ?auto_81707 ) ( ON ?auto_81710 ?auto_81709 ) ( ON ?auto_81708 ?auto_81710 ) ( ON ?auto_81706 ?auto_81708 ) ( not ( = ?auto_81707 ?auto_81709 ) ) ( not ( = ?auto_81707 ?auto_81710 ) ) ( not ( = ?auto_81707 ?auto_81708 ) ) ( not ( = ?auto_81707 ?auto_81706 ) ) ( not ( = ?auto_81707 ?auto_81705 ) ) ( not ( = ?auto_81707 ?auto_81704 ) ) ( not ( = ?auto_81709 ?auto_81710 ) ) ( not ( = ?auto_81709 ?auto_81708 ) ) ( not ( = ?auto_81709 ?auto_81706 ) ) ( not ( = ?auto_81709 ?auto_81705 ) ) ( not ( = ?auto_81709 ?auto_81704 ) ) ( not ( = ?auto_81710 ?auto_81708 ) ) ( not ( = ?auto_81710 ?auto_81706 ) ) ( not ( = ?auto_81710 ?auto_81705 ) ) ( not ( = ?auto_81710 ?auto_81704 ) ) ( not ( = ?auto_81708 ?auto_81706 ) ) ( not ( = ?auto_81708 ?auto_81705 ) ) ( not ( = ?auto_81708 ?auto_81704 ) ) ( not ( = ?auto_81703 ?auto_81707 ) ) ( not ( = ?auto_81703 ?auto_81709 ) ) ( not ( = ?auto_81703 ?auto_81710 ) ) ( not ( = ?auto_81703 ?auto_81708 ) ) ( HOLDING ?auto_81703 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81703 )
      ( MAKE-3PILE ?auto_81703 ?auto_81704 ?auto_81705 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81711 - BLOCK
      ?auto_81712 - BLOCK
      ?auto_81713 - BLOCK
    )
    :vars
    (
      ?auto_81718 - BLOCK
      ?auto_81716 - BLOCK
      ?auto_81717 - BLOCK
      ?auto_81714 - BLOCK
      ?auto_81715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81711 ?auto_81712 ) ) ( not ( = ?auto_81711 ?auto_81713 ) ) ( not ( = ?auto_81712 ?auto_81713 ) ) ( ON ?auto_81713 ?auto_81718 ) ( not ( = ?auto_81711 ?auto_81718 ) ) ( not ( = ?auto_81712 ?auto_81718 ) ) ( not ( = ?auto_81713 ?auto_81718 ) ) ( ON ?auto_81712 ?auto_81713 ) ( ON-TABLE ?auto_81716 ) ( ON ?auto_81717 ?auto_81716 ) ( ON ?auto_81714 ?auto_81717 ) ( ON ?auto_81715 ?auto_81714 ) ( ON ?auto_81718 ?auto_81715 ) ( not ( = ?auto_81716 ?auto_81717 ) ) ( not ( = ?auto_81716 ?auto_81714 ) ) ( not ( = ?auto_81716 ?auto_81715 ) ) ( not ( = ?auto_81716 ?auto_81718 ) ) ( not ( = ?auto_81716 ?auto_81713 ) ) ( not ( = ?auto_81716 ?auto_81712 ) ) ( not ( = ?auto_81717 ?auto_81714 ) ) ( not ( = ?auto_81717 ?auto_81715 ) ) ( not ( = ?auto_81717 ?auto_81718 ) ) ( not ( = ?auto_81717 ?auto_81713 ) ) ( not ( = ?auto_81717 ?auto_81712 ) ) ( not ( = ?auto_81714 ?auto_81715 ) ) ( not ( = ?auto_81714 ?auto_81718 ) ) ( not ( = ?auto_81714 ?auto_81713 ) ) ( not ( = ?auto_81714 ?auto_81712 ) ) ( not ( = ?auto_81715 ?auto_81718 ) ) ( not ( = ?auto_81715 ?auto_81713 ) ) ( not ( = ?auto_81715 ?auto_81712 ) ) ( not ( = ?auto_81711 ?auto_81716 ) ) ( not ( = ?auto_81711 ?auto_81717 ) ) ( not ( = ?auto_81711 ?auto_81714 ) ) ( not ( = ?auto_81711 ?auto_81715 ) ) ( ON ?auto_81711 ?auto_81712 ) ( CLEAR ?auto_81711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81716 ?auto_81717 ?auto_81714 ?auto_81715 ?auto_81718 ?auto_81713 ?auto_81712 )
      ( MAKE-3PILE ?auto_81711 ?auto_81712 ?auto_81713 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81723 - BLOCK
      ?auto_81724 - BLOCK
      ?auto_81725 - BLOCK
      ?auto_81726 - BLOCK
    )
    :vars
    (
      ?auto_81727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81727 ?auto_81726 ) ( CLEAR ?auto_81727 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81723 ) ( ON ?auto_81724 ?auto_81723 ) ( ON ?auto_81725 ?auto_81724 ) ( ON ?auto_81726 ?auto_81725 ) ( not ( = ?auto_81723 ?auto_81724 ) ) ( not ( = ?auto_81723 ?auto_81725 ) ) ( not ( = ?auto_81723 ?auto_81726 ) ) ( not ( = ?auto_81723 ?auto_81727 ) ) ( not ( = ?auto_81724 ?auto_81725 ) ) ( not ( = ?auto_81724 ?auto_81726 ) ) ( not ( = ?auto_81724 ?auto_81727 ) ) ( not ( = ?auto_81725 ?auto_81726 ) ) ( not ( = ?auto_81725 ?auto_81727 ) ) ( not ( = ?auto_81726 ?auto_81727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81727 ?auto_81726 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81728 - BLOCK
      ?auto_81729 - BLOCK
      ?auto_81730 - BLOCK
      ?auto_81731 - BLOCK
    )
    :vars
    (
      ?auto_81732 - BLOCK
      ?auto_81733 - BLOCK
      ?auto_81734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81732 ?auto_81731 ) ( CLEAR ?auto_81732 ) ( ON-TABLE ?auto_81728 ) ( ON ?auto_81729 ?auto_81728 ) ( ON ?auto_81730 ?auto_81729 ) ( ON ?auto_81731 ?auto_81730 ) ( not ( = ?auto_81728 ?auto_81729 ) ) ( not ( = ?auto_81728 ?auto_81730 ) ) ( not ( = ?auto_81728 ?auto_81731 ) ) ( not ( = ?auto_81728 ?auto_81732 ) ) ( not ( = ?auto_81729 ?auto_81730 ) ) ( not ( = ?auto_81729 ?auto_81731 ) ) ( not ( = ?auto_81729 ?auto_81732 ) ) ( not ( = ?auto_81730 ?auto_81731 ) ) ( not ( = ?auto_81730 ?auto_81732 ) ) ( not ( = ?auto_81731 ?auto_81732 ) ) ( HOLDING ?auto_81733 ) ( CLEAR ?auto_81734 ) ( not ( = ?auto_81728 ?auto_81733 ) ) ( not ( = ?auto_81728 ?auto_81734 ) ) ( not ( = ?auto_81729 ?auto_81733 ) ) ( not ( = ?auto_81729 ?auto_81734 ) ) ( not ( = ?auto_81730 ?auto_81733 ) ) ( not ( = ?auto_81730 ?auto_81734 ) ) ( not ( = ?auto_81731 ?auto_81733 ) ) ( not ( = ?auto_81731 ?auto_81734 ) ) ( not ( = ?auto_81732 ?auto_81733 ) ) ( not ( = ?auto_81732 ?auto_81734 ) ) ( not ( = ?auto_81733 ?auto_81734 ) ) )
    :subtasks
    ( ( !STACK ?auto_81733 ?auto_81734 )
      ( MAKE-4PILE ?auto_81728 ?auto_81729 ?auto_81730 ?auto_81731 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81735 - BLOCK
      ?auto_81736 - BLOCK
      ?auto_81737 - BLOCK
      ?auto_81738 - BLOCK
    )
    :vars
    (
      ?auto_81739 - BLOCK
      ?auto_81741 - BLOCK
      ?auto_81740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81739 ?auto_81738 ) ( ON-TABLE ?auto_81735 ) ( ON ?auto_81736 ?auto_81735 ) ( ON ?auto_81737 ?auto_81736 ) ( ON ?auto_81738 ?auto_81737 ) ( not ( = ?auto_81735 ?auto_81736 ) ) ( not ( = ?auto_81735 ?auto_81737 ) ) ( not ( = ?auto_81735 ?auto_81738 ) ) ( not ( = ?auto_81735 ?auto_81739 ) ) ( not ( = ?auto_81736 ?auto_81737 ) ) ( not ( = ?auto_81736 ?auto_81738 ) ) ( not ( = ?auto_81736 ?auto_81739 ) ) ( not ( = ?auto_81737 ?auto_81738 ) ) ( not ( = ?auto_81737 ?auto_81739 ) ) ( not ( = ?auto_81738 ?auto_81739 ) ) ( CLEAR ?auto_81741 ) ( not ( = ?auto_81735 ?auto_81740 ) ) ( not ( = ?auto_81735 ?auto_81741 ) ) ( not ( = ?auto_81736 ?auto_81740 ) ) ( not ( = ?auto_81736 ?auto_81741 ) ) ( not ( = ?auto_81737 ?auto_81740 ) ) ( not ( = ?auto_81737 ?auto_81741 ) ) ( not ( = ?auto_81738 ?auto_81740 ) ) ( not ( = ?auto_81738 ?auto_81741 ) ) ( not ( = ?auto_81739 ?auto_81740 ) ) ( not ( = ?auto_81739 ?auto_81741 ) ) ( not ( = ?auto_81740 ?auto_81741 ) ) ( ON ?auto_81740 ?auto_81739 ) ( CLEAR ?auto_81740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81735 ?auto_81736 ?auto_81737 ?auto_81738 ?auto_81739 )
      ( MAKE-4PILE ?auto_81735 ?auto_81736 ?auto_81737 ?auto_81738 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81742 - BLOCK
      ?auto_81743 - BLOCK
      ?auto_81744 - BLOCK
      ?auto_81745 - BLOCK
    )
    :vars
    (
      ?auto_81747 - BLOCK
      ?auto_81746 - BLOCK
      ?auto_81748 - BLOCK
      ?auto_81749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81747 ?auto_81745 ) ( ON-TABLE ?auto_81742 ) ( ON ?auto_81743 ?auto_81742 ) ( ON ?auto_81744 ?auto_81743 ) ( ON ?auto_81745 ?auto_81744 ) ( not ( = ?auto_81742 ?auto_81743 ) ) ( not ( = ?auto_81742 ?auto_81744 ) ) ( not ( = ?auto_81742 ?auto_81745 ) ) ( not ( = ?auto_81742 ?auto_81747 ) ) ( not ( = ?auto_81743 ?auto_81744 ) ) ( not ( = ?auto_81743 ?auto_81745 ) ) ( not ( = ?auto_81743 ?auto_81747 ) ) ( not ( = ?auto_81744 ?auto_81745 ) ) ( not ( = ?auto_81744 ?auto_81747 ) ) ( not ( = ?auto_81745 ?auto_81747 ) ) ( not ( = ?auto_81742 ?auto_81746 ) ) ( not ( = ?auto_81742 ?auto_81748 ) ) ( not ( = ?auto_81743 ?auto_81746 ) ) ( not ( = ?auto_81743 ?auto_81748 ) ) ( not ( = ?auto_81744 ?auto_81746 ) ) ( not ( = ?auto_81744 ?auto_81748 ) ) ( not ( = ?auto_81745 ?auto_81746 ) ) ( not ( = ?auto_81745 ?auto_81748 ) ) ( not ( = ?auto_81747 ?auto_81746 ) ) ( not ( = ?auto_81747 ?auto_81748 ) ) ( not ( = ?auto_81746 ?auto_81748 ) ) ( ON ?auto_81746 ?auto_81747 ) ( CLEAR ?auto_81746 ) ( HOLDING ?auto_81748 ) ( CLEAR ?auto_81749 ) ( ON-TABLE ?auto_81749 ) ( not ( = ?auto_81749 ?auto_81748 ) ) ( not ( = ?auto_81742 ?auto_81749 ) ) ( not ( = ?auto_81743 ?auto_81749 ) ) ( not ( = ?auto_81744 ?auto_81749 ) ) ( not ( = ?auto_81745 ?auto_81749 ) ) ( not ( = ?auto_81747 ?auto_81749 ) ) ( not ( = ?auto_81746 ?auto_81749 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81749 ?auto_81748 )
      ( MAKE-4PILE ?auto_81742 ?auto_81743 ?auto_81744 ?auto_81745 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82804 - BLOCK
      ?auto_82805 - BLOCK
      ?auto_82806 - BLOCK
      ?auto_82807 - BLOCK
    )
    :vars
    (
      ?auto_82809 - BLOCK
      ?auto_82808 - BLOCK
      ?auto_82810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82809 ?auto_82807 ) ( ON-TABLE ?auto_82804 ) ( ON ?auto_82805 ?auto_82804 ) ( ON ?auto_82806 ?auto_82805 ) ( ON ?auto_82807 ?auto_82806 ) ( not ( = ?auto_82804 ?auto_82805 ) ) ( not ( = ?auto_82804 ?auto_82806 ) ) ( not ( = ?auto_82804 ?auto_82807 ) ) ( not ( = ?auto_82804 ?auto_82809 ) ) ( not ( = ?auto_82805 ?auto_82806 ) ) ( not ( = ?auto_82805 ?auto_82807 ) ) ( not ( = ?auto_82805 ?auto_82809 ) ) ( not ( = ?auto_82806 ?auto_82807 ) ) ( not ( = ?auto_82806 ?auto_82809 ) ) ( not ( = ?auto_82807 ?auto_82809 ) ) ( not ( = ?auto_82804 ?auto_82808 ) ) ( not ( = ?auto_82804 ?auto_82810 ) ) ( not ( = ?auto_82805 ?auto_82808 ) ) ( not ( = ?auto_82805 ?auto_82810 ) ) ( not ( = ?auto_82806 ?auto_82808 ) ) ( not ( = ?auto_82806 ?auto_82810 ) ) ( not ( = ?auto_82807 ?auto_82808 ) ) ( not ( = ?auto_82807 ?auto_82810 ) ) ( not ( = ?auto_82809 ?auto_82808 ) ) ( not ( = ?auto_82809 ?auto_82810 ) ) ( not ( = ?auto_82808 ?auto_82810 ) ) ( ON ?auto_82808 ?auto_82809 ) ( ON ?auto_82810 ?auto_82808 ) ( CLEAR ?auto_82810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82804 ?auto_82805 ?auto_82806 ?auto_82807 ?auto_82809 ?auto_82808 )
      ( MAKE-4PILE ?auto_82804 ?auto_82805 ?auto_82806 ?auto_82807 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81758 - BLOCK
      ?auto_81759 - BLOCK
      ?auto_81760 - BLOCK
      ?auto_81761 - BLOCK
    )
    :vars
    (
      ?auto_81764 - BLOCK
      ?auto_81765 - BLOCK
      ?auto_81763 - BLOCK
      ?auto_81762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81764 ?auto_81761 ) ( ON-TABLE ?auto_81758 ) ( ON ?auto_81759 ?auto_81758 ) ( ON ?auto_81760 ?auto_81759 ) ( ON ?auto_81761 ?auto_81760 ) ( not ( = ?auto_81758 ?auto_81759 ) ) ( not ( = ?auto_81758 ?auto_81760 ) ) ( not ( = ?auto_81758 ?auto_81761 ) ) ( not ( = ?auto_81758 ?auto_81764 ) ) ( not ( = ?auto_81759 ?auto_81760 ) ) ( not ( = ?auto_81759 ?auto_81761 ) ) ( not ( = ?auto_81759 ?auto_81764 ) ) ( not ( = ?auto_81760 ?auto_81761 ) ) ( not ( = ?auto_81760 ?auto_81764 ) ) ( not ( = ?auto_81761 ?auto_81764 ) ) ( not ( = ?auto_81758 ?auto_81765 ) ) ( not ( = ?auto_81758 ?auto_81763 ) ) ( not ( = ?auto_81759 ?auto_81765 ) ) ( not ( = ?auto_81759 ?auto_81763 ) ) ( not ( = ?auto_81760 ?auto_81765 ) ) ( not ( = ?auto_81760 ?auto_81763 ) ) ( not ( = ?auto_81761 ?auto_81765 ) ) ( not ( = ?auto_81761 ?auto_81763 ) ) ( not ( = ?auto_81764 ?auto_81765 ) ) ( not ( = ?auto_81764 ?auto_81763 ) ) ( not ( = ?auto_81765 ?auto_81763 ) ) ( ON ?auto_81765 ?auto_81764 ) ( not ( = ?auto_81762 ?auto_81763 ) ) ( not ( = ?auto_81758 ?auto_81762 ) ) ( not ( = ?auto_81759 ?auto_81762 ) ) ( not ( = ?auto_81760 ?auto_81762 ) ) ( not ( = ?auto_81761 ?auto_81762 ) ) ( not ( = ?auto_81764 ?auto_81762 ) ) ( not ( = ?auto_81765 ?auto_81762 ) ) ( ON ?auto_81763 ?auto_81765 ) ( CLEAR ?auto_81763 ) ( HOLDING ?auto_81762 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81762 )
      ( MAKE-4PILE ?auto_81758 ?auto_81759 ?auto_81760 ?auto_81761 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81766 - BLOCK
      ?auto_81767 - BLOCK
      ?auto_81768 - BLOCK
      ?auto_81769 - BLOCK
    )
    :vars
    (
      ?auto_81770 - BLOCK
      ?auto_81771 - BLOCK
      ?auto_81773 - BLOCK
      ?auto_81772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81770 ?auto_81769 ) ( ON-TABLE ?auto_81766 ) ( ON ?auto_81767 ?auto_81766 ) ( ON ?auto_81768 ?auto_81767 ) ( ON ?auto_81769 ?auto_81768 ) ( not ( = ?auto_81766 ?auto_81767 ) ) ( not ( = ?auto_81766 ?auto_81768 ) ) ( not ( = ?auto_81766 ?auto_81769 ) ) ( not ( = ?auto_81766 ?auto_81770 ) ) ( not ( = ?auto_81767 ?auto_81768 ) ) ( not ( = ?auto_81767 ?auto_81769 ) ) ( not ( = ?auto_81767 ?auto_81770 ) ) ( not ( = ?auto_81768 ?auto_81769 ) ) ( not ( = ?auto_81768 ?auto_81770 ) ) ( not ( = ?auto_81769 ?auto_81770 ) ) ( not ( = ?auto_81766 ?auto_81771 ) ) ( not ( = ?auto_81766 ?auto_81773 ) ) ( not ( = ?auto_81767 ?auto_81771 ) ) ( not ( = ?auto_81767 ?auto_81773 ) ) ( not ( = ?auto_81768 ?auto_81771 ) ) ( not ( = ?auto_81768 ?auto_81773 ) ) ( not ( = ?auto_81769 ?auto_81771 ) ) ( not ( = ?auto_81769 ?auto_81773 ) ) ( not ( = ?auto_81770 ?auto_81771 ) ) ( not ( = ?auto_81770 ?auto_81773 ) ) ( not ( = ?auto_81771 ?auto_81773 ) ) ( ON ?auto_81771 ?auto_81770 ) ( not ( = ?auto_81772 ?auto_81773 ) ) ( not ( = ?auto_81766 ?auto_81772 ) ) ( not ( = ?auto_81767 ?auto_81772 ) ) ( not ( = ?auto_81768 ?auto_81772 ) ) ( not ( = ?auto_81769 ?auto_81772 ) ) ( not ( = ?auto_81770 ?auto_81772 ) ) ( not ( = ?auto_81771 ?auto_81772 ) ) ( ON ?auto_81773 ?auto_81771 ) ( ON ?auto_81772 ?auto_81773 ) ( CLEAR ?auto_81772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81766 ?auto_81767 ?auto_81768 ?auto_81769 ?auto_81770 ?auto_81771 ?auto_81773 )
      ( MAKE-4PILE ?auto_81766 ?auto_81767 ?auto_81768 ?auto_81769 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81778 - BLOCK
      ?auto_81779 - BLOCK
      ?auto_81780 - BLOCK
      ?auto_81781 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_81781 ) ( CLEAR ?auto_81780 ) ( ON-TABLE ?auto_81778 ) ( ON ?auto_81779 ?auto_81778 ) ( ON ?auto_81780 ?auto_81779 ) ( not ( = ?auto_81778 ?auto_81779 ) ) ( not ( = ?auto_81778 ?auto_81780 ) ) ( not ( = ?auto_81778 ?auto_81781 ) ) ( not ( = ?auto_81779 ?auto_81780 ) ) ( not ( = ?auto_81779 ?auto_81781 ) ) ( not ( = ?auto_81780 ?auto_81781 ) ) )
    :subtasks
    ( ( !STACK ?auto_81781 ?auto_81780 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81782 - BLOCK
      ?auto_81783 - BLOCK
      ?auto_81784 - BLOCK
      ?auto_81785 - BLOCK
    )
    :vars
    (
      ?auto_81786 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81784 ) ( ON-TABLE ?auto_81782 ) ( ON ?auto_81783 ?auto_81782 ) ( ON ?auto_81784 ?auto_81783 ) ( not ( = ?auto_81782 ?auto_81783 ) ) ( not ( = ?auto_81782 ?auto_81784 ) ) ( not ( = ?auto_81782 ?auto_81785 ) ) ( not ( = ?auto_81783 ?auto_81784 ) ) ( not ( = ?auto_81783 ?auto_81785 ) ) ( not ( = ?auto_81784 ?auto_81785 ) ) ( ON ?auto_81785 ?auto_81786 ) ( CLEAR ?auto_81785 ) ( HAND-EMPTY ) ( not ( = ?auto_81782 ?auto_81786 ) ) ( not ( = ?auto_81783 ?auto_81786 ) ) ( not ( = ?auto_81784 ?auto_81786 ) ) ( not ( = ?auto_81785 ?auto_81786 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81785 ?auto_81786 )
      ( MAKE-4PILE ?auto_81782 ?auto_81783 ?auto_81784 ?auto_81785 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81787 - BLOCK
      ?auto_81788 - BLOCK
      ?auto_81789 - BLOCK
      ?auto_81790 - BLOCK
    )
    :vars
    (
      ?auto_81791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81787 ) ( ON ?auto_81788 ?auto_81787 ) ( not ( = ?auto_81787 ?auto_81788 ) ) ( not ( = ?auto_81787 ?auto_81789 ) ) ( not ( = ?auto_81787 ?auto_81790 ) ) ( not ( = ?auto_81788 ?auto_81789 ) ) ( not ( = ?auto_81788 ?auto_81790 ) ) ( not ( = ?auto_81789 ?auto_81790 ) ) ( ON ?auto_81790 ?auto_81791 ) ( CLEAR ?auto_81790 ) ( not ( = ?auto_81787 ?auto_81791 ) ) ( not ( = ?auto_81788 ?auto_81791 ) ) ( not ( = ?auto_81789 ?auto_81791 ) ) ( not ( = ?auto_81790 ?auto_81791 ) ) ( HOLDING ?auto_81789 ) ( CLEAR ?auto_81788 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81787 ?auto_81788 ?auto_81789 )
      ( MAKE-4PILE ?auto_81787 ?auto_81788 ?auto_81789 ?auto_81790 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81792 - BLOCK
      ?auto_81793 - BLOCK
      ?auto_81794 - BLOCK
      ?auto_81795 - BLOCK
    )
    :vars
    (
      ?auto_81796 - BLOCK
      ?auto_81797 - BLOCK
      ?auto_81799 - BLOCK
      ?auto_81798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81792 ) ( ON ?auto_81793 ?auto_81792 ) ( not ( = ?auto_81792 ?auto_81793 ) ) ( not ( = ?auto_81792 ?auto_81794 ) ) ( not ( = ?auto_81792 ?auto_81795 ) ) ( not ( = ?auto_81793 ?auto_81794 ) ) ( not ( = ?auto_81793 ?auto_81795 ) ) ( not ( = ?auto_81794 ?auto_81795 ) ) ( ON ?auto_81795 ?auto_81796 ) ( not ( = ?auto_81792 ?auto_81796 ) ) ( not ( = ?auto_81793 ?auto_81796 ) ) ( not ( = ?auto_81794 ?auto_81796 ) ) ( not ( = ?auto_81795 ?auto_81796 ) ) ( CLEAR ?auto_81793 ) ( ON ?auto_81794 ?auto_81795 ) ( CLEAR ?auto_81794 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81797 ) ( ON ?auto_81799 ?auto_81797 ) ( ON ?auto_81798 ?auto_81799 ) ( ON ?auto_81796 ?auto_81798 ) ( not ( = ?auto_81797 ?auto_81799 ) ) ( not ( = ?auto_81797 ?auto_81798 ) ) ( not ( = ?auto_81797 ?auto_81796 ) ) ( not ( = ?auto_81797 ?auto_81795 ) ) ( not ( = ?auto_81797 ?auto_81794 ) ) ( not ( = ?auto_81799 ?auto_81798 ) ) ( not ( = ?auto_81799 ?auto_81796 ) ) ( not ( = ?auto_81799 ?auto_81795 ) ) ( not ( = ?auto_81799 ?auto_81794 ) ) ( not ( = ?auto_81798 ?auto_81796 ) ) ( not ( = ?auto_81798 ?auto_81795 ) ) ( not ( = ?auto_81798 ?auto_81794 ) ) ( not ( = ?auto_81792 ?auto_81797 ) ) ( not ( = ?auto_81792 ?auto_81799 ) ) ( not ( = ?auto_81792 ?auto_81798 ) ) ( not ( = ?auto_81793 ?auto_81797 ) ) ( not ( = ?auto_81793 ?auto_81799 ) ) ( not ( = ?auto_81793 ?auto_81798 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81797 ?auto_81799 ?auto_81798 ?auto_81796 ?auto_81795 )
      ( MAKE-4PILE ?auto_81792 ?auto_81793 ?auto_81794 ?auto_81795 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81800 - BLOCK
      ?auto_81801 - BLOCK
      ?auto_81802 - BLOCK
      ?auto_81803 - BLOCK
    )
    :vars
    (
      ?auto_81805 - BLOCK
      ?auto_81804 - BLOCK
      ?auto_81806 - BLOCK
      ?auto_81807 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81800 ) ( not ( = ?auto_81800 ?auto_81801 ) ) ( not ( = ?auto_81800 ?auto_81802 ) ) ( not ( = ?auto_81800 ?auto_81803 ) ) ( not ( = ?auto_81801 ?auto_81802 ) ) ( not ( = ?auto_81801 ?auto_81803 ) ) ( not ( = ?auto_81802 ?auto_81803 ) ) ( ON ?auto_81803 ?auto_81805 ) ( not ( = ?auto_81800 ?auto_81805 ) ) ( not ( = ?auto_81801 ?auto_81805 ) ) ( not ( = ?auto_81802 ?auto_81805 ) ) ( not ( = ?auto_81803 ?auto_81805 ) ) ( ON ?auto_81802 ?auto_81803 ) ( CLEAR ?auto_81802 ) ( ON-TABLE ?auto_81804 ) ( ON ?auto_81806 ?auto_81804 ) ( ON ?auto_81807 ?auto_81806 ) ( ON ?auto_81805 ?auto_81807 ) ( not ( = ?auto_81804 ?auto_81806 ) ) ( not ( = ?auto_81804 ?auto_81807 ) ) ( not ( = ?auto_81804 ?auto_81805 ) ) ( not ( = ?auto_81804 ?auto_81803 ) ) ( not ( = ?auto_81804 ?auto_81802 ) ) ( not ( = ?auto_81806 ?auto_81807 ) ) ( not ( = ?auto_81806 ?auto_81805 ) ) ( not ( = ?auto_81806 ?auto_81803 ) ) ( not ( = ?auto_81806 ?auto_81802 ) ) ( not ( = ?auto_81807 ?auto_81805 ) ) ( not ( = ?auto_81807 ?auto_81803 ) ) ( not ( = ?auto_81807 ?auto_81802 ) ) ( not ( = ?auto_81800 ?auto_81804 ) ) ( not ( = ?auto_81800 ?auto_81806 ) ) ( not ( = ?auto_81800 ?auto_81807 ) ) ( not ( = ?auto_81801 ?auto_81804 ) ) ( not ( = ?auto_81801 ?auto_81806 ) ) ( not ( = ?auto_81801 ?auto_81807 ) ) ( HOLDING ?auto_81801 ) ( CLEAR ?auto_81800 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81800 ?auto_81801 )
      ( MAKE-4PILE ?auto_81800 ?auto_81801 ?auto_81802 ?auto_81803 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81808 - BLOCK
      ?auto_81809 - BLOCK
      ?auto_81810 - BLOCK
      ?auto_81811 - BLOCK
    )
    :vars
    (
      ?auto_81815 - BLOCK
      ?auto_81814 - BLOCK
      ?auto_81813 - BLOCK
      ?auto_81812 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81808 ) ( not ( = ?auto_81808 ?auto_81809 ) ) ( not ( = ?auto_81808 ?auto_81810 ) ) ( not ( = ?auto_81808 ?auto_81811 ) ) ( not ( = ?auto_81809 ?auto_81810 ) ) ( not ( = ?auto_81809 ?auto_81811 ) ) ( not ( = ?auto_81810 ?auto_81811 ) ) ( ON ?auto_81811 ?auto_81815 ) ( not ( = ?auto_81808 ?auto_81815 ) ) ( not ( = ?auto_81809 ?auto_81815 ) ) ( not ( = ?auto_81810 ?auto_81815 ) ) ( not ( = ?auto_81811 ?auto_81815 ) ) ( ON ?auto_81810 ?auto_81811 ) ( ON-TABLE ?auto_81814 ) ( ON ?auto_81813 ?auto_81814 ) ( ON ?auto_81812 ?auto_81813 ) ( ON ?auto_81815 ?auto_81812 ) ( not ( = ?auto_81814 ?auto_81813 ) ) ( not ( = ?auto_81814 ?auto_81812 ) ) ( not ( = ?auto_81814 ?auto_81815 ) ) ( not ( = ?auto_81814 ?auto_81811 ) ) ( not ( = ?auto_81814 ?auto_81810 ) ) ( not ( = ?auto_81813 ?auto_81812 ) ) ( not ( = ?auto_81813 ?auto_81815 ) ) ( not ( = ?auto_81813 ?auto_81811 ) ) ( not ( = ?auto_81813 ?auto_81810 ) ) ( not ( = ?auto_81812 ?auto_81815 ) ) ( not ( = ?auto_81812 ?auto_81811 ) ) ( not ( = ?auto_81812 ?auto_81810 ) ) ( not ( = ?auto_81808 ?auto_81814 ) ) ( not ( = ?auto_81808 ?auto_81813 ) ) ( not ( = ?auto_81808 ?auto_81812 ) ) ( not ( = ?auto_81809 ?auto_81814 ) ) ( not ( = ?auto_81809 ?auto_81813 ) ) ( not ( = ?auto_81809 ?auto_81812 ) ) ( CLEAR ?auto_81808 ) ( ON ?auto_81809 ?auto_81810 ) ( CLEAR ?auto_81809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81814 ?auto_81813 ?auto_81812 ?auto_81815 ?auto_81811 ?auto_81810 )
      ( MAKE-4PILE ?auto_81808 ?auto_81809 ?auto_81810 ?auto_81811 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81816 - BLOCK
      ?auto_81817 - BLOCK
      ?auto_81818 - BLOCK
      ?auto_81819 - BLOCK
    )
    :vars
    (
      ?auto_81820 - BLOCK
      ?auto_81823 - BLOCK
      ?auto_81822 - BLOCK
      ?auto_81821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81816 ?auto_81817 ) ) ( not ( = ?auto_81816 ?auto_81818 ) ) ( not ( = ?auto_81816 ?auto_81819 ) ) ( not ( = ?auto_81817 ?auto_81818 ) ) ( not ( = ?auto_81817 ?auto_81819 ) ) ( not ( = ?auto_81818 ?auto_81819 ) ) ( ON ?auto_81819 ?auto_81820 ) ( not ( = ?auto_81816 ?auto_81820 ) ) ( not ( = ?auto_81817 ?auto_81820 ) ) ( not ( = ?auto_81818 ?auto_81820 ) ) ( not ( = ?auto_81819 ?auto_81820 ) ) ( ON ?auto_81818 ?auto_81819 ) ( ON-TABLE ?auto_81823 ) ( ON ?auto_81822 ?auto_81823 ) ( ON ?auto_81821 ?auto_81822 ) ( ON ?auto_81820 ?auto_81821 ) ( not ( = ?auto_81823 ?auto_81822 ) ) ( not ( = ?auto_81823 ?auto_81821 ) ) ( not ( = ?auto_81823 ?auto_81820 ) ) ( not ( = ?auto_81823 ?auto_81819 ) ) ( not ( = ?auto_81823 ?auto_81818 ) ) ( not ( = ?auto_81822 ?auto_81821 ) ) ( not ( = ?auto_81822 ?auto_81820 ) ) ( not ( = ?auto_81822 ?auto_81819 ) ) ( not ( = ?auto_81822 ?auto_81818 ) ) ( not ( = ?auto_81821 ?auto_81820 ) ) ( not ( = ?auto_81821 ?auto_81819 ) ) ( not ( = ?auto_81821 ?auto_81818 ) ) ( not ( = ?auto_81816 ?auto_81823 ) ) ( not ( = ?auto_81816 ?auto_81822 ) ) ( not ( = ?auto_81816 ?auto_81821 ) ) ( not ( = ?auto_81817 ?auto_81823 ) ) ( not ( = ?auto_81817 ?auto_81822 ) ) ( not ( = ?auto_81817 ?auto_81821 ) ) ( ON ?auto_81817 ?auto_81818 ) ( CLEAR ?auto_81817 ) ( HOLDING ?auto_81816 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81816 )
      ( MAKE-4PILE ?auto_81816 ?auto_81817 ?auto_81818 ?auto_81819 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81824 - BLOCK
      ?auto_81825 - BLOCK
      ?auto_81826 - BLOCK
      ?auto_81827 - BLOCK
    )
    :vars
    (
      ?auto_81828 - BLOCK
      ?auto_81831 - BLOCK
      ?auto_81830 - BLOCK
      ?auto_81829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81824 ?auto_81825 ) ) ( not ( = ?auto_81824 ?auto_81826 ) ) ( not ( = ?auto_81824 ?auto_81827 ) ) ( not ( = ?auto_81825 ?auto_81826 ) ) ( not ( = ?auto_81825 ?auto_81827 ) ) ( not ( = ?auto_81826 ?auto_81827 ) ) ( ON ?auto_81827 ?auto_81828 ) ( not ( = ?auto_81824 ?auto_81828 ) ) ( not ( = ?auto_81825 ?auto_81828 ) ) ( not ( = ?auto_81826 ?auto_81828 ) ) ( not ( = ?auto_81827 ?auto_81828 ) ) ( ON ?auto_81826 ?auto_81827 ) ( ON-TABLE ?auto_81831 ) ( ON ?auto_81830 ?auto_81831 ) ( ON ?auto_81829 ?auto_81830 ) ( ON ?auto_81828 ?auto_81829 ) ( not ( = ?auto_81831 ?auto_81830 ) ) ( not ( = ?auto_81831 ?auto_81829 ) ) ( not ( = ?auto_81831 ?auto_81828 ) ) ( not ( = ?auto_81831 ?auto_81827 ) ) ( not ( = ?auto_81831 ?auto_81826 ) ) ( not ( = ?auto_81830 ?auto_81829 ) ) ( not ( = ?auto_81830 ?auto_81828 ) ) ( not ( = ?auto_81830 ?auto_81827 ) ) ( not ( = ?auto_81830 ?auto_81826 ) ) ( not ( = ?auto_81829 ?auto_81828 ) ) ( not ( = ?auto_81829 ?auto_81827 ) ) ( not ( = ?auto_81829 ?auto_81826 ) ) ( not ( = ?auto_81824 ?auto_81831 ) ) ( not ( = ?auto_81824 ?auto_81830 ) ) ( not ( = ?auto_81824 ?auto_81829 ) ) ( not ( = ?auto_81825 ?auto_81831 ) ) ( not ( = ?auto_81825 ?auto_81830 ) ) ( not ( = ?auto_81825 ?auto_81829 ) ) ( ON ?auto_81825 ?auto_81826 ) ( ON ?auto_81824 ?auto_81825 ) ( CLEAR ?auto_81824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81831 ?auto_81830 ?auto_81829 ?auto_81828 ?auto_81827 ?auto_81826 ?auto_81825 )
      ( MAKE-4PILE ?auto_81824 ?auto_81825 ?auto_81826 ?auto_81827 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81835 - BLOCK
      ?auto_81836 - BLOCK
      ?auto_81837 - BLOCK
    )
    :vars
    (
      ?auto_81838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81838 ?auto_81837 ) ( CLEAR ?auto_81838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81835 ) ( ON ?auto_81836 ?auto_81835 ) ( ON ?auto_81837 ?auto_81836 ) ( not ( = ?auto_81835 ?auto_81836 ) ) ( not ( = ?auto_81835 ?auto_81837 ) ) ( not ( = ?auto_81835 ?auto_81838 ) ) ( not ( = ?auto_81836 ?auto_81837 ) ) ( not ( = ?auto_81836 ?auto_81838 ) ) ( not ( = ?auto_81837 ?auto_81838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81838 ?auto_81837 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81839 - BLOCK
      ?auto_81840 - BLOCK
      ?auto_81841 - BLOCK
    )
    :vars
    (
      ?auto_81842 - BLOCK
      ?auto_81843 - BLOCK
      ?auto_81844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81842 ?auto_81841 ) ( CLEAR ?auto_81842 ) ( ON-TABLE ?auto_81839 ) ( ON ?auto_81840 ?auto_81839 ) ( ON ?auto_81841 ?auto_81840 ) ( not ( = ?auto_81839 ?auto_81840 ) ) ( not ( = ?auto_81839 ?auto_81841 ) ) ( not ( = ?auto_81839 ?auto_81842 ) ) ( not ( = ?auto_81840 ?auto_81841 ) ) ( not ( = ?auto_81840 ?auto_81842 ) ) ( not ( = ?auto_81841 ?auto_81842 ) ) ( HOLDING ?auto_81843 ) ( CLEAR ?auto_81844 ) ( not ( = ?auto_81839 ?auto_81843 ) ) ( not ( = ?auto_81839 ?auto_81844 ) ) ( not ( = ?auto_81840 ?auto_81843 ) ) ( not ( = ?auto_81840 ?auto_81844 ) ) ( not ( = ?auto_81841 ?auto_81843 ) ) ( not ( = ?auto_81841 ?auto_81844 ) ) ( not ( = ?auto_81842 ?auto_81843 ) ) ( not ( = ?auto_81842 ?auto_81844 ) ) ( not ( = ?auto_81843 ?auto_81844 ) ) )
    :subtasks
    ( ( !STACK ?auto_81843 ?auto_81844 )
      ( MAKE-3PILE ?auto_81839 ?auto_81840 ?auto_81841 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81845 - BLOCK
      ?auto_81846 - BLOCK
      ?auto_81847 - BLOCK
    )
    :vars
    (
      ?auto_81849 - BLOCK
      ?auto_81850 - BLOCK
      ?auto_81848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81849 ?auto_81847 ) ( ON-TABLE ?auto_81845 ) ( ON ?auto_81846 ?auto_81845 ) ( ON ?auto_81847 ?auto_81846 ) ( not ( = ?auto_81845 ?auto_81846 ) ) ( not ( = ?auto_81845 ?auto_81847 ) ) ( not ( = ?auto_81845 ?auto_81849 ) ) ( not ( = ?auto_81846 ?auto_81847 ) ) ( not ( = ?auto_81846 ?auto_81849 ) ) ( not ( = ?auto_81847 ?auto_81849 ) ) ( CLEAR ?auto_81850 ) ( not ( = ?auto_81845 ?auto_81848 ) ) ( not ( = ?auto_81845 ?auto_81850 ) ) ( not ( = ?auto_81846 ?auto_81848 ) ) ( not ( = ?auto_81846 ?auto_81850 ) ) ( not ( = ?auto_81847 ?auto_81848 ) ) ( not ( = ?auto_81847 ?auto_81850 ) ) ( not ( = ?auto_81849 ?auto_81848 ) ) ( not ( = ?auto_81849 ?auto_81850 ) ) ( not ( = ?auto_81848 ?auto_81850 ) ) ( ON ?auto_81848 ?auto_81849 ) ( CLEAR ?auto_81848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81845 ?auto_81846 ?auto_81847 ?auto_81849 )
      ( MAKE-3PILE ?auto_81845 ?auto_81846 ?auto_81847 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81851 - BLOCK
      ?auto_81852 - BLOCK
      ?auto_81853 - BLOCK
    )
    :vars
    (
      ?auto_81854 - BLOCK
      ?auto_81855 - BLOCK
      ?auto_81856 - BLOCK
      ?auto_81857 - BLOCK
      ?auto_81858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81854 ?auto_81853 ) ( ON-TABLE ?auto_81851 ) ( ON ?auto_81852 ?auto_81851 ) ( ON ?auto_81853 ?auto_81852 ) ( not ( = ?auto_81851 ?auto_81852 ) ) ( not ( = ?auto_81851 ?auto_81853 ) ) ( not ( = ?auto_81851 ?auto_81854 ) ) ( not ( = ?auto_81852 ?auto_81853 ) ) ( not ( = ?auto_81852 ?auto_81854 ) ) ( not ( = ?auto_81853 ?auto_81854 ) ) ( not ( = ?auto_81851 ?auto_81855 ) ) ( not ( = ?auto_81851 ?auto_81856 ) ) ( not ( = ?auto_81852 ?auto_81855 ) ) ( not ( = ?auto_81852 ?auto_81856 ) ) ( not ( = ?auto_81853 ?auto_81855 ) ) ( not ( = ?auto_81853 ?auto_81856 ) ) ( not ( = ?auto_81854 ?auto_81855 ) ) ( not ( = ?auto_81854 ?auto_81856 ) ) ( not ( = ?auto_81855 ?auto_81856 ) ) ( ON ?auto_81855 ?auto_81854 ) ( CLEAR ?auto_81855 ) ( HOLDING ?auto_81856 ) ( CLEAR ?auto_81857 ) ( ON-TABLE ?auto_81858 ) ( ON ?auto_81857 ?auto_81858 ) ( not ( = ?auto_81858 ?auto_81857 ) ) ( not ( = ?auto_81858 ?auto_81856 ) ) ( not ( = ?auto_81857 ?auto_81856 ) ) ( not ( = ?auto_81851 ?auto_81857 ) ) ( not ( = ?auto_81851 ?auto_81858 ) ) ( not ( = ?auto_81852 ?auto_81857 ) ) ( not ( = ?auto_81852 ?auto_81858 ) ) ( not ( = ?auto_81853 ?auto_81857 ) ) ( not ( = ?auto_81853 ?auto_81858 ) ) ( not ( = ?auto_81854 ?auto_81857 ) ) ( not ( = ?auto_81854 ?auto_81858 ) ) ( not ( = ?auto_81855 ?auto_81857 ) ) ( not ( = ?auto_81855 ?auto_81858 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81858 ?auto_81857 ?auto_81856 )
      ( MAKE-3PILE ?auto_81851 ?auto_81852 ?auto_81853 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81859 - BLOCK
      ?auto_81860 - BLOCK
      ?auto_81861 - BLOCK
    )
    :vars
    (
      ?auto_81863 - BLOCK
      ?auto_81862 - BLOCK
      ?auto_81865 - BLOCK
      ?auto_81864 - BLOCK
      ?auto_81866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81863 ?auto_81861 ) ( ON-TABLE ?auto_81859 ) ( ON ?auto_81860 ?auto_81859 ) ( ON ?auto_81861 ?auto_81860 ) ( not ( = ?auto_81859 ?auto_81860 ) ) ( not ( = ?auto_81859 ?auto_81861 ) ) ( not ( = ?auto_81859 ?auto_81863 ) ) ( not ( = ?auto_81860 ?auto_81861 ) ) ( not ( = ?auto_81860 ?auto_81863 ) ) ( not ( = ?auto_81861 ?auto_81863 ) ) ( not ( = ?auto_81859 ?auto_81862 ) ) ( not ( = ?auto_81859 ?auto_81865 ) ) ( not ( = ?auto_81860 ?auto_81862 ) ) ( not ( = ?auto_81860 ?auto_81865 ) ) ( not ( = ?auto_81861 ?auto_81862 ) ) ( not ( = ?auto_81861 ?auto_81865 ) ) ( not ( = ?auto_81863 ?auto_81862 ) ) ( not ( = ?auto_81863 ?auto_81865 ) ) ( not ( = ?auto_81862 ?auto_81865 ) ) ( ON ?auto_81862 ?auto_81863 ) ( CLEAR ?auto_81864 ) ( ON-TABLE ?auto_81866 ) ( ON ?auto_81864 ?auto_81866 ) ( not ( = ?auto_81866 ?auto_81864 ) ) ( not ( = ?auto_81866 ?auto_81865 ) ) ( not ( = ?auto_81864 ?auto_81865 ) ) ( not ( = ?auto_81859 ?auto_81864 ) ) ( not ( = ?auto_81859 ?auto_81866 ) ) ( not ( = ?auto_81860 ?auto_81864 ) ) ( not ( = ?auto_81860 ?auto_81866 ) ) ( not ( = ?auto_81861 ?auto_81864 ) ) ( not ( = ?auto_81861 ?auto_81866 ) ) ( not ( = ?auto_81863 ?auto_81864 ) ) ( not ( = ?auto_81863 ?auto_81866 ) ) ( not ( = ?auto_81862 ?auto_81864 ) ) ( not ( = ?auto_81862 ?auto_81866 ) ) ( ON ?auto_81865 ?auto_81862 ) ( CLEAR ?auto_81865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81859 ?auto_81860 ?auto_81861 ?auto_81863 ?auto_81862 )
      ( MAKE-3PILE ?auto_81859 ?auto_81860 ?auto_81861 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81867 - BLOCK
      ?auto_81868 - BLOCK
      ?auto_81869 - BLOCK
    )
    :vars
    (
      ?auto_81871 - BLOCK
      ?auto_81872 - BLOCK
      ?auto_81874 - BLOCK
      ?auto_81873 - BLOCK
      ?auto_81870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81871 ?auto_81869 ) ( ON-TABLE ?auto_81867 ) ( ON ?auto_81868 ?auto_81867 ) ( ON ?auto_81869 ?auto_81868 ) ( not ( = ?auto_81867 ?auto_81868 ) ) ( not ( = ?auto_81867 ?auto_81869 ) ) ( not ( = ?auto_81867 ?auto_81871 ) ) ( not ( = ?auto_81868 ?auto_81869 ) ) ( not ( = ?auto_81868 ?auto_81871 ) ) ( not ( = ?auto_81869 ?auto_81871 ) ) ( not ( = ?auto_81867 ?auto_81872 ) ) ( not ( = ?auto_81867 ?auto_81874 ) ) ( not ( = ?auto_81868 ?auto_81872 ) ) ( not ( = ?auto_81868 ?auto_81874 ) ) ( not ( = ?auto_81869 ?auto_81872 ) ) ( not ( = ?auto_81869 ?auto_81874 ) ) ( not ( = ?auto_81871 ?auto_81872 ) ) ( not ( = ?auto_81871 ?auto_81874 ) ) ( not ( = ?auto_81872 ?auto_81874 ) ) ( ON ?auto_81872 ?auto_81871 ) ( ON-TABLE ?auto_81873 ) ( not ( = ?auto_81873 ?auto_81870 ) ) ( not ( = ?auto_81873 ?auto_81874 ) ) ( not ( = ?auto_81870 ?auto_81874 ) ) ( not ( = ?auto_81867 ?auto_81870 ) ) ( not ( = ?auto_81867 ?auto_81873 ) ) ( not ( = ?auto_81868 ?auto_81870 ) ) ( not ( = ?auto_81868 ?auto_81873 ) ) ( not ( = ?auto_81869 ?auto_81870 ) ) ( not ( = ?auto_81869 ?auto_81873 ) ) ( not ( = ?auto_81871 ?auto_81870 ) ) ( not ( = ?auto_81871 ?auto_81873 ) ) ( not ( = ?auto_81872 ?auto_81870 ) ) ( not ( = ?auto_81872 ?auto_81873 ) ) ( ON ?auto_81874 ?auto_81872 ) ( CLEAR ?auto_81874 ) ( HOLDING ?auto_81870 ) ( CLEAR ?auto_81873 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81873 ?auto_81870 )
      ( MAKE-3PILE ?auto_81867 ?auto_81868 ?auto_81869 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83052 - BLOCK
      ?auto_83053 - BLOCK
      ?auto_83054 - BLOCK
    )
    :vars
    (
      ?auto_83056 - BLOCK
      ?auto_83055 - BLOCK
      ?auto_83058 - BLOCK
      ?auto_83057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83056 ?auto_83054 ) ( ON-TABLE ?auto_83052 ) ( ON ?auto_83053 ?auto_83052 ) ( ON ?auto_83054 ?auto_83053 ) ( not ( = ?auto_83052 ?auto_83053 ) ) ( not ( = ?auto_83052 ?auto_83054 ) ) ( not ( = ?auto_83052 ?auto_83056 ) ) ( not ( = ?auto_83053 ?auto_83054 ) ) ( not ( = ?auto_83053 ?auto_83056 ) ) ( not ( = ?auto_83054 ?auto_83056 ) ) ( not ( = ?auto_83052 ?auto_83055 ) ) ( not ( = ?auto_83052 ?auto_83058 ) ) ( not ( = ?auto_83053 ?auto_83055 ) ) ( not ( = ?auto_83053 ?auto_83058 ) ) ( not ( = ?auto_83054 ?auto_83055 ) ) ( not ( = ?auto_83054 ?auto_83058 ) ) ( not ( = ?auto_83056 ?auto_83055 ) ) ( not ( = ?auto_83056 ?auto_83058 ) ) ( not ( = ?auto_83055 ?auto_83058 ) ) ( ON ?auto_83055 ?auto_83056 ) ( not ( = ?auto_83057 ?auto_83058 ) ) ( not ( = ?auto_83052 ?auto_83057 ) ) ( not ( = ?auto_83053 ?auto_83057 ) ) ( not ( = ?auto_83054 ?auto_83057 ) ) ( not ( = ?auto_83056 ?auto_83057 ) ) ( not ( = ?auto_83055 ?auto_83057 ) ) ( ON ?auto_83058 ?auto_83055 ) ( ON ?auto_83057 ?auto_83058 ) ( CLEAR ?auto_83057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83052 ?auto_83053 ?auto_83054 ?auto_83056 ?auto_83055 ?auto_83058 )
      ( MAKE-3PILE ?auto_83052 ?auto_83053 ?auto_83054 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81883 - BLOCK
      ?auto_81884 - BLOCK
      ?auto_81885 - BLOCK
    )
    :vars
    (
      ?auto_81887 - BLOCK
      ?auto_81886 - BLOCK
      ?auto_81889 - BLOCK
      ?auto_81888 - BLOCK
      ?auto_81890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81887 ?auto_81885 ) ( ON-TABLE ?auto_81883 ) ( ON ?auto_81884 ?auto_81883 ) ( ON ?auto_81885 ?auto_81884 ) ( not ( = ?auto_81883 ?auto_81884 ) ) ( not ( = ?auto_81883 ?auto_81885 ) ) ( not ( = ?auto_81883 ?auto_81887 ) ) ( not ( = ?auto_81884 ?auto_81885 ) ) ( not ( = ?auto_81884 ?auto_81887 ) ) ( not ( = ?auto_81885 ?auto_81887 ) ) ( not ( = ?auto_81883 ?auto_81886 ) ) ( not ( = ?auto_81883 ?auto_81889 ) ) ( not ( = ?auto_81884 ?auto_81886 ) ) ( not ( = ?auto_81884 ?auto_81889 ) ) ( not ( = ?auto_81885 ?auto_81886 ) ) ( not ( = ?auto_81885 ?auto_81889 ) ) ( not ( = ?auto_81887 ?auto_81886 ) ) ( not ( = ?auto_81887 ?auto_81889 ) ) ( not ( = ?auto_81886 ?auto_81889 ) ) ( ON ?auto_81886 ?auto_81887 ) ( not ( = ?auto_81888 ?auto_81890 ) ) ( not ( = ?auto_81888 ?auto_81889 ) ) ( not ( = ?auto_81890 ?auto_81889 ) ) ( not ( = ?auto_81883 ?auto_81890 ) ) ( not ( = ?auto_81883 ?auto_81888 ) ) ( not ( = ?auto_81884 ?auto_81890 ) ) ( not ( = ?auto_81884 ?auto_81888 ) ) ( not ( = ?auto_81885 ?auto_81890 ) ) ( not ( = ?auto_81885 ?auto_81888 ) ) ( not ( = ?auto_81887 ?auto_81890 ) ) ( not ( = ?auto_81887 ?auto_81888 ) ) ( not ( = ?auto_81886 ?auto_81890 ) ) ( not ( = ?auto_81886 ?auto_81888 ) ) ( ON ?auto_81889 ?auto_81886 ) ( ON ?auto_81890 ?auto_81889 ) ( CLEAR ?auto_81890 ) ( HOLDING ?auto_81888 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81888 )
      ( MAKE-3PILE ?auto_81883 ?auto_81884 ?auto_81885 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81891 - BLOCK
      ?auto_81892 - BLOCK
      ?auto_81893 - BLOCK
    )
    :vars
    (
      ?auto_81897 - BLOCK
      ?auto_81894 - BLOCK
      ?auto_81895 - BLOCK
      ?auto_81896 - BLOCK
      ?auto_81898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81897 ?auto_81893 ) ( ON-TABLE ?auto_81891 ) ( ON ?auto_81892 ?auto_81891 ) ( ON ?auto_81893 ?auto_81892 ) ( not ( = ?auto_81891 ?auto_81892 ) ) ( not ( = ?auto_81891 ?auto_81893 ) ) ( not ( = ?auto_81891 ?auto_81897 ) ) ( not ( = ?auto_81892 ?auto_81893 ) ) ( not ( = ?auto_81892 ?auto_81897 ) ) ( not ( = ?auto_81893 ?auto_81897 ) ) ( not ( = ?auto_81891 ?auto_81894 ) ) ( not ( = ?auto_81891 ?auto_81895 ) ) ( not ( = ?auto_81892 ?auto_81894 ) ) ( not ( = ?auto_81892 ?auto_81895 ) ) ( not ( = ?auto_81893 ?auto_81894 ) ) ( not ( = ?auto_81893 ?auto_81895 ) ) ( not ( = ?auto_81897 ?auto_81894 ) ) ( not ( = ?auto_81897 ?auto_81895 ) ) ( not ( = ?auto_81894 ?auto_81895 ) ) ( ON ?auto_81894 ?auto_81897 ) ( not ( = ?auto_81896 ?auto_81898 ) ) ( not ( = ?auto_81896 ?auto_81895 ) ) ( not ( = ?auto_81898 ?auto_81895 ) ) ( not ( = ?auto_81891 ?auto_81898 ) ) ( not ( = ?auto_81891 ?auto_81896 ) ) ( not ( = ?auto_81892 ?auto_81898 ) ) ( not ( = ?auto_81892 ?auto_81896 ) ) ( not ( = ?auto_81893 ?auto_81898 ) ) ( not ( = ?auto_81893 ?auto_81896 ) ) ( not ( = ?auto_81897 ?auto_81898 ) ) ( not ( = ?auto_81897 ?auto_81896 ) ) ( not ( = ?auto_81894 ?auto_81898 ) ) ( not ( = ?auto_81894 ?auto_81896 ) ) ( ON ?auto_81895 ?auto_81894 ) ( ON ?auto_81898 ?auto_81895 ) ( ON ?auto_81896 ?auto_81898 ) ( CLEAR ?auto_81896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81891 ?auto_81892 ?auto_81893 ?auto_81897 ?auto_81894 ?auto_81895 ?auto_81898 )
      ( MAKE-3PILE ?auto_81891 ?auto_81892 ?auto_81893 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81904 - BLOCK
      ?auto_81905 - BLOCK
      ?auto_81906 - BLOCK
      ?auto_81907 - BLOCK
      ?auto_81908 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_81908 ) ( CLEAR ?auto_81907 ) ( ON-TABLE ?auto_81904 ) ( ON ?auto_81905 ?auto_81904 ) ( ON ?auto_81906 ?auto_81905 ) ( ON ?auto_81907 ?auto_81906 ) ( not ( = ?auto_81904 ?auto_81905 ) ) ( not ( = ?auto_81904 ?auto_81906 ) ) ( not ( = ?auto_81904 ?auto_81907 ) ) ( not ( = ?auto_81904 ?auto_81908 ) ) ( not ( = ?auto_81905 ?auto_81906 ) ) ( not ( = ?auto_81905 ?auto_81907 ) ) ( not ( = ?auto_81905 ?auto_81908 ) ) ( not ( = ?auto_81906 ?auto_81907 ) ) ( not ( = ?auto_81906 ?auto_81908 ) ) ( not ( = ?auto_81907 ?auto_81908 ) ) )
    :subtasks
    ( ( !STACK ?auto_81908 ?auto_81907 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81909 - BLOCK
      ?auto_81910 - BLOCK
      ?auto_81911 - BLOCK
      ?auto_81912 - BLOCK
      ?auto_81913 - BLOCK
    )
    :vars
    (
      ?auto_81914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81912 ) ( ON-TABLE ?auto_81909 ) ( ON ?auto_81910 ?auto_81909 ) ( ON ?auto_81911 ?auto_81910 ) ( ON ?auto_81912 ?auto_81911 ) ( not ( = ?auto_81909 ?auto_81910 ) ) ( not ( = ?auto_81909 ?auto_81911 ) ) ( not ( = ?auto_81909 ?auto_81912 ) ) ( not ( = ?auto_81909 ?auto_81913 ) ) ( not ( = ?auto_81910 ?auto_81911 ) ) ( not ( = ?auto_81910 ?auto_81912 ) ) ( not ( = ?auto_81910 ?auto_81913 ) ) ( not ( = ?auto_81911 ?auto_81912 ) ) ( not ( = ?auto_81911 ?auto_81913 ) ) ( not ( = ?auto_81912 ?auto_81913 ) ) ( ON ?auto_81913 ?auto_81914 ) ( CLEAR ?auto_81913 ) ( HAND-EMPTY ) ( not ( = ?auto_81909 ?auto_81914 ) ) ( not ( = ?auto_81910 ?auto_81914 ) ) ( not ( = ?auto_81911 ?auto_81914 ) ) ( not ( = ?auto_81912 ?auto_81914 ) ) ( not ( = ?auto_81913 ?auto_81914 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81913 ?auto_81914 )
      ( MAKE-5PILE ?auto_81909 ?auto_81910 ?auto_81911 ?auto_81912 ?auto_81913 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81915 - BLOCK
      ?auto_81916 - BLOCK
      ?auto_81917 - BLOCK
      ?auto_81918 - BLOCK
      ?auto_81919 - BLOCK
    )
    :vars
    (
      ?auto_81920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81915 ) ( ON ?auto_81916 ?auto_81915 ) ( ON ?auto_81917 ?auto_81916 ) ( not ( = ?auto_81915 ?auto_81916 ) ) ( not ( = ?auto_81915 ?auto_81917 ) ) ( not ( = ?auto_81915 ?auto_81918 ) ) ( not ( = ?auto_81915 ?auto_81919 ) ) ( not ( = ?auto_81916 ?auto_81917 ) ) ( not ( = ?auto_81916 ?auto_81918 ) ) ( not ( = ?auto_81916 ?auto_81919 ) ) ( not ( = ?auto_81917 ?auto_81918 ) ) ( not ( = ?auto_81917 ?auto_81919 ) ) ( not ( = ?auto_81918 ?auto_81919 ) ) ( ON ?auto_81919 ?auto_81920 ) ( CLEAR ?auto_81919 ) ( not ( = ?auto_81915 ?auto_81920 ) ) ( not ( = ?auto_81916 ?auto_81920 ) ) ( not ( = ?auto_81917 ?auto_81920 ) ) ( not ( = ?auto_81918 ?auto_81920 ) ) ( not ( = ?auto_81919 ?auto_81920 ) ) ( HOLDING ?auto_81918 ) ( CLEAR ?auto_81917 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81915 ?auto_81916 ?auto_81917 ?auto_81918 )
      ( MAKE-5PILE ?auto_81915 ?auto_81916 ?auto_81917 ?auto_81918 ?auto_81919 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81921 - BLOCK
      ?auto_81922 - BLOCK
      ?auto_81923 - BLOCK
      ?auto_81924 - BLOCK
      ?auto_81925 - BLOCK
    )
    :vars
    (
      ?auto_81926 - BLOCK
      ?auto_81927 - BLOCK
      ?auto_81928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81921 ) ( ON ?auto_81922 ?auto_81921 ) ( ON ?auto_81923 ?auto_81922 ) ( not ( = ?auto_81921 ?auto_81922 ) ) ( not ( = ?auto_81921 ?auto_81923 ) ) ( not ( = ?auto_81921 ?auto_81924 ) ) ( not ( = ?auto_81921 ?auto_81925 ) ) ( not ( = ?auto_81922 ?auto_81923 ) ) ( not ( = ?auto_81922 ?auto_81924 ) ) ( not ( = ?auto_81922 ?auto_81925 ) ) ( not ( = ?auto_81923 ?auto_81924 ) ) ( not ( = ?auto_81923 ?auto_81925 ) ) ( not ( = ?auto_81924 ?auto_81925 ) ) ( ON ?auto_81925 ?auto_81926 ) ( not ( = ?auto_81921 ?auto_81926 ) ) ( not ( = ?auto_81922 ?auto_81926 ) ) ( not ( = ?auto_81923 ?auto_81926 ) ) ( not ( = ?auto_81924 ?auto_81926 ) ) ( not ( = ?auto_81925 ?auto_81926 ) ) ( CLEAR ?auto_81923 ) ( ON ?auto_81924 ?auto_81925 ) ( CLEAR ?auto_81924 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81927 ) ( ON ?auto_81928 ?auto_81927 ) ( ON ?auto_81926 ?auto_81928 ) ( not ( = ?auto_81927 ?auto_81928 ) ) ( not ( = ?auto_81927 ?auto_81926 ) ) ( not ( = ?auto_81927 ?auto_81925 ) ) ( not ( = ?auto_81927 ?auto_81924 ) ) ( not ( = ?auto_81928 ?auto_81926 ) ) ( not ( = ?auto_81928 ?auto_81925 ) ) ( not ( = ?auto_81928 ?auto_81924 ) ) ( not ( = ?auto_81921 ?auto_81927 ) ) ( not ( = ?auto_81921 ?auto_81928 ) ) ( not ( = ?auto_81922 ?auto_81927 ) ) ( not ( = ?auto_81922 ?auto_81928 ) ) ( not ( = ?auto_81923 ?auto_81927 ) ) ( not ( = ?auto_81923 ?auto_81928 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81927 ?auto_81928 ?auto_81926 ?auto_81925 )
      ( MAKE-5PILE ?auto_81921 ?auto_81922 ?auto_81923 ?auto_81924 ?auto_81925 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81929 - BLOCK
      ?auto_81930 - BLOCK
      ?auto_81931 - BLOCK
      ?auto_81932 - BLOCK
      ?auto_81933 - BLOCK
    )
    :vars
    (
      ?auto_81934 - BLOCK
      ?auto_81935 - BLOCK
      ?auto_81936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81929 ) ( ON ?auto_81930 ?auto_81929 ) ( not ( = ?auto_81929 ?auto_81930 ) ) ( not ( = ?auto_81929 ?auto_81931 ) ) ( not ( = ?auto_81929 ?auto_81932 ) ) ( not ( = ?auto_81929 ?auto_81933 ) ) ( not ( = ?auto_81930 ?auto_81931 ) ) ( not ( = ?auto_81930 ?auto_81932 ) ) ( not ( = ?auto_81930 ?auto_81933 ) ) ( not ( = ?auto_81931 ?auto_81932 ) ) ( not ( = ?auto_81931 ?auto_81933 ) ) ( not ( = ?auto_81932 ?auto_81933 ) ) ( ON ?auto_81933 ?auto_81934 ) ( not ( = ?auto_81929 ?auto_81934 ) ) ( not ( = ?auto_81930 ?auto_81934 ) ) ( not ( = ?auto_81931 ?auto_81934 ) ) ( not ( = ?auto_81932 ?auto_81934 ) ) ( not ( = ?auto_81933 ?auto_81934 ) ) ( ON ?auto_81932 ?auto_81933 ) ( CLEAR ?auto_81932 ) ( ON-TABLE ?auto_81935 ) ( ON ?auto_81936 ?auto_81935 ) ( ON ?auto_81934 ?auto_81936 ) ( not ( = ?auto_81935 ?auto_81936 ) ) ( not ( = ?auto_81935 ?auto_81934 ) ) ( not ( = ?auto_81935 ?auto_81933 ) ) ( not ( = ?auto_81935 ?auto_81932 ) ) ( not ( = ?auto_81936 ?auto_81934 ) ) ( not ( = ?auto_81936 ?auto_81933 ) ) ( not ( = ?auto_81936 ?auto_81932 ) ) ( not ( = ?auto_81929 ?auto_81935 ) ) ( not ( = ?auto_81929 ?auto_81936 ) ) ( not ( = ?auto_81930 ?auto_81935 ) ) ( not ( = ?auto_81930 ?auto_81936 ) ) ( not ( = ?auto_81931 ?auto_81935 ) ) ( not ( = ?auto_81931 ?auto_81936 ) ) ( HOLDING ?auto_81931 ) ( CLEAR ?auto_81930 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81929 ?auto_81930 ?auto_81931 )
      ( MAKE-5PILE ?auto_81929 ?auto_81930 ?auto_81931 ?auto_81932 ?auto_81933 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81937 - BLOCK
      ?auto_81938 - BLOCK
      ?auto_81939 - BLOCK
      ?auto_81940 - BLOCK
      ?auto_81941 - BLOCK
    )
    :vars
    (
      ?auto_81943 - BLOCK
      ?auto_81942 - BLOCK
      ?auto_81944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81937 ) ( ON ?auto_81938 ?auto_81937 ) ( not ( = ?auto_81937 ?auto_81938 ) ) ( not ( = ?auto_81937 ?auto_81939 ) ) ( not ( = ?auto_81937 ?auto_81940 ) ) ( not ( = ?auto_81937 ?auto_81941 ) ) ( not ( = ?auto_81938 ?auto_81939 ) ) ( not ( = ?auto_81938 ?auto_81940 ) ) ( not ( = ?auto_81938 ?auto_81941 ) ) ( not ( = ?auto_81939 ?auto_81940 ) ) ( not ( = ?auto_81939 ?auto_81941 ) ) ( not ( = ?auto_81940 ?auto_81941 ) ) ( ON ?auto_81941 ?auto_81943 ) ( not ( = ?auto_81937 ?auto_81943 ) ) ( not ( = ?auto_81938 ?auto_81943 ) ) ( not ( = ?auto_81939 ?auto_81943 ) ) ( not ( = ?auto_81940 ?auto_81943 ) ) ( not ( = ?auto_81941 ?auto_81943 ) ) ( ON ?auto_81940 ?auto_81941 ) ( ON-TABLE ?auto_81942 ) ( ON ?auto_81944 ?auto_81942 ) ( ON ?auto_81943 ?auto_81944 ) ( not ( = ?auto_81942 ?auto_81944 ) ) ( not ( = ?auto_81942 ?auto_81943 ) ) ( not ( = ?auto_81942 ?auto_81941 ) ) ( not ( = ?auto_81942 ?auto_81940 ) ) ( not ( = ?auto_81944 ?auto_81943 ) ) ( not ( = ?auto_81944 ?auto_81941 ) ) ( not ( = ?auto_81944 ?auto_81940 ) ) ( not ( = ?auto_81937 ?auto_81942 ) ) ( not ( = ?auto_81937 ?auto_81944 ) ) ( not ( = ?auto_81938 ?auto_81942 ) ) ( not ( = ?auto_81938 ?auto_81944 ) ) ( not ( = ?auto_81939 ?auto_81942 ) ) ( not ( = ?auto_81939 ?auto_81944 ) ) ( CLEAR ?auto_81938 ) ( ON ?auto_81939 ?auto_81940 ) ( CLEAR ?auto_81939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81942 ?auto_81944 ?auto_81943 ?auto_81941 ?auto_81940 )
      ( MAKE-5PILE ?auto_81937 ?auto_81938 ?auto_81939 ?auto_81940 ?auto_81941 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81945 - BLOCK
      ?auto_81946 - BLOCK
      ?auto_81947 - BLOCK
      ?auto_81948 - BLOCK
      ?auto_81949 - BLOCK
    )
    :vars
    (
      ?auto_81951 - BLOCK
      ?auto_81952 - BLOCK
      ?auto_81950 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81945 ) ( not ( = ?auto_81945 ?auto_81946 ) ) ( not ( = ?auto_81945 ?auto_81947 ) ) ( not ( = ?auto_81945 ?auto_81948 ) ) ( not ( = ?auto_81945 ?auto_81949 ) ) ( not ( = ?auto_81946 ?auto_81947 ) ) ( not ( = ?auto_81946 ?auto_81948 ) ) ( not ( = ?auto_81946 ?auto_81949 ) ) ( not ( = ?auto_81947 ?auto_81948 ) ) ( not ( = ?auto_81947 ?auto_81949 ) ) ( not ( = ?auto_81948 ?auto_81949 ) ) ( ON ?auto_81949 ?auto_81951 ) ( not ( = ?auto_81945 ?auto_81951 ) ) ( not ( = ?auto_81946 ?auto_81951 ) ) ( not ( = ?auto_81947 ?auto_81951 ) ) ( not ( = ?auto_81948 ?auto_81951 ) ) ( not ( = ?auto_81949 ?auto_81951 ) ) ( ON ?auto_81948 ?auto_81949 ) ( ON-TABLE ?auto_81952 ) ( ON ?auto_81950 ?auto_81952 ) ( ON ?auto_81951 ?auto_81950 ) ( not ( = ?auto_81952 ?auto_81950 ) ) ( not ( = ?auto_81952 ?auto_81951 ) ) ( not ( = ?auto_81952 ?auto_81949 ) ) ( not ( = ?auto_81952 ?auto_81948 ) ) ( not ( = ?auto_81950 ?auto_81951 ) ) ( not ( = ?auto_81950 ?auto_81949 ) ) ( not ( = ?auto_81950 ?auto_81948 ) ) ( not ( = ?auto_81945 ?auto_81952 ) ) ( not ( = ?auto_81945 ?auto_81950 ) ) ( not ( = ?auto_81946 ?auto_81952 ) ) ( not ( = ?auto_81946 ?auto_81950 ) ) ( not ( = ?auto_81947 ?auto_81952 ) ) ( not ( = ?auto_81947 ?auto_81950 ) ) ( ON ?auto_81947 ?auto_81948 ) ( CLEAR ?auto_81947 ) ( HOLDING ?auto_81946 ) ( CLEAR ?auto_81945 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81945 ?auto_81946 )
      ( MAKE-5PILE ?auto_81945 ?auto_81946 ?auto_81947 ?auto_81948 ?auto_81949 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81953 - BLOCK
      ?auto_81954 - BLOCK
      ?auto_81955 - BLOCK
      ?auto_81956 - BLOCK
      ?auto_81957 - BLOCK
    )
    :vars
    (
      ?auto_81959 - BLOCK
      ?auto_81958 - BLOCK
      ?auto_81960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81953 ) ( not ( = ?auto_81953 ?auto_81954 ) ) ( not ( = ?auto_81953 ?auto_81955 ) ) ( not ( = ?auto_81953 ?auto_81956 ) ) ( not ( = ?auto_81953 ?auto_81957 ) ) ( not ( = ?auto_81954 ?auto_81955 ) ) ( not ( = ?auto_81954 ?auto_81956 ) ) ( not ( = ?auto_81954 ?auto_81957 ) ) ( not ( = ?auto_81955 ?auto_81956 ) ) ( not ( = ?auto_81955 ?auto_81957 ) ) ( not ( = ?auto_81956 ?auto_81957 ) ) ( ON ?auto_81957 ?auto_81959 ) ( not ( = ?auto_81953 ?auto_81959 ) ) ( not ( = ?auto_81954 ?auto_81959 ) ) ( not ( = ?auto_81955 ?auto_81959 ) ) ( not ( = ?auto_81956 ?auto_81959 ) ) ( not ( = ?auto_81957 ?auto_81959 ) ) ( ON ?auto_81956 ?auto_81957 ) ( ON-TABLE ?auto_81958 ) ( ON ?auto_81960 ?auto_81958 ) ( ON ?auto_81959 ?auto_81960 ) ( not ( = ?auto_81958 ?auto_81960 ) ) ( not ( = ?auto_81958 ?auto_81959 ) ) ( not ( = ?auto_81958 ?auto_81957 ) ) ( not ( = ?auto_81958 ?auto_81956 ) ) ( not ( = ?auto_81960 ?auto_81959 ) ) ( not ( = ?auto_81960 ?auto_81957 ) ) ( not ( = ?auto_81960 ?auto_81956 ) ) ( not ( = ?auto_81953 ?auto_81958 ) ) ( not ( = ?auto_81953 ?auto_81960 ) ) ( not ( = ?auto_81954 ?auto_81958 ) ) ( not ( = ?auto_81954 ?auto_81960 ) ) ( not ( = ?auto_81955 ?auto_81958 ) ) ( not ( = ?auto_81955 ?auto_81960 ) ) ( ON ?auto_81955 ?auto_81956 ) ( CLEAR ?auto_81953 ) ( ON ?auto_81954 ?auto_81955 ) ( CLEAR ?auto_81954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81958 ?auto_81960 ?auto_81959 ?auto_81957 ?auto_81956 ?auto_81955 )
      ( MAKE-5PILE ?auto_81953 ?auto_81954 ?auto_81955 ?auto_81956 ?auto_81957 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81961 - BLOCK
      ?auto_81962 - BLOCK
      ?auto_81963 - BLOCK
      ?auto_81964 - BLOCK
      ?auto_81965 - BLOCK
    )
    :vars
    (
      ?auto_81966 - BLOCK
      ?auto_81967 - BLOCK
      ?auto_81968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81961 ?auto_81962 ) ) ( not ( = ?auto_81961 ?auto_81963 ) ) ( not ( = ?auto_81961 ?auto_81964 ) ) ( not ( = ?auto_81961 ?auto_81965 ) ) ( not ( = ?auto_81962 ?auto_81963 ) ) ( not ( = ?auto_81962 ?auto_81964 ) ) ( not ( = ?auto_81962 ?auto_81965 ) ) ( not ( = ?auto_81963 ?auto_81964 ) ) ( not ( = ?auto_81963 ?auto_81965 ) ) ( not ( = ?auto_81964 ?auto_81965 ) ) ( ON ?auto_81965 ?auto_81966 ) ( not ( = ?auto_81961 ?auto_81966 ) ) ( not ( = ?auto_81962 ?auto_81966 ) ) ( not ( = ?auto_81963 ?auto_81966 ) ) ( not ( = ?auto_81964 ?auto_81966 ) ) ( not ( = ?auto_81965 ?auto_81966 ) ) ( ON ?auto_81964 ?auto_81965 ) ( ON-TABLE ?auto_81967 ) ( ON ?auto_81968 ?auto_81967 ) ( ON ?auto_81966 ?auto_81968 ) ( not ( = ?auto_81967 ?auto_81968 ) ) ( not ( = ?auto_81967 ?auto_81966 ) ) ( not ( = ?auto_81967 ?auto_81965 ) ) ( not ( = ?auto_81967 ?auto_81964 ) ) ( not ( = ?auto_81968 ?auto_81966 ) ) ( not ( = ?auto_81968 ?auto_81965 ) ) ( not ( = ?auto_81968 ?auto_81964 ) ) ( not ( = ?auto_81961 ?auto_81967 ) ) ( not ( = ?auto_81961 ?auto_81968 ) ) ( not ( = ?auto_81962 ?auto_81967 ) ) ( not ( = ?auto_81962 ?auto_81968 ) ) ( not ( = ?auto_81963 ?auto_81967 ) ) ( not ( = ?auto_81963 ?auto_81968 ) ) ( ON ?auto_81963 ?auto_81964 ) ( ON ?auto_81962 ?auto_81963 ) ( CLEAR ?auto_81962 ) ( HOLDING ?auto_81961 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81961 )
      ( MAKE-5PILE ?auto_81961 ?auto_81962 ?auto_81963 ?auto_81964 ?auto_81965 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81969 - BLOCK
      ?auto_81970 - BLOCK
      ?auto_81971 - BLOCK
      ?auto_81972 - BLOCK
      ?auto_81973 - BLOCK
    )
    :vars
    (
      ?auto_81976 - BLOCK
      ?auto_81975 - BLOCK
      ?auto_81974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81969 ?auto_81970 ) ) ( not ( = ?auto_81969 ?auto_81971 ) ) ( not ( = ?auto_81969 ?auto_81972 ) ) ( not ( = ?auto_81969 ?auto_81973 ) ) ( not ( = ?auto_81970 ?auto_81971 ) ) ( not ( = ?auto_81970 ?auto_81972 ) ) ( not ( = ?auto_81970 ?auto_81973 ) ) ( not ( = ?auto_81971 ?auto_81972 ) ) ( not ( = ?auto_81971 ?auto_81973 ) ) ( not ( = ?auto_81972 ?auto_81973 ) ) ( ON ?auto_81973 ?auto_81976 ) ( not ( = ?auto_81969 ?auto_81976 ) ) ( not ( = ?auto_81970 ?auto_81976 ) ) ( not ( = ?auto_81971 ?auto_81976 ) ) ( not ( = ?auto_81972 ?auto_81976 ) ) ( not ( = ?auto_81973 ?auto_81976 ) ) ( ON ?auto_81972 ?auto_81973 ) ( ON-TABLE ?auto_81975 ) ( ON ?auto_81974 ?auto_81975 ) ( ON ?auto_81976 ?auto_81974 ) ( not ( = ?auto_81975 ?auto_81974 ) ) ( not ( = ?auto_81975 ?auto_81976 ) ) ( not ( = ?auto_81975 ?auto_81973 ) ) ( not ( = ?auto_81975 ?auto_81972 ) ) ( not ( = ?auto_81974 ?auto_81976 ) ) ( not ( = ?auto_81974 ?auto_81973 ) ) ( not ( = ?auto_81974 ?auto_81972 ) ) ( not ( = ?auto_81969 ?auto_81975 ) ) ( not ( = ?auto_81969 ?auto_81974 ) ) ( not ( = ?auto_81970 ?auto_81975 ) ) ( not ( = ?auto_81970 ?auto_81974 ) ) ( not ( = ?auto_81971 ?auto_81975 ) ) ( not ( = ?auto_81971 ?auto_81974 ) ) ( ON ?auto_81971 ?auto_81972 ) ( ON ?auto_81970 ?auto_81971 ) ( ON ?auto_81969 ?auto_81970 ) ( CLEAR ?auto_81969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81975 ?auto_81974 ?auto_81976 ?auto_81973 ?auto_81972 ?auto_81971 ?auto_81970 )
      ( MAKE-5PILE ?auto_81969 ?auto_81970 ?auto_81971 ?auto_81972 ?auto_81973 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81979 - BLOCK
      ?auto_81980 - BLOCK
    )
    :vars
    (
      ?auto_81981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81981 ?auto_81980 ) ( CLEAR ?auto_81981 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81979 ) ( ON ?auto_81980 ?auto_81979 ) ( not ( = ?auto_81979 ?auto_81980 ) ) ( not ( = ?auto_81979 ?auto_81981 ) ) ( not ( = ?auto_81980 ?auto_81981 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81981 ?auto_81980 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81982 - BLOCK
      ?auto_81983 - BLOCK
    )
    :vars
    (
      ?auto_81984 - BLOCK
      ?auto_81985 - BLOCK
      ?auto_81986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81984 ?auto_81983 ) ( CLEAR ?auto_81984 ) ( ON-TABLE ?auto_81982 ) ( ON ?auto_81983 ?auto_81982 ) ( not ( = ?auto_81982 ?auto_81983 ) ) ( not ( = ?auto_81982 ?auto_81984 ) ) ( not ( = ?auto_81983 ?auto_81984 ) ) ( HOLDING ?auto_81985 ) ( CLEAR ?auto_81986 ) ( not ( = ?auto_81982 ?auto_81985 ) ) ( not ( = ?auto_81982 ?auto_81986 ) ) ( not ( = ?auto_81983 ?auto_81985 ) ) ( not ( = ?auto_81983 ?auto_81986 ) ) ( not ( = ?auto_81984 ?auto_81985 ) ) ( not ( = ?auto_81984 ?auto_81986 ) ) ( not ( = ?auto_81985 ?auto_81986 ) ) )
    :subtasks
    ( ( !STACK ?auto_81985 ?auto_81986 )
      ( MAKE-2PILE ?auto_81982 ?auto_81983 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81987 - BLOCK
      ?auto_81988 - BLOCK
    )
    :vars
    (
      ?auto_81991 - BLOCK
      ?auto_81990 - BLOCK
      ?auto_81989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81991 ?auto_81988 ) ( ON-TABLE ?auto_81987 ) ( ON ?auto_81988 ?auto_81987 ) ( not ( = ?auto_81987 ?auto_81988 ) ) ( not ( = ?auto_81987 ?auto_81991 ) ) ( not ( = ?auto_81988 ?auto_81991 ) ) ( CLEAR ?auto_81990 ) ( not ( = ?auto_81987 ?auto_81989 ) ) ( not ( = ?auto_81987 ?auto_81990 ) ) ( not ( = ?auto_81988 ?auto_81989 ) ) ( not ( = ?auto_81988 ?auto_81990 ) ) ( not ( = ?auto_81991 ?auto_81989 ) ) ( not ( = ?auto_81991 ?auto_81990 ) ) ( not ( = ?auto_81989 ?auto_81990 ) ) ( ON ?auto_81989 ?auto_81991 ) ( CLEAR ?auto_81989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81987 ?auto_81988 ?auto_81991 )
      ( MAKE-2PILE ?auto_81987 ?auto_81988 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81992 - BLOCK
      ?auto_81993 - BLOCK
    )
    :vars
    (
      ?auto_81994 - BLOCK
      ?auto_81995 - BLOCK
      ?auto_81996 - BLOCK
      ?auto_81997 - BLOCK
      ?auto_81999 - BLOCK
      ?auto_81998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81994 ?auto_81993 ) ( ON-TABLE ?auto_81992 ) ( ON ?auto_81993 ?auto_81992 ) ( not ( = ?auto_81992 ?auto_81993 ) ) ( not ( = ?auto_81992 ?auto_81994 ) ) ( not ( = ?auto_81993 ?auto_81994 ) ) ( not ( = ?auto_81992 ?auto_81995 ) ) ( not ( = ?auto_81992 ?auto_81996 ) ) ( not ( = ?auto_81993 ?auto_81995 ) ) ( not ( = ?auto_81993 ?auto_81996 ) ) ( not ( = ?auto_81994 ?auto_81995 ) ) ( not ( = ?auto_81994 ?auto_81996 ) ) ( not ( = ?auto_81995 ?auto_81996 ) ) ( ON ?auto_81995 ?auto_81994 ) ( CLEAR ?auto_81995 ) ( HOLDING ?auto_81996 ) ( CLEAR ?auto_81997 ) ( ON-TABLE ?auto_81999 ) ( ON ?auto_81998 ?auto_81999 ) ( ON ?auto_81997 ?auto_81998 ) ( not ( = ?auto_81999 ?auto_81998 ) ) ( not ( = ?auto_81999 ?auto_81997 ) ) ( not ( = ?auto_81999 ?auto_81996 ) ) ( not ( = ?auto_81998 ?auto_81997 ) ) ( not ( = ?auto_81998 ?auto_81996 ) ) ( not ( = ?auto_81997 ?auto_81996 ) ) ( not ( = ?auto_81992 ?auto_81997 ) ) ( not ( = ?auto_81992 ?auto_81999 ) ) ( not ( = ?auto_81992 ?auto_81998 ) ) ( not ( = ?auto_81993 ?auto_81997 ) ) ( not ( = ?auto_81993 ?auto_81999 ) ) ( not ( = ?auto_81993 ?auto_81998 ) ) ( not ( = ?auto_81994 ?auto_81997 ) ) ( not ( = ?auto_81994 ?auto_81999 ) ) ( not ( = ?auto_81994 ?auto_81998 ) ) ( not ( = ?auto_81995 ?auto_81997 ) ) ( not ( = ?auto_81995 ?auto_81999 ) ) ( not ( = ?auto_81995 ?auto_81998 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81999 ?auto_81998 ?auto_81997 ?auto_81996 )
      ( MAKE-2PILE ?auto_81992 ?auto_81993 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82000 - BLOCK
      ?auto_82001 - BLOCK
    )
    :vars
    (
      ?auto_82004 - BLOCK
      ?auto_82007 - BLOCK
      ?auto_82002 - BLOCK
      ?auto_82006 - BLOCK
      ?auto_82005 - BLOCK
      ?auto_82003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82004 ?auto_82001 ) ( ON-TABLE ?auto_82000 ) ( ON ?auto_82001 ?auto_82000 ) ( not ( = ?auto_82000 ?auto_82001 ) ) ( not ( = ?auto_82000 ?auto_82004 ) ) ( not ( = ?auto_82001 ?auto_82004 ) ) ( not ( = ?auto_82000 ?auto_82007 ) ) ( not ( = ?auto_82000 ?auto_82002 ) ) ( not ( = ?auto_82001 ?auto_82007 ) ) ( not ( = ?auto_82001 ?auto_82002 ) ) ( not ( = ?auto_82004 ?auto_82007 ) ) ( not ( = ?auto_82004 ?auto_82002 ) ) ( not ( = ?auto_82007 ?auto_82002 ) ) ( ON ?auto_82007 ?auto_82004 ) ( CLEAR ?auto_82006 ) ( ON-TABLE ?auto_82005 ) ( ON ?auto_82003 ?auto_82005 ) ( ON ?auto_82006 ?auto_82003 ) ( not ( = ?auto_82005 ?auto_82003 ) ) ( not ( = ?auto_82005 ?auto_82006 ) ) ( not ( = ?auto_82005 ?auto_82002 ) ) ( not ( = ?auto_82003 ?auto_82006 ) ) ( not ( = ?auto_82003 ?auto_82002 ) ) ( not ( = ?auto_82006 ?auto_82002 ) ) ( not ( = ?auto_82000 ?auto_82006 ) ) ( not ( = ?auto_82000 ?auto_82005 ) ) ( not ( = ?auto_82000 ?auto_82003 ) ) ( not ( = ?auto_82001 ?auto_82006 ) ) ( not ( = ?auto_82001 ?auto_82005 ) ) ( not ( = ?auto_82001 ?auto_82003 ) ) ( not ( = ?auto_82004 ?auto_82006 ) ) ( not ( = ?auto_82004 ?auto_82005 ) ) ( not ( = ?auto_82004 ?auto_82003 ) ) ( not ( = ?auto_82007 ?auto_82006 ) ) ( not ( = ?auto_82007 ?auto_82005 ) ) ( not ( = ?auto_82007 ?auto_82003 ) ) ( ON ?auto_82002 ?auto_82007 ) ( CLEAR ?auto_82002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82000 ?auto_82001 ?auto_82004 ?auto_82007 )
      ( MAKE-2PILE ?auto_82000 ?auto_82001 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82008 - BLOCK
      ?auto_82009 - BLOCK
    )
    :vars
    (
      ?auto_82013 - BLOCK
      ?auto_82012 - BLOCK
      ?auto_82014 - BLOCK
      ?auto_82010 - BLOCK
      ?auto_82015 - BLOCK
      ?auto_82011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82013 ?auto_82009 ) ( ON-TABLE ?auto_82008 ) ( ON ?auto_82009 ?auto_82008 ) ( not ( = ?auto_82008 ?auto_82009 ) ) ( not ( = ?auto_82008 ?auto_82013 ) ) ( not ( = ?auto_82009 ?auto_82013 ) ) ( not ( = ?auto_82008 ?auto_82012 ) ) ( not ( = ?auto_82008 ?auto_82014 ) ) ( not ( = ?auto_82009 ?auto_82012 ) ) ( not ( = ?auto_82009 ?auto_82014 ) ) ( not ( = ?auto_82013 ?auto_82012 ) ) ( not ( = ?auto_82013 ?auto_82014 ) ) ( not ( = ?auto_82012 ?auto_82014 ) ) ( ON ?auto_82012 ?auto_82013 ) ( ON-TABLE ?auto_82010 ) ( ON ?auto_82015 ?auto_82010 ) ( not ( = ?auto_82010 ?auto_82015 ) ) ( not ( = ?auto_82010 ?auto_82011 ) ) ( not ( = ?auto_82010 ?auto_82014 ) ) ( not ( = ?auto_82015 ?auto_82011 ) ) ( not ( = ?auto_82015 ?auto_82014 ) ) ( not ( = ?auto_82011 ?auto_82014 ) ) ( not ( = ?auto_82008 ?auto_82011 ) ) ( not ( = ?auto_82008 ?auto_82010 ) ) ( not ( = ?auto_82008 ?auto_82015 ) ) ( not ( = ?auto_82009 ?auto_82011 ) ) ( not ( = ?auto_82009 ?auto_82010 ) ) ( not ( = ?auto_82009 ?auto_82015 ) ) ( not ( = ?auto_82013 ?auto_82011 ) ) ( not ( = ?auto_82013 ?auto_82010 ) ) ( not ( = ?auto_82013 ?auto_82015 ) ) ( not ( = ?auto_82012 ?auto_82011 ) ) ( not ( = ?auto_82012 ?auto_82010 ) ) ( not ( = ?auto_82012 ?auto_82015 ) ) ( ON ?auto_82014 ?auto_82012 ) ( CLEAR ?auto_82014 ) ( HOLDING ?auto_82011 ) ( CLEAR ?auto_82015 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82010 ?auto_82015 ?auto_82011 )
      ( MAKE-2PILE ?auto_82008 ?auto_82009 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82016 - BLOCK
      ?auto_82017 - BLOCK
    )
    :vars
    (
      ?auto_82021 - BLOCK
      ?auto_82023 - BLOCK
      ?auto_82019 - BLOCK
      ?auto_82018 - BLOCK
      ?auto_82022 - BLOCK
      ?auto_82020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82021 ?auto_82017 ) ( ON-TABLE ?auto_82016 ) ( ON ?auto_82017 ?auto_82016 ) ( not ( = ?auto_82016 ?auto_82017 ) ) ( not ( = ?auto_82016 ?auto_82021 ) ) ( not ( = ?auto_82017 ?auto_82021 ) ) ( not ( = ?auto_82016 ?auto_82023 ) ) ( not ( = ?auto_82016 ?auto_82019 ) ) ( not ( = ?auto_82017 ?auto_82023 ) ) ( not ( = ?auto_82017 ?auto_82019 ) ) ( not ( = ?auto_82021 ?auto_82023 ) ) ( not ( = ?auto_82021 ?auto_82019 ) ) ( not ( = ?auto_82023 ?auto_82019 ) ) ( ON ?auto_82023 ?auto_82021 ) ( ON-TABLE ?auto_82018 ) ( ON ?auto_82022 ?auto_82018 ) ( not ( = ?auto_82018 ?auto_82022 ) ) ( not ( = ?auto_82018 ?auto_82020 ) ) ( not ( = ?auto_82018 ?auto_82019 ) ) ( not ( = ?auto_82022 ?auto_82020 ) ) ( not ( = ?auto_82022 ?auto_82019 ) ) ( not ( = ?auto_82020 ?auto_82019 ) ) ( not ( = ?auto_82016 ?auto_82020 ) ) ( not ( = ?auto_82016 ?auto_82018 ) ) ( not ( = ?auto_82016 ?auto_82022 ) ) ( not ( = ?auto_82017 ?auto_82020 ) ) ( not ( = ?auto_82017 ?auto_82018 ) ) ( not ( = ?auto_82017 ?auto_82022 ) ) ( not ( = ?auto_82021 ?auto_82020 ) ) ( not ( = ?auto_82021 ?auto_82018 ) ) ( not ( = ?auto_82021 ?auto_82022 ) ) ( not ( = ?auto_82023 ?auto_82020 ) ) ( not ( = ?auto_82023 ?auto_82018 ) ) ( not ( = ?auto_82023 ?auto_82022 ) ) ( ON ?auto_82019 ?auto_82023 ) ( CLEAR ?auto_82022 ) ( ON ?auto_82020 ?auto_82019 ) ( CLEAR ?auto_82020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82016 ?auto_82017 ?auto_82021 ?auto_82023 ?auto_82019 )
      ( MAKE-2PILE ?auto_82016 ?auto_82017 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82024 - BLOCK
      ?auto_82025 - BLOCK
    )
    :vars
    (
      ?auto_82030 - BLOCK
      ?auto_82028 - BLOCK
      ?auto_82027 - BLOCK
      ?auto_82029 - BLOCK
      ?auto_82026 - BLOCK
      ?auto_82031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82030 ?auto_82025 ) ( ON-TABLE ?auto_82024 ) ( ON ?auto_82025 ?auto_82024 ) ( not ( = ?auto_82024 ?auto_82025 ) ) ( not ( = ?auto_82024 ?auto_82030 ) ) ( not ( = ?auto_82025 ?auto_82030 ) ) ( not ( = ?auto_82024 ?auto_82028 ) ) ( not ( = ?auto_82024 ?auto_82027 ) ) ( not ( = ?auto_82025 ?auto_82028 ) ) ( not ( = ?auto_82025 ?auto_82027 ) ) ( not ( = ?auto_82030 ?auto_82028 ) ) ( not ( = ?auto_82030 ?auto_82027 ) ) ( not ( = ?auto_82028 ?auto_82027 ) ) ( ON ?auto_82028 ?auto_82030 ) ( ON-TABLE ?auto_82029 ) ( not ( = ?auto_82029 ?auto_82026 ) ) ( not ( = ?auto_82029 ?auto_82031 ) ) ( not ( = ?auto_82029 ?auto_82027 ) ) ( not ( = ?auto_82026 ?auto_82031 ) ) ( not ( = ?auto_82026 ?auto_82027 ) ) ( not ( = ?auto_82031 ?auto_82027 ) ) ( not ( = ?auto_82024 ?auto_82031 ) ) ( not ( = ?auto_82024 ?auto_82029 ) ) ( not ( = ?auto_82024 ?auto_82026 ) ) ( not ( = ?auto_82025 ?auto_82031 ) ) ( not ( = ?auto_82025 ?auto_82029 ) ) ( not ( = ?auto_82025 ?auto_82026 ) ) ( not ( = ?auto_82030 ?auto_82031 ) ) ( not ( = ?auto_82030 ?auto_82029 ) ) ( not ( = ?auto_82030 ?auto_82026 ) ) ( not ( = ?auto_82028 ?auto_82031 ) ) ( not ( = ?auto_82028 ?auto_82029 ) ) ( not ( = ?auto_82028 ?auto_82026 ) ) ( ON ?auto_82027 ?auto_82028 ) ( ON ?auto_82031 ?auto_82027 ) ( CLEAR ?auto_82031 ) ( HOLDING ?auto_82026 ) ( CLEAR ?auto_82029 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82029 ?auto_82026 )
      ( MAKE-2PILE ?auto_82024 ?auto_82025 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83325 - BLOCK
      ?auto_83326 - BLOCK
    )
    :vars
    (
      ?auto_83329 - BLOCK
      ?auto_83327 - BLOCK
      ?auto_83330 - BLOCK
      ?auto_83328 - BLOCK
      ?auto_83331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83329 ?auto_83326 ) ( ON-TABLE ?auto_83325 ) ( ON ?auto_83326 ?auto_83325 ) ( not ( = ?auto_83325 ?auto_83326 ) ) ( not ( = ?auto_83325 ?auto_83329 ) ) ( not ( = ?auto_83326 ?auto_83329 ) ) ( not ( = ?auto_83325 ?auto_83327 ) ) ( not ( = ?auto_83325 ?auto_83330 ) ) ( not ( = ?auto_83326 ?auto_83327 ) ) ( not ( = ?auto_83326 ?auto_83330 ) ) ( not ( = ?auto_83329 ?auto_83327 ) ) ( not ( = ?auto_83329 ?auto_83330 ) ) ( not ( = ?auto_83327 ?auto_83330 ) ) ( ON ?auto_83327 ?auto_83329 ) ( not ( = ?auto_83328 ?auto_83331 ) ) ( not ( = ?auto_83328 ?auto_83330 ) ) ( not ( = ?auto_83331 ?auto_83330 ) ) ( not ( = ?auto_83325 ?auto_83331 ) ) ( not ( = ?auto_83325 ?auto_83328 ) ) ( not ( = ?auto_83326 ?auto_83331 ) ) ( not ( = ?auto_83326 ?auto_83328 ) ) ( not ( = ?auto_83329 ?auto_83331 ) ) ( not ( = ?auto_83329 ?auto_83328 ) ) ( not ( = ?auto_83327 ?auto_83331 ) ) ( not ( = ?auto_83327 ?auto_83328 ) ) ( ON ?auto_83330 ?auto_83327 ) ( ON ?auto_83331 ?auto_83330 ) ( ON ?auto_83328 ?auto_83331 ) ( CLEAR ?auto_83328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83325 ?auto_83326 ?auto_83329 ?auto_83327 ?auto_83330 ?auto_83331 )
      ( MAKE-2PILE ?auto_83325 ?auto_83326 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82040 - BLOCK
      ?auto_82041 - BLOCK
    )
    :vars
    (
      ?auto_82045 - BLOCK
      ?auto_82044 - BLOCK
      ?auto_82043 - BLOCK
      ?auto_82042 - BLOCK
      ?auto_82047 - BLOCK
      ?auto_82046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82045 ?auto_82041 ) ( ON-TABLE ?auto_82040 ) ( ON ?auto_82041 ?auto_82040 ) ( not ( = ?auto_82040 ?auto_82041 ) ) ( not ( = ?auto_82040 ?auto_82045 ) ) ( not ( = ?auto_82041 ?auto_82045 ) ) ( not ( = ?auto_82040 ?auto_82044 ) ) ( not ( = ?auto_82040 ?auto_82043 ) ) ( not ( = ?auto_82041 ?auto_82044 ) ) ( not ( = ?auto_82041 ?auto_82043 ) ) ( not ( = ?auto_82045 ?auto_82044 ) ) ( not ( = ?auto_82045 ?auto_82043 ) ) ( not ( = ?auto_82044 ?auto_82043 ) ) ( ON ?auto_82044 ?auto_82045 ) ( not ( = ?auto_82042 ?auto_82047 ) ) ( not ( = ?auto_82042 ?auto_82046 ) ) ( not ( = ?auto_82042 ?auto_82043 ) ) ( not ( = ?auto_82047 ?auto_82046 ) ) ( not ( = ?auto_82047 ?auto_82043 ) ) ( not ( = ?auto_82046 ?auto_82043 ) ) ( not ( = ?auto_82040 ?auto_82046 ) ) ( not ( = ?auto_82040 ?auto_82042 ) ) ( not ( = ?auto_82040 ?auto_82047 ) ) ( not ( = ?auto_82041 ?auto_82046 ) ) ( not ( = ?auto_82041 ?auto_82042 ) ) ( not ( = ?auto_82041 ?auto_82047 ) ) ( not ( = ?auto_82045 ?auto_82046 ) ) ( not ( = ?auto_82045 ?auto_82042 ) ) ( not ( = ?auto_82045 ?auto_82047 ) ) ( not ( = ?auto_82044 ?auto_82046 ) ) ( not ( = ?auto_82044 ?auto_82042 ) ) ( not ( = ?auto_82044 ?auto_82047 ) ) ( ON ?auto_82043 ?auto_82044 ) ( ON ?auto_82046 ?auto_82043 ) ( ON ?auto_82047 ?auto_82046 ) ( CLEAR ?auto_82047 ) ( HOLDING ?auto_82042 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82042 )
      ( MAKE-2PILE ?auto_82040 ?auto_82041 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82048 - BLOCK
      ?auto_82049 - BLOCK
    )
    :vars
    (
      ?auto_82052 - BLOCK
      ?auto_82050 - BLOCK
      ?auto_82053 - BLOCK
      ?auto_82055 - BLOCK
      ?auto_82054 - BLOCK
      ?auto_82051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82052 ?auto_82049 ) ( ON-TABLE ?auto_82048 ) ( ON ?auto_82049 ?auto_82048 ) ( not ( = ?auto_82048 ?auto_82049 ) ) ( not ( = ?auto_82048 ?auto_82052 ) ) ( not ( = ?auto_82049 ?auto_82052 ) ) ( not ( = ?auto_82048 ?auto_82050 ) ) ( not ( = ?auto_82048 ?auto_82053 ) ) ( not ( = ?auto_82049 ?auto_82050 ) ) ( not ( = ?auto_82049 ?auto_82053 ) ) ( not ( = ?auto_82052 ?auto_82050 ) ) ( not ( = ?auto_82052 ?auto_82053 ) ) ( not ( = ?auto_82050 ?auto_82053 ) ) ( ON ?auto_82050 ?auto_82052 ) ( not ( = ?auto_82055 ?auto_82054 ) ) ( not ( = ?auto_82055 ?auto_82051 ) ) ( not ( = ?auto_82055 ?auto_82053 ) ) ( not ( = ?auto_82054 ?auto_82051 ) ) ( not ( = ?auto_82054 ?auto_82053 ) ) ( not ( = ?auto_82051 ?auto_82053 ) ) ( not ( = ?auto_82048 ?auto_82051 ) ) ( not ( = ?auto_82048 ?auto_82055 ) ) ( not ( = ?auto_82048 ?auto_82054 ) ) ( not ( = ?auto_82049 ?auto_82051 ) ) ( not ( = ?auto_82049 ?auto_82055 ) ) ( not ( = ?auto_82049 ?auto_82054 ) ) ( not ( = ?auto_82052 ?auto_82051 ) ) ( not ( = ?auto_82052 ?auto_82055 ) ) ( not ( = ?auto_82052 ?auto_82054 ) ) ( not ( = ?auto_82050 ?auto_82051 ) ) ( not ( = ?auto_82050 ?auto_82055 ) ) ( not ( = ?auto_82050 ?auto_82054 ) ) ( ON ?auto_82053 ?auto_82050 ) ( ON ?auto_82051 ?auto_82053 ) ( ON ?auto_82054 ?auto_82051 ) ( ON ?auto_82055 ?auto_82054 ) ( CLEAR ?auto_82055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82048 ?auto_82049 ?auto_82052 ?auto_82050 ?auto_82053 ?auto_82051 ?auto_82054 )
      ( MAKE-2PILE ?auto_82048 ?auto_82049 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82062 - BLOCK
      ?auto_82063 - BLOCK
      ?auto_82064 - BLOCK
      ?auto_82065 - BLOCK
      ?auto_82066 - BLOCK
      ?auto_82067 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_82067 ) ( CLEAR ?auto_82066 ) ( ON-TABLE ?auto_82062 ) ( ON ?auto_82063 ?auto_82062 ) ( ON ?auto_82064 ?auto_82063 ) ( ON ?auto_82065 ?auto_82064 ) ( ON ?auto_82066 ?auto_82065 ) ( not ( = ?auto_82062 ?auto_82063 ) ) ( not ( = ?auto_82062 ?auto_82064 ) ) ( not ( = ?auto_82062 ?auto_82065 ) ) ( not ( = ?auto_82062 ?auto_82066 ) ) ( not ( = ?auto_82062 ?auto_82067 ) ) ( not ( = ?auto_82063 ?auto_82064 ) ) ( not ( = ?auto_82063 ?auto_82065 ) ) ( not ( = ?auto_82063 ?auto_82066 ) ) ( not ( = ?auto_82063 ?auto_82067 ) ) ( not ( = ?auto_82064 ?auto_82065 ) ) ( not ( = ?auto_82064 ?auto_82066 ) ) ( not ( = ?auto_82064 ?auto_82067 ) ) ( not ( = ?auto_82065 ?auto_82066 ) ) ( not ( = ?auto_82065 ?auto_82067 ) ) ( not ( = ?auto_82066 ?auto_82067 ) ) )
    :subtasks
    ( ( !STACK ?auto_82067 ?auto_82066 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82068 - BLOCK
      ?auto_82069 - BLOCK
      ?auto_82070 - BLOCK
      ?auto_82071 - BLOCK
      ?auto_82072 - BLOCK
      ?auto_82073 - BLOCK
    )
    :vars
    (
      ?auto_82074 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_82072 ) ( ON-TABLE ?auto_82068 ) ( ON ?auto_82069 ?auto_82068 ) ( ON ?auto_82070 ?auto_82069 ) ( ON ?auto_82071 ?auto_82070 ) ( ON ?auto_82072 ?auto_82071 ) ( not ( = ?auto_82068 ?auto_82069 ) ) ( not ( = ?auto_82068 ?auto_82070 ) ) ( not ( = ?auto_82068 ?auto_82071 ) ) ( not ( = ?auto_82068 ?auto_82072 ) ) ( not ( = ?auto_82068 ?auto_82073 ) ) ( not ( = ?auto_82069 ?auto_82070 ) ) ( not ( = ?auto_82069 ?auto_82071 ) ) ( not ( = ?auto_82069 ?auto_82072 ) ) ( not ( = ?auto_82069 ?auto_82073 ) ) ( not ( = ?auto_82070 ?auto_82071 ) ) ( not ( = ?auto_82070 ?auto_82072 ) ) ( not ( = ?auto_82070 ?auto_82073 ) ) ( not ( = ?auto_82071 ?auto_82072 ) ) ( not ( = ?auto_82071 ?auto_82073 ) ) ( not ( = ?auto_82072 ?auto_82073 ) ) ( ON ?auto_82073 ?auto_82074 ) ( CLEAR ?auto_82073 ) ( HAND-EMPTY ) ( not ( = ?auto_82068 ?auto_82074 ) ) ( not ( = ?auto_82069 ?auto_82074 ) ) ( not ( = ?auto_82070 ?auto_82074 ) ) ( not ( = ?auto_82071 ?auto_82074 ) ) ( not ( = ?auto_82072 ?auto_82074 ) ) ( not ( = ?auto_82073 ?auto_82074 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82073 ?auto_82074 )
      ( MAKE-6PILE ?auto_82068 ?auto_82069 ?auto_82070 ?auto_82071 ?auto_82072 ?auto_82073 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82075 - BLOCK
      ?auto_82076 - BLOCK
      ?auto_82077 - BLOCK
      ?auto_82078 - BLOCK
      ?auto_82079 - BLOCK
      ?auto_82080 - BLOCK
    )
    :vars
    (
      ?auto_82081 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82075 ) ( ON ?auto_82076 ?auto_82075 ) ( ON ?auto_82077 ?auto_82076 ) ( ON ?auto_82078 ?auto_82077 ) ( not ( = ?auto_82075 ?auto_82076 ) ) ( not ( = ?auto_82075 ?auto_82077 ) ) ( not ( = ?auto_82075 ?auto_82078 ) ) ( not ( = ?auto_82075 ?auto_82079 ) ) ( not ( = ?auto_82075 ?auto_82080 ) ) ( not ( = ?auto_82076 ?auto_82077 ) ) ( not ( = ?auto_82076 ?auto_82078 ) ) ( not ( = ?auto_82076 ?auto_82079 ) ) ( not ( = ?auto_82076 ?auto_82080 ) ) ( not ( = ?auto_82077 ?auto_82078 ) ) ( not ( = ?auto_82077 ?auto_82079 ) ) ( not ( = ?auto_82077 ?auto_82080 ) ) ( not ( = ?auto_82078 ?auto_82079 ) ) ( not ( = ?auto_82078 ?auto_82080 ) ) ( not ( = ?auto_82079 ?auto_82080 ) ) ( ON ?auto_82080 ?auto_82081 ) ( CLEAR ?auto_82080 ) ( not ( = ?auto_82075 ?auto_82081 ) ) ( not ( = ?auto_82076 ?auto_82081 ) ) ( not ( = ?auto_82077 ?auto_82081 ) ) ( not ( = ?auto_82078 ?auto_82081 ) ) ( not ( = ?auto_82079 ?auto_82081 ) ) ( not ( = ?auto_82080 ?auto_82081 ) ) ( HOLDING ?auto_82079 ) ( CLEAR ?auto_82078 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82075 ?auto_82076 ?auto_82077 ?auto_82078 ?auto_82079 )
      ( MAKE-6PILE ?auto_82075 ?auto_82076 ?auto_82077 ?auto_82078 ?auto_82079 ?auto_82080 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82082 - BLOCK
      ?auto_82083 - BLOCK
      ?auto_82084 - BLOCK
      ?auto_82085 - BLOCK
      ?auto_82086 - BLOCK
      ?auto_82087 - BLOCK
    )
    :vars
    (
      ?auto_82088 - BLOCK
      ?auto_82089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82082 ) ( ON ?auto_82083 ?auto_82082 ) ( ON ?auto_82084 ?auto_82083 ) ( ON ?auto_82085 ?auto_82084 ) ( not ( = ?auto_82082 ?auto_82083 ) ) ( not ( = ?auto_82082 ?auto_82084 ) ) ( not ( = ?auto_82082 ?auto_82085 ) ) ( not ( = ?auto_82082 ?auto_82086 ) ) ( not ( = ?auto_82082 ?auto_82087 ) ) ( not ( = ?auto_82083 ?auto_82084 ) ) ( not ( = ?auto_82083 ?auto_82085 ) ) ( not ( = ?auto_82083 ?auto_82086 ) ) ( not ( = ?auto_82083 ?auto_82087 ) ) ( not ( = ?auto_82084 ?auto_82085 ) ) ( not ( = ?auto_82084 ?auto_82086 ) ) ( not ( = ?auto_82084 ?auto_82087 ) ) ( not ( = ?auto_82085 ?auto_82086 ) ) ( not ( = ?auto_82085 ?auto_82087 ) ) ( not ( = ?auto_82086 ?auto_82087 ) ) ( ON ?auto_82087 ?auto_82088 ) ( not ( = ?auto_82082 ?auto_82088 ) ) ( not ( = ?auto_82083 ?auto_82088 ) ) ( not ( = ?auto_82084 ?auto_82088 ) ) ( not ( = ?auto_82085 ?auto_82088 ) ) ( not ( = ?auto_82086 ?auto_82088 ) ) ( not ( = ?auto_82087 ?auto_82088 ) ) ( CLEAR ?auto_82085 ) ( ON ?auto_82086 ?auto_82087 ) ( CLEAR ?auto_82086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82089 ) ( ON ?auto_82088 ?auto_82089 ) ( not ( = ?auto_82089 ?auto_82088 ) ) ( not ( = ?auto_82089 ?auto_82087 ) ) ( not ( = ?auto_82089 ?auto_82086 ) ) ( not ( = ?auto_82082 ?auto_82089 ) ) ( not ( = ?auto_82083 ?auto_82089 ) ) ( not ( = ?auto_82084 ?auto_82089 ) ) ( not ( = ?auto_82085 ?auto_82089 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82089 ?auto_82088 ?auto_82087 )
      ( MAKE-6PILE ?auto_82082 ?auto_82083 ?auto_82084 ?auto_82085 ?auto_82086 ?auto_82087 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82090 - BLOCK
      ?auto_82091 - BLOCK
      ?auto_82092 - BLOCK
      ?auto_82093 - BLOCK
      ?auto_82094 - BLOCK
      ?auto_82095 - BLOCK
    )
    :vars
    (
      ?auto_82096 - BLOCK
      ?auto_82097 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82090 ) ( ON ?auto_82091 ?auto_82090 ) ( ON ?auto_82092 ?auto_82091 ) ( not ( = ?auto_82090 ?auto_82091 ) ) ( not ( = ?auto_82090 ?auto_82092 ) ) ( not ( = ?auto_82090 ?auto_82093 ) ) ( not ( = ?auto_82090 ?auto_82094 ) ) ( not ( = ?auto_82090 ?auto_82095 ) ) ( not ( = ?auto_82091 ?auto_82092 ) ) ( not ( = ?auto_82091 ?auto_82093 ) ) ( not ( = ?auto_82091 ?auto_82094 ) ) ( not ( = ?auto_82091 ?auto_82095 ) ) ( not ( = ?auto_82092 ?auto_82093 ) ) ( not ( = ?auto_82092 ?auto_82094 ) ) ( not ( = ?auto_82092 ?auto_82095 ) ) ( not ( = ?auto_82093 ?auto_82094 ) ) ( not ( = ?auto_82093 ?auto_82095 ) ) ( not ( = ?auto_82094 ?auto_82095 ) ) ( ON ?auto_82095 ?auto_82096 ) ( not ( = ?auto_82090 ?auto_82096 ) ) ( not ( = ?auto_82091 ?auto_82096 ) ) ( not ( = ?auto_82092 ?auto_82096 ) ) ( not ( = ?auto_82093 ?auto_82096 ) ) ( not ( = ?auto_82094 ?auto_82096 ) ) ( not ( = ?auto_82095 ?auto_82096 ) ) ( ON ?auto_82094 ?auto_82095 ) ( CLEAR ?auto_82094 ) ( ON-TABLE ?auto_82097 ) ( ON ?auto_82096 ?auto_82097 ) ( not ( = ?auto_82097 ?auto_82096 ) ) ( not ( = ?auto_82097 ?auto_82095 ) ) ( not ( = ?auto_82097 ?auto_82094 ) ) ( not ( = ?auto_82090 ?auto_82097 ) ) ( not ( = ?auto_82091 ?auto_82097 ) ) ( not ( = ?auto_82092 ?auto_82097 ) ) ( not ( = ?auto_82093 ?auto_82097 ) ) ( HOLDING ?auto_82093 ) ( CLEAR ?auto_82092 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82090 ?auto_82091 ?auto_82092 ?auto_82093 )
      ( MAKE-6PILE ?auto_82090 ?auto_82091 ?auto_82092 ?auto_82093 ?auto_82094 ?auto_82095 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82098 - BLOCK
      ?auto_82099 - BLOCK
      ?auto_82100 - BLOCK
      ?auto_82101 - BLOCK
      ?auto_82102 - BLOCK
      ?auto_82103 - BLOCK
    )
    :vars
    (
      ?auto_82104 - BLOCK
      ?auto_82105 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82098 ) ( ON ?auto_82099 ?auto_82098 ) ( ON ?auto_82100 ?auto_82099 ) ( not ( = ?auto_82098 ?auto_82099 ) ) ( not ( = ?auto_82098 ?auto_82100 ) ) ( not ( = ?auto_82098 ?auto_82101 ) ) ( not ( = ?auto_82098 ?auto_82102 ) ) ( not ( = ?auto_82098 ?auto_82103 ) ) ( not ( = ?auto_82099 ?auto_82100 ) ) ( not ( = ?auto_82099 ?auto_82101 ) ) ( not ( = ?auto_82099 ?auto_82102 ) ) ( not ( = ?auto_82099 ?auto_82103 ) ) ( not ( = ?auto_82100 ?auto_82101 ) ) ( not ( = ?auto_82100 ?auto_82102 ) ) ( not ( = ?auto_82100 ?auto_82103 ) ) ( not ( = ?auto_82101 ?auto_82102 ) ) ( not ( = ?auto_82101 ?auto_82103 ) ) ( not ( = ?auto_82102 ?auto_82103 ) ) ( ON ?auto_82103 ?auto_82104 ) ( not ( = ?auto_82098 ?auto_82104 ) ) ( not ( = ?auto_82099 ?auto_82104 ) ) ( not ( = ?auto_82100 ?auto_82104 ) ) ( not ( = ?auto_82101 ?auto_82104 ) ) ( not ( = ?auto_82102 ?auto_82104 ) ) ( not ( = ?auto_82103 ?auto_82104 ) ) ( ON ?auto_82102 ?auto_82103 ) ( ON-TABLE ?auto_82105 ) ( ON ?auto_82104 ?auto_82105 ) ( not ( = ?auto_82105 ?auto_82104 ) ) ( not ( = ?auto_82105 ?auto_82103 ) ) ( not ( = ?auto_82105 ?auto_82102 ) ) ( not ( = ?auto_82098 ?auto_82105 ) ) ( not ( = ?auto_82099 ?auto_82105 ) ) ( not ( = ?auto_82100 ?auto_82105 ) ) ( not ( = ?auto_82101 ?auto_82105 ) ) ( CLEAR ?auto_82100 ) ( ON ?auto_82101 ?auto_82102 ) ( CLEAR ?auto_82101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82105 ?auto_82104 ?auto_82103 ?auto_82102 )
      ( MAKE-6PILE ?auto_82098 ?auto_82099 ?auto_82100 ?auto_82101 ?auto_82102 ?auto_82103 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82106 - BLOCK
      ?auto_82107 - BLOCK
      ?auto_82108 - BLOCK
      ?auto_82109 - BLOCK
      ?auto_82110 - BLOCK
      ?auto_82111 - BLOCK
    )
    :vars
    (
      ?auto_82112 - BLOCK
      ?auto_82113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82106 ) ( ON ?auto_82107 ?auto_82106 ) ( not ( = ?auto_82106 ?auto_82107 ) ) ( not ( = ?auto_82106 ?auto_82108 ) ) ( not ( = ?auto_82106 ?auto_82109 ) ) ( not ( = ?auto_82106 ?auto_82110 ) ) ( not ( = ?auto_82106 ?auto_82111 ) ) ( not ( = ?auto_82107 ?auto_82108 ) ) ( not ( = ?auto_82107 ?auto_82109 ) ) ( not ( = ?auto_82107 ?auto_82110 ) ) ( not ( = ?auto_82107 ?auto_82111 ) ) ( not ( = ?auto_82108 ?auto_82109 ) ) ( not ( = ?auto_82108 ?auto_82110 ) ) ( not ( = ?auto_82108 ?auto_82111 ) ) ( not ( = ?auto_82109 ?auto_82110 ) ) ( not ( = ?auto_82109 ?auto_82111 ) ) ( not ( = ?auto_82110 ?auto_82111 ) ) ( ON ?auto_82111 ?auto_82112 ) ( not ( = ?auto_82106 ?auto_82112 ) ) ( not ( = ?auto_82107 ?auto_82112 ) ) ( not ( = ?auto_82108 ?auto_82112 ) ) ( not ( = ?auto_82109 ?auto_82112 ) ) ( not ( = ?auto_82110 ?auto_82112 ) ) ( not ( = ?auto_82111 ?auto_82112 ) ) ( ON ?auto_82110 ?auto_82111 ) ( ON-TABLE ?auto_82113 ) ( ON ?auto_82112 ?auto_82113 ) ( not ( = ?auto_82113 ?auto_82112 ) ) ( not ( = ?auto_82113 ?auto_82111 ) ) ( not ( = ?auto_82113 ?auto_82110 ) ) ( not ( = ?auto_82106 ?auto_82113 ) ) ( not ( = ?auto_82107 ?auto_82113 ) ) ( not ( = ?auto_82108 ?auto_82113 ) ) ( not ( = ?auto_82109 ?auto_82113 ) ) ( ON ?auto_82109 ?auto_82110 ) ( CLEAR ?auto_82109 ) ( HOLDING ?auto_82108 ) ( CLEAR ?auto_82107 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82106 ?auto_82107 ?auto_82108 )
      ( MAKE-6PILE ?auto_82106 ?auto_82107 ?auto_82108 ?auto_82109 ?auto_82110 ?auto_82111 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82114 - BLOCK
      ?auto_82115 - BLOCK
      ?auto_82116 - BLOCK
      ?auto_82117 - BLOCK
      ?auto_82118 - BLOCK
      ?auto_82119 - BLOCK
    )
    :vars
    (
      ?auto_82121 - BLOCK
      ?auto_82120 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82114 ) ( ON ?auto_82115 ?auto_82114 ) ( not ( = ?auto_82114 ?auto_82115 ) ) ( not ( = ?auto_82114 ?auto_82116 ) ) ( not ( = ?auto_82114 ?auto_82117 ) ) ( not ( = ?auto_82114 ?auto_82118 ) ) ( not ( = ?auto_82114 ?auto_82119 ) ) ( not ( = ?auto_82115 ?auto_82116 ) ) ( not ( = ?auto_82115 ?auto_82117 ) ) ( not ( = ?auto_82115 ?auto_82118 ) ) ( not ( = ?auto_82115 ?auto_82119 ) ) ( not ( = ?auto_82116 ?auto_82117 ) ) ( not ( = ?auto_82116 ?auto_82118 ) ) ( not ( = ?auto_82116 ?auto_82119 ) ) ( not ( = ?auto_82117 ?auto_82118 ) ) ( not ( = ?auto_82117 ?auto_82119 ) ) ( not ( = ?auto_82118 ?auto_82119 ) ) ( ON ?auto_82119 ?auto_82121 ) ( not ( = ?auto_82114 ?auto_82121 ) ) ( not ( = ?auto_82115 ?auto_82121 ) ) ( not ( = ?auto_82116 ?auto_82121 ) ) ( not ( = ?auto_82117 ?auto_82121 ) ) ( not ( = ?auto_82118 ?auto_82121 ) ) ( not ( = ?auto_82119 ?auto_82121 ) ) ( ON ?auto_82118 ?auto_82119 ) ( ON-TABLE ?auto_82120 ) ( ON ?auto_82121 ?auto_82120 ) ( not ( = ?auto_82120 ?auto_82121 ) ) ( not ( = ?auto_82120 ?auto_82119 ) ) ( not ( = ?auto_82120 ?auto_82118 ) ) ( not ( = ?auto_82114 ?auto_82120 ) ) ( not ( = ?auto_82115 ?auto_82120 ) ) ( not ( = ?auto_82116 ?auto_82120 ) ) ( not ( = ?auto_82117 ?auto_82120 ) ) ( ON ?auto_82117 ?auto_82118 ) ( CLEAR ?auto_82115 ) ( ON ?auto_82116 ?auto_82117 ) ( CLEAR ?auto_82116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82120 ?auto_82121 ?auto_82119 ?auto_82118 ?auto_82117 )
      ( MAKE-6PILE ?auto_82114 ?auto_82115 ?auto_82116 ?auto_82117 ?auto_82118 ?auto_82119 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82122 - BLOCK
      ?auto_82123 - BLOCK
      ?auto_82124 - BLOCK
      ?auto_82125 - BLOCK
      ?auto_82126 - BLOCK
      ?auto_82127 - BLOCK
    )
    :vars
    (
      ?auto_82129 - BLOCK
      ?auto_82128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82122 ) ( not ( = ?auto_82122 ?auto_82123 ) ) ( not ( = ?auto_82122 ?auto_82124 ) ) ( not ( = ?auto_82122 ?auto_82125 ) ) ( not ( = ?auto_82122 ?auto_82126 ) ) ( not ( = ?auto_82122 ?auto_82127 ) ) ( not ( = ?auto_82123 ?auto_82124 ) ) ( not ( = ?auto_82123 ?auto_82125 ) ) ( not ( = ?auto_82123 ?auto_82126 ) ) ( not ( = ?auto_82123 ?auto_82127 ) ) ( not ( = ?auto_82124 ?auto_82125 ) ) ( not ( = ?auto_82124 ?auto_82126 ) ) ( not ( = ?auto_82124 ?auto_82127 ) ) ( not ( = ?auto_82125 ?auto_82126 ) ) ( not ( = ?auto_82125 ?auto_82127 ) ) ( not ( = ?auto_82126 ?auto_82127 ) ) ( ON ?auto_82127 ?auto_82129 ) ( not ( = ?auto_82122 ?auto_82129 ) ) ( not ( = ?auto_82123 ?auto_82129 ) ) ( not ( = ?auto_82124 ?auto_82129 ) ) ( not ( = ?auto_82125 ?auto_82129 ) ) ( not ( = ?auto_82126 ?auto_82129 ) ) ( not ( = ?auto_82127 ?auto_82129 ) ) ( ON ?auto_82126 ?auto_82127 ) ( ON-TABLE ?auto_82128 ) ( ON ?auto_82129 ?auto_82128 ) ( not ( = ?auto_82128 ?auto_82129 ) ) ( not ( = ?auto_82128 ?auto_82127 ) ) ( not ( = ?auto_82128 ?auto_82126 ) ) ( not ( = ?auto_82122 ?auto_82128 ) ) ( not ( = ?auto_82123 ?auto_82128 ) ) ( not ( = ?auto_82124 ?auto_82128 ) ) ( not ( = ?auto_82125 ?auto_82128 ) ) ( ON ?auto_82125 ?auto_82126 ) ( ON ?auto_82124 ?auto_82125 ) ( CLEAR ?auto_82124 ) ( HOLDING ?auto_82123 ) ( CLEAR ?auto_82122 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82122 ?auto_82123 )
      ( MAKE-6PILE ?auto_82122 ?auto_82123 ?auto_82124 ?auto_82125 ?auto_82126 ?auto_82127 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82130 - BLOCK
      ?auto_82131 - BLOCK
      ?auto_82132 - BLOCK
      ?auto_82133 - BLOCK
      ?auto_82134 - BLOCK
      ?auto_82135 - BLOCK
    )
    :vars
    (
      ?auto_82136 - BLOCK
      ?auto_82137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82130 ) ( not ( = ?auto_82130 ?auto_82131 ) ) ( not ( = ?auto_82130 ?auto_82132 ) ) ( not ( = ?auto_82130 ?auto_82133 ) ) ( not ( = ?auto_82130 ?auto_82134 ) ) ( not ( = ?auto_82130 ?auto_82135 ) ) ( not ( = ?auto_82131 ?auto_82132 ) ) ( not ( = ?auto_82131 ?auto_82133 ) ) ( not ( = ?auto_82131 ?auto_82134 ) ) ( not ( = ?auto_82131 ?auto_82135 ) ) ( not ( = ?auto_82132 ?auto_82133 ) ) ( not ( = ?auto_82132 ?auto_82134 ) ) ( not ( = ?auto_82132 ?auto_82135 ) ) ( not ( = ?auto_82133 ?auto_82134 ) ) ( not ( = ?auto_82133 ?auto_82135 ) ) ( not ( = ?auto_82134 ?auto_82135 ) ) ( ON ?auto_82135 ?auto_82136 ) ( not ( = ?auto_82130 ?auto_82136 ) ) ( not ( = ?auto_82131 ?auto_82136 ) ) ( not ( = ?auto_82132 ?auto_82136 ) ) ( not ( = ?auto_82133 ?auto_82136 ) ) ( not ( = ?auto_82134 ?auto_82136 ) ) ( not ( = ?auto_82135 ?auto_82136 ) ) ( ON ?auto_82134 ?auto_82135 ) ( ON-TABLE ?auto_82137 ) ( ON ?auto_82136 ?auto_82137 ) ( not ( = ?auto_82137 ?auto_82136 ) ) ( not ( = ?auto_82137 ?auto_82135 ) ) ( not ( = ?auto_82137 ?auto_82134 ) ) ( not ( = ?auto_82130 ?auto_82137 ) ) ( not ( = ?auto_82131 ?auto_82137 ) ) ( not ( = ?auto_82132 ?auto_82137 ) ) ( not ( = ?auto_82133 ?auto_82137 ) ) ( ON ?auto_82133 ?auto_82134 ) ( ON ?auto_82132 ?auto_82133 ) ( CLEAR ?auto_82130 ) ( ON ?auto_82131 ?auto_82132 ) ( CLEAR ?auto_82131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82137 ?auto_82136 ?auto_82135 ?auto_82134 ?auto_82133 ?auto_82132 )
      ( MAKE-6PILE ?auto_82130 ?auto_82131 ?auto_82132 ?auto_82133 ?auto_82134 ?auto_82135 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82138 - BLOCK
      ?auto_82139 - BLOCK
      ?auto_82140 - BLOCK
      ?auto_82141 - BLOCK
      ?auto_82142 - BLOCK
      ?auto_82143 - BLOCK
    )
    :vars
    (
      ?auto_82144 - BLOCK
      ?auto_82145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82138 ?auto_82139 ) ) ( not ( = ?auto_82138 ?auto_82140 ) ) ( not ( = ?auto_82138 ?auto_82141 ) ) ( not ( = ?auto_82138 ?auto_82142 ) ) ( not ( = ?auto_82138 ?auto_82143 ) ) ( not ( = ?auto_82139 ?auto_82140 ) ) ( not ( = ?auto_82139 ?auto_82141 ) ) ( not ( = ?auto_82139 ?auto_82142 ) ) ( not ( = ?auto_82139 ?auto_82143 ) ) ( not ( = ?auto_82140 ?auto_82141 ) ) ( not ( = ?auto_82140 ?auto_82142 ) ) ( not ( = ?auto_82140 ?auto_82143 ) ) ( not ( = ?auto_82141 ?auto_82142 ) ) ( not ( = ?auto_82141 ?auto_82143 ) ) ( not ( = ?auto_82142 ?auto_82143 ) ) ( ON ?auto_82143 ?auto_82144 ) ( not ( = ?auto_82138 ?auto_82144 ) ) ( not ( = ?auto_82139 ?auto_82144 ) ) ( not ( = ?auto_82140 ?auto_82144 ) ) ( not ( = ?auto_82141 ?auto_82144 ) ) ( not ( = ?auto_82142 ?auto_82144 ) ) ( not ( = ?auto_82143 ?auto_82144 ) ) ( ON ?auto_82142 ?auto_82143 ) ( ON-TABLE ?auto_82145 ) ( ON ?auto_82144 ?auto_82145 ) ( not ( = ?auto_82145 ?auto_82144 ) ) ( not ( = ?auto_82145 ?auto_82143 ) ) ( not ( = ?auto_82145 ?auto_82142 ) ) ( not ( = ?auto_82138 ?auto_82145 ) ) ( not ( = ?auto_82139 ?auto_82145 ) ) ( not ( = ?auto_82140 ?auto_82145 ) ) ( not ( = ?auto_82141 ?auto_82145 ) ) ( ON ?auto_82141 ?auto_82142 ) ( ON ?auto_82140 ?auto_82141 ) ( ON ?auto_82139 ?auto_82140 ) ( CLEAR ?auto_82139 ) ( HOLDING ?auto_82138 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82138 )
      ( MAKE-6PILE ?auto_82138 ?auto_82139 ?auto_82140 ?auto_82141 ?auto_82142 ?auto_82143 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82146 - BLOCK
      ?auto_82147 - BLOCK
      ?auto_82148 - BLOCK
      ?auto_82149 - BLOCK
      ?auto_82150 - BLOCK
      ?auto_82151 - BLOCK
    )
    :vars
    (
      ?auto_82152 - BLOCK
      ?auto_82153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82146 ?auto_82147 ) ) ( not ( = ?auto_82146 ?auto_82148 ) ) ( not ( = ?auto_82146 ?auto_82149 ) ) ( not ( = ?auto_82146 ?auto_82150 ) ) ( not ( = ?auto_82146 ?auto_82151 ) ) ( not ( = ?auto_82147 ?auto_82148 ) ) ( not ( = ?auto_82147 ?auto_82149 ) ) ( not ( = ?auto_82147 ?auto_82150 ) ) ( not ( = ?auto_82147 ?auto_82151 ) ) ( not ( = ?auto_82148 ?auto_82149 ) ) ( not ( = ?auto_82148 ?auto_82150 ) ) ( not ( = ?auto_82148 ?auto_82151 ) ) ( not ( = ?auto_82149 ?auto_82150 ) ) ( not ( = ?auto_82149 ?auto_82151 ) ) ( not ( = ?auto_82150 ?auto_82151 ) ) ( ON ?auto_82151 ?auto_82152 ) ( not ( = ?auto_82146 ?auto_82152 ) ) ( not ( = ?auto_82147 ?auto_82152 ) ) ( not ( = ?auto_82148 ?auto_82152 ) ) ( not ( = ?auto_82149 ?auto_82152 ) ) ( not ( = ?auto_82150 ?auto_82152 ) ) ( not ( = ?auto_82151 ?auto_82152 ) ) ( ON ?auto_82150 ?auto_82151 ) ( ON-TABLE ?auto_82153 ) ( ON ?auto_82152 ?auto_82153 ) ( not ( = ?auto_82153 ?auto_82152 ) ) ( not ( = ?auto_82153 ?auto_82151 ) ) ( not ( = ?auto_82153 ?auto_82150 ) ) ( not ( = ?auto_82146 ?auto_82153 ) ) ( not ( = ?auto_82147 ?auto_82153 ) ) ( not ( = ?auto_82148 ?auto_82153 ) ) ( not ( = ?auto_82149 ?auto_82153 ) ) ( ON ?auto_82149 ?auto_82150 ) ( ON ?auto_82148 ?auto_82149 ) ( ON ?auto_82147 ?auto_82148 ) ( ON ?auto_82146 ?auto_82147 ) ( CLEAR ?auto_82146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82153 ?auto_82152 ?auto_82151 ?auto_82150 ?auto_82149 ?auto_82148 ?auto_82147 )
      ( MAKE-6PILE ?auto_82146 ?auto_82147 ?auto_82148 ?auto_82149 ?auto_82150 ?auto_82151 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82155 - BLOCK
    )
    :vars
    (
      ?auto_82156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82156 ?auto_82155 ) ( CLEAR ?auto_82156 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82155 ) ( not ( = ?auto_82155 ?auto_82156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82156 ?auto_82155 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82157 - BLOCK
    )
    :vars
    (
      ?auto_82158 - BLOCK
      ?auto_82159 - BLOCK
      ?auto_82160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82158 ?auto_82157 ) ( CLEAR ?auto_82158 ) ( ON-TABLE ?auto_82157 ) ( not ( = ?auto_82157 ?auto_82158 ) ) ( HOLDING ?auto_82159 ) ( CLEAR ?auto_82160 ) ( not ( = ?auto_82157 ?auto_82159 ) ) ( not ( = ?auto_82157 ?auto_82160 ) ) ( not ( = ?auto_82158 ?auto_82159 ) ) ( not ( = ?auto_82158 ?auto_82160 ) ) ( not ( = ?auto_82159 ?auto_82160 ) ) )
    :subtasks
    ( ( !STACK ?auto_82159 ?auto_82160 )
      ( MAKE-1PILE ?auto_82157 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82161 - BLOCK
    )
    :vars
    (
      ?auto_82163 - BLOCK
      ?auto_82162 - BLOCK
      ?auto_82164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82163 ?auto_82161 ) ( ON-TABLE ?auto_82161 ) ( not ( = ?auto_82161 ?auto_82163 ) ) ( CLEAR ?auto_82162 ) ( not ( = ?auto_82161 ?auto_82164 ) ) ( not ( = ?auto_82161 ?auto_82162 ) ) ( not ( = ?auto_82163 ?auto_82164 ) ) ( not ( = ?auto_82163 ?auto_82162 ) ) ( not ( = ?auto_82164 ?auto_82162 ) ) ( ON ?auto_82164 ?auto_82163 ) ( CLEAR ?auto_82164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82161 ?auto_82163 )
      ( MAKE-1PILE ?auto_82161 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82165 - BLOCK
    )
    :vars
    (
      ?auto_82166 - BLOCK
      ?auto_82167 - BLOCK
      ?auto_82168 - BLOCK
      ?auto_82169 - BLOCK
      ?auto_82172 - BLOCK
      ?auto_82171 - BLOCK
      ?auto_82170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82166 ?auto_82165 ) ( ON-TABLE ?auto_82165 ) ( not ( = ?auto_82165 ?auto_82166 ) ) ( not ( = ?auto_82165 ?auto_82167 ) ) ( not ( = ?auto_82165 ?auto_82168 ) ) ( not ( = ?auto_82166 ?auto_82167 ) ) ( not ( = ?auto_82166 ?auto_82168 ) ) ( not ( = ?auto_82167 ?auto_82168 ) ) ( ON ?auto_82167 ?auto_82166 ) ( CLEAR ?auto_82167 ) ( HOLDING ?auto_82168 ) ( CLEAR ?auto_82169 ) ( ON-TABLE ?auto_82172 ) ( ON ?auto_82171 ?auto_82172 ) ( ON ?auto_82170 ?auto_82171 ) ( ON ?auto_82169 ?auto_82170 ) ( not ( = ?auto_82172 ?auto_82171 ) ) ( not ( = ?auto_82172 ?auto_82170 ) ) ( not ( = ?auto_82172 ?auto_82169 ) ) ( not ( = ?auto_82172 ?auto_82168 ) ) ( not ( = ?auto_82171 ?auto_82170 ) ) ( not ( = ?auto_82171 ?auto_82169 ) ) ( not ( = ?auto_82171 ?auto_82168 ) ) ( not ( = ?auto_82170 ?auto_82169 ) ) ( not ( = ?auto_82170 ?auto_82168 ) ) ( not ( = ?auto_82169 ?auto_82168 ) ) ( not ( = ?auto_82165 ?auto_82169 ) ) ( not ( = ?auto_82165 ?auto_82172 ) ) ( not ( = ?auto_82165 ?auto_82171 ) ) ( not ( = ?auto_82165 ?auto_82170 ) ) ( not ( = ?auto_82166 ?auto_82169 ) ) ( not ( = ?auto_82166 ?auto_82172 ) ) ( not ( = ?auto_82166 ?auto_82171 ) ) ( not ( = ?auto_82166 ?auto_82170 ) ) ( not ( = ?auto_82167 ?auto_82169 ) ) ( not ( = ?auto_82167 ?auto_82172 ) ) ( not ( = ?auto_82167 ?auto_82171 ) ) ( not ( = ?auto_82167 ?auto_82170 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82172 ?auto_82171 ?auto_82170 ?auto_82169 ?auto_82168 )
      ( MAKE-1PILE ?auto_82165 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82173 - BLOCK
    )
    :vars
    (
      ?auto_82175 - BLOCK
      ?auto_82177 - BLOCK
      ?auto_82176 - BLOCK
      ?auto_82179 - BLOCK
      ?auto_82174 - BLOCK
      ?auto_82178 - BLOCK
      ?auto_82180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82175 ?auto_82173 ) ( ON-TABLE ?auto_82173 ) ( not ( = ?auto_82173 ?auto_82175 ) ) ( not ( = ?auto_82173 ?auto_82177 ) ) ( not ( = ?auto_82173 ?auto_82176 ) ) ( not ( = ?auto_82175 ?auto_82177 ) ) ( not ( = ?auto_82175 ?auto_82176 ) ) ( not ( = ?auto_82177 ?auto_82176 ) ) ( ON ?auto_82177 ?auto_82175 ) ( CLEAR ?auto_82179 ) ( ON-TABLE ?auto_82174 ) ( ON ?auto_82178 ?auto_82174 ) ( ON ?auto_82180 ?auto_82178 ) ( ON ?auto_82179 ?auto_82180 ) ( not ( = ?auto_82174 ?auto_82178 ) ) ( not ( = ?auto_82174 ?auto_82180 ) ) ( not ( = ?auto_82174 ?auto_82179 ) ) ( not ( = ?auto_82174 ?auto_82176 ) ) ( not ( = ?auto_82178 ?auto_82180 ) ) ( not ( = ?auto_82178 ?auto_82179 ) ) ( not ( = ?auto_82178 ?auto_82176 ) ) ( not ( = ?auto_82180 ?auto_82179 ) ) ( not ( = ?auto_82180 ?auto_82176 ) ) ( not ( = ?auto_82179 ?auto_82176 ) ) ( not ( = ?auto_82173 ?auto_82179 ) ) ( not ( = ?auto_82173 ?auto_82174 ) ) ( not ( = ?auto_82173 ?auto_82178 ) ) ( not ( = ?auto_82173 ?auto_82180 ) ) ( not ( = ?auto_82175 ?auto_82179 ) ) ( not ( = ?auto_82175 ?auto_82174 ) ) ( not ( = ?auto_82175 ?auto_82178 ) ) ( not ( = ?auto_82175 ?auto_82180 ) ) ( not ( = ?auto_82177 ?auto_82179 ) ) ( not ( = ?auto_82177 ?auto_82174 ) ) ( not ( = ?auto_82177 ?auto_82178 ) ) ( not ( = ?auto_82177 ?auto_82180 ) ) ( ON ?auto_82176 ?auto_82177 ) ( CLEAR ?auto_82176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82173 ?auto_82175 ?auto_82177 )
      ( MAKE-1PILE ?auto_82173 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82181 - BLOCK
    )
    :vars
    (
      ?auto_82188 - BLOCK
      ?auto_82182 - BLOCK
      ?auto_82185 - BLOCK
      ?auto_82183 - BLOCK
      ?auto_82186 - BLOCK
      ?auto_82184 - BLOCK
      ?auto_82187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82188 ?auto_82181 ) ( ON-TABLE ?auto_82181 ) ( not ( = ?auto_82181 ?auto_82188 ) ) ( not ( = ?auto_82181 ?auto_82182 ) ) ( not ( = ?auto_82181 ?auto_82185 ) ) ( not ( = ?auto_82188 ?auto_82182 ) ) ( not ( = ?auto_82188 ?auto_82185 ) ) ( not ( = ?auto_82182 ?auto_82185 ) ) ( ON ?auto_82182 ?auto_82188 ) ( ON-TABLE ?auto_82183 ) ( ON ?auto_82186 ?auto_82183 ) ( ON ?auto_82184 ?auto_82186 ) ( not ( = ?auto_82183 ?auto_82186 ) ) ( not ( = ?auto_82183 ?auto_82184 ) ) ( not ( = ?auto_82183 ?auto_82187 ) ) ( not ( = ?auto_82183 ?auto_82185 ) ) ( not ( = ?auto_82186 ?auto_82184 ) ) ( not ( = ?auto_82186 ?auto_82187 ) ) ( not ( = ?auto_82186 ?auto_82185 ) ) ( not ( = ?auto_82184 ?auto_82187 ) ) ( not ( = ?auto_82184 ?auto_82185 ) ) ( not ( = ?auto_82187 ?auto_82185 ) ) ( not ( = ?auto_82181 ?auto_82187 ) ) ( not ( = ?auto_82181 ?auto_82183 ) ) ( not ( = ?auto_82181 ?auto_82186 ) ) ( not ( = ?auto_82181 ?auto_82184 ) ) ( not ( = ?auto_82188 ?auto_82187 ) ) ( not ( = ?auto_82188 ?auto_82183 ) ) ( not ( = ?auto_82188 ?auto_82186 ) ) ( not ( = ?auto_82188 ?auto_82184 ) ) ( not ( = ?auto_82182 ?auto_82187 ) ) ( not ( = ?auto_82182 ?auto_82183 ) ) ( not ( = ?auto_82182 ?auto_82186 ) ) ( not ( = ?auto_82182 ?auto_82184 ) ) ( ON ?auto_82185 ?auto_82182 ) ( CLEAR ?auto_82185 ) ( HOLDING ?auto_82187 ) ( CLEAR ?auto_82184 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82183 ?auto_82186 ?auto_82184 ?auto_82187 )
      ( MAKE-1PILE ?auto_82181 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82189 - BLOCK
    )
    :vars
    (
      ?auto_82190 - BLOCK
      ?auto_82195 - BLOCK
      ?auto_82193 - BLOCK
      ?auto_82191 - BLOCK
      ?auto_82196 - BLOCK
      ?auto_82192 - BLOCK
      ?auto_82194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82190 ?auto_82189 ) ( ON-TABLE ?auto_82189 ) ( not ( = ?auto_82189 ?auto_82190 ) ) ( not ( = ?auto_82189 ?auto_82195 ) ) ( not ( = ?auto_82189 ?auto_82193 ) ) ( not ( = ?auto_82190 ?auto_82195 ) ) ( not ( = ?auto_82190 ?auto_82193 ) ) ( not ( = ?auto_82195 ?auto_82193 ) ) ( ON ?auto_82195 ?auto_82190 ) ( ON-TABLE ?auto_82191 ) ( ON ?auto_82196 ?auto_82191 ) ( ON ?auto_82192 ?auto_82196 ) ( not ( = ?auto_82191 ?auto_82196 ) ) ( not ( = ?auto_82191 ?auto_82192 ) ) ( not ( = ?auto_82191 ?auto_82194 ) ) ( not ( = ?auto_82191 ?auto_82193 ) ) ( not ( = ?auto_82196 ?auto_82192 ) ) ( not ( = ?auto_82196 ?auto_82194 ) ) ( not ( = ?auto_82196 ?auto_82193 ) ) ( not ( = ?auto_82192 ?auto_82194 ) ) ( not ( = ?auto_82192 ?auto_82193 ) ) ( not ( = ?auto_82194 ?auto_82193 ) ) ( not ( = ?auto_82189 ?auto_82194 ) ) ( not ( = ?auto_82189 ?auto_82191 ) ) ( not ( = ?auto_82189 ?auto_82196 ) ) ( not ( = ?auto_82189 ?auto_82192 ) ) ( not ( = ?auto_82190 ?auto_82194 ) ) ( not ( = ?auto_82190 ?auto_82191 ) ) ( not ( = ?auto_82190 ?auto_82196 ) ) ( not ( = ?auto_82190 ?auto_82192 ) ) ( not ( = ?auto_82195 ?auto_82194 ) ) ( not ( = ?auto_82195 ?auto_82191 ) ) ( not ( = ?auto_82195 ?auto_82196 ) ) ( not ( = ?auto_82195 ?auto_82192 ) ) ( ON ?auto_82193 ?auto_82195 ) ( CLEAR ?auto_82192 ) ( ON ?auto_82194 ?auto_82193 ) ( CLEAR ?auto_82194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82189 ?auto_82190 ?auto_82195 ?auto_82193 )
      ( MAKE-1PILE ?auto_82189 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82197 - BLOCK
    )
    :vars
    (
      ?auto_82200 - BLOCK
      ?auto_82199 - BLOCK
      ?auto_82204 - BLOCK
      ?auto_82203 - BLOCK
      ?auto_82202 - BLOCK
      ?auto_82198 - BLOCK
      ?auto_82201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82200 ?auto_82197 ) ( ON-TABLE ?auto_82197 ) ( not ( = ?auto_82197 ?auto_82200 ) ) ( not ( = ?auto_82197 ?auto_82199 ) ) ( not ( = ?auto_82197 ?auto_82204 ) ) ( not ( = ?auto_82200 ?auto_82199 ) ) ( not ( = ?auto_82200 ?auto_82204 ) ) ( not ( = ?auto_82199 ?auto_82204 ) ) ( ON ?auto_82199 ?auto_82200 ) ( ON-TABLE ?auto_82203 ) ( ON ?auto_82202 ?auto_82203 ) ( not ( = ?auto_82203 ?auto_82202 ) ) ( not ( = ?auto_82203 ?auto_82198 ) ) ( not ( = ?auto_82203 ?auto_82201 ) ) ( not ( = ?auto_82203 ?auto_82204 ) ) ( not ( = ?auto_82202 ?auto_82198 ) ) ( not ( = ?auto_82202 ?auto_82201 ) ) ( not ( = ?auto_82202 ?auto_82204 ) ) ( not ( = ?auto_82198 ?auto_82201 ) ) ( not ( = ?auto_82198 ?auto_82204 ) ) ( not ( = ?auto_82201 ?auto_82204 ) ) ( not ( = ?auto_82197 ?auto_82201 ) ) ( not ( = ?auto_82197 ?auto_82203 ) ) ( not ( = ?auto_82197 ?auto_82202 ) ) ( not ( = ?auto_82197 ?auto_82198 ) ) ( not ( = ?auto_82200 ?auto_82201 ) ) ( not ( = ?auto_82200 ?auto_82203 ) ) ( not ( = ?auto_82200 ?auto_82202 ) ) ( not ( = ?auto_82200 ?auto_82198 ) ) ( not ( = ?auto_82199 ?auto_82201 ) ) ( not ( = ?auto_82199 ?auto_82203 ) ) ( not ( = ?auto_82199 ?auto_82202 ) ) ( not ( = ?auto_82199 ?auto_82198 ) ) ( ON ?auto_82204 ?auto_82199 ) ( ON ?auto_82201 ?auto_82204 ) ( CLEAR ?auto_82201 ) ( HOLDING ?auto_82198 ) ( CLEAR ?auto_82202 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82203 ?auto_82202 ?auto_82198 )
      ( MAKE-1PILE ?auto_82197 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82205 - BLOCK
    )
    :vars
    (
      ?auto_82212 - BLOCK
      ?auto_82206 - BLOCK
      ?auto_82208 - BLOCK
      ?auto_82209 - BLOCK
      ?auto_82211 - BLOCK
      ?auto_82207 - BLOCK
      ?auto_82210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82212 ?auto_82205 ) ( ON-TABLE ?auto_82205 ) ( not ( = ?auto_82205 ?auto_82212 ) ) ( not ( = ?auto_82205 ?auto_82206 ) ) ( not ( = ?auto_82205 ?auto_82208 ) ) ( not ( = ?auto_82212 ?auto_82206 ) ) ( not ( = ?auto_82212 ?auto_82208 ) ) ( not ( = ?auto_82206 ?auto_82208 ) ) ( ON ?auto_82206 ?auto_82212 ) ( ON-TABLE ?auto_82209 ) ( ON ?auto_82211 ?auto_82209 ) ( not ( = ?auto_82209 ?auto_82211 ) ) ( not ( = ?auto_82209 ?auto_82207 ) ) ( not ( = ?auto_82209 ?auto_82210 ) ) ( not ( = ?auto_82209 ?auto_82208 ) ) ( not ( = ?auto_82211 ?auto_82207 ) ) ( not ( = ?auto_82211 ?auto_82210 ) ) ( not ( = ?auto_82211 ?auto_82208 ) ) ( not ( = ?auto_82207 ?auto_82210 ) ) ( not ( = ?auto_82207 ?auto_82208 ) ) ( not ( = ?auto_82210 ?auto_82208 ) ) ( not ( = ?auto_82205 ?auto_82210 ) ) ( not ( = ?auto_82205 ?auto_82209 ) ) ( not ( = ?auto_82205 ?auto_82211 ) ) ( not ( = ?auto_82205 ?auto_82207 ) ) ( not ( = ?auto_82212 ?auto_82210 ) ) ( not ( = ?auto_82212 ?auto_82209 ) ) ( not ( = ?auto_82212 ?auto_82211 ) ) ( not ( = ?auto_82212 ?auto_82207 ) ) ( not ( = ?auto_82206 ?auto_82210 ) ) ( not ( = ?auto_82206 ?auto_82209 ) ) ( not ( = ?auto_82206 ?auto_82211 ) ) ( not ( = ?auto_82206 ?auto_82207 ) ) ( ON ?auto_82208 ?auto_82206 ) ( ON ?auto_82210 ?auto_82208 ) ( CLEAR ?auto_82211 ) ( ON ?auto_82207 ?auto_82210 ) ( CLEAR ?auto_82207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82205 ?auto_82212 ?auto_82206 ?auto_82208 ?auto_82210 )
      ( MAKE-1PILE ?auto_82205 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82213 - BLOCK
    )
    :vars
    (
      ?auto_82216 - BLOCK
      ?auto_82218 - BLOCK
      ?auto_82217 - BLOCK
      ?auto_82215 - BLOCK
      ?auto_82220 - BLOCK
      ?auto_82219 - BLOCK
      ?auto_82214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82216 ?auto_82213 ) ( ON-TABLE ?auto_82213 ) ( not ( = ?auto_82213 ?auto_82216 ) ) ( not ( = ?auto_82213 ?auto_82218 ) ) ( not ( = ?auto_82213 ?auto_82217 ) ) ( not ( = ?auto_82216 ?auto_82218 ) ) ( not ( = ?auto_82216 ?auto_82217 ) ) ( not ( = ?auto_82218 ?auto_82217 ) ) ( ON ?auto_82218 ?auto_82216 ) ( ON-TABLE ?auto_82215 ) ( not ( = ?auto_82215 ?auto_82220 ) ) ( not ( = ?auto_82215 ?auto_82219 ) ) ( not ( = ?auto_82215 ?auto_82214 ) ) ( not ( = ?auto_82215 ?auto_82217 ) ) ( not ( = ?auto_82220 ?auto_82219 ) ) ( not ( = ?auto_82220 ?auto_82214 ) ) ( not ( = ?auto_82220 ?auto_82217 ) ) ( not ( = ?auto_82219 ?auto_82214 ) ) ( not ( = ?auto_82219 ?auto_82217 ) ) ( not ( = ?auto_82214 ?auto_82217 ) ) ( not ( = ?auto_82213 ?auto_82214 ) ) ( not ( = ?auto_82213 ?auto_82215 ) ) ( not ( = ?auto_82213 ?auto_82220 ) ) ( not ( = ?auto_82213 ?auto_82219 ) ) ( not ( = ?auto_82216 ?auto_82214 ) ) ( not ( = ?auto_82216 ?auto_82215 ) ) ( not ( = ?auto_82216 ?auto_82220 ) ) ( not ( = ?auto_82216 ?auto_82219 ) ) ( not ( = ?auto_82218 ?auto_82214 ) ) ( not ( = ?auto_82218 ?auto_82215 ) ) ( not ( = ?auto_82218 ?auto_82220 ) ) ( not ( = ?auto_82218 ?auto_82219 ) ) ( ON ?auto_82217 ?auto_82218 ) ( ON ?auto_82214 ?auto_82217 ) ( ON ?auto_82219 ?auto_82214 ) ( CLEAR ?auto_82219 ) ( HOLDING ?auto_82220 ) ( CLEAR ?auto_82215 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82215 ?auto_82220 )
      ( MAKE-1PILE ?auto_82213 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83627 - BLOCK
    )
    :vars
    (
      ?auto_83632 - BLOCK
      ?auto_83629 - BLOCK
      ?auto_83630 - BLOCK
      ?auto_83633 - BLOCK
      ?auto_83631 - BLOCK
      ?auto_83628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83632 ?auto_83627 ) ( ON-TABLE ?auto_83627 ) ( not ( = ?auto_83627 ?auto_83632 ) ) ( not ( = ?auto_83627 ?auto_83629 ) ) ( not ( = ?auto_83627 ?auto_83630 ) ) ( not ( = ?auto_83632 ?auto_83629 ) ) ( not ( = ?auto_83632 ?auto_83630 ) ) ( not ( = ?auto_83629 ?auto_83630 ) ) ( ON ?auto_83629 ?auto_83632 ) ( not ( = ?auto_83633 ?auto_83631 ) ) ( not ( = ?auto_83633 ?auto_83628 ) ) ( not ( = ?auto_83633 ?auto_83630 ) ) ( not ( = ?auto_83631 ?auto_83628 ) ) ( not ( = ?auto_83631 ?auto_83630 ) ) ( not ( = ?auto_83628 ?auto_83630 ) ) ( not ( = ?auto_83627 ?auto_83628 ) ) ( not ( = ?auto_83627 ?auto_83633 ) ) ( not ( = ?auto_83627 ?auto_83631 ) ) ( not ( = ?auto_83632 ?auto_83628 ) ) ( not ( = ?auto_83632 ?auto_83633 ) ) ( not ( = ?auto_83632 ?auto_83631 ) ) ( not ( = ?auto_83629 ?auto_83628 ) ) ( not ( = ?auto_83629 ?auto_83633 ) ) ( not ( = ?auto_83629 ?auto_83631 ) ) ( ON ?auto_83630 ?auto_83629 ) ( ON ?auto_83628 ?auto_83630 ) ( ON ?auto_83631 ?auto_83628 ) ( ON ?auto_83633 ?auto_83631 ) ( CLEAR ?auto_83633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83627 ?auto_83632 ?auto_83629 ?auto_83630 ?auto_83628 ?auto_83631 )
      ( MAKE-1PILE ?auto_83627 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82229 - BLOCK
    )
    :vars
    (
      ?auto_82231 - BLOCK
      ?auto_82230 - BLOCK
      ?auto_82233 - BLOCK
      ?auto_82234 - BLOCK
      ?auto_82235 - BLOCK
      ?auto_82236 - BLOCK
      ?auto_82232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82231 ?auto_82229 ) ( ON-TABLE ?auto_82229 ) ( not ( = ?auto_82229 ?auto_82231 ) ) ( not ( = ?auto_82229 ?auto_82230 ) ) ( not ( = ?auto_82229 ?auto_82233 ) ) ( not ( = ?auto_82231 ?auto_82230 ) ) ( not ( = ?auto_82231 ?auto_82233 ) ) ( not ( = ?auto_82230 ?auto_82233 ) ) ( ON ?auto_82230 ?auto_82231 ) ( not ( = ?auto_82234 ?auto_82235 ) ) ( not ( = ?auto_82234 ?auto_82236 ) ) ( not ( = ?auto_82234 ?auto_82232 ) ) ( not ( = ?auto_82234 ?auto_82233 ) ) ( not ( = ?auto_82235 ?auto_82236 ) ) ( not ( = ?auto_82235 ?auto_82232 ) ) ( not ( = ?auto_82235 ?auto_82233 ) ) ( not ( = ?auto_82236 ?auto_82232 ) ) ( not ( = ?auto_82236 ?auto_82233 ) ) ( not ( = ?auto_82232 ?auto_82233 ) ) ( not ( = ?auto_82229 ?auto_82232 ) ) ( not ( = ?auto_82229 ?auto_82234 ) ) ( not ( = ?auto_82229 ?auto_82235 ) ) ( not ( = ?auto_82229 ?auto_82236 ) ) ( not ( = ?auto_82231 ?auto_82232 ) ) ( not ( = ?auto_82231 ?auto_82234 ) ) ( not ( = ?auto_82231 ?auto_82235 ) ) ( not ( = ?auto_82231 ?auto_82236 ) ) ( not ( = ?auto_82230 ?auto_82232 ) ) ( not ( = ?auto_82230 ?auto_82234 ) ) ( not ( = ?auto_82230 ?auto_82235 ) ) ( not ( = ?auto_82230 ?auto_82236 ) ) ( ON ?auto_82233 ?auto_82230 ) ( ON ?auto_82232 ?auto_82233 ) ( ON ?auto_82236 ?auto_82232 ) ( ON ?auto_82235 ?auto_82236 ) ( CLEAR ?auto_82235 ) ( HOLDING ?auto_82234 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82234 )
      ( MAKE-1PILE ?auto_82229 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82237 - BLOCK
    )
    :vars
    (
      ?auto_82243 - BLOCK
      ?auto_82241 - BLOCK
      ?auto_82238 - BLOCK
      ?auto_82239 - BLOCK
      ?auto_82244 - BLOCK
      ?auto_82242 - BLOCK
      ?auto_82240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82243 ?auto_82237 ) ( ON-TABLE ?auto_82237 ) ( not ( = ?auto_82237 ?auto_82243 ) ) ( not ( = ?auto_82237 ?auto_82241 ) ) ( not ( = ?auto_82237 ?auto_82238 ) ) ( not ( = ?auto_82243 ?auto_82241 ) ) ( not ( = ?auto_82243 ?auto_82238 ) ) ( not ( = ?auto_82241 ?auto_82238 ) ) ( ON ?auto_82241 ?auto_82243 ) ( not ( = ?auto_82239 ?auto_82244 ) ) ( not ( = ?auto_82239 ?auto_82242 ) ) ( not ( = ?auto_82239 ?auto_82240 ) ) ( not ( = ?auto_82239 ?auto_82238 ) ) ( not ( = ?auto_82244 ?auto_82242 ) ) ( not ( = ?auto_82244 ?auto_82240 ) ) ( not ( = ?auto_82244 ?auto_82238 ) ) ( not ( = ?auto_82242 ?auto_82240 ) ) ( not ( = ?auto_82242 ?auto_82238 ) ) ( not ( = ?auto_82240 ?auto_82238 ) ) ( not ( = ?auto_82237 ?auto_82240 ) ) ( not ( = ?auto_82237 ?auto_82239 ) ) ( not ( = ?auto_82237 ?auto_82244 ) ) ( not ( = ?auto_82237 ?auto_82242 ) ) ( not ( = ?auto_82243 ?auto_82240 ) ) ( not ( = ?auto_82243 ?auto_82239 ) ) ( not ( = ?auto_82243 ?auto_82244 ) ) ( not ( = ?auto_82243 ?auto_82242 ) ) ( not ( = ?auto_82241 ?auto_82240 ) ) ( not ( = ?auto_82241 ?auto_82239 ) ) ( not ( = ?auto_82241 ?auto_82244 ) ) ( not ( = ?auto_82241 ?auto_82242 ) ) ( ON ?auto_82238 ?auto_82241 ) ( ON ?auto_82240 ?auto_82238 ) ( ON ?auto_82242 ?auto_82240 ) ( ON ?auto_82244 ?auto_82242 ) ( ON ?auto_82239 ?auto_82244 ) ( CLEAR ?auto_82239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82237 ?auto_82243 ?auto_82241 ?auto_82238 ?auto_82240 ?auto_82242 ?auto_82244 )
      ( MAKE-1PILE ?auto_82237 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82252 - BLOCK
      ?auto_82253 - BLOCK
      ?auto_82254 - BLOCK
      ?auto_82255 - BLOCK
      ?auto_82256 - BLOCK
      ?auto_82257 - BLOCK
      ?auto_82258 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_82258 ) ( CLEAR ?auto_82257 ) ( ON-TABLE ?auto_82252 ) ( ON ?auto_82253 ?auto_82252 ) ( ON ?auto_82254 ?auto_82253 ) ( ON ?auto_82255 ?auto_82254 ) ( ON ?auto_82256 ?auto_82255 ) ( ON ?auto_82257 ?auto_82256 ) ( not ( = ?auto_82252 ?auto_82253 ) ) ( not ( = ?auto_82252 ?auto_82254 ) ) ( not ( = ?auto_82252 ?auto_82255 ) ) ( not ( = ?auto_82252 ?auto_82256 ) ) ( not ( = ?auto_82252 ?auto_82257 ) ) ( not ( = ?auto_82252 ?auto_82258 ) ) ( not ( = ?auto_82253 ?auto_82254 ) ) ( not ( = ?auto_82253 ?auto_82255 ) ) ( not ( = ?auto_82253 ?auto_82256 ) ) ( not ( = ?auto_82253 ?auto_82257 ) ) ( not ( = ?auto_82253 ?auto_82258 ) ) ( not ( = ?auto_82254 ?auto_82255 ) ) ( not ( = ?auto_82254 ?auto_82256 ) ) ( not ( = ?auto_82254 ?auto_82257 ) ) ( not ( = ?auto_82254 ?auto_82258 ) ) ( not ( = ?auto_82255 ?auto_82256 ) ) ( not ( = ?auto_82255 ?auto_82257 ) ) ( not ( = ?auto_82255 ?auto_82258 ) ) ( not ( = ?auto_82256 ?auto_82257 ) ) ( not ( = ?auto_82256 ?auto_82258 ) ) ( not ( = ?auto_82257 ?auto_82258 ) ) )
    :subtasks
    ( ( !STACK ?auto_82258 ?auto_82257 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82259 - BLOCK
      ?auto_82260 - BLOCK
      ?auto_82261 - BLOCK
      ?auto_82262 - BLOCK
      ?auto_82263 - BLOCK
      ?auto_82264 - BLOCK
      ?auto_82265 - BLOCK
    )
    :vars
    (
      ?auto_82266 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_82264 ) ( ON-TABLE ?auto_82259 ) ( ON ?auto_82260 ?auto_82259 ) ( ON ?auto_82261 ?auto_82260 ) ( ON ?auto_82262 ?auto_82261 ) ( ON ?auto_82263 ?auto_82262 ) ( ON ?auto_82264 ?auto_82263 ) ( not ( = ?auto_82259 ?auto_82260 ) ) ( not ( = ?auto_82259 ?auto_82261 ) ) ( not ( = ?auto_82259 ?auto_82262 ) ) ( not ( = ?auto_82259 ?auto_82263 ) ) ( not ( = ?auto_82259 ?auto_82264 ) ) ( not ( = ?auto_82259 ?auto_82265 ) ) ( not ( = ?auto_82260 ?auto_82261 ) ) ( not ( = ?auto_82260 ?auto_82262 ) ) ( not ( = ?auto_82260 ?auto_82263 ) ) ( not ( = ?auto_82260 ?auto_82264 ) ) ( not ( = ?auto_82260 ?auto_82265 ) ) ( not ( = ?auto_82261 ?auto_82262 ) ) ( not ( = ?auto_82261 ?auto_82263 ) ) ( not ( = ?auto_82261 ?auto_82264 ) ) ( not ( = ?auto_82261 ?auto_82265 ) ) ( not ( = ?auto_82262 ?auto_82263 ) ) ( not ( = ?auto_82262 ?auto_82264 ) ) ( not ( = ?auto_82262 ?auto_82265 ) ) ( not ( = ?auto_82263 ?auto_82264 ) ) ( not ( = ?auto_82263 ?auto_82265 ) ) ( not ( = ?auto_82264 ?auto_82265 ) ) ( ON ?auto_82265 ?auto_82266 ) ( CLEAR ?auto_82265 ) ( HAND-EMPTY ) ( not ( = ?auto_82259 ?auto_82266 ) ) ( not ( = ?auto_82260 ?auto_82266 ) ) ( not ( = ?auto_82261 ?auto_82266 ) ) ( not ( = ?auto_82262 ?auto_82266 ) ) ( not ( = ?auto_82263 ?auto_82266 ) ) ( not ( = ?auto_82264 ?auto_82266 ) ) ( not ( = ?auto_82265 ?auto_82266 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82265 ?auto_82266 )
      ( MAKE-7PILE ?auto_82259 ?auto_82260 ?auto_82261 ?auto_82262 ?auto_82263 ?auto_82264 ?auto_82265 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82267 - BLOCK
      ?auto_82268 - BLOCK
      ?auto_82269 - BLOCK
      ?auto_82270 - BLOCK
      ?auto_82271 - BLOCK
      ?auto_82272 - BLOCK
      ?auto_82273 - BLOCK
    )
    :vars
    (
      ?auto_82274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82267 ) ( ON ?auto_82268 ?auto_82267 ) ( ON ?auto_82269 ?auto_82268 ) ( ON ?auto_82270 ?auto_82269 ) ( ON ?auto_82271 ?auto_82270 ) ( not ( = ?auto_82267 ?auto_82268 ) ) ( not ( = ?auto_82267 ?auto_82269 ) ) ( not ( = ?auto_82267 ?auto_82270 ) ) ( not ( = ?auto_82267 ?auto_82271 ) ) ( not ( = ?auto_82267 ?auto_82272 ) ) ( not ( = ?auto_82267 ?auto_82273 ) ) ( not ( = ?auto_82268 ?auto_82269 ) ) ( not ( = ?auto_82268 ?auto_82270 ) ) ( not ( = ?auto_82268 ?auto_82271 ) ) ( not ( = ?auto_82268 ?auto_82272 ) ) ( not ( = ?auto_82268 ?auto_82273 ) ) ( not ( = ?auto_82269 ?auto_82270 ) ) ( not ( = ?auto_82269 ?auto_82271 ) ) ( not ( = ?auto_82269 ?auto_82272 ) ) ( not ( = ?auto_82269 ?auto_82273 ) ) ( not ( = ?auto_82270 ?auto_82271 ) ) ( not ( = ?auto_82270 ?auto_82272 ) ) ( not ( = ?auto_82270 ?auto_82273 ) ) ( not ( = ?auto_82271 ?auto_82272 ) ) ( not ( = ?auto_82271 ?auto_82273 ) ) ( not ( = ?auto_82272 ?auto_82273 ) ) ( ON ?auto_82273 ?auto_82274 ) ( CLEAR ?auto_82273 ) ( not ( = ?auto_82267 ?auto_82274 ) ) ( not ( = ?auto_82268 ?auto_82274 ) ) ( not ( = ?auto_82269 ?auto_82274 ) ) ( not ( = ?auto_82270 ?auto_82274 ) ) ( not ( = ?auto_82271 ?auto_82274 ) ) ( not ( = ?auto_82272 ?auto_82274 ) ) ( not ( = ?auto_82273 ?auto_82274 ) ) ( HOLDING ?auto_82272 ) ( CLEAR ?auto_82271 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82267 ?auto_82268 ?auto_82269 ?auto_82270 ?auto_82271 ?auto_82272 )
      ( MAKE-7PILE ?auto_82267 ?auto_82268 ?auto_82269 ?auto_82270 ?auto_82271 ?auto_82272 ?auto_82273 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82275 - BLOCK
      ?auto_82276 - BLOCK
      ?auto_82277 - BLOCK
      ?auto_82278 - BLOCK
      ?auto_82279 - BLOCK
      ?auto_82280 - BLOCK
      ?auto_82281 - BLOCK
    )
    :vars
    (
      ?auto_82282 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82275 ) ( ON ?auto_82276 ?auto_82275 ) ( ON ?auto_82277 ?auto_82276 ) ( ON ?auto_82278 ?auto_82277 ) ( ON ?auto_82279 ?auto_82278 ) ( not ( = ?auto_82275 ?auto_82276 ) ) ( not ( = ?auto_82275 ?auto_82277 ) ) ( not ( = ?auto_82275 ?auto_82278 ) ) ( not ( = ?auto_82275 ?auto_82279 ) ) ( not ( = ?auto_82275 ?auto_82280 ) ) ( not ( = ?auto_82275 ?auto_82281 ) ) ( not ( = ?auto_82276 ?auto_82277 ) ) ( not ( = ?auto_82276 ?auto_82278 ) ) ( not ( = ?auto_82276 ?auto_82279 ) ) ( not ( = ?auto_82276 ?auto_82280 ) ) ( not ( = ?auto_82276 ?auto_82281 ) ) ( not ( = ?auto_82277 ?auto_82278 ) ) ( not ( = ?auto_82277 ?auto_82279 ) ) ( not ( = ?auto_82277 ?auto_82280 ) ) ( not ( = ?auto_82277 ?auto_82281 ) ) ( not ( = ?auto_82278 ?auto_82279 ) ) ( not ( = ?auto_82278 ?auto_82280 ) ) ( not ( = ?auto_82278 ?auto_82281 ) ) ( not ( = ?auto_82279 ?auto_82280 ) ) ( not ( = ?auto_82279 ?auto_82281 ) ) ( not ( = ?auto_82280 ?auto_82281 ) ) ( ON ?auto_82281 ?auto_82282 ) ( not ( = ?auto_82275 ?auto_82282 ) ) ( not ( = ?auto_82276 ?auto_82282 ) ) ( not ( = ?auto_82277 ?auto_82282 ) ) ( not ( = ?auto_82278 ?auto_82282 ) ) ( not ( = ?auto_82279 ?auto_82282 ) ) ( not ( = ?auto_82280 ?auto_82282 ) ) ( not ( = ?auto_82281 ?auto_82282 ) ) ( CLEAR ?auto_82279 ) ( ON ?auto_82280 ?auto_82281 ) ( CLEAR ?auto_82280 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82282 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82282 ?auto_82281 )
      ( MAKE-7PILE ?auto_82275 ?auto_82276 ?auto_82277 ?auto_82278 ?auto_82279 ?auto_82280 ?auto_82281 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82283 - BLOCK
      ?auto_82284 - BLOCK
      ?auto_82285 - BLOCK
      ?auto_82286 - BLOCK
      ?auto_82287 - BLOCK
      ?auto_82288 - BLOCK
      ?auto_82289 - BLOCK
    )
    :vars
    (
      ?auto_82290 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82283 ) ( ON ?auto_82284 ?auto_82283 ) ( ON ?auto_82285 ?auto_82284 ) ( ON ?auto_82286 ?auto_82285 ) ( not ( = ?auto_82283 ?auto_82284 ) ) ( not ( = ?auto_82283 ?auto_82285 ) ) ( not ( = ?auto_82283 ?auto_82286 ) ) ( not ( = ?auto_82283 ?auto_82287 ) ) ( not ( = ?auto_82283 ?auto_82288 ) ) ( not ( = ?auto_82283 ?auto_82289 ) ) ( not ( = ?auto_82284 ?auto_82285 ) ) ( not ( = ?auto_82284 ?auto_82286 ) ) ( not ( = ?auto_82284 ?auto_82287 ) ) ( not ( = ?auto_82284 ?auto_82288 ) ) ( not ( = ?auto_82284 ?auto_82289 ) ) ( not ( = ?auto_82285 ?auto_82286 ) ) ( not ( = ?auto_82285 ?auto_82287 ) ) ( not ( = ?auto_82285 ?auto_82288 ) ) ( not ( = ?auto_82285 ?auto_82289 ) ) ( not ( = ?auto_82286 ?auto_82287 ) ) ( not ( = ?auto_82286 ?auto_82288 ) ) ( not ( = ?auto_82286 ?auto_82289 ) ) ( not ( = ?auto_82287 ?auto_82288 ) ) ( not ( = ?auto_82287 ?auto_82289 ) ) ( not ( = ?auto_82288 ?auto_82289 ) ) ( ON ?auto_82289 ?auto_82290 ) ( not ( = ?auto_82283 ?auto_82290 ) ) ( not ( = ?auto_82284 ?auto_82290 ) ) ( not ( = ?auto_82285 ?auto_82290 ) ) ( not ( = ?auto_82286 ?auto_82290 ) ) ( not ( = ?auto_82287 ?auto_82290 ) ) ( not ( = ?auto_82288 ?auto_82290 ) ) ( not ( = ?auto_82289 ?auto_82290 ) ) ( ON ?auto_82288 ?auto_82289 ) ( CLEAR ?auto_82288 ) ( ON-TABLE ?auto_82290 ) ( HOLDING ?auto_82287 ) ( CLEAR ?auto_82286 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82283 ?auto_82284 ?auto_82285 ?auto_82286 ?auto_82287 )
      ( MAKE-7PILE ?auto_82283 ?auto_82284 ?auto_82285 ?auto_82286 ?auto_82287 ?auto_82288 ?auto_82289 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82291 - BLOCK
      ?auto_82292 - BLOCK
      ?auto_82293 - BLOCK
      ?auto_82294 - BLOCK
      ?auto_82295 - BLOCK
      ?auto_82296 - BLOCK
      ?auto_82297 - BLOCK
    )
    :vars
    (
      ?auto_82298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82291 ) ( ON ?auto_82292 ?auto_82291 ) ( ON ?auto_82293 ?auto_82292 ) ( ON ?auto_82294 ?auto_82293 ) ( not ( = ?auto_82291 ?auto_82292 ) ) ( not ( = ?auto_82291 ?auto_82293 ) ) ( not ( = ?auto_82291 ?auto_82294 ) ) ( not ( = ?auto_82291 ?auto_82295 ) ) ( not ( = ?auto_82291 ?auto_82296 ) ) ( not ( = ?auto_82291 ?auto_82297 ) ) ( not ( = ?auto_82292 ?auto_82293 ) ) ( not ( = ?auto_82292 ?auto_82294 ) ) ( not ( = ?auto_82292 ?auto_82295 ) ) ( not ( = ?auto_82292 ?auto_82296 ) ) ( not ( = ?auto_82292 ?auto_82297 ) ) ( not ( = ?auto_82293 ?auto_82294 ) ) ( not ( = ?auto_82293 ?auto_82295 ) ) ( not ( = ?auto_82293 ?auto_82296 ) ) ( not ( = ?auto_82293 ?auto_82297 ) ) ( not ( = ?auto_82294 ?auto_82295 ) ) ( not ( = ?auto_82294 ?auto_82296 ) ) ( not ( = ?auto_82294 ?auto_82297 ) ) ( not ( = ?auto_82295 ?auto_82296 ) ) ( not ( = ?auto_82295 ?auto_82297 ) ) ( not ( = ?auto_82296 ?auto_82297 ) ) ( ON ?auto_82297 ?auto_82298 ) ( not ( = ?auto_82291 ?auto_82298 ) ) ( not ( = ?auto_82292 ?auto_82298 ) ) ( not ( = ?auto_82293 ?auto_82298 ) ) ( not ( = ?auto_82294 ?auto_82298 ) ) ( not ( = ?auto_82295 ?auto_82298 ) ) ( not ( = ?auto_82296 ?auto_82298 ) ) ( not ( = ?auto_82297 ?auto_82298 ) ) ( ON ?auto_82296 ?auto_82297 ) ( ON-TABLE ?auto_82298 ) ( CLEAR ?auto_82294 ) ( ON ?auto_82295 ?auto_82296 ) ( CLEAR ?auto_82295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82298 ?auto_82297 ?auto_82296 )
      ( MAKE-7PILE ?auto_82291 ?auto_82292 ?auto_82293 ?auto_82294 ?auto_82295 ?auto_82296 ?auto_82297 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82299 - BLOCK
      ?auto_82300 - BLOCK
      ?auto_82301 - BLOCK
      ?auto_82302 - BLOCK
      ?auto_82303 - BLOCK
      ?auto_82304 - BLOCK
      ?auto_82305 - BLOCK
    )
    :vars
    (
      ?auto_82306 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82299 ) ( ON ?auto_82300 ?auto_82299 ) ( ON ?auto_82301 ?auto_82300 ) ( not ( = ?auto_82299 ?auto_82300 ) ) ( not ( = ?auto_82299 ?auto_82301 ) ) ( not ( = ?auto_82299 ?auto_82302 ) ) ( not ( = ?auto_82299 ?auto_82303 ) ) ( not ( = ?auto_82299 ?auto_82304 ) ) ( not ( = ?auto_82299 ?auto_82305 ) ) ( not ( = ?auto_82300 ?auto_82301 ) ) ( not ( = ?auto_82300 ?auto_82302 ) ) ( not ( = ?auto_82300 ?auto_82303 ) ) ( not ( = ?auto_82300 ?auto_82304 ) ) ( not ( = ?auto_82300 ?auto_82305 ) ) ( not ( = ?auto_82301 ?auto_82302 ) ) ( not ( = ?auto_82301 ?auto_82303 ) ) ( not ( = ?auto_82301 ?auto_82304 ) ) ( not ( = ?auto_82301 ?auto_82305 ) ) ( not ( = ?auto_82302 ?auto_82303 ) ) ( not ( = ?auto_82302 ?auto_82304 ) ) ( not ( = ?auto_82302 ?auto_82305 ) ) ( not ( = ?auto_82303 ?auto_82304 ) ) ( not ( = ?auto_82303 ?auto_82305 ) ) ( not ( = ?auto_82304 ?auto_82305 ) ) ( ON ?auto_82305 ?auto_82306 ) ( not ( = ?auto_82299 ?auto_82306 ) ) ( not ( = ?auto_82300 ?auto_82306 ) ) ( not ( = ?auto_82301 ?auto_82306 ) ) ( not ( = ?auto_82302 ?auto_82306 ) ) ( not ( = ?auto_82303 ?auto_82306 ) ) ( not ( = ?auto_82304 ?auto_82306 ) ) ( not ( = ?auto_82305 ?auto_82306 ) ) ( ON ?auto_82304 ?auto_82305 ) ( ON-TABLE ?auto_82306 ) ( ON ?auto_82303 ?auto_82304 ) ( CLEAR ?auto_82303 ) ( HOLDING ?auto_82302 ) ( CLEAR ?auto_82301 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82299 ?auto_82300 ?auto_82301 ?auto_82302 )
      ( MAKE-7PILE ?auto_82299 ?auto_82300 ?auto_82301 ?auto_82302 ?auto_82303 ?auto_82304 ?auto_82305 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82307 - BLOCK
      ?auto_82308 - BLOCK
      ?auto_82309 - BLOCK
      ?auto_82310 - BLOCK
      ?auto_82311 - BLOCK
      ?auto_82312 - BLOCK
      ?auto_82313 - BLOCK
    )
    :vars
    (
      ?auto_82314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82307 ) ( ON ?auto_82308 ?auto_82307 ) ( ON ?auto_82309 ?auto_82308 ) ( not ( = ?auto_82307 ?auto_82308 ) ) ( not ( = ?auto_82307 ?auto_82309 ) ) ( not ( = ?auto_82307 ?auto_82310 ) ) ( not ( = ?auto_82307 ?auto_82311 ) ) ( not ( = ?auto_82307 ?auto_82312 ) ) ( not ( = ?auto_82307 ?auto_82313 ) ) ( not ( = ?auto_82308 ?auto_82309 ) ) ( not ( = ?auto_82308 ?auto_82310 ) ) ( not ( = ?auto_82308 ?auto_82311 ) ) ( not ( = ?auto_82308 ?auto_82312 ) ) ( not ( = ?auto_82308 ?auto_82313 ) ) ( not ( = ?auto_82309 ?auto_82310 ) ) ( not ( = ?auto_82309 ?auto_82311 ) ) ( not ( = ?auto_82309 ?auto_82312 ) ) ( not ( = ?auto_82309 ?auto_82313 ) ) ( not ( = ?auto_82310 ?auto_82311 ) ) ( not ( = ?auto_82310 ?auto_82312 ) ) ( not ( = ?auto_82310 ?auto_82313 ) ) ( not ( = ?auto_82311 ?auto_82312 ) ) ( not ( = ?auto_82311 ?auto_82313 ) ) ( not ( = ?auto_82312 ?auto_82313 ) ) ( ON ?auto_82313 ?auto_82314 ) ( not ( = ?auto_82307 ?auto_82314 ) ) ( not ( = ?auto_82308 ?auto_82314 ) ) ( not ( = ?auto_82309 ?auto_82314 ) ) ( not ( = ?auto_82310 ?auto_82314 ) ) ( not ( = ?auto_82311 ?auto_82314 ) ) ( not ( = ?auto_82312 ?auto_82314 ) ) ( not ( = ?auto_82313 ?auto_82314 ) ) ( ON ?auto_82312 ?auto_82313 ) ( ON-TABLE ?auto_82314 ) ( ON ?auto_82311 ?auto_82312 ) ( CLEAR ?auto_82309 ) ( ON ?auto_82310 ?auto_82311 ) ( CLEAR ?auto_82310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82314 ?auto_82313 ?auto_82312 ?auto_82311 )
      ( MAKE-7PILE ?auto_82307 ?auto_82308 ?auto_82309 ?auto_82310 ?auto_82311 ?auto_82312 ?auto_82313 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82315 - BLOCK
      ?auto_82316 - BLOCK
      ?auto_82317 - BLOCK
      ?auto_82318 - BLOCK
      ?auto_82319 - BLOCK
      ?auto_82320 - BLOCK
      ?auto_82321 - BLOCK
    )
    :vars
    (
      ?auto_82322 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82315 ) ( ON ?auto_82316 ?auto_82315 ) ( not ( = ?auto_82315 ?auto_82316 ) ) ( not ( = ?auto_82315 ?auto_82317 ) ) ( not ( = ?auto_82315 ?auto_82318 ) ) ( not ( = ?auto_82315 ?auto_82319 ) ) ( not ( = ?auto_82315 ?auto_82320 ) ) ( not ( = ?auto_82315 ?auto_82321 ) ) ( not ( = ?auto_82316 ?auto_82317 ) ) ( not ( = ?auto_82316 ?auto_82318 ) ) ( not ( = ?auto_82316 ?auto_82319 ) ) ( not ( = ?auto_82316 ?auto_82320 ) ) ( not ( = ?auto_82316 ?auto_82321 ) ) ( not ( = ?auto_82317 ?auto_82318 ) ) ( not ( = ?auto_82317 ?auto_82319 ) ) ( not ( = ?auto_82317 ?auto_82320 ) ) ( not ( = ?auto_82317 ?auto_82321 ) ) ( not ( = ?auto_82318 ?auto_82319 ) ) ( not ( = ?auto_82318 ?auto_82320 ) ) ( not ( = ?auto_82318 ?auto_82321 ) ) ( not ( = ?auto_82319 ?auto_82320 ) ) ( not ( = ?auto_82319 ?auto_82321 ) ) ( not ( = ?auto_82320 ?auto_82321 ) ) ( ON ?auto_82321 ?auto_82322 ) ( not ( = ?auto_82315 ?auto_82322 ) ) ( not ( = ?auto_82316 ?auto_82322 ) ) ( not ( = ?auto_82317 ?auto_82322 ) ) ( not ( = ?auto_82318 ?auto_82322 ) ) ( not ( = ?auto_82319 ?auto_82322 ) ) ( not ( = ?auto_82320 ?auto_82322 ) ) ( not ( = ?auto_82321 ?auto_82322 ) ) ( ON ?auto_82320 ?auto_82321 ) ( ON-TABLE ?auto_82322 ) ( ON ?auto_82319 ?auto_82320 ) ( ON ?auto_82318 ?auto_82319 ) ( CLEAR ?auto_82318 ) ( HOLDING ?auto_82317 ) ( CLEAR ?auto_82316 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82315 ?auto_82316 ?auto_82317 )
      ( MAKE-7PILE ?auto_82315 ?auto_82316 ?auto_82317 ?auto_82318 ?auto_82319 ?auto_82320 ?auto_82321 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82323 - BLOCK
      ?auto_82324 - BLOCK
      ?auto_82325 - BLOCK
      ?auto_82326 - BLOCK
      ?auto_82327 - BLOCK
      ?auto_82328 - BLOCK
      ?auto_82329 - BLOCK
    )
    :vars
    (
      ?auto_82330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82323 ) ( ON ?auto_82324 ?auto_82323 ) ( not ( = ?auto_82323 ?auto_82324 ) ) ( not ( = ?auto_82323 ?auto_82325 ) ) ( not ( = ?auto_82323 ?auto_82326 ) ) ( not ( = ?auto_82323 ?auto_82327 ) ) ( not ( = ?auto_82323 ?auto_82328 ) ) ( not ( = ?auto_82323 ?auto_82329 ) ) ( not ( = ?auto_82324 ?auto_82325 ) ) ( not ( = ?auto_82324 ?auto_82326 ) ) ( not ( = ?auto_82324 ?auto_82327 ) ) ( not ( = ?auto_82324 ?auto_82328 ) ) ( not ( = ?auto_82324 ?auto_82329 ) ) ( not ( = ?auto_82325 ?auto_82326 ) ) ( not ( = ?auto_82325 ?auto_82327 ) ) ( not ( = ?auto_82325 ?auto_82328 ) ) ( not ( = ?auto_82325 ?auto_82329 ) ) ( not ( = ?auto_82326 ?auto_82327 ) ) ( not ( = ?auto_82326 ?auto_82328 ) ) ( not ( = ?auto_82326 ?auto_82329 ) ) ( not ( = ?auto_82327 ?auto_82328 ) ) ( not ( = ?auto_82327 ?auto_82329 ) ) ( not ( = ?auto_82328 ?auto_82329 ) ) ( ON ?auto_82329 ?auto_82330 ) ( not ( = ?auto_82323 ?auto_82330 ) ) ( not ( = ?auto_82324 ?auto_82330 ) ) ( not ( = ?auto_82325 ?auto_82330 ) ) ( not ( = ?auto_82326 ?auto_82330 ) ) ( not ( = ?auto_82327 ?auto_82330 ) ) ( not ( = ?auto_82328 ?auto_82330 ) ) ( not ( = ?auto_82329 ?auto_82330 ) ) ( ON ?auto_82328 ?auto_82329 ) ( ON-TABLE ?auto_82330 ) ( ON ?auto_82327 ?auto_82328 ) ( ON ?auto_82326 ?auto_82327 ) ( CLEAR ?auto_82324 ) ( ON ?auto_82325 ?auto_82326 ) ( CLEAR ?auto_82325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82330 ?auto_82329 ?auto_82328 ?auto_82327 ?auto_82326 )
      ( MAKE-7PILE ?auto_82323 ?auto_82324 ?auto_82325 ?auto_82326 ?auto_82327 ?auto_82328 ?auto_82329 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82331 - BLOCK
      ?auto_82332 - BLOCK
      ?auto_82333 - BLOCK
      ?auto_82334 - BLOCK
      ?auto_82335 - BLOCK
      ?auto_82336 - BLOCK
      ?auto_82337 - BLOCK
    )
    :vars
    (
      ?auto_82338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82331 ) ( not ( = ?auto_82331 ?auto_82332 ) ) ( not ( = ?auto_82331 ?auto_82333 ) ) ( not ( = ?auto_82331 ?auto_82334 ) ) ( not ( = ?auto_82331 ?auto_82335 ) ) ( not ( = ?auto_82331 ?auto_82336 ) ) ( not ( = ?auto_82331 ?auto_82337 ) ) ( not ( = ?auto_82332 ?auto_82333 ) ) ( not ( = ?auto_82332 ?auto_82334 ) ) ( not ( = ?auto_82332 ?auto_82335 ) ) ( not ( = ?auto_82332 ?auto_82336 ) ) ( not ( = ?auto_82332 ?auto_82337 ) ) ( not ( = ?auto_82333 ?auto_82334 ) ) ( not ( = ?auto_82333 ?auto_82335 ) ) ( not ( = ?auto_82333 ?auto_82336 ) ) ( not ( = ?auto_82333 ?auto_82337 ) ) ( not ( = ?auto_82334 ?auto_82335 ) ) ( not ( = ?auto_82334 ?auto_82336 ) ) ( not ( = ?auto_82334 ?auto_82337 ) ) ( not ( = ?auto_82335 ?auto_82336 ) ) ( not ( = ?auto_82335 ?auto_82337 ) ) ( not ( = ?auto_82336 ?auto_82337 ) ) ( ON ?auto_82337 ?auto_82338 ) ( not ( = ?auto_82331 ?auto_82338 ) ) ( not ( = ?auto_82332 ?auto_82338 ) ) ( not ( = ?auto_82333 ?auto_82338 ) ) ( not ( = ?auto_82334 ?auto_82338 ) ) ( not ( = ?auto_82335 ?auto_82338 ) ) ( not ( = ?auto_82336 ?auto_82338 ) ) ( not ( = ?auto_82337 ?auto_82338 ) ) ( ON ?auto_82336 ?auto_82337 ) ( ON-TABLE ?auto_82338 ) ( ON ?auto_82335 ?auto_82336 ) ( ON ?auto_82334 ?auto_82335 ) ( ON ?auto_82333 ?auto_82334 ) ( CLEAR ?auto_82333 ) ( HOLDING ?auto_82332 ) ( CLEAR ?auto_82331 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82331 ?auto_82332 )
      ( MAKE-7PILE ?auto_82331 ?auto_82332 ?auto_82333 ?auto_82334 ?auto_82335 ?auto_82336 ?auto_82337 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82339 - BLOCK
      ?auto_82340 - BLOCK
      ?auto_82341 - BLOCK
      ?auto_82342 - BLOCK
      ?auto_82343 - BLOCK
      ?auto_82344 - BLOCK
      ?auto_82345 - BLOCK
    )
    :vars
    (
      ?auto_82346 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82339 ) ( not ( = ?auto_82339 ?auto_82340 ) ) ( not ( = ?auto_82339 ?auto_82341 ) ) ( not ( = ?auto_82339 ?auto_82342 ) ) ( not ( = ?auto_82339 ?auto_82343 ) ) ( not ( = ?auto_82339 ?auto_82344 ) ) ( not ( = ?auto_82339 ?auto_82345 ) ) ( not ( = ?auto_82340 ?auto_82341 ) ) ( not ( = ?auto_82340 ?auto_82342 ) ) ( not ( = ?auto_82340 ?auto_82343 ) ) ( not ( = ?auto_82340 ?auto_82344 ) ) ( not ( = ?auto_82340 ?auto_82345 ) ) ( not ( = ?auto_82341 ?auto_82342 ) ) ( not ( = ?auto_82341 ?auto_82343 ) ) ( not ( = ?auto_82341 ?auto_82344 ) ) ( not ( = ?auto_82341 ?auto_82345 ) ) ( not ( = ?auto_82342 ?auto_82343 ) ) ( not ( = ?auto_82342 ?auto_82344 ) ) ( not ( = ?auto_82342 ?auto_82345 ) ) ( not ( = ?auto_82343 ?auto_82344 ) ) ( not ( = ?auto_82343 ?auto_82345 ) ) ( not ( = ?auto_82344 ?auto_82345 ) ) ( ON ?auto_82345 ?auto_82346 ) ( not ( = ?auto_82339 ?auto_82346 ) ) ( not ( = ?auto_82340 ?auto_82346 ) ) ( not ( = ?auto_82341 ?auto_82346 ) ) ( not ( = ?auto_82342 ?auto_82346 ) ) ( not ( = ?auto_82343 ?auto_82346 ) ) ( not ( = ?auto_82344 ?auto_82346 ) ) ( not ( = ?auto_82345 ?auto_82346 ) ) ( ON ?auto_82344 ?auto_82345 ) ( ON-TABLE ?auto_82346 ) ( ON ?auto_82343 ?auto_82344 ) ( ON ?auto_82342 ?auto_82343 ) ( ON ?auto_82341 ?auto_82342 ) ( CLEAR ?auto_82339 ) ( ON ?auto_82340 ?auto_82341 ) ( CLEAR ?auto_82340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82346 ?auto_82345 ?auto_82344 ?auto_82343 ?auto_82342 ?auto_82341 )
      ( MAKE-7PILE ?auto_82339 ?auto_82340 ?auto_82341 ?auto_82342 ?auto_82343 ?auto_82344 ?auto_82345 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82347 - BLOCK
      ?auto_82348 - BLOCK
      ?auto_82349 - BLOCK
      ?auto_82350 - BLOCK
      ?auto_82351 - BLOCK
      ?auto_82352 - BLOCK
      ?auto_82353 - BLOCK
    )
    :vars
    (
      ?auto_82354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82347 ?auto_82348 ) ) ( not ( = ?auto_82347 ?auto_82349 ) ) ( not ( = ?auto_82347 ?auto_82350 ) ) ( not ( = ?auto_82347 ?auto_82351 ) ) ( not ( = ?auto_82347 ?auto_82352 ) ) ( not ( = ?auto_82347 ?auto_82353 ) ) ( not ( = ?auto_82348 ?auto_82349 ) ) ( not ( = ?auto_82348 ?auto_82350 ) ) ( not ( = ?auto_82348 ?auto_82351 ) ) ( not ( = ?auto_82348 ?auto_82352 ) ) ( not ( = ?auto_82348 ?auto_82353 ) ) ( not ( = ?auto_82349 ?auto_82350 ) ) ( not ( = ?auto_82349 ?auto_82351 ) ) ( not ( = ?auto_82349 ?auto_82352 ) ) ( not ( = ?auto_82349 ?auto_82353 ) ) ( not ( = ?auto_82350 ?auto_82351 ) ) ( not ( = ?auto_82350 ?auto_82352 ) ) ( not ( = ?auto_82350 ?auto_82353 ) ) ( not ( = ?auto_82351 ?auto_82352 ) ) ( not ( = ?auto_82351 ?auto_82353 ) ) ( not ( = ?auto_82352 ?auto_82353 ) ) ( ON ?auto_82353 ?auto_82354 ) ( not ( = ?auto_82347 ?auto_82354 ) ) ( not ( = ?auto_82348 ?auto_82354 ) ) ( not ( = ?auto_82349 ?auto_82354 ) ) ( not ( = ?auto_82350 ?auto_82354 ) ) ( not ( = ?auto_82351 ?auto_82354 ) ) ( not ( = ?auto_82352 ?auto_82354 ) ) ( not ( = ?auto_82353 ?auto_82354 ) ) ( ON ?auto_82352 ?auto_82353 ) ( ON-TABLE ?auto_82354 ) ( ON ?auto_82351 ?auto_82352 ) ( ON ?auto_82350 ?auto_82351 ) ( ON ?auto_82349 ?auto_82350 ) ( ON ?auto_82348 ?auto_82349 ) ( CLEAR ?auto_82348 ) ( HOLDING ?auto_82347 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82347 )
      ( MAKE-7PILE ?auto_82347 ?auto_82348 ?auto_82349 ?auto_82350 ?auto_82351 ?auto_82352 ?auto_82353 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82355 - BLOCK
      ?auto_82356 - BLOCK
      ?auto_82357 - BLOCK
      ?auto_82358 - BLOCK
      ?auto_82359 - BLOCK
      ?auto_82360 - BLOCK
      ?auto_82361 - BLOCK
    )
    :vars
    (
      ?auto_82362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82355 ?auto_82356 ) ) ( not ( = ?auto_82355 ?auto_82357 ) ) ( not ( = ?auto_82355 ?auto_82358 ) ) ( not ( = ?auto_82355 ?auto_82359 ) ) ( not ( = ?auto_82355 ?auto_82360 ) ) ( not ( = ?auto_82355 ?auto_82361 ) ) ( not ( = ?auto_82356 ?auto_82357 ) ) ( not ( = ?auto_82356 ?auto_82358 ) ) ( not ( = ?auto_82356 ?auto_82359 ) ) ( not ( = ?auto_82356 ?auto_82360 ) ) ( not ( = ?auto_82356 ?auto_82361 ) ) ( not ( = ?auto_82357 ?auto_82358 ) ) ( not ( = ?auto_82357 ?auto_82359 ) ) ( not ( = ?auto_82357 ?auto_82360 ) ) ( not ( = ?auto_82357 ?auto_82361 ) ) ( not ( = ?auto_82358 ?auto_82359 ) ) ( not ( = ?auto_82358 ?auto_82360 ) ) ( not ( = ?auto_82358 ?auto_82361 ) ) ( not ( = ?auto_82359 ?auto_82360 ) ) ( not ( = ?auto_82359 ?auto_82361 ) ) ( not ( = ?auto_82360 ?auto_82361 ) ) ( ON ?auto_82361 ?auto_82362 ) ( not ( = ?auto_82355 ?auto_82362 ) ) ( not ( = ?auto_82356 ?auto_82362 ) ) ( not ( = ?auto_82357 ?auto_82362 ) ) ( not ( = ?auto_82358 ?auto_82362 ) ) ( not ( = ?auto_82359 ?auto_82362 ) ) ( not ( = ?auto_82360 ?auto_82362 ) ) ( not ( = ?auto_82361 ?auto_82362 ) ) ( ON ?auto_82360 ?auto_82361 ) ( ON-TABLE ?auto_82362 ) ( ON ?auto_82359 ?auto_82360 ) ( ON ?auto_82358 ?auto_82359 ) ( ON ?auto_82357 ?auto_82358 ) ( ON ?auto_82356 ?auto_82357 ) ( ON ?auto_82355 ?auto_82356 ) ( CLEAR ?auto_82355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82362 ?auto_82361 ?auto_82360 ?auto_82359 ?auto_82358 ?auto_82357 ?auto_82356 )
      ( MAKE-7PILE ?auto_82355 ?auto_82356 ?auto_82357 ?auto_82358 ?auto_82359 ?auto_82360 ?auto_82361 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82469 - BLOCK
    )
    :vars
    (
      ?auto_82470 - BLOCK
      ?auto_82471 - BLOCK
      ?auto_82472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82469 ?auto_82470 ) ( CLEAR ?auto_82469 ) ( not ( = ?auto_82469 ?auto_82470 ) ) ( HOLDING ?auto_82471 ) ( CLEAR ?auto_82472 ) ( not ( = ?auto_82469 ?auto_82471 ) ) ( not ( = ?auto_82469 ?auto_82472 ) ) ( not ( = ?auto_82470 ?auto_82471 ) ) ( not ( = ?auto_82470 ?auto_82472 ) ) ( not ( = ?auto_82471 ?auto_82472 ) ) )
    :subtasks
    ( ( !STACK ?auto_82471 ?auto_82472 )
      ( MAKE-1PILE ?auto_82469 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82473 - BLOCK
    )
    :vars
    (
      ?auto_82474 - BLOCK
      ?auto_82476 - BLOCK
      ?auto_82475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82473 ?auto_82474 ) ( not ( = ?auto_82473 ?auto_82474 ) ) ( CLEAR ?auto_82476 ) ( not ( = ?auto_82473 ?auto_82475 ) ) ( not ( = ?auto_82473 ?auto_82476 ) ) ( not ( = ?auto_82474 ?auto_82475 ) ) ( not ( = ?auto_82474 ?auto_82476 ) ) ( not ( = ?auto_82475 ?auto_82476 ) ) ( ON ?auto_82475 ?auto_82473 ) ( CLEAR ?auto_82475 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82474 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82474 ?auto_82473 )
      ( MAKE-1PILE ?auto_82473 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82477 - BLOCK
    )
    :vars
    (
      ?auto_82480 - BLOCK
      ?auto_82479 - BLOCK
      ?auto_82478 - BLOCK
      ?auto_82481 - BLOCK
      ?auto_82484 - BLOCK
      ?auto_82483 - BLOCK
      ?auto_82482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82477 ?auto_82480 ) ( not ( = ?auto_82477 ?auto_82480 ) ) ( not ( = ?auto_82477 ?auto_82479 ) ) ( not ( = ?auto_82477 ?auto_82478 ) ) ( not ( = ?auto_82480 ?auto_82479 ) ) ( not ( = ?auto_82480 ?auto_82478 ) ) ( not ( = ?auto_82479 ?auto_82478 ) ) ( ON ?auto_82479 ?auto_82477 ) ( CLEAR ?auto_82479 ) ( ON-TABLE ?auto_82480 ) ( HOLDING ?auto_82478 ) ( CLEAR ?auto_82481 ) ( ON-TABLE ?auto_82484 ) ( ON ?auto_82483 ?auto_82484 ) ( ON ?auto_82482 ?auto_82483 ) ( ON ?auto_82481 ?auto_82482 ) ( not ( = ?auto_82484 ?auto_82483 ) ) ( not ( = ?auto_82484 ?auto_82482 ) ) ( not ( = ?auto_82484 ?auto_82481 ) ) ( not ( = ?auto_82484 ?auto_82478 ) ) ( not ( = ?auto_82483 ?auto_82482 ) ) ( not ( = ?auto_82483 ?auto_82481 ) ) ( not ( = ?auto_82483 ?auto_82478 ) ) ( not ( = ?auto_82482 ?auto_82481 ) ) ( not ( = ?auto_82482 ?auto_82478 ) ) ( not ( = ?auto_82481 ?auto_82478 ) ) ( not ( = ?auto_82477 ?auto_82481 ) ) ( not ( = ?auto_82477 ?auto_82484 ) ) ( not ( = ?auto_82477 ?auto_82483 ) ) ( not ( = ?auto_82477 ?auto_82482 ) ) ( not ( = ?auto_82480 ?auto_82481 ) ) ( not ( = ?auto_82480 ?auto_82484 ) ) ( not ( = ?auto_82480 ?auto_82483 ) ) ( not ( = ?auto_82480 ?auto_82482 ) ) ( not ( = ?auto_82479 ?auto_82481 ) ) ( not ( = ?auto_82479 ?auto_82484 ) ) ( not ( = ?auto_82479 ?auto_82483 ) ) ( not ( = ?auto_82479 ?auto_82482 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82484 ?auto_82483 ?auto_82482 ?auto_82481 ?auto_82478 )
      ( MAKE-1PILE ?auto_82477 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82485 - BLOCK
    )
    :vars
    (
      ?auto_82489 - BLOCK
      ?auto_82486 - BLOCK
      ?auto_82487 - BLOCK
      ?auto_82488 - BLOCK
      ?auto_82492 - BLOCK
      ?auto_82490 - BLOCK
      ?auto_82491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82485 ?auto_82489 ) ( not ( = ?auto_82485 ?auto_82489 ) ) ( not ( = ?auto_82485 ?auto_82486 ) ) ( not ( = ?auto_82485 ?auto_82487 ) ) ( not ( = ?auto_82489 ?auto_82486 ) ) ( not ( = ?auto_82489 ?auto_82487 ) ) ( not ( = ?auto_82486 ?auto_82487 ) ) ( ON ?auto_82486 ?auto_82485 ) ( ON-TABLE ?auto_82489 ) ( CLEAR ?auto_82488 ) ( ON-TABLE ?auto_82492 ) ( ON ?auto_82490 ?auto_82492 ) ( ON ?auto_82491 ?auto_82490 ) ( ON ?auto_82488 ?auto_82491 ) ( not ( = ?auto_82492 ?auto_82490 ) ) ( not ( = ?auto_82492 ?auto_82491 ) ) ( not ( = ?auto_82492 ?auto_82488 ) ) ( not ( = ?auto_82492 ?auto_82487 ) ) ( not ( = ?auto_82490 ?auto_82491 ) ) ( not ( = ?auto_82490 ?auto_82488 ) ) ( not ( = ?auto_82490 ?auto_82487 ) ) ( not ( = ?auto_82491 ?auto_82488 ) ) ( not ( = ?auto_82491 ?auto_82487 ) ) ( not ( = ?auto_82488 ?auto_82487 ) ) ( not ( = ?auto_82485 ?auto_82488 ) ) ( not ( = ?auto_82485 ?auto_82492 ) ) ( not ( = ?auto_82485 ?auto_82490 ) ) ( not ( = ?auto_82485 ?auto_82491 ) ) ( not ( = ?auto_82489 ?auto_82488 ) ) ( not ( = ?auto_82489 ?auto_82492 ) ) ( not ( = ?auto_82489 ?auto_82490 ) ) ( not ( = ?auto_82489 ?auto_82491 ) ) ( not ( = ?auto_82486 ?auto_82488 ) ) ( not ( = ?auto_82486 ?auto_82492 ) ) ( not ( = ?auto_82486 ?auto_82490 ) ) ( not ( = ?auto_82486 ?auto_82491 ) ) ( ON ?auto_82487 ?auto_82486 ) ( CLEAR ?auto_82487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82489 ?auto_82485 ?auto_82486 )
      ( MAKE-1PILE ?auto_82485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82493 - BLOCK
    )
    :vars
    (
      ?auto_82498 - BLOCK
      ?auto_82496 - BLOCK
      ?auto_82495 - BLOCK
      ?auto_82500 - BLOCK
      ?auto_82494 - BLOCK
      ?auto_82499 - BLOCK
      ?auto_82497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82493 ?auto_82498 ) ( not ( = ?auto_82493 ?auto_82498 ) ) ( not ( = ?auto_82493 ?auto_82496 ) ) ( not ( = ?auto_82493 ?auto_82495 ) ) ( not ( = ?auto_82498 ?auto_82496 ) ) ( not ( = ?auto_82498 ?auto_82495 ) ) ( not ( = ?auto_82496 ?auto_82495 ) ) ( ON ?auto_82496 ?auto_82493 ) ( ON-TABLE ?auto_82498 ) ( ON-TABLE ?auto_82500 ) ( ON ?auto_82494 ?auto_82500 ) ( ON ?auto_82499 ?auto_82494 ) ( not ( = ?auto_82500 ?auto_82494 ) ) ( not ( = ?auto_82500 ?auto_82499 ) ) ( not ( = ?auto_82500 ?auto_82497 ) ) ( not ( = ?auto_82500 ?auto_82495 ) ) ( not ( = ?auto_82494 ?auto_82499 ) ) ( not ( = ?auto_82494 ?auto_82497 ) ) ( not ( = ?auto_82494 ?auto_82495 ) ) ( not ( = ?auto_82499 ?auto_82497 ) ) ( not ( = ?auto_82499 ?auto_82495 ) ) ( not ( = ?auto_82497 ?auto_82495 ) ) ( not ( = ?auto_82493 ?auto_82497 ) ) ( not ( = ?auto_82493 ?auto_82500 ) ) ( not ( = ?auto_82493 ?auto_82494 ) ) ( not ( = ?auto_82493 ?auto_82499 ) ) ( not ( = ?auto_82498 ?auto_82497 ) ) ( not ( = ?auto_82498 ?auto_82500 ) ) ( not ( = ?auto_82498 ?auto_82494 ) ) ( not ( = ?auto_82498 ?auto_82499 ) ) ( not ( = ?auto_82496 ?auto_82497 ) ) ( not ( = ?auto_82496 ?auto_82500 ) ) ( not ( = ?auto_82496 ?auto_82494 ) ) ( not ( = ?auto_82496 ?auto_82499 ) ) ( ON ?auto_82495 ?auto_82496 ) ( CLEAR ?auto_82495 ) ( HOLDING ?auto_82497 ) ( CLEAR ?auto_82499 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82500 ?auto_82494 ?auto_82499 ?auto_82497 )
      ( MAKE-1PILE ?auto_82493 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82501 - BLOCK
    )
    :vars
    (
      ?auto_82508 - BLOCK
      ?auto_82503 - BLOCK
      ?auto_82505 - BLOCK
      ?auto_82502 - BLOCK
      ?auto_82506 - BLOCK
      ?auto_82507 - BLOCK
      ?auto_82504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82501 ?auto_82508 ) ( not ( = ?auto_82501 ?auto_82508 ) ) ( not ( = ?auto_82501 ?auto_82503 ) ) ( not ( = ?auto_82501 ?auto_82505 ) ) ( not ( = ?auto_82508 ?auto_82503 ) ) ( not ( = ?auto_82508 ?auto_82505 ) ) ( not ( = ?auto_82503 ?auto_82505 ) ) ( ON ?auto_82503 ?auto_82501 ) ( ON-TABLE ?auto_82508 ) ( ON-TABLE ?auto_82502 ) ( ON ?auto_82506 ?auto_82502 ) ( ON ?auto_82507 ?auto_82506 ) ( not ( = ?auto_82502 ?auto_82506 ) ) ( not ( = ?auto_82502 ?auto_82507 ) ) ( not ( = ?auto_82502 ?auto_82504 ) ) ( not ( = ?auto_82502 ?auto_82505 ) ) ( not ( = ?auto_82506 ?auto_82507 ) ) ( not ( = ?auto_82506 ?auto_82504 ) ) ( not ( = ?auto_82506 ?auto_82505 ) ) ( not ( = ?auto_82507 ?auto_82504 ) ) ( not ( = ?auto_82507 ?auto_82505 ) ) ( not ( = ?auto_82504 ?auto_82505 ) ) ( not ( = ?auto_82501 ?auto_82504 ) ) ( not ( = ?auto_82501 ?auto_82502 ) ) ( not ( = ?auto_82501 ?auto_82506 ) ) ( not ( = ?auto_82501 ?auto_82507 ) ) ( not ( = ?auto_82508 ?auto_82504 ) ) ( not ( = ?auto_82508 ?auto_82502 ) ) ( not ( = ?auto_82508 ?auto_82506 ) ) ( not ( = ?auto_82508 ?auto_82507 ) ) ( not ( = ?auto_82503 ?auto_82504 ) ) ( not ( = ?auto_82503 ?auto_82502 ) ) ( not ( = ?auto_82503 ?auto_82506 ) ) ( not ( = ?auto_82503 ?auto_82507 ) ) ( ON ?auto_82505 ?auto_82503 ) ( CLEAR ?auto_82507 ) ( ON ?auto_82504 ?auto_82505 ) ( CLEAR ?auto_82504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82508 ?auto_82501 ?auto_82503 ?auto_82505 )
      ( MAKE-1PILE ?auto_82501 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82509 - BLOCK
    )
    :vars
    (
      ?auto_82515 - BLOCK
      ?auto_82510 - BLOCK
      ?auto_82512 - BLOCK
      ?auto_82513 - BLOCK
      ?auto_82514 - BLOCK
      ?auto_82511 - BLOCK
      ?auto_82516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82509 ?auto_82515 ) ( not ( = ?auto_82509 ?auto_82515 ) ) ( not ( = ?auto_82509 ?auto_82510 ) ) ( not ( = ?auto_82509 ?auto_82512 ) ) ( not ( = ?auto_82515 ?auto_82510 ) ) ( not ( = ?auto_82515 ?auto_82512 ) ) ( not ( = ?auto_82510 ?auto_82512 ) ) ( ON ?auto_82510 ?auto_82509 ) ( ON-TABLE ?auto_82515 ) ( ON-TABLE ?auto_82513 ) ( ON ?auto_82514 ?auto_82513 ) ( not ( = ?auto_82513 ?auto_82514 ) ) ( not ( = ?auto_82513 ?auto_82511 ) ) ( not ( = ?auto_82513 ?auto_82516 ) ) ( not ( = ?auto_82513 ?auto_82512 ) ) ( not ( = ?auto_82514 ?auto_82511 ) ) ( not ( = ?auto_82514 ?auto_82516 ) ) ( not ( = ?auto_82514 ?auto_82512 ) ) ( not ( = ?auto_82511 ?auto_82516 ) ) ( not ( = ?auto_82511 ?auto_82512 ) ) ( not ( = ?auto_82516 ?auto_82512 ) ) ( not ( = ?auto_82509 ?auto_82516 ) ) ( not ( = ?auto_82509 ?auto_82513 ) ) ( not ( = ?auto_82509 ?auto_82514 ) ) ( not ( = ?auto_82509 ?auto_82511 ) ) ( not ( = ?auto_82515 ?auto_82516 ) ) ( not ( = ?auto_82515 ?auto_82513 ) ) ( not ( = ?auto_82515 ?auto_82514 ) ) ( not ( = ?auto_82515 ?auto_82511 ) ) ( not ( = ?auto_82510 ?auto_82516 ) ) ( not ( = ?auto_82510 ?auto_82513 ) ) ( not ( = ?auto_82510 ?auto_82514 ) ) ( not ( = ?auto_82510 ?auto_82511 ) ) ( ON ?auto_82512 ?auto_82510 ) ( ON ?auto_82516 ?auto_82512 ) ( CLEAR ?auto_82516 ) ( HOLDING ?auto_82511 ) ( CLEAR ?auto_82514 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82513 ?auto_82514 ?auto_82511 )
      ( MAKE-1PILE ?auto_82509 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82517 - BLOCK
    )
    :vars
    (
      ?auto_82521 - BLOCK
      ?auto_82518 - BLOCK
      ?auto_82519 - BLOCK
      ?auto_82522 - BLOCK
      ?auto_82523 - BLOCK
      ?auto_82524 - BLOCK
      ?auto_82520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82517 ?auto_82521 ) ( not ( = ?auto_82517 ?auto_82521 ) ) ( not ( = ?auto_82517 ?auto_82518 ) ) ( not ( = ?auto_82517 ?auto_82519 ) ) ( not ( = ?auto_82521 ?auto_82518 ) ) ( not ( = ?auto_82521 ?auto_82519 ) ) ( not ( = ?auto_82518 ?auto_82519 ) ) ( ON ?auto_82518 ?auto_82517 ) ( ON-TABLE ?auto_82521 ) ( ON-TABLE ?auto_82522 ) ( ON ?auto_82523 ?auto_82522 ) ( not ( = ?auto_82522 ?auto_82523 ) ) ( not ( = ?auto_82522 ?auto_82524 ) ) ( not ( = ?auto_82522 ?auto_82520 ) ) ( not ( = ?auto_82522 ?auto_82519 ) ) ( not ( = ?auto_82523 ?auto_82524 ) ) ( not ( = ?auto_82523 ?auto_82520 ) ) ( not ( = ?auto_82523 ?auto_82519 ) ) ( not ( = ?auto_82524 ?auto_82520 ) ) ( not ( = ?auto_82524 ?auto_82519 ) ) ( not ( = ?auto_82520 ?auto_82519 ) ) ( not ( = ?auto_82517 ?auto_82520 ) ) ( not ( = ?auto_82517 ?auto_82522 ) ) ( not ( = ?auto_82517 ?auto_82523 ) ) ( not ( = ?auto_82517 ?auto_82524 ) ) ( not ( = ?auto_82521 ?auto_82520 ) ) ( not ( = ?auto_82521 ?auto_82522 ) ) ( not ( = ?auto_82521 ?auto_82523 ) ) ( not ( = ?auto_82521 ?auto_82524 ) ) ( not ( = ?auto_82518 ?auto_82520 ) ) ( not ( = ?auto_82518 ?auto_82522 ) ) ( not ( = ?auto_82518 ?auto_82523 ) ) ( not ( = ?auto_82518 ?auto_82524 ) ) ( ON ?auto_82519 ?auto_82518 ) ( ON ?auto_82520 ?auto_82519 ) ( CLEAR ?auto_82523 ) ( ON ?auto_82524 ?auto_82520 ) ( CLEAR ?auto_82524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82521 ?auto_82517 ?auto_82518 ?auto_82519 ?auto_82520 )
      ( MAKE-1PILE ?auto_82517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82525 - BLOCK
    )
    :vars
    (
      ?auto_82531 - BLOCK
      ?auto_82530 - BLOCK
      ?auto_82528 - BLOCK
      ?auto_82532 - BLOCK
      ?auto_82527 - BLOCK
      ?auto_82526 - BLOCK
      ?auto_82529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82525 ?auto_82531 ) ( not ( = ?auto_82525 ?auto_82531 ) ) ( not ( = ?auto_82525 ?auto_82530 ) ) ( not ( = ?auto_82525 ?auto_82528 ) ) ( not ( = ?auto_82531 ?auto_82530 ) ) ( not ( = ?auto_82531 ?auto_82528 ) ) ( not ( = ?auto_82530 ?auto_82528 ) ) ( ON ?auto_82530 ?auto_82525 ) ( ON-TABLE ?auto_82531 ) ( ON-TABLE ?auto_82532 ) ( not ( = ?auto_82532 ?auto_82527 ) ) ( not ( = ?auto_82532 ?auto_82526 ) ) ( not ( = ?auto_82532 ?auto_82529 ) ) ( not ( = ?auto_82532 ?auto_82528 ) ) ( not ( = ?auto_82527 ?auto_82526 ) ) ( not ( = ?auto_82527 ?auto_82529 ) ) ( not ( = ?auto_82527 ?auto_82528 ) ) ( not ( = ?auto_82526 ?auto_82529 ) ) ( not ( = ?auto_82526 ?auto_82528 ) ) ( not ( = ?auto_82529 ?auto_82528 ) ) ( not ( = ?auto_82525 ?auto_82529 ) ) ( not ( = ?auto_82525 ?auto_82532 ) ) ( not ( = ?auto_82525 ?auto_82527 ) ) ( not ( = ?auto_82525 ?auto_82526 ) ) ( not ( = ?auto_82531 ?auto_82529 ) ) ( not ( = ?auto_82531 ?auto_82532 ) ) ( not ( = ?auto_82531 ?auto_82527 ) ) ( not ( = ?auto_82531 ?auto_82526 ) ) ( not ( = ?auto_82530 ?auto_82529 ) ) ( not ( = ?auto_82530 ?auto_82532 ) ) ( not ( = ?auto_82530 ?auto_82527 ) ) ( not ( = ?auto_82530 ?auto_82526 ) ) ( ON ?auto_82528 ?auto_82530 ) ( ON ?auto_82529 ?auto_82528 ) ( ON ?auto_82526 ?auto_82529 ) ( CLEAR ?auto_82526 ) ( HOLDING ?auto_82527 ) ( CLEAR ?auto_82532 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82532 ?auto_82527 )
      ( MAKE-1PILE ?auto_82525 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82533 - BLOCK
    )
    :vars
    (
      ?auto_82540 - BLOCK
      ?auto_82535 - BLOCK
      ?auto_82534 - BLOCK
      ?auto_82539 - BLOCK
      ?auto_82537 - BLOCK
      ?auto_82538 - BLOCK
      ?auto_82536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82533 ?auto_82540 ) ( not ( = ?auto_82533 ?auto_82540 ) ) ( not ( = ?auto_82533 ?auto_82535 ) ) ( not ( = ?auto_82533 ?auto_82534 ) ) ( not ( = ?auto_82540 ?auto_82535 ) ) ( not ( = ?auto_82540 ?auto_82534 ) ) ( not ( = ?auto_82535 ?auto_82534 ) ) ( ON ?auto_82535 ?auto_82533 ) ( ON-TABLE ?auto_82540 ) ( ON-TABLE ?auto_82539 ) ( not ( = ?auto_82539 ?auto_82537 ) ) ( not ( = ?auto_82539 ?auto_82538 ) ) ( not ( = ?auto_82539 ?auto_82536 ) ) ( not ( = ?auto_82539 ?auto_82534 ) ) ( not ( = ?auto_82537 ?auto_82538 ) ) ( not ( = ?auto_82537 ?auto_82536 ) ) ( not ( = ?auto_82537 ?auto_82534 ) ) ( not ( = ?auto_82538 ?auto_82536 ) ) ( not ( = ?auto_82538 ?auto_82534 ) ) ( not ( = ?auto_82536 ?auto_82534 ) ) ( not ( = ?auto_82533 ?auto_82536 ) ) ( not ( = ?auto_82533 ?auto_82539 ) ) ( not ( = ?auto_82533 ?auto_82537 ) ) ( not ( = ?auto_82533 ?auto_82538 ) ) ( not ( = ?auto_82540 ?auto_82536 ) ) ( not ( = ?auto_82540 ?auto_82539 ) ) ( not ( = ?auto_82540 ?auto_82537 ) ) ( not ( = ?auto_82540 ?auto_82538 ) ) ( not ( = ?auto_82535 ?auto_82536 ) ) ( not ( = ?auto_82535 ?auto_82539 ) ) ( not ( = ?auto_82535 ?auto_82537 ) ) ( not ( = ?auto_82535 ?auto_82538 ) ) ( ON ?auto_82534 ?auto_82535 ) ( ON ?auto_82536 ?auto_82534 ) ( ON ?auto_82538 ?auto_82536 ) ( CLEAR ?auto_82539 ) ( ON ?auto_82537 ?auto_82538 ) ( CLEAR ?auto_82537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82540 ?auto_82533 ?auto_82535 ?auto_82534 ?auto_82536 ?auto_82538 )
      ( MAKE-1PILE ?auto_82533 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82541 - BLOCK
    )
    :vars
    (
      ?auto_82545 - BLOCK
      ?auto_82543 - BLOCK
      ?auto_82546 - BLOCK
      ?auto_82542 - BLOCK
      ?auto_82544 - BLOCK
      ?auto_82547 - BLOCK
      ?auto_82548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82541 ?auto_82545 ) ( not ( = ?auto_82541 ?auto_82545 ) ) ( not ( = ?auto_82541 ?auto_82543 ) ) ( not ( = ?auto_82541 ?auto_82546 ) ) ( not ( = ?auto_82545 ?auto_82543 ) ) ( not ( = ?auto_82545 ?auto_82546 ) ) ( not ( = ?auto_82543 ?auto_82546 ) ) ( ON ?auto_82543 ?auto_82541 ) ( ON-TABLE ?auto_82545 ) ( not ( = ?auto_82542 ?auto_82544 ) ) ( not ( = ?auto_82542 ?auto_82547 ) ) ( not ( = ?auto_82542 ?auto_82548 ) ) ( not ( = ?auto_82542 ?auto_82546 ) ) ( not ( = ?auto_82544 ?auto_82547 ) ) ( not ( = ?auto_82544 ?auto_82548 ) ) ( not ( = ?auto_82544 ?auto_82546 ) ) ( not ( = ?auto_82547 ?auto_82548 ) ) ( not ( = ?auto_82547 ?auto_82546 ) ) ( not ( = ?auto_82548 ?auto_82546 ) ) ( not ( = ?auto_82541 ?auto_82548 ) ) ( not ( = ?auto_82541 ?auto_82542 ) ) ( not ( = ?auto_82541 ?auto_82544 ) ) ( not ( = ?auto_82541 ?auto_82547 ) ) ( not ( = ?auto_82545 ?auto_82548 ) ) ( not ( = ?auto_82545 ?auto_82542 ) ) ( not ( = ?auto_82545 ?auto_82544 ) ) ( not ( = ?auto_82545 ?auto_82547 ) ) ( not ( = ?auto_82543 ?auto_82548 ) ) ( not ( = ?auto_82543 ?auto_82542 ) ) ( not ( = ?auto_82543 ?auto_82544 ) ) ( not ( = ?auto_82543 ?auto_82547 ) ) ( ON ?auto_82546 ?auto_82543 ) ( ON ?auto_82548 ?auto_82546 ) ( ON ?auto_82547 ?auto_82548 ) ( ON ?auto_82544 ?auto_82547 ) ( CLEAR ?auto_82544 ) ( HOLDING ?auto_82542 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82542 )
      ( MAKE-1PILE ?auto_82541 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82549 - BLOCK
    )
    :vars
    (
      ?auto_82554 - BLOCK
      ?auto_82556 - BLOCK
      ?auto_82555 - BLOCK
      ?auto_82550 - BLOCK
      ?auto_82553 - BLOCK
      ?auto_82551 - BLOCK
      ?auto_82552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82549 ?auto_82554 ) ( not ( = ?auto_82549 ?auto_82554 ) ) ( not ( = ?auto_82549 ?auto_82556 ) ) ( not ( = ?auto_82549 ?auto_82555 ) ) ( not ( = ?auto_82554 ?auto_82556 ) ) ( not ( = ?auto_82554 ?auto_82555 ) ) ( not ( = ?auto_82556 ?auto_82555 ) ) ( ON ?auto_82556 ?auto_82549 ) ( ON-TABLE ?auto_82554 ) ( not ( = ?auto_82550 ?auto_82553 ) ) ( not ( = ?auto_82550 ?auto_82551 ) ) ( not ( = ?auto_82550 ?auto_82552 ) ) ( not ( = ?auto_82550 ?auto_82555 ) ) ( not ( = ?auto_82553 ?auto_82551 ) ) ( not ( = ?auto_82553 ?auto_82552 ) ) ( not ( = ?auto_82553 ?auto_82555 ) ) ( not ( = ?auto_82551 ?auto_82552 ) ) ( not ( = ?auto_82551 ?auto_82555 ) ) ( not ( = ?auto_82552 ?auto_82555 ) ) ( not ( = ?auto_82549 ?auto_82552 ) ) ( not ( = ?auto_82549 ?auto_82550 ) ) ( not ( = ?auto_82549 ?auto_82553 ) ) ( not ( = ?auto_82549 ?auto_82551 ) ) ( not ( = ?auto_82554 ?auto_82552 ) ) ( not ( = ?auto_82554 ?auto_82550 ) ) ( not ( = ?auto_82554 ?auto_82553 ) ) ( not ( = ?auto_82554 ?auto_82551 ) ) ( not ( = ?auto_82556 ?auto_82552 ) ) ( not ( = ?auto_82556 ?auto_82550 ) ) ( not ( = ?auto_82556 ?auto_82553 ) ) ( not ( = ?auto_82556 ?auto_82551 ) ) ( ON ?auto_82555 ?auto_82556 ) ( ON ?auto_82552 ?auto_82555 ) ( ON ?auto_82551 ?auto_82552 ) ( ON ?auto_82553 ?auto_82551 ) ( ON ?auto_82550 ?auto_82553 ) ( CLEAR ?auto_82550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82554 ?auto_82549 ?auto_82556 ?auto_82555 ?auto_82552 ?auto_82551 ?auto_82553 )
      ( MAKE-1PILE ?auto_82549 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82568 - BLOCK
      ?auto_82569 - BLOCK
      ?auto_82570 - BLOCK
      ?auto_82571 - BLOCK
      ?auto_82572 - BLOCK
    )
    :vars
    (
      ?auto_82573 - BLOCK
      ?auto_82574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82573 ?auto_82572 ) ( CLEAR ?auto_82573 ) ( ON-TABLE ?auto_82568 ) ( ON ?auto_82569 ?auto_82568 ) ( ON ?auto_82570 ?auto_82569 ) ( ON ?auto_82571 ?auto_82570 ) ( ON ?auto_82572 ?auto_82571 ) ( not ( = ?auto_82568 ?auto_82569 ) ) ( not ( = ?auto_82568 ?auto_82570 ) ) ( not ( = ?auto_82568 ?auto_82571 ) ) ( not ( = ?auto_82568 ?auto_82572 ) ) ( not ( = ?auto_82568 ?auto_82573 ) ) ( not ( = ?auto_82569 ?auto_82570 ) ) ( not ( = ?auto_82569 ?auto_82571 ) ) ( not ( = ?auto_82569 ?auto_82572 ) ) ( not ( = ?auto_82569 ?auto_82573 ) ) ( not ( = ?auto_82570 ?auto_82571 ) ) ( not ( = ?auto_82570 ?auto_82572 ) ) ( not ( = ?auto_82570 ?auto_82573 ) ) ( not ( = ?auto_82571 ?auto_82572 ) ) ( not ( = ?auto_82571 ?auto_82573 ) ) ( not ( = ?auto_82572 ?auto_82573 ) ) ( HOLDING ?auto_82574 ) ( not ( = ?auto_82568 ?auto_82574 ) ) ( not ( = ?auto_82569 ?auto_82574 ) ) ( not ( = ?auto_82570 ?auto_82574 ) ) ( not ( = ?auto_82571 ?auto_82574 ) ) ( not ( = ?auto_82572 ?auto_82574 ) ) ( not ( = ?auto_82573 ?auto_82574 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_82574 )
      ( MAKE-5PILE ?auto_82568 ?auto_82569 ?auto_82570 ?auto_82571 ?auto_82572 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82665 - BLOCK
      ?auto_82666 - BLOCK
    )
    :vars
    (
      ?auto_82667 - BLOCK
      ?auto_82668 - BLOCK
      ?auto_82671 - BLOCK
      ?auto_82670 - BLOCK
      ?auto_82669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82665 ?auto_82666 ) ) ( ON ?auto_82666 ?auto_82667 ) ( not ( = ?auto_82665 ?auto_82667 ) ) ( not ( = ?auto_82666 ?auto_82667 ) ) ( ON ?auto_82665 ?auto_82666 ) ( CLEAR ?auto_82665 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82668 ) ( ON ?auto_82671 ?auto_82668 ) ( ON ?auto_82670 ?auto_82671 ) ( ON ?auto_82669 ?auto_82670 ) ( ON ?auto_82667 ?auto_82669 ) ( not ( = ?auto_82668 ?auto_82671 ) ) ( not ( = ?auto_82668 ?auto_82670 ) ) ( not ( = ?auto_82668 ?auto_82669 ) ) ( not ( = ?auto_82668 ?auto_82667 ) ) ( not ( = ?auto_82668 ?auto_82666 ) ) ( not ( = ?auto_82668 ?auto_82665 ) ) ( not ( = ?auto_82671 ?auto_82670 ) ) ( not ( = ?auto_82671 ?auto_82669 ) ) ( not ( = ?auto_82671 ?auto_82667 ) ) ( not ( = ?auto_82671 ?auto_82666 ) ) ( not ( = ?auto_82671 ?auto_82665 ) ) ( not ( = ?auto_82670 ?auto_82669 ) ) ( not ( = ?auto_82670 ?auto_82667 ) ) ( not ( = ?auto_82670 ?auto_82666 ) ) ( not ( = ?auto_82670 ?auto_82665 ) ) ( not ( = ?auto_82669 ?auto_82667 ) ) ( not ( = ?auto_82669 ?auto_82666 ) ) ( not ( = ?auto_82669 ?auto_82665 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82668 ?auto_82671 ?auto_82670 ?auto_82669 ?auto_82667 ?auto_82666 )
      ( MAKE-2PILE ?auto_82665 ?auto_82666 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82674 - BLOCK
      ?auto_82675 - BLOCK
    )
    :vars
    (
      ?auto_82676 - BLOCK
      ?auto_82677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82674 ?auto_82675 ) ) ( ON ?auto_82675 ?auto_82676 ) ( CLEAR ?auto_82675 ) ( not ( = ?auto_82674 ?auto_82676 ) ) ( not ( = ?auto_82675 ?auto_82676 ) ) ( ON ?auto_82674 ?auto_82677 ) ( CLEAR ?auto_82674 ) ( HAND-EMPTY ) ( not ( = ?auto_82674 ?auto_82677 ) ) ( not ( = ?auto_82675 ?auto_82677 ) ) ( not ( = ?auto_82676 ?auto_82677 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82674 ?auto_82677 )
      ( MAKE-2PILE ?auto_82674 ?auto_82675 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82678 - BLOCK
      ?auto_82679 - BLOCK
    )
    :vars
    (
      ?auto_82681 - BLOCK
      ?auto_82680 - BLOCK
      ?auto_82685 - BLOCK
      ?auto_82683 - BLOCK
      ?auto_82682 - BLOCK
      ?auto_82684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82678 ?auto_82679 ) ) ( not ( = ?auto_82678 ?auto_82681 ) ) ( not ( = ?auto_82679 ?auto_82681 ) ) ( ON ?auto_82678 ?auto_82680 ) ( CLEAR ?auto_82678 ) ( not ( = ?auto_82678 ?auto_82680 ) ) ( not ( = ?auto_82679 ?auto_82680 ) ) ( not ( = ?auto_82681 ?auto_82680 ) ) ( HOLDING ?auto_82679 ) ( CLEAR ?auto_82681 ) ( ON-TABLE ?auto_82685 ) ( ON ?auto_82683 ?auto_82685 ) ( ON ?auto_82682 ?auto_82683 ) ( ON ?auto_82684 ?auto_82682 ) ( ON ?auto_82681 ?auto_82684 ) ( not ( = ?auto_82685 ?auto_82683 ) ) ( not ( = ?auto_82685 ?auto_82682 ) ) ( not ( = ?auto_82685 ?auto_82684 ) ) ( not ( = ?auto_82685 ?auto_82681 ) ) ( not ( = ?auto_82685 ?auto_82679 ) ) ( not ( = ?auto_82683 ?auto_82682 ) ) ( not ( = ?auto_82683 ?auto_82684 ) ) ( not ( = ?auto_82683 ?auto_82681 ) ) ( not ( = ?auto_82683 ?auto_82679 ) ) ( not ( = ?auto_82682 ?auto_82684 ) ) ( not ( = ?auto_82682 ?auto_82681 ) ) ( not ( = ?auto_82682 ?auto_82679 ) ) ( not ( = ?auto_82684 ?auto_82681 ) ) ( not ( = ?auto_82684 ?auto_82679 ) ) ( not ( = ?auto_82678 ?auto_82685 ) ) ( not ( = ?auto_82678 ?auto_82683 ) ) ( not ( = ?auto_82678 ?auto_82682 ) ) ( not ( = ?auto_82678 ?auto_82684 ) ) ( not ( = ?auto_82680 ?auto_82685 ) ) ( not ( = ?auto_82680 ?auto_82683 ) ) ( not ( = ?auto_82680 ?auto_82682 ) ) ( not ( = ?auto_82680 ?auto_82684 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82685 ?auto_82683 ?auto_82682 ?auto_82684 ?auto_82681 ?auto_82679 )
      ( MAKE-2PILE ?auto_82678 ?auto_82679 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82686 - BLOCK
      ?auto_82687 - BLOCK
    )
    :vars
    (
      ?auto_82691 - BLOCK
      ?auto_82693 - BLOCK
      ?auto_82688 - BLOCK
      ?auto_82692 - BLOCK
      ?auto_82690 - BLOCK
      ?auto_82689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82686 ?auto_82687 ) ) ( not ( = ?auto_82686 ?auto_82691 ) ) ( not ( = ?auto_82687 ?auto_82691 ) ) ( ON ?auto_82686 ?auto_82693 ) ( not ( = ?auto_82686 ?auto_82693 ) ) ( not ( = ?auto_82687 ?auto_82693 ) ) ( not ( = ?auto_82691 ?auto_82693 ) ) ( CLEAR ?auto_82691 ) ( ON-TABLE ?auto_82688 ) ( ON ?auto_82692 ?auto_82688 ) ( ON ?auto_82690 ?auto_82692 ) ( ON ?auto_82689 ?auto_82690 ) ( ON ?auto_82691 ?auto_82689 ) ( not ( = ?auto_82688 ?auto_82692 ) ) ( not ( = ?auto_82688 ?auto_82690 ) ) ( not ( = ?auto_82688 ?auto_82689 ) ) ( not ( = ?auto_82688 ?auto_82691 ) ) ( not ( = ?auto_82688 ?auto_82687 ) ) ( not ( = ?auto_82692 ?auto_82690 ) ) ( not ( = ?auto_82692 ?auto_82689 ) ) ( not ( = ?auto_82692 ?auto_82691 ) ) ( not ( = ?auto_82692 ?auto_82687 ) ) ( not ( = ?auto_82690 ?auto_82689 ) ) ( not ( = ?auto_82690 ?auto_82691 ) ) ( not ( = ?auto_82690 ?auto_82687 ) ) ( not ( = ?auto_82689 ?auto_82691 ) ) ( not ( = ?auto_82689 ?auto_82687 ) ) ( not ( = ?auto_82686 ?auto_82688 ) ) ( not ( = ?auto_82686 ?auto_82692 ) ) ( not ( = ?auto_82686 ?auto_82690 ) ) ( not ( = ?auto_82686 ?auto_82689 ) ) ( not ( = ?auto_82693 ?auto_82688 ) ) ( not ( = ?auto_82693 ?auto_82692 ) ) ( not ( = ?auto_82693 ?auto_82690 ) ) ( not ( = ?auto_82693 ?auto_82689 ) ) ( ON ?auto_82687 ?auto_82686 ) ( CLEAR ?auto_82687 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82693 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82693 ?auto_82686 )
      ( MAKE-2PILE ?auto_82686 ?auto_82687 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82694 - BLOCK
      ?auto_82695 - BLOCK
    )
    :vars
    (
      ?auto_82700 - BLOCK
      ?auto_82696 - BLOCK
      ?auto_82698 - BLOCK
      ?auto_82699 - BLOCK
      ?auto_82697 - BLOCK
      ?auto_82701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82694 ?auto_82695 ) ) ( not ( = ?auto_82694 ?auto_82700 ) ) ( not ( = ?auto_82695 ?auto_82700 ) ) ( ON ?auto_82694 ?auto_82696 ) ( not ( = ?auto_82694 ?auto_82696 ) ) ( not ( = ?auto_82695 ?auto_82696 ) ) ( not ( = ?auto_82700 ?auto_82696 ) ) ( ON-TABLE ?auto_82698 ) ( ON ?auto_82699 ?auto_82698 ) ( ON ?auto_82697 ?auto_82699 ) ( ON ?auto_82701 ?auto_82697 ) ( not ( = ?auto_82698 ?auto_82699 ) ) ( not ( = ?auto_82698 ?auto_82697 ) ) ( not ( = ?auto_82698 ?auto_82701 ) ) ( not ( = ?auto_82698 ?auto_82700 ) ) ( not ( = ?auto_82698 ?auto_82695 ) ) ( not ( = ?auto_82699 ?auto_82697 ) ) ( not ( = ?auto_82699 ?auto_82701 ) ) ( not ( = ?auto_82699 ?auto_82700 ) ) ( not ( = ?auto_82699 ?auto_82695 ) ) ( not ( = ?auto_82697 ?auto_82701 ) ) ( not ( = ?auto_82697 ?auto_82700 ) ) ( not ( = ?auto_82697 ?auto_82695 ) ) ( not ( = ?auto_82701 ?auto_82700 ) ) ( not ( = ?auto_82701 ?auto_82695 ) ) ( not ( = ?auto_82694 ?auto_82698 ) ) ( not ( = ?auto_82694 ?auto_82699 ) ) ( not ( = ?auto_82694 ?auto_82697 ) ) ( not ( = ?auto_82694 ?auto_82701 ) ) ( not ( = ?auto_82696 ?auto_82698 ) ) ( not ( = ?auto_82696 ?auto_82699 ) ) ( not ( = ?auto_82696 ?auto_82697 ) ) ( not ( = ?auto_82696 ?auto_82701 ) ) ( ON ?auto_82695 ?auto_82694 ) ( CLEAR ?auto_82695 ) ( ON-TABLE ?auto_82696 ) ( HOLDING ?auto_82700 ) ( CLEAR ?auto_82701 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82698 ?auto_82699 ?auto_82697 ?auto_82701 ?auto_82700 )
      ( MAKE-2PILE ?auto_82694 ?auto_82695 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82702 - BLOCK
      ?auto_82703 - BLOCK
    )
    :vars
    (
      ?auto_82709 - BLOCK
      ?auto_82706 - BLOCK
      ?auto_82705 - BLOCK
      ?auto_82704 - BLOCK
      ?auto_82707 - BLOCK
      ?auto_82708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82702 ?auto_82703 ) ) ( not ( = ?auto_82702 ?auto_82709 ) ) ( not ( = ?auto_82703 ?auto_82709 ) ) ( ON ?auto_82702 ?auto_82706 ) ( not ( = ?auto_82702 ?auto_82706 ) ) ( not ( = ?auto_82703 ?auto_82706 ) ) ( not ( = ?auto_82709 ?auto_82706 ) ) ( ON-TABLE ?auto_82705 ) ( ON ?auto_82704 ?auto_82705 ) ( ON ?auto_82707 ?auto_82704 ) ( ON ?auto_82708 ?auto_82707 ) ( not ( = ?auto_82705 ?auto_82704 ) ) ( not ( = ?auto_82705 ?auto_82707 ) ) ( not ( = ?auto_82705 ?auto_82708 ) ) ( not ( = ?auto_82705 ?auto_82709 ) ) ( not ( = ?auto_82705 ?auto_82703 ) ) ( not ( = ?auto_82704 ?auto_82707 ) ) ( not ( = ?auto_82704 ?auto_82708 ) ) ( not ( = ?auto_82704 ?auto_82709 ) ) ( not ( = ?auto_82704 ?auto_82703 ) ) ( not ( = ?auto_82707 ?auto_82708 ) ) ( not ( = ?auto_82707 ?auto_82709 ) ) ( not ( = ?auto_82707 ?auto_82703 ) ) ( not ( = ?auto_82708 ?auto_82709 ) ) ( not ( = ?auto_82708 ?auto_82703 ) ) ( not ( = ?auto_82702 ?auto_82705 ) ) ( not ( = ?auto_82702 ?auto_82704 ) ) ( not ( = ?auto_82702 ?auto_82707 ) ) ( not ( = ?auto_82702 ?auto_82708 ) ) ( not ( = ?auto_82706 ?auto_82705 ) ) ( not ( = ?auto_82706 ?auto_82704 ) ) ( not ( = ?auto_82706 ?auto_82707 ) ) ( not ( = ?auto_82706 ?auto_82708 ) ) ( ON ?auto_82703 ?auto_82702 ) ( ON-TABLE ?auto_82706 ) ( CLEAR ?auto_82708 ) ( ON ?auto_82709 ?auto_82703 ) ( CLEAR ?auto_82709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82706 ?auto_82702 ?auto_82703 )
      ( MAKE-2PILE ?auto_82702 ?auto_82703 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82710 - BLOCK
      ?auto_82711 - BLOCK
    )
    :vars
    (
      ?auto_82715 - BLOCK
      ?auto_82713 - BLOCK
      ?auto_82712 - BLOCK
      ?auto_82716 - BLOCK
      ?auto_82714 - BLOCK
      ?auto_82717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82710 ?auto_82711 ) ) ( not ( = ?auto_82710 ?auto_82715 ) ) ( not ( = ?auto_82711 ?auto_82715 ) ) ( ON ?auto_82710 ?auto_82713 ) ( not ( = ?auto_82710 ?auto_82713 ) ) ( not ( = ?auto_82711 ?auto_82713 ) ) ( not ( = ?auto_82715 ?auto_82713 ) ) ( ON-TABLE ?auto_82712 ) ( ON ?auto_82716 ?auto_82712 ) ( ON ?auto_82714 ?auto_82716 ) ( not ( = ?auto_82712 ?auto_82716 ) ) ( not ( = ?auto_82712 ?auto_82714 ) ) ( not ( = ?auto_82712 ?auto_82717 ) ) ( not ( = ?auto_82712 ?auto_82715 ) ) ( not ( = ?auto_82712 ?auto_82711 ) ) ( not ( = ?auto_82716 ?auto_82714 ) ) ( not ( = ?auto_82716 ?auto_82717 ) ) ( not ( = ?auto_82716 ?auto_82715 ) ) ( not ( = ?auto_82716 ?auto_82711 ) ) ( not ( = ?auto_82714 ?auto_82717 ) ) ( not ( = ?auto_82714 ?auto_82715 ) ) ( not ( = ?auto_82714 ?auto_82711 ) ) ( not ( = ?auto_82717 ?auto_82715 ) ) ( not ( = ?auto_82717 ?auto_82711 ) ) ( not ( = ?auto_82710 ?auto_82712 ) ) ( not ( = ?auto_82710 ?auto_82716 ) ) ( not ( = ?auto_82710 ?auto_82714 ) ) ( not ( = ?auto_82710 ?auto_82717 ) ) ( not ( = ?auto_82713 ?auto_82712 ) ) ( not ( = ?auto_82713 ?auto_82716 ) ) ( not ( = ?auto_82713 ?auto_82714 ) ) ( not ( = ?auto_82713 ?auto_82717 ) ) ( ON ?auto_82711 ?auto_82710 ) ( ON-TABLE ?auto_82713 ) ( ON ?auto_82715 ?auto_82711 ) ( CLEAR ?auto_82715 ) ( HOLDING ?auto_82717 ) ( CLEAR ?auto_82714 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82712 ?auto_82716 ?auto_82714 ?auto_82717 )
      ( MAKE-2PILE ?auto_82710 ?auto_82711 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82718 - BLOCK
      ?auto_82719 - BLOCK
    )
    :vars
    (
      ?auto_82722 - BLOCK
      ?auto_82724 - BLOCK
      ?auto_82725 - BLOCK
      ?auto_82723 - BLOCK
      ?auto_82721 - BLOCK
      ?auto_82720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82718 ?auto_82719 ) ) ( not ( = ?auto_82718 ?auto_82722 ) ) ( not ( = ?auto_82719 ?auto_82722 ) ) ( ON ?auto_82718 ?auto_82724 ) ( not ( = ?auto_82718 ?auto_82724 ) ) ( not ( = ?auto_82719 ?auto_82724 ) ) ( not ( = ?auto_82722 ?auto_82724 ) ) ( ON-TABLE ?auto_82725 ) ( ON ?auto_82723 ?auto_82725 ) ( ON ?auto_82721 ?auto_82723 ) ( not ( = ?auto_82725 ?auto_82723 ) ) ( not ( = ?auto_82725 ?auto_82721 ) ) ( not ( = ?auto_82725 ?auto_82720 ) ) ( not ( = ?auto_82725 ?auto_82722 ) ) ( not ( = ?auto_82725 ?auto_82719 ) ) ( not ( = ?auto_82723 ?auto_82721 ) ) ( not ( = ?auto_82723 ?auto_82720 ) ) ( not ( = ?auto_82723 ?auto_82722 ) ) ( not ( = ?auto_82723 ?auto_82719 ) ) ( not ( = ?auto_82721 ?auto_82720 ) ) ( not ( = ?auto_82721 ?auto_82722 ) ) ( not ( = ?auto_82721 ?auto_82719 ) ) ( not ( = ?auto_82720 ?auto_82722 ) ) ( not ( = ?auto_82720 ?auto_82719 ) ) ( not ( = ?auto_82718 ?auto_82725 ) ) ( not ( = ?auto_82718 ?auto_82723 ) ) ( not ( = ?auto_82718 ?auto_82721 ) ) ( not ( = ?auto_82718 ?auto_82720 ) ) ( not ( = ?auto_82724 ?auto_82725 ) ) ( not ( = ?auto_82724 ?auto_82723 ) ) ( not ( = ?auto_82724 ?auto_82721 ) ) ( not ( = ?auto_82724 ?auto_82720 ) ) ( ON ?auto_82719 ?auto_82718 ) ( ON-TABLE ?auto_82724 ) ( ON ?auto_82722 ?auto_82719 ) ( CLEAR ?auto_82721 ) ( ON ?auto_82720 ?auto_82722 ) ( CLEAR ?auto_82720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82724 ?auto_82718 ?auto_82719 ?auto_82722 )
      ( MAKE-2PILE ?auto_82718 ?auto_82719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82726 - BLOCK
      ?auto_82727 - BLOCK
    )
    :vars
    (
      ?auto_82730 - BLOCK
      ?auto_82733 - BLOCK
      ?auto_82732 - BLOCK
      ?auto_82729 - BLOCK
      ?auto_82731 - BLOCK
      ?auto_82728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82726 ?auto_82727 ) ) ( not ( = ?auto_82726 ?auto_82730 ) ) ( not ( = ?auto_82727 ?auto_82730 ) ) ( ON ?auto_82726 ?auto_82733 ) ( not ( = ?auto_82726 ?auto_82733 ) ) ( not ( = ?auto_82727 ?auto_82733 ) ) ( not ( = ?auto_82730 ?auto_82733 ) ) ( ON-TABLE ?auto_82732 ) ( ON ?auto_82729 ?auto_82732 ) ( not ( = ?auto_82732 ?auto_82729 ) ) ( not ( = ?auto_82732 ?auto_82731 ) ) ( not ( = ?auto_82732 ?auto_82728 ) ) ( not ( = ?auto_82732 ?auto_82730 ) ) ( not ( = ?auto_82732 ?auto_82727 ) ) ( not ( = ?auto_82729 ?auto_82731 ) ) ( not ( = ?auto_82729 ?auto_82728 ) ) ( not ( = ?auto_82729 ?auto_82730 ) ) ( not ( = ?auto_82729 ?auto_82727 ) ) ( not ( = ?auto_82731 ?auto_82728 ) ) ( not ( = ?auto_82731 ?auto_82730 ) ) ( not ( = ?auto_82731 ?auto_82727 ) ) ( not ( = ?auto_82728 ?auto_82730 ) ) ( not ( = ?auto_82728 ?auto_82727 ) ) ( not ( = ?auto_82726 ?auto_82732 ) ) ( not ( = ?auto_82726 ?auto_82729 ) ) ( not ( = ?auto_82726 ?auto_82731 ) ) ( not ( = ?auto_82726 ?auto_82728 ) ) ( not ( = ?auto_82733 ?auto_82732 ) ) ( not ( = ?auto_82733 ?auto_82729 ) ) ( not ( = ?auto_82733 ?auto_82731 ) ) ( not ( = ?auto_82733 ?auto_82728 ) ) ( ON ?auto_82727 ?auto_82726 ) ( ON-TABLE ?auto_82733 ) ( ON ?auto_82730 ?auto_82727 ) ( ON ?auto_82728 ?auto_82730 ) ( CLEAR ?auto_82728 ) ( HOLDING ?auto_82731 ) ( CLEAR ?auto_82729 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82732 ?auto_82729 ?auto_82731 )
      ( MAKE-2PILE ?auto_82726 ?auto_82727 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82734 - BLOCK
      ?auto_82735 - BLOCK
    )
    :vars
    (
      ?auto_82739 - BLOCK
      ?auto_82738 - BLOCK
      ?auto_82740 - BLOCK
      ?auto_82737 - BLOCK
      ?auto_82741 - BLOCK
      ?auto_82736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82734 ?auto_82735 ) ) ( not ( = ?auto_82734 ?auto_82739 ) ) ( not ( = ?auto_82735 ?auto_82739 ) ) ( ON ?auto_82734 ?auto_82738 ) ( not ( = ?auto_82734 ?auto_82738 ) ) ( not ( = ?auto_82735 ?auto_82738 ) ) ( not ( = ?auto_82739 ?auto_82738 ) ) ( ON-TABLE ?auto_82740 ) ( ON ?auto_82737 ?auto_82740 ) ( not ( = ?auto_82740 ?auto_82737 ) ) ( not ( = ?auto_82740 ?auto_82741 ) ) ( not ( = ?auto_82740 ?auto_82736 ) ) ( not ( = ?auto_82740 ?auto_82739 ) ) ( not ( = ?auto_82740 ?auto_82735 ) ) ( not ( = ?auto_82737 ?auto_82741 ) ) ( not ( = ?auto_82737 ?auto_82736 ) ) ( not ( = ?auto_82737 ?auto_82739 ) ) ( not ( = ?auto_82737 ?auto_82735 ) ) ( not ( = ?auto_82741 ?auto_82736 ) ) ( not ( = ?auto_82741 ?auto_82739 ) ) ( not ( = ?auto_82741 ?auto_82735 ) ) ( not ( = ?auto_82736 ?auto_82739 ) ) ( not ( = ?auto_82736 ?auto_82735 ) ) ( not ( = ?auto_82734 ?auto_82740 ) ) ( not ( = ?auto_82734 ?auto_82737 ) ) ( not ( = ?auto_82734 ?auto_82741 ) ) ( not ( = ?auto_82734 ?auto_82736 ) ) ( not ( = ?auto_82738 ?auto_82740 ) ) ( not ( = ?auto_82738 ?auto_82737 ) ) ( not ( = ?auto_82738 ?auto_82741 ) ) ( not ( = ?auto_82738 ?auto_82736 ) ) ( ON ?auto_82735 ?auto_82734 ) ( ON-TABLE ?auto_82738 ) ( ON ?auto_82739 ?auto_82735 ) ( ON ?auto_82736 ?auto_82739 ) ( CLEAR ?auto_82737 ) ( ON ?auto_82741 ?auto_82736 ) ( CLEAR ?auto_82741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82738 ?auto_82734 ?auto_82735 ?auto_82739 ?auto_82736 )
      ( MAKE-2PILE ?auto_82734 ?auto_82735 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82742 - BLOCK
      ?auto_82743 - BLOCK
    )
    :vars
    (
      ?auto_82746 - BLOCK
      ?auto_82748 - BLOCK
      ?auto_82749 - BLOCK
      ?auto_82745 - BLOCK
      ?auto_82747 - BLOCK
      ?auto_82744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82742 ?auto_82743 ) ) ( not ( = ?auto_82742 ?auto_82746 ) ) ( not ( = ?auto_82743 ?auto_82746 ) ) ( ON ?auto_82742 ?auto_82748 ) ( not ( = ?auto_82742 ?auto_82748 ) ) ( not ( = ?auto_82743 ?auto_82748 ) ) ( not ( = ?auto_82746 ?auto_82748 ) ) ( ON-TABLE ?auto_82749 ) ( not ( = ?auto_82749 ?auto_82745 ) ) ( not ( = ?auto_82749 ?auto_82747 ) ) ( not ( = ?auto_82749 ?auto_82744 ) ) ( not ( = ?auto_82749 ?auto_82746 ) ) ( not ( = ?auto_82749 ?auto_82743 ) ) ( not ( = ?auto_82745 ?auto_82747 ) ) ( not ( = ?auto_82745 ?auto_82744 ) ) ( not ( = ?auto_82745 ?auto_82746 ) ) ( not ( = ?auto_82745 ?auto_82743 ) ) ( not ( = ?auto_82747 ?auto_82744 ) ) ( not ( = ?auto_82747 ?auto_82746 ) ) ( not ( = ?auto_82747 ?auto_82743 ) ) ( not ( = ?auto_82744 ?auto_82746 ) ) ( not ( = ?auto_82744 ?auto_82743 ) ) ( not ( = ?auto_82742 ?auto_82749 ) ) ( not ( = ?auto_82742 ?auto_82745 ) ) ( not ( = ?auto_82742 ?auto_82747 ) ) ( not ( = ?auto_82742 ?auto_82744 ) ) ( not ( = ?auto_82748 ?auto_82749 ) ) ( not ( = ?auto_82748 ?auto_82745 ) ) ( not ( = ?auto_82748 ?auto_82747 ) ) ( not ( = ?auto_82748 ?auto_82744 ) ) ( ON ?auto_82743 ?auto_82742 ) ( ON-TABLE ?auto_82748 ) ( ON ?auto_82746 ?auto_82743 ) ( ON ?auto_82744 ?auto_82746 ) ( ON ?auto_82747 ?auto_82744 ) ( CLEAR ?auto_82747 ) ( HOLDING ?auto_82745 ) ( CLEAR ?auto_82749 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82749 ?auto_82745 )
      ( MAKE-2PILE ?auto_82742 ?auto_82743 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82750 - BLOCK
      ?auto_82751 - BLOCK
    )
    :vars
    (
      ?auto_82756 - BLOCK
      ?auto_82755 - BLOCK
      ?auto_82752 - BLOCK
      ?auto_82754 - BLOCK
      ?auto_82753 - BLOCK
      ?auto_82757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82750 ?auto_82751 ) ) ( not ( = ?auto_82750 ?auto_82756 ) ) ( not ( = ?auto_82751 ?auto_82756 ) ) ( ON ?auto_82750 ?auto_82755 ) ( not ( = ?auto_82750 ?auto_82755 ) ) ( not ( = ?auto_82751 ?auto_82755 ) ) ( not ( = ?auto_82756 ?auto_82755 ) ) ( ON-TABLE ?auto_82752 ) ( not ( = ?auto_82752 ?auto_82754 ) ) ( not ( = ?auto_82752 ?auto_82753 ) ) ( not ( = ?auto_82752 ?auto_82757 ) ) ( not ( = ?auto_82752 ?auto_82756 ) ) ( not ( = ?auto_82752 ?auto_82751 ) ) ( not ( = ?auto_82754 ?auto_82753 ) ) ( not ( = ?auto_82754 ?auto_82757 ) ) ( not ( = ?auto_82754 ?auto_82756 ) ) ( not ( = ?auto_82754 ?auto_82751 ) ) ( not ( = ?auto_82753 ?auto_82757 ) ) ( not ( = ?auto_82753 ?auto_82756 ) ) ( not ( = ?auto_82753 ?auto_82751 ) ) ( not ( = ?auto_82757 ?auto_82756 ) ) ( not ( = ?auto_82757 ?auto_82751 ) ) ( not ( = ?auto_82750 ?auto_82752 ) ) ( not ( = ?auto_82750 ?auto_82754 ) ) ( not ( = ?auto_82750 ?auto_82753 ) ) ( not ( = ?auto_82750 ?auto_82757 ) ) ( not ( = ?auto_82755 ?auto_82752 ) ) ( not ( = ?auto_82755 ?auto_82754 ) ) ( not ( = ?auto_82755 ?auto_82753 ) ) ( not ( = ?auto_82755 ?auto_82757 ) ) ( ON ?auto_82751 ?auto_82750 ) ( ON-TABLE ?auto_82755 ) ( ON ?auto_82756 ?auto_82751 ) ( ON ?auto_82757 ?auto_82756 ) ( ON ?auto_82753 ?auto_82757 ) ( CLEAR ?auto_82752 ) ( ON ?auto_82754 ?auto_82753 ) ( CLEAR ?auto_82754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82755 ?auto_82750 ?auto_82751 ?auto_82756 ?auto_82757 ?auto_82753 )
      ( MAKE-2PILE ?auto_82750 ?auto_82751 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82758 - BLOCK
      ?auto_82759 - BLOCK
    )
    :vars
    (
      ?auto_82764 - BLOCK
      ?auto_82761 - BLOCK
      ?auto_82765 - BLOCK
      ?auto_82762 - BLOCK
      ?auto_82763 - BLOCK
      ?auto_82760 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82758 ?auto_82759 ) ) ( not ( = ?auto_82758 ?auto_82764 ) ) ( not ( = ?auto_82759 ?auto_82764 ) ) ( ON ?auto_82758 ?auto_82761 ) ( not ( = ?auto_82758 ?auto_82761 ) ) ( not ( = ?auto_82759 ?auto_82761 ) ) ( not ( = ?auto_82764 ?auto_82761 ) ) ( not ( = ?auto_82765 ?auto_82762 ) ) ( not ( = ?auto_82765 ?auto_82763 ) ) ( not ( = ?auto_82765 ?auto_82760 ) ) ( not ( = ?auto_82765 ?auto_82764 ) ) ( not ( = ?auto_82765 ?auto_82759 ) ) ( not ( = ?auto_82762 ?auto_82763 ) ) ( not ( = ?auto_82762 ?auto_82760 ) ) ( not ( = ?auto_82762 ?auto_82764 ) ) ( not ( = ?auto_82762 ?auto_82759 ) ) ( not ( = ?auto_82763 ?auto_82760 ) ) ( not ( = ?auto_82763 ?auto_82764 ) ) ( not ( = ?auto_82763 ?auto_82759 ) ) ( not ( = ?auto_82760 ?auto_82764 ) ) ( not ( = ?auto_82760 ?auto_82759 ) ) ( not ( = ?auto_82758 ?auto_82765 ) ) ( not ( = ?auto_82758 ?auto_82762 ) ) ( not ( = ?auto_82758 ?auto_82763 ) ) ( not ( = ?auto_82758 ?auto_82760 ) ) ( not ( = ?auto_82761 ?auto_82765 ) ) ( not ( = ?auto_82761 ?auto_82762 ) ) ( not ( = ?auto_82761 ?auto_82763 ) ) ( not ( = ?auto_82761 ?auto_82760 ) ) ( ON ?auto_82759 ?auto_82758 ) ( ON-TABLE ?auto_82761 ) ( ON ?auto_82764 ?auto_82759 ) ( ON ?auto_82760 ?auto_82764 ) ( ON ?auto_82763 ?auto_82760 ) ( ON ?auto_82762 ?auto_82763 ) ( CLEAR ?auto_82762 ) ( HOLDING ?auto_82765 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82765 )
      ( MAKE-2PILE ?auto_82758 ?auto_82759 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82766 - BLOCK
      ?auto_82767 - BLOCK
    )
    :vars
    (
      ?auto_82773 - BLOCK
      ?auto_82771 - BLOCK
      ?auto_82772 - BLOCK
      ?auto_82770 - BLOCK
      ?auto_82769 - BLOCK
      ?auto_82768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82766 ?auto_82767 ) ) ( not ( = ?auto_82766 ?auto_82773 ) ) ( not ( = ?auto_82767 ?auto_82773 ) ) ( ON ?auto_82766 ?auto_82771 ) ( not ( = ?auto_82766 ?auto_82771 ) ) ( not ( = ?auto_82767 ?auto_82771 ) ) ( not ( = ?auto_82773 ?auto_82771 ) ) ( not ( = ?auto_82772 ?auto_82770 ) ) ( not ( = ?auto_82772 ?auto_82769 ) ) ( not ( = ?auto_82772 ?auto_82768 ) ) ( not ( = ?auto_82772 ?auto_82773 ) ) ( not ( = ?auto_82772 ?auto_82767 ) ) ( not ( = ?auto_82770 ?auto_82769 ) ) ( not ( = ?auto_82770 ?auto_82768 ) ) ( not ( = ?auto_82770 ?auto_82773 ) ) ( not ( = ?auto_82770 ?auto_82767 ) ) ( not ( = ?auto_82769 ?auto_82768 ) ) ( not ( = ?auto_82769 ?auto_82773 ) ) ( not ( = ?auto_82769 ?auto_82767 ) ) ( not ( = ?auto_82768 ?auto_82773 ) ) ( not ( = ?auto_82768 ?auto_82767 ) ) ( not ( = ?auto_82766 ?auto_82772 ) ) ( not ( = ?auto_82766 ?auto_82770 ) ) ( not ( = ?auto_82766 ?auto_82769 ) ) ( not ( = ?auto_82766 ?auto_82768 ) ) ( not ( = ?auto_82771 ?auto_82772 ) ) ( not ( = ?auto_82771 ?auto_82770 ) ) ( not ( = ?auto_82771 ?auto_82769 ) ) ( not ( = ?auto_82771 ?auto_82768 ) ) ( ON ?auto_82767 ?auto_82766 ) ( ON-TABLE ?auto_82771 ) ( ON ?auto_82773 ?auto_82767 ) ( ON ?auto_82768 ?auto_82773 ) ( ON ?auto_82769 ?auto_82768 ) ( ON ?auto_82770 ?auto_82769 ) ( ON ?auto_82772 ?auto_82770 ) ( CLEAR ?auto_82772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82771 ?auto_82766 ?auto_82767 ?auto_82773 ?auto_82768 ?auto_82769 ?auto_82770 )
      ( MAKE-2PILE ?auto_82766 ?auto_82767 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82797 - BLOCK
      ?auto_82798 - BLOCK
      ?auto_82799 - BLOCK
      ?auto_82800 - BLOCK
    )
    :vars
    (
      ?auto_82803 - BLOCK
      ?auto_82802 - BLOCK
      ?auto_82801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82803 ?auto_82800 ) ( ON-TABLE ?auto_82797 ) ( ON ?auto_82798 ?auto_82797 ) ( ON ?auto_82799 ?auto_82798 ) ( ON ?auto_82800 ?auto_82799 ) ( not ( = ?auto_82797 ?auto_82798 ) ) ( not ( = ?auto_82797 ?auto_82799 ) ) ( not ( = ?auto_82797 ?auto_82800 ) ) ( not ( = ?auto_82797 ?auto_82803 ) ) ( not ( = ?auto_82798 ?auto_82799 ) ) ( not ( = ?auto_82798 ?auto_82800 ) ) ( not ( = ?auto_82798 ?auto_82803 ) ) ( not ( = ?auto_82799 ?auto_82800 ) ) ( not ( = ?auto_82799 ?auto_82803 ) ) ( not ( = ?auto_82800 ?auto_82803 ) ) ( not ( = ?auto_82797 ?auto_82802 ) ) ( not ( = ?auto_82797 ?auto_82801 ) ) ( not ( = ?auto_82798 ?auto_82802 ) ) ( not ( = ?auto_82798 ?auto_82801 ) ) ( not ( = ?auto_82799 ?auto_82802 ) ) ( not ( = ?auto_82799 ?auto_82801 ) ) ( not ( = ?auto_82800 ?auto_82802 ) ) ( not ( = ?auto_82800 ?auto_82801 ) ) ( not ( = ?auto_82803 ?auto_82802 ) ) ( not ( = ?auto_82803 ?auto_82801 ) ) ( not ( = ?auto_82802 ?auto_82801 ) ) ( ON ?auto_82802 ?auto_82803 ) ( CLEAR ?auto_82802 ) ( HOLDING ?auto_82801 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82801 )
      ( MAKE-4PILE ?auto_82797 ?auto_82798 ?auto_82799 ?auto_82800 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82884 - BLOCK
      ?auto_82885 - BLOCK
      ?auto_82886 - BLOCK
    )
    :vars
    (
      ?auto_82887 - BLOCK
      ?auto_82889 - BLOCK
      ?auto_82888 - BLOCK
      ?auto_82890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82884 ) ( not ( = ?auto_82884 ?auto_82885 ) ) ( not ( = ?auto_82884 ?auto_82886 ) ) ( not ( = ?auto_82885 ?auto_82886 ) ) ( ON ?auto_82886 ?auto_82887 ) ( not ( = ?auto_82884 ?auto_82887 ) ) ( not ( = ?auto_82885 ?auto_82887 ) ) ( not ( = ?auto_82886 ?auto_82887 ) ) ( CLEAR ?auto_82884 ) ( ON ?auto_82885 ?auto_82886 ) ( CLEAR ?auto_82885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82889 ) ( ON ?auto_82888 ?auto_82889 ) ( ON ?auto_82890 ?auto_82888 ) ( ON ?auto_82887 ?auto_82890 ) ( not ( = ?auto_82889 ?auto_82888 ) ) ( not ( = ?auto_82889 ?auto_82890 ) ) ( not ( = ?auto_82889 ?auto_82887 ) ) ( not ( = ?auto_82889 ?auto_82886 ) ) ( not ( = ?auto_82889 ?auto_82885 ) ) ( not ( = ?auto_82888 ?auto_82890 ) ) ( not ( = ?auto_82888 ?auto_82887 ) ) ( not ( = ?auto_82888 ?auto_82886 ) ) ( not ( = ?auto_82888 ?auto_82885 ) ) ( not ( = ?auto_82890 ?auto_82887 ) ) ( not ( = ?auto_82890 ?auto_82886 ) ) ( not ( = ?auto_82890 ?auto_82885 ) ) ( not ( = ?auto_82884 ?auto_82889 ) ) ( not ( = ?auto_82884 ?auto_82888 ) ) ( not ( = ?auto_82884 ?auto_82890 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82889 ?auto_82888 ?auto_82890 ?auto_82887 ?auto_82886 )
      ( MAKE-3PILE ?auto_82884 ?auto_82885 ?auto_82886 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82891 - BLOCK
      ?auto_82892 - BLOCK
      ?auto_82893 - BLOCK
    )
    :vars
    (
      ?auto_82896 - BLOCK
      ?auto_82895 - BLOCK
      ?auto_82897 - BLOCK
      ?auto_82894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82891 ?auto_82892 ) ) ( not ( = ?auto_82891 ?auto_82893 ) ) ( not ( = ?auto_82892 ?auto_82893 ) ) ( ON ?auto_82893 ?auto_82896 ) ( not ( = ?auto_82891 ?auto_82896 ) ) ( not ( = ?auto_82892 ?auto_82896 ) ) ( not ( = ?auto_82893 ?auto_82896 ) ) ( ON ?auto_82892 ?auto_82893 ) ( CLEAR ?auto_82892 ) ( ON-TABLE ?auto_82895 ) ( ON ?auto_82897 ?auto_82895 ) ( ON ?auto_82894 ?auto_82897 ) ( ON ?auto_82896 ?auto_82894 ) ( not ( = ?auto_82895 ?auto_82897 ) ) ( not ( = ?auto_82895 ?auto_82894 ) ) ( not ( = ?auto_82895 ?auto_82896 ) ) ( not ( = ?auto_82895 ?auto_82893 ) ) ( not ( = ?auto_82895 ?auto_82892 ) ) ( not ( = ?auto_82897 ?auto_82894 ) ) ( not ( = ?auto_82897 ?auto_82896 ) ) ( not ( = ?auto_82897 ?auto_82893 ) ) ( not ( = ?auto_82897 ?auto_82892 ) ) ( not ( = ?auto_82894 ?auto_82896 ) ) ( not ( = ?auto_82894 ?auto_82893 ) ) ( not ( = ?auto_82894 ?auto_82892 ) ) ( not ( = ?auto_82891 ?auto_82895 ) ) ( not ( = ?auto_82891 ?auto_82897 ) ) ( not ( = ?auto_82891 ?auto_82894 ) ) ( HOLDING ?auto_82891 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82891 )
      ( MAKE-3PILE ?auto_82891 ?auto_82892 ?auto_82893 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82898 - BLOCK
      ?auto_82899 - BLOCK
      ?auto_82900 - BLOCK
    )
    :vars
    (
      ?auto_82903 - BLOCK
      ?auto_82902 - BLOCK
      ?auto_82901 - BLOCK
      ?auto_82904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82898 ?auto_82899 ) ) ( not ( = ?auto_82898 ?auto_82900 ) ) ( not ( = ?auto_82899 ?auto_82900 ) ) ( ON ?auto_82900 ?auto_82903 ) ( not ( = ?auto_82898 ?auto_82903 ) ) ( not ( = ?auto_82899 ?auto_82903 ) ) ( not ( = ?auto_82900 ?auto_82903 ) ) ( ON ?auto_82899 ?auto_82900 ) ( ON-TABLE ?auto_82902 ) ( ON ?auto_82901 ?auto_82902 ) ( ON ?auto_82904 ?auto_82901 ) ( ON ?auto_82903 ?auto_82904 ) ( not ( = ?auto_82902 ?auto_82901 ) ) ( not ( = ?auto_82902 ?auto_82904 ) ) ( not ( = ?auto_82902 ?auto_82903 ) ) ( not ( = ?auto_82902 ?auto_82900 ) ) ( not ( = ?auto_82902 ?auto_82899 ) ) ( not ( = ?auto_82901 ?auto_82904 ) ) ( not ( = ?auto_82901 ?auto_82903 ) ) ( not ( = ?auto_82901 ?auto_82900 ) ) ( not ( = ?auto_82901 ?auto_82899 ) ) ( not ( = ?auto_82904 ?auto_82903 ) ) ( not ( = ?auto_82904 ?auto_82900 ) ) ( not ( = ?auto_82904 ?auto_82899 ) ) ( not ( = ?auto_82898 ?auto_82902 ) ) ( not ( = ?auto_82898 ?auto_82901 ) ) ( not ( = ?auto_82898 ?auto_82904 ) ) ( ON ?auto_82898 ?auto_82899 ) ( CLEAR ?auto_82898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82902 ?auto_82901 ?auto_82904 ?auto_82903 ?auto_82900 ?auto_82899 )
      ( MAKE-3PILE ?auto_82898 ?auto_82899 ?auto_82900 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82908 - BLOCK
      ?auto_82909 - BLOCK
      ?auto_82910 - BLOCK
    )
    :vars
    (
      ?auto_82911 - BLOCK
      ?auto_82913 - BLOCK
      ?auto_82914 - BLOCK
      ?auto_82912 - BLOCK
      ?auto_82915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82908 ?auto_82909 ) ) ( not ( = ?auto_82908 ?auto_82910 ) ) ( not ( = ?auto_82909 ?auto_82910 ) ) ( ON ?auto_82910 ?auto_82911 ) ( not ( = ?auto_82908 ?auto_82911 ) ) ( not ( = ?auto_82909 ?auto_82911 ) ) ( not ( = ?auto_82910 ?auto_82911 ) ) ( ON ?auto_82909 ?auto_82910 ) ( CLEAR ?auto_82909 ) ( ON-TABLE ?auto_82913 ) ( ON ?auto_82914 ?auto_82913 ) ( ON ?auto_82912 ?auto_82914 ) ( ON ?auto_82911 ?auto_82912 ) ( not ( = ?auto_82913 ?auto_82914 ) ) ( not ( = ?auto_82913 ?auto_82912 ) ) ( not ( = ?auto_82913 ?auto_82911 ) ) ( not ( = ?auto_82913 ?auto_82910 ) ) ( not ( = ?auto_82913 ?auto_82909 ) ) ( not ( = ?auto_82914 ?auto_82912 ) ) ( not ( = ?auto_82914 ?auto_82911 ) ) ( not ( = ?auto_82914 ?auto_82910 ) ) ( not ( = ?auto_82914 ?auto_82909 ) ) ( not ( = ?auto_82912 ?auto_82911 ) ) ( not ( = ?auto_82912 ?auto_82910 ) ) ( not ( = ?auto_82912 ?auto_82909 ) ) ( not ( = ?auto_82908 ?auto_82913 ) ) ( not ( = ?auto_82908 ?auto_82914 ) ) ( not ( = ?auto_82908 ?auto_82912 ) ) ( ON ?auto_82908 ?auto_82915 ) ( CLEAR ?auto_82908 ) ( HAND-EMPTY ) ( not ( = ?auto_82908 ?auto_82915 ) ) ( not ( = ?auto_82909 ?auto_82915 ) ) ( not ( = ?auto_82910 ?auto_82915 ) ) ( not ( = ?auto_82911 ?auto_82915 ) ) ( not ( = ?auto_82913 ?auto_82915 ) ) ( not ( = ?auto_82914 ?auto_82915 ) ) ( not ( = ?auto_82912 ?auto_82915 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82908 ?auto_82915 )
      ( MAKE-3PILE ?auto_82908 ?auto_82909 ?auto_82910 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82916 - BLOCK
      ?auto_82917 - BLOCK
      ?auto_82918 - BLOCK
    )
    :vars
    (
      ?auto_82923 - BLOCK
      ?auto_82919 - BLOCK
      ?auto_82920 - BLOCK
      ?auto_82921 - BLOCK
      ?auto_82922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82916 ?auto_82917 ) ) ( not ( = ?auto_82916 ?auto_82918 ) ) ( not ( = ?auto_82917 ?auto_82918 ) ) ( ON ?auto_82918 ?auto_82923 ) ( not ( = ?auto_82916 ?auto_82923 ) ) ( not ( = ?auto_82917 ?auto_82923 ) ) ( not ( = ?auto_82918 ?auto_82923 ) ) ( ON-TABLE ?auto_82919 ) ( ON ?auto_82920 ?auto_82919 ) ( ON ?auto_82921 ?auto_82920 ) ( ON ?auto_82923 ?auto_82921 ) ( not ( = ?auto_82919 ?auto_82920 ) ) ( not ( = ?auto_82919 ?auto_82921 ) ) ( not ( = ?auto_82919 ?auto_82923 ) ) ( not ( = ?auto_82919 ?auto_82918 ) ) ( not ( = ?auto_82919 ?auto_82917 ) ) ( not ( = ?auto_82920 ?auto_82921 ) ) ( not ( = ?auto_82920 ?auto_82923 ) ) ( not ( = ?auto_82920 ?auto_82918 ) ) ( not ( = ?auto_82920 ?auto_82917 ) ) ( not ( = ?auto_82921 ?auto_82923 ) ) ( not ( = ?auto_82921 ?auto_82918 ) ) ( not ( = ?auto_82921 ?auto_82917 ) ) ( not ( = ?auto_82916 ?auto_82919 ) ) ( not ( = ?auto_82916 ?auto_82920 ) ) ( not ( = ?auto_82916 ?auto_82921 ) ) ( ON ?auto_82916 ?auto_82922 ) ( CLEAR ?auto_82916 ) ( not ( = ?auto_82916 ?auto_82922 ) ) ( not ( = ?auto_82917 ?auto_82922 ) ) ( not ( = ?auto_82918 ?auto_82922 ) ) ( not ( = ?auto_82923 ?auto_82922 ) ) ( not ( = ?auto_82919 ?auto_82922 ) ) ( not ( = ?auto_82920 ?auto_82922 ) ) ( not ( = ?auto_82921 ?auto_82922 ) ) ( HOLDING ?auto_82917 ) ( CLEAR ?auto_82918 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82919 ?auto_82920 ?auto_82921 ?auto_82923 ?auto_82918 ?auto_82917 )
      ( MAKE-3PILE ?auto_82916 ?auto_82917 ?auto_82918 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82924 - BLOCK
      ?auto_82925 - BLOCK
      ?auto_82926 - BLOCK
    )
    :vars
    (
      ?auto_82927 - BLOCK
      ?auto_82928 - BLOCK
      ?auto_82931 - BLOCK
      ?auto_82930 - BLOCK
      ?auto_82929 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82924 ?auto_82925 ) ) ( not ( = ?auto_82924 ?auto_82926 ) ) ( not ( = ?auto_82925 ?auto_82926 ) ) ( ON ?auto_82926 ?auto_82927 ) ( not ( = ?auto_82924 ?auto_82927 ) ) ( not ( = ?auto_82925 ?auto_82927 ) ) ( not ( = ?auto_82926 ?auto_82927 ) ) ( ON-TABLE ?auto_82928 ) ( ON ?auto_82931 ?auto_82928 ) ( ON ?auto_82930 ?auto_82931 ) ( ON ?auto_82927 ?auto_82930 ) ( not ( = ?auto_82928 ?auto_82931 ) ) ( not ( = ?auto_82928 ?auto_82930 ) ) ( not ( = ?auto_82928 ?auto_82927 ) ) ( not ( = ?auto_82928 ?auto_82926 ) ) ( not ( = ?auto_82928 ?auto_82925 ) ) ( not ( = ?auto_82931 ?auto_82930 ) ) ( not ( = ?auto_82931 ?auto_82927 ) ) ( not ( = ?auto_82931 ?auto_82926 ) ) ( not ( = ?auto_82931 ?auto_82925 ) ) ( not ( = ?auto_82930 ?auto_82927 ) ) ( not ( = ?auto_82930 ?auto_82926 ) ) ( not ( = ?auto_82930 ?auto_82925 ) ) ( not ( = ?auto_82924 ?auto_82928 ) ) ( not ( = ?auto_82924 ?auto_82931 ) ) ( not ( = ?auto_82924 ?auto_82930 ) ) ( ON ?auto_82924 ?auto_82929 ) ( not ( = ?auto_82924 ?auto_82929 ) ) ( not ( = ?auto_82925 ?auto_82929 ) ) ( not ( = ?auto_82926 ?auto_82929 ) ) ( not ( = ?auto_82927 ?auto_82929 ) ) ( not ( = ?auto_82928 ?auto_82929 ) ) ( not ( = ?auto_82931 ?auto_82929 ) ) ( not ( = ?auto_82930 ?auto_82929 ) ) ( CLEAR ?auto_82926 ) ( ON ?auto_82925 ?auto_82924 ) ( CLEAR ?auto_82925 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82929 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82929 ?auto_82924 )
      ( MAKE-3PILE ?auto_82924 ?auto_82925 ?auto_82926 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82932 - BLOCK
      ?auto_82933 - BLOCK
      ?auto_82934 - BLOCK
    )
    :vars
    (
      ?auto_82938 - BLOCK
      ?auto_82937 - BLOCK
      ?auto_82939 - BLOCK
      ?auto_82936 - BLOCK
      ?auto_82935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82932 ?auto_82933 ) ) ( not ( = ?auto_82932 ?auto_82934 ) ) ( not ( = ?auto_82933 ?auto_82934 ) ) ( not ( = ?auto_82932 ?auto_82938 ) ) ( not ( = ?auto_82933 ?auto_82938 ) ) ( not ( = ?auto_82934 ?auto_82938 ) ) ( ON-TABLE ?auto_82937 ) ( ON ?auto_82939 ?auto_82937 ) ( ON ?auto_82936 ?auto_82939 ) ( ON ?auto_82938 ?auto_82936 ) ( not ( = ?auto_82937 ?auto_82939 ) ) ( not ( = ?auto_82937 ?auto_82936 ) ) ( not ( = ?auto_82937 ?auto_82938 ) ) ( not ( = ?auto_82937 ?auto_82934 ) ) ( not ( = ?auto_82937 ?auto_82933 ) ) ( not ( = ?auto_82939 ?auto_82936 ) ) ( not ( = ?auto_82939 ?auto_82938 ) ) ( not ( = ?auto_82939 ?auto_82934 ) ) ( not ( = ?auto_82939 ?auto_82933 ) ) ( not ( = ?auto_82936 ?auto_82938 ) ) ( not ( = ?auto_82936 ?auto_82934 ) ) ( not ( = ?auto_82936 ?auto_82933 ) ) ( not ( = ?auto_82932 ?auto_82937 ) ) ( not ( = ?auto_82932 ?auto_82939 ) ) ( not ( = ?auto_82932 ?auto_82936 ) ) ( ON ?auto_82932 ?auto_82935 ) ( not ( = ?auto_82932 ?auto_82935 ) ) ( not ( = ?auto_82933 ?auto_82935 ) ) ( not ( = ?auto_82934 ?auto_82935 ) ) ( not ( = ?auto_82938 ?auto_82935 ) ) ( not ( = ?auto_82937 ?auto_82935 ) ) ( not ( = ?auto_82939 ?auto_82935 ) ) ( not ( = ?auto_82936 ?auto_82935 ) ) ( ON ?auto_82933 ?auto_82932 ) ( CLEAR ?auto_82933 ) ( ON-TABLE ?auto_82935 ) ( HOLDING ?auto_82934 ) ( CLEAR ?auto_82938 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82937 ?auto_82939 ?auto_82936 ?auto_82938 ?auto_82934 )
      ( MAKE-3PILE ?auto_82932 ?auto_82933 ?auto_82934 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82940 - BLOCK
      ?auto_82941 - BLOCK
      ?auto_82942 - BLOCK
    )
    :vars
    (
      ?auto_82944 - BLOCK
      ?auto_82947 - BLOCK
      ?auto_82943 - BLOCK
      ?auto_82945 - BLOCK
      ?auto_82946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82940 ?auto_82941 ) ) ( not ( = ?auto_82940 ?auto_82942 ) ) ( not ( = ?auto_82941 ?auto_82942 ) ) ( not ( = ?auto_82940 ?auto_82944 ) ) ( not ( = ?auto_82941 ?auto_82944 ) ) ( not ( = ?auto_82942 ?auto_82944 ) ) ( ON-TABLE ?auto_82947 ) ( ON ?auto_82943 ?auto_82947 ) ( ON ?auto_82945 ?auto_82943 ) ( ON ?auto_82944 ?auto_82945 ) ( not ( = ?auto_82947 ?auto_82943 ) ) ( not ( = ?auto_82947 ?auto_82945 ) ) ( not ( = ?auto_82947 ?auto_82944 ) ) ( not ( = ?auto_82947 ?auto_82942 ) ) ( not ( = ?auto_82947 ?auto_82941 ) ) ( not ( = ?auto_82943 ?auto_82945 ) ) ( not ( = ?auto_82943 ?auto_82944 ) ) ( not ( = ?auto_82943 ?auto_82942 ) ) ( not ( = ?auto_82943 ?auto_82941 ) ) ( not ( = ?auto_82945 ?auto_82944 ) ) ( not ( = ?auto_82945 ?auto_82942 ) ) ( not ( = ?auto_82945 ?auto_82941 ) ) ( not ( = ?auto_82940 ?auto_82947 ) ) ( not ( = ?auto_82940 ?auto_82943 ) ) ( not ( = ?auto_82940 ?auto_82945 ) ) ( ON ?auto_82940 ?auto_82946 ) ( not ( = ?auto_82940 ?auto_82946 ) ) ( not ( = ?auto_82941 ?auto_82946 ) ) ( not ( = ?auto_82942 ?auto_82946 ) ) ( not ( = ?auto_82944 ?auto_82946 ) ) ( not ( = ?auto_82947 ?auto_82946 ) ) ( not ( = ?auto_82943 ?auto_82946 ) ) ( not ( = ?auto_82945 ?auto_82946 ) ) ( ON ?auto_82941 ?auto_82940 ) ( ON-TABLE ?auto_82946 ) ( CLEAR ?auto_82944 ) ( ON ?auto_82942 ?auto_82941 ) ( CLEAR ?auto_82942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82946 ?auto_82940 ?auto_82941 )
      ( MAKE-3PILE ?auto_82940 ?auto_82941 ?auto_82942 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82948 - BLOCK
      ?auto_82949 - BLOCK
      ?auto_82950 - BLOCK
    )
    :vars
    (
      ?auto_82952 - BLOCK
      ?auto_82951 - BLOCK
      ?auto_82954 - BLOCK
      ?auto_82955 - BLOCK
      ?auto_82953 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82948 ?auto_82949 ) ) ( not ( = ?auto_82948 ?auto_82950 ) ) ( not ( = ?auto_82949 ?auto_82950 ) ) ( not ( = ?auto_82948 ?auto_82952 ) ) ( not ( = ?auto_82949 ?auto_82952 ) ) ( not ( = ?auto_82950 ?auto_82952 ) ) ( ON-TABLE ?auto_82951 ) ( ON ?auto_82954 ?auto_82951 ) ( ON ?auto_82955 ?auto_82954 ) ( not ( = ?auto_82951 ?auto_82954 ) ) ( not ( = ?auto_82951 ?auto_82955 ) ) ( not ( = ?auto_82951 ?auto_82952 ) ) ( not ( = ?auto_82951 ?auto_82950 ) ) ( not ( = ?auto_82951 ?auto_82949 ) ) ( not ( = ?auto_82954 ?auto_82955 ) ) ( not ( = ?auto_82954 ?auto_82952 ) ) ( not ( = ?auto_82954 ?auto_82950 ) ) ( not ( = ?auto_82954 ?auto_82949 ) ) ( not ( = ?auto_82955 ?auto_82952 ) ) ( not ( = ?auto_82955 ?auto_82950 ) ) ( not ( = ?auto_82955 ?auto_82949 ) ) ( not ( = ?auto_82948 ?auto_82951 ) ) ( not ( = ?auto_82948 ?auto_82954 ) ) ( not ( = ?auto_82948 ?auto_82955 ) ) ( ON ?auto_82948 ?auto_82953 ) ( not ( = ?auto_82948 ?auto_82953 ) ) ( not ( = ?auto_82949 ?auto_82953 ) ) ( not ( = ?auto_82950 ?auto_82953 ) ) ( not ( = ?auto_82952 ?auto_82953 ) ) ( not ( = ?auto_82951 ?auto_82953 ) ) ( not ( = ?auto_82954 ?auto_82953 ) ) ( not ( = ?auto_82955 ?auto_82953 ) ) ( ON ?auto_82949 ?auto_82948 ) ( ON-TABLE ?auto_82953 ) ( ON ?auto_82950 ?auto_82949 ) ( CLEAR ?auto_82950 ) ( HOLDING ?auto_82952 ) ( CLEAR ?auto_82955 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82951 ?auto_82954 ?auto_82955 ?auto_82952 )
      ( MAKE-3PILE ?auto_82948 ?auto_82949 ?auto_82950 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82956 - BLOCK
      ?auto_82957 - BLOCK
      ?auto_82958 - BLOCK
    )
    :vars
    (
      ?auto_82960 - BLOCK
      ?auto_82959 - BLOCK
      ?auto_82961 - BLOCK
      ?auto_82963 - BLOCK
      ?auto_82962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82956 ?auto_82957 ) ) ( not ( = ?auto_82956 ?auto_82958 ) ) ( not ( = ?auto_82957 ?auto_82958 ) ) ( not ( = ?auto_82956 ?auto_82960 ) ) ( not ( = ?auto_82957 ?auto_82960 ) ) ( not ( = ?auto_82958 ?auto_82960 ) ) ( ON-TABLE ?auto_82959 ) ( ON ?auto_82961 ?auto_82959 ) ( ON ?auto_82963 ?auto_82961 ) ( not ( = ?auto_82959 ?auto_82961 ) ) ( not ( = ?auto_82959 ?auto_82963 ) ) ( not ( = ?auto_82959 ?auto_82960 ) ) ( not ( = ?auto_82959 ?auto_82958 ) ) ( not ( = ?auto_82959 ?auto_82957 ) ) ( not ( = ?auto_82961 ?auto_82963 ) ) ( not ( = ?auto_82961 ?auto_82960 ) ) ( not ( = ?auto_82961 ?auto_82958 ) ) ( not ( = ?auto_82961 ?auto_82957 ) ) ( not ( = ?auto_82963 ?auto_82960 ) ) ( not ( = ?auto_82963 ?auto_82958 ) ) ( not ( = ?auto_82963 ?auto_82957 ) ) ( not ( = ?auto_82956 ?auto_82959 ) ) ( not ( = ?auto_82956 ?auto_82961 ) ) ( not ( = ?auto_82956 ?auto_82963 ) ) ( ON ?auto_82956 ?auto_82962 ) ( not ( = ?auto_82956 ?auto_82962 ) ) ( not ( = ?auto_82957 ?auto_82962 ) ) ( not ( = ?auto_82958 ?auto_82962 ) ) ( not ( = ?auto_82960 ?auto_82962 ) ) ( not ( = ?auto_82959 ?auto_82962 ) ) ( not ( = ?auto_82961 ?auto_82962 ) ) ( not ( = ?auto_82963 ?auto_82962 ) ) ( ON ?auto_82957 ?auto_82956 ) ( ON-TABLE ?auto_82962 ) ( ON ?auto_82958 ?auto_82957 ) ( CLEAR ?auto_82963 ) ( ON ?auto_82960 ?auto_82958 ) ( CLEAR ?auto_82960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82962 ?auto_82956 ?auto_82957 ?auto_82958 )
      ( MAKE-3PILE ?auto_82956 ?auto_82957 ?auto_82958 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82964 - BLOCK
      ?auto_82965 - BLOCK
      ?auto_82966 - BLOCK
    )
    :vars
    (
      ?auto_82970 - BLOCK
      ?auto_82971 - BLOCK
      ?auto_82968 - BLOCK
      ?auto_82967 - BLOCK
      ?auto_82969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82964 ?auto_82965 ) ) ( not ( = ?auto_82964 ?auto_82966 ) ) ( not ( = ?auto_82965 ?auto_82966 ) ) ( not ( = ?auto_82964 ?auto_82970 ) ) ( not ( = ?auto_82965 ?auto_82970 ) ) ( not ( = ?auto_82966 ?auto_82970 ) ) ( ON-TABLE ?auto_82971 ) ( ON ?auto_82968 ?auto_82971 ) ( not ( = ?auto_82971 ?auto_82968 ) ) ( not ( = ?auto_82971 ?auto_82967 ) ) ( not ( = ?auto_82971 ?auto_82970 ) ) ( not ( = ?auto_82971 ?auto_82966 ) ) ( not ( = ?auto_82971 ?auto_82965 ) ) ( not ( = ?auto_82968 ?auto_82967 ) ) ( not ( = ?auto_82968 ?auto_82970 ) ) ( not ( = ?auto_82968 ?auto_82966 ) ) ( not ( = ?auto_82968 ?auto_82965 ) ) ( not ( = ?auto_82967 ?auto_82970 ) ) ( not ( = ?auto_82967 ?auto_82966 ) ) ( not ( = ?auto_82967 ?auto_82965 ) ) ( not ( = ?auto_82964 ?auto_82971 ) ) ( not ( = ?auto_82964 ?auto_82968 ) ) ( not ( = ?auto_82964 ?auto_82967 ) ) ( ON ?auto_82964 ?auto_82969 ) ( not ( = ?auto_82964 ?auto_82969 ) ) ( not ( = ?auto_82965 ?auto_82969 ) ) ( not ( = ?auto_82966 ?auto_82969 ) ) ( not ( = ?auto_82970 ?auto_82969 ) ) ( not ( = ?auto_82971 ?auto_82969 ) ) ( not ( = ?auto_82968 ?auto_82969 ) ) ( not ( = ?auto_82967 ?auto_82969 ) ) ( ON ?auto_82965 ?auto_82964 ) ( ON-TABLE ?auto_82969 ) ( ON ?auto_82966 ?auto_82965 ) ( ON ?auto_82970 ?auto_82966 ) ( CLEAR ?auto_82970 ) ( HOLDING ?auto_82967 ) ( CLEAR ?auto_82968 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82971 ?auto_82968 ?auto_82967 )
      ( MAKE-3PILE ?auto_82964 ?auto_82965 ?auto_82966 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82972 - BLOCK
      ?auto_82973 - BLOCK
      ?auto_82974 - BLOCK
    )
    :vars
    (
      ?auto_82976 - BLOCK
      ?auto_82975 - BLOCK
      ?auto_82978 - BLOCK
      ?auto_82979 - BLOCK
      ?auto_82977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82972 ?auto_82973 ) ) ( not ( = ?auto_82972 ?auto_82974 ) ) ( not ( = ?auto_82973 ?auto_82974 ) ) ( not ( = ?auto_82972 ?auto_82976 ) ) ( not ( = ?auto_82973 ?auto_82976 ) ) ( not ( = ?auto_82974 ?auto_82976 ) ) ( ON-TABLE ?auto_82975 ) ( ON ?auto_82978 ?auto_82975 ) ( not ( = ?auto_82975 ?auto_82978 ) ) ( not ( = ?auto_82975 ?auto_82979 ) ) ( not ( = ?auto_82975 ?auto_82976 ) ) ( not ( = ?auto_82975 ?auto_82974 ) ) ( not ( = ?auto_82975 ?auto_82973 ) ) ( not ( = ?auto_82978 ?auto_82979 ) ) ( not ( = ?auto_82978 ?auto_82976 ) ) ( not ( = ?auto_82978 ?auto_82974 ) ) ( not ( = ?auto_82978 ?auto_82973 ) ) ( not ( = ?auto_82979 ?auto_82976 ) ) ( not ( = ?auto_82979 ?auto_82974 ) ) ( not ( = ?auto_82979 ?auto_82973 ) ) ( not ( = ?auto_82972 ?auto_82975 ) ) ( not ( = ?auto_82972 ?auto_82978 ) ) ( not ( = ?auto_82972 ?auto_82979 ) ) ( ON ?auto_82972 ?auto_82977 ) ( not ( = ?auto_82972 ?auto_82977 ) ) ( not ( = ?auto_82973 ?auto_82977 ) ) ( not ( = ?auto_82974 ?auto_82977 ) ) ( not ( = ?auto_82976 ?auto_82977 ) ) ( not ( = ?auto_82975 ?auto_82977 ) ) ( not ( = ?auto_82978 ?auto_82977 ) ) ( not ( = ?auto_82979 ?auto_82977 ) ) ( ON ?auto_82973 ?auto_82972 ) ( ON-TABLE ?auto_82977 ) ( ON ?auto_82974 ?auto_82973 ) ( ON ?auto_82976 ?auto_82974 ) ( CLEAR ?auto_82978 ) ( ON ?auto_82979 ?auto_82976 ) ( CLEAR ?auto_82979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82977 ?auto_82972 ?auto_82973 ?auto_82974 ?auto_82976 )
      ( MAKE-3PILE ?auto_82972 ?auto_82973 ?auto_82974 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82980 - BLOCK
      ?auto_82981 - BLOCK
      ?auto_82982 - BLOCK
    )
    :vars
    (
      ?auto_82983 - BLOCK
      ?auto_82985 - BLOCK
      ?auto_82984 - BLOCK
      ?auto_82986 - BLOCK
      ?auto_82987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82980 ?auto_82981 ) ) ( not ( = ?auto_82980 ?auto_82982 ) ) ( not ( = ?auto_82981 ?auto_82982 ) ) ( not ( = ?auto_82980 ?auto_82983 ) ) ( not ( = ?auto_82981 ?auto_82983 ) ) ( not ( = ?auto_82982 ?auto_82983 ) ) ( ON-TABLE ?auto_82985 ) ( not ( = ?auto_82985 ?auto_82984 ) ) ( not ( = ?auto_82985 ?auto_82986 ) ) ( not ( = ?auto_82985 ?auto_82983 ) ) ( not ( = ?auto_82985 ?auto_82982 ) ) ( not ( = ?auto_82985 ?auto_82981 ) ) ( not ( = ?auto_82984 ?auto_82986 ) ) ( not ( = ?auto_82984 ?auto_82983 ) ) ( not ( = ?auto_82984 ?auto_82982 ) ) ( not ( = ?auto_82984 ?auto_82981 ) ) ( not ( = ?auto_82986 ?auto_82983 ) ) ( not ( = ?auto_82986 ?auto_82982 ) ) ( not ( = ?auto_82986 ?auto_82981 ) ) ( not ( = ?auto_82980 ?auto_82985 ) ) ( not ( = ?auto_82980 ?auto_82984 ) ) ( not ( = ?auto_82980 ?auto_82986 ) ) ( ON ?auto_82980 ?auto_82987 ) ( not ( = ?auto_82980 ?auto_82987 ) ) ( not ( = ?auto_82981 ?auto_82987 ) ) ( not ( = ?auto_82982 ?auto_82987 ) ) ( not ( = ?auto_82983 ?auto_82987 ) ) ( not ( = ?auto_82985 ?auto_82987 ) ) ( not ( = ?auto_82984 ?auto_82987 ) ) ( not ( = ?auto_82986 ?auto_82987 ) ) ( ON ?auto_82981 ?auto_82980 ) ( ON-TABLE ?auto_82987 ) ( ON ?auto_82982 ?auto_82981 ) ( ON ?auto_82983 ?auto_82982 ) ( ON ?auto_82986 ?auto_82983 ) ( CLEAR ?auto_82986 ) ( HOLDING ?auto_82984 ) ( CLEAR ?auto_82985 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82985 ?auto_82984 )
      ( MAKE-3PILE ?auto_82980 ?auto_82981 ?auto_82982 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82988 - BLOCK
      ?auto_82989 - BLOCK
      ?auto_82990 - BLOCK
    )
    :vars
    (
      ?auto_82995 - BLOCK
      ?auto_82994 - BLOCK
      ?auto_82993 - BLOCK
      ?auto_82991 - BLOCK
      ?auto_82992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82988 ?auto_82989 ) ) ( not ( = ?auto_82988 ?auto_82990 ) ) ( not ( = ?auto_82989 ?auto_82990 ) ) ( not ( = ?auto_82988 ?auto_82995 ) ) ( not ( = ?auto_82989 ?auto_82995 ) ) ( not ( = ?auto_82990 ?auto_82995 ) ) ( ON-TABLE ?auto_82994 ) ( not ( = ?auto_82994 ?auto_82993 ) ) ( not ( = ?auto_82994 ?auto_82991 ) ) ( not ( = ?auto_82994 ?auto_82995 ) ) ( not ( = ?auto_82994 ?auto_82990 ) ) ( not ( = ?auto_82994 ?auto_82989 ) ) ( not ( = ?auto_82993 ?auto_82991 ) ) ( not ( = ?auto_82993 ?auto_82995 ) ) ( not ( = ?auto_82993 ?auto_82990 ) ) ( not ( = ?auto_82993 ?auto_82989 ) ) ( not ( = ?auto_82991 ?auto_82995 ) ) ( not ( = ?auto_82991 ?auto_82990 ) ) ( not ( = ?auto_82991 ?auto_82989 ) ) ( not ( = ?auto_82988 ?auto_82994 ) ) ( not ( = ?auto_82988 ?auto_82993 ) ) ( not ( = ?auto_82988 ?auto_82991 ) ) ( ON ?auto_82988 ?auto_82992 ) ( not ( = ?auto_82988 ?auto_82992 ) ) ( not ( = ?auto_82989 ?auto_82992 ) ) ( not ( = ?auto_82990 ?auto_82992 ) ) ( not ( = ?auto_82995 ?auto_82992 ) ) ( not ( = ?auto_82994 ?auto_82992 ) ) ( not ( = ?auto_82993 ?auto_82992 ) ) ( not ( = ?auto_82991 ?auto_82992 ) ) ( ON ?auto_82989 ?auto_82988 ) ( ON-TABLE ?auto_82992 ) ( ON ?auto_82990 ?auto_82989 ) ( ON ?auto_82995 ?auto_82990 ) ( ON ?auto_82991 ?auto_82995 ) ( CLEAR ?auto_82994 ) ( ON ?auto_82993 ?auto_82991 ) ( CLEAR ?auto_82993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82992 ?auto_82988 ?auto_82989 ?auto_82990 ?auto_82995 ?auto_82991 )
      ( MAKE-3PILE ?auto_82988 ?auto_82989 ?auto_82990 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82996 - BLOCK
      ?auto_82997 - BLOCK
      ?auto_82998 - BLOCK
    )
    :vars
    (
      ?auto_83003 - BLOCK
      ?auto_82999 - BLOCK
      ?auto_83000 - BLOCK
      ?auto_83001 - BLOCK
      ?auto_83002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82996 ?auto_82997 ) ) ( not ( = ?auto_82996 ?auto_82998 ) ) ( not ( = ?auto_82997 ?auto_82998 ) ) ( not ( = ?auto_82996 ?auto_83003 ) ) ( not ( = ?auto_82997 ?auto_83003 ) ) ( not ( = ?auto_82998 ?auto_83003 ) ) ( not ( = ?auto_82999 ?auto_83000 ) ) ( not ( = ?auto_82999 ?auto_83001 ) ) ( not ( = ?auto_82999 ?auto_83003 ) ) ( not ( = ?auto_82999 ?auto_82998 ) ) ( not ( = ?auto_82999 ?auto_82997 ) ) ( not ( = ?auto_83000 ?auto_83001 ) ) ( not ( = ?auto_83000 ?auto_83003 ) ) ( not ( = ?auto_83000 ?auto_82998 ) ) ( not ( = ?auto_83000 ?auto_82997 ) ) ( not ( = ?auto_83001 ?auto_83003 ) ) ( not ( = ?auto_83001 ?auto_82998 ) ) ( not ( = ?auto_83001 ?auto_82997 ) ) ( not ( = ?auto_82996 ?auto_82999 ) ) ( not ( = ?auto_82996 ?auto_83000 ) ) ( not ( = ?auto_82996 ?auto_83001 ) ) ( ON ?auto_82996 ?auto_83002 ) ( not ( = ?auto_82996 ?auto_83002 ) ) ( not ( = ?auto_82997 ?auto_83002 ) ) ( not ( = ?auto_82998 ?auto_83002 ) ) ( not ( = ?auto_83003 ?auto_83002 ) ) ( not ( = ?auto_82999 ?auto_83002 ) ) ( not ( = ?auto_83000 ?auto_83002 ) ) ( not ( = ?auto_83001 ?auto_83002 ) ) ( ON ?auto_82997 ?auto_82996 ) ( ON-TABLE ?auto_83002 ) ( ON ?auto_82998 ?auto_82997 ) ( ON ?auto_83003 ?auto_82998 ) ( ON ?auto_83001 ?auto_83003 ) ( ON ?auto_83000 ?auto_83001 ) ( CLEAR ?auto_83000 ) ( HOLDING ?auto_82999 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82999 )
      ( MAKE-3PILE ?auto_82996 ?auto_82997 ?auto_82998 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83004 - BLOCK
      ?auto_83005 - BLOCK
      ?auto_83006 - BLOCK
    )
    :vars
    (
      ?auto_83011 - BLOCK
      ?auto_83009 - BLOCK
      ?auto_83008 - BLOCK
      ?auto_83010 - BLOCK
      ?auto_83007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83004 ?auto_83005 ) ) ( not ( = ?auto_83004 ?auto_83006 ) ) ( not ( = ?auto_83005 ?auto_83006 ) ) ( not ( = ?auto_83004 ?auto_83011 ) ) ( not ( = ?auto_83005 ?auto_83011 ) ) ( not ( = ?auto_83006 ?auto_83011 ) ) ( not ( = ?auto_83009 ?auto_83008 ) ) ( not ( = ?auto_83009 ?auto_83010 ) ) ( not ( = ?auto_83009 ?auto_83011 ) ) ( not ( = ?auto_83009 ?auto_83006 ) ) ( not ( = ?auto_83009 ?auto_83005 ) ) ( not ( = ?auto_83008 ?auto_83010 ) ) ( not ( = ?auto_83008 ?auto_83011 ) ) ( not ( = ?auto_83008 ?auto_83006 ) ) ( not ( = ?auto_83008 ?auto_83005 ) ) ( not ( = ?auto_83010 ?auto_83011 ) ) ( not ( = ?auto_83010 ?auto_83006 ) ) ( not ( = ?auto_83010 ?auto_83005 ) ) ( not ( = ?auto_83004 ?auto_83009 ) ) ( not ( = ?auto_83004 ?auto_83008 ) ) ( not ( = ?auto_83004 ?auto_83010 ) ) ( ON ?auto_83004 ?auto_83007 ) ( not ( = ?auto_83004 ?auto_83007 ) ) ( not ( = ?auto_83005 ?auto_83007 ) ) ( not ( = ?auto_83006 ?auto_83007 ) ) ( not ( = ?auto_83011 ?auto_83007 ) ) ( not ( = ?auto_83009 ?auto_83007 ) ) ( not ( = ?auto_83008 ?auto_83007 ) ) ( not ( = ?auto_83010 ?auto_83007 ) ) ( ON ?auto_83005 ?auto_83004 ) ( ON-TABLE ?auto_83007 ) ( ON ?auto_83006 ?auto_83005 ) ( ON ?auto_83011 ?auto_83006 ) ( ON ?auto_83010 ?auto_83011 ) ( ON ?auto_83008 ?auto_83010 ) ( ON ?auto_83009 ?auto_83008 ) ( CLEAR ?auto_83009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83007 ?auto_83004 ?auto_83005 ?auto_83006 ?auto_83011 ?auto_83010 ?auto_83008 )
      ( MAKE-3PILE ?auto_83004 ?auto_83005 ?auto_83006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83031 - BLOCK
      ?auto_83032 - BLOCK
      ?auto_83033 - BLOCK
    )
    :vars
    (
      ?auto_83035 - BLOCK
      ?auto_83036 - BLOCK
      ?auto_83034 - BLOCK
      ?auto_83037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83035 ?auto_83033 ) ( ON-TABLE ?auto_83031 ) ( ON ?auto_83032 ?auto_83031 ) ( ON ?auto_83033 ?auto_83032 ) ( not ( = ?auto_83031 ?auto_83032 ) ) ( not ( = ?auto_83031 ?auto_83033 ) ) ( not ( = ?auto_83031 ?auto_83035 ) ) ( not ( = ?auto_83032 ?auto_83033 ) ) ( not ( = ?auto_83032 ?auto_83035 ) ) ( not ( = ?auto_83033 ?auto_83035 ) ) ( not ( = ?auto_83031 ?auto_83036 ) ) ( not ( = ?auto_83031 ?auto_83034 ) ) ( not ( = ?auto_83032 ?auto_83036 ) ) ( not ( = ?auto_83032 ?auto_83034 ) ) ( not ( = ?auto_83033 ?auto_83036 ) ) ( not ( = ?auto_83033 ?auto_83034 ) ) ( not ( = ?auto_83035 ?auto_83036 ) ) ( not ( = ?auto_83035 ?auto_83034 ) ) ( not ( = ?auto_83036 ?auto_83034 ) ) ( ON ?auto_83036 ?auto_83035 ) ( CLEAR ?auto_83036 ) ( HOLDING ?auto_83034 ) ( CLEAR ?auto_83037 ) ( ON-TABLE ?auto_83037 ) ( not ( = ?auto_83037 ?auto_83034 ) ) ( not ( = ?auto_83031 ?auto_83037 ) ) ( not ( = ?auto_83032 ?auto_83037 ) ) ( not ( = ?auto_83033 ?auto_83037 ) ) ( not ( = ?auto_83035 ?auto_83037 ) ) ( not ( = ?auto_83036 ?auto_83037 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83037 ?auto_83034 )
      ( MAKE-3PILE ?auto_83031 ?auto_83032 ?auto_83033 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83038 - BLOCK
      ?auto_83039 - BLOCK
      ?auto_83040 - BLOCK
    )
    :vars
    (
      ?auto_83041 - BLOCK
      ?auto_83043 - BLOCK
      ?auto_83044 - BLOCK
      ?auto_83042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83041 ?auto_83040 ) ( ON-TABLE ?auto_83038 ) ( ON ?auto_83039 ?auto_83038 ) ( ON ?auto_83040 ?auto_83039 ) ( not ( = ?auto_83038 ?auto_83039 ) ) ( not ( = ?auto_83038 ?auto_83040 ) ) ( not ( = ?auto_83038 ?auto_83041 ) ) ( not ( = ?auto_83039 ?auto_83040 ) ) ( not ( = ?auto_83039 ?auto_83041 ) ) ( not ( = ?auto_83040 ?auto_83041 ) ) ( not ( = ?auto_83038 ?auto_83043 ) ) ( not ( = ?auto_83038 ?auto_83044 ) ) ( not ( = ?auto_83039 ?auto_83043 ) ) ( not ( = ?auto_83039 ?auto_83044 ) ) ( not ( = ?auto_83040 ?auto_83043 ) ) ( not ( = ?auto_83040 ?auto_83044 ) ) ( not ( = ?auto_83041 ?auto_83043 ) ) ( not ( = ?auto_83041 ?auto_83044 ) ) ( not ( = ?auto_83043 ?auto_83044 ) ) ( ON ?auto_83043 ?auto_83041 ) ( CLEAR ?auto_83042 ) ( ON-TABLE ?auto_83042 ) ( not ( = ?auto_83042 ?auto_83044 ) ) ( not ( = ?auto_83038 ?auto_83042 ) ) ( not ( = ?auto_83039 ?auto_83042 ) ) ( not ( = ?auto_83040 ?auto_83042 ) ) ( not ( = ?auto_83041 ?auto_83042 ) ) ( not ( = ?auto_83043 ?auto_83042 ) ) ( ON ?auto_83044 ?auto_83043 ) ( CLEAR ?auto_83044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83038 ?auto_83039 ?auto_83040 ?auto_83041 ?auto_83043 )
      ( MAKE-3PILE ?auto_83038 ?auto_83039 ?auto_83040 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83045 - BLOCK
      ?auto_83046 - BLOCK
      ?auto_83047 - BLOCK
    )
    :vars
    (
      ?auto_83048 - BLOCK
      ?auto_83051 - BLOCK
      ?auto_83050 - BLOCK
      ?auto_83049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83048 ?auto_83047 ) ( ON-TABLE ?auto_83045 ) ( ON ?auto_83046 ?auto_83045 ) ( ON ?auto_83047 ?auto_83046 ) ( not ( = ?auto_83045 ?auto_83046 ) ) ( not ( = ?auto_83045 ?auto_83047 ) ) ( not ( = ?auto_83045 ?auto_83048 ) ) ( not ( = ?auto_83046 ?auto_83047 ) ) ( not ( = ?auto_83046 ?auto_83048 ) ) ( not ( = ?auto_83047 ?auto_83048 ) ) ( not ( = ?auto_83045 ?auto_83051 ) ) ( not ( = ?auto_83045 ?auto_83050 ) ) ( not ( = ?auto_83046 ?auto_83051 ) ) ( not ( = ?auto_83046 ?auto_83050 ) ) ( not ( = ?auto_83047 ?auto_83051 ) ) ( not ( = ?auto_83047 ?auto_83050 ) ) ( not ( = ?auto_83048 ?auto_83051 ) ) ( not ( = ?auto_83048 ?auto_83050 ) ) ( not ( = ?auto_83051 ?auto_83050 ) ) ( ON ?auto_83051 ?auto_83048 ) ( not ( = ?auto_83049 ?auto_83050 ) ) ( not ( = ?auto_83045 ?auto_83049 ) ) ( not ( = ?auto_83046 ?auto_83049 ) ) ( not ( = ?auto_83047 ?auto_83049 ) ) ( not ( = ?auto_83048 ?auto_83049 ) ) ( not ( = ?auto_83051 ?auto_83049 ) ) ( ON ?auto_83050 ?auto_83051 ) ( CLEAR ?auto_83050 ) ( HOLDING ?auto_83049 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83049 )
      ( MAKE-3PILE ?auto_83045 ?auto_83046 ?auto_83047 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83062 - BLOCK
      ?auto_83063 - BLOCK
      ?auto_83064 - BLOCK
    )
    :vars
    (
      ?auto_83068 - BLOCK
      ?auto_83067 - BLOCK
      ?auto_83066 - BLOCK
      ?auto_83065 - BLOCK
      ?auto_83069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83068 ?auto_83064 ) ( ON-TABLE ?auto_83062 ) ( ON ?auto_83063 ?auto_83062 ) ( ON ?auto_83064 ?auto_83063 ) ( not ( = ?auto_83062 ?auto_83063 ) ) ( not ( = ?auto_83062 ?auto_83064 ) ) ( not ( = ?auto_83062 ?auto_83068 ) ) ( not ( = ?auto_83063 ?auto_83064 ) ) ( not ( = ?auto_83063 ?auto_83068 ) ) ( not ( = ?auto_83064 ?auto_83068 ) ) ( not ( = ?auto_83062 ?auto_83067 ) ) ( not ( = ?auto_83062 ?auto_83066 ) ) ( not ( = ?auto_83063 ?auto_83067 ) ) ( not ( = ?auto_83063 ?auto_83066 ) ) ( not ( = ?auto_83064 ?auto_83067 ) ) ( not ( = ?auto_83064 ?auto_83066 ) ) ( not ( = ?auto_83068 ?auto_83067 ) ) ( not ( = ?auto_83068 ?auto_83066 ) ) ( not ( = ?auto_83067 ?auto_83066 ) ) ( ON ?auto_83067 ?auto_83068 ) ( not ( = ?auto_83065 ?auto_83066 ) ) ( not ( = ?auto_83062 ?auto_83065 ) ) ( not ( = ?auto_83063 ?auto_83065 ) ) ( not ( = ?auto_83064 ?auto_83065 ) ) ( not ( = ?auto_83068 ?auto_83065 ) ) ( not ( = ?auto_83067 ?auto_83065 ) ) ( ON ?auto_83066 ?auto_83067 ) ( CLEAR ?auto_83066 ) ( ON ?auto_83065 ?auto_83069 ) ( CLEAR ?auto_83065 ) ( HAND-EMPTY ) ( not ( = ?auto_83062 ?auto_83069 ) ) ( not ( = ?auto_83063 ?auto_83069 ) ) ( not ( = ?auto_83064 ?auto_83069 ) ) ( not ( = ?auto_83068 ?auto_83069 ) ) ( not ( = ?auto_83067 ?auto_83069 ) ) ( not ( = ?auto_83066 ?auto_83069 ) ) ( not ( = ?auto_83065 ?auto_83069 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83065 ?auto_83069 )
      ( MAKE-3PILE ?auto_83062 ?auto_83063 ?auto_83064 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83070 - BLOCK
      ?auto_83071 - BLOCK
      ?auto_83072 - BLOCK
    )
    :vars
    (
      ?auto_83075 - BLOCK
      ?auto_83074 - BLOCK
      ?auto_83077 - BLOCK
      ?auto_83073 - BLOCK
      ?auto_83076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83075 ?auto_83072 ) ( ON-TABLE ?auto_83070 ) ( ON ?auto_83071 ?auto_83070 ) ( ON ?auto_83072 ?auto_83071 ) ( not ( = ?auto_83070 ?auto_83071 ) ) ( not ( = ?auto_83070 ?auto_83072 ) ) ( not ( = ?auto_83070 ?auto_83075 ) ) ( not ( = ?auto_83071 ?auto_83072 ) ) ( not ( = ?auto_83071 ?auto_83075 ) ) ( not ( = ?auto_83072 ?auto_83075 ) ) ( not ( = ?auto_83070 ?auto_83074 ) ) ( not ( = ?auto_83070 ?auto_83077 ) ) ( not ( = ?auto_83071 ?auto_83074 ) ) ( not ( = ?auto_83071 ?auto_83077 ) ) ( not ( = ?auto_83072 ?auto_83074 ) ) ( not ( = ?auto_83072 ?auto_83077 ) ) ( not ( = ?auto_83075 ?auto_83074 ) ) ( not ( = ?auto_83075 ?auto_83077 ) ) ( not ( = ?auto_83074 ?auto_83077 ) ) ( ON ?auto_83074 ?auto_83075 ) ( not ( = ?auto_83073 ?auto_83077 ) ) ( not ( = ?auto_83070 ?auto_83073 ) ) ( not ( = ?auto_83071 ?auto_83073 ) ) ( not ( = ?auto_83072 ?auto_83073 ) ) ( not ( = ?auto_83075 ?auto_83073 ) ) ( not ( = ?auto_83074 ?auto_83073 ) ) ( ON ?auto_83073 ?auto_83076 ) ( CLEAR ?auto_83073 ) ( not ( = ?auto_83070 ?auto_83076 ) ) ( not ( = ?auto_83071 ?auto_83076 ) ) ( not ( = ?auto_83072 ?auto_83076 ) ) ( not ( = ?auto_83075 ?auto_83076 ) ) ( not ( = ?auto_83074 ?auto_83076 ) ) ( not ( = ?auto_83077 ?auto_83076 ) ) ( not ( = ?auto_83073 ?auto_83076 ) ) ( HOLDING ?auto_83077 ) ( CLEAR ?auto_83074 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83070 ?auto_83071 ?auto_83072 ?auto_83075 ?auto_83074 ?auto_83077 )
      ( MAKE-3PILE ?auto_83070 ?auto_83071 ?auto_83072 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83132 - BLOCK
      ?auto_83133 - BLOCK
      ?auto_83134 - BLOCK
      ?auto_83135 - BLOCK
    )
    :vars
    (
      ?auto_83136 - BLOCK
      ?auto_83137 - BLOCK
      ?auto_83138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83132 ) ( ON ?auto_83133 ?auto_83132 ) ( not ( = ?auto_83132 ?auto_83133 ) ) ( not ( = ?auto_83132 ?auto_83134 ) ) ( not ( = ?auto_83132 ?auto_83135 ) ) ( not ( = ?auto_83133 ?auto_83134 ) ) ( not ( = ?auto_83133 ?auto_83135 ) ) ( not ( = ?auto_83134 ?auto_83135 ) ) ( ON ?auto_83135 ?auto_83136 ) ( not ( = ?auto_83132 ?auto_83136 ) ) ( not ( = ?auto_83133 ?auto_83136 ) ) ( not ( = ?auto_83134 ?auto_83136 ) ) ( not ( = ?auto_83135 ?auto_83136 ) ) ( CLEAR ?auto_83133 ) ( ON ?auto_83134 ?auto_83135 ) ( CLEAR ?auto_83134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83137 ) ( ON ?auto_83138 ?auto_83137 ) ( ON ?auto_83136 ?auto_83138 ) ( not ( = ?auto_83137 ?auto_83138 ) ) ( not ( = ?auto_83137 ?auto_83136 ) ) ( not ( = ?auto_83137 ?auto_83135 ) ) ( not ( = ?auto_83137 ?auto_83134 ) ) ( not ( = ?auto_83138 ?auto_83136 ) ) ( not ( = ?auto_83138 ?auto_83135 ) ) ( not ( = ?auto_83138 ?auto_83134 ) ) ( not ( = ?auto_83132 ?auto_83137 ) ) ( not ( = ?auto_83132 ?auto_83138 ) ) ( not ( = ?auto_83133 ?auto_83137 ) ) ( not ( = ?auto_83133 ?auto_83138 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83137 ?auto_83138 ?auto_83136 ?auto_83135 )
      ( MAKE-4PILE ?auto_83132 ?auto_83133 ?auto_83134 ?auto_83135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83139 - BLOCK
      ?auto_83140 - BLOCK
      ?auto_83141 - BLOCK
      ?auto_83142 - BLOCK
    )
    :vars
    (
      ?auto_83145 - BLOCK
      ?auto_83143 - BLOCK
      ?auto_83144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83139 ) ( not ( = ?auto_83139 ?auto_83140 ) ) ( not ( = ?auto_83139 ?auto_83141 ) ) ( not ( = ?auto_83139 ?auto_83142 ) ) ( not ( = ?auto_83140 ?auto_83141 ) ) ( not ( = ?auto_83140 ?auto_83142 ) ) ( not ( = ?auto_83141 ?auto_83142 ) ) ( ON ?auto_83142 ?auto_83145 ) ( not ( = ?auto_83139 ?auto_83145 ) ) ( not ( = ?auto_83140 ?auto_83145 ) ) ( not ( = ?auto_83141 ?auto_83145 ) ) ( not ( = ?auto_83142 ?auto_83145 ) ) ( ON ?auto_83141 ?auto_83142 ) ( CLEAR ?auto_83141 ) ( ON-TABLE ?auto_83143 ) ( ON ?auto_83144 ?auto_83143 ) ( ON ?auto_83145 ?auto_83144 ) ( not ( = ?auto_83143 ?auto_83144 ) ) ( not ( = ?auto_83143 ?auto_83145 ) ) ( not ( = ?auto_83143 ?auto_83142 ) ) ( not ( = ?auto_83143 ?auto_83141 ) ) ( not ( = ?auto_83144 ?auto_83145 ) ) ( not ( = ?auto_83144 ?auto_83142 ) ) ( not ( = ?auto_83144 ?auto_83141 ) ) ( not ( = ?auto_83139 ?auto_83143 ) ) ( not ( = ?auto_83139 ?auto_83144 ) ) ( not ( = ?auto_83140 ?auto_83143 ) ) ( not ( = ?auto_83140 ?auto_83144 ) ) ( HOLDING ?auto_83140 ) ( CLEAR ?auto_83139 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83139 ?auto_83140 )
      ( MAKE-4PILE ?auto_83139 ?auto_83140 ?auto_83141 ?auto_83142 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83146 - BLOCK
      ?auto_83147 - BLOCK
      ?auto_83148 - BLOCK
      ?auto_83149 - BLOCK
    )
    :vars
    (
      ?auto_83152 - BLOCK
      ?auto_83150 - BLOCK
      ?auto_83151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83146 ) ( not ( = ?auto_83146 ?auto_83147 ) ) ( not ( = ?auto_83146 ?auto_83148 ) ) ( not ( = ?auto_83146 ?auto_83149 ) ) ( not ( = ?auto_83147 ?auto_83148 ) ) ( not ( = ?auto_83147 ?auto_83149 ) ) ( not ( = ?auto_83148 ?auto_83149 ) ) ( ON ?auto_83149 ?auto_83152 ) ( not ( = ?auto_83146 ?auto_83152 ) ) ( not ( = ?auto_83147 ?auto_83152 ) ) ( not ( = ?auto_83148 ?auto_83152 ) ) ( not ( = ?auto_83149 ?auto_83152 ) ) ( ON ?auto_83148 ?auto_83149 ) ( ON-TABLE ?auto_83150 ) ( ON ?auto_83151 ?auto_83150 ) ( ON ?auto_83152 ?auto_83151 ) ( not ( = ?auto_83150 ?auto_83151 ) ) ( not ( = ?auto_83150 ?auto_83152 ) ) ( not ( = ?auto_83150 ?auto_83149 ) ) ( not ( = ?auto_83150 ?auto_83148 ) ) ( not ( = ?auto_83151 ?auto_83152 ) ) ( not ( = ?auto_83151 ?auto_83149 ) ) ( not ( = ?auto_83151 ?auto_83148 ) ) ( not ( = ?auto_83146 ?auto_83150 ) ) ( not ( = ?auto_83146 ?auto_83151 ) ) ( not ( = ?auto_83147 ?auto_83150 ) ) ( not ( = ?auto_83147 ?auto_83151 ) ) ( CLEAR ?auto_83146 ) ( ON ?auto_83147 ?auto_83148 ) ( CLEAR ?auto_83147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83150 ?auto_83151 ?auto_83152 ?auto_83149 ?auto_83148 )
      ( MAKE-4PILE ?auto_83146 ?auto_83147 ?auto_83148 ?auto_83149 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83153 - BLOCK
      ?auto_83154 - BLOCK
      ?auto_83155 - BLOCK
      ?auto_83156 - BLOCK
    )
    :vars
    (
      ?auto_83158 - BLOCK
      ?auto_83157 - BLOCK
      ?auto_83159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83153 ?auto_83154 ) ) ( not ( = ?auto_83153 ?auto_83155 ) ) ( not ( = ?auto_83153 ?auto_83156 ) ) ( not ( = ?auto_83154 ?auto_83155 ) ) ( not ( = ?auto_83154 ?auto_83156 ) ) ( not ( = ?auto_83155 ?auto_83156 ) ) ( ON ?auto_83156 ?auto_83158 ) ( not ( = ?auto_83153 ?auto_83158 ) ) ( not ( = ?auto_83154 ?auto_83158 ) ) ( not ( = ?auto_83155 ?auto_83158 ) ) ( not ( = ?auto_83156 ?auto_83158 ) ) ( ON ?auto_83155 ?auto_83156 ) ( ON-TABLE ?auto_83157 ) ( ON ?auto_83159 ?auto_83157 ) ( ON ?auto_83158 ?auto_83159 ) ( not ( = ?auto_83157 ?auto_83159 ) ) ( not ( = ?auto_83157 ?auto_83158 ) ) ( not ( = ?auto_83157 ?auto_83156 ) ) ( not ( = ?auto_83157 ?auto_83155 ) ) ( not ( = ?auto_83159 ?auto_83158 ) ) ( not ( = ?auto_83159 ?auto_83156 ) ) ( not ( = ?auto_83159 ?auto_83155 ) ) ( not ( = ?auto_83153 ?auto_83157 ) ) ( not ( = ?auto_83153 ?auto_83159 ) ) ( not ( = ?auto_83154 ?auto_83157 ) ) ( not ( = ?auto_83154 ?auto_83159 ) ) ( ON ?auto_83154 ?auto_83155 ) ( CLEAR ?auto_83154 ) ( HOLDING ?auto_83153 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83153 )
      ( MAKE-4PILE ?auto_83153 ?auto_83154 ?auto_83155 ?auto_83156 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83160 - BLOCK
      ?auto_83161 - BLOCK
      ?auto_83162 - BLOCK
      ?auto_83163 - BLOCK
    )
    :vars
    (
      ?auto_83165 - BLOCK
      ?auto_83164 - BLOCK
      ?auto_83166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83160 ?auto_83161 ) ) ( not ( = ?auto_83160 ?auto_83162 ) ) ( not ( = ?auto_83160 ?auto_83163 ) ) ( not ( = ?auto_83161 ?auto_83162 ) ) ( not ( = ?auto_83161 ?auto_83163 ) ) ( not ( = ?auto_83162 ?auto_83163 ) ) ( ON ?auto_83163 ?auto_83165 ) ( not ( = ?auto_83160 ?auto_83165 ) ) ( not ( = ?auto_83161 ?auto_83165 ) ) ( not ( = ?auto_83162 ?auto_83165 ) ) ( not ( = ?auto_83163 ?auto_83165 ) ) ( ON ?auto_83162 ?auto_83163 ) ( ON-TABLE ?auto_83164 ) ( ON ?auto_83166 ?auto_83164 ) ( ON ?auto_83165 ?auto_83166 ) ( not ( = ?auto_83164 ?auto_83166 ) ) ( not ( = ?auto_83164 ?auto_83165 ) ) ( not ( = ?auto_83164 ?auto_83163 ) ) ( not ( = ?auto_83164 ?auto_83162 ) ) ( not ( = ?auto_83166 ?auto_83165 ) ) ( not ( = ?auto_83166 ?auto_83163 ) ) ( not ( = ?auto_83166 ?auto_83162 ) ) ( not ( = ?auto_83160 ?auto_83164 ) ) ( not ( = ?auto_83160 ?auto_83166 ) ) ( not ( = ?auto_83161 ?auto_83164 ) ) ( not ( = ?auto_83161 ?auto_83166 ) ) ( ON ?auto_83161 ?auto_83162 ) ( ON ?auto_83160 ?auto_83161 ) ( CLEAR ?auto_83160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83164 ?auto_83166 ?auto_83165 ?auto_83163 ?auto_83162 ?auto_83161 )
      ( MAKE-4PILE ?auto_83160 ?auto_83161 ?auto_83162 ?auto_83163 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83171 - BLOCK
      ?auto_83172 - BLOCK
      ?auto_83173 - BLOCK
      ?auto_83174 - BLOCK
    )
    :vars
    (
      ?auto_83177 - BLOCK
      ?auto_83176 - BLOCK
      ?auto_83175 - BLOCK
      ?auto_83178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83171 ?auto_83172 ) ) ( not ( = ?auto_83171 ?auto_83173 ) ) ( not ( = ?auto_83171 ?auto_83174 ) ) ( not ( = ?auto_83172 ?auto_83173 ) ) ( not ( = ?auto_83172 ?auto_83174 ) ) ( not ( = ?auto_83173 ?auto_83174 ) ) ( ON ?auto_83174 ?auto_83177 ) ( not ( = ?auto_83171 ?auto_83177 ) ) ( not ( = ?auto_83172 ?auto_83177 ) ) ( not ( = ?auto_83173 ?auto_83177 ) ) ( not ( = ?auto_83174 ?auto_83177 ) ) ( ON ?auto_83173 ?auto_83174 ) ( ON-TABLE ?auto_83176 ) ( ON ?auto_83175 ?auto_83176 ) ( ON ?auto_83177 ?auto_83175 ) ( not ( = ?auto_83176 ?auto_83175 ) ) ( not ( = ?auto_83176 ?auto_83177 ) ) ( not ( = ?auto_83176 ?auto_83174 ) ) ( not ( = ?auto_83176 ?auto_83173 ) ) ( not ( = ?auto_83175 ?auto_83177 ) ) ( not ( = ?auto_83175 ?auto_83174 ) ) ( not ( = ?auto_83175 ?auto_83173 ) ) ( not ( = ?auto_83171 ?auto_83176 ) ) ( not ( = ?auto_83171 ?auto_83175 ) ) ( not ( = ?auto_83172 ?auto_83176 ) ) ( not ( = ?auto_83172 ?auto_83175 ) ) ( ON ?auto_83172 ?auto_83173 ) ( CLEAR ?auto_83172 ) ( ON ?auto_83171 ?auto_83178 ) ( CLEAR ?auto_83171 ) ( HAND-EMPTY ) ( not ( = ?auto_83171 ?auto_83178 ) ) ( not ( = ?auto_83172 ?auto_83178 ) ) ( not ( = ?auto_83173 ?auto_83178 ) ) ( not ( = ?auto_83174 ?auto_83178 ) ) ( not ( = ?auto_83177 ?auto_83178 ) ) ( not ( = ?auto_83176 ?auto_83178 ) ) ( not ( = ?auto_83175 ?auto_83178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83171 ?auto_83178 )
      ( MAKE-4PILE ?auto_83171 ?auto_83172 ?auto_83173 ?auto_83174 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83179 - BLOCK
      ?auto_83180 - BLOCK
      ?auto_83181 - BLOCK
      ?auto_83182 - BLOCK
    )
    :vars
    (
      ?auto_83184 - BLOCK
      ?auto_83185 - BLOCK
      ?auto_83183 - BLOCK
      ?auto_83186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83179 ?auto_83180 ) ) ( not ( = ?auto_83179 ?auto_83181 ) ) ( not ( = ?auto_83179 ?auto_83182 ) ) ( not ( = ?auto_83180 ?auto_83181 ) ) ( not ( = ?auto_83180 ?auto_83182 ) ) ( not ( = ?auto_83181 ?auto_83182 ) ) ( ON ?auto_83182 ?auto_83184 ) ( not ( = ?auto_83179 ?auto_83184 ) ) ( not ( = ?auto_83180 ?auto_83184 ) ) ( not ( = ?auto_83181 ?auto_83184 ) ) ( not ( = ?auto_83182 ?auto_83184 ) ) ( ON ?auto_83181 ?auto_83182 ) ( ON-TABLE ?auto_83185 ) ( ON ?auto_83183 ?auto_83185 ) ( ON ?auto_83184 ?auto_83183 ) ( not ( = ?auto_83185 ?auto_83183 ) ) ( not ( = ?auto_83185 ?auto_83184 ) ) ( not ( = ?auto_83185 ?auto_83182 ) ) ( not ( = ?auto_83185 ?auto_83181 ) ) ( not ( = ?auto_83183 ?auto_83184 ) ) ( not ( = ?auto_83183 ?auto_83182 ) ) ( not ( = ?auto_83183 ?auto_83181 ) ) ( not ( = ?auto_83179 ?auto_83185 ) ) ( not ( = ?auto_83179 ?auto_83183 ) ) ( not ( = ?auto_83180 ?auto_83185 ) ) ( not ( = ?auto_83180 ?auto_83183 ) ) ( ON ?auto_83179 ?auto_83186 ) ( CLEAR ?auto_83179 ) ( not ( = ?auto_83179 ?auto_83186 ) ) ( not ( = ?auto_83180 ?auto_83186 ) ) ( not ( = ?auto_83181 ?auto_83186 ) ) ( not ( = ?auto_83182 ?auto_83186 ) ) ( not ( = ?auto_83184 ?auto_83186 ) ) ( not ( = ?auto_83185 ?auto_83186 ) ) ( not ( = ?auto_83183 ?auto_83186 ) ) ( HOLDING ?auto_83180 ) ( CLEAR ?auto_83181 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83185 ?auto_83183 ?auto_83184 ?auto_83182 ?auto_83181 ?auto_83180 )
      ( MAKE-4PILE ?auto_83179 ?auto_83180 ?auto_83181 ?auto_83182 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83187 - BLOCK
      ?auto_83188 - BLOCK
      ?auto_83189 - BLOCK
      ?auto_83190 - BLOCK
    )
    :vars
    (
      ?auto_83193 - BLOCK
      ?auto_83194 - BLOCK
      ?auto_83191 - BLOCK
      ?auto_83192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83187 ?auto_83188 ) ) ( not ( = ?auto_83187 ?auto_83189 ) ) ( not ( = ?auto_83187 ?auto_83190 ) ) ( not ( = ?auto_83188 ?auto_83189 ) ) ( not ( = ?auto_83188 ?auto_83190 ) ) ( not ( = ?auto_83189 ?auto_83190 ) ) ( ON ?auto_83190 ?auto_83193 ) ( not ( = ?auto_83187 ?auto_83193 ) ) ( not ( = ?auto_83188 ?auto_83193 ) ) ( not ( = ?auto_83189 ?auto_83193 ) ) ( not ( = ?auto_83190 ?auto_83193 ) ) ( ON ?auto_83189 ?auto_83190 ) ( ON-TABLE ?auto_83194 ) ( ON ?auto_83191 ?auto_83194 ) ( ON ?auto_83193 ?auto_83191 ) ( not ( = ?auto_83194 ?auto_83191 ) ) ( not ( = ?auto_83194 ?auto_83193 ) ) ( not ( = ?auto_83194 ?auto_83190 ) ) ( not ( = ?auto_83194 ?auto_83189 ) ) ( not ( = ?auto_83191 ?auto_83193 ) ) ( not ( = ?auto_83191 ?auto_83190 ) ) ( not ( = ?auto_83191 ?auto_83189 ) ) ( not ( = ?auto_83187 ?auto_83194 ) ) ( not ( = ?auto_83187 ?auto_83191 ) ) ( not ( = ?auto_83188 ?auto_83194 ) ) ( not ( = ?auto_83188 ?auto_83191 ) ) ( ON ?auto_83187 ?auto_83192 ) ( not ( = ?auto_83187 ?auto_83192 ) ) ( not ( = ?auto_83188 ?auto_83192 ) ) ( not ( = ?auto_83189 ?auto_83192 ) ) ( not ( = ?auto_83190 ?auto_83192 ) ) ( not ( = ?auto_83193 ?auto_83192 ) ) ( not ( = ?auto_83194 ?auto_83192 ) ) ( not ( = ?auto_83191 ?auto_83192 ) ) ( CLEAR ?auto_83189 ) ( ON ?auto_83188 ?auto_83187 ) ( CLEAR ?auto_83188 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83192 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83192 ?auto_83187 )
      ( MAKE-4PILE ?auto_83187 ?auto_83188 ?auto_83189 ?auto_83190 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83195 - BLOCK
      ?auto_83196 - BLOCK
      ?auto_83197 - BLOCK
      ?auto_83198 - BLOCK
    )
    :vars
    (
      ?auto_83200 - BLOCK
      ?auto_83199 - BLOCK
      ?auto_83201 - BLOCK
      ?auto_83202 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83195 ?auto_83196 ) ) ( not ( = ?auto_83195 ?auto_83197 ) ) ( not ( = ?auto_83195 ?auto_83198 ) ) ( not ( = ?auto_83196 ?auto_83197 ) ) ( not ( = ?auto_83196 ?auto_83198 ) ) ( not ( = ?auto_83197 ?auto_83198 ) ) ( ON ?auto_83198 ?auto_83200 ) ( not ( = ?auto_83195 ?auto_83200 ) ) ( not ( = ?auto_83196 ?auto_83200 ) ) ( not ( = ?auto_83197 ?auto_83200 ) ) ( not ( = ?auto_83198 ?auto_83200 ) ) ( ON-TABLE ?auto_83199 ) ( ON ?auto_83201 ?auto_83199 ) ( ON ?auto_83200 ?auto_83201 ) ( not ( = ?auto_83199 ?auto_83201 ) ) ( not ( = ?auto_83199 ?auto_83200 ) ) ( not ( = ?auto_83199 ?auto_83198 ) ) ( not ( = ?auto_83199 ?auto_83197 ) ) ( not ( = ?auto_83201 ?auto_83200 ) ) ( not ( = ?auto_83201 ?auto_83198 ) ) ( not ( = ?auto_83201 ?auto_83197 ) ) ( not ( = ?auto_83195 ?auto_83199 ) ) ( not ( = ?auto_83195 ?auto_83201 ) ) ( not ( = ?auto_83196 ?auto_83199 ) ) ( not ( = ?auto_83196 ?auto_83201 ) ) ( ON ?auto_83195 ?auto_83202 ) ( not ( = ?auto_83195 ?auto_83202 ) ) ( not ( = ?auto_83196 ?auto_83202 ) ) ( not ( = ?auto_83197 ?auto_83202 ) ) ( not ( = ?auto_83198 ?auto_83202 ) ) ( not ( = ?auto_83200 ?auto_83202 ) ) ( not ( = ?auto_83199 ?auto_83202 ) ) ( not ( = ?auto_83201 ?auto_83202 ) ) ( ON ?auto_83196 ?auto_83195 ) ( CLEAR ?auto_83196 ) ( ON-TABLE ?auto_83202 ) ( HOLDING ?auto_83197 ) ( CLEAR ?auto_83198 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83199 ?auto_83201 ?auto_83200 ?auto_83198 ?auto_83197 )
      ( MAKE-4PILE ?auto_83195 ?auto_83196 ?auto_83197 ?auto_83198 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83203 - BLOCK
      ?auto_83204 - BLOCK
      ?auto_83205 - BLOCK
      ?auto_83206 - BLOCK
    )
    :vars
    (
      ?auto_83209 - BLOCK
      ?auto_83210 - BLOCK
      ?auto_83208 - BLOCK
      ?auto_83207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83203 ?auto_83204 ) ) ( not ( = ?auto_83203 ?auto_83205 ) ) ( not ( = ?auto_83203 ?auto_83206 ) ) ( not ( = ?auto_83204 ?auto_83205 ) ) ( not ( = ?auto_83204 ?auto_83206 ) ) ( not ( = ?auto_83205 ?auto_83206 ) ) ( ON ?auto_83206 ?auto_83209 ) ( not ( = ?auto_83203 ?auto_83209 ) ) ( not ( = ?auto_83204 ?auto_83209 ) ) ( not ( = ?auto_83205 ?auto_83209 ) ) ( not ( = ?auto_83206 ?auto_83209 ) ) ( ON-TABLE ?auto_83210 ) ( ON ?auto_83208 ?auto_83210 ) ( ON ?auto_83209 ?auto_83208 ) ( not ( = ?auto_83210 ?auto_83208 ) ) ( not ( = ?auto_83210 ?auto_83209 ) ) ( not ( = ?auto_83210 ?auto_83206 ) ) ( not ( = ?auto_83210 ?auto_83205 ) ) ( not ( = ?auto_83208 ?auto_83209 ) ) ( not ( = ?auto_83208 ?auto_83206 ) ) ( not ( = ?auto_83208 ?auto_83205 ) ) ( not ( = ?auto_83203 ?auto_83210 ) ) ( not ( = ?auto_83203 ?auto_83208 ) ) ( not ( = ?auto_83204 ?auto_83210 ) ) ( not ( = ?auto_83204 ?auto_83208 ) ) ( ON ?auto_83203 ?auto_83207 ) ( not ( = ?auto_83203 ?auto_83207 ) ) ( not ( = ?auto_83204 ?auto_83207 ) ) ( not ( = ?auto_83205 ?auto_83207 ) ) ( not ( = ?auto_83206 ?auto_83207 ) ) ( not ( = ?auto_83209 ?auto_83207 ) ) ( not ( = ?auto_83210 ?auto_83207 ) ) ( not ( = ?auto_83208 ?auto_83207 ) ) ( ON ?auto_83204 ?auto_83203 ) ( ON-TABLE ?auto_83207 ) ( CLEAR ?auto_83206 ) ( ON ?auto_83205 ?auto_83204 ) ( CLEAR ?auto_83205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83207 ?auto_83203 ?auto_83204 )
      ( MAKE-4PILE ?auto_83203 ?auto_83204 ?auto_83205 ?auto_83206 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83211 - BLOCK
      ?auto_83212 - BLOCK
      ?auto_83213 - BLOCK
      ?auto_83214 - BLOCK
    )
    :vars
    (
      ?auto_83217 - BLOCK
      ?auto_83215 - BLOCK
      ?auto_83216 - BLOCK
      ?auto_83218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83211 ?auto_83212 ) ) ( not ( = ?auto_83211 ?auto_83213 ) ) ( not ( = ?auto_83211 ?auto_83214 ) ) ( not ( = ?auto_83212 ?auto_83213 ) ) ( not ( = ?auto_83212 ?auto_83214 ) ) ( not ( = ?auto_83213 ?auto_83214 ) ) ( not ( = ?auto_83211 ?auto_83217 ) ) ( not ( = ?auto_83212 ?auto_83217 ) ) ( not ( = ?auto_83213 ?auto_83217 ) ) ( not ( = ?auto_83214 ?auto_83217 ) ) ( ON-TABLE ?auto_83215 ) ( ON ?auto_83216 ?auto_83215 ) ( ON ?auto_83217 ?auto_83216 ) ( not ( = ?auto_83215 ?auto_83216 ) ) ( not ( = ?auto_83215 ?auto_83217 ) ) ( not ( = ?auto_83215 ?auto_83214 ) ) ( not ( = ?auto_83215 ?auto_83213 ) ) ( not ( = ?auto_83216 ?auto_83217 ) ) ( not ( = ?auto_83216 ?auto_83214 ) ) ( not ( = ?auto_83216 ?auto_83213 ) ) ( not ( = ?auto_83211 ?auto_83215 ) ) ( not ( = ?auto_83211 ?auto_83216 ) ) ( not ( = ?auto_83212 ?auto_83215 ) ) ( not ( = ?auto_83212 ?auto_83216 ) ) ( ON ?auto_83211 ?auto_83218 ) ( not ( = ?auto_83211 ?auto_83218 ) ) ( not ( = ?auto_83212 ?auto_83218 ) ) ( not ( = ?auto_83213 ?auto_83218 ) ) ( not ( = ?auto_83214 ?auto_83218 ) ) ( not ( = ?auto_83217 ?auto_83218 ) ) ( not ( = ?auto_83215 ?auto_83218 ) ) ( not ( = ?auto_83216 ?auto_83218 ) ) ( ON ?auto_83212 ?auto_83211 ) ( ON-TABLE ?auto_83218 ) ( ON ?auto_83213 ?auto_83212 ) ( CLEAR ?auto_83213 ) ( HOLDING ?auto_83214 ) ( CLEAR ?auto_83217 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83215 ?auto_83216 ?auto_83217 ?auto_83214 )
      ( MAKE-4PILE ?auto_83211 ?auto_83212 ?auto_83213 ?auto_83214 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83219 - BLOCK
      ?auto_83220 - BLOCK
      ?auto_83221 - BLOCK
      ?auto_83222 - BLOCK
    )
    :vars
    (
      ?auto_83223 - BLOCK
      ?auto_83225 - BLOCK
      ?auto_83224 - BLOCK
      ?auto_83226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83219 ?auto_83220 ) ) ( not ( = ?auto_83219 ?auto_83221 ) ) ( not ( = ?auto_83219 ?auto_83222 ) ) ( not ( = ?auto_83220 ?auto_83221 ) ) ( not ( = ?auto_83220 ?auto_83222 ) ) ( not ( = ?auto_83221 ?auto_83222 ) ) ( not ( = ?auto_83219 ?auto_83223 ) ) ( not ( = ?auto_83220 ?auto_83223 ) ) ( not ( = ?auto_83221 ?auto_83223 ) ) ( not ( = ?auto_83222 ?auto_83223 ) ) ( ON-TABLE ?auto_83225 ) ( ON ?auto_83224 ?auto_83225 ) ( ON ?auto_83223 ?auto_83224 ) ( not ( = ?auto_83225 ?auto_83224 ) ) ( not ( = ?auto_83225 ?auto_83223 ) ) ( not ( = ?auto_83225 ?auto_83222 ) ) ( not ( = ?auto_83225 ?auto_83221 ) ) ( not ( = ?auto_83224 ?auto_83223 ) ) ( not ( = ?auto_83224 ?auto_83222 ) ) ( not ( = ?auto_83224 ?auto_83221 ) ) ( not ( = ?auto_83219 ?auto_83225 ) ) ( not ( = ?auto_83219 ?auto_83224 ) ) ( not ( = ?auto_83220 ?auto_83225 ) ) ( not ( = ?auto_83220 ?auto_83224 ) ) ( ON ?auto_83219 ?auto_83226 ) ( not ( = ?auto_83219 ?auto_83226 ) ) ( not ( = ?auto_83220 ?auto_83226 ) ) ( not ( = ?auto_83221 ?auto_83226 ) ) ( not ( = ?auto_83222 ?auto_83226 ) ) ( not ( = ?auto_83223 ?auto_83226 ) ) ( not ( = ?auto_83225 ?auto_83226 ) ) ( not ( = ?auto_83224 ?auto_83226 ) ) ( ON ?auto_83220 ?auto_83219 ) ( ON-TABLE ?auto_83226 ) ( ON ?auto_83221 ?auto_83220 ) ( CLEAR ?auto_83223 ) ( ON ?auto_83222 ?auto_83221 ) ( CLEAR ?auto_83222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83226 ?auto_83219 ?auto_83220 ?auto_83221 )
      ( MAKE-4PILE ?auto_83219 ?auto_83220 ?auto_83221 ?auto_83222 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83227 - BLOCK
      ?auto_83228 - BLOCK
      ?auto_83229 - BLOCK
      ?auto_83230 - BLOCK
    )
    :vars
    (
      ?auto_83232 - BLOCK
      ?auto_83234 - BLOCK
      ?auto_83231 - BLOCK
      ?auto_83233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83227 ?auto_83228 ) ) ( not ( = ?auto_83227 ?auto_83229 ) ) ( not ( = ?auto_83227 ?auto_83230 ) ) ( not ( = ?auto_83228 ?auto_83229 ) ) ( not ( = ?auto_83228 ?auto_83230 ) ) ( not ( = ?auto_83229 ?auto_83230 ) ) ( not ( = ?auto_83227 ?auto_83232 ) ) ( not ( = ?auto_83228 ?auto_83232 ) ) ( not ( = ?auto_83229 ?auto_83232 ) ) ( not ( = ?auto_83230 ?auto_83232 ) ) ( ON-TABLE ?auto_83234 ) ( ON ?auto_83231 ?auto_83234 ) ( not ( = ?auto_83234 ?auto_83231 ) ) ( not ( = ?auto_83234 ?auto_83232 ) ) ( not ( = ?auto_83234 ?auto_83230 ) ) ( not ( = ?auto_83234 ?auto_83229 ) ) ( not ( = ?auto_83231 ?auto_83232 ) ) ( not ( = ?auto_83231 ?auto_83230 ) ) ( not ( = ?auto_83231 ?auto_83229 ) ) ( not ( = ?auto_83227 ?auto_83234 ) ) ( not ( = ?auto_83227 ?auto_83231 ) ) ( not ( = ?auto_83228 ?auto_83234 ) ) ( not ( = ?auto_83228 ?auto_83231 ) ) ( ON ?auto_83227 ?auto_83233 ) ( not ( = ?auto_83227 ?auto_83233 ) ) ( not ( = ?auto_83228 ?auto_83233 ) ) ( not ( = ?auto_83229 ?auto_83233 ) ) ( not ( = ?auto_83230 ?auto_83233 ) ) ( not ( = ?auto_83232 ?auto_83233 ) ) ( not ( = ?auto_83234 ?auto_83233 ) ) ( not ( = ?auto_83231 ?auto_83233 ) ) ( ON ?auto_83228 ?auto_83227 ) ( ON-TABLE ?auto_83233 ) ( ON ?auto_83229 ?auto_83228 ) ( ON ?auto_83230 ?auto_83229 ) ( CLEAR ?auto_83230 ) ( HOLDING ?auto_83232 ) ( CLEAR ?auto_83231 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83234 ?auto_83231 ?auto_83232 )
      ( MAKE-4PILE ?auto_83227 ?auto_83228 ?auto_83229 ?auto_83230 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83235 - BLOCK
      ?auto_83236 - BLOCK
      ?auto_83237 - BLOCK
      ?auto_83238 - BLOCK
    )
    :vars
    (
      ?auto_83241 - BLOCK
      ?auto_83239 - BLOCK
      ?auto_83242 - BLOCK
      ?auto_83240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83235 ?auto_83236 ) ) ( not ( = ?auto_83235 ?auto_83237 ) ) ( not ( = ?auto_83235 ?auto_83238 ) ) ( not ( = ?auto_83236 ?auto_83237 ) ) ( not ( = ?auto_83236 ?auto_83238 ) ) ( not ( = ?auto_83237 ?auto_83238 ) ) ( not ( = ?auto_83235 ?auto_83241 ) ) ( not ( = ?auto_83236 ?auto_83241 ) ) ( not ( = ?auto_83237 ?auto_83241 ) ) ( not ( = ?auto_83238 ?auto_83241 ) ) ( ON-TABLE ?auto_83239 ) ( ON ?auto_83242 ?auto_83239 ) ( not ( = ?auto_83239 ?auto_83242 ) ) ( not ( = ?auto_83239 ?auto_83241 ) ) ( not ( = ?auto_83239 ?auto_83238 ) ) ( not ( = ?auto_83239 ?auto_83237 ) ) ( not ( = ?auto_83242 ?auto_83241 ) ) ( not ( = ?auto_83242 ?auto_83238 ) ) ( not ( = ?auto_83242 ?auto_83237 ) ) ( not ( = ?auto_83235 ?auto_83239 ) ) ( not ( = ?auto_83235 ?auto_83242 ) ) ( not ( = ?auto_83236 ?auto_83239 ) ) ( not ( = ?auto_83236 ?auto_83242 ) ) ( ON ?auto_83235 ?auto_83240 ) ( not ( = ?auto_83235 ?auto_83240 ) ) ( not ( = ?auto_83236 ?auto_83240 ) ) ( not ( = ?auto_83237 ?auto_83240 ) ) ( not ( = ?auto_83238 ?auto_83240 ) ) ( not ( = ?auto_83241 ?auto_83240 ) ) ( not ( = ?auto_83239 ?auto_83240 ) ) ( not ( = ?auto_83242 ?auto_83240 ) ) ( ON ?auto_83236 ?auto_83235 ) ( ON-TABLE ?auto_83240 ) ( ON ?auto_83237 ?auto_83236 ) ( ON ?auto_83238 ?auto_83237 ) ( CLEAR ?auto_83242 ) ( ON ?auto_83241 ?auto_83238 ) ( CLEAR ?auto_83241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83240 ?auto_83235 ?auto_83236 ?auto_83237 ?auto_83238 )
      ( MAKE-4PILE ?auto_83235 ?auto_83236 ?auto_83237 ?auto_83238 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83243 - BLOCK
      ?auto_83244 - BLOCK
      ?auto_83245 - BLOCK
      ?auto_83246 - BLOCK
    )
    :vars
    (
      ?auto_83248 - BLOCK
      ?auto_83250 - BLOCK
      ?auto_83247 - BLOCK
      ?auto_83249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83243 ?auto_83244 ) ) ( not ( = ?auto_83243 ?auto_83245 ) ) ( not ( = ?auto_83243 ?auto_83246 ) ) ( not ( = ?auto_83244 ?auto_83245 ) ) ( not ( = ?auto_83244 ?auto_83246 ) ) ( not ( = ?auto_83245 ?auto_83246 ) ) ( not ( = ?auto_83243 ?auto_83248 ) ) ( not ( = ?auto_83244 ?auto_83248 ) ) ( not ( = ?auto_83245 ?auto_83248 ) ) ( not ( = ?auto_83246 ?auto_83248 ) ) ( ON-TABLE ?auto_83250 ) ( not ( = ?auto_83250 ?auto_83247 ) ) ( not ( = ?auto_83250 ?auto_83248 ) ) ( not ( = ?auto_83250 ?auto_83246 ) ) ( not ( = ?auto_83250 ?auto_83245 ) ) ( not ( = ?auto_83247 ?auto_83248 ) ) ( not ( = ?auto_83247 ?auto_83246 ) ) ( not ( = ?auto_83247 ?auto_83245 ) ) ( not ( = ?auto_83243 ?auto_83250 ) ) ( not ( = ?auto_83243 ?auto_83247 ) ) ( not ( = ?auto_83244 ?auto_83250 ) ) ( not ( = ?auto_83244 ?auto_83247 ) ) ( ON ?auto_83243 ?auto_83249 ) ( not ( = ?auto_83243 ?auto_83249 ) ) ( not ( = ?auto_83244 ?auto_83249 ) ) ( not ( = ?auto_83245 ?auto_83249 ) ) ( not ( = ?auto_83246 ?auto_83249 ) ) ( not ( = ?auto_83248 ?auto_83249 ) ) ( not ( = ?auto_83250 ?auto_83249 ) ) ( not ( = ?auto_83247 ?auto_83249 ) ) ( ON ?auto_83244 ?auto_83243 ) ( ON-TABLE ?auto_83249 ) ( ON ?auto_83245 ?auto_83244 ) ( ON ?auto_83246 ?auto_83245 ) ( ON ?auto_83248 ?auto_83246 ) ( CLEAR ?auto_83248 ) ( HOLDING ?auto_83247 ) ( CLEAR ?auto_83250 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83250 ?auto_83247 )
      ( MAKE-4PILE ?auto_83243 ?auto_83244 ?auto_83245 ?auto_83246 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83251 - BLOCK
      ?auto_83252 - BLOCK
      ?auto_83253 - BLOCK
      ?auto_83254 - BLOCK
    )
    :vars
    (
      ?auto_83255 - BLOCK
      ?auto_83256 - BLOCK
      ?auto_83257 - BLOCK
      ?auto_83258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83251 ?auto_83252 ) ) ( not ( = ?auto_83251 ?auto_83253 ) ) ( not ( = ?auto_83251 ?auto_83254 ) ) ( not ( = ?auto_83252 ?auto_83253 ) ) ( not ( = ?auto_83252 ?auto_83254 ) ) ( not ( = ?auto_83253 ?auto_83254 ) ) ( not ( = ?auto_83251 ?auto_83255 ) ) ( not ( = ?auto_83252 ?auto_83255 ) ) ( not ( = ?auto_83253 ?auto_83255 ) ) ( not ( = ?auto_83254 ?auto_83255 ) ) ( ON-TABLE ?auto_83256 ) ( not ( = ?auto_83256 ?auto_83257 ) ) ( not ( = ?auto_83256 ?auto_83255 ) ) ( not ( = ?auto_83256 ?auto_83254 ) ) ( not ( = ?auto_83256 ?auto_83253 ) ) ( not ( = ?auto_83257 ?auto_83255 ) ) ( not ( = ?auto_83257 ?auto_83254 ) ) ( not ( = ?auto_83257 ?auto_83253 ) ) ( not ( = ?auto_83251 ?auto_83256 ) ) ( not ( = ?auto_83251 ?auto_83257 ) ) ( not ( = ?auto_83252 ?auto_83256 ) ) ( not ( = ?auto_83252 ?auto_83257 ) ) ( ON ?auto_83251 ?auto_83258 ) ( not ( = ?auto_83251 ?auto_83258 ) ) ( not ( = ?auto_83252 ?auto_83258 ) ) ( not ( = ?auto_83253 ?auto_83258 ) ) ( not ( = ?auto_83254 ?auto_83258 ) ) ( not ( = ?auto_83255 ?auto_83258 ) ) ( not ( = ?auto_83256 ?auto_83258 ) ) ( not ( = ?auto_83257 ?auto_83258 ) ) ( ON ?auto_83252 ?auto_83251 ) ( ON-TABLE ?auto_83258 ) ( ON ?auto_83253 ?auto_83252 ) ( ON ?auto_83254 ?auto_83253 ) ( ON ?auto_83255 ?auto_83254 ) ( CLEAR ?auto_83256 ) ( ON ?auto_83257 ?auto_83255 ) ( CLEAR ?auto_83257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83258 ?auto_83251 ?auto_83252 ?auto_83253 ?auto_83254 ?auto_83255 )
      ( MAKE-4PILE ?auto_83251 ?auto_83252 ?auto_83253 ?auto_83254 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83259 - BLOCK
      ?auto_83260 - BLOCK
      ?auto_83261 - BLOCK
      ?auto_83262 - BLOCK
    )
    :vars
    (
      ?auto_83266 - BLOCK
      ?auto_83265 - BLOCK
      ?auto_83264 - BLOCK
      ?auto_83263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83259 ?auto_83260 ) ) ( not ( = ?auto_83259 ?auto_83261 ) ) ( not ( = ?auto_83259 ?auto_83262 ) ) ( not ( = ?auto_83260 ?auto_83261 ) ) ( not ( = ?auto_83260 ?auto_83262 ) ) ( not ( = ?auto_83261 ?auto_83262 ) ) ( not ( = ?auto_83259 ?auto_83266 ) ) ( not ( = ?auto_83260 ?auto_83266 ) ) ( not ( = ?auto_83261 ?auto_83266 ) ) ( not ( = ?auto_83262 ?auto_83266 ) ) ( not ( = ?auto_83265 ?auto_83264 ) ) ( not ( = ?auto_83265 ?auto_83266 ) ) ( not ( = ?auto_83265 ?auto_83262 ) ) ( not ( = ?auto_83265 ?auto_83261 ) ) ( not ( = ?auto_83264 ?auto_83266 ) ) ( not ( = ?auto_83264 ?auto_83262 ) ) ( not ( = ?auto_83264 ?auto_83261 ) ) ( not ( = ?auto_83259 ?auto_83265 ) ) ( not ( = ?auto_83259 ?auto_83264 ) ) ( not ( = ?auto_83260 ?auto_83265 ) ) ( not ( = ?auto_83260 ?auto_83264 ) ) ( ON ?auto_83259 ?auto_83263 ) ( not ( = ?auto_83259 ?auto_83263 ) ) ( not ( = ?auto_83260 ?auto_83263 ) ) ( not ( = ?auto_83261 ?auto_83263 ) ) ( not ( = ?auto_83262 ?auto_83263 ) ) ( not ( = ?auto_83266 ?auto_83263 ) ) ( not ( = ?auto_83265 ?auto_83263 ) ) ( not ( = ?auto_83264 ?auto_83263 ) ) ( ON ?auto_83260 ?auto_83259 ) ( ON-TABLE ?auto_83263 ) ( ON ?auto_83261 ?auto_83260 ) ( ON ?auto_83262 ?auto_83261 ) ( ON ?auto_83266 ?auto_83262 ) ( ON ?auto_83264 ?auto_83266 ) ( CLEAR ?auto_83264 ) ( HOLDING ?auto_83265 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83265 )
      ( MAKE-4PILE ?auto_83259 ?auto_83260 ?auto_83261 ?auto_83262 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83267 - BLOCK
      ?auto_83268 - BLOCK
      ?auto_83269 - BLOCK
      ?auto_83270 - BLOCK
    )
    :vars
    (
      ?auto_83274 - BLOCK
      ?auto_83273 - BLOCK
      ?auto_83272 - BLOCK
      ?auto_83271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83267 ?auto_83268 ) ) ( not ( = ?auto_83267 ?auto_83269 ) ) ( not ( = ?auto_83267 ?auto_83270 ) ) ( not ( = ?auto_83268 ?auto_83269 ) ) ( not ( = ?auto_83268 ?auto_83270 ) ) ( not ( = ?auto_83269 ?auto_83270 ) ) ( not ( = ?auto_83267 ?auto_83274 ) ) ( not ( = ?auto_83268 ?auto_83274 ) ) ( not ( = ?auto_83269 ?auto_83274 ) ) ( not ( = ?auto_83270 ?auto_83274 ) ) ( not ( = ?auto_83273 ?auto_83272 ) ) ( not ( = ?auto_83273 ?auto_83274 ) ) ( not ( = ?auto_83273 ?auto_83270 ) ) ( not ( = ?auto_83273 ?auto_83269 ) ) ( not ( = ?auto_83272 ?auto_83274 ) ) ( not ( = ?auto_83272 ?auto_83270 ) ) ( not ( = ?auto_83272 ?auto_83269 ) ) ( not ( = ?auto_83267 ?auto_83273 ) ) ( not ( = ?auto_83267 ?auto_83272 ) ) ( not ( = ?auto_83268 ?auto_83273 ) ) ( not ( = ?auto_83268 ?auto_83272 ) ) ( ON ?auto_83267 ?auto_83271 ) ( not ( = ?auto_83267 ?auto_83271 ) ) ( not ( = ?auto_83268 ?auto_83271 ) ) ( not ( = ?auto_83269 ?auto_83271 ) ) ( not ( = ?auto_83270 ?auto_83271 ) ) ( not ( = ?auto_83274 ?auto_83271 ) ) ( not ( = ?auto_83273 ?auto_83271 ) ) ( not ( = ?auto_83272 ?auto_83271 ) ) ( ON ?auto_83268 ?auto_83267 ) ( ON-TABLE ?auto_83271 ) ( ON ?auto_83269 ?auto_83268 ) ( ON ?auto_83270 ?auto_83269 ) ( ON ?auto_83274 ?auto_83270 ) ( ON ?auto_83272 ?auto_83274 ) ( ON ?auto_83273 ?auto_83272 ) ( CLEAR ?auto_83273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83271 ?auto_83267 ?auto_83268 ?auto_83269 ?auto_83270 ?auto_83274 ?auto_83272 )
      ( MAKE-4PILE ?auto_83267 ?auto_83268 ?auto_83269 ?auto_83270 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83290 - BLOCK
      ?auto_83291 - BLOCK
    )
    :vars
    (
      ?auto_83292 - BLOCK
      ?auto_83294 - BLOCK
      ?auto_83293 - BLOCK
      ?auto_83296 - BLOCK
      ?auto_83295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83292 ?auto_83291 ) ( ON-TABLE ?auto_83290 ) ( ON ?auto_83291 ?auto_83290 ) ( not ( = ?auto_83290 ?auto_83291 ) ) ( not ( = ?auto_83290 ?auto_83292 ) ) ( not ( = ?auto_83291 ?auto_83292 ) ) ( not ( = ?auto_83290 ?auto_83294 ) ) ( not ( = ?auto_83290 ?auto_83293 ) ) ( not ( = ?auto_83291 ?auto_83294 ) ) ( not ( = ?auto_83291 ?auto_83293 ) ) ( not ( = ?auto_83292 ?auto_83294 ) ) ( not ( = ?auto_83292 ?auto_83293 ) ) ( not ( = ?auto_83294 ?auto_83293 ) ) ( ON ?auto_83294 ?auto_83292 ) ( CLEAR ?auto_83294 ) ( HOLDING ?auto_83293 ) ( CLEAR ?auto_83296 ) ( ON-TABLE ?auto_83295 ) ( ON ?auto_83296 ?auto_83295 ) ( not ( = ?auto_83295 ?auto_83296 ) ) ( not ( = ?auto_83295 ?auto_83293 ) ) ( not ( = ?auto_83296 ?auto_83293 ) ) ( not ( = ?auto_83290 ?auto_83296 ) ) ( not ( = ?auto_83290 ?auto_83295 ) ) ( not ( = ?auto_83291 ?auto_83296 ) ) ( not ( = ?auto_83291 ?auto_83295 ) ) ( not ( = ?auto_83292 ?auto_83296 ) ) ( not ( = ?auto_83292 ?auto_83295 ) ) ( not ( = ?auto_83294 ?auto_83296 ) ) ( not ( = ?auto_83294 ?auto_83295 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83295 ?auto_83296 ?auto_83293 )
      ( MAKE-2PILE ?auto_83290 ?auto_83291 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83297 - BLOCK
      ?auto_83298 - BLOCK
    )
    :vars
    (
      ?auto_83301 - BLOCK
      ?auto_83300 - BLOCK
      ?auto_83302 - BLOCK
      ?auto_83299 - BLOCK
      ?auto_83303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83301 ?auto_83298 ) ( ON-TABLE ?auto_83297 ) ( ON ?auto_83298 ?auto_83297 ) ( not ( = ?auto_83297 ?auto_83298 ) ) ( not ( = ?auto_83297 ?auto_83301 ) ) ( not ( = ?auto_83298 ?auto_83301 ) ) ( not ( = ?auto_83297 ?auto_83300 ) ) ( not ( = ?auto_83297 ?auto_83302 ) ) ( not ( = ?auto_83298 ?auto_83300 ) ) ( not ( = ?auto_83298 ?auto_83302 ) ) ( not ( = ?auto_83301 ?auto_83300 ) ) ( not ( = ?auto_83301 ?auto_83302 ) ) ( not ( = ?auto_83300 ?auto_83302 ) ) ( ON ?auto_83300 ?auto_83301 ) ( CLEAR ?auto_83299 ) ( ON-TABLE ?auto_83303 ) ( ON ?auto_83299 ?auto_83303 ) ( not ( = ?auto_83303 ?auto_83299 ) ) ( not ( = ?auto_83303 ?auto_83302 ) ) ( not ( = ?auto_83299 ?auto_83302 ) ) ( not ( = ?auto_83297 ?auto_83299 ) ) ( not ( = ?auto_83297 ?auto_83303 ) ) ( not ( = ?auto_83298 ?auto_83299 ) ) ( not ( = ?auto_83298 ?auto_83303 ) ) ( not ( = ?auto_83301 ?auto_83299 ) ) ( not ( = ?auto_83301 ?auto_83303 ) ) ( not ( = ?auto_83300 ?auto_83299 ) ) ( not ( = ?auto_83300 ?auto_83303 ) ) ( ON ?auto_83302 ?auto_83300 ) ( CLEAR ?auto_83302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83297 ?auto_83298 ?auto_83301 ?auto_83300 )
      ( MAKE-2PILE ?auto_83297 ?auto_83298 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83304 - BLOCK
      ?auto_83305 - BLOCK
    )
    :vars
    (
      ?auto_83309 - BLOCK
      ?auto_83310 - BLOCK
      ?auto_83308 - BLOCK
      ?auto_83306 - BLOCK
      ?auto_83307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83309 ?auto_83305 ) ( ON-TABLE ?auto_83304 ) ( ON ?auto_83305 ?auto_83304 ) ( not ( = ?auto_83304 ?auto_83305 ) ) ( not ( = ?auto_83304 ?auto_83309 ) ) ( not ( = ?auto_83305 ?auto_83309 ) ) ( not ( = ?auto_83304 ?auto_83310 ) ) ( not ( = ?auto_83304 ?auto_83308 ) ) ( not ( = ?auto_83305 ?auto_83310 ) ) ( not ( = ?auto_83305 ?auto_83308 ) ) ( not ( = ?auto_83309 ?auto_83310 ) ) ( not ( = ?auto_83309 ?auto_83308 ) ) ( not ( = ?auto_83310 ?auto_83308 ) ) ( ON ?auto_83310 ?auto_83309 ) ( ON-TABLE ?auto_83306 ) ( not ( = ?auto_83306 ?auto_83307 ) ) ( not ( = ?auto_83306 ?auto_83308 ) ) ( not ( = ?auto_83307 ?auto_83308 ) ) ( not ( = ?auto_83304 ?auto_83307 ) ) ( not ( = ?auto_83304 ?auto_83306 ) ) ( not ( = ?auto_83305 ?auto_83307 ) ) ( not ( = ?auto_83305 ?auto_83306 ) ) ( not ( = ?auto_83309 ?auto_83307 ) ) ( not ( = ?auto_83309 ?auto_83306 ) ) ( not ( = ?auto_83310 ?auto_83307 ) ) ( not ( = ?auto_83310 ?auto_83306 ) ) ( ON ?auto_83308 ?auto_83310 ) ( CLEAR ?auto_83308 ) ( HOLDING ?auto_83307 ) ( CLEAR ?auto_83306 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83306 ?auto_83307 )
      ( MAKE-2PILE ?auto_83304 ?auto_83305 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83311 - BLOCK
      ?auto_83312 - BLOCK
    )
    :vars
    (
      ?auto_83316 - BLOCK
      ?auto_83315 - BLOCK
      ?auto_83313 - BLOCK
      ?auto_83317 - BLOCK
      ?auto_83314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83316 ?auto_83312 ) ( ON-TABLE ?auto_83311 ) ( ON ?auto_83312 ?auto_83311 ) ( not ( = ?auto_83311 ?auto_83312 ) ) ( not ( = ?auto_83311 ?auto_83316 ) ) ( not ( = ?auto_83312 ?auto_83316 ) ) ( not ( = ?auto_83311 ?auto_83315 ) ) ( not ( = ?auto_83311 ?auto_83313 ) ) ( not ( = ?auto_83312 ?auto_83315 ) ) ( not ( = ?auto_83312 ?auto_83313 ) ) ( not ( = ?auto_83316 ?auto_83315 ) ) ( not ( = ?auto_83316 ?auto_83313 ) ) ( not ( = ?auto_83315 ?auto_83313 ) ) ( ON ?auto_83315 ?auto_83316 ) ( ON-TABLE ?auto_83317 ) ( not ( = ?auto_83317 ?auto_83314 ) ) ( not ( = ?auto_83317 ?auto_83313 ) ) ( not ( = ?auto_83314 ?auto_83313 ) ) ( not ( = ?auto_83311 ?auto_83314 ) ) ( not ( = ?auto_83311 ?auto_83317 ) ) ( not ( = ?auto_83312 ?auto_83314 ) ) ( not ( = ?auto_83312 ?auto_83317 ) ) ( not ( = ?auto_83316 ?auto_83314 ) ) ( not ( = ?auto_83316 ?auto_83317 ) ) ( not ( = ?auto_83315 ?auto_83314 ) ) ( not ( = ?auto_83315 ?auto_83317 ) ) ( ON ?auto_83313 ?auto_83315 ) ( CLEAR ?auto_83317 ) ( ON ?auto_83314 ?auto_83313 ) ( CLEAR ?auto_83314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83311 ?auto_83312 ?auto_83316 ?auto_83315 ?auto_83313 )
      ( MAKE-2PILE ?auto_83311 ?auto_83312 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83318 - BLOCK
      ?auto_83319 - BLOCK
    )
    :vars
    (
      ?auto_83322 - BLOCK
      ?auto_83320 - BLOCK
      ?auto_83323 - BLOCK
      ?auto_83324 - BLOCK
      ?auto_83321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83322 ?auto_83319 ) ( ON-TABLE ?auto_83318 ) ( ON ?auto_83319 ?auto_83318 ) ( not ( = ?auto_83318 ?auto_83319 ) ) ( not ( = ?auto_83318 ?auto_83322 ) ) ( not ( = ?auto_83319 ?auto_83322 ) ) ( not ( = ?auto_83318 ?auto_83320 ) ) ( not ( = ?auto_83318 ?auto_83323 ) ) ( not ( = ?auto_83319 ?auto_83320 ) ) ( not ( = ?auto_83319 ?auto_83323 ) ) ( not ( = ?auto_83322 ?auto_83320 ) ) ( not ( = ?auto_83322 ?auto_83323 ) ) ( not ( = ?auto_83320 ?auto_83323 ) ) ( ON ?auto_83320 ?auto_83322 ) ( not ( = ?auto_83324 ?auto_83321 ) ) ( not ( = ?auto_83324 ?auto_83323 ) ) ( not ( = ?auto_83321 ?auto_83323 ) ) ( not ( = ?auto_83318 ?auto_83321 ) ) ( not ( = ?auto_83318 ?auto_83324 ) ) ( not ( = ?auto_83319 ?auto_83321 ) ) ( not ( = ?auto_83319 ?auto_83324 ) ) ( not ( = ?auto_83322 ?auto_83321 ) ) ( not ( = ?auto_83322 ?auto_83324 ) ) ( not ( = ?auto_83320 ?auto_83321 ) ) ( not ( = ?auto_83320 ?auto_83324 ) ) ( ON ?auto_83323 ?auto_83320 ) ( ON ?auto_83321 ?auto_83323 ) ( CLEAR ?auto_83321 ) ( HOLDING ?auto_83324 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83324 )
      ( MAKE-2PILE ?auto_83318 ?auto_83319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83334 - BLOCK
      ?auto_83335 - BLOCK
    )
    :vars
    (
      ?auto_83337 - BLOCK
      ?auto_83340 - BLOCK
      ?auto_83338 - BLOCK
      ?auto_83339 - BLOCK
      ?auto_83336 - BLOCK
      ?auto_83341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83337 ?auto_83335 ) ( ON-TABLE ?auto_83334 ) ( ON ?auto_83335 ?auto_83334 ) ( not ( = ?auto_83334 ?auto_83335 ) ) ( not ( = ?auto_83334 ?auto_83337 ) ) ( not ( = ?auto_83335 ?auto_83337 ) ) ( not ( = ?auto_83334 ?auto_83340 ) ) ( not ( = ?auto_83334 ?auto_83338 ) ) ( not ( = ?auto_83335 ?auto_83340 ) ) ( not ( = ?auto_83335 ?auto_83338 ) ) ( not ( = ?auto_83337 ?auto_83340 ) ) ( not ( = ?auto_83337 ?auto_83338 ) ) ( not ( = ?auto_83340 ?auto_83338 ) ) ( ON ?auto_83340 ?auto_83337 ) ( not ( = ?auto_83339 ?auto_83336 ) ) ( not ( = ?auto_83339 ?auto_83338 ) ) ( not ( = ?auto_83336 ?auto_83338 ) ) ( not ( = ?auto_83334 ?auto_83336 ) ) ( not ( = ?auto_83334 ?auto_83339 ) ) ( not ( = ?auto_83335 ?auto_83336 ) ) ( not ( = ?auto_83335 ?auto_83339 ) ) ( not ( = ?auto_83337 ?auto_83336 ) ) ( not ( = ?auto_83337 ?auto_83339 ) ) ( not ( = ?auto_83340 ?auto_83336 ) ) ( not ( = ?auto_83340 ?auto_83339 ) ) ( ON ?auto_83338 ?auto_83340 ) ( ON ?auto_83336 ?auto_83338 ) ( CLEAR ?auto_83336 ) ( ON ?auto_83339 ?auto_83341 ) ( CLEAR ?auto_83339 ) ( HAND-EMPTY ) ( not ( = ?auto_83334 ?auto_83341 ) ) ( not ( = ?auto_83335 ?auto_83341 ) ) ( not ( = ?auto_83337 ?auto_83341 ) ) ( not ( = ?auto_83340 ?auto_83341 ) ) ( not ( = ?auto_83338 ?auto_83341 ) ) ( not ( = ?auto_83339 ?auto_83341 ) ) ( not ( = ?auto_83336 ?auto_83341 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83339 ?auto_83341 )
      ( MAKE-2PILE ?auto_83334 ?auto_83335 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83342 - BLOCK
      ?auto_83343 - BLOCK
    )
    :vars
    (
      ?auto_83346 - BLOCK
      ?auto_83344 - BLOCK
      ?auto_83349 - BLOCK
      ?auto_83345 - BLOCK
      ?auto_83347 - BLOCK
      ?auto_83348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83346 ?auto_83343 ) ( ON-TABLE ?auto_83342 ) ( ON ?auto_83343 ?auto_83342 ) ( not ( = ?auto_83342 ?auto_83343 ) ) ( not ( = ?auto_83342 ?auto_83346 ) ) ( not ( = ?auto_83343 ?auto_83346 ) ) ( not ( = ?auto_83342 ?auto_83344 ) ) ( not ( = ?auto_83342 ?auto_83349 ) ) ( not ( = ?auto_83343 ?auto_83344 ) ) ( not ( = ?auto_83343 ?auto_83349 ) ) ( not ( = ?auto_83346 ?auto_83344 ) ) ( not ( = ?auto_83346 ?auto_83349 ) ) ( not ( = ?auto_83344 ?auto_83349 ) ) ( ON ?auto_83344 ?auto_83346 ) ( not ( = ?auto_83345 ?auto_83347 ) ) ( not ( = ?auto_83345 ?auto_83349 ) ) ( not ( = ?auto_83347 ?auto_83349 ) ) ( not ( = ?auto_83342 ?auto_83347 ) ) ( not ( = ?auto_83342 ?auto_83345 ) ) ( not ( = ?auto_83343 ?auto_83347 ) ) ( not ( = ?auto_83343 ?auto_83345 ) ) ( not ( = ?auto_83346 ?auto_83347 ) ) ( not ( = ?auto_83346 ?auto_83345 ) ) ( not ( = ?auto_83344 ?auto_83347 ) ) ( not ( = ?auto_83344 ?auto_83345 ) ) ( ON ?auto_83349 ?auto_83344 ) ( ON ?auto_83345 ?auto_83348 ) ( CLEAR ?auto_83345 ) ( not ( = ?auto_83342 ?auto_83348 ) ) ( not ( = ?auto_83343 ?auto_83348 ) ) ( not ( = ?auto_83346 ?auto_83348 ) ) ( not ( = ?auto_83344 ?auto_83348 ) ) ( not ( = ?auto_83349 ?auto_83348 ) ) ( not ( = ?auto_83345 ?auto_83348 ) ) ( not ( = ?auto_83347 ?auto_83348 ) ) ( HOLDING ?auto_83347 ) ( CLEAR ?auto_83349 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83342 ?auto_83343 ?auto_83346 ?auto_83344 ?auto_83349 ?auto_83347 )
      ( MAKE-2PILE ?auto_83342 ?auto_83343 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83350 - BLOCK
      ?auto_83351 - BLOCK
    )
    :vars
    (
      ?auto_83352 - BLOCK
      ?auto_83355 - BLOCK
      ?auto_83356 - BLOCK
      ?auto_83354 - BLOCK
      ?auto_83357 - BLOCK
      ?auto_83353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83352 ?auto_83351 ) ( ON-TABLE ?auto_83350 ) ( ON ?auto_83351 ?auto_83350 ) ( not ( = ?auto_83350 ?auto_83351 ) ) ( not ( = ?auto_83350 ?auto_83352 ) ) ( not ( = ?auto_83351 ?auto_83352 ) ) ( not ( = ?auto_83350 ?auto_83355 ) ) ( not ( = ?auto_83350 ?auto_83356 ) ) ( not ( = ?auto_83351 ?auto_83355 ) ) ( not ( = ?auto_83351 ?auto_83356 ) ) ( not ( = ?auto_83352 ?auto_83355 ) ) ( not ( = ?auto_83352 ?auto_83356 ) ) ( not ( = ?auto_83355 ?auto_83356 ) ) ( ON ?auto_83355 ?auto_83352 ) ( not ( = ?auto_83354 ?auto_83357 ) ) ( not ( = ?auto_83354 ?auto_83356 ) ) ( not ( = ?auto_83357 ?auto_83356 ) ) ( not ( = ?auto_83350 ?auto_83357 ) ) ( not ( = ?auto_83350 ?auto_83354 ) ) ( not ( = ?auto_83351 ?auto_83357 ) ) ( not ( = ?auto_83351 ?auto_83354 ) ) ( not ( = ?auto_83352 ?auto_83357 ) ) ( not ( = ?auto_83352 ?auto_83354 ) ) ( not ( = ?auto_83355 ?auto_83357 ) ) ( not ( = ?auto_83355 ?auto_83354 ) ) ( ON ?auto_83356 ?auto_83355 ) ( ON ?auto_83354 ?auto_83353 ) ( not ( = ?auto_83350 ?auto_83353 ) ) ( not ( = ?auto_83351 ?auto_83353 ) ) ( not ( = ?auto_83352 ?auto_83353 ) ) ( not ( = ?auto_83355 ?auto_83353 ) ) ( not ( = ?auto_83356 ?auto_83353 ) ) ( not ( = ?auto_83354 ?auto_83353 ) ) ( not ( = ?auto_83357 ?auto_83353 ) ) ( CLEAR ?auto_83356 ) ( ON ?auto_83357 ?auto_83354 ) ( CLEAR ?auto_83357 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83353 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83353 ?auto_83354 )
      ( MAKE-2PILE ?auto_83350 ?auto_83351 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83358 - BLOCK
      ?auto_83359 - BLOCK
    )
    :vars
    (
      ?auto_83362 - BLOCK
      ?auto_83360 - BLOCK
      ?auto_83361 - BLOCK
      ?auto_83364 - BLOCK
      ?auto_83365 - BLOCK
      ?auto_83363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83362 ?auto_83359 ) ( ON-TABLE ?auto_83358 ) ( ON ?auto_83359 ?auto_83358 ) ( not ( = ?auto_83358 ?auto_83359 ) ) ( not ( = ?auto_83358 ?auto_83362 ) ) ( not ( = ?auto_83359 ?auto_83362 ) ) ( not ( = ?auto_83358 ?auto_83360 ) ) ( not ( = ?auto_83358 ?auto_83361 ) ) ( not ( = ?auto_83359 ?auto_83360 ) ) ( not ( = ?auto_83359 ?auto_83361 ) ) ( not ( = ?auto_83362 ?auto_83360 ) ) ( not ( = ?auto_83362 ?auto_83361 ) ) ( not ( = ?auto_83360 ?auto_83361 ) ) ( ON ?auto_83360 ?auto_83362 ) ( not ( = ?auto_83364 ?auto_83365 ) ) ( not ( = ?auto_83364 ?auto_83361 ) ) ( not ( = ?auto_83365 ?auto_83361 ) ) ( not ( = ?auto_83358 ?auto_83365 ) ) ( not ( = ?auto_83358 ?auto_83364 ) ) ( not ( = ?auto_83359 ?auto_83365 ) ) ( not ( = ?auto_83359 ?auto_83364 ) ) ( not ( = ?auto_83362 ?auto_83365 ) ) ( not ( = ?auto_83362 ?auto_83364 ) ) ( not ( = ?auto_83360 ?auto_83365 ) ) ( not ( = ?auto_83360 ?auto_83364 ) ) ( ON ?auto_83364 ?auto_83363 ) ( not ( = ?auto_83358 ?auto_83363 ) ) ( not ( = ?auto_83359 ?auto_83363 ) ) ( not ( = ?auto_83362 ?auto_83363 ) ) ( not ( = ?auto_83360 ?auto_83363 ) ) ( not ( = ?auto_83361 ?auto_83363 ) ) ( not ( = ?auto_83364 ?auto_83363 ) ) ( not ( = ?auto_83365 ?auto_83363 ) ) ( ON ?auto_83365 ?auto_83364 ) ( CLEAR ?auto_83365 ) ( ON-TABLE ?auto_83363 ) ( HOLDING ?auto_83361 ) ( CLEAR ?auto_83360 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83358 ?auto_83359 ?auto_83362 ?auto_83360 ?auto_83361 )
      ( MAKE-2PILE ?auto_83358 ?auto_83359 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83409 - BLOCK
      ?auto_83410 - BLOCK
      ?auto_83411 - BLOCK
      ?auto_83412 - BLOCK
      ?auto_83413 - BLOCK
    )
    :vars
    (
      ?auto_83414 - BLOCK
      ?auto_83415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83409 ) ( ON ?auto_83410 ?auto_83409 ) ( ON ?auto_83411 ?auto_83410 ) ( not ( = ?auto_83409 ?auto_83410 ) ) ( not ( = ?auto_83409 ?auto_83411 ) ) ( not ( = ?auto_83409 ?auto_83412 ) ) ( not ( = ?auto_83409 ?auto_83413 ) ) ( not ( = ?auto_83410 ?auto_83411 ) ) ( not ( = ?auto_83410 ?auto_83412 ) ) ( not ( = ?auto_83410 ?auto_83413 ) ) ( not ( = ?auto_83411 ?auto_83412 ) ) ( not ( = ?auto_83411 ?auto_83413 ) ) ( not ( = ?auto_83412 ?auto_83413 ) ) ( ON ?auto_83413 ?auto_83414 ) ( not ( = ?auto_83409 ?auto_83414 ) ) ( not ( = ?auto_83410 ?auto_83414 ) ) ( not ( = ?auto_83411 ?auto_83414 ) ) ( not ( = ?auto_83412 ?auto_83414 ) ) ( not ( = ?auto_83413 ?auto_83414 ) ) ( CLEAR ?auto_83411 ) ( ON ?auto_83412 ?auto_83413 ) ( CLEAR ?auto_83412 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83415 ) ( ON ?auto_83414 ?auto_83415 ) ( not ( = ?auto_83415 ?auto_83414 ) ) ( not ( = ?auto_83415 ?auto_83413 ) ) ( not ( = ?auto_83415 ?auto_83412 ) ) ( not ( = ?auto_83409 ?auto_83415 ) ) ( not ( = ?auto_83410 ?auto_83415 ) ) ( not ( = ?auto_83411 ?auto_83415 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83415 ?auto_83414 ?auto_83413 )
      ( MAKE-5PILE ?auto_83409 ?auto_83410 ?auto_83411 ?auto_83412 ?auto_83413 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83416 - BLOCK
      ?auto_83417 - BLOCK
      ?auto_83418 - BLOCK
      ?auto_83419 - BLOCK
      ?auto_83420 - BLOCK
    )
    :vars
    (
      ?auto_83422 - BLOCK
      ?auto_83421 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83416 ) ( ON ?auto_83417 ?auto_83416 ) ( not ( = ?auto_83416 ?auto_83417 ) ) ( not ( = ?auto_83416 ?auto_83418 ) ) ( not ( = ?auto_83416 ?auto_83419 ) ) ( not ( = ?auto_83416 ?auto_83420 ) ) ( not ( = ?auto_83417 ?auto_83418 ) ) ( not ( = ?auto_83417 ?auto_83419 ) ) ( not ( = ?auto_83417 ?auto_83420 ) ) ( not ( = ?auto_83418 ?auto_83419 ) ) ( not ( = ?auto_83418 ?auto_83420 ) ) ( not ( = ?auto_83419 ?auto_83420 ) ) ( ON ?auto_83420 ?auto_83422 ) ( not ( = ?auto_83416 ?auto_83422 ) ) ( not ( = ?auto_83417 ?auto_83422 ) ) ( not ( = ?auto_83418 ?auto_83422 ) ) ( not ( = ?auto_83419 ?auto_83422 ) ) ( not ( = ?auto_83420 ?auto_83422 ) ) ( ON ?auto_83419 ?auto_83420 ) ( CLEAR ?auto_83419 ) ( ON-TABLE ?auto_83421 ) ( ON ?auto_83422 ?auto_83421 ) ( not ( = ?auto_83421 ?auto_83422 ) ) ( not ( = ?auto_83421 ?auto_83420 ) ) ( not ( = ?auto_83421 ?auto_83419 ) ) ( not ( = ?auto_83416 ?auto_83421 ) ) ( not ( = ?auto_83417 ?auto_83421 ) ) ( not ( = ?auto_83418 ?auto_83421 ) ) ( HOLDING ?auto_83418 ) ( CLEAR ?auto_83417 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83416 ?auto_83417 ?auto_83418 )
      ( MAKE-5PILE ?auto_83416 ?auto_83417 ?auto_83418 ?auto_83419 ?auto_83420 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83423 - BLOCK
      ?auto_83424 - BLOCK
      ?auto_83425 - BLOCK
      ?auto_83426 - BLOCK
      ?auto_83427 - BLOCK
    )
    :vars
    (
      ?auto_83429 - BLOCK
      ?auto_83428 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83423 ) ( ON ?auto_83424 ?auto_83423 ) ( not ( = ?auto_83423 ?auto_83424 ) ) ( not ( = ?auto_83423 ?auto_83425 ) ) ( not ( = ?auto_83423 ?auto_83426 ) ) ( not ( = ?auto_83423 ?auto_83427 ) ) ( not ( = ?auto_83424 ?auto_83425 ) ) ( not ( = ?auto_83424 ?auto_83426 ) ) ( not ( = ?auto_83424 ?auto_83427 ) ) ( not ( = ?auto_83425 ?auto_83426 ) ) ( not ( = ?auto_83425 ?auto_83427 ) ) ( not ( = ?auto_83426 ?auto_83427 ) ) ( ON ?auto_83427 ?auto_83429 ) ( not ( = ?auto_83423 ?auto_83429 ) ) ( not ( = ?auto_83424 ?auto_83429 ) ) ( not ( = ?auto_83425 ?auto_83429 ) ) ( not ( = ?auto_83426 ?auto_83429 ) ) ( not ( = ?auto_83427 ?auto_83429 ) ) ( ON ?auto_83426 ?auto_83427 ) ( ON-TABLE ?auto_83428 ) ( ON ?auto_83429 ?auto_83428 ) ( not ( = ?auto_83428 ?auto_83429 ) ) ( not ( = ?auto_83428 ?auto_83427 ) ) ( not ( = ?auto_83428 ?auto_83426 ) ) ( not ( = ?auto_83423 ?auto_83428 ) ) ( not ( = ?auto_83424 ?auto_83428 ) ) ( not ( = ?auto_83425 ?auto_83428 ) ) ( CLEAR ?auto_83424 ) ( ON ?auto_83425 ?auto_83426 ) ( CLEAR ?auto_83425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83428 ?auto_83429 ?auto_83427 ?auto_83426 )
      ( MAKE-5PILE ?auto_83423 ?auto_83424 ?auto_83425 ?auto_83426 ?auto_83427 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83430 - BLOCK
      ?auto_83431 - BLOCK
      ?auto_83432 - BLOCK
      ?auto_83433 - BLOCK
      ?auto_83434 - BLOCK
    )
    :vars
    (
      ?auto_83435 - BLOCK
      ?auto_83436 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83430 ) ( not ( = ?auto_83430 ?auto_83431 ) ) ( not ( = ?auto_83430 ?auto_83432 ) ) ( not ( = ?auto_83430 ?auto_83433 ) ) ( not ( = ?auto_83430 ?auto_83434 ) ) ( not ( = ?auto_83431 ?auto_83432 ) ) ( not ( = ?auto_83431 ?auto_83433 ) ) ( not ( = ?auto_83431 ?auto_83434 ) ) ( not ( = ?auto_83432 ?auto_83433 ) ) ( not ( = ?auto_83432 ?auto_83434 ) ) ( not ( = ?auto_83433 ?auto_83434 ) ) ( ON ?auto_83434 ?auto_83435 ) ( not ( = ?auto_83430 ?auto_83435 ) ) ( not ( = ?auto_83431 ?auto_83435 ) ) ( not ( = ?auto_83432 ?auto_83435 ) ) ( not ( = ?auto_83433 ?auto_83435 ) ) ( not ( = ?auto_83434 ?auto_83435 ) ) ( ON ?auto_83433 ?auto_83434 ) ( ON-TABLE ?auto_83436 ) ( ON ?auto_83435 ?auto_83436 ) ( not ( = ?auto_83436 ?auto_83435 ) ) ( not ( = ?auto_83436 ?auto_83434 ) ) ( not ( = ?auto_83436 ?auto_83433 ) ) ( not ( = ?auto_83430 ?auto_83436 ) ) ( not ( = ?auto_83431 ?auto_83436 ) ) ( not ( = ?auto_83432 ?auto_83436 ) ) ( ON ?auto_83432 ?auto_83433 ) ( CLEAR ?auto_83432 ) ( HOLDING ?auto_83431 ) ( CLEAR ?auto_83430 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83430 ?auto_83431 )
      ( MAKE-5PILE ?auto_83430 ?auto_83431 ?auto_83432 ?auto_83433 ?auto_83434 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83437 - BLOCK
      ?auto_83438 - BLOCK
      ?auto_83439 - BLOCK
      ?auto_83440 - BLOCK
      ?auto_83441 - BLOCK
    )
    :vars
    (
      ?auto_83442 - BLOCK
      ?auto_83443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83437 ) ( not ( = ?auto_83437 ?auto_83438 ) ) ( not ( = ?auto_83437 ?auto_83439 ) ) ( not ( = ?auto_83437 ?auto_83440 ) ) ( not ( = ?auto_83437 ?auto_83441 ) ) ( not ( = ?auto_83438 ?auto_83439 ) ) ( not ( = ?auto_83438 ?auto_83440 ) ) ( not ( = ?auto_83438 ?auto_83441 ) ) ( not ( = ?auto_83439 ?auto_83440 ) ) ( not ( = ?auto_83439 ?auto_83441 ) ) ( not ( = ?auto_83440 ?auto_83441 ) ) ( ON ?auto_83441 ?auto_83442 ) ( not ( = ?auto_83437 ?auto_83442 ) ) ( not ( = ?auto_83438 ?auto_83442 ) ) ( not ( = ?auto_83439 ?auto_83442 ) ) ( not ( = ?auto_83440 ?auto_83442 ) ) ( not ( = ?auto_83441 ?auto_83442 ) ) ( ON ?auto_83440 ?auto_83441 ) ( ON-TABLE ?auto_83443 ) ( ON ?auto_83442 ?auto_83443 ) ( not ( = ?auto_83443 ?auto_83442 ) ) ( not ( = ?auto_83443 ?auto_83441 ) ) ( not ( = ?auto_83443 ?auto_83440 ) ) ( not ( = ?auto_83437 ?auto_83443 ) ) ( not ( = ?auto_83438 ?auto_83443 ) ) ( not ( = ?auto_83439 ?auto_83443 ) ) ( ON ?auto_83439 ?auto_83440 ) ( CLEAR ?auto_83437 ) ( ON ?auto_83438 ?auto_83439 ) ( CLEAR ?auto_83438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83443 ?auto_83442 ?auto_83441 ?auto_83440 ?auto_83439 )
      ( MAKE-5PILE ?auto_83437 ?auto_83438 ?auto_83439 ?auto_83440 ?auto_83441 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83444 - BLOCK
      ?auto_83445 - BLOCK
      ?auto_83446 - BLOCK
      ?auto_83447 - BLOCK
      ?auto_83448 - BLOCK
    )
    :vars
    (
      ?auto_83450 - BLOCK
      ?auto_83449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83444 ?auto_83445 ) ) ( not ( = ?auto_83444 ?auto_83446 ) ) ( not ( = ?auto_83444 ?auto_83447 ) ) ( not ( = ?auto_83444 ?auto_83448 ) ) ( not ( = ?auto_83445 ?auto_83446 ) ) ( not ( = ?auto_83445 ?auto_83447 ) ) ( not ( = ?auto_83445 ?auto_83448 ) ) ( not ( = ?auto_83446 ?auto_83447 ) ) ( not ( = ?auto_83446 ?auto_83448 ) ) ( not ( = ?auto_83447 ?auto_83448 ) ) ( ON ?auto_83448 ?auto_83450 ) ( not ( = ?auto_83444 ?auto_83450 ) ) ( not ( = ?auto_83445 ?auto_83450 ) ) ( not ( = ?auto_83446 ?auto_83450 ) ) ( not ( = ?auto_83447 ?auto_83450 ) ) ( not ( = ?auto_83448 ?auto_83450 ) ) ( ON ?auto_83447 ?auto_83448 ) ( ON-TABLE ?auto_83449 ) ( ON ?auto_83450 ?auto_83449 ) ( not ( = ?auto_83449 ?auto_83450 ) ) ( not ( = ?auto_83449 ?auto_83448 ) ) ( not ( = ?auto_83449 ?auto_83447 ) ) ( not ( = ?auto_83444 ?auto_83449 ) ) ( not ( = ?auto_83445 ?auto_83449 ) ) ( not ( = ?auto_83446 ?auto_83449 ) ) ( ON ?auto_83446 ?auto_83447 ) ( ON ?auto_83445 ?auto_83446 ) ( CLEAR ?auto_83445 ) ( HOLDING ?auto_83444 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83444 )
      ( MAKE-5PILE ?auto_83444 ?auto_83445 ?auto_83446 ?auto_83447 ?auto_83448 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83451 - BLOCK
      ?auto_83452 - BLOCK
      ?auto_83453 - BLOCK
      ?auto_83454 - BLOCK
      ?auto_83455 - BLOCK
    )
    :vars
    (
      ?auto_83456 - BLOCK
      ?auto_83457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83451 ?auto_83452 ) ) ( not ( = ?auto_83451 ?auto_83453 ) ) ( not ( = ?auto_83451 ?auto_83454 ) ) ( not ( = ?auto_83451 ?auto_83455 ) ) ( not ( = ?auto_83452 ?auto_83453 ) ) ( not ( = ?auto_83452 ?auto_83454 ) ) ( not ( = ?auto_83452 ?auto_83455 ) ) ( not ( = ?auto_83453 ?auto_83454 ) ) ( not ( = ?auto_83453 ?auto_83455 ) ) ( not ( = ?auto_83454 ?auto_83455 ) ) ( ON ?auto_83455 ?auto_83456 ) ( not ( = ?auto_83451 ?auto_83456 ) ) ( not ( = ?auto_83452 ?auto_83456 ) ) ( not ( = ?auto_83453 ?auto_83456 ) ) ( not ( = ?auto_83454 ?auto_83456 ) ) ( not ( = ?auto_83455 ?auto_83456 ) ) ( ON ?auto_83454 ?auto_83455 ) ( ON-TABLE ?auto_83457 ) ( ON ?auto_83456 ?auto_83457 ) ( not ( = ?auto_83457 ?auto_83456 ) ) ( not ( = ?auto_83457 ?auto_83455 ) ) ( not ( = ?auto_83457 ?auto_83454 ) ) ( not ( = ?auto_83451 ?auto_83457 ) ) ( not ( = ?auto_83452 ?auto_83457 ) ) ( not ( = ?auto_83453 ?auto_83457 ) ) ( ON ?auto_83453 ?auto_83454 ) ( ON ?auto_83452 ?auto_83453 ) ( ON ?auto_83451 ?auto_83452 ) ( CLEAR ?auto_83451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83457 ?auto_83456 ?auto_83455 ?auto_83454 ?auto_83453 ?auto_83452 )
      ( MAKE-5PILE ?auto_83451 ?auto_83452 ?auto_83453 ?auto_83454 ?auto_83455 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83463 - BLOCK
      ?auto_83464 - BLOCK
      ?auto_83465 - BLOCK
      ?auto_83466 - BLOCK
      ?auto_83467 - BLOCK
    )
    :vars
    (
      ?auto_83468 - BLOCK
      ?auto_83469 - BLOCK
      ?auto_83470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83463 ?auto_83464 ) ) ( not ( = ?auto_83463 ?auto_83465 ) ) ( not ( = ?auto_83463 ?auto_83466 ) ) ( not ( = ?auto_83463 ?auto_83467 ) ) ( not ( = ?auto_83464 ?auto_83465 ) ) ( not ( = ?auto_83464 ?auto_83466 ) ) ( not ( = ?auto_83464 ?auto_83467 ) ) ( not ( = ?auto_83465 ?auto_83466 ) ) ( not ( = ?auto_83465 ?auto_83467 ) ) ( not ( = ?auto_83466 ?auto_83467 ) ) ( ON ?auto_83467 ?auto_83468 ) ( not ( = ?auto_83463 ?auto_83468 ) ) ( not ( = ?auto_83464 ?auto_83468 ) ) ( not ( = ?auto_83465 ?auto_83468 ) ) ( not ( = ?auto_83466 ?auto_83468 ) ) ( not ( = ?auto_83467 ?auto_83468 ) ) ( ON ?auto_83466 ?auto_83467 ) ( ON-TABLE ?auto_83469 ) ( ON ?auto_83468 ?auto_83469 ) ( not ( = ?auto_83469 ?auto_83468 ) ) ( not ( = ?auto_83469 ?auto_83467 ) ) ( not ( = ?auto_83469 ?auto_83466 ) ) ( not ( = ?auto_83463 ?auto_83469 ) ) ( not ( = ?auto_83464 ?auto_83469 ) ) ( not ( = ?auto_83465 ?auto_83469 ) ) ( ON ?auto_83465 ?auto_83466 ) ( ON ?auto_83464 ?auto_83465 ) ( CLEAR ?auto_83464 ) ( ON ?auto_83463 ?auto_83470 ) ( CLEAR ?auto_83463 ) ( HAND-EMPTY ) ( not ( = ?auto_83463 ?auto_83470 ) ) ( not ( = ?auto_83464 ?auto_83470 ) ) ( not ( = ?auto_83465 ?auto_83470 ) ) ( not ( = ?auto_83466 ?auto_83470 ) ) ( not ( = ?auto_83467 ?auto_83470 ) ) ( not ( = ?auto_83468 ?auto_83470 ) ) ( not ( = ?auto_83469 ?auto_83470 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83463 ?auto_83470 )
      ( MAKE-5PILE ?auto_83463 ?auto_83464 ?auto_83465 ?auto_83466 ?auto_83467 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83471 - BLOCK
      ?auto_83472 - BLOCK
      ?auto_83473 - BLOCK
      ?auto_83474 - BLOCK
      ?auto_83475 - BLOCK
    )
    :vars
    (
      ?auto_83478 - BLOCK
      ?auto_83477 - BLOCK
      ?auto_83476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83471 ?auto_83472 ) ) ( not ( = ?auto_83471 ?auto_83473 ) ) ( not ( = ?auto_83471 ?auto_83474 ) ) ( not ( = ?auto_83471 ?auto_83475 ) ) ( not ( = ?auto_83472 ?auto_83473 ) ) ( not ( = ?auto_83472 ?auto_83474 ) ) ( not ( = ?auto_83472 ?auto_83475 ) ) ( not ( = ?auto_83473 ?auto_83474 ) ) ( not ( = ?auto_83473 ?auto_83475 ) ) ( not ( = ?auto_83474 ?auto_83475 ) ) ( ON ?auto_83475 ?auto_83478 ) ( not ( = ?auto_83471 ?auto_83478 ) ) ( not ( = ?auto_83472 ?auto_83478 ) ) ( not ( = ?auto_83473 ?auto_83478 ) ) ( not ( = ?auto_83474 ?auto_83478 ) ) ( not ( = ?auto_83475 ?auto_83478 ) ) ( ON ?auto_83474 ?auto_83475 ) ( ON-TABLE ?auto_83477 ) ( ON ?auto_83478 ?auto_83477 ) ( not ( = ?auto_83477 ?auto_83478 ) ) ( not ( = ?auto_83477 ?auto_83475 ) ) ( not ( = ?auto_83477 ?auto_83474 ) ) ( not ( = ?auto_83471 ?auto_83477 ) ) ( not ( = ?auto_83472 ?auto_83477 ) ) ( not ( = ?auto_83473 ?auto_83477 ) ) ( ON ?auto_83473 ?auto_83474 ) ( ON ?auto_83471 ?auto_83476 ) ( CLEAR ?auto_83471 ) ( not ( = ?auto_83471 ?auto_83476 ) ) ( not ( = ?auto_83472 ?auto_83476 ) ) ( not ( = ?auto_83473 ?auto_83476 ) ) ( not ( = ?auto_83474 ?auto_83476 ) ) ( not ( = ?auto_83475 ?auto_83476 ) ) ( not ( = ?auto_83478 ?auto_83476 ) ) ( not ( = ?auto_83477 ?auto_83476 ) ) ( HOLDING ?auto_83472 ) ( CLEAR ?auto_83473 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83477 ?auto_83478 ?auto_83475 ?auto_83474 ?auto_83473 ?auto_83472 )
      ( MAKE-5PILE ?auto_83471 ?auto_83472 ?auto_83473 ?auto_83474 ?auto_83475 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83479 - BLOCK
      ?auto_83480 - BLOCK
      ?auto_83481 - BLOCK
      ?auto_83482 - BLOCK
      ?auto_83483 - BLOCK
    )
    :vars
    (
      ?auto_83486 - BLOCK
      ?auto_83484 - BLOCK
      ?auto_83485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83479 ?auto_83480 ) ) ( not ( = ?auto_83479 ?auto_83481 ) ) ( not ( = ?auto_83479 ?auto_83482 ) ) ( not ( = ?auto_83479 ?auto_83483 ) ) ( not ( = ?auto_83480 ?auto_83481 ) ) ( not ( = ?auto_83480 ?auto_83482 ) ) ( not ( = ?auto_83480 ?auto_83483 ) ) ( not ( = ?auto_83481 ?auto_83482 ) ) ( not ( = ?auto_83481 ?auto_83483 ) ) ( not ( = ?auto_83482 ?auto_83483 ) ) ( ON ?auto_83483 ?auto_83486 ) ( not ( = ?auto_83479 ?auto_83486 ) ) ( not ( = ?auto_83480 ?auto_83486 ) ) ( not ( = ?auto_83481 ?auto_83486 ) ) ( not ( = ?auto_83482 ?auto_83486 ) ) ( not ( = ?auto_83483 ?auto_83486 ) ) ( ON ?auto_83482 ?auto_83483 ) ( ON-TABLE ?auto_83484 ) ( ON ?auto_83486 ?auto_83484 ) ( not ( = ?auto_83484 ?auto_83486 ) ) ( not ( = ?auto_83484 ?auto_83483 ) ) ( not ( = ?auto_83484 ?auto_83482 ) ) ( not ( = ?auto_83479 ?auto_83484 ) ) ( not ( = ?auto_83480 ?auto_83484 ) ) ( not ( = ?auto_83481 ?auto_83484 ) ) ( ON ?auto_83481 ?auto_83482 ) ( ON ?auto_83479 ?auto_83485 ) ( not ( = ?auto_83479 ?auto_83485 ) ) ( not ( = ?auto_83480 ?auto_83485 ) ) ( not ( = ?auto_83481 ?auto_83485 ) ) ( not ( = ?auto_83482 ?auto_83485 ) ) ( not ( = ?auto_83483 ?auto_83485 ) ) ( not ( = ?auto_83486 ?auto_83485 ) ) ( not ( = ?auto_83484 ?auto_83485 ) ) ( CLEAR ?auto_83481 ) ( ON ?auto_83480 ?auto_83479 ) ( CLEAR ?auto_83480 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83485 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83485 ?auto_83479 )
      ( MAKE-5PILE ?auto_83479 ?auto_83480 ?auto_83481 ?auto_83482 ?auto_83483 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83487 - BLOCK
      ?auto_83488 - BLOCK
      ?auto_83489 - BLOCK
      ?auto_83490 - BLOCK
      ?auto_83491 - BLOCK
    )
    :vars
    (
      ?auto_83492 - BLOCK
      ?auto_83493 - BLOCK
      ?auto_83494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83487 ?auto_83488 ) ) ( not ( = ?auto_83487 ?auto_83489 ) ) ( not ( = ?auto_83487 ?auto_83490 ) ) ( not ( = ?auto_83487 ?auto_83491 ) ) ( not ( = ?auto_83488 ?auto_83489 ) ) ( not ( = ?auto_83488 ?auto_83490 ) ) ( not ( = ?auto_83488 ?auto_83491 ) ) ( not ( = ?auto_83489 ?auto_83490 ) ) ( not ( = ?auto_83489 ?auto_83491 ) ) ( not ( = ?auto_83490 ?auto_83491 ) ) ( ON ?auto_83491 ?auto_83492 ) ( not ( = ?auto_83487 ?auto_83492 ) ) ( not ( = ?auto_83488 ?auto_83492 ) ) ( not ( = ?auto_83489 ?auto_83492 ) ) ( not ( = ?auto_83490 ?auto_83492 ) ) ( not ( = ?auto_83491 ?auto_83492 ) ) ( ON ?auto_83490 ?auto_83491 ) ( ON-TABLE ?auto_83493 ) ( ON ?auto_83492 ?auto_83493 ) ( not ( = ?auto_83493 ?auto_83492 ) ) ( not ( = ?auto_83493 ?auto_83491 ) ) ( not ( = ?auto_83493 ?auto_83490 ) ) ( not ( = ?auto_83487 ?auto_83493 ) ) ( not ( = ?auto_83488 ?auto_83493 ) ) ( not ( = ?auto_83489 ?auto_83493 ) ) ( ON ?auto_83487 ?auto_83494 ) ( not ( = ?auto_83487 ?auto_83494 ) ) ( not ( = ?auto_83488 ?auto_83494 ) ) ( not ( = ?auto_83489 ?auto_83494 ) ) ( not ( = ?auto_83490 ?auto_83494 ) ) ( not ( = ?auto_83491 ?auto_83494 ) ) ( not ( = ?auto_83492 ?auto_83494 ) ) ( not ( = ?auto_83493 ?auto_83494 ) ) ( ON ?auto_83488 ?auto_83487 ) ( CLEAR ?auto_83488 ) ( ON-TABLE ?auto_83494 ) ( HOLDING ?auto_83489 ) ( CLEAR ?auto_83490 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83493 ?auto_83492 ?auto_83491 ?auto_83490 ?auto_83489 )
      ( MAKE-5PILE ?auto_83487 ?auto_83488 ?auto_83489 ?auto_83490 ?auto_83491 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83495 - BLOCK
      ?auto_83496 - BLOCK
      ?auto_83497 - BLOCK
      ?auto_83498 - BLOCK
      ?auto_83499 - BLOCK
    )
    :vars
    (
      ?auto_83500 - BLOCK
      ?auto_83502 - BLOCK
      ?auto_83501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83495 ?auto_83496 ) ) ( not ( = ?auto_83495 ?auto_83497 ) ) ( not ( = ?auto_83495 ?auto_83498 ) ) ( not ( = ?auto_83495 ?auto_83499 ) ) ( not ( = ?auto_83496 ?auto_83497 ) ) ( not ( = ?auto_83496 ?auto_83498 ) ) ( not ( = ?auto_83496 ?auto_83499 ) ) ( not ( = ?auto_83497 ?auto_83498 ) ) ( not ( = ?auto_83497 ?auto_83499 ) ) ( not ( = ?auto_83498 ?auto_83499 ) ) ( ON ?auto_83499 ?auto_83500 ) ( not ( = ?auto_83495 ?auto_83500 ) ) ( not ( = ?auto_83496 ?auto_83500 ) ) ( not ( = ?auto_83497 ?auto_83500 ) ) ( not ( = ?auto_83498 ?auto_83500 ) ) ( not ( = ?auto_83499 ?auto_83500 ) ) ( ON ?auto_83498 ?auto_83499 ) ( ON-TABLE ?auto_83502 ) ( ON ?auto_83500 ?auto_83502 ) ( not ( = ?auto_83502 ?auto_83500 ) ) ( not ( = ?auto_83502 ?auto_83499 ) ) ( not ( = ?auto_83502 ?auto_83498 ) ) ( not ( = ?auto_83495 ?auto_83502 ) ) ( not ( = ?auto_83496 ?auto_83502 ) ) ( not ( = ?auto_83497 ?auto_83502 ) ) ( ON ?auto_83495 ?auto_83501 ) ( not ( = ?auto_83495 ?auto_83501 ) ) ( not ( = ?auto_83496 ?auto_83501 ) ) ( not ( = ?auto_83497 ?auto_83501 ) ) ( not ( = ?auto_83498 ?auto_83501 ) ) ( not ( = ?auto_83499 ?auto_83501 ) ) ( not ( = ?auto_83500 ?auto_83501 ) ) ( not ( = ?auto_83502 ?auto_83501 ) ) ( ON ?auto_83496 ?auto_83495 ) ( ON-TABLE ?auto_83501 ) ( CLEAR ?auto_83498 ) ( ON ?auto_83497 ?auto_83496 ) ( CLEAR ?auto_83497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83501 ?auto_83495 ?auto_83496 )
      ( MAKE-5PILE ?auto_83495 ?auto_83496 ?auto_83497 ?auto_83498 ?auto_83499 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83503 - BLOCK
      ?auto_83504 - BLOCK
      ?auto_83505 - BLOCK
      ?auto_83506 - BLOCK
      ?auto_83507 - BLOCK
    )
    :vars
    (
      ?auto_83509 - BLOCK
      ?auto_83508 - BLOCK
      ?auto_83510 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83503 ?auto_83504 ) ) ( not ( = ?auto_83503 ?auto_83505 ) ) ( not ( = ?auto_83503 ?auto_83506 ) ) ( not ( = ?auto_83503 ?auto_83507 ) ) ( not ( = ?auto_83504 ?auto_83505 ) ) ( not ( = ?auto_83504 ?auto_83506 ) ) ( not ( = ?auto_83504 ?auto_83507 ) ) ( not ( = ?auto_83505 ?auto_83506 ) ) ( not ( = ?auto_83505 ?auto_83507 ) ) ( not ( = ?auto_83506 ?auto_83507 ) ) ( ON ?auto_83507 ?auto_83509 ) ( not ( = ?auto_83503 ?auto_83509 ) ) ( not ( = ?auto_83504 ?auto_83509 ) ) ( not ( = ?auto_83505 ?auto_83509 ) ) ( not ( = ?auto_83506 ?auto_83509 ) ) ( not ( = ?auto_83507 ?auto_83509 ) ) ( ON-TABLE ?auto_83508 ) ( ON ?auto_83509 ?auto_83508 ) ( not ( = ?auto_83508 ?auto_83509 ) ) ( not ( = ?auto_83508 ?auto_83507 ) ) ( not ( = ?auto_83508 ?auto_83506 ) ) ( not ( = ?auto_83503 ?auto_83508 ) ) ( not ( = ?auto_83504 ?auto_83508 ) ) ( not ( = ?auto_83505 ?auto_83508 ) ) ( ON ?auto_83503 ?auto_83510 ) ( not ( = ?auto_83503 ?auto_83510 ) ) ( not ( = ?auto_83504 ?auto_83510 ) ) ( not ( = ?auto_83505 ?auto_83510 ) ) ( not ( = ?auto_83506 ?auto_83510 ) ) ( not ( = ?auto_83507 ?auto_83510 ) ) ( not ( = ?auto_83509 ?auto_83510 ) ) ( not ( = ?auto_83508 ?auto_83510 ) ) ( ON ?auto_83504 ?auto_83503 ) ( ON-TABLE ?auto_83510 ) ( ON ?auto_83505 ?auto_83504 ) ( CLEAR ?auto_83505 ) ( HOLDING ?auto_83506 ) ( CLEAR ?auto_83507 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83508 ?auto_83509 ?auto_83507 ?auto_83506 )
      ( MAKE-5PILE ?auto_83503 ?auto_83504 ?auto_83505 ?auto_83506 ?auto_83507 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83511 - BLOCK
      ?auto_83512 - BLOCK
      ?auto_83513 - BLOCK
      ?auto_83514 - BLOCK
      ?auto_83515 - BLOCK
    )
    :vars
    (
      ?auto_83518 - BLOCK
      ?auto_83517 - BLOCK
      ?auto_83516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83511 ?auto_83512 ) ) ( not ( = ?auto_83511 ?auto_83513 ) ) ( not ( = ?auto_83511 ?auto_83514 ) ) ( not ( = ?auto_83511 ?auto_83515 ) ) ( not ( = ?auto_83512 ?auto_83513 ) ) ( not ( = ?auto_83512 ?auto_83514 ) ) ( not ( = ?auto_83512 ?auto_83515 ) ) ( not ( = ?auto_83513 ?auto_83514 ) ) ( not ( = ?auto_83513 ?auto_83515 ) ) ( not ( = ?auto_83514 ?auto_83515 ) ) ( ON ?auto_83515 ?auto_83518 ) ( not ( = ?auto_83511 ?auto_83518 ) ) ( not ( = ?auto_83512 ?auto_83518 ) ) ( not ( = ?auto_83513 ?auto_83518 ) ) ( not ( = ?auto_83514 ?auto_83518 ) ) ( not ( = ?auto_83515 ?auto_83518 ) ) ( ON-TABLE ?auto_83517 ) ( ON ?auto_83518 ?auto_83517 ) ( not ( = ?auto_83517 ?auto_83518 ) ) ( not ( = ?auto_83517 ?auto_83515 ) ) ( not ( = ?auto_83517 ?auto_83514 ) ) ( not ( = ?auto_83511 ?auto_83517 ) ) ( not ( = ?auto_83512 ?auto_83517 ) ) ( not ( = ?auto_83513 ?auto_83517 ) ) ( ON ?auto_83511 ?auto_83516 ) ( not ( = ?auto_83511 ?auto_83516 ) ) ( not ( = ?auto_83512 ?auto_83516 ) ) ( not ( = ?auto_83513 ?auto_83516 ) ) ( not ( = ?auto_83514 ?auto_83516 ) ) ( not ( = ?auto_83515 ?auto_83516 ) ) ( not ( = ?auto_83518 ?auto_83516 ) ) ( not ( = ?auto_83517 ?auto_83516 ) ) ( ON ?auto_83512 ?auto_83511 ) ( ON-TABLE ?auto_83516 ) ( ON ?auto_83513 ?auto_83512 ) ( CLEAR ?auto_83515 ) ( ON ?auto_83514 ?auto_83513 ) ( CLEAR ?auto_83514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83516 ?auto_83511 ?auto_83512 ?auto_83513 )
      ( MAKE-5PILE ?auto_83511 ?auto_83512 ?auto_83513 ?auto_83514 ?auto_83515 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83519 - BLOCK
      ?auto_83520 - BLOCK
      ?auto_83521 - BLOCK
      ?auto_83522 - BLOCK
      ?auto_83523 - BLOCK
    )
    :vars
    (
      ?auto_83526 - BLOCK
      ?auto_83525 - BLOCK
      ?auto_83524 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83519 ?auto_83520 ) ) ( not ( = ?auto_83519 ?auto_83521 ) ) ( not ( = ?auto_83519 ?auto_83522 ) ) ( not ( = ?auto_83519 ?auto_83523 ) ) ( not ( = ?auto_83520 ?auto_83521 ) ) ( not ( = ?auto_83520 ?auto_83522 ) ) ( not ( = ?auto_83520 ?auto_83523 ) ) ( not ( = ?auto_83521 ?auto_83522 ) ) ( not ( = ?auto_83521 ?auto_83523 ) ) ( not ( = ?auto_83522 ?auto_83523 ) ) ( not ( = ?auto_83519 ?auto_83526 ) ) ( not ( = ?auto_83520 ?auto_83526 ) ) ( not ( = ?auto_83521 ?auto_83526 ) ) ( not ( = ?auto_83522 ?auto_83526 ) ) ( not ( = ?auto_83523 ?auto_83526 ) ) ( ON-TABLE ?auto_83525 ) ( ON ?auto_83526 ?auto_83525 ) ( not ( = ?auto_83525 ?auto_83526 ) ) ( not ( = ?auto_83525 ?auto_83523 ) ) ( not ( = ?auto_83525 ?auto_83522 ) ) ( not ( = ?auto_83519 ?auto_83525 ) ) ( not ( = ?auto_83520 ?auto_83525 ) ) ( not ( = ?auto_83521 ?auto_83525 ) ) ( ON ?auto_83519 ?auto_83524 ) ( not ( = ?auto_83519 ?auto_83524 ) ) ( not ( = ?auto_83520 ?auto_83524 ) ) ( not ( = ?auto_83521 ?auto_83524 ) ) ( not ( = ?auto_83522 ?auto_83524 ) ) ( not ( = ?auto_83523 ?auto_83524 ) ) ( not ( = ?auto_83526 ?auto_83524 ) ) ( not ( = ?auto_83525 ?auto_83524 ) ) ( ON ?auto_83520 ?auto_83519 ) ( ON-TABLE ?auto_83524 ) ( ON ?auto_83521 ?auto_83520 ) ( ON ?auto_83522 ?auto_83521 ) ( CLEAR ?auto_83522 ) ( HOLDING ?auto_83523 ) ( CLEAR ?auto_83526 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83525 ?auto_83526 ?auto_83523 )
      ( MAKE-5PILE ?auto_83519 ?auto_83520 ?auto_83521 ?auto_83522 ?auto_83523 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83527 - BLOCK
      ?auto_83528 - BLOCK
      ?auto_83529 - BLOCK
      ?auto_83530 - BLOCK
      ?auto_83531 - BLOCK
    )
    :vars
    (
      ?auto_83534 - BLOCK
      ?auto_83532 - BLOCK
      ?auto_83533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83527 ?auto_83528 ) ) ( not ( = ?auto_83527 ?auto_83529 ) ) ( not ( = ?auto_83527 ?auto_83530 ) ) ( not ( = ?auto_83527 ?auto_83531 ) ) ( not ( = ?auto_83528 ?auto_83529 ) ) ( not ( = ?auto_83528 ?auto_83530 ) ) ( not ( = ?auto_83528 ?auto_83531 ) ) ( not ( = ?auto_83529 ?auto_83530 ) ) ( not ( = ?auto_83529 ?auto_83531 ) ) ( not ( = ?auto_83530 ?auto_83531 ) ) ( not ( = ?auto_83527 ?auto_83534 ) ) ( not ( = ?auto_83528 ?auto_83534 ) ) ( not ( = ?auto_83529 ?auto_83534 ) ) ( not ( = ?auto_83530 ?auto_83534 ) ) ( not ( = ?auto_83531 ?auto_83534 ) ) ( ON-TABLE ?auto_83532 ) ( ON ?auto_83534 ?auto_83532 ) ( not ( = ?auto_83532 ?auto_83534 ) ) ( not ( = ?auto_83532 ?auto_83531 ) ) ( not ( = ?auto_83532 ?auto_83530 ) ) ( not ( = ?auto_83527 ?auto_83532 ) ) ( not ( = ?auto_83528 ?auto_83532 ) ) ( not ( = ?auto_83529 ?auto_83532 ) ) ( ON ?auto_83527 ?auto_83533 ) ( not ( = ?auto_83527 ?auto_83533 ) ) ( not ( = ?auto_83528 ?auto_83533 ) ) ( not ( = ?auto_83529 ?auto_83533 ) ) ( not ( = ?auto_83530 ?auto_83533 ) ) ( not ( = ?auto_83531 ?auto_83533 ) ) ( not ( = ?auto_83534 ?auto_83533 ) ) ( not ( = ?auto_83532 ?auto_83533 ) ) ( ON ?auto_83528 ?auto_83527 ) ( ON-TABLE ?auto_83533 ) ( ON ?auto_83529 ?auto_83528 ) ( ON ?auto_83530 ?auto_83529 ) ( CLEAR ?auto_83534 ) ( ON ?auto_83531 ?auto_83530 ) ( CLEAR ?auto_83531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83533 ?auto_83527 ?auto_83528 ?auto_83529 ?auto_83530 )
      ( MAKE-5PILE ?auto_83527 ?auto_83528 ?auto_83529 ?auto_83530 ?auto_83531 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83535 - BLOCK
      ?auto_83536 - BLOCK
      ?auto_83537 - BLOCK
      ?auto_83538 - BLOCK
      ?auto_83539 - BLOCK
    )
    :vars
    (
      ?auto_83541 - BLOCK
      ?auto_83540 - BLOCK
      ?auto_83542 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83535 ?auto_83536 ) ) ( not ( = ?auto_83535 ?auto_83537 ) ) ( not ( = ?auto_83535 ?auto_83538 ) ) ( not ( = ?auto_83535 ?auto_83539 ) ) ( not ( = ?auto_83536 ?auto_83537 ) ) ( not ( = ?auto_83536 ?auto_83538 ) ) ( not ( = ?auto_83536 ?auto_83539 ) ) ( not ( = ?auto_83537 ?auto_83538 ) ) ( not ( = ?auto_83537 ?auto_83539 ) ) ( not ( = ?auto_83538 ?auto_83539 ) ) ( not ( = ?auto_83535 ?auto_83541 ) ) ( not ( = ?auto_83536 ?auto_83541 ) ) ( not ( = ?auto_83537 ?auto_83541 ) ) ( not ( = ?auto_83538 ?auto_83541 ) ) ( not ( = ?auto_83539 ?auto_83541 ) ) ( ON-TABLE ?auto_83540 ) ( not ( = ?auto_83540 ?auto_83541 ) ) ( not ( = ?auto_83540 ?auto_83539 ) ) ( not ( = ?auto_83540 ?auto_83538 ) ) ( not ( = ?auto_83535 ?auto_83540 ) ) ( not ( = ?auto_83536 ?auto_83540 ) ) ( not ( = ?auto_83537 ?auto_83540 ) ) ( ON ?auto_83535 ?auto_83542 ) ( not ( = ?auto_83535 ?auto_83542 ) ) ( not ( = ?auto_83536 ?auto_83542 ) ) ( not ( = ?auto_83537 ?auto_83542 ) ) ( not ( = ?auto_83538 ?auto_83542 ) ) ( not ( = ?auto_83539 ?auto_83542 ) ) ( not ( = ?auto_83541 ?auto_83542 ) ) ( not ( = ?auto_83540 ?auto_83542 ) ) ( ON ?auto_83536 ?auto_83535 ) ( ON-TABLE ?auto_83542 ) ( ON ?auto_83537 ?auto_83536 ) ( ON ?auto_83538 ?auto_83537 ) ( ON ?auto_83539 ?auto_83538 ) ( CLEAR ?auto_83539 ) ( HOLDING ?auto_83541 ) ( CLEAR ?auto_83540 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83540 ?auto_83541 )
      ( MAKE-5PILE ?auto_83535 ?auto_83536 ?auto_83537 ?auto_83538 ?auto_83539 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83543 - BLOCK
      ?auto_83544 - BLOCK
      ?auto_83545 - BLOCK
      ?auto_83546 - BLOCK
      ?auto_83547 - BLOCK
    )
    :vars
    (
      ?auto_83550 - BLOCK
      ?auto_83548 - BLOCK
      ?auto_83549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83543 ?auto_83544 ) ) ( not ( = ?auto_83543 ?auto_83545 ) ) ( not ( = ?auto_83543 ?auto_83546 ) ) ( not ( = ?auto_83543 ?auto_83547 ) ) ( not ( = ?auto_83544 ?auto_83545 ) ) ( not ( = ?auto_83544 ?auto_83546 ) ) ( not ( = ?auto_83544 ?auto_83547 ) ) ( not ( = ?auto_83545 ?auto_83546 ) ) ( not ( = ?auto_83545 ?auto_83547 ) ) ( not ( = ?auto_83546 ?auto_83547 ) ) ( not ( = ?auto_83543 ?auto_83550 ) ) ( not ( = ?auto_83544 ?auto_83550 ) ) ( not ( = ?auto_83545 ?auto_83550 ) ) ( not ( = ?auto_83546 ?auto_83550 ) ) ( not ( = ?auto_83547 ?auto_83550 ) ) ( ON-TABLE ?auto_83548 ) ( not ( = ?auto_83548 ?auto_83550 ) ) ( not ( = ?auto_83548 ?auto_83547 ) ) ( not ( = ?auto_83548 ?auto_83546 ) ) ( not ( = ?auto_83543 ?auto_83548 ) ) ( not ( = ?auto_83544 ?auto_83548 ) ) ( not ( = ?auto_83545 ?auto_83548 ) ) ( ON ?auto_83543 ?auto_83549 ) ( not ( = ?auto_83543 ?auto_83549 ) ) ( not ( = ?auto_83544 ?auto_83549 ) ) ( not ( = ?auto_83545 ?auto_83549 ) ) ( not ( = ?auto_83546 ?auto_83549 ) ) ( not ( = ?auto_83547 ?auto_83549 ) ) ( not ( = ?auto_83550 ?auto_83549 ) ) ( not ( = ?auto_83548 ?auto_83549 ) ) ( ON ?auto_83544 ?auto_83543 ) ( ON-TABLE ?auto_83549 ) ( ON ?auto_83545 ?auto_83544 ) ( ON ?auto_83546 ?auto_83545 ) ( ON ?auto_83547 ?auto_83546 ) ( CLEAR ?auto_83548 ) ( ON ?auto_83550 ?auto_83547 ) ( CLEAR ?auto_83550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83549 ?auto_83543 ?auto_83544 ?auto_83545 ?auto_83546 ?auto_83547 )
      ( MAKE-5PILE ?auto_83543 ?auto_83544 ?auto_83545 ?auto_83546 ?auto_83547 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83551 - BLOCK
      ?auto_83552 - BLOCK
      ?auto_83553 - BLOCK
      ?auto_83554 - BLOCK
      ?auto_83555 - BLOCK
    )
    :vars
    (
      ?auto_83557 - BLOCK
      ?auto_83558 - BLOCK
      ?auto_83556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83551 ?auto_83552 ) ) ( not ( = ?auto_83551 ?auto_83553 ) ) ( not ( = ?auto_83551 ?auto_83554 ) ) ( not ( = ?auto_83551 ?auto_83555 ) ) ( not ( = ?auto_83552 ?auto_83553 ) ) ( not ( = ?auto_83552 ?auto_83554 ) ) ( not ( = ?auto_83552 ?auto_83555 ) ) ( not ( = ?auto_83553 ?auto_83554 ) ) ( not ( = ?auto_83553 ?auto_83555 ) ) ( not ( = ?auto_83554 ?auto_83555 ) ) ( not ( = ?auto_83551 ?auto_83557 ) ) ( not ( = ?auto_83552 ?auto_83557 ) ) ( not ( = ?auto_83553 ?auto_83557 ) ) ( not ( = ?auto_83554 ?auto_83557 ) ) ( not ( = ?auto_83555 ?auto_83557 ) ) ( not ( = ?auto_83558 ?auto_83557 ) ) ( not ( = ?auto_83558 ?auto_83555 ) ) ( not ( = ?auto_83558 ?auto_83554 ) ) ( not ( = ?auto_83551 ?auto_83558 ) ) ( not ( = ?auto_83552 ?auto_83558 ) ) ( not ( = ?auto_83553 ?auto_83558 ) ) ( ON ?auto_83551 ?auto_83556 ) ( not ( = ?auto_83551 ?auto_83556 ) ) ( not ( = ?auto_83552 ?auto_83556 ) ) ( not ( = ?auto_83553 ?auto_83556 ) ) ( not ( = ?auto_83554 ?auto_83556 ) ) ( not ( = ?auto_83555 ?auto_83556 ) ) ( not ( = ?auto_83557 ?auto_83556 ) ) ( not ( = ?auto_83558 ?auto_83556 ) ) ( ON ?auto_83552 ?auto_83551 ) ( ON-TABLE ?auto_83556 ) ( ON ?auto_83553 ?auto_83552 ) ( ON ?auto_83554 ?auto_83553 ) ( ON ?auto_83555 ?auto_83554 ) ( ON ?auto_83557 ?auto_83555 ) ( CLEAR ?auto_83557 ) ( HOLDING ?auto_83558 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83558 )
      ( MAKE-5PILE ?auto_83551 ?auto_83552 ?auto_83553 ?auto_83554 ?auto_83555 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83559 - BLOCK
      ?auto_83560 - BLOCK
      ?auto_83561 - BLOCK
      ?auto_83562 - BLOCK
      ?auto_83563 - BLOCK
    )
    :vars
    (
      ?auto_83565 - BLOCK
      ?auto_83566 - BLOCK
      ?auto_83564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83559 ?auto_83560 ) ) ( not ( = ?auto_83559 ?auto_83561 ) ) ( not ( = ?auto_83559 ?auto_83562 ) ) ( not ( = ?auto_83559 ?auto_83563 ) ) ( not ( = ?auto_83560 ?auto_83561 ) ) ( not ( = ?auto_83560 ?auto_83562 ) ) ( not ( = ?auto_83560 ?auto_83563 ) ) ( not ( = ?auto_83561 ?auto_83562 ) ) ( not ( = ?auto_83561 ?auto_83563 ) ) ( not ( = ?auto_83562 ?auto_83563 ) ) ( not ( = ?auto_83559 ?auto_83565 ) ) ( not ( = ?auto_83560 ?auto_83565 ) ) ( not ( = ?auto_83561 ?auto_83565 ) ) ( not ( = ?auto_83562 ?auto_83565 ) ) ( not ( = ?auto_83563 ?auto_83565 ) ) ( not ( = ?auto_83566 ?auto_83565 ) ) ( not ( = ?auto_83566 ?auto_83563 ) ) ( not ( = ?auto_83566 ?auto_83562 ) ) ( not ( = ?auto_83559 ?auto_83566 ) ) ( not ( = ?auto_83560 ?auto_83566 ) ) ( not ( = ?auto_83561 ?auto_83566 ) ) ( ON ?auto_83559 ?auto_83564 ) ( not ( = ?auto_83559 ?auto_83564 ) ) ( not ( = ?auto_83560 ?auto_83564 ) ) ( not ( = ?auto_83561 ?auto_83564 ) ) ( not ( = ?auto_83562 ?auto_83564 ) ) ( not ( = ?auto_83563 ?auto_83564 ) ) ( not ( = ?auto_83565 ?auto_83564 ) ) ( not ( = ?auto_83566 ?auto_83564 ) ) ( ON ?auto_83560 ?auto_83559 ) ( ON-TABLE ?auto_83564 ) ( ON ?auto_83561 ?auto_83560 ) ( ON ?auto_83562 ?auto_83561 ) ( ON ?auto_83563 ?auto_83562 ) ( ON ?auto_83565 ?auto_83563 ) ( ON ?auto_83566 ?auto_83565 ) ( CLEAR ?auto_83566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83564 ?auto_83559 ?auto_83560 ?auto_83561 ?auto_83562 ?auto_83563 ?auto_83565 )
      ( MAKE-5PILE ?auto_83559 ?auto_83560 ?auto_83561 ?auto_83562 ?auto_83563 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83578 - BLOCK
    )
    :vars
    (
      ?auto_83581 - BLOCK
      ?auto_83580 - BLOCK
      ?auto_83579 - BLOCK
      ?auto_83582 - BLOCK
      ?auto_83583 - BLOCK
      ?auto_83584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83581 ?auto_83578 ) ( ON-TABLE ?auto_83578 ) ( not ( = ?auto_83578 ?auto_83581 ) ) ( not ( = ?auto_83578 ?auto_83580 ) ) ( not ( = ?auto_83578 ?auto_83579 ) ) ( not ( = ?auto_83581 ?auto_83580 ) ) ( not ( = ?auto_83581 ?auto_83579 ) ) ( not ( = ?auto_83580 ?auto_83579 ) ) ( ON ?auto_83580 ?auto_83581 ) ( CLEAR ?auto_83580 ) ( HOLDING ?auto_83579 ) ( CLEAR ?auto_83582 ) ( ON-TABLE ?auto_83583 ) ( ON ?auto_83584 ?auto_83583 ) ( ON ?auto_83582 ?auto_83584 ) ( not ( = ?auto_83583 ?auto_83584 ) ) ( not ( = ?auto_83583 ?auto_83582 ) ) ( not ( = ?auto_83583 ?auto_83579 ) ) ( not ( = ?auto_83584 ?auto_83582 ) ) ( not ( = ?auto_83584 ?auto_83579 ) ) ( not ( = ?auto_83582 ?auto_83579 ) ) ( not ( = ?auto_83578 ?auto_83582 ) ) ( not ( = ?auto_83578 ?auto_83583 ) ) ( not ( = ?auto_83578 ?auto_83584 ) ) ( not ( = ?auto_83581 ?auto_83582 ) ) ( not ( = ?auto_83581 ?auto_83583 ) ) ( not ( = ?auto_83581 ?auto_83584 ) ) ( not ( = ?auto_83580 ?auto_83582 ) ) ( not ( = ?auto_83580 ?auto_83583 ) ) ( not ( = ?auto_83580 ?auto_83584 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83583 ?auto_83584 ?auto_83582 ?auto_83579 )
      ( MAKE-1PILE ?auto_83578 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83585 - BLOCK
    )
    :vars
    (
      ?auto_83591 - BLOCK
      ?auto_83590 - BLOCK
      ?auto_83589 - BLOCK
      ?auto_83586 - BLOCK
      ?auto_83588 - BLOCK
      ?auto_83587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83591 ?auto_83585 ) ( ON-TABLE ?auto_83585 ) ( not ( = ?auto_83585 ?auto_83591 ) ) ( not ( = ?auto_83585 ?auto_83590 ) ) ( not ( = ?auto_83585 ?auto_83589 ) ) ( not ( = ?auto_83591 ?auto_83590 ) ) ( not ( = ?auto_83591 ?auto_83589 ) ) ( not ( = ?auto_83590 ?auto_83589 ) ) ( ON ?auto_83590 ?auto_83591 ) ( CLEAR ?auto_83586 ) ( ON-TABLE ?auto_83588 ) ( ON ?auto_83587 ?auto_83588 ) ( ON ?auto_83586 ?auto_83587 ) ( not ( = ?auto_83588 ?auto_83587 ) ) ( not ( = ?auto_83588 ?auto_83586 ) ) ( not ( = ?auto_83588 ?auto_83589 ) ) ( not ( = ?auto_83587 ?auto_83586 ) ) ( not ( = ?auto_83587 ?auto_83589 ) ) ( not ( = ?auto_83586 ?auto_83589 ) ) ( not ( = ?auto_83585 ?auto_83586 ) ) ( not ( = ?auto_83585 ?auto_83588 ) ) ( not ( = ?auto_83585 ?auto_83587 ) ) ( not ( = ?auto_83591 ?auto_83586 ) ) ( not ( = ?auto_83591 ?auto_83588 ) ) ( not ( = ?auto_83591 ?auto_83587 ) ) ( not ( = ?auto_83590 ?auto_83586 ) ) ( not ( = ?auto_83590 ?auto_83588 ) ) ( not ( = ?auto_83590 ?auto_83587 ) ) ( ON ?auto_83589 ?auto_83590 ) ( CLEAR ?auto_83589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83585 ?auto_83591 ?auto_83590 )
      ( MAKE-1PILE ?auto_83585 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83592 - BLOCK
    )
    :vars
    (
      ?auto_83596 - BLOCK
      ?auto_83597 - BLOCK
      ?auto_83598 - BLOCK
      ?auto_83594 - BLOCK
      ?auto_83593 - BLOCK
      ?auto_83595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83596 ?auto_83592 ) ( ON-TABLE ?auto_83592 ) ( not ( = ?auto_83592 ?auto_83596 ) ) ( not ( = ?auto_83592 ?auto_83597 ) ) ( not ( = ?auto_83592 ?auto_83598 ) ) ( not ( = ?auto_83596 ?auto_83597 ) ) ( not ( = ?auto_83596 ?auto_83598 ) ) ( not ( = ?auto_83597 ?auto_83598 ) ) ( ON ?auto_83597 ?auto_83596 ) ( ON-TABLE ?auto_83594 ) ( ON ?auto_83593 ?auto_83594 ) ( not ( = ?auto_83594 ?auto_83593 ) ) ( not ( = ?auto_83594 ?auto_83595 ) ) ( not ( = ?auto_83594 ?auto_83598 ) ) ( not ( = ?auto_83593 ?auto_83595 ) ) ( not ( = ?auto_83593 ?auto_83598 ) ) ( not ( = ?auto_83595 ?auto_83598 ) ) ( not ( = ?auto_83592 ?auto_83595 ) ) ( not ( = ?auto_83592 ?auto_83594 ) ) ( not ( = ?auto_83592 ?auto_83593 ) ) ( not ( = ?auto_83596 ?auto_83595 ) ) ( not ( = ?auto_83596 ?auto_83594 ) ) ( not ( = ?auto_83596 ?auto_83593 ) ) ( not ( = ?auto_83597 ?auto_83595 ) ) ( not ( = ?auto_83597 ?auto_83594 ) ) ( not ( = ?auto_83597 ?auto_83593 ) ) ( ON ?auto_83598 ?auto_83597 ) ( CLEAR ?auto_83598 ) ( HOLDING ?auto_83595 ) ( CLEAR ?auto_83593 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83594 ?auto_83593 ?auto_83595 )
      ( MAKE-1PILE ?auto_83592 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83599 - BLOCK
    )
    :vars
    (
      ?auto_83603 - BLOCK
      ?auto_83600 - BLOCK
      ?auto_83602 - BLOCK
      ?auto_83605 - BLOCK
      ?auto_83601 - BLOCK
      ?auto_83604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83603 ?auto_83599 ) ( ON-TABLE ?auto_83599 ) ( not ( = ?auto_83599 ?auto_83603 ) ) ( not ( = ?auto_83599 ?auto_83600 ) ) ( not ( = ?auto_83599 ?auto_83602 ) ) ( not ( = ?auto_83603 ?auto_83600 ) ) ( not ( = ?auto_83603 ?auto_83602 ) ) ( not ( = ?auto_83600 ?auto_83602 ) ) ( ON ?auto_83600 ?auto_83603 ) ( ON-TABLE ?auto_83605 ) ( ON ?auto_83601 ?auto_83605 ) ( not ( = ?auto_83605 ?auto_83601 ) ) ( not ( = ?auto_83605 ?auto_83604 ) ) ( not ( = ?auto_83605 ?auto_83602 ) ) ( not ( = ?auto_83601 ?auto_83604 ) ) ( not ( = ?auto_83601 ?auto_83602 ) ) ( not ( = ?auto_83604 ?auto_83602 ) ) ( not ( = ?auto_83599 ?auto_83604 ) ) ( not ( = ?auto_83599 ?auto_83605 ) ) ( not ( = ?auto_83599 ?auto_83601 ) ) ( not ( = ?auto_83603 ?auto_83604 ) ) ( not ( = ?auto_83603 ?auto_83605 ) ) ( not ( = ?auto_83603 ?auto_83601 ) ) ( not ( = ?auto_83600 ?auto_83604 ) ) ( not ( = ?auto_83600 ?auto_83605 ) ) ( not ( = ?auto_83600 ?auto_83601 ) ) ( ON ?auto_83602 ?auto_83600 ) ( CLEAR ?auto_83601 ) ( ON ?auto_83604 ?auto_83602 ) ( CLEAR ?auto_83604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83599 ?auto_83603 ?auto_83600 ?auto_83602 )
      ( MAKE-1PILE ?auto_83599 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83606 - BLOCK
    )
    :vars
    (
      ?auto_83608 - BLOCK
      ?auto_83609 - BLOCK
      ?auto_83607 - BLOCK
      ?auto_83612 - BLOCK
      ?auto_83611 - BLOCK
      ?auto_83610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83608 ?auto_83606 ) ( ON-TABLE ?auto_83606 ) ( not ( = ?auto_83606 ?auto_83608 ) ) ( not ( = ?auto_83606 ?auto_83609 ) ) ( not ( = ?auto_83606 ?auto_83607 ) ) ( not ( = ?auto_83608 ?auto_83609 ) ) ( not ( = ?auto_83608 ?auto_83607 ) ) ( not ( = ?auto_83609 ?auto_83607 ) ) ( ON ?auto_83609 ?auto_83608 ) ( ON-TABLE ?auto_83612 ) ( not ( = ?auto_83612 ?auto_83611 ) ) ( not ( = ?auto_83612 ?auto_83610 ) ) ( not ( = ?auto_83612 ?auto_83607 ) ) ( not ( = ?auto_83611 ?auto_83610 ) ) ( not ( = ?auto_83611 ?auto_83607 ) ) ( not ( = ?auto_83610 ?auto_83607 ) ) ( not ( = ?auto_83606 ?auto_83610 ) ) ( not ( = ?auto_83606 ?auto_83612 ) ) ( not ( = ?auto_83606 ?auto_83611 ) ) ( not ( = ?auto_83608 ?auto_83610 ) ) ( not ( = ?auto_83608 ?auto_83612 ) ) ( not ( = ?auto_83608 ?auto_83611 ) ) ( not ( = ?auto_83609 ?auto_83610 ) ) ( not ( = ?auto_83609 ?auto_83612 ) ) ( not ( = ?auto_83609 ?auto_83611 ) ) ( ON ?auto_83607 ?auto_83609 ) ( ON ?auto_83610 ?auto_83607 ) ( CLEAR ?auto_83610 ) ( HOLDING ?auto_83611 ) ( CLEAR ?auto_83612 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83612 ?auto_83611 )
      ( MAKE-1PILE ?auto_83606 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83613 - BLOCK
    )
    :vars
    (
      ?auto_83619 - BLOCK
      ?auto_83616 - BLOCK
      ?auto_83617 - BLOCK
      ?auto_83618 - BLOCK
      ?auto_83614 - BLOCK
      ?auto_83615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83619 ?auto_83613 ) ( ON-TABLE ?auto_83613 ) ( not ( = ?auto_83613 ?auto_83619 ) ) ( not ( = ?auto_83613 ?auto_83616 ) ) ( not ( = ?auto_83613 ?auto_83617 ) ) ( not ( = ?auto_83619 ?auto_83616 ) ) ( not ( = ?auto_83619 ?auto_83617 ) ) ( not ( = ?auto_83616 ?auto_83617 ) ) ( ON ?auto_83616 ?auto_83619 ) ( ON-TABLE ?auto_83618 ) ( not ( = ?auto_83618 ?auto_83614 ) ) ( not ( = ?auto_83618 ?auto_83615 ) ) ( not ( = ?auto_83618 ?auto_83617 ) ) ( not ( = ?auto_83614 ?auto_83615 ) ) ( not ( = ?auto_83614 ?auto_83617 ) ) ( not ( = ?auto_83615 ?auto_83617 ) ) ( not ( = ?auto_83613 ?auto_83615 ) ) ( not ( = ?auto_83613 ?auto_83618 ) ) ( not ( = ?auto_83613 ?auto_83614 ) ) ( not ( = ?auto_83619 ?auto_83615 ) ) ( not ( = ?auto_83619 ?auto_83618 ) ) ( not ( = ?auto_83619 ?auto_83614 ) ) ( not ( = ?auto_83616 ?auto_83615 ) ) ( not ( = ?auto_83616 ?auto_83618 ) ) ( not ( = ?auto_83616 ?auto_83614 ) ) ( ON ?auto_83617 ?auto_83616 ) ( ON ?auto_83615 ?auto_83617 ) ( CLEAR ?auto_83618 ) ( ON ?auto_83614 ?auto_83615 ) ( CLEAR ?auto_83614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83613 ?auto_83619 ?auto_83616 ?auto_83617 ?auto_83615 )
      ( MAKE-1PILE ?auto_83613 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83620 - BLOCK
    )
    :vars
    (
      ?auto_83623 - BLOCK
      ?auto_83626 - BLOCK
      ?auto_83624 - BLOCK
      ?auto_83625 - BLOCK
      ?auto_83621 - BLOCK
      ?auto_83622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83623 ?auto_83620 ) ( ON-TABLE ?auto_83620 ) ( not ( = ?auto_83620 ?auto_83623 ) ) ( not ( = ?auto_83620 ?auto_83626 ) ) ( not ( = ?auto_83620 ?auto_83624 ) ) ( not ( = ?auto_83623 ?auto_83626 ) ) ( not ( = ?auto_83623 ?auto_83624 ) ) ( not ( = ?auto_83626 ?auto_83624 ) ) ( ON ?auto_83626 ?auto_83623 ) ( not ( = ?auto_83625 ?auto_83621 ) ) ( not ( = ?auto_83625 ?auto_83622 ) ) ( not ( = ?auto_83625 ?auto_83624 ) ) ( not ( = ?auto_83621 ?auto_83622 ) ) ( not ( = ?auto_83621 ?auto_83624 ) ) ( not ( = ?auto_83622 ?auto_83624 ) ) ( not ( = ?auto_83620 ?auto_83622 ) ) ( not ( = ?auto_83620 ?auto_83625 ) ) ( not ( = ?auto_83620 ?auto_83621 ) ) ( not ( = ?auto_83623 ?auto_83622 ) ) ( not ( = ?auto_83623 ?auto_83625 ) ) ( not ( = ?auto_83623 ?auto_83621 ) ) ( not ( = ?auto_83626 ?auto_83622 ) ) ( not ( = ?auto_83626 ?auto_83625 ) ) ( not ( = ?auto_83626 ?auto_83621 ) ) ( ON ?auto_83624 ?auto_83626 ) ( ON ?auto_83622 ?auto_83624 ) ( ON ?auto_83621 ?auto_83622 ) ( CLEAR ?auto_83621 ) ( HOLDING ?auto_83625 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83625 )
      ( MAKE-1PILE ?auto_83620 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83635 - BLOCK
    )
    :vars
    (
      ?auto_83641 - BLOCK
      ?auto_83638 - BLOCK
      ?auto_83636 - BLOCK
      ?auto_83640 - BLOCK
      ?auto_83639 - BLOCK
      ?auto_83637 - BLOCK
      ?auto_83642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83641 ?auto_83635 ) ( ON-TABLE ?auto_83635 ) ( not ( = ?auto_83635 ?auto_83641 ) ) ( not ( = ?auto_83635 ?auto_83638 ) ) ( not ( = ?auto_83635 ?auto_83636 ) ) ( not ( = ?auto_83641 ?auto_83638 ) ) ( not ( = ?auto_83641 ?auto_83636 ) ) ( not ( = ?auto_83638 ?auto_83636 ) ) ( ON ?auto_83638 ?auto_83641 ) ( not ( = ?auto_83640 ?auto_83639 ) ) ( not ( = ?auto_83640 ?auto_83637 ) ) ( not ( = ?auto_83640 ?auto_83636 ) ) ( not ( = ?auto_83639 ?auto_83637 ) ) ( not ( = ?auto_83639 ?auto_83636 ) ) ( not ( = ?auto_83637 ?auto_83636 ) ) ( not ( = ?auto_83635 ?auto_83637 ) ) ( not ( = ?auto_83635 ?auto_83640 ) ) ( not ( = ?auto_83635 ?auto_83639 ) ) ( not ( = ?auto_83641 ?auto_83637 ) ) ( not ( = ?auto_83641 ?auto_83640 ) ) ( not ( = ?auto_83641 ?auto_83639 ) ) ( not ( = ?auto_83638 ?auto_83637 ) ) ( not ( = ?auto_83638 ?auto_83640 ) ) ( not ( = ?auto_83638 ?auto_83639 ) ) ( ON ?auto_83636 ?auto_83638 ) ( ON ?auto_83637 ?auto_83636 ) ( ON ?auto_83639 ?auto_83637 ) ( CLEAR ?auto_83639 ) ( ON ?auto_83640 ?auto_83642 ) ( CLEAR ?auto_83640 ) ( HAND-EMPTY ) ( not ( = ?auto_83635 ?auto_83642 ) ) ( not ( = ?auto_83641 ?auto_83642 ) ) ( not ( = ?auto_83638 ?auto_83642 ) ) ( not ( = ?auto_83636 ?auto_83642 ) ) ( not ( = ?auto_83640 ?auto_83642 ) ) ( not ( = ?auto_83639 ?auto_83642 ) ) ( not ( = ?auto_83637 ?auto_83642 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83640 ?auto_83642 )
      ( MAKE-1PILE ?auto_83635 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83643 - BLOCK
    )
    :vars
    (
      ?auto_83644 - BLOCK
      ?auto_83646 - BLOCK
      ?auto_83649 - BLOCK
      ?auto_83647 - BLOCK
      ?auto_83650 - BLOCK
      ?auto_83648 - BLOCK
      ?auto_83645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83644 ?auto_83643 ) ( ON-TABLE ?auto_83643 ) ( not ( = ?auto_83643 ?auto_83644 ) ) ( not ( = ?auto_83643 ?auto_83646 ) ) ( not ( = ?auto_83643 ?auto_83649 ) ) ( not ( = ?auto_83644 ?auto_83646 ) ) ( not ( = ?auto_83644 ?auto_83649 ) ) ( not ( = ?auto_83646 ?auto_83649 ) ) ( ON ?auto_83646 ?auto_83644 ) ( not ( = ?auto_83647 ?auto_83650 ) ) ( not ( = ?auto_83647 ?auto_83648 ) ) ( not ( = ?auto_83647 ?auto_83649 ) ) ( not ( = ?auto_83650 ?auto_83648 ) ) ( not ( = ?auto_83650 ?auto_83649 ) ) ( not ( = ?auto_83648 ?auto_83649 ) ) ( not ( = ?auto_83643 ?auto_83648 ) ) ( not ( = ?auto_83643 ?auto_83647 ) ) ( not ( = ?auto_83643 ?auto_83650 ) ) ( not ( = ?auto_83644 ?auto_83648 ) ) ( not ( = ?auto_83644 ?auto_83647 ) ) ( not ( = ?auto_83644 ?auto_83650 ) ) ( not ( = ?auto_83646 ?auto_83648 ) ) ( not ( = ?auto_83646 ?auto_83647 ) ) ( not ( = ?auto_83646 ?auto_83650 ) ) ( ON ?auto_83649 ?auto_83646 ) ( ON ?auto_83648 ?auto_83649 ) ( ON ?auto_83647 ?auto_83645 ) ( CLEAR ?auto_83647 ) ( not ( = ?auto_83643 ?auto_83645 ) ) ( not ( = ?auto_83644 ?auto_83645 ) ) ( not ( = ?auto_83646 ?auto_83645 ) ) ( not ( = ?auto_83649 ?auto_83645 ) ) ( not ( = ?auto_83647 ?auto_83645 ) ) ( not ( = ?auto_83650 ?auto_83645 ) ) ( not ( = ?auto_83648 ?auto_83645 ) ) ( HOLDING ?auto_83650 ) ( CLEAR ?auto_83648 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83643 ?auto_83644 ?auto_83646 ?auto_83649 ?auto_83648 ?auto_83650 )
      ( MAKE-1PILE ?auto_83643 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83651 - BLOCK
    )
    :vars
    (
      ?auto_83654 - BLOCK
      ?auto_83656 - BLOCK
      ?auto_83653 - BLOCK
      ?auto_83652 - BLOCK
      ?auto_83658 - BLOCK
      ?auto_83657 - BLOCK
      ?auto_83655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83654 ?auto_83651 ) ( ON-TABLE ?auto_83651 ) ( not ( = ?auto_83651 ?auto_83654 ) ) ( not ( = ?auto_83651 ?auto_83656 ) ) ( not ( = ?auto_83651 ?auto_83653 ) ) ( not ( = ?auto_83654 ?auto_83656 ) ) ( not ( = ?auto_83654 ?auto_83653 ) ) ( not ( = ?auto_83656 ?auto_83653 ) ) ( ON ?auto_83656 ?auto_83654 ) ( not ( = ?auto_83652 ?auto_83658 ) ) ( not ( = ?auto_83652 ?auto_83657 ) ) ( not ( = ?auto_83652 ?auto_83653 ) ) ( not ( = ?auto_83658 ?auto_83657 ) ) ( not ( = ?auto_83658 ?auto_83653 ) ) ( not ( = ?auto_83657 ?auto_83653 ) ) ( not ( = ?auto_83651 ?auto_83657 ) ) ( not ( = ?auto_83651 ?auto_83652 ) ) ( not ( = ?auto_83651 ?auto_83658 ) ) ( not ( = ?auto_83654 ?auto_83657 ) ) ( not ( = ?auto_83654 ?auto_83652 ) ) ( not ( = ?auto_83654 ?auto_83658 ) ) ( not ( = ?auto_83656 ?auto_83657 ) ) ( not ( = ?auto_83656 ?auto_83652 ) ) ( not ( = ?auto_83656 ?auto_83658 ) ) ( ON ?auto_83653 ?auto_83656 ) ( ON ?auto_83657 ?auto_83653 ) ( ON ?auto_83652 ?auto_83655 ) ( not ( = ?auto_83651 ?auto_83655 ) ) ( not ( = ?auto_83654 ?auto_83655 ) ) ( not ( = ?auto_83656 ?auto_83655 ) ) ( not ( = ?auto_83653 ?auto_83655 ) ) ( not ( = ?auto_83652 ?auto_83655 ) ) ( not ( = ?auto_83658 ?auto_83655 ) ) ( not ( = ?auto_83657 ?auto_83655 ) ) ( CLEAR ?auto_83657 ) ( ON ?auto_83658 ?auto_83652 ) ( CLEAR ?auto_83658 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83655 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83655 ?auto_83652 )
      ( MAKE-1PILE ?auto_83651 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83659 - BLOCK
    )
    :vars
    (
      ?auto_83661 - BLOCK
      ?auto_83666 - BLOCK
      ?auto_83660 - BLOCK
      ?auto_83664 - BLOCK
      ?auto_83662 - BLOCK
      ?auto_83665 - BLOCK
      ?auto_83663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83661 ?auto_83659 ) ( ON-TABLE ?auto_83659 ) ( not ( = ?auto_83659 ?auto_83661 ) ) ( not ( = ?auto_83659 ?auto_83666 ) ) ( not ( = ?auto_83659 ?auto_83660 ) ) ( not ( = ?auto_83661 ?auto_83666 ) ) ( not ( = ?auto_83661 ?auto_83660 ) ) ( not ( = ?auto_83666 ?auto_83660 ) ) ( ON ?auto_83666 ?auto_83661 ) ( not ( = ?auto_83664 ?auto_83662 ) ) ( not ( = ?auto_83664 ?auto_83665 ) ) ( not ( = ?auto_83664 ?auto_83660 ) ) ( not ( = ?auto_83662 ?auto_83665 ) ) ( not ( = ?auto_83662 ?auto_83660 ) ) ( not ( = ?auto_83665 ?auto_83660 ) ) ( not ( = ?auto_83659 ?auto_83665 ) ) ( not ( = ?auto_83659 ?auto_83664 ) ) ( not ( = ?auto_83659 ?auto_83662 ) ) ( not ( = ?auto_83661 ?auto_83665 ) ) ( not ( = ?auto_83661 ?auto_83664 ) ) ( not ( = ?auto_83661 ?auto_83662 ) ) ( not ( = ?auto_83666 ?auto_83665 ) ) ( not ( = ?auto_83666 ?auto_83664 ) ) ( not ( = ?auto_83666 ?auto_83662 ) ) ( ON ?auto_83660 ?auto_83666 ) ( ON ?auto_83664 ?auto_83663 ) ( not ( = ?auto_83659 ?auto_83663 ) ) ( not ( = ?auto_83661 ?auto_83663 ) ) ( not ( = ?auto_83666 ?auto_83663 ) ) ( not ( = ?auto_83660 ?auto_83663 ) ) ( not ( = ?auto_83664 ?auto_83663 ) ) ( not ( = ?auto_83662 ?auto_83663 ) ) ( not ( = ?auto_83665 ?auto_83663 ) ) ( ON ?auto_83662 ?auto_83664 ) ( CLEAR ?auto_83662 ) ( ON-TABLE ?auto_83663 ) ( HOLDING ?auto_83665 ) ( CLEAR ?auto_83660 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83659 ?auto_83661 ?auto_83666 ?auto_83660 ?auto_83665 )
      ( MAKE-1PILE ?auto_83659 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83705 - BLOCK
      ?auto_83706 - BLOCK
      ?auto_83707 - BLOCK
      ?auto_83708 - BLOCK
      ?auto_83709 - BLOCK
      ?auto_83710 - BLOCK
    )
    :vars
    (
      ?auto_83711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83705 ) ( ON ?auto_83706 ?auto_83705 ) ( ON ?auto_83707 ?auto_83706 ) ( ON ?auto_83708 ?auto_83707 ) ( not ( = ?auto_83705 ?auto_83706 ) ) ( not ( = ?auto_83705 ?auto_83707 ) ) ( not ( = ?auto_83705 ?auto_83708 ) ) ( not ( = ?auto_83705 ?auto_83709 ) ) ( not ( = ?auto_83705 ?auto_83710 ) ) ( not ( = ?auto_83706 ?auto_83707 ) ) ( not ( = ?auto_83706 ?auto_83708 ) ) ( not ( = ?auto_83706 ?auto_83709 ) ) ( not ( = ?auto_83706 ?auto_83710 ) ) ( not ( = ?auto_83707 ?auto_83708 ) ) ( not ( = ?auto_83707 ?auto_83709 ) ) ( not ( = ?auto_83707 ?auto_83710 ) ) ( not ( = ?auto_83708 ?auto_83709 ) ) ( not ( = ?auto_83708 ?auto_83710 ) ) ( not ( = ?auto_83709 ?auto_83710 ) ) ( ON ?auto_83710 ?auto_83711 ) ( not ( = ?auto_83705 ?auto_83711 ) ) ( not ( = ?auto_83706 ?auto_83711 ) ) ( not ( = ?auto_83707 ?auto_83711 ) ) ( not ( = ?auto_83708 ?auto_83711 ) ) ( not ( = ?auto_83709 ?auto_83711 ) ) ( not ( = ?auto_83710 ?auto_83711 ) ) ( CLEAR ?auto_83708 ) ( ON ?auto_83709 ?auto_83710 ) ( CLEAR ?auto_83709 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83711 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83711 ?auto_83710 )
      ( MAKE-6PILE ?auto_83705 ?auto_83706 ?auto_83707 ?auto_83708 ?auto_83709 ?auto_83710 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83712 - BLOCK
      ?auto_83713 - BLOCK
      ?auto_83714 - BLOCK
      ?auto_83715 - BLOCK
      ?auto_83716 - BLOCK
      ?auto_83717 - BLOCK
    )
    :vars
    (
      ?auto_83718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83712 ) ( ON ?auto_83713 ?auto_83712 ) ( ON ?auto_83714 ?auto_83713 ) ( not ( = ?auto_83712 ?auto_83713 ) ) ( not ( = ?auto_83712 ?auto_83714 ) ) ( not ( = ?auto_83712 ?auto_83715 ) ) ( not ( = ?auto_83712 ?auto_83716 ) ) ( not ( = ?auto_83712 ?auto_83717 ) ) ( not ( = ?auto_83713 ?auto_83714 ) ) ( not ( = ?auto_83713 ?auto_83715 ) ) ( not ( = ?auto_83713 ?auto_83716 ) ) ( not ( = ?auto_83713 ?auto_83717 ) ) ( not ( = ?auto_83714 ?auto_83715 ) ) ( not ( = ?auto_83714 ?auto_83716 ) ) ( not ( = ?auto_83714 ?auto_83717 ) ) ( not ( = ?auto_83715 ?auto_83716 ) ) ( not ( = ?auto_83715 ?auto_83717 ) ) ( not ( = ?auto_83716 ?auto_83717 ) ) ( ON ?auto_83717 ?auto_83718 ) ( not ( = ?auto_83712 ?auto_83718 ) ) ( not ( = ?auto_83713 ?auto_83718 ) ) ( not ( = ?auto_83714 ?auto_83718 ) ) ( not ( = ?auto_83715 ?auto_83718 ) ) ( not ( = ?auto_83716 ?auto_83718 ) ) ( not ( = ?auto_83717 ?auto_83718 ) ) ( ON ?auto_83716 ?auto_83717 ) ( CLEAR ?auto_83716 ) ( ON-TABLE ?auto_83718 ) ( HOLDING ?auto_83715 ) ( CLEAR ?auto_83714 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83712 ?auto_83713 ?auto_83714 ?auto_83715 )
      ( MAKE-6PILE ?auto_83712 ?auto_83713 ?auto_83714 ?auto_83715 ?auto_83716 ?auto_83717 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83719 - BLOCK
      ?auto_83720 - BLOCK
      ?auto_83721 - BLOCK
      ?auto_83722 - BLOCK
      ?auto_83723 - BLOCK
      ?auto_83724 - BLOCK
    )
    :vars
    (
      ?auto_83725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83719 ) ( ON ?auto_83720 ?auto_83719 ) ( ON ?auto_83721 ?auto_83720 ) ( not ( = ?auto_83719 ?auto_83720 ) ) ( not ( = ?auto_83719 ?auto_83721 ) ) ( not ( = ?auto_83719 ?auto_83722 ) ) ( not ( = ?auto_83719 ?auto_83723 ) ) ( not ( = ?auto_83719 ?auto_83724 ) ) ( not ( = ?auto_83720 ?auto_83721 ) ) ( not ( = ?auto_83720 ?auto_83722 ) ) ( not ( = ?auto_83720 ?auto_83723 ) ) ( not ( = ?auto_83720 ?auto_83724 ) ) ( not ( = ?auto_83721 ?auto_83722 ) ) ( not ( = ?auto_83721 ?auto_83723 ) ) ( not ( = ?auto_83721 ?auto_83724 ) ) ( not ( = ?auto_83722 ?auto_83723 ) ) ( not ( = ?auto_83722 ?auto_83724 ) ) ( not ( = ?auto_83723 ?auto_83724 ) ) ( ON ?auto_83724 ?auto_83725 ) ( not ( = ?auto_83719 ?auto_83725 ) ) ( not ( = ?auto_83720 ?auto_83725 ) ) ( not ( = ?auto_83721 ?auto_83725 ) ) ( not ( = ?auto_83722 ?auto_83725 ) ) ( not ( = ?auto_83723 ?auto_83725 ) ) ( not ( = ?auto_83724 ?auto_83725 ) ) ( ON ?auto_83723 ?auto_83724 ) ( ON-TABLE ?auto_83725 ) ( CLEAR ?auto_83721 ) ( ON ?auto_83722 ?auto_83723 ) ( CLEAR ?auto_83722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83725 ?auto_83724 ?auto_83723 )
      ( MAKE-6PILE ?auto_83719 ?auto_83720 ?auto_83721 ?auto_83722 ?auto_83723 ?auto_83724 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83726 - BLOCK
      ?auto_83727 - BLOCK
      ?auto_83728 - BLOCK
      ?auto_83729 - BLOCK
      ?auto_83730 - BLOCK
      ?auto_83731 - BLOCK
    )
    :vars
    (
      ?auto_83732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83726 ) ( ON ?auto_83727 ?auto_83726 ) ( not ( = ?auto_83726 ?auto_83727 ) ) ( not ( = ?auto_83726 ?auto_83728 ) ) ( not ( = ?auto_83726 ?auto_83729 ) ) ( not ( = ?auto_83726 ?auto_83730 ) ) ( not ( = ?auto_83726 ?auto_83731 ) ) ( not ( = ?auto_83727 ?auto_83728 ) ) ( not ( = ?auto_83727 ?auto_83729 ) ) ( not ( = ?auto_83727 ?auto_83730 ) ) ( not ( = ?auto_83727 ?auto_83731 ) ) ( not ( = ?auto_83728 ?auto_83729 ) ) ( not ( = ?auto_83728 ?auto_83730 ) ) ( not ( = ?auto_83728 ?auto_83731 ) ) ( not ( = ?auto_83729 ?auto_83730 ) ) ( not ( = ?auto_83729 ?auto_83731 ) ) ( not ( = ?auto_83730 ?auto_83731 ) ) ( ON ?auto_83731 ?auto_83732 ) ( not ( = ?auto_83726 ?auto_83732 ) ) ( not ( = ?auto_83727 ?auto_83732 ) ) ( not ( = ?auto_83728 ?auto_83732 ) ) ( not ( = ?auto_83729 ?auto_83732 ) ) ( not ( = ?auto_83730 ?auto_83732 ) ) ( not ( = ?auto_83731 ?auto_83732 ) ) ( ON ?auto_83730 ?auto_83731 ) ( ON-TABLE ?auto_83732 ) ( ON ?auto_83729 ?auto_83730 ) ( CLEAR ?auto_83729 ) ( HOLDING ?auto_83728 ) ( CLEAR ?auto_83727 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83726 ?auto_83727 ?auto_83728 )
      ( MAKE-6PILE ?auto_83726 ?auto_83727 ?auto_83728 ?auto_83729 ?auto_83730 ?auto_83731 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83733 - BLOCK
      ?auto_83734 - BLOCK
      ?auto_83735 - BLOCK
      ?auto_83736 - BLOCK
      ?auto_83737 - BLOCK
      ?auto_83738 - BLOCK
    )
    :vars
    (
      ?auto_83739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83733 ) ( ON ?auto_83734 ?auto_83733 ) ( not ( = ?auto_83733 ?auto_83734 ) ) ( not ( = ?auto_83733 ?auto_83735 ) ) ( not ( = ?auto_83733 ?auto_83736 ) ) ( not ( = ?auto_83733 ?auto_83737 ) ) ( not ( = ?auto_83733 ?auto_83738 ) ) ( not ( = ?auto_83734 ?auto_83735 ) ) ( not ( = ?auto_83734 ?auto_83736 ) ) ( not ( = ?auto_83734 ?auto_83737 ) ) ( not ( = ?auto_83734 ?auto_83738 ) ) ( not ( = ?auto_83735 ?auto_83736 ) ) ( not ( = ?auto_83735 ?auto_83737 ) ) ( not ( = ?auto_83735 ?auto_83738 ) ) ( not ( = ?auto_83736 ?auto_83737 ) ) ( not ( = ?auto_83736 ?auto_83738 ) ) ( not ( = ?auto_83737 ?auto_83738 ) ) ( ON ?auto_83738 ?auto_83739 ) ( not ( = ?auto_83733 ?auto_83739 ) ) ( not ( = ?auto_83734 ?auto_83739 ) ) ( not ( = ?auto_83735 ?auto_83739 ) ) ( not ( = ?auto_83736 ?auto_83739 ) ) ( not ( = ?auto_83737 ?auto_83739 ) ) ( not ( = ?auto_83738 ?auto_83739 ) ) ( ON ?auto_83737 ?auto_83738 ) ( ON-TABLE ?auto_83739 ) ( ON ?auto_83736 ?auto_83737 ) ( CLEAR ?auto_83734 ) ( ON ?auto_83735 ?auto_83736 ) ( CLEAR ?auto_83735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83739 ?auto_83738 ?auto_83737 ?auto_83736 )
      ( MAKE-6PILE ?auto_83733 ?auto_83734 ?auto_83735 ?auto_83736 ?auto_83737 ?auto_83738 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83740 - BLOCK
      ?auto_83741 - BLOCK
      ?auto_83742 - BLOCK
      ?auto_83743 - BLOCK
      ?auto_83744 - BLOCK
      ?auto_83745 - BLOCK
    )
    :vars
    (
      ?auto_83746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83740 ) ( not ( = ?auto_83740 ?auto_83741 ) ) ( not ( = ?auto_83740 ?auto_83742 ) ) ( not ( = ?auto_83740 ?auto_83743 ) ) ( not ( = ?auto_83740 ?auto_83744 ) ) ( not ( = ?auto_83740 ?auto_83745 ) ) ( not ( = ?auto_83741 ?auto_83742 ) ) ( not ( = ?auto_83741 ?auto_83743 ) ) ( not ( = ?auto_83741 ?auto_83744 ) ) ( not ( = ?auto_83741 ?auto_83745 ) ) ( not ( = ?auto_83742 ?auto_83743 ) ) ( not ( = ?auto_83742 ?auto_83744 ) ) ( not ( = ?auto_83742 ?auto_83745 ) ) ( not ( = ?auto_83743 ?auto_83744 ) ) ( not ( = ?auto_83743 ?auto_83745 ) ) ( not ( = ?auto_83744 ?auto_83745 ) ) ( ON ?auto_83745 ?auto_83746 ) ( not ( = ?auto_83740 ?auto_83746 ) ) ( not ( = ?auto_83741 ?auto_83746 ) ) ( not ( = ?auto_83742 ?auto_83746 ) ) ( not ( = ?auto_83743 ?auto_83746 ) ) ( not ( = ?auto_83744 ?auto_83746 ) ) ( not ( = ?auto_83745 ?auto_83746 ) ) ( ON ?auto_83744 ?auto_83745 ) ( ON-TABLE ?auto_83746 ) ( ON ?auto_83743 ?auto_83744 ) ( ON ?auto_83742 ?auto_83743 ) ( CLEAR ?auto_83742 ) ( HOLDING ?auto_83741 ) ( CLEAR ?auto_83740 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83740 ?auto_83741 )
      ( MAKE-6PILE ?auto_83740 ?auto_83741 ?auto_83742 ?auto_83743 ?auto_83744 ?auto_83745 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83747 - BLOCK
      ?auto_83748 - BLOCK
      ?auto_83749 - BLOCK
      ?auto_83750 - BLOCK
      ?auto_83751 - BLOCK
      ?auto_83752 - BLOCK
    )
    :vars
    (
      ?auto_83753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83747 ) ( not ( = ?auto_83747 ?auto_83748 ) ) ( not ( = ?auto_83747 ?auto_83749 ) ) ( not ( = ?auto_83747 ?auto_83750 ) ) ( not ( = ?auto_83747 ?auto_83751 ) ) ( not ( = ?auto_83747 ?auto_83752 ) ) ( not ( = ?auto_83748 ?auto_83749 ) ) ( not ( = ?auto_83748 ?auto_83750 ) ) ( not ( = ?auto_83748 ?auto_83751 ) ) ( not ( = ?auto_83748 ?auto_83752 ) ) ( not ( = ?auto_83749 ?auto_83750 ) ) ( not ( = ?auto_83749 ?auto_83751 ) ) ( not ( = ?auto_83749 ?auto_83752 ) ) ( not ( = ?auto_83750 ?auto_83751 ) ) ( not ( = ?auto_83750 ?auto_83752 ) ) ( not ( = ?auto_83751 ?auto_83752 ) ) ( ON ?auto_83752 ?auto_83753 ) ( not ( = ?auto_83747 ?auto_83753 ) ) ( not ( = ?auto_83748 ?auto_83753 ) ) ( not ( = ?auto_83749 ?auto_83753 ) ) ( not ( = ?auto_83750 ?auto_83753 ) ) ( not ( = ?auto_83751 ?auto_83753 ) ) ( not ( = ?auto_83752 ?auto_83753 ) ) ( ON ?auto_83751 ?auto_83752 ) ( ON-TABLE ?auto_83753 ) ( ON ?auto_83750 ?auto_83751 ) ( ON ?auto_83749 ?auto_83750 ) ( CLEAR ?auto_83747 ) ( ON ?auto_83748 ?auto_83749 ) ( CLEAR ?auto_83748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83753 ?auto_83752 ?auto_83751 ?auto_83750 ?auto_83749 )
      ( MAKE-6PILE ?auto_83747 ?auto_83748 ?auto_83749 ?auto_83750 ?auto_83751 ?auto_83752 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83754 - BLOCK
      ?auto_83755 - BLOCK
      ?auto_83756 - BLOCK
      ?auto_83757 - BLOCK
      ?auto_83758 - BLOCK
      ?auto_83759 - BLOCK
    )
    :vars
    (
      ?auto_83760 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83754 ?auto_83755 ) ) ( not ( = ?auto_83754 ?auto_83756 ) ) ( not ( = ?auto_83754 ?auto_83757 ) ) ( not ( = ?auto_83754 ?auto_83758 ) ) ( not ( = ?auto_83754 ?auto_83759 ) ) ( not ( = ?auto_83755 ?auto_83756 ) ) ( not ( = ?auto_83755 ?auto_83757 ) ) ( not ( = ?auto_83755 ?auto_83758 ) ) ( not ( = ?auto_83755 ?auto_83759 ) ) ( not ( = ?auto_83756 ?auto_83757 ) ) ( not ( = ?auto_83756 ?auto_83758 ) ) ( not ( = ?auto_83756 ?auto_83759 ) ) ( not ( = ?auto_83757 ?auto_83758 ) ) ( not ( = ?auto_83757 ?auto_83759 ) ) ( not ( = ?auto_83758 ?auto_83759 ) ) ( ON ?auto_83759 ?auto_83760 ) ( not ( = ?auto_83754 ?auto_83760 ) ) ( not ( = ?auto_83755 ?auto_83760 ) ) ( not ( = ?auto_83756 ?auto_83760 ) ) ( not ( = ?auto_83757 ?auto_83760 ) ) ( not ( = ?auto_83758 ?auto_83760 ) ) ( not ( = ?auto_83759 ?auto_83760 ) ) ( ON ?auto_83758 ?auto_83759 ) ( ON-TABLE ?auto_83760 ) ( ON ?auto_83757 ?auto_83758 ) ( ON ?auto_83756 ?auto_83757 ) ( ON ?auto_83755 ?auto_83756 ) ( CLEAR ?auto_83755 ) ( HOLDING ?auto_83754 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83754 )
      ( MAKE-6PILE ?auto_83754 ?auto_83755 ?auto_83756 ?auto_83757 ?auto_83758 ?auto_83759 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83761 - BLOCK
      ?auto_83762 - BLOCK
      ?auto_83763 - BLOCK
      ?auto_83764 - BLOCK
      ?auto_83765 - BLOCK
      ?auto_83766 - BLOCK
    )
    :vars
    (
      ?auto_83767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83761 ?auto_83762 ) ) ( not ( = ?auto_83761 ?auto_83763 ) ) ( not ( = ?auto_83761 ?auto_83764 ) ) ( not ( = ?auto_83761 ?auto_83765 ) ) ( not ( = ?auto_83761 ?auto_83766 ) ) ( not ( = ?auto_83762 ?auto_83763 ) ) ( not ( = ?auto_83762 ?auto_83764 ) ) ( not ( = ?auto_83762 ?auto_83765 ) ) ( not ( = ?auto_83762 ?auto_83766 ) ) ( not ( = ?auto_83763 ?auto_83764 ) ) ( not ( = ?auto_83763 ?auto_83765 ) ) ( not ( = ?auto_83763 ?auto_83766 ) ) ( not ( = ?auto_83764 ?auto_83765 ) ) ( not ( = ?auto_83764 ?auto_83766 ) ) ( not ( = ?auto_83765 ?auto_83766 ) ) ( ON ?auto_83766 ?auto_83767 ) ( not ( = ?auto_83761 ?auto_83767 ) ) ( not ( = ?auto_83762 ?auto_83767 ) ) ( not ( = ?auto_83763 ?auto_83767 ) ) ( not ( = ?auto_83764 ?auto_83767 ) ) ( not ( = ?auto_83765 ?auto_83767 ) ) ( not ( = ?auto_83766 ?auto_83767 ) ) ( ON ?auto_83765 ?auto_83766 ) ( ON-TABLE ?auto_83767 ) ( ON ?auto_83764 ?auto_83765 ) ( ON ?auto_83763 ?auto_83764 ) ( ON ?auto_83762 ?auto_83763 ) ( ON ?auto_83761 ?auto_83762 ) ( CLEAR ?auto_83761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83767 ?auto_83766 ?auto_83765 ?auto_83764 ?auto_83763 ?auto_83762 )
      ( MAKE-6PILE ?auto_83761 ?auto_83762 ?auto_83763 ?auto_83764 ?auto_83765 ?auto_83766 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83774 - BLOCK
      ?auto_83775 - BLOCK
      ?auto_83776 - BLOCK
      ?auto_83777 - BLOCK
      ?auto_83778 - BLOCK
      ?auto_83779 - BLOCK
    )
    :vars
    (
      ?auto_83780 - BLOCK
      ?auto_83781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83774 ?auto_83775 ) ) ( not ( = ?auto_83774 ?auto_83776 ) ) ( not ( = ?auto_83774 ?auto_83777 ) ) ( not ( = ?auto_83774 ?auto_83778 ) ) ( not ( = ?auto_83774 ?auto_83779 ) ) ( not ( = ?auto_83775 ?auto_83776 ) ) ( not ( = ?auto_83775 ?auto_83777 ) ) ( not ( = ?auto_83775 ?auto_83778 ) ) ( not ( = ?auto_83775 ?auto_83779 ) ) ( not ( = ?auto_83776 ?auto_83777 ) ) ( not ( = ?auto_83776 ?auto_83778 ) ) ( not ( = ?auto_83776 ?auto_83779 ) ) ( not ( = ?auto_83777 ?auto_83778 ) ) ( not ( = ?auto_83777 ?auto_83779 ) ) ( not ( = ?auto_83778 ?auto_83779 ) ) ( ON ?auto_83779 ?auto_83780 ) ( not ( = ?auto_83774 ?auto_83780 ) ) ( not ( = ?auto_83775 ?auto_83780 ) ) ( not ( = ?auto_83776 ?auto_83780 ) ) ( not ( = ?auto_83777 ?auto_83780 ) ) ( not ( = ?auto_83778 ?auto_83780 ) ) ( not ( = ?auto_83779 ?auto_83780 ) ) ( ON ?auto_83778 ?auto_83779 ) ( ON-TABLE ?auto_83780 ) ( ON ?auto_83777 ?auto_83778 ) ( ON ?auto_83776 ?auto_83777 ) ( ON ?auto_83775 ?auto_83776 ) ( CLEAR ?auto_83775 ) ( ON ?auto_83774 ?auto_83781 ) ( CLEAR ?auto_83774 ) ( HAND-EMPTY ) ( not ( = ?auto_83774 ?auto_83781 ) ) ( not ( = ?auto_83775 ?auto_83781 ) ) ( not ( = ?auto_83776 ?auto_83781 ) ) ( not ( = ?auto_83777 ?auto_83781 ) ) ( not ( = ?auto_83778 ?auto_83781 ) ) ( not ( = ?auto_83779 ?auto_83781 ) ) ( not ( = ?auto_83780 ?auto_83781 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83774 ?auto_83781 )
      ( MAKE-6PILE ?auto_83774 ?auto_83775 ?auto_83776 ?auto_83777 ?auto_83778 ?auto_83779 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83782 - BLOCK
      ?auto_83783 - BLOCK
      ?auto_83784 - BLOCK
      ?auto_83785 - BLOCK
      ?auto_83786 - BLOCK
      ?auto_83787 - BLOCK
    )
    :vars
    (
      ?auto_83789 - BLOCK
      ?auto_83788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83782 ?auto_83783 ) ) ( not ( = ?auto_83782 ?auto_83784 ) ) ( not ( = ?auto_83782 ?auto_83785 ) ) ( not ( = ?auto_83782 ?auto_83786 ) ) ( not ( = ?auto_83782 ?auto_83787 ) ) ( not ( = ?auto_83783 ?auto_83784 ) ) ( not ( = ?auto_83783 ?auto_83785 ) ) ( not ( = ?auto_83783 ?auto_83786 ) ) ( not ( = ?auto_83783 ?auto_83787 ) ) ( not ( = ?auto_83784 ?auto_83785 ) ) ( not ( = ?auto_83784 ?auto_83786 ) ) ( not ( = ?auto_83784 ?auto_83787 ) ) ( not ( = ?auto_83785 ?auto_83786 ) ) ( not ( = ?auto_83785 ?auto_83787 ) ) ( not ( = ?auto_83786 ?auto_83787 ) ) ( ON ?auto_83787 ?auto_83789 ) ( not ( = ?auto_83782 ?auto_83789 ) ) ( not ( = ?auto_83783 ?auto_83789 ) ) ( not ( = ?auto_83784 ?auto_83789 ) ) ( not ( = ?auto_83785 ?auto_83789 ) ) ( not ( = ?auto_83786 ?auto_83789 ) ) ( not ( = ?auto_83787 ?auto_83789 ) ) ( ON ?auto_83786 ?auto_83787 ) ( ON-TABLE ?auto_83789 ) ( ON ?auto_83785 ?auto_83786 ) ( ON ?auto_83784 ?auto_83785 ) ( ON ?auto_83782 ?auto_83788 ) ( CLEAR ?auto_83782 ) ( not ( = ?auto_83782 ?auto_83788 ) ) ( not ( = ?auto_83783 ?auto_83788 ) ) ( not ( = ?auto_83784 ?auto_83788 ) ) ( not ( = ?auto_83785 ?auto_83788 ) ) ( not ( = ?auto_83786 ?auto_83788 ) ) ( not ( = ?auto_83787 ?auto_83788 ) ) ( not ( = ?auto_83789 ?auto_83788 ) ) ( HOLDING ?auto_83783 ) ( CLEAR ?auto_83784 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83789 ?auto_83787 ?auto_83786 ?auto_83785 ?auto_83784 ?auto_83783 )
      ( MAKE-6PILE ?auto_83782 ?auto_83783 ?auto_83784 ?auto_83785 ?auto_83786 ?auto_83787 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83790 - BLOCK
      ?auto_83791 - BLOCK
      ?auto_83792 - BLOCK
      ?auto_83793 - BLOCK
      ?auto_83794 - BLOCK
      ?auto_83795 - BLOCK
    )
    :vars
    (
      ?auto_83797 - BLOCK
      ?auto_83796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83790 ?auto_83791 ) ) ( not ( = ?auto_83790 ?auto_83792 ) ) ( not ( = ?auto_83790 ?auto_83793 ) ) ( not ( = ?auto_83790 ?auto_83794 ) ) ( not ( = ?auto_83790 ?auto_83795 ) ) ( not ( = ?auto_83791 ?auto_83792 ) ) ( not ( = ?auto_83791 ?auto_83793 ) ) ( not ( = ?auto_83791 ?auto_83794 ) ) ( not ( = ?auto_83791 ?auto_83795 ) ) ( not ( = ?auto_83792 ?auto_83793 ) ) ( not ( = ?auto_83792 ?auto_83794 ) ) ( not ( = ?auto_83792 ?auto_83795 ) ) ( not ( = ?auto_83793 ?auto_83794 ) ) ( not ( = ?auto_83793 ?auto_83795 ) ) ( not ( = ?auto_83794 ?auto_83795 ) ) ( ON ?auto_83795 ?auto_83797 ) ( not ( = ?auto_83790 ?auto_83797 ) ) ( not ( = ?auto_83791 ?auto_83797 ) ) ( not ( = ?auto_83792 ?auto_83797 ) ) ( not ( = ?auto_83793 ?auto_83797 ) ) ( not ( = ?auto_83794 ?auto_83797 ) ) ( not ( = ?auto_83795 ?auto_83797 ) ) ( ON ?auto_83794 ?auto_83795 ) ( ON-TABLE ?auto_83797 ) ( ON ?auto_83793 ?auto_83794 ) ( ON ?auto_83792 ?auto_83793 ) ( ON ?auto_83790 ?auto_83796 ) ( not ( = ?auto_83790 ?auto_83796 ) ) ( not ( = ?auto_83791 ?auto_83796 ) ) ( not ( = ?auto_83792 ?auto_83796 ) ) ( not ( = ?auto_83793 ?auto_83796 ) ) ( not ( = ?auto_83794 ?auto_83796 ) ) ( not ( = ?auto_83795 ?auto_83796 ) ) ( not ( = ?auto_83797 ?auto_83796 ) ) ( CLEAR ?auto_83792 ) ( ON ?auto_83791 ?auto_83790 ) ( CLEAR ?auto_83791 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83796 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83796 ?auto_83790 )
      ( MAKE-6PILE ?auto_83790 ?auto_83791 ?auto_83792 ?auto_83793 ?auto_83794 ?auto_83795 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83798 - BLOCK
      ?auto_83799 - BLOCK
      ?auto_83800 - BLOCK
      ?auto_83801 - BLOCK
      ?auto_83802 - BLOCK
      ?auto_83803 - BLOCK
    )
    :vars
    (
      ?auto_83804 - BLOCK
      ?auto_83805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83798 ?auto_83799 ) ) ( not ( = ?auto_83798 ?auto_83800 ) ) ( not ( = ?auto_83798 ?auto_83801 ) ) ( not ( = ?auto_83798 ?auto_83802 ) ) ( not ( = ?auto_83798 ?auto_83803 ) ) ( not ( = ?auto_83799 ?auto_83800 ) ) ( not ( = ?auto_83799 ?auto_83801 ) ) ( not ( = ?auto_83799 ?auto_83802 ) ) ( not ( = ?auto_83799 ?auto_83803 ) ) ( not ( = ?auto_83800 ?auto_83801 ) ) ( not ( = ?auto_83800 ?auto_83802 ) ) ( not ( = ?auto_83800 ?auto_83803 ) ) ( not ( = ?auto_83801 ?auto_83802 ) ) ( not ( = ?auto_83801 ?auto_83803 ) ) ( not ( = ?auto_83802 ?auto_83803 ) ) ( ON ?auto_83803 ?auto_83804 ) ( not ( = ?auto_83798 ?auto_83804 ) ) ( not ( = ?auto_83799 ?auto_83804 ) ) ( not ( = ?auto_83800 ?auto_83804 ) ) ( not ( = ?auto_83801 ?auto_83804 ) ) ( not ( = ?auto_83802 ?auto_83804 ) ) ( not ( = ?auto_83803 ?auto_83804 ) ) ( ON ?auto_83802 ?auto_83803 ) ( ON-TABLE ?auto_83804 ) ( ON ?auto_83801 ?auto_83802 ) ( ON ?auto_83798 ?auto_83805 ) ( not ( = ?auto_83798 ?auto_83805 ) ) ( not ( = ?auto_83799 ?auto_83805 ) ) ( not ( = ?auto_83800 ?auto_83805 ) ) ( not ( = ?auto_83801 ?auto_83805 ) ) ( not ( = ?auto_83802 ?auto_83805 ) ) ( not ( = ?auto_83803 ?auto_83805 ) ) ( not ( = ?auto_83804 ?auto_83805 ) ) ( ON ?auto_83799 ?auto_83798 ) ( CLEAR ?auto_83799 ) ( ON-TABLE ?auto_83805 ) ( HOLDING ?auto_83800 ) ( CLEAR ?auto_83801 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83804 ?auto_83803 ?auto_83802 ?auto_83801 ?auto_83800 )
      ( MAKE-6PILE ?auto_83798 ?auto_83799 ?auto_83800 ?auto_83801 ?auto_83802 ?auto_83803 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83806 - BLOCK
      ?auto_83807 - BLOCK
      ?auto_83808 - BLOCK
      ?auto_83809 - BLOCK
      ?auto_83810 - BLOCK
      ?auto_83811 - BLOCK
    )
    :vars
    (
      ?auto_83813 - BLOCK
      ?auto_83812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83806 ?auto_83807 ) ) ( not ( = ?auto_83806 ?auto_83808 ) ) ( not ( = ?auto_83806 ?auto_83809 ) ) ( not ( = ?auto_83806 ?auto_83810 ) ) ( not ( = ?auto_83806 ?auto_83811 ) ) ( not ( = ?auto_83807 ?auto_83808 ) ) ( not ( = ?auto_83807 ?auto_83809 ) ) ( not ( = ?auto_83807 ?auto_83810 ) ) ( not ( = ?auto_83807 ?auto_83811 ) ) ( not ( = ?auto_83808 ?auto_83809 ) ) ( not ( = ?auto_83808 ?auto_83810 ) ) ( not ( = ?auto_83808 ?auto_83811 ) ) ( not ( = ?auto_83809 ?auto_83810 ) ) ( not ( = ?auto_83809 ?auto_83811 ) ) ( not ( = ?auto_83810 ?auto_83811 ) ) ( ON ?auto_83811 ?auto_83813 ) ( not ( = ?auto_83806 ?auto_83813 ) ) ( not ( = ?auto_83807 ?auto_83813 ) ) ( not ( = ?auto_83808 ?auto_83813 ) ) ( not ( = ?auto_83809 ?auto_83813 ) ) ( not ( = ?auto_83810 ?auto_83813 ) ) ( not ( = ?auto_83811 ?auto_83813 ) ) ( ON ?auto_83810 ?auto_83811 ) ( ON-TABLE ?auto_83813 ) ( ON ?auto_83809 ?auto_83810 ) ( ON ?auto_83806 ?auto_83812 ) ( not ( = ?auto_83806 ?auto_83812 ) ) ( not ( = ?auto_83807 ?auto_83812 ) ) ( not ( = ?auto_83808 ?auto_83812 ) ) ( not ( = ?auto_83809 ?auto_83812 ) ) ( not ( = ?auto_83810 ?auto_83812 ) ) ( not ( = ?auto_83811 ?auto_83812 ) ) ( not ( = ?auto_83813 ?auto_83812 ) ) ( ON ?auto_83807 ?auto_83806 ) ( ON-TABLE ?auto_83812 ) ( CLEAR ?auto_83809 ) ( ON ?auto_83808 ?auto_83807 ) ( CLEAR ?auto_83808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83812 ?auto_83806 ?auto_83807 )
      ( MAKE-6PILE ?auto_83806 ?auto_83807 ?auto_83808 ?auto_83809 ?auto_83810 ?auto_83811 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83814 - BLOCK
      ?auto_83815 - BLOCK
      ?auto_83816 - BLOCK
      ?auto_83817 - BLOCK
      ?auto_83818 - BLOCK
      ?auto_83819 - BLOCK
    )
    :vars
    (
      ?auto_83821 - BLOCK
      ?auto_83820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83814 ?auto_83815 ) ) ( not ( = ?auto_83814 ?auto_83816 ) ) ( not ( = ?auto_83814 ?auto_83817 ) ) ( not ( = ?auto_83814 ?auto_83818 ) ) ( not ( = ?auto_83814 ?auto_83819 ) ) ( not ( = ?auto_83815 ?auto_83816 ) ) ( not ( = ?auto_83815 ?auto_83817 ) ) ( not ( = ?auto_83815 ?auto_83818 ) ) ( not ( = ?auto_83815 ?auto_83819 ) ) ( not ( = ?auto_83816 ?auto_83817 ) ) ( not ( = ?auto_83816 ?auto_83818 ) ) ( not ( = ?auto_83816 ?auto_83819 ) ) ( not ( = ?auto_83817 ?auto_83818 ) ) ( not ( = ?auto_83817 ?auto_83819 ) ) ( not ( = ?auto_83818 ?auto_83819 ) ) ( ON ?auto_83819 ?auto_83821 ) ( not ( = ?auto_83814 ?auto_83821 ) ) ( not ( = ?auto_83815 ?auto_83821 ) ) ( not ( = ?auto_83816 ?auto_83821 ) ) ( not ( = ?auto_83817 ?auto_83821 ) ) ( not ( = ?auto_83818 ?auto_83821 ) ) ( not ( = ?auto_83819 ?auto_83821 ) ) ( ON ?auto_83818 ?auto_83819 ) ( ON-TABLE ?auto_83821 ) ( ON ?auto_83814 ?auto_83820 ) ( not ( = ?auto_83814 ?auto_83820 ) ) ( not ( = ?auto_83815 ?auto_83820 ) ) ( not ( = ?auto_83816 ?auto_83820 ) ) ( not ( = ?auto_83817 ?auto_83820 ) ) ( not ( = ?auto_83818 ?auto_83820 ) ) ( not ( = ?auto_83819 ?auto_83820 ) ) ( not ( = ?auto_83821 ?auto_83820 ) ) ( ON ?auto_83815 ?auto_83814 ) ( ON-TABLE ?auto_83820 ) ( ON ?auto_83816 ?auto_83815 ) ( CLEAR ?auto_83816 ) ( HOLDING ?auto_83817 ) ( CLEAR ?auto_83818 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83821 ?auto_83819 ?auto_83818 ?auto_83817 )
      ( MAKE-6PILE ?auto_83814 ?auto_83815 ?auto_83816 ?auto_83817 ?auto_83818 ?auto_83819 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83822 - BLOCK
      ?auto_83823 - BLOCK
      ?auto_83824 - BLOCK
      ?auto_83825 - BLOCK
      ?auto_83826 - BLOCK
      ?auto_83827 - BLOCK
    )
    :vars
    (
      ?auto_83829 - BLOCK
      ?auto_83828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83822 ?auto_83823 ) ) ( not ( = ?auto_83822 ?auto_83824 ) ) ( not ( = ?auto_83822 ?auto_83825 ) ) ( not ( = ?auto_83822 ?auto_83826 ) ) ( not ( = ?auto_83822 ?auto_83827 ) ) ( not ( = ?auto_83823 ?auto_83824 ) ) ( not ( = ?auto_83823 ?auto_83825 ) ) ( not ( = ?auto_83823 ?auto_83826 ) ) ( not ( = ?auto_83823 ?auto_83827 ) ) ( not ( = ?auto_83824 ?auto_83825 ) ) ( not ( = ?auto_83824 ?auto_83826 ) ) ( not ( = ?auto_83824 ?auto_83827 ) ) ( not ( = ?auto_83825 ?auto_83826 ) ) ( not ( = ?auto_83825 ?auto_83827 ) ) ( not ( = ?auto_83826 ?auto_83827 ) ) ( ON ?auto_83827 ?auto_83829 ) ( not ( = ?auto_83822 ?auto_83829 ) ) ( not ( = ?auto_83823 ?auto_83829 ) ) ( not ( = ?auto_83824 ?auto_83829 ) ) ( not ( = ?auto_83825 ?auto_83829 ) ) ( not ( = ?auto_83826 ?auto_83829 ) ) ( not ( = ?auto_83827 ?auto_83829 ) ) ( ON ?auto_83826 ?auto_83827 ) ( ON-TABLE ?auto_83829 ) ( ON ?auto_83822 ?auto_83828 ) ( not ( = ?auto_83822 ?auto_83828 ) ) ( not ( = ?auto_83823 ?auto_83828 ) ) ( not ( = ?auto_83824 ?auto_83828 ) ) ( not ( = ?auto_83825 ?auto_83828 ) ) ( not ( = ?auto_83826 ?auto_83828 ) ) ( not ( = ?auto_83827 ?auto_83828 ) ) ( not ( = ?auto_83829 ?auto_83828 ) ) ( ON ?auto_83823 ?auto_83822 ) ( ON-TABLE ?auto_83828 ) ( ON ?auto_83824 ?auto_83823 ) ( CLEAR ?auto_83826 ) ( ON ?auto_83825 ?auto_83824 ) ( CLEAR ?auto_83825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83828 ?auto_83822 ?auto_83823 ?auto_83824 )
      ( MAKE-6PILE ?auto_83822 ?auto_83823 ?auto_83824 ?auto_83825 ?auto_83826 ?auto_83827 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83830 - BLOCK
      ?auto_83831 - BLOCK
      ?auto_83832 - BLOCK
      ?auto_83833 - BLOCK
      ?auto_83834 - BLOCK
      ?auto_83835 - BLOCK
    )
    :vars
    (
      ?auto_83837 - BLOCK
      ?auto_83836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83830 ?auto_83831 ) ) ( not ( = ?auto_83830 ?auto_83832 ) ) ( not ( = ?auto_83830 ?auto_83833 ) ) ( not ( = ?auto_83830 ?auto_83834 ) ) ( not ( = ?auto_83830 ?auto_83835 ) ) ( not ( = ?auto_83831 ?auto_83832 ) ) ( not ( = ?auto_83831 ?auto_83833 ) ) ( not ( = ?auto_83831 ?auto_83834 ) ) ( not ( = ?auto_83831 ?auto_83835 ) ) ( not ( = ?auto_83832 ?auto_83833 ) ) ( not ( = ?auto_83832 ?auto_83834 ) ) ( not ( = ?auto_83832 ?auto_83835 ) ) ( not ( = ?auto_83833 ?auto_83834 ) ) ( not ( = ?auto_83833 ?auto_83835 ) ) ( not ( = ?auto_83834 ?auto_83835 ) ) ( ON ?auto_83835 ?auto_83837 ) ( not ( = ?auto_83830 ?auto_83837 ) ) ( not ( = ?auto_83831 ?auto_83837 ) ) ( not ( = ?auto_83832 ?auto_83837 ) ) ( not ( = ?auto_83833 ?auto_83837 ) ) ( not ( = ?auto_83834 ?auto_83837 ) ) ( not ( = ?auto_83835 ?auto_83837 ) ) ( ON-TABLE ?auto_83837 ) ( ON ?auto_83830 ?auto_83836 ) ( not ( = ?auto_83830 ?auto_83836 ) ) ( not ( = ?auto_83831 ?auto_83836 ) ) ( not ( = ?auto_83832 ?auto_83836 ) ) ( not ( = ?auto_83833 ?auto_83836 ) ) ( not ( = ?auto_83834 ?auto_83836 ) ) ( not ( = ?auto_83835 ?auto_83836 ) ) ( not ( = ?auto_83837 ?auto_83836 ) ) ( ON ?auto_83831 ?auto_83830 ) ( ON-TABLE ?auto_83836 ) ( ON ?auto_83832 ?auto_83831 ) ( ON ?auto_83833 ?auto_83832 ) ( CLEAR ?auto_83833 ) ( HOLDING ?auto_83834 ) ( CLEAR ?auto_83835 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83837 ?auto_83835 ?auto_83834 )
      ( MAKE-6PILE ?auto_83830 ?auto_83831 ?auto_83832 ?auto_83833 ?auto_83834 ?auto_83835 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83838 - BLOCK
      ?auto_83839 - BLOCK
      ?auto_83840 - BLOCK
      ?auto_83841 - BLOCK
      ?auto_83842 - BLOCK
      ?auto_83843 - BLOCK
    )
    :vars
    (
      ?auto_83844 - BLOCK
      ?auto_83845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83838 ?auto_83839 ) ) ( not ( = ?auto_83838 ?auto_83840 ) ) ( not ( = ?auto_83838 ?auto_83841 ) ) ( not ( = ?auto_83838 ?auto_83842 ) ) ( not ( = ?auto_83838 ?auto_83843 ) ) ( not ( = ?auto_83839 ?auto_83840 ) ) ( not ( = ?auto_83839 ?auto_83841 ) ) ( not ( = ?auto_83839 ?auto_83842 ) ) ( not ( = ?auto_83839 ?auto_83843 ) ) ( not ( = ?auto_83840 ?auto_83841 ) ) ( not ( = ?auto_83840 ?auto_83842 ) ) ( not ( = ?auto_83840 ?auto_83843 ) ) ( not ( = ?auto_83841 ?auto_83842 ) ) ( not ( = ?auto_83841 ?auto_83843 ) ) ( not ( = ?auto_83842 ?auto_83843 ) ) ( ON ?auto_83843 ?auto_83844 ) ( not ( = ?auto_83838 ?auto_83844 ) ) ( not ( = ?auto_83839 ?auto_83844 ) ) ( not ( = ?auto_83840 ?auto_83844 ) ) ( not ( = ?auto_83841 ?auto_83844 ) ) ( not ( = ?auto_83842 ?auto_83844 ) ) ( not ( = ?auto_83843 ?auto_83844 ) ) ( ON-TABLE ?auto_83844 ) ( ON ?auto_83838 ?auto_83845 ) ( not ( = ?auto_83838 ?auto_83845 ) ) ( not ( = ?auto_83839 ?auto_83845 ) ) ( not ( = ?auto_83840 ?auto_83845 ) ) ( not ( = ?auto_83841 ?auto_83845 ) ) ( not ( = ?auto_83842 ?auto_83845 ) ) ( not ( = ?auto_83843 ?auto_83845 ) ) ( not ( = ?auto_83844 ?auto_83845 ) ) ( ON ?auto_83839 ?auto_83838 ) ( ON-TABLE ?auto_83845 ) ( ON ?auto_83840 ?auto_83839 ) ( ON ?auto_83841 ?auto_83840 ) ( CLEAR ?auto_83843 ) ( ON ?auto_83842 ?auto_83841 ) ( CLEAR ?auto_83842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83845 ?auto_83838 ?auto_83839 ?auto_83840 ?auto_83841 )
      ( MAKE-6PILE ?auto_83838 ?auto_83839 ?auto_83840 ?auto_83841 ?auto_83842 ?auto_83843 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83846 - BLOCK
      ?auto_83847 - BLOCK
      ?auto_83848 - BLOCK
      ?auto_83849 - BLOCK
      ?auto_83850 - BLOCK
      ?auto_83851 - BLOCK
    )
    :vars
    (
      ?auto_83852 - BLOCK
      ?auto_83853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83846 ?auto_83847 ) ) ( not ( = ?auto_83846 ?auto_83848 ) ) ( not ( = ?auto_83846 ?auto_83849 ) ) ( not ( = ?auto_83846 ?auto_83850 ) ) ( not ( = ?auto_83846 ?auto_83851 ) ) ( not ( = ?auto_83847 ?auto_83848 ) ) ( not ( = ?auto_83847 ?auto_83849 ) ) ( not ( = ?auto_83847 ?auto_83850 ) ) ( not ( = ?auto_83847 ?auto_83851 ) ) ( not ( = ?auto_83848 ?auto_83849 ) ) ( not ( = ?auto_83848 ?auto_83850 ) ) ( not ( = ?auto_83848 ?auto_83851 ) ) ( not ( = ?auto_83849 ?auto_83850 ) ) ( not ( = ?auto_83849 ?auto_83851 ) ) ( not ( = ?auto_83850 ?auto_83851 ) ) ( not ( = ?auto_83846 ?auto_83852 ) ) ( not ( = ?auto_83847 ?auto_83852 ) ) ( not ( = ?auto_83848 ?auto_83852 ) ) ( not ( = ?auto_83849 ?auto_83852 ) ) ( not ( = ?auto_83850 ?auto_83852 ) ) ( not ( = ?auto_83851 ?auto_83852 ) ) ( ON-TABLE ?auto_83852 ) ( ON ?auto_83846 ?auto_83853 ) ( not ( = ?auto_83846 ?auto_83853 ) ) ( not ( = ?auto_83847 ?auto_83853 ) ) ( not ( = ?auto_83848 ?auto_83853 ) ) ( not ( = ?auto_83849 ?auto_83853 ) ) ( not ( = ?auto_83850 ?auto_83853 ) ) ( not ( = ?auto_83851 ?auto_83853 ) ) ( not ( = ?auto_83852 ?auto_83853 ) ) ( ON ?auto_83847 ?auto_83846 ) ( ON-TABLE ?auto_83853 ) ( ON ?auto_83848 ?auto_83847 ) ( ON ?auto_83849 ?auto_83848 ) ( ON ?auto_83850 ?auto_83849 ) ( CLEAR ?auto_83850 ) ( HOLDING ?auto_83851 ) ( CLEAR ?auto_83852 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83852 ?auto_83851 )
      ( MAKE-6PILE ?auto_83846 ?auto_83847 ?auto_83848 ?auto_83849 ?auto_83850 ?auto_83851 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83854 - BLOCK
      ?auto_83855 - BLOCK
      ?auto_83856 - BLOCK
      ?auto_83857 - BLOCK
      ?auto_83858 - BLOCK
      ?auto_83859 - BLOCK
    )
    :vars
    (
      ?auto_83861 - BLOCK
      ?auto_83860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83854 ?auto_83855 ) ) ( not ( = ?auto_83854 ?auto_83856 ) ) ( not ( = ?auto_83854 ?auto_83857 ) ) ( not ( = ?auto_83854 ?auto_83858 ) ) ( not ( = ?auto_83854 ?auto_83859 ) ) ( not ( = ?auto_83855 ?auto_83856 ) ) ( not ( = ?auto_83855 ?auto_83857 ) ) ( not ( = ?auto_83855 ?auto_83858 ) ) ( not ( = ?auto_83855 ?auto_83859 ) ) ( not ( = ?auto_83856 ?auto_83857 ) ) ( not ( = ?auto_83856 ?auto_83858 ) ) ( not ( = ?auto_83856 ?auto_83859 ) ) ( not ( = ?auto_83857 ?auto_83858 ) ) ( not ( = ?auto_83857 ?auto_83859 ) ) ( not ( = ?auto_83858 ?auto_83859 ) ) ( not ( = ?auto_83854 ?auto_83861 ) ) ( not ( = ?auto_83855 ?auto_83861 ) ) ( not ( = ?auto_83856 ?auto_83861 ) ) ( not ( = ?auto_83857 ?auto_83861 ) ) ( not ( = ?auto_83858 ?auto_83861 ) ) ( not ( = ?auto_83859 ?auto_83861 ) ) ( ON-TABLE ?auto_83861 ) ( ON ?auto_83854 ?auto_83860 ) ( not ( = ?auto_83854 ?auto_83860 ) ) ( not ( = ?auto_83855 ?auto_83860 ) ) ( not ( = ?auto_83856 ?auto_83860 ) ) ( not ( = ?auto_83857 ?auto_83860 ) ) ( not ( = ?auto_83858 ?auto_83860 ) ) ( not ( = ?auto_83859 ?auto_83860 ) ) ( not ( = ?auto_83861 ?auto_83860 ) ) ( ON ?auto_83855 ?auto_83854 ) ( ON-TABLE ?auto_83860 ) ( ON ?auto_83856 ?auto_83855 ) ( ON ?auto_83857 ?auto_83856 ) ( ON ?auto_83858 ?auto_83857 ) ( CLEAR ?auto_83861 ) ( ON ?auto_83859 ?auto_83858 ) ( CLEAR ?auto_83859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83860 ?auto_83854 ?auto_83855 ?auto_83856 ?auto_83857 ?auto_83858 )
      ( MAKE-6PILE ?auto_83854 ?auto_83855 ?auto_83856 ?auto_83857 ?auto_83858 ?auto_83859 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83862 - BLOCK
      ?auto_83863 - BLOCK
      ?auto_83864 - BLOCK
      ?auto_83865 - BLOCK
      ?auto_83866 - BLOCK
      ?auto_83867 - BLOCK
    )
    :vars
    (
      ?auto_83868 - BLOCK
      ?auto_83869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83862 ?auto_83863 ) ) ( not ( = ?auto_83862 ?auto_83864 ) ) ( not ( = ?auto_83862 ?auto_83865 ) ) ( not ( = ?auto_83862 ?auto_83866 ) ) ( not ( = ?auto_83862 ?auto_83867 ) ) ( not ( = ?auto_83863 ?auto_83864 ) ) ( not ( = ?auto_83863 ?auto_83865 ) ) ( not ( = ?auto_83863 ?auto_83866 ) ) ( not ( = ?auto_83863 ?auto_83867 ) ) ( not ( = ?auto_83864 ?auto_83865 ) ) ( not ( = ?auto_83864 ?auto_83866 ) ) ( not ( = ?auto_83864 ?auto_83867 ) ) ( not ( = ?auto_83865 ?auto_83866 ) ) ( not ( = ?auto_83865 ?auto_83867 ) ) ( not ( = ?auto_83866 ?auto_83867 ) ) ( not ( = ?auto_83862 ?auto_83868 ) ) ( not ( = ?auto_83863 ?auto_83868 ) ) ( not ( = ?auto_83864 ?auto_83868 ) ) ( not ( = ?auto_83865 ?auto_83868 ) ) ( not ( = ?auto_83866 ?auto_83868 ) ) ( not ( = ?auto_83867 ?auto_83868 ) ) ( ON ?auto_83862 ?auto_83869 ) ( not ( = ?auto_83862 ?auto_83869 ) ) ( not ( = ?auto_83863 ?auto_83869 ) ) ( not ( = ?auto_83864 ?auto_83869 ) ) ( not ( = ?auto_83865 ?auto_83869 ) ) ( not ( = ?auto_83866 ?auto_83869 ) ) ( not ( = ?auto_83867 ?auto_83869 ) ) ( not ( = ?auto_83868 ?auto_83869 ) ) ( ON ?auto_83863 ?auto_83862 ) ( ON-TABLE ?auto_83869 ) ( ON ?auto_83864 ?auto_83863 ) ( ON ?auto_83865 ?auto_83864 ) ( ON ?auto_83866 ?auto_83865 ) ( ON ?auto_83867 ?auto_83866 ) ( CLEAR ?auto_83867 ) ( HOLDING ?auto_83868 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83868 )
      ( MAKE-6PILE ?auto_83862 ?auto_83863 ?auto_83864 ?auto_83865 ?auto_83866 ?auto_83867 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83870 - BLOCK
      ?auto_83871 - BLOCK
      ?auto_83872 - BLOCK
      ?auto_83873 - BLOCK
      ?auto_83874 - BLOCK
      ?auto_83875 - BLOCK
    )
    :vars
    (
      ?auto_83877 - BLOCK
      ?auto_83876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83870 ?auto_83871 ) ) ( not ( = ?auto_83870 ?auto_83872 ) ) ( not ( = ?auto_83870 ?auto_83873 ) ) ( not ( = ?auto_83870 ?auto_83874 ) ) ( not ( = ?auto_83870 ?auto_83875 ) ) ( not ( = ?auto_83871 ?auto_83872 ) ) ( not ( = ?auto_83871 ?auto_83873 ) ) ( not ( = ?auto_83871 ?auto_83874 ) ) ( not ( = ?auto_83871 ?auto_83875 ) ) ( not ( = ?auto_83872 ?auto_83873 ) ) ( not ( = ?auto_83872 ?auto_83874 ) ) ( not ( = ?auto_83872 ?auto_83875 ) ) ( not ( = ?auto_83873 ?auto_83874 ) ) ( not ( = ?auto_83873 ?auto_83875 ) ) ( not ( = ?auto_83874 ?auto_83875 ) ) ( not ( = ?auto_83870 ?auto_83877 ) ) ( not ( = ?auto_83871 ?auto_83877 ) ) ( not ( = ?auto_83872 ?auto_83877 ) ) ( not ( = ?auto_83873 ?auto_83877 ) ) ( not ( = ?auto_83874 ?auto_83877 ) ) ( not ( = ?auto_83875 ?auto_83877 ) ) ( ON ?auto_83870 ?auto_83876 ) ( not ( = ?auto_83870 ?auto_83876 ) ) ( not ( = ?auto_83871 ?auto_83876 ) ) ( not ( = ?auto_83872 ?auto_83876 ) ) ( not ( = ?auto_83873 ?auto_83876 ) ) ( not ( = ?auto_83874 ?auto_83876 ) ) ( not ( = ?auto_83875 ?auto_83876 ) ) ( not ( = ?auto_83877 ?auto_83876 ) ) ( ON ?auto_83871 ?auto_83870 ) ( ON-TABLE ?auto_83876 ) ( ON ?auto_83872 ?auto_83871 ) ( ON ?auto_83873 ?auto_83872 ) ( ON ?auto_83874 ?auto_83873 ) ( ON ?auto_83875 ?auto_83874 ) ( ON ?auto_83877 ?auto_83875 ) ( CLEAR ?auto_83877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83876 ?auto_83870 ?auto_83871 ?auto_83872 ?auto_83873 ?auto_83874 ?auto_83875 )
      ( MAKE-6PILE ?auto_83870 ?auto_83871 ?auto_83872 ?auto_83873 ?auto_83874 ?auto_83875 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83892 - BLOCK
      ?auto_83893 - BLOCK
      ?auto_83894 - BLOCK
      ?auto_83895 - BLOCK
      ?auto_83896 - BLOCK
      ?auto_83897 - BLOCK
      ?auto_83898 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_83897 ) ( ON-TABLE ?auto_83892 ) ( ON ?auto_83893 ?auto_83892 ) ( ON ?auto_83894 ?auto_83893 ) ( ON ?auto_83895 ?auto_83894 ) ( ON ?auto_83896 ?auto_83895 ) ( ON ?auto_83897 ?auto_83896 ) ( not ( = ?auto_83892 ?auto_83893 ) ) ( not ( = ?auto_83892 ?auto_83894 ) ) ( not ( = ?auto_83892 ?auto_83895 ) ) ( not ( = ?auto_83892 ?auto_83896 ) ) ( not ( = ?auto_83892 ?auto_83897 ) ) ( not ( = ?auto_83892 ?auto_83898 ) ) ( not ( = ?auto_83893 ?auto_83894 ) ) ( not ( = ?auto_83893 ?auto_83895 ) ) ( not ( = ?auto_83893 ?auto_83896 ) ) ( not ( = ?auto_83893 ?auto_83897 ) ) ( not ( = ?auto_83893 ?auto_83898 ) ) ( not ( = ?auto_83894 ?auto_83895 ) ) ( not ( = ?auto_83894 ?auto_83896 ) ) ( not ( = ?auto_83894 ?auto_83897 ) ) ( not ( = ?auto_83894 ?auto_83898 ) ) ( not ( = ?auto_83895 ?auto_83896 ) ) ( not ( = ?auto_83895 ?auto_83897 ) ) ( not ( = ?auto_83895 ?auto_83898 ) ) ( not ( = ?auto_83896 ?auto_83897 ) ) ( not ( = ?auto_83896 ?auto_83898 ) ) ( not ( = ?auto_83897 ?auto_83898 ) ) ( ON-TABLE ?auto_83898 ) ( CLEAR ?auto_83898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_83898 )
      ( MAKE-7PILE ?auto_83892 ?auto_83893 ?auto_83894 ?auto_83895 ?auto_83896 ?auto_83897 ?auto_83898 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83899 - BLOCK
      ?auto_83900 - BLOCK
      ?auto_83901 - BLOCK
      ?auto_83902 - BLOCK
      ?auto_83903 - BLOCK
      ?auto_83904 - BLOCK
      ?auto_83905 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83899 ) ( ON ?auto_83900 ?auto_83899 ) ( ON ?auto_83901 ?auto_83900 ) ( ON ?auto_83902 ?auto_83901 ) ( ON ?auto_83903 ?auto_83902 ) ( not ( = ?auto_83899 ?auto_83900 ) ) ( not ( = ?auto_83899 ?auto_83901 ) ) ( not ( = ?auto_83899 ?auto_83902 ) ) ( not ( = ?auto_83899 ?auto_83903 ) ) ( not ( = ?auto_83899 ?auto_83904 ) ) ( not ( = ?auto_83899 ?auto_83905 ) ) ( not ( = ?auto_83900 ?auto_83901 ) ) ( not ( = ?auto_83900 ?auto_83902 ) ) ( not ( = ?auto_83900 ?auto_83903 ) ) ( not ( = ?auto_83900 ?auto_83904 ) ) ( not ( = ?auto_83900 ?auto_83905 ) ) ( not ( = ?auto_83901 ?auto_83902 ) ) ( not ( = ?auto_83901 ?auto_83903 ) ) ( not ( = ?auto_83901 ?auto_83904 ) ) ( not ( = ?auto_83901 ?auto_83905 ) ) ( not ( = ?auto_83902 ?auto_83903 ) ) ( not ( = ?auto_83902 ?auto_83904 ) ) ( not ( = ?auto_83902 ?auto_83905 ) ) ( not ( = ?auto_83903 ?auto_83904 ) ) ( not ( = ?auto_83903 ?auto_83905 ) ) ( not ( = ?auto_83904 ?auto_83905 ) ) ( ON-TABLE ?auto_83905 ) ( CLEAR ?auto_83905 ) ( HOLDING ?auto_83904 ) ( CLEAR ?auto_83903 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83899 ?auto_83900 ?auto_83901 ?auto_83902 ?auto_83903 ?auto_83904 )
      ( MAKE-7PILE ?auto_83899 ?auto_83900 ?auto_83901 ?auto_83902 ?auto_83903 ?auto_83904 ?auto_83905 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83906 - BLOCK
      ?auto_83907 - BLOCK
      ?auto_83908 - BLOCK
      ?auto_83909 - BLOCK
      ?auto_83910 - BLOCK
      ?auto_83911 - BLOCK
      ?auto_83912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83906 ) ( ON ?auto_83907 ?auto_83906 ) ( ON ?auto_83908 ?auto_83907 ) ( ON ?auto_83909 ?auto_83908 ) ( ON ?auto_83910 ?auto_83909 ) ( not ( = ?auto_83906 ?auto_83907 ) ) ( not ( = ?auto_83906 ?auto_83908 ) ) ( not ( = ?auto_83906 ?auto_83909 ) ) ( not ( = ?auto_83906 ?auto_83910 ) ) ( not ( = ?auto_83906 ?auto_83911 ) ) ( not ( = ?auto_83906 ?auto_83912 ) ) ( not ( = ?auto_83907 ?auto_83908 ) ) ( not ( = ?auto_83907 ?auto_83909 ) ) ( not ( = ?auto_83907 ?auto_83910 ) ) ( not ( = ?auto_83907 ?auto_83911 ) ) ( not ( = ?auto_83907 ?auto_83912 ) ) ( not ( = ?auto_83908 ?auto_83909 ) ) ( not ( = ?auto_83908 ?auto_83910 ) ) ( not ( = ?auto_83908 ?auto_83911 ) ) ( not ( = ?auto_83908 ?auto_83912 ) ) ( not ( = ?auto_83909 ?auto_83910 ) ) ( not ( = ?auto_83909 ?auto_83911 ) ) ( not ( = ?auto_83909 ?auto_83912 ) ) ( not ( = ?auto_83910 ?auto_83911 ) ) ( not ( = ?auto_83910 ?auto_83912 ) ) ( not ( = ?auto_83911 ?auto_83912 ) ) ( ON-TABLE ?auto_83912 ) ( CLEAR ?auto_83910 ) ( ON ?auto_83911 ?auto_83912 ) ( CLEAR ?auto_83911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83912 )
      ( MAKE-7PILE ?auto_83906 ?auto_83907 ?auto_83908 ?auto_83909 ?auto_83910 ?auto_83911 ?auto_83912 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83913 - BLOCK
      ?auto_83914 - BLOCK
      ?auto_83915 - BLOCK
      ?auto_83916 - BLOCK
      ?auto_83917 - BLOCK
      ?auto_83918 - BLOCK
      ?auto_83919 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83913 ) ( ON ?auto_83914 ?auto_83913 ) ( ON ?auto_83915 ?auto_83914 ) ( ON ?auto_83916 ?auto_83915 ) ( not ( = ?auto_83913 ?auto_83914 ) ) ( not ( = ?auto_83913 ?auto_83915 ) ) ( not ( = ?auto_83913 ?auto_83916 ) ) ( not ( = ?auto_83913 ?auto_83917 ) ) ( not ( = ?auto_83913 ?auto_83918 ) ) ( not ( = ?auto_83913 ?auto_83919 ) ) ( not ( = ?auto_83914 ?auto_83915 ) ) ( not ( = ?auto_83914 ?auto_83916 ) ) ( not ( = ?auto_83914 ?auto_83917 ) ) ( not ( = ?auto_83914 ?auto_83918 ) ) ( not ( = ?auto_83914 ?auto_83919 ) ) ( not ( = ?auto_83915 ?auto_83916 ) ) ( not ( = ?auto_83915 ?auto_83917 ) ) ( not ( = ?auto_83915 ?auto_83918 ) ) ( not ( = ?auto_83915 ?auto_83919 ) ) ( not ( = ?auto_83916 ?auto_83917 ) ) ( not ( = ?auto_83916 ?auto_83918 ) ) ( not ( = ?auto_83916 ?auto_83919 ) ) ( not ( = ?auto_83917 ?auto_83918 ) ) ( not ( = ?auto_83917 ?auto_83919 ) ) ( not ( = ?auto_83918 ?auto_83919 ) ) ( ON-TABLE ?auto_83919 ) ( ON ?auto_83918 ?auto_83919 ) ( CLEAR ?auto_83918 ) ( HOLDING ?auto_83917 ) ( CLEAR ?auto_83916 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83913 ?auto_83914 ?auto_83915 ?auto_83916 ?auto_83917 )
      ( MAKE-7PILE ?auto_83913 ?auto_83914 ?auto_83915 ?auto_83916 ?auto_83917 ?auto_83918 ?auto_83919 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83920 - BLOCK
      ?auto_83921 - BLOCK
      ?auto_83922 - BLOCK
      ?auto_83923 - BLOCK
      ?auto_83924 - BLOCK
      ?auto_83925 - BLOCK
      ?auto_83926 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83920 ) ( ON ?auto_83921 ?auto_83920 ) ( ON ?auto_83922 ?auto_83921 ) ( ON ?auto_83923 ?auto_83922 ) ( not ( = ?auto_83920 ?auto_83921 ) ) ( not ( = ?auto_83920 ?auto_83922 ) ) ( not ( = ?auto_83920 ?auto_83923 ) ) ( not ( = ?auto_83920 ?auto_83924 ) ) ( not ( = ?auto_83920 ?auto_83925 ) ) ( not ( = ?auto_83920 ?auto_83926 ) ) ( not ( = ?auto_83921 ?auto_83922 ) ) ( not ( = ?auto_83921 ?auto_83923 ) ) ( not ( = ?auto_83921 ?auto_83924 ) ) ( not ( = ?auto_83921 ?auto_83925 ) ) ( not ( = ?auto_83921 ?auto_83926 ) ) ( not ( = ?auto_83922 ?auto_83923 ) ) ( not ( = ?auto_83922 ?auto_83924 ) ) ( not ( = ?auto_83922 ?auto_83925 ) ) ( not ( = ?auto_83922 ?auto_83926 ) ) ( not ( = ?auto_83923 ?auto_83924 ) ) ( not ( = ?auto_83923 ?auto_83925 ) ) ( not ( = ?auto_83923 ?auto_83926 ) ) ( not ( = ?auto_83924 ?auto_83925 ) ) ( not ( = ?auto_83924 ?auto_83926 ) ) ( not ( = ?auto_83925 ?auto_83926 ) ) ( ON-TABLE ?auto_83926 ) ( ON ?auto_83925 ?auto_83926 ) ( CLEAR ?auto_83923 ) ( ON ?auto_83924 ?auto_83925 ) ( CLEAR ?auto_83924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83926 ?auto_83925 )
      ( MAKE-7PILE ?auto_83920 ?auto_83921 ?auto_83922 ?auto_83923 ?auto_83924 ?auto_83925 ?auto_83926 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83927 - BLOCK
      ?auto_83928 - BLOCK
      ?auto_83929 - BLOCK
      ?auto_83930 - BLOCK
      ?auto_83931 - BLOCK
      ?auto_83932 - BLOCK
      ?auto_83933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83927 ) ( ON ?auto_83928 ?auto_83927 ) ( ON ?auto_83929 ?auto_83928 ) ( not ( = ?auto_83927 ?auto_83928 ) ) ( not ( = ?auto_83927 ?auto_83929 ) ) ( not ( = ?auto_83927 ?auto_83930 ) ) ( not ( = ?auto_83927 ?auto_83931 ) ) ( not ( = ?auto_83927 ?auto_83932 ) ) ( not ( = ?auto_83927 ?auto_83933 ) ) ( not ( = ?auto_83928 ?auto_83929 ) ) ( not ( = ?auto_83928 ?auto_83930 ) ) ( not ( = ?auto_83928 ?auto_83931 ) ) ( not ( = ?auto_83928 ?auto_83932 ) ) ( not ( = ?auto_83928 ?auto_83933 ) ) ( not ( = ?auto_83929 ?auto_83930 ) ) ( not ( = ?auto_83929 ?auto_83931 ) ) ( not ( = ?auto_83929 ?auto_83932 ) ) ( not ( = ?auto_83929 ?auto_83933 ) ) ( not ( = ?auto_83930 ?auto_83931 ) ) ( not ( = ?auto_83930 ?auto_83932 ) ) ( not ( = ?auto_83930 ?auto_83933 ) ) ( not ( = ?auto_83931 ?auto_83932 ) ) ( not ( = ?auto_83931 ?auto_83933 ) ) ( not ( = ?auto_83932 ?auto_83933 ) ) ( ON-TABLE ?auto_83933 ) ( ON ?auto_83932 ?auto_83933 ) ( ON ?auto_83931 ?auto_83932 ) ( CLEAR ?auto_83931 ) ( HOLDING ?auto_83930 ) ( CLEAR ?auto_83929 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83927 ?auto_83928 ?auto_83929 ?auto_83930 )
      ( MAKE-7PILE ?auto_83927 ?auto_83928 ?auto_83929 ?auto_83930 ?auto_83931 ?auto_83932 ?auto_83933 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83934 - BLOCK
      ?auto_83935 - BLOCK
      ?auto_83936 - BLOCK
      ?auto_83937 - BLOCK
      ?auto_83938 - BLOCK
      ?auto_83939 - BLOCK
      ?auto_83940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83934 ) ( ON ?auto_83935 ?auto_83934 ) ( ON ?auto_83936 ?auto_83935 ) ( not ( = ?auto_83934 ?auto_83935 ) ) ( not ( = ?auto_83934 ?auto_83936 ) ) ( not ( = ?auto_83934 ?auto_83937 ) ) ( not ( = ?auto_83934 ?auto_83938 ) ) ( not ( = ?auto_83934 ?auto_83939 ) ) ( not ( = ?auto_83934 ?auto_83940 ) ) ( not ( = ?auto_83935 ?auto_83936 ) ) ( not ( = ?auto_83935 ?auto_83937 ) ) ( not ( = ?auto_83935 ?auto_83938 ) ) ( not ( = ?auto_83935 ?auto_83939 ) ) ( not ( = ?auto_83935 ?auto_83940 ) ) ( not ( = ?auto_83936 ?auto_83937 ) ) ( not ( = ?auto_83936 ?auto_83938 ) ) ( not ( = ?auto_83936 ?auto_83939 ) ) ( not ( = ?auto_83936 ?auto_83940 ) ) ( not ( = ?auto_83937 ?auto_83938 ) ) ( not ( = ?auto_83937 ?auto_83939 ) ) ( not ( = ?auto_83937 ?auto_83940 ) ) ( not ( = ?auto_83938 ?auto_83939 ) ) ( not ( = ?auto_83938 ?auto_83940 ) ) ( not ( = ?auto_83939 ?auto_83940 ) ) ( ON-TABLE ?auto_83940 ) ( ON ?auto_83939 ?auto_83940 ) ( ON ?auto_83938 ?auto_83939 ) ( CLEAR ?auto_83936 ) ( ON ?auto_83937 ?auto_83938 ) ( CLEAR ?auto_83937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83940 ?auto_83939 ?auto_83938 )
      ( MAKE-7PILE ?auto_83934 ?auto_83935 ?auto_83936 ?auto_83937 ?auto_83938 ?auto_83939 ?auto_83940 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83941 - BLOCK
      ?auto_83942 - BLOCK
      ?auto_83943 - BLOCK
      ?auto_83944 - BLOCK
      ?auto_83945 - BLOCK
      ?auto_83946 - BLOCK
      ?auto_83947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83941 ) ( ON ?auto_83942 ?auto_83941 ) ( not ( = ?auto_83941 ?auto_83942 ) ) ( not ( = ?auto_83941 ?auto_83943 ) ) ( not ( = ?auto_83941 ?auto_83944 ) ) ( not ( = ?auto_83941 ?auto_83945 ) ) ( not ( = ?auto_83941 ?auto_83946 ) ) ( not ( = ?auto_83941 ?auto_83947 ) ) ( not ( = ?auto_83942 ?auto_83943 ) ) ( not ( = ?auto_83942 ?auto_83944 ) ) ( not ( = ?auto_83942 ?auto_83945 ) ) ( not ( = ?auto_83942 ?auto_83946 ) ) ( not ( = ?auto_83942 ?auto_83947 ) ) ( not ( = ?auto_83943 ?auto_83944 ) ) ( not ( = ?auto_83943 ?auto_83945 ) ) ( not ( = ?auto_83943 ?auto_83946 ) ) ( not ( = ?auto_83943 ?auto_83947 ) ) ( not ( = ?auto_83944 ?auto_83945 ) ) ( not ( = ?auto_83944 ?auto_83946 ) ) ( not ( = ?auto_83944 ?auto_83947 ) ) ( not ( = ?auto_83945 ?auto_83946 ) ) ( not ( = ?auto_83945 ?auto_83947 ) ) ( not ( = ?auto_83946 ?auto_83947 ) ) ( ON-TABLE ?auto_83947 ) ( ON ?auto_83946 ?auto_83947 ) ( ON ?auto_83945 ?auto_83946 ) ( ON ?auto_83944 ?auto_83945 ) ( CLEAR ?auto_83944 ) ( HOLDING ?auto_83943 ) ( CLEAR ?auto_83942 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83941 ?auto_83942 ?auto_83943 )
      ( MAKE-7PILE ?auto_83941 ?auto_83942 ?auto_83943 ?auto_83944 ?auto_83945 ?auto_83946 ?auto_83947 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83948 - BLOCK
      ?auto_83949 - BLOCK
      ?auto_83950 - BLOCK
      ?auto_83951 - BLOCK
      ?auto_83952 - BLOCK
      ?auto_83953 - BLOCK
      ?auto_83954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83948 ) ( ON ?auto_83949 ?auto_83948 ) ( not ( = ?auto_83948 ?auto_83949 ) ) ( not ( = ?auto_83948 ?auto_83950 ) ) ( not ( = ?auto_83948 ?auto_83951 ) ) ( not ( = ?auto_83948 ?auto_83952 ) ) ( not ( = ?auto_83948 ?auto_83953 ) ) ( not ( = ?auto_83948 ?auto_83954 ) ) ( not ( = ?auto_83949 ?auto_83950 ) ) ( not ( = ?auto_83949 ?auto_83951 ) ) ( not ( = ?auto_83949 ?auto_83952 ) ) ( not ( = ?auto_83949 ?auto_83953 ) ) ( not ( = ?auto_83949 ?auto_83954 ) ) ( not ( = ?auto_83950 ?auto_83951 ) ) ( not ( = ?auto_83950 ?auto_83952 ) ) ( not ( = ?auto_83950 ?auto_83953 ) ) ( not ( = ?auto_83950 ?auto_83954 ) ) ( not ( = ?auto_83951 ?auto_83952 ) ) ( not ( = ?auto_83951 ?auto_83953 ) ) ( not ( = ?auto_83951 ?auto_83954 ) ) ( not ( = ?auto_83952 ?auto_83953 ) ) ( not ( = ?auto_83952 ?auto_83954 ) ) ( not ( = ?auto_83953 ?auto_83954 ) ) ( ON-TABLE ?auto_83954 ) ( ON ?auto_83953 ?auto_83954 ) ( ON ?auto_83952 ?auto_83953 ) ( ON ?auto_83951 ?auto_83952 ) ( CLEAR ?auto_83949 ) ( ON ?auto_83950 ?auto_83951 ) ( CLEAR ?auto_83950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83954 ?auto_83953 ?auto_83952 ?auto_83951 )
      ( MAKE-7PILE ?auto_83948 ?auto_83949 ?auto_83950 ?auto_83951 ?auto_83952 ?auto_83953 ?auto_83954 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83955 - BLOCK
      ?auto_83956 - BLOCK
      ?auto_83957 - BLOCK
      ?auto_83958 - BLOCK
      ?auto_83959 - BLOCK
      ?auto_83960 - BLOCK
      ?auto_83961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83955 ) ( not ( = ?auto_83955 ?auto_83956 ) ) ( not ( = ?auto_83955 ?auto_83957 ) ) ( not ( = ?auto_83955 ?auto_83958 ) ) ( not ( = ?auto_83955 ?auto_83959 ) ) ( not ( = ?auto_83955 ?auto_83960 ) ) ( not ( = ?auto_83955 ?auto_83961 ) ) ( not ( = ?auto_83956 ?auto_83957 ) ) ( not ( = ?auto_83956 ?auto_83958 ) ) ( not ( = ?auto_83956 ?auto_83959 ) ) ( not ( = ?auto_83956 ?auto_83960 ) ) ( not ( = ?auto_83956 ?auto_83961 ) ) ( not ( = ?auto_83957 ?auto_83958 ) ) ( not ( = ?auto_83957 ?auto_83959 ) ) ( not ( = ?auto_83957 ?auto_83960 ) ) ( not ( = ?auto_83957 ?auto_83961 ) ) ( not ( = ?auto_83958 ?auto_83959 ) ) ( not ( = ?auto_83958 ?auto_83960 ) ) ( not ( = ?auto_83958 ?auto_83961 ) ) ( not ( = ?auto_83959 ?auto_83960 ) ) ( not ( = ?auto_83959 ?auto_83961 ) ) ( not ( = ?auto_83960 ?auto_83961 ) ) ( ON-TABLE ?auto_83961 ) ( ON ?auto_83960 ?auto_83961 ) ( ON ?auto_83959 ?auto_83960 ) ( ON ?auto_83958 ?auto_83959 ) ( ON ?auto_83957 ?auto_83958 ) ( CLEAR ?auto_83957 ) ( HOLDING ?auto_83956 ) ( CLEAR ?auto_83955 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83955 ?auto_83956 )
      ( MAKE-7PILE ?auto_83955 ?auto_83956 ?auto_83957 ?auto_83958 ?auto_83959 ?auto_83960 ?auto_83961 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83962 - BLOCK
      ?auto_83963 - BLOCK
      ?auto_83964 - BLOCK
      ?auto_83965 - BLOCK
      ?auto_83966 - BLOCK
      ?auto_83967 - BLOCK
      ?auto_83968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83962 ) ( not ( = ?auto_83962 ?auto_83963 ) ) ( not ( = ?auto_83962 ?auto_83964 ) ) ( not ( = ?auto_83962 ?auto_83965 ) ) ( not ( = ?auto_83962 ?auto_83966 ) ) ( not ( = ?auto_83962 ?auto_83967 ) ) ( not ( = ?auto_83962 ?auto_83968 ) ) ( not ( = ?auto_83963 ?auto_83964 ) ) ( not ( = ?auto_83963 ?auto_83965 ) ) ( not ( = ?auto_83963 ?auto_83966 ) ) ( not ( = ?auto_83963 ?auto_83967 ) ) ( not ( = ?auto_83963 ?auto_83968 ) ) ( not ( = ?auto_83964 ?auto_83965 ) ) ( not ( = ?auto_83964 ?auto_83966 ) ) ( not ( = ?auto_83964 ?auto_83967 ) ) ( not ( = ?auto_83964 ?auto_83968 ) ) ( not ( = ?auto_83965 ?auto_83966 ) ) ( not ( = ?auto_83965 ?auto_83967 ) ) ( not ( = ?auto_83965 ?auto_83968 ) ) ( not ( = ?auto_83966 ?auto_83967 ) ) ( not ( = ?auto_83966 ?auto_83968 ) ) ( not ( = ?auto_83967 ?auto_83968 ) ) ( ON-TABLE ?auto_83968 ) ( ON ?auto_83967 ?auto_83968 ) ( ON ?auto_83966 ?auto_83967 ) ( ON ?auto_83965 ?auto_83966 ) ( ON ?auto_83964 ?auto_83965 ) ( CLEAR ?auto_83962 ) ( ON ?auto_83963 ?auto_83964 ) ( CLEAR ?auto_83963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83968 ?auto_83967 ?auto_83966 ?auto_83965 ?auto_83964 )
      ( MAKE-7PILE ?auto_83962 ?auto_83963 ?auto_83964 ?auto_83965 ?auto_83966 ?auto_83967 ?auto_83968 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83969 - BLOCK
      ?auto_83970 - BLOCK
      ?auto_83971 - BLOCK
      ?auto_83972 - BLOCK
      ?auto_83973 - BLOCK
      ?auto_83974 - BLOCK
      ?auto_83975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83969 ?auto_83970 ) ) ( not ( = ?auto_83969 ?auto_83971 ) ) ( not ( = ?auto_83969 ?auto_83972 ) ) ( not ( = ?auto_83969 ?auto_83973 ) ) ( not ( = ?auto_83969 ?auto_83974 ) ) ( not ( = ?auto_83969 ?auto_83975 ) ) ( not ( = ?auto_83970 ?auto_83971 ) ) ( not ( = ?auto_83970 ?auto_83972 ) ) ( not ( = ?auto_83970 ?auto_83973 ) ) ( not ( = ?auto_83970 ?auto_83974 ) ) ( not ( = ?auto_83970 ?auto_83975 ) ) ( not ( = ?auto_83971 ?auto_83972 ) ) ( not ( = ?auto_83971 ?auto_83973 ) ) ( not ( = ?auto_83971 ?auto_83974 ) ) ( not ( = ?auto_83971 ?auto_83975 ) ) ( not ( = ?auto_83972 ?auto_83973 ) ) ( not ( = ?auto_83972 ?auto_83974 ) ) ( not ( = ?auto_83972 ?auto_83975 ) ) ( not ( = ?auto_83973 ?auto_83974 ) ) ( not ( = ?auto_83973 ?auto_83975 ) ) ( not ( = ?auto_83974 ?auto_83975 ) ) ( ON-TABLE ?auto_83975 ) ( ON ?auto_83974 ?auto_83975 ) ( ON ?auto_83973 ?auto_83974 ) ( ON ?auto_83972 ?auto_83973 ) ( ON ?auto_83971 ?auto_83972 ) ( ON ?auto_83970 ?auto_83971 ) ( CLEAR ?auto_83970 ) ( HOLDING ?auto_83969 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83969 )
      ( MAKE-7PILE ?auto_83969 ?auto_83970 ?auto_83971 ?auto_83972 ?auto_83973 ?auto_83974 ?auto_83975 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83976 - BLOCK
      ?auto_83977 - BLOCK
      ?auto_83978 - BLOCK
      ?auto_83979 - BLOCK
      ?auto_83980 - BLOCK
      ?auto_83981 - BLOCK
      ?auto_83982 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83976 ?auto_83977 ) ) ( not ( = ?auto_83976 ?auto_83978 ) ) ( not ( = ?auto_83976 ?auto_83979 ) ) ( not ( = ?auto_83976 ?auto_83980 ) ) ( not ( = ?auto_83976 ?auto_83981 ) ) ( not ( = ?auto_83976 ?auto_83982 ) ) ( not ( = ?auto_83977 ?auto_83978 ) ) ( not ( = ?auto_83977 ?auto_83979 ) ) ( not ( = ?auto_83977 ?auto_83980 ) ) ( not ( = ?auto_83977 ?auto_83981 ) ) ( not ( = ?auto_83977 ?auto_83982 ) ) ( not ( = ?auto_83978 ?auto_83979 ) ) ( not ( = ?auto_83978 ?auto_83980 ) ) ( not ( = ?auto_83978 ?auto_83981 ) ) ( not ( = ?auto_83978 ?auto_83982 ) ) ( not ( = ?auto_83979 ?auto_83980 ) ) ( not ( = ?auto_83979 ?auto_83981 ) ) ( not ( = ?auto_83979 ?auto_83982 ) ) ( not ( = ?auto_83980 ?auto_83981 ) ) ( not ( = ?auto_83980 ?auto_83982 ) ) ( not ( = ?auto_83981 ?auto_83982 ) ) ( ON-TABLE ?auto_83982 ) ( ON ?auto_83981 ?auto_83982 ) ( ON ?auto_83980 ?auto_83981 ) ( ON ?auto_83979 ?auto_83980 ) ( ON ?auto_83978 ?auto_83979 ) ( ON ?auto_83977 ?auto_83978 ) ( ON ?auto_83976 ?auto_83977 ) ( CLEAR ?auto_83976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83982 ?auto_83981 ?auto_83980 ?auto_83979 ?auto_83978 ?auto_83977 )
      ( MAKE-7PILE ?auto_83976 ?auto_83977 ?auto_83978 ?auto_83979 ?auto_83980 ?auto_83981 ?auto_83982 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83990 - BLOCK
      ?auto_83991 - BLOCK
      ?auto_83992 - BLOCK
      ?auto_83993 - BLOCK
      ?auto_83994 - BLOCK
      ?auto_83995 - BLOCK
      ?auto_83996 - BLOCK
    )
    :vars
    (
      ?auto_83997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83990 ?auto_83991 ) ) ( not ( = ?auto_83990 ?auto_83992 ) ) ( not ( = ?auto_83990 ?auto_83993 ) ) ( not ( = ?auto_83990 ?auto_83994 ) ) ( not ( = ?auto_83990 ?auto_83995 ) ) ( not ( = ?auto_83990 ?auto_83996 ) ) ( not ( = ?auto_83991 ?auto_83992 ) ) ( not ( = ?auto_83991 ?auto_83993 ) ) ( not ( = ?auto_83991 ?auto_83994 ) ) ( not ( = ?auto_83991 ?auto_83995 ) ) ( not ( = ?auto_83991 ?auto_83996 ) ) ( not ( = ?auto_83992 ?auto_83993 ) ) ( not ( = ?auto_83992 ?auto_83994 ) ) ( not ( = ?auto_83992 ?auto_83995 ) ) ( not ( = ?auto_83992 ?auto_83996 ) ) ( not ( = ?auto_83993 ?auto_83994 ) ) ( not ( = ?auto_83993 ?auto_83995 ) ) ( not ( = ?auto_83993 ?auto_83996 ) ) ( not ( = ?auto_83994 ?auto_83995 ) ) ( not ( = ?auto_83994 ?auto_83996 ) ) ( not ( = ?auto_83995 ?auto_83996 ) ) ( ON-TABLE ?auto_83996 ) ( ON ?auto_83995 ?auto_83996 ) ( ON ?auto_83994 ?auto_83995 ) ( ON ?auto_83993 ?auto_83994 ) ( ON ?auto_83992 ?auto_83993 ) ( ON ?auto_83991 ?auto_83992 ) ( CLEAR ?auto_83991 ) ( ON ?auto_83990 ?auto_83997 ) ( CLEAR ?auto_83990 ) ( HAND-EMPTY ) ( not ( = ?auto_83990 ?auto_83997 ) ) ( not ( = ?auto_83991 ?auto_83997 ) ) ( not ( = ?auto_83992 ?auto_83997 ) ) ( not ( = ?auto_83993 ?auto_83997 ) ) ( not ( = ?auto_83994 ?auto_83997 ) ) ( not ( = ?auto_83995 ?auto_83997 ) ) ( not ( = ?auto_83996 ?auto_83997 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83990 ?auto_83997 )
      ( MAKE-7PILE ?auto_83990 ?auto_83991 ?auto_83992 ?auto_83993 ?auto_83994 ?auto_83995 ?auto_83996 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83998 - BLOCK
      ?auto_83999 - BLOCK
      ?auto_84000 - BLOCK
      ?auto_84001 - BLOCK
      ?auto_84002 - BLOCK
      ?auto_84003 - BLOCK
      ?auto_84004 - BLOCK
    )
    :vars
    (
      ?auto_84005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83998 ?auto_83999 ) ) ( not ( = ?auto_83998 ?auto_84000 ) ) ( not ( = ?auto_83998 ?auto_84001 ) ) ( not ( = ?auto_83998 ?auto_84002 ) ) ( not ( = ?auto_83998 ?auto_84003 ) ) ( not ( = ?auto_83998 ?auto_84004 ) ) ( not ( = ?auto_83999 ?auto_84000 ) ) ( not ( = ?auto_83999 ?auto_84001 ) ) ( not ( = ?auto_83999 ?auto_84002 ) ) ( not ( = ?auto_83999 ?auto_84003 ) ) ( not ( = ?auto_83999 ?auto_84004 ) ) ( not ( = ?auto_84000 ?auto_84001 ) ) ( not ( = ?auto_84000 ?auto_84002 ) ) ( not ( = ?auto_84000 ?auto_84003 ) ) ( not ( = ?auto_84000 ?auto_84004 ) ) ( not ( = ?auto_84001 ?auto_84002 ) ) ( not ( = ?auto_84001 ?auto_84003 ) ) ( not ( = ?auto_84001 ?auto_84004 ) ) ( not ( = ?auto_84002 ?auto_84003 ) ) ( not ( = ?auto_84002 ?auto_84004 ) ) ( not ( = ?auto_84003 ?auto_84004 ) ) ( ON-TABLE ?auto_84004 ) ( ON ?auto_84003 ?auto_84004 ) ( ON ?auto_84002 ?auto_84003 ) ( ON ?auto_84001 ?auto_84002 ) ( ON ?auto_84000 ?auto_84001 ) ( ON ?auto_83998 ?auto_84005 ) ( CLEAR ?auto_83998 ) ( not ( = ?auto_83998 ?auto_84005 ) ) ( not ( = ?auto_83999 ?auto_84005 ) ) ( not ( = ?auto_84000 ?auto_84005 ) ) ( not ( = ?auto_84001 ?auto_84005 ) ) ( not ( = ?auto_84002 ?auto_84005 ) ) ( not ( = ?auto_84003 ?auto_84005 ) ) ( not ( = ?auto_84004 ?auto_84005 ) ) ( HOLDING ?auto_83999 ) ( CLEAR ?auto_84000 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84004 ?auto_84003 ?auto_84002 ?auto_84001 ?auto_84000 ?auto_83999 )
      ( MAKE-7PILE ?auto_83998 ?auto_83999 ?auto_84000 ?auto_84001 ?auto_84002 ?auto_84003 ?auto_84004 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84006 - BLOCK
      ?auto_84007 - BLOCK
      ?auto_84008 - BLOCK
      ?auto_84009 - BLOCK
      ?auto_84010 - BLOCK
      ?auto_84011 - BLOCK
      ?auto_84012 - BLOCK
    )
    :vars
    (
      ?auto_84013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84006 ?auto_84007 ) ) ( not ( = ?auto_84006 ?auto_84008 ) ) ( not ( = ?auto_84006 ?auto_84009 ) ) ( not ( = ?auto_84006 ?auto_84010 ) ) ( not ( = ?auto_84006 ?auto_84011 ) ) ( not ( = ?auto_84006 ?auto_84012 ) ) ( not ( = ?auto_84007 ?auto_84008 ) ) ( not ( = ?auto_84007 ?auto_84009 ) ) ( not ( = ?auto_84007 ?auto_84010 ) ) ( not ( = ?auto_84007 ?auto_84011 ) ) ( not ( = ?auto_84007 ?auto_84012 ) ) ( not ( = ?auto_84008 ?auto_84009 ) ) ( not ( = ?auto_84008 ?auto_84010 ) ) ( not ( = ?auto_84008 ?auto_84011 ) ) ( not ( = ?auto_84008 ?auto_84012 ) ) ( not ( = ?auto_84009 ?auto_84010 ) ) ( not ( = ?auto_84009 ?auto_84011 ) ) ( not ( = ?auto_84009 ?auto_84012 ) ) ( not ( = ?auto_84010 ?auto_84011 ) ) ( not ( = ?auto_84010 ?auto_84012 ) ) ( not ( = ?auto_84011 ?auto_84012 ) ) ( ON-TABLE ?auto_84012 ) ( ON ?auto_84011 ?auto_84012 ) ( ON ?auto_84010 ?auto_84011 ) ( ON ?auto_84009 ?auto_84010 ) ( ON ?auto_84008 ?auto_84009 ) ( ON ?auto_84006 ?auto_84013 ) ( not ( = ?auto_84006 ?auto_84013 ) ) ( not ( = ?auto_84007 ?auto_84013 ) ) ( not ( = ?auto_84008 ?auto_84013 ) ) ( not ( = ?auto_84009 ?auto_84013 ) ) ( not ( = ?auto_84010 ?auto_84013 ) ) ( not ( = ?auto_84011 ?auto_84013 ) ) ( not ( = ?auto_84012 ?auto_84013 ) ) ( CLEAR ?auto_84008 ) ( ON ?auto_84007 ?auto_84006 ) ( CLEAR ?auto_84007 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84013 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84013 ?auto_84006 )
      ( MAKE-7PILE ?auto_84006 ?auto_84007 ?auto_84008 ?auto_84009 ?auto_84010 ?auto_84011 ?auto_84012 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84014 - BLOCK
      ?auto_84015 - BLOCK
      ?auto_84016 - BLOCK
      ?auto_84017 - BLOCK
      ?auto_84018 - BLOCK
      ?auto_84019 - BLOCK
      ?auto_84020 - BLOCK
    )
    :vars
    (
      ?auto_84021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84014 ?auto_84015 ) ) ( not ( = ?auto_84014 ?auto_84016 ) ) ( not ( = ?auto_84014 ?auto_84017 ) ) ( not ( = ?auto_84014 ?auto_84018 ) ) ( not ( = ?auto_84014 ?auto_84019 ) ) ( not ( = ?auto_84014 ?auto_84020 ) ) ( not ( = ?auto_84015 ?auto_84016 ) ) ( not ( = ?auto_84015 ?auto_84017 ) ) ( not ( = ?auto_84015 ?auto_84018 ) ) ( not ( = ?auto_84015 ?auto_84019 ) ) ( not ( = ?auto_84015 ?auto_84020 ) ) ( not ( = ?auto_84016 ?auto_84017 ) ) ( not ( = ?auto_84016 ?auto_84018 ) ) ( not ( = ?auto_84016 ?auto_84019 ) ) ( not ( = ?auto_84016 ?auto_84020 ) ) ( not ( = ?auto_84017 ?auto_84018 ) ) ( not ( = ?auto_84017 ?auto_84019 ) ) ( not ( = ?auto_84017 ?auto_84020 ) ) ( not ( = ?auto_84018 ?auto_84019 ) ) ( not ( = ?auto_84018 ?auto_84020 ) ) ( not ( = ?auto_84019 ?auto_84020 ) ) ( ON-TABLE ?auto_84020 ) ( ON ?auto_84019 ?auto_84020 ) ( ON ?auto_84018 ?auto_84019 ) ( ON ?auto_84017 ?auto_84018 ) ( ON ?auto_84014 ?auto_84021 ) ( not ( = ?auto_84014 ?auto_84021 ) ) ( not ( = ?auto_84015 ?auto_84021 ) ) ( not ( = ?auto_84016 ?auto_84021 ) ) ( not ( = ?auto_84017 ?auto_84021 ) ) ( not ( = ?auto_84018 ?auto_84021 ) ) ( not ( = ?auto_84019 ?auto_84021 ) ) ( not ( = ?auto_84020 ?auto_84021 ) ) ( ON ?auto_84015 ?auto_84014 ) ( CLEAR ?auto_84015 ) ( ON-TABLE ?auto_84021 ) ( HOLDING ?auto_84016 ) ( CLEAR ?auto_84017 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84020 ?auto_84019 ?auto_84018 ?auto_84017 ?auto_84016 )
      ( MAKE-7PILE ?auto_84014 ?auto_84015 ?auto_84016 ?auto_84017 ?auto_84018 ?auto_84019 ?auto_84020 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84022 - BLOCK
      ?auto_84023 - BLOCK
      ?auto_84024 - BLOCK
      ?auto_84025 - BLOCK
      ?auto_84026 - BLOCK
      ?auto_84027 - BLOCK
      ?auto_84028 - BLOCK
    )
    :vars
    (
      ?auto_84029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84022 ?auto_84023 ) ) ( not ( = ?auto_84022 ?auto_84024 ) ) ( not ( = ?auto_84022 ?auto_84025 ) ) ( not ( = ?auto_84022 ?auto_84026 ) ) ( not ( = ?auto_84022 ?auto_84027 ) ) ( not ( = ?auto_84022 ?auto_84028 ) ) ( not ( = ?auto_84023 ?auto_84024 ) ) ( not ( = ?auto_84023 ?auto_84025 ) ) ( not ( = ?auto_84023 ?auto_84026 ) ) ( not ( = ?auto_84023 ?auto_84027 ) ) ( not ( = ?auto_84023 ?auto_84028 ) ) ( not ( = ?auto_84024 ?auto_84025 ) ) ( not ( = ?auto_84024 ?auto_84026 ) ) ( not ( = ?auto_84024 ?auto_84027 ) ) ( not ( = ?auto_84024 ?auto_84028 ) ) ( not ( = ?auto_84025 ?auto_84026 ) ) ( not ( = ?auto_84025 ?auto_84027 ) ) ( not ( = ?auto_84025 ?auto_84028 ) ) ( not ( = ?auto_84026 ?auto_84027 ) ) ( not ( = ?auto_84026 ?auto_84028 ) ) ( not ( = ?auto_84027 ?auto_84028 ) ) ( ON-TABLE ?auto_84028 ) ( ON ?auto_84027 ?auto_84028 ) ( ON ?auto_84026 ?auto_84027 ) ( ON ?auto_84025 ?auto_84026 ) ( ON ?auto_84022 ?auto_84029 ) ( not ( = ?auto_84022 ?auto_84029 ) ) ( not ( = ?auto_84023 ?auto_84029 ) ) ( not ( = ?auto_84024 ?auto_84029 ) ) ( not ( = ?auto_84025 ?auto_84029 ) ) ( not ( = ?auto_84026 ?auto_84029 ) ) ( not ( = ?auto_84027 ?auto_84029 ) ) ( not ( = ?auto_84028 ?auto_84029 ) ) ( ON ?auto_84023 ?auto_84022 ) ( ON-TABLE ?auto_84029 ) ( CLEAR ?auto_84025 ) ( ON ?auto_84024 ?auto_84023 ) ( CLEAR ?auto_84024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84029 ?auto_84022 ?auto_84023 )
      ( MAKE-7PILE ?auto_84022 ?auto_84023 ?auto_84024 ?auto_84025 ?auto_84026 ?auto_84027 ?auto_84028 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84030 - BLOCK
      ?auto_84031 - BLOCK
      ?auto_84032 - BLOCK
      ?auto_84033 - BLOCK
      ?auto_84034 - BLOCK
      ?auto_84035 - BLOCK
      ?auto_84036 - BLOCK
    )
    :vars
    (
      ?auto_84037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84030 ?auto_84031 ) ) ( not ( = ?auto_84030 ?auto_84032 ) ) ( not ( = ?auto_84030 ?auto_84033 ) ) ( not ( = ?auto_84030 ?auto_84034 ) ) ( not ( = ?auto_84030 ?auto_84035 ) ) ( not ( = ?auto_84030 ?auto_84036 ) ) ( not ( = ?auto_84031 ?auto_84032 ) ) ( not ( = ?auto_84031 ?auto_84033 ) ) ( not ( = ?auto_84031 ?auto_84034 ) ) ( not ( = ?auto_84031 ?auto_84035 ) ) ( not ( = ?auto_84031 ?auto_84036 ) ) ( not ( = ?auto_84032 ?auto_84033 ) ) ( not ( = ?auto_84032 ?auto_84034 ) ) ( not ( = ?auto_84032 ?auto_84035 ) ) ( not ( = ?auto_84032 ?auto_84036 ) ) ( not ( = ?auto_84033 ?auto_84034 ) ) ( not ( = ?auto_84033 ?auto_84035 ) ) ( not ( = ?auto_84033 ?auto_84036 ) ) ( not ( = ?auto_84034 ?auto_84035 ) ) ( not ( = ?auto_84034 ?auto_84036 ) ) ( not ( = ?auto_84035 ?auto_84036 ) ) ( ON-TABLE ?auto_84036 ) ( ON ?auto_84035 ?auto_84036 ) ( ON ?auto_84034 ?auto_84035 ) ( ON ?auto_84030 ?auto_84037 ) ( not ( = ?auto_84030 ?auto_84037 ) ) ( not ( = ?auto_84031 ?auto_84037 ) ) ( not ( = ?auto_84032 ?auto_84037 ) ) ( not ( = ?auto_84033 ?auto_84037 ) ) ( not ( = ?auto_84034 ?auto_84037 ) ) ( not ( = ?auto_84035 ?auto_84037 ) ) ( not ( = ?auto_84036 ?auto_84037 ) ) ( ON ?auto_84031 ?auto_84030 ) ( ON-TABLE ?auto_84037 ) ( ON ?auto_84032 ?auto_84031 ) ( CLEAR ?auto_84032 ) ( HOLDING ?auto_84033 ) ( CLEAR ?auto_84034 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84036 ?auto_84035 ?auto_84034 ?auto_84033 )
      ( MAKE-7PILE ?auto_84030 ?auto_84031 ?auto_84032 ?auto_84033 ?auto_84034 ?auto_84035 ?auto_84036 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84038 - BLOCK
      ?auto_84039 - BLOCK
      ?auto_84040 - BLOCK
      ?auto_84041 - BLOCK
      ?auto_84042 - BLOCK
      ?auto_84043 - BLOCK
      ?auto_84044 - BLOCK
    )
    :vars
    (
      ?auto_84045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84038 ?auto_84039 ) ) ( not ( = ?auto_84038 ?auto_84040 ) ) ( not ( = ?auto_84038 ?auto_84041 ) ) ( not ( = ?auto_84038 ?auto_84042 ) ) ( not ( = ?auto_84038 ?auto_84043 ) ) ( not ( = ?auto_84038 ?auto_84044 ) ) ( not ( = ?auto_84039 ?auto_84040 ) ) ( not ( = ?auto_84039 ?auto_84041 ) ) ( not ( = ?auto_84039 ?auto_84042 ) ) ( not ( = ?auto_84039 ?auto_84043 ) ) ( not ( = ?auto_84039 ?auto_84044 ) ) ( not ( = ?auto_84040 ?auto_84041 ) ) ( not ( = ?auto_84040 ?auto_84042 ) ) ( not ( = ?auto_84040 ?auto_84043 ) ) ( not ( = ?auto_84040 ?auto_84044 ) ) ( not ( = ?auto_84041 ?auto_84042 ) ) ( not ( = ?auto_84041 ?auto_84043 ) ) ( not ( = ?auto_84041 ?auto_84044 ) ) ( not ( = ?auto_84042 ?auto_84043 ) ) ( not ( = ?auto_84042 ?auto_84044 ) ) ( not ( = ?auto_84043 ?auto_84044 ) ) ( ON-TABLE ?auto_84044 ) ( ON ?auto_84043 ?auto_84044 ) ( ON ?auto_84042 ?auto_84043 ) ( ON ?auto_84038 ?auto_84045 ) ( not ( = ?auto_84038 ?auto_84045 ) ) ( not ( = ?auto_84039 ?auto_84045 ) ) ( not ( = ?auto_84040 ?auto_84045 ) ) ( not ( = ?auto_84041 ?auto_84045 ) ) ( not ( = ?auto_84042 ?auto_84045 ) ) ( not ( = ?auto_84043 ?auto_84045 ) ) ( not ( = ?auto_84044 ?auto_84045 ) ) ( ON ?auto_84039 ?auto_84038 ) ( ON-TABLE ?auto_84045 ) ( ON ?auto_84040 ?auto_84039 ) ( CLEAR ?auto_84042 ) ( ON ?auto_84041 ?auto_84040 ) ( CLEAR ?auto_84041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84045 ?auto_84038 ?auto_84039 ?auto_84040 )
      ( MAKE-7PILE ?auto_84038 ?auto_84039 ?auto_84040 ?auto_84041 ?auto_84042 ?auto_84043 ?auto_84044 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84046 - BLOCK
      ?auto_84047 - BLOCK
      ?auto_84048 - BLOCK
      ?auto_84049 - BLOCK
      ?auto_84050 - BLOCK
      ?auto_84051 - BLOCK
      ?auto_84052 - BLOCK
    )
    :vars
    (
      ?auto_84053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84046 ?auto_84047 ) ) ( not ( = ?auto_84046 ?auto_84048 ) ) ( not ( = ?auto_84046 ?auto_84049 ) ) ( not ( = ?auto_84046 ?auto_84050 ) ) ( not ( = ?auto_84046 ?auto_84051 ) ) ( not ( = ?auto_84046 ?auto_84052 ) ) ( not ( = ?auto_84047 ?auto_84048 ) ) ( not ( = ?auto_84047 ?auto_84049 ) ) ( not ( = ?auto_84047 ?auto_84050 ) ) ( not ( = ?auto_84047 ?auto_84051 ) ) ( not ( = ?auto_84047 ?auto_84052 ) ) ( not ( = ?auto_84048 ?auto_84049 ) ) ( not ( = ?auto_84048 ?auto_84050 ) ) ( not ( = ?auto_84048 ?auto_84051 ) ) ( not ( = ?auto_84048 ?auto_84052 ) ) ( not ( = ?auto_84049 ?auto_84050 ) ) ( not ( = ?auto_84049 ?auto_84051 ) ) ( not ( = ?auto_84049 ?auto_84052 ) ) ( not ( = ?auto_84050 ?auto_84051 ) ) ( not ( = ?auto_84050 ?auto_84052 ) ) ( not ( = ?auto_84051 ?auto_84052 ) ) ( ON-TABLE ?auto_84052 ) ( ON ?auto_84051 ?auto_84052 ) ( ON ?auto_84046 ?auto_84053 ) ( not ( = ?auto_84046 ?auto_84053 ) ) ( not ( = ?auto_84047 ?auto_84053 ) ) ( not ( = ?auto_84048 ?auto_84053 ) ) ( not ( = ?auto_84049 ?auto_84053 ) ) ( not ( = ?auto_84050 ?auto_84053 ) ) ( not ( = ?auto_84051 ?auto_84053 ) ) ( not ( = ?auto_84052 ?auto_84053 ) ) ( ON ?auto_84047 ?auto_84046 ) ( ON-TABLE ?auto_84053 ) ( ON ?auto_84048 ?auto_84047 ) ( ON ?auto_84049 ?auto_84048 ) ( CLEAR ?auto_84049 ) ( HOLDING ?auto_84050 ) ( CLEAR ?auto_84051 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84052 ?auto_84051 ?auto_84050 )
      ( MAKE-7PILE ?auto_84046 ?auto_84047 ?auto_84048 ?auto_84049 ?auto_84050 ?auto_84051 ?auto_84052 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84054 - BLOCK
      ?auto_84055 - BLOCK
      ?auto_84056 - BLOCK
      ?auto_84057 - BLOCK
      ?auto_84058 - BLOCK
      ?auto_84059 - BLOCK
      ?auto_84060 - BLOCK
    )
    :vars
    (
      ?auto_84061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84054 ?auto_84055 ) ) ( not ( = ?auto_84054 ?auto_84056 ) ) ( not ( = ?auto_84054 ?auto_84057 ) ) ( not ( = ?auto_84054 ?auto_84058 ) ) ( not ( = ?auto_84054 ?auto_84059 ) ) ( not ( = ?auto_84054 ?auto_84060 ) ) ( not ( = ?auto_84055 ?auto_84056 ) ) ( not ( = ?auto_84055 ?auto_84057 ) ) ( not ( = ?auto_84055 ?auto_84058 ) ) ( not ( = ?auto_84055 ?auto_84059 ) ) ( not ( = ?auto_84055 ?auto_84060 ) ) ( not ( = ?auto_84056 ?auto_84057 ) ) ( not ( = ?auto_84056 ?auto_84058 ) ) ( not ( = ?auto_84056 ?auto_84059 ) ) ( not ( = ?auto_84056 ?auto_84060 ) ) ( not ( = ?auto_84057 ?auto_84058 ) ) ( not ( = ?auto_84057 ?auto_84059 ) ) ( not ( = ?auto_84057 ?auto_84060 ) ) ( not ( = ?auto_84058 ?auto_84059 ) ) ( not ( = ?auto_84058 ?auto_84060 ) ) ( not ( = ?auto_84059 ?auto_84060 ) ) ( ON-TABLE ?auto_84060 ) ( ON ?auto_84059 ?auto_84060 ) ( ON ?auto_84054 ?auto_84061 ) ( not ( = ?auto_84054 ?auto_84061 ) ) ( not ( = ?auto_84055 ?auto_84061 ) ) ( not ( = ?auto_84056 ?auto_84061 ) ) ( not ( = ?auto_84057 ?auto_84061 ) ) ( not ( = ?auto_84058 ?auto_84061 ) ) ( not ( = ?auto_84059 ?auto_84061 ) ) ( not ( = ?auto_84060 ?auto_84061 ) ) ( ON ?auto_84055 ?auto_84054 ) ( ON-TABLE ?auto_84061 ) ( ON ?auto_84056 ?auto_84055 ) ( ON ?auto_84057 ?auto_84056 ) ( CLEAR ?auto_84059 ) ( ON ?auto_84058 ?auto_84057 ) ( CLEAR ?auto_84058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84061 ?auto_84054 ?auto_84055 ?auto_84056 ?auto_84057 )
      ( MAKE-7PILE ?auto_84054 ?auto_84055 ?auto_84056 ?auto_84057 ?auto_84058 ?auto_84059 ?auto_84060 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84062 - BLOCK
      ?auto_84063 - BLOCK
      ?auto_84064 - BLOCK
      ?auto_84065 - BLOCK
      ?auto_84066 - BLOCK
      ?auto_84067 - BLOCK
      ?auto_84068 - BLOCK
    )
    :vars
    (
      ?auto_84069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84062 ?auto_84063 ) ) ( not ( = ?auto_84062 ?auto_84064 ) ) ( not ( = ?auto_84062 ?auto_84065 ) ) ( not ( = ?auto_84062 ?auto_84066 ) ) ( not ( = ?auto_84062 ?auto_84067 ) ) ( not ( = ?auto_84062 ?auto_84068 ) ) ( not ( = ?auto_84063 ?auto_84064 ) ) ( not ( = ?auto_84063 ?auto_84065 ) ) ( not ( = ?auto_84063 ?auto_84066 ) ) ( not ( = ?auto_84063 ?auto_84067 ) ) ( not ( = ?auto_84063 ?auto_84068 ) ) ( not ( = ?auto_84064 ?auto_84065 ) ) ( not ( = ?auto_84064 ?auto_84066 ) ) ( not ( = ?auto_84064 ?auto_84067 ) ) ( not ( = ?auto_84064 ?auto_84068 ) ) ( not ( = ?auto_84065 ?auto_84066 ) ) ( not ( = ?auto_84065 ?auto_84067 ) ) ( not ( = ?auto_84065 ?auto_84068 ) ) ( not ( = ?auto_84066 ?auto_84067 ) ) ( not ( = ?auto_84066 ?auto_84068 ) ) ( not ( = ?auto_84067 ?auto_84068 ) ) ( ON-TABLE ?auto_84068 ) ( ON ?auto_84062 ?auto_84069 ) ( not ( = ?auto_84062 ?auto_84069 ) ) ( not ( = ?auto_84063 ?auto_84069 ) ) ( not ( = ?auto_84064 ?auto_84069 ) ) ( not ( = ?auto_84065 ?auto_84069 ) ) ( not ( = ?auto_84066 ?auto_84069 ) ) ( not ( = ?auto_84067 ?auto_84069 ) ) ( not ( = ?auto_84068 ?auto_84069 ) ) ( ON ?auto_84063 ?auto_84062 ) ( ON-TABLE ?auto_84069 ) ( ON ?auto_84064 ?auto_84063 ) ( ON ?auto_84065 ?auto_84064 ) ( ON ?auto_84066 ?auto_84065 ) ( CLEAR ?auto_84066 ) ( HOLDING ?auto_84067 ) ( CLEAR ?auto_84068 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84068 ?auto_84067 )
      ( MAKE-7PILE ?auto_84062 ?auto_84063 ?auto_84064 ?auto_84065 ?auto_84066 ?auto_84067 ?auto_84068 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84070 - BLOCK
      ?auto_84071 - BLOCK
      ?auto_84072 - BLOCK
      ?auto_84073 - BLOCK
      ?auto_84074 - BLOCK
      ?auto_84075 - BLOCK
      ?auto_84076 - BLOCK
    )
    :vars
    (
      ?auto_84077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84070 ?auto_84071 ) ) ( not ( = ?auto_84070 ?auto_84072 ) ) ( not ( = ?auto_84070 ?auto_84073 ) ) ( not ( = ?auto_84070 ?auto_84074 ) ) ( not ( = ?auto_84070 ?auto_84075 ) ) ( not ( = ?auto_84070 ?auto_84076 ) ) ( not ( = ?auto_84071 ?auto_84072 ) ) ( not ( = ?auto_84071 ?auto_84073 ) ) ( not ( = ?auto_84071 ?auto_84074 ) ) ( not ( = ?auto_84071 ?auto_84075 ) ) ( not ( = ?auto_84071 ?auto_84076 ) ) ( not ( = ?auto_84072 ?auto_84073 ) ) ( not ( = ?auto_84072 ?auto_84074 ) ) ( not ( = ?auto_84072 ?auto_84075 ) ) ( not ( = ?auto_84072 ?auto_84076 ) ) ( not ( = ?auto_84073 ?auto_84074 ) ) ( not ( = ?auto_84073 ?auto_84075 ) ) ( not ( = ?auto_84073 ?auto_84076 ) ) ( not ( = ?auto_84074 ?auto_84075 ) ) ( not ( = ?auto_84074 ?auto_84076 ) ) ( not ( = ?auto_84075 ?auto_84076 ) ) ( ON-TABLE ?auto_84076 ) ( ON ?auto_84070 ?auto_84077 ) ( not ( = ?auto_84070 ?auto_84077 ) ) ( not ( = ?auto_84071 ?auto_84077 ) ) ( not ( = ?auto_84072 ?auto_84077 ) ) ( not ( = ?auto_84073 ?auto_84077 ) ) ( not ( = ?auto_84074 ?auto_84077 ) ) ( not ( = ?auto_84075 ?auto_84077 ) ) ( not ( = ?auto_84076 ?auto_84077 ) ) ( ON ?auto_84071 ?auto_84070 ) ( ON-TABLE ?auto_84077 ) ( ON ?auto_84072 ?auto_84071 ) ( ON ?auto_84073 ?auto_84072 ) ( ON ?auto_84074 ?auto_84073 ) ( CLEAR ?auto_84076 ) ( ON ?auto_84075 ?auto_84074 ) ( CLEAR ?auto_84075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84077 ?auto_84070 ?auto_84071 ?auto_84072 ?auto_84073 ?auto_84074 )
      ( MAKE-7PILE ?auto_84070 ?auto_84071 ?auto_84072 ?auto_84073 ?auto_84074 ?auto_84075 ?auto_84076 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84078 - BLOCK
      ?auto_84079 - BLOCK
      ?auto_84080 - BLOCK
      ?auto_84081 - BLOCK
      ?auto_84082 - BLOCK
      ?auto_84083 - BLOCK
      ?auto_84084 - BLOCK
    )
    :vars
    (
      ?auto_84085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84078 ?auto_84079 ) ) ( not ( = ?auto_84078 ?auto_84080 ) ) ( not ( = ?auto_84078 ?auto_84081 ) ) ( not ( = ?auto_84078 ?auto_84082 ) ) ( not ( = ?auto_84078 ?auto_84083 ) ) ( not ( = ?auto_84078 ?auto_84084 ) ) ( not ( = ?auto_84079 ?auto_84080 ) ) ( not ( = ?auto_84079 ?auto_84081 ) ) ( not ( = ?auto_84079 ?auto_84082 ) ) ( not ( = ?auto_84079 ?auto_84083 ) ) ( not ( = ?auto_84079 ?auto_84084 ) ) ( not ( = ?auto_84080 ?auto_84081 ) ) ( not ( = ?auto_84080 ?auto_84082 ) ) ( not ( = ?auto_84080 ?auto_84083 ) ) ( not ( = ?auto_84080 ?auto_84084 ) ) ( not ( = ?auto_84081 ?auto_84082 ) ) ( not ( = ?auto_84081 ?auto_84083 ) ) ( not ( = ?auto_84081 ?auto_84084 ) ) ( not ( = ?auto_84082 ?auto_84083 ) ) ( not ( = ?auto_84082 ?auto_84084 ) ) ( not ( = ?auto_84083 ?auto_84084 ) ) ( ON ?auto_84078 ?auto_84085 ) ( not ( = ?auto_84078 ?auto_84085 ) ) ( not ( = ?auto_84079 ?auto_84085 ) ) ( not ( = ?auto_84080 ?auto_84085 ) ) ( not ( = ?auto_84081 ?auto_84085 ) ) ( not ( = ?auto_84082 ?auto_84085 ) ) ( not ( = ?auto_84083 ?auto_84085 ) ) ( not ( = ?auto_84084 ?auto_84085 ) ) ( ON ?auto_84079 ?auto_84078 ) ( ON-TABLE ?auto_84085 ) ( ON ?auto_84080 ?auto_84079 ) ( ON ?auto_84081 ?auto_84080 ) ( ON ?auto_84082 ?auto_84081 ) ( ON ?auto_84083 ?auto_84082 ) ( CLEAR ?auto_84083 ) ( HOLDING ?auto_84084 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84084 )
      ( MAKE-7PILE ?auto_84078 ?auto_84079 ?auto_84080 ?auto_84081 ?auto_84082 ?auto_84083 ?auto_84084 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84086 - BLOCK
      ?auto_84087 - BLOCK
      ?auto_84088 - BLOCK
      ?auto_84089 - BLOCK
      ?auto_84090 - BLOCK
      ?auto_84091 - BLOCK
      ?auto_84092 - BLOCK
    )
    :vars
    (
      ?auto_84093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84086 ?auto_84087 ) ) ( not ( = ?auto_84086 ?auto_84088 ) ) ( not ( = ?auto_84086 ?auto_84089 ) ) ( not ( = ?auto_84086 ?auto_84090 ) ) ( not ( = ?auto_84086 ?auto_84091 ) ) ( not ( = ?auto_84086 ?auto_84092 ) ) ( not ( = ?auto_84087 ?auto_84088 ) ) ( not ( = ?auto_84087 ?auto_84089 ) ) ( not ( = ?auto_84087 ?auto_84090 ) ) ( not ( = ?auto_84087 ?auto_84091 ) ) ( not ( = ?auto_84087 ?auto_84092 ) ) ( not ( = ?auto_84088 ?auto_84089 ) ) ( not ( = ?auto_84088 ?auto_84090 ) ) ( not ( = ?auto_84088 ?auto_84091 ) ) ( not ( = ?auto_84088 ?auto_84092 ) ) ( not ( = ?auto_84089 ?auto_84090 ) ) ( not ( = ?auto_84089 ?auto_84091 ) ) ( not ( = ?auto_84089 ?auto_84092 ) ) ( not ( = ?auto_84090 ?auto_84091 ) ) ( not ( = ?auto_84090 ?auto_84092 ) ) ( not ( = ?auto_84091 ?auto_84092 ) ) ( ON ?auto_84086 ?auto_84093 ) ( not ( = ?auto_84086 ?auto_84093 ) ) ( not ( = ?auto_84087 ?auto_84093 ) ) ( not ( = ?auto_84088 ?auto_84093 ) ) ( not ( = ?auto_84089 ?auto_84093 ) ) ( not ( = ?auto_84090 ?auto_84093 ) ) ( not ( = ?auto_84091 ?auto_84093 ) ) ( not ( = ?auto_84092 ?auto_84093 ) ) ( ON ?auto_84087 ?auto_84086 ) ( ON-TABLE ?auto_84093 ) ( ON ?auto_84088 ?auto_84087 ) ( ON ?auto_84089 ?auto_84088 ) ( ON ?auto_84090 ?auto_84089 ) ( ON ?auto_84091 ?auto_84090 ) ( ON ?auto_84092 ?auto_84091 ) ( CLEAR ?auto_84092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84093 ?auto_84086 ?auto_84087 ?auto_84088 ?auto_84089 ?auto_84090 ?auto_84091 )
      ( MAKE-7PILE ?auto_84086 ?auto_84087 ?auto_84088 ?auto_84089 ?auto_84090 ?auto_84091 ?auto_84092 ) )
  )

)

