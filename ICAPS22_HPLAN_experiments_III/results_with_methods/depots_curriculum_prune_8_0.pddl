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

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3636 - SURFACE
      ?auto_3637 - SURFACE
    )
    :vars
    (
      ?auto_3638 - HOIST
      ?auto_3639 - PLACE
      ?auto_3641 - PLACE
      ?auto_3642 - HOIST
      ?auto_3643 - SURFACE
      ?auto_3640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3638 ?auto_3639 ) ( SURFACE-AT ?auto_3636 ?auto_3639 ) ( CLEAR ?auto_3636 ) ( IS-CRATE ?auto_3637 ) ( AVAILABLE ?auto_3638 ) ( not ( = ?auto_3641 ?auto_3639 ) ) ( HOIST-AT ?auto_3642 ?auto_3641 ) ( AVAILABLE ?auto_3642 ) ( SURFACE-AT ?auto_3637 ?auto_3641 ) ( ON ?auto_3637 ?auto_3643 ) ( CLEAR ?auto_3637 ) ( TRUCK-AT ?auto_3640 ?auto_3639 ) ( not ( = ?auto_3636 ?auto_3637 ) ) ( not ( = ?auto_3636 ?auto_3643 ) ) ( not ( = ?auto_3637 ?auto_3643 ) ) ( not ( = ?auto_3638 ?auto_3642 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3640 ?auto_3639 ?auto_3641 )
      ( !LIFT ?auto_3642 ?auto_3637 ?auto_3643 ?auto_3641 )
      ( !LOAD ?auto_3642 ?auto_3637 ?auto_3640 ?auto_3641 )
      ( !DRIVE ?auto_3640 ?auto_3641 ?auto_3639 )
      ( !UNLOAD ?auto_3638 ?auto_3637 ?auto_3640 ?auto_3639 )
      ( !DROP ?auto_3638 ?auto_3637 ?auto_3636 ?auto_3639 )
      ( MAKE-1CRATE-VERIFY ?auto_3636 ?auto_3637 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3657 - SURFACE
      ?auto_3658 - SURFACE
      ?auto_3659 - SURFACE
    )
    :vars
    (
      ?auto_3660 - HOIST
      ?auto_3662 - PLACE
      ?auto_3663 - PLACE
      ?auto_3661 - HOIST
      ?auto_3664 - SURFACE
      ?auto_3666 - PLACE
      ?auto_3667 - HOIST
      ?auto_3668 - SURFACE
      ?auto_3665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3660 ?auto_3662 ) ( IS-CRATE ?auto_3659 ) ( not ( = ?auto_3663 ?auto_3662 ) ) ( HOIST-AT ?auto_3661 ?auto_3663 ) ( AVAILABLE ?auto_3661 ) ( SURFACE-AT ?auto_3659 ?auto_3663 ) ( ON ?auto_3659 ?auto_3664 ) ( CLEAR ?auto_3659 ) ( not ( = ?auto_3658 ?auto_3659 ) ) ( not ( = ?auto_3658 ?auto_3664 ) ) ( not ( = ?auto_3659 ?auto_3664 ) ) ( not ( = ?auto_3660 ?auto_3661 ) ) ( SURFACE-AT ?auto_3657 ?auto_3662 ) ( CLEAR ?auto_3657 ) ( IS-CRATE ?auto_3658 ) ( AVAILABLE ?auto_3660 ) ( not ( = ?auto_3666 ?auto_3662 ) ) ( HOIST-AT ?auto_3667 ?auto_3666 ) ( AVAILABLE ?auto_3667 ) ( SURFACE-AT ?auto_3658 ?auto_3666 ) ( ON ?auto_3658 ?auto_3668 ) ( CLEAR ?auto_3658 ) ( TRUCK-AT ?auto_3665 ?auto_3662 ) ( not ( = ?auto_3657 ?auto_3658 ) ) ( not ( = ?auto_3657 ?auto_3668 ) ) ( not ( = ?auto_3658 ?auto_3668 ) ) ( not ( = ?auto_3660 ?auto_3667 ) ) ( not ( = ?auto_3657 ?auto_3659 ) ) ( not ( = ?auto_3657 ?auto_3664 ) ) ( not ( = ?auto_3659 ?auto_3668 ) ) ( not ( = ?auto_3663 ?auto_3666 ) ) ( not ( = ?auto_3661 ?auto_3667 ) ) ( not ( = ?auto_3664 ?auto_3668 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3657 ?auto_3658 )
      ( MAKE-1CRATE ?auto_3658 ?auto_3659 )
      ( MAKE-2CRATE-VERIFY ?auto_3657 ?auto_3658 ?auto_3659 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3683 - SURFACE
      ?auto_3684 - SURFACE
      ?auto_3685 - SURFACE
      ?auto_3686 - SURFACE
    )
    :vars
    (
      ?auto_3692 - HOIST
      ?auto_3689 - PLACE
      ?auto_3688 - PLACE
      ?auto_3690 - HOIST
      ?auto_3691 - SURFACE
      ?auto_3698 - PLACE
      ?auto_3694 - HOIST
      ?auto_3693 - SURFACE
      ?auto_3695 - PLACE
      ?auto_3696 - HOIST
      ?auto_3697 - SURFACE
      ?auto_3687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3692 ?auto_3689 ) ( IS-CRATE ?auto_3686 ) ( not ( = ?auto_3688 ?auto_3689 ) ) ( HOIST-AT ?auto_3690 ?auto_3688 ) ( AVAILABLE ?auto_3690 ) ( SURFACE-AT ?auto_3686 ?auto_3688 ) ( ON ?auto_3686 ?auto_3691 ) ( CLEAR ?auto_3686 ) ( not ( = ?auto_3685 ?auto_3686 ) ) ( not ( = ?auto_3685 ?auto_3691 ) ) ( not ( = ?auto_3686 ?auto_3691 ) ) ( not ( = ?auto_3692 ?auto_3690 ) ) ( IS-CRATE ?auto_3685 ) ( not ( = ?auto_3698 ?auto_3689 ) ) ( HOIST-AT ?auto_3694 ?auto_3698 ) ( AVAILABLE ?auto_3694 ) ( SURFACE-AT ?auto_3685 ?auto_3698 ) ( ON ?auto_3685 ?auto_3693 ) ( CLEAR ?auto_3685 ) ( not ( = ?auto_3684 ?auto_3685 ) ) ( not ( = ?auto_3684 ?auto_3693 ) ) ( not ( = ?auto_3685 ?auto_3693 ) ) ( not ( = ?auto_3692 ?auto_3694 ) ) ( SURFACE-AT ?auto_3683 ?auto_3689 ) ( CLEAR ?auto_3683 ) ( IS-CRATE ?auto_3684 ) ( AVAILABLE ?auto_3692 ) ( not ( = ?auto_3695 ?auto_3689 ) ) ( HOIST-AT ?auto_3696 ?auto_3695 ) ( AVAILABLE ?auto_3696 ) ( SURFACE-AT ?auto_3684 ?auto_3695 ) ( ON ?auto_3684 ?auto_3697 ) ( CLEAR ?auto_3684 ) ( TRUCK-AT ?auto_3687 ?auto_3689 ) ( not ( = ?auto_3683 ?auto_3684 ) ) ( not ( = ?auto_3683 ?auto_3697 ) ) ( not ( = ?auto_3684 ?auto_3697 ) ) ( not ( = ?auto_3692 ?auto_3696 ) ) ( not ( = ?auto_3683 ?auto_3685 ) ) ( not ( = ?auto_3683 ?auto_3693 ) ) ( not ( = ?auto_3685 ?auto_3697 ) ) ( not ( = ?auto_3698 ?auto_3695 ) ) ( not ( = ?auto_3694 ?auto_3696 ) ) ( not ( = ?auto_3693 ?auto_3697 ) ) ( not ( = ?auto_3683 ?auto_3686 ) ) ( not ( = ?auto_3683 ?auto_3691 ) ) ( not ( = ?auto_3684 ?auto_3686 ) ) ( not ( = ?auto_3684 ?auto_3691 ) ) ( not ( = ?auto_3686 ?auto_3693 ) ) ( not ( = ?auto_3686 ?auto_3697 ) ) ( not ( = ?auto_3688 ?auto_3698 ) ) ( not ( = ?auto_3688 ?auto_3695 ) ) ( not ( = ?auto_3690 ?auto_3694 ) ) ( not ( = ?auto_3690 ?auto_3696 ) ) ( not ( = ?auto_3691 ?auto_3693 ) ) ( not ( = ?auto_3691 ?auto_3697 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3683 ?auto_3684 ?auto_3685 )
      ( MAKE-1CRATE ?auto_3685 ?auto_3686 )
      ( MAKE-3CRATE-VERIFY ?auto_3683 ?auto_3684 ?auto_3685 ?auto_3686 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_3714 - SURFACE
      ?auto_3715 - SURFACE
      ?auto_3716 - SURFACE
      ?auto_3717 - SURFACE
      ?auto_3718 - SURFACE
    )
    :vars
    (
      ?auto_3719 - HOIST
      ?auto_3721 - PLACE
      ?auto_3720 - PLACE
      ?auto_3723 - HOIST
      ?auto_3722 - SURFACE
      ?auto_3729 - PLACE
      ?auto_3728 - HOIST
      ?auto_3730 - SURFACE
      ?auto_3733 - PLACE
      ?auto_3727 - HOIST
      ?auto_3726 - SURFACE
      ?auto_3732 - PLACE
      ?auto_3725 - HOIST
      ?auto_3731 - SURFACE
      ?auto_3724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3719 ?auto_3721 ) ( IS-CRATE ?auto_3718 ) ( not ( = ?auto_3720 ?auto_3721 ) ) ( HOIST-AT ?auto_3723 ?auto_3720 ) ( AVAILABLE ?auto_3723 ) ( SURFACE-AT ?auto_3718 ?auto_3720 ) ( ON ?auto_3718 ?auto_3722 ) ( CLEAR ?auto_3718 ) ( not ( = ?auto_3717 ?auto_3718 ) ) ( not ( = ?auto_3717 ?auto_3722 ) ) ( not ( = ?auto_3718 ?auto_3722 ) ) ( not ( = ?auto_3719 ?auto_3723 ) ) ( IS-CRATE ?auto_3717 ) ( not ( = ?auto_3729 ?auto_3721 ) ) ( HOIST-AT ?auto_3728 ?auto_3729 ) ( AVAILABLE ?auto_3728 ) ( SURFACE-AT ?auto_3717 ?auto_3729 ) ( ON ?auto_3717 ?auto_3730 ) ( CLEAR ?auto_3717 ) ( not ( = ?auto_3716 ?auto_3717 ) ) ( not ( = ?auto_3716 ?auto_3730 ) ) ( not ( = ?auto_3717 ?auto_3730 ) ) ( not ( = ?auto_3719 ?auto_3728 ) ) ( IS-CRATE ?auto_3716 ) ( not ( = ?auto_3733 ?auto_3721 ) ) ( HOIST-AT ?auto_3727 ?auto_3733 ) ( AVAILABLE ?auto_3727 ) ( SURFACE-AT ?auto_3716 ?auto_3733 ) ( ON ?auto_3716 ?auto_3726 ) ( CLEAR ?auto_3716 ) ( not ( = ?auto_3715 ?auto_3716 ) ) ( not ( = ?auto_3715 ?auto_3726 ) ) ( not ( = ?auto_3716 ?auto_3726 ) ) ( not ( = ?auto_3719 ?auto_3727 ) ) ( SURFACE-AT ?auto_3714 ?auto_3721 ) ( CLEAR ?auto_3714 ) ( IS-CRATE ?auto_3715 ) ( AVAILABLE ?auto_3719 ) ( not ( = ?auto_3732 ?auto_3721 ) ) ( HOIST-AT ?auto_3725 ?auto_3732 ) ( AVAILABLE ?auto_3725 ) ( SURFACE-AT ?auto_3715 ?auto_3732 ) ( ON ?auto_3715 ?auto_3731 ) ( CLEAR ?auto_3715 ) ( TRUCK-AT ?auto_3724 ?auto_3721 ) ( not ( = ?auto_3714 ?auto_3715 ) ) ( not ( = ?auto_3714 ?auto_3731 ) ) ( not ( = ?auto_3715 ?auto_3731 ) ) ( not ( = ?auto_3719 ?auto_3725 ) ) ( not ( = ?auto_3714 ?auto_3716 ) ) ( not ( = ?auto_3714 ?auto_3726 ) ) ( not ( = ?auto_3716 ?auto_3731 ) ) ( not ( = ?auto_3733 ?auto_3732 ) ) ( not ( = ?auto_3727 ?auto_3725 ) ) ( not ( = ?auto_3726 ?auto_3731 ) ) ( not ( = ?auto_3714 ?auto_3717 ) ) ( not ( = ?auto_3714 ?auto_3730 ) ) ( not ( = ?auto_3715 ?auto_3717 ) ) ( not ( = ?auto_3715 ?auto_3730 ) ) ( not ( = ?auto_3717 ?auto_3726 ) ) ( not ( = ?auto_3717 ?auto_3731 ) ) ( not ( = ?auto_3729 ?auto_3733 ) ) ( not ( = ?auto_3729 ?auto_3732 ) ) ( not ( = ?auto_3728 ?auto_3727 ) ) ( not ( = ?auto_3728 ?auto_3725 ) ) ( not ( = ?auto_3730 ?auto_3726 ) ) ( not ( = ?auto_3730 ?auto_3731 ) ) ( not ( = ?auto_3714 ?auto_3718 ) ) ( not ( = ?auto_3714 ?auto_3722 ) ) ( not ( = ?auto_3715 ?auto_3718 ) ) ( not ( = ?auto_3715 ?auto_3722 ) ) ( not ( = ?auto_3716 ?auto_3718 ) ) ( not ( = ?auto_3716 ?auto_3722 ) ) ( not ( = ?auto_3718 ?auto_3730 ) ) ( not ( = ?auto_3718 ?auto_3726 ) ) ( not ( = ?auto_3718 ?auto_3731 ) ) ( not ( = ?auto_3720 ?auto_3729 ) ) ( not ( = ?auto_3720 ?auto_3733 ) ) ( not ( = ?auto_3720 ?auto_3732 ) ) ( not ( = ?auto_3723 ?auto_3728 ) ) ( not ( = ?auto_3723 ?auto_3727 ) ) ( not ( = ?auto_3723 ?auto_3725 ) ) ( not ( = ?auto_3722 ?auto_3730 ) ) ( not ( = ?auto_3722 ?auto_3726 ) ) ( not ( = ?auto_3722 ?auto_3731 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3714 ?auto_3715 ?auto_3716 ?auto_3717 )
      ( MAKE-1CRATE ?auto_3717 ?auto_3718 )
      ( MAKE-4CRATE-VERIFY ?auto_3714 ?auto_3715 ?auto_3716 ?auto_3717 ?auto_3718 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_3750 - SURFACE
      ?auto_3751 - SURFACE
      ?auto_3752 - SURFACE
      ?auto_3753 - SURFACE
      ?auto_3754 - SURFACE
      ?auto_3755 - SURFACE
    )
    :vars
    (
      ?auto_3759 - HOIST
      ?auto_3757 - PLACE
      ?auto_3758 - PLACE
      ?auto_3761 - HOIST
      ?auto_3756 - SURFACE
      ?auto_3767 - PLACE
      ?auto_3768 - HOIST
      ?auto_3771 - SURFACE
      ?auto_3769 - PLACE
      ?auto_3762 - HOIST
      ?auto_3770 - SURFACE
      ?auto_3763 - SURFACE
      ?auto_3764 - PLACE
      ?auto_3766 - HOIST
      ?auto_3765 - SURFACE
      ?auto_3760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3759 ?auto_3757 ) ( IS-CRATE ?auto_3755 ) ( not ( = ?auto_3758 ?auto_3757 ) ) ( HOIST-AT ?auto_3761 ?auto_3758 ) ( SURFACE-AT ?auto_3755 ?auto_3758 ) ( ON ?auto_3755 ?auto_3756 ) ( CLEAR ?auto_3755 ) ( not ( = ?auto_3754 ?auto_3755 ) ) ( not ( = ?auto_3754 ?auto_3756 ) ) ( not ( = ?auto_3755 ?auto_3756 ) ) ( not ( = ?auto_3759 ?auto_3761 ) ) ( IS-CRATE ?auto_3754 ) ( not ( = ?auto_3767 ?auto_3757 ) ) ( HOIST-AT ?auto_3768 ?auto_3767 ) ( AVAILABLE ?auto_3768 ) ( SURFACE-AT ?auto_3754 ?auto_3767 ) ( ON ?auto_3754 ?auto_3771 ) ( CLEAR ?auto_3754 ) ( not ( = ?auto_3753 ?auto_3754 ) ) ( not ( = ?auto_3753 ?auto_3771 ) ) ( not ( = ?auto_3754 ?auto_3771 ) ) ( not ( = ?auto_3759 ?auto_3768 ) ) ( IS-CRATE ?auto_3753 ) ( not ( = ?auto_3769 ?auto_3757 ) ) ( HOIST-AT ?auto_3762 ?auto_3769 ) ( AVAILABLE ?auto_3762 ) ( SURFACE-AT ?auto_3753 ?auto_3769 ) ( ON ?auto_3753 ?auto_3770 ) ( CLEAR ?auto_3753 ) ( not ( = ?auto_3752 ?auto_3753 ) ) ( not ( = ?auto_3752 ?auto_3770 ) ) ( not ( = ?auto_3753 ?auto_3770 ) ) ( not ( = ?auto_3759 ?auto_3762 ) ) ( IS-CRATE ?auto_3752 ) ( AVAILABLE ?auto_3761 ) ( SURFACE-AT ?auto_3752 ?auto_3758 ) ( ON ?auto_3752 ?auto_3763 ) ( CLEAR ?auto_3752 ) ( not ( = ?auto_3751 ?auto_3752 ) ) ( not ( = ?auto_3751 ?auto_3763 ) ) ( not ( = ?auto_3752 ?auto_3763 ) ) ( SURFACE-AT ?auto_3750 ?auto_3757 ) ( CLEAR ?auto_3750 ) ( IS-CRATE ?auto_3751 ) ( AVAILABLE ?auto_3759 ) ( not ( = ?auto_3764 ?auto_3757 ) ) ( HOIST-AT ?auto_3766 ?auto_3764 ) ( AVAILABLE ?auto_3766 ) ( SURFACE-AT ?auto_3751 ?auto_3764 ) ( ON ?auto_3751 ?auto_3765 ) ( CLEAR ?auto_3751 ) ( TRUCK-AT ?auto_3760 ?auto_3757 ) ( not ( = ?auto_3750 ?auto_3751 ) ) ( not ( = ?auto_3750 ?auto_3765 ) ) ( not ( = ?auto_3751 ?auto_3765 ) ) ( not ( = ?auto_3759 ?auto_3766 ) ) ( not ( = ?auto_3750 ?auto_3752 ) ) ( not ( = ?auto_3750 ?auto_3763 ) ) ( not ( = ?auto_3752 ?auto_3765 ) ) ( not ( = ?auto_3758 ?auto_3764 ) ) ( not ( = ?auto_3761 ?auto_3766 ) ) ( not ( = ?auto_3763 ?auto_3765 ) ) ( not ( = ?auto_3750 ?auto_3753 ) ) ( not ( = ?auto_3750 ?auto_3770 ) ) ( not ( = ?auto_3751 ?auto_3753 ) ) ( not ( = ?auto_3751 ?auto_3770 ) ) ( not ( = ?auto_3753 ?auto_3763 ) ) ( not ( = ?auto_3753 ?auto_3765 ) ) ( not ( = ?auto_3769 ?auto_3758 ) ) ( not ( = ?auto_3769 ?auto_3764 ) ) ( not ( = ?auto_3762 ?auto_3761 ) ) ( not ( = ?auto_3762 ?auto_3766 ) ) ( not ( = ?auto_3770 ?auto_3763 ) ) ( not ( = ?auto_3770 ?auto_3765 ) ) ( not ( = ?auto_3750 ?auto_3754 ) ) ( not ( = ?auto_3750 ?auto_3771 ) ) ( not ( = ?auto_3751 ?auto_3754 ) ) ( not ( = ?auto_3751 ?auto_3771 ) ) ( not ( = ?auto_3752 ?auto_3754 ) ) ( not ( = ?auto_3752 ?auto_3771 ) ) ( not ( = ?auto_3754 ?auto_3770 ) ) ( not ( = ?auto_3754 ?auto_3763 ) ) ( not ( = ?auto_3754 ?auto_3765 ) ) ( not ( = ?auto_3767 ?auto_3769 ) ) ( not ( = ?auto_3767 ?auto_3758 ) ) ( not ( = ?auto_3767 ?auto_3764 ) ) ( not ( = ?auto_3768 ?auto_3762 ) ) ( not ( = ?auto_3768 ?auto_3761 ) ) ( not ( = ?auto_3768 ?auto_3766 ) ) ( not ( = ?auto_3771 ?auto_3770 ) ) ( not ( = ?auto_3771 ?auto_3763 ) ) ( not ( = ?auto_3771 ?auto_3765 ) ) ( not ( = ?auto_3750 ?auto_3755 ) ) ( not ( = ?auto_3750 ?auto_3756 ) ) ( not ( = ?auto_3751 ?auto_3755 ) ) ( not ( = ?auto_3751 ?auto_3756 ) ) ( not ( = ?auto_3752 ?auto_3755 ) ) ( not ( = ?auto_3752 ?auto_3756 ) ) ( not ( = ?auto_3753 ?auto_3755 ) ) ( not ( = ?auto_3753 ?auto_3756 ) ) ( not ( = ?auto_3755 ?auto_3771 ) ) ( not ( = ?auto_3755 ?auto_3770 ) ) ( not ( = ?auto_3755 ?auto_3763 ) ) ( not ( = ?auto_3755 ?auto_3765 ) ) ( not ( = ?auto_3756 ?auto_3771 ) ) ( not ( = ?auto_3756 ?auto_3770 ) ) ( not ( = ?auto_3756 ?auto_3763 ) ) ( not ( = ?auto_3756 ?auto_3765 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3750 ?auto_3751 ?auto_3752 ?auto_3753 ?auto_3754 )
      ( MAKE-1CRATE ?auto_3754 ?auto_3755 )
      ( MAKE-5CRATE-VERIFY ?auto_3750 ?auto_3751 ?auto_3752 ?auto_3753 ?auto_3754 ?auto_3755 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_3789 - SURFACE
      ?auto_3790 - SURFACE
      ?auto_3791 - SURFACE
      ?auto_3792 - SURFACE
      ?auto_3793 - SURFACE
      ?auto_3794 - SURFACE
      ?auto_3795 - SURFACE
    )
    :vars
    (
      ?auto_3800 - HOIST
      ?auto_3796 - PLACE
      ?auto_3798 - PLACE
      ?auto_3799 - HOIST
      ?auto_3797 - SURFACE
      ?auto_3805 - PLACE
      ?auto_3804 - HOIST
      ?auto_3808 - SURFACE
      ?auto_3809 - PLACE
      ?auto_3807 - HOIST
      ?auto_3803 - SURFACE
      ?auto_3806 - PLACE
      ?auto_3811 - HOIST
      ?auto_3810 - SURFACE
      ?auto_3813 - SURFACE
      ?auto_3812 - PLACE
      ?auto_3802 - HOIST
      ?auto_3814 - SURFACE
      ?auto_3801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3800 ?auto_3796 ) ( IS-CRATE ?auto_3795 ) ( not ( = ?auto_3798 ?auto_3796 ) ) ( HOIST-AT ?auto_3799 ?auto_3798 ) ( AVAILABLE ?auto_3799 ) ( SURFACE-AT ?auto_3795 ?auto_3798 ) ( ON ?auto_3795 ?auto_3797 ) ( CLEAR ?auto_3795 ) ( not ( = ?auto_3794 ?auto_3795 ) ) ( not ( = ?auto_3794 ?auto_3797 ) ) ( not ( = ?auto_3795 ?auto_3797 ) ) ( not ( = ?auto_3800 ?auto_3799 ) ) ( IS-CRATE ?auto_3794 ) ( not ( = ?auto_3805 ?auto_3796 ) ) ( HOIST-AT ?auto_3804 ?auto_3805 ) ( SURFACE-AT ?auto_3794 ?auto_3805 ) ( ON ?auto_3794 ?auto_3808 ) ( CLEAR ?auto_3794 ) ( not ( = ?auto_3793 ?auto_3794 ) ) ( not ( = ?auto_3793 ?auto_3808 ) ) ( not ( = ?auto_3794 ?auto_3808 ) ) ( not ( = ?auto_3800 ?auto_3804 ) ) ( IS-CRATE ?auto_3793 ) ( not ( = ?auto_3809 ?auto_3796 ) ) ( HOIST-AT ?auto_3807 ?auto_3809 ) ( AVAILABLE ?auto_3807 ) ( SURFACE-AT ?auto_3793 ?auto_3809 ) ( ON ?auto_3793 ?auto_3803 ) ( CLEAR ?auto_3793 ) ( not ( = ?auto_3792 ?auto_3793 ) ) ( not ( = ?auto_3792 ?auto_3803 ) ) ( not ( = ?auto_3793 ?auto_3803 ) ) ( not ( = ?auto_3800 ?auto_3807 ) ) ( IS-CRATE ?auto_3792 ) ( not ( = ?auto_3806 ?auto_3796 ) ) ( HOIST-AT ?auto_3811 ?auto_3806 ) ( AVAILABLE ?auto_3811 ) ( SURFACE-AT ?auto_3792 ?auto_3806 ) ( ON ?auto_3792 ?auto_3810 ) ( CLEAR ?auto_3792 ) ( not ( = ?auto_3791 ?auto_3792 ) ) ( not ( = ?auto_3791 ?auto_3810 ) ) ( not ( = ?auto_3792 ?auto_3810 ) ) ( not ( = ?auto_3800 ?auto_3811 ) ) ( IS-CRATE ?auto_3791 ) ( AVAILABLE ?auto_3804 ) ( SURFACE-AT ?auto_3791 ?auto_3805 ) ( ON ?auto_3791 ?auto_3813 ) ( CLEAR ?auto_3791 ) ( not ( = ?auto_3790 ?auto_3791 ) ) ( not ( = ?auto_3790 ?auto_3813 ) ) ( not ( = ?auto_3791 ?auto_3813 ) ) ( SURFACE-AT ?auto_3789 ?auto_3796 ) ( CLEAR ?auto_3789 ) ( IS-CRATE ?auto_3790 ) ( AVAILABLE ?auto_3800 ) ( not ( = ?auto_3812 ?auto_3796 ) ) ( HOIST-AT ?auto_3802 ?auto_3812 ) ( AVAILABLE ?auto_3802 ) ( SURFACE-AT ?auto_3790 ?auto_3812 ) ( ON ?auto_3790 ?auto_3814 ) ( CLEAR ?auto_3790 ) ( TRUCK-AT ?auto_3801 ?auto_3796 ) ( not ( = ?auto_3789 ?auto_3790 ) ) ( not ( = ?auto_3789 ?auto_3814 ) ) ( not ( = ?auto_3790 ?auto_3814 ) ) ( not ( = ?auto_3800 ?auto_3802 ) ) ( not ( = ?auto_3789 ?auto_3791 ) ) ( not ( = ?auto_3789 ?auto_3813 ) ) ( not ( = ?auto_3791 ?auto_3814 ) ) ( not ( = ?auto_3805 ?auto_3812 ) ) ( not ( = ?auto_3804 ?auto_3802 ) ) ( not ( = ?auto_3813 ?auto_3814 ) ) ( not ( = ?auto_3789 ?auto_3792 ) ) ( not ( = ?auto_3789 ?auto_3810 ) ) ( not ( = ?auto_3790 ?auto_3792 ) ) ( not ( = ?auto_3790 ?auto_3810 ) ) ( not ( = ?auto_3792 ?auto_3813 ) ) ( not ( = ?auto_3792 ?auto_3814 ) ) ( not ( = ?auto_3806 ?auto_3805 ) ) ( not ( = ?auto_3806 ?auto_3812 ) ) ( not ( = ?auto_3811 ?auto_3804 ) ) ( not ( = ?auto_3811 ?auto_3802 ) ) ( not ( = ?auto_3810 ?auto_3813 ) ) ( not ( = ?auto_3810 ?auto_3814 ) ) ( not ( = ?auto_3789 ?auto_3793 ) ) ( not ( = ?auto_3789 ?auto_3803 ) ) ( not ( = ?auto_3790 ?auto_3793 ) ) ( not ( = ?auto_3790 ?auto_3803 ) ) ( not ( = ?auto_3791 ?auto_3793 ) ) ( not ( = ?auto_3791 ?auto_3803 ) ) ( not ( = ?auto_3793 ?auto_3810 ) ) ( not ( = ?auto_3793 ?auto_3813 ) ) ( not ( = ?auto_3793 ?auto_3814 ) ) ( not ( = ?auto_3809 ?auto_3806 ) ) ( not ( = ?auto_3809 ?auto_3805 ) ) ( not ( = ?auto_3809 ?auto_3812 ) ) ( not ( = ?auto_3807 ?auto_3811 ) ) ( not ( = ?auto_3807 ?auto_3804 ) ) ( not ( = ?auto_3807 ?auto_3802 ) ) ( not ( = ?auto_3803 ?auto_3810 ) ) ( not ( = ?auto_3803 ?auto_3813 ) ) ( not ( = ?auto_3803 ?auto_3814 ) ) ( not ( = ?auto_3789 ?auto_3794 ) ) ( not ( = ?auto_3789 ?auto_3808 ) ) ( not ( = ?auto_3790 ?auto_3794 ) ) ( not ( = ?auto_3790 ?auto_3808 ) ) ( not ( = ?auto_3791 ?auto_3794 ) ) ( not ( = ?auto_3791 ?auto_3808 ) ) ( not ( = ?auto_3792 ?auto_3794 ) ) ( not ( = ?auto_3792 ?auto_3808 ) ) ( not ( = ?auto_3794 ?auto_3803 ) ) ( not ( = ?auto_3794 ?auto_3810 ) ) ( not ( = ?auto_3794 ?auto_3813 ) ) ( not ( = ?auto_3794 ?auto_3814 ) ) ( not ( = ?auto_3808 ?auto_3803 ) ) ( not ( = ?auto_3808 ?auto_3810 ) ) ( not ( = ?auto_3808 ?auto_3813 ) ) ( not ( = ?auto_3808 ?auto_3814 ) ) ( not ( = ?auto_3789 ?auto_3795 ) ) ( not ( = ?auto_3789 ?auto_3797 ) ) ( not ( = ?auto_3790 ?auto_3795 ) ) ( not ( = ?auto_3790 ?auto_3797 ) ) ( not ( = ?auto_3791 ?auto_3795 ) ) ( not ( = ?auto_3791 ?auto_3797 ) ) ( not ( = ?auto_3792 ?auto_3795 ) ) ( not ( = ?auto_3792 ?auto_3797 ) ) ( not ( = ?auto_3793 ?auto_3795 ) ) ( not ( = ?auto_3793 ?auto_3797 ) ) ( not ( = ?auto_3795 ?auto_3808 ) ) ( not ( = ?auto_3795 ?auto_3803 ) ) ( not ( = ?auto_3795 ?auto_3810 ) ) ( not ( = ?auto_3795 ?auto_3813 ) ) ( not ( = ?auto_3795 ?auto_3814 ) ) ( not ( = ?auto_3798 ?auto_3805 ) ) ( not ( = ?auto_3798 ?auto_3809 ) ) ( not ( = ?auto_3798 ?auto_3806 ) ) ( not ( = ?auto_3798 ?auto_3812 ) ) ( not ( = ?auto_3799 ?auto_3804 ) ) ( not ( = ?auto_3799 ?auto_3807 ) ) ( not ( = ?auto_3799 ?auto_3811 ) ) ( not ( = ?auto_3799 ?auto_3802 ) ) ( not ( = ?auto_3797 ?auto_3808 ) ) ( not ( = ?auto_3797 ?auto_3803 ) ) ( not ( = ?auto_3797 ?auto_3810 ) ) ( not ( = ?auto_3797 ?auto_3813 ) ) ( not ( = ?auto_3797 ?auto_3814 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3789 ?auto_3790 ?auto_3791 ?auto_3792 ?auto_3793 ?auto_3794 )
      ( MAKE-1CRATE ?auto_3794 ?auto_3795 )
      ( MAKE-6CRATE-VERIFY ?auto_3789 ?auto_3790 ?auto_3791 ?auto_3792 ?auto_3793 ?auto_3794 ?auto_3795 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_3833 - SURFACE
      ?auto_3834 - SURFACE
      ?auto_3835 - SURFACE
      ?auto_3836 - SURFACE
      ?auto_3837 - SURFACE
      ?auto_3838 - SURFACE
      ?auto_3839 - SURFACE
      ?auto_3840 - SURFACE
    )
    :vars
    (
      ?auto_3846 - HOIST
      ?auto_3845 - PLACE
      ?auto_3841 - PLACE
      ?auto_3842 - HOIST
      ?auto_3843 - SURFACE
      ?auto_3849 - PLACE
      ?auto_3847 - HOIST
      ?auto_3859 - SURFACE
      ?auto_3860 - PLACE
      ?auto_3857 - HOIST
      ?auto_3861 - SURFACE
      ?auto_3853 - PLACE
      ?auto_3854 - HOIST
      ?auto_3855 - SURFACE
      ?auto_3852 - PLACE
      ?auto_3856 - HOIST
      ?auto_3851 - SURFACE
      ?auto_3862 - SURFACE
      ?auto_3858 - PLACE
      ?auto_3848 - HOIST
      ?auto_3850 - SURFACE
      ?auto_3844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3846 ?auto_3845 ) ( IS-CRATE ?auto_3840 ) ( not ( = ?auto_3841 ?auto_3845 ) ) ( HOIST-AT ?auto_3842 ?auto_3841 ) ( AVAILABLE ?auto_3842 ) ( SURFACE-AT ?auto_3840 ?auto_3841 ) ( ON ?auto_3840 ?auto_3843 ) ( CLEAR ?auto_3840 ) ( not ( = ?auto_3839 ?auto_3840 ) ) ( not ( = ?auto_3839 ?auto_3843 ) ) ( not ( = ?auto_3840 ?auto_3843 ) ) ( not ( = ?auto_3846 ?auto_3842 ) ) ( IS-CRATE ?auto_3839 ) ( not ( = ?auto_3849 ?auto_3845 ) ) ( HOIST-AT ?auto_3847 ?auto_3849 ) ( AVAILABLE ?auto_3847 ) ( SURFACE-AT ?auto_3839 ?auto_3849 ) ( ON ?auto_3839 ?auto_3859 ) ( CLEAR ?auto_3839 ) ( not ( = ?auto_3838 ?auto_3839 ) ) ( not ( = ?auto_3838 ?auto_3859 ) ) ( not ( = ?auto_3839 ?auto_3859 ) ) ( not ( = ?auto_3846 ?auto_3847 ) ) ( IS-CRATE ?auto_3838 ) ( not ( = ?auto_3860 ?auto_3845 ) ) ( HOIST-AT ?auto_3857 ?auto_3860 ) ( SURFACE-AT ?auto_3838 ?auto_3860 ) ( ON ?auto_3838 ?auto_3861 ) ( CLEAR ?auto_3838 ) ( not ( = ?auto_3837 ?auto_3838 ) ) ( not ( = ?auto_3837 ?auto_3861 ) ) ( not ( = ?auto_3838 ?auto_3861 ) ) ( not ( = ?auto_3846 ?auto_3857 ) ) ( IS-CRATE ?auto_3837 ) ( not ( = ?auto_3853 ?auto_3845 ) ) ( HOIST-AT ?auto_3854 ?auto_3853 ) ( AVAILABLE ?auto_3854 ) ( SURFACE-AT ?auto_3837 ?auto_3853 ) ( ON ?auto_3837 ?auto_3855 ) ( CLEAR ?auto_3837 ) ( not ( = ?auto_3836 ?auto_3837 ) ) ( not ( = ?auto_3836 ?auto_3855 ) ) ( not ( = ?auto_3837 ?auto_3855 ) ) ( not ( = ?auto_3846 ?auto_3854 ) ) ( IS-CRATE ?auto_3836 ) ( not ( = ?auto_3852 ?auto_3845 ) ) ( HOIST-AT ?auto_3856 ?auto_3852 ) ( AVAILABLE ?auto_3856 ) ( SURFACE-AT ?auto_3836 ?auto_3852 ) ( ON ?auto_3836 ?auto_3851 ) ( CLEAR ?auto_3836 ) ( not ( = ?auto_3835 ?auto_3836 ) ) ( not ( = ?auto_3835 ?auto_3851 ) ) ( not ( = ?auto_3836 ?auto_3851 ) ) ( not ( = ?auto_3846 ?auto_3856 ) ) ( IS-CRATE ?auto_3835 ) ( AVAILABLE ?auto_3857 ) ( SURFACE-AT ?auto_3835 ?auto_3860 ) ( ON ?auto_3835 ?auto_3862 ) ( CLEAR ?auto_3835 ) ( not ( = ?auto_3834 ?auto_3835 ) ) ( not ( = ?auto_3834 ?auto_3862 ) ) ( not ( = ?auto_3835 ?auto_3862 ) ) ( SURFACE-AT ?auto_3833 ?auto_3845 ) ( CLEAR ?auto_3833 ) ( IS-CRATE ?auto_3834 ) ( AVAILABLE ?auto_3846 ) ( not ( = ?auto_3858 ?auto_3845 ) ) ( HOIST-AT ?auto_3848 ?auto_3858 ) ( AVAILABLE ?auto_3848 ) ( SURFACE-AT ?auto_3834 ?auto_3858 ) ( ON ?auto_3834 ?auto_3850 ) ( CLEAR ?auto_3834 ) ( TRUCK-AT ?auto_3844 ?auto_3845 ) ( not ( = ?auto_3833 ?auto_3834 ) ) ( not ( = ?auto_3833 ?auto_3850 ) ) ( not ( = ?auto_3834 ?auto_3850 ) ) ( not ( = ?auto_3846 ?auto_3848 ) ) ( not ( = ?auto_3833 ?auto_3835 ) ) ( not ( = ?auto_3833 ?auto_3862 ) ) ( not ( = ?auto_3835 ?auto_3850 ) ) ( not ( = ?auto_3860 ?auto_3858 ) ) ( not ( = ?auto_3857 ?auto_3848 ) ) ( not ( = ?auto_3862 ?auto_3850 ) ) ( not ( = ?auto_3833 ?auto_3836 ) ) ( not ( = ?auto_3833 ?auto_3851 ) ) ( not ( = ?auto_3834 ?auto_3836 ) ) ( not ( = ?auto_3834 ?auto_3851 ) ) ( not ( = ?auto_3836 ?auto_3862 ) ) ( not ( = ?auto_3836 ?auto_3850 ) ) ( not ( = ?auto_3852 ?auto_3860 ) ) ( not ( = ?auto_3852 ?auto_3858 ) ) ( not ( = ?auto_3856 ?auto_3857 ) ) ( not ( = ?auto_3856 ?auto_3848 ) ) ( not ( = ?auto_3851 ?auto_3862 ) ) ( not ( = ?auto_3851 ?auto_3850 ) ) ( not ( = ?auto_3833 ?auto_3837 ) ) ( not ( = ?auto_3833 ?auto_3855 ) ) ( not ( = ?auto_3834 ?auto_3837 ) ) ( not ( = ?auto_3834 ?auto_3855 ) ) ( not ( = ?auto_3835 ?auto_3837 ) ) ( not ( = ?auto_3835 ?auto_3855 ) ) ( not ( = ?auto_3837 ?auto_3851 ) ) ( not ( = ?auto_3837 ?auto_3862 ) ) ( not ( = ?auto_3837 ?auto_3850 ) ) ( not ( = ?auto_3853 ?auto_3852 ) ) ( not ( = ?auto_3853 ?auto_3860 ) ) ( not ( = ?auto_3853 ?auto_3858 ) ) ( not ( = ?auto_3854 ?auto_3856 ) ) ( not ( = ?auto_3854 ?auto_3857 ) ) ( not ( = ?auto_3854 ?auto_3848 ) ) ( not ( = ?auto_3855 ?auto_3851 ) ) ( not ( = ?auto_3855 ?auto_3862 ) ) ( not ( = ?auto_3855 ?auto_3850 ) ) ( not ( = ?auto_3833 ?auto_3838 ) ) ( not ( = ?auto_3833 ?auto_3861 ) ) ( not ( = ?auto_3834 ?auto_3838 ) ) ( not ( = ?auto_3834 ?auto_3861 ) ) ( not ( = ?auto_3835 ?auto_3838 ) ) ( not ( = ?auto_3835 ?auto_3861 ) ) ( not ( = ?auto_3836 ?auto_3838 ) ) ( not ( = ?auto_3836 ?auto_3861 ) ) ( not ( = ?auto_3838 ?auto_3855 ) ) ( not ( = ?auto_3838 ?auto_3851 ) ) ( not ( = ?auto_3838 ?auto_3862 ) ) ( not ( = ?auto_3838 ?auto_3850 ) ) ( not ( = ?auto_3861 ?auto_3855 ) ) ( not ( = ?auto_3861 ?auto_3851 ) ) ( not ( = ?auto_3861 ?auto_3862 ) ) ( not ( = ?auto_3861 ?auto_3850 ) ) ( not ( = ?auto_3833 ?auto_3839 ) ) ( not ( = ?auto_3833 ?auto_3859 ) ) ( not ( = ?auto_3834 ?auto_3839 ) ) ( not ( = ?auto_3834 ?auto_3859 ) ) ( not ( = ?auto_3835 ?auto_3839 ) ) ( not ( = ?auto_3835 ?auto_3859 ) ) ( not ( = ?auto_3836 ?auto_3839 ) ) ( not ( = ?auto_3836 ?auto_3859 ) ) ( not ( = ?auto_3837 ?auto_3839 ) ) ( not ( = ?auto_3837 ?auto_3859 ) ) ( not ( = ?auto_3839 ?auto_3861 ) ) ( not ( = ?auto_3839 ?auto_3855 ) ) ( not ( = ?auto_3839 ?auto_3851 ) ) ( not ( = ?auto_3839 ?auto_3862 ) ) ( not ( = ?auto_3839 ?auto_3850 ) ) ( not ( = ?auto_3849 ?auto_3860 ) ) ( not ( = ?auto_3849 ?auto_3853 ) ) ( not ( = ?auto_3849 ?auto_3852 ) ) ( not ( = ?auto_3849 ?auto_3858 ) ) ( not ( = ?auto_3847 ?auto_3857 ) ) ( not ( = ?auto_3847 ?auto_3854 ) ) ( not ( = ?auto_3847 ?auto_3856 ) ) ( not ( = ?auto_3847 ?auto_3848 ) ) ( not ( = ?auto_3859 ?auto_3861 ) ) ( not ( = ?auto_3859 ?auto_3855 ) ) ( not ( = ?auto_3859 ?auto_3851 ) ) ( not ( = ?auto_3859 ?auto_3862 ) ) ( not ( = ?auto_3859 ?auto_3850 ) ) ( not ( = ?auto_3833 ?auto_3840 ) ) ( not ( = ?auto_3833 ?auto_3843 ) ) ( not ( = ?auto_3834 ?auto_3840 ) ) ( not ( = ?auto_3834 ?auto_3843 ) ) ( not ( = ?auto_3835 ?auto_3840 ) ) ( not ( = ?auto_3835 ?auto_3843 ) ) ( not ( = ?auto_3836 ?auto_3840 ) ) ( not ( = ?auto_3836 ?auto_3843 ) ) ( not ( = ?auto_3837 ?auto_3840 ) ) ( not ( = ?auto_3837 ?auto_3843 ) ) ( not ( = ?auto_3838 ?auto_3840 ) ) ( not ( = ?auto_3838 ?auto_3843 ) ) ( not ( = ?auto_3840 ?auto_3859 ) ) ( not ( = ?auto_3840 ?auto_3861 ) ) ( not ( = ?auto_3840 ?auto_3855 ) ) ( not ( = ?auto_3840 ?auto_3851 ) ) ( not ( = ?auto_3840 ?auto_3862 ) ) ( not ( = ?auto_3840 ?auto_3850 ) ) ( not ( = ?auto_3841 ?auto_3849 ) ) ( not ( = ?auto_3841 ?auto_3860 ) ) ( not ( = ?auto_3841 ?auto_3853 ) ) ( not ( = ?auto_3841 ?auto_3852 ) ) ( not ( = ?auto_3841 ?auto_3858 ) ) ( not ( = ?auto_3842 ?auto_3847 ) ) ( not ( = ?auto_3842 ?auto_3857 ) ) ( not ( = ?auto_3842 ?auto_3854 ) ) ( not ( = ?auto_3842 ?auto_3856 ) ) ( not ( = ?auto_3842 ?auto_3848 ) ) ( not ( = ?auto_3843 ?auto_3859 ) ) ( not ( = ?auto_3843 ?auto_3861 ) ) ( not ( = ?auto_3843 ?auto_3855 ) ) ( not ( = ?auto_3843 ?auto_3851 ) ) ( not ( = ?auto_3843 ?auto_3862 ) ) ( not ( = ?auto_3843 ?auto_3850 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3833 ?auto_3834 ?auto_3835 ?auto_3836 ?auto_3837 ?auto_3838 ?auto_3839 )
      ( MAKE-1CRATE ?auto_3839 ?auto_3840 )
      ( MAKE-7CRATE-VERIFY ?auto_3833 ?auto_3834 ?auto_3835 ?auto_3836 ?auto_3837 ?auto_3838 ?auto_3839 ?auto_3840 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_3882 - SURFACE
      ?auto_3883 - SURFACE
      ?auto_3884 - SURFACE
      ?auto_3885 - SURFACE
      ?auto_3886 - SURFACE
      ?auto_3887 - SURFACE
      ?auto_3888 - SURFACE
      ?auto_3889 - SURFACE
      ?auto_3890 - SURFACE
    )
    :vars
    (
      ?auto_3896 - HOIST
      ?auto_3895 - PLACE
      ?auto_3891 - PLACE
      ?auto_3892 - HOIST
      ?auto_3893 - SURFACE
      ?auto_3914 - PLACE
      ?auto_3912 - HOIST
      ?auto_3913 - SURFACE
      ?auto_3898 - PLACE
      ?auto_3902 - HOIST
      ?auto_3897 - SURFACE
      ?auto_3905 - PLACE
      ?auto_3899 - HOIST
      ?auto_3910 - SURFACE
      ?auto_3908 - PLACE
      ?auto_3906 - HOIST
      ?auto_3907 - SURFACE
      ?auto_3904 - PLACE
      ?auto_3901 - HOIST
      ?auto_3900 - SURFACE
      ?auto_3903 - SURFACE
      ?auto_3911 - PLACE
      ?auto_3915 - HOIST
      ?auto_3909 - SURFACE
      ?auto_3894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3896 ?auto_3895 ) ( IS-CRATE ?auto_3890 ) ( not ( = ?auto_3891 ?auto_3895 ) ) ( HOIST-AT ?auto_3892 ?auto_3891 ) ( AVAILABLE ?auto_3892 ) ( SURFACE-AT ?auto_3890 ?auto_3891 ) ( ON ?auto_3890 ?auto_3893 ) ( CLEAR ?auto_3890 ) ( not ( = ?auto_3889 ?auto_3890 ) ) ( not ( = ?auto_3889 ?auto_3893 ) ) ( not ( = ?auto_3890 ?auto_3893 ) ) ( not ( = ?auto_3896 ?auto_3892 ) ) ( IS-CRATE ?auto_3889 ) ( not ( = ?auto_3914 ?auto_3895 ) ) ( HOIST-AT ?auto_3912 ?auto_3914 ) ( AVAILABLE ?auto_3912 ) ( SURFACE-AT ?auto_3889 ?auto_3914 ) ( ON ?auto_3889 ?auto_3913 ) ( CLEAR ?auto_3889 ) ( not ( = ?auto_3888 ?auto_3889 ) ) ( not ( = ?auto_3888 ?auto_3913 ) ) ( not ( = ?auto_3889 ?auto_3913 ) ) ( not ( = ?auto_3896 ?auto_3912 ) ) ( IS-CRATE ?auto_3888 ) ( not ( = ?auto_3898 ?auto_3895 ) ) ( HOIST-AT ?auto_3902 ?auto_3898 ) ( AVAILABLE ?auto_3902 ) ( SURFACE-AT ?auto_3888 ?auto_3898 ) ( ON ?auto_3888 ?auto_3897 ) ( CLEAR ?auto_3888 ) ( not ( = ?auto_3887 ?auto_3888 ) ) ( not ( = ?auto_3887 ?auto_3897 ) ) ( not ( = ?auto_3888 ?auto_3897 ) ) ( not ( = ?auto_3896 ?auto_3902 ) ) ( IS-CRATE ?auto_3887 ) ( not ( = ?auto_3905 ?auto_3895 ) ) ( HOIST-AT ?auto_3899 ?auto_3905 ) ( SURFACE-AT ?auto_3887 ?auto_3905 ) ( ON ?auto_3887 ?auto_3910 ) ( CLEAR ?auto_3887 ) ( not ( = ?auto_3886 ?auto_3887 ) ) ( not ( = ?auto_3886 ?auto_3910 ) ) ( not ( = ?auto_3887 ?auto_3910 ) ) ( not ( = ?auto_3896 ?auto_3899 ) ) ( IS-CRATE ?auto_3886 ) ( not ( = ?auto_3908 ?auto_3895 ) ) ( HOIST-AT ?auto_3906 ?auto_3908 ) ( AVAILABLE ?auto_3906 ) ( SURFACE-AT ?auto_3886 ?auto_3908 ) ( ON ?auto_3886 ?auto_3907 ) ( CLEAR ?auto_3886 ) ( not ( = ?auto_3885 ?auto_3886 ) ) ( not ( = ?auto_3885 ?auto_3907 ) ) ( not ( = ?auto_3886 ?auto_3907 ) ) ( not ( = ?auto_3896 ?auto_3906 ) ) ( IS-CRATE ?auto_3885 ) ( not ( = ?auto_3904 ?auto_3895 ) ) ( HOIST-AT ?auto_3901 ?auto_3904 ) ( AVAILABLE ?auto_3901 ) ( SURFACE-AT ?auto_3885 ?auto_3904 ) ( ON ?auto_3885 ?auto_3900 ) ( CLEAR ?auto_3885 ) ( not ( = ?auto_3884 ?auto_3885 ) ) ( not ( = ?auto_3884 ?auto_3900 ) ) ( not ( = ?auto_3885 ?auto_3900 ) ) ( not ( = ?auto_3896 ?auto_3901 ) ) ( IS-CRATE ?auto_3884 ) ( AVAILABLE ?auto_3899 ) ( SURFACE-AT ?auto_3884 ?auto_3905 ) ( ON ?auto_3884 ?auto_3903 ) ( CLEAR ?auto_3884 ) ( not ( = ?auto_3883 ?auto_3884 ) ) ( not ( = ?auto_3883 ?auto_3903 ) ) ( not ( = ?auto_3884 ?auto_3903 ) ) ( SURFACE-AT ?auto_3882 ?auto_3895 ) ( CLEAR ?auto_3882 ) ( IS-CRATE ?auto_3883 ) ( AVAILABLE ?auto_3896 ) ( not ( = ?auto_3911 ?auto_3895 ) ) ( HOIST-AT ?auto_3915 ?auto_3911 ) ( AVAILABLE ?auto_3915 ) ( SURFACE-AT ?auto_3883 ?auto_3911 ) ( ON ?auto_3883 ?auto_3909 ) ( CLEAR ?auto_3883 ) ( TRUCK-AT ?auto_3894 ?auto_3895 ) ( not ( = ?auto_3882 ?auto_3883 ) ) ( not ( = ?auto_3882 ?auto_3909 ) ) ( not ( = ?auto_3883 ?auto_3909 ) ) ( not ( = ?auto_3896 ?auto_3915 ) ) ( not ( = ?auto_3882 ?auto_3884 ) ) ( not ( = ?auto_3882 ?auto_3903 ) ) ( not ( = ?auto_3884 ?auto_3909 ) ) ( not ( = ?auto_3905 ?auto_3911 ) ) ( not ( = ?auto_3899 ?auto_3915 ) ) ( not ( = ?auto_3903 ?auto_3909 ) ) ( not ( = ?auto_3882 ?auto_3885 ) ) ( not ( = ?auto_3882 ?auto_3900 ) ) ( not ( = ?auto_3883 ?auto_3885 ) ) ( not ( = ?auto_3883 ?auto_3900 ) ) ( not ( = ?auto_3885 ?auto_3903 ) ) ( not ( = ?auto_3885 ?auto_3909 ) ) ( not ( = ?auto_3904 ?auto_3905 ) ) ( not ( = ?auto_3904 ?auto_3911 ) ) ( not ( = ?auto_3901 ?auto_3899 ) ) ( not ( = ?auto_3901 ?auto_3915 ) ) ( not ( = ?auto_3900 ?auto_3903 ) ) ( not ( = ?auto_3900 ?auto_3909 ) ) ( not ( = ?auto_3882 ?auto_3886 ) ) ( not ( = ?auto_3882 ?auto_3907 ) ) ( not ( = ?auto_3883 ?auto_3886 ) ) ( not ( = ?auto_3883 ?auto_3907 ) ) ( not ( = ?auto_3884 ?auto_3886 ) ) ( not ( = ?auto_3884 ?auto_3907 ) ) ( not ( = ?auto_3886 ?auto_3900 ) ) ( not ( = ?auto_3886 ?auto_3903 ) ) ( not ( = ?auto_3886 ?auto_3909 ) ) ( not ( = ?auto_3908 ?auto_3904 ) ) ( not ( = ?auto_3908 ?auto_3905 ) ) ( not ( = ?auto_3908 ?auto_3911 ) ) ( not ( = ?auto_3906 ?auto_3901 ) ) ( not ( = ?auto_3906 ?auto_3899 ) ) ( not ( = ?auto_3906 ?auto_3915 ) ) ( not ( = ?auto_3907 ?auto_3900 ) ) ( not ( = ?auto_3907 ?auto_3903 ) ) ( not ( = ?auto_3907 ?auto_3909 ) ) ( not ( = ?auto_3882 ?auto_3887 ) ) ( not ( = ?auto_3882 ?auto_3910 ) ) ( not ( = ?auto_3883 ?auto_3887 ) ) ( not ( = ?auto_3883 ?auto_3910 ) ) ( not ( = ?auto_3884 ?auto_3887 ) ) ( not ( = ?auto_3884 ?auto_3910 ) ) ( not ( = ?auto_3885 ?auto_3887 ) ) ( not ( = ?auto_3885 ?auto_3910 ) ) ( not ( = ?auto_3887 ?auto_3907 ) ) ( not ( = ?auto_3887 ?auto_3900 ) ) ( not ( = ?auto_3887 ?auto_3903 ) ) ( not ( = ?auto_3887 ?auto_3909 ) ) ( not ( = ?auto_3910 ?auto_3907 ) ) ( not ( = ?auto_3910 ?auto_3900 ) ) ( not ( = ?auto_3910 ?auto_3903 ) ) ( not ( = ?auto_3910 ?auto_3909 ) ) ( not ( = ?auto_3882 ?auto_3888 ) ) ( not ( = ?auto_3882 ?auto_3897 ) ) ( not ( = ?auto_3883 ?auto_3888 ) ) ( not ( = ?auto_3883 ?auto_3897 ) ) ( not ( = ?auto_3884 ?auto_3888 ) ) ( not ( = ?auto_3884 ?auto_3897 ) ) ( not ( = ?auto_3885 ?auto_3888 ) ) ( not ( = ?auto_3885 ?auto_3897 ) ) ( not ( = ?auto_3886 ?auto_3888 ) ) ( not ( = ?auto_3886 ?auto_3897 ) ) ( not ( = ?auto_3888 ?auto_3910 ) ) ( not ( = ?auto_3888 ?auto_3907 ) ) ( not ( = ?auto_3888 ?auto_3900 ) ) ( not ( = ?auto_3888 ?auto_3903 ) ) ( not ( = ?auto_3888 ?auto_3909 ) ) ( not ( = ?auto_3898 ?auto_3905 ) ) ( not ( = ?auto_3898 ?auto_3908 ) ) ( not ( = ?auto_3898 ?auto_3904 ) ) ( not ( = ?auto_3898 ?auto_3911 ) ) ( not ( = ?auto_3902 ?auto_3899 ) ) ( not ( = ?auto_3902 ?auto_3906 ) ) ( not ( = ?auto_3902 ?auto_3901 ) ) ( not ( = ?auto_3902 ?auto_3915 ) ) ( not ( = ?auto_3897 ?auto_3910 ) ) ( not ( = ?auto_3897 ?auto_3907 ) ) ( not ( = ?auto_3897 ?auto_3900 ) ) ( not ( = ?auto_3897 ?auto_3903 ) ) ( not ( = ?auto_3897 ?auto_3909 ) ) ( not ( = ?auto_3882 ?auto_3889 ) ) ( not ( = ?auto_3882 ?auto_3913 ) ) ( not ( = ?auto_3883 ?auto_3889 ) ) ( not ( = ?auto_3883 ?auto_3913 ) ) ( not ( = ?auto_3884 ?auto_3889 ) ) ( not ( = ?auto_3884 ?auto_3913 ) ) ( not ( = ?auto_3885 ?auto_3889 ) ) ( not ( = ?auto_3885 ?auto_3913 ) ) ( not ( = ?auto_3886 ?auto_3889 ) ) ( not ( = ?auto_3886 ?auto_3913 ) ) ( not ( = ?auto_3887 ?auto_3889 ) ) ( not ( = ?auto_3887 ?auto_3913 ) ) ( not ( = ?auto_3889 ?auto_3897 ) ) ( not ( = ?auto_3889 ?auto_3910 ) ) ( not ( = ?auto_3889 ?auto_3907 ) ) ( not ( = ?auto_3889 ?auto_3900 ) ) ( not ( = ?auto_3889 ?auto_3903 ) ) ( not ( = ?auto_3889 ?auto_3909 ) ) ( not ( = ?auto_3914 ?auto_3898 ) ) ( not ( = ?auto_3914 ?auto_3905 ) ) ( not ( = ?auto_3914 ?auto_3908 ) ) ( not ( = ?auto_3914 ?auto_3904 ) ) ( not ( = ?auto_3914 ?auto_3911 ) ) ( not ( = ?auto_3912 ?auto_3902 ) ) ( not ( = ?auto_3912 ?auto_3899 ) ) ( not ( = ?auto_3912 ?auto_3906 ) ) ( not ( = ?auto_3912 ?auto_3901 ) ) ( not ( = ?auto_3912 ?auto_3915 ) ) ( not ( = ?auto_3913 ?auto_3897 ) ) ( not ( = ?auto_3913 ?auto_3910 ) ) ( not ( = ?auto_3913 ?auto_3907 ) ) ( not ( = ?auto_3913 ?auto_3900 ) ) ( not ( = ?auto_3913 ?auto_3903 ) ) ( not ( = ?auto_3913 ?auto_3909 ) ) ( not ( = ?auto_3882 ?auto_3890 ) ) ( not ( = ?auto_3882 ?auto_3893 ) ) ( not ( = ?auto_3883 ?auto_3890 ) ) ( not ( = ?auto_3883 ?auto_3893 ) ) ( not ( = ?auto_3884 ?auto_3890 ) ) ( not ( = ?auto_3884 ?auto_3893 ) ) ( not ( = ?auto_3885 ?auto_3890 ) ) ( not ( = ?auto_3885 ?auto_3893 ) ) ( not ( = ?auto_3886 ?auto_3890 ) ) ( not ( = ?auto_3886 ?auto_3893 ) ) ( not ( = ?auto_3887 ?auto_3890 ) ) ( not ( = ?auto_3887 ?auto_3893 ) ) ( not ( = ?auto_3888 ?auto_3890 ) ) ( not ( = ?auto_3888 ?auto_3893 ) ) ( not ( = ?auto_3890 ?auto_3913 ) ) ( not ( = ?auto_3890 ?auto_3897 ) ) ( not ( = ?auto_3890 ?auto_3910 ) ) ( not ( = ?auto_3890 ?auto_3907 ) ) ( not ( = ?auto_3890 ?auto_3900 ) ) ( not ( = ?auto_3890 ?auto_3903 ) ) ( not ( = ?auto_3890 ?auto_3909 ) ) ( not ( = ?auto_3891 ?auto_3914 ) ) ( not ( = ?auto_3891 ?auto_3898 ) ) ( not ( = ?auto_3891 ?auto_3905 ) ) ( not ( = ?auto_3891 ?auto_3908 ) ) ( not ( = ?auto_3891 ?auto_3904 ) ) ( not ( = ?auto_3891 ?auto_3911 ) ) ( not ( = ?auto_3892 ?auto_3912 ) ) ( not ( = ?auto_3892 ?auto_3902 ) ) ( not ( = ?auto_3892 ?auto_3899 ) ) ( not ( = ?auto_3892 ?auto_3906 ) ) ( not ( = ?auto_3892 ?auto_3901 ) ) ( not ( = ?auto_3892 ?auto_3915 ) ) ( not ( = ?auto_3893 ?auto_3913 ) ) ( not ( = ?auto_3893 ?auto_3897 ) ) ( not ( = ?auto_3893 ?auto_3910 ) ) ( not ( = ?auto_3893 ?auto_3907 ) ) ( not ( = ?auto_3893 ?auto_3900 ) ) ( not ( = ?auto_3893 ?auto_3903 ) ) ( not ( = ?auto_3893 ?auto_3909 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_3882 ?auto_3883 ?auto_3884 ?auto_3885 ?auto_3886 ?auto_3887 ?auto_3888 ?auto_3889 )
      ( MAKE-1CRATE ?auto_3889 ?auto_3890 )
      ( MAKE-8CRATE-VERIFY ?auto_3882 ?auto_3883 ?auto_3884 ?auto_3885 ?auto_3886 ?auto_3887 ?auto_3888 ?auto_3889 ?auto_3890 ) )
  )

)

