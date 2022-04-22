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
      ?auto_3616 - BLOCK
    )
    :vars
    (
      ?auto_3617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3616 ?auto_3617 ) ( CLEAR ?auto_3616 ) ( HAND-EMPTY ) ( not ( = ?auto_3616 ?auto_3617 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3616 ?auto_3617 )
      ( !PUTDOWN ?auto_3616 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3619 - BLOCK
    )
    :vars
    (
      ?auto_3620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3619 ?auto_3620 ) ( CLEAR ?auto_3619 ) ( HAND-EMPTY ) ( not ( = ?auto_3619 ?auto_3620 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3619 ?auto_3620 )
      ( !PUTDOWN ?auto_3619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3623 - BLOCK
      ?auto_3624 - BLOCK
    )
    :vars
    (
      ?auto_3625 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3623 ) ( ON ?auto_3624 ?auto_3625 ) ( CLEAR ?auto_3624 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3623 ) ( not ( = ?auto_3623 ?auto_3624 ) ) ( not ( = ?auto_3623 ?auto_3625 ) ) ( not ( = ?auto_3624 ?auto_3625 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3624 ?auto_3625 )
      ( !STACK ?auto_3624 ?auto_3623 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3628 - BLOCK
      ?auto_3629 - BLOCK
    )
    :vars
    (
      ?auto_3630 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3628 ) ( ON ?auto_3629 ?auto_3630 ) ( CLEAR ?auto_3629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3628 ) ( not ( = ?auto_3628 ?auto_3629 ) ) ( not ( = ?auto_3628 ?auto_3630 ) ) ( not ( = ?auto_3629 ?auto_3630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3629 ?auto_3630 )
      ( !STACK ?auto_3629 ?auto_3628 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3633 - BLOCK
      ?auto_3634 - BLOCK
    )
    :vars
    (
      ?auto_3635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3634 ?auto_3635 ) ( not ( = ?auto_3633 ?auto_3634 ) ) ( not ( = ?auto_3633 ?auto_3635 ) ) ( not ( = ?auto_3634 ?auto_3635 ) ) ( ON ?auto_3633 ?auto_3634 ) ( CLEAR ?auto_3633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3633 )
      ( MAKE-2PILE ?auto_3633 ?auto_3634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3638 - BLOCK
      ?auto_3639 - BLOCK
    )
    :vars
    (
      ?auto_3640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3639 ?auto_3640 ) ( not ( = ?auto_3638 ?auto_3639 ) ) ( not ( = ?auto_3638 ?auto_3640 ) ) ( not ( = ?auto_3639 ?auto_3640 ) ) ( ON ?auto_3638 ?auto_3639 ) ( CLEAR ?auto_3638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3638 )
      ( MAKE-2PILE ?auto_3638 ?auto_3639 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3644 - BLOCK
      ?auto_3645 - BLOCK
      ?auto_3646 - BLOCK
    )
    :vars
    (
      ?auto_3647 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3645 ) ( ON ?auto_3646 ?auto_3647 ) ( CLEAR ?auto_3646 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3644 ) ( ON ?auto_3645 ?auto_3644 ) ( not ( = ?auto_3644 ?auto_3645 ) ) ( not ( = ?auto_3644 ?auto_3646 ) ) ( not ( = ?auto_3644 ?auto_3647 ) ) ( not ( = ?auto_3645 ?auto_3646 ) ) ( not ( = ?auto_3645 ?auto_3647 ) ) ( not ( = ?auto_3646 ?auto_3647 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3646 ?auto_3647 )
      ( !STACK ?auto_3646 ?auto_3645 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3651 - BLOCK
      ?auto_3652 - BLOCK
      ?auto_3653 - BLOCK
    )
    :vars
    (
      ?auto_3654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3652 ) ( ON ?auto_3653 ?auto_3654 ) ( CLEAR ?auto_3653 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3651 ) ( ON ?auto_3652 ?auto_3651 ) ( not ( = ?auto_3651 ?auto_3652 ) ) ( not ( = ?auto_3651 ?auto_3653 ) ) ( not ( = ?auto_3651 ?auto_3654 ) ) ( not ( = ?auto_3652 ?auto_3653 ) ) ( not ( = ?auto_3652 ?auto_3654 ) ) ( not ( = ?auto_3653 ?auto_3654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3653 ?auto_3654 )
      ( !STACK ?auto_3653 ?auto_3652 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3658 - BLOCK
      ?auto_3659 - BLOCK
      ?auto_3660 - BLOCK
    )
    :vars
    (
      ?auto_3661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3660 ?auto_3661 ) ( ON-TABLE ?auto_3658 ) ( not ( = ?auto_3658 ?auto_3659 ) ) ( not ( = ?auto_3658 ?auto_3660 ) ) ( not ( = ?auto_3658 ?auto_3661 ) ) ( not ( = ?auto_3659 ?auto_3660 ) ) ( not ( = ?auto_3659 ?auto_3661 ) ) ( not ( = ?auto_3660 ?auto_3661 ) ) ( CLEAR ?auto_3658 ) ( ON ?auto_3659 ?auto_3660 ) ( CLEAR ?auto_3659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3658 ?auto_3659 )
      ( MAKE-3PILE ?auto_3658 ?auto_3659 ?auto_3660 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3665 - BLOCK
      ?auto_3666 - BLOCK
      ?auto_3667 - BLOCK
    )
    :vars
    (
      ?auto_3668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3667 ?auto_3668 ) ( ON-TABLE ?auto_3665 ) ( not ( = ?auto_3665 ?auto_3666 ) ) ( not ( = ?auto_3665 ?auto_3667 ) ) ( not ( = ?auto_3665 ?auto_3668 ) ) ( not ( = ?auto_3666 ?auto_3667 ) ) ( not ( = ?auto_3666 ?auto_3668 ) ) ( not ( = ?auto_3667 ?auto_3668 ) ) ( CLEAR ?auto_3665 ) ( ON ?auto_3666 ?auto_3667 ) ( CLEAR ?auto_3666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3665 ?auto_3666 )
      ( MAKE-3PILE ?auto_3665 ?auto_3666 ?auto_3667 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3672 - BLOCK
      ?auto_3673 - BLOCK
      ?auto_3674 - BLOCK
    )
    :vars
    (
      ?auto_3675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3674 ?auto_3675 ) ( not ( = ?auto_3672 ?auto_3673 ) ) ( not ( = ?auto_3672 ?auto_3674 ) ) ( not ( = ?auto_3672 ?auto_3675 ) ) ( not ( = ?auto_3673 ?auto_3674 ) ) ( not ( = ?auto_3673 ?auto_3675 ) ) ( not ( = ?auto_3674 ?auto_3675 ) ) ( ON ?auto_3673 ?auto_3674 ) ( ON ?auto_3672 ?auto_3673 ) ( CLEAR ?auto_3672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3672 )
      ( MAKE-3PILE ?auto_3672 ?auto_3673 ?auto_3674 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3679 - BLOCK
      ?auto_3680 - BLOCK
      ?auto_3681 - BLOCK
    )
    :vars
    (
      ?auto_3682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3681 ?auto_3682 ) ( not ( = ?auto_3679 ?auto_3680 ) ) ( not ( = ?auto_3679 ?auto_3681 ) ) ( not ( = ?auto_3679 ?auto_3682 ) ) ( not ( = ?auto_3680 ?auto_3681 ) ) ( not ( = ?auto_3680 ?auto_3682 ) ) ( not ( = ?auto_3681 ?auto_3682 ) ) ( ON ?auto_3680 ?auto_3681 ) ( ON ?auto_3679 ?auto_3680 ) ( CLEAR ?auto_3679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3679 )
      ( MAKE-3PILE ?auto_3679 ?auto_3680 ?auto_3681 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3687 - BLOCK
      ?auto_3688 - BLOCK
      ?auto_3689 - BLOCK
      ?auto_3690 - BLOCK
    )
    :vars
    (
      ?auto_3691 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3689 ) ( ON ?auto_3690 ?auto_3691 ) ( CLEAR ?auto_3690 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3687 ) ( ON ?auto_3688 ?auto_3687 ) ( ON ?auto_3689 ?auto_3688 ) ( not ( = ?auto_3687 ?auto_3688 ) ) ( not ( = ?auto_3687 ?auto_3689 ) ) ( not ( = ?auto_3687 ?auto_3690 ) ) ( not ( = ?auto_3687 ?auto_3691 ) ) ( not ( = ?auto_3688 ?auto_3689 ) ) ( not ( = ?auto_3688 ?auto_3690 ) ) ( not ( = ?auto_3688 ?auto_3691 ) ) ( not ( = ?auto_3689 ?auto_3690 ) ) ( not ( = ?auto_3689 ?auto_3691 ) ) ( not ( = ?auto_3690 ?auto_3691 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3690 ?auto_3691 )
      ( !STACK ?auto_3690 ?auto_3689 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3696 - BLOCK
      ?auto_3697 - BLOCK
      ?auto_3698 - BLOCK
      ?auto_3699 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3698 ) ( ON-TABLE ?auto_3699 ) ( CLEAR ?auto_3699 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3696 ) ( ON ?auto_3697 ?auto_3696 ) ( ON ?auto_3698 ?auto_3697 ) ( not ( = ?auto_3696 ?auto_3697 ) ) ( not ( = ?auto_3696 ?auto_3698 ) ) ( not ( = ?auto_3696 ?auto_3699 ) ) ( not ( = ?auto_3697 ?auto_3698 ) ) ( not ( = ?auto_3697 ?auto_3699 ) ) ( not ( = ?auto_3698 ?auto_3699 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_3699 )
      ( !STACK ?auto_3699 ?auto_3698 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3704 - BLOCK
      ?auto_3705 - BLOCK
      ?auto_3706 - BLOCK
      ?auto_3707 - BLOCK
    )
    :vars
    (
      ?auto_3708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3707 ?auto_3708 ) ( ON-TABLE ?auto_3704 ) ( ON ?auto_3705 ?auto_3704 ) ( not ( = ?auto_3704 ?auto_3705 ) ) ( not ( = ?auto_3704 ?auto_3706 ) ) ( not ( = ?auto_3704 ?auto_3707 ) ) ( not ( = ?auto_3704 ?auto_3708 ) ) ( not ( = ?auto_3705 ?auto_3706 ) ) ( not ( = ?auto_3705 ?auto_3707 ) ) ( not ( = ?auto_3705 ?auto_3708 ) ) ( not ( = ?auto_3706 ?auto_3707 ) ) ( not ( = ?auto_3706 ?auto_3708 ) ) ( not ( = ?auto_3707 ?auto_3708 ) ) ( CLEAR ?auto_3705 ) ( ON ?auto_3706 ?auto_3707 ) ( CLEAR ?auto_3706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3704 ?auto_3705 ?auto_3706 )
      ( MAKE-4PILE ?auto_3704 ?auto_3705 ?auto_3706 ?auto_3707 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3713 - BLOCK
      ?auto_3714 - BLOCK
      ?auto_3715 - BLOCK
      ?auto_3716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3716 ) ( ON-TABLE ?auto_3713 ) ( ON ?auto_3714 ?auto_3713 ) ( not ( = ?auto_3713 ?auto_3714 ) ) ( not ( = ?auto_3713 ?auto_3715 ) ) ( not ( = ?auto_3713 ?auto_3716 ) ) ( not ( = ?auto_3714 ?auto_3715 ) ) ( not ( = ?auto_3714 ?auto_3716 ) ) ( not ( = ?auto_3715 ?auto_3716 ) ) ( CLEAR ?auto_3714 ) ( ON ?auto_3715 ?auto_3716 ) ( CLEAR ?auto_3715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3713 ?auto_3714 ?auto_3715 )
      ( MAKE-4PILE ?auto_3713 ?auto_3714 ?auto_3715 ?auto_3716 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3721 - BLOCK
      ?auto_3722 - BLOCK
      ?auto_3723 - BLOCK
      ?auto_3724 - BLOCK
    )
    :vars
    (
      ?auto_3725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3724 ?auto_3725 ) ( ON-TABLE ?auto_3721 ) ( not ( = ?auto_3721 ?auto_3722 ) ) ( not ( = ?auto_3721 ?auto_3723 ) ) ( not ( = ?auto_3721 ?auto_3724 ) ) ( not ( = ?auto_3721 ?auto_3725 ) ) ( not ( = ?auto_3722 ?auto_3723 ) ) ( not ( = ?auto_3722 ?auto_3724 ) ) ( not ( = ?auto_3722 ?auto_3725 ) ) ( not ( = ?auto_3723 ?auto_3724 ) ) ( not ( = ?auto_3723 ?auto_3725 ) ) ( not ( = ?auto_3724 ?auto_3725 ) ) ( ON ?auto_3723 ?auto_3724 ) ( CLEAR ?auto_3721 ) ( ON ?auto_3722 ?auto_3723 ) ( CLEAR ?auto_3722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3721 ?auto_3722 )
      ( MAKE-4PILE ?auto_3721 ?auto_3722 ?auto_3723 ?auto_3724 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3730 - BLOCK
      ?auto_3731 - BLOCK
      ?auto_3732 - BLOCK
      ?auto_3733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3733 ) ( ON-TABLE ?auto_3730 ) ( not ( = ?auto_3730 ?auto_3731 ) ) ( not ( = ?auto_3730 ?auto_3732 ) ) ( not ( = ?auto_3730 ?auto_3733 ) ) ( not ( = ?auto_3731 ?auto_3732 ) ) ( not ( = ?auto_3731 ?auto_3733 ) ) ( not ( = ?auto_3732 ?auto_3733 ) ) ( ON ?auto_3732 ?auto_3733 ) ( CLEAR ?auto_3730 ) ( ON ?auto_3731 ?auto_3732 ) ( CLEAR ?auto_3731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3730 ?auto_3731 )
      ( MAKE-4PILE ?auto_3730 ?auto_3731 ?auto_3732 ?auto_3733 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3738 - BLOCK
      ?auto_3739 - BLOCK
      ?auto_3740 - BLOCK
      ?auto_3741 - BLOCK
    )
    :vars
    (
      ?auto_3742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3741 ?auto_3742 ) ( not ( = ?auto_3738 ?auto_3739 ) ) ( not ( = ?auto_3738 ?auto_3740 ) ) ( not ( = ?auto_3738 ?auto_3741 ) ) ( not ( = ?auto_3738 ?auto_3742 ) ) ( not ( = ?auto_3739 ?auto_3740 ) ) ( not ( = ?auto_3739 ?auto_3741 ) ) ( not ( = ?auto_3739 ?auto_3742 ) ) ( not ( = ?auto_3740 ?auto_3741 ) ) ( not ( = ?auto_3740 ?auto_3742 ) ) ( not ( = ?auto_3741 ?auto_3742 ) ) ( ON ?auto_3740 ?auto_3741 ) ( ON ?auto_3739 ?auto_3740 ) ( ON ?auto_3738 ?auto_3739 ) ( CLEAR ?auto_3738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3738 )
      ( MAKE-4PILE ?auto_3738 ?auto_3739 ?auto_3740 ?auto_3741 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3747 - BLOCK
      ?auto_3748 - BLOCK
      ?auto_3749 - BLOCK
      ?auto_3750 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3750 ) ( not ( = ?auto_3747 ?auto_3748 ) ) ( not ( = ?auto_3747 ?auto_3749 ) ) ( not ( = ?auto_3747 ?auto_3750 ) ) ( not ( = ?auto_3748 ?auto_3749 ) ) ( not ( = ?auto_3748 ?auto_3750 ) ) ( not ( = ?auto_3749 ?auto_3750 ) ) ( ON ?auto_3749 ?auto_3750 ) ( ON ?auto_3748 ?auto_3749 ) ( ON ?auto_3747 ?auto_3748 ) ( CLEAR ?auto_3747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3747 )
      ( MAKE-4PILE ?auto_3747 ?auto_3748 ?auto_3749 ?auto_3750 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3755 - BLOCK
      ?auto_3756 - BLOCK
      ?auto_3757 - BLOCK
      ?auto_3758 - BLOCK
    )
    :vars
    (
      ?auto_3759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3755 ?auto_3756 ) ) ( not ( = ?auto_3755 ?auto_3757 ) ) ( not ( = ?auto_3755 ?auto_3758 ) ) ( not ( = ?auto_3756 ?auto_3757 ) ) ( not ( = ?auto_3756 ?auto_3758 ) ) ( not ( = ?auto_3757 ?auto_3758 ) ) ( ON ?auto_3755 ?auto_3759 ) ( not ( = ?auto_3758 ?auto_3759 ) ) ( not ( = ?auto_3757 ?auto_3759 ) ) ( not ( = ?auto_3756 ?auto_3759 ) ) ( not ( = ?auto_3755 ?auto_3759 ) ) ( ON ?auto_3756 ?auto_3755 ) ( ON ?auto_3757 ?auto_3756 ) ( ON ?auto_3758 ?auto_3757 ) ( CLEAR ?auto_3758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_3758 ?auto_3757 ?auto_3756 ?auto_3755 )
      ( MAKE-4PILE ?auto_3755 ?auto_3756 ?auto_3757 ?auto_3758 ) )
  )

)

