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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3626 - SURFACE
      ?auto_3627 - SURFACE
    )
    :vars
    (
      ?auto_3628 - HOIST
      ?auto_3629 - PLACE
      ?auto_3631 - PLACE
      ?auto_3632 - HOIST
      ?auto_3633 - SURFACE
      ?auto_3630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3628 ?auto_3629 ) ( SURFACE-AT ?auto_3626 ?auto_3629 ) ( CLEAR ?auto_3626 ) ( IS-CRATE ?auto_3627 ) ( AVAILABLE ?auto_3628 ) ( not ( = ?auto_3631 ?auto_3629 ) ) ( HOIST-AT ?auto_3632 ?auto_3631 ) ( AVAILABLE ?auto_3632 ) ( SURFACE-AT ?auto_3627 ?auto_3631 ) ( ON ?auto_3627 ?auto_3633 ) ( CLEAR ?auto_3627 ) ( TRUCK-AT ?auto_3630 ?auto_3629 ) ( not ( = ?auto_3626 ?auto_3627 ) ) ( not ( = ?auto_3626 ?auto_3633 ) ) ( not ( = ?auto_3627 ?auto_3633 ) ) ( not ( = ?auto_3628 ?auto_3632 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3630 ?auto_3629 ?auto_3631 )
      ( !LIFT ?auto_3632 ?auto_3627 ?auto_3633 ?auto_3631 )
      ( !LOAD ?auto_3632 ?auto_3627 ?auto_3630 ?auto_3631 )
      ( !DRIVE ?auto_3630 ?auto_3631 ?auto_3629 )
      ( !UNLOAD ?auto_3628 ?auto_3627 ?auto_3630 ?auto_3629 )
      ( !DROP ?auto_3628 ?auto_3627 ?auto_3626 ?auto_3629 )
      ( MAKE-1CRATE-VERIFY ?auto_3626 ?auto_3627 ) )
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
      ?auto_3642 - HOIST
      ?auto_3645 - PLACE
      ?auto_3640 - PLACE
      ?auto_3643 - HOIST
      ?auto_3644 - SURFACE
      ?auto_3646 - PLACE
      ?auto_3648 - HOIST
      ?auto_3647 - SURFACE
      ?auto_3641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3642 ?auto_3645 ) ( IS-CRATE ?auto_3639 ) ( not ( = ?auto_3640 ?auto_3645 ) ) ( HOIST-AT ?auto_3643 ?auto_3640 ) ( AVAILABLE ?auto_3643 ) ( SURFACE-AT ?auto_3639 ?auto_3640 ) ( ON ?auto_3639 ?auto_3644 ) ( CLEAR ?auto_3639 ) ( not ( = ?auto_3638 ?auto_3639 ) ) ( not ( = ?auto_3638 ?auto_3644 ) ) ( not ( = ?auto_3639 ?auto_3644 ) ) ( not ( = ?auto_3642 ?auto_3643 ) ) ( SURFACE-AT ?auto_3637 ?auto_3645 ) ( CLEAR ?auto_3637 ) ( IS-CRATE ?auto_3638 ) ( AVAILABLE ?auto_3642 ) ( not ( = ?auto_3646 ?auto_3645 ) ) ( HOIST-AT ?auto_3648 ?auto_3646 ) ( AVAILABLE ?auto_3648 ) ( SURFACE-AT ?auto_3638 ?auto_3646 ) ( ON ?auto_3638 ?auto_3647 ) ( CLEAR ?auto_3638 ) ( TRUCK-AT ?auto_3641 ?auto_3645 ) ( not ( = ?auto_3637 ?auto_3638 ) ) ( not ( = ?auto_3637 ?auto_3647 ) ) ( not ( = ?auto_3638 ?auto_3647 ) ) ( not ( = ?auto_3642 ?auto_3648 ) ) ( not ( = ?auto_3637 ?auto_3639 ) ) ( not ( = ?auto_3637 ?auto_3644 ) ) ( not ( = ?auto_3639 ?auto_3647 ) ) ( not ( = ?auto_3640 ?auto_3646 ) ) ( not ( = ?auto_3643 ?auto_3648 ) ) ( not ( = ?auto_3644 ?auto_3647 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3637 ?auto_3638 )
      ( MAKE-1CRATE ?auto_3638 ?auto_3639 )
      ( MAKE-2CRATE-VERIFY ?auto_3637 ?auto_3638 ?auto_3639 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3651 - SURFACE
      ?auto_3652 - SURFACE
    )
    :vars
    (
      ?auto_3653 - HOIST
      ?auto_3654 - PLACE
      ?auto_3656 - PLACE
      ?auto_3657 - HOIST
      ?auto_3658 - SURFACE
      ?auto_3655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3653 ?auto_3654 ) ( SURFACE-AT ?auto_3651 ?auto_3654 ) ( CLEAR ?auto_3651 ) ( IS-CRATE ?auto_3652 ) ( AVAILABLE ?auto_3653 ) ( not ( = ?auto_3656 ?auto_3654 ) ) ( HOIST-AT ?auto_3657 ?auto_3656 ) ( AVAILABLE ?auto_3657 ) ( SURFACE-AT ?auto_3652 ?auto_3656 ) ( ON ?auto_3652 ?auto_3658 ) ( CLEAR ?auto_3652 ) ( TRUCK-AT ?auto_3655 ?auto_3654 ) ( not ( = ?auto_3651 ?auto_3652 ) ) ( not ( = ?auto_3651 ?auto_3658 ) ) ( not ( = ?auto_3652 ?auto_3658 ) ) ( not ( = ?auto_3653 ?auto_3657 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3655 ?auto_3654 ?auto_3656 )
      ( !LIFT ?auto_3657 ?auto_3652 ?auto_3658 ?auto_3656 )
      ( !LOAD ?auto_3657 ?auto_3652 ?auto_3655 ?auto_3656 )
      ( !DRIVE ?auto_3655 ?auto_3656 ?auto_3654 )
      ( !UNLOAD ?auto_3653 ?auto_3652 ?auto_3655 ?auto_3654 )
      ( !DROP ?auto_3653 ?auto_3652 ?auto_3651 ?auto_3654 )
      ( MAKE-1CRATE-VERIFY ?auto_3651 ?auto_3652 ) )
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
      ?auto_3668 - HOIST
      ?auto_3671 - PLACE
      ?auto_3672 - PLACE
      ?auto_3669 - HOIST
      ?auto_3670 - SURFACE
      ?auto_3678 - PLACE
      ?auto_3677 - HOIST
      ?auto_3676 - SURFACE
      ?auto_3673 - PLACE
      ?auto_3674 - HOIST
      ?auto_3675 - SURFACE
      ?auto_3667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3668 ?auto_3671 ) ( IS-CRATE ?auto_3666 ) ( not ( = ?auto_3672 ?auto_3671 ) ) ( HOIST-AT ?auto_3669 ?auto_3672 ) ( AVAILABLE ?auto_3669 ) ( SURFACE-AT ?auto_3666 ?auto_3672 ) ( ON ?auto_3666 ?auto_3670 ) ( CLEAR ?auto_3666 ) ( not ( = ?auto_3665 ?auto_3666 ) ) ( not ( = ?auto_3665 ?auto_3670 ) ) ( not ( = ?auto_3666 ?auto_3670 ) ) ( not ( = ?auto_3668 ?auto_3669 ) ) ( IS-CRATE ?auto_3665 ) ( not ( = ?auto_3678 ?auto_3671 ) ) ( HOIST-AT ?auto_3677 ?auto_3678 ) ( AVAILABLE ?auto_3677 ) ( SURFACE-AT ?auto_3665 ?auto_3678 ) ( ON ?auto_3665 ?auto_3676 ) ( CLEAR ?auto_3665 ) ( not ( = ?auto_3664 ?auto_3665 ) ) ( not ( = ?auto_3664 ?auto_3676 ) ) ( not ( = ?auto_3665 ?auto_3676 ) ) ( not ( = ?auto_3668 ?auto_3677 ) ) ( SURFACE-AT ?auto_3663 ?auto_3671 ) ( CLEAR ?auto_3663 ) ( IS-CRATE ?auto_3664 ) ( AVAILABLE ?auto_3668 ) ( not ( = ?auto_3673 ?auto_3671 ) ) ( HOIST-AT ?auto_3674 ?auto_3673 ) ( AVAILABLE ?auto_3674 ) ( SURFACE-AT ?auto_3664 ?auto_3673 ) ( ON ?auto_3664 ?auto_3675 ) ( CLEAR ?auto_3664 ) ( TRUCK-AT ?auto_3667 ?auto_3671 ) ( not ( = ?auto_3663 ?auto_3664 ) ) ( not ( = ?auto_3663 ?auto_3675 ) ) ( not ( = ?auto_3664 ?auto_3675 ) ) ( not ( = ?auto_3668 ?auto_3674 ) ) ( not ( = ?auto_3663 ?auto_3665 ) ) ( not ( = ?auto_3663 ?auto_3676 ) ) ( not ( = ?auto_3665 ?auto_3675 ) ) ( not ( = ?auto_3678 ?auto_3673 ) ) ( not ( = ?auto_3677 ?auto_3674 ) ) ( not ( = ?auto_3676 ?auto_3675 ) ) ( not ( = ?auto_3663 ?auto_3666 ) ) ( not ( = ?auto_3663 ?auto_3670 ) ) ( not ( = ?auto_3664 ?auto_3666 ) ) ( not ( = ?auto_3664 ?auto_3670 ) ) ( not ( = ?auto_3666 ?auto_3676 ) ) ( not ( = ?auto_3666 ?auto_3675 ) ) ( not ( = ?auto_3672 ?auto_3678 ) ) ( not ( = ?auto_3672 ?auto_3673 ) ) ( not ( = ?auto_3669 ?auto_3677 ) ) ( not ( = ?auto_3669 ?auto_3674 ) ) ( not ( = ?auto_3670 ?auto_3676 ) ) ( not ( = ?auto_3670 ?auto_3675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3663 ?auto_3664 ?auto_3665 )
      ( MAKE-1CRATE ?auto_3665 ?auto_3666 )
      ( MAKE-3CRATE-VERIFY ?auto_3663 ?auto_3664 ?auto_3665 ?auto_3666 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3681 - SURFACE
      ?auto_3682 - SURFACE
    )
    :vars
    (
      ?auto_3683 - HOIST
      ?auto_3684 - PLACE
      ?auto_3686 - PLACE
      ?auto_3687 - HOIST
      ?auto_3688 - SURFACE
      ?auto_3685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3683 ?auto_3684 ) ( SURFACE-AT ?auto_3681 ?auto_3684 ) ( CLEAR ?auto_3681 ) ( IS-CRATE ?auto_3682 ) ( AVAILABLE ?auto_3683 ) ( not ( = ?auto_3686 ?auto_3684 ) ) ( HOIST-AT ?auto_3687 ?auto_3686 ) ( AVAILABLE ?auto_3687 ) ( SURFACE-AT ?auto_3682 ?auto_3686 ) ( ON ?auto_3682 ?auto_3688 ) ( CLEAR ?auto_3682 ) ( TRUCK-AT ?auto_3685 ?auto_3684 ) ( not ( = ?auto_3681 ?auto_3682 ) ) ( not ( = ?auto_3681 ?auto_3688 ) ) ( not ( = ?auto_3682 ?auto_3688 ) ) ( not ( = ?auto_3683 ?auto_3687 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3685 ?auto_3684 ?auto_3686 )
      ( !LIFT ?auto_3687 ?auto_3682 ?auto_3688 ?auto_3686 )
      ( !LOAD ?auto_3687 ?auto_3682 ?auto_3685 ?auto_3686 )
      ( !DRIVE ?auto_3685 ?auto_3686 ?auto_3684 )
      ( !UNLOAD ?auto_3683 ?auto_3682 ?auto_3685 ?auto_3684 )
      ( !DROP ?auto_3683 ?auto_3682 ?auto_3681 ?auto_3684 )
      ( MAKE-1CRATE-VERIFY ?auto_3681 ?auto_3682 ) )
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
      ?auto_3700 - HOIST
      ?auto_3702 - PLACE
      ?auto_3704 - PLACE
      ?auto_3703 - HOIST
      ?auto_3699 - SURFACE
      ?auto_3705 - PLACE
      ?auto_3706 - HOIST
      ?auto_3707 - SURFACE
      ?auto_3708 - PLACE
      ?auto_3710 - HOIST
      ?auto_3711 - SURFACE
      ?auto_3709 - SURFACE
      ?auto_3701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3700 ?auto_3702 ) ( IS-CRATE ?auto_3698 ) ( not ( = ?auto_3704 ?auto_3702 ) ) ( HOIST-AT ?auto_3703 ?auto_3704 ) ( SURFACE-AT ?auto_3698 ?auto_3704 ) ( ON ?auto_3698 ?auto_3699 ) ( CLEAR ?auto_3698 ) ( not ( = ?auto_3697 ?auto_3698 ) ) ( not ( = ?auto_3697 ?auto_3699 ) ) ( not ( = ?auto_3698 ?auto_3699 ) ) ( not ( = ?auto_3700 ?auto_3703 ) ) ( IS-CRATE ?auto_3697 ) ( not ( = ?auto_3705 ?auto_3702 ) ) ( HOIST-AT ?auto_3706 ?auto_3705 ) ( AVAILABLE ?auto_3706 ) ( SURFACE-AT ?auto_3697 ?auto_3705 ) ( ON ?auto_3697 ?auto_3707 ) ( CLEAR ?auto_3697 ) ( not ( = ?auto_3696 ?auto_3697 ) ) ( not ( = ?auto_3696 ?auto_3707 ) ) ( not ( = ?auto_3697 ?auto_3707 ) ) ( not ( = ?auto_3700 ?auto_3706 ) ) ( IS-CRATE ?auto_3696 ) ( not ( = ?auto_3708 ?auto_3702 ) ) ( HOIST-AT ?auto_3710 ?auto_3708 ) ( AVAILABLE ?auto_3710 ) ( SURFACE-AT ?auto_3696 ?auto_3708 ) ( ON ?auto_3696 ?auto_3711 ) ( CLEAR ?auto_3696 ) ( not ( = ?auto_3695 ?auto_3696 ) ) ( not ( = ?auto_3695 ?auto_3711 ) ) ( not ( = ?auto_3696 ?auto_3711 ) ) ( not ( = ?auto_3700 ?auto_3710 ) ) ( SURFACE-AT ?auto_3694 ?auto_3702 ) ( CLEAR ?auto_3694 ) ( IS-CRATE ?auto_3695 ) ( AVAILABLE ?auto_3700 ) ( AVAILABLE ?auto_3703 ) ( SURFACE-AT ?auto_3695 ?auto_3704 ) ( ON ?auto_3695 ?auto_3709 ) ( CLEAR ?auto_3695 ) ( TRUCK-AT ?auto_3701 ?auto_3702 ) ( not ( = ?auto_3694 ?auto_3695 ) ) ( not ( = ?auto_3694 ?auto_3709 ) ) ( not ( = ?auto_3695 ?auto_3709 ) ) ( not ( = ?auto_3694 ?auto_3696 ) ) ( not ( = ?auto_3694 ?auto_3711 ) ) ( not ( = ?auto_3696 ?auto_3709 ) ) ( not ( = ?auto_3708 ?auto_3704 ) ) ( not ( = ?auto_3710 ?auto_3703 ) ) ( not ( = ?auto_3711 ?auto_3709 ) ) ( not ( = ?auto_3694 ?auto_3697 ) ) ( not ( = ?auto_3694 ?auto_3707 ) ) ( not ( = ?auto_3695 ?auto_3697 ) ) ( not ( = ?auto_3695 ?auto_3707 ) ) ( not ( = ?auto_3697 ?auto_3711 ) ) ( not ( = ?auto_3697 ?auto_3709 ) ) ( not ( = ?auto_3705 ?auto_3708 ) ) ( not ( = ?auto_3705 ?auto_3704 ) ) ( not ( = ?auto_3706 ?auto_3710 ) ) ( not ( = ?auto_3706 ?auto_3703 ) ) ( not ( = ?auto_3707 ?auto_3711 ) ) ( not ( = ?auto_3707 ?auto_3709 ) ) ( not ( = ?auto_3694 ?auto_3698 ) ) ( not ( = ?auto_3694 ?auto_3699 ) ) ( not ( = ?auto_3695 ?auto_3698 ) ) ( not ( = ?auto_3695 ?auto_3699 ) ) ( not ( = ?auto_3696 ?auto_3698 ) ) ( not ( = ?auto_3696 ?auto_3699 ) ) ( not ( = ?auto_3698 ?auto_3707 ) ) ( not ( = ?auto_3698 ?auto_3711 ) ) ( not ( = ?auto_3698 ?auto_3709 ) ) ( not ( = ?auto_3699 ?auto_3707 ) ) ( not ( = ?auto_3699 ?auto_3711 ) ) ( not ( = ?auto_3699 ?auto_3709 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3694 ?auto_3695 ?auto_3696 ?auto_3697 )
      ( MAKE-1CRATE ?auto_3697 ?auto_3698 )
      ( MAKE-4CRATE-VERIFY ?auto_3694 ?auto_3695 ?auto_3696 ?auto_3697 ?auto_3698 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3714 - SURFACE
      ?auto_3715 - SURFACE
    )
    :vars
    (
      ?auto_3716 - HOIST
      ?auto_3717 - PLACE
      ?auto_3719 - PLACE
      ?auto_3720 - HOIST
      ?auto_3721 - SURFACE
      ?auto_3718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3716 ?auto_3717 ) ( SURFACE-AT ?auto_3714 ?auto_3717 ) ( CLEAR ?auto_3714 ) ( IS-CRATE ?auto_3715 ) ( AVAILABLE ?auto_3716 ) ( not ( = ?auto_3719 ?auto_3717 ) ) ( HOIST-AT ?auto_3720 ?auto_3719 ) ( AVAILABLE ?auto_3720 ) ( SURFACE-AT ?auto_3715 ?auto_3719 ) ( ON ?auto_3715 ?auto_3721 ) ( CLEAR ?auto_3715 ) ( TRUCK-AT ?auto_3718 ?auto_3717 ) ( not ( = ?auto_3714 ?auto_3715 ) ) ( not ( = ?auto_3714 ?auto_3721 ) ) ( not ( = ?auto_3715 ?auto_3721 ) ) ( not ( = ?auto_3716 ?auto_3720 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3718 ?auto_3717 ?auto_3719 )
      ( !LIFT ?auto_3720 ?auto_3715 ?auto_3721 ?auto_3719 )
      ( !LOAD ?auto_3720 ?auto_3715 ?auto_3718 ?auto_3719 )
      ( !DRIVE ?auto_3718 ?auto_3719 ?auto_3717 )
      ( !UNLOAD ?auto_3716 ?auto_3715 ?auto_3718 ?auto_3717 )
      ( !DROP ?auto_3716 ?auto_3715 ?auto_3714 ?auto_3717 )
      ( MAKE-1CRATE-VERIFY ?auto_3714 ?auto_3715 ) )
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
      ?auto_3736 - HOIST
      ?auto_3739 - PLACE
      ?auto_3734 - PLACE
      ?auto_3738 - HOIST
      ?auto_3737 - SURFACE
      ?auto_3749 - PLACE
      ?auto_3741 - HOIST
      ?auto_3748 - SURFACE
      ?auto_3743 - PLACE
      ?auto_3744 - HOIST
      ?auto_3742 - SURFACE
      ?auto_3740 - PLACE
      ?auto_3746 - HOIST
      ?auto_3747 - SURFACE
      ?auto_3745 - SURFACE
      ?auto_3735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3736 ?auto_3739 ) ( IS-CRATE ?auto_3733 ) ( not ( = ?auto_3734 ?auto_3739 ) ) ( HOIST-AT ?auto_3738 ?auto_3734 ) ( AVAILABLE ?auto_3738 ) ( SURFACE-AT ?auto_3733 ?auto_3734 ) ( ON ?auto_3733 ?auto_3737 ) ( CLEAR ?auto_3733 ) ( not ( = ?auto_3732 ?auto_3733 ) ) ( not ( = ?auto_3732 ?auto_3737 ) ) ( not ( = ?auto_3733 ?auto_3737 ) ) ( not ( = ?auto_3736 ?auto_3738 ) ) ( IS-CRATE ?auto_3732 ) ( not ( = ?auto_3749 ?auto_3739 ) ) ( HOIST-AT ?auto_3741 ?auto_3749 ) ( SURFACE-AT ?auto_3732 ?auto_3749 ) ( ON ?auto_3732 ?auto_3748 ) ( CLEAR ?auto_3732 ) ( not ( = ?auto_3731 ?auto_3732 ) ) ( not ( = ?auto_3731 ?auto_3748 ) ) ( not ( = ?auto_3732 ?auto_3748 ) ) ( not ( = ?auto_3736 ?auto_3741 ) ) ( IS-CRATE ?auto_3731 ) ( not ( = ?auto_3743 ?auto_3739 ) ) ( HOIST-AT ?auto_3744 ?auto_3743 ) ( AVAILABLE ?auto_3744 ) ( SURFACE-AT ?auto_3731 ?auto_3743 ) ( ON ?auto_3731 ?auto_3742 ) ( CLEAR ?auto_3731 ) ( not ( = ?auto_3730 ?auto_3731 ) ) ( not ( = ?auto_3730 ?auto_3742 ) ) ( not ( = ?auto_3731 ?auto_3742 ) ) ( not ( = ?auto_3736 ?auto_3744 ) ) ( IS-CRATE ?auto_3730 ) ( not ( = ?auto_3740 ?auto_3739 ) ) ( HOIST-AT ?auto_3746 ?auto_3740 ) ( AVAILABLE ?auto_3746 ) ( SURFACE-AT ?auto_3730 ?auto_3740 ) ( ON ?auto_3730 ?auto_3747 ) ( CLEAR ?auto_3730 ) ( not ( = ?auto_3729 ?auto_3730 ) ) ( not ( = ?auto_3729 ?auto_3747 ) ) ( not ( = ?auto_3730 ?auto_3747 ) ) ( not ( = ?auto_3736 ?auto_3746 ) ) ( SURFACE-AT ?auto_3728 ?auto_3739 ) ( CLEAR ?auto_3728 ) ( IS-CRATE ?auto_3729 ) ( AVAILABLE ?auto_3736 ) ( AVAILABLE ?auto_3741 ) ( SURFACE-AT ?auto_3729 ?auto_3749 ) ( ON ?auto_3729 ?auto_3745 ) ( CLEAR ?auto_3729 ) ( TRUCK-AT ?auto_3735 ?auto_3739 ) ( not ( = ?auto_3728 ?auto_3729 ) ) ( not ( = ?auto_3728 ?auto_3745 ) ) ( not ( = ?auto_3729 ?auto_3745 ) ) ( not ( = ?auto_3728 ?auto_3730 ) ) ( not ( = ?auto_3728 ?auto_3747 ) ) ( not ( = ?auto_3730 ?auto_3745 ) ) ( not ( = ?auto_3740 ?auto_3749 ) ) ( not ( = ?auto_3746 ?auto_3741 ) ) ( not ( = ?auto_3747 ?auto_3745 ) ) ( not ( = ?auto_3728 ?auto_3731 ) ) ( not ( = ?auto_3728 ?auto_3742 ) ) ( not ( = ?auto_3729 ?auto_3731 ) ) ( not ( = ?auto_3729 ?auto_3742 ) ) ( not ( = ?auto_3731 ?auto_3747 ) ) ( not ( = ?auto_3731 ?auto_3745 ) ) ( not ( = ?auto_3743 ?auto_3740 ) ) ( not ( = ?auto_3743 ?auto_3749 ) ) ( not ( = ?auto_3744 ?auto_3746 ) ) ( not ( = ?auto_3744 ?auto_3741 ) ) ( not ( = ?auto_3742 ?auto_3747 ) ) ( not ( = ?auto_3742 ?auto_3745 ) ) ( not ( = ?auto_3728 ?auto_3732 ) ) ( not ( = ?auto_3728 ?auto_3748 ) ) ( not ( = ?auto_3729 ?auto_3732 ) ) ( not ( = ?auto_3729 ?auto_3748 ) ) ( not ( = ?auto_3730 ?auto_3732 ) ) ( not ( = ?auto_3730 ?auto_3748 ) ) ( not ( = ?auto_3732 ?auto_3742 ) ) ( not ( = ?auto_3732 ?auto_3747 ) ) ( not ( = ?auto_3732 ?auto_3745 ) ) ( not ( = ?auto_3748 ?auto_3742 ) ) ( not ( = ?auto_3748 ?auto_3747 ) ) ( not ( = ?auto_3748 ?auto_3745 ) ) ( not ( = ?auto_3728 ?auto_3733 ) ) ( not ( = ?auto_3728 ?auto_3737 ) ) ( not ( = ?auto_3729 ?auto_3733 ) ) ( not ( = ?auto_3729 ?auto_3737 ) ) ( not ( = ?auto_3730 ?auto_3733 ) ) ( not ( = ?auto_3730 ?auto_3737 ) ) ( not ( = ?auto_3731 ?auto_3733 ) ) ( not ( = ?auto_3731 ?auto_3737 ) ) ( not ( = ?auto_3733 ?auto_3748 ) ) ( not ( = ?auto_3733 ?auto_3742 ) ) ( not ( = ?auto_3733 ?auto_3747 ) ) ( not ( = ?auto_3733 ?auto_3745 ) ) ( not ( = ?auto_3734 ?auto_3749 ) ) ( not ( = ?auto_3734 ?auto_3743 ) ) ( not ( = ?auto_3734 ?auto_3740 ) ) ( not ( = ?auto_3738 ?auto_3741 ) ) ( not ( = ?auto_3738 ?auto_3744 ) ) ( not ( = ?auto_3738 ?auto_3746 ) ) ( not ( = ?auto_3737 ?auto_3748 ) ) ( not ( = ?auto_3737 ?auto_3742 ) ) ( not ( = ?auto_3737 ?auto_3747 ) ) ( not ( = ?auto_3737 ?auto_3745 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3728 ?auto_3729 ?auto_3730 ?auto_3731 ?auto_3732 )
      ( MAKE-1CRATE ?auto_3732 ?auto_3733 )
      ( MAKE-5CRATE-VERIFY ?auto_3728 ?auto_3729 ?auto_3730 ?auto_3731 ?auto_3732 ?auto_3733 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3752 - SURFACE
      ?auto_3753 - SURFACE
    )
    :vars
    (
      ?auto_3754 - HOIST
      ?auto_3755 - PLACE
      ?auto_3757 - PLACE
      ?auto_3758 - HOIST
      ?auto_3759 - SURFACE
      ?auto_3756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3754 ?auto_3755 ) ( SURFACE-AT ?auto_3752 ?auto_3755 ) ( CLEAR ?auto_3752 ) ( IS-CRATE ?auto_3753 ) ( AVAILABLE ?auto_3754 ) ( not ( = ?auto_3757 ?auto_3755 ) ) ( HOIST-AT ?auto_3758 ?auto_3757 ) ( AVAILABLE ?auto_3758 ) ( SURFACE-AT ?auto_3753 ?auto_3757 ) ( ON ?auto_3753 ?auto_3759 ) ( CLEAR ?auto_3753 ) ( TRUCK-AT ?auto_3756 ?auto_3755 ) ( not ( = ?auto_3752 ?auto_3753 ) ) ( not ( = ?auto_3752 ?auto_3759 ) ) ( not ( = ?auto_3753 ?auto_3759 ) ) ( not ( = ?auto_3754 ?auto_3758 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3756 ?auto_3755 ?auto_3757 )
      ( !LIFT ?auto_3758 ?auto_3753 ?auto_3759 ?auto_3757 )
      ( !LOAD ?auto_3758 ?auto_3753 ?auto_3756 ?auto_3757 )
      ( !DRIVE ?auto_3756 ?auto_3757 ?auto_3755 )
      ( !UNLOAD ?auto_3754 ?auto_3753 ?auto_3756 ?auto_3755 )
      ( !DROP ?auto_3754 ?auto_3753 ?auto_3752 ?auto_3755 )
      ( MAKE-1CRATE-VERIFY ?auto_3752 ?auto_3753 ) )
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
      ?auto_3774 - HOIST
      ?auto_3779 - PLACE
      ?auto_3778 - PLACE
      ?auto_3776 - HOIST
      ?auto_3777 - SURFACE
      ?auto_3792 - PLACE
      ?auto_3780 - HOIST
      ?auto_3791 - SURFACE
      ?auto_3786 - PLACE
      ?auto_3785 - HOIST
      ?auto_3782 - SURFACE
      ?auto_3784 - PLACE
      ?auto_3789 - HOIST
      ?auto_3790 - SURFACE
      ?auto_3781 - PLACE
      ?auto_3787 - HOIST
      ?auto_3788 - SURFACE
      ?auto_3783 - SURFACE
      ?auto_3775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3774 ?auto_3779 ) ( IS-CRATE ?auto_3773 ) ( not ( = ?auto_3778 ?auto_3779 ) ) ( HOIST-AT ?auto_3776 ?auto_3778 ) ( AVAILABLE ?auto_3776 ) ( SURFACE-AT ?auto_3773 ?auto_3778 ) ( ON ?auto_3773 ?auto_3777 ) ( CLEAR ?auto_3773 ) ( not ( = ?auto_3772 ?auto_3773 ) ) ( not ( = ?auto_3772 ?auto_3777 ) ) ( not ( = ?auto_3773 ?auto_3777 ) ) ( not ( = ?auto_3774 ?auto_3776 ) ) ( IS-CRATE ?auto_3772 ) ( not ( = ?auto_3792 ?auto_3779 ) ) ( HOIST-AT ?auto_3780 ?auto_3792 ) ( AVAILABLE ?auto_3780 ) ( SURFACE-AT ?auto_3772 ?auto_3792 ) ( ON ?auto_3772 ?auto_3791 ) ( CLEAR ?auto_3772 ) ( not ( = ?auto_3771 ?auto_3772 ) ) ( not ( = ?auto_3771 ?auto_3791 ) ) ( not ( = ?auto_3772 ?auto_3791 ) ) ( not ( = ?auto_3774 ?auto_3780 ) ) ( IS-CRATE ?auto_3771 ) ( not ( = ?auto_3786 ?auto_3779 ) ) ( HOIST-AT ?auto_3785 ?auto_3786 ) ( SURFACE-AT ?auto_3771 ?auto_3786 ) ( ON ?auto_3771 ?auto_3782 ) ( CLEAR ?auto_3771 ) ( not ( = ?auto_3770 ?auto_3771 ) ) ( not ( = ?auto_3770 ?auto_3782 ) ) ( not ( = ?auto_3771 ?auto_3782 ) ) ( not ( = ?auto_3774 ?auto_3785 ) ) ( IS-CRATE ?auto_3770 ) ( not ( = ?auto_3784 ?auto_3779 ) ) ( HOIST-AT ?auto_3789 ?auto_3784 ) ( AVAILABLE ?auto_3789 ) ( SURFACE-AT ?auto_3770 ?auto_3784 ) ( ON ?auto_3770 ?auto_3790 ) ( CLEAR ?auto_3770 ) ( not ( = ?auto_3769 ?auto_3770 ) ) ( not ( = ?auto_3769 ?auto_3790 ) ) ( not ( = ?auto_3770 ?auto_3790 ) ) ( not ( = ?auto_3774 ?auto_3789 ) ) ( IS-CRATE ?auto_3769 ) ( not ( = ?auto_3781 ?auto_3779 ) ) ( HOIST-AT ?auto_3787 ?auto_3781 ) ( AVAILABLE ?auto_3787 ) ( SURFACE-AT ?auto_3769 ?auto_3781 ) ( ON ?auto_3769 ?auto_3788 ) ( CLEAR ?auto_3769 ) ( not ( = ?auto_3768 ?auto_3769 ) ) ( not ( = ?auto_3768 ?auto_3788 ) ) ( not ( = ?auto_3769 ?auto_3788 ) ) ( not ( = ?auto_3774 ?auto_3787 ) ) ( SURFACE-AT ?auto_3767 ?auto_3779 ) ( CLEAR ?auto_3767 ) ( IS-CRATE ?auto_3768 ) ( AVAILABLE ?auto_3774 ) ( AVAILABLE ?auto_3785 ) ( SURFACE-AT ?auto_3768 ?auto_3786 ) ( ON ?auto_3768 ?auto_3783 ) ( CLEAR ?auto_3768 ) ( TRUCK-AT ?auto_3775 ?auto_3779 ) ( not ( = ?auto_3767 ?auto_3768 ) ) ( not ( = ?auto_3767 ?auto_3783 ) ) ( not ( = ?auto_3768 ?auto_3783 ) ) ( not ( = ?auto_3767 ?auto_3769 ) ) ( not ( = ?auto_3767 ?auto_3788 ) ) ( not ( = ?auto_3769 ?auto_3783 ) ) ( not ( = ?auto_3781 ?auto_3786 ) ) ( not ( = ?auto_3787 ?auto_3785 ) ) ( not ( = ?auto_3788 ?auto_3783 ) ) ( not ( = ?auto_3767 ?auto_3770 ) ) ( not ( = ?auto_3767 ?auto_3790 ) ) ( not ( = ?auto_3768 ?auto_3770 ) ) ( not ( = ?auto_3768 ?auto_3790 ) ) ( not ( = ?auto_3770 ?auto_3788 ) ) ( not ( = ?auto_3770 ?auto_3783 ) ) ( not ( = ?auto_3784 ?auto_3781 ) ) ( not ( = ?auto_3784 ?auto_3786 ) ) ( not ( = ?auto_3789 ?auto_3787 ) ) ( not ( = ?auto_3789 ?auto_3785 ) ) ( not ( = ?auto_3790 ?auto_3788 ) ) ( not ( = ?auto_3790 ?auto_3783 ) ) ( not ( = ?auto_3767 ?auto_3771 ) ) ( not ( = ?auto_3767 ?auto_3782 ) ) ( not ( = ?auto_3768 ?auto_3771 ) ) ( not ( = ?auto_3768 ?auto_3782 ) ) ( not ( = ?auto_3769 ?auto_3771 ) ) ( not ( = ?auto_3769 ?auto_3782 ) ) ( not ( = ?auto_3771 ?auto_3790 ) ) ( not ( = ?auto_3771 ?auto_3788 ) ) ( not ( = ?auto_3771 ?auto_3783 ) ) ( not ( = ?auto_3782 ?auto_3790 ) ) ( not ( = ?auto_3782 ?auto_3788 ) ) ( not ( = ?auto_3782 ?auto_3783 ) ) ( not ( = ?auto_3767 ?auto_3772 ) ) ( not ( = ?auto_3767 ?auto_3791 ) ) ( not ( = ?auto_3768 ?auto_3772 ) ) ( not ( = ?auto_3768 ?auto_3791 ) ) ( not ( = ?auto_3769 ?auto_3772 ) ) ( not ( = ?auto_3769 ?auto_3791 ) ) ( not ( = ?auto_3770 ?auto_3772 ) ) ( not ( = ?auto_3770 ?auto_3791 ) ) ( not ( = ?auto_3772 ?auto_3782 ) ) ( not ( = ?auto_3772 ?auto_3790 ) ) ( not ( = ?auto_3772 ?auto_3788 ) ) ( not ( = ?auto_3772 ?auto_3783 ) ) ( not ( = ?auto_3792 ?auto_3786 ) ) ( not ( = ?auto_3792 ?auto_3784 ) ) ( not ( = ?auto_3792 ?auto_3781 ) ) ( not ( = ?auto_3780 ?auto_3785 ) ) ( not ( = ?auto_3780 ?auto_3789 ) ) ( not ( = ?auto_3780 ?auto_3787 ) ) ( not ( = ?auto_3791 ?auto_3782 ) ) ( not ( = ?auto_3791 ?auto_3790 ) ) ( not ( = ?auto_3791 ?auto_3788 ) ) ( not ( = ?auto_3791 ?auto_3783 ) ) ( not ( = ?auto_3767 ?auto_3773 ) ) ( not ( = ?auto_3767 ?auto_3777 ) ) ( not ( = ?auto_3768 ?auto_3773 ) ) ( not ( = ?auto_3768 ?auto_3777 ) ) ( not ( = ?auto_3769 ?auto_3773 ) ) ( not ( = ?auto_3769 ?auto_3777 ) ) ( not ( = ?auto_3770 ?auto_3773 ) ) ( not ( = ?auto_3770 ?auto_3777 ) ) ( not ( = ?auto_3771 ?auto_3773 ) ) ( not ( = ?auto_3771 ?auto_3777 ) ) ( not ( = ?auto_3773 ?auto_3791 ) ) ( not ( = ?auto_3773 ?auto_3782 ) ) ( not ( = ?auto_3773 ?auto_3790 ) ) ( not ( = ?auto_3773 ?auto_3788 ) ) ( not ( = ?auto_3773 ?auto_3783 ) ) ( not ( = ?auto_3778 ?auto_3792 ) ) ( not ( = ?auto_3778 ?auto_3786 ) ) ( not ( = ?auto_3778 ?auto_3784 ) ) ( not ( = ?auto_3778 ?auto_3781 ) ) ( not ( = ?auto_3776 ?auto_3780 ) ) ( not ( = ?auto_3776 ?auto_3785 ) ) ( not ( = ?auto_3776 ?auto_3789 ) ) ( not ( = ?auto_3776 ?auto_3787 ) ) ( not ( = ?auto_3777 ?auto_3791 ) ) ( not ( = ?auto_3777 ?auto_3782 ) ) ( not ( = ?auto_3777 ?auto_3790 ) ) ( not ( = ?auto_3777 ?auto_3788 ) ) ( not ( = ?auto_3777 ?auto_3783 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3767 ?auto_3768 ?auto_3769 ?auto_3770 ?auto_3771 ?auto_3772 )
      ( MAKE-1CRATE ?auto_3772 ?auto_3773 )
      ( MAKE-6CRATE-VERIFY ?auto_3767 ?auto_3768 ?auto_3769 ?auto_3770 ?auto_3771 ?auto_3772 ?auto_3773 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3795 - SURFACE
      ?auto_3796 - SURFACE
    )
    :vars
    (
      ?auto_3797 - HOIST
      ?auto_3798 - PLACE
      ?auto_3800 - PLACE
      ?auto_3801 - HOIST
      ?auto_3802 - SURFACE
      ?auto_3799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3797 ?auto_3798 ) ( SURFACE-AT ?auto_3795 ?auto_3798 ) ( CLEAR ?auto_3795 ) ( IS-CRATE ?auto_3796 ) ( AVAILABLE ?auto_3797 ) ( not ( = ?auto_3800 ?auto_3798 ) ) ( HOIST-AT ?auto_3801 ?auto_3800 ) ( AVAILABLE ?auto_3801 ) ( SURFACE-AT ?auto_3796 ?auto_3800 ) ( ON ?auto_3796 ?auto_3802 ) ( CLEAR ?auto_3796 ) ( TRUCK-AT ?auto_3799 ?auto_3798 ) ( not ( = ?auto_3795 ?auto_3796 ) ) ( not ( = ?auto_3795 ?auto_3802 ) ) ( not ( = ?auto_3796 ?auto_3802 ) ) ( not ( = ?auto_3797 ?auto_3801 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3799 ?auto_3798 ?auto_3800 )
      ( !LIFT ?auto_3801 ?auto_3796 ?auto_3802 ?auto_3800 )
      ( !LOAD ?auto_3801 ?auto_3796 ?auto_3799 ?auto_3800 )
      ( !DRIVE ?auto_3799 ?auto_3800 ?auto_3798 )
      ( !UNLOAD ?auto_3797 ?auto_3796 ?auto_3799 ?auto_3798 )
      ( !DROP ?auto_3797 ?auto_3796 ?auto_3795 ?auto_3798 )
      ( MAKE-1CRATE-VERIFY ?auto_3795 ?auto_3796 ) )
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
      ?auto_3820 - HOIST
      ?auto_3819 - PLACE
      ?auto_3824 - PLACE
      ?auto_3822 - HOIST
      ?auto_3823 - SURFACE
      ?auto_3838 - PLACE
      ?auto_3826 - HOIST
      ?auto_3825 - SURFACE
      ?auto_3832 - SURFACE
      ?auto_3834 - PLACE
      ?auto_3835 - HOIST
      ?auto_3827 - SURFACE
      ?auto_3836 - PLACE
      ?auto_3831 - HOIST
      ?auto_3830 - SURFACE
      ?auto_3837 - PLACE
      ?auto_3833 - HOIST
      ?auto_3829 - SURFACE
      ?auto_3828 - SURFACE
      ?auto_3821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3820 ?auto_3819 ) ( IS-CRATE ?auto_3818 ) ( not ( = ?auto_3824 ?auto_3819 ) ) ( HOIST-AT ?auto_3822 ?auto_3824 ) ( SURFACE-AT ?auto_3818 ?auto_3824 ) ( ON ?auto_3818 ?auto_3823 ) ( CLEAR ?auto_3818 ) ( not ( = ?auto_3817 ?auto_3818 ) ) ( not ( = ?auto_3817 ?auto_3823 ) ) ( not ( = ?auto_3818 ?auto_3823 ) ) ( not ( = ?auto_3820 ?auto_3822 ) ) ( IS-CRATE ?auto_3817 ) ( not ( = ?auto_3838 ?auto_3819 ) ) ( HOIST-AT ?auto_3826 ?auto_3838 ) ( AVAILABLE ?auto_3826 ) ( SURFACE-AT ?auto_3817 ?auto_3838 ) ( ON ?auto_3817 ?auto_3825 ) ( CLEAR ?auto_3817 ) ( not ( = ?auto_3816 ?auto_3817 ) ) ( not ( = ?auto_3816 ?auto_3825 ) ) ( not ( = ?auto_3817 ?auto_3825 ) ) ( not ( = ?auto_3820 ?auto_3826 ) ) ( IS-CRATE ?auto_3816 ) ( AVAILABLE ?auto_3822 ) ( SURFACE-AT ?auto_3816 ?auto_3824 ) ( ON ?auto_3816 ?auto_3832 ) ( CLEAR ?auto_3816 ) ( not ( = ?auto_3815 ?auto_3816 ) ) ( not ( = ?auto_3815 ?auto_3832 ) ) ( not ( = ?auto_3816 ?auto_3832 ) ) ( IS-CRATE ?auto_3815 ) ( not ( = ?auto_3834 ?auto_3819 ) ) ( HOIST-AT ?auto_3835 ?auto_3834 ) ( SURFACE-AT ?auto_3815 ?auto_3834 ) ( ON ?auto_3815 ?auto_3827 ) ( CLEAR ?auto_3815 ) ( not ( = ?auto_3814 ?auto_3815 ) ) ( not ( = ?auto_3814 ?auto_3827 ) ) ( not ( = ?auto_3815 ?auto_3827 ) ) ( not ( = ?auto_3820 ?auto_3835 ) ) ( IS-CRATE ?auto_3814 ) ( not ( = ?auto_3836 ?auto_3819 ) ) ( HOIST-AT ?auto_3831 ?auto_3836 ) ( AVAILABLE ?auto_3831 ) ( SURFACE-AT ?auto_3814 ?auto_3836 ) ( ON ?auto_3814 ?auto_3830 ) ( CLEAR ?auto_3814 ) ( not ( = ?auto_3813 ?auto_3814 ) ) ( not ( = ?auto_3813 ?auto_3830 ) ) ( not ( = ?auto_3814 ?auto_3830 ) ) ( not ( = ?auto_3820 ?auto_3831 ) ) ( IS-CRATE ?auto_3813 ) ( not ( = ?auto_3837 ?auto_3819 ) ) ( HOIST-AT ?auto_3833 ?auto_3837 ) ( AVAILABLE ?auto_3833 ) ( SURFACE-AT ?auto_3813 ?auto_3837 ) ( ON ?auto_3813 ?auto_3829 ) ( CLEAR ?auto_3813 ) ( not ( = ?auto_3812 ?auto_3813 ) ) ( not ( = ?auto_3812 ?auto_3829 ) ) ( not ( = ?auto_3813 ?auto_3829 ) ) ( not ( = ?auto_3820 ?auto_3833 ) ) ( SURFACE-AT ?auto_3811 ?auto_3819 ) ( CLEAR ?auto_3811 ) ( IS-CRATE ?auto_3812 ) ( AVAILABLE ?auto_3820 ) ( AVAILABLE ?auto_3835 ) ( SURFACE-AT ?auto_3812 ?auto_3834 ) ( ON ?auto_3812 ?auto_3828 ) ( CLEAR ?auto_3812 ) ( TRUCK-AT ?auto_3821 ?auto_3819 ) ( not ( = ?auto_3811 ?auto_3812 ) ) ( not ( = ?auto_3811 ?auto_3828 ) ) ( not ( = ?auto_3812 ?auto_3828 ) ) ( not ( = ?auto_3811 ?auto_3813 ) ) ( not ( = ?auto_3811 ?auto_3829 ) ) ( not ( = ?auto_3813 ?auto_3828 ) ) ( not ( = ?auto_3837 ?auto_3834 ) ) ( not ( = ?auto_3833 ?auto_3835 ) ) ( not ( = ?auto_3829 ?auto_3828 ) ) ( not ( = ?auto_3811 ?auto_3814 ) ) ( not ( = ?auto_3811 ?auto_3830 ) ) ( not ( = ?auto_3812 ?auto_3814 ) ) ( not ( = ?auto_3812 ?auto_3830 ) ) ( not ( = ?auto_3814 ?auto_3829 ) ) ( not ( = ?auto_3814 ?auto_3828 ) ) ( not ( = ?auto_3836 ?auto_3837 ) ) ( not ( = ?auto_3836 ?auto_3834 ) ) ( not ( = ?auto_3831 ?auto_3833 ) ) ( not ( = ?auto_3831 ?auto_3835 ) ) ( not ( = ?auto_3830 ?auto_3829 ) ) ( not ( = ?auto_3830 ?auto_3828 ) ) ( not ( = ?auto_3811 ?auto_3815 ) ) ( not ( = ?auto_3811 ?auto_3827 ) ) ( not ( = ?auto_3812 ?auto_3815 ) ) ( not ( = ?auto_3812 ?auto_3827 ) ) ( not ( = ?auto_3813 ?auto_3815 ) ) ( not ( = ?auto_3813 ?auto_3827 ) ) ( not ( = ?auto_3815 ?auto_3830 ) ) ( not ( = ?auto_3815 ?auto_3829 ) ) ( not ( = ?auto_3815 ?auto_3828 ) ) ( not ( = ?auto_3827 ?auto_3830 ) ) ( not ( = ?auto_3827 ?auto_3829 ) ) ( not ( = ?auto_3827 ?auto_3828 ) ) ( not ( = ?auto_3811 ?auto_3816 ) ) ( not ( = ?auto_3811 ?auto_3832 ) ) ( not ( = ?auto_3812 ?auto_3816 ) ) ( not ( = ?auto_3812 ?auto_3832 ) ) ( not ( = ?auto_3813 ?auto_3816 ) ) ( not ( = ?auto_3813 ?auto_3832 ) ) ( not ( = ?auto_3814 ?auto_3816 ) ) ( not ( = ?auto_3814 ?auto_3832 ) ) ( not ( = ?auto_3816 ?auto_3827 ) ) ( not ( = ?auto_3816 ?auto_3830 ) ) ( not ( = ?auto_3816 ?auto_3829 ) ) ( not ( = ?auto_3816 ?auto_3828 ) ) ( not ( = ?auto_3824 ?auto_3834 ) ) ( not ( = ?auto_3824 ?auto_3836 ) ) ( not ( = ?auto_3824 ?auto_3837 ) ) ( not ( = ?auto_3822 ?auto_3835 ) ) ( not ( = ?auto_3822 ?auto_3831 ) ) ( not ( = ?auto_3822 ?auto_3833 ) ) ( not ( = ?auto_3832 ?auto_3827 ) ) ( not ( = ?auto_3832 ?auto_3830 ) ) ( not ( = ?auto_3832 ?auto_3829 ) ) ( not ( = ?auto_3832 ?auto_3828 ) ) ( not ( = ?auto_3811 ?auto_3817 ) ) ( not ( = ?auto_3811 ?auto_3825 ) ) ( not ( = ?auto_3812 ?auto_3817 ) ) ( not ( = ?auto_3812 ?auto_3825 ) ) ( not ( = ?auto_3813 ?auto_3817 ) ) ( not ( = ?auto_3813 ?auto_3825 ) ) ( not ( = ?auto_3814 ?auto_3817 ) ) ( not ( = ?auto_3814 ?auto_3825 ) ) ( not ( = ?auto_3815 ?auto_3817 ) ) ( not ( = ?auto_3815 ?auto_3825 ) ) ( not ( = ?auto_3817 ?auto_3832 ) ) ( not ( = ?auto_3817 ?auto_3827 ) ) ( not ( = ?auto_3817 ?auto_3830 ) ) ( not ( = ?auto_3817 ?auto_3829 ) ) ( not ( = ?auto_3817 ?auto_3828 ) ) ( not ( = ?auto_3838 ?auto_3824 ) ) ( not ( = ?auto_3838 ?auto_3834 ) ) ( not ( = ?auto_3838 ?auto_3836 ) ) ( not ( = ?auto_3838 ?auto_3837 ) ) ( not ( = ?auto_3826 ?auto_3822 ) ) ( not ( = ?auto_3826 ?auto_3835 ) ) ( not ( = ?auto_3826 ?auto_3831 ) ) ( not ( = ?auto_3826 ?auto_3833 ) ) ( not ( = ?auto_3825 ?auto_3832 ) ) ( not ( = ?auto_3825 ?auto_3827 ) ) ( not ( = ?auto_3825 ?auto_3830 ) ) ( not ( = ?auto_3825 ?auto_3829 ) ) ( not ( = ?auto_3825 ?auto_3828 ) ) ( not ( = ?auto_3811 ?auto_3818 ) ) ( not ( = ?auto_3811 ?auto_3823 ) ) ( not ( = ?auto_3812 ?auto_3818 ) ) ( not ( = ?auto_3812 ?auto_3823 ) ) ( not ( = ?auto_3813 ?auto_3818 ) ) ( not ( = ?auto_3813 ?auto_3823 ) ) ( not ( = ?auto_3814 ?auto_3818 ) ) ( not ( = ?auto_3814 ?auto_3823 ) ) ( not ( = ?auto_3815 ?auto_3818 ) ) ( not ( = ?auto_3815 ?auto_3823 ) ) ( not ( = ?auto_3816 ?auto_3818 ) ) ( not ( = ?auto_3816 ?auto_3823 ) ) ( not ( = ?auto_3818 ?auto_3825 ) ) ( not ( = ?auto_3818 ?auto_3832 ) ) ( not ( = ?auto_3818 ?auto_3827 ) ) ( not ( = ?auto_3818 ?auto_3830 ) ) ( not ( = ?auto_3818 ?auto_3829 ) ) ( not ( = ?auto_3818 ?auto_3828 ) ) ( not ( = ?auto_3823 ?auto_3825 ) ) ( not ( = ?auto_3823 ?auto_3832 ) ) ( not ( = ?auto_3823 ?auto_3827 ) ) ( not ( = ?auto_3823 ?auto_3830 ) ) ( not ( = ?auto_3823 ?auto_3829 ) ) ( not ( = ?auto_3823 ?auto_3828 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3811 ?auto_3812 ?auto_3813 ?auto_3814 ?auto_3815 ?auto_3816 ?auto_3817 )
      ( MAKE-1CRATE ?auto_3817 ?auto_3818 )
      ( MAKE-7CRATE-VERIFY ?auto_3811 ?auto_3812 ?auto_3813 ?auto_3814 ?auto_3815 ?auto_3816 ?auto_3817 ?auto_3818 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3841 - SURFACE
      ?auto_3842 - SURFACE
    )
    :vars
    (
      ?auto_3843 - HOIST
      ?auto_3844 - PLACE
      ?auto_3846 - PLACE
      ?auto_3847 - HOIST
      ?auto_3848 - SURFACE
      ?auto_3845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3843 ?auto_3844 ) ( SURFACE-AT ?auto_3841 ?auto_3844 ) ( CLEAR ?auto_3841 ) ( IS-CRATE ?auto_3842 ) ( AVAILABLE ?auto_3843 ) ( not ( = ?auto_3846 ?auto_3844 ) ) ( HOIST-AT ?auto_3847 ?auto_3846 ) ( AVAILABLE ?auto_3847 ) ( SURFACE-AT ?auto_3842 ?auto_3846 ) ( ON ?auto_3842 ?auto_3848 ) ( CLEAR ?auto_3842 ) ( TRUCK-AT ?auto_3845 ?auto_3844 ) ( not ( = ?auto_3841 ?auto_3842 ) ) ( not ( = ?auto_3841 ?auto_3848 ) ) ( not ( = ?auto_3842 ?auto_3848 ) ) ( not ( = ?auto_3843 ?auto_3847 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3845 ?auto_3844 ?auto_3846 )
      ( !LIFT ?auto_3847 ?auto_3842 ?auto_3848 ?auto_3846 )
      ( !LOAD ?auto_3847 ?auto_3842 ?auto_3845 ?auto_3846 )
      ( !DRIVE ?auto_3845 ?auto_3846 ?auto_3844 )
      ( !UNLOAD ?auto_3843 ?auto_3842 ?auto_3845 ?auto_3844 )
      ( !DROP ?auto_3843 ?auto_3842 ?auto_3841 ?auto_3844 )
      ( MAKE-1CRATE-VERIFY ?auto_3841 ?auto_3842 ) )
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
      ?auto_3866 - SURFACE
      ?auto_3865 - SURFACE
    )
    :vars
    (
      ?auto_3868 - HOIST
      ?auto_3867 - PLACE
      ?auto_3870 - PLACE
      ?auto_3871 - HOIST
      ?auto_3872 - SURFACE
      ?auto_3877 - PLACE
      ?auto_3887 - HOIST
      ?auto_3875 - SURFACE
      ?auto_3882 - PLACE
      ?auto_3876 - HOIST
      ?auto_3878 - SURFACE
      ?auto_3883 - SURFACE
      ?auto_3880 - PLACE
      ?auto_3879 - HOIST
      ?auto_3873 - SURFACE
      ?auto_3881 - PLACE
      ?auto_3884 - HOIST
      ?auto_3885 - SURFACE
      ?auto_3886 - SURFACE
      ?auto_3874 - SURFACE
      ?auto_3869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3868 ?auto_3867 ) ( IS-CRATE ?auto_3865 ) ( not ( = ?auto_3870 ?auto_3867 ) ) ( HOIST-AT ?auto_3871 ?auto_3870 ) ( SURFACE-AT ?auto_3865 ?auto_3870 ) ( ON ?auto_3865 ?auto_3872 ) ( CLEAR ?auto_3865 ) ( not ( = ?auto_3866 ?auto_3865 ) ) ( not ( = ?auto_3866 ?auto_3872 ) ) ( not ( = ?auto_3865 ?auto_3872 ) ) ( not ( = ?auto_3868 ?auto_3871 ) ) ( IS-CRATE ?auto_3866 ) ( not ( = ?auto_3877 ?auto_3867 ) ) ( HOIST-AT ?auto_3887 ?auto_3877 ) ( SURFACE-AT ?auto_3866 ?auto_3877 ) ( ON ?auto_3866 ?auto_3875 ) ( CLEAR ?auto_3866 ) ( not ( = ?auto_3864 ?auto_3866 ) ) ( not ( = ?auto_3864 ?auto_3875 ) ) ( not ( = ?auto_3866 ?auto_3875 ) ) ( not ( = ?auto_3868 ?auto_3887 ) ) ( IS-CRATE ?auto_3864 ) ( not ( = ?auto_3882 ?auto_3867 ) ) ( HOIST-AT ?auto_3876 ?auto_3882 ) ( AVAILABLE ?auto_3876 ) ( SURFACE-AT ?auto_3864 ?auto_3882 ) ( ON ?auto_3864 ?auto_3878 ) ( CLEAR ?auto_3864 ) ( not ( = ?auto_3863 ?auto_3864 ) ) ( not ( = ?auto_3863 ?auto_3878 ) ) ( not ( = ?auto_3864 ?auto_3878 ) ) ( not ( = ?auto_3868 ?auto_3876 ) ) ( IS-CRATE ?auto_3863 ) ( AVAILABLE ?auto_3887 ) ( SURFACE-AT ?auto_3863 ?auto_3877 ) ( ON ?auto_3863 ?auto_3883 ) ( CLEAR ?auto_3863 ) ( not ( = ?auto_3862 ?auto_3863 ) ) ( not ( = ?auto_3862 ?auto_3883 ) ) ( not ( = ?auto_3863 ?auto_3883 ) ) ( IS-CRATE ?auto_3862 ) ( not ( = ?auto_3880 ?auto_3867 ) ) ( HOIST-AT ?auto_3879 ?auto_3880 ) ( SURFACE-AT ?auto_3862 ?auto_3880 ) ( ON ?auto_3862 ?auto_3873 ) ( CLEAR ?auto_3862 ) ( not ( = ?auto_3861 ?auto_3862 ) ) ( not ( = ?auto_3861 ?auto_3873 ) ) ( not ( = ?auto_3862 ?auto_3873 ) ) ( not ( = ?auto_3868 ?auto_3879 ) ) ( IS-CRATE ?auto_3861 ) ( not ( = ?auto_3881 ?auto_3867 ) ) ( HOIST-AT ?auto_3884 ?auto_3881 ) ( AVAILABLE ?auto_3884 ) ( SURFACE-AT ?auto_3861 ?auto_3881 ) ( ON ?auto_3861 ?auto_3885 ) ( CLEAR ?auto_3861 ) ( not ( = ?auto_3860 ?auto_3861 ) ) ( not ( = ?auto_3860 ?auto_3885 ) ) ( not ( = ?auto_3861 ?auto_3885 ) ) ( not ( = ?auto_3868 ?auto_3884 ) ) ( IS-CRATE ?auto_3860 ) ( AVAILABLE ?auto_3871 ) ( SURFACE-AT ?auto_3860 ?auto_3870 ) ( ON ?auto_3860 ?auto_3886 ) ( CLEAR ?auto_3860 ) ( not ( = ?auto_3859 ?auto_3860 ) ) ( not ( = ?auto_3859 ?auto_3886 ) ) ( not ( = ?auto_3860 ?auto_3886 ) ) ( SURFACE-AT ?auto_3858 ?auto_3867 ) ( CLEAR ?auto_3858 ) ( IS-CRATE ?auto_3859 ) ( AVAILABLE ?auto_3868 ) ( AVAILABLE ?auto_3879 ) ( SURFACE-AT ?auto_3859 ?auto_3880 ) ( ON ?auto_3859 ?auto_3874 ) ( CLEAR ?auto_3859 ) ( TRUCK-AT ?auto_3869 ?auto_3867 ) ( not ( = ?auto_3858 ?auto_3859 ) ) ( not ( = ?auto_3858 ?auto_3874 ) ) ( not ( = ?auto_3859 ?auto_3874 ) ) ( not ( = ?auto_3858 ?auto_3860 ) ) ( not ( = ?auto_3858 ?auto_3886 ) ) ( not ( = ?auto_3860 ?auto_3874 ) ) ( not ( = ?auto_3870 ?auto_3880 ) ) ( not ( = ?auto_3871 ?auto_3879 ) ) ( not ( = ?auto_3886 ?auto_3874 ) ) ( not ( = ?auto_3858 ?auto_3861 ) ) ( not ( = ?auto_3858 ?auto_3885 ) ) ( not ( = ?auto_3859 ?auto_3861 ) ) ( not ( = ?auto_3859 ?auto_3885 ) ) ( not ( = ?auto_3861 ?auto_3886 ) ) ( not ( = ?auto_3861 ?auto_3874 ) ) ( not ( = ?auto_3881 ?auto_3870 ) ) ( not ( = ?auto_3881 ?auto_3880 ) ) ( not ( = ?auto_3884 ?auto_3871 ) ) ( not ( = ?auto_3884 ?auto_3879 ) ) ( not ( = ?auto_3885 ?auto_3886 ) ) ( not ( = ?auto_3885 ?auto_3874 ) ) ( not ( = ?auto_3858 ?auto_3862 ) ) ( not ( = ?auto_3858 ?auto_3873 ) ) ( not ( = ?auto_3859 ?auto_3862 ) ) ( not ( = ?auto_3859 ?auto_3873 ) ) ( not ( = ?auto_3860 ?auto_3862 ) ) ( not ( = ?auto_3860 ?auto_3873 ) ) ( not ( = ?auto_3862 ?auto_3885 ) ) ( not ( = ?auto_3862 ?auto_3886 ) ) ( not ( = ?auto_3862 ?auto_3874 ) ) ( not ( = ?auto_3873 ?auto_3885 ) ) ( not ( = ?auto_3873 ?auto_3886 ) ) ( not ( = ?auto_3873 ?auto_3874 ) ) ( not ( = ?auto_3858 ?auto_3863 ) ) ( not ( = ?auto_3858 ?auto_3883 ) ) ( not ( = ?auto_3859 ?auto_3863 ) ) ( not ( = ?auto_3859 ?auto_3883 ) ) ( not ( = ?auto_3860 ?auto_3863 ) ) ( not ( = ?auto_3860 ?auto_3883 ) ) ( not ( = ?auto_3861 ?auto_3863 ) ) ( not ( = ?auto_3861 ?auto_3883 ) ) ( not ( = ?auto_3863 ?auto_3873 ) ) ( not ( = ?auto_3863 ?auto_3885 ) ) ( not ( = ?auto_3863 ?auto_3886 ) ) ( not ( = ?auto_3863 ?auto_3874 ) ) ( not ( = ?auto_3877 ?auto_3880 ) ) ( not ( = ?auto_3877 ?auto_3881 ) ) ( not ( = ?auto_3877 ?auto_3870 ) ) ( not ( = ?auto_3887 ?auto_3879 ) ) ( not ( = ?auto_3887 ?auto_3884 ) ) ( not ( = ?auto_3887 ?auto_3871 ) ) ( not ( = ?auto_3883 ?auto_3873 ) ) ( not ( = ?auto_3883 ?auto_3885 ) ) ( not ( = ?auto_3883 ?auto_3886 ) ) ( not ( = ?auto_3883 ?auto_3874 ) ) ( not ( = ?auto_3858 ?auto_3864 ) ) ( not ( = ?auto_3858 ?auto_3878 ) ) ( not ( = ?auto_3859 ?auto_3864 ) ) ( not ( = ?auto_3859 ?auto_3878 ) ) ( not ( = ?auto_3860 ?auto_3864 ) ) ( not ( = ?auto_3860 ?auto_3878 ) ) ( not ( = ?auto_3861 ?auto_3864 ) ) ( not ( = ?auto_3861 ?auto_3878 ) ) ( not ( = ?auto_3862 ?auto_3864 ) ) ( not ( = ?auto_3862 ?auto_3878 ) ) ( not ( = ?auto_3864 ?auto_3883 ) ) ( not ( = ?auto_3864 ?auto_3873 ) ) ( not ( = ?auto_3864 ?auto_3885 ) ) ( not ( = ?auto_3864 ?auto_3886 ) ) ( not ( = ?auto_3864 ?auto_3874 ) ) ( not ( = ?auto_3882 ?auto_3877 ) ) ( not ( = ?auto_3882 ?auto_3880 ) ) ( not ( = ?auto_3882 ?auto_3881 ) ) ( not ( = ?auto_3882 ?auto_3870 ) ) ( not ( = ?auto_3876 ?auto_3887 ) ) ( not ( = ?auto_3876 ?auto_3879 ) ) ( not ( = ?auto_3876 ?auto_3884 ) ) ( not ( = ?auto_3876 ?auto_3871 ) ) ( not ( = ?auto_3878 ?auto_3883 ) ) ( not ( = ?auto_3878 ?auto_3873 ) ) ( not ( = ?auto_3878 ?auto_3885 ) ) ( not ( = ?auto_3878 ?auto_3886 ) ) ( not ( = ?auto_3878 ?auto_3874 ) ) ( not ( = ?auto_3858 ?auto_3866 ) ) ( not ( = ?auto_3858 ?auto_3875 ) ) ( not ( = ?auto_3859 ?auto_3866 ) ) ( not ( = ?auto_3859 ?auto_3875 ) ) ( not ( = ?auto_3860 ?auto_3866 ) ) ( not ( = ?auto_3860 ?auto_3875 ) ) ( not ( = ?auto_3861 ?auto_3866 ) ) ( not ( = ?auto_3861 ?auto_3875 ) ) ( not ( = ?auto_3862 ?auto_3866 ) ) ( not ( = ?auto_3862 ?auto_3875 ) ) ( not ( = ?auto_3863 ?auto_3866 ) ) ( not ( = ?auto_3863 ?auto_3875 ) ) ( not ( = ?auto_3866 ?auto_3878 ) ) ( not ( = ?auto_3866 ?auto_3883 ) ) ( not ( = ?auto_3866 ?auto_3873 ) ) ( not ( = ?auto_3866 ?auto_3885 ) ) ( not ( = ?auto_3866 ?auto_3886 ) ) ( not ( = ?auto_3866 ?auto_3874 ) ) ( not ( = ?auto_3875 ?auto_3878 ) ) ( not ( = ?auto_3875 ?auto_3883 ) ) ( not ( = ?auto_3875 ?auto_3873 ) ) ( not ( = ?auto_3875 ?auto_3885 ) ) ( not ( = ?auto_3875 ?auto_3886 ) ) ( not ( = ?auto_3875 ?auto_3874 ) ) ( not ( = ?auto_3858 ?auto_3865 ) ) ( not ( = ?auto_3858 ?auto_3872 ) ) ( not ( = ?auto_3859 ?auto_3865 ) ) ( not ( = ?auto_3859 ?auto_3872 ) ) ( not ( = ?auto_3860 ?auto_3865 ) ) ( not ( = ?auto_3860 ?auto_3872 ) ) ( not ( = ?auto_3861 ?auto_3865 ) ) ( not ( = ?auto_3861 ?auto_3872 ) ) ( not ( = ?auto_3862 ?auto_3865 ) ) ( not ( = ?auto_3862 ?auto_3872 ) ) ( not ( = ?auto_3863 ?auto_3865 ) ) ( not ( = ?auto_3863 ?auto_3872 ) ) ( not ( = ?auto_3864 ?auto_3865 ) ) ( not ( = ?auto_3864 ?auto_3872 ) ) ( not ( = ?auto_3865 ?auto_3875 ) ) ( not ( = ?auto_3865 ?auto_3878 ) ) ( not ( = ?auto_3865 ?auto_3883 ) ) ( not ( = ?auto_3865 ?auto_3873 ) ) ( not ( = ?auto_3865 ?auto_3885 ) ) ( not ( = ?auto_3865 ?auto_3886 ) ) ( not ( = ?auto_3865 ?auto_3874 ) ) ( not ( = ?auto_3872 ?auto_3875 ) ) ( not ( = ?auto_3872 ?auto_3878 ) ) ( not ( = ?auto_3872 ?auto_3883 ) ) ( not ( = ?auto_3872 ?auto_3873 ) ) ( not ( = ?auto_3872 ?auto_3885 ) ) ( not ( = ?auto_3872 ?auto_3886 ) ) ( not ( = ?auto_3872 ?auto_3874 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_3858 ?auto_3859 ?auto_3860 ?auto_3861 ?auto_3862 ?auto_3863 ?auto_3864 ?auto_3866 )
      ( MAKE-1CRATE ?auto_3866 ?auto_3865 )
      ( MAKE-8CRATE-VERIFY ?auto_3858 ?auto_3859 ?auto_3860 ?auto_3861 ?auto_3862 ?auto_3863 ?auto_3864 ?auto_3866 ?auto_3865 ) )
  )

)

