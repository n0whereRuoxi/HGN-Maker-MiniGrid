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
      ?auto_32575 - BLOCK
    )
    :vars
    (
      ?auto_32576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32575 ?auto_32576 ) ( CLEAR ?auto_32575 ) ( HAND-EMPTY ) ( not ( = ?auto_32575 ?auto_32576 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32575 ?auto_32576 )
      ( !PUTDOWN ?auto_32575 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32582 - BLOCK
      ?auto_32583 - BLOCK
    )
    :vars
    (
      ?auto_32584 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32582 ) ( ON ?auto_32583 ?auto_32584 ) ( CLEAR ?auto_32583 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32582 ) ( not ( = ?auto_32582 ?auto_32583 ) ) ( not ( = ?auto_32582 ?auto_32584 ) ) ( not ( = ?auto_32583 ?auto_32584 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32583 ?auto_32584 )
      ( !STACK ?auto_32583 ?auto_32582 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32592 - BLOCK
      ?auto_32593 - BLOCK
    )
    :vars
    (
      ?auto_32594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32593 ?auto_32594 ) ( not ( = ?auto_32592 ?auto_32593 ) ) ( not ( = ?auto_32592 ?auto_32594 ) ) ( not ( = ?auto_32593 ?auto_32594 ) ) ( ON ?auto_32592 ?auto_32593 ) ( CLEAR ?auto_32592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32592 )
      ( MAKE-2PILE ?auto_32592 ?auto_32593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32603 - BLOCK
      ?auto_32604 - BLOCK
      ?auto_32605 - BLOCK
    )
    :vars
    (
      ?auto_32606 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32604 ) ( ON ?auto_32605 ?auto_32606 ) ( CLEAR ?auto_32605 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32603 ) ( ON ?auto_32604 ?auto_32603 ) ( not ( = ?auto_32603 ?auto_32604 ) ) ( not ( = ?auto_32603 ?auto_32605 ) ) ( not ( = ?auto_32603 ?auto_32606 ) ) ( not ( = ?auto_32604 ?auto_32605 ) ) ( not ( = ?auto_32604 ?auto_32606 ) ) ( not ( = ?auto_32605 ?auto_32606 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32605 ?auto_32606 )
      ( !STACK ?auto_32605 ?auto_32604 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32617 - BLOCK
      ?auto_32618 - BLOCK
      ?auto_32619 - BLOCK
    )
    :vars
    (
      ?auto_32620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32619 ?auto_32620 ) ( ON-TABLE ?auto_32617 ) ( not ( = ?auto_32617 ?auto_32618 ) ) ( not ( = ?auto_32617 ?auto_32619 ) ) ( not ( = ?auto_32617 ?auto_32620 ) ) ( not ( = ?auto_32618 ?auto_32619 ) ) ( not ( = ?auto_32618 ?auto_32620 ) ) ( not ( = ?auto_32619 ?auto_32620 ) ) ( CLEAR ?auto_32617 ) ( ON ?auto_32618 ?auto_32619 ) ( CLEAR ?auto_32618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32617 ?auto_32618 )
      ( MAKE-3PILE ?auto_32617 ?auto_32618 ?auto_32619 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32631 - BLOCK
      ?auto_32632 - BLOCK
      ?auto_32633 - BLOCK
    )
    :vars
    (
      ?auto_32634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32633 ?auto_32634 ) ( not ( = ?auto_32631 ?auto_32632 ) ) ( not ( = ?auto_32631 ?auto_32633 ) ) ( not ( = ?auto_32631 ?auto_32634 ) ) ( not ( = ?auto_32632 ?auto_32633 ) ) ( not ( = ?auto_32632 ?auto_32634 ) ) ( not ( = ?auto_32633 ?auto_32634 ) ) ( ON ?auto_32632 ?auto_32633 ) ( ON ?auto_32631 ?auto_32632 ) ( CLEAR ?auto_32631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32631 )
      ( MAKE-3PILE ?auto_32631 ?auto_32632 ?auto_32633 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32646 - BLOCK
      ?auto_32647 - BLOCK
      ?auto_32648 - BLOCK
      ?auto_32649 - BLOCK
    )
    :vars
    (
      ?auto_32650 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32648 ) ( ON ?auto_32649 ?auto_32650 ) ( CLEAR ?auto_32649 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32646 ) ( ON ?auto_32647 ?auto_32646 ) ( ON ?auto_32648 ?auto_32647 ) ( not ( = ?auto_32646 ?auto_32647 ) ) ( not ( = ?auto_32646 ?auto_32648 ) ) ( not ( = ?auto_32646 ?auto_32649 ) ) ( not ( = ?auto_32646 ?auto_32650 ) ) ( not ( = ?auto_32647 ?auto_32648 ) ) ( not ( = ?auto_32647 ?auto_32649 ) ) ( not ( = ?auto_32647 ?auto_32650 ) ) ( not ( = ?auto_32648 ?auto_32649 ) ) ( not ( = ?auto_32648 ?auto_32650 ) ) ( not ( = ?auto_32649 ?auto_32650 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32649 ?auto_32650 )
      ( !STACK ?auto_32649 ?auto_32648 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32664 - BLOCK
      ?auto_32665 - BLOCK
      ?auto_32666 - BLOCK
      ?auto_32667 - BLOCK
    )
    :vars
    (
      ?auto_32668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32667 ?auto_32668 ) ( ON-TABLE ?auto_32664 ) ( ON ?auto_32665 ?auto_32664 ) ( not ( = ?auto_32664 ?auto_32665 ) ) ( not ( = ?auto_32664 ?auto_32666 ) ) ( not ( = ?auto_32664 ?auto_32667 ) ) ( not ( = ?auto_32664 ?auto_32668 ) ) ( not ( = ?auto_32665 ?auto_32666 ) ) ( not ( = ?auto_32665 ?auto_32667 ) ) ( not ( = ?auto_32665 ?auto_32668 ) ) ( not ( = ?auto_32666 ?auto_32667 ) ) ( not ( = ?auto_32666 ?auto_32668 ) ) ( not ( = ?auto_32667 ?auto_32668 ) ) ( CLEAR ?auto_32665 ) ( ON ?auto_32666 ?auto_32667 ) ( CLEAR ?auto_32666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32664 ?auto_32665 ?auto_32666 )
      ( MAKE-4PILE ?auto_32664 ?auto_32665 ?auto_32666 ?auto_32667 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32682 - BLOCK
      ?auto_32683 - BLOCK
      ?auto_32684 - BLOCK
      ?auto_32685 - BLOCK
    )
    :vars
    (
      ?auto_32686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32685 ?auto_32686 ) ( ON-TABLE ?auto_32682 ) ( not ( = ?auto_32682 ?auto_32683 ) ) ( not ( = ?auto_32682 ?auto_32684 ) ) ( not ( = ?auto_32682 ?auto_32685 ) ) ( not ( = ?auto_32682 ?auto_32686 ) ) ( not ( = ?auto_32683 ?auto_32684 ) ) ( not ( = ?auto_32683 ?auto_32685 ) ) ( not ( = ?auto_32683 ?auto_32686 ) ) ( not ( = ?auto_32684 ?auto_32685 ) ) ( not ( = ?auto_32684 ?auto_32686 ) ) ( not ( = ?auto_32685 ?auto_32686 ) ) ( ON ?auto_32684 ?auto_32685 ) ( CLEAR ?auto_32682 ) ( ON ?auto_32683 ?auto_32684 ) ( CLEAR ?auto_32683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32682 ?auto_32683 )
      ( MAKE-4PILE ?auto_32682 ?auto_32683 ?auto_32684 ?auto_32685 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32700 - BLOCK
      ?auto_32701 - BLOCK
      ?auto_32702 - BLOCK
      ?auto_32703 - BLOCK
    )
    :vars
    (
      ?auto_32704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32703 ?auto_32704 ) ( not ( = ?auto_32700 ?auto_32701 ) ) ( not ( = ?auto_32700 ?auto_32702 ) ) ( not ( = ?auto_32700 ?auto_32703 ) ) ( not ( = ?auto_32700 ?auto_32704 ) ) ( not ( = ?auto_32701 ?auto_32702 ) ) ( not ( = ?auto_32701 ?auto_32703 ) ) ( not ( = ?auto_32701 ?auto_32704 ) ) ( not ( = ?auto_32702 ?auto_32703 ) ) ( not ( = ?auto_32702 ?auto_32704 ) ) ( not ( = ?auto_32703 ?auto_32704 ) ) ( ON ?auto_32702 ?auto_32703 ) ( ON ?auto_32701 ?auto_32702 ) ( ON ?auto_32700 ?auto_32701 ) ( CLEAR ?auto_32700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32700 )
      ( MAKE-4PILE ?auto_32700 ?auto_32701 ?auto_32702 ?auto_32703 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32719 - BLOCK
      ?auto_32720 - BLOCK
      ?auto_32721 - BLOCK
      ?auto_32722 - BLOCK
      ?auto_32723 - BLOCK
    )
    :vars
    (
      ?auto_32724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32722 ) ( ON ?auto_32723 ?auto_32724 ) ( CLEAR ?auto_32723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32719 ) ( ON ?auto_32720 ?auto_32719 ) ( ON ?auto_32721 ?auto_32720 ) ( ON ?auto_32722 ?auto_32721 ) ( not ( = ?auto_32719 ?auto_32720 ) ) ( not ( = ?auto_32719 ?auto_32721 ) ) ( not ( = ?auto_32719 ?auto_32722 ) ) ( not ( = ?auto_32719 ?auto_32723 ) ) ( not ( = ?auto_32719 ?auto_32724 ) ) ( not ( = ?auto_32720 ?auto_32721 ) ) ( not ( = ?auto_32720 ?auto_32722 ) ) ( not ( = ?auto_32720 ?auto_32723 ) ) ( not ( = ?auto_32720 ?auto_32724 ) ) ( not ( = ?auto_32721 ?auto_32722 ) ) ( not ( = ?auto_32721 ?auto_32723 ) ) ( not ( = ?auto_32721 ?auto_32724 ) ) ( not ( = ?auto_32722 ?auto_32723 ) ) ( not ( = ?auto_32722 ?auto_32724 ) ) ( not ( = ?auto_32723 ?auto_32724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32723 ?auto_32724 )
      ( !STACK ?auto_32723 ?auto_32722 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32741 - BLOCK
      ?auto_32742 - BLOCK
      ?auto_32743 - BLOCK
      ?auto_32744 - BLOCK
      ?auto_32745 - BLOCK
    )
    :vars
    (
      ?auto_32746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32745 ?auto_32746 ) ( ON-TABLE ?auto_32741 ) ( ON ?auto_32742 ?auto_32741 ) ( ON ?auto_32743 ?auto_32742 ) ( not ( = ?auto_32741 ?auto_32742 ) ) ( not ( = ?auto_32741 ?auto_32743 ) ) ( not ( = ?auto_32741 ?auto_32744 ) ) ( not ( = ?auto_32741 ?auto_32745 ) ) ( not ( = ?auto_32741 ?auto_32746 ) ) ( not ( = ?auto_32742 ?auto_32743 ) ) ( not ( = ?auto_32742 ?auto_32744 ) ) ( not ( = ?auto_32742 ?auto_32745 ) ) ( not ( = ?auto_32742 ?auto_32746 ) ) ( not ( = ?auto_32743 ?auto_32744 ) ) ( not ( = ?auto_32743 ?auto_32745 ) ) ( not ( = ?auto_32743 ?auto_32746 ) ) ( not ( = ?auto_32744 ?auto_32745 ) ) ( not ( = ?auto_32744 ?auto_32746 ) ) ( not ( = ?auto_32745 ?auto_32746 ) ) ( CLEAR ?auto_32743 ) ( ON ?auto_32744 ?auto_32745 ) ( CLEAR ?auto_32744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32741 ?auto_32742 ?auto_32743 ?auto_32744 )
      ( MAKE-5PILE ?auto_32741 ?auto_32742 ?auto_32743 ?auto_32744 ?auto_32745 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32763 - BLOCK
      ?auto_32764 - BLOCK
      ?auto_32765 - BLOCK
      ?auto_32766 - BLOCK
      ?auto_32767 - BLOCK
    )
    :vars
    (
      ?auto_32768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32767 ?auto_32768 ) ( ON-TABLE ?auto_32763 ) ( ON ?auto_32764 ?auto_32763 ) ( not ( = ?auto_32763 ?auto_32764 ) ) ( not ( = ?auto_32763 ?auto_32765 ) ) ( not ( = ?auto_32763 ?auto_32766 ) ) ( not ( = ?auto_32763 ?auto_32767 ) ) ( not ( = ?auto_32763 ?auto_32768 ) ) ( not ( = ?auto_32764 ?auto_32765 ) ) ( not ( = ?auto_32764 ?auto_32766 ) ) ( not ( = ?auto_32764 ?auto_32767 ) ) ( not ( = ?auto_32764 ?auto_32768 ) ) ( not ( = ?auto_32765 ?auto_32766 ) ) ( not ( = ?auto_32765 ?auto_32767 ) ) ( not ( = ?auto_32765 ?auto_32768 ) ) ( not ( = ?auto_32766 ?auto_32767 ) ) ( not ( = ?auto_32766 ?auto_32768 ) ) ( not ( = ?auto_32767 ?auto_32768 ) ) ( ON ?auto_32766 ?auto_32767 ) ( CLEAR ?auto_32764 ) ( ON ?auto_32765 ?auto_32766 ) ( CLEAR ?auto_32765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32763 ?auto_32764 ?auto_32765 )
      ( MAKE-5PILE ?auto_32763 ?auto_32764 ?auto_32765 ?auto_32766 ?auto_32767 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32785 - BLOCK
      ?auto_32786 - BLOCK
      ?auto_32787 - BLOCK
      ?auto_32788 - BLOCK
      ?auto_32789 - BLOCK
    )
    :vars
    (
      ?auto_32790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32789 ?auto_32790 ) ( ON-TABLE ?auto_32785 ) ( not ( = ?auto_32785 ?auto_32786 ) ) ( not ( = ?auto_32785 ?auto_32787 ) ) ( not ( = ?auto_32785 ?auto_32788 ) ) ( not ( = ?auto_32785 ?auto_32789 ) ) ( not ( = ?auto_32785 ?auto_32790 ) ) ( not ( = ?auto_32786 ?auto_32787 ) ) ( not ( = ?auto_32786 ?auto_32788 ) ) ( not ( = ?auto_32786 ?auto_32789 ) ) ( not ( = ?auto_32786 ?auto_32790 ) ) ( not ( = ?auto_32787 ?auto_32788 ) ) ( not ( = ?auto_32787 ?auto_32789 ) ) ( not ( = ?auto_32787 ?auto_32790 ) ) ( not ( = ?auto_32788 ?auto_32789 ) ) ( not ( = ?auto_32788 ?auto_32790 ) ) ( not ( = ?auto_32789 ?auto_32790 ) ) ( ON ?auto_32788 ?auto_32789 ) ( ON ?auto_32787 ?auto_32788 ) ( CLEAR ?auto_32785 ) ( ON ?auto_32786 ?auto_32787 ) ( CLEAR ?auto_32786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32785 ?auto_32786 )
      ( MAKE-5PILE ?auto_32785 ?auto_32786 ?auto_32787 ?auto_32788 ?auto_32789 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32807 - BLOCK
      ?auto_32808 - BLOCK
      ?auto_32809 - BLOCK
      ?auto_32810 - BLOCK
      ?auto_32811 - BLOCK
    )
    :vars
    (
      ?auto_32812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32811 ?auto_32812 ) ( not ( = ?auto_32807 ?auto_32808 ) ) ( not ( = ?auto_32807 ?auto_32809 ) ) ( not ( = ?auto_32807 ?auto_32810 ) ) ( not ( = ?auto_32807 ?auto_32811 ) ) ( not ( = ?auto_32807 ?auto_32812 ) ) ( not ( = ?auto_32808 ?auto_32809 ) ) ( not ( = ?auto_32808 ?auto_32810 ) ) ( not ( = ?auto_32808 ?auto_32811 ) ) ( not ( = ?auto_32808 ?auto_32812 ) ) ( not ( = ?auto_32809 ?auto_32810 ) ) ( not ( = ?auto_32809 ?auto_32811 ) ) ( not ( = ?auto_32809 ?auto_32812 ) ) ( not ( = ?auto_32810 ?auto_32811 ) ) ( not ( = ?auto_32810 ?auto_32812 ) ) ( not ( = ?auto_32811 ?auto_32812 ) ) ( ON ?auto_32810 ?auto_32811 ) ( ON ?auto_32809 ?auto_32810 ) ( ON ?auto_32808 ?auto_32809 ) ( ON ?auto_32807 ?auto_32808 ) ( CLEAR ?auto_32807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32807 )
      ( MAKE-5PILE ?auto_32807 ?auto_32808 ?auto_32809 ?auto_32810 ?auto_32811 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_32830 - BLOCK
      ?auto_32831 - BLOCK
      ?auto_32832 - BLOCK
      ?auto_32833 - BLOCK
      ?auto_32834 - BLOCK
      ?auto_32835 - BLOCK
    )
    :vars
    (
      ?auto_32836 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32834 ) ( ON ?auto_32835 ?auto_32836 ) ( CLEAR ?auto_32835 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32830 ) ( ON ?auto_32831 ?auto_32830 ) ( ON ?auto_32832 ?auto_32831 ) ( ON ?auto_32833 ?auto_32832 ) ( ON ?auto_32834 ?auto_32833 ) ( not ( = ?auto_32830 ?auto_32831 ) ) ( not ( = ?auto_32830 ?auto_32832 ) ) ( not ( = ?auto_32830 ?auto_32833 ) ) ( not ( = ?auto_32830 ?auto_32834 ) ) ( not ( = ?auto_32830 ?auto_32835 ) ) ( not ( = ?auto_32830 ?auto_32836 ) ) ( not ( = ?auto_32831 ?auto_32832 ) ) ( not ( = ?auto_32831 ?auto_32833 ) ) ( not ( = ?auto_32831 ?auto_32834 ) ) ( not ( = ?auto_32831 ?auto_32835 ) ) ( not ( = ?auto_32831 ?auto_32836 ) ) ( not ( = ?auto_32832 ?auto_32833 ) ) ( not ( = ?auto_32832 ?auto_32834 ) ) ( not ( = ?auto_32832 ?auto_32835 ) ) ( not ( = ?auto_32832 ?auto_32836 ) ) ( not ( = ?auto_32833 ?auto_32834 ) ) ( not ( = ?auto_32833 ?auto_32835 ) ) ( not ( = ?auto_32833 ?auto_32836 ) ) ( not ( = ?auto_32834 ?auto_32835 ) ) ( not ( = ?auto_32834 ?auto_32836 ) ) ( not ( = ?auto_32835 ?auto_32836 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32835 ?auto_32836 )
      ( !STACK ?auto_32835 ?auto_32834 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_32856 - BLOCK
      ?auto_32857 - BLOCK
      ?auto_32858 - BLOCK
      ?auto_32859 - BLOCK
      ?auto_32860 - BLOCK
      ?auto_32861 - BLOCK
    )
    :vars
    (
      ?auto_32862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32861 ?auto_32862 ) ( ON-TABLE ?auto_32856 ) ( ON ?auto_32857 ?auto_32856 ) ( ON ?auto_32858 ?auto_32857 ) ( ON ?auto_32859 ?auto_32858 ) ( not ( = ?auto_32856 ?auto_32857 ) ) ( not ( = ?auto_32856 ?auto_32858 ) ) ( not ( = ?auto_32856 ?auto_32859 ) ) ( not ( = ?auto_32856 ?auto_32860 ) ) ( not ( = ?auto_32856 ?auto_32861 ) ) ( not ( = ?auto_32856 ?auto_32862 ) ) ( not ( = ?auto_32857 ?auto_32858 ) ) ( not ( = ?auto_32857 ?auto_32859 ) ) ( not ( = ?auto_32857 ?auto_32860 ) ) ( not ( = ?auto_32857 ?auto_32861 ) ) ( not ( = ?auto_32857 ?auto_32862 ) ) ( not ( = ?auto_32858 ?auto_32859 ) ) ( not ( = ?auto_32858 ?auto_32860 ) ) ( not ( = ?auto_32858 ?auto_32861 ) ) ( not ( = ?auto_32858 ?auto_32862 ) ) ( not ( = ?auto_32859 ?auto_32860 ) ) ( not ( = ?auto_32859 ?auto_32861 ) ) ( not ( = ?auto_32859 ?auto_32862 ) ) ( not ( = ?auto_32860 ?auto_32861 ) ) ( not ( = ?auto_32860 ?auto_32862 ) ) ( not ( = ?auto_32861 ?auto_32862 ) ) ( CLEAR ?auto_32859 ) ( ON ?auto_32860 ?auto_32861 ) ( CLEAR ?auto_32860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32856 ?auto_32857 ?auto_32858 ?auto_32859 ?auto_32860 )
      ( MAKE-6PILE ?auto_32856 ?auto_32857 ?auto_32858 ?auto_32859 ?auto_32860 ?auto_32861 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_32882 - BLOCK
      ?auto_32883 - BLOCK
      ?auto_32884 - BLOCK
      ?auto_32885 - BLOCK
      ?auto_32886 - BLOCK
      ?auto_32887 - BLOCK
    )
    :vars
    (
      ?auto_32888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32887 ?auto_32888 ) ( ON-TABLE ?auto_32882 ) ( ON ?auto_32883 ?auto_32882 ) ( ON ?auto_32884 ?auto_32883 ) ( not ( = ?auto_32882 ?auto_32883 ) ) ( not ( = ?auto_32882 ?auto_32884 ) ) ( not ( = ?auto_32882 ?auto_32885 ) ) ( not ( = ?auto_32882 ?auto_32886 ) ) ( not ( = ?auto_32882 ?auto_32887 ) ) ( not ( = ?auto_32882 ?auto_32888 ) ) ( not ( = ?auto_32883 ?auto_32884 ) ) ( not ( = ?auto_32883 ?auto_32885 ) ) ( not ( = ?auto_32883 ?auto_32886 ) ) ( not ( = ?auto_32883 ?auto_32887 ) ) ( not ( = ?auto_32883 ?auto_32888 ) ) ( not ( = ?auto_32884 ?auto_32885 ) ) ( not ( = ?auto_32884 ?auto_32886 ) ) ( not ( = ?auto_32884 ?auto_32887 ) ) ( not ( = ?auto_32884 ?auto_32888 ) ) ( not ( = ?auto_32885 ?auto_32886 ) ) ( not ( = ?auto_32885 ?auto_32887 ) ) ( not ( = ?auto_32885 ?auto_32888 ) ) ( not ( = ?auto_32886 ?auto_32887 ) ) ( not ( = ?auto_32886 ?auto_32888 ) ) ( not ( = ?auto_32887 ?auto_32888 ) ) ( ON ?auto_32886 ?auto_32887 ) ( CLEAR ?auto_32884 ) ( ON ?auto_32885 ?auto_32886 ) ( CLEAR ?auto_32885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32882 ?auto_32883 ?auto_32884 ?auto_32885 )
      ( MAKE-6PILE ?auto_32882 ?auto_32883 ?auto_32884 ?auto_32885 ?auto_32886 ?auto_32887 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_32908 - BLOCK
      ?auto_32909 - BLOCK
      ?auto_32910 - BLOCK
      ?auto_32911 - BLOCK
      ?auto_32912 - BLOCK
      ?auto_32913 - BLOCK
    )
    :vars
    (
      ?auto_32914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32913 ?auto_32914 ) ( ON-TABLE ?auto_32908 ) ( ON ?auto_32909 ?auto_32908 ) ( not ( = ?auto_32908 ?auto_32909 ) ) ( not ( = ?auto_32908 ?auto_32910 ) ) ( not ( = ?auto_32908 ?auto_32911 ) ) ( not ( = ?auto_32908 ?auto_32912 ) ) ( not ( = ?auto_32908 ?auto_32913 ) ) ( not ( = ?auto_32908 ?auto_32914 ) ) ( not ( = ?auto_32909 ?auto_32910 ) ) ( not ( = ?auto_32909 ?auto_32911 ) ) ( not ( = ?auto_32909 ?auto_32912 ) ) ( not ( = ?auto_32909 ?auto_32913 ) ) ( not ( = ?auto_32909 ?auto_32914 ) ) ( not ( = ?auto_32910 ?auto_32911 ) ) ( not ( = ?auto_32910 ?auto_32912 ) ) ( not ( = ?auto_32910 ?auto_32913 ) ) ( not ( = ?auto_32910 ?auto_32914 ) ) ( not ( = ?auto_32911 ?auto_32912 ) ) ( not ( = ?auto_32911 ?auto_32913 ) ) ( not ( = ?auto_32911 ?auto_32914 ) ) ( not ( = ?auto_32912 ?auto_32913 ) ) ( not ( = ?auto_32912 ?auto_32914 ) ) ( not ( = ?auto_32913 ?auto_32914 ) ) ( ON ?auto_32912 ?auto_32913 ) ( ON ?auto_32911 ?auto_32912 ) ( CLEAR ?auto_32909 ) ( ON ?auto_32910 ?auto_32911 ) ( CLEAR ?auto_32910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32908 ?auto_32909 ?auto_32910 )
      ( MAKE-6PILE ?auto_32908 ?auto_32909 ?auto_32910 ?auto_32911 ?auto_32912 ?auto_32913 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_32934 - BLOCK
      ?auto_32935 - BLOCK
      ?auto_32936 - BLOCK
      ?auto_32937 - BLOCK
      ?auto_32938 - BLOCK
      ?auto_32939 - BLOCK
    )
    :vars
    (
      ?auto_32940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32939 ?auto_32940 ) ( ON-TABLE ?auto_32934 ) ( not ( = ?auto_32934 ?auto_32935 ) ) ( not ( = ?auto_32934 ?auto_32936 ) ) ( not ( = ?auto_32934 ?auto_32937 ) ) ( not ( = ?auto_32934 ?auto_32938 ) ) ( not ( = ?auto_32934 ?auto_32939 ) ) ( not ( = ?auto_32934 ?auto_32940 ) ) ( not ( = ?auto_32935 ?auto_32936 ) ) ( not ( = ?auto_32935 ?auto_32937 ) ) ( not ( = ?auto_32935 ?auto_32938 ) ) ( not ( = ?auto_32935 ?auto_32939 ) ) ( not ( = ?auto_32935 ?auto_32940 ) ) ( not ( = ?auto_32936 ?auto_32937 ) ) ( not ( = ?auto_32936 ?auto_32938 ) ) ( not ( = ?auto_32936 ?auto_32939 ) ) ( not ( = ?auto_32936 ?auto_32940 ) ) ( not ( = ?auto_32937 ?auto_32938 ) ) ( not ( = ?auto_32937 ?auto_32939 ) ) ( not ( = ?auto_32937 ?auto_32940 ) ) ( not ( = ?auto_32938 ?auto_32939 ) ) ( not ( = ?auto_32938 ?auto_32940 ) ) ( not ( = ?auto_32939 ?auto_32940 ) ) ( ON ?auto_32938 ?auto_32939 ) ( ON ?auto_32937 ?auto_32938 ) ( ON ?auto_32936 ?auto_32937 ) ( CLEAR ?auto_32934 ) ( ON ?auto_32935 ?auto_32936 ) ( CLEAR ?auto_32935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32934 ?auto_32935 )
      ( MAKE-6PILE ?auto_32934 ?auto_32935 ?auto_32936 ?auto_32937 ?auto_32938 ?auto_32939 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_32960 - BLOCK
      ?auto_32961 - BLOCK
      ?auto_32962 - BLOCK
      ?auto_32963 - BLOCK
      ?auto_32964 - BLOCK
      ?auto_32965 - BLOCK
    )
    :vars
    (
      ?auto_32966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32965 ?auto_32966 ) ( not ( = ?auto_32960 ?auto_32961 ) ) ( not ( = ?auto_32960 ?auto_32962 ) ) ( not ( = ?auto_32960 ?auto_32963 ) ) ( not ( = ?auto_32960 ?auto_32964 ) ) ( not ( = ?auto_32960 ?auto_32965 ) ) ( not ( = ?auto_32960 ?auto_32966 ) ) ( not ( = ?auto_32961 ?auto_32962 ) ) ( not ( = ?auto_32961 ?auto_32963 ) ) ( not ( = ?auto_32961 ?auto_32964 ) ) ( not ( = ?auto_32961 ?auto_32965 ) ) ( not ( = ?auto_32961 ?auto_32966 ) ) ( not ( = ?auto_32962 ?auto_32963 ) ) ( not ( = ?auto_32962 ?auto_32964 ) ) ( not ( = ?auto_32962 ?auto_32965 ) ) ( not ( = ?auto_32962 ?auto_32966 ) ) ( not ( = ?auto_32963 ?auto_32964 ) ) ( not ( = ?auto_32963 ?auto_32965 ) ) ( not ( = ?auto_32963 ?auto_32966 ) ) ( not ( = ?auto_32964 ?auto_32965 ) ) ( not ( = ?auto_32964 ?auto_32966 ) ) ( not ( = ?auto_32965 ?auto_32966 ) ) ( ON ?auto_32964 ?auto_32965 ) ( ON ?auto_32963 ?auto_32964 ) ( ON ?auto_32962 ?auto_32963 ) ( ON ?auto_32961 ?auto_32962 ) ( ON ?auto_32960 ?auto_32961 ) ( CLEAR ?auto_32960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32960 )
      ( MAKE-6PILE ?auto_32960 ?auto_32961 ?auto_32962 ?auto_32963 ?auto_32964 ?auto_32965 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_32987 - BLOCK
      ?auto_32988 - BLOCK
      ?auto_32989 - BLOCK
      ?auto_32990 - BLOCK
      ?auto_32991 - BLOCK
      ?auto_32992 - BLOCK
      ?auto_32993 - BLOCK
    )
    :vars
    (
      ?auto_32994 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32992 ) ( ON ?auto_32993 ?auto_32994 ) ( CLEAR ?auto_32993 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32987 ) ( ON ?auto_32988 ?auto_32987 ) ( ON ?auto_32989 ?auto_32988 ) ( ON ?auto_32990 ?auto_32989 ) ( ON ?auto_32991 ?auto_32990 ) ( ON ?auto_32992 ?auto_32991 ) ( not ( = ?auto_32987 ?auto_32988 ) ) ( not ( = ?auto_32987 ?auto_32989 ) ) ( not ( = ?auto_32987 ?auto_32990 ) ) ( not ( = ?auto_32987 ?auto_32991 ) ) ( not ( = ?auto_32987 ?auto_32992 ) ) ( not ( = ?auto_32987 ?auto_32993 ) ) ( not ( = ?auto_32987 ?auto_32994 ) ) ( not ( = ?auto_32988 ?auto_32989 ) ) ( not ( = ?auto_32988 ?auto_32990 ) ) ( not ( = ?auto_32988 ?auto_32991 ) ) ( not ( = ?auto_32988 ?auto_32992 ) ) ( not ( = ?auto_32988 ?auto_32993 ) ) ( not ( = ?auto_32988 ?auto_32994 ) ) ( not ( = ?auto_32989 ?auto_32990 ) ) ( not ( = ?auto_32989 ?auto_32991 ) ) ( not ( = ?auto_32989 ?auto_32992 ) ) ( not ( = ?auto_32989 ?auto_32993 ) ) ( not ( = ?auto_32989 ?auto_32994 ) ) ( not ( = ?auto_32990 ?auto_32991 ) ) ( not ( = ?auto_32990 ?auto_32992 ) ) ( not ( = ?auto_32990 ?auto_32993 ) ) ( not ( = ?auto_32990 ?auto_32994 ) ) ( not ( = ?auto_32991 ?auto_32992 ) ) ( not ( = ?auto_32991 ?auto_32993 ) ) ( not ( = ?auto_32991 ?auto_32994 ) ) ( not ( = ?auto_32992 ?auto_32993 ) ) ( not ( = ?auto_32992 ?auto_32994 ) ) ( not ( = ?auto_32993 ?auto_32994 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32993 ?auto_32994 )
      ( !STACK ?auto_32993 ?auto_32992 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_33017 - BLOCK
      ?auto_33018 - BLOCK
      ?auto_33019 - BLOCK
      ?auto_33020 - BLOCK
      ?auto_33021 - BLOCK
      ?auto_33022 - BLOCK
      ?auto_33023 - BLOCK
    )
    :vars
    (
      ?auto_33024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33023 ?auto_33024 ) ( ON-TABLE ?auto_33017 ) ( ON ?auto_33018 ?auto_33017 ) ( ON ?auto_33019 ?auto_33018 ) ( ON ?auto_33020 ?auto_33019 ) ( ON ?auto_33021 ?auto_33020 ) ( not ( = ?auto_33017 ?auto_33018 ) ) ( not ( = ?auto_33017 ?auto_33019 ) ) ( not ( = ?auto_33017 ?auto_33020 ) ) ( not ( = ?auto_33017 ?auto_33021 ) ) ( not ( = ?auto_33017 ?auto_33022 ) ) ( not ( = ?auto_33017 ?auto_33023 ) ) ( not ( = ?auto_33017 ?auto_33024 ) ) ( not ( = ?auto_33018 ?auto_33019 ) ) ( not ( = ?auto_33018 ?auto_33020 ) ) ( not ( = ?auto_33018 ?auto_33021 ) ) ( not ( = ?auto_33018 ?auto_33022 ) ) ( not ( = ?auto_33018 ?auto_33023 ) ) ( not ( = ?auto_33018 ?auto_33024 ) ) ( not ( = ?auto_33019 ?auto_33020 ) ) ( not ( = ?auto_33019 ?auto_33021 ) ) ( not ( = ?auto_33019 ?auto_33022 ) ) ( not ( = ?auto_33019 ?auto_33023 ) ) ( not ( = ?auto_33019 ?auto_33024 ) ) ( not ( = ?auto_33020 ?auto_33021 ) ) ( not ( = ?auto_33020 ?auto_33022 ) ) ( not ( = ?auto_33020 ?auto_33023 ) ) ( not ( = ?auto_33020 ?auto_33024 ) ) ( not ( = ?auto_33021 ?auto_33022 ) ) ( not ( = ?auto_33021 ?auto_33023 ) ) ( not ( = ?auto_33021 ?auto_33024 ) ) ( not ( = ?auto_33022 ?auto_33023 ) ) ( not ( = ?auto_33022 ?auto_33024 ) ) ( not ( = ?auto_33023 ?auto_33024 ) ) ( CLEAR ?auto_33021 ) ( ON ?auto_33022 ?auto_33023 ) ( CLEAR ?auto_33022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_33017 ?auto_33018 ?auto_33019 ?auto_33020 ?auto_33021 ?auto_33022 )
      ( MAKE-7PILE ?auto_33017 ?auto_33018 ?auto_33019 ?auto_33020 ?auto_33021 ?auto_33022 ?auto_33023 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_33047 - BLOCK
      ?auto_33048 - BLOCK
      ?auto_33049 - BLOCK
      ?auto_33050 - BLOCK
      ?auto_33051 - BLOCK
      ?auto_33052 - BLOCK
      ?auto_33053 - BLOCK
    )
    :vars
    (
      ?auto_33054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33053 ?auto_33054 ) ( ON-TABLE ?auto_33047 ) ( ON ?auto_33048 ?auto_33047 ) ( ON ?auto_33049 ?auto_33048 ) ( ON ?auto_33050 ?auto_33049 ) ( not ( = ?auto_33047 ?auto_33048 ) ) ( not ( = ?auto_33047 ?auto_33049 ) ) ( not ( = ?auto_33047 ?auto_33050 ) ) ( not ( = ?auto_33047 ?auto_33051 ) ) ( not ( = ?auto_33047 ?auto_33052 ) ) ( not ( = ?auto_33047 ?auto_33053 ) ) ( not ( = ?auto_33047 ?auto_33054 ) ) ( not ( = ?auto_33048 ?auto_33049 ) ) ( not ( = ?auto_33048 ?auto_33050 ) ) ( not ( = ?auto_33048 ?auto_33051 ) ) ( not ( = ?auto_33048 ?auto_33052 ) ) ( not ( = ?auto_33048 ?auto_33053 ) ) ( not ( = ?auto_33048 ?auto_33054 ) ) ( not ( = ?auto_33049 ?auto_33050 ) ) ( not ( = ?auto_33049 ?auto_33051 ) ) ( not ( = ?auto_33049 ?auto_33052 ) ) ( not ( = ?auto_33049 ?auto_33053 ) ) ( not ( = ?auto_33049 ?auto_33054 ) ) ( not ( = ?auto_33050 ?auto_33051 ) ) ( not ( = ?auto_33050 ?auto_33052 ) ) ( not ( = ?auto_33050 ?auto_33053 ) ) ( not ( = ?auto_33050 ?auto_33054 ) ) ( not ( = ?auto_33051 ?auto_33052 ) ) ( not ( = ?auto_33051 ?auto_33053 ) ) ( not ( = ?auto_33051 ?auto_33054 ) ) ( not ( = ?auto_33052 ?auto_33053 ) ) ( not ( = ?auto_33052 ?auto_33054 ) ) ( not ( = ?auto_33053 ?auto_33054 ) ) ( ON ?auto_33052 ?auto_33053 ) ( CLEAR ?auto_33050 ) ( ON ?auto_33051 ?auto_33052 ) ( CLEAR ?auto_33051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33047 ?auto_33048 ?auto_33049 ?auto_33050 ?auto_33051 )
      ( MAKE-7PILE ?auto_33047 ?auto_33048 ?auto_33049 ?auto_33050 ?auto_33051 ?auto_33052 ?auto_33053 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_33077 - BLOCK
      ?auto_33078 - BLOCK
      ?auto_33079 - BLOCK
      ?auto_33080 - BLOCK
      ?auto_33081 - BLOCK
      ?auto_33082 - BLOCK
      ?auto_33083 - BLOCK
    )
    :vars
    (
      ?auto_33084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33083 ?auto_33084 ) ( ON-TABLE ?auto_33077 ) ( ON ?auto_33078 ?auto_33077 ) ( ON ?auto_33079 ?auto_33078 ) ( not ( = ?auto_33077 ?auto_33078 ) ) ( not ( = ?auto_33077 ?auto_33079 ) ) ( not ( = ?auto_33077 ?auto_33080 ) ) ( not ( = ?auto_33077 ?auto_33081 ) ) ( not ( = ?auto_33077 ?auto_33082 ) ) ( not ( = ?auto_33077 ?auto_33083 ) ) ( not ( = ?auto_33077 ?auto_33084 ) ) ( not ( = ?auto_33078 ?auto_33079 ) ) ( not ( = ?auto_33078 ?auto_33080 ) ) ( not ( = ?auto_33078 ?auto_33081 ) ) ( not ( = ?auto_33078 ?auto_33082 ) ) ( not ( = ?auto_33078 ?auto_33083 ) ) ( not ( = ?auto_33078 ?auto_33084 ) ) ( not ( = ?auto_33079 ?auto_33080 ) ) ( not ( = ?auto_33079 ?auto_33081 ) ) ( not ( = ?auto_33079 ?auto_33082 ) ) ( not ( = ?auto_33079 ?auto_33083 ) ) ( not ( = ?auto_33079 ?auto_33084 ) ) ( not ( = ?auto_33080 ?auto_33081 ) ) ( not ( = ?auto_33080 ?auto_33082 ) ) ( not ( = ?auto_33080 ?auto_33083 ) ) ( not ( = ?auto_33080 ?auto_33084 ) ) ( not ( = ?auto_33081 ?auto_33082 ) ) ( not ( = ?auto_33081 ?auto_33083 ) ) ( not ( = ?auto_33081 ?auto_33084 ) ) ( not ( = ?auto_33082 ?auto_33083 ) ) ( not ( = ?auto_33082 ?auto_33084 ) ) ( not ( = ?auto_33083 ?auto_33084 ) ) ( ON ?auto_33082 ?auto_33083 ) ( ON ?auto_33081 ?auto_33082 ) ( CLEAR ?auto_33079 ) ( ON ?auto_33080 ?auto_33081 ) ( CLEAR ?auto_33080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33077 ?auto_33078 ?auto_33079 ?auto_33080 )
      ( MAKE-7PILE ?auto_33077 ?auto_33078 ?auto_33079 ?auto_33080 ?auto_33081 ?auto_33082 ?auto_33083 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_33107 - BLOCK
      ?auto_33108 - BLOCK
      ?auto_33109 - BLOCK
      ?auto_33110 - BLOCK
      ?auto_33111 - BLOCK
      ?auto_33112 - BLOCK
      ?auto_33113 - BLOCK
    )
    :vars
    (
      ?auto_33114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33113 ?auto_33114 ) ( ON-TABLE ?auto_33107 ) ( ON ?auto_33108 ?auto_33107 ) ( not ( = ?auto_33107 ?auto_33108 ) ) ( not ( = ?auto_33107 ?auto_33109 ) ) ( not ( = ?auto_33107 ?auto_33110 ) ) ( not ( = ?auto_33107 ?auto_33111 ) ) ( not ( = ?auto_33107 ?auto_33112 ) ) ( not ( = ?auto_33107 ?auto_33113 ) ) ( not ( = ?auto_33107 ?auto_33114 ) ) ( not ( = ?auto_33108 ?auto_33109 ) ) ( not ( = ?auto_33108 ?auto_33110 ) ) ( not ( = ?auto_33108 ?auto_33111 ) ) ( not ( = ?auto_33108 ?auto_33112 ) ) ( not ( = ?auto_33108 ?auto_33113 ) ) ( not ( = ?auto_33108 ?auto_33114 ) ) ( not ( = ?auto_33109 ?auto_33110 ) ) ( not ( = ?auto_33109 ?auto_33111 ) ) ( not ( = ?auto_33109 ?auto_33112 ) ) ( not ( = ?auto_33109 ?auto_33113 ) ) ( not ( = ?auto_33109 ?auto_33114 ) ) ( not ( = ?auto_33110 ?auto_33111 ) ) ( not ( = ?auto_33110 ?auto_33112 ) ) ( not ( = ?auto_33110 ?auto_33113 ) ) ( not ( = ?auto_33110 ?auto_33114 ) ) ( not ( = ?auto_33111 ?auto_33112 ) ) ( not ( = ?auto_33111 ?auto_33113 ) ) ( not ( = ?auto_33111 ?auto_33114 ) ) ( not ( = ?auto_33112 ?auto_33113 ) ) ( not ( = ?auto_33112 ?auto_33114 ) ) ( not ( = ?auto_33113 ?auto_33114 ) ) ( ON ?auto_33112 ?auto_33113 ) ( ON ?auto_33111 ?auto_33112 ) ( ON ?auto_33110 ?auto_33111 ) ( CLEAR ?auto_33108 ) ( ON ?auto_33109 ?auto_33110 ) ( CLEAR ?auto_33109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33107 ?auto_33108 ?auto_33109 )
      ( MAKE-7PILE ?auto_33107 ?auto_33108 ?auto_33109 ?auto_33110 ?auto_33111 ?auto_33112 ?auto_33113 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_33137 - BLOCK
      ?auto_33138 - BLOCK
      ?auto_33139 - BLOCK
      ?auto_33140 - BLOCK
      ?auto_33141 - BLOCK
      ?auto_33142 - BLOCK
      ?auto_33143 - BLOCK
    )
    :vars
    (
      ?auto_33144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33143 ?auto_33144 ) ( ON-TABLE ?auto_33137 ) ( not ( = ?auto_33137 ?auto_33138 ) ) ( not ( = ?auto_33137 ?auto_33139 ) ) ( not ( = ?auto_33137 ?auto_33140 ) ) ( not ( = ?auto_33137 ?auto_33141 ) ) ( not ( = ?auto_33137 ?auto_33142 ) ) ( not ( = ?auto_33137 ?auto_33143 ) ) ( not ( = ?auto_33137 ?auto_33144 ) ) ( not ( = ?auto_33138 ?auto_33139 ) ) ( not ( = ?auto_33138 ?auto_33140 ) ) ( not ( = ?auto_33138 ?auto_33141 ) ) ( not ( = ?auto_33138 ?auto_33142 ) ) ( not ( = ?auto_33138 ?auto_33143 ) ) ( not ( = ?auto_33138 ?auto_33144 ) ) ( not ( = ?auto_33139 ?auto_33140 ) ) ( not ( = ?auto_33139 ?auto_33141 ) ) ( not ( = ?auto_33139 ?auto_33142 ) ) ( not ( = ?auto_33139 ?auto_33143 ) ) ( not ( = ?auto_33139 ?auto_33144 ) ) ( not ( = ?auto_33140 ?auto_33141 ) ) ( not ( = ?auto_33140 ?auto_33142 ) ) ( not ( = ?auto_33140 ?auto_33143 ) ) ( not ( = ?auto_33140 ?auto_33144 ) ) ( not ( = ?auto_33141 ?auto_33142 ) ) ( not ( = ?auto_33141 ?auto_33143 ) ) ( not ( = ?auto_33141 ?auto_33144 ) ) ( not ( = ?auto_33142 ?auto_33143 ) ) ( not ( = ?auto_33142 ?auto_33144 ) ) ( not ( = ?auto_33143 ?auto_33144 ) ) ( ON ?auto_33142 ?auto_33143 ) ( ON ?auto_33141 ?auto_33142 ) ( ON ?auto_33140 ?auto_33141 ) ( ON ?auto_33139 ?auto_33140 ) ( CLEAR ?auto_33137 ) ( ON ?auto_33138 ?auto_33139 ) ( CLEAR ?auto_33138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33137 ?auto_33138 )
      ( MAKE-7PILE ?auto_33137 ?auto_33138 ?auto_33139 ?auto_33140 ?auto_33141 ?auto_33142 ?auto_33143 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_33167 - BLOCK
      ?auto_33168 - BLOCK
      ?auto_33169 - BLOCK
      ?auto_33170 - BLOCK
      ?auto_33171 - BLOCK
      ?auto_33172 - BLOCK
      ?auto_33173 - BLOCK
    )
    :vars
    (
      ?auto_33174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33173 ?auto_33174 ) ( not ( = ?auto_33167 ?auto_33168 ) ) ( not ( = ?auto_33167 ?auto_33169 ) ) ( not ( = ?auto_33167 ?auto_33170 ) ) ( not ( = ?auto_33167 ?auto_33171 ) ) ( not ( = ?auto_33167 ?auto_33172 ) ) ( not ( = ?auto_33167 ?auto_33173 ) ) ( not ( = ?auto_33167 ?auto_33174 ) ) ( not ( = ?auto_33168 ?auto_33169 ) ) ( not ( = ?auto_33168 ?auto_33170 ) ) ( not ( = ?auto_33168 ?auto_33171 ) ) ( not ( = ?auto_33168 ?auto_33172 ) ) ( not ( = ?auto_33168 ?auto_33173 ) ) ( not ( = ?auto_33168 ?auto_33174 ) ) ( not ( = ?auto_33169 ?auto_33170 ) ) ( not ( = ?auto_33169 ?auto_33171 ) ) ( not ( = ?auto_33169 ?auto_33172 ) ) ( not ( = ?auto_33169 ?auto_33173 ) ) ( not ( = ?auto_33169 ?auto_33174 ) ) ( not ( = ?auto_33170 ?auto_33171 ) ) ( not ( = ?auto_33170 ?auto_33172 ) ) ( not ( = ?auto_33170 ?auto_33173 ) ) ( not ( = ?auto_33170 ?auto_33174 ) ) ( not ( = ?auto_33171 ?auto_33172 ) ) ( not ( = ?auto_33171 ?auto_33173 ) ) ( not ( = ?auto_33171 ?auto_33174 ) ) ( not ( = ?auto_33172 ?auto_33173 ) ) ( not ( = ?auto_33172 ?auto_33174 ) ) ( not ( = ?auto_33173 ?auto_33174 ) ) ( ON ?auto_33172 ?auto_33173 ) ( ON ?auto_33171 ?auto_33172 ) ( ON ?auto_33170 ?auto_33171 ) ( ON ?auto_33169 ?auto_33170 ) ( ON ?auto_33168 ?auto_33169 ) ( ON ?auto_33167 ?auto_33168 ) ( CLEAR ?auto_33167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33167 )
      ( MAKE-7PILE ?auto_33167 ?auto_33168 ?auto_33169 ?auto_33170 ?auto_33171 ?auto_33172 ?auto_33173 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33198 - BLOCK
      ?auto_33199 - BLOCK
      ?auto_33200 - BLOCK
      ?auto_33201 - BLOCK
      ?auto_33202 - BLOCK
      ?auto_33203 - BLOCK
      ?auto_33204 - BLOCK
      ?auto_33205 - BLOCK
    )
    :vars
    (
      ?auto_33206 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33204 ) ( ON ?auto_33205 ?auto_33206 ) ( CLEAR ?auto_33205 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33198 ) ( ON ?auto_33199 ?auto_33198 ) ( ON ?auto_33200 ?auto_33199 ) ( ON ?auto_33201 ?auto_33200 ) ( ON ?auto_33202 ?auto_33201 ) ( ON ?auto_33203 ?auto_33202 ) ( ON ?auto_33204 ?auto_33203 ) ( not ( = ?auto_33198 ?auto_33199 ) ) ( not ( = ?auto_33198 ?auto_33200 ) ) ( not ( = ?auto_33198 ?auto_33201 ) ) ( not ( = ?auto_33198 ?auto_33202 ) ) ( not ( = ?auto_33198 ?auto_33203 ) ) ( not ( = ?auto_33198 ?auto_33204 ) ) ( not ( = ?auto_33198 ?auto_33205 ) ) ( not ( = ?auto_33198 ?auto_33206 ) ) ( not ( = ?auto_33199 ?auto_33200 ) ) ( not ( = ?auto_33199 ?auto_33201 ) ) ( not ( = ?auto_33199 ?auto_33202 ) ) ( not ( = ?auto_33199 ?auto_33203 ) ) ( not ( = ?auto_33199 ?auto_33204 ) ) ( not ( = ?auto_33199 ?auto_33205 ) ) ( not ( = ?auto_33199 ?auto_33206 ) ) ( not ( = ?auto_33200 ?auto_33201 ) ) ( not ( = ?auto_33200 ?auto_33202 ) ) ( not ( = ?auto_33200 ?auto_33203 ) ) ( not ( = ?auto_33200 ?auto_33204 ) ) ( not ( = ?auto_33200 ?auto_33205 ) ) ( not ( = ?auto_33200 ?auto_33206 ) ) ( not ( = ?auto_33201 ?auto_33202 ) ) ( not ( = ?auto_33201 ?auto_33203 ) ) ( not ( = ?auto_33201 ?auto_33204 ) ) ( not ( = ?auto_33201 ?auto_33205 ) ) ( not ( = ?auto_33201 ?auto_33206 ) ) ( not ( = ?auto_33202 ?auto_33203 ) ) ( not ( = ?auto_33202 ?auto_33204 ) ) ( not ( = ?auto_33202 ?auto_33205 ) ) ( not ( = ?auto_33202 ?auto_33206 ) ) ( not ( = ?auto_33203 ?auto_33204 ) ) ( not ( = ?auto_33203 ?auto_33205 ) ) ( not ( = ?auto_33203 ?auto_33206 ) ) ( not ( = ?auto_33204 ?auto_33205 ) ) ( not ( = ?auto_33204 ?auto_33206 ) ) ( not ( = ?auto_33205 ?auto_33206 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33205 ?auto_33206 )
      ( !STACK ?auto_33205 ?auto_33204 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33215 - BLOCK
      ?auto_33216 - BLOCK
      ?auto_33217 - BLOCK
      ?auto_33218 - BLOCK
      ?auto_33219 - BLOCK
      ?auto_33220 - BLOCK
      ?auto_33221 - BLOCK
      ?auto_33222 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33221 ) ( ON-TABLE ?auto_33222 ) ( CLEAR ?auto_33222 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33215 ) ( ON ?auto_33216 ?auto_33215 ) ( ON ?auto_33217 ?auto_33216 ) ( ON ?auto_33218 ?auto_33217 ) ( ON ?auto_33219 ?auto_33218 ) ( ON ?auto_33220 ?auto_33219 ) ( ON ?auto_33221 ?auto_33220 ) ( not ( = ?auto_33215 ?auto_33216 ) ) ( not ( = ?auto_33215 ?auto_33217 ) ) ( not ( = ?auto_33215 ?auto_33218 ) ) ( not ( = ?auto_33215 ?auto_33219 ) ) ( not ( = ?auto_33215 ?auto_33220 ) ) ( not ( = ?auto_33215 ?auto_33221 ) ) ( not ( = ?auto_33215 ?auto_33222 ) ) ( not ( = ?auto_33216 ?auto_33217 ) ) ( not ( = ?auto_33216 ?auto_33218 ) ) ( not ( = ?auto_33216 ?auto_33219 ) ) ( not ( = ?auto_33216 ?auto_33220 ) ) ( not ( = ?auto_33216 ?auto_33221 ) ) ( not ( = ?auto_33216 ?auto_33222 ) ) ( not ( = ?auto_33217 ?auto_33218 ) ) ( not ( = ?auto_33217 ?auto_33219 ) ) ( not ( = ?auto_33217 ?auto_33220 ) ) ( not ( = ?auto_33217 ?auto_33221 ) ) ( not ( = ?auto_33217 ?auto_33222 ) ) ( not ( = ?auto_33218 ?auto_33219 ) ) ( not ( = ?auto_33218 ?auto_33220 ) ) ( not ( = ?auto_33218 ?auto_33221 ) ) ( not ( = ?auto_33218 ?auto_33222 ) ) ( not ( = ?auto_33219 ?auto_33220 ) ) ( not ( = ?auto_33219 ?auto_33221 ) ) ( not ( = ?auto_33219 ?auto_33222 ) ) ( not ( = ?auto_33220 ?auto_33221 ) ) ( not ( = ?auto_33220 ?auto_33222 ) ) ( not ( = ?auto_33221 ?auto_33222 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_33222 )
      ( !STACK ?auto_33222 ?auto_33221 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33231 - BLOCK
      ?auto_33232 - BLOCK
      ?auto_33233 - BLOCK
      ?auto_33234 - BLOCK
      ?auto_33235 - BLOCK
      ?auto_33236 - BLOCK
      ?auto_33237 - BLOCK
      ?auto_33238 - BLOCK
    )
    :vars
    (
      ?auto_33239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33238 ?auto_33239 ) ( ON-TABLE ?auto_33231 ) ( ON ?auto_33232 ?auto_33231 ) ( ON ?auto_33233 ?auto_33232 ) ( ON ?auto_33234 ?auto_33233 ) ( ON ?auto_33235 ?auto_33234 ) ( ON ?auto_33236 ?auto_33235 ) ( not ( = ?auto_33231 ?auto_33232 ) ) ( not ( = ?auto_33231 ?auto_33233 ) ) ( not ( = ?auto_33231 ?auto_33234 ) ) ( not ( = ?auto_33231 ?auto_33235 ) ) ( not ( = ?auto_33231 ?auto_33236 ) ) ( not ( = ?auto_33231 ?auto_33237 ) ) ( not ( = ?auto_33231 ?auto_33238 ) ) ( not ( = ?auto_33231 ?auto_33239 ) ) ( not ( = ?auto_33232 ?auto_33233 ) ) ( not ( = ?auto_33232 ?auto_33234 ) ) ( not ( = ?auto_33232 ?auto_33235 ) ) ( not ( = ?auto_33232 ?auto_33236 ) ) ( not ( = ?auto_33232 ?auto_33237 ) ) ( not ( = ?auto_33232 ?auto_33238 ) ) ( not ( = ?auto_33232 ?auto_33239 ) ) ( not ( = ?auto_33233 ?auto_33234 ) ) ( not ( = ?auto_33233 ?auto_33235 ) ) ( not ( = ?auto_33233 ?auto_33236 ) ) ( not ( = ?auto_33233 ?auto_33237 ) ) ( not ( = ?auto_33233 ?auto_33238 ) ) ( not ( = ?auto_33233 ?auto_33239 ) ) ( not ( = ?auto_33234 ?auto_33235 ) ) ( not ( = ?auto_33234 ?auto_33236 ) ) ( not ( = ?auto_33234 ?auto_33237 ) ) ( not ( = ?auto_33234 ?auto_33238 ) ) ( not ( = ?auto_33234 ?auto_33239 ) ) ( not ( = ?auto_33235 ?auto_33236 ) ) ( not ( = ?auto_33235 ?auto_33237 ) ) ( not ( = ?auto_33235 ?auto_33238 ) ) ( not ( = ?auto_33235 ?auto_33239 ) ) ( not ( = ?auto_33236 ?auto_33237 ) ) ( not ( = ?auto_33236 ?auto_33238 ) ) ( not ( = ?auto_33236 ?auto_33239 ) ) ( not ( = ?auto_33237 ?auto_33238 ) ) ( not ( = ?auto_33237 ?auto_33239 ) ) ( not ( = ?auto_33238 ?auto_33239 ) ) ( CLEAR ?auto_33236 ) ( ON ?auto_33237 ?auto_33238 ) ( CLEAR ?auto_33237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_33231 ?auto_33232 ?auto_33233 ?auto_33234 ?auto_33235 ?auto_33236 ?auto_33237 )
      ( MAKE-8PILE ?auto_33231 ?auto_33232 ?auto_33233 ?auto_33234 ?auto_33235 ?auto_33236 ?auto_33237 ?auto_33238 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33248 - BLOCK
      ?auto_33249 - BLOCK
      ?auto_33250 - BLOCK
      ?auto_33251 - BLOCK
      ?auto_33252 - BLOCK
      ?auto_33253 - BLOCK
      ?auto_33254 - BLOCK
      ?auto_33255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33255 ) ( ON-TABLE ?auto_33248 ) ( ON ?auto_33249 ?auto_33248 ) ( ON ?auto_33250 ?auto_33249 ) ( ON ?auto_33251 ?auto_33250 ) ( ON ?auto_33252 ?auto_33251 ) ( ON ?auto_33253 ?auto_33252 ) ( not ( = ?auto_33248 ?auto_33249 ) ) ( not ( = ?auto_33248 ?auto_33250 ) ) ( not ( = ?auto_33248 ?auto_33251 ) ) ( not ( = ?auto_33248 ?auto_33252 ) ) ( not ( = ?auto_33248 ?auto_33253 ) ) ( not ( = ?auto_33248 ?auto_33254 ) ) ( not ( = ?auto_33248 ?auto_33255 ) ) ( not ( = ?auto_33249 ?auto_33250 ) ) ( not ( = ?auto_33249 ?auto_33251 ) ) ( not ( = ?auto_33249 ?auto_33252 ) ) ( not ( = ?auto_33249 ?auto_33253 ) ) ( not ( = ?auto_33249 ?auto_33254 ) ) ( not ( = ?auto_33249 ?auto_33255 ) ) ( not ( = ?auto_33250 ?auto_33251 ) ) ( not ( = ?auto_33250 ?auto_33252 ) ) ( not ( = ?auto_33250 ?auto_33253 ) ) ( not ( = ?auto_33250 ?auto_33254 ) ) ( not ( = ?auto_33250 ?auto_33255 ) ) ( not ( = ?auto_33251 ?auto_33252 ) ) ( not ( = ?auto_33251 ?auto_33253 ) ) ( not ( = ?auto_33251 ?auto_33254 ) ) ( not ( = ?auto_33251 ?auto_33255 ) ) ( not ( = ?auto_33252 ?auto_33253 ) ) ( not ( = ?auto_33252 ?auto_33254 ) ) ( not ( = ?auto_33252 ?auto_33255 ) ) ( not ( = ?auto_33253 ?auto_33254 ) ) ( not ( = ?auto_33253 ?auto_33255 ) ) ( not ( = ?auto_33254 ?auto_33255 ) ) ( CLEAR ?auto_33253 ) ( ON ?auto_33254 ?auto_33255 ) ( CLEAR ?auto_33254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_33248 ?auto_33249 ?auto_33250 ?auto_33251 ?auto_33252 ?auto_33253 ?auto_33254 )
      ( MAKE-8PILE ?auto_33248 ?auto_33249 ?auto_33250 ?auto_33251 ?auto_33252 ?auto_33253 ?auto_33254 ?auto_33255 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33264 - BLOCK
      ?auto_33265 - BLOCK
      ?auto_33266 - BLOCK
      ?auto_33267 - BLOCK
      ?auto_33268 - BLOCK
      ?auto_33269 - BLOCK
      ?auto_33270 - BLOCK
      ?auto_33271 - BLOCK
    )
    :vars
    (
      ?auto_33272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33271 ?auto_33272 ) ( ON-TABLE ?auto_33264 ) ( ON ?auto_33265 ?auto_33264 ) ( ON ?auto_33266 ?auto_33265 ) ( ON ?auto_33267 ?auto_33266 ) ( ON ?auto_33268 ?auto_33267 ) ( not ( = ?auto_33264 ?auto_33265 ) ) ( not ( = ?auto_33264 ?auto_33266 ) ) ( not ( = ?auto_33264 ?auto_33267 ) ) ( not ( = ?auto_33264 ?auto_33268 ) ) ( not ( = ?auto_33264 ?auto_33269 ) ) ( not ( = ?auto_33264 ?auto_33270 ) ) ( not ( = ?auto_33264 ?auto_33271 ) ) ( not ( = ?auto_33264 ?auto_33272 ) ) ( not ( = ?auto_33265 ?auto_33266 ) ) ( not ( = ?auto_33265 ?auto_33267 ) ) ( not ( = ?auto_33265 ?auto_33268 ) ) ( not ( = ?auto_33265 ?auto_33269 ) ) ( not ( = ?auto_33265 ?auto_33270 ) ) ( not ( = ?auto_33265 ?auto_33271 ) ) ( not ( = ?auto_33265 ?auto_33272 ) ) ( not ( = ?auto_33266 ?auto_33267 ) ) ( not ( = ?auto_33266 ?auto_33268 ) ) ( not ( = ?auto_33266 ?auto_33269 ) ) ( not ( = ?auto_33266 ?auto_33270 ) ) ( not ( = ?auto_33266 ?auto_33271 ) ) ( not ( = ?auto_33266 ?auto_33272 ) ) ( not ( = ?auto_33267 ?auto_33268 ) ) ( not ( = ?auto_33267 ?auto_33269 ) ) ( not ( = ?auto_33267 ?auto_33270 ) ) ( not ( = ?auto_33267 ?auto_33271 ) ) ( not ( = ?auto_33267 ?auto_33272 ) ) ( not ( = ?auto_33268 ?auto_33269 ) ) ( not ( = ?auto_33268 ?auto_33270 ) ) ( not ( = ?auto_33268 ?auto_33271 ) ) ( not ( = ?auto_33268 ?auto_33272 ) ) ( not ( = ?auto_33269 ?auto_33270 ) ) ( not ( = ?auto_33269 ?auto_33271 ) ) ( not ( = ?auto_33269 ?auto_33272 ) ) ( not ( = ?auto_33270 ?auto_33271 ) ) ( not ( = ?auto_33270 ?auto_33272 ) ) ( not ( = ?auto_33271 ?auto_33272 ) ) ( ON ?auto_33270 ?auto_33271 ) ( CLEAR ?auto_33268 ) ( ON ?auto_33269 ?auto_33270 ) ( CLEAR ?auto_33269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_33264 ?auto_33265 ?auto_33266 ?auto_33267 ?auto_33268 ?auto_33269 )
      ( MAKE-8PILE ?auto_33264 ?auto_33265 ?auto_33266 ?auto_33267 ?auto_33268 ?auto_33269 ?auto_33270 ?auto_33271 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33281 - BLOCK
      ?auto_33282 - BLOCK
      ?auto_33283 - BLOCK
      ?auto_33284 - BLOCK
      ?auto_33285 - BLOCK
      ?auto_33286 - BLOCK
      ?auto_33287 - BLOCK
      ?auto_33288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33288 ) ( ON-TABLE ?auto_33281 ) ( ON ?auto_33282 ?auto_33281 ) ( ON ?auto_33283 ?auto_33282 ) ( ON ?auto_33284 ?auto_33283 ) ( ON ?auto_33285 ?auto_33284 ) ( not ( = ?auto_33281 ?auto_33282 ) ) ( not ( = ?auto_33281 ?auto_33283 ) ) ( not ( = ?auto_33281 ?auto_33284 ) ) ( not ( = ?auto_33281 ?auto_33285 ) ) ( not ( = ?auto_33281 ?auto_33286 ) ) ( not ( = ?auto_33281 ?auto_33287 ) ) ( not ( = ?auto_33281 ?auto_33288 ) ) ( not ( = ?auto_33282 ?auto_33283 ) ) ( not ( = ?auto_33282 ?auto_33284 ) ) ( not ( = ?auto_33282 ?auto_33285 ) ) ( not ( = ?auto_33282 ?auto_33286 ) ) ( not ( = ?auto_33282 ?auto_33287 ) ) ( not ( = ?auto_33282 ?auto_33288 ) ) ( not ( = ?auto_33283 ?auto_33284 ) ) ( not ( = ?auto_33283 ?auto_33285 ) ) ( not ( = ?auto_33283 ?auto_33286 ) ) ( not ( = ?auto_33283 ?auto_33287 ) ) ( not ( = ?auto_33283 ?auto_33288 ) ) ( not ( = ?auto_33284 ?auto_33285 ) ) ( not ( = ?auto_33284 ?auto_33286 ) ) ( not ( = ?auto_33284 ?auto_33287 ) ) ( not ( = ?auto_33284 ?auto_33288 ) ) ( not ( = ?auto_33285 ?auto_33286 ) ) ( not ( = ?auto_33285 ?auto_33287 ) ) ( not ( = ?auto_33285 ?auto_33288 ) ) ( not ( = ?auto_33286 ?auto_33287 ) ) ( not ( = ?auto_33286 ?auto_33288 ) ) ( not ( = ?auto_33287 ?auto_33288 ) ) ( ON ?auto_33287 ?auto_33288 ) ( CLEAR ?auto_33285 ) ( ON ?auto_33286 ?auto_33287 ) ( CLEAR ?auto_33286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_33281 ?auto_33282 ?auto_33283 ?auto_33284 ?auto_33285 ?auto_33286 )
      ( MAKE-8PILE ?auto_33281 ?auto_33282 ?auto_33283 ?auto_33284 ?auto_33285 ?auto_33286 ?auto_33287 ?auto_33288 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33297 - BLOCK
      ?auto_33298 - BLOCK
      ?auto_33299 - BLOCK
      ?auto_33300 - BLOCK
      ?auto_33301 - BLOCK
      ?auto_33302 - BLOCK
      ?auto_33303 - BLOCK
      ?auto_33304 - BLOCK
    )
    :vars
    (
      ?auto_33305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33304 ?auto_33305 ) ( ON-TABLE ?auto_33297 ) ( ON ?auto_33298 ?auto_33297 ) ( ON ?auto_33299 ?auto_33298 ) ( ON ?auto_33300 ?auto_33299 ) ( not ( = ?auto_33297 ?auto_33298 ) ) ( not ( = ?auto_33297 ?auto_33299 ) ) ( not ( = ?auto_33297 ?auto_33300 ) ) ( not ( = ?auto_33297 ?auto_33301 ) ) ( not ( = ?auto_33297 ?auto_33302 ) ) ( not ( = ?auto_33297 ?auto_33303 ) ) ( not ( = ?auto_33297 ?auto_33304 ) ) ( not ( = ?auto_33297 ?auto_33305 ) ) ( not ( = ?auto_33298 ?auto_33299 ) ) ( not ( = ?auto_33298 ?auto_33300 ) ) ( not ( = ?auto_33298 ?auto_33301 ) ) ( not ( = ?auto_33298 ?auto_33302 ) ) ( not ( = ?auto_33298 ?auto_33303 ) ) ( not ( = ?auto_33298 ?auto_33304 ) ) ( not ( = ?auto_33298 ?auto_33305 ) ) ( not ( = ?auto_33299 ?auto_33300 ) ) ( not ( = ?auto_33299 ?auto_33301 ) ) ( not ( = ?auto_33299 ?auto_33302 ) ) ( not ( = ?auto_33299 ?auto_33303 ) ) ( not ( = ?auto_33299 ?auto_33304 ) ) ( not ( = ?auto_33299 ?auto_33305 ) ) ( not ( = ?auto_33300 ?auto_33301 ) ) ( not ( = ?auto_33300 ?auto_33302 ) ) ( not ( = ?auto_33300 ?auto_33303 ) ) ( not ( = ?auto_33300 ?auto_33304 ) ) ( not ( = ?auto_33300 ?auto_33305 ) ) ( not ( = ?auto_33301 ?auto_33302 ) ) ( not ( = ?auto_33301 ?auto_33303 ) ) ( not ( = ?auto_33301 ?auto_33304 ) ) ( not ( = ?auto_33301 ?auto_33305 ) ) ( not ( = ?auto_33302 ?auto_33303 ) ) ( not ( = ?auto_33302 ?auto_33304 ) ) ( not ( = ?auto_33302 ?auto_33305 ) ) ( not ( = ?auto_33303 ?auto_33304 ) ) ( not ( = ?auto_33303 ?auto_33305 ) ) ( not ( = ?auto_33304 ?auto_33305 ) ) ( ON ?auto_33303 ?auto_33304 ) ( ON ?auto_33302 ?auto_33303 ) ( CLEAR ?auto_33300 ) ( ON ?auto_33301 ?auto_33302 ) ( CLEAR ?auto_33301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33297 ?auto_33298 ?auto_33299 ?auto_33300 ?auto_33301 )
      ( MAKE-8PILE ?auto_33297 ?auto_33298 ?auto_33299 ?auto_33300 ?auto_33301 ?auto_33302 ?auto_33303 ?auto_33304 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33314 - BLOCK
      ?auto_33315 - BLOCK
      ?auto_33316 - BLOCK
      ?auto_33317 - BLOCK
      ?auto_33318 - BLOCK
      ?auto_33319 - BLOCK
      ?auto_33320 - BLOCK
      ?auto_33321 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33321 ) ( ON-TABLE ?auto_33314 ) ( ON ?auto_33315 ?auto_33314 ) ( ON ?auto_33316 ?auto_33315 ) ( ON ?auto_33317 ?auto_33316 ) ( not ( = ?auto_33314 ?auto_33315 ) ) ( not ( = ?auto_33314 ?auto_33316 ) ) ( not ( = ?auto_33314 ?auto_33317 ) ) ( not ( = ?auto_33314 ?auto_33318 ) ) ( not ( = ?auto_33314 ?auto_33319 ) ) ( not ( = ?auto_33314 ?auto_33320 ) ) ( not ( = ?auto_33314 ?auto_33321 ) ) ( not ( = ?auto_33315 ?auto_33316 ) ) ( not ( = ?auto_33315 ?auto_33317 ) ) ( not ( = ?auto_33315 ?auto_33318 ) ) ( not ( = ?auto_33315 ?auto_33319 ) ) ( not ( = ?auto_33315 ?auto_33320 ) ) ( not ( = ?auto_33315 ?auto_33321 ) ) ( not ( = ?auto_33316 ?auto_33317 ) ) ( not ( = ?auto_33316 ?auto_33318 ) ) ( not ( = ?auto_33316 ?auto_33319 ) ) ( not ( = ?auto_33316 ?auto_33320 ) ) ( not ( = ?auto_33316 ?auto_33321 ) ) ( not ( = ?auto_33317 ?auto_33318 ) ) ( not ( = ?auto_33317 ?auto_33319 ) ) ( not ( = ?auto_33317 ?auto_33320 ) ) ( not ( = ?auto_33317 ?auto_33321 ) ) ( not ( = ?auto_33318 ?auto_33319 ) ) ( not ( = ?auto_33318 ?auto_33320 ) ) ( not ( = ?auto_33318 ?auto_33321 ) ) ( not ( = ?auto_33319 ?auto_33320 ) ) ( not ( = ?auto_33319 ?auto_33321 ) ) ( not ( = ?auto_33320 ?auto_33321 ) ) ( ON ?auto_33320 ?auto_33321 ) ( ON ?auto_33319 ?auto_33320 ) ( CLEAR ?auto_33317 ) ( ON ?auto_33318 ?auto_33319 ) ( CLEAR ?auto_33318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33314 ?auto_33315 ?auto_33316 ?auto_33317 ?auto_33318 )
      ( MAKE-8PILE ?auto_33314 ?auto_33315 ?auto_33316 ?auto_33317 ?auto_33318 ?auto_33319 ?auto_33320 ?auto_33321 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33330 - BLOCK
      ?auto_33331 - BLOCK
      ?auto_33332 - BLOCK
      ?auto_33333 - BLOCK
      ?auto_33334 - BLOCK
      ?auto_33335 - BLOCK
      ?auto_33336 - BLOCK
      ?auto_33337 - BLOCK
    )
    :vars
    (
      ?auto_33338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33337 ?auto_33338 ) ( ON-TABLE ?auto_33330 ) ( ON ?auto_33331 ?auto_33330 ) ( ON ?auto_33332 ?auto_33331 ) ( not ( = ?auto_33330 ?auto_33331 ) ) ( not ( = ?auto_33330 ?auto_33332 ) ) ( not ( = ?auto_33330 ?auto_33333 ) ) ( not ( = ?auto_33330 ?auto_33334 ) ) ( not ( = ?auto_33330 ?auto_33335 ) ) ( not ( = ?auto_33330 ?auto_33336 ) ) ( not ( = ?auto_33330 ?auto_33337 ) ) ( not ( = ?auto_33330 ?auto_33338 ) ) ( not ( = ?auto_33331 ?auto_33332 ) ) ( not ( = ?auto_33331 ?auto_33333 ) ) ( not ( = ?auto_33331 ?auto_33334 ) ) ( not ( = ?auto_33331 ?auto_33335 ) ) ( not ( = ?auto_33331 ?auto_33336 ) ) ( not ( = ?auto_33331 ?auto_33337 ) ) ( not ( = ?auto_33331 ?auto_33338 ) ) ( not ( = ?auto_33332 ?auto_33333 ) ) ( not ( = ?auto_33332 ?auto_33334 ) ) ( not ( = ?auto_33332 ?auto_33335 ) ) ( not ( = ?auto_33332 ?auto_33336 ) ) ( not ( = ?auto_33332 ?auto_33337 ) ) ( not ( = ?auto_33332 ?auto_33338 ) ) ( not ( = ?auto_33333 ?auto_33334 ) ) ( not ( = ?auto_33333 ?auto_33335 ) ) ( not ( = ?auto_33333 ?auto_33336 ) ) ( not ( = ?auto_33333 ?auto_33337 ) ) ( not ( = ?auto_33333 ?auto_33338 ) ) ( not ( = ?auto_33334 ?auto_33335 ) ) ( not ( = ?auto_33334 ?auto_33336 ) ) ( not ( = ?auto_33334 ?auto_33337 ) ) ( not ( = ?auto_33334 ?auto_33338 ) ) ( not ( = ?auto_33335 ?auto_33336 ) ) ( not ( = ?auto_33335 ?auto_33337 ) ) ( not ( = ?auto_33335 ?auto_33338 ) ) ( not ( = ?auto_33336 ?auto_33337 ) ) ( not ( = ?auto_33336 ?auto_33338 ) ) ( not ( = ?auto_33337 ?auto_33338 ) ) ( ON ?auto_33336 ?auto_33337 ) ( ON ?auto_33335 ?auto_33336 ) ( ON ?auto_33334 ?auto_33335 ) ( CLEAR ?auto_33332 ) ( ON ?auto_33333 ?auto_33334 ) ( CLEAR ?auto_33333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33330 ?auto_33331 ?auto_33332 ?auto_33333 )
      ( MAKE-8PILE ?auto_33330 ?auto_33331 ?auto_33332 ?auto_33333 ?auto_33334 ?auto_33335 ?auto_33336 ?auto_33337 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33347 - BLOCK
      ?auto_33348 - BLOCK
      ?auto_33349 - BLOCK
      ?auto_33350 - BLOCK
      ?auto_33351 - BLOCK
      ?auto_33352 - BLOCK
      ?auto_33353 - BLOCK
      ?auto_33354 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33354 ) ( ON-TABLE ?auto_33347 ) ( ON ?auto_33348 ?auto_33347 ) ( ON ?auto_33349 ?auto_33348 ) ( not ( = ?auto_33347 ?auto_33348 ) ) ( not ( = ?auto_33347 ?auto_33349 ) ) ( not ( = ?auto_33347 ?auto_33350 ) ) ( not ( = ?auto_33347 ?auto_33351 ) ) ( not ( = ?auto_33347 ?auto_33352 ) ) ( not ( = ?auto_33347 ?auto_33353 ) ) ( not ( = ?auto_33347 ?auto_33354 ) ) ( not ( = ?auto_33348 ?auto_33349 ) ) ( not ( = ?auto_33348 ?auto_33350 ) ) ( not ( = ?auto_33348 ?auto_33351 ) ) ( not ( = ?auto_33348 ?auto_33352 ) ) ( not ( = ?auto_33348 ?auto_33353 ) ) ( not ( = ?auto_33348 ?auto_33354 ) ) ( not ( = ?auto_33349 ?auto_33350 ) ) ( not ( = ?auto_33349 ?auto_33351 ) ) ( not ( = ?auto_33349 ?auto_33352 ) ) ( not ( = ?auto_33349 ?auto_33353 ) ) ( not ( = ?auto_33349 ?auto_33354 ) ) ( not ( = ?auto_33350 ?auto_33351 ) ) ( not ( = ?auto_33350 ?auto_33352 ) ) ( not ( = ?auto_33350 ?auto_33353 ) ) ( not ( = ?auto_33350 ?auto_33354 ) ) ( not ( = ?auto_33351 ?auto_33352 ) ) ( not ( = ?auto_33351 ?auto_33353 ) ) ( not ( = ?auto_33351 ?auto_33354 ) ) ( not ( = ?auto_33352 ?auto_33353 ) ) ( not ( = ?auto_33352 ?auto_33354 ) ) ( not ( = ?auto_33353 ?auto_33354 ) ) ( ON ?auto_33353 ?auto_33354 ) ( ON ?auto_33352 ?auto_33353 ) ( ON ?auto_33351 ?auto_33352 ) ( CLEAR ?auto_33349 ) ( ON ?auto_33350 ?auto_33351 ) ( CLEAR ?auto_33350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33347 ?auto_33348 ?auto_33349 ?auto_33350 )
      ( MAKE-8PILE ?auto_33347 ?auto_33348 ?auto_33349 ?auto_33350 ?auto_33351 ?auto_33352 ?auto_33353 ?auto_33354 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33363 - BLOCK
      ?auto_33364 - BLOCK
      ?auto_33365 - BLOCK
      ?auto_33366 - BLOCK
      ?auto_33367 - BLOCK
      ?auto_33368 - BLOCK
      ?auto_33369 - BLOCK
      ?auto_33370 - BLOCK
    )
    :vars
    (
      ?auto_33371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33370 ?auto_33371 ) ( ON-TABLE ?auto_33363 ) ( ON ?auto_33364 ?auto_33363 ) ( not ( = ?auto_33363 ?auto_33364 ) ) ( not ( = ?auto_33363 ?auto_33365 ) ) ( not ( = ?auto_33363 ?auto_33366 ) ) ( not ( = ?auto_33363 ?auto_33367 ) ) ( not ( = ?auto_33363 ?auto_33368 ) ) ( not ( = ?auto_33363 ?auto_33369 ) ) ( not ( = ?auto_33363 ?auto_33370 ) ) ( not ( = ?auto_33363 ?auto_33371 ) ) ( not ( = ?auto_33364 ?auto_33365 ) ) ( not ( = ?auto_33364 ?auto_33366 ) ) ( not ( = ?auto_33364 ?auto_33367 ) ) ( not ( = ?auto_33364 ?auto_33368 ) ) ( not ( = ?auto_33364 ?auto_33369 ) ) ( not ( = ?auto_33364 ?auto_33370 ) ) ( not ( = ?auto_33364 ?auto_33371 ) ) ( not ( = ?auto_33365 ?auto_33366 ) ) ( not ( = ?auto_33365 ?auto_33367 ) ) ( not ( = ?auto_33365 ?auto_33368 ) ) ( not ( = ?auto_33365 ?auto_33369 ) ) ( not ( = ?auto_33365 ?auto_33370 ) ) ( not ( = ?auto_33365 ?auto_33371 ) ) ( not ( = ?auto_33366 ?auto_33367 ) ) ( not ( = ?auto_33366 ?auto_33368 ) ) ( not ( = ?auto_33366 ?auto_33369 ) ) ( not ( = ?auto_33366 ?auto_33370 ) ) ( not ( = ?auto_33366 ?auto_33371 ) ) ( not ( = ?auto_33367 ?auto_33368 ) ) ( not ( = ?auto_33367 ?auto_33369 ) ) ( not ( = ?auto_33367 ?auto_33370 ) ) ( not ( = ?auto_33367 ?auto_33371 ) ) ( not ( = ?auto_33368 ?auto_33369 ) ) ( not ( = ?auto_33368 ?auto_33370 ) ) ( not ( = ?auto_33368 ?auto_33371 ) ) ( not ( = ?auto_33369 ?auto_33370 ) ) ( not ( = ?auto_33369 ?auto_33371 ) ) ( not ( = ?auto_33370 ?auto_33371 ) ) ( ON ?auto_33369 ?auto_33370 ) ( ON ?auto_33368 ?auto_33369 ) ( ON ?auto_33367 ?auto_33368 ) ( ON ?auto_33366 ?auto_33367 ) ( CLEAR ?auto_33364 ) ( ON ?auto_33365 ?auto_33366 ) ( CLEAR ?auto_33365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33363 ?auto_33364 ?auto_33365 )
      ( MAKE-8PILE ?auto_33363 ?auto_33364 ?auto_33365 ?auto_33366 ?auto_33367 ?auto_33368 ?auto_33369 ?auto_33370 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33380 - BLOCK
      ?auto_33381 - BLOCK
      ?auto_33382 - BLOCK
      ?auto_33383 - BLOCK
      ?auto_33384 - BLOCK
      ?auto_33385 - BLOCK
      ?auto_33386 - BLOCK
      ?auto_33387 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33387 ) ( ON-TABLE ?auto_33380 ) ( ON ?auto_33381 ?auto_33380 ) ( not ( = ?auto_33380 ?auto_33381 ) ) ( not ( = ?auto_33380 ?auto_33382 ) ) ( not ( = ?auto_33380 ?auto_33383 ) ) ( not ( = ?auto_33380 ?auto_33384 ) ) ( not ( = ?auto_33380 ?auto_33385 ) ) ( not ( = ?auto_33380 ?auto_33386 ) ) ( not ( = ?auto_33380 ?auto_33387 ) ) ( not ( = ?auto_33381 ?auto_33382 ) ) ( not ( = ?auto_33381 ?auto_33383 ) ) ( not ( = ?auto_33381 ?auto_33384 ) ) ( not ( = ?auto_33381 ?auto_33385 ) ) ( not ( = ?auto_33381 ?auto_33386 ) ) ( not ( = ?auto_33381 ?auto_33387 ) ) ( not ( = ?auto_33382 ?auto_33383 ) ) ( not ( = ?auto_33382 ?auto_33384 ) ) ( not ( = ?auto_33382 ?auto_33385 ) ) ( not ( = ?auto_33382 ?auto_33386 ) ) ( not ( = ?auto_33382 ?auto_33387 ) ) ( not ( = ?auto_33383 ?auto_33384 ) ) ( not ( = ?auto_33383 ?auto_33385 ) ) ( not ( = ?auto_33383 ?auto_33386 ) ) ( not ( = ?auto_33383 ?auto_33387 ) ) ( not ( = ?auto_33384 ?auto_33385 ) ) ( not ( = ?auto_33384 ?auto_33386 ) ) ( not ( = ?auto_33384 ?auto_33387 ) ) ( not ( = ?auto_33385 ?auto_33386 ) ) ( not ( = ?auto_33385 ?auto_33387 ) ) ( not ( = ?auto_33386 ?auto_33387 ) ) ( ON ?auto_33386 ?auto_33387 ) ( ON ?auto_33385 ?auto_33386 ) ( ON ?auto_33384 ?auto_33385 ) ( ON ?auto_33383 ?auto_33384 ) ( CLEAR ?auto_33381 ) ( ON ?auto_33382 ?auto_33383 ) ( CLEAR ?auto_33382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33380 ?auto_33381 ?auto_33382 )
      ( MAKE-8PILE ?auto_33380 ?auto_33381 ?auto_33382 ?auto_33383 ?auto_33384 ?auto_33385 ?auto_33386 ?auto_33387 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33396 - BLOCK
      ?auto_33397 - BLOCK
      ?auto_33398 - BLOCK
      ?auto_33399 - BLOCK
      ?auto_33400 - BLOCK
      ?auto_33401 - BLOCK
      ?auto_33402 - BLOCK
      ?auto_33403 - BLOCK
    )
    :vars
    (
      ?auto_33404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33403 ?auto_33404 ) ( ON-TABLE ?auto_33396 ) ( not ( = ?auto_33396 ?auto_33397 ) ) ( not ( = ?auto_33396 ?auto_33398 ) ) ( not ( = ?auto_33396 ?auto_33399 ) ) ( not ( = ?auto_33396 ?auto_33400 ) ) ( not ( = ?auto_33396 ?auto_33401 ) ) ( not ( = ?auto_33396 ?auto_33402 ) ) ( not ( = ?auto_33396 ?auto_33403 ) ) ( not ( = ?auto_33396 ?auto_33404 ) ) ( not ( = ?auto_33397 ?auto_33398 ) ) ( not ( = ?auto_33397 ?auto_33399 ) ) ( not ( = ?auto_33397 ?auto_33400 ) ) ( not ( = ?auto_33397 ?auto_33401 ) ) ( not ( = ?auto_33397 ?auto_33402 ) ) ( not ( = ?auto_33397 ?auto_33403 ) ) ( not ( = ?auto_33397 ?auto_33404 ) ) ( not ( = ?auto_33398 ?auto_33399 ) ) ( not ( = ?auto_33398 ?auto_33400 ) ) ( not ( = ?auto_33398 ?auto_33401 ) ) ( not ( = ?auto_33398 ?auto_33402 ) ) ( not ( = ?auto_33398 ?auto_33403 ) ) ( not ( = ?auto_33398 ?auto_33404 ) ) ( not ( = ?auto_33399 ?auto_33400 ) ) ( not ( = ?auto_33399 ?auto_33401 ) ) ( not ( = ?auto_33399 ?auto_33402 ) ) ( not ( = ?auto_33399 ?auto_33403 ) ) ( not ( = ?auto_33399 ?auto_33404 ) ) ( not ( = ?auto_33400 ?auto_33401 ) ) ( not ( = ?auto_33400 ?auto_33402 ) ) ( not ( = ?auto_33400 ?auto_33403 ) ) ( not ( = ?auto_33400 ?auto_33404 ) ) ( not ( = ?auto_33401 ?auto_33402 ) ) ( not ( = ?auto_33401 ?auto_33403 ) ) ( not ( = ?auto_33401 ?auto_33404 ) ) ( not ( = ?auto_33402 ?auto_33403 ) ) ( not ( = ?auto_33402 ?auto_33404 ) ) ( not ( = ?auto_33403 ?auto_33404 ) ) ( ON ?auto_33402 ?auto_33403 ) ( ON ?auto_33401 ?auto_33402 ) ( ON ?auto_33400 ?auto_33401 ) ( ON ?auto_33399 ?auto_33400 ) ( ON ?auto_33398 ?auto_33399 ) ( CLEAR ?auto_33396 ) ( ON ?auto_33397 ?auto_33398 ) ( CLEAR ?auto_33397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33396 ?auto_33397 )
      ( MAKE-8PILE ?auto_33396 ?auto_33397 ?auto_33398 ?auto_33399 ?auto_33400 ?auto_33401 ?auto_33402 ?auto_33403 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33413 - BLOCK
      ?auto_33414 - BLOCK
      ?auto_33415 - BLOCK
      ?auto_33416 - BLOCK
      ?auto_33417 - BLOCK
      ?auto_33418 - BLOCK
      ?auto_33419 - BLOCK
      ?auto_33420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33420 ) ( ON-TABLE ?auto_33413 ) ( not ( = ?auto_33413 ?auto_33414 ) ) ( not ( = ?auto_33413 ?auto_33415 ) ) ( not ( = ?auto_33413 ?auto_33416 ) ) ( not ( = ?auto_33413 ?auto_33417 ) ) ( not ( = ?auto_33413 ?auto_33418 ) ) ( not ( = ?auto_33413 ?auto_33419 ) ) ( not ( = ?auto_33413 ?auto_33420 ) ) ( not ( = ?auto_33414 ?auto_33415 ) ) ( not ( = ?auto_33414 ?auto_33416 ) ) ( not ( = ?auto_33414 ?auto_33417 ) ) ( not ( = ?auto_33414 ?auto_33418 ) ) ( not ( = ?auto_33414 ?auto_33419 ) ) ( not ( = ?auto_33414 ?auto_33420 ) ) ( not ( = ?auto_33415 ?auto_33416 ) ) ( not ( = ?auto_33415 ?auto_33417 ) ) ( not ( = ?auto_33415 ?auto_33418 ) ) ( not ( = ?auto_33415 ?auto_33419 ) ) ( not ( = ?auto_33415 ?auto_33420 ) ) ( not ( = ?auto_33416 ?auto_33417 ) ) ( not ( = ?auto_33416 ?auto_33418 ) ) ( not ( = ?auto_33416 ?auto_33419 ) ) ( not ( = ?auto_33416 ?auto_33420 ) ) ( not ( = ?auto_33417 ?auto_33418 ) ) ( not ( = ?auto_33417 ?auto_33419 ) ) ( not ( = ?auto_33417 ?auto_33420 ) ) ( not ( = ?auto_33418 ?auto_33419 ) ) ( not ( = ?auto_33418 ?auto_33420 ) ) ( not ( = ?auto_33419 ?auto_33420 ) ) ( ON ?auto_33419 ?auto_33420 ) ( ON ?auto_33418 ?auto_33419 ) ( ON ?auto_33417 ?auto_33418 ) ( ON ?auto_33416 ?auto_33417 ) ( ON ?auto_33415 ?auto_33416 ) ( CLEAR ?auto_33413 ) ( ON ?auto_33414 ?auto_33415 ) ( CLEAR ?auto_33414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33413 ?auto_33414 )
      ( MAKE-8PILE ?auto_33413 ?auto_33414 ?auto_33415 ?auto_33416 ?auto_33417 ?auto_33418 ?auto_33419 ?auto_33420 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33429 - BLOCK
      ?auto_33430 - BLOCK
      ?auto_33431 - BLOCK
      ?auto_33432 - BLOCK
      ?auto_33433 - BLOCK
      ?auto_33434 - BLOCK
      ?auto_33435 - BLOCK
      ?auto_33436 - BLOCK
    )
    :vars
    (
      ?auto_33437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33436 ?auto_33437 ) ( not ( = ?auto_33429 ?auto_33430 ) ) ( not ( = ?auto_33429 ?auto_33431 ) ) ( not ( = ?auto_33429 ?auto_33432 ) ) ( not ( = ?auto_33429 ?auto_33433 ) ) ( not ( = ?auto_33429 ?auto_33434 ) ) ( not ( = ?auto_33429 ?auto_33435 ) ) ( not ( = ?auto_33429 ?auto_33436 ) ) ( not ( = ?auto_33429 ?auto_33437 ) ) ( not ( = ?auto_33430 ?auto_33431 ) ) ( not ( = ?auto_33430 ?auto_33432 ) ) ( not ( = ?auto_33430 ?auto_33433 ) ) ( not ( = ?auto_33430 ?auto_33434 ) ) ( not ( = ?auto_33430 ?auto_33435 ) ) ( not ( = ?auto_33430 ?auto_33436 ) ) ( not ( = ?auto_33430 ?auto_33437 ) ) ( not ( = ?auto_33431 ?auto_33432 ) ) ( not ( = ?auto_33431 ?auto_33433 ) ) ( not ( = ?auto_33431 ?auto_33434 ) ) ( not ( = ?auto_33431 ?auto_33435 ) ) ( not ( = ?auto_33431 ?auto_33436 ) ) ( not ( = ?auto_33431 ?auto_33437 ) ) ( not ( = ?auto_33432 ?auto_33433 ) ) ( not ( = ?auto_33432 ?auto_33434 ) ) ( not ( = ?auto_33432 ?auto_33435 ) ) ( not ( = ?auto_33432 ?auto_33436 ) ) ( not ( = ?auto_33432 ?auto_33437 ) ) ( not ( = ?auto_33433 ?auto_33434 ) ) ( not ( = ?auto_33433 ?auto_33435 ) ) ( not ( = ?auto_33433 ?auto_33436 ) ) ( not ( = ?auto_33433 ?auto_33437 ) ) ( not ( = ?auto_33434 ?auto_33435 ) ) ( not ( = ?auto_33434 ?auto_33436 ) ) ( not ( = ?auto_33434 ?auto_33437 ) ) ( not ( = ?auto_33435 ?auto_33436 ) ) ( not ( = ?auto_33435 ?auto_33437 ) ) ( not ( = ?auto_33436 ?auto_33437 ) ) ( ON ?auto_33435 ?auto_33436 ) ( ON ?auto_33434 ?auto_33435 ) ( ON ?auto_33433 ?auto_33434 ) ( ON ?auto_33432 ?auto_33433 ) ( ON ?auto_33431 ?auto_33432 ) ( ON ?auto_33430 ?auto_33431 ) ( ON ?auto_33429 ?auto_33430 ) ( CLEAR ?auto_33429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33429 )
      ( MAKE-8PILE ?auto_33429 ?auto_33430 ?auto_33431 ?auto_33432 ?auto_33433 ?auto_33434 ?auto_33435 ?auto_33436 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33446 - BLOCK
      ?auto_33447 - BLOCK
      ?auto_33448 - BLOCK
      ?auto_33449 - BLOCK
      ?auto_33450 - BLOCK
      ?auto_33451 - BLOCK
      ?auto_33452 - BLOCK
      ?auto_33453 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33453 ) ( not ( = ?auto_33446 ?auto_33447 ) ) ( not ( = ?auto_33446 ?auto_33448 ) ) ( not ( = ?auto_33446 ?auto_33449 ) ) ( not ( = ?auto_33446 ?auto_33450 ) ) ( not ( = ?auto_33446 ?auto_33451 ) ) ( not ( = ?auto_33446 ?auto_33452 ) ) ( not ( = ?auto_33446 ?auto_33453 ) ) ( not ( = ?auto_33447 ?auto_33448 ) ) ( not ( = ?auto_33447 ?auto_33449 ) ) ( not ( = ?auto_33447 ?auto_33450 ) ) ( not ( = ?auto_33447 ?auto_33451 ) ) ( not ( = ?auto_33447 ?auto_33452 ) ) ( not ( = ?auto_33447 ?auto_33453 ) ) ( not ( = ?auto_33448 ?auto_33449 ) ) ( not ( = ?auto_33448 ?auto_33450 ) ) ( not ( = ?auto_33448 ?auto_33451 ) ) ( not ( = ?auto_33448 ?auto_33452 ) ) ( not ( = ?auto_33448 ?auto_33453 ) ) ( not ( = ?auto_33449 ?auto_33450 ) ) ( not ( = ?auto_33449 ?auto_33451 ) ) ( not ( = ?auto_33449 ?auto_33452 ) ) ( not ( = ?auto_33449 ?auto_33453 ) ) ( not ( = ?auto_33450 ?auto_33451 ) ) ( not ( = ?auto_33450 ?auto_33452 ) ) ( not ( = ?auto_33450 ?auto_33453 ) ) ( not ( = ?auto_33451 ?auto_33452 ) ) ( not ( = ?auto_33451 ?auto_33453 ) ) ( not ( = ?auto_33452 ?auto_33453 ) ) ( ON ?auto_33452 ?auto_33453 ) ( ON ?auto_33451 ?auto_33452 ) ( ON ?auto_33450 ?auto_33451 ) ( ON ?auto_33449 ?auto_33450 ) ( ON ?auto_33448 ?auto_33449 ) ( ON ?auto_33447 ?auto_33448 ) ( ON ?auto_33446 ?auto_33447 ) ( CLEAR ?auto_33446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33446 )
      ( MAKE-8PILE ?auto_33446 ?auto_33447 ?auto_33448 ?auto_33449 ?auto_33450 ?auto_33451 ?auto_33452 ?auto_33453 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_33462 - BLOCK
      ?auto_33463 - BLOCK
      ?auto_33464 - BLOCK
      ?auto_33465 - BLOCK
      ?auto_33466 - BLOCK
      ?auto_33467 - BLOCK
      ?auto_33468 - BLOCK
      ?auto_33469 - BLOCK
    )
    :vars
    (
      ?auto_33470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33462 ?auto_33463 ) ) ( not ( = ?auto_33462 ?auto_33464 ) ) ( not ( = ?auto_33462 ?auto_33465 ) ) ( not ( = ?auto_33462 ?auto_33466 ) ) ( not ( = ?auto_33462 ?auto_33467 ) ) ( not ( = ?auto_33462 ?auto_33468 ) ) ( not ( = ?auto_33462 ?auto_33469 ) ) ( not ( = ?auto_33463 ?auto_33464 ) ) ( not ( = ?auto_33463 ?auto_33465 ) ) ( not ( = ?auto_33463 ?auto_33466 ) ) ( not ( = ?auto_33463 ?auto_33467 ) ) ( not ( = ?auto_33463 ?auto_33468 ) ) ( not ( = ?auto_33463 ?auto_33469 ) ) ( not ( = ?auto_33464 ?auto_33465 ) ) ( not ( = ?auto_33464 ?auto_33466 ) ) ( not ( = ?auto_33464 ?auto_33467 ) ) ( not ( = ?auto_33464 ?auto_33468 ) ) ( not ( = ?auto_33464 ?auto_33469 ) ) ( not ( = ?auto_33465 ?auto_33466 ) ) ( not ( = ?auto_33465 ?auto_33467 ) ) ( not ( = ?auto_33465 ?auto_33468 ) ) ( not ( = ?auto_33465 ?auto_33469 ) ) ( not ( = ?auto_33466 ?auto_33467 ) ) ( not ( = ?auto_33466 ?auto_33468 ) ) ( not ( = ?auto_33466 ?auto_33469 ) ) ( not ( = ?auto_33467 ?auto_33468 ) ) ( not ( = ?auto_33467 ?auto_33469 ) ) ( not ( = ?auto_33468 ?auto_33469 ) ) ( ON ?auto_33462 ?auto_33470 ) ( not ( = ?auto_33469 ?auto_33470 ) ) ( not ( = ?auto_33468 ?auto_33470 ) ) ( not ( = ?auto_33467 ?auto_33470 ) ) ( not ( = ?auto_33466 ?auto_33470 ) ) ( not ( = ?auto_33465 ?auto_33470 ) ) ( not ( = ?auto_33464 ?auto_33470 ) ) ( not ( = ?auto_33463 ?auto_33470 ) ) ( not ( = ?auto_33462 ?auto_33470 ) ) ( ON ?auto_33463 ?auto_33462 ) ( ON ?auto_33464 ?auto_33463 ) ( ON ?auto_33465 ?auto_33464 ) ( ON ?auto_33466 ?auto_33465 ) ( ON ?auto_33467 ?auto_33466 ) ( ON ?auto_33468 ?auto_33467 ) ( ON ?auto_33469 ?auto_33468 ) ( CLEAR ?auto_33469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_33469 ?auto_33468 ?auto_33467 ?auto_33466 ?auto_33465 ?auto_33464 ?auto_33463 ?auto_33462 )
      ( MAKE-8PILE ?auto_33462 ?auto_33463 ?auto_33464 ?auto_33465 ?auto_33466 ?auto_33467 ?auto_33468 ?auto_33469 ) )
  )

)

