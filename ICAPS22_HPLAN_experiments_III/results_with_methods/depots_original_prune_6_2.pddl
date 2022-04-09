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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38600 - SURFACE
      ?auto_38601 - SURFACE
    )
    :vars
    (
      ?auto_38602 - HOIST
      ?auto_38603 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38602 ?auto_38603 ) ( SURFACE-AT ?auto_38600 ?auto_38603 ) ( CLEAR ?auto_38600 ) ( LIFTING ?auto_38602 ?auto_38601 ) ( IS-CRATE ?auto_38601 ) ( not ( = ?auto_38600 ?auto_38601 ) ) )
    :subtasks
    ( ( !DROP ?auto_38602 ?auto_38601 ?auto_38600 ?auto_38603 )
      ( MAKE-1CRATE-VERIFY ?auto_38600 ?auto_38601 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38604 - SURFACE
      ?auto_38605 - SURFACE
    )
    :vars
    (
      ?auto_38607 - HOIST
      ?auto_38606 - PLACE
      ?auto_38608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38607 ?auto_38606 ) ( SURFACE-AT ?auto_38604 ?auto_38606 ) ( CLEAR ?auto_38604 ) ( IS-CRATE ?auto_38605 ) ( not ( = ?auto_38604 ?auto_38605 ) ) ( TRUCK-AT ?auto_38608 ?auto_38606 ) ( AVAILABLE ?auto_38607 ) ( IN ?auto_38605 ?auto_38608 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38607 ?auto_38605 ?auto_38608 ?auto_38606 )
      ( MAKE-1CRATE ?auto_38604 ?auto_38605 )
      ( MAKE-1CRATE-VERIFY ?auto_38604 ?auto_38605 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38609 - SURFACE
      ?auto_38610 - SURFACE
    )
    :vars
    (
      ?auto_38613 - HOIST
      ?auto_38611 - PLACE
      ?auto_38612 - TRUCK
      ?auto_38614 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38613 ?auto_38611 ) ( SURFACE-AT ?auto_38609 ?auto_38611 ) ( CLEAR ?auto_38609 ) ( IS-CRATE ?auto_38610 ) ( not ( = ?auto_38609 ?auto_38610 ) ) ( AVAILABLE ?auto_38613 ) ( IN ?auto_38610 ?auto_38612 ) ( TRUCK-AT ?auto_38612 ?auto_38614 ) ( not ( = ?auto_38614 ?auto_38611 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38612 ?auto_38614 ?auto_38611 )
      ( MAKE-1CRATE ?auto_38609 ?auto_38610 )
      ( MAKE-1CRATE-VERIFY ?auto_38609 ?auto_38610 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38615 - SURFACE
      ?auto_38616 - SURFACE
    )
    :vars
    (
      ?auto_38619 - HOIST
      ?auto_38620 - PLACE
      ?auto_38618 - TRUCK
      ?auto_38617 - PLACE
      ?auto_38621 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38619 ?auto_38620 ) ( SURFACE-AT ?auto_38615 ?auto_38620 ) ( CLEAR ?auto_38615 ) ( IS-CRATE ?auto_38616 ) ( not ( = ?auto_38615 ?auto_38616 ) ) ( AVAILABLE ?auto_38619 ) ( TRUCK-AT ?auto_38618 ?auto_38617 ) ( not ( = ?auto_38617 ?auto_38620 ) ) ( HOIST-AT ?auto_38621 ?auto_38617 ) ( LIFTING ?auto_38621 ?auto_38616 ) ( not ( = ?auto_38619 ?auto_38621 ) ) )
    :subtasks
    ( ( !LOAD ?auto_38621 ?auto_38616 ?auto_38618 ?auto_38617 )
      ( MAKE-1CRATE ?auto_38615 ?auto_38616 )
      ( MAKE-1CRATE-VERIFY ?auto_38615 ?auto_38616 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38622 - SURFACE
      ?auto_38623 - SURFACE
    )
    :vars
    (
      ?auto_38628 - HOIST
      ?auto_38627 - PLACE
      ?auto_38625 - TRUCK
      ?auto_38624 - PLACE
      ?auto_38626 - HOIST
      ?auto_38629 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38628 ?auto_38627 ) ( SURFACE-AT ?auto_38622 ?auto_38627 ) ( CLEAR ?auto_38622 ) ( IS-CRATE ?auto_38623 ) ( not ( = ?auto_38622 ?auto_38623 ) ) ( AVAILABLE ?auto_38628 ) ( TRUCK-AT ?auto_38625 ?auto_38624 ) ( not ( = ?auto_38624 ?auto_38627 ) ) ( HOIST-AT ?auto_38626 ?auto_38624 ) ( not ( = ?auto_38628 ?auto_38626 ) ) ( AVAILABLE ?auto_38626 ) ( SURFACE-AT ?auto_38623 ?auto_38624 ) ( ON ?auto_38623 ?auto_38629 ) ( CLEAR ?auto_38623 ) ( not ( = ?auto_38622 ?auto_38629 ) ) ( not ( = ?auto_38623 ?auto_38629 ) ) )
    :subtasks
    ( ( !LIFT ?auto_38626 ?auto_38623 ?auto_38629 ?auto_38624 )
      ( MAKE-1CRATE ?auto_38622 ?auto_38623 )
      ( MAKE-1CRATE-VERIFY ?auto_38622 ?auto_38623 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38630 - SURFACE
      ?auto_38631 - SURFACE
    )
    :vars
    (
      ?auto_38637 - HOIST
      ?auto_38635 - PLACE
      ?auto_38636 - PLACE
      ?auto_38634 - HOIST
      ?auto_38632 - SURFACE
      ?auto_38633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38637 ?auto_38635 ) ( SURFACE-AT ?auto_38630 ?auto_38635 ) ( CLEAR ?auto_38630 ) ( IS-CRATE ?auto_38631 ) ( not ( = ?auto_38630 ?auto_38631 ) ) ( AVAILABLE ?auto_38637 ) ( not ( = ?auto_38636 ?auto_38635 ) ) ( HOIST-AT ?auto_38634 ?auto_38636 ) ( not ( = ?auto_38637 ?auto_38634 ) ) ( AVAILABLE ?auto_38634 ) ( SURFACE-AT ?auto_38631 ?auto_38636 ) ( ON ?auto_38631 ?auto_38632 ) ( CLEAR ?auto_38631 ) ( not ( = ?auto_38630 ?auto_38632 ) ) ( not ( = ?auto_38631 ?auto_38632 ) ) ( TRUCK-AT ?auto_38633 ?auto_38635 ) )
    :subtasks
    ( ( !DRIVE ?auto_38633 ?auto_38635 ?auto_38636 )
      ( MAKE-1CRATE ?auto_38630 ?auto_38631 )
      ( MAKE-1CRATE-VERIFY ?auto_38630 ?auto_38631 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38647 - SURFACE
      ?auto_38648 - SURFACE
      ?auto_38649 - SURFACE
    )
    :vars
    (
      ?auto_38650 - HOIST
      ?auto_38651 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38650 ?auto_38651 ) ( SURFACE-AT ?auto_38648 ?auto_38651 ) ( CLEAR ?auto_38648 ) ( LIFTING ?auto_38650 ?auto_38649 ) ( IS-CRATE ?auto_38649 ) ( not ( = ?auto_38648 ?auto_38649 ) ) ( ON ?auto_38648 ?auto_38647 ) ( not ( = ?auto_38647 ?auto_38648 ) ) ( not ( = ?auto_38647 ?auto_38649 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38648 ?auto_38649 )
      ( MAKE-2CRATE-VERIFY ?auto_38647 ?auto_38648 ?auto_38649 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38657 - SURFACE
      ?auto_38658 - SURFACE
      ?auto_38659 - SURFACE
    )
    :vars
    (
      ?auto_38662 - HOIST
      ?auto_38661 - PLACE
      ?auto_38660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38662 ?auto_38661 ) ( SURFACE-AT ?auto_38658 ?auto_38661 ) ( CLEAR ?auto_38658 ) ( IS-CRATE ?auto_38659 ) ( not ( = ?auto_38658 ?auto_38659 ) ) ( TRUCK-AT ?auto_38660 ?auto_38661 ) ( AVAILABLE ?auto_38662 ) ( IN ?auto_38659 ?auto_38660 ) ( ON ?auto_38658 ?auto_38657 ) ( not ( = ?auto_38657 ?auto_38658 ) ) ( not ( = ?auto_38657 ?auto_38659 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38658 ?auto_38659 )
      ( MAKE-2CRATE-VERIFY ?auto_38657 ?auto_38658 ?auto_38659 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38663 - SURFACE
      ?auto_38664 - SURFACE
    )
    :vars
    (
      ?auto_38667 - HOIST
      ?auto_38666 - PLACE
      ?auto_38668 - TRUCK
      ?auto_38665 - SURFACE
      ?auto_38669 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38667 ?auto_38666 ) ( SURFACE-AT ?auto_38663 ?auto_38666 ) ( CLEAR ?auto_38663 ) ( IS-CRATE ?auto_38664 ) ( not ( = ?auto_38663 ?auto_38664 ) ) ( AVAILABLE ?auto_38667 ) ( IN ?auto_38664 ?auto_38668 ) ( ON ?auto_38663 ?auto_38665 ) ( not ( = ?auto_38665 ?auto_38663 ) ) ( not ( = ?auto_38665 ?auto_38664 ) ) ( TRUCK-AT ?auto_38668 ?auto_38669 ) ( not ( = ?auto_38669 ?auto_38666 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38668 ?auto_38669 ?auto_38666 )
      ( MAKE-2CRATE ?auto_38665 ?auto_38663 ?auto_38664 )
      ( MAKE-1CRATE-VERIFY ?auto_38663 ?auto_38664 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38670 - SURFACE
      ?auto_38671 - SURFACE
      ?auto_38672 - SURFACE
    )
    :vars
    (
      ?auto_38676 - HOIST
      ?auto_38673 - PLACE
      ?auto_38675 - TRUCK
      ?auto_38674 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38676 ?auto_38673 ) ( SURFACE-AT ?auto_38671 ?auto_38673 ) ( CLEAR ?auto_38671 ) ( IS-CRATE ?auto_38672 ) ( not ( = ?auto_38671 ?auto_38672 ) ) ( AVAILABLE ?auto_38676 ) ( IN ?auto_38672 ?auto_38675 ) ( ON ?auto_38671 ?auto_38670 ) ( not ( = ?auto_38670 ?auto_38671 ) ) ( not ( = ?auto_38670 ?auto_38672 ) ) ( TRUCK-AT ?auto_38675 ?auto_38674 ) ( not ( = ?auto_38674 ?auto_38673 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38671 ?auto_38672 )
      ( MAKE-2CRATE-VERIFY ?auto_38670 ?auto_38671 ?auto_38672 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38677 - SURFACE
      ?auto_38678 - SURFACE
    )
    :vars
    (
      ?auto_38680 - HOIST
      ?auto_38683 - PLACE
      ?auto_38682 - SURFACE
      ?auto_38679 - TRUCK
      ?auto_38681 - PLACE
      ?auto_38684 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38680 ?auto_38683 ) ( SURFACE-AT ?auto_38677 ?auto_38683 ) ( CLEAR ?auto_38677 ) ( IS-CRATE ?auto_38678 ) ( not ( = ?auto_38677 ?auto_38678 ) ) ( AVAILABLE ?auto_38680 ) ( ON ?auto_38677 ?auto_38682 ) ( not ( = ?auto_38682 ?auto_38677 ) ) ( not ( = ?auto_38682 ?auto_38678 ) ) ( TRUCK-AT ?auto_38679 ?auto_38681 ) ( not ( = ?auto_38681 ?auto_38683 ) ) ( HOIST-AT ?auto_38684 ?auto_38681 ) ( LIFTING ?auto_38684 ?auto_38678 ) ( not ( = ?auto_38680 ?auto_38684 ) ) )
    :subtasks
    ( ( !LOAD ?auto_38684 ?auto_38678 ?auto_38679 ?auto_38681 )
      ( MAKE-2CRATE ?auto_38682 ?auto_38677 ?auto_38678 )
      ( MAKE-1CRATE-VERIFY ?auto_38677 ?auto_38678 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38685 - SURFACE
      ?auto_38686 - SURFACE
      ?auto_38687 - SURFACE
    )
    :vars
    (
      ?auto_38688 - HOIST
      ?auto_38692 - PLACE
      ?auto_38690 - TRUCK
      ?auto_38689 - PLACE
      ?auto_38691 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38688 ?auto_38692 ) ( SURFACE-AT ?auto_38686 ?auto_38692 ) ( CLEAR ?auto_38686 ) ( IS-CRATE ?auto_38687 ) ( not ( = ?auto_38686 ?auto_38687 ) ) ( AVAILABLE ?auto_38688 ) ( ON ?auto_38686 ?auto_38685 ) ( not ( = ?auto_38685 ?auto_38686 ) ) ( not ( = ?auto_38685 ?auto_38687 ) ) ( TRUCK-AT ?auto_38690 ?auto_38689 ) ( not ( = ?auto_38689 ?auto_38692 ) ) ( HOIST-AT ?auto_38691 ?auto_38689 ) ( LIFTING ?auto_38691 ?auto_38687 ) ( not ( = ?auto_38688 ?auto_38691 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38686 ?auto_38687 )
      ( MAKE-2CRATE-VERIFY ?auto_38685 ?auto_38686 ?auto_38687 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38693 - SURFACE
      ?auto_38694 - SURFACE
    )
    :vars
    (
      ?auto_38700 - HOIST
      ?auto_38695 - PLACE
      ?auto_38699 - SURFACE
      ?auto_38696 - TRUCK
      ?auto_38697 - PLACE
      ?auto_38698 - HOIST
      ?auto_38701 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38700 ?auto_38695 ) ( SURFACE-AT ?auto_38693 ?auto_38695 ) ( CLEAR ?auto_38693 ) ( IS-CRATE ?auto_38694 ) ( not ( = ?auto_38693 ?auto_38694 ) ) ( AVAILABLE ?auto_38700 ) ( ON ?auto_38693 ?auto_38699 ) ( not ( = ?auto_38699 ?auto_38693 ) ) ( not ( = ?auto_38699 ?auto_38694 ) ) ( TRUCK-AT ?auto_38696 ?auto_38697 ) ( not ( = ?auto_38697 ?auto_38695 ) ) ( HOIST-AT ?auto_38698 ?auto_38697 ) ( not ( = ?auto_38700 ?auto_38698 ) ) ( AVAILABLE ?auto_38698 ) ( SURFACE-AT ?auto_38694 ?auto_38697 ) ( ON ?auto_38694 ?auto_38701 ) ( CLEAR ?auto_38694 ) ( not ( = ?auto_38693 ?auto_38701 ) ) ( not ( = ?auto_38694 ?auto_38701 ) ) ( not ( = ?auto_38699 ?auto_38701 ) ) )
    :subtasks
    ( ( !LIFT ?auto_38698 ?auto_38694 ?auto_38701 ?auto_38697 )
      ( MAKE-2CRATE ?auto_38699 ?auto_38693 ?auto_38694 )
      ( MAKE-1CRATE-VERIFY ?auto_38693 ?auto_38694 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38702 - SURFACE
      ?auto_38703 - SURFACE
      ?auto_38704 - SURFACE
    )
    :vars
    (
      ?auto_38707 - HOIST
      ?auto_38708 - PLACE
      ?auto_38709 - TRUCK
      ?auto_38710 - PLACE
      ?auto_38705 - HOIST
      ?auto_38706 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38707 ?auto_38708 ) ( SURFACE-AT ?auto_38703 ?auto_38708 ) ( CLEAR ?auto_38703 ) ( IS-CRATE ?auto_38704 ) ( not ( = ?auto_38703 ?auto_38704 ) ) ( AVAILABLE ?auto_38707 ) ( ON ?auto_38703 ?auto_38702 ) ( not ( = ?auto_38702 ?auto_38703 ) ) ( not ( = ?auto_38702 ?auto_38704 ) ) ( TRUCK-AT ?auto_38709 ?auto_38710 ) ( not ( = ?auto_38710 ?auto_38708 ) ) ( HOIST-AT ?auto_38705 ?auto_38710 ) ( not ( = ?auto_38707 ?auto_38705 ) ) ( AVAILABLE ?auto_38705 ) ( SURFACE-AT ?auto_38704 ?auto_38710 ) ( ON ?auto_38704 ?auto_38706 ) ( CLEAR ?auto_38704 ) ( not ( = ?auto_38703 ?auto_38706 ) ) ( not ( = ?auto_38704 ?auto_38706 ) ) ( not ( = ?auto_38702 ?auto_38706 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38703 ?auto_38704 )
      ( MAKE-2CRATE-VERIFY ?auto_38702 ?auto_38703 ?auto_38704 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38711 - SURFACE
      ?auto_38712 - SURFACE
    )
    :vars
    (
      ?auto_38714 - HOIST
      ?auto_38717 - PLACE
      ?auto_38718 - SURFACE
      ?auto_38713 - PLACE
      ?auto_38719 - HOIST
      ?auto_38716 - SURFACE
      ?auto_38715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38714 ?auto_38717 ) ( SURFACE-AT ?auto_38711 ?auto_38717 ) ( CLEAR ?auto_38711 ) ( IS-CRATE ?auto_38712 ) ( not ( = ?auto_38711 ?auto_38712 ) ) ( AVAILABLE ?auto_38714 ) ( ON ?auto_38711 ?auto_38718 ) ( not ( = ?auto_38718 ?auto_38711 ) ) ( not ( = ?auto_38718 ?auto_38712 ) ) ( not ( = ?auto_38713 ?auto_38717 ) ) ( HOIST-AT ?auto_38719 ?auto_38713 ) ( not ( = ?auto_38714 ?auto_38719 ) ) ( AVAILABLE ?auto_38719 ) ( SURFACE-AT ?auto_38712 ?auto_38713 ) ( ON ?auto_38712 ?auto_38716 ) ( CLEAR ?auto_38712 ) ( not ( = ?auto_38711 ?auto_38716 ) ) ( not ( = ?auto_38712 ?auto_38716 ) ) ( not ( = ?auto_38718 ?auto_38716 ) ) ( TRUCK-AT ?auto_38715 ?auto_38717 ) )
    :subtasks
    ( ( !DRIVE ?auto_38715 ?auto_38717 ?auto_38713 )
      ( MAKE-2CRATE ?auto_38718 ?auto_38711 ?auto_38712 )
      ( MAKE-1CRATE-VERIFY ?auto_38711 ?auto_38712 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38720 - SURFACE
      ?auto_38721 - SURFACE
      ?auto_38722 - SURFACE
    )
    :vars
    (
      ?auto_38723 - HOIST
      ?auto_38725 - PLACE
      ?auto_38724 - PLACE
      ?auto_38726 - HOIST
      ?auto_38728 - SURFACE
      ?auto_38727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38723 ?auto_38725 ) ( SURFACE-AT ?auto_38721 ?auto_38725 ) ( CLEAR ?auto_38721 ) ( IS-CRATE ?auto_38722 ) ( not ( = ?auto_38721 ?auto_38722 ) ) ( AVAILABLE ?auto_38723 ) ( ON ?auto_38721 ?auto_38720 ) ( not ( = ?auto_38720 ?auto_38721 ) ) ( not ( = ?auto_38720 ?auto_38722 ) ) ( not ( = ?auto_38724 ?auto_38725 ) ) ( HOIST-AT ?auto_38726 ?auto_38724 ) ( not ( = ?auto_38723 ?auto_38726 ) ) ( AVAILABLE ?auto_38726 ) ( SURFACE-AT ?auto_38722 ?auto_38724 ) ( ON ?auto_38722 ?auto_38728 ) ( CLEAR ?auto_38722 ) ( not ( = ?auto_38721 ?auto_38728 ) ) ( not ( = ?auto_38722 ?auto_38728 ) ) ( not ( = ?auto_38720 ?auto_38728 ) ) ( TRUCK-AT ?auto_38727 ?auto_38725 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38721 ?auto_38722 )
      ( MAKE-2CRATE-VERIFY ?auto_38720 ?auto_38721 ?auto_38722 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38729 - SURFACE
      ?auto_38730 - SURFACE
    )
    :vars
    (
      ?auto_38736 - HOIST
      ?auto_38735 - PLACE
      ?auto_38732 - SURFACE
      ?auto_38737 - PLACE
      ?auto_38731 - HOIST
      ?auto_38733 - SURFACE
      ?auto_38734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38736 ?auto_38735 ) ( IS-CRATE ?auto_38730 ) ( not ( = ?auto_38729 ?auto_38730 ) ) ( not ( = ?auto_38732 ?auto_38729 ) ) ( not ( = ?auto_38732 ?auto_38730 ) ) ( not ( = ?auto_38737 ?auto_38735 ) ) ( HOIST-AT ?auto_38731 ?auto_38737 ) ( not ( = ?auto_38736 ?auto_38731 ) ) ( AVAILABLE ?auto_38731 ) ( SURFACE-AT ?auto_38730 ?auto_38737 ) ( ON ?auto_38730 ?auto_38733 ) ( CLEAR ?auto_38730 ) ( not ( = ?auto_38729 ?auto_38733 ) ) ( not ( = ?auto_38730 ?auto_38733 ) ) ( not ( = ?auto_38732 ?auto_38733 ) ) ( TRUCK-AT ?auto_38734 ?auto_38735 ) ( SURFACE-AT ?auto_38732 ?auto_38735 ) ( CLEAR ?auto_38732 ) ( LIFTING ?auto_38736 ?auto_38729 ) ( IS-CRATE ?auto_38729 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38732 ?auto_38729 )
      ( MAKE-2CRATE ?auto_38732 ?auto_38729 ?auto_38730 )
      ( MAKE-1CRATE-VERIFY ?auto_38729 ?auto_38730 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38738 - SURFACE
      ?auto_38739 - SURFACE
      ?auto_38740 - SURFACE
    )
    :vars
    (
      ?auto_38742 - HOIST
      ?auto_38743 - PLACE
      ?auto_38745 - PLACE
      ?auto_38746 - HOIST
      ?auto_38741 - SURFACE
      ?auto_38744 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38742 ?auto_38743 ) ( IS-CRATE ?auto_38740 ) ( not ( = ?auto_38739 ?auto_38740 ) ) ( not ( = ?auto_38738 ?auto_38739 ) ) ( not ( = ?auto_38738 ?auto_38740 ) ) ( not ( = ?auto_38745 ?auto_38743 ) ) ( HOIST-AT ?auto_38746 ?auto_38745 ) ( not ( = ?auto_38742 ?auto_38746 ) ) ( AVAILABLE ?auto_38746 ) ( SURFACE-AT ?auto_38740 ?auto_38745 ) ( ON ?auto_38740 ?auto_38741 ) ( CLEAR ?auto_38740 ) ( not ( = ?auto_38739 ?auto_38741 ) ) ( not ( = ?auto_38740 ?auto_38741 ) ) ( not ( = ?auto_38738 ?auto_38741 ) ) ( TRUCK-AT ?auto_38744 ?auto_38743 ) ( SURFACE-AT ?auto_38738 ?auto_38743 ) ( CLEAR ?auto_38738 ) ( LIFTING ?auto_38742 ?auto_38739 ) ( IS-CRATE ?auto_38739 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38739 ?auto_38740 )
      ( MAKE-2CRATE-VERIFY ?auto_38738 ?auto_38739 ?auto_38740 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38747 - SURFACE
      ?auto_38748 - SURFACE
    )
    :vars
    (
      ?auto_38755 - HOIST
      ?auto_38751 - PLACE
      ?auto_38754 - SURFACE
      ?auto_38753 - PLACE
      ?auto_38749 - HOIST
      ?auto_38752 - SURFACE
      ?auto_38750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38755 ?auto_38751 ) ( IS-CRATE ?auto_38748 ) ( not ( = ?auto_38747 ?auto_38748 ) ) ( not ( = ?auto_38754 ?auto_38747 ) ) ( not ( = ?auto_38754 ?auto_38748 ) ) ( not ( = ?auto_38753 ?auto_38751 ) ) ( HOIST-AT ?auto_38749 ?auto_38753 ) ( not ( = ?auto_38755 ?auto_38749 ) ) ( AVAILABLE ?auto_38749 ) ( SURFACE-AT ?auto_38748 ?auto_38753 ) ( ON ?auto_38748 ?auto_38752 ) ( CLEAR ?auto_38748 ) ( not ( = ?auto_38747 ?auto_38752 ) ) ( not ( = ?auto_38748 ?auto_38752 ) ) ( not ( = ?auto_38754 ?auto_38752 ) ) ( TRUCK-AT ?auto_38750 ?auto_38751 ) ( SURFACE-AT ?auto_38754 ?auto_38751 ) ( CLEAR ?auto_38754 ) ( IS-CRATE ?auto_38747 ) ( AVAILABLE ?auto_38755 ) ( IN ?auto_38747 ?auto_38750 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38755 ?auto_38747 ?auto_38750 ?auto_38751 )
      ( MAKE-2CRATE ?auto_38754 ?auto_38747 ?auto_38748 )
      ( MAKE-1CRATE-VERIFY ?auto_38747 ?auto_38748 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38756 - SURFACE
      ?auto_38757 - SURFACE
      ?auto_38758 - SURFACE
    )
    :vars
    (
      ?auto_38761 - HOIST
      ?auto_38759 - PLACE
      ?auto_38762 - PLACE
      ?auto_38764 - HOIST
      ?auto_38760 - SURFACE
      ?auto_38763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38761 ?auto_38759 ) ( IS-CRATE ?auto_38758 ) ( not ( = ?auto_38757 ?auto_38758 ) ) ( not ( = ?auto_38756 ?auto_38757 ) ) ( not ( = ?auto_38756 ?auto_38758 ) ) ( not ( = ?auto_38762 ?auto_38759 ) ) ( HOIST-AT ?auto_38764 ?auto_38762 ) ( not ( = ?auto_38761 ?auto_38764 ) ) ( AVAILABLE ?auto_38764 ) ( SURFACE-AT ?auto_38758 ?auto_38762 ) ( ON ?auto_38758 ?auto_38760 ) ( CLEAR ?auto_38758 ) ( not ( = ?auto_38757 ?auto_38760 ) ) ( not ( = ?auto_38758 ?auto_38760 ) ) ( not ( = ?auto_38756 ?auto_38760 ) ) ( TRUCK-AT ?auto_38763 ?auto_38759 ) ( SURFACE-AT ?auto_38756 ?auto_38759 ) ( CLEAR ?auto_38756 ) ( IS-CRATE ?auto_38757 ) ( AVAILABLE ?auto_38761 ) ( IN ?auto_38757 ?auto_38763 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38757 ?auto_38758 )
      ( MAKE-2CRATE-VERIFY ?auto_38756 ?auto_38757 ?auto_38758 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38801 - SURFACE
      ?auto_38802 - SURFACE
    )
    :vars
    (
      ?auto_38809 - HOIST
      ?auto_38806 - PLACE
      ?auto_38808 - SURFACE
      ?auto_38807 - PLACE
      ?auto_38804 - HOIST
      ?auto_38803 - SURFACE
      ?auto_38805 - TRUCK
      ?auto_38810 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38809 ?auto_38806 ) ( SURFACE-AT ?auto_38801 ?auto_38806 ) ( CLEAR ?auto_38801 ) ( IS-CRATE ?auto_38802 ) ( not ( = ?auto_38801 ?auto_38802 ) ) ( AVAILABLE ?auto_38809 ) ( ON ?auto_38801 ?auto_38808 ) ( not ( = ?auto_38808 ?auto_38801 ) ) ( not ( = ?auto_38808 ?auto_38802 ) ) ( not ( = ?auto_38807 ?auto_38806 ) ) ( HOIST-AT ?auto_38804 ?auto_38807 ) ( not ( = ?auto_38809 ?auto_38804 ) ) ( AVAILABLE ?auto_38804 ) ( SURFACE-AT ?auto_38802 ?auto_38807 ) ( ON ?auto_38802 ?auto_38803 ) ( CLEAR ?auto_38802 ) ( not ( = ?auto_38801 ?auto_38803 ) ) ( not ( = ?auto_38802 ?auto_38803 ) ) ( not ( = ?auto_38808 ?auto_38803 ) ) ( TRUCK-AT ?auto_38805 ?auto_38810 ) ( not ( = ?auto_38810 ?auto_38806 ) ) ( not ( = ?auto_38807 ?auto_38810 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38805 ?auto_38810 ?auto_38806 )
      ( MAKE-1CRATE ?auto_38801 ?auto_38802 )
      ( MAKE-1CRATE-VERIFY ?auto_38801 ?auto_38802 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_38840 - SURFACE
      ?auto_38841 - SURFACE
      ?auto_38842 - SURFACE
      ?auto_38843 - SURFACE
    )
    :vars
    (
      ?auto_38845 - HOIST
      ?auto_38844 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38845 ?auto_38844 ) ( SURFACE-AT ?auto_38842 ?auto_38844 ) ( CLEAR ?auto_38842 ) ( LIFTING ?auto_38845 ?auto_38843 ) ( IS-CRATE ?auto_38843 ) ( not ( = ?auto_38842 ?auto_38843 ) ) ( ON ?auto_38841 ?auto_38840 ) ( ON ?auto_38842 ?auto_38841 ) ( not ( = ?auto_38840 ?auto_38841 ) ) ( not ( = ?auto_38840 ?auto_38842 ) ) ( not ( = ?auto_38840 ?auto_38843 ) ) ( not ( = ?auto_38841 ?auto_38842 ) ) ( not ( = ?auto_38841 ?auto_38843 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38842 ?auto_38843 )
      ( MAKE-3CRATE-VERIFY ?auto_38840 ?auto_38841 ?auto_38842 ?auto_38843 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_38857 - SURFACE
      ?auto_38858 - SURFACE
      ?auto_38859 - SURFACE
      ?auto_38860 - SURFACE
    )
    :vars
    (
      ?auto_38862 - HOIST
      ?auto_38863 - PLACE
      ?auto_38861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38862 ?auto_38863 ) ( SURFACE-AT ?auto_38859 ?auto_38863 ) ( CLEAR ?auto_38859 ) ( IS-CRATE ?auto_38860 ) ( not ( = ?auto_38859 ?auto_38860 ) ) ( TRUCK-AT ?auto_38861 ?auto_38863 ) ( AVAILABLE ?auto_38862 ) ( IN ?auto_38860 ?auto_38861 ) ( ON ?auto_38859 ?auto_38858 ) ( not ( = ?auto_38858 ?auto_38859 ) ) ( not ( = ?auto_38858 ?auto_38860 ) ) ( ON ?auto_38858 ?auto_38857 ) ( not ( = ?auto_38857 ?auto_38858 ) ) ( not ( = ?auto_38857 ?auto_38859 ) ) ( not ( = ?auto_38857 ?auto_38860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_38858 ?auto_38859 ?auto_38860 )
      ( MAKE-3CRATE-VERIFY ?auto_38857 ?auto_38858 ?auto_38859 ?auto_38860 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_38878 - SURFACE
      ?auto_38879 - SURFACE
      ?auto_38880 - SURFACE
      ?auto_38881 - SURFACE
    )
    :vars
    (
      ?auto_38884 - HOIST
      ?auto_38883 - PLACE
      ?auto_38885 - TRUCK
      ?auto_38882 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38884 ?auto_38883 ) ( SURFACE-AT ?auto_38880 ?auto_38883 ) ( CLEAR ?auto_38880 ) ( IS-CRATE ?auto_38881 ) ( not ( = ?auto_38880 ?auto_38881 ) ) ( AVAILABLE ?auto_38884 ) ( IN ?auto_38881 ?auto_38885 ) ( ON ?auto_38880 ?auto_38879 ) ( not ( = ?auto_38879 ?auto_38880 ) ) ( not ( = ?auto_38879 ?auto_38881 ) ) ( TRUCK-AT ?auto_38885 ?auto_38882 ) ( not ( = ?auto_38882 ?auto_38883 ) ) ( ON ?auto_38879 ?auto_38878 ) ( not ( = ?auto_38878 ?auto_38879 ) ) ( not ( = ?auto_38878 ?auto_38880 ) ) ( not ( = ?auto_38878 ?auto_38881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_38879 ?auto_38880 ?auto_38881 )
      ( MAKE-3CRATE-VERIFY ?auto_38878 ?auto_38879 ?auto_38880 ?auto_38881 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_38902 - SURFACE
      ?auto_38903 - SURFACE
      ?auto_38904 - SURFACE
      ?auto_38905 - SURFACE
    )
    :vars
    (
      ?auto_38909 - HOIST
      ?auto_38907 - PLACE
      ?auto_38910 - TRUCK
      ?auto_38906 - PLACE
      ?auto_38908 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38909 ?auto_38907 ) ( SURFACE-AT ?auto_38904 ?auto_38907 ) ( CLEAR ?auto_38904 ) ( IS-CRATE ?auto_38905 ) ( not ( = ?auto_38904 ?auto_38905 ) ) ( AVAILABLE ?auto_38909 ) ( ON ?auto_38904 ?auto_38903 ) ( not ( = ?auto_38903 ?auto_38904 ) ) ( not ( = ?auto_38903 ?auto_38905 ) ) ( TRUCK-AT ?auto_38910 ?auto_38906 ) ( not ( = ?auto_38906 ?auto_38907 ) ) ( HOIST-AT ?auto_38908 ?auto_38906 ) ( LIFTING ?auto_38908 ?auto_38905 ) ( not ( = ?auto_38909 ?auto_38908 ) ) ( ON ?auto_38903 ?auto_38902 ) ( not ( = ?auto_38902 ?auto_38903 ) ) ( not ( = ?auto_38902 ?auto_38904 ) ) ( not ( = ?auto_38902 ?auto_38905 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_38903 ?auto_38904 ?auto_38905 )
      ( MAKE-3CRATE-VERIFY ?auto_38902 ?auto_38903 ?auto_38904 ?auto_38905 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_38929 - SURFACE
      ?auto_38930 - SURFACE
      ?auto_38931 - SURFACE
      ?auto_38932 - SURFACE
    )
    :vars
    (
      ?auto_38934 - HOIST
      ?auto_38936 - PLACE
      ?auto_38938 - TRUCK
      ?auto_38935 - PLACE
      ?auto_38933 - HOIST
      ?auto_38937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38934 ?auto_38936 ) ( SURFACE-AT ?auto_38931 ?auto_38936 ) ( CLEAR ?auto_38931 ) ( IS-CRATE ?auto_38932 ) ( not ( = ?auto_38931 ?auto_38932 ) ) ( AVAILABLE ?auto_38934 ) ( ON ?auto_38931 ?auto_38930 ) ( not ( = ?auto_38930 ?auto_38931 ) ) ( not ( = ?auto_38930 ?auto_38932 ) ) ( TRUCK-AT ?auto_38938 ?auto_38935 ) ( not ( = ?auto_38935 ?auto_38936 ) ) ( HOIST-AT ?auto_38933 ?auto_38935 ) ( not ( = ?auto_38934 ?auto_38933 ) ) ( AVAILABLE ?auto_38933 ) ( SURFACE-AT ?auto_38932 ?auto_38935 ) ( ON ?auto_38932 ?auto_38937 ) ( CLEAR ?auto_38932 ) ( not ( = ?auto_38931 ?auto_38937 ) ) ( not ( = ?auto_38932 ?auto_38937 ) ) ( not ( = ?auto_38930 ?auto_38937 ) ) ( ON ?auto_38930 ?auto_38929 ) ( not ( = ?auto_38929 ?auto_38930 ) ) ( not ( = ?auto_38929 ?auto_38931 ) ) ( not ( = ?auto_38929 ?auto_38932 ) ) ( not ( = ?auto_38929 ?auto_38937 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_38930 ?auto_38931 ?auto_38932 )
      ( MAKE-3CRATE-VERIFY ?auto_38929 ?auto_38930 ?auto_38931 ?auto_38932 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_38957 - SURFACE
      ?auto_38958 - SURFACE
      ?auto_38959 - SURFACE
      ?auto_38960 - SURFACE
    )
    :vars
    (
      ?auto_38963 - HOIST
      ?auto_38962 - PLACE
      ?auto_38964 - PLACE
      ?auto_38966 - HOIST
      ?auto_38965 - SURFACE
      ?auto_38961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38963 ?auto_38962 ) ( SURFACE-AT ?auto_38959 ?auto_38962 ) ( CLEAR ?auto_38959 ) ( IS-CRATE ?auto_38960 ) ( not ( = ?auto_38959 ?auto_38960 ) ) ( AVAILABLE ?auto_38963 ) ( ON ?auto_38959 ?auto_38958 ) ( not ( = ?auto_38958 ?auto_38959 ) ) ( not ( = ?auto_38958 ?auto_38960 ) ) ( not ( = ?auto_38964 ?auto_38962 ) ) ( HOIST-AT ?auto_38966 ?auto_38964 ) ( not ( = ?auto_38963 ?auto_38966 ) ) ( AVAILABLE ?auto_38966 ) ( SURFACE-AT ?auto_38960 ?auto_38964 ) ( ON ?auto_38960 ?auto_38965 ) ( CLEAR ?auto_38960 ) ( not ( = ?auto_38959 ?auto_38965 ) ) ( not ( = ?auto_38960 ?auto_38965 ) ) ( not ( = ?auto_38958 ?auto_38965 ) ) ( TRUCK-AT ?auto_38961 ?auto_38962 ) ( ON ?auto_38958 ?auto_38957 ) ( not ( = ?auto_38957 ?auto_38958 ) ) ( not ( = ?auto_38957 ?auto_38959 ) ) ( not ( = ?auto_38957 ?auto_38960 ) ) ( not ( = ?auto_38957 ?auto_38965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_38958 ?auto_38959 ?auto_38960 )
      ( MAKE-3CRATE-VERIFY ?auto_38957 ?auto_38958 ?auto_38959 ?auto_38960 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_38985 - SURFACE
      ?auto_38986 - SURFACE
      ?auto_38987 - SURFACE
      ?auto_38988 - SURFACE
    )
    :vars
    (
      ?auto_38991 - HOIST
      ?auto_38990 - PLACE
      ?auto_38993 - PLACE
      ?auto_38992 - HOIST
      ?auto_38994 - SURFACE
      ?auto_38989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38991 ?auto_38990 ) ( IS-CRATE ?auto_38988 ) ( not ( = ?auto_38987 ?auto_38988 ) ) ( not ( = ?auto_38986 ?auto_38987 ) ) ( not ( = ?auto_38986 ?auto_38988 ) ) ( not ( = ?auto_38993 ?auto_38990 ) ) ( HOIST-AT ?auto_38992 ?auto_38993 ) ( not ( = ?auto_38991 ?auto_38992 ) ) ( AVAILABLE ?auto_38992 ) ( SURFACE-AT ?auto_38988 ?auto_38993 ) ( ON ?auto_38988 ?auto_38994 ) ( CLEAR ?auto_38988 ) ( not ( = ?auto_38987 ?auto_38994 ) ) ( not ( = ?auto_38988 ?auto_38994 ) ) ( not ( = ?auto_38986 ?auto_38994 ) ) ( TRUCK-AT ?auto_38989 ?auto_38990 ) ( SURFACE-AT ?auto_38986 ?auto_38990 ) ( CLEAR ?auto_38986 ) ( LIFTING ?auto_38991 ?auto_38987 ) ( IS-CRATE ?auto_38987 ) ( ON ?auto_38986 ?auto_38985 ) ( not ( = ?auto_38985 ?auto_38986 ) ) ( not ( = ?auto_38985 ?auto_38987 ) ) ( not ( = ?auto_38985 ?auto_38988 ) ) ( not ( = ?auto_38985 ?auto_38994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_38986 ?auto_38987 ?auto_38988 )
      ( MAKE-3CRATE-VERIFY ?auto_38985 ?auto_38986 ?auto_38987 ?auto_38988 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_39013 - SURFACE
      ?auto_39014 - SURFACE
      ?auto_39015 - SURFACE
      ?auto_39016 - SURFACE
    )
    :vars
    (
      ?auto_39020 - HOIST
      ?auto_39018 - PLACE
      ?auto_39017 - PLACE
      ?auto_39019 - HOIST
      ?auto_39021 - SURFACE
      ?auto_39022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39020 ?auto_39018 ) ( IS-CRATE ?auto_39016 ) ( not ( = ?auto_39015 ?auto_39016 ) ) ( not ( = ?auto_39014 ?auto_39015 ) ) ( not ( = ?auto_39014 ?auto_39016 ) ) ( not ( = ?auto_39017 ?auto_39018 ) ) ( HOIST-AT ?auto_39019 ?auto_39017 ) ( not ( = ?auto_39020 ?auto_39019 ) ) ( AVAILABLE ?auto_39019 ) ( SURFACE-AT ?auto_39016 ?auto_39017 ) ( ON ?auto_39016 ?auto_39021 ) ( CLEAR ?auto_39016 ) ( not ( = ?auto_39015 ?auto_39021 ) ) ( not ( = ?auto_39016 ?auto_39021 ) ) ( not ( = ?auto_39014 ?auto_39021 ) ) ( TRUCK-AT ?auto_39022 ?auto_39018 ) ( SURFACE-AT ?auto_39014 ?auto_39018 ) ( CLEAR ?auto_39014 ) ( IS-CRATE ?auto_39015 ) ( AVAILABLE ?auto_39020 ) ( IN ?auto_39015 ?auto_39022 ) ( ON ?auto_39014 ?auto_39013 ) ( not ( = ?auto_39013 ?auto_39014 ) ) ( not ( = ?auto_39013 ?auto_39015 ) ) ( not ( = ?auto_39013 ?auto_39016 ) ) ( not ( = ?auto_39013 ?auto_39021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39014 ?auto_39015 ?auto_39016 )
      ( MAKE-3CRATE-VERIFY ?auto_39013 ?auto_39014 ?auto_39015 ?auto_39016 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_39198 - SURFACE
      ?auto_39199 - SURFACE
    )
    :vars
    (
      ?auto_39202 - HOIST
      ?auto_39206 - PLACE
      ?auto_39201 - SURFACE
      ?auto_39205 - TRUCK
      ?auto_39204 - PLACE
      ?auto_39200 - HOIST
      ?auto_39203 - SURFACE
      ?auto_39207 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39202 ?auto_39206 ) ( SURFACE-AT ?auto_39198 ?auto_39206 ) ( CLEAR ?auto_39198 ) ( IS-CRATE ?auto_39199 ) ( not ( = ?auto_39198 ?auto_39199 ) ) ( AVAILABLE ?auto_39202 ) ( ON ?auto_39198 ?auto_39201 ) ( not ( = ?auto_39201 ?auto_39198 ) ) ( not ( = ?auto_39201 ?auto_39199 ) ) ( TRUCK-AT ?auto_39205 ?auto_39204 ) ( not ( = ?auto_39204 ?auto_39206 ) ) ( HOIST-AT ?auto_39200 ?auto_39204 ) ( not ( = ?auto_39202 ?auto_39200 ) ) ( SURFACE-AT ?auto_39199 ?auto_39204 ) ( ON ?auto_39199 ?auto_39203 ) ( CLEAR ?auto_39199 ) ( not ( = ?auto_39198 ?auto_39203 ) ) ( not ( = ?auto_39199 ?auto_39203 ) ) ( not ( = ?auto_39201 ?auto_39203 ) ) ( LIFTING ?auto_39200 ?auto_39207 ) ( IS-CRATE ?auto_39207 ) ( not ( = ?auto_39198 ?auto_39207 ) ) ( not ( = ?auto_39199 ?auto_39207 ) ) ( not ( = ?auto_39201 ?auto_39207 ) ) ( not ( = ?auto_39203 ?auto_39207 ) ) )
    :subtasks
    ( ( !LOAD ?auto_39200 ?auto_39207 ?auto_39205 ?auto_39204 )
      ( MAKE-1CRATE ?auto_39198 ?auto_39199 )
      ( MAKE-1CRATE-VERIFY ?auto_39198 ?auto_39199 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39306 - SURFACE
      ?auto_39307 - SURFACE
      ?auto_39308 - SURFACE
      ?auto_39310 - SURFACE
      ?auto_39309 - SURFACE
    )
    :vars
    (
      ?auto_39311 - HOIST
      ?auto_39312 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39311 ?auto_39312 ) ( SURFACE-AT ?auto_39310 ?auto_39312 ) ( CLEAR ?auto_39310 ) ( LIFTING ?auto_39311 ?auto_39309 ) ( IS-CRATE ?auto_39309 ) ( not ( = ?auto_39310 ?auto_39309 ) ) ( ON ?auto_39307 ?auto_39306 ) ( ON ?auto_39308 ?auto_39307 ) ( ON ?auto_39310 ?auto_39308 ) ( not ( = ?auto_39306 ?auto_39307 ) ) ( not ( = ?auto_39306 ?auto_39308 ) ) ( not ( = ?auto_39306 ?auto_39310 ) ) ( not ( = ?auto_39306 ?auto_39309 ) ) ( not ( = ?auto_39307 ?auto_39308 ) ) ( not ( = ?auto_39307 ?auto_39310 ) ) ( not ( = ?auto_39307 ?auto_39309 ) ) ( not ( = ?auto_39308 ?auto_39310 ) ) ( not ( = ?auto_39308 ?auto_39309 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_39310 ?auto_39309 )
      ( MAKE-4CRATE-VERIFY ?auto_39306 ?auto_39307 ?auto_39308 ?auto_39310 ?auto_39309 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39331 - SURFACE
      ?auto_39332 - SURFACE
      ?auto_39333 - SURFACE
      ?auto_39335 - SURFACE
      ?auto_39334 - SURFACE
    )
    :vars
    (
      ?auto_39338 - HOIST
      ?auto_39336 - PLACE
      ?auto_39337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39338 ?auto_39336 ) ( SURFACE-AT ?auto_39335 ?auto_39336 ) ( CLEAR ?auto_39335 ) ( IS-CRATE ?auto_39334 ) ( not ( = ?auto_39335 ?auto_39334 ) ) ( TRUCK-AT ?auto_39337 ?auto_39336 ) ( AVAILABLE ?auto_39338 ) ( IN ?auto_39334 ?auto_39337 ) ( ON ?auto_39335 ?auto_39333 ) ( not ( = ?auto_39333 ?auto_39335 ) ) ( not ( = ?auto_39333 ?auto_39334 ) ) ( ON ?auto_39332 ?auto_39331 ) ( ON ?auto_39333 ?auto_39332 ) ( not ( = ?auto_39331 ?auto_39332 ) ) ( not ( = ?auto_39331 ?auto_39333 ) ) ( not ( = ?auto_39331 ?auto_39335 ) ) ( not ( = ?auto_39331 ?auto_39334 ) ) ( not ( = ?auto_39332 ?auto_39333 ) ) ( not ( = ?auto_39332 ?auto_39335 ) ) ( not ( = ?auto_39332 ?auto_39334 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39333 ?auto_39335 ?auto_39334 )
      ( MAKE-4CRATE-VERIFY ?auto_39331 ?auto_39332 ?auto_39333 ?auto_39335 ?auto_39334 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39361 - SURFACE
      ?auto_39362 - SURFACE
      ?auto_39363 - SURFACE
      ?auto_39365 - SURFACE
      ?auto_39364 - SURFACE
    )
    :vars
    (
      ?auto_39369 - HOIST
      ?auto_39366 - PLACE
      ?auto_39367 - TRUCK
      ?auto_39368 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39369 ?auto_39366 ) ( SURFACE-AT ?auto_39365 ?auto_39366 ) ( CLEAR ?auto_39365 ) ( IS-CRATE ?auto_39364 ) ( not ( = ?auto_39365 ?auto_39364 ) ) ( AVAILABLE ?auto_39369 ) ( IN ?auto_39364 ?auto_39367 ) ( ON ?auto_39365 ?auto_39363 ) ( not ( = ?auto_39363 ?auto_39365 ) ) ( not ( = ?auto_39363 ?auto_39364 ) ) ( TRUCK-AT ?auto_39367 ?auto_39368 ) ( not ( = ?auto_39368 ?auto_39366 ) ) ( ON ?auto_39362 ?auto_39361 ) ( ON ?auto_39363 ?auto_39362 ) ( not ( = ?auto_39361 ?auto_39362 ) ) ( not ( = ?auto_39361 ?auto_39363 ) ) ( not ( = ?auto_39361 ?auto_39365 ) ) ( not ( = ?auto_39361 ?auto_39364 ) ) ( not ( = ?auto_39362 ?auto_39363 ) ) ( not ( = ?auto_39362 ?auto_39365 ) ) ( not ( = ?auto_39362 ?auto_39364 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39363 ?auto_39365 ?auto_39364 )
      ( MAKE-4CRATE-VERIFY ?auto_39361 ?auto_39362 ?auto_39363 ?auto_39365 ?auto_39364 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39395 - SURFACE
      ?auto_39396 - SURFACE
      ?auto_39397 - SURFACE
      ?auto_39399 - SURFACE
      ?auto_39398 - SURFACE
    )
    :vars
    (
      ?auto_39400 - HOIST
      ?auto_39401 - PLACE
      ?auto_39402 - TRUCK
      ?auto_39403 - PLACE
      ?auto_39404 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_39400 ?auto_39401 ) ( SURFACE-AT ?auto_39399 ?auto_39401 ) ( CLEAR ?auto_39399 ) ( IS-CRATE ?auto_39398 ) ( not ( = ?auto_39399 ?auto_39398 ) ) ( AVAILABLE ?auto_39400 ) ( ON ?auto_39399 ?auto_39397 ) ( not ( = ?auto_39397 ?auto_39399 ) ) ( not ( = ?auto_39397 ?auto_39398 ) ) ( TRUCK-AT ?auto_39402 ?auto_39403 ) ( not ( = ?auto_39403 ?auto_39401 ) ) ( HOIST-AT ?auto_39404 ?auto_39403 ) ( LIFTING ?auto_39404 ?auto_39398 ) ( not ( = ?auto_39400 ?auto_39404 ) ) ( ON ?auto_39396 ?auto_39395 ) ( ON ?auto_39397 ?auto_39396 ) ( not ( = ?auto_39395 ?auto_39396 ) ) ( not ( = ?auto_39395 ?auto_39397 ) ) ( not ( = ?auto_39395 ?auto_39399 ) ) ( not ( = ?auto_39395 ?auto_39398 ) ) ( not ( = ?auto_39396 ?auto_39397 ) ) ( not ( = ?auto_39396 ?auto_39399 ) ) ( not ( = ?auto_39396 ?auto_39398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39397 ?auto_39399 ?auto_39398 )
      ( MAKE-4CRATE-VERIFY ?auto_39395 ?auto_39396 ?auto_39397 ?auto_39399 ?auto_39398 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39433 - SURFACE
      ?auto_39434 - SURFACE
      ?auto_39435 - SURFACE
      ?auto_39437 - SURFACE
      ?auto_39436 - SURFACE
    )
    :vars
    (
      ?auto_39439 - HOIST
      ?auto_39443 - PLACE
      ?auto_39438 - TRUCK
      ?auto_39442 - PLACE
      ?auto_39440 - HOIST
      ?auto_39441 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39439 ?auto_39443 ) ( SURFACE-AT ?auto_39437 ?auto_39443 ) ( CLEAR ?auto_39437 ) ( IS-CRATE ?auto_39436 ) ( not ( = ?auto_39437 ?auto_39436 ) ) ( AVAILABLE ?auto_39439 ) ( ON ?auto_39437 ?auto_39435 ) ( not ( = ?auto_39435 ?auto_39437 ) ) ( not ( = ?auto_39435 ?auto_39436 ) ) ( TRUCK-AT ?auto_39438 ?auto_39442 ) ( not ( = ?auto_39442 ?auto_39443 ) ) ( HOIST-AT ?auto_39440 ?auto_39442 ) ( not ( = ?auto_39439 ?auto_39440 ) ) ( AVAILABLE ?auto_39440 ) ( SURFACE-AT ?auto_39436 ?auto_39442 ) ( ON ?auto_39436 ?auto_39441 ) ( CLEAR ?auto_39436 ) ( not ( = ?auto_39437 ?auto_39441 ) ) ( not ( = ?auto_39436 ?auto_39441 ) ) ( not ( = ?auto_39435 ?auto_39441 ) ) ( ON ?auto_39434 ?auto_39433 ) ( ON ?auto_39435 ?auto_39434 ) ( not ( = ?auto_39433 ?auto_39434 ) ) ( not ( = ?auto_39433 ?auto_39435 ) ) ( not ( = ?auto_39433 ?auto_39437 ) ) ( not ( = ?auto_39433 ?auto_39436 ) ) ( not ( = ?auto_39433 ?auto_39441 ) ) ( not ( = ?auto_39434 ?auto_39435 ) ) ( not ( = ?auto_39434 ?auto_39437 ) ) ( not ( = ?auto_39434 ?auto_39436 ) ) ( not ( = ?auto_39434 ?auto_39441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39435 ?auto_39437 ?auto_39436 )
      ( MAKE-4CRATE-VERIFY ?auto_39433 ?auto_39434 ?auto_39435 ?auto_39437 ?auto_39436 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39472 - SURFACE
      ?auto_39473 - SURFACE
      ?auto_39474 - SURFACE
      ?auto_39476 - SURFACE
      ?auto_39475 - SURFACE
    )
    :vars
    (
      ?auto_39481 - HOIST
      ?auto_39480 - PLACE
      ?auto_39479 - PLACE
      ?auto_39477 - HOIST
      ?auto_39482 - SURFACE
      ?auto_39478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39481 ?auto_39480 ) ( SURFACE-AT ?auto_39476 ?auto_39480 ) ( CLEAR ?auto_39476 ) ( IS-CRATE ?auto_39475 ) ( not ( = ?auto_39476 ?auto_39475 ) ) ( AVAILABLE ?auto_39481 ) ( ON ?auto_39476 ?auto_39474 ) ( not ( = ?auto_39474 ?auto_39476 ) ) ( not ( = ?auto_39474 ?auto_39475 ) ) ( not ( = ?auto_39479 ?auto_39480 ) ) ( HOIST-AT ?auto_39477 ?auto_39479 ) ( not ( = ?auto_39481 ?auto_39477 ) ) ( AVAILABLE ?auto_39477 ) ( SURFACE-AT ?auto_39475 ?auto_39479 ) ( ON ?auto_39475 ?auto_39482 ) ( CLEAR ?auto_39475 ) ( not ( = ?auto_39476 ?auto_39482 ) ) ( not ( = ?auto_39475 ?auto_39482 ) ) ( not ( = ?auto_39474 ?auto_39482 ) ) ( TRUCK-AT ?auto_39478 ?auto_39480 ) ( ON ?auto_39473 ?auto_39472 ) ( ON ?auto_39474 ?auto_39473 ) ( not ( = ?auto_39472 ?auto_39473 ) ) ( not ( = ?auto_39472 ?auto_39474 ) ) ( not ( = ?auto_39472 ?auto_39476 ) ) ( not ( = ?auto_39472 ?auto_39475 ) ) ( not ( = ?auto_39472 ?auto_39482 ) ) ( not ( = ?auto_39473 ?auto_39474 ) ) ( not ( = ?auto_39473 ?auto_39476 ) ) ( not ( = ?auto_39473 ?auto_39475 ) ) ( not ( = ?auto_39473 ?auto_39482 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39474 ?auto_39476 ?auto_39475 )
      ( MAKE-4CRATE-VERIFY ?auto_39472 ?auto_39473 ?auto_39474 ?auto_39476 ?auto_39475 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39511 - SURFACE
      ?auto_39512 - SURFACE
      ?auto_39513 - SURFACE
      ?auto_39515 - SURFACE
      ?auto_39514 - SURFACE
    )
    :vars
    (
      ?auto_39519 - HOIST
      ?auto_39521 - PLACE
      ?auto_39517 - PLACE
      ?auto_39516 - HOIST
      ?auto_39520 - SURFACE
      ?auto_39518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39519 ?auto_39521 ) ( IS-CRATE ?auto_39514 ) ( not ( = ?auto_39515 ?auto_39514 ) ) ( not ( = ?auto_39513 ?auto_39515 ) ) ( not ( = ?auto_39513 ?auto_39514 ) ) ( not ( = ?auto_39517 ?auto_39521 ) ) ( HOIST-AT ?auto_39516 ?auto_39517 ) ( not ( = ?auto_39519 ?auto_39516 ) ) ( AVAILABLE ?auto_39516 ) ( SURFACE-AT ?auto_39514 ?auto_39517 ) ( ON ?auto_39514 ?auto_39520 ) ( CLEAR ?auto_39514 ) ( not ( = ?auto_39515 ?auto_39520 ) ) ( not ( = ?auto_39514 ?auto_39520 ) ) ( not ( = ?auto_39513 ?auto_39520 ) ) ( TRUCK-AT ?auto_39518 ?auto_39521 ) ( SURFACE-AT ?auto_39513 ?auto_39521 ) ( CLEAR ?auto_39513 ) ( LIFTING ?auto_39519 ?auto_39515 ) ( IS-CRATE ?auto_39515 ) ( ON ?auto_39512 ?auto_39511 ) ( ON ?auto_39513 ?auto_39512 ) ( not ( = ?auto_39511 ?auto_39512 ) ) ( not ( = ?auto_39511 ?auto_39513 ) ) ( not ( = ?auto_39511 ?auto_39515 ) ) ( not ( = ?auto_39511 ?auto_39514 ) ) ( not ( = ?auto_39511 ?auto_39520 ) ) ( not ( = ?auto_39512 ?auto_39513 ) ) ( not ( = ?auto_39512 ?auto_39515 ) ) ( not ( = ?auto_39512 ?auto_39514 ) ) ( not ( = ?auto_39512 ?auto_39520 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39513 ?auto_39515 ?auto_39514 )
      ( MAKE-4CRATE-VERIFY ?auto_39511 ?auto_39512 ?auto_39513 ?auto_39515 ?auto_39514 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39550 - SURFACE
      ?auto_39551 - SURFACE
      ?auto_39552 - SURFACE
      ?auto_39554 - SURFACE
      ?auto_39553 - SURFACE
    )
    :vars
    (
      ?auto_39560 - HOIST
      ?auto_39558 - PLACE
      ?auto_39556 - PLACE
      ?auto_39555 - HOIST
      ?auto_39559 - SURFACE
      ?auto_39557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39560 ?auto_39558 ) ( IS-CRATE ?auto_39553 ) ( not ( = ?auto_39554 ?auto_39553 ) ) ( not ( = ?auto_39552 ?auto_39554 ) ) ( not ( = ?auto_39552 ?auto_39553 ) ) ( not ( = ?auto_39556 ?auto_39558 ) ) ( HOIST-AT ?auto_39555 ?auto_39556 ) ( not ( = ?auto_39560 ?auto_39555 ) ) ( AVAILABLE ?auto_39555 ) ( SURFACE-AT ?auto_39553 ?auto_39556 ) ( ON ?auto_39553 ?auto_39559 ) ( CLEAR ?auto_39553 ) ( not ( = ?auto_39554 ?auto_39559 ) ) ( not ( = ?auto_39553 ?auto_39559 ) ) ( not ( = ?auto_39552 ?auto_39559 ) ) ( TRUCK-AT ?auto_39557 ?auto_39558 ) ( SURFACE-AT ?auto_39552 ?auto_39558 ) ( CLEAR ?auto_39552 ) ( IS-CRATE ?auto_39554 ) ( AVAILABLE ?auto_39560 ) ( IN ?auto_39554 ?auto_39557 ) ( ON ?auto_39551 ?auto_39550 ) ( ON ?auto_39552 ?auto_39551 ) ( not ( = ?auto_39550 ?auto_39551 ) ) ( not ( = ?auto_39550 ?auto_39552 ) ) ( not ( = ?auto_39550 ?auto_39554 ) ) ( not ( = ?auto_39550 ?auto_39553 ) ) ( not ( = ?auto_39550 ?auto_39559 ) ) ( not ( = ?auto_39551 ?auto_39552 ) ) ( not ( = ?auto_39551 ?auto_39554 ) ) ( not ( = ?auto_39551 ?auto_39553 ) ) ( not ( = ?auto_39551 ?auto_39559 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39552 ?auto_39554 ?auto_39553 )
      ( MAKE-4CRATE-VERIFY ?auto_39550 ?auto_39551 ?auto_39552 ?auto_39554 ?auto_39553 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_40050 - SURFACE
      ?auto_40051 - SURFACE
    )
    :vars
    (
      ?auto_40055 - HOIST
      ?auto_40053 - PLACE
      ?auto_40057 - SURFACE
      ?auto_40056 - PLACE
      ?auto_40058 - HOIST
      ?auto_40054 - SURFACE
      ?auto_40052 - TRUCK
      ?auto_40059 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40055 ?auto_40053 ) ( SURFACE-AT ?auto_40050 ?auto_40053 ) ( CLEAR ?auto_40050 ) ( IS-CRATE ?auto_40051 ) ( not ( = ?auto_40050 ?auto_40051 ) ) ( ON ?auto_40050 ?auto_40057 ) ( not ( = ?auto_40057 ?auto_40050 ) ) ( not ( = ?auto_40057 ?auto_40051 ) ) ( not ( = ?auto_40056 ?auto_40053 ) ) ( HOIST-AT ?auto_40058 ?auto_40056 ) ( not ( = ?auto_40055 ?auto_40058 ) ) ( AVAILABLE ?auto_40058 ) ( SURFACE-AT ?auto_40051 ?auto_40056 ) ( ON ?auto_40051 ?auto_40054 ) ( CLEAR ?auto_40051 ) ( not ( = ?auto_40050 ?auto_40054 ) ) ( not ( = ?auto_40051 ?auto_40054 ) ) ( not ( = ?auto_40057 ?auto_40054 ) ) ( TRUCK-AT ?auto_40052 ?auto_40053 ) ( LIFTING ?auto_40055 ?auto_40059 ) ( IS-CRATE ?auto_40059 ) ( not ( = ?auto_40050 ?auto_40059 ) ) ( not ( = ?auto_40051 ?auto_40059 ) ) ( not ( = ?auto_40057 ?auto_40059 ) ) ( not ( = ?auto_40054 ?auto_40059 ) ) )
    :subtasks
    ( ( !LOAD ?auto_40055 ?auto_40059 ?auto_40052 ?auto_40053 )
      ( MAKE-1CRATE ?auto_40050 ?auto_40051 )
      ( MAKE-1CRATE-VERIFY ?auto_40050 ?auto_40051 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40209 - SURFACE
      ?auto_40210 - SURFACE
      ?auto_40211 - SURFACE
      ?auto_40213 - SURFACE
      ?auto_40212 - SURFACE
      ?auto_40214 - SURFACE
    )
    :vars
    (
      ?auto_40215 - HOIST
      ?auto_40216 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40215 ?auto_40216 ) ( SURFACE-AT ?auto_40212 ?auto_40216 ) ( CLEAR ?auto_40212 ) ( LIFTING ?auto_40215 ?auto_40214 ) ( IS-CRATE ?auto_40214 ) ( not ( = ?auto_40212 ?auto_40214 ) ) ( ON ?auto_40210 ?auto_40209 ) ( ON ?auto_40211 ?auto_40210 ) ( ON ?auto_40213 ?auto_40211 ) ( ON ?auto_40212 ?auto_40213 ) ( not ( = ?auto_40209 ?auto_40210 ) ) ( not ( = ?auto_40209 ?auto_40211 ) ) ( not ( = ?auto_40209 ?auto_40213 ) ) ( not ( = ?auto_40209 ?auto_40212 ) ) ( not ( = ?auto_40209 ?auto_40214 ) ) ( not ( = ?auto_40210 ?auto_40211 ) ) ( not ( = ?auto_40210 ?auto_40213 ) ) ( not ( = ?auto_40210 ?auto_40212 ) ) ( not ( = ?auto_40210 ?auto_40214 ) ) ( not ( = ?auto_40211 ?auto_40213 ) ) ( not ( = ?auto_40211 ?auto_40212 ) ) ( not ( = ?auto_40211 ?auto_40214 ) ) ( not ( = ?auto_40213 ?auto_40212 ) ) ( not ( = ?auto_40213 ?auto_40214 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_40212 ?auto_40214 )
      ( MAKE-5CRATE-VERIFY ?auto_40209 ?auto_40210 ?auto_40211 ?auto_40213 ?auto_40212 ?auto_40214 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40243 - SURFACE
      ?auto_40244 - SURFACE
      ?auto_40245 - SURFACE
      ?auto_40247 - SURFACE
      ?auto_40246 - SURFACE
      ?auto_40248 - SURFACE
    )
    :vars
    (
      ?auto_40251 - HOIST
      ?auto_40250 - PLACE
      ?auto_40249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40251 ?auto_40250 ) ( SURFACE-AT ?auto_40246 ?auto_40250 ) ( CLEAR ?auto_40246 ) ( IS-CRATE ?auto_40248 ) ( not ( = ?auto_40246 ?auto_40248 ) ) ( TRUCK-AT ?auto_40249 ?auto_40250 ) ( AVAILABLE ?auto_40251 ) ( IN ?auto_40248 ?auto_40249 ) ( ON ?auto_40246 ?auto_40247 ) ( not ( = ?auto_40247 ?auto_40246 ) ) ( not ( = ?auto_40247 ?auto_40248 ) ) ( ON ?auto_40244 ?auto_40243 ) ( ON ?auto_40245 ?auto_40244 ) ( ON ?auto_40247 ?auto_40245 ) ( not ( = ?auto_40243 ?auto_40244 ) ) ( not ( = ?auto_40243 ?auto_40245 ) ) ( not ( = ?auto_40243 ?auto_40247 ) ) ( not ( = ?auto_40243 ?auto_40246 ) ) ( not ( = ?auto_40243 ?auto_40248 ) ) ( not ( = ?auto_40244 ?auto_40245 ) ) ( not ( = ?auto_40244 ?auto_40247 ) ) ( not ( = ?auto_40244 ?auto_40246 ) ) ( not ( = ?auto_40244 ?auto_40248 ) ) ( not ( = ?auto_40245 ?auto_40247 ) ) ( not ( = ?auto_40245 ?auto_40246 ) ) ( not ( = ?auto_40245 ?auto_40248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40247 ?auto_40246 ?auto_40248 )
      ( MAKE-5CRATE-VERIFY ?auto_40243 ?auto_40244 ?auto_40245 ?auto_40247 ?auto_40246 ?auto_40248 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40283 - SURFACE
      ?auto_40284 - SURFACE
      ?auto_40285 - SURFACE
      ?auto_40287 - SURFACE
      ?auto_40286 - SURFACE
      ?auto_40288 - SURFACE
    )
    :vars
    (
      ?auto_40289 - HOIST
      ?auto_40292 - PLACE
      ?auto_40290 - TRUCK
      ?auto_40291 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40289 ?auto_40292 ) ( SURFACE-AT ?auto_40286 ?auto_40292 ) ( CLEAR ?auto_40286 ) ( IS-CRATE ?auto_40288 ) ( not ( = ?auto_40286 ?auto_40288 ) ) ( AVAILABLE ?auto_40289 ) ( IN ?auto_40288 ?auto_40290 ) ( ON ?auto_40286 ?auto_40287 ) ( not ( = ?auto_40287 ?auto_40286 ) ) ( not ( = ?auto_40287 ?auto_40288 ) ) ( TRUCK-AT ?auto_40290 ?auto_40291 ) ( not ( = ?auto_40291 ?auto_40292 ) ) ( ON ?auto_40284 ?auto_40283 ) ( ON ?auto_40285 ?auto_40284 ) ( ON ?auto_40287 ?auto_40285 ) ( not ( = ?auto_40283 ?auto_40284 ) ) ( not ( = ?auto_40283 ?auto_40285 ) ) ( not ( = ?auto_40283 ?auto_40287 ) ) ( not ( = ?auto_40283 ?auto_40286 ) ) ( not ( = ?auto_40283 ?auto_40288 ) ) ( not ( = ?auto_40284 ?auto_40285 ) ) ( not ( = ?auto_40284 ?auto_40287 ) ) ( not ( = ?auto_40284 ?auto_40286 ) ) ( not ( = ?auto_40284 ?auto_40288 ) ) ( not ( = ?auto_40285 ?auto_40287 ) ) ( not ( = ?auto_40285 ?auto_40286 ) ) ( not ( = ?auto_40285 ?auto_40288 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40287 ?auto_40286 ?auto_40288 )
      ( MAKE-5CRATE-VERIFY ?auto_40283 ?auto_40284 ?auto_40285 ?auto_40287 ?auto_40286 ?auto_40288 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40328 - SURFACE
      ?auto_40329 - SURFACE
      ?auto_40330 - SURFACE
      ?auto_40332 - SURFACE
      ?auto_40331 - SURFACE
      ?auto_40333 - SURFACE
    )
    :vars
    (
      ?auto_40337 - HOIST
      ?auto_40338 - PLACE
      ?auto_40334 - TRUCK
      ?auto_40336 - PLACE
      ?auto_40335 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_40337 ?auto_40338 ) ( SURFACE-AT ?auto_40331 ?auto_40338 ) ( CLEAR ?auto_40331 ) ( IS-CRATE ?auto_40333 ) ( not ( = ?auto_40331 ?auto_40333 ) ) ( AVAILABLE ?auto_40337 ) ( ON ?auto_40331 ?auto_40332 ) ( not ( = ?auto_40332 ?auto_40331 ) ) ( not ( = ?auto_40332 ?auto_40333 ) ) ( TRUCK-AT ?auto_40334 ?auto_40336 ) ( not ( = ?auto_40336 ?auto_40338 ) ) ( HOIST-AT ?auto_40335 ?auto_40336 ) ( LIFTING ?auto_40335 ?auto_40333 ) ( not ( = ?auto_40337 ?auto_40335 ) ) ( ON ?auto_40329 ?auto_40328 ) ( ON ?auto_40330 ?auto_40329 ) ( ON ?auto_40332 ?auto_40330 ) ( not ( = ?auto_40328 ?auto_40329 ) ) ( not ( = ?auto_40328 ?auto_40330 ) ) ( not ( = ?auto_40328 ?auto_40332 ) ) ( not ( = ?auto_40328 ?auto_40331 ) ) ( not ( = ?auto_40328 ?auto_40333 ) ) ( not ( = ?auto_40329 ?auto_40330 ) ) ( not ( = ?auto_40329 ?auto_40332 ) ) ( not ( = ?auto_40329 ?auto_40331 ) ) ( not ( = ?auto_40329 ?auto_40333 ) ) ( not ( = ?auto_40330 ?auto_40332 ) ) ( not ( = ?auto_40330 ?auto_40331 ) ) ( not ( = ?auto_40330 ?auto_40333 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40332 ?auto_40331 ?auto_40333 )
      ( MAKE-5CRATE-VERIFY ?auto_40328 ?auto_40329 ?auto_40330 ?auto_40332 ?auto_40331 ?auto_40333 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40378 - SURFACE
      ?auto_40379 - SURFACE
      ?auto_40380 - SURFACE
      ?auto_40382 - SURFACE
      ?auto_40381 - SURFACE
      ?auto_40383 - SURFACE
    )
    :vars
    (
      ?auto_40389 - HOIST
      ?auto_40387 - PLACE
      ?auto_40388 - TRUCK
      ?auto_40385 - PLACE
      ?auto_40386 - HOIST
      ?auto_40384 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40389 ?auto_40387 ) ( SURFACE-AT ?auto_40381 ?auto_40387 ) ( CLEAR ?auto_40381 ) ( IS-CRATE ?auto_40383 ) ( not ( = ?auto_40381 ?auto_40383 ) ) ( AVAILABLE ?auto_40389 ) ( ON ?auto_40381 ?auto_40382 ) ( not ( = ?auto_40382 ?auto_40381 ) ) ( not ( = ?auto_40382 ?auto_40383 ) ) ( TRUCK-AT ?auto_40388 ?auto_40385 ) ( not ( = ?auto_40385 ?auto_40387 ) ) ( HOIST-AT ?auto_40386 ?auto_40385 ) ( not ( = ?auto_40389 ?auto_40386 ) ) ( AVAILABLE ?auto_40386 ) ( SURFACE-AT ?auto_40383 ?auto_40385 ) ( ON ?auto_40383 ?auto_40384 ) ( CLEAR ?auto_40383 ) ( not ( = ?auto_40381 ?auto_40384 ) ) ( not ( = ?auto_40383 ?auto_40384 ) ) ( not ( = ?auto_40382 ?auto_40384 ) ) ( ON ?auto_40379 ?auto_40378 ) ( ON ?auto_40380 ?auto_40379 ) ( ON ?auto_40382 ?auto_40380 ) ( not ( = ?auto_40378 ?auto_40379 ) ) ( not ( = ?auto_40378 ?auto_40380 ) ) ( not ( = ?auto_40378 ?auto_40382 ) ) ( not ( = ?auto_40378 ?auto_40381 ) ) ( not ( = ?auto_40378 ?auto_40383 ) ) ( not ( = ?auto_40378 ?auto_40384 ) ) ( not ( = ?auto_40379 ?auto_40380 ) ) ( not ( = ?auto_40379 ?auto_40382 ) ) ( not ( = ?auto_40379 ?auto_40381 ) ) ( not ( = ?auto_40379 ?auto_40383 ) ) ( not ( = ?auto_40379 ?auto_40384 ) ) ( not ( = ?auto_40380 ?auto_40382 ) ) ( not ( = ?auto_40380 ?auto_40381 ) ) ( not ( = ?auto_40380 ?auto_40383 ) ) ( not ( = ?auto_40380 ?auto_40384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40382 ?auto_40381 ?auto_40383 )
      ( MAKE-5CRATE-VERIFY ?auto_40378 ?auto_40379 ?auto_40380 ?auto_40382 ?auto_40381 ?auto_40383 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40429 - SURFACE
      ?auto_40430 - SURFACE
      ?auto_40431 - SURFACE
      ?auto_40433 - SURFACE
      ?auto_40432 - SURFACE
      ?auto_40434 - SURFACE
    )
    :vars
    (
      ?auto_40436 - HOIST
      ?auto_40439 - PLACE
      ?auto_40440 - PLACE
      ?auto_40438 - HOIST
      ?auto_40435 - SURFACE
      ?auto_40437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40436 ?auto_40439 ) ( SURFACE-AT ?auto_40432 ?auto_40439 ) ( CLEAR ?auto_40432 ) ( IS-CRATE ?auto_40434 ) ( not ( = ?auto_40432 ?auto_40434 ) ) ( AVAILABLE ?auto_40436 ) ( ON ?auto_40432 ?auto_40433 ) ( not ( = ?auto_40433 ?auto_40432 ) ) ( not ( = ?auto_40433 ?auto_40434 ) ) ( not ( = ?auto_40440 ?auto_40439 ) ) ( HOIST-AT ?auto_40438 ?auto_40440 ) ( not ( = ?auto_40436 ?auto_40438 ) ) ( AVAILABLE ?auto_40438 ) ( SURFACE-AT ?auto_40434 ?auto_40440 ) ( ON ?auto_40434 ?auto_40435 ) ( CLEAR ?auto_40434 ) ( not ( = ?auto_40432 ?auto_40435 ) ) ( not ( = ?auto_40434 ?auto_40435 ) ) ( not ( = ?auto_40433 ?auto_40435 ) ) ( TRUCK-AT ?auto_40437 ?auto_40439 ) ( ON ?auto_40430 ?auto_40429 ) ( ON ?auto_40431 ?auto_40430 ) ( ON ?auto_40433 ?auto_40431 ) ( not ( = ?auto_40429 ?auto_40430 ) ) ( not ( = ?auto_40429 ?auto_40431 ) ) ( not ( = ?auto_40429 ?auto_40433 ) ) ( not ( = ?auto_40429 ?auto_40432 ) ) ( not ( = ?auto_40429 ?auto_40434 ) ) ( not ( = ?auto_40429 ?auto_40435 ) ) ( not ( = ?auto_40430 ?auto_40431 ) ) ( not ( = ?auto_40430 ?auto_40433 ) ) ( not ( = ?auto_40430 ?auto_40432 ) ) ( not ( = ?auto_40430 ?auto_40434 ) ) ( not ( = ?auto_40430 ?auto_40435 ) ) ( not ( = ?auto_40431 ?auto_40433 ) ) ( not ( = ?auto_40431 ?auto_40432 ) ) ( not ( = ?auto_40431 ?auto_40434 ) ) ( not ( = ?auto_40431 ?auto_40435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40433 ?auto_40432 ?auto_40434 )
      ( MAKE-5CRATE-VERIFY ?auto_40429 ?auto_40430 ?auto_40431 ?auto_40433 ?auto_40432 ?auto_40434 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40480 - SURFACE
      ?auto_40481 - SURFACE
      ?auto_40482 - SURFACE
      ?auto_40484 - SURFACE
      ?auto_40483 - SURFACE
      ?auto_40485 - SURFACE
    )
    :vars
    (
      ?auto_40489 - HOIST
      ?auto_40490 - PLACE
      ?auto_40487 - PLACE
      ?auto_40486 - HOIST
      ?auto_40491 - SURFACE
      ?auto_40488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40489 ?auto_40490 ) ( IS-CRATE ?auto_40485 ) ( not ( = ?auto_40483 ?auto_40485 ) ) ( not ( = ?auto_40484 ?auto_40483 ) ) ( not ( = ?auto_40484 ?auto_40485 ) ) ( not ( = ?auto_40487 ?auto_40490 ) ) ( HOIST-AT ?auto_40486 ?auto_40487 ) ( not ( = ?auto_40489 ?auto_40486 ) ) ( AVAILABLE ?auto_40486 ) ( SURFACE-AT ?auto_40485 ?auto_40487 ) ( ON ?auto_40485 ?auto_40491 ) ( CLEAR ?auto_40485 ) ( not ( = ?auto_40483 ?auto_40491 ) ) ( not ( = ?auto_40485 ?auto_40491 ) ) ( not ( = ?auto_40484 ?auto_40491 ) ) ( TRUCK-AT ?auto_40488 ?auto_40490 ) ( SURFACE-AT ?auto_40484 ?auto_40490 ) ( CLEAR ?auto_40484 ) ( LIFTING ?auto_40489 ?auto_40483 ) ( IS-CRATE ?auto_40483 ) ( ON ?auto_40481 ?auto_40480 ) ( ON ?auto_40482 ?auto_40481 ) ( ON ?auto_40484 ?auto_40482 ) ( not ( = ?auto_40480 ?auto_40481 ) ) ( not ( = ?auto_40480 ?auto_40482 ) ) ( not ( = ?auto_40480 ?auto_40484 ) ) ( not ( = ?auto_40480 ?auto_40483 ) ) ( not ( = ?auto_40480 ?auto_40485 ) ) ( not ( = ?auto_40480 ?auto_40491 ) ) ( not ( = ?auto_40481 ?auto_40482 ) ) ( not ( = ?auto_40481 ?auto_40484 ) ) ( not ( = ?auto_40481 ?auto_40483 ) ) ( not ( = ?auto_40481 ?auto_40485 ) ) ( not ( = ?auto_40481 ?auto_40491 ) ) ( not ( = ?auto_40482 ?auto_40484 ) ) ( not ( = ?auto_40482 ?auto_40483 ) ) ( not ( = ?auto_40482 ?auto_40485 ) ) ( not ( = ?auto_40482 ?auto_40491 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40484 ?auto_40483 ?auto_40485 )
      ( MAKE-5CRATE-VERIFY ?auto_40480 ?auto_40481 ?auto_40482 ?auto_40484 ?auto_40483 ?auto_40485 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40531 - SURFACE
      ?auto_40532 - SURFACE
      ?auto_40533 - SURFACE
      ?auto_40535 - SURFACE
      ?auto_40534 - SURFACE
      ?auto_40536 - SURFACE
    )
    :vars
    (
      ?auto_40538 - HOIST
      ?auto_40539 - PLACE
      ?auto_40542 - PLACE
      ?auto_40540 - HOIST
      ?auto_40541 - SURFACE
      ?auto_40537 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40538 ?auto_40539 ) ( IS-CRATE ?auto_40536 ) ( not ( = ?auto_40534 ?auto_40536 ) ) ( not ( = ?auto_40535 ?auto_40534 ) ) ( not ( = ?auto_40535 ?auto_40536 ) ) ( not ( = ?auto_40542 ?auto_40539 ) ) ( HOIST-AT ?auto_40540 ?auto_40542 ) ( not ( = ?auto_40538 ?auto_40540 ) ) ( AVAILABLE ?auto_40540 ) ( SURFACE-AT ?auto_40536 ?auto_40542 ) ( ON ?auto_40536 ?auto_40541 ) ( CLEAR ?auto_40536 ) ( not ( = ?auto_40534 ?auto_40541 ) ) ( not ( = ?auto_40536 ?auto_40541 ) ) ( not ( = ?auto_40535 ?auto_40541 ) ) ( TRUCK-AT ?auto_40537 ?auto_40539 ) ( SURFACE-AT ?auto_40535 ?auto_40539 ) ( CLEAR ?auto_40535 ) ( IS-CRATE ?auto_40534 ) ( AVAILABLE ?auto_40538 ) ( IN ?auto_40534 ?auto_40537 ) ( ON ?auto_40532 ?auto_40531 ) ( ON ?auto_40533 ?auto_40532 ) ( ON ?auto_40535 ?auto_40533 ) ( not ( = ?auto_40531 ?auto_40532 ) ) ( not ( = ?auto_40531 ?auto_40533 ) ) ( not ( = ?auto_40531 ?auto_40535 ) ) ( not ( = ?auto_40531 ?auto_40534 ) ) ( not ( = ?auto_40531 ?auto_40536 ) ) ( not ( = ?auto_40531 ?auto_40541 ) ) ( not ( = ?auto_40532 ?auto_40533 ) ) ( not ( = ?auto_40532 ?auto_40535 ) ) ( not ( = ?auto_40532 ?auto_40534 ) ) ( not ( = ?auto_40532 ?auto_40536 ) ) ( not ( = ?auto_40532 ?auto_40541 ) ) ( not ( = ?auto_40533 ?auto_40535 ) ) ( not ( = ?auto_40533 ?auto_40534 ) ) ( not ( = ?auto_40533 ?auto_40536 ) ) ( not ( = ?auto_40533 ?auto_40541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40535 ?auto_40534 ?auto_40536 )
      ( MAKE-5CRATE-VERIFY ?auto_40531 ?auto_40532 ?auto_40533 ?auto_40535 ?auto_40534 ?auto_40536 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_41737 - SURFACE
      ?auto_41738 - SURFACE
      ?auto_41739 - SURFACE
      ?auto_41741 - SURFACE
      ?auto_41740 - SURFACE
      ?auto_41742 - SURFACE
      ?auto_41743 - SURFACE
    )
    :vars
    (
      ?auto_41745 - HOIST
      ?auto_41744 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41745 ?auto_41744 ) ( SURFACE-AT ?auto_41742 ?auto_41744 ) ( CLEAR ?auto_41742 ) ( LIFTING ?auto_41745 ?auto_41743 ) ( IS-CRATE ?auto_41743 ) ( not ( = ?auto_41742 ?auto_41743 ) ) ( ON ?auto_41738 ?auto_41737 ) ( ON ?auto_41739 ?auto_41738 ) ( ON ?auto_41741 ?auto_41739 ) ( ON ?auto_41740 ?auto_41741 ) ( ON ?auto_41742 ?auto_41740 ) ( not ( = ?auto_41737 ?auto_41738 ) ) ( not ( = ?auto_41737 ?auto_41739 ) ) ( not ( = ?auto_41737 ?auto_41741 ) ) ( not ( = ?auto_41737 ?auto_41740 ) ) ( not ( = ?auto_41737 ?auto_41742 ) ) ( not ( = ?auto_41737 ?auto_41743 ) ) ( not ( = ?auto_41738 ?auto_41739 ) ) ( not ( = ?auto_41738 ?auto_41741 ) ) ( not ( = ?auto_41738 ?auto_41740 ) ) ( not ( = ?auto_41738 ?auto_41742 ) ) ( not ( = ?auto_41738 ?auto_41743 ) ) ( not ( = ?auto_41739 ?auto_41741 ) ) ( not ( = ?auto_41739 ?auto_41740 ) ) ( not ( = ?auto_41739 ?auto_41742 ) ) ( not ( = ?auto_41739 ?auto_41743 ) ) ( not ( = ?auto_41741 ?auto_41740 ) ) ( not ( = ?auto_41741 ?auto_41742 ) ) ( not ( = ?auto_41741 ?auto_41743 ) ) ( not ( = ?auto_41740 ?auto_41742 ) ) ( not ( = ?auto_41740 ?auto_41743 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_41742 ?auto_41743 )
      ( MAKE-6CRATE-VERIFY ?auto_41737 ?auto_41738 ?auto_41739 ?auto_41741 ?auto_41740 ?auto_41742 ?auto_41743 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_41781 - SURFACE
      ?auto_41782 - SURFACE
      ?auto_41783 - SURFACE
      ?auto_41785 - SURFACE
      ?auto_41784 - SURFACE
      ?auto_41786 - SURFACE
      ?auto_41787 - SURFACE
    )
    :vars
    (
      ?auto_41789 - HOIST
      ?auto_41788 - PLACE
      ?auto_41790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41789 ?auto_41788 ) ( SURFACE-AT ?auto_41786 ?auto_41788 ) ( CLEAR ?auto_41786 ) ( IS-CRATE ?auto_41787 ) ( not ( = ?auto_41786 ?auto_41787 ) ) ( TRUCK-AT ?auto_41790 ?auto_41788 ) ( AVAILABLE ?auto_41789 ) ( IN ?auto_41787 ?auto_41790 ) ( ON ?auto_41786 ?auto_41784 ) ( not ( = ?auto_41784 ?auto_41786 ) ) ( not ( = ?auto_41784 ?auto_41787 ) ) ( ON ?auto_41782 ?auto_41781 ) ( ON ?auto_41783 ?auto_41782 ) ( ON ?auto_41785 ?auto_41783 ) ( ON ?auto_41784 ?auto_41785 ) ( not ( = ?auto_41781 ?auto_41782 ) ) ( not ( = ?auto_41781 ?auto_41783 ) ) ( not ( = ?auto_41781 ?auto_41785 ) ) ( not ( = ?auto_41781 ?auto_41784 ) ) ( not ( = ?auto_41781 ?auto_41786 ) ) ( not ( = ?auto_41781 ?auto_41787 ) ) ( not ( = ?auto_41782 ?auto_41783 ) ) ( not ( = ?auto_41782 ?auto_41785 ) ) ( not ( = ?auto_41782 ?auto_41784 ) ) ( not ( = ?auto_41782 ?auto_41786 ) ) ( not ( = ?auto_41782 ?auto_41787 ) ) ( not ( = ?auto_41783 ?auto_41785 ) ) ( not ( = ?auto_41783 ?auto_41784 ) ) ( not ( = ?auto_41783 ?auto_41786 ) ) ( not ( = ?auto_41783 ?auto_41787 ) ) ( not ( = ?auto_41785 ?auto_41784 ) ) ( not ( = ?auto_41785 ?auto_41786 ) ) ( not ( = ?auto_41785 ?auto_41787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_41784 ?auto_41786 ?auto_41787 )
      ( MAKE-6CRATE-VERIFY ?auto_41781 ?auto_41782 ?auto_41783 ?auto_41785 ?auto_41784 ?auto_41786 ?auto_41787 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_41832 - SURFACE
      ?auto_41833 - SURFACE
      ?auto_41834 - SURFACE
      ?auto_41836 - SURFACE
      ?auto_41835 - SURFACE
      ?auto_41837 - SURFACE
      ?auto_41838 - SURFACE
    )
    :vars
    (
      ?auto_41840 - HOIST
      ?auto_41839 - PLACE
      ?auto_41842 - TRUCK
      ?auto_41841 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41840 ?auto_41839 ) ( SURFACE-AT ?auto_41837 ?auto_41839 ) ( CLEAR ?auto_41837 ) ( IS-CRATE ?auto_41838 ) ( not ( = ?auto_41837 ?auto_41838 ) ) ( AVAILABLE ?auto_41840 ) ( IN ?auto_41838 ?auto_41842 ) ( ON ?auto_41837 ?auto_41835 ) ( not ( = ?auto_41835 ?auto_41837 ) ) ( not ( = ?auto_41835 ?auto_41838 ) ) ( TRUCK-AT ?auto_41842 ?auto_41841 ) ( not ( = ?auto_41841 ?auto_41839 ) ) ( ON ?auto_41833 ?auto_41832 ) ( ON ?auto_41834 ?auto_41833 ) ( ON ?auto_41836 ?auto_41834 ) ( ON ?auto_41835 ?auto_41836 ) ( not ( = ?auto_41832 ?auto_41833 ) ) ( not ( = ?auto_41832 ?auto_41834 ) ) ( not ( = ?auto_41832 ?auto_41836 ) ) ( not ( = ?auto_41832 ?auto_41835 ) ) ( not ( = ?auto_41832 ?auto_41837 ) ) ( not ( = ?auto_41832 ?auto_41838 ) ) ( not ( = ?auto_41833 ?auto_41834 ) ) ( not ( = ?auto_41833 ?auto_41836 ) ) ( not ( = ?auto_41833 ?auto_41835 ) ) ( not ( = ?auto_41833 ?auto_41837 ) ) ( not ( = ?auto_41833 ?auto_41838 ) ) ( not ( = ?auto_41834 ?auto_41836 ) ) ( not ( = ?auto_41834 ?auto_41835 ) ) ( not ( = ?auto_41834 ?auto_41837 ) ) ( not ( = ?auto_41834 ?auto_41838 ) ) ( not ( = ?auto_41836 ?auto_41835 ) ) ( not ( = ?auto_41836 ?auto_41837 ) ) ( not ( = ?auto_41836 ?auto_41838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_41835 ?auto_41837 ?auto_41838 )
      ( MAKE-6CRATE-VERIFY ?auto_41832 ?auto_41833 ?auto_41834 ?auto_41836 ?auto_41835 ?auto_41837 ?auto_41838 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_41889 - SURFACE
      ?auto_41890 - SURFACE
      ?auto_41891 - SURFACE
      ?auto_41893 - SURFACE
      ?auto_41892 - SURFACE
      ?auto_41894 - SURFACE
      ?auto_41895 - SURFACE
    )
    :vars
    (
      ?auto_41900 - HOIST
      ?auto_41897 - PLACE
      ?auto_41899 - TRUCK
      ?auto_41898 - PLACE
      ?auto_41896 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_41900 ?auto_41897 ) ( SURFACE-AT ?auto_41894 ?auto_41897 ) ( CLEAR ?auto_41894 ) ( IS-CRATE ?auto_41895 ) ( not ( = ?auto_41894 ?auto_41895 ) ) ( AVAILABLE ?auto_41900 ) ( ON ?auto_41894 ?auto_41892 ) ( not ( = ?auto_41892 ?auto_41894 ) ) ( not ( = ?auto_41892 ?auto_41895 ) ) ( TRUCK-AT ?auto_41899 ?auto_41898 ) ( not ( = ?auto_41898 ?auto_41897 ) ) ( HOIST-AT ?auto_41896 ?auto_41898 ) ( LIFTING ?auto_41896 ?auto_41895 ) ( not ( = ?auto_41900 ?auto_41896 ) ) ( ON ?auto_41890 ?auto_41889 ) ( ON ?auto_41891 ?auto_41890 ) ( ON ?auto_41893 ?auto_41891 ) ( ON ?auto_41892 ?auto_41893 ) ( not ( = ?auto_41889 ?auto_41890 ) ) ( not ( = ?auto_41889 ?auto_41891 ) ) ( not ( = ?auto_41889 ?auto_41893 ) ) ( not ( = ?auto_41889 ?auto_41892 ) ) ( not ( = ?auto_41889 ?auto_41894 ) ) ( not ( = ?auto_41889 ?auto_41895 ) ) ( not ( = ?auto_41890 ?auto_41891 ) ) ( not ( = ?auto_41890 ?auto_41893 ) ) ( not ( = ?auto_41890 ?auto_41892 ) ) ( not ( = ?auto_41890 ?auto_41894 ) ) ( not ( = ?auto_41890 ?auto_41895 ) ) ( not ( = ?auto_41891 ?auto_41893 ) ) ( not ( = ?auto_41891 ?auto_41892 ) ) ( not ( = ?auto_41891 ?auto_41894 ) ) ( not ( = ?auto_41891 ?auto_41895 ) ) ( not ( = ?auto_41893 ?auto_41892 ) ) ( not ( = ?auto_41893 ?auto_41894 ) ) ( not ( = ?auto_41893 ?auto_41895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_41892 ?auto_41894 ?auto_41895 )
      ( MAKE-6CRATE-VERIFY ?auto_41889 ?auto_41890 ?auto_41891 ?auto_41893 ?auto_41892 ?auto_41894 ?auto_41895 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_41952 - SURFACE
      ?auto_41953 - SURFACE
      ?auto_41954 - SURFACE
      ?auto_41956 - SURFACE
      ?auto_41955 - SURFACE
      ?auto_41957 - SURFACE
      ?auto_41958 - SURFACE
    )
    :vars
    (
      ?auto_41959 - HOIST
      ?auto_41961 - PLACE
      ?auto_41964 - TRUCK
      ?auto_41962 - PLACE
      ?auto_41963 - HOIST
      ?auto_41960 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41959 ?auto_41961 ) ( SURFACE-AT ?auto_41957 ?auto_41961 ) ( CLEAR ?auto_41957 ) ( IS-CRATE ?auto_41958 ) ( not ( = ?auto_41957 ?auto_41958 ) ) ( AVAILABLE ?auto_41959 ) ( ON ?auto_41957 ?auto_41955 ) ( not ( = ?auto_41955 ?auto_41957 ) ) ( not ( = ?auto_41955 ?auto_41958 ) ) ( TRUCK-AT ?auto_41964 ?auto_41962 ) ( not ( = ?auto_41962 ?auto_41961 ) ) ( HOIST-AT ?auto_41963 ?auto_41962 ) ( not ( = ?auto_41959 ?auto_41963 ) ) ( AVAILABLE ?auto_41963 ) ( SURFACE-AT ?auto_41958 ?auto_41962 ) ( ON ?auto_41958 ?auto_41960 ) ( CLEAR ?auto_41958 ) ( not ( = ?auto_41957 ?auto_41960 ) ) ( not ( = ?auto_41958 ?auto_41960 ) ) ( not ( = ?auto_41955 ?auto_41960 ) ) ( ON ?auto_41953 ?auto_41952 ) ( ON ?auto_41954 ?auto_41953 ) ( ON ?auto_41956 ?auto_41954 ) ( ON ?auto_41955 ?auto_41956 ) ( not ( = ?auto_41952 ?auto_41953 ) ) ( not ( = ?auto_41952 ?auto_41954 ) ) ( not ( = ?auto_41952 ?auto_41956 ) ) ( not ( = ?auto_41952 ?auto_41955 ) ) ( not ( = ?auto_41952 ?auto_41957 ) ) ( not ( = ?auto_41952 ?auto_41958 ) ) ( not ( = ?auto_41952 ?auto_41960 ) ) ( not ( = ?auto_41953 ?auto_41954 ) ) ( not ( = ?auto_41953 ?auto_41956 ) ) ( not ( = ?auto_41953 ?auto_41955 ) ) ( not ( = ?auto_41953 ?auto_41957 ) ) ( not ( = ?auto_41953 ?auto_41958 ) ) ( not ( = ?auto_41953 ?auto_41960 ) ) ( not ( = ?auto_41954 ?auto_41956 ) ) ( not ( = ?auto_41954 ?auto_41955 ) ) ( not ( = ?auto_41954 ?auto_41957 ) ) ( not ( = ?auto_41954 ?auto_41958 ) ) ( not ( = ?auto_41954 ?auto_41960 ) ) ( not ( = ?auto_41956 ?auto_41955 ) ) ( not ( = ?auto_41956 ?auto_41957 ) ) ( not ( = ?auto_41956 ?auto_41958 ) ) ( not ( = ?auto_41956 ?auto_41960 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_41955 ?auto_41957 ?auto_41958 )
      ( MAKE-6CRATE-VERIFY ?auto_41952 ?auto_41953 ?auto_41954 ?auto_41956 ?auto_41955 ?auto_41957 ?auto_41958 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_42016 - SURFACE
      ?auto_42017 - SURFACE
      ?auto_42018 - SURFACE
      ?auto_42020 - SURFACE
      ?auto_42019 - SURFACE
      ?auto_42021 - SURFACE
      ?auto_42022 - SURFACE
    )
    :vars
    (
      ?auto_42025 - HOIST
      ?auto_42024 - PLACE
      ?auto_42028 - PLACE
      ?auto_42026 - HOIST
      ?auto_42023 - SURFACE
      ?auto_42027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42025 ?auto_42024 ) ( SURFACE-AT ?auto_42021 ?auto_42024 ) ( CLEAR ?auto_42021 ) ( IS-CRATE ?auto_42022 ) ( not ( = ?auto_42021 ?auto_42022 ) ) ( AVAILABLE ?auto_42025 ) ( ON ?auto_42021 ?auto_42019 ) ( not ( = ?auto_42019 ?auto_42021 ) ) ( not ( = ?auto_42019 ?auto_42022 ) ) ( not ( = ?auto_42028 ?auto_42024 ) ) ( HOIST-AT ?auto_42026 ?auto_42028 ) ( not ( = ?auto_42025 ?auto_42026 ) ) ( AVAILABLE ?auto_42026 ) ( SURFACE-AT ?auto_42022 ?auto_42028 ) ( ON ?auto_42022 ?auto_42023 ) ( CLEAR ?auto_42022 ) ( not ( = ?auto_42021 ?auto_42023 ) ) ( not ( = ?auto_42022 ?auto_42023 ) ) ( not ( = ?auto_42019 ?auto_42023 ) ) ( TRUCK-AT ?auto_42027 ?auto_42024 ) ( ON ?auto_42017 ?auto_42016 ) ( ON ?auto_42018 ?auto_42017 ) ( ON ?auto_42020 ?auto_42018 ) ( ON ?auto_42019 ?auto_42020 ) ( not ( = ?auto_42016 ?auto_42017 ) ) ( not ( = ?auto_42016 ?auto_42018 ) ) ( not ( = ?auto_42016 ?auto_42020 ) ) ( not ( = ?auto_42016 ?auto_42019 ) ) ( not ( = ?auto_42016 ?auto_42021 ) ) ( not ( = ?auto_42016 ?auto_42022 ) ) ( not ( = ?auto_42016 ?auto_42023 ) ) ( not ( = ?auto_42017 ?auto_42018 ) ) ( not ( = ?auto_42017 ?auto_42020 ) ) ( not ( = ?auto_42017 ?auto_42019 ) ) ( not ( = ?auto_42017 ?auto_42021 ) ) ( not ( = ?auto_42017 ?auto_42022 ) ) ( not ( = ?auto_42017 ?auto_42023 ) ) ( not ( = ?auto_42018 ?auto_42020 ) ) ( not ( = ?auto_42018 ?auto_42019 ) ) ( not ( = ?auto_42018 ?auto_42021 ) ) ( not ( = ?auto_42018 ?auto_42022 ) ) ( not ( = ?auto_42018 ?auto_42023 ) ) ( not ( = ?auto_42020 ?auto_42019 ) ) ( not ( = ?auto_42020 ?auto_42021 ) ) ( not ( = ?auto_42020 ?auto_42022 ) ) ( not ( = ?auto_42020 ?auto_42023 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_42019 ?auto_42021 ?auto_42022 )
      ( MAKE-6CRATE-VERIFY ?auto_42016 ?auto_42017 ?auto_42018 ?auto_42020 ?auto_42019 ?auto_42021 ?auto_42022 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_42080 - SURFACE
      ?auto_42081 - SURFACE
      ?auto_42082 - SURFACE
      ?auto_42084 - SURFACE
      ?auto_42083 - SURFACE
      ?auto_42085 - SURFACE
      ?auto_42086 - SURFACE
    )
    :vars
    (
      ?auto_42090 - HOIST
      ?auto_42091 - PLACE
      ?auto_42088 - PLACE
      ?auto_42089 - HOIST
      ?auto_42092 - SURFACE
      ?auto_42087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42090 ?auto_42091 ) ( IS-CRATE ?auto_42086 ) ( not ( = ?auto_42085 ?auto_42086 ) ) ( not ( = ?auto_42083 ?auto_42085 ) ) ( not ( = ?auto_42083 ?auto_42086 ) ) ( not ( = ?auto_42088 ?auto_42091 ) ) ( HOIST-AT ?auto_42089 ?auto_42088 ) ( not ( = ?auto_42090 ?auto_42089 ) ) ( AVAILABLE ?auto_42089 ) ( SURFACE-AT ?auto_42086 ?auto_42088 ) ( ON ?auto_42086 ?auto_42092 ) ( CLEAR ?auto_42086 ) ( not ( = ?auto_42085 ?auto_42092 ) ) ( not ( = ?auto_42086 ?auto_42092 ) ) ( not ( = ?auto_42083 ?auto_42092 ) ) ( TRUCK-AT ?auto_42087 ?auto_42091 ) ( SURFACE-AT ?auto_42083 ?auto_42091 ) ( CLEAR ?auto_42083 ) ( LIFTING ?auto_42090 ?auto_42085 ) ( IS-CRATE ?auto_42085 ) ( ON ?auto_42081 ?auto_42080 ) ( ON ?auto_42082 ?auto_42081 ) ( ON ?auto_42084 ?auto_42082 ) ( ON ?auto_42083 ?auto_42084 ) ( not ( = ?auto_42080 ?auto_42081 ) ) ( not ( = ?auto_42080 ?auto_42082 ) ) ( not ( = ?auto_42080 ?auto_42084 ) ) ( not ( = ?auto_42080 ?auto_42083 ) ) ( not ( = ?auto_42080 ?auto_42085 ) ) ( not ( = ?auto_42080 ?auto_42086 ) ) ( not ( = ?auto_42080 ?auto_42092 ) ) ( not ( = ?auto_42081 ?auto_42082 ) ) ( not ( = ?auto_42081 ?auto_42084 ) ) ( not ( = ?auto_42081 ?auto_42083 ) ) ( not ( = ?auto_42081 ?auto_42085 ) ) ( not ( = ?auto_42081 ?auto_42086 ) ) ( not ( = ?auto_42081 ?auto_42092 ) ) ( not ( = ?auto_42082 ?auto_42084 ) ) ( not ( = ?auto_42082 ?auto_42083 ) ) ( not ( = ?auto_42082 ?auto_42085 ) ) ( not ( = ?auto_42082 ?auto_42086 ) ) ( not ( = ?auto_42082 ?auto_42092 ) ) ( not ( = ?auto_42084 ?auto_42083 ) ) ( not ( = ?auto_42084 ?auto_42085 ) ) ( not ( = ?auto_42084 ?auto_42086 ) ) ( not ( = ?auto_42084 ?auto_42092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_42083 ?auto_42085 ?auto_42086 )
      ( MAKE-6CRATE-VERIFY ?auto_42080 ?auto_42081 ?auto_42082 ?auto_42084 ?auto_42083 ?auto_42085 ?auto_42086 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_42144 - SURFACE
      ?auto_42145 - SURFACE
      ?auto_42146 - SURFACE
      ?auto_42148 - SURFACE
      ?auto_42147 - SURFACE
      ?auto_42149 - SURFACE
      ?auto_42150 - SURFACE
    )
    :vars
    (
      ?auto_42151 - HOIST
      ?auto_42153 - PLACE
      ?auto_42152 - PLACE
      ?auto_42156 - HOIST
      ?auto_42154 - SURFACE
      ?auto_42155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42151 ?auto_42153 ) ( IS-CRATE ?auto_42150 ) ( not ( = ?auto_42149 ?auto_42150 ) ) ( not ( = ?auto_42147 ?auto_42149 ) ) ( not ( = ?auto_42147 ?auto_42150 ) ) ( not ( = ?auto_42152 ?auto_42153 ) ) ( HOIST-AT ?auto_42156 ?auto_42152 ) ( not ( = ?auto_42151 ?auto_42156 ) ) ( AVAILABLE ?auto_42156 ) ( SURFACE-AT ?auto_42150 ?auto_42152 ) ( ON ?auto_42150 ?auto_42154 ) ( CLEAR ?auto_42150 ) ( not ( = ?auto_42149 ?auto_42154 ) ) ( not ( = ?auto_42150 ?auto_42154 ) ) ( not ( = ?auto_42147 ?auto_42154 ) ) ( TRUCK-AT ?auto_42155 ?auto_42153 ) ( SURFACE-AT ?auto_42147 ?auto_42153 ) ( CLEAR ?auto_42147 ) ( IS-CRATE ?auto_42149 ) ( AVAILABLE ?auto_42151 ) ( IN ?auto_42149 ?auto_42155 ) ( ON ?auto_42145 ?auto_42144 ) ( ON ?auto_42146 ?auto_42145 ) ( ON ?auto_42148 ?auto_42146 ) ( ON ?auto_42147 ?auto_42148 ) ( not ( = ?auto_42144 ?auto_42145 ) ) ( not ( = ?auto_42144 ?auto_42146 ) ) ( not ( = ?auto_42144 ?auto_42148 ) ) ( not ( = ?auto_42144 ?auto_42147 ) ) ( not ( = ?auto_42144 ?auto_42149 ) ) ( not ( = ?auto_42144 ?auto_42150 ) ) ( not ( = ?auto_42144 ?auto_42154 ) ) ( not ( = ?auto_42145 ?auto_42146 ) ) ( not ( = ?auto_42145 ?auto_42148 ) ) ( not ( = ?auto_42145 ?auto_42147 ) ) ( not ( = ?auto_42145 ?auto_42149 ) ) ( not ( = ?auto_42145 ?auto_42150 ) ) ( not ( = ?auto_42145 ?auto_42154 ) ) ( not ( = ?auto_42146 ?auto_42148 ) ) ( not ( = ?auto_42146 ?auto_42147 ) ) ( not ( = ?auto_42146 ?auto_42149 ) ) ( not ( = ?auto_42146 ?auto_42150 ) ) ( not ( = ?auto_42146 ?auto_42154 ) ) ( not ( = ?auto_42148 ?auto_42147 ) ) ( not ( = ?auto_42148 ?auto_42149 ) ) ( not ( = ?auto_42148 ?auto_42150 ) ) ( not ( = ?auto_42148 ?auto_42154 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_42147 ?auto_42149 ?auto_42150 )
      ( MAKE-6CRATE-VERIFY ?auto_42144 ?auto_42145 ?auto_42146 ?auto_42148 ?auto_42147 ?auto_42149 ?auto_42150 ) )
  )

)

