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
      ?auto_18576 - BLOCK
      ?auto_18577 - BLOCK
      ?auto_18578 - BLOCK
      ?auto_18579 - BLOCK
      ?auto_18580 - BLOCK
    )
    :vars
    (
      ?auto_18581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18581 ?auto_18580 ) ( CLEAR ?auto_18581 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18576 ) ( ON ?auto_18577 ?auto_18576 ) ( ON ?auto_18578 ?auto_18577 ) ( ON ?auto_18579 ?auto_18578 ) ( ON ?auto_18580 ?auto_18579 ) ( not ( = ?auto_18576 ?auto_18577 ) ) ( not ( = ?auto_18576 ?auto_18578 ) ) ( not ( = ?auto_18576 ?auto_18579 ) ) ( not ( = ?auto_18576 ?auto_18580 ) ) ( not ( = ?auto_18576 ?auto_18581 ) ) ( not ( = ?auto_18577 ?auto_18578 ) ) ( not ( = ?auto_18577 ?auto_18579 ) ) ( not ( = ?auto_18577 ?auto_18580 ) ) ( not ( = ?auto_18577 ?auto_18581 ) ) ( not ( = ?auto_18578 ?auto_18579 ) ) ( not ( = ?auto_18578 ?auto_18580 ) ) ( not ( = ?auto_18578 ?auto_18581 ) ) ( not ( = ?auto_18579 ?auto_18580 ) ) ( not ( = ?auto_18579 ?auto_18581 ) ) ( not ( = ?auto_18580 ?auto_18581 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18581 ?auto_18580 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18583 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_18583 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_18583 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18584 - BLOCK
    )
    :vars
    (
      ?auto_18585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18584 ?auto_18585 ) ( CLEAR ?auto_18584 ) ( HAND-EMPTY ) ( not ( = ?auto_18584 ?auto_18585 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18584 ?auto_18585 )
      ( MAKE-1PILE ?auto_18584 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18590 - BLOCK
      ?auto_18591 - BLOCK
      ?auto_18592 - BLOCK
      ?auto_18593 - BLOCK
    )
    :vars
    (
      ?auto_18594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18594 ?auto_18593 ) ( CLEAR ?auto_18594 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18590 ) ( ON ?auto_18591 ?auto_18590 ) ( ON ?auto_18592 ?auto_18591 ) ( ON ?auto_18593 ?auto_18592 ) ( not ( = ?auto_18590 ?auto_18591 ) ) ( not ( = ?auto_18590 ?auto_18592 ) ) ( not ( = ?auto_18590 ?auto_18593 ) ) ( not ( = ?auto_18590 ?auto_18594 ) ) ( not ( = ?auto_18591 ?auto_18592 ) ) ( not ( = ?auto_18591 ?auto_18593 ) ) ( not ( = ?auto_18591 ?auto_18594 ) ) ( not ( = ?auto_18592 ?auto_18593 ) ) ( not ( = ?auto_18592 ?auto_18594 ) ) ( not ( = ?auto_18593 ?auto_18594 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18594 ?auto_18593 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18595 - BLOCK
      ?auto_18596 - BLOCK
      ?auto_18597 - BLOCK
      ?auto_18598 - BLOCK
    )
    :vars
    (
      ?auto_18599 - BLOCK
      ?auto_18600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18599 ?auto_18598 ) ( CLEAR ?auto_18599 ) ( ON-TABLE ?auto_18595 ) ( ON ?auto_18596 ?auto_18595 ) ( ON ?auto_18597 ?auto_18596 ) ( ON ?auto_18598 ?auto_18597 ) ( not ( = ?auto_18595 ?auto_18596 ) ) ( not ( = ?auto_18595 ?auto_18597 ) ) ( not ( = ?auto_18595 ?auto_18598 ) ) ( not ( = ?auto_18595 ?auto_18599 ) ) ( not ( = ?auto_18596 ?auto_18597 ) ) ( not ( = ?auto_18596 ?auto_18598 ) ) ( not ( = ?auto_18596 ?auto_18599 ) ) ( not ( = ?auto_18597 ?auto_18598 ) ) ( not ( = ?auto_18597 ?auto_18599 ) ) ( not ( = ?auto_18598 ?auto_18599 ) ) ( HOLDING ?auto_18600 ) ( not ( = ?auto_18595 ?auto_18600 ) ) ( not ( = ?auto_18596 ?auto_18600 ) ) ( not ( = ?auto_18597 ?auto_18600 ) ) ( not ( = ?auto_18598 ?auto_18600 ) ) ( not ( = ?auto_18599 ?auto_18600 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_18600 )
      ( MAKE-4PILE ?auto_18595 ?auto_18596 ?auto_18597 ?auto_18598 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18601 - BLOCK
      ?auto_18602 - BLOCK
      ?auto_18603 - BLOCK
      ?auto_18604 - BLOCK
    )
    :vars
    (
      ?auto_18606 - BLOCK
      ?auto_18605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18606 ?auto_18604 ) ( ON-TABLE ?auto_18601 ) ( ON ?auto_18602 ?auto_18601 ) ( ON ?auto_18603 ?auto_18602 ) ( ON ?auto_18604 ?auto_18603 ) ( not ( = ?auto_18601 ?auto_18602 ) ) ( not ( = ?auto_18601 ?auto_18603 ) ) ( not ( = ?auto_18601 ?auto_18604 ) ) ( not ( = ?auto_18601 ?auto_18606 ) ) ( not ( = ?auto_18602 ?auto_18603 ) ) ( not ( = ?auto_18602 ?auto_18604 ) ) ( not ( = ?auto_18602 ?auto_18606 ) ) ( not ( = ?auto_18603 ?auto_18604 ) ) ( not ( = ?auto_18603 ?auto_18606 ) ) ( not ( = ?auto_18604 ?auto_18606 ) ) ( not ( = ?auto_18601 ?auto_18605 ) ) ( not ( = ?auto_18602 ?auto_18605 ) ) ( not ( = ?auto_18603 ?auto_18605 ) ) ( not ( = ?auto_18604 ?auto_18605 ) ) ( not ( = ?auto_18606 ?auto_18605 ) ) ( ON ?auto_18605 ?auto_18606 ) ( CLEAR ?auto_18605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18601 ?auto_18602 ?auto_18603 ?auto_18604 ?auto_18606 )
      ( MAKE-4PILE ?auto_18601 ?auto_18602 ?auto_18603 ?auto_18604 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18609 - BLOCK
      ?auto_18610 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_18610 ) ( CLEAR ?auto_18609 ) ( ON-TABLE ?auto_18609 ) ( not ( = ?auto_18609 ?auto_18610 ) ) )
    :subtasks
    ( ( !STACK ?auto_18610 ?auto_18609 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18611 - BLOCK
      ?auto_18612 - BLOCK
    )
    :vars
    (
      ?auto_18613 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18611 ) ( ON-TABLE ?auto_18611 ) ( not ( = ?auto_18611 ?auto_18612 ) ) ( ON ?auto_18612 ?auto_18613 ) ( CLEAR ?auto_18612 ) ( HAND-EMPTY ) ( not ( = ?auto_18611 ?auto_18613 ) ) ( not ( = ?auto_18612 ?auto_18613 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18612 ?auto_18613 )
      ( MAKE-2PILE ?auto_18611 ?auto_18612 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18614 - BLOCK
      ?auto_18615 - BLOCK
    )
    :vars
    (
      ?auto_18616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18614 ?auto_18615 ) ) ( ON ?auto_18615 ?auto_18616 ) ( CLEAR ?auto_18615 ) ( not ( = ?auto_18614 ?auto_18616 ) ) ( not ( = ?auto_18615 ?auto_18616 ) ) ( HOLDING ?auto_18614 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18614 )
      ( MAKE-2PILE ?auto_18614 ?auto_18615 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18617 - BLOCK
      ?auto_18618 - BLOCK
    )
    :vars
    (
      ?auto_18619 - BLOCK
      ?auto_18622 - BLOCK
      ?auto_18620 - BLOCK
      ?auto_18621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18617 ?auto_18618 ) ) ( ON ?auto_18618 ?auto_18619 ) ( not ( = ?auto_18617 ?auto_18619 ) ) ( not ( = ?auto_18618 ?auto_18619 ) ) ( ON ?auto_18617 ?auto_18618 ) ( CLEAR ?auto_18617 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18622 ) ( ON ?auto_18620 ?auto_18622 ) ( ON ?auto_18621 ?auto_18620 ) ( ON ?auto_18619 ?auto_18621 ) ( not ( = ?auto_18622 ?auto_18620 ) ) ( not ( = ?auto_18622 ?auto_18621 ) ) ( not ( = ?auto_18622 ?auto_18619 ) ) ( not ( = ?auto_18622 ?auto_18618 ) ) ( not ( = ?auto_18622 ?auto_18617 ) ) ( not ( = ?auto_18620 ?auto_18621 ) ) ( not ( = ?auto_18620 ?auto_18619 ) ) ( not ( = ?auto_18620 ?auto_18618 ) ) ( not ( = ?auto_18620 ?auto_18617 ) ) ( not ( = ?auto_18621 ?auto_18619 ) ) ( not ( = ?auto_18621 ?auto_18618 ) ) ( not ( = ?auto_18621 ?auto_18617 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18622 ?auto_18620 ?auto_18621 ?auto_18619 ?auto_18618 )
      ( MAKE-2PILE ?auto_18617 ?auto_18618 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18626 - BLOCK
      ?auto_18627 - BLOCK
      ?auto_18628 - BLOCK
    )
    :vars
    (
      ?auto_18629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18629 ?auto_18628 ) ( CLEAR ?auto_18629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18626 ) ( ON ?auto_18627 ?auto_18626 ) ( ON ?auto_18628 ?auto_18627 ) ( not ( = ?auto_18626 ?auto_18627 ) ) ( not ( = ?auto_18626 ?auto_18628 ) ) ( not ( = ?auto_18626 ?auto_18629 ) ) ( not ( = ?auto_18627 ?auto_18628 ) ) ( not ( = ?auto_18627 ?auto_18629 ) ) ( not ( = ?auto_18628 ?auto_18629 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18629 ?auto_18628 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18630 - BLOCK
      ?auto_18631 - BLOCK
      ?auto_18632 - BLOCK
    )
    :vars
    (
      ?auto_18633 - BLOCK
      ?auto_18634 - BLOCK
      ?auto_18635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18633 ?auto_18632 ) ( CLEAR ?auto_18633 ) ( ON-TABLE ?auto_18630 ) ( ON ?auto_18631 ?auto_18630 ) ( ON ?auto_18632 ?auto_18631 ) ( not ( = ?auto_18630 ?auto_18631 ) ) ( not ( = ?auto_18630 ?auto_18632 ) ) ( not ( = ?auto_18630 ?auto_18633 ) ) ( not ( = ?auto_18631 ?auto_18632 ) ) ( not ( = ?auto_18631 ?auto_18633 ) ) ( not ( = ?auto_18632 ?auto_18633 ) ) ( HOLDING ?auto_18634 ) ( CLEAR ?auto_18635 ) ( not ( = ?auto_18630 ?auto_18634 ) ) ( not ( = ?auto_18630 ?auto_18635 ) ) ( not ( = ?auto_18631 ?auto_18634 ) ) ( not ( = ?auto_18631 ?auto_18635 ) ) ( not ( = ?auto_18632 ?auto_18634 ) ) ( not ( = ?auto_18632 ?auto_18635 ) ) ( not ( = ?auto_18633 ?auto_18634 ) ) ( not ( = ?auto_18633 ?auto_18635 ) ) ( not ( = ?auto_18634 ?auto_18635 ) ) )
    :subtasks
    ( ( !STACK ?auto_18634 ?auto_18635 )
      ( MAKE-3PILE ?auto_18630 ?auto_18631 ?auto_18632 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18998 - BLOCK
      ?auto_18999 - BLOCK
      ?auto_19000 - BLOCK
    )
    :vars
    (
      ?auto_19001 - BLOCK
      ?auto_19002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19001 ?auto_19000 ) ( ON-TABLE ?auto_18998 ) ( ON ?auto_18999 ?auto_18998 ) ( ON ?auto_19000 ?auto_18999 ) ( not ( = ?auto_18998 ?auto_18999 ) ) ( not ( = ?auto_18998 ?auto_19000 ) ) ( not ( = ?auto_18998 ?auto_19001 ) ) ( not ( = ?auto_18999 ?auto_19000 ) ) ( not ( = ?auto_18999 ?auto_19001 ) ) ( not ( = ?auto_19000 ?auto_19001 ) ) ( not ( = ?auto_18998 ?auto_19002 ) ) ( not ( = ?auto_18999 ?auto_19002 ) ) ( not ( = ?auto_19000 ?auto_19002 ) ) ( not ( = ?auto_19001 ?auto_19002 ) ) ( ON ?auto_19002 ?auto_19001 ) ( CLEAR ?auto_19002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18998 ?auto_18999 ?auto_19000 ?auto_19001 )
      ( MAKE-3PILE ?auto_18998 ?auto_18999 ?auto_19000 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18642 - BLOCK
      ?auto_18643 - BLOCK
      ?auto_18644 - BLOCK
    )
    :vars
    (
      ?auto_18647 - BLOCK
      ?auto_18645 - BLOCK
      ?auto_18646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18647 ?auto_18644 ) ( ON-TABLE ?auto_18642 ) ( ON ?auto_18643 ?auto_18642 ) ( ON ?auto_18644 ?auto_18643 ) ( not ( = ?auto_18642 ?auto_18643 ) ) ( not ( = ?auto_18642 ?auto_18644 ) ) ( not ( = ?auto_18642 ?auto_18647 ) ) ( not ( = ?auto_18643 ?auto_18644 ) ) ( not ( = ?auto_18643 ?auto_18647 ) ) ( not ( = ?auto_18644 ?auto_18647 ) ) ( not ( = ?auto_18642 ?auto_18645 ) ) ( not ( = ?auto_18642 ?auto_18646 ) ) ( not ( = ?auto_18643 ?auto_18645 ) ) ( not ( = ?auto_18643 ?auto_18646 ) ) ( not ( = ?auto_18644 ?auto_18645 ) ) ( not ( = ?auto_18644 ?auto_18646 ) ) ( not ( = ?auto_18647 ?auto_18645 ) ) ( not ( = ?auto_18647 ?auto_18646 ) ) ( not ( = ?auto_18645 ?auto_18646 ) ) ( ON ?auto_18645 ?auto_18647 ) ( CLEAR ?auto_18645 ) ( HOLDING ?auto_18646 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18646 )
      ( MAKE-3PILE ?auto_18642 ?auto_18643 ?auto_18644 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18648 - BLOCK
      ?auto_18649 - BLOCK
      ?auto_18650 - BLOCK
    )
    :vars
    (
      ?auto_18651 - BLOCK
      ?auto_18653 - BLOCK
      ?auto_18652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18651 ?auto_18650 ) ( ON-TABLE ?auto_18648 ) ( ON ?auto_18649 ?auto_18648 ) ( ON ?auto_18650 ?auto_18649 ) ( not ( = ?auto_18648 ?auto_18649 ) ) ( not ( = ?auto_18648 ?auto_18650 ) ) ( not ( = ?auto_18648 ?auto_18651 ) ) ( not ( = ?auto_18649 ?auto_18650 ) ) ( not ( = ?auto_18649 ?auto_18651 ) ) ( not ( = ?auto_18650 ?auto_18651 ) ) ( not ( = ?auto_18648 ?auto_18653 ) ) ( not ( = ?auto_18648 ?auto_18652 ) ) ( not ( = ?auto_18649 ?auto_18653 ) ) ( not ( = ?auto_18649 ?auto_18652 ) ) ( not ( = ?auto_18650 ?auto_18653 ) ) ( not ( = ?auto_18650 ?auto_18652 ) ) ( not ( = ?auto_18651 ?auto_18653 ) ) ( not ( = ?auto_18651 ?auto_18652 ) ) ( not ( = ?auto_18653 ?auto_18652 ) ) ( ON ?auto_18653 ?auto_18651 ) ( ON ?auto_18652 ?auto_18653 ) ( CLEAR ?auto_18652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18648 ?auto_18649 ?auto_18650 ?auto_18651 ?auto_18653 )
      ( MAKE-3PILE ?auto_18648 ?auto_18649 ?auto_18650 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18657 - BLOCK
      ?auto_18658 - BLOCK
      ?auto_18659 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_18659 ) ( CLEAR ?auto_18658 ) ( ON-TABLE ?auto_18657 ) ( ON ?auto_18658 ?auto_18657 ) ( not ( = ?auto_18657 ?auto_18658 ) ) ( not ( = ?auto_18657 ?auto_18659 ) ) ( not ( = ?auto_18658 ?auto_18659 ) ) )
    :subtasks
    ( ( !STACK ?auto_18659 ?auto_18658 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18660 - BLOCK
      ?auto_18661 - BLOCK
      ?auto_18662 - BLOCK
    )
    :vars
    (
      ?auto_18663 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18661 ) ( ON-TABLE ?auto_18660 ) ( ON ?auto_18661 ?auto_18660 ) ( not ( = ?auto_18660 ?auto_18661 ) ) ( not ( = ?auto_18660 ?auto_18662 ) ) ( not ( = ?auto_18661 ?auto_18662 ) ) ( ON ?auto_18662 ?auto_18663 ) ( CLEAR ?auto_18662 ) ( HAND-EMPTY ) ( not ( = ?auto_18660 ?auto_18663 ) ) ( not ( = ?auto_18661 ?auto_18663 ) ) ( not ( = ?auto_18662 ?auto_18663 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18662 ?auto_18663 )
      ( MAKE-3PILE ?auto_18660 ?auto_18661 ?auto_18662 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18664 - BLOCK
      ?auto_18665 - BLOCK
      ?auto_18666 - BLOCK
    )
    :vars
    (
      ?auto_18667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18664 ) ( not ( = ?auto_18664 ?auto_18665 ) ) ( not ( = ?auto_18664 ?auto_18666 ) ) ( not ( = ?auto_18665 ?auto_18666 ) ) ( ON ?auto_18666 ?auto_18667 ) ( CLEAR ?auto_18666 ) ( not ( = ?auto_18664 ?auto_18667 ) ) ( not ( = ?auto_18665 ?auto_18667 ) ) ( not ( = ?auto_18666 ?auto_18667 ) ) ( HOLDING ?auto_18665 ) ( CLEAR ?auto_18664 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18664 ?auto_18665 )
      ( MAKE-3PILE ?auto_18664 ?auto_18665 ?auto_18666 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18668 - BLOCK
      ?auto_18669 - BLOCK
      ?auto_18670 - BLOCK
    )
    :vars
    (
      ?auto_18671 - BLOCK
      ?auto_18673 - BLOCK
      ?auto_18672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18668 ) ( not ( = ?auto_18668 ?auto_18669 ) ) ( not ( = ?auto_18668 ?auto_18670 ) ) ( not ( = ?auto_18669 ?auto_18670 ) ) ( ON ?auto_18670 ?auto_18671 ) ( not ( = ?auto_18668 ?auto_18671 ) ) ( not ( = ?auto_18669 ?auto_18671 ) ) ( not ( = ?auto_18670 ?auto_18671 ) ) ( CLEAR ?auto_18668 ) ( ON ?auto_18669 ?auto_18670 ) ( CLEAR ?auto_18669 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18673 ) ( ON ?auto_18672 ?auto_18673 ) ( ON ?auto_18671 ?auto_18672 ) ( not ( = ?auto_18673 ?auto_18672 ) ) ( not ( = ?auto_18673 ?auto_18671 ) ) ( not ( = ?auto_18673 ?auto_18670 ) ) ( not ( = ?auto_18673 ?auto_18669 ) ) ( not ( = ?auto_18672 ?auto_18671 ) ) ( not ( = ?auto_18672 ?auto_18670 ) ) ( not ( = ?auto_18672 ?auto_18669 ) ) ( not ( = ?auto_18668 ?auto_18673 ) ) ( not ( = ?auto_18668 ?auto_18672 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18673 ?auto_18672 ?auto_18671 ?auto_18670 )
      ( MAKE-3PILE ?auto_18668 ?auto_18669 ?auto_18670 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18674 - BLOCK
      ?auto_18675 - BLOCK
      ?auto_18676 - BLOCK
    )
    :vars
    (
      ?auto_18677 - BLOCK
      ?auto_18678 - BLOCK
      ?auto_18679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18674 ?auto_18675 ) ) ( not ( = ?auto_18674 ?auto_18676 ) ) ( not ( = ?auto_18675 ?auto_18676 ) ) ( ON ?auto_18676 ?auto_18677 ) ( not ( = ?auto_18674 ?auto_18677 ) ) ( not ( = ?auto_18675 ?auto_18677 ) ) ( not ( = ?auto_18676 ?auto_18677 ) ) ( ON ?auto_18675 ?auto_18676 ) ( CLEAR ?auto_18675 ) ( ON-TABLE ?auto_18678 ) ( ON ?auto_18679 ?auto_18678 ) ( ON ?auto_18677 ?auto_18679 ) ( not ( = ?auto_18678 ?auto_18679 ) ) ( not ( = ?auto_18678 ?auto_18677 ) ) ( not ( = ?auto_18678 ?auto_18676 ) ) ( not ( = ?auto_18678 ?auto_18675 ) ) ( not ( = ?auto_18679 ?auto_18677 ) ) ( not ( = ?auto_18679 ?auto_18676 ) ) ( not ( = ?auto_18679 ?auto_18675 ) ) ( not ( = ?auto_18674 ?auto_18678 ) ) ( not ( = ?auto_18674 ?auto_18679 ) ) ( HOLDING ?auto_18674 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18674 )
      ( MAKE-3PILE ?auto_18674 ?auto_18675 ?auto_18676 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18680 - BLOCK
      ?auto_18681 - BLOCK
      ?auto_18682 - BLOCK
    )
    :vars
    (
      ?auto_18684 - BLOCK
      ?auto_18683 - BLOCK
      ?auto_18685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18680 ?auto_18681 ) ) ( not ( = ?auto_18680 ?auto_18682 ) ) ( not ( = ?auto_18681 ?auto_18682 ) ) ( ON ?auto_18682 ?auto_18684 ) ( not ( = ?auto_18680 ?auto_18684 ) ) ( not ( = ?auto_18681 ?auto_18684 ) ) ( not ( = ?auto_18682 ?auto_18684 ) ) ( ON ?auto_18681 ?auto_18682 ) ( ON-TABLE ?auto_18683 ) ( ON ?auto_18685 ?auto_18683 ) ( ON ?auto_18684 ?auto_18685 ) ( not ( = ?auto_18683 ?auto_18685 ) ) ( not ( = ?auto_18683 ?auto_18684 ) ) ( not ( = ?auto_18683 ?auto_18682 ) ) ( not ( = ?auto_18683 ?auto_18681 ) ) ( not ( = ?auto_18685 ?auto_18684 ) ) ( not ( = ?auto_18685 ?auto_18682 ) ) ( not ( = ?auto_18685 ?auto_18681 ) ) ( not ( = ?auto_18680 ?auto_18683 ) ) ( not ( = ?auto_18680 ?auto_18685 ) ) ( ON ?auto_18680 ?auto_18681 ) ( CLEAR ?auto_18680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18683 ?auto_18685 ?auto_18684 ?auto_18682 ?auto_18681 )
      ( MAKE-3PILE ?auto_18680 ?auto_18681 ?auto_18682 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18688 - BLOCK
      ?auto_18689 - BLOCK
    )
    :vars
    (
      ?auto_18690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18690 ?auto_18689 ) ( CLEAR ?auto_18690 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18688 ) ( ON ?auto_18689 ?auto_18688 ) ( not ( = ?auto_18688 ?auto_18689 ) ) ( not ( = ?auto_18688 ?auto_18690 ) ) ( not ( = ?auto_18689 ?auto_18690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18690 ?auto_18689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18691 - BLOCK
      ?auto_18692 - BLOCK
    )
    :vars
    (
      ?auto_18693 - BLOCK
      ?auto_18694 - BLOCK
      ?auto_18695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18693 ?auto_18692 ) ( CLEAR ?auto_18693 ) ( ON-TABLE ?auto_18691 ) ( ON ?auto_18692 ?auto_18691 ) ( not ( = ?auto_18691 ?auto_18692 ) ) ( not ( = ?auto_18691 ?auto_18693 ) ) ( not ( = ?auto_18692 ?auto_18693 ) ) ( HOLDING ?auto_18694 ) ( CLEAR ?auto_18695 ) ( not ( = ?auto_18691 ?auto_18694 ) ) ( not ( = ?auto_18691 ?auto_18695 ) ) ( not ( = ?auto_18692 ?auto_18694 ) ) ( not ( = ?auto_18692 ?auto_18695 ) ) ( not ( = ?auto_18693 ?auto_18694 ) ) ( not ( = ?auto_18693 ?auto_18695 ) ) ( not ( = ?auto_18694 ?auto_18695 ) ) )
    :subtasks
    ( ( !STACK ?auto_18694 ?auto_18695 )
      ( MAKE-2PILE ?auto_18691 ?auto_18692 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18696 - BLOCK
      ?auto_18697 - BLOCK
    )
    :vars
    (
      ?auto_18700 - BLOCK
      ?auto_18698 - BLOCK
      ?auto_18699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18700 ?auto_18697 ) ( ON-TABLE ?auto_18696 ) ( ON ?auto_18697 ?auto_18696 ) ( not ( = ?auto_18696 ?auto_18697 ) ) ( not ( = ?auto_18696 ?auto_18700 ) ) ( not ( = ?auto_18697 ?auto_18700 ) ) ( CLEAR ?auto_18698 ) ( not ( = ?auto_18696 ?auto_18699 ) ) ( not ( = ?auto_18696 ?auto_18698 ) ) ( not ( = ?auto_18697 ?auto_18699 ) ) ( not ( = ?auto_18697 ?auto_18698 ) ) ( not ( = ?auto_18700 ?auto_18699 ) ) ( not ( = ?auto_18700 ?auto_18698 ) ) ( not ( = ?auto_18699 ?auto_18698 ) ) ( ON ?auto_18699 ?auto_18700 ) ( CLEAR ?auto_18699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18696 ?auto_18697 ?auto_18700 )
      ( MAKE-2PILE ?auto_18696 ?auto_18697 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18701 - BLOCK
      ?auto_18702 - BLOCK
    )
    :vars
    (
      ?auto_18705 - BLOCK
      ?auto_18704 - BLOCK
      ?auto_18703 - BLOCK
      ?auto_18706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18705 ?auto_18702 ) ( ON-TABLE ?auto_18701 ) ( ON ?auto_18702 ?auto_18701 ) ( not ( = ?auto_18701 ?auto_18702 ) ) ( not ( = ?auto_18701 ?auto_18705 ) ) ( not ( = ?auto_18702 ?auto_18705 ) ) ( not ( = ?auto_18701 ?auto_18704 ) ) ( not ( = ?auto_18701 ?auto_18703 ) ) ( not ( = ?auto_18702 ?auto_18704 ) ) ( not ( = ?auto_18702 ?auto_18703 ) ) ( not ( = ?auto_18705 ?auto_18704 ) ) ( not ( = ?auto_18705 ?auto_18703 ) ) ( not ( = ?auto_18704 ?auto_18703 ) ) ( ON ?auto_18704 ?auto_18705 ) ( CLEAR ?auto_18704 ) ( HOLDING ?auto_18703 ) ( CLEAR ?auto_18706 ) ( ON-TABLE ?auto_18706 ) ( not ( = ?auto_18706 ?auto_18703 ) ) ( not ( = ?auto_18701 ?auto_18706 ) ) ( not ( = ?auto_18702 ?auto_18706 ) ) ( not ( = ?auto_18705 ?auto_18706 ) ) ( not ( = ?auto_18704 ?auto_18706 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18706 ?auto_18703 )
      ( MAKE-2PILE ?auto_18701 ?auto_18702 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19125 - BLOCK
      ?auto_19126 - BLOCK
    )
    :vars
    (
      ?auto_19128 - BLOCK
      ?auto_19129 - BLOCK
      ?auto_19127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19128 ?auto_19126 ) ( ON-TABLE ?auto_19125 ) ( ON ?auto_19126 ?auto_19125 ) ( not ( = ?auto_19125 ?auto_19126 ) ) ( not ( = ?auto_19125 ?auto_19128 ) ) ( not ( = ?auto_19126 ?auto_19128 ) ) ( not ( = ?auto_19125 ?auto_19129 ) ) ( not ( = ?auto_19125 ?auto_19127 ) ) ( not ( = ?auto_19126 ?auto_19129 ) ) ( not ( = ?auto_19126 ?auto_19127 ) ) ( not ( = ?auto_19128 ?auto_19129 ) ) ( not ( = ?auto_19128 ?auto_19127 ) ) ( not ( = ?auto_19129 ?auto_19127 ) ) ( ON ?auto_19129 ?auto_19128 ) ( ON ?auto_19127 ?auto_19129 ) ( CLEAR ?auto_19127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19125 ?auto_19126 ?auto_19128 ?auto_19129 )
      ( MAKE-2PILE ?auto_19125 ?auto_19126 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18713 - BLOCK
      ?auto_18714 - BLOCK
    )
    :vars
    (
      ?auto_18717 - BLOCK
      ?auto_18715 - BLOCK
      ?auto_18718 - BLOCK
      ?auto_18716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18717 ?auto_18714 ) ( ON-TABLE ?auto_18713 ) ( ON ?auto_18714 ?auto_18713 ) ( not ( = ?auto_18713 ?auto_18714 ) ) ( not ( = ?auto_18713 ?auto_18717 ) ) ( not ( = ?auto_18714 ?auto_18717 ) ) ( not ( = ?auto_18713 ?auto_18715 ) ) ( not ( = ?auto_18713 ?auto_18718 ) ) ( not ( = ?auto_18714 ?auto_18715 ) ) ( not ( = ?auto_18714 ?auto_18718 ) ) ( not ( = ?auto_18717 ?auto_18715 ) ) ( not ( = ?auto_18717 ?auto_18718 ) ) ( not ( = ?auto_18715 ?auto_18718 ) ) ( ON ?auto_18715 ?auto_18717 ) ( not ( = ?auto_18716 ?auto_18718 ) ) ( not ( = ?auto_18713 ?auto_18716 ) ) ( not ( = ?auto_18714 ?auto_18716 ) ) ( not ( = ?auto_18717 ?auto_18716 ) ) ( not ( = ?auto_18715 ?auto_18716 ) ) ( ON ?auto_18718 ?auto_18715 ) ( CLEAR ?auto_18718 ) ( HOLDING ?auto_18716 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18716 )
      ( MAKE-2PILE ?auto_18713 ?auto_18714 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18719 - BLOCK
      ?auto_18720 - BLOCK
    )
    :vars
    (
      ?auto_18721 - BLOCK
      ?auto_18724 - BLOCK
      ?auto_18723 - BLOCK
      ?auto_18722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18721 ?auto_18720 ) ( ON-TABLE ?auto_18719 ) ( ON ?auto_18720 ?auto_18719 ) ( not ( = ?auto_18719 ?auto_18720 ) ) ( not ( = ?auto_18719 ?auto_18721 ) ) ( not ( = ?auto_18720 ?auto_18721 ) ) ( not ( = ?auto_18719 ?auto_18724 ) ) ( not ( = ?auto_18719 ?auto_18723 ) ) ( not ( = ?auto_18720 ?auto_18724 ) ) ( not ( = ?auto_18720 ?auto_18723 ) ) ( not ( = ?auto_18721 ?auto_18724 ) ) ( not ( = ?auto_18721 ?auto_18723 ) ) ( not ( = ?auto_18724 ?auto_18723 ) ) ( ON ?auto_18724 ?auto_18721 ) ( not ( = ?auto_18722 ?auto_18723 ) ) ( not ( = ?auto_18719 ?auto_18722 ) ) ( not ( = ?auto_18720 ?auto_18722 ) ) ( not ( = ?auto_18721 ?auto_18722 ) ) ( not ( = ?auto_18724 ?auto_18722 ) ) ( ON ?auto_18723 ?auto_18724 ) ( ON ?auto_18722 ?auto_18723 ) ( CLEAR ?auto_18722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18719 ?auto_18720 ?auto_18721 ?auto_18724 ?auto_18723 )
      ( MAKE-2PILE ?auto_18719 ?auto_18720 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18729 - BLOCK
      ?auto_18730 - BLOCK
      ?auto_18731 - BLOCK
      ?auto_18732 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_18732 ) ( CLEAR ?auto_18731 ) ( ON-TABLE ?auto_18729 ) ( ON ?auto_18730 ?auto_18729 ) ( ON ?auto_18731 ?auto_18730 ) ( not ( = ?auto_18729 ?auto_18730 ) ) ( not ( = ?auto_18729 ?auto_18731 ) ) ( not ( = ?auto_18729 ?auto_18732 ) ) ( not ( = ?auto_18730 ?auto_18731 ) ) ( not ( = ?auto_18730 ?auto_18732 ) ) ( not ( = ?auto_18731 ?auto_18732 ) ) )
    :subtasks
    ( ( !STACK ?auto_18732 ?auto_18731 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18733 - BLOCK
      ?auto_18734 - BLOCK
      ?auto_18735 - BLOCK
      ?auto_18736 - BLOCK
    )
    :vars
    (
      ?auto_18737 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18735 ) ( ON-TABLE ?auto_18733 ) ( ON ?auto_18734 ?auto_18733 ) ( ON ?auto_18735 ?auto_18734 ) ( not ( = ?auto_18733 ?auto_18734 ) ) ( not ( = ?auto_18733 ?auto_18735 ) ) ( not ( = ?auto_18733 ?auto_18736 ) ) ( not ( = ?auto_18734 ?auto_18735 ) ) ( not ( = ?auto_18734 ?auto_18736 ) ) ( not ( = ?auto_18735 ?auto_18736 ) ) ( ON ?auto_18736 ?auto_18737 ) ( CLEAR ?auto_18736 ) ( HAND-EMPTY ) ( not ( = ?auto_18733 ?auto_18737 ) ) ( not ( = ?auto_18734 ?auto_18737 ) ) ( not ( = ?auto_18735 ?auto_18737 ) ) ( not ( = ?auto_18736 ?auto_18737 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18736 ?auto_18737 )
      ( MAKE-4PILE ?auto_18733 ?auto_18734 ?auto_18735 ?auto_18736 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18738 - BLOCK
      ?auto_18739 - BLOCK
      ?auto_18740 - BLOCK
      ?auto_18741 - BLOCK
    )
    :vars
    (
      ?auto_18742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18738 ) ( ON ?auto_18739 ?auto_18738 ) ( not ( = ?auto_18738 ?auto_18739 ) ) ( not ( = ?auto_18738 ?auto_18740 ) ) ( not ( = ?auto_18738 ?auto_18741 ) ) ( not ( = ?auto_18739 ?auto_18740 ) ) ( not ( = ?auto_18739 ?auto_18741 ) ) ( not ( = ?auto_18740 ?auto_18741 ) ) ( ON ?auto_18741 ?auto_18742 ) ( CLEAR ?auto_18741 ) ( not ( = ?auto_18738 ?auto_18742 ) ) ( not ( = ?auto_18739 ?auto_18742 ) ) ( not ( = ?auto_18740 ?auto_18742 ) ) ( not ( = ?auto_18741 ?auto_18742 ) ) ( HOLDING ?auto_18740 ) ( CLEAR ?auto_18739 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18738 ?auto_18739 ?auto_18740 )
      ( MAKE-4PILE ?auto_18738 ?auto_18739 ?auto_18740 ?auto_18741 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18743 - BLOCK
      ?auto_18744 - BLOCK
      ?auto_18745 - BLOCK
      ?auto_18746 - BLOCK
    )
    :vars
    (
      ?auto_18747 - BLOCK
      ?auto_18748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18743 ) ( ON ?auto_18744 ?auto_18743 ) ( not ( = ?auto_18743 ?auto_18744 ) ) ( not ( = ?auto_18743 ?auto_18745 ) ) ( not ( = ?auto_18743 ?auto_18746 ) ) ( not ( = ?auto_18744 ?auto_18745 ) ) ( not ( = ?auto_18744 ?auto_18746 ) ) ( not ( = ?auto_18745 ?auto_18746 ) ) ( ON ?auto_18746 ?auto_18747 ) ( not ( = ?auto_18743 ?auto_18747 ) ) ( not ( = ?auto_18744 ?auto_18747 ) ) ( not ( = ?auto_18745 ?auto_18747 ) ) ( not ( = ?auto_18746 ?auto_18747 ) ) ( CLEAR ?auto_18744 ) ( ON ?auto_18745 ?auto_18746 ) ( CLEAR ?auto_18745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18748 ) ( ON ?auto_18747 ?auto_18748 ) ( not ( = ?auto_18748 ?auto_18747 ) ) ( not ( = ?auto_18748 ?auto_18746 ) ) ( not ( = ?auto_18748 ?auto_18745 ) ) ( not ( = ?auto_18743 ?auto_18748 ) ) ( not ( = ?auto_18744 ?auto_18748 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18748 ?auto_18747 ?auto_18746 )
      ( MAKE-4PILE ?auto_18743 ?auto_18744 ?auto_18745 ?auto_18746 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18749 - BLOCK
      ?auto_18750 - BLOCK
      ?auto_18751 - BLOCK
      ?auto_18752 - BLOCK
    )
    :vars
    (
      ?auto_18753 - BLOCK
      ?auto_18754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18749 ) ( not ( = ?auto_18749 ?auto_18750 ) ) ( not ( = ?auto_18749 ?auto_18751 ) ) ( not ( = ?auto_18749 ?auto_18752 ) ) ( not ( = ?auto_18750 ?auto_18751 ) ) ( not ( = ?auto_18750 ?auto_18752 ) ) ( not ( = ?auto_18751 ?auto_18752 ) ) ( ON ?auto_18752 ?auto_18753 ) ( not ( = ?auto_18749 ?auto_18753 ) ) ( not ( = ?auto_18750 ?auto_18753 ) ) ( not ( = ?auto_18751 ?auto_18753 ) ) ( not ( = ?auto_18752 ?auto_18753 ) ) ( ON ?auto_18751 ?auto_18752 ) ( CLEAR ?auto_18751 ) ( ON-TABLE ?auto_18754 ) ( ON ?auto_18753 ?auto_18754 ) ( not ( = ?auto_18754 ?auto_18753 ) ) ( not ( = ?auto_18754 ?auto_18752 ) ) ( not ( = ?auto_18754 ?auto_18751 ) ) ( not ( = ?auto_18749 ?auto_18754 ) ) ( not ( = ?auto_18750 ?auto_18754 ) ) ( HOLDING ?auto_18750 ) ( CLEAR ?auto_18749 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18749 ?auto_18750 )
      ( MAKE-4PILE ?auto_18749 ?auto_18750 ?auto_18751 ?auto_18752 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18755 - BLOCK
      ?auto_18756 - BLOCK
      ?auto_18757 - BLOCK
      ?auto_18758 - BLOCK
    )
    :vars
    (
      ?auto_18759 - BLOCK
      ?auto_18760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18755 ) ( not ( = ?auto_18755 ?auto_18756 ) ) ( not ( = ?auto_18755 ?auto_18757 ) ) ( not ( = ?auto_18755 ?auto_18758 ) ) ( not ( = ?auto_18756 ?auto_18757 ) ) ( not ( = ?auto_18756 ?auto_18758 ) ) ( not ( = ?auto_18757 ?auto_18758 ) ) ( ON ?auto_18758 ?auto_18759 ) ( not ( = ?auto_18755 ?auto_18759 ) ) ( not ( = ?auto_18756 ?auto_18759 ) ) ( not ( = ?auto_18757 ?auto_18759 ) ) ( not ( = ?auto_18758 ?auto_18759 ) ) ( ON ?auto_18757 ?auto_18758 ) ( ON-TABLE ?auto_18760 ) ( ON ?auto_18759 ?auto_18760 ) ( not ( = ?auto_18760 ?auto_18759 ) ) ( not ( = ?auto_18760 ?auto_18758 ) ) ( not ( = ?auto_18760 ?auto_18757 ) ) ( not ( = ?auto_18755 ?auto_18760 ) ) ( not ( = ?auto_18756 ?auto_18760 ) ) ( CLEAR ?auto_18755 ) ( ON ?auto_18756 ?auto_18757 ) ( CLEAR ?auto_18756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18760 ?auto_18759 ?auto_18758 ?auto_18757 )
      ( MAKE-4PILE ?auto_18755 ?auto_18756 ?auto_18757 ?auto_18758 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18761 - BLOCK
      ?auto_18762 - BLOCK
      ?auto_18763 - BLOCK
      ?auto_18764 - BLOCK
    )
    :vars
    (
      ?auto_18765 - BLOCK
      ?auto_18766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18761 ?auto_18762 ) ) ( not ( = ?auto_18761 ?auto_18763 ) ) ( not ( = ?auto_18761 ?auto_18764 ) ) ( not ( = ?auto_18762 ?auto_18763 ) ) ( not ( = ?auto_18762 ?auto_18764 ) ) ( not ( = ?auto_18763 ?auto_18764 ) ) ( ON ?auto_18764 ?auto_18765 ) ( not ( = ?auto_18761 ?auto_18765 ) ) ( not ( = ?auto_18762 ?auto_18765 ) ) ( not ( = ?auto_18763 ?auto_18765 ) ) ( not ( = ?auto_18764 ?auto_18765 ) ) ( ON ?auto_18763 ?auto_18764 ) ( ON-TABLE ?auto_18766 ) ( ON ?auto_18765 ?auto_18766 ) ( not ( = ?auto_18766 ?auto_18765 ) ) ( not ( = ?auto_18766 ?auto_18764 ) ) ( not ( = ?auto_18766 ?auto_18763 ) ) ( not ( = ?auto_18761 ?auto_18766 ) ) ( not ( = ?auto_18762 ?auto_18766 ) ) ( ON ?auto_18762 ?auto_18763 ) ( CLEAR ?auto_18762 ) ( HOLDING ?auto_18761 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18761 )
      ( MAKE-4PILE ?auto_18761 ?auto_18762 ?auto_18763 ?auto_18764 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18767 - BLOCK
      ?auto_18768 - BLOCK
      ?auto_18769 - BLOCK
      ?auto_18770 - BLOCK
    )
    :vars
    (
      ?auto_18772 - BLOCK
      ?auto_18771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18767 ?auto_18768 ) ) ( not ( = ?auto_18767 ?auto_18769 ) ) ( not ( = ?auto_18767 ?auto_18770 ) ) ( not ( = ?auto_18768 ?auto_18769 ) ) ( not ( = ?auto_18768 ?auto_18770 ) ) ( not ( = ?auto_18769 ?auto_18770 ) ) ( ON ?auto_18770 ?auto_18772 ) ( not ( = ?auto_18767 ?auto_18772 ) ) ( not ( = ?auto_18768 ?auto_18772 ) ) ( not ( = ?auto_18769 ?auto_18772 ) ) ( not ( = ?auto_18770 ?auto_18772 ) ) ( ON ?auto_18769 ?auto_18770 ) ( ON-TABLE ?auto_18771 ) ( ON ?auto_18772 ?auto_18771 ) ( not ( = ?auto_18771 ?auto_18772 ) ) ( not ( = ?auto_18771 ?auto_18770 ) ) ( not ( = ?auto_18771 ?auto_18769 ) ) ( not ( = ?auto_18767 ?auto_18771 ) ) ( not ( = ?auto_18768 ?auto_18771 ) ) ( ON ?auto_18768 ?auto_18769 ) ( ON ?auto_18767 ?auto_18768 ) ( CLEAR ?auto_18767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18771 ?auto_18772 ?auto_18770 ?auto_18769 ?auto_18768 )
      ( MAKE-4PILE ?auto_18767 ?auto_18768 ?auto_18769 ?auto_18770 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18774 - BLOCK
    )
    :vars
    (
      ?auto_18775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18775 ?auto_18774 ) ( CLEAR ?auto_18775 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18774 ) ( not ( = ?auto_18774 ?auto_18775 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18775 ?auto_18774 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18776 - BLOCK
    )
    :vars
    (
      ?auto_18777 - BLOCK
      ?auto_18778 - BLOCK
      ?auto_18779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18777 ?auto_18776 ) ( CLEAR ?auto_18777 ) ( ON-TABLE ?auto_18776 ) ( not ( = ?auto_18776 ?auto_18777 ) ) ( HOLDING ?auto_18778 ) ( CLEAR ?auto_18779 ) ( not ( = ?auto_18776 ?auto_18778 ) ) ( not ( = ?auto_18776 ?auto_18779 ) ) ( not ( = ?auto_18777 ?auto_18778 ) ) ( not ( = ?auto_18777 ?auto_18779 ) ) ( not ( = ?auto_18778 ?auto_18779 ) ) )
    :subtasks
    ( ( !STACK ?auto_18778 ?auto_18779 )
      ( MAKE-1PILE ?auto_18776 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18780 - BLOCK
    )
    :vars
    (
      ?auto_18781 - BLOCK
      ?auto_18782 - BLOCK
      ?auto_18783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18781 ?auto_18780 ) ( ON-TABLE ?auto_18780 ) ( not ( = ?auto_18780 ?auto_18781 ) ) ( CLEAR ?auto_18782 ) ( not ( = ?auto_18780 ?auto_18783 ) ) ( not ( = ?auto_18780 ?auto_18782 ) ) ( not ( = ?auto_18781 ?auto_18783 ) ) ( not ( = ?auto_18781 ?auto_18782 ) ) ( not ( = ?auto_18783 ?auto_18782 ) ) ( ON ?auto_18783 ?auto_18781 ) ( CLEAR ?auto_18783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18780 ?auto_18781 )
      ( MAKE-1PILE ?auto_18780 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18784 - BLOCK
    )
    :vars
    (
      ?auto_18786 - BLOCK
      ?auto_18787 - BLOCK
      ?auto_18785 - BLOCK
      ?auto_18789 - BLOCK
      ?auto_18788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18786 ?auto_18784 ) ( ON-TABLE ?auto_18784 ) ( not ( = ?auto_18784 ?auto_18786 ) ) ( not ( = ?auto_18784 ?auto_18787 ) ) ( not ( = ?auto_18784 ?auto_18785 ) ) ( not ( = ?auto_18786 ?auto_18787 ) ) ( not ( = ?auto_18786 ?auto_18785 ) ) ( not ( = ?auto_18787 ?auto_18785 ) ) ( ON ?auto_18787 ?auto_18786 ) ( CLEAR ?auto_18787 ) ( HOLDING ?auto_18785 ) ( CLEAR ?auto_18789 ) ( ON-TABLE ?auto_18788 ) ( ON ?auto_18789 ?auto_18788 ) ( not ( = ?auto_18788 ?auto_18789 ) ) ( not ( = ?auto_18788 ?auto_18785 ) ) ( not ( = ?auto_18789 ?auto_18785 ) ) ( not ( = ?auto_18784 ?auto_18789 ) ) ( not ( = ?auto_18784 ?auto_18788 ) ) ( not ( = ?auto_18786 ?auto_18789 ) ) ( not ( = ?auto_18786 ?auto_18788 ) ) ( not ( = ?auto_18787 ?auto_18789 ) ) ( not ( = ?auto_18787 ?auto_18788 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18788 ?auto_18789 ?auto_18785 )
      ( MAKE-1PILE ?auto_18784 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18790 - BLOCK
    )
    :vars
    (
      ?auto_18794 - BLOCK
      ?auto_18793 - BLOCK
      ?auto_18791 - BLOCK
      ?auto_18792 - BLOCK
      ?auto_18795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18794 ?auto_18790 ) ( ON-TABLE ?auto_18790 ) ( not ( = ?auto_18790 ?auto_18794 ) ) ( not ( = ?auto_18790 ?auto_18793 ) ) ( not ( = ?auto_18790 ?auto_18791 ) ) ( not ( = ?auto_18794 ?auto_18793 ) ) ( not ( = ?auto_18794 ?auto_18791 ) ) ( not ( = ?auto_18793 ?auto_18791 ) ) ( ON ?auto_18793 ?auto_18794 ) ( CLEAR ?auto_18792 ) ( ON-TABLE ?auto_18795 ) ( ON ?auto_18792 ?auto_18795 ) ( not ( = ?auto_18795 ?auto_18792 ) ) ( not ( = ?auto_18795 ?auto_18791 ) ) ( not ( = ?auto_18792 ?auto_18791 ) ) ( not ( = ?auto_18790 ?auto_18792 ) ) ( not ( = ?auto_18790 ?auto_18795 ) ) ( not ( = ?auto_18794 ?auto_18792 ) ) ( not ( = ?auto_18794 ?auto_18795 ) ) ( not ( = ?auto_18793 ?auto_18792 ) ) ( not ( = ?auto_18793 ?auto_18795 ) ) ( ON ?auto_18791 ?auto_18793 ) ( CLEAR ?auto_18791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18790 ?auto_18794 ?auto_18793 )
      ( MAKE-1PILE ?auto_18790 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18796 - BLOCK
    )
    :vars
    (
      ?auto_18800 - BLOCK
      ?auto_18801 - BLOCK
      ?auto_18798 - BLOCK
      ?auto_18799 - BLOCK
      ?auto_18797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18800 ?auto_18796 ) ( ON-TABLE ?auto_18796 ) ( not ( = ?auto_18796 ?auto_18800 ) ) ( not ( = ?auto_18796 ?auto_18801 ) ) ( not ( = ?auto_18796 ?auto_18798 ) ) ( not ( = ?auto_18800 ?auto_18801 ) ) ( not ( = ?auto_18800 ?auto_18798 ) ) ( not ( = ?auto_18801 ?auto_18798 ) ) ( ON ?auto_18801 ?auto_18800 ) ( ON-TABLE ?auto_18799 ) ( not ( = ?auto_18799 ?auto_18797 ) ) ( not ( = ?auto_18799 ?auto_18798 ) ) ( not ( = ?auto_18797 ?auto_18798 ) ) ( not ( = ?auto_18796 ?auto_18797 ) ) ( not ( = ?auto_18796 ?auto_18799 ) ) ( not ( = ?auto_18800 ?auto_18797 ) ) ( not ( = ?auto_18800 ?auto_18799 ) ) ( not ( = ?auto_18801 ?auto_18797 ) ) ( not ( = ?auto_18801 ?auto_18799 ) ) ( ON ?auto_18798 ?auto_18801 ) ( CLEAR ?auto_18798 ) ( HOLDING ?auto_18797 ) ( CLEAR ?auto_18799 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18799 ?auto_18797 )
      ( MAKE-1PILE ?auto_18796 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19265 - BLOCK
    )
    :vars
    (
      ?auto_19269 - BLOCK
      ?auto_19268 - BLOCK
      ?auto_19266 - BLOCK
      ?auto_19267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19269 ?auto_19265 ) ( ON-TABLE ?auto_19265 ) ( not ( = ?auto_19265 ?auto_19269 ) ) ( not ( = ?auto_19265 ?auto_19268 ) ) ( not ( = ?auto_19265 ?auto_19266 ) ) ( not ( = ?auto_19269 ?auto_19268 ) ) ( not ( = ?auto_19269 ?auto_19266 ) ) ( not ( = ?auto_19268 ?auto_19266 ) ) ( ON ?auto_19268 ?auto_19269 ) ( not ( = ?auto_19267 ?auto_19266 ) ) ( not ( = ?auto_19265 ?auto_19267 ) ) ( not ( = ?auto_19269 ?auto_19267 ) ) ( not ( = ?auto_19268 ?auto_19267 ) ) ( ON ?auto_19266 ?auto_19268 ) ( ON ?auto_19267 ?auto_19266 ) ( CLEAR ?auto_19267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19265 ?auto_19269 ?auto_19268 ?auto_19266 )
      ( MAKE-1PILE ?auto_19265 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18808 - BLOCK
    )
    :vars
    (
      ?auto_18812 - BLOCK
      ?auto_18810 - BLOCK
      ?auto_18811 - BLOCK
      ?auto_18813 - BLOCK
      ?auto_18809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18812 ?auto_18808 ) ( ON-TABLE ?auto_18808 ) ( not ( = ?auto_18808 ?auto_18812 ) ) ( not ( = ?auto_18808 ?auto_18810 ) ) ( not ( = ?auto_18808 ?auto_18811 ) ) ( not ( = ?auto_18812 ?auto_18810 ) ) ( not ( = ?auto_18812 ?auto_18811 ) ) ( not ( = ?auto_18810 ?auto_18811 ) ) ( ON ?auto_18810 ?auto_18812 ) ( not ( = ?auto_18813 ?auto_18809 ) ) ( not ( = ?auto_18813 ?auto_18811 ) ) ( not ( = ?auto_18809 ?auto_18811 ) ) ( not ( = ?auto_18808 ?auto_18809 ) ) ( not ( = ?auto_18808 ?auto_18813 ) ) ( not ( = ?auto_18812 ?auto_18809 ) ) ( not ( = ?auto_18812 ?auto_18813 ) ) ( not ( = ?auto_18810 ?auto_18809 ) ) ( not ( = ?auto_18810 ?auto_18813 ) ) ( ON ?auto_18811 ?auto_18810 ) ( ON ?auto_18809 ?auto_18811 ) ( CLEAR ?auto_18809 ) ( HOLDING ?auto_18813 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18813 )
      ( MAKE-1PILE ?auto_18808 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18814 - BLOCK
    )
    :vars
    (
      ?auto_18817 - BLOCK
      ?auto_18816 - BLOCK
      ?auto_18818 - BLOCK
      ?auto_18819 - BLOCK
      ?auto_18815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18817 ?auto_18814 ) ( ON-TABLE ?auto_18814 ) ( not ( = ?auto_18814 ?auto_18817 ) ) ( not ( = ?auto_18814 ?auto_18816 ) ) ( not ( = ?auto_18814 ?auto_18818 ) ) ( not ( = ?auto_18817 ?auto_18816 ) ) ( not ( = ?auto_18817 ?auto_18818 ) ) ( not ( = ?auto_18816 ?auto_18818 ) ) ( ON ?auto_18816 ?auto_18817 ) ( not ( = ?auto_18819 ?auto_18815 ) ) ( not ( = ?auto_18819 ?auto_18818 ) ) ( not ( = ?auto_18815 ?auto_18818 ) ) ( not ( = ?auto_18814 ?auto_18815 ) ) ( not ( = ?auto_18814 ?auto_18819 ) ) ( not ( = ?auto_18817 ?auto_18815 ) ) ( not ( = ?auto_18817 ?auto_18819 ) ) ( not ( = ?auto_18816 ?auto_18815 ) ) ( not ( = ?auto_18816 ?auto_18819 ) ) ( ON ?auto_18818 ?auto_18816 ) ( ON ?auto_18815 ?auto_18818 ) ( ON ?auto_18819 ?auto_18815 ) ( CLEAR ?auto_18819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18814 ?auto_18817 ?auto_18816 ?auto_18818 ?auto_18815 )
      ( MAKE-1PILE ?auto_18814 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18825 - BLOCK
      ?auto_18826 - BLOCK
      ?auto_18827 - BLOCK
      ?auto_18828 - BLOCK
      ?auto_18829 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_18829 ) ( CLEAR ?auto_18828 ) ( ON-TABLE ?auto_18825 ) ( ON ?auto_18826 ?auto_18825 ) ( ON ?auto_18827 ?auto_18826 ) ( ON ?auto_18828 ?auto_18827 ) ( not ( = ?auto_18825 ?auto_18826 ) ) ( not ( = ?auto_18825 ?auto_18827 ) ) ( not ( = ?auto_18825 ?auto_18828 ) ) ( not ( = ?auto_18825 ?auto_18829 ) ) ( not ( = ?auto_18826 ?auto_18827 ) ) ( not ( = ?auto_18826 ?auto_18828 ) ) ( not ( = ?auto_18826 ?auto_18829 ) ) ( not ( = ?auto_18827 ?auto_18828 ) ) ( not ( = ?auto_18827 ?auto_18829 ) ) ( not ( = ?auto_18828 ?auto_18829 ) ) )
    :subtasks
    ( ( !STACK ?auto_18829 ?auto_18828 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18830 - BLOCK
      ?auto_18831 - BLOCK
      ?auto_18832 - BLOCK
      ?auto_18833 - BLOCK
      ?auto_18834 - BLOCK
    )
    :vars
    (
      ?auto_18835 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18833 ) ( ON-TABLE ?auto_18830 ) ( ON ?auto_18831 ?auto_18830 ) ( ON ?auto_18832 ?auto_18831 ) ( ON ?auto_18833 ?auto_18832 ) ( not ( = ?auto_18830 ?auto_18831 ) ) ( not ( = ?auto_18830 ?auto_18832 ) ) ( not ( = ?auto_18830 ?auto_18833 ) ) ( not ( = ?auto_18830 ?auto_18834 ) ) ( not ( = ?auto_18831 ?auto_18832 ) ) ( not ( = ?auto_18831 ?auto_18833 ) ) ( not ( = ?auto_18831 ?auto_18834 ) ) ( not ( = ?auto_18832 ?auto_18833 ) ) ( not ( = ?auto_18832 ?auto_18834 ) ) ( not ( = ?auto_18833 ?auto_18834 ) ) ( ON ?auto_18834 ?auto_18835 ) ( CLEAR ?auto_18834 ) ( HAND-EMPTY ) ( not ( = ?auto_18830 ?auto_18835 ) ) ( not ( = ?auto_18831 ?auto_18835 ) ) ( not ( = ?auto_18832 ?auto_18835 ) ) ( not ( = ?auto_18833 ?auto_18835 ) ) ( not ( = ?auto_18834 ?auto_18835 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18834 ?auto_18835 )
      ( MAKE-5PILE ?auto_18830 ?auto_18831 ?auto_18832 ?auto_18833 ?auto_18834 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18836 - BLOCK
      ?auto_18837 - BLOCK
      ?auto_18838 - BLOCK
      ?auto_18839 - BLOCK
      ?auto_18840 - BLOCK
    )
    :vars
    (
      ?auto_18841 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18836 ) ( ON ?auto_18837 ?auto_18836 ) ( ON ?auto_18838 ?auto_18837 ) ( not ( = ?auto_18836 ?auto_18837 ) ) ( not ( = ?auto_18836 ?auto_18838 ) ) ( not ( = ?auto_18836 ?auto_18839 ) ) ( not ( = ?auto_18836 ?auto_18840 ) ) ( not ( = ?auto_18837 ?auto_18838 ) ) ( not ( = ?auto_18837 ?auto_18839 ) ) ( not ( = ?auto_18837 ?auto_18840 ) ) ( not ( = ?auto_18838 ?auto_18839 ) ) ( not ( = ?auto_18838 ?auto_18840 ) ) ( not ( = ?auto_18839 ?auto_18840 ) ) ( ON ?auto_18840 ?auto_18841 ) ( CLEAR ?auto_18840 ) ( not ( = ?auto_18836 ?auto_18841 ) ) ( not ( = ?auto_18837 ?auto_18841 ) ) ( not ( = ?auto_18838 ?auto_18841 ) ) ( not ( = ?auto_18839 ?auto_18841 ) ) ( not ( = ?auto_18840 ?auto_18841 ) ) ( HOLDING ?auto_18839 ) ( CLEAR ?auto_18838 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18836 ?auto_18837 ?auto_18838 ?auto_18839 )
      ( MAKE-5PILE ?auto_18836 ?auto_18837 ?auto_18838 ?auto_18839 ?auto_18840 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18842 - BLOCK
      ?auto_18843 - BLOCK
      ?auto_18844 - BLOCK
      ?auto_18845 - BLOCK
      ?auto_18846 - BLOCK
    )
    :vars
    (
      ?auto_18847 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18842 ) ( ON ?auto_18843 ?auto_18842 ) ( ON ?auto_18844 ?auto_18843 ) ( not ( = ?auto_18842 ?auto_18843 ) ) ( not ( = ?auto_18842 ?auto_18844 ) ) ( not ( = ?auto_18842 ?auto_18845 ) ) ( not ( = ?auto_18842 ?auto_18846 ) ) ( not ( = ?auto_18843 ?auto_18844 ) ) ( not ( = ?auto_18843 ?auto_18845 ) ) ( not ( = ?auto_18843 ?auto_18846 ) ) ( not ( = ?auto_18844 ?auto_18845 ) ) ( not ( = ?auto_18844 ?auto_18846 ) ) ( not ( = ?auto_18845 ?auto_18846 ) ) ( ON ?auto_18846 ?auto_18847 ) ( not ( = ?auto_18842 ?auto_18847 ) ) ( not ( = ?auto_18843 ?auto_18847 ) ) ( not ( = ?auto_18844 ?auto_18847 ) ) ( not ( = ?auto_18845 ?auto_18847 ) ) ( not ( = ?auto_18846 ?auto_18847 ) ) ( CLEAR ?auto_18844 ) ( ON ?auto_18845 ?auto_18846 ) ( CLEAR ?auto_18845 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18847 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18847 ?auto_18846 )
      ( MAKE-5PILE ?auto_18842 ?auto_18843 ?auto_18844 ?auto_18845 ?auto_18846 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18848 - BLOCK
      ?auto_18849 - BLOCK
      ?auto_18850 - BLOCK
      ?auto_18851 - BLOCK
      ?auto_18852 - BLOCK
    )
    :vars
    (
      ?auto_18853 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18848 ) ( ON ?auto_18849 ?auto_18848 ) ( not ( = ?auto_18848 ?auto_18849 ) ) ( not ( = ?auto_18848 ?auto_18850 ) ) ( not ( = ?auto_18848 ?auto_18851 ) ) ( not ( = ?auto_18848 ?auto_18852 ) ) ( not ( = ?auto_18849 ?auto_18850 ) ) ( not ( = ?auto_18849 ?auto_18851 ) ) ( not ( = ?auto_18849 ?auto_18852 ) ) ( not ( = ?auto_18850 ?auto_18851 ) ) ( not ( = ?auto_18850 ?auto_18852 ) ) ( not ( = ?auto_18851 ?auto_18852 ) ) ( ON ?auto_18852 ?auto_18853 ) ( not ( = ?auto_18848 ?auto_18853 ) ) ( not ( = ?auto_18849 ?auto_18853 ) ) ( not ( = ?auto_18850 ?auto_18853 ) ) ( not ( = ?auto_18851 ?auto_18853 ) ) ( not ( = ?auto_18852 ?auto_18853 ) ) ( ON ?auto_18851 ?auto_18852 ) ( CLEAR ?auto_18851 ) ( ON-TABLE ?auto_18853 ) ( HOLDING ?auto_18850 ) ( CLEAR ?auto_18849 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18848 ?auto_18849 ?auto_18850 )
      ( MAKE-5PILE ?auto_18848 ?auto_18849 ?auto_18850 ?auto_18851 ?auto_18852 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18854 - BLOCK
      ?auto_18855 - BLOCK
      ?auto_18856 - BLOCK
      ?auto_18857 - BLOCK
      ?auto_18858 - BLOCK
    )
    :vars
    (
      ?auto_18859 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18854 ) ( ON ?auto_18855 ?auto_18854 ) ( not ( = ?auto_18854 ?auto_18855 ) ) ( not ( = ?auto_18854 ?auto_18856 ) ) ( not ( = ?auto_18854 ?auto_18857 ) ) ( not ( = ?auto_18854 ?auto_18858 ) ) ( not ( = ?auto_18855 ?auto_18856 ) ) ( not ( = ?auto_18855 ?auto_18857 ) ) ( not ( = ?auto_18855 ?auto_18858 ) ) ( not ( = ?auto_18856 ?auto_18857 ) ) ( not ( = ?auto_18856 ?auto_18858 ) ) ( not ( = ?auto_18857 ?auto_18858 ) ) ( ON ?auto_18858 ?auto_18859 ) ( not ( = ?auto_18854 ?auto_18859 ) ) ( not ( = ?auto_18855 ?auto_18859 ) ) ( not ( = ?auto_18856 ?auto_18859 ) ) ( not ( = ?auto_18857 ?auto_18859 ) ) ( not ( = ?auto_18858 ?auto_18859 ) ) ( ON ?auto_18857 ?auto_18858 ) ( ON-TABLE ?auto_18859 ) ( CLEAR ?auto_18855 ) ( ON ?auto_18856 ?auto_18857 ) ( CLEAR ?auto_18856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18859 ?auto_18858 ?auto_18857 )
      ( MAKE-5PILE ?auto_18854 ?auto_18855 ?auto_18856 ?auto_18857 ?auto_18858 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18860 - BLOCK
      ?auto_18861 - BLOCK
      ?auto_18862 - BLOCK
      ?auto_18863 - BLOCK
      ?auto_18864 - BLOCK
    )
    :vars
    (
      ?auto_18865 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18860 ) ( not ( = ?auto_18860 ?auto_18861 ) ) ( not ( = ?auto_18860 ?auto_18862 ) ) ( not ( = ?auto_18860 ?auto_18863 ) ) ( not ( = ?auto_18860 ?auto_18864 ) ) ( not ( = ?auto_18861 ?auto_18862 ) ) ( not ( = ?auto_18861 ?auto_18863 ) ) ( not ( = ?auto_18861 ?auto_18864 ) ) ( not ( = ?auto_18862 ?auto_18863 ) ) ( not ( = ?auto_18862 ?auto_18864 ) ) ( not ( = ?auto_18863 ?auto_18864 ) ) ( ON ?auto_18864 ?auto_18865 ) ( not ( = ?auto_18860 ?auto_18865 ) ) ( not ( = ?auto_18861 ?auto_18865 ) ) ( not ( = ?auto_18862 ?auto_18865 ) ) ( not ( = ?auto_18863 ?auto_18865 ) ) ( not ( = ?auto_18864 ?auto_18865 ) ) ( ON ?auto_18863 ?auto_18864 ) ( ON-TABLE ?auto_18865 ) ( ON ?auto_18862 ?auto_18863 ) ( CLEAR ?auto_18862 ) ( HOLDING ?auto_18861 ) ( CLEAR ?auto_18860 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18860 ?auto_18861 )
      ( MAKE-5PILE ?auto_18860 ?auto_18861 ?auto_18862 ?auto_18863 ?auto_18864 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18866 - BLOCK
      ?auto_18867 - BLOCK
      ?auto_18868 - BLOCK
      ?auto_18869 - BLOCK
      ?auto_18870 - BLOCK
    )
    :vars
    (
      ?auto_18871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18866 ) ( not ( = ?auto_18866 ?auto_18867 ) ) ( not ( = ?auto_18866 ?auto_18868 ) ) ( not ( = ?auto_18866 ?auto_18869 ) ) ( not ( = ?auto_18866 ?auto_18870 ) ) ( not ( = ?auto_18867 ?auto_18868 ) ) ( not ( = ?auto_18867 ?auto_18869 ) ) ( not ( = ?auto_18867 ?auto_18870 ) ) ( not ( = ?auto_18868 ?auto_18869 ) ) ( not ( = ?auto_18868 ?auto_18870 ) ) ( not ( = ?auto_18869 ?auto_18870 ) ) ( ON ?auto_18870 ?auto_18871 ) ( not ( = ?auto_18866 ?auto_18871 ) ) ( not ( = ?auto_18867 ?auto_18871 ) ) ( not ( = ?auto_18868 ?auto_18871 ) ) ( not ( = ?auto_18869 ?auto_18871 ) ) ( not ( = ?auto_18870 ?auto_18871 ) ) ( ON ?auto_18869 ?auto_18870 ) ( ON-TABLE ?auto_18871 ) ( ON ?auto_18868 ?auto_18869 ) ( CLEAR ?auto_18866 ) ( ON ?auto_18867 ?auto_18868 ) ( CLEAR ?auto_18867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18871 ?auto_18870 ?auto_18869 ?auto_18868 )
      ( MAKE-5PILE ?auto_18866 ?auto_18867 ?auto_18868 ?auto_18869 ?auto_18870 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18872 - BLOCK
      ?auto_18873 - BLOCK
      ?auto_18874 - BLOCK
      ?auto_18875 - BLOCK
      ?auto_18876 - BLOCK
    )
    :vars
    (
      ?auto_18877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18872 ?auto_18873 ) ) ( not ( = ?auto_18872 ?auto_18874 ) ) ( not ( = ?auto_18872 ?auto_18875 ) ) ( not ( = ?auto_18872 ?auto_18876 ) ) ( not ( = ?auto_18873 ?auto_18874 ) ) ( not ( = ?auto_18873 ?auto_18875 ) ) ( not ( = ?auto_18873 ?auto_18876 ) ) ( not ( = ?auto_18874 ?auto_18875 ) ) ( not ( = ?auto_18874 ?auto_18876 ) ) ( not ( = ?auto_18875 ?auto_18876 ) ) ( ON ?auto_18876 ?auto_18877 ) ( not ( = ?auto_18872 ?auto_18877 ) ) ( not ( = ?auto_18873 ?auto_18877 ) ) ( not ( = ?auto_18874 ?auto_18877 ) ) ( not ( = ?auto_18875 ?auto_18877 ) ) ( not ( = ?auto_18876 ?auto_18877 ) ) ( ON ?auto_18875 ?auto_18876 ) ( ON-TABLE ?auto_18877 ) ( ON ?auto_18874 ?auto_18875 ) ( ON ?auto_18873 ?auto_18874 ) ( CLEAR ?auto_18873 ) ( HOLDING ?auto_18872 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18872 )
      ( MAKE-5PILE ?auto_18872 ?auto_18873 ?auto_18874 ?auto_18875 ?auto_18876 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18878 - BLOCK
      ?auto_18879 - BLOCK
      ?auto_18880 - BLOCK
      ?auto_18881 - BLOCK
      ?auto_18882 - BLOCK
    )
    :vars
    (
      ?auto_18883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18878 ?auto_18879 ) ) ( not ( = ?auto_18878 ?auto_18880 ) ) ( not ( = ?auto_18878 ?auto_18881 ) ) ( not ( = ?auto_18878 ?auto_18882 ) ) ( not ( = ?auto_18879 ?auto_18880 ) ) ( not ( = ?auto_18879 ?auto_18881 ) ) ( not ( = ?auto_18879 ?auto_18882 ) ) ( not ( = ?auto_18880 ?auto_18881 ) ) ( not ( = ?auto_18880 ?auto_18882 ) ) ( not ( = ?auto_18881 ?auto_18882 ) ) ( ON ?auto_18882 ?auto_18883 ) ( not ( = ?auto_18878 ?auto_18883 ) ) ( not ( = ?auto_18879 ?auto_18883 ) ) ( not ( = ?auto_18880 ?auto_18883 ) ) ( not ( = ?auto_18881 ?auto_18883 ) ) ( not ( = ?auto_18882 ?auto_18883 ) ) ( ON ?auto_18881 ?auto_18882 ) ( ON-TABLE ?auto_18883 ) ( ON ?auto_18880 ?auto_18881 ) ( ON ?auto_18879 ?auto_18880 ) ( ON ?auto_18878 ?auto_18879 ) ( CLEAR ?auto_18878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18883 ?auto_18882 ?auto_18881 ?auto_18880 ?auto_18879 )
      ( MAKE-5PILE ?auto_18878 ?auto_18879 ?auto_18880 ?auto_18881 ?auto_18882 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18942 - BLOCK
    )
    :vars
    (
      ?auto_18943 - BLOCK
      ?auto_18944 - BLOCK
      ?auto_18945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18942 ?auto_18943 ) ( CLEAR ?auto_18942 ) ( not ( = ?auto_18942 ?auto_18943 ) ) ( HOLDING ?auto_18944 ) ( CLEAR ?auto_18945 ) ( not ( = ?auto_18942 ?auto_18944 ) ) ( not ( = ?auto_18942 ?auto_18945 ) ) ( not ( = ?auto_18943 ?auto_18944 ) ) ( not ( = ?auto_18943 ?auto_18945 ) ) ( not ( = ?auto_18944 ?auto_18945 ) ) )
    :subtasks
    ( ( !STACK ?auto_18944 ?auto_18945 )
      ( MAKE-1PILE ?auto_18942 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18946 - BLOCK
    )
    :vars
    (
      ?auto_18949 - BLOCK
      ?auto_18947 - BLOCK
      ?auto_18948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18946 ?auto_18949 ) ( not ( = ?auto_18946 ?auto_18949 ) ) ( CLEAR ?auto_18947 ) ( not ( = ?auto_18946 ?auto_18948 ) ) ( not ( = ?auto_18946 ?auto_18947 ) ) ( not ( = ?auto_18949 ?auto_18948 ) ) ( not ( = ?auto_18949 ?auto_18947 ) ) ( not ( = ?auto_18948 ?auto_18947 ) ) ( ON ?auto_18948 ?auto_18946 ) ( CLEAR ?auto_18948 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18949 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18949 ?auto_18946 )
      ( MAKE-1PILE ?auto_18946 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18950 - BLOCK
    )
    :vars
    (
      ?auto_18951 - BLOCK
      ?auto_18952 - BLOCK
      ?auto_18953 - BLOCK
      ?auto_18955 - BLOCK
      ?auto_18954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18950 ?auto_18951 ) ( not ( = ?auto_18950 ?auto_18951 ) ) ( not ( = ?auto_18950 ?auto_18952 ) ) ( not ( = ?auto_18950 ?auto_18953 ) ) ( not ( = ?auto_18951 ?auto_18952 ) ) ( not ( = ?auto_18951 ?auto_18953 ) ) ( not ( = ?auto_18952 ?auto_18953 ) ) ( ON ?auto_18952 ?auto_18950 ) ( CLEAR ?auto_18952 ) ( ON-TABLE ?auto_18951 ) ( HOLDING ?auto_18953 ) ( CLEAR ?auto_18955 ) ( ON-TABLE ?auto_18954 ) ( ON ?auto_18955 ?auto_18954 ) ( not ( = ?auto_18954 ?auto_18955 ) ) ( not ( = ?auto_18954 ?auto_18953 ) ) ( not ( = ?auto_18955 ?auto_18953 ) ) ( not ( = ?auto_18950 ?auto_18955 ) ) ( not ( = ?auto_18950 ?auto_18954 ) ) ( not ( = ?auto_18951 ?auto_18955 ) ) ( not ( = ?auto_18951 ?auto_18954 ) ) ( not ( = ?auto_18952 ?auto_18955 ) ) ( not ( = ?auto_18952 ?auto_18954 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18954 ?auto_18955 ?auto_18953 )
      ( MAKE-1PILE ?auto_18950 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18956 - BLOCK
    )
    :vars
    (
      ?auto_18959 - BLOCK
      ?auto_18960 - BLOCK
      ?auto_18957 - BLOCK
      ?auto_18958 - BLOCK
      ?auto_18961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18956 ?auto_18959 ) ( not ( = ?auto_18956 ?auto_18959 ) ) ( not ( = ?auto_18956 ?auto_18960 ) ) ( not ( = ?auto_18956 ?auto_18957 ) ) ( not ( = ?auto_18959 ?auto_18960 ) ) ( not ( = ?auto_18959 ?auto_18957 ) ) ( not ( = ?auto_18960 ?auto_18957 ) ) ( ON ?auto_18960 ?auto_18956 ) ( ON-TABLE ?auto_18959 ) ( CLEAR ?auto_18958 ) ( ON-TABLE ?auto_18961 ) ( ON ?auto_18958 ?auto_18961 ) ( not ( = ?auto_18961 ?auto_18958 ) ) ( not ( = ?auto_18961 ?auto_18957 ) ) ( not ( = ?auto_18958 ?auto_18957 ) ) ( not ( = ?auto_18956 ?auto_18958 ) ) ( not ( = ?auto_18956 ?auto_18961 ) ) ( not ( = ?auto_18959 ?auto_18958 ) ) ( not ( = ?auto_18959 ?auto_18961 ) ) ( not ( = ?auto_18960 ?auto_18958 ) ) ( not ( = ?auto_18960 ?auto_18961 ) ) ( ON ?auto_18957 ?auto_18960 ) ( CLEAR ?auto_18957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18959 ?auto_18956 ?auto_18960 )
      ( MAKE-1PILE ?auto_18956 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18962 - BLOCK
    )
    :vars
    (
      ?auto_18965 - BLOCK
      ?auto_18964 - BLOCK
      ?auto_18966 - BLOCK
      ?auto_18967 - BLOCK
      ?auto_18963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18962 ?auto_18965 ) ( not ( = ?auto_18962 ?auto_18965 ) ) ( not ( = ?auto_18962 ?auto_18964 ) ) ( not ( = ?auto_18962 ?auto_18966 ) ) ( not ( = ?auto_18965 ?auto_18964 ) ) ( not ( = ?auto_18965 ?auto_18966 ) ) ( not ( = ?auto_18964 ?auto_18966 ) ) ( ON ?auto_18964 ?auto_18962 ) ( ON-TABLE ?auto_18965 ) ( ON-TABLE ?auto_18967 ) ( not ( = ?auto_18967 ?auto_18963 ) ) ( not ( = ?auto_18967 ?auto_18966 ) ) ( not ( = ?auto_18963 ?auto_18966 ) ) ( not ( = ?auto_18962 ?auto_18963 ) ) ( not ( = ?auto_18962 ?auto_18967 ) ) ( not ( = ?auto_18965 ?auto_18963 ) ) ( not ( = ?auto_18965 ?auto_18967 ) ) ( not ( = ?auto_18964 ?auto_18963 ) ) ( not ( = ?auto_18964 ?auto_18967 ) ) ( ON ?auto_18966 ?auto_18964 ) ( CLEAR ?auto_18966 ) ( HOLDING ?auto_18963 ) ( CLEAR ?auto_18967 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18967 ?auto_18963 )
      ( MAKE-1PILE ?auto_18962 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18968 - BLOCK
    )
    :vars
    (
      ?auto_18972 - BLOCK
      ?auto_18973 - BLOCK
      ?auto_18969 - BLOCK
      ?auto_18971 - BLOCK
      ?auto_18970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18968 ?auto_18972 ) ( not ( = ?auto_18968 ?auto_18972 ) ) ( not ( = ?auto_18968 ?auto_18973 ) ) ( not ( = ?auto_18968 ?auto_18969 ) ) ( not ( = ?auto_18972 ?auto_18973 ) ) ( not ( = ?auto_18972 ?auto_18969 ) ) ( not ( = ?auto_18973 ?auto_18969 ) ) ( ON ?auto_18973 ?auto_18968 ) ( ON-TABLE ?auto_18972 ) ( ON-TABLE ?auto_18971 ) ( not ( = ?auto_18971 ?auto_18970 ) ) ( not ( = ?auto_18971 ?auto_18969 ) ) ( not ( = ?auto_18970 ?auto_18969 ) ) ( not ( = ?auto_18968 ?auto_18970 ) ) ( not ( = ?auto_18968 ?auto_18971 ) ) ( not ( = ?auto_18972 ?auto_18970 ) ) ( not ( = ?auto_18972 ?auto_18971 ) ) ( not ( = ?auto_18973 ?auto_18970 ) ) ( not ( = ?auto_18973 ?auto_18971 ) ) ( ON ?auto_18969 ?auto_18973 ) ( CLEAR ?auto_18971 ) ( ON ?auto_18970 ?auto_18969 ) ( CLEAR ?auto_18970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18972 ?auto_18968 ?auto_18973 ?auto_18969 )
      ( MAKE-1PILE ?auto_18968 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18974 - BLOCK
    )
    :vars
    (
      ?auto_18979 - BLOCK
      ?auto_18978 - BLOCK
      ?auto_18976 - BLOCK
      ?auto_18977 - BLOCK
      ?auto_18975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18974 ?auto_18979 ) ( not ( = ?auto_18974 ?auto_18979 ) ) ( not ( = ?auto_18974 ?auto_18978 ) ) ( not ( = ?auto_18974 ?auto_18976 ) ) ( not ( = ?auto_18979 ?auto_18978 ) ) ( not ( = ?auto_18979 ?auto_18976 ) ) ( not ( = ?auto_18978 ?auto_18976 ) ) ( ON ?auto_18978 ?auto_18974 ) ( ON-TABLE ?auto_18979 ) ( not ( = ?auto_18977 ?auto_18975 ) ) ( not ( = ?auto_18977 ?auto_18976 ) ) ( not ( = ?auto_18975 ?auto_18976 ) ) ( not ( = ?auto_18974 ?auto_18975 ) ) ( not ( = ?auto_18974 ?auto_18977 ) ) ( not ( = ?auto_18979 ?auto_18975 ) ) ( not ( = ?auto_18979 ?auto_18977 ) ) ( not ( = ?auto_18978 ?auto_18975 ) ) ( not ( = ?auto_18978 ?auto_18977 ) ) ( ON ?auto_18976 ?auto_18978 ) ( ON ?auto_18975 ?auto_18976 ) ( CLEAR ?auto_18975 ) ( HOLDING ?auto_18977 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18977 )
      ( MAKE-1PILE ?auto_18974 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18980 - BLOCK
    )
    :vars
    (
      ?auto_18984 - BLOCK
      ?auto_18981 - BLOCK
      ?auto_18982 - BLOCK
      ?auto_18985 - BLOCK
      ?auto_18983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18980 ?auto_18984 ) ( not ( = ?auto_18980 ?auto_18984 ) ) ( not ( = ?auto_18980 ?auto_18981 ) ) ( not ( = ?auto_18980 ?auto_18982 ) ) ( not ( = ?auto_18984 ?auto_18981 ) ) ( not ( = ?auto_18984 ?auto_18982 ) ) ( not ( = ?auto_18981 ?auto_18982 ) ) ( ON ?auto_18981 ?auto_18980 ) ( ON-TABLE ?auto_18984 ) ( not ( = ?auto_18985 ?auto_18983 ) ) ( not ( = ?auto_18985 ?auto_18982 ) ) ( not ( = ?auto_18983 ?auto_18982 ) ) ( not ( = ?auto_18980 ?auto_18983 ) ) ( not ( = ?auto_18980 ?auto_18985 ) ) ( not ( = ?auto_18984 ?auto_18983 ) ) ( not ( = ?auto_18984 ?auto_18985 ) ) ( not ( = ?auto_18981 ?auto_18983 ) ) ( not ( = ?auto_18981 ?auto_18985 ) ) ( ON ?auto_18982 ?auto_18981 ) ( ON ?auto_18983 ?auto_18982 ) ( ON ?auto_18985 ?auto_18983 ) ( CLEAR ?auto_18985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18984 ?auto_18980 ?auto_18981 ?auto_18982 ?auto_18983 )
      ( MAKE-1PILE ?auto_18980 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18993 - BLOCK
      ?auto_18994 - BLOCK
      ?auto_18995 - BLOCK
    )
    :vars
    (
      ?auto_18996 - BLOCK
      ?auto_18997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18996 ?auto_18995 ) ( CLEAR ?auto_18996 ) ( ON-TABLE ?auto_18993 ) ( ON ?auto_18994 ?auto_18993 ) ( ON ?auto_18995 ?auto_18994 ) ( not ( = ?auto_18993 ?auto_18994 ) ) ( not ( = ?auto_18993 ?auto_18995 ) ) ( not ( = ?auto_18993 ?auto_18996 ) ) ( not ( = ?auto_18994 ?auto_18995 ) ) ( not ( = ?auto_18994 ?auto_18996 ) ) ( not ( = ?auto_18995 ?auto_18996 ) ) ( HOLDING ?auto_18997 ) ( not ( = ?auto_18993 ?auto_18997 ) ) ( not ( = ?auto_18994 ?auto_18997 ) ) ( not ( = ?auto_18995 ?auto_18997 ) ) ( not ( = ?auto_18996 ?auto_18997 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_18997 )
      ( MAKE-3PILE ?auto_18993 ?auto_18994 ?auto_18995 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19046 - BLOCK
      ?auto_19047 - BLOCK
    )
    :vars
    (
      ?auto_19048 - BLOCK
      ?auto_19049 - BLOCK
      ?auto_19050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19046 ?auto_19047 ) ) ( ON ?auto_19047 ?auto_19048 ) ( not ( = ?auto_19046 ?auto_19048 ) ) ( not ( = ?auto_19047 ?auto_19048 ) ) ( ON ?auto_19046 ?auto_19047 ) ( CLEAR ?auto_19046 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19049 ) ( ON ?auto_19050 ?auto_19049 ) ( ON ?auto_19048 ?auto_19050 ) ( not ( = ?auto_19049 ?auto_19050 ) ) ( not ( = ?auto_19049 ?auto_19048 ) ) ( not ( = ?auto_19049 ?auto_19047 ) ) ( not ( = ?auto_19049 ?auto_19046 ) ) ( not ( = ?auto_19050 ?auto_19048 ) ) ( not ( = ?auto_19050 ?auto_19047 ) ) ( not ( = ?auto_19050 ?auto_19046 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19049 ?auto_19050 ?auto_19048 ?auto_19047 )
      ( MAKE-2PILE ?auto_19046 ?auto_19047 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19053 - BLOCK
      ?auto_19054 - BLOCK
    )
    :vars
    (
      ?auto_19055 - BLOCK
      ?auto_19056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19053 ?auto_19054 ) ) ( ON ?auto_19054 ?auto_19055 ) ( CLEAR ?auto_19054 ) ( not ( = ?auto_19053 ?auto_19055 ) ) ( not ( = ?auto_19054 ?auto_19055 ) ) ( ON ?auto_19053 ?auto_19056 ) ( CLEAR ?auto_19053 ) ( HAND-EMPTY ) ( not ( = ?auto_19053 ?auto_19056 ) ) ( not ( = ?auto_19054 ?auto_19056 ) ) ( not ( = ?auto_19055 ?auto_19056 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19053 ?auto_19056 )
      ( MAKE-2PILE ?auto_19053 ?auto_19054 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19057 - BLOCK
      ?auto_19058 - BLOCK
    )
    :vars
    (
      ?auto_19059 - BLOCK
      ?auto_19060 - BLOCK
      ?auto_19061 - BLOCK
      ?auto_19062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19057 ?auto_19058 ) ) ( not ( = ?auto_19057 ?auto_19059 ) ) ( not ( = ?auto_19058 ?auto_19059 ) ) ( ON ?auto_19057 ?auto_19060 ) ( CLEAR ?auto_19057 ) ( not ( = ?auto_19057 ?auto_19060 ) ) ( not ( = ?auto_19058 ?auto_19060 ) ) ( not ( = ?auto_19059 ?auto_19060 ) ) ( HOLDING ?auto_19058 ) ( CLEAR ?auto_19059 ) ( ON-TABLE ?auto_19061 ) ( ON ?auto_19062 ?auto_19061 ) ( ON ?auto_19059 ?auto_19062 ) ( not ( = ?auto_19061 ?auto_19062 ) ) ( not ( = ?auto_19061 ?auto_19059 ) ) ( not ( = ?auto_19061 ?auto_19058 ) ) ( not ( = ?auto_19062 ?auto_19059 ) ) ( not ( = ?auto_19062 ?auto_19058 ) ) ( not ( = ?auto_19057 ?auto_19061 ) ) ( not ( = ?auto_19057 ?auto_19062 ) ) ( not ( = ?auto_19060 ?auto_19061 ) ) ( not ( = ?auto_19060 ?auto_19062 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19061 ?auto_19062 ?auto_19059 ?auto_19058 )
      ( MAKE-2PILE ?auto_19057 ?auto_19058 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19063 - BLOCK
      ?auto_19064 - BLOCK
    )
    :vars
    (
      ?auto_19067 - BLOCK
      ?auto_19066 - BLOCK
      ?auto_19068 - BLOCK
      ?auto_19065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19063 ?auto_19064 ) ) ( not ( = ?auto_19063 ?auto_19067 ) ) ( not ( = ?auto_19064 ?auto_19067 ) ) ( ON ?auto_19063 ?auto_19066 ) ( not ( = ?auto_19063 ?auto_19066 ) ) ( not ( = ?auto_19064 ?auto_19066 ) ) ( not ( = ?auto_19067 ?auto_19066 ) ) ( CLEAR ?auto_19067 ) ( ON-TABLE ?auto_19068 ) ( ON ?auto_19065 ?auto_19068 ) ( ON ?auto_19067 ?auto_19065 ) ( not ( = ?auto_19068 ?auto_19065 ) ) ( not ( = ?auto_19068 ?auto_19067 ) ) ( not ( = ?auto_19068 ?auto_19064 ) ) ( not ( = ?auto_19065 ?auto_19067 ) ) ( not ( = ?auto_19065 ?auto_19064 ) ) ( not ( = ?auto_19063 ?auto_19068 ) ) ( not ( = ?auto_19063 ?auto_19065 ) ) ( not ( = ?auto_19066 ?auto_19068 ) ) ( not ( = ?auto_19066 ?auto_19065 ) ) ( ON ?auto_19064 ?auto_19063 ) ( CLEAR ?auto_19064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19066 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19066 ?auto_19063 )
      ( MAKE-2PILE ?auto_19063 ?auto_19064 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19069 - BLOCK
      ?auto_19070 - BLOCK
    )
    :vars
    (
      ?auto_19072 - BLOCK
      ?auto_19073 - BLOCK
      ?auto_19071 - BLOCK
      ?auto_19074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19069 ?auto_19070 ) ) ( not ( = ?auto_19069 ?auto_19072 ) ) ( not ( = ?auto_19070 ?auto_19072 ) ) ( ON ?auto_19069 ?auto_19073 ) ( not ( = ?auto_19069 ?auto_19073 ) ) ( not ( = ?auto_19070 ?auto_19073 ) ) ( not ( = ?auto_19072 ?auto_19073 ) ) ( ON-TABLE ?auto_19071 ) ( ON ?auto_19074 ?auto_19071 ) ( not ( = ?auto_19071 ?auto_19074 ) ) ( not ( = ?auto_19071 ?auto_19072 ) ) ( not ( = ?auto_19071 ?auto_19070 ) ) ( not ( = ?auto_19074 ?auto_19072 ) ) ( not ( = ?auto_19074 ?auto_19070 ) ) ( not ( = ?auto_19069 ?auto_19071 ) ) ( not ( = ?auto_19069 ?auto_19074 ) ) ( not ( = ?auto_19073 ?auto_19071 ) ) ( not ( = ?auto_19073 ?auto_19074 ) ) ( ON ?auto_19070 ?auto_19069 ) ( CLEAR ?auto_19070 ) ( ON-TABLE ?auto_19073 ) ( HOLDING ?auto_19072 ) ( CLEAR ?auto_19074 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19071 ?auto_19074 ?auto_19072 )
      ( MAKE-2PILE ?auto_19069 ?auto_19070 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19075 - BLOCK
      ?auto_19076 - BLOCK
    )
    :vars
    (
      ?auto_19079 - BLOCK
      ?auto_19078 - BLOCK
      ?auto_19077 - BLOCK
      ?auto_19080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19075 ?auto_19076 ) ) ( not ( = ?auto_19075 ?auto_19079 ) ) ( not ( = ?auto_19076 ?auto_19079 ) ) ( ON ?auto_19075 ?auto_19078 ) ( not ( = ?auto_19075 ?auto_19078 ) ) ( not ( = ?auto_19076 ?auto_19078 ) ) ( not ( = ?auto_19079 ?auto_19078 ) ) ( ON-TABLE ?auto_19077 ) ( ON ?auto_19080 ?auto_19077 ) ( not ( = ?auto_19077 ?auto_19080 ) ) ( not ( = ?auto_19077 ?auto_19079 ) ) ( not ( = ?auto_19077 ?auto_19076 ) ) ( not ( = ?auto_19080 ?auto_19079 ) ) ( not ( = ?auto_19080 ?auto_19076 ) ) ( not ( = ?auto_19075 ?auto_19077 ) ) ( not ( = ?auto_19075 ?auto_19080 ) ) ( not ( = ?auto_19078 ?auto_19077 ) ) ( not ( = ?auto_19078 ?auto_19080 ) ) ( ON ?auto_19076 ?auto_19075 ) ( ON-TABLE ?auto_19078 ) ( CLEAR ?auto_19080 ) ( ON ?auto_19079 ?auto_19076 ) ( CLEAR ?auto_19079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19078 ?auto_19075 ?auto_19076 )
      ( MAKE-2PILE ?auto_19075 ?auto_19076 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19081 - BLOCK
      ?auto_19082 - BLOCK
    )
    :vars
    (
      ?auto_19085 - BLOCK
      ?auto_19086 - BLOCK
      ?auto_19084 - BLOCK
      ?auto_19083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19081 ?auto_19082 ) ) ( not ( = ?auto_19081 ?auto_19085 ) ) ( not ( = ?auto_19082 ?auto_19085 ) ) ( ON ?auto_19081 ?auto_19086 ) ( not ( = ?auto_19081 ?auto_19086 ) ) ( not ( = ?auto_19082 ?auto_19086 ) ) ( not ( = ?auto_19085 ?auto_19086 ) ) ( ON-TABLE ?auto_19084 ) ( not ( = ?auto_19084 ?auto_19083 ) ) ( not ( = ?auto_19084 ?auto_19085 ) ) ( not ( = ?auto_19084 ?auto_19082 ) ) ( not ( = ?auto_19083 ?auto_19085 ) ) ( not ( = ?auto_19083 ?auto_19082 ) ) ( not ( = ?auto_19081 ?auto_19084 ) ) ( not ( = ?auto_19081 ?auto_19083 ) ) ( not ( = ?auto_19086 ?auto_19084 ) ) ( not ( = ?auto_19086 ?auto_19083 ) ) ( ON ?auto_19082 ?auto_19081 ) ( ON-TABLE ?auto_19086 ) ( ON ?auto_19085 ?auto_19082 ) ( CLEAR ?auto_19085 ) ( HOLDING ?auto_19083 ) ( CLEAR ?auto_19084 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19084 ?auto_19083 )
      ( MAKE-2PILE ?auto_19081 ?auto_19082 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19087 - BLOCK
      ?auto_19088 - BLOCK
    )
    :vars
    (
      ?auto_19089 - BLOCK
      ?auto_19092 - BLOCK
      ?auto_19090 - BLOCK
      ?auto_19091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19087 ?auto_19088 ) ) ( not ( = ?auto_19087 ?auto_19089 ) ) ( not ( = ?auto_19088 ?auto_19089 ) ) ( ON ?auto_19087 ?auto_19092 ) ( not ( = ?auto_19087 ?auto_19092 ) ) ( not ( = ?auto_19088 ?auto_19092 ) ) ( not ( = ?auto_19089 ?auto_19092 ) ) ( ON-TABLE ?auto_19090 ) ( not ( = ?auto_19090 ?auto_19091 ) ) ( not ( = ?auto_19090 ?auto_19089 ) ) ( not ( = ?auto_19090 ?auto_19088 ) ) ( not ( = ?auto_19091 ?auto_19089 ) ) ( not ( = ?auto_19091 ?auto_19088 ) ) ( not ( = ?auto_19087 ?auto_19090 ) ) ( not ( = ?auto_19087 ?auto_19091 ) ) ( not ( = ?auto_19092 ?auto_19090 ) ) ( not ( = ?auto_19092 ?auto_19091 ) ) ( ON ?auto_19088 ?auto_19087 ) ( ON-TABLE ?auto_19092 ) ( ON ?auto_19089 ?auto_19088 ) ( CLEAR ?auto_19090 ) ( ON ?auto_19091 ?auto_19089 ) ( CLEAR ?auto_19091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19092 ?auto_19087 ?auto_19088 ?auto_19089 )
      ( MAKE-2PILE ?auto_19087 ?auto_19088 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19093 - BLOCK
      ?auto_19094 - BLOCK
    )
    :vars
    (
      ?auto_19096 - BLOCK
      ?auto_19098 - BLOCK
      ?auto_19097 - BLOCK
      ?auto_19095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19093 ?auto_19094 ) ) ( not ( = ?auto_19093 ?auto_19096 ) ) ( not ( = ?auto_19094 ?auto_19096 ) ) ( ON ?auto_19093 ?auto_19098 ) ( not ( = ?auto_19093 ?auto_19098 ) ) ( not ( = ?auto_19094 ?auto_19098 ) ) ( not ( = ?auto_19096 ?auto_19098 ) ) ( not ( = ?auto_19097 ?auto_19095 ) ) ( not ( = ?auto_19097 ?auto_19096 ) ) ( not ( = ?auto_19097 ?auto_19094 ) ) ( not ( = ?auto_19095 ?auto_19096 ) ) ( not ( = ?auto_19095 ?auto_19094 ) ) ( not ( = ?auto_19093 ?auto_19097 ) ) ( not ( = ?auto_19093 ?auto_19095 ) ) ( not ( = ?auto_19098 ?auto_19097 ) ) ( not ( = ?auto_19098 ?auto_19095 ) ) ( ON ?auto_19094 ?auto_19093 ) ( ON-TABLE ?auto_19098 ) ( ON ?auto_19096 ?auto_19094 ) ( ON ?auto_19095 ?auto_19096 ) ( CLEAR ?auto_19095 ) ( HOLDING ?auto_19097 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19097 )
      ( MAKE-2PILE ?auto_19093 ?auto_19094 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19099 - BLOCK
      ?auto_19100 - BLOCK
    )
    :vars
    (
      ?auto_19101 - BLOCK
      ?auto_19102 - BLOCK
      ?auto_19103 - BLOCK
      ?auto_19104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19099 ?auto_19100 ) ) ( not ( = ?auto_19099 ?auto_19101 ) ) ( not ( = ?auto_19100 ?auto_19101 ) ) ( ON ?auto_19099 ?auto_19102 ) ( not ( = ?auto_19099 ?auto_19102 ) ) ( not ( = ?auto_19100 ?auto_19102 ) ) ( not ( = ?auto_19101 ?auto_19102 ) ) ( not ( = ?auto_19103 ?auto_19104 ) ) ( not ( = ?auto_19103 ?auto_19101 ) ) ( not ( = ?auto_19103 ?auto_19100 ) ) ( not ( = ?auto_19104 ?auto_19101 ) ) ( not ( = ?auto_19104 ?auto_19100 ) ) ( not ( = ?auto_19099 ?auto_19103 ) ) ( not ( = ?auto_19099 ?auto_19104 ) ) ( not ( = ?auto_19102 ?auto_19103 ) ) ( not ( = ?auto_19102 ?auto_19104 ) ) ( ON ?auto_19100 ?auto_19099 ) ( ON-TABLE ?auto_19102 ) ( ON ?auto_19101 ?auto_19100 ) ( ON ?auto_19104 ?auto_19101 ) ( ON ?auto_19103 ?auto_19104 ) ( CLEAR ?auto_19103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19102 ?auto_19099 ?auto_19100 ?auto_19101 ?auto_19104 )
      ( MAKE-2PILE ?auto_19099 ?auto_19100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19120 - BLOCK
      ?auto_19121 - BLOCK
    )
    :vars
    (
      ?auto_19122 - BLOCK
      ?auto_19124 - BLOCK
      ?auto_19123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19122 ?auto_19121 ) ( ON-TABLE ?auto_19120 ) ( ON ?auto_19121 ?auto_19120 ) ( not ( = ?auto_19120 ?auto_19121 ) ) ( not ( = ?auto_19120 ?auto_19122 ) ) ( not ( = ?auto_19121 ?auto_19122 ) ) ( not ( = ?auto_19120 ?auto_19124 ) ) ( not ( = ?auto_19120 ?auto_19123 ) ) ( not ( = ?auto_19121 ?auto_19124 ) ) ( not ( = ?auto_19121 ?auto_19123 ) ) ( not ( = ?auto_19122 ?auto_19124 ) ) ( not ( = ?auto_19122 ?auto_19123 ) ) ( not ( = ?auto_19124 ?auto_19123 ) ) ( ON ?auto_19124 ?auto_19122 ) ( CLEAR ?auto_19124 ) ( HOLDING ?auto_19123 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19123 )
      ( MAKE-2PILE ?auto_19120 ?auto_19121 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19167 - BLOCK
      ?auto_19168 - BLOCK
      ?auto_19169 - BLOCK
    )
    :vars
    (
      ?auto_19170 - BLOCK
      ?auto_19171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19167 ) ( not ( = ?auto_19167 ?auto_19168 ) ) ( not ( = ?auto_19167 ?auto_19169 ) ) ( not ( = ?auto_19168 ?auto_19169 ) ) ( ON ?auto_19169 ?auto_19170 ) ( not ( = ?auto_19167 ?auto_19170 ) ) ( not ( = ?auto_19168 ?auto_19170 ) ) ( not ( = ?auto_19169 ?auto_19170 ) ) ( CLEAR ?auto_19167 ) ( ON ?auto_19168 ?auto_19169 ) ( CLEAR ?auto_19168 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19171 ) ( ON ?auto_19170 ?auto_19171 ) ( not ( = ?auto_19171 ?auto_19170 ) ) ( not ( = ?auto_19171 ?auto_19169 ) ) ( not ( = ?auto_19171 ?auto_19168 ) ) ( not ( = ?auto_19167 ?auto_19171 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19171 ?auto_19170 ?auto_19169 )
      ( MAKE-3PILE ?auto_19167 ?auto_19168 ?auto_19169 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19172 - BLOCK
      ?auto_19173 - BLOCK
      ?auto_19174 - BLOCK
    )
    :vars
    (
      ?auto_19175 - BLOCK
      ?auto_19176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19172 ?auto_19173 ) ) ( not ( = ?auto_19172 ?auto_19174 ) ) ( not ( = ?auto_19173 ?auto_19174 ) ) ( ON ?auto_19174 ?auto_19175 ) ( not ( = ?auto_19172 ?auto_19175 ) ) ( not ( = ?auto_19173 ?auto_19175 ) ) ( not ( = ?auto_19174 ?auto_19175 ) ) ( ON ?auto_19173 ?auto_19174 ) ( CLEAR ?auto_19173 ) ( ON-TABLE ?auto_19176 ) ( ON ?auto_19175 ?auto_19176 ) ( not ( = ?auto_19176 ?auto_19175 ) ) ( not ( = ?auto_19176 ?auto_19174 ) ) ( not ( = ?auto_19176 ?auto_19173 ) ) ( not ( = ?auto_19172 ?auto_19176 ) ) ( HOLDING ?auto_19172 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19172 )
      ( MAKE-3PILE ?auto_19172 ?auto_19173 ?auto_19174 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19177 - BLOCK
      ?auto_19178 - BLOCK
      ?auto_19179 - BLOCK
    )
    :vars
    (
      ?auto_19180 - BLOCK
      ?auto_19181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19177 ?auto_19178 ) ) ( not ( = ?auto_19177 ?auto_19179 ) ) ( not ( = ?auto_19178 ?auto_19179 ) ) ( ON ?auto_19179 ?auto_19180 ) ( not ( = ?auto_19177 ?auto_19180 ) ) ( not ( = ?auto_19178 ?auto_19180 ) ) ( not ( = ?auto_19179 ?auto_19180 ) ) ( ON ?auto_19178 ?auto_19179 ) ( ON-TABLE ?auto_19181 ) ( ON ?auto_19180 ?auto_19181 ) ( not ( = ?auto_19181 ?auto_19180 ) ) ( not ( = ?auto_19181 ?auto_19179 ) ) ( not ( = ?auto_19181 ?auto_19178 ) ) ( not ( = ?auto_19177 ?auto_19181 ) ) ( ON ?auto_19177 ?auto_19178 ) ( CLEAR ?auto_19177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19181 ?auto_19180 ?auto_19179 ?auto_19178 )
      ( MAKE-3PILE ?auto_19177 ?auto_19178 ?auto_19179 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19185 - BLOCK
      ?auto_19186 - BLOCK
      ?auto_19187 - BLOCK
    )
    :vars
    (
      ?auto_19189 - BLOCK
      ?auto_19188 - BLOCK
      ?auto_19190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19185 ?auto_19186 ) ) ( not ( = ?auto_19185 ?auto_19187 ) ) ( not ( = ?auto_19186 ?auto_19187 ) ) ( ON ?auto_19187 ?auto_19189 ) ( not ( = ?auto_19185 ?auto_19189 ) ) ( not ( = ?auto_19186 ?auto_19189 ) ) ( not ( = ?auto_19187 ?auto_19189 ) ) ( ON ?auto_19186 ?auto_19187 ) ( CLEAR ?auto_19186 ) ( ON-TABLE ?auto_19188 ) ( ON ?auto_19189 ?auto_19188 ) ( not ( = ?auto_19188 ?auto_19189 ) ) ( not ( = ?auto_19188 ?auto_19187 ) ) ( not ( = ?auto_19188 ?auto_19186 ) ) ( not ( = ?auto_19185 ?auto_19188 ) ) ( ON ?auto_19185 ?auto_19190 ) ( CLEAR ?auto_19185 ) ( HAND-EMPTY ) ( not ( = ?auto_19185 ?auto_19190 ) ) ( not ( = ?auto_19186 ?auto_19190 ) ) ( not ( = ?auto_19187 ?auto_19190 ) ) ( not ( = ?auto_19189 ?auto_19190 ) ) ( not ( = ?auto_19188 ?auto_19190 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19185 ?auto_19190 )
      ( MAKE-3PILE ?auto_19185 ?auto_19186 ?auto_19187 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19191 - BLOCK
      ?auto_19192 - BLOCK
      ?auto_19193 - BLOCK
    )
    :vars
    (
      ?auto_19194 - BLOCK
      ?auto_19195 - BLOCK
      ?auto_19196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19191 ?auto_19192 ) ) ( not ( = ?auto_19191 ?auto_19193 ) ) ( not ( = ?auto_19192 ?auto_19193 ) ) ( ON ?auto_19193 ?auto_19194 ) ( not ( = ?auto_19191 ?auto_19194 ) ) ( not ( = ?auto_19192 ?auto_19194 ) ) ( not ( = ?auto_19193 ?auto_19194 ) ) ( ON-TABLE ?auto_19195 ) ( ON ?auto_19194 ?auto_19195 ) ( not ( = ?auto_19195 ?auto_19194 ) ) ( not ( = ?auto_19195 ?auto_19193 ) ) ( not ( = ?auto_19195 ?auto_19192 ) ) ( not ( = ?auto_19191 ?auto_19195 ) ) ( ON ?auto_19191 ?auto_19196 ) ( CLEAR ?auto_19191 ) ( not ( = ?auto_19191 ?auto_19196 ) ) ( not ( = ?auto_19192 ?auto_19196 ) ) ( not ( = ?auto_19193 ?auto_19196 ) ) ( not ( = ?auto_19194 ?auto_19196 ) ) ( not ( = ?auto_19195 ?auto_19196 ) ) ( HOLDING ?auto_19192 ) ( CLEAR ?auto_19193 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19195 ?auto_19194 ?auto_19193 ?auto_19192 )
      ( MAKE-3PILE ?auto_19191 ?auto_19192 ?auto_19193 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19197 - BLOCK
      ?auto_19198 - BLOCK
      ?auto_19199 - BLOCK
    )
    :vars
    (
      ?auto_19200 - BLOCK
      ?auto_19201 - BLOCK
      ?auto_19202 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19197 ?auto_19198 ) ) ( not ( = ?auto_19197 ?auto_19199 ) ) ( not ( = ?auto_19198 ?auto_19199 ) ) ( ON ?auto_19199 ?auto_19200 ) ( not ( = ?auto_19197 ?auto_19200 ) ) ( not ( = ?auto_19198 ?auto_19200 ) ) ( not ( = ?auto_19199 ?auto_19200 ) ) ( ON-TABLE ?auto_19201 ) ( ON ?auto_19200 ?auto_19201 ) ( not ( = ?auto_19201 ?auto_19200 ) ) ( not ( = ?auto_19201 ?auto_19199 ) ) ( not ( = ?auto_19201 ?auto_19198 ) ) ( not ( = ?auto_19197 ?auto_19201 ) ) ( ON ?auto_19197 ?auto_19202 ) ( not ( = ?auto_19197 ?auto_19202 ) ) ( not ( = ?auto_19198 ?auto_19202 ) ) ( not ( = ?auto_19199 ?auto_19202 ) ) ( not ( = ?auto_19200 ?auto_19202 ) ) ( not ( = ?auto_19201 ?auto_19202 ) ) ( CLEAR ?auto_19199 ) ( ON ?auto_19198 ?auto_19197 ) ( CLEAR ?auto_19198 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19202 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19202 ?auto_19197 )
      ( MAKE-3PILE ?auto_19197 ?auto_19198 ?auto_19199 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19203 - BLOCK
      ?auto_19204 - BLOCK
      ?auto_19205 - BLOCK
    )
    :vars
    (
      ?auto_19207 - BLOCK
      ?auto_19206 - BLOCK
      ?auto_19208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19203 ?auto_19204 ) ) ( not ( = ?auto_19203 ?auto_19205 ) ) ( not ( = ?auto_19204 ?auto_19205 ) ) ( not ( = ?auto_19203 ?auto_19207 ) ) ( not ( = ?auto_19204 ?auto_19207 ) ) ( not ( = ?auto_19205 ?auto_19207 ) ) ( ON-TABLE ?auto_19206 ) ( ON ?auto_19207 ?auto_19206 ) ( not ( = ?auto_19206 ?auto_19207 ) ) ( not ( = ?auto_19206 ?auto_19205 ) ) ( not ( = ?auto_19206 ?auto_19204 ) ) ( not ( = ?auto_19203 ?auto_19206 ) ) ( ON ?auto_19203 ?auto_19208 ) ( not ( = ?auto_19203 ?auto_19208 ) ) ( not ( = ?auto_19204 ?auto_19208 ) ) ( not ( = ?auto_19205 ?auto_19208 ) ) ( not ( = ?auto_19207 ?auto_19208 ) ) ( not ( = ?auto_19206 ?auto_19208 ) ) ( ON ?auto_19204 ?auto_19203 ) ( CLEAR ?auto_19204 ) ( ON-TABLE ?auto_19208 ) ( HOLDING ?auto_19205 ) ( CLEAR ?auto_19207 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19206 ?auto_19207 ?auto_19205 )
      ( MAKE-3PILE ?auto_19203 ?auto_19204 ?auto_19205 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19209 - BLOCK
      ?auto_19210 - BLOCK
      ?auto_19211 - BLOCK
    )
    :vars
    (
      ?auto_19212 - BLOCK
      ?auto_19213 - BLOCK
      ?auto_19214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19209 ?auto_19210 ) ) ( not ( = ?auto_19209 ?auto_19211 ) ) ( not ( = ?auto_19210 ?auto_19211 ) ) ( not ( = ?auto_19209 ?auto_19212 ) ) ( not ( = ?auto_19210 ?auto_19212 ) ) ( not ( = ?auto_19211 ?auto_19212 ) ) ( ON-TABLE ?auto_19213 ) ( ON ?auto_19212 ?auto_19213 ) ( not ( = ?auto_19213 ?auto_19212 ) ) ( not ( = ?auto_19213 ?auto_19211 ) ) ( not ( = ?auto_19213 ?auto_19210 ) ) ( not ( = ?auto_19209 ?auto_19213 ) ) ( ON ?auto_19209 ?auto_19214 ) ( not ( = ?auto_19209 ?auto_19214 ) ) ( not ( = ?auto_19210 ?auto_19214 ) ) ( not ( = ?auto_19211 ?auto_19214 ) ) ( not ( = ?auto_19212 ?auto_19214 ) ) ( not ( = ?auto_19213 ?auto_19214 ) ) ( ON ?auto_19210 ?auto_19209 ) ( ON-TABLE ?auto_19214 ) ( CLEAR ?auto_19212 ) ( ON ?auto_19211 ?auto_19210 ) ( CLEAR ?auto_19211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19214 ?auto_19209 ?auto_19210 )
      ( MAKE-3PILE ?auto_19209 ?auto_19210 ?auto_19211 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19215 - BLOCK
      ?auto_19216 - BLOCK
      ?auto_19217 - BLOCK
    )
    :vars
    (
      ?auto_19219 - BLOCK
      ?auto_19220 - BLOCK
      ?auto_19218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19215 ?auto_19216 ) ) ( not ( = ?auto_19215 ?auto_19217 ) ) ( not ( = ?auto_19216 ?auto_19217 ) ) ( not ( = ?auto_19215 ?auto_19219 ) ) ( not ( = ?auto_19216 ?auto_19219 ) ) ( not ( = ?auto_19217 ?auto_19219 ) ) ( ON-TABLE ?auto_19220 ) ( not ( = ?auto_19220 ?auto_19219 ) ) ( not ( = ?auto_19220 ?auto_19217 ) ) ( not ( = ?auto_19220 ?auto_19216 ) ) ( not ( = ?auto_19215 ?auto_19220 ) ) ( ON ?auto_19215 ?auto_19218 ) ( not ( = ?auto_19215 ?auto_19218 ) ) ( not ( = ?auto_19216 ?auto_19218 ) ) ( not ( = ?auto_19217 ?auto_19218 ) ) ( not ( = ?auto_19219 ?auto_19218 ) ) ( not ( = ?auto_19220 ?auto_19218 ) ) ( ON ?auto_19216 ?auto_19215 ) ( ON-TABLE ?auto_19218 ) ( ON ?auto_19217 ?auto_19216 ) ( CLEAR ?auto_19217 ) ( HOLDING ?auto_19219 ) ( CLEAR ?auto_19220 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19220 ?auto_19219 )
      ( MAKE-3PILE ?auto_19215 ?auto_19216 ?auto_19217 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19221 - BLOCK
      ?auto_19222 - BLOCK
      ?auto_19223 - BLOCK
    )
    :vars
    (
      ?auto_19225 - BLOCK
      ?auto_19226 - BLOCK
      ?auto_19224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19221 ?auto_19222 ) ) ( not ( = ?auto_19221 ?auto_19223 ) ) ( not ( = ?auto_19222 ?auto_19223 ) ) ( not ( = ?auto_19221 ?auto_19225 ) ) ( not ( = ?auto_19222 ?auto_19225 ) ) ( not ( = ?auto_19223 ?auto_19225 ) ) ( ON-TABLE ?auto_19226 ) ( not ( = ?auto_19226 ?auto_19225 ) ) ( not ( = ?auto_19226 ?auto_19223 ) ) ( not ( = ?auto_19226 ?auto_19222 ) ) ( not ( = ?auto_19221 ?auto_19226 ) ) ( ON ?auto_19221 ?auto_19224 ) ( not ( = ?auto_19221 ?auto_19224 ) ) ( not ( = ?auto_19222 ?auto_19224 ) ) ( not ( = ?auto_19223 ?auto_19224 ) ) ( not ( = ?auto_19225 ?auto_19224 ) ) ( not ( = ?auto_19226 ?auto_19224 ) ) ( ON ?auto_19222 ?auto_19221 ) ( ON-TABLE ?auto_19224 ) ( ON ?auto_19223 ?auto_19222 ) ( CLEAR ?auto_19226 ) ( ON ?auto_19225 ?auto_19223 ) ( CLEAR ?auto_19225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19224 ?auto_19221 ?auto_19222 ?auto_19223 )
      ( MAKE-3PILE ?auto_19221 ?auto_19222 ?auto_19223 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19227 - BLOCK
      ?auto_19228 - BLOCK
      ?auto_19229 - BLOCK
    )
    :vars
    (
      ?auto_19232 - BLOCK
      ?auto_19230 - BLOCK
      ?auto_19231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19227 ?auto_19228 ) ) ( not ( = ?auto_19227 ?auto_19229 ) ) ( not ( = ?auto_19228 ?auto_19229 ) ) ( not ( = ?auto_19227 ?auto_19232 ) ) ( not ( = ?auto_19228 ?auto_19232 ) ) ( not ( = ?auto_19229 ?auto_19232 ) ) ( not ( = ?auto_19230 ?auto_19232 ) ) ( not ( = ?auto_19230 ?auto_19229 ) ) ( not ( = ?auto_19230 ?auto_19228 ) ) ( not ( = ?auto_19227 ?auto_19230 ) ) ( ON ?auto_19227 ?auto_19231 ) ( not ( = ?auto_19227 ?auto_19231 ) ) ( not ( = ?auto_19228 ?auto_19231 ) ) ( not ( = ?auto_19229 ?auto_19231 ) ) ( not ( = ?auto_19232 ?auto_19231 ) ) ( not ( = ?auto_19230 ?auto_19231 ) ) ( ON ?auto_19228 ?auto_19227 ) ( ON-TABLE ?auto_19231 ) ( ON ?auto_19229 ?auto_19228 ) ( ON ?auto_19232 ?auto_19229 ) ( CLEAR ?auto_19232 ) ( HOLDING ?auto_19230 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19230 )
      ( MAKE-3PILE ?auto_19227 ?auto_19228 ?auto_19229 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19233 - BLOCK
      ?auto_19234 - BLOCK
      ?auto_19235 - BLOCK
    )
    :vars
    (
      ?auto_19238 - BLOCK
      ?auto_19237 - BLOCK
      ?auto_19236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19233 ?auto_19234 ) ) ( not ( = ?auto_19233 ?auto_19235 ) ) ( not ( = ?auto_19234 ?auto_19235 ) ) ( not ( = ?auto_19233 ?auto_19238 ) ) ( not ( = ?auto_19234 ?auto_19238 ) ) ( not ( = ?auto_19235 ?auto_19238 ) ) ( not ( = ?auto_19237 ?auto_19238 ) ) ( not ( = ?auto_19237 ?auto_19235 ) ) ( not ( = ?auto_19237 ?auto_19234 ) ) ( not ( = ?auto_19233 ?auto_19237 ) ) ( ON ?auto_19233 ?auto_19236 ) ( not ( = ?auto_19233 ?auto_19236 ) ) ( not ( = ?auto_19234 ?auto_19236 ) ) ( not ( = ?auto_19235 ?auto_19236 ) ) ( not ( = ?auto_19238 ?auto_19236 ) ) ( not ( = ?auto_19237 ?auto_19236 ) ) ( ON ?auto_19234 ?auto_19233 ) ( ON-TABLE ?auto_19236 ) ( ON ?auto_19235 ?auto_19234 ) ( ON ?auto_19238 ?auto_19235 ) ( ON ?auto_19237 ?auto_19238 ) ( CLEAR ?auto_19237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19236 ?auto_19233 ?auto_19234 ?auto_19235 ?auto_19238 )
      ( MAKE-3PILE ?auto_19233 ?auto_19234 ?auto_19235 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19250 - BLOCK
    )
    :vars
    (
      ?auto_19251 - BLOCK
      ?auto_19253 - BLOCK
      ?auto_19252 - BLOCK
      ?auto_19254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19251 ?auto_19250 ) ( ON-TABLE ?auto_19250 ) ( not ( = ?auto_19250 ?auto_19251 ) ) ( not ( = ?auto_19250 ?auto_19253 ) ) ( not ( = ?auto_19250 ?auto_19252 ) ) ( not ( = ?auto_19251 ?auto_19253 ) ) ( not ( = ?auto_19251 ?auto_19252 ) ) ( not ( = ?auto_19253 ?auto_19252 ) ) ( ON ?auto_19253 ?auto_19251 ) ( CLEAR ?auto_19253 ) ( HOLDING ?auto_19252 ) ( CLEAR ?auto_19254 ) ( ON-TABLE ?auto_19254 ) ( not ( = ?auto_19254 ?auto_19252 ) ) ( not ( = ?auto_19250 ?auto_19254 ) ) ( not ( = ?auto_19251 ?auto_19254 ) ) ( not ( = ?auto_19253 ?auto_19254 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19254 ?auto_19252 )
      ( MAKE-1PILE ?auto_19250 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19255 - BLOCK
    )
    :vars
    (
      ?auto_19259 - BLOCK
      ?auto_19258 - BLOCK
      ?auto_19257 - BLOCK
      ?auto_19256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19259 ?auto_19255 ) ( ON-TABLE ?auto_19255 ) ( not ( = ?auto_19255 ?auto_19259 ) ) ( not ( = ?auto_19255 ?auto_19258 ) ) ( not ( = ?auto_19255 ?auto_19257 ) ) ( not ( = ?auto_19259 ?auto_19258 ) ) ( not ( = ?auto_19259 ?auto_19257 ) ) ( not ( = ?auto_19258 ?auto_19257 ) ) ( ON ?auto_19258 ?auto_19259 ) ( CLEAR ?auto_19256 ) ( ON-TABLE ?auto_19256 ) ( not ( = ?auto_19256 ?auto_19257 ) ) ( not ( = ?auto_19255 ?auto_19256 ) ) ( not ( = ?auto_19259 ?auto_19256 ) ) ( not ( = ?auto_19258 ?auto_19256 ) ) ( ON ?auto_19257 ?auto_19258 ) ( CLEAR ?auto_19257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19255 ?auto_19259 ?auto_19258 )
      ( MAKE-1PILE ?auto_19255 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19260 - BLOCK
    )
    :vars
    (
      ?auto_19264 - BLOCK
      ?auto_19262 - BLOCK
      ?auto_19263 - BLOCK
      ?auto_19261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19264 ?auto_19260 ) ( ON-TABLE ?auto_19260 ) ( not ( = ?auto_19260 ?auto_19264 ) ) ( not ( = ?auto_19260 ?auto_19262 ) ) ( not ( = ?auto_19260 ?auto_19263 ) ) ( not ( = ?auto_19264 ?auto_19262 ) ) ( not ( = ?auto_19264 ?auto_19263 ) ) ( not ( = ?auto_19262 ?auto_19263 ) ) ( ON ?auto_19262 ?auto_19264 ) ( not ( = ?auto_19261 ?auto_19263 ) ) ( not ( = ?auto_19260 ?auto_19261 ) ) ( not ( = ?auto_19264 ?auto_19261 ) ) ( not ( = ?auto_19262 ?auto_19261 ) ) ( ON ?auto_19263 ?auto_19262 ) ( CLEAR ?auto_19263 ) ( HOLDING ?auto_19261 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19261 )
      ( MAKE-1PILE ?auto_19260 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19271 - BLOCK
    )
    :vars
    (
      ?auto_19274 - BLOCK
      ?auto_19275 - BLOCK
      ?auto_19273 - BLOCK
      ?auto_19272 - BLOCK
      ?auto_19276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19274 ?auto_19271 ) ( ON-TABLE ?auto_19271 ) ( not ( = ?auto_19271 ?auto_19274 ) ) ( not ( = ?auto_19271 ?auto_19275 ) ) ( not ( = ?auto_19271 ?auto_19273 ) ) ( not ( = ?auto_19274 ?auto_19275 ) ) ( not ( = ?auto_19274 ?auto_19273 ) ) ( not ( = ?auto_19275 ?auto_19273 ) ) ( ON ?auto_19275 ?auto_19274 ) ( not ( = ?auto_19272 ?auto_19273 ) ) ( not ( = ?auto_19271 ?auto_19272 ) ) ( not ( = ?auto_19274 ?auto_19272 ) ) ( not ( = ?auto_19275 ?auto_19272 ) ) ( ON ?auto_19273 ?auto_19275 ) ( CLEAR ?auto_19273 ) ( ON ?auto_19272 ?auto_19276 ) ( CLEAR ?auto_19272 ) ( HAND-EMPTY ) ( not ( = ?auto_19271 ?auto_19276 ) ) ( not ( = ?auto_19274 ?auto_19276 ) ) ( not ( = ?auto_19275 ?auto_19276 ) ) ( not ( = ?auto_19273 ?auto_19276 ) ) ( not ( = ?auto_19272 ?auto_19276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19272 ?auto_19276 )
      ( MAKE-1PILE ?auto_19271 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19277 - BLOCK
    )
    :vars
    (
      ?auto_19280 - BLOCK
      ?auto_19279 - BLOCK
      ?auto_19281 - BLOCK
      ?auto_19278 - BLOCK
      ?auto_19282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19280 ?auto_19277 ) ( ON-TABLE ?auto_19277 ) ( not ( = ?auto_19277 ?auto_19280 ) ) ( not ( = ?auto_19277 ?auto_19279 ) ) ( not ( = ?auto_19277 ?auto_19281 ) ) ( not ( = ?auto_19280 ?auto_19279 ) ) ( not ( = ?auto_19280 ?auto_19281 ) ) ( not ( = ?auto_19279 ?auto_19281 ) ) ( ON ?auto_19279 ?auto_19280 ) ( not ( = ?auto_19278 ?auto_19281 ) ) ( not ( = ?auto_19277 ?auto_19278 ) ) ( not ( = ?auto_19280 ?auto_19278 ) ) ( not ( = ?auto_19279 ?auto_19278 ) ) ( ON ?auto_19278 ?auto_19282 ) ( CLEAR ?auto_19278 ) ( not ( = ?auto_19277 ?auto_19282 ) ) ( not ( = ?auto_19280 ?auto_19282 ) ) ( not ( = ?auto_19279 ?auto_19282 ) ) ( not ( = ?auto_19281 ?auto_19282 ) ) ( not ( = ?auto_19278 ?auto_19282 ) ) ( HOLDING ?auto_19281 ) ( CLEAR ?auto_19279 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19277 ?auto_19280 ?auto_19279 ?auto_19281 )
      ( MAKE-1PILE ?auto_19277 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19311 - BLOCK
      ?auto_19312 - BLOCK
      ?auto_19313 - BLOCK
      ?auto_19314 - BLOCK
    )
    :vars
    (
      ?auto_19315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19311 ) ( ON ?auto_19312 ?auto_19311 ) ( not ( = ?auto_19311 ?auto_19312 ) ) ( not ( = ?auto_19311 ?auto_19313 ) ) ( not ( = ?auto_19311 ?auto_19314 ) ) ( not ( = ?auto_19312 ?auto_19313 ) ) ( not ( = ?auto_19312 ?auto_19314 ) ) ( not ( = ?auto_19313 ?auto_19314 ) ) ( ON ?auto_19314 ?auto_19315 ) ( not ( = ?auto_19311 ?auto_19315 ) ) ( not ( = ?auto_19312 ?auto_19315 ) ) ( not ( = ?auto_19313 ?auto_19315 ) ) ( not ( = ?auto_19314 ?auto_19315 ) ) ( CLEAR ?auto_19312 ) ( ON ?auto_19313 ?auto_19314 ) ( CLEAR ?auto_19313 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19315 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19315 ?auto_19314 )
      ( MAKE-4PILE ?auto_19311 ?auto_19312 ?auto_19313 ?auto_19314 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19316 - BLOCK
      ?auto_19317 - BLOCK
      ?auto_19318 - BLOCK
      ?auto_19319 - BLOCK
    )
    :vars
    (
      ?auto_19320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19316 ) ( not ( = ?auto_19316 ?auto_19317 ) ) ( not ( = ?auto_19316 ?auto_19318 ) ) ( not ( = ?auto_19316 ?auto_19319 ) ) ( not ( = ?auto_19317 ?auto_19318 ) ) ( not ( = ?auto_19317 ?auto_19319 ) ) ( not ( = ?auto_19318 ?auto_19319 ) ) ( ON ?auto_19319 ?auto_19320 ) ( not ( = ?auto_19316 ?auto_19320 ) ) ( not ( = ?auto_19317 ?auto_19320 ) ) ( not ( = ?auto_19318 ?auto_19320 ) ) ( not ( = ?auto_19319 ?auto_19320 ) ) ( ON ?auto_19318 ?auto_19319 ) ( CLEAR ?auto_19318 ) ( ON-TABLE ?auto_19320 ) ( HOLDING ?auto_19317 ) ( CLEAR ?auto_19316 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19316 ?auto_19317 )
      ( MAKE-4PILE ?auto_19316 ?auto_19317 ?auto_19318 ?auto_19319 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19321 - BLOCK
      ?auto_19322 - BLOCK
      ?auto_19323 - BLOCK
      ?auto_19324 - BLOCK
    )
    :vars
    (
      ?auto_19325 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19321 ) ( not ( = ?auto_19321 ?auto_19322 ) ) ( not ( = ?auto_19321 ?auto_19323 ) ) ( not ( = ?auto_19321 ?auto_19324 ) ) ( not ( = ?auto_19322 ?auto_19323 ) ) ( not ( = ?auto_19322 ?auto_19324 ) ) ( not ( = ?auto_19323 ?auto_19324 ) ) ( ON ?auto_19324 ?auto_19325 ) ( not ( = ?auto_19321 ?auto_19325 ) ) ( not ( = ?auto_19322 ?auto_19325 ) ) ( not ( = ?auto_19323 ?auto_19325 ) ) ( not ( = ?auto_19324 ?auto_19325 ) ) ( ON ?auto_19323 ?auto_19324 ) ( ON-TABLE ?auto_19325 ) ( CLEAR ?auto_19321 ) ( ON ?auto_19322 ?auto_19323 ) ( CLEAR ?auto_19322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19325 ?auto_19324 ?auto_19323 )
      ( MAKE-4PILE ?auto_19321 ?auto_19322 ?auto_19323 ?auto_19324 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19326 - BLOCK
      ?auto_19327 - BLOCK
      ?auto_19328 - BLOCK
      ?auto_19329 - BLOCK
    )
    :vars
    (
      ?auto_19330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19326 ?auto_19327 ) ) ( not ( = ?auto_19326 ?auto_19328 ) ) ( not ( = ?auto_19326 ?auto_19329 ) ) ( not ( = ?auto_19327 ?auto_19328 ) ) ( not ( = ?auto_19327 ?auto_19329 ) ) ( not ( = ?auto_19328 ?auto_19329 ) ) ( ON ?auto_19329 ?auto_19330 ) ( not ( = ?auto_19326 ?auto_19330 ) ) ( not ( = ?auto_19327 ?auto_19330 ) ) ( not ( = ?auto_19328 ?auto_19330 ) ) ( not ( = ?auto_19329 ?auto_19330 ) ) ( ON ?auto_19328 ?auto_19329 ) ( ON-TABLE ?auto_19330 ) ( ON ?auto_19327 ?auto_19328 ) ( CLEAR ?auto_19327 ) ( HOLDING ?auto_19326 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19326 )
      ( MAKE-4PILE ?auto_19326 ?auto_19327 ?auto_19328 ?auto_19329 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19331 - BLOCK
      ?auto_19332 - BLOCK
      ?auto_19333 - BLOCK
      ?auto_19334 - BLOCK
    )
    :vars
    (
      ?auto_19335 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19331 ?auto_19332 ) ) ( not ( = ?auto_19331 ?auto_19333 ) ) ( not ( = ?auto_19331 ?auto_19334 ) ) ( not ( = ?auto_19332 ?auto_19333 ) ) ( not ( = ?auto_19332 ?auto_19334 ) ) ( not ( = ?auto_19333 ?auto_19334 ) ) ( ON ?auto_19334 ?auto_19335 ) ( not ( = ?auto_19331 ?auto_19335 ) ) ( not ( = ?auto_19332 ?auto_19335 ) ) ( not ( = ?auto_19333 ?auto_19335 ) ) ( not ( = ?auto_19334 ?auto_19335 ) ) ( ON ?auto_19333 ?auto_19334 ) ( ON-TABLE ?auto_19335 ) ( ON ?auto_19332 ?auto_19333 ) ( ON ?auto_19331 ?auto_19332 ) ( CLEAR ?auto_19331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19335 ?auto_19334 ?auto_19333 ?auto_19332 )
      ( MAKE-4PILE ?auto_19331 ?auto_19332 ?auto_19333 ?auto_19334 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19340 - BLOCK
      ?auto_19341 - BLOCK
      ?auto_19342 - BLOCK
      ?auto_19343 - BLOCK
    )
    :vars
    (
      ?auto_19344 - BLOCK
      ?auto_19345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19340 ?auto_19341 ) ) ( not ( = ?auto_19340 ?auto_19342 ) ) ( not ( = ?auto_19340 ?auto_19343 ) ) ( not ( = ?auto_19341 ?auto_19342 ) ) ( not ( = ?auto_19341 ?auto_19343 ) ) ( not ( = ?auto_19342 ?auto_19343 ) ) ( ON ?auto_19343 ?auto_19344 ) ( not ( = ?auto_19340 ?auto_19344 ) ) ( not ( = ?auto_19341 ?auto_19344 ) ) ( not ( = ?auto_19342 ?auto_19344 ) ) ( not ( = ?auto_19343 ?auto_19344 ) ) ( ON ?auto_19342 ?auto_19343 ) ( ON-TABLE ?auto_19344 ) ( ON ?auto_19341 ?auto_19342 ) ( CLEAR ?auto_19341 ) ( ON ?auto_19340 ?auto_19345 ) ( CLEAR ?auto_19340 ) ( HAND-EMPTY ) ( not ( = ?auto_19340 ?auto_19345 ) ) ( not ( = ?auto_19341 ?auto_19345 ) ) ( not ( = ?auto_19342 ?auto_19345 ) ) ( not ( = ?auto_19343 ?auto_19345 ) ) ( not ( = ?auto_19344 ?auto_19345 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19340 ?auto_19345 )
      ( MAKE-4PILE ?auto_19340 ?auto_19341 ?auto_19342 ?auto_19343 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19346 - BLOCK
      ?auto_19347 - BLOCK
      ?auto_19348 - BLOCK
      ?auto_19349 - BLOCK
    )
    :vars
    (
      ?auto_19350 - BLOCK
      ?auto_19351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19346 ?auto_19347 ) ) ( not ( = ?auto_19346 ?auto_19348 ) ) ( not ( = ?auto_19346 ?auto_19349 ) ) ( not ( = ?auto_19347 ?auto_19348 ) ) ( not ( = ?auto_19347 ?auto_19349 ) ) ( not ( = ?auto_19348 ?auto_19349 ) ) ( ON ?auto_19349 ?auto_19350 ) ( not ( = ?auto_19346 ?auto_19350 ) ) ( not ( = ?auto_19347 ?auto_19350 ) ) ( not ( = ?auto_19348 ?auto_19350 ) ) ( not ( = ?auto_19349 ?auto_19350 ) ) ( ON ?auto_19348 ?auto_19349 ) ( ON-TABLE ?auto_19350 ) ( ON ?auto_19346 ?auto_19351 ) ( CLEAR ?auto_19346 ) ( not ( = ?auto_19346 ?auto_19351 ) ) ( not ( = ?auto_19347 ?auto_19351 ) ) ( not ( = ?auto_19348 ?auto_19351 ) ) ( not ( = ?auto_19349 ?auto_19351 ) ) ( not ( = ?auto_19350 ?auto_19351 ) ) ( HOLDING ?auto_19347 ) ( CLEAR ?auto_19348 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19350 ?auto_19349 ?auto_19348 ?auto_19347 )
      ( MAKE-4PILE ?auto_19346 ?auto_19347 ?auto_19348 ?auto_19349 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19352 - BLOCK
      ?auto_19353 - BLOCK
      ?auto_19354 - BLOCK
      ?auto_19355 - BLOCK
    )
    :vars
    (
      ?auto_19357 - BLOCK
      ?auto_19356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19352 ?auto_19353 ) ) ( not ( = ?auto_19352 ?auto_19354 ) ) ( not ( = ?auto_19352 ?auto_19355 ) ) ( not ( = ?auto_19353 ?auto_19354 ) ) ( not ( = ?auto_19353 ?auto_19355 ) ) ( not ( = ?auto_19354 ?auto_19355 ) ) ( ON ?auto_19355 ?auto_19357 ) ( not ( = ?auto_19352 ?auto_19357 ) ) ( not ( = ?auto_19353 ?auto_19357 ) ) ( not ( = ?auto_19354 ?auto_19357 ) ) ( not ( = ?auto_19355 ?auto_19357 ) ) ( ON ?auto_19354 ?auto_19355 ) ( ON-TABLE ?auto_19357 ) ( ON ?auto_19352 ?auto_19356 ) ( not ( = ?auto_19352 ?auto_19356 ) ) ( not ( = ?auto_19353 ?auto_19356 ) ) ( not ( = ?auto_19354 ?auto_19356 ) ) ( not ( = ?auto_19355 ?auto_19356 ) ) ( not ( = ?auto_19357 ?auto_19356 ) ) ( CLEAR ?auto_19354 ) ( ON ?auto_19353 ?auto_19352 ) ( CLEAR ?auto_19353 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19356 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19356 ?auto_19352 )
      ( MAKE-4PILE ?auto_19352 ?auto_19353 ?auto_19354 ?auto_19355 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19358 - BLOCK
      ?auto_19359 - BLOCK
      ?auto_19360 - BLOCK
      ?auto_19361 - BLOCK
    )
    :vars
    (
      ?auto_19363 - BLOCK
      ?auto_19362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19358 ?auto_19359 ) ) ( not ( = ?auto_19358 ?auto_19360 ) ) ( not ( = ?auto_19358 ?auto_19361 ) ) ( not ( = ?auto_19359 ?auto_19360 ) ) ( not ( = ?auto_19359 ?auto_19361 ) ) ( not ( = ?auto_19360 ?auto_19361 ) ) ( ON ?auto_19361 ?auto_19363 ) ( not ( = ?auto_19358 ?auto_19363 ) ) ( not ( = ?auto_19359 ?auto_19363 ) ) ( not ( = ?auto_19360 ?auto_19363 ) ) ( not ( = ?auto_19361 ?auto_19363 ) ) ( ON-TABLE ?auto_19363 ) ( ON ?auto_19358 ?auto_19362 ) ( not ( = ?auto_19358 ?auto_19362 ) ) ( not ( = ?auto_19359 ?auto_19362 ) ) ( not ( = ?auto_19360 ?auto_19362 ) ) ( not ( = ?auto_19361 ?auto_19362 ) ) ( not ( = ?auto_19363 ?auto_19362 ) ) ( ON ?auto_19359 ?auto_19358 ) ( CLEAR ?auto_19359 ) ( ON-TABLE ?auto_19362 ) ( HOLDING ?auto_19360 ) ( CLEAR ?auto_19361 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19363 ?auto_19361 ?auto_19360 )
      ( MAKE-4PILE ?auto_19358 ?auto_19359 ?auto_19360 ?auto_19361 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19364 - BLOCK
      ?auto_19365 - BLOCK
      ?auto_19366 - BLOCK
      ?auto_19367 - BLOCK
    )
    :vars
    (
      ?auto_19368 - BLOCK
      ?auto_19369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19364 ?auto_19365 ) ) ( not ( = ?auto_19364 ?auto_19366 ) ) ( not ( = ?auto_19364 ?auto_19367 ) ) ( not ( = ?auto_19365 ?auto_19366 ) ) ( not ( = ?auto_19365 ?auto_19367 ) ) ( not ( = ?auto_19366 ?auto_19367 ) ) ( ON ?auto_19367 ?auto_19368 ) ( not ( = ?auto_19364 ?auto_19368 ) ) ( not ( = ?auto_19365 ?auto_19368 ) ) ( not ( = ?auto_19366 ?auto_19368 ) ) ( not ( = ?auto_19367 ?auto_19368 ) ) ( ON-TABLE ?auto_19368 ) ( ON ?auto_19364 ?auto_19369 ) ( not ( = ?auto_19364 ?auto_19369 ) ) ( not ( = ?auto_19365 ?auto_19369 ) ) ( not ( = ?auto_19366 ?auto_19369 ) ) ( not ( = ?auto_19367 ?auto_19369 ) ) ( not ( = ?auto_19368 ?auto_19369 ) ) ( ON ?auto_19365 ?auto_19364 ) ( ON-TABLE ?auto_19369 ) ( CLEAR ?auto_19367 ) ( ON ?auto_19366 ?auto_19365 ) ( CLEAR ?auto_19366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19369 ?auto_19364 ?auto_19365 )
      ( MAKE-4PILE ?auto_19364 ?auto_19365 ?auto_19366 ?auto_19367 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19370 - BLOCK
      ?auto_19371 - BLOCK
      ?auto_19372 - BLOCK
      ?auto_19373 - BLOCK
    )
    :vars
    (
      ?auto_19374 - BLOCK
      ?auto_19375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19370 ?auto_19371 ) ) ( not ( = ?auto_19370 ?auto_19372 ) ) ( not ( = ?auto_19370 ?auto_19373 ) ) ( not ( = ?auto_19371 ?auto_19372 ) ) ( not ( = ?auto_19371 ?auto_19373 ) ) ( not ( = ?auto_19372 ?auto_19373 ) ) ( not ( = ?auto_19370 ?auto_19374 ) ) ( not ( = ?auto_19371 ?auto_19374 ) ) ( not ( = ?auto_19372 ?auto_19374 ) ) ( not ( = ?auto_19373 ?auto_19374 ) ) ( ON-TABLE ?auto_19374 ) ( ON ?auto_19370 ?auto_19375 ) ( not ( = ?auto_19370 ?auto_19375 ) ) ( not ( = ?auto_19371 ?auto_19375 ) ) ( not ( = ?auto_19372 ?auto_19375 ) ) ( not ( = ?auto_19373 ?auto_19375 ) ) ( not ( = ?auto_19374 ?auto_19375 ) ) ( ON ?auto_19371 ?auto_19370 ) ( ON-TABLE ?auto_19375 ) ( ON ?auto_19372 ?auto_19371 ) ( CLEAR ?auto_19372 ) ( HOLDING ?auto_19373 ) ( CLEAR ?auto_19374 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19374 ?auto_19373 )
      ( MAKE-4PILE ?auto_19370 ?auto_19371 ?auto_19372 ?auto_19373 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19376 - BLOCK
      ?auto_19377 - BLOCK
      ?auto_19378 - BLOCK
      ?auto_19379 - BLOCK
    )
    :vars
    (
      ?auto_19380 - BLOCK
      ?auto_19381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19376 ?auto_19377 ) ) ( not ( = ?auto_19376 ?auto_19378 ) ) ( not ( = ?auto_19376 ?auto_19379 ) ) ( not ( = ?auto_19377 ?auto_19378 ) ) ( not ( = ?auto_19377 ?auto_19379 ) ) ( not ( = ?auto_19378 ?auto_19379 ) ) ( not ( = ?auto_19376 ?auto_19380 ) ) ( not ( = ?auto_19377 ?auto_19380 ) ) ( not ( = ?auto_19378 ?auto_19380 ) ) ( not ( = ?auto_19379 ?auto_19380 ) ) ( ON-TABLE ?auto_19380 ) ( ON ?auto_19376 ?auto_19381 ) ( not ( = ?auto_19376 ?auto_19381 ) ) ( not ( = ?auto_19377 ?auto_19381 ) ) ( not ( = ?auto_19378 ?auto_19381 ) ) ( not ( = ?auto_19379 ?auto_19381 ) ) ( not ( = ?auto_19380 ?auto_19381 ) ) ( ON ?auto_19377 ?auto_19376 ) ( ON-TABLE ?auto_19381 ) ( ON ?auto_19378 ?auto_19377 ) ( CLEAR ?auto_19380 ) ( ON ?auto_19379 ?auto_19378 ) ( CLEAR ?auto_19379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19381 ?auto_19376 ?auto_19377 ?auto_19378 )
      ( MAKE-4PILE ?auto_19376 ?auto_19377 ?auto_19378 ?auto_19379 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19382 - BLOCK
      ?auto_19383 - BLOCK
      ?auto_19384 - BLOCK
      ?auto_19385 - BLOCK
    )
    :vars
    (
      ?auto_19386 - BLOCK
      ?auto_19387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19382 ?auto_19383 ) ) ( not ( = ?auto_19382 ?auto_19384 ) ) ( not ( = ?auto_19382 ?auto_19385 ) ) ( not ( = ?auto_19383 ?auto_19384 ) ) ( not ( = ?auto_19383 ?auto_19385 ) ) ( not ( = ?auto_19384 ?auto_19385 ) ) ( not ( = ?auto_19382 ?auto_19386 ) ) ( not ( = ?auto_19383 ?auto_19386 ) ) ( not ( = ?auto_19384 ?auto_19386 ) ) ( not ( = ?auto_19385 ?auto_19386 ) ) ( ON ?auto_19382 ?auto_19387 ) ( not ( = ?auto_19382 ?auto_19387 ) ) ( not ( = ?auto_19383 ?auto_19387 ) ) ( not ( = ?auto_19384 ?auto_19387 ) ) ( not ( = ?auto_19385 ?auto_19387 ) ) ( not ( = ?auto_19386 ?auto_19387 ) ) ( ON ?auto_19383 ?auto_19382 ) ( ON-TABLE ?auto_19387 ) ( ON ?auto_19384 ?auto_19383 ) ( ON ?auto_19385 ?auto_19384 ) ( CLEAR ?auto_19385 ) ( HOLDING ?auto_19386 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19386 )
      ( MAKE-4PILE ?auto_19382 ?auto_19383 ?auto_19384 ?auto_19385 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19388 - BLOCK
      ?auto_19389 - BLOCK
      ?auto_19390 - BLOCK
      ?auto_19391 - BLOCK
    )
    :vars
    (
      ?auto_19392 - BLOCK
      ?auto_19393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19388 ?auto_19389 ) ) ( not ( = ?auto_19388 ?auto_19390 ) ) ( not ( = ?auto_19388 ?auto_19391 ) ) ( not ( = ?auto_19389 ?auto_19390 ) ) ( not ( = ?auto_19389 ?auto_19391 ) ) ( not ( = ?auto_19390 ?auto_19391 ) ) ( not ( = ?auto_19388 ?auto_19392 ) ) ( not ( = ?auto_19389 ?auto_19392 ) ) ( not ( = ?auto_19390 ?auto_19392 ) ) ( not ( = ?auto_19391 ?auto_19392 ) ) ( ON ?auto_19388 ?auto_19393 ) ( not ( = ?auto_19388 ?auto_19393 ) ) ( not ( = ?auto_19389 ?auto_19393 ) ) ( not ( = ?auto_19390 ?auto_19393 ) ) ( not ( = ?auto_19391 ?auto_19393 ) ) ( not ( = ?auto_19392 ?auto_19393 ) ) ( ON ?auto_19389 ?auto_19388 ) ( ON-TABLE ?auto_19393 ) ( ON ?auto_19390 ?auto_19389 ) ( ON ?auto_19391 ?auto_19390 ) ( ON ?auto_19392 ?auto_19391 ) ( CLEAR ?auto_19392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19393 ?auto_19388 ?auto_19389 ?auto_19390 ?auto_19391 )
      ( MAKE-4PILE ?auto_19388 ?auto_19389 ?auto_19390 ?auto_19391 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19404 - BLOCK
      ?auto_19405 - BLOCK
      ?auto_19406 - BLOCK
      ?auto_19407 - BLOCK
      ?auto_19408 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19407 ) ( ON-TABLE ?auto_19404 ) ( ON ?auto_19405 ?auto_19404 ) ( ON ?auto_19406 ?auto_19405 ) ( ON ?auto_19407 ?auto_19406 ) ( not ( = ?auto_19404 ?auto_19405 ) ) ( not ( = ?auto_19404 ?auto_19406 ) ) ( not ( = ?auto_19404 ?auto_19407 ) ) ( not ( = ?auto_19404 ?auto_19408 ) ) ( not ( = ?auto_19405 ?auto_19406 ) ) ( not ( = ?auto_19405 ?auto_19407 ) ) ( not ( = ?auto_19405 ?auto_19408 ) ) ( not ( = ?auto_19406 ?auto_19407 ) ) ( not ( = ?auto_19406 ?auto_19408 ) ) ( not ( = ?auto_19407 ?auto_19408 ) ) ( ON-TABLE ?auto_19408 ) ( CLEAR ?auto_19408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_19408 )
      ( MAKE-5PILE ?auto_19404 ?auto_19405 ?auto_19406 ?auto_19407 ?auto_19408 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19409 - BLOCK
      ?auto_19410 - BLOCK
      ?auto_19411 - BLOCK
      ?auto_19412 - BLOCK
      ?auto_19413 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19409 ) ( ON ?auto_19410 ?auto_19409 ) ( ON ?auto_19411 ?auto_19410 ) ( not ( = ?auto_19409 ?auto_19410 ) ) ( not ( = ?auto_19409 ?auto_19411 ) ) ( not ( = ?auto_19409 ?auto_19412 ) ) ( not ( = ?auto_19409 ?auto_19413 ) ) ( not ( = ?auto_19410 ?auto_19411 ) ) ( not ( = ?auto_19410 ?auto_19412 ) ) ( not ( = ?auto_19410 ?auto_19413 ) ) ( not ( = ?auto_19411 ?auto_19412 ) ) ( not ( = ?auto_19411 ?auto_19413 ) ) ( not ( = ?auto_19412 ?auto_19413 ) ) ( ON-TABLE ?auto_19413 ) ( CLEAR ?auto_19413 ) ( HOLDING ?auto_19412 ) ( CLEAR ?auto_19411 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19409 ?auto_19410 ?auto_19411 ?auto_19412 )
      ( MAKE-5PILE ?auto_19409 ?auto_19410 ?auto_19411 ?auto_19412 ?auto_19413 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19414 - BLOCK
      ?auto_19415 - BLOCK
      ?auto_19416 - BLOCK
      ?auto_19417 - BLOCK
      ?auto_19418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19414 ) ( ON ?auto_19415 ?auto_19414 ) ( ON ?auto_19416 ?auto_19415 ) ( not ( = ?auto_19414 ?auto_19415 ) ) ( not ( = ?auto_19414 ?auto_19416 ) ) ( not ( = ?auto_19414 ?auto_19417 ) ) ( not ( = ?auto_19414 ?auto_19418 ) ) ( not ( = ?auto_19415 ?auto_19416 ) ) ( not ( = ?auto_19415 ?auto_19417 ) ) ( not ( = ?auto_19415 ?auto_19418 ) ) ( not ( = ?auto_19416 ?auto_19417 ) ) ( not ( = ?auto_19416 ?auto_19418 ) ) ( not ( = ?auto_19417 ?auto_19418 ) ) ( ON-TABLE ?auto_19418 ) ( CLEAR ?auto_19416 ) ( ON ?auto_19417 ?auto_19418 ) ( CLEAR ?auto_19417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19418 )
      ( MAKE-5PILE ?auto_19414 ?auto_19415 ?auto_19416 ?auto_19417 ?auto_19418 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19419 - BLOCK
      ?auto_19420 - BLOCK
      ?auto_19421 - BLOCK
      ?auto_19422 - BLOCK
      ?auto_19423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19419 ) ( ON ?auto_19420 ?auto_19419 ) ( not ( = ?auto_19419 ?auto_19420 ) ) ( not ( = ?auto_19419 ?auto_19421 ) ) ( not ( = ?auto_19419 ?auto_19422 ) ) ( not ( = ?auto_19419 ?auto_19423 ) ) ( not ( = ?auto_19420 ?auto_19421 ) ) ( not ( = ?auto_19420 ?auto_19422 ) ) ( not ( = ?auto_19420 ?auto_19423 ) ) ( not ( = ?auto_19421 ?auto_19422 ) ) ( not ( = ?auto_19421 ?auto_19423 ) ) ( not ( = ?auto_19422 ?auto_19423 ) ) ( ON-TABLE ?auto_19423 ) ( ON ?auto_19422 ?auto_19423 ) ( CLEAR ?auto_19422 ) ( HOLDING ?auto_19421 ) ( CLEAR ?auto_19420 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19419 ?auto_19420 ?auto_19421 )
      ( MAKE-5PILE ?auto_19419 ?auto_19420 ?auto_19421 ?auto_19422 ?auto_19423 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19424 - BLOCK
      ?auto_19425 - BLOCK
      ?auto_19426 - BLOCK
      ?auto_19427 - BLOCK
      ?auto_19428 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19424 ) ( ON ?auto_19425 ?auto_19424 ) ( not ( = ?auto_19424 ?auto_19425 ) ) ( not ( = ?auto_19424 ?auto_19426 ) ) ( not ( = ?auto_19424 ?auto_19427 ) ) ( not ( = ?auto_19424 ?auto_19428 ) ) ( not ( = ?auto_19425 ?auto_19426 ) ) ( not ( = ?auto_19425 ?auto_19427 ) ) ( not ( = ?auto_19425 ?auto_19428 ) ) ( not ( = ?auto_19426 ?auto_19427 ) ) ( not ( = ?auto_19426 ?auto_19428 ) ) ( not ( = ?auto_19427 ?auto_19428 ) ) ( ON-TABLE ?auto_19428 ) ( ON ?auto_19427 ?auto_19428 ) ( CLEAR ?auto_19425 ) ( ON ?auto_19426 ?auto_19427 ) ( CLEAR ?auto_19426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19428 ?auto_19427 )
      ( MAKE-5PILE ?auto_19424 ?auto_19425 ?auto_19426 ?auto_19427 ?auto_19428 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19429 - BLOCK
      ?auto_19430 - BLOCK
      ?auto_19431 - BLOCK
      ?auto_19432 - BLOCK
      ?auto_19433 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19429 ) ( not ( = ?auto_19429 ?auto_19430 ) ) ( not ( = ?auto_19429 ?auto_19431 ) ) ( not ( = ?auto_19429 ?auto_19432 ) ) ( not ( = ?auto_19429 ?auto_19433 ) ) ( not ( = ?auto_19430 ?auto_19431 ) ) ( not ( = ?auto_19430 ?auto_19432 ) ) ( not ( = ?auto_19430 ?auto_19433 ) ) ( not ( = ?auto_19431 ?auto_19432 ) ) ( not ( = ?auto_19431 ?auto_19433 ) ) ( not ( = ?auto_19432 ?auto_19433 ) ) ( ON-TABLE ?auto_19433 ) ( ON ?auto_19432 ?auto_19433 ) ( ON ?auto_19431 ?auto_19432 ) ( CLEAR ?auto_19431 ) ( HOLDING ?auto_19430 ) ( CLEAR ?auto_19429 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19429 ?auto_19430 )
      ( MAKE-5PILE ?auto_19429 ?auto_19430 ?auto_19431 ?auto_19432 ?auto_19433 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19434 - BLOCK
      ?auto_19435 - BLOCK
      ?auto_19436 - BLOCK
      ?auto_19437 - BLOCK
      ?auto_19438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19434 ) ( not ( = ?auto_19434 ?auto_19435 ) ) ( not ( = ?auto_19434 ?auto_19436 ) ) ( not ( = ?auto_19434 ?auto_19437 ) ) ( not ( = ?auto_19434 ?auto_19438 ) ) ( not ( = ?auto_19435 ?auto_19436 ) ) ( not ( = ?auto_19435 ?auto_19437 ) ) ( not ( = ?auto_19435 ?auto_19438 ) ) ( not ( = ?auto_19436 ?auto_19437 ) ) ( not ( = ?auto_19436 ?auto_19438 ) ) ( not ( = ?auto_19437 ?auto_19438 ) ) ( ON-TABLE ?auto_19438 ) ( ON ?auto_19437 ?auto_19438 ) ( ON ?auto_19436 ?auto_19437 ) ( CLEAR ?auto_19434 ) ( ON ?auto_19435 ?auto_19436 ) ( CLEAR ?auto_19435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19438 ?auto_19437 ?auto_19436 )
      ( MAKE-5PILE ?auto_19434 ?auto_19435 ?auto_19436 ?auto_19437 ?auto_19438 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19439 - BLOCK
      ?auto_19440 - BLOCK
      ?auto_19441 - BLOCK
      ?auto_19442 - BLOCK
      ?auto_19443 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19439 ?auto_19440 ) ) ( not ( = ?auto_19439 ?auto_19441 ) ) ( not ( = ?auto_19439 ?auto_19442 ) ) ( not ( = ?auto_19439 ?auto_19443 ) ) ( not ( = ?auto_19440 ?auto_19441 ) ) ( not ( = ?auto_19440 ?auto_19442 ) ) ( not ( = ?auto_19440 ?auto_19443 ) ) ( not ( = ?auto_19441 ?auto_19442 ) ) ( not ( = ?auto_19441 ?auto_19443 ) ) ( not ( = ?auto_19442 ?auto_19443 ) ) ( ON-TABLE ?auto_19443 ) ( ON ?auto_19442 ?auto_19443 ) ( ON ?auto_19441 ?auto_19442 ) ( ON ?auto_19440 ?auto_19441 ) ( CLEAR ?auto_19440 ) ( HOLDING ?auto_19439 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19439 )
      ( MAKE-5PILE ?auto_19439 ?auto_19440 ?auto_19441 ?auto_19442 ?auto_19443 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19444 - BLOCK
      ?auto_19445 - BLOCK
      ?auto_19446 - BLOCK
      ?auto_19447 - BLOCK
      ?auto_19448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19444 ?auto_19445 ) ) ( not ( = ?auto_19444 ?auto_19446 ) ) ( not ( = ?auto_19444 ?auto_19447 ) ) ( not ( = ?auto_19444 ?auto_19448 ) ) ( not ( = ?auto_19445 ?auto_19446 ) ) ( not ( = ?auto_19445 ?auto_19447 ) ) ( not ( = ?auto_19445 ?auto_19448 ) ) ( not ( = ?auto_19446 ?auto_19447 ) ) ( not ( = ?auto_19446 ?auto_19448 ) ) ( not ( = ?auto_19447 ?auto_19448 ) ) ( ON-TABLE ?auto_19448 ) ( ON ?auto_19447 ?auto_19448 ) ( ON ?auto_19446 ?auto_19447 ) ( ON ?auto_19445 ?auto_19446 ) ( ON ?auto_19444 ?auto_19445 ) ( CLEAR ?auto_19444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19448 ?auto_19447 ?auto_19446 ?auto_19445 )
      ( MAKE-5PILE ?auto_19444 ?auto_19445 ?auto_19446 ?auto_19447 ?auto_19448 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19454 - BLOCK
      ?auto_19455 - BLOCK
      ?auto_19456 - BLOCK
      ?auto_19457 - BLOCK
      ?auto_19458 - BLOCK
    )
    :vars
    (
      ?auto_19459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19454 ?auto_19455 ) ) ( not ( = ?auto_19454 ?auto_19456 ) ) ( not ( = ?auto_19454 ?auto_19457 ) ) ( not ( = ?auto_19454 ?auto_19458 ) ) ( not ( = ?auto_19455 ?auto_19456 ) ) ( not ( = ?auto_19455 ?auto_19457 ) ) ( not ( = ?auto_19455 ?auto_19458 ) ) ( not ( = ?auto_19456 ?auto_19457 ) ) ( not ( = ?auto_19456 ?auto_19458 ) ) ( not ( = ?auto_19457 ?auto_19458 ) ) ( ON-TABLE ?auto_19458 ) ( ON ?auto_19457 ?auto_19458 ) ( ON ?auto_19456 ?auto_19457 ) ( ON ?auto_19455 ?auto_19456 ) ( CLEAR ?auto_19455 ) ( ON ?auto_19454 ?auto_19459 ) ( CLEAR ?auto_19454 ) ( HAND-EMPTY ) ( not ( = ?auto_19454 ?auto_19459 ) ) ( not ( = ?auto_19455 ?auto_19459 ) ) ( not ( = ?auto_19456 ?auto_19459 ) ) ( not ( = ?auto_19457 ?auto_19459 ) ) ( not ( = ?auto_19458 ?auto_19459 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19454 ?auto_19459 )
      ( MAKE-5PILE ?auto_19454 ?auto_19455 ?auto_19456 ?auto_19457 ?auto_19458 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19460 - BLOCK
      ?auto_19461 - BLOCK
      ?auto_19462 - BLOCK
      ?auto_19463 - BLOCK
      ?auto_19464 - BLOCK
    )
    :vars
    (
      ?auto_19465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19460 ?auto_19461 ) ) ( not ( = ?auto_19460 ?auto_19462 ) ) ( not ( = ?auto_19460 ?auto_19463 ) ) ( not ( = ?auto_19460 ?auto_19464 ) ) ( not ( = ?auto_19461 ?auto_19462 ) ) ( not ( = ?auto_19461 ?auto_19463 ) ) ( not ( = ?auto_19461 ?auto_19464 ) ) ( not ( = ?auto_19462 ?auto_19463 ) ) ( not ( = ?auto_19462 ?auto_19464 ) ) ( not ( = ?auto_19463 ?auto_19464 ) ) ( ON-TABLE ?auto_19464 ) ( ON ?auto_19463 ?auto_19464 ) ( ON ?auto_19462 ?auto_19463 ) ( ON ?auto_19460 ?auto_19465 ) ( CLEAR ?auto_19460 ) ( not ( = ?auto_19460 ?auto_19465 ) ) ( not ( = ?auto_19461 ?auto_19465 ) ) ( not ( = ?auto_19462 ?auto_19465 ) ) ( not ( = ?auto_19463 ?auto_19465 ) ) ( not ( = ?auto_19464 ?auto_19465 ) ) ( HOLDING ?auto_19461 ) ( CLEAR ?auto_19462 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19464 ?auto_19463 ?auto_19462 ?auto_19461 )
      ( MAKE-5PILE ?auto_19460 ?auto_19461 ?auto_19462 ?auto_19463 ?auto_19464 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19466 - BLOCK
      ?auto_19467 - BLOCK
      ?auto_19468 - BLOCK
      ?auto_19469 - BLOCK
      ?auto_19470 - BLOCK
    )
    :vars
    (
      ?auto_19471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19466 ?auto_19467 ) ) ( not ( = ?auto_19466 ?auto_19468 ) ) ( not ( = ?auto_19466 ?auto_19469 ) ) ( not ( = ?auto_19466 ?auto_19470 ) ) ( not ( = ?auto_19467 ?auto_19468 ) ) ( not ( = ?auto_19467 ?auto_19469 ) ) ( not ( = ?auto_19467 ?auto_19470 ) ) ( not ( = ?auto_19468 ?auto_19469 ) ) ( not ( = ?auto_19468 ?auto_19470 ) ) ( not ( = ?auto_19469 ?auto_19470 ) ) ( ON-TABLE ?auto_19470 ) ( ON ?auto_19469 ?auto_19470 ) ( ON ?auto_19468 ?auto_19469 ) ( ON ?auto_19466 ?auto_19471 ) ( not ( = ?auto_19466 ?auto_19471 ) ) ( not ( = ?auto_19467 ?auto_19471 ) ) ( not ( = ?auto_19468 ?auto_19471 ) ) ( not ( = ?auto_19469 ?auto_19471 ) ) ( not ( = ?auto_19470 ?auto_19471 ) ) ( CLEAR ?auto_19468 ) ( ON ?auto_19467 ?auto_19466 ) ( CLEAR ?auto_19467 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19471 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19471 ?auto_19466 )
      ( MAKE-5PILE ?auto_19466 ?auto_19467 ?auto_19468 ?auto_19469 ?auto_19470 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19472 - BLOCK
      ?auto_19473 - BLOCK
      ?auto_19474 - BLOCK
      ?auto_19475 - BLOCK
      ?auto_19476 - BLOCK
    )
    :vars
    (
      ?auto_19477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19472 ?auto_19473 ) ) ( not ( = ?auto_19472 ?auto_19474 ) ) ( not ( = ?auto_19472 ?auto_19475 ) ) ( not ( = ?auto_19472 ?auto_19476 ) ) ( not ( = ?auto_19473 ?auto_19474 ) ) ( not ( = ?auto_19473 ?auto_19475 ) ) ( not ( = ?auto_19473 ?auto_19476 ) ) ( not ( = ?auto_19474 ?auto_19475 ) ) ( not ( = ?auto_19474 ?auto_19476 ) ) ( not ( = ?auto_19475 ?auto_19476 ) ) ( ON-TABLE ?auto_19476 ) ( ON ?auto_19475 ?auto_19476 ) ( ON ?auto_19472 ?auto_19477 ) ( not ( = ?auto_19472 ?auto_19477 ) ) ( not ( = ?auto_19473 ?auto_19477 ) ) ( not ( = ?auto_19474 ?auto_19477 ) ) ( not ( = ?auto_19475 ?auto_19477 ) ) ( not ( = ?auto_19476 ?auto_19477 ) ) ( ON ?auto_19473 ?auto_19472 ) ( CLEAR ?auto_19473 ) ( ON-TABLE ?auto_19477 ) ( HOLDING ?auto_19474 ) ( CLEAR ?auto_19475 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19476 ?auto_19475 ?auto_19474 )
      ( MAKE-5PILE ?auto_19472 ?auto_19473 ?auto_19474 ?auto_19475 ?auto_19476 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19478 - BLOCK
      ?auto_19479 - BLOCK
      ?auto_19480 - BLOCK
      ?auto_19481 - BLOCK
      ?auto_19482 - BLOCK
    )
    :vars
    (
      ?auto_19483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19478 ?auto_19479 ) ) ( not ( = ?auto_19478 ?auto_19480 ) ) ( not ( = ?auto_19478 ?auto_19481 ) ) ( not ( = ?auto_19478 ?auto_19482 ) ) ( not ( = ?auto_19479 ?auto_19480 ) ) ( not ( = ?auto_19479 ?auto_19481 ) ) ( not ( = ?auto_19479 ?auto_19482 ) ) ( not ( = ?auto_19480 ?auto_19481 ) ) ( not ( = ?auto_19480 ?auto_19482 ) ) ( not ( = ?auto_19481 ?auto_19482 ) ) ( ON-TABLE ?auto_19482 ) ( ON ?auto_19481 ?auto_19482 ) ( ON ?auto_19478 ?auto_19483 ) ( not ( = ?auto_19478 ?auto_19483 ) ) ( not ( = ?auto_19479 ?auto_19483 ) ) ( not ( = ?auto_19480 ?auto_19483 ) ) ( not ( = ?auto_19481 ?auto_19483 ) ) ( not ( = ?auto_19482 ?auto_19483 ) ) ( ON ?auto_19479 ?auto_19478 ) ( ON-TABLE ?auto_19483 ) ( CLEAR ?auto_19481 ) ( ON ?auto_19480 ?auto_19479 ) ( CLEAR ?auto_19480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19483 ?auto_19478 ?auto_19479 )
      ( MAKE-5PILE ?auto_19478 ?auto_19479 ?auto_19480 ?auto_19481 ?auto_19482 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19484 - BLOCK
      ?auto_19485 - BLOCK
      ?auto_19486 - BLOCK
      ?auto_19487 - BLOCK
      ?auto_19488 - BLOCK
    )
    :vars
    (
      ?auto_19489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19484 ?auto_19485 ) ) ( not ( = ?auto_19484 ?auto_19486 ) ) ( not ( = ?auto_19484 ?auto_19487 ) ) ( not ( = ?auto_19484 ?auto_19488 ) ) ( not ( = ?auto_19485 ?auto_19486 ) ) ( not ( = ?auto_19485 ?auto_19487 ) ) ( not ( = ?auto_19485 ?auto_19488 ) ) ( not ( = ?auto_19486 ?auto_19487 ) ) ( not ( = ?auto_19486 ?auto_19488 ) ) ( not ( = ?auto_19487 ?auto_19488 ) ) ( ON-TABLE ?auto_19488 ) ( ON ?auto_19484 ?auto_19489 ) ( not ( = ?auto_19484 ?auto_19489 ) ) ( not ( = ?auto_19485 ?auto_19489 ) ) ( not ( = ?auto_19486 ?auto_19489 ) ) ( not ( = ?auto_19487 ?auto_19489 ) ) ( not ( = ?auto_19488 ?auto_19489 ) ) ( ON ?auto_19485 ?auto_19484 ) ( ON-TABLE ?auto_19489 ) ( ON ?auto_19486 ?auto_19485 ) ( CLEAR ?auto_19486 ) ( HOLDING ?auto_19487 ) ( CLEAR ?auto_19488 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19488 ?auto_19487 )
      ( MAKE-5PILE ?auto_19484 ?auto_19485 ?auto_19486 ?auto_19487 ?auto_19488 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19490 - BLOCK
      ?auto_19491 - BLOCK
      ?auto_19492 - BLOCK
      ?auto_19493 - BLOCK
      ?auto_19494 - BLOCK
    )
    :vars
    (
      ?auto_19495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19490 ?auto_19491 ) ) ( not ( = ?auto_19490 ?auto_19492 ) ) ( not ( = ?auto_19490 ?auto_19493 ) ) ( not ( = ?auto_19490 ?auto_19494 ) ) ( not ( = ?auto_19491 ?auto_19492 ) ) ( not ( = ?auto_19491 ?auto_19493 ) ) ( not ( = ?auto_19491 ?auto_19494 ) ) ( not ( = ?auto_19492 ?auto_19493 ) ) ( not ( = ?auto_19492 ?auto_19494 ) ) ( not ( = ?auto_19493 ?auto_19494 ) ) ( ON-TABLE ?auto_19494 ) ( ON ?auto_19490 ?auto_19495 ) ( not ( = ?auto_19490 ?auto_19495 ) ) ( not ( = ?auto_19491 ?auto_19495 ) ) ( not ( = ?auto_19492 ?auto_19495 ) ) ( not ( = ?auto_19493 ?auto_19495 ) ) ( not ( = ?auto_19494 ?auto_19495 ) ) ( ON ?auto_19491 ?auto_19490 ) ( ON-TABLE ?auto_19495 ) ( ON ?auto_19492 ?auto_19491 ) ( CLEAR ?auto_19494 ) ( ON ?auto_19493 ?auto_19492 ) ( CLEAR ?auto_19493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19495 ?auto_19490 ?auto_19491 ?auto_19492 )
      ( MAKE-5PILE ?auto_19490 ?auto_19491 ?auto_19492 ?auto_19493 ?auto_19494 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19496 - BLOCK
      ?auto_19497 - BLOCK
      ?auto_19498 - BLOCK
      ?auto_19499 - BLOCK
      ?auto_19500 - BLOCK
    )
    :vars
    (
      ?auto_19501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19496 ?auto_19497 ) ) ( not ( = ?auto_19496 ?auto_19498 ) ) ( not ( = ?auto_19496 ?auto_19499 ) ) ( not ( = ?auto_19496 ?auto_19500 ) ) ( not ( = ?auto_19497 ?auto_19498 ) ) ( not ( = ?auto_19497 ?auto_19499 ) ) ( not ( = ?auto_19497 ?auto_19500 ) ) ( not ( = ?auto_19498 ?auto_19499 ) ) ( not ( = ?auto_19498 ?auto_19500 ) ) ( not ( = ?auto_19499 ?auto_19500 ) ) ( ON ?auto_19496 ?auto_19501 ) ( not ( = ?auto_19496 ?auto_19501 ) ) ( not ( = ?auto_19497 ?auto_19501 ) ) ( not ( = ?auto_19498 ?auto_19501 ) ) ( not ( = ?auto_19499 ?auto_19501 ) ) ( not ( = ?auto_19500 ?auto_19501 ) ) ( ON ?auto_19497 ?auto_19496 ) ( ON-TABLE ?auto_19501 ) ( ON ?auto_19498 ?auto_19497 ) ( ON ?auto_19499 ?auto_19498 ) ( CLEAR ?auto_19499 ) ( HOLDING ?auto_19500 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19500 )
      ( MAKE-5PILE ?auto_19496 ?auto_19497 ?auto_19498 ?auto_19499 ?auto_19500 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19502 - BLOCK
      ?auto_19503 - BLOCK
      ?auto_19504 - BLOCK
      ?auto_19505 - BLOCK
      ?auto_19506 - BLOCK
    )
    :vars
    (
      ?auto_19507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19502 ?auto_19503 ) ) ( not ( = ?auto_19502 ?auto_19504 ) ) ( not ( = ?auto_19502 ?auto_19505 ) ) ( not ( = ?auto_19502 ?auto_19506 ) ) ( not ( = ?auto_19503 ?auto_19504 ) ) ( not ( = ?auto_19503 ?auto_19505 ) ) ( not ( = ?auto_19503 ?auto_19506 ) ) ( not ( = ?auto_19504 ?auto_19505 ) ) ( not ( = ?auto_19504 ?auto_19506 ) ) ( not ( = ?auto_19505 ?auto_19506 ) ) ( ON ?auto_19502 ?auto_19507 ) ( not ( = ?auto_19502 ?auto_19507 ) ) ( not ( = ?auto_19503 ?auto_19507 ) ) ( not ( = ?auto_19504 ?auto_19507 ) ) ( not ( = ?auto_19505 ?auto_19507 ) ) ( not ( = ?auto_19506 ?auto_19507 ) ) ( ON ?auto_19503 ?auto_19502 ) ( ON-TABLE ?auto_19507 ) ( ON ?auto_19504 ?auto_19503 ) ( ON ?auto_19505 ?auto_19504 ) ( ON ?auto_19506 ?auto_19505 ) ( CLEAR ?auto_19506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19507 ?auto_19502 ?auto_19503 ?auto_19504 ?auto_19505 )
      ( MAKE-5PILE ?auto_19502 ?auto_19503 ?auto_19504 ?auto_19505 ?auto_19506 ) )
  )

)

