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
      ?auto_3720 - SURFACE
      ?auto_3721 - SURFACE
    )
    :vars
    (
      ?auto_3722 - HOIST
      ?auto_3723 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3722 ?auto_3723 ) ( SURFACE-AT ?auto_3720 ?auto_3723 ) ( CLEAR ?auto_3720 ) ( LIFTING ?auto_3722 ?auto_3721 ) ( IS-CRATE ?auto_3721 ) ( not ( = ?auto_3720 ?auto_3721 ) ) )
    :subtasks
    ( ( !DROP ?auto_3722 ?auto_3721 ?auto_3720 ?auto_3723 )
      ( MAKE-1CRATE-VERIFY ?auto_3720 ?auto_3721 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3724 - SURFACE
      ?auto_3725 - SURFACE
    )
    :vars
    (
      ?auto_3726 - HOIST
      ?auto_3727 - PLACE
      ?auto_3728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3726 ?auto_3727 ) ( SURFACE-AT ?auto_3724 ?auto_3727 ) ( CLEAR ?auto_3724 ) ( IS-CRATE ?auto_3725 ) ( not ( = ?auto_3724 ?auto_3725 ) ) ( TRUCK-AT ?auto_3728 ?auto_3727 ) ( AVAILABLE ?auto_3726 ) ( IN ?auto_3725 ?auto_3728 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3726 ?auto_3725 ?auto_3728 ?auto_3727 )
      ( MAKE-1CRATE ?auto_3724 ?auto_3725 )
      ( MAKE-1CRATE-VERIFY ?auto_3724 ?auto_3725 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3729 - SURFACE
      ?auto_3730 - SURFACE
    )
    :vars
    (
      ?auto_3732 - HOIST
      ?auto_3731 - PLACE
      ?auto_3733 - TRUCK
      ?auto_3734 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3732 ?auto_3731 ) ( SURFACE-AT ?auto_3729 ?auto_3731 ) ( CLEAR ?auto_3729 ) ( IS-CRATE ?auto_3730 ) ( not ( = ?auto_3729 ?auto_3730 ) ) ( AVAILABLE ?auto_3732 ) ( IN ?auto_3730 ?auto_3733 ) ( TRUCK-AT ?auto_3733 ?auto_3734 ) ( not ( = ?auto_3734 ?auto_3731 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3733 ?auto_3734 ?auto_3731 )
      ( MAKE-1CRATE ?auto_3729 ?auto_3730 )
      ( MAKE-1CRATE-VERIFY ?auto_3729 ?auto_3730 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3735 - SURFACE
      ?auto_3736 - SURFACE
    )
    :vars
    (
      ?auto_3738 - HOIST
      ?auto_3737 - PLACE
      ?auto_3740 - TRUCK
      ?auto_3739 - PLACE
      ?auto_3741 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3738 ?auto_3737 ) ( SURFACE-AT ?auto_3735 ?auto_3737 ) ( CLEAR ?auto_3735 ) ( IS-CRATE ?auto_3736 ) ( not ( = ?auto_3735 ?auto_3736 ) ) ( AVAILABLE ?auto_3738 ) ( TRUCK-AT ?auto_3740 ?auto_3739 ) ( not ( = ?auto_3739 ?auto_3737 ) ) ( HOIST-AT ?auto_3741 ?auto_3739 ) ( LIFTING ?auto_3741 ?auto_3736 ) ( not ( = ?auto_3738 ?auto_3741 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3741 ?auto_3736 ?auto_3740 ?auto_3739 )
      ( MAKE-1CRATE ?auto_3735 ?auto_3736 )
      ( MAKE-1CRATE-VERIFY ?auto_3735 ?auto_3736 ) )
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
      ?auto_3749 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3746 ?auto_3747 ) ( SURFACE-AT ?auto_3742 ?auto_3747 ) ( CLEAR ?auto_3742 ) ( IS-CRATE ?auto_3743 ) ( not ( = ?auto_3742 ?auto_3743 ) ) ( AVAILABLE ?auto_3746 ) ( TRUCK-AT ?auto_3745 ?auto_3744 ) ( not ( = ?auto_3744 ?auto_3747 ) ) ( HOIST-AT ?auto_3748 ?auto_3744 ) ( not ( = ?auto_3746 ?auto_3748 ) ) ( AVAILABLE ?auto_3748 ) ( SURFACE-AT ?auto_3743 ?auto_3744 ) ( ON ?auto_3743 ?auto_3749 ) ( CLEAR ?auto_3743 ) ( not ( = ?auto_3742 ?auto_3749 ) ) ( not ( = ?auto_3743 ?auto_3749 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3748 ?auto_3743 ?auto_3749 ?auto_3744 )
      ( MAKE-1CRATE ?auto_3742 ?auto_3743 )
      ( MAKE-1CRATE-VERIFY ?auto_3742 ?auto_3743 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3750 - SURFACE
      ?auto_3751 - SURFACE
    )
    :vars
    (
      ?auto_3752 - HOIST
      ?auto_3754 - PLACE
      ?auto_3755 - PLACE
      ?auto_3757 - HOIST
      ?auto_3753 - SURFACE
      ?auto_3756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3752 ?auto_3754 ) ( SURFACE-AT ?auto_3750 ?auto_3754 ) ( CLEAR ?auto_3750 ) ( IS-CRATE ?auto_3751 ) ( not ( = ?auto_3750 ?auto_3751 ) ) ( AVAILABLE ?auto_3752 ) ( not ( = ?auto_3755 ?auto_3754 ) ) ( HOIST-AT ?auto_3757 ?auto_3755 ) ( not ( = ?auto_3752 ?auto_3757 ) ) ( AVAILABLE ?auto_3757 ) ( SURFACE-AT ?auto_3751 ?auto_3755 ) ( ON ?auto_3751 ?auto_3753 ) ( CLEAR ?auto_3751 ) ( not ( = ?auto_3750 ?auto_3753 ) ) ( not ( = ?auto_3751 ?auto_3753 ) ) ( TRUCK-AT ?auto_3756 ?auto_3754 ) )
    :subtasks
    ( ( !DRIVE ?auto_3756 ?auto_3754 ?auto_3755 )
      ( MAKE-1CRATE ?auto_3750 ?auto_3751 )
      ( MAKE-1CRATE-VERIFY ?auto_3750 ?auto_3751 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3763 - SURFACE
      ?auto_3764 - SURFACE
    )
    :vars
    (
      ?auto_3765 - HOIST
      ?auto_3766 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3765 ?auto_3766 ) ( SURFACE-AT ?auto_3763 ?auto_3766 ) ( CLEAR ?auto_3763 ) ( LIFTING ?auto_3765 ?auto_3764 ) ( IS-CRATE ?auto_3764 ) ( not ( = ?auto_3763 ?auto_3764 ) ) )
    :subtasks
    ( ( !DROP ?auto_3765 ?auto_3764 ?auto_3763 ?auto_3766 )
      ( MAKE-1CRATE-VERIFY ?auto_3763 ?auto_3764 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3767 - SURFACE
      ?auto_3768 - SURFACE
      ?auto_3769 - SURFACE
    )
    :vars
    (
      ?auto_3771 - HOIST
      ?auto_3770 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3771 ?auto_3770 ) ( SURFACE-AT ?auto_3768 ?auto_3770 ) ( CLEAR ?auto_3768 ) ( LIFTING ?auto_3771 ?auto_3769 ) ( IS-CRATE ?auto_3769 ) ( not ( = ?auto_3768 ?auto_3769 ) ) ( ON ?auto_3768 ?auto_3767 ) ( not ( = ?auto_3767 ?auto_3768 ) ) ( not ( = ?auto_3767 ?auto_3769 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3768 ?auto_3769 )
      ( MAKE-2CRATE-VERIFY ?auto_3767 ?auto_3768 ?auto_3769 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3772 - SURFACE
      ?auto_3773 - SURFACE
    )
    :vars
    (
      ?auto_3775 - HOIST
      ?auto_3774 - PLACE
      ?auto_3776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3775 ?auto_3774 ) ( SURFACE-AT ?auto_3772 ?auto_3774 ) ( CLEAR ?auto_3772 ) ( IS-CRATE ?auto_3773 ) ( not ( = ?auto_3772 ?auto_3773 ) ) ( TRUCK-AT ?auto_3776 ?auto_3774 ) ( AVAILABLE ?auto_3775 ) ( IN ?auto_3773 ?auto_3776 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3775 ?auto_3773 ?auto_3776 ?auto_3774 )
      ( MAKE-1CRATE ?auto_3772 ?auto_3773 )
      ( MAKE-1CRATE-VERIFY ?auto_3772 ?auto_3773 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3777 - SURFACE
      ?auto_3778 - SURFACE
      ?auto_3779 - SURFACE
    )
    :vars
    (
      ?auto_3782 - HOIST
      ?auto_3780 - PLACE
      ?auto_3781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3782 ?auto_3780 ) ( SURFACE-AT ?auto_3778 ?auto_3780 ) ( CLEAR ?auto_3778 ) ( IS-CRATE ?auto_3779 ) ( not ( = ?auto_3778 ?auto_3779 ) ) ( TRUCK-AT ?auto_3781 ?auto_3780 ) ( AVAILABLE ?auto_3782 ) ( IN ?auto_3779 ?auto_3781 ) ( ON ?auto_3778 ?auto_3777 ) ( not ( = ?auto_3777 ?auto_3778 ) ) ( not ( = ?auto_3777 ?auto_3779 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3778 ?auto_3779 )
      ( MAKE-2CRATE-VERIFY ?auto_3777 ?auto_3778 ?auto_3779 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3783 - SURFACE
      ?auto_3784 - SURFACE
    )
    :vars
    (
      ?auto_3786 - HOIST
      ?auto_3788 - PLACE
      ?auto_3787 - TRUCK
      ?auto_3785 - SURFACE
      ?auto_3789 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3786 ?auto_3788 ) ( SURFACE-AT ?auto_3783 ?auto_3788 ) ( CLEAR ?auto_3783 ) ( IS-CRATE ?auto_3784 ) ( not ( = ?auto_3783 ?auto_3784 ) ) ( AVAILABLE ?auto_3786 ) ( IN ?auto_3784 ?auto_3787 ) ( ON ?auto_3783 ?auto_3785 ) ( not ( = ?auto_3785 ?auto_3783 ) ) ( not ( = ?auto_3785 ?auto_3784 ) ) ( TRUCK-AT ?auto_3787 ?auto_3789 ) ( not ( = ?auto_3789 ?auto_3788 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3787 ?auto_3789 ?auto_3788 )
      ( MAKE-2CRATE ?auto_3785 ?auto_3783 ?auto_3784 )
      ( MAKE-1CRATE-VERIFY ?auto_3783 ?auto_3784 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3790 - SURFACE
      ?auto_3791 - SURFACE
      ?auto_3792 - SURFACE
    )
    :vars
    (
      ?auto_3793 - HOIST
      ?auto_3794 - PLACE
      ?auto_3796 - TRUCK
      ?auto_3795 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3793 ?auto_3794 ) ( SURFACE-AT ?auto_3791 ?auto_3794 ) ( CLEAR ?auto_3791 ) ( IS-CRATE ?auto_3792 ) ( not ( = ?auto_3791 ?auto_3792 ) ) ( AVAILABLE ?auto_3793 ) ( IN ?auto_3792 ?auto_3796 ) ( ON ?auto_3791 ?auto_3790 ) ( not ( = ?auto_3790 ?auto_3791 ) ) ( not ( = ?auto_3790 ?auto_3792 ) ) ( TRUCK-AT ?auto_3796 ?auto_3795 ) ( not ( = ?auto_3795 ?auto_3794 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3791 ?auto_3792 )
      ( MAKE-2CRATE-VERIFY ?auto_3790 ?auto_3791 ?auto_3792 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3797 - SURFACE
      ?auto_3798 - SURFACE
    )
    :vars
    (
      ?auto_3802 - HOIST
      ?auto_3801 - PLACE
      ?auto_3799 - SURFACE
      ?auto_3803 - TRUCK
      ?auto_3800 - PLACE
      ?auto_3804 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3802 ?auto_3801 ) ( SURFACE-AT ?auto_3797 ?auto_3801 ) ( CLEAR ?auto_3797 ) ( IS-CRATE ?auto_3798 ) ( not ( = ?auto_3797 ?auto_3798 ) ) ( AVAILABLE ?auto_3802 ) ( ON ?auto_3797 ?auto_3799 ) ( not ( = ?auto_3799 ?auto_3797 ) ) ( not ( = ?auto_3799 ?auto_3798 ) ) ( TRUCK-AT ?auto_3803 ?auto_3800 ) ( not ( = ?auto_3800 ?auto_3801 ) ) ( HOIST-AT ?auto_3804 ?auto_3800 ) ( LIFTING ?auto_3804 ?auto_3798 ) ( not ( = ?auto_3802 ?auto_3804 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3804 ?auto_3798 ?auto_3803 ?auto_3800 )
      ( MAKE-2CRATE ?auto_3799 ?auto_3797 ?auto_3798 )
      ( MAKE-1CRATE-VERIFY ?auto_3797 ?auto_3798 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3805 - SURFACE
      ?auto_3806 - SURFACE
      ?auto_3807 - SURFACE
    )
    :vars
    (
      ?auto_3811 - HOIST
      ?auto_3808 - PLACE
      ?auto_3812 - TRUCK
      ?auto_3809 - PLACE
      ?auto_3810 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3811 ?auto_3808 ) ( SURFACE-AT ?auto_3806 ?auto_3808 ) ( CLEAR ?auto_3806 ) ( IS-CRATE ?auto_3807 ) ( not ( = ?auto_3806 ?auto_3807 ) ) ( AVAILABLE ?auto_3811 ) ( ON ?auto_3806 ?auto_3805 ) ( not ( = ?auto_3805 ?auto_3806 ) ) ( not ( = ?auto_3805 ?auto_3807 ) ) ( TRUCK-AT ?auto_3812 ?auto_3809 ) ( not ( = ?auto_3809 ?auto_3808 ) ) ( HOIST-AT ?auto_3810 ?auto_3809 ) ( LIFTING ?auto_3810 ?auto_3807 ) ( not ( = ?auto_3811 ?auto_3810 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3806 ?auto_3807 )
      ( MAKE-2CRATE-VERIFY ?auto_3805 ?auto_3806 ?auto_3807 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3813 - SURFACE
      ?auto_3814 - SURFACE
    )
    :vars
    (
      ?auto_3817 - HOIST
      ?auto_3815 - PLACE
      ?auto_3818 - SURFACE
      ?auto_3820 - TRUCK
      ?auto_3819 - PLACE
      ?auto_3816 - HOIST
      ?auto_3821 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3817 ?auto_3815 ) ( SURFACE-AT ?auto_3813 ?auto_3815 ) ( CLEAR ?auto_3813 ) ( IS-CRATE ?auto_3814 ) ( not ( = ?auto_3813 ?auto_3814 ) ) ( AVAILABLE ?auto_3817 ) ( ON ?auto_3813 ?auto_3818 ) ( not ( = ?auto_3818 ?auto_3813 ) ) ( not ( = ?auto_3818 ?auto_3814 ) ) ( TRUCK-AT ?auto_3820 ?auto_3819 ) ( not ( = ?auto_3819 ?auto_3815 ) ) ( HOIST-AT ?auto_3816 ?auto_3819 ) ( not ( = ?auto_3817 ?auto_3816 ) ) ( AVAILABLE ?auto_3816 ) ( SURFACE-AT ?auto_3814 ?auto_3819 ) ( ON ?auto_3814 ?auto_3821 ) ( CLEAR ?auto_3814 ) ( not ( = ?auto_3813 ?auto_3821 ) ) ( not ( = ?auto_3814 ?auto_3821 ) ) ( not ( = ?auto_3818 ?auto_3821 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3816 ?auto_3814 ?auto_3821 ?auto_3819 )
      ( MAKE-2CRATE ?auto_3818 ?auto_3813 ?auto_3814 )
      ( MAKE-1CRATE-VERIFY ?auto_3813 ?auto_3814 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3822 - SURFACE
      ?auto_3823 - SURFACE
      ?auto_3824 - SURFACE
    )
    :vars
    (
      ?auto_3826 - HOIST
      ?auto_3829 - PLACE
      ?auto_3828 - TRUCK
      ?auto_3830 - PLACE
      ?auto_3827 - HOIST
      ?auto_3825 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3826 ?auto_3829 ) ( SURFACE-AT ?auto_3823 ?auto_3829 ) ( CLEAR ?auto_3823 ) ( IS-CRATE ?auto_3824 ) ( not ( = ?auto_3823 ?auto_3824 ) ) ( AVAILABLE ?auto_3826 ) ( ON ?auto_3823 ?auto_3822 ) ( not ( = ?auto_3822 ?auto_3823 ) ) ( not ( = ?auto_3822 ?auto_3824 ) ) ( TRUCK-AT ?auto_3828 ?auto_3830 ) ( not ( = ?auto_3830 ?auto_3829 ) ) ( HOIST-AT ?auto_3827 ?auto_3830 ) ( not ( = ?auto_3826 ?auto_3827 ) ) ( AVAILABLE ?auto_3827 ) ( SURFACE-AT ?auto_3824 ?auto_3830 ) ( ON ?auto_3824 ?auto_3825 ) ( CLEAR ?auto_3824 ) ( not ( = ?auto_3823 ?auto_3825 ) ) ( not ( = ?auto_3824 ?auto_3825 ) ) ( not ( = ?auto_3822 ?auto_3825 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3823 ?auto_3824 )
      ( MAKE-2CRATE-VERIFY ?auto_3822 ?auto_3823 ?auto_3824 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3831 - SURFACE
      ?auto_3832 - SURFACE
    )
    :vars
    (
      ?auto_3837 - HOIST
      ?auto_3839 - PLACE
      ?auto_3835 - SURFACE
      ?auto_3836 - PLACE
      ?auto_3834 - HOIST
      ?auto_3838 - SURFACE
      ?auto_3833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3837 ?auto_3839 ) ( SURFACE-AT ?auto_3831 ?auto_3839 ) ( CLEAR ?auto_3831 ) ( IS-CRATE ?auto_3832 ) ( not ( = ?auto_3831 ?auto_3832 ) ) ( AVAILABLE ?auto_3837 ) ( ON ?auto_3831 ?auto_3835 ) ( not ( = ?auto_3835 ?auto_3831 ) ) ( not ( = ?auto_3835 ?auto_3832 ) ) ( not ( = ?auto_3836 ?auto_3839 ) ) ( HOIST-AT ?auto_3834 ?auto_3836 ) ( not ( = ?auto_3837 ?auto_3834 ) ) ( AVAILABLE ?auto_3834 ) ( SURFACE-AT ?auto_3832 ?auto_3836 ) ( ON ?auto_3832 ?auto_3838 ) ( CLEAR ?auto_3832 ) ( not ( = ?auto_3831 ?auto_3838 ) ) ( not ( = ?auto_3832 ?auto_3838 ) ) ( not ( = ?auto_3835 ?auto_3838 ) ) ( TRUCK-AT ?auto_3833 ?auto_3839 ) )
    :subtasks
    ( ( !DRIVE ?auto_3833 ?auto_3839 ?auto_3836 )
      ( MAKE-2CRATE ?auto_3835 ?auto_3831 ?auto_3832 )
      ( MAKE-1CRATE-VERIFY ?auto_3831 ?auto_3832 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3840 - SURFACE
      ?auto_3841 - SURFACE
      ?auto_3842 - SURFACE
    )
    :vars
    (
      ?auto_3843 - HOIST
      ?auto_3845 - PLACE
      ?auto_3846 - PLACE
      ?auto_3848 - HOIST
      ?auto_3844 - SURFACE
      ?auto_3847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3843 ?auto_3845 ) ( SURFACE-AT ?auto_3841 ?auto_3845 ) ( CLEAR ?auto_3841 ) ( IS-CRATE ?auto_3842 ) ( not ( = ?auto_3841 ?auto_3842 ) ) ( AVAILABLE ?auto_3843 ) ( ON ?auto_3841 ?auto_3840 ) ( not ( = ?auto_3840 ?auto_3841 ) ) ( not ( = ?auto_3840 ?auto_3842 ) ) ( not ( = ?auto_3846 ?auto_3845 ) ) ( HOIST-AT ?auto_3848 ?auto_3846 ) ( not ( = ?auto_3843 ?auto_3848 ) ) ( AVAILABLE ?auto_3848 ) ( SURFACE-AT ?auto_3842 ?auto_3846 ) ( ON ?auto_3842 ?auto_3844 ) ( CLEAR ?auto_3842 ) ( not ( = ?auto_3841 ?auto_3844 ) ) ( not ( = ?auto_3842 ?auto_3844 ) ) ( not ( = ?auto_3840 ?auto_3844 ) ) ( TRUCK-AT ?auto_3847 ?auto_3845 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3841 ?auto_3842 )
      ( MAKE-2CRATE-VERIFY ?auto_3840 ?auto_3841 ?auto_3842 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3849 - SURFACE
      ?auto_3850 - SURFACE
    )
    :vars
    (
      ?auto_3856 - HOIST
      ?auto_3855 - PLACE
      ?auto_3853 - SURFACE
      ?auto_3851 - PLACE
      ?auto_3857 - HOIST
      ?auto_3852 - SURFACE
      ?auto_3854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3856 ?auto_3855 ) ( IS-CRATE ?auto_3850 ) ( not ( = ?auto_3849 ?auto_3850 ) ) ( not ( = ?auto_3853 ?auto_3849 ) ) ( not ( = ?auto_3853 ?auto_3850 ) ) ( not ( = ?auto_3851 ?auto_3855 ) ) ( HOIST-AT ?auto_3857 ?auto_3851 ) ( not ( = ?auto_3856 ?auto_3857 ) ) ( AVAILABLE ?auto_3857 ) ( SURFACE-AT ?auto_3850 ?auto_3851 ) ( ON ?auto_3850 ?auto_3852 ) ( CLEAR ?auto_3850 ) ( not ( = ?auto_3849 ?auto_3852 ) ) ( not ( = ?auto_3850 ?auto_3852 ) ) ( not ( = ?auto_3853 ?auto_3852 ) ) ( TRUCK-AT ?auto_3854 ?auto_3855 ) ( SURFACE-AT ?auto_3853 ?auto_3855 ) ( CLEAR ?auto_3853 ) ( LIFTING ?auto_3856 ?auto_3849 ) ( IS-CRATE ?auto_3849 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3853 ?auto_3849 )
      ( MAKE-2CRATE ?auto_3853 ?auto_3849 ?auto_3850 )
      ( MAKE-1CRATE-VERIFY ?auto_3849 ?auto_3850 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3858 - SURFACE
      ?auto_3859 - SURFACE
      ?auto_3860 - SURFACE
    )
    :vars
    (
      ?auto_3865 - HOIST
      ?auto_3866 - PLACE
      ?auto_3861 - PLACE
      ?auto_3864 - HOIST
      ?auto_3862 - SURFACE
      ?auto_3863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3865 ?auto_3866 ) ( IS-CRATE ?auto_3860 ) ( not ( = ?auto_3859 ?auto_3860 ) ) ( not ( = ?auto_3858 ?auto_3859 ) ) ( not ( = ?auto_3858 ?auto_3860 ) ) ( not ( = ?auto_3861 ?auto_3866 ) ) ( HOIST-AT ?auto_3864 ?auto_3861 ) ( not ( = ?auto_3865 ?auto_3864 ) ) ( AVAILABLE ?auto_3864 ) ( SURFACE-AT ?auto_3860 ?auto_3861 ) ( ON ?auto_3860 ?auto_3862 ) ( CLEAR ?auto_3860 ) ( not ( = ?auto_3859 ?auto_3862 ) ) ( not ( = ?auto_3860 ?auto_3862 ) ) ( not ( = ?auto_3858 ?auto_3862 ) ) ( TRUCK-AT ?auto_3863 ?auto_3866 ) ( SURFACE-AT ?auto_3858 ?auto_3866 ) ( CLEAR ?auto_3858 ) ( LIFTING ?auto_3865 ?auto_3859 ) ( IS-CRATE ?auto_3859 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3859 ?auto_3860 )
      ( MAKE-2CRATE-VERIFY ?auto_3858 ?auto_3859 ?auto_3860 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3867 - SURFACE
      ?auto_3868 - SURFACE
    )
    :vars
    (
      ?auto_3875 - HOIST
      ?auto_3871 - PLACE
      ?auto_3873 - SURFACE
      ?auto_3870 - PLACE
      ?auto_3872 - HOIST
      ?auto_3869 - SURFACE
      ?auto_3874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3875 ?auto_3871 ) ( IS-CRATE ?auto_3868 ) ( not ( = ?auto_3867 ?auto_3868 ) ) ( not ( = ?auto_3873 ?auto_3867 ) ) ( not ( = ?auto_3873 ?auto_3868 ) ) ( not ( = ?auto_3870 ?auto_3871 ) ) ( HOIST-AT ?auto_3872 ?auto_3870 ) ( not ( = ?auto_3875 ?auto_3872 ) ) ( AVAILABLE ?auto_3872 ) ( SURFACE-AT ?auto_3868 ?auto_3870 ) ( ON ?auto_3868 ?auto_3869 ) ( CLEAR ?auto_3868 ) ( not ( = ?auto_3867 ?auto_3869 ) ) ( not ( = ?auto_3868 ?auto_3869 ) ) ( not ( = ?auto_3873 ?auto_3869 ) ) ( TRUCK-AT ?auto_3874 ?auto_3871 ) ( SURFACE-AT ?auto_3873 ?auto_3871 ) ( CLEAR ?auto_3873 ) ( IS-CRATE ?auto_3867 ) ( AVAILABLE ?auto_3875 ) ( IN ?auto_3867 ?auto_3874 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3875 ?auto_3867 ?auto_3874 ?auto_3871 )
      ( MAKE-2CRATE ?auto_3873 ?auto_3867 ?auto_3868 )
      ( MAKE-1CRATE-VERIFY ?auto_3867 ?auto_3868 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3876 - SURFACE
      ?auto_3877 - SURFACE
      ?auto_3878 - SURFACE
    )
    :vars
    (
      ?auto_3884 - HOIST
      ?auto_3883 - PLACE
      ?auto_3880 - PLACE
      ?auto_3879 - HOIST
      ?auto_3881 - SURFACE
      ?auto_3882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3884 ?auto_3883 ) ( IS-CRATE ?auto_3878 ) ( not ( = ?auto_3877 ?auto_3878 ) ) ( not ( = ?auto_3876 ?auto_3877 ) ) ( not ( = ?auto_3876 ?auto_3878 ) ) ( not ( = ?auto_3880 ?auto_3883 ) ) ( HOIST-AT ?auto_3879 ?auto_3880 ) ( not ( = ?auto_3884 ?auto_3879 ) ) ( AVAILABLE ?auto_3879 ) ( SURFACE-AT ?auto_3878 ?auto_3880 ) ( ON ?auto_3878 ?auto_3881 ) ( CLEAR ?auto_3878 ) ( not ( = ?auto_3877 ?auto_3881 ) ) ( not ( = ?auto_3878 ?auto_3881 ) ) ( not ( = ?auto_3876 ?auto_3881 ) ) ( TRUCK-AT ?auto_3882 ?auto_3883 ) ( SURFACE-AT ?auto_3876 ?auto_3883 ) ( CLEAR ?auto_3876 ) ( IS-CRATE ?auto_3877 ) ( AVAILABLE ?auto_3884 ) ( IN ?auto_3877 ?auto_3882 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3877 ?auto_3878 )
      ( MAKE-2CRATE-VERIFY ?auto_3876 ?auto_3877 ?auto_3878 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3885 - SURFACE
      ?auto_3886 - SURFACE
    )
    :vars
    (
      ?auto_3887 - HOIST
      ?auto_3893 - PLACE
      ?auto_3891 - SURFACE
      ?auto_3888 - PLACE
      ?auto_3889 - HOIST
      ?auto_3890 - SURFACE
      ?auto_3892 - TRUCK
      ?auto_3894 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3887 ?auto_3893 ) ( IS-CRATE ?auto_3886 ) ( not ( = ?auto_3885 ?auto_3886 ) ) ( not ( = ?auto_3891 ?auto_3885 ) ) ( not ( = ?auto_3891 ?auto_3886 ) ) ( not ( = ?auto_3888 ?auto_3893 ) ) ( HOIST-AT ?auto_3889 ?auto_3888 ) ( not ( = ?auto_3887 ?auto_3889 ) ) ( AVAILABLE ?auto_3889 ) ( SURFACE-AT ?auto_3886 ?auto_3888 ) ( ON ?auto_3886 ?auto_3890 ) ( CLEAR ?auto_3886 ) ( not ( = ?auto_3885 ?auto_3890 ) ) ( not ( = ?auto_3886 ?auto_3890 ) ) ( not ( = ?auto_3891 ?auto_3890 ) ) ( SURFACE-AT ?auto_3891 ?auto_3893 ) ( CLEAR ?auto_3891 ) ( IS-CRATE ?auto_3885 ) ( AVAILABLE ?auto_3887 ) ( IN ?auto_3885 ?auto_3892 ) ( TRUCK-AT ?auto_3892 ?auto_3894 ) ( not ( = ?auto_3894 ?auto_3893 ) ) ( not ( = ?auto_3888 ?auto_3894 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3892 ?auto_3894 ?auto_3893 )
      ( MAKE-2CRATE ?auto_3891 ?auto_3885 ?auto_3886 )
      ( MAKE-1CRATE-VERIFY ?auto_3885 ?auto_3886 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3895 - SURFACE
      ?auto_3896 - SURFACE
      ?auto_3897 - SURFACE
    )
    :vars
    (
      ?auto_3900 - HOIST
      ?auto_3903 - PLACE
      ?auto_3898 - PLACE
      ?auto_3904 - HOIST
      ?auto_3899 - SURFACE
      ?auto_3901 - TRUCK
      ?auto_3902 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3900 ?auto_3903 ) ( IS-CRATE ?auto_3897 ) ( not ( = ?auto_3896 ?auto_3897 ) ) ( not ( = ?auto_3895 ?auto_3896 ) ) ( not ( = ?auto_3895 ?auto_3897 ) ) ( not ( = ?auto_3898 ?auto_3903 ) ) ( HOIST-AT ?auto_3904 ?auto_3898 ) ( not ( = ?auto_3900 ?auto_3904 ) ) ( AVAILABLE ?auto_3904 ) ( SURFACE-AT ?auto_3897 ?auto_3898 ) ( ON ?auto_3897 ?auto_3899 ) ( CLEAR ?auto_3897 ) ( not ( = ?auto_3896 ?auto_3899 ) ) ( not ( = ?auto_3897 ?auto_3899 ) ) ( not ( = ?auto_3895 ?auto_3899 ) ) ( SURFACE-AT ?auto_3895 ?auto_3903 ) ( CLEAR ?auto_3895 ) ( IS-CRATE ?auto_3896 ) ( AVAILABLE ?auto_3900 ) ( IN ?auto_3896 ?auto_3901 ) ( TRUCK-AT ?auto_3901 ?auto_3902 ) ( not ( = ?auto_3902 ?auto_3903 ) ) ( not ( = ?auto_3898 ?auto_3902 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3896 ?auto_3897 )
      ( MAKE-2CRATE-VERIFY ?auto_3895 ?auto_3896 ?auto_3897 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3905 - SURFACE
      ?auto_3906 - SURFACE
    )
    :vars
    (
      ?auto_3909 - HOIST
      ?auto_3912 - PLACE
      ?auto_3914 - SURFACE
      ?auto_3911 - PLACE
      ?auto_3908 - HOIST
      ?auto_3913 - SURFACE
      ?auto_3910 - TRUCK
      ?auto_3907 - PLACE
      ?auto_3915 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3909 ?auto_3912 ) ( IS-CRATE ?auto_3906 ) ( not ( = ?auto_3905 ?auto_3906 ) ) ( not ( = ?auto_3914 ?auto_3905 ) ) ( not ( = ?auto_3914 ?auto_3906 ) ) ( not ( = ?auto_3911 ?auto_3912 ) ) ( HOIST-AT ?auto_3908 ?auto_3911 ) ( not ( = ?auto_3909 ?auto_3908 ) ) ( AVAILABLE ?auto_3908 ) ( SURFACE-AT ?auto_3906 ?auto_3911 ) ( ON ?auto_3906 ?auto_3913 ) ( CLEAR ?auto_3906 ) ( not ( = ?auto_3905 ?auto_3913 ) ) ( not ( = ?auto_3906 ?auto_3913 ) ) ( not ( = ?auto_3914 ?auto_3913 ) ) ( SURFACE-AT ?auto_3914 ?auto_3912 ) ( CLEAR ?auto_3914 ) ( IS-CRATE ?auto_3905 ) ( AVAILABLE ?auto_3909 ) ( TRUCK-AT ?auto_3910 ?auto_3907 ) ( not ( = ?auto_3907 ?auto_3912 ) ) ( not ( = ?auto_3911 ?auto_3907 ) ) ( HOIST-AT ?auto_3915 ?auto_3907 ) ( LIFTING ?auto_3915 ?auto_3905 ) ( not ( = ?auto_3909 ?auto_3915 ) ) ( not ( = ?auto_3908 ?auto_3915 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3915 ?auto_3905 ?auto_3910 ?auto_3907 )
      ( MAKE-2CRATE ?auto_3914 ?auto_3905 ?auto_3906 )
      ( MAKE-1CRATE-VERIFY ?auto_3905 ?auto_3906 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3916 - SURFACE
      ?auto_3917 - SURFACE
      ?auto_3918 - SURFACE
    )
    :vars
    (
      ?auto_3926 - HOIST
      ?auto_3922 - PLACE
      ?auto_3923 - PLACE
      ?auto_3919 - HOIST
      ?auto_3921 - SURFACE
      ?auto_3920 - TRUCK
      ?auto_3925 - PLACE
      ?auto_3924 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3926 ?auto_3922 ) ( IS-CRATE ?auto_3918 ) ( not ( = ?auto_3917 ?auto_3918 ) ) ( not ( = ?auto_3916 ?auto_3917 ) ) ( not ( = ?auto_3916 ?auto_3918 ) ) ( not ( = ?auto_3923 ?auto_3922 ) ) ( HOIST-AT ?auto_3919 ?auto_3923 ) ( not ( = ?auto_3926 ?auto_3919 ) ) ( AVAILABLE ?auto_3919 ) ( SURFACE-AT ?auto_3918 ?auto_3923 ) ( ON ?auto_3918 ?auto_3921 ) ( CLEAR ?auto_3918 ) ( not ( = ?auto_3917 ?auto_3921 ) ) ( not ( = ?auto_3918 ?auto_3921 ) ) ( not ( = ?auto_3916 ?auto_3921 ) ) ( SURFACE-AT ?auto_3916 ?auto_3922 ) ( CLEAR ?auto_3916 ) ( IS-CRATE ?auto_3917 ) ( AVAILABLE ?auto_3926 ) ( TRUCK-AT ?auto_3920 ?auto_3925 ) ( not ( = ?auto_3925 ?auto_3922 ) ) ( not ( = ?auto_3923 ?auto_3925 ) ) ( HOIST-AT ?auto_3924 ?auto_3925 ) ( LIFTING ?auto_3924 ?auto_3917 ) ( not ( = ?auto_3926 ?auto_3924 ) ) ( not ( = ?auto_3919 ?auto_3924 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3917 ?auto_3918 )
      ( MAKE-2CRATE-VERIFY ?auto_3916 ?auto_3917 ?auto_3918 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3927 - SURFACE
      ?auto_3928 - SURFACE
    )
    :vars
    (
      ?auto_3934 - HOIST
      ?auto_3930 - PLACE
      ?auto_3929 - SURFACE
      ?auto_3936 - PLACE
      ?auto_3937 - HOIST
      ?auto_3933 - SURFACE
      ?auto_3932 - TRUCK
      ?auto_3935 - PLACE
      ?auto_3931 - HOIST
      ?auto_3938 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3934 ?auto_3930 ) ( IS-CRATE ?auto_3928 ) ( not ( = ?auto_3927 ?auto_3928 ) ) ( not ( = ?auto_3929 ?auto_3927 ) ) ( not ( = ?auto_3929 ?auto_3928 ) ) ( not ( = ?auto_3936 ?auto_3930 ) ) ( HOIST-AT ?auto_3937 ?auto_3936 ) ( not ( = ?auto_3934 ?auto_3937 ) ) ( AVAILABLE ?auto_3937 ) ( SURFACE-AT ?auto_3928 ?auto_3936 ) ( ON ?auto_3928 ?auto_3933 ) ( CLEAR ?auto_3928 ) ( not ( = ?auto_3927 ?auto_3933 ) ) ( not ( = ?auto_3928 ?auto_3933 ) ) ( not ( = ?auto_3929 ?auto_3933 ) ) ( SURFACE-AT ?auto_3929 ?auto_3930 ) ( CLEAR ?auto_3929 ) ( IS-CRATE ?auto_3927 ) ( AVAILABLE ?auto_3934 ) ( TRUCK-AT ?auto_3932 ?auto_3935 ) ( not ( = ?auto_3935 ?auto_3930 ) ) ( not ( = ?auto_3936 ?auto_3935 ) ) ( HOIST-AT ?auto_3931 ?auto_3935 ) ( not ( = ?auto_3934 ?auto_3931 ) ) ( not ( = ?auto_3937 ?auto_3931 ) ) ( AVAILABLE ?auto_3931 ) ( SURFACE-AT ?auto_3927 ?auto_3935 ) ( ON ?auto_3927 ?auto_3938 ) ( CLEAR ?auto_3927 ) ( not ( = ?auto_3927 ?auto_3938 ) ) ( not ( = ?auto_3928 ?auto_3938 ) ) ( not ( = ?auto_3929 ?auto_3938 ) ) ( not ( = ?auto_3933 ?auto_3938 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3931 ?auto_3927 ?auto_3938 ?auto_3935 )
      ( MAKE-2CRATE ?auto_3929 ?auto_3927 ?auto_3928 )
      ( MAKE-1CRATE-VERIFY ?auto_3927 ?auto_3928 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3939 - SURFACE
      ?auto_3940 - SURFACE
      ?auto_3941 - SURFACE
    )
    :vars
    (
      ?auto_3946 - HOIST
      ?auto_3947 - PLACE
      ?auto_3943 - PLACE
      ?auto_3950 - HOIST
      ?auto_3942 - SURFACE
      ?auto_3948 - TRUCK
      ?auto_3949 - PLACE
      ?auto_3945 - HOIST
      ?auto_3944 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3946 ?auto_3947 ) ( IS-CRATE ?auto_3941 ) ( not ( = ?auto_3940 ?auto_3941 ) ) ( not ( = ?auto_3939 ?auto_3940 ) ) ( not ( = ?auto_3939 ?auto_3941 ) ) ( not ( = ?auto_3943 ?auto_3947 ) ) ( HOIST-AT ?auto_3950 ?auto_3943 ) ( not ( = ?auto_3946 ?auto_3950 ) ) ( AVAILABLE ?auto_3950 ) ( SURFACE-AT ?auto_3941 ?auto_3943 ) ( ON ?auto_3941 ?auto_3942 ) ( CLEAR ?auto_3941 ) ( not ( = ?auto_3940 ?auto_3942 ) ) ( not ( = ?auto_3941 ?auto_3942 ) ) ( not ( = ?auto_3939 ?auto_3942 ) ) ( SURFACE-AT ?auto_3939 ?auto_3947 ) ( CLEAR ?auto_3939 ) ( IS-CRATE ?auto_3940 ) ( AVAILABLE ?auto_3946 ) ( TRUCK-AT ?auto_3948 ?auto_3949 ) ( not ( = ?auto_3949 ?auto_3947 ) ) ( not ( = ?auto_3943 ?auto_3949 ) ) ( HOIST-AT ?auto_3945 ?auto_3949 ) ( not ( = ?auto_3946 ?auto_3945 ) ) ( not ( = ?auto_3950 ?auto_3945 ) ) ( AVAILABLE ?auto_3945 ) ( SURFACE-AT ?auto_3940 ?auto_3949 ) ( ON ?auto_3940 ?auto_3944 ) ( CLEAR ?auto_3940 ) ( not ( = ?auto_3940 ?auto_3944 ) ) ( not ( = ?auto_3941 ?auto_3944 ) ) ( not ( = ?auto_3939 ?auto_3944 ) ) ( not ( = ?auto_3942 ?auto_3944 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3940 ?auto_3941 )
      ( MAKE-2CRATE-VERIFY ?auto_3939 ?auto_3940 ?auto_3941 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3951 - SURFACE
      ?auto_3952 - SURFACE
    )
    :vars
    (
      ?auto_3953 - HOIST
      ?auto_3958 - PLACE
      ?auto_3960 - SURFACE
      ?auto_3961 - PLACE
      ?auto_3959 - HOIST
      ?auto_3956 - SURFACE
      ?auto_3962 - PLACE
      ?auto_3954 - HOIST
      ?auto_3955 - SURFACE
      ?auto_3957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3953 ?auto_3958 ) ( IS-CRATE ?auto_3952 ) ( not ( = ?auto_3951 ?auto_3952 ) ) ( not ( = ?auto_3960 ?auto_3951 ) ) ( not ( = ?auto_3960 ?auto_3952 ) ) ( not ( = ?auto_3961 ?auto_3958 ) ) ( HOIST-AT ?auto_3959 ?auto_3961 ) ( not ( = ?auto_3953 ?auto_3959 ) ) ( AVAILABLE ?auto_3959 ) ( SURFACE-AT ?auto_3952 ?auto_3961 ) ( ON ?auto_3952 ?auto_3956 ) ( CLEAR ?auto_3952 ) ( not ( = ?auto_3951 ?auto_3956 ) ) ( not ( = ?auto_3952 ?auto_3956 ) ) ( not ( = ?auto_3960 ?auto_3956 ) ) ( SURFACE-AT ?auto_3960 ?auto_3958 ) ( CLEAR ?auto_3960 ) ( IS-CRATE ?auto_3951 ) ( AVAILABLE ?auto_3953 ) ( not ( = ?auto_3962 ?auto_3958 ) ) ( not ( = ?auto_3961 ?auto_3962 ) ) ( HOIST-AT ?auto_3954 ?auto_3962 ) ( not ( = ?auto_3953 ?auto_3954 ) ) ( not ( = ?auto_3959 ?auto_3954 ) ) ( AVAILABLE ?auto_3954 ) ( SURFACE-AT ?auto_3951 ?auto_3962 ) ( ON ?auto_3951 ?auto_3955 ) ( CLEAR ?auto_3951 ) ( not ( = ?auto_3951 ?auto_3955 ) ) ( not ( = ?auto_3952 ?auto_3955 ) ) ( not ( = ?auto_3960 ?auto_3955 ) ) ( not ( = ?auto_3956 ?auto_3955 ) ) ( TRUCK-AT ?auto_3957 ?auto_3958 ) )
    :subtasks
    ( ( !DRIVE ?auto_3957 ?auto_3958 ?auto_3962 )
      ( MAKE-2CRATE ?auto_3960 ?auto_3951 ?auto_3952 )
      ( MAKE-1CRATE-VERIFY ?auto_3951 ?auto_3952 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3963 - SURFACE
      ?auto_3964 - SURFACE
      ?auto_3965 - SURFACE
    )
    :vars
    (
      ?auto_3974 - HOIST
      ?auto_3971 - PLACE
      ?auto_3969 - PLACE
      ?auto_3966 - HOIST
      ?auto_3967 - SURFACE
      ?auto_3968 - PLACE
      ?auto_3970 - HOIST
      ?auto_3972 - SURFACE
      ?auto_3973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3974 ?auto_3971 ) ( IS-CRATE ?auto_3965 ) ( not ( = ?auto_3964 ?auto_3965 ) ) ( not ( = ?auto_3963 ?auto_3964 ) ) ( not ( = ?auto_3963 ?auto_3965 ) ) ( not ( = ?auto_3969 ?auto_3971 ) ) ( HOIST-AT ?auto_3966 ?auto_3969 ) ( not ( = ?auto_3974 ?auto_3966 ) ) ( AVAILABLE ?auto_3966 ) ( SURFACE-AT ?auto_3965 ?auto_3969 ) ( ON ?auto_3965 ?auto_3967 ) ( CLEAR ?auto_3965 ) ( not ( = ?auto_3964 ?auto_3967 ) ) ( not ( = ?auto_3965 ?auto_3967 ) ) ( not ( = ?auto_3963 ?auto_3967 ) ) ( SURFACE-AT ?auto_3963 ?auto_3971 ) ( CLEAR ?auto_3963 ) ( IS-CRATE ?auto_3964 ) ( AVAILABLE ?auto_3974 ) ( not ( = ?auto_3968 ?auto_3971 ) ) ( not ( = ?auto_3969 ?auto_3968 ) ) ( HOIST-AT ?auto_3970 ?auto_3968 ) ( not ( = ?auto_3974 ?auto_3970 ) ) ( not ( = ?auto_3966 ?auto_3970 ) ) ( AVAILABLE ?auto_3970 ) ( SURFACE-AT ?auto_3964 ?auto_3968 ) ( ON ?auto_3964 ?auto_3972 ) ( CLEAR ?auto_3964 ) ( not ( = ?auto_3964 ?auto_3972 ) ) ( not ( = ?auto_3965 ?auto_3972 ) ) ( not ( = ?auto_3963 ?auto_3972 ) ) ( not ( = ?auto_3967 ?auto_3972 ) ) ( TRUCK-AT ?auto_3973 ?auto_3971 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3964 ?auto_3965 )
      ( MAKE-2CRATE-VERIFY ?auto_3963 ?auto_3964 ?auto_3965 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3984 - SURFACE
      ?auto_3985 - SURFACE
    )
    :vars
    (
      ?auto_3986 - HOIST
      ?auto_3987 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3986 ?auto_3987 ) ( SURFACE-AT ?auto_3984 ?auto_3987 ) ( CLEAR ?auto_3984 ) ( LIFTING ?auto_3986 ?auto_3985 ) ( IS-CRATE ?auto_3985 ) ( not ( = ?auto_3984 ?auto_3985 ) ) )
    :subtasks
    ( ( !DROP ?auto_3986 ?auto_3985 ?auto_3984 ?auto_3987 )
      ( MAKE-1CRATE-VERIFY ?auto_3984 ?auto_3985 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3988 - SURFACE
      ?auto_3989 - SURFACE
      ?auto_3990 - SURFACE
    )
    :vars
    (
      ?auto_3991 - HOIST
      ?auto_3992 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3991 ?auto_3992 ) ( SURFACE-AT ?auto_3989 ?auto_3992 ) ( CLEAR ?auto_3989 ) ( LIFTING ?auto_3991 ?auto_3990 ) ( IS-CRATE ?auto_3990 ) ( not ( = ?auto_3989 ?auto_3990 ) ) ( ON ?auto_3989 ?auto_3988 ) ( not ( = ?auto_3988 ?auto_3989 ) ) ( not ( = ?auto_3988 ?auto_3990 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3989 ?auto_3990 )
      ( MAKE-2CRATE-VERIFY ?auto_3988 ?auto_3989 ?auto_3990 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3993 - SURFACE
      ?auto_3994 - SURFACE
      ?auto_3995 - SURFACE
      ?auto_3996 - SURFACE
    )
    :vars
    (
      ?auto_3997 - HOIST
      ?auto_3998 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3997 ?auto_3998 ) ( SURFACE-AT ?auto_3995 ?auto_3998 ) ( CLEAR ?auto_3995 ) ( LIFTING ?auto_3997 ?auto_3996 ) ( IS-CRATE ?auto_3996 ) ( not ( = ?auto_3995 ?auto_3996 ) ) ( ON ?auto_3994 ?auto_3993 ) ( ON ?auto_3995 ?auto_3994 ) ( not ( = ?auto_3993 ?auto_3994 ) ) ( not ( = ?auto_3993 ?auto_3995 ) ) ( not ( = ?auto_3993 ?auto_3996 ) ) ( not ( = ?auto_3994 ?auto_3995 ) ) ( not ( = ?auto_3994 ?auto_3996 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3995 ?auto_3996 )
      ( MAKE-3CRATE-VERIFY ?auto_3993 ?auto_3994 ?auto_3995 ?auto_3996 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3999 - SURFACE
      ?auto_4000 - SURFACE
    )
    :vars
    (
      ?auto_4001 - HOIST
      ?auto_4002 - PLACE
      ?auto_4003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4001 ?auto_4002 ) ( SURFACE-AT ?auto_3999 ?auto_4002 ) ( CLEAR ?auto_3999 ) ( IS-CRATE ?auto_4000 ) ( not ( = ?auto_3999 ?auto_4000 ) ) ( TRUCK-AT ?auto_4003 ?auto_4002 ) ( AVAILABLE ?auto_4001 ) ( IN ?auto_4000 ?auto_4003 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4001 ?auto_4000 ?auto_4003 ?auto_4002 )
      ( MAKE-1CRATE ?auto_3999 ?auto_4000 )
      ( MAKE-1CRATE-VERIFY ?auto_3999 ?auto_4000 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4004 - SURFACE
      ?auto_4005 - SURFACE
      ?auto_4006 - SURFACE
    )
    :vars
    (
      ?auto_4007 - HOIST
      ?auto_4009 - PLACE
      ?auto_4008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4007 ?auto_4009 ) ( SURFACE-AT ?auto_4005 ?auto_4009 ) ( CLEAR ?auto_4005 ) ( IS-CRATE ?auto_4006 ) ( not ( = ?auto_4005 ?auto_4006 ) ) ( TRUCK-AT ?auto_4008 ?auto_4009 ) ( AVAILABLE ?auto_4007 ) ( IN ?auto_4006 ?auto_4008 ) ( ON ?auto_4005 ?auto_4004 ) ( not ( = ?auto_4004 ?auto_4005 ) ) ( not ( = ?auto_4004 ?auto_4006 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4005 ?auto_4006 )
      ( MAKE-2CRATE-VERIFY ?auto_4004 ?auto_4005 ?auto_4006 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4010 - SURFACE
      ?auto_4011 - SURFACE
      ?auto_4012 - SURFACE
      ?auto_4013 - SURFACE
    )
    :vars
    (
      ?auto_4015 - HOIST
      ?auto_4016 - PLACE
      ?auto_4014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4015 ?auto_4016 ) ( SURFACE-AT ?auto_4012 ?auto_4016 ) ( CLEAR ?auto_4012 ) ( IS-CRATE ?auto_4013 ) ( not ( = ?auto_4012 ?auto_4013 ) ) ( TRUCK-AT ?auto_4014 ?auto_4016 ) ( AVAILABLE ?auto_4015 ) ( IN ?auto_4013 ?auto_4014 ) ( ON ?auto_4012 ?auto_4011 ) ( not ( = ?auto_4011 ?auto_4012 ) ) ( not ( = ?auto_4011 ?auto_4013 ) ) ( ON ?auto_4011 ?auto_4010 ) ( not ( = ?auto_4010 ?auto_4011 ) ) ( not ( = ?auto_4010 ?auto_4012 ) ) ( not ( = ?auto_4010 ?auto_4013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4011 ?auto_4012 ?auto_4013 )
      ( MAKE-3CRATE-VERIFY ?auto_4010 ?auto_4011 ?auto_4012 ?auto_4013 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4017 - SURFACE
      ?auto_4018 - SURFACE
    )
    :vars
    (
      ?auto_4021 - HOIST
      ?auto_4022 - PLACE
      ?auto_4020 - TRUCK
      ?auto_4019 - SURFACE
      ?auto_4023 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4021 ?auto_4022 ) ( SURFACE-AT ?auto_4017 ?auto_4022 ) ( CLEAR ?auto_4017 ) ( IS-CRATE ?auto_4018 ) ( not ( = ?auto_4017 ?auto_4018 ) ) ( AVAILABLE ?auto_4021 ) ( IN ?auto_4018 ?auto_4020 ) ( ON ?auto_4017 ?auto_4019 ) ( not ( = ?auto_4019 ?auto_4017 ) ) ( not ( = ?auto_4019 ?auto_4018 ) ) ( TRUCK-AT ?auto_4020 ?auto_4023 ) ( not ( = ?auto_4023 ?auto_4022 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4020 ?auto_4023 ?auto_4022 )
      ( MAKE-2CRATE ?auto_4019 ?auto_4017 ?auto_4018 )
      ( MAKE-1CRATE-VERIFY ?auto_4017 ?auto_4018 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4024 - SURFACE
      ?auto_4025 - SURFACE
      ?auto_4026 - SURFACE
    )
    :vars
    (
      ?auto_4028 - HOIST
      ?auto_4030 - PLACE
      ?auto_4029 - TRUCK
      ?auto_4027 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4028 ?auto_4030 ) ( SURFACE-AT ?auto_4025 ?auto_4030 ) ( CLEAR ?auto_4025 ) ( IS-CRATE ?auto_4026 ) ( not ( = ?auto_4025 ?auto_4026 ) ) ( AVAILABLE ?auto_4028 ) ( IN ?auto_4026 ?auto_4029 ) ( ON ?auto_4025 ?auto_4024 ) ( not ( = ?auto_4024 ?auto_4025 ) ) ( not ( = ?auto_4024 ?auto_4026 ) ) ( TRUCK-AT ?auto_4029 ?auto_4027 ) ( not ( = ?auto_4027 ?auto_4030 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4025 ?auto_4026 )
      ( MAKE-2CRATE-VERIFY ?auto_4024 ?auto_4025 ?auto_4026 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4031 - SURFACE
      ?auto_4032 - SURFACE
      ?auto_4033 - SURFACE
      ?auto_4034 - SURFACE
    )
    :vars
    (
      ?auto_4038 - HOIST
      ?auto_4037 - PLACE
      ?auto_4036 - TRUCK
      ?auto_4035 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4038 ?auto_4037 ) ( SURFACE-AT ?auto_4033 ?auto_4037 ) ( CLEAR ?auto_4033 ) ( IS-CRATE ?auto_4034 ) ( not ( = ?auto_4033 ?auto_4034 ) ) ( AVAILABLE ?auto_4038 ) ( IN ?auto_4034 ?auto_4036 ) ( ON ?auto_4033 ?auto_4032 ) ( not ( = ?auto_4032 ?auto_4033 ) ) ( not ( = ?auto_4032 ?auto_4034 ) ) ( TRUCK-AT ?auto_4036 ?auto_4035 ) ( not ( = ?auto_4035 ?auto_4037 ) ) ( ON ?auto_4032 ?auto_4031 ) ( not ( = ?auto_4031 ?auto_4032 ) ) ( not ( = ?auto_4031 ?auto_4033 ) ) ( not ( = ?auto_4031 ?auto_4034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4032 ?auto_4033 ?auto_4034 )
      ( MAKE-3CRATE-VERIFY ?auto_4031 ?auto_4032 ?auto_4033 ?auto_4034 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4039 - SURFACE
      ?auto_4040 - SURFACE
    )
    :vars
    (
      ?auto_4045 - HOIST
      ?auto_4044 - PLACE
      ?auto_4043 - SURFACE
      ?auto_4042 - TRUCK
      ?auto_4041 - PLACE
      ?auto_4046 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4045 ?auto_4044 ) ( SURFACE-AT ?auto_4039 ?auto_4044 ) ( CLEAR ?auto_4039 ) ( IS-CRATE ?auto_4040 ) ( not ( = ?auto_4039 ?auto_4040 ) ) ( AVAILABLE ?auto_4045 ) ( ON ?auto_4039 ?auto_4043 ) ( not ( = ?auto_4043 ?auto_4039 ) ) ( not ( = ?auto_4043 ?auto_4040 ) ) ( TRUCK-AT ?auto_4042 ?auto_4041 ) ( not ( = ?auto_4041 ?auto_4044 ) ) ( HOIST-AT ?auto_4046 ?auto_4041 ) ( LIFTING ?auto_4046 ?auto_4040 ) ( not ( = ?auto_4045 ?auto_4046 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4046 ?auto_4040 ?auto_4042 ?auto_4041 )
      ( MAKE-2CRATE ?auto_4043 ?auto_4039 ?auto_4040 )
      ( MAKE-1CRATE-VERIFY ?auto_4039 ?auto_4040 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4047 - SURFACE
      ?auto_4048 - SURFACE
      ?auto_4049 - SURFACE
    )
    :vars
    (
      ?auto_4051 - HOIST
      ?auto_4050 - PLACE
      ?auto_4053 - TRUCK
      ?auto_4054 - PLACE
      ?auto_4052 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4051 ?auto_4050 ) ( SURFACE-AT ?auto_4048 ?auto_4050 ) ( CLEAR ?auto_4048 ) ( IS-CRATE ?auto_4049 ) ( not ( = ?auto_4048 ?auto_4049 ) ) ( AVAILABLE ?auto_4051 ) ( ON ?auto_4048 ?auto_4047 ) ( not ( = ?auto_4047 ?auto_4048 ) ) ( not ( = ?auto_4047 ?auto_4049 ) ) ( TRUCK-AT ?auto_4053 ?auto_4054 ) ( not ( = ?auto_4054 ?auto_4050 ) ) ( HOIST-AT ?auto_4052 ?auto_4054 ) ( LIFTING ?auto_4052 ?auto_4049 ) ( not ( = ?auto_4051 ?auto_4052 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4048 ?auto_4049 )
      ( MAKE-2CRATE-VERIFY ?auto_4047 ?auto_4048 ?auto_4049 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4055 - SURFACE
      ?auto_4056 - SURFACE
      ?auto_4057 - SURFACE
      ?auto_4058 - SURFACE
    )
    :vars
    (
      ?auto_4060 - HOIST
      ?auto_4059 - PLACE
      ?auto_4063 - TRUCK
      ?auto_4061 - PLACE
      ?auto_4062 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4060 ?auto_4059 ) ( SURFACE-AT ?auto_4057 ?auto_4059 ) ( CLEAR ?auto_4057 ) ( IS-CRATE ?auto_4058 ) ( not ( = ?auto_4057 ?auto_4058 ) ) ( AVAILABLE ?auto_4060 ) ( ON ?auto_4057 ?auto_4056 ) ( not ( = ?auto_4056 ?auto_4057 ) ) ( not ( = ?auto_4056 ?auto_4058 ) ) ( TRUCK-AT ?auto_4063 ?auto_4061 ) ( not ( = ?auto_4061 ?auto_4059 ) ) ( HOIST-AT ?auto_4062 ?auto_4061 ) ( LIFTING ?auto_4062 ?auto_4058 ) ( not ( = ?auto_4060 ?auto_4062 ) ) ( ON ?auto_4056 ?auto_4055 ) ( not ( = ?auto_4055 ?auto_4056 ) ) ( not ( = ?auto_4055 ?auto_4057 ) ) ( not ( = ?auto_4055 ?auto_4058 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4056 ?auto_4057 ?auto_4058 )
      ( MAKE-3CRATE-VERIFY ?auto_4055 ?auto_4056 ?auto_4057 ?auto_4058 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4064 - SURFACE
      ?auto_4065 - SURFACE
    )
    :vars
    (
      ?auto_4067 - HOIST
      ?auto_4066 - PLACE
      ?auto_4069 - SURFACE
      ?auto_4071 - TRUCK
      ?auto_4068 - PLACE
      ?auto_4070 - HOIST
      ?auto_4072 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4067 ?auto_4066 ) ( SURFACE-AT ?auto_4064 ?auto_4066 ) ( CLEAR ?auto_4064 ) ( IS-CRATE ?auto_4065 ) ( not ( = ?auto_4064 ?auto_4065 ) ) ( AVAILABLE ?auto_4067 ) ( ON ?auto_4064 ?auto_4069 ) ( not ( = ?auto_4069 ?auto_4064 ) ) ( not ( = ?auto_4069 ?auto_4065 ) ) ( TRUCK-AT ?auto_4071 ?auto_4068 ) ( not ( = ?auto_4068 ?auto_4066 ) ) ( HOIST-AT ?auto_4070 ?auto_4068 ) ( not ( = ?auto_4067 ?auto_4070 ) ) ( AVAILABLE ?auto_4070 ) ( SURFACE-AT ?auto_4065 ?auto_4068 ) ( ON ?auto_4065 ?auto_4072 ) ( CLEAR ?auto_4065 ) ( not ( = ?auto_4064 ?auto_4072 ) ) ( not ( = ?auto_4065 ?auto_4072 ) ) ( not ( = ?auto_4069 ?auto_4072 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4070 ?auto_4065 ?auto_4072 ?auto_4068 )
      ( MAKE-2CRATE ?auto_4069 ?auto_4064 ?auto_4065 )
      ( MAKE-1CRATE-VERIFY ?auto_4064 ?auto_4065 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4073 - SURFACE
      ?auto_4074 - SURFACE
      ?auto_4075 - SURFACE
    )
    :vars
    (
      ?auto_4081 - HOIST
      ?auto_4080 - PLACE
      ?auto_4078 - TRUCK
      ?auto_4079 - PLACE
      ?auto_4077 - HOIST
      ?auto_4076 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4081 ?auto_4080 ) ( SURFACE-AT ?auto_4074 ?auto_4080 ) ( CLEAR ?auto_4074 ) ( IS-CRATE ?auto_4075 ) ( not ( = ?auto_4074 ?auto_4075 ) ) ( AVAILABLE ?auto_4081 ) ( ON ?auto_4074 ?auto_4073 ) ( not ( = ?auto_4073 ?auto_4074 ) ) ( not ( = ?auto_4073 ?auto_4075 ) ) ( TRUCK-AT ?auto_4078 ?auto_4079 ) ( not ( = ?auto_4079 ?auto_4080 ) ) ( HOIST-AT ?auto_4077 ?auto_4079 ) ( not ( = ?auto_4081 ?auto_4077 ) ) ( AVAILABLE ?auto_4077 ) ( SURFACE-AT ?auto_4075 ?auto_4079 ) ( ON ?auto_4075 ?auto_4076 ) ( CLEAR ?auto_4075 ) ( not ( = ?auto_4074 ?auto_4076 ) ) ( not ( = ?auto_4075 ?auto_4076 ) ) ( not ( = ?auto_4073 ?auto_4076 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4074 ?auto_4075 )
      ( MAKE-2CRATE-VERIFY ?auto_4073 ?auto_4074 ?auto_4075 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4082 - SURFACE
      ?auto_4083 - SURFACE
      ?auto_4084 - SURFACE
      ?auto_4085 - SURFACE
    )
    :vars
    (
      ?auto_4089 - HOIST
      ?auto_4090 - PLACE
      ?auto_4087 - TRUCK
      ?auto_4086 - PLACE
      ?auto_4091 - HOIST
      ?auto_4088 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4089 ?auto_4090 ) ( SURFACE-AT ?auto_4084 ?auto_4090 ) ( CLEAR ?auto_4084 ) ( IS-CRATE ?auto_4085 ) ( not ( = ?auto_4084 ?auto_4085 ) ) ( AVAILABLE ?auto_4089 ) ( ON ?auto_4084 ?auto_4083 ) ( not ( = ?auto_4083 ?auto_4084 ) ) ( not ( = ?auto_4083 ?auto_4085 ) ) ( TRUCK-AT ?auto_4087 ?auto_4086 ) ( not ( = ?auto_4086 ?auto_4090 ) ) ( HOIST-AT ?auto_4091 ?auto_4086 ) ( not ( = ?auto_4089 ?auto_4091 ) ) ( AVAILABLE ?auto_4091 ) ( SURFACE-AT ?auto_4085 ?auto_4086 ) ( ON ?auto_4085 ?auto_4088 ) ( CLEAR ?auto_4085 ) ( not ( = ?auto_4084 ?auto_4088 ) ) ( not ( = ?auto_4085 ?auto_4088 ) ) ( not ( = ?auto_4083 ?auto_4088 ) ) ( ON ?auto_4083 ?auto_4082 ) ( not ( = ?auto_4082 ?auto_4083 ) ) ( not ( = ?auto_4082 ?auto_4084 ) ) ( not ( = ?auto_4082 ?auto_4085 ) ) ( not ( = ?auto_4082 ?auto_4088 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4083 ?auto_4084 ?auto_4085 )
      ( MAKE-3CRATE-VERIFY ?auto_4082 ?auto_4083 ?auto_4084 ?auto_4085 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4092 - SURFACE
      ?auto_4093 - SURFACE
    )
    :vars
    (
      ?auto_4098 - HOIST
      ?auto_4099 - PLACE
      ?auto_4096 - SURFACE
      ?auto_4094 - PLACE
      ?auto_4100 - HOIST
      ?auto_4097 - SURFACE
      ?auto_4095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4098 ?auto_4099 ) ( SURFACE-AT ?auto_4092 ?auto_4099 ) ( CLEAR ?auto_4092 ) ( IS-CRATE ?auto_4093 ) ( not ( = ?auto_4092 ?auto_4093 ) ) ( AVAILABLE ?auto_4098 ) ( ON ?auto_4092 ?auto_4096 ) ( not ( = ?auto_4096 ?auto_4092 ) ) ( not ( = ?auto_4096 ?auto_4093 ) ) ( not ( = ?auto_4094 ?auto_4099 ) ) ( HOIST-AT ?auto_4100 ?auto_4094 ) ( not ( = ?auto_4098 ?auto_4100 ) ) ( AVAILABLE ?auto_4100 ) ( SURFACE-AT ?auto_4093 ?auto_4094 ) ( ON ?auto_4093 ?auto_4097 ) ( CLEAR ?auto_4093 ) ( not ( = ?auto_4092 ?auto_4097 ) ) ( not ( = ?auto_4093 ?auto_4097 ) ) ( not ( = ?auto_4096 ?auto_4097 ) ) ( TRUCK-AT ?auto_4095 ?auto_4099 ) )
    :subtasks
    ( ( !DRIVE ?auto_4095 ?auto_4099 ?auto_4094 )
      ( MAKE-2CRATE ?auto_4096 ?auto_4092 ?auto_4093 )
      ( MAKE-1CRATE-VERIFY ?auto_4092 ?auto_4093 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4101 - SURFACE
      ?auto_4102 - SURFACE
      ?auto_4103 - SURFACE
    )
    :vars
    (
      ?auto_4109 - HOIST
      ?auto_4106 - PLACE
      ?auto_4104 - PLACE
      ?auto_4105 - HOIST
      ?auto_4108 - SURFACE
      ?auto_4107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4109 ?auto_4106 ) ( SURFACE-AT ?auto_4102 ?auto_4106 ) ( CLEAR ?auto_4102 ) ( IS-CRATE ?auto_4103 ) ( not ( = ?auto_4102 ?auto_4103 ) ) ( AVAILABLE ?auto_4109 ) ( ON ?auto_4102 ?auto_4101 ) ( not ( = ?auto_4101 ?auto_4102 ) ) ( not ( = ?auto_4101 ?auto_4103 ) ) ( not ( = ?auto_4104 ?auto_4106 ) ) ( HOIST-AT ?auto_4105 ?auto_4104 ) ( not ( = ?auto_4109 ?auto_4105 ) ) ( AVAILABLE ?auto_4105 ) ( SURFACE-AT ?auto_4103 ?auto_4104 ) ( ON ?auto_4103 ?auto_4108 ) ( CLEAR ?auto_4103 ) ( not ( = ?auto_4102 ?auto_4108 ) ) ( not ( = ?auto_4103 ?auto_4108 ) ) ( not ( = ?auto_4101 ?auto_4108 ) ) ( TRUCK-AT ?auto_4107 ?auto_4106 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4102 ?auto_4103 )
      ( MAKE-2CRATE-VERIFY ?auto_4101 ?auto_4102 ?auto_4103 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4110 - SURFACE
      ?auto_4111 - SURFACE
      ?auto_4112 - SURFACE
      ?auto_4113 - SURFACE
    )
    :vars
    (
      ?auto_4119 - HOIST
      ?auto_4118 - PLACE
      ?auto_4117 - PLACE
      ?auto_4114 - HOIST
      ?auto_4116 - SURFACE
      ?auto_4115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4119 ?auto_4118 ) ( SURFACE-AT ?auto_4112 ?auto_4118 ) ( CLEAR ?auto_4112 ) ( IS-CRATE ?auto_4113 ) ( not ( = ?auto_4112 ?auto_4113 ) ) ( AVAILABLE ?auto_4119 ) ( ON ?auto_4112 ?auto_4111 ) ( not ( = ?auto_4111 ?auto_4112 ) ) ( not ( = ?auto_4111 ?auto_4113 ) ) ( not ( = ?auto_4117 ?auto_4118 ) ) ( HOIST-AT ?auto_4114 ?auto_4117 ) ( not ( = ?auto_4119 ?auto_4114 ) ) ( AVAILABLE ?auto_4114 ) ( SURFACE-AT ?auto_4113 ?auto_4117 ) ( ON ?auto_4113 ?auto_4116 ) ( CLEAR ?auto_4113 ) ( not ( = ?auto_4112 ?auto_4116 ) ) ( not ( = ?auto_4113 ?auto_4116 ) ) ( not ( = ?auto_4111 ?auto_4116 ) ) ( TRUCK-AT ?auto_4115 ?auto_4118 ) ( ON ?auto_4111 ?auto_4110 ) ( not ( = ?auto_4110 ?auto_4111 ) ) ( not ( = ?auto_4110 ?auto_4112 ) ) ( not ( = ?auto_4110 ?auto_4113 ) ) ( not ( = ?auto_4110 ?auto_4116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4111 ?auto_4112 ?auto_4113 )
      ( MAKE-3CRATE-VERIFY ?auto_4110 ?auto_4111 ?auto_4112 ?auto_4113 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4120 - SURFACE
      ?auto_4121 - SURFACE
    )
    :vars
    (
      ?auto_4128 - HOIST
      ?auto_4127 - PLACE
      ?auto_4124 - SURFACE
      ?auto_4126 - PLACE
      ?auto_4122 - HOIST
      ?auto_4125 - SURFACE
      ?auto_4123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4128 ?auto_4127 ) ( IS-CRATE ?auto_4121 ) ( not ( = ?auto_4120 ?auto_4121 ) ) ( not ( = ?auto_4124 ?auto_4120 ) ) ( not ( = ?auto_4124 ?auto_4121 ) ) ( not ( = ?auto_4126 ?auto_4127 ) ) ( HOIST-AT ?auto_4122 ?auto_4126 ) ( not ( = ?auto_4128 ?auto_4122 ) ) ( AVAILABLE ?auto_4122 ) ( SURFACE-AT ?auto_4121 ?auto_4126 ) ( ON ?auto_4121 ?auto_4125 ) ( CLEAR ?auto_4121 ) ( not ( = ?auto_4120 ?auto_4125 ) ) ( not ( = ?auto_4121 ?auto_4125 ) ) ( not ( = ?auto_4124 ?auto_4125 ) ) ( TRUCK-AT ?auto_4123 ?auto_4127 ) ( SURFACE-AT ?auto_4124 ?auto_4127 ) ( CLEAR ?auto_4124 ) ( LIFTING ?auto_4128 ?auto_4120 ) ( IS-CRATE ?auto_4120 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4124 ?auto_4120 )
      ( MAKE-2CRATE ?auto_4124 ?auto_4120 ?auto_4121 )
      ( MAKE-1CRATE-VERIFY ?auto_4120 ?auto_4121 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4129 - SURFACE
      ?auto_4130 - SURFACE
      ?auto_4131 - SURFACE
    )
    :vars
    (
      ?auto_4132 - HOIST
      ?auto_4137 - PLACE
      ?auto_4134 - PLACE
      ?auto_4136 - HOIST
      ?auto_4135 - SURFACE
      ?auto_4133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4132 ?auto_4137 ) ( IS-CRATE ?auto_4131 ) ( not ( = ?auto_4130 ?auto_4131 ) ) ( not ( = ?auto_4129 ?auto_4130 ) ) ( not ( = ?auto_4129 ?auto_4131 ) ) ( not ( = ?auto_4134 ?auto_4137 ) ) ( HOIST-AT ?auto_4136 ?auto_4134 ) ( not ( = ?auto_4132 ?auto_4136 ) ) ( AVAILABLE ?auto_4136 ) ( SURFACE-AT ?auto_4131 ?auto_4134 ) ( ON ?auto_4131 ?auto_4135 ) ( CLEAR ?auto_4131 ) ( not ( = ?auto_4130 ?auto_4135 ) ) ( not ( = ?auto_4131 ?auto_4135 ) ) ( not ( = ?auto_4129 ?auto_4135 ) ) ( TRUCK-AT ?auto_4133 ?auto_4137 ) ( SURFACE-AT ?auto_4129 ?auto_4137 ) ( CLEAR ?auto_4129 ) ( LIFTING ?auto_4132 ?auto_4130 ) ( IS-CRATE ?auto_4130 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4130 ?auto_4131 )
      ( MAKE-2CRATE-VERIFY ?auto_4129 ?auto_4130 ?auto_4131 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4138 - SURFACE
      ?auto_4139 - SURFACE
      ?auto_4140 - SURFACE
      ?auto_4141 - SURFACE
    )
    :vars
    (
      ?auto_4143 - HOIST
      ?auto_4146 - PLACE
      ?auto_4142 - PLACE
      ?auto_4145 - HOIST
      ?auto_4144 - SURFACE
      ?auto_4147 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4143 ?auto_4146 ) ( IS-CRATE ?auto_4141 ) ( not ( = ?auto_4140 ?auto_4141 ) ) ( not ( = ?auto_4139 ?auto_4140 ) ) ( not ( = ?auto_4139 ?auto_4141 ) ) ( not ( = ?auto_4142 ?auto_4146 ) ) ( HOIST-AT ?auto_4145 ?auto_4142 ) ( not ( = ?auto_4143 ?auto_4145 ) ) ( AVAILABLE ?auto_4145 ) ( SURFACE-AT ?auto_4141 ?auto_4142 ) ( ON ?auto_4141 ?auto_4144 ) ( CLEAR ?auto_4141 ) ( not ( = ?auto_4140 ?auto_4144 ) ) ( not ( = ?auto_4141 ?auto_4144 ) ) ( not ( = ?auto_4139 ?auto_4144 ) ) ( TRUCK-AT ?auto_4147 ?auto_4146 ) ( SURFACE-AT ?auto_4139 ?auto_4146 ) ( CLEAR ?auto_4139 ) ( LIFTING ?auto_4143 ?auto_4140 ) ( IS-CRATE ?auto_4140 ) ( ON ?auto_4139 ?auto_4138 ) ( not ( = ?auto_4138 ?auto_4139 ) ) ( not ( = ?auto_4138 ?auto_4140 ) ) ( not ( = ?auto_4138 ?auto_4141 ) ) ( not ( = ?auto_4138 ?auto_4144 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4139 ?auto_4140 ?auto_4141 )
      ( MAKE-3CRATE-VERIFY ?auto_4138 ?auto_4139 ?auto_4140 ?auto_4141 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4148 - SURFACE
      ?auto_4149 - SURFACE
    )
    :vars
    (
      ?auto_4151 - HOIST
      ?auto_4154 - PLACE
      ?auto_4155 - SURFACE
      ?auto_4150 - PLACE
      ?auto_4153 - HOIST
      ?auto_4152 - SURFACE
      ?auto_4156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4151 ?auto_4154 ) ( IS-CRATE ?auto_4149 ) ( not ( = ?auto_4148 ?auto_4149 ) ) ( not ( = ?auto_4155 ?auto_4148 ) ) ( not ( = ?auto_4155 ?auto_4149 ) ) ( not ( = ?auto_4150 ?auto_4154 ) ) ( HOIST-AT ?auto_4153 ?auto_4150 ) ( not ( = ?auto_4151 ?auto_4153 ) ) ( AVAILABLE ?auto_4153 ) ( SURFACE-AT ?auto_4149 ?auto_4150 ) ( ON ?auto_4149 ?auto_4152 ) ( CLEAR ?auto_4149 ) ( not ( = ?auto_4148 ?auto_4152 ) ) ( not ( = ?auto_4149 ?auto_4152 ) ) ( not ( = ?auto_4155 ?auto_4152 ) ) ( TRUCK-AT ?auto_4156 ?auto_4154 ) ( SURFACE-AT ?auto_4155 ?auto_4154 ) ( CLEAR ?auto_4155 ) ( IS-CRATE ?auto_4148 ) ( AVAILABLE ?auto_4151 ) ( IN ?auto_4148 ?auto_4156 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4151 ?auto_4148 ?auto_4156 ?auto_4154 )
      ( MAKE-2CRATE ?auto_4155 ?auto_4148 ?auto_4149 )
      ( MAKE-1CRATE-VERIFY ?auto_4148 ?auto_4149 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4157 - SURFACE
      ?auto_4158 - SURFACE
      ?auto_4159 - SURFACE
    )
    :vars
    (
      ?auto_4160 - HOIST
      ?auto_4163 - PLACE
      ?auto_4165 - PLACE
      ?auto_4164 - HOIST
      ?auto_4161 - SURFACE
      ?auto_4162 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4160 ?auto_4163 ) ( IS-CRATE ?auto_4159 ) ( not ( = ?auto_4158 ?auto_4159 ) ) ( not ( = ?auto_4157 ?auto_4158 ) ) ( not ( = ?auto_4157 ?auto_4159 ) ) ( not ( = ?auto_4165 ?auto_4163 ) ) ( HOIST-AT ?auto_4164 ?auto_4165 ) ( not ( = ?auto_4160 ?auto_4164 ) ) ( AVAILABLE ?auto_4164 ) ( SURFACE-AT ?auto_4159 ?auto_4165 ) ( ON ?auto_4159 ?auto_4161 ) ( CLEAR ?auto_4159 ) ( not ( = ?auto_4158 ?auto_4161 ) ) ( not ( = ?auto_4159 ?auto_4161 ) ) ( not ( = ?auto_4157 ?auto_4161 ) ) ( TRUCK-AT ?auto_4162 ?auto_4163 ) ( SURFACE-AT ?auto_4157 ?auto_4163 ) ( CLEAR ?auto_4157 ) ( IS-CRATE ?auto_4158 ) ( AVAILABLE ?auto_4160 ) ( IN ?auto_4158 ?auto_4162 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4158 ?auto_4159 )
      ( MAKE-2CRATE-VERIFY ?auto_4157 ?auto_4158 ?auto_4159 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4166 - SURFACE
      ?auto_4167 - SURFACE
      ?auto_4168 - SURFACE
      ?auto_4169 - SURFACE
    )
    :vars
    (
      ?auto_4170 - HOIST
      ?auto_4174 - PLACE
      ?auto_4173 - PLACE
      ?auto_4172 - HOIST
      ?auto_4171 - SURFACE
      ?auto_4175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4170 ?auto_4174 ) ( IS-CRATE ?auto_4169 ) ( not ( = ?auto_4168 ?auto_4169 ) ) ( not ( = ?auto_4167 ?auto_4168 ) ) ( not ( = ?auto_4167 ?auto_4169 ) ) ( not ( = ?auto_4173 ?auto_4174 ) ) ( HOIST-AT ?auto_4172 ?auto_4173 ) ( not ( = ?auto_4170 ?auto_4172 ) ) ( AVAILABLE ?auto_4172 ) ( SURFACE-AT ?auto_4169 ?auto_4173 ) ( ON ?auto_4169 ?auto_4171 ) ( CLEAR ?auto_4169 ) ( not ( = ?auto_4168 ?auto_4171 ) ) ( not ( = ?auto_4169 ?auto_4171 ) ) ( not ( = ?auto_4167 ?auto_4171 ) ) ( TRUCK-AT ?auto_4175 ?auto_4174 ) ( SURFACE-AT ?auto_4167 ?auto_4174 ) ( CLEAR ?auto_4167 ) ( IS-CRATE ?auto_4168 ) ( AVAILABLE ?auto_4170 ) ( IN ?auto_4168 ?auto_4175 ) ( ON ?auto_4167 ?auto_4166 ) ( not ( = ?auto_4166 ?auto_4167 ) ) ( not ( = ?auto_4166 ?auto_4168 ) ) ( not ( = ?auto_4166 ?auto_4169 ) ) ( not ( = ?auto_4166 ?auto_4171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4167 ?auto_4168 ?auto_4169 )
      ( MAKE-3CRATE-VERIFY ?auto_4166 ?auto_4167 ?auto_4168 ?auto_4169 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4176 - SURFACE
      ?auto_4177 - SURFACE
    )
    :vars
    (
      ?auto_4178 - HOIST
      ?auto_4182 - PLACE
      ?auto_4183 - SURFACE
      ?auto_4181 - PLACE
      ?auto_4180 - HOIST
      ?auto_4179 - SURFACE
      ?auto_4184 - TRUCK
      ?auto_4185 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4178 ?auto_4182 ) ( IS-CRATE ?auto_4177 ) ( not ( = ?auto_4176 ?auto_4177 ) ) ( not ( = ?auto_4183 ?auto_4176 ) ) ( not ( = ?auto_4183 ?auto_4177 ) ) ( not ( = ?auto_4181 ?auto_4182 ) ) ( HOIST-AT ?auto_4180 ?auto_4181 ) ( not ( = ?auto_4178 ?auto_4180 ) ) ( AVAILABLE ?auto_4180 ) ( SURFACE-AT ?auto_4177 ?auto_4181 ) ( ON ?auto_4177 ?auto_4179 ) ( CLEAR ?auto_4177 ) ( not ( = ?auto_4176 ?auto_4179 ) ) ( not ( = ?auto_4177 ?auto_4179 ) ) ( not ( = ?auto_4183 ?auto_4179 ) ) ( SURFACE-AT ?auto_4183 ?auto_4182 ) ( CLEAR ?auto_4183 ) ( IS-CRATE ?auto_4176 ) ( AVAILABLE ?auto_4178 ) ( IN ?auto_4176 ?auto_4184 ) ( TRUCK-AT ?auto_4184 ?auto_4185 ) ( not ( = ?auto_4185 ?auto_4182 ) ) ( not ( = ?auto_4181 ?auto_4185 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4184 ?auto_4185 ?auto_4182 )
      ( MAKE-2CRATE ?auto_4183 ?auto_4176 ?auto_4177 )
      ( MAKE-1CRATE-VERIFY ?auto_4176 ?auto_4177 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4186 - SURFACE
      ?auto_4187 - SURFACE
      ?auto_4188 - SURFACE
    )
    :vars
    (
      ?auto_4193 - HOIST
      ?auto_4192 - PLACE
      ?auto_4189 - PLACE
      ?auto_4190 - HOIST
      ?auto_4194 - SURFACE
      ?auto_4195 - TRUCK
      ?auto_4191 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4193 ?auto_4192 ) ( IS-CRATE ?auto_4188 ) ( not ( = ?auto_4187 ?auto_4188 ) ) ( not ( = ?auto_4186 ?auto_4187 ) ) ( not ( = ?auto_4186 ?auto_4188 ) ) ( not ( = ?auto_4189 ?auto_4192 ) ) ( HOIST-AT ?auto_4190 ?auto_4189 ) ( not ( = ?auto_4193 ?auto_4190 ) ) ( AVAILABLE ?auto_4190 ) ( SURFACE-AT ?auto_4188 ?auto_4189 ) ( ON ?auto_4188 ?auto_4194 ) ( CLEAR ?auto_4188 ) ( not ( = ?auto_4187 ?auto_4194 ) ) ( not ( = ?auto_4188 ?auto_4194 ) ) ( not ( = ?auto_4186 ?auto_4194 ) ) ( SURFACE-AT ?auto_4186 ?auto_4192 ) ( CLEAR ?auto_4186 ) ( IS-CRATE ?auto_4187 ) ( AVAILABLE ?auto_4193 ) ( IN ?auto_4187 ?auto_4195 ) ( TRUCK-AT ?auto_4195 ?auto_4191 ) ( not ( = ?auto_4191 ?auto_4192 ) ) ( not ( = ?auto_4189 ?auto_4191 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4187 ?auto_4188 )
      ( MAKE-2CRATE-VERIFY ?auto_4186 ?auto_4187 ?auto_4188 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4196 - SURFACE
      ?auto_4197 - SURFACE
      ?auto_4198 - SURFACE
      ?auto_4199 - SURFACE
    )
    :vars
    (
      ?auto_4204 - HOIST
      ?auto_4205 - PLACE
      ?auto_4206 - PLACE
      ?auto_4202 - HOIST
      ?auto_4201 - SURFACE
      ?auto_4200 - TRUCK
      ?auto_4203 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4204 ?auto_4205 ) ( IS-CRATE ?auto_4199 ) ( not ( = ?auto_4198 ?auto_4199 ) ) ( not ( = ?auto_4197 ?auto_4198 ) ) ( not ( = ?auto_4197 ?auto_4199 ) ) ( not ( = ?auto_4206 ?auto_4205 ) ) ( HOIST-AT ?auto_4202 ?auto_4206 ) ( not ( = ?auto_4204 ?auto_4202 ) ) ( AVAILABLE ?auto_4202 ) ( SURFACE-AT ?auto_4199 ?auto_4206 ) ( ON ?auto_4199 ?auto_4201 ) ( CLEAR ?auto_4199 ) ( not ( = ?auto_4198 ?auto_4201 ) ) ( not ( = ?auto_4199 ?auto_4201 ) ) ( not ( = ?auto_4197 ?auto_4201 ) ) ( SURFACE-AT ?auto_4197 ?auto_4205 ) ( CLEAR ?auto_4197 ) ( IS-CRATE ?auto_4198 ) ( AVAILABLE ?auto_4204 ) ( IN ?auto_4198 ?auto_4200 ) ( TRUCK-AT ?auto_4200 ?auto_4203 ) ( not ( = ?auto_4203 ?auto_4205 ) ) ( not ( = ?auto_4206 ?auto_4203 ) ) ( ON ?auto_4197 ?auto_4196 ) ( not ( = ?auto_4196 ?auto_4197 ) ) ( not ( = ?auto_4196 ?auto_4198 ) ) ( not ( = ?auto_4196 ?auto_4199 ) ) ( not ( = ?auto_4196 ?auto_4201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4197 ?auto_4198 ?auto_4199 )
      ( MAKE-3CRATE-VERIFY ?auto_4196 ?auto_4197 ?auto_4198 ?auto_4199 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4207 - SURFACE
      ?auto_4208 - SURFACE
    )
    :vars
    (
      ?auto_4214 - HOIST
      ?auto_4215 - PLACE
      ?auto_4210 - SURFACE
      ?auto_4216 - PLACE
      ?auto_4212 - HOIST
      ?auto_4211 - SURFACE
      ?auto_4209 - TRUCK
      ?auto_4213 - PLACE
      ?auto_4217 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4214 ?auto_4215 ) ( IS-CRATE ?auto_4208 ) ( not ( = ?auto_4207 ?auto_4208 ) ) ( not ( = ?auto_4210 ?auto_4207 ) ) ( not ( = ?auto_4210 ?auto_4208 ) ) ( not ( = ?auto_4216 ?auto_4215 ) ) ( HOIST-AT ?auto_4212 ?auto_4216 ) ( not ( = ?auto_4214 ?auto_4212 ) ) ( AVAILABLE ?auto_4212 ) ( SURFACE-AT ?auto_4208 ?auto_4216 ) ( ON ?auto_4208 ?auto_4211 ) ( CLEAR ?auto_4208 ) ( not ( = ?auto_4207 ?auto_4211 ) ) ( not ( = ?auto_4208 ?auto_4211 ) ) ( not ( = ?auto_4210 ?auto_4211 ) ) ( SURFACE-AT ?auto_4210 ?auto_4215 ) ( CLEAR ?auto_4210 ) ( IS-CRATE ?auto_4207 ) ( AVAILABLE ?auto_4214 ) ( TRUCK-AT ?auto_4209 ?auto_4213 ) ( not ( = ?auto_4213 ?auto_4215 ) ) ( not ( = ?auto_4216 ?auto_4213 ) ) ( HOIST-AT ?auto_4217 ?auto_4213 ) ( LIFTING ?auto_4217 ?auto_4207 ) ( not ( = ?auto_4214 ?auto_4217 ) ) ( not ( = ?auto_4212 ?auto_4217 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4217 ?auto_4207 ?auto_4209 ?auto_4213 )
      ( MAKE-2CRATE ?auto_4210 ?auto_4207 ?auto_4208 )
      ( MAKE-1CRATE-VERIFY ?auto_4207 ?auto_4208 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4218 - SURFACE
      ?auto_4219 - SURFACE
      ?auto_4220 - SURFACE
    )
    :vars
    (
      ?auto_4223 - HOIST
      ?auto_4228 - PLACE
      ?auto_4225 - PLACE
      ?auto_4227 - HOIST
      ?auto_4221 - SURFACE
      ?auto_4226 - TRUCK
      ?auto_4224 - PLACE
      ?auto_4222 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4223 ?auto_4228 ) ( IS-CRATE ?auto_4220 ) ( not ( = ?auto_4219 ?auto_4220 ) ) ( not ( = ?auto_4218 ?auto_4219 ) ) ( not ( = ?auto_4218 ?auto_4220 ) ) ( not ( = ?auto_4225 ?auto_4228 ) ) ( HOIST-AT ?auto_4227 ?auto_4225 ) ( not ( = ?auto_4223 ?auto_4227 ) ) ( AVAILABLE ?auto_4227 ) ( SURFACE-AT ?auto_4220 ?auto_4225 ) ( ON ?auto_4220 ?auto_4221 ) ( CLEAR ?auto_4220 ) ( not ( = ?auto_4219 ?auto_4221 ) ) ( not ( = ?auto_4220 ?auto_4221 ) ) ( not ( = ?auto_4218 ?auto_4221 ) ) ( SURFACE-AT ?auto_4218 ?auto_4228 ) ( CLEAR ?auto_4218 ) ( IS-CRATE ?auto_4219 ) ( AVAILABLE ?auto_4223 ) ( TRUCK-AT ?auto_4226 ?auto_4224 ) ( not ( = ?auto_4224 ?auto_4228 ) ) ( not ( = ?auto_4225 ?auto_4224 ) ) ( HOIST-AT ?auto_4222 ?auto_4224 ) ( LIFTING ?auto_4222 ?auto_4219 ) ( not ( = ?auto_4223 ?auto_4222 ) ) ( not ( = ?auto_4227 ?auto_4222 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4219 ?auto_4220 )
      ( MAKE-2CRATE-VERIFY ?auto_4218 ?auto_4219 ?auto_4220 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4229 - SURFACE
      ?auto_4230 - SURFACE
      ?auto_4231 - SURFACE
      ?auto_4232 - SURFACE
    )
    :vars
    (
      ?auto_4237 - HOIST
      ?auto_4238 - PLACE
      ?auto_4240 - PLACE
      ?auto_4239 - HOIST
      ?auto_4234 - SURFACE
      ?auto_4235 - TRUCK
      ?auto_4236 - PLACE
      ?auto_4233 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4237 ?auto_4238 ) ( IS-CRATE ?auto_4232 ) ( not ( = ?auto_4231 ?auto_4232 ) ) ( not ( = ?auto_4230 ?auto_4231 ) ) ( not ( = ?auto_4230 ?auto_4232 ) ) ( not ( = ?auto_4240 ?auto_4238 ) ) ( HOIST-AT ?auto_4239 ?auto_4240 ) ( not ( = ?auto_4237 ?auto_4239 ) ) ( AVAILABLE ?auto_4239 ) ( SURFACE-AT ?auto_4232 ?auto_4240 ) ( ON ?auto_4232 ?auto_4234 ) ( CLEAR ?auto_4232 ) ( not ( = ?auto_4231 ?auto_4234 ) ) ( not ( = ?auto_4232 ?auto_4234 ) ) ( not ( = ?auto_4230 ?auto_4234 ) ) ( SURFACE-AT ?auto_4230 ?auto_4238 ) ( CLEAR ?auto_4230 ) ( IS-CRATE ?auto_4231 ) ( AVAILABLE ?auto_4237 ) ( TRUCK-AT ?auto_4235 ?auto_4236 ) ( not ( = ?auto_4236 ?auto_4238 ) ) ( not ( = ?auto_4240 ?auto_4236 ) ) ( HOIST-AT ?auto_4233 ?auto_4236 ) ( LIFTING ?auto_4233 ?auto_4231 ) ( not ( = ?auto_4237 ?auto_4233 ) ) ( not ( = ?auto_4239 ?auto_4233 ) ) ( ON ?auto_4230 ?auto_4229 ) ( not ( = ?auto_4229 ?auto_4230 ) ) ( not ( = ?auto_4229 ?auto_4231 ) ) ( not ( = ?auto_4229 ?auto_4232 ) ) ( not ( = ?auto_4229 ?auto_4234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4230 ?auto_4231 ?auto_4232 )
      ( MAKE-3CRATE-VERIFY ?auto_4229 ?auto_4230 ?auto_4231 ?auto_4232 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4241 - SURFACE
      ?auto_4242 - SURFACE
    )
    :vars
    (
      ?auto_4248 - HOIST
      ?auto_4249 - PLACE
      ?auto_4244 - SURFACE
      ?auto_4251 - PLACE
      ?auto_4250 - HOIST
      ?auto_4245 - SURFACE
      ?auto_4246 - TRUCK
      ?auto_4247 - PLACE
      ?auto_4243 - HOIST
      ?auto_4252 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4248 ?auto_4249 ) ( IS-CRATE ?auto_4242 ) ( not ( = ?auto_4241 ?auto_4242 ) ) ( not ( = ?auto_4244 ?auto_4241 ) ) ( not ( = ?auto_4244 ?auto_4242 ) ) ( not ( = ?auto_4251 ?auto_4249 ) ) ( HOIST-AT ?auto_4250 ?auto_4251 ) ( not ( = ?auto_4248 ?auto_4250 ) ) ( AVAILABLE ?auto_4250 ) ( SURFACE-AT ?auto_4242 ?auto_4251 ) ( ON ?auto_4242 ?auto_4245 ) ( CLEAR ?auto_4242 ) ( not ( = ?auto_4241 ?auto_4245 ) ) ( not ( = ?auto_4242 ?auto_4245 ) ) ( not ( = ?auto_4244 ?auto_4245 ) ) ( SURFACE-AT ?auto_4244 ?auto_4249 ) ( CLEAR ?auto_4244 ) ( IS-CRATE ?auto_4241 ) ( AVAILABLE ?auto_4248 ) ( TRUCK-AT ?auto_4246 ?auto_4247 ) ( not ( = ?auto_4247 ?auto_4249 ) ) ( not ( = ?auto_4251 ?auto_4247 ) ) ( HOIST-AT ?auto_4243 ?auto_4247 ) ( not ( = ?auto_4248 ?auto_4243 ) ) ( not ( = ?auto_4250 ?auto_4243 ) ) ( AVAILABLE ?auto_4243 ) ( SURFACE-AT ?auto_4241 ?auto_4247 ) ( ON ?auto_4241 ?auto_4252 ) ( CLEAR ?auto_4241 ) ( not ( = ?auto_4241 ?auto_4252 ) ) ( not ( = ?auto_4242 ?auto_4252 ) ) ( not ( = ?auto_4244 ?auto_4252 ) ) ( not ( = ?auto_4245 ?auto_4252 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4243 ?auto_4241 ?auto_4252 ?auto_4247 )
      ( MAKE-2CRATE ?auto_4244 ?auto_4241 ?auto_4242 )
      ( MAKE-1CRATE-VERIFY ?auto_4241 ?auto_4242 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4253 - SURFACE
      ?auto_4254 - SURFACE
      ?auto_4255 - SURFACE
    )
    :vars
    (
      ?auto_4262 - HOIST
      ?auto_4259 - PLACE
      ?auto_4257 - PLACE
      ?auto_4256 - HOIST
      ?auto_4264 - SURFACE
      ?auto_4258 - TRUCK
      ?auto_4260 - PLACE
      ?auto_4263 - HOIST
      ?auto_4261 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4262 ?auto_4259 ) ( IS-CRATE ?auto_4255 ) ( not ( = ?auto_4254 ?auto_4255 ) ) ( not ( = ?auto_4253 ?auto_4254 ) ) ( not ( = ?auto_4253 ?auto_4255 ) ) ( not ( = ?auto_4257 ?auto_4259 ) ) ( HOIST-AT ?auto_4256 ?auto_4257 ) ( not ( = ?auto_4262 ?auto_4256 ) ) ( AVAILABLE ?auto_4256 ) ( SURFACE-AT ?auto_4255 ?auto_4257 ) ( ON ?auto_4255 ?auto_4264 ) ( CLEAR ?auto_4255 ) ( not ( = ?auto_4254 ?auto_4264 ) ) ( not ( = ?auto_4255 ?auto_4264 ) ) ( not ( = ?auto_4253 ?auto_4264 ) ) ( SURFACE-AT ?auto_4253 ?auto_4259 ) ( CLEAR ?auto_4253 ) ( IS-CRATE ?auto_4254 ) ( AVAILABLE ?auto_4262 ) ( TRUCK-AT ?auto_4258 ?auto_4260 ) ( not ( = ?auto_4260 ?auto_4259 ) ) ( not ( = ?auto_4257 ?auto_4260 ) ) ( HOIST-AT ?auto_4263 ?auto_4260 ) ( not ( = ?auto_4262 ?auto_4263 ) ) ( not ( = ?auto_4256 ?auto_4263 ) ) ( AVAILABLE ?auto_4263 ) ( SURFACE-AT ?auto_4254 ?auto_4260 ) ( ON ?auto_4254 ?auto_4261 ) ( CLEAR ?auto_4254 ) ( not ( = ?auto_4254 ?auto_4261 ) ) ( not ( = ?auto_4255 ?auto_4261 ) ) ( not ( = ?auto_4253 ?auto_4261 ) ) ( not ( = ?auto_4264 ?auto_4261 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4254 ?auto_4255 )
      ( MAKE-2CRATE-VERIFY ?auto_4253 ?auto_4254 ?auto_4255 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4265 - SURFACE
      ?auto_4266 - SURFACE
      ?auto_4267 - SURFACE
      ?auto_4268 - SURFACE
    )
    :vars
    (
      ?auto_4272 - HOIST
      ?auto_4270 - PLACE
      ?auto_4276 - PLACE
      ?auto_4277 - HOIST
      ?auto_4275 - SURFACE
      ?auto_4271 - TRUCK
      ?auto_4273 - PLACE
      ?auto_4274 - HOIST
      ?auto_4269 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4272 ?auto_4270 ) ( IS-CRATE ?auto_4268 ) ( not ( = ?auto_4267 ?auto_4268 ) ) ( not ( = ?auto_4266 ?auto_4267 ) ) ( not ( = ?auto_4266 ?auto_4268 ) ) ( not ( = ?auto_4276 ?auto_4270 ) ) ( HOIST-AT ?auto_4277 ?auto_4276 ) ( not ( = ?auto_4272 ?auto_4277 ) ) ( AVAILABLE ?auto_4277 ) ( SURFACE-AT ?auto_4268 ?auto_4276 ) ( ON ?auto_4268 ?auto_4275 ) ( CLEAR ?auto_4268 ) ( not ( = ?auto_4267 ?auto_4275 ) ) ( not ( = ?auto_4268 ?auto_4275 ) ) ( not ( = ?auto_4266 ?auto_4275 ) ) ( SURFACE-AT ?auto_4266 ?auto_4270 ) ( CLEAR ?auto_4266 ) ( IS-CRATE ?auto_4267 ) ( AVAILABLE ?auto_4272 ) ( TRUCK-AT ?auto_4271 ?auto_4273 ) ( not ( = ?auto_4273 ?auto_4270 ) ) ( not ( = ?auto_4276 ?auto_4273 ) ) ( HOIST-AT ?auto_4274 ?auto_4273 ) ( not ( = ?auto_4272 ?auto_4274 ) ) ( not ( = ?auto_4277 ?auto_4274 ) ) ( AVAILABLE ?auto_4274 ) ( SURFACE-AT ?auto_4267 ?auto_4273 ) ( ON ?auto_4267 ?auto_4269 ) ( CLEAR ?auto_4267 ) ( not ( = ?auto_4267 ?auto_4269 ) ) ( not ( = ?auto_4268 ?auto_4269 ) ) ( not ( = ?auto_4266 ?auto_4269 ) ) ( not ( = ?auto_4275 ?auto_4269 ) ) ( ON ?auto_4266 ?auto_4265 ) ( not ( = ?auto_4265 ?auto_4266 ) ) ( not ( = ?auto_4265 ?auto_4267 ) ) ( not ( = ?auto_4265 ?auto_4268 ) ) ( not ( = ?auto_4265 ?auto_4275 ) ) ( not ( = ?auto_4265 ?auto_4269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4266 ?auto_4267 ?auto_4268 )
      ( MAKE-3CRATE-VERIFY ?auto_4265 ?auto_4266 ?auto_4267 ?auto_4268 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4278 - SURFACE
      ?auto_4279 - SURFACE
    )
    :vars
    (
      ?auto_4283 - HOIST
      ?auto_4281 - PLACE
      ?auto_4288 - SURFACE
      ?auto_4287 - PLACE
      ?auto_4289 - HOIST
      ?auto_4286 - SURFACE
      ?auto_4284 - PLACE
      ?auto_4285 - HOIST
      ?auto_4280 - SURFACE
      ?auto_4282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4283 ?auto_4281 ) ( IS-CRATE ?auto_4279 ) ( not ( = ?auto_4278 ?auto_4279 ) ) ( not ( = ?auto_4288 ?auto_4278 ) ) ( not ( = ?auto_4288 ?auto_4279 ) ) ( not ( = ?auto_4287 ?auto_4281 ) ) ( HOIST-AT ?auto_4289 ?auto_4287 ) ( not ( = ?auto_4283 ?auto_4289 ) ) ( AVAILABLE ?auto_4289 ) ( SURFACE-AT ?auto_4279 ?auto_4287 ) ( ON ?auto_4279 ?auto_4286 ) ( CLEAR ?auto_4279 ) ( not ( = ?auto_4278 ?auto_4286 ) ) ( not ( = ?auto_4279 ?auto_4286 ) ) ( not ( = ?auto_4288 ?auto_4286 ) ) ( SURFACE-AT ?auto_4288 ?auto_4281 ) ( CLEAR ?auto_4288 ) ( IS-CRATE ?auto_4278 ) ( AVAILABLE ?auto_4283 ) ( not ( = ?auto_4284 ?auto_4281 ) ) ( not ( = ?auto_4287 ?auto_4284 ) ) ( HOIST-AT ?auto_4285 ?auto_4284 ) ( not ( = ?auto_4283 ?auto_4285 ) ) ( not ( = ?auto_4289 ?auto_4285 ) ) ( AVAILABLE ?auto_4285 ) ( SURFACE-AT ?auto_4278 ?auto_4284 ) ( ON ?auto_4278 ?auto_4280 ) ( CLEAR ?auto_4278 ) ( not ( = ?auto_4278 ?auto_4280 ) ) ( not ( = ?auto_4279 ?auto_4280 ) ) ( not ( = ?auto_4288 ?auto_4280 ) ) ( not ( = ?auto_4286 ?auto_4280 ) ) ( TRUCK-AT ?auto_4282 ?auto_4281 ) )
    :subtasks
    ( ( !DRIVE ?auto_4282 ?auto_4281 ?auto_4284 )
      ( MAKE-2CRATE ?auto_4288 ?auto_4278 ?auto_4279 )
      ( MAKE-1CRATE-VERIFY ?auto_4278 ?auto_4279 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4290 - SURFACE
      ?auto_4291 - SURFACE
      ?auto_4292 - SURFACE
    )
    :vars
    (
      ?auto_4293 - HOIST
      ?auto_4295 - PLACE
      ?auto_4297 - PLACE
      ?auto_4298 - HOIST
      ?auto_4301 - SURFACE
      ?auto_4294 - PLACE
      ?auto_4299 - HOIST
      ?auto_4300 - SURFACE
      ?auto_4296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4293 ?auto_4295 ) ( IS-CRATE ?auto_4292 ) ( not ( = ?auto_4291 ?auto_4292 ) ) ( not ( = ?auto_4290 ?auto_4291 ) ) ( not ( = ?auto_4290 ?auto_4292 ) ) ( not ( = ?auto_4297 ?auto_4295 ) ) ( HOIST-AT ?auto_4298 ?auto_4297 ) ( not ( = ?auto_4293 ?auto_4298 ) ) ( AVAILABLE ?auto_4298 ) ( SURFACE-AT ?auto_4292 ?auto_4297 ) ( ON ?auto_4292 ?auto_4301 ) ( CLEAR ?auto_4292 ) ( not ( = ?auto_4291 ?auto_4301 ) ) ( not ( = ?auto_4292 ?auto_4301 ) ) ( not ( = ?auto_4290 ?auto_4301 ) ) ( SURFACE-AT ?auto_4290 ?auto_4295 ) ( CLEAR ?auto_4290 ) ( IS-CRATE ?auto_4291 ) ( AVAILABLE ?auto_4293 ) ( not ( = ?auto_4294 ?auto_4295 ) ) ( not ( = ?auto_4297 ?auto_4294 ) ) ( HOIST-AT ?auto_4299 ?auto_4294 ) ( not ( = ?auto_4293 ?auto_4299 ) ) ( not ( = ?auto_4298 ?auto_4299 ) ) ( AVAILABLE ?auto_4299 ) ( SURFACE-AT ?auto_4291 ?auto_4294 ) ( ON ?auto_4291 ?auto_4300 ) ( CLEAR ?auto_4291 ) ( not ( = ?auto_4291 ?auto_4300 ) ) ( not ( = ?auto_4292 ?auto_4300 ) ) ( not ( = ?auto_4290 ?auto_4300 ) ) ( not ( = ?auto_4301 ?auto_4300 ) ) ( TRUCK-AT ?auto_4296 ?auto_4295 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4291 ?auto_4292 )
      ( MAKE-2CRATE-VERIFY ?auto_4290 ?auto_4291 ?auto_4292 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4302 - SURFACE
      ?auto_4303 - SURFACE
      ?auto_4304 - SURFACE
      ?auto_4305 - SURFACE
    )
    :vars
    (
      ?auto_4314 - HOIST
      ?auto_4309 - PLACE
      ?auto_4306 - PLACE
      ?auto_4310 - HOIST
      ?auto_4311 - SURFACE
      ?auto_4307 - PLACE
      ?auto_4313 - HOIST
      ?auto_4308 - SURFACE
      ?auto_4312 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4314 ?auto_4309 ) ( IS-CRATE ?auto_4305 ) ( not ( = ?auto_4304 ?auto_4305 ) ) ( not ( = ?auto_4303 ?auto_4304 ) ) ( not ( = ?auto_4303 ?auto_4305 ) ) ( not ( = ?auto_4306 ?auto_4309 ) ) ( HOIST-AT ?auto_4310 ?auto_4306 ) ( not ( = ?auto_4314 ?auto_4310 ) ) ( AVAILABLE ?auto_4310 ) ( SURFACE-AT ?auto_4305 ?auto_4306 ) ( ON ?auto_4305 ?auto_4311 ) ( CLEAR ?auto_4305 ) ( not ( = ?auto_4304 ?auto_4311 ) ) ( not ( = ?auto_4305 ?auto_4311 ) ) ( not ( = ?auto_4303 ?auto_4311 ) ) ( SURFACE-AT ?auto_4303 ?auto_4309 ) ( CLEAR ?auto_4303 ) ( IS-CRATE ?auto_4304 ) ( AVAILABLE ?auto_4314 ) ( not ( = ?auto_4307 ?auto_4309 ) ) ( not ( = ?auto_4306 ?auto_4307 ) ) ( HOIST-AT ?auto_4313 ?auto_4307 ) ( not ( = ?auto_4314 ?auto_4313 ) ) ( not ( = ?auto_4310 ?auto_4313 ) ) ( AVAILABLE ?auto_4313 ) ( SURFACE-AT ?auto_4304 ?auto_4307 ) ( ON ?auto_4304 ?auto_4308 ) ( CLEAR ?auto_4304 ) ( not ( = ?auto_4304 ?auto_4308 ) ) ( not ( = ?auto_4305 ?auto_4308 ) ) ( not ( = ?auto_4303 ?auto_4308 ) ) ( not ( = ?auto_4311 ?auto_4308 ) ) ( TRUCK-AT ?auto_4312 ?auto_4309 ) ( ON ?auto_4303 ?auto_4302 ) ( not ( = ?auto_4302 ?auto_4303 ) ) ( not ( = ?auto_4302 ?auto_4304 ) ) ( not ( = ?auto_4302 ?auto_4305 ) ) ( not ( = ?auto_4302 ?auto_4311 ) ) ( not ( = ?auto_4302 ?auto_4308 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4303 ?auto_4304 ?auto_4305 )
      ( MAKE-3CRATE-VERIFY ?auto_4302 ?auto_4303 ?auto_4304 ?auto_4305 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4315 - SURFACE
      ?auto_4316 - SURFACE
    )
    :vars
    (
      ?auto_4326 - HOIST
      ?auto_4321 - PLACE
      ?auto_4320 - SURFACE
      ?auto_4317 - PLACE
      ?auto_4322 - HOIST
      ?auto_4323 - SURFACE
      ?auto_4318 - PLACE
      ?auto_4325 - HOIST
      ?auto_4319 - SURFACE
      ?auto_4324 - TRUCK
      ?auto_4327 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4326 ?auto_4321 ) ( IS-CRATE ?auto_4316 ) ( not ( = ?auto_4315 ?auto_4316 ) ) ( not ( = ?auto_4320 ?auto_4315 ) ) ( not ( = ?auto_4320 ?auto_4316 ) ) ( not ( = ?auto_4317 ?auto_4321 ) ) ( HOIST-AT ?auto_4322 ?auto_4317 ) ( not ( = ?auto_4326 ?auto_4322 ) ) ( AVAILABLE ?auto_4322 ) ( SURFACE-AT ?auto_4316 ?auto_4317 ) ( ON ?auto_4316 ?auto_4323 ) ( CLEAR ?auto_4316 ) ( not ( = ?auto_4315 ?auto_4323 ) ) ( not ( = ?auto_4316 ?auto_4323 ) ) ( not ( = ?auto_4320 ?auto_4323 ) ) ( IS-CRATE ?auto_4315 ) ( not ( = ?auto_4318 ?auto_4321 ) ) ( not ( = ?auto_4317 ?auto_4318 ) ) ( HOIST-AT ?auto_4325 ?auto_4318 ) ( not ( = ?auto_4326 ?auto_4325 ) ) ( not ( = ?auto_4322 ?auto_4325 ) ) ( AVAILABLE ?auto_4325 ) ( SURFACE-AT ?auto_4315 ?auto_4318 ) ( ON ?auto_4315 ?auto_4319 ) ( CLEAR ?auto_4315 ) ( not ( = ?auto_4315 ?auto_4319 ) ) ( not ( = ?auto_4316 ?auto_4319 ) ) ( not ( = ?auto_4320 ?auto_4319 ) ) ( not ( = ?auto_4323 ?auto_4319 ) ) ( TRUCK-AT ?auto_4324 ?auto_4321 ) ( SURFACE-AT ?auto_4327 ?auto_4321 ) ( CLEAR ?auto_4327 ) ( LIFTING ?auto_4326 ?auto_4320 ) ( IS-CRATE ?auto_4320 ) ( not ( = ?auto_4327 ?auto_4320 ) ) ( not ( = ?auto_4315 ?auto_4327 ) ) ( not ( = ?auto_4316 ?auto_4327 ) ) ( not ( = ?auto_4323 ?auto_4327 ) ) ( not ( = ?auto_4319 ?auto_4327 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4327 ?auto_4320 )
      ( MAKE-2CRATE ?auto_4320 ?auto_4315 ?auto_4316 )
      ( MAKE-1CRATE-VERIFY ?auto_4315 ?auto_4316 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4328 - SURFACE
      ?auto_4329 - SURFACE
      ?auto_4330 - SURFACE
    )
    :vars
    (
      ?auto_4332 - HOIST
      ?auto_4334 - PLACE
      ?auto_4331 - PLACE
      ?auto_4338 - HOIST
      ?auto_4339 - SURFACE
      ?auto_4340 - PLACE
      ?auto_4333 - HOIST
      ?auto_4335 - SURFACE
      ?auto_4336 - TRUCK
      ?auto_4337 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4332 ?auto_4334 ) ( IS-CRATE ?auto_4330 ) ( not ( = ?auto_4329 ?auto_4330 ) ) ( not ( = ?auto_4328 ?auto_4329 ) ) ( not ( = ?auto_4328 ?auto_4330 ) ) ( not ( = ?auto_4331 ?auto_4334 ) ) ( HOIST-AT ?auto_4338 ?auto_4331 ) ( not ( = ?auto_4332 ?auto_4338 ) ) ( AVAILABLE ?auto_4338 ) ( SURFACE-AT ?auto_4330 ?auto_4331 ) ( ON ?auto_4330 ?auto_4339 ) ( CLEAR ?auto_4330 ) ( not ( = ?auto_4329 ?auto_4339 ) ) ( not ( = ?auto_4330 ?auto_4339 ) ) ( not ( = ?auto_4328 ?auto_4339 ) ) ( IS-CRATE ?auto_4329 ) ( not ( = ?auto_4340 ?auto_4334 ) ) ( not ( = ?auto_4331 ?auto_4340 ) ) ( HOIST-AT ?auto_4333 ?auto_4340 ) ( not ( = ?auto_4332 ?auto_4333 ) ) ( not ( = ?auto_4338 ?auto_4333 ) ) ( AVAILABLE ?auto_4333 ) ( SURFACE-AT ?auto_4329 ?auto_4340 ) ( ON ?auto_4329 ?auto_4335 ) ( CLEAR ?auto_4329 ) ( not ( = ?auto_4329 ?auto_4335 ) ) ( not ( = ?auto_4330 ?auto_4335 ) ) ( not ( = ?auto_4328 ?auto_4335 ) ) ( not ( = ?auto_4339 ?auto_4335 ) ) ( TRUCK-AT ?auto_4336 ?auto_4334 ) ( SURFACE-AT ?auto_4337 ?auto_4334 ) ( CLEAR ?auto_4337 ) ( LIFTING ?auto_4332 ?auto_4328 ) ( IS-CRATE ?auto_4328 ) ( not ( = ?auto_4337 ?auto_4328 ) ) ( not ( = ?auto_4329 ?auto_4337 ) ) ( not ( = ?auto_4330 ?auto_4337 ) ) ( not ( = ?auto_4339 ?auto_4337 ) ) ( not ( = ?auto_4335 ?auto_4337 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4329 ?auto_4330 )
      ( MAKE-2CRATE-VERIFY ?auto_4328 ?auto_4329 ?auto_4330 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4341 - SURFACE
      ?auto_4342 - SURFACE
      ?auto_4343 - SURFACE
      ?auto_4344 - SURFACE
    )
    :vars
    (
      ?auto_4353 - HOIST
      ?auto_4346 - PLACE
      ?auto_4345 - PLACE
      ?auto_4349 - HOIST
      ?auto_4348 - SURFACE
      ?auto_4347 - PLACE
      ?auto_4350 - HOIST
      ?auto_4352 - SURFACE
      ?auto_4351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4353 ?auto_4346 ) ( IS-CRATE ?auto_4344 ) ( not ( = ?auto_4343 ?auto_4344 ) ) ( not ( = ?auto_4342 ?auto_4343 ) ) ( not ( = ?auto_4342 ?auto_4344 ) ) ( not ( = ?auto_4345 ?auto_4346 ) ) ( HOIST-AT ?auto_4349 ?auto_4345 ) ( not ( = ?auto_4353 ?auto_4349 ) ) ( AVAILABLE ?auto_4349 ) ( SURFACE-AT ?auto_4344 ?auto_4345 ) ( ON ?auto_4344 ?auto_4348 ) ( CLEAR ?auto_4344 ) ( not ( = ?auto_4343 ?auto_4348 ) ) ( not ( = ?auto_4344 ?auto_4348 ) ) ( not ( = ?auto_4342 ?auto_4348 ) ) ( IS-CRATE ?auto_4343 ) ( not ( = ?auto_4347 ?auto_4346 ) ) ( not ( = ?auto_4345 ?auto_4347 ) ) ( HOIST-AT ?auto_4350 ?auto_4347 ) ( not ( = ?auto_4353 ?auto_4350 ) ) ( not ( = ?auto_4349 ?auto_4350 ) ) ( AVAILABLE ?auto_4350 ) ( SURFACE-AT ?auto_4343 ?auto_4347 ) ( ON ?auto_4343 ?auto_4352 ) ( CLEAR ?auto_4343 ) ( not ( = ?auto_4343 ?auto_4352 ) ) ( not ( = ?auto_4344 ?auto_4352 ) ) ( not ( = ?auto_4342 ?auto_4352 ) ) ( not ( = ?auto_4348 ?auto_4352 ) ) ( TRUCK-AT ?auto_4351 ?auto_4346 ) ( SURFACE-AT ?auto_4341 ?auto_4346 ) ( CLEAR ?auto_4341 ) ( LIFTING ?auto_4353 ?auto_4342 ) ( IS-CRATE ?auto_4342 ) ( not ( = ?auto_4341 ?auto_4342 ) ) ( not ( = ?auto_4343 ?auto_4341 ) ) ( not ( = ?auto_4344 ?auto_4341 ) ) ( not ( = ?auto_4348 ?auto_4341 ) ) ( not ( = ?auto_4352 ?auto_4341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4342 ?auto_4343 ?auto_4344 )
      ( MAKE-3CRATE-VERIFY ?auto_4341 ?auto_4342 ?auto_4343 ?auto_4344 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4354 - SURFACE
      ?auto_4355 - SURFACE
    )
    :vars
    (
      ?auto_4366 - HOIST
      ?auto_4358 - PLACE
      ?auto_4357 - SURFACE
      ?auto_4356 - PLACE
      ?auto_4361 - HOIST
      ?auto_4360 - SURFACE
      ?auto_4359 - PLACE
      ?auto_4362 - HOIST
      ?auto_4365 - SURFACE
      ?auto_4364 - TRUCK
      ?auto_4363 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4366 ?auto_4358 ) ( IS-CRATE ?auto_4355 ) ( not ( = ?auto_4354 ?auto_4355 ) ) ( not ( = ?auto_4357 ?auto_4354 ) ) ( not ( = ?auto_4357 ?auto_4355 ) ) ( not ( = ?auto_4356 ?auto_4358 ) ) ( HOIST-AT ?auto_4361 ?auto_4356 ) ( not ( = ?auto_4366 ?auto_4361 ) ) ( AVAILABLE ?auto_4361 ) ( SURFACE-AT ?auto_4355 ?auto_4356 ) ( ON ?auto_4355 ?auto_4360 ) ( CLEAR ?auto_4355 ) ( not ( = ?auto_4354 ?auto_4360 ) ) ( not ( = ?auto_4355 ?auto_4360 ) ) ( not ( = ?auto_4357 ?auto_4360 ) ) ( IS-CRATE ?auto_4354 ) ( not ( = ?auto_4359 ?auto_4358 ) ) ( not ( = ?auto_4356 ?auto_4359 ) ) ( HOIST-AT ?auto_4362 ?auto_4359 ) ( not ( = ?auto_4366 ?auto_4362 ) ) ( not ( = ?auto_4361 ?auto_4362 ) ) ( AVAILABLE ?auto_4362 ) ( SURFACE-AT ?auto_4354 ?auto_4359 ) ( ON ?auto_4354 ?auto_4365 ) ( CLEAR ?auto_4354 ) ( not ( = ?auto_4354 ?auto_4365 ) ) ( not ( = ?auto_4355 ?auto_4365 ) ) ( not ( = ?auto_4357 ?auto_4365 ) ) ( not ( = ?auto_4360 ?auto_4365 ) ) ( TRUCK-AT ?auto_4364 ?auto_4358 ) ( SURFACE-AT ?auto_4363 ?auto_4358 ) ( CLEAR ?auto_4363 ) ( IS-CRATE ?auto_4357 ) ( not ( = ?auto_4363 ?auto_4357 ) ) ( not ( = ?auto_4354 ?auto_4363 ) ) ( not ( = ?auto_4355 ?auto_4363 ) ) ( not ( = ?auto_4360 ?auto_4363 ) ) ( not ( = ?auto_4365 ?auto_4363 ) ) ( AVAILABLE ?auto_4366 ) ( IN ?auto_4357 ?auto_4364 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4366 ?auto_4357 ?auto_4364 ?auto_4358 )
      ( MAKE-2CRATE ?auto_4357 ?auto_4354 ?auto_4355 )
      ( MAKE-1CRATE-VERIFY ?auto_4354 ?auto_4355 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4367 - SURFACE
      ?auto_4368 - SURFACE
      ?auto_4369 - SURFACE
    )
    :vars
    (
      ?auto_4378 - HOIST
      ?auto_4372 - PLACE
      ?auto_4373 - PLACE
      ?auto_4370 - HOIST
      ?auto_4376 - SURFACE
      ?auto_4377 - PLACE
      ?auto_4375 - HOIST
      ?auto_4379 - SURFACE
      ?auto_4374 - TRUCK
      ?auto_4371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4378 ?auto_4372 ) ( IS-CRATE ?auto_4369 ) ( not ( = ?auto_4368 ?auto_4369 ) ) ( not ( = ?auto_4367 ?auto_4368 ) ) ( not ( = ?auto_4367 ?auto_4369 ) ) ( not ( = ?auto_4373 ?auto_4372 ) ) ( HOIST-AT ?auto_4370 ?auto_4373 ) ( not ( = ?auto_4378 ?auto_4370 ) ) ( AVAILABLE ?auto_4370 ) ( SURFACE-AT ?auto_4369 ?auto_4373 ) ( ON ?auto_4369 ?auto_4376 ) ( CLEAR ?auto_4369 ) ( not ( = ?auto_4368 ?auto_4376 ) ) ( not ( = ?auto_4369 ?auto_4376 ) ) ( not ( = ?auto_4367 ?auto_4376 ) ) ( IS-CRATE ?auto_4368 ) ( not ( = ?auto_4377 ?auto_4372 ) ) ( not ( = ?auto_4373 ?auto_4377 ) ) ( HOIST-AT ?auto_4375 ?auto_4377 ) ( not ( = ?auto_4378 ?auto_4375 ) ) ( not ( = ?auto_4370 ?auto_4375 ) ) ( AVAILABLE ?auto_4375 ) ( SURFACE-AT ?auto_4368 ?auto_4377 ) ( ON ?auto_4368 ?auto_4379 ) ( CLEAR ?auto_4368 ) ( not ( = ?auto_4368 ?auto_4379 ) ) ( not ( = ?auto_4369 ?auto_4379 ) ) ( not ( = ?auto_4367 ?auto_4379 ) ) ( not ( = ?auto_4376 ?auto_4379 ) ) ( TRUCK-AT ?auto_4374 ?auto_4372 ) ( SURFACE-AT ?auto_4371 ?auto_4372 ) ( CLEAR ?auto_4371 ) ( IS-CRATE ?auto_4367 ) ( not ( = ?auto_4371 ?auto_4367 ) ) ( not ( = ?auto_4368 ?auto_4371 ) ) ( not ( = ?auto_4369 ?auto_4371 ) ) ( not ( = ?auto_4376 ?auto_4371 ) ) ( not ( = ?auto_4379 ?auto_4371 ) ) ( AVAILABLE ?auto_4378 ) ( IN ?auto_4367 ?auto_4374 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4368 ?auto_4369 )
      ( MAKE-2CRATE-VERIFY ?auto_4367 ?auto_4368 ?auto_4369 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4380 - SURFACE
      ?auto_4381 - SURFACE
      ?auto_4382 - SURFACE
      ?auto_4383 - SURFACE
    )
    :vars
    (
      ?auto_4390 - HOIST
      ?auto_4389 - PLACE
      ?auto_4391 - PLACE
      ?auto_4384 - HOIST
      ?auto_4385 - SURFACE
      ?auto_4392 - PLACE
      ?auto_4386 - HOIST
      ?auto_4387 - SURFACE
      ?auto_4388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4390 ?auto_4389 ) ( IS-CRATE ?auto_4383 ) ( not ( = ?auto_4382 ?auto_4383 ) ) ( not ( = ?auto_4381 ?auto_4382 ) ) ( not ( = ?auto_4381 ?auto_4383 ) ) ( not ( = ?auto_4391 ?auto_4389 ) ) ( HOIST-AT ?auto_4384 ?auto_4391 ) ( not ( = ?auto_4390 ?auto_4384 ) ) ( AVAILABLE ?auto_4384 ) ( SURFACE-AT ?auto_4383 ?auto_4391 ) ( ON ?auto_4383 ?auto_4385 ) ( CLEAR ?auto_4383 ) ( not ( = ?auto_4382 ?auto_4385 ) ) ( not ( = ?auto_4383 ?auto_4385 ) ) ( not ( = ?auto_4381 ?auto_4385 ) ) ( IS-CRATE ?auto_4382 ) ( not ( = ?auto_4392 ?auto_4389 ) ) ( not ( = ?auto_4391 ?auto_4392 ) ) ( HOIST-AT ?auto_4386 ?auto_4392 ) ( not ( = ?auto_4390 ?auto_4386 ) ) ( not ( = ?auto_4384 ?auto_4386 ) ) ( AVAILABLE ?auto_4386 ) ( SURFACE-AT ?auto_4382 ?auto_4392 ) ( ON ?auto_4382 ?auto_4387 ) ( CLEAR ?auto_4382 ) ( not ( = ?auto_4382 ?auto_4387 ) ) ( not ( = ?auto_4383 ?auto_4387 ) ) ( not ( = ?auto_4381 ?auto_4387 ) ) ( not ( = ?auto_4385 ?auto_4387 ) ) ( TRUCK-AT ?auto_4388 ?auto_4389 ) ( SURFACE-AT ?auto_4380 ?auto_4389 ) ( CLEAR ?auto_4380 ) ( IS-CRATE ?auto_4381 ) ( not ( = ?auto_4380 ?auto_4381 ) ) ( not ( = ?auto_4382 ?auto_4380 ) ) ( not ( = ?auto_4383 ?auto_4380 ) ) ( not ( = ?auto_4385 ?auto_4380 ) ) ( not ( = ?auto_4387 ?auto_4380 ) ) ( AVAILABLE ?auto_4390 ) ( IN ?auto_4381 ?auto_4388 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4381 ?auto_4382 ?auto_4383 )
      ( MAKE-3CRATE-VERIFY ?auto_4380 ?auto_4381 ?auto_4382 ?auto_4383 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4393 - SURFACE
      ?auto_4394 - SURFACE
    )
    :vars
    (
      ?auto_4403 - HOIST
      ?auto_4402 - PLACE
      ?auto_4401 - SURFACE
      ?auto_4404 - PLACE
      ?auto_4395 - HOIST
      ?auto_4396 - SURFACE
      ?auto_4405 - PLACE
      ?auto_4397 - HOIST
      ?auto_4399 - SURFACE
      ?auto_4398 - SURFACE
      ?auto_4400 - TRUCK
      ?auto_4406 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4403 ?auto_4402 ) ( IS-CRATE ?auto_4394 ) ( not ( = ?auto_4393 ?auto_4394 ) ) ( not ( = ?auto_4401 ?auto_4393 ) ) ( not ( = ?auto_4401 ?auto_4394 ) ) ( not ( = ?auto_4404 ?auto_4402 ) ) ( HOIST-AT ?auto_4395 ?auto_4404 ) ( not ( = ?auto_4403 ?auto_4395 ) ) ( AVAILABLE ?auto_4395 ) ( SURFACE-AT ?auto_4394 ?auto_4404 ) ( ON ?auto_4394 ?auto_4396 ) ( CLEAR ?auto_4394 ) ( not ( = ?auto_4393 ?auto_4396 ) ) ( not ( = ?auto_4394 ?auto_4396 ) ) ( not ( = ?auto_4401 ?auto_4396 ) ) ( IS-CRATE ?auto_4393 ) ( not ( = ?auto_4405 ?auto_4402 ) ) ( not ( = ?auto_4404 ?auto_4405 ) ) ( HOIST-AT ?auto_4397 ?auto_4405 ) ( not ( = ?auto_4403 ?auto_4397 ) ) ( not ( = ?auto_4395 ?auto_4397 ) ) ( AVAILABLE ?auto_4397 ) ( SURFACE-AT ?auto_4393 ?auto_4405 ) ( ON ?auto_4393 ?auto_4399 ) ( CLEAR ?auto_4393 ) ( not ( = ?auto_4393 ?auto_4399 ) ) ( not ( = ?auto_4394 ?auto_4399 ) ) ( not ( = ?auto_4401 ?auto_4399 ) ) ( not ( = ?auto_4396 ?auto_4399 ) ) ( SURFACE-AT ?auto_4398 ?auto_4402 ) ( CLEAR ?auto_4398 ) ( IS-CRATE ?auto_4401 ) ( not ( = ?auto_4398 ?auto_4401 ) ) ( not ( = ?auto_4393 ?auto_4398 ) ) ( not ( = ?auto_4394 ?auto_4398 ) ) ( not ( = ?auto_4396 ?auto_4398 ) ) ( not ( = ?auto_4399 ?auto_4398 ) ) ( AVAILABLE ?auto_4403 ) ( IN ?auto_4401 ?auto_4400 ) ( TRUCK-AT ?auto_4400 ?auto_4406 ) ( not ( = ?auto_4406 ?auto_4402 ) ) ( not ( = ?auto_4404 ?auto_4406 ) ) ( not ( = ?auto_4405 ?auto_4406 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4400 ?auto_4406 ?auto_4402 )
      ( MAKE-2CRATE ?auto_4401 ?auto_4393 ?auto_4394 )
      ( MAKE-1CRATE-VERIFY ?auto_4393 ?auto_4394 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4407 - SURFACE
      ?auto_4408 - SURFACE
      ?auto_4409 - SURFACE
    )
    :vars
    (
      ?auto_4413 - HOIST
      ?auto_4410 - PLACE
      ?auto_4419 - PLACE
      ?auto_4420 - HOIST
      ?auto_4416 - SURFACE
      ?auto_4417 - PLACE
      ?auto_4412 - HOIST
      ?auto_4411 - SURFACE
      ?auto_4414 - SURFACE
      ?auto_4418 - TRUCK
      ?auto_4415 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4413 ?auto_4410 ) ( IS-CRATE ?auto_4409 ) ( not ( = ?auto_4408 ?auto_4409 ) ) ( not ( = ?auto_4407 ?auto_4408 ) ) ( not ( = ?auto_4407 ?auto_4409 ) ) ( not ( = ?auto_4419 ?auto_4410 ) ) ( HOIST-AT ?auto_4420 ?auto_4419 ) ( not ( = ?auto_4413 ?auto_4420 ) ) ( AVAILABLE ?auto_4420 ) ( SURFACE-AT ?auto_4409 ?auto_4419 ) ( ON ?auto_4409 ?auto_4416 ) ( CLEAR ?auto_4409 ) ( not ( = ?auto_4408 ?auto_4416 ) ) ( not ( = ?auto_4409 ?auto_4416 ) ) ( not ( = ?auto_4407 ?auto_4416 ) ) ( IS-CRATE ?auto_4408 ) ( not ( = ?auto_4417 ?auto_4410 ) ) ( not ( = ?auto_4419 ?auto_4417 ) ) ( HOIST-AT ?auto_4412 ?auto_4417 ) ( not ( = ?auto_4413 ?auto_4412 ) ) ( not ( = ?auto_4420 ?auto_4412 ) ) ( AVAILABLE ?auto_4412 ) ( SURFACE-AT ?auto_4408 ?auto_4417 ) ( ON ?auto_4408 ?auto_4411 ) ( CLEAR ?auto_4408 ) ( not ( = ?auto_4408 ?auto_4411 ) ) ( not ( = ?auto_4409 ?auto_4411 ) ) ( not ( = ?auto_4407 ?auto_4411 ) ) ( not ( = ?auto_4416 ?auto_4411 ) ) ( SURFACE-AT ?auto_4414 ?auto_4410 ) ( CLEAR ?auto_4414 ) ( IS-CRATE ?auto_4407 ) ( not ( = ?auto_4414 ?auto_4407 ) ) ( not ( = ?auto_4408 ?auto_4414 ) ) ( not ( = ?auto_4409 ?auto_4414 ) ) ( not ( = ?auto_4416 ?auto_4414 ) ) ( not ( = ?auto_4411 ?auto_4414 ) ) ( AVAILABLE ?auto_4413 ) ( IN ?auto_4407 ?auto_4418 ) ( TRUCK-AT ?auto_4418 ?auto_4415 ) ( not ( = ?auto_4415 ?auto_4410 ) ) ( not ( = ?auto_4419 ?auto_4415 ) ) ( not ( = ?auto_4417 ?auto_4415 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4408 ?auto_4409 )
      ( MAKE-2CRATE-VERIFY ?auto_4407 ?auto_4408 ?auto_4409 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4421 - SURFACE
      ?auto_4422 - SURFACE
      ?auto_4423 - SURFACE
      ?auto_4424 - SURFACE
    )
    :vars
    (
      ?auto_4427 - HOIST
      ?auto_4433 - PLACE
      ?auto_4431 - PLACE
      ?auto_4432 - HOIST
      ?auto_4429 - SURFACE
      ?auto_4430 - PLACE
      ?auto_4425 - HOIST
      ?auto_4434 - SURFACE
      ?auto_4428 - TRUCK
      ?auto_4426 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4427 ?auto_4433 ) ( IS-CRATE ?auto_4424 ) ( not ( = ?auto_4423 ?auto_4424 ) ) ( not ( = ?auto_4422 ?auto_4423 ) ) ( not ( = ?auto_4422 ?auto_4424 ) ) ( not ( = ?auto_4431 ?auto_4433 ) ) ( HOIST-AT ?auto_4432 ?auto_4431 ) ( not ( = ?auto_4427 ?auto_4432 ) ) ( AVAILABLE ?auto_4432 ) ( SURFACE-AT ?auto_4424 ?auto_4431 ) ( ON ?auto_4424 ?auto_4429 ) ( CLEAR ?auto_4424 ) ( not ( = ?auto_4423 ?auto_4429 ) ) ( not ( = ?auto_4424 ?auto_4429 ) ) ( not ( = ?auto_4422 ?auto_4429 ) ) ( IS-CRATE ?auto_4423 ) ( not ( = ?auto_4430 ?auto_4433 ) ) ( not ( = ?auto_4431 ?auto_4430 ) ) ( HOIST-AT ?auto_4425 ?auto_4430 ) ( not ( = ?auto_4427 ?auto_4425 ) ) ( not ( = ?auto_4432 ?auto_4425 ) ) ( AVAILABLE ?auto_4425 ) ( SURFACE-AT ?auto_4423 ?auto_4430 ) ( ON ?auto_4423 ?auto_4434 ) ( CLEAR ?auto_4423 ) ( not ( = ?auto_4423 ?auto_4434 ) ) ( not ( = ?auto_4424 ?auto_4434 ) ) ( not ( = ?auto_4422 ?auto_4434 ) ) ( not ( = ?auto_4429 ?auto_4434 ) ) ( SURFACE-AT ?auto_4421 ?auto_4433 ) ( CLEAR ?auto_4421 ) ( IS-CRATE ?auto_4422 ) ( not ( = ?auto_4421 ?auto_4422 ) ) ( not ( = ?auto_4423 ?auto_4421 ) ) ( not ( = ?auto_4424 ?auto_4421 ) ) ( not ( = ?auto_4429 ?auto_4421 ) ) ( not ( = ?auto_4434 ?auto_4421 ) ) ( AVAILABLE ?auto_4427 ) ( IN ?auto_4422 ?auto_4428 ) ( TRUCK-AT ?auto_4428 ?auto_4426 ) ( not ( = ?auto_4426 ?auto_4433 ) ) ( not ( = ?auto_4431 ?auto_4426 ) ) ( not ( = ?auto_4430 ?auto_4426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4422 ?auto_4423 ?auto_4424 )
      ( MAKE-3CRATE-VERIFY ?auto_4421 ?auto_4422 ?auto_4423 ?auto_4424 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4435 - SURFACE
      ?auto_4436 - SURFACE
    )
    :vars
    (
      ?auto_4440 - HOIST
      ?auto_4447 - PLACE
      ?auto_4437 - SURFACE
      ?auto_4445 - PLACE
      ?auto_4446 - HOIST
      ?auto_4442 - SURFACE
      ?auto_4443 - PLACE
      ?auto_4438 - HOIST
      ?auto_4448 - SURFACE
      ?auto_4444 - SURFACE
      ?auto_4441 - TRUCK
      ?auto_4439 - PLACE
      ?auto_4449 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4440 ?auto_4447 ) ( IS-CRATE ?auto_4436 ) ( not ( = ?auto_4435 ?auto_4436 ) ) ( not ( = ?auto_4437 ?auto_4435 ) ) ( not ( = ?auto_4437 ?auto_4436 ) ) ( not ( = ?auto_4445 ?auto_4447 ) ) ( HOIST-AT ?auto_4446 ?auto_4445 ) ( not ( = ?auto_4440 ?auto_4446 ) ) ( AVAILABLE ?auto_4446 ) ( SURFACE-AT ?auto_4436 ?auto_4445 ) ( ON ?auto_4436 ?auto_4442 ) ( CLEAR ?auto_4436 ) ( not ( = ?auto_4435 ?auto_4442 ) ) ( not ( = ?auto_4436 ?auto_4442 ) ) ( not ( = ?auto_4437 ?auto_4442 ) ) ( IS-CRATE ?auto_4435 ) ( not ( = ?auto_4443 ?auto_4447 ) ) ( not ( = ?auto_4445 ?auto_4443 ) ) ( HOIST-AT ?auto_4438 ?auto_4443 ) ( not ( = ?auto_4440 ?auto_4438 ) ) ( not ( = ?auto_4446 ?auto_4438 ) ) ( AVAILABLE ?auto_4438 ) ( SURFACE-AT ?auto_4435 ?auto_4443 ) ( ON ?auto_4435 ?auto_4448 ) ( CLEAR ?auto_4435 ) ( not ( = ?auto_4435 ?auto_4448 ) ) ( not ( = ?auto_4436 ?auto_4448 ) ) ( not ( = ?auto_4437 ?auto_4448 ) ) ( not ( = ?auto_4442 ?auto_4448 ) ) ( SURFACE-AT ?auto_4444 ?auto_4447 ) ( CLEAR ?auto_4444 ) ( IS-CRATE ?auto_4437 ) ( not ( = ?auto_4444 ?auto_4437 ) ) ( not ( = ?auto_4435 ?auto_4444 ) ) ( not ( = ?auto_4436 ?auto_4444 ) ) ( not ( = ?auto_4442 ?auto_4444 ) ) ( not ( = ?auto_4448 ?auto_4444 ) ) ( AVAILABLE ?auto_4440 ) ( TRUCK-AT ?auto_4441 ?auto_4439 ) ( not ( = ?auto_4439 ?auto_4447 ) ) ( not ( = ?auto_4445 ?auto_4439 ) ) ( not ( = ?auto_4443 ?auto_4439 ) ) ( HOIST-AT ?auto_4449 ?auto_4439 ) ( LIFTING ?auto_4449 ?auto_4437 ) ( not ( = ?auto_4440 ?auto_4449 ) ) ( not ( = ?auto_4446 ?auto_4449 ) ) ( not ( = ?auto_4438 ?auto_4449 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4449 ?auto_4437 ?auto_4441 ?auto_4439 )
      ( MAKE-2CRATE ?auto_4437 ?auto_4435 ?auto_4436 )
      ( MAKE-1CRATE-VERIFY ?auto_4435 ?auto_4436 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4450 - SURFACE
      ?auto_4451 - SURFACE
      ?auto_4452 - SURFACE
    )
    :vars
    (
      ?auto_4463 - HOIST
      ?auto_4461 - PLACE
      ?auto_4458 - PLACE
      ?auto_4460 - HOIST
      ?auto_4457 - SURFACE
      ?auto_4462 - PLACE
      ?auto_4455 - HOIST
      ?auto_4453 - SURFACE
      ?auto_4459 - SURFACE
      ?auto_4456 - TRUCK
      ?auto_4454 - PLACE
      ?auto_4464 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4463 ?auto_4461 ) ( IS-CRATE ?auto_4452 ) ( not ( = ?auto_4451 ?auto_4452 ) ) ( not ( = ?auto_4450 ?auto_4451 ) ) ( not ( = ?auto_4450 ?auto_4452 ) ) ( not ( = ?auto_4458 ?auto_4461 ) ) ( HOIST-AT ?auto_4460 ?auto_4458 ) ( not ( = ?auto_4463 ?auto_4460 ) ) ( AVAILABLE ?auto_4460 ) ( SURFACE-AT ?auto_4452 ?auto_4458 ) ( ON ?auto_4452 ?auto_4457 ) ( CLEAR ?auto_4452 ) ( not ( = ?auto_4451 ?auto_4457 ) ) ( not ( = ?auto_4452 ?auto_4457 ) ) ( not ( = ?auto_4450 ?auto_4457 ) ) ( IS-CRATE ?auto_4451 ) ( not ( = ?auto_4462 ?auto_4461 ) ) ( not ( = ?auto_4458 ?auto_4462 ) ) ( HOIST-AT ?auto_4455 ?auto_4462 ) ( not ( = ?auto_4463 ?auto_4455 ) ) ( not ( = ?auto_4460 ?auto_4455 ) ) ( AVAILABLE ?auto_4455 ) ( SURFACE-AT ?auto_4451 ?auto_4462 ) ( ON ?auto_4451 ?auto_4453 ) ( CLEAR ?auto_4451 ) ( not ( = ?auto_4451 ?auto_4453 ) ) ( not ( = ?auto_4452 ?auto_4453 ) ) ( not ( = ?auto_4450 ?auto_4453 ) ) ( not ( = ?auto_4457 ?auto_4453 ) ) ( SURFACE-AT ?auto_4459 ?auto_4461 ) ( CLEAR ?auto_4459 ) ( IS-CRATE ?auto_4450 ) ( not ( = ?auto_4459 ?auto_4450 ) ) ( not ( = ?auto_4451 ?auto_4459 ) ) ( not ( = ?auto_4452 ?auto_4459 ) ) ( not ( = ?auto_4457 ?auto_4459 ) ) ( not ( = ?auto_4453 ?auto_4459 ) ) ( AVAILABLE ?auto_4463 ) ( TRUCK-AT ?auto_4456 ?auto_4454 ) ( not ( = ?auto_4454 ?auto_4461 ) ) ( not ( = ?auto_4458 ?auto_4454 ) ) ( not ( = ?auto_4462 ?auto_4454 ) ) ( HOIST-AT ?auto_4464 ?auto_4454 ) ( LIFTING ?auto_4464 ?auto_4450 ) ( not ( = ?auto_4463 ?auto_4464 ) ) ( not ( = ?auto_4460 ?auto_4464 ) ) ( not ( = ?auto_4455 ?auto_4464 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4451 ?auto_4452 )
      ( MAKE-2CRATE-VERIFY ?auto_4450 ?auto_4451 ?auto_4452 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4465 - SURFACE
      ?auto_4466 - SURFACE
      ?auto_4467 - SURFACE
      ?auto_4468 - SURFACE
    )
    :vars
    (
      ?auto_4474 - HOIST
      ?auto_4469 - PLACE
      ?auto_4470 - PLACE
      ?auto_4475 - HOIST
      ?auto_4472 - SURFACE
      ?auto_4473 - PLACE
      ?auto_4479 - HOIST
      ?auto_4477 - SURFACE
      ?auto_4476 - TRUCK
      ?auto_4478 - PLACE
      ?auto_4471 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4474 ?auto_4469 ) ( IS-CRATE ?auto_4468 ) ( not ( = ?auto_4467 ?auto_4468 ) ) ( not ( = ?auto_4466 ?auto_4467 ) ) ( not ( = ?auto_4466 ?auto_4468 ) ) ( not ( = ?auto_4470 ?auto_4469 ) ) ( HOIST-AT ?auto_4475 ?auto_4470 ) ( not ( = ?auto_4474 ?auto_4475 ) ) ( AVAILABLE ?auto_4475 ) ( SURFACE-AT ?auto_4468 ?auto_4470 ) ( ON ?auto_4468 ?auto_4472 ) ( CLEAR ?auto_4468 ) ( not ( = ?auto_4467 ?auto_4472 ) ) ( not ( = ?auto_4468 ?auto_4472 ) ) ( not ( = ?auto_4466 ?auto_4472 ) ) ( IS-CRATE ?auto_4467 ) ( not ( = ?auto_4473 ?auto_4469 ) ) ( not ( = ?auto_4470 ?auto_4473 ) ) ( HOIST-AT ?auto_4479 ?auto_4473 ) ( not ( = ?auto_4474 ?auto_4479 ) ) ( not ( = ?auto_4475 ?auto_4479 ) ) ( AVAILABLE ?auto_4479 ) ( SURFACE-AT ?auto_4467 ?auto_4473 ) ( ON ?auto_4467 ?auto_4477 ) ( CLEAR ?auto_4467 ) ( not ( = ?auto_4467 ?auto_4477 ) ) ( not ( = ?auto_4468 ?auto_4477 ) ) ( not ( = ?auto_4466 ?auto_4477 ) ) ( not ( = ?auto_4472 ?auto_4477 ) ) ( SURFACE-AT ?auto_4465 ?auto_4469 ) ( CLEAR ?auto_4465 ) ( IS-CRATE ?auto_4466 ) ( not ( = ?auto_4465 ?auto_4466 ) ) ( not ( = ?auto_4467 ?auto_4465 ) ) ( not ( = ?auto_4468 ?auto_4465 ) ) ( not ( = ?auto_4472 ?auto_4465 ) ) ( not ( = ?auto_4477 ?auto_4465 ) ) ( AVAILABLE ?auto_4474 ) ( TRUCK-AT ?auto_4476 ?auto_4478 ) ( not ( = ?auto_4478 ?auto_4469 ) ) ( not ( = ?auto_4470 ?auto_4478 ) ) ( not ( = ?auto_4473 ?auto_4478 ) ) ( HOIST-AT ?auto_4471 ?auto_4478 ) ( LIFTING ?auto_4471 ?auto_4466 ) ( not ( = ?auto_4474 ?auto_4471 ) ) ( not ( = ?auto_4475 ?auto_4471 ) ) ( not ( = ?auto_4479 ?auto_4471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4466 ?auto_4467 ?auto_4468 )
      ( MAKE-3CRATE-VERIFY ?auto_4465 ?auto_4466 ?auto_4467 ?auto_4468 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4480 - SURFACE
      ?auto_4481 - SURFACE
    )
    :vars
    (
      ?auto_4488 - HOIST
      ?auto_4483 - PLACE
      ?auto_4494 - SURFACE
      ?auto_4484 - PLACE
      ?auto_4489 - HOIST
      ?auto_4486 - SURFACE
      ?auto_4487 - PLACE
      ?auto_4493 - HOIST
      ?auto_4491 - SURFACE
      ?auto_4482 - SURFACE
      ?auto_4490 - TRUCK
      ?auto_4492 - PLACE
      ?auto_4485 - HOIST
      ?auto_4495 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4488 ?auto_4483 ) ( IS-CRATE ?auto_4481 ) ( not ( = ?auto_4480 ?auto_4481 ) ) ( not ( = ?auto_4494 ?auto_4480 ) ) ( not ( = ?auto_4494 ?auto_4481 ) ) ( not ( = ?auto_4484 ?auto_4483 ) ) ( HOIST-AT ?auto_4489 ?auto_4484 ) ( not ( = ?auto_4488 ?auto_4489 ) ) ( AVAILABLE ?auto_4489 ) ( SURFACE-AT ?auto_4481 ?auto_4484 ) ( ON ?auto_4481 ?auto_4486 ) ( CLEAR ?auto_4481 ) ( not ( = ?auto_4480 ?auto_4486 ) ) ( not ( = ?auto_4481 ?auto_4486 ) ) ( not ( = ?auto_4494 ?auto_4486 ) ) ( IS-CRATE ?auto_4480 ) ( not ( = ?auto_4487 ?auto_4483 ) ) ( not ( = ?auto_4484 ?auto_4487 ) ) ( HOIST-AT ?auto_4493 ?auto_4487 ) ( not ( = ?auto_4488 ?auto_4493 ) ) ( not ( = ?auto_4489 ?auto_4493 ) ) ( AVAILABLE ?auto_4493 ) ( SURFACE-AT ?auto_4480 ?auto_4487 ) ( ON ?auto_4480 ?auto_4491 ) ( CLEAR ?auto_4480 ) ( not ( = ?auto_4480 ?auto_4491 ) ) ( not ( = ?auto_4481 ?auto_4491 ) ) ( not ( = ?auto_4494 ?auto_4491 ) ) ( not ( = ?auto_4486 ?auto_4491 ) ) ( SURFACE-AT ?auto_4482 ?auto_4483 ) ( CLEAR ?auto_4482 ) ( IS-CRATE ?auto_4494 ) ( not ( = ?auto_4482 ?auto_4494 ) ) ( not ( = ?auto_4480 ?auto_4482 ) ) ( not ( = ?auto_4481 ?auto_4482 ) ) ( not ( = ?auto_4486 ?auto_4482 ) ) ( not ( = ?auto_4491 ?auto_4482 ) ) ( AVAILABLE ?auto_4488 ) ( TRUCK-AT ?auto_4490 ?auto_4492 ) ( not ( = ?auto_4492 ?auto_4483 ) ) ( not ( = ?auto_4484 ?auto_4492 ) ) ( not ( = ?auto_4487 ?auto_4492 ) ) ( HOIST-AT ?auto_4485 ?auto_4492 ) ( not ( = ?auto_4488 ?auto_4485 ) ) ( not ( = ?auto_4489 ?auto_4485 ) ) ( not ( = ?auto_4493 ?auto_4485 ) ) ( AVAILABLE ?auto_4485 ) ( SURFACE-AT ?auto_4494 ?auto_4492 ) ( ON ?auto_4494 ?auto_4495 ) ( CLEAR ?auto_4494 ) ( not ( = ?auto_4480 ?auto_4495 ) ) ( not ( = ?auto_4481 ?auto_4495 ) ) ( not ( = ?auto_4494 ?auto_4495 ) ) ( not ( = ?auto_4486 ?auto_4495 ) ) ( not ( = ?auto_4491 ?auto_4495 ) ) ( not ( = ?auto_4482 ?auto_4495 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4485 ?auto_4494 ?auto_4495 ?auto_4492 )
      ( MAKE-2CRATE ?auto_4494 ?auto_4480 ?auto_4481 )
      ( MAKE-1CRATE-VERIFY ?auto_4480 ?auto_4481 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4496 - SURFACE
      ?auto_4497 - SURFACE
      ?auto_4498 - SURFACE
    )
    :vars
    (
      ?auto_4507 - HOIST
      ?auto_4510 - PLACE
      ?auto_4502 - PLACE
      ?auto_4505 - HOIST
      ?auto_4503 - SURFACE
      ?auto_4499 - PLACE
      ?auto_4500 - HOIST
      ?auto_4508 - SURFACE
      ?auto_4504 - SURFACE
      ?auto_4511 - TRUCK
      ?auto_4501 - PLACE
      ?auto_4506 - HOIST
      ?auto_4509 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4507 ?auto_4510 ) ( IS-CRATE ?auto_4498 ) ( not ( = ?auto_4497 ?auto_4498 ) ) ( not ( = ?auto_4496 ?auto_4497 ) ) ( not ( = ?auto_4496 ?auto_4498 ) ) ( not ( = ?auto_4502 ?auto_4510 ) ) ( HOIST-AT ?auto_4505 ?auto_4502 ) ( not ( = ?auto_4507 ?auto_4505 ) ) ( AVAILABLE ?auto_4505 ) ( SURFACE-AT ?auto_4498 ?auto_4502 ) ( ON ?auto_4498 ?auto_4503 ) ( CLEAR ?auto_4498 ) ( not ( = ?auto_4497 ?auto_4503 ) ) ( not ( = ?auto_4498 ?auto_4503 ) ) ( not ( = ?auto_4496 ?auto_4503 ) ) ( IS-CRATE ?auto_4497 ) ( not ( = ?auto_4499 ?auto_4510 ) ) ( not ( = ?auto_4502 ?auto_4499 ) ) ( HOIST-AT ?auto_4500 ?auto_4499 ) ( not ( = ?auto_4507 ?auto_4500 ) ) ( not ( = ?auto_4505 ?auto_4500 ) ) ( AVAILABLE ?auto_4500 ) ( SURFACE-AT ?auto_4497 ?auto_4499 ) ( ON ?auto_4497 ?auto_4508 ) ( CLEAR ?auto_4497 ) ( not ( = ?auto_4497 ?auto_4508 ) ) ( not ( = ?auto_4498 ?auto_4508 ) ) ( not ( = ?auto_4496 ?auto_4508 ) ) ( not ( = ?auto_4503 ?auto_4508 ) ) ( SURFACE-AT ?auto_4504 ?auto_4510 ) ( CLEAR ?auto_4504 ) ( IS-CRATE ?auto_4496 ) ( not ( = ?auto_4504 ?auto_4496 ) ) ( not ( = ?auto_4497 ?auto_4504 ) ) ( not ( = ?auto_4498 ?auto_4504 ) ) ( not ( = ?auto_4503 ?auto_4504 ) ) ( not ( = ?auto_4508 ?auto_4504 ) ) ( AVAILABLE ?auto_4507 ) ( TRUCK-AT ?auto_4511 ?auto_4501 ) ( not ( = ?auto_4501 ?auto_4510 ) ) ( not ( = ?auto_4502 ?auto_4501 ) ) ( not ( = ?auto_4499 ?auto_4501 ) ) ( HOIST-AT ?auto_4506 ?auto_4501 ) ( not ( = ?auto_4507 ?auto_4506 ) ) ( not ( = ?auto_4505 ?auto_4506 ) ) ( not ( = ?auto_4500 ?auto_4506 ) ) ( AVAILABLE ?auto_4506 ) ( SURFACE-AT ?auto_4496 ?auto_4501 ) ( ON ?auto_4496 ?auto_4509 ) ( CLEAR ?auto_4496 ) ( not ( = ?auto_4497 ?auto_4509 ) ) ( not ( = ?auto_4498 ?auto_4509 ) ) ( not ( = ?auto_4496 ?auto_4509 ) ) ( not ( = ?auto_4503 ?auto_4509 ) ) ( not ( = ?auto_4508 ?auto_4509 ) ) ( not ( = ?auto_4504 ?auto_4509 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4497 ?auto_4498 )
      ( MAKE-2CRATE-VERIFY ?auto_4496 ?auto_4497 ?auto_4498 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4512 - SURFACE
      ?auto_4513 - SURFACE
      ?auto_4514 - SURFACE
      ?auto_4515 - SURFACE
    )
    :vars
    (
      ?auto_4517 - HOIST
      ?auto_4516 - PLACE
      ?auto_4526 - PLACE
      ?auto_4527 - HOIST
      ?auto_4523 - SURFACE
      ?auto_4525 - PLACE
      ?auto_4524 - HOIST
      ?auto_4522 - SURFACE
      ?auto_4519 - TRUCK
      ?auto_4518 - PLACE
      ?auto_4520 - HOIST
      ?auto_4521 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4517 ?auto_4516 ) ( IS-CRATE ?auto_4515 ) ( not ( = ?auto_4514 ?auto_4515 ) ) ( not ( = ?auto_4513 ?auto_4514 ) ) ( not ( = ?auto_4513 ?auto_4515 ) ) ( not ( = ?auto_4526 ?auto_4516 ) ) ( HOIST-AT ?auto_4527 ?auto_4526 ) ( not ( = ?auto_4517 ?auto_4527 ) ) ( AVAILABLE ?auto_4527 ) ( SURFACE-AT ?auto_4515 ?auto_4526 ) ( ON ?auto_4515 ?auto_4523 ) ( CLEAR ?auto_4515 ) ( not ( = ?auto_4514 ?auto_4523 ) ) ( not ( = ?auto_4515 ?auto_4523 ) ) ( not ( = ?auto_4513 ?auto_4523 ) ) ( IS-CRATE ?auto_4514 ) ( not ( = ?auto_4525 ?auto_4516 ) ) ( not ( = ?auto_4526 ?auto_4525 ) ) ( HOIST-AT ?auto_4524 ?auto_4525 ) ( not ( = ?auto_4517 ?auto_4524 ) ) ( not ( = ?auto_4527 ?auto_4524 ) ) ( AVAILABLE ?auto_4524 ) ( SURFACE-AT ?auto_4514 ?auto_4525 ) ( ON ?auto_4514 ?auto_4522 ) ( CLEAR ?auto_4514 ) ( not ( = ?auto_4514 ?auto_4522 ) ) ( not ( = ?auto_4515 ?auto_4522 ) ) ( not ( = ?auto_4513 ?auto_4522 ) ) ( not ( = ?auto_4523 ?auto_4522 ) ) ( SURFACE-AT ?auto_4512 ?auto_4516 ) ( CLEAR ?auto_4512 ) ( IS-CRATE ?auto_4513 ) ( not ( = ?auto_4512 ?auto_4513 ) ) ( not ( = ?auto_4514 ?auto_4512 ) ) ( not ( = ?auto_4515 ?auto_4512 ) ) ( not ( = ?auto_4523 ?auto_4512 ) ) ( not ( = ?auto_4522 ?auto_4512 ) ) ( AVAILABLE ?auto_4517 ) ( TRUCK-AT ?auto_4519 ?auto_4518 ) ( not ( = ?auto_4518 ?auto_4516 ) ) ( not ( = ?auto_4526 ?auto_4518 ) ) ( not ( = ?auto_4525 ?auto_4518 ) ) ( HOIST-AT ?auto_4520 ?auto_4518 ) ( not ( = ?auto_4517 ?auto_4520 ) ) ( not ( = ?auto_4527 ?auto_4520 ) ) ( not ( = ?auto_4524 ?auto_4520 ) ) ( AVAILABLE ?auto_4520 ) ( SURFACE-AT ?auto_4513 ?auto_4518 ) ( ON ?auto_4513 ?auto_4521 ) ( CLEAR ?auto_4513 ) ( not ( = ?auto_4514 ?auto_4521 ) ) ( not ( = ?auto_4515 ?auto_4521 ) ) ( not ( = ?auto_4513 ?auto_4521 ) ) ( not ( = ?auto_4523 ?auto_4521 ) ) ( not ( = ?auto_4522 ?auto_4521 ) ) ( not ( = ?auto_4512 ?auto_4521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4513 ?auto_4514 ?auto_4515 )
      ( MAKE-3CRATE-VERIFY ?auto_4512 ?auto_4513 ?auto_4514 ?auto_4515 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4528 - SURFACE
      ?auto_4529 - SURFACE
    )
    :vars
    (
      ?auto_4531 - HOIST
      ?auto_4530 - PLACE
      ?auto_4543 - SURFACE
      ?auto_4540 - PLACE
      ?auto_4542 - HOIST
      ?auto_4537 - SURFACE
      ?auto_4539 - PLACE
      ?auto_4538 - HOIST
      ?auto_4536 - SURFACE
      ?auto_4541 - SURFACE
      ?auto_4532 - PLACE
      ?auto_4534 - HOIST
      ?auto_4535 - SURFACE
      ?auto_4533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4531 ?auto_4530 ) ( IS-CRATE ?auto_4529 ) ( not ( = ?auto_4528 ?auto_4529 ) ) ( not ( = ?auto_4543 ?auto_4528 ) ) ( not ( = ?auto_4543 ?auto_4529 ) ) ( not ( = ?auto_4540 ?auto_4530 ) ) ( HOIST-AT ?auto_4542 ?auto_4540 ) ( not ( = ?auto_4531 ?auto_4542 ) ) ( AVAILABLE ?auto_4542 ) ( SURFACE-AT ?auto_4529 ?auto_4540 ) ( ON ?auto_4529 ?auto_4537 ) ( CLEAR ?auto_4529 ) ( not ( = ?auto_4528 ?auto_4537 ) ) ( not ( = ?auto_4529 ?auto_4537 ) ) ( not ( = ?auto_4543 ?auto_4537 ) ) ( IS-CRATE ?auto_4528 ) ( not ( = ?auto_4539 ?auto_4530 ) ) ( not ( = ?auto_4540 ?auto_4539 ) ) ( HOIST-AT ?auto_4538 ?auto_4539 ) ( not ( = ?auto_4531 ?auto_4538 ) ) ( not ( = ?auto_4542 ?auto_4538 ) ) ( AVAILABLE ?auto_4538 ) ( SURFACE-AT ?auto_4528 ?auto_4539 ) ( ON ?auto_4528 ?auto_4536 ) ( CLEAR ?auto_4528 ) ( not ( = ?auto_4528 ?auto_4536 ) ) ( not ( = ?auto_4529 ?auto_4536 ) ) ( not ( = ?auto_4543 ?auto_4536 ) ) ( not ( = ?auto_4537 ?auto_4536 ) ) ( SURFACE-AT ?auto_4541 ?auto_4530 ) ( CLEAR ?auto_4541 ) ( IS-CRATE ?auto_4543 ) ( not ( = ?auto_4541 ?auto_4543 ) ) ( not ( = ?auto_4528 ?auto_4541 ) ) ( not ( = ?auto_4529 ?auto_4541 ) ) ( not ( = ?auto_4537 ?auto_4541 ) ) ( not ( = ?auto_4536 ?auto_4541 ) ) ( AVAILABLE ?auto_4531 ) ( not ( = ?auto_4532 ?auto_4530 ) ) ( not ( = ?auto_4540 ?auto_4532 ) ) ( not ( = ?auto_4539 ?auto_4532 ) ) ( HOIST-AT ?auto_4534 ?auto_4532 ) ( not ( = ?auto_4531 ?auto_4534 ) ) ( not ( = ?auto_4542 ?auto_4534 ) ) ( not ( = ?auto_4538 ?auto_4534 ) ) ( AVAILABLE ?auto_4534 ) ( SURFACE-AT ?auto_4543 ?auto_4532 ) ( ON ?auto_4543 ?auto_4535 ) ( CLEAR ?auto_4543 ) ( not ( = ?auto_4528 ?auto_4535 ) ) ( not ( = ?auto_4529 ?auto_4535 ) ) ( not ( = ?auto_4543 ?auto_4535 ) ) ( not ( = ?auto_4537 ?auto_4535 ) ) ( not ( = ?auto_4536 ?auto_4535 ) ) ( not ( = ?auto_4541 ?auto_4535 ) ) ( TRUCK-AT ?auto_4533 ?auto_4530 ) )
    :subtasks
    ( ( !DRIVE ?auto_4533 ?auto_4530 ?auto_4532 )
      ( MAKE-2CRATE ?auto_4543 ?auto_4528 ?auto_4529 )
      ( MAKE-1CRATE-VERIFY ?auto_4528 ?auto_4529 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4544 - SURFACE
      ?auto_4545 - SURFACE
      ?auto_4546 - SURFACE
    )
    :vars
    (
      ?auto_4553 - HOIST
      ?auto_4555 - PLACE
      ?auto_4556 - PLACE
      ?auto_4559 - HOIST
      ?auto_4550 - SURFACE
      ?auto_4558 - PLACE
      ?auto_4552 - HOIST
      ?auto_4547 - SURFACE
      ?auto_4557 - SURFACE
      ?auto_4551 - PLACE
      ?auto_4548 - HOIST
      ?auto_4554 - SURFACE
      ?auto_4549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4553 ?auto_4555 ) ( IS-CRATE ?auto_4546 ) ( not ( = ?auto_4545 ?auto_4546 ) ) ( not ( = ?auto_4544 ?auto_4545 ) ) ( not ( = ?auto_4544 ?auto_4546 ) ) ( not ( = ?auto_4556 ?auto_4555 ) ) ( HOIST-AT ?auto_4559 ?auto_4556 ) ( not ( = ?auto_4553 ?auto_4559 ) ) ( AVAILABLE ?auto_4559 ) ( SURFACE-AT ?auto_4546 ?auto_4556 ) ( ON ?auto_4546 ?auto_4550 ) ( CLEAR ?auto_4546 ) ( not ( = ?auto_4545 ?auto_4550 ) ) ( not ( = ?auto_4546 ?auto_4550 ) ) ( not ( = ?auto_4544 ?auto_4550 ) ) ( IS-CRATE ?auto_4545 ) ( not ( = ?auto_4558 ?auto_4555 ) ) ( not ( = ?auto_4556 ?auto_4558 ) ) ( HOIST-AT ?auto_4552 ?auto_4558 ) ( not ( = ?auto_4553 ?auto_4552 ) ) ( not ( = ?auto_4559 ?auto_4552 ) ) ( AVAILABLE ?auto_4552 ) ( SURFACE-AT ?auto_4545 ?auto_4558 ) ( ON ?auto_4545 ?auto_4547 ) ( CLEAR ?auto_4545 ) ( not ( = ?auto_4545 ?auto_4547 ) ) ( not ( = ?auto_4546 ?auto_4547 ) ) ( not ( = ?auto_4544 ?auto_4547 ) ) ( not ( = ?auto_4550 ?auto_4547 ) ) ( SURFACE-AT ?auto_4557 ?auto_4555 ) ( CLEAR ?auto_4557 ) ( IS-CRATE ?auto_4544 ) ( not ( = ?auto_4557 ?auto_4544 ) ) ( not ( = ?auto_4545 ?auto_4557 ) ) ( not ( = ?auto_4546 ?auto_4557 ) ) ( not ( = ?auto_4550 ?auto_4557 ) ) ( not ( = ?auto_4547 ?auto_4557 ) ) ( AVAILABLE ?auto_4553 ) ( not ( = ?auto_4551 ?auto_4555 ) ) ( not ( = ?auto_4556 ?auto_4551 ) ) ( not ( = ?auto_4558 ?auto_4551 ) ) ( HOIST-AT ?auto_4548 ?auto_4551 ) ( not ( = ?auto_4553 ?auto_4548 ) ) ( not ( = ?auto_4559 ?auto_4548 ) ) ( not ( = ?auto_4552 ?auto_4548 ) ) ( AVAILABLE ?auto_4548 ) ( SURFACE-AT ?auto_4544 ?auto_4551 ) ( ON ?auto_4544 ?auto_4554 ) ( CLEAR ?auto_4544 ) ( not ( = ?auto_4545 ?auto_4554 ) ) ( not ( = ?auto_4546 ?auto_4554 ) ) ( not ( = ?auto_4544 ?auto_4554 ) ) ( not ( = ?auto_4550 ?auto_4554 ) ) ( not ( = ?auto_4547 ?auto_4554 ) ) ( not ( = ?auto_4557 ?auto_4554 ) ) ( TRUCK-AT ?auto_4549 ?auto_4555 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4545 ?auto_4546 )
      ( MAKE-2CRATE-VERIFY ?auto_4544 ?auto_4545 ?auto_4546 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4560 - SURFACE
      ?auto_4561 - SURFACE
      ?auto_4562 - SURFACE
      ?auto_4563 - SURFACE
    )
    :vars
    (
      ?auto_4572 - HOIST
      ?auto_4569 - PLACE
      ?auto_4566 - PLACE
      ?auto_4567 - HOIST
      ?auto_4570 - SURFACE
      ?auto_4564 - PLACE
      ?auto_4565 - HOIST
      ?auto_4571 - SURFACE
      ?auto_4575 - PLACE
      ?auto_4573 - HOIST
      ?auto_4574 - SURFACE
      ?auto_4568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4572 ?auto_4569 ) ( IS-CRATE ?auto_4563 ) ( not ( = ?auto_4562 ?auto_4563 ) ) ( not ( = ?auto_4561 ?auto_4562 ) ) ( not ( = ?auto_4561 ?auto_4563 ) ) ( not ( = ?auto_4566 ?auto_4569 ) ) ( HOIST-AT ?auto_4567 ?auto_4566 ) ( not ( = ?auto_4572 ?auto_4567 ) ) ( AVAILABLE ?auto_4567 ) ( SURFACE-AT ?auto_4563 ?auto_4566 ) ( ON ?auto_4563 ?auto_4570 ) ( CLEAR ?auto_4563 ) ( not ( = ?auto_4562 ?auto_4570 ) ) ( not ( = ?auto_4563 ?auto_4570 ) ) ( not ( = ?auto_4561 ?auto_4570 ) ) ( IS-CRATE ?auto_4562 ) ( not ( = ?auto_4564 ?auto_4569 ) ) ( not ( = ?auto_4566 ?auto_4564 ) ) ( HOIST-AT ?auto_4565 ?auto_4564 ) ( not ( = ?auto_4572 ?auto_4565 ) ) ( not ( = ?auto_4567 ?auto_4565 ) ) ( AVAILABLE ?auto_4565 ) ( SURFACE-AT ?auto_4562 ?auto_4564 ) ( ON ?auto_4562 ?auto_4571 ) ( CLEAR ?auto_4562 ) ( not ( = ?auto_4562 ?auto_4571 ) ) ( not ( = ?auto_4563 ?auto_4571 ) ) ( not ( = ?auto_4561 ?auto_4571 ) ) ( not ( = ?auto_4570 ?auto_4571 ) ) ( SURFACE-AT ?auto_4560 ?auto_4569 ) ( CLEAR ?auto_4560 ) ( IS-CRATE ?auto_4561 ) ( not ( = ?auto_4560 ?auto_4561 ) ) ( not ( = ?auto_4562 ?auto_4560 ) ) ( not ( = ?auto_4563 ?auto_4560 ) ) ( not ( = ?auto_4570 ?auto_4560 ) ) ( not ( = ?auto_4571 ?auto_4560 ) ) ( AVAILABLE ?auto_4572 ) ( not ( = ?auto_4575 ?auto_4569 ) ) ( not ( = ?auto_4566 ?auto_4575 ) ) ( not ( = ?auto_4564 ?auto_4575 ) ) ( HOIST-AT ?auto_4573 ?auto_4575 ) ( not ( = ?auto_4572 ?auto_4573 ) ) ( not ( = ?auto_4567 ?auto_4573 ) ) ( not ( = ?auto_4565 ?auto_4573 ) ) ( AVAILABLE ?auto_4573 ) ( SURFACE-AT ?auto_4561 ?auto_4575 ) ( ON ?auto_4561 ?auto_4574 ) ( CLEAR ?auto_4561 ) ( not ( = ?auto_4562 ?auto_4574 ) ) ( not ( = ?auto_4563 ?auto_4574 ) ) ( not ( = ?auto_4561 ?auto_4574 ) ) ( not ( = ?auto_4570 ?auto_4574 ) ) ( not ( = ?auto_4571 ?auto_4574 ) ) ( not ( = ?auto_4560 ?auto_4574 ) ) ( TRUCK-AT ?auto_4568 ?auto_4569 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4561 ?auto_4562 ?auto_4563 )
      ( MAKE-3CRATE-VERIFY ?auto_4560 ?auto_4561 ?auto_4562 ?auto_4563 ) )
  )

)

