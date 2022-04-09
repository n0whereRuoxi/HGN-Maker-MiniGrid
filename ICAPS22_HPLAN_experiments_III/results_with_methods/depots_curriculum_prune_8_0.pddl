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
      ?auto_3663 - HOIST
      ?auto_3660 - PLACE
      ?auto_3665 - PLACE
      ?auto_3661 - HOIST
      ?auto_3662 - SURFACE
      ?auto_3668 - PLACE
      ?auto_3666 - HOIST
      ?auto_3667 - SURFACE
      ?auto_3664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3663 ?auto_3660 ) ( IS-CRATE ?auto_3659 ) ( not ( = ?auto_3665 ?auto_3660 ) ) ( HOIST-AT ?auto_3661 ?auto_3665 ) ( AVAILABLE ?auto_3661 ) ( SURFACE-AT ?auto_3659 ?auto_3665 ) ( ON ?auto_3659 ?auto_3662 ) ( CLEAR ?auto_3659 ) ( not ( = ?auto_3658 ?auto_3659 ) ) ( not ( = ?auto_3658 ?auto_3662 ) ) ( not ( = ?auto_3659 ?auto_3662 ) ) ( not ( = ?auto_3663 ?auto_3661 ) ) ( SURFACE-AT ?auto_3657 ?auto_3660 ) ( CLEAR ?auto_3657 ) ( IS-CRATE ?auto_3658 ) ( AVAILABLE ?auto_3663 ) ( not ( = ?auto_3668 ?auto_3660 ) ) ( HOIST-AT ?auto_3666 ?auto_3668 ) ( AVAILABLE ?auto_3666 ) ( SURFACE-AT ?auto_3658 ?auto_3668 ) ( ON ?auto_3658 ?auto_3667 ) ( CLEAR ?auto_3658 ) ( TRUCK-AT ?auto_3664 ?auto_3660 ) ( not ( = ?auto_3657 ?auto_3658 ) ) ( not ( = ?auto_3657 ?auto_3667 ) ) ( not ( = ?auto_3658 ?auto_3667 ) ) ( not ( = ?auto_3663 ?auto_3666 ) ) ( not ( = ?auto_3657 ?auto_3659 ) ) ( not ( = ?auto_3657 ?auto_3662 ) ) ( not ( = ?auto_3659 ?auto_3667 ) ) ( not ( = ?auto_3665 ?auto_3668 ) ) ( not ( = ?auto_3661 ?auto_3666 ) ) ( not ( = ?auto_3662 ?auto_3667 ) ) )
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
      ?auto_3688 - HOIST
      ?auto_3691 - PLACE
      ?auto_3690 - PLACE
      ?auto_3687 - HOIST
      ?auto_3689 - SURFACE
      ?auto_3698 - PLACE
      ?auto_3696 - HOIST
      ?auto_3697 - SURFACE
      ?auto_3695 - PLACE
      ?auto_3693 - HOIST
      ?auto_3694 - SURFACE
      ?auto_3692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3688 ?auto_3691 ) ( IS-CRATE ?auto_3686 ) ( not ( = ?auto_3690 ?auto_3691 ) ) ( HOIST-AT ?auto_3687 ?auto_3690 ) ( AVAILABLE ?auto_3687 ) ( SURFACE-AT ?auto_3686 ?auto_3690 ) ( ON ?auto_3686 ?auto_3689 ) ( CLEAR ?auto_3686 ) ( not ( = ?auto_3685 ?auto_3686 ) ) ( not ( = ?auto_3685 ?auto_3689 ) ) ( not ( = ?auto_3686 ?auto_3689 ) ) ( not ( = ?auto_3688 ?auto_3687 ) ) ( IS-CRATE ?auto_3685 ) ( not ( = ?auto_3698 ?auto_3691 ) ) ( HOIST-AT ?auto_3696 ?auto_3698 ) ( AVAILABLE ?auto_3696 ) ( SURFACE-AT ?auto_3685 ?auto_3698 ) ( ON ?auto_3685 ?auto_3697 ) ( CLEAR ?auto_3685 ) ( not ( = ?auto_3684 ?auto_3685 ) ) ( not ( = ?auto_3684 ?auto_3697 ) ) ( not ( = ?auto_3685 ?auto_3697 ) ) ( not ( = ?auto_3688 ?auto_3696 ) ) ( SURFACE-AT ?auto_3683 ?auto_3691 ) ( CLEAR ?auto_3683 ) ( IS-CRATE ?auto_3684 ) ( AVAILABLE ?auto_3688 ) ( not ( = ?auto_3695 ?auto_3691 ) ) ( HOIST-AT ?auto_3693 ?auto_3695 ) ( AVAILABLE ?auto_3693 ) ( SURFACE-AT ?auto_3684 ?auto_3695 ) ( ON ?auto_3684 ?auto_3694 ) ( CLEAR ?auto_3684 ) ( TRUCK-AT ?auto_3692 ?auto_3691 ) ( not ( = ?auto_3683 ?auto_3684 ) ) ( not ( = ?auto_3683 ?auto_3694 ) ) ( not ( = ?auto_3684 ?auto_3694 ) ) ( not ( = ?auto_3688 ?auto_3693 ) ) ( not ( = ?auto_3683 ?auto_3685 ) ) ( not ( = ?auto_3683 ?auto_3697 ) ) ( not ( = ?auto_3685 ?auto_3694 ) ) ( not ( = ?auto_3698 ?auto_3695 ) ) ( not ( = ?auto_3696 ?auto_3693 ) ) ( not ( = ?auto_3697 ?auto_3694 ) ) ( not ( = ?auto_3683 ?auto_3686 ) ) ( not ( = ?auto_3683 ?auto_3689 ) ) ( not ( = ?auto_3684 ?auto_3686 ) ) ( not ( = ?auto_3684 ?auto_3689 ) ) ( not ( = ?auto_3686 ?auto_3697 ) ) ( not ( = ?auto_3686 ?auto_3694 ) ) ( not ( = ?auto_3690 ?auto_3698 ) ) ( not ( = ?auto_3690 ?auto_3695 ) ) ( not ( = ?auto_3687 ?auto_3696 ) ) ( not ( = ?auto_3687 ?auto_3693 ) ) ( not ( = ?auto_3689 ?auto_3697 ) ) ( not ( = ?auto_3689 ?auto_3694 ) ) )
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
      ?auto_3723 - HOIST
      ?auto_3719 - PLACE
      ?auto_3724 - PLACE
      ?auto_3720 - HOIST
      ?auto_3721 - SURFACE
      ?auto_3733 - PLACE
      ?auto_3731 - HOIST
      ?auto_3732 - SURFACE
      ?auto_3728 - PLACE
      ?auto_3727 - HOIST
      ?auto_3726 - SURFACE
      ?auto_3725 - PLACE
      ?auto_3729 - HOIST
      ?auto_3730 - SURFACE
      ?auto_3722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3723 ?auto_3719 ) ( IS-CRATE ?auto_3718 ) ( not ( = ?auto_3724 ?auto_3719 ) ) ( HOIST-AT ?auto_3720 ?auto_3724 ) ( AVAILABLE ?auto_3720 ) ( SURFACE-AT ?auto_3718 ?auto_3724 ) ( ON ?auto_3718 ?auto_3721 ) ( CLEAR ?auto_3718 ) ( not ( = ?auto_3717 ?auto_3718 ) ) ( not ( = ?auto_3717 ?auto_3721 ) ) ( not ( = ?auto_3718 ?auto_3721 ) ) ( not ( = ?auto_3723 ?auto_3720 ) ) ( IS-CRATE ?auto_3717 ) ( not ( = ?auto_3733 ?auto_3719 ) ) ( HOIST-AT ?auto_3731 ?auto_3733 ) ( AVAILABLE ?auto_3731 ) ( SURFACE-AT ?auto_3717 ?auto_3733 ) ( ON ?auto_3717 ?auto_3732 ) ( CLEAR ?auto_3717 ) ( not ( = ?auto_3716 ?auto_3717 ) ) ( not ( = ?auto_3716 ?auto_3732 ) ) ( not ( = ?auto_3717 ?auto_3732 ) ) ( not ( = ?auto_3723 ?auto_3731 ) ) ( IS-CRATE ?auto_3716 ) ( not ( = ?auto_3728 ?auto_3719 ) ) ( HOIST-AT ?auto_3727 ?auto_3728 ) ( AVAILABLE ?auto_3727 ) ( SURFACE-AT ?auto_3716 ?auto_3728 ) ( ON ?auto_3716 ?auto_3726 ) ( CLEAR ?auto_3716 ) ( not ( = ?auto_3715 ?auto_3716 ) ) ( not ( = ?auto_3715 ?auto_3726 ) ) ( not ( = ?auto_3716 ?auto_3726 ) ) ( not ( = ?auto_3723 ?auto_3727 ) ) ( SURFACE-AT ?auto_3714 ?auto_3719 ) ( CLEAR ?auto_3714 ) ( IS-CRATE ?auto_3715 ) ( AVAILABLE ?auto_3723 ) ( not ( = ?auto_3725 ?auto_3719 ) ) ( HOIST-AT ?auto_3729 ?auto_3725 ) ( AVAILABLE ?auto_3729 ) ( SURFACE-AT ?auto_3715 ?auto_3725 ) ( ON ?auto_3715 ?auto_3730 ) ( CLEAR ?auto_3715 ) ( TRUCK-AT ?auto_3722 ?auto_3719 ) ( not ( = ?auto_3714 ?auto_3715 ) ) ( not ( = ?auto_3714 ?auto_3730 ) ) ( not ( = ?auto_3715 ?auto_3730 ) ) ( not ( = ?auto_3723 ?auto_3729 ) ) ( not ( = ?auto_3714 ?auto_3716 ) ) ( not ( = ?auto_3714 ?auto_3726 ) ) ( not ( = ?auto_3716 ?auto_3730 ) ) ( not ( = ?auto_3728 ?auto_3725 ) ) ( not ( = ?auto_3727 ?auto_3729 ) ) ( not ( = ?auto_3726 ?auto_3730 ) ) ( not ( = ?auto_3714 ?auto_3717 ) ) ( not ( = ?auto_3714 ?auto_3732 ) ) ( not ( = ?auto_3715 ?auto_3717 ) ) ( not ( = ?auto_3715 ?auto_3732 ) ) ( not ( = ?auto_3717 ?auto_3726 ) ) ( not ( = ?auto_3717 ?auto_3730 ) ) ( not ( = ?auto_3733 ?auto_3728 ) ) ( not ( = ?auto_3733 ?auto_3725 ) ) ( not ( = ?auto_3731 ?auto_3727 ) ) ( not ( = ?auto_3731 ?auto_3729 ) ) ( not ( = ?auto_3732 ?auto_3726 ) ) ( not ( = ?auto_3732 ?auto_3730 ) ) ( not ( = ?auto_3714 ?auto_3718 ) ) ( not ( = ?auto_3714 ?auto_3721 ) ) ( not ( = ?auto_3715 ?auto_3718 ) ) ( not ( = ?auto_3715 ?auto_3721 ) ) ( not ( = ?auto_3716 ?auto_3718 ) ) ( not ( = ?auto_3716 ?auto_3721 ) ) ( not ( = ?auto_3718 ?auto_3732 ) ) ( not ( = ?auto_3718 ?auto_3726 ) ) ( not ( = ?auto_3718 ?auto_3730 ) ) ( not ( = ?auto_3724 ?auto_3733 ) ) ( not ( = ?auto_3724 ?auto_3728 ) ) ( not ( = ?auto_3724 ?auto_3725 ) ) ( not ( = ?auto_3720 ?auto_3731 ) ) ( not ( = ?auto_3720 ?auto_3727 ) ) ( not ( = ?auto_3720 ?auto_3729 ) ) ( not ( = ?auto_3721 ?auto_3732 ) ) ( not ( = ?auto_3721 ?auto_3726 ) ) ( not ( = ?auto_3721 ?auto_3730 ) ) )
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
      ?auto_3758 - PLACE
      ?auto_3756 - PLACE
      ?auto_3760 - HOIST
      ?auto_3761 - SURFACE
      ?auto_3766 - PLACE
      ?auto_3763 - HOIST
      ?auto_3767 - SURFACE
      ?auto_3762 - PLACE
      ?auto_3765 - HOIST
      ?auto_3768 - SURFACE
      ?auto_3769 - SURFACE
      ?auto_3764 - PLACE
      ?auto_3770 - HOIST
      ?auto_3771 - SURFACE
      ?auto_3757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3759 ?auto_3758 ) ( IS-CRATE ?auto_3755 ) ( not ( = ?auto_3756 ?auto_3758 ) ) ( HOIST-AT ?auto_3760 ?auto_3756 ) ( SURFACE-AT ?auto_3755 ?auto_3756 ) ( ON ?auto_3755 ?auto_3761 ) ( CLEAR ?auto_3755 ) ( not ( = ?auto_3754 ?auto_3755 ) ) ( not ( = ?auto_3754 ?auto_3761 ) ) ( not ( = ?auto_3755 ?auto_3761 ) ) ( not ( = ?auto_3759 ?auto_3760 ) ) ( IS-CRATE ?auto_3754 ) ( not ( = ?auto_3766 ?auto_3758 ) ) ( HOIST-AT ?auto_3763 ?auto_3766 ) ( AVAILABLE ?auto_3763 ) ( SURFACE-AT ?auto_3754 ?auto_3766 ) ( ON ?auto_3754 ?auto_3767 ) ( CLEAR ?auto_3754 ) ( not ( = ?auto_3753 ?auto_3754 ) ) ( not ( = ?auto_3753 ?auto_3767 ) ) ( not ( = ?auto_3754 ?auto_3767 ) ) ( not ( = ?auto_3759 ?auto_3763 ) ) ( IS-CRATE ?auto_3753 ) ( not ( = ?auto_3762 ?auto_3758 ) ) ( HOIST-AT ?auto_3765 ?auto_3762 ) ( AVAILABLE ?auto_3765 ) ( SURFACE-AT ?auto_3753 ?auto_3762 ) ( ON ?auto_3753 ?auto_3768 ) ( CLEAR ?auto_3753 ) ( not ( = ?auto_3752 ?auto_3753 ) ) ( not ( = ?auto_3752 ?auto_3768 ) ) ( not ( = ?auto_3753 ?auto_3768 ) ) ( not ( = ?auto_3759 ?auto_3765 ) ) ( IS-CRATE ?auto_3752 ) ( AVAILABLE ?auto_3760 ) ( SURFACE-AT ?auto_3752 ?auto_3756 ) ( ON ?auto_3752 ?auto_3769 ) ( CLEAR ?auto_3752 ) ( not ( = ?auto_3751 ?auto_3752 ) ) ( not ( = ?auto_3751 ?auto_3769 ) ) ( not ( = ?auto_3752 ?auto_3769 ) ) ( SURFACE-AT ?auto_3750 ?auto_3758 ) ( CLEAR ?auto_3750 ) ( IS-CRATE ?auto_3751 ) ( AVAILABLE ?auto_3759 ) ( not ( = ?auto_3764 ?auto_3758 ) ) ( HOIST-AT ?auto_3770 ?auto_3764 ) ( AVAILABLE ?auto_3770 ) ( SURFACE-AT ?auto_3751 ?auto_3764 ) ( ON ?auto_3751 ?auto_3771 ) ( CLEAR ?auto_3751 ) ( TRUCK-AT ?auto_3757 ?auto_3758 ) ( not ( = ?auto_3750 ?auto_3751 ) ) ( not ( = ?auto_3750 ?auto_3771 ) ) ( not ( = ?auto_3751 ?auto_3771 ) ) ( not ( = ?auto_3759 ?auto_3770 ) ) ( not ( = ?auto_3750 ?auto_3752 ) ) ( not ( = ?auto_3750 ?auto_3769 ) ) ( not ( = ?auto_3752 ?auto_3771 ) ) ( not ( = ?auto_3756 ?auto_3764 ) ) ( not ( = ?auto_3760 ?auto_3770 ) ) ( not ( = ?auto_3769 ?auto_3771 ) ) ( not ( = ?auto_3750 ?auto_3753 ) ) ( not ( = ?auto_3750 ?auto_3768 ) ) ( not ( = ?auto_3751 ?auto_3753 ) ) ( not ( = ?auto_3751 ?auto_3768 ) ) ( not ( = ?auto_3753 ?auto_3769 ) ) ( not ( = ?auto_3753 ?auto_3771 ) ) ( not ( = ?auto_3762 ?auto_3756 ) ) ( not ( = ?auto_3762 ?auto_3764 ) ) ( not ( = ?auto_3765 ?auto_3760 ) ) ( not ( = ?auto_3765 ?auto_3770 ) ) ( not ( = ?auto_3768 ?auto_3769 ) ) ( not ( = ?auto_3768 ?auto_3771 ) ) ( not ( = ?auto_3750 ?auto_3754 ) ) ( not ( = ?auto_3750 ?auto_3767 ) ) ( not ( = ?auto_3751 ?auto_3754 ) ) ( not ( = ?auto_3751 ?auto_3767 ) ) ( not ( = ?auto_3752 ?auto_3754 ) ) ( not ( = ?auto_3752 ?auto_3767 ) ) ( not ( = ?auto_3754 ?auto_3768 ) ) ( not ( = ?auto_3754 ?auto_3769 ) ) ( not ( = ?auto_3754 ?auto_3771 ) ) ( not ( = ?auto_3766 ?auto_3762 ) ) ( not ( = ?auto_3766 ?auto_3756 ) ) ( not ( = ?auto_3766 ?auto_3764 ) ) ( not ( = ?auto_3763 ?auto_3765 ) ) ( not ( = ?auto_3763 ?auto_3760 ) ) ( not ( = ?auto_3763 ?auto_3770 ) ) ( not ( = ?auto_3767 ?auto_3768 ) ) ( not ( = ?auto_3767 ?auto_3769 ) ) ( not ( = ?auto_3767 ?auto_3771 ) ) ( not ( = ?auto_3750 ?auto_3755 ) ) ( not ( = ?auto_3750 ?auto_3761 ) ) ( not ( = ?auto_3751 ?auto_3755 ) ) ( not ( = ?auto_3751 ?auto_3761 ) ) ( not ( = ?auto_3752 ?auto_3755 ) ) ( not ( = ?auto_3752 ?auto_3761 ) ) ( not ( = ?auto_3753 ?auto_3755 ) ) ( not ( = ?auto_3753 ?auto_3761 ) ) ( not ( = ?auto_3755 ?auto_3767 ) ) ( not ( = ?auto_3755 ?auto_3768 ) ) ( not ( = ?auto_3755 ?auto_3769 ) ) ( not ( = ?auto_3755 ?auto_3771 ) ) ( not ( = ?auto_3761 ?auto_3767 ) ) ( not ( = ?auto_3761 ?auto_3768 ) ) ( not ( = ?auto_3761 ?auto_3769 ) ) ( not ( = ?auto_3761 ?auto_3771 ) ) )
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
      ?auto_3799 - PLACE
      ?auto_3798 - PLACE
      ?auto_3796 - HOIST
      ?auto_3797 - SURFACE
      ?auto_3810 - PLACE
      ?auto_3807 - HOIST
      ?auto_3813 - SURFACE
      ?auto_3806 - PLACE
      ?auto_3805 - HOIST
      ?auto_3808 - SURFACE
      ?auto_3802 - PLACE
      ?auto_3804 - HOIST
      ?auto_3814 - SURFACE
      ?auto_3809 - SURFACE
      ?auto_3803 - PLACE
      ?auto_3811 - HOIST
      ?auto_3812 - SURFACE
      ?auto_3801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3800 ?auto_3799 ) ( IS-CRATE ?auto_3795 ) ( not ( = ?auto_3798 ?auto_3799 ) ) ( HOIST-AT ?auto_3796 ?auto_3798 ) ( AVAILABLE ?auto_3796 ) ( SURFACE-AT ?auto_3795 ?auto_3798 ) ( ON ?auto_3795 ?auto_3797 ) ( CLEAR ?auto_3795 ) ( not ( = ?auto_3794 ?auto_3795 ) ) ( not ( = ?auto_3794 ?auto_3797 ) ) ( not ( = ?auto_3795 ?auto_3797 ) ) ( not ( = ?auto_3800 ?auto_3796 ) ) ( IS-CRATE ?auto_3794 ) ( not ( = ?auto_3810 ?auto_3799 ) ) ( HOIST-AT ?auto_3807 ?auto_3810 ) ( SURFACE-AT ?auto_3794 ?auto_3810 ) ( ON ?auto_3794 ?auto_3813 ) ( CLEAR ?auto_3794 ) ( not ( = ?auto_3793 ?auto_3794 ) ) ( not ( = ?auto_3793 ?auto_3813 ) ) ( not ( = ?auto_3794 ?auto_3813 ) ) ( not ( = ?auto_3800 ?auto_3807 ) ) ( IS-CRATE ?auto_3793 ) ( not ( = ?auto_3806 ?auto_3799 ) ) ( HOIST-AT ?auto_3805 ?auto_3806 ) ( AVAILABLE ?auto_3805 ) ( SURFACE-AT ?auto_3793 ?auto_3806 ) ( ON ?auto_3793 ?auto_3808 ) ( CLEAR ?auto_3793 ) ( not ( = ?auto_3792 ?auto_3793 ) ) ( not ( = ?auto_3792 ?auto_3808 ) ) ( not ( = ?auto_3793 ?auto_3808 ) ) ( not ( = ?auto_3800 ?auto_3805 ) ) ( IS-CRATE ?auto_3792 ) ( not ( = ?auto_3802 ?auto_3799 ) ) ( HOIST-AT ?auto_3804 ?auto_3802 ) ( AVAILABLE ?auto_3804 ) ( SURFACE-AT ?auto_3792 ?auto_3802 ) ( ON ?auto_3792 ?auto_3814 ) ( CLEAR ?auto_3792 ) ( not ( = ?auto_3791 ?auto_3792 ) ) ( not ( = ?auto_3791 ?auto_3814 ) ) ( not ( = ?auto_3792 ?auto_3814 ) ) ( not ( = ?auto_3800 ?auto_3804 ) ) ( IS-CRATE ?auto_3791 ) ( AVAILABLE ?auto_3807 ) ( SURFACE-AT ?auto_3791 ?auto_3810 ) ( ON ?auto_3791 ?auto_3809 ) ( CLEAR ?auto_3791 ) ( not ( = ?auto_3790 ?auto_3791 ) ) ( not ( = ?auto_3790 ?auto_3809 ) ) ( not ( = ?auto_3791 ?auto_3809 ) ) ( SURFACE-AT ?auto_3789 ?auto_3799 ) ( CLEAR ?auto_3789 ) ( IS-CRATE ?auto_3790 ) ( AVAILABLE ?auto_3800 ) ( not ( = ?auto_3803 ?auto_3799 ) ) ( HOIST-AT ?auto_3811 ?auto_3803 ) ( AVAILABLE ?auto_3811 ) ( SURFACE-AT ?auto_3790 ?auto_3803 ) ( ON ?auto_3790 ?auto_3812 ) ( CLEAR ?auto_3790 ) ( TRUCK-AT ?auto_3801 ?auto_3799 ) ( not ( = ?auto_3789 ?auto_3790 ) ) ( not ( = ?auto_3789 ?auto_3812 ) ) ( not ( = ?auto_3790 ?auto_3812 ) ) ( not ( = ?auto_3800 ?auto_3811 ) ) ( not ( = ?auto_3789 ?auto_3791 ) ) ( not ( = ?auto_3789 ?auto_3809 ) ) ( not ( = ?auto_3791 ?auto_3812 ) ) ( not ( = ?auto_3810 ?auto_3803 ) ) ( not ( = ?auto_3807 ?auto_3811 ) ) ( not ( = ?auto_3809 ?auto_3812 ) ) ( not ( = ?auto_3789 ?auto_3792 ) ) ( not ( = ?auto_3789 ?auto_3814 ) ) ( not ( = ?auto_3790 ?auto_3792 ) ) ( not ( = ?auto_3790 ?auto_3814 ) ) ( not ( = ?auto_3792 ?auto_3809 ) ) ( not ( = ?auto_3792 ?auto_3812 ) ) ( not ( = ?auto_3802 ?auto_3810 ) ) ( not ( = ?auto_3802 ?auto_3803 ) ) ( not ( = ?auto_3804 ?auto_3807 ) ) ( not ( = ?auto_3804 ?auto_3811 ) ) ( not ( = ?auto_3814 ?auto_3809 ) ) ( not ( = ?auto_3814 ?auto_3812 ) ) ( not ( = ?auto_3789 ?auto_3793 ) ) ( not ( = ?auto_3789 ?auto_3808 ) ) ( not ( = ?auto_3790 ?auto_3793 ) ) ( not ( = ?auto_3790 ?auto_3808 ) ) ( not ( = ?auto_3791 ?auto_3793 ) ) ( not ( = ?auto_3791 ?auto_3808 ) ) ( not ( = ?auto_3793 ?auto_3814 ) ) ( not ( = ?auto_3793 ?auto_3809 ) ) ( not ( = ?auto_3793 ?auto_3812 ) ) ( not ( = ?auto_3806 ?auto_3802 ) ) ( not ( = ?auto_3806 ?auto_3810 ) ) ( not ( = ?auto_3806 ?auto_3803 ) ) ( not ( = ?auto_3805 ?auto_3804 ) ) ( not ( = ?auto_3805 ?auto_3807 ) ) ( not ( = ?auto_3805 ?auto_3811 ) ) ( not ( = ?auto_3808 ?auto_3814 ) ) ( not ( = ?auto_3808 ?auto_3809 ) ) ( not ( = ?auto_3808 ?auto_3812 ) ) ( not ( = ?auto_3789 ?auto_3794 ) ) ( not ( = ?auto_3789 ?auto_3813 ) ) ( not ( = ?auto_3790 ?auto_3794 ) ) ( not ( = ?auto_3790 ?auto_3813 ) ) ( not ( = ?auto_3791 ?auto_3794 ) ) ( not ( = ?auto_3791 ?auto_3813 ) ) ( not ( = ?auto_3792 ?auto_3794 ) ) ( not ( = ?auto_3792 ?auto_3813 ) ) ( not ( = ?auto_3794 ?auto_3808 ) ) ( not ( = ?auto_3794 ?auto_3814 ) ) ( not ( = ?auto_3794 ?auto_3809 ) ) ( not ( = ?auto_3794 ?auto_3812 ) ) ( not ( = ?auto_3813 ?auto_3808 ) ) ( not ( = ?auto_3813 ?auto_3814 ) ) ( not ( = ?auto_3813 ?auto_3809 ) ) ( not ( = ?auto_3813 ?auto_3812 ) ) ( not ( = ?auto_3789 ?auto_3795 ) ) ( not ( = ?auto_3789 ?auto_3797 ) ) ( not ( = ?auto_3790 ?auto_3795 ) ) ( not ( = ?auto_3790 ?auto_3797 ) ) ( not ( = ?auto_3791 ?auto_3795 ) ) ( not ( = ?auto_3791 ?auto_3797 ) ) ( not ( = ?auto_3792 ?auto_3795 ) ) ( not ( = ?auto_3792 ?auto_3797 ) ) ( not ( = ?auto_3793 ?auto_3795 ) ) ( not ( = ?auto_3793 ?auto_3797 ) ) ( not ( = ?auto_3795 ?auto_3813 ) ) ( not ( = ?auto_3795 ?auto_3808 ) ) ( not ( = ?auto_3795 ?auto_3814 ) ) ( not ( = ?auto_3795 ?auto_3809 ) ) ( not ( = ?auto_3795 ?auto_3812 ) ) ( not ( = ?auto_3798 ?auto_3810 ) ) ( not ( = ?auto_3798 ?auto_3806 ) ) ( not ( = ?auto_3798 ?auto_3802 ) ) ( not ( = ?auto_3798 ?auto_3803 ) ) ( not ( = ?auto_3796 ?auto_3807 ) ) ( not ( = ?auto_3796 ?auto_3805 ) ) ( not ( = ?auto_3796 ?auto_3804 ) ) ( not ( = ?auto_3796 ?auto_3811 ) ) ( not ( = ?auto_3797 ?auto_3813 ) ) ( not ( = ?auto_3797 ?auto_3808 ) ) ( not ( = ?auto_3797 ?auto_3814 ) ) ( not ( = ?auto_3797 ?auto_3809 ) ) ( not ( = ?auto_3797 ?auto_3812 ) ) )
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
      ?auto_3843 - HOIST
      ?auto_3842 - PLACE
      ?auto_3844 - PLACE
      ?auto_3845 - HOIST
      ?auto_3846 - SURFACE
      ?auto_3857 - PLACE
      ?auto_3851 - HOIST
      ?auto_3847 - SURFACE
      ?auto_3856 - PLACE
      ?auto_3848 - HOIST
      ?auto_3852 - SURFACE
      ?auto_3862 - PLACE
      ?auto_3854 - HOIST
      ?auto_3855 - SURFACE
      ?auto_3858 - PLACE
      ?auto_3861 - HOIST
      ?auto_3850 - SURFACE
      ?auto_3849 - SURFACE
      ?auto_3859 - PLACE
      ?auto_3860 - HOIST
      ?auto_3853 - SURFACE
      ?auto_3841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3843 ?auto_3842 ) ( IS-CRATE ?auto_3840 ) ( not ( = ?auto_3844 ?auto_3842 ) ) ( HOIST-AT ?auto_3845 ?auto_3844 ) ( AVAILABLE ?auto_3845 ) ( SURFACE-AT ?auto_3840 ?auto_3844 ) ( ON ?auto_3840 ?auto_3846 ) ( CLEAR ?auto_3840 ) ( not ( = ?auto_3839 ?auto_3840 ) ) ( not ( = ?auto_3839 ?auto_3846 ) ) ( not ( = ?auto_3840 ?auto_3846 ) ) ( not ( = ?auto_3843 ?auto_3845 ) ) ( IS-CRATE ?auto_3839 ) ( not ( = ?auto_3857 ?auto_3842 ) ) ( HOIST-AT ?auto_3851 ?auto_3857 ) ( AVAILABLE ?auto_3851 ) ( SURFACE-AT ?auto_3839 ?auto_3857 ) ( ON ?auto_3839 ?auto_3847 ) ( CLEAR ?auto_3839 ) ( not ( = ?auto_3838 ?auto_3839 ) ) ( not ( = ?auto_3838 ?auto_3847 ) ) ( not ( = ?auto_3839 ?auto_3847 ) ) ( not ( = ?auto_3843 ?auto_3851 ) ) ( IS-CRATE ?auto_3838 ) ( not ( = ?auto_3856 ?auto_3842 ) ) ( HOIST-AT ?auto_3848 ?auto_3856 ) ( SURFACE-AT ?auto_3838 ?auto_3856 ) ( ON ?auto_3838 ?auto_3852 ) ( CLEAR ?auto_3838 ) ( not ( = ?auto_3837 ?auto_3838 ) ) ( not ( = ?auto_3837 ?auto_3852 ) ) ( not ( = ?auto_3838 ?auto_3852 ) ) ( not ( = ?auto_3843 ?auto_3848 ) ) ( IS-CRATE ?auto_3837 ) ( not ( = ?auto_3862 ?auto_3842 ) ) ( HOIST-AT ?auto_3854 ?auto_3862 ) ( AVAILABLE ?auto_3854 ) ( SURFACE-AT ?auto_3837 ?auto_3862 ) ( ON ?auto_3837 ?auto_3855 ) ( CLEAR ?auto_3837 ) ( not ( = ?auto_3836 ?auto_3837 ) ) ( not ( = ?auto_3836 ?auto_3855 ) ) ( not ( = ?auto_3837 ?auto_3855 ) ) ( not ( = ?auto_3843 ?auto_3854 ) ) ( IS-CRATE ?auto_3836 ) ( not ( = ?auto_3858 ?auto_3842 ) ) ( HOIST-AT ?auto_3861 ?auto_3858 ) ( AVAILABLE ?auto_3861 ) ( SURFACE-AT ?auto_3836 ?auto_3858 ) ( ON ?auto_3836 ?auto_3850 ) ( CLEAR ?auto_3836 ) ( not ( = ?auto_3835 ?auto_3836 ) ) ( not ( = ?auto_3835 ?auto_3850 ) ) ( not ( = ?auto_3836 ?auto_3850 ) ) ( not ( = ?auto_3843 ?auto_3861 ) ) ( IS-CRATE ?auto_3835 ) ( AVAILABLE ?auto_3848 ) ( SURFACE-AT ?auto_3835 ?auto_3856 ) ( ON ?auto_3835 ?auto_3849 ) ( CLEAR ?auto_3835 ) ( not ( = ?auto_3834 ?auto_3835 ) ) ( not ( = ?auto_3834 ?auto_3849 ) ) ( not ( = ?auto_3835 ?auto_3849 ) ) ( SURFACE-AT ?auto_3833 ?auto_3842 ) ( CLEAR ?auto_3833 ) ( IS-CRATE ?auto_3834 ) ( AVAILABLE ?auto_3843 ) ( not ( = ?auto_3859 ?auto_3842 ) ) ( HOIST-AT ?auto_3860 ?auto_3859 ) ( AVAILABLE ?auto_3860 ) ( SURFACE-AT ?auto_3834 ?auto_3859 ) ( ON ?auto_3834 ?auto_3853 ) ( CLEAR ?auto_3834 ) ( TRUCK-AT ?auto_3841 ?auto_3842 ) ( not ( = ?auto_3833 ?auto_3834 ) ) ( not ( = ?auto_3833 ?auto_3853 ) ) ( not ( = ?auto_3834 ?auto_3853 ) ) ( not ( = ?auto_3843 ?auto_3860 ) ) ( not ( = ?auto_3833 ?auto_3835 ) ) ( not ( = ?auto_3833 ?auto_3849 ) ) ( not ( = ?auto_3835 ?auto_3853 ) ) ( not ( = ?auto_3856 ?auto_3859 ) ) ( not ( = ?auto_3848 ?auto_3860 ) ) ( not ( = ?auto_3849 ?auto_3853 ) ) ( not ( = ?auto_3833 ?auto_3836 ) ) ( not ( = ?auto_3833 ?auto_3850 ) ) ( not ( = ?auto_3834 ?auto_3836 ) ) ( not ( = ?auto_3834 ?auto_3850 ) ) ( not ( = ?auto_3836 ?auto_3849 ) ) ( not ( = ?auto_3836 ?auto_3853 ) ) ( not ( = ?auto_3858 ?auto_3856 ) ) ( not ( = ?auto_3858 ?auto_3859 ) ) ( not ( = ?auto_3861 ?auto_3848 ) ) ( not ( = ?auto_3861 ?auto_3860 ) ) ( not ( = ?auto_3850 ?auto_3849 ) ) ( not ( = ?auto_3850 ?auto_3853 ) ) ( not ( = ?auto_3833 ?auto_3837 ) ) ( not ( = ?auto_3833 ?auto_3855 ) ) ( not ( = ?auto_3834 ?auto_3837 ) ) ( not ( = ?auto_3834 ?auto_3855 ) ) ( not ( = ?auto_3835 ?auto_3837 ) ) ( not ( = ?auto_3835 ?auto_3855 ) ) ( not ( = ?auto_3837 ?auto_3850 ) ) ( not ( = ?auto_3837 ?auto_3849 ) ) ( not ( = ?auto_3837 ?auto_3853 ) ) ( not ( = ?auto_3862 ?auto_3858 ) ) ( not ( = ?auto_3862 ?auto_3856 ) ) ( not ( = ?auto_3862 ?auto_3859 ) ) ( not ( = ?auto_3854 ?auto_3861 ) ) ( not ( = ?auto_3854 ?auto_3848 ) ) ( not ( = ?auto_3854 ?auto_3860 ) ) ( not ( = ?auto_3855 ?auto_3850 ) ) ( not ( = ?auto_3855 ?auto_3849 ) ) ( not ( = ?auto_3855 ?auto_3853 ) ) ( not ( = ?auto_3833 ?auto_3838 ) ) ( not ( = ?auto_3833 ?auto_3852 ) ) ( not ( = ?auto_3834 ?auto_3838 ) ) ( not ( = ?auto_3834 ?auto_3852 ) ) ( not ( = ?auto_3835 ?auto_3838 ) ) ( not ( = ?auto_3835 ?auto_3852 ) ) ( not ( = ?auto_3836 ?auto_3838 ) ) ( not ( = ?auto_3836 ?auto_3852 ) ) ( not ( = ?auto_3838 ?auto_3855 ) ) ( not ( = ?auto_3838 ?auto_3850 ) ) ( not ( = ?auto_3838 ?auto_3849 ) ) ( not ( = ?auto_3838 ?auto_3853 ) ) ( not ( = ?auto_3852 ?auto_3855 ) ) ( not ( = ?auto_3852 ?auto_3850 ) ) ( not ( = ?auto_3852 ?auto_3849 ) ) ( not ( = ?auto_3852 ?auto_3853 ) ) ( not ( = ?auto_3833 ?auto_3839 ) ) ( not ( = ?auto_3833 ?auto_3847 ) ) ( not ( = ?auto_3834 ?auto_3839 ) ) ( not ( = ?auto_3834 ?auto_3847 ) ) ( not ( = ?auto_3835 ?auto_3839 ) ) ( not ( = ?auto_3835 ?auto_3847 ) ) ( not ( = ?auto_3836 ?auto_3839 ) ) ( not ( = ?auto_3836 ?auto_3847 ) ) ( not ( = ?auto_3837 ?auto_3839 ) ) ( not ( = ?auto_3837 ?auto_3847 ) ) ( not ( = ?auto_3839 ?auto_3852 ) ) ( not ( = ?auto_3839 ?auto_3855 ) ) ( not ( = ?auto_3839 ?auto_3850 ) ) ( not ( = ?auto_3839 ?auto_3849 ) ) ( not ( = ?auto_3839 ?auto_3853 ) ) ( not ( = ?auto_3857 ?auto_3856 ) ) ( not ( = ?auto_3857 ?auto_3862 ) ) ( not ( = ?auto_3857 ?auto_3858 ) ) ( not ( = ?auto_3857 ?auto_3859 ) ) ( not ( = ?auto_3851 ?auto_3848 ) ) ( not ( = ?auto_3851 ?auto_3854 ) ) ( not ( = ?auto_3851 ?auto_3861 ) ) ( not ( = ?auto_3851 ?auto_3860 ) ) ( not ( = ?auto_3847 ?auto_3852 ) ) ( not ( = ?auto_3847 ?auto_3855 ) ) ( not ( = ?auto_3847 ?auto_3850 ) ) ( not ( = ?auto_3847 ?auto_3849 ) ) ( not ( = ?auto_3847 ?auto_3853 ) ) ( not ( = ?auto_3833 ?auto_3840 ) ) ( not ( = ?auto_3833 ?auto_3846 ) ) ( not ( = ?auto_3834 ?auto_3840 ) ) ( not ( = ?auto_3834 ?auto_3846 ) ) ( not ( = ?auto_3835 ?auto_3840 ) ) ( not ( = ?auto_3835 ?auto_3846 ) ) ( not ( = ?auto_3836 ?auto_3840 ) ) ( not ( = ?auto_3836 ?auto_3846 ) ) ( not ( = ?auto_3837 ?auto_3840 ) ) ( not ( = ?auto_3837 ?auto_3846 ) ) ( not ( = ?auto_3838 ?auto_3840 ) ) ( not ( = ?auto_3838 ?auto_3846 ) ) ( not ( = ?auto_3840 ?auto_3847 ) ) ( not ( = ?auto_3840 ?auto_3852 ) ) ( not ( = ?auto_3840 ?auto_3855 ) ) ( not ( = ?auto_3840 ?auto_3850 ) ) ( not ( = ?auto_3840 ?auto_3849 ) ) ( not ( = ?auto_3840 ?auto_3853 ) ) ( not ( = ?auto_3844 ?auto_3857 ) ) ( not ( = ?auto_3844 ?auto_3856 ) ) ( not ( = ?auto_3844 ?auto_3862 ) ) ( not ( = ?auto_3844 ?auto_3858 ) ) ( not ( = ?auto_3844 ?auto_3859 ) ) ( not ( = ?auto_3845 ?auto_3851 ) ) ( not ( = ?auto_3845 ?auto_3848 ) ) ( not ( = ?auto_3845 ?auto_3854 ) ) ( not ( = ?auto_3845 ?auto_3861 ) ) ( not ( = ?auto_3845 ?auto_3860 ) ) ( not ( = ?auto_3846 ?auto_3847 ) ) ( not ( = ?auto_3846 ?auto_3852 ) ) ( not ( = ?auto_3846 ?auto_3855 ) ) ( not ( = ?auto_3846 ?auto_3850 ) ) ( not ( = ?auto_3846 ?auto_3849 ) ) ( not ( = ?auto_3846 ?auto_3853 ) ) )
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
      ?auto_3911 - PLACE
      ?auto_3913 - HOIST
      ?auto_3906 - SURFACE
      ?auto_3902 - PLACE
      ?auto_3903 - HOIST
      ?auto_3907 - SURFACE
      ?auto_3904 - PLACE
      ?auto_3915 - HOIST
      ?auto_3905 - SURFACE
      ?auto_3912 - PLACE
      ?auto_3909 - HOIST
      ?auto_3898 - SURFACE
      ?auto_3900 - PLACE
      ?auto_3910 - HOIST
      ?auto_3914 - SURFACE
      ?auto_3897 - SURFACE
      ?auto_3908 - PLACE
      ?auto_3899 - HOIST
      ?auto_3901 - SURFACE
      ?auto_3894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3896 ?auto_3895 ) ( IS-CRATE ?auto_3890 ) ( not ( = ?auto_3891 ?auto_3895 ) ) ( HOIST-AT ?auto_3892 ?auto_3891 ) ( AVAILABLE ?auto_3892 ) ( SURFACE-AT ?auto_3890 ?auto_3891 ) ( ON ?auto_3890 ?auto_3893 ) ( CLEAR ?auto_3890 ) ( not ( = ?auto_3889 ?auto_3890 ) ) ( not ( = ?auto_3889 ?auto_3893 ) ) ( not ( = ?auto_3890 ?auto_3893 ) ) ( not ( = ?auto_3896 ?auto_3892 ) ) ( IS-CRATE ?auto_3889 ) ( not ( = ?auto_3911 ?auto_3895 ) ) ( HOIST-AT ?auto_3913 ?auto_3911 ) ( AVAILABLE ?auto_3913 ) ( SURFACE-AT ?auto_3889 ?auto_3911 ) ( ON ?auto_3889 ?auto_3906 ) ( CLEAR ?auto_3889 ) ( not ( = ?auto_3888 ?auto_3889 ) ) ( not ( = ?auto_3888 ?auto_3906 ) ) ( not ( = ?auto_3889 ?auto_3906 ) ) ( not ( = ?auto_3896 ?auto_3913 ) ) ( IS-CRATE ?auto_3888 ) ( not ( = ?auto_3902 ?auto_3895 ) ) ( HOIST-AT ?auto_3903 ?auto_3902 ) ( AVAILABLE ?auto_3903 ) ( SURFACE-AT ?auto_3888 ?auto_3902 ) ( ON ?auto_3888 ?auto_3907 ) ( CLEAR ?auto_3888 ) ( not ( = ?auto_3887 ?auto_3888 ) ) ( not ( = ?auto_3887 ?auto_3907 ) ) ( not ( = ?auto_3888 ?auto_3907 ) ) ( not ( = ?auto_3896 ?auto_3903 ) ) ( IS-CRATE ?auto_3887 ) ( not ( = ?auto_3904 ?auto_3895 ) ) ( HOIST-AT ?auto_3915 ?auto_3904 ) ( SURFACE-AT ?auto_3887 ?auto_3904 ) ( ON ?auto_3887 ?auto_3905 ) ( CLEAR ?auto_3887 ) ( not ( = ?auto_3886 ?auto_3887 ) ) ( not ( = ?auto_3886 ?auto_3905 ) ) ( not ( = ?auto_3887 ?auto_3905 ) ) ( not ( = ?auto_3896 ?auto_3915 ) ) ( IS-CRATE ?auto_3886 ) ( not ( = ?auto_3912 ?auto_3895 ) ) ( HOIST-AT ?auto_3909 ?auto_3912 ) ( AVAILABLE ?auto_3909 ) ( SURFACE-AT ?auto_3886 ?auto_3912 ) ( ON ?auto_3886 ?auto_3898 ) ( CLEAR ?auto_3886 ) ( not ( = ?auto_3885 ?auto_3886 ) ) ( not ( = ?auto_3885 ?auto_3898 ) ) ( not ( = ?auto_3886 ?auto_3898 ) ) ( not ( = ?auto_3896 ?auto_3909 ) ) ( IS-CRATE ?auto_3885 ) ( not ( = ?auto_3900 ?auto_3895 ) ) ( HOIST-AT ?auto_3910 ?auto_3900 ) ( AVAILABLE ?auto_3910 ) ( SURFACE-AT ?auto_3885 ?auto_3900 ) ( ON ?auto_3885 ?auto_3914 ) ( CLEAR ?auto_3885 ) ( not ( = ?auto_3884 ?auto_3885 ) ) ( not ( = ?auto_3884 ?auto_3914 ) ) ( not ( = ?auto_3885 ?auto_3914 ) ) ( not ( = ?auto_3896 ?auto_3910 ) ) ( IS-CRATE ?auto_3884 ) ( AVAILABLE ?auto_3915 ) ( SURFACE-AT ?auto_3884 ?auto_3904 ) ( ON ?auto_3884 ?auto_3897 ) ( CLEAR ?auto_3884 ) ( not ( = ?auto_3883 ?auto_3884 ) ) ( not ( = ?auto_3883 ?auto_3897 ) ) ( not ( = ?auto_3884 ?auto_3897 ) ) ( SURFACE-AT ?auto_3882 ?auto_3895 ) ( CLEAR ?auto_3882 ) ( IS-CRATE ?auto_3883 ) ( AVAILABLE ?auto_3896 ) ( not ( = ?auto_3908 ?auto_3895 ) ) ( HOIST-AT ?auto_3899 ?auto_3908 ) ( AVAILABLE ?auto_3899 ) ( SURFACE-AT ?auto_3883 ?auto_3908 ) ( ON ?auto_3883 ?auto_3901 ) ( CLEAR ?auto_3883 ) ( TRUCK-AT ?auto_3894 ?auto_3895 ) ( not ( = ?auto_3882 ?auto_3883 ) ) ( not ( = ?auto_3882 ?auto_3901 ) ) ( not ( = ?auto_3883 ?auto_3901 ) ) ( not ( = ?auto_3896 ?auto_3899 ) ) ( not ( = ?auto_3882 ?auto_3884 ) ) ( not ( = ?auto_3882 ?auto_3897 ) ) ( not ( = ?auto_3884 ?auto_3901 ) ) ( not ( = ?auto_3904 ?auto_3908 ) ) ( not ( = ?auto_3915 ?auto_3899 ) ) ( not ( = ?auto_3897 ?auto_3901 ) ) ( not ( = ?auto_3882 ?auto_3885 ) ) ( not ( = ?auto_3882 ?auto_3914 ) ) ( not ( = ?auto_3883 ?auto_3885 ) ) ( not ( = ?auto_3883 ?auto_3914 ) ) ( not ( = ?auto_3885 ?auto_3897 ) ) ( not ( = ?auto_3885 ?auto_3901 ) ) ( not ( = ?auto_3900 ?auto_3904 ) ) ( not ( = ?auto_3900 ?auto_3908 ) ) ( not ( = ?auto_3910 ?auto_3915 ) ) ( not ( = ?auto_3910 ?auto_3899 ) ) ( not ( = ?auto_3914 ?auto_3897 ) ) ( not ( = ?auto_3914 ?auto_3901 ) ) ( not ( = ?auto_3882 ?auto_3886 ) ) ( not ( = ?auto_3882 ?auto_3898 ) ) ( not ( = ?auto_3883 ?auto_3886 ) ) ( not ( = ?auto_3883 ?auto_3898 ) ) ( not ( = ?auto_3884 ?auto_3886 ) ) ( not ( = ?auto_3884 ?auto_3898 ) ) ( not ( = ?auto_3886 ?auto_3914 ) ) ( not ( = ?auto_3886 ?auto_3897 ) ) ( not ( = ?auto_3886 ?auto_3901 ) ) ( not ( = ?auto_3912 ?auto_3900 ) ) ( not ( = ?auto_3912 ?auto_3904 ) ) ( not ( = ?auto_3912 ?auto_3908 ) ) ( not ( = ?auto_3909 ?auto_3910 ) ) ( not ( = ?auto_3909 ?auto_3915 ) ) ( not ( = ?auto_3909 ?auto_3899 ) ) ( not ( = ?auto_3898 ?auto_3914 ) ) ( not ( = ?auto_3898 ?auto_3897 ) ) ( not ( = ?auto_3898 ?auto_3901 ) ) ( not ( = ?auto_3882 ?auto_3887 ) ) ( not ( = ?auto_3882 ?auto_3905 ) ) ( not ( = ?auto_3883 ?auto_3887 ) ) ( not ( = ?auto_3883 ?auto_3905 ) ) ( not ( = ?auto_3884 ?auto_3887 ) ) ( not ( = ?auto_3884 ?auto_3905 ) ) ( not ( = ?auto_3885 ?auto_3887 ) ) ( not ( = ?auto_3885 ?auto_3905 ) ) ( not ( = ?auto_3887 ?auto_3898 ) ) ( not ( = ?auto_3887 ?auto_3914 ) ) ( not ( = ?auto_3887 ?auto_3897 ) ) ( not ( = ?auto_3887 ?auto_3901 ) ) ( not ( = ?auto_3905 ?auto_3898 ) ) ( not ( = ?auto_3905 ?auto_3914 ) ) ( not ( = ?auto_3905 ?auto_3897 ) ) ( not ( = ?auto_3905 ?auto_3901 ) ) ( not ( = ?auto_3882 ?auto_3888 ) ) ( not ( = ?auto_3882 ?auto_3907 ) ) ( not ( = ?auto_3883 ?auto_3888 ) ) ( not ( = ?auto_3883 ?auto_3907 ) ) ( not ( = ?auto_3884 ?auto_3888 ) ) ( not ( = ?auto_3884 ?auto_3907 ) ) ( not ( = ?auto_3885 ?auto_3888 ) ) ( not ( = ?auto_3885 ?auto_3907 ) ) ( not ( = ?auto_3886 ?auto_3888 ) ) ( not ( = ?auto_3886 ?auto_3907 ) ) ( not ( = ?auto_3888 ?auto_3905 ) ) ( not ( = ?auto_3888 ?auto_3898 ) ) ( not ( = ?auto_3888 ?auto_3914 ) ) ( not ( = ?auto_3888 ?auto_3897 ) ) ( not ( = ?auto_3888 ?auto_3901 ) ) ( not ( = ?auto_3902 ?auto_3904 ) ) ( not ( = ?auto_3902 ?auto_3912 ) ) ( not ( = ?auto_3902 ?auto_3900 ) ) ( not ( = ?auto_3902 ?auto_3908 ) ) ( not ( = ?auto_3903 ?auto_3915 ) ) ( not ( = ?auto_3903 ?auto_3909 ) ) ( not ( = ?auto_3903 ?auto_3910 ) ) ( not ( = ?auto_3903 ?auto_3899 ) ) ( not ( = ?auto_3907 ?auto_3905 ) ) ( not ( = ?auto_3907 ?auto_3898 ) ) ( not ( = ?auto_3907 ?auto_3914 ) ) ( not ( = ?auto_3907 ?auto_3897 ) ) ( not ( = ?auto_3907 ?auto_3901 ) ) ( not ( = ?auto_3882 ?auto_3889 ) ) ( not ( = ?auto_3882 ?auto_3906 ) ) ( not ( = ?auto_3883 ?auto_3889 ) ) ( not ( = ?auto_3883 ?auto_3906 ) ) ( not ( = ?auto_3884 ?auto_3889 ) ) ( not ( = ?auto_3884 ?auto_3906 ) ) ( not ( = ?auto_3885 ?auto_3889 ) ) ( not ( = ?auto_3885 ?auto_3906 ) ) ( not ( = ?auto_3886 ?auto_3889 ) ) ( not ( = ?auto_3886 ?auto_3906 ) ) ( not ( = ?auto_3887 ?auto_3889 ) ) ( not ( = ?auto_3887 ?auto_3906 ) ) ( not ( = ?auto_3889 ?auto_3907 ) ) ( not ( = ?auto_3889 ?auto_3905 ) ) ( not ( = ?auto_3889 ?auto_3898 ) ) ( not ( = ?auto_3889 ?auto_3914 ) ) ( not ( = ?auto_3889 ?auto_3897 ) ) ( not ( = ?auto_3889 ?auto_3901 ) ) ( not ( = ?auto_3911 ?auto_3902 ) ) ( not ( = ?auto_3911 ?auto_3904 ) ) ( not ( = ?auto_3911 ?auto_3912 ) ) ( not ( = ?auto_3911 ?auto_3900 ) ) ( not ( = ?auto_3911 ?auto_3908 ) ) ( not ( = ?auto_3913 ?auto_3903 ) ) ( not ( = ?auto_3913 ?auto_3915 ) ) ( not ( = ?auto_3913 ?auto_3909 ) ) ( not ( = ?auto_3913 ?auto_3910 ) ) ( not ( = ?auto_3913 ?auto_3899 ) ) ( not ( = ?auto_3906 ?auto_3907 ) ) ( not ( = ?auto_3906 ?auto_3905 ) ) ( not ( = ?auto_3906 ?auto_3898 ) ) ( not ( = ?auto_3906 ?auto_3914 ) ) ( not ( = ?auto_3906 ?auto_3897 ) ) ( not ( = ?auto_3906 ?auto_3901 ) ) ( not ( = ?auto_3882 ?auto_3890 ) ) ( not ( = ?auto_3882 ?auto_3893 ) ) ( not ( = ?auto_3883 ?auto_3890 ) ) ( not ( = ?auto_3883 ?auto_3893 ) ) ( not ( = ?auto_3884 ?auto_3890 ) ) ( not ( = ?auto_3884 ?auto_3893 ) ) ( not ( = ?auto_3885 ?auto_3890 ) ) ( not ( = ?auto_3885 ?auto_3893 ) ) ( not ( = ?auto_3886 ?auto_3890 ) ) ( not ( = ?auto_3886 ?auto_3893 ) ) ( not ( = ?auto_3887 ?auto_3890 ) ) ( not ( = ?auto_3887 ?auto_3893 ) ) ( not ( = ?auto_3888 ?auto_3890 ) ) ( not ( = ?auto_3888 ?auto_3893 ) ) ( not ( = ?auto_3890 ?auto_3906 ) ) ( not ( = ?auto_3890 ?auto_3907 ) ) ( not ( = ?auto_3890 ?auto_3905 ) ) ( not ( = ?auto_3890 ?auto_3898 ) ) ( not ( = ?auto_3890 ?auto_3914 ) ) ( not ( = ?auto_3890 ?auto_3897 ) ) ( not ( = ?auto_3890 ?auto_3901 ) ) ( not ( = ?auto_3891 ?auto_3911 ) ) ( not ( = ?auto_3891 ?auto_3902 ) ) ( not ( = ?auto_3891 ?auto_3904 ) ) ( not ( = ?auto_3891 ?auto_3912 ) ) ( not ( = ?auto_3891 ?auto_3900 ) ) ( not ( = ?auto_3891 ?auto_3908 ) ) ( not ( = ?auto_3892 ?auto_3913 ) ) ( not ( = ?auto_3892 ?auto_3903 ) ) ( not ( = ?auto_3892 ?auto_3915 ) ) ( not ( = ?auto_3892 ?auto_3909 ) ) ( not ( = ?auto_3892 ?auto_3910 ) ) ( not ( = ?auto_3892 ?auto_3899 ) ) ( not ( = ?auto_3893 ?auto_3906 ) ) ( not ( = ?auto_3893 ?auto_3907 ) ) ( not ( = ?auto_3893 ?auto_3905 ) ) ( not ( = ?auto_3893 ?auto_3898 ) ) ( not ( = ?auto_3893 ?auto_3914 ) ) ( not ( = ?auto_3893 ?auto_3897 ) ) ( not ( = ?auto_3893 ?auto_3901 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_3882 ?auto_3883 ?auto_3884 ?auto_3885 ?auto_3886 ?auto_3887 ?auto_3888 ?auto_3889 )
      ( MAKE-1CRATE ?auto_3889 ?auto_3890 )
      ( MAKE-8CRATE-VERIFY ?auto_3882 ?auto_3883 ?auto_3884 ?auto_3885 ?auto_3886 ?auto_3887 ?auto_3888 ?auto_3889 ?auto_3890 ) )
  )

)
