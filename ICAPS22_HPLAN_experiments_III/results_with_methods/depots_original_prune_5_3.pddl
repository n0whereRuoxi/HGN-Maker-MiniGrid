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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21621 - SURFACE
      ?auto_21622 - SURFACE
    )
    :vars
    (
      ?auto_21623 - HOIST
      ?auto_21624 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21623 ?auto_21624 ) ( SURFACE-AT ?auto_21621 ?auto_21624 ) ( CLEAR ?auto_21621 ) ( LIFTING ?auto_21623 ?auto_21622 ) ( IS-CRATE ?auto_21622 ) ( not ( = ?auto_21621 ?auto_21622 ) ) )
    :subtasks
    ( ( !DROP ?auto_21623 ?auto_21622 ?auto_21621 ?auto_21624 )
      ( MAKE-1CRATE-VERIFY ?auto_21621 ?auto_21622 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21625 - SURFACE
      ?auto_21626 - SURFACE
    )
    :vars
    (
      ?auto_21627 - HOIST
      ?auto_21628 - PLACE
      ?auto_21629 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21627 ?auto_21628 ) ( SURFACE-AT ?auto_21625 ?auto_21628 ) ( CLEAR ?auto_21625 ) ( IS-CRATE ?auto_21626 ) ( not ( = ?auto_21625 ?auto_21626 ) ) ( TRUCK-AT ?auto_21629 ?auto_21628 ) ( AVAILABLE ?auto_21627 ) ( IN ?auto_21626 ?auto_21629 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21627 ?auto_21626 ?auto_21629 ?auto_21628 )
      ( MAKE-1CRATE ?auto_21625 ?auto_21626 )
      ( MAKE-1CRATE-VERIFY ?auto_21625 ?auto_21626 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21630 - SURFACE
      ?auto_21631 - SURFACE
    )
    :vars
    (
      ?auto_21633 - HOIST
      ?auto_21632 - PLACE
      ?auto_21634 - TRUCK
      ?auto_21635 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21633 ?auto_21632 ) ( SURFACE-AT ?auto_21630 ?auto_21632 ) ( CLEAR ?auto_21630 ) ( IS-CRATE ?auto_21631 ) ( not ( = ?auto_21630 ?auto_21631 ) ) ( AVAILABLE ?auto_21633 ) ( IN ?auto_21631 ?auto_21634 ) ( TRUCK-AT ?auto_21634 ?auto_21635 ) ( not ( = ?auto_21635 ?auto_21632 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21634 ?auto_21635 ?auto_21632 )
      ( MAKE-1CRATE ?auto_21630 ?auto_21631 )
      ( MAKE-1CRATE-VERIFY ?auto_21630 ?auto_21631 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21636 - SURFACE
      ?auto_21637 - SURFACE
    )
    :vars
    (
      ?auto_21638 - HOIST
      ?auto_21639 - PLACE
      ?auto_21640 - TRUCK
      ?auto_21641 - PLACE
      ?auto_21642 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21638 ?auto_21639 ) ( SURFACE-AT ?auto_21636 ?auto_21639 ) ( CLEAR ?auto_21636 ) ( IS-CRATE ?auto_21637 ) ( not ( = ?auto_21636 ?auto_21637 ) ) ( AVAILABLE ?auto_21638 ) ( TRUCK-AT ?auto_21640 ?auto_21641 ) ( not ( = ?auto_21641 ?auto_21639 ) ) ( HOIST-AT ?auto_21642 ?auto_21641 ) ( LIFTING ?auto_21642 ?auto_21637 ) ( not ( = ?auto_21638 ?auto_21642 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21642 ?auto_21637 ?auto_21640 ?auto_21641 )
      ( MAKE-1CRATE ?auto_21636 ?auto_21637 )
      ( MAKE-1CRATE-VERIFY ?auto_21636 ?auto_21637 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21643 - SURFACE
      ?auto_21644 - SURFACE
    )
    :vars
    (
      ?auto_21646 - HOIST
      ?auto_21649 - PLACE
      ?auto_21647 - TRUCK
      ?auto_21648 - PLACE
      ?auto_21645 - HOIST
      ?auto_21650 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21646 ?auto_21649 ) ( SURFACE-AT ?auto_21643 ?auto_21649 ) ( CLEAR ?auto_21643 ) ( IS-CRATE ?auto_21644 ) ( not ( = ?auto_21643 ?auto_21644 ) ) ( AVAILABLE ?auto_21646 ) ( TRUCK-AT ?auto_21647 ?auto_21648 ) ( not ( = ?auto_21648 ?auto_21649 ) ) ( HOIST-AT ?auto_21645 ?auto_21648 ) ( not ( = ?auto_21646 ?auto_21645 ) ) ( AVAILABLE ?auto_21645 ) ( SURFACE-AT ?auto_21644 ?auto_21648 ) ( ON ?auto_21644 ?auto_21650 ) ( CLEAR ?auto_21644 ) ( not ( = ?auto_21643 ?auto_21650 ) ) ( not ( = ?auto_21644 ?auto_21650 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21645 ?auto_21644 ?auto_21650 ?auto_21648 )
      ( MAKE-1CRATE ?auto_21643 ?auto_21644 )
      ( MAKE-1CRATE-VERIFY ?auto_21643 ?auto_21644 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21651 - SURFACE
      ?auto_21652 - SURFACE
    )
    :vars
    (
      ?auto_21653 - HOIST
      ?auto_21656 - PLACE
      ?auto_21658 - PLACE
      ?auto_21655 - HOIST
      ?auto_21654 - SURFACE
      ?auto_21657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21653 ?auto_21656 ) ( SURFACE-AT ?auto_21651 ?auto_21656 ) ( CLEAR ?auto_21651 ) ( IS-CRATE ?auto_21652 ) ( not ( = ?auto_21651 ?auto_21652 ) ) ( AVAILABLE ?auto_21653 ) ( not ( = ?auto_21658 ?auto_21656 ) ) ( HOIST-AT ?auto_21655 ?auto_21658 ) ( not ( = ?auto_21653 ?auto_21655 ) ) ( AVAILABLE ?auto_21655 ) ( SURFACE-AT ?auto_21652 ?auto_21658 ) ( ON ?auto_21652 ?auto_21654 ) ( CLEAR ?auto_21652 ) ( not ( = ?auto_21651 ?auto_21654 ) ) ( not ( = ?auto_21652 ?auto_21654 ) ) ( TRUCK-AT ?auto_21657 ?auto_21656 ) )
    :subtasks
    ( ( !DRIVE ?auto_21657 ?auto_21656 ?auto_21658 )
      ( MAKE-1CRATE ?auto_21651 ?auto_21652 )
      ( MAKE-1CRATE-VERIFY ?auto_21651 ?auto_21652 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21668 - SURFACE
      ?auto_21669 - SURFACE
      ?auto_21670 - SURFACE
    )
    :vars
    (
      ?auto_21672 - HOIST
      ?auto_21671 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21672 ?auto_21671 ) ( SURFACE-AT ?auto_21669 ?auto_21671 ) ( CLEAR ?auto_21669 ) ( LIFTING ?auto_21672 ?auto_21670 ) ( IS-CRATE ?auto_21670 ) ( not ( = ?auto_21669 ?auto_21670 ) ) ( ON ?auto_21669 ?auto_21668 ) ( not ( = ?auto_21668 ?auto_21669 ) ) ( not ( = ?auto_21668 ?auto_21670 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21669 ?auto_21670 )
      ( MAKE-2CRATE-VERIFY ?auto_21668 ?auto_21669 ?auto_21670 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21678 - SURFACE
      ?auto_21679 - SURFACE
      ?auto_21680 - SURFACE
    )
    :vars
    (
      ?auto_21682 - HOIST
      ?auto_21683 - PLACE
      ?auto_21681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21682 ?auto_21683 ) ( SURFACE-AT ?auto_21679 ?auto_21683 ) ( CLEAR ?auto_21679 ) ( IS-CRATE ?auto_21680 ) ( not ( = ?auto_21679 ?auto_21680 ) ) ( TRUCK-AT ?auto_21681 ?auto_21683 ) ( AVAILABLE ?auto_21682 ) ( IN ?auto_21680 ?auto_21681 ) ( ON ?auto_21679 ?auto_21678 ) ( not ( = ?auto_21678 ?auto_21679 ) ) ( not ( = ?auto_21678 ?auto_21680 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21679 ?auto_21680 )
      ( MAKE-2CRATE-VERIFY ?auto_21678 ?auto_21679 ?auto_21680 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21684 - SURFACE
      ?auto_21685 - SURFACE
    )
    :vars
    (
      ?auto_21689 - HOIST
      ?auto_21686 - PLACE
      ?auto_21688 - TRUCK
      ?auto_21687 - SURFACE
      ?auto_21690 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21689 ?auto_21686 ) ( SURFACE-AT ?auto_21684 ?auto_21686 ) ( CLEAR ?auto_21684 ) ( IS-CRATE ?auto_21685 ) ( not ( = ?auto_21684 ?auto_21685 ) ) ( AVAILABLE ?auto_21689 ) ( IN ?auto_21685 ?auto_21688 ) ( ON ?auto_21684 ?auto_21687 ) ( not ( = ?auto_21687 ?auto_21684 ) ) ( not ( = ?auto_21687 ?auto_21685 ) ) ( TRUCK-AT ?auto_21688 ?auto_21690 ) ( not ( = ?auto_21690 ?auto_21686 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21688 ?auto_21690 ?auto_21686 )
      ( MAKE-2CRATE ?auto_21687 ?auto_21684 ?auto_21685 )
      ( MAKE-1CRATE-VERIFY ?auto_21684 ?auto_21685 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21691 - SURFACE
      ?auto_21692 - SURFACE
      ?auto_21693 - SURFACE
    )
    :vars
    (
      ?auto_21694 - HOIST
      ?auto_21697 - PLACE
      ?auto_21696 - TRUCK
      ?auto_21695 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21694 ?auto_21697 ) ( SURFACE-AT ?auto_21692 ?auto_21697 ) ( CLEAR ?auto_21692 ) ( IS-CRATE ?auto_21693 ) ( not ( = ?auto_21692 ?auto_21693 ) ) ( AVAILABLE ?auto_21694 ) ( IN ?auto_21693 ?auto_21696 ) ( ON ?auto_21692 ?auto_21691 ) ( not ( = ?auto_21691 ?auto_21692 ) ) ( not ( = ?auto_21691 ?auto_21693 ) ) ( TRUCK-AT ?auto_21696 ?auto_21695 ) ( not ( = ?auto_21695 ?auto_21697 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21692 ?auto_21693 )
      ( MAKE-2CRATE-VERIFY ?auto_21691 ?auto_21692 ?auto_21693 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21698 - SURFACE
      ?auto_21699 - SURFACE
    )
    :vars
    (
      ?auto_21701 - HOIST
      ?auto_21700 - PLACE
      ?auto_21704 - SURFACE
      ?auto_21703 - TRUCK
      ?auto_21702 - PLACE
      ?auto_21705 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21701 ?auto_21700 ) ( SURFACE-AT ?auto_21698 ?auto_21700 ) ( CLEAR ?auto_21698 ) ( IS-CRATE ?auto_21699 ) ( not ( = ?auto_21698 ?auto_21699 ) ) ( AVAILABLE ?auto_21701 ) ( ON ?auto_21698 ?auto_21704 ) ( not ( = ?auto_21704 ?auto_21698 ) ) ( not ( = ?auto_21704 ?auto_21699 ) ) ( TRUCK-AT ?auto_21703 ?auto_21702 ) ( not ( = ?auto_21702 ?auto_21700 ) ) ( HOIST-AT ?auto_21705 ?auto_21702 ) ( LIFTING ?auto_21705 ?auto_21699 ) ( not ( = ?auto_21701 ?auto_21705 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21705 ?auto_21699 ?auto_21703 ?auto_21702 )
      ( MAKE-2CRATE ?auto_21704 ?auto_21698 ?auto_21699 )
      ( MAKE-1CRATE-VERIFY ?auto_21698 ?auto_21699 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21706 - SURFACE
      ?auto_21707 - SURFACE
      ?auto_21708 - SURFACE
    )
    :vars
    (
      ?auto_21713 - HOIST
      ?auto_21711 - PLACE
      ?auto_21710 - TRUCK
      ?auto_21709 - PLACE
      ?auto_21712 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21713 ?auto_21711 ) ( SURFACE-AT ?auto_21707 ?auto_21711 ) ( CLEAR ?auto_21707 ) ( IS-CRATE ?auto_21708 ) ( not ( = ?auto_21707 ?auto_21708 ) ) ( AVAILABLE ?auto_21713 ) ( ON ?auto_21707 ?auto_21706 ) ( not ( = ?auto_21706 ?auto_21707 ) ) ( not ( = ?auto_21706 ?auto_21708 ) ) ( TRUCK-AT ?auto_21710 ?auto_21709 ) ( not ( = ?auto_21709 ?auto_21711 ) ) ( HOIST-AT ?auto_21712 ?auto_21709 ) ( LIFTING ?auto_21712 ?auto_21708 ) ( not ( = ?auto_21713 ?auto_21712 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21707 ?auto_21708 )
      ( MAKE-2CRATE-VERIFY ?auto_21706 ?auto_21707 ?auto_21708 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21714 - SURFACE
      ?auto_21715 - SURFACE
    )
    :vars
    (
      ?auto_21716 - HOIST
      ?auto_21718 - PLACE
      ?auto_21717 - SURFACE
      ?auto_21721 - TRUCK
      ?auto_21720 - PLACE
      ?auto_21719 - HOIST
      ?auto_21722 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21716 ?auto_21718 ) ( SURFACE-AT ?auto_21714 ?auto_21718 ) ( CLEAR ?auto_21714 ) ( IS-CRATE ?auto_21715 ) ( not ( = ?auto_21714 ?auto_21715 ) ) ( AVAILABLE ?auto_21716 ) ( ON ?auto_21714 ?auto_21717 ) ( not ( = ?auto_21717 ?auto_21714 ) ) ( not ( = ?auto_21717 ?auto_21715 ) ) ( TRUCK-AT ?auto_21721 ?auto_21720 ) ( not ( = ?auto_21720 ?auto_21718 ) ) ( HOIST-AT ?auto_21719 ?auto_21720 ) ( not ( = ?auto_21716 ?auto_21719 ) ) ( AVAILABLE ?auto_21719 ) ( SURFACE-AT ?auto_21715 ?auto_21720 ) ( ON ?auto_21715 ?auto_21722 ) ( CLEAR ?auto_21715 ) ( not ( = ?auto_21714 ?auto_21722 ) ) ( not ( = ?auto_21715 ?auto_21722 ) ) ( not ( = ?auto_21717 ?auto_21722 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21719 ?auto_21715 ?auto_21722 ?auto_21720 )
      ( MAKE-2CRATE ?auto_21717 ?auto_21714 ?auto_21715 )
      ( MAKE-1CRATE-VERIFY ?auto_21714 ?auto_21715 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21723 - SURFACE
      ?auto_21724 - SURFACE
      ?auto_21725 - SURFACE
    )
    :vars
    (
      ?auto_21726 - HOIST
      ?auto_21729 - PLACE
      ?auto_21730 - TRUCK
      ?auto_21731 - PLACE
      ?auto_21728 - HOIST
      ?auto_21727 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21726 ?auto_21729 ) ( SURFACE-AT ?auto_21724 ?auto_21729 ) ( CLEAR ?auto_21724 ) ( IS-CRATE ?auto_21725 ) ( not ( = ?auto_21724 ?auto_21725 ) ) ( AVAILABLE ?auto_21726 ) ( ON ?auto_21724 ?auto_21723 ) ( not ( = ?auto_21723 ?auto_21724 ) ) ( not ( = ?auto_21723 ?auto_21725 ) ) ( TRUCK-AT ?auto_21730 ?auto_21731 ) ( not ( = ?auto_21731 ?auto_21729 ) ) ( HOIST-AT ?auto_21728 ?auto_21731 ) ( not ( = ?auto_21726 ?auto_21728 ) ) ( AVAILABLE ?auto_21728 ) ( SURFACE-AT ?auto_21725 ?auto_21731 ) ( ON ?auto_21725 ?auto_21727 ) ( CLEAR ?auto_21725 ) ( not ( = ?auto_21724 ?auto_21727 ) ) ( not ( = ?auto_21725 ?auto_21727 ) ) ( not ( = ?auto_21723 ?auto_21727 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21724 ?auto_21725 )
      ( MAKE-2CRATE-VERIFY ?auto_21723 ?auto_21724 ?auto_21725 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21732 - SURFACE
      ?auto_21733 - SURFACE
    )
    :vars
    (
      ?auto_21734 - HOIST
      ?auto_21735 - PLACE
      ?auto_21738 - SURFACE
      ?auto_21739 - PLACE
      ?auto_21740 - HOIST
      ?auto_21736 - SURFACE
      ?auto_21737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21734 ?auto_21735 ) ( SURFACE-AT ?auto_21732 ?auto_21735 ) ( CLEAR ?auto_21732 ) ( IS-CRATE ?auto_21733 ) ( not ( = ?auto_21732 ?auto_21733 ) ) ( AVAILABLE ?auto_21734 ) ( ON ?auto_21732 ?auto_21738 ) ( not ( = ?auto_21738 ?auto_21732 ) ) ( not ( = ?auto_21738 ?auto_21733 ) ) ( not ( = ?auto_21739 ?auto_21735 ) ) ( HOIST-AT ?auto_21740 ?auto_21739 ) ( not ( = ?auto_21734 ?auto_21740 ) ) ( AVAILABLE ?auto_21740 ) ( SURFACE-AT ?auto_21733 ?auto_21739 ) ( ON ?auto_21733 ?auto_21736 ) ( CLEAR ?auto_21733 ) ( not ( = ?auto_21732 ?auto_21736 ) ) ( not ( = ?auto_21733 ?auto_21736 ) ) ( not ( = ?auto_21738 ?auto_21736 ) ) ( TRUCK-AT ?auto_21737 ?auto_21735 ) )
    :subtasks
    ( ( !DRIVE ?auto_21737 ?auto_21735 ?auto_21739 )
      ( MAKE-2CRATE ?auto_21738 ?auto_21732 ?auto_21733 )
      ( MAKE-1CRATE-VERIFY ?auto_21732 ?auto_21733 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21741 - SURFACE
      ?auto_21742 - SURFACE
      ?auto_21743 - SURFACE
    )
    :vars
    (
      ?auto_21748 - HOIST
      ?auto_21744 - PLACE
      ?auto_21745 - PLACE
      ?auto_21746 - HOIST
      ?auto_21749 - SURFACE
      ?auto_21747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21748 ?auto_21744 ) ( SURFACE-AT ?auto_21742 ?auto_21744 ) ( CLEAR ?auto_21742 ) ( IS-CRATE ?auto_21743 ) ( not ( = ?auto_21742 ?auto_21743 ) ) ( AVAILABLE ?auto_21748 ) ( ON ?auto_21742 ?auto_21741 ) ( not ( = ?auto_21741 ?auto_21742 ) ) ( not ( = ?auto_21741 ?auto_21743 ) ) ( not ( = ?auto_21745 ?auto_21744 ) ) ( HOIST-AT ?auto_21746 ?auto_21745 ) ( not ( = ?auto_21748 ?auto_21746 ) ) ( AVAILABLE ?auto_21746 ) ( SURFACE-AT ?auto_21743 ?auto_21745 ) ( ON ?auto_21743 ?auto_21749 ) ( CLEAR ?auto_21743 ) ( not ( = ?auto_21742 ?auto_21749 ) ) ( not ( = ?auto_21743 ?auto_21749 ) ) ( not ( = ?auto_21741 ?auto_21749 ) ) ( TRUCK-AT ?auto_21747 ?auto_21744 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21742 ?auto_21743 )
      ( MAKE-2CRATE-VERIFY ?auto_21741 ?auto_21742 ?auto_21743 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21750 - SURFACE
      ?auto_21751 - SURFACE
    )
    :vars
    (
      ?auto_21756 - HOIST
      ?auto_21757 - PLACE
      ?auto_21752 - SURFACE
      ?auto_21758 - PLACE
      ?auto_21754 - HOIST
      ?auto_21755 - SURFACE
      ?auto_21753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21756 ?auto_21757 ) ( IS-CRATE ?auto_21751 ) ( not ( = ?auto_21750 ?auto_21751 ) ) ( not ( = ?auto_21752 ?auto_21750 ) ) ( not ( = ?auto_21752 ?auto_21751 ) ) ( not ( = ?auto_21758 ?auto_21757 ) ) ( HOIST-AT ?auto_21754 ?auto_21758 ) ( not ( = ?auto_21756 ?auto_21754 ) ) ( AVAILABLE ?auto_21754 ) ( SURFACE-AT ?auto_21751 ?auto_21758 ) ( ON ?auto_21751 ?auto_21755 ) ( CLEAR ?auto_21751 ) ( not ( = ?auto_21750 ?auto_21755 ) ) ( not ( = ?auto_21751 ?auto_21755 ) ) ( not ( = ?auto_21752 ?auto_21755 ) ) ( TRUCK-AT ?auto_21753 ?auto_21757 ) ( SURFACE-AT ?auto_21752 ?auto_21757 ) ( CLEAR ?auto_21752 ) ( LIFTING ?auto_21756 ?auto_21750 ) ( IS-CRATE ?auto_21750 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21752 ?auto_21750 )
      ( MAKE-2CRATE ?auto_21752 ?auto_21750 ?auto_21751 )
      ( MAKE-1CRATE-VERIFY ?auto_21750 ?auto_21751 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21759 - SURFACE
      ?auto_21760 - SURFACE
      ?auto_21761 - SURFACE
    )
    :vars
    (
      ?auto_21762 - HOIST
      ?auto_21766 - PLACE
      ?auto_21767 - PLACE
      ?auto_21765 - HOIST
      ?auto_21764 - SURFACE
      ?auto_21763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21762 ?auto_21766 ) ( IS-CRATE ?auto_21761 ) ( not ( = ?auto_21760 ?auto_21761 ) ) ( not ( = ?auto_21759 ?auto_21760 ) ) ( not ( = ?auto_21759 ?auto_21761 ) ) ( not ( = ?auto_21767 ?auto_21766 ) ) ( HOIST-AT ?auto_21765 ?auto_21767 ) ( not ( = ?auto_21762 ?auto_21765 ) ) ( AVAILABLE ?auto_21765 ) ( SURFACE-AT ?auto_21761 ?auto_21767 ) ( ON ?auto_21761 ?auto_21764 ) ( CLEAR ?auto_21761 ) ( not ( = ?auto_21760 ?auto_21764 ) ) ( not ( = ?auto_21761 ?auto_21764 ) ) ( not ( = ?auto_21759 ?auto_21764 ) ) ( TRUCK-AT ?auto_21763 ?auto_21766 ) ( SURFACE-AT ?auto_21759 ?auto_21766 ) ( CLEAR ?auto_21759 ) ( LIFTING ?auto_21762 ?auto_21760 ) ( IS-CRATE ?auto_21760 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21760 ?auto_21761 )
      ( MAKE-2CRATE-VERIFY ?auto_21759 ?auto_21760 ?auto_21761 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21768 - SURFACE
      ?auto_21769 - SURFACE
    )
    :vars
    (
      ?auto_21773 - HOIST
      ?auto_21770 - PLACE
      ?auto_21775 - SURFACE
      ?auto_21772 - PLACE
      ?auto_21774 - HOIST
      ?auto_21771 - SURFACE
      ?auto_21776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21773 ?auto_21770 ) ( IS-CRATE ?auto_21769 ) ( not ( = ?auto_21768 ?auto_21769 ) ) ( not ( = ?auto_21775 ?auto_21768 ) ) ( not ( = ?auto_21775 ?auto_21769 ) ) ( not ( = ?auto_21772 ?auto_21770 ) ) ( HOIST-AT ?auto_21774 ?auto_21772 ) ( not ( = ?auto_21773 ?auto_21774 ) ) ( AVAILABLE ?auto_21774 ) ( SURFACE-AT ?auto_21769 ?auto_21772 ) ( ON ?auto_21769 ?auto_21771 ) ( CLEAR ?auto_21769 ) ( not ( = ?auto_21768 ?auto_21771 ) ) ( not ( = ?auto_21769 ?auto_21771 ) ) ( not ( = ?auto_21775 ?auto_21771 ) ) ( TRUCK-AT ?auto_21776 ?auto_21770 ) ( SURFACE-AT ?auto_21775 ?auto_21770 ) ( CLEAR ?auto_21775 ) ( IS-CRATE ?auto_21768 ) ( AVAILABLE ?auto_21773 ) ( IN ?auto_21768 ?auto_21776 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21773 ?auto_21768 ?auto_21776 ?auto_21770 )
      ( MAKE-2CRATE ?auto_21775 ?auto_21768 ?auto_21769 )
      ( MAKE-1CRATE-VERIFY ?auto_21768 ?auto_21769 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21777 - SURFACE
      ?auto_21778 - SURFACE
      ?auto_21779 - SURFACE
    )
    :vars
    (
      ?auto_21784 - HOIST
      ?auto_21785 - PLACE
      ?auto_21780 - PLACE
      ?auto_21782 - HOIST
      ?auto_21783 - SURFACE
      ?auto_21781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21784 ?auto_21785 ) ( IS-CRATE ?auto_21779 ) ( not ( = ?auto_21778 ?auto_21779 ) ) ( not ( = ?auto_21777 ?auto_21778 ) ) ( not ( = ?auto_21777 ?auto_21779 ) ) ( not ( = ?auto_21780 ?auto_21785 ) ) ( HOIST-AT ?auto_21782 ?auto_21780 ) ( not ( = ?auto_21784 ?auto_21782 ) ) ( AVAILABLE ?auto_21782 ) ( SURFACE-AT ?auto_21779 ?auto_21780 ) ( ON ?auto_21779 ?auto_21783 ) ( CLEAR ?auto_21779 ) ( not ( = ?auto_21778 ?auto_21783 ) ) ( not ( = ?auto_21779 ?auto_21783 ) ) ( not ( = ?auto_21777 ?auto_21783 ) ) ( TRUCK-AT ?auto_21781 ?auto_21785 ) ( SURFACE-AT ?auto_21777 ?auto_21785 ) ( CLEAR ?auto_21777 ) ( IS-CRATE ?auto_21778 ) ( AVAILABLE ?auto_21784 ) ( IN ?auto_21778 ?auto_21781 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21778 ?auto_21779 )
      ( MAKE-2CRATE-VERIFY ?auto_21777 ?auto_21778 ?auto_21779 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21822 - SURFACE
      ?auto_21823 - SURFACE
    )
    :vars
    (
      ?auto_21829 - HOIST
      ?auto_21827 - PLACE
      ?auto_21825 - SURFACE
      ?auto_21828 - PLACE
      ?auto_21826 - HOIST
      ?auto_21824 - SURFACE
      ?auto_21830 - TRUCK
      ?auto_21831 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21829 ?auto_21827 ) ( SURFACE-AT ?auto_21822 ?auto_21827 ) ( CLEAR ?auto_21822 ) ( IS-CRATE ?auto_21823 ) ( not ( = ?auto_21822 ?auto_21823 ) ) ( AVAILABLE ?auto_21829 ) ( ON ?auto_21822 ?auto_21825 ) ( not ( = ?auto_21825 ?auto_21822 ) ) ( not ( = ?auto_21825 ?auto_21823 ) ) ( not ( = ?auto_21828 ?auto_21827 ) ) ( HOIST-AT ?auto_21826 ?auto_21828 ) ( not ( = ?auto_21829 ?auto_21826 ) ) ( AVAILABLE ?auto_21826 ) ( SURFACE-AT ?auto_21823 ?auto_21828 ) ( ON ?auto_21823 ?auto_21824 ) ( CLEAR ?auto_21823 ) ( not ( = ?auto_21822 ?auto_21824 ) ) ( not ( = ?auto_21823 ?auto_21824 ) ) ( not ( = ?auto_21825 ?auto_21824 ) ) ( TRUCK-AT ?auto_21830 ?auto_21831 ) ( not ( = ?auto_21831 ?auto_21827 ) ) ( not ( = ?auto_21828 ?auto_21831 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21830 ?auto_21831 ?auto_21827 )
      ( MAKE-1CRATE ?auto_21822 ?auto_21823 )
      ( MAKE-1CRATE-VERIFY ?auto_21822 ?auto_21823 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21861 - SURFACE
      ?auto_21862 - SURFACE
      ?auto_21863 - SURFACE
      ?auto_21864 - SURFACE
    )
    :vars
    (
      ?auto_21865 - HOIST
      ?auto_21866 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21865 ?auto_21866 ) ( SURFACE-AT ?auto_21863 ?auto_21866 ) ( CLEAR ?auto_21863 ) ( LIFTING ?auto_21865 ?auto_21864 ) ( IS-CRATE ?auto_21864 ) ( not ( = ?auto_21863 ?auto_21864 ) ) ( ON ?auto_21862 ?auto_21861 ) ( ON ?auto_21863 ?auto_21862 ) ( not ( = ?auto_21861 ?auto_21862 ) ) ( not ( = ?auto_21861 ?auto_21863 ) ) ( not ( = ?auto_21861 ?auto_21864 ) ) ( not ( = ?auto_21862 ?auto_21863 ) ) ( not ( = ?auto_21862 ?auto_21864 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21863 ?auto_21864 )
      ( MAKE-3CRATE-VERIFY ?auto_21861 ?auto_21862 ?auto_21863 ?auto_21864 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21878 - SURFACE
      ?auto_21879 - SURFACE
      ?auto_21880 - SURFACE
      ?auto_21881 - SURFACE
    )
    :vars
    (
      ?auto_21883 - HOIST
      ?auto_21882 - PLACE
      ?auto_21884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21883 ?auto_21882 ) ( SURFACE-AT ?auto_21880 ?auto_21882 ) ( CLEAR ?auto_21880 ) ( IS-CRATE ?auto_21881 ) ( not ( = ?auto_21880 ?auto_21881 ) ) ( TRUCK-AT ?auto_21884 ?auto_21882 ) ( AVAILABLE ?auto_21883 ) ( IN ?auto_21881 ?auto_21884 ) ( ON ?auto_21880 ?auto_21879 ) ( not ( = ?auto_21879 ?auto_21880 ) ) ( not ( = ?auto_21879 ?auto_21881 ) ) ( ON ?auto_21879 ?auto_21878 ) ( not ( = ?auto_21878 ?auto_21879 ) ) ( not ( = ?auto_21878 ?auto_21880 ) ) ( not ( = ?auto_21878 ?auto_21881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21879 ?auto_21880 ?auto_21881 )
      ( MAKE-3CRATE-VERIFY ?auto_21878 ?auto_21879 ?auto_21880 ?auto_21881 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21899 - SURFACE
      ?auto_21900 - SURFACE
      ?auto_21901 - SURFACE
      ?auto_21902 - SURFACE
    )
    :vars
    (
      ?auto_21904 - HOIST
      ?auto_21906 - PLACE
      ?auto_21903 - TRUCK
      ?auto_21905 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21904 ?auto_21906 ) ( SURFACE-AT ?auto_21901 ?auto_21906 ) ( CLEAR ?auto_21901 ) ( IS-CRATE ?auto_21902 ) ( not ( = ?auto_21901 ?auto_21902 ) ) ( AVAILABLE ?auto_21904 ) ( IN ?auto_21902 ?auto_21903 ) ( ON ?auto_21901 ?auto_21900 ) ( not ( = ?auto_21900 ?auto_21901 ) ) ( not ( = ?auto_21900 ?auto_21902 ) ) ( TRUCK-AT ?auto_21903 ?auto_21905 ) ( not ( = ?auto_21905 ?auto_21906 ) ) ( ON ?auto_21900 ?auto_21899 ) ( not ( = ?auto_21899 ?auto_21900 ) ) ( not ( = ?auto_21899 ?auto_21901 ) ) ( not ( = ?auto_21899 ?auto_21902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21900 ?auto_21901 ?auto_21902 )
      ( MAKE-3CRATE-VERIFY ?auto_21899 ?auto_21900 ?auto_21901 ?auto_21902 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21923 - SURFACE
      ?auto_21924 - SURFACE
      ?auto_21925 - SURFACE
      ?auto_21926 - SURFACE
    )
    :vars
    (
      ?auto_21928 - HOIST
      ?auto_21931 - PLACE
      ?auto_21929 - TRUCK
      ?auto_21930 - PLACE
      ?auto_21927 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21928 ?auto_21931 ) ( SURFACE-AT ?auto_21925 ?auto_21931 ) ( CLEAR ?auto_21925 ) ( IS-CRATE ?auto_21926 ) ( not ( = ?auto_21925 ?auto_21926 ) ) ( AVAILABLE ?auto_21928 ) ( ON ?auto_21925 ?auto_21924 ) ( not ( = ?auto_21924 ?auto_21925 ) ) ( not ( = ?auto_21924 ?auto_21926 ) ) ( TRUCK-AT ?auto_21929 ?auto_21930 ) ( not ( = ?auto_21930 ?auto_21931 ) ) ( HOIST-AT ?auto_21927 ?auto_21930 ) ( LIFTING ?auto_21927 ?auto_21926 ) ( not ( = ?auto_21928 ?auto_21927 ) ) ( ON ?auto_21924 ?auto_21923 ) ( not ( = ?auto_21923 ?auto_21924 ) ) ( not ( = ?auto_21923 ?auto_21925 ) ) ( not ( = ?auto_21923 ?auto_21926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21924 ?auto_21925 ?auto_21926 )
      ( MAKE-3CRATE-VERIFY ?auto_21923 ?auto_21924 ?auto_21925 ?auto_21926 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21950 - SURFACE
      ?auto_21951 - SURFACE
      ?auto_21952 - SURFACE
      ?auto_21953 - SURFACE
    )
    :vars
    (
      ?auto_21958 - HOIST
      ?auto_21954 - PLACE
      ?auto_21957 - TRUCK
      ?auto_21956 - PLACE
      ?auto_21959 - HOIST
      ?auto_21955 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21958 ?auto_21954 ) ( SURFACE-AT ?auto_21952 ?auto_21954 ) ( CLEAR ?auto_21952 ) ( IS-CRATE ?auto_21953 ) ( not ( = ?auto_21952 ?auto_21953 ) ) ( AVAILABLE ?auto_21958 ) ( ON ?auto_21952 ?auto_21951 ) ( not ( = ?auto_21951 ?auto_21952 ) ) ( not ( = ?auto_21951 ?auto_21953 ) ) ( TRUCK-AT ?auto_21957 ?auto_21956 ) ( not ( = ?auto_21956 ?auto_21954 ) ) ( HOIST-AT ?auto_21959 ?auto_21956 ) ( not ( = ?auto_21958 ?auto_21959 ) ) ( AVAILABLE ?auto_21959 ) ( SURFACE-AT ?auto_21953 ?auto_21956 ) ( ON ?auto_21953 ?auto_21955 ) ( CLEAR ?auto_21953 ) ( not ( = ?auto_21952 ?auto_21955 ) ) ( not ( = ?auto_21953 ?auto_21955 ) ) ( not ( = ?auto_21951 ?auto_21955 ) ) ( ON ?auto_21951 ?auto_21950 ) ( not ( = ?auto_21950 ?auto_21951 ) ) ( not ( = ?auto_21950 ?auto_21952 ) ) ( not ( = ?auto_21950 ?auto_21953 ) ) ( not ( = ?auto_21950 ?auto_21955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21951 ?auto_21952 ?auto_21953 )
      ( MAKE-3CRATE-VERIFY ?auto_21950 ?auto_21951 ?auto_21952 ?auto_21953 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21978 - SURFACE
      ?auto_21979 - SURFACE
      ?auto_21980 - SURFACE
      ?auto_21981 - SURFACE
    )
    :vars
    (
      ?auto_21987 - HOIST
      ?auto_21985 - PLACE
      ?auto_21983 - PLACE
      ?auto_21982 - HOIST
      ?auto_21984 - SURFACE
      ?auto_21986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21987 ?auto_21985 ) ( SURFACE-AT ?auto_21980 ?auto_21985 ) ( CLEAR ?auto_21980 ) ( IS-CRATE ?auto_21981 ) ( not ( = ?auto_21980 ?auto_21981 ) ) ( AVAILABLE ?auto_21987 ) ( ON ?auto_21980 ?auto_21979 ) ( not ( = ?auto_21979 ?auto_21980 ) ) ( not ( = ?auto_21979 ?auto_21981 ) ) ( not ( = ?auto_21983 ?auto_21985 ) ) ( HOIST-AT ?auto_21982 ?auto_21983 ) ( not ( = ?auto_21987 ?auto_21982 ) ) ( AVAILABLE ?auto_21982 ) ( SURFACE-AT ?auto_21981 ?auto_21983 ) ( ON ?auto_21981 ?auto_21984 ) ( CLEAR ?auto_21981 ) ( not ( = ?auto_21980 ?auto_21984 ) ) ( not ( = ?auto_21981 ?auto_21984 ) ) ( not ( = ?auto_21979 ?auto_21984 ) ) ( TRUCK-AT ?auto_21986 ?auto_21985 ) ( ON ?auto_21979 ?auto_21978 ) ( not ( = ?auto_21978 ?auto_21979 ) ) ( not ( = ?auto_21978 ?auto_21980 ) ) ( not ( = ?auto_21978 ?auto_21981 ) ) ( not ( = ?auto_21978 ?auto_21984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21979 ?auto_21980 ?auto_21981 )
      ( MAKE-3CRATE-VERIFY ?auto_21978 ?auto_21979 ?auto_21980 ?auto_21981 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22006 - SURFACE
      ?auto_22007 - SURFACE
      ?auto_22008 - SURFACE
      ?auto_22009 - SURFACE
    )
    :vars
    (
      ?auto_22010 - HOIST
      ?auto_22014 - PLACE
      ?auto_22012 - PLACE
      ?auto_22013 - HOIST
      ?auto_22011 - SURFACE
      ?auto_22015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22010 ?auto_22014 ) ( IS-CRATE ?auto_22009 ) ( not ( = ?auto_22008 ?auto_22009 ) ) ( not ( = ?auto_22007 ?auto_22008 ) ) ( not ( = ?auto_22007 ?auto_22009 ) ) ( not ( = ?auto_22012 ?auto_22014 ) ) ( HOIST-AT ?auto_22013 ?auto_22012 ) ( not ( = ?auto_22010 ?auto_22013 ) ) ( AVAILABLE ?auto_22013 ) ( SURFACE-AT ?auto_22009 ?auto_22012 ) ( ON ?auto_22009 ?auto_22011 ) ( CLEAR ?auto_22009 ) ( not ( = ?auto_22008 ?auto_22011 ) ) ( not ( = ?auto_22009 ?auto_22011 ) ) ( not ( = ?auto_22007 ?auto_22011 ) ) ( TRUCK-AT ?auto_22015 ?auto_22014 ) ( SURFACE-AT ?auto_22007 ?auto_22014 ) ( CLEAR ?auto_22007 ) ( LIFTING ?auto_22010 ?auto_22008 ) ( IS-CRATE ?auto_22008 ) ( ON ?auto_22007 ?auto_22006 ) ( not ( = ?auto_22006 ?auto_22007 ) ) ( not ( = ?auto_22006 ?auto_22008 ) ) ( not ( = ?auto_22006 ?auto_22009 ) ) ( not ( = ?auto_22006 ?auto_22011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22007 ?auto_22008 ?auto_22009 )
      ( MAKE-3CRATE-VERIFY ?auto_22006 ?auto_22007 ?auto_22008 ?auto_22009 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22034 - SURFACE
      ?auto_22035 - SURFACE
      ?auto_22036 - SURFACE
      ?auto_22037 - SURFACE
    )
    :vars
    (
      ?auto_22042 - HOIST
      ?auto_22043 - PLACE
      ?auto_22041 - PLACE
      ?auto_22038 - HOIST
      ?auto_22040 - SURFACE
      ?auto_22039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22042 ?auto_22043 ) ( IS-CRATE ?auto_22037 ) ( not ( = ?auto_22036 ?auto_22037 ) ) ( not ( = ?auto_22035 ?auto_22036 ) ) ( not ( = ?auto_22035 ?auto_22037 ) ) ( not ( = ?auto_22041 ?auto_22043 ) ) ( HOIST-AT ?auto_22038 ?auto_22041 ) ( not ( = ?auto_22042 ?auto_22038 ) ) ( AVAILABLE ?auto_22038 ) ( SURFACE-AT ?auto_22037 ?auto_22041 ) ( ON ?auto_22037 ?auto_22040 ) ( CLEAR ?auto_22037 ) ( not ( = ?auto_22036 ?auto_22040 ) ) ( not ( = ?auto_22037 ?auto_22040 ) ) ( not ( = ?auto_22035 ?auto_22040 ) ) ( TRUCK-AT ?auto_22039 ?auto_22043 ) ( SURFACE-AT ?auto_22035 ?auto_22043 ) ( CLEAR ?auto_22035 ) ( IS-CRATE ?auto_22036 ) ( AVAILABLE ?auto_22042 ) ( IN ?auto_22036 ?auto_22039 ) ( ON ?auto_22035 ?auto_22034 ) ( not ( = ?auto_22034 ?auto_22035 ) ) ( not ( = ?auto_22034 ?auto_22036 ) ) ( not ( = ?auto_22034 ?auto_22037 ) ) ( not ( = ?auto_22034 ?auto_22040 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22035 ?auto_22036 ?auto_22037 )
      ( MAKE-3CRATE-VERIFY ?auto_22034 ?auto_22035 ?auto_22036 ?auto_22037 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22325 - SURFACE
      ?auto_22326 - SURFACE
      ?auto_22327 - SURFACE
      ?auto_22329 - SURFACE
      ?auto_22328 - SURFACE
    )
    :vars
    (
      ?auto_22331 - HOIST
      ?auto_22330 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22331 ?auto_22330 ) ( SURFACE-AT ?auto_22329 ?auto_22330 ) ( CLEAR ?auto_22329 ) ( LIFTING ?auto_22331 ?auto_22328 ) ( IS-CRATE ?auto_22328 ) ( not ( = ?auto_22329 ?auto_22328 ) ) ( ON ?auto_22326 ?auto_22325 ) ( ON ?auto_22327 ?auto_22326 ) ( ON ?auto_22329 ?auto_22327 ) ( not ( = ?auto_22325 ?auto_22326 ) ) ( not ( = ?auto_22325 ?auto_22327 ) ) ( not ( = ?auto_22325 ?auto_22329 ) ) ( not ( = ?auto_22325 ?auto_22328 ) ) ( not ( = ?auto_22326 ?auto_22327 ) ) ( not ( = ?auto_22326 ?auto_22329 ) ) ( not ( = ?auto_22326 ?auto_22328 ) ) ( not ( = ?auto_22327 ?auto_22329 ) ) ( not ( = ?auto_22327 ?auto_22328 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22329 ?auto_22328 )
      ( MAKE-4CRATE-VERIFY ?auto_22325 ?auto_22326 ?auto_22327 ?auto_22329 ?auto_22328 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22350 - SURFACE
      ?auto_22351 - SURFACE
      ?auto_22352 - SURFACE
      ?auto_22354 - SURFACE
      ?auto_22353 - SURFACE
    )
    :vars
    (
      ?auto_22356 - HOIST
      ?auto_22357 - PLACE
      ?auto_22355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22356 ?auto_22357 ) ( SURFACE-AT ?auto_22354 ?auto_22357 ) ( CLEAR ?auto_22354 ) ( IS-CRATE ?auto_22353 ) ( not ( = ?auto_22354 ?auto_22353 ) ) ( TRUCK-AT ?auto_22355 ?auto_22357 ) ( AVAILABLE ?auto_22356 ) ( IN ?auto_22353 ?auto_22355 ) ( ON ?auto_22354 ?auto_22352 ) ( not ( = ?auto_22352 ?auto_22354 ) ) ( not ( = ?auto_22352 ?auto_22353 ) ) ( ON ?auto_22351 ?auto_22350 ) ( ON ?auto_22352 ?auto_22351 ) ( not ( = ?auto_22350 ?auto_22351 ) ) ( not ( = ?auto_22350 ?auto_22352 ) ) ( not ( = ?auto_22350 ?auto_22354 ) ) ( not ( = ?auto_22350 ?auto_22353 ) ) ( not ( = ?auto_22351 ?auto_22352 ) ) ( not ( = ?auto_22351 ?auto_22354 ) ) ( not ( = ?auto_22351 ?auto_22353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22352 ?auto_22354 ?auto_22353 )
      ( MAKE-4CRATE-VERIFY ?auto_22350 ?auto_22351 ?auto_22352 ?auto_22354 ?auto_22353 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22380 - SURFACE
      ?auto_22381 - SURFACE
      ?auto_22382 - SURFACE
      ?auto_22384 - SURFACE
      ?auto_22383 - SURFACE
    )
    :vars
    (
      ?auto_22386 - HOIST
      ?auto_22388 - PLACE
      ?auto_22385 - TRUCK
      ?auto_22387 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22386 ?auto_22388 ) ( SURFACE-AT ?auto_22384 ?auto_22388 ) ( CLEAR ?auto_22384 ) ( IS-CRATE ?auto_22383 ) ( not ( = ?auto_22384 ?auto_22383 ) ) ( AVAILABLE ?auto_22386 ) ( IN ?auto_22383 ?auto_22385 ) ( ON ?auto_22384 ?auto_22382 ) ( not ( = ?auto_22382 ?auto_22384 ) ) ( not ( = ?auto_22382 ?auto_22383 ) ) ( TRUCK-AT ?auto_22385 ?auto_22387 ) ( not ( = ?auto_22387 ?auto_22388 ) ) ( ON ?auto_22381 ?auto_22380 ) ( ON ?auto_22382 ?auto_22381 ) ( not ( = ?auto_22380 ?auto_22381 ) ) ( not ( = ?auto_22380 ?auto_22382 ) ) ( not ( = ?auto_22380 ?auto_22384 ) ) ( not ( = ?auto_22380 ?auto_22383 ) ) ( not ( = ?auto_22381 ?auto_22382 ) ) ( not ( = ?auto_22381 ?auto_22384 ) ) ( not ( = ?auto_22381 ?auto_22383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22382 ?auto_22384 ?auto_22383 )
      ( MAKE-4CRATE-VERIFY ?auto_22380 ?auto_22381 ?auto_22382 ?auto_22384 ?auto_22383 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22414 - SURFACE
      ?auto_22415 - SURFACE
      ?auto_22416 - SURFACE
      ?auto_22418 - SURFACE
      ?auto_22417 - SURFACE
    )
    :vars
    (
      ?auto_22422 - HOIST
      ?auto_22419 - PLACE
      ?auto_22420 - TRUCK
      ?auto_22421 - PLACE
      ?auto_22423 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22422 ?auto_22419 ) ( SURFACE-AT ?auto_22418 ?auto_22419 ) ( CLEAR ?auto_22418 ) ( IS-CRATE ?auto_22417 ) ( not ( = ?auto_22418 ?auto_22417 ) ) ( AVAILABLE ?auto_22422 ) ( ON ?auto_22418 ?auto_22416 ) ( not ( = ?auto_22416 ?auto_22418 ) ) ( not ( = ?auto_22416 ?auto_22417 ) ) ( TRUCK-AT ?auto_22420 ?auto_22421 ) ( not ( = ?auto_22421 ?auto_22419 ) ) ( HOIST-AT ?auto_22423 ?auto_22421 ) ( LIFTING ?auto_22423 ?auto_22417 ) ( not ( = ?auto_22422 ?auto_22423 ) ) ( ON ?auto_22415 ?auto_22414 ) ( ON ?auto_22416 ?auto_22415 ) ( not ( = ?auto_22414 ?auto_22415 ) ) ( not ( = ?auto_22414 ?auto_22416 ) ) ( not ( = ?auto_22414 ?auto_22418 ) ) ( not ( = ?auto_22414 ?auto_22417 ) ) ( not ( = ?auto_22415 ?auto_22416 ) ) ( not ( = ?auto_22415 ?auto_22418 ) ) ( not ( = ?auto_22415 ?auto_22417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22416 ?auto_22418 ?auto_22417 )
      ( MAKE-4CRATE-VERIFY ?auto_22414 ?auto_22415 ?auto_22416 ?auto_22418 ?auto_22417 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22452 - SURFACE
      ?auto_22453 - SURFACE
      ?auto_22454 - SURFACE
      ?auto_22456 - SURFACE
      ?auto_22455 - SURFACE
    )
    :vars
    (
      ?auto_22461 - HOIST
      ?auto_22459 - PLACE
      ?auto_22458 - TRUCK
      ?auto_22457 - PLACE
      ?auto_22462 - HOIST
      ?auto_22460 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22461 ?auto_22459 ) ( SURFACE-AT ?auto_22456 ?auto_22459 ) ( CLEAR ?auto_22456 ) ( IS-CRATE ?auto_22455 ) ( not ( = ?auto_22456 ?auto_22455 ) ) ( AVAILABLE ?auto_22461 ) ( ON ?auto_22456 ?auto_22454 ) ( not ( = ?auto_22454 ?auto_22456 ) ) ( not ( = ?auto_22454 ?auto_22455 ) ) ( TRUCK-AT ?auto_22458 ?auto_22457 ) ( not ( = ?auto_22457 ?auto_22459 ) ) ( HOIST-AT ?auto_22462 ?auto_22457 ) ( not ( = ?auto_22461 ?auto_22462 ) ) ( AVAILABLE ?auto_22462 ) ( SURFACE-AT ?auto_22455 ?auto_22457 ) ( ON ?auto_22455 ?auto_22460 ) ( CLEAR ?auto_22455 ) ( not ( = ?auto_22456 ?auto_22460 ) ) ( not ( = ?auto_22455 ?auto_22460 ) ) ( not ( = ?auto_22454 ?auto_22460 ) ) ( ON ?auto_22453 ?auto_22452 ) ( ON ?auto_22454 ?auto_22453 ) ( not ( = ?auto_22452 ?auto_22453 ) ) ( not ( = ?auto_22452 ?auto_22454 ) ) ( not ( = ?auto_22452 ?auto_22456 ) ) ( not ( = ?auto_22452 ?auto_22455 ) ) ( not ( = ?auto_22452 ?auto_22460 ) ) ( not ( = ?auto_22453 ?auto_22454 ) ) ( not ( = ?auto_22453 ?auto_22456 ) ) ( not ( = ?auto_22453 ?auto_22455 ) ) ( not ( = ?auto_22453 ?auto_22460 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22454 ?auto_22456 ?auto_22455 )
      ( MAKE-4CRATE-VERIFY ?auto_22452 ?auto_22453 ?auto_22454 ?auto_22456 ?auto_22455 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22491 - SURFACE
      ?auto_22492 - SURFACE
      ?auto_22493 - SURFACE
      ?auto_22495 - SURFACE
      ?auto_22494 - SURFACE
    )
    :vars
    (
      ?auto_22497 - HOIST
      ?auto_22499 - PLACE
      ?auto_22500 - PLACE
      ?auto_22496 - HOIST
      ?auto_22498 - SURFACE
      ?auto_22501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22497 ?auto_22499 ) ( SURFACE-AT ?auto_22495 ?auto_22499 ) ( CLEAR ?auto_22495 ) ( IS-CRATE ?auto_22494 ) ( not ( = ?auto_22495 ?auto_22494 ) ) ( AVAILABLE ?auto_22497 ) ( ON ?auto_22495 ?auto_22493 ) ( not ( = ?auto_22493 ?auto_22495 ) ) ( not ( = ?auto_22493 ?auto_22494 ) ) ( not ( = ?auto_22500 ?auto_22499 ) ) ( HOIST-AT ?auto_22496 ?auto_22500 ) ( not ( = ?auto_22497 ?auto_22496 ) ) ( AVAILABLE ?auto_22496 ) ( SURFACE-AT ?auto_22494 ?auto_22500 ) ( ON ?auto_22494 ?auto_22498 ) ( CLEAR ?auto_22494 ) ( not ( = ?auto_22495 ?auto_22498 ) ) ( not ( = ?auto_22494 ?auto_22498 ) ) ( not ( = ?auto_22493 ?auto_22498 ) ) ( TRUCK-AT ?auto_22501 ?auto_22499 ) ( ON ?auto_22492 ?auto_22491 ) ( ON ?auto_22493 ?auto_22492 ) ( not ( = ?auto_22491 ?auto_22492 ) ) ( not ( = ?auto_22491 ?auto_22493 ) ) ( not ( = ?auto_22491 ?auto_22495 ) ) ( not ( = ?auto_22491 ?auto_22494 ) ) ( not ( = ?auto_22491 ?auto_22498 ) ) ( not ( = ?auto_22492 ?auto_22493 ) ) ( not ( = ?auto_22492 ?auto_22495 ) ) ( not ( = ?auto_22492 ?auto_22494 ) ) ( not ( = ?auto_22492 ?auto_22498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22493 ?auto_22495 ?auto_22494 )
      ( MAKE-4CRATE-VERIFY ?auto_22491 ?auto_22492 ?auto_22493 ?auto_22495 ?auto_22494 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22530 - SURFACE
      ?auto_22531 - SURFACE
      ?auto_22532 - SURFACE
      ?auto_22534 - SURFACE
      ?auto_22533 - SURFACE
    )
    :vars
    (
      ?auto_22536 - HOIST
      ?auto_22537 - PLACE
      ?auto_22540 - PLACE
      ?auto_22538 - HOIST
      ?auto_22539 - SURFACE
      ?auto_22535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22536 ?auto_22537 ) ( IS-CRATE ?auto_22533 ) ( not ( = ?auto_22534 ?auto_22533 ) ) ( not ( = ?auto_22532 ?auto_22534 ) ) ( not ( = ?auto_22532 ?auto_22533 ) ) ( not ( = ?auto_22540 ?auto_22537 ) ) ( HOIST-AT ?auto_22538 ?auto_22540 ) ( not ( = ?auto_22536 ?auto_22538 ) ) ( AVAILABLE ?auto_22538 ) ( SURFACE-AT ?auto_22533 ?auto_22540 ) ( ON ?auto_22533 ?auto_22539 ) ( CLEAR ?auto_22533 ) ( not ( = ?auto_22534 ?auto_22539 ) ) ( not ( = ?auto_22533 ?auto_22539 ) ) ( not ( = ?auto_22532 ?auto_22539 ) ) ( TRUCK-AT ?auto_22535 ?auto_22537 ) ( SURFACE-AT ?auto_22532 ?auto_22537 ) ( CLEAR ?auto_22532 ) ( LIFTING ?auto_22536 ?auto_22534 ) ( IS-CRATE ?auto_22534 ) ( ON ?auto_22531 ?auto_22530 ) ( ON ?auto_22532 ?auto_22531 ) ( not ( = ?auto_22530 ?auto_22531 ) ) ( not ( = ?auto_22530 ?auto_22532 ) ) ( not ( = ?auto_22530 ?auto_22534 ) ) ( not ( = ?auto_22530 ?auto_22533 ) ) ( not ( = ?auto_22530 ?auto_22539 ) ) ( not ( = ?auto_22531 ?auto_22532 ) ) ( not ( = ?auto_22531 ?auto_22534 ) ) ( not ( = ?auto_22531 ?auto_22533 ) ) ( not ( = ?auto_22531 ?auto_22539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22532 ?auto_22534 ?auto_22533 )
      ( MAKE-4CRATE-VERIFY ?auto_22530 ?auto_22531 ?auto_22532 ?auto_22534 ?auto_22533 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22569 - SURFACE
      ?auto_22570 - SURFACE
      ?auto_22571 - SURFACE
      ?auto_22573 - SURFACE
      ?auto_22572 - SURFACE
    )
    :vars
    (
      ?auto_22575 - HOIST
      ?auto_22574 - PLACE
      ?auto_22577 - PLACE
      ?auto_22579 - HOIST
      ?auto_22576 - SURFACE
      ?auto_22578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22575 ?auto_22574 ) ( IS-CRATE ?auto_22572 ) ( not ( = ?auto_22573 ?auto_22572 ) ) ( not ( = ?auto_22571 ?auto_22573 ) ) ( not ( = ?auto_22571 ?auto_22572 ) ) ( not ( = ?auto_22577 ?auto_22574 ) ) ( HOIST-AT ?auto_22579 ?auto_22577 ) ( not ( = ?auto_22575 ?auto_22579 ) ) ( AVAILABLE ?auto_22579 ) ( SURFACE-AT ?auto_22572 ?auto_22577 ) ( ON ?auto_22572 ?auto_22576 ) ( CLEAR ?auto_22572 ) ( not ( = ?auto_22573 ?auto_22576 ) ) ( not ( = ?auto_22572 ?auto_22576 ) ) ( not ( = ?auto_22571 ?auto_22576 ) ) ( TRUCK-AT ?auto_22578 ?auto_22574 ) ( SURFACE-AT ?auto_22571 ?auto_22574 ) ( CLEAR ?auto_22571 ) ( IS-CRATE ?auto_22573 ) ( AVAILABLE ?auto_22575 ) ( IN ?auto_22573 ?auto_22578 ) ( ON ?auto_22570 ?auto_22569 ) ( ON ?auto_22571 ?auto_22570 ) ( not ( = ?auto_22569 ?auto_22570 ) ) ( not ( = ?auto_22569 ?auto_22571 ) ) ( not ( = ?auto_22569 ?auto_22573 ) ) ( not ( = ?auto_22569 ?auto_22572 ) ) ( not ( = ?auto_22569 ?auto_22576 ) ) ( not ( = ?auto_22570 ?auto_22571 ) ) ( not ( = ?auto_22570 ?auto_22573 ) ) ( not ( = ?auto_22570 ?auto_22572 ) ) ( not ( = ?auto_22570 ?auto_22576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22571 ?auto_22573 ?auto_22572 )
      ( MAKE-4CRATE-VERIFY ?auto_22569 ?auto_22570 ?auto_22571 ?auto_22573 ?auto_22572 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23229 - SURFACE
      ?auto_23230 - SURFACE
      ?auto_23231 - SURFACE
      ?auto_23233 - SURFACE
      ?auto_23232 - SURFACE
      ?auto_23234 - SURFACE
    )
    :vars
    (
      ?auto_23236 - HOIST
      ?auto_23235 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23236 ?auto_23235 ) ( SURFACE-AT ?auto_23232 ?auto_23235 ) ( CLEAR ?auto_23232 ) ( LIFTING ?auto_23236 ?auto_23234 ) ( IS-CRATE ?auto_23234 ) ( not ( = ?auto_23232 ?auto_23234 ) ) ( ON ?auto_23230 ?auto_23229 ) ( ON ?auto_23231 ?auto_23230 ) ( ON ?auto_23233 ?auto_23231 ) ( ON ?auto_23232 ?auto_23233 ) ( not ( = ?auto_23229 ?auto_23230 ) ) ( not ( = ?auto_23229 ?auto_23231 ) ) ( not ( = ?auto_23229 ?auto_23233 ) ) ( not ( = ?auto_23229 ?auto_23232 ) ) ( not ( = ?auto_23229 ?auto_23234 ) ) ( not ( = ?auto_23230 ?auto_23231 ) ) ( not ( = ?auto_23230 ?auto_23233 ) ) ( not ( = ?auto_23230 ?auto_23232 ) ) ( not ( = ?auto_23230 ?auto_23234 ) ) ( not ( = ?auto_23231 ?auto_23233 ) ) ( not ( = ?auto_23231 ?auto_23232 ) ) ( not ( = ?auto_23231 ?auto_23234 ) ) ( not ( = ?auto_23233 ?auto_23232 ) ) ( not ( = ?auto_23233 ?auto_23234 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23232 ?auto_23234 )
      ( MAKE-5CRATE-VERIFY ?auto_23229 ?auto_23230 ?auto_23231 ?auto_23233 ?auto_23232 ?auto_23234 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23263 - SURFACE
      ?auto_23264 - SURFACE
      ?auto_23265 - SURFACE
      ?auto_23267 - SURFACE
      ?auto_23266 - SURFACE
      ?auto_23268 - SURFACE
    )
    :vars
    (
      ?auto_23270 - HOIST
      ?auto_23271 - PLACE
      ?auto_23269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23270 ?auto_23271 ) ( SURFACE-AT ?auto_23266 ?auto_23271 ) ( CLEAR ?auto_23266 ) ( IS-CRATE ?auto_23268 ) ( not ( = ?auto_23266 ?auto_23268 ) ) ( TRUCK-AT ?auto_23269 ?auto_23271 ) ( AVAILABLE ?auto_23270 ) ( IN ?auto_23268 ?auto_23269 ) ( ON ?auto_23266 ?auto_23267 ) ( not ( = ?auto_23267 ?auto_23266 ) ) ( not ( = ?auto_23267 ?auto_23268 ) ) ( ON ?auto_23264 ?auto_23263 ) ( ON ?auto_23265 ?auto_23264 ) ( ON ?auto_23267 ?auto_23265 ) ( not ( = ?auto_23263 ?auto_23264 ) ) ( not ( = ?auto_23263 ?auto_23265 ) ) ( not ( = ?auto_23263 ?auto_23267 ) ) ( not ( = ?auto_23263 ?auto_23266 ) ) ( not ( = ?auto_23263 ?auto_23268 ) ) ( not ( = ?auto_23264 ?auto_23265 ) ) ( not ( = ?auto_23264 ?auto_23267 ) ) ( not ( = ?auto_23264 ?auto_23266 ) ) ( not ( = ?auto_23264 ?auto_23268 ) ) ( not ( = ?auto_23265 ?auto_23267 ) ) ( not ( = ?auto_23265 ?auto_23266 ) ) ( not ( = ?auto_23265 ?auto_23268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23267 ?auto_23266 ?auto_23268 )
      ( MAKE-5CRATE-VERIFY ?auto_23263 ?auto_23264 ?auto_23265 ?auto_23267 ?auto_23266 ?auto_23268 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23303 - SURFACE
      ?auto_23304 - SURFACE
      ?auto_23305 - SURFACE
      ?auto_23307 - SURFACE
      ?auto_23306 - SURFACE
      ?auto_23308 - SURFACE
    )
    :vars
    (
      ?auto_23309 - HOIST
      ?auto_23311 - PLACE
      ?auto_23310 - TRUCK
      ?auto_23312 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23309 ?auto_23311 ) ( SURFACE-AT ?auto_23306 ?auto_23311 ) ( CLEAR ?auto_23306 ) ( IS-CRATE ?auto_23308 ) ( not ( = ?auto_23306 ?auto_23308 ) ) ( AVAILABLE ?auto_23309 ) ( IN ?auto_23308 ?auto_23310 ) ( ON ?auto_23306 ?auto_23307 ) ( not ( = ?auto_23307 ?auto_23306 ) ) ( not ( = ?auto_23307 ?auto_23308 ) ) ( TRUCK-AT ?auto_23310 ?auto_23312 ) ( not ( = ?auto_23312 ?auto_23311 ) ) ( ON ?auto_23304 ?auto_23303 ) ( ON ?auto_23305 ?auto_23304 ) ( ON ?auto_23307 ?auto_23305 ) ( not ( = ?auto_23303 ?auto_23304 ) ) ( not ( = ?auto_23303 ?auto_23305 ) ) ( not ( = ?auto_23303 ?auto_23307 ) ) ( not ( = ?auto_23303 ?auto_23306 ) ) ( not ( = ?auto_23303 ?auto_23308 ) ) ( not ( = ?auto_23304 ?auto_23305 ) ) ( not ( = ?auto_23304 ?auto_23307 ) ) ( not ( = ?auto_23304 ?auto_23306 ) ) ( not ( = ?auto_23304 ?auto_23308 ) ) ( not ( = ?auto_23305 ?auto_23307 ) ) ( not ( = ?auto_23305 ?auto_23306 ) ) ( not ( = ?auto_23305 ?auto_23308 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23307 ?auto_23306 ?auto_23308 )
      ( MAKE-5CRATE-VERIFY ?auto_23303 ?auto_23304 ?auto_23305 ?auto_23307 ?auto_23306 ?auto_23308 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23348 - SURFACE
      ?auto_23349 - SURFACE
      ?auto_23350 - SURFACE
      ?auto_23352 - SURFACE
      ?auto_23351 - SURFACE
      ?auto_23353 - SURFACE
    )
    :vars
    (
      ?auto_23356 - HOIST
      ?auto_23355 - PLACE
      ?auto_23357 - TRUCK
      ?auto_23354 - PLACE
      ?auto_23358 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23356 ?auto_23355 ) ( SURFACE-AT ?auto_23351 ?auto_23355 ) ( CLEAR ?auto_23351 ) ( IS-CRATE ?auto_23353 ) ( not ( = ?auto_23351 ?auto_23353 ) ) ( AVAILABLE ?auto_23356 ) ( ON ?auto_23351 ?auto_23352 ) ( not ( = ?auto_23352 ?auto_23351 ) ) ( not ( = ?auto_23352 ?auto_23353 ) ) ( TRUCK-AT ?auto_23357 ?auto_23354 ) ( not ( = ?auto_23354 ?auto_23355 ) ) ( HOIST-AT ?auto_23358 ?auto_23354 ) ( LIFTING ?auto_23358 ?auto_23353 ) ( not ( = ?auto_23356 ?auto_23358 ) ) ( ON ?auto_23349 ?auto_23348 ) ( ON ?auto_23350 ?auto_23349 ) ( ON ?auto_23352 ?auto_23350 ) ( not ( = ?auto_23348 ?auto_23349 ) ) ( not ( = ?auto_23348 ?auto_23350 ) ) ( not ( = ?auto_23348 ?auto_23352 ) ) ( not ( = ?auto_23348 ?auto_23351 ) ) ( not ( = ?auto_23348 ?auto_23353 ) ) ( not ( = ?auto_23349 ?auto_23350 ) ) ( not ( = ?auto_23349 ?auto_23352 ) ) ( not ( = ?auto_23349 ?auto_23351 ) ) ( not ( = ?auto_23349 ?auto_23353 ) ) ( not ( = ?auto_23350 ?auto_23352 ) ) ( not ( = ?auto_23350 ?auto_23351 ) ) ( not ( = ?auto_23350 ?auto_23353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23352 ?auto_23351 ?auto_23353 )
      ( MAKE-5CRATE-VERIFY ?auto_23348 ?auto_23349 ?auto_23350 ?auto_23352 ?auto_23351 ?auto_23353 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23398 - SURFACE
      ?auto_23399 - SURFACE
      ?auto_23400 - SURFACE
      ?auto_23402 - SURFACE
      ?auto_23401 - SURFACE
      ?auto_23403 - SURFACE
    )
    :vars
    (
      ?auto_23404 - HOIST
      ?auto_23409 - PLACE
      ?auto_23408 - TRUCK
      ?auto_23406 - PLACE
      ?auto_23407 - HOIST
      ?auto_23405 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23404 ?auto_23409 ) ( SURFACE-AT ?auto_23401 ?auto_23409 ) ( CLEAR ?auto_23401 ) ( IS-CRATE ?auto_23403 ) ( not ( = ?auto_23401 ?auto_23403 ) ) ( AVAILABLE ?auto_23404 ) ( ON ?auto_23401 ?auto_23402 ) ( not ( = ?auto_23402 ?auto_23401 ) ) ( not ( = ?auto_23402 ?auto_23403 ) ) ( TRUCK-AT ?auto_23408 ?auto_23406 ) ( not ( = ?auto_23406 ?auto_23409 ) ) ( HOIST-AT ?auto_23407 ?auto_23406 ) ( not ( = ?auto_23404 ?auto_23407 ) ) ( AVAILABLE ?auto_23407 ) ( SURFACE-AT ?auto_23403 ?auto_23406 ) ( ON ?auto_23403 ?auto_23405 ) ( CLEAR ?auto_23403 ) ( not ( = ?auto_23401 ?auto_23405 ) ) ( not ( = ?auto_23403 ?auto_23405 ) ) ( not ( = ?auto_23402 ?auto_23405 ) ) ( ON ?auto_23399 ?auto_23398 ) ( ON ?auto_23400 ?auto_23399 ) ( ON ?auto_23402 ?auto_23400 ) ( not ( = ?auto_23398 ?auto_23399 ) ) ( not ( = ?auto_23398 ?auto_23400 ) ) ( not ( = ?auto_23398 ?auto_23402 ) ) ( not ( = ?auto_23398 ?auto_23401 ) ) ( not ( = ?auto_23398 ?auto_23403 ) ) ( not ( = ?auto_23398 ?auto_23405 ) ) ( not ( = ?auto_23399 ?auto_23400 ) ) ( not ( = ?auto_23399 ?auto_23402 ) ) ( not ( = ?auto_23399 ?auto_23401 ) ) ( not ( = ?auto_23399 ?auto_23403 ) ) ( not ( = ?auto_23399 ?auto_23405 ) ) ( not ( = ?auto_23400 ?auto_23402 ) ) ( not ( = ?auto_23400 ?auto_23401 ) ) ( not ( = ?auto_23400 ?auto_23403 ) ) ( not ( = ?auto_23400 ?auto_23405 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23402 ?auto_23401 ?auto_23403 )
      ( MAKE-5CRATE-VERIFY ?auto_23398 ?auto_23399 ?auto_23400 ?auto_23402 ?auto_23401 ?auto_23403 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23449 - SURFACE
      ?auto_23450 - SURFACE
      ?auto_23451 - SURFACE
      ?auto_23453 - SURFACE
      ?auto_23452 - SURFACE
      ?auto_23454 - SURFACE
    )
    :vars
    (
      ?auto_23455 - HOIST
      ?auto_23457 - PLACE
      ?auto_23458 - PLACE
      ?auto_23456 - HOIST
      ?auto_23459 - SURFACE
      ?auto_23460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23455 ?auto_23457 ) ( SURFACE-AT ?auto_23452 ?auto_23457 ) ( CLEAR ?auto_23452 ) ( IS-CRATE ?auto_23454 ) ( not ( = ?auto_23452 ?auto_23454 ) ) ( AVAILABLE ?auto_23455 ) ( ON ?auto_23452 ?auto_23453 ) ( not ( = ?auto_23453 ?auto_23452 ) ) ( not ( = ?auto_23453 ?auto_23454 ) ) ( not ( = ?auto_23458 ?auto_23457 ) ) ( HOIST-AT ?auto_23456 ?auto_23458 ) ( not ( = ?auto_23455 ?auto_23456 ) ) ( AVAILABLE ?auto_23456 ) ( SURFACE-AT ?auto_23454 ?auto_23458 ) ( ON ?auto_23454 ?auto_23459 ) ( CLEAR ?auto_23454 ) ( not ( = ?auto_23452 ?auto_23459 ) ) ( not ( = ?auto_23454 ?auto_23459 ) ) ( not ( = ?auto_23453 ?auto_23459 ) ) ( TRUCK-AT ?auto_23460 ?auto_23457 ) ( ON ?auto_23450 ?auto_23449 ) ( ON ?auto_23451 ?auto_23450 ) ( ON ?auto_23453 ?auto_23451 ) ( not ( = ?auto_23449 ?auto_23450 ) ) ( not ( = ?auto_23449 ?auto_23451 ) ) ( not ( = ?auto_23449 ?auto_23453 ) ) ( not ( = ?auto_23449 ?auto_23452 ) ) ( not ( = ?auto_23449 ?auto_23454 ) ) ( not ( = ?auto_23449 ?auto_23459 ) ) ( not ( = ?auto_23450 ?auto_23451 ) ) ( not ( = ?auto_23450 ?auto_23453 ) ) ( not ( = ?auto_23450 ?auto_23452 ) ) ( not ( = ?auto_23450 ?auto_23454 ) ) ( not ( = ?auto_23450 ?auto_23459 ) ) ( not ( = ?auto_23451 ?auto_23453 ) ) ( not ( = ?auto_23451 ?auto_23452 ) ) ( not ( = ?auto_23451 ?auto_23454 ) ) ( not ( = ?auto_23451 ?auto_23459 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23453 ?auto_23452 ?auto_23454 )
      ( MAKE-5CRATE-VERIFY ?auto_23449 ?auto_23450 ?auto_23451 ?auto_23453 ?auto_23452 ?auto_23454 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23500 - SURFACE
      ?auto_23501 - SURFACE
      ?auto_23502 - SURFACE
      ?auto_23504 - SURFACE
      ?auto_23503 - SURFACE
      ?auto_23505 - SURFACE
    )
    :vars
    (
      ?auto_23508 - HOIST
      ?auto_23511 - PLACE
      ?auto_23506 - PLACE
      ?auto_23507 - HOIST
      ?auto_23510 - SURFACE
      ?auto_23509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23508 ?auto_23511 ) ( IS-CRATE ?auto_23505 ) ( not ( = ?auto_23503 ?auto_23505 ) ) ( not ( = ?auto_23504 ?auto_23503 ) ) ( not ( = ?auto_23504 ?auto_23505 ) ) ( not ( = ?auto_23506 ?auto_23511 ) ) ( HOIST-AT ?auto_23507 ?auto_23506 ) ( not ( = ?auto_23508 ?auto_23507 ) ) ( AVAILABLE ?auto_23507 ) ( SURFACE-AT ?auto_23505 ?auto_23506 ) ( ON ?auto_23505 ?auto_23510 ) ( CLEAR ?auto_23505 ) ( not ( = ?auto_23503 ?auto_23510 ) ) ( not ( = ?auto_23505 ?auto_23510 ) ) ( not ( = ?auto_23504 ?auto_23510 ) ) ( TRUCK-AT ?auto_23509 ?auto_23511 ) ( SURFACE-AT ?auto_23504 ?auto_23511 ) ( CLEAR ?auto_23504 ) ( LIFTING ?auto_23508 ?auto_23503 ) ( IS-CRATE ?auto_23503 ) ( ON ?auto_23501 ?auto_23500 ) ( ON ?auto_23502 ?auto_23501 ) ( ON ?auto_23504 ?auto_23502 ) ( not ( = ?auto_23500 ?auto_23501 ) ) ( not ( = ?auto_23500 ?auto_23502 ) ) ( not ( = ?auto_23500 ?auto_23504 ) ) ( not ( = ?auto_23500 ?auto_23503 ) ) ( not ( = ?auto_23500 ?auto_23505 ) ) ( not ( = ?auto_23500 ?auto_23510 ) ) ( not ( = ?auto_23501 ?auto_23502 ) ) ( not ( = ?auto_23501 ?auto_23504 ) ) ( not ( = ?auto_23501 ?auto_23503 ) ) ( not ( = ?auto_23501 ?auto_23505 ) ) ( not ( = ?auto_23501 ?auto_23510 ) ) ( not ( = ?auto_23502 ?auto_23504 ) ) ( not ( = ?auto_23502 ?auto_23503 ) ) ( not ( = ?auto_23502 ?auto_23505 ) ) ( not ( = ?auto_23502 ?auto_23510 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23504 ?auto_23503 ?auto_23505 )
      ( MAKE-5CRATE-VERIFY ?auto_23500 ?auto_23501 ?auto_23502 ?auto_23504 ?auto_23503 ?auto_23505 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23551 - SURFACE
      ?auto_23552 - SURFACE
      ?auto_23553 - SURFACE
      ?auto_23555 - SURFACE
      ?auto_23554 - SURFACE
      ?auto_23556 - SURFACE
    )
    :vars
    (
      ?auto_23562 - HOIST
      ?auto_23557 - PLACE
      ?auto_23560 - PLACE
      ?auto_23559 - HOIST
      ?auto_23561 - SURFACE
      ?auto_23558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23562 ?auto_23557 ) ( IS-CRATE ?auto_23556 ) ( not ( = ?auto_23554 ?auto_23556 ) ) ( not ( = ?auto_23555 ?auto_23554 ) ) ( not ( = ?auto_23555 ?auto_23556 ) ) ( not ( = ?auto_23560 ?auto_23557 ) ) ( HOIST-AT ?auto_23559 ?auto_23560 ) ( not ( = ?auto_23562 ?auto_23559 ) ) ( AVAILABLE ?auto_23559 ) ( SURFACE-AT ?auto_23556 ?auto_23560 ) ( ON ?auto_23556 ?auto_23561 ) ( CLEAR ?auto_23556 ) ( not ( = ?auto_23554 ?auto_23561 ) ) ( not ( = ?auto_23556 ?auto_23561 ) ) ( not ( = ?auto_23555 ?auto_23561 ) ) ( TRUCK-AT ?auto_23558 ?auto_23557 ) ( SURFACE-AT ?auto_23555 ?auto_23557 ) ( CLEAR ?auto_23555 ) ( IS-CRATE ?auto_23554 ) ( AVAILABLE ?auto_23562 ) ( IN ?auto_23554 ?auto_23558 ) ( ON ?auto_23552 ?auto_23551 ) ( ON ?auto_23553 ?auto_23552 ) ( ON ?auto_23555 ?auto_23553 ) ( not ( = ?auto_23551 ?auto_23552 ) ) ( not ( = ?auto_23551 ?auto_23553 ) ) ( not ( = ?auto_23551 ?auto_23555 ) ) ( not ( = ?auto_23551 ?auto_23554 ) ) ( not ( = ?auto_23551 ?auto_23556 ) ) ( not ( = ?auto_23551 ?auto_23561 ) ) ( not ( = ?auto_23552 ?auto_23553 ) ) ( not ( = ?auto_23552 ?auto_23555 ) ) ( not ( = ?auto_23552 ?auto_23554 ) ) ( not ( = ?auto_23552 ?auto_23556 ) ) ( not ( = ?auto_23552 ?auto_23561 ) ) ( not ( = ?auto_23553 ?auto_23555 ) ) ( not ( = ?auto_23553 ?auto_23554 ) ) ( not ( = ?auto_23553 ?auto_23556 ) ) ( not ( = ?auto_23553 ?auto_23561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23555 ?auto_23554 ?auto_23556 )
      ( MAKE-5CRATE-VERIFY ?auto_23551 ?auto_23552 ?auto_23553 ?auto_23555 ?auto_23554 ?auto_23556 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24543 - SURFACE
      ?auto_24544 - SURFACE
    )
    :vars
    (
      ?auto_24548 - HOIST
      ?auto_24550 - PLACE
      ?auto_24551 - SURFACE
      ?auto_24547 - TRUCK
      ?auto_24546 - PLACE
      ?auto_24545 - HOIST
      ?auto_24549 - SURFACE
      ?auto_24552 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24548 ?auto_24550 ) ( SURFACE-AT ?auto_24543 ?auto_24550 ) ( CLEAR ?auto_24543 ) ( IS-CRATE ?auto_24544 ) ( not ( = ?auto_24543 ?auto_24544 ) ) ( AVAILABLE ?auto_24548 ) ( ON ?auto_24543 ?auto_24551 ) ( not ( = ?auto_24551 ?auto_24543 ) ) ( not ( = ?auto_24551 ?auto_24544 ) ) ( TRUCK-AT ?auto_24547 ?auto_24546 ) ( not ( = ?auto_24546 ?auto_24550 ) ) ( HOIST-AT ?auto_24545 ?auto_24546 ) ( not ( = ?auto_24548 ?auto_24545 ) ) ( SURFACE-AT ?auto_24544 ?auto_24546 ) ( ON ?auto_24544 ?auto_24549 ) ( CLEAR ?auto_24544 ) ( not ( = ?auto_24543 ?auto_24549 ) ) ( not ( = ?auto_24544 ?auto_24549 ) ) ( not ( = ?auto_24551 ?auto_24549 ) ) ( LIFTING ?auto_24545 ?auto_24552 ) ( IS-CRATE ?auto_24552 ) ( not ( = ?auto_24543 ?auto_24552 ) ) ( not ( = ?auto_24544 ?auto_24552 ) ) ( not ( = ?auto_24551 ?auto_24552 ) ) ( not ( = ?auto_24549 ?auto_24552 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24545 ?auto_24552 ?auto_24547 ?auto_24546 )
      ( MAKE-1CRATE ?auto_24543 ?auto_24544 )
      ( MAKE-1CRATE-VERIFY ?auto_24543 ?auto_24544 ) )
  )

)

