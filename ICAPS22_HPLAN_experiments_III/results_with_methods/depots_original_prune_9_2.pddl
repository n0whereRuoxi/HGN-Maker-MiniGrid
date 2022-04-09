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

  ( :method MAKE-9CRATE-VERIFY
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
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205660 - SURFACE
      ?auto_205661 - SURFACE
    )
    :vars
    (
      ?auto_205662 - HOIST
      ?auto_205663 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205662 ?auto_205663 ) ( SURFACE-AT ?auto_205660 ?auto_205663 ) ( CLEAR ?auto_205660 ) ( LIFTING ?auto_205662 ?auto_205661 ) ( IS-CRATE ?auto_205661 ) ( not ( = ?auto_205660 ?auto_205661 ) ) )
    :subtasks
    ( ( !DROP ?auto_205662 ?auto_205661 ?auto_205660 ?auto_205663 )
      ( MAKE-1CRATE-VERIFY ?auto_205660 ?auto_205661 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205664 - SURFACE
      ?auto_205665 - SURFACE
    )
    :vars
    (
      ?auto_205667 - HOIST
      ?auto_205666 - PLACE
      ?auto_205668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205667 ?auto_205666 ) ( SURFACE-AT ?auto_205664 ?auto_205666 ) ( CLEAR ?auto_205664 ) ( IS-CRATE ?auto_205665 ) ( not ( = ?auto_205664 ?auto_205665 ) ) ( TRUCK-AT ?auto_205668 ?auto_205666 ) ( AVAILABLE ?auto_205667 ) ( IN ?auto_205665 ?auto_205668 ) )
    :subtasks
    ( ( !UNLOAD ?auto_205667 ?auto_205665 ?auto_205668 ?auto_205666 )
      ( MAKE-1CRATE ?auto_205664 ?auto_205665 )
      ( MAKE-1CRATE-VERIFY ?auto_205664 ?auto_205665 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205669 - SURFACE
      ?auto_205670 - SURFACE
    )
    :vars
    (
      ?auto_205673 - HOIST
      ?auto_205671 - PLACE
      ?auto_205672 - TRUCK
      ?auto_205674 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205673 ?auto_205671 ) ( SURFACE-AT ?auto_205669 ?auto_205671 ) ( CLEAR ?auto_205669 ) ( IS-CRATE ?auto_205670 ) ( not ( = ?auto_205669 ?auto_205670 ) ) ( AVAILABLE ?auto_205673 ) ( IN ?auto_205670 ?auto_205672 ) ( TRUCK-AT ?auto_205672 ?auto_205674 ) ( not ( = ?auto_205674 ?auto_205671 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_205672 ?auto_205674 ?auto_205671 )
      ( MAKE-1CRATE ?auto_205669 ?auto_205670 )
      ( MAKE-1CRATE-VERIFY ?auto_205669 ?auto_205670 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205675 - SURFACE
      ?auto_205676 - SURFACE
    )
    :vars
    (
      ?auto_205677 - HOIST
      ?auto_205678 - PLACE
      ?auto_205680 - TRUCK
      ?auto_205679 - PLACE
      ?auto_205681 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_205677 ?auto_205678 ) ( SURFACE-AT ?auto_205675 ?auto_205678 ) ( CLEAR ?auto_205675 ) ( IS-CRATE ?auto_205676 ) ( not ( = ?auto_205675 ?auto_205676 ) ) ( AVAILABLE ?auto_205677 ) ( TRUCK-AT ?auto_205680 ?auto_205679 ) ( not ( = ?auto_205679 ?auto_205678 ) ) ( HOIST-AT ?auto_205681 ?auto_205679 ) ( LIFTING ?auto_205681 ?auto_205676 ) ( not ( = ?auto_205677 ?auto_205681 ) ) )
    :subtasks
    ( ( !LOAD ?auto_205681 ?auto_205676 ?auto_205680 ?auto_205679 )
      ( MAKE-1CRATE ?auto_205675 ?auto_205676 )
      ( MAKE-1CRATE-VERIFY ?auto_205675 ?auto_205676 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205682 - SURFACE
      ?auto_205683 - SURFACE
    )
    :vars
    (
      ?auto_205688 - HOIST
      ?auto_205684 - PLACE
      ?auto_205687 - TRUCK
      ?auto_205686 - PLACE
      ?auto_205685 - HOIST
      ?auto_205689 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205688 ?auto_205684 ) ( SURFACE-AT ?auto_205682 ?auto_205684 ) ( CLEAR ?auto_205682 ) ( IS-CRATE ?auto_205683 ) ( not ( = ?auto_205682 ?auto_205683 ) ) ( AVAILABLE ?auto_205688 ) ( TRUCK-AT ?auto_205687 ?auto_205686 ) ( not ( = ?auto_205686 ?auto_205684 ) ) ( HOIST-AT ?auto_205685 ?auto_205686 ) ( not ( = ?auto_205688 ?auto_205685 ) ) ( AVAILABLE ?auto_205685 ) ( SURFACE-AT ?auto_205683 ?auto_205686 ) ( ON ?auto_205683 ?auto_205689 ) ( CLEAR ?auto_205683 ) ( not ( = ?auto_205682 ?auto_205689 ) ) ( not ( = ?auto_205683 ?auto_205689 ) ) )
    :subtasks
    ( ( !LIFT ?auto_205685 ?auto_205683 ?auto_205689 ?auto_205686 )
      ( MAKE-1CRATE ?auto_205682 ?auto_205683 )
      ( MAKE-1CRATE-VERIFY ?auto_205682 ?auto_205683 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205690 - SURFACE
      ?auto_205691 - SURFACE
    )
    :vars
    (
      ?auto_205692 - HOIST
      ?auto_205696 - PLACE
      ?auto_205695 - PLACE
      ?auto_205693 - HOIST
      ?auto_205697 - SURFACE
      ?auto_205694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205692 ?auto_205696 ) ( SURFACE-AT ?auto_205690 ?auto_205696 ) ( CLEAR ?auto_205690 ) ( IS-CRATE ?auto_205691 ) ( not ( = ?auto_205690 ?auto_205691 ) ) ( AVAILABLE ?auto_205692 ) ( not ( = ?auto_205695 ?auto_205696 ) ) ( HOIST-AT ?auto_205693 ?auto_205695 ) ( not ( = ?auto_205692 ?auto_205693 ) ) ( AVAILABLE ?auto_205693 ) ( SURFACE-AT ?auto_205691 ?auto_205695 ) ( ON ?auto_205691 ?auto_205697 ) ( CLEAR ?auto_205691 ) ( not ( = ?auto_205690 ?auto_205697 ) ) ( not ( = ?auto_205691 ?auto_205697 ) ) ( TRUCK-AT ?auto_205694 ?auto_205696 ) )
    :subtasks
    ( ( !DRIVE ?auto_205694 ?auto_205696 ?auto_205695 )
      ( MAKE-1CRATE ?auto_205690 ?auto_205691 )
      ( MAKE-1CRATE-VERIFY ?auto_205690 ?auto_205691 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205707 - SURFACE
      ?auto_205708 - SURFACE
      ?auto_205709 - SURFACE
    )
    :vars
    (
      ?auto_205710 - HOIST
      ?auto_205711 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205710 ?auto_205711 ) ( SURFACE-AT ?auto_205708 ?auto_205711 ) ( CLEAR ?auto_205708 ) ( LIFTING ?auto_205710 ?auto_205709 ) ( IS-CRATE ?auto_205709 ) ( not ( = ?auto_205708 ?auto_205709 ) ) ( ON ?auto_205708 ?auto_205707 ) ( not ( = ?auto_205707 ?auto_205708 ) ) ( not ( = ?auto_205707 ?auto_205709 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205708 ?auto_205709 )
      ( MAKE-2CRATE-VERIFY ?auto_205707 ?auto_205708 ?auto_205709 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205717 - SURFACE
      ?auto_205718 - SURFACE
      ?auto_205719 - SURFACE
    )
    :vars
    (
      ?auto_205721 - HOIST
      ?auto_205722 - PLACE
      ?auto_205720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205721 ?auto_205722 ) ( SURFACE-AT ?auto_205718 ?auto_205722 ) ( CLEAR ?auto_205718 ) ( IS-CRATE ?auto_205719 ) ( not ( = ?auto_205718 ?auto_205719 ) ) ( TRUCK-AT ?auto_205720 ?auto_205722 ) ( AVAILABLE ?auto_205721 ) ( IN ?auto_205719 ?auto_205720 ) ( ON ?auto_205718 ?auto_205717 ) ( not ( = ?auto_205717 ?auto_205718 ) ) ( not ( = ?auto_205717 ?auto_205719 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205718 ?auto_205719 )
      ( MAKE-2CRATE-VERIFY ?auto_205717 ?auto_205718 ?auto_205719 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205723 - SURFACE
      ?auto_205724 - SURFACE
    )
    :vars
    (
      ?auto_205726 - HOIST
      ?auto_205727 - PLACE
      ?auto_205728 - TRUCK
      ?auto_205725 - SURFACE
      ?auto_205729 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205726 ?auto_205727 ) ( SURFACE-AT ?auto_205723 ?auto_205727 ) ( CLEAR ?auto_205723 ) ( IS-CRATE ?auto_205724 ) ( not ( = ?auto_205723 ?auto_205724 ) ) ( AVAILABLE ?auto_205726 ) ( IN ?auto_205724 ?auto_205728 ) ( ON ?auto_205723 ?auto_205725 ) ( not ( = ?auto_205725 ?auto_205723 ) ) ( not ( = ?auto_205725 ?auto_205724 ) ) ( TRUCK-AT ?auto_205728 ?auto_205729 ) ( not ( = ?auto_205729 ?auto_205727 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_205728 ?auto_205729 ?auto_205727 )
      ( MAKE-2CRATE ?auto_205725 ?auto_205723 ?auto_205724 )
      ( MAKE-1CRATE-VERIFY ?auto_205723 ?auto_205724 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205730 - SURFACE
      ?auto_205731 - SURFACE
      ?auto_205732 - SURFACE
    )
    :vars
    (
      ?auto_205733 - HOIST
      ?auto_205735 - PLACE
      ?auto_205734 - TRUCK
      ?auto_205736 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205733 ?auto_205735 ) ( SURFACE-AT ?auto_205731 ?auto_205735 ) ( CLEAR ?auto_205731 ) ( IS-CRATE ?auto_205732 ) ( not ( = ?auto_205731 ?auto_205732 ) ) ( AVAILABLE ?auto_205733 ) ( IN ?auto_205732 ?auto_205734 ) ( ON ?auto_205731 ?auto_205730 ) ( not ( = ?auto_205730 ?auto_205731 ) ) ( not ( = ?auto_205730 ?auto_205732 ) ) ( TRUCK-AT ?auto_205734 ?auto_205736 ) ( not ( = ?auto_205736 ?auto_205735 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205731 ?auto_205732 )
      ( MAKE-2CRATE-VERIFY ?auto_205730 ?auto_205731 ?auto_205732 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205737 - SURFACE
      ?auto_205738 - SURFACE
    )
    :vars
    (
      ?auto_205740 - HOIST
      ?auto_205742 - PLACE
      ?auto_205743 - SURFACE
      ?auto_205739 - TRUCK
      ?auto_205741 - PLACE
      ?auto_205744 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_205740 ?auto_205742 ) ( SURFACE-AT ?auto_205737 ?auto_205742 ) ( CLEAR ?auto_205737 ) ( IS-CRATE ?auto_205738 ) ( not ( = ?auto_205737 ?auto_205738 ) ) ( AVAILABLE ?auto_205740 ) ( ON ?auto_205737 ?auto_205743 ) ( not ( = ?auto_205743 ?auto_205737 ) ) ( not ( = ?auto_205743 ?auto_205738 ) ) ( TRUCK-AT ?auto_205739 ?auto_205741 ) ( not ( = ?auto_205741 ?auto_205742 ) ) ( HOIST-AT ?auto_205744 ?auto_205741 ) ( LIFTING ?auto_205744 ?auto_205738 ) ( not ( = ?auto_205740 ?auto_205744 ) ) )
    :subtasks
    ( ( !LOAD ?auto_205744 ?auto_205738 ?auto_205739 ?auto_205741 )
      ( MAKE-2CRATE ?auto_205743 ?auto_205737 ?auto_205738 )
      ( MAKE-1CRATE-VERIFY ?auto_205737 ?auto_205738 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205745 - SURFACE
      ?auto_205746 - SURFACE
      ?auto_205747 - SURFACE
    )
    :vars
    (
      ?auto_205752 - HOIST
      ?auto_205751 - PLACE
      ?auto_205750 - TRUCK
      ?auto_205748 - PLACE
      ?auto_205749 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_205752 ?auto_205751 ) ( SURFACE-AT ?auto_205746 ?auto_205751 ) ( CLEAR ?auto_205746 ) ( IS-CRATE ?auto_205747 ) ( not ( = ?auto_205746 ?auto_205747 ) ) ( AVAILABLE ?auto_205752 ) ( ON ?auto_205746 ?auto_205745 ) ( not ( = ?auto_205745 ?auto_205746 ) ) ( not ( = ?auto_205745 ?auto_205747 ) ) ( TRUCK-AT ?auto_205750 ?auto_205748 ) ( not ( = ?auto_205748 ?auto_205751 ) ) ( HOIST-AT ?auto_205749 ?auto_205748 ) ( LIFTING ?auto_205749 ?auto_205747 ) ( not ( = ?auto_205752 ?auto_205749 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205746 ?auto_205747 )
      ( MAKE-2CRATE-VERIFY ?auto_205745 ?auto_205746 ?auto_205747 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205753 - SURFACE
      ?auto_205754 - SURFACE
    )
    :vars
    (
      ?auto_205755 - HOIST
      ?auto_205756 - PLACE
      ?auto_205760 - SURFACE
      ?auto_205758 - TRUCK
      ?auto_205759 - PLACE
      ?auto_205757 - HOIST
      ?auto_205761 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205755 ?auto_205756 ) ( SURFACE-AT ?auto_205753 ?auto_205756 ) ( CLEAR ?auto_205753 ) ( IS-CRATE ?auto_205754 ) ( not ( = ?auto_205753 ?auto_205754 ) ) ( AVAILABLE ?auto_205755 ) ( ON ?auto_205753 ?auto_205760 ) ( not ( = ?auto_205760 ?auto_205753 ) ) ( not ( = ?auto_205760 ?auto_205754 ) ) ( TRUCK-AT ?auto_205758 ?auto_205759 ) ( not ( = ?auto_205759 ?auto_205756 ) ) ( HOIST-AT ?auto_205757 ?auto_205759 ) ( not ( = ?auto_205755 ?auto_205757 ) ) ( AVAILABLE ?auto_205757 ) ( SURFACE-AT ?auto_205754 ?auto_205759 ) ( ON ?auto_205754 ?auto_205761 ) ( CLEAR ?auto_205754 ) ( not ( = ?auto_205753 ?auto_205761 ) ) ( not ( = ?auto_205754 ?auto_205761 ) ) ( not ( = ?auto_205760 ?auto_205761 ) ) )
    :subtasks
    ( ( !LIFT ?auto_205757 ?auto_205754 ?auto_205761 ?auto_205759 )
      ( MAKE-2CRATE ?auto_205760 ?auto_205753 ?auto_205754 )
      ( MAKE-1CRATE-VERIFY ?auto_205753 ?auto_205754 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205762 - SURFACE
      ?auto_205763 - SURFACE
      ?auto_205764 - SURFACE
    )
    :vars
    (
      ?auto_205768 - HOIST
      ?auto_205769 - PLACE
      ?auto_205766 - TRUCK
      ?auto_205765 - PLACE
      ?auto_205767 - HOIST
      ?auto_205770 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205768 ?auto_205769 ) ( SURFACE-AT ?auto_205763 ?auto_205769 ) ( CLEAR ?auto_205763 ) ( IS-CRATE ?auto_205764 ) ( not ( = ?auto_205763 ?auto_205764 ) ) ( AVAILABLE ?auto_205768 ) ( ON ?auto_205763 ?auto_205762 ) ( not ( = ?auto_205762 ?auto_205763 ) ) ( not ( = ?auto_205762 ?auto_205764 ) ) ( TRUCK-AT ?auto_205766 ?auto_205765 ) ( not ( = ?auto_205765 ?auto_205769 ) ) ( HOIST-AT ?auto_205767 ?auto_205765 ) ( not ( = ?auto_205768 ?auto_205767 ) ) ( AVAILABLE ?auto_205767 ) ( SURFACE-AT ?auto_205764 ?auto_205765 ) ( ON ?auto_205764 ?auto_205770 ) ( CLEAR ?auto_205764 ) ( not ( = ?auto_205763 ?auto_205770 ) ) ( not ( = ?auto_205764 ?auto_205770 ) ) ( not ( = ?auto_205762 ?auto_205770 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205763 ?auto_205764 )
      ( MAKE-2CRATE-VERIFY ?auto_205762 ?auto_205763 ?auto_205764 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205771 - SURFACE
      ?auto_205772 - SURFACE
    )
    :vars
    (
      ?auto_205775 - HOIST
      ?auto_205773 - PLACE
      ?auto_205777 - SURFACE
      ?auto_205774 - PLACE
      ?auto_205776 - HOIST
      ?auto_205778 - SURFACE
      ?auto_205779 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205775 ?auto_205773 ) ( SURFACE-AT ?auto_205771 ?auto_205773 ) ( CLEAR ?auto_205771 ) ( IS-CRATE ?auto_205772 ) ( not ( = ?auto_205771 ?auto_205772 ) ) ( AVAILABLE ?auto_205775 ) ( ON ?auto_205771 ?auto_205777 ) ( not ( = ?auto_205777 ?auto_205771 ) ) ( not ( = ?auto_205777 ?auto_205772 ) ) ( not ( = ?auto_205774 ?auto_205773 ) ) ( HOIST-AT ?auto_205776 ?auto_205774 ) ( not ( = ?auto_205775 ?auto_205776 ) ) ( AVAILABLE ?auto_205776 ) ( SURFACE-AT ?auto_205772 ?auto_205774 ) ( ON ?auto_205772 ?auto_205778 ) ( CLEAR ?auto_205772 ) ( not ( = ?auto_205771 ?auto_205778 ) ) ( not ( = ?auto_205772 ?auto_205778 ) ) ( not ( = ?auto_205777 ?auto_205778 ) ) ( TRUCK-AT ?auto_205779 ?auto_205773 ) )
    :subtasks
    ( ( !DRIVE ?auto_205779 ?auto_205773 ?auto_205774 )
      ( MAKE-2CRATE ?auto_205777 ?auto_205771 ?auto_205772 )
      ( MAKE-1CRATE-VERIFY ?auto_205771 ?auto_205772 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205780 - SURFACE
      ?auto_205781 - SURFACE
      ?auto_205782 - SURFACE
    )
    :vars
    (
      ?auto_205788 - HOIST
      ?auto_205785 - PLACE
      ?auto_205783 - PLACE
      ?auto_205786 - HOIST
      ?auto_205784 - SURFACE
      ?auto_205787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205788 ?auto_205785 ) ( SURFACE-AT ?auto_205781 ?auto_205785 ) ( CLEAR ?auto_205781 ) ( IS-CRATE ?auto_205782 ) ( not ( = ?auto_205781 ?auto_205782 ) ) ( AVAILABLE ?auto_205788 ) ( ON ?auto_205781 ?auto_205780 ) ( not ( = ?auto_205780 ?auto_205781 ) ) ( not ( = ?auto_205780 ?auto_205782 ) ) ( not ( = ?auto_205783 ?auto_205785 ) ) ( HOIST-AT ?auto_205786 ?auto_205783 ) ( not ( = ?auto_205788 ?auto_205786 ) ) ( AVAILABLE ?auto_205786 ) ( SURFACE-AT ?auto_205782 ?auto_205783 ) ( ON ?auto_205782 ?auto_205784 ) ( CLEAR ?auto_205782 ) ( not ( = ?auto_205781 ?auto_205784 ) ) ( not ( = ?auto_205782 ?auto_205784 ) ) ( not ( = ?auto_205780 ?auto_205784 ) ) ( TRUCK-AT ?auto_205787 ?auto_205785 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205781 ?auto_205782 )
      ( MAKE-2CRATE-VERIFY ?auto_205780 ?auto_205781 ?auto_205782 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205789 - SURFACE
      ?auto_205790 - SURFACE
    )
    :vars
    (
      ?auto_205796 - HOIST
      ?auto_205797 - PLACE
      ?auto_205795 - SURFACE
      ?auto_205794 - PLACE
      ?auto_205791 - HOIST
      ?auto_205792 - SURFACE
      ?auto_205793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205796 ?auto_205797 ) ( IS-CRATE ?auto_205790 ) ( not ( = ?auto_205789 ?auto_205790 ) ) ( not ( = ?auto_205795 ?auto_205789 ) ) ( not ( = ?auto_205795 ?auto_205790 ) ) ( not ( = ?auto_205794 ?auto_205797 ) ) ( HOIST-AT ?auto_205791 ?auto_205794 ) ( not ( = ?auto_205796 ?auto_205791 ) ) ( AVAILABLE ?auto_205791 ) ( SURFACE-AT ?auto_205790 ?auto_205794 ) ( ON ?auto_205790 ?auto_205792 ) ( CLEAR ?auto_205790 ) ( not ( = ?auto_205789 ?auto_205792 ) ) ( not ( = ?auto_205790 ?auto_205792 ) ) ( not ( = ?auto_205795 ?auto_205792 ) ) ( TRUCK-AT ?auto_205793 ?auto_205797 ) ( SURFACE-AT ?auto_205795 ?auto_205797 ) ( CLEAR ?auto_205795 ) ( LIFTING ?auto_205796 ?auto_205789 ) ( IS-CRATE ?auto_205789 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205795 ?auto_205789 )
      ( MAKE-2CRATE ?auto_205795 ?auto_205789 ?auto_205790 )
      ( MAKE-1CRATE-VERIFY ?auto_205789 ?auto_205790 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205798 - SURFACE
      ?auto_205799 - SURFACE
      ?auto_205800 - SURFACE
    )
    :vars
    (
      ?auto_205805 - HOIST
      ?auto_205803 - PLACE
      ?auto_205801 - PLACE
      ?auto_205804 - HOIST
      ?auto_205802 - SURFACE
      ?auto_205806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205805 ?auto_205803 ) ( IS-CRATE ?auto_205800 ) ( not ( = ?auto_205799 ?auto_205800 ) ) ( not ( = ?auto_205798 ?auto_205799 ) ) ( not ( = ?auto_205798 ?auto_205800 ) ) ( not ( = ?auto_205801 ?auto_205803 ) ) ( HOIST-AT ?auto_205804 ?auto_205801 ) ( not ( = ?auto_205805 ?auto_205804 ) ) ( AVAILABLE ?auto_205804 ) ( SURFACE-AT ?auto_205800 ?auto_205801 ) ( ON ?auto_205800 ?auto_205802 ) ( CLEAR ?auto_205800 ) ( not ( = ?auto_205799 ?auto_205802 ) ) ( not ( = ?auto_205800 ?auto_205802 ) ) ( not ( = ?auto_205798 ?auto_205802 ) ) ( TRUCK-AT ?auto_205806 ?auto_205803 ) ( SURFACE-AT ?auto_205798 ?auto_205803 ) ( CLEAR ?auto_205798 ) ( LIFTING ?auto_205805 ?auto_205799 ) ( IS-CRATE ?auto_205799 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205799 ?auto_205800 )
      ( MAKE-2CRATE-VERIFY ?auto_205798 ?auto_205799 ?auto_205800 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205807 - SURFACE
      ?auto_205808 - SURFACE
    )
    :vars
    (
      ?auto_205809 - HOIST
      ?auto_205811 - PLACE
      ?auto_205813 - SURFACE
      ?auto_205812 - PLACE
      ?auto_205814 - HOIST
      ?auto_205810 - SURFACE
      ?auto_205815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205809 ?auto_205811 ) ( IS-CRATE ?auto_205808 ) ( not ( = ?auto_205807 ?auto_205808 ) ) ( not ( = ?auto_205813 ?auto_205807 ) ) ( not ( = ?auto_205813 ?auto_205808 ) ) ( not ( = ?auto_205812 ?auto_205811 ) ) ( HOIST-AT ?auto_205814 ?auto_205812 ) ( not ( = ?auto_205809 ?auto_205814 ) ) ( AVAILABLE ?auto_205814 ) ( SURFACE-AT ?auto_205808 ?auto_205812 ) ( ON ?auto_205808 ?auto_205810 ) ( CLEAR ?auto_205808 ) ( not ( = ?auto_205807 ?auto_205810 ) ) ( not ( = ?auto_205808 ?auto_205810 ) ) ( not ( = ?auto_205813 ?auto_205810 ) ) ( TRUCK-AT ?auto_205815 ?auto_205811 ) ( SURFACE-AT ?auto_205813 ?auto_205811 ) ( CLEAR ?auto_205813 ) ( IS-CRATE ?auto_205807 ) ( AVAILABLE ?auto_205809 ) ( IN ?auto_205807 ?auto_205815 ) )
    :subtasks
    ( ( !UNLOAD ?auto_205809 ?auto_205807 ?auto_205815 ?auto_205811 )
      ( MAKE-2CRATE ?auto_205813 ?auto_205807 ?auto_205808 )
      ( MAKE-1CRATE-VERIFY ?auto_205807 ?auto_205808 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205816 - SURFACE
      ?auto_205817 - SURFACE
      ?auto_205818 - SURFACE
    )
    :vars
    (
      ?auto_205821 - HOIST
      ?auto_205819 - PLACE
      ?auto_205823 - PLACE
      ?auto_205824 - HOIST
      ?auto_205822 - SURFACE
      ?auto_205820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205821 ?auto_205819 ) ( IS-CRATE ?auto_205818 ) ( not ( = ?auto_205817 ?auto_205818 ) ) ( not ( = ?auto_205816 ?auto_205817 ) ) ( not ( = ?auto_205816 ?auto_205818 ) ) ( not ( = ?auto_205823 ?auto_205819 ) ) ( HOIST-AT ?auto_205824 ?auto_205823 ) ( not ( = ?auto_205821 ?auto_205824 ) ) ( AVAILABLE ?auto_205824 ) ( SURFACE-AT ?auto_205818 ?auto_205823 ) ( ON ?auto_205818 ?auto_205822 ) ( CLEAR ?auto_205818 ) ( not ( = ?auto_205817 ?auto_205822 ) ) ( not ( = ?auto_205818 ?auto_205822 ) ) ( not ( = ?auto_205816 ?auto_205822 ) ) ( TRUCK-AT ?auto_205820 ?auto_205819 ) ( SURFACE-AT ?auto_205816 ?auto_205819 ) ( CLEAR ?auto_205816 ) ( IS-CRATE ?auto_205817 ) ( AVAILABLE ?auto_205821 ) ( IN ?auto_205817 ?auto_205820 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205817 ?auto_205818 )
      ( MAKE-2CRATE-VERIFY ?auto_205816 ?auto_205817 ?auto_205818 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205861 - SURFACE
      ?auto_205862 - SURFACE
    )
    :vars
    (
      ?auto_205863 - HOIST
      ?auto_205869 - PLACE
      ?auto_205864 - SURFACE
      ?auto_205867 - PLACE
      ?auto_205868 - HOIST
      ?auto_205866 - SURFACE
      ?auto_205865 - TRUCK
      ?auto_205870 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205863 ?auto_205869 ) ( SURFACE-AT ?auto_205861 ?auto_205869 ) ( CLEAR ?auto_205861 ) ( IS-CRATE ?auto_205862 ) ( not ( = ?auto_205861 ?auto_205862 ) ) ( AVAILABLE ?auto_205863 ) ( ON ?auto_205861 ?auto_205864 ) ( not ( = ?auto_205864 ?auto_205861 ) ) ( not ( = ?auto_205864 ?auto_205862 ) ) ( not ( = ?auto_205867 ?auto_205869 ) ) ( HOIST-AT ?auto_205868 ?auto_205867 ) ( not ( = ?auto_205863 ?auto_205868 ) ) ( AVAILABLE ?auto_205868 ) ( SURFACE-AT ?auto_205862 ?auto_205867 ) ( ON ?auto_205862 ?auto_205866 ) ( CLEAR ?auto_205862 ) ( not ( = ?auto_205861 ?auto_205866 ) ) ( not ( = ?auto_205862 ?auto_205866 ) ) ( not ( = ?auto_205864 ?auto_205866 ) ) ( TRUCK-AT ?auto_205865 ?auto_205870 ) ( not ( = ?auto_205870 ?auto_205869 ) ) ( not ( = ?auto_205867 ?auto_205870 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_205865 ?auto_205870 ?auto_205869 )
      ( MAKE-1CRATE ?auto_205861 ?auto_205862 )
      ( MAKE-1CRATE-VERIFY ?auto_205861 ?auto_205862 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_205900 - SURFACE
      ?auto_205901 - SURFACE
      ?auto_205902 - SURFACE
      ?auto_205903 - SURFACE
    )
    :vars
    (
      ?auto_205904 - HOIST
      ?auto_205905 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205904 ?auto_205905 ) ( SURFACE-AT ?auto_205902 ?auto_205905 ) ( CLEAR ?auto_205902 ) ( LIFTING ?auto_205904 ?auto_205903 ) ( IS-CRATE ?auto_205903 ) ( not ( = ?auto_205902 ?auto_205903 ) ) ( ON ?auto_205901 ?auto_205900 ) ( ON ?auto_205902 ?auto_205901 ) ( not ( = ?auto_205900 ?auto_205901 ) ) ( not ( = ?auto_205900 ?auto_205902 ) ) ( not ( = ?auto_205900 ?auto_205903 ) ) ( not ( = ?auto_205901 ?auto_205902 ) ) ( not ( = ?auto_205901 ?auto_205903 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205902 ?auto_205903 )
      ( MAKE-3CRATE-VERIFY ?auto_205900 ?auto_205901 ?auto_205902 ?auto_205903 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_205917 - SURFACE
      ?auto_205918 - SURFACE
      ?auto_205919 - SURFACE
      ?auto_205920 - SURFACE
    )
    :vars
    (
      ?auto_205922 - HOIST
      ?auto_205923 - PLACE
      ?auto_205921 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205922 ?auto_205923 ) ( SURFACE-AT ?auto_205919 ?auto_205923 ) ( CLEAR ?auto_205919 ) ( IS-CRATE ?auto_205920 ) ( not ( = ?auto_205919 ?auto_205920 ) ) ( TRUCK-AT ?auto_205921 ?auto_205923 ) ( AVAILABLE ?auto_205922 ) ( IN ?auto_205920 ?auto_205921 ) ( ON ?auto_205919 ?auto_205918 ) ( not ( = ?auto_205918 ?auto_205919 ) ) ( not ( = ?auto_205918 ?auto_205920 ) ) ( ON ?auto_205918 ?auto_205917 ) ( not ( = ?auto_205917 ?auto_205918 ) ) ( not ( = ?auto_205917 ?auto_205919 ) ) ( not ( = ?auto_205917 ?auto_205920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_205918 ?auto_205919 ?auto_205920 )
      ( MAKE-3CRATE-VERIFY ?auto_205917 ?auto_205918 ?auto_205919 ?auto_205920 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_205938 - SURFACE
      ?auto_205939 - SURFACE
      ?auto_205940 - SURFACE
      ?auto_205941 - SURFACE
    )
    :vars
    (
      ?auto_205942 - HOIST
      ?auto_205944 - PLACE
      ?auto_205945 - TRUCK
      ?auto_205943 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205942 ?auto_205944 ) ( SURFACE-AT ?auto_205940 ?auto_205944 ) ( CLEAR ?auto_205940 ) ( IS-CRATE ?auto_205941 ) ( not ( = ?auto_205940 ?auto_205941 ) ) ( AVAILABLE ?auto_205942 ) ( IN ?auto_205941 ?auto_205945 ) ( ON ?auto_205940 ?auto_205939 ) ( not ( = ?auto_205939 ?auto_205940 ) ) ( not ( = ?auto_205939 ?auto_205941 ) ) ( TRUCK-AT ?auto_205945 ?auto_205943 ) ( not ( = ?auto_205943 ?auto_205944 ) ) ( ON ?auto_205939 ?auto_205938 ) ( not ( = ?auto_205938 ?auto_205939 ) ) ( not ( = ?auto_205938 ?auto_205940 ) ) ( not ( = ?auto_205938 ?auto_205941 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_205939 ?auto_205940 ?auto_205941 )
      ( MAKE-3CRATE-VERIFY ?auto_205938 ?auto_205939 ?auto_205940 ?auto_205941 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_205962 - SURFACE
      ?auto_205963 - SURFACE
      ?auto_205964 - SURFACE
      ?auto_205965 - SURFACE
    )
    :vars
    (
      ?auto_205968 - HOIST
      ?auto_205967 - PLACE
      ?auto_205966 - TRUCK
      ?auto_205970 - PLACE
      ?auto_205969 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_205968 ?auto_205967 ) ( SURFACE-AT ?auto_205964 ?auto_205967 ) ( CLEAR ?auto_205964 ) ( IS-CRATE ?auto_205965 ) ( not ( = ?auto_205964 ?auto_205965 ) ) ( AVAILABLE ?auto_205968 ) ( ON ?auto_205964 ?auto_205963 ) ( not ( = ?auto_205963 ?auto_205964 ) ) ( not ( = ?auto_205963 ?auto_205965 ) ) ( TRUCK-AT ?auto_205966 ?auto_205970 ) ( not ( = ?auto_205970 ?auto_205967 ) ) ( HOIST-AT ?auto_205969 ?auto_205970 ) ( LIFTING ?auto_205969 ?auto_205965 ) ( not ( = ?auto_205968 ?auto_205969 ) ) ( ON ?auto_205963 ?auto_205962 ) ( not ( = ?auto_205962 ?auto_205963 ) ) ( not ( = ?auto_205962 ?auto_205964 ) ) ( not ( = ?auto_205962 ?auto_205965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_205963 ?auto_205964 ?auto_205965 )
      ( MAKE-3CRATE-VERIFY ?auto_205962 ?auto_205963 ?auto_205964 ?auto_205965 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_205989 - SURFACE
      ?auto_205990 - SURFACE
      ?auto_205991 - SURFACE
      ?auto_205992 - SURFACE
    )
    :vars
    (
      ?auto_205996 - HOIST
      ?auto_205997 - PLACE
      ?auto_205993 - TRUCK
      ?auto_205998 - PLACE
      ?auto_205995 - HOIST
      ?auto_205994 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205996 ?auto_205997 ) ( SURFACE-AT ?auto_205991 ?auto_205997 ) ( CLEAR ?auto_205991 ) ( IS-CRATE ?auto_205992 ) ( not ( = ?auto_205991 ?auto_205992 ) ) ( AVAILABLE ?auto_205996 ) ( ON ?auto_205991 ?auto_205990 ) ( not ( = ?auto_205990 ?auto_205991 ) ) ( not ( = ?auto_205990 ?auto_205992 ) ) ( TRUCK-AT ?auto_205993 ?auto_205998 ) ( not ( = ?auto_205998 ?auto_205997 ) ) ( HOIST-AT ?auto_205995 ?auto_205998 ) ( not ( = ?auto_205996 ?auto_205995 ) ) ( AVAILABLE ?auto_205995 ) ( SURFACE-AT ?auto_205992 ?auto_205998 ) ( ON ?auto_205992 ?auto_205994 ) ( CLEAR ?auto_205992 ) ( not ( = ?auto_205991 ?auto_205994 ) ) ( not ( = ?auto_205992 ?auto_205994 ) ) ( not ( = ?auto_205990 ?auto_205994 ) ) ( ON ?auto_205990 ?auto_205989 ) ( not ( = ?auto_205989 ?auto_205990 ) ) ( not ( = ?auto_205989 ?auto_205991 ) ) ( not ( = ?auto_205989 ?auto_205992 ) ) ( not ( = ?auto_205989 ?auto_205994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_205990 ?auto_205991 ?auto_205992 )
      ( MAKE-3CRATE-VERIFY ?auto_205989 ?auto_205990 ?auto_205991 ?auto_205992 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_206017 - SURFACE
      ?auto_206018 - SURFACE
      ?auto_206019 - SURFACE
      ?auto_206020 - SURFACE
    )
    :vars
    (
      ?auto_206026 - HOIST
      ?auto_206023 - PLACE
      ?auto_206024 - PLACE
      ?auto_206025 - HOIST
      ?auto_206022 - SURFACE
      ?auto_206021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206026 ?auto_206023 ) ( SURFACE-AT ?auto_206019 ?auto_206023 ) ( CLEAR ?auto_206019 ) ( IS-CRATE ?auto_206020 ) ( not ( = ?auto_206019 ?auto_206020 ) ) ( AVAILABLE ?auto_206026 ) ( ON ?auto_206019 ?auto_206018 ) ( not ( = ?auto_206018 ?auto_206019 ) ) ( not ( = ?auto_206018 ?auto_206020 ) ) ( not ( = ?auto_206024 ?auto_206023 ) ) ( HOIST-AT ?auto_206025 ?auto_206024 ) ( not ( = ?auto_206026 ?auto_206025 ) ) ( AVAILABLE ?auto_206025 ) ( SURFACE-AT ?auto_206020 ?auto_206024 ) ( ON ?auto_206020 ?auto_206022 ) ( CLEAR ?auto_206020 ) ( not ( = ?auto_206019 ?auto_206022 ) ) ( not ( = ?auto_206020 ?auto_206022 ) ) ( not ( = ?auto_206018 ?auto_206022 ) ) ( TRUCK-AT ?auto_206021 ?auto_206023 ) ( ON ?auto_206018 ?auto_206017 ) ( not ( = ?auto_206017 ?auto_206018 ) ) ( not ( = ?auto_206017 ?auto_206019 ) ) ( not ( = ?auto_206017 ?auto_206020 ) ) ( not ( = ?auto_206017 ?auto_206022 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206018 ?auto_206019 ?auto_206020 )
      ( MAKE-3CRATE-VERIFY ?auto_206017 ?auto_206018 ?auto_206019 ?auto_206020 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_206045 - SURFACE
      ?auto_206046 - SURFACE
      ?auto_206047 - SURFACE
      ?auto_206048 - SURFACE
    )
    :vars
    (
      ?auto_206054 - HOIST
      ?auto_206049 - PLACE
      ?auto_206053 - PLACE
      ?auto_206052 - HOIST
      ?auto_206051 - SURFACE
      ?auto_206050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206054 ?auto_206049 ) ( IS-CRATE ?auto_206048 ) ( not ( = ?auto_206047 ?auto_206048 ) ) ( not ( = ?auto_206046 ?auto_206047 ) ) ( not ( = ?auto_206046 ?auto_206048 ) ) ( not ( = ?auto_206053 ?auto_206049 ) ) ( HOIST-AT ?auto_206052 ?auto_206053 ) ( not ( = ?auto_206054 ?auto_206052 ) ) ( AVAILABLE ?auto_206052 ) ( SURFACE-AT ?auto_206048 ?auto_206053 ) ( ON ?auto_206048 ?auto_206051 ) ( CLEAR ?auto_206048 ) ( not ( = ?auto_206047 ?auto_206051 ) ) ( not ( = ?auto_206048 ?auto_206051 ) ) ( not ( = ?auto_206046 ?auto_206051 ) ) ( TRUCK-AT ?auto_206050 ?auto_206049 ) ( SURFACE-AT ?auto_206046 ?auto_206049 ) ( CLEAR ?auto_206046 ) ( LIFTING ?auto_206054 ?auto_206047 ) ( IS-CRATE ?auto_206047 ) ( ON ?auto_206046 ?auto_206045 ) ( not ( = ?auto_206045 ?auto_206046 ) ) ( not ( = ?auto_206045 ?auto_206047 ) ) ( not ( = ?auto_206045 ?auto_206048 ) ) ( not ( = ?auto_206045 ?auto_206051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206046 ?auto_206047 ?auto_206048 )
      ( MAKE-3CRATE-VERIFY ?auto_206045 ?auto_206046 ?auto_206047 ?auto_206048 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_206073 - SURFACE
      ?auto_206074 - SURFACE
      ?auto_206075 - SURFACE
      ?auto_206076 - SURFACE
    )
    :vars
    (
      ?auto_206077 - HOIST
      ?auto_206079 - PLACE
      ?auto_206082 - PLACE
      ?auto_206080 - HOIST
      ?auto_206081 - SURFACE
      ?auto_206078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206077 ?auto_206079 ) ( IS-CRATE ?auto_206076 ) ( not ( = ?auto_206075 ?auto_206076 ) ) ( not ( = ?auto_206074 ?auto_206075 ) ) ( not ( = ?auto_206074 ?auto_206076 ) ) ( not ( = ?auto_206082 ?auto_206079 ) ) ( HOIST-AT ?auto_206080 ?auto_206082 ) ( not ( = ?auto_206077 ?auto_206080 ) ) ( AVAILABLE ?auto_206080 ) ( SURFACE-AT ?auto_206076 ?auto_206082 ) ( ON ?auto_206076 ?auto_206081 ) ( CLEAR ?auto_206076 ) ( not ( = ?auto_206075 ?auto_206081 ) ) ( not ( = ?auto_206076 ?auto_206081 ) ) ( not ( = ?auto_206074 ?auto_206081 ) ) ( TRUCK-AT ?auto_206078 ?auto_206079 ) ( SURFACE-AT ?auto_206074 ?auto_206079 ) ( CLEAR ?auto_206074 ) ( IS-CRATE ?auto_206075 ) ( AVAILABLE ?auto_206077 ) ( IN ?auto_206075 ?auto_206078 ) ( ON ?auto_206074 ?auto_206073 ) ( not ( = ?auto_206073 ?auto_206074 ) ) ( not ( = ?auto_206073 ?auto_206075 ) ) ( not ( = ?auto_206073 ?auto_206076 ) ) ( not ( = ?auto_206073 ?auto_206081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206074 ?auto_206075 ?auto_206076 )
      ( MAKE-3CRATE-VERIFY ?auto_206073 ?auto_206074 ?auto_206075 ?auto_206076 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206364 - SURFACE
      ?auto_206365 - SURFACE
      ?auto_206366 - SURFACE
      ?auto_206367 - SURFACE
      ?auto_206368 - SURFACE
    )
    :vars
    (
      ?auto_206369 - HOIST
      ?auto_206370 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_206369 ?auto_206370 ) ( SURFACE-AT ?auto_206367 ?auto_206370 ) ( CLEAR ?auto_206367 ) ( LIFTING ?auto_206369 ?auto_206368 ) ( IS-CRATE ?auto_206368 ) ( not ( = ?auto_206367 ?auto_206368 ) ) ( ON ?auto_206365 ?auto_206364 ) ( ON ?auto_206366 ?auto_206365 ) ( ON ?auto_206367 ?auto_206366 ) ( not ( = ?auto_206364 ?auto_206365 ) ) ( not ( = ?auto_206364 ?auto_206366 ) ) ( not ( = ?auto_206364 ?auto_206367 ) ) ( not ( = ?auto_206364 ?auto_206368 ) ) ( not ( = ?auto_206365 ?auto_206366 ) ) ( not ( = ?auto_206365 ?auto_206367 ) ) ( not ( = ?auto_206365 ?auto_206368 ) ) ( not ( = ?auto_206366 ?auto_206367 ) ) ( not ( = ?auto_206366 ?auto_206368 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_206367 ?auto_206368 )
      ( MAKE-4CRATE-VERIFY ?auto_206364 ?auto_206365 ?auto_206366 ?auto_206367 ?auto_206368 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206389 - SURFACE
      ?auto_206390 - SURFACE
      ?auto_206391 - SURFACE
      ?auto_206392 - SURFACE
      ?auto_206393 - SURFACE
    )
    :vars
    (
      ?auto_206395 - HOIST
      ?auto_206394 - PLACE
      ?auto_206396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206395 ?auto_206394 ) ( SURFACE-AT ?auto_206392 ?auto_206394 ) ( CLEAR ?auto_206392 ) ( IS-CRATE ?auto_206393 ) ( not ( = ?auto_206392 ?auto_206393 ) ) ( TRUCK-AT ?auto_206396 ?auto_206394 ) ( AVAILABLE ?auto_206395 ) ( IN ?auto_206393 ?auto_206396 ) ( ON ?auto_206392 ?auto_206391 ) ( not ( = ?auto_206391 ?auto_206392 ) ) ( not ( = ?auto_206391 ?auto_206393 ) ) ( ON ?auto_206390 ?auto_206389 ) ( ON ?auto_206391 ?auto_206390 ) ( not ( = ?auto_206389 ?auto_206390 ) ) ( not ( = ?auto_206389 ?auto_206391 ) ) ( not ( = ?auto_206389 ?auto_206392 ) ) ( not ( = ?auto_206389 ?auto_206393 ) ) ( not ( = ?auto_206390 ?auto_206391 ) ) ( not ( = ?auto_206390 ?auto_206392 ) ) ( not ( = ?auto_206390 ?auto_206393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206391 ?auto_206392 ?auto_206393 )
      ( MAKE-4CRATE-VERIFY ?auto_206389 ?auto_206390 ?auto_206391 ?auto_206392 ?auto_206393 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206419 - SURFACE
      ?auto_206420 - SURFACE
      ?auto_206421 - SURFACE
      ?auto_206422 - SURFACE
      ?auto_206423 - SURFACE
    )
    :vars
    (
      ?auto_206424 - HOIST
      ?auto_206426 - PLACE
      ?auto_206427 - TRUCK
      ?auto_206425 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_206424 ?auto_206426 ) ( SURFACE-AT ?auto_206422 ?auto_206426 ) ( CLEAR ?auto_206422 ) ( IS-CRATE ?auto_206423 ) ( not ( = ?auto_206422 ?auto_206423 ) ) ( AVAILABLE ?auto_206424 ) ( IN ?auto_206423 ?auto_206427 ) ( ON ?auto_206422 ?auto_206421 ) ( not ( = ?auto_206421 ?auto_206422 ) ) ( not ( = ?auto_206421 ?auto_206423 ) ) ( TRUCK-AT ?auto_206427 ?auto_206425 ) ( not ( = ?auto_206425 ?auto_206426 ) ) ( ON ?auto_206420 ?auto_206419 ) ( ON ?auto_206421 ?auto_206420 ) ( not ( = ?auto_206419 ?auto_206420 ) ) ( not ( = ?auto_206419 ?auto_206421 ) ) ( not ( = ?auto_206419 ?auto_206422 ) ) ( not ( = ?auto_206419 ?auto_206423 ) ) ( not ( = ?auto_206420 ?auto_206421 ) ) ( not ( = ?auto_206420 ?auto_206422 ) ) ( not ( = ?auto_206420 ?auto_206423 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206421 ?auto_206422 ?auto_206423 )
      ( MAKE-4CRATE-VERIFY ?auto_206419 ?auto_206420 ?auto_206421 ?auto_206422 ?auto_206423 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206453 - SURFACE
      ?auto_206454 - SURFACE
      ?auto_206455 - SURFACE
      ?auto_206456 - SURFACE
      ?auto_206457 - SURFACE
    )
    :vars
    (
      ?auto_206461 - HOIST
      ?auto_206462 - PLACE
      ?auto_206459 - TRUCK
      ?auto_206460 - PLACE
      ?auto_206458 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_206461 ?auto_206462 ) ( SURFACE-AT ?auto_206456 ?auto_206462 ) ( CLEAR ?auto_206456 ) ( IS-CRATE ?auto_206457 ) ( not ( = ?auto_206456 ?auto_206457 ) ) ( AVAILABLE ?auto_206461 ) ( ON ?auto_206456 ?auto_206455 ) ( not ( = ?auto_206455 ?auto_206456 ) ) ( not ( = ?auto_206455 ?auto_206457 ) ) ( TRUCK-AT ?auto_206459 ?auto_206460 ) ( not ( = ?auto_206460 ?auto_206462 ) ) ( HOIST-AT ?auto_206458 ?auto_206460 ) ( LIFTING ?auto_206458 ?auto_206457 ) ( not ( = ?auto_206461 ?auto_206458 ) ) ( ON ?auto_206454 ?auto_206453 ) ( ON ?auto_206455 ?auto_206454 ) ( not ( = ?auto_206453 ?auto_206454 ) ) ( not ( = ?auto_206453 ?auto_206455 ) ) ( not ( = ?auto_206453 ?auto_206456 ) ) ( not ( = ?auto_206453 ?auto_206457 ) ) ( not ( = ?auto_206454 ?auto_206455 ) ) ( not ( = ?auto_206454 ?auto_206456 ) ) ( not ( = ?auto_206454 ?auto_206457 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206455 ?auto_206456 ?auto_206457 )
      ( MAKE-4CRATE-VERIFY ?auto_206453 ?auto_206454 ?auto_206455 ?auto_206456 ?auto_206457 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206491 - SURFACE
      ?auto_206492 - SURFACE
      ?auto_206493 - SURFACE
      ?auto_206494 - SURFACE
      ?auto_206495 - SURFACE
    )
    :vars
    (
      ?auto_206499 - HOIST
      ?auto_206497 - PLACE
      ?auto_206501 - TRUCK
      ?auto_206500 - PLACE
      ?auto_206496 - HOIST
      ?auto_206498 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_206499 ?auto_206497 ) ( SURFACE-AT ?auto_206494 ?auto_206497 ) ( CLEAR ?auto_206494 ) ( IS-CRATE ?auto_206495 ) ( not ( = ?auto_206494 ?auto_206495 ) ) ( AVAILABLE ?auto_206499 ) ( ON ?auto_206494 ?auto_206493 ) ( not ( = ?auto_206493 ?auto_206494 ) ) ( not ( = ?auto_206493 ?auto_206495 ) ) ( TRUCK-AT ?auto_206501 ?auto_206500 ) ( not ( = ?auto_206500 ?auto_206497 ) ) ( HOIST-AT ?auto_206496 ?auto_206500 ) ( not ( = ?auto_206499 ?auto_206496 ) ) ( AVAILABLE ?auto_206496 ) ( SURFACE-AT ?auto_206495 ?auto_206500 ) ( ON ?auto_206495 ?auto_206498 ) ( CLEAR ?auto_206495 ) ( not ( = ?auto_206494 ?auto_206498 ) ) ( not ( = ?auto_206495 ?auto_206498 ) ) ( not ( = ?auto_206493 ?auto_206498 ) ) ( ON ?auto_206492 ?auto_206491 ) ( ON ?auto_206493 ?auto_206492 ) ( not ( = ?auto_206491 ?auto_206492 ) ) ( not ( = ?auto_206491 ?auto_206493 ) ) ( not ( = ?auto_206491 ?auto_206494 ) ) ( not ( = ?auto_206491 ?auto_206495 ) ) ( not ( = ?auto_206491 ?auto_206498 ) ) ( not ( = ?auto_206492 ?auto_206493 ) ) ( not ( = ?auto_206492 ?auto_206494 ) ) ( not ( = ?auto_206492 ?auto_206495 ) ) ( not ( = ?auto_206492 ?auto_206498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206493 ?auto_206494 ?auto_206495 )
      ( MAKE-4CRATE-VERIFY ?auto_206491 ?auto_206492 ?auto_206493 ?auto_206494 ?auto_206495 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206530 - SURFACE
      ?auto_206531 - SURFACE
      ?auto_206532 - SURFACE
      ?auto_206533 - SURFACE
      ?auto_206534 - SURFACE
    )
    :vars
    (
      ?auto_206539 - HOIST
      ?auto_206535 - PLACE
      ?auto_206536 - PLACE
      ?auto_206540 - HOIST
      ?auto_206537 - SURFACE
      ?auto_206538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206539 ?auto_206535 ) ( SURFACE-AT ?auto_206533 ?auto_206535 ) ( CLEAR ?auto_206533 ) ( IS-CRATE ?auto_206534 ) ( not ( = ?auto_206533 ?auto_206534 ) ) ( AVAILABLE ?auto_206539 ) ( ON ?auto_206533 ?auto_206532 ) ( not ( = ?auto_206532 ?auto_206533 ) ) ( not ( = ?auto_206532 ?auto_206534 ) ) ( not ( = ?auto_206536 ?auto_206535 ) ) ( HOIST-AT ?auto_206540 ?auto_206536 ) ( not ( = ?auto_206539 ?auto_206540 ) ) ( AVAILABLE ?auto_206540 ) ( SURFACE-AT ?auto_206534 ?auto_206536 ) ( ON ?auto_206534 ?auto_206537 ) ( CLEAR ?auto_206534 ) ( not ( = ?auto_206533 ?auto_206537 ) ) ( not ( = ?auto_206534 ?auto_206537 ) ) ( not ( = ?auto_206532 ?auto_206537 ) ) ( TRUCK-AT ?auto_206538 ?auto_206535 ) ( ON ?auto_206531 ?auto_206530 ) ( ON ?auto_206532 ?auto_206531 ) ( not ( = ?auto_206530 ?auto_206531 ) ) ( not ( = ?auto_206530 ?auto_206532 ) ) ( not ( = ?auto_206530 ?auto_206533 ) ) ( not ( = ?auto_206530 ?auto_206534 ) ) ( not ( = ?auto_206530 ?auto_206537 ) ) ( not ( = ?auto_206531 ?auto_206532 ) ) ( not ( = ?auto_206531 ?auto_206533 ) ) ( not ( = ?auto_206531 ?auto_206534 ) ) ( not ( = ?auto_206531 ?auto_206537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206532 ?auto_206533 ?auto_206534 )
      ( MAKE-4CRATE-VERIFY ?auto_206530 ?auto_206531 ?auto_206532 ?auto_206533 ?auto_206534 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206569 - SURFACE
      ?auto_206570 - SURFACE
      ?auto_206571 - SURFACE
      ?auto_206572 - SURFACE
      ?auto_206573 - SURFACE
    )
    :vars
    (
      ?auto_206575 - HOIST
      ?auto_206577 - PLACE
      ?auto_206574 - PLACE
      ?auto_206579 - HOIST
      ?auto_206578 - SURFACE
      ?auto_206576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206575 ?auto_206577 ) ( IS-CRATE ?auto_206573 ) ( not ( = ?auto_206572 ?auto_206573 ) ) ( not ( = ?auto_206571 ?auto_206572 ) ) ( not ( = ?auto_206571 ?auto_206573 ) ) ( not ( = ?auto_206574 ?auto_206577 ) ) ( HOIST-AT ?auto_206579 ?auto_206574 ) ( not ( = ?auto_206575 ?auto_206579 ) ) ( AVAILABLE ?auto_206579 ) ( SURFACE-AT ?auto_206573 ?auto_206574 ) ( ON ?auto_206573 ?auto_206578 ) ( CLEAR ?auto_206573 ) ( not ( = ?auto_206572 ?auto_206578 ) ) ( not ( = ?auto_206573 ?auto_206578 ) ) ( not ( = ?auto_206571 ?auto_206578 ) ) ( TRUCK-AT ?auto_206576 ?auto_206577 ) ( SURFACE-AT ?auto_206571 ?auto_206577 ) ( CLEAR ?auto_206571 ) ( LIFTING ?auto_206575 ?auto_206572 ) ( IS-CRATE ?auto_206572 ) ( ON ?auto_206570 ?auto_206569 ) ( ON ?auto_206571 ?auto_206570 ) ( not ( = ?auto_206569 ?auto_206570 ) ) ( not ( = ?auto_206569 ?auto_206571 ) ) ( not ( = ?auto_206569 ?auto_206572 ) ) ( not ( = ?auto_206569 ?auto_206573 ) ) ( not ( = ?auto_206569 ?auto_206578 ) ) ( not ( = ?auto_206570 ?auto_206571 ) ) ( not ( = ?auto_206570 ?auto_206572 ) ) ( not ( = ?auto_206570 ?auto_206573 ) ) ( not ( = ?auto_206570 ?auto_206578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206571 ?auto_206572 ?auto_206573 )
      ( MAKE-4CRATE-VERIFY ?auto_206569 ?auto_206570 ?auto_206571 ?auto_206572 ?auto_206573 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206608 - SURFACE
      ?auto_206609 - SURFACE
      ?auto_206610 - SURFACE
      ?auto_206611 - SURFACE
      ?auto_206612 - SURFACE
    )
    :vars
    (
      ?auto_206614 - HOIST
      ?auto_206613 - PLACE
      ?auto_206617 - PLACE
      ?auto_206618 - HOIST
      ?auto_206615 - SURFACE
      ?auto_206616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206614 ?auto_206613 ) ( IS-CRATE ?auto_206612 ) ( not ( = ?auto_206611 ?auto_206612 ) ) ( not ( = ?auto_206610 ?auto_206611 ) ) ( not ( = ?auto_206610 ?auto_206612 ) ) ( not ( = ?auto_206617 ?auto_206613 ) ) ( HOIST-AT ?auto_206618 ?auto_206617 ) ( not ( = ?auto_206614 ?auto_206618 ) ) ( AVAILABLE ?auto_206618 ) ( SURFACE-AT ?auto_206612 ?auto_206617 ) ( ON ?auto_206612 ?auto_206615 ) ( CLEAR ?auto_206612 ) ( not ( = ?auto_206611 ?auto_206615 ) ) ( not ( = ?auto_206612 ?auto_206615 ) ) ( not ( = ?auto_206610 ?auto_206615 ) ) ( TRUCK-AT ?auto_206616 ?auto_206613 ) ( SURFACE-AT ?auto_206610 ?auto_206613 ) ( CLEAR ?auto_206610 ) ( IS-CRATE ?auto_206611 ) ( AVAILABLE ?auto_206614 ) ( IN ?auto_206611 ?auto_206616 ) ( ON ?auto_206609 ?auto_206608 ) ( ON ?auto_206610 ?auto_206609 ) ( not ( = ?auto_206608 ?auto_206609 ) ) ( not ( = ?auto_206608 ?auto_206610 ) ) ( not ( = ?auto_206608 ?auto_206611 ) ) ( not ( = ?auto_206608 ?auto_206612 ) ) ( not ( = ?auto_206608 ?auto_206615 ) ) ( not ( = ?auto_206609 ?auto_206610 ) ) ( not ( = ?auto_206609 ?auto_206611 ) ) ( not ( = ?auto_206609 ?auto_206612 ) ) ( not ( = ?auto_206609 ?auto_206615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206610 ?auto_206611 ?auto_206612 )
      ( MAKE-4CRATE-VERIFY ?auto_206608 ?auto_206609 ?auto_206610 ?auto_206611 ?auto_206612 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207268 - SURFACE
      ?auto_207269 - SURFACE
      ?auto_207270 - SURFACE
      ?auto_207271 - SURFACE
      ?auto_207272 - SURFACE
      ?auto_207273 - SURFACE
    )
    :vars
    (
      ?auto_207274 - HOIST
      ?auto_207275 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207274 ?auto_207275 ) ( SURFACE-AT ?auto_207272 ?auto_207275 ) ( CLEAR ?auto_207272 ) ( LIFTING ?auto_207274 ?auto_207273 ) ( IS-CRATE ?auto_207273 ) ( not ( = ?auto_207272 ?auto_207273 ) ) ( ON ?auto_207269 ?auto_207268 ) ( ON ?auto_207270 ?auto_207269 ) ( ON ?auto_207271 ?auto_207270 ) ( ON ?auto_207272 ?auto_207271 ) ( not ( = ?auto_207268 ?auto_207269 ) ) ( not ( = ?auto_207268 ?auto_207270 ) ) ( not ( = ?auto_207268 ?auto_207271 ) ) ( not ( = ?auto_207268 ?auto_207272 ) ) ( not ( = ?auto_207268 ?auto_207273 ) ) ( not ( = ?auto_207269 ?auto_207270 ) ) ( not ( = ?auto_207269 ?auto_207271 ) ) ( not ( = ?auto_207269 ?auto_207272 ) ) ( not ( = ?auto_207269 ?auto_207273 ) ) ( not ( = ?auto_207270 ?auto_207271 ) ) ( not ( = ?auto_207270 ?auto_207272 ) ) ( not ( = ?auto_207270 ?auto_207273 ) ) ( not ( = ?auto_207271 ?auto_207272 ) ) ( not ( = ?auto_207271 ?auto_207273 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_207272 ?auto_207273 )
      ( MAKE-5CRATE-VERIFY ?auto_207268 ?auto_207269 ?auto_207270 ?auto_207271 ?auto_207272 ?auto_207273 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207302 - SURFACE
      ?auto_207303 - SURFACE
      ?auto_207304 - SURFACE
      ?auto_207305 - SURFACE
      ?auto_207306 - SURFACE
      ?auto_207307 - SURFACE
    )
    :vars
    (
      ?auto_207309 - HOIST
      ?auto_207310 - PLACE
      ?auto_207308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207309 ?auto_207310 ) ( SURFACE-AT ?auto_207306 ?auto_207310 ) ( CLEAR ?auto_207306 ) ( IS-CRATE ?auto_207307 ) ( not ( = ?auto_207306 ?auto_207307 ) ) ( TRUCK-AT ?auto_207308 ?auto_207310 ) ( AVAILABLE ?auto_207309 ) ( IN ?auto_207307 ?auto_207308 ) ( ON ?auto_207306 ?auto_207305 ) ( not ( = ?auto_207305 ?auto_207306 ) ) ( not ( = ?auto_207305 ?auto_207307 ) ) ( ON ?auto_207303 ?auto_207302 ) ( ON ?auto_207304 ?auto_207303 ) ( ON ?auto_207305 ?auto_207304 ) ( not ( = ?auto_207302 ?auto_207303 ) ) ( not ( = ?auto_207302 ?auto_207304 ) ) ( not ( = ?auto_207302 ?auto_207305 ) ) ( not ( = ?auto_207302 ?auto_207306 ) ) ( not ( = ?auto_207302 ?auto_207307 ) ) ( not ( = ?auto_207303 ?auto_207304 ) ) ( not ( = ?auto_207303 ?auto_207305 ) ) ( not ( = ?auto_207303 ?auto_207306 ) ) ( not ( = ?auto_207303 ?auto_207307 ) ) ( not ( = ?auto_207304 ?auto_207305 ) ) ( not ( = ?auto_207304 ?auto_207306 ) ) ( not ( = ?auto_207304 ?auto_207307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207305 ?auto_207306 ?auto_207307 )
      ( MAKE-5CRATE-VERIFY ?auto_207302 ?auto_207303 ?auto_207304 ?auto_207305 ?auto_207306 ?auto_207307 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207342 - SURFACE
      ?auto_207343 - SURFACE
      ?auto_207344 - SURFACE
      ?auto_207345 - SURFACE
      ?auto_207346 - SURFACE
      ?auto_207347 - SURFACE
    )
    :vars
    (
      ?auto_207349 - HOIST
      ?auto_207348 - PLACE
      ?auto_207350 - TRUCK
      ?auto_207351 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207349 ?auto_207348 ) ( SURFACE-AT ?auto_207346 ?auto_207348 ) ( CLEAR ?auto_207346 ) ( IS-CRATE ?auto_207347 ) ( not ( = ?auto_207346 ?auto_207347 ) ) ( AVAILABLE ?auto_207349 ) ( IN ?auto_207347 ?auto_207350 ) ( ON ?auto_207346 ?auto_207345 ) ( not ( = ?auto_207345 ?auto_207346 ) ) ( not ( = ?auto_207345 ?auto_207347 ) ) ( TRUCK-AT ?auto_207350 ?auto_207351 ) ( not ( = ?auto_207351 ?auto_207348 ) ) ( ON ?auto_207343 ?auto_207342 ) ( ON ?auto_207344 ?auto_207343 ) ( ON ?auto_207345 ?auto_207344 ) ( not ( = ?auto_207342 ?auto_207343 ) ) ( not ( = ?auto_207342 ?auto_207344 ) ) ( not ( = ?auto_207342 ?auto_207345 ) ) ( not ( = ?auto_207342 ?auto_207346 ) ) ( not ( = ?auto_207342 ?auto_207347 ) ) ( not ( = ?auto_207343 ?auto_207344 ) ) ( not ( = ?auto_207343 ?auto_207345 ) ) ( not ( = ?auto_207343 ?auto_207346 ) ) ( not ( = ?auto_207343 ?auto_207347 ) ) ( not ( = ?auto_207344 ?auto_207345 ) ) ( not ( = ?auto_207344 ?auto_207346 ) ) ( not ( = ?auto_207344 ?auto_207347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207345 ?auto_207346 ?auto_207347 )
      ( MAKE-5CRATE-VERIFY ?auto_207342 ?auto_207343 ?auto_207344 ?auto_207345 ?auto_207346 ?auto_207347 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207387 - SURFACE
      ?auto_207388 - SURFACE
      ?auto_207389 - SURFACE
      ?auto_207390 - SURFACE
      ?auto_207391 - SURFACE
      ?auto_207392 - SURFACE
    )
    :vars
    (
      ?auto_207395 - HOIST
      ?auto_207396 - PLACE
      ?auto_207393 - TRUCK
      ?auto_207397 - PLACE
      ?auto_207394 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_207395 ?auto_207396 ) ( SURFACE-AT ?auto_207391 ?auto_207396 ) ( CLEAR ?auto_207391 ) ( IS-CRATE ?auto_207392 ) ( not ( = ?auto_207391 ?auto_207392 ) ) ( AVAILABLE ?auto_207395 ) ( ON ?auto_207391 ?auto_207390 ) ( not ( = ?auto_207390 ?auto_207391 ) ) ( not ( = ?auto_207390 ?auto_207392 ) ) ( TRUCK-AT ?auto_207393 ?auto_207397 ) ( not ( = ?auto_207397 ?auto_207396 ) ) ( HOIST-AT ?auto_207394 ?auto_207397 ) ( LIFTING ?auto_207394 ?auto_207392 ) ( not ( = ?auto_207395 ?auto_207394 ) ) ( ON ?auto_207388 ?auto_207387 ) ( ON ?auto_207389 ?auto_207388 ) ( ON ?auto_207390 ?auto_207389 ) ( not ( = ?auto_207387 ?auto_207388 ) ) ( not ( = ?auto_207387 ?auto_207389 ) ) ( not ( = ?auto_207387 ?auto_207390 ) ) ( not ( = ?auto_207387 ?auto_207391 ) ) ( not ( = ?auto_207387 ?auto_207392 ) ) ( not ( = ?auto_207388 ?auto_207389 ) ) ( not ( = ?auto_207388 ?auto_207390 ) ) ( not ( = ?auto_207388 ?auto_207391 ) ) ( not ( = ?auto_207388 ?auto_207392 ) ) ( not ( = ?auto_207389 ?auto_207390 ) ) ( not ( = ?auto_207389 ?auto_207391 ) ) ( not ( = ?auto_207389 ?auto_207392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207390 ?auto_207391 ?auto_207392 )
      ( MAKE-5CRATE-VERIFY ?auto_207387 ?auto_207388 ?auto_207389 ?auto_207390 ?auto_207391 ?auto_207392 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207437 - SURFACE
      ?auto_207438 - SURFACE
      ?auto_207439 - SURFACE
      ?auto_207440 - SURFACE
      ?auto_207441 - SURFACE
      ?auto_207442 - SURFACE
    )
    :vars
    (
      ?auto_207443 - HOIST
      ?auto_207447 - PLACE
      ?auto_207444 - TRUCK
      ?auto_207445 - PLACE
      ?auto_207446 - HOIST
      ?auto_207448 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207443 ?auto_207447 ) ( SURFACE-AT ?auto_207441 ?auto_207447 ) ( CLEAR ?auto_207441 ) ( IS-CRATE ?auto_207442 ) ( not ( = ?auto_207441 ?auto_207442 ) ) ( AVAILABLE ?auto_207443 ) ( ON ?auto_207441 ?auto_207440 ) ( not ( = ?auto_207440 ?auto_207441 ) ) ( not ( = ?auto_207440 ?auto_207442 ) ) ( TRUCK-AT ?auto_207444 ?auto_207445 ) ( not ( = ?auto_207445 ?auto_207447 ) ) ( HOIST-AT ?auto_207446 ?auto_207445 ) ( not ( = ?auto_207443 ?auto_207446 ) ) ( AVAILABLE ?auto_207446 ) ( SURFACE-AT ?auto_207442 ?auto_207445 ) ( ON ?auto_207442 ?auto_207448 ) ( CLEAR ?auto_207442 ) ( not ( = ?auto_207441 ?auto_207448 ) ) ( not ( = ?auto_207442 ?auto_207448 ) ) ( not ( = ?auto_207440 ?auto_207448 ) ) ( ON ?auto_207438 ?auto_207437 ) ( ON ?auto_207439 ?auto_207438 ) ( ON ?auto_207440 ?auto_207439 ) ( not ( = ?auto_207437 ?auto_207438 ) ) ( not ( = ?auto_207437 ?auto_207439 ) ) ( not ( = ?auto_207437 ?auto_207440 ) ) ( not ( = ?auto_207437 ?auto_207441 ) ) ( not ( = ?auto_207437 ?auto_207442 ) ) ( not ( = ?auto_207437 ?auto_207448 ) ) ( not ( = ?auto_207438 ?auto_207439 ) ) ( not ( = ?auto_207438 ?auto_207440 ) ) ( not ( = ?auto_207438 ?auto_207441 ) ) ( not ( = ?auto_207438 ?auto_207442 ) ) ( not ( = ?auto_207438 ?auto_207448 ) ) ( not ( = ?auto_207439 ?auto_207440 ) ) ( not ( = ?auto_207439 ?auto_207441 ) ) ( not ( = ?auto_207439 ?auto_207442 ) ) ( not ( = ?auto_207439 ?auto_207448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207440 ?auto_207441 ?auto_207442 )
      ( MAKE-5CRATE-VERIFY ?auto_207437 ?auto_207438 ?auto_207439 ?auto_207440 ?auto_207441 ?auto_207442 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207488 - SURFACE
      ?auto_207489 - SURFACE
      ?auto_207490 - SURFACE
      ?auto_207491 - SURFACE
      ?auto_207492 - SURFACE
      ?auto_207493 - SURFACE
    )
    :vars
    (
      ?auto_207495 - HOIST
      ?auto_207497 - PLACE
      ?auto_207496 - PLACE
      ?auto_207498 - HOIST
      ?auto_207499 - SURFACE
      ?auto_207494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207495 ?auto_207497 ) ( SURFACE-AT ?auto_207492 ?auto_207497 ) ( CLEAR ?auto_207492 ) ( IS-CRATE ?auto_207493 ) ( not ( = ?auto_207492 ?auto_207493 ) ) ( AVAILABLE ?auto_207495 ) ( ON ?auto_207492 ?auto_207491 ) ( not ( = ?auto_207491 ?auto_207492 ) ) ( not ( = ?auto_207491 ?auto_207493 ) ) ( not ( = ?auto_207496 ?auto_207497 ) ) ( HOIST-AT ?auto_207498 ?auto_207496 ) ( not ( = ?auto_207495 ?auto_207498 ) ) ( AVAILABLE ?auto_207498 ) ( SURFACE-AT ?auto_207493 ?auto_207496 ) ( ON ?auto_207493 ?auto_207499 ) ( CLEAR ?auto_207493 ) ( not ( = ?auto_207492 ?auto_207499 ) ) ( not ( = ?auto_207493 ?auto_207499 ) ) ( not ( = ?auto_207491 ?auto_207499 ) ) ( TRUCK-AT ?auto_207494 ?auto_207497 ) ( ON ?auto_207489 ?auto_207488 ) ( ON ?auto_207490 ?auto_207489 ) ( ON ?auto_207491 ?auto_207490 ) ( not ( = ?auto_207488 ?auto_207489 ) ) ( not ( = ?auto_207488 ?auto_207490 ) ) ( not ( = ?auto_207488 ?auto_207491 ) ) ( not ( = ?auto_207488 ?auto_207492 ) ) ( not ( = ?auto_207488 ?auto_207493 ) ) ( not ( = ?auto_207488 ?auto_207499 ) ) ( not ( = ?auto_207489 ?auto_207490 ) ) ( not ( = ?auto_207489 ?auto_207491 ) ) ( not ( = ?auto_207489 ?auto_207492 ) ) ( not ( = ?auto_207489 ?auto_207493 ) ) ( not ( = ?auto_207489 ?auto_207499 ) ) ( not ( = ?auto_207490 ?auto_207491 ) ) ( not ( = ?auto_207490 ?auto_207492 ) ) ( not ( = ?auto_207490 ?auto_207493 ) ) ( not ( = ?auto_207490 ?auto_207499 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207491 ?auto_207492 ?auto_207493 )
      ( MAKE-5CRATE-VERIFY ?auto_207488 ?auto_207489 ?auto_207490 ?auto_207491 ?auto_207492 ?auto_207493 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207539 - SURFACE
      ?auto_207540 - SURFACE
      ?auto_207541 - SURFACE
      ?auto_207542 - SURFACE
      ?auto_207543 - SURFACE
      ?auto_207544 - SURFACE
    )
    :vars
    (
      ?auto_207549 - HOIST
      ?auto_207546 - PLACE
      ?auto_207547 - PLACE
      ?auto_207548 - HOIST
      ?auto_207545 - SURFACE
      ?auto_207550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207549 ?auto_207546 ) ( IS-CRATE ?auto_207544 ) ( not ( = ?auto_207543 ?auto_207544 ) ) ( not ( = ?auto_207542 ?auto_207543 ) ) ( not ( = ?auto_207542 ?auto_207544 ) ) ( not ( = ?auto_207547 ?auto_207546 ) ) ( HOIST-AT ?auto_207548 ?auto_207547 ) ( not ( = ?auto_207549 ?auto_207548 ) ) ( AVAILABLE ?auto_207548 ) ( SURFACE-AT ?auto_207544 ?auto_207547 ) ( ON ?auto_207544 ?auto_207545 ) ( CLEAR ?auto_207544 ) ( not ( = ?auto_207543 ?auto_207545 ) ) ( not ( = ?auto_207544 ?auto_207545 ) ) ( not ( = ?auto_207542 ?auto_207545 ) ) ( TRUCK-AT ?auto_207550 ?auto_207546 ) ( SURFACE-AT ?auto_207542 ?auto_207546 ) ( CLEAR ?auto_207542 ) ( LIFTING ?auto_207549 ?auto_207543 ) ( IS-CRATE ?auto_207543 ) ( ON ?auto_207540 ?auto_207539 ) ( ON ?auto_207541 ?auto_207540 ) ( ON ?auto_207542 ?auto_207541 ) ( not ( = ?auto_207539 ?auto_207540 ) ) ( not ( = ?auto_207539 ?auto_207541 ) ) ( not ( = ?auto_207539 ?auto_207542 ) ) ( not ( = ?auto_207539 ?auto_207543 ) ) ( not ( = ?auto_207539 ?auto_207544 ) ) ( not ( = ?auto_207539 ?auto_207545 ) ) ( not ( = ?auto_207540 ?auto_207541 ) ) ( not ( = ?auto_207540 ?auto_207542 ) ) ( not ( = ?auto_207540 ?auto_207543 ) ) ( not ( = ?auto_207540 ?auto_207544 ) ) ( not ( = ?auto_207540 ?auto_207545 ) ) ( not ( = ?auto_207541 ?auto_207542 ) ) ( not ( = ?auto_207541 ?auto_207543 ) ) ( not ( = ?auto_207541 ?auto_207544 ) ) ( not ( = ?auto_207541 ?auto_207545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207542 ?auto_207543 ?auto_207544 )
      ( MAKE-5CRATE-VERIFY ?auto_207539 ?auto_207540 ?auto_207541 ?auto_207542 ?auto_207543 ?auto_207544 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207590 - SURFACE
      ?auto_207591 - SURFACE
      ?auto_207592 - SURFACE
      ?auto_207593 - SURFACE
      ?auto_207594 - SURFACE
      ?auto_207595 - SURFACE
    )
    :vars
    (
      ?auto_207600 - HOIST
      ?auto_207598 - PLACE
      ?auto_207601 - PLACE
      ?auto_207596 - HOIST
      ?auto_207597 - SURFACE
      ?auto_207599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207600 ?auto_207598 ) ( IS-CRATE ?auto_207595 ) ( not ( = ?auto_207594 ?auto_207595 ) ) ( not ( = ?auto_207593 ?auto_207594 ) ) ( not ( = ?auto_207593 ?auto_207595 ) ) ( not ( = ?auto_207601 ?auto_207598 ) ) ( HOIST-AT ?auto_207596 ?auto_207601 ) ( not ( = ?auto_207600 ?auto_207596 ) ) ( AVAILABLE ?auto_207596 ) ( SURFACE-AT ?auto_207595 ?auto_207601 ) ( ON ?auto_207595 ?auto_207597 ) ( CLEAR ?auto_207595 ) ( not ( = ?auto_207594 ?auto_207597 ) ) ( not ( = ?auto_207595 ?auto_207597 ) ) ( not ( = ?auto_207593 ?auto_207597 ) ) ( TRUCK-AT ?auto_207599 ?auto_207598 ) ( SURFACE-AT ?auto_207593 ?auto_207598 ) ( CLEAR ?auto_207593 ) ( IS-CRATE ?auto_207594 ) ( AVAILABLE ?auto_207600 ) ( IN ?auto_207594 ?auto_207599 ) ( ON ?auto_207591 ?auto_207590 ) ( ON ?auto_207592 ?auto_207591 ) ( ON ?auto_207593 ?auto_207592 ) ( not ( = ?auto_207590 ?auto_207591 ) ) ( not ( = ?auto_207590 ?auto_207592 ) ) ( not ( = ?auto_207590 ?auto_207593 ) ) ( not ( = ?auto_207590 ?auto_207594 ) ) ( not ( = ?auto_207590 ?auto_207595 ) ) ( not ( = ?auto_207590 ?auto_207597 ) ) ( not ( = ?auto_207591 ?auto_207592 ) ) ( not ( = ?auto_207591 ?auto_207593 ) ) ( not ( = ?auto_207591 ?auto_207594 ) ) ( not ( = ?auto_207591 ?auto_207595 ) ) ( not ( = ?auto_207591 ?auto_207597 ) ) ( not ( = ?auto_207592 ?auto_207593 ) ) ( not ( = ?auto_207592 ?auto_207594 ) ) ( not ( = ?auto_207592 ?auto_207595 ) ) ( not ( = ?auto_207592 ?auto_207597 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207593 ?auto_207594 ?auto_207595 )
      ( MAKE-5CRATE-VERIFY ?auto_207590 ?auto_207591 ?auto_207592 ?auto_207593 ?auto_207594 ?auto_207595 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_207958 - SURFACE
      ?auto_207959 - SURFACE
    )
    :vars
    (
      ?auto_207963 - HOIST
      ?auto_207966 - PLACE
      ?auto_207964 - SURFACE
      ?auto_207960 - TRUCK
      ?auto_207965 - PLACE
      ?auto_207961 - HOIST
      ?auto_207962 - SURFACE
      ?auto_207967 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207963 ?auto_207966 ) ( SURFACE-AT ?auto_207958 ?auto_207966 ) ( CLEAR ?auto_207958 ) ( IS-CRATE ?auto_207959 ) ( not ( = ?auto_207958 ?auto_207959 ) ) ( AVAILABLE ?auto_207963 ) ( ON ?auto_207958 ?auto_207964 ) ( not ( = ?auto_207964 ?auto_207958 ) ) ( not ( = ?auto_207964 ?auto_207959 ) ) ( TRUCK-AT ?auto_207960 ?auto_207965 ) ( not ( = ?auto_207965 ?auto_207966 ) ) ( HOIST-AT ?auto_207961 ?auto_207965 ) ( not ( = ?auto_207963 ?auto_207961 ) ) ( SURFACE-AT ?auto_207959 ?auto_207965 ) ( ON ?auto_207959 ?auto_207962 ) ( CLEAR ?auto_207959 ) ( not ( = ?auto_207958 ?auto_207962 ) ) ( not ( = ?auto_207959 ?auto_207962 ) ) ( not ( = ?auto_207964 ?auto_207962 ) ) ( LIFTING ?auto_207961 ?auto_207967 ) ( IS-CRATE ?auto_207967 ) ( not ( = ?auto_207958 ?auto_207967 ) ) ( not ( = ?auto_207959 ?auto_207967 ) ) ( not ( = ?auto_207964 ?auto_207967 ) ) ( not ( = ?auto_207962 ?auto_207967 ) ) )
    :subtasks
    ( ( !LOAD ?auto_207961 ?auto_207967 ?auto_207960 ?auto_207965 )
      ( MAKE-1CRATE ?auto_207958 ?auto_207959 )
      ( MAKE-1CRATE-VERIFY ?auto_207958 ?auto_207959 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_208795 - SURFACE
      ?auto_208796 - SURFACE
      ?auto_208797 - SURFACE
      ?auto_208798 - SURFACE
      ?auto_208799 - SURFACE
      ?auto_208800 - SURFACE
      ?auto_208801 - SURFACE
    )
    :vars
    (
      ?auto_208802 - HOIST
      ?auto_208803 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_208802 ?auto_208803 ) ( SURFACE-AT ?auto_208800 ?auto_208803 ) ( CLEAR ?auto_208800 ) ( LIFTING ?auto_208802 ?auto_208801 ) ( IS-CRATE ?auto_208801 ) ( not ( = ?auto_208800 ?auto_208801 ) ) ( ON ?auto_208796 ?auto_208795 ) ( ON ?auto_208797 ?auto_208796 ) ( ON ?auto_208798 ?auto_208797 ) ( ON ?auto_208799 ?auto_208798 ) ( ON ?auto_208800 ?auto_208799 ) ( not ( = ?auto_208795 ?auto_208796 ) ) ( not ( = ?auto_208795 ?auto_208797 ) ) ( not ( = ?auto_208795 ?auto_208798 ) ) ( not ( = ?auto_208795 ?auto_208799 ) ) ( not ( = ?auto_208795 ?auto_208800 ) ) ( not ( = ?auto_208795 ?auto_208801 ) ) ( not ( = ?auto_208796 ?auto_208797 ) ) ( not ( = ?auto_208796 ?auto_208798 ) ) ( not ( = ?auto_208796 ?auto_208799 ) ) ( not ( = ?auto_208796 ?auto_208800 ) ) ( not ( = ?auto_208796 ?auto_208801 ) ) ( not ( = ?auto_208797 ?auto_208798 ) ) ( not ( = ?auto_208797 ?auto_208799 ) ) ( not ( = ?auto_208797 ?auto_208800 ) ) ( not ( = ?auto_208797 ?auto_208801 ) ) ( not ( = ?auto_208798 ?auto_208799 ) ) ( not ( = ?auto_208798 ?auto_208800 ) ) ( not ( = ?auto_208798 ?auto_208801 ) ) ( not ( = ?auto_208799 ?auto_208800 ) ) ( not ( = ?auto_208799 ?auto_208801 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_208800 ?auto_208801 )
      ( MAKE-6CRATE-VERIFY ?auto_208795 ?auto_208796 ?auto_208797 ?auto_208798 ?auto_208799 ?auto_208800 ?auto_208801 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_208839 - SURFACE
      ?auto_208840 - SURFACE
      ?auto_208841 - SURFACE
      ?auto_208842 - SURFACE
      ?auto_208843 - SURFACE
      ?auto_208844 - SURFACE
      ?auto_208845 - SURFACE
    )
    :vars
    (
      ?auto_208848 - HOIST
      ?auto_208846 - PLACE
      ?auto_208847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_208848 ?auto_208846 ) ( SURFACE-AT ?auto_208844 ?auto_208846 ) ( CLEAR ?auto_208844 ) ( IS-CRATE ?auto_208845 ) ( not ( = ?auto_208844 ?auto_208845 ) ) ( TRUCK-AT ?auto_208847 ?auto_208846 ) ( AVAILABLE ?auto_208848 ) ( IN ?auto_208845 ?auto_208847 ) ( ON ?auto_208844 ?auto_208843 ) ( not ( = ?auto_208843 ?auto_208844 ) ) ( not ( = ?auto_208843 ?auto_208845 ) ) ( ON ?auto_208840 ?auto_208839 ) ( ON ?auto_208841 ?auto_208840 ) ( ON ?auto_208842 ?auto_208841 ) ( ON ?auto_208843 ?auto_208842 ) ( not ( = ?auto_208839 ?auto_208840 ) ) ( not ( = ?auto_208839 ?auto_208841 ) ) ( not ( = ?auto_208839 ?auto_208842 ) ) ( not ( = ?auto_208839 ?auto_208843 ) ) ( not ( = ?auto_208839 ?auto_208844 ) ) ( not ( = ?auto_208839 ?auto_208845 ) ) ( not ( = ?auto_208840 ?auto_208841 ) ) ( not ( = ?auto_208840 ?auto_208842 ) ) ( not ( = ?auto_208840 ?auto_208843 ) ) ( not ( = ?auto_208840 ?auto_208844 ) ) ( not ( = ?auto_208840 ?auto_208845 ) ) ( not ( = ?auto_208841 ?auto_208842 ) ) ( not ( = ?auto_208841 ?auto_208843 ) ) ( not ( = ?auto_208841 ?auto_208844 ) ) ( not ( = ?auto_208841 ?auto_208845 ) ) ( not ( = ?auto_208842 ?auto_208843 ) ) ( not ( = ?auto_208842 ?auto_208844 ) ) ( not ( = ?auto_208842 ?auto_208845 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_208843 ?auto_208844 ?auto_208845 )
      ( MAKE-6CRATE-VERIFY ?auto_208839 ?auto_208840 ?auto_208841 ?auto_208842 ?auto_208843 ?auto_208844 ?auto_208845 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_208890 - SURFACE
      ?auto_208891 - SURFACE
      ?auto_208892 - SURFACE
      ?auto_208893 - SURFACE
      ?auto_208894 - SURFACE
      ?auto_208895 - SURFACE
      ?auto_208896 - SURFACE
    )
    :vars
    (
      ?auto_208898 - HOIST
      ?auto_208899 - PLACE
      ?auto_208900 - TRUCK
      ?auto_208897 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_208898 ?auto_208899 ) ( SURFACE-AT ?auto_208895 ?auto_208899 ) ( CLEAR ?auto_208895 ) ( IS-CRATE ?auto_208896 ) ( not ( = ?auto_208895 ?auto_208896 ) ) ( AVAILABLE ?auto_208898 ) ( IN ?auto_208896 ?auto_208900 ) ( ON ?auto_208895 ?auto_208894 ) ( not ( = ?auto_208894 ?auto_208895 ) ) ( not ( = ?auto_208894 ?auto_208896 ) ) ( TRUCK-AT ?auto_208900 ?auto_208897 ) ( not ( = ?auto_208897 ?auto_208899 ) ) ( ON ?auto_208891 ?auto_208890 ) ( ON ?auto_208892 ?auto_208891 ) ( ON ?auto_208893 ?auto_208892 ) ( ON ?auto_208894 ?auto_208893 ) ( not ( = ?auto_208890 ?auto_208891 ) ) ( not ( = ?auto_208890 ?auto_208892 ) ) ( not ( = ?auto_208890 ?auto_208893 ) ) ( not ( = ?auto_208890 ?auto_208894 ) ) ( not ( = ?auto_208890 ?auto_208895 ) ) ( not ( = ?auto_208890 ?auto_208896 ) ) ( not ( = ?auto_208891 ?auto_208892 ) ) ( not ( = ?auto_208891 ?auto_208893 ) ) ( not ( = ?auto_208891 ?auto_208894 ) ) ( not ( = ?auto_208891 ?auto_208895 ) ) ( not ( = ?auto_208891 ?auto_208896 ) ) ( not ( = ?auto_208892 ?auto_208893 ) ) ( not ( = ?auto_208892 ?auto_208894 ) ) ( not ( = ?auto_208892 ?auto_208895 ) ) ( not ( = ?auto_208892 ?auto_208896 ) ) ( not ( = ?auto_208893 ?auto_208894 ) ) ( not ( = ?auto_208893 ?auto_208895 ) ) ( not ( = ?auto_208893 ?auto_208896 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_208894 ?auto_208895 ?auto_208896 )
      ( MAKE-6CRATE-VERIFY ?auto_208890 ?auto_208891 ?auto_208892 ?auto_208893 ?auto_208894 ?auto_208895 ?auto_208896 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_208947 - SURFACE
      ?auto_208948 - SURFACE
      ?auto_208949 - SURFACE
      ?auto_208950 - SURFACE
      ?auto_208951 - SURFACE
      ?auto_208952 - SURFACE
      ?auto_208953 - SURFACE
    )
    :vars
    (
      ?auto_208958 - HOIST
      ?auto_208957 - PLACE
      ?auto_208955 - TRUCK
      ?auto_208954 - PLACE
      ?auto_208956 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_208958 ?auto_208957 ) ( SURFACE-AT ?auto_208952 ?auto_208957 ) ( CLEAR ?auto_208952 ) ( IS-CRATE ?auto_208953 ) ( not ( = ?auto_208952 ?auto_208953 ) ) ( AVAILABLE ?auto_208958 ) ( ON ?auto_208952 ?auto_208951 ) ( not ( = ?auto_208951 ?auto_208952 ) ) ( not ( = ?auto_208951 ?auto_208953 ) ) ( TRUCK-AT ?auto_208955 ?auto_208954 ) ( not ( = ?auto_208954 ?auto_208957 ) ) ( HOIST-AT ?auto_208956 ?auto_208954 ) ( LIFTING ?auto_208956 ?auto_208953 ) ( not ( = ?auto_208958 ?auto_208956 ) ) ( ON ?auto_208948 ?auto_208947 ) ( ON ?auto_208949 ?auto_208948 ) ( ON ?auto_208950 ?auto_208949 ) ( ON ?auto_208951 ?auto_208950 ) ( not ( = ?auto_208947 ?auto_208948 ) ) ( not ( = ?auto_208947 ?auto_208949 ) ) ( not ( = ?auto_208947 ?auto_208950 ) ) ( not ( = ?auto_208947 ?auto_208951 ) ) ( not ( = ?auto_208947 ?auto_208952 ) ) ( not ( = ?auto_208947 ?auto_208953 ) ) ( not ( = ?auto_208948 ?auto_208949 ) ) ( not ( = ?auto_208948 ?auto_208950 ) ) ( not ( = ?auto_208948 ?auto_208951 ) ) ( not ( = ?auto_208948 ?auto_208952 ) ) ( not ( = ?auto_208948 ?auto_208953 ) ) ( not ( = ?auto_208949 ?auto_208950 ) ) ( not ( = ?auto_208949 ?auto_208951 ) ) ( not ( = ?auto_208949 ?auto_208952 ) ) ( not ( = ?auto_208949 ?auto_208953 ) ) ( not ( = ?auto_208950 ?auto_208951 ) ) ( not ( = ?auto_208950 ?auto_208952 ) ) ( not ( = ?auto_208950 ?auto_208953 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_208951 ?auto_208952 ?auto_208953 )
      ( MAKE-6CRATE-VERIFY ?auto_208947 ?auto_208948 ?auto_208949 ?auto_208950 ?auto_208951 ?auto_208952 ?auto_208953 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_209010 - SURFACE
      ?auto_209011 - SURFACE
      ?auto_209012 - SURFACE
      ?auto_209013 - SURFACE
      ?auto_209014 - SURFACE
      ?auto_209015 - SURFACE
      ?auto_209016 - SURFACE
    )
    :vars
    (
      ?auto_209020 - HOIST
      ?auto_209019 - PLACE
      ?auto_209022 - TRUCK
      ?auto_209018 - PLACE
      ?auto_209021 - HOIST
      ?auto_209017 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_209020 ?auto_209019 ) ( SURFACE-AT ?auto_209015 ?auto_209019 ) ( CLEAR ?auto_209015 ) ( IS-CRATE ?auto_209016 ) ( not ( = ?auto_209015 ?auto_209016 ) ) ( AVAILABLE ?auto_209020 ) ( ON ?auto_209015 ?auto_209014 ) ( not ( = ?auto_209014 ?auto_209015 ) ) ( not ( = ?auto_209014 ?auto_209016 ) ) ( TRUCK-AT ?auto_209022 ?auto_209018 ) ( not ( = ?auto_209018 ?auto_209019 ) ) ( HOIST-AT ?auto_209021 ?auto_209018 ) ( not ( = ?auto_209020 ?auto_209021 ) ) ( AVAILABLE ?auto_209021 ) ( SURFACE-AT ?auto_209016 ?auto_209018 ) ( ON ?auto_209016 ?auto_209017 ) ( CLEAR ?auto_209016 ) ( not ( = ?auto_209015 ?auto_209017 ) ) ( not ( = ?auto_209016 ?auto_209017 ) ) ( not ( = ?auto_209014 ?auto_209017 ) ) ( ON ?auto_209011 ?auto_209010 ) ( ON ?auto_209012 ?auto_209011 ) ( ON ?auto_209013 ?auto_209012 ) ( ON ?auto_209014 ?auto_209013 ) ( not ( = ?auto_209010 ?auto_209011 ) ) ( not ( = ?auto_209010 ?auto_209012 ) ) ( not ( = ?auto_209010 ?auto_209013 ) ) ( not ( = ?auto_209010 ?auto_209014 ) ) ( not ( = ?auto_209010 ?auto_209015 ) ) ( not ( = ?auto_209010 ?auto_209016 ) ) ( not ( = ?auto_209010 ?auto_209017 ) ) ( not ( = ?auto_209011 ?auto_209012 ) ) ( not ( = ?auto_209011 ?auto_209013 ) ) ( not ( = ?auto_209011 ?auto_209014 ) ) ( not ( = ?auto_209011 ?auto_209015 ) ) ( not ( = ?auto_209011 ?auto_209016 ) ) ( not ( = ?auto_209011 ?auto_209017 ) ) ( not ( = ?auto_209012 ?auto_209013 ) ) ( not ( = ?auto_209012 ?auto_209014 ) ) ( not ( = ?auto_209012 ?auto_209015 ) ) ( not ( = ?auto_209012 ?auto_209016 ) ) ( not ( = ?auto_209012 ?auto_209017 ) ) ( not ( = ?auto_209013 ?auto_209014 ) ) ( not ( = ?auto_209013 ?auto_209015 ) ) ( not ( = ?auto_209013 ?auto_209016 ) ) ( not ( = ?auto_209013 ?auto_209017 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209014 ?auto_209015 ?auto_209016 )
      ( MAKE-6CRATE-VERIFY ?auto_209010 ?auto_209011 ?auto_209012 ?auto_209013 ?auto_209014 ?auto_209015 ?auto_209016 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_209074 - SURFACE
      ?auto_209075 - SURFACE
      ?auto_209076 - SURFACE
      ?auto_209077 - SURFACE
      ?auto_209078 - SURFACE
      ?auto_209079 - SURFACE
      ?auto_209080 - SURFACE
    )
    :vars
    (
      ?auto_209085 - HOIST
      ?auto_209084 - PLACE
      ?auto_209081 - PLACE
      ?auto_209083 - HOIST
      ?auto_209086 - SURFACE
      ?auto_209082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209085 ?auto_209084 ) ( SURFACE-AT ?auto_209079 ?auto_209084 ) ( CLEAR ?auto_209079 ) ( IS-CRATE ?auto_209080 ) ( not ( = ?auto_209079 ?auto_209080 ) ) ( AVAILABLE ?auto_209085 ) ( ON ?auto_209079 ?auto_209078 ) ( not ( = ?auto_209078 ?auto_209079 ) ) ( not ( = ?auto_209078 ?auto_209080 ) ) ( not ( = ?auto_209081 ?auto_209084 ) ) ( HOIST-AT ?auto_209083 ?auto_209081 ) ( not ( = ?auto_209085 ?auto_209083 ) ) ( AVAILABLE ?auto_209083 ) ( SURFACE-AT ?auto_209080 ?auto_209081 ) ( ON ?auto_209080 ?auto_209086 ) ( CLEAR ?auto_209080 ) ( not ( = ?auto_209079 ?auto_209086 ) ) ( not ( = ?auto_209080 ?auto_209086 ) ) ( not ( = ?auto_209078 ?auto_209086 ) ) ( TRUCK-AT ?auto_209082 ?auto_209084 ) ( ON ?auto_209075 ?auto_209074 ) ( ON ?auto_209076 ?auto_209075 ) ( ON ?auto_209077 ?auto_209076 ) ( ON ?auto_209078 ?auto_209077 ) ( not ( = ?auto_209074 ?auto_209075 ) ) ( not ( = ?auto_209074 ?auto_209076 ) ) ( not ( = ?auto_209074 ?auto_209077 ) ) ( not ( = ?auto_209074 ?auto_209078 ) ) ( not ( = ?auto_209074 ?auto_209079 ) ) ( not ( = ?auto_209074 ?auto_209080 ) ) ( not ( = ?auto_209074 ?auto_209086 ) ) ( not ( = ?auto_209075 ?auto_209076 ) ) ( not ( = ?auto_209075 ?auto_209077 ) ) ( not ( = ?auto_209075 ?auto_209078 ) ) ( not ( = ?auto_209075 ?auto_209079 ) ) ( not ( = ?auto_209075 ?auto_209080 ) ) ( not ( = ?auto_209075 ?auto_209086 ) ) ( not ( = ?auto_209076 ?auto_209077 ) ) ( not ( = ?auto_209076 ?auto_209078 ) ) ( not ( = ?auto_209076 ?auto_209079 ) ) ( not ( = ?auto_209076 ?auto_209080 ) ) ( not ( = ?auto_209076 ?auto_209086 ) ) ( not ( = ?auto_209077 ?auto_209078 ) ) ( not ( = ?auto_209077 ?auto_209079 ) ) ( not ( = ?auto_209077 ?auto_209080 ) ) ( not ( = ?auto_209077 ?auto_209086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209078 ?auto_209079 ?auto_209080 )
      ( MAKE-6CRATE-VERIFY ?auto_209074 ?auto_209075 ?auto_209076 ?auto_209077 ?auto_209078 ?auto_209079 ?auto_209080 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_209138 - SURFACE
      ?auto_209139 - SURFACE
      ?auto_209140 - SURFACE
      ?auto_209141 - SURFACE
      ?auto_209142 - SURFACE
      ?auto_209143 - SURFACE
      ?auto_209144 - SURFACE
    )
    :vars
    (
      ?auto_209148 - HOIST
      ?auto_209146 - PLACE
      ?auto_209147 - PLACE
      ?auto_209150 - HOIST
      ?auto_209149 - SURFACE
      ?auto_209145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209148 ?auto_209146 ) ( IS-CRATE ?auto_209144 ) ( not ( = ?auto_209143 ?auto_209144 ) ) ( not ( = ?auto_209142 ?auto_209143 ) ) ( not ( = ?auto_209142 ?auto_209144 ) ) ( not ( = ?auto_209147 ?auto_209146 ) ) ( HOIST-AT ?auto_209150 ?auto_209147 ) ( not ( = ?auto_209148 ?auto_209150 ) ) ( AVAILABLE ?auto_209150 ) ( SURFACE-AT ?auto_209144 ?auto_209147 ) ( ON ?auto_209144 ?auto_209149 ) ( CLEAR ?auto_209144 ) ( not ( = ?auto_209143 ?auto_209149 ) ) ( not ( = ?auto_209144 ?auto_209149 ) ) ( not ( = ?auto_209142 ?auto_209149 ) ) ( TRUCK-AT ?auto_209145 ?auto_209146 ) ( SURFACE-AT ?auto_209142 ?auto_209146 ) ( CLEAR ?auto_209142 ) ( LIFTING ?auto_209148 ?auto_209143 ) ( IS-CRATE ?auto_209143 ) ( ON ?auto_209139 ?auto_209138 ) ( ON ?auto_209140 ?auto_209139 ) ( ON ?auto_209141 ?auto_209140 ) ( ON ?auto_209142 ?auto_209141 ) ( not ( = ?auto_209138 ?auto_209139 ) ) ( not ( = ?auto_209138 ?auto_209140 ) ) ( not ( = ?auto_209138 ?auto_209141 ) ) ( not ( = ?auto_209138 ?auto_209142 ) ) ( not ( = ?auto_209138 ?auto_209143 ) ) ( not ( = ?auto_209138 ?auto_209144 ) ) ( not ( = ?auto_209138 ?auto_209149 ) ) ( not ( = ?auto_209139 ?auto_209140 ) ) ( not ( = ?auto_209139 ?auto_209141 ) ) ( not ( = ?auto_209139 ?auto_209142 ) ) ( not ( = ?auto_209139 ?auto_209143 ) ) ( not ( = ?auto_209139 ?auto_209144 ) ) ( not ( = ?auto_209139 ?auto_209149 ) ) ( not ( = ?auto_209140 ?auto_209141 ) ) ( not ( = ?auto_209140 ?auto_209142 ) ) ( not ( = ?auto_209140 ?auto_209143 ) ) ( not ( = ?auto_209140 ?auto_209144 ) ) ( not ( = ?auto_209140 ?auto_209149 ) ) ( not ( = ?auto_209141 ?auto_209142 ) ) ( not ( = ?auto_209141 ?auto_209143 ) ) ( not ( = ?auto_209141 ?auto_209144 ) ) ( not ( = ?auto_209141 ?auto_209149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209142 ?auto_209143 ?auto_209144 )
      ( MAKE-6CRATE-VERIFY ?auto_209138 ?auto_209139 ?auto_209140 ?auto_209141 ?auto_209142 ?auto_209143 ?auto_209144 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_209202 - SURFACE
      ?auto_209203 - SURFACE
      ?auto_209204 - SURFACE
      ?auto_209205 - SURFACE
      ?auto_209206 - SURFACE
      ?auto_209207 - SURFACE
      ?auto_209208 - SURFACE
    )
    :vars
    (
      ?auto_209211 - HOIST
      ?auto_209210 - PLACE
      ?auto_209213 - PLACE
      ?auto_209212 - HOIST
      ?auto_209214 - SURFACE
      ?auto_209209 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209211 ?auto_209210 ) ( IS-CRATE ?auto_209208 ) ( not ( = ?auto_209207 ?auto_209208 ) ) ( not ( = ?auto_209206 ?auto_209207 ) ) ( not ( = ?auto_209206 ?auto_209208 ) ) ( not ( = ?auto_209213 ?auto_209210 ) ) ( HOIST-AT ?auto_209212 ?auto_209213 ) ( not ( = ?auto_209211 ?auto_209212 ) ) ( AVAILABLE ?auto_209212 ) ( SURFACE-AT ?auto_209208 ?auto_209213 ) ( ON ?auto_209208 ?auto_209214 ) ( CLEAR ?auto_209208 ) ( not ( = ?auto_209207 ?auto_209214 ) ) ( not ( = ?auto_209208 ?auto_209214 ) ) ( not ( = ?auto_209206 ?auto_209214 ) ) ( TRUCK-AT ?auto_209209 ?auto_209210 ) ( SURFACE-AT ?auto_209206 ?auto_209210 ) ( CLEAR ?auto_209206 ) ( IS-CRATE ?auto_209207 ) ( AVAILABLE ?auto_209211 ) ( IN ?auto_209207 ?auto_209209 ) ( ON ?auto_209203 ?auto_209202 ) ( ON ?auto_209204 ?auto_209203 ) ( ON ?auto_209205 ?auto_209204 ) ( ON ?auto_209206 ?auto_209205 ) ( not ( = ?auto_209202 ?auto_209203 ) ) ( not ( = ?auto_209202 ?auto_209204 ) ) ( not ( = ?auto_209202 ?auto_209205 ) ) ( not ( = ?auto_209202 ?auto_209206 ) ) ( not ( = ?auto_209202 ?auto_209207 ) ) ( not ( = ?auto_209202 ?auto_209208 ) ) ( not ( = ?auto_209202 ?auto_209214 ) ) ( not ( = ?auto_209203 ?auto_209204 ) ) ( not ( = ?auto_209203 ?auto_209205 ) ) ( not ( = ?auto_209203 ?auto_209206 ) ) ( not ( = ?auto_209203 ?auto_209207 ) ) ( not ( = ?auto_209203 ?auto_209208 ) ) ( not ( = ?auto_209203 ?auto_209214 ) ) ( not ( = ?auto_209204 ?auto_209205 ) ) ( not ( = ?auto_209204 ?auto_209206 ) ) ( not ( = ?auto_209204 ?auto_209207 ) ) ( not ( = ?auto_209204 ?auto_209208 ) ) ( not ( = ?auto_209204 ?auto_209214 ) ) ( not ( = ?auto_209205 ?auto_209206 ) ) ( not ( = ?auto_209205 ?auto_209207 ) ) ( not ( = ?auto_209205 ?auto_209208 ) ) ( not ( = ?auto_209205 ?auto_209214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209206 ?auto_209207 ?auto_209208 )
      ( MAKE-6CRATE-VERIFY ?auto_209202 ?auto_209203 ?auto_209204 ?auto_209205 ?auto_209206 ?auto_209207 ?auto_209208 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_209215 - SURFACE
      ?auto_209216 - SURFACE
    )
    :vars
    (
      ?auto_209219 - HOIST
      ?auto_209218 - PLACE
      ?auto_209222 - SURFACE
      ?auto_209221 - PLACE
      ?auto_209220 - HOIST
      ?auto_209223 - SURFACE
      ?auto_209217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209219 ?auto_209218 ) ( IS-CRATE ?auto_209216 ) ( not ( = ?auto_209215 ?auto_209216 ) ) ( not ( = ?auto_209222 ?auto_209215 ) ) ( not ( = ?auto_209222 ?auto_209216 ) ) ( not ( = ?auto_209221 ?auto_209218 ) ) ( HOIST-AT ?auto_209220 ?auto_209221 ) ( not ( = ?auto_209219 ?auto_209220 ) ) ( AVAILABLE ?auto_209220 ) ( SURFACE-AT ?auto_209216 ?auto_209221 ) ( ON ?auto_209216 ?auto_209223 ) ( CLEAR ?auto_209216 ) ( not ( = ?auto_209215 ?auto_209223 ) ) ( not ( = ?auto_209216 ?auto_209223 ) ) ( not ( = ?auto_209222 ?auto_209223 ) ) ( SURFACE-AT ?auto_209222 ?auto_209218 ) ( CLEAR ?auto_209222 ) ( IS-CRATE ?auto_209215 ) ( AVAILABLE ?auto_209219 ) ( IN ?auto_209215 ?auto_209217 ) ( TRUCK-AT ?auto_209217 ?auto_209221 ) )
    :subtasks
    ( ( !DRIVE ?auto_209217 ?auto_209221 ?auto_209218 )
      ( MAKE-2CRATE ?auto_209222 ?auto_209215 ?auto_209216 )
      ( MAKE-1CRATE-VERIFY ?auto_209215 ?auto_209216 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_209224 - SURFACE
      ?auto_209225 - SURFACE
      ?auto_209226 - SURFACE
    )
    :vars
    (
      ?auto_209229 - HOIST
      ?auto_209231 - PLACE
      ?auto_209230 - PLACE
      ?auto_209228 - HOIST
      ?auto_209232 - SURFACE
      ?auto_209227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209229 ?auto_209231 ) ( IS-CRATE ?auto_209226 ) ( not ( = ?auto_209225 ?auto_209226 ) ) ( not ( = ?auto_209224 ?auto_209225 ) ) ( not ( = ?auto_209224 ?auto_209226 ) ) ( not ( = ?auto_209230 ?auto_209231 ) ) ( HOIST-AT ?auto_209228 ?auto_209230 ) ( not ( = ?auto_209229 ?auto_209228 ) ) ( AVAILABLE ?auto_209228 ) ( SURFACE-AT ?auto_209226 ?auto_209230 ) ( ON ?auto_209226 ?auto_209232 ) ( CLEAR ?auto_209226 ) ( not ( = ?auto_209225 ?auto_209232 ) ) ( not ( = ?auto_209226 ?auto_209232 ) ) ( not ( = ?auto_209224 ?auto_209232 ) ) ( SURFACE-AT ?auto_209224 ?auto_209231 ) ( CLEAR ?auto_209224 ) ( IS-CRATE ?auto_209225 ) ( AVAILABLE ?auto_209229 ) ( IN ?auto_209225 ?auto_209227 ) ( TRUCK-AT ?auto_209227 ?auto_209230 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_209225 ?auto_209226 )
      ( MAKE-2CRATE-VERIFY ?auto_209224 ?auto_209225 ?auto_209226 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_209233 - SURFACE
      ?auto_209234 - SURFACE
      ?auto_209235 - SURFACE
      ?auto_209236 - SURFACE
    )
    :vars
    (
      ?auto_209241 - HOIST
      ?auto_209238 - PLACE
      ?auto_209239 - PLACE
      ?auto_209240 - HOIST
      ?auto_209237 - SURFACE
      ?auto_209242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209241 ?auto_209238 ) ( IS-CRATE ?auto_209236 ) ( not ( = ?auto_209235 ?auto_209236 ) ) ( not ( = ?auto_209234 ?auto_209235 ) ) ( not ( = ?auto_209234 ?auto_209236 ) ) ( not ( = ?auto_209239 ?auto_209238 ) ) ( HOIST-AT ?auto_209240 ?auto_209239 ) ( not ( = ?auto_209241 ?auto_209240 ) ) ( AVAILABLE ?auto_209240 ) ( SURFACE-AT ?auto_209236 ?auto_209239 ) ( ON ?auto_209236 ?auto_209237 ) ( CLEAR ?auto_209236 ) ( not ( = ?auto_209235 ?auto_209237 ) ) ( not ( = ?auto_209236 ?auto_209237 ) ) ( not ( = ?auto_209234 ?auto_209237 ) ) ( SURFACE-AT ?auto_209234 ?auto_209238 ) ( CLEAR ?auto_209234 ) ( IS-CRATE ?auto_209235 ) ( AVAILABLE ?auto_209241 ) ( IN ?auto_209235 ?auto_209242 ) ( TRUCK-AT ?auto_209242 ?auto_209239 ) ( ON ?auto_209234 ?auto_209233 ) ( not ( = ?auto_209233 ?auto_209234 ) ) ( not ( = ?auto_209233 ?auto_209235 ) ) ( not ( = ?auto_209233 ?auto_209236 ) ) ( not ( = ?auto_209233 ?auto_209237 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209234 ?auto_209235 ?auto_209236 )
      ( MAKE-3CRATE-VERIFY ?auto_209233 ?auto_209234 ?auto_209235 ?auto_209236 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_209243 - SURFACE
      ?auto_209244 - SURFACE
      ?auto_209245 - SURFACE
      ?auto_209246 - SURFACE
      ?auto_209247 - SURFACE
    )
    :vars
    (
      ?auto_209252 - HOIST
      ?auto_209249 - PLACE
      ?auto_209250 - PLACE
      ?auto_209251 - HOIST
      ?auto_209248 - SURFACE
      ?auto_209253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209252 ?auto_209249 ) ( IS-CRATE ?auto_209247 ) ( not ( = ?auto_209246 ?auto_209247 ) ) ( not ( = ?auto_209245 ?auto_209246 ) ) ( not ( = ?auto_209245 ?auto_209247 ) ) ( not ( = ?auto_209250 ?auto_209249 ) ) ( HOIST-AT ?auto_209251 ?auto_209250 ) ( not ( = ?auto_209252 ?auto_209251 ) ) ( AVAILABLE ?auto_209251 ) ( SURFACE-AT ?auto_209247 ?auto_209250 ) ( ON ?auto_209247 ?auto_209248 ) ( CLEAR ?auto_209247 ) ( not ( = ?auto_209246 ?auto_209248 ) ) ( not ( = ?auto_209247 ?auto_209248 ) ) ( not ( = ?auto_209245 ?auto_209248 ) ) ( SURFACE-AT ?auto_209245 ?auto_209249 ) ( CLEAR ?auto_209245 ) ( IS-CRATE ?auto_209246 ) ( AVAILABLE ?auto_209252 ) ( IN ?auto_209246 ?auto_209253 ) ( TRUCK-AT ?auto_209253 ?auto_209250 ) ( ON ?auto_209244 ?auto_209243 ) ( ON ?auto_209245 ?auto_209244 ) ( not ( = ?auto_209243 ?auto_209244 ) ) ( not ( = ?auto_209243 ?auto_209245 ) ) ( not ( = ?auto_209243 ?auto_209246 ) ) ( not ( = ?auto_209243 ?auto_209247 ) ) ( not ( = ?auto_209243 ?auto_209248 ) ) ( not ( = ?auto_209244 ?auto_209245 ) ) ( not ( = ?auto_209244 ?auto_209246 ) ) ( not ( = ?auto_209244 ?auto_209247 ) ) ( not ( = ?auto_209244 ?auto_209248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209245 ?auto_209246 ?auto_209247 )
      ( MAKE-4CRATE-VERIFY ?auto_209243 ?auto_209244 ?auto_209245 ?auto_209246 ?auto_209247 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_209254 - SURFACE
      ?auto_209255 - SURFACE
      ?auto_209256 - SURFACE
      ?auto_209257 - SURFACE
      ?auto_209258 - SURFACE
      ?auto_209259 - SURFACE
    )
    :vars
    (
      ?auto_209264 - HOIST
      ?auto_209261 - PLACE
      ?auto_209262 - PLACE
      ?auto_209263 - HOIST
      ?auto_209260 - SURFACE
      ?auto_209265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209264 ?auto_209261 ) ( IS-CRATE ?auto_209259 ) ( not ( = ?auto_209258 ?auto_209259 ) ) ( not ( = ?auto_209257 ?auto_209258 ) ) ( not ( = ?auto_209257 ?auto_209259 ) ) ( not ( = ?auto_209262 ?auto_209261 ) ) ( HOIST-AT ?auto_209263 ?auto_209262 ) ( not ( = ?auto_209264 ?auto_209263 ) ) ( AVAILABLE ?auto_209263 ) ( SURFACE-AT ?auto_209259 ?auto_209262 ) ( ON ?auto_209259 ?auto_209260 ) ( CLEAR ?auto_209259 ) ( not ( = ?auto_209258 ?auto_209260 ) ) ( not ( = ?auto_209259 ?auto_209260 ) ) ( not ( = ?auto_209257 ?auto_209260 ) ) ( SURFACE-AT ?auto_209257 ?auto_209261 ) ( CLEAR ?auto_209257 ) ( IS-CRATE ?auto_209258 ) ( AVAILABLE ?auto_209264 ) ( IN ?auto_209258 ?auto_209265 ) ( TRUCK-AT ?auto_209265 ?auto_209262 ) ( ON ?auto_209255 ?auto_209254 ) ( ON ?auto_209256 ?auto_209255 ) ( ON ?auto_209257 ?auto_209256 ) ( not ( = ?auto_209254 ?auto_209255 ) ) ( not ( = ?auto_209254 ?auto_209256 ) ) ( not ( = ?auto_209254 ?auto_209257 ) ) ( not ( = ?auto_209254 ?auto_209258 ) ) ( not ( = ?auto_209254 ?auto_209259 ) ) ( not ( = ?auto_209254 ?auto_209260 ) ) ( not ( = ?auto_209255 ?auto_209256 ) ) ( not ( = ?auto_209255 ?auto_209257 ) ) ( not ( = ?auto_209255 ?auto_209258 ) ) ( not ( = ?auto_209255 ?auto_209259 ) ) ( not ( = ?auto_209255 ?auto_209260 ) ) ( not ( = ?auto_209256 ?auto_209257 ) ) ( not ( = ?auto_209256 ?auto_209258 ) ) ( not ( = ?auto_209256 ?auto_209259 ) ) ( not ( = ?auto_209256 ?auto_209260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209257 ?auto_209258 ?auto_209259 )
      ( MAKE-5CRATE-VERIFY ?auto_209254 ?auto_209255 ?auto_209256 ?auto_209257 ?auto_209258 ?auto_209259 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_209266 - SURFACE
      ?auto_209267 - SURFACE
      ?auto_209268 - SURFACE
      ?auto_209269 - SURFACE
      ?auto_209270 - SURFACE
      ?auto_209271 - SURFACE
      ?auto_209272 - SURFACE
    )
    :vars
    (
      ?auto_209277 - HOIST
      ?auto_209274 - PLACE
      ?auto_209275 - PLACE
      ?auto_209276 - HOIST
      ?auto_209273 - SURFACE
      ?auto_209278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209277 ?auto_209274 ) ( IS-CRATE ?auto_209272 ) ( not ( = ?auto_209271 ?auto_209272 ) ) ( not ( = ?auto_209270 ?auto_209271 ) ) ( not ( = ?auto_209270 ?auto_209272 ) ) ( not ( = ?auto_209275 ?auto_209274 ) ) ( HOIST-AT ?auto_209276 ?auto_209275 ) ( not ( = ?auto_209277 ?auto_209276 ) ) ( AVAILABLE ?auto_209276 ) ( SURFACE-AT ?auto_209272 ?auto_209275 ) ( ON ?auto_209272 ?auto_209273 ) ( CLEAR ?auto_209272 ) ( not ( = ?auto_209271 ?auto_209273 ) ) ( not ( = ?auto_209272 ?auto_209273 ) ) ( not ( = ?auto_209270 ?auto_209273 ) ) ( SURFACE-AT ?auto_209270 ?auto_209274 ) ( CLEAR ?auto_209270 ) ( IS-CRATE ?auto_209271 ) ( AVAILABLE ?auto_209277 ) ( IN ?auto_209271 ?auto_209278 ) ( TRUCK-AT ?auto_209278 ?auto_209275 ) ( ON ?auto_209267 ?auto_209266 ) ( ON ?auto_209268 ?auto_209267 ) ( ON ?auto_209269 ?auto_209268 ) ( ON ?auto_209270 ?auto_209269 ) ( not ( = ?auto_209266 ?auto_209267 ) ) ( not ( = ?auto_209266 ?auto_209268 ) ) ( not ( = ?auto_209266 ?auto_209269 ) ) ( not ( = ?auto_209266 ?auto_209270 ) ) ( not ( = ?auto_209266 ?auto_209271 ) ) ( not ( = ?auto_209266 ?auto_209272 ) ) ( not ( = ?auto_209266 ?auto_209273 ) ) ( not ( = ?auto_209267 ?auto_209268 ) ) ( not ( = ?auto_209267 ?auto_209269 ) ) ( not ( = ?auto_209267 ?auto_209270 ) ) ( not ( = ?auto_209267 ?auto_209271 ) ) ( not ( = ?auto_209267 ?auto_209272 ) ) ( not ( = ?auto_209267 ?auto_209273 ) ) ( not ( = ?auto_209268 ?auto_209269 ) ) ( not ( = ?auto_209268 ?auto_209270 ) ) ( not ( = ?auto_209268 ?auto_209271 ) ) ( not ( = ?auto_209268 ?auto_209272 ) ) ( not ( = ?auto_209268 ?auto_209273 ) ) ( not ( = ?auto_209269 ?auto_209270 ) ) ( not ( = ?auto_209269 ?auto_209271 ) ) ( not ( = ?auto_209269 ?auto_209272 ) ) ( not ( = ?auto_209269 ?auto_209273 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209270 ?auto_209271 ?auto_209272 )
      ( MAKE-6CRATE-VERIFY ?auto_209266 ?auto_209267 ?auto_209268 ?auto_209269 ?auto_209270 ?auto_209271 ?auto_209272 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_209279 - SURFACE
      ?auto_209280 - SURFACE
    )
    :vars
    (
      ?auto_209286 - HOIST
      ?auto_209282 - PLACE
      ?auto_209285 - SURFACE
      ?auto_209283 - PLACE
      ?auto_209284 - HOIST
      ?auto_209281 - SURFACE
      ?auto_209287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209286 ?auto_209282 ) ( IS-CRATE ?auto_209280 ) ( not ( = ?auto_209279 ?auto_209280 ) ) ( not ( = ?auto_209285 ?auto_209279 ) ) ( not ( = ?auto_209285 ?auto_209280 ) ) ( not ( = ?auto_209283 ?auto_209282 ) ) ( HOIST-AT ?auto_209284 ?auto_209283 ) ( not ( = ?auto_209286 ?auto_209284 ) ) ( SURFACE-AT ?auto_209280 ?auto_209283 ) ( ON ?auto_209280 ?auto_209281 ) ( CLEAR ?auto_209280 ) ( not ( = ?auto_209279 ?auto_209281 ) ) ( not ( = ?auto_209280 ?auto_209281 ) ) ( not ( = ?auto_209285 ?auto_209281 ) ) ( SURFACE-AT ?auto_209285 ?auto_209282 ) ( CLEAR ?auto_209285 ) ( IS-CRATE ?auto_209279 ) ( AVAILABLE ?auto_209286 ) ( TRUCK-AT ?auto_209287 ?auto_209283 ) ( LIFTING ?auto_209284 ?auto_209279 ) )
    :subtasks
    ( ( !LOAD ?auto_209284 ?auto_209279 ?auto_209287 ?auto_209283 )
      ( MAKE-2CRATE ?auto_209285 ?auto_209279 ?auto_209280 )
      ( MAKE-1CRATE-VERIFY ?auto_209279 ?auto_209280 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_209288 - SURFACE
      ?auto_209289 - SURFACE
      ?auto_209290 - SURFACE
    )
    :vars
    (
      ?auto_209293 - HOIST
      ?auto_209291 - PLACE
      ?auto_209294 - PLACE
      ?auto_209292 - HOIST
      ?auto_209296 - SURFACE
      ?auto_209295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209293 ?auto_209291 ) ( IS-CRATE ?auto_209290 ) ( not ( = ?auto_209289 ?auto_209290 ) ) ( not ( = ?auto_209288 ?auto_209289 ) ) ( not ( = ?auto_209288 ?auto_209290 ) ) ( not ( = ?auto_209294 ?auto_209291 ) ) ( HOIST-AT ?auto_209292 ?auto_209294 ) ( not ( = ?auto_209293 ?auto_209292 ) ) ( SURFACE-AT ?auto_209290 ?auto_209294 ) ( ON ?auto_209290 ?auto_209296 ) ( CLEAR ?auto_209290 ) ( not ( = ?auto_209289 ?auto_209296 ) ) ( not ( = ?auto_209290 ?auto_209296 ) ) ( not ( = ?auto_209288 ?auto_209296 ) ) ( SURFACE-AT ?auto_209288 ?auto_209291 ) ( CLEAR ?auto_209288 ) ( IS-CRATE ?auto_209289 ) ( AVAILABLE ?auto_209293 ) ( TRUCK-AT ?auto_209295 ?auto_209294 ) ( LIFTING ?auto_209292 ?auto_209289 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_209289 ?auto_209290 )
      ( MAKE-2CRATE-VERIFY ?auto_209288 ?auto_209289 ?auto_209290 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_209297 - SURFACE
      ?auto_209298 - SURFACE
      ?auto_209299 - SURFACE
      ?auto_209300 - SURFACE
    )
    :vars
    (
      ?auto_209302 - HOIST
      ?auto_209306 - PLACE
      ?auto_209303 - PLACE
      ?auto_209304 - HOIST
      ?auto_209305 - SURFACE
      ?auto_209301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209302 ?auto_209306 ) ( IS-CRATE ?auto_209300 ) ( not ( = ?auto_209299 ?auto_209300 ) ) ( not ( = ?auto_209298 ?auto_209299 ) ) ( not ( = ?auto_209298 ?auto_209300 ) ) ( not ( = ?auto_209303 ?auto_209306 ) ) ( HOIST-AT ?auto_209304 ?auto_209303 ) ( not ( = ?auto_209302 ?auto_209304 ) ) ( SURFACE-AT ?auto_209300 ?auto_209303 ) ( ON ?auto_209300 ?auto_209305 ) ( CLEAR ?auto_209300 ) ( not ( = ?auto_209299 ?auto_209305 ) ) ( not ( = ?auto_209300 ?auto_209305 ) ) ( not ( = ?auto_209298 ?auto_209305 ) ) ( SURFACE-AT ?auto_209298 ?auto_209306 ) ( CLEAR ?auto_209298 ) ( IS-CRATE ?auto_209299 ) ( AVAILABLE ?auto_209302 ) ( TRUCK-AT ?auto_209301 ?auto_209303 ) ( LIFTING ?auto_209304 ?auto_209299 ) ( ON ?auto_209298 ?auto_209297 ) ( not ( = ?auto_209297 ?auto_209298 ) ) ( not ( = ?auto_209297 ?auto_209299 ) ) ( not ( = ?auto_209297 ?auto_209300 ) ) ( not ( = ?auto_209297 ?auto_209305 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209298 ?auto_209299 ?auto_209300 )
      ( MAKE-3CRATE-VERIFY ?auto_209297 ?auto_209298 ?auto_209299 ?auto_209300 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_209307 - SURFACE
      ?auto_209308 - SURFACE
      ?auto_209309 - SURFACE
      ?auto_209310 - SURFACE
      ?auto_209311 - SURFACE
    )
    :vars
    (
      ?auto_209313 - HOIST
      ?auto_209317 - PLACE
      ?auto_209314 - PLACE
      ?auto_209315 - HOIST
      ?auto_209316 - SURFACE
      ?auto_209312 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209313 ?auto_209317 ) ( IS-CRATE ?auto_209311 ) ( not ( = ?auto_209310 ?auto_209311 ) ) ( not ( = ?auto_209309 ?auto_209310 ) ) ( not ( = ?auto_209309 ?auto_209311 ) ) ( not ( = ?auto_209314 ?auto_209317 ) ) ( HOIST-AT ?auto_209315 ?auto_209314 ) ( not ( = ?auto_209313 ?auto_209315 ) ) ( SURFACE-AT ?auto_209311 ?auto_209314 ) ( ON ?auto_209311 ?auto_209316 ) ( CLEAR ?auto_209311 ) ( not ( = ?auto_209310 ?auto_209316 ) ) ( not ( = ?auto_209311 ?auto_209316 ) ) ( not ( = ?auto_209309 ?auto_209316 ) ) ( SURFACE-AT ?auto_209309 ?auto_209317 ) ( CLEAR ?auto_209309 ) ( IS-CRATE ?auto_209310 ) ( AVAILABLE ?auto_209313 ) ( TRUCK-AT ?auto_209312 ?auto_209314 ) ( LIFTING ?auto_209315 ?auto_209310 ) ( ON ?auto_209308 ?auto_209307 ) ( ON ?auto_209309 ?auto_209308 ) ( not ( = ?auto_209307 ?auto_209308 ) ) ( not ( = ?auto_209307 ?auto_209309 ) ) ( not ( = ?auto_209307 ?auto_209310 ) ) ( not ( = ?auto_209307 ?auto_209311 ) ) ( not ( = ?auto_209307 ?auto_209316 ) ) ( not ( = ?auto_209308 ?auto_209309 ) ) ( not ( = ?auto_209308 ?auto_209310 ) ) ( not ( = ?auto_209308 ?auto_209311 ) ) ( not ( = ?auto_209308 ?auto_209316 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209309 ?auto_209310 ?auto_209311 )
      ( MAKE-4CRATE-VERIFY ?auto_209307 ?auto_209308 ?auto_209309 ?auto_209310 ?auto_209311 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_209318 - SURFACE
      ?auto_209319 - SURFACE
      ?auto_209320 - SURFACE
      ?auto_209321 - SURFACE
      ?auto_209322 - SURFACE
      ?auto_209323 - SURFACE
    )
    :vars
    (
      ?auto_209325 - HOIST
      ?auto_209329 - PLACE
      ?auto_209326 - PLACE
      ?auto_209327 - HOIST
      ?auto_209328 - SURFACE
      ?auto_209324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209325 ?auto_209329 ) ( IS-CRATE ?auto_209323 ) ( not ( = ?auto_209322 ?auto_209323 ) ) ( not ( = ?auto_209321 ?auto_209322 ) ) ( not ( = ?auto_209321 ?auto_209323 ) ) ( not ( = ?auto_209326 ?auto_209329 ) ) ( HOIST-AT ?auto_209327 ?auto_209326 ) ( not ( = ?auto_209325 ?auto_209327 ) ) ( SURFACE-AT ?auto_209323 ?auto_209326 ) ( ON ?auto_209323 ?auto_209328 ) ( CLEAR ?auto_209323 ) ( not ( = ?auto_209322 ?auto_209328 ) ) ( not ( = ?auto_209323 ?auto_209328 ) ) ( not ( = ?auto_209321 ?auto_209328 ) ) ( SURFACE-AT ?auto_209321 ?auto_209329 ) ( CLEAR ?auto_209321 ) ( IS-CRATE ?auto_209322 ) ( AVAILABLE ?auto_209325 ) ( TRUCK-AT ?auto_209324 ?auto_209326 ) ( LIFTING ?auto_209327 ?auto_209322 ) ( ON ?auto_209319 ?auto_209318 ) ( ON ?auto_209320 ?auto_209319 ) ( ON ?auto_209321 ?auto_209320 ) ( not ( = ?auto_209318 ?auto_209319 ) ) ( not ( = ?auto_209318 ?auto_209320 ) ) ( not ( = ?auto_209318 ?auto_209321 ) ) ( not ( = ?auto_209318 ?auto_209322 ) ) ( not ( = ?auto_209318 ?auto_209323 ) ) ( not ( = ?auto_209318 ?auto_209328 ) ) ( not ( = ?auto_209319 ?auto_209320 ) ) ( not ( = ?auto_209319 ?auto_209321 ) ) ( not ( = ?auto_209319 ?auto_209322 ) ) ( not ( = ?auto_209319 ?auto_209323 ) ) ( not ( = ?auto_209319 ?auto_209328 ) ) ( not ( = ?auto_209320 ?auto_209321 ) ) ( not ( = ?auto_209320 ?auto_209322 ) ) ( not ( = ?auto_209320 ?auto_209323 ) ) ( not ( = ?auto_209320 ?auto_209328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209321 ?auto_209322 ?auto_209323 )
      ( MAKE-5CRATE-VERIFY ?auto_209318 ?auto_209319 ?auto_209320 ?auto_209321 ?auto_209322 ?auto_209323 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_209330 - SURFACE
      ?auto_209331 - SURFACE
      ?auto_209332 - SURFACE
      ?auto_209333 - SURFACE
      ?auto_209334 - SURFACE
      ?auto_209335 - SURFACE
      ?auto_209336 - SURFACE
    )
    :vars
    (
      ?auto_209338 - HOIST
      ?auto_209342 - PLACE
      ?auto_209339 - PLACE
      ?auto_209340 - HOIST
      ?auto_209341 - SURFACE
      ?auto_209337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209338 ?auto_209342 ) ( IS-CRATE ?auto_209336 ) ( not ( = ?auto_209335 ?auto_209336 ) ) ( not ( = ?auto_209334 ?auto_209335 ) ) ( not ( = ?auto_209334 ?auto_209336 ) ) ( not ( = ?auto_209339 ?auto_209342 ) ) ( HOIST-AT ?auto_209340 ?auto_209339 ) ( not ( = ?auto_209338 ?auto_209340 ) ) ( SURFACE-AT ?auto_209336 ?auto_209339 ) ( ON ?auto_209336 ?auto_209341 ) ( CLEAR ?auto_209336 ) ( not ( = ?auto_209335 ?auto_209341 ) ) ( not ( = ?auto_209336 ?auto_209341 ) ) ( not ( = ?auto_209334 ?auto_209341 ) ) ( SURFACE-AT ?auto_209334 ?auto_209342 ) ( CLEAR ?auto_209334 ) ( IS-CRATE ?auto_209335 ) ( AVAILABLE ?auto_209338 ) ( TRUCK-AT ?auto_209337 ?auto_209339 ) ( LIFTING ?auto_209340 ?auto_209335 ) ( ON ?auto_209331 ?auto_209330 ) ( ON ?auto_209332 ?auto_209331 ) ( ON ?auto_209333 ?auto_209332 ) ( ON ?auto_209334 ?auto_209333 ) ( not ( = ?auto_209330 ?auto_209331 ) ) ( not ( = ?auto_209330 ?auto_209332 ) ) ( not ( = ?auto_209330 ?auto_209333 ) ) ( not ( = ?auto_209330 ?auto_209334 ) ) ( not ( = ?auto_209330 ?auto_209335 ) ) ( not ( = ?auto_209330 ?auto_209336 ) ) ( not ( = ?auto_209330 ?auto_209341 ) ) ( not ( = ?auto_209331 ?auto_209332 ) ) ( not ( = ?auto_209331 ?auto_209333 ) ) ( not ( = ?auto_209331 ?auto_209334 ) ) ( not ( = ?auto_209331 ?auto_209335 ) ) ( not ( = ?auto_209331 ?auto_209336 ) ) ( not ( = ?auto_209331 ?auto_209341 ) ) ( not ( = ?auto_209332 ?auto_209333 ) ) ( not ( = ?auto_209332 ?auto_209334 ) ) ( not ( = ?auto_209332 ?auto_209335 ) ) ( not ( = ?auto_209332 ?auto_209336 ) ) ( not ( = ?auto_209332 ?auto_209341 ) ) ( not ( = ?auto_209333 ?auto_209334 ) ) ( not ( = ?auto_209333 ?auto_209335 ) ) ( not ( = ?auto_209333 ?auto_209336 ) ) ( not ( = ?auto_209333 ?auto_209341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209334 ?auto_209335 ?auto_209336 )
      ( MAKE-6CRATE-VERIFY ?auto_209330 ?auto_209331 ?auto_209332 ?auto_209333 ?auto_209334 ?auto_209335 ?auto_209336 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_209343 - SURFACE
      ?auto_209344 - SURFACE
    )
    :vars
    (
      ?auto_209346 - HOIST
      ?auto_209350 - PLACE
      ?auto_209351 - SURFACE
      ?auto_209347 - PLACE
      ?auto_209348 - HOIST
      ?auto_209349 - SURFACE
      ?auto_209345 - TRUCK
      ?auto_209352 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_209346 ?auto_209350 ) ( IS-CRATE ?auto_209344 ) ( not ( = ?auto_209343 ?auto_209344 ) ) ( not ( = ?auto_209351 ?auto_209343 ) ) ( not ( = ?auto_209351 ?auto_209344 ) ) ( not ( = ?auto_209347 ?auto_209350 ) ) ( HOIST-AT ?auto_209348 ?auto_209347 ) ( not ( = ?auto_209346 ?auto_209348 ) ) ( SURFACE-AT ?auto_209344 ?auto_209347 ) ( ON ?auto_209344 ?auto_209349 ) ( CLEAR ?auto_209344 ) ( not ( = ?auto_209343 ?auto_209349 ) ) ( not ( = ?auto_209344 ?auto_209349 ) ) ( not ( = ?auto_209351 ?auto_209349 ) ) ( SURFACE-AT ?auto_209351 ?auto_209350 ) ( CLEAR ?auto_209351 ) ( IS-CRATE ?auto_209343 ) ( AVAILABLE ?auto_209346 ) ( TRUCK-AT ?auto_209345 ?auto_209347 ) ( AVAILABLE ?auto_209348 ) ( SURFACE-AT ?auto_209343 ?auto_209347 ) ( ON ?auto_209343 ?auto_209352 ) ( CLEAR ?auto_209343 ) ( not ( = ?auto_209343 ?auto_209352 ) ) ( not ( = ?auto_209344 ?auto_209352 ) ) ( not ( = ?auto_209351 ?auto_209352 ) ) ( not ( = ?auto_209349 ?auto_209352 ) ) )
    :subtasks
    ( ( !LIFT ?auto_209348 ?auto_209343 ?auto_209352 ?auto_209347 )
      ( MAKE-2CRATE ?auto_209351 ?auto_209343 ?auto_209344 )
      ( MAKE-1CRATE-VERIFY ?auto_209343 ?auto_209344 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_209353 - SURFACE
      ?auto_209354 - SURFACE
      ?auto_209355 - SURFACE
    )
    :vars
    (
      ?auto_209358 - HOIST
      ?auto_209360 - PLACE
      ?auto_209356 - PLACE
      ?auto_209357 - HOIST
      ?auto_209362 - SURFACE
      ?auto_209359 - TRUCK
      ?auto_209361 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_209358 ?auto_209360 ) ( IS-CRATE ?auto_209355 ) ( not ( = ?auto_209354 ?auto_209355 ) ) ( not ( = ?auto_209353 ?auto_209354 ) ) ( not ( = ?auto_209353 ?auto_209355 ) ) ( not ( = ?auto_209356 ?auto_209360 ) ) ( HOIST-AT ?auto_209357 ?auto_209356 ) ( not ( = ?auto_209358 ?auto_209357 ) ) ( SURFACE-AT ?auto_209355 ?auto_209356 ) ( ON ?auto_209355 ?auto_209362 ) ( CLEAR ?auto_209355 ) ( not ( = ?auto_209354 ?auto_209362 ) ) ( not ( = ?auto_209355 ?auto_209362 ) ) ( not ( = ?auto_209353 ?auto_209362 ) ) ( SURFACE-AT ?auto_209353 ?auto_209360 ) ( CLEAR ?auto_209353 ) ( IS-CRATE ?auto_209354 ) ( AVAILABLE ?auto_209358 ) ( TRUCK-AT ?auto_209359 ?auto_209356 ) ( AVAILABLE ?auto_209357 ) ( SURFACE-AT ?auto_209354 ?auto_209356 ) ( ON ?auto_209354 ?auto_209361 ) ( CLEAR ?auto_209354 ) ( not ( = ?auto_209354 ?auto_209361 ) ) ( not ( = ?auto_209355 ?auto_209361 ) ) ( not ( = ?auto_209353 ?auto_209361 ) ) ( not ( = ?auto_209362 ?auto_209361 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_209354 ?auto_209355 )
      ( MAKE-2CRATE-VERIFY ?auto_209353 ?auto_209354 ?auto_209355 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_209363 - SURFACE
      ?auto_209364 - SURFACE
      ?auto_209365 - SURFACE
      ?auto_209366 - SURFACE
    )
    :vars
    (
      ?auto_209371 - HOIST
      ?auto_209367 - PLACE
      ?auto_209373 - PLACE
      ?auto_209372 - HOIST
      ?auto_209369 - SURFACE
      ?auto_209370 - TRUCK
      ?auto_209368 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_209371 ?auto_209367 ) ( IS-CRATE ?auto_209366 ) ( not ( = ?auto_209365 ?auto_209366 ) ) ( not ( = ?auto_209364 ?auto_209365 ) ) ( not ( = ?auto_209364 ?auto_209366 ) ) ( not ( = ?auto_209373 ?auto_209367 ) ) ( HOIST-AT ?auto_209372 ?auto_209373 ) ( not ( = ?auto_209371 ?auto_209372 ) ) ( SURFACE-AT ?auto_209366 ?auto_209373 ) ( ON ?auto_209366 ?auto_209369 ) ( CLEAR ?auto_209366 ) ( not ( = ?auto_209365 ?auto_209369 ) ) ( not ( = ?auto_209366 ?auto_209369 ) ) ( not ( = ?auto_209364 ?auto_209369 ) ) ( SURFACE-AT ?auto_209364 ?auto_209367 ) ( CLEAR ?auto_209364 ) ( IS-CRATE ?auto_209365 ) ( AVAILABLE ?auto_209371 ) ( TRUCK-AT ?auto_209370 ?auto_209373 ) ( AVAILABLE ?auto_209372 ) ( SURFACE-AT ?auto_209365 ?auto_209373 ) ( ON ?auto_209365 ?auto_209368 ) ( CLEAR ?auto_209365 ) ( not ( = ?auto_209365 ?auto_209368 ) ) ( not ( = ?auto_209366 ?auto_209368 ) ) ( not ( = ?auto_209364 ?auto_209368 ) ) ( not ( = ?auto_209369 ?auto_209368 ) ) ( ON ?auto_209364 ?auto_209363 ) ( not ( = ?auto_209363 ?auto_209364 ) ) ( not ( = ?auto_209363 ?auto_209365 ) ) ( not ( = ?auto_209363 ?auto_209366 ) ) ( not ( = ?auto_209363 ?auto_209369 ) ) ( not ( = ?auto_209363 ?auto_209368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209364 ?auto_209365 ?auto_209366 )
      ( MAKE-3CRATE-VERIFY ?auto_209363 ?auto_209364 ?auto_209365 ?auto_209366 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_209374 - SURFACE
      ?auto_209375 - SURFACE
      ?auto_209376 - SURFACE
      ?auto_209377 - SURFACE
      ?auto_209378 - SURFACE
    )
    :vars
    (
      ?auto_209383 - HOIST
      ?auto_209379 - PLACE
      ?auto_209385 - PLACE
      ?auto_209384 - HOIST
      ?auto_209381 - SURFACE
      ?auto_209382 - TRUCK
      ?auto_209380 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_209383 ?auto_209379 ) ( IS-CRATE ?auto_209378 ) ( not ( = ?auto_209377 ?auto_209378 ) ) ( not ( = ?auto_209376 ?auto_209377 ) ) ( not ( = ?auto_209376 ?auto_209378 ) ) ( not ( = ?auto_209385 ?auto_209379 ) ) ( HOIST-AT ?auto_209384 ?auto_209385 ) ( not ( = ?auto_209383 ?auto_209384 ) ) ( SURFACE-AT ?auto_209378 ?auto_209385 ) ( ON ?auto_209378 ?auto_209381 ) ( CLEAR ?auto_209378 ) ( not ( = ?auto_209377 ?auto_209381 ) ) ( not ( = ?auto_209378 ?auto_209381 ) ) ( not ( = ?auto_209376 ?auto_209381 ) ) ( SURFACE-AT ?auto_209376 ?auto_209379 ) ( CLEAR ?auto_209376 ) ( IS-CRATE ?auto_209377 ) ( AVAILABLE ?auto_209383 ) ( TRUCK-AT ?auto_209382 ?auto_209385 ) ( AVAILABLE ?auto_209384 ) ( SURFACE-AT ?auto_209377 ?auto_209385 ) ( ON ?auto_209377 ?auto_209380 ) ( CLEAR ?auto_209377 ) ( not ( = ?auto_209377 ?auto_209380 ) ) ( not ( = ?auto_209378 ?auto_209380 ) ) ( not ( = ?auto_209376 ?auto_209380 ) ) ( not ( = ?auto_209381 ?auto_209380 ) ) ( ON ?auto_209375 ?auto_209374 ) ( ON ?auto_209376 ?auto_209375 ) ( not ( = ?auto_209374 ?auto_209375 ) ) ( not ( = ?auto_209374 ?auto_209376 ) ) ( not ( = ?auto_209374 ?auto_209377 ) ) ( not ( = ?auto_209374 ?auto_209378 ) ) ( not ( = ?auto_209374 ?auto_209381 ) ) ( not ( = ?auto_209374 ?auto_209380 ) ) ( not ( = ?auto_209375 ?auto_209376 ) ) ( not ( = ?auto_209375 ?auto_209377 ) ) ( not ( = ?auto_209375 ?auto_209378 ) ) ( not ( = ?auto_209375 ?auto_209381 ) ) ( not ( = ?auto_209375 ?auto_209380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209376 ?auto_209377 ?auto_209378 )
      ( MAKE-4CRATE-VERIFY ?auto_209374 ?auto_209375 ?auto_209376 ?auto_209377 ?auto_209378 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_209386 - SURFACE
      ?auto_209387 - SURFACE
      ?auto_209388 - SURFACE
      ?auto_209389 - SURFACE
      ?auto_209390 - SURFACE
      ?auto_209391 - SURFACE
    )
    :vars
    (
      ?auto_209396 - HOIST
      ?auto_209392 - PLACE
      ?auto_209398 - PLACE
      ?auto_209397 - HOIST
      ?auto_209394 - SURFACE
      ?auto_209395 - TRUCK
      ?auto_209393 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_209396 ?auto_209392 ) ( IS-CRATE ?auto_209391 ) ( not ( = ?auto_209390 ?auto_209391 ) ) ( not ( = ?auto_209389 ?auto_209390 ) ) ( not ( = ?auto_209389 ?auto_209391 ) ) ( not ( = ?auto_209398 ?auto_209392 ) ) ( HOIST-AT ?auto_209397 ?auto_209398 ) ( not ( = ?auto_209396 ?auto_209397 ) ) ( SURFACE-AT ?auto_209391 ?auto_209398 ) ( ON ?auto_209391 ?auto_209394 ) ( CLEAR ?auto_209391 ) ( not ( = ?auto_209390 ?auto_209394 ) ) ( not ( = ?auto_209391 ?auto_209394 ) ) ( not ( = ?auto_209389 ?auto_209394 ) ) ( SURFACE-AT ?auto_209389 ?auto_209392 ) ( CLEAR ?auto_209389 ) ( IS-CRATE ?auto_209390 ) ( AVAILABLE ?auto_209396 ) ( TRUCK-AT ?auto_209395 ?auto_209398 ) ( AVAILABLE ?auto_209397 ) ( SURFACE-AT ?auto_209390 ?auto_209398 ) ( ON ?auto_209390 ?auto_209393 ) ( CLEAR ?auto_209390 ) ( not ( = ?auto_209390 ?auto_209393 ) ) ( not ( = ?auto_209391 ?auto_209393 ) ) ( not ( = ?auto_209389 ?auto_209393 ) ) ( not ( = ?auto_209394 ?auto_209393 ) ) ( ON ?auto_209387 ?auto_209386 ) ( ON ?auto_209388 ?auto_209387 ) ( ON ?auto_209389 ?auto_209388 ) ( not ( = ?auto_209386 ?auto_209387 ) ) ( not ( = ?auto_209386 ?auto_209388 ) ) ( not ( = ?auto_209386 ?auto_209389 ) ) ( not ( = ?auto_209386 ?auto_209390 ) ) ( not ( = ?auto_209386 ?auto_209391 ) ) ( not ( = ?auto_209386 ?auto_209394 ) ) ( not ( = ?auto_209386 ?auto_209393 ) ) ( not ( = ?auto_209387 ?auto_209388 ) ) ( not ( = ?auto_209387 ?auto_209389 ) ) ( not ( = ?auto_209387 ?auto_209390 ) ) ( not ( = ?auto_209387 ?auto_209391 ) ) ( not ( = ?auto_209387 ?auto_209394 ) ) ( not ( = ?auto_209387 ?auto_209393 ) ) ( not ( = ?auto_209388 ?auto_209389 ) ) ( not ( = ?auto_209388 ?auto_209390 ) ) ( not ( = ?auto_209388 ?auto_209391 ) ) ( not ( = ?auto_209388 ?auto_209394 ) ) ( not ( = ?auto_209388 ?auto_209393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209389 ?auto_209390 ?auto_209391 )
      ( MAKE-5CRATE-VERIFY ?auto_209386 ?auto_209387 ?auto_209388 ?auto_209389 ?auto_209390 ?auto_209391 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_209399 - SURFACE
      ?auto_209400 - SURFACE
      ?auto_209401 - SURFACE
      ?auto_209402 - SURFACE
      ?auto_209403 - SURFACE
      ?auto_209404 - SURFACE
      ?auto_209405 - SURFACE
    )
    :vars
    (
      ?auto_209410 - HOIST
      ?auto_209406 - PLACE
      ?auto_209412 - PLACE
      ?auto_209411 - HOIST
      ?auto_209408 - SURFACE
      ?auto_209409 - TRUCK
      ?auto_209407 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_209410 ?auto_209406 ) ( IS-CRATE ?auto_209405 ) ( not ( = ?auto_209404 ?auto_209405 ) ) ( not ( = ?auto_209403 ?auto_209404 ) ) ( not ( = ?auto_209403 ?auto_209405 ) ) ( not ( = ?auto_209412 ?auto_209406 ) ) ( HOIST-AT ?auto_209411 ?auto_209412 ) ( not ( = ?auto_209410 ?auto_209411 ) ) ( SURFACE-AT ?auto_209405 ?auto_209412 ) ( ON ?auto_209405 ?auto_209408 ) ( CLEAR ?auto_209405 ) ( not ( = ?auto_209404 ?auto_209408 ) ) ( not ( = ?auto_209405 ?auto_209408 ) ) ( not ( = ?auto_209403 ?auto_209408 ) ) ( SURFACE-AT ?auto_209403 ?auto_209406 ) ( CLEAR ?auto_209403 ) ( IS-CRATE ?auto_209404 ) ( AVAILABLE ?auto_209410 ) ( TRUCK-AT ?auto_209409 ?auto_209412 ) ( AVAILABLE ?auto_209411 ) ( SURFACE-AT ?auto_209404 ?auto_209412 ) ( ON ?auto_209404 ?auto_209407 ) ( CLEAR ?auto_209404 ) ( not ( = ?auto_209404 ?auto_209407 ) ) ( not ( = ?auto_209405 ?auto_209407 ) ) ( not ( = ?auto_209403 ?auto_209407 ) ) ( not ( = ?auto_209408 ?auto_209407 ) ) ( ON ?auto_209400 ?auto_209399 ) ( ON ?auto_209401 ?auto_209400 ) ( ON ?auto_209402 ?auto_209401 ) ( ON ?auto_209403 ?auto_209402 ) ( not ( = ?auto_209399 ?auto_209400 ) ) ( not ( = ?auto_209399 ?auto_209401 ) ) ( not ( = ?auto_209399 ?auto_209402 ) ) ( not ( = ?auto_209399 ?auto_209403 ) ) ( not ( = ?auto_209399 ?auto_209404 ) ) ( not ( = ?auto_209399 ?auto_209405 ) ) ( not ( = ?auto_209399 ?auto_209408 ) ) ( not ( = ?auto_209399 ?auto_209407 ) ) ( not ( = ?auto_209400 ?auto_209401 ) ) ( not ( = ?auto_209400 ?auto_209402 ) ) ( not ( = ?auto_209400 ?auto_209403 ) ) ( not ( = ?auto_209400 ?auto_209404 ) ) ( not ( = ?auto_209400 ?auto_209405 ) ) ( not ( = ?auto_209400 ?auto_209408 ) ) ( not ( = ?auto_209400 ?auto_209407 ) ) ( not ( = ?auto_209401 ?auto_209402 ) ) ( not ( = ?auto_209401 ?auto_209403 ) ) ( not ( = ?auto_209401 ?auto_209404 ) ) ( not ( = ?auto_209401 ?auto_209405 ) ) ( not ( = ?auto_209401 ?auto_209408 ) ) ( not ( = ?auto_209401 ?auto_209407 ) ) ( not ( = ?auto_209402 ?auto_209403 ) ) ( not ( = ?auto_209402 ?auto_209404 ) ) ( not ( = ?auto_209402 ?auto_209405 ) ) ( not ( = ?auto_209402 ?auto_209408 ) ) ( not ( = ?auto_209402 ?auto_209407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209403 ?auto_209404 ?auto_209405 )
      ( MAKE-6CRATE-VERIFY ?auto_209399 ?auto_209400 ?auto_209401 ?auto_209402 ?auto_209403 ?auto_209404 ?auto_209405 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_209413 - SURFACE
      ?auto_209414 - SURFACE
    )
    :vars
    (
      ?auto_209419 - HOIST
      ?auto_209415 - PLACE
      ?auto_209422 - SURFACE
      ?auto_209421 - PLACE
      ?auto_209420 - HOIST
      ?auto_209417 - SURFACE
      ?auto_209416 - SURFACE
      ?auto_209418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209419 ?auto_209415 ) ( IS-CRATE ?auto_209414 ) ( not ( = ?auto_209413 ?auto_209414 ) ) ( not ( = ?auto_209422 ?auto_209413 ) ) ( not ( = ?auto_209422 ?auto_209414 ) ) ( not ( = ?auto_209421 ?auto_209415 ) ) ( HOIST-AT ?auto_209420 ?auto_209421 ) ( not ( = ?auto_209419 ?auto_209420 ) ) ( SURFACE-AT ?auto_209414 ?auto_209421 ) ( ON ?auto_209414 ?auto_209417 ) ( CLEAR ?auto_209414 ) ( not ( = ?auto_209413 ?auto_209417 ) ) ( not ( = ?auto_209414 ?auto_209417 ) ) ( not ( = ?auto_209422 ?auto_209417 ) ) ( SURFACE-AT ?auto_209422 ?auto_209415 ) ( CLEAR ?auto_209422 ) ( IS-CRATE ?auto_209413 ) ( AVAILABLE ?auto_209419 ) ( AVAILABLE ?auto_209420 ) ( SURFACE-AT ?auto_209413 ?auto_209421 ) ( ON ?auto_209413 ?auto_209416 ) ( CLEAR ?auto_209413 ) ( not ( = ?auto_209413 ?auto_209416 ) ) ( not ( = ?auto_209414 ?auto_209416 ) ) ( not ( = ?auto_209422 ?auto_209416 ) ) ( not ( = ?auto_209417 ?auto_209416 ) ) ( TRUCK-AT ?auto_209418 ?auto_209415 ) )
    :subtasks
    ( ( !DRIVE ?auto_209418 ?auto_209415 ?auto_209421 )
      ( MAKE-2CRATE ?auto_209422 ?auto_209413 ?auto_209414 )
      ( MAKE-1CRATE-VERIFY ?auto_209413 ?auto_209414 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_209423 - SURFACE
      ?auto_209424 - SURFACE
      ?auto_209425 - SURFACE
    )
    :vars
    (
      ?auto_209430 - HOIST
      ?auto_209432 - PLACE
      ?auto_209428 - PLACE
      ?auto_209427 - HOIST
      ?auto_209426 - SURFACE
      ?auto_209429 - SURFACE
      ?auto_209431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209430 ?auto_209432 ) ( IS-CRATE ?auto_209425 ) ( not ( = ?auto_209424 ?auto_209425 ) ) ( not ( = ?auto_209423 ?auto_209424 ) ) ( not ( = ?auto_209423 ?auto_209425 ) ) ( not ( = ?auto_209428 ?auto_209432 ) ) ( HOIST-AT ?auto_209427 ?auto_209428 ) ( not ( = ?auto_209430 ?auto_209427 ) ) ( SURFACE-AT ?auto_209425 ?auto_209428 ) ( ON ?auto_209425 ?auto_209426 ) ( CLEAR ?auto_209425 ) ( not ( = ?auto_209424 ?auto_209426 ) ) ( not ( = ?auto_209425 ?auto_209426 ) ) ( not ( = ?auto_209423 ?auto_209426 ) ) ( SURFACE-AT ?auto_209423 ?auto_209432 ) ( CLEAR ?auto_209423 ) ( IS-CRATE ?auto_209424 ) ( AVAILABLE ?auto_209430 ) ( AVAILABLE ?auto_209427 ) ( SURFACE-AT ?auto_209424 ?auto_209428 ) ( ON ?auto_209424 ?auto_209429 ) ( CLEAR ?auto_209424 ) ( not ( = ?auto_209424 ?auto_209429 ) ) ( not ( = ?auto_209425 ?auto_209429 ) ) ( not ( = ?auto_209423 ?auto_209429 ) ) ( not ( = ?auto_209426 ?auto_209429 ) ) ( TRUCK-AT ?auto_209431 ?auto_209432 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_209424 ?auto_209425 )
      ( MAKE-2CRATE-VERIFY ?auto_209423 ?auto_209424 ?auto_209425 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_209433 - SURFACE
      ?auto_209434 - SURFACE
      ?auto_209435 - SURFACE
      ?auto_209436 - SURFACE
    )
    :vars
    (
      ?auto_209438 - HOIST
      ?auto_209439 - PLACE
      ?auto_209437 - PLACE
      ?auto_209440 - HOIST
      ?auto_209442 - SURFACE
      ?auto_209441 - SURFACE
      ?auto_209443 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209438 ?auto_209439 ) ( IS-CRATE ?auto_209436 ) ( not ( = ?auto_209435 ?auto_209436 ) ) ( not ( = ?auto_209434 ?auto_209435 ) ) ( not ( = ?auto_209434 ?auto_209436 ) ) ( not ( = ?auto_209437 ?auto_209439 ) ) ( HOIST-AT ?auto_209440 ?auto_209437 ) ( not ( = ?auto_209438 ?auto_209440 ) ) ( SURFACE-AT ?auto_209436 ?auto_209437 ) ( ON ?auto_209436 ?auto_209442 ) ( CLEAR ?auto_209436 ) ( not ( = ?auto_209435 ?auto_209442 ) ) ( not ( = ?auto_209436 ?auto_209442 ) ) ( not ( = ?auto_209434 ?auto_209442 ) ) ( SURFACE-AT ?auto_209434 ?auto_209439 ) ( CLEAR ?auto_209434 ) ( IS-CRATE ?auto_209435 ) ( AVAILABLE ?auto_209438 ) ( AVAILABLE ?auto_209440 ) ( SURFACE-AT ?auto_209435 ?auto_209437 ) ( ON ?auto_209435 ?auto_209441 ) ( CLEAR ?auto_209435 ) ( not ( = ?auto_209435 ?auto_209441 ) ) ( not ( = ?auto_209436 ?auto_209441 ) ) ( not ( = ?auto_209434 ?auto_209441 ) ) ( not ( = ?auto_209442 ?auto_209441 ) ) ( TRUCK-AT ?auto_209443 ?auto_209439 ) ( ON ?auto_209434 ?auto_209433 ) ( not ( = ?auto_209433 ?auto_209434 ) ) ( not ( = ?auto_209433 ?auto_209435 ) ) ( not ( = ?auto_209433 ?auto_209436 ) ) ( not ( = ?auto_209433 ?auto_209442 ) ) ( not ( = ?auto_209433 ?auto_209441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209434 ?auto_209435 ?auto_209436 )
      ( MAKE-3CRATE-VERIFY ?auto_209433 ?auto_209434 ?auto_209435 ?auto_209436 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_209444 - SURFACE
      ?auto_209445 - SURFACE
      ?auto_209446 - SURFACE
      ?auto_209447 - SURFACE
      ?auto_209448 - SURFACE
    )
    :vars
    (
      ?auto_209450 - HOIST
      ?auto_209451 - PLACE
      ?auto_209449 - PLACE
      ?auto_209452 - HOIST
      ?auto_209454 - SURFACE
      ?auto_209453 - SURFACE
      ?auto_209455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209450 ?auto_209451 ) ( IS-CRATE ?auto_209448 ) ( not ( = ?auto_209447 ?auto_209448 ) ) ( not ( = ?auto_209446 ?auto_209447 ) ) ( not ( = ?auto_209446 ?auto_209448 ) ) ( not ( = ?auto_209449 ?auto_209451 ) ) ( HOIST-AT ?auto_209452 ?auto_209449 ) ( not ( = ?auto_209450 ?auto_209452 ) ) ( SURFACE-AT ?auto_209448 ?auto_209449 ) ( ON ?auto_209448 ?auto_209454 ) ( CLEAR ?auto_209448 ) ( not ( = ?auto_209447 ?auto_209454 ) ) ( not ( = ?auto_209448 ?auto_209454 ) ) ( not ( = ?auto_209446 ?auto_209454 ) ) ( SURFACE-AT ?auto_209446 ?auto_209451 ) ( CLEAR ?auto_209446 ) ( IS-CRATE ?auto_209447 ) ( AVAILABLE ?auto_209450 ) ( AVAILABLE ?auto_209452 ) ( SURFACE-AT ?auto_209447 ?auto_209449 ) ( ON ?auto_209447 ?auto_209453 ) ( CLEAR ?auto_209447 ) ( not ( = ?auto_209447 ?auto_209453 ) ) ( not ( = ?auto_209448 ?auto_209453 ) ) ( not ( = ?auto_209446 ?auto_209453 ) ) ( not ( = ?auto_209454 ?auto_209453 ) ) ( TRUCK-AT ?auto_209455 ?auto_209451 ) ( ON ?auto_209445 ?auto_209444 ) ( ON ?auto_209446 ?auto_209445 ) ( not ( = ?auto_209444 ?auto_209445 ) ) ( not ( = ?auto_209444 ?auto_209446 ) ) ( not ( = ?auto_209444 ?auto_209447 ) ) ( not ( = ?auto_209444 ?auto_209448 ) ) ( not ( = ?auto_209444 ?auto_209454 ) ) ( not ( = ?auto_209444 ?auto_209453 ) ) ( not ( = ?auto_209445 ?auto_209446 ) ) ( not ( = ?auto_209445 ?auto_209447 ) ) ( not ( = ?auto_209445 ?auto_209448 ) ) ( not ( = ?auto_209445 ?auto_209454 ) ) ( not ( = ?auto_209445 ?auto_209453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209446 ?auto_209447 ?auto_209448 )
      ( MAKE-4CRATE-VERIFY ?auto_209444 ?auto_209445 ?auto_209446 ?auto_209447 ?auto_209448 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_209456 - SURFACE
      ?auto_209457 - SURFACE
      ?auto_209458 - SURFACE
      ?auto_209459 - SURFACE
      ?auto_209460 - SURFACE
      ?auto_209461 - SURFACE
    )
    :vars
    (
      ?auto_209463 - HOIST
      ?auto_209464 - PLACE
      ?auto_209462 - PLACE
      ?auto_209465 - HOIST
      ?auto_209467 - SURFACE
      ?auto_209466 - SURFACE
      ?auto_209468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209463 ?auto_209464 ) ( IS-CRATE ?auto_209461 ) ( not ( = ?auto_209460 ?auto_209461 ) ) ( not ( = ?auto_209459 ?auto_209460 ) ) ( not ( = ?auto_209459 ?auto_209461 ) ) ( not ( = ?auto_209462 ?auto_209464 ) ) ( HOIST-AT ?auto_209465 ?auto_209462 ) ( not ( = ?auto_209463 ?auto_209465 ) ) ( SURFACE-AT ?auto_209461 ?auto_209462 ) ( ON ?auto_209461 ?auto_209467 ) ( CLEAR ?auto_209461 ) ( not ( = ?auto_209460 ?auto_209467 ) ) ( not ( = ?auto_209461 ?auto_209467 ) ) ( not ( = ?auto_209459 ?auto_209467 ) ) ( SURFACE-AT ?auto_209459 ?auto_209464 ) ( CLEAR ?auto_209459 ) ( IS-CRATE ?auto_209460 ) ( AVAILABLE ?auto_209463 ) ( AVAILABLE ?auto_209465 ) ( SURFACE-AT ?auto_209460 ?auto_209462 ) ( ON ?auto_209460 ?auto_209466 ) ( CLEAR ?auto_209460 ) ( not ( = ?auto_209460 ?auto_209466 ) ) ( not ( = ?auto_209461 ?auto_209466 ) ) ( not ( = ?auto_209459 ?auto_209466 ) ) ( not ( = ?auto_209467 ?auto_209466 ) ) ( TRUCK-AT ?auto_209468 ?auto_209464 ) ( ON ?auto_209457 ?auto_209456 ) ( ON ?auto_209458 ?auto_209457 ) ( ON ?auto_209459 ?auto_209458 ) ( not ( = ?auto_209456 ?auto_209457 ) ) ( not ( = ?auto_209456 ?auto_209458 ) ) ( not ( = ?auto_209456 ?auto_209459 ) ) ( not ( = ?auto_209456 ?auto_209460 ) ) ( not ( = ?auto_209456 ?auto_209461 ) ) ( not ( = ?auto_209456 ?auto_209467 ) ) ( not ( = ?auto_209456 ?auto_209466 ) ) ( not ( = ?auto_209457 ?auto_209458 ) ) ( not ( = ?auto_209457 ?auto_209459 ) ) ( not ( = ?auto_209457 ?auto_209460 ) ) ( not ( = ?auto_209457 ?auto_209461 ) ) ( not ( = ?auto_209457 ?auto_209467 ) ) ( not ( = ?auto_209457 ?auto_209466 ) ) ( not ( = ?auto_209458 ?auto_209459 ) ) ( not ( = ?auto_209458 ?auto_209460 ) ) ( not ( = ?auto_209458 ?auto_209461 ) ) ( not ( = ?auto_209458 ?auto_209467 ) ) ( not ( = ?auto_209458 ?auto_209466 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209459 ?auto_209460 ?auto_209461 )
      ( MAKE-5CRATE-VERIFY ?auto_209456 ?auto_209457 ?auto_209458 ?auto_209459 ?auto_209460 ?auto_209461 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_209469 - SURFACE
      ?auto_209470 - SURFACE
      ?auto_209471 - SURFACE
      ?auto_209472 - SURFACE
      ?auto_209473 - SURFACE
      ?auto_209474 - SURFACE
      ?auto_209475 - SURFACE
    )
    :vars
    (
      ?auto_209477 - HOIST
      ?auto_209478 - PLACE
      ?auto_209476 - PLACE
      ?auto_209479 - HOIST
      ?auto_209481 - SURFACE
      ?auto_209480 - SURFACE
      ?auto_209482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209477 ?auto_209478 ) ( IS-CRATE ?auto_209475 ) ( not ( = ?auto_209474 ?auto_209475 ) ) ( not ( = ?auto_209473 ?auto_209474 ) ) ( not ( = ?auto_209473 ?auto_209475 ) ) ( not ( = ?auto_209476 ?auto_209478 ) ) ( HOIST-AT ?auto_209479 ?auto_209476 ) ( not ( = ?auto_209477 ?auto_209479 ) ) ( SURFACE-AT ?auto_209475 ?auto_209476 ) ( ON ?auto_209475 ?auto_209481 ) ( CLEAR ?auto_209475 ) ( not ( = ?auto_209474 ?auto_209481 ) ) ( not ( = ?auto_209475 ?auto_209481 ) ) ( not ( = ?auto_209473 ?auto_209481 ) ) ( SURFACE-AT ?auto_209473 ?auto_209478 ) ( CLEAR ?auto_209473 ) ( IS-CRATE ?auto_209474 ) ( AVAILABLE ?auto_209477 ) ( AVAILABLE ?auto_209479 ) ( SURFACE-AT ?auto_209474 ?auto_209476 ) ( ON ?auto_209474 ?auto_209480 ) ( CLEAR ?auto_209474 ) ( not ( = ?auto_209474 ?auto_209480 ) ) ( not ( = ?auto_209475 ?auto_209480 ) ) ( not ( = ?auto_209473 ?auto_209480 ) ) ( not ( = ?auto_209481 ?auto_209480 ) ) ( TRUCK-AT ?auto_209482 ?auto_209478 ) ( ON ?auto_209470 ?auto_209469 ) ( ON ?auto_209471 ?auto_209470 ) ( ON ?auto_209472 ?auto_209471 ) ( ON ?auto_209473 ?auto_209472 ) ( not ( = ?auto_209469 ?auto_209470 ) ) ( not ( = ?auto_209469 ?auto_209471 ) ) ( not ( = ?auto_209469 ?auto_209472 ) ) ( not ( = ?auto_209469 ?auto_209473 ) ) ( not ( = ?auto_209469 ?auto_209474 ) ) ( not ( = ?auto_209469 ?auto_209475 ) ) ( not ( = ?auto_209469 ?auto_209481 ) ) ( not ( = ?auto_209469 ?auto_209480 ) ) ( not ( = ?auto_209470 ?auto_209471 ) ) ( not ( = ?auto_209470 ?auto_209472 ) ) ( not ( = ?auto_209470 ?auto_209473 ) ) ( not ( = ?auto_209470 ?auto_209474 ) ) ( not ( = ?auto_209470 ?auto_209475 ) ) ( not ( = ?auto_209470 ?auto_209481 ) ) ( not ( = ?auto_209470 ?auto_209480 ) ) ( not ( = ?auto_209471 ?auto_209472 ) ) ( not ( = ?auto_209471 ?auto_209473 ) ) ( not ( = ?auto_209471 ?auto_209474 ) ) ( not ( = ?auto_209471 ?auto_209475 ) ) ( not ( = ?auto_209471 ?auto_209481 ) ) ( not ( = ?auto_209471 ?auto_209480 ) ) ( not ( = ?auto_209472 ?auto_209473 ) ) ( not ( = ?auto_209472 ?auto_209474 ) ) ( not ( = ?auto_209472 ?auto_209475 ) ) ( not ( = ?auto_209472 ?auto_209481 ) ) ( not ( = ?auto_209472 ?auto_209480 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209473 ?auto_209474 ?auto_209475 )
      ( MAKE-6CRATE-VERIFY ?auto_209469 ?auto_209470 ?auto_209471 ?auto_209472 ?auto_209473 ?auto_209474 ?auto_209475 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_209483 - SURFACE
      ?auto_209484 - SURFACE
    )
    :vars
    (
      ?auto_209486 - HOIST
      ?auto_209487 - PLACE
      ?auto_209490 - SURFACE
      ?auto_209485 - PLACE
      ?auto_209488 - HOIST
      ?auto_209491 - SURFACE
      ?auto_209489 - SURFACE
      ?auto_209492 - TRUCK
      ?auto_209493 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_209486 ?auto_209487 ) ( IS-CRATE ?auto_209484 ) ( not ( = ?auto_209483 ?auto_209484 ) ) ( not ( = ?auto_209490 ?auto_209483 ) ) ( not ( = ?auto_209490 ?auto_209484 ) ) ( not ( = ?auto_209485 ?auto_209487 ) ) ( HOIST-AT ?auto_209488 ?auto_209485 ) ( not ( = ?auto_209486 ?auto_209488 ) ) ( SURFACE-AT ?auto_209484 ?auto_209485 ) ( ON ?auto_209484 ?auto_209491 ) ( CLEAR ?auto_209484 ) ( not ( = ?auto_209483 ?auto_209491 ) ) ( not ( = ?auto_209484 ?auto_209491 ) ) ( not ( = ?auto_209490 ?auto_209491 ) ) ( IS-CRATE ?auto_209483 ) ( AVAILABLE ?auto_209488 ) ( SURFACE-AT ?auto_209483 ?auto_209485 ) ( ON ?auto_209483 ?auto_209489 ) ( CLEAR ?auto_209483 ) ( not ( = ?auto_209483 ?auto_209489 ) ) ( not ( = ?auto_209484 ?auto_209489 ) ) ( not ( = ?auto_209490 ?auto_209489 ) ) ( not ( = ?auto_209491 ?auto_209489 ) ) ( TRUCK-AT ?auto_209492 ?auto_209487 ) ( SURFACE-AT ?auto_209493 ?auto_209487 ) ( CLEAR ?auto_209493 ) ( LIFTING ?auto_209486 ?auto_209490 ) ( IS-CRATE ?auto_209490 ) ( not ( = ?auto_209493 ?auto_209490 ) ) ( not ( = ?auto_209483 ?auto_209493 ) ) ( not ( = ?auto_209484 ?auto_209493 ) ) ( not ( = ?auto_209491 ?auto_209493 ) ) ( not ( = ?auto_209489 ?auto_209493 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_209493 ?auto_209490 )
      ( MAKE-2CRATE ?auto_209490 ?auto_209483 ?auto_209484 )
      ( MAKE-1CRATE-VERIFY ?auto_209483 ?auto_209484 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_209494 - SURFACE
      ?auto_209495 - SURFACE
      ?auto_209496 - SURFACE
    )
    :vars
    (
      ?auto_209501 - HOIST
      ?auto_209499 - PLACE
      ?auto_209502 - PLACE
      ?auto_209500 - HOIST
      ?auto_209503 - SURFACE
      ?auto_209498 - SURFACE
      ?auto_209504 - TRUCK
      ?auto_209497 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_209501 ?auto_209499 ) ( IS-CRATE ?auto_209496 ) ( not ( = ?auto_209495 ?auto_209496 ) ) ( not ( = ?auto_209494 ?auto_209495 ) ) ( not ( = ?auto_209494 ?auto_209496 ) ) ( not ( = ?auto_209502 ?auto_209499 ) ) ( HOIST-AT ?auto_209500 ?auto_209502 ) ( not ( = ?auto_209501 ?auto_209500 ) ) ( SURFACE-AT ?auto_209496 ?auto_209502 ) ( ON ?auto_209496 ?auto_209503 ) ( CLEAR ?auto_209496 ) ( not ( = ?auto_209495 ?auto_209503 ) ) ( not ( = ?auto_209496 ?auto_209503 ) ) ( not ( = ?auto_209494 ?auto_209503 ) ) ( IS-CRATE ?auto_209495 ) ( AVAILABLE ?auto_209500 ) ( SURFACE-AT ?auto_209495 ?auto_209502 ) ( ON ?auto_209495 ?auto_209498 ) ( CLEAR ?auto_209495 ) ( not ( = ?auto_209495 ?auto_209498 ) ) ( not ( = ?auto_209496 ?auto_209498 ) ) ( not ( = ?auto_209494 ?auto_209498 ) ) ( not ( = ?auto_209503 ?auto_209498 ) ) ( TRUCK-AT ?auto_209504 ?auto_209499 ) ( SURFACE-AT ?auto_209497 ?auto_209499 ) ( CLEAR ?auto_209497 ) ( LIFTING ?auto_209501 ?auto_209494 ) ( IS-CRATE ?auto_209494 ) ( not ( = ?auto_209497 ?auto_209494 ) ) ( not ( = ?auto_209495 ?auto_209497 ) ) ( not ( = ?auto_209496 ?auto_209497 ) ) ( not ( = ?auto_209503 ?auto_209497 ) ) ( not ( = ?auto_209498 ?auto_209497 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_209495 ?auto_209496 )
      ( MAKE-2CRATE-VERIFY ?auto_209494 ?auto_209495 ?auto_209496 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_209505 - SURFACE
      ?auto_209506 - SURFACE
      ?auto_209507 - SURFACE
      ?auto_209508 - SURFACE
    )
    :vars
    (
      ?auto_209509 - HOIST
      ?auto_209511 - PLACE
      ?auto_209514 - PLACE
      ?auto_209513 - HOIST
      ?auto_209512 - SURFACE
      ?auto_209515 - SURFACE
      ?auto_209510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209509 ?auto_209511 ) ( IS-CRATE ?auto_209508 ) ( not ( = ?auto_209507 ?auto_209508 ) ) ( not ( = ?auto_209506 ?auto_209507 ) ) ( not ( = ?auto_209506 ?auto_209508 ) ) ( not ( = ?auto_209514 ?auto_209511 ) ) ( HOIST-AT ?auto_209513 ?auto_209514 ) ( not ( = ?auto_209509 ?auto_209513 ) ) ( SURFACE-AT ?auto_209508 ?auto_209514 ) ( ON ?auto_209508 ?auto_209512 ) ( CLEAR ?auto_209508 ) ( not ( = ?auto_209507 ?auto_209512 ) ) ( not ( = ?auto_209508 ?auto_209512 ) ) ( not ( = ?auto_209506 ?auto_209512 ) ) ( IS-CRATE ?auto_209507 ) ( AVAILABLE ?auto_209513 ) ( SURFACE-AT ?auto_209507 ?auto_209514 ) ( ON ?auto_209507 ?auto_209515 ) ( CLEAR ?auto_209507 ) ( not ( = ?auto_209507 ?auto_209515 ) ) ( not ( = ?auto_209508 ?auto_209515 ) ) ( not ( = ?auto_209506 ?auto_209515 ) ) ( not ( = ?auto_209512 ?auto_209515 ) ) ( TRUCK-AT ?auto_209510 ?auto_209511 ) ( SURFACE-AT ?auto_209505 ?auto_209511 ) ( CLEAR ?auto_209505 ) ( LIFTING ?auto_209509 ?auto_209506 ) ( IS-CRATE ?auto_209506 ) ( not ( = ?auto_209505 ?auto_209506 ) ) ( not ( = ?auto_209507 ?auto_209505 ) ) ( not ( = ?auto_209508 ?auto_209505 ) ) ( not ( = ?auto_209512 ?auto_209505 ) ) ( not ( = ?auto_209515 ?auto_209505 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209506 ?auto_209507 ?auto_209508 )
      ( MAKE-3CRATE-VERIFY ?auto_209505 ?auto_209506 ?auto_209507 ?auto_209508 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_209516 - SURFACE
      ?auto_209517 - SURFACE
      ?auto_209518 - SURFACE
      ?auto_209519 - SURFACE
      ?auto_209520 - SURFACE
    )
    :vars
    (
      ?auto_209521 - HOIST
      ?auto_209523 - PLACE
      ?auto_209526 - PLACE
      ?auto_209525 - HOIST
      ?auto_209524 - SURFACE
      ?auto_209527 - SURFACE
      ?auto_209522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209521 ?auto_209523 ) ( IS-CRATE ?auto_209520 ) ( not ( = ?auto_209519 ?auto_209520 ) ) ( not ( = ?auto_209518 ?auto_209519 ) ) ( not ( = ?auto_209518 ?auto_209520 ) ) ( not ( = ?auto_209526 ?auto_209523 ) ) ( HOIST-AT ?auto_209525 ?auto_209526 ) ( not ( = ?auto_209521 ?auto_209525 ) ) ( SURFACE-AT ?auto_209520 ?auto_209526 ) ( ON ?auto_209520 ?auto_209524 ) ( CLEAR ?auto_209520 ) ( not ( = ?auto_209519 ?auto_209524 ) ) ( not ( = ?auto_209520 ?auto_209524 ) ) ( not ( = ?auto_209518 ?auto_209524 ) ) ( IS-CRATE ?auto_209519 ) ( AVAILABLE ?auto_209525 ) ( SURFACE-AT ?auto_209519 ?auto_209526 ) ( ON ?auto_209519 ?auto_209527 ) ( CLEAR ?auto_209519 ) ( not ( = ?auto_209519 ?auto_209527 ) ) ( not ( = ?auto_209520 ?auto_209527 ) ) ( not ( = ?auto_209518 ?auto_209527 ) ) ( not ( = ?auto_209524 ?auto_209527 ) ) ( TRUCK-AT ?auto_209522 ?auto_209523 ) ( SURFACE-AT ?auto_209517 ?auto_209523 ) ( CLEAR ?auto_209517 ) ( LIFTING ?auto_209521 ?auto_209518 ) ( IS-CRATE ?auto_209518 ) ( not ( = ?auto_209517 ?auto_209518 ) ) ( not ( = ?auto_209519 ?auto_209517 ) ) ( not ( = ?auto_209520 ?auto_209517 ) ) ( not ( = ?auto_209524 ?auto_209517 ) ) ( not ( = ?auto_209527 ?auto_209517 ) ) ( ON ?auto_209517 ?auto_209516 ) ( not ( = ?auto_209516 ?auto_209517 ) ) ( not ( = ?auto_209516 ?auto_209518 ) ) ( not ( = ?auto_209516 ?auto_209519 ) ) ( not ( = ?auto_209516 ?auto_209520 ) ) ( not ( = ?auto_209516 ?auto_209524 ) ) ( not ( = ?auto_209516 ?auto_209527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209518 ?auto_209519 ?auto_209520 )
      ( MAKE-4CRATE-VERIFY ?auto_209516 ?auto_209517 ?auto_209518 ?auto_209519 ?auto_209520 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_209528 - SURFACE
      ?auto_209529 - SURFACE
      ?auto_209530 - SURFACE
      ?auto_209531 - SURFACE
      ?auto_209532 - SURFACE
      ?auto_209533 - SURFACE
    )
    :vars
    (
      ?auto_209534 - HOIST
      ?auto_209536 - PLACE
      ?auto_209539 - PLACE
      ?auto_209538 - HOIST
      ?auto_209537 - SURFACE
      ?auto_209540 - SURFACE
      ?auto_209535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209534 ?auto_209536 ) ( IS-CRATE ?auto_209533 ) ( not ( = ?auto_209532 ?auto_209533 ) ) ( not ( = ?auto_209531 ?auto_209532 ) ) ( not ( = ?auto_209531 ?auto_209533 ) ) ( not ( = ?auto_209539 ?auto_209536 ) ) ( HOIST-AT ?auto_209538 ?auto_209539 ) ( not ( = ?auto_209534 ?auto_209538 ) ) ( SURFACE-AT ?auto_209533 ?auto_209539 ) ( ON ?auto_209533 ?auto_209537 ) ( CLEAR ?auto_209533 ) ( not ( = ?auto_209532 ?auto_209537 ) ) ( not ( = ?auto_209533 ?auto_209537 ) ) ( not ( = ?auto_209531 ?auto_209537 ) ) ( IS-CRATE ?auto_209532 ) ( AVAILABLE ?auto_209538 ) ( SURFACE-AT ?auto_209532 ?auto_209539 ) ( ON ?auto_209532 ?auto_209540 ) ( CLEAR ?auto_209532 ) ( not ( = ?auto_209532 ?auto_209540 ) ) ( not ( = ?auto_209533 ?auto_209540 ) ) ( not ( = ?auto_209531 ?auto_209540 ) ) ( not ( = ?auto_209537 ?auto_209540 ) ) ( TRUCK-AT ?auto_209535 ?auto_209536 ) ( SURFACE-AT ?auto_209530 ?auto_209536 ) ( CLEAR ?auto_209530 ) ( LIFTING ?auto_209534 ?auto_209531 ) ( IS-CRATE ?auto_209531 ) ( not ( = ?auto_209530 ?auto_209531 ) ) ( not ( = ?auto_209532 ?auto_209530 ) ) ( not ( = ?auto_209533 ?auto_209530 ) ) ( not ( = ?auto_209537 ?auto_209530 ) ) ( not ( = ?auto_209540 ?auto_209530 ) ) ( ON ?auto_209529 ?auto_209528 ) ( ON ?auto_209530 ?auto_209529 ) ( not ( = ?auto_209528 ?auto_209529 ) ) ( not ( = ?auto_209528 ?auto_209530 ) ) ( not ( = ?auto_209528 ?auto_209531 ) ) ( not ( = ?auto_209528 ?auto_209532 ) ) ( not ( = ?auto_209528 ?auto_209533 ) ) ( not ( = ?auto_209528 ?auto_209537 ) ) ( not ( = ?auto_209528 ?auto_209540 ) ) ( not ( = ?auto_209529 ?auto_209530 ) ) ( not ( = ?auto_209529 ?auto_209531 ) ) ( not ( = ?auto_209529 ?auto_209532 ) ) ( not ( = ?auto_209529 ?auto_209533 ) ) ( not ( = ?auto_209529 ?auto_209537 ) ) ( not ( = ?auto_209529 ?auto_209540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209531 ?auto_209532 ?auto_209533 )
      ( MAKE-5CRATE-VERIFY ?auto_209528 ?auto_209529 ?auto_209530 ?auto_209531 ?auto_209532 ?auto_209533 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_209541 - SURFACE
      ?auto_209542 - SURFACE
      ?auto_209543 - SURFACE
      ?auto_209544 - SURFACE
      ?auto_209545 - SURFACE
      ?auto_209546 - SURFACE
      ?auto_209547 - SURFACE
    )
    :vars
    (
      ?auto_209548 - HOIST
      ?auto_209550 - PLACE
      ?auto_209553 - PLACE
      ?auto_209552 - HOIST
      ?auto_209551 - SURFACE
      ?auto_209554 - SURFACE
      ?auto_209549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_209548 ?auto_209550 ) ( IS-CRATE ?auto_209547 ) ( not ( = ?auto_209546 ?auto_209547 ) ) ( not ( = ?auto_209545 ?auto_209546 ) ) ( not ( = ?auto_209545 ?auto_209547 ) ) ( not ( = ?auto_209553 ?auto_209550 ) ) ( HOIST-AT ?auto_209552 ?auto_209553 ) ( not ( = ?auto_209548 ?auto_209552 ) ) ( SURFACE-AT ?auto_209547 ?auto_209553 ) ( ON ?auto_209547 ?auto_209551 ) ( CLEAR ?auto_209547 ) ( not ( = ?auto_209546 ?auto_209551 ) ) ( not ( = ?auto_209547 ?auto_209551 ) ) ( not ( = ?auto_209545 ?auto_209551 ) ) ( IS-CRATE ?auto_209546 ) ( AVAILABLE ?auto_209552 ) ( SURFACE-AT ?auto_209546 ?auto_209553 ) ( ON ?auto_209546 ?auto_209554 ) ( CLEAR ?auto_209546 ) ( not ( = ?auto_209546 ?auto_209554 ) ) ( not ( = ?auto_209547 ?auto_209554 ) ) ( not ( = ?auto_209545 ?auto_209554 ) ) ( not ( = ?auto_209551 ?auto_209554 ) ) ( TRUCK-AT ?auto_209549 ?auto_209550 ) ( SURFACE-AT ?auto_209544 ?auto_209550 ) ( CLEAR ?auto_209544 ) ( LIFTING ?auto_209548 ?auto_209545 ) ( IS-CRATE ?auto_209545 ) ( not ( = ?auto_209544 ?auto_209545 ) ) ( not ( = ?auto_209546 ?auto_209544 ) ) ( not ( = ?auto_209547 ?auto_209544 ) ) ( not ( = ?auto_209551 ?auto_209544 ) ) ( not ( = ?auto_209554 ?auto_209544 ) ) ( ON ?auto_209542 ?auto_209541 ) ( ON ?auto_209543 ?auto_209542 ) ( ON ?auto_209544 ?auto_209543 ) ( not ( = ?auto_209541 ?auto_209542 ) ) ( not ( = ?auto_209541 ?auto_209543 ) ) ( not ( = ?auto_209541 ?auto_209544 ) ) ( not ( = ?auto_209541 ?auto_209545 ) ) ( not ( = ?auto_209541 ?auto_209546 ) ) ( not ( = ?auto_209541 ?auto_209547 ) ) ( not ( = ?auto_209541 ?auto_209551 ) ) ( not ( = ?auto_209541 ?auto_209554 ) ) ( not ( = ?auto_209542 ?auto_209543 ) ) ( not ( = ?auto_209542 ?auto_209544 ) ) ( not ( = ?auto_209542 ?auto_209545 ) ) ( not ( = ?auto_209542 ?auto_209546 ) ) ( not ( = ?auto_209542 ?auto_209547 ) ) ( not ( = ?auto_209542 ?auto_209551 ) ) ( not ( = ?auto_209542 ?auto_209554 ) ) ( not ( = ?auto_209543 ?auto_209544 ) ) ( not ( = ?auto_209543 ?auto_209545 ) ) ( not ( = ?auto_209543 ?auto_209546 ) ) ( not ( = ?auto_209543 ?auto_209547 ) ) ( not ( = ?auto_209543 ?auto_209551 ) ) ( not ( = ?auto_209543 ?auto_209554 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_209545 ?auto_209546 ?auto_209547 )
      ( MAKE-6CRATE-VERIFY ?auto_209541 ?auto_209542 ?auto_209543 ?auto_209544 ?auto_209545 ?auto_209546 ?auto_209547 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_210046 - SURFACE
      ?auto_210047 - SURFACE
    )
    :vars
    (
      ?auto_210054 - HOIST
      ?auto_210052 - PLACE
      ?auto_210048 - SURFACE
      ?auto_210053 - PLACE
      ?auto_210055 - HOIST
      ?auto_210051 - SURFACE
      ?auto_210049 - TRUCK
      ?auto_210050 - SURFACE
      ?auto_210056 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_210054 ?auto_210052 ) ( IS-CRATE ?auto_210047 ) ( not ( = ?auto_210046 ?auto_210047 ) ) ( not ( = ?auto_210048 ?auto_210046 ) ) ( not ( = ?auto_210048 ?auto_210047 ) ) ( not ( = ?auto_210053 ?auto_210052 ) ) ( HOIST-AT ?auto_210055 ?auto_210053 ) ( not ( = ?auto_210054 ?auto_210055 ) ) ( SURFACE-AT ?auto_210047 ?auto_210053 ) ( ON ?auto_210047 ?auto_210051 ) ( CLEAR ?auto_210047 ) ( not ( = ?auto_210046 ?auto_210051 ) ) ( not ( = ?auto_210047 ?auto_210051 ) ) ( not ( = ?auto_210048 ?auto_210051 ) ) ( SURFACE-AT ?auto_210048 ?auto_210052 ) ( CLEAR ?auto_210048 ) ( IS-CRATE ?auto_210046 ) ( AVAILABLE ?auto_210054 ) ( TRUCK-AT ?auto_210049 ?auto_210053 ) ( SURFACE-AT ?auto_210046 ?auto_210053 ) ( ON ?auto_210046 ?auto_210050 ) ( CLEAR ?auto_210046 ) ( not ( = ?auto_210046 ?auto_210050 ) ) ( not ( = ?auto_210047 ?auto_210050 ) ) ( not ( = ?auto_210048 ?auto_210050 ) ) ( not ( = ?auto_210051 ?auto_210050 ) ) ( LIFTING ?auto_210055 ?auto_210056 ) ( IS-CRATE ?auto_210056 ) ( not ( = ?auto_210046 ?auto_210056 ) ) ( not ( = ?auto_210047 ?auto_210056 ) ) ( not ( = ?auto_210048 ?auto_210056 ) ) ( not ( = ?auto_210051 ?auto_210056 ) ) ( not ( = ?auto_210050 ?auto_210056 ) ) )
    :subtasks
    ( ( !LOAD ?auto_210055 ?auto_210056 ?auto_210049 ?auto_210053 )
      ( MAKE-2CRATE ?auto_210048 ?auto_210046 ?auto_210047 )
      ( MAKE-1CRATE-VERIFY ?auto_210046 ?auto_210047 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_210057 - SURFACE
      ?auto_210058 - SURFACE
      ?auto_210059 - SURFACE
    )
    :vars
    (
      ?auto_210062 - HOIST
      ?auto_210061 - PLACE
      ?auto_210063 - PLACE
      ?auto_210060 - HOIST
      ?auto_210064 - SURFACE
      ?auto_210065 - TRUCK
      ?auto_210066 - SURFACE
      ?auto_210067 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_210062 ?auto_210061 ) ( IS-CRATE ?auto_210059 ) ( not ( = ?auto_210058 ?auto_210059 ) ) ( not ( = ?auto_210057 ?auto_210058 ) ) ( not ( = ?auto_210057 ?auto_210059 ) ) ( not ( = ?auto_210063 ?auto_210061 ) ) ( HOIST-AT ?auto_210060 ?auto_210063 ) ( not ( = ?auto_210062 ?auto_210060 ) ) ( SURFACE-AT ?auto_210059 ?auto_210063 ) ( ON ?auto_210059 ?auto_210064 ) ( CLEAR ?auto_210059 ) ( not ( = ?auto_210058 ?auto_210064 ) ) ( not ( = ?auto_210059 ?auto_210064 ) ) ( not ( = ?auto_210057 ?auto_210064 ) ) ( SURFACE-AT ?auto_210057 ?auto_210061 ) ( CLEAR ?auto_210057 ) ( IS-CRATE ?auto_210058 ) ( AVAILABLE ?auto_210062 ) ( TRUCK-AT ?auto_210065 ?auto_210063 ) ( SURFACE-AT ?auto_210058 ?auto_210063 ) ( ON ?auto_210058 ?auto_210066 ) ( CLEAR ?auto_210058 ) ( not ( = ?auto_210058 ?auto_210066 ) ) ( not ( = ?auto_210059 ?auto_210066 ) ) ( not ( = ?auto_210057 ?auto_210066 ) ) ( not ( = ?auto_210064 ?auto_210066 ) ) ( LIFTING ?auto_210060 ?auto_210067 ) ( IS-CRATE ?auto_210067 ) ( not ( = ?auto_210058 ?auto_210067 ) ) ( not ( = ?auto_210059 ?auto_210067 ) ) ( not ( = ?auto_210057 ?auto_210067 ) ) ( not ( = ?auto_210064 ?auto_210067 ) ) ( not ( = ?auto_210066 ?auto_210067 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_210058 ?auto_210059 )
      ( MAKE-2CRATE-VERIFY ?auto_210057 ?auto_210058 ?auto_210059 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211111 - SURFACE
      ?auto_211112 - SURFACE
      ?auto_211113 - SURFACE
      ?auto_211114 - SURFACE
      ?auto_211115 - SURFACE
      ?auto_211116 - SURFACE
      ?auto_211117 - SURFACE
      ?auto_211118 - SURFACE
    )
    :vars
    (
      ?auto_211120 - HOIST
      ?auto_211119 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_211120 ?auto_211119 ) ( SURFACE-AT ?auto_211117 ?auto_211119 ) ( CLEAR ?auto_211117 ) ( LIFTING ?auto_211120 ?auto_211118 ) ( IS-CRATE ?auto_211118 ) ( not ( = ?auto_211117 ?auto_211118 ) ) ( ON ?auto_211112 ?auto_211111 ) ( ON ?auto_211113 ?auto_211112 ) ( ON ?auto_211114 ?auto_211113 ) ( ON ?auto_211115 ?auto_211114 ) ( ON ?auto_211116 ?auto_211115 ) ( ON ?auto_211117 ?auto_211116 ) ( not ( = ?auto_211111 ?auto_211112 ) ) ( not ( = ?auto_211111 ?auto_211113 ) ) ( not ( = ?auto_211111 ?auto_211114 ) ) ( not ( = ?auto_211111 ?auto_211115 ) ) ( not ( = ?auto_211111 ?auto_211116 ) ) ( not ( = ?auto_211111 ?auto_211117 ) ) ( not ( = ?auto_211111 ?auto_211118 ) ) ( not ( = ?auto_211112 ?auto_211113 ) ) ( not ( = ?auto_211112 ?auto_211114 ) ) ( not ( = ?auto_211112 ?auto_211115 ) ) ( not ( = ?auto_211112 ?auto_211116 ) ) ( not ( = ?auto_211112 ?auto_211117 ) ) ( not ( = ?auto_211112 ?auto_211118 ) ) ( not ( = ?auto_211113 ?auto_211114 ) ) ( not ( = ?auto_211113 ?auto_211115 ) ) ( not ( = ?auto_211113 ?auto_211116 ) ) ( not ( = ?auto_211113 ?auto_211117 ) ) ( not ( = ?auto_211113 ?auto_211118 ) ) ( not ( = ?auto_211114 ?auto_211115 ) ) ( not ( = ?auto_211114 ?auto_211116 ) ) ( not ( = ?auto_211114 ?auto_211117 ) ) ( not ( = ?auto_211114 ?auto_211118 ) ) ( not ( = ?auto_211115 ?auto_211116 ) ) ( not ( = ?auto_211115 ?auto_211117 ) ) ( not ( = ?auto_211115 ?auto_211118 ) ) ( not ( = ?auto_211116 ?auto_211117 ) ) ( not ( = ?auto_211116 ?auto_211118 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_211117 ?auto_211118 )
      ( MAKE-7CRATE-VERIFY ?auto_211111 ?auto_211112 ?auto_211113 ?auto_211114 ?auto_211115 ?auto_211116 ?auto_211117 ?auto_211118 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211166 - SURFACE
      ?auto_211167 - SURFACE
      ?auto_211168 - SURFACE
      ?auto_211169 - SURFACE
      ?auto_211170 - SURFACE
      ?auto_211171 - SURFACE
      ?auto_211172 - SURFACE
      ?auto_211173 - SURFACE
    )
    :vars
    (
      ?auto_211176 - HOIST
      ?auto_211174 - PLACE
      ?auto_211175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_211176 ?auto_211174 ) ( SURFACE-AT ?auto_211172 ?auto_211174 ) ( CLEAR ?auto_211172 ) ( IS-CRATE ?auto_211173 ) ( not ( = ?auto_211172 ?auto_211173 ) ) ( TRUCK-AT ?auto_211175 ?auto_211174 ) ( AVAILABLE ?auto_211176 ) ( IN ?auto_211173 ?auto_211175 ) ( ON ?auto_211172 ?auto_211171 ) ( not ( = ?auto_211171 ?auto_211172 ) ) ( not ( = ?auto_211171 ?auto_211173 ) ) ( ON ?auto_211167 ?auto_211166 ) ( ON ?auto_211168 ?auto_211167 ) ( ON ?auto_211169 ?auto_211168 ) ( ON ?auto_211170 ?auto_211169 ) ( ON ?auto_211171 ?auto_211170 ) ( not ( = ?auto_211166 ?auto_211167 ) ) ( not ( = ?auto_211166 ?auto_211168 ) ) ( not ( = ?auto_211166 ?auto_211169 ) ) ( not ( = ?auto_211166 ?auto_211170 ) ) ( not ( = ?auto_211166 ?auto_211171 ) ) ( not ( = ?auto_211166 ?auto_211172 ) ) ( not ( = ?auto_211166 ?auto_211173 ) ) ( not ( = ?auto_211167 ?auto_211168 ) ) ( not ( = ?auto_211167 ?auto_211169 ) ) ( not ( = ?auto_211167 ?auto_211170 ) ) ( not ( = ?auto_211167 ?auto_211171 ) ) ( not ( = ?auto_211167 ?auto_211172 ) ) ( not ( = ?auto_211167 ?auto_211173 ) ) ( not ( = ?auto_211168 ?auto_211169 ) ) ( not ( = ?auto_211168 ?auto_211170 ) ) ( not ( = ?auto_211168 ?auto_211171 ) ) ( not ( = ?auto_211168 ?auto_211172 ) ) ( not ( = ?auto_211168 ?auto_211173 ) ) ( not ( = ?auto_211169 ?auto_211170 ) ) ( not ( = ?auto_211169 ?auto_211171 ) ) ( not ( = ?auto_211169 ?auto_211172 ) ) ( not ( = ?auto_211169 ?auto_211173 ) ) ( not ( = ?auto_211170 ?auto_211171 ) ) ( not ( = ?auto_211170 ?auto_211172 ) ) ( not ( = ?auto_211170 ?auto_211173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211171 ?auto_211172 ?auto_211173 )
      ( MAKE-7CRATE-VERIFY ?auto_211166 ?auto_211167 ?auto_211168 ?auto_211169 ?auto_211170 ?auto_211171 ?auto_211172 ?auto_211173 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211229 - SURFACE
      ?auto_211230 - SURFACE
      ?auto_211231 - SURFACE
      ?auto_211232 - SURFACE
      ?auto_211233 - SURFACE
      ?auto_211234 - SURFACE
      ?auto_211235 - SURFACE
      ?auto_211236 - SURFACE
    )
    :vars
    (
      ?auto_211238 - HOIST
      ?auto_211240 - PLACE
      ?auto_211237 - TRUCK
      ?auto_211239 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_211238 ?auto_211240 ) ( SURFACE-AT ?auto_211235 ?auto_211240 ) ( CLEAR ?auto_211235 ) ( IS-CRATE ?auto_211236 ) ( not ( = ?auto_211235 ?auto_211236 ) ) ( AVAILABLE ?auto_211238 ) ( IN ?auto_211236 ?auto_211237 ) ( ON ?auto_211235 ?auto_211234 ) ( not ( = ?auto_211234 ?auto_211235 ) ) ( not ( = ?auto_211234 ?auto_211236 ) ) ( TRUCK-AT ?auto_211237 ?auto_211239 ) ( not ( = ?auto_211239 ?auto_211240 ) ) ( ON ?auto_211230 ?auto_211229 ) ( ON ?auto_211231 ?auto_211230 ) ( ON ?auto_211232 ?auto_211231 ) ( ON ?auto_211233 ?auto_211232 ) ( ON ?auto_211234 ?auto_211233 ) ( not ( = ?auto_211229 ?auto_211230 ) ) ( not ( = ?auto_211229 ?auto_211231 ) ) ( not ( = ?auto_211229 ?auto_211232 ) ) ( not ( = ?auto_211229 ?auto_211233 ) ) ( not ( = ?auto_211229 ?auto_211234 ) ) ( not ( = ?auto_211229 ?auto_211235 ) ) ( not ( = ?auto_211229 ?auto_211236 ) ) ( not ( = ?auto_211230 ?auto_211231 ) ) ( not ( = ?auto_211230 ?auto_211232 ) ) ( not ( = ?auto_211230 ?auto_211233 ) ) ( not ( = ?auto_211230 ?auto_211234 ) ) ( not ( = ?auto_211230 ?auto_211235 ) ) ( not ( = ?auto_211230 ?auto_211236 ) ) ( not ( = ?auto_211231 ?auto_211232 ) ) ( not ( = ?auto_211231 ?auto_211233 ) ) ( not ( = ?auto_211231 ?auto_211234 ) ) ( not ( = ?auto_211231 ?auto_211235 ) ) ( not ( = ?auto_211231 ?auto_211236 ) ) ( not ( = ?auto_211232 ?auto_211233 ) ) ( not ( = ?auto_211232 ?auto_211234 ) ) ( not ( = ?auto_211232 ?auto_211235 ) ) ( not ( = ?auto_211232 ?auto_211236 ) ) ( not ( = ?auto_211233 ?auto_211234 ) ) ( not ( = ?auto_211233 ?auto_211235 ) ) ( not ( = ?auto_211233 ?auto_211236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211234 ?auto_211235 ?auto_211236 )
      ( MAKE-7CRATE-VERIFY ?auto_211229 ?auto_211230 ?auto_211231 ?auto_211232 ?auto_211233 ?auto_211234 ?auto_211235 ?auto_211236 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211299 - SURFACE
      ?auto_211300 - SURFACE
      ?auto_211301 - SURFACE
      ?auto_211302 - SURFACE
      ?auto_211303 - SURFACE
      ?auto_211304 - SURFACE
      ?auto_211305 - SURFACE
      ?auto_211306 - SURFACE
    )
    :vars
    (
      ?auto_211310 - HOIST
      ?auto_211307 - PLACE
      ?auto_211308 - TRUCK
      ?auto_211311 - PLACE
      ?auto_211309 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_211310 ?auto_211307 ) ( SURFACE-AT ?auto_211305 ?auto_211307 ) ( CLEAR ?auto_211305 ) ( IS-CRATE ?auto_211306 ) ( not ( = ?auto_211305 ?auto_211306 ) ) ( AVAILABLE ?auto_211310 ) ( ON ?auto_211305 ?auto_211304 ) ( not ( = ?auto_211304 ?auto_211305 ) ) ( not ( = ?auto_211304 ?auto_211306 ) ) ( TRUCK-AT ?auto_211308 ?auto_211311 ) ( not ( = ?auto_211311 ?auto_211307 ) ) ( HOIST-AT ?auto_211309 ?auto_211311 ) ( LIFTING ?auto_211309 ?auto_211306 ) ( not ( = ?auto_211310 ?auto_211309 ) ) ( ON ?auto_211300 ?auto_211299 ) ( ON ?auto_211301 ?auto_211300 ) ( ON ?auto_211302 ?auto_211301 ) ( ON ?auto_211303 ?auto_211302 ) ( ON ?auto_211304 ?auto_211303 ) ( not ( = ?auto_211299 ?auto_211300 ) ) ( not ( = ?auto_211299 ?auto_211301 ) ) ( not ( = ?auto_211299 ?auto_211302 ) ) ( not ( = ?auto_211299 ?auto_211303 ) ) ( not ( = ?auto_211299 ?auto_211304 ) ) ( not ( = ?auto_211299 ?auto_211305 ) ) ( not ( = ?auto_211299 ?auto_211306 ) ) ( not ( = ?auto_211300 ?auto_211301 ) ) ( not ( = ?auto_211300 ?auto_211302 ) ) ( not ( = ?auto_211300 ?auto_211303 ) ) ( not ( = ?auto_211300 ?auto_211304 ) ) ( not ( = ?auto_211300 ?auto_211305 ) ) ( not ( = ?auto_211300 ?auto_211306 ) ) ( not ( = ?auto_211301 ?auto_211302 ) ) ( not ( = ?auto_211301 ?auto_211303 ) ) ( not ( = ?auto_211301 ?auto_211304 ) ) ( not ( = ?auto_211301 ?auto_211305 ) ) ( not ( = ?auto_211301 ?auto_211306 ) ) ( not ( = ?auto_211302 ?auto_211303 ) ) ( not ( = ?auto_211302 ?auto_211304 ) ) ( not ( = ?auto_211302 ?auto_211305 ) ) ( not ( = ?auto_211302 ?auto_211306 ) ) ( not ( = ?auto_211303 ?auto_211304 ) ) ( not ( = ?auto_211303 ?auto_211305 ) ) ( not ( = ?auto_211303 ?auto_211306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211304 ?auto_211305 ?auto_211306 )
      ( MAKE-7CRATE-VERIFY ?auto_211299 ?auto_211300 ?auto_211301 ?auto_211302 ?auto_211303 ?auto_211304 ?auto_211305 ?auto_211306 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211376 - SURFACE
      ?auto_211377 - SURFACE
      ?auto_211378 - SURFACE
      ?auto_211379 - SURFACE
      ?auto_211380 - SURFACE
      ?auto_211381 - SURFACE
      ?auto_211382 - SURFACE
      ?auto_211383 - SURFACE
    )
    :vars
    (
      ?auto_211385 - HOIST
      ?auto_211387 - PLACE
      ?auto_211386 - TRUCK
      ?auto_211389 - PLACE
      ?auto_211384 - HOIST
      ?auto_211388 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_211385 ?auto_211387 ) ( SURFACE-AT ?auto_211382 ?auto_211387 ) ( CLEAR ?auto_211382 ) ( IS-CRATE ?auto_211383 ) ( not ( = ?auto_211382 ?auto_211383 ) ) ( AVAILABLE ?auto_211385 ) ( ON ?auto_211382 ?auto_211381 ) ( not ( = ?auto_211381 ?auto_211382 ) ) ( not ( = ?auto_211381 ?auto_211383 ) ) ( TRUCK-AT ?auto_211386 ?auto_211389 ) ( not ( = ?auto_211389 ?auto_211387 ) ) ( HOIST-AT ?auto_211384 ?auto_211389 ) ( not ( = ?auto_211385 ?auto_211384 ) ) ( AVAILABLE ?auto_211384 ) ( SURFACE-AT ?auto_211383 ?auto_211389 ) ( ON ?auto_211383 ?auto_211388 ) ( CLEAR ?auto_211383 ) ( not ( = ?auto_211382 ?auto_211388 ) ) ( not ( = ?auto_211383 ?auto_211388 ) ) ( not ( = ?auto_211381 ?auto_211388 ) ) ( ON ?auto_211377 ?auto_211376 ) ( ON ?auto_211378 ?auto_211377 ) ( ON ?auto_211379 ?auto_211378 ) ( ON ?auto_211380 ?auto_211379 ) ( ON ?auto_211381 ?auto_211380 ) ( not ( = ?auto_211376 ?auto_211377 ) ) ( not ( = ?auto_211376 ?auto_211378 ) ) ( not ( = ?auto_211376 ?auto_211379 ) ) ( not ( = ?auto_211376 ?auto_211380 ) ) ( not ( = ?auto_211376 ?auto_211381 ) ) ( not ( = ?auto_211376 ?auto_211382 ) ) ( not ( = ?auto_211376 ?auto_211383 ) ) ( not ( = ?auto_211376 ?auto_211388 ) ) ( not ( = ?auto_211377 ?auto_211378 ) ) ( not ( = ?auto_211377 ?auto_211379 ) ) ( not ( = ?auto_211377 ?auto_211380 ) ) ( not ( = ?auto_211377 ?auto_211381 ) ) ( not ( = ?auto_211377 ?auto_211382 ) ) ( not ( = ?auto_211377 ?auto_211383 ) ) ( not ( = ?auto_211377 ?auto_211388 ) ) ( not ( = ?auto_211378 ?auto_211379 ) ) ( not ( = ?auto_211378 ?auto_211380 ) ) ( not ( = ?auto_211378 ?auto_211381 ) ) ( not ( = ?auto_211378 ?auto_211382 ) ) ( not ( = ?auto_211378 ?auto_211383 ) ) ( not ( = ?auto_211378 ?auto_211388 ) ) ( not ( = ?auto_211379 ?auto_211380 ) ) ( not ( = ?auto_211379 ?auto_211381 ) ) ( not ( = ?auto_211379 ?auto_211382 ) ) ( not ( = ?auto_211379 ?auto_211383 ) ) ( not ( = ?auto_211379 ?auto_211388 ) ) ( not ( = ?auto_211380 ?auto_211381 ) ) ( not ( = ?auto_211380 ?auto_211382 ) ) ( not ( = ?auto_211380 ?auto_211383 ) ) ( not ( = ?auto_211380 ?auto_211388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211381 ?auto_211382 ?auto_211383 )
      ( MAKE-7CRATE-VERIFY ?auto_211376 ?auto_211377 ?auto_211378 ?auto_211379 ?auto_211380 ?auto_211381 ?auto_211382 ?auto_211383 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211454 - SURFACE
      ?auto_211455 - SURFACE
      ?auto_211456 - SURFACE
      ?auto_211457 - SURFACE
      ?auto_211458 - SURFACE
      ?auto_211459 - SURFACE
      ?auto_211460 - SURFACE
      ?auto_211461 - SURFACE
    )
    :vars
    (
      ?auto_211462 - HOIST
      ?auto_211464 - PLACE
      ?auto_211465 - PLACE
      ?auto_211463 - HOIST
      ?auto_211467 - SURFACE
      ?auto_211466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_211462 ?auto_211464 ) ( SURFACE-AT ?auto_211460 ?auto_211464 ) ( CLEAR ?auto_211460 ) ( IS-CRATE ?auto_211461 ) ( not ( = ?auto_211460 ?auto_211461 ) ) ( AVAILABLE ?auto_211462 ) ( ON ?auto_211460 ?auto_211459 ) ( not ( = ?auto_211459 ?auto_211460 ) ) ( not ( = ?auto_211459 ?auto_211461 ) ) ( not ( = ?auto_211465 ?auto_211464 ) ) ( HOIST-AT ?auto_211463 ?auto_211465 ) ( not ( = ?auto_211462 ?auto_211463 ) ) ( AVAILABLE ?auto_211463 ) ( SURFACE-AT ?auto_211461 ?auto_211465 ) ( ON ?auto_211461 ?auto_211467 ) ( CLEAR ?auto_211461 ) ( not ( = ?auto_211460 ?auto_211467 ) ) ( not ( = ?auto_211461 ?auto_211467 ) ) ( not ( = ?auto_211459 ?auto_211467 ) ) ( TRUCK-AT ?auto_211466 ?auto_211464 ) ( ON ?auto_211455 ?auto_211454 ) ( ON ?auto_211456 ?auto_211455 ) ( ON ?auto_211457 ?auto_211456 ) ( ON ?auto_211458 ?auto_211457 ) ( ON ?auto_211459 ?auto_211458 ) ( not ( = ?auto_211454 ?auto_211455 ) ) ( not ( = ?auto_211454 ?auto_211456 ) ) ( not ( = ?auto_211454 ?auto_211457 ) ) ( not ( = ?auto_211454 ?auto_211458 ) ) ( not ( = ?auto_211454 ?auto_211459 ) ) ( not ( = ?auto_211454 ?auto_211460 ) ) ( not ( = ?auto_211454 ?auto_211461 ) ) ( not ( = ?auto_211454 ?auto_211467 ) ) ( not ( = ?auto_211455 ?auto_211456 ) ) ( not ( = ?auto_211455 ?auto_211457 ) ) ( not ( = ?auto_211455 ?auto_211458 ) ) ( not ( = ?auto_211455 ?auto_211459 ) ) ( not ( = ?auto_211455 ?auto_211460 ) ) ( not ( = ?auto_211455 ?auto_211461 ) ) ( not ( = ?auto_211455 ?auto_211467 ) ) ( not ( = ?auto_211456 ?auto_211457 ) ) ( not ( = ?auto_211456 ?auto_211458 ) ) ( not ( = ?auto_211456 ?auto_211459 ) ) ( not ( = ?auto_211456 ?auto_211460 ) ) ( not ( = ?auto_211456 ?auto_211461 ) ) ( not ( = ?auto_211456 ?auto_211467 ) ) ( not ( = ?auto_211457 ?auto_211458 ) ) ( not ( = ?auto_211457 ?auto_211459 ) ) ( not ( = ?auto_211457 ?auto_211460 ) ) ( not ( = ?auto_211457 ?auto_211461 ) ) ( not ( = ?auto_211457 ?auto_211467 ) ) ( not ( = ?auto_211458 ?auto_211459 ) ) ( not ( = ?auto_211458 ?auto_211460 ) ) ( not ( = ?auto_211458 ?auto_211461 ) ) ( not ( = ?auto_211458 ?auto_211467 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211459 ?auto_211460 ?auto_211461 )
      ( MAKE-7CRATE-VERIFY ?auto_211454 ?auto_211455 ?auto_211456 ?auto_211457 ?auto_211458 ?auto_211459 ?auto_211460 ?auto_211461 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211532 - SURFACE
      ?auto_211533 - SURFACE
      ?auto_211534 - SURFACE
      ?auto_211535 - SURFACE
      ?auto_211536 - SURFACE
      ?auto_211537 - SURFACE
      ?auto_211538 - SURFACE
      ?auto_211539 - SURFACE
    )
    :vars
    (
      ?auto_211541 - HOIST
      ?auto_211542 - PLACE
      ?auto_211543 - PLACE
      ?auto_211544 - HOIST
      ?auto_211540 - SURFACE
      ?auto_211545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_211541 ?auto_211542 ) ( IS-CRATE ?auto_211539 ) ( not ( = ?auto_211538 ?auto_211539 ) ) ( not ( = ?auto_211537 ?auto_211538 ) ) ( not ( = ?auto_211537 ?auto_211539 ) ) ( not ( = ?auto_211543 ?auto_211542 ) ) ( HOIST-AT ?auto_211544 ?auto_211543 ) ( not ( = ?auto_211541 ?auto_211544 ) ) ( AVAILABLE ?auto_211544 ) ( SURFACE-AT ?auto_211539 ?auto_211543 ) ( ON ?auto_211539 ?auto_211540 ) ( CLEAR ?auto_211539 ) ( not ( = ?auto_211538 ?auto_211540 ) ) ( not ( = ?auto_211539 ?auto_211540 ) ) ( not ( = ?auto_211537 ?auto_211540 ) ) ( TRUCK-AT ?auto_211545 ?auto_211542 ) ( SURFACE-AT ?auto_211537 ?auto_211542 ) ( CLEAR ?auto_211537 ) ( LIFTING ?auto_211541 ?auto_211538 ) ( IS-CRATE ?auto_211538 ) ( ON ?auto_211533 ?auto_211532 ) ( ON ?auto_211534 ?auto_211533 ) ( ON ?auto_211535 ?auto_211534 ) ( ON ?auto_211536 ?auto_211535 ) ( ON ?auto_211537 ?auto_211536 ) ( not ( = ?auto_211532 ?auto_211533 ) ) ( not ( = ?auto_211532 ?auto_211534 ) ) ( not ( = ?auto_211532 ?auto_211535 ) ) ( not ( = ?auto_211532 ?auto_211536 ) ) ( not ( = ?auto_211532 ?auto_211537 ) ) ( not ( = ?auto_211532 ?auto_211538 ) ) ( not ( = ?auto_211532 ?auto_211539 ) ) ( not ( = ?auto_211532 ?auto_211540 ) ) ( not ( = ?auto_211533 ?auto_211534 ) ) ( not ( = ?auto_211533 ?auto_211535 ) ) ( not ( = ?auto_211533 ?auto_211536 ) ) ( not ( = ?auto_211533 ?auto_211537 ) ) ( not ( = ?auto_211533 ?auto_211538 ) ) ( not ( = ?auto_211533 ?auto_211539 ) ) ( not ( = ?auto_211533 ?auto_211540 ) ) ( not ( = ?auto_211534 ?auto_211535 ) ) ( not ( = ?auto_211534 ?auto_211536 ) ) ( not ( = ?auto_211534 ?auto_211537 ) ) ( not ( = ?auto_211534 ?auto_211538 ) ) ( not ( = ?auto_211534 ?auto_211539 ) ) ( not ( = ?auto_211534 ?auto_211540 ) ) ( not ( = ?auto_211535 ?auto_211536 ) ) ( not ( = ?auto_211535 ?auto_211537 ) ) ( not ( = ?auto_211535 ?auto_211538 ) ) ( not ( = ?auto_211535 ?auto_211539 ) ) ( not ( = ?auto_211535 ?auto_211540 ) ) ( not ( = ?auto_211536 ?auto_211537 ) ) ( not ( = ?auto_211536 ?auto_211538 ) ) ( not ( = ?auto_211536 ?auto_211539 ) ) ( not ( = ?auto_211536 ?auto_211540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211537 ?auto_211538 ?auto_211539 )
      ( MAKE-7CRATE-VERIFY ?auto_211532 ?auto_211533 ?auto_211534 ?auto_211535 ?auto_211536 ?auto_211537 ?auto_211538 ?auto_211539 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211610 - SURFACE
      ?auto_211611 - SURFACE
      ?auto_211612 - SURFACE
      ?auto_211613 - SURFACE
      ?auto_211614 - SURFACE
      ?auto_211615 - SURFACE
      ?auto_211616 - SURFACE
      ?auto_211617 - SURFACE
    )
    :vars
    (
      ?auto_211621 - HOIST
      ?auto_211620 - PLACE
      ?auto_211618 - PLACE
      ?auto_211619 - HOIST
      ?auto_211623 - SURFACE
      ?auto_211622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_211621 ?auto_211620 ) ( IS-CRATE ?auto_211617 ) ( not ( = ?auto_211616 ?auto_211617 ) ) ( not ( = ?auto_211615 ?auto_211616 ) ) ( not ( = ?auto_211615 ?auto_211617 ) ) ( not ( = ?auto_211618 ?auto_211620 ) ) ( HOIST-AT ?auto_211619 ?auto_211618 ) ( not ( = ?auto_211621 ?auto_211619 ) ) ( AVAILABLE ?auto_211619 ) ( SURFACE-AT ?auto_211617 ?auto_211618 ) ( ON ?auto_211617 ?auto_211623 ) ( CLEAR ?auto_211617 ) ( not ( = ?auto_211616 ?auto_211623 ) ) ( not ( = ?auto_211617 ?auto_211623 ) ) ( not ( = ?auto_211615 ?auto_211623 ) ) ( TRUCK-AT ?auto_211622 ?auto_211620 ) ( SURFACE-AT ?auto_211615 ?auto_211620 ) ( CLEAR ?auto_211615 ) ( IS-CRATE ?auto_211616 ) ( AVAILABLE ?auto_211621 ) ( IN ?auto_211616 ?auto_211622 ) ( ON ?auto_211611 ?auto_211610 ) ( ON ?auto_211612 ?auto_211611 ) ( ON ?auto_211613 ?auto_211612 ) ( ON ?auto_211614 ?auto_211613 ) ( ON ?auto_211615 ?auto_211614 ) ( not ( = ?auto_211610 ?auto_211611 ) ) ( not ( = ?auto_211610 ?auto_211612 ) ) ( not ( = ?auto_211610 ?auto_211613 ) ) ( not ( = ?auto_211610 ?auto_211614 ) ) ( not ( = ?auto_211610 ?auto_211615 ) ) ( not ( = ?auto_211610 ?auto_211616 ) ) ( not ( = ?auto_211610 ?auto_211617 ) ) ( not ( = ?auto_211610 ?auto_211623 ) ) ( not ( = ?auto_211611 ?auto_211612 ) ) ( not ( = ?auto_211611 ?auto_211613 ) ) ( not ( = ?auto_211611 ?auto_211614 ) ) ( not ( = ?auto_211611 ?auto_211615 ) ) ( not ( = ?auto_211611 ?auto_211616 ) ) ( not ( = ?auto_211611 ?auto_211617 ) ) ( not ( = ?auto_211611 ?auto_211623 ) ) ( not ( = ?auto_211612 ?auto_211613 ) ) ( not ( = ?auto_211612 ?auto_211614 ) ) ( not ( = ?auto_211612 ?auto_211615 ) ) ( not ( = ?auto_211612 ?auto_211616 ) ) ( not ( = ?auto_211612 ?auto_211617 ) ) ( not ( = ?auto_211612 ?auto_211623 ) ) ( not ( = ?auto_211613 ?auto_211614 ) ) ( not ( = ?auto_211613 ?auto_211615 ) ) ( not ( = ?auto_211613 ?auto_211616 ) ) ( not ( = ?auto_211613 ?auto_211617 ) ) ( not ( = ?auto_211613 ?auto_211623 ) ) ( not ( = ?auto_211614 ?auto_211615 ) ) ( not ( = ?auto_211614 ?auto_211616 ) ) ( not ( = ?auto_211614 ?auto_211617 ) ) ( not ( = ?auto_211614 ?auto_211623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211615 ?auto_211616 ?auto_211617 )
      ( MAKE-7CRATE-VERIFY ?auto_211610 ?auto_211611 ?auto_211612 ?auto_211613 ?auto_211614 ?auto_211615 ?auto_211616 ?auto_211617 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_212189 - SURFACE
      ?auto_212190 - SURFACE
    )
    :vars
    (
      ?auto_212196 - HOIST
      ?auto_212195 - PLACE
      ?auto_212193 - SURFACE
      ?auto_212192 - PLACE
      ?auto_212194 - HOIST
      ?auto_212191 - SURFACE
      ?auto_212197 - TRUCK
      ?auto_212198 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_212196 ?auto_212195 ) ( SURFACE-AT ?auto_212189 ?auto_212195 ) ( CLEAR ?auto_212189 ) ( IS-CRATE ?auto_212190 ) ( not ( = ?auto_212189 ?auto_212190 ) ) ( ON ?auto_212189 ?auto_212193 ) ( not ( = ?auto_212193 ?auto_212189 ) ) ( not ( = ?auto_212193 ?auto_212190 ) ) ( not ( = ?auto_212192 ?auto_212195 ) ) ( HOIST-AT ?auto_212194 ?auto_212192 ) ( not ( = ?auto_212196 ?auto_212194 ) ) ( AVAILABLE ?auto_212194 ) ( SURFACE-AT ?auto_212190 ?auto_212192 ) ( ON ?auto_212190 ?auto_212191 ) ( CLEAR ?auto_212190 ) ( not ( = ?auto_212189 ?auto_212191 ) ) ( not ( = ?auto_212190 ?auto_212191 ) ) ( not ( = ?auto_212193 ?auto_212191 ) ) ( TRUCK-AT ?auto_212197 ?auto_212195 ) ( LIFTING ?auto_212196 ?auto_212198 ) ( IS-CRATE ?auto_212198 ) ( not ( = ?auto_212189 ?auto_212198 ) ) ( not ( = ?auto_212190 ?auto_212198 ) ) ( not ( = ?auto_212193 ?auto_212198 ) ) ( not ( = ?auto_212191 ?auto_212198 ) ) )
    :subtasks
    ( ( !LOAD ?auto_212196 ?auto_212198 ?auto_212197 ?auto_212195 )
      ( MAKE-1CRATE ?auto_212189 ?auto_212190 )
      ( MAKE-1CRATE-VERIFY ?auto_212189 ?auto_212190 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214489 - SURFACE
      ?auto_214490 - SURFACE
      ?auto_214491 - SURFACE
      ?auto_214492 - SURFACE
      ?auto_214493 - SURFACE
      ?auto_214494 - SURFACE
      ?auto_214495 - SURFACE
      ?auto_214496 - SURFACE
      ?auto_214497 - SURFACE
    )
    :vars
    (
      ?auto_214499 - HOIST
      ?auto_214498 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_214499 ?auto_214498 ) ( SURFACE-AT ?auto_214496 ?auto_214498 ) ( CLEAR ?auto_214496 ) ( LIFTING ?auto_214499 ?auto_214497 ) ( IS-CRATE ?auto_214497 ) ( not ( = ?auto_214496 ?auto_214497 ) ) ( ON ?auto_214490 ?auto_214489 ) ( ON ?auto_214491 ?auto_214490 ) ( ON ?auto_214492 ?auto_214491 ) ( ON ?auto_214493 ?auto_214492 ) ( ON ?auto_214494 ?auto_214493 ) ( ON ?auto_214495 ?auto_214494 ) ( ON ?auto_214496 ?auto_214495 ) ( not ( = ?auto_214489 ?auto_214490 ) ) ( not ( = ?auto_214489 ?auto_214491 ) ) ( not ( = ?auto_214489 ?auto_214492 ) ) ( not ( = ?auto_214489 ?auto_214493 ) ) ( not ( = ?auto_214489 ?auto_214494 ) ) ( not ( = ?auto_214489 ?auto_214495 ) ) ( not ( = ?auto_214489 ?auto_214496 ) ) ( not ( = ?auto_214489 ?auto_214497 ) ) ( not ( = ?auto_214490 ?auto_214491 ) ) ( not ( = ?auto_214490 ?auto_214492 ) ) ( not ( = ?auto_214490 ?auto_214493 ) ) ( not ( = ?auto_214490 ?auto_214494 ) ) ( not ( = ?auto_214490 ?auto_214495 ) ) ( not ( = ?auto_214490 ?auto_214496 ) ) ( not ( = ?auto_214490 ?auto_214497 ) ) ( not ( = ?auto_214491 ?auto_214492 ) ) ( not ( = ?auto_214491 ?auto_214493 ) ) ( not ( = ?auto_214491 ?auto_214494 ) ) ( not ( = ?auto_214491 ?auto_214495 ) ) ( not ( = ?auto_214491 ?auto_214496 ) ) ( not ( = ?auto_214491 ?auto_214497 ) ) ( not ( = ?auto_214492 ?auto_214493 ) ) ( not ( = ?auto_214492 ?auto_214494 ) ) ( not ( = ?auto_214492 ?auto_214495 ) ) ( not ( = ?auto_214492 ?auto_214496 ) ) ( not ( = ?auto_214492 ?auto_214497 ) ) ( not ( = ?auto_214493 ?auto_214494 ) ) ( not ( = ?auto_214493 ?auto_214495 ) ) ( not ( = ?auto_214493 ?auto_214496 ) ) ( not ( = ?auto_214493 ?auto_214497 ) ) ( not ( = ?auto_214494 ?auto_214495 ) ) ( not ( = ?auto_214494 ?auto_214496 ) ) ( not ( = ?auto_214494 ?auto_214497 ) ) ( not ( = ?auto_214495 ?auto_214496 ) ) ( not ( = ?auto_214495 ?auto_214497 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_214496 ?auto_214497 )
      ( MAKE-8CRATE-VERIFY ?auto_214489 ?auto_214490 ?auto_214491 ?auto_214492 ?auto_214493 ?auto_214494 ?auto_214495 ?auto_214496 ?auto_214497 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214556 - SURFACE
      ?auto_214557 - SURFACE
      ?auto_214558 - SURFACE
      ?auto_214559 - SURFACE
      ?auto_214560 - SURFACE
      ?auto_214561 - SURFACE
      ?auto_214562 - SURFACE
      ?auto_214563 - SURFACE
      ?auto_214564 - SURFACE
    )
    :vars
    (
      ?auto_214567 - HOIST
      ?auto_214566 - PLACE
      ?auto_214565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_214567 ?auto_214566 ) ( SURFACE-AT ?auto_214563 ?auto_214566 ) ( CLEAR ?auto_214563 ) ( IS-CRATE ?auto_214564 ) ( not ( = ?auto_214563 ?auto_214564 ) ) ( TRUCK-AT ?auto_214565 ?auto_214566 ) ( AVAILABLE ?auto_214567 ) ( IN ?auto_214564 ?auto_214565 ) ( ON ?auto_214563 ?auto_214562 ) ( not ( = ?auto_214562 ?auto_214563 ) ) ( not ( = ?auto_214562 ?auto_214564 ) ) ( ON ?auto_214557 ?auto_214556 ) ( ON ?auto_214558 ?auto_214557 ) ( ON ?auto_214559 ?auto_214558 ) ( ON ?auto_214560 ?auto_214559 ) ( ON ?auto_214561 ?auto_214560 ) ( ON ?auto_214562 ?auto_214561 ) ( not ( = ?auto_214556 ?auto_214557 ) ) ( not ( = ?auto_214556 ?auto_214558 ) ) ( not ( = ?auto_214556 ?auto_214559 ) ) ( not ( = ?auto_214556 ?auto_214560 ) ) ( not ( = ?auto_214556 ?auto_214561 ) ) ( not ( = ?auto_214556 ?auto_214562 ) ) ( not ( = ?auto_214556 ?auto_214563 ) ) ( not ( = ?auto_214556 ?auto_214564 ) ) ( not ( = ?auto_214557 ?auto_214558 ) ) ( not ( = ?auto_214557 ?auto_214559 ) ) ( not ( = ?auto_214557 ?auto_214560 ) ) ( not ( = ?auto_214557 ?auto_214561 ) ) ( not ( = ?auto_214557 ?auto_214562 ) ) ( not ( = ?auto_214557 ?auto_214563 ) ) ( not ( = ?auto_214557 ?auto_214564 ) ) ( not ( = ?auto_214558 ?auto_214559 ) ) ( not ( = ?auto_214558 ?auto_214560 ) ) ( not ( = ?auto_214558 ?auto_214561 ) ) ( not ( = ?auto_214558 ?auto_214562 ) ) ( not ( = ?auto_214558 ?auto_214563 ) ) ( not ( = ?auto_214558 ?auto_214564 ) ) ( not ( = ?auto_214559 ?auto_214560 ) ) ( not ( = ?auto_214559 ?auto_214561 ) ) ( not ( = ?auto_214559 ?auto_214562 ) ) ( not ( = ?auto_214559 ?auto_214563 ) ) ( not ( = ?auto_214559 ?auto_214564 ) ) ( not ( = ?auto_214560 ?auto_214561 ) ) ( not ( = ?auto_214560 ?auto_214562 ) ) ( not ( = ?auto_214560 ?auto_214563 ) ) ( not ( = ?auto_214560 ?auto_214564 ) ) ( not ( = ?auto_214561 ?auto_214562 ) ) ( not ( = ?auto_214561 ?auto_214563 ) ) ( not ( = ?auto_214561 ?auto_214564 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214562 ?auto_214563 ?auto_214564 )
      ( MAKE-8CRATE-VERIFY ?auto_214556 ?auto_214557 ?auto_214558 ?auto_214559 ?auto_214560 ?auto_214561 ?auto_214562 ?auto_214563 ?auto_214564 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214632 - SURFACE
      ?auto_214633 - SURFACE
      ?auto_214634 - SURFACE
      ?auto_214635 - SURFACE
      ?auto_214636 - SURFACE
      ?auto_214637 - SURFACE
      ?auto_214638 - SURFACE
      ?auto_214639 - SURFACE
      ?auto_214640 - SURFACE
    )
    :vars
    (
      ?auto_214641 - HOIST
      ?auto_214642 - PLACE
      ?auto_214644 - TRUCK
      ?auto_214643 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_214641 ?auto_214642 ) ( SURFACE-AT ?auto_214639 ?auto_214642 ) ( CLEAR ?auto_214639 ) ( IS-CRATE ?auto_214640 ) ( not ( = ?auto_214639 ?auto_214640 ) ) ( AVAILABLE ?auto_214641 ) ( IN ?auto_214640 ?auto_214644 ) ( ON ?auto_214639 ?auto_214638 ) ( not ( = ?auto_214638 ?auto_214639 ) ) ( not ( = ?auto_214638 ?auto_214640 ) ) ( TRUCK-AT ?auto_214644 ?auto_214643 ) ( not ( = ?auto_214643 ?auto_214642 ) ) ( ON ?auto_214633 ?auto_214632 ) ( ON ?auto_214634 ?auto_214633 ) ( ON ?auto_214635 ?auto_214634 ) ( ON ?auto_214636 ?auto_214635 ) ( ON ?auto_214637 ?auto_214636 ) ( ON ?auto_214638 ?auto_214637 ) ( not ( = ?auto_214632 ?auto_214633 ) ) ( not ( = ?auto_214632 ?auto_214634 ) ) ( not ( = ?auto_214632 ?auto_214635 ) ) ( not ( = ?auto_214632 ?auto_214636 ) ) ( not ( = ?auto_214632 ?auto_214637 ) ) ( not ( = ?auto_214632 ?auto_214638 ) ) ( not ( = ?auto_214632 ?auto_214639 ) ) ( not ( = ?auto_214632 ?auto_214640 ) ) ( not ( = ?auto_214633 ?auto_214634 ) ) ( not ( = ?auto_214633 ?auto_214635 ) ) ( not ( = ?auto_214633 ?auto_214636 ) ) ( not ( = ?auto_214633 ?auto_214637 ) ) ( not ( = ?auto_214633 ?auto_214638 ) ) ( not ( = ?auto_214633 ?auto_214639 ) ) ( not ( = ?auto_214633 ?auto_214640 ) ) ( not ( = ?auto_214634 ?auto_214635 ) ) ( not ( = ?auto_214634 ?auto_214636 ) ) ( not ( = ?auto_214634 ?auto_214637 ) ) ( not ( = ?auto_214634 ?auto_214638 ) ) ( not ( = ?auto_214634 ?auto_214639 ) ) ( not ( = ?auto_214634 ?auto_214640 ) ) ( not ( = ?auto_214635 ?auto_214636 ) ) ( not ( = ?auto_214635 ?auto_214637 ) ) ( not ( = ?auto_214635 ?auto_214638 ) ) ( not ( = ?auto_214635 ?auto_214639 ) ) ( not ( = ?auto_214635 ?auto_214640 ) ) ( not ( = ?auto_214636 ?auto_214637 ) ) ( not ( = ?auto_214636 ?auto_214638 ) ) ( not ( = ?auto_214636 ?auto_214639 ) ) ( not ( = ?auto_214636 ?auto_214640 ) ) ( not ( = ?auto_214637 ?auto_214638 ) ) ( not ( = ?auto_214637 ?auto_214639 ) ) ( not ( = ?auto_214637 ?auto_214640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214638 ?auto_214639 ?auto_214640 )
      ( MAKE-8CRATE-VERIFY ?auto_214632 ?auto_214633 ?auto_214634 ?auto_214635 ?auto_214636 ?auto_214637 ?auto_214638 ?auto_214639 ?auto_214640 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214716 - SURFACE
      ?auto_214717 - SURFACE
      ?auto_214718 - SURFACE
      ?auto_214719 - SURFACE
      ?auto_214720 - SURFACE
      ?auto_214721 - SURFACE
      ?auto_214722 - SURFACE
      ?auto_214723 - SURFACE
      ?auto_214724 - SURFACE
    )
    :vars
    (
      ?auto_214729 - HOIST
      ?auto_214728 - PLACE
      ?auto_214726 - TRUCK
      ?auto_214725 - PLACE
      ?auto_214727 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_214729 ?auto_214728 ) ( SURFACE-AT ?auto_214723 ?auto_214728 ) ( CLEAR ?auto_214723 ) ( IS-CRATE ?auto_214724 ) ( not ( = ?auto_214723 ?auto_214724 ) ) ( AVAILABLE ?auto_214729 ) ( ON ?auto_214723 ?auto_214722 ) ( not ( = ?auto_214722 ?auto_214723 ) ) ( not ( = ?auto_214722 ?auto_214724 ) ) ( TRUCK-AT ?auto_214726 ?auto_214725 ) ( not ( = ?auto_214725 ?auto_214728 ) ) ( HOIST-AT ?auto_214727 ?auto_214725 ) ( LIFTING ?auto_214727 ?auto_214724 ) ( not ( = ?auto_214729 ?auto_214727 ) ) ( ON ?auto_214717 ?auto_214716 ) ( ON ?auto_214718 ?auto_214717 ) ( ON ?auto_214719 ?auto_214718 ) ( ON ?auto_214720 ?auto_214719 ) ( ON ?auto_214721 ?auto_214720 ) ( ON ?auto_214722 ?auto_214721 ) ( not ( = ?auto_214716 ?auto_214717 ) ) ( not ( = ?auto_214716 ?auto_214718 ) ) ( not ( = ?auto_214716 ?auto_214719 ) ) ( not ( = ?auto_214716 ?auto_214720 ) ) ( not ( = ?auto_214716 ?auto_214721 ) ) ( not ( = ?auto_214716 ?auto_214722 ) ) ( not ( = ?auto_214716 ?auto_214723 ) ) ( not ( = ?auto_214716 ?auto_214724 ) ) ( not ( = ?auto_214717 ?auto_214718 ) ) ( not ( = ?auto_214717 ?auto_214719 ) ) ( not ( = ?auto_214717 ?auto_214720 ) ) ( not ( = ?auto_214717 ?auto_214721 ) ) ( not ( = ?auto_214717 ?auto_214722 ) ) ( not ( = ?auto_214717 ?auto_214723 ) ) ( not ( = ?auto_214717 ?auto_214724 ) ) ( not ( = ?auto_214718 ?auto_214719 ) ) ( not ( = ?auto_214718 ?auto_214720 ) ) ( not ( = ?auto_214718 ?auto_214721 ) ) ( not ( = ?auto_214718 ?auto_214722 ) ) ( not ( = ?auto_214718 ?auto_214723 ) ) ( not ( = ?auto_214718 ?auto_214724 ) ) ( not ( = ?auto_214719 ?auto_214720 ) ) ( not ( = ?auto_214719 ?auto_214721 ) ) ( not ( = ?auto_214719 ?auto_214722 ) ) ( not ( = ?auto_214719 ?auto_214723 ) ) ( not ( = ?auto_214719 ?auto_214724 ) ) ( not ( = ?auto_214720 ?auto_214721 ) ) ( not ( = ?auto_214720 ?auto_214722 ) ) ( not ( = ?auto_214720 ?auto_214723 ) ) ( not ( = ?auto_214720 ?auto_214724 ) ) ( not ( = ?auto_214721 ?auto_214722 ) ) ( not ( = ?auto_214721 ?auto_214723 ) ) ( not ( = ?auto_214721 ?auto_214724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214722 ?auto_214723 ?auto_214724 )
      ( MAKE-8CRATE-VERIFY ?auto_214716 ?auto_214717 ?auto_214718 ?auto_214719 ?auto_214720 ?auto_214721 ?auto_214722 ?auto_214723 ?auto_214724 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214808 - SURFACE
      ?auto_214809 - SURFACE
      ?auto_214810 - SURFACE
      ?auto_214811 - SURFACE
      ?auto_214812 - SURFACE
      ?auto_214813 - SURFACE
      ?auto_214814 - SURFACE
      ?auto_214815 - SURFACE
      ?auto_214816 - SURFACE
    )
    :vars
    (
      ?auto_214821 - HOIST
      ?auto_214822 - PLACE
      ?auto_214817 - TRUCK
      ?auto_214818 - PLACE
      ?auto_214819 - HOIST
      ?auto_214820 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_214821 ?auto_214822 ) ( SURFACE-AT ?auto_214815 ?auto_214822 ) ( CLEAR ?auto_214815 ) ( IS-CRATE ?auto_214816 ) ( not ( = ?auto_214815 ?auto_214816 ) ) ( AVAILABLE ?auto_214821 ) ( ON ?auto_214815 ?auto_214814 ) ( not ( = ?auto_214814 ?auto_214815 ) ) ( not ( = ?auto_214814 ?auto_214816 ) ) ( TRUCK-AT ?auto_214817 ?auto_214818 ) ( not ( = ?auto_214818 ?auto_214822 ) ) ( HOIST-AT ?auto_214819 ?auto_214818 ) ( not ( = ?auto_214821 ?auto_214819 ) ) ( AVAILABLE ?auto_214819 ) ( SURFACE-AT ?auto_214816 ?auto_214818 ) ( ON ?auto_214816 ?auto_214820 ) ( CLEAR ?auto_214816 ) ( not ( = ?auto_214815 ?auto_214820 ) ) ( not ( = ?auto_214816 ?auto_214820 ) ) ( not ( = ?auto_214814 ?auto_214820 ) ) ( ON ?auto_214809 ?auto_214808 ) ( ON ?auto_214810 ?auto_214809 ) ( ON ?auto_214811 ?auto_214810 ) ( ON ?auto_214812 ?auto_214811 ) ( ON ?auto_214813 ?auto_214812 ) ( ON ?auto_214814 ?auto_214813 ) ( not ( = ?auto_214808 ?auto_214809 ) ) ( not ( = ?auto_214808 ?auto_214810 ) ) ( not ( = ?auto_214808 ?auto_214811 ) ) ( not ( = ?auto_214808 ?auto_214812 ) ) ( not ( = ?auto_214808 ?auto_214813 ) ) ( not ( = ?auto_214808 ?auto_214814 ) ) ( not ( = ?auto_214808 ?auto_214815 ) ) ( not ( = ?auto_214808 ?auto_214816 ) ) ( not ( = ?auto_214808 ?auto_214820 ) ) ( not ( = ?auto_214809 ?auto_214810 ) ) ( not ( = ?auto_214809 ?auto_214811 ) ) ( not ( = ?auto_214809 ?auto_214812 ) ) ( not ( = ?auto_214809 ?auto_214813 ) ) ( not ( = ?auto_214809 ?auto_214814 ) ) ( not ( = ?auto_214809 ?auto_214815 ) ) ( not ( = ?auto_214809 ?auto_214816 ) ) ( not ( = ?auto_214809 ?auto_214820 ) ) ( not ( = ?auto_214810 ?auto_214811 ) ) ( not ( = ?auto_214810 ?auto_214812 ) ) ( not ( = ?auto_214810 ?auto_214813 ) ) ( not ( = ?auto_214810 ?auto_214814 ) ) ( not ( = ?auto_214810 ?auto_214815 ) ) ( not ( = ?auto_214810 ?auto_214816 ) ) ( not ( = ?auto_214810 ?auto_214820 ) ) ( not ( = ?auto_214811 ?auto_214812 ) ) ( not ( = ?auto_214811 ?auto_214813 ) ) ( not ( = ?auto_214811 ?auto_214814 ) ) ( not ( = ?auto_214811 ?auto_214815 ) ) ( not ( = ?auto_214811 ?auto_214816 ) ) ( not ( = ?auto_214811 ?auto_214820 ) ) ( not ( = ?auto_214812 ?auto_214813 ) ) ( not ( = ?auto_214812 ?auto_214814 ) ) ( not ( = ?auto_214812 ?auto_214815 ) ) ( not ( = ?auto_214812 ?auto_214816 ) ) ( not ( = ?auto_214812 ?auto_214820 ) ) ( not ( = ?auto_214813 ?auto_214814 ) ) ( not ( = ?auto_214813 ?auto_214815 ) ) ( not ( = ?auto_214813 ?auto_214816 ) ) ( not ( = ?auto_214813 ?auto_214820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214814 ?auto_214815 ?auto_214816 )
      ( MAKE-8CRATE-VERIFY ?auto_214808 ?auto_214809 ?auto_214810 ?auto_214811 ?auto_214812 ?auto_214813 ?auto_214814 ?auto_214815 ?auto_214816 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214901 - SURFACE
      ?auto_214902 - SURFACE
      ?auto_214903 - SURFACE
      ?auto_214904 - SURFACE
      ?auto_214905 - SURFACE
      ?auto_214906 - SURFACE
      ?auto_214907 - SURFACE
      ?auto_214908 - SURFACE
      ?auto_214909 - SURFACE
    )
    :vars
    (
      ?auto_214914 - HOIST
      ?auto_214912 - PLACE
      ?auto_214915 - PLACE
      ?auto_214910 - HOIST
      ?auto_214911 - SURFACE
      ?auto_214913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_214914 ?auto_214912 ) ( SURFACE-AT ?auto_214908 ?auto_214912 ) ( CLEAR ?auto_214908 ) ( IS-CRATE ?auto_214909 ) ( not ( = ?auto_214908 ?auto_214909 ) ) ( AVAILABLE ?auto_214914 ) ( ON ?auto_214908 ?auto_214907 ) ( not ( = ?auto_214907 ?auto_214908 ) ) ( not ( = ?auto_214907 ?auto_214909 ) ) ( not ( = ?auto_214915 ?auto_214912 ) ) ( HOIST-AT ?auto_214910 ?auto_214915 ) ( not ( = ?auto_214914 ?auto_214910 ) ) ( AVAILABLE ?auto_214910 ) ( SURFACE-AT ?auto_214909 ?auto_214915 ) ( ON ?auto_214909 ?auto_214911 ) ( CLEAR ?auto_214909 ) ( not ( = ?auto_214908 ?auto_214911 ) ) ( not ( = ?auto_214909 ?auto_214911 ) ) ( not ( = ?auto_214907 ?auto_214911 ) ) ( TRUCK-AT ?auto_214913 ?auto_214912 ) ( ON ?auto_214902 ?auto_214901 ) ( ON ?auto_214903 ?auto_214902 ) ( ON ?auto_214904 ?auto_214903 ) ( ON ?auto_214905 ?auto_214904 ) ( ON ?auto_214906 ?auto_214905 ) ( ON ?auto_214907 ?auto_214906 ) ( not ( = ?auto_214901 ?auto_214902 ) ) ( not ( = ?auto_214901 ?auto_214903 ) ) ( not ( = ?auto_214901 ?auto_214904 ) ) ( not ( = ?auto_214901 ?auto_214905 ) ) ( not ( = ?auto_214901 ?auto_214906 ) ) ( not ( = ?auto_214901 ?auto_214907 ) ) ( not ( = ?auto_214901 ?auto_214908 ) ) ( not ( = ?auto_214901 ?auto_214909 ) ) ( not ( = ?auto_214901 ?auto_214911 ) ) ( not ( = ?auto_214902 ?auto_214903 ) ) ( not ( = ?auto_214902 ?auto_214904 ) ) ( not ( = ?auto_214902 ?auto_214905 ) ) ( not ( = ?auto_214902 ?auto_214906 ) ) ( not ( = ?auto_214902 ?auto_214907 ) ) ( not ( = ?auto_214902 ?auto_214908 ) ) ( not ( = ?auto_214902 ?auto_214909 ) ) ( not ( = ?auto_214902 ?auto_214911 ) ) ( not ( = ?auto_214903 ?auto_214904 ) ) ( not ( = ?auto_214903 ?auto_214905 ) ) ( not ( = ?auto_214903 ?auto_214906 ) ) ( not ( = ?auto_214903 ?auto_214907 ) ) ( not ( = ?auto_214903 ?auto_214908 ) ) ( not ( = ?auto_214903 ?auto_214909 ) ) ( not ( = ?auto_214903 ?auto_214911 ) ) ( not ( = ?auto_214904 ?auto_214905 ) ) ( not ( = ?auto_214904 ?auto_214906 ) ) ( not ( = ?auto_214904 ?auto_214907 ) ) ( not ( = ?auto_214904 ?auto_214908 ) ) ( not ( = ?auto_214904 ?auto_214909 ) ) ( not ( = ?auto_214904 ?auto_214911 ) ) ( not ( = ?auto_214905 ?auto_214906 ) ) ( not ( = ?auto_214905 ?auto_214907 ) ) ( not ( = ?auto_214905 ?auto_214908 ) ) ( not ( = ?auto_214905 ?auto_214909 ) ) ( not ( = ?auto_214905 ?auto_214911 ) ) ( not ( = ?auto_214906 ?auto_214907 ) ) ( not ( = ?auto_214906 ?auto_214908 ) ) ( not ( = ?auto_214906 ?auto_214909 ) ) ( not ( = ?auto_214906 ?auto_214911 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214907 ?auto_214908 ?auto_214909 )
      ( MAKE-8CRATE-VERIFY ?auto_214901 ?auto_214902 ?auto_214903 ?auto_214904 ?auto_214905 ?auto_214906 ?auto_214907 ?auto_214908 ?auto_214909 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214994 - SURFACE
      ?auto_214995 - SURFACE
      ?auto_214996 - SURFACE
      ?auto_214997 - SURFACE
      ?auto_214998 - SURFACE
      ?auto_214999 - SURFACE
      ?auto_215000 - SURFACE
      ?auto_215001 - SURFACE
      ?auto_215002 - SURFACE
    )
    :vars
    (
      ?auto_215006 - HOIST
      ?auto_215005 - PLACE
      ?auto_215008 - PLACE
      ?auto_215007 - HOIST
      ?auto_215004 - SURFACE
      ?auto_215003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_215006 ?auto_215005 ) ( IS-CRATE ?auto_215002 ) ( not ( = ?auto_215001 ?auto_215002 ) ) ( not ( = ?auto_215000 ?auto_215001 ) ) ( not ( = ?auto_215000 ?auto_215002 ) ) ( not ( = ?auto_215008 ?auto_215005 ) ) ( HOIST-AT ?auto_215007 ?auto_215008 ) ( not ( = ?auto_215006 ?auto_215007 ) ) ( AVAILABLE ?auto_215007 ) ( SURFACE-AT ?auto_215002 ?auto_215008 ) ( ON ?auto_215002 ?auto_215004 ) ( CLEAR ?auto_215002 ) ( not ( = ?auto_215001 ?auto_215004 ) ) ( not ( = ?auto_215002 ?auto_215004 ) ) ( not ( = ?auto_215000 ?auto_215004 ) ) ( TRUCK-AT ?auto_215003 ?auto_215005 ) ( SURFACE-AT ?auto_215000 ?auto_215005 ) ( CLEAR ?auto_215000 ) ( LIFTING ?auto_215006 ?auto_215001 ) ( IS-CRATE ?auto_215001 ) ( ON ?auto_214995 ?auto_214994 ) ( ON ?auto_214996 ?auto_214995 ) ( ON ?auto_214997 ?auto_214996 ) ( ON ?auto_214998 ?auto_214997 ) ( ON ?auto_214999 ?auto_214998 ) ( ON ?auto_215000 ?auto_214999 ) ( not ( = ?auto_214994 ?auto_214995 ) ) ( not ( = ?auto_214994 ?auto_214996 ) ) ( not ( = ?auto_214994 ?auto_214997 ) ) ( not ( = ?auto_214994 ?auto_214998 ) ) ( not ( = ?auto_214994 ?auto_214999 ) ) ( not ( = ?auto_214994 ?auto_215000 ) ) ( not ( = ?auto_214994 ?auto_215001 ) ) ( not ( = ?auto_214994 ?auto_215002 ) ) ( not ( = ?auto_214994 ?auto_215004 ) ) ( not ( = ?auto_214995 ?auto_214996 ) ) ( not ( = ?auto_214995 ?auto_214997 ) ) ( not ( = ?auto_214995 ?auto_214998 ) ) ( not ( = ?auto_214995 ?auto_214999 ) ) ( not ( = ?auto_214995 ?auto_215000 ) ) ( not ( = ?auto_214995 ?auto_215001 ) ) ( not ( = ?auto_214995 ?auto_215002 ) ) ( not ( = ?auto_214995 ?auto_215004 ) ) ( not ( = ?auto_214996 ?auto_214997 ) ) ( not ( = ?auto_214996 ?auto_214998 ) ) ( not ( = ?auto_214996 ?auto_214999 ) ) ( not ( = ?auto_214996 ?auto_215000 ) ) ( not ( = ?auto_214996 ?auto_215001 ) ) ( not ( = ?auto_214996 ?auto_215002 ) ) ( not ( = ?auto_214996 ?auto_215004 ) ) ( not ( = ?auto_214997 ?auto_214998 ) ) ( not ( = ?auto_214997 ?auto_214999 ) ) ( not ( = ?auto_214997 ?auto_215000 ) ) ( not ( = ?auto_214997 ?auto_215001 ) ) ( not ( = ?auto_214997 ?auto_215002 ) ) ( not ( = ?auto_214997 ?auto_215004 ) ) ( not ( = ?auto_214998 ?auto_214999 ) ) ( not ( = ?auto_214998 ?auto_215000 ) ) ( not ( = ?auto_214998 ?auto_215001 ) ) ( not ( = ?auto_214998 ?auto_215002 ) ) ( not ( = ?auto_214998 ?auto_215004 ) ) ( not ( = ?auto_214999 ?auto_215000 ) ) ( not ( = ?auto_214999 ?auto_215001 ) ) ( not ( = ?auto_214999 ?auto_215002 ) ) ( not ( = ?auto_214999 ?auto_215004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_215000 ?auto_215001 ?auto_215002 )
      ( MAKE-8CRATE-VERIFY ?auto_214994 ?auto_214995 ?auto_214996 ?auto_214997 ?auto_214998 ?auto_214999 ?auto_215000 ?auto_215001 ?auto_215002 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_215087 - SURFACE
      ?auto_215088 - SURFACE
      ?auto_215089 - SURFACE
      ?auto_215090 - SURFACE
      ?auto_215091 - SURFACE
      ?auto_215092 - SURFACE
      ?auto_215093 - SURFACE
      ?auto_215094 - SURFACE
      ?auto_215095 - SURFACE
    )
    :vars
    (
      ?auto_215099 - HOIST
      ?auto_215097 - PLACE
      ?auto_215100 - PLACE
      ?auto_215098 - HOIST
      ?auto_215096 - SURFACE
      ?auto_215101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_215099 ?auto_215097 ) ( IS-CRATE ?auto_215095 ) ( not ( = ?auto_215094 ?auto_215095 ) ) ( not ( = ?auto_215093 ?auto_215094 ) ) ( not ( = ?auto_215093 ?auto_215095 ) ) ( not ( = ?auto_215100 ?auto_215097 ) ) ( HOIST-AT ?auto_215098 ?auto_215100 ) ( not ( = ?auto_215099 ?auto_215098 ) ) ( AVAILABLE ?auto_215098 ) ( SURFACE-AT ?auto_215095 ?auto_215100 ) ( ON ?auto_215095 ?auto_215096 ) ( CLEAR ?auto_215095 ) ( not ( = ?auto_215094 ?auto_215096 ) ) ( not ( = ?auto_215095 ?auto_215096 ) ) ( not ( = ?auto_215093 ?auto_215096 ) ) ( TRUCK-AT ?auto_215101 ?auto_215097 ) ( SURFACE-AT ?auto_215093 ?auto_215097 ) ( CLEAR ?auto_215093 ) ( IS-CRATE ?auto_215094 ) ( AVAILABLE ?auto_215099 ) ( IN ?auto_215094 ?auto_215101 ) ( ON ?auto_215088 ?auto_215087 ) ( ON ?auto_215089 ?auto_215088 ) ( ON ?auto_215090 ?auto_215089 ) ( ON ?auto_215091 ?auto_215090 ) ( ON ?auto_215092 ?auto_215091 ) ( ON ?auto_215093 ?auto_215092 ) ( not ( = ?auto_215087 ?auto_215088 ) ) ( not ( = ?auto_215087 ?auto_215089 ) ) ( not ( = ?auto_215087 ?auto_215090 ) ) ( not ( = ?auto_215087 ?auto_215091 ) ) ( not ( = ?auto_215087 ?auto_215092 ) ) ( not ( = ?auto_215087 ?auto_215093 ) ) ( not ( = ?auto_215087 ?auto_215094 ) ) ( not ( = ?auto_215087 ?auto_215095 ) ) ( not ( = ?auto_215087 ?auto_215096 ) ) ( not ( = ?auto_215088 ?auto_215089 ) ) ( not ( = ?auto_215088 ?auto_215090 ) ) ( not ( = ?auto_215088 ?auto_215091 ) ) ( not ( = ?auto_215088 ?auto_215092 ) ) ( not ( = ?auto_215088 ?auto_215093 ) ) ( not ( = ?auto_215088 ?auto_215094 ) ) ( not ( = ?auto_215088 ?auto_215095 ) ) ( not ( = ?auto_215088 ?auto_215096 ) ) ( not ( = ?auto_215089 ?auto_215090 ) ) ( not ( = ?auto_215089 ?auto_215091 ) ) ( not ( = ?auto_215089 ?auto_215092 ) ) ( not ( = ?auto_215089 ?auto_215093 ) ) ( not ( = ?auto_215089 ?auto_215094 ) ) ( not ( = ?auto_215089 ?auto_215095 ) ) ( not ( = ?auto_215089 ?auto_215096 ) ) ( not ( = ?auto_215090 ?auto_215091 ) ) ( not ( = ?auto_215090 ?auto_215092 ) ) ( not ( = ?auto_215090 ?auto_215093 ) ) ( not ( = ?auto_215090 ?auto_215094 ) ) ( not ( = ?auto_215090 ?auto_215095 ) ) ( not ( = ?auto_215090 ?auto_215096 ) ) ( not ( = ?auto_215091 ?auto_215092 ) ) ( not ( = ?auto_215091 ?auto_215093 ) ) ( not ( = ?auto_215091 ?auto_215094 ) ) ( not ( = ?auto_215091 ?auto_215095 ) ) ( not ( = ?auto_215091 ?auto_215096 ) ) ( not ( = ?auto_215092 ?auto_215093 ) ) ( not ( = ?auto_215092 ?auto_215094 ) ) ( not ( = ?auto_215092 ?auto_215095 ) ) ( not ( = ?auto_215092 ?auto_215096 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_215093 ?auto_215094 ?auto_215095 )
      ( MAKE-8CRATE-VERIFY ?auto_215087 ?auto_215088 ?auto_215089 ?auto_215090 ?auto_215091 ?auto_215092 ?auto_215093 ?auto_215094 ?auto_215095 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219170 - SURFACE
      ?auto_219171 - SURFACE
      ?auto_219172 - SURFACE
      ?auto_219173 - SURFACE
      ?auto_219174 - SURFACE
      ?auto_219175 - SURFACE
      ?auto_219176 - SURFACE
      ?auto_219177 - SURFACE
      ?auto_219178 - SURFACE
      ?auto_219179 - SURFACE
    )
    :vars
    (
      ?auto_219180 - HOIST
      ?auto_219181 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_219180 ?auto_219181 ) ( SURFACE-AT ?auto_219178 ?auto_219181 ) ( CLEAR ?auto_219178 ) ( LIFTING ?auto_219180 ?auto_219179 ) ( IS-CRATE ?auto_219179 ) ( not ( = ?auto_219178 ?auto_219179 ) ) ( ON ?auto_219171 ?auto_219170 ) ( ON ?auto_219172 ?auto_219171 ) ( ON ?auto_219173 ?auto_219172 ) ( ON ?auto_219174 ?auto_219173 ) ( ON ?auto_219175 ?auto_219174 ) ( ON ?auto_219176 ?auto_219175 ) ( ON ?auto_219177 ?auto_219176 ) ( ON ?auto_219178 ?auto_219177 ) ( not ( = ?auto_219170 ?auto_219171 ) ) ( not ( = ?auto_219170 ?auto_219172 ) ) ( not ( = ?auto_219170 ?auto_219173 ) ) ( not ( = ?auto_219170 ?auto_219174 ) ) ( not ( = ?auto_219170 ?auto_219175 ) ) ( not ( = ?auto_219170 ?auto_219176 ) ) ( not ( = ?auto_219170 ?auto_219177 ) ) ( not ( = ?auto_219170 ?auto_219178 ) ) ( not ( = ?auto_219170 ?auto_219179 ) ) ( not ( = ?auto_219171 ?auto_219172 ) ) ( not ( = ?auto_219171 ?auto_219173 ) ) ( not ( = ?auto_219171 ?auto_219174 ) ) ( not ( = ?auto_219171 ?auto_219175 ) ) ( not ( = ?auto_219171 ?auto_219176 ) ) ( not ( = ?auto_219171 ?auto_219177 ) ) ( not ( = ?auto_219171 ?auto_219178 ) ) ( not ( = ?auto_219171 ?auto_219179 ) ) ( not ( = ?auto_219172 ?auto_219173 ) ) ( not ( = ?auto_219172 ?auto_219174 ) ) ( not ( = ?auto_219172 ?auto_219175 ) ) ( not ( = ?auto_219172 ?auto_219176 ) ) ( not ( = ?auto_219172 ?auto_219177 ) ) ( not ( = ?auto_219172 ?auto_219178 ) ) ( not ( = ?auto_219172 ?auto_219179 ) ) ( not ( = ?auto_219173 ?auto_219174 ) ) ( not ( = ?auto_219173 ?auto_219175 ) ) ( not ( = ?auto_219173 ?auto_219176 ) ) ( not ( = ?auto_219173 ?auto_219177 ) ) ( not ( = ?auto_219173 ?auto_219178 ) ) ( not ( = ?auto_219173 ?auto_219179 ) ) ( not ( = ?auto_219174 ?auto_219175 ) ) ( not ( = ?auto_219174 ?auto_219176 ) ) ( not ( = ?auto_219174 ?auto_219177 ) ) ( not ( = ?auto_219174 ?auto_219178 ) ) ( not ( = ?auto_219174 ?auto_219179 ) ) ( not ( = ?auto_219175 ?auto_219176 ) ) ( not ( = ?auto_219175 ?auto_219177 ) ) ( not ( = ?auto_219175 ?auto_219178 ) ) ( not ( = ?auto_219175 ?auto_219179 ) ) ( not ( = ?auto_219176 ?auto_219177 ) ) ( not ( = ?auto_219176 ?auto_219178 ) ) ( not ( = ?auto_219176 ?auto_219179 ) ) ( not ( = ?auto_219177 ?auto_219178 ) ) ( not ( = ?auto_219177 ?auto_219179 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_219178 ?auto_219179 )
      ( MAKE-9CRATE-VERIFY ?auto_219170 ?auto_219171 ?auto_219172 ?auto_219173 ?auto_219174 ?auto_219175 ?auto_219176 ?auto_219177 ?auto_219178 ?auto_219179 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219250 - SURFACE
      ?auto_219251 - SURFACE
      ?auto_219252 - SURFACE
      ?auto_219253 - SURFACE
      ?auto_219254 - SURFACE
      ?auto_219255 - SURFACE
      ?auto_219256 - SURFACE
      ?auto_219257 - SURFACE
      ?auto_219258 - SURFACE
      ?auto_219259 - SURFACE
    )
    :vars
    (
      ?auto_219261 - HOIST
      ?auto_219260 - PLACE
      ?auto_219262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_219261 ?auto_219260 ) ( SURFACE-AT ?auto_219258 ?auto_219260 ) ( CLEAR ?auto_219258 ) ( IS-CRATE ?auto_219259 ) ( not ( = ?auto_219258 ?auto_219259 ) ) ( TRUCK-AT ?auto_219262 ?auto_219260 ) ( AVAILABLE ?auto_219261 ) ( IN ?auto_219259 ?auto_219262 ) ( ON ?auto_219258 ?auto_219257 ) ( not ( = ?auto_219257 ?auto_219258 ) ) ( not ( = ?auto_219257 ?auto_219259 ) ) ( ON ?auto_219251 ?auto_219250 ) ( ON ?auto_219252 ?auto_219251 ) ( ON ?auto_219253 ?auto_219252 ) ( ON ?auto_219254 ?auto_219253 ) ( ON ?auto_219255 ?auto_219254 ) ( ON ?auto_219256 ?auto_219255 ) ( ON ?auto_219257 ?auto_219256 ) ( not ( = ?auto_219250 ?auto_219251 ) ) ( not ( = ?auto_219250 ?auto_219252 ) ) ( not ( = ?auto_219250 ?auto_219253 ) ) ( not ( = ?auto_219250 ?auto_219254 ) ) ( not ( = ?auto_219250 ?auto_219255 ) ) ( not ( = ?auto_219250 ?auto_219256 ) ) ( not ( = ?auto_219250 ?auto_219257 ) ) ( not ( = ?auto_219250 ?auto_219258 ) ) ( not ( = ?auto_219250 ?auto_219259 ) ) ( not ( = ?auto_219251 ?auto_219252 ) ) ( not ( = ?auto_219251 ?auto_219253 ) ) ( not ( = ?auto_219251 ?auto_219254 ) ) ( not ( = ?auto_219251 ?auto_219255 ) ) ( not ( = ?auto_219251 ?auto_219256 ) ) ( not ( = ?auto_219251 ?auto_219257 ) ) ( not ( = ?auto_219251 ?auto_219258 ) ) ( not ( = ?auto_219251 ?auto_219259 ) ) ( not ( = ?auto_219252 ?auto_219253 ) ) ( not ( = ?auto_219252 ?auto_219254 ) ) ( not ( = ?auto_219252 ?auto_219255 ) ) ( not ( = ?auto_219252 ?auto_219256 ) ) ( not ( = ?auto_219252 ?auto_219257 ) ) ( not ( = ?auto_219252 ?auto_219258 ) ) ( not ( = ?auto_219252 ?auto_219259 ) ) ( not ( = ?auto_219253 ?auto_219254 ) ) ( not ( = ?auto_219253 ?auto_219255 ) ) ( not ( = ?auto_219253 ?auto_219256 ) ) ( not ( = ?auto_219253 ?auto_219257 ) ) ( not ( = ?auto_219253 ?auto_219258 ) ) ( not ( = ?auto_219253 ?auto_219259 ) ) ( not ( = ?auto_219254 ?auto_219255 ) ) ( not ( = ?auto_219254 ?auto_219256 ) ) ( not ( = ?auto_219254 ?auto_219257 ) ) ( not ( = ?auto_219254 ?auto_219258 ) ) ( not ( = ?auto_219254 ?auto_219259 ) ) ( not ( = ?auto_219255 ?auto_219256 ) ) ( not ( = ?auto_219255 ?auto_219257 ) ) ( not ( = ?auto_219255 ?auto_219258 ) ) ( not ( = ?auto_219255 ?auto_219259 ) ) ( not ( = ?auto_219256 ?auto_219257 ) ) ( not ( = ?auto_219256 ?auto_219258 ) ) ( not ( = ?auto_219256 ?auto_219259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219257 ?auto_219258 ?auto_219259 )
      ( MAKE-9CRATE-VERIFY ?auto_219250 ?auto_219251 ?auto_219252 ?auto_219253 ?auto_219254 ?auto_219255 ?auto_219256 ?auto_219257 ?auto_219258 ?auto_219259 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219340 - SURFACE
      ?auto_219341 - SURFACE
      ?auto_219342 - SURFACE
      ?auto_219343 - SURFACE
      ?auto_219344 - SURFACE
      ?auto_219345 - SURFACE
      ?auto_219346 - SURFACE
      ?auto_219347 - SURFACE
      ?auto_219348 - SURFACE
      ?auto_219349 - SURFACE
    )
    :vars
    (
      ?auto_219351 - HOIST
      ?auto_219352 - PLACE
      ?auto_219350 - TRUCK
      ?auto_219353 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_219351 ?auto_219352 ) ( SURFACE-AT ?auto_219348 ?auto_219352 ) ( CLEAR ?auto_219348 ) ( IS-CRATE ?auto_219349 ) ( not ( = ?auto_219348 ?auto_219349 ) ) ( AVAILABLE ?auto_219351 ) ( IN ?auto_219349 ?auto_219350 ) ( ON ?auto_219348 ?auto_219347 ) ( not ( = ?auto_219347 ?auto_219348 ) ) ( not ( = ?auto_219347 ?auto_219349 ) ) ( TRUCK-AT ?auto_219350 ?auto_219353 ) ( not ( = ?auto_219353 ?auto_219352 ) ) ( ON ?auto_219341 ?auto_219340 ) ( ON ?auto_219342 ?auto_219341 ) ( ON ?auto_219343 ?auto_219342 ) ( ON ?auto_219344 ?auto_219343 ) ( ON ?auto_219345 ?auto_219344 ) ( ON ?auto_219346 ?auto_219345 ) ( ON ?auto_219347 ?auto_219346 ) ( not ( = ?auto_219340 ?auto_219341 ) ) ( not ( = ?auto_219340 ?auto_219342 ) ) ( not ( = ?auto_219340 ?auto_219343 ) ) ( not ( = ?auto_219340 ?auto_219344 ) ) ( not ( = ?auto_219340 ?auto_219345 ) ) ( not ( = ?auto_219340 ?auto_219346 ) ) ( not ( = ?auto_219340 ?auto_219347 ) ) ( not ( = ?auto_219340 ?auto_219348 ) ) ( not ( = ?auto_219340 ?auto_219349 ) ) ( not ( = ?auto_219341 ?auto_219342 ) ) ( not ( = ?auto_219341 ?auto_219343 ) ) ( not ( = ?auto_219341 ?auto_219344 ) ) ( not ( = ?auto_219341 ?auto_219345 ) ) ( not ( = ?auto_219341 ?auto_219346 ) ) ( not ( = ?auto_219341 ?auto_219347 ) ) ( not ( = ?auto_219341 ?auto_219348 ) ) ( not ( = ?auto_219341 ?auto_219349 ) ) ( not ( = ?auto_219342 ?auto_219343 ) ) ( not ( = ?auto_219342 ?auto_219344 ) ) ( not ( = ?auto_219342 ?auto_219345 ) ) ( not ( = ?auto_219342 ?auto_219346 ) ) ( not ( = ?auto_219342 ?auto_219347 ) ) ( not ( = ?auto_219342 ?auto_219348 ) ) ( not ( = ?auto_219342 ?auto_219349 ) ) ( not ( = ?auto_219343 ?auto_219344 ) ) ( not ( = ?auto_219343 ?auto_219345 ) ) ( not ( = ?auto_219343 ?auto_219346 ) ) ( not ( = ?auto_219343 ?auto_219347 ) ) ( not ( = ?auto_219343 ?auto_219348 ) ) ( not ( = ?auto_219343 ?auto_219349 ) ) ( not ( = ?auto_219344 ?auto_219345 ) ) ( not ( = ?auto_219344 ?auto_219346 ) ) ( not ( = ?auto_219344 ?auto_219347 ) ) ( not ( = ?auto_219344 ?auto_219348 ) ) ( not ( = ?auto_219344 ?auto_219349 ) ) ( not ( = ?auto_219345 ?auto_219346 ) ) ( not ( = ?auto_219345 ?auto_219347 ) ) ( not ( = ?auto_219345 ?auto_219348 ) ) ( not ( = ?auto_219345 ?auto_219349 ) ) ( not ( = ?auto_219346 ?auto_219347 ) ) ( not ( = ?auto_219346 ?auto_219348 ) ) ( not ( = ?auto_219346 ?auto_219349 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219347 ?auto_219348 ?auto_219349 )
      ( MAKE-9CRATE-VERIFY ?auto_219340 ?auto_219341 ?auto_219342 ?auto_219343 ?auto_219344 ?auto_219345 ?auto_219346 ?auto_219347 ?auto_219348 ?auto_219349 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219439 - SURFACE
      ?auto_219440 - SURFACE
      ?auto_219441 - SURFACE
      ?auto_219442 - SURFACE
      ?auto_219443 - SURFACE
      ?auto_219444 - SURFACE
      ?auto_219445 - SURFACE
      ?auto_219446 - SURFACE
      ?auto_219447 - SURFACE
      ?auto_219448 - SURFACE
    )
    :vars
    (
      ?auto_219452 - HOIST
      ?auto_219451 - PLACE
      ?auto_219453 - TRUCK
      ?auto_219449 - PLACE
      ?auto_219450 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_219452 ?auto_219451 ) ( SURFACE-AT ?auto_219447 ?auto_219451 ) ( CLEAR ?auto_219447 ) ( IS-CRATE ?auto_219448 ) ( not ( = ?auto_219447 ?auto_219448 ) ) ( AVAILABLE ?auto_219452 ) ( ON ?auto_219447 ?auto_219446 ) ( not ( = ?auto_219446 ?auto_219447 ) ) ( not ( = ?auto_219446 ?auto_219448 ) ) ( TRUCK-AT ?auto_219453 ?auto_219449 ) ( not ( = ?auto_219449 ?auto_219451 ) ) ( HOIST-AT ?auto_219450 ?auto_219449 ) ( LIFTING ?auto_219450 ?auto_219448 ) ( not ( = ?auto_219452 ?auto_219450 ) ) ( ON ?auto_219440 ?auto_219439 ) ( ON ?auto_219441 ?auto_219440 ) ( ON ?auto_219442 ?auto_219441 ) ( ON ?auto_219443 ?auto_219442 ) ( ON ?auto_219444 ?auto_219443 ) ( ON ?auto_219445 ?auto_219444 ) ( ON ?auto_219446 ?auto_219445 ) ( not ( = ?auto_219439 ?auto_219440 ) ) ( not ( = ?auto_219439 ?auto_219441 ) ) ( not ( = ?auto_219439 ?auto_219442 ) ) ( not ( = ?auto_219439 ?auto_219443 ) ) ( not ( = ?auto_219439 ?auto_219444 ) ) ( not ( = ?auto_219439 ?auto_219445 ) ) ( not ( = ?auto_219439 ?auto_219446 ) ) ( not ( = ?auto_219439 ?auto_219447 ) ) ( not ( = ?auto_219439 ?auto_219448 ) ) ( not ( = ?auto_219440 ?auto_219441 ) ) ( not ( = ?auto_219440 ?auto_219442 ) ) ( not ( = ?auto_219440 ?auto_219443 ) ) ( not ( = ?auto_219440 ?auto_219444 ) ) ( not ( = ?auto_219440 ?auto_219445 ) ) ( not ( = ?auto_219440 ?auto_219446 ) ) ( not ( = ?auto_219440 ?auto_219447 ) ) ( not ( = ?auto_219440 ?auto_219448 ) ) ( not ( = ?auto_219441 ?auto_219442 ) ) ( not ( = ?auto_219441 ?auto_219443 ) ) ( not ( = ?auto_219441 ?auto_219444 ) ) ( not ( = ?auto_219441 ?auto_219445 ) ) ( not ( = ?auto_219441 ?auto_219446 ) ) ( not ( = ?auto_219441 ?auto_219447 ) ) ( not ( = ?auto_219441 ?auto_219448 ) ) ( not ( = ?auto_219442 ?auto_219443 ) ) ( not ( = ?auto_219442 ?auto_219444 ) ) ( not ( = ?auto_219442 ?auto_219445 ) ) ( not ( = ?auto_219442 ?auto_219446 ) ) ( not ( = ?auto_219442 ?auto_219447 ) ) ( not ( = ?auto_219442 ?auto_219448 ) ) ( not ( = ?auto_219443 ?auto_219444 ) ) ( not ( = ?auto_219443 ?auto_219445 ) ) ( not ( = ?auto_219443 ?auto_219446 ) ) ( not ( = ?auto_219443 ?auto_219447 ) ) ( not ( = ?auto_219443 ?auto_219448 ) ) ( not ( = ?auto_219444 ?auto_219445 ) ) ( not ( = ?auto_219444 ?auto_219446 ) ) ( not ( = ?auto_219444 ?auto_219447 ) ) ( not ( = ?auto_219444 ?auto_219448 ) ) ( not ( = ?auto_219445 ?auto_219446 ) ) ( not ( = ?auto_219445 ?auto_219447 ) ) ( not ( = ?auto_219445 ?auto_219448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219446 ?auto_219447 ?auto_219448 )
      ( MAKE-9CRATE-VERIFY ?auto_219439 ?auto_219440 ?auto_219441 ?auto_219442 ?auto_219443 ?auto_219444 ?auto_219445 ?auto_219446 ?auto_219447 ?auto_219448 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219547 - SURFACE
      ?auto_219548 - SURFACE
      ?auto_219549 - SURFACE
      ?auto_219550 - SURFACE
      ?auto_219551 - SURFACE
      ?auto_219552 - SURFACE
      ?auto_219553 - SURFACE
      ?auto_219554 - SURFACE
      ?auto_219555 - SURFACE
      ?auto_219556 - SURFACE
    )
    :vars
    (
      ?auto_219557 - HOIST
      ?auto_219562 - PLACE
      ?auto_219559 - TRUCK
      ?auto_219560 - PLACE
      ?auto_219561 - HOIST
      ?auto_219558 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_219557 ?auto_219562 ) ( SURFACE-AT ?auto_219555 ?auto_219562 ) ( CLEAR ?auto_219555 ) ( IS-CRATE ?auto_219556 ) ( not ( = ?auto_219555 ?auto_219556 ) ) ( AVAILABLE ?auto_219557 ) ( ON ?auto_219555 ?auto_219554 ) ( not ( = ?auto_219554 ?auto_219555 ) ) ( not ( = ?auto_219554 ?auto_219556 ) ) ( TRUCK-AT ?auto_219559 ?auto_219560 ) ( not ( = ?auto_219560 ?auto_219562 ) ) ( HOIST-AT ?auto_219561 ?auto_219560 ) ( not ( = ?auto_219557 ?auto_219561 ) ) ( AVAILABLE ?auto_219561 ) ( SURFACE-AT ?auto_219556 ?auto_219560 ) ( ON ?auto_219556 ?auto_219558 ) ( CLEAR ?auto_219556 ) ( not ( = ?auto_219555 ?auto_219558 ) ) ( not ( = ?auto_219556 ?auto_219558 ) ) ( not ( = ?auto_219554 ?auto_219558 ) ) ( ON ?auto_219548 ?auto_219547 ) ( ON ?auto_219549 ?auto_219548 ) ( ON ?auto_219550 ?auto_219549 ) ( ON ?auto_219551 ?auto_219550 ) ( ON ?auto_219552 ?auto_219551 ) ( ON ?auto_219553 ?auto_219552 ) ( ON ?auto_219554 ?auto_219553 ) ( not ( = ?auto_219547 ?auto_219548 ) ) ( not ( = ?auto_219547 ?auto_219549 ) ) ( not ( = ?auto_219547 ?auto_219550 ) ) ( not ( = ?auto_219547 ?auto_219551 ) ) ( not ( = ?auto_219547 ?auto_219552 ) ) ( not ( = ?auto_219547 ?auto_219553 ) ) ( not ( = ?auto_219547 ?auto_219554 ) ) ( not ( = ?auto_219547 ?auto_219555 ) ) ( not ( = ?auto_219547 ?auto_219556 ) ) ( not ( = ?auto_219547 ?auto_219558 ) ) ( not ( = ?auto_219548 ?auto_219549 ) ) ( not ( = ?auto_219548 ?auto_219550 ) ) ( not ( = ?auto_219548 ?auto_219551 ) ) ( not ( = ?auto_219548 ?auto_219552 ) ) ( not ( = ?auto_219548 ?auto_219553 ) ) ( not ( = ?auto_219548 ?auto_219554 ) ) ( not ( = ?auto_219548 ?auto_219555 ) ) ( not ( = ?auto_219548 ?auto_219556 ) ) ( not ( = ?auto_219548 ?auto_219558 ) ) ( not ( = ?auto_219549 ?auto_219550 ) ) ( not ( = ?auto_219549 ?auto_219551 ) ) ( not ( = ?auto_219549 ?auto_219552 ) ) ( not ( = ?auto_219549 ?auto_219553 ) ) ( not ( = ?auto_219549 ?auto_219554 ) ) ( not ( = ?auto_219549 ?auto_219555 ) ) ( not ( = ?auto_219549 ?auto_219556 ) ) ( not ( = ?auto_219549 ?auto_219558 ) ) ( not ( = ?auto_219550 ?auto_219551 ) ) ( not ( = ?auto_219550 ?auto_219552 ) ) ( not ( = ?auto_219550 ?auto_219553 ) ) ( not ( = ?auto_219550 ?auto_219554 ) ) ( not ( = ?auto_219550 ?auto_219555 ) ) ( not ( = ?auto_219550 ?auto_219556 ) ) ( not ( = ?auto_219550 ?auto_219558 ) ) ( not ( = ?auto_219551 ?auto_219552 ) ) ( not ( = ?auto_219551 ?auto_219553 ) ) ( not ( = ?auto_219551 ?auto_219554 ) ) ( not ( = ?auto_219551 ?auto_219555 ) ) ( not ( = ?auto_219551 ?auto_219556 ) ) ( not ( = ?auto_219551 ?auto_219558 ) ) ( not ( = ?auto_219552 ?auto_219553 ) ) ( not ( = ?auto_219552 ?auto_219554 ) ) ( not ( = ?auto_219552 ?auto_219555 ) ) ( not ( = ?auto_219552 ?auto_219556 ) ) ( not ( = ?auto_219552 ?auto_219558 ) ) ( not ( = ?auto_219553 ?auto_219554 ) ) ( not ( = ?auto_219553 ?auto_219555 ) ) ( not ( = ?auto_219553 ?auto_219556 ) ) ( not ( = ?auto_219553 ?auto_219558 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219554 ?auto_219555 ?auto_219556 )
      ( MAKE-9CRATE-VERIFY ?auto_219547 ?auto_219548 ?auto_219549 ?auto_219550 ?auto_219551 ?auto_219552 ?auto_219553 ?auto_219554 ?auto_219555 ?auto_219556 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219656 - SURFACE
      ?auto_219657 - SURFACE
      ?auto_219658 - SURFACE
      ?auto_219659 - SURFACE
      ?auto_219660 - SURFACE
      ?auto_219661 - SURFACE
      ?auto_219662 - SURFACE
      ?auto_219663 - SURFACE
      ?auto_219664 - SURFACE
      ?auto_219665 - SURFACE
    )
    :vars
    (
      ?auto_219670 - HOIST
      ?auto_219671 - PLACE
      ?auto_219666 - PLACE
      ?auto_219668 - HOIST
      ?auto_219669 - SURFACE
      ?auto_219667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_219670 ?auto_219671 ) ( SURFACE-AT ?auto_219664 ?auto_219671 ) ( CLEAR ?auto_219664 ) ( IS-CRATE ?auto_219665 ) ( not ( = ?auto_219664 ?auto_219665 ) ) ( AVAILABLE ?auto_219670 ) ( ON ?auto_219664 ?auto_219663 ) ( not ( = ?auto_219663 ?auto_219664 ) ) ( not ( = ?auto_219663 ?auto_219665 ) ) ( not ( = ?auto_219666 ?auto_219671 ) ) ( HOIST-AT ?auto_219668 ?auto_219666 ) ( not ( = ?auto_219670 ?auto_219668 ) ) ( AVAILABLE ?auto_219668 ) ( SURFACE-AT ?auto_219665 ?auto_219666 ) ( ON ?auto_219665 ?auto_219669 ) ( CLEAR ?auto_219665 ) ( not ( = ?auto_219664 ?auto_219669 ) ) ( not ( = ?auto_219665 ?auto_219669 ) ) ( not ( = ?auto_219663 ?auto_219669 ) ) ( TRUCK-AT ?auto_219667 ?auto_219671 ) ( ON ?auto_219657 ?auto_219656 ) ( ON ?auto_219658 ?auto_219657 ) ( ON ?auto_219659 ?auto_219658 ) ( ON ?auto_219660 ?auto_219659 ) ( ON ?auto_219661 ?auto_219660 ) ( ON ?auto_219662 ?auto_219661 ) ( ON ?auto_219663 ?auto_219662 ) ( not ( = ?auto_219656 ?auto_219657 ) ) ( not ( = ?auto_219656 ?auto_219658 ) ) ( not ( = ?auto_219656 ?auto_219659 ) ) ( not ( = ?auto_219656 ?auto_219660 ) ) ( not ( = ?auto_219656 ?auto_219661 ) ) ( not ( = ?auto_219656 ?auto_219662 ) ) ( not ( = ?auto_219656 ?auto_219663 ) ) ( not ( = ?auto_219656 ?auto_219664 ) ) ( not ( = ?auto_219656 ?auto_219665 ) ) ( not ( = ?auto_219656 ?auto_219669 ) ) ( not ( = ?auto_219657 ?auto_219658 ) ) ( not ( = ?auto_219657 ?auto_219659 ) ) ( not ( = ?auto_219657 ?auto_219660 ) ) ( not ( = ?auto_219657 ?auto_219661 ) ) ( not ( = ?auto_219657 ?auto_219662 ) ) ( not ( = ?auto_219657 ?auto_219663 ) ) ( not ( = ?auto_219657 ?auto_219664 ) ) ( not ( = ?auto_219657 ?auto_219665 ) ) ( not ( = ?auto_219657 ?auto_219669 ) ) ( not ( = ?auto_219658 ?auto_219659 ) ) ( not ( = ?auto_219658 ?auto_219660 ) ) ( not ( = ?auto_219658 ?auto_219661 ) ) ( not ( = ?auto_219658 ?auto_219662 ) ) ( not ( = ?auto_219658 ?auto_219663 ) ) ( not ( = ?auto_219658 ?auto_219664 ) ) ( not ( = ?auto_219658 ?auto_219665 ) ) ( not ( = ?auto_219658 ?auto_219669 ) ) ( not ( = ?auto_219659 ?auto_219660 ) ) ( not ( = ?auto_219659 ?auto_219661 ) ) ( not ( = ?auto_219659 ?auto_219662 ) ) ( not ( = ?auto_219659 ?auto_219663 ) ) ( not ( = ?auto_219659 ?auto_219664 ) ) ( not ( = ?auto_219659 ?auto_219665 ) ) ( not ( = ?auto_219659 ?auto_219669 ) ) ( not ( = ?auto_219660 ?auto_219661 ) ) ( not ( = ?auto_219660 ?auto_219662 ) ) ( not ( = ?auto_219660 ?auto_219663 ) ) ( not ( = ?auto_219660 ?auto_219664 ) ) ( not ( = ?auto_219660 ?auto_219665 ) ) ( not ( = ?auto_219660 ?auto_219669 ) ) ( not ( = ?auto_219661 ?auto_219662 ) ) ( not ( = ?auto_219661 ?auto_219663 ) ) ( not ( = ?auto_219661 ?auto_219664 ) ) ( not ( = ?auto_219661 ?auto_219665 ) ) ( not ( = ?auto_219661 ?auto_219669 ) ) ( not ( = ?auto_219662 ?auto_219663 ) ) ( not ( = ?auto_219662 ?auto_219664 ) ) ( not ( = ?auto_219662 ?auto_219665 ) ) ( not ( = ?auto_219662 ?auto_219669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219663 ?auto_219664 ?auto_219665 )
      ( MAKE-9CRATE-VERIFY ?auto_219656 ?auto_219657 ?auto_219658 ?auto_219659 ?auto_219660 ?auto_219661 ?auto_219662 ?auto_219663 ?auto_219664 ?auto_219665 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219765 - SURFACE
      ?auto_219766 - SURFACE
      ?auto_219767 - SURFACE
      ?auto_219768 - SURFACE
      ?auto_219769 - SURFACE
      ?auto_219770 - SURFACE
      ?auto_219771 - SURFACE
      ?auto_219772 - SURFACE
      ?auto_219773 - SURFACE
      ?auto_219774 - SURFACE
    )
    :vars
    (
      ?auto_219776 - HOIST
      ?auto_219778 - PLACE
      ?auto_219777 - PLACE
      ?auto_219775 - HOIST
      ?auto_219779 - SURFACE
      ?auto_219780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_219776 ?auto_219778 ) ( IS-CRATE ?auto_219774 ) ( not ( = ?auto_219773 ?auto_219774 ) ) ( not ( = ?auto_219772 ?auto_219773 ) ) ( not ( = ?auto_219772 ?auto_219774 ) ) ( not ( = ?auto_219777 ?auto_219778 ) ) ( HOIST-AT ?auto_219775 ?auto_219777 ) ( not ( = ?auto_219776 ?auto_219775 ) ) ( AVAILABLE ?auto_219775 ) ( SURFACE-AT ?auto_219774 ?auto_219777 ) ( ON ?auto_219774 ?auto_219779 ) ( CLEAR ?auto_219774 ) ( not ( = ?auto_219773 ?auto_219779 ) ) ( not ( = ?auto_219774 ?auto_219779 ) ) ( not ( = ?auto_219772 ?auto_219779 ) ) ( TRUCK-AT ?auto_219780 ?auto_219778 ) ( SURFACE-AT ?auto_219772 ?auto_219778 ) ( CLEAR ?auto_219772 ) ( LIFTING ?auto_219776 ?auto_219773 ) ( IS-CRATE ?auto_219773 ) ( ON ?auto_219766 ?auto_219765 ) ( ON ?auto_219767 ?auto_219766 ) ( ON ?auto_219768 ?auto_219767 ) ( ON ?auto_219769 ?auto_219768 ) ( ON ?auto_219770 ?auto_219769 ) ( ON ?auto_219771 ?auto_219770 ) ( ON ?auto_219772 ?auto_219771 ) ( not ( = ?auto_219765 ?auto_219766 ) ) ( not ( = ?auto_219765 ?auto_219767 ) ) ( not ( = ?auto_219765 ?auto_219768 ) ) ( not ( = ?auto_219765 ?auto_219769 ) ) ( not ( = ?auto_219765 ?auto_219770 ) ) ( not ( = ?auto_219765 ?auto_219771 ) ) ( not ( = ?auto_219765 ?auto_219772 ) ) ( not ( = ?auto_219765 ?auto_219773 ) ) ( not ( = ?auto_219765 ?auto_219774 ) ) ( not ( = ?auto_219765 ?auto_219779 ) ) ( not ( = ?auto_219766 ?auto_219767 ) ) ( not ( = ?auto_219766 ?auto_219768 ) ) ( not ( = ?auto_219766 ?auto_219769 ) ) ( not ( = ?auto_219766 ?auto_219770 ) ) ( not ( = ?auto_219766 ?auto_219771 ) ) ( not ( = ?auto_219766 ?auto_219772 ) ) ( not ( = ?auto_219766 ?auto_219773 ) ) ( not ( = ?auto_219766 ?auto_219774 ) ) ( not ( = ?auto_219766 ?auto_219779 ) ) ( not ( = ?auto_219767 ?auto_219768 ) ) ( not ( = ?auto_219767 ?auto_219769 ) ) ( not ( = ?auto_219767 ?auto_219770 ) ) ( not ( = ?auto_219767 ?auto_219771 ) ) ( not ( = ?auto_219767 ?auto_219772 ) ) ( not ( = ?auto_219767 ?auto_219773 ) ) ( not ( = ?auto_219767 ?auto_219774 ) ) ( not ( = ?auto_219767 ?auto_219779 ) ) ( not ( = ?auto_219768 ?auto_219769 ) ) ( not ( = ?auto_219768 ?auto_219770 ) ) ( not ( = ?auto_219768 ?auto_219771 ) ) ( not ( = ?auto_219768 ?auto_219772 ) ) ( not ( = ?auto_219768 ?auto_219773 ) ) ( not ( = ?auto_219768 ?auto_219774 ) ) ( not ( = ?auto_219768 ?auto_219779 ) ) ( not ( = ?auto_219769 ?auto_219770 ) ) ( not ( = ?auto_219769 ?auto_219771 ) ) ( not ( = ?auto_219769 ?auto_219772 ) ) ( not ( = ?auto_219769 ?auto_219773 ) ) ( not ( = ?auto_219769 ?auto_219774 ) ) ( not ( = ?auto_219769 ?auto_219779 ) ) ( not ( = ?auto_219770 ?auto_219771 ) ) ( not ( = ?auto_219770 ?auto_219772 ) ) ( not ( = ?auto_219770 ?auto_219773 ) ) ( not ( = ?auto_219770 ?auto_219774 ) ) ( not ( = ?auto_219770 ?auto_219779 ) ) ( not ( = ?auto_219771 ?auto_219772 ) ) ( not ( = ?auto_219771 ?auto_219773 ) ) ( not ( = ?auto_219771 ?auto_219774 ) ) ( not ( = ?auto_219771 ?auto_219779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219772 ?auto_219773 ?auto_219774 )
      ( MAKE-9CRATE-VERIFY ?auto_219765 ?auto_219766 ?auto_219767 ?auto_219768 ?auto_219769 ?auto_219770 ?auto_219771 ?auto_219772 ?auto_219773 ?auto_219774 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219874 - SURFACE
      ?auto_219875 - SURFACE
      ?auto_219876 - SURFACE
      ?auto_219877 - SURFACE
      ?auto_219878 - SURFACE
      ?auto_219879 - SURFACE
      ?auto_219880 - SURFACE
      ?auto_219881 - SURFACE
      ?auto_219882 - SURFACE
      ?auto_219883 - SURFACE
    )
    :vars
    (
      ?auto_219886 - HOIST
      ?auto_219889 - PLACE
      ?auto_219885 - PLACE
      ?auto_219888 - HOIST
      ?auto_219887 - SURFACE
      ?auto_219884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_219886 ?auto_219889 ) ( IS-CRATE ?auto_219883 ) ( not ( = ?auto_219882 ?auto_219883 ) ) ( not ( = ?auto_219881 ?auto_219882 ) ) ( not ( = ?auto_219881 ?auto_219883 ) ) ( not ( = ?auto_219885 ?auto_219889 ) ) ( HOIST-AT ?auto_219888 ?auto_219885 ) ( not ( = ?auto_219886 ?auto_219888 ) ) ( AVAILABLE ?auto_219888 ) ( SURFACE-AT ?auto_219883 ?auto_219885 ) ( ON ?auto_219883 ?auto_219887 ) ( CLEAR ?auto_219883 ) ( not ( = ?auto_219882 ?auto_219887 ) ) ( not ( = ?auto_219883 ?auto_219887 ) ) ( not ( = ?auto_219881 ?auto_219887 ) ) ( TRUCK-AT ?auto_219884 ?auto_219889 ) ( SURFACE-AT ?auto_219881 ?auto_219889 ) ( CLEAR ?auto_219881 ) ( IS-CRATE ?auto_219882 ) ( AVAILABLE ?auto_219886 ) ( IN ?auto_219882 ?auto_219884 ) ( ON ?auto_219875 ?auto_219874 ) ( ON ?auto_219876 ?auto_219875 ) ( ON ?auto_219877 ?auto_219876 ) ( ON ?auto_219878 ?auto_219877 ) ( ON ?auto_219879 ?auto_219878 ) ( ON ?auto_219880 ?auto_219879 ) ( ON ?auto_219881 ?auto_219880 ) ( not ( = ?auto_219874 ?auto_219875 ) ) ( not ( = ?auto_219874 ?auto_219876 ) ) ( not ( = ?auto_219874 ?auto_219877 ) ) ( not ( = ?auto_219874 ?auto_219878 ) ) ( not ( = ?auto_219874 ?auto_219879 ) ) ( not ( = ?auto_219874 ?auto_219880 ) ) ( not ( = ?auto_219874 ?auto_219881 ) ) ( not ( = ?auto_219874 ?auto_219882 ) ) ( not ( = ?auto_219874 ?auto_219883 ) ) ( not ( = ?auto_219874 ?auto_219887 ) ) ( not ( = ?auto_219875 ?auto_219876 ) ) ( not ( = ?auto_219875 ?auto_219877 ) ) ( not ( = ?auto_219875 ?auto_219878 ) ) ( not ( = ?auto_219875 ?auto_219879 ) ) ( not ( = ?auto_219875 ?auto_219880 ) ) ( not ( = ?auto_219875 ?auto_219881 ) ) ( not ( = ?auto_219875 ?auto_219882 ) ) ( not ( = ?auto_219875 ?auto_219883 ) ) ( not ( = ?auto_219875 ?auto_219887 ) ) ( not ( = ?auto_219876 ?auto_219877 ) ) ( not ( = ?auto_219876 ?auto_219878 ) ) ( not ( = ?auto_219876 ?auto_219879 ) ) ( not ( = ?auto_219876 ?auto_219880 ) ) ( not ( = ?auto_219876 ?auto_219881 ) ) ( not ( = ?auto_219876 ?auto_219882 ) ) ( not ( = ?auto_219876 ?auto_219883 ) ) ( not ( = ?auto_219876 ?auto_219887 ) ) ( not ( = ?auto_219877 ?auto_219878 ) ) ( not ( = ?auto_219877 ?auto_219879 ) ) ( not ( = ?auto_219877 ?auto_219880 ) ) ( not ( = ?auto_219877 ?auto_219881 ) ) ( not ( = ?auto_219877 ?auto_219882 ) ) ( not ( = ?auto_219877 ?auto_219883 ) ) ( not ( = ?auto_219877 ?auto_219887 ) ) ( not ( = ?auto_219878 ?auto_219879 ) ) ( not ( = ?auto_219878 ?auto_219880 ) ) ( not ( = ?auto_219878 ?auto_219881 ) ) ( not ( = ?auto_219878 ?auto_219882 ) ) ( not ( = ?auto_219878 ?auto_219883 ) ) ( not ( = ?auto_219878 ?auto_219887 ) ) ( not ( = ?auto_219879 ?auto_219880 ) ) ( not ( = ?auto_219879 ?auto_219881 ) ) ( not ( = ?auto_219879 ?auto_219882 ) ) ( not ( = ?auto_219879 ?auto_219883 ) ) ( not ( = ?auto_219879 ?auto_219887 ) ) ( not ( = ?auto_219880 ?auto_219881 ) ) ( not ( = ?auto_219880 ?auto_219882 ) ) ( not ( = ?auto_219880 ?auto_219883 ) ) ( not ( = ?auto_219880 ?auto_219887 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219881 ?auto_219882 ?auto_219883 )
      ( MAKE-9CRATE-VERIFY ?auto_219874 ?auto_219875 ?auto_219876 ?auto_219877 ?auto_219878 ?auto_219879 ?auto_219880 ?auto_219881 ?auto_219882 ?auto_219883 ) )
  )

)

