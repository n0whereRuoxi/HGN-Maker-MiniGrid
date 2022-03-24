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
      ?auto_3703 - BLOCK
      ?auto_3704 - BLOCK
      ?auto_3705 - BLOCK
    )
    :vars
    (
      ?auto_3706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3706 ?auto_3705 ) ( CLEAR ?auto_3706 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3703 ) ( ON ?auto_3704 ?auto_3703 ) ( ON ?auto_3705 ?auto_3704 ) ( not ( = ?auto_3703 ?auto_3704 ) ) ( not ( = ?auto_3703 ?auto_3705 ) ) ( not ( = ?auto_3703 ?auto_3706 ) ) ( not ( = ?auto_3704 ?auto_3705 ) ) ( not ( = ?auto_3704 ?auto_3706 ) ) ( not ( = ?auto_3705 ?auto_3706 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3706 ?auto_3705 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3708 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3708 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3708 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3709 - BLOCK
    )
    :vars
    (
      ?auto_3710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3709 ?auto_3710 ) ( CLEAR ?auto_3709 ) ( HAND-EMPTY ) ( not ( = ?auto_3709 ?auto_3710 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3709 ?auto_3710 )
      ( MAKE-1PILE ?auto_3709 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3713 - BLOCK
      ?auto_3714 - BLOCK
    )
    :vars
    (
      ?auto_3715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3715 ?auto_3714 ) ( CLEAR ?auto_3715 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3713 ) ( ON ?auto_3714 ?auto_3713 ) ( not ( = ?auto_3713 ?auto_3714 ) ) ( not ( = ?auto_3713 ?auto_3715 ) ) ( not ( = ?auto_3714 ?auto_3715 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3715 ?auto_3714 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3716 - BLOCK
      ?auto_3717 - BLOCK
    )
    :vars
    (
      ?auto_3718 - BLOCK
      ?auto_3719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3718 ?auto_3717 ) ( CLEAR ?auto_3718 ) ( ON-TABLE ?auto_3716 ) ( ON ?auto_3717 ?auto_3716 ) ( not ( = ?auto_3716 ?auto_3717 ) ) ( not ( = ?auto_3716 ?auto_3718 ) ) ( not ( = ?auto_3717 ?auto_3718 ) ) ( HOLDING ?auto_3719 ) ( not ( = ?auto_3716 ?auto_3719 ) ) ( not ( = ?auto_3717 ?auto_3719 ) ) ( not ( = ?auto_3718 ?auto_3719 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3719 )
      ( MAKE-2PILE ?auto_3716 ?auto_3717 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3720 - BLOCK
      ?auto_3721 - BLOCK
    )
    :vars
    (
      ?auto_3723 - BLOCK
      ?auto_3722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3723 ?auto_3721 ) ( ON-TABLE ?auto_3720 ) ( ON ?auto_3721 ?auto_3720 ) ( not ( = ?auto_3720 ?auto_3721 ) ) ( not ( = ?auto_3720 ?auto_3723 ) ) ( not ( = ?auto_3721 ?auto_3723 ) ) ( not ( = ?auto_3720 ?auto_3722 ) ) ( not ( = ?auto_3721 ?auto_3722 ) ) ( not ( = ?auto_3723 ?auto_3722 ) ) ( ON ?auto_3722 ?auto_3723 ) ( CLEAR ?auto_3722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3720 ?auto_3721 ?auto_3723 )
      ( MAKE-2PILE ?auto_3720 ?auto_3721 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3726 - BLOCK
      ?auto_3727 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3727 ) ( CLEAR ?auto_3726 ) ( ON-TABLE ?auto_3726 ) ( not ( = ?auto_3726 ?auto_3727 ) ) )
    :subtasks
    ( ( !STACK ?auto_3727 ?auto_3726 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3728 - BLOCK
      ?auto_3729 - BLOCK
    )
    :vars
    (
      ?auto_3730 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3728 ) ( ON-TABLE ?auto_3728 ) ( not ( = ?auto_3728 ?auto_3729 ) ) ( ON ?auto_3729 ?auto_3730 ) ( CLEAR ?auto_3729 ) ( HAND-EMPTY ) ( not ( = ?auto_3728 ?auto_3730 ) ) ( not ( = ?auto_3729 ?auto_3730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3729 ?auto_3730 )
      ( MAKE-2PILE ?auto_3728 ?auto_3729 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3731 - BLOCK
      ?auto_3732 - BLOCK
    )
    :vars
    (
      ?auto_3733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3731 ?auto_3732 ) ) ( ON ?auto_3732 ?auto_3733 ) ( CLEAR ?auto_3732 ) ( not ( = ?auto_3731 ?auto_3733 ) ) ( not ( = ?auto_3732 ?auto_3733 ) ) ( HOLDING ?auto_3731 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3731 )
      ( MAKE-2PILE ?auto_3731 ?auto_3732 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3734 - BLOCK
      ?auto_3735 - BLOCK
    )
    :vars
    (
      ?auto_3736 - BLOCK
      ?auto_3737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3734 ?auto_3735 ) ) ( ON ?auto_3735 ?auto_3736 ) ( not ( = ?auto_3734 ?auto_3736 ) ) ( not ( = ?auto_3735 ?auto_3736 ) ) ( ON ?auto_3734 ?auto_3735 ) ( CLEAR ?auto_3734 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3737 ) ( ON ?auto_3736 ?auto_3737 ) ( not ( = ?auto_3737 ?auto_3736 ) ) ( not ( = ?auto_3737 ?auto_3735 ) ) ( not ( = ?auto_3737 ?auto_3734 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3737 ?auto_3736 ?auto_3735 )
      ( MAKE-2PILE ?auto_3734 ?auto_3735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3739 - BLOCK
    )
    :vars
    (
      ?auto_3740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3740 ?auto_3739 ) ( CLEAR ?auto_3740 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3739 ) ( not ( = ?auto_3739 ?auto_3740 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3740 ?auto_3739 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3741 - BLOCK
    )
    :vars
    (
      ?auto_3742 - BLOCK
      ?auto_3743 - BLOCK
      ?auto_3744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3742 ?auto_3741 ) ( CLEAR ?auto_3742 ) ( ON-TABLE ?auto_3741 ) ( not ( = ?auto_3741 ?auto_3742 ) ) ( HOLDING ?auto_3743 ) ( CLEAR ?auto_3744 ) ( not ( = ?auto_3741 ?auto_3743 ) ) ( not ( = ?auto_3741 ?auto_3744 ) ) ( not ( = ?auto_3742 ?auto_3743 ) ) ( not ( = ?auto_3742 ?auto_3744 ) ) ( not ( = ?auto_3743 ?auto_3744 ) ) )
    :subtasks
    ( ( !STACK ?auto_3743 ?auto_3744 )
      ( MAKE-1PILE ?auto_3741 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3831 - BLOCK
    )
    :vars
    (
      ?auto_3832 - BLOCK
      ?auto_3833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3832 ?auto_3831 ) ( ON-TABLE ?auto_3831 ) ( not ( = ?auto_3831 ?auto_3832 ) ) ( not ( = ?auto_3831 ?auto_3833 ) ) ( not ( = ?auto_3832 ?auto_3833 ) ) ( ON ?auto_3833 ?auto_3832 ) ( CLEAR ?auto_3833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3831 ?auto_3832 )
      ( MAKE-1PILE ?auto_3831 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3749 - BLOCK
    )
    :vars
    (
      ?auto_3752 - BLOCK
      ?auto_3751 - BLOCK
      ?auto_3750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3752 ?auto_3749 ) ( ON-TABLE ?auto_3749 ) ( not ( = ?auto_3749 ?auto_3752 ) ) ( not ( = ?auto_3749 ?auto_3751 ) ) ( not ( = ?auto_3749 ?auto_3750 ) ) ( not ( = ?auto_3752 ?auto_3751 ) ) ( not ( = ?auto_3752 ?auto_3750 ) ) ( not ( = ?auto_3751 ?auto_3750 ) ) ( ON ?auto_3751 ?auto_3752 ) ( CLEAR ?auto_3751 ) ( HOLDING ?auto_3750 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3750 )
      ( MAKE-1PILE ?auto_3749 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3753 - BLOCK
    )
    :vars
    (
      ?auto_3755 - BLOCK
      ?auto_3754 - BLOCK
      ?auto_3756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3755 ?auto_3753 ) ( ON-TABLE ?auto_3753 ) ( not ( = ?auto_3753 ?auto_3755 ) ) ( not ( = ?auto_3753 ?auto_3754 ) ) ( not ( = ?auto_3753 ?auto_3756 ) ) ( not ( = ?auto_3755 ?auto_3754 ) ) ( not ( = ?auto_3755 ?auto_3756 ) ) ( not ( = ?auto_3754 ?auto_3756 ) ) ( ON ?auto_3754 ?auto_3755 ) ( ON ?auto_3756 ?auto_3754 ) ( CLEAR ?auto_3756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3753 ?auto_3755 ?auto_3754 )
      ( MAKE-1PILE ?auto_3753 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3760 - BLOCK
      ?auto_3761 - BLOCK
      ?auto_3762 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3762 ) ( CLEAR ?auto_3761 ) ( ON-TABLE ?auto_3760 ) ( ON ?auto_3761 ?auto_3760 ) ( not ( = ?auto_3760 ?auto_3761 ) ) ( not ( = ?auto_3760 ?auto_3762 ) ) ( not ( = ?auto_3761 ?auto_3762 ) ) )
    :subtasks
    ( ( !STACK ?auto_3762 ?auto_3761 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3763 - BLOCK
      ?auto_3764 - BLOCK
      ?auto_3765 - BLOCK
    )
    :vars
    (
      ?auto_3766 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3764 ) ( ON-TABLE ?auto_3763 ) ( ON ?auto_3764 ?auto_3763 ) ( not ( = ?auto_3763 ?auto_3764 ) ) ( not ( = ?auto_3763 ?auto_3765 ) ) ( not ( = ?auto_3764 ?auto_3765 ) ) ( ON ?auto_3765 ?auto_3766 ) ( CLEAR ?auto_3765 ) ( HAND-EMPTY ) ( not ( = ?auto_3763 ?auto_3766 ) ) ( not ( = ?auto_3764 ?auto_3766 ) ) ( not ( = ?auto_3765 ?auto_3766 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3765 ?auto_3766 )
      ( MAKE-3PILE ?auto_3763 ?auto_3764 ?auto_3765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3767 - BLOCK
      ?auto_3768 - BLOCK
      ?auto_3769 - BLOCK
    )
    :vars
    (
      ?auto_3770 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3767 ) ( not ( = ?auto_3767 ?auto_3768 ) ) ( not ( = ?auto_3767 ?auto_3769 ) ) ( not ( = ?auto_3768 ?auto_3769 ) ) ( ON ?auto_3769 ?auto_3770 ) ( CLEAR ?auto_3769 ) ( not ( = ?auto_3767 ?auto_3770 ) ) ( not ( = ?auto_3768 ?auto_3770 ) ) ( not ( = ?auto_3769 ?auto_3770 ) ) ( HOLDING ?auto_3768 ) ( CLEAR ?auto_3767 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3767 ?auto_3768 )
      ( MAKE-3PILE ?auto_3767 ?auto_3768 ?auto_3769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3771 - BLOCK
      ?auto_3772 - BLOCK
      ?auto_3773 - BLOCK
    )
    :vars
    (
      ?auto_3774 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3771 ) ( not ( = ?auto_3771 ?auto_3772 ) ) ( not ( = ?auto_3771 ?auto_3773 ) ) ( not ( = ?auto_3772 ?auto_3773 ) ) ( ON ?auto_3773 ?auto_3774 ) ( not ( = ?auto_3771 ?auto_3774 ) ) ( not ( = ?auto_3772 ?auto_3774 ) ) ( not ( = ?auto_3773 ?auto_3774 ) ) ( CLEAR ?auto_3771 ) ( ON ?auto_3772 ?auto_3773 ) ( CLEAR ?auto_3772 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3774 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3774 ?auto_3773 )
      ( MAKE-3PILE ?auto_3771 ?auto_3772 ?auto_3773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3775 - BLOCK
      ?auto_3776 - BLOCK
      ?auto_3777 - BLOCK
    )
    :vars
    (
      ?auto_3778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3775 ?auto_3776 ) ) ( not ( = ?auto_3775 ?auto_3777 ) ) ( not ( = ?auto_3776 ?auto_3777 ) ) ( ON ?auto_3777 ?auto_3778 ) ( not ( = ?auto_3775 ?auto_3778 ) ) ( not ( = ?auto_3776 ?auto_3778 ) ) ( not ( = ?auto_3777 ?auto_3778 ) ) ( ON ?auto_3776 ?auto_3777 ) ( CLEAR ?auto_3776 ) ( ON-TABLE ?auto_3778 ) ( HOLDING ?auto_3775 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3775 )
      ( MAKE-3PILE ?auto_3775 ?auto_3776 ?auto_3777 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3779 - BLOCK
      ?auto_3780 - BLOCK
      ?auto_3781 - BLOCK
    )
    :vars
    (
      ?auto_3782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3779 ?auto_3780 ) ) ( not ( = ?auto_3779 ?auto_3781 ) ) ( not ( = ?auto_3780 ?auto_3781 ) ) ( ON ?auto_3781 ?auto_3782 ) ( not ( = ?auto_3779 ?auto_3782 ) ) ( not ( = ?auto_3780 ?auto_3782 ) ) ( not ( = ?auto_3781 ?auto_3782 ) ) ( ON ?auto_3780 ?auto_3781 ) ( ON-TABLE ?auto_3782 ) ( ON ?auto_3779 ?auto_3780 ) ( CLEAR ?auto_3779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3782 ?auto_3781 ?auto_3780 )
      ( MAKE-3PILE ?auto_3779 ?auto_3780 ?auto_3781 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3809 - BLOCK
    )
    :vars
    (
      ?auto_3810 - BLOCK
      ?auto_3811 - BLOCK
      ?auto_3812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3809 ?auto_3810 ) ( CLEAR ?auto_3809 ) ( not ( = ?auto_3809 ?auto_3810 ) ) ( HOLDING ?auto_3811 ) ( CLEAR ?auto_3812 ) ( not ( = ?auto_3809 ?auto_3811 ) ) ( not ( = ?auto_3809 ?auto_3812 ) ) ( not ( = ?auto_3810 ?auto_3811 ) ) ( not ( = ?auto_3810 ?auto_3812 ) ) ( not ( = ?auto_3811 ?auto_3812 ) ) )
    :subtasks
    ( ( !STACK ?auto_3811 ?auto_3812 )
      ( MAKE-1PILE ?auto_3809 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3813 - BLOCK
    )
    :vars
    (
      ?auto_3816 - BLOCK
      ?auto_3815 - BLOCK
      ?auto_3814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3813 ?auto_3816 ) ( not ( = ?auto_3813 ?auto_3816 ) ) ( CLEAR ?auto_3815 ) ( not ( = ?auto_3813 ?auto_3814 ) ) ( not ( = ?auto_3813 ?auto_3815 ) ) ( not ( = ?auto_3816 ?auto_3814 ) ) ( not ( = ?auto_3816 ?auto_3815 ) ) ( not ( = ?auto_3814 ?auto_3815 ) ) ( ON ?auto_3814 ?auto_3813 ) ( CLEAR ?auto_3814 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3816 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3816 ?auto_3813 )
      ( MAKE-1PILE ?auto_3813 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3817 - BLOCK
    )
    :vars
    (
      ?auto_3819 - BLOCK
      ?auto_3818 - BLOCK
      ?auto_3820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3817 ?auto_3819 ) ( not ( = ?auto_3817 ?auto_3819 ) ) ( not ( = ?auto_3817 ?auto_3818 ) ) ( not ( = ?auto_3817 ?auto_3820 ) ) ( not ( = ?auto_3819 ?auto_3818 ) ) ( not ( = ?auto_3819 ?auto_3820 ) ) ( not ( = ?auto_3818 ?auto_3820 ) ) ( ON ?auto_3818 ?auto_3817 ) ( CLEAR ?auto_3818 ) ( ON-TABLE ?auto_3819 ) ( HOLDING ?auto_3820 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3820 )
      ( MAKE-1PILE ?auto_3817 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3821 - BLOCK
    )
    :vars
    (
      ?auto_3824 - BLOCK
      ?auto_3822 - BLOCK
      ?auto_3823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3821 ?auto_3824 ) ( not ( = ?auto_3821 ?auto_3824 ) ) ( not ( = ?auto_3821 ?auto_3822 ) ) ( not ( = ?auto_3821 ?auto_3823 ) ) ( not ( = ?auto_3824 ?auto_3822 ) ) ( not ( = ?auto_3824 ?auto_3823 ) ) ( not ( = ?auto_3822 ?auto_3823 ) ) ( ON ?auto_3822 ?auto_3821 ) ( ON-TABLE ?auto_3824 ) ( ON ?auto_3823 ?auto_3822 ) ( CLEAR ?auto_3823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3824 ?auto_3821 ?auto_3822 )
      ( MAKE-1PILE ?auto_3821 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3828 - BLOCK
    )
    :vars
    (
      ?auto_3829 - BLOCK
      ?auto_3830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3829 ?auto_3828 ) ( CLEAR ?auto_3829 ) ( ON-TABLE ?auto_3828 ) ( not ( = ?auto_3828 ?auto_3829 ) ) ( HOLDING ?auto_3830 ) ( not ( = ?auto_3828 ?auto_3830 ) ) ( not ( = ?auto_3829 ?auto_3830 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3830 )
      ( MAKE-1PILE ?auto_3828 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3853 - BLOCK
      ?auto_3854 - BLOCK
    )
    :vars
    (
      ?auto_3855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3853 ?auto_3854 ) ) ( ON ?auto_3854 ?auto_3855 ) ( not ( = ?auto_3853 ?auto_3855 ) ) ( not ( = ?auto_3854 ?auto_3855 ) ) ( ON ?auto_3853 ?auto_3854 ) ( CLEAR ?auto_3853 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3855 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3855 ?auto_3854 )
      ( MAKE-2PILE ?auto_3853 ?auto_3854 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3858 - BLOCK
      ?auto_3859 - BLOCK
    )
    :vars
    (
      ?auto_3860 - BLOCK
      ?auto_3861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3858 ?auto_3859 ) ) ( ON ?auto_3859 ?auto_3860 ) ( CLEAR ?auto_3859 ) ( not ( = ?auto_3858 ?auto_3860 ) ) ( not ( = ?auto_3859 ?auto_3860 ) ) ( ON ?auto_3858 ?auto_3861 ) ( CLEAR ?auto_3858 ) ( HAND-EMPTY ) ( not ( = ?auto_3858 ?auto_3861 ) ) ( not ( = ?auto_3859 ?auto_3861 ) ) ( not ( = ?auto_3860 ?auto_3861 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3858 ?auto_3861 )
      ( MAKE-2PILE ?auto_3858 ?auto_3859 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3862 - BLOCK
      ?auto_3863 - BLOCK
    )
    :vars
    (
      ?auto_3865 - BLOCK
      ?auto_3864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3862 ?auto_3863 ) ) ( not ( = ?auto_3862 ?auto_3865 ) ) ( not ( = ?auto_3863 ?auto_3865 ) ) ( ON ?auto_3862 ?auto_3864 ) ( CLEAR ?auto_3862 ) ( not ( = ?auto_3862 ?auto_3864 ) ) ( not ( = ?auto_3863 ?auto_3864 ) ) ( not ( = ?auto_3865 ?auto_3864 ) ) ( HOLDING ?auto_3863 ) ( CLEAR ?auto_3865 ) ( ON-TABLE ?auto_3865 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3865 ?auto_3863 )
      ( MAKE-2PILE ?auto_3862 ?auto_3863 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3866 - BLOCK
      ?auto_3867 - BLOCK
    )
    :vars
    (
      ?auto_3868 - BLOCK
      ?auto_3869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3866 ?auto_3867 ) ) ( not ( = ?auto_3866 ?auto_3868 ) ) ( not ( = ?auto_3867 ?auto_3868 ) ) ( ON ?auto_3866 ?auto_3869 ) ( not ( = ?auto_3866 ?auto_3869 ) ) ( not ( = ?auto_3867 ?auto_3869 ) ) ( not ( = ?auto_3868 ?auto_3869 ) ) ( CLEAR ?auto_3868 ) ( ON-TABLE ?auto_3868 ) ( ON ?auto_3867 ?auto_3866 ) ( CLEAR ?auto_3867 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3869 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3869 ?auto_3866 )
      ( MAKE-2PILE ?auto_3866 ?auto_3867 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3870 - BLOCK
      ?auto_3871 - BLOCK
    )
    :vars
    (
      ?auto_3873 - BLOCK
      ?auto_3872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3870 ?auto_3871 ) ) ( not ( = ?auto_3870 ?auto_3873 ) ) ( not ( = ?auto_3871 ?auto_3873 ) ) ( ON ?auto_3870 ?auto_3872 ) ( not ( = ?auto_3870 ?auto_3872 ) ) ( not ( = ?auto_3871 ?auto_3872 ) ) ( not ( = ?auto_3873 ?auto_3872 ) ) ( ON ?auto_3871 ?auto_3870 ) ( CLEAR ?auto_3871 ) ( ON-TABLE ?auto_3872 ) ( HOLDING ?auto_3873 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3873 )
      ( MAKE-2PILE ?auto_3870 ?auto_3871 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3874 - BLOCK
      ?auto_3875 - BLOCK
    )
    :vars
    (
      ?auto_3877 - BLOCK
      ?auto_3876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3874 ?auto_3875 ) ) ( not ( = ?auto_3874 ?auto_3877 ) ) ( not ( = ?auto_3875 ?auto_3877 ) ) ( ON ?auto_3874 ?auto_3876 ) ( not ( = ?auto_3874 ?auto_3876 ) ) ( not ( = ?auto_3875 ?auto_3876 ) ) ( not ( = ?auto_3877 ?auto_3876 ) ) ( ON ?auto_3875 ?auto_3874 ) ( ON-TABLE ?auto_3876 ) ( ON ?auto_3877 ?auto_3875 ) ( CLEAR ?auto_3877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3876 ?auto_3874 ?auto_3875 )
      ( MAKE-2PILE ?auto_3874 ?auto_3875 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3884 - BLOCK
      ?auto_3885 - BLOCK
      ?auto_3886 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3885 ) ( ON-TABLE ?auto_3884 ) ( ON ?auto_3885 ?auto_3884 ) ( not ( = ?auto_3884 ?auto_3885 ) ) ( not ( = ?auto_3884 ?auto_3886 ) ) ( not ( = ?auto_3885 ?auto_3886 ) ) ( ON-TABLE ?auto_3886 ) ( CLEAR ?auto_3886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_3886 )
      ( MAKE-3PILE ?auto_3884 ?auto_3885 ?auto_3886 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3887 - BLOCK
      ?auto_3888 - BLOCK
      ?auto_3889 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3887 ) ( not ( = ?auto_3887 ?auto_3888 ) ) ( not ( = ?auto_3887 ?auto_3889 ) ) ( not ( = ?auto_3888 ?auto_3889 ) ) ( ON-TABLE ?auto_3889 ) ( CLEAR ?auto_3889 ) ( HOLDING ?auto_3888 ) ( CLEAR ?auto_3887 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3887 ?auto_3888 )
      ( MAKE-3PILE ?auto_3887 ?auto_3888 ?auto_3889 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3890 - BLOCK
      ?auto_3891 - BLOCK
      ?auto_3892 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3890 ) ( not ( = ?auto_3890 ?auto_3891 ) ) ( not ( = ?auto_3890 ?auto_3892 ) ) ( not ( = ?auto_3891 ?auto_3892 ) ) ( ON-TABLE ?auto_3892 ) ( CLEAR ?auto_3890 ) ( ON ?auto_3891 ?auto_3892 ) ( CLEAR ?auto_3891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3892 )
      ( MAKE-3PILE ?auto_3890 ?auto_3891 ?auto_3892 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3893 - BLOCK
      ?auto_3894 - BLOCK
      ?auto_3895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3893 ?auto_3894 ) ) ( not ( = ?auto_3893 ?auto_3895 ) ) ( not ( = ?auto_3894 ?auto_3895 ) ) ( ON-TABLE ?auto_3895 ) ( ON ?auto_3894 ?auto_3895 ) ( CLEAR ?auto_3894 ) ( HOLDING ?auto_3893 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3893 )
      ( MAKE-3PILE ?auto_3893 ?auto_3894 ?auto_3895 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3896 - BLOCK
      ?auto_3897 - BLOCK
      ?auto_3898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3896 ?auto_3897 ) ) ( not ( = ?auto_3896 ?auto_3898 ) ) ( not ( = ?auto_3897 ?auto_3898 ) ) ( ON-TABLE ?auto_3898 ) ( ON ?auto_3897 ?auto_3898 ) ( ON ?auto_3896 ?auto_3897 ) ( CLEAR ?auto_3896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3898 ?auto_3897 )
      ( MAKE-3PILE ?auto_3896 ?auto_3897 ?auto_3898 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3902 - BLOCK
      ?auto_3903 - BLOCK
      ?auto_3904 - BLOCK
    )
    :vars
    (
      ?auto_3905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3902 ?auto_3903 ) ) ( not ( = ?auto_3902 ?auto_3904 ) ) ( not ( = ?auto_3903 ?auto_3904 ) ) ( ON-TABLE ?auto_3904 ) ( ON ?auto_3903 ?auto_3904 ) ( CLEAR ?auto_3903 ) ( ON ?auto_3902 ?auto_3905 ) ( CLEAR ?auto_3902 ) ( HAND-EMPTY ) ( not ( = ?auto_3902 ?auto_3905 ) ) ( not ( = ?auto_3903 ?auto_3905 ) ) ( not ( = ?auto_3904 ?auto_3905 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3902 ?auto_3905 )
      ( MAKE-3PILE ?auto_3902 ?auto_3903 ?auto_3904 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3906 - BLOCK
      ?auto_3907 - BLOCK
      ?auto_3908 - BLOCK
    )
    :vars
    (
      ?auto_3909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3906 ?auto_3907 ) ) ( not ( = ?auto_3906 ?auto_3908 ) ) ( not ( = ?auto_3907 ?auto_3908 ) ) ( ON-TABLE ?auto_3908 ) ( ON ?auto_3906 ?auto_3909 ) ( CLEAR ?auto_3906 ) ( not ( = ?auto_3906 ?auto_3909 ) ) ( not ( = ?auto_3907 ?auto_3909 ) ) ( not ( = ?auto_3908 ?auto_3909 ) ) ( HOLDING ?auto_3907 ) ( CLEAR ?auto_3908 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3908 ?auto_3907 )
      ( MAKE-3PILE ?auto_3906 ?auto_3907 ?auto_3908 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3910 - BLOCK
      ?auto_3911 - BLOCK
      ?auto_3912 - BLOCK
    )
    :vars
    (
      ?auto_3913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3910 ?auto_3911 ) ) ( not ( = ?auto_3910 ?auto_3912 ) ) ( not ( = ?auto_3911 ?auto_3912 ) ) ( ON-TABLE ?auto_3912 ) ( ON ?auto_3910 ?auto_3913 ) ( not ( = ?auto_3910 ?auto_3913 ) ) ( not ( = ?auto_3911 ?auto_3913 ) ) ( not ( = ?auto_3912 ?auto_3913 ) ) ( CLEAR ?auto_3912 ) ( ON ?auto_3911 ?auto_3910 ) ( CLEAR ?auto_3911 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3913 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3913 ?auto_3910 )
      ( MAKE-3PILE ?auto_3910 ?auto_3911 ?auto_3912 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3914 - BLOCK
      ?auto_3915 - BLOCK
      ?auto_3916 - BLOCK
    )
    :vars
    (
      ?auto_3917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3914 ?auto_3915 ) ) ( not ( = ?auto_3914 ?auto_3916 ) ) ( not ( = ?auto_3915 ?auto_3916 ) ) ( ON ?auto_3914 ?auto_3917 ) ( not ( = ?auto_3914 ?auto_3917 ) ) ( not ( = ?auto_3915 ?auto_3917 ) ) ( not ( = ?auto_3916 ?auto_3917 ) ) ( ON ?auto_3915 ?auto_3914 ) ( CLEAR ?auto_3915 ) ( ON-TABLE ?auto_3917 ) ( HOLDING ?auto_3916 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3916 )
      ( MAKE-3PILE ?auto_3914 ?auto_3915 ?auto_3916 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3918 - BLOCK
      ?auto_3919 - BLOCK
      ?auto_3920 - BLOCK
    )
    :vars
    (
      ?auto_3921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3918 ?auto_3919 ) ) ( not ( = ?auto_3918 ?auto_3920 ) ) ( not ( = ?auto_3919 ?auto_3920 ) ) ( ON ?auto_3918 ?auto_3921 ) ( not ( = ?auto_3918 ?auto_3921 ) ) ( not ( = ?auto_3919 ?auto_3921 ) ) ( not ( = ?auto_3920 ?auto_3921 ) ) ( ON ?auto_3919 ?auto_3918 ) ( ON-TABLE ?auto_3921 ) ( ON ?auto_3920 ?auto_3919 ) ( CLEAR ?auto_3920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3921 ?auto_3918 ?auto_3919 )
      ( MAKE-3PILE ?auto_3918 ?auto_3919 ?auto_3920 ) )
  )

)

