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
      ?auto_3616 - SURFACE
      ?auto_3617 - SURFACE
    )
    :vars
    (
      ?auto_3618 - HOIST
      ?auto_3619 - PLACE
      ?auto_3621 - PLACE
      ?auto_3622 - HOIST
      ?auto_3623 - SURFACE
      ?auto_3620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3618 ?auto_3619 ) ( SURFACE-AT ?auto_3616 ?auto_3619 ) ( CLEAR ?auto_3616 ) ( IS-CRATE ?auto_3617 ) ( AVAILABLE ?auto_3618 ) ( not ( = ?auto_3621 ?auto_3619 ) ) ( HOIST-AT ?auto_3622 ?auto_3621 ) ( AVAILABLE ?auto_3622 ) ( SURFACE-AT ?auto_3617 ?auto_3621 ) ( ON ?auto_3617 ?auto_3623 ) ( CLEAR ?auto_3617 ) ( TRUCK-AT ?auto_3620 ?auto_3619 ) ( not ( = ?auto_3616 ?auto_3617 ) ) ( not ( = ?auto_3616 ?auto_3623 ) ) ( not ( = ?auto_3617 ?auto_3623 ) ) ( not ( = ?auto_3618 ?auto_3622 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3620 ?auto_3619 ?auto_3621 )
      ( !LIFT ?auto_3622 ?auto_3617 ?auto_3623 ?auto_3621 )
      ( !LOAD ?auto_3622 ?auto_3617 ?auto_3620 ?auto_3621 )
      ( !DRIVE ?auto_3620 ?auto_3621 ?auto_3619 )
      ( !UNLOAD ?auto_3618 ?auto_3617 ?auto_3620 ?auto_3619 )
      ( !DROP ?auto_3618 ?auto_3617 ?auto_3616 ?auto_3619 )
      ( MAKE-1CRATE-VERIFY ?auto_3616 ?auto_3617 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3637 - SURFACE
      ?auto_3638 - SURFACE
      ?auto_3639 - SURFACE
    )
    :vars
    (
      ?auto_3645 - HOIST
      ?auto_3641 - PLACE
      ?auto_3642 - PLACE
      ?auto_3643 - HOIST
      ?auto_3644 - SURFACE
      ?auto_3647 - PLACE
      ?auto_3648 - HOIST
      ?auto_3646 - SURFACE
      ?auto_3640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3645 ?auto_3641 ) ( IS-CRATE ?auto_3639 ) ( not ( = ?auto_3642 ?auto_3641 ) ) ( HOIST-AT ?auto_3643 ?auto_3642 ) ( AVAILABLE ?auto_3643 ) ( SURFACE-AT ?auto_3639 ?auto_3642 ) ( ON ?auto_3639 ?auto_3644 ) ( CLEAR ?auto_3639 ) ( not ( = ?auto_3638 ?auto_3639 ) ) ( not ( = ?auto_3638 ?auto_3644 ) ) ( not ( = ?auto_3639 ?auto_3644 ) ) ( not ( = ?auto_3645 ?auto_3643 ) ) ( SURFACE-AT ?auto_3637 ?auto_3641 ) ( CLEAR ?auto_3637 ) ( IS-CRATE ?auto_3638 ) ( AVAILABLE ?auto_3645 ) ( not ( = ?auto_3647 ?auto_3641 ) ) ( HOIST-AT ?auto_3648 ?auto_3647 ) ( AVAILABLE ?auto_3648 ) ( SURFACE-AT ?auto_3638 ?auto_3647 ) ( ON ?auto_3638 ?auto_3646 ) ( CLEAR ?auto_3638 ) ( TRUCK-AT ?auto_3640 ?auto_3641 ) ( not ( = ?auto_3637 ?auto_3638 ) ) ( not ( = ?auto_3637 ?auto_3646 ) ) ( not ( = ?auto_3638 ?auto_3646 ) ) ( not ( = ?auto_3645 ?auto_3648 ) ) ( not ( = ?auto_3637 ?auto_3639 ) ) ( not ( = ?auto_3637 ?auto_3644 ) ) ( not ( = ?auto_3639 ?auto_3646 ) ) ( not ( = ?auto_3642 ?auto_3647 ) ) ( not ( = ?auto_3643 ?auto_3648 ) ) ( not ( = ?auto_3644 ?auto_3646 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3637 ?auto_3638 )
      ( MAKE-1CRATE ?auto_3638 ?auto_3639 )
      ( MAKE-2CRATE-VERIFY ?auto_3637 ?auto_3638 ?auto_3639 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3663 - SURFACE
      ?auto_3664 - SURFACE
      ?auto_3665 - SURFACE
      ?auto_3666 - SURFACE
    )
    :vars
    (
      ?auto_3669 - HOIST
      ?auto_3672 - PLACE
      ?auto_3668 - PLACE
      ?auto_3667 - HOIST
      ?auto_3670 - SURFACE
      ?auto_3673 - PLACE
      ?auto_3677 - HOIST
      ?auto_3678 - SURFACE
      ?auto_3676 - PLACE
      ?auto_3675 - HOIST
      ?auto_3674 - SURFACE
      ?auto_3671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3669 ?auto_3672 ) ( IS-CRATE ?auto_3666 ) ( not ( = ?auto_3668 ?auto_3672 ) ) ( HOIST-AT ?auto_3667 ?auto_3668 ) ( AVAILABLE ?auto_3667 ) ( SURFACE-AT ?auto_3666 ?auto_3668 ) ( ON ?auto_3666 ?auto_3670 ) ( CLEAR ?auto_3666 ) ( not ( = ?auto_3665 ?auto_3666 ) ) ( not ( = ?auto_3665 ?auto_3670 ) ) ( not ( = ?auto_3666 ?auto_3670 ) ) ( not ( = ?auto_3669 ?auto_3667 ) ) ( IS-CRATE ?auto_3665 ) ( not ( = ?auto_3673 ?auto_3672 ) ) ( HOIST-AT ?auto_3677 ?auto_3673 ) ( AVAILABLE ?auto_3677 ) ( SURFACE-AT ?auto_3665 ?auto_3673 ) ( ON ?auto_3665 ?auto_3678 ) ( CLEAR ?auto_3665 ) ( not ( = ?auto_3664 ?auto_3665 ) ) ( not ( = ?auto_3664 ?auto_3678 ) ) ( not ( = ?auto_3665 ?auto_3678 ) ) ( not ( = ?auto_3669 ?auto_3677 ) ) ( SURFACE-AT ?auto_3663 ?auto_3672 ) ( CLEAR ?auto_3663 ) ( IS-CRATE ?auto_3664 ) ( AVAILABLE ?auto_3669 ) ( not ( = ?auto_3676 ?auto_3672 ) ) ( HOIST-AT ?auto_3675 ?auto_3676 ) ( AVAILABLE ?auto_3675 ) ( SURFACE-AT ?auto_3664 ?auto_3676 ) ( ON ?auto_3664 ?auto_3674 ) ( CLEAR ?auto_3664 ) ( TRUCK-AT ?auto_3671 ?auto_3672 ) ( not ( = ?auto_3663 ?auto_3664 ) ) ( not ( = ?auto_3663 ?auto_3674 ) ) ( not ( = ?auto_3664 ?auto_3674 ) ) ( not ( = ?auto_3669 ?auto_3675 ) ) ( not ( = ?auto_3663 ?auto_3665 ) ) ( not ( = ?auto_3663 ?auto_3678 ) ) ( not ( = ?auto_3665 ?auto_3674 ) ) ( not ( = ?auto_3673 ?auto_3676 ) ) ( not ( = ?auto_3677 ?auto_3675 ) ) ( not ( = ?auto_3678 ?auto_3674 ) ) ( not ( = ?auto_3663 ?auto_3666 ) ) ( not ( = ?auto_3663 ?auto_3670 ) ) ( not ( = ?auto_3664 ?auto_3666 ) ) ( not ( = ?auto_3664 ?auto_3670 ) ) ( not ( = ?auto_3666 ?auto_3678 ) ) ( not ( = ?auto_3666 ?auto_3674 ) ) ( not ( = ?auto_3668 ?auto_3673 ) ) ( not ( = ?auto_3668 ?auto_3676 ) ) ( not ( = ?auto_3667 ?auto_3677 ) ) ( not ( = ?auto_3667 ?auto_3675 ) ) ( not ( = ?auto_3670 ?auto_3678 ) ) ( not ( = ?auto_3670 ?auto_3674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3663 ?auto_3664 ?auto_3665 )
      ( MAKE-1CRATE ?auto_3665 ?auto_3666 )
      ( MAKE-3CRATE-VERIFY ?auto_3663 ?auto_3664 ?auto_3665 ?auto_3666 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_3694 - SURFACE
      ?auto_3695 - SURFACE
      ?auto_3696 - SURFACE
      ?auto_3697 - SURFACE
      ?auto_3698 - SURFACE
    )
    :vars
    (
      ?auto_3703 - HOIST
      ?auto_3704 - PLACE
      ?auto_3701 - PLACE
      ?auto_3702 - HOIST
      ?auto_3700 - SURFACE
      ?auto_3709 - PLACE
      ?auto_3710 - HOIST
      ?auto_3708 - SURFACE
      ?auto_3711 - PLACE
      ?auto_3705 - HOIST
      ?auto_3706 - SURFACE
      ?auto_3707 - SURFACE
      ?auto_3699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3703 ?auto_3704 ) ( IS-CRATE ?auto_3698 ) ( not ( = ?auto_3701 ?auto_3704 ) ) ( HOIST-AT ?auto_3702 ?auto_3701 ) ( SURFACE-AT ?auto_3698 ?auto_3701 ) ( ON ?auto_3698 ?auto_3700 ) ( CLEAR ?auto_3698 ) ( not ( = ?auto_3697 ?auto_3698 ) ) ( not ( = ?auto_3697 ?auto_3700 ) ) ( not ( = ?auto_3698 ?auto_3700 ) ) ( not ( = ?auto_3703 ?auto_3702 ) ) ( IS-CRATE ?auto_3697 ) ( not ( = ?auto_3709 ?auto_3704 ) ) ( HOIST-AT ?auto_3710 ?auto_3709 ) ( AVAILABLE ?auto_3710 ) ( SURFACE-AT ?auto_3697 ?auto_3709 ) ( ON ?auto_3697 ?auto_3708 ) ( CLEAR ?auto_3697 ) ( not ( = ?auto_3696 ?auto_3697 ) ) ( not ( = ?auto_3696 ?auto_3708 ) ) ( not ( = ?auto_3697 ?auto_3708 ) ) ( not ( = ?auto_3703 ?auto_3710 ) ) ( IS-CRATE ?auto_3696 ) ( not ( = ?auto_3711 ?auto_3704 ) ) ( HOIST-AT ?auto_3705 ?auto_3711 ) ( AVAILABLE ?auto_3705 ) ( SURFACE-AT ?auto_3696 ?auto_3711 ) ( ON ?auto_3696 ?auto_3706 ) ( CLEAR ?auto_3696 ) ( not ( = ?auto_3695 ?auto_3696 ) ) ( not ( = ?auto_3695 ?auto_3706 ) ) ( not ( = ?auto_3696 ?auto_3706 ) ) ( not ( = ?auto_3703 ?auto_3705 ) ) ( SURFACE-AT ?auto_3694 ?auto_3704 ) ( CLEAR ?auto_3694 ) ( IS-CRATE ?auto_3695 ) ( AVAILABLE ?auto_3703 ) ( AVAILABLE ?auto_3702 ) ( SURFACE-AT ?auto_3695 ?auto_3701 ) ( ON ?auto_3695 ?auto_3707 ) ( CLEAR ?auto_3695 ) ( TRUCK-AT ?auto_3699 ?auto_3704 ) ( not ( = ?auto_3694 ?auto_3695 ) ) ( not ( = ?auto_3694 ?auto_3707 ) ) ( not ( = ?auto_3695 ?auto_3707 ) ) ( not ( = ?auto_3694 ?auto_3696 ) ) ( not ( = ?auto_3694 ?auto_3706 ) ) ( not ( = ?auto_3696 ?auto_3707 ) ) ( not ( = ?auto_3711 ?auto_3701 ) ) ( not ( = ?auto_3705 ?auto_3702 ) ) ( not ( = ?auto_3706 ?auto_3707 ) ) ( not ( = ?auto_3694 ?auto_3697 ) ) ( not ( = ?auto_3694 ?auto_3708 ) ) ( not ( = ?auto_3695 ?auto_3697 ) ) ( not ( = ?auto_3695 ?auto_3708 ) ) ( not ( = ?auto_3697 ?auto_3706 ) ) ( not ( = ?auto_3697 ?auto_3707 ) ) ( not ( = ?auto_3709 ?auto_3711 ) ) ( not ( = ?auto_3709 ?auto_3701 ) ) ( not ( = ?auto_3710 ?auto_3705 ) ) ( not ( = ?auto_3710 ?auto_3702 ) ) ( not ( = ?auto_3708 ?auto_3706 ) ) ( not ( = ?auto_3708 ?auto_3707 ) ) ( not ( = ?auto_3694 ?auto_3698 ) ) ( not ( = ?auto_3694 ?auto_3700 ) ) ( not ( = ?auto_3695 ?auto_3698 ) ) ( not ( = ?auto_3695 ?auto_3700 ) ) ( not ( = ?auto_3696 ?auto_3698 ) ) ( not ( = ?auto_3696 ?auto_3700 ) ) ( not ( = ?auto_3698 ?auto_3708 ) ) ( not ( = ?auto_3698 ?auto_3706 ) ) ( not ( = ?auto_3698 ?auto_3707 ) ) ( not ( = ?auto_3700 ?auto_3708 ) ) ( not ( = ?auto_3700 ?auto_3706 ) ) ( not ( = ?auto_3700 ?auto_3707 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3694 ?auto_3695 ?auto_3696 ?auto_3697 )
      ( MAKE-1CRATE ?auto_3697 ?auto_3698 )
      ( MAKE-4CRATE-VERIFY ?auto_3694 ?auto_3695 ?auto_3696 ?auto_3697 ?auto_3698 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_3728 - SURFACE
      ?auto_3729 - SURFACE
      ?auto_3730 - SURFACE
      ?auto_3731 - SURFACE
      ?auto_3732 - SURFACE
      ?auto_3733 - SURFACE
    )
    :vars
    (
      ?auto_3734 - HOIST
      ?auto_3735 - PLACE
      ?auto_3739 - PLACE
      ?auto_3738 - HOIST
      ?auto_3736 - SURFACE
      ?auto_3741 - PLACE
      ?auto_3749 - HOIST
      ?auto_3742 - SURFACE
      ?auto_3744 - PLACE
      ?auto_3747 - HOIST
      ?auto_3743 - SURFACE
      ?auto_3748 - PLACE
      ?auto_3745 - HOIST
      ?auto_3740 - SURFACE
      ?auto_3746 - SURFACE
      ?auto_3737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3734 ?auto_3735 ) ( IS-CRATE ?auto_3733 ) ( not ( = ?auto_3739 ?auto_3735 ) ) ( HOIST-AT ?auto_3738 ?auto_3739 ) ( AVAILABLE ?auto_3738 ) ( SURFACE-AT ?auto_3733 ?auto_3739 ) ( ON ?auto_3733 ?auto_3736 ) ( CLEAR ?auto_3733 ) ( not ( = ?auto_3732 ?auto_3733 ) ) ( not ( = ?auto_3732 ?auto_3736 ) ) ( not ( = ?auto_3733 ?auto_3736 ) ) ( not ( = ?auto_3734 ?auto_3738 ) ) ( IS-CRATE ?auto_3732 ) ( not ( = ?auto_3741 ?auto_3735 ) ) ( HOIST-AT ?auto_3749 ?auto_3741 ) ( SURFACE-AT ?auto_3732 ?auto_3741 ) ( ON ?auto_3732 ?auto_3742 ) ( CLEAR ?auto_3732 ) ( not ( = ?auto_3731 ?auto_3732 ) ) ( not ( = ?auto_3731 ?auto_3742 ) ) ( not ( = ?auto_3732 ?auto_3742 ) ) ( not ( = ?auto_3734 ?auto_3749 ) ) ( IS-CRATE ?auto_3731 ) ( not ( = ?auto_3744 ?auto_3735 ) ) ( HOIST-AT ?auto_3747 ?auto_3744 ) ( AVAILABLE ?auto_3747 ) ( SURFACE-AT ?auto_3731 ?auto_3744 ) ( ON ?auto_3731 ?auto_3743 ) ( CLEAR ?auto_3731 ) ( not ( = ?auto_3730 ?auto_3731 ) ) ( not ( = ?auto_3730 ?auto_3743 ) ) ( not ( = ?auto_3731 ?auto_3743 ) ) ( not ( = ?auto_3734 ?auto_3747 ) ) ( IS-CRATE ?auto_3730 ) ( not ( = ?auto_3748 ?auto_3735 ) ) ( HOIST-AT ?auto_3745 ?auto_3748 ) ( AVAILABLE ?auto_3745 ) ( SURFACE-AT ?auto_3730 ?auto_3748 ) ( ON ?auto_3730 ?auto_3740 ) ( CLEAR ?auto_3730 ) ( not ( = ?auto_3729 ?auto_3730 ) ) ( not ( = ?auto_3729 ?auto_3740 ) ) ( not ( = ?auto_3730 ?auto_3740 ) ) ( not ( = ?auto_3734 ?auto_3745 ) ) ( SURFACE-AT ?auto_3728 ?auto_3735 ) ( CLEAR ?auto_3728 ) ( IS-CRATE ?auto_3729 ) ( AVAILABLE ?auto_3734 ) ( AVAILABLE ?auto_3749 ) ( SURFACE-AT ?auto_3729 ?auto_3741 ) ( ON ?auto_3729 ?auto_3746 ) ( CLEAR ?auto_3729 ) ( TRUCK-AT ?auto_3737 ?auto_3735 ) ( not ( = ?auto_3728 ?auto_3729 ) ) ( not ( = ?auto_3728 ?auto_3746 ) ) ( not ( = ?auto_3729 ?auto_3746 ) ) ( not ( = ?auto_3728 ?auto_3730 ) ) ( not ( = ?auto_3728 ?auto_3740 ) ) ( not ( = ?auto_3730 ?auto_3746 ) ) ( not ( = ?auto_3748 ?auto_3741 ) ) ( not ( = ?auto_3745 ?auto_3749 ) ) ( not ( = ?auto_3740 ?auto_3746 ) ) ( not ( = ?auto_3728 ?auto_3731 ) ) ( not ( = ?auto_3728 ?auto_3743 ) ) ( not ( = ?auto_3729 ?auto_3731 ) ) ( not ( = ?auto_3729 ?auto_3743 ) ) ( not ( = ?auto_3731 ?auto_3740 ) ) ( not ( = ?auto_3731 ?auto_3746 ) ) ( not ( = ?auto_3744 ?auto_3748 ) ) ( not ( = ?auto_3744 ?auto_3741 ) ) ( not ( = ?auto_3747 ?auto_3745 ) ) ( not ( = ?auto_3747 ?auto_3749 ) ) ( not ( = ?auto_3743 ?auto_3740 ) ) ( not ( = ?auto_3743 ?auto_3746 ) ) ( not ( = ?auto_3728 ?auto_3732 ) ) ( not ( = ?auto_3728 ?auto_3742 ) ) ( not ( = ?auto_3729 ?auto_3732 ) ) ( not ( = ?auto_3729 ?auto_3742 ) ) ( not ( = ?auto_3730 ?auto_3732 ) ) ( not ( = ?auto_3730 ?auto_3742 ) ) ( not ( = ?auto_3732 ?auto_3743 ) ) ( not ( = ?auto_3732 ?auto_3740 ) ) ( not ( = ?auto_3732 ?auto_3746 ) ) ( not ( = ?auto_3742 ?auto_3743 ) ) ( not ( = ?auto_3742 ?auto_3740 ) ) ( not ( = ?auto_3742 ?auto_3746 ) ) ( not ( = ?auto_3728 ?auto_3733 ) ) ( not ( = ?auto_3728 ?auto_3736 ) ) ( not ( = ?auto_3729 ?auto_3733 ) ) ( not ( = ?auto_3729 ?auto_3736 ) ) ( not ( = ?auto_3730 ?auto_3733 ) ) ( not ( = ?auto_3730 ?auto_3736 ) ) ( not ( = ?auto_3731 ?auto_3733 ) ) ( not ( = ?auto_3731 ?auto_3736 ) ) ( not ( = ?auto_3733 ?auto_3742 ) ) ( not ( = ?auto_3733 ?auto_3743 ) ) ( not ( = ?auto_3733 ?auto_3740 ) ) ( not ( = ?auto_3733 ?auto_3746 ) ) ( not ( = ?auto_3739 ?auto_3741 ) ) ( not ( = ?auto_3739 ?auto_3744 ) ) ( not ( = ?auto_3739 ?auto_3748 ) ) ( not ( = ?auto_3738 ?auto_3749 ) ) ( not ( = ?auto_3738 ?auto_3747 ) ) ( not ( = ?auto_3738 ?auto_3745 ) ) ( not ( = ?auto_3736 ?auto_3742 ) ) ( not ( = ?auto_3736 ?auto_3743 ) ) ( not ( = ?auto_3736 ?auto_3740 ) ) ( not ( = ?auto_3736 ?auto_3746 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3728 ?auto_3729 ?auto_3730 ?auto_3731 ?auto_3732 )
      ( MAKE-1CRATE ?auto_3732 ?auto_3733 )
      ( MAKE-5CRATE-VERIFY ?auto_3728 ?auto_3729 ?auto_3730 ?auto_3731 ?auto_3732 ?auto_3733 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_3767 - SURFACE
      ?auto_3768 - SURFACE
      ?auto_3769 - SURFACE
      ?auto_3770 - SURFACE
      ?auto_3771 - SURFACE
      ?auto_3772 - SURFACE
      ?auto_3773 - SURFACE
    )
    :vars
    (
      ?auto_3777 - HOIST
      ?auto_3774 - PLACE
      ?auto_3775 - PLACE
      ?auto_3776 - HOIST
      ?auto_3778 - SURFACE
      ?auto_3787 - PLACE
      ?auto_3786 - HOIST
      ?auto_3789 - SURFACE
      ?auto_3790 - PLACE
      ?auto_3785 - HOIST
      ?auto_3782 - SURFACE
      ?auto_3780 - PLACE
      ?auto_3792 - HOIST
      ?auto_3783 - SURFACE
      ?auto_3791 - PLACE
      ?auto_3784 - HOIST
      ?auto_3788 - SURFACE
      ?auto_3781 - SURFACE
      ?auto_3779 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3777 ?auto_3774 ) ( IS-CRATE ?auto_3773 ) ( not ( = ?auto_3775 ?auto_3774 ) ) ( HOIST-AT ?auto_3776 ?auto_3775 ) ( AVAILABLE ?auto_3776 ) ( SURFACE-AT ?auto_3773 ?auto_3775 ) ( ON ?auto_3773 ?auto_3778 ) ( CLEAR ?auto_3773 ) ( not ( = ?auto_3772 ?auto_3773 ) ) ( not ( = ?auto_3772 ?auto_3778 ) ) ( not ( = ?auto_3773 ?auto_3778 ) ) ( not ( = ?auto_3777 ?auto_3776 ) ) ( IS-CRATE ?auto_3772 ) ( not ( = ?auto_3787 ?auto_3774 ) ) ( HOIST-AT ?auto_3786 ?auto_3787 ) ( AVAILABLE ?auto_3786 ) ( SURFACE-AT ?auto_3772 ?auto_3787 ) ( ON ?auto_3772 ?auto_3789 ) ( CLEAR ?auto_3772 ) ( not ( = ?auto_3771 ?auto_3772 ) ) ( not ( = ?auto_3771 ?auto_3789 ) ) ( not ( = ?auto_3772 ?auto_3789 ) ) ( not ( = ?auto_3777 ?auto_3786 ) ) ( IS-CRATE ?auto_3771 ) ( not ( = ?auto_3790 ?auto_3774 ) ) ( HOIST-AT ?auto_3785 ?auto_3790 ) ( SURFACE-AT ?auto_3771 ?auto_3790 ) ( ON ?auto_3771 ?auto_3782 ) ( CLEAR ?auto_3771 ) ( not ( = ?auto_3770 ?auto_3771 ) ) ( not ( = ?auto_3770 ?auto_3782 ) ) ( not ( = ?auto_3771 ?auto_3782 ) ) ( not ( = ?auto_3777 ?auto_3785 ) ) ( IS-CRATE ?auto_3770 ) ( not ( = ?auto_3780 ?auto_3774 ) ) ( HOIST-AT ?auto_3792 ?auto_3780 ) ( AVAILABLE ?auto_3792 ) ( SURFACE-AT ?auto_3770 ?auto_3780 ) ( ON ?auto_3770 ?auto_3783 ) ( CLEAR ?auto_3770 ) ( not ( = ?auto_3769 ?auto_3770 ) ) ( not ( = ?auto_3769 ?auto_3783 ) ) ( not ( = ?auto_3770 ?auto_3783 ) ) ( not ( = ?auto_3777 ?auto_3792 ) ) ( IS-CRATE ?auto_3769 ) ( not ( = ?auto_3791 ?auto_3774 ) ) ( HOIST-AT ?auto_3784 ?auto_3791 ) ( AVAILABLE ?auto_3784 ) ( SURFACE-AT ?auto_3769 ?auto_3791 ) ( ON ?auto_3769 ?auto_3788 ) ( CLEAR ?auto_3769 ) ( not ( = ?auto_3768 ?auto_3769 ) ) ( not ( = ?auto_3768 ?auto_3788 ) ) ( not ( = ?auto_3769 ?auto_3788 ) ) ( not ( = ?auto_3777 ?auto_3784 ) ) ( SURFACE-AT ?auto_3767 ?auto_3774 ) ( CLEAR ?auto_3767 ) ( IS-CRATE ?auto_3768 ) ( AVAILABLE ?auto_3777 ) ( AVAILABLE ?auto_3785 ) ( SURFACE-AT ?auto_3768 ?auto_3790 ) ( ON ?auto_3768 ?auto_3781 ) ( CLEAR ?auto_3768 ) ( TRUCK-AT ?auto_3779 ?auto_3774 ) ( not ( = ?auto_3767 ?auto_3768 ) ) ( not ( = ?auto_3767 ?auto_3781 ) ) ( not ( = ?auto_3768 ?auto_3781 ) ) ( not ( = ?auto_3767 ?auto_3769 ) ) ( not ( = ?auto_3767 ?auto_3788 ) ) ( not ( = ?auto_3769 ?auto_3781 ) ) ( not ( = ?auto_3791 ?auto_3790 ) ) ( not ( = ?auto_3784 ?auto_3785 ) ) ( not ( = ?auto_3788 ?auto_3781 ) ) ( not ( = ?auto_3767 ?auto_3770 ) ) ( not ( = ?auto_3767 ?auto_3783 ) ) ( not ( = ?auto_3768 ?auto_3770 ) ) ( not ( = ?auto_3768 ?auto_3783 ) ) ( not ( = ?auto_3770 ?auto_3788 ) ) ( not ( = ?auto_3770 ?auto_3781 ) ) ( not ( = ?auto_3780 ?auto_3791 ) ) ( not ( = ?auto_3780 ?auto_3790 ) ) ( not ( = ?auto_3792 ?auto_3784 ) ) ( not ( = ?auto_3792 ?auto_3785 ) ) ( not ( = ?auto_3783 ?auto_3788 ) ) ( not ( = ?auto_3783 ?auto_3781 ) ) ( not ( = ?auto_3767 ?auto_3771 ) ) ( not ( = ?auto_3767 ?auto_3782 ) ) ( not ( = ?auto_3768 ?auto_3771 ) ) ( not ( = ?auto_3768 ?auto_3782 ) ) ( not ( = ?auto_3769 ?auto_3771 ) ) ( not ( = ?auto_3769 ?auto_3782 ) ) ( not ( = ?auto_3771 ?auto_3783 ) ) ( not ( = ?auto_3771 ?auto_3788 ) ) ( not ( = ?auto_3771 ?auto_3781 ) ) ( not ( = ?auto_3782 ?auto_3783 ) ) ( not ( = ?auto_3782 ?auto_3788 ) ) ( not ( = ?auto_3782 ?auto_3781 ) ) ( not ( = ?auto_3767 ?auto_3772 ) ) ( not ( = ?auto_3767 ?auto_3789 ) ) ( not ( = ?auto_3768 ?auto_3772 ) ) ( not ( = ?auto_3768 ?auto_3789 ) ) ( not ( = ?auto_3769 ?auto_3772 ) ) ( not ( = ?auto_3769 ?auto_3789 ) ) ( not ( = ?auto_3770 ?auto_3772 ) ) ( not ( = ?auto_3770 ?auto_3789 ) ) ( not ( = ?auto_3772 ?auto_3782 ) ) ( not ( = ?auto_3772 ?auto_3783 ) ) ( not ( = ?auto_3772 ?auto_3788 ) ) ( not ( = ?auto_3772 ?auto_3781 ) ) ( not ( = ?auto_3787 ?auto_3790 ) ) ( not ( = ?auto_3787 ?auto_3780 ) ) ( not ( = ?auto_3787 ?auto_3791 ) ) ( not ( = ?auto_3786 ?auto_3785 ) ) ( not ( = ?auto_3786 ?auto_3792 ) ) ( not ( = ?auto_3786 ?auto_3784 ) ) ( not ( = ?auto_3789 ?auto_3782 ) ) ( not ( = ?auto_3789 ?auto_3783 ) ) ( not ( = ?auto_3789 ?auto_3788 ) ) ( not ( = ?auto_3789 ?auto_3781 ) ) ( not ( = ?auto_3767 ?auto_3773 ) ) ( not ( = ?auto_3767 ?auto_3778 ) ) ( not ( = ?auto_3768 ?auto_3773 ) ) ( not ( = ?auto_3768 ?auto_3778 ) ) ( not ( = ?auto_3769 ?auto_3773 ) ) ( not ( = ?auto_3769 ?auto_3778 ) ) ( not ( = ?auto_3770 ?auto_3773 ) ) ( not ( = ?auto_3770 ?auto_3778 ) ) ( not ( = ?auto_3771 ?auto_3773 ) ) ( not ( = ?auto_3771 ?auto_3778 ) ) ( not ( = ?auto_3773 ?auto_3789 ) ) ( not ( = ?auto_3773 ?auto_3782 ) ) ( not ( = ?auto_3773 ?auto_3783 ) ) ( not ( = ?auto_3773 ?auto_3788 ) ) ( not ( = ?auto_3773 ?auto_3781 ) ) ( not ( = ?auto_3775 ?auto_3787 ) ) ( not ( = ?auto_3775 ?auto_3790 ) ) ( not ( = ?auto_3775 ?auto_3780 ) ) ( not ( = ?auto_3775 ?auto_3791 ) ) ( not ( = ?auto_3776 ?auto_3786 ) ) ( not ( = ?auto_3776 ?auto_3785 ) ) ( not ( = ?auto_3776 ?auto_3792 ) ) ( not ( = ?auto_3776 ?auto_3784 ) ) ( not ( = ?auto_3778 ?auto_3789 ) ) ( not ( = ?auto_3778 ?auto_3782 ) ) ( not ( = ?auto_3778 ?auto_3783 ) ) ( not ( = ?auto_3778 ?auto_3788 ) ) ( not ( = ?auto_3778 ?auto_3781 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3767 ?auto_3768 ?auto_3769 ?auto_3770 ?auto_3771 ?auto_3772 )
      ( MAKE-1CRATE ?auto_3772 ?auto_3773 )
      ( MAKE-6CRATE-VERIFY ?auto_3767 ?auto_3768 ?auto_3769 ?auto_3770 ?auto_3771 ?auto_3772 ?auto_3773 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_3811 - SURFACE
      ?auto_3812 - SURFACE
      ?auto_3813 - SURFACE
      ?auto_3814 - SURFACE
      ?auto_3815 - SURFACE
      ?auto_3816 - SURFACE
      ?auto_3817 - SURFACE
      ?auto_3818 - SURFACE
    )
    :vars
    (
      ?auto_3824 - HOIST
      ?auto_3823 - PLACE
      ?auto_3822 - PLACE
      ?auto_3820 - HOIST
      ?auto_3821 - SURFACE
      ?auto_3828 - PLACE
      ?auto_3833 - HOIST
      ?auto_3827 - SURFACE
      ?auto_3836 - SURFACE
      ?auto_3831 - PLACE
      ?auto_3838 - HOIST
      ?auto_3837 - SURFACE
      ?auto_3826 - PLACE
      ?auto_3825 - HOIST
      ?auto_3832 - SURFACE
      ?auto_3835 - PLACE
      ?auto_3834 - HOIST
      ?auto_3829 - SURFACE
      ?auto_3830 - SURFACE
      ?auto_3819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3824 ?auto_3823 ) ( IS-CRATE ?auto_3818 ) ( not ( = ?auto_3822 ?auto_3823 ) ) ( HOIST-AT ?auto_3820 ?auto_3822 ) ( SURFACE-AT ?auto_3818 ?auto_3822 ) ( ON ?auto_3818 ?auto_3821 ) ( CLEAR ?auto_3818 ) ( not ( = ?auto_3817 ?auto_3818 ) ) ( not ( = ?auto_3817 ?auto_3821 ) ) ( not ( = ?auto_3818 ?auto_3821 ) ) ( not ( = ?auto_3824 ?auto_3820 ) ) ( IS-CRATE ?auto_3817 ) ( not ( = ?auto_3828 ?auto_3823 ) ) ( HOIST-AT ?auto_3833 ?auto_3828 ) ( AVAILABLE ?auto_3833 ) ( SURFACE-AT ?auto_3817 ?auto_3828 ) ( ON ?auto_3817 ?auto_3827 ) ( CLEAR ?auto_3817 ) ( not ( = ?auto_3816 ?auto_3817 ) ) ( not ( = ?auto_3816 ?auto_3827 ) ) ( not ( = ?auto_3817 ?auto_3827 ) ) ( not ( = ?auto_3824 ?auto_3833 ) ) ( IS-CRATE ?auto_3816 ) ( AVAILABLE ?auto_3820 ) ( SURFACE-AT ?auto_3816 ?auto_3822 ) ( ON ?auto_3816 ?auto_3836 ) ( CLEAR ?auto_3816 ) ( not ( = ?auto_3815 ?auto_3816 ) ) ( not ( = ?auto_3815 ?auto_3836 ) ) ( not ( = ?auto_3816 ?auto_3836 ) ) ( IS-CRATE ?auto_3815 ) ( not ( = ?auto_3831 ?auto_3823 ) ) ( HOIST-AT ?auto_3838 ?auto_3831 ) ( SURFACE-AT ?auto_3815 ?auto_3831 ) ( ON ?auto_3815 ?auto_3837 ) ( CLEAR ?auto_3815 ) ( not ( = ?auto_3814 ?auto_3815 ) ) ( not ( = ?auto_3814 ?auto_3837 ) ) ( not ( = ?auto_3815 ?auto_3837 ) ) ( not ( = ?auto_3824 ?auto_3838 ) ) ( IS-CRATE ?auto_3814 ) ( not ( = ?auto_3826 ?auto_3823 ) ) ( HOIST-AT ?auto_3825 ?auto_3826 ) ( AVAILABLE ?auto_3825 ) ( SURFACE-AT ?auto_3814 ?auto_3826 ) ( ON ?auto_3814 ?auto_3832 ) ( CLEAR ?auto_3814 ) ( not ( = ?auto_3813 ?auto_3814 ) ) ( not ( = ?auto_3813 ?auto_3832 ) ) ( not ( = ?auto_3814 ?auto_3832 ) ) ( not ( = ?auto_3824 ?auto_3825 ) ) ( IS-CRATE ?auto_3813 ) ( not ( = ?auto_3835 ?auto_3823 ) ) ( HOIST-AT ?auto_3834 ?auto_3835 ) ( AVAILABLE ?auto_3834 ) ( SURFACE-AT ?auto_3813 ?auto_3835 ) ( ON ?auto_3813 ?auto_3829 ) ( CLEAR ?auto_3813 ) ( not ( = ?auto_3812 ?auto_3813 ) ) ( not ( = ?auto_3812 ?auto_3829 ) ) ( not ( = ?auto_3813 ?auto_3829 ) ) ( not ( = ?auto_3824 ?auto_3834 ) ) ( SURFACE-AT ?auto_3811 ?auto_3823 ) ( CLEAR ?auto_3811 ) ( IS-CRATE ?auto_3812 ) ( AVAILABLE ?auto_3824 ) ( AVAILABLE ?auto_3838 ) ( SURFACE-AT ?auto_3812 ?auto_3831 ) ( ON ?auto_3812 ?auto_3830 ) ( CLEAR ?auto_3812 ) ( TRUCK-AT ?auto_3819 ?auto_3823 ) ( not ( = ?auto_3811 ?auto_3812 ) ) ( not ( = ?auto_3811 ?auto_3830 ) ) ( not ( = ?auto_3812 ?auto_3830 ) ) ( not ( = ?auto_3811 ?auto_3813 ) ) ( not ( = ?auto_3811 ?auto_3829 ) ) ( not ( = ?auto_3813 ?auto_3830 ) ) ( not ( = ?auto_3835 ?auto_3831 ) ) ( not ( = ?auto_3834 ?auto_3838 ) ) ( not ( = ?auto_3829 ?auto_3830 ) ) ( not ( = ?auto_3811 ?auto_3814 ) ) ( not ( = ?auto_3811 ?auto_3832 ) ) ( not ( = ?auto_3812 ?auto_3814 ) ) ( not ( = ?auto_3812 ?auto_3832 ) ) ( not ( = ?auto_3814 ?auto_3829 ) ) ( not ( = ?auto_3814 ?auto_3830 ) ) ( not ( = ?auto_3826 ?auto_3835 ) ) ( not ( = ?auto_3826 ?auto_3831 ) ) ( not ( = ?auto_3825 ?auto_3834 ) ) ( not ( = ?auto_3825 ?auto_3838 ) ) ( not ( = ?auto_3832 ?auto_3829 ) ) ( not ( = ?auto_3832 ?auto_3830 ) ) ( not ( = ?auto_3811 ?auto_3815 ) ) ( not ( = ?auto_3811 ?auto_3837 ) ) ( not ( = ?auto_3812 ?auto_3815 ) ) ( not ( = ?auto_3812 ?auto_3837 ) ) ( not ( = ?auto_3813 ?auto_3815 ) ) ( not ( = ?auto_3813 ?auto_3837 ) ) ( not ( = ?auto_3815 ?auto_3832 ) ) ( not ( = ?auto_3815 ?auto_3829 ) ) ( not ( = ?auto_3815 ?auto_3830 ) ) ( not ( = ?auto_3837 ?auto_3832 ) ) ( not ( = ?auto_3837 ?auto_3829 ) ) ( not ( = ?auto_3837 ?auto_3830 ) ) ( not ( = ?auto_3811 ?auto_3816 ) ) ( not ( = ?auto_3811 ?auto_3836 ) ) ( not ( = ?auto_3812 ?auto_3816 ) ) ( not ( = ?auto_3812 ?auto_3836 ) ) ( not ( = ?auto_3813 ?auto_3816 ) ) ( not ( = ?auto_3813 ?auto_3836 ) ) ( not ( = ?auto_3814 ?auto_3816 ) ) ( not ( = ?auto_3814 ?auto_3836 ) ) ( not ( = ?auto_3816 ?auto_3837 ) ) ( not ( = ?auto_3816 ?auto_3832 ) ) ( not ( = ?auto_3816 ?auto_3829 ) ) ( not ( = ?auto_3816 ?auto_3830 ) ) ( not ( = ?auto_3822 ?auto_3831 ) ) ( not ( = ?auto_3822 ?auto_3826 ) ) ( not ( = ?auto_3822 ?auto_3835 ) ) ( not ( = ?auto_3820 ?auto_3838 ) ) ( not ( = ?auto_3820 ?auto_3825 ) ) ( not ( = ?auto_3820 ?auto_3834 ) ) ( not ( = ?auto_3836 ?auto_3837 ) ) ( not ( = ?auto_3836 ?auto_3832 ) ) ( not ( = ?auto_3836 ?auto_3829 ) ) ( not ( = ?auto_3836 ?auto_3830 ) ) ( not ( = ?auto_3811 ?auto_3817 ) ) ( not ( = ?auto_3811 ?auto_3827 ) ) ( not ( = ?auto_3812 ?auto_3817 ) ) ( not ( = ?auto_3812 ?auto_3827 ) ) ( not ( = ?auto_3813 ?auto_3817 ) ) ( not ( = ?auto_3813 ?auto_3827 ) ) ( not ( = ?auto_3814 ?auto_3817 ) ) ( not ( = ?auto_3814 ?auto_3827 ) ) ( not ( = ?auto_3815 ?auto_3817 ) ) ( not ( = ?auto_3815 ?auto_3827 ) ) ( not ( = ?auto_3817 ?auto_3836 ) ) ( not ( = ?auto_3817 ?auto_3837 ) ) ( not ( = ?auto_3817 ?auto_3832 ) ) ( not ( = ?auto_3817 ?auto_3829 ) ) ( not ( = ?auto_3817 ?auto_3830 ) ) ( not ( = ?auto_3828 ?auto_3822 ) ) ( not ( = ?auto_3828 ?auto_3831 ) ) ( not ( = ?auto_3828 ?auto_3826 ) ) ( not ( = ?auto_3828 ?auto_3835 ) ) ( not ( = ?auto_3833 ?auto_3820 ) ) ( not ( = ?auto_3833 ?auto_3838 ) ) ( not ( = ?auto_3833 ?auto_3825 ) ) ( not ( = ?auto_3833 ?auto_3834 ) ) ( not ( = ?auto_3827 ?auto_3836 ) ) ( not ( = ?auto_3827 ?auto_3837 ) ) ( not ( = ?auto_3827 ?auto_3832 ) ) ( not ( = ?auto_3827 ?auto_3829 ) ) ( not ( = ?auto_3827 ?auto_3830 ) ) ( not ( = ?auto_3811 ?auto_3818 ) ) ( not ( = ?auto_3811 ?auto_3821 ) ) ( not ( = ?auto_3812 ?auto_3818 ) ) ( not ( = ?auto_3812 ?auto_3821 ) ) ( not ( = ?auto_3813 ?auto_3818 ) ) ( not ( = ?auto_3813 ?auto_3821 ) ) ( not ( = ?auto_3814 ?auto_3818 ) ) ( not ( = ?auto_3814 ?auto_3821 ) ) ( not ( = ?auto_3815 ?auto_3818 ) ) ( not ( = ?auto_3815 ?auto_3821 ) ) ( not ( = ?auto_3816 ?auto_3818 ) ) ( not ( = ?auto_3816 ?auto_3821 ) ) ( not ( = ?auto_3818 ?auto_3827 ) ) ( not ( = ?auto_3818 ?auto_3836 ) ) ( not ( = ?auto_3818 ?auto_3837 ) ) ( not ( = ?auto_3818 ?auto_3832 ) ) ( not ( = ?auto_3818 ?auto_3829 ) ) ( not ( = ?auto_3818 ?auto_3830 ) ) ( not ( = ?auto_3821 ?auto_3827 ) ) ( not ( = ?auto_3821 ?auto_3836 ) ) ( not ( = ?auto_3821 ?auto_3837 ) ) ( not ( = ?auto_3821 ?auto_3832 ) ) ( not ( = ?auto_3821 ?auto_3829 ) ) ( not ( = ?auto_3821 ?auto_3830 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3811 ?auto_3812 ?auto_3813 ?auto_3814 ?auto_3815 ?auto_3816 ?auto_3817 )
      ( MAKE-1CRATE ?auto_3817 ?auto_3818 )
      ( MAKE-7CRATE-VERIFY ?auto_3811 ?auto_3812 ?auto_3813 ?auto_3814 ?auto_3815 ?auto_3816 ?auto_3817 ?auto_3818 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_3858 - SURFACE
      ?auto_3859 - SURFACE
      ?auto_3860 - SURFACE
      ?auto_3861 - SURFACE
      ?auto_3862 - SURFACE
      ?auto_3863 - SURFACE
      ?auto_3864 - SURFACE
      ?auto_3865 - SURFACE
      ?auto_3866 - SURFACE
    )
    :vars
    (
      ?auto_3872 - HOIST
      ?auto_3871 - PLACE
      ?auto_3867 - PLACE
      ?auto_3868 - HOIST
      ?auto_3869 - SURFACE
      ?auto_3883 - PLACE
      ?auto_3884 - HOIST
      ?auto_3885 - SURFACE
      ?auto_3880 - PLACE
      ?auto_3878 - HOIST
      ?auto_3887 - SURFACE
      ?auto_3873 - SURFACE
      ?auto_3879 - PLACE
      ?auto_3882 - HOIST
      ?auto_3886 - SURFACE
      ?auto_3875 - PLACE
      ?auto_3881 - HOIST
      ?auto_3877 - SURFACE
      ?auto_3876 - SURFACE
      ?auto_3874 - SURFACE
      ?auto_3870 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3872 ?auto_3871 ) ( IS-CRATE ?auto_3866 ) ( not ( = ?auto_3867 ?auto_3871 ) ) ( HOIST-AT ?auto_3868 ?auto_3867 ) ( SURFACE-AT ?auto_3866 ?auto_3867 ) ( ON ?auto_3866 ?auto_3869 ) ( CLEAR ?auto_3866 ) ( not ( = ?auto_3865 ?auto_3866 ) ) ( not ( = ?auto_3865 ?auto_3869 ) ) ( not ( = ?auto_3866 ?auto_3869 ) ) ( not ( = ?auto_3872 ?auto_3868 ) ) ( IS-CRATE ?auto_3865 ) ( not ( = ?auto_3883 ?auto_3871 ) ) ( HOIST-AT ?auto_3884 ?auto_3883 ) ( SURFACE-AT ?auto_3865 ?auto_3883 ) ( ON ?auto_3865 ?auto_3885 ) ( CLEAR ?auto_3865 ) ( not ( = ?auto_3864 ?auto_3865 ) ) ( not ( = ?auto_3864 ?auto_3885 ) ) ( not ( = ?auto_3865 ?auto_3885 ) ) ( not ( = ?auto_3872 ?auto_3884 ) ) ( IS-CRATE ?auto_3864 ) ( not ( = ?auto_3880 ?auto_3871 ) ) ( HOIST-AT ?auto_3878 ?auto_3880 ) ( AVAILABLE ?auto_3878 ) ( SURFACE-AT ?auto_3864 ?auto_3880 ) ( ON ?auto_3864 ?auto_3887 ) ( CLEAR ?auto_3864 ) ( not ( = ?auto_3863 ?auto_3864 ) ) ( not ( = ?auto_3863 ?auto_3887 ) ) ( not ( = ?auto_3864 ?auto_3887 ) ) ( not ( = ?auto_3872 ?auto_3878 ) ) ( IS-CRATE ?auto_3863 ) ( AVAILABLE ?auto_3884 ) ( SURFACE-AT ?auto_3863 ?auto_3883 ) ( ON ?auto_3863 ?auto_3873 ) ( CLEAR ?auto_3863 ) ( not ( = ?auto_3862 ?auto_3863 ) ) ( not ( = ?auto_3862 ?auto_3873 ) ) ( not ( = ?auto_3863 ?auto_3873 ) ) ( IS-CRATE ?auto_3862 ) ( not ( = ?auto_3879 ?auto_3871 ) ) ( HOIST-AT ?auto_3882 ?auto_3879 ) ( SURFACE-AT ?auto_3862 ?auto_3879 ) ( ON ?auto_3862 ?auto_3886 ) ( CLEAR ?auto_3862 ) ( not ( = ?auto_3861 ?auto_3862 ) ) ( not ( = ?auto_3861 ?auto_3886 ) ) ( not ( = ?auto_3862 ?auto_3886 ) ) ( not ( = ?auto_3872 ?auto_3882 ) ) ( IS-CRATE ?auto_3861 ) ( not ( = ?auto_3875 ?auto_3871 ) ) ( HOIST-AT ?auto_3881 ?auto_3875 ) ( AVAILABLE ?auto_3881 ) ( SURFACE-AT ?auto_3861 ?auto_3875 ) ( ON ?auto_3861 ?auto_3877 ) ( CLEAR ?auto_3861 ) ( not ( = ?auto_3860 ?auto_3861 ) ) ( not ( = ?auto_3860 ?auto_3877 ) ) ( not ( = ?auto_3861 ?auto_3877 ) ) ( not ( = ?auto_3872 ?auto_3881 ) ) ( IS-CRATE ?auto_3860 ) ( AVAILABLE ?auto_3868 ) ( SURFACE-AT ?auto_3860 ?auto_3867 ) ( ON ?auto_3860 ?auto_3876 ) ( CLEAR ?auto_3860 ) ( not ( = ?auto_3859 ?auto_3860 ) ) ( not ( = ?auto_3859 ?auto_3876 ) ) ( not ( = ?auto_3860 ?auto_3876 ) ) ( SURFACE-AT ?auto_3858 ?auto_3871 ) ( CLEAR ?auto_3858 ) ( IS-CRATE ?auto_3859 ) ( AVAILABLE ?auto_3872 ) ( AVAILABLE ?auto_3882 ) ( SURFACE-AT ?auto_3859 ?auto_3879 ) ( ON ?auto_3859 ?auto_3874 ) ( CLEAR ?auto_3859 ) ( TRUCK-AT ?auto_3870 ?auto_3871 ) ( not ( = ?auto_3858 ?auto_3859 ) ) ( not ( = ?auto_3858 ?auto_3874 ) ) ( not ( = ?auto_3859 ?auto_3874 ) ) ( not ( = ?auto_3858 ?auto_3860 ) ) ( not ( = ?auto_3858 ?auto_3876 ) ) ( not ( = ?auto_3860 ?auto_3874 ) ) ( not ( = ?auto_3867 ?auto_3879 ) ) ( not ( = ?auto_3868 ?auto_3882 ) ) ( not ( = ?auto_3876 ?auto_3874 ) ) ( not ( = ?auto_3858 ?auto_3861 ) ) ( not ( = ?auto_3858 ?auto_3877 ) ) ( not ( = ?auto_3859 ?auto_3861 ) ) ( not ( = ?auto_3859 ?auto_3877 ) ) ( not ( = ?auto_3861 ?auto_3876 ) ) ( not ( = ?auto_3861 ?auto_3874 ) ) ( not ( = ?auto_3875 ?auto_3867 ) ) ( not ( = ?auto_3875 ?auto_3879 ) ) ( not ( = ?auto_3881 ?auto_3868 ) ) ( not ( = ?auto_3881 ?auto_3882 ) ) ( not ( = ?auto_3877 ?auto_3876 ) ) ( not ( = ?auto_3877 ?auto_3874 ) ) ( not ( = ?auto_3858 ?auto_3862 ) ) ( not ( = ?auto_3858 ?auto_3886 ) ) ( not ( = ?auto_3859 ?auto_3862 ) ) ( not ( = ?auto_3859 ?auto_3886 ) ) ( not ( = ?auto_3860 ?auto_3862 ) ) ( not ( = ?auto_3860 ?auto_3886 ) ) ( not ( = ?auto_3862 ?auto_3877 ) ) ( not ( = ?auto_3862 ?auto_3876 ) ) ( not ( = ?auto_3862 ?auto_3874 ) ) ( not ( = ?auto_3886 ?auto_3877 ) ) ( not ( = ?auto_3886 ?auto_3876 ) ) ( not ( = ?auto_3886 ?auto_3874 ) ) ( not ( = ?auto_3858 ?auto_3863 ) ) ( not ( = ?auto_3858 ?auto_3873 ) ) ( not ( = ?auto_3859 ?auto_3863 ) ) ( not ( = ?auto_3859 ?auto_3873 ) ) ( not ( = ?auto_3860 ?auto_3863 ) ) ( not ( = ?auto_3860 ?auto_3873 ) ) ( not ( = ?auto_3861 ?auto_3863 ) ) ( not ( = ?auto_3861 ?auto_3873 ) ) ( not ( = ?auto_3863 ?auto_3886 ) ) ( not ( = ?auto_3863 ?auto_3877 ) ) ( not ( = ?auto_3863 ?auto_3876 ) ) ( not ( = ?auto_3863 ?auto_3874 ) ) ( not ( = ?auto_3883 ?auto_3879 ) ) ( not ( = ?auto_3883 ?auto_3875 ) ) ( not ( = ?auto_3883 ?auto_3867 ) ) ( not ( = ?auto_3884 ?auto_3882 ) ) ( not ( = ?auto_3884 ?auto_3881 ) ) ( not ( = ?auto_3884 ?auto_3868 ) ) ( not ( = ?auto_3873 ?auto_3886 ) ) ( not ( = ?auto_3873 ?auto_3877 ) ) ( not ( = ?auto_3873 ?auto_3876 ) ) ( not ( = ?auto_3873 ?auto_3874 ) ) ( not ( = ?auto_3858 ?auto_3864 ) ) ( not ( = ?auto_3858 ?auto_3887 ) ) ( not ( = ?auto_3859 ?auto_3864 ) ) ( not ( = ?auto_3859 ?auto_3887 ) ) ( not ( = ?auto_3860 ?auto_3864 ) ) ( not ( = ?auto_3860 ?auto_3887 ) ) ( not ( = ?auto_3861 ?auto_3864 ) ) ( not ( = ?auto_3861 ?auto_3887 ) ) ( not ( = ?auto_3862 ?auto_3864 ) ) ( not ( = ?auto_3862 ?auto_3887 ) ) ( not ( = ?auto_3864 ?auto_3873 ) ) ( not ( = ?auto_3864 ?auto_3886 ) ) ( not ( = ?auto_3864 ?auto_3877 ) ) ( not ( = ?auto_3864 ?auto_3876 ) ) ( not ( = ?auto_3864 ?auto_3874 ) ) ( not ( = ?auto_3880 ?auto_3883 ) ) ( not ( = ?auto_3880 ?auto_3879 ) ) ( not ( = ?auto_3880 ?auto_3875 ) ) ( not ( = ?auto_3880 ?auto_3867 ) ) ( not ( = ?auto_3878 ?auto_3884 ) ) ( not ( = ?auto_3878 ?auto_3882 ) ) ( not ( = ?auto_3878 ?auto_3881 ) ) ( not ( = ?auto_3878 ?auto_3868 ) ) ( not ( = ?auto_3887 ?auto_3873 ) ) ( not ( = ?auto_3887 ?auto_3886 ) ) ( not ( = ?auto_3887 ?auto_3877 ) ) ( not ( = ?auto_3887 ?auto_3876 ) ) ( not ( = ?auto_3887 ?auto_3874 ) ) ( not ( = ?auto_3858 ?auto_3865 ) ) ( not ( = ?auto_3858 ?auto_3885 ) ) ( not ( = ?auto_3859 ?auto_3865 ) ) ( not ( = ?auto_3859 ?auto_3885 ) ) ( not ( = ?auto_3860 ?auto_3865 ) ) ( not ( = ?auto_3860 ?auto_3885 ) ) ( not ( = ?auto_3861 ?auto_3865 ) ) ( not ( = ?auto_3861 ?auto_3885 ) ) ( not ( = ?auto_3862 ?auto_3865 ) ) ( not ( = ?auto_3862 ?auto_3885 ) ) ( not ( = ?auto_3863 ?auto_3865 ) ) ( not ( = ?auto_3863 ?auto_3885 ) ) ( not ( = ?auto_3865 ?auto_3887 ) ) ( not ( = ?auto_3865 ?auto_3873 ) ) ( not ( = ?auto_3865 ?auto_3886 ) ) ( not ( = ?auto_3865 ?auto_3877 ) ) ( not ( = ?auto_3865 ?auto_3876 ) ) ( not ( = ?auto_3865 ?auto_3874 ) ) ( not ( = ?auto_3885 ?auto_3887 ) ) ( not ( = ?auto_3885 ?auto_3873 ) ) ( not ( = ?auto_3885 ?auto_3886 ) ) ( not ( = ?auto_3885 ?auto_3877 ) ) ( not ( = ?auto_3885 ?auto_3876 ) ) ( not ( = ?auto_3885 ?auto_3874 ) ) ( not ( = ?auto_3858 ?auto_3866 ) ) ( not ( = ?auto_3858 ?auto_3869 ) ) ( not ( = ?auto_3859 ?auto_3866 ) ) ( not ( = ?auto_3859 ?auto_3869 ) ) ( not ( = ?auto_3860 ?auto_3866 ) ) ( not ( = ?auto_3860 ?auto_3869 ) ) ( not ( = ?auto_3861 ?auto_3866 ) ) ( not ( = ?auto_3861 ?auto_3869 ) ) ( not ( = ?auto_3862 ?auto_3866 ) ) ( not ( = ?auto_3862 ?auto_3869 ) ) ( not ( = ?auto_3863 ?auto_3866 ) ) ( not ( = ?auto_3863 ?auto_3869 ) ) ( not ( = ?auto_3864 ?auto_3866 ) ) ( not ( = ?auto_3864 ?auto_3869 ) ) ( not ( = ?auto_3866 ?auto_3885 ) ) ( not ( = ?auto_3866 ?auto_3887 ) ) ( not ( = ?auto_3866 ?auto_3873 ) ) ( not ( = ?auto_3866 ?auto_3886 ) ) ( not ( = ?auto_3866 ?auto_3877 ) ) ( not ( = ?auto_3866 ?auto_3876 ) ) ( not ( = ?auto_3866 ?auto_3874 ) ) ( not ( = ?auto_3869 ?auto_3885 ) ) ( not ( = ?auto_3869 ?auto_3887 ) ) ( not ( = ?auto_3869 ?auto_3873 ) ) ( not ( = ?auto_3869 ?auto_3886 ) ) ( not ( = ?auto_3869 ?auto_3877 ) ) ( not ( = ?auto_3869 ?auto_3876 ) ) ( not ( = ?auto_3869 ?auto_3874 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_3858 ?auto_3859 ?auto_3860 ?auto_3861 ?auto_3862 ?auto_3863 ?auto_3864 ?auto_3865 )
      ( MAKE-1CRATE ?auto_3865 ?auto_3866 )
      ( MAKE-8CRATE-VERIFY ?auto_3858 ?auto_3859 ?auto_3860 ?auto_3861 ?auto_3862 ?auto_3863 ?auto_3864 ?auto_3865 ?auto_3866 ) )
  )

)

