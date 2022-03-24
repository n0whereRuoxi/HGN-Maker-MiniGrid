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
      ?auto_3761 - BLOCK
    )
    :vars
    (
      ?auto_3762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3761 ?auto_3762 ) ( CLEAR ?auto_3761 ) ( HAND-EMPTY ) ( not ( = ?auto_3761 ?auto_3762 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3761 ?auto_3762 )
      ( !PUTDOWN ?auto_3761 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3768 - BLOCK
      ?auto_3769 - BLOCK
    )
    :vars
    (
      ?auto_3770 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3768 ) ( ON ?auto_3769 ?auto_3770 ) ( CLEAR ?auto_3769 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3768 ) ( not ( = ?auto_3768 ?auto_3769 ) ) ( not ( = ?auto_3768 ?auto_3770 ) ) ( not ( = ?auto_3769 ?auto_3770 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3769 ?auto_3770 )
      ( !STACK ?auto_3769 ?auto_3768 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3778 - BLOCK
      ?auto_3779 - BLOCK
    )
    :vars
    (
      ?auto_3780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3779 ?auto_3780 ) ( not ( = ?auto_3778 ?auto_3779 ) ) ( not ( = ?auto_3778 ?auto_3780 ) ) ( not ( = ?auto_3779 ?auto_3780 ) ) ( ON ?auto_3778 ?auto_3779 ) ( CLEAR ?auto_3778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3778 )
      ( MAKE-2PILE ?auto_3778 ?auto_3779 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3789 - BLOCK
      ?auto_3790 - BLOCK
      ?auto_3791 - BLOCK
    )
    :vars
    (
      ?auto_3792 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3790 ) ( ON ?auto_3791 ?auto_3792 ) ( CLEAR ?auto_3791 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3789 ) ( ON ?auto_3790 ?auto_3789 ) ( not ( = ?auto_3789 ?auto_3790 ) ) ( not ( = ?auto_3789 ?auto_3791 ) ) ( not ( = ?auto_3789 ?auto_3792 ) ) ( not ( = ?auto_3790 ?auto_3791 ) ) ( not ( = ?auto_3790 ?auto_3792 ) ) ( not ( = ?auto_3791 ?auto_3792 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3791 ?auto_3792 )
      ( !STACK ?auto_3791 ?auto_3790 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3803 - BLOCK
      ?auto_3804 - BLOCK
      ?auto_3805 - BLOCK
    )
    :vars
    (
      ?auto_3806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3805 ?auto_3806 ) ( ON-TABLE ?auto_3803 ) ( not ( = ?auto_3803 ?auto_3804 ) ) ( not ( = ?auto_3803 ?auto_3805 ) ) ( not ( = ?auto_3803 ?auto_3806 ) ) ( not ( = ?auto_3804 ?auto_3805 ) ) ( not ( = ?auto_3804 ?auto_3806 ) ) ( not ( = ?auto_3805 ?auto_3806 ) ) ( CLEAR ?auto_3803 ) ( ON ?auto_3804 ?auto_3805 ) ( CLEAR ?auto_3804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3803 ?auto_3804 )
      ( MAKE-3PILE ?auto_3803 ?auto_3804 ?auto_3805 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3817 - BLOCK
      ?auto_3818 - BLOCK
      ?auto_3819 - BLOCK
    )
    :vars
    (
      ?auto_3820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3819 ?auto_3820 ) ( not ( = ?auto_3817 ?auto_3818 ) ) ( not ( = ?auto_3817 ?auto_3819 ) ) ( not ( = ?auto_3817 ?auto_3820 ) ) ( not ( = ?auto_3818 ?auto_3819 ) ) ( not ( = ?auto_3818 ?auto_3820 ) ) ( not ( = ?auto_3819 ?auto_3820 ) ) ( ON ?auto_3818 ?auto_3819 ) ( ON ?auto_3817 ?auto_3818 ) ( CLEAR ?auto_3817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3817 )
      ( MAKE-3PILE ?auto_3817 ?auto_3818 ?auto_3819 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3832 - BLOCK
      ?auto_3833 - BLOCK
      ?auto_3834 - BLOCK
      ?auto_3835 - BLOCK
    )
    :vars
    (
      ?auto_3836 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3834 ) ( ON ?auto_3835 ?auto_3836 ) ( CLEAR ?auto_3835 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3832 ) ( ON ?auto_3833 ?auto_3832 ) ( ON ?auto_3834 ?auto_3833 ) ( not ( = ?auto_3832 ?auto_3833 ) ) ( not ( = ?auto_3832 ?auto_3834 ) ) ( not ( = ?auto_3832 ?auto_3835 ) ) ( not ( = ?auto_3832 ?auto_3836 ) ) ( not ( = ?auto_3833 ?auto_3834 ) ) ( not ( = ?auto_3833 ?auto_3835 ) ) ( not ( = ?auto_3833 ?auto_3836 ) ) ( not ( = ?auto_3834 ?auto_3835 ) ) ( not ( = ?auto_3834 ?auto_3836 ) ) ( not ( = ?auto_3835 ?auto_3836 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3835 ?auto_3836 )
      ( !STACK ?auto_3835 ?auto_3834 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3841 - BLOCK
      ?auto_3842 - BLOCK
      ?auto_3843 - BLOCK
      ?auto_3844 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3843 ) ( ON-TABLE ?auto_3844 ) ( CLEAR ?auto_3844 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3841 ) ( ON ?auto_3842 ?auto_3841 ) ( ON ?auto_3843 ?auto_3842 ) ( not ( = ?auto_3841 ?auto_3842 ) ) ( not ( = ?auto_3841 ?auto_3843 ) ) ( not ( = ?auto_3841 ?auto_3844 ) ) ( not ( = ?auto_3842 ?auto_3843 ) ) ( not ( = ?auto_3842 ?auto_3844 ) ) ( not ( = ?auto_3843 ?auto_3844 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_3844 )
      ( !STACK ?auto_3844 ?auto_3843 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3849 - BLOCK
      ?auto_3850 - BLOCK
      ?auto_3851 - BLOCK
      ?auto_3852 - BLOCK
    )
    :vars
    (
      ?auto_3853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3852 ?auto_3853 ) ( ON-TABLE ?auto_3849 ) ( ON ?auto_3850 ?auto_3849 ) ( not ( = ?auto_3849 ?auto_3850 ) ) ( not ( = ?auto_3849 ?auto_3851 ) ) ( not ( = ?auto_3849 ?auto_3852 ) ) ( not ( = ?auto_3849 ?auto_3853 ) ) ( not ( = ?auto_3850 ?auto_3851 ) ) ( not ( = ?auto_3850 ?auto_3852 ) ) ( not ( = ?auto_3850 ?auto_3853 ) ) ( not ( = ?auto_3851 ?auto_3852 ) ) ( not ( = ?auto_3851 ?auto_3853 ) ) ( not ( = ?auto_3852 ?auto_3853 ) ) ( CLEAR ?auto_3850 ) ( ON ?auto_3851 ?auto_3852 ) ( CLEAR ?auto_3851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3849 ?auto_3850 ?auto_3851 )
      ( MAKE-4PILE ?auto_3849 ?auto_3850 ?auto_3851 ?auto_3852 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3858 - BLOCK
      ?auto_3859 - BLOCK
      ?auto_3860 - BLOCK
      ?auto_3861 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3861 ) ( ON-TABLE ?auto_3858 ) ( ON ?auto_3859 ?auto_3858 ) ( not ( = ?auto_3858 ?auto_3859 ) ) ( not ( = ?auto_3858 ?auto_3860 ) ) ( not ( = ?auto_3858 ?auto_3861 ) ) ( not ( = ?auto_3859 ?auto_3860 ) ) ( not ( = ?auto_3859 ?auto_3861 ) ) ( not ( = ?auto_3860 ?auto_3861 ) ) ( CLEAR ?auto_3859 ) ( ON ?auto_3860 ?auto_3861 ) ( CLEAR ?auto_3860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3858 ?auto_3859 ?auto_3860 )
      ( MAKE-4PILE ?auto_3858 ?auto_3859 ?auto_3860 ?auto_3861 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3866 - BLOCK
      ?auto_3867 - BLOCK
      ?auto_3868 - BLOCK
      ?auto_3869 - BLOCK
    )
    :vars
    (
      ?auto_3870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3869 ?auto_3870 ) ( ON-TABLE ?auto_3866 ) ( not ( = ?auto_3866 ?auto_3867 ) ) ( not ( = ?auto_3866 ?auto_3868 ) ) ( not ( = ?auto_3866 ?auto_3869 ) ) ( not ( = ?auto_3866 ?auto_3870 ) ) ( not ( = ?auto_3867 ?auto_3868 ) ) ( not ( = ?auto_3867 ?auto_3869 ) ) ( not ( = ?auto_3867 ?auto_3870 ) ) ( not ( = ?auto_3868 ?auto_3869 ) ) ( not ( = ?auto_3868 ?auto_3870 ) ) ( not ( = ?auto_3869 ?auto_3870 ) ) ( ON ?auto_3868 ?auto_3869 ) ( CLEAR ?auto_3866 ) ( ON ?auto_3867 ?auto_3868 ) ( CLEAR ?auto_3867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3866 ?auto_3867 )
      ( MAKE-4PILE ?auto_3866 ?auto_3867 ?auto_3868 ?auto_3869 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3875 - BLOCK
      ?auto_3876 - BLOCK
      ?auto_3877 - BLOCK
      ?auto_3878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3878 ) ( ON-TABLE ?auto_3875 ) ( not ( = ?auto_3875 ?auto_3876 ) ) ( not ( = ?auto_3875 ?auto_3877 ) ) ( not ( = ?auto_3875 ?auto_3878 ) ) ( not ( = ?auto_3876 ?auto_3877 ) ) ( not ( = ?auto_3876 ?auto_3878 ) ) ( not ( = ?auto_3877 ?auto_3878 ) ) ( ON ?auto_3877 ?auto_3878 ) ( CLEAR ?auto_3875 ) ( ON ?auto_3876 ?auto_3877 ) ( CLEAR ?auto_3876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3875 ?auto_3876 )
      ( MAKE-4PILE ?auto_3875 ?auto_3876 ?auto_3877 ?auto_3878 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3883 - BLOCK
      ?auto_3884 - BLOCK
      ?auto_3885 - BLOCK
      ?auto_3886 - BLOCK
    )
    :vars
    (
      ?auto_3887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3886 ?auto_3887 ) ( not ( = ?auto_3883 ?auto_3884 ) ) ( not ( = ?auto_3883 ?auto_3885 ) ) ( not ( = ?auto_3883 ?auto_3886 ) ) ( not ( = ?auto_3883 ?auto_3887 ) ) ( not ( = ?auto_3884 ?auto_3885 ) ) ( not ( = ?auto_3884 ?auto_3886 ) ) ( not ( = ?auto_3884 ?auto_3887 ) ) ( not ( = ?auto_3885 ?auto_3886 ) ) ( not ( = ?auto_3885 ?auto_3887 ) ) ( not ( = ?auto_3886 ?auto_3887 ) ) ( ON ?auto_3885 ?auto_3886 ) ( ON ?auto_3884 ?auto_3885 ) ( ON ?auto_3883 ?auto_3884 ) ( CLEAR ?auto_3883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3883 )
      ( MAKE-4PILE ?auto_3883 ?auto_3884 ?auto_3885 ?auto_3886 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3892 - BLOCK
      ?auto_3893 - BLOCK
      ?auto_3894 - BLOCK
      ?auto_3895 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3895 ) ( not ( = ?auto_3892 ?auto_3893 ) ) ( not ( = ?auto_3892 ?auto_3894 ) ) ( not ( = ?auto_3892 ?auto_3895 ) ) ( not ( = ?auto_3893 ?auto_3894 ) ) ( not ( = ?auto_3893 ?auto_3895 ) ) ( not ( = ?auto_3894 ?auto_3895 ) ) ( ON ?auto_3894 ?auto_3895 ) ( ON ?auto_3893 ?auto_3894 ) ( ON ?auto_3892 ?auto_3893 ) ( CLEAR ?auto_3892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3892 )
      ( MAKE-4PILE ?auto_3892 ?auto_3893 ?auto_3894 ?auto_3895 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3900 - BLOCK
      ?auto_3901 - BLOCK
      ?auto_3902 - BLOCK
      ?auto_3903 - BLOCK
    )
    :vars
    (
      ?auto_3904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3900 ?auto_3901 ) ) ( not ( = ?auto_3900 ?auto_3902 ) ) ( not ( = ?auto_3900 ?auto_3903 ) ) ( not ( = ?auto_3901 ?auto_3902 ) ) ( not ( = ?auto_3901 ?auto_3903 ) ) ( not ( = ?auto_3902 ?auto_3903 ) ) ( ON ?auto_3900 ?auto_3904 ) ( not ( = ?auto_3903 ?auto_3904 ) ) ( not ( = ?auto_3902 ?auto_3904 ) ) ( not ( = ?auto_3901 ?auto_3904 ) ) ( not ( = ?auto_3900 ?auto_3904 ) ) ( ON ?auto_3901 ?auto_3900 ) ( ON ?auto_3902 ?auto_3901 ) ( ON ?auto_3903 ?auto_3902 ) ( CLEAR ?auto_3903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_3903 ?auto_3902 ?auto_3901 ?auto_3900 )
      ( MAKE-4PILE ?auto_3900 ?auto_3901 ?auto_3902 ?auto_3903 ) )
  )

)

