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
      ?auto_32631 - BLOCK
      ?auto_32632 - BLOCK
      ?auto_32633 - BLOCK
      ?auto_32634 - BLOCK
      ?auto_32635 - BLOCK
    )
    :vars
    (
      ?auto_32636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32636 ?auto_32635 ) ( CLEAR ?auto_32636 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32631 ) ( ON ?auto_32632 ?auto_32631 ) ( ON ?auto_32633 ?auto_32632 ) ( ON ?auto_32634 ?auto_32633 ) ( ON ?auto_32635 ?auto_32634 ) ( not ( = ?auto_32631 ?auto_32632 ) ) ( not ( = ?auto_32631 ?auto_32633 ) ) ( not ( = ?auto_32631 ?auto_32634 ) ) ( not ( = ?auto_32631 ?auto_32635 ) ) ( not ( = ?auto_32631 ?auto_32636 ) ) ( not ( = ?auto_32632 ?auto_32633 ) ) ( not ( = ?auto_32632 ?auto_32634 ) ) ( not ( = ?auto_32632 ?auto_32635 ) ) ( not ( = ?auto_32632 ?auto_32636 ) ) ( not ( = ?auto_32633 ?auto_32634 ) ) ( not ( = ?auto_32633 ?auto_32635 ) ) ( not ( = ?auto_32633 ?auto_32636 ) ) ( not ( = ?auto_32634 ?auto_32635 ) ) ( not ( = ?auto_32634 ?auto_32636 ) ) ( not ( = ?auto_32635 ?auto_32636 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32636 ?auto_32635 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32638 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_32638 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_32638 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32639 - BLOCK
    )
    :vars
    (
      ?auto_32640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32639 ?auto_32640 ) ( CLEAR ?auto_32639 ) ( HAND-EMPTY ) ( not ( = ?auto_32639 ?auto_32640 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32639 ?auto_32640 )
      ( MAKE-1PILE ?auto_32639 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32645 - BLOCK
      ?auto_32646 - BLOCK
      ?auto_32647 - BLOCK
      ?auto_32648 - BLOCK
    )
    :vars
    (
      ?auto_32649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32649 ?auto_32648 ) ( CLEAR ?auto_32649 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32645 ) ( ON ?auto_32646 ?auto_32645 ) ( ON ?auto_32647 ?auto_32646 ) ( ON ?auto_32648 ?auto_32647 ) ( not ( = ?auto_32645 ?auto_32646 ) ) ( not ( = ?auto_32645 ?auto_32647 ) ) ( not ( = ?auto_32645 ?auto_32648 ) ) ( not ( = ?auto_32645 ?auto_32649 ) ) ( not ( = ?auto_32646 ?auto_32647 ) ) ( not ( = ?auto_32646 ?auto_32648 ) ) ( not ( = ?auto_32646 ?auto_32649 ) ) ( not ( = ?auto_32647 ?auto_32648 ) ) ( not ( = ?auto_32647 ?auto_32649 ) ) ( not ( = ?auto_32648 ?auto_32649 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32649 ?auto_32648 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32650 - BLOCK
      ?auto_32651 - BLOCK
      ?auto_32652 - BLOCK
      ?auto_32653 - BLOCK
    )
    :vars
    (
      ?auto_32654 - BLOCK
      ?auto_32655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32654 ?auto_32653 ) ( CLEAR ?auto_32654 ) ( ON-TABLE ?auto_32650 ) ( ON ?auto_32651 ?auto_32650 ) ( ON ?auto_32652 ?auto_32651 ) ( ON ?auto_32653 ?auto_32652 ) ( not ( = ?auto_32650 ?auto_32651 ) ) ( not ( = ?auto_32650 ?auto_32652 ) ) ( not ( = ?auto_32650 ?auto_32653 ) ) ( not ( = ?auto_32650 ?auto_32654 ) ) ( not ( = ?auto_32651 ?auto_32652 ) ) ( not ( = ?auto_32651 ?auto_32653 ) ) ( not ( = ?auto_32651 ?auto_32654 ) ) ( not ( = ?auto_32652 ?auto_32653 ) ) ( not ( = ?auto_32652 ?auto_32654 ) ) ( not ( = ?auto_32653 ?auto_32654 ) ) ( HOLDING ?auto_32655 ) ( not ( = ?auto_32650 ?auto_32655 ) ) ( not ( = ?auto_32651 ?auto_32655 ) ) ( not ( = ?auto_32652 ?auto_32655 ) ) ( not ( = ?auto_32653 ?auto_32655 ) ) ( not ( = ?auto_32654 ?auto_32655 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_32655 )
      ( MAKE-4PILE ?auto_32650 ?auto_32651 ?auto_32652 ?auto_32653 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32656 - BLOCK
      ?auto_32657 - BLOCK
      ?auto_32658 - BLOCK
      ?auto_32659 - BLOCK
    )
    :vars
    (
      ?auto_32661 - BLOCK
      ?auto_32660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32661 ?auto_32659 ) ( ON-TABLE ?auto_32656 ) ( ON ?auto_32657 ?auto_32656 ) ( ON ?auto_32658 ?auto_32657 ) ( ON ?auto_32659 ?auto_32658 ) ( not ( = ?auto_32656 ?auto_32657 ) ) ( not ( = ?auto_32656 ?auto_32658 ) ) ( not ( = ?auto_32656 ?auto_32659 ) ) ( not ( = ?auto_32656 ?auto_32661 ) ) ( not ( = ?auto_32657 ?auto_32658 ) ) ( not ( = ?auto_32657 ?auto_32659 ) ) ( not ( = ?auto_32657 ?auto_32661 ) ) ( not ( = ?auto_32658 ?auto_32659 ) ) ( not ( = ?auto_32658 ?auto_32661 ) ) ( not ( = ?auto_32659 ?auto_32661 ) ) ( not ( = ?auto_32656 ?auto_32660 ) ) ( not ( = ?auto_32657 ?auto_32660 ) ) ( not ( = ?auto_32658 ?auto_32660 ) ) ( not ( = ?auto_32659 ?auto_32660 ) ) ( not ( = ?auto_32661 ?auto_32660 ) ) ( ON ?auto_32660 ?auto_32661 ) ( CLEAR ?auto_32660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32656 ?auto_32657 ?auto_32658 ?auto_32659 ?auto_32661 )
      ( MAKE-4PILE ?auto_32656 ?auto_32657 ?auto_32658 ?auto_32659 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32664 - BLOCK
      ?auto_32665 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_32665 ) ( CLEAR ?auto_32664 ) ( ON-TABLE ?auto_32664 ) ( not ( = ?auto_32664 ?auto_32665 ) ) )
    :subtasks
    ( ( !STACK ?auto_32665 ?auto_32664 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32666 - BLOCK
      ?auto_32667 - BLOCK
    )
    :vars
    (
      ?auto_32668 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32666 ) ( ON-TABLE ?auto_32666 ) ( not ( = ?auto_32666 ?auto_32667 ) ) ( ON ?auto_32667 ?auto_32668 ) ( CLEAR ?auto_32667 ) ( HAND-EMPTY ) ( not ( = ?auto_32666 ?auto_32668 ) ) ( not ( = ?auto_32667 ?auto_32668 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32667 ?auto_32668 )
      ( MAKE-2PILE ?auto_32666 ?auto_32667 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32669 - BLOCK
      ?auto_32670 - BLOCK
    )
    :vars
    (
      ?auto_32671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32669 ?auto_32670 ) ) ( ON ?auto_32670 ?auto_32671 ) ( CLEAR ?auto_32670 ) ( not ( = ?auto_32669 ?auto_32671 ) ) ( not ( = ?auto_32670 ?auto_32671 ) ) ( HOLDING ?auto_32669 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32669 )
      ( MAKE-2PILE ?auto_32669 ?auto_32670 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32672 - BLOCK
      ?auto_32673 - BLOCK
    )
    :vars
    (
      ?auto_32674 - BLOCK
      ?auto_32675 - BLOCK
      ?auto_32677 - BLOCK
      ?auto_32676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32672 ?auto_32673 ) ) ( ON ?auto_32673 ?auto_32674 ) ( not ( = ?auto_32672 ?auto_32674 ) ) ( not ( = ?auto_32673 ?auto_32674 ) ) ( ON ?auto_32672 ?auto_32673 ) ( CLEAR ?auto_32672 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32675 ) ( ON ?auto_32677 ?auto_32675 ) ( ON ?auto_32676 ?auto_32677 ) ( ON ?auto_32674 ?auto_32676 ) ( not ( = ?auto_32675 ?auto_32677 ) ) ( not ( = ?auto_32675 ?auto_32676 ) ) ( not ( = ?auto_32675 ?auto_32674 ) ) ( not ( = ?auto_32675 ?auto_32673 ) ) ( not ( = ?auto_32675 ?auto_32672 ) ) ( not ( = ?auto_32677 ?auto_32676 ) ) ( not ( = ?auto_32677 ?auto_32674 ) ) ( not ( = ?auto_32677 ?auto_32673 ) ) ( not ( = ?auto_32677 ?auto_32672 ) ) ( not ( = ?auto_32676 ?auto_32674 ) ) ( not ( = ?auto_32676 ?auto_32673 ) ) ( not ( = ?auto_32676 ?auto_32672 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32675 ?auto_32677 ?auto_32676 ?auto_32674 ?auto_32673 )
      ( MAKE-2PILE ?auto_32672 ?auto_32673 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32681 - BLOCK
      ?auto_32682 - BLOCK
      ?auto_32683 - BLOCK
    )
    :vars
    (
      ?auto_32684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32684 ?auto_32683 ) ( CLEAR ?auto_32684 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32681 ) ( ON ?auto_32682 ?auto_32681 ) ( ON ?auto_32683 ?auto_32682 ) ( not ( = ?auto_32681 ?auto_32682 ) ) ( not ( = ?auto_32681 ?auto_32683 ) ) ( not ( = ?auto_32681 ?auto_32684 ) ) ( not ( = ?auto_32682 ?auto_32683 ) ) ( not ( = ?auto_32682 ?auto_32684 ) ) ( not ( = ?auto_32683 ?auto_32684 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32684 ?auto_32683 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32685 - BLOCK
      ?auto_32686 - BLOCK
      ?auto_32687 - BLOCK
    )
    :vars
    (
      ?auto_32688 - BLOCK
      ?auto_32689 - BLOCK
      ?auto_32690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32688 ?auto_32687 ) ( CLEAR ?auto_32688 ) ( ON-TABLE ?auto_32685 ) ( ON ?auto_32686 ?auto_32685 ) ( ON ?auto_32687 ?auto_32686 ) ( not ( = ?auto_32685 ?auto_32686 ) ) ( not ( = ?auto_32685 ?auto_32687 ) ) ( not ( = ?auto_32685 ?auto_32688 ) ) ( not ( = ?auto_32686 ?auto_32687 ) ) ( not ( = ?auto_32686 ?auto_32688 ) ) ( not ( = ?auto_32687 ?auto_32688 ) ) ( HOLDING ?auto_32689 ) ( CLEAR ?auto_32690 ) ( not ( = ?auto_32685 ?auto_32689 ) ) ( not ( = ?auto_32685 ?auto_32690 ) ) ( not ( = ?auto_32686 ?auto_32689 ) ) ( not ( = ?auto_32686 ?auto_32690 ) ) ( not ( = ?auto_32687 ?auto_32689 ) ) ( not ( = ?auto_32687 ?auto_32690 ) ) ( not ( = ?auto_32688 ?auto_32689 ) ) ( not ( = ?auto_32688 ?auto_32690 ) ) ( not ( = ?auto_32689 ?auto_32690 ) ) )
    :subtasks
    ( ( !STACK ?auto_32689 ?auto_32690 )
      ( MAKE-3PILE ?auto_32685 ?auto_32686 ?auto_32687 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33053 - BLOCK
      ?auto_33054 - BLOCK
      ?auto_33055 - BLOCK
    )
    :vars
    (
      ?auto_33056 - BLOCK
      ?auto_33057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33056 ?auto_33055 ) ( ON-TABLE ?auto_33053 ) ( ON ?auto_33054 ?auto_33053 ) ( ON ?auto_33055 ?auto_33054 ) ( not ( = ?auto_33053 ?auto_33054 ) ) ( not ( = ?auto_33053 ?auto_33055 ) ) ( not ( = ?auto_33053 ?auto_33056 ) ) ( not ( = ?auto_33054 ?auto_33055 ) ) ( not ( = ?auto_33054 ?auto_33056 ) ) ( not ( = ?auto_33055 ?auto_33056 ) ) ( not ( = ?auto_33053 ?auto_33057 ) ) ( not ( = ?auto_33054 ?auto_33057 ) ) ( not ( = ?auto_33055 ?auto_33057 ) ) ( not ( = ?auto_33056 ?auto_33057 ) ) ( ON ?auto_33057 ?auto_33056 ) ( CLEAR ?auto_33057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33053 ?auto_33054 ?auto_33055 ?auto_33056 )
      ( MAKE-3PILE ?auto_33053 ?auto_33054 ?auto_33055 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32697 - BLOCK
      ?auto_32698 - BLOCK
      ?auto_32699 - BLOCK
    )
    :vars
    (
      ?auto_32701 - BLOCK
      ?auto_32700 - BLOCK
      ?auto_32702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32701 ?auto_32699 ) ( ON-TABLE ?auto_32697 ) ( ON ?auto_32698 ?auto_32697 ) ( ON ?auto_32699 ?auto_32698 ) ( not ( = ?auto_32697 ?auto_32698 ) ) ( not ( = ?auto_32697 ?auto_32699 ) ) ( not ( = ?auto_32697 ?auto_32701 ) ) ( not ( = ?auto_32698 ?auto_32699 ) ) ( not ( = ?auto_32698 ?auto_32701 ) ) ( not ( = ?auto_32699 ?auto_32701 ) ) ( not ( = ?auto_32697 ?auto_32700 ) ) ( not ( = ?auto_32697 ?auto_32702 ) ) ( not ( = ?auto_32698 ?auto_32700 ) ) ( not ( = ?auto_32698 ?auto_32702 ) ) ( not ( = ?auto_32699 ?auto_32700 ) ) ( not ( = ?auto_32699 ?auto_32702 ) ) ( not ( = ?auto_32701 ?auto_32700 ) ) ( not ( = ?auto_32701 ?auto_32702 ) ) ( not ( = ?auto_32700 ?auto_32702 ) ) ( ON ?auto_32700 ?auto_32701 ) ( CLEAR ?auto_32700 ) ( HOLDING ?auto_32702 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32702 )
      ( MAKE-3PILE ?auto_32697 ?auto_32698 ?auto_32699 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32703 - BLOCK
      ?auto_32704 - BLOCK
      ?auto_32705 - BLOCK
    )
    :vars
    (
      ?auto_32708 - BLOCK
      ?auto_32706 - BLOCK
      ?auto_32707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32708 ?auto_32705 ) ( ON-TABLE ?auto_32703 ) ( ON ?auto_32704 ?auto_32703 ) ( ON ?auto_32705 ?auto_32704 ) ( not ( = ?auto_32703 ?auto_32704 ) ) ( not ( = ?auto_32703 ?auto_32705 ) ) ( not ( = ?auto_32703 ?auto_32708 ) ) ( not ( = ?auto_32704 ?auto_32705 ) ) ( not ( = ?auto_32704 ?auto_32708 ) ) ( not ( = ?auto_32705 ?auto_32708 ) ) ( not ( = ?auto_32703 ?auto_32706 ) ) ( not ( = ?auto_32703 ?auto_32707 ) ) ( not ( = ?auto_32704 ?auto_32706 ) ) ( not ( = ?auto_32704 ?auto_32707 ) ) ( not ( = ?auto_32705 ?auto_32706 ) ) ( not ( = ?auto_32705 ?auto_32707 ) ) ( not ( = ?auto_32708 ?auto_32706 ) ) ( not ( = ?auto_32708 ?auto_32707 ) ) ( not ( = ?auto_32706 ?auto_32707 ) ) ( ON ?auto_32706 ?auto_32708 ) ( ON ?auto_32707 ?auto_32706 ) ( CLEAR ?auto_32707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32703 ?auto_32704 ?auto_32705 ?auto_32708 ?auto_32706 )
      ( MAKE-3PILE ?auto_32703 ?auto_32704 ?auto_32705 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32712 - BLOCK
      ?auto_32713 - BLOCK
      ?auto_32714 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_32714 ) ( CLEAR ?auto_32713 ) ( ON-TABLE ?auto_32712 ) ( ON ?auto_32713 ?auto_32712 ) ( not ( = ?auto_32712 ?auto_32713 ) ) ( not ( = ?auto_32712 ?auto_32714 ) ) ( not ( = ?auto_32713 ?auto_32714 ) ) )
    :subtasks
    ( ( !STACK ?auto_32714 ?auto_32713 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32715 - BLOCK
      ?auto_32716 - BLOCK
      ?auto_32717 - BLOCK
    )
    :vars
    (
      ?auto_32718 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32716 ) ( ON-TABLE ?auto_32715 ) ( ON ?auto_32716 ?auto_32715 ) ( not ( = ?auto_32715 ?auto_32716 ) ) ( not ( = ?auto_32715 ?auto_32717 ) ) ( not ( = ?auto_32716 ?auto_32717 ) ) ( ON ?auto_32717 ?auto_32718 ) ( CLEAR ?auto_32717 ) ( HAND-EMPTY ) ( not ( = ?auto_32715 ?auto_32718 ) ) ( not ( = ?auto_32716 ?auto_32718 ) ) ( not ( = ?auto_32717 ?auto_32718 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32717 ?auto_32718 )
      ( MAKE-3PILE ?auto_32715 ?auto_32716 ?auto_32717 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32719 - BLOCK
      ?auto_32720 - BLOCK
      ?auto_32721 - BLOCK
    )
    :vars
    (
      ?auto_32722 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32719 ) ( not ( = ?auto_32719 ?auto_32720 ) ) ( not ( = ?auto_32719 ?auto_32721 ) ) ( not ( = ?auto_32720 ?auto_32721 ) ) ( ON ?auto_32721 ?auto_32722 ) ( CLEAR ?auto_32721 ) ( not ( = ?auto_32719 ?auto_32722 ) ) ( not ( = ?auto_32720 ?auto_32722 ) ) ( not ( = ?auto_32721 ?auto_32722 ) ) ( HOLDING ?auto_32720 ) ( CLEAR ?auto_32719 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32719 ?auto_32720 )
      ( MAKE-3PILE ?auto_32719 ?auto_32720 ?auto_32721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32723 - BLOCK
      ?auto_32724 - BLOCK
      ?auto_32725 - BLOCK
    )
    :vars
    (
      ?auto_32726 - BLOCK
      ?auto_32727 - BLOCK
      ?auto_32728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32723 ) ( not ( = ?auto_32723 ?auto_32724 ) ) ( not ( = ?auto_32723 ?auto_32725 ) ) ( not ( = ?auto_32724 ?auto_32725 ) ) ( ON ?auto_32725 ?auto_32726 ) ( not ( = ?auto_32723 ?auto_32726 ) ) ( not ( = ?auto_32724 ?auto_32726 ) ) ( not ( = ?auto_32725 ?auto_32726 ) ) ( CLEAR ?auto_32723 ) ( ON ?auto_32724 ?auto_32725 ) ( CLEAR ?auto_32724 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32727 ) ( ON ?auto_32728 ?auto_32727 ) ( ON ?auto_32726 ?auto_32728 ) ( not ( = ?auto_32727 ?auto_32728 ) ) ( not ( = ?auto_32727 ?auto_32726 ) ) ( not ( = ?auto_32727 ?auto_32725 ) ) ( not ( = ?auto_32727 ?auto_32724 ) ) ( not ( = ?auto_32728 ?auto_32726 ) ) ( not ( = ?auto_32728 ?auto_32725 ) ) ( not ( = ?auto_32728 ?auto_32724 ) ) ( not ( = ?auto_32723 ?auto_32727 ) ) ( not ( = ?auto_32723 ?auto_32728 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32727 ?auto_32728 ?auto_32726 ?auto_32725 )
      ( MAKE-3PILE ?auto_32723 ?auto_32724 ?auto_32725 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32729 - BLOCK
      ?auto_32730 - BLOCK
      ?auto_32731 - BLOCK
    )
    :vars
    (
      ?auto_32733 - BLOCK
      ?auto_32732 - BLOCK
      ?auto_32734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32729 ?auto_32730 ) ) ( not ( = ?auto_32729 ?auto_32731 ) ) ( not ( = ?auto_32730 ?auto_32731 ) ) ( ON ?auto_32731 ?auto_32733 ) ( not ( = ?auto_32729 ?auto_32733 ) ) ( not ( = ?auto_32730 ?auto_32733 ) ) ( not ( = ?auto_32731 ?auto_32733 ) ) ( ON ?auto_32730 ?auto_32731 ) ( CLEAR ?auto_32730 ) ( ON-TABLE ?auto_32732 ) ( ON ?auto_32734 ?auto_32732 ) ( ON ?auto_32733 ?auto_32734 ) ( not ( = ?auto_32732 ?auto_32734 ) ) ( not ( = ?auto_32732 ?auto_32733 ) ) ( not ( = ?auto_32732 ?auto_32731 ) ) ( not ( = ?auto_32732 ?auto_32730 ) ) ( not ( = ?auto_32734 ?auto_32733 ) ) ( not ( = ?auto_32734 ?auto_32731 ) ) ( not ( = ?auto_32734 ?auto_32730 ) ) ( not ( = ?auto_32729 ?auto_32732 ) ) ( not ( = ?auto_32729 ?auto_32734 ) ) ( HOLDING ?auto_32729 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32729 )
      ( MAKE-3PILE ?auto_32729 ?auto_32730 ?auto_32731 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32735 - BLOCK
      ?auto_32736 - BLOCK
      ?auto_32737 - BLOCK
    )
    :vars
    (
      ?auto_32739 - BLOCK
      ?auto_32738 - BLOCK
      ?auto_32740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32735 ?auto_32736 ) ) ( not ( = ?auto_32735 ?auto_32737 ) ) ( not ( = ?auto_32736 ?auto_32737 ) ) ( ON ?auto_32737 ?auto_32739 ) ( not ( = ?auto_32735 ?auto_32739 ) ) ( not ( = ?auto_32736 ?auto_32739 ) ) ( not ( = ?auto_32737 ?auto_32739 ) ) ( ON ?auto_32736 ?auto_32737 ) ( ON-TABLE ?auto_32738 ) ( ON ?auto_32740 ?auto_32738 ) ( ON ?auto_32739 ?auto_32740 ) ( not ( = ?auto_32738 ?auto_32740 ) ) ( not ( = ?auto_32738 ?auto_32739 ) ) ( not ( = ?auto_32738 ?auto_32737 ) ) ( not ( = ?auto_32738 ?auto_32736 ) ) ( not ( = ?auto_32740 ?auto_32739 ) ) ( not ( = ?auto_32740 ?auto_32737 ) ) ( not ( = ?auto_32740 ?auto_32736 ) ) ( not ( = ?auto_32735 ?auto_32738 ) ) ( not ( = ?auto_32735 ?auto_32740 ) ) ( ON ?auto_32735 ?auto_32736 ) ( CLEAR ?auto_32735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32738 ?auto_32740 ?auto_32739 ?auto_32737 ?auto_32736 )
      ( MAKE-3PILE ?auto_32735 ?auto_32736 ?auto_32737 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32743 - BLOCK
      ?auto_32744 - BLOCK
    )
    :vars
    (
      ?auto_32745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32745 ?auto_32744 ) ( CLEAR ?auto_32745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32743 ) ( ON ?auto_32744 ?auto_32743 ) ( not ( = ?auto_32743 ?auto_32744 ) ) ( not ( = ?auto_32743 ?auto_32745 ) ) ( not ( = ?auto_32744 ?auto_32745 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32745 ?auto_32744 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32746 - BLOCK
      ?auto_32747 - BLOCK
    )
    :vars
    (
      ?auto_32748 - BLOCK
      ?auto_32749 - BLOCK
      ?auto_32750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32748 ?auto_32747 ) ( CLEAR ?auto_32748 ) ( ON-TABLE ?auto_32746 ) ( ON ?auto_32747 ?auto_32746 ) ( not ( = ?auto_32746 ?auto_32747 ) ) ( not ( = ?auto_32746 ?auto_32748 ) ) ( not ( = ?auto_32747 ?auto_32748 ) ) ( HOLDING ?auto_32749 ) ( CLEAR ?auto_32750 ) ( not ( = ?auto_32746 ?auto_32749 ) ) ( not ( = ?auto_32746 ?auto_32750 ) ) ( not ( = ?auto_32747 ?auto_32749 ) ) ( not ( = ?auto_32747 ?auto_32750 ) ) ( not ( = ?auto_32748 ?auto_32749 ) ) ( not ( = ?auto_32748 ?auto_32750 ) ) ( not ( = ?auto_32749 ?auto_32750 ) ) )
    :subtasks
    ( ( !STACK ?auto_32749 ?auto_32750 )
      ( MAKE-2PILE ?auto_32746 ?auto_32747 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32751 - BLOCK
      ?auto_32752 - BLOCK
    )
    :vars
    (
      ?auto_32753 - BLOCK
      ?auto_32754 - BLOCK
      ?auto_32755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32753 ?auto_32752 ) ( ON-TABLE ?auto_32751 ) ( ON ?auto_32752 ?auto_32751 ) ( not ( = ?auto_32751 ?auto_32752 ) ) ( not ( = ?auto_32751 ?auto_32753 ) ) ( not ( = ?auto_32752 ?auto_32753 ) ) ( CLEAR ?auto_32754 ) ( not ( = ?auto_32751 ?auto_32755 ) ) ( not ( = ?auto_32751 ?auto_32754 ) ) ( not ( = ?auto_32752 ?auto_32755 ) ) ( not ( = ?auto_32752 ?auto_32754 ) ) ( not ( = ?auto_32753 ?auto_32755 ) ) ( not ( = ?auto_32753 ?auto_32754 ) ) ( not ( = ?auto_32755 ?auto_32754 ) ) ( ON ?auto_32755 ?auto_32753 ) ( CLEAR ?auto_32755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32751 ?auto_32752 ?auto_32753 )
      ( MAKE-2PILE ?auto_32751 ?auto_32752 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32756 - BLOCK
      ?auto_32757 - BLOCK
    )
    :vars
    (
      ?auto_32758 - BLOCK
      ?auto_32759 - BLOCK
      ?auto_32760 - BLOCK
      ?auto_32761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32758 ?auto_32757 ) ( ON-TABLE ?auto_32756 ) ( ON ?auto_32757 ?auto_32756 ) ( not ( = ?auto_32756 ?auto_32757 ) ) ( not ( = ?auto_32756 ?auto_32758 ) ) ( not ( = ?auto_32757 ?auto_32758 ) ) ( not ( = ?auto_32756 ?auto_32759 ) ) ( not ( = ?auto_32756 ?auto_32760 ) ) ( not ( = ?auto_32757 ?auto_32759 ) ) ( not ( = ?auto_32757 ?auto_32760 ) ) ( not ( = ?auto_32758 ?auto_32759 ) ) ( not ( = ?auto_32758 ?auto_32760 ) ) ( not ( = ?auto_32759 ?auto_32760 ) ) ( ON ?auto_32759 ?auto_32758 ) ( CLEAR ?auto_32759 ) ( HOLDING ?auto_32760 ) ( CLEAR ?auto_32761 ) ( ON-TABLE ?auto_32761 ) ( not ( = ?auto_32761 ?auto_32760 ) ) ( not ( = ?auto_32756 ?auto_32761 ) ) ( not ( = ?auto_32757 ?auto_32761 ) ) ( not ( = ?auto_32758 ?auto_32761 ) ) ( not ( = ?auto_32759 ?auto_32761 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32761 ?auto_32760 )
      ( MAKE-2PILE ?auto_32756 ?auto_32757 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33180 - BLOCK
      ?auto_33181 - BLOCK
    )
    :vars
    (
      ?auto_33182 - BLOCK
      ?auto_33184 - BLOCK
      ?auto_33183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33182 ?auto_33181 ) ( ON-TABLE ?auto_33180 ) ( ON ?auto_33181 ?auto_33180 ) ( not ( = ?auto_33180 ?auto_33181 ) ) ( not ( = ?auto_33180 ?auto_33182 ) ) ( not ( = ?auto_33181 ?auto_33182 ) ) ( not ( = ?auto_33180 ?auto_33184 ) ) ( not ( = ?auto_33180 ?auto_33183 ) ) ( not ( = ?auto_33181 ?auto_33184 ) ) ( not ( = ?auto_33181 ?auto_33183 ) ) ( not ( = ?auto_33182 ?auto_33184 ) ) ( not ( = ?auto_33182 ?auto_33183 ) ) ( not ( = ?auto_33184 ?auto_33183 ) ) ( ON ?auto_33184 ?auto_33182 ) ( ON ?auto_33183 ?auto_33184 ) ( CLEAR ?auto_33183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33180 ?auto_33181 ?auto_33182 ?auto_33184 )
      ( MAKE-2PILE ?auto_33180 ?auto_33181 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32768 - BLOCK
      ?auto_32769 - BLOCK
    )
    :vars
    (
      ?auto_32773 - BLOCK
      ?auto_32771 - BLOCK
      ?auto_32770 - BLOCK
      ?auto_32772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32773 ?auto_32769 ) ( ON-TABLE ?auto_32768 ) ( ON ?auto_32769 ?auto_32768 ) ( not ( = ?auto_32768 ?auto_32769 ) ) ( not ( = ?auto_32768 ?auto_32773 ) ) ( not ( = ?auto_32769 ?auto_32773 ) ) ( not ( = ?auto_32768 ?auto_32771 ) ) ( not ( = ?auto_32768 ?auto_32770 ) ) ( not ( = ?auto_32769 ?auto_32771 ) ) ( not ( = ?auto_32769 ?auto_32770 ) ) ( not ( = ?auto_32773 ?auto_32771 ) ) ( not ( = ?auto_32773 ?auto_32770 ) ) ( not ( = ?auto_32771 ?auto_32770 ) ) ( ON ?auto_32771 ?auto_32773 ) ( not ( = ?auto_32772 ?auto_32770 ) ) ( not ( = ?auto_32768 ?auto_32772 ) ) ( not ( = ?auto_32769 ?auto_32772 ) ) ( not ( = ?auto_32773 ?auto_32772 ) ) ( not ( = ?auto_32771 ?auto_32772 ) ) ( ON ?auto_32770 ?auto_32771 ) ( CLEAR ?auto_32770 ) ( HOLDING ?auto_32772 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32772 )
      ( MAKE-2PILE ?auto_32768 ?auto_32769 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32774 - BLOCK
      ?auto_32775 - BLOCK
    )
    :vars
    (
      ?auto_32777 - BLOCK
      ?auto_32778 - BLOCK
      ?auto_32776 - BLOCK
      ?auto_32779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32777 ?auto_32775 ) ( ON-TABLE ?auto_32774 ) ( ON ?auto_32775 ?auto_32774 ) ( not ( = ?auto_32774 ?auto_32775 ) ) ( not ( = ?auto_32774 ?auto_32777 ) ) ( not ( = ?auto_32775 ?auto_32777 ) ) ( not ( = ?auto_32774 ?auto_32778 ) ) ( not ( = ?auto_32774 ?auto_32776 ) ) ( not ( = ?auto_32775 ?auto_32778 ) ) ( not ( = ?auto_32775 ?auto_32776 ) ) ( not ( = ?auto_32777 ?auto_32778 ) ) ( not ( = ?auto_32777 ?auto_32776 ) ) ( not ( = ?auto_32778 ?auto_32776 ) ) ( ON ?auto_32778 ?auto_32777 ) ( not ( = ?auto_32779 ?auto_32776 ) ) ( not ( = ?auto_32774 ?auto_32779 ) ) ( not ( = ?auto_32775 ?auto_32779 ) ) ( not ( = ?auto_32777 ?auto_32779 ) ) ( not ( = ?auto_32778 ?auto_32779 ) ) ( ON ?auto_32776 ?auto_32778 ) ( ON ?auto_32779 ?auto_32776 ) ( CLEAR ?auto_32779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32774 ?auto_32775 ?auto_32777 ?auto_32778 ?auto_32776 )
      ( MAKE-2PILE ?auto_32774 ?auto_32775 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32784 - BLOCK
      ?auto_32785 - BLOCK
      ?auto_32786 - BLOCK
      ?auto_32787 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_32787 ) ( CLEAR ?auto_32786 ) ( ON-TABLE ?auto_32784 ) ( ON ?auto_32785 ?auto_32784 ) ( ON ?auto_32786 ?auto_32785 ) ( not ( = ?auto_32784 ?auto_32785 ) ) ( not ( = ?auto_32784 ?auto_32786 ) ) ( not ( = ?auto_32784 ?auto_32787 ) ) ( not ( = ?auto_32785 ?auto_32786 ) ) ( not ( = ?auto_32785 ?auto_32787 ) ) ( not ( = ?auto_32786 ?auto_32787 ) ) )
    :subtasks
    ( ( !STACK ?auto_32787 ?auto_32786 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32788 - BLOCK
      ?auto_32789 - BLOCK
      ?auto_32790 - BLOCK
      ?auto_32791 - BLOCK
    )
    :vars
    (
      ?auto_32792 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32790 ) ( ON-TABLE ?auto_32788 ) ( ON ?auto_32789 ?auto_32788 ) ( ON ?auto_32790 ?auto_32789 ) ( not ( = ?auto_32788 ?auto_32789 ) ) ( not ( = ?auto_32788 ?auto_32790 ) ) ( not ( = ?auto_32788 ?auto_32791 ) ) ( not ( = ?auto_32789 ?auto_32790 ) ) ( not ( = ?auto_32789 ?auto_32791 ) ) ( not ( = ?auto_32790 ?auto_32791 ) ) ( ON ?auto_32791 ?auto_32792 ) ( CLEAR ?auto_32791 ) ( HAND-EMPTY ) ( not ( = ?auto_32788 ?auto_32792 ) ) ( not ( = ?auto_32789 ?auto_32792 ) ) ( not ( = ?auto_32790 ?auto_32792 ) ) ( not ( = ?auto_32791 ?auto_32792 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32791 ?auto_32792 )
      ( MAKE-4PILE ?auto_32788 ?auto_32789 ?auto_32790 ?auto_32791 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32793 - BLOCK
      ?auto_32794 - BLOCK
      ?auto_32795 - BLOCK
      ?auto_32796 - BLOCK
    )
    :vars
    (
      ?auto_32797 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32793 ) ( ON ?auto_32794 ?auto_32793 ) ( not ( = ?auto_32793 ?auto_32794 ) ) ( not ( = ?auto_32793 ?auto_32795 ) ) ( not ( = ?auto_32793 ?auto_32796 ) ) ( not ( = ?auto_32794 ?auto_32795 ) ) ( not ( = ?auto_32794 ?auto_32796 ) ) ( not ( = ?auto_32795 ?auto_32796 ) ) ( ON ?auto_32796 ?auto_32797 ) ( CLEAR ?auto_32796 ) ( not ( = ?auto_32793 ?auto_32797 ) ) ( not ( = ?auto_32794 ?auto_32797 ) ) ( not ( = ?auto_32795 ?auto_32797 ) ) ( not ( = ?auto_32796 ?auto_32797 ) ) ( HOLDING ?auto_32795 ) ( CLEAR ?auto_32794 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32793 ?auto_32794 ?auto_32795 )
      ( MAKE-4PILE ?auto_32793 ?auto_32794 ?auto_32795 ?auto_32796 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32798 - BLOCK
      ?auto_32799 - BLOCK
      ?auto_32800 - BLOCK
      ?auto_32801 - BLOCK
    )
    :vars
    (
      ?auto_32802 - BLOCK
      ?auto_32803 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32798 ) ( ON ?auto_32799 ?auto_32798 ) ( not ( = ?auto_32798 ?auto_32799 ) ) ( not ( = ?auto_32798 ?auto_32800 ) ) ( not ( = ?auto_32798 ?auto_32801 ) ) ( not ( = ?auto_32799 ?auto_32800 ) ) ( not ( = ?auto_32799 ?auto_32801 ) ) ( not ( = ?auto_32800 ?auto_32801 ) ) ( ON ?auto_32801 ?auto_32802 ) ( not ( = ?auto_32798 ?auto_32802 ) ) ( not ( = ?auto_32799 ?auto_32802 ) ) ( not ( = ?auto_32800 ?auto_32802 ) ) ( not ( = ?auto_32801 ?auto_32802 ) ) ( CLEAR ?auto_32799 ) ( ON ?auto_32800 ?auto_32801 ) ( CLEAR ?auto_32800 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32803 ) ( ON ?auto_32802 ?auto_32803 ) ( not ( = ?auto_32803 ?auto_32802 ) ) ( not ( = ?auto_32803 ?auto_32801 ) ) ( not ( = ?auto_32803 ?auto_32800 ) ) ( not ( = ?auto_32798 ?auto_32803 ) ) ( not ( = ?auto_32799 ?auto_32803 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32803 ?auto_32802 ?auto_32801 )
      ( MAKE-4PILE ?auto_32798 ?auto_32799 ?auto_32800 ?auto_32801 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32804 - BLOCK
      ?auto_32805 - BLOCK
      ?auto_32806 - BLOCK
      ?auto_32807 - BLOCK
    )
    :vars
    (
      ?auto_32808 - BLOCK
      ?auto_32809 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32804 ) ( not ( = ?auto_32804 ?auto_32805 ) ) ( not ( = ?auto_32804 ?auto_32806 ) ) ( not ( = ?auto_32804 ?auto_32807 ) ) ( not ( = ?auto_32805 ?auto_32806 ) ) ( not ( = ?auto_32805 ?auto_32807 ) ) ( not ( = ?auto_32806 ?auto_32807 ) ) ( ON ?auto_32807 ?auto_32808 ) ( not ( = ?auto_32804 ?auto_32808 ) ) ( not ( = ?auto_32805 ?auto_32808 ) ) ( not ( = ?auto_32806 ?auto_32808 ) ) ( not ( = ?auto_32807 ?auto_32808 ) ) ( ON ?auto_32806 ?auto_32807 ) ( CLEAR ?auto_32806 ) ( ON-TABLE ?auto_32809 ) ( ON ?auto_32808 ?auto_32809 ) ( not ( = ?auto_32809 ?auto_32808 ) ) ( not ( = ?auto_32809 ?auto_32807 ) ) ( not ( = ?auto_32809 ?auto_32806 ) ) ( not ( = ?auto_32804 ?auto_32809 ) ) ( not ( = ?auto_32805 ?auto_32809 ) ) ( HOLDING ?auto_32805 ) ( CLEAR ?auto_32804 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32804 ?auto_32805 )
      ( MAKE-4PILE ?auto_32804 ?auto_32805 ?auto_32806 ?auto_32807 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32810 - BLOCK
      ?auto_32811 - BLOCK
      ?auto_32812 - BLOCK
      ?auto_32813 - BLOCK
    )
    :vars
    (
      ?auto_32814 - BLOCK
      ?auto_32815 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32810 ) ( not ( = ?auto_32810 ?auto_32811 ) ) ( not ( = ?auto_32810 ?auto_32812 ) ) ( not ( = ?auto_32810 ?auto_32813 ) ) ( not ( = ?auto_32811 ?auto_32812 ) ) ( not ( = ?auto_32811 ?auto_32813 ) ) ( not ( = ?auto_32812 ?auto_32813 ) ) ( ON ?auto_32813 ?auto_32814 ) ( not ( = ?auto_32810 ?auto_32814 ) ) ( not ( = ?auto_32811 ?auto_32814 ) ) ( not ( = ?auto_32812 ?auto_32814 ) ) ( not ( = ?auto_32813 ?auto_32814 ) ) ( ON ?auto_32812 ?auto_32813 ) ( ON-TABLE ?auto_32815 ) ( ON ?auto_32814 ?auto_32815 ) ( not ( = ?auto_32815 ?auto_32814 ) ) ( not ( = ?auto_32815 ?auto_32813 ) ) ( not ( = ?auto_32815 ?auto_32812 ) ) ( not ( = ?auto_32810 ?auto_32815 ) ) ( not ( = ?auto_32811 ?auto_32815 ) ) ( CLEAR ?auto_32810 ) ( ON ?auto_32811 ?auto_32812 ) ( CLEAR ?auto_32811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32815 ?auto_32814 ?auto_32813 ?auto_32812 )
      ( MAKE-4PILE ?auto_32810 ?auto_32811 ?auto_32812 ?auto_32813 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32816 - BLOCK
      ?auto_32817 - BLOCK
      ?auto_32818 - BLOCK
      ?auto_32819 - BLOCK
    )
    :vars
    (
      ?auto_32821 - BLOCK
      ?auto_32820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32816 ?auto_32817 ) ) ( not ( = ?auto_32816 ?auto_32818 ) ) ( not ( = ?auto_32816 ?auto_32819 ) ) ( not ( = ?auto_32817 ?auto_32818 ) ) ( not ( = ?auto_32817 ?auto_32819 ) ) ( not ( = ?auto_32818 ?auto_32819 ) ) ( ON ?auto_32819 ?auto_32821 ) ( not ( = ?auto_32816 ?auto_32821 ) ) ( not ( = ?auto_32817 ?auto_32821 ) ) ( not ( = ?auto_32818 ?auto_32821 ) ) ( not ( = ?auto_32819 ?auto_32821 ) ) ( ON ?auto_32818 ?auto_32819 ) ( ON-TABLE ?auto_32820 ) ( ON ?auto_32821 ?auto_32820 ) ( not ( = ?auto_32820 ?auto_32821 ) ) ( not ( = ?auto_32820 ?auto_32819 ) ) ( not ( = ?auto_32820 ?auto_32818 ) ) ( not ( = ?auto_32816 ?auto_32820 ) ) ( not ( = ?auto_32817 ?auto_32820 ) ) ( ON ?auto_32817 ?auto_32818 ) ( CLEAR ?auto_32817 ) ( HOLDING ?auto_32816 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32816 )
      ( MAKE-4PILE ?auto_32816 ?auto_32817 ?auto_32818 ?auto_32819 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32822 - BLOCK
      ?auto_32823 - BLOCK
      ?auto_32824 - BLOCK
      ?auto_32825 - BLOCK
    )
    :vars
    (
      ?auto_32827 - BLOCK
      ?auto_32826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32822 ?auto_32823 ) ) ( not ( = ?auto_32822 ?auto_32824 ) ) ( not ( = ?auto_32822 ?auto_32825 ) ) ( not ( = ?auto_32823 ?auto_32824 ) ) ( not ( = ?auto_32823 ?auto_32825 ) ) ( not ( = ?auto_32824 ?auto_32825 ) ) ( ON ?auto_32825 ?auto_32827 ) ( not ( = ?auto_32822 ?auto_32827 ) ) ( not ( = ?auto_32823 ?auto_32827 ) ) ( not ( = ?auto_32824 ?auto_32827 ) ) ( not ( = ?auto_32825 ?auto_32827 ) ) ( ON ?auto_32824 ?auto_32825 ) ( ON-TABLE ?auto_32826 ) ( ON ?auto_32827 ?auto_32826 ) ( not ( = ?auto_32826 ?auto_32827 ) ) ( not ( = ?auto_32826 ?auto_32825 ) ) ( not ( = ?auto_32826 ?auto_32824 ) ) ( not ( = ?auto_32822 ?auto_32826 ) ) ( not ( = ?auto_32823 ?auto_32826 ) ) ( ON ?auto_32823 ?auto_32824 ) ( ON ?auto_32822 ?auto_32823 ) ( CLEAR ?auto_32822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32826 ?auto_32827 ?auto_32825 ?auto_32824 ?auto_32823 )
      ( MAKE-4PILE ?auto_32822 ?auto_32823 ?auto_32824 ?auto_32825 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32829 - BLOCK
    )
    :vars
    (
      ?auto_32830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32830 ?auto_32829 ) ( CLEAR ?auto_32830 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32829 ) ( not ( = ?auto_32829 ?auto_32830 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32830 ?auto_32829 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32831 - BLOCK
    )
    :vars
    (
      ?auto_32832 - BLOCK
      ?auto_32833 - BLOCK
      ?auto_32834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32832 ?auto_32831 ) ( CLEAR ?auto_32832 ) ( ON-TABLE ?auto_32831 ) ( not ( = ?auto_32831 ?auto_32832 ) ) ( HOLDING ?auto_32833 ) ( CLEAR ?auto_32834 ) ( not ( = ?auto_32831 ?auto_32833 ) ) ( not ( = ?auto_32831 ?auto_32834 ) ) ( not ( = ?auto_32832 ?auto_32833 ) ) ( not ( = ?auto_32832 ?auto_32834 ) ) ( not ( = ?auto_32833 ?auto_32834 ) ) )
    :subtasks
    ( ( !STACK ?auto_32833 ?auto_32834 )
      ( MAKE-1PILE ?auto_32831 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32835 - BLOCK
    )
    :vars
    (
      ?auto_32838 - BLOCK
      ?auto_32837 - BLOCK
      ?auto_32836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32838 ?auto_32835 ) ( ON-TABLE ?auto_32835 ) ( not ( = ?auto_32835 ?auto_32838 ) ) ( CLEAR ?auto_32837 ) ( not ( = ?auto_32835 ?auto_32836 ) ) ( not ( = ?auto_32835 ?auto_32837 ) ) ( not ( = ?auto_32838 ?auto_32836 ) ) ( not ( = ?auto_32838 ?auto_32837 ) ) ( not ( = ?auto_32836 ?auto_32837 ) ) ( ON ?auto_32836 ?auto_32838 ) ( CLEAR ?auto_32836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32835 ?auto_32838 )
      ( MAKE-1PILE ?auto_32835 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32839 - BLOCK
    )
    :vars
    (
      ?auto_32841 - BLOCK
      ?auto_32842 - BLOCK
      ?auto_32840 - BLOCK
      ?auto_32844 - BLOCK
      ?auto_32843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32841 ?auto_32839 ) ( ON-TABLE ?auto_32839 ) ( not ( = ?auto_32839 ?auto_32841 ) ) ( not ( = ?auto_32839 ?auto_32842 ) ) ( not ( = ?auto_32839 ?auto_32840 ) ) ( not ( = ?auto_32841 ?auto_32842 ) ) ( not ( = ?auto_32841 ?auto_32840 ) ) ( not ( = ?auto_32842 ?auto_32840 ) ) ( ON ?auto_32842 ?auto_32841 ) ( CLEAR ?auto_32842 ) ( HOLDING ?auto_32840 ) ( CLEAR ?auto_32844 ) ( ON-TABLE ?auto_32843 ) ( ON ?auto_32844 ?auto_32843 ) ( not ( = ?auto_32843 ?auto_32844 ) ) ( not ( = ?auto_32843 ?auto_32840 ) ) ( not ( = ?auto_32844 ?auto_32840 ) ) ( not ( = ?auto_32839 ?auto_32844 ) ) ( not ( = ?auto_32839 ?auto_32843 ) ) ( not ( = ?auto_32841 ?auto_32844 ) ) ( not ( = ?auto_32841 ?auto_32843 ) ) ( not ( = ?auto_32842 ?auto_32844 ) ) ( not ( = ?auto_32842 ?auto_32843 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32843 ?auto_32844 ?auto_32840 )
      ( MAKE-1PILE ?auto_32839 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32845 - BLOCK
    )
    :vars
    (
      ?auto_32849 - BLOCK
      ?auto_32846 - BLOCK
      ?auto_32850 - BLOCK
      ?auto_32847 - BLOCK
      ?auto_32848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32849 ?auto_32845 ) ( ON-TABLE ?auto_32845 ) ( not ( = ?auto_32845 ?auto_32849 ) ) ( not ( = ?auto_32845 ?auto_32846 ) ) ( not ( = ?auto_32845 ?auto_32850 ) ) ( not ( = ?auto_32849 ?auto_32846 ) ) ( not ( = ?auto_32849 ?auto_32850 ) ) ( not ( = ?auto_32846 ?auto_32850 ) ) ( ON ?auto_32846 ?auto_32849 ) ( CLEAR ?auto_32847 ) ( ON-TABLE ?auto_32848 ) ( ON ?auto_32847 ?auto_32848 ) ( not ( = ?auto_32848 ?auto_32847 ) ) ( not ( = ?auto_32848 ?auto_32850 ) ) ( not ( = ?auto_32847 ?auto_32850 ) ) ( not ( = ?auto_32845 ?auto_32847 ) ) ( not ( = ?auto_32845 ?auto_32848 ) ) ( not ( = ?auto_32849 ?auto_32847 ) ) ( not ( = ?auto_32849 ?auto_32848 ) ) ( not ( = ?auto_32846 ?auto_32847 ) ) ( not ( = ?auto_32846 ?auto_32848 ) ) ( ON ?auto_32850 ?auto_32846 ) ( CLEAR ?auto_32850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32845 ?auto_32849 ?auto_32846 )
      ( MAKE-1PILE ?auto_32845 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32851 - BLOCK
    )
    :vars
    (
      ?auto_32854 - BLOCK
      ?auto_32852 - BLOCK
      ?auto_32853 - BLOCK
      ?auto_32855 - BLOCK
      ?auto_32856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32854 ?auto_32851 ) ( ON-TABLE ?auto_32851 ) ( not ( = ?auto_32851 ?auto_32854 ) ) ( not ( = ?auto_32851 ?auto_32852 ) ) ( not ( = ?auto_32851 ?auto_32853 ) ) ( not ( = ?auto_32854 ?auto_32852 ) ) ( not ( = ?auto_32854 ?auto_32853 ) ) ( not ( = ?auto_32852 ?auto_32853 ) ) ( ON ?auto_32852 ?auto_32854 ) ( ON-TABLE ?auto_32855 ) ( not ( = ?auto_32855 ?auto_32856 ) ) ( not ( = ?auto_32855 ?auto_32853 ) ) ( not ( = ?auto_32856 ?auto_32853 ) ) ( not ( = ?auto_32851 ?auto_32856 ) ) ( not ( = ?auto_32851 ?auto_32855 ) ) ( not ( = ?auto_32854 ?auto_32856 ) ) ( not ( = ?auto_32854 ?auto_32855 ) ) ( not ( = ?auto_32852 ?auto_32856 ) ) ( not ( = ?auto_32852 ?auto_32855 ) ) ( ON ?auto_32853 ?auto_32852 ) ( CLEAR ?auto_32853 ) ( HOLDING ?auto_32856 ) ( CLEAR ?auto_32855 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32855 ?auto_32856 )
      ( MAKE-1PILE ?auto_32851 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33320 - BLOCK
    )
    :vars
    (
      ?auto_33323 - BLOCK
      ?auto_33321 - BLOCK
      ?auto_33324 - BLOCK
      ?auto_33322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33323 ?auto_33320 ) ( ON-TABLE ?auto_33320 ) ( not ( = ?auto_33320 ?auto_33323 ) ) ( not ( = ?auto_33320 ?auto_33321 ) ) ( not ( = ?auto_33320 ?auto_33324 ) ) ( not ( = ?auto_33323 ?auto_33321 ) ) ( not ( = ?auto_33323 ?auto_33324 ) ) ( not ( = ?auto_33321 ?auto_33324 ) ) ( ON ?auto_33321 ?auto_33323 ) ( not ( = ?auto_33322 ?auto_33324 ) ) ( not ( = ?auto_33320 ?auto_33322 ) ) ( not ( = ?auto_33323 ?auto_33322 ) ) ( not ( = ?auto_33321 ?auto_33322 ) ) ( ON ?auto_33324 ?auto_33321 ) ( ON ?auto_33322 ?auto_33324 ) ( CLEAR ?auto_33322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33320 ?auto_33323 ?auto_33321 ?auto_33324 )
      ( MAKE-1PILE ?auto_33320 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32863 - BLOCK
    )
    :vars
    (
      ?auto_32867 - BLOCK
      ?auto_32866 - BLOCK
      ?auto_32865 - BLOCK
      ?auto_32864 - BLOCK
      ?auto_32868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32867 ?auto_32863 ) ( ON-TABLE ?auto_32863 ) ( not ( = ?auto_32863 ?auto_32867 ) ) ( not ( = ?auto_32863 ?auto_32866 ) ) ( not ( = ?auto_32863 ?auto_32865 ) ) ( not ( = ?auto_32867 ?auto_32866 ) ) ( not ( = ?auto_32867 ?auto_32865 ) ) ( not ( = ?auto_32866 ?auto_32865 ) ) ( ON ?auto_32866 ?auto_32867 ) ( not ( = ?auto_32864 ?auto_32868 ) ) ( not ( = ?auto_32864 ?auto_32865 ) ) ( not ( = ?auto_32868 ?auto_32865 ) ) ( not ( = ?auto_32863 ?auto_32868 ) ) ( not ( = ?auto_32863 ?auto_32864 ) ) ( not ( = ?auto_32867 ?auto_32868 ) ) ( not ( = ?auto_32867 ?auto_32864 ) ) ( not ( = ?auto_32866 ?auto_32868 ) ) ( not ( = ?auto_32866 ?auto_32864 ) ) ( ON ?auto_32865 ?auto_32866 ) ( ON ?auto_32868 ?auto_32865 ) ( CLEAR ?auto_32868 ) ( HOLDING ?auto_32864 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32864 )
      ( MAKE-1PILE ?auto_32863 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32869 - BLOCK
    )
    :vars
    (
      ?auto_32874 - BLOCK
      ?auto_32873 - BLOCK
      ?auto_32872 - BLOCK
      ?auto_32871 - BLOCK
      ?auto_32870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32874 ?auto_32869 ) ( ON-TABLE ?auto_32869 ) ( not ( = ?auto_32869 ?auto_32874 ) ) ( not ( = ?auto_32869 ?auto_32873 ) ) ( not ( = ?auto_32869 ?auto_32872 ) ) ( not ( = ?auto_32874 ?auto_32873 ) ) ( not ( = ?auto_32874 ?auto_32872 ) ) ( not ( = ?auto_32873 ?auto_32872 ) ) ( ON ?auto_32873 ?auto_32874 ) ( not ( = ?auto_32871 ?auto_32870 ) ) ( not ( = ?auto_32871 ?auto_32872 ) ) ( not ( = ?auto_32870 ?auto_32872 ) ) ( not ( = ?auto_32869 ?auto_32870 ) ) ( not ( = ?auto_32869 ?auto_32871 ) ) ( not ( = ?auto_32874 ?auto_32870 ) ) ( not ( = ?auto_32874 ?auto_32871 ) ) ( not ( = ?auto_32873 ?auto_32870 ) ) ( not ( = ?auto_32873 ?auto_32871 ) ) ( ON ?auto_32872 ?auto_32873 ) ( ON ?auto_32870 ?auto_32872 ) ( ON ?auto_32871 ?auto_32870 ) ( CLEAR ?auto_32871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32869 ?auto_32874 ?auto_32873 ?auto_32872 ?auto_32870 )
      ( MAKE-1PILE ?auto_32869 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32880 - BLOCK
      ?auto_32881 - BLOCK
      ?auto_32882 - BLOCK
      ?auto_32883 - BLOCK
      ?auto_32884 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_32884 ) ( CLEAR ?auto_32883 ) ( ON-TABLE ?auto_32880 ) ( ON ?auto_32881 ?auto_32880 ) ( ON ?auto_32882 ?auto_32881 ) ( ON ?auto_32883 ?auto_32882 ) ( not ( = ?auto_32880 ?auto_32881 ) ) ( not ( = ?auto_32880 ?auto_32882 ) ) ( not ( = ?auto_32880 ?auto_32883 ) ) ( not ( = ?auto_32880 ?auto_32884 ) ) ( not ( = ?auto_32881 ?auto_32882 ) ) ( not ( = ?auto_32881 ?auto_32883 ) ) ( not ( = ?auto_32881 ?auto_32884 ) ) ( not ( = ?auto_32882 ?auto_32883 ) ) ( not ( = ?auto_32882 ?auto_32884 ) ) ( not ( = ?auto_32883 ?auto_32884 ) ) )
    :subtasks
    ( ( !STACK ?auto_32884 ?auto_32883 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32885 - BLOCK
      ?auto_32886 - BLOCK
      ?auto_32887 - BLOCK
      ?auto_32888 - BLOCK
      ?auto_32889 - BLOCK
    )
    :vars
    (
      ?auto_32890 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32888 ) ( ON-TABLE ?auto_32885 ) ( ON ?auto_32886 ?auto_32885 ) ( ON ?auto_32887 ?auto_32886 ) ( ON ?auto_32888 ?auto_32887 ) ( not ( = ?auto_32885 ?auto_32886 ) ) ( not ( = ?auto_32885 ?auto_32887 ) ) ( not ( = ?auto_32885 ?auto_32888 ) ) ( not ( = ?auto_32885 ?auto_32889 ) ) ( not ( = ?auto_32886 ?auto_32887 ) ) ( not ( = ?auto_32886 ?auto_32888 ) ) ( not ( = ?auto_32886 ?auto_32889 ) ) ( not ( = ?auto_32887 ?auto_32888 ) ) ( not ( = ?auto_32887 ?auto_32889 ) ) ( not ( = ?auto_32888 ?auto_32889 ) ) ( ON ?auto_32889 ?auto_32890 ) ( CLEAR ?auto_32889 ) ( HAND-EMPTY ) ( not ( = ?auto_32885 ?auto_32890 ) ) ( not ( = ?auto_32886 ?auto_32890 ) ) ( not ( = ?auto_32887 ?auto_32890 ) ) ( not ( = ?auto_32888 ?auto_32890 ) ) ( not ( = ?auto_32889 ?auto_32890 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32889 ?auto_32890 )
      ( MAKE-5PILE ?auto_32885 ?auto_32886 ?auto_32887 ?auto_32888 ?auto_32889 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32891 - BLOCK
      ?auto_32892 - BLOCK
      ?auto_32893 - BLOCK
      ?auto_32894 - BLOCK
      ?auto_32895 - BLOCK
    )
    :vars
    (
      ?auto_32896 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32891 ) ( ON ?auto_32892 ?auto_32891 ) ( ON ?auto_32893 ?auto_32892 ) ( not ( = ?auto_32891 ?auto_32892 ) ) ( not ( = ?auto_32891 ?auto_32893 ) ) ( not ( = ?auto_32891 ?auto_32894 ) ) ( not ( = ?auto_32891 ?auto_32895 ) ) ( not ( = ?auto_32892 ?auto_32893 ) ) ( not ( = ?auto_32892 ?auto_32894 ) ) ( not ( = ?auto_32892 ?auto_32895 ) ) ( not ( = ?auto_32893 ?auto_32894 ) ) ( not ( = ?auto_32893 ?auto_32895 ) ) ( not ( = ?auto_32894 ?auto_32895 ) ) ( ON ?auto_32895 ?auto_32896 ) ( CLEAR ?auto_32895 ) ( not ( = ?auto_32891 ?auto_32896 ) ) ( not ( = ?auto_32892 ?auto_32896 ) ) ( not ( = ?auto_32893 ?auto_32896 ) ) ( not ( = ?auto_32894 ?auto_32896 ) ) ( not ( = ?auto_32895 ?auto_32896 ) ) ( HOLDING ?auto_32894 ) ( CLEAR ?auto_32893 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32891 ?auto_32892 ?auto_32893 ?auto_32894 )
      ( MAKE-5PILE ?auto_32891 ?auto_32892 ?auto_32893 ?auto_32894 ?auto_32895 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32897 - BLOCK
      ?auto_32898 - BLOCK
      ?auto_32899 - BLOCK
      ?auto_32900 - BLOCK
      ?auto_32901 - BLOCK
    )
    :vars
    (
      ?auto_32902 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32897 ) ( ON ?auto_32898 ?auto_32897 ) ( ON ?auto_32899 ?auto_32898 ) ( not ( = ?auto_32897 ?auto_32898 ) ) ( not ( = ?auto_32897 ?auto_32899 ) ) ( not ( = ?auto_32897 ?auto_32900 ) ) ( not ( = ?auto_32897 ?auto_32901 ) ) ( not ( = ?auto_32898 ?auto_32899 ) ) ( not ( = ?auto_32898 ?auto_32900 ) ) ( not ( = ?auto_32898 ?auto_32901 ) ) ( not ( = ?auto_32899 ?auto_32900 ) ) ( not ( = ?auto_32899 ?auto_32901 ) ) ( not ( = ?auto_32900 ?auto_32901 ) ) ( ON ?auto_32901 ?auto_32902 ) ( not ( = ?auto_32897 ?auto_32902 ) ) ( not ( = ?auto_32898 ?auto_32902 ) ) ( not ( = ?auto_32899 ?auto_32902 ) ) ( not ( = ?auto_32900 ?auto_32902 ) ) ( not ( = ?auto_32901 ?auto_32902 ) ) ( CLEAR ?auto_32899 ) ( ON ?auto_32900 ?auto_32901 ) ( CLEAR ?auto_32900 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32902 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32902 ?auto_32901 )
      ( MAKE-5PILE ?auto_32897 ?auto_32898 ?auto_32899 ?auto_32900 ?auto_32901 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32903 - BLOCK
      ?auto_32904 - BLOCK
      ?auto_32905 - BLOCK
      ?auto_32906 - BLOCK
      ?auto_32907 - BLOCK
    )
    :vars
    (
      ?auto_32908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32903 ) ( ON ?auto_32904 ?auto_32903 ) ( not ( = ?auto_32903 ?auto_32904 ) ) ( not ( = ?auto_32903 ?auto_32905 ) ) ( not ( = ?auto_32903 ?auto_32906 ) ) ( not ( = ?auto_32903 ?auto_32907 ) ) ( not ( = ?auto_32904 ?auto_32905 ) ) ( not ( = ?auto_32904 ?auto_32906 ) ) ( not ( = ?auto_32904 ?auto_32907 ) ) ( not ( = ?auto_32905 ?auto_32906 ) ) ( not ( = ?auto_32905 ?auto_32907 ) ) ( not ( = ?auto_32906 ?auto_32907 ) ) ( ON ?auto_32907 ?auto_32908 ) ( not ( = ?auto_32903 ?auto_32908 ) ) ( not ( = ?auto_32904 ?auto_32908 ) ) ( not ( = ?auto_32905 ?auto_32908 ) ) ( not ( = ?auto_32906 ?auto_32908 ) ) ( not ( = ?auto_32907 ?auto_32908 ) ) ( ON ?auto_32906 ?auto_32907 ) ( CLEAR ?auto_32906 ) ( ON-TABLE ?auto_32908 ) ( HOLDING ?auto_32905 ) ( CLEAR ?auto_32904 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32903 ?auto_32904 ?auto_32905 )
      ( MAKE-5PILE ?auto_32903 ?auto_32904 ?auto_32905 ?auto_32906 ?auto_32907 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
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
    ( and ( ON-TABLE ?auto_32909 ) ( ON ?auto_32910 ?auto_32909 ) ( not ( = ?auto_32909 ?auto_32910 ) ) ( not ( = ?auto_32909 ?auto_32911 ) ) ( not ( = ?auto_32909 ?auto_32912 ) ) ( not ( = ?auto_32909 ?auto_32913 ) ) ( not ( = ?auto_32910 ?auto_32911 ) ) ( not ( = ?auto_32910 ?auto_32912 ) ) ( not ( = ?auto_32910 ?auto_32913 ) ) ( not ( = ?auto_32911 ?auto_32912 ) ) ( not ( = ?auto_32911 ?auto_32913 ) ) ( not ( = ?auto_32912 ?auto_32913 ) ) ( ON ?auto_32913 ?auto_32914 ) ( not ( = ?auto_32909 ?auto_32914 ) ) ( not ( = ?auto_32910 ?auto_32914 ) ) ( not ( = ?auto_32911 ?auto_32914 ) ) ( not ( = ?auto_32912 ?auto_32914 ) ) ( not ( = ?auto_32913 ?auto_32914 ) ) ( ON ?auto_32912 ?auto_32913 ) ( ON-TABLE ?auto_32914 ) ( CLEAR ?auto_32910 ) ( ON ?auto_32911 ?auto_32912 ) ( CLEAR ?auto_32911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32914 ?auto_32913 ?auto_32912 )
      ( MAKE-5PILE ?auto_32909 ?auto_32910 ?auto_32911 ?auto_32912 ?auto_32913 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32915 - BLOCK
      ?auto_32916 - BLOCK
      ?auto_32917 - BLOCK
      ?auto_32918 - BLOCK
      ?auto_32919 - BLOCK
    )
    :vars
    (
      ?auto_32920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32915 ) ( not ( = ?auto_32915 ?auto_32916 ) ) ( not ( = ?auto_32915 ?auto_32917 ) ) ( not ( = ?auto_32915 ?auto_32918 ) ) ( not ( = ?auto_32915 ?auto_32919 ) ) ( not ( = ?auto_32916 ?auto_32917 ) ) ( not ( = ?auto_32916 ?auto_32918 ) ) ( not ( = ?auto_32916 ?auto_32919 ) ) ( not ( = ?auto_32917 ?auto_32918 ) ) ( not ( = ?auto_32917 ?auto_32919 ) ) ( not ( = ?auto_32918 ?auto_32919 ) ) ( ON ?auto_32919 ?auto_32920 ) ( not ( = ?auto_32915 ?auto_32920 ) ) ( not ( = ?auto_32916 ?auto_32920 ) ) ( not ( = ?auto_32917 ?auto_32920 ) ) ( not ( = ?auto_32918 ?auto_32920 ) ) ( not ( = ?auto_32919 ?auto_32920 ) ) ( ON ?auto_32918 ?auto_32919 ) ( ON-TABLE ?auto_32920 ) ( ON ?auto_32917 ?auto_32918 ) ( CLEAR ?auto_32917 ) ( HOLDING ?auto_32916 ) ( CLEAR ?auto_32915 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32915 ?auto_32916 )
      ( MAKE-5PILE ?auto_32915 ?auto_32916 ?auto_32917 ?auto_32918 ?auto_32919 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32921 - BLOCK
      ?auto_32922 - BLOCK
      ?auto_32923 - BLOCK
      ?auto_32924 - BLOCK
      ?auto_32925 - BLOCK
    )
    :vars
    (
      ?auto_32926 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32921 ) ( not ( = ?auto_32921 ?auto_32922 ) ) ( not ( = ?auto_32921 ?auto_32923 ) ) ( not ( = ?auto_32921 ?auto_32924 ) ) ( not ( = ?auto_32921 ?auto_32925 ) ) ( not ( = ?auto_32922 ?auto_32923 ) ) ( not ( = ?auto_32922 ?auto_32924 ) ) ( not ( = ?auto_32922 ?auto_32925 ) ) ( not ( = ?auto_32923 ?auto_32924 ) ) ( not ( = ?auto_32923 ?auto_32925 ) ) ( not ( = ?auto_32924 ?auto_32925 ) ) ( ON ?auto_32925 ?auto_32926 ) ( not ( = ?auto_32921 ?auto_32926 ) ) ( not ( = ?auto_32922 ?auto_32926 ) ) ( not ( = ?auto_32923 ?auto_32926 ) ) ( not ( = ?auto_32924 ?auto_32926 ) ) ( not ( = ?auto_32925 ?auto_32926 ) ) ( ON ?auto_32924 ?auto_32925 ) ( ON-TABLE ?auto_32926 ) ( ON ?auto_32923 ?auto_32924 ) ( CLEAR ?auto_32921 ) ( ON ?auto_32922 ?auto_32923 ) ( CLEAR ?auto_32922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32926 ?auto_32925 ?auto_32924 ?auto_32923 )
      ( MAKE-5PILE ?auto_32921 ?auto_32922 ?auto_32923 ?auto_32924 ?auto_32925 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32927 - BLOCK
      ?auto_32928 - BLOCK
      ?auto_32929 - BLOCK
      ?auto_32930 - BLOCK
      ?auto_32931 - BLOCK
    )
    :vars
    (
      ?auto_32932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32927 ?auto_32928 ) ) ( not ( = ?auto_32927 ?auto_32929 ) ) ( not ( = ?auto_32927 ?auto_32930 ) ) ( not ( = ?auto_32927 ?auto_32931 ) ) ( not ( = ?auto_32928 ?auto_32929 ) ) ( not ( = ?auto_32928 ?auto_32930 ) ) ( not ( = ?auto_32928 ?auto_32931 ) ) ( not ( = ?auto_32929 ?auto_32930 ) ) ( not ( = ?auto_32929 ?auto_32931 ) ) ( not ( = ?auto_32930 ?auto_32931 ) ) ( ON ?auto_32931 ?auto_32932 ) ( not ( = ?auto_32927 ?auto_32932 ) ) ( not ( = ?auto_32928 ?auto_32932 ) ) ( not ( = ?auto_32929 ?auto_32932 ) ) ( not ( = ?auto_32930 ?auto_32932 ) ) ( not ( = ?auto_32931 ?auto_32932 ) ) ( ON ?auto_32930 ?auto_32931 ) ( ON-TABLE ?auto_32932 ) ( ON ?auto_32929 ?auto_32930 ) ( ON ?auto_32928 ?auto_32929 ) ( CLEAR ?auto_32928 ) ( HOLDING ?auto_32927 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32927 )
      ( MAKE-5PILE ?auto_32927 ?auto_32928 ?auto_32929 ?auto_32930 ?auto_32931 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32933 - BLOCK
      ?auto_32934 - BLOCK
      ?auto_32935 - BLOCK
      ?auto_32936 - BLOCK
      ?auto_32937 - BLOCK
    )
    :vars
    (
      ?auto_32938 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32933 ?auto_32934 ) ) ( not ( = ?auto_32933 ?auto_32935 ) ) ( not ( = ?auto_32933 ?auto_32936 ) ) ( not ( = ?auto_32933 ?auto_32937 ) ) ( not ( = ?auto_32934 ?auto_32935 ) ) ( not ( = ?auto_32934 ?auto_32936 ) ) ( not ( = ?auto_32934 ?auto_32937 ) ) ( not ( = ?auto_32935 ?auto_32936 ) ) ( not ( = ?auto_32935 ?auto_32937 ) ) ( not ( = ?auto_32936 ?auto_32937 ) ) ( ON ?auto_32937 ?auto_32938 ) ( not ( = ?auto_32933 ?auto_32938 ) ) ( not ( = ?auto_32934 ?auto_32938 ) ) ( not ( = ?auto_32935 ?auto_32938 ) ) ( not ( = ?auto_32936 ?auto_32938 ) ) ( not ( = ?auto_32937 ?auto_32938 ) ) ( ON ?auto_32936 ?auto_32937 ) ( ON-TABLE ?auto_32938 ) ( ON ?auto_32935 ?auto_32936 ) ( ON ?auto_32934 ?auto_32935 ) ( ON ?auto_32933 ?auto_32934 ) ( CLEAR ?auto_32933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32938 ?auto_32937 ?auto_32936 ?auto_32935 ?auto_32934 )
      ( MAKE-5PILE ?auto_32933 ?auto_32934 ?auto_32935 ?auto_32936 ?auto_32937 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32997 - BLOCK
    )
    :vars
    (
      ?auto_32998 - BLOCK
      ?auto_32999 - BLOCK
      ?auto_33000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32997 ?auto_32998 ) ( CLEAR ?auto_32997 ) ( not ( = ?auto_32997 ?auto_32998 ) ) ( HOLDING ?auto_32999 ) ( CLEAR ?auto_33000 ) ( not ( = ?auto_32997 ?auto_32999 ) ) ( not ( = ?auto_32997 ?auto_33000 ) ) ( not ( = ?auto_32998 ?auto_32999 ) ) ( not ( = ?auto_32998 ?auto_33000 ) ) ( not ( = ?auto_32999 ?auto_33000 ) ) )
    :subtasks
    ( ( !STACK ?auto_32999 ?auto_33000 )
      ( MAKE-1PILE ?auto_32997 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33001 - BLOCK
    )
    :vars
    (
      ?auto_33004 - BLOCK
      ?auto_33003 - BLOCK
      ?auto_33002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33001 ?auto_33004 ) ( not ( = ?auto_33001 ?auto_33004 ) ) ( CLEAR ?auto_33003 ) ( not ( = ?auto_33001 ?auto_33002 ) ) ( not ( = ?auto_33001 ?auto_33003 ) ) ( not ( = ?auto_33004 ?auto_33002 ) ) ( not ( = ?auto_33004 ?auto_33003 ) ) ( not ( = ?auto_33002 ?auto_33003 ) ) ( ON ?auto_33002 ?auto_33001 ) ( CLEAR ?auto_33002 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33004 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33004 ?auto_33001 )
      ( MAKE-1PILE ?auto_33001 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33005 - BLOCK
    )
    :vars
    (
      ?auto_33006 - BLOCK
      ?auto_33007 - BLOCK
      ?auto_33008 - BLOCK
      ?auto_33010 - BLOCK
      ?auto_33009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33005 ?auto_33006 ) ( not ( = ?auto_33005 ?auto_33006 ) ) ( not ( = ?auto_33005 ?auto_33007 ) ) ( not ( = ?auto_33005 ?auto_33008 ) ) ( not ( = ?auto_33006 ?auto_33007 ) ) ( not ( = ?auto_33006 ?auto_33008 ) ) ( not ( = ?auto_33007 ?auto_33008 ) ) ( ON ?auto_33007 ?auto_33005 ) ( CLEAR ?auto_33007 ) ( ON-TABLE ?auto_33006 ) ( HOLDING ?auto_33008 ) ( CLEAR ?auto_33010 ) ( ON-TABLE ?auto_33009 ) ( ON ?auto_33010 ?auto_33009 ) ( not ( = ?auto_33009 ?auto_33010 ) ) ( not ( = ?auto_33009 ?auto_33008 ) ) ( not ( = ?auto_33010 ?auto_33008 ) ) ( not ( = ?auto_33005 ?auto_33010 ) ) ( not ( = ?auto_33005 ?auto_33009 ) ) ( not ( = ?auto_33006 ?auto_33010 ) ) ( not ( = ?auto_33006 ?auto_33009 ) ) ( not ( = ?auto_33007 ?auto_33010 ) ) ( not ( = ?auto_33007 ?auto_33009 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33009 ?auto_33010 ?auto_33008 )
      ( MAKE-1PILE ?auto_33005 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33011 - BLOCK
    )
    :vars
    (
      ?auto_33016 - BLOCK
      ?auto_33012 - BLOCK
      ?auto_33013 - BLOCK
      ?auto_33015 - BLOCK
      ?auto_33014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33011 ?auto_33016 ) ( not ( = ?auto_33011 ?auto_33016 ) ) ( not ( = ?auto_33011 ?auto_33012 ) ) ( not ( = ?auto_33011 ?auto_33013 ) ) ( not ( = ?auto_33016 ?auto_33012 ) ) ( not ( = ?auto_33016 ?auto_33013 ) ) ( not ( = ?auto_33012 ?auto_33013 ) ) ( ON ?auto_33012 ?auto_33011 ) ( ON-TABLE ?auto_33016 ) ( CLEAR ?auto_33015 ) ( ON-TABLE ?auto_33014 ) ( ON ?auto_33015 ?auto_33014 ) ( not ( = ?auto_33014 ?auto_33015 ) ) ( not ( = ?auto_33014 ?auto_33013 ) ) ( not ( = ?auto_33015 ?auto_33013 ) ) ( not ( = ?auto_33011 ?auto_33015 ) ) ( not ( = ?auto_33011 ?auto_33014 ) ) ( not ( = ?auto_33016 ?auto_33015 ) ) ( not ( = ?auto_33016 ?auto_33014 ) ) ( not ( = ?auto_33012 ?auto_33015 ) ) ( not ( = ?auto_33012 ?auto_33014 ) ) ( ON ?auto_33013 ?auto_33012 ) ( CLEAR ?auto_33013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33016 ?auto_33011 ?auto_33012 )
      ( MAKE-1PILE ?auto_33011 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33017 - BLOCK
    )
    :vars
    (
      ?auto_33019 - BLOCK
      ?auto_33022 - BLOCK
      ?auto_33021 - BLOCK
      ?auto_33020 - BLOCK
      ?auto_33018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33017 ?auto_33019 ) ( not ( = ?auto_33017 ?auto_33019 ) ) ( not ( = ?auto_33017 ?auto_33022 ) ) ( not ( = ?auto_33017 ?auto_33021 ) ) ( not ( = ?auto_33019 ?auto_33022 ) ) ( not ( = ?auto_33019 ?auto_33021 ) ) ( not ( = ?auto_33022 ?auto_33021 ) ) ( ON ?auto_33022 ?auto_33017 ) ( ON-TABLE ?auto_33019 ) ( ON-TABLE ?auto_33020 ) ( not ( = ?auto_33020 ?auto_33018 ) ) ( not ( = ?auto_33020 ?auto_33021 ) ) ( not ( = ?auto_33018 ?auto_33021 ) ) ( not ( = ?auto_33017 ?auto_33018 ) ) ( not ( = ?auto_33017 ?auto_33020 ) ) ( not ( = ?auto_33019 ?auto_33018 ) ) ( not ( = ?auto_33019 ?auto_33020 ) ) ( not ( = ?auto_33022 ?auto_33018 ) ) ( not ( = ?auto_33022 ?auto_33020 ) ) ( ON ?auto_33021 ?auto_33022 ) ( CLEAR ?auto_33021 ) ( HOLDING ?auto_33018 ) ( CLEAR ?auto_33020 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33020 ?auto_33018 )
      ( MAKE-1PILE ?auto_33017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33023 - BLOCK
    )
    :vars
    (
      ?auto_33027 - BLOCK
      ?auto_33024 - BLOCK
      ?auto_33025 - BLOCK
      ?auto_33028 - BLOCK
      ?auto_33026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33023 ?auto_33027 ) ( not ( = ?auto_33023 ?auto_33027 ) ) ( not ( = ?auto_33023 ?auto_33024 ) ) ( not ( = ?auto_33023 ?auto_33025 ) ) ( not ( = ?auto_33027 ?auto_33024 ) ) ( not ( = ?auto_33027 ?auto_33025 ) ) ( not ( = ?auto_33024 ?auto_33025 ) ) ( ON ?auto_33024 ?auto_33023 ) ( ON-TABLE ?auto_33027 ) ( ON-TABLE ?auto_33028 ) ( not ( = ?auto_33028 ?auto_33026 ) ) ( not ( = ?auto_33028 ?auto_33025 ) ) ( not ( = ?auto_33026 ?auto_33025 ) ) ( not ( = ?auto_33023 ?auto_33026 ) ) ( not ( = ?auto_33023 ?auto_33028 ) ) ( not ( = ?auto_33027 ?auto_33026 ) ) ( not ( = ?auto_33027 ?auto_33028 ) ) ( not ( = ?auto_33024 ?auto_33026 ) ) ( not ( = ?auto_33024 ?auto_33028 ) ) ( ON ?auto_33025 ?auto_33024 ) ( CLEAR ?auto_33028 ) ( ON ?auto_33026 ?auto_33025 ) ( CLEAR ?auto_33026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33027 ?auto_33023 ?auto_33024 ?auto_33025 )
      ( MAKE-1PILE ?auto_33023 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33029 - BLOCK
    )
    :vars
    (
      ?auto_33032 - BLOCK
      ?auto_33033 - BLOCK
      ?auto_33030 - BLOCK
      ?auto_33034 - BLOCK
      ?auto_33031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33029 ?auto_33032 ) ( not ( = ?auto_33029 ?auto_33032 ) ) ( not ( = ?auto_33029 ?auto_33033 ) ) ( not ( = ?auto_33029 ?auto_33030 ) ) ( not ( = ?auto_33032 ?auto_33033 ) ) ( not ( = ?auto_33032 ?auto_33030 ) ) ( not ( = ?auto_33033 ?auto_33030 ) ) ( ON ?auto_33033 ?auto_33029 ) ( ON-TABLE ?auto_33032 ) ( not ( = ?auto_33034 ?auto_33031 ) ) ( not ( = ?auto_33034 ?auto_33030 ) ) ( not ( = ?auto_33031 ?auto_33030 ) ) ( not ( = ?auto_33029 ?auto_33031 ) ) ( not ( = ?auto_33029 ?auto_33034 ) ) ( not ( = ?auto_33032 ?auto_33031 ) ) ( not ( = ?auto_33032 ?auto_33034 ) ) ( not ( = ?auto_33033 ?auto_33031 ) ) ( not ( = ?auto_33033 ?auto_33034 ) ) ( ON ?auto_33030 ?auto_33033 ) ( ON ?auto_33031 ?auto_33030 ) ( CLEAR ?auto_33031 ) ( HOLDING ?auto_33034 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33034 )
      ( MAKE-1PILE ?auto_33029 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33035 - BLOCK
    )
    :vars
    (
      ?auto_33038 - BLOCK
      ?auto_33039 - BLOCK
      ?auto_33036 - BLOCK
      ?auto_33040 - BLOCK
      ?auto_33037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33035 ?auto_33038 ) ( not ( = ?auto_33035 ?auto_33038 ) ) ( not ( = ?auto_33035 ?auto_33039 ) ) ( not ( = ?auto_33035 ?auto_33036 ) ) ( not ( = ?auto_33038 ?auto_33039 ) ) ( not ( = ?auto_33038 ?auto_33036 ) ) ( not ( = ?auto_33039 ?auto_33036 ) ) ( ON ?auto_33039 ?auto_33035 ) ( ON-TABLE ?auto_33038 ) ( not ( = ?auto_33040 ?auto_33037 ) ) ( not ( = ?auto_33040 ?auto_33036 ) ) ( not ( = ?auto_33037 ?auto_33036 ) ) ( not ( = ?auto_33035 ?auto_33037 ) ) ( not ( = ?auto_33035 ?auto_33040 ) ) ( not ( = ?auto_33038 ?auto_33037 ) ) ( not ( = ?auto_33038 ?auto_33040 ) ) ( not ( = ?auto_33039 ?auto_33037 ) ) ( not ( = ?auto_33039 ?auto_33040 ) ) ( ON ?auto_33036 ?auto_33039 ) ( ON ?auto_33037 ?auto_33036 ) ( ON ?auto_33040 ?auto_33037 ) ( CLEAR ?auto_33040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33038 ?auto_33035 ?auto_33039 ?auto_33036 ?auto_33037 )
      ( MAKE-1PILE ?auto_33035 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33048 - BLOCK
      ?auto_33049 - BLOCK
      ?auto_33050 - BLOCK
    )
    :vars
    (
      ?auto_33051 - BLOCK
      ?auto_33052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33051 ?auto_33050 ) ( CLEAR ?auto_33051 ) ( ON-TABLE ?auto_33048 ) ( ON ?auto_33049 ?auto_33048 ) ( ON ?auto_33050 ?auto_33049 ) ( not ( = ?auto_33048 ?auto_33049 ) ) ( not ( = ?auto_33048 ?auto_33050 ) ) ( not ( = ?auto_33048 ?auto_33051 ) ) ( not ( = ?auto_33049 ?auto_33050 ) ) ( not ( = ?auto_33049 ?auto_33051 ) ) ( not ( = ?auto_33050 ?auto_33051 ) ) ( HOLDING ?auto_33052 ) ( not ( = ?auto_33048 ?auto_33052 ) ) ( not ( = ?auto_33049 ?auto_33052 ) ) ( not ( = ?auto_33050 ?auto_33052 ) ) ( not ( = ?auto_33051 ?auto_33052 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_33052 )
      ( MAKE-3PILE ?auto_33048 ?auto_33049 ?auto_33050 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33101 - BLOCK
      ?auto_33102 - BLOCK
    )
    :vars
    (
      ?auto_33103 - BLOCK
      ?auto_33104 - BLOCK
      ?auto_33105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33101 ?auto_33102 ) ) ( ON ?auto_33102 ?auto_33103 ) ( not ( = ?auto_33101 ?auto_33103 ) ) ( not ( = ?auto_33102 ?auto_33103 ) ) ( ON ?auto_33101 ?auto_33102 ) ( CLEAR ?auto_33101 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33104 ) ( ON ?auto_33105 ?auto_33104 ) ( ON ?auto_33103 ?auto_33105 ) ( not ( = ?auto_33104 ?auto_33105 ) ) ( not ( = ?auto_33104 ?auto_33103 ) ) ( not ( = ?auto_33104 ?auto_33102 ) ) ( not ( = ?auto_33104 ?auto_33101 ) ) ( not ( = ?auto_33105 ?auto_33103 ) ) ( not ( = ?auto_33105 ?auto_33102 ) ) ( not ( = ?auto_33105 ?auto_33101 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33104 ?auto_33105 ?auto_33103 ?auto_33102 )
      ( MAKE-2PILE ?auto_33101 ?auto_33102 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33108 - BLOCK
      ?auto_33109 - BLOCK
    )
    :vars
    (
      ?auto_33110 - BLOCK
      ?auto_33111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33108 ?auto_33109 ) ) ( ON ?auto_33109 ?auto_33110 ) ( CLEAR ?auto_33109 ) ( not ( = ?auto_33108 ?auto_33110 ) ) ( not ( = ?auto_33109 ?auto_33110 ) ) ( ON ?auto_33108 ?auto_33111 ) ( CLEAR ?auto_33108 ) ( HAND-EMPTY ) ( not ( = ?auto_33108 ?auto_33111 ) ) ( not ( = ?auto_33109 ?auto_33111 ) ) ( not ( = ?auto_33110 ?auto_33111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33108 ?auto_33111 )
      ( MAKE-2PILE ?auto_33108 ?auto_33109 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33112 - BLOCK
      ?auto_33113 - BLOCK
    )
    :vars
    (
      ?auto_33115 - BLOCK
      ?auto_33114 - BLOCK
      ?auto_33116 - BLOCK
      ?auto_33117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33112 ?auto_33113 ) ) ( not ( = ?auto_33112 ?auto_33115 ) ) ( not ( = ?auto_33113 ?auto_33115 ) ) ( ON ?auto_33112 ?auto_33114 ) ( CLEAR ?auto_33112 ) ( not ( = ?auto_33112 ?auto_33114 ) ) ( not ( = ?auto_33113 ?auto_33114 ) ) ( not ( = ?auto_33115 ?auto_33114 ) ) ( HOLDING ?auto_33113 ) ( CLEAR ?auto_33115 ) ( ON-TABLE ?auto_33116 ) ( ON ?auto_33117 ?auto_33116 ) ( ON ?auto_33115 ?auto_33117 ) ( not ( = ?auto_33116 ?auto_33117 ) ) ( not ( = ?auto_33116 ?auto_33115 ) ) ( not ( = ?auto_33116 ?auto_33113 ) ) ( not ( = ?auto_33117 ?auto_33115 ) ) ( not ( = ?auto_33117 ?auto_33113 ) ) ( not ( = ?auto_33112 ?auto_33116 ) ) ( not ( = ?auto_33112 ?auto_33117 ) ) ( not ( = ?auto_33114 ?auto_33116 ) ) ( not ( = ?auto_33114 ?auto_33117 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33116 ?auto_33117 ?auto_33115 ?auto_33113 )
      ( MAKE-2PILE ?auto_33112 ?auto_33113 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33118 - BLOCK
      ?auto_33119 - BLOCK
    )
    :vars
    (
      ?auto_33120 - BLOCK
      ?auto_33122 - BLOCK
      ?auto_33121 - BLOCK
      ?auto_33123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33118 ?auto_33119 ) ) ( not ( = ?auto_33118 ?auto_33120 ) ) ( not ( = ?auto_33119 ?auto_33120 ) ) ( ON ?auto_33118 ?auto_33122 ) ( not ( = ?auto_33118 ?auto_33122 ) ) ( not ( = ?auto_33119 ?auto_33122 ) ) ( not ( = ?auto_33120 ?auto_33122 ) ) ( CLEAR ?auto_33120 ) ( ON-TABLE ?auto_33121 ) ( ON ?auto_33123 ?auto_33121 ) ( ON ?auto_33120 ?auto_33123 ) ( not ( = ?auto_33121 ?auto_33123 ) ) ( not ( = ?auto_33121 ?auto_33120 ) ) ( not ( = ?auto_33121 ?auto_33119 ) ) ( not ( = ?auto_33123 ?auto_33120 ) ) ( not ( = ?auto_33123 ?auto_33119 ) ) ( not ( = ?auto_33118 ?auto_33121 ) ) ( not ( = ?auto_33118 ?auto_33123 ) ) ( not ( = ?auto_33122 ?auto_33121 ) ) ( not ( = ?auto_33122 ?auto_33123 ) ) ( ON ?auto_33119 ?auto_33118 ) ( CLEAR ?auto_33119 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33122 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33122 ?auto_33118 )
      ( MAKE-2PILE ?auto_33118 ?auto_33119 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33124 - BLOCK
      ?auto_33125 - BLOCK
    )
    :vars
    (
      ?auto_33126 - BLOCK
      ?auto_33129 - BLOCK
      ?auto_33127 - BLOCK
      ?auto_33128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33124 ?auto_33125 ) ) ( not ( = ?auto_33124 ?auto_33126 ) ) ( not ( = ?auto_33125 ?auto_33126 ) ) ( ON ?auto_33124 ?auto_33129 ) ( not ( = ?auto_33124 ?auto_33129 ) ) ( not ( = ?auto_33125 ?auto_33129 ) ) ( not ( = ?auto_33126 ?auto_33129 ) ) ( ON-TABLE ?auto_33127 ) ( ON ?auto_33128 ?auto_33127 ) ( not ( = ?auto_33127 ?auto_33128 ) ) ( not ( = ?auto_33127 ?auto_33126 ) ) ( not ( = ?auto_33127 ?auto_33125 ) ) ( not ( = ?auto_33128 ?auto_33126 ) ) ( not ( = ?auto_33128 ?auto_33125 ) ) ( not ( = ?auto_33124 ?auto_33127 ) ) ( not ( = ?auto_33124 ?auto_33128 ) ) ( not ( = ?auto_33129 ?auto_33127 ) ) ( not ( = ?auto_33129 ?auto_33128 ) ) ( ON ?auto_33125 ?auto_33124 ) ( CLEAR ?auto_33125 ) ( ON-TABLE ?auto_33129 ) ( HOLDING ?auto_33126 ) ( CLEAR ?auto_33128 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33127 ?auto_33128 ?auto_33126 )
      ( MAKE-2PILE ?auto_33124 ?auto_33125 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33130 - BLOCK
      ?auto_33131 - BLOCK
    )
    :vars
    (
      ?auto_33132 - BLOCK
      ?auto_33133 - BLOCK
      ?auto_33134 - BLOCK
      ?auto_33135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33130 ?auto_33131 ) ) ( not ( = ?auto_33130 ?auto_33132 ) ) ( not ( = ?auto_33131 ?auto_33132 ) ) ( ON ?auto_33130 ?auto_33133 ) ( not ( = ?auto_33130 ?auto_33133 ) ) ( not ( = ?auto_33131 ?auto_33133 ) ) ( not ( = ?auto_33132 ?auto_33133 ) ) ( ON-TABLE ?auto_33134 ) ( ON ?auto_33135 ?auto_33134 ) ( not ( = ?auto_33134 ?auto_33135 ) ) ( not ( = ?auto_33134 ?auto_33132 ) ) ( not ( = ?auto_33134 ?auto_33131 ) ) ( not ( = ?auto_33135 ?auto_33132 ) ) ( not ( = ?auto_33135 ?auto_33131 ) ) ( not ( = ?auto_33130 ?auto_33134 ) ) ( not ( = ?auto_33130 ?auto_33135 ) ) ( not ( = ?auto_33133 ?auto_33134 ) ) ( not ( = ?auto_33133 ?auto_33135 ) ) ( ON ?auto_33131 ?auto_33130 ) ( ON-TABLE ?auto_33133 ) ( CLEAR ?auto_33135 ) ( ON ?auto_33132 ?auto_33131 ) ( CLEAR ?auto_33132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33133 ?auto_33130 ?auto_33131 )
      ( MAKE-2PILE ?auto_33130 ?auto_33131 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33136 - BLOCK
      ?auto_33137 - BLOCK
    )
    :vars
    (
      ?auto_33139 - BLOCK
      ?auto_33140 - BLOCK
      ?auto_33141 - BLOCK
      ?auto_33138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33136 ?auto_33137 ) ) ( not ( = ?auto_33136 ?auto_33139 ) ) ( not ( = ?auto_33137 ?auto_33139 ) ) ( ON ?auto_33136 ?auto_33140 ) ( not ( = ?auto_33136 ?auto_33140 ) ) ( not ( = ?auto_33137 ?auto_33140 ) ) ( not ( = ?auto_33139 ?auto_33140 ) ) ( ON-TABLE ?auto_33141 ) ( not ( = ?auto_33141 ?auto_33138 ) ) ( not ( = ?auto_33141 ?auto_33139 ) ) ( not ( = ?auto_33141 ?auto_33137 ) ) ( not ( = ?auto_33138 ?auto_33139 ) ) ( not ( = ?auto_33138 ?auto_33137 ) ) ( not ( = ?auto_33136 ?auto_33141 ) ) ( not ( = ?auto_33136 ?auto_33138 ) ) ( not ( = ?auto_33140 ?auto_33141 ) ) ( not ( = ?auto_33140 ?auto_33138 ) ) ( ON ?auto_33137 ?auto_33136 ) ( ON-TABLE ?auto_33140 ) ( ON ?auto_33139 ?auto_33137 ) ( CLEAR ?auto_33139 ) ( HOLDING ?auto_33138 ) ( CLEAR ?auto_33141 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33141 ?auto_33138 )
      ( MAKE-2PILE ?auto_33136 ?auto_33137 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33142 - BLOCK
      ?auto_33143 - BLOCK
    )
    :vars
    (
      ?auto_33144 - BLOCK
      ?auto_33146 - BLOCK
      ?auto_33145 - BLOCK
      ?auto_33147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33142 ?auto_33143 ) ) ( not ( = ?auto_33142 ?auto_33144 ) ) ( not ( = ?auto_33143 ?auto_33144 ) ) ( ON ?auto_33142 ?auto_33146 ) ( not ( = ?auto_33142 ?auto_33146 ) ) ( not ( = ?auto_33143 ?auto_33146 ) ) ( not ( = ?auto_33144 ?auto_33146 ) ) ( ON-TABLE ?auto_33145 ) ( not ( = ?auto_33145 ?auto_33147 ) ) ( not ( = ?auto_33145 ?auto_33144 ) ) ( not ( = ?auto_33145 ?auto_33143 ) ) ( not ( = ?auto_33147 ?auto_33144 ) ) ( not ( = ?auto_33147 ?auto_33143 ) ) ( not ( = ?auto_33142 ?auto_33145 ) ) ( not ( = ?auto_33142 ?auto_33147 ) ) ( not ( = ?auto_33146 ?auto_33145 ) ) ( not ( = ?auto_33146 ?auto_33147 ) ) ( ON ?auto_33143 ?auto_33142 ) ( ON-TABLE ?auto_33146 ) ( ON ?auto_33144 ?auto_33143 ) ( CLEAR ?auto_33145 ) ( ON ?auto_33147 ?auto_33144 ) ( CLEAR ?auto_33147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33146 ?auto_33142 ?auto_33143 ?auto_33144 )
      ( MAKE-2PILE ?auto_33142 ?auto_33143 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33148 - BLOCK
      ?auto_33149 - BLOCK
    )
    :vars
    (
      ?auto_33150 - BLOCK
      ?auto_33152 - BLOCK
      ?auto_33153 - BLOCK
      ?auto_33151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33148 ?auto_33149 ) ) ( not ( = ?auto_33148 ?auto_33150 ) ) ( not ( = ?auto_33149 ?auto_33150 ) ) ( ON ?auto_33148 ?auto_33152 ) ( not ( = ?auto_33148 ?auto_33152 ) ) ( not ( = ?auto_33149 ?auto_33152 ) ) ( not ( = ?auto_33150 ?auto_33152 ) ) ( not ( = ?auto_33153 ?auto_33151 ) ) ( not ( = ?auto_33153 ?auto_33150 ) ) ( not ( = ?auto_33153 ?auto_33149 ) ) ( not ( = ?auto_33151 ?auto_33150 ) ) ( not ( = ?auto_33151 ?auto_33149 ) ) ( not ( = ?auto_33148 ?auto_33153 ) ) ( not ( = ?auto_33148 ?auto_33151 ) ) ( not ( = ?auto_33152 ?auto_33153 ) ) ( not ( = ?auto_33152 ?auto_33151 ) ) ( ON ?auto_33149 ?auto_33148 ) ( ON-TABLE ?auto_33152 ) ( ON ?auto_33150 ?auto_33149 ) ( ON ?auto_33151 ?auto_33150 ) ( CLEAR ?auto_33151 ) ( HOLDING ?auto_33153 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33153 )
      ( MAKE-2PILE ?auto_33148 ?auto_33149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33154 - BLOCK
      ?auto_33155 - BLOCK
    )
    :vars
    (
      ?auto_33158 - BLOCK
      ?auto_33157 - BLOCK
      ?auto_33159 - BLOCK
      ?auto_33156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33154 ?auto_33155 ) ) ( not ( = ?auto_33154 ?auto_33158 ) ) ( not ( = ?auto_33155 ?auto_33158 ) ) ( ON ?auto_33154 ?auto_33157 ) ( not ( = ?auto_33154 ?auto_33157 ) ) ( not ( = ?auto_33155 ?auto_33157 ) ) ( not ( = ?auto_33158 ?auto_33157 ) ) ( not ( = ?auto_33159 ?auto_33156 ) ) ( not ( = ?auto_33159 ?auto_33158 ) ) ( not ( = ?auto_33159 ?auto_33155 ) ) ( not ( = ?auto_33156 ?auto_33158 ) ) ( not ( = ?auto_33156 ?auto_33155 ) ) ( not ( = ?auto_33154 ?auto_33159 ) ) ( not ( = ?auto_33154 ?auto_33156 ) ) ( not ( = ?auto_33157 ?auto_33159 ) ) ( not ( = ?auto_33157 ?auto_33156 ) ) ( ON ?auto_33155 ?auto_33154 ) ( ON-TABLE ?auto_33157 ) ( ON ?auto_33158 ?auto_33155 ) ( ON ?auto_33156 ?auto_33158 ) ( ON ?auto_33159 ?auto_33156 ) ( CLEAR ?auto_33159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33157 ?auto_33154 ?auto_33155 ?auto_33158 ?auto_33156 )
      ( MAKE-2PILE ?auto_33154 ?auto_33155 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33175 - BLOCK
      ?auto_33176 - BLOCK
    )
    :vars
    (
      ?auto_33178 - BLOCK
      ?auto_33179 - BLOCK
      ?auto_33177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33178 ?auto_33176 ) ( ON-TABLE ?auto_33175 ) ( ON ?auto_33176 ?auto_33175 ) ( not ( = ?auto_33175 ?auto_33176 ) ) ( not ( = ?auto_33175 ?auto_33178 ) ) ( not ( = ?auto_33176 ?auto_33178 ) ) ( not ( = ?auto_33175 ?auto_33179 ) ) ( not ( = ?auto_33175 ?auto_33177 ) ) ( not ( = ?auto_33176 ?auto_33179 ) ) ( not ( = ?auto_33176 ?auto_33177 ) ) ( not ( = ?auto_33178 ?auto_33179 ) ) ( not ( = ?auto_33178 ?auto_33177 ) ) ( not ( = ?auto_33179 ?auto_33177 ) ) ( ON ?auto_33179 ?auto_33178 ) ( CLEAR ?auto_33179 ) ( HOLDING ?auto_33177 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33177 )
      ( MAKE-2PILE ?auto_33175 ?auto_33176 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33222 - BLOCK
      ?auto_33223 - BLOCK
      ?auto_33224 - BLOCK
    )
    :vars
    (
      ?auto_33225 - BLOCK
      ?auto_33226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33222 ) ( not ( = ?auto_33222 ?auto_33223 ) ) ( not ( = ?auto_33222 ?auto_33224 ) ) ( not ( = ?auto_33223 ?auto_33224 ) ) ( ON ?auto_33224 ?auto_33225 ) ( not ( = ?auto_33222 ?auto_33225 ) ) ( not ( = ?auto_33223 ?auto_33225 ) ) ( not ( = ?auto_33224 ?auto_33225 ) ) ( CLEAR ?auto_33222 ) ( ON ?auto_33223 ?auto_33224 ) ( CLEAR ?auto_33223 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33226 ) ( ON ?auto_33225 ?auto_33226 ) ( not ( = ?auto_33226 ?auto_33225 ) ) ( not ( = ?auto_33226 ?auto_33224 ) ) ( not ( = ?auto_33226 ?auto_33223 ) ) ( not ( = ?auto_33222 ?auto_33226 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33226 ?auto_33225 ?auto_33224 )
      ( MAKE-3PILE ?auto_33222 ?auto_33223 ?auto_33224 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33227 - BLOCK
      ?auto_33228 - BLOCK
      ?auto_33229 - BLOCK
    )
    :vars
    (
      ?auto_33230 - BLOCK
      ?auto_33231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33227 ?auto_33228 ) ) ( not ( = ?auto_33227 ?auto_33229 ) ) ( not ( = ?auto_33228 ?auto_33229 ) ) ( ON ?auto_33229 ?auto_33230 ) ( not ( = ?auto_33227 ?auto_33230 ) ) ( not ( = ?auto_33228 ?auto_33230 ) ) ( not ( = ?auto_33229 ?auto_33230 ) ) ( ON ?auto_33228 ?auto_33229 ) ( CLEAR ?auto_33228 ) ( ON-TABLE ?auto_33231 ) ( ON ?auto_33230 ?auto_33231 ) ( not ( = ?auto_33231 ?auto_33230 ) ) ( not ( = ?auto_33231 ?auto_33229 ) ) ( not ( = ?auto_33231 ?auto_33228 ) ) ( not ( = ?auto_33227 ?auto_33231 ) ) ( HOLDING ?auto_33227 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33227 )
      ( MAKE-3PILE ?auto_33227 ?auto_33228 ?auto_33229 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33232 - BLOCK
      ?auto_33233 - BLOCK
      ?auto_33234 - BLOCK
    )
    :vars
    (
      ?auto_33236 - BLOCK
      ?auto_33235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33232 ?auto_33233 ) ) ( not ( = ?auto_33232 ?auto_33234 ) ) ( not ( = ?auto_33233 ?auto_33234 ) ) ( ON ?auto_33234 ?auto_33236 ) ( not ( = ?auto_33232 ?auto_33236 ) ) ( not ( = ?auto_33233 ?auto_33236 ) ) ( not ( = ?auto_33234 ?auto_33236 ) ) ( ON ?auto_33233 ?auto_33234 ) ( ON-TABLE ?auto_33235 ) ( ON ?auto_33236 ?auto_33235 ) ( not ( = ?auto_33235 ?auto_33236 ) ) ( not ( = ?auto_33235 ?auto_33234 ) ) ( not ( = ?auto_33235 ?auto_33233 ) ) ( not ( = ?auto_33232 ?auto_33235 ) ) ( ON ?auto_33232 ?auto_33233 ) ( CLEAR ?auto_33232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33235 ?auto_33236 ?auto_33234 ?auto_33233 )
      ( MAKE-3PILE ?auto_33232 ?auto_33233 ?auto_33234 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33240 - BLOCK
      ?auto_33241 - BLOCK
      ?auto_33242 - BLOCK
    )
    :vars
    (
      ?auto_33244 - BLOCK
      ?auto_33243 - BLOCK
      ?auto_33245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33240 ?auto_33241 ) ) ( not ( = ?auto_33240 ?auto_33242 ) ) ( not ( = ?auto_33241 ?auto_33242 ) ) ( ON ?auto_33242 ?auto_33244 ) ( not ( = ?auto_33240 ?auto_33244 ) ) ( not ( = ?auto_33241 ?auto_33244 ) ) ( not ( = ?auto_33242 ?auto_33244 ) ) ( ON ?auto_33241 ?auto_33242 ) ( CLEAR ?auto_33241 ) ( ON-TABLE ?auto_33243 ) ( ON ?auto_33244 ?auto_33243 ) ( not ( = ?auto_33243 ?auto_33244 ) ) ( not ( = ?auto_33243 ?auto_33242 ) ) ( not ( = ?auto_33243 ?auto_33241 ) ) ( not ( = ?auto_33240 ?auto_33243 ) ) ( ON ?auto_33240 ?auto_33245 ) ( CLEAR ?auto_33240 ) ( HAND-EMPTY ) ( not ( = ?auto_33240 ?auto_33245 ) ) ( not ( = ?auto_33241 ?auto_33245 ) ) ( not ( = ?auto_33242 ?auto_33245 ) ) ( not ( = ?auto_33244 ?auto_33245 ) ) ( not ( = ?auto_33243 ?auto_33245 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33240 ?auto_33245 )
      ( MAKE-3PILE ?auto_33240 ?auto_33241 ?auto_33242 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33246 - BLOCK
      ?auto_33247 - BLOCK
      ?auto_33248 - BLOCK
    )
    :vars
    (
      ?auto_33249 - BLOCK
      ?auto_33250 - BLOCK
      ?auto_33251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33246 ?auto_33247 ) ) ( not ( = ?auto_33246 ?auto_33248 ) ) ( not ( = ?auto_33247 ?auto_33248 ) ) ( ON ?auto_33248 ?auto_33249 ) ( not ( = ?auto_33246 ?auto_33249 ) ) ( not ( = ?auto_33247 ?auto_33249 ) ) ( not ( = ?auto_33248 ?auto_33249 ) ) ( ON-TABLE ?auto_33250 ) ( ON ?auto_33249 ?auto_33250 ) ( not ( = ?auto_33250 ?auto_33249 ) ) ( not ( = ?auto_33250 ?auto_33248 ) ) ( not ( = ?auto_33250 ?auto_33247 ) ) ( not ( = ?auto_33246 ?auto_33250 ) ) ( ON ?auto_33246 ?auto_33251 ) ( CLEAR ?auto_33246 ) ( not ( = ?auto_33246 ?auto_33251 ) ) ( not ( = ?auto_33247 ?auto_33251 ) ) ( not ( = ?auto_33248 ?auto_33251 ) ) ( not ( = ?auto_33249 ?auto_33251 ) ) ( not ( = ?auto_33250 ?auto_33251 ) ) ( HOLDING ?auto_33247 ) ( CLEAR ?auto_33248 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33250 ?auto_33249 ?auto_33248 ?auto_33247 )
      ( MAKE-3PILE ?auto_33246 ?auto_33247 ?auto_33248 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33252 - BLOCK
      ?auto_33253 - BLOCK
      ?auto_33254 - BLOCK
    )
    :vars
    (
      ?auto_33255 - BLOCK
      ?auto_33257 - BLOCK
      ?auto_33256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33252 ?auto_33253 ) ) ( not ( = ?auto_33252 ?auto_33254 ) ) ( not ( = ?auto_33253 ?auto_33254 ) ) ( ON ?auto_33254 ?auto_33255 ) ( not ( = ?auto_33252 ?auto_33255 ) ) ( not ( = ?auto_33253 ?auto_33255 ) ) ( not ( = ?auto_33254 ?auto_33255 ) ) ( ON-TABLE ?auto_33257 ) ( ON ?auto_33255 ?auto_33257 ) ( not ( = ?auto_33257 ?auto_33255 ) ) ( not ( = ?auto_33257 ?auto_33254 ) ) ( not ( = ?auto_33257 ?auto_33253 ) ) ( not ( = ?auto_33252 ?auto_33257 ) ) ( ON ?auto_33252 ?auto_33256 ) ( not ( = ?auto_33252 ?auto_33256 ) ) ( not ( = ?auto_33253 ?auto_33256 ) ) ( not ( = ?auto_33254 ?auto_33256 ) ) ( not ( = ?auto_33255 ?auto_33256 ) ) ( not ( = ?auto_33257 ?auto_33256 ) ) ( CLEAR ?auto_33254 ) ( ON ?auto_33253 ?auto_33252 ) ( CLEAR ?auto_33253 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33256 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33256 ?auto_33252 )
      ( MAKE-3PILE ?auto_33252 ?auto_33253 ?auto_33254 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33258 - BLOCK
      ?auto_33259 - BLOCK
      ?auto_33260 - BLOCK
    )
    :vars
    (
      ?auto_33262 - BLOCK
      ?auto_33263 - BLOCK
      ?auto_33261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33258 ?auto_33259 ) ) ( not ( = ?auto_33258 ?auto_33260 ) ) ( not ( = ?auto_33259 ?auto_33260 ) ) ( not ( = ?auto_33258 ?auto_33262 ) ) ( not ( = ?auto_33259 ?auto_33262 ) ) ( not ( = ?auto_33260 ?auto_33262 ) ) ( ON-TABLE ?auto_33263 ) ( ON ?auto_33262 ?auto_33263 ) ( not ( = ?auto_33263 ?auto_33262 ) ) ( not ( = ?auto_33263 ?auto_33260 ) ) ( not ( = ?auto_33263 ?auto_33259 ) ) ( not ( = ?auto_33258 ?auto_33263 ) ) ( ON ?auto_33258 ?auto_33261 ) ( not ( = ?auto_33258 ?auto_33261 ) ) ( not ( = ?auto_33259 ?auto_33261 ) ) ( not ( = ?auto_33260 ?auto_33261 ) ) ( not ( = ?auto_33262 ?auto_33261 ) ) ( not ( = ?auto_33263 ?auto_33261 ) ) ( ON ?auto_33259 ?auto_33258 ) ( CLEAR ?auto_33259 ) ( ON-TABLE ?auto_33261 ) ( HOLDING ?auto_33260 ) ( CLEAR ?auto_33262 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33263 ?auto_33262 ?auto_33260 )
      ( MAKE-3PILE ?auto_33258 ?auto_33259 ?auto_33260 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33264 - BLOCK
      ?auto_33265 - BLOCK
      ?auto_33266 - BLOCK
    )
    :vars
    (
      ?auto_33267 - BLOCK
      ?auto_33269 - BLOCK
      ?auto_33268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33264 ?auto_33265 ) ) ( not ( = ?auto_33264 ?auto_33266 ) ) ( not ( = ?auto_33265 ?auto_33266 ) ) ( not ( = ?auto_33264 ?auto_33267 ) ) ( not ( = ?auto_33265 ?auto_33267 ) ) ( not ( = ?auto_33266 ?auto_33267 ) ) ( ON-TABLE ?auto_33269 ) ( ON ?auto_33267 ?auto_33269 ) ( not ( = ?auto_33269 ?auto_33267 ) ) ( not ( = ?auto_33269 ?auto_33266 ) ) ( not ( = ?auto_33269 ?auto_33265 ) ) ( not ( = ?auto_33264 ?auto_33269 ) ) ( ON ?auto_33264 ?auto_33268 ) ( not ( = ?auto_33264 ?auto_33268 ) ) ( not ( = ?auto_33265 ?auto_33268 ) ) ( not ( = ?auto_33266 ?auto_33268 ) ) ( not ( = ?auto_33267 ?auto_33268 ) ) ( not ( = ?auto_33269 ?auto_33268 ) ) ( ON ?auto_33265 ?auto_33264 ) ( ON-TABLE ?auto_33268 ) ( CLEAR ?auto_33267 ) ( ON ?auto_33266 ?auto_33265 ) ( CLEAR ?auto_33266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33268 ?auto_33264 ?auto_33265 )
      ( MAKE-3PILE ?auto_33264 ?auto_33265 ?auto_33266 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33270 - BLOCK
      ?auto_33271 - BLOCK
      ?auto_33272 - BLOCK
    )
    :vars
    (
      ?auto_33274 - BLOCK
      ?auto_33273 - BLOCK
      ?auto_33275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33270 ?auto_33271 ) ) ( not ( = ?auto_33270 ?auto_33272 ) ) ( not ( = ?auto_33271 ?auto_33272 ) ) ( not ( = ?auto_33270 ?auto_33274 ) ) ( not ( = ?auto_33271 ?auto_33274 ) ) ( not ( = ?auto_33272 ?auto_33274 ) ) ( ON-TABLE ?auto_33273 ) ( not ( = ?auto_33273 ?auto_33274 ) ) ( not ( = ?auto_33273 ?auto_33272 ) ) ( not ( = ?auto_33273 ?auto_33271 ) ) ( not ( = ?auto_33270 ?auto_33273 ) ) ( ON ?auto_33270 ?auto_33275 ) ( not ( = ?auto_33270 ?auto_33275 ) ) ( not ( = ?auto_33271 ?auto_33275 ) ) ( not ( = ?auto_33272 ?auto_33275 ) ) ( not ( = ?auto_33274 ?auto_33275 ) ) ( not ( = ?auto_33273 ?auto_33275 ) ) ( ON ?auto_33271 ?auto_33270 ) ( ON-TABLE ?auto_33275 ) ( ON ?auto_33272 ?auto_33271 ) ( CLEAR ?auto_33272 ) ( HOLDING ?auto_33274 ) ( CLEAR ?auto_33273 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33273 ?auto_33274 )
      ( MAKE-3PILE ?auto_33270 ?auto_33271 ?auto_33272 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33276 - BLOCK
      ?auto_33277 - BLOCK
      ?auto_33278 - BLOCK
    )
    :vars
    (
      ?auto_33280 - BLOCK
      ?auto_33281 - BLOCK
      ?auto_33279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33276 ?auto_33277 ) ) ( not ( = ?auto_33276 ?auto_33278 ) ) ( not ( = ?auto_33277 ?auto_33278 ) ) ( not ( = ?auto_33276 ?auto_33280 ) ) ( not ( = ?auto_33277 ?auto_33280 ) ) ( not ( = ?auto_33278 ?auto_33280 ) ) ( ON-TABLE ?auto_33281 ) ( not ( = ?auto_33281 ?auto_33280 ) ) ( not ( = ?auto_33281 ?auto_33278 ) ) ( not ( = ?auto_33281 ?auto_33277 ) ) ( not ( = ?auto_33276 ?auto_33281 ) ) ( ON ?auto_33276 ?auto_33279 ) ( not ( = ?auto_33276 ?auto_33279 ) ) ( not ( = ?auto_33277 ?auto_33279 ) ) ( not ( = ?auto_33278 ?auto_33279 ) ) ( not ( = ?auto_33280 ?auto_33279 ) ) ( not ( = ?auto_33281 ?auto_33279 ) ) ( ON ?auto_33277 ?auto_33276 ) ( ON-TABLE ?auto_33279 ) ( ON ?auto_33278 ?auto_33277 ) ( CLEAR ?auto_33281 ) ( ON ?auto_33280 ?auto_33278 ) ( CLEAR ?auto_33280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33279 ?auto_33276 ?auto_33277 ?auto_33278 )
      ( MAKE-3PILE ?auto_33276 ?auto_33277 ?auto_33278 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33282 - BLOCK
      ?auto_33283 - BLOCK
      ?auto_33284 - BLOCK
    )
    :vars
    (
      ?auto_33287 - BLOCK
      ?auto_33285 - BLOCK
      ?auto_33286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33282 ?auto_33283 ) ) ( not ( = ?auto_33282 ?auto_33284 ) ) ( not ( = ?auto_33283 ?auto_33284 ) ) ( not ( = ?auto_33282 ?auto_33287 ) ) ( not ( = ?auto_33283 ?auto_33287 ) ) ( not ( = ?auto_33284 ?auto_33287 ) ) ( not ( = ?auto_33285 ?auto_33287 ) ) ( not ( = ?auto_33285 ?auto_33284 ) ) ( not ( = ?auto_33285 ?auto_33283 ) ) ( not ( = ?auto_33282 ?auto_33285 ) ) ( ON ?auto_33282 ?auto_33286 ) ( not ( = ?auto_33282 ?auto_33286 ) ) ( not ( = ?auto_33283 ?auto_33286 ) ) ( not ( = ?auto_33284 ?auto_33286 ) ) ( not ( = ?auto_33287 ?auto_33286 ) ) ( not ( = ?auto_33285 ?auto_33286 ) ) ( ON ?auto_33283 ?auto_33282 ) ( ON-TABLE ?auto_33286 ) ( ON ?auto_33284 ?auto_33283 ) ( ON ?auto_33287 ?auto_33284 ) ( CLEAR ?auto_33287 ) ( HOLDING ?auto_33285 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33285 )
      ( MAKE-3PILE ?auto_33282 ?auto_33283 ?auto_33284 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33288 - BLOCK
      ?auto_33289 - BLOCK
      ?auto_33290 - BLOCK
    )
    :vars
    (
      ?auto_33291 - BLOCK
      ?auto_33292 - BLOCK
      ?auto_33293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33288 ?auto_33289 ) ) ( not ( = ?auto_33288 ?auto_33290 ) ) ( not ( = ?auto_33289 ?auto_33290 ) ) ( not ( = ?auto_33288 ?auto_33291 ) ) ( not ( = ?auto_33289 ?auto_33291 ) ) ( not ( = ?auto_33290 ?auto_33291 ) ) ( not ( = ?auto_33292 ?auto_33291 ) ) ( not ( = ?auto_33292 ?auto_33290 ) ) ( not ( = ?auto_33292 ?auto_33289 ) ) ( not ( = ?auto_33288 ?auto_33292 ) ) ( ON ?auto_33288 ?auto_33293 ) ( not ( = ?auto_33288 ?auto_33293 ) ) ( not ( = ?auto_33289 ?auto_33293 ) ) ( not ( = ?auto_33290 ?auto_33293 ) ) ( not ( = ?auto_33291 ?auto_33293 ) ) ( not ( = ?auto_33292 ?auto_33293 ) ) ( ON ?auto_33289 ?auto_33288 ) ( ON-TABLE ?auto_33293 ) ( ON ?auto_33290 ?auto_33289 ) ( ON ?auto_33291 ?auto_33290 ) ( ON ?auto_33292 ?auto_33291 ) ( CLEAR ?auto_33292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33293 ?auto_33288 ?auto_33289 ?auto_33290 ?auto_33291 )
      ( MAKE-3PILE ?auto_33288 ?auto_33289 ?auto_33290 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33305 - BLOCK
    )
    :vars
    (
      ?auto_33307 - BLOCK
      ?auto_33306 - BLOCK
      ?auto_33308 - BLOCK
      ?auto_33309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33307 ?auto_33305 ) ( ON-TABLE ?auto_33305 ) ( not ( = ?auto_33305 ?auto_33307 ) ) ( not ( = ?auto_33305 ?auto_33306 ) ) ( not ( = ?auto_33305 ?auto_33308 ) ) ( not ( = ?auto_33307 ?auto_33306 ) ) ( not ( = ?auto_33307 ?auto_33308 ) ) ( not ( = ?auto_33306 ?auto_33308 ) ) ( ON ?auto_33306 ?auto_33307 ) ( CLEAR ?auto_33306 ) ( HOLDING ?auto_33308 ) ( CLEAR ?auto_33309 ) ( ON-TABLE ?auto_33309 ) ( not ( = ?auto_33309 ?auto_33308 ) ) ( not ( = ?auto_33305 ?auto_33309 ) ) ( not ( = ?auto_33307 ?auto_33309 ) ) ( not ( = ?auto_33306 ?auto_33309 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33309 ?auto_33308 )
      ( MAKE-1PILE ?auto_33305 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33310 - BLOCK
    )
    :vars
    (
      ?auto_33312 - BLOCK
      ?auto_33314 - BLOCK
      ?auto_33313 - BLOCK
      ?auto_33311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33312 ?auto_33310 ) ( ON-TABLE ?auto_33310 ) ( not ( = ?auto_33310 ?auto_33312 ) ) ( not ( = ?auto_33310 ?auto_33314 ) ) ( not ( = ?auto_33310 ?auto_33313 ) ) ( not ( = ?auto_33312 ?auto_33314 ) ) ( not ( = ?auto_33312 ?auto_33313 ) ) ( not ( = ?auto_33314 ?auto_33313 ) ) ( ON ?auto_33314 ?auto_33312 ) ( CLEAR ?auto_33311 ) ( ON-TABLE ?auto_33311 ) ( not ( = ?auto_33311 ?auto_33313 ) ) ( not ( = ?auto_33310 ?auto_33311 ) ) ( not ( = ?auto_33312 ?auto_33311 ) ) ( not ( = ?auto_33314 ?auto_33311 ) ) ( ON ?auto_33313 ?auto_33314 ) ( CLEAR ?auto_33313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33310 ?auto_33312 ?auto_33314 )
      ( MAKE-1PILE ?auto_33310 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33315 - BLOCK
    )
    :vars
    (
      ?auto_33317 - BLOCK
      ?auto_33319 - BLOCK
      ?auto_33318 - BLOCK
      ?auto_33316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33317 ?auto_33315 ) ( ON-TABLE ?auto_33315 ) ( not ( = ?auto_33315 ?auto_33317 ) ) ( not ( = ?auto_33315 ?auto_33319 ) ) ( not ( = ?auto_33315 ?auto_33318 ) ) ( not ( = ?auto_33317 ?auto_33319 ) ) ( not ( = ?auto_33317 ?auto_33318 ) ) ( not ( = ?auto_33319 ?auto_33318 ) ) ( ON ?auto_33319 ?auto_33317 ) ( not ( = ?auto_33316 ?auto_33318 ) ) ( not ( = ?auto_33315 ?auto_33316 ) ) ( not ( = ?auto_33317 ?auto_33316 ) ) ( not ( = ?auto_33319 ?auto_33316 ) ) ( ON ?auto_33318 ?auto_33319 ) ( CLEAR ?auto_33318 ) ( HOLDING ?auto_33316 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33316 )
      ( MAKE-1PILE ?auto_33315 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33326 - BLOCK
    )
    :vars
    (
      ?auto_33330 - BLOCK
      ?auto_33327 - BLOCK
      ?auto_33329 - BLOCK
      ?auto_33328 - BLOCK
      ?auto_33331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33330 ?auto_33326 ) ( ON-TABLE ?auto_33326 ) ( not ( = ?auto_33326 ?auto_33330 ) ) ( not ( = ?auto_33326 ?auto_33327 ) ) ( not ( = ?auto_33326 ?auto_33329 ) ) ( not ( = ?auto_33330 ?auto_33327 ) ) ( not ( = ?auto_33330 ?auto_33329 ) ) ( not ( = ?auto_33327 ?auto_33329 ) ) ( ON ?auto_33327 ?auto_33330 ) ( not ( = ?auto_33328 ?auto_33329 ) ) ( not ( = ?auto_33326 ?auto_33328 ) ) ( not ( = ?auto_33330 ?auto_33328 ) ) ( not ( = ?auto_33327 ?auto_33328 ) ) ( ON ?auto_33329 ?auto_33327 ) ( CLEAR ?auto_33329 ) ( ON ?auto_33328 ?auto_33331 ) ( CLEAR ?auto_33328 ) ( HAND-EMPTY ) ( not ( = ?auto_33326 ?auto_33331 ) ) ( not ( = ?auto_33330 ?auto_33331 ) ) ( not ( = ?auto_33327 ?auto_33331 ) ) ( not ( = ?auto_33329 ?auto_33331 ) ) ( not ( = ?auto_33328 ?auto_33331 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33328 ?auto_33331 )
      ( MAKE-1PILE ?auto_33326 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33332 - BLOCK
    )
    :vars
    (
      ?auto_33334 - BLOCK
      ?auto_33333 - BLOCK
      ?auto_33336 - BLOCK
      ?auto_33335 - BLOCK
      ?auto_33337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33334 ?auto_33332 ) ( ON-TABLE ?auto_33332 ) ( not ( = ?auto_33332 ?auto_33334 ) ) ( not ( = ?auto_33332 ?auto_33333 ) ) ( not ( = ?auto_33332 ?auto_33336 ) ) ( not ( = ?auto_33334 ?auto_33333 ) ) ( not ( = ?auto_33334 ?auto_33336 ) ) ( not ( = ?auto_33333 ?auto_33336 ) ) ( ON ?auto_33333 ?auto_33334 ) ( not ( = ?auto_33335 ?auto_33336 ) ) ( not ( = ?auto_33332 ?auto_33335 ) ) ( not ( = ?auto_33334 ?auto_33335 ) ) ( not ( = ?auto_33333 ?auto_33335 ) ) ( ON ?auto_33335 ?auto_33337 ) ( CLEAR ?auto_33335 ) ( not ( = ?auto_33332 ?auto_33337 ) ) ( not ( = ?auto_33334 ?auto_33337 ) ) ( not ( = ?auto_33333 ?auto_33337 ) ) ( not ( = ?auto_33336 ?auto_33337 ) ) ( not ( = ?auto_33335 ?auto_33337 ) ) ( HOLDING ?auto_33336 ) ( CLEAR ?auto_33333 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33332 ?auto_33334 ?auto_33333 ?auto_33336 )
      ( MAKE-1PILE ?auto_33332 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33366 - BLOCK
      ?auto_33367 - BLOCK
      ?auto_33368 - BLOCK
      ?auto_33369 - BLOCK
    )
    :vars
    (
      ?auto_33370 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33366 ) ( ON ?auto_33367 ?auto_33366 ) ( not ( = ?auto_33366 ?auto_33367 ) ) ( not ( = ?auto_33366 ?auto_33368 ) ) ( not ( = ?auto_33366 ?auto_33369 ) ) ( not ( = ?auto_33367 ?auto_33368 ) ) ( not ( = ?auto_33367 ?auto_33369 ) ) ( not ( = ?auto_33368 ?auto_33369 ) ) ( ON ?auto_33369 ?auto_33370 ) ( not ( = ?auto_33366 ?auto_33370 ) ) ( not ( = ?auto_33367 ?auto_33370 ) ) ( not ( = ?auto_33368 ?auto_33370 ) ) ( not ( = ?auto_33369 ?auto_33370 ) ) ( CLEAR ?auto_33367 ) ( ON ?auto_33368 ?auto_33369 ) ( CLEAR ?auto_33368 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33370 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33370 ?auto_33369 )
      ( MAKE-4PILE ?auto_33366 ?auto_33367 ?auto_33368 ?auto_33369 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33371 - BLOCK
      ?auto_33372 - BLOCK
      ?auto_33373 - BLOCK
      ?auto_33374 - BLOCK
    )
    :vars
    (
      ?auto_33375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33371 ) ( not ( = ?auto_33371 ?auto_33372 ) ) ( not ( = ?auto_33371 ?auto_33373 ) ) ( not ( = ?auto_33371 ?auto_33374 ) ) ( not ( = ?auto_33372 ?auto_33373 ) ) ( not ( = ?auto_33372 ?auto_33374 ) ) ( not ( = ?auto_33373 ?auto_33374 ) ) ( ON ?auto_33374 ?auto_33375 ) ( not ( = ?auto_33371 ?auto_33375 ) ) ( not ( = ?auto_33372 ?auto_33375 ) ) ( not ( = ?auto_33373 ?auto_33375 ) ) ( not ( = ?auto_33374 ?auto_33375 ) ) ( ON ?auto_33373 ?auto_33374 ) ( CLEAR ?auto_33373 ) ( ON-TABLE ?auto_33375 ) ( HOLDING ?auto_33372 ) ( CLEAR ?auto_33371 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33371 ?auto_33372 )
      ( MAKE-4PILE ?auto_33371 ?auto_33372 ?auto_33373 ?auto_33374 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33376 - BLOCK
      ?auto_33377 - BLOCK
      ?auto_33378 - BLOCK
      ?auto_33379 - BLOCK
    )
    :vars
    (
      ?auto_33380 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33376 ) ( not ( = ?auto_33376 ?auto_33377 ) ) ( not ( = ?auto_33376 ?auto_33378 ) ) ( not ( = ?auto_33376 ?auto_33379 ) ) ( not ( = ?auto_33377 ?auto_33378 ) ) ( not ( = ?auto_33377 ?auto_33379 ) ) ( not ( = ?auto_33378 ?auto_33379 ) ) ( ON ?auto_33379 ?auto_33380 ) ( not ( = ?auto_33376 ?auto_33380 ) ) ( not ( = ?auto_33377 ?auto_33380 ) ) ( not ( = ?auto_33378 ?auto_33380 ) ) ( not ( = ?auto_33379 ?auto_33380 ) ) ( ON ?auto_33378 ?auto_33379 ) ( ON-TABLE ?auto_33380 ) ( CLEAR ?auto_33376 ) ( ON ?auto_33377 ?auto_33378 ) ( CLEAR ?auto_33377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33380 ?auto_33379 ?auto_33378 )
      ( MAKE-4PILE ?auto_33376 ?auto_33377 ?auto_33378 ?auto_33379 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33381 - BLOCK
      ?auto_33382 - BLOCK
      ?auto_33383 - BLOCK
      ?auto_33384 - BLOCK
    )
    :vars
    (
      ?auto_33385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33381 ?auto_33382 ) ) ( not ( = ?auto_33381 ?auto_33383 ) ) ( not ( = ?auto_33381 ?auto_33384 ) ) ( not ( = ?auto_33382 ?auto_33383 ) ) ( not ( = ?auto_33382 ?auto_33384 ) ) ( not ( = ?auto_33383 ?auto_33384 ) ) ( ON ?auto_33384 ?auto_33385 ) ( not ( = ?auto_33381 ?auto_33385 ) ) ( not ( = ?auto_33382 ?auto_33385 ) ) ( not ( = ?auto_33383 ?auto_33385 ) ) ( not ( = ?auto_33384 ?auto_33385 ) ) ( ON ?auto_33383 ?auto_33384 ) ( ON-TABLE ?auto_33385 ) ( ON ?auto_33382 ?auto_33383 ) ( CLEAR ?auto_33382 ) ( HOLDING ?auto_33381 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33381 )
      ( MAKE-4PILE ?auto_33381 ?auto_33382 ?auto_33383 ?auto_33384 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33386 - BLOCK
      ?auto_33387 - BLOCK
      ?auto_33388 - BLOCK
      ?auto_33389 - BLOCK
    )
    :vars
    (
      ?auto_33390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33386 ?auto_33387 ) ) ( not ( = ?auto_33386 ?auto_33388 ) ) ( not ( = ?auto_33386 ?auto_33389 ) ) ( not ( = ?auto_33387 ?auto_33388 ) ) ( not ( = ?auto_33387 ?auto_33389 ) ) ( not ( = ?auto_33388 ?auto_33389 ) ) ( ON ?auto_33389 ?auto_33390 ) ( not ( = ?auto_33386 ?auto_33390 ) ) ( not ( = ?auto_33387 ?auto_33390 ) ) ( not ( = ?auto_33388 ?auto_33390 ) ) ( not ( = ?auto_33389 ?auto_33390 ) ) ( ON ?auto_33388 ?auto_33389 ) ( ON-TABLE ?auto_33390 ) ( ON ?auto_33387 ?auto_33388 ) ( ON ?auto_33386 ?auto_33387 ) ( CLEAR ?auto_33386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33390 ?auto_33389 ?auto_33388 ?auto_33387 )
      ( MAKE-4PILE ?auto_33386 ?auto_33387 ?auto_33388 ?auto_33389 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33395 - BLOCK
      ?auto_33396 - BLOCK
      ?auto_33397 - BLOCK
      ?auto_33398 - BLOCK
    )
    :vars
    (
      ?auto_33399 - BLOCK
      ?auto_33400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33395 ?auto_33396 ) ) ( not ( = ?auto_33395 ?auto_33397 ) ) ( not ( = ?auto_33395 ?auto_33398 ) ) ( not ( = ?auto_33396 ?auto_33397 ) ) ( not ( = ?auto_33396 ?auto_33398 ) ) ( not ( = ?auto_33397 ?auto_33398 ) ) ( ON ?auto_33398 ?auto_33399 ) ( not ( = ?auto_33395 ?auto_33399 ) ) ( not ( = ?auto_33396 ?auto_33399 ) ) ( not ( = ?auto_33397 ?auto_33399 ) ) ( not ( = ?auto_33398 ?auto_33399 ) ) ( ON ?auto_33397 ?auto_33398 ) ( ON-TABLE ?auto_33399 ) ( ON ?auto_33396 ?auto_33397 ) ( CLEAR ?auto_33396 ) ( ON ?auto_33395 ?auto_33400 ) ( CLEAR ?auto_33395 ) ( HAND-EMPTY ) ( not ( = ?auto_33395 ?auto_33400 ) ) ( not ( = ?auto_33396 ?auto_33400 ) ) ( not ( = ?auto_33397 ?auto_33400 ) ) ( not ( = ?auto_33398 ?auto_33400 ) ) ( not ( = ?auto_33399 ?auto_33400 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33395 ?auto_33400 )
      ( MAKE-4PILE ?auto_33395 ?auto_33396 ?auto_33397 ?auto_33398 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33401 - BLOCK
      ?auto_33402 - BLOCK
      ?auto_33403 - BLOCK
      ?auto_33404 - BLOCK
    )
    :vars
    (
      ?auto_33405 - BLOCK
      ?auto_33406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33401 ?auto_33402 ) ) ( not ( = ?auto_33401 ?auto_33403 ) ) ( not ( = ?auto_33401 ?auto_33404 ) ) ( not ( = ?auto_33402 ?auto_33403 ) ) ( not ( = ?auto_33402 ?auto_33404 ) ) ( not ( = ?auto_33403 ?auto_33404 ) ) ( ON ?auto_33404 ?auto_33405 ) ( not ( = ?auto_33401 ?auto_33405 ) ) ( not ( = ?auto_33402 ?auto_33405 ) ) ( not ( = ?auto_33403 ?auto_33405 ) ) ( not ( = ?auto_33404 ?auto_33405 ) ) ( ON ?auto_33403 ?auto_33404 ) ( ON-TABLE ?auto_33405 ) ( ON ?auto_33401 ?auto_33406 ) ( CLEAR ?auto_33401 ) ( not ( = ?auto_33401 ?auto_33406 ) ) ( not ( = ?auto_33402 ?auto_33406 ) ) ( not ( = ?auto_33403 ?auto_33406 ) ) ( not ( = ?auto_33404 ?auto_33406 ) ) ( not ( = ?auto_33405 ?auto_33406 ) ) ( HOLDING ?auto_33402 ) ( CLEAR ?auto_33403 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33405 ?auto_33404 ?auto_33403 ?auto_33402 )
      ( MAKE-4PILE ?auto_33401 ?auto_33402 ?auto_33403 ?auto_33404 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33407 - BLOCK
      ?auto_33408 - BLOCK
      ?auto_33409 - BLOCK
      ?auto_33410 - BLOCK
    )
    :vars
    (
      ?auto_33412 - BLOCK
      ?auto_33411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33407 ?auto_33408 ) ) ( not ( = ?auto_33407 ?auto_33409 ) ) ( not ( = ?auto_33407 ?auto_33410 ) ) ( not ( = ?auto_33408 ?auto_33409 ) ) ( not ( = ?auto_33408 ?auto_33410 ) ) ( not ( = ?auto_33409 ?auto_33410 ) ) ( ON ?auto_33410 ?auto_33412 ) ( not ( = ?auto_33407 ?auto_33412 ) ) ( not ( = ?auto_33408 ?auto_33412 ) ) ( not ( = ?auto_33409 ?auto_33412 ) ) ( not ( = ?auto_33410 ?auto_33412 ) ) ( ON ?auto_33409 ?auto_33410 ) ( ON-TABLE ?auto_33412 ) ( ON ?auto_33407 ?auto_33411 ) ( not ( = ?auto_33407 ?auto_33411 ) ) ( not ( = ?auto_33408 ?auto_33411 ) ) ( not ( = ?auto_33409 ?auto_33411 ) ) ( not ( = ?auto_33410 ?auto_33411 ) ) ( not ( = ?auto_33412 ?auto_33411 ) ) ( CLEAR ?auto_33409 ) ( ON ?auto_33408 ?auto_33407 ) ( CLEAR ?auto_33408 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33411 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33411 ?auto_33407 )
      ( MAKE-4PILE ?auto_33407 ?auto_33408 ?auto_33409 ?auto_33410 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33413 - BLOCK
      ?auto_33414 - BLOCK
      ?auto_33415 - BLOCK
      ?auto_33416 - BLOCK
    )
    :vars
    (
      ?auto_33418 - BLOCK
      ?auto_33417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33413 ?auto_33414 ) ) ( not ( = ?auto_33413 ?auto_33415 ) ) ( not ( = ?auto_33413 ?auto_33416 ) ) ( not ( = ?auto_33414 ?auto_33415 ) ) ( not ( = ?auto_33414 ?auto_33416 ) ) ( not ( = ?auto_33415 ?auto_33416 ) ) ( ON ?auto_33416 ?auto_33418 ) ( not ( = ?auto_33413 ?auto_33418 ) ) ( not ( = ?auto_33414 ?auto_33418 ) ) ( not ( = ?auto_33415 ?auto_33418 ) ) ( not ( = ?auto_33416 ?auto_33418 ) ) ( ON-TABLE ?auto_33418 ) ( ON ?auto_33413 ?auto_33417 ) ( not ( = ?auto_33413 ?auto_33417 ) ) ( not ( = ?auto_33414 ?auto_33417 ) ) ( not ( = ?auto_33415 ?auto_33417 ) ) ( not ( = ?auto_33416 ?auto_33417 ) ) ( not ( = ?auto_33418 ?auto_33417 ) ) ( ON ?auto_33414 ?auto_33413 ) ( CLEAR ?auto_33414 ) ( ON-TABLE ?auto_33417 ) ( HOLDING ?auto_33415 ) ( CLEAR ?auto_33416 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33418 ?auto_33416 ?auto_33415 )
      ( MAKE-4PILE ?auto_33413 ?auto_33414 ?auto_33415 ?auto_33416 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33419 - BLOCK
      ?auto_33420 - BLOCK
      ?auto_33421 - BLOCK
      ?auto_33422 - BLOCK
    )
    :vars
    (
      ?auto_33423 - BLOCK
      ?auto_33424 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33419 ?auto_33420 ) ) ( not ( = ?auto_33419 ?auto_33421 ) ) ( not ( = ?auto_33419 ?auto_33422 ) ) ( not ( = ?auto_33420 ?auto_33421 ) ) ( not ( = ?auto_33420 ?auto_33422 ) ) ( not ( = ?auto_33421 ?auto_33422 ) ) ( ON ?auto_33422 ?auto_33423 ) ( not ( = ?auto_33419 ?auto_33423 ) ) ( not ( = ?auto_33420 ?auto_33423 ) ) ( not ( = ?auto_33421 ?auto_33423 ) ) ( not ( = ?auto_33422 ?auto_33423 ) ) ( ON-TABLE ?auto_33423 ) ( ON ?auto_33419 ?auto_33424 ) ( not ( = ?auto_33419 ?auto_33424 ) ) ( not ( = ?auto_33420 ?auto_33424 ) ) ( not ( = ?auto_33421 ?auto_33424 ) ) ( not ( = ?auto_33422 ?auto_33424 ) ) ( not ( = ?auto_33423 ?auto_33424 ) ) ( ON ?auto_33420 ?auto_33419 ) ( ON-TABLE ?auto_33424 ) ( CLEAR ?auto_33422 ) ( ON ?auto_33421 ?auto_33420 ) ( CLEAR ?auto_33421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33424 ?auto_33419 ?auto_33420 )
      ( MAKE-4PILE ?auto_33419 ?auto_33420 ?auto_33421 ?auto_33422 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33425 - BLOCK
      ?auto_33426 - BLOCK
      ?auto_33427 - BLOCK
      ?auto_33428 - BLOCK
    )
    :vars
    (
      ?auto_33429 - BLOCK
      ?auto_33430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33425 ?auto_33426 ) ) ( not ( = ?auto_33425 ?auto_33427 ) ) ( not ( = ?auto_33425 ?auto_33428 ) ) ( not ( = ?auto_33426 ?auto_33427 ) ) ( not ( = ?auto_33426 ?auto_33428 ) ) ( not ( = ?auto_33427 ?auto_33428 ) ) ( not ( = ?auto_33425 ?auto_33429 ) ) ( not ( = ?auto_33426 ?auto_33429 ) ) ( not ( = ?auto_33427 ?auto_33429 ) ) ( not ( = ?auto_33428 ?auto_33429 ) ) ( ON-TABLE ?auto_33429 ) ( ON ?auto_33425 ?auto_33430 ) ( not ( = ?auto_33425 ?auto_33430 ) ) ( not ( = ?auto_33426 ?auto_33430 ) ) ( not ( = ?auto_33427 ?auto_33430 ) ) ( not ( = ?auto_33428 ?auto_33430 ) ) ( not ( = ?auto_33429 ?auto_33430 ) ) ( ON ?auto_33426 ?auto_33425 ) ( ON-TABLE ?auto_33430 ) ( ON ?auto_33427 ?auto_33426 ) ( CLEAR ?auto_33427 ) ( HOLDING ?auto_33428 ) ( CLEAR ?auto_33429 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33429 ?auto_33428 )
      ( MAKE-4PILE ?auto_33425 ?auto_33426 ?auto_33427 ?auto_33428 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33431 - BLOCK
      ?auto_33432 - BLOCK
      ?auto_33433 - BLOCK
      ?auto_33434 - BLOCK
    )
    :vars
    (
      ?auto_33435 - BLOCK
      ?auto_33436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33431 ?auto_33432 ) ) ( not ( = ?auto_33431 ?auto_33433 ) ) ( not ( = ?auto_33431 ?auto_33434 ) ) ( not ( = ?auto_33432 ?auto_33433 ) ) ( not ( = ?auto_33432 ?auto_33434 ) ) ( not ( = ?auto_33433 ?auto_33434 ) ) ( not ( = ?auto_33431 ?auto_33435 ) ) ( not ( = ?auto_33432 ?auto_33435 ) ) ( not ( = ?auto_33433 ?auto_33435 ) ) ( not ( = ?auto_33434 ?auto_33435 ) ) ( ON-TABLE ?auto_33435 ) ( ON ?auto_33431 ?auto_33436 ) ( not ( = ?auto_33431 ?auto_33436 ) ) ( not ( = ?auto_33432 ?auto_33436 ) ) ( not ( = ?auto_33433 ?auto_33436 ) ) ( not ( = ?auto_33434 ?auto_33436 ) ) ( not ( = ?auto_33435 ?auto_33436 ) ) ( ON ?auto_33432 ?auto_33431 ) ( ON-TABLE ?auto_33436 ) ( ON ?auto_33433 ?auto_33432 ) ( CLEAR ?auto_33435 ) ( ON ?auto_33434 ?auto_33433 ) ( CLEAR ?auto_33434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33436 ?auto_33431 ?auto_33432 ?auto_33433 )
      ( MAKE-4PILE ?auto_33431 ?auto_33432 ?auto_33433 ?auto_33434 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33437 - BLOCK
      ?auto_33438 - BLOCK
      ?auto_33439 - BLOCK
      ?auto_33440 - BLOCK
    )
    :vars
    (
      ?auto_33441 - BLOCK
      ?auto_33442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33437 ?auto_33438 ) ) ( not ( = ?auto_33437 ?auto_33439 ) ) ( not ( = ?auto_33437 ?auto_33440 ) ) ( not ( = ?auto_33438 ?auto_33439 ) ) ( not ( = ?auto_33438 ?auto_33440 ) ) ( not ( = ?auto_33439 ?auto_33440 ) ) ( not ( = ?auto_33437 ?auto_33441 ) ) ( not ( = ?auto_33438 ?auto_33441 ) ) ( not ( = ?auto_33439 ?auto_33441 ) ) ( not ( = ?auto_33440 ?auto_33441 ) ) ( ON ?auto_33437 ?auto_33442 ) ( not ( = ?auto_33437 ?auto_33442 ) ) ( not ( = ?auto_33438 ?auto_33442 ) ) ( not ( = ?auto_33439 ?auto_33442 ) ) ( not ( = ?auto_33440 ?auto_33442 ) ) ( not ( = ?auto_33441 ?auto_33442 ) ) ( ON ?auto_33438 ?auto_33437 ) ( ON-TABLE ?auto_33442 ) ( ON ?auto_33439 ?auto_33438 ) ( ON ?auto_33440 ?auto_33439 ) ( CLEAR ?auto_33440 ) ( HOLDING ?auto_33441 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33441 )
      ( MAKE-4PILE ?auto_33437 ?auto_33438 ?auto_33439 ?auto_33440 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33443 - BLOCK
      ?auto_33444 - BLOCK
      ?auto_33445 - BLOCK
      ?auto_33446 - BLOCK
    )
    :vars
    (
      ?auto_33447 - BLOCK
      ?auto_33448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33443 ?auto_33444 ) ) ( not ( = ?auto_33443 ?auto_33445 ) ) ( not ( = ?auto_33443 ?auto_33446 ) ) ( not ( = ?auto_33444 ?auto_33445 ) ) ( not ( = ?auto_33444 ?auto_33446 ) ) ( not ( = ?auto_33445 ?auto_33446 ) ) ( not ( = ?auto_33443 ?auto_33447 ) ) ( not ( = ?auto_33444 ?auto_33447 ) ) ( not ( = ?auto_33445 ?auto_33447 ) ) ( not ( = ?auto_33446 ?auto_33447 ) ) ( ON ?auto_33443 ?auto_33448 ) ( not ( = ?auto_33443 ?auto_33448 ) ) ( not ( = ?auto_33444 ?auto_33448 ) ) ( not ( = ?auto_33445 ?auto_33448 ) ) ( not ( = ?auto_33446 ?auto_33448 ) ) ( not ( = ?auto_33447 ?auto_33448 ) ) ( ON ?auto_33444 ?auto_33443 ) ( ON-TABLE ?auto_33448 ) ( ON ?auto_33445 ?auto_33444 ) ( ON ?auto_33446 ?auto_33445 ) ( ON ?auto_33447 ?auto_33446 ) ( CLEAR ?auto_33447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33448 ?auto_33443 ?auto_33444 ?auto_33445 ?auto_33446 )
      ( MAKE-4PILE ?auto_33443 ?auto_33444 ?auto_33445 ?auto_33446 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33459 - BLOCK
      ?auto_33460 - BLOCK
      ?auto_33461 - BLOCK
      ?auto_33462 - BLOCK
      ?auto_33463 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33462 ) ( ON-TABLE ?auto_33459 ) ( ON ?auto_33460 ?auto_33459 ) ( ON ?auto_33461 ?auto_33460 ) ( ON ?auto_33462 ?auto_33461 ) ( not ( = ?auto_33459 ?auto_33460 ) ) ( not ( = ?auto_33459 ?auto_33461 ) ) ( not ( = ?auto_33459 ?auto_33462 ) ) ( not ( = ?auto_33459 ?auto_33463 ) ) ( not ( = ?auto_33460 ?auto_33461 ) ) ( not ( = ?auto_33460 ?auto_33462 ) ) ( not ( = ?auto_33460 ?auto_33463 ) ) ( not ( = ?auto_33461 ?auto_33462 ) ) ( not ( = ?auto_33461 ?auto_33463 ) ) ( not ( = ?auto_33462 ?auto_33463 ) ) ( ON-TABLE ?auto_33463 ) ( CLEAR ?auto_33463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_33463 )
      ( MAKE-5PILE ?auto_33459 ?auto_33460 ?auto_33461 ?auto_33462 ?auto_33463 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33464 - BLOCK
      ?auto_33465 - BLOCK
      ?auto_33466 - BLOCK
      ?auto_33467 - BLOCK
      ?auto_33468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33464 ) ( ON ?auto_33465 ?auto_33464 ) ( ON ?auto_33466 ?auto_33465 ) ( not ( = ?auto_33464 ?auto_33465 ) ) ( not ( = ?auto_33464 ?auto_33466 ) ) ( not ( = ?auto_33464 ?auto_33467 ) ) ( not ( = ?auto_33464 ?auto_33468 ) ) ( not ( = ?auto_33465 ?auto_33466 ) ) ( not ( = ?auto_33465 ?auto_33467 ) ) ( not ( = ?auto_33465 ?auto_33468 ) ) ( not ( = ?auto_33466 ?auto_33467 ) ) ( not ( = ?auto_33466 ?auto_33468 ) ) ( not ( = ?auto_33467 ?auto_33468 ) ) ( ON-TABLE ?auto_33468 ) ( CLEAR ?auto_33468 ) ( HOLDING ?auto_33467 ) ( CLEAR ?auto_33466 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33464 ?auto_33465 ?auto_33466 ?auto_33467 )
      ( MAKE-5PILE ?auto_33464 ?auto_33465 ?auto_33466 ?auto_33467 ?auto_33468 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33469 - BLOCK
      ?auto_33470 - BLOCK
      ?auto_33471 - BLOCK
      ?auto_33472 - BLOCK
      ?auto_33473 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33469 ) ( ON ?auto_33470 ?auto_33469 ) ( ON ?auto_33471 ?auto_33470 ) ( not ( = ?auto_33469 ?auto_33470 ) ) ( not ( = ?auto_33469 ?auto_33471 ) ) ( not ( = ?auto_33469 ?auto_33472 ) ) ( not ( = ?auto_33469 ?auto_33473 ) ) ( not ( = ?auto_33470 ?auto_33471 ) ) ( not ( = ?auto_33470 ?auto_33472 ) ) ( not ( = ?auto_33470 ?auto_33473 ) ) ( not ( = ?auto_33471 ?auto_33472 ) ) ( not ( = ?auto_33471 ?auto_33473 ) ) ( not ( = ?auto_33472 ?auto_33473 ) ) ( ON-TABLE ?auto_33473 ) ( CLEAR ?auto_33471 ) ( ON ?auto_33472 ?auto_33473 ) ( CLEAR ?auto_33472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33473 )
      ( MAKE-5PILE ?auto_33469 ?auto_33470 ?auto_33471 ?auto_33472 ?auto_33473 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33474 - BLOCK
      ?auto_33475 - BLOCK
      ?auto_33476 - BLOCK
      ?auto_33477 - BLOCK
      ?auto_33478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33474 ) ( ON ?auto_33475 ?auto_33474 ) ( not ( = ?auto_33474 ?auto_33475 ) ) ( not ( = ?auto_33474 ?auto_33476 ) ) ( not ( = ?auto_33474 ?auto_33477 ) ) ( not ( = ?auto_33474 ?auto_33478 ) ) ( not ( = ?auto_33475 ?auto_33476 ) ) ( not ( = ?auto_33475 ?auto_33477 ) ) ( not ( = ?auto_33475 ?auto_33478 ) ) ( not ( = ?auto_33476 ?auto_33477 ) ) ( not ( = ?auto_33476 ?auto_33478 ) ) ( not ( = ?auto_33477 ?auto_33478 ) ) ( ON-TABLE ?auto_33478 ) ( ON ?auto_33477 ?auto_33478 ) ( CLEAR ?auto_33477 ) ( HOLDING ?auto_33476 ) ( CLEAR ?auto_33475 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33474 ?auto_33475 ?auto_33476 )
      ( MAKE-5PILE ?auto_33474 ?auto_33475 ?auto_33476 ?auto_33477 ?auto_33478 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33479 - BLOCK
      ?auto_33480 - BLOCK
      ?auto_33481 - BLOCK
      ?auto_33482 - BLOCK
      ?auto_33483 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33479 ) ( ON ?auto_33480 ?auto_33479 ) ( not ( = ?auto_33479 ?auto_33480 ) ) ( not ( = ?auto_33479 ?auto_33481 ) ) ( not ( = ?auto_33479 ?auto_33482 ) ) ( not ( = ?auto_33479 ?auto_33483 ) ) ( not ( = ?auto_33480 ?auto_33481 ) ) ( not ( = ?auto_33480 ?auto_33482 ) ) ( not ( = ?auto_33480 ?auto_33483 ) ) ( not ( = ?auto_33481 ?auto_33482 ) ) ( not ( = ?auto_33481 ?auto_33483 ) ) ( not ( = ?auto_33482 ?auto_33483 ) ) ( ON-TABLE ?auto_33483 ) ( ON ?auto_33482 ?auto_33483 ) ( CLEAR ?auto_33480 ) ( ON ?auto_33481 ?auto_33482 ) ( CLEAR ?auto_33481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33483 ?auto_33482 )
      ( MAKE-5PILE ?auto_33479 ?auto_33480 ?auto_33481 ?auto_33482 ?auto_33483 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33484 - BLOCK
      ?auto_33485 - BLOCK
      ?auto_33486 - BLOCK
      ?auto_33487 - BLOCK
      ?auto_33488 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33484 ) ( not ( = ?auto_33484 ?auto_33485 ) ) ( not ( = ?auto_33484 ?auto_33486 ) ) ( not ( = ?auto_33484 ?auto_33487 ) ) ( not ( = ?auto_33484 ?auto_33488 ) ) ( not ( = ?auto_33485 ?auto_33486 ) ) ( not ( = ?auto_33485 ?auto_33487 ) ) ( not ( = ?auto_33485 ?auto_33488 ) ) ( not ( = ?auto_33486 ?auto_33487 ) ) ( not ( = ?auto_33486 ?auto_33488 ) ) ( not ( = ?auto_33487 ?auto_33488 ) ) ( ON-TABLE ?auto_33488 ) ( ON ?auto_33487 ?auto_33488 ) ( ON ?auto_33486 ?auto_33487 ) ( CLEAR ?auto_33486 ) ( HOLDING ?auto_33485 ) ( CLEAR ?auto_33484 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33484 ?auto_33485 )
      ( MAKE-5PILE ?auto_33484 ?auto_33485 ?auto_33486 ?auto_33487 ?auto_33488 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33489 - BLOCK
      ?auto_33490 - BLOCK
      ?auto_33491 - BLOCK
      ?auto_33492 - BLOCK
      ?auto_33493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33489 ) ( not ( = ?auto_33489 ?auto_33490 ) ) ( not ( = ?auto_33489 ?auto_33491 ) ) ( not ( = ?auto_33489 ?auto_33492 ) ) ( not ( = ?auto_33489 ?auto_33493 ) ) ( not ( = ?auto_33490 ?auto_33491 ) ) ( not ( = ?auto_33490 ?auto_33492 ) ) ( not ( = ?auto_33490 ?auto_33493 ) ) ( not ( = ?auto_33491 ?auto_33492 ) ) ( not ( = ?auto_33491 ?auto_33493 ) ) ( not ( = ?auto_33492 ?auto_33493 ) ) ( ON-TABLE ?auto_33493 ) ( ON ?auto_33492 ?auto_33493 ) ( ON ?auto_33491 ?auto_33492 ) ( CLEAR ?auto_33489 ) ( ON ?auto_33490 ?auto_33491 ) ( CLEAR ?auto_33490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33493 ?auto_33492 ?auto_33491 )
      ( MAKE-5PILE ?auto_33489 ?auto_33490 ?auto_33491 ?auto_33492 ?auto_33493 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33494 - BLOCK
      ?auto_33495 - BLOCK
      ?auto_33496 - BLOCK
      ?auto_33497 - BLOCK
      ?auto_33498 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33494 ?auto_33495 ) ) ( not ( = ?auto_33494 ?auto_33496 ) ) ( not ( = ?auto_33494 ?auto_33497 ) ) ( not ( = ?auto_33494 ?auto_33498 ) ) ( not ( = ?auto_33495 ?auto_33496 ) ) ( not ( = ?auto_33495 ?auto_33497 ) ) ( not ( = ?auto_33495 ?auto_33498 ) ) ( not ( = ?auto_33496 ?auto_33497 ) ) ( not ( = ?auto_33496 ?auto_33498 ) ) ( not ( = ?auto_33497 ?auto_33498 ) ) ( ON-TABLE ?auto_33498 ) ( ON ?auto_33497 ?auto_33498 ) ( ON ?auto_33496 ?auto_33497 ) ( ON ?auto_33495 ?auto_33496 ) ( CLEAR ?auto_33495 ) ( HOLDING ?auto_33494 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33494 )
      ( MAKE-5PILE ?auto_33494 ?auto_33495 ?auto_33496 ?auto_33497 ?auto_33498 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33499 - BLOCK
      ?auto_33500 - BLOCK
      ?auto_33501 - BLOCK
      ?auto_33502 - BLOCK
      ?auto_33503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33499 ?auto_33500 ) ) ( not ( = ?auto_33499 ?auto_33501 ) ) ( not ( = ?auto_33499 ?auto_33502 ) ) ( not ( = ?auto_33499 ?auto_33503 ) ) ( not ( = ?auto_33500 ?auto_33501 ) ) ( not ( = ?auto_33500 ?auto_33502 ) ) ( not ( = ?auto_33500 ?auto_33503 ) ) ( not ( = ?auto_33501 ?auto_33502 ) ) ( not ( = ?auto_33501 ?auto_33503 ) ) ( not ( = ?auto_33502 ?auto_33503 ) ) ( ON-TABLE ?auto_33503 ) ( ON ?auto_33502 ?auto_33503 ) ( ON ?auto_33501 ?auto_33502 ) ( ON ?auto_33500 ?auto_33501 ) ( ON ?auto_33499 ?auto_33500 ) ( CLEAR ?auto_33499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33503 ?auto_33502 ?auto_33501 ?auto_33500 )
      ( MAKE-5PILE ?auto_33499 ?auto_33500 ?auto_33501 ?auto_33502 ?auto_33503 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33509 - BLOCK
      ?auto_33510 - BLOCK
      ?auto_33511 - BLOCK
      ?auto_33512 - BLOCK
      ?auto_33513 - BLOCK
    )
    :vars
    (
      ?auto_33514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33509 ?auto_33510 ) ) ( not ( = ?auto_33509 ?auto_33511 ) ) ( not ( = ?auto_33509 ?auto_33512 ) ) ( not ( = ?auto_33509 ?auto_33513 ) ) ( not ( = ?auto_33510 ?auto_33511 ) ) ( not ( = ?auto_33510 ?auto_33512 ) ) ( not ( = ?auto_33510 ?auto_33513 ) ) ( not ( = ?auto_33511 ?auto_33512 ) ) ( not ( = ?auto_33511 ?auto_33513 ) ) ( not ( = ?auto_33512 ?auto_33513 ) ) ( ON-TABLE ?auto_33513 ) ( ON ?auto_33512 ?auto_33513 ) ( ON ?auto_33511 ?auto_33512 ) ( ON ?auto_33510 ?auto_33511 ) ( CLEAR ?auto_33510 ) ( ON ?auto_33509 ?auto_33514 ) ( CLEAR ?auto_33509 ) ( HAND-EMPTY ) ( not ( = ?auto_33509 ?auto_33514 ) ) ( not ( = ?auto_33510 ?auto_33514 ) ) ( not ( = ?auto_33511 ?auto_33514 ) ) ( not ( = ?auto_33512 ?auto_33514 ) ) ( not ( = ?auto_33513 ?auto_33514 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33509 ?auto_33514 )
      ( MAKE-5PILE ?auto_33509 ?auto_33510 ?auto_33511 ?auto_33512 ?auto_33513 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33515 - BLOCK
      ?auto_33516 - BLOCK
      ?auto_33517 - BLOCK
      ?auto_33518 - BLOCK
      ?auto_33519 - BLOCK
    )
    :vars
    (
      ?auto_33520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33515 ?auto_33516 ) ) ( not ( = ?auto_33515 ?auto_33517 ) ) ( not ( = ?auto_33515 ?auto_33518 ) ) ( not ( = ?auto_33515 ?auto_33519 ) ) ( not ( = ?auto_33516 ?auto_33517 ) ) ( not ( = ?auto_33516 ?auto_33518 ) ) ( not ( = ?auto_33516 ?auto_33519 ) ) ( not ( = ?auto_33517 ?auto_33518 ) ) ( not ( = ?auto_33517 ?auto_33519 ) ) ( not ( = ?auto_33518 ?auto_33519 ) ) ( ON-TABLE ?auto_33519 ) ( ON ?auto_33518 ?auto_33519 ) ( ON ?auto_33517 ?auto_33518 ) ( ON ?auto_33515 ?auto_33520 ) ( CLEAR ?auto_33515 ) ( not ( = ?auto_33515 ?auto_33520 ) ) ( not ( = ?auto_33516 ?auto_33520 ) ) ( not ( = ?auto_33517 ?auto_33520 ) ) ( not ( = ?auto_33518 ?auto_33520 ) ) ( not ( = ?auto_33519 ?auto_33520 ) ) ( HOLDING ?auto_33516 ) ( CLEAR ?auto_33517 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33519 ?auto_33518 ?auto_33517 ?auto_33516 )
      ( MAKE-5PILE ?auto_33515 ?auto_33516 ?auto_33517 ?auto_33518 ?auto_33519 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33521 - BLOCK
      ?auto_33522 - BLOCK
      ?auto_33523 - BLOCK
      ?auto_33524 - BLOCK
      ?auto_33525 - BLOCK
    )
    :vars
    (
      ?auto_33526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33521 ?auto_33522 ) ) ( not ( = ?auto_33521 ?auto_33523 ) ) ( not ( = ?auto_33521 ?auto_33524 ) ) ( not ( = ?auto_33521 ?auto_33525 ) ) ( not ( = ?auto_33522 ?auto_33523 ) ) ( not ( = ?auto_33522 ?auto_33524 ) ) ( not ( = ?auto_33522 ?auto_33525 ) ) ( not ( = ?auto_33523 ?auto_33524 ) ) ( not ( = ?auto_33523 ?auto_33525 ) ) ( not ( = ?auto_33524 ?auto_33525 ) ) ( ON-TABLE ?auto_33525 ) ( ON ?auto_33524 ?auto_33525 ) ( ON ?auto_33523 ?auto_33524 ) ( ON ?auto_33521 ?auto_33526 ) ( not ( = ?auto_33521 ?auto_33526 ) ) ( not ( = ?auto_33522 ?auto_33526 ) ) ( not ( = ?auto_33523 ?auto_33526 ) ) ( not ( = ?auto_33524 ?auto_33526 ) ) ( not ( = ?auto_33525 ?auto_33526 ) ) ( CLEAR ?auto_33523 ) ( ON ?auto_33522 ?auto_33521 ) ( CLEAR ?auto_33522 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33526 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33526 ?auto_33521 )
      ( MAKE-5PILE ?auto_33521 ?auto_33522 ?auto_33523 ?auto_33524 ?auto_33525 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33527 - BLOCK
      ?auto_33528 - BLOCK
      ?auto_33529 - BLOCK
      ?auto_33530 - BLOCK
      ?auto_33531 - BLOCK
    )
    :vars
    (
      ?auto_33532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33527 ?auto_33528 ) ) ( not ( = ?auto_33527 ?auto_33529 ) ) ( not ( = ?auto_33527 ?auto_33530 ) ) ( not ( = ?auto_33527 ?auto_33531 ) ) ( not ( = ?auto_33528 ?auto_33529 ) ) ( not ( = ?auto_33528 ?auto_33530 ) ) ( not ( = ?auto_33528 ?auto_33531 ) ) ( not ( = ?auto_33529 ?auto_33530 ) ) ( not ( = ?auto_33529 ?auto_33531 ) ) ( not ( = ?auto_33530 ?auto_33531 ) ) ( ON-TABLE ?auto_33531 ) ( ON ?auto_33530 ?auto_33531 ) ( ON ?auto_33527 ?auto_33532 ) ( not ( = ?auto_33527 ?auto_33532 ) ) ( not ( = ?auto_33528 ?auto_33532 ) ) ( not ( = ?auto_33529 ?auto_33532 ) ) ( not ( = ?auto_33530 ?auto_33532 ) ) ( not ( = ?auto_33531 ?auto_33532 ) ) ( ON ?auto_33528 ?auto_33527 ) ( CLEAR ?auto_33528 ) ( ON-TABLE ?auto_33532 ) ( HOLDING ?auto_33529 ) ( CLEAR ?auto_33530 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33531 ?auto_33530 ?auto_33529 )
      ( MAKE-5PILE ?auto_33527 ?auto_33528 ?auto_33529 ?auto_33530 ?auto_33531 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33533 - BLOCK
      ?auto_33534 - BLOCK
      ?auto_33535 - BLOCK
      ?auto_33536 - BLOCK
      ?auto_33537 - BLOCK
    )
    :vars
    (
      ?auto_33538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33533 ?auto_33534 ) ) ( not ( = ?auto_33533 ?auto_33535 ) ) ( not ( = ?auto_33533 ?auto_33536 ) ) ( not ( = ?auto_33533 ?auto_33537 ) ) ( not ( = ?auto_33534 ?auto_33535 ) ) ( not ( = ?auto_33534 ?auto_33536 ) ) ( not ( = ?auto_33534 ?auto_33537 ) ) ( not ( = ?auto_33535 ?auto_33536 ) ) ( not ( = ?auto_33535 ?auto_33537 ) ) ( not ( = ?auto_33536 ?auto_33537 ) ) ( ON-TABLE ?auto_33537 ) ( ON ?auto_33536 ?auto_33537 ) ( ON ?auto_33533 ?auto_33538 ) ( not ( = ?auto_33533 ?auto_33538 ) ) ( not ( = ?auto_33534 ?auto_33538 ) ) ( not ( = ?auto_33535 ?auto_33538 ) ) ( not ( = ?auto_33536 ?auto_33538 ) ) ( not ( = ?auto_33537 ?auto_33538 ) ) ( ON ?auto_33534 ?auto_33533 ) ( ON-TABLE ?auto_33538 ) ( CLEAR ?auto_33536 ) ( ON ?auto_33535 ?auto_33534 ) ( CLEAR ?auto_33535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33538 ?auto_33533 ?auto_33534 )
      ( MAKE-5PILE ?auto_33533 ?auto_33534 ?auto_33535 ?auto_33536 ?auto_33537 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33539 - BLOCK
      ?auto_33540 - BLOCK
      ?auto_33541 - BLOCK
      ?auto_33542 - BLOCK
      ?auto_33543 - BLOCK
    )
    :vars
    (
      ?auto_33544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33539 ?auto_33540 ) ) ( not ( = ?auto_33539 ?auto_33541 ) ) ( not ( = ?auto_33539 ?auto_33542 ) ) ( not ( = ?auto_33539 ?auto_33543 ) ) ( not ( = ?auto_33540 ?auto_33541 ) ) ( not ( = ?auto_33540 ?auto_33542 ) ) ( not ( = ?auto_33540 ?auto_33543 ) ) ( not ( = ?auto_33541 ?auto_33542 ) ) ( not ( = ?auto_33541 ?auto_33543 ) ) ( not ( = ?auto_33542 ?auto_33543 ) ) ( ON-TABLE ?auto_33543 ) ( ON ?auto_33539 ?auto_33544 ) ( not ( = ?auto_33539 ?auto_33544 ) ) ( not ( = ?auto_33540 ?auto_33544 ) ) ( not ( = ?auto_33541 ?auto_33544 ) ) ( not ( = ?auto_33542 ?auto_33544 ) ) ( not ( = ?auto_33543 ?auto_33544 ) ) ( ON ?auto_33540 ?auto_33539 ) ( ON-TABLE ?auto_33544 ) ( ON ?auto_33541 ?auto_33540 ) ( CLEAR ?auto_33541 ) ( HOLDING ?auto_33542 ) ( CLEAR ?auto_33543 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33543 ?auto_33542 )
      ( MAKE-5PILE ?auto_33539 ?auto_33540 ?auto_33541 ?auto_33542 ?auto_33543 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33545 - BLOCK
      ?auto_33546 - BLOCK
      ?auto_33547 - BLOCK
      ?auto_33548 - BLOCK
      ?auto_33549 - BLOCK
    )
    :vars
    (
      ?auto_33550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33545 ?auto_33546 ) ) ( not ( = ?auto_33545 ?auto_33547 ) ) ( not ( = ?auto_33545 ?auto_33548 ) ) ( not ( = ?auto_33545 ?auto_33549 ) ) ( not ( = ?auto_33546 ?auto_33547 ) ) ( not ( = ?auto_33546 ?auto_33548 ) ) ( not ( = ?auto_33546 ?auto_33549 ) ) ( not ( = ?auto_33547 ?auto_33548 ) ) ( not ( = ?auto_33547 ?auto_33549 ) ) ( not ( = ?auto_33548 ?auto_33549 ) ) ( ON-TABLE ?auto_33549 ) ( ON ?auto_33545 ?auto_33550 ) ( not ( = ?auto_33545 ?auto_33550 ) ) ( not ( = ?auto_33546 ?auto_33550 ) ) ( not ( = ?auto_33547 ?auto_33550 ) ) ( not ( = ?auto_33548 ?auto_33550 ) ) ( not ( = ?auto_33549 ?auto_33550 ) ) ( ON ?auto_33546 ?auto_33545 ) ( ON-TABLE ?auto_33550 ) ( ON ?auto_33547 ?auto_33546 ) ( CLEAR ?auto_33549 ) ( ON ?auto_33548 ?auto_33547 ) ( CLEAR ?auto_33548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33550 ?auto_33545 ?auto_33546 ?auto_33547 )
      ( MAKE-5PILE ?auto_33545 ?auto_33546 ?auto_33547 ?auto_33548 ?auto_33549 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33551 - BLOCK
      ?auto_33552 - BLOCK
      ?auto_33553 - BLOCK
      ?auto_33554 - BLOCK
      ?auto_33555 - BLOCK
    )
    :vars
    (
      ?auto_33556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33551 ?auto_33552 ) ) ( not ( = ?auto_33551 ?auto_33553 ) ) ( not ( = ?auto_33551 ?auto_33554 ) ) ( not ( = ?auto_33551 ?auto_33555 ) ) ( not ( = ?auto_33552 ?auto_33553 ) ) ( not ( = ?auto_33552 ?auto_33554 ) ) ( not ( = ?auto_33552 ?auto_33555 ) ) ( not ( = ?auto_33553 ?auto_33554 ) ) ( not ( = ?auto_33553 ?auto_33555 ) ) ( not ( = ?auto_33554 ?auto_33555 ) ) ( ON ?auto_33551 ?auto_33556 ) ( not ( = ?auto_33551 ?auto_33556 ) ) ( not ( = ?auto_33552 ?auto_33556 ) ) ( not ( = ?auto_33553 ?auto_33556 ) ) ( not ( = ?auto_33554 ?auto_33556 ) ) ( not ( = ?auto_33555 ?auto_33556 ) ) ( ON ?auto_33552 ?auto_33551 ) ( ON-TABLE ?auto_33556 ) ( ON ?auto_33553 ?auto_33552 ) ( ON ?auto_33554 ?auto_33553 ) ( CLEAR ?auto_33554 ) ( HOLDING ?auto_33555 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33555 )
      ( MAKE-5PILE ?auto_33551 ?auto_33552 ?auto_33553 ?auto_33554 ?auto_33555 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33557 - BLOCK
      ?auto_33558 - BLOCK
      ?auto_33559 - BLOCK
      ?auto_33560 - BLOCK
      ?auto_33561 - BLOCK
    )
    :vars
    (
      ?auto_33562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33557 ?auto_33558 ) ) ( not ( = ?auto_33557 ?auto_33559 ) ) ( not ( = ?auto_33557 ?auto_33560 ) ) ( not ( = ?auto_33557 ?auto_33561 ) ) ( not ( = ?auto_33558 ?auto_33559 ) ) ( not ( = ?auto_33558 ?auto_33560 ) ) ( not ( = ?auto_33558 ?auto_33561 ) ) ( not ( = ?auto_33559 ?auto_33560 ) ) ( not ( = ?auto_33559 ?auto_33561 ) ) ( not ( = ?auto_33560 ?auto_33561 ) ) ( ON ?auto_33557 ?auto_33562 ) ( not ( = ?auto_33557 ?auto_33562 ) ) ( not ( = ?auto_33558 ?auto_33562 ) ) ( not ( = ?auto_33559 ?auto_33562 ) ) ( not ( = ?auto_33560 ?auto_33562 ) ) ( not ( = ?auto_33561 ?auto_33562 ) ) ( ON ?auto_33558 ?auto_33557 ) ( ON-TABLE ?auto_33562 ) ( ON ?auto_33559 ?auto_33558 ) ( ON ?auto_33560 ?auto_33559 ) ( ON ?auto_33561 ?auto_33560 ) ( CLEAR ?auto_33561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33562 ?auto_33557 ?auto_33558 ?auto_33559 ?auto_33560 )
      ( MAKE-5PILE ?auto_33557 ?auto_33558 ?auto_33559 ?auto_33560 ?auto_33561 ) )
  )

)

