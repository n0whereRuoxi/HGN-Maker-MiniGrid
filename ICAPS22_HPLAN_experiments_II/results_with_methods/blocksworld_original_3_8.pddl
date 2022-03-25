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

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3623 - BLOCK
      ?auto_3624 - BLOCK
      ?auto_3625 - BLOCK
    )
    :vars
    (
      ?auto_3626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3626 ?auto_3625 ) ( CLEAR ?auto_3626 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3623 ) ( ON ?auto_3624 ?auto_3623 ) ( ON ?auto_3625 ?auto_3624 ) ( not ( = ?auto_3623 ?auto_3624 ) ) ( not ( = ?auto_3623 ?auto_3625 ) ) ( not ( = ?auto_3623 ?auto_3626 ) ) ( not ( = ?auto_3624 ?auto_3625 ) ) ( not ( = ?auto_3624 ?auto_3626 ) ) ( not ( = ?auto_3625 ?auto_3626 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3626 ?auto_3625 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3628 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3628 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3628 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3629 - BLOCK
    )
    :vars
    (
      ?auto_3630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3629 ?auto_3630 ) ( CLEAR ?auto_3629 ) ( HAND-EMPTY ) ( not ( = ?auto_3629 ?auto_3630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3629 ?auto_3630 )
      ( MAKE-1PILE ?auto_3629 ) )
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
    ( and ( ON ?auto_3635 ?auto_3634 ) ( CLEAR ?auto_3635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3633 ) ( ON ?auto_3634 ?auto_3633 ) ( not ( = ?auto_3633 ?auto_3634 ) ) ( not ( = ?auto_3633 ?auto_3635 ) ) ( not ( = ?auto_3634 ?auto_3635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3635 ?auto_3634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3636 - BLOCK
      ?auto_3637 - BLOCK
    )
    :vars
    (
      ?auto_3638 - BLOCK
      ?auto_3639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3638 ?auto_3637 ) ( CLEAR ?auto_3638 ) ( ON-TABLE ?auto_3636 ) ( ON ?auto_3637 ?auto_3636 ) ( not ( = ?auto_3636 ?auto_3637 ) ) ( not ( = ?auto_3636 ?auto_3638 ) ) ( not ( = ?auto_3637 ?auto_3638 ) ) ( HOLDING ?auto_3639 ) ( not ( = ?auto_3636 ?auto_3639 ) ) ( not ( = ?auto_3637 ?auto_3639 ) ) ( not ( = ?auto_3638 ?auto_3639 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3639 )
      ( MAKE-2PILE ?auto_3636 ?auto_3637 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3640 - BLOCK
      ?auto_3641 - BLOCK
    )
    :vars
    (
      ?auto_3643 - BLOCK
      ?auto_3642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3643 ?auto_3641 ) ( ON-TABLE ?auto_3640 ) ( ON ?auto_3641 ?auto_3640 ) ( not ( = ?auto_3640 ?auto_3641 ) ) ( not ( = ?auto_3640 ?auto_3643 ) ) ( not ( = ?auto_3641 ?auto_3643 ) ) ( not ( = ?auto_3640 ?auto_3642 ) ) ( not ( = ?auto_3641 ?auto_3642 ) ) ( not ( = ?auto_3643 ?auto_3642 ) ) ( ON ?auto_3642 ?auto_3643 ) ( CLEAR ?auto_3642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3640 ?auto_3641 ?auto_3643 )
      ( MAKE-2PILE ?auto_3640 ?auto_3641 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3646 - BLOCK
      ?auto_3647 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3647 ) ( CLEAR ?auto_3646 ) ( ON-TABLE ?auto_3646 ) ( not ( = ?auto_3646 ?auto_3647 ) ) )
    :subtasks
    ( ( !STACK ?auto_3647 ?auto_3646 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3648 - BLOCK
      ?auto_3649 - BLOCK
    )
    :vars
    (
      ?auto_3650 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3648 ) ( ON-TABLE ?auto_3648 ) ( not ( = ?auto_3648 ?auto_3649 ) ) ( ON ?auto_3649 ?auto_3650 ) ( CLEAR ?auto_3649 ) ( HAND-EMPTY ) ( not ( = ?auto_3648 ?auto_3650 ) ) ( not ( = ?auto_3649 ?auto_3650 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3649 ?auto_3650 )
      ( MAKE-2PILE ?auto_3648 ?auto_3649 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3651 - BLOCK
      ?auto_3652 - BLOCK
    )
    :vars
    (
      ?auto_3653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3651 ?auto_3652 ) ) ( ON ?auto_3652 ?auto_3653 ) ( CLEAR ?auto_3652 ) ( not ( = ?auto_3651 ?auto_3653 ) ) ( not ( = ?auto_3652 ?auto_3653 ) ) ( HOLDING ?auto_3651 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3651 )
      ( MAKE-2PILE ?auto_3651 ?auto_3652 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3654 - BLOCK
      ?auto_3655 - BLOCK
    )
    :vars
    (
      ?auto_3656 - BLOCK
      ?auto_3657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3654 ?auto_3655 ) ) ( ON ?auto_3655 ?auto_3656 ) ( not ( = ?auto_3654 ?auto_3656 ) ) ( not ( = ?auto_3655 ?auto_3656 ) ) ( ON ?auto_3654 ?auto_3655 ) ( CLEAR ?auto_3654 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3657 ) ( ON ?auto_3656 ?auto_3657 ) ( not ( = ?auto_3657 ?auto_3656 ) ) ( not ( = ?auto_3657 ?auto_3655 ) ) ( not ( = ?auto_3657 ?auto_3654 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3657 ?auto_3656 ?auto_3655 )
      ( MAKE-2PILE ?auto_3654 ?auto_3655 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3659 - BLOCK
    )
    :vars
    (
      ?auto_3660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3660 ?auto_3659 ) ( CLEAR ?auto_3660 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3659 ) ( not ( = ?auto_3659 ?auto_3660 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3660 ?auto_3659 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3661 - BLOCK
    )
    :vars
    (
      ?auto_3662 - BLOCK
      ?auto_3663 - BLOCK
      ?auto_3664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3662 ?auto_3661 ) ( CLEAR ?auto_3662 ) ( ON-TABLE ?auto_3661 ) ( not ( = ?auto_3661 ?auto_3662 ) ) ( HOLDING ?auto_3663 ) ( CLEAR ?auto_3664 ) ( not ( = ?auto_3661 ?auto_3663 ) ) ( not ( = ?auto_3661 ?auto_3664 ) ) ( not ( = ?auto_3662 ?auto_3663 ) ) ( not ( = ?auto_3662 ?auto_3664 ) ) ( not ( = ?auto_3663 ?auto_3664 ) ) )
    :subtasks
    ( ( !STACK ?auto_3663 ?auto_3664 )
      ( MAKE-1PILE ?auto_3661 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3665 - BLOCK
    )
    :vars
    (
      ?auto_3667 - BLOCK
      ?auto_3668 - BLOCK
      ?auto_3666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3667 ?auto_3665 ) ( ON-TABLE ?auto_3665 ) ( not ( = ?auto_3665 ?auto_3667 ) ) ( CLEAR ?auto_3668 ) ( not ( = ?auto_3665 ?auto_3666 ) ) ( not ( = ?auto_3665 ?auto_3668 ) ) ( not ( = ?auto_3667 ?auto_3666 ) ) ( not ( = ?auto_3667 ?auto_3668 ) ) ( not ( = ?auto_3666 ?auto_3668 ) ) ( ON ?auto_3666 ?auto_3667 ) ( CLEAR ?auto_3666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3665 ?auto_3667 )
      ( MAKE-1PILE ?auto_3665 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3669 - BLOCK
    )
    :vars
    (
      ?auto_3672 - BLOCK
      ?auto_3670 - BLOCK
      ?auto_3671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3672 ?auto_3669 ) ( ON-TABLE ?auto_3669 ) ( not ( = ?auto_3669 ?auto_3672 ) ) ( not ( = ?auto_3669 ?auto_3670 ) ) ( not ( = ?auto_3669 ?auto_3671 ) ) ( not ( = ?auto_3672 ?auto_3670 ) ) ( not ( = ?auto_3672 ?auto_3671 ) ) ( not ( = ?auto_3670 ?auto_3671 ) ) ( ON ?auto_3670 ?auto_3672 ) ( CLEAR ?auto_3670 ) ( HOLDING ?auto_3671 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3671 )
      ( MAKE-1PILE ?auto_3669 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3673 - BLOCK
    )
    :vars
    (
      ?auto_3674 - BLOCK
      ?auto_3676 - BLOCK
      ?auto_3675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3674 ?auto_3673 ) ( ON-TABLE ?auto_3673 ) ( not ( = ?auto_3673 ?auto_3674 ) ) ( not ( = ?auto_3673 ?auto_3676 ) ) ( not ( = ?auto_3673 ?auto_3675 ) ) ( not ( = ?auto_3674 ?auto_3676 ) ) ( not ( = ?auto_3674 ?auto_3675 ) ) ( not ( = ?auto_3676 ?auto_3675 ) ) ( ON ?auto_3676 ?auto_3674 ) ( ON ?auto_3675 ?auto_3676 ) ( CLEAR ?auto_3675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3673 ?auto_3674 ?auto_3676 )
      ( MAKE-1PILE ?auto_3673 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3680 - BLOCK
      ?auto_3681 - BLOCK
      ?auto_3682 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3682 ) ( CLEAR ?auto_3681 ) ( ON-TABLE ?auto_3680 ) ( ON ?auto_3681 ?auto_3680 ) ( not ( = ?auto_3680 ?auto_3681 ) ) ( not ( = ?auto_3680 ?auto_3682 ) ) ( not ( = ?auto_3681 ?auto_3682 ) ) )
    :subtasks
    ( ( !STACK ?auto_3682 ?auto_3681 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3683 - BLOCK
      ?auto_3684 - BLOCK
      ?auto_3685 - BLOCK
    )
    :vars
    (
      ?auto_3686 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3684 ) ( ON-TABLE ?auto_3683 ) ( ON ?auto_3684 ?auto_3683 ) ( not ( = ?auto_3683 ?auto_3684 ) ) ( not ( = ?auto_3683 ?auto_3685 ) ) ( not ( = ?auto_3684 ?auto_3685 ) ) ( ON ?auto_3685 ?auto_3686 ) ( CLEAR ?auto_3685 ) ( HAND-EMPTY ) ( not ( = ?auto_3683 ?auto_3686 ) ) ( not ( = ?auto_3684 ?auto_3686 ) ) ( not ( = ?auto_3685 ?auto_3686 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3685 ?auto_3686 )
      ( MAKE-3PILE ?auto_3683 ?auto_3684 ?auto_3685 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3687 - BLOCK
      ?auto_3688 - BLOCK
      ?auto_3689 - BLOCK
    )
    :vars
    (
      ?auto_3690 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3687 ) ( not ( = ?auto_3687 ?auto_3688 ) ) ( not ( = ?auto_3687 ?auto_3689 ) ) ( not ( = ?auto_3688 ?auto_3689 ) ) ( ON ?auto_3689 ?auto_3690 ) ( CLEAR ?auto_3689 ) ( not ( = ?auto_3687 ?auto_3690 ) ) ( not ( = ?auto_3688 ?auto_3690 ) ) ( not ( = ?auto_3689 ?auto_3690 ) ) ( HOLDING ?auto_3688 ) ( CLEAR ?auto_3687 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3687 ?auto_3688 )
      ( MAKE-3PILE ?auto_3687 ?auto_3688 ?auto_3689 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3691 - BLOCK
      ?auto_3692 - BLOCK
      ?auto_3693 - BLOCK
    )
    :vars
    (
      ?auto_3694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3691 ) ( not ( = ?auto_3691 ?auto_3692 ) ) ( not ( = ?auto_3691 ?auto_3693 ) ) ( not ( = ?auto_3692 ?auto_3693 ) ) ( ON ?auto_3693 ?auto_3694 ) ( not ( = ?auto_3691 ?auto_3694 ) ) ( not ( = ?auto_3692 ?auto_3694 ) ) ( not ( = ?auto_3693 ?auto_3694 ) ) ( CLEAR ?auto_3691 ) ( ON ?auto_3692 ?auto_3693 ) ( CLEAR ?auto_3692 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3694 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3694 ?auto_3693 )
      ( MAKE-3PILE ?auto_3691 ?auto_3692 ?auto_3693 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3695 - BLOCK
      ?auto_3696 - BLOCK
      ?auto_3697 - BLOCK
    )
    :vars
    (
      ?auto_3698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3695 ?auto_3696 ) ) ( not ( = ?auto_3695 ?auto_3697 ) ) ( not ( = ?auto_3696 ?auto_3697 ) ) ( ON ?auto_3697 ?auto_3698 ) ( not ( = ?auto_3695 ?auto_3698 ) ) ( not ( = ?auto_3696 ?auto_3698 ) ) ( not ( = ?auto_3697 ?auto_3698 ) ) ( ON ?auto_3696 ?auto_3697 ) ( CLEAR ?auto_3696 ) ( ON-TABLE ?auto_3698 ) ( HOLDING ?auto_3695 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3695 )
      ( MAKE-3PILE ?auto_3695 ?auto_3696 ?auto_3697 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3699 - BLOCK
      ?auto_3700 - BLOCK
      ?auto_3701 - BLOCK
    )
    :vars
    (
      ?auto_3702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3699 ?auto_3700 ) ) ( not ( = ?auto_3699 ?auto_3701 ) ) ( not ( = ?auto_3700 ?auto_3701 ) ) ( ON ?auto_3701 ?auto_3702 ) ( not ( = ?auto_3699 ?auto_3702 ) ) ( not ( = ?auto_3700 ?auto_3702 ) ) ( not ( = ?auto_3701 ?auto_3702 ) ) ( ON ?auto_3700 ?auto_3701 ) ( ON-TABLE ?auto_3702 ) ( ON ?auto_3699 ?auto_3700 ) ( CLEAR ?auto_3699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3702 ?auto_3701 ?auto_3700 )
      ( MAKE-3PILE ?auto_3699 ?auto_3700 ?auto_3701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3705 - BLOCK
      ?auto_3706 - BLOCK
    )
    :vars
    (
      ?auto_3707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3707 ?auto_3706 ) ( CLEAR ?auto_3707 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3705 ) ( ON ?auto_3706 ?auto_3705 ) ( not ( = ?auto_3705 ?auto_3706 ) ) ( not ( = ?auto_3705 ?auto_3707 ) ) ( not ( = ?auto_3706 ?auto_3707 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3707 ?auto_3706 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3715 - BLOCK
      ?auto_3716 - BLOCK
    )
    :vars
    (
      ?auto_3717 - BLOCK
      ?auto_3718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3715 ) ( not ( = ?auto_3715 ?auto_3716 ) ) ( not ( = ?auto_3715 ?auto_3717 ) ) ( not ( = ?auto_3716 ?auto_3717 ) ) ( ON ?auto_3717 ?auto_3718 ) ( CLEAR ?auto_3717 ) ( not ( = ?auto_3715 ?auto_3718 ) ) ( not ( = ?auto_3716 ?auto_3718 ) ) ( not ( = ?auto_3717 ?auto_3718 ) ) ( HOLDING ?auto_3716 ) ( CLEAR ?auto_3715 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3715 ?auto_3716 ?auto_3717 )
      ( MAKE-2PILE ?auto_3715 ?auto_3716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3719 - BLOCK
      ?auto_3720 - BLOCK
    )
    :vars
    (
      ?auto_3722 - BLOCK
      ?auto_3721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3719 ) ( not ( = ?auto_3719 ?auto_3720 ) ) ( not ( = ?auto_3719 ?auto_3722 ) ) ( not ( = ?auto_3720 ?auto_3722 ) ) ( ON ?auto_3722 ?auto_3721 ) ( not ( = ?auto_3719 ?auto_3721 ) ) ( not ( = ?auto_3720 ?auto_3721 ) ) ( not ( = ?auto_3722 ?auto_3721 ) ) ( CLEAR ?auto_3719 ) ( ON ?auto_3720 ?auto_3722 ) ( CLEAR ?auto_3720 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3721 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3721 ?auto_3722 )
      ( MAKE-2PILE ?auto_3719 ?auto_3720 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3723 - BLOCK
      ?auto_3724 - BLOCK
    )
    :vars
    (
      ?auto_3725 - BLOCK
      ?auto_3726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3723 ?auto_3724 ) ) ( not ( = ?auto_3723 ?auto_3725 ) ) ( not ( = ?auto_3724 ?auto_3725 ) ) ( ON ?auto_3725 ?auto_3726 ) ( not ( = ?auto_3723 ?auto_3726 ) ) ( not ( = ?auto_3724 ?auto_3726 ) ) ( not ( = ?auto_3725 ?auto_3726 ) ) ( ON ?auto_3724 ?auto_3725 ) ( CLEAR ?auto_3724 ) ( ON-TABLE ?auto_3726 ) ( HOLDING ?auto_3723 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3723 )
      ( MAKE-2PILE ?auto_3723 ?auto_3724 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3727 - BLOCK
      ?auto_3728 - BLOCK
    )
    :vars
    (
      ?auto_3729 - BLOCK
      ?auto_3730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3727 ?auto_3728 ) ) ( not ( = ?auto_3727 ?auto_3729 ) ) ( not ( = ?auto_3728 ?auto_3729 ) ) ( ON ?auto_3729 ?auto_3730 ) ( not ( = ?auto_3727 ?auto_3730 ) ) ( not ( = ?auto_3728 ?auto_3730 ) ) ( not ( = ?auto_3729 ?auto_3730 ) ) ( ON ?auto_3728 ?auto_3729 ) ( ON-TABLE ?auto_3730 ) ( ON ?auto_3727 ?auto_3728 ) ( CLEAR ?auto_3727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3730 ?auto_3729 ?auto_3728 )
      ( MAKE-2PILE ?auto_3727 ?auto_3728 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3732 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3732 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3732 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3733 - BLOCK
    )
    :vars
    (
      ?auto_3734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3733 ?auto_3734 ) ( CLEAR ?auto_3733 ) ( HAND-EMPTY ) ( not ( = ?auto_3733 ?auto_3734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3733 ?auto_3734 )
      ( MAKE-1PILE ?auto_3733 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3735 - BLOCK
    )
    :vars
    (
      ?auto_3736 - BLOCK
      ?auto_3737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3735 ?auto_3736 ) ) ( HOLDING ?auto_3735 ) ( CLEAR ?auto_3736 ) ( ON-TABLE ?auto_3737 ) ( ON ?auto_3736 ?auto_3737 ) ( not ( = ?auto_3737 ?auto_3736 ) ) ( not ( = ?auto_3737 ?auto_3735 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3737 ?auto_3736 ?auto_3735 )
      ( MAKE-1PILE ?auto_3735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3738 - BLOCK
    )
    :vars
    (
      ?auto_3740 - BLOCK
      ?auto_3739 - BLOCK
      ?auto_3741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3738 ?auto_3740 ) ) ( CLEAR ?auto_3740 ) ( ON-TABLE ?auto_3739 ) ( ON ?auto_3740 ?auto_3739 ) ( not ( = ?auto_3739 ?auto_3740 ) ) ( not ( = ?auto_3739 ?auto_3738 ) ) ( ON ?auto_3738 ?auto_3741 ) ( CLEAR ?auto_3738 ) ( HAND-EMPTY ) ( not ( = ?auto_3738 ?auto_3741 ) ) ( not ( = ?auto_3740 ?auto_3741 ) ) ( not ( = ?auto_3739 ?auto_3741 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3738 ?auto_3741 )
      ( MAKE-1PILE ?auto_3738 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3742 - BLOCK
    )
    :vars
    (
      ?auto_3743 - BLOCK
      ?auto_3744 - BLOCK
      ?auto_3745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3742 ?auto_3743 ) ) ( ON-TABLE ?auto_3744 ) ( not ( = ?auto_3744 ?auto_3743 ) ) ( not ( = ?auto_3744 ?auto_3742 ) ) ( ON ?auto_3742 ?auto_3745 ) ( CLEAR ?auto_3742 ) ( not ( = ?auto_3742 ?auto_3745 ) ) ( not ( = ?auto_3743 ?auto_3745 ) ) ( not ( = ?auto_3744 ?auto_3745 ) ) ( HOLDING ?auto_3743 ) ( CLEAR ?auto_3744 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3744 ?auto_3743 )
      ( MAKE-1PILE ?auto_3742 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3746 - BLOCK
    )
    :vars
    (
      ?auto_3748 - BLOCK
      ?auto_3749 - BLOCK
      ?auto_3747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3746 ?auto_3748 ) ) ( ON-TABLE ?auto_3749 ) ( not ( = ?auto_3749 ?auto_3748 ) ) ( not ( = ?auto_3749 ?auto_3746 ) ) ( ON ?auto_3746 ?auto_3747 ) ( not ( = ?auto_3746 ?auto_3747 ) ) ( not ( = ?auto_3748 ?auto_3747 ) ) ( not ( = ?auto_3749 ?auto_3747 ) ) ( CLEAR ?auto_3749 ) ( ON ?auto_3748 ?auto_3746 ) ( CLEAR ?auto_3748 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3747 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3747 ?auto_3746 )
      ( MAKE-1PILE ?auto_3746 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3750 - BLOCK
    )
    :vars
    (
      ?auto_3753 - BLOCK
      ?auto_3751 - BLOCK
      ?auto_3752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3750 ?auto_3753 ) ) ( not ( = ?auto_3751 ?auto_3753 ) ) ( not ( = ?auto_3751 ?auto_3750 ) ) ( ON ?auto_3750 ?auto_3752 ) ( not ( = ?auto_3750 ?auto_3752 ) ) ( not ( = ?auto_3753 ?auto_3752 ) ) ( not ( = ?auto_3751 ?auto_3752 ) ) ( ON ?auto_3753 ?auto_3750 ) ( CLEAR ?auto_3753 ) ( ON-TABLE ?auto_3752 ) ( HOLDING ?auto_3751 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3751 )
      ( MAKE-1PILE ?auto_3750 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3754 - BLOCK
    )
    :vars
    (
      ?auto_3756 - BLOCK
      ?auto_3755 - BLOCK
      ?auto_3757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3754 ?auto_3756 ) ) ( not ( = ?auto_3755 ?auto_3756 ) ) ( not ( = ?auto_3755 ?auto_3754 ) ) ( ON ?auto_3754 ?auto_3757 ) ( not ( = ?auto_3754 ?auto_3757 ) ) ( not ( = ?auto_3756 ?auto_3757 ) ) ( not ( = ?auto_3755 ?auto_3757 ) ) ( ON ?auto_3756 ?auto_3754 ) ( ON-TABLE ?auto_3757 ) ( ON ?auto_3755 ?auto_3756 ) ( CLEAR ?auto_3755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3757 ?auto_3754 ?auto_3756 )
      ( MAKE-1PILE ?auto_3754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3759 - BLOCK
    )
    :vars
    (
      ?auto_3760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3760 ?auto_3759 ) ( CLEAR ?auto_3760 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3759 ) ( not ( = ?auto_3759 ?auto_3760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3760 ?auto_3759 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3761 - BLOCK
    )
    :vars
    (
      ?auto_3762 - BLOCK
      ?auto_3763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3762 ?auto_3761 ) ( CLEAR ?auto_3762 ) ( ON-TABLE ?auto_3761 ) ( not ( = ?auto_3761 ?auto_3762 ) ) ( HOLDING ?auto_3763 ) ( not ( = ?auto_3761 ?auto_3763 ) ) ( not ( = ?auto_3762 ?auto_3763 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3763 )
      ( MAKE-1PILE ?auto_3761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3764 - BLOCK
    )
    :vars
    (
      ?auto_3765 - BLOCK
      ?auto_3766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3765 ?auto_3764 ) ( ON-TABLE ?auto_3764 ) ( not ( = ?auto_3764 ?auto_3765 ) ) ( not ( = ?auto_3764 ?auto_3766 ) ) ( not ( = ?auto_3765 ?auto_3766 ) ) ( ON ?auto_3766 ?auto_3765 ) ( CLEAR ?auto_3766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3764 ?auto_3765 )
      ( MAKE-1PILE ?auto_3764 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3767 - BLOCK
    )
    :vars
    (
      ?auto_3769 - BLOCK
      ?auto_3768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3769 ?auto_3767 ) ( ON-TABLE ?auto_3767 ) ( not ( = ?auto_3767 ?auto_3769 ) ) ( not ( = ?auto_3767 ?auto_3768 ) ) ( not ( = ?auto_3769 ?auto_3768 ) ) ( HOLDING ?auto_3768 ) ( CLEAR ?auto_3769 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3767 ?auto_3769 ?auto_3768 )
      ( MAKE-1PILE ?auto_3767 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3770 - BLOCK
    )
    :vars
    (
      ?auto_3771 - BLOCK
      ?auto_3772 - BLOCK
      ?auto_3773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3771 ?auto_3770 ) ( ON-TABLE ?auto_3770 ) ( not ( = ?auto_3770 ?auto_3771 ) ) ( not ( = ?auto_3770 ?auto_3772 ) ) ( not ( = ?auto_3771 ?auto_3772 ) ) ( CLEAR ?auto_3771 ) ( ON ?auto_3772 ?auto_3773 ) ( CLEAR ?auto_3772 ) ( HAND-EMPTY ) ( not ( = ?auto_3770 ?auto_3773 ) ) ( not ( = ?auto_3771 ?auto_3773 ) ) ( not ( = ?auto_3772 ?auto_3773 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3772 ?auto_3773 )
      ( MAKE-1PILE ?auto_3770 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3782 - BLOCK
    )
    :vars
    (
      ?auto_3784 - BLOCK
      ?auto_3783 - BLOCK
      ?auto_3785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3782 ?auto_3784 ) ) ( not ( = ?auto_3782 ?auto_3783 ) ) ( not ( = ?auto_3784 ?auto_3783 ) ) ( ON ?auto_3783 ?auto_3785 ) ( not ( = ?auto_3782 ?auto_3785 ) ) ( not ( = ?auto_3784 ?auto_3785 ) ) ( not ( = ?auto_3783 ?auto_3785 ) ) ( ON ?auto_3784 ?auto_3783 ) ( CLEAR ?auto_3784 ) ( HOLDING ?auto_3782 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3782 ?auto_3784 )
      ( MAKE-1PILE ?auto_3782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3786 - BLOCK
    )
    :vars
    (
      ?auto_3787 - BLOCK
      ?auto_3788 - BLOCK
      ?auto_3789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3786 ?auto_3787 ) ) ( not ( = ?auto_3786 ?auto_3788 ) ) ( not ( = ?auto_3787 ?auto_3788 ) ) ( ON ?auto_3788 ?auto_3789 ) ( not ( = ?auto_3786 ?auto_3789 ) ) ( not ( = ?auto_3787 ?auto_3789 ) ) ( not ( = ?auto_3788 ?auto_3789 ) ) ( ON ?auto_3787 ?auto_3788 ) ( ON ?auto_3786 ?auto_3787 ) ( CLEAR ?auto_3786 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3789 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3789 ?auto_3788 ?auto_3787 )
      ( MAKE-1PILE ?auto_3786 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3792 - BLOCK
      ?auto_3793 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3793 ) ( CLEAR ?auto_3792 ) ( ON-TABLE ?auto_3792 ) ( not ( = ?auto_3792 ?auto_3793 ) ) )
    :subtasks
    ( ( !STACK ?auto_3793 ?auto_3792 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3794 - BLOCK
      ?auto_3795 - BLOCK
    )
    :vars
    (
      ?auto_3796 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3794 ) ( ON-TABLE ?auto_3794 ) ( not ( = ?auto_3794 ?auto_3795 ) ) ( ON ?auto_3795 ?auto_3796 ) ( CLEAR ?auto_3795 ) ( HAND-EMPTY ) ( not ( = ?auto_3794 ?auto_3796 ) ) ( not ( = ?auto_3795 ?auto_3796 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3795 ?auto_3796 )
      ( MAKE-2PILE ?auto_3794 ?auto_3795 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3797 - BLOCK
      ?auto_3798 - BLOCK
    )
    :vars
    (
      ?auto_3799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3797 ?auto_3798 ) ) ( ON ?auto_3798 ?auto_3799 ) ( CLEAR ?auto_3798 ) ( not ( = ?auto_3797 ?auto_3799 ) ) ( not ( = ?auto_3798 ?auto_3799 ) ) ( HOLDING ?auto_3797 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3797 )
      ( MAKE-2PILE ?auto_3797 ?auto_3798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3800 - BLOCK
      ?auto_3801 - BLOCK
    )
    :vars
    (
      ?auto_3802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3800 ?auto_3801 ) ) ( ON ?auto_3801 ?auto_3802 ) ( not ( = ?auto_3800 ?auto_3802 ) ) ( not ( = ?auto_3801 ?auto_3802 ) ) ( ON ?auto_3800 ?auto_3801 ) ( CLEAR ?auto_3800 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3802 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3802 ?auto_3801 )
      ( MAKE-2PILE ?auto_3800 ?auto_3801 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3803 - BLOCK
      ?auto_3804 - BLOCK
    )
    :vars
    (
      ?auto_3805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3803 ?auto_3804 ) ) ( ON ?auto_3804 ?auto_3805 ) ( not ( = ?auto_3803 ?auto_3805 ) ) ( not ( = ?auto_3804 ?auto_3805 ) ) ( ON-TABLE ?auto_3805 ) ( HOLDING ?auto_3803 ) ( CLEAR ?auto_3804 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3805 ?auto_3804 ?auto_3803 )
      ( MAKE-2PILE ?auto_3803 ?auto_3804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3806 - BLOCK
      ?auto_3807 - BLOCK
    )
    :vars
    (
      ?auto_3808 - BLOCK
      ?auto_3809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3806 ?auto_3807 ) ) ( ON ?auto_3807 ?auto_3808 ) ( not ( = ?auto_3806 ?auto_3808 ) ) ( not ( = ?auto_3807 ?auto_3808 ) ) ( ON-TABLE ?auto_3808 ) ( CLEAR ?auto_3807 ) ( ON ?auto_3806 ?auto_3809 ) ( CLEAR ?auto_3806 ) ( HAND-EMPTY ) ( not ( = ?auto_3806 ?auto_3809 ) ) ( not ( = ?auto_3807 ?auto_3809 ) ) ( not ( = ?auto_3808 ?auto_3809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3806 ?auto_3809 )
      ( MAKE-2PILE ?auto_3806 ?auto_3807 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3810 - BLOCK
      ?auto_3811 - BLOCK
    )
    :vars
    (
      ?auto_3813 - BLOCK
      ?auto_3812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3810 ?auto_3811 ) ) ( not ( = ?auto_3810 ?auto_3813 ) ) ( not ( = ?auto_3811 ?auto_3813 ) ) ( ON-TABLE ?auto_3813 ) ( ON ?auto_3810 ?auto_3812 ) ( CLEAR ?auto_3810 ) ( not ( = ?auto_3810 ?auto_3812 ) ) ( not ( = ?auto_3811 ?auto_3812 ) ) ( not ( = ?auto_3813 ?auto_3812 ) ) ( HOLDING ?auto_3811 ) ( CLEAR ?auto_3813 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3813 ?auto_3811 )
      ( MAKE-2PILE ?auto_3810 ?auto_3811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3814 - BLOCK
      ?auto_3815 - BLOCK
    )
    :vars
    (
      ?auto_3817 - BLOCK
      ?auto_3816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3814 ?auto_3815 ) ) ( not ( = ?auto_3814 ?auto_3817 ) ) ( not ( = ?auto_3815 ?auto_3817 ) ) ( ON-TABLE ?auto_3817 ) ( ON ?auto_3814 ?auto_3816 ) ( not ( = ?auto_3814 ?auto_3816 ) ) ( not ( = ?auto_3815 ?auto_3816 ) ) ( not ( = ?auto_3817 ?auto_3816 ) ) ( CLEAR ?auto_3817 ) ( ON ?auto_3815 ?auto_3814 ) ( CLEAR ?auto_3815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3816 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3816 ?auto_3814 )
      ( MAKE-2PILE ?auto_3814 ?auto_3815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3818 - BLOCK
      ?auto_3819 - BLOCK
    )
    :vars
    (
      ?auto_3821 - BLOCK
      ?auto_3820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3818 ?auto_3819 ) ) ( not ( = ?auto_3818 ?auto_3821 ) ) ( not ( = ?auto_3819 ?auto_3821 ) ) ( ON ?auto_3818 ?auto_3820 ) ( not ( = ?auto_3818 ?auto_3820 ) ) ( not ( = ?auto_3819 ?auto_3820 ) ) ( not ( = ?auto_3821 ?auto_3820 ) ) ( ON ?auto_3819 ?auto_3818 ) ( CLEAR ?auto_3819 ) ( ON-TABLE ?auto_3820 ) ( HOLDING ?auto_3821 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3821 )
      ( MAKE-2PILE ?auto_3818 ?auto_3819 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3822 - BLOCK
      ?auto_3823 - BLOCK
    )
    :vars
    (
      ?auto_3825 - BLOCK
      ?auto_3824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3822 ?auto_3823 ) ) ( not ( = ?auto_3822 ?auto_3825 ) ) ( not ( = ?auto_3823 ?auto_3825 ) ) ( ON ?auto_3822 ?auto_3824 ) ( not ( = ?auto_3822 ?auto_3824 ) ) ( not ( = ?auto_3823 ?auto_3824 ) ) ( not ( = ?auto_3825 ?auto_3824 ) ) ( ON ?auto_3823 ?auto_3822 ) ( ON-TABLE ?auto_3824 ) ( ON ?auto_3825 ?auto_3823 ) ( CLEAR ?auto_3825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3824 ?auto_3822 ?auto_3823 )
      ( MAKE-2PILE ?auto_3822 ?auto_3823 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3829 - BLOCK
      ?auto_3830 - BLOCK
      ?auto_3831 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3831 ) ( CLEAR ?auto_3830 ) ( ON-TABLE ?auto_3829 ) ( ON ?auto_3830 ?auto_3829 ) ( not ( = ?auto_3829 ?auto_3830 ) ) ( not ( = ?auto_3829 ?auto_3831 ) ) ( not ( = ?auto_3830 ?auto_3831 ) ) )
    :subtasks
    ( ( !STACK ?auto_3831 ?auto_3830 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3832 - BLOCK
      ?auto_3833 - BLOCK
      ?auto_3834 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3833 ) ( ON-TABLE ?auto_3832 ) ( ON ?auto_3833 ?auto_3832 ) ( not ( = ?auto_3832 ?auto_3833 ) ) ( not ( = ?auto_3832 ?auto_3834 ) ) ( not ( = ?auto_3833 ?auto_3834 ) ) ( ON-TABLE ?auto_3834 ) ( CLEAR ?auto_3834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_3834 )
      ( MAKE-3PILE ?auto_3832 ?auto_3833 ?auto_3834 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3835 - BLOCK
      ?auto_3836 - BLOCK
      ?auto_3837 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3835 ) ( not ( = ?auto_3835 ?auto_3836 ) ) ( not ( = ?auto_3835 ?auto_3837 ) ) ( not ( = ?auto_3836 ?auto_3837 ) ) ( ON-TABLE ?auto_3837 ) ( CLEAR ?auto_3837 ) ( HOLDING ?auto_3836 ) ( CLEAR ?auto_3835 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3835 ?auto_3836 )
      ( MAKE-3PILE ?auto_3835 ?auto_3836 ?auto_3837 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3838 - BLOCK
      ?auto_3839 - BLOCK
      ?auto_3840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3838 ) ( not ( = ?auto_3838 ?auto_3839 ) ) ( not ( = ?auto_3838 ?auto_3840 ) ) ( not ( = ?auto_3839 ?auto_3840 ) ) ( ON-TABLE ?auto_3840 ) ( CLEAR ?auto_3838 ) ( ON ?auto_3839 ?auto_3840 ) ( CLEAR ?auto_3839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3840 )
      ( MAKE-3PILE ?auto_3838 ?auto_3839 ?auto_3840 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3841 - BLOCK
      ?auto_3842 - BLOCK
      ?auto_3843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3841 ?auto_3842 ) ) ( not ( = ?auto_3841 ?auto_3843 ) ) ( not ( = ?auto_3842 ?auto_3843 ) ) ( ON-TABLE ?auto_3843 ) ( ON ?auto_3842 ?auto_3843 ) ( CLEAR ?auto_3842 ) ( HOLDING ?auto_3841 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3841 )
      ( MAKE-3PILE ?auto_3841 ?auto_3842 ?auto_3843 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3844 - BLOCK
      ?auto_3845 - BLOCK
      ?auto_3846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3844 ?auto_3845 ) ) ( not ( = ?auto_3844 ?auto_3846 ) ) ( not ( = ?auto_3845 ?auto_3846 ) ) ( ON-TABLE ?auto_3846 ) ( ON ?auto_3845 ?auto_3846 ) ( ON ?auto_3844 ?auto_3845 ) ( CLEAR ?auto_3844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3846 ?auto_3845 )
      ( MAKE-3PILE ?auto_3844 ?auto_3845 ?auto_3846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3847 - BLOCK
      ?auto_3848 - BLOCK
      ?auto_3849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3847 ?auto_3848 ) ) ( not ( = ?auto_3847 ?auto_3849 ) ) ( not ( = ?auto_3848 ?auto_3849 ) ) ( ON-TABLE ?auto_3849 ) ( ON ?auto_3848 ?auto_3849 ) ( HOLDING ?auto_3847 ) ( CLEAR ?auto_3848 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3849 ?auto_3848 ?auto_3847 )
      ( MAKE-3PILE ?auto_3847 ?auto_3848 ?auto_3849 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3850 - BLOCK
      ?auto_3851 - BLOCK
      ?auto_3852 - BLOCK
    )
    :vars
    (
      ?auto_3853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3850 ?auto_3851 ) ) ( not ( = ?auto_3850 ?auto_3852 ) ) ( not ( = ?auto_3851 ?auto_3852 ) ) ( ON-TABLE ?auto_3852 ) ( ON ?auto_3851 ?auto_3852 ) ( CLEAR ?auto_3851 ) ( ON ?auto_3850 ?auto_3853 ) ( CLEAR ?auto_3850 ) ( HAND-EMPTY ) ( not ( = ?auto_3850 ?auto_3853 ) ) ( not ( = ?auto_3851 ?auto_3853 ) ) ( not ( = ?auto_3852 ?auto_3853 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3850 ?auto_3853 )
      ( MAKE-3PILE ?auto_3850 ?auto_3851 ?auto_3852 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3854 - BLOCK
      ?auto_3855 - BLOCK
      ?auto_3856 - BLOCK
    )
    :vars
    (
      ?auto_3857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3854 ?auto_3855 ) ) ( not ( = ?auto_3854 ?auto_3856 ) ) ( not ( = ?auto_3855 ?auto_3856 ) ) ( ON-TABLE ?auto_3856 ) ( ON ?auto_3854 ?auto_3857 ) ( CLEAR ?auto_3854 ) ( not ( = ?auto_3854 ?auto_3857 ) ) ( not ( = ?auto_3855 ?auto_3857 ) ) ( not ( = ?auto_3856 ?auto_3857 ) ) ( HOLDING ?auto_3855 ) ( CLEAR ?auto_3856 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3856 ?auto_3855 )
      ( MAKE-3PILE ?auto_3854 ?auto_3855 ?auto_3856 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3858 - BLOCK
      ?auto_3859 - BLOCK
      ?auto_3860 - BLOCK
    )
    :vars
    (
      ?auto_3861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3858 ?auto_3859 ) ) ( not ( = ?auto_3858 ?auto_3860 ) ) ( not ( = ?auto_3859 ?auto_3860 ) ) ( ON-TABLE ?auto_3860 ) ( ON ?auto_3858 ?auto_3861 ) ( not ( = ?auto_3858 ?auto_3861 ) ) ( not ( = ?auto_3859 ?auto_3861 ) ) ( not ( = ?auto_3860 ?auto_3861 ) ) ( CLEAR ?auto_3860 ) ( ON ?auto_3859 ?auto_3858 ) ( CLEAR ?auto_3859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3861 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3861 ?auto_3858 )
      ( MAKE-3PILE ?auto_3858 ?auto_3859 ?auto_3860 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3862 - BLOCK
      ?auto_3863 - BLOCK
      ?auto_3864 - BLOCK
    )
    :vars
    (
      ?auto_3865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3862 ?auto_3863 ) ) ( not ( = ?auto_3862 ?auto_3864 ) ) ( not ( = ?auto_3863 ?auto_3864 ) ) ( ON ?auto_3862 ?auto_3865 ) ( not ( = ?auto_3862 ?auto_3865 ) ) ( not ( = ?auto_3863 ?auto_3865 ) ) ( not ( = ?auto_3864 ?auto_3865 ) ) ( ON ?auto_3863 ?auto_3862 ) ( CLEAR ?auto_3863 ) ( ON-TABLE ?auto_3865 ) ( HOLDING ?auto_3864 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3864 )
      ( MAKE-3PILE ?auto_3862 ?auto_3863 ?auto_3864 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3866 - BLOCK
      ?auto_3867 - BLOCK
      ?auto_3868 - BLOCK
    )
    :vars
    (
      ?auto_3869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3866 ?auto_3867 ) ) ( not ( = ?auto_3866 ?auto_3868 ) ) ( not ( = ?auto_3867 ?auto_3868 ) ) ( ON ?auto_3866 ?auto_3869 ) ( not ( = ?auto_3866 ?auto_3869 ) ) ( not ( = ?auto_3867 ?auto_3869 ) ) ( not ( = ?auto_3868 ?auto_3869 ) ) ( ON ?auto_3867 ?auto_3866 ) ( ON-TABLE ?auto_3869 ) ( ON ?auto_3868 ?auto_3867 ) ( CLEAR ?auto_3868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3869 ?auto_3866 ?auto_3867 )
      ( MAKE-3PILE ?auto_3866 ?auto_3867 ?auto_3868 ) )
  )

)

