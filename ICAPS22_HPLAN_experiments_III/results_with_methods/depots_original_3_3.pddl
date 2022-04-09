( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3727 - SURFACE
      ?auto_3728 - SURFACE
    )
    :vars
    (
      ?auto_3729 - HOIST
      ?auto_3730 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3729 ?auto_3730 ) ( SURFACE-AT ?auto_3727 ?auto_3730 ) ( CLEAR ?auto_3727 ) ( LIFTING ?auto_3729 ?auto_3728 ) ( IS-CRATE ?auto_3728 ) ( not ( = ?auto_3727 ?auto_3728 ) ) )
    :subtasks
    ( ( !DROP ?auto_3729 ?auto_3728 ?auto_3727 ?auto_3730 )
      ( MAKE-1CRATE-VERIFY ?auto_3727 ?auto_3728 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3731 - SURFACE
      ?auto_3732 - SURFACE
    )
    :vars
    (
      ?auto_3734 - HOIST
      ?auto_3733 - PLACE
      ?auto_3735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3734 ?auto_3733 ) ( SURFACE-AT ?auto_3731 ?auto_3733 ) ( CLEAR ?auto_3731 ) ( IS-CRATE ?auto_3732 ) ( not ( = ?auto_3731 ?auto_3732 ) ) ( TRUCK-AT ?auto_3735 ?auto_3733 ) ( AVAILABLE ?auto_3734 ) ( IN ?auto_3732 ?auto_3735 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3734 ?auto_3732 ?auto_3735 ?auto_3733 )
      ( MAKE-1CRATE ?auto_3731 ?auto_3732 )
      ( MAKE-1CRATE-VERIFY ?auto_3731 ?auto_3732 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3736 - SURFACE
      ?auto_3737 - SURFACE
    )
    :vars
    (
      ?auto_3739 - HOIST
      ?auto_3738 - PLACE
      ?auto_3740 - TRUCK
      ?auto_3741 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3739 ?auto_3738 ) ( SURFACE-AT ?auto_3736 ?auto_3738 ) ( CLEAR ?auto_3736 ) ( IS-CRATE ?auto_3737 ) ( not ( = ?auto_3736 ?auto_3737 ) ) ( AVAILABLE ?auto_3739 ) ( IN ?auto_3737 ?auto_3740 ) ( TRUCK-AT ?auto_3740 ?auto_3741 ) ( not ( = ?auto_3741 ?auto_3738 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3740 ?auto_3741 ?auto_3738 )
      ( MAKE-1CRATE ?auto_3736 ?auto_3737 )
      ( MAKE-1CRATE-VERIFY ?auto_3736 ?auto_3737 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3742 - SURFACE
      ?auto_3743 - SURFACE
    )
    :vars
    (
      ?auto_3746 - HOIST
      ?auto_3747 - PLACE
      ?auto_3745 - TRUCK
      ?auto_3744 - PLACE
      ?auto_3748 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3746 ?auto_3747 ) ( SURFACE-AT ?auto_3742 ?auto_3747 ) ( CLEAR ?auto_3742 ) ( IS-CRATE ?auto_3743 ) ( not ( = ?auto_3742 ?auto_3743 ) ) ( AVAILABLE ?auto_3746 ) ( TRUCK-AT ?auto_3745 ?auto_3744 ) ( not ( = ?auto_3744 ?auto_3747 ) ) ( HOIST-AT ?auto_3748 ?auto_3744 ) ( LIFTING ?auto_3748 ?auto_3743 ) ( not ( = ?auto_3746 ?auto_3748 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3748 ?auto_3743 ?auto_3745 ?auto_3744 )
      ( MAKE-1CRATE ?auto_3742 ?auto_3743 )
      ( MAKE-1CRATE-VERIFY ?auto_3742 ?auto_3743 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3749 - SURFACE
      ?auto_3750 - SURFACE
    )
    :vars
    (
      ?auto_3751 - HOIST
      ?auto_3753 - PLACE
      ?auto_3752 - TRUCK
      ?auto_3754 - PLACE
      ?auto_3755 - HOIST
      ?auto_3756 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3751 ?auto_3753 ) ( SURFACE-AT ?auto_3749 ?auto_3753 ) ( CLEAR ?auto_3749 ) ( IS-CRATE ?auto_3750 ) ( not ( = ?auto_3749 ?auto_3750 ) ) ( AVAILABLE ?auto_3751 ) ( TRUCK-AT ?auto_3752 ?auto_3754 ) ( not ( = ?auto_3754 ?auto_3753 ) ) ( HOIST-AT ?auto_3755 ?auto_3754 ) ( not ( = ?auto_3751 ?auto_3755 ) ) ( AVAILABLE ?auto_3755 ) ( SURFACE-AT ?auto_3750 ?auto_3754 ) ( ON ?auto_3750 ?auto_3756 ) ( CLEAR ?auto_3750 ) ( not ( = ?auto_3749 ?auto_3756 ) ) ( not ( = ?auto_3750 ?auto_3756 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3755 ?auto_3750 ?auto_3756 ?auto_3754 )
      ( MAKE-1CRATE ?auto_3749 ?auto_3750 )
      ( MAKE-1CRATE-VERIFY ?auto_3749 ?auto_3750 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3757 - SURFACE
      ?auto_3758 - SURFACE
    )
    :vars
    (
      ?auto_3763 - HOIST
      ?auto_3760 - PLACE
      ?auto_3761 - PLACE
      ?auto_3759 - HOIST
      ?auto_3762 - SURFACE
      ?auto_3764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3763 ?auto_3760 ) ( SURFACE-AT ?auto_3757 ?auto_3760 ) ( CLEAR ?auto_3757 ) ( IS-CRATE ?auto_3758 ) ( not ( = ?auto_3757 ?auto_3758 ) ) ( AVAILABLE ?auto_3763 ) ( not ( = ?auto_3761 ?auto_3760 ) ) ( HOIST-AT ?auto_3759 ?auto_3761 ) ( not ( = ?auto_3763 ?auto_3759 ) ) ( AVAILABLE ?auto_3759 ) ( SURFACE-AT ?auto_3758 ?auto_3761 ) ( ON ?auto_3758 ?auto_3762 ) ( CLEAR ?auto_3758 ) ( not ( = ?auto_3757 ?auto_3762 ) ) ( not ( = ?auto_3758 ?auto_3762 ) ) ( TRUCK-AT ?auto_3764 ?auto_3760 ) )
    :subtasks
    ( ( !DRIVE ?auto_3764 ?auto_3760 ?auto_3761 )
      ( MAKE-1CRATE ?auto_3757 ?auto_3758 )
      ( MAKE-1CRATE-VERIFY ?auto_3757 ?auto_3758 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3770 - SURFACE
      ?auto_3771 - SURFACE
    )
    :vars
    (
      ?auto_3772 - HOIST
      ?auto_3773 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3772 ?auto_3773 ) ( SURFACE-AT ?auto_3770 ?auto_3773 ) ( CLEAR ?auto_3770 ) ( LIFTING ?auto_3772 ?auto_3771 ) ( IS-CRATE ?auto_3771 ) ( not ( = ?auto_3770 ?auto_3771 ) ) )
    :subtasks
    ( ( !DROP ?auto_3772 ?auto_3771 ?auto_3770 ?auto_3773 )
      ( MAKE-1CRATE-VERIFY ?auto_3770 ?auto_3771 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3774 - SURFACE
      ?auto_3775 - SURFACE
      ?auto_3776 - SURFACE
    )
    :vars
    (
      ?auto_3778 - HOIST
      ?auto_3777 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3778 ?auto_3777 ) ( SURFACE-AT ?auto_3775 ?auto_3777 ) ( CLEAR ?auto_3775 ) ( LIFTING ?auto_3778 ?auto_3776 ) ( IS-CRATE ?auto_3776 ) ( not ( = ?auto_3775 ?auto_3776 ) ) ( ON ?auto_3775 ?auto_3774 ) ( not ( = ?auto_3774 ?auto_3775 ) ) ( not ( = ?auto_3774 ?auto_3776 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3775 ?auto_3776 )
      ( MAKE-2CRATE-VERIFY ?auto_3774 ?auto_3775 ?auto_3776 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3779 - SURFACE
      ?auto_3780 - SURFACE
    )
    :vars
    (
      ?auto_3782 - HOIST
      ?auto_3781 - PLACE
      ?auto_3783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3782 ?auto_3781 ) ( SURFACE-AT ?auto_3779 ?auto_3781 ) ( CLEAR ?auto_3779 ) ( IS-CRATE ?auto_3780 ) ( not ( = ?auto_3779 ?auto_3780 ) ) ( TRUCK-AT ?auto_3783 ?auto_3781 ) ( AVAILABLE ?auto_3782 ) ( IN ?auto_3780 ?auto_3783 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3782 ?auto_3780 ?auto_3783 ?auto_3781 )
      ( MAKE-1CRATE ?auto_3779 ?auto_3780 )
      ( MAKE-1CRATE-VERIFY ?auto_3779 ?auto_3780 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3784 - SURFACE
      ?auto_3785 - SURFACE
      ?auto_3786 - SURFACE
    )
    :vars
    (
      ?auto_3787 - HOIST
      ?auto_3789 - PLACE
      ?auto_3788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3787 ?auto_3789 ) ( SURFACE-AT ?auto_3785 ?auto_3789 ) ( CLEAR ?auto_3785 ) ( IS-CRATE ?auto_3786 ) ( not ( = ?auto_3785 ?auto_3786 ) ) ( TRUCK-AT ?auto_3788 ?auto_3789 ) ( AVAILABLE ?auto_3787 ) ( IN ?auto_3786 ?auto_3788 ) ( ON ?auto_3785 ?auto_3784 ) ( not ( = ?auto_3784 ?auto_3785 ) ) ( not ( = ?auto_3784 ?auto_3786 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3785 ?auto_3786 )
      ( MAKE-2CRATE-VERIFY ?auto_3784 ?auto_3785 ?auto_3786 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3790 - SURFACE
      ?auto_3791 - SURFACE
    )
    :vars
    (
      ?auto_3792 - HOIST
      ?auto_3794 - PLACE
      ?auto_3793 - TRUCK
      ?auto_3795 - SURFACE
      ?auto_3796 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3792 ?auto_3794 ) ( SURFACE-AT ?auto_3790 ?auto_3794 ) ( CLEAR ?auto_3790 ) ( IS-CRATE ?auto_3791 ) ( not ( = ?auto_3790 ?auto_3791 ) ) ( AVAILABLE ?auto_3792 ) ( IN ?auto_3791 ?auto_3793 ) ( ON ?auto_3790 ?auto_3795 ) ( not ( = ?auto_3795 ?auto_3790 ) ) ( not ( = ?auto_3795 ?auto_3791 ) ) ( TRUCK-AT ?auto_3793 ?auto_3796 ) ( not ( = ?auto_3796 ?auto_3794 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3793 ?auto_3796 ?auto_3794 )
      ( MAKE-2CRATE ?auto_3795 ?auto_3790 ?auto_3791 )
      ( MAKE-1CRATE-VERIFY ?auto_3790 ?auto_3791 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3797 - SURFACE
      ?auto_3798 - SURFACE
      ?auto_3799 - SURFACE
    )
    :vars
    (
      ?auto_3803 - HOIST
      ?auto_3801 - PLACE
      ?auto_3802 - TRUCK
      ?auto_3800 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3803 ?auto_3801 ) ( SURFACE-AT ?auto_3798 ?auto_3801 ) ( CLEAR ?auto_3798 ) ( IS-CRATE ?auto_3799 ) ( not ( = ?auto_3798 ?auto_3799 ) ) ( AVAILABLE ?auto_3803 ) ( IN ?auto_3799 ?auto_3802 ) ( ON ?auto_3798 ?auto_3797 ) ( not ( = ?auto_3797 ?auto_3798 ) ) ( not ( = ?auto_3797 ?auto_3799 ) ) ( TRUCK-AT ?auto_3802 ?auto_3800 ) ( not ( = ?auto_3800 ?auto_3801 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3798 ?auto_3799 )
      ( MAKE-2CRATE-VERIFY ?auto_3797 ?auto_3798 ?auto_3799 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3804 - SURFACE
      ?auto_3805 - SURFACE
    )
    :vars
    (
      ?auto_3807 - HOIST
      ?auto_3810 - PLACE
      ?auto_3808 - SURFACE
      ?auto_3806 - TRUCK
      ?auto_3809 - PLACE
      ?auto_3811 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3807 ?auto_3810 ) ( SURFACE-AT ?auto_3804 ?auto_3810 ) ( CLEAR ?auto_3804 ) ( IS-CRATE ?auto_3805 ) ( not ( = ?auto_3804 ?auto_3805 ) ) ( AVAILABLE ?auto_3807 ) ( ON ?auto_3804 ?auto_3808 ) ( not ( = ?auto_3808 ?auto_3804 ) ) ( not ( = ?auto_3808 ?auto_3805 ) ) ( TRUCK-AT ?auto_3806 ?auto_3809 ) ( not ( = ?auto_3809 ?auto_3810 ) ) ( HOIST-AT ?auto_3811 ?auto_3809 ) ( LIFTING ?auto_3811 ?auto_3805 ) ( not ( = ?auto_3807 ?auto_3811 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3811 ?auto_3805 ?auto_3806 ?auto_3809 )
      ( MAKE-2CRATE ?auto_3808 ?auto_3804 ?auto_3805 )
      ( MAKE-1CRATE-VERIFY ?auto_3804 ?auto_3805 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3812 - SURFACE
      ?auto_3813 - SURFACE
      ?auto_3814 - SURFACE
    )
    :vars
    (
      ?auto_3819 - HOIST
      ?auto_3818 - PLACE
      ?auto_3816 - TRUCK
      ?auto_3817 - PLACE
      ?auto_3815 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3819 ?auto_3818 ) ( SURFACE-AT ?auto_3813 ?auto_3818 ) ( CLEAR ?auto_3813 ) ( IS-CRATE ?auto_3814 ) ( not ( = ?auto_3813 ?auto_3814 ) ) ( AVAILABLE ?auto_3819 ) ( ON ?auto_3813 ?auto_3812 ) ( not ( = ?auto_3812 ?auto_3813 ) ) ( not ( = ?auto_3812 ?auto_3814 ) ) ( TRUCK-AT ?auto_3816 ?auto_3817 ) ( not ( = ?auto_3817 ?auto_3818 ) ) ( HOIST-AT ?auto_3815 ?auto_3817 ) ( LIFTING ?auto_3815 ?auto_3814 ) ( not ( = ?auto_3819 ?auto_3815 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3813 ?auto_3814 )
      ( MAKE-2CRATE-VERIFY ?auto_3812 ?auto_3813 ?auto_3814 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3820 - SURFACE
      ?auto_3821 - SURFACE
    )
    :vars
    (
      ?auto_3824 - HOIST
      ?auto_3823 - PLACE
      ?auto_3827 - SURFACE
      ?auto_3822 - TRUCK
      ?auto_3826 - PLACE
      ?auto_3825 - HOIST
      ?auto_3828 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3824 ?auto_3823 ) ( SURFACE-AT ?auto_3820 ?auto_3823 ) ( CLEAR ?auto_3820 ) ( IS-CRATE ?auto_3821 ) ( not ( = ?auto_3820 ?auto_3821 ) ) ( AVAILABLE ?auto_3824 ) ( ON ?auto_3820 ?auto_3827 ) ( not ( = ?auto_3827 ?auto_3820 ) ) ( not ( = ?auto_3827 ?auto_3821 ) ) ( TRUCK-AT ?auto_3822 ?auto_3826 ) ( not ( = ?auto_3826 ?auto_3823 ) ) ( HOIST-AT ?auto_3825 ?auto_3826 ) ( not ( = ?auto_3824 ?auto_3825 ) ) ( AVAILABLE ?auto_3825 ) ( SURFACE-AT ?auto_3821 ?auto_3826 ) ( ON ?auto_3821 ?auto_3828 ) ( CLEAR ?auto_3821 ) ( not ( = ?auto_3820 ?auto_3828 ) ) ( not ( = ?auto_3821 ?auto_3828 ) ) ( not ( = ?auto_3827 ?auto_3828 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3825 ?auto_3821 ?auto_3828 ?auto_3826 )
      ( MAKE-2CRATE ?auto_3827 ?auto_3820 ?auto_3821 )
      ( MAKE-1CRATE-VERIFY ?auto_3820 ?auto_3821 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3829 - SURFACE
      ?auto_3830 - SURFACE
      ?auto_3831 - SURFACE
    )
    :vars
    (
      ?auto_3835 - HOIST
      ?auto_3833 - PLACE
      ?auto_3834 - TRUCK
      ?auto_3832 - PLACE
      ?auto_3837 - HOIST
      ?auto_3836 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3835 ?auto_3833 ) ( SURFACE-AT ?auto_3830 ?auto_3833 ) ( CLEAR ?auto_3830 ) ( IS-CRATE ?auto_3831 ) ( not ( = ?auto_3830 ?auto_3831 ) ) ( AVAILABLE ?auto_3835 ) ( ON ?auto_3830 ?auto_3829 ) ( not ( = ?auto_3829 ?auto_3830 ) ) ( not ( = ?auto_3829 ?auto_3831 ) ) ( TRUCK-AT ?auto_3834 ?auto_3832 ) ( not ( = ?auto_3832 ?auto_3833 ) ) ( HOIST-AT ?auto_3837 ?auto_3832 ) ( not ( = ?auto_3835 ?auto_3837 ) ) ( AVAILABLE ?auto_3837 ) ( SURFACE-AT ?auto_3831 ?auto_3832 ) ( ON ?auto_3831 ?auto_3836 ) ( CLEAR ?auto_3831 ) ( not ( = ?auto_3830 ?auto_3836 ) ) ( not ( = ?auto_3831 ?auto_3836 ) ) ( not ( = ?auto_3829 ?auto_3836 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3830 ?auto_3831 )
      ( MAKE-2CRATE-VERIFY ?auto_3829 ?auto_3830 ?auto_3831 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3838 - SURFACE
      ?auto_3839 - SURFACE
    )
    :vars
    (
      ?auto_3841 - HOIST
      ?auto_3846 - PLACE
      ?auto_3840 - SURFACE
      ?auto_3845 - PLACE
      ?auto_3844 - HOIST
      ?auto_3842 - SURFACE
      ?auto_3843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3841 ?auto_3846 ) ( SURFACE-AT ?auto_3838 ?auto_3846 ) ( CLEAR ?auto_3838 ) ( IS-CRATE ?auto_3839 ) ( not ( = ?auto_3838 ?auto_3839 ) ) ( AVAILABLE ?auto_3841 ) ( ON ?auto_3838 ?auto_3840 ) ( not ( = ?auto_3840 ?auto_3838 ) ) ( not ( = ?auto_3840 ?auto_3839 ) ) ( not ( = ?auto_3845 ?auto_3846 ) ) ( HOIST-AT ?auto_3844 ?auto_3845 ) ( not ( = ?auto_3841 ?auto_3844 ) ) ( AVAILABLE ?auto_3844 ) ( SURFACE-AT ?auto_3839 ?auto_3845 ) ( ON ?auto_3839 ?auto_3842 ) ( CLEAR ?auto_3839 ) ( not ( = ?auto_3838 ?auto_3842 ) ) ( not ( = ?auto_3839 ?auto_3842 ) ) ( not ( = ?auto_3840 ?auto_3842 ) ) ( TRUCK-AT ?auto_3843 ?auto_3846 ) )
    :subtasks
    ( ( !DRIVE ?auto_3843 ?auto_3846 ?auto_3845 )
      ( MAKE-2CRATE ?auto_3840 ?auto_3838 ?auto_3839 )
      ( MAKE-1CRATE-VERIFY ?auto_3838 ?auto_3839 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3847 - SURFACE
      ?auto_3848 - SURFACE
      ?auto_3849 - SURFACE
    )
    :vars
    (
      ?auto_3852 - HOIST
      ?auto_3853 - PLACE
      ?auto_3854 - PLACE
      ?auto_3850 - HOIST
      ?auto_3855 - SURFACE
      ?auto_3851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3852 ?auto_3853 ) ( SURFACE-AT ?auto_3848 ?auto_3853 ) ( CLEAR ?auto_3848 ) ( IS-CRATE ?auto_3849 ) ( not ( = ?auto_3848 ?auto_3849 ) ) ( AVAILABLE ?auto_3852 ) ( ON ?auto_3848 ?auto_3847 ) ( not ( = ?auto_3847 ?auto_3848 ) ) ( not ( = ?auto_3847 ?auto_3849 ) ) ( not ( = ?auto_3854 ?auto_3853 ) ) ( HOIST-AT ?auto_3850 ?auto_3854 ) ( not ( = ?auto_3852 ?auto_3850 ) ) ( AVAILABLE ?auto_3850 ) ( SURFACE-AT ?auto_3849 ?auto_3854 ) ( ON ?auto_3849 ?auto_3855 ) ( CLEAR ?auto_3849 ) ( not ( = ?auto_3848 ?auto_3855 ) ) ( not ( = ?auto_3849 ?auto_3855 ) ) ( not ( = ?auto_3847 ?auto_3855 ) ) ( TRUCK-AT ?auto_3851 ?auto_3853 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3848 ?auto_3849 )
      ( MAKE-2CRATE-VERIFY ?auto_3847 ?auto_3848 ?auto_3849 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3856 - SURFACE
      ?auto_3857 - SURFACE
    )
    :vars
    (
      ?auto_3862 - HOIST
      ?auto_3859 - PLACE
      ?auto_3863 - SURFACE
      ?auto_3861 - PLACE
      ?auto_3864 - HOIST
      ?auto_3858 - SURFACE
      ?auto_3860 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3862 ?auto_3859 ) ( IS-CRATE ?auto_3857 ) ( not ( = ?auto_3856 ?auto_3857 ) ) ( not ( = ?auto_3863 ?auto_3856 ) ) ( not ( = ?auto_3863 ?auto_3857 ) ) ( not ( = ?auto_3861 ?auto_3859 ) ) ( HOIST-AT ?auto_3864 ?auto_3861 ) ( not ( = ?auto_3862 ?auto_3864 ) ) ( AVAILABLE ?auto_3864 ) ( SURFACE-AT ?auto_3857 ?auto_3861 ) ( ON ?auto_3857 ?auto_3858 ) ( CLEAR ?auto_3857 ) ( not ( = ?auto_3856 ?auto_3858 ) ) ( not ( = ?auto_3857 ?auto_3858 ) ) ( not ( = ?auto_3863 ?auto_3858 ) ) ( TRUCK-AT ?auto_3860 ?auto_3859 ) ( SURFACE-AT ?auto_3863 ?auto_3859 ) ( CLEAR ?auto_3863 ) ( LIFTING ?auto_3862 ?auto_3856 ) ( IS-CRATE ?auto_3856 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3863 ?auto_3856 )
      ( MAKE-2CRATE ?auto_3863 ?auto_3856 ?auto_3857 )
      ( MAKE-1CRATE-VERIFY ?auto_3856 ?auto_3857 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3865 - SURFACE
      ?auto_3866 - SURFACE
      ?auto_3867 - SURFACE
    )
    :vars
    (
      ?auto_3873 - HOIST
      ?auto_3868 - PLACE
      ?auto_3870 - PLACE
      ?auto_3871 - HOIST
      ?auto_3872 - SURFACE
      ?auto_3869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3873 ?auto_3868 ) ( IS-CRATE ?auto_3867 ) ( not ( = ?auto_3866 ?auto_3867 ) ) ( not ( = ?auto_3865 ?auto_3866 ) ) ( not ( = ?auto_3865 ?auto_3867 ) ) ( not ( = ?auto_3870 ?auto_3868 ) ) ( HOIST-AT ?auto_3871 ?auto_3870 ) ( not ( = ?auto_3873 ?auto_3871 ) ) ( AVAILABLE ?auto_3871 ) ( SURFACE-AT ?auto_3867 ?auto_3870 ) ( ON ?auto_3867 ?auto_3872 ) ( CLEAR ?auto_3867 ) ( not ( = ?auto_3866 ?auto_3872 ) ) ( not ( = ?auto_3867 ?auto_3872 ) ) ( not ( = ?auto_3865 ?auto_3872 ) ) ( TRUCK-AT ?auto_3869 ?auto_3868 ) ( SURFACE-AT ?auto_3865 ?auto_3868 ) ( CLEAR ?auto_3865 ) ( LIFTING ?auto_3873 ?auto_3866 ) ( IS-CRATE ?auto_3866 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3866 ?auto_3867 )
      ( MAKE-2CRATE-VERIFY ?auto_3865 ?auto_3866 ?auto_3867 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3874 - SURFACE
      ?auto_3875 - SURFACE
    )
    :vars
    (
      ?auto_3878 - HOIST
      ?auto_3880 - PLACE
      ?auto_3879 - SURFACE
      ?auto_3877 - PLACE
      ?auto_3876 - HOIST
      ?auto_3881 - SURFACE
      ?auto_3882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3878 ?auto_3880 ) ( IS-CRATE ?auto_3875 ) ( not ( = ?auto_3874 ?auto_3875 ) ) ( not ( = ?auto_3879 ?auto_3874 ) ) ( not ( = ?auto_3879 ?auto_3875 ) ) ( not ( = ?auto_3877 ?auto_3880 ) ) ( HOIST-AT ?auto_3876 ?auto_3877 ) ( not ( = ?auto_3878 ?auto_3876 ) ) ( AVAILABLE ?auto_3876 ) ( SURFACE-AT ?auto_3875 ?auto_3877 ) ( ON ?auto_3875 ?auto_3881 ) ( CLEAR ?auto_3875 ) ( not ( = ?auto_3874 ?auto_3881 ) ) ( not ( = ?auto_3875 ?auto_3881 ) ) ( not ( = ?auto_3879 ?auto_3881 ) ) ( TRUCK-AT ?auto_3882 ?auto_3880 ) ( SURFACE-AT ?auto_3879 ?auto_3880 ) ( CLEAR ?auto_3879 ) ( IS-CRATE ?auto_3874 ) ( AVAILABLE ?auto_3878 ) ( IN ?auto_3874 ?auto_3882 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3878 ?auto_3874 ?auto_3882 ?auto_3880 )
      ( MAKE-2CRATE ?auto_3879 ?auto_3874 ?auto_3875 )
      ( MAKE-1CRATE-VERIFY ?auto_3874 ?auto_3875 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3883 - SURFACE
      ?auto_3884 - SURFACE
      ?auto_3885 - SURFACE
    )
    :vars
    (
      ?auto_3887 - HOIST
      ?auto_3886 - PLACE
      ?auto_3889 - PLACE
      ?auto_3888 - HOIST
      ?auto_3890 - SURFACE
      ?auto_3891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3887 ?auto_3886 ) ( IS-CRATE ?auto_3885 ) ( not ( = ?auto_3884 ?auto_3885 ) ) ( not ( = ?auto_3883 ?auto_3884 ) ) ( not ( = ?auto_3883 ?auto_3885 ) ) ( not ( = ?auto_3889 ?auto_3886 ) ) ( HOIST-AT ?auto_3888 ?auto_3889 ) ( not ( = ?auto_3887 ?auto_3888 ) ) ( AVAILABLE ?auto_3888 ) ( SURFACE-AT ?auto_3885 ?auto_3889 ) ( ON ?auto_3885 ?auto_3890 ) ( CLEAR ?auto_3885 ) ( not ( = ?auto_3884 ?auto_3890 ) ) ( not ( = ?auto_3885 ?auto_3890 ) ) ( not ( = ?auto_3883 ?auto_3890 ) ) ( TRUCK-AT ?auto_3891 ?auto_3886 ) ( SURFACE-AT ?auto_3883 ?auto_3886 ) ( CLEAR ?auto_3883 ) ( IS-CRATE ?auto_3884 ) ( AVAILABLE ?auto_3887 ) ( IN ?auto_3884 ?auto_3891 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3884 ?auto_3885 )
      ( MAKE-2CRATE-VERIFY ?auto_3883 ?auto_3884 ?auto_3885 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3892 - SURFACE
      ?auto_3893 - SURFACE
    )
    :vars
    (
      ?auto_3897 - HOIST
      ?auto_3899 - PLACE
      ?auto_3894 - SURFACE
      ?auto_3895 - PLACE
      ?auto_3900 - HOIST
      ?auto_3896 - SURFACE
      ?auto_3898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3897 ?auto_3899 ) ( IS-CRATE ?auto_3893 ) ( not ( = ?auto_3892 ?auto_3893 ) ) ( not ( = ?auto_3894 ?auto_3892 ) ) ( not ( = ?auto_3894 ?auto_3893 ) ) ( not ( = ?auto_3895 ?auto_3899 ) ) ( HOIST-AT ?auto_3900 ?auto_3895 ) ( not ( = ?auto_3897 ?auto_3900 ) ) ( AVAILABLE ?auto_3900 ) ( SURFACE-AT ?auto_3893 ?auto_3895 ) ( ON ?auto_3893 ?auto_3896 ) ( CLEAR ?auto_3893 ) ( not ( = ?auto_3892 ?auto_3896 ) ) ( not ( = ?auto_3893 ?auto_3896 ) ) ( not ( = ?auto_3894 ?auto_3896 ) ) ( SURFACE-AT ?auto_3894 ?auto_3899 ) ( CLEAR ?auto_3894 ) ( IS-CRATE ?auto_3892 ) ( AVAILABLE ?auto_3897 ) ( IN ?auto_3892 ?auto_3898 ) ( TRUCK-AT ?auto_3898 ?auto_3895 ) )
    :subtasks
    ( ( !DRIVE ?auto_3898 ?auto_3895 ?auto_3899 )
      ( MAKE-2CRATE ?auto_3894 ?auto_3892 ?auto_3893 )
      ( MAKE-1CRATE-VERIFY ?auto_3892 ?auto_3893 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3901 - SURFACE
      ?auto_3902 - SURFACE
      ?auto_3903 - SURFACE
    )
    :vars
    (
      ?auto_3908 - HOIST
      ?auto_3909 - PLACE
      ?auto_3907 - PLACE
      ?auto_3906 - HOIST
      ?auto_3904 - SURFACE
      ?auto_3905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3908 ?auto_3909 ) ( IS-CRATE ?auto_3903 ) ( not ( = ?auto_3902 ?auto_3903 ) ) ( not ( = ?auto_3901 ?auto_3902 ) ) ( not ( = ?auto_3901 ?auto_3903 ) ) ( not ( = ?auto_3907 ?auto_3909 ) ) ( HOIST-AT ?auto_3906 ?auto_3907 ) ( not ( = ?auto_3908 ?auto_3906 ) ) ( AVAILABLE ?auto_3906 ) ( SURFACE-AT ?auto_3903 ?auto_3907 ) ( ON ?auto_3903 ?auto_3904 ) ( CLEAR ?auto_3903 ) ( not ( = ?auto_3902 ?auto_3904 ) ) ( not ( = ?auto_3903 ?auto_3904 ) ) ( not ( = ?auto_3901 ?auto_3904 ) ) ( SURFACE-AT ?auto_3901 ?auto_3909 ) ( CLEAR ?auto_3901 ) ( IS-CRATE ?auto_3902 ) ( AVAILABLE ?auto_3908 ) ( IN ?auto_3902 ?auto_3905 ) ( TRUCK-AT ?auto_3905 ?auto_3907 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3902 ?auto_3903 )
      ( MAKE-2CRATE-VERIFY ?auto_3901 ?auto_3902 ?auto_3903 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3910 - SURFACE
      ?auto_3911 - SURFACE
    )
    :vars
    (
      ?auto_3918 - HOIST
      ?auto_3917 - PLACE
      ?auto_3914 - SURFACE
      ?auto_3915 - PLACE
      ?auto_3913 - HOIST
      ?auto_3916 - SURFACE
      ?auto_3912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3918 ?auto_3917 ) ( IS-CRATE ?auto_3911 ) ( not ( = ?auto_3910 ?auto_3911 ) ) ( not ( = ?auto_3914 ?auto_3910 ) ) ( not ( = ?auto_3914 ?auto_3911 ) ) ( not ( = ?auto_3915 ?auto_3917 ) ) ( HOIST-AT ?auto_3913 ?auto_3915 ) ( not ( = ?auto_3918 ?auto_3913 ) ) ( SURFACE-AT ?auto_3911 ?auto_3915 ) ( ON ?auto_3911 ?auto_3916 ) ( CLEAR ?auto_3911 ) ( not ( = ?auto_3910 ?auto_3916 ) ) ( not ( = ?auto_3911 ?auto_3916 ) ) ( not ( = ?auto_3914 ?auto_3916 ) ) ( SURFACE-AT ?auto_3914 ?auto_3917 ) ( CLEAR ?auto_3914 ) ( IS-CRATE ?auto_3910 ) ( AVAILABLE ?auto_3918 ) ( TRUCK-AT ?auto_3912 ?auto_3915 ) ( LIFTING ?auto_3913 ?auto_3910 ) )
    :subtasks
    ( ( !LOAD ?auto_3913 ?auto_3910 ?auto_3912 ?auto_3915 )
      ( MAKE-2CRATE ?auto_3914 ?auto_3910 ?auto_3911 )
      ( MAKE-1CRATE-VERIFY ?auto_3910 ?auto_3911 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3919 - SURFACE
      ?auto_3920 - SURFACE
      ?auto_3921 - SURFACE
    )
    :vars
    (
      ?auto_3927 - HOIST
      ?auto_3922 - PLACE
      ?auto_3924 - PLACE
      ?auto_3923 - HOIST
      ?auto_3925 - SURFACE
      ?auto_3926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3927 ?auto_3922 ) ( IS-CRATE ?auto_3921 ) ( not ( = ?auto_3920 ?auto_3921 ) ) ( not ( = ?auto_3919 ?auto_3920 ) ) ( not ( = ?auto_3919 ?auto_3921 ) ) ( not ( = ?auto_3924 ?auto_3922 ) ) ( HOIST-AT ?auto_3923 ?auto_3924 ) ( not ( = ?auto_3927 ?auto_3923 ) ) ( SURFACE-AT ?auto_3921 ?auto_3924 ) ( ON ?auto_3921 ?auto_3925 ) ( CLEAR ?auto_3921 ) ( not ( = ?auto_3920 ?auto_3925 ) ) ( not ( = ?auto_3921 ?auto_3925 ) ) ( not ( = ?auto_3919 ?auto_3925 ) ) ( SURFACE-AT ?auto_3919 ?auto_3922 ) ( CLEAR ?auto_3919 ) ( IS-CRATE ?auto_3920 ) ( AVAILABLE ?auto_3927 ) ( TRUCK-AT ?auto_3926 ?auto_3924 ) ( LIFTING ?auto_3923 ?auto_3920 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3920 ?auto_3921 )
      ( MAKE-2CRATE-VERIFY ?auto_3919 ?auto_3920 ?auto_3921 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3928 - SURFACE
      ?auto_3929 - SURFACE
    )
    :vars
    (
      ?auto_3932 - HOIST
      ?auto_3933 - PLACE
      ?auto_3934 - SURFACE
      ?auto_3936 - PLACE
      ?auto_3930 - HOIST
      ?auto_3931 - SURFACE
      ?auto_3935 - TRUCK
      ?auto_3937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3932 ?auto_3933 ) ( IS-CRATE ?auto_3929 ) ( not ( = ?auto_3928 ?auto_3929 ) ) ( not ( = ?auto_3934 ?auto_3928 ) ) ( not ( = ?auto_3934 ?auto_3929 ) ) ( not ( = ?auto_3936 ?auto_3933 ) ) ( HOIST-AT ?auto_3930 ?auto_3936 ) ( not ( = ?auto_3932 ?auto_3930 ) ) ( SURFACE-AT ?auto_3929 ?auto_3936 ) ( ON ?auto_3929 ?auto_3931 ) ( CLEAR ?auto_3929 ) ( not ( = ?auto_3928 ?auto_3931 ) ) ( not ( = ?auto_3929 ?auto_3931 ) ) ( not ( = ?auto_3934 ?auto_3931 ) ) ( SURFACE-AT ?auto_3934 ?auto_3933 ) ( CLEAR ?auto_3934 ) ( IS-CRATE ?auto_3928 ) ( AVAILABLE ?auto_3932 ) ( TRUCK-AT ?auto_3935 ?auto_3936 ) ( AVAILABLE ?auto_3930 ) ( SURFACE-AT ?auto_3928 ?auto_3936 ) ( ON ?auto_3928 ?auto_3937 ) ( CLEAR ?auto_3928 ) ( not ( = ?auto_3928 ?auto_3937 ) ) ( not ( = ?auto_3929 ?auto_3937 ) ) ( not ( = ?auto_3934 ?auto_3937 ) ) ( not ( = ?auto_3931 ?auto_3937 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3930 ?auto_3928 ?auto_3937 ?auto_3936 )
      ( MAKE-2CRATE ?auto_3934 ?auto_3928 ?auto_3929 )
      ( MAKE-1CRATE-VERIFY ?auto_3928 ?auto_3929 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3938 - SURFACE
      ?auto_3939 - SURFACE
      ?auto_3940 - SURFACE
    )
    :vars
    (
      ?auto_3947 - HOIST
      ?auto_3941 - PLACE
      ?auto_3945 - PLACE
      ?auto_3943 - HOIST
      ?auto_3946 - SURFACE
      ?auto_3942 - TRUCK
      ?auto_3944 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3947 ?auto_3941 ) ( IS-CRATE ?auto_3940 ) ( not ( = ?auto_3939 ?auto_3940 ) ) ( not ( = ?auto_3938 ?auto_3939 ) ) ( not ( = ?auto_3938 ?auto_3940 ) ) ( not ( = ?auto_3945 ?auto_3941 ) ) ( HOIST-AT ?auto_3943 ?auto_3945 ) ( not ( = ?auto_3947 ?auto_3943 ) ) ( SURFACE-AT ?auto_3940 ?auto_3945 ) ( ON ?auto_3940 ?auto_3946 ) ( CLEAR ?auto_3940 ) ( not ( = ?auto_3939 ?auto_3946 ) ) ( not ( = ?auto_3940 ?auto_3946 ) ) ( not ( = ?auto_3938 ?auto_3946 ) ) ( SURFACE-AT ?auto_3938 ?auto_3941 ) ( CLEAR ?auto_3938 ) ( IS-CRATE ?auto_3939 ) ( AVAILABLE ?auto_3947 ) ( TRUCK-AT ?auto_3942 ?auto_3945 ) ( AVAILABLE ?auto_3943 ) ( SURFACE-AT ?auto_3939 ?auto_3945 ) ( ON ?auto_3939 ?auto_3944 ) ( CLEAR ?auto_3939 ) ( not ( = ?auto_3939 ?auto_3944 ) ) ( not ( = ?auto_3940 ?auto_3944 ) ) ( not ( = ?auto_3938 ?auto_3944 ) ) ( not ( = ?auto_3946 ?auto_3944 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3939 ?auto_3940 )
      ( MAKE-2CRATE-VERIFY ?auto_3938 ?auto_3939 ?auto_3940 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3948 - SURFACE
      ?auto_3949 - SURFACE
    )
    :vars
    (
      ?auto_3956 - HOIST
      ?auto_3952 - PLACE
      ?auto_3954 - SURFACE
      ?auto_3957 - PLACE
      ?auto_3950 - HOIST
      ?auto_3953 - SURFACE
      ?auto_3951 - SURFACE
      ?auto_3955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3956 ?auto_3952 ) ( IS-CRATE ?auto_3949 ) ( not ( = ?auto_3948 ?auto_3949 ) ) ( not ( = ?auto_3954 ?auto_3948 ) ) ( not ( = ?auto_3954 ?auto_3949 ) ) ( not ( = ?auto_3957 ?auto_3952 ) ) ( HOIST-AT ?auto_3950 ?auto_3957 ) ( not ( = ?auto_3956 ?auto_3950 ) ) ( SURFACE-AT ?auto_3949 ?auto_3957 ) ( ON ?auto_3949 ?auto_3953 ) ( CLEAR ?auto_3949 ) ( not ( = ?auto_3948 ?auto_3953 ) ) ( not ( = ?auto_3949 ?auto_3953 ) ) ( not ( = ?auto_3954 ?auto_3953 ) ) ( SURFACE-AT ?auto_3954 ?auto_3952 ) ( CLEAR ?auto_3954 ) ( IS-CRATE ?auto_3948 ) ( AVAILABLE ?auto_3956 ) ( AVAILABLE ?auto_3950 ) ( SURFACE-AT ?auto_3948 ?auto_3957 ) ( ON ?auto_3948 ?auto_3951 ) ( CLEAR ?auto_3948 ) ( not ( = ?auto_3948 ?auto_3951 ) ) ( not ( = ?auto_3949 ?auto_3951 ) ) ( not ( = ?auto_3954 ?auto_3951 ) ) ( not ( = ?auto_3953 ?auto_3951 ) ) ( TRUCK-AT ?auto_3955 ?auto_3952 ) )
    :subtasks
    ( ( !DRIVE ?auto_3955 ?auto_3952 ?auto_3957 )
      ( MAKE-2CRATE ?auto_3954 ?auto_3948 ?auto_3949 )
      ( MAKE-1CRATE-VERIFY ?auto_3948 ?auto_3949 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3958 - SURFACE
      ?auto_3959 - SURFACE
      ?auto_3960 - SURFACE
    )
    :vars
    (
      ?auto_3964 - HOIST
      ?auto_3961 - PLACE
      ?auto_3966 - PLACE
      ?auto_3967 - HOIST
      ?auto_3963 - SURFACE
      ?auto_3962 - SURFACE
      ?auto_3965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3964 ?auto_3961 ) ( IS-CRATE ?auto_3960 ) ( not ( = ?auto_3959 ?auto_3960 ) ) ( not ( = ?auto_3958 ?auto_3959 ) ) ( not ( = ?auto_3958 ?auto_3960 ) ) ( not ( = ?auto_3966 ?auto_3961 ) ) ( HOIST-AT ?auto_3967 ?auto_3966 ) ( not ( = ?auto_3964 ?auto_3967 ) ) ( SURFACE-AT ?auto_3960 ?auto_3966 ) ( ON ?auto_3960 ?auto_3963 ) ( CLEAR ?auto_3960 ) ( not ( = ?auto_3959 ?auto_3963 ) ) ( not ( = ?auto_3960 ?auto_3963 ) ) ( not ( = ?auto_3958 ?auto_3963 ) ) ( SURFACE-AT ?auto_3958 ?auto_3961 ) ( CLEAR ?auto_3958 ) ( IS-CRATE ?auto_3959 ) ( AVAILABLE ?auto_3964 ) ( AVAILABLE ?auto_3967 ) ( SURFACE-AT ?auto_3959 ?auto_3966 ) ( ON ?auto_3959 ?auto_3962 ) ( CLEAR ?auto_3959 ) ( not ( = ?auto_3959 ?auto_3962 ) ) ( not ( = ?auto_3960 ?auto_3962 ) ) ( not ( = ?auto_3958 ?auto_3962 ) ) ( not ( = ?auto_3963 ?auto_3962 ) ) ( TRUCK-AT ?auto_3965 ?auto_3961 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3959 ?auto_3960 )
      ( MAKE-2CRATE-VERIFY ?auto_3958 ?auto_3959 ?auto_3960 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3977 - SURFACE
      ?auto_3978 - SURFACE
    )
    :vars
    (
      ?auto_3979 - HOIST
      ?auto_3980 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3979 ?auto_3980 ) ( SURFACE-AT ?auto_3977 ?auto_3980 ) ( CLEAR ?auto_3977 ) ( LIFTING ?auto_3979 ?auto_3978 ) ( IS-CRATE ?auto_3978 ) ( not ( = ?auto_3977 ?auto_3978 ) ) )
    :subtasks
    ( ( !DROP ?auto_3979 ?auto_3978 ?auto_3977 ?auto_3980 )
      ( MAKE-1CRATE-VERIFY ?auto_3977 ?auto_3978 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3981 - SURFACE
      ?auto_3982 - SURFACE
      ?auto_3983 - SURFACE
    )
    :vars
    (
      ?auto_3984 - HOIST
      ?auto_3985 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3984 ?auto_3985 ) ( SURFACE-AT ?auto_3982 ?auto_3985 ) ( CLEAR ?auto_3982 ) ( LIFTING ?auto_3984 ?auto_3983 ) ( IS-CRATE ?auto_3983 ) ( not ( = ?auto_3982 ?auto_3983 ) ) ( ON ?auto_3982 ?auto_3981 ) ( not ( = ?auto_3981 ?auto_3982 ) ) ( not ( = ?auto_3981 ?auto_3983 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3982 ?auto_3983 )
      ( MAKE-2CRATE-VERIFY ?auto_3981 ?auto_3982 ?auto_3983 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3986 - SURFACE
      ?auto_3987 - SURFACE
      ?auto_3988 - SURFACE
      ?auto_3989 - SURFACE
    )
    :vars
    (
      ?auto_3990 - HOIST
      ?auto_3991 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3990 ?auto_3991 ) ( SURFACE-AT ?auto_3988 ?auto_3991 ) ( CLEAR ?auto_3988 ) ( LIFTING ?auto_3990 ?auto_3989 ) ( IS-CRATE ?auto_3989 ) ( not ( = ?auto_3988 ?auto_3989 ) ) ( ON ?auto_3987 ?auto_3986 ) ( ON ?auto_3988 ?auto_3987 ) ( not ( = ?auto_3986 ?auto_3987 ) ) ( not ( = ?auto_3986 ?auto_3988 ) ) ( not ( = ?auto_3986 ?auto_3989 ) ) ( not ( = ?auto_3987 ?auto_3988 ) ) ( not ( = ?auto_3987 ?auto_3989 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3988 ?auto_3989 )
      ( MAKE-3CRATE-VERIFY ?auto_3986 ?auto_3987 ?auto_3988 ?auto_3989 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3992 - SURFACE
      ?auto_3993 - SURFACE
    )
    :vars
    (
      ?auto_3994 - HOIST
      ?auto_3995 - PLACE
      ?auto_3996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3994 ?auto_3995 ) ( SURFACE-AT ?auto_3992 ?auto_3995 ) ( CLEAR ?auto_3992 ) ( IS-CRATE ?auto_3993 ) ( not ( = ?auto_3992 ?auto_3993 ) ) ( TRUCK-AT ?auto_3996 ?auto_3995 ) ( AVAILABLE ?auto_3994 ) ( IN ?auto_3993 ?auto_3996 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3994 ?auto_3993 ?auto_3996 ?auto_3995 )
      ( MAKE-1CRATE ?auto_3992 ?auto_3993 )
      ( MAKE-1CRATE-VERIFY ?auto_3992 ?auto_3993 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3997 - SURFACE
      ?auto_3998 - SURFACE
      ?auto_3999 - SURFACE
    )
    :vars
    (
      ?auto_4002 - HOIST
      ?auto_4000 - PLACE
      ?auto_4001 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4002 ?auto_4000 ) ( SURFACE-AT ?auto_3998 ?auto_4000 ) ( CLEAR ?auto_3998 ) ( IS-CRATE ?auto_3999 ) ( not ( = ?auto_3998 ?auto_3999 ) ) ( TRUCK-AT ?auto_4001 ?auto_4000 ) ( AVAILABLE ?auto_4002 ) ( IN ?auto_3999 ?auto_4001 ) ( ON ?auto_3998 ?auto_3997 ) ( not ( = ?auto_3997 ?auto_3998 ) ) ( not ( = ?auto_3997 ?auto_3999 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3998 ?auto_3999 )
      ( MAKE-2CRATE-VERIFY ?auto_3997 ?auto_3998 ?auto_3999 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4003 - SURFACE
      ?auto_4004 - SURFACE
      ?auto_4005 - SURFACE
      ?auto_4006 - SURFACE
    )
    :vars
    (
      ?auto_4009 - HOIST
      ?auto_4008 - PLACE
      ?auto_4007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4009 ?auto_4008 ) ( SURFACE-AT ?auto_4005 ?auto_4008 ) ( CLEAR ?auto_4005 ) ( IS-CRATE ?auto_4006 ) ( not ( = ?auto_4005 ?auto_4006 ) ) ( TRUCK-AT ?auto_4007 ?auto_4008 ) ( AVAILABLE ?auto_4009 ) ( IN ?auto_4006 ?auto_4007 ) ( ON ?auto_4005 ?auto_4004 ) ( not ( = ?auto_4004 ?auto_4005 ) ) ( not ( = ?auto_4004 ?auto_4006 ) ) ( ON ?auto_4004 ?auto_4003 ) ( not ( = ?auto_4003 ?auto_4004 ) ) ( not ( = ?auto_4003 ?auto_4005 ) ) ( not ( = ?auto_4003 ?auto_4006 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4004 ?auto_4005 ?auto_4006 )
      ( MAKE-3CRATE-VERIFY ?auto_4003 ?auto_4004 ?auto_4005 ?auto_4006 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4010 - SURFACE
      ?auto_4011 - SURFACE
    )
    :vars
    (
      ?auto_4015 - HOIST
      ?auto_4014 - PLACE
      ?auto_4012 - TRUCK
      ?auto_4013 - SURFACE
      ?auto_4016 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4015 ?auto_4014 ) ( SURFACE-AT ?auto_4010 ?auto_4014 ) ( CLEAR ?auto_4010 ) ( IS-CRATE ?auto_4011 ) ( not ( = ?auto_4010 ?auto_4011 ) ) ( AVAILABLE ?auto_4015 ) ( IN ?auto_4011 ?auto_4012 ) ( ON ?auto_4010 ?auto_4013 ) ( not ( = ?auto_4013 ?auto_4010 ) ) ( not ( = ?auto_4013 ?auto_4011 ) ) ( TRUCK-AT ?auto_4012 ?auto_4016 ) ( not ( = ?auto_4016 ?auto_4014 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4012 ?auto_4016 ?auto_4014 )
      ( MAKE-2CRATE ?auto_4013 ?auto_4010 ?auto_4011 )
      ( MAKE-1CRATE-VERIFY ?auto_4010 ?auto_4011 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4017 - SURFACE
      ?auto_4018 - SURFACE
      ?auto_4019 - SURFACE
    )
    :vars
    (
      ?auto_4022 - HOIST
      ?auto_4020 - PLACE
      ?auto_4023 - TRUCK
      ?auto_4021 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4022 ?auto_4020 ) ( SURFACE-AT ?auto_4018 ?auto_4020 ) ( CLEAR ?auto_4018 ) ( IS-CRATE ?auto_4019 ) ( not ( = ?auto_4018 ?auto_4019 ) ) ( AVAILABLE ?auto_4022 ) ( IN ?auto_4019 ?auto_4023 ) ( ON ?auto_4018 ?auto_4017 ) ( not ( = ?auto_4017 ?auto_4018 ) ) ( not ( = ?auto_4017 ?auto_4019 ) ) ( TRUCK-AT ?auto_4023 ?auto_4021 ) ( not ( = ?auto_4021 ?auto_4020 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4018 ?auto_4019 )
      ( MAKE-2CRATE-VERIFY ?auto_4017 ?auto_4018 ?auto_4019 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4024 - SURFACE
      ?auto_4025 - SURFACE
      ?auto_4026 - SURFACE
      ?auto_4027 - SURFACE
    )
    :vars
    (
      ?auto_4030 - HOIST
      ?auto_4031 - PLACE
      ?auto_4028 - TRUCK
      ?auto_4029 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4030 ?auto_4031 ) ( SURFACE-AT ?auto_4026 ?auto_4031 ) ( CLEAR ?auto_4026 ) ( IS-CRATE ?auto_4027 ) ( not ( = ?auto_4026 ?auto_4027 ) ) ( AVAILABLE ?auto_4030 ) ( IN ?auto_4027 ?auto_4028 ) ( ON ?auto_4026 ?auto_4025 ) ( not ( = ?auto_4025 ?auto_4026 ) ) ( not ( = ?auto_4025 ?auto_4027 ) ) ( TRUCK-AT ?auto_4028 ?auto_4029 ) ( not ( = ?auto_4029 ?auto_4031 ) ) ( ON ?auto_4025 ?auto_4024 ) ( not ( = ?auto_4024 ?auto_4025 ) ) ( not ( = ?auto_4024 ?auto_4026 ) ) ( not ( = ?auto_4024 ?auto_4027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4025 ?auto_4026 ?auto_4027 )
      ( MAKE-3CRATE-VERIFY ?auto_4024 ?auto_4025 ?auto_4026 ?auto_4027 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4032 - SURFACE
      ?auto_4033 - SURFACE
    )
    :vars
    (
      ?auto_4037 - HOIST
      ?auto_4038 - PLACE
      ?auto_4036 - SURFACE
      ?auto_4034 - TRUCK
      ?auto_4035 - PLACE
      ?auto_4039 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4037 ?auto_4038 ) ( SURFACE-AT ?auto_4032 ?auto_4038 ) ( CLEAR ?auto_4032 ) ( IS-CRATE ?auto_4033 ) ( not ( = ?auto_4032 ?auto_4033 ) ) ( AVAILABLE ?auto_4037 ) ( ON ?auto_4032 ?auto_4036 ) ( not ( = ?auto_4036 ?auto_4032 ) ) ( not ( = ?auto_4036 ?auto_4033 ) ) ( TRUCK-AT ?auto_4034 ?auto_4035 ) ( not ( = ?auto_4035 ?auto_4038 ) ) ( HOIST-AT ?auto_4039 ?auto_4035 ) ( LIFTING ?auto_4039 ?auto_4033 ) ( not ( = ?auto_4037 ?auto_4039 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4039 ?auto_4033 ?auto_4034 ?auto_4035 )
      ( MAKE-2CRATE ?auto_4036 ?auto_4032 ?auto_4033 )
      ( MAKE-1CRATE-VERIFY ?auto_4032 ?auto_4033 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4040 - SURFACE
      ?auto_4041 - SURFACE
      ?auto_4042 - SURFACE
    )
    :vars
    (
      ?auto_4043 - HOIST
      ?auto_4046 - PLACE
      ?auto_4045 - TRUCK
      ?auto_4044 - PLACE
      ?auto_4047 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4043 ?auto_4046 ) ( SURFACE-AT ?auto_4041 ?auto_4046 ) ( CLEAR ?auto_4041 ) ( IS-CRATE ?auto_4042 ) ( not ( = ?auto_4041 ?auto_4042 ) ) ( AVAILABLE ?auto_4043 ) ( ON ?auto_4041 ?auto_4040 ) ( not ( = ?auto_4040 ?auto_4041 ) ) ( not ( = ?auto_4040 ?auto_4042 ) ) ( TRUCK-AT ?auto_4045 ?auto_4044 ) ( not ( = ?auto_4044 ?auto_4046 ) ) ( HOIST-AT ?auto_4047 ?auto_4044 ) ( LIFTING ?auto_4047 ?auto_4042 ) ( not ( = ?auto_4043 ?auto_4047 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4041 ?auto_4042 )
      ( MAKE-2CRATE-VERIFY ?auto_4040 ?auto_4041 ?auto_4042 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4048 - SURFACE
      ?auto_4049 - SURFACE
      ?auto_4050 - SURFACE
      ?auto_4051 - SURFACE
    )
    :vars
    (
      ?auto_4056 - HOIST
      ?auto_4053 - PLACE
      ?auto_4054 - TRUCK
      ?auto_4055 - PLACE
      ?auto_4052 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4056 ?auto_4053 ) ( SURFACE-AT ?auto_4050 ?auto_4053 ) ( CLEAR ?auto_4050 ) ( IS-CRATE ?auto_4051 ) ( not ( = ?auto_4050 ?auto_4051 ) ) ( AVAILABLE ?auto_4056 ) ( ON ?auto_4050 ?auto_4049 ) ( not ( = ?auto_4049 ?auto_4050 ) ) ( not ( = ?auto_4049 ?auto_4051 ) ) ( TRUCK-AT ?auto_4054 ?auto_4055 ) ( not ( = ?auto_4055 ?auto_4053 ) ) ( HOIST-AT ?auto_4052 ?auto_4055 ) ( LIFTING ?auto_4052 ?auto_4051 ) ( not ( = ?auto_4056 ?auto_4052 ) ) ( ON ?auto_4049 ?auto_4048 ) ( not ( = ?auto_4048 ?auto_4049 ) ) ( not ( = ?auto_4048 ?auto_4050 ) ) ( not ( = ?auto_4048 ?auto_4051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4049 ?auto_4050 ?auto_4051 )
      ( MAKE-3CRATE-VERIFY ?auto_4048 ?auto_4049 ?auto_4050 ?auto_4051 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4057 - SURFACE
      ?auto_4058 - SURFACE
    )
    :vars
    (
      ?auto_4064 - HOIST
      ?auto_4060 - PLACE
      ?auto_4061 - SURFACE
      ?auto_4062 - TRUCK
      ?auto_4063 - PLACE
      ?auto_4059 - HOIST
      ?auto_4065 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4064 ?auto_4060 ) ( SURFACE-AT ?auto_4057 ?auto_4060 ) ( CLEAR ?auto_4057 ) ( IS-CRATE ?auto_4058 ) ( not ( = ?auto_4057 ?auto_4058 ) ) ( AVAILABLE ?auto_4064 ) ( ON ?auto_4057 ?auto_4061 ) ( not ( = ?auto_4061 ?auto_4057 ) ) ( not ( = ?auto_4061 ?auto_4058 ) ) ( TRUCK-AT ?auto_4062 ?auto_4063 ) ( not ( = ?auto_4063 ?auto_4060 ) ) ( HOIST-AT ?auto_4059 ?auto_4063 ) ( not ( = ?auto_4064 ?auto_4059 ) ) ( AVAILABLE ?auto_4059 ) ( SURFACE-AT ?auto_4058 ?auto_4063 ) ( ON ?auto_4058 ?auto_4065 ) ( CLEAR ?auto_4058 ) ( not ( = ?auto_4057 ?auto_4065 ) ) ( not ( = ?auto_4058 ?auto_4065 ) ) ( not ( = ?auto_4061 ?auto_4065 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4059 ?auto_4058 ?auto_4065 ?auto_4063 )
      ( MAKE-2CRATE ?auto_4061 ?auto_4057 ?auto_4058 )
      ( MAKE-1CRATE-VERIFY ?auto_4057 ?auto_4058 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4066 - SURFACE
      ?auto_4067 - SURFACE
      ?auto_4068 - SURFACE
    )
    :vars
    (
      ?auto_4070 - HOIST
      ?auto_4071 - PLACE
      ?auto_4073 - TRUCK
      ?auto_4069 - PLACE
      ?auto_4074 - HOIST
      ?auto_4072 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4070 ?auto_4071 ) ( SURFACE-AT ?auto_4067 ?auto_4071 ) ( CLEAR ?auto_4067 ) ( IS-CRATE ?auto_4068 ) ( not ( = ?auto_4067 ?auto_4068 ) ) ( AVAILABLE ?auto_4070 ) ( ON ?auto_4067 ?auto_4066 ) ( not ( = ?auto_4066 ?auto_4067 ) ) ( not ( = ?auto_4066 ?auto_4068 ) ) ( TRUCK-AT ?auto_4073 ?auto_4069 ) ( not ( = ?auto_4069 ?auto_4071 ) ) ( HOIST-AT ?auto_4074 ?auto_4069 ) ( not ( = ?auto_4070 ?auto_4074 ) ) ( AVAILABLE ?auto_4074 ) ( SURFACE-AT ?auto_4068 ?auto_4069 ) ( ON ?auto_4068 ?auto_4072 ) ( CLEAR ?auto_4068 ) ( not ( = ?auto_4067 ?auto_4072 ) ) ( not ( = ?auto_4068 ?auto_4072 ) ) ( not ( = ?auto_4066 ?auto_4072 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4067 ?auto_4068 )
      ( MAKE-2CRATE-VERIFY ?auto_4066 ?auto_4067 ?auto_4068 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4075 - SURFACE
      ?auto_4076 - SURFACE
      ?auto_4077 - SURFACE
      ?auto_4078 - SURFACE
    )
    :vars
    (
      ?auto_4081 - HOIST
      ?auto_4084 - PLACE
      ?auto_4080 - TRUCK
      ?auto_4083 - PLACE
      ?auto_4079 - HOIST
      ?auto_4082 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4081 ?auto_4084 ) ( SURFACE-AT ?auto_4077 ?auto_4084 ) ( CLEAR ?auto_4077 ) ( IS-CRATE ?auto_4078 ) ( not ( = ?auto_4077 ?auto_4078 ) ) ( AVAILABLE ?auto_4081 ) ( ON ?auto_4077 ?auto_4076 ) ( not ( = ?auto_4076 ?auto_4077 ) ) ( not ( = ?auto_4076 ?auto_4078 ) ) ( TRUCK-AT ?auto_4080 ?auto_4083 ) ( not ( = ?auto_4083 ?auto_4084 ) ) ( HOIST-AT ?auto_4079 ?auto_4083 ) ( not ( = ?auto_4081 ?auto_4079 ) ) ( AVAILABLE ?auto_4079 ) ( SURFACE-AT ?auto_4078 ?auto_4083 ) ( ON ?auto_4078 ?auto_4082 ) ( CLEAR ?auto_4078 ) ( not ( = ?auto_4077 ?auto_4082 ) ) ( not ( = ?auto_4078 ?auto_4082 ) ) ( not ( = ?auto_4076 ?auto_4082 ) ) ( ON ?auto_4076 ?auto_4075 ) ( not ( = ?auto_4075 ?auto_4076 ) ) ( not ( = ?auto_4075 ?auto_4077 ) ) ( not ( = ?auto_4075 ?auto_4078 ) ) ( not ( = ?auto_4075 ?auto_4082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4076 ?auto_4077 ?auto_4078 )
      ( MAKE-3CRATE-VERIFY ?auto_4075 ?auto_4076 ?auto_4077 ?auto_4078 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4085 - SURFACE
      ?auto_4086 - SURFACE
    )
    :vars
    (
      ?auto_4090 - HOIST
      ?auto_4093 - PLACE
      ?auto_4087 - SURFACE
      ?auto_4092 - PLACE
      ?auto_4088 - HOIST
      ?auto_4091 - SURFACE
      ?auto_4089 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4090 ?auto_4093 ) ( SURFACE-AT ?auto_4085 ?auto_4093 ) ( CLEAR ?auto_4085 ) ( IS-CRATE ?auto_4086 ) ( not ( = ?auto_4085 ?auto_4086 ) ) ( AVAILABLE ?auto_4090 ) ( ON ?auto_4085 ?auto_4087 ) ( not ( = ?auto_4087 ?auto_4085 ) ) ( not ( = ?auto_4087 ?auto_4086 ) ) ( not ( = ?auto_4092 ?auto_4093 ) ) ( HOIST-AT ?auto_4088 ?auto_4092 ) ( not ( = ?auto_4090 ?auto_4088 ) ) ( AVAILABLE ?auto_4088 ) ( SURFACE-AT ?auto_4086 ?auto_4092 ) ( ON ?auto_4086 ?auto_4091 ) ( CLEAR ?auto_4086 ) ( not ( = ?auto_4085 ?auto_4091 ) ) ( not ( = ?auto_4086 ?auto_4091 ) ) ( not ( = ?auto_4087 ?auto_4091 ) ) ( TRUCK-AT ?auto_4089 ?auto_4093 ) )
    :subtasks
    ( ( !DRIVE ?auto_4089 ?auto_4093 ?auto_4092 )
      ( MAKE-2CRATE ?auto_4087 ?auto_4085 ?auto_4086 )
      ( MAKE-1CRATE-VERIFY ?auto_4085 ?auto_4086 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4094 - SURFACE
      ?auto_4095 - SURFACE
      ?auto_4096 - SURFACE
    )
    :vars
    (
      ?auto_4102 - HOIST
      ?auto_4100 - PLACE
      ?auto_4101 - PLACE
      ?auto_4098 - HOIST
      ?auto_4097 - SURFACE
      ?auto_4099 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4102 ?auto_4100 ) ( SURFACE-AT ?auto_4095 ?auto_4100 ) ( CLEAR ?auto_4095 ) ( IS-CRATE ?auto_4096 ) ( not ( = ?auto_4095 ?auto_4096 ) ) ( AVAILABLE ?auto_4102 ) ( ON ?auto_4095 ?auto_4094 ) ( not ( = ?auto_4094 ?auto_4095 ) ) ( not ( = ?auto_4094 ?auto_4096 ) ) ( not ( = ?auto_4101 ?auto_4100 ) ) ( HOIST-AT ?auto_4098 ?auto_4101 ) ( not ( = ?auto_4102 ?auto_4098 ) ) ( AVAILABLE ?auto_4098 ) ( SURFACE-AT ?auto_4096 ?auto_4101 ) ( ON ?auto_4096 ?auto_4097 ) ( CLEAR ?auto_4096 ) ( not ( = ?auto_4095 ?auto_4097 ) ) ( not ( = ?auto_4096 ?auto_4097 ) ) ( not ( = ?auto_4094 ?auto_4097 ) ) ( TRUCK-AT ?auto_4099 ?auto_4100 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4095 ?auto_4096 )
      ( MAKE-2CRATE-VERIFY ?auto_4094 ?auto_4095 ?auto_4096 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4103 - SURFACE
      ?auto_4104 - SURFACE
      ?auto_4105 - SURFACE
      ?auto_4106 - SURFACE
    )
    :vars
    (
      ?auto_4107 - HOIST
      ?auto_4112 - PLACE
      ?auto_4110 - PLACE
      ?auto_4111 - HOIST
      ?auto_4108 - SURFACE
      ?auto_4109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4107 ?auto_4112 ) ( SURFACE-AT ?auto_4105 ?auto_4112 ) ( CLEAR ?auto_4105 ) ( IS-CRATE ?auto_4106 ) ( not ( = ?auto_4105 ?auto_4106 ) ) ( AVAILABLE ?auto_4107 ) ( ON ?auto_4105 ?auto_4104 ) ( not ( = ?auto_4104 ?auto_4105 ) ) ( not ( = ?auto_4104 ?auto_4106 ) ) ( not ( = ?auto_4110 ?auto_4112 ) ) ( HOIST-AT ?auto_4111 ?auto_4110 ) ( not ( = ?auto_4107 ?auto_4111 ) ) ( AVAILABLE ?auto_4111 ) ( SURFACE-AT ?auto_4106 ?auto_4110 ) ( ON ?auto_4106 ?auto_4108 ) ( CLEAR ?auto_4106 ) ( not ( = ?auto_4105 ?auto_4108 ) ) ( not ( = ?auto_4106 ?auto_4108 ) ) ( not ( = ?auto_4104 ?auto_4108 ) ) ( TRUCK-AT ?auto_4109 ?auto_4112 ) ( ON ?auto_4104 ?auto_4103 ) ( not ( = ?auto_4103 ?auto_4104 ) ) ( not ( = ?auto_4103 ?auto_4105 ) ) ( not ( = ?auto_4103 ?auto_4106 ) ) ( not ( = ?auto_4103 ?auto_4108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4104 ?auto_4105 ?auto_4106 )
      ( MAKE-3CRATE-VERIFY ?auto_4103 ?auto_4104 ?auto_4105 ?auto_4106 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4113 - SURFACE
      ?auto_4114 - SURFACE
    )
    :vars
    (
      ?auto_4115 - HOIST
      ?auto_4120 - PLACE
      ?auto_4121 - SURFACE
      ?auto_4118 - PLACE
      ?auto_4119 - HOIST
      ?auto_4116 - SURFACE
      ?auto_4117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4115 ?auto_4120 ) ( IS-CRATE ?auto_4114 ) ( not ( = ?auto_4113 ?auto_4114 ) ) ( not ( = ?auto_4121 ?auto_4113 ) ) ( not ( = ?auto_4121 ?auto_4114 ) ) ( not ( = ?auto_4118 ?auto_4120 ) ) ( HOIST-AT ?auto_4119 ?auto_4118 ) ( not ( = ?auto_4115 ?auto_4119 ) ) ( AVAILABLE ?auto_4119 ) ( SURFACE-AT ?auto_4114 ?auto_4118 ) ( ON ?auto_4114 ?auto_4116 ) ( CLEAR ?auto_4114 ) ( not ( = ?auto_4113 ?auto_4116 ) ) ( not ( = ?auto_4114 ?auto_4116 ) ) ( not ( = ?auto_4121 ?auto_4116 ) ) ( TRUCK-AT ?auto_4117 ?auto_4120 ) ( SURFACE-AT ?auto_4121 ?auto_4120 ) ( CLEAR ?auto_4121 ) ( LIFTING ?auto_4115 ?auto_4113 ) ( IS-CRATE ?auto_4113 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4121 ?auto_4113 )
      ( MAKE-2CRATE ?auto_4121 ?auto_4113 ?auto_4114 )
      ( MAKE-1CRATE-VERIFY ?auto_4113 ?auto_4114 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4122 - SURFACE
      ?auto_4123 - SURFACE
      ?auto_4124 - SURFACE
    )
    :vars
    (
      ?auto_4128 - HOIST
      ?auto_4130 - PLACE
      ?auto_4127 - PLACE
      ?auto_4126 - HOIST
      ?auto_4125 - SURFACE
      ?auto_4129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4128 ?auto_4130 ) ( IS-CRATE ?auto_4124 ) ( not ( = ?auto_4123 ?auto_4124 ) ) ( not ( = ?auto_4122 ?auto_4123 ) ) ( not ( = ?auto_4122 ?auto_4124 ) ) ( not ( = ?auto_4127 ?auto_4130 ) ) ( HOIST-AT ?auto_4126 ?auto_4127 ) ( not ( = ?auto_4128 ?auto_4126 ) ) ( AVAILABLE ?auto_4126 ) ( SURFACE-AT ?auto_4124 ?auto_4127 ) ( ON ?auto_4124 ?auto_4125 ) ( CLEAR ?auto_4124 ) ( not ( = ?auto_4123 ?auto_4125 ) ) ( not ( = ?auto_4124 ?auto_4125 ) ) ( not ( = ?auto_4122 ?auto_4125 ) ) ( TRUCK-AT ?auto_4129 ?auto_4130 ) ( SURFACE-AT ?auto_4122 ?auto_4130 ) ( CLEAR ?auto_4122 ) ( LIFTING ?auto_4128 ?auto_4123 ) ( IS-CRATE ?auto_4123 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4123 ?auto_4124 )
      ( MAKE-2CRATE-VERIFY ?auto_4122 ?auto_4123 ?auto_4124 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4131 - SURFACE
      ?auto_4132 - SURFACE
      ?auto_4133 - SURFACE
      ?auto_4134 - SURFACE
    )
    :vars
    (
      ?auto_4139 - HOIST
      ?auto_4137 - PLACE
      ?auto_4135 - PLACE
      ?auto_4138 - HOIST
      ?auto_4136 - SURFACE
      ?auto_4140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4139 ?auto_4137 ) ( IS-CRATE ?auto_4134 ) ( not ( = ?auto_4133 ?auto_4134 ) ) ( not ( = ?auto_4132 ?auto_4133 ) ) ( not ( = ?auto_4132 ?auto_4134 ) ) ( not ( = ?auto_4135 ?auto_4137 ) ) ( HOIST-AT ?auto_4138 ?auto_4135 ) ( not ( = ?auto_4139 ?auto_4138 ) ) ( AVAILABLE ?auto_4138 ) ( SURFACE-AT ?auto_4134 ?auto_4135 ) ( ON ?auto_4134 ?auto_4136 ) ( CLEAR ?auto_4134 ) ( not ( = ?auto_4133 ?auto_4136 ) ) ( not ( = ?auto_4134 ?auto_4136 ) ) ( not ( = ?auto_4132 ?auto_4136 ) ) ( TRUCK-AT ?auto_4140 ?auto_4137 ) ( SURFACE-AT ?auto_4132 ?auto_4137 ) ( CLEAR ?auto_4132 ) ( LIFTING ?auto_4139 ?auto_4133 ) ( IS-CRATE ?auto_4133 ) ( ON ?auto_4132 ?auto_4131 ) ( not ( = ?auto_4131 ?auto_4132 ) ) ( not ( = ?auto_4131 ?auto_4133 ) ) ( not ( = ?auto_4131 ?auto_4134 ) ) ( not ( = ?auto_4131 ?auto_4136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4132 ?auto_4133 ?auto_4134 )
      ( MAKE-3CRATE-VERIFY ?auto_4131 ?auto_4132 ?auto_4133 ?auto_4134 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4141 - SURFACE
      ?auto_4142 - SURFACE
    )
    :vars
    (
      ?auto_4147 - HOIST
      ?auto_4145 - PLACE
      ?auto_4149 - SURFACE
      ?auto_4143 - PLACE
      ?auto_4146 - HOIST
      ?auto_4144 - SURFACE
      ?auto_4148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4147 ?auto_4145 ) ( IS-CRATE ?auto_4142 ) ( not ( = ?auto_4141 ?auto_4142 ) ) ( not ( = ?auto_4149 ?auto_4141 ) ) ( not ( = ?auto_4149 ?auto_4142 ) ) ( not ( = ?auto_4143 ?auto_4145 ) ) ( HOIST-AT ?auto_4146 ?auto_4143 ) ( not ( = ?auto_4147 ?auto_4146 ) ) ( AVAILABLE ?auto_4146 ) ( SURFACE-AT ?auto_4142 ?auto_4143 ) ( ON ?auto_4142 ?auto_4144 ) ( CLEAR ?auto_4142 ) ( not ( = ?auto_4141 ?auto_4144 ) ) ( not ( = ?auto_4142 ?auto_4144 ) ) ( not ( = ?auto_4149 ?auto_4144 ) ) ( TRUCK-AT ?auto_4148 ?auto_4145 ) ( SURFACE-AT ?auto_4149 ?auto_4145 ) ( CLEAR ?auto_4149 ) ( IS-CRATE ?auto_4141 ) ( AVAILABLE ?auto_4147 ) ( IN ?auto_4141 ?auto_4148 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4147 ?auto_4141 ?auto_4148 ?auto_4145 )
      ( MAKE-2CRATE ?auto_4149 ?auto_4141 ?auto_4142 )
      ( MAKE-1CRATE-VERIFY ?auto_4141 ?auto_4142 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4150 - SURFACE
      ?auto_4151 - SURFACE
      ?auto_4152 - SURFACE
    )
    :vars
    (
      ?auto_4153 - HOIST
      ?auto_4157 - PLACE
      ?auto_4154 - PLACE
      ?auto_4158 - HOIST
      ?auto_4156 - SURFACE
      ?auto_4155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4153 ?auto_4157 ) ( IS-CRATE ?auto_4152 ) ( not ( = ?auto_4151 ?auto_4152 ) ) ( not ( = ?auto_4150 ?auto_4151 ) ) ( not ( = ?auto_4150 ?auto_4152 ) ) ( not ( = ?auto_4154 ?auto_4157 ) ) ( HOIST-AT ?auto_4158 ?auto_4154 ) ( not ( = ?auto_4153 ?auto_4158 ) ) ( AVAILABLE ?auto_4158 ) ( SURFACE-AT ?auto_4152 ?auto_4154 ) ( ON ?auto_4152 ?auto_4156 ) ( CLEAR ?auto_4152 ) ( not ( = ?auto_4151 ?auto_4156 ) ) ( not ( = ?auto_4152 ?auto_4156 ) ) ( not ( = ?auto_4150 ?auto_4156 ) ) ( TRUCK-AT ?auto_4155 ?auto_4157 ) ( SURFACE-AT ?auto_4150 ?auto_4157 ) ( CLEAR ?auto_4150 ) ( IS-CRATE ?auto_4151 ) ( AVAILABLE ?auto_4153 ) ( IN ?auto_4151 ?auto_4155 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4151 ?auto_4152 )
      ( MAKE-2CRATE-VERIFY ?auto_4150 ?auto_4151 ?auto_4152 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4159 - SURFACE
      ?auto_4160 - SURFACE
      ?auto_4161 - SURFACE
      ?auto_4162 - SURFACE
    )
    :vars
    (
      ?auto_4165 - HOIST
      ?auto_4167 - PLACE
      ?auto_4166 - PLACE
      ?auto_4163 - HOIST
      ?auto_4164 - SURFACE
      ?auto_4168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4165 ?auto_4167 ) ( IS-CRATE ?auto_4162 ) ( not ( = ?auto_4161 ?auto_4162 ) ) ( not ( = ?auto_4160 ?auto_4161 ) ) ( not ( = ?auto_4160 ?auto_4162 ) ) ( not ( = ?auto_4166 ?auto_4167 ) ) ( HOIST-AT ?auto_4163 ?auto_4166 ) ( not ( = ?auto_4165 ?auto_4163 ) ) ( AVAILABLE ?auto_4163 ) ( SURFACE-AT ?auto_4162 ?auto_4166 ) ( ON ?auto_4162 ?auto_4164 ) ( CLEAR ?auto_4162 ) ( not ( = ?auto_4161 ?auto_4164 ) ) ( not ( = ?auto_4162 ?auto_4164 ) ) ( not ( = ?auto_4160 ?auto_4164 ) ) ( TRUCK-AT ?auto_4168 ?auto_4167 ) ( SURFACE-AT ?auto_4160 ?auto_4167 ) ( CLEAR ?auto_4160 ) ( IS-CRATE ?auto_4161 ) ( AVAILABLE ?auto_4165 ) ( IN ?auto_4161 ?auto_4168 ) ( ON ?auto_4160 ?auto_4159 ) ( not ( = ?auto_4159 ?auto_4160 ) ) ( not ( = ?auto_4159 ?auto_4161 ) ) ( not ( = ?auto_4159 ?auto_4162 ) ) ( not ( = ?auto_4159 ?auto_4164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4160 ?auto_4161 ?auto_4162 )
      ( MAKE-3CRATE-VERIFY ?auto_4159 ?auto_4160 ?auto_4161 ?auto_4162 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4169 - SURFACE
      ?auto_4170 - SURFACE
    )
    :vars
    (
      ?auto_4174 - HOIST
      ?auto_4176 - PLACE
      ?auto_4171 - SURFACE
      ?auto_4175 - PLACE
      ?auto_4172 - HOIST
      ?auto_4173 - SURFACE
      ?auto_4177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4174 ?auto_4176 ) ( IS-CRATE ?auto_4170 ) ( not ( = ?auto_4169 ?auto_4170 ) ) ( not ( = ?auto_4171 ?auto_4169 ) ) ( not ( = ?auto_4171 ?auto_4170 ) ) ( not ( = ?auto_4175 ?auto_4176 ) ) ( HOIST-AT ?auto_4172 ?auto_4175 ) ( not ( = ?auto_4174 ?auto_4172 ) ) ( AVAILABLE ?auto_4172 ) ( SURFACE-AT ?auto_4170 ?auto_4175 ) ( ON ?auto_4170 ?auto_4173 ) ( CLEAR ?auto_4170 ) ( not ( = ?auto_4169 ?auto_4173 ) ) ( not ( = ?auto_4170 ?auto_4173 ) ) ( not ( = ?auto_4171 ?auto_4173 ) ) ( SURFACE-AT ?auto_4171 ?auto_4176 ) ( CLEAR ?auto_4171 ) ( IS-CRATE ?auto_4169 ) ( AVAILABLE ?auto_4174 ) ( IN ?auto_4169 ?auto_4177 ) ( TRUCK-AT ?auto_4177 ?auto_4175 ) )
    :subtasks
    ( ( !DRIVE ?auto_4177 ?auto_4175 ?auto_4176 )
      ( MAKE-2CRATE ?auto_4171 ?auto_4169 ?auto_4170 )
      ( MAKE-1CRATE-VERIFY ?auto_4169 ?auto_4170 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4178 - SURFACE
      ?auto_4179 - SURFACE
      ?auto_4180 - SURFACE
    )
    :vars
    (
      ?auto_4186 - HOIST
      ?auto_4181 - PLACE
      ?auto_4183 - PLACE
      ?auto_4185 - HOIST
      ?auto_4184 - SURFACE
      ?auto_4182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4186 ?auto_4181 ) ( IS-CRATE ?auto_4180 ) ( not ( = ?auto_4179 ?auto_4180 ) ) ( not ( = ?auto_4178 ?auto_4179 ) ) ( not ( = ?auto_4178 ?auto_4180 ) ) ( not ( = ?auto_4183 ?auto_4181 ) ) ( HOIST-AT ?auto_4185 ?auto_4183 ) ( not ( = ?auto_4186 ?auto_4185 ) ) ( AVAILABLE ?auto_4185 ) ( SURFACE-AT ?auto_4180 ?auto_4183 ) ( ON ?auto_4180 ?auto_4184 ) ( CLEAR ?auto_4180 ) ( not ( = ?auto_4179 ?auto_4184 ) ) ( not ( = ?auto_4180 ?auto_4184 ) ) ( not ( = ?auto_4178 ?auto_4184 ) ) ( SURFACE-AT ?auto_4178 ?auto_4181 ) ( CLEAR ?auto_4178 ) ( IS-CRATE ?auto_4179 ) ( AVAILABLE ?auto_4186 ) ( IN ?auto_4179 ?auto_4182 ) ( TRUCK-AT ?auto_4182 ?auto_4183 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4179 ?auto_4180 )
      ( MAKE-2CRATE-VERIFY ?auto_4178 ?auto_4179 ?auto_4180 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4187 - SURFACE
      ?auto_4188 - SURFACE
      ?auto_4189 - SURFACE
      ?auto_4190 - SURFACE
    )
    :vars
    (
      ?auto_4191 - HOIST
      ?auto_4192 - PLACE
      ?auto_4196 - PLACE
      ?auto_4195 - HOIST
      ?auto_4194 - SURFACE
      ?auto_4193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4191 ?auto_4192 ) ( IS-CRATE ?auto_4190 ) ( not ( = ?auto_4189 ?auto_4190 ) ) ( not ( = ?auto_4188 ?auto_4189 ) ) ( not ( = ?auto_4188 ?auto_4190 ) ) ( not ( = ?auto_4196 ?auto_4192 ) ) ( HOIST-AT ?auto_4195 ?auto_4196 ) ( not ( = ?auto_4191 ?auto_4195 ) ) ( AVAILABLE ?auto_4195 ) ( SURFACE-AT ?auto_4190 ?auto_4196 ) ( ON ?auto_4190 ?auto_4194 ) ( CLEAR ?auto_4190 ) ( not ( = ?auto_4189 ?auto_4194 ) ) ( not ( = ?auto_4190 ?auto_4194 ) ) ( not ( = ?auto_4188 ?auto_4194 ) ) ( SURFACE-AT ?auto_4188 ?auto_4192 ) ( CLEAR ?auto_4188 ) ( IS-CRATE ?auto_4189 ) ( AVAILABLE ?auto_4191 ) ( IN ?auto_4189 ?auto_4193 ) ( TRUCK-AT ?auto_4193 ?auto_4196 ) ( ON ?auto_4188 ?auto_4187 ) ( not ( = ?auto_4187 ?auto_4188 ) ) ( not ( = ?auto_4187 ?auto_4189 ) ) ( not ( = ?auto_4187 ?auto_4190 ) ) ( not ( = ?auto_4187 ?auto_4194 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4188 ?auto_4189 ?auto_4190 )
      ( MAKE-3CRATE-VERIFY ?auto_4187 ?auto_4188 ?auto_4189 ?auto_4190 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4197 - SURFACE
      ?auto_4198 - SURFACE
    )
    :vars
    (
      ?auto_4199 - HOIST
      ?auto_4201 - PLACE
      ?auto_4200 - SURFACE
      ?auto_4205 - PLACE
      ?auto_4204 - HOIST
      ?auto_4203 - SURFACE
      ?auto_4202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4199 ?auto_4201 ) ( IS-CRATE ?auto_4198 ) ( not ( = ?auto_4197 ?auto_4198 ) ) ( not ( = ?auto_4200 ?auto_4197 ) ) ( not ( = ?auto_4200 ?auto_4198 ) ) ( not ( = ?auto_4205 ?auto_4201 ) ) ( HOIST-AT ?auto_4204 ?auto_4205 ) ( not ( = ?auto_4199 ?auto_4204 ) ) ( SURFACE-AT ?auto_4198 ?auto_4205 ) ( ON ?auto_4198 ?auto_4203 ) ( CLEAR ?auto_4198 ) ( not ( = ?auto_4197 ?auto_4203 ) ) ( not ( = ?auto_4198 ?auto_4203 ) ) ( not ( = ?auto_4200 ?auto_4203 ) ) ( SURFACE-AT ?auto_4200 ?auto_4201 ) ( CLEAR ?auto_4200 ) ( IS-CRATE ?auto_4197 ) ( AVAILABLE ?auto_4199 ) ( TRUCK-AT ?auto_4202 ?auto_4205 ) ( LIFTING ?auto_4204 ?auto_4197 ) )
    :subtasks
    ( ( !LOAD ?auto_4204 ?auto_4197 ?auto_4202 ?auto_4205 )
      ( MAKE-2CRATE ?auto_4200 ?auto_4197 ?auto_4198 )
      ( MAKE-1CRATE-VERIFY ?auto_4197 ?auto_4198 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4206 - SURFACE
      ?auto_4207 - SURFACE
      ?auto_4208 - SURFACE
    )
    :vars
    (
      ?auto_4213 - HOIST
      ?auto_4209 - PLACE
      ?auto_4212 - PLACE
      ?auto_4210 - HOIST
      ?auto_4211 - SURFACE
      ?auto_4214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4213 ?auto_4209 ) ( IS-CRATE ?auto_4208 ) ( not ( = ?auto_4207 ?auto_4208 ) ) ( not ( = ?auto_4206 ?auto_4207 ) ) ( not ( = ?auto_4206 ?auto_4208 ) ) ( not ( = ?auto_4212 ?auto_4209 ) ) ( HOIST-AT ?auto_4210 ?auto_4212 ) ( not ( = ?auto_4213 ?auto_4210 ) ) ( SURFACE-AT ?auto_4208 ?auto_4212 ) ( ON ?auto_4208 ?auto_4211 ) ( CLEAR ?auto_4208 ) ( not ( = ?auto_4207 ?auto_4211 ) ) ( not ( = ?auto_4208 ?auto_4211 ) ) ( not ( = ?auto_4206 ?auto_4211 ) ) ( SURFACE-AT ?auto_4206 ?auto_4209 ) ( CLEAR ?auto_4206 ) ( IS-CRATE ?auto_4207 ) ( AVAILABLE ?auto_4213 ) ( TRUCK-AT ?auto_4214 ?auto_4212 ) ( LIFTING ?auto_4210 ?auto_4207 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4207 ?auto_4208 )
      ( MAKE-2CRATE-VERIFY ?auto_4206 ?auto_4207 ?auto_4208 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4215 - SURFACE
      ?auto_4216 - SURFACE
      ?auto_4217 - SURFACE
      ?auto_4218 - SURFACE
    )
    :vars
    (
      ?auto_4219 - HOIST
      ?auto_4220 - PLACE
      ?auto_4221 - PLACE
      ?auto_4223 - HOIST
      ?auto_4222 - SURFACE
      ?auto_4224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4219 ?auto_4220 ) ( IS-CRATE ?auto_4218 ) ( not ( = ?auto_4217 ?auto_4218 ) ) ( not ( = ?auto_4216 ?auto_4217 ) ) ( not ( = ?auto_4216 ?auto_4218 ) ) ( not ( = ?auto_4221 ?auto_4220 ) ) ( HOIST-AT ?auto_4223 ?auto_4221 ) ( not ( = ?auto_4219 ?auto_4223 ) ) ( SURFACE-AT ?auto_4218 ?auto_4221 ) ( ON ?auto_4218 ?auto_4222 ) ( CLEAR ?auto_4218 ) ( not ( = ?auto_4217 ?auto_4222 ) ) ( not ( = ?auto_4218 ?auto_4222 ) ) ( not ( = ?auto_4216 ?auto_4222 ) ) ( SURFACE-AT ?auto_4216 ?auto_4220 ) ( CLEAR ?auto_4216 ) ( IS-CRATE ?auto_4217 ) ( AVAILABLE ?auto_4219 ) ( TRUCK-AT ?auto_4224 ?auto_4221 ) ( LIFTING ?auto_4223 ?auto_4217 ) ( ON ?auto_4216 ?auto_4215 ) ( not ( = ?auto_4215 ?auto_4216 ) ) ( not ( = ?auto_4215 ?auto_4217 ) ) ( not ( = ?auto_4215 ?auto_4218 ) ) ( not ( = ?auto_4215 ?auto_4222 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4216 ?auto_4217 ?auto_4218 )
      ( MAKE-3CRATE-VERIFY ?auto_4215 ?auto_4216 ?auto_4217 ?auto_4218 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4225 - SURFACE
      ?auto_4226 - SURFACE
    )
    :vars
    (
      ?auto_4227 - HOIST
      ?auto_4228 - PLACE
      ?auto_4233 - SURFACE
      ?auto_4229 - PLACE
      ?auto_4231 - HOIST
      ?auto_4230 - SURFACE
      ?auto_4232 - TRUCK
      ?auto_4234 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4227 ?auto_4228 ) ( IS-CRATE ?auto_4226 ) ( not ( = ?auto_4225 ?auto_4226 ) ) ( not ( = ?auto_4233 ?auto_4225 ) ) ( not ( = ?auto_4233 ?auto_4226 ) ) ( not ( = ?auto_4229 ?auto_4228 ) ) ( HOIST-AT ?auto_4231 ?auto_4229 ) ( not ( = ?auto_4227 ?auto_4231 ) ) ( SURFACE-AT ?auto_4226 ?auto_4229 ) ( ON ?auto_4226 ?auto_4230 ) ( CLEAR ?auto_4226 ) ( not ( = ?auto_4225 ?auto_4230 ) ) ( not ( = ?auto_4226 ?auto_4230 ) ) ( not ( = ?auto_4233 ?auto_4230 ) ) ( SURFACE-AT ?auto_4233 ?auto_4228 ) ( CLEAR ?auto_4233 ) ( IS-CRATE ?auto_4225 ) ( AVAILABLE ?auto_4227 ) ( TRUCK-AT ?auto_4232 ?auto_4229 ) ( AVAILABLE ?auto_4231 ) ( SURFACE-AT ?auto_4225 ?auto_4229 ) ( ON ?auto_4225 ?auto_4234 ) ( CLEAR ?auto_4225 ) ( not ( = ?auto_4225 ?auto_4234 ) ) ( not ( = ?auto_4226 ?auto_4234 ) ) ( not ( = ?auto_4233 ?auto_4234 ) ) ( not ( = ?auto_4230 ?auto_4234 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4231 ?auto_4225 ?auto_4234 ?auto_4229 )
      ( MAKE-2CRATE ?auto_4233 ?auto_4225 ?auto_4226 )
      ( MAKE-1CRATE-VERIFY ?auto_4225 ?auto_4226 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4235 - SURFACE
      ?auto_4236 - SURFACE
      ?auto_4237 - SURFACE
    )
    :vars
    (
      ?auto_4238 - HOIST
      ?auto_4239 - PLACE
      ?auto_4240 - PLACE
      ?auto_4244 - HOIST
      ?auto_4243 - SURFACE
      ?auto_4241 - TRUCK
      ?auto_4242 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4238 ?auto_4239 ) ( IS-CRATE ?auto_4237 ) ( not ( = ?auto_4236 ?auto_4237 ) ) ( not ( = ?auto_4235 ?auto_4236 ) ) ( not ( = ?auto_4235 ?auto_4237 ) ) ( not ( = ?auto_4240 ?auto_4239 ) ) ( HOIST-AT ?auto_4244 ?auto_4240 ) ( not ( = ?auto_4238 ?auto_4244 ) ) ( SURFACE-AT ?auto_4237 ?auto_4240 ) ( ON ?auto_4237 ?auto_4243 ) ( CLEAR ?auto_4237 ) ( not ( = ?auto_4236 ?auto_4243 ) ) ( not ( = ?auto_4237 ?auto_4243 ) ) ( not ( = ?auto_4235 ?auto_4243 ) ) ( SURFACE-AT ?auto_4235 ?auto_4239 ) ( CLEAR ?auto_4235 ) ( IS-CRATE ?auto_4236 ) ( AVAILABLE ?auto_4238 ) ( TRUCK-AT ?auto_4241 ?auto_4240 ) ( AVAILABLE ?auto_4244 ) ( SURFACE-AT ?auto_4236 ?auto_4240 ) ( ON ?auto_4236 ?auto_4242 ) ( CLEAR ?auto_4236 ) ( not ( = ?auto_4236 ?auto_4242 ) ) ( not ( = ?auto_4237 ?auto_4242 ) ) ( not ( = ?auto_4235 ?auto_4242 ) ) ( not ( = ?auto_4243 ?auto_4242 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4236 ?auto_4237 )
      ( MAKE-2CRATE-VERIFY ?auto_4235 ?auto_4236 ?auto_4237 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4245 - SURFACE
      ?auto_4246 - SURFACE
      ?auto_4247 - SURFACE
      ?auto_4248 - SURFACE
    )
    :vars
    (
      ?auto_4252 - HOIST
      ?auto_4250 - PLACE
      ?auto_4254 - PLACE
      ?auto_4251 - HOIST
      ?auto_4253 - SURFACE
      ?auto_4255 - TRUCK
      ?auto_4249 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4252 ?auto_4250 ) ( IS-CRATE ?auto_4248 ) ( not ( = ?auto_4247 ?auto_4248 ) ) ( not ( = ?auto_4246 ?auto_4247 ) ) ( not ( = ?auto_4246 ?auto_4248 ) ) ( not ( = ?auto_4254 ?auto_4250 ) ) ( HOIST-AT ?auto_4251 ?auto_4254 ) ( not ( = ?auto_4252 ?auto_4251 ) ) ( SURFACE-AT ?auto_4248 ?auto_4254 ) ( ON ?auto_4248 ?auto_4253 ) ( CLEAR ?auto_4248 ) ( not ( = ?auto_4247 ?auto_4253 ) ) ( not ( = ?auto_4248 ?auto_4253 ) ) ( not ( = ?auto_4246 ?auto_4253 ) ) ( SURFACE-AT ?auto_4246 ?auto_4250 ) ( CLEAR ?auto_4246 ) ( IS-CRATE ?auto_4247 ) ( AVAILABLE ?auto_4252 ) ( TRUCK-AT ?auto_4255 ?auto_4254 ) ( AVAILABLE ?auto_4251 ) ( SURFACE-AT ?auto_4247 ?auto_4254 ) ( ON ?auto_4247 ?auto_4249 ) ( CLEAR ?auto_4247 ) ( not ( = ?auto_4247 ?auto_4249 ) ) ( not ( = ?auto_4248 ?auto_4249 ) ) ( not ( = ?auto_4246 ?auto_4249 ) ) ( not ( = ?auto_4253 ?auto_4249 ) ) ( ON ?auto_4246 ?auto_4245 ) ( not ( = ?auto_4245 ?auto_4246 ) ) ( not ( = ?auto_4245 ?auto_4247 ) ) ( not ( = ?auto_4245 ?auto_4248 ) ) ( not ( = ?auto_4245 ?auto_4253 ) ) ( not ( = ?auto_4245 ?auto_4249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4246 ?auto_4247 ?auto_4248 )
      ( MAKE-3CRATE-VERIFY ?auto_4245 ?auto_4246 ?auto_4247 ?auto_4248 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4256 - SURFACE
      ?auto_4257 - SURFACE
    )
    :vars
    (
      ?auto_4261 - HOIST
      ?auto_4259 - PLACE
      ?auto_4264 - SURFACE
      ?auto_4263 - PLACE
      ?auto_4260 - HOIST
      ?auto_4262 - SURFACE
      ?auto_4258 - SURFACE
      ?auto_4265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4261 ?auto_4259 ) ( IS-CRATE ?auto_4257 ) ( not ( = ?auto_4256 ?auto_4257 ) ) ( not ( = ?auto_4264 ?auto_4256 ) ) ( not ( = ?auto_4264 ?auto_4257 ) ) ( not ( = ?auto_4263 ?auto_4259 ) ) ( HOIST-AT ?auto_4260 ?auto_4263 ) ( not ( = ?auto_4261 ?auto_4260 ) ) ( SURFACE-AT ?auto_4257 ?auto_4263 ) ( ON ?auto_4257 ?auto_4262 ) ( CLEAR ?auto_4257 ) ( not ( = ?auto_4256 ?auto_4262 ) ) ( not ( = ?auto_4257 ?auto_4262 ) ) ( not ( = ?auto_4264 ?auto_4262 ) ) ( SURFACE-AT ?auto_4264 ?auto_4259 ) ( CLEAR ?auto_4264 ) ( IS-CRATE ?auto_4256 ) ( AVAILABLE ?auto_4261 ) ( AVAILABLE ?auto_4260 ) ( SURFACE-AT ?auto_4256 ?auto_4263 ) ( ON ?auto_4256 ?auto_4258 ) ( CLEAR ?auto_4256 ) ( not ( = ?auto_4256 ?auto_4258 ) ) ( not ( = ?auto_4257 ?auto_4258 ) ) ( not ( = ?auto_4264 ?auto_4258 ) ) ( not ( = ?auto_4262 ?auto_4258 ) ) ( TRUCK-AT ?auto_4265 ?auto_4259 ) )
    :subtasks
    ( ( !DRIVE ?auto_4265 ?auto_4259 ?auto_4263 )
      ( MAKE-2CRATE ?auto_4264 ?auto_4256 ?auto_4257 )
      ( MAKE-1CRATE-VERIFY ?auto_4256 ?auto_4257 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4266 - SURFACE
      ?auto_4267 - SURFACE
      ?auto_4268 - SURFACE
    )
    :vars
    (
      ?auto_4269 - HOIST
      ?auto_4271 - PLACE
      ?auto_4270 - PLACE
      ?auto_4274 - HOIST
      ?auto_4273 - SURFACE
      ?auto_4272 - SURFACE
      ?auto_4275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4269 ?auto_4271 ) ( IS-CRATE ?auto_4268 ) ( not ( = ?auto_4267 ?auto_4268 ) ) ( not ( = ?auto_4266 ?auto_4267 ) ) ( not ( = ?auto_4266 ?auto_4268 ) ) ( not ( = ?auto_4270 ?auto_4271 ) ) ( HOIST-AT ?auto_4274 ?auto_4270 ) ( not ( = ?auto_4269 ?auto_4274 ) ) ( SURFACE-AT ?auto_4268 ?auto_4270 ) ( ON ?auto_4268 ?auto_4273 ) ( CLEAR ?auto_4268 ) ( not ( = ?auto_4267 ?auto_4273 ) ) ( not ( = ?auto_4268 ?auto_4273 ) ) ( not ( = ?auto_4266 ?auto_4273 ) ) ( SURFACE-AT ?auto_4266 ?auto_4271 ) ( CLEAR ?auto_4266 ) ( IS-CRATE ?auto_4267 ) ( AVAILABLE ?auto_4269 ) ( AVAILABLE ?auto_4274 ) ( SURFACE-AT ?auto_4267 ?auto_4270 ) ( ON ?auto_4267 ?auto_4272 ) ( CLEAR ?auto_4267 ) ( not ( = ?auto_4267 ?auto_4272 ) ) ( not ( = ?auto_4268 ?auto_4272 ) ) ( not ( = ?auto_4266 ?auto_4272 ) ) ( not ( = ?auto_4273 ?auto_4272 ) ) ( TRUCK-AT ?auto_4275 ?auto_4271 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4267 ?auto_4268 )
      ( MAKE-2CRATE-VERIFY ?auto_4266 ?auto_4267 ?auto_4268 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4276 - SURFACE
      ?auto_4277 - SURFACE
      ?auto_4278 - SURFACE
      ?auto_4279 - SURFACE
    )
    :vars
    (
      ?auto_4283 - HOIST
      ?auto_4280 - PLACE
      ?auto_4281 - PLACE
      ?auto_4282 - HOIST
      ?auto_4285 - SURFACE
      ?auto_4284 - SURFACE
      ?auto_4286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4283 ?auto_4280 ) ( IS-CRATE ?auto_4279 ) ( not ( = ?auto_4278 ?auto_4279 ) ) ( not ( = ?auto_4277 ?auto_4278 ) ) ( not ( = ?auto_4277 ?auto_4279 ) ) ( not ( = ?auto_4281 ?auto_4280 ) ) ( HOIST-AT ?auto_4282 ?auto_4281 ) ( not ( = ?auto_4283 ?auto_4282 ) ) ( SURFACE-AT ?auto_4279 ?auto_4281 ) ( ON ?auto_4279 ?auto_4285 ) ( CLEAR ?auto_4279 ) ( not ( = ?auto_4278 ?auto_4285 ) ) ( not ( = ?auto_4279 ?auto_4285 ) ) ( not ( = ?auto_4277 ?auto_4285 ) ) ( SURFACE-AT ?auto_4277 ?auto_4280 ) ( CLEAR ?auto_4277 ) ( IS-CRATE ?auto_4278 ) ( AVAILABLE ?auto_4283 ) ( AVAILABLE ?auto_4282 ) ( SURFACE-AT ?auto_4278 ?auto_4281 ) ( ON ?auto_4278 ?auto_4284 ) ( CLEAR ?auto_4278 ) ( not ( = ?auto_4278 ?auto_4284 ) ) ( not ( = ?auto_4279 ?auto_4284 ) ) ( not ( = ?auto_4277 ?auto_4284 ) ) ( not ( = ?auto_4285 ?auto_4284 ) ) ( TRUCK-AT ?auto_4286 ?auto_4280 ) ( ON ?auto_4277 ?auto_4276 ) ( not ( = ?auto_4276 ?auto_4277 ) ) ( not ( = ?auto_4276 ?auto_4278 ) ) ( not ( = ?auto_4276 ?auto_4279 ) ) ( not ( = ?auto_4276 ?auto_4285 ) ) ( not ( = ?auto_4276 ?auto_4284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4277 ?auto_4278 ?auto_4279 )
      ( MAKE-3CRATE-VERIFY ?auto_4276 ?auto_4277 ?auto_4278 ?auto_4279 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4287 - SURFACE
      ?auto_4288 - SURFACE
    )
    :vars
    (
      ?auto_4293 - HOIST
      ?auto_4290 - PLACE
      ?auto_4289 - SURFACE
      ?auto_4291 - PLACE
      ?auto_4292 - HOIST
      ?auto_4295 - SURFACE
      ?auto_4294 - SURFACE
      ?auto_4296 - TRUCK
      ?auto_4297 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4293 ?auto_4290 ) ( IS-CRATE ?auto_4288 ) ( not ( = ?auto_4287 ?auto_4288 ) ) ( not ( = ?auto_4289 ?auto_4287 ) ) ( not ( = ?auto_4289 ?auto_4288 ) ) ( not ( = ?auto_4291 ?auto_4290 ) ) ( HOIST-AT ?auto_4292 ?auto_4291 ) ( not ( = ?auto_4293 ?auto_4292 ) ) ( SURFACE-AT ?auto_4288 ?auto_4291 ) ( ON ?auto_4288 ?auto_4295 ) ( CLEAR ?auto_4288 ) ( not ( = ?auto_4287 ?auto_4295 ) ) ( not ( = ?auto_4288 ?auto_4295 ) ) ( not ( = ?auto_4289 ?auto_4295 ) ) ( IS-CRATE ?auto_4287 ) ( AVAILABLE ?auto_4292 ) ( SURFACE-AT ?auto_4287 ?auto_4291 ) ( ON ?auto_4287 ?auto_4294 ) ( CLEAR ?auto_4287 ) ( not ( = ?auto_4287 ?auto_4294 ) ) ( not ( = ?auto_4288 ?auto_4294 ) ) ( not ( = ?auto_4289 ?auto_4294 ) ) ( not ( = ?auto_4295 ?auto_4294 ) ) ( TRUCK-AT ?auto_4296 ?auto_4290 ) ( SURFACE-AT ?auto_4297 ?auto_4290 ) ( CLEAR ?auto_4297 ) ( LIFTING ?auto_4293 ?auto_4289 ) ( IS-CRATE ?auto_4289 ) ( not ( = ?auto_4297 ?auto_4289 ) ) ( not ( = ?auto_4287 ?auto_4297 ) ) ( not ( = ?auto_4288 ?auto_4297 ) ) ( not ( = ?auto_4295 ?auto_4297 ) ) ( not ( = ?auto_4294 ?auto_4297 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4297 ?auto_4289 )
      ( MAKE-2CRATE ?auto_4289 ?auto_4287 ?auto_4288 )
      ( MAKE-1CRATE-VERIFY ?auto_4287 ?auto_4288 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4298 - SURFACE
      ?auto_4299 - SURFACE
      ?auto_4300 - SURFACE
    )
    :vars
    (
      ?auto_4302 - HOIST
      ?auto_4306 - PLACE
      ?auto_4301 - PLACE
      ?auto_4303 - HOIST
      ?auto_4304 - SURFACE
      ?auto_4305 - SURFACE
      ?auto_4308 - TRUCK
      ?auto_4307 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4302 ?auto_4306 ) ( IS-CRATE ?auto_4300 ) ( not ( = ?auto_4299 ?auto_4300 ) ) ( not ( = ?auto_4298 ?auto_4299 ) ) ( not ( = ?auto_4298 ?auto_4300 ) ) ( not ( = ?auto_4301 ?auto_4306 ) ) ( HOIST-AT ?auto_4303 ?auto_4301 ) ( not ( = ?auto_4302 ?auto_4303 ) ) ( SURFACE-AT ?auto_4300 ?auto_4301 ) ( ON ?auto_4300 ?auto_4304 ) ( CLEAR ?auto_4300 ) ( not ( = ?auto_4299 ?auto_4304 ) ) ( not ( = ?auto_4300 ?auto_4304 ) ) ( not ( = ?auto_4298 ?auto_4304 ) ) ( IS-CRATE ?auto_4299 ) ( AVAILABLE ?auto_4303 ) ( SURFACE-AT ?auto_4299 ?auto_4301 ) ( ON ?auto_4299 ?auto_4305 ) ( CLEAR ?auto_4299 ) ( not ( = ?auto_4299 ?auto_4305 ) ) ( not ( = ?auto_4300 ?auto_4305 ) ) ( not ( = ?auto_4298 ?auto_4305 ) ) ( not ( = ?auto_4304 ?auto_4305 ) ) ( TRUCK-AT ?auto_4308 ?auto_4306 ) ( SURFACE-AT ?auto_4307 ?auto_4306 ) ( CLEAR ?auto_4307 ) ( LIFTING ?auto_4302 ?auto_4298 ) ( IS-CRATE ?auto_4298 ) ( not ( = ?auto_4307 ?auto_4298 ) ) ( not ( = ?auto_4299 ?auto_4307 ) ) ( not ( = ?auto_4300 ?auto_4307 ) ) ( not ( = ?auto_4304 ?auto_4307 ) ) ( not ( = ?auto_4305 ?auto_4307 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4299 ?auto_4300 )
      ( MAKE-2CRATE-VERIFY ?auto_4298 ?auto_4299 ?auto_4300 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4309 - SURFACE
      ?auto_4310 - SURFACE
      ?auto_4311 - SURFACE
      ?auto_4312 - SURFACE
    )
    :vars
    (
      ?auto_4314 - HOIST
      ?auto_4315 - PLACE
      ?auto_4318 - PLACE
      ?auto_4319 - HOIST
      ?auto_4317 - SURFACE
      ?auto_4316 - SURFACE
      ?auto_4313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4314 ?auto_4315 ) ( IS-CRATE ?auto_4312 ) ( not ( = ?auto_4311 ?auto_4312 ) ) ( not ( = ?auto_4310 ?auto_4311 ) ) ( not ( = ?auto_4310 ?auto_4312 ) ) ( not ( = ?auto_4318 ?auto_4315 ) ) ( HOIST-AT ?auto_4319 ?auto_4318 ) ( not ( = ?auto_4314 ?auto_4319 ) ) ( SURFACE-AT ?auto_4312 ?auto_4318 ) ( ON ?auto_4312 ?auto_4317 ) ( CLEAR ?auto_4312 ) ( not ( = ?auto_4311 ?auto_4317 ) ) ( not ( = ?auto_4312 ?auto_4317 ) ) ( not ( = ?auto_4310 ?auto_4317 ) ) ( IS-CRATE ?auto_4311 ) ( AVAILABLE ?auto_4319 ) ( SURFACE-AT ?auto_4311 ?auto_4318 ) ( ON ?auto_4311 ?auto_4316 ) ( CLEAR ?auto_4311 ) ( not ( = ?auto_4311 ?auto_4316 ) ) ( not ( = ?auto_4312 ?auto_4316 ) ) ( not ( = ?auto_4310 ?auto_4316 ) ) ( not ( = ?auto_4317 ?auto_4316 ) ) ( TRUCK-AT ?auto_4313 ?auto_4315 ) ( SURFACE-AT ?auto_4309 ?auto_4315 ) ( CLEAR ?auto_4309 ) ( LIFTING ?auto_4314 ?auto_4310 ) ( IS-CRATE ?auto_4310 ) ( not ( = ?auto_4309 ?auto_4310 ) ) ( not ( = ?auto_4311 ?auto_4309 ) ) ( not ( = ?auto_4312 ?auto_4309 ) ) ( not ( = ?auto_4317 ?auto_4309 ) ) ( not ( = ?auto_4316 ?auto_4309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4310 ?auto_4311 ?auto_4312 )
      ( MAKE-3CRATE-VERIFY ?auto_4309 ?auto_4310 ?auto_4311 ?auto_4312 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4320 - SURFACE
      ?auto_4321 - SURFACE
    )
    :vars
    (
      ?auto_4323 - HOIST
      ?auto_4324 - PLACE
      ?auto_4330 - SURFACE
      ?auto_4328 - PLACE
      ?auto_4329 - HOIST
      ?auto_4326 - SURFACE
      ?auto_4325 - SURFACE
      ?auto_4322 - TRUCK
      ?auto_4327 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4323 ?auto_4324 ) ( IS-CRATE ?auto_4321 ) ( not ( = ?auto_4320 ?auto_4321 ) ) ( not ( = ?auto_4330 ?auto_4320 ) ) ( not ( = ?auto_4330 ?auto_4321 ) ) ( not ( = ?auto_4328 ?auto_4324 ) ) ( HOIST-AT ?auto_4329 ?auto_4328 ) ( not ( = ?auto_4323 ?auto_4329 ) ) ( SURFACE-AT ?auto_4321 ?auto_4328 ) ( ON ?auto_4321 ?auto_4326 ) ( CLEAR ?auto_4321 ) ( not ( = ?auto_4320 ?auto_4326 ) ) ( not ( = ?auto_4321 ?auto_4326 ) ) ( not ( = ?auto_4330 ?auto_4326 ) ) ( IS-CRATE ?auto_4320 ) ( AVAILABLE ?auto_4329 ) ( SURFACE-AT ?auto_4320 ?auto_4328 ) ( ON ?auto_4320 ?auto_4325 ) ( CLEAR ?auto_4320 ) ( not ( = ?auto_4320 ?auto_4325 ) ) ( not ( = ?auto_4321 ?auto_4325 ) ) ( not ( = ?auto_4330 ?auto_4325 ) ) ( not ( = ?auto_4326 ?auto_4325 ) ) ( TRUCK-AT ?auto_4322 ?auto_4324 ) ( SURFACE-AT ?auto_4327 ?auto_4324 ) ( CLEAR ?auto_4327 ) ( IS-CRATE ?auto_4330 ) ( not ( = ?auto_4327 ?auto_4330 ) ) ( not ( = ?auto_4320 ?auto_4327 ) ) ( not ( = ?auto_4321 ?auto_4327 ) ) ( not ( = ?auto_4326 ?auto_4327 ) ) ( not ( = ?auto_4325 ?auto_4327 ) ) ( AVAILABLE ?auto_4323 ) ( IN ?auto_4330 ?auto_4322 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4323 ?auto_4330 ?auto_4322 ?auto_4324 )
      ( MAKE-2CRATE ?auto_4330 ?auto_4320 ?auto_4321 )
      ( MAKE-1CRATE-VERIFY ?auto_4320 ?auto_4321 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4331 - SURFACE
      ?auto_4332 - SURFACE
      ?auto_4333 - SURFACE
    )
    :vars
    (
      ?auto_4339 - HOIST
      ?auto_4341 - PLACE
      ?auto_4335 - PLACE
      ?auto_4336 - HOIST
      ?auto_4340 - SURFACE
      ?auto_4337 - SURFACE
      ?auto_4334 - TRUCK
      ?auto_4338 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4339 ?auto_4341 ) ( IS-CRATE ?auto_4333 ) ( not ( = ?auto_4332 ?auto_4333 ) ) ( not ( = ?auto_4331 ?auto_4332 ) ) ( not ( = ?auto_4331 ?auto_4333 ) ) ( not ( = ?auto_4335 ?auto_4341 ) ) ( HOIST-AT ?auto_4336 ?auto_4335 ) ( not ( = ?auto_4339 ?auto_4336 ) ) ( SURFACE-AT ?auto_4333 ?auto_4335 ) ( ON ?auto_4333 ?auto_4340 ) ( CLEAR ?auto_4333 ) ( not ( = ?auto_4332 ?auto_4340 ) ) ( not ( = ?auto_4333 ?auto_4340 ) ) ( not ( = ?auto_4331 ?auto_4340 ) ) ( IS-CRATE ?auto_4332 ) ( AVAILABLE ?auto_4336 ) ( SURFACE-AT ?auto_4332 ?auto_4335 ) ( ON ?auto_4332 ?auto_4337 ) ( CLEAR ?auto_4332 ) ( not ( = ?auto_4332 ?auto_4337 ) ) ( not ( = ?auto_4333 ?auto_4337 ) ) ( not ( = ?auto_4331 ?auto_4337 ) ) ( not ( = ?auto_4340 ?auto_4337 ) ) ( TRUCK-AT ?auto_4334 ?auto_4341 ) ( SURFACE-AT ?auto_4338 ?auto_4341 ) ( CLEAR ?auto_4338 ) ( IS-CRATE ?auto_4331 ) ( not ( = ?auto_4338 ?auto_4331 ) ) ( not ( = ?auto_4332 ?auto_4338 ) ) ( not ( = ?auto_4333 ?auto_4338 ) ) ( not ( = ?auto_4340 ?auto_4338 ) ) ( not ( = ?auto_4337 ?auto_4338 ) ) ( AVAILABLE ?auto_4339 ) ( IN ?auto_4331 ?auto_4334 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4332 ?auto_4333 )
      ( MAKE-2CRATE-VERIFY ?auto_4331 ?auto_4332 ?auto_4333 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4342 - SURFACE
      ?auto_4343 - SURFACE
      ?auto_4344 - SURFACE
      ?auto_4345 - SURFACE
    )
    :vars
    (
      ?auto_4352 - HOIST
      ?auto_4346 - PLACE
      ?auto_4348 - PLACE
      ?auto_4349 - HOIST
      ?auto_4351 - SURFACE
      ?auto_4350 - SURFACE
      ?auto_4347 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4352 ?auto_4346 ) ( IS-CRATE ?auto_4345 ) ( not ( = ?auto_4344 ?auto_4345 ) ) ( not ( = ?auto_4343 ?auto_4344 ) ) ( not ( = ?auto_4343 ?auto_4345 ) ) ( not ( = ?auto_4348 ?auto_4346 ) ) ( HOIST-AT ?auto_4349 ?auto_4348 ) ( not ( = ?auto_4352 ?auto_4349 ) ) ( SURFACE-AT ?auto_4345 ?auto_4348 ) ( ON ?auto_4345 ?auto_4351 ) ( CLEAR ?auto_4345 ) ( not ( = ?auto_4344 ?auto_4351 ) ) ( not ( = ?auto_4345 ?auto_4351 ) ) ( not ( = ?auto_4343 ?auto_4351 ) ) ( IS-CRATE ?auto_4344 ) ( AVAILABLE ?auto_4349 ) ( SURFACE-AT ?auto_4344 ?auto_4348 ) ( ON ?auto_4344 ?auto_4350 ) ( CLEAR ?auto_4344 ) ( not ( = ?auto_4344 ?auto_4350 ) ) ( not ( = ?auto_4345 ?auto_4350 ) ) ( not ( = ?auto_4343 ?auto_4350 ) ) ( not ( = ?auto_4351 ?auto_4350 ) ) ( TRUCK-AT ?auto_4347 ?auto_4346 ) ( SURFACE-AT ?auto_4342 ?auto_4346 ) ( CLEAR ?auto_4342 ) ( IS-CRATE ?auto_4343 ) ( not ( = ?auto_4342 ?auto_4343 ) ) ( not ( = ?auto_4344 ?auto_4342 ) ) ( not ( = ?auto_4345 ?auto_4342 ) ) ( not ( = ?auto_4351 ?auto_4342 ) ) ( not ( = ?auto_4350 ?auto_4342 ) ) ( AVAILABLE ?auto_4352 ) ( IN ?auto_4343 ?auto_4347 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4343 ?auto_4344 ?auto_4345 )
      ( MAKE-3CRATE-VERIFY ?auto_4342 ?auto_4343 ?auto_4344 ?auto_4345 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4353 - SURFACE
      ?auto_4354 - SURFACE
    )
    :vars
    (
      ?auto_4361 - HOIST
      ?auto_4355 - PLACE
      ?auto_4363 - SURFACE
      ?auto_4357 - PLACE
      ?auto_4358 - HOIST
      ?auto_4360 - SURFACE
      ?auto_4359 - SURFACE
      ?auto_4362 - SURFACE
      ?auto_4356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4361 ?auto_4355 ) ( IS-CRATE ?auto_4354 ) ( not ( = ?auto_4353 ?auto_4354 ) ) ( not ( = ?auto_4363 ?auto_4353 ) ) ( not ( = ?auto_4363 ?auto_4354 ) ) ( not ( = ?auto_4357 ?auto_4355 ) ) ( HOIST-AT ?auto_4358 ?auto_4357 ) ( not ( = ?auto_4361 ?auto_4358 ) ) ( SURFACE-AT ?auto_4354 ?auto_4357 ) ( ON ?auto_4354 ?auto_4360 ) ( CLEAR ?auto_4354 ) ( not ( = ?auto_4353 ?auto_4360 ) ) ( not ( = ?auto_4354 ?auto_4360 ) ) ( not ( = ?auto_4363 ?auto_4360 ) ) ( IS-CRATE ?auto_4353 ) ( AVAILABLE ?auto_4358 ) ( SURFACE-AT ?auto_4353 ?auto_4357 ) ( ON ?auto_4353 ?auto_4359 ) ( CLEAR ?auto_4353 ) ( not ( = ?auto_4353 ?auto_4359 ) ) ( not ( = ?auto_4354 ?auto_4359 ) ) ( not ( = ?auto_4363 ?auto_4359 ) ) ( not ( = ?auto_4360 ?auto_4359 ) ) ( SURFACE-AT ?auto_4362 ?auto_4355 ) ( CLEAR ?auto_4362 ) ( IS-CRATE ?auto_4363 ) ( not ( = ?auto_4362 ?auto_4363 ) ) ( not ( = ?auto_4353 ?auto_4362 ) ) ( not ( = ?auto_4354 ?auto_4362 ) ) ( not ( = ?auto_4360 ?auto_4362 ) ) ( not ( = ?auto_4359 ?auto_4362 ) ) ( AVAILABLE ?auto_4361 ) ( IN ?auto_4363 ?auto_4356 ) ( TRUCK-AT ?auto_4356 ?auto_4357 ) )
    :subtasks
    ( ( !DRIVE ?auto_4356 ?auto_4357 ?auto_4355 )
      ( MAKE-2CRATE ?auto_4363 ?auto_4353 ?auto_4354 )
      ( MAKE-1CRATE-VERIFY ?auto_4353 ?auto_4354 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4364 - SURFACE
      ?auto_4365 - SURFACE
      ?auto_4366 - SURFACE
    )
    :vars
    (
      ?auto_4368 - HOIST
      ?auto_4373 - PLACE
      ?auto_4369 - PLACE
      ?auto_4370 - HOIST
      ?auto_4371 - SURFACE
      ?auto_4374 - SURFACE
      ?auto_4372 - SURFACE
      ?auto_4367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4368 ?auto_4373 ) ( IS-CRATE ?auto_4366 ) ( not ( = ?auto_4365 ?auto_4366 ) ) ( not ( = ?auto_4364 ?auto_4365 ) ) ( not ( = ?auto_4364 ?auto_4366 ) ) ( not ( = ?auto_4369 ?auto_4373 ) ) ( HOIST-AT ?auto_4370 ?auto_4369 ) ( not ( = ?auto_4368 ?auto_4370 ) ) ( SURFACE-AT ?auto_4366 ?auto_4369 ) ( ON ?auto_4366 ?auto_4371 ) ( CLEAR ?auto_4366 ) ( not ( = ?auto_4365 ?auto_4371 ) ) ( not ( = ?auto_4366 ?auto_4371 ) ) ( not ( = ?auto_4364 ?auto_4371 ) ) ( IS-CRATE ?auto_4365 ) ( AVAILABLE ?auto_4370 ) ( SURFACE-AT ?auto_4365 ?auto_4369 ) ( ON ?auto_4365 ?auto_4374 ) ( CLEAR ?auto_4365 ) ( not ( = ?auto_4365 ?auto_4374 ) ) ( not ( = ?auto_4366 ?auto_4374 ) ) ( not ( = ?auto_4364 ?auto_4374 ) ) ( not ( = ?auto_4371 ?auto_4374 ) ) ( SURFACE-AT ?auto_4372 ?auto_4373 ) ( CLEAR ?auto_4372 ) ( IS-CRATE ?auto_4364 ) ( not ( = ?auto_4372 ?auto_4364 ) ) ( not ( = ?auto_4365 ?auto_4372 ) ) ( not ( = ?auto_4366 ?auto_4372 ) ) ( not ( = ?auto_4371 ?auto_4372 ) ) ( not ( = ?auto_4374 ?auto_4372 ) ) ( AVAILABLE ?auto_4368 ) ( IN ?auto_4364 ?auto_4367 ) ( TRUCK-AT ?auto_4367 ?auto_4369 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4365 ?auto_4366 )
      ( MAKE-2CRATE-VERIFY ?auto_4364 ?auto_4365 ?auto_4366 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4375 - SURFACE
      ?auto_4376 - SURFACE
      ?auto_4377 - SURFACE
      ?auto_4378 - SURFACE
    )
    :vars
    (
      ?auto_4384 - HOIST
      ?auto_4382 - PLACE
      ?auto_4383 - PLACE
      ?auto_4380 - HOIST
      ?auto_4381 - SURFACE
      ?auto_4385 - SURFACE
      ?auto_4379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4384 ?auto_4382 ) ( IS-CRATE ?auto_4378 ) ( not ( = ?auto_4377 ?auto_4378 ) ) ( not ( = ?auto_4376 ?auto_4377 ) ) ( not ( = ?auto_4376 ?auto_4378 ) ) ( not ( = ?auto_4383 ?auto_4382 ) ) ( HOIST-AT ?auto_4380 ?auto_4383 ) ( not ( = ?auto_4384 ?auto_4380 ) ) ( SURFACE-AT ?auto_4378 ?auto_4383 ) ( ON ?auto_4378 ?auto_4381 ) ( CLEAR ?auto_4378 ) ( not ( = ?auto_4377 ?auto_4381 ) ) ( not ( = ?auto_4378 ?auto_4381 ) ) ( not ( = ?auto_4376 ?auto_4381 ) ) ( IS-CRATE ?auto_4377 ) ( AVAILABLE ?auto_4380 ) ( SURFACE-AT ?auto_4377 ?auto_4383 ) ( ON ?auto_4377 ?auto_4385 ) ( CLEAR ?auto_4377 ) ( not ( = ?auto_4377 ?auto_4385 ) ) ( not ( = ?auto_4378 ?auto_4385 ) ) ( not ( = ?auto_4376 ?auto_4385 ) ) ( not ( = ?auto_4381 ?auto_4385 ) ) ( SURFACE-AT ?auto_4375 ?auto_4382 ) ( CLEAR ?auto_4375 ) ( IS-CRATE ?auto_4376 ) ( not ( = ?auto_4375 ?auto_4376 ) ) ( not ( = ?auto_4377 ?auto_4375 ) ) ( not ( = ?auto_4378 ?auto_4375 ) ) ( not ( = ?auto_4381 ?auto_4375 ) ) ( not ( = ?auto_4385 ?auto_4375 ) ) ( AVAILABLE ?auto_4384 ) ( IN ?auto_4376 ?auto_4379 ) ( TRUCK-AT ?auto_4379 ?auto_4383 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4376 ?auto_4377 ?auto_4378 )
      ( MAKE-3CRATE-VERIFY ?auto_4375 ?auto_4376 ?auto_4377 ?auto_4378 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4386 - SURFACE
      ?auto_4387 - SURFACE
    )
    :vars
    (
      ?auto_4394 - HOIST
      ?auto_4392 - PLACE
      ?auto_4395 - SURFACE
      ?auto_4393 - PLACE
      ?auto_4390 - HOIST
      ?auto_4391 - SURFACE
      ?auto_4396 - SURFACE
      ?auto_4388 - SURFACE
      ?auto_4389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4394 ?auto_4392 ) ( IS-CRATE ?auto_4387 ) ( not ( = ?auto_4386 ?auto_4387 ) ) ( not ( = ?auto_4395 ?auto_4386 ) ) ( not ( = ?auto_4395 ?auto_4387 ) ) ( not ( = ?auto_4393 ?auto_4392 ) ) ( HOIST-AT ?auto_4390 ?auto_4393 ) ( not ( = ?auto_4394 ?auto_4390 ) ) ( SURFACE-AT ?auto_4387 ?auto_4393 ) ( ON ?auto_4387 ?auto_4391 ) ( CLEAR ?auto_4387 ) ( not ( = ?auto_4386 ?auto_4391 ) ) ( not ( = ?auto_4387 ?auto_4391 ) ) ( not ( = ?auto_4395 ?auto_4391 ) ) ( IS-CRATE ?auto_4386 ) ( SURFACE-AT ?auto_4386 ?auto_4393 ) ( ON ?auto_4386 ?auto_4396 ) ( CLEAR ?auto_4386 ) ( not ( = ?auto_4386 ?auto_4396 ) ) ( not ( = ?auto_4387 ?auto_4396 ) ) ( not ( = ?auto_4395 ?auto_4396 ) ) ( not ( = ?auto_4391 ?auto_4396 ) ) ( SURFACE-AT ?auto_4388 ?auto_4392 ) ( CLEAR ?auto_4388 ) ( IS-CRATE ?auto_4395 ) ( not ( = ?auto_4388 ?auto_4395 ) ) ( not ( = ?auto_4386 ?auto_4388 ) ) ( not ( = ?auto_4387 ?auto_4388 ) ) ( not ( = ?auto_4391 ?auto_4388 ) ) ( not ( = ?auto_4396 ?auto_4388 ) ) ( AVAILABLE ?auto_4394 ) ( TRUCK-AT ?auto_4389 ?auto_4393 ) ( LIFTING ?auto_4390 ?auto_4395 ) )
    :subtasks
    ( ( !LOAD ?auto_4390 ?auto_4395 ?auto_4389 ?auto_4393 )
      ( MAKE-2CRATE ?auto_4395 ?auto_4386 ?auto_4387 )
      ( MAKE-1CRATE-VERIFY ?auto_4386 ?auto_4387 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4397 - SURFACE
      ?auto_4398 - SURFACE
      ?auto_4399 - SURFACE
    )
    :vars
    (
      ?auto_4404 - HOIST
      ?auto_4405 - PLACE
      ?auto_4400 - PLACE
      ?auto_4406 - HOIST
      ?auto_4407 - SURFACE
      ?auto_4402 - SURFACE
      ?auto_4403 - SURFACE
      ?auto_4401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4404 ?auto_4405 ) ( IS-CRATE ?auto_4399 ) ( not ( = ?auto_4398 ?auto_4399 ) ) ( not ( = ?auto_4397 ?auto_4398 ) ) ( not ( = ?auto_4397 ?auto_4399 ) ) ( not ( = ?auto_4400 ?auto_4405 ) ) ( HOIST-AT ?auto_4406 ?auto_4400 ) ( not ( = ?auto_4404 ?auto_4406 ) ) ( SURFACE-AT ?auto_4399 ?auto_4400 ) ( ON ?auto_4399 ?auto_4407 ) ( CLEAR ?auto_4399 ) ( not ( = ?auto_4398 ?auto_4407 ) ) ( not ( = ?auto_4399 ?auto_4407 ) ) ( not ( = ?auto_4397 ?auto_4407 ) ) ( IS-CRATE ?auto_4398 ) ( SURFACE-AT ?auto_4398 ?auto_4400 ) ( ON ?auto_4398 ?auto_4402 ) ( CLEAR ?auto_4398 ) ( not ( = ?auto_4398 ?auto_4402 ) ) ( not ( = ?auto_4399 ?auto_4402 ) ) ( not ( = ?auto_4397 ?auto_4402 ) ) ( not ( = ?auto_4407 ?auto_4402 ) ) ( SURFACE-AT ?auto_4403 ?auto_4405 ) ( CLEAR ?auto_4403 ) ( IS-CRATE ?auto_4397 ) ( not ( = ?auto_4403 ?auto_4397 ) ) ( not ( = ?auto_4398 ?auto_4403 ) ) ( not ( = ?auto_4399 ?auto_4403 ) ) ( not ( = ?auto_4407 ?auto_4403 ) ) ( not ( = ?auto_4402 ?auto_4403 ) ) ( AVAILABLE ?auto_4404 ) ( TRUCK-AT ?auto_4401 ?auto_4400 ) ( LIFTING ?auto_4406 ?auto_4397 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4398 ?auto_4399 )
      ( MAKE-2CRATE-VERIFY ?auto_4397 ?auto_4398 ?auto_4399 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4408 - SURFACE
      ?auto_4409 - SURFACE
      ?auto_4410 - SURFACE
      ?auto_4411 - SURFACE
    )
    :vars
    (
      ?auto_4413 - HOIST
      ?auto_4416 - PLACE
      ?auto_4412 - PLACE
      ?auto_4418 - HOIST
      ?auto_4417 - SURFACE
      ?auto_4414 - SURFACE
      ?auto_4415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4413 ?auto_4416 ) ( IS-CRATE ?auto_4411 ) ( not ( = ?auto_4410 ?auto_4411 ) ) ( not ( = ?auto_4409 ?auto_4410 ) ) ( not ( = ?auto_4409 ?auto_4411 ) ) ( not ( = ?auto_4412 ?auto_4416 ) ) ( HOIST-AT ?auto_4418 ?auto_4412 ) ( not ( = ?auto_4413 ?auto_4418 ) ) ( SURFACE-AT ?auto_4411 ?auto_4412 ) ( ON ?auto_4411 ?auto_4417 ) ( CLEAR ?auto_4411 ) ( not ( = ?auto_4410 ?auto_4417 ) ) ( not ( = ?auto_4411 ?auto_4417 ) ) ( not ( = ?auto_4409 ?auto_4417 ) ) ( IS-CRATE ?auto_4410 ) ( SURFACE-AT ?auto_4410 ?auto_4412 ) ( ON ?auto_4410 ?auto_4414 ) ( CLEAR ?auto_4410 ) ( not ( = ?auto_4410 ?auto_4414 ) ) ( not ( = ?auto_4411 ?auto_4414 ) ) ( not ( = ?auto_4409 ?auto_4414 ) ) ( not ( = ?auto_4417 ?auto_4414 ) ) ( SURFACE-AT ?auto_4408 ?auto_4416 ) ( CLEAR ?auto_4408 ) ( IS-CRATE ?auto_4409 ) ( not ( = ?auto_4408 ?auto_4409 ) ) ( not ( = ?auto_4410 ?auto_4408 ) ) ( not ( = ?auto_4411 ?auto_4408 ) ) ( not ( = ?auto_4417 ?auto_4408 ) ) ( not ( = ?auto_4414 ?auto_4408 ) ) ( AVAILABLE ?auto_4413 ) ( TRUCK-AT ?auto_4415 ?auto_4412 ) ( LIFTING ?auto_4418 ?auto_4409 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4409 ?auto_4410 ?auto_4411 )
      ( MAKE-3CRATE-VERIFY ?auto_4408 ?auto_4409 ?auto_4410 ?auto_4411 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4419 - SURFACE
      ?auto_4420 - SURFACE
    )
    :vars
    (
      ?auto_4423 - HOIST
      ?auto_4426 - PLACE
      ?auto_4429 - SURFACE
      ?auto_4422 - PLACE
      ?auto_4428 - HOIST
      ?auto_4427 - SURFACE
      ?auto_4424 - SURFACE
      ?auto_4421 - SURFACE
      ?auto_4425 - TRUCK
      ?auto_4430 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4423 ?auto_4426 ) ( IS-CRATE ?auto_4420 ) ( not ( = ?auto_4419 ?auto_4420 ) ) ( not ( = ?auto_4429 ?auto_4419 ) ) ( not ( = ?auto_4429 ?auto_4420 ) ) ( not ( = ?auto_4422 ?auto_4426 ) ) ( HOIST-AT ?auto_4428 ?auto_4422 ) ( not ( = ?auto_4423 ?auto_4428 ) ) ( SURFACE-AT ?auto_4420 ?auto_4422 ) ( ON ?auto_4420 ?auto_4427 ) ( CLEAR ?auto_4420 ) ( not ( = ?auto_4419 ?auto_4427 ) ) ( not ( = ?auto_4420 ?auto_4427 ) ) ( not ( = ?auto_4429 ?auto_4427 ) ) ( IS-CRATE ?auto_4419 ) ( SURFACE-AT ?auto_4419 ?auto_4422 ) ( ON ?auto_4419 ?auto_4424 ) ( CLEAR ?auto_4419 ) ( not ( = ?auto_4419 ?auto_4424 ) ) ( not ( = ?auto_4420 ?auto_4424 ) ) ( not ( = ?auto_4429 ?auto_4424 ) ) ( not ( = ?auto_4427 ?auto_4424 ) ) ( SURFACE-AT ?auto_4421 ?auto_4426 ) ( CLEAR ?auto_4421 ) ( IS-CRATE ?auto_4429 ) ( not ( = ?auto_4421 ?auto_4429 ) ) ( not ( = ?auto_4419 ?auto_4421 ) ) ( not ( = ?auto_4420 ?auto_4421 ) ) ( not ( = ?auto_4427 ?auto_4421 ) ) ( not ( = ?auto_4424 ?auto_4421 ) ) ( AVAILABLE ?auto_4423 ) ( TRUCK-AT ?auto_4425 ?auto_4422 ) ( AVAILABLE ?auto_4428 ) ( SURFACE-AT ?auto_4429 ?auto_4422 ) ( ON ?auto_4429 ?auto_4430 ) ( CLEAR ?auto_4429 ) ( not ( = ?auto_4419 ?auto_4430 ) ) ( not ( = ?auto_4420 ?auto_4430 ) ) ( not ( = ?auto_4429 ?auto_4430 ) ) ( not ( = ?auto_4427 ?auto_4430 ) ) ( not ( = ?auto_4424 ?auto_4430 ) ) ( not ( = ?auto_4421 ?auto_4430 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4428 ?auto_4429 ?auto_4430 ?auto_4422 )
      ( MAKE-2CRATE ?auto_4429 ?auto_4419 ?auto_4420 )
      ( MAKE-1CRATE-VERIFY ?auto_4419 ?auto_4420 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4431 - SURFACE
      ?auto_4432 - SURFACE
      ?auto_4433 - SURFACE
    )
    :vars
    (
      ?auto_4438 - HOIST
      ?auto_4434 - PLACE
      ?auto_4441 - PLACE
      ?auto_4442 - HOIST
      ?auto_4435 - SURFACE
      ?auto_4440 - SURFACE
      ?auto_4436 - SURFACE
      ?auto_4437 - TRUCK
      ?auto_4439 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4438 ?auto_4434 ) ( IS-CRATE ?auto_4433 ) ( not ( = ?auto_4432 ?auto_4433 ) ) ( not ( = ?auto_4431 ?auto_4432 ) ) ( not ( = ?auto_4431 ?auto_4433 ) ) ( not ( = ?auto_4441 ?auto_4434 ) ) ( HOIST-AT ?auto_4442 ?auto_4441 ) ( not ( = ?auto_4438 ?auto_4442 ) ) ( SURFACE-AT ?auto_4433 ?auto_4441 ) ( ON ?auto_4433 ?auto_4435 ) ( CLEAR ?auto_4433 ) ( not ( = ?auto_4432 ?auto_4435 ) ) ( not ( = ?auto_4433 ?auto_4435 ) ) ( not ( = ?auto_4431 ?auto_4435 ) ) ( IS-CRATE ?auto_4432 ) ( SURFACE-AT ?auto_4432 ?auto_4441 ) ( ON ?auto_4432 ?auto_4440 ) ( CLEAR ?auto_4432 ) ( not ( = ?auto_4432 ?auto_4440 ) ) ( not ( = ?auto_4433 ?auto_4440 ) ) ( not ( = ?auto_4431 ?auto_4440 ) ) ( not ( = ?auto_4435 ?auto_4440 ) ) ( SURFACE-AT ?auto_4436 ?auto_4434 ) ( CLEAR ?auto_4436 ) ( IS-CRATE ?auto_4431 ) ( not ( = ?auto_4436 ?auto_4431 ) ) ( not ( = ?auto_4432 ?auto_4436 ) ) ( not ( = ?auto_4433 ?auto_4436 ) ) ( not ( = ?auto_4435 ?auto_4436 ) ) ( not ( = ?auto_4440 ?auto_4436 ) ) ( AVAILABLE ?auto_4438 ) ( TRUCK-AT ?auto_4437 ?auto_4441 ) ( AVAILABLE ?auto_4442 ) ( SURFACE-AT ?auto_4431 ?auto_4441 ) ( ON ?auto_4431 ?auto_4439 ) ( CLEAR ?auto_4431 ) ( not ( = ?auto_4432 ?auto_4439 ) ) ( not ( = ?auto_4433 ?auto_4439 ) ) ( not ( = ?auto_4431 ?auto_4439 ) ) ( not ( = ?auto_4435 ?auto_4439 ) ) ( not ( = ?auto_4440 ?auto_4439 ) ) ( not ( = ?auto_4436 ?auto_4439 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4432 ?auto_4433 )
      ( MAKE-2CRATE-VERIFY ?auto_4431 ?auto_4432 ?auto_4433 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4443 - SURFACE
      ?auto_4444 - SURFACE
      ?auto_4445 - SURFACE
      ?auto_4446 - SURFACE
    )
    :vars
    (
      ?auto_4447 - HOIST
      ?auto_4450 - PLACE
      ?auto_4448 - PLACE
      ?auto_4449 - HOIST
      ?auto_4451 - SURFACE
      ?auto_4452 - SURFACE
      ?auto_4453 - TRUCK
      ?auto_4454 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4447 ?auto_4450 ) ( IS-CRATE ?auto_4446 ) ( not ( = ?auto_4445 ?auto_4446 ) ) ( not ( = ?auto_4444 ?auto_4445 ) ) ( not ( = ?auto_4444 ?auto_4446 ) ) ( not ( = ?auto_4448 ?auto_4450 ) ) ( HOIST-AT ?auto_4449 ?auto_4448 ) ( not ( = ?auto_4447 ?auto_4449 ) ) ( SURFACE-AT ?auto_4446 ?auto_4448 ) ( ON ?auto_4446 ?auto_4451 ) ( CLEAR ?auto_4446 ) ( not ( = ?auto_4445 ?auto_4451 ) ) ( not ( = ?auto_4446 ?auto_4451 ) ) ( not ( = ?auto_4444 ?auto_4451 ) ) ( IS-CRATE ?auto_4445 ) ( SURFACE-AT ?auto_4445 ?auto_4448 ) ( ON ?auto_4445 ?auto_4452 ) ( CLEAR ?auto_4445 ) ( not ( = ?auto_4445 ?auto_4452 ) ) ( not ( = ?auto_4446 ?auto_4452 ) ) ( not ( = ?auto_4444 ?auto_4452 ) ) ( not ( = ?auto_4451 ?auto_4452 ) ) ( SURFACE-AT ?auto_4443 ?auto_4450 ) ( CLEAR ?auto_4443 ) ( IS-CRATE ?auto_4444 ) ( not ( = ?auto_4443 ?auto_4444 ) ) ( not ( = ?auto_4445 ?auto_4443 ) ) ( not ( = ?auto_4446 ?auto_4443 ) ) ( not ( = ?auto_4451 ?auto_4443 ) ) ( not ( = ?auto_4452 ?auto_4443 ) ) ( AVAILABLE ?auto_4447 ) ( TRUCK-AT ?auto_4453 ?auto_4448 ) ( AVAILABLE ?auto_4449 ) ( SURFACE-AT ?auto_4444 ?auto_4448 ) ( ON ?auto_4444 ?auto_4454 ) ( CLEAR ?auto_4444 ) ( not ( = ?auto_4445 ?auto_4454 ) ) ( not ( = ?auto_4446 ?auto_4454 ) ) ( not ( = ?auto_4444 ?auto_4454 ) ) ( not ( = ?auto_4451 ?auto_4454 ) ) ( not ( = ?auto_4452 ?auto_4454 ) ) ( not ( = ?auto_4443 ?auto_4454 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4444 ?auto_4445 ?auto_4446 )
      ( MAKE-3CRATE-VERIFY ?auto_4443 ?auto_4444 ?auto_4445 ?auto_4446 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4455 - SURFACE
      ?auto_4456 - SURFACE
    )
    :vars
    (
      ?auto_4458 - HOIST
      ?auto_4461 - PLACE
      ?auto_4457 - SURFACE
      ?auto_4459 - PLACE
      ?auto_4460 - HOIST
      ?auto_4462 - SURFACE
      ?auto_4464 - SURFACE
      ?auto_4463 - SURFACE
      ?auto_4466 - SURFACE
      ?auto_4465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4458 ?auto_4461 ) ( IS-CRATE ?auto_4456 ) ( not ( = ?auto_4455 ?auto_4456 ) ) ( not ( = ?auto_4457 ?auto_4455 ) ) ( not ( = ?auto_4457 ?auto_4456 ) ) ( not ( = ?auto_4459 ?auto_4461 ) ) ( HOIST-AT ?auto_4460 ?auto_4459 ) ( not ( = ?auto_4458 ?auto_4460 ) ) ( SURFACE-AT ?auto_4456 ?auto_4459 ) ( ON ?auto_4456 ?auto_4462 ) ( CLEAR ?auto_4456 ) ( not ( = ?auto_4455 ?auto_4462 ) ) ( not ( = ?auto_4456 ?auto_4462 ) ) ( not ( = ?auto_4457 ?auto_4462 ) ) ( IS-CRATE ?auto_4455 ) ( SURFACE-AT ?auto_4455 ?auto_4459 ) ( ON ?auto_4455 ?auto_4464 ) ( CLEAR ?auto_4455 ) ( not ( = ?auto_4455 ?auto_4464 ) ) ( not ( = ?auto_4456 ?auto_4464 ) ) ( not ( = ?auto_4457 ?auto_4464 ) ) ( not ( = ?auto_4462 ?auto_4464 ) ) ( SURFACE-AT ?auto_4463 ?auto_4461 ) ( CLEAR ?auto_4463 ) ( IS-CRATE ?auto_4457 ) ( not ( = ?auto_4463 ?auto_4457 ) ) ( not ( = ?auto_4455 ?auto_4463 ) ) ( not ( = ?auto_4456 ?auto_4463 ) ) ( not ( = ?auto_4462 ?auto_4463 ) ) ( not ( = ?auto_4464 ?auto_4463 ) ) ( AVAILABLE ?auto_4458 ) ( AVAILABLE ?auto_4460 ) ( SURFACE-AT ?auto_4457 ?auto_4459 ) ( ON ?auto_4457 ?auto_4466 ) ( CLEAR ?auto_4457 ) ( not ( = ?auto_4455 ?auto_4466 ) ) ( not ( = ?auto_4456 ?auto_4466 ) ) ( not ( = ?auto_4457 ?auto_4466 ) ) ( not ( = ?auto_4462 ?auto_4466 ) ) ( not ( = ?auto_4464 ?auto_4466 ) ) ( not ( = ?auto_4463 ?auto_4466 ) ) ( TRUCK-AT ?auto_4465 ?auto_4461 ) )
    :subtasks
    ( ( !DRIVE ?auto_4465 ?auto_4461 ?auto_4459 )
      ( MAKE-2CRATE ?auto_4457 ?auto_4455 ?auto_4456 )
      ( MAKE-1CRATE-VERIFY ?auto_4455 ?auto_4456 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4467 - SURFACE
      ?auto_4468 - SURFACE
      ?auto_4469 - SURFACE
    )
    :vars
    (
      ?auto_4473 - HOIST
      ?auto_4474 - PLACE
      ?auto_4470 - PLACE
      ?auto_4472 - HOIST
      ?auto_4475 - SURFACE
      ?auto_4476 - SURFACE
      ?auto_4478 - SURFACE
      ?auto_4471 - SURFACE
      ?auto_4477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4473 ?auto_4474 ) ( IS-CRATE ?auto_4469 ) ( not ( = ?auto_4468 ?auto_4469 ) ) ( not ( = ?auto_4467 ?auto_4468 ) ) ( not ( = ?auto_4467 ?auto_4469 ) ) ( not ( = ?auto_4470 ?auto_4474 ) ) ( HOIST-AT ?auto_4472 ?auto_4470 ) ( not ( = ?auto_4473 ?auto_4472 ) ) ( SURFACE-AT ?auto_4469 ?auto_4470 ) ( ON ?auto_4469 ?auto_4475 ) ( CLEAR ?auto_4469 ) ( not ( = ?auto_4468 ?auto_4475 ) ) ( not ( = ?auto_4469 ?auto_4475 ) ) ( not ( = ?auto_4467 ?auto_4475 ) ) ( IS-CRATE ?auto_4468 ) ( SURFACE-AT ?auto_4468 ?auto_4470 ) ( ON ?auto_4468 ?auto_4476 ) ( CLEAR ?auto_4468 ) ( not ( = ?auto_4468 ?auto_4476 ) ) ( not ( = ?auto_4469 ?auto_4476 ) ) ( not ( = ?auto_4467 ?auto_4476 ) ) ( not ( = ?auto_4475 ?auto_4476 ) ) ( SURFACE-AT ?auto_4478 ?auto_4474 ) ( CLEAR ?auto_4478 ) ( IS-CRATE ?auto_4467 ) ( not ( = ?auto_4478 ?auto_4467 ) ) ( not ( = ?auto_4468 ?auto_4478 ) ) ( not ( = ?auto_4469 ?auto_4478 ) ) ( not ( = ?auto_4475 ?auto_4478 ) ) ( not ( = ?auto_4476 ?auto_4478 ) ) ( AVAILABLE ?auto_4473 ) ( AVAILABLE ?auto_4472 ) ( SURFACE-AT ?auto_4467 ?auto_4470 ) ( ON ?auto_4467 ?auto_4471 ) ( CLEAR ?auto_4467 ) ( not ( = ?auto_4468 ?auto_4471 ) ) ( not ( = ?auto_4469 ?auto_4471 ) ) ( not ( = ?auto_4467 ?auto_4471 ) ) ( not ( = ?auto_4475 ?auto_4471 ) ) ( not ( = ?auto_4476 ?auto_4471 ) ) ( not ( = ?auto_4478 ?auto_4471 ) ) ( TRUCK-AT ?auto_4477 ?auto_4474 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4468 ?auto_4469 )
      ( MAKE-2CRATE-VERIFY ?auto_4467 ?auto_4468 ?auto_4469 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4479 - SURFACE
      ?auto_4480 - SURFACE
      ?auto_4481 - SURFACE
      ?auto_4482 - SURFACE
    )
    :vars
    (
      ?auto_4487 - HOIST
      ?auto_4488 - PLACE
      ?auto_4483 - PLACE
      ?auto_4484 - HOIST
      ?auto_4490 - SURFACE
      ?auto_4485 - SURFACE
      ?auto_4489 - SURFACE
      ?auto_4486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4487 ?auto_4488 ) ( IS-CRATE ?auto_4482 ) ( not ( = ?auto_4481 ?auto_4482 ) ) ( not ( = ?auto_4480 ?auto_4481 ) ) ( not ( = ?auto_4480 ?auto_4482 ) ) ( not ( = ?auto_4483 ?auto_4488 ) ) ( HOIST-AT ?auto_4484 ?auto_4483 ) ( not ( = ?auto_4487 ?auto_4484 ) ) ( SURFACE-AT ?auto_4482 ?auto_4483 ) ( ON ?auto_4482 ?auto_4490 ) ( CLEAR ?auto_4482 ) ( not ( = ?auto_4481 ?auto_4490 ) ) ( not ( = ?auto_4482 ?auto_4490 ) ) ( not ( = ?auto_4480 ?auto_4490 ) ) ( IS-CRATE ?auto_4481 ) ( SURFACE-AT ?auto_4481 ?auto_4483 ) ( ON ?auto_4481 ?auto_4485 ) ( CLEAR ?auto_4481 ) ( not ( = ?auto_4481 ?auto_4485 ) ) ( not ( = ?auto_4482 ?auto_4485 ) ) ( not ( = ?auto_4480 ?auto_4485 ) ) ( not ( = ?auto_4490 ?auto_4485 ) ) ( SURFACE-AT ?auto_4479 ?auto_4488 ) ( CLEAR ?auto_4479 ) ( IS-CRATE ?auto_4480 ) ( not ( = ?auto_4479 ?auto_4480 ) ) ( not ( = ?auto_4481 ?auto_4479 ) ) ( not ( = ?auto_4482 ?auto_4479 ) ) ( not ( = ?auto_4490 ?auto_4479 ) ) ( not ( = ?auto_4485 ?auto_4479 ) ) ( AVAILABLE ?auto_4487 ) ( AVAILABLE ?auto_4484 ) ( SURFACE-AT ?auto_4480 ?auto_4483 ) ( ON ?auto_4480 ?auto_4489 ) ( CLEAR ?auto_4480 ) ( not ( = ?auto_4481 ?auto_4489 ) ) ( not ( = ?auto_4482 ?auto_4489 ) ) ( not ( = ?auto_4480 ?auto_4489 ) ) ( not ( = ?auto_4490 ?auto_4489 ) ) ( not ( = ?auto_4485 ?auto_4489 ) ) ( not ( = ?auto_4479 ?auto_4489 ) ) ( TRUCK-AT ?auto_4486 ?auto_4488 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4480 ?auto_4481 ?auto_4482 )
      ( MAKE-3CRATE-VERIFY ?auto_4479 ?auto_4480 ?auto_4481 ?auto_4482 ) )
  )

)

