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

  ( :method MAKE-10CRATE-VERIFY
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
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
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
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
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
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
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
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108753 - SURFACE
      ?auto_1108754 - SURFACE
    )
    :vars
    (
      ?auto_1108755 - HOIST
      ?auto_1108756 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108755 ?auto_1108756 ) ( SURFACE-AT ?auto_1108753 ?auto_1108756 ) ( CLEAR ?auto_1108753 ) ( LIFTING ?auto_1108755 ?auto_1108754 ) ( IS-CRATE ?auto_1108754 ) ( not ( = ?auto_1108753 ?auto_1108754 ) ) )
    :subtasks
    ( ( !DROP ?auto_1108755 ?auto_1108754 ?auto_1108753 ?auto_1108756 )
      ( MAKE-1CRATE-VERIFY ?auto_1108753 ?auto_1108754 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108757 - SURFACE
      ?auto_1108758 - SURFACE
    )
    :vars
    (
      ?auto_1108760 - HOIST
      ?auto_1108759 - PLACE
      ?auto_1108761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108760 ?auto_1108759 ) ( SURFACE-AT ?auto_1108757 ?auto_1108759 ) ( CLEAR ?auto_1108757 ) ( IS-CRATE ?auto_1108758 ) ( not ( = ?auto_1108757 ?auto_1108758 ) ) ( TRUCK-AT ?auto_1108761 ?auto_1108759 ) ( AVAILABLE ?auto_1108760 ) ( IN ?auto_1108758 ?auto_1108761 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1108760 ?auto_1108758 ?auto_1108761 ?auto_1108759 )
      ( MAKE-1CRATE ?auto_1108757 ?auto_1108758 )
      ( MAKE-1CRATE-VERIFY ?auto_1108757 ?auto_1108758 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108762 - SURFACE
      ?auto_1108763 - SURFACE
    )
    :vars
    (
      ?auto_1108765 - HOIST
      ?auto_1108766 - PLACE
      ?auto_1108764 - TRUCK
      ?auto_1108767 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108765 ?auto_1108766 ) ( SURFACE-AT ?auto_1108762 ?auto_1108766 ) ( CLEAR ?auto_1108762 ) ( IS-CRATE ?auto_1108763 ) ( not ( = ?auto_1108762 ?auto_1108763 ) ) ( AVAILABLE ?auto_1108765 ) ( IN ?auto_1108763 ?auto_1108764 ) ( TRUCK-AT ?auto_1108764 ?auto_1108767 ) ( not ( = ?auto_1108767 ?auto_1108766 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1108764 ?auto_1108767 ?auto_1108766 )
      ( MAKE-1CRATE ?auto_1108762 ?auto_1108763 )
      ( MAKE-1CRATE-VERIFY ?auto_1108762 ?auto_1108763 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108768 - SURFACE
      ?auto_1108769 - SURFACE
    )
    :vars
    (
      ?auto_1108770 - HOIST
      ?auto_1108772 - PLACE
      ?auto_1108773 - TRUCK
      ?auto_1108771 - PLACE
      ?auto_1108774 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108770 ?auto_1108772 ) ( SURFACE-AT ?auto_1108768 ?auto_1108772 ) ( CLEAR ?auto_1108768 ) ( IS-CRATE ?auto_1108769 ) ( not ( = ?auto_1108768 ?auto_1108769 ) ) ( AVAILABLE ?auto_1108770 ) ( TRUCK-AT ?auto_1108773 ?auto_1108771 ) ( not ( = ?auto_1108771 ?auto_1108772 ) ) ( HOIST-AT ?auto_1108774 ?auto_1108771 ) ( LIFTING ?auto_1108774 ?auto_1108769 ) ( not ( = ?auto_1108770 ?auto_1108774 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1108774 ?auto_1108769 ?auto_1108773 ?auto_1108771 )
      ( MAKE-1CRATE ?auto_1108768 ?auto_1108769 )
      ( MAKE-1CRATE-VERIFY ?auto_1108768 ?auto_1108769 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108775 - SURFACE
      ?auto_1108776 - SURFACE
    )
    :vars
    (
      ?auto_1108778 - HOIST
      ?auto_1108777 - PLACE
      ?auto_1108780 - TRUCK
      ?auto_1108781 - PLACE
      ?auto_1108779 - HOIST
      ?auto_1108782 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108778 ?auto_1108777 ) ( SURFACE-AT ?auto_1108775 ?auto_1108777 ) ( CLEAR ?auto_1108775 ) ( IS-CRATE ?auto_1108776 ) ( not ( = ?auto_1108775 ?auto_1108776 ) ) ( AVAILABLE ?auto_1108778 ) ( TRUCK-AT ?auto_1108780 ?auto_1108781 ) ( not ( = ?auto_1108781 ?auto_1108777 ) ) ( HOIST-AT ?auto_1108779 ?auto_1108781 ) ( not ( = ?auto_1108778 ?auto_1108779 ) ) ( AVAILABLE ?auto_1108779 ) ( SURFACE-AT ?auto_1108776 ?auto_1108781 ) ( ON ?auto_1108776 ?auto_1108782 ) ( CLEAR ?auto_1108776 ) ( not ( = ?auto_1108775 ?auto_1108782 ) ) ( not ( = ?auto_1108776 ?auto_1108782 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1108779 ?auto_1108776 ?auto_1108782 ?auto_1108781 )
      ( MAKE-1CRATE ?auto_1108775 ?auto_1108776 )
      ( MAKE-1CRATE-VERIFY ?auto_1108775 ?auto_1108776 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108783 - SURFACE
      ?auto_1108784 - SURFACE
    )
    :vars
    (
      ?auto_1108785 - HOIST
      ?auto_1108790 - PLACE
      ?auto_1108789 - PLACE
      ?auto_1108788 - HOIST
      ?auto_1108787 - SURFACE
      ?auto_1108786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108785 ?auto_1108790 ) ( SURFACE-AT ?auto_1108783 ?auto_1108790 ) ( CLEAR ?auto_1108783 ) ( IS-CRATE ?auto_1108784 ) ( not ( = ?auto_1108783 ?auto_1108784 ) ) ( AVAILABLE ?auto_1108785 ) ( not ( = ?auto_1108789 ?auto_1108790 ) ) ( HOIST-AT ?auto_1108788 ?auto_1108789 ) ( not ( = ?auto_1108785 ?auto_1108788 ) ) ( AVAILABLE ?auto_1108788 ) ( SURFACE-AT ?auto_1108784 ?auto_1108789 ) ( ON ?auto_1108784 ?auto_1108787 ) ( CLEAR ?auto_1108784 ) ( not ( = ?auto_1108783 ?auto_1108787 ) ) ( not ( = ?auto_1108784 ?auto_1108787 ) ) ( TRUCK-AT ?auto_1108786 ?auto_1108790 ) )
    :subtasks
    ( ( !DRIVE ?auto_1108786 ?auto_1108790 ?auto_1108789 )
      ( MAKE-1CRATE ?auto_1108783 ?auto_1108784 )
      ( MAKE-1CRATE-VERIFY ?auto_1108783 ?auto_1108784 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108800 - SURFACE
      ?auto_1108801 - SURFACE
      ?auto_1108802 - SURFACE
    )
    :vars
    (
      ?auto_1108804 - HOIST
      ?auto_1108803 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108804 ?auto_1108803 ) ( SURFACE-AT ?auto_1108801 ?auto_1108803 ) ( CLEAR ?auto_1108801 ) ( LIFTING ?auto_1108804 ?auto_1108802 ) ( IS-CRATE ?auto_1108802 ) ( not ( = ?auto_1108801 ?auto_1108802 ) ) ( ON ?auto_1108801 ?auto_1108800 ) ( not ( = ?auto_1108800 ?auto_1108801 ) ) ( not ( = ?auto_1108800 ?auto_1108802 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108801 ?auto_1108802 )
      ( MAKE-2CRATE-VERIFY ?auto_1108800 ?auto_1108801 ?auto_1108802 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108810 - SURFACE
      ?auto_1108811 - SURFACE
      ?auto_1108812 - SURFACE
    )
    :vars
    (
      ?auto_1108814 - HOIST
      ?auto_1108815 - PLACE
      ?auto_1108813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108814 ?auto_1108815 ) ( SURFACE-AT ?auto_1108811 ?auto_1108815 ) ( CLEAR ?auto_1108811 ) ( IS-CRATE ?auto_1108812 ) ( not ( = ?auto_1108811 ?auto_1108812 ) ) ( TRUCK-AT ?auto_1108813 ?auto_1108815 ) ( AVAILABLE ?auto_1108814 ) ( IN ?auto_1108812 ?auto_1108813 ) ( ON ?auto_1108811 ?auto_1108810 ) ( not ( = ?auto_1108810 ?auto_1108811 ) ) ( not ( = ?auto_1108810 ?auto_1108812 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108811 ?auto_1108812 )
      ( MAKE-2CRATE-VERIFY ?auto_1108810 ?auto_1108811 ?auto_1108812 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108816 - SURFACE
      ?auto_1108817 - SURFACE
    )
    :vars
    (
      ?auto_1108819 - HOIST
      ?auto_1108818 - PLACE
      ?auto_1108821 - TRUCK
      ?auto_1108820 - SURFACE
      ?auto_1108822 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108819 ?auto_1108818 ) ( SURFACE-AT ?auto_1108816 ?auto_1108818 ) ( CLEAR ?auto_1108816 ) ( IS-CRATE ?auto_1108817 ) ( not ( = ?auto_1108816 ?auto_1108817 ) ) ( AVAILABLE ?auto_1108819 ) ( IN ?auto_1108817 ?auto_1108821 ) ( ON ?auto_1108816 ?auto_1108820 ) ( not ( = ?auto_1108820 ?auto_1108816 ) ) ( not ( = ?auto_1108820 ?auto_1108817 ) ) ( TRUCK-AT ?auto_1108821 ?auto_1108822 ) ( not ( = ?auto_1108822 ?auto_1108818 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1108821 ?auto_1108822 ?auto_1108818 )
      ( MAKE-2CRATE ?auto_1108820 ?auto_1108816 ?auto_1108817 )
      ( MAKE-1CRATE-VERIFY ?auto_1108816 ?auto_1108817 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108823 - SURFACE
      ?auto_1108824 - SURFACE
      ?auto_1108825 - SURFACE
    )
    :vars
    (
      ?auto_1108827 - HOIST
      ?auto_1108829 - PLACE
      ?auto_1108828 - TRUCK
      ?auto_1108826 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108827 ?auto_1108829 ) ( SURFACE-AT ?auto_1108824 ?auto_1108829 ) ( CLEAR ?auto_1108824 ) ( IS-CRATE ?auto_1108825 ) ( not ( = ?auto_1108824 ?auto_1108825 ) ) ( AVAILABLE ?auto_1108827 ) ( IN ?auto_1108825 ?auto_1108828 ) ( ON ?auto_1108824 ?auto_1108823 ) ( not ( = ?auto_1108823 ?auto_1108824 ) ) ( not ( = ?auto_1108823 ?auto_1108825 ) ) ( TRUCK-AT ?auto_1108828 ?auto_1108826 ) ( not ( = ?auto_1108826 ?auto_1108829 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108824 ?auto_1108825 )
      ( MAKE-2CRATE-VERIFY ?auto_1108823 ?auto_1108824 ?auto_1108825 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108830 - SURFACE
      ?auto_1108831 - SURFACE
    )
    :vars
    (
      ?auto_1108833 - HOIST
      ?auto_1108834 - PLACE
      ?auto_1108832 - SURFACE
      ?auto_1108835 - TRUCK
      ?auto_1108836 - PLACE
      ?auto_1108837 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108833 ?auto_1108834 ) ( SURFACE-AT ?auto_1108830 ?auto_1108834 ) ( CLEAR ?auto_1108830 ) ( IS-CRATE ?auto_1108831 ) ( not ( = ?auto_1108830 ?auto_1108831 ) ) ( AVAILABLE ?auto_1108833 ) ( ON ?auto_1108830 ?auto_1108832 ) ( not ( = ?auto_1108832 ?auto_1108830 ) ) ( not ( = ?auto_1108832 ?auto_1108831 ) ) ( TRUCK-AT ?auto_1108835 ?auto_1108836 ) ( not ( = ?auto_1108836 ?auto_1108834 ) ) ( HOIST-AT ?auto_1108837 ?auto_1108836 ) ( LIFTING ?auto_1108837 ?auto_1108831 ) ( not ( = ?auto_1108833 ?auto_1108837 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1108837 ?auto_1108831 ?auto_1108835 ?auto_1108836 )
      ( MAKE-2CRATE ?auto_1108832 ?auto_1108830 ?auto_1108831 )
      ( MAKE-1CRATE-VERIFY ?auto_1108830 ?auto_1108831 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108838 - SURFACE
      ?auto_1108839 - SURFACE
      ?auto_1108840 - SURFACE
    )
    :vars
    (
      ?auto_1108845 - HOIST
      ?auto_1108844 - PLACE
      ?auto_1108841 - TRUCK
      ?auto_1108842 - PLACE
      ?auto_1108843 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108845 ?auto_1108844 ) ( SURFACE-AT ?auto_1108839 ?auto_1108844 ) ( CLEAR ?auto_1108839 ) ( IS-CRATE ?auto_1108840 ) ( not ( = ?auto_1108839 ?auto_1108840 ) ) ( AVAILABLE ?auto_1108845 ) ( ON ?auto_1108839 ?auto_1108838 ) ( not ( = ?auto_1108838 ?auto_1108839 ) ) ( not ( = ?auto_1108838 ?auto_1108840 ) ) ( TRUCK-AT ?auto_1108841 ?auto_1108842 ) ( not ( = ?auto_1108842 ?auto_1108844 ) ) ( HOIST-AT ?auto_1108843 ?auto_1108842 ) ( LIFTING ?auto_1108843 ?auto_1108840 ) ( not ( = ?auto_1108845 ?auto_1108843 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108839 ?auto_1108840 )
      ( MAKE-2CRATE-VERIFY ?auto_1108838 ?auto_1108839 ?auto_1108840 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108846 - SURFACE
      ?auto_1108847 - SURFACE
    )
    :vars
    (
      ?auto_1108849 - HOIST
      ?auto_1108853 - PLACE
      ?auto_1108848 - SURFACE
      ?auto_1108850 - TRUCK
      ?auto_1108852 - PLACE
      ?auto_1108851 - HOIST
      ?auto_1108854 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108849 ?auto_1108853 ) ( SURFACE-AT ?auto_1108846 ?auto_1108853 ) ( CLEAR ?auto_1108846 ) ( IS-CRATE ?auto_1108847 ) ( not ( = ?auto_1108846 ?auto_1108847 ) ) ( AVAILABLE ?auto_1108849 ) ( ON ?auto_1108846 ?auto_1108848 ) ( not ( = ?auto_1108848 ?auto_1108846 ) ) ( not ( = ?auto_1108848 ?auto_1108847 ) ) ( TRUCK-AT ?auto_1108850 ?auto_1108852 ) ( not ( = ?auto_1108852 ?auto_1108853 ) ) ( HOIST-AT ?auto_1108851 ?auto_1108852 ) ( not ( = ?auto_1108849 ?auto_1108851 ) ) ( AVAILABLE ?auto_1108851 ) ( SURFACE-AT ?auto_1108847 ?auto_1108852 ) ( ON ?auto_1108847 ?auto_1108854 ) ( CLEAR ?auto_1108847 ) ( not ( = ?auto_1108846 ?auto_1108854 ) ) ( not ( = ?auto_1108847 ?auto_1108854 ) ) ( not ( = ?auto_1108848 ?auto_1108854 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1108851 ?auto_1108847 ?auto_1108854 ?auto_1108852 )
      ( MAKE-2CRATE ?auto_1108848 ?auto_1108846 ?auto_1108847 )
      ( MAKE-1CRATE-VERIFY ?auto_1108846 ?auto_1108847 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108855 - SURFACE
      ?auto_1108856 - SURFACE
      ?auto_1108857 - SURFACE
    )
    :vars
    (
      ?auto_1108861 - HOIST
      ?auto_1108860 - PLACE
      ?auto_1108859 - TRUCK
      ?auto_1108863 - PLACE
      ?auto_1108858 - HOIST
      ?auto_1108862 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108861 ?auto_1108860 ) ( SURFACE-AT ?auto_1108856 ?auto_1108860 ) ( CLEAR ?auto_1108856 ) ( IS-CRATE ?auto_1108857 ) ( not ( = ?auto_1108856 ?auto_1108857 ) ) ( AVAILABLE ?auto_1108861 ) ( ON ?auto_1108856 ?auto_1108855 ) ( not ( = ?auto_1108855 ?auto_1108856 ) ) ( not ( = ?auto_1108855 ?auto_1108857 ) ) ( TRUCK-AT ?auto_1108859 ?auto_1108863 ) ( not ( = ?auto_1108863 ?auto_1108860 ) ) ( HOIST-AT ?auto_1108858 ?auto_1108863 ) ( not ( = ?auto_1108861 ?auto_1108858 ) ) ( AVAILABLE ?auto_1108858 ) ( SURFACE-AT ?auto_1108857 ?auto_1108863 ) ( ON ?auto_1108857 ?auto_1108862 ) ( CLEAR ?auto_1108857 ) ( not ( = ?auto_1108856 ?auto_1108862 ) ) ( not ( = ?auto_1108857 ?auto_1108862 ) ) ( not ( = ?auto_1108855 ?auto_1108862 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108856 ?auto_1108857 )
      ( MAKE-2CRATE-VERIFY ?auto_1108855 ?auto_1108856 ?auto_1108857 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108864 - SURFACE
      ?auto_1108865 - SURFACE
    )
    :vars
    (
      ?auto_1108871 - HOIST
      ?auto_1108872 - PLACE
      ?auto_1108869 - SURFACE
      ?auto_1108867 - PLACE
      ?auto_1108868 - HOIST
      ?auto_1108870 - SURFACE
      ?auto_1108866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108871 ?auto_1108872 ) ( SURFACE-AT ?auto_1108864 ?auto_1108872 ) ( CLEAR ?auto_1108864 ) ( IS-CRATE ?auto_1108865 ) ( not ( = ?auto_1108864 ?auto_1108865 ) ) ( AVAILABLE ?auto_1108871 ) ( ON ?auto_1108864 ?auto_1108869 ) ( not ( = ?auto_1108869 ?auto_1108864 ) ) ( not ( = ?auto_1108869 ?auto_1108865 ) ) ( not ( = ?auto_1108867 ?auto_1108872 ) ) ( HOIST-AT ?auto_1108868 ?auto_1108867 ) ( not ( = ?auto_1108871 ?auto_1108868 ) ) ( AVAILABLE ?auto_1108868 ) ( SURFACE-AT ?auto_1108865 ?auto_1108867 ) ( ON ?auto_1108865 ?auto_1108870 ) ( CLEAR ?auto_1108865 ) ( not ( = ?auto_1108864 ?auto_1108870 ) ) ( not ( = ?auto_1108865 ?auto_1108870 ) ) ( not ( = ?auto_1108869 ?auto_1108870 ) ) ( TRUCK-AT ?auto_1108866 ?auto_1108872 ) )
    :subtasks
    ( ( !DRIVE ?auto_1108866 ?auto_1108872 ?auto_1108867 )
      ( MAKE-2CRATE ?auto_1108869 ?auto_1108864 ?auto_1108865 )
      ( MAKE-1CRATE-VERIFY ?auto_1108864 ?auto_1108865 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108873 - SURFACE
      ?auto_1108874 - SURFACE
      ?auto_1108875 - SURFACE
    )
    :vars
    (
      ?auto_1108878 - HOIST
      ?auto_1108876 - PLACE
      ?auto_1108881 - PLACE
      ?auto_1108877 - HOIST
      ?auto_1108880 - SURFACE
      ?auto_1108879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108878 ?auto_1108876 ) ( SURFACE-AT ?auto_1108874 ?auto_1108876 ) ( CLEAR ?auto_1108874 ) ( IS-CRATE ?auto_1108875 ) ( not ( = ?auto_1108874 ?auto_1108875 ) ) ( AVAILABLE ?auto_1108878 ) ( ON ?auto_1108874 ?auto_1108873 ) ( not ( = ?auto_1108873 ?auto_1108874 ) ) ( not ( = ?auto_1108873 ?auto_1108875 ) ) ( not ( = ?auto_1108881 ?auto_1108876 ) ) ( HOIST-AT ?auto_1108877 ?auto_1108881 ) ( not ( = ?auto_1108878 ?auto_1108877 ) ) ( AVAILABLE ?auto_1108877 ) ( SURFACE-AT ?auto_1108875 ?auto_1108881 ) ( ON ?auto_1108875 ?auto_1108880 ) ( CLEAR ?auto_1108875 ) ( not ( = ?auto_1108874 ?auto_1108880 ) ) ( not ( = ?auto_1108875 ?auto_1108880 ) ) ( not ( = ?auto_1108873 ?auto_1108880 ) ) ( TRUCK-AT ?auto_1108879 ?auto_1108876 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108874 ?auto_1108875 )
      ( MAKE-2CRATE-VERIFY ?auto_1108873 ?auto_1108874 ?auto_1108875 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108882 - SURFACE
      ?auto_1108883 - SURFACE
    )
    :vars
    (
      ?auto_1108884 - HOIST
      ?auto_1108888 - PLACE
      ?auto_1108885 - SURFACE
      ?auto_1108889 - PLACE
      ?auto_1108887 - HOIST
      ?auto_1108890 - SURFACE
      ?auto_1108886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108884 ?auto_1108888 ) ( IS-CRATE ?auto_1108883 ) ( not ( = ?auto_1108882 ?auto_1108883 ) ) ( not ( = ?auto_1108885 ?auto_1108882 ) ) ( not ( = ?auto_1108885 ?auto_1108883 ) ) ( not ( = ?auto_1108889 ?auto_1108888 ) ) ( HOIST-AT ?auto_1108887 ?auto_1108889 ) ( not ( = ?auto_1108884 ?auto_1108887 ) ) ( AVAILABLE ?auto_1108887 ) ( SURFACE-AT ?auto_1108883 ?auto_1108889 ) ( ON ?auto_1108883 ?auto_1108890 ) ( CLEAR ?auto_1108883 ) ( not ( = ?auto_1108882 ?auto_1108890 ) ) ( not ( = ?auto_1108883 ?auto_1108890 ) ) ( not ( = ?auto_1108885 ?auto_1108890 ) ) ( TRUCK-AT ?auto_1108886 ?auto_1108888 ) ( SURFACE-AT ?auto_1108885 ?auto_1108888 ) ( CLEAR ?auto_1108885 ) ( LIFTING ?auto_1108884 ?auto_1108882 ) ( IS-CRATE ?auto_1108882 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108885 ?auto_1108882 )
      ( MAKE-2CRATE ?auto_1108885 ?auto_1108882 ?auto_1108883 )
      ( MAKE-1CRATE-VERIFY ?auto_1108882 ?auto_1108883 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108891 - SURFACE
      ?auto_1108892 - SURFACE
      ?auto_1108893 - SURFACE
    )
    :vars
    (
      ?auto_1108897 - HOIST
      ?auto_1108898 - PLACE
      ?auto_1108896 - PLACE
      ?auto_1108899 - HOIST
      ?auto_1108894 - SURFACE
      ?auto_1108895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108897 ?auto_1108898 ) ( IS-CRATE ?auto_1108893 ) ( not ( = ?auto_1108892 ?auto_1108893 ) ) ( not ( = ?auto_1108891 ?auto_1108892 ) ) ( not ( = ?auto_1108891 ?auto_1108893 ) ) ( not ( = ?auto_1108896 ?auto_1108898 ) ) ( HOIST-AT ?auto_1108899 ?auto_1108896 ) ( not ( = ?auto_1108897 ?auto_1108899 ) ) ( AVAILABLE ?auto_1108899 ) ( SURFACE-AT ?auto_1108893 ?auto_1108896 ) ( ON ?auto_1108893 ?auto_1108894 ) ( CLEAR ?auto_1108893 ) ( not ( = ?auto_1108892 ?auto_1108894 ) ) ( not ( = ?auto_1108893 ?auto_1108894 ) ) ( not ( = ?auto_1108891 ?auto_1108894 ) ) ( TRUCK-AT ?auto_1108895 ?auto_1108898 ) ( SURFACE-AT ?auto_1108891 ?auto_1108898 ) ( CLEAR ?auto_1108891 ) ( LIFTING ?auto_1108897 ?auto_1108892 ) ( IS-CRATE ?auto_1108892 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108892 ?auto_1108893 )
      ( MAKE-2CRATE-VERIFY ?auto_1108891 ?auto_1108892 ?auto_1108893 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108900 - SURFACE
      ?auto_1108901 - SURFACE
    )
    :vars
    (
      ?auto_1108902 - HOIST
      ?auto_1108903 - PLACE
      ?auto_1108905 - SURFACE
      ?auto_1108908 - PLACE
      ?auto_1108904 - HOIST
      ?auto_1108906 - SURFACE
      ?auto_1108907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108902 ?auto_1108903 ) ( IS-CRATE ?auto_1108901 ) ( not ( = ?auto_1108900 ?auto_1108901 ) ) ( not ( = ?auto_1108905 ?auto_1108900 ) ) ( not ( = ?auto_1108905 ?auto_1108901 ) ) ( not ( = ?auto_1108908 ?auto_1108903 ) ) ( HOIST-AT ?auto_1108904 ?auto_1108908 ) ( not ( = ?auto_1108902 ?auto_1108904 ) ) ( AVAILABLE ?auto_1108904 ) ( SURFACE-AT ?auto_1108901 ?auto_1108908 ) ( ON ?auto_1108901 ?auto_1108906 ) ( CLEAR ?auto_1108901 ) ( not ( = ?auto_1108900 ?auto_1108906 ) ) ( not ( = ?auto_1108901 ?auto_1108906 ) ) ( not ( = ?auto_1108905 ?auto_1108906 ) ) ( TRUCK-AT ?auto_1108907 ?auto_1108903 ) ( SURFACE-AT ?auto_1108905 ?auto_1108903 ) ( CLEAR ?auto_1108905 ) ( IS-CRATE ?auto_1108900 ) ( AVAILABLE ?auto_1108902 ) ( IN ?auto_1108900 ?auto_1108907 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1108902 ?auto_1108900 ?auto_1108907 ?auto_1108903 )
      ( MAKE-2CRATE ?auto_1108905 ?auto_1108900 ?auto_1108901 )
      ( MAKE-1CRATE-VERIFY ?auto_1108900 ?auto_1108901 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108909 - SURFACE
      ?auto_1108910 - SURFACE
      ?auto_1108911 - SURFACE
    )
    :vars
    (
      ?auto_1108915 - HOIST
      ?auto_1108917 - PLACE
      ?auto_1108913 - PLACE
      ?auto_1108916 - HOIST
      ?auto_1108914 - SURFACE
      ?auto_1108912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108915 ?auto_1108917 ) ( IS-CRATE ?auto_1108911 ) ( not ( = ?auto_1108910 ?auto_1108911 ) ) ( not ( = ?auto_1108909 ?auto_1108910 ) ) ( not ( = ?auto_1108909 ?auto_1108911 ) ) ( not ( = ?auto_1108913 ?auto_1108917 ) ) ( HOIST-AT ?auto_1108916 ?auto_1108913 ) ( not ( = ?auto_1108915 ?auto_1108916 ) ) ( AVAILABLE ?auto_1108916 ) ( SURFACE-AT ?auto_1108911 ?auto_1108913 ) ( ON ?auto_1108911 ?auto_1108914 ) ( CLEAR ?auto_1108911 ) ( not ( = ?auto_1108910 ?auto_1108914 ) ) ( not ( = ?auto_1108911 ?auto_1108914 ) ) ( not ( = ?auto_1108909 ?auto_1108914 ) ) ( TRUCK-AT ?auto_1108912 ?auto_1108917 ) ( SURFACE-AT ?auto_1108909 ?auto_1108917 ) ( CLEAR ?auto_1108909 ) ( IS-CRATE ?auto_1108910 ) ( AVAILABLE ?auto_1108915 ) ( IN ?auto_1108910 ?auto_1108912 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108910 ?auto_1108911 )
      ( MAKE-2CRATE-VERIFY ?auto_1108909 ?auto_1108910 ?auto_1108911 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108954 - SURFACE
      ?auto_1108955 - SURFACE
    )
    :vars
    (
      ?auto_1108959 - HOIST
      ?auto_1108957 - PLACE
      ?auto_1108960 - SURFACE
      ?auto_1108962 - PLACE
      ?auto_1108956 - HOIST
      ?auto_1108961 - SURFACE
      ?auto_1108958 - TRUCK
      ?auto_1108963 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108959 ?auto_1108957 ) ( SURFACE-AT ?auto_1108954 ?auto_1108957 ) ( CLEAR ?auto_1108954 ) ( IS-CRATE ?auto_1108955 ) ( not ( = ?auto_1108954 ?auto_1108955 ) ) ( AVAILABLE ?auto_1108959 ) ( ON ?auto_1108954 ?auto_1108960 ) ( not ( = ?auto_1108960 ?auto_1108954 ) ) ( not ( = ?auto_1108960 ?auto_1108955 ) ) ( not ( = ?auto_1108962 ?auto_1108957 ) ) ( HOIST-AT ?auto_1108956 ?auto_1108962 ) ( not ( = ?auto_1108959 ?auto_1108956 ) ) ( AVAILABLE ?auto_1108956 ) ( SURFACE-AT ?auto_1108955 ?auto_1108962 ) ( ON ?auto_1108955 ?auto_1108961 ) ( CLEAR ?auto_1108955 ) ( not ( = ?auto_1108954 ?auto_1108961 ) ) ( not ( = ?auto_1108955 ?auto_1108961 ) ) ( not ( = ?auto_1108960 ?auto_1108961 ) ) ( TRUCK-AT ?auto_1108958 ?auto_1108963 ) ( not ( = ?auto_1108963 ?auto_1108957 ) ) ( not ( = ?auto_1108962 ?auto_1108963 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1108958 ?auto_1108963 ?auto_1108957 )
      ( MAKE-1CRATE ?auto_1108954 ?auto_1108955 )
      ( MAKE-1CRATE-VERIFY ?auto_1108954 ?auto_1108955 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1108993 - SURFACE
      ?auto_1108994 - SURFACE
      ?auto_1108995 - SURFACE
      ?auto_1108996 - SURFACE
    )
    :vars
    (
      ?auto_1108997 - HOIST
      ?auto_1108998 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108997 ?auto_1108998 ) ( SURFACE-AT ?auto_1108995 ?auto_1108998 ) ( CLEAR ?auto_1108995 ) ( LIFTING ?auto_1108997 ?auto_1108996 ) ( IS-CRATE ?auto_1108996 ) ( not ( = ?auto_1108995 ?auto_1108996 ) ) ( ON ?auto_1108994 ?auto_1108993 ) ( ON ?auto_1108995 ?auto_1108994 ) ( not ( = ?auto_1108993 ?auto_1108994 ) ) ( not ( = ?auto_1108993 ?auto_1108995 ) ) ( not ( = ?auto_1108993 ?auto_1108996 ) ) ( not ( = ?auto_1108994 ?auto_1108995 ) ) ( not ( = ?auto_1108994 ?auto_1108996 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108995 ?auto_1108996 )
      ( MAKE-3CRATE-VERIFY ?auto_1108993 ?auto_1108994 ?auto_1108995 ?auto_1108996 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1109010 - SURFACE
      ?auto_1109011 - SURFACE
      ?auto_1109012 - SURFACE
      ?auto_1109013 - SURFACE
    )
    :vars
    (
      ?auto_1109016 - HOIST
      ?auto_1109015 - PLACE
      ?auto_1109014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109016 ?auto_1109015 ) ( SURFACE-AT ?auto_1109012 ?auto_1109015 ) ( CLEAR ?auto_1109012 ) ( IS-CRATE ?auto_1109013 ) ( not ( = ?auto_1109012 ?auto_1109013 ) ) ( TRUCK-AT ?auto_1109014 ?auto_1109015 ) ( AVAILABLE ?auto_1109016 ) ( IN ?auto_1109013 ?auto_1109014 ) ( ON ?auto_1109012 ?auto_1109011 ) ( not ( = ?auto_1109011 ?auto_1109012 ) ) ( not ( = ?auto_1109011 ?auto_1109013 ) ) ( ON ?auto_1109011 ?auto_1109010 ) ( not ( = ?auto_1109010 ?auto_1109011 ) ) ( not ( = ?auto_1109010 ?auto_1109012 ) ) ( not ( = ?auto_1109010 ?auto_1109013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109011 ?auto_1109012 ?auto_1109013 )
      ( MAKE-3CRATE-VERIFY ?auto_1109010 ?auto_1109011 ?auto_1109012 ?auto_1109013 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1109031 - SURFACE
      ?auto_1109032 - SURFACE
      ?auto_1109033 - SURFACE
      ?auto_1109034 - SURFACE
    )
    :vars
    (
      ?auto_1109037 - HOIST
      ?auto_1109036 - PLACE
      ?auto_1109035 - TRUCK
      ?auto_1109038 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109037 ?auto_1109036 ) ( SURFACE-AT ?auto_1109033 ?auto_1109036 ) ( CLEAR ?auto_1109033 ) ( IS-CRATE ?auto_1109034 ) ( not ( = ?auto_1109033 ?auto_1109034 ) ) ( AVAILABLE ?auto_1109037 ) ( IN ?auto_1109034 ?auto_1109035 ) ( ON ?auto_1109033 ?auto_1109032 ) ( not ( = ?auto_1109032 ?auto_1109033 ) ) ( not ( = ?auto_1109032 ?auto_1109034 ) ) ( TRUCK-AT ?auto_1109035 ?auto_1109038 ) ( not ( = ?auto_1109038 ?auto_1109036 ) ) ( ON ?auto_1109032 ?auto_1109031 ) ( not ( = ?auto_1109031 ?auto_1109032 ) ) ( not ( = ?auto_1109031 ?auto_1109033 ) ) ( not ( = ?auto_1109031 ?auto_1109034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109032 ?auto_1109033 ?auto_1109034 )
      ( MAKE-3CRATE-VERIFY ?auto_1109031 ?auto_1109032 ?auto_1109033 ?auto_1109034 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1109055 - SURFACE
      ?auto_1109056 - SURFACE
      ?auto_1109057 - SURFACE
      ?auto_1109058 - SURFACE
    )
    :vars
    (
      ?auto_1109059 - HOIST
      ?auto_1109060 - PLACE
      ?auto_1109063 - TRUCK
      ?auto_1109062 - PLACE
      ?auto_1109061 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109059 ?auto_1109060 ) ( SURFACE-AT ?auto_1109057 ?auto_1109060 ) ( CLEAR ?auto_1109057 ) ( IS-CRATE ?auto_1109058 ) ( not ( = ?auto_1109057 ?auto_1109058 ) ) ( AVAILABLE ?auto_1109059 ) ( ON ?auto_1109057 ?auto_1109056 ) ( not ( = ?auto_1109056 ?auto_1109057 ) ) ( not ( = ?auto_1109056 ?auto_1109058 ) ) ( TRUCK-AT ?auto_1109063 ?auto_1109062 ) ( not ( = ?auto_1109062 ?auto_1109060 ) ) ( HOIST-AT ?auto_1109061 ?auto_1109062 ) ( LIFTING ?auto_1109061 ?auto_1109058 ) ( not ( = ?auto_1109059 ?auto_1109061 ) ) ( ON ?auto_1109056 ?auto_1109055 ) ( not ( = ?auto_1109055 ?auto_1109056 ) ) ( not ( = ?auto_1109055 ?auto_1109057 ) ) ( not ( = ?auto_1109055 ?auto_1109058 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109056 ?auto_1109057 ?auto_1109058 )
      ( MAKE-3CRATE-VERIFY ?auto_1109055 ?auto_1109056 ?auto_1109057 ?auto_1109058 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1109082 - SURFACE
      ?auto_1109083 - SURFACE
      ?auto_1109084 - SURFACE
      ?auto_1109085 - SURFACE
    )
    :vars
    (
      ?auto_1109090 - HOIST
      ?auto_1109089 - PLACE
      ?auto_1109088 - TRUCK
      ?auto_1109086 - PLACE
      ?auto_1109087 - HOIST
      ?auto_1109091 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109090 ?auto_1109089 ) ( SURFACE-AT ?auto_1109084 ?auto_1109089 ) ( CLEAR ?auto_1109084 ) ( IS-CRATE ?auto_1109085 ) ( not ( = ?auto_1109084 ?auto_1109085 ) ) ( AVAILABLE ?auto_1109090 ) ( ON ?auto_1109084 ?auto_1109083 ) ( not ( = ?auto_1109083 ?auto_1109084 ) ) ( not ( = ?auto_1109083 ?auto_1109085 ) ) ( TRUCK-AT ?auto_1109088 ?auto_1109086 ) ( not ( = ?auto_1109086 ?auto_1109089 ) ) ( HOIST-AT ?auto_1109087 ?auto_1109086 ) ( not ( = ?auto_1109090 ?auto_1109087 ) ) ( AVAILABLE ?auto_1109087 ) ( SURFACE-AT ?auto_1109085 ?auto_1109086 ) ( ON ?auto_1109085 ?auto_1109091 ) ( CLEAR ?auto_1109085 ) ( not ( = ?auto_1109084 ?auto_1109091 ) ) ( not ( = ?auto_1109085 ?auto_1109091 ) ) ( not ( = ?auto_1109083 ?auto_1109091 ) ) ( ON ?auto_1109083 ?auto_1109082 ) ( not ( = ?auto_1109082 ?auto_1109083 ) ) ( not ( = ?auto_1109082 ?auto_1109084 ) ) ( not ( = ?auto_1109082 ?auto_1109085 ) ) ( not ( = ?auto_1109082 ?auto_1109091 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109083 ?auto_1109084 ?auto_1109085 )
      ( MAKE-3CRATE-VERIFY ?auto_1109082 ?auto_1109083 ?auto_1109084 ?auto_1109085 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1109110 - SURFACE
      ?auto_1109111 - SURFACE
      ?auto_1109112 - SURFACE
      ?auto_1109113 - SURFACE
    )
    :vars
    (
      ?auto_1109115 - HOIST
      ?auto_1109114 - PLACE
      ?auto_1109118 - PLACE
      ?auto_1109117 - HOIST
      ?auto_1109116 - SURFACE
      ?auto_1109119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109115 ?auto_1109114 ) ( SURFACE-AT ?auto_1109112 ?auto_1109114 ) ( CLEAR ?auto_1109112 ) ( IS-CRATE ?auto_1109113 ) ( not ( = ?auto_1109112 ?auto_1109113 ) ) ( AVAILABLE ?auto_1109115 ) ( ON ?auto_1109112 ?auto_1109111 ) ( not ( = ?auto_1109111 ?auto_1109112 ) ) ( not ( = ?auto_1109111 ?auto_1109113 ) ) ( not ( = ?auto_1109118 ?auto_1109114 ) ) ( HOIST-AT ?auto_1109117 ?auto_1109118 ) ( not ( = ?auto_1109115 ?auto_1109117 ) ) ( AVAILABLE ?auto_1109117 ) ( SURFACE-AT ?auto_1109113 ?auto_1109118 ) ( ON ?auto_1109113 ?auto_1109116 ) ( CLEAR ?auto_1109113 ) ( not ( = ?auto_1109112 ?auto_1109116 ) ) ( not ( = ?auto_1109113 ?auto_1109116 ) ) ( not ( = ?auto_1109111 ?auto_1109116 ) ) ( TRUCK-AT ?auto_1109119 ?auto_1109114 ) ( ON ?auto_1109111 ?auto_1109110 ) ( not ( = ?auto_1109110 ?auto_1109111 ) ) ( not ( = ?auto_1109110 ?auto_1109112 ) ) ( not ( = ?auto_1109110 ?auto_1109113 ) ) ( not ( = ?auto_1109110 ?auto_1109116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109111 ?auto_1109112 ?auto_1109113 )
      ( MAKE-3CRATE-VERIFY ?auto_1109110 ?auto_1109111 ?auto_1109112 ?auto_1109113 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1109138 - SURFACE
      ?auto_1109139 - SURFACE
      ?auto_1109140 - SURFACE
      ?auto_1109141 - SURFACE
    )
    :vars
    (
      ?auto_1109144 - HOIST
      ?auto_1109147 - PLACE
      ?auto_1109142 - PLACE
      ?auto_1109143 - HOIST
      ?auto_1109146 - SURFACE
      ?auto_1109145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109144 ?auto_1109147 ) ( IS-CRATE ?auto_1109141 ) ( not ( = ?auto_1109140 ?auto_1109141 ) ) ( not ( = ?auto_1109139 ?auto_1109140 ) ) ( not ( = ?auto_1109139 ?auto_1109141 ) ) ( not ( = ?auto_1109142 ?auto_1109147 ) ) ( HOIST-AT ?auto_1109143 ?auto_1109142 ) ( not ( = ?auto_1109144 ?auto_1109143 ) ) ( AVAILABLE ?auto_1109143 ) ( SURFACE-AT ?auto_1109141 ?auto_1109142 ) ( ON ?auto_1109141 ?auto_1109146 ) ( CLEAR ?auto_1109141 ) ( not ( = ?auto_1109140 ?auto_1109146 ) ) ( not ( = ?auto_1109141 ?auto_1109146 ) ) ( not ( = ?auto_1109139 ?auto_1109146 ) ) ( TRUCK-AT ?auto_1109145 ?auto_1109147 ) ( SURFACE-AT ?auto_1109139 ?auto_1109147 ) ( CLEAR ?auto_1109139 ) ( LIFTING ?auto_1109144 ?auto_1109140 ) ( IS-CRATE ?auto_1109140 ) ( ON ?auto_1109139 ?auto_1109138 ) ( not ( = ?auto_1109138 ?auto_1109139 ) ) ( not ( = ?auto_1109138 ?auto_1109140 ) ) ( not ( = ?auto_1109138 ?auto_1109141 ) ) ( not ( = ?auto_1109138 ?auto_1109146 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109139 ?auto_1109140 ?auto_1109141 )
      ( MAKE-3CRATE-VERIFY ?auto_1109138 ?auto_1109139 ?auto_1109140 ?auto_1109141 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1109166 - SURFACE
      ?auto_1109167 - SURFACE
      ?auto_1109168 - SURFACE
      ?auto_1109169 - SURFACE
    )
    :vars
    (
      ?auto_1109172 - HOIST
      ?auto_1109173 - PLACE
      ?auto_1109171 - PLACE
      ?auto_1109174 - HOIST
      ?auto_1109175 - SURFACE
      ?auto_1109170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109172 ?auto_1109173 ) ( IS-CRATE ?auto_1109169 ) ( not ( = ?auto_1109168 ?auto_1109169 ) ) ( not ( = ?auto_1109167 ?auto_1109168 ) ) ( not ( = ?auto_1109167 ?auto_1109169 ) ) ( not ( = ?auto_1109171 ?auto_1109173 ) ) ( HOIST-AT ?auto_1109174 ?auto_1109171 ) ( not ( = ?auto_1109172 ?auto_1109174 ) ) ( AVAILABLE ?auto_1109174 ) ( SURFACE-AT ?auto_1109169 ?auto_1109171 ) ( ON ?auto_1109169 ?auto_1109175 ) ( CLEAR ?auto_1109169 ) ( not ( = ?auto_1109168 ?auto_1109175 ) ) ( not ( = ?auto_1109169 ?auto_1109175 ) ) ( not ( = ?auto_1109167 ?auto_1109175 ) ) ( TRUCK-AT ?auto_1109170 ?auto_1109173 ) ( SURFACE-AT ?auto_1109167 ?auto_1109173 ) ( CLEAR ?auto_1109167 ) ( IS-CRATE ?auto_1109168 ) ( AVAILABLE ?auto_1109172 ) ( IN ?auto_1109168 ?auto_1109170 ) ( ON ?auto_1109167 ?auto_1109166 ) ( not ( = ?auto_1109166 ?auto_1109167 ) ) ( not ( = ?auto_1109166 ?auto_1109168 ) ) ( not ( = ?auto_1109166 ?auto_1109169 ) ) ( not ( = ?auto_1109166 ?auto_1109175 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109167 ?auto_1109168 ?auto_1109169 )
      ( MAKE-3CRATE-VERIFY ?auto_1109166 ?auto_1109167 ?auto_1109168 ?auto_1109169 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109457 - SURFACE
      ?auto_1109458 - SURFACE
      ?auto_1109459 - SURFACE
      ?auto_1109460 - SURFACE
      ?auto_1109461 - SURFACE
    )
    :vars
    (
      ?auto_1109462 - HOIST
      ?auto_1109463 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109462 ?auto_1109463 ) ( SURFACE-AT ?auto_1109460 ?auto_1109463 ) ( CLEAR ?auto_1109460 ) ( LIFTING ?auto_1109462 ?auto_1109461 ) ( IS-CRATE ?auto_1109461 ) ( not ( = ?auto_1109460 ?auto_1109461 ) ) ( ON ?auto_1109458 ?auto_1109457 ) ( ON ?auto_1109459 ?auto_1109458 ) ( ON ?auto_1109460 ?auto_1109459 ) ( not ( = ?auto_1109457 ?auto_1109458 ) ) ( not ( = ?auto_1109457 ?auto_1109459 ) ) ( not ( = ?auto_1109457 ?auto_1109460 ) ) ( not ( = ?auto_1109457 ?auto_1109461 ) ) ( not ( = ?auto_1109458 ?auto_1109459 ) ) ( not ( = ?auto_1109458 ?auto_1109460 ) ) ( not ( = ?auto_1109458 ?auto_1109461 ) ) ( not ( = ?auto_1109459 ?auto_1109460 ) ) ( not ( = ?auto_1109459 ?auto_1109461 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1109460 ?auto_1109461 )
      ( MAKE-4CRATE-VERIFY ?auto_1109457 ?auto_1109458 ?auto_1109459 ?auto_1109460 ?auto_1109461 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109482 - SURFACE
      ?auto_1109483 - SURFACE
      ?auto_1109484 - SURFACE
      ?auto_1109485 - SURFACE
      ?auto_1109486 - SURFACE
    )
    :vars
    (
      ?auto_1109487 - HOIST
      ?auto_1109489 - PLACE
      ?auto_1109488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109487 ?auto_1109489 ) ( SURFACE-AT ?auto_1109485 ?auto_1109489 ) ( CLEAR ?auto_1109485 ) ( IS-CRATE ?auto_1109486 ) ( not ( = ?auto_1109485 ?auto_1109486 ) ) ( TRUCK-AT ?auto_1109488 ?auto_1109489 ) ( AVAILABLE ?auto_1109487 ) ( IN ?auto_1109486 ?auto_1109488 ) ( ON ?auto_1109485 ?auto_1109484 ) ( not ( = ?auto_1109484 ?auto_1109485 ) ) ( not ( = ?auto_1109484 ?auto_1109486 ) ) ( ON ?auto_1109483 ?auto_1109482 ) ( ON ?auto_1109484 ?auto_1109483 ) ( not ( = ?auto_1109482 ?auto_1109483 ) ) ( not ( = ?auto_1109482 ?auto_1109484 ) ) ( not ( = ?auto_1109482 ?auto_1109485 ) ) ( not ( = ?auto_1109482 ?auto_1109486 ) ) ( not ( = ?auto_1109483 ?auto_1109484 ) ) ( not ( = ?auto_1109483 ?auto_1109485 ) ) ( not ( = ?auto_1109483 ?auto_1109486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109484 ?auto_1109485 ?auto_1109486 )
      ( MAKE-4CRATE-VERIFY ?auto_1109482 ?auto_1109483 ?auto_1109484 ?auto_1109485 ?auto_1109486 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109512 - SURFACE
      ?auto_1109513 - SURFACE
      ?auto_1109514 - SURFACE
      ?auto_1109515 - SURFACE
      ?auto_1109516 - SURFACE
    )
    :vars
    (
      ?auto_1109520 - HOIST
      ?auto_1109519 - PLACE
      ?auto_1109517 - TRUCK
      ?auto_1109518 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109520 ?auto_1109519 ) ( SURFACE-AT ?auto_1109515 ?auto_1109519 ) ( CLEAR ?auto_1109515 ) ( IS-CRATE ?auto_1109516 ) ( not ( = ?auto_1109515 ?auto_1109516 ) ) ( AVAILABLE ?auto_1109520 ) ( IN ?auto_1109516 ?auto_1109517 ) ( ON ?auto_1109515 ?auto_1109514 ) ( not ( = ?auto_1109514 ?auto_1109515 ) ) ( not ( = ?auto_1109514 ?auto_1109516 ) ) ( TRUCK-AT ?auto_1109517 ?auto_1109518 ) ( not ( = ?auto_1109518 ?auto_1109519 ) ) ( ON ?auto_1109513 ?auto_1109512 ) ( ON ?auto_1109514 ?auto_1109513 ) ( not ( = ?auto_1109512 ?auto_1109513 ) ) ( not ( = ?auto_1109512 ?auto_1109514 ) ) ( not ( = ?auto_1109512 ?auto_1109515 ) ) ( not ( = ?auto_1109512 ?auto_1109516 ) ) ( not ( = ?auto_1109513 ?auto_1109514 ) ) ( not ( = ?auto_1109513 ?auto_1109515 ) ) ( not ( = ?auto_1109513 ?auto_1109516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109514 ?auto_1109515 ?auto_1109516 )
      ( MAKE-4CRATE-VERIFY ?auto_1109512 ?auto_1109513 ?auto_1109514 ?auto_1109515 ?auto_1109516 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109546 - SURFACE
      ?auto_1109547 - SURFACE
      ?auto_1109548 - SURFACE
      ?auto_1109549 - SURFACE
      ?auto_1109550 - SURFACE
    )
    :vars
    (
      ?auto_1109554 - HOIST
      ?auto_1109553 - PLACE
      ?auto_1109552 - TRUCK
      ?auto_1109551 - PLACE
      ?auto_1109555 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109554 ?auto_1109553 ) ( SURFACE-AT ?auto_1109549 ?auto_1109553 ) ( CLEAR ?auto_1109549 ) ( IS-CRATE ?auto_1109550 ) ( not ( = ?auto_1109549 ?auto_1109550 ) ) ( AVAILABLE ?auto_1109554 ) ( ON ?auto_1109549 ?auto_1109548 ) ( not ( = ?auto_1109548 ?auto_1109549 ) ) ( not ( = ?auto_1109548 ?auto_1109550 ) ) ( TRUCK-AT ?auto_1109552 ?auto_1109551 ) ( not ( = ?auto_1109551 ?auto_1109553 ) ) ( HOIST-AT ?auto_1109555 ?auto_1109551 ) ( LIFTING ?auto_1109555 ?auto_1109550 ) ( not ( = ?auto_1109554 ?auto_1109555 ) ) ( ON ?auto_1109547 ?auto_1109546 ) ( ON ?auto_1109548 ?auto_1109547 ) ( not ( = ?auto_1109546 ?auto_1109547 ) ) ( not ( = ?auto_1109546 ?auto_1109548 ) ) ( not ( = ?auto_1109546 ?auto_1109549 ) ) ( not ( = ?auto_1109546 ?auto_1109550 ) ) ( not ( = ?auto_1109547 ?auto_1109548 ) ) ( not ( = ?auto_1109547 ?auto_1109549 ) ) ( not ( = ?auto_1109547 ?auto_1109550 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109548 ?auto_1109549 ?auto_1109550 )
      ( MAKE-4CRATE-VERIFY ?auto_1109546 ?auto_1109547 ?auto_1109548 ?auto_1109549 ?auto_1109550 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109584 - SURFACE
      ?auto_1109585 - SURFACE
      ?auto_1109586 - SURFACE
      ?auto_1109587 - SURFACE
      ?auto_1109588 - SURFACE
    )
    :vars
    (
      ?auto_1109593 - HOIST
      ?auto_1109590 - PLACE
      ?auto_1109594 - TRUCK
      ?auto_1109592 - PLACE
      ?auto_1109591 - HOIST
      ?auto_1109589 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109593 ?auto_1109590 ) ( SURFACE-AT ?auto_1109587 ?auto_1109590 ) ( CLEAR ?auto_1109587 ) ( IS-CRATE ?auto_1109588 ) ( not ( = ?auto_1109587 ?auto_1109588 ) ) ( AVAILABLE ?auto_1109593 ) ( ON ?auto_1109587 ?auto_1109586 ) ( not ( = ?auto_1109586 ?auto_1109587 ) ) ( not ( = ?auto_1109586 ?auto_1109588 ) ) ( TRUCK-AT ?auto_1109594 ?auto_1109592 ) ( not ( = ?auto_1109592 ?auto_1109590 ) ) ( HOIST-AT ?auto_1109591 ?auto_1109592 ) ( not ( = ?auto_1109593 ?auto_1109591 ) ) ( AVAILABLE ?auto_1109591 ) ( SURFACE-AT ?auto_1109588 ?auto_1109592 ) ( ON ?auto_1109588 ?auto_1109589 ) ( CLEAR ?auto_1109588 ) ( not ( = ?auto_1109587 ?auto_1109589 ) ) ( not ( = ?auto_1109588 ?auto_1109589 ) ) ( not ( = ?auto_1109586 ?auto_1109589 ) ) ( ON ?auto_1109585 ?auto_1109584 ) ( ON ?auto_1109586 ?auto_1109585 ) ( not ( = ?auto_1109584 ?auto_1109585 ) ) ( not ( = ?auto_1109584 ?auto_1109586 ) ) ( not ( = ?auto_1109584 ?auto_1109587 ) ) ( not ( = ?auto_1109584 ?auto_1109588 ) ) ( not ( = ?auto_1109584 ?auto_1109589 ) ) ( not ( = ?auto_1109585 ?auto_1109586 ) ) ( not ( = ?auto_1109585 ?auto_1109587 ) ) ( not ( = ?auto_1109585 ?auto_1109588 ) ) ( not ( = ?auto_1109585 ?auto_1109589 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109586 ?auto_1109587 ?auto_1109588 )
      ( MAKE-4CRATE-VERIFY ?auto_1109584 ?auto_1109585 ?auto_1109586 ?auto_1109587 ?auto_1109588 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109623 - SURFACE
      ?auto_1109624 - SURFACE
      ?auto_1109625 - SURFACE
      ?auto_1109626 - SURFACE
      ?auto_1109627 - SURFACE
    )
    :vars
    (
      ?auto_1109633 - HOIST
      ?auto_1109630 - PLACE
      ?auto_1109631 - PLACE
      ?auto_1109632 - HOIST
      ?auto_1109629 - SURFACE
      ?auto_1109628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109633 ?auto_1109630 ) ( SURFACE-AT ?auto_1109626 ?auto_1109630 ) ( CLEAR ?auto_1109626 ) ( IS-CRATE ?auto_1109627 ) ( not ( = ?auto_1109626 ?auto_1109627 ) ) ( AVAILABLE ?auto_1109633 ) ( ON ?auto_1109626 ?auto_1109625 ) ( not ( = ?auto_1109625 ?auto_1109626 ) ) ( not ( = ?auto_1109625 ?auto_1109627 ) ) ( not ( = ?auto_1109631 ?auto_1109630 ) ) ( HOIST-AT ?auto_1109632 ?auto_1109631 ) ( not ( = ?auto_1109633 ?auto_1109632 ) ) ( AVAILABLE ?auto_1109632 ) ( SURFACE-AT ?auto_1109627 ?auto_1109631 ) ( ON ?auto_1109627 ?auto_1109629 ) ( CLEAR ?auto_1109627 ) ( not ( = ?auto_1109626 ?auto_1109629 ) ) ( not ( = ?auto_1109627 ?auto_1109629 ) ) ( not ( = ?auto_1109625 ?auto_1109629 ) ) ( TRUCK-AT ?auto_1109628 ?auto_1109630 ) ( ON ?auto_1109624 ?auto_1109623 ) ( ON ?auto_1109625 ?auto_1109624 ) ( not ( = ?auto_1109623 ?auto_1109624 ) ) ( not ( = ?auto_1109623 ?auto_1109625 ) ) ( not ( = ?auto_1109623 ?auto_1109626 ) ) ( not ( = ?auto_1109623 ?auto_1109627 ) ) ( not ( = ?auto_1109623 ?auto_1109629 ) ) ( not ( = ?auto_1109624 ?auto_1109625 ) ) ( not ( = ?auto_1109624 ?auto_1109626 ) ) ( not ( = ?auto_1109624 ?auto_1109627 ) ) ( not ( = ?auto_1109624 ?auto_1109629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109625 ?auto_1109626 ?auto_1109627 )
      ( MAKE-4CRATE-VERIFY ?auto_1109623 ?auto_1109624 ?auto_1109625 ?auto_1109626 ?auto_1109627 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109662 - SURFACE
      ?auto_1109663 - SURFACE
      ?auto_1109664 - SURFACE
      ?auto_1109665 - SURFACE
      ?auto_1109666 - SURFACE
    )
    :vars
    (
      ?auto_1109672 - HOIST
      ?auto_1109667 - PLACE
      ?auto_1109671 - PLACE
      ?auto_1109670 - HOIST
      ?auto_1109669 - SURFACE
      ?auto_1109668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109672 ?auto_1109667 ) ( IS-CRATE ?auto_1109666 ) ( not ( = ?auto_1109665 ?auto_1109666 ) ) ( not ( = ?auto_1109664 ?auto_1109665 ) ) ( not ( = ?auto_1109664 ?auto_1109666 ) ) ( not ( = ?auto_1109671 ?auto_1109667 ) ) ( HOIST-AT ?auto_1109670 ?auto_1109671 ) ( not ( = ?auto_1109672 ?auto_1109670 ) ) ( AVAILABLE ?auto_1109670 ) ( SURFACE-AT ?auto_1109666 ?auto_1109671 ) ( ON ?auto_1109666 ?auto_1109669 ) ( CLEAR ?auto_1109666 ) ( not ( = ?auto_1109665 ?auto_1109669 ) ) ( not ( = ?auto_1109666 ?auto_1109669 ) ) ( not ( = ?auto_1109664 ?auto_1109669 ) ) ( TRUCK-AT ?auto_1109668 ?auto_1109667 ) ( SURFACE-AT ?auto_1109664 ?auto_1109667 ) ( CLEAR ?auto_1109664 ) ( LIFTING ?auto_1109672 ?auto_1109665 ) ( IS-CRATE ?auto_1109665 ) ( ON ?auto_1109663 ?auto_1109662 ) ( ON ?auto_1109664 ?auto_1109663 ) ( not ( = ?auto_1109662 ?auto_1109663 ) ) ( not ( = ?auto_1109662 ?auto_1109664 ) ) ( not ( = ?auto_1109662 ?auto_1109665 ) ) ( not ( = ?auto_1109662 ?auto_1109666 ) ) ( not ( = ?auto_1109662 ?auto_1109669 ) ) ( not ( = ?auto_1109663 ?auto_1109664 ) ) ( not ( = ?auto_1109663 ?auto_1109665 ) ) ( not ( = ?auto_1109663 ?auto_1109666 ) ) ( not ( = ?auto_1109663 ?auto_1109669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109664 ?auto_1109665 ?auto_1109666 )
      ( MAKE-4CRATE-VERIFY ?auto_1109662 ?auto_1109663 ?auto_1109664 ?auto_1109665 ?auto_1109666 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109701 - SURFACE
      ?auto_1109702 - SURFACE
      ?auto_1109703 - SURFACE
      ?auto_1109704 - SURFACE
      ?auto_1109705 - SURFACE
    )
    :vars
    (
      ?auto_1109707 - HOIST
      ?auto_1109710 - PLACE
      ?auto_1109706 - PLACE
      ?auto_1109711 - HOIST
      ?auto_1109708 - SURFACE
      ?auto_1109709 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109707 ?auto_1109710 ) ( IS-CRATE ?auto_1109705 ) ( not ( = ?auto_1109704 ?auto_1109705 ) ) ( not ( = ?auto_1109703 ?auto_1109704 ) ) ( not ( = ?auto_1109703 ?auto_1109705 ) ) ( not ( = ?auto_1109706 ?auto_1109710 ) ) ( HOIST-AT ?auto_1109711 ?auto_1109706 ) ( not ( = ?auto_1109707 ?auto_1109711 ) ) ( AVAILABLE ?auto_1109711 ) ( SURFACE-AT ?auto_1109705 ?auto_1109706 ) ( ON ?auto_1109705 ?auto_1109708 ) ( CLEAR ?auto_1109705 ) ( not ( = ?auto_1109704 ?auto_1109708 ) ) ( not ( = ?auto_1109705 ?auto_1109708 ) ) ( not ( = ?auto_1109703 ?auto_1109708 ) ) ( TRUCK-AT ?auto_1109709 ?auto_1109710 ) ( SURFACE-AT ?auto_1109703 ?auto_1109710 ) ( CLEAR ?auto_1109703 ) ( IS-CRATE ?auto_1109704 ) ( AVAILABLE ?auto_1109707 ) ( IN ?auto_1109704 ?auto_1109709 ) ( ON ?auto_1109702 ?auto_1109701 ) ( ON ?auto_1109703 ?auto_1109702 ) ( not ( = ?auto_1109701 ?auto_1109702 ) ) ( not ( = ?auto_1109701 ?auto_1109703 ) ) ( not ( = ?auto_1109701 ?auto_1109704 ) ) ( not ( = ?auto_1109701 ?auto_1109705 ) ) ( not ( = ?auto_1109701 ?auto_1109708 ) ) ( not ( = ?auto_1109702 ?auto_1109703 ) ) ( not ( = ?auto_1109702 ?auto_1109704 ) ) ( not ( = ?auto_1109702 ?auto_1109705 ) ) ( not ( = ?auto_1109702 ?auto_1109708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109703 ?auto_1109704 ?auto_1109705 )
      ( MAKE-4CRATE-VERIFY ?auto_1109701 ?auto_1109702 ?auto_1109703 ?auto_1109704 ?auto_1109705 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110361 - SURFACE
      ?auto_1110362 - SURFACE
      ?auto_1110363 - SURFACE
      ?auto_1110364 - SURFACE
      ?auto_1110365 - SURFACE
      ?auto_1110366 - SURFACE
    )
    :vars
    (
      ?auto_1110368 - HOIST
      ?auto_1110367 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110368 ?auto_1110367 ) ( SURFACE-AT ?auto_1110365 ?auto_1110367 ) ( CLEAR ?auto_1110365 ) ( LIFTING ?auto_1110368 ?auto_1110366 ) ( IS-CRATE ?auto_1110366 ) ( not ( = ?auto_1110365 ?auto_1110366 ) ) ( ON ?auto_1110362 ?auto_1110361 ) ( ON ?auto_1110363 ?auto_1110362 ) ( ON ?auto_1110364 ?auto_1110363 ) ( ON ?auto_1110365 ?auto_1110364 ) ( not ( = ?auto_1110361 ?auto_1110362 ) ) ( not ( = ?auto_1110361 ?auto_1110363 ) ) ( not ( = ?auto_1110361 ?auto_1110364 ) ) ( not ( = ?auto_1110361 ?auto_1110365 ) ) ( not ( = ?auto_1110361 ?auto_1110366 ) ) ( not ( = ?auto_1110362 ?auto_1110363 ) ) ( not ( = ?auto_1110362 ?auto_1110364 ) ) ( not ( = ?auto_1110362 ?auto_1110365 ) ) ( not ( = ?auto_1110362 ?auto_1110366 ) ) ( not ( = ?auto_1110363 ?auto_1110364 ) ) ( not ( = ?auto_1110363 ?auto_1110365 ) ) ( not ( = ?auto_1110363 ?auto_1110366 ) ) ( not ( = ?auto_1110364 ?auto_1110365 ) ) ( not ( = ?auto_1110364 ?auto_1110366 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1110365 ?auto_1110366 )
      ( MAKE-5CRATE-VERIFY ?auto_1110361 ?auto_1110362 ?auto_1110363 ?auto_1110364 ?auto_1110365 ?auto_1110366 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110395 - SURFACE
      ?auto_1110396 - SURFACE
      ?auto_1110397 - SURFACE
      ?auto_1110398 - SURFACE
      ?auto_1110399 - SURFACE
      ?auto_1110400 - SURFACE
    )
    :vars
    (
      ?auto_1110401 - HOIST
      ?auto_1110402 - PLACE
      ?auto_1110403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110401 ?auto_1110402 ) ( SURFACE-AT ?auto_1110399 ?auto_1110402 ) ( CLEAR ?auto_1110399 ) ( IS-CRATE ?auto_1110400 ) ( not ( = ?auto_1110399 ?auto_1110400 ) ) ( TRUCK-AT ?auto_1110403 ?auto_1110402 ) ( AVAILABLE ?auto_1110401 ) ( IN ?auto_1110400 ?auto_1110403 ) ( ON ?auto_1110399 ?auto_1110398 ) ( not ( = ?auto_1110398 ?auto_1110399 ) ) ( not ( = ?auto_1110398 ?auto_1110400 ) ) ( ON ?auto_1110396 ?auto_1110395 ) ( ON ?auto_1110397 ?auto_1110396 ) ( ON ?auto_1110398 ?auto_1110397 ) ( not ( = ?auto_1110395 ?auto_1110396 ) ) ( not ( = ?auto_1110395 ?auto_1110397 ) ) ( not ( = ?auto_1110395 ?auto_1110398 ) ) ( not ( = ?auto_1110395 ?auto_1110399 ) ) ( not ( = ?auto_1110395 ?auto_1110400 ) ) ( not ( = ?auto_1110396 ?auto_1110397 ) ) ( not ( = ?auto_1110396 ?auto_1110398 ) ) ( not ( = ?auto_1110396 ?auto_1110399 ) ) ( not ( = ?auto_1110396 ?auto_1110400 ) ) ( not ( = ?auto_1110397 ?auto_1110398 ) ) ( not ( = ?auto_1110397 ?auto_1110399 ) ) ( not ( = ?auto_1110397 ?auto_1110400 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1110398 ?auto_1110399 ?auto_1110400 )
      ( MAKE-5CRATE-VERIFY ?auto_1110395 ?auto_1110396 ?auto_1110397 ?auto_1110398 ?auto_1110399 ?auto_1110400 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110435 - SURFACE
      ?auto_1110436 - SURFACE
      ?auto_1110437 - SURFACE
      ?auto_1110438 - SURFACE
      ?auto_1110439 - SURFACE
      ?auto_1110440 - SURFACE
    )
    :vars
    (
      ?auto_1110443 - HOIST
      ?auto_1110442 - PLACE
      ?auto_1110444 - TRUCK
      ?auto_1110441 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110443 ?auto_1110442 ) ( SURFACE-AT ?auto_1110439 ?auto_1110442 ) ( CLEAR ?auto_1110439 ) ( IS-CRATE ?auto_1110440 ) ( not ( = ?auto_1110439 ?auto_1110440 ) ) ( AVAILABLE ?auto_1110443 ) ( IN ?auto_1110440 ?auto_1110444 ) ( ON ?auto_1110439 ?auto_1110438 ) ( not ( = ?auto_1110438 ?auto_1110439 ) ) ( not ( = ?auto_1110438 ?auto_1110440 ) ) ( TRUCK-AT ?auto_1110444 ?auto_1110441 ) ( not ( = ?auto_1110441 ?auto_1110442 ) ) ( ON ?auto_1110436 ?auto_1110435 ) ( ON ?auto_1110437 ?auto_1110436 ) ( ON ?auto_1110438 ?auto_1110437 ) ( not ( = ?auto_1110435 ?auto_1110436 ) ) ( not ( = ?auto_1110435 ?auto_1110437 ) ) ( not ( = ?auto_1110435 ?auto_1110438 ) ) ( not ( = ?auto_1110435 ?auto_1110439 ) ) ( not ( = ?auto_1110435 ?auto_1110440 ) ) ( not ( = ?auto_1110436 ?auto_1110437 ) ) ( not ( = ?auto_1110436 ?auto_1110438 ) ) ( not ( = ?auto_1110436 ?auto_1110439 ) ) ( not ( = ?auto_1110436 ?auto_1110440 ) ) ( not ( = ?auto_1110437 ?auto_1110438 ) ) ( not ( = ?auto_1110437 ?auto_1110439 ) ) ( not ( = ?auto_1110437 ?auto_1110440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1110438 ?auto_1110439 ?auto_1110440 )
      ( MAKE-5CRATE-VERIFY ?auto_1110435 ?auto_1110436 ?auto_1110437 ?auto_1110438 ?auto_1110439 ?auto_1110440 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110480 - SURFACE
      ?auto_1110481 - SURFACE
      ?auto_1110482 - SURFACE
      ?auto_1110483 - SURFACE
      ?auto_1110484 - SURFACE
      ?auto_1110485 - SURFACE
    )
    :vars
    (
      ?auto_1110489 - HOIST
      ?auto_1110486 - PLACE
      ?auto_1110487 - TRUCK
      ?auto_1110488 - PLACE
      ?auto_1110490 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110489 ?auto_1110486 ) ( SURFACE-AT ?auto_1110484 ?auto_1110486 ) ( CLEAR ?auto_1110484 ) ( IS-CRATE ?auto_1110485 ) ( not ( = ?auto_1110484 ?auto_1110485 ) ) ( AVAILABLE ?auto_1110489 ) ( ON ?auto_1110484 ?auto_1110483 ) ( not ( = ?auto_1110483 ?auto_1110484 ) ) ( not ( = ?auto_1110483 ?auto_1110485 ) ) ( TRUCK-AT ?auto_1110487 ?auto_1110488 ) ( not ( = ?auto_1110488 ?auto_1110486 ) ) ( HOIST-AT ?auto_1110490 ?auto_1110488 ) ( LIFTING ?auto_1110490 ?auto_1110485 ) ( not ( = ?auto_1110489 ?auto_1110490 ) ) ( ON ?auto_1110481 ?auto_1110480 ) ( ON ?auto_1110482 ?auto_1110481 ) ( ON ?auto_1110483 ?auto_1110482 ) ( not ( = ?auto_1110480 ?auto_1110481 ) ) ( not ( = ?auto_1110480 ?auto_1110482 ) ) ( not ( = ?auto_1110480 ?auto_1110483 ) ) ( not ( = ?auto_1110480 ?auto_1110484 ) ) ( not ( = ?auto_1110480 ?auto_1110485 ) ) ( not ( = ?auto_1110481 ?auto_1110482 ) ) ( not ( = ?auto_1110481 ?auto_1110483 ) ) ( not ( = ?auto_1110481 ?auto_1110484 ) ) ( not ( = ?auto_1110481 ?auto_1110485 ) ) ( not ( = ?auto_1110482 ?auto_1110483 ) ) ( not ( = ?auto_1110482 ?auto_1110484 ) ) ( not ( = ?auto_1110482 ?auto_1110485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1110483 ?auto_1110484 ?auto_1110485 )
      ( MAKE-5CRATE-VERIFY ?auto_1110480 ?auto_1110481 ?auto_1110482 ?auto_1110483 ?auto_1110484 ?auto_1110485 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110530 - SURFACE
      ?auto_1110531 - SURFACE
      ?auto_1110532 - SURFACE
      ?auto_1110533 - SURFACE
      ?auto_1110534 - SURFACE
      ?auto_1110535 - SURFACE
    )
    :vars
    (
      ?auto_1110538 - HOIST
      ?auto_1110537 - PLACE
      ?auto_1110541 - TRUCK
      ?auto_1110539 - PLACE
      ?auto_1110540 - HOIST
      ?auto_1110536 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110538 ?auto_1110537 ) ( SURFACE-AT ?auto_1110534 ?auto_1110537 ) ( CLEAR ?auto_1110534 ) ( IS-CRATE ?auto_1110535 ) ( not ( = ?auto_1110534 ?auto_1110535 ) ) ( AVAILABLE ?auto_1110538 ) ( ON ?auto_1110534 ?auto_1110533 ) ( not ( = ?auto_1110533 ?auto_1110534 ) ) ( not ( = ?auto_1110533 ?auto_1110535 ) ) ( TRUCK-AT ?auto_1110541 ?auto_1110539 ) ( not ( = ?auto_1110539 ?auto_1110537 ) ) ( HOIST-AT ?auto_1110540 ?auto_1110539 ) ( not ( = ?auto_1110538 ?auto_1110540 ) ) ( AVAILABLE ?auto_1110540 ) ( SURFACE-AT ?auto_1110535 ?auto_1110539 ) ( ON ?auto_1110535 ?auto_1110536 ) ( CLEAR ?auto_1110535 ) ( not ( = ?auto_1110534 ?auto_1110536 ) ) ( not ( = ?auto_1110535 ?auto_1110536 ) ) ( not ( = ?auto_1110533 ?auto_1110536 ) ) ( ON ?auto_1110531 ?auto_1110530 ) ( ON ?auto_1110532 ?auto_1110531 ) ( ON ?auto_1110533 ?auto_1110532 ) ( not ( = ?auto_1110530 ?auto_1110531 ) ) ( not ( = ?auto_1110530 ?auto_1110532 ) ) ( not ( = ?auto_1110530 ?auto_1110533 ) ) ( not ( = ?auto_1110530 ?auto_1110534 ) ) ( not ( = ?auto_1110530 ?auto_1110535 ) ) ( not ( = ?auto_1110530 ?auto_1110536 ) ) ( not ( = ?auto_1110531 ?auto_1110532 ) ) ( not ( = ?auto_1110531 ?auto_1110533 ) ) ( not ( = ?auto_1110531 ?auto_1110534 ) ) ( not ( = ?auto_1110531 ?auto_1110535 ) ) ( not ( = ?auto_1110531 ?auto_1110536 ) ) ( not ( = ?auto_1110532 ?auto_1110533 ) ) ( not ( = ?auto_1110532 ?auto_1110534 ) ) ( not ( = ?auto_1110532 ?auto_1110535 ) ) ( not ( = ?auto_1110532 ?auto_1110536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1110533 ?auto_1110534 ?auto_1110535 )
      ( MAKE-5CRATE-VERIFY ?auto_1110530 ?auto_1110531 ?auto_1110532 ?auto_1110533 ?auto_1110534 ?auto_1110535 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110581 - SURFACE
      ?auto_1110582 - SURFACE
      ?auto_1110583 - SURFACE
      ?auto_1110584 - SURFACE
      ?auto_1110585 - SURFACE
      ?auto_1110586 - SURFACE
    )
    :vars
    (
      ?auto_1110592 - HOIST
      ?auto_1110589 - PLACE
      ?auto_1110588 - PLACE
      ?auto_1110590 - HOIST
      ?auto_1110587 - SURFACE
      ?auto_1110591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110592 ?auto_1110589 ) ( SURFACE-AT ?auto_1110585 ?auto_1110589 ) ( CLEAR ?auto_1110585 ) ( IS-CRATE ?auto_1110586 ) ( not ( = ?auto_1110585 ?auto_1110586 ) ) ( AVAILABLE ?auto_1110592 ) ( ON ?auto_1110585 ?auto_1110584 ) ( not ( = ?auto_1110584 ?auto_1110585 ) ) ( not ( = ?auto_1110584 ?auto_1110586 ) ) ( not ( = ?auto_1110588 ?auto_1110589 ) ) ( HOIST-AT ?auto_1110590 ?auto_1110588 ) ( not ( = ?auto_1110592 ?auto_1110590 ) ) ( AVAILABLE ?auto_1110590 ) ( SURFACE-AT ?auto_1110586 ?auto_1110588 ) ( ON ?auto_1110586 ?auto_1110587 ) ( CLEAR ?auto_1110586 ) ( not ( = ?auto_1110585 ?auto_1110587 ) ) ( not ( = ?auto_1110586 ?auto_1110587 ) ) ( not ( = ?auto_1110584 ?auto_1110587 ) ) ( TRUCK-AT ?auto_1110591 ?auto_1110589 ) ( ON ?auto_1110582 ?auto_1110581 ) ( ON ?auto_1110583 ?auto_1110582 ) ( ON ?auto_1110584 ?auto_1110583 ) ( not ( = ?auto_1110581 ?auto_1110582 ) ) ( not ( = ?auto_1110581 ?auto_1110583 ) ) ( not ( = ?auto_1110581 ?auto_1110584 ) ) ( not ( = ?auto_1110581 ?auto_1110585 ) ) ( not ( = ?auto_1110581 ?auto_1110586 ) ) ( not ( = ?auto_1110581 ?auto_1110587 ) ) ( not ( = ?auto_1110582 ?auto_1110583 ) ) ( not ( = ?auto_1110582 ?auto_1110584 ) ) ( not ( = ?auto_1110582 ?auto_1110585 ) ) ( not ( = ?auto_1110582 ?auto_1110586 ) ) ( not ( = ?auto_1110582 ?auto_1110587 ) ) ( not ( = ?auto_1110583 ?auto_1110584 ) ) ( not ( = ?auto_1110583 ?auto_1110585 ) ) ( not ( = ?auto_1110583 ?auto_1110586 ) ) ( not ( = ?auto_1110583 ?auto_1110587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1110584 ?auto_1110585 ?auto_1110586 )
      ( MAKE-5CRATE-VERIFY ?auto_1110581 ?auto_1110582 ?auto_1110583 ?auto_1110584 ?auto_1110585 ?auto_1110586 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110632 - SURFACE
      ?auto_1110633 - SURFACE
      ?auto_1110634 - SURFACE
      ?auto_1110635 - SURFACE
      ?auto_1110636 - SURFACE
      ?auto_1110637 - SURFACE
    )
    :vars
    (
      ?auto_1110640 - HOIST
      ?auto_1110639 - PLACE
      ?auto_1110642 - PLACE
      ?auto_1110638 - HOIST
      ?auto_1110641 - SURFACE
      ?auto_1110643 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110640 ?auto_1110639 ) ( IS-CRATE ?auto_1110637 ) ( not ( = ?auto_1110636 ?auto_1110637 ) ) ( not ( = ?auto_1110635 ?auto_1110636 ) ) ( not ( = ?auto_1110635 ?auto_1110637 ) ) ( not ( = ?auto_1110642 ?auto_1110639 ) ) ( HOIST-AT ?auto_1110638 ?auto_1110642 ) ( not ( = ?auto_1110640 ?auto_1110638 ) ) ( AVAILABLE ?auto_1110638 ) ( SURFACE-AT ?auto_1110637 ?auto_1110642 ) ( ON ?auto_1110637 ?auto_1110641 ) ( CLEAR ?auto_1110637 ) ( not ( = ?auto_1110636 ?auto_1110641 ) ) ( not ( = ?auto_1110637 ?auto_1110641 ) ) ( not ( = ?auto_1110635 ?auto_1110641 ) ) ( TRUCK-AT ?auto_1110643 ?auto_1110639 ) ( SURFACE-AT ?auto_1110635 ?auto_1110639 ) ( CLEAR ?auto_1110635 ) ( LIFTING ?auto_1110640 ?auto_1110636 ) ( IS-CRATE ?auto_1110636 ) ( ON ?auto_1110633 ?auto_1110632 ) ( ON ?auto_1110634 ?auto_1110633 ) ( ON ?auto_1110635 ?auto_1110634 ) ( not ( = ?auto_1110632 ?auto_1110633 ) ) ( not ( = ?auto_1110632 ?auto_1110634 ) ) ( not ( = ?auto_1110632 ?auto_1110635 ) ) ( not ( = ?auto_1110632 ?auto_1110636 ) ) ( not ( = ?auto_1110632 ?auto_1110637 ) ) ( not ( = ?auto_1110632 ?auto_1110641 ) ) ( not ( = ?auto_1110633 ?auto_1110634 ) ) ( not ( = ?auto_1110633 ?auto_1110635 ) ) ( not ( = ?auto_1110633 ?auto_1110636 ) ) ( not ( = ?auto_1110633 ?auto_1110637 ) ) ( not ( = ?auto_1110633 ?auto_1110641 ) ) ( not ( = ?auto_1110634 ?auto_1110635 ) ) ( not ( = ?auto_1110634 ?auto_1110636 ) ) ( not ( = ?auto_1110634 ?auto_1110637 ) ) ( not ( = ?auto_1110634 ?auto_1110641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1110635 ?auto_1110636 ?auto_1110637 )
      ( MAKE-5CRATE-VERIFY ?auto_1110632 ?auto_1110633 ?auto_1110634 ?auto_1110635 ?auto_1110636 ?auto_1110637 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110683 - SURFACE
      ?auto_1110684 - SURFACE
      ?auto_1110685 - SURFACE
      ?auto_1110686 - SURFACE
      ?auto_1110687 - SURFACE
      ?auto_1110688 - SURFACE
    )
    :vars
    (
      ?auto_1110689 - HOIST
      ?auto_1110692 - PLACE
      ?auto_1110693 - PLACE
      ?auto_1110690 - HOIST
      ?auto_1110694 - SURFACE
      ?auto_1110691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110689 ?auto_1110692 ) ( IS-CRATE ?auto_1110688 ) ( not ( = ?auto_1110687 ?auto_1110688 ) ) ( not ( = ?auto_1110686 ?auto_1110687 ) ) ( not ( = ?auto_1110686 ?auto_1110688 ) ) ( not ( = ?auto_1110693 ?auto_1110692 ) ) ( HOIST-AT ?auto_1110690 ?auto_1110693 ) ( not ( = ?auto_1110689 ?auto_1110690 ) ) ( AVAILABLE ?auto_1110690 ) ( SURFACE-AT ?auto_1110688 ?auto_1110693 ) ( ON ?auto_1110688 ?auto_1110694 ) ( CLEAR ?auto_1110688 ) ( not ( = ?auto_1110687 ?auto_1110694 ) ) ( not ( = ?auto_1110688 ?auto_1110694 ) ) ( not ( = ?auto_1110686 ?auto_1110694 ) ) ( TRUCK-AT ?auto_1110691 ?auto_1110692 ) ( SURFACE-AT ?auto_1110686 ?auto_1110692 ) ( CLEAR ?auto_1110686 ) ( IS-CRATE ?auto_1110687 ) ( AVAILABLE ?auto_1110689 ) ( IN ?auto_1110687 ?auto_1110691 ) ( ON ?auto_1110684 ?auto_1110683 ) ( ON ?auto_1110685 ?auto_1110684 ) ( ON ?auto_1110686 ?auto_1110685 ) ( not ( = ?auto_1110683 ?auto_1110684 ) ) ( not ( = ?auto_1110683 ?auto_1110685 ) ) ( not ( = ?auto_1110683 ?auto_1110686 ) ) ( not ( = ?auto_1110683 ?auto_1110687 ) ) ( not ( = ?auto_1110683 ?auto_1110688 ) ) ( not ( = ?auto_1110683 ?auto_1110694 ) ) ( not ( = ?auto_1110684 ?auto_1110685 ) ) ( not ( = ?auto_1110684 ?auto_1110686 ) ) ( not ( = ?auto_1110684 ?auto_1110687 ) ) ( not ( = ?auto_1110684 ?auto_1110688 ) ) ( not ( = ?auto_1110684 ?auto_1110694 ) ) ( not ( = ?auto_1110685 ?auto_1110686 ) ) ( not ( = ?auto_1110685 ?auto_1110687 ) ) ( not ( = ?auto_1110685 ?auto_1110688 ) ) ( not ( = ?auto_1110685 ?auto_1110694 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1110686 ?auto_1110687 ?auto_1110688 )
      ( MAKE-5CRATE-VERIFY ?auto_1110683 ?auto_1110684 ?auto_1110685 ?auto_1110686 ?auto_1110687 ?auto_1110688 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1111892 - SURFACE
      ?auto_1111893 - SURFACE
      ?auto_1111894 - SURFACE
      ?auto_1111895 - SURFACE
      ?auto_1111896 - SURFACE
      ?auto_1111897 - SURFACE
      ?auto_1111898 - SURFACE
    )
    :vars
    (
      ?auto_1111899 - HOIST
      ?auto_1111900 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1111899 ?auto_1111900 ) ( SURFACE-AT ?auto_1111897 ?auto_1111900 ) ( CLEAR ?auto_1111897 ) ( LIFTING ?auto_1111899 ?auto_1111898 ) ( IS-CRATE ?auto_1111898 ) ( not ( = ?auto_1111897 ?auto_1111898 ) ) ( ON ?auto_1111893 ?auto_1111892 ) ( ON ?auto_1111894 ?auto_1111893 ) ( ON ?auto_1111895 ?auto_1111894 ) ( ON ?auto_1111896 ?auto_1111895 ) ( ON ?auto_1111897 ?auto_1111896 ) ( not ( = ?auto_1111892 ?auto_1111893 ) ) ( not ( = ?auto_1111892 ?auto_1111894 ) ) ( not ( = ?auto_1111892 ?auto_1111895 ) ) ( not ( = ?auto_1111892 ?auto_1111896 ) ) ( not ( = ?auto_1111892 ?auto_1111897 ) ) ( not ( = ?auto_1111892 ?auto_1111898 ) ) ( not ( = ?auto_1111893 ?auto_1111894 ) ) ( not ( = ?auto_1111893 ?auto_1111895 ) ) ( not ( = ?auto_1111893 ?auto_1111896 ) ) ( not ( = ?auto_1111893 ?auto_1111897 ) ) ( not ( = ?auto_1111893 ?auto_1111898 ) ) ( not ( = ?auto_1111894 ?auto_1111895 ) ) ( not ( = ?auto_1111894 ?auto_1111896 ) ) ( not ( = ?auto_1111894 ?auto_1111897 ) ) ( not ( = ?auto_1111894 ?auto_1111898 ) ) ( not ( = ?auto_1111895 ?auto_1111896 ) ) ( not ( = ?auto_1111895 ?auto_1111897 ) ) ( not ( = ?auto_1111895 ?auto_1111898 ) ) ( not ( = ?auto_1111896 ?auto_1111897 ) ) ( not ( = ?auto_1111896 ?auto_1111898 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1111897 ?auto_1111898 )
      ( MAKE-6CRATE-VERIFY ?auto_1111892 ?auto_1111893 ?auto_1111894 ?auto_1111895 ?auto_1111896 ?auto_1111897 ?auto_1111898 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1111936 - SURFACE
      ?auto_1111937 - SURFACE
      ?auto_1111938 - SURFACE
      ?auto_1111939 - SURFACE
      ?auto_1111940 - SURFACE
      ?auto_1111941 - SURFACE
      ?auto_1111942 - SURFACE
    )
    :vars
    (
      ?auto_1111944 - HOIST
      ?auto_1111945 - PLACE
      ?auto_1111943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1111944 ?auto_1111945 ) ( SURFACE-AT ?auto_1111941 ?auto_1111945 ) ( CLEAR ?auto_1111941 ) ( IS-CRATE ?auto_1111942 ) ( not ( = ?auto_1111941 ?auto_1111942 ) ) ( TRUCK-AT ?auto_1111943 ?auto_1111945 ) ( AVAILABLE ?auto_1111944 ) ( IN ?auto_1111942 ?auto_1111943 ) ( ON ?auto_1111941 ?auto_1111940 ) ( not ( = ?auto_1111940 ?auto_1111941 ) ) ( not ( = ?auto_1111940 ?auto_1111942 ) ) ( ON ?auto_1111937 ?auto_1111936 ) ( ON ?auto_1111938 ?auto_1111937 ) ( ON ?auto_1111939 ?auto_1111938 ) ( ON ?auto_1111940 ?auto_1111939 ) ( not ( = ?auto_1111936 ?auto_1111937 ) ) ( not ( = ?auto_1111936 ?auto_1111938 ) ) ( not ( = ?auto_1111936 ?auto_1111939 ) ) ( not ( = ?auto_1111936 ?auto_1111940 ) ) ( not ( = ?auto_1111936 ?auto_1111941 ) ) ( not ( = ?auto_1111936 ?auto_1111942 ) ) ( not ( = ?auto_1111937 ?auto_1111938 ) ) ( not ( = ?auto_1111937 ?auto_1111939 ) ) ( not ( = ?auto_1111937 ?auto_1111940 ) ) ( not ( = ?auto_1111937 ?auto_1111941 ) ) ( not ( = ?auto_1111937 ?auto_1111942 ) ) ( not ( = ?auto_1111938 ?auto_1111939 ) ) ( not ( = ?auto_1111938 ?auto_1111940 ) ) ( not ( = ?auto_1111938 ?auto_1111941 ) ) ( not ( = ?auto_1111938 ?auto_1111942 ) ) ( not ( = ?auto_1111939 ?auto_1111940 ) ) ( not ( = ?auto_1111939 ?auto_1111941 ) ) ( not ( = ?auto_1111939 ?auto_1111942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1111940 ?auto_1111941 ?auto_1111942 )
      ( MAKE-6CRATE-VERIFY ?auto_1111936 ?auto_1111937 ?auto_1111938 ?auto_1111939 ?auto_1111940 ?auto_1111941 ?auto_1111942 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1111987 - SURFACE
      ?auto_1111988 - SURFACE
      ?auto_1111989 - SURFACE
      ?auto_1111990 - SURFACE
      ?auto_1111991 - SURFACE
      ?auto_1111992 - SURFACE
      ?auto_1111993 - SURFACE
    )
    :vars
    (
      ?auto_1111996 - HOIST
      ?auto_1111994 - PLACE
      ?auto_1111995 - TRUCK
      ?auto_1111997 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1111996 ?auto_1111994 ) ( SURFACE-AT ?auto_1111992 ?auto_1111994 ) ( CLEAR ?auto_1111992 ) ( IS-CRATE ?auto_1111993 ) ( not ( = ?auto_1111992 ?auto_1111993 ) ) ( AVAILABLE ?auto_1111996 ) ( IN ?auto_1111993 ?auto_1111995 ) ( ON ?auto_1111992 ?auto_1111991 ) ( not ( = ?auto_1111991 ?auto_1111992 ) ) ( not ( = ?auto_1111991 ?auto_1111993 ) ) ( TRUCK-AT ?auto_1111995 ?auto_1111997 ) ( not ( = ?auto_1111997 ?auto_1111994 ) ) ( ON ?auto_1111988 ?auto_1111987 ) ( ON ?auto_1111989 ?auto_1111988 ) ( ON ?auto_1111990 ?auto_1111989 ) ( ON ?auto_1111991 ?auto_1111990 ) ( not ( = ?auto_1111987 ?auto_1111988 ) ) ( not ( = ?auto_1111987 ?auto_1111989 ) ) ( not ( = ?auto_1111987 ?auto_1111990 ) ) ( not ( = ?auto_1111987 ?auto_1111991 ) ) ( not ( = ?auto_1111987 ?auto_1111992 ) ) ( not ( = ?auto_1111987 ?auto_1111993 ) ) ( not ( = ?auto_1111988 ?auto_1111989 ) ) ( not ( = ?auto_1111988 ?auto_1111990 ) ) ( not ( = ?auto_1111988 ?auto_1111991 ) ) ( not ( = ?auto_1111988 ?auto_1111992 ) ) ( not ( = ?auto_1111988 ?auto_1111993 ) ) ( not ( = ?auto_1111989 ?auto_1111990 ) ) ( not ( = ?auto_1111989 ?auto_1111991 ) ) ( not ( = ?auto_1111989 ?auto_1111992 ) ) ( not ( = ?auto_1111989 ?auto_1111993 ) ) ( not ( = ?auto_1111990 ?auto_1111991 ) ) ( not ( = ?auto_1111990 ?auto_1111992 ) ) ( not ( = ?auto_1111990 ?auto_1111993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1111991 ?auto_1111992 ?auto_1111993 )
      ( MAKE-6CRATE-VERIFY ?auto_1111987 ?auto_1111988 ?auto_1111989 ?auto_1111990 ?auto_1111991 ?auto_1111992 ?auto_1111993 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1112044 - SURFACE
      ?auto_1112045 - SURFACE
      ?auto_1112046 - SURFACE
      ?auto_1112047 - SURFACE
      ?auto_1112048 - SURFACE
      ?auto_1112049 - SURFACE
      ?auto_1112050 - SURFACE
    )
    :vars
    (
      ?auto_1112055 - HOIST
      ?auto_1112051 - PLACE
      ?auto_1112054 - TRUCK
      ?auto_1112053 - PLACE
      ?auto_1112052 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1112055 ?auto_1112051 ) ( SURFACE-AT ?auto_1112049 ?auto_1112051 ) ( CLEAR ?auto_1112049 ) ( IS-CRATE ?auto_1112050 ) ( not ( = ?auto_1112049 ?auto_1112050 ) ) ( AVAILABLE ?auto_1112055 ) ( ON ?auto_1112049 ?auto_1112048 ) ( not ( = ?auto_1112048 ?auto_1112049 ) ) ( not ( = ?auto_1112048 ?auto_1112050 ) ) ( TRUCK-AT ?auto_1112054 ?auto_1112053 ) ( not ( = ?auto_1112053 ?auto_1112051 ) ) ( HOIST-AT ?auto_1112052 ?auto_1112053 ) ( LIFTING ?auto_1112052 ?auto_1112050 ) ( not ( = ?auto_1112055 ?auto_1112052 ) ) ( ON ?auto_1112045 ?auto_1112044 ) ( ON ?auto_1112046 ?auto_1112045 ) ( ON ?auto_1112047 ?auto_1112046 ) ( ON ?auto_1112048 ?auto_1112047 ) ( not ( = ?auto_1112044 ?auto_1112045 ) ) ( not ( = ?auto_1112044 ?auto_1112046 ) ) ( not ( = ?auto_1112044 ?auto_1112047 ) ) ( not ( = ?auto_1112044 ?auto_1112048 ) ) ( not ( = ?auto_1112044 ?auto_1112049 ) ) ( not ( = ?auto_1112044 ?auto_1112050 ) ) ( not ( = ?auto_1112045 ?auto_1112046 ) ) ( not ( = ?auto_1112045 ?auto_1112047 ) ) ( not ( = ?auto_1112045 ?auto_1112048 ) ) ( not ( = ?auto_1112045 ?auto_1112049 ) ) ( not ( = ?auto_1112045 ?auto_1112050 ) ) ( not ( = ?auto_1112046 ?auto_1112047 ) ) ( not ( = ?auto_1112046 ?auto_1112048 ) ) ( not ( = ?auto_1112046 ?auto_1112049 ) ) ( not ( = ?auto_1112046 ?auto_1112050 ) ) ( not ( = ?auto_1112047 ?auto_1112048 ) ) ( not ( = ?auto_1112047 ?auto_1112049 ) ) ( not ( = ?auto_1112047 ?auto_1112050 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1112048 ?auto_1112049 ?auto_1112050 )
      ( MAKE-6CRATE-VERIFY ?auto_1112044 ?auto_1112045 ?auto_1112046 ?auto_1112047 ?auto_1112048 ?auto_1112049 ?auto_1112050 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1112107 - SURFACE
      ?auto_1112108 - SURFACE
      ?auto_1112109 - SURFACE
      ?auto_1112110 - SURFACE
      ?auto_1112111 - SURFACE
      ?auto_1112112 - SURFACE
      ?auto_1112113 - SURFACE
    )
    :vars
    (
      ?auto_1112118 - HOIST
      ?auto_1112115 - PLACE
      ?auto_1112119 - TRUCK
      ?auto_1112117 - PLACE
      ?auto_1112114 - HOIST
      ?auto_1112116 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1112118 ?auto_1112115 ) ( SURFACE-AT ?auto_1112112 ?auto_1112115 ) ( CLEAR ?auto_1112112 ) ( IS-CRATE ?auto_1112113 ) ( not ( = ?auto_1112112 ?auto_1112113 ) ) ( AVAILABLE ?auto_1112118 ) ( ON ?auto_1112112 ?auto_1112111 ) ( not ( = ?auto_1112111 ?auto_1112112 ) ) ( not ( = ?auto_1112111 ?auto_1112113 ) ) ( TRUCK-AT ?auto_1112119 ?auto_1112117 ) ( not ( = ?auto_1112117 ?auto_1112115 ) ) ( HOIST-AT ?auto_1112114 ?auto_1112117 ) ( not ( = ?auto_1112118 ?auto_1112114 ) ) ( AVAILABLE ?auto_1112114 ) ( SURFACE-AT ?auto_1112113 ?auto_1112117 ) ( ON ?auto_1112113 ?auto_1112116 ) ( CLEAR ?auto_1112113 ) ( not ( = ?auto_1112112 ?auto_1112116 ) ) ( not ( = ?auto_1112113 ?auto_1112116 ) ) ( not ( = ?auto_1112111 ?auto_1112116 ) ) ( ON ?auto_1112108 ?auto_1112107 ) ( ON ?auto_1112109 ?auto_1112108 ) ( ON ?auto_1112110 ?auto_1112109 ) ( ON ?auto_1112111 ?auto_1112110 ) ( not ( = ?auto_1112107 ?auto_1112108 ) ) ( not ( = ?auto_1112107 ?auto_1112109 ) ) ( not ( = ?auto_1112107 ?auto_1112110 ) ) ( not ( = ?auto_1112107 ?auto_1112111 ) ) ( not ( = ?auto_1112107 ?auto_1112112 ) ) ( not ( = ?auto_1112107 ?auto_1112113 ) ) ( not ( = ?auto_1112107 ?auto_1112116 ) ) ( not ( = ?auto_1112108 ?auto_1112109 ) ) ( not ( = ?auto_1112108 ?auto_1112110 ) ) ( not ( = ?auto_1112108 ?auto_1112111 ) ) ( not ( = ?auto_1112108 ?auto_1112112 ) ) ( not ( = ?auto_1112108 ?auto_1112113 ) ) ( not ( = ?auto_1112108 ?auto_1112116 ) ) ( not ( = ?auto_1112109 ?auto_1112110 ) ) ( not ( = ?auto_1112109 ?auto_1112111 ) ) ( not ( = ?auto_1112109 ?auto_1112112 ) ) ( not ( = ?auto_1112109 ?auto_1112113 ) ) ( not ( = ?auto_1112109 ?auto_1112116 ) ) ( not ( = ?auto_1112110 ?auto_1112111 ) ) ( not ( = ?auto_1112110 ?auto_1112112 ) ) ( not ( = ?auto_1112110 ?auto_1112113 ) ) ( not ( = ?auto_1112110 ?auto_1112116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1112111 ?auto_1112112 ?auto_1112113 )
      ( MAKE-6CRATE-VERIFY ?auto_1112107 ?auto_1112108 ?auto_1112109 ?auto_1112110 ?auto_1112111 ?auto_1112112 ?auto_1112113 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1112171 - SURFACE
      ?auto_1112172 - SURFACE
      ?auto_1112173 - SURFACE
      ?auto_1112174 - SURFACE
      ?auto_1112175 - SURFACE
      ?auto_1112176 - SURFACE
      ?auto_1112177 - SURFACE
    )
    :vars
    (
      ?auto_1112180 - HOIST
      ?auto_1112183 - PLACE
      ?auto_1112179 - PLACE
      ?auto_1112178 - HOIST
      ?auto_1112181 - SURFACE
      ?auto_1112182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1112180 ?auto_1112183 ) ( SURFACE-AT ?auto_1112176 ?auto_1112183 ) ( CLEAR ?auto_1112176 ) ( IS-CRATE ?auto_1112177 ) ( not ( = ?auto_1112176 ?auto_1112177 ) ) ( AVAILABLE ?auto_1112180 ) ( ON ?auto_1112176 ?auto_1112175 ) ( not ( = ?auto_1112175 ?auto_1112176 ) ) ( not ( = ?auto_1112175 ?auto_1112177 ) ) ( not ( = ?auto_1112179 ?auto_1112183 ) ) ( HOIST-AT ?auto_1112178 ?auto_1112179 ) ( not ( = ?auto_1112180 ?auto_1112178 ) ) ( AVAILABLE ?auto_1112178 ) ( SURFACE-AT ?auto_1112177 ?auto_1112179 ) ( ON ?auto_1112177 ?auto_1112181 ) ( CLEAR ?auto_1112177 ) ( not ( = ?auto_1112176 ?auto_1112181 ) ) ( not ( = ?auto_1112177 ?auto_1112181 ) ) ( not ( = ?auto_1112175 ?auto_1112181 ) ) ( TRUCK-AT ?auto_1112182 ?auto_1112183 ) ( ON ?auto_1112172 ?auto_1112171 ) ( ON ?auto_1112173 ?auto_1112172 ) ( ON ?auto_1112174 ?auto_1112173 ) ( ON ?auto_1112175 ?auto_1112174 ) ( not ( = ?auto_1112171 ?auto_1112172 ) ) ( not ( = ?auto_1112171 ?auto_1112173 ) ) ( not ( = ?auto_1112171 ?auto_1112174 ) ) ( not ( = ?auto_1112171 ?auto_1112175 ) ) ( not ( = ?auto_1112171 ?auto_1112176 ) ) ( not ( = ?auto_1112171 ?auto_1112177 ) ) ( not ( = ?auto_1112171 ?auto_1112181 ) ) ( not ( = ?auto_1112172 ?auto_1112173 ) ) ( not ( = ?auto_1112172 ?auto_1112174 ) ) ( not ( = ?auto_1112172 ?auto_1112175 ) ) ( not ( = ?auto_1112172 ?auto_1112176 ) ) ( not ( = ?auto_1112172 ?auto_1112177 ) ) ( not ( = ?auto_1112172 ?auto_1112181 ) ) ( not ( = ?auto_1112173 ?auto_1112174 ) ) ( not ( = ?auto_1112173 ?auto_1112175 ) ) ( not ( = ?auto_1112173 ?auto_1112176 ) ) ( not ( = ?auto_1112173 ?auto_1112177 ) ) ( not ( = ?auto_1112173 ?auto_1112181 ) ) ( not ( = ?auto_1112174 ?auto_1112175 ) ) ( not ( = ?auto_1112174 ?auto_1112176 ) ) ( not ( = ?auto_1112174 ?auto_1112177 ) ) ( not ( = ?auto_1112174 ?auto_1112181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1112175 ?auto_1112176 ?auto_1112177 )
      ( MAKE-6CRATE-VERIFY ?auto_1112171 ?auto_1112172 ?auto_1112173 ?auto_1112174 ?auto_1112175 ?auto_1112176 ?auto_1112177 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1112235 - SURFACE
      ?auto_1112236 - SURFACE
      ?auto_1112237 - SURFACE
      ?auto_1112238 - SURFACE
      ?auto_1112239 - SURFACE
      ?auto_1112240 - SURFACE
      ?auto_1112241 - SURFACE
    )
    :vars
    (
      ?auto_1112244 - HOIST
      ?auto_1112243 - PLACE
      ?auto_1112245 - PLACE
      ?auto_1112247 - HOIST
      ?auto_1112242 - SURFACE
      ?auto_1112246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1112244 ?auto_1112243 ) ( IS-CRATE ?auto_1112241 ) ( not ( = ?auto_1112240 ?auto_1112241 ) ) ( not ( = ?auto_1112239 ?auto_1112240 ) ) ( not ( = ?auto_1112239 ?auto_1112241 ) ) ( not ( = ?auto_1112245 ?auto_1112243 ) ) ( HOIST-AT ?auto_1112247 ?auto_1112245 ) ( not ( = ?auto_1112244 ?auto_1112247 ) ) ( AVAILABLE ?auto_1112247 ) ( SURFACE-AT ?auto_1112241 ?auto_1112245 ) ( ON ?auto_1112241 ?auto_1112242 ) ( CLEAR ?auto_1112241 ) ( not ( = ?auto_1112240 ?auto_1112242 ) ) ( not ( = ?auto_1112241 ?auto_1112242 ) ) ( not ( = ?auto_1112239 ?auto_1112242 ) ) ( TRUCK-AT ?auto_1112246 ?auto_1112243 ) ( SURFACE-AT ?auto_1112239 ?auto_1112243 ) ( CLEAR ?auto_1112239 ) ( LIFTING ?auto_1112244 ?auto_1112240 ) ( IS-CRATE ?auto_1112240 ) ( ON ?auto_1112236 ?auto_1112235 ) ( ON ?auto_1112237 ?auto_1112236 ) ( ON ?auto_1112238 ?auto_1112237 ) ( ON ?auto_1112239 ?auto_1112238 ) ( not ( = ?auto_1112235 ?auto_1112236 ) ) ( not ( = ?auto_1112235 ?auto_1112237 ) ) ( not ( = ?auto_1112235 ?auto_1112238 ) ) ( not ( = ?auto_1112235 ?auto_1112239 ) ) ( not ( = ?auto_1112235 ?auto_1112240 ) ) ( not ( = ?auto_1112235 ?auto_1112241 ) ) ( not ( = ?auto_1112235 ?auto_1112242 ) ) ( not ( = ?auto_1112236 ?auto_1112237 ) ) ( not ( = ?auto_1112236 ?auto_1112238 ) ) ( not ( = ?auto_1112236 ?auto_1112239 ) ) ( not ( = ?auto_1112236 ?auto_1112240 ) ) ( not ( = ?auto_1112236 ?auto_1112241 ) ) ( not ( = ?auto_1112236 ?auto_1112242 ) ) ( not ( = ?auto_1112237 ?auto_1112238 ) ) ( not ( = ?auto_1112237 ?auto_1112239 ) ) ( not ( = ?auto_1112237 ?auto_1112240 ) ) ( not ( = ?auto_1112237 ?auto_1112241 ) ) ( not ( = ?auto_1112237 ?auto_1112242 ) ) ( not ( = ?auto_1112238 ?auto_1112239 ) ) ( not ( = ?auto_1112238 ?auto_1112240 ) ) ( not ( = ?auto_1112238 ?auto_1112241 ) ) ( not ( = ?auto_1112238 ?auto_1112242 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1112239 ?auto_1112240 ?auto_1112241 )
      ( MAKE-6CRATE-VERIFY ?auto_1112235 ?auto_1112236 ?auto_1112237 ?auto_1112238 ?auto_1112239 ?auto_1112240 ?auto_1112241 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1112299 - SURFACE
      ?auto_1112300 - SURFACE
      ?auto_1112301 - SURFACE
      ?auto_1112302 - SURFACE
      ?auto_1112303 - SURFACE
      ?auto_1112304 - SURFACE
      ?auto_1112305 - SURFACE
    )
    :vars
    (
      ?auto_1112307 - HOIST
      ?auto_1112310 - PLACE
      ?auto_1112308 - PLACE
      ?auto_1112309 - HOIST
      ?auto_1112306 - SURFACE
      ?auto_1112311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1112307 ?auto_1112310 ) ( IS-CRATE ?auto_1112305 ) ( not ( = ?auto_1112304 ?auto_1112305 ) ) ( not ( = ?auto_1112303 ?auto_1112304 ) ) ( not ( = ?auto_1112303 ?auto_1112305 ) ) ( not ( = ?auto_1112308 ?auto_1112310 ) ) ( HOIST-AT ?auto_1112309 ?auto_1112308 ) ( not ( = ?auto_1112307 ?auto_1112309 ) ) ( AVAILABLE ?auto_1112309 ) ( SURFACE-AT ?auto_1112305 ?auto_1112308 ) ( ON ?auto_1112305 ?auto_1112306 ) ( CLEAR ?auto_1112305 ) ( not ( = ?auto_1112304 ?auto_1112306 ) ) ( not ( = ?auto_1112305 ?auto_1112306 ) ) ( not ( = ?auto_1112303 ?auto_1112306 ) ) ( TRUCK-AT ?auto_1112311 ?auto_1112310 ) ( SURFACE-AT ?auto_1112303 ?auto_1112310 ) ( CLEAR ?auto_1112303 ) ( IS-CRATE ?auto_1112304 ) ( AVAILABLE ?auto_1112307 ) ( IN ?auto_1112304 ?auto_1112311 ) ( ON ?auto_1112300 ?auto_1112299 ) ( ON ?auto_1112301 ?auto_1112300 ) ( ON ?auto_1112302 ?auto_1112301 ) ( ON ?auto_1112303 ?auto_1112302 ) ( not ( = ?auto_1112299 ?auto_1112300 ) ) ( not ( = ?auto_1112299 ?auto_1112301 ) ) ( not ( = ?auto_1112299 ?auto_1112302 ) ) ( not ( = ?auto_1112299 ?auto_1112303 ) ) ( not ( = ?auto_1112299 ?auto_1112304 ) ) ( not ( = ?auto_1112299 ?auto_1112305 ) ) ( not ( = ?auto_1112299 ?auto_1112306 ) ) ( not ( = ?auto_1112300 ?auto_1112301 ) ) ( not ( = ?auto_1112300 ?auto_1112302 ) ) ( not ( = ?auto_1112300 ?auto_1112303 ) ) ( not ( = ?auto_1112300 ?auto_1112304 ) ) ( not ( = ?auto_1112300 ?auto_1112305 ) ) ( not ( = ?auto_1112300 ?auto_1112306 ) ) ( not ( = ?auto_1112301 ?auto_1112302 ) ) ( not ( = ?auto_1112301 ?auto_1112303 ) ) ( not ( = ?auto_1112301 ?auto_1112304 ) ) ( not ( = ?auto_1112301 ?auto_1112305 ) ) ( not ( = ?auto_1112301 ?auto_1112306 ) ) ( not ( = ?auto_1112302 ?auto_1112303 ) ) ( not ( = ?auto_1112302 ?auto_1112304 ) ) ( not ( = ?auto_1112302 ?auto_1112305 ) ) ( not ( = ?auto_1112302 ?auto_1112306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1112303 ?auto_1112304 ?auto_1112305 )
      ( MAKE-6CRATE-VERIFY ?auto_1112299 ?auto_1112300 ?auto_1112301 ?auto_1112302 ?auto_1112303 ?auto_1112304 ?auto_1112305 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114255 - SURFACE
      ?auto_1114256 - SURFACE
      ?auto_1114257 - SURFACE
      ?auto_1114258 - SURFACE
      ?auto_1114259 - SURFACE
      ?auto_1114260 - SURFACE
      ?auto_1114261 - SURFACE
      ?auto_1114262 - SURFACE
    )
    :vars
    (
      ?auto_1114263 - HOIST
      ?auto_1114264 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114263 ?auto_1114264 ) ( SURFACE-AT ?auto_1114261 ?auto_1114264 ) ( CLEAR ?auto_1114261 ) ( LIFTING ?auto_1114263 ?auto_1114262 ) ( IS-CRATE ?auto_1114262 ) ( not ( = ?auto_1114261 ?auto_1114262 ) ) ( ON ?auto_1114256 ?auto_1114255 ) ( ON ?auto_1114257 ?auto_1114256 ) ( ON ?auto_1114258 ?auto_1114257 ) ( ON ?auto_1114259 ?auto_1114258 ) ( ON ?auto_1114260 ?auto_1114259 ) ( ON ?auto_1114261 ?auto_1114260 ) ( not ( = ?auto_1114255 ?auto_1114256 ) ) ( not ( = ?auto_1114255 ?auto_1114257 ) ) ( not ( = ?auto_1114255 ?auto_1114258 ) ) ( not ( = ?auto_1114255 ?auto_1114259 ) ) ( not ( = ?auto_1114255 ?auto_1114260 ) ) ( not ( = ?auto_1114255 ?auto_1114261 ) ) ( not ( = ?auto_1114255 ?auto_1114262 ) ) ( not ( = ?auto_1114256 ?auto_1114257 ) ) ( not ( = ?auto_1114256 ?auto_1114258 ) ) ( not ( = ?auto_1114256 ?auto_1114259 ) ) ( not ( = ?auto_1114256 ?auto_1114260 ) ) ( not ( = ?auto_1114256 ?auto_1114261 ) ) ( not ( = ?auto_1114256 ?auto_1114262 ) ) ( not ( = ?auto_1114257 ?auto_1114258 ) ) ( not ( = ?auto_1114257 ?auto_1114259 ) ) ( not ( = ?auto_1114257 ?auto_1114260 ) ) ( not ( = ?auto_1114257 ?auto_1114261 ) ) ( not ( = ?auto_1114257 ?auto_1114262 ) ) ( not ( = ?auto_1114258 ?auto_1114259 ) ) ( not ( = ?auto_1114258 ?auto_1114260 ) ) ( not ( = ?auto_1114258 ?auto_1114261 ) ) ( not ( = ?auto_1114258 ?auto_1114262 ) ) ( not ( = ?auto_1114259 ?auto_1114260 ) ) ( not ( = ?auto_1114259 ?auto_1114261 ) ) ( not ( = ?auto_1114259 ?auto_1114262 ) ) ( not ( = ?auto_1114260 ?auto_1114261 ) ) ( not ( = ?auto_1114260 ?auto_1114262 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1114261 ?auto_1114262 )
      ( MAKE-7CRATE-VERIFY ?auto_1114255 ?auto_1114256 ?auto_1114257 ?auto_1114258 ?auto_1114259 ?auto_1114260 ?auto_1114261 ?auto_1114262 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114310 - SURFACE
      ?auto_1114311 - SURFACE
      ?auto_1114312 - SURFACE
      ?auto_1114313 - SURFACE
      ?auto_1114314 - SURFACE
      ?auto_1114315 - SURFACE
      ?auto_1114316 - SURFACE
      ?auto_1114317 - SURFACE
    )
    :vars
    (
      ?auto_1114320 - HOIST
      ?auto_1114319 - PLACE
      ?auto_1114318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114320 ?auto_1114319 ) ( SURFACE-AT ?auto_1114316 ?auto_1114319 ) ( CLEAR ?auto_1114316 ) ( IS-CRATE ?auto_1114317 ) ( not ( = ?auto_1114316 ?auto_1114317 ) ) ( TRUCK-AT ?auto_1114318 ?auto_1114319 ) ( AVAILABLE ?auto_1114320 ) ( IN ?auto_1114317 ?auto_1114318 ) ( ON ?auto_1114316 ?auto_1114315 ) ( not ( = ?auto_1114315 ?auto_1114316 ) ) ( not ( = ?auto_1114315 ?auto_1114317 ) ) ( ON ?auto_1114311 ?auto_1114310 ) ( ON ?auto_1114312 ?auto_1114311 ) ( ON ?auto_1114313 ?auto_1114312 ) ( ON ?auto_1114314 ?auto_1114313 ) ( ON ?auto_1114315 ?auto_1114314 ) ( not ( = ?auto_1114310 ?auto_1114311 ) ) ( not ( = ?auto_1114310 ?auto_1114312 ) ) ( not ( = ?auto_1114310 ?auto_1114313 ) ) ( not ( = ?auto_1114310 ?auto_1114314 ) ) ( not ( = ?auto_1114310 ?auto_1114315 ) ) ( not ( = ?auto_1114310 ?auto_1114316 ) ) ( not ( = ?auto_1114310 ?auto_1114317 ) ) ( not ( = ?auto_1114311 ?auto_1114312 ) ) ( not ( = ?auto_1114311 ?auto_1114313 ) ) ( not ( = ?auto_1114311 ?auto_1114314 ) ) ( not ( = ?auto_1114311 ?auto_1114315 ) ) ( not ( = ?auto_1114311 ?auto_1114316 ) ) ( not ( = ?auto_1114311 ?auto_1114317 ) ) ( not ( = ?auto_1114312 ?auto_1114313 ) ) ( not ( = ?auto_1114312 ?auto_1114314 ) ) ( not ( = ?auto_1114312 ?auto_1114315 ) ) ( not ( = ?auto_1114312 ?auto_1114316 ) ) ( not ( = ?auto_1114312 ?auto_1114317 ) ) ( not ( = ?auto_1114313 ?auto_1114314 ) ) ( not ( = ?auto_1114313 ?auto_1114315 ) ) ( not ( = ?auto_1114313 ?auto_1114316 ) ) ( not ( = ?auto_1114313 ?auto_1114317 ) ) ( not ( = ?auto_1114314 ?auto_1114315 ) ) ( not ( = ?auto_1114314 ?auto_1114316 ) ) ( not ( = ?auto_1114314 ?auto_1114317 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1114315 ?auto_1114316 ?auto_1114317 )
      ( MAKE-7CRATE-VERIFY ?auto_1114310 ?auto_1114311 ?auto_1114312 ?auto_1114313 ?auto_1114314 ?auto_1114315 ?auto_1114316 ?auto_1114317 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114373 - SURFACE
      ?auto_1114374 - SURFACE
      ?auto_1114375 - SURFACE
      ?auto_1114376 - SURFACE
      ?auto_1114377 - SURFACE
      ?auto_1114378 - SURFACE
      ?auto_1114379 - SURFACE
      ?auto_1114380 - SURFACE
    )
    :vars
    (
      ?auto_1114383 - HOIST
      ?auto_1114381 - PLACE
      ?auto_1114384 - TRUCK
      ?auto_1114382 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114383 ?auto_1114381 ) ( SURFACE-AT ?auto_1114379 ?auto_1114381 ) ( CLEAR ?auto_1114379 ) ( IS-CRATE ?auto_1114380 ) ( not ( = ?auto_1114379 ?auto_1114380 ) ) ( AVAILABLE ?auto_1114383 ) ( IN ?auto_1114380 ?auto_1114384 ) ( ON ?auto_1114379 ?auto_1114378 ) ( not ( = ?auto_1114378 ?auto_1114379 ) ) ( not ( = ?auto_1114378 ?auto_1114380 ) ) ( TRUCK-AT ?auto_1114384 ?auto_1114382 ) ( not ( = ?auto_1114382 ?auto_1114381 ) ) ( ON ?auto_1114374 ?auto_1114373 ) ( ON ?auto_1114375 ?auto_1114374 ) ( ON ?auto_1114376 ?auto_1114375 ) ( ON ?auto_1114377 ?auto_1114376 ) ( ON ?auto_1114378 ?auto_1114377 ) ( not ( = ?auto_1114373 ?auto_1114374 ) ) ( not ( = ?auto_1114373 ?auto_1114375 ) ) ( not ( = ?auto_1114373 ?auto_1114376 ) ) ( not ( = ?auto_1114373 ?auto_1114377 ) ) ( not ( = ?auto_1114373 ?auto_1114378 ) ) ( not ( = ?auto_1114373 ?auto_1114379 ) ) ( not ( = ?auto_1114373 ?auto_1114380 ) ) ( not ( = ?auto_1114374 ?auto_1114375 ) ) ( not ( = ?auto_1114374 ?auto_1114376 ) ) ( not ( = ?auto_1114374 ?auto_1114377 ) ) ( not ( = ?auto_1114374 ?auto_1114378 ) ) ( not ( = ?auto_1114374 ?auto_1114379 ) ) ( not ( = ?auto_1114374 ?auto_1114380 ) ) ( not ( = ?auto_1114375 ?auto_1114376 ) ) ( not ( = ?auto_1114375 ?auto_1114377 ) ) ( not ( = ?auto_1114375 ?auto_1114378 ) ) ( not ( = ?auto_1114375 ?auto_1114379 ) ) ( not ( = ?auto_1114375 ?auto_1114380 ) ) ( not ( = ?auto_1114376 ?auto_1114377 ) ) ( not ( = ?auto_1114376 ?auto_1114378 ) ) ( not ( = ?auto_1114376 ?auto_1114379 ) ) ( not ( = ?auto_1114376 ?auto_1114380 ) ) ( not ( = ?auto_1114377 ?auto_1114378 ) ) ( not ( = ?auto_1114377 ?auto_1114379 ) ) ( not ( = ?auto_1114377 ?auto_1114380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1114378 ?auto_1114379 ?auto_1114380 )
      ( MAKE-7CRATE-VERIFY ?auto_1114373 ?auto_1114374 ?auto_1114375 ?auto_1114376 ?auto_1114377 ?auto_1114378 ?auto_1114379 ?auto_1114380 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114443 - SURFACE
      ?auto_1114444 - SURFACE
      ?auto_1114445 - SURFACE
      ?auto_1114446 - SURFACE
      ?auto_1114447 - SURFACE
      ?auto_1114448 - SURFACE
      ?auto_1114449 - SURFACE
      ?auto_1114450 - SURFACE
    )
    :vars
    (
      ?auto_1114455 - HOIST
      ?auto_1114454 - PLACE
      ?auto_1114451 - TRUCK
      ?auto_1114452 - PLACE
      ?auto_1114453 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114455 ?auto_1114454 ) ( SURFACE-AT ?auto_1114449 ?auto_1114454 ) ( CLEAR ?auto_1114449 ) ( IS-CRATE ?auto_1114450 ) ( not ( = ?auto_1114449 ?auto_1114450 ) ) ( AVAILABLE ?auto_1114455 ) ( ON ?auto_1114449 ?auto_1114448 ) ( not ( = ?auto_1114448 ?auto_1114449 ) ) ( not ( = ?auto_1114448 ?auto_1114450 ) ) ( TRUCK-AT ?auto_1114451 ?auto_1114452 ) ( not ( = ?auto_1114452 ?auto_1114454 ) ) ( HOIST-AT ?auto_1114453 ?auto_1114452 ) ( LIFTING ?auto_1114453 ?auto_1114450 ) ( not ( = ?auto_1114455 ?auto_1114453 ) ) ( ON ?auto_1114444 ?auto_1114443 ) ( ON ?auto_1114445 ?auto_1114444 ) ( ON ?auto_1114446 ?auto_1114445 ) ( ON ?auto_1114447 ?auto_1114446 ) ( ON ?auto_1114448 ?auto_1114447 ) ( not ( = ?auto_1114443 ?auto_1114444 ) ) ( not ( = ?auto_1114443 ?auto_1114445 ) ) ( not ( = ?auto_1114443 ?auto_1114446 ) ) ( not ( = ?auto_1114443 ?auto_1114447 ) ) ( not ( = ?auto_1114443 ?auto_1114448 ) ) ( not ( = ?auto_1114443 ?auto_1114449 ) ) ( not ( = ?auto_1114443 ?auto_1114450 ) ) ( not ( = ?auto_1114444 ?auto_1114445 ) ) ( not ( = ?auto_1114444 ?auto_1114446 ) ) ( not ( = ?auto_1114444 ?auto_1114447 ) ) ( not ( = ?auto_1114444 ?auto_1114448 ) ) ( not ( = ?auto_1114444 ?auto_1114449 ) ) ( not ( = ?auto_1114444 ?auto_1114450 ) ) ( not ( = ?auto_1114445 ?auto_1114446 ) ) ( not ( = ?auto_1114445 ?auto_1114447 ) ) ( not ( = ?auto_1114445 ?auto_1114448 ) ) ( not ( = ?auto_1114445 ?auto_1114449 ) ) ( not ( = ?auto_1114445 ?auto_1114450 ) ) ( not ( = ?auto_1114446 ?auto_1114447 ) ) ( not ( = ?auto_1114446 ?auto_1114448 ) ) ( not ( = ?auto_1114446 ?auto_1114449 ) ) ( not ( = ?auto_1114446 ?auto_1114450 ) ) ( not ( = ?auto_1114447 ?auto_1114448 ) ) ( not ( = ?auto_1114447 ?auto_1114449 ) ) ( not ( = ?auto_1114447 ?auto_1114450 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1114448 ?auto_1114449 ?auto_1114450 )
      ( MAKE-7CRATE-VERIFY ?auto_1114443 ?auto_1114444 ?auto_1114445 ?auto_1114446 ?auto_1114447 ?auto_1114448 ?auto_1114449 ?auto_1114450 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114520 - SURFACE
      ?auto_1114521 - SURFACE
      ?auto_1114522 - SURFACE
      ?auto_1114523 - SURFACE
      ?auto_1114524 - SURFACE
      ?auto_1114525 - SURFACE
      ?auto_1114526 - SURFACE
      ?auto_1114527 - SURFACE
    )
    :vars
    (
      ?auto_1114529 - HOIST
      ?auto_1114533 - PLACE
      ?auto_1114528 - TRUCK
      ?auto_1114530 - PLACE
      ?auto_1114532 - HOIST
      ?auto_1114531 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114529 ?auto_1114533 ) ( SURFACE-AT ?auto_1114526 ?auto_1114533 ) ( CLEAR ?auto_1114526 ) ( IS-CRATE ?auto_1114527 ) ( not ( = ?auto_1114526 ?auto_1114527 ) ) ( AVAILABLE ?auto_1114529 ) ( ON ?auto_1114526 ?auto_1114525 ) ( not ( = ?auto_1114525 ?auto_1114526 ) ) ( not ( = ?auto_1114525 ?auto_1114527 ) ) ( TRUCK-AT ?auto_1114528 ?auto_1114530 ) ( not ( = ?auto_1114530 ?auto_1114533 ) ) ( HOIST-AT ?auto_1114532 ?auto_1114530 ) ( not ( = ?auto_1114529 ?auto_1114532 ) ) ( AVAILABLE ?auto_1114532 ) ( SURFACE-AT ?auto_1114527 ?auto_1114530 ) ( ON ?auto_1114527 ?auto_1114531 ) ( CLEAR ?auto_1114527 ) ( not ( = ?auto_1114526 ?auto_1114531 ) ) ( not ( = ?auto_1114527 ?auto_1114531 ) ) ( not ( = ?auto_1114525 ?auto_1114531 ) ) ( ON ?auto_1114521 ?auto_1114520 ) ( ON ?auto_1114522 ?auto_1114521 ) ( ON ?auto_1114523 ?auto_1114522 ) ( ON ?auto_1114524 ?auto_1114523 ) ( ON ?auto_1114525 ?auto_1114524 ) ( not ( = ?auto_1114520 ?auto_1114521 ) ) ( not ( = ?auto_1114520 ?auto_1114522 ) ) ( not ( = ?auto_1114520 ?auto_1114523 ) ) ( not ( = ?auto_1114520 ?auto_1114524 ) ) ( not ( = ?auto_1114520 ?auto_1114525 ) ) ( not ( = ?auto_1114520 ?auto_1114526 ) ) ( not ( = ?auto_1114520 ?auto_1114527 ) ) ( not ( = ?auto_1114520 ?auto_1114531 ) ) ( not ( = ?auto_1114521 ?auto_1114522 ) ) ( not ( = ?auto_1114521 ?auto_1114523 ) ) ( not ( = ?auto_1114521 ?auto_1114524 ) ) ( not ( = ?auto_1114521 ?auto_1114525 ) ) ( not ( = ?auto_1114521 ?auto_1114526 ) ) ( not ( = ?auto_1114521 ?auto_1114527 ) ) ( not ( = ?auto_1114521 ?auto_1114531 ) ) ( not ( = ?auto_1114522 ?auto_1114523 ) ) ( not ( = ?auto_1114522 ?auto_1114524 ) ) ( not ( = ?auto_1114522 ?auto_1114525 ) ) ( not ( = ?auto_1114522 ?auto_1114526 ) ) ( not ( = ?auto_1114522 ?auto_1114527 ) ) ( not ( = ?auto_1114522 ?auto_1114531 ) ) ( not ( = ?auto_1114523 ?auto_1114524 ) ) ( not ( = ?auto_1114523 ?auto_1114525 ) ) ( not ( = ?auto_1114523 ?auto_1114526 ) ) ( not ( = ?auto_1114523 ?auto_1114527 ) ) ( not ( = ?auto_1114523 ?auto_1114531 ) ) ( not ( = ?auto_1114524 ?auto_1114525 ) ) ( not ( = ?auto_1114524 ?auto_1114526 ) ) ( not ( = ?auto_1114524 ?auto_1114527 ) ) ( not ( = ?auto_1114524 ?auto_1114531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1114525 ?auto_1114526 ?auto_1114527 )
      ( MAKE-7CRATE-VERIFY ?auto_1114520 ?auto_1114521 ?auto_1114522 ?auto_1114523 ?auto_1114524 ?auto_1114525 ?auto_1114526 ?auto_1114527 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114598 - SURFACE
      ?auto_1114599 - SURFACE
      ?auto_1114600 - SURFACE
      ?auto_1114601 - SURFACE
      ?auto_1114602 - SURFACE
      ?auto_1114603 - SURFACE
      ?auto_1114604 - SURFACE
      ?auto_1114605 - SURFACE
    )
    :vars
    (
      ?auto_1114609 - HOIST
      ?auto_1114611 - PLACE
      ?auto_1114608 - PLACE
      ?auto_1114607 - HOIST
      ?auto_1114606 - SURFACE
      ?auto_1114610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114609 ?auto_1114611 ) ( SURFACE-AT ?auto_1114604 ?auto_1114611 ) ( CLEAR ?auto_1114604 ) ( IS-CRATE ?auto_1114605 ) ( not ( = ?auto_1114604 ?auto_1114605 ) ) ( AVAILABLE ?auto_1114609 ) ( ON ?auto_1114604 ?auto_1114603 ) ( not ( = ?auto_1114603 ?auto_1114604 ) ) ( not ( = ?auto_1114603 ?auto_1114605 ) ) ( not ( = ?auto_1114608 ?auto_1114611 ) ) ( HOIST-AT ?auto_1114607 ?auto_1114608 ) ( not ( = ?auto_1114609 ?auto_1114607 ) ) ( AVAILABLE ?auto_1114607 ) ( SURFACE-AT ?auto_1114605 ?auto_1114608 ) ( ON ?auto_1114605 ?auto_1114606 ) ( CLEAR ?auto_1114605 ) ( not ( = ?auto_1114604 ?auto_1114606 ) ) ( not ( = ?auto_1114605 ?auto_1114606 ) ) ( not ( = ?auto_1114603 ?auto_1114606 ) ) ( TRUCK-AT ?auto_1114610 ?auto_1114611 ) ( ON ?auto_1114599 ?auto_1114598 ) ( ON ?auto_1114600 ?auto_1114599 ) ( ON ?auto_1114601 ?auto_1114600 ) ( ON ?auto_1114602 ?auto_1114601 ) ( ON ?auto_1114603 ?auto_1114602 ) ( not ( = ?auto_1114598 ?auto_1114599 ) ) ( not ( = ?auto_1114598 ?auto_1114600 ) ) ( not ( = ?auto_1114598 ?auto_1114601 ) ) ( not ( = ?auto_1114598 ?auto_1114602 ) ) ( not ( = ?auto_1114598 ?auto_1114603 ) ) ( not ( = ?auto_1114598 ?auto_1114604 ) ) ( not ( = ?auto_1114598 ?auto_1114605 ) ) ( not ( = ?auto_1114598 ?auto_1114606 ) ) ( not ( = ?auto_1114599 ?auto_1114600 ) ) ( not ( = ?auto_1114599 ?auto_1114601 ) ) ( not ( = ?auto_1114599 ?auto_1114602 ) ) ( not ( = ?auto_1114599 ?auto_1114603 ) ) ( not ( = ?auto_1114599 ?auto_1114604 ) ) ( not ( = ?auto_1114599 ?auto_1114605 ) ) ( not ( = ?auto_1114599 ?auto_1114606 ) ) ( not ( = ?auto_1114600 ?auto_1114601 ) ) ( not ( = ?auto_1114600 ?auto_1114602 ) ) ( not ( = ?auto_1114600 ?auto_1114603 ) ) ( not ( = ?auto_1114600 ?auto_1114604 ) ) ( not ( = ?auto_1114600 ?auto_1114605 ) ) ( not ( = ?auto_1114600 ?auto_1114606 ) ) ( not ( = ?auto_1114601 ?auto_1114602 ) ) ( not ( = ?auto_1114601 ?auto_1114603 ) ) ( not ( = ?auto_1114601 ?auto_1114604 ) ) ( not ( = ?auto_1114601 ?auto_1114605 ) ) ( not ( = ?auto_1114601 ?auto_1114606 ) ) ( not ( = ?auto_1114602 ?auto_1114603 ) ) ( not ( = ?auto_1114602 ?auto_1114604 ) ) ( not ( = ?auto_1114602 ?auto_1114605 ) ) ( not ( = ?auto_1114602 ?auto_1114606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1114603 ?auto_1114604 ?auto_1114605 )
      ( MAKE-7CRATE-VERIFY ?auto_1114598 ?auto_1114599 ?auto_1114600 ?auto_1114601 ?auto_1114602 ?auto_1114603 ?auto_1114604 ?auto_1114605 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114676 - SURFACE
      ?auto_1114677 - SURFACE
      ?auto_1114678 - SURFACE
      ?auto_1114679 - SURFACE
      ?auto_1114680 - SURFACE
      ?auto_1114681 - SURFACE
      ?auto_1114682 - SURFACE
      ?auto_1114683 - SURFACE
    )
    :vars
    (
      ?auto_1114688 - HOIST
      ?auto_1114686 - PLACE
      ?auto_1114684 - PLACE
      ?auto_1114689 - HOIST
      ?auto_1114685 - SURFACE
      ?auto_1114687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114688 ?auto_1114686 ) ( IS-CRATE ?auto_1114683 ) ( not ( = ?auto_1114682 ?auto_1114683 ) ) ( not ( = ?auto_1114681 ?auto_1114682 ) ) ( not ( = ?auto_1114681 ?auto_1114683 ) ) ( not ( = ?auto_1114684 ?auto_1114686 ) ) ( HOIST-AT ?auto_1114689 ?auto_1114684 ) ( not ( = ?auto_1114688 ?auto_1114689 ) ) ( AVAILABLE ?auto_1114689 ) ( SURFACE-AT ?auto_1114683 ?auto_1114684 ) ( ON ?auto_1114683 ?auto_1114685 ) ( CLEAR ?auto_1114683 ) ( not ( = ?auto_1114682 ?auto_1114685 ) ) ( not ( = ?auto_1114683 ?auto_1114685 ) ) ( not ( = ?auto_1114681 ?auto_1114685 ) ) ( TRUCK-AT ?auto_1114687 ?auto_1114686 ) ( SURFACE-AT ?auto_1114681 ?auto_1114686 ) ( CLEAR ?auto_1114681 ) ( LIFTING ?auto_1114688 ?auto_1114682 ) ( IS-CRATE ?auto_1114682 ) ( ON ?auto_1114677 ?auto_1114676 ) ( ON ?auto_1114678 ?auto_1114677 ) ( ON ?auto_1114679 ?auto_1114678 ) ( ON ?auto_1114680 ?auto_1114679 ) ( ON ?auto_1114681 ?auto_1114680 ) ( not ( = ?auto_1114676 ?auto_1114677 ) ) ( not ( = ?auto_1114676 ?auto_1114678 ) ) ( not ( = ?auto_1114676 ?auto_1114679 ) ) ( not ( = ?auto_1114676 ?auto_1114680 ) ) ( not ( = ?auto_1114676 ?auto_1114681 ) ) ( not ( = ?auto_1114676 ?auto_1114682 ) ) ( not ( = ?auto_1114676 ?auto_1114683 ) ) ( not ( = ?auto_1114676 ?auto_1114685 ) ) ( not ( = ?auto_1114677 ?auto_1114678 ) ) ( not ( = ?auto_1114677 ?auto_1114679 ) ) ( not ( = ?auto_1114677 ?auto_1114680 ) ) ( not ( = ?auto_1114677 ?auto_1114681 ) ) ( not ( = ?auto_1114677 ?auto_1114682 ) ) ( not ( = ?auto_1114677 ?auto_1114683 ) ) ( not ( = ?auto_1114677 ?auto_1114685 ) ) ( not ( = ?auto_1114678 ?auto_1114679 ) ) ( not ( = ?auto_1114678 ?auto_1114680 ) ) ( not ( = ?auto_1114678 ?auto_1114681 ) ) ( not ( = ?auto_1114678 ?auto_1114682 ) ) ( not ( = ?auto_1114678 ?auto_1114683 ) ) ( not ( = ?auto_1114678 ?auto_1114685 ) ) ( not ( = ?auto_1114679 ?auto_1114680 ) ) ( not ( = ?auto_1114679 ?auto_1114681 ) ) ( not ( = ?auto_1114679 ?auto_1114682 ) ) ( not ( = ?auto_1114679 ?auto_1114683 ) ) ( not ( = ?auto_1114679 ?auto_1114685 ) ) ( not ( = ?auto_1114680 ?auto_1114681 ) ) ( not ( = ?auto_1114680 ?auto_1114682 ) ) ( not ( = ?auto_1114680 ?auto_1114683 ) ) ( not ( = ?auto_1114680 ?auto_1114685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1114681 ?auto_1114682 ?auto_1114683 )
      ( MAKE-7CRATE-VERIFY ?auto_1114676 ?auto_1114677 ?auto_1114678 ?auto_1114679 ?auto_1114680 ?auto_1114681 ?auto_1114682 ?auto_1114683 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114754 - SURFACE
      ?auto_1114755 - SURFACE
      ?auto_1114756 - SURFACE
      ?auto_1114757 - SURFACE
      ?auto_1114758 - SURFACE
      ?auto_1114759 - SURFACE
      ?auto_1114760 - SURFACE
      ?auto_1114761 - SURFACE
    )
    :vars
    (
      ?auto_1114767 - HOIST
      ?auto_1114762 - PLACE
      ?auto_1114766 - PLACE
      ?auto_1114765 - HOIST
      ?auto_1114764 - SURFACE
      ?auto_1114763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114767 ?auto_1114762 ) ( IS-CRATE ?auto_1114761 ) ( not ( = ?auto_1114760 ?auto_1114761 ) ) ( not ( = ?auto_1114759 ?auto_1114760 ) ) ( not ( = ?auto_1114759 ?auto_1114761 ) ) ( not ( = ?auto_1114766 ?auto_1114762 ) ) ( HOIST-AT ?auto_1114765 ?auto_1114766 ) ( not ( = ?auto_1114767 ?auto_1114765 ) ) ( AVAILABLE ?auto_1114765 ) ( SURFACE-AT ?auto_1114761 ?auto_1114766 ) ( ON ?auto_1114761 ?auto_1114764 ) ( CLEAR ?auto_1114761 ) ( not ( = ?auto_1114760 ?auto_1114764 ) ) ( not ( = ?auto_1114761 ?auto_1114764 ) ) ( not ( = ?auto_1114759 ?auto_1114764 ) ) ( TRUCK-AT ?auto_1114763 ?auto_1114762 ) ( SURFACE-AT ?auto_1114759 ?auto_1114762 ) ( CLEAR ?auto_1114759 ) ( IS-CRATE ?auto_1114760 ) ( AVAILABLE ?auto_1114767 ) ( IN ?auto_1114760 ?auto_1114763 ) ( ON ?auto_1114755 ?auto_1114754 ) ( ON ?auto_1114756 ?auto_1114755 ) ( ON ?auto_1114757 ?auto_1114756 ) ( ON ?auto_1114758 ?auto_1114757 ) ( ON ?auto_1114759 ?auto_1114758 ) ( not ( = ?auto_1114754 ?auto_1114755 ) ) ( not ( = ?auto_1114754 ?auto_1114756 ) ) ( not ( = ?auto_1114754 ?auto_1114757 ) ) ( not ( = ?auto_1114754 ?auto_1114758 ) ) ( not ( = ?auto_1114754 ?auto_1114759 ) ) ( not ( = ?auto_1114754 ?auto_1114760 ) ) ( not ( = ?auto_1114754 ?auto_1114761 ) ) ( not ( = ?auto_1114754 ?auto_1114764 ) ) ( not ( = ?auto_1114755 ?auto_1114756 ) ) ( not ( = ?auto_1114755 ?auto_1114757 ) ) ( not ( = ?auto_1114755 ?auto_1114758 ) ) ( not ( = ?auto_1114755 ?auto_1114759 ) ) ( not ( = ?auto_1114755 ?auto_1114760 ) ) ( not ( = ?auto_1114755 ?auto_1114761 ) ) ( not ( = ?auto_1114755 ?auto_1114764 ) ) ( not ( = ?auto_1114756 ?auto_1114757 ) ) ( not ( = ?auto_1114756 ?auto_1114758 ) ) ( not ( = ?auto_1114756 ?auto_1114759 ) ) ( not ( = ?auto_1114756 ?auto_1114760 ) ) ( not ( = ?auto_1114756 ?auto_1114761 ) ) ( not ( = ?auto_1114756 ?auto_1114764 ) ) ( not ( = ?auto_1114757 ?auto_1114758 ) ) ( not ( = ?auto_1114757 ?auto_1114759 ) ) ( not ( = ?auto_1114757 ?auto_1114760 ) ) ( not ( = ?auto_1114757 ?auto_1114761 ) ) ( not ( = ?auto_1114757 ?auto_1114764 ) ) ( not ( = ?auto_1114758 ?auto_1114759 ) ) ( not ( = ?auto_1114758 ?auto_1114760 ) ) ( not ( = ?auto_1114758 ?auto_1114761 ) ) ( not ( = ?auto_1114758 ?auto_1114764 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1114759 ?auto_1114760 ?auto_1114761 )
      ( MAKE-7CRATE-VERIFY ?auto_1114754 ?auto_1114755 ?auto_1114756 ?auto_1114757 ?auto_1114758 ?auto_1114759 ?auto_1114760 ?auto_1114761 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1117673 - SURFACE
      ?auto_1117674 - SURFACE
      ?auto_1117675 - SURFACE
      ?auto_1117676 - SURFACE
      ?auto_1117677 - SURFACE
      ?auto_1117678 - SURFACE
      ?auto_1117679 - SURFACE
      ?auto_1117680 - SURFACE
      ?auto_1117681 - SURFACE
    )
    :vars
    (
      ?auto_1117683 - HOIST
      ?auto_1117682 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1117683 ?auto_1117682 ) ( SURFACE-AT ?auto_1117680 ?auto_1117682 ) ( CLEAR ?auto_1117680 ) ( LIFTING ?auto_1117683 ?auto_1117681 ) ( IS-CRATE ?auto_1117681 ) ( not ( = ?auto_1117680 ?auto_1117681 ) ) ( ON ?auto_1117674 ?auto_1117673 ) ( ON ?auto_1117675 ?auto_1117674 ) ( ON ?auto_1117676 ?auto_1117675 ) ( ON ?auto_1117677 ?auto_1117676 ) ( ON ?auto_1117678 ?auto_1117677 ) ( ON ?auto_1117679 ?auto_1117678 ) ( ON ?auto_1117680 ?auto_1117679 ) ( not ( = ?auto_1117673 ?auto_1117674 ) ) ( not ( = ?auto_1117673 ?auto_1117675 ) ) ( not ( = ?auto_1117673 ?auto_1117676 ) ) ( not ( = ?auto_1117673 ?auto_1117677 ) ) ( not ( = ?auto_1117673 ?auto_1117678 ) ) ( not ( = ?auto_1117673 ?auto_1117679 ) ) ( not ( = ?auto_1117673 ?auto_1117680 ) ) ( not ( = ?auto_1117673 ?auto_1117681 ) ) ( not ( = ?auto_1117674 ?auto_1117675 ) ) ( not ( = ?auto_1117674 ?auto_1117676 ) ) ( not ( = ?auto_1117674 ?auto_1117677 ) ) ( not ( = ?auto_1117674 ?auto_1117678 ) ) ( not ( = ?auto_1117674 ?auto_1117679 ) ) ( not ( = ?auto_1117674 ?auto_1117680 ) ) ( not ( = ?auto_1117674 ?auto_1117681 ) ) ( not ( = ?auto_1117675 ?auto_1117676 ) ) ( not ( = ?auto_1117675 ?auto_1117677 ) ) ( not ( = ?auto_1117675 ?auto_1117678 ) ) ( not ( = ?auto_1117675 ?auto_1117679 ) ) ( not ( = ?auto_1117675 ?auto_1117680 ) ) ( not ( = ?auto_1117675 ?auto_1117681 ) ) ( not ( = ?auto_1117676 ?auto_1117677 ) ) ( not ( = ?auto_1117676 ?auto_1117678 ) ) ( not ( = ?auto_1117676 ?auto_1117679 ) ) ( not ( = ?auto_1117676 ?auto_1117680 ) ) ( not ( = ?auto_1117676 ?auto_1117681 ) ) ( not ( = ?auto_1117677 ?auto_1117678 ) ) ( not ( = ?auto_1117677 ?auto_1117679 ) ) ( not ( = ?auto_1117677 ?auto_1117680 ) ) ( not ( = ?auto_1117677 ?auto_1117681 ) ) ( not ( = ?auto_1117678 ?auto_1117679 ) ) ( not ( = ?auto_1117678 ?auto_1117680 ) ) ( not ( = ?auto_1117678 ?auto_1117681 ) ) ( not ( = ?auto_1117679 ?auto_1117680 ) ) ( not ( = ?auto_1117679 ?auto_1117681 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1117680 ?auto_1117681 )
      ( MAKE-8CRATE-VERIFY ?auto_1117673 ?auto_1117674 ?auto_1117675 ?auto_1117676 ?auto_1117677 ?auto_1117678 ?auto_1117679 ?auto_1117680 ?auto_1117681 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1117740 - SURFACE
      ?auto_1117741 - SURFACE
      ?auto_1117742 - SURFACE
      ?auto_1117743 - SURFACE
      ?auto_1117744 - SURFACE
      ?auto_1117745 - SURFACE
      ?auto_1117746 - SURFACE
      ?auto_1117747 - SURFACE
      ?auto_1117748 - SURFACE
    )
    :vars
    (
      ?auto_1117750 - HOIST
      ?auto_1117749 - PLACE
      ?auto_1117751 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1117750 ?auto_1117749 ) ( SURFACE-AT ?auto_1117747 ?auto_1117749 ) ( CLEAR ?auto_1117747 ) ( IS-CRATE ?auto_1117748 ) ( not ( = ?auto_1117747 ?auto_1117748 ) ) ( TRUCK-AT ?auto_1117751 ?auto_1117749 ) ( AVAILABLE ?auto_1117750 ) ( IN ?auto_1117748 ?auto_1117751 ) ( ON ?auto_1117747 ?auto_1117746 ) ( not ( = ?auto_1117746 ?auto_1117747 ) ) ( not ( = ?auto_1117746 ?auto_1117748 ) ) ( ON ?auto_1117741 ?auto_1117740 ) ( ON ?auto_1117742 ?auto_1117741 ) ( ON ?auto_1117743 ?auto_1117742 ) ( ON ?auto_1117744 ?auto_1117743 ) ( ON ?auto_1117745 ?auto_1117744 ) ( ON ?auto_1117746 ?auto_1117745 ) ( not ( = ?auto_1117740 ?auto_1117741 ) ) ( not ( = ?auto_1117740 ?auto_1117742 ) ) ( not ( = ?auto_1117740 ?auto_1117743 ) ) ( not ( = ?auto_1117740 ?auto_1117744 ) ) ( not ( = ?auto_1117740 ?auto_1117745 ) ) ( not ( = ?auto_1117740 ?auto_1117746 ) ) ( not ( = ?auto_1117740 ?auto_1117747 ) ) ( not ( = ?auto_1117740 ?auto_1117748 ) ) ( not ( = ?auto_1117741 ?auto_1117742 ) ) ( not ( = ?auto_1117741 ?auto_1117743 ) ) ( not ( = ?auto_1117741 ?auto_1117744 ) ) ( not ( = ?auto_1117741 ?auto_1117745 ) ) ( not ( = ?auto_1117741 ?auto_1117746 ) ) ( not ( = ?auto_1117741 ?auto_1117747 ) ) ( not ( = ?auto_1117741 ?auto_1117748 ) ) ( not ( = ?auto_1117742 ?auto_1117743 ) ) ( not ( = ?auto_1117742 ?auto_1117744 ) ) ( not ( = ?auto_1117742 ?auto_1117745 ) ) ( not ( = ?auto_1117742 ?auto_1117746 ) ) ( not ( = ?auto_1117742 ?auto_1117747 ) ) ( not ( = ?auto_1117742 ?auto_1117748 ) ) ( not ( = ?auto_1117743 ?auto_1117744 ) ) ( not ( = ?auto_1117743 ?auto_1117745 ) ) ( not ( = ?auto_1117743 ?auto_1117746 ) ) ( not ( = ?auto_1117743 ?auto_1117747 ) ) ( not ( = ?auto_1117743 ?auto_1117748 ) ) ( not ( = ?auto_1117744 ?auto_1117745 ) ) ( not ( = ?auto_1117744 ?auto_1117746 ) ) ( not ( = ?auto_1117744 ?auto_1117747 ) ) ( not ( = ?auto_1117744 ?auto_1117748 ) ) ( not ( = ?auto_1117745 ?auto_1117746 ) ) ( not ( = ?auto_1117745 ?auto_1117747 ) ) ( not ( = ?auto_1117745 ?auto_1117748 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1117746 ?auto_1117747 ?auto_1117748 )
      ( MAKE-8CRATE-VERIFY ?auto_1117740 ?auto_1117741 ?auto_1117742 ?auto_1117743 ?auto_1117744 ?auto_1117745 ?auto_1117746 ?auto_1117747 ?auto_1117748 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1117816 - SURFACE
      ?auto_1117817 - SURFACE
      ?auto_1117818 - SURFACE
      ?auto_1117819 - SURFACE
      ?auto_1117820 - SURFACE
      ?auto_1117821 - SURFACE
      ?auto_1117822 - SURFACE
      ?auto_1117823 - SURFACE
      ?auto_1117824 - SURFACE
    )
    :vars
    (
      ?auto_1117828 - HOIST
      ?auto_1117827 - PLACE
      ?auto_1117826 - TRUCK
      ?auto_1117825 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1117828 ?auto_1117827 ) ( SURFACE-AT ?auto_1117823 ?auto_1117827 ) ( CLEAR ?auto_1117823 ) ( IS-CRATE ?auto_1117824 ) ( not ( = ?auto_1117823 ?auto_1117824 ) ) ( AVAILABLE ?auto_1117828 ) ( IN ?auto_1117824 ?auto_1117826 ) ( ON ?auto_1117823 ?auto_1117822 ) ( not ( = ?auto_1117822 ?auto_1117823 ) ) ( not ( = ?auto_1117822 ?auto_1117824 ) ) ( TRUCK-AT ?auto_1117826 ?auto_1117825 ) ( not ( = ?auto_1117825 ?auto_1117827 ) ) ( ON ?auto_1117817 ?auto_1117816 ) ( ON ?auto_1117818 ?auto_1117817 ) ( ON ?auto_1117819 ?auto_1117818 ) ( ON ?auto_1117820 ?auto_1117819 ) ( ON ?auto_1117821 ?auto_1117820 ) ( ON ?auto_1117822 ?auto_1117821 ) ( not ( = ?auto_1117816 ?auto_1117817 ) ) ( not ( = ?auto_1117816 ?auto_1117818 ) ) ( not ( = ?auto_1117816 ?auto_1117819 ) ) ( not ( = ?auto_1117816 ?auto_1117820 ) ) ( not ( = ?auto_1117816 ?auto_1117821 ) ) ( not ( = ?auto_1117816 ?auto_1117822 ) ) ( not ( = ?auto_1117816 ?auto_1117823 ) ) ( not ( = ?auto_1117816 ?auto_1117824 ) ) ( not ( = ?auto_1117817 ?auto_1117818 ) ) ( not ( = ?auto_1117817 ?auto_1117819 ) ) ( not ( = ?auto_1117817 ?auto_1117820 ) ) ( not ( = ?auto_1117817 ?auto_1117821 ) ) ( not ( = ?auto_1117817 ?auto_1117822 ) ) ( not ( = ?auto_1117817 ?auto_1117823 ) ) ( not ( = ?auto_1117817 ?auto_1117824 ) ) ( not ( = ?auto_1117818 ?auto_1117819 ) ) ( not ( = ?auto_1117818 ?auto_1117820 ) ) ( not ( = ?auto_1117818 ?auto_1117821 ) ) ( not ( = ?auto_1117818 ?auto_1117822 ) ) ( not ( = ?auto_1117818 ?auto_1117823 ) ) ( not ( = ?auto_1117818 ?auto_1117824 ) ) ( not ( = ?auto_1117819 ?auto_1117820 ) ) ( not ( = ?auto_1117819 ?auto_1117821 ) ) ( not ( = ?auto_1117819 ?auto_1117822 ) ) ( not ( = ?auto_1117819 ?auto_1117823 ) ) ( not ( = ?auto_1117819 ?auto_1117824 ) ) ( not ( = ?auto_1117820 ?auto_1117821 ) ) ( not ( = ?auto_1117820 ?auto_1117822 ) ) ( not ( = ?auto_1117820 ?auto_1117823 ) ) ( not ( = ?auto_1117820 ?auto_1117824 ) ) ( not ( = ?auto_1117821 ?auto_1117822 ) ) ( not ( = ?auto_1117821 ?auto_1117823 ) ) ( not ( = ?auto_1117821 ?auto_1117824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1117822 ?auto_1117823 ?auto_1117824 )
      ( MAKE-8CRATE-VERIFY ?auto_1117816 ?auto_1117817 ?auto_1117818 ?auto_1117819 ?auto_1117820 ?auto_1117821 ?auto_1117822 ?auto_1117823 ?auto_1117824 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1117900 - SURFACE
      ?auto_1117901 - SURFACE
      ?auto_1117902 - SURFACE
      ?auto_1117903 - SURFACE
      ?auto_1117904 - SURFACE
      ?auto_1117905 - SURFACE
      ?auto_1117906 - SURFACE
      ?auto_1117907 - SURFACE
      ?auto_1117908 - SURFACE
    )
    :vars
    (
      ?auto_1117910 - HOIST
      ?auto_1117909 - PLACE
      ?auto_1117911 - TRUCK
      ?auto_1117913 - PLACE
      ?auto_1117912 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1117910 ?auto_1117909 ) ( SURFACE-AT ?auto_1117907 ?auto_1117909 ) ( CLEAR ?auto_1117907 ) ( IS-CRATE ?auto_1117908 ) ( not ( = ?auto_1117907 ?auto_1117908 ) ) ( AVAILABLE ?auto_1117910 ) ( ON ?auto_1117907 ?auto_1117906 ) ( not ( = ?auto_1117906 ?auto_1117907 ) ) ( not ( = ?auto_1117906 ?auto_1117908 ) ) ( TRUCK-AT ?auto_1117911 ?auto_1117913 ) ( not ( = ?auto_1117913 ?auto_1117909 ) ) ( HOIST-AT ?auto_1117912 ?auto_1117913 ) ( LIFTING ?auto_1117912 ?auto_1117908 ) ( not ( = ?auto_1117910 ?auto_1117912 ) ) ( ON ?auto_1117901 ?auto_1117900 ) ( ON ?auto_1117902 ?auto_1117901 ) ( ON ?auto_1117903 ?auto_1117902 ) ( ON ?auto_1117904 ?auto_1117903 ) ( ON ?auto_1117905 ?auto_1117904 ) ( ON ?auto_1117906 ?auto_1117905 ) ( not ( = ?auto_1117900 ?auto_1117901 ) ) ( not ( = ?auto_1117900 ?auto_1117902 ) ) ( not ( = ?auto_1117900 ?auto_1117903 ) ) ( not ( = ?auto_1117900 ?auto_1117904 ) ) ( not ( = ?auto_1117900 ?auto_1117905 ) ) ( not ( = ?auto_1117900 ?auto_1117906 ) ) ( not ( = ?auto_1117900 ?auto_1117907 ) ) ( not ( = ?auto_1117900 ?auto_1117908 ) ) ( not ( = ?auto_1117901 ?auto_1117902 ) ) ( not ( = ?auto_1117901 ?auto_1117903 ) ) ( not ( = ?auto_1117901 ?auto_1117904 ) ) ( not ( = ?auto_1117901 ?auto_1117905 ) ) ( not ( = ?auto_1117901 ?auto_1117906 ) ) ( not ( = ?auto_1117901 ?auto_1117907 ) ) ( not ( = ?auto_1117901 ?auto_1117908 ) ) ( not ( = ?auto_1117902 ?auto_1117903 ) ) ( not ( = ?auto_1117902 ?auto_1117904 ) ) ( not ( = ?auto_1117902 ?auto_1117905 ) ) ( not ( = ?auto_1117902 ?auto_1117906 ) ) ( not ( = ?auto_1117902 ?auto_1117907 ) ) ( not ( = ?auto_1117902 ?auto_1117908 ) ) ( not ( = ?auto_1117903 ?auto_1117904 ) ) ( not ( = ?auto_1117903 ?auto_1117905 ) ) ( not ( = ?auto_1117903 ?auto_1117906 ) ) ( not ( = ?auto_1117903 ?auto_1117907 ) ) ( not ( = ?auto_1117903 ?auto_1117908 ) ) ( not ( = ?auto_1117904 ?auto_1117905 ) ) ( not ( = ?auto_1117904 ?auto_1117906 ) ) ( not ( = ?auto_1117904 ?auto_1117907 ) ) ( not ( = ?auto_1117904 ?auto_1117908 ) ) ( not ( = ?auto_1117905 ?auto_1117906 ) ) ( not ( = ?auto_1117905 ?auto_1117907 ) ) ( not ( = ?auto_1117905 ?auto_1117908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1117906 ?auto_1117907 ?auto_1117908 )
      ( MAKE-8CRATE-VERIFY ?auto_1117900 ?auto_1117901 ?auto_1117902 ?auto_1117903 ?auto_1117904 ?auto_1117905 ?auto_1117906 ?auto_1117907 ?auto_1117908 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1117992 - SURFACE
      ?auto_1117993 - SURFACE
      ?auto_1117994 - SURFACE
      ?auto_1117995 - SURFACE
      ?auto_1117996 - SURFACE
      ?auto_1117997 - SURFACE
      ?auto_1117998 - SURFACE
      ?auto_1117999 - SURFACE
      ?auto_1118000 - SURFACE
    )
    :vars
    (
      ?auto_1118005 - HOIST
      ?auto_1118006 - PLACE
      ?auto_1118004 - TRUCK
      ?auto_1118001 - PLACE
      ?auto_1118003 - HOIST
      ?auto_1118002 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118005 ?auto_1118006 ) ( SURFACE-AT ?auto_1117999 ?auto_1118006 ) ( CLEAR ?auto_1117999 ) ( IS-CRATE ?auto_1118000 ) ( not ( = ?auto_1117999 ?auto_1118000 ) ) ( AVAILABLE ?auto_1118005 ) ( ON ?auto_1117999 ?auto_1117998 ) ( not ( = ?auto_1117998 ?auto_1117999 ) ) ( not ( = ?auto_1117998 ?auto_1118000 ) ) ( TRUCK-AT ?auto_1118004 ?auto_1118001 ) ( not ( = ?auto_1118001 ?auto_1118006 ) ) ( HOIST-AT ?auto_1118003 ?auto_1118001 ) ( not ( = ?auto_1118005 ?auto_1118003 ) ) ( AVAILABLE ?auto_1118003 ) ( SURFACE-AT ?auto_1118000 ?auto_1118001 ) ( ON ?auto_1118000 ?auto_1118002 ) ( CLEAR ?auto_1118000 ) ( not ( = ?auto_1117999 ?auto_1118002 ) ) ( not ( = ?auto_1118000 ?auto_1118002 ) ) ( not ( = ?auto_1117998 ?auto_1118002 ) ) ( ON ?auto_1117993 ?auto_1117992 ) ( ON ?auto_1117994 ?auto_1117993 ) ( ON ?auto_1117995 ?auto_1117994 ) ( ON ?auto_1117996 ?auto_1117995 ) ( ON ?auto_1117997 ?auto_1117996 ) ( ON ?auto_1117998 ?auto_1117997 ) ( not ( = ?auto_1117992 ?auto_1117993 ) ) ( not ( = ?auto_1117992 ?auto_1117994 ) ) ( not ( = ?auto_1117992 ?auto_1117995 ) ) ( not ( = ?auto_1117992 ?auto_1117996 ) ) ( not ( = ?auto_1117992 ?auto_1117997 ) ) ( not ( = ?auto_1117992 ?auto_1117998 ) ) ( not ( = ?auto_1117992 ?auto_1117999 ) ) ( not ( = ?auto_1117992 ?auto_1118000 ) ) ( not ( = ?auto_1117992 ?auto_1118002 ) ) ( not ( = ?auto_1117993 ?auto_1117994 ) ) ( not ( = ?auto_1117993 ?auto_1117995 ) ) ( not ( = ?auto_1117993 ?auto_1117996 ) ) ( not ( = ?auto_1117993 ?auto_1117997 ) ) ( not ( = ?auto_1117993 ?auto_1117998 ) ) ( not ( = ?auto_1117993 ?auto_1117999 ) ) ( not ( = ?auto_1117993 ?auto_1118000 ) ) ( not ( = ?auto_1117993 ?auto_1118002 ) ) ( not ( = ?auto_1117994 ?auto_1117995 ) ) ( not ( = ?auto_1117994 ?auto_1117996 ) ) ( not ( = ?auto_1117994 ?auto_1117997 ) ) ( not ( = ?auto_1117994 ?auto_1117998 ) ) ( not ( = ?auto_1117994 ?auto_1117999 ) ) ( not ( = ?auto_1117994 ?auto_1118000 ) ) ( not ( = ?auto_1117994 ?auto_1118002 ) ) ( not ( = ?auto_1117995 ?auto_1117996 ) ) ( not ( = ?auto_1117995 ?auto_1117997 ) ) ( not ( = ?auto_1117995 ?auto_1117998 ) ) ( not ( = ?auto_1117995 ?auto_1117999 ) ) ( not ( = ?auto_1117995 ?auto_1118000 ) ) ( not ( = ?auto_1117995 ?auto_1118002 ) ) ( not ( = ?auto_1117996 ?auto_1117997 ) ) ( not ( = ?auto_1117996 ?auto_1117998 ) ) ( not ( = ?auto_1117996 ?auto_1117999 ) ) ( not ( = ?auto_1117996 ?auto_1118000 ) ) ( not ( = ?auto_1117996 ?auto_1118002 ) ) ( not ( = ?auto_1117997 ?auto_1117998 ) ) ( not ( = ?auto_1117997 ?auto_1117999 ) ) ( not ( = ?auto_1117997 ?auto_1118000 ) ) ( not ( = ?auto_1117997 ?auto_1118002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1117998 ?auto_1117999 ?auto_1118000 )
      ( MAKE-8CRATE-VERIFY ?auto_1117992 ?auto_1117993 ?auto_1117994 ?auto_1117995 ?auto_1117996 ?auto_1117997 ?auto_1117998 ?auto_1117999 ?auto_1118000 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1118085 - SURFACE
      ?auto_1118086 - SURFACE
      ?auto_1118087 - SURFACE
      ?auto_1118088 - SURFACE
      ?auto_1118089 - SURFACE
      ?auto_1118090 - SURFACE
      ?auto_1118091 - SURFACE
      ?auto_1118092 - SURFACE
      ?auto_1118093 - SURFACE
    )
    :vars
    (
      ?auto_1118098 - HOIST
      ?auto_1118094 - PLACE
      ?auto_1118095 - PLACE
      ?auto_1118096 - HOIST
      ?auto_1118099 - SURFACE
      ?auto_1118097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118098 ?auto_1118094 ) ( SURFACE-AT ?auto_1118092 ?auto_1118094 ) ( CLEAR ?auto_1118092 ) ( IS-CRATE ?auto_1118093 ) ( not ( = ?auto_1118092 ?auto_1118093 ) ) ( AVAILABLE ?auto_1118098 ) ( ON ?auto_1118092 ?auto_1118091 ) ( not ( = ?auto_1118091 ?auto_1118092 ) ) ( not ( = ?auto_1118091 ?auto_1118093 ) ) ( not ( = ?auto_1118095 ?auto_1118094 ) ) ( HOIST-AT ?auto_1118096 ?auto_1118095 ) ( not ( = ?auto_1118098 ?auto_1118096 ) ) ( AVAILABLE ?auto_1118096 ) ( SURFACE-AT ?auto_1118093 ?auto_1118095 ) ( ON ?auto_1118093 ?auto_1118099 ) ( CLEAR ?auto_1118093 ) ( not ( = ?auto_1118092 ?auto_1118099 ) ) ( not ( = ?auto_1118093 ?auto_1118099 ) ) ( not ( = ?auto_1118091 ?auto_1118099 ) ) ( TRUCK-AT ?auto_1118097 ?auto_1118094 ) ( ON ?auto_1118086 ?auto_1118085 ) ( ON ?auto_1118087 ?auto_1118086 ) ( ON ?auto_1118088 ?auto_1118087 ) ( ON ?auto_1118089 ?auto_1118088 ) ( ON ?auto_1118090 ?auto_1118089 ) ( ON ?auto_1118091 ?auto_1118090 ) ( not ( = ?auto_1118085 ?auto_1118086 ) ) ( not ( = ?auto_1118085 ?auto_1118087 ) ) ( not ( = ?auto_1118085 ?auto_1118088 ) ) ( not ( = ?auto_1118085 ?auto_1118089 ) ) ( not ( = ?auto_1118085 ?auto_1118090 ) ) ( not ( = ?auto_1118085 ?auto_1118091 ) ) ( not ( = ?auto_1118085 ?auto_1118092 ) ) ( not ( = ?auto_1118085 ?auto_1118093 ) ) ( not ( = ?auto_1118085 ?auto_1118099 ) ) ( not ( = ?auto_1118086 ?auto_1118087 ) ) ( not ( = ?auto_1118086 ?auto_1118088 ) ) ( not ( = ?auto_1118086 ?auto_1118089 ) ) ( not ( = ?auto_1118086 ?auto_1118090 ) ) ( not ( = ?auto_1118086 ?auto_1118091 ) ) ( not ( = ?auto_1118086 ?auto_1118092 ) ) ( not ( = ?auto_1118086 ?auto_1118093 ) ) ( not ( = ?auto_1118086 ?auto_1118099 ) ) ( not ( = ?auto_1118087 ?auto_1118088 ) ) ( not ( = ?auto_1118087 ?auto_1118089 ) ) ( not ( = ?auto_1118087 ?auto_1118090 ) ) ( not ( = ?auto_1118087 ?auto_1118091 ) ) ( not ( = ?auto_1118087 ?auto_1118092 ) ) ( not ( = ?auto_1118087 ?auto_1118093 ) ) ( not ( = ?auto_1118087 ?auto_1118099 ) ) ( not ( = ?auto_1118088 ?auto_1118089 ) ) ( not ( = ?auto_1118088 ?auto_1118090 ) ) ( not ( = ?auto_1118088 ?auto_1118091 ) ) ( not ( = ?auto_1118088 ?auto_1118092 ) ) ( not ( = ?auto_1118088 ?auto_1118093 ) ) ( not ( = ?auto_1118088 ?auto_1118099 ) ) ( not ( = ?auto_1118089 ?auto_1118090 ) ) ( not ( = ?auto_1118089 ?auto_1118091 ) ) ( not ( = ?auto_1118089 ?auto_1118092 ) ) ( not ( = ?auto_1118089 ?auto_1118093 ) ) ( not ( = ?auto_1118089 ?auto_1118099 ) ) ( not ( = ?auto_1118090 ?auto_1118091 ) ) ( not ( = ?auto_1118090 ?auto_1118092 ) ) ( not ( = ?auto_1118090 ?auto_1118093 ) ) ( not ( = ?auto_1118090 ?auto_1118099 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118091 ?auto_1118092 ?auto_1118093 )
      ( MAKE-8CRATE-VERIFY ?auto_1118085 ?auto_1118086 ?auto_1118087 ?auto_1118088 ?auto_1118089 ?auto_1118090 ?auto_1118091 ?auto_1118092 ?auto_1118093 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1118178 - SURFACE
      ?auto_1118179 - SURFACE
      ?auto_1118180 - SURFACE
      ?auto_1118181 - SURFACE
      ?auto_1118182 - SURFACE
      ?auto_1118183 - SURFACE
      ?auto_1118184 - SURFACE
      ?auto_1118185 - SURFACE
      ?auto_1118186 - SURFACE
    )
    :vars
    (
      ?auto_1118189 - HOIST
      ?auto_1118188 - PLACE
      ?auto_1118192 - PLACE
      ?auto_1118187 - HOIST
      ?auto_1118191 - SURFACE
      ?auto_1118190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118189 ?auto_1118188 ) ( IS-CRATE ?auto_1118186 ) ( not ( = ?auto_1118185 ?auto_1118186 ) ) ( not ( = ?auto_1118184 ?auto_1118185 ) ) ( not ( = ?auto_1118184 ?auto_1118186 ) ) ( not ( = ?auto_1118192 ?auto_1118188 ) ) ( HOIST-AT ?auto_1118187 ?auto_1118192 ) ( not ( = ?auto_1118189 ?auto_1118187 ) ) ( AVAILABLE ?auto_1118187 ) ( SURFACE-AT ?auto_1118186 ?auto_1118192 ) ( ON ?auto_1118186 ?auto_1118191 ) ( CLEAR ?auto_1118186 ) ( not ( = ?auto_1118185 ?auto_1118191 ) ) ( not ( = ?auto_1118186 ?auto_1118191 ) ) ( not ( = ?auto_1118184 ?auto_1118191 ) ) ( TRUCK-AT ?auto_1118190 ?auto_1118188 ) ( SURFACE-AT ?auto_1118184 ?auto_1118188 ) ( CLEAR ?auto_1118184 ) ( LIFTING ?auto_1118189 ?auto_1118185 ) ( IS-CRATE ?auto_1118185 ) ( ON ?auto_1118179 ?auto_1118178 ) ( ON ?auto_1118180 ?auto_1118179 ) ( ON ?auto_1118181 ?auto_1118180 ) ( ON ?auto_1118182 ?auto_1118181 ) ( ON ?auto_1118183 ?auto_1118182 ) ( ON ?auto_1118184 ?auto_1118183 ) ( not ( = ?auto_1118178 ?auto_1118179 ) ) ( not ( = ?auto_1118178 ?auto_1118180 ) ) ( not ( = ?auto_1118178 ?auto_1118181 ) ) ( not ( = ?auto_1118178 ?auto_1118182 ) ) ( not ( = ?auto_1118178 ?auto_1118183 ) ) ( not ( = ?auto_1118178 ?auto_1118184 ) ) ( not ( = ?auto_1118178 ?auto_1118185 ) ) ( not ( = ?auto_1118178 ?auto_1118186 ) ) ( not ( = ?auto_1118178 ?auto_1118191 ) ) ( not ( = ?auto_1118179 ?auto_1118180 ) ) ( not ( = ?auto_1118179 ?auto_1118181 ) ) ( not ( = ?auto_1118179 ?auto_1118182 ) ) ( not ( = ?auto_1118179 ?auto_1118183 ) ) ( not ( = ?auto_1118179 ?auto_1118184 ) ) ( not ( = ?auto_1118179 ?auto_1118185 ) ) ( not ( = ?auto_1118179 ?auto_1118186 ) ) ( not ( = ?auto_1118179 ?auto_1118191 ) ) ( not ( = ?auto_1118180 ?auto_1118181 ) ) ( not ( = ?auto_1118180 ?auto_1118182 ) ) ( not ( = ?auto_1118180 ?auto_1118183 ) ) ( not ( = ?auto_1118180 ?auto_1118184 ) ) ( not ( = ?auto_1118180 ?auto_1118185 ) ) ( not ( = ?auto_1118180 ?auto_1118186 ) ) ( not ( = ?auto_1118180 ?auto_1118191 ) ) ( not ( = ?auto_1118181 ?auto_1118182 ) ) ( not ( = ?auto_1118181 ?auto_1118183 ) ) ( not ( = ?auto_1118181 ?auto_1118184 ) ) ( not ( = ?auto_1118181 ?auto_1118185 ) ) ( not ( = ?auto_1118181 ?auto_1118186 ) ) ( not ( = ?auto_1118181 ?auto_1118191 ) ) ( not ( = ?auto_1118182 ?auto_1118183 ) ) ( not ( = ?auto_1118182 ?auto_1118184 ) ) ( not ( = ?auto_1118182 ?auto_1118185 ) ) ( not ( = ?auto_1118182 ?auto_1118186 ) ) ( not ( = ?auto_1118182 ?auto_1118191 ) ) ( not ( = ?auto_1118183 ?auto_1118184 ) ) ( not ( = ?auto_1118183 ?auto_1118185 ) ) ( not ( = ?auto_1118183 ?auto_1118186 ) ) ( not ( = ?auto_1118183 ?auto_1118191 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118184 ?auto_1118185 ?auto_1118186 )
      ( MAKE-8CRATE-VERIFY ?auto_1118178 ?auto_1118179 ?auto_1118180 ?auto_1118181 ?auto_1118182 ?auto_1118183 ?auto_1118184 ?auto_1118185 ?auto_1118186 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1118271 - SURFACE
      ?auto_1118272 - SURFACE
      ?auto_1118273 - SURFACE
      ?auto_1118274 - SURFACE
      ?auto_1118275 - SURFACE
      ?auto_1118276 - SURFACE
      ?auto_1118277 - SURFACE
      ?auto_1118278 - SURFACE
      ?auto_1118279 - SURFACE
    )
    :vars
    (
      ?auto_1118283 - HOIST
      ?auto_1118285 - PLACE
      ?auto_1118282 - PLACE
      ?auto_1118284 - HOIST
      ?auto_1118281 - SURFACE
      ?auto_1118280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118283 ?auto_1118285 ) ( IS-CRATE ?auto_1118279 ) ( not ( = ?auto_1118278 ?auto_1118279 ) ) ( not ( = ?auto_1118277 ?auto_1118278 ) ) ( not ( = ?auto_1118277 ?auto_1118279 ) ) ( not ( = ?auto_1118282 ?auto_1118285 ) ) ( HOIST-AT ?auto_1118284 ?auto_1118282 ) ( not ( = ?auto_1118283 ?auto_1118284 ) ) ( AVAILABLE ?auto_1118284 ) ( SURFACE-AT ?auto_1118279 ?auto_1118282 ) ( ON ?auto_1118279 ?auto_1118281 ) ( CLEAR ?auto_1118279 ) ( not ( = ?auto_1118278 ?auto_1118281 ) ) ( not ( = ?auto_1118279 ?auto_1118281 ) ) ( not ( = ?auto_1118277 ?auto_1118281 ) ) ( TRUCK-AT ?auto_1118280 ?auto_1118285 ) ( SURFACE-AT ?auto_1118277 ?auto_1118285 ) ( CLEAR ?auto_1118277 ) ( IS-CRATE ?auto_1118278 ) ( AVAILABLE ?auto_1118283 ) ( IN ?auto_1118278 ?auto_1118280 ) ( ON ?auto_1118272 ?auto_1118271 ) ( ON ?auto_1118273 ?auto_1118272 ) ( ON ?auto_1118274 ?auto_1118273 ) ( ON ?auto_1118275 ?auto_1118274 ) ( ON ?auto_1118276 ?auto_1118275 ) ( ON ?auto_1118277 ?auto_1118276 ) ( not ( = ?auto_1118271 ?auto_1118272 ) ) ( not ( = ?auto_1118271 ?auto_1118273 ) ) ( not ( = ?auto_1118271 ?auto_1118274 ) ) ( not ( = ?auto_1118271 ?auto_1118275 ) ) ( not ( = ?auto_1118271 ?auto_1118276 ) ) ( not ( = ?auto_1118271 ?auto_1118277 ) ) ( not ( = ?auto_1118271 ?auto_1118278 ) ) ( not ( = ?auto_1118271 ?auto_1118279 ) ) ( not ( = ?auto_1118271 ?auto_1118281 ) ) ( not ( = ?auto_1118272 ?auto_1118273 ) ) ( not ( = ?auto_1118272 ?auto_1118274 ) ) ( not ( = ?auto_1118272 ?auto_1118275 ) ) ( not ( = ?auto_1118272 ?auto_1118276 ) ) ( not ( = ?auto_1118272 ?auto_1118277 ) ) ( not ( = ?auto_1118272 ?auto_1118278 ) ) ( not ( = ?auto_1118272 ?auto_1118279 ) ) ( not ( = ?auto_1118272 ?auto_1118281 ) ) ( not ( = ?auto_1118273 ?auto_1118274 ) ) ( not ( = ?auto_1118273 ?auto_1118275 ) ) ( not ( = ?auto_1118273 ?auto_1118276 ) ) ( not ( = ?auto_1118273 ?auto_1118277 ) ) ( not ( = ?auto_1118273 ?auto_1118278 ) ) ( not ( = ?auto_1118273 ?auto_1118279 ) ) ( not ( = ?auto_1118273 ?auto_1118281 ) ) ( not ( = ?auto_1118274 ?auto_1118275 ) ) ( not ( = ?auto_1118274 ?auto_1118276 ) ) ( not ( = ?auto_1118274 ?auto_1118277 ) ) ( not ( = ?auto_1118274 ?auto_1118278 ) ) ( not ( = ?auto_1118274 ?auto_1118279 ) ) ( not ( = ?auto_1118274 ?auto_1118281 ) ) ( not ( = ?auto_1118275 ?auto_1118276 ) ) ( not ( = ?auto_1118275 ?auto_1118277 ) ) ( not ( = ?auto_1118275 ?auto_1118278 ) ) ( not ( = ?auto_1118275 ?auto_1118279 ) ) ( not ( = ?auto_1118275 ?auto_1118281 ) ) ( not ( = ?auto_1118276 ?auto_1118277 ) ) ( not ( = ?auto_1118276 ?auto_1118278 ) ) ( not ( = ?auto_1118276 ?auto_1118279 ) ) ( not ( = ?auto_1118276 ?auto_1118281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118277 ?auto_1118278 ?auto_1118279 )
      ( MAKE-8CRATE-VERIFY ?auto_1118271 ?auto_1118272 ?auto_1118273 ?auto_1118274 ?auto_1118275 ?auto_1118276 ?auto_1118277 ?auto_1118278 ?auto_1118279 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122387 - SURFACE
      ?auto_1122388 - SURFACE
      ?auto_1122389 - SURFACE
      ?auto_1122390 - SURFACE
      ?auto_1122391 - SURFACE
      ?auto_1122392 - SURFACE
      ?auto_1122393 - SURFACE
      ?auto_1122394 - SURFACE
      ?auto_1122395 - SURFACE
      ?auto_1122396 - SURFACE
    )
    :vars
    (
      ?auto_1122398 - HOIST
      ?auto_1122397 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122398 ?auto_1122397 ) ( SURFACE-AT ?auto_1122395 ?auto_1122397 ) ( CLEAR ?auto_1122395 ) ( LIFTING ?auto_1122398 ?auto_1122396 ) ( IS-CRATE ?auto_1122396 ) ( not ( = ?auto_1122395 ?auto_1122396 ) ) ( ON ?auto_1122388 ?auto_1122387 ) ( ON ?auto_1122389 ?auto_1122388 ) ( ON ?auto_1122390 ?auto_1122389 ) ( ON ?auto_1122391 ?auto_1122390 ) ( ON ?auto_1122392 ?auto_1122391 ) ( ON ?auto_1122393 ?auto_1122392 ) ( ON ?auto_1122394 ?auto_1122393 ) ( ON ?auto_1122395 ?auto_1122394 ) ( not ( = ?auto_1122387 ?auto_1122388 ) ) ( not ( = ?auto_1122387 ?auto_1122389 ) ) ( not ( = ?auto_1122387 ?auto_1122390 ) ) ( not ( = ?auto_1122387 ?auto_1122391 ) ) ( not ( = ?auto_1122387 ?auto_1122392 ) ) ( not ( = ?auto_1122387 ?auto_1122393 ) ) ( not ( = ?auto_1122387 ?auto_1122394 ) ) ( not ( = ?auto_1122387 ?auto_1122395 ) ) ( not ( = ?auto_1122387 ?auto_1122396 ) ) ( not ( = ?auto_1122388 ?auto_1122389 ) ) ( not ( = ?auto_1122388 ?auto_1122390 ) ) ( not ( = ?auto_1122388 ?auto_1122391 ) ) ( not ( = ?auto_1122388 ?auto_1122392 ) ) ( not ( = ?auto_1122388 ?auto_1122393 ) ) ( not ( = ?auto_1122388 ?auto_1122394 ) ) ( not ( = ?auto_1122388 ?auto_1122395 ) ) ( not ( = ?auto_1122388 ?auto_1122396 ) ) ( not ( = ?auto_1122389 ?auto_1122390 ) ) ( not ( = ?auto_1122389 ?auto_1122391 ) ) ( not ( = ?auto_1122389 ?auto_1122392 ) ) ( not ( = ?auto_1122389 ?auto_1122393 ) ) ( not ( = ?auto_1122389 ?auto_1122394 ) ) ( not ( = ?auto_1122389 ?auto_1122395 ) ) ( not ( = ?auto_1122389 ?auto_1122396 ) ) ( not ( = ?auto_1122390 ?auto_1122391 ) ) ( not ( = ?auto_1122390 ?auto_1122392 ) ) ( not ( = ?auto_1122390 ?auto_1122393 ) ) ( not ( = ?auto_1122390 ?auto_1122394 ) ) ( not ( = ?auto_1122390 ?auto_1122395 ) ) ( not ( = ?auto_1122390 ?auto_1122396 ) ) ( not ( = ?auto_1122391 ?auto_1122392 ) ) ( not ( = ?auto_1122391 ?auto_1122393 ) ) ( not ( = ?auto_1122391 ?auto_1122394 ) ) ( not ( = ?auto_1122391 ?auto_1122395 ) ) ( not ( = ?auto_1122391 ?auto_1122396 ) ) ( not ( = ?auto_1122392 ?auto_1122393 ) ) ( not ( = ?auto_1122392 ?auto_1122394 ) ) ( not ( = ?auto_1122392 ?auto_1122395 ) ) ( not ( = ?auto_1122392 ?auto_1122396 ) ) ( not ( = ?auto_1122393 ?auto_1122394 ) ) ( not ( = ?auto_1122393 ?auto_1122395 ) ) ( not ( = ?auto_1122393 ?auto_1122396 ) ) ( not ( = ?auto_1122394 ?auto_1122395 ) ) ( not ( = ?auto_1122394 ?auto_1122396 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1122395 ?auto_1122396 )
      ( MAKE-9CRATE-VERIFY ?auto_1122387 ?auto_1122388 ?auto_1122389 ?auto_1122390 ?auto_1122391 ?auto_1122392 ?auto_1122393 ?auto_1122394 ?auto_1122395 ?auto_1122396 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122467 - SURFACE
      ?auto_1122468 - SURFACE
      ?auto_1122469 - SURFACE
      ?auto_1122470 - SURFACE
      ?auto_1122471 - SURFACE
      ?auto_1122472 - SURFACE
      ?auto_1122473 - SURFACE
      ?auto_1122474 - SURFACE
      ?auto_1122475 - SURFACE
      ?auto_1122476 - SURFACE
    )
    :vars
    (
      ?auto_1122479 - HOIST
      ?auto_1122478 - PLACE
      ?auto_1122477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122479 ?auto_1122478 ) ( SURFACE-AT ?auto_1122475 ?auto_1122478 ) ( CLEAR ?auto_1122475 ) ( IS-CRATE ?auto_1122476 ) ( not ( = ?auto_1122475 ?auto_1122476 ) ) ( TRUCK-AT ?auto_1122477 ?auto_1122478 ) ( AVAILABLE ?auto_1122479 ) ( IN ?auto_1122476 ?auto_1122477 ) ( ON ?auto_1122475 ?auto_1122474 ) ( not ( = ?auto_1122474 ?auto_1122475 ) ) ( not ( = ?auto_1122474 ?auto_1122476 ) ) ( ON ?auto_1122468 ?auto_1122467 ) ( ON ?auto_1122469 ?auto_1122468 ) ( ON ?auto_1122470 ?auto_1122469 ) ( ON ?auto_1122471 ?auto_1122470 ) ( ON ?auto_1122472 ?auto_1122471 ) ( ON ?auto_1122473 ?auto_1122472 ) ( ON ?auto_1122474 ?auto_1122473 ) ( not ( = ?auto_1122467 ?auto_1122468 ) ) ( not ( = ?auto_1122467 ?auto_1122469 ) ) ( not ( = ?auto_1122467 ?auto_1122470 ) ) ( not ( = ?auto_1122467 ?auto_1122471 ) ) ( not ( = ?auto_1122467 ?auto_1122472 ) ) ( not ( = ?auto_1122467 ?auto_1122473 ) ) ( not ( = ?auto_1122467 ?auto_1122474 ) ) ( not ( = ?auto_1122467 ?auto_1122475 ) ) ( not ( = ?auto_1122467 ?auto_1122476 ) ) ( not ( = ?auto_1122468 ?auto_1122469 ) ) ( not ( = ?auto_1122468 ?auto_1122470 ) ) ( not ( = ?auto_1122468 ?auto_1122471 ) ) ( not ( = ?auto_1122468 ?auto_1122472 ) ) ( not ( = ?auto_1122468 ?auto_1122473 ) ) ( not ( = ?auto_1122468 ?auto_1122474 ) ) ( not ( = ?auto_1122468 ?auto_1122475 ) ) ( not ( = ?auto_1122468 ?auto_1122476 ) ) ( not ( = ?auto_1122469 ?auto_1122470 ) ) ( not ( = ?auto_1122469 ?auto_1122471 ) ) ( not ( = ?auto_1122469 ?auto_1122472 ) ) ( not ( = ?auto_1122469 ?auto_1122473 ) ) ( not ( = ?auto_1122469 ?auto_1122474 ) ) ( not ( = ?auto_1122469 ?auto_1122475 ) ) ( not ( = ?auto_1122469 ?auto_1122476 ) ) ( not ( = ?auto_1122470 ?auto_1122471 ) ) ( not ( = ?auto_1122470 ?auto_1122472 ) ) ( not ( = ?auto_1122470 ?auto_1122473 ) ) ( not ( = ?auto_1122470 ?auto_1122474 ) ) ( not ( = ?auto_1122470 ?auto_1122475 ) ) ( not ( = ?auto_1122470 ?auto_1122476 ) ) ( not ( = ?auto_1122471 ?auto_1122472 ) ) ( not ( = ?auto_1122471 ?auto_1122473 ) ) ( not ( = ?auto_1122471 ?auto_1122474 ) ) ( not ( = ?auto_1122471 ?auto_1122475 ) ) ( not ( = ?auto_1122471 ?auto_1122476 ) ) ( not ( = ?auto_1122472 ?auto_1122473 ) ) ( not ( = ?auto_1122472 ?auto_1122474 ) ) ( not ( = ?auto_1122472 ?auto_1122475 ) ) ( not ( = ?auto_1122472 ?auto_1122476 ) ) ( not ( = ?auto_1122473 ?auto_1122474 ) ) ( not ( = ?auto_1122473 ?auto_1122475 ) ) ( not ( = ?auto_1122473 ?auto_1122476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1122474 ?auto_1122475 ?auto_1122476 )
      ( MAKE-9CRATE-VERIFY ?auto_1122467 ?auto_1122468 ?auto_1122469 ?auto_1122470 ?auto_1122471 ?auto_1122472 ?auto_1122473 ?auto_1122474 ?auto_1122475 ?auto_1122476 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122557 - SURFACE
      ?auto_1122558 - SURFACE
      ?auto_1122559 - SURFACE
      ?auto_1122560 - SURFACE
      ?auto_1122561 - SURFACE
      ?auto_1122562 - SURFACE
      ?auto_1122563 - SURFACE
      ?auto_1122564 - SURFACE
      ?auto_1122565 - SURFACE
      ?auto_1122566 - SURFACE
    )
    :vars
    (
      ?auto_1122569 - HOIST
      ?auto_1122568 - PLACE
      ?auto_1122567 - TRUCK
      ?auto_1122570 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122569 ?auto_1122568 ) ( SURFACE-AT ?auto_1122565 ?auto_1122568 ) ( CLEAR ?auto_1122565 ) ( IS-CRATE ?auto_1122566 ) ( not ( = ?auto_1122565 ?auto_1122566 ) ) ( AVAILABLE ?auto_1122569 ) ( IN ?auto_1122566 ?auto_1122567 ) ( ON ?auto_1122565 ?auto_1122564 ) ( not ( = ?auto_1122564 ?auto_1122565 ) ) ( not ( = ?auto_1122564 ?auto_1122566 ) ) ( TRUCK-AT ?auto_1122567 ?auto_1122570 ) ( not ( = ?auto_1122570 ?auto_1122568 ) ) ( ON ?auto_1122558 ?auto_1122557 ) ( ON ?auto_1122559 ?auto_1122558 ) ( ON ?auto_1122560 ?auto_1122559 ) ( ON ?auto_1122561 ?auto_1122560 ) ( ON ?auto_1122562 ?auto_1122561 ) ( ON ?auto_1122563 ?auto_1122562 ) ( ON ?auto_1122564 ?auto_1122563 ) ( not ( = ?auto_1122557 ?auto_1122558 ) ) ( not ( = ?auto_1122557 ?auto_1122559 ) ) ( not ( = ?auto_1122557 ?auto_1122560 ) ) ( not ( = ?auto_1122557 ?auto_1122561 ) ) ( not ( = ?auto_1122557 ?auto_1122562 ) ) ( not ( = ?auto_1122557 ?auto_1122563 ) ) ( not ( = ?auto_1122557 ?auto_1122564 ) ) ( not ( = ?auto_1122557 ?auto_1122565 ) ) ( not ( = ?auto_1122557 ?auto_1122566 ) ) ( not ( = ?auto_1122558 ?auto_1122559 ) ) ( not ( = ?auto_1122558 ?auto_1122560 ) ) ( not ( = ?auto_1122558 ?auto_1122561 ) ) ( not ( = ?auto_1122558 ?auto_1122562 ) ) ( not ( = ?auto_1122558 ?auto_1122563 ) ) ( not ( = ?auto_1122558 ?auto_1122564 ) ) ( not ( = ?auto_1122558 ?auto_1122565 ) ) ( not ( = ?auto_1122558 ?auto_1122566 ) ) ( not ( = ?auto_1122559 ?auto_1122560 ) ) ( not ( = ?auto_1122559 ?auto_1122561 ) ) ( not ( = ?auto_1122559 ?auto_1122562 ) ) ( not ( = ?auto_1122559 ?auto_1122563 ) ) ( not ( = ?auto_1122559 ?auto_1122564 ) ) ( not ( = ?auto_1122559 ?auto_1122565 ) ) ( not ( = ?auto_1122559 ?auto_1122566 ) ) ( not ( = ?auto_1122560 ?auto_1122561 ) ) ( not ( = ?auto_1122560 ?auto_1122562 ) ) ( not ( = ?auto_1122560 ?auto_1122563 ) ) ( not ( = ?auto_1122560 ?auto_1122564 ) ) ( not ( = ?auto_1122560 ?auto_1122565 ) ) ( not ( = ?auto_1122560 ?auto_1122566 ) ) ( not ( = ?auto_1122561 ?auto_1122562 ) ) ( not ( = ?auto_1122561 ?auto_1122563 ) ) ( not ( = ?auto_1122561 ?auto_1122564 ) ) ( not ( = ?auto_1122561 ?auto_1122565 ) ) ( not ( = ?auto_1122561 ?auto_1122566 ) ) ( not ( = ?auto_1122562 ?auto_1122563 ) ) ( not ( = ?auto_1122562 ?auto_1122564 ) ) ( not ( = ?auto_1122562 ?auto_1122565 ) ) ( not ( = ?auto_1122562 ?auto_1122566 ) ) ( not ( = ?auto_1122563 ?auto_1122564 ) ) ( not ( = ?auto_1122563 ?auto_1122565 ) ) ( not ( = ?auto_1122563 ?auto_1122566 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1122564 ?auto_1122565 ?auto_1122566 )
      ( MAKE-9CRATE-VERIFY ?auto_1122557 ?auto_1122558 ?auto_1122559 ?auto_1122560 ?auto_1122561 ?auto_1122562 ?auto_1122563 ?auto_1122564 ?auto_1122565 ?auto_1122566 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122656 - SURFACE
      ?auto_1122657 - SURFACE
      ?auto_1122658 - SURFACE
      ?auto_1122659 - SURFACE
      ?auto_1122660 - SURFACE
      ?auto_1122661 - SURFACE
      ?auto_1122662 - SURFACE
      ?auto_1122663 - SURFACE
      ?auto_1122664 - SURFACE
      ?auto_1122665 - SURFACE
    )
    :vars
    (
      ?auto_1122667 - HOIST
      ?auto_1122666 - PLACE
      ?auto_1122668 - TRUCK
      ?auto_1122670 - PLACE
      ?auto_1122669 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122667 ?auto_1122666 ) ( SURFACE-AT ?auto_1122664 ?auto_1122666 ) ( CLEAR ?auto_1122664 ) ( IS-CRATE ?auto_1122665 ) ( not ( = ?auto_1122664 ?auto_1122665 ) ) ( AVAILABLE ?auto_1122667 ) ( ON ?auto_1122664 ?auto_1122663 ) ( not ( = ?auto_1122663 ?auto_1122664 ) ) ( not ( = ?auto_1122663 ?auto_1122665 ) ) ( TRUCK-AT ?auto_1122668 ?auto_1122670 ) ( not ( = ?auto_1122670 ?auto_1122666 ) ) ( HOIST-AT ?auto_1122669 ?auto_1122670 ) ( LIFTING ?auto_1122669 ?auto_1122665 ) ( not ( = ?auto_1122667 ?auto_1122669 ) ) ( ON ?auto_1122657 ?auto_1122656 ) ( ON ?auto_1122658 ?auto_1122657 ) ( ON ?auto_1122659 ?auto_1122658 ) ( ON ?auto_1122660 ?auto_1122659 ) ( ON ?auto_1122661 ?auto_1122660 ) ( ON ?auto_1122662 ?auto_1122661 ) ( ON ?auto_1122663 ?auto_1122662 ) ( not ( = ?auto_1122656 ?auto_1122657 ) ) ( not ( = ?auto_1122656 ?auto_1122658 ) ) ( not ( = ?auto_1122656 ?auto_1122659 ) ) ( not ( = ?auto_1122656 ?auto_1122660 ) ) ( not ( = ?auto_1122656 ?auto_1122661 ) ) ( not ( = ?auto_1122656 ?auto_1122662 ) ) ( not ( = ?auto_1122656 ?auto_1122663 ) ) ( not ( = ?auto_1122656 ?auto_1122664 ) ) ( not ( = ?auto_1122656 ?auto_1122665 ) ) ( not ( = ?auto_1122657 ?auto_1122658 ) ) ( not ( = ?auto_1122657 ?auto_1122659 ) ) ( not ( = ?auto_1122657 ?auto_1122660 ) ) ( not ( = ?auto_1122657 ?auto_1122661 ) ) ( not ( = ?auto_1122657 ?auto_1122662 ) ) ( not ( = ?auto_1122657 ?auto_1122663 ) ) ( not ( = ?auto_1122657 ?auto_1122664 ) ) ( not ( = ?auto_1122657 ?auto_1122665 ) ) ( not ( = ?auto_1122658 ?auto_1122659 ) ) ( not ( = ?auto_1122658 ?auto_1122660 ) ) ( not ( = ?auto_1122658 ?auto_1122661 ) ) ( not ( = ?auto_1122658 ?auto_1122662 ) ) ( not ( = ?auto_1122658 ?auto_1122663 ) ) ( not ( = ?auto_1122658 ?auto_1122664 ) ) ( not ( = ?auto_1122658 ?auto_1122665 ) ) ( not ( = ?auto_1122659 ?auto_1122660 ) ) ( not ( = ?auto_1122659 ?auto_1122661 ) ) ( not ( = ?auto_1122659 ?auto_1122662 ) ) ( not ( = ?auto_1122659 ?auto_1122663 ) ) ( not ( = ?auto_1122659 ?auto_1122664 ) ) ( not ( = ?auto_1122659 ?auto_1122665 ) ) ( not ( = ?auto_1122660 ?auto_1122661 ) ) ( not ( = ?auto_1122660 ?auto_1122662 ) ) ( not ( = ?auto_1122660 ?auto_1122663 ) ) ( not ( = ?auto_1122660 ?auto_1122664 ) ) ( not ( = ?auto_1122660 ?auto_1122665 ) ) ( not ( = ?auto_1122661 ?auto_1122662 ) ) ( not ( = ?auto_1122661 ?auto_1122663 ) ) ( not ( = ?auto_1122661 ?auto_1122664 ) ) ( not ( = ?auto_1122661 ?auto_1122665 ) ) ( not ( = ?auto_1122662 ?auto_1122663 ) ) ( not ( = ?auto_1122662 ?auto_1122664 ) ) ( not ( = ?auto_1122662 ?auto_1122665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1122663 ?auto_1122664 ?auto_1122665 )
      ( MAKE-9CRATE-VERIFY ?auto_1122656 ?auto_1122657 ?auto_1122658 ?auto_1122659 ?auto_1122660 ?auto_1122661 ?auto_1122662 ?auto_1122663 ?auto_1122664 ?auto_1122665 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122764 - SURFACE
      ?auto_1122765 - SURFACE
      ?auto_1122766 - SURFACE
      ?auto_1122767 - SURFACE
      ?auto_1122768 - SURFACE
      ?auto_1122769 - SURFACE
      ?auto_1122770 - SURFACE
      ?auto_1122771 - SURFACE
      ?auto_1122772 - SURFACE
      ?auto_1122773 - SURFACE
    )
    :vars
    (
      ?auto_1122779 - HOIST
      ?auto_1122777 - PLACE
      ?auto_1122774 - TRUCK
      ?auto_1122778 - PLACE
      ?auto_1122776 - HOIST
      ?auto_1122775 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122779 ?auto_1122777 ) ( SURFACE-AT ?auto_1122772 ?auto_1122777 ) ( CLEAR ?auto_1122772 ) ( IS-CRATE ?auto_1122773 ) ( not ( = ?auto_1122772 ?auto_1122773 ) ) ( AVAILABLE ?auto_1122779 ) ( ON ?auto_1122772 ?auto_1122771 ) ( not ( = ?auto_1122771 ?auto_1122772 ) ) ( not ( = ?auto_1122771 ?auto_1122773 ) ) ( TRUCK-AT ?auto_1122774 ?auto_1122778 ) ( not ( = ?auto_1122778 ?auto_1122777 ) ) ( HOIST-AT ?auto_1122776 ?auto_1122778 ) ( not ( = ?auto_1122779 ?auto_1122776 ) ) ( AVAILABLE ?auto_1122776 ) ( SURFACE-AT ?auto_1122773 ?auto_1122778 ) ( ON ?auto_1122773 ?auto_1122775 ) ( CLEAR ?auto_1122773 ) ( not ( = ?auto_1122772 ?auto_1122775 ) ) ( not ( = ?auto_1122773 ?auto_1122775 ) ) ( not ( = ?auto_1122771 ?auto_1122775 ) ) ( ON ?auto_1122765 ?auto_1122764 ) ( ON ?auto_1122766 ?auto_1122765 ) ( ON ?auto_1122767 ?auto_1122766 ) ( ON ?auto_1122768 ?auto_1122767 ) ( ON ?auto_1122769 ?auto_1122768 ) ( ON ?auto_1122770 ?auto_1122769 ) ( ON ?auto_1122771 ?auto_1122770 ) ( not ( = ?auto_1122764 ?auto_1122765 ) ) ( not ( = ?auto_1122764 ?auto_1122766 ) ) ( not ( = ?auto_1122764 ?auto_1122767 ) ) ( not ( = ?auto_1122764 ?auto_1122768 ) ) ( not ( = ?auto_1122764 ?auto_1122769 ) ) ( not ( = ?auto_1122764 ?auto_1122770 ) ) ( not ( = ?auto_1122764 ?auto_1122771 ) ) ( not ( = ?auto_1122764 ?auto_1122772 ) ) ( not ( = ?auto_1122764 ?auto_1122773 ) ) ( not ( = ?auto_1122764 ?auto_1122775 ) ) ( not ( = ?auto_1122765 ?auto_1122766 ) ) ( not ( = ?auto_1122765 ?auto_1122767 ) ) ( not ( = ?auto_1122765 ?auto_1122768 ) ) ( not ( = ?auto_1122765 ?auto_1122769 ) ) ( not ( = ?auto_1122765 ?auto_1122770 ) ) ( not ( = ?auto_1122765 ?auto_1122771 ) ) ( not ( = ?auto_1122765 ?auto_1122772 ) ) ( not ( = ?auto_1122765 ?auto_1122773 ) ) ( not ( = ?auto_1122765 ?auto_1122775 ) ) ( not ( = ?auto_1122766 ?auto_1122767 ) ) ( not ( = ?auto_1122766 ?auto_1122768 ) ) ( not ( = ?auto_1122766 ?auto_1122769 ) ) ( not ( = ?auto_1122766 ?auto_1122770 ) ) ( not ( = ?auto_1122766 ?auto_1122771 ) ) ( not ( = ?auto_1122766 ?auto_1122772 ) ) ( not ( = ?auto_1122766 ?auto_1122773 ) ) ( not ( = ?auto_1122766 ?auto_1122775 ) ) ( not ( = ?auto_1122767 ?auto_1122768 ) ) ( not ( = ?auto_1122767 ?auto_1122769 ) ) ( not ( = ?auto_1122767 ?auto_1122770 ) ) ( not ( = ?auto_1122767 ?auto_1122771 ) ) ( not ( = ?auto_1122767 ?auto_1122772 ) ) ( not ( = ?auto_1122767 ?auto_1122773 ) ) ( not ( = ?auto_1122767 ?auto_1122775 ) ) ( not ( = ?auto_1122768 ?auto_1122769 ) ) ( not ( = ?auto_1122768 ?auto_1122770 ) ) ( not ( = ?auto_1122768 ?auto_1122771 ) ) ( not ( = ?auto_1122768 ?auto_1122772 ) ) ( not ( = ?auto_1122768 ?auto_1122773 ) ) ( not ( = ?auto_1122768 ?auto_1122775 ) ) ( not ( = ?auto_1122769 ?auto_1122770 ) ) ( not ( = ?auto_1122769 ?auto_1122771 ) ) ( not ( = ?auto_1122769 ?auto_1122772 ) ) ( not ( = ?auto_1122769 ?auto_1122773 ) ) ( not ( = ?auto_1122769 ?auto_1122775 ) ) ( not ( = ?auto_1122770 ?auto_1122771 ) ) ( not ( = ?auto_1122770 ?auto_1122772 ) ) ( not ( = ?auto_1122770 ?auto_1122773 ) ) ( not ( = ?auto_1122770 ?auto_1122775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1122771 ?auto_1122772 ?auto_1122773 )
      ( MAKE-9CRATE-VERIFY ?auto_1122764 ?auto_1122765 ?auto_1122766 ?auto_1122767 ?auto_1122768 ?auto_1122769 ?auto_1122770 ?auto_1122771 ?auto_1122772 ?auto_1122773 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122873 - SURFACE
      ?auto_1122874 - SURFACE
      ?auto_1122875 - SURFACE
      ?auto_1122876 - SURFACE
      ?auto_1122877 - SURFACE
      ?auto_1122878 - SURFACE
      ?auto_1122879 - SURFACE
      ?auto_1122880 - SURFACE
      ?auto_1122881 - SURFACE
      ?auto_1122882 - SURFACE
    )
    :vars
    (
      ?auto_1122884 - HOIST
      ?auto_1122883 - PLACE
      ?auto_1122888 - PLACE
      ?auto_1122885 - HOIST
      ?auto_1122886 - SURFACE
      ?auto_1122887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122884 ?auto_1122883 ) ( SURFACE-AT ?auto_1122881 ?auto_1122883 ) ( CLEAR ?auto_1122881 ) ( IS-CRATE ?auto_1122882 ) ( not ( = ?auto_1122881 ?auto_1122882 ) ) ( AVAILABLE ?auto_1122884 ) ( ON ?auto_1122881 ?auto_1122880 ) ( not ( = ?auto_1122880 ?auto_1122881 ) ) ( not ( = ?auto_1122880 ?auto_1122882 ) ) ( not ( = ?auto_1122888 ?auto_1122883 ) ) ( HOIST-AT ?auto_1122885 ?auto_1122888 ) ( not ( = ?auto_1122884 ?auto_1122885 ) ) ( AVAILABLE ?auto_1122885 ) ( SURFACE-AT ?auto_1122882 ?auto_1122888 ) ( ON ?auto_1122882 ?auto_1122886 ) ( CLEAR ?auto_1122882 ) ( not ( = ?auto_1122881 ?auto_1122886 ) ) ( not ( = ?auto_1122882 ?auto_1122886 ) ) ( not ( = ?auto_1122880 ?auto_1122886 ) ) ( TRUCK-AT ?auto_1122887 ?auto_1122883 ) ( ON ?auto_1122874 ?auto_1122873 ) ( ON ?auto_1122875 ?auto_1122874 ) ( ON ?auto_1122876 ?auto_1122875 ) ( ON ?auto_1122877 ?auto_1122876 ) ( ON ?auto_1122878 ?auto_1122877 ) ( ON ?auto_1122879 ?auto_1122878 ) ( ON ?auto_1122880 ?auto_1122879 ) ( not ( = ?auto_1122873 ?auto_1122874 ) ) ( not ( = ?auto_1122873 ?auto_1122875 ) ) ( not ( = ?auto_1122873 ?auto_1122876 ) ) ( not ( = ?auto_1122873 ?auto_1122877 ) ) ( not ( = ?auto_1122873 ?auto_1122878 ) ) ( not ( = ?auto_1122873 ?auto_1122879 ) ) ( not ( = ?auto_1122873 ?auto_1122880 ) ) ( not ( = ?auto_1122873 ?auto_1122881 ) ) ( not ( = ?auto_1122873 ?auto_1122882 ) ) ( not ( = ?auto_1122873 ?auto_1122886 ) ) ( not ( = ?auto_1122874 ?auto_1122875 ) ) ( not ( = ?auto_1122874 ?auto_1122876 ) ) ( not ( = ?auto_1122874 ?auto_1122877 ) ) ( not ( = ?auto_1122874 ?auto_1122878 ) ) ( not ( = ?auto_1122874 ?auto_1122879 ) ) ( not ( = ?auto_1122874 ?auto_1122880 ) ) ( not ( = ?auto_1122874 ?auto_1122881 ) ) ( not ( = ?auto_1122874 ?auto_1122882 ) ) ( not ( = ?auto_1122874 ?auto_1122886 ) ) ( not ( = ?auto_1122875 ?auto_1122876 ) ) ( not ( = ?auto_1122875 ?auto_1122877 ) ) ( not ( = ?auto_1122875 ?auto_1122878 ) ) ( not ( = ?auto_1122875 ?auto_1122879 ) ) ( not ( = ?auto_1122875 ?auto_1122880 ) ) ( not ( = ?auto_1122875 ?auto_1122881 ) ) ( not ( = ?auto_1122875 ?auto_1122882 ) ) ( not ( = ?auto_1122875 ?auto_1122886 ) ) ( not ( = ?auto_1122876 ?auto_1122877 ) ) ( not ( = ?auto_1122876 ?auto_1122878 ) ) ( not ( = ?auto_1122876 ?auto_1122879 ) ) ( not ( = ?auto_1122876 ?auto_1122880 ) ) ( not ( = ?auto_1122876 ?auto_1122881 ) ) ( not ( = ?auto_1122876 ?auto_1122882 ) ) ( not ( = ?auto_1122876 ?auto_1122886 ) ) ( not ( = ?auto_1122877 ?auto_1122878 ) ) ( not ( = ?auto_1122877 ?auto_1122879 ) ) ( not ( = ?auto_1122877 ?auto_1122880 ) ) ( not ( = ?auto_1122877 ?auto_1122881 ) ) ( not ( = ?auto_1122877 ?auto_1122882 ) ) ( not ( = ?auto_1122877 ?auto_1122886 ) ) ( not ( = ?auto_1122878 ?auto_1122879 ) ) ( not ( = ?auto_1122878 ?auto_1122880 ) ) ( not ( = ?auto_1122878 ?auto_1122881 ) ) ( not ( = ?auto_1122878 ?auto_1122882 ) ) ( not ( = ?auto_1122878 ?auto_1122886 ) ) ( not ( = ?auto_1122879 ?auto_1122880 ) ) ( not ( = ?auto_1122879 ?auto_1122881 ) ) ( not ( = ?auto_1122879 ?auto_1122882 ) ) ( not ( = ?auto_1122879 ?auto_1122886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1122880 ?auto_1122881 ?auto_1122882 )
      ( MAKE-9CRATE-VERIFY ?auto_1122873 ?auto_1122874 ?auto_1122875 ?auto_1122876 ?auto_1122877 ?auto_1122878 ?auto_1122879 ?auto_1122880 ?auto_1122881 ?auto_1122882 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122982 - SURFACE
      ?auto_1122983 - SURFACE
      ?auto_1122984 - SURFACE
      ?auto_1122985 - SURFACE
      ?auto_1122986 - SURFACE
      ?auto_1122987 - SURFACE
      ?auto_1122988 - SURFACE
      ?auto_1122989 - SURFACE
      ?auto_1122990 - SURFACE
      ?auto_1122991 - SURFACE
    )
    :vars
    (
      ?auto_1122995 - HOIST
      ?auto_1122993 - PLACE
      ?auto_1122992 - PLACE
      ?auto_1122997 - HOIST
      ?auto_1122994 - SURFACE
      ?auto_1122996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122995 ?auto_1122993 ) ( IS-CRATE ?auto_1122991 ) ( not ( = ?auto_1122990 ?auto_1122991 ) ) ( not ( = ?auto_1122989 ?auto_1122990 ) ) ( not ( = ?auto_1122989 ?auto_1122991 ) ) ( not ( = ?auto_1122992 ?auto_1122993 ) ) ( HOIST-AT ?auto_1122997 ?auto_1122992 ) ( not ( = ?auto_1122995 ?auto_1122997 ) ) ( AVAILABLE ?auto_1122997 ) ( SURFACE-AT ?auto_1122991 ?auto_1122992 ) ( ON ?auto_1122991 ?auto_1122994 ) ( CLEAR ?auto_1122991 ) ( not ( = ?auto_1122990 ?auto_1122994 ) ) ( not ( = ?auto_1122991 ?auto_1122994 ) ) ( not ( = ?auto_1122989 ?auto_1122994 ) ) ( TRUCK-AT ?auto_1122996 ?auto_1122993 ) ( SURFACE-AT ?auto_1122989 ?auto_1122993 ) ( CLEAR ?auto_1122989 ) ( LIFTING ?auto_1122995 ?auto_1122990 ) ( IS-CRATE ?auto_1122990 ) ( ON ?auto_1122983 ?auto_1122982 ) ( ON ?auto_1122984 ?auto_1122983 ) ( ON ?auto_1122985 ?auto_1122984 ) ( ON ?auto_1122986 ?auto_1122985 ) ( ON ?auto_1122987 ?auto_1122986 ) ( ON ?auto_1122988 ?auto_1122987 ) ( ON ?auto_1122989 ?auto_1122988 ) ( not ( = ?auto_1122982 ?auto_1122983 ) ) ( not ( = ?auto_1122982 ?auto_1122984 ) ) ( not ( = ?auto_1122982 ?auto_1122985 ) ) ( not ( = ?auto_1122982 ?auto_1122986 ) ) ( not ( = ?auto_1122982 ?auto_1122987 ) ) ( not ( = ?auto_1122982 ?auto_1122988 ) ) ( not ( = ?auto_1122982 ?auto_1122989 ) ) ( not ( = ?auto_1122982 ?auto_1122990 ) ) ( not ( = ?auto_1122982 ?auto_1122991 ) ) ( not ( = ?auto_1122982 ?auto_1122994 ) ) ( not ( = ?auto_1122983 ?auto_1122984 ) ) ( not ( = ?auto_1122983 ?auto_1122985 ) ) ( not ( = ?auto_1122983 ?auto_1122986 ) ) ( not ( = ?auto_1122983 ?auto_1122987 ) ) ( not ( = ?auto_1122983 ?auto_1122988 ) ) ( not ( = ?auto_1122983 ?auto_1122989 ) ) ( not ( = ?auto_1122983 ?auto_1122990 ) ) ( not ( = ?auto_1122983 ?auto_1122991 ) ) ( not ( = ?auto_1122983 ?auto_1122994 ) ) ( not ( = ?auto_1122984 ?auto_1122985 ) ) ( not ( = ?auto_1122984 ?auto_1122986 ) ) ( not ( = ?auto_1122984 ?auto_1122987 ) ) ( not ( = ?auto_1122984 ?auto_1122988 ) ) ( not ( = ?auto_1122984 ?auto_1122989 ) ) ( not ( = ?auto_1122984 ?auto_1122990 ) ) ( not ( = ?auto_1122984 ?auto_1122991 ) ) ( not ( = ?auto_1122984 ?auto_1122994 ) ) ( not ( = ?auto_1122985 ?auto_1122986 ) ) ( not ( = ?auto_1122985 ?auto_1122987 ) ) ( not ( = ?auto_1122985 ?auto_1122988 ) ) ( not ( = ?auto_1122985 ?auto_1122989 ) ) ( not ( = ?auto_1122985 ?auto_1122990 ) ) ( not ( = ?auto_1122985 ?auto_1122991 ) ) ( not ( = ?auto_1122985 ?auto_1122994 ) ) ( not ( = ?auto_1122986 ?auto_1122987 ) ) ( not ( = ?auto_1122986 ?auto_1122988 ) ) ( not ( = ?auto_1122986 ?auto_1122989 ) ) ( not ( = ?auto_1122986 ?auto_1122990 ) ) ( not ( = ?auto_1122986 ?auto_1122991 ) ) ( not ( = ?auto_1122986 ?auto_1122994 ) ) ( not ( = ?auto_1122987 ?auto_1122988 ) ) ( not ( = ?auto_1122987 ?auto_1122989 ) ) ( not ( = ?auto_1122987 ?auto_1122990 ) ) ( not ( = ?auto_1122987 ?auto_1122991 ) ) ( not ( = ?auto_1122987 ?auto_1122994 ) ) ( not ( = ?auto_1122988 ?auto_1122989 ) ) ( not ( = ?auto_1122988 ?auto_1122990 ) ) ( not ( = ?auto_1122988 ?auto_1122991 ) ) ( not ( = ?auto_1122988 ?auto_1122994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1122989 ?auto_1122990 ?auto_1122991 )
      ( MAKE-9CRATE-VERIFY ?auto_1122982 ?auto_1122983 ?auto_1122984 ?auto_1122985 ?auto_1122986 ?auto_1122987 ?auto_1122988 ?auto_1122989 ?auto_1122990 ?auto_1122991 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1123091 - SURFACE
      ?auto_1123092 - SURFACE
      ?auto_1123093 - SURFACE
      ?auto_1123094 - SURFACE
      ?auto_1123095 - SURFACE
      ?auto_1123096 - SURFACE
      ?auto_1123097 - SURFACE
      ?auto_1123098 - SURFACE
      ?auto_1123099 - SURFACE
      ?auto_1123100 - SURFACE
    )
    :vars
    (
      ?auto_1123104 - HOIST
      ?auto_1123103 - PLACE
      ?auto_1123105 - PLACE
      ?auto_1123106 - HOIST
      ?auto_1123102 - SURFACE
      ?auto_1123101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1123104 ?auto_1123103 ) ( IS-CRATE ?auto_1123100 ) ( not ( = ?auto_1123099 ?auto_1123100 ) ) ( not ( = ?auto_1123098 ?auto_1123099 ) ) ( not ( = ?auto_1123098 ?auto_1123100 ) ) ( not ( = ?auto_1123105 ?auto_1123103 ) ) ( HOIST-AT ?auto_1123106 ?auto_1123105 ) ( not ( = ?auto_1123104 ?auto_1123106 ) ) ( AVAILABLE ?auto_1123106 ) ( SURFACE-AT ?auto_1123100 ?auto_1123105 ) ( ON ?auto_1123100 ?auto_1123102 ) ( CLEAR ?auto_1123100 ) ( not ( = ?auto_1123099 ?auto_1123102 ) ) ( not ( = ?auto_1123100 ?auto_1123102 ) ) ( not ( = ?auto_1123098 ?auto_1123102 ) ) ( TRUCK-AT ?auto_1123101 ?auto_1123103 ) ( SURFACE-AT ?auto_1123098 ?auto_1123103 ) ( CLEAR ?auto_1123098 ) ( IS-CRATE ?auto_1123099 ) ( AVAILABLE ?auto_1123104 ) ( IN ?auto_1123099 ?auto_1123101 ) ( ON ?auto_1123092 ?auto_1123091 ) ( ON ?auto_1123093 ?auto_1123092 ) ( ON ?auto_1123094 ?auto_1123093 ) ( ON ?auto_1123095 ?auto_1123094 ) ( ON ?auto_1123096 ?auto_1123095 ) ( ON ?auto_1123097 ?auto_1123096 ) ( ON ?auto_1123098 ?auto_1123097 ) ( not ( = ?auto_1123091 ?auto_1123092 ) ) ( not ( = ?auto_1123091 ?auto_1123093 ) ) ( not ( = ?auto_1123091 ?auto_1123094 ) ) ( not ( = ?auto_1123091 ?auto_1123095 ) ) ( not ( = ?auto_1123091 ?auto_1123096 ) ) ( not ( = ?auto_1123091 ?auto_1123097 ) ) ( not ( = ?auto_1123091 ?auto_1123098 ) ) ( not ( = ?auto_1123091 ?auto_1123099 ) ) ( not ( = ?auto_1123091 ?auto_1123100 ) ) ( not ( = ?auto_1123091 ?auto_1123102 ) ) ( not ( = ?auto_1123092 ?auto_1123093 ) ) ( not ( = ?auto_1123092 ?auto_1123094 ) ) ( not ( = ?auto_1123092 ?auto_1123095 ) ) ( not ( = ?auto_1123092 ?auto_1123096 ) ) ( not ( = ?auto_1123092 ?auto_1123097 ) ) ( not ( = ?auto_1123092 ?auto_1123098 ) ) ( not ( = ?auto_1123092 ?auto_1123099 ) ) ( not ( = ?auto_1123092 ?auto_1123100 ) ) ( not ( = ?auto_1123092 ?auto_1123102 ) ) ( not ( = ?auto_1123093 ?auto_1123094 ) ) ( not ( = ?auto_1123093 ?auto_1123095 ) ) ( not ( = ?auto_1123093 ?auto_1123096 ) ) ( not ( = ?auto_1123093 ?auto_1123097 ) ) ( not ( = ?auto_1123093 ?auto_1123098 ) ) ( not ( = ?auto_1123093 ?auto_1123099 ) ) ( not ( = ?auto_1123093 ?auto_1123100 ) ) ( not ( = ?auto_1123093 ?auto_1123102 ) ) ( not ( = ?auto_1123094 ?auto_1123095 ) ) ( not ( = ?auto_1123094 ?auto_1123096 ) ) ( not ( = ?auto_1123094 ?auto_1123097 ) ) ( not ( = ?auto_1123094 ?auto_1123098 ) ) ( not ( = ?auto_1123094 ?auto_1123099 ) ) ( not ( = ?auto_1123094 ?auto_1123100 ) ) ( not ( = ?auto_1123094 ?auto_1123102 ) ) ( not ( = ?auto_1123095 ?auto_1123096 ) ) ( not ( = ?auto_1123095 ?auto_1123097 ) ) ( not ( = ?auto_1123095 ?auto_1123098 ) ) ( not ( = ?auto_1123095 ?auto_1123099 ) ) ( not ( = ?auto_1123095 ?auto_1123100 ) ) ( not ( = ?auto_1123095 ?auto_1123102 ) ) ( not ( = ?auto_1123096 ?auto_1123097 ) ) ( not ( = ?auto_1123096 ?auto_1123098 ) ) ( not ( = ?auto_1123096 ?auto_1123099 ) ) ( not ( = ?auto_1123096 ?auto_1123100 ) ) ( not ( = ?auto_1123096 ?auto_1123102 ) ) ( not ( = ?auto_1123097 ?auto_1123098 ) ) ( not ( = ?auto_1123097 ?auto_1123099 ) ) ( not ( = ?auto_1123097 ?auto_1123100 ) ) ( not ( = ?auto_1123097 ?auto_1123102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1123098 ?auto_1123099 ?auto_1123100 )
      ( MAKE-9CRATE-VERIFY ?auto_1123091 ?auto_1123092 ?auto_1123093 ?auto_1123094 ?auto_1123095 ?auto_1123096 ?auto_1123097 ?auto_1123098 ?auto_1123099 ?auto_1123100 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1128656 - SURFACE
      ?auto_1128657 - SURFACE
      ?auto_1128658 - SURFACE
      ?auto_1128659 - SURFACE
      ?auto_1128660 - SURFACE
      ?auto_1128661 - SURFACE
      ?auto_1128662 - SURFACE
      ?auto_1128663 - SURFACE
      ?auto_1128664 - SURFACE
      ?auto_1128665 - SURFACE
      ?auto_1128666 - SURFACE
    )
    :vars
    (
      ?auto_1128668 - HOIST
      ?auto_1128667 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1128668 ?auto_1128667 ) ( SURFACE-AT ?auto_1128665 ?auto_1128667 ) ( CLEAR ?auto_1128665 ) ( LIFTING ?auto_1128668 ?auto_1128666 ) ( IS-CRATE ?auto_1128666 ) ( not ( = ?auto_1128665 ?auto_1128666 ) ) ( ON ?auto_1128657 ?auto_1128656 ) ( ON ?auto_1128658 ?auto_1128657 ) ( ON ?auto_1128659 ?auto_1128658 ) ( ON ?auto_1128660 ?auto_1128659 ) ( ON ?auto_1128661 ?auto_1128660 ) ( ON ?auto_1128662 ?auto_1128661 ) ( ON ?auto_1128663 ?auto_1128662 ) ( ON ?auto_1128664 ?auto_1128663 ) ( ON ?auto_1128665 ?auto_1128664 ) ( not ( = ?auto_1128656 ?auto_1128657 ) ) ( not ( = ?auto_1128656 ?auto_1128658 ) ) ( not ( = ?auto_1128656 ?auto_1128659 ) ) ( not ( = ?auto_1128656 ?auto_1128660 ) ) ( not ( = ?auto_1128656 ?auto_1128661 ) ) ( not ( = ?auto_1128656 ?auto_1128662 ) ) ( not ( = ?auto_1128656 ?auto_1128663 ) ) ( not ( = ?auto_1128656 ?auto_1128664 ) ) ( not ( = ?auto_1128656 ?auto_1128665 ) ) ( not ( = ?auto_1128656 ?auto_1128666 ) ) ( not ( = ?auto_1128657 ?auto_1128658 ) ) ( not ( = ?auto_1128657 ?auto_1128659 ) ) ( not ( = ?auto_1128657 ?auto_1128660 ) ) ( not ( = ?auto_1128657 ?auto_1128661 ) ) ( not ( = ?auto_1128657 ?auto_1128662 ) ) ( not ( = ?auto_1128657 ?auto_1128663 ) ) ( not ( = ?auto_1128657 ?auto_1128664 ) ) ( not ( = ?auto_1128657 ?auto_1128665 ) ) ( not ( = ?auto_1128657 ?auto_1128666 ) ) ( not ( = ?auto_1128658 ?auto_1128659 ) ) ( not ( = ?auto_1128658 ?auto_1128660 ) ) ( not ( = ?auto_1128658 ?auto_1128661 ) ) ( not ( = ?auto_1128658 ?auto_1128662 ) ) ( not ( = ?auto_1128658 ?auto_1128663 ) ) ( not ( = ?auto_1128658 ?auto_1128664 ) ) ( not ( = ?auto_1128658 ?auto_1128665 ) ) ( not ( = ?auto_1128658 ?auto_1128666 ) ) ( not ( = ?auto_1128659 ?auto_1128660 ) ) ( not ( = ?auto_1128659 ?auto_1128661 ) ) ( not ( = ?auto_1128659 ?auto_1128662 ) ) ( not ( = ?auto_1128659 ?auto_1128663 ) ) ( not ( = ?auto_1128659 ?auto_1128664 ) ) ( not ( = ?auto_1128659 ?auto_1128665 ) ) ( not ( = ?auto_1128659 ?auto_1128666 ) ) ( not ( = ?auto_1128660 ?auto_1128661 ) ) ( not ( = ?auto_1128660 ?auto_1128662 ) ) ( not ( = ?auto_1128660 ?auto_1128663 ) ) ( not ( = ?auto_1128660 ?auto_1128664 ) ) ( not ( = ?auto_1128660 ?auto_1128665 ) ) ( not ( = ?auto_1128660 ?auto_1128666 ) ) ( not ( = ?auto_1128661 ?auto_1128662 ) ) ( not ( = ?auto_1128661 ?auto_1128663 ) ) ( not ( = ?auto_1128661 ?auto_1128664 ) ) ( not ( = ?auto_1128661 ?auto_1128665 ) ) ( not ( = ?auto_1128661 ?auto_1128666 ) ) ( not ( = ?auto_1128662 ?auto_1128663 ) ) ( not ( = ?auto_1128662 ?auto_1128664 ) ) ( not ( = ?auto_1128662 ?auto_1128665 ) ) ( not ( = ?auto_1128662 ?auto_1128666 ) ) ( not ( = ?auto_1128663 ?auto_1128664 ) ) ( not ( = ?auto_1128663 ?auto_1128665 ) ) ( not ( = ?auto_1128663 ?auto_1128666 ) ) ( not ( = ?auto_1128664 ?auto_1128665 ) ) ( not ( = ?auto_1128664 ?auto_1128666 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1128665 ?auto_1128666 )
      ( MAKE-10CRATE-VERIFY ?auto_1128656 ?auto_1128657 ?auto_1128658 ?auto_1128659 ?auto_1128660 ?auto_1128661 ?auto_1128662 ?auto_1128663 ?auto_1128664 ?auto_1128665 ?auto_1128666 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1128750 - SURFACE
      ?auto_1128751 - SURFACE
      ?auto_1128752 - SURFACE
      ?auto_1128753 - SURFACE
      ?auto_1128754 - SURFACE
      ?auto_1128755 - SURFACE
      ?auto_1128756 - SURFACE
      ?auto_1128757 - SURFACE
      ?auto_1128758 - SURFACE
      ?auto_1128759 - SURFACE
      ?auto_1128760 - SURFACE
    )
    :vars
    (
      ?auto_1128763 - HOIST
      ?auto_1128762 - PLACE
      ?auto_1128761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1128763 ?auto_1128762 ) ( SURFACE-AT ?auto_1128759 ?auto_1128762 ) ( CLEAR ?auto_1128759 ) ( IS-CRATE ?auto_1128760 ) ( not ( = ?auto_1128759 ?auto_1128760 ) ) ( TRUCK-AT ?auto_1128761 ?auto_1128762 ) ( AVAILABLE ?auto_1128763 ) ( IN ?auto_1128760 ?auto_1128761 ) ( ON ?auto_1128759 ?auto_1128758 ) ( not ( = ?auto_1128758 ?auto_1128759 ) ) ( not ( = ?auto_1128758 ?auto_1128760 ) ) ( ON ?auto_1128751 ?auto_1128750 ) ( ON ?auto_1128752 ?auto_1128751 ) ( ON ?auto_1128753 ?auto_1128752 ) ( ON ?auto_1128754 ?auto_1128753 ) ( ON ?auto_1128755 ?auto_1128754 ) ( ON ?auto_1128756 ?auto_1128755 ) ( ON ?auto_1128757 ?auto_1128756 ) ( ON ?auto_1128758 ?auto_1128757 ) ( not ( = ?auto_1128750 ?auto_1128751 ) ) ( not ( = ?auto_1128750 ?auto_1128752 ) ) ( not ( = ?auto_1128750 ?auto_1128753 ) ) ( not ( = ?auto_1128750 ?auto_1128754 ) ) ( not ( = ?auto_1128750 ?auto_1128755 ) ) ( not ( = ?auto_1128750 ?auto_1128756 ) ) ( not ( = ?auto_1128750 ?auto_1128757 ) ) ( not ( = ?auto_1128750 ?auto_1128758 ) ) ( not ( = ?auto_1128750 ?auto_1128759 ) ) ( not ( = ?auto_1128750 ?auto_1128760 ) ) ( not ( = ?auto_1128751 ?auto_1128752 ) ) ( not ( = ?auto_1128751 ?auto_1128753 ) ) ( not ( = ?auto_1128751 ?auto_1128754 ) ) ( not ( = ?auto_1128751 ?auto_1128755 ) ) ( not ( = ?auto_1128751 ?auto_1128756 ) ) ( not ( = ?auto_1128751 ?auto_1128757 ) ) ( not ( = ?auto_1128751 ?auto_1128758 ) ) ( not ( = ?auto_1128751 ?auto_1128759 ) ) ( not ( = ?auto_1128751 ?auto_1128760 ) ) ( not ( = ?auto_1128752 ?auto_1128753 ) ) ( not ( = ?auto_1128752 ?auto_1128754 ) ) ( not ( = ?auto_1128752 ?auto_1128755 ) ) ( not ( = ?auto_1128752 ?auto_1128756 ) ) ( not ( = ?auto_1128752 ?auto_1128757 ) ) ( not ( = ?auto_1128752 ?auto_1128758 ) ) ( not ( = ?auto_1128752 ?auto_1128759 ) ) ( not ( = ?auto_1128752 ?auto_1128760 ) ) ( not ( = ?auto_1128753 ?auto_1128754 ) ) ( not ( = ?auto_1128753 ?auto_1128755 ) ) ( not ( = ?auto_1128753 ?auto_1128756 ) ) ( not ( = ?auto_1128753 ?auto_1128757 ) ) ( not ( = ?auto_1128753 ?auto_1128758 ) ) ( not ( = ?auto_1128753 ?auto_1128759 ) ) ( not ( = ?auto_1128753 ?auto_1128760 ) ) ( not ( = ?auto_1128754 ?auto_1128755 ) ) ( not ( = ?auto_1128754 ?auto_1128756 ) ) ( not ( = ?auto_1128754 ?auto_1128757 ) ) ( not ( = ?auto_1128754 ?auto_1128758 ) ) ( not ( = ?auto_1128754 ?auto_1128759 ) ) ( not ( = ?auto_1128754 ?auto_1128760 ) ) ( not ( = ?auto_1128755 ?auto_1128756 ) ) ( not ( = ?auto_1128755 ?auto_1128757 ) ) ( not ( = ?auto_1128755 ?auto_1128758 ) ) ( not ( = ?auto_1128755 ?auto_1128759 ) ) ( not ( = ?auto_1128755 ?auto_1128760 ) ) ( not ( = ?auto_1128756 ?auto_1128757 ) ) ( not ( = ?auto_1128756 ?auto_1128758 ) ) ( not ( = ?auto_1128756 ?auto_1128759 ) ) ( not ( = ?auto_1128756 ?auto_1128760 ) ) ( not ( = ?auto_1128757 ?auto_1128758 ) ) ( not ( = ?auto_1128757 ?auto_1128759 ) ) ( not ( = ?auto_1128757 ?auto_1128760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1128758 ?auto_1128759 ?auto_1128760 )
      ( MAKE-10CRATE-VERIFY ?auto_1128750 ?auto_1128751 ?auto_1128752 ?auto_1128753 ?auto_1128754 ?auto_1128755 ?auto_1128756 ?auto_1128757 ?auto_1128758 ?auto_1128759 ?auto_1128760 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1128855 - SURFACE
      ?auto_1128856 - SURFACE
      ?auto_1128857 - SURFACE
      ?auto_1128858 - SURFACE
      ?auto_1128859 - SURFACE
      ?auto_1128860 - SURFACE
      ?auto_1128861 - SURFACE
      ?auto_1128862 - SURFACE
      ?auto_1128863 - SURFACE
      ?auto_1128864 - SURFACE
      ?auto_1128865 - SURFACE
    )
    :vars
    (
      ?auto_1128866 - HOIST
      ?auto_1128867 - PLACE
      ?auto_1128869 - TRUCK
      ?auto_1128868 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1128866 ?auto_1128867 ) ( SURFACE-AT ?auto_1128864 ?auto_1128867 ) ( CLEAR ?auto_1128864 ) ( IS-CRATE ?auto_1128865 ) ( not ( = ?auto_1128864 ?auto_1128865 ) ) ( AVAILABLE ?auto_1128866 ) ( IN ?auto_1128865 ?auto_1128869 ) ( ON ?auto_1128864 ?auto_1128863 ) ( not ( = ?auto_1128863 ?auto_1128864 ) ) ( not ( = ?auto_1128863 ?auto_1128865 ) ) ( TRUCK-AT ?auto_1128869 ?auto_1128868 ) ( not ( = ?auto_1128868 ?auto_1128867 ) ) ( ON ?auto_1128856 ?auto_1128855 ) ( ON ?auto_1128857 ?auto_1128856 ) ( ON ?auto_1128858 ?auto_1128857 ) ( ON ?auto_1128859 ?auto_1128858 ) ( ON ?auto_1128860 ?auto_1128859 ) ( ON ?auto_1128861 ?auto_1128860 ) ( ON ?auto_1128862 ?auto_1128861 ) ( ON ?auto_1128863 ?auto_1128862 ) ( not ( = ?auto_1128855 ?auto_1128856 ) ) ( not ( = ?auto_1128855 ?auto_1128857 ) ) ( not ( = ?auto_1128855 ?auto_1128858 ) ) ( not ( = ?auto_1128855 ?auto_1128859 ) ) ( not ( = ?auto_1128855 ?auto_1128860 ) ) ( not ( = ?auto_1128855 ?auto_1128861 ) ) ( not ( = ?auto_1128855 ?auto_1128862 ) ) ( not ( = ?auto_1128855 ?auto_1128863 ) ) ( not ( = ?auto_1128855 ?auto_1128864 ) ) ( not ( = ?auto_1128855 ?auto_1128865 ) ) ( not ( = ?auto_1128856 ?auto_1128857 ) ) ( not ( = ?auto_1128856 ?auto_1128858 ) ) ( not ( = ?auto_1128856 ?auto_1128859 ) ) ( not ( = ?auto_1128856 ?auto_1128860 ) ) ( not ( = ?auto_1128856 ?auto_1128861 ) ) ( not ( = ?auto_1128856 ?auto_1128862 ) ) ( not ( = ?auto_1128856 ?auto_1128863 ) ) ( not ( = ?auto_1128856 ?auto_1128864 ) ) ( not ( = ?auto_1128856 ?auto_1128865 ) ) ( not ( = ?auto_1128857 ?auto_1128858 ) ) ( not ( = ?auto_1128857 ?auto_1128859 ) ) ( not ( = ?auto_1128857 ?auto_1128860 ) ) ( not ( = ?auto_1128857 ?auto_1128861 ) ) ( not ( = ?auto_1128857 ?auto_1128862 ) ) ( not ( = ?auto_1128857 ?auto_1128863 ) ) ( not ( = ?auto_1128857 ?auto_1128864 ) ) ( not ( = ?auto_1128857 ?auto_1128865 ) ) ( not ( = ?auto_1128858 ?auto_1128859 ) ) ( not ( = ?auto_1128858 ?auto_1128860 ) ) ( not ( = ?auto_1128858 ?auto_1128861 ) ) ( not ( = ?auto_1128858 ?auto_1128862 ) ) ( not ( = ?auto_1128858 ?auto_1128863 ) ) ( not ( = ?auto_1128858 ?auto_1128864 ) ) ( not ( = ?auto_1128858 ?auto_1128865 ) ) ( not ( = ?auto_1128859 ?auto_1128860 ) ) ( not ( = ?auto_1128859 ?auto_1128861 ) ) ( not ( = ?auto_1128859 ?auto_1128862 ) ) ( not ( = ?auto_1128859 ?auto_1128863 ) ) ( not ( = ?auto_1128859 ?auto_1128864 ) ) ( not ( = ?auto_1128859 ?auto_1128865 ) ) ( not ( = ?auto_1128860 ?auto_1128861 ) ) ( not ( = ?auto_1128860 ?auto_1128862 ) ) ( not ( = ?auto_1128860 ?auto_1128863 ) ) ( not ( = ?auto_1128860 ?auto_1128864 ) ) ( not ( = ?auto_1128860 ?auto_1128865 ) ) ( not ( = ?auto_1128861 ?auto_1128862 ) ) ( not ( = ?auto_1128861 ?auto_1128863 ) ) ( not ( = ?auto_1128861 ?auto_1128864 ) ) ( not ( = ?auto_1128861 ?auto_1128865 ) ) ( not ( = ?auto_1128862 ?auto_1128863 ) ) ( not ( = ?auto_1128862 ?auto_1128864 ) ) ( not ( = ?auto_1128862 ?auto_1128865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1128863 ?auto_1128864 ?auto_1128865 )
      ( MAKE-10CRATE-VERIFY ?auto_1128855 ?auto_1128856 ?auto_1128857 ?auto_1128858 ?auto_1128859 ?auto_1128860 ?auto_1128861 ?auto_1128862 ?auto_1128863 ?auto_1128864 ?auto_1128865 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1128970 - SURFACE
      ?auto_1128971 - SURFACE
      ?auto_1128972 - SURFACE
      ?auto_1128973 - SURFACE
      ?auto_1128974 - SURFACE
      ?auto_1128975 - SURFACE
      ?auto_1128976 - SURFACE
      ?auto_1128977 - SURFACE
      ?auto_1128978 - SURFACE
      ?auto_1128979 - SURFACE
      ?auto_1128980 - SURFACE
    )
    :vars
    (
      ?auto_1128984 - HOIST
      ?auto_1128983 - PLACE
      ?auto_1128981 - TRUCK
      ?auto_1128985 - PLACE
      ?auto_1128982 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1128984 ?auto_1128983 ) ( SURFACE-AT ?auto_1128979 ?auto_1128983 ) ( CLEAR ?auto_1128979 ) ( IS-CRATE ?auto_1128980 ) ( not ( = ?auto_1128979 ?auto_1128980 ) ) ( AVAILABLE ?auto_1128984 ) ( ON ?auto_1128979 ?auto_1128978 ) ( not ( = ?auto_1128978 ?auto_1128979 ) ) ( not ( = ?auto_1128978 ?auto_1128980 ) ) ( TRUCK-AT ?auto_1128981 ?auto_1128985 ) ( not ( = ?auto_1128985 ?auto_1128983 ) ) ( HOIST-AT ?auto_1128982 ?auto_1128985 ) ( LIFTING ?auto_1128982 ?auto_1128980 ) ( not ( = ?auto_1128984 ?auto_1128982 ) ) ( ON ?auto_1128971 ?auto_1128970 ) ( ON ?auto_1128972 ?auto_1128971 ) ( ON ?auto_1128973 ?auto_1128972 ) ( ON ?auto_1128974 ?auto_1128973 ) ( ON ?auto_1128975 ?auto_1128974 ) ( ON ?auto_1128976 ?auto_1128975 ) ( ON ?auto_1128977 ?auto_1128976 ) ( ON ?auto_1128978 ?auto_1128977 ) ( not ( = ?auto_1128970 ?auto_1128971 ) ) ( not ( = ?auto_1128970 ?auto_1128972 ) ) ( not ( = ?auto_1128970 ?auto_1128973 ) ) ( not ( = ?auto_1128970 ?auto_1128974 ) ) ( not ( = ?auto_1128970 ?auto_1128975 ) ) ( not ( = ?auto_1128970 ?auto_1128976 ) ) ( not ( = ?auto_1128970 ?auto_1128977 ) ) ( not ( = ?auto_1128970 ?auto_1128978 ) ) ( not ( = ?auto_1128970 ?auto_1128979 ) ) ( not ( = ?auto_1128970 ?auto_1128980 ) ) ( not ( = ?auto_1128971 ?auto_1128972 ) ) ( not ( = ?auto_1128971 ?auto_1128973 ) ) ( not ( = ?auto_1128971 ?auto_1128974 ) ) ( not ( = ?auto_1128971 ?auto_1128975 ) ) ( not ( = ?auto_1128971 ?auto_1128976 ) ) ( not ( = ?auto_1128971 ?auto_1128977 ) ) ( not ( = ?auto_1128971 ?auto_1128978 ) ) ( not ( = ?auto_1128971 ?auto_1128979 ) ) ( not ( = ?auto_1128971 ?auto_1128980 ) ) ( not ( = ?auto_1128972 ?auto_1128973 ) ) ( not ( = ?auto_1128972 ?auto_1128974 ) ) ( not ( = ?auto_1128972 ?auto_1128975 ) ) ( not ( = ?auto_1128972 ?auto_1128976 ) ) ( not ( = ?auto_1128972 ?auto_1128977 ) ) ( not ( = ?auto_1128972 ?auto_1128978 ) ) ( not ( = ?auto_1128972 ?auto_1128979 ) ) ( not ( = ?auto_1128972 ?auto_1128980 ) ) ( not ( = ?auto_1128973 ?auto_1128974 ) ) ( not ( = ?auto_1128973 ?auto_1128975 ) ) ( not ( = ?auto_1128973 ?auto_1128976 ) ) ( not ( = ?auto_1128973 ?auto_1128977 ) ) ( not ( = ?auto_1128973 ?auto_1128978 ) ) ( not ( = ?auto_1128973 ?auto_1128979 ) ) ( not ( = ?auto_1128973 ?auto_1128980 ) ) ( not ( = ?auto_1128974 ?auto_1128975 ) ) ( not ( = ?auto_1128974 ?auto_1128976 ) ) ( not ( = ?auto_1128974 ?auto_1128977 ) ) ( not ( = ?auto_1128974 ?auto_1128978 ) ) ( not ( = ?auto_1128974 ?auto_1128979 ) ) ( not ( = ?auto_1128974 ?auto_1128980 ) ) ( not ( = ?auto_1128975 ?auto_1128976 ) ) ( not ( = ?auto_1128975 ?auto_1128977 ) ) ( not ( = ?auto_1128975 ?auto_1128978 ) ) ( not ( = ?auto_1128975 ?auto_1128979 ) ) ( not ( = ?auto_1128975 ?auto_1128980 ) ) ( not ( = ?auto_1128976 ?auto_1128977 ) ) ( not ( = ?auto_1128976 ?auto_1128978 ) ) ( not ( = ?auto_1128976 ?auto_1128979 ) ) ( not ( = ?auto_1128976 ?auto_1128980 ) ) ( not ( = ?auto_1128977 ?auto_1128978 ) ) ( not ( = ?auto_1128977 ?auto_1128979 ) ) ( not ( = ?auto_1128977 ?auto_1128980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1128978 ?auto_1128979 ?auto_1128980 )
      ( MAKE-10CRATE-VERIFY ?auto_1128970 ?auto_1128971 ?auto_1128972 ?auto_1128973 ?auto_1128974 ?auto_1128975 ?auto_1128976 ?auto_1128977 ?auto_1128978 ?auto_1128979 ?auto_1128980 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1129095 - SURFACE
      ?auto_1129096 - SURFACE
      ?auto_1129097 - SURFACE
      ?auto_1129098 - SURFACE
      ?auto_1129099 - SURFACE
      ?auto_1129100 - SURFACE
      ?auto_1129101 - SURFACE
      ?auto_1129102 - SURFACE
      ?auto_1129103 - SURFACE
      ?auto_1129104 - SURFACE
      ?auto_1129105 - SURFACE
    )
    :vars
    (
      ?auto_1129111 - HOIST
      ?auto_1129107 - PLACE
      ?auto_1129108 - TRUCK
      ?auto_1129110 - PLACE
      ?auto_1129106 - HOIST
      ?auto_1129109 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129111 ?auto_1129107 ) ( SURFACE-AT ?auto_1129104 ?auto_1129107 ) ( CLEAR ?auto_1129104 ) ( IS-CRATE ?auto_1129105 ) ( not ( = ?auto_1129104 ?auto_1129105 ) ) ( AVAILABLE ?auto_1129111 ) ( ON ?auto_1129104 ?auto_1129103 ) ( not ( = ?auto_1129103 ?auto_1129104 ) ) ( not ( = ?auto_1129103 ?auto_1129105 ) ) ( TRUCK-AT ?auto_1129108 ?auto_1129110 ) ( not ( = ?auto_1129110 ?auto_1129107 ) ) ( HOIST-AT ?auto_1129106 ?auto_1129110 ) ( not ( = ?auto_1129111 ?auto_1129106 ) ) ( AVAILABLE ?auto_1129106 ) ( SURFACE-AT ?auto_1129105 ?auto_1129110 ) ( ON ?auto_1129105 ?auto_1129109 ) ( CLEAR ?auto_1129105 ) ( not ( = ?auto_1129104 ?auto_1129109 ) ) ( not ( = ?auto_1129105 ?auto_1129109 ) ) ( not ( = ?auto_1129103 ?auto_1129109 ) ) ( ON ?auto_1129096 ?auto_1129095 ) ( ON ?auto_1129097 ?auto_1129096 ) ( ON ?auto_1129098 ?auto_1129097 ) ( ON ?auto_1129099 ?auto_1129098 ) ( ON ?auto_1129100 ?auto_1129099 ) ( ON ?auto_1129101 ?auto_1129100 ) ( ON ?auto_1129102 ?auto_1129101 ) ( ON ?auto_1129103 ?auto_1129102 ) ( not ( = ?auto_1129095 ?auto_1129096 ) ) ( not ( = ?auto_1129095 ?auto_1129097 ) ) ( not ( = ?auto_1129095 ?auto_1129098 ) ) ( not ( = ?auto_1129095 ?auto_1129099 ) ) ( not ( = ?auto_1129095 ?auto_1129100 ) ) ( not ( = ?auto_1129095 ?auto_1129101 ) ) ( not ( = ?auto_1129095 ?auto_1129102 ) ) ( not ( = ?auto_1129095 ?auto_1129103 ) ) ( not ( = ?auto_1129095 ?auto_1129104 ) ) ( not ( = ?auto_1129095 ?auto_1129105 ) ) ( not ( = ?auto_1129095 ?auto_1129109 ) ) ( not ( = ?auto_1129096 ?auto_1129097 ) ) ( not ( = ?auto_1129096 ?auto_1129098 ) ) ( not ( = ?auto_1129096 ?auto_1129099 ) ) ( not ( = ?auto_1129096 ?auto_1129100 ) ) ( not ( = ?auto_1129096 ?auto_1129101 ) ) ( not ( = ?auto_1129096 ?auto_1129102 ) ) ( not ( = ?auto_1129096 ?auto_1129103 ) ) ( not ( = ?auto_1129096 ?auto_1129104 ) ) ( not ( = ?auto_1129096 ?auto_1129105 ) ) ( not ( = ?auto_1129096 ?auto_1129109 ) ) ( not ( = ?auto_1129097 ?auto_1129098 ) ) ( not ( = ?auto_1129097 ?auto_1129099 ) ) ( not ( = ?auto_1129097 ?auto_1129100 ) ) ( not ( = ?auto_1129097 ?auto_1129101 ) ) ( not ( = ?auto_1129097 ?auto_1129102 ) ) ( not ( = ?auto_1129097 ?auto_1129103 ) ) ( not ( = ?auto_1129097 ?auto_1129104 ) ) ( not ( = ?auto_1129097 ?auto_1129105 ) ) ( not ( = ?auto_1129097 ?auto_1129109 ) ) ( not ( = ?auto_1129098 ?auto_1129099 ) ) ( not ( = ?auto_1129098 ?auto_1129100 ) ) ( not ( = ?auto_1129098 ?auto_1129101 ) ) ( not ( = ?auto_1129098 ?auto_1129102 ) ) ( not ( = ?auto_1129098 ?auto_1129103 ) ) ( not ( = ?auto_1129098 ?auto_1129104 ) ) ( not ( = ?auto_1129098 ?auto_1129105 ) ) ( not ( = ?auto_1129098 ?auto_1129109 ) ) ( not ( = ?auto_1129099 ?auto_1129100 ) ) ( not ( = ?auto_1129099 ?auto_1129101 ) ) ( not ( = ?auto_1129099 ?auto_1129102 ) ) ( not ( = ?auto_1129099 ?auto_1129103 ) ) ( not ( = ?auto_1129099 ?auto_1129104 ) ) ( not ( = ?auto_1129099 ?auto_1129105 ) ) ( not ( = ?auto_1129099 ?auto_1129109 ) ) ( not ( = ?auto_1129100 ?auto_1129101 ) ) ( not ( = ?auto_1129100 ?auto_1129102 ) ) ( not ( = ?auto_1129100 ?auto_1129103 ) ) ( not ( = ?auto_1129100 ?auto_1129104 ) ) ( not ( = ?auto_1129100 ?auto_1129105 ) ) ( not ( = ?auto_1129100 ?auto_1129109 ) ) ( not ( = ?auto_1129101 ?auto_1129102 ) ) ( not ( = ?auto_1129101 ?auto_1129103 ) ) ( not ( = ?auto_1129101 ?auto_1129104 ) ) ( not ( = ?auto_1129101 ?auto_1129105 ) ) ( not ( = ?auto_1129101 ?auto_1129109 ) ) ( not ( = ?auto_1129102 ?auto_1129103 ) ) ( not ( = ?auto_1129102 ?auto_1129104 ) ) ( not ( = ?auto_1129102 ?auto_1129105 ) ) ( not ( = ?auto_1129102 ?auto_1129109 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129103 ?auto_1129104 ?auto_1129105 )
      ( MAKE-10CRATE-VERIFY ?auto_1129095 ?auto_1129096 ?auto_1129097 ?auto_1129098 ?auto_1129099 ?auto_1129100 ?auto_1129101 ?auto_1129102 ?auto_1129103 ?auto_1129104 ?auto_1129105 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1129221 - SURFACE
      ?auto_1129222 - SURFACE
      ?auto_1129223 - SURFACE
      ?auto_1129224 - SURFACE
      ?auto_1129225 - SURFACE
      ?auto_1129226 - SURFACE
      ?auto_1129227 - SURFACE
      ?auto_1129228 - SURFACE
      ?auto_1129229 - SURFACE
      ?auto_1129230 - SURFACE
      ?auto_1129231 - SURFACE
    )
    :vars
    (
      ?auto_1129235 - HOIST
      ?auto_1129233 - PLACE
      ?auto_1129232 - PLACE
      ?auto_1129234 - HOIST
      ?auto_1129236 - SURFACE
      ?auto_1129237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129235 ?auto_1129233 ) ( SURFACE-AT ?auto_1129230 ?auto_1129233 ) ( CLEAR ?auto_1129230 ) ( IS-CRATE ?auto_1129231 ) ( not ( = ?auto_1129230 ?auto_1129231 ) ) ( AVAILABLE ?auto_1129235 ) ( ON ?auto_1129230 ?auto_1129229 ) ( not ( = ?auto_1129229 ?auto_1129230 ) ) ( not ( = ?auto_1129229 ?auto_1129231 ) ) ( not ( = ?auto_1129232 ?auto_1129233 ) ) ( HOIST-AT ?auto_1129234 ?auto_1129232 ) ( not ( = ?auto_1129235 ?auto_1129234 ) ) ( AVAILABLE ?auto_1129234 ) ( SURFACE-AT ?auto_1129231 ?auto_1129232 ) ( ON ?auto_1129231 ?auto_1129236 ) ( CLEAR ?auto_1129231 ) ( not ( = ?auto_1129230 ?auto_1129236 ) ) ( not ( = ?auto_1129231 ?auto_1129236 ) ) ( not ( = ?auto_1129229 ?auto_1129236 ) ) ( TRUCK-AT ?auto_1129237 ?auto_1129233 ) ( ON ?auto_1129222 ?auto_1129221 ) ( ON ?auto_1129223 ?auto_1129222 ) ( ON ?auto_1129224 ?auto_1129223 ) ( ON ?auto_1129225 ?auto_1129224 ) ( ON ?auto_1129226 ?auto_1129225 ) ( ON ?auto_1129227 ?auto_1129226 ) ( ON ?auto_1129228 ?auto_1129227 ) ( ON ?auto_1129229 ?auto_1129228 ) ( not ( = ?auto_1129221 ?auto_1129222 ) ) ( not ( = ?auto_1129221 ?auto_1129223 ) ) ( not ( = ?auto_1129221 ?auto_1129224 ) ) ( not ( = ?auto_1129221 ?auto_1129225 ) ) ( not ( = ?auto_1129221 ?auto_1129226 ) ) ( not ( = ?auto_1129221 ?auto_1129227 ) ) ( not ( = ?auto_1129221 ?auto_1129228 ) ) ( not ( = ?auto_1129221 ?auto_1129229 ) ) ( not ( = ?auto_1129221 ?auto_1129230 ) ) ( not ( = ?auto_1129221 ?auto_1129231 ) ) ( not ( = ?auto_1129221 ?auto_1129236 ) ) ( not ( = ?auto_1129222 ?auto_1129223 ) ) ( not ( = ?auto_1129222 ?auto_1129224 ) ) ( not ( = ?auto_1129222 ?auto_1129225 ) ) ( not ( = ?auto_1129222 ?auto_1129226 ) ) ( not ( = ?auto_1129222 ?auto_1129227 ) ) ( not ( = ?auto_1129222 ?auto_1129228 ) ) ( not ( = ?auto_1129222 ?auto_1129229 ) ) ( not ( = ?auto_1129222 ?auto_1129230 ) ) ( not ( = ?auto_1129222 ?auto_1129231 ) ) ( not ( = ?auto_1129222 ?auto_1129236 ) ) ( not ( = ?auto_1129223 ?auto_1129224 ) ) ( not ( = ?auto_1129223 ?auto_1129225 ) ) ( not ( = ?auto_1129223 ?auto_1129226 ) ) ( not ( = ?auto_1129223 ?auto_1129227 ) ) ( not ( = ?auto_1129223 ?auto_1129228 ) ) ( not ( = ?auto_1129223 ?auto_1129229 ) ) ( not ( = ?auto_1129223 ?auto_1129230 ) ) ( not ( = ?auto_1129223 ?auto_1129231 ) ) ( not ( = ?auto_1129223 ?auto_1129236 ) ) ( not ( = ?auto_1129224 ?auto_1129225 ) ) ( not ( = ?auto_1129224 ?auto_1129226 ) ) ( not ( = ?auto_1129224 ?auto_1129227 ) ) ( not ( = ?auto_1129224 ?auto_1129228 ) ) ( not ( = ?auto_1129224 ?auto_1129229 ) ) ( not ( = ?auto_1129224 ?auto_1129230 ) ) ( not ( = ?auto_1129224 ?auto_1129231 ) ) ( not ( = ?auto_1129224 ?auto_1129236 ) ) ( not ( = ?auto_1129225 ?auto_1129226 ) ) ( not ( = ?auto_1129225 ?auto_1129227 ) ) ( not ( = ?auto_1129225 ?auto_1129228 ) ) ( not ( = ?auto_1129225 ?auto_1129229 ) ) ( not ( = ?auto_1129225 ?auto_1129230 ) ) ( not ( = ?auto_1129225 ?auto_1129231 ) ) ( not ( = ?auto_1129225 ?auto_1129236 ) ) ( not ( = ?auto_1129226 ?auto_1129227 ) ) ( not ( = ?auto_1129226 ?auto_1129228 ) ) ( not ( = ?auto_1129226 ?auto_1129229 ) ) ( not ( = ?auto_1129226 ?auto_1129230 ) ) ( not ( = ?auto_1129226 ?auto_1129231 ) ) ( not ( = ?auto_1129226 ?auto_1129236 ) ) ( not ( = ?auto_1129227 ?auto_1129228 ) ) ( not ( = ?auto_1129227 ?auto_1129229 ) ) ( not ( = ?auto_1129227 ?auto_1129230 ) ) ( not ( = ?auto_1129227 ?auto_1129231 ) ) ( not ( = ?auto_1129227 ?auto_1129236 ) ) ( not ( = ?auto_1129228 ?auto_1129229 ) ) ( not ( = ?auto_1129228 ?auto_1129230 ) ) ( not ( = ?auto_1129228 ?auto_1129231 ) ) ( not ( = ?auto_1129228 ?auto_1129236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129229 ?auto_1129230 ?auto_1129231 )
      ( MAKE-10CRATE-VERIFY ?auto_1129221 ?auto_1129222 ?auto_1129223 ?auto_1129224 ?auto_1129225 ?auto_1129226 ?auto_1129227 ?auto_1129228 ?auto_1129229 ?auto_1129230 ?auto_1129231 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1129347 - SURFACE
      ?auto_1129348 - SURFACE
      ?auto_1129349 - SURFACE
      ?auto_1129350 - SURFACE
      ?auto_1129351 - SURFACE
      ?auto_1129352 - SURFACE
      ?auto_1129353 - SURFACE
      ?auto_1129354 - SURFACE
      ?auto_1129355 - SURFACE
      ?auto_1129356 - SURFACE
      ?auto_1129357 - SURFACE
    )
    :vars
    (
      ?auto_1129362 - HOIST
      ?auto_1129359 - PLACE
      ?auto_1129361 - PLACE
      ?auto_1129360 - HOIST
      ?auto_1129358 - SURFACE
      ?auto_1129363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129362 ?auto_1129359 ) ( IS-CRATE ?auto_1129357 ) ( not ( = ?auto_1129356 ?auto_1129357 ) ) ( not ( = ?auto_1129355 ?auto_1129356 ) ) ( not ( = ?auto_1129355 ?auto_1129357 ) ) ( not ( = ?auto_1129361 ?auto_1129359 ) ) ( HOIST-AT ?auto_1129360 ?auto_1129361 ) ( not ( = ?auto_1129362 ?auto_1129360 ) ) ( AVAILABLE ?auto_1129360 ) ( SURFACE-AT ?auto_1129357 ?auto_1129361 ) ( ON ?auto_1129357 ?auto_1129358 ) ( CLEAR ?auto_1129357 ) ( not ( = ?auto_1129356 ?auto_1129358 ) ) ( not ( = ?auto_1129357 ?auto_1129358 ) ) ( not ( = ?auto_1129355 ?auto_1129358 ) ) ( TRUCK-AT ?auto_1129363 ?auto_1129359 ) ( SURFACE-AT ?auto_1129355 ?auto_1129359 ) ( CLEAR ?auto_1129355 ) ( LIFTING ?auto_1129362 ?auto_1129356 ) ( IS-CRATE ?auto_1129356 ) ( ON ?auto_1129348 ?auto_1129347 ) ( ON ?auto_1129349 ?auto_1129348 ) ( ON ?auto_1129350 ?auto_1129349 ) ( ON ?auto_1129351 ?auto_1129350 ) ( ON ?auto_1129352 ?auto_1129351 ) ( ON ?auto_1129353 ?auto_1129352 ) ( ON ?auto_1129354 ?auto_1129353 ) ( ON ?auto_1129355 ?auto_1129354 ) ( not ( = ?auto_1129347 ?auto_1129348 ) ) ( not ( = ?auto_1129347 ?auto_1129349 ) ) ( not ( = ?auto_1129347 ?auto_1129350 ) ) ( not ( = ?auto_1129347 ?auto_1129351 ) ) ( not ( = ?auto_1129347 ?auto_1129352 ) ) ( not ( = ?auto_1129347 ?auto_1129353 ) ) ( not ( = ?auto_1129347 ?auto_1129354 ) ) ( not ( = ?auto_1129347 ?auto_1129355 ) ) ( not ( = ?auto_1129347 ?auto_1129356 ) ) ( not ( = ?auto_1129347 ?auto_1129357 ) ) ( not ( = ?auto_1129347 ?auto_1129358 ) ) ( not ( = ?auto_1129348 ?auto_1129349 ) ) ( not ( = ?auto_1129348 ?auto_1129350 ) ) ( not ( = ?auto_1129348 ?auto_1129351 ) ) ( not ( = ?auto_1129348 ?auto_1129352 ) ) ( not ( = ?auto_1129348 ?auto_1129353 ) ) ( not ( = ?auto_1129348 ?auto_1129354 ) ) ( not ( = ?auto_1129348 ?auto_1129355 ) ) ( not ( = ?auto_1129348 ?auto_1129356 ) ) ( not ( = ?auto_1129348 ?auto_1129357 ) ) ( not ( = ?auto_1129348 ?auto_1129358 ) ) ( not ( = ?auto_1129349 ?auto_1129350 ) ) ( not ( = ?auto_1129349 ?auto_1129351 ) ) ( not ( = ?auto_1129349 ?auto_1129352 ) ) ( not ( = ?auto_1129349 ?auto_1129353 ) ) ( not ( = ?auto_1129349 ?auto_1129354 ) ) ( not ( = ?auto_1129349 ?auto_1129355 ) ) ( not ( = ?auto_1129349 ?auto_1129356 ) ) ( not ( = ?auto_1129349 ?auto_1129357 ) ) ( not ( = ?auto_1129349 ?auto_1129358 ) ) ( not ( = ?auto_1129350 ?auto_1129351 ) ) ( not ( = ?auto_1129350 ?auto_1129352 ) ) ( not ( = ?auto_1129350 ?auto_1129353 ) ) ( not ( = ?auto_1129350 ?auto_1129354 ) ) ( not ( = ?auto_1129350 ?auto_1129355 ) ) ( not ( = ?auto_1129350 ?auto_1129356 ) ) ( not ( = ?auto_1129350 ?auto_1129357 ) ) ( not ( = ?auto_1129350 ?auto_1129358 ) ) ( not ( = ?auto_1129351 ?auto_1129352 ) ) ( not ( = ?auto_1129351 ?auto_1129353 ) ) ( not ( = ?auto_1129351 ?auto_1129354 ) ) ( not ( = ?auto_1129351 ?auto_1129355 ) ) ( not ( = ?auto_1129351 ?auto_1129356 ) ) ( not ( = ?auto_1129351 ?auto_1129357 ) ) ( not ( = ?auto_1129351 ?auto_1129358 ) ) ( not ( = ?auto_1129352 ?auto_1129353 ) ) ( not ( = ?auto_1129352 ?auto_1129354 ) ) ( not ( = ?auto_1129352 ?auto_1129355 ) ) ( not ( = ?auto_1129352 ?auto_1129356 ) ) ( not ( = ?auto_1129352 ?auto_1129357 ) ) ( not ( = ?auto_1129352 ?auto_1129358 ) ) ( not ( = ?auto_1129353 ?auto_1129354 ) ) ( not ( = ?auto_1129353 ?auto_1129355 ) ) ( not ( = ?auto_1129353 ?auto_1129356 ) ) ( not ( = ?auto_1129353 ?auto_1129357 ) ) ( not ( = ?auto_1129353 ?auto_1129358 ) ) ( not ( = ?auto_1129354 ?auto_1129355 ) ) ( not ( = ?auto_1129354 ?auto_1129356 ) ) ( not ( = ?auto_1129354 ?auto_1129357 ) ) ( not ( = ?auto_1129354 ?auto_1129358 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129355 ?auto_1129356 ?auto_1129357 )
      ( MAKE-10CRATE-VERIFY ?auto_1129347 ?auto_1129348 ?auto_1129349 ?auto_1129350 ?auto_1129351 ?auto_1129352 ?auto_1129353 ?auto_1129354 ?auto_1129355 ?auto_1129356 ?auto_1129357 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1129473 - SURFACE
      ?auto_1129474 - SURFACE
      ?auto_1129475 - SURFACE
      ?auto_1129476 - SURFACE
      ?auto_1129477 - SURFACE
      ?auto_1129478 - SURFACE
      ?auto_1129479 - SURFACE
      ?auto_1129480 - SURFACE
      ?auto_1129481 - SURFACE
      ?auto_1129482 - SURFACE
      ?auto_1129483 - SURFACE
    )
    :vars
    (
      ?auto_1129489 - HOIST
      ?auto_1129487 - PLACE
      ?auto_1129488 - PLACE
      ?auto_1129484 - HOIST
      ?auto_1129486 - SURFACE
      ?auto_1129485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129489 ?auto_1129487 ) ( IS-CRATE ?auto_1129483 ) ( not ( = ?auto_1129482 ?auto_1129483 ) ) ( not ( = ?auto_1129481 ?auto_1129482 ) ) ( not ( = ?auto_1129481 ?auto_1129483 ) ) ( not ( = ?auto_1129488 ?auto_1129487 ) ) ( HOIST-AT ?auto_1129484 ?auto_1129488 ) ( not ( = ?auto_1129489 ?auto_1129484 ) ) ( AVAILABLE ?auto_1129484 ) ( SURFACE-AT ?auto_1129483 ?auto_1129488 ) ( ON ?auto_1129483 ?auto_1129486 ) ( CLEAR ?auto_1129483 ) ( not ( = ?auto_1129482 ?auto_1129486 ) ) ( not ( = ?auto_1129483 ?auto_1129486 ) ) ( not ( = ?auto_1129481 ?auto_1129486 ) ) ( TRUCK-AT ?auto_1129485 ?auto_1129487 ) ( SURFACE-AT ?auto_1129481 ?auto_1129487 ) ( CLEAR ?auto_1129481 ) ( IS-CRATE ?auto_1129482 ) ( AVAILABLE ?auto_1129489 ) ( IN ?auto_1129482 ?auto_1129485 ) ( ON ?auto_1129474 ?auto_1129473 ) ( ON ?auto_1129475 ?auto_1129474 ) ( ON ?auto_1129476 ?auto_1129475 ) ( ON ?auto_1129477 ?auto_1129476 ) ( ON ?auto_1129478 ?auto_1129477 ) ( ON ?auto_1129479 ?auto_1129478 ) ( ON ?auto_1129480 ?auto_1129479 ) ( ON ?auto_1129481 ?auto_1129480 ) ( not ( = ?auto_1129473 ?auto_1129474 ) ) ( not ( = ?auto_1129473 ?auto_1129475 ) ) ( not ( = ?auto_1129473 ?auto_1129476 ) ) ( not ( = ?auto_1129473 ?auto_1129477 ) ) ( not ( = ?auto_1129473 ?auto_1129478 ) ) ( not ( = ?auto_1129473 ?auto_1129479 ) ) ( not ( = ?auto_1129473 ?auto_1129480 ) ) ( not ( = ?auto_1129473 ?auto_1129481 ) ) ( not ( = ?auto_1129473 ?auto_1129482 ) ) ( not ( = ?auto_1129473 ?auto_1129483 ) ) ( not ( = ?auto_1129473 ?auto_1129486 ) ) ( not ( = ?auto_1129474 ?auto_1129475 ) ) ( not ( = ?auto_1129474 ?auto_1129476 ) ) ( not ( = ?auto_1129474 ?auto_1129477 ) ) ( not ( = ?auto_1129474 ?auto_1129478 ) ) ( not ( = ?auto_1129474 ?auto_1129479 ) ) ( not ( = ?auto_1129474 ?auto_1129480 ) ) ( not ( = ?auto_1129474 ?auto_1129481 ) ) ( not ( = ?auto_1129474 ?auto_1129482 ) ) ( not ( = ?auto_1129474 ?auto_1129483 ) ) ( not ( = ?auto_1129474 ?auto_1129486 ) ) ( not ( = ?auto_1129475 ?auto_1129476 ) ) ( not ( = ?auto_1129475 ?auto_1129477 ) ) ( not ( = ?auto_1129475 ?auto_1129478 ) ) ( not ( = ?auto_1129475 ?auto_1129479 ) ) ( not ( = ?auto_1129475 ?auto_1129480 ) ) ( not ( = ?auto_1129475 ?auto_1129481 ) ) ( not ( = ?auto_1129475 ?auto_1129482 ) ) ( not ( = ?auto_1129475 ?auto_1129483 ) ) ( not ( = ?auto_1129475 ?auto_1129486 ) ) ( not ( = ?auto_1129476 ?auto_1129477 ) ) ( not ( = ?auto_1129476 ?auto_1129478 ) ) ( not ( = ?auto_1129476 ?auto_1129479 ) ) ( not ( = ?auto_1129476 ?auto_1129480 ) ) ( not ( = ?auto_1129476 ?auto_1129481 ) ) ( not ( = ?auto_1129476 ?auto_1129482 ) ) ( not ( = ?auto_1129476 ?auto_1129483 ) ) ( not ( = ?auto_1129476 ?auto_1129486 ) ) ( not ( = ?auto_1129477 ?auto_1129478 ) ) ( not ( = ?auto_1129477 ?auto_1129479 ) ) ( not ( = ?auto_1129477 ?auto_1129480 ) ) ( not ( = ?auto_1129477 ?auto_1129481 ) ) ( not ( = ?auto_1129477 ?auto_1129482 ) ) ( not ( = ?auto_1129477 ?auto_1129483 ) ) ( not ( = ?auto_1129477 ?auto_1129486 ) ) ( not ( = ?auto_1129478 ?auto_1129479 ) ) ( not ( = ?auto_1129478 ?auto_1129480 ) ) ( not ( = ?auto_1129478 ?auto_1129481 ) ) ( not ( = ?auto_1129478 ?auto_1129482 ) ) ( not ( = ?auto_1129478 ?auto_1129483 ) ) ( not ( = ?auto_1129478 ?auto_1129486 ) ) ( not ( = ?auto_1129479 ?auto_1129480 ) ) ( not ( = ?auto_1129479 ?auto_1129481 ) ) ( not ( = ?auto_1129479 ?auto_1129482 ) ) ( not ( = ?auto_1129479 ?auto_1129483 ) ) ( not ( = ?auto_1129479 ?auto_1129486 ) ) ( not ( = ?auto_1129480 ?auto_1129481 ) ) ( not ( = ?auto_1129480 ?auto_1129482 ) ) ( not ( = ?auto_1129480 ?auto_1129483 ) ) ( not ( = ?auto_1129480 ?auto_1129486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129481 ?auto_1129482 ?auto_1129483 )
      ( MAKE-10CRATE-VERIFY ?auto_1129473 ?auto_1129474 ?auto_1129475 ?auto_1129476 ?auto_1129477 ?auto_1129478 ?auto_1129479 ?auto_1129480 ?auto_1129481 ?auto_1129482 ?auto_1129483 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1129490 - SURFACE
      ?auto_1129491 - SURFACE
    )
    :vars
    (
      ?auto_1129498 - HOIST
      ?auto_1129496 - PLACE
      ?auto_1129495 - SURFACE
      ?auto_1129497 - PLACE
      ?auto_1129492 - HOIST
      ?auto_1129494 - SURFACE
      ?auto_1129493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129498 ?auto_1129496 ) ( IS-CRATE ?auto_1129491 ) ( not ( = ?auto_1129490 ?auto_1129491 ) ) ( not ( = ?auto_1129495 ?auto_1129490 ) ) ( not ( = ?auto_1129495 ?auto_1129491 ) ) ( not ( = ?auto_1129497 ?auto_1129496 ) ) ( HOIST-AT ?auto_1129492 ?auto_1129497 ) ( not ( = ?auto_1129498 ?auto_1129492 ) ) ( AVAILABLE ?auto_1129492 ) ( SURFACE-AT ?auto_1129491 ?auto_1129497 ) ( ON ?auto_1129491 ?auto_1129494 ) ( CLEAR ?auto_1129491 ) ( not ( = ?auto_1129490 ?auto_1129494 ) ) ( not ( = ?auto_1129491 ?auto_1129494 ) ) ( not ( = ?auto_1129495 ?auto_1129494 ) ) ( SURFACE-AT ?auto_1129495 ?auto_1129496 ) ( CLEAR ?auto_1129495 ) ( IS-CRATE ?auto_1129490 ) ( AVAILABLE ?auto_1129498 ) ( IN ?auto_1129490 ?auto_1129493 ) ( TRUCK-AT ?auto_1129493 ?auto_1129497 ) )
    :subtasks
    ( ( !DRIVE ?auto_1129493 ?auto_1129497 ?auto_1129496 )
      ( MAKE-2CRATE ?auto_1129495 ?auto_1129490 ?auto_1129491 )
      ( MAKE-1CRATE-VERIFY ?auto_1129490 ?auto_1129491 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1129499 - SURFACE
      ?auto_1129500 - SURFACE
      ?auto_1129501 - SURFACE
    )
    :vars
    (
      ?auto_1129502 - HOIST
      ?auto_1129504 - PLACE
      ?auto_1129506 - PLACE
      ?auto_1129505 - HOIST
      ?auto_1129507 - SURFACE
      ?auto_1129503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129502 ?auto_1129504 ) ( IS-CRATE ?auto_1129501 ) ( not ( = ?auto_1129500 ?auto_1129501 ) ) ( not ( = ?auto_1129499 ?auto_1129500 ) ) ( not ( = ?auto_1129499 ?auto_1129501 ) ) ( not ( = ?auto_1129506 ?auto_1129504 ) ) ( HOIST-AT ?auto_1129505 ?auto_1129506 ) ( not ( = ?auto_1129502 ?auto_1129505 ) ) ( AVAILABLE ?auto_1129505 ) ( SURFACE-AT ?auto_1129501 ?auto_1129506 ) ( ON ?auto_1129501 ?auto_1129507 ) ( CLEAR ?auto_1129501 ) ( not ( = ?auto_1129500 ?auto_1129507 ) ) ( not ( = ?auto_1129501 ?auto_1129507 ) ) ( not ( = ?auto_1129499 ?auto_1129507 ) ) ( SURFACE-AT ?auto_1129499 ?auto_1129504 ) ( CLEAR ?auto_1129499 ) ( IS-CRATE ?auto_1129500 ) ( AVAILABLE ?auto_1129502 ) ( IN ?auto_1129500 ?auto_1129503 ) ( TRUCK-AT ?auto_1129503 ?auto_1129506 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1129500 ?auto_1129501 )
      ( MAKE-2CRATE-VERIFY ?auto_1129499 ?auto_1129500 ?auto_1129501 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1129508 - SURFACE
      ?auto_1129509 - SURFACE
      ?auto_1129510 - SURFACE
      ?auto_1129511 - SURFACE
    )
    :vars
    (
      ?auto_1129516 - HOIST
      ?auto_1129513 - PLACE
      ?auto_1129515 - PLACE
      ?auto_1129514 - HOIST
      ?auto_1129512 - SURFACE
      ?auto_1129517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129516 ?auto_1129513 ) ( IS-CRATE ?auto_1129511 ) ( not ( = ?auto_1129510 ?auto_1129511 ) ) ( not ( = ?auto_1129509 ?auto_1129510 ) ) ( not ( = ?auto_1129509 ?auto_1129511 ) ) ( not ( = ?auto_1129515 ?auto_1129513 ) ) ( HOIST-AT ?auto_1129514 ?auto_1129515 ) ( not ( = ?auto_1129516 ?auto_1129514 ) ) ( AVAILABLE ?auto_1129514 ) ( SURFACE-AT ?auto_1129511 ?auto_1129515 ) ( ON ?auto_1129511 ?auto_1129512 ) ( CLEAR ?auto_1129511 ) ( not ( = ?auto_1129510 ?auto_1129512 ) ) ( not ( = ?auto_1129511 ?auto_1129512 ) ) ( not ( = ?auto_1129509 ?auto_1129512 ) ) ( SURFACE-AT ?auto_1129509 ?auto_1129513 ) ( CLEAR ?auto_1129509 ) ( IS-CRATE ?auto_1129510 ) ( AVAILABLE ?auto_1129516 ) ( IN ?auto_1129510 ?auto_1129517 ) ( TRUCK-AT ?auto_1129517 ?auto_1129515 ) ( ON ?auto_1129509 ?auto_1129508 ) ( not ( = ?auto_1129508 ?auto_1129509 ) ) ( not ( = ?auto_1129508 ?auto_1129510 ) ) ( not ( = ?auto_1129508 ?auto_1129511 ) ) ( not ( = ?auto_1129508 ?auto_1129512 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129509 ?auto_1129510 ?auto_1129511 )
      ( MAKE-3CRATE-VERIFY ?auto_1129508 ?auto_1129509 ?auto_1129510 ?auto_1129511 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1129518 - SURFACE
      ?auto_1129519 - SURFACE
      ?auto_1129520 - SURFACE
      ?auto_1129521 - SURFACE
      ?auto_1129522 - SURFACE
    )
    :vars
    (
      ?auto_1129527 - HOIST
      ?auto_1129524 - PLACE
      ?auto_1129526 - PLACE
      ?auto_1129525 - HOIST
      ?auto_1129523 - SURFACE
      ?auto_1129528 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129527 ?auto_1129524 ) ( IS-CRATE ?auto_1129522 ) ( not ( = ?auto_1129521 ?auto_1129522 ) ) ( not ( = ?auto_1129520 ?auto_1129521 ) ) ( not ( = ?auto_1129520 ?auto_1129522 ) ) ( not ( = ?auto_1129526 ?auto_1129524 ) ) ( HOIST-AT ?auto_1129525 ?auto_1129526 ) ( not ( = ?auto_1129527 ?auto_1129525 ) ) ( AVAILABLE ?auto_1129525 ) ( SURFACE-AT ?auto_1129522 ?auto_1129526 ) ( ON ?auto_1129522 ?auto_1129523 ) ( CLEAR ?auto_1129522 ) ( not ( = ?auto_1129521 ?auto_1129523 ) ) ( not ( = ?auto_1129522 ?auto_1129523 ) ) ( not ( = ?auto_1129520 ?auto_1129523 ) ) ( SURFACE-AT ?auto_1129520 ?auto_1129524 ) ( CLEAR ?auto_1129520 ) ( IS-CRATE ?auto_1129521 ) ( AVAILABLE ?auto_1129527 ) ( IN ?auto_1129521 ?auto_1129528 ) ( TRUCK-AT ?auto_1129528 ?auto_1129526 ) ( ON ?auto_1129519 ?auto_1129518 ) ( ON ?auto_1129520 ?auto_1129519 ) ( not ( = ?auto_1129518 ?auto_1129519 ) ) ( not ( = ?auto_1129518 ?auto_1129520 ) ) ( not ( = ?auto_1129518 ?auto_1129521 ) ) ( not ( = ?auto_1129518 ?auto_1129522 ) ) ( not ( = ?auto_1129518 ?auto_1129523 ) ) ( not ( = ?auto_1129519 ?auto_1129520 ) ) ( not ( = ?auto_1129519 ?auto_1129521 ) ) ( not ( = ?auto_1129519 ?auto_1129522 ) ) ( not ( = ?auto_1129519 ?auto_1129523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129520 ?auto_1129521 ?auto_1129522 )
      ( MAKE-4CRATE-VERIFY ?auto_1129518 ?auto_1129519 ?auto_1129520 ?auto_1129521 ?auto_1129522 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1129529 - SURFACE
      ?auto_1129530 - SURFACE
      ?auto_1129531 - SURFACE
      ?auto_1129532 - SURFACE
      ?auto_1129533 - SURFACE
      ?auto_1129534 - SURFACE
    )
    :vars
    (
      ?auto_1129539 - HOIST
      ?auto_1129536 - PLACE
      ?auto_1129538 - PLACE
      ?auto_1129537 - HOIST
      ?auto_1129535 - SURFACE
      ?auto_1129540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129539 ?auto_1129536 ) ( IS-CRATE ?auto_1129534 ) ( not ( = ?auto_1129533 ?auto_1129534 ) ) ( not ( = ?auto_1129532 ?auto_1129533 ) ) ( not ( = ?auto_1129532 ?auto_1129534 ) ) ( not ( = ?auto_1129538 ?auto_1129536 ) ) ( HOIST-AT ?auto_1129537 ?auto_1129538 ) ( not ( = ?auto_1129539 ?auto_1129537 ) ) ( AVAILABLE ?auto_1129537 ) ( SURFACE-AT ?auto_1129534 ?auto_1129538 ) ( ON ?auto_1129534 ?auto_1129535 ) ( CLEAR ?auto_1129534 ) ( not ( = ?auto_1129533 ?auto_1129535 ) ) ( not ( = ?auto_1129534 ?auto_1129535 ) ) ( not ( = ?auto_1129532 ?auto_1129535 ) ) ( SURFACE-AT ?auto_1129532 ?auto_1129536 ) ( CLEAR ?auto_1129532 ) ( IS-CRATE ?auto_1129533 ) ( AVAILABLE ?auto_1129539 ) ( IN ?auto_1129533 ?auto_1129540 ) ( TRUCK-AT ?auto_1129540 ?auto_1129538 ) ( ON ?auto_1129530 ?auto_1129529 ) ( ON ?auto_1129531 ?auto_1129530 ) ( ON ?auto_1129532 ?auto_1129531 ) ( not ( = ?auto_1129529 ?auto_1129530 ) ) ( not ( = ?auto_1129529 ?auto_1129531 ) ) ( not ( = ?auto_1129529 ?auto_1129532 ) ) ( not ( = ?auto_1129529 ?auto_1129533 ) ) ( not ( = ?auto_1129529 ?auto_1129534 ) ) ( not ( = ?auto_1129529 ?auto_1129535 ) ) ( not ( = ?auto_1129530 ?auto_1129531 ) ) ( not ( = ?auto_1129530 ?auto_1129532 ) ) ( not ( = ?auto_1129530 ?auto_1129533 ) ) ( not ( = ?auto_1129530 ?auto_1129534 ) ) ( not ( = ?auto_1129530 ?auto_1129535 ) ) ( not ( = ?auto_1129531 ?auto_1129532 ) ) ( not ( = ?auto_1129531 ?auto_1129533 ) ) ( not ( = ?auto_1129531 ?auto_1129534 ) ) ( not ( = ?auto_1129531 ?auto_1129535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129532 ?auto_1129533 ?auto_1129534 )
      ( MAKE-5CRATE-VERIFY ?auto_1129529 ?auto_1129530 ?auto_1129531 ?auto_1129532 ?auto_1129533 ?auto_1129534 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1129541 - SURFACE
      ?auto_1129542 - SURFACE
      ?auto_1129543 - SURFACE
      ?auto_1129544 - SURFACE
      ?auto_1129545 - SURFACE
      ?auto_1129546 - SURFACE
      ?auto_1129547 - SURFACE
    )
    :vars
    (
      ?auto_1129552 - HOIST
      ?auto_1129549 - PLACE
      ?auto_1129551 - PLACE
      ?auto_1129550 - HOIST
      ?auto_1129548 - SURFACE
      ?auto_1129553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129552 ?auto_1129549 ) ( IS-CRATE ?auto_1129547 ) ( not ( = ?auto_1129546 ?auto_1129547 ) ) ( not ( = ?auto_1129545 ?auto_1129546 ) ) ( not ( = ?auto_1129545 ?auto_1129547 ) ) ( not ( = ?auto_1129551 ?auto_1129549 ) ) ( HOIST-AT ?auto_1129550 ?auto_1129551 ) ( not ( = ?auto_1129552 ?auto_1129550 ) ) ( AVAILABLE ?auto_1129550 ) ( SURFACE-AT ?auto_1129547 ?auto_1129551 ) ( ON ?auto_1129547 ?auto_1129548 ) ( CLEAR ?auto_1129547 ) ( not ( = ?auto_1129546 ?auto_1129548 ) ) ( not ( = ?auto_1129547 ?auto_1129548 ) ) ( not ( = ?auto_1129545 ?auto_1129548 ) ) ( SURFACE-AT ?auto_1129545 ?auto_1129549 ) ( CLEAR ?auto_1129545 ) ( IS-CRATE ?auto_1129546 ) ( AVAILABLE ?auto_1129552 ) ( IN ?auto_1129546 ?auto_1129553 ) ( TRUCK-AT ?auto_1129553 ?auto_1129551 ) ( ON ?auto_1129542 ?auto_1129541 ) ( ON ?auto_1129543 ?auto_1129542 ) ( ON ?auto_1129544 ?auto_1129543 ) ( ON ?auto_1129545 ?auto_1129544 ) ( not ( = ?auto_1129541 ?auto_1129542 ) ) ( not ( = ?auto_1129541 ?auto_1129543 ) ) ( not ( = ?auto_1129541 ?auto_1129544 ) ) ( not ( = ?auto_1129541 ?auto_1129545 ) ) ( not ( = ?auto_1129541 ?auto_1129546 ) ) ( not ( = ?auto_1129541 ?auto_1129547 ) ) ( not ( = ?auto_1129541 ?auto_1129548 ) ) ( not ( = ?auto_1129542 ?auto_1129543 ) ) ( not ( = ?auto_1129542 ?auto_1129544 ) ) ( not ( = ?auto_1129542 ?auto_1129545 ) ) ( not ( = ?auto_1129542 ?auto_1129546 ) ) ( not ( = ?auto_1129542 ?auto_1129547 ) ) ( not ( = ?auto_1129542 ?auto_1129548 ) ) ( not ( = ?auto_1129543 ?auto_1129544 ) ) ( not ( = ?auto_1129543 ?auto_1129545 ) ) ( not ( = ?auto_1129543 ?auto_1129546 ) ) ( not ( = ?auto_1129543 ?auto_1129547 ) ) ( not ( = ?auto_1129543 ?auto_1129548 ) ) ( not ( = ?auto_1129544 ?auto_1129545 ) ) ( not ( = ?auto_1129544 ?auto_1129546 ) ) ( not ( = ?auto_1129544 ?auto_1129547 ) ) ( not ( = ?auto_1129544 ?auto_1129548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129545 ?auto_1129546 ?auto_1129547 )
      ( MAKE-6CRATE-VERIFY ?auto_1129541 ?auto_1129542 ?auto_1129543 ?auto_1129544 ?auto_1129545 ?auto_1129546 ?auto_1129547 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1129554 - SURFACE
      ?auto_1129555 - SURFACE
      ?auto_1129556 - SURFACE
      ?auto_1129557 - SURFACE
      ?auto_1129558 - SURFACE
      ?auto_1129559 - SURFACE
      ?auto_1129560 - SURFACE
      ?auto_1129561 - SURFACE
    )
    :vars
    (
      ?auto_1129566 - HOIST
      ?auto_1129563 - PLACE
      ?auto_1129565 - PLACE
      ?auto_1129564 - HOIST
      ?auto_1129562 - SURFACE
      ?auto_1129567 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129566 ?auto_1129563 ) ( IS-CRATE ?auto_1129561 ) ( not ( = ?auto_1129560 ?auto_1129561 ) ) ( not ( = ?auto_1129559 ?auto_1129560 ) ) ( not ( = ?auto_1129559 ?auto_1129561 ) ) ( not ( = ?auto_1129565 ?auto_1129563 ) ) ( HOIST-AT ?auto_1129564 ?auto_1129565 ) ( not ( = ?auto_1129566 ?auto_1129564 ) ) ( AVAILABLE ?auto_1129564 ) ( SURFACE-AT ?auto_1129561 ?auto_1129565 ) ( ON ?auto_1129561 ?auto_1129562 ) ( CLEAR ?auto_1129561 ) ( not ( = ?auto_1129560 ?auto_1129562 ) ) ( not ( = ?auto_1129561 ?auto_1129562 ) ) ( not ( = ?auto_1129559 ?auto_1129562 ) ) ( SURFACE-AT ?auto_1129559 ?auto_1129563 ) ( CLEAR ?auto_1129559 ) ( IS-CRATE ?auto_1129560 ) ( AVAILABLE ?auto_1129566 ) ( IN ?auto_1129560 ?auto_1129567 ) ( TRUCK-AT ?auto_1129567 ?auto_1129565 ) ( ON ?auto_1129555 ?auto_1129554 ) ( ON ?auto_1129556 ?auto_1129555 ) ( ON ?auto_1129557 ?auto_1129556 ) ( ON ?auto_1129558 ?auto_1129557 ) ( ON ?auto_1129559 ?auto_1129558 ) ( not ( = ?auto_1129554 ?auto_1129555 ) ) ( not ( = ?auto_1129554 ?auto_1129556 ) ) ( not ( = ?auto_1129554 ?auto_1129557 ) ) ( not ( = ?auto_1129554 ?auto_1129558 ) ) ( not ( = ?auto_1129554 ?auto_1129559 ) ) ( not ( = ?auto_1129554 ?auto_1129560 ) ) ( not ( = ?auto_1129554 ?auto_1129561 ) ) ( not ( = ?auto_1129554 ?auto_1129562 ) ) ( not ( = ?auto_1129555 ?auto_1129556 ) ) ( not ( = ?auto_1129555 ?auto_1129557 ) ) ( not ( = ?auto_1129555 ?auto_1129558 ) ) ( not ( = ?auto_1129555 ?auto_1129559 ) ) ( not ( = ?auto_1129555 ?auto_1129560 ) ) ( not ( = ?auto_1129555 ?auto_1129561 ) ) ( not ( = ?auto_1129555 ?auto_1129562 ) ) ( not ( = ?auto_1129556 ?auto_1129557 ) ) ( not ( = ?auto_1129556 ?auto_1129558 ) ) ( not ( = ?auto_1129556 ?auto_1129559 ) ) ( not ( = ?auto_1129556 ?auto_1129560 ) ) ( not ( = ?auto_1129556 ?auto_1129561 ) ) ( not ( = ?auto_1129556 ?auto_1129562 ) ) ( not ( = ?auto_1129557 ?auto_1129558 ) ) ( not ( = ?auto_1129557 ?auto_1129559 ) ) ( not ( = ?auto_1129557 ?auto_1129560 ) ) ( not ( = ?auto_1129557 ?auto_1129561 ) ) ( not ( = ?auto_1129557 ?auto_1129562 ) ) ( not ( = ?auto_1129558 ?auto_1129559 ) ) ( not ( = ?auto_1129558 ?auto_1129560 ) ) ( not ( = ?auto_1129558 ?auto_1129561 ) ) ( not ( = ?auto_1129558 ?auto_1129562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129559 ?auto_1129560 ?auto_1129561 )
      ( MAKE-7CRATE-VERIFY ?auto_1129554 ?auto_1129555 ?auto_1129556 ?auto_1129557 ?auto_1129558 ?auto_1129559 ?auto_1129560 ?auto_1129561 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1129568 - SURFACE
      ?auto_1129569 - SURFACE
      ?auto_1129570 - SURFACE
      ?auto_1129571 - SURFACE
      ?auto_1129572 - SURFACE
      ?auto_1129573 - SURFACE
      ?auto_1129574 - SURFACE
      ?auto_1129575 - SURFACE
      ?auto_1129576 - SURFACE
    )
    :vars
    (
      ?auto_1129581 - HOIST
      ?auto_1129578 - PLACE
      ?auto_1129580 - PLACE
      ?auto_1129579 - HOIST
      ?auto_1129577 - SURFACE
      ?auto_1129582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129581 ?auto_1129578 ) ( IS-CRATE ?auto_1129576 ) ( not ( = ?auto_1129575 ?auto_1129576 ) ) ( not ( = ?auto_1129574 ?auto_1129575 ) ) ( not ( = ?auto_1129574 ?auto_1129576 ) ) ( not ( = ?auto_1129580 ?auto_1129578 ) ) ( HOIST-AT ?auto_1129579 ?auto_1129580 ) ( not ( = ?auto_1129581 ?auto_1129579 ) ) ( AVAILABLE ?auto_1129579 ) ( SURFACE-AT ?auto_1129576 ?auto_1129580 ) ( ON ?auto_1129576 ?auto_1129577 ) ( CLEAR ?auto_1129576 ) ( not ( = ?auto_1129575 ?auto_1129577 ) ) ( not ( = ?auto_1129576 ?auto_1129577 ) ) ( not ( = ?auto_1129574 ?auto_1129577 ) ) ( SURFACE-AT ?auto_1129574 ?auto_1129578 ) ( CLEAR ?auto_1129574 ) ( IS-CRATE ?auto_1129575 ) ( AVAILABLE ?auto_1129581 ) ( IN ?auto_1129575 ?auto_1129582 ) ( TRUCK-AT ?auto_1129582 ?auto_1129580 ) ( ON ?auto_1129569 ?auto_1129568 ) ( ON ?auto_1129570 ?auto_1129569 ) ( ON ?auto_1129571 ?auto_1129570 ) ( ON ?auto_1129572 ?auto_1129571 ) ( ON ?auto_1129573 ?auto_1129572 ) ( ON ?auto_1129574 ?auto_1129573 ) ( not ( = ?auto_1129568 ?auto_1129569 ) ) ( not ( = ?auto_1129568 ?auto_1129570 ) ) ( not ( = ?auto_1129568 ?auto_1129571 ) ) ( not ( = ?auto_1129568 ?auto_1129572 ) ) ( not ( = ?auto_1129568 ?auto_1129573 ) ) ( not ( = ?auto_1129568 ?auto_1129574 ) ) ( not ( = ?auto_1129568 ?auto_1129575 ) ) ( not ( = ?auto_1129568 ?auto_1129576 ) ) ( not ( = ?auto_1129568 ?auto_1129577 ) ) ( not ( = ?auto_1129569 ?auto_1129570 ) ) ( not ( = ?auto_1129569 ?auto_1129571 ) ) ( not ( = ?auto_1129569 ?auto_1129572 ) ) ( not ( = ?auto_1129569 ?auto_1129573 ) ) ( not ( = ?auto_1129569 ?auto_1129574 ) ) ( not ( = ?auto_1129569 ?auto_1129575 ) ) ( not ( = ?auto_1129569 ?auto_1129576 ) ) ( not ( = ?auto_1129569 ?auto_1129577 ) ) ( not ( = ?auto_1129570 ?auto_1129571 ) ) ( not ( = ?auto_1129570 ?auto_1129572 ) ) ( not ( = ?auto_1129570 ?auto_1129573 ) ) ( not ( = ?auto_1129570 ?auto_1129574 ) ) ( not ( = ?auto_1129570 ?auto_1129575 ) ) ( not ( = ?auto_1129570 ?auto_1129576 ) ) ( not ( = ?auto_1129570 ?auto_1129577 ) ) ( not ( = ?auto_1129571 ?auto_1129572 ) ) ( not ( = ?auto_1129571 ?auto_1129573 ) ) ( not ( = ?auto_1129571 ?auto_1129574 ) ) ( not ( = ?auto_1129571 ?auto_1129575 ) ) ( not ( = ?auto_1129571 ?auto_1129576 ) ) ( not ( = ?auto_1129571 ?auto_1129577 ) ) ( not ( = ?auto_1129572 ?auto_1129573 ) ) ( not ( = ?auto_1129572 ?auto_1129574 ) ) ( not ( = ?auto_1129572 ?auto_1129575 ) ) ( not ( = ?auto_1129572 ?auto_1129576 ) ) ( not ( = ?auto_1129572 ?auto_1129577 ) ) ( not ( = ?auto_1129573 ?auto_1129574 ) ) ( not ( = ?auto_1129573 ?auto_1129575 ) ) ( not ( = ?auto_1129573 ?auto_1129576 ) ) ( not ( = ?auto_1129573 ?auto_1129577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129574 ?auto_1129575 ?auto_1129576 )
      ( MAKE-8CRATE-VERIFY ?auto_1129568 ?auto_1129569 ?auto_1129570 ?auto_1129571 ?auto_1129572 ?auto_1129573 ?auto_1129574 ?auto_1129575 ?auto_1129576 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1129583 - SURFACE
      ?auto_1129584 - SURFACE
      ?auto_1129585 - SURFACE
      ?auto_1129586 - SURFACE
      ?auto_1129587 - SURFACE
      ?auto_1129588 - SURFACE
      ?auto_1129589 - SURFACE
      ?auto_1129590 - SURFACE
      ?auto_1129591 - SURFACE
      ?auto_1129592 - SURFACE
    )
    :vars
    (
      ?auto_1129597 - HOIST
      ?auto_1129594 - PLACE
      ?auto_1129596 - PLACE
      ?auto_1129595 - HOIST
      ?auto_1129593 - SURFACE
      ?auto_1129598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129597 ?auto_1129594 ) ( IS-CRATE ?auto_1129592 ) ( not ( = ?auto_1129591 ?auto_1129592 ) ) ( not ( = ?auto_1129590 ?auto_1129591 ) ) ( not ( = ?auto_1129590 ?auto_1129592 ) ) ( not ( = ?auto_1129596 ?auto_1129594 ) ) ( HOIST-AT ?auto_1129595 ?auto_1129596 ) ( not ( = ?auto_1129597 ?auto_1129595 ) ) ( AVAILABLE ?auto_1129595 ) ( SURFACE-AT ?auto_1129592 ?auto_1129596 ) ( ON ?auto_1129592 ?auto_1129593 ) ( CLEAR ?auto_1129592 ) ( not ( = ?auto_1129591 ?auto_1129593 ) ) ( not ( = ?auto_1129592 ?auto_1129593 ) ) ( not ( = ?auto_1129590 ?auto_1129593 ) ) ( SURFACE-AT ?auto_1129590 ?auto_1129594 ) ( CLEAR ?auto_1129590 ) ( IS-CRATE ?auto_1129591 ) ( AVAILABLE ?auto_1129597 ) ( IN ?auto_1129591 ?auto_1129598 ) ( TRUCK-AT ?auto_1129598 ?auto_1129596 ) ( ON ?auto_1129584 ?auto_1129583 ) ( ON ?auto_1129585 ?auto_1129584 ) ( ON ?auto_1129586 ?auto_1129585 ) ( ON ?auto_1129587 ?auto_1129586 ) ( ON ?auto_1129588 ?auto_1129587 ) ( ON ?auto_1129589 ?auto_1129588 ) ( ON ?auto_1129590 ?auto_1129589 ) ( not ( = ?auto_1129583 ?auto_1129584 ) ) ( not ( = ?auto_1129583 ?auto_1129585 ) ) ( not ( = ?auto_1129583 ?auto_1129586 ) ) ( not ( = ?auto_1129583 ?auto_1129587 ) ) ( not ( = ?auto_1129583 ?auto_1129588 ) ) ( not ( = ?auto_1129583 ?auto_1129589 ) ) ( not ( = ?auto_1129583 ?auto_1129590 ) ) ( not ( = ?auto_1129583 ?auto_1129591 ) ) ( not ( = ?auto_1129583 ?auto_1129592 ) ) ( not ( = ?auto_1129583 ?auto_1129593 ) ) ( not ( = ?auto_1129584 ?auto_1129585 ) ) ( not ( = ?auto_1129584 ?auto_1129586 ) ) ( not ( = ?auto_1129584 ?auto_1129587 ) ) ( not ( = ?auto_1129584 ?auto_1129588 ) ) ( not ( = ?auto_1129584 ?auto_1129589 ) ) ( not ( = ?auto_1129584 ?auto_1129590 ) ) ( not ( = ?auto_1129584 ?auto_1129591 ) ) ( not ( = ?auto_1129584 ?auto_1129592 ) ) ( not ( = ?auto_1129584 ?auto_1129593 ) ) ( not ( = ?auto_1129585 ?auto_1129586 ) ) ( not ( = ?auto_1129585 ?auto_1129587 ) ) ( not ( = ?auto_1129585 ?auto_1129588 ) ) ( not ( = ?auto_1129585 ?auto_1129589 ) ) ( not ( = ?auto_1129585 ?auto_1129590 ) ) ( not ( = ?auto_1129585 ?auto_1129591 ) ) ( not ( = ?auto_1129585 ?auto_1129592 ) ) ( not ( = ?auto_1129585 ?auto_1129593 ) ) ( not ( = ?auto_1129586 ?auto_1129587 ) ) ( not ( = ?auto_1129586 ?auto_1129588 ) ) ( not ( = ?auto_1129586 ?auto_1129589 ) ) ( not ( = ?auto_1129586 ?auto_1129590 ) ) ( not ( = ?auto_1129586 ?auto_1129591 ) ) ( not ( = ?auto_1129586 ?auto_1129592 ) ) ( not ( = ?auto_1129586 ?auto_1129593 ) ) ( not ( = ?auto_1129587 ?auto_1129588 ) ) ( not ( = ?auto_1129587 ?auto_1129589 ) ) ( not ( = ?auto_1129587 ?auto_1129590 ) ) ( not ( = ?auto_1129587 ?auto_1129591 ) ) ( not ( = ?auto_1129587 ?auto_1129592 ) ) ( not ( = ?auto_1129587 ?auto_1129593 ) ) ( not ( = ?auto_1129588 ?auto_1129589 ) ) ( not ( = ?auto_1129588 ?auto_1129590 ) ) ( not ( = ?auto_1129588 ?auto_1129591 ) ) ( not ( = ?auto_1129588 ?auto_1129592 ) ) ( not ( = ?auto_1129588 ?auto_1129593 ) ) ( not ( = ?auto_1129589 ?auto_1129590 ) ) ( not ( = ?auto_1129589 ?auto_1129591 ) ) ( not ( = ?auto_1129589 ?auto_1129592 ) ) ( not ( = ?auto_1129589 ?auto_1129593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129590 ?auto_1129591 ?auto_1129592 )
      ( MAKE-9CRATE-VERIFY ?auto_1129583 ?auto_1129584 ?auto_1129585 ?auto_1129586 ?auto_1129587 ?auto_1129588 ?auto_1129589 ?auto_1129590 ?auto_1129591 ?auto_1129592 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1129599 - SURFACE
      ?auto_1129600 - SURFACE
      ?auto_1129601 - SURFACE
      ?auto_1129602 - SURFACE
      ?auto_1129603 - SURFACE
      ?auto_1129604 - SURFACE
      ?auto_1129605 - SURFACE
      ?auto_1129606 - SURFACE
      ?auto_1129607 - SURFACE
      ?auto_1129608 - SURFACE
      ?auto_1129609 - SURFACE
    )
    :vars
    (
      ?auto_1129614 - HOIST
      ?auto_1129611 - PLACE
      ?auto_1129613 - PLACE
      ?auto_1129612 - HOIST
      ?auto_1129610 - SURFACE
      ?auto_1129615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129614 ?auto_1129611 ) ( IS-CRATE ?auto_1129609 ) ( not ( = ?auto_1129608 ?auto_1129609 ) ) ( not ( = ?auto_1129607 ?auto_1129608 ) ) ( not ( = ?auto_1129607 ?auto_1129609 ) ) ( not ( = ?auto_1129613 ?auto_1129611 ) ) ( HOIST-AT ?auto_1129612 ?auto_1129613 ) ( not ( = ?auto_1129614 ?auto_1129612 ) ) ( AVAILABLE ?auto_1129612 ) ( SURFACE-AT ?auto_1129609 ?auto_1129613 ) ( ON ?auto_1129609 ?auto_1129610 ) ( CLEAR ?auto_1129609 ) ( not ( = ?auto_1129608 ?auto_1129610 ) ) ( not ( = ?auto_1129609 ?auto_1129610 ) ) ( not ( = ?auto_1129607 ?auto_1129610 ) ) ( SURFACE-AT ?auto_1129607 ?auto_1129611 ) ( CLEAR ?auto_1129607 ) ( IS-CRATE ?auto_1129608 ) ( AVAILABLE ?auto_1129614 ) ( IN ?auto_1129608 ?auto_1129615 ) ( TRUCK-AT ?auto_1129615 ?auto_1129613 ) ( ON ?auto_1129600 ?auto_1129599 ) ( ON ?auto_1129601 ?auto_1129600 ) ( ON ?auto_1129602 ?auto_1129601 ) ( ON ?auto_1129603 ?auto_1129602 ) ( ON ?auto_1129604 ?auto_1129603 ) ( ON ?auto_1129605 ?auto_1129604 ) ( ON ?auto_1129606 ?auto_1129605 ) ( ON ?auto_1129607 ?auto_1129606 ) ( not ( = ?auto_1129599 ?auto_1129600 ) ) ( not ( = ?auto_1129599 ?auto_1129601 ) ) ( not ( = ?auto_1129599 ?auto_1129602 ) ) ( not ( = ?auto_1129599 ?auto_1129603 ) ) ( not ( = ?auto_1129599 ?auto_1129604 ) ) ( not ( = ?auto_1129599 ?auto_1129605 ) ) ( not ( = ?auto_1129599 ?auto_1129606 ) ) ( not ( = ?auto_1129599 ?auto_1129607 ) ) ( not ( = ?auto_1129599 ?auto_1129608 ) ) ( not ( = ?auto_1129599 ?auto_1129609 ) ) ( not ( = ?auto_1129599 ?auto_1129610 ) ) ( not ( = ?auto_1129600 ?auto_1129601 ) ) ( not ( = ?auto_1129600 ?auto_1129602 ) ) ( not ( = ?auto_1129600 ?auto_1129603 ) ) ( not ( = ?auto_1129600 ?auto_1129604 ) ) ( not ( = ?auto_1129600 ?auto_1129605 ) ) ( not ( = ?auto_1129600 ?auto_1129606 ) ) ( not ( = ?auto_1129600 ?auto_1129607 ) ) ( not ( = ?auto_1129600 ?auto_1129608 ) ) ( not ( = ?auto_1129600 ?auto_1129609 ) ) ( not ( = ?auto_1129600 ?auto_1129610 ) ) ( not ( = ?auto_1129601 ?auto_1129602 ) ) ( not ( = ?auto_1129601 ?auto_1129603 ) ) ( not ( = ?auto_1129601 ?auto_1129604 ) ) ( not ( = ?auto_1129601 ?auto_1129605 ) ) ( not ( = ?auto_1129601 ?auto_1129606 ) ) ( not ( = ?auto_1129601 ?auto_1129607 ) ) ( not ( = ?auto_1129601 ?auto_1129608 ) ) ( not ( = ?auto_1129601 ?auto_1129609 ) ) ( not ( = ?auto_1129601 ?auto_1129610 ) ) ( not ( = ?auto_1129602 ?auto_1129603 ) ) ( not ( = ?auto_1129602 ?auto_1129604 ) ) ( not ( = ?auto_1129602 ?auto_1129605 ) ) ( not ( = ?auto_1129602 ?auto_1129606 ) ) ( not ( = ?auto_1129602 ?auto_1129607 ) ) ( not ( = ?auto_1129602 ?auto_1129608 ) ) ( not ( = ?auto_1129602 ?auto_1129609 ) ) ( not ( = ?auto_1129602 ?auto_1129610 ) ) ( not ( = ?auto_1129603 ?auto_1129604 ) ) ( not ( = ?auto_1129603 ?auto_1129605 ) ) ( not ( = ?auto_1129603 ?auto_1129606 ) ) ( not ( = ?auto_1129603 ?auto_1129607 ) ) ( not ( = ?auto_1129603 ?auto_1129608 ) ) ( not ( = ?auto_1129603 ?auto_1129609 ) ) ( not ( = ?auto_1129603 ?auto_1129610 ) ) ( not ( = ?auto_1129604 ?auto_1129605 ) ) ( not ( = ?auto_1129604 ?auto_1129606 ) ) ( not ( = ?auto_1129604 ?auto_1129607 ) ) ( not ( = ?auto_1129604 ?auto_1129608 ) ) ( not ( = ?auto_1129604 ?auto_1129609 ) ) ( not ( = ?auto_1129604 ?auto_1129610 ) ) ( not ( = ?auto_1129605 ?auto_1129606 ) ) ( not ( = ?auto_1129605 ?auto_1129607 ) ) ( not ( = ?auto_1129605 ?auto_1129608 ) ) ( not ( = ?auto_1129605 ?auto_1129609 ) ) ( not ( = ?auto_1129605 ?auto_1129610 ) ) ( not ( = ?auto_1129606 ?auto_1129607 ) ) ( not ( = ?auto_1129606 ?auto_1129608 ) ) ( not ( = ?auto_1129606 ?auto_1129609 ) ) ( not ( = ?auto_1129606 ?auto_1129610 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129607 ?auto_1129608 ?auto_1129609 )
      ( MAKE-10CRATE-VERIFY ?auto_1129599 ?auto_1129600 ?auto_1129601 ?auto_1129602 ?auto_1129603 ?auto_1129604 ?auto_1129605 ?auto_1129606 ?auto_1129607 ?auto_1129608 ?auto_1129609 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1129616 - SURFACE
      ?auto_1129617 - SURFACE
    )
    :vars
    (
      ?auto_1129623 - HOIST
      ?auto_1129620 - PLACE
      ?auto_1129618 - SURFACE
      ?auto_1129622 - PLACE
      ?auto_1129621 - HOIST
      ?auto_1129619 - SURFACE
      ?auto_1129624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129623 ?auto_1129620 ) ( IS-CRATE ?auto_1129617 ) ( not ( = ?auto_1129616 ?auto_1129617 ) ) ( not ( = ?auto_1129618 ?auto_1129616 ) ) ( not ( = ?auto_1129618 ?auto_1129617 ) ) ( not ( = ?auto_1129622 ?auto_1129620 ) ) ( HOIST-AT ?auto_1129621 ?auto_1129622 ) ( not ( = ?auto_1129623 ?auto_1129621 ) ) ( SURFACE-AT ?auto_1129617 ?auto_1129622 ) ( ON ?auto_1129617 ?auto_1129619 ) ( CLEAR ?auto_1129617 ) ( not ( = ?auto_1129616 ?auto_1129619 ) ) ( not ( = ?auto_1129617 ?auto_1129619 ) ) ( not ( = ?auto_1129618 ?auto_1129619 ) ) ( SURFACE-AT ?auto_1129618 ?auto_1129620 ) ( CLEAR ?auto_1129618 ) ( IS-CRATE ?auto_1129616 ) ( AVAILABLE ?auto_1129623 ) ( TRUCK-AT ?auto_1129624 ?auto_1129622 ) ( LIFTING ?auto_1129621 ?auto_1129616 ) )
    :subtasks
    ( ( !LOAD ?auto_1129621 ?auto_1129616 ?auto_1129624 ?auto_1129622 )
      ( MAKE-2CRATE ?auto_1129618 ?auto_1129616 ?auto_1129617 )
      ( MAKE-1CRATE-VERIFY ?auto_1129616 ?auto_1129617 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1129625 - SURFACE
      ?auto_1129626 - SURFACE
      ?auto_1129627 - SURFACE
    )
    :vars
    (
      ?auto_1129632 - HOIST
      ?auto_1129631 - PLACE
      ?auto_1129633 - PLACE
      ?auto_1129629 - HOIST
      ?auto_1129628 - SURFACE
      ?auto_1129630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129632 ?auto_1129631 ) ( IS-CRATE ?auto_1129627 ) ( not ( = ?auto_1129626 ?auto_1129627 ) ) ( not ( = ?auto_1129625 ?auto_1129626 ) ) ( not ( = ?auto_1129625 ?auto_1129627 ) ) ( not ( = ?auto_1129633 ?auto_1129631 ) ) ( HOIST-AT ?auto_1129629 ?auto_1129633 ) ( not ( = ?auto_1129632 ?auto_1129629 ) ) ( SURFACE-AT ?auto_1129627 ?auto_1129633 ) ( ON ?auto_1129627 ?auto_1129628 ) ( CLEAR ?auto_1129627 ) ( not ( = ?auto_1129626 ?auto_1129628 ) ) ( not ( = ?auto_1129627 ?auto_1129628 ) ) ( not ( = ?auto_1129625 ?auto_1129628 ) ) ( SURFACE-AT ?auto_1129625 ?auto_1129631 ) ( CLEAR ?auto_1129625 ) ( IS-CRATE ?auto_1129626 ) ( AVAILABLE ?auto_1129632 ) ( TRUCK-AT ?auto_1129630 ?auto_1129633 ) ( LIFTING ?auto_1129629 ?auto_1129626 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1129626 ?auto_1129627 )
      ( MAKE-2CRATE-VERIFY ?auto_1129625 ?auto_1129626 ?auto_1129627 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1129634 - SURFACE
      ?auto_1129635 - SURFACE
      ?auto_1129636 - SURFACE
      ?auto_1129637 - SURFACE
    )
    :vars
    (
      ?auto_1129643 - HOIST
      ?auto_1129642 - PLACE
      ?auto_1129641 - PLACE
      ?auto_1129640 - HOIST
      ?auto_1129638 - SURFACE
      ?auto_1129639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129643 ?auto_1129642 ) ( IS-CRATE ?auto_1129637 ) ( not ( = ?auto_1129636 ?auto_1129637 ) ) ( not ( = ?auto_1129635 ?auto_1129636 ) ) ( not ( = ?auto_1129635 ?auto_1129637 ) ) ( not ( = ?auto_1129641 ?auto_1129642 ) ) ( HOIST-AT ?auto_1129640 ?auto_1129641 ) ( not ( = ?auto_1129643 ?auto_1129640 ) ) ( SURFACE-AT ?auto_1129637 ?auto_1129641 ) ( ON ?auto_1129637 ?auto_1129638 ) ( CLEAR ?auto_1129637 ) ( not ( = ?auto_1129636 ?auto_1129638 ) ) ( not ( = ?auto_1129637 ?auto_1129638 ) ) ( not ( = ?auto_1129635 ?auto_1129638 ) ) ( SURFACE-AT ?auto_1129635 ?auto_1129642 ) ( CLEAR ?auto_1129635 ) ( IS-CRATE ?auto_1129636 ) ( AVAILABLE ?auto_1129643 ) ( TRUCK-AT ?auto_1129639 ?auto_1129641 ) ( LIFTING ?auto_1129640 ?auto_1129636 ) ( ON ?auto_1129635 ?auto_1129634 ) ( not ( = ?auto_1129634 ?auto_1129635 ) ) ( not ( = ?auto_1129634 ?auto_1129636 ) ) ( not ( = ?auto_1129634 ?auto_1129637 ) ) ( not ( = ?auto_1129634 ?auto_1129638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129635 ?auto_1129636 ?auto_1129637 )
      ( MAKE-3CRATE-VERIFY ?auto_1129634 ?auto_1129635 ?auto_1129636 ?auto_1129637 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1129644 - SURFACE
      ?auto_1129645 - SURFACE
      ?auto_1129646 - SURFACE
      ?auto_1129647 - SURFACE
      ?auto_1129648 - SURFACE
    )
    :vars
    (
      ?auto_1129654 - HOIST
      ?auto_1129653 - PLACE
      ?auto_1129652 - PLACE
      ?auto_1129651 - HOIST
      ?auto_1129649 - SURFACE
      ?auto_1129650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129654 ?auto_1129653 ) ( IS-CRATE ?auto_1129648 ) ( not ( = ?auto_1129647 ?auto_1129648 ) ) ( not ( = ?auto_1129646 ?auto_1129647 ) ) ( not ( = ?auto_1129646 ?auto_1129648 ) ) ( not ( = ?auto_1129652 ?auto_1129653 ) ) ( HOIST-AT ?auto_1129651 ?auto_1129652 ) ( not ( = ?auto_1129654 ?auto_1129651 ) ) ( SURFACE-AT ?auto_1129648 ?auto_1129652 ) ( ON ?auto_1129648 ?auto_1129649 ) ( CLEAR ?auto_1129648 ) ( not ( = ?auto_1129647 ?auto_1129649 ) ) ( not ( = ?auto_1129648 ?auto_1129649 ) ) ( not ( = ?auto_1129646 ?auto_1129649 ) ) ( SURFACE-AT ?auto_1129646 ?auto_1129653 ) ( CLEAR ?auto_1129646 ) ( IS-CRATE ?auto_1129647 ) ( AVAILABLE ?auto_1129654 ) ( TRUCK-AT ?auto_1129650 ?auto_1129652 ) ( LIFTING ?auto_1129651 ?auto_1129647 ) ( ON ?auto_1129645 ?auto_1129644 ) ( ON ?auto_1129646 ?auto_1129645 ) ( not ( = ?auto_1129644 ?auto_1129645 ) ) ( not ( = ?auto_1129644 ?auto_1129646 ) ) ( not ( = ?auto_1129644 ?auto_1129647 ) ) ( not ( = ?auto_1129644 ?auto_1129648 ) ) ( not ( = ?auto_1129644 ?auto_1129649 ) ) ( not ( = ?auto_1129645 ?auto_1129646 ) ) ( not ( = ?auto_1129645 ?auto_1129647 ) ) ( not ( = ?auto_1129645 ?auto_1129648 ) ) ( not ( = ?auto_1129645 ?auto_1129649 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129646 ?auto_1129647 ?auto_1129648 )
      ( MAKE-4CRATE-VERIFY ?auto_1129644 ?auto_1129645 ?auto_1129646 ?auto_1129647 ?auto_1129648 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1129655 - SURFACE
      ?auto_1129656 - SURFACE
      ?auto_1129657 - SURFACE
      ?auto_1129658 - SURFACE
      ?auto_1129659 - SURFACE
      ?auto_1129660 - SURFACE
    )
    :vars
    (
      ?auto_1129666 - HOIST
      ?auto_1129665 - PLACE
      ?auto_1129664 - PLACE
      ?auto_1129663 - HOIST
      ?auto_1129661 - SURFACE
      ?auto_1129662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129666 ?auto_1129665 ) ( IS-CRATE ?auto_1129660 ) ( not ( = ?auto_1129659 ?auto_1129660 ) ) ( not ( = ?auto_1129658 ?auto_1129659 ) ) ( not ( = ?auto_1129658 ?auto_1129660 ) ) ( not ( = ?auto_1129664 ?auto_1129665 ) ) ( HOIST-AT ?auto_1129663 ?auto_1129664 ) ( not ( = ?auto_1129666 ?auto_1129663 ) ) ( SURFACE-AT ?auto_1129660 ?auto_1129664 ) ( ON ?auto_1129660 ?auto_1129661 ) ( CLEAR ?auto_1129660 ) ( not ( = ?auto_1129659 ?auto_1129661 ) ) ( not ( = ?auto_1129660 ?auto_1129661 ) ) ( not ( = ?auto_1129658 ?auto_1129661 ) ) ( SURFACE-AT ?auto_1129658 ?auto_1129665 ) ( CLEAR ?auto_1129658 ) ( IS-CRATE ?auto_1129659 ) ( AVAILABLE ?auto_1129666 ) ( TRUCK-AT ?auto_1129662 ?auto_1129664 ) ( LIFTING ?auto_1129663 ?auto_1129659 ) ( ON ?auto_1129656 ?auto_1129655 ) ( ON ?auto_1129657 ?auto_1129656 ) ( ON ?auto_1129658 ?auto_1129657 ) ( not ( = ?auto_1129655 ?auto_1129656 ) ) ( not ( = ?auto_1129655 ?auto_1129657 ) ) ( not ( = ?auto_1129655 ?auto_1129658 ) ) ( not ( = ?auto_1129655 ?auto_1129659 ) ) ( not ( = ?auto_1129655 ?auto_1129660 ) ) ( not ( = ?auto_1129655 ?auto_1129661 ) ) ( not ( = ?auto_1129656 ?auto_1129657 ) ) ( not ( = ?auto_1129656 ?auto_1129658 ) ) ( not ( = ?auto_1129656 ?auto_1129659 ) ) ( not ( = ?auto_1129656 ?auto_1129660 ) ) ( not ( = ?auto_1129656 ?auto_1129661 ) ) ( not ( = ?auto_1129657 ?auto_1129658 ) ) ( not ( = ?auto_1129657 ?auto_1129659 ) ) ( not ( = ?auto_1129657 ?auto_1129660 ) ) ( not ( = ?auto_1129657 ?auto_1129661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129658 ?auto_1129659 ?auto_1129660 )
      ( MAKE-5CRATE-VERIFY ?auto_1129655 ?auto_1129656 ?auto_1129657 ?auto_1129658 ?auto_1129659 ?auto_1129660 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1129667 - SURFACE
      ?auto_1129668 - SURFACE
      ?auto_1129669 - SURFACE
      ?auto_1129670 - SURFACE
      ?auto_1129671 - SURFACE
      ?auto_1129672 - SURFACE
      ?auto_1129673 - SURFACE
    )
    :vars
    (
      ?auto_1129679 - HOIST
      ?auto_1129678 - PLACE
      ?auto_1129677 - PLACE
      ?auto_1129676 - HOIST
      ?auto_1129674 - SURFACE
      ?auto_1129675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129679 ?auto_1129678 ) ( IS-CRATE ?auto_1129673 ) ( not ( = ?auto_1129672 ?auto_1129673 ) ) ( not ( = ?auto_1129671 ?auto_1129672 ) ) ( not ( = ?auto_1129671 ?auto_1129673 ) ) ( not ( = ?auto_1129677 ?auto_1129678 ) ) ( HOIST-AT ?auto_1129676 ?auto_1129677 ) ( not ( = ?auto_1129679 ?auto_1129676 ) ) ( SURFACE-AT ?auto_1129673 ?auto_1129677 ) ( ON ?auto_1129673 ?auto_1129674 ) ( CLEAR ?auto_1129673 ) ( not ( = ?auto_1129672 ?auto_1129674 ) ) ( not ( = ?auto_1129673 ?auto_1129674 ) ) ( not ( = ?auto_1129671 ?auto_1129674 ) ) ( SURFACE-AT ?auto_1129671 ?auto_1129678 ) ( CLEAR ?auto_1129671 ) ( IS-CRATE ?auto_1129672 ) ( AVAILABLE ?auto_1129679 ) ( TRUCK-AT ?auto_1129675 ?auto_1129677 ) ( LIFTING ?auto_1129676 ?auto_1129672 ) ( ON ?auto_1129668 ?auto_1129667 ) ( ON ?auto_1129669 ?auto_1129668 ) ( ON ?auto_1129670 ?auto_1129669 ) ( ON ?auto_1129671 ?auto_1129670 ) ( not ( = ?auto_1129667 ?auto_1129668 ) ) ( not ( = ?auto_1129667 ?auto_1129669 ) ) ( not ( = ?auto_1129667 ?auto_1129670 ) ) ( not ( = ?auto_1129667 ?auto_1129671 ) ) ( not ( = ?auto_1129667 ?auto_1129672 ) ) ( not ( = ?auto_1129667 ?auto_1129673 ) ) ( not ( = ?auto_1129667 ?auto_1129674 ) ) ( not ( = ?auto_1129668 ?auto_1129669 ) ) ( not ( = ?auto_1129668 ?auto_1129670 ) ) ( not ( = ?auto_1129668 ?auto_1129671 ) ) ( not ( = ?auto_1129668 ?auto_1129672 ) ) ( not ( = ?auto_1129668 ?auto_1129673 ) ) ( not ( = ?auto_1129668 ?auto_1129674 ) ) ( not ( = ?auto_1129669 ?auto_1129670 ) ) ( not ( = ?auto_1129669 ?auto_1129671 ) ) ( not ( = ?auto_1129669 ?auto_1129672 ) ) ( not ( = ?auto_1129669 ?auto_1129673 ) ) ( not ( = ?auto_1129669 ?auto_1129674 ) ) ( not ( = ?auto_1129670 ?auto_1129671 ) ) ( not ( = ?auto_1129670 ?auto_1129672 ) ) ( not ( = ?auto_1129670 ?auto_1129673 ) ) ( not ( = ?auto_1129670 ?auto_1129674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129671 ?auto_1129672 ?auto_1129673 )
      ( MAKE-6CRATE-VERIFY ?auto_1129667 ?auto_1129668 ?auto_1129669 ?auto_1129670 ?auto_1129671 ?auto_1129672 ?auto_1129673 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1129680 - SURFACE
      ?auto_1129681 - SURFACE
      ?auto_1129682 - SURFACE
      ?auto_1129683 - SURFACE
      ?auto_1129684 - SURFACE
      ?auto_1129685 - SURFACE
      ?auto_1129686 - SURFACE
      ?auto_1129687 - SURFACE
    )
    :vars
    (
      ?auto_1129693 - HOIST
      ?auto_1129692 - PLACE
      ?auto_1129691 - PLACE
      ?auto_1129690 - HOIST
      ?auto_1129688 - SURFACE
      ?auto_1129689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129693 ?auto_1129692 ) ( IS-CRATE ?auto_1129687 ) ( not ( = ?auto_1129686 ?auto_1129687 ) ) ( not ( = ?auto_1129685 ?auto_1129686 ) ) ( not ( = ?auto_1129685 ?auto_1129687 ) ) ( not ( = ?auto_1129691 ?auto_1129692 ) ) ( HOIST-AT ?auto_1129690 ?auto_1129691 ) ( not ( = ?auto_1129693 ?auto_1129690 ) ) ( SURFACE-AT ?auto_1129687 ?auto_1129691 ) ( ON ?auto_1129687 ?auto_1129688 ) ( CLEAR ?auto_1129687 ) ( not ( = ?auto_1129686 ?auto_1129688 ) ) ( not ( = ?auto_1129687 ?auto_1129688 ) ) ( not ( = ?auto_1129685 ?auto_1129688 ) ) ( SURFACE-AT ?auto_1129685 ?auto_1129692 ) ( CLEAR ?auto_1129685 ) ( IS-CRATE ?auto_1129686 ) ( AVAILABLE ?auto_1129693 ) ( TRUCK-AT ?auto_1129689 ?auto_1129691 ) ( LIFTING ?auto_1129690 ?auto_1129686 ) ( ON ?auto_1129681 ?auto_1129680 ) ( ON ?auto_1129682 ?auto_1129681 ) ( ON ?auto_1129683 ?auto_1129682 ) ( ON ?auto_1129684 ?auto_1129683 ) ( ON ?auto_1129685 ?auto_1129684 ) ( not ( = ?auto_1129680 ?auto_1129681 ) ) ( not ( = ?auto_1129680 ?auto_1129682 ) ) ( not ( = ?auto_1129680 ?auto_1129683 ) ) ( not ( = ?auto_1129680 ?auto_1129684 ) ) ( not ( = ?auto_1129680 ?auto_1129685 ) ) ( not ( = ?auto_1129680 ?auto_1129686 ) ) ( not ( = ?auto_1129680 ?auto_1129687 ) ) ( not ( = ?auto_1129680 ?auto_1129688 ) ) ( not ( = ?auto_1129681 ?auto_1129682 ) ) ( not ( = ?auto_1129681 ?auto_1129683 ) ) ( not ( = ?auto_1129681 ?auto_1129684 ) ) ( not ( = ?auto_1129681 ?auto_1129685 ) ) ( not ( = ?auto_1129681 ?auto_1129686 ) ) ( not ( = ?auto_1129681 ?auto_1129687 ) ) ( not ( = ?auto_1129681 ?auto_1129688 ) ) ( not ( = ?auto_1129682 ?auto_1129683 ) ) ( not ( = ?auto_1129682 ?auto_1129684 ) ) ( not ( = ?auto_1129682 ?auto_1129685 ) ) ( not ( = ?auto_1129682 ?auto_1129686 ) ) ( not ( = ?auto_1129682 ?auto_1129687 ) ) ( not ( = ?auto_1129682 ?auto_1129688 ) ) ( not ( = ?auto_1129683 ?auto_1129684 ) ) ( not ( = ?auto_1129683 ?auto_1129685 ) ) ( not ( = ?auto_1129683 ?auto_1129686 ) ) ( not ( = ?auto_1129683 ?auto_1129687 ) ) ( not ( = ?auto_1129683 ?auto_1129688 ) ) ( not ( = ?auto_1129684 ?auto_1129685 ) ) ( not ( = ?auto_1129684 ?auto_1129686 ) ) ( not ( = ?auto_1129684 ?auto_1129687 ) ) ( not ( = ?auto_1129684 ?auto_1129688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129685 ?auto_1129686 ?auto_1129687 )
      ( MAKE-7CRATE-VERIFY ?auto_1129680 ?auto_1129681 ?auto_1129682 ?auto_1129683 ?auto_1129684 ?auto_1129685 ?auto_1129686 ?auto_1129687 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1129694 - SURFACE
      ?auto_1129695 - SURFACE
      ?auto_1129696 - SURFACE
      ?auto_1129697 - SURFACE
      ?auto_1129698 - SURFACE
      ?auto_1129699 - SURFACE
      ?auto_1129700 - SURFACE
      ?auto_1129701 - SURFACE
      ?auto_1129702 - SURFACE
    )
    :vars
    (
      ?auto_1129708 - HOIST
      ?auto_1129707 - PLACE
      ?auto_1129706 - PLACE
      ?auto_1129705 - HOIST
      ?auto_1129703 - SURFACE
      ?auto_1129704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129708 ?auto_1129707 ) ( IS-CRATE ?auto_1129702 ) ( not ( = ?auto_1129701 ?auto_1129702 ) ) ( not ( = ?auto_1129700 ?auto_1129701 ) ) ( not ( = ?auto_1129700 ?auto_1129702 ) ) ( not ( = ?auto_1129706 ?auto_1129707 ) ) ( HOIST-AT ?auto_1129705 ?auto_1129706 ) ( not ( = ?auto_1129708 ?auto_1129705 ) ) ( SURFACE-AT ?auto_1129702 ?auto_1129706 ) ( ON ?auto_1129702 ?auto_1129703 ) ( CLEAR ?auto_1129702 ) ( not ( = ?auto_1129701 ?auto_1129703 ) ) ( not ( = ?auto_1129702 ?auto_1129703 ) ) ( not ( = ?auto_1129700 ?auto_1129703 ) ) ( SURFACE-AT ?auto_1129700 ?auto_1129707 ) ( CLEAR ?auto_1129700 ) ( IS-CRATE ?auto_1129701 ) ( AVAILABLE ?auto_1129708 ) ( TRUCK-AT ?auto_1129704 ?auto_1129706 ) ( LIFTING ?auto_1129705 ?auto_1129701 ) ( ON ?auto_1129695 ?auto_1129694 ) ( ON ?auto_1129696 ?auto_1129695 ) ( ON ?auto_1129697 ?auto_1129696 ) ( ON ?auto_1129698 ?auto_1129697 ) ( ON ?auto_1129699 ?auto_1129698 ) ( ON ?auto_1129700 ?auto_1129699 ) ( not ( = ?auto_1129694 ?auto_1129695 ) ) ( not ( = ?auto_1129694 ?auto_1129696 ) ) ( not ( = ?auto_1129694 ?auto_1129697 ) ) ( not ( = ?auto_1129694 ?auto_1129698 ) ) ( not ( = ?auto_1129694 ?auto_1129699 ) ) ( not ( = ?auto_1129694 ?auto_1129700 ) ) ( not ( = ?auto_1129694 ?auto_1129701 ) ) ( not ( = ?auto_1129694 ?auto_1129702 ) ) ( not ( = ?auto_1129694 ?auto_1129703 ) ) ( not ( = ?auto_1129695 ?auto_1129696 ) ) ( not ( = ?auto_1129695 ?auto_1129697 ) ) ( not ( = ?auto_1129695 ?auto_1129698 ) ) ( not ( = ?auto_1129695 ?auto_1129699 ) ) ( not ( = ?auto_1129695 ?auto_1129700 ) ) ( not ( = ?auto_1129695 ?auto_1129701 ) ) ( not ( = ?auto_1129695 ?auto_1129702 ) ) ( not ( = ?auto_1129695 ?auto_1129703 ) ) ( not ( = ?auto_1129696 ?auto_1129697 ) ) ( not ( = ?auto_1129696 ?auto_1129698 ) ) ( not ( = ?auto_1129696 ?auto_1129699 ) ) ( not ( = ?auto_1129696 ?auto_1129700 ) ) ( not ( = ?auto_1129696 ?auto_1129701 ) ) ( not ( = ?auto_1129696 ?auto_1129702 ) ) ( not ( = ?auto_1129696 ?auto_1129703 ) ) ( not ( = ?auto_1129697 ?auto_1129698 ) ) ( not ( = ?auto_1129697 ?auto_1129699 ) ) ( not ( = ?auto_1129697 ?auto_1129700 ) ) ( not ( = ?auto_1129697 ?auto_1129701 ) ) ( not ( = ?auto_1129697 ?auto_1129702 ) ) ( not ( = ?auto_1129697 ?auto_1129703 ) ) ( not ( = ?auto_1129698 ?auto_1129699 ) ) ( not ( = ?auto_1129698 ?auto_1129700 ) ) ( not ( = ?auto_1129698 ?auto_1129701 ) ) ( not ( = ?auto_1129698 ?auto_1129702 ) ) ( not ( = ?auto_1129698 ?auto_1129703 ) ) ( not ( = ?auto_1129699 ?auto_1129700 ) ) ( not ( = ?auto_1129699 ?auto_1129701 ) ) ( not ( = ?auto_1129699 ?auto_1129702 ) ) ( not ( = ?auto_1129699 ?auto_1129703 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129700 ?auto_1129701 ?auto_1129702 )
      ( MAKE-8CRATE-VERIFY ?auto_1129694 ?auto_1129695 ?auto_1129696 ?auto_1129697 ?auto_1129698 ?auto_1129699 ?auto_1129700 ?auto_1129701 ?auto_1129702 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1129709 - SURFACE
      ?auto_1129710 - SURFACE
      ?auto_1129711 - SURFACE
      ?auto_1129712 - SURFACE
      ?auto_1129713 - SURFACE
      ?auto_1129714 - SURFACE
      ?auto_1129715 - SURFACE
      ?auto_1129716 - SURFACE
      ?auto_1129717 - SURFACE
      ?auto_1129718 - SURFACE
    )
    :vars
    (
      ?auto_1129724 - HOIST
      ?auto_1129723 - PLACE
      ?auto_1129722 - PLACE
      ?auto_1129721 - HOIST
      ?auto_1129719 - SURFACE
      ?auto_1129720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129724 ?auto_1129723 ) ( IS-CRATE ?auto_1129718 ) ( not ( = ?auto_1129717 ?auto_1129718 ) ) ( not ( = ?auto_1129716 ?auto_1129717 ) ) ( not ( = ?auto_1129716 ?auto_1129718 ) ) ( not ( = ?auto_1129722 ?auto_1129723 ) ) ( HOIST-AT ?auto_1129721 ?auto_1129722 ) ( not ( = ?auto_1129724 ?auto_1129721 ) ) ( SURFACE-AT ?auto_1129718 ?auto_1129722 ) ( ON ?auto_1129718 ?auto_1129719 ) ( CLEAR ?auto_1129718 ) ( not ( = ?auto_1129717 ?auto_1129719 ) ) ( not ( = ?auto_1129718 ?auto_1129719 ) ) ( not ( = ?auto_1129716 ?auto_1129719 ) ) ( SURFACE-AT ?auto_1129716 ?auto_1129723 ) ( CLEAR ?auto_1129716 ) ( IS-CRATE ?auto_1129717 ) ( AVAILABLE ?auto_1129724 ) ( TRUCK-AT ?auto_1129720 ?auto_1129722 ) ( LIFTING ?auto_1129721 ?auto_1129717 ) ( ON ?auto_1129710 ?auto_1129709 ) ( ON ?auto_1129711 ?auto_1129710 ) ( ON ?auto_1129712 ?auto_1129711 ) ( ON ?auto_1129713 ?auto_1129712 ) ( ON ?auto_1129714 ?auto_1129713 ) ( ON ?auto_1129715 ?auto_1129714 ) ( ON ?auto_1129716 ?auto_1129715 ) ( not ( = ?auto_1129709 ?auto_1129710 ) ) ( not ( = ?auto_1129709 ?auto_1129711 ) ) ( not ( = ?auto_1129709 ?auto_1129712 ) ) ( not ( = ?auto_1129709 ?auto_1129713 ) ) ( not ( = ?auto_1129709 ?auto_1129714 ) ) ( not ( = ?auto_1129709 ?auto_1129715 ) ) ( not ( = ?auto_1129709 ?auto_1129716 ) ) ( not ( = ?auto_1129709 ?auto_1129717 ) ) ( not ( = ?auto_1129709 ?auto_1129718 ) ) ( not ( = ?auto_1129709 ?auto_1129719 ) ) ( not ( = ?auto_1129710 ?auto_1129711 ) ) ( not ( = ?auto_1129710 ?auto_1129712 ) ) ( not ( = ?auto_1129710 ?auto_1129713 ) ) ( not ( = ?auto_1129710 ?auto_1129714 ) ) ( not ( = ?auto_1129710 ?auto_1129715 ) ) ( not ( = ?auto_1129710 ?auto_1129716 ) ) ( not ( = ?auto_1129710 ?auto_1129717 ) ) ( not ( = ?auto_1129710 ?auto_1129718 ) ) ( not ( = ?auto_1129710 ?auto_1129719 ) ) ( not ( = ?auto_1129711 ?auto_1129712 ) ) ( not ( = ?auto_1129711 ?auto_1129713 ) ) ( not ( = ?auto_1129711 ?auto_1129714 ) ) ( not ( = ?auto_1129711 ?auto_1129715 ) ) ( not ( = ?auto_1129711 ?auto_1129716 ) ) ( not ( = ?auto_1129711 ?auto_1129717 ) ) ( not ( = ?auto_1129711 ?auto_1129718 ) ) ( not ( = ?auto_1129711 ?auto_1129719 ) ) ( not ( = ?auto_1129712 ?auto_1129713 ) ) ( not ( = ?auto_1129712 ?auto_1129714 ) ) ( not ( = ?auto_1129712 ?auto_1129715 ) ) ( not ( = ?auto_1129712 ?auto_1129716 ) ) ( not ( = ?auto_1129712 ?auto_1129717 ) ) ( not ( = ?auto_1129712 ?auto_1129718 ) ) ( not ( = ?auto_1129712 ?auto_1129719 ) ) ( not ( = ?auto_1129713 ?auto_1129714 ) ) ( not ( = ?auto_1129713 ?auto_1129715 ) ) ( not ( = ?auto_1129713 ?auto_1129716 ) ) ( not ( = ?auto_1129713 ?auto_1129717 ) ) ( not ( = ?auto_1129713 ?auto_1129718 ) ) ( not ( = ?auto_1129713 ?auto_1129719 ) ) ( not ( = ?auto_1129714 ?auto_1129715 ) ) ( not ( = ?auto_1129714 ?auto_1129716 ) ) ( not ( = ?auto_1129714 ?auto_1129717 ) ) ( not ( = ?auto_1129714 ?auto_1129718 ) ) ( not ( = ?auto_1129714 ?auto_1129719 ) ) ( not ( = ?auto_1129715 ?auto_1129716 ) ) ( not ( = ?auto_1129715 ?auto_1129717 ) ) ( not ( = ?auto_1129715 ?auto_1129718 ) ) ( not ( = ?auto_1129715 ?auto_1129719 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129716 ?auto_1129717 ?auto_1129718 )
      ( MAKE-9CRATE-VERIFY ?auto_1129709 ?auto_1129710 ?auto_1129711 ?auto_1129712 ?auto_1129713 ?auto_1129714 ?auto_1129715 ?auto_1129716 ?auto_1129717 ?auto_1129718 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1129725 - SURFACE
      ?auto_1129726 - SURFACE
      ?auto_1129727 - SURFACE
      ?auto_1129728 - SURFACE
      ?auto_1129729 - SURFACE
      ?auto_1129730 - SURFACE
      ?auto_1129731 - SURFACE
      ?auto_1129732 - SURFACE
      ?auto_1129733 - SURFACE
      ?auto_1129734 - SURFACE
      ?auto_1129735 - SURFACE
    )
    :vars
    (
      ?auto_1129741 - HOIST
      ?auto_1129740 - PLACE
      ?auto_1129739 - PLACE
      ?auto_1129738 - HOIST
      ?auto_1129736 - SURFACE
      ?auto_1129737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129741 ?auto_1129740 ) ( IS-CRATE ?auto_1129735 ) ( not ( = ?auto_1129734 ?auto_1129735 ) ) ( not ( = ?auto_1129733 ?auto_1129734 ) ) ( not ( = ?auto_1129733 ?auto_1129735 ) ) ( not ( = ?auto_1129739 ?auto_1129740 ) ) ( HOIST-AT ?auto_1129738 ?auto_1129739 ) ( not ( = ?auto_1129741 ?auto_1129738 ) ) ( SURFACE-AT ?auto_1129735 ?auto_1129739 ) ( ON ?auto_1129735 ?auto_1129736 ) ( CLEAR ?auto_1129735 ) ( not ( = ?auto_1129734 ?auto_1129736 ) ) ( not ( = ?auto_1129735 ?auto_1129736 ) ) ( not ( = ?auto_1129733 ?auto_1129736 ) ) ( SURFACE-AT ?auto_1129733 ?auto_1129740 ) ( CLEAR ?auto_1129733 ) ( IS-CRATE ?auto_1129734 ) ( AVAILABLE ?auto_1129741 ) ( TRUCK-AT ?auto_1129737 ?auto_1129739 ) ( LIFTING ?auto_1129738 ?auto_1129734 ) ( ON ?auto_1129726 ?auto_1129725 ) ( ON ?auto_1129727 ?auto_1129726 ) ( ON ?auto_1129728 ?auto_1129727 ) ( ON ?auto_1129729 ?auto_1129728 ) ( ON ?auto_1129730 ?auto_1129729 ) ( ON ?auto_1129731 ?auto_1129730 ) ( ON ?auto_1129732 ?auto_1129731 ) ( ON ?auto_1129733 ?auto_1129732 ) ( not ( = ?auto_1129725 ?auto_1129726 ) ) ( not ( = ?auto_1129725 ?auto_1129727 ) ) ( not ( = ?auto_1129725 ?auto_1129728 ) ) ( not ( = ?auto_1129725 ?auto_1129729 ) ) ( not ( = ?auto_1129725 ?auto_1129730 ) ) ( not ( = ?auto_1129725 ?auto_1129731 ) ) ( not ( = ?auto_1129725 ?auto_1129732 ) ) ( not ( = ?auto_1129725 ?auto_1129733 ) ) ( not ( = ?auto_1129725 ?auto_1129734 ) ) ( not ( = ?auto_1129725 ?auto_1129735 ) ) ( not ( = ?auto_1129725 ?auto_1129736 ) ) ( not ( = ?auto_1129726 ?auto_1129727 ) ) ( not ( = ?auto_1129726 ?auto_1129728 ) ) ( not ( = ?auto_1129726 ?auto_1129729 ) ) ( not ( = ?auto_1129726 ?auto_1129730 ) ) ( not ( = ?auto_1129726 ?auto_1129731 ) ) ( not ( = ?auto_1129726 ?auto_1129732 ) ) ( not ( = ?auto_1129726 ?auto_1129733 ) ) ( not ( = ?auto_1129726 ?auto_1129734 ) ) ( not ( = ?auto_1129726 ?auto_1129735 ) ) ( not ( = ?auto_1129726 ?auto_1129736 ) ) ( not ( = ?auto_1129727 ?auto_1129728 ) ) ( not ( = ?auto_1129727 ?auto_1129729 ) ) ( not ( = ?auto_1129727 ?auto_1129730 ) ) ( not ( = ?auto_1129727 ?auto_1129731 ) ) ( not ( = ?auto_1129727 ?auto_1129732 ) ) ( not ( = ?auto_1129727 ?auto_1129733 ) ) ( not ( = ?auto_1129727 ?auto_1129734 ) ) ( not ( = ?auto_1129727 ?auto_1129735 ) ) ( not ( = ?auto_1129727 ?auto_1129736 ) ) ( not ( = ?auto_1129728 ?auto_1129729 ) ) ( not ( = ?auto_1129728 ?auto_1129730 ) ) ( not ( = ?auto_1129728 ?auto_1129731 ) ) ( not ( = ?auto_1129728 ?auto_1129732 ) ) ( not ( = ?auto_1129728 ?auto_1129733 ) ) ( not ( = ?auto_1129728 ?auto_1129734 ) ) ( not ( = ?auto_1129728 ?auto_1129735 ) ) ( not ( = ?auto_1129728 ?auto_1129736 ) ) ( not ( = ?auto_1129729 ?auto_1129730 ) ) ( not ( = ?auto_1129729 ?auto_1129731 ) ) ( not ( = ?auto_1129729 ?auto_1129732 ) ) ( not ( = ?auto_1129729 ?auto_1129733 ) ) ( not ( = ?auto_1129729 ?auto_1129734 ) ) ( not ( = ?auto_1129729 ?auto_1129735 ) ) ( not ( = ?auto_1129729 ?auto_1129736 ) ) ( not ( = ?auto_1129730 ?auto_1129731 ) ) ( not ( = ?auto_1129730 ?auto_1129732 ) ) ( not ( = ?auto_1129730 ?auto_1129733 ) ) ( not ( = ?auto_1129730 ?auto_1129734 ) ) ( not ( = ?auto_1129730 ?auto_1129735 ) ) ( not ( = ?auto_1129730 ?auto_1129736 ) ) ( not ( = ?auto_1129731 ?auto_1129732 ) ) ( not ( = ?auto_1129731 ?auto_1129733 ) ) ( not ( = ?auto_1129731 ?auto_1129734 ) ) ( not ( = ?auto_1129731 ?auto_1129735 ) ) ( not ( = ?auto_1129731 ?auto_1129736 ) ) ( not ( = ?auto_1129732 ?auto_1129733 ) ) ( not ( = ?auto_1129732 ?auto_1129734 ) ) ( not ( = ?auto_1129732 ?auto_1129735 ) ) ( not ( = ?auto_1129732 ?auto_1129736 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129733 ?auto_1129734 ?auto_1129735 )
      ( MAKE-10CRATE-VERIFY ?auto_1129725 ?auto_1129726 ?auto_1129727 ?auto_1129728 ?auto_1129729 ?auto_1129730 ?auto_1129731 ?auto_1129732 ?auto_1129733 ?auto_1129734 ?auto_1129735 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1129742 - SURFACE
      ?auto_1129743 - SURFACE
    )
    :vars
    (
      ?auto_1129750 - HOIST
      ?auto_1129749 - PLACE
      ?auto_1129747 - SURFACE
      ?auto_1129748 - PLACE
      ?auto_1129746 - HOIST
      ?auto_1129744 - SURFACE
      ?auto_1129745 - TRUCK
      ?auto_1129751 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129750 ?auto_1129749 ) ( IS-CRATE ?auto_1129743 ) ( not ( = ?auto_1129742 ?auto_1129743 ) ) ( not ( = ?auto_1129747 ?auto_1129742 ) ) ( not ( = ?auto_1129747 ?auto_1129743 ) ) ( not ( = ?auto_1129748 ?auto_1129749 ) ) ( HOIST-AT ?auto_1129746 ?auto_1129748 ) ( not ( = ?auto_1129750 ?auto_1129746 ) ) ( SURFACE-AT ?auto_1129743 ?auto_1129748 ) ( ON ?auto_1129743 ?auto_1129744 ) ( CLEAR ?auto_1129743 ) ( not ( = ?auto_1129742 ?auto_1129744 ) ) ( not ( = ?auto_1129743 ?auto_1129744 ) ) ( not ( = ?auto_1129747 ?auto_1129744 ) ) ( SURFACE-AT ?auto_1129747 ?auto_1129749 ) ( CLEAR ?auto_1129747 ) ( IS-CRATE ?auto_1129742 ) ( AVAILABLE ?auto_1129750 ) ( TRUCK-AT ?auto_1129745 ?auto_1129748 ) ( AVAILABLE ?auto_1129746 ) ( SURFACE-AT ?auto_1129742 ?auto_1129748 ) ( ON ?auto_1129742 ?auto_1129751 ) ( CLEAR ?auto_1129742 ) ( not ( = ?auto_1129742 ?auto_1129751 ) ) ( not ( = ?auto_1129743 ?auto_1129751 ) ) ( not ( = ?auto_1129747 ?auto_1129751 ) ) ( not ( = ?auto_1129744 ?auto_1129751 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1129746 ?auto_1129742 ?auto_1129751 ?auto_1129748 )
      ( MAKE-2CRATE ?auto_1129747 ?auto_1129742 ?auto_1129743 )
      ( MAKE-1CRATE-VERIFY ?auto_1129742 ?auto_1129743 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1129752 - SURFACE
      ?auto_1129753 - SURFACE
      ?auto_1129754 - SURFACE
    )
    :vars
    (
      ?auto_1129759 - HOIST
      ?auto_1129757 - PLACE
      ?auto_1129755 - PLACE
      ?auto_1129760 - HOIST
      ?auto_1129758 - SURFACE
      ?auto_1129761 - TRUCK
      ?auto_1129756 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129759 ?auto_1129757 ) ( IS-CRATE ?auto_1129754 ) ( not ( = ?auto_1129753 ?auto_1129754 ) ) ( not ( = ?auto_1129752 ?auto_1129753 ) ) ( not ( = ?auto_1129752 ?auto_1129754 ) ) ( not ( = ?auto_1129755 ?auto_1129757 ) ) ( HOIST-AT ?auto_1129760 ?auto_1129755 ) ( not ( = ?auto_1129759 ?auto_1129760 ) ) ( SURFACE-AT ?auto_1129754 ?auto_1129755 ) ( ON ?auto_1129754 ?auto_1129758 ) ( CLEAR ?auto_1129754 ) ( not ( = ?auto_1129753 ?auto_1129758 ) ) ( not ( = ?auto_1129754 ?auto_1129758 ) ) ( not ( = ?auto_1129752 ?auto_1129758 ) ) ( SURFACE-AT ?auto_1129752 ?auto_1129757 ) ( CLEAR ?auto_1129752 ) ( IS-CRATE ?auto_1129753 ) ( AVAILABLE ?auto_1129759 ) ( TRUCK-AT ?auto_1129761 ?auto_1129755 ) ( AVAILABLE ?auto_1129760 ) ( SURFACE-AT ?auto_1129753 ?auto_1129755 ) ( ON ?auto_1129753 ?auto_1129756 ) ( CLEAR ?auto_1129753 ) ( not ( = ?auto_1129753 ?auto_1129756 ) ) ( not ( = ?auto_1129754 ?auto_1129756 ) ) ( not ( = ?auto_1129752 ?auto_1129756 ) ) ( not ( = ?auto_1129758 ?auto_1129756 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1129753 ?auto_1129754 )
      ( MAKE-2CRATE-VERIFY ?auto_1129752 ?auto_1129753 ?auto_1129754 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1129762 - SURFACE
      ?auto_1129763 - SURFACE
      ?auto_1129764 - SURFACE
      ?auto_1129765 - SURFACE
    )
    :vars
    (
      ?auto_1129771 - HOIST
      ?auto_1129766 - PLACE
      ?auto_1129768 - PLACE
      ?auto_1129767 - HOIST
      ?auto_1129769 - SURFACE
      ?auto_1129770 - TRUCK
      ?auto_1129772 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129771 ?auto_1129766 ) ( IS-CRATE ?auto_1129765 ) ( not ( = ?auto_1129764 ?auto_1129765 ) ) ( not ( = ?auto_1129763 ?auto_1129764 ) ) ( not ( = ?auto_1129763 ?auto_1129765 ) ) ( not ( = ?auto_1129768 ?auto_1129766 ) ) ( HOIST-AT ?auto_1129767 ?auto_1129768 ) ( not ( = ?auto_1129771 ?auto_1129767 ) ) ( SURFACE-AT ?auto_1129765 ?auto_1129768 ) ( ON ?auto_1129765 ?auto_1129769 ) ( CLEAR ?auto_1129765 ) ( not ( = ?auto_1129764 ?auto_1129769 ) ) ( not ( = ?auto_1129765 ?auto_1129769 ) ) ( not ( = ?auto_1129763 ?auto_1129769 ) ) ( SURFACE-AT ?auto_1129763 ?auto_1129766 ) ( CLEAR ?auto_1129763 ) ( IS-CRATE ?auto_1129764 ) ( AVAILABLE ?auto_1129771 ) ( TRUCK-AT ?auto_1129770 ?auto_1129768 ) ( AVAILABLE ?auto_1129767 ) ( SURFACE-AT ?auto_1129764 ?auto_1129768 ) ( ON ?auto_1129764 ?auto_1129772 ) ( CLEAR ?auto_1129764 ) ( not ( = ?auto_1129764 ?auto_1129772 ) ) ( not ( = ?auto_1129765 ?auto_1129772 ) ) ( not ( = ?auto_1129763 ?auto_1129772 ) ) ( not ( = ?auto_1129769 ?auto_1129772 ) ) ( ON ?auto_1129763 ?auto_1129762 ) ( not ( = ?auto_1129762 ?auto_1129763 ) ) ( not ( = ?auto_1129762 ?auto_1129764 ) ) ( not ( = ?auto_1129762 ?auto_1129765 ) ) ( not ( = ?auto_1129762 ?auto_1129769 ) ) ( not ( = ?auto_1129762 ?auto_1129772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129763 ?auto_1129764 ?auto_1129765 )
      ( MAKE-3CRATE-VERIFY ?auto_1129762 ?auto_1129763 ?auto_1129764 ?auto_1129765 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1129773 - SURFACE
      ?auto_1129774 - SURFACE
      ?auto_1129775 - SURFACE
      ?auto_1129776 - SURFACE
      ?auto_1129777 - SURFACE
    )
    :vars
    (
      ?auto_1129783 - HOIST
      ?auto_1129778 - PLACE
      ?auto_1129780 - PLACE
      ?auto_1129779 - HOIST
      ?auto_1129781 - SURFACE
      ?auto_1129782 - TRUCK
      ?auto_1129784 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129783 ?auto_1129778 ) ( IS-CRATE ?auto_1129777 ) ( not ( = ?auto_1129776 ?auto_1129777 ) ) ( not ( = ?auto_1129775 ?auto_1129776 ) ) ( not ( = ?auto_1129775 ?auto_1129777 ) ) ( not ( = ?auto_1129780 ?auto_1129778 ) ) ( HOIST-AT ?auto_1129779 ?auto_1129780 ) ( not ( = ?auto_1129783 ?auto_1129779 ) ) ( SURFACE-AT ?auto_1129777 ?auto_1129780 ) ( ON ?auto_1129777 ?auto_1129781 ) ( CLEAR ?auto_1129777 ) ( not ( = ?auto_1129776 ?auto_1129781 ) ) ( not ( = ?auto_1129777 ?auto_1129781 ) ) ( not ( = ?auto_1129775 ?auto_1129781 ) ) ( SURFACE-AT ?auto_1129775 ?auto_1129778 ) ( CLEAR ?auto_1129775 ) ( IS-CRATE ?auto_1129776 ) ( AVAILABLE ?auto_1129783 ) ( TRUCK-AT ?auto_1129782 ?auto_1129780 ) ( AVAILABLE ?auto_1129779 ) ( SURFACE-AT ?auto_1129776 ?auto_1129780 ) ( ON ?auto_1129776 ?auto_1129784 ) ( CLEAR ?auto_1129776 ) ( not ( = ?auto_1129776 ?auto_1129784 ) ) ( not ( = ?auto_1129777 ?auto_1129784 ) ) ( not ( = ?auto_1129775 ?auto_1129784 ) ) ( not ( = ?auto_1129781 ?auto_1129784 ) ) ( ON ?auto_1129774 ?auto_1129773 ) ( ON ?auto_1129775 ?auto_1129774 ) ( not ( = ?auto_1129773 ?auto_1129774 ) ) ( not ( = ?auto_1129773 ?auto_1129775 ) ) ( not ( = ?auto_1129773 ?auto_1129776 ) ) ( not ( = ?auto_1129773 ?auto_1129777 ) ) ( not ( = ?auto_1129773 ?auto_1129781 ) ) ( not ( = ?auto_1129773 ?auto_1129784 ) ) ( not ( = ?auto_1129774 ?auto_1129775 ) ) ( not ( = ?auto_1129774 ?auto_1129776 ) ) ( not ( = ?auto_1129774 ?auto_1129777 ) ) ( not ( = ?auto_1129774 ?auto_1129781 ) ) ( not ( = ?auto_1129774 ?auto_1129784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129775 ?auto_1129776 ?auto_1129777 )
      ( MAKE-4CRATE-VERIFY ?auto_1129773 ?auto_1129774 ?auto_1129775 ?auto_1129776 ?auto_1129777 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1129785 - SURFACE
      ?auto_1129786 - SURFACE
      ?auto_1129787 - SURFACE
      ?auto_1129788 - SURFACE
      ?auto_1129789 - SURFACE
      ?auto_1129790 - SURFACE
    )
    :vars
    (
      ?auto_1129796 - HOIST
      ?auto_1129791 - PLACE
      ?auto_1129793 - PLACE
      ?auto_1129792 - HOIST
      ?auto_1129794 - SURFACE
      ?auto_1129795 - TRUCK
      ?auto_1129797 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129796 ?auto_1129791 ) ( IS-CRATE ?auto_1129790 ) ( not ( = ?auto_1129789 ?auto_1129790 ) ) ( not ( = ?auto_1129788 ?auto_1129789 ) ) ( not ( = ?auto_1129788 ?auto_1129790 ) ) ( not ( = ?auto_1129793 ?auto_1129791 ) ) ( HOIST-AT ?auto_1129792 ?auto_1129793 ) ( not ( = ?auto_1129796 ?auto_1129792 ) ) ( SURFACE-AT ?auto_1129790 ?auto_1129793 ) ( ON ?auto_1129790 ?auto_1129794 ) ( CLEAR ?auto_1129790 ) ( not ( = ?auto_1129789 ?auto_1129794 ) ) ( not ( = ?auto_1129790 ?auto_1129794 ) ) ( not ( = ?auto_1129788 ?auto_1129794 ) ) ( SURFACE-AT ?auto_1129788 ?auto_1129791 ) ( CLEAR ?auto_1129788 ) ( IS-CRATE ?auto_1129789 ) ( AVAILABLE ?auto_1129796 ) ( TRUCK-AT ?auto_1129795 ?auto_1129793 ) ( AVAILABLE ?auto_1129792 ) ( SURFACE-AT ?auto_1129789 ?auto_1129793 ) ( ON ?auto_1129789 ?auto_1129797 ) ( CLEAR ?auto_1129789 ) ( not ( = ?auto_1129789 ?auto_1129797 ) ) ( not ( = ?auto_1129790 ?auto_1129797 ) ) ( not ( = ?auto_1129788 ?auto_1129797 ) ) ( not ( = ?auto_1129794 ?auto_1129797 ) ) ( ON ?auto_1129786 ?auto_1129785 ) ( ON ?auto_1129787 ?auto_1129786 ) ( ON ?auto_1129788 ?auto_1129787 ) ( not ( = ?auto_1129785 ?auto_1129786 ) ) ( not ( = ?auto_1129785 ?auto_1129787 ) ) ( not ( = ?auto_1129785 ?auto_1129788 ) ) ( not ( = ?auto_1129785 ?auto_1129789 ) ) ( not ( = ?auto_1129785 ?auto_1129790 ) ) ( not ( = ?auto_1129785 ?auto_1129794 ) ) ( not ( = ?auto_1129785 ?auto_1129797 ) ) ( not ( = ?auto_1129786 ?auto_1129787 ) ) ( not ( = ?auto_1129786 ?auto_1129788 ) ) ( not ( = ?auto_1129786 ?auto_1129789 ) ) ( not ( = ?auto_1129786 ?auto_1129790 ) ) ( not ( = ?auto_1129786 ?auto_1129794 ) ) ( not ( = ?auto_1129786 ?auto_1129797 ) ) ( not ( = ?auto_1129787 ?auto_1129788 ) ) ( not ( = ?auto_1129787 ?auto_1129789 ) ) ( not ( = ?auto_1129787 ?auto_1129790 ) ) ( not ( = ?auto_1129787 ?auto_1129794 ) ) ( not ( = ?auto_1129787 ?auto_1129797 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129788 ?auto_1129789 ?auto_1129790 )
      ( MAKE-5CRATE-VERIFY ?auto_1129785 ?auto_1129786 ?auto_1129787 ?auto_1129788 ?auto_1129789 ?auto_1129790 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1129798 - SURFACE
      ?auto_1129799 - SURFACE
      ?auto_1129800 - SURFACE
      ?auto_1129801 - SURFACE
      ?auto_1129802 - SURFACE
      ?auto_1129803 - SURFACE
      ?auto_1129804 - SURFACE
    )
    :vars
    (
      ?auto_1129810 - HOIST
      ?auto_1129805 - PLACE
      ?auto_1129807 - PLACE
      ?auto_1129806 - HOIST
      ?auto_1129808 - SURFACE
      ?auto_1129809 - TRUCK
      ?auto_1129811 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129810 ?auto_1129805 ) ( IS-CRATE ?auto_1129804 ) ( not ( = ?auto_1129803 ?auto_1129804 ) ) ( not ( = ?auto_1129802 ?auto_1129803 ) ) ( not ( = ?auto_1129802 ?auto_1129804 ) ) ( not ( = ?auto_1129807 ?auto_1129805 ) ) ( HOIST-AT ?auto_1129806 ?auto_1129807 ) ( not ( = ?auto_1129810 ?auto_1129806 ) ) ( SURFACE-AT ?auto_1129804 ?auto_1129807 ) ( ON ?auto_1129804 ?auto_1129808 ) ( CLEAR ?auto_1129804 ) ( not ( = ?auto_1129803 ?auto_1129808 ) ) ( not ( = ?auto_1129804 ?auto_1129808 ) ) ( not ( = ?auto_1129802 ?auto_1129808 ) ) ( SURFACE-AT ?auto_1129802 ?auto_1129805 ) ( CLEAR ?auto_1129802 ) ( IS-CRATE ?auto_1129803 ) ( AVAILABLE ?auto_1129810 ) ( TRUCK-AT ?auto_1129809 ?auto_1129807 ) ( AVAILABLE ?auto_1129806 ) ( SURFACE-AT ?auto_1129803 ?auto_1129807 ) ( ON ?auto_1129803 ?auto_1129811 ) ( CLEAR ?auto_1129803 ) ( not ( = ?auto_1129803 ?auto_1129811 ) ) ( not ( = ?auto_1129804 ?auto_1129811 ) ) ( not ( = ?auto_1129802 ?auto_1129811 ) ) ( not ( = ?auto_1129808 ?auto_1129811 ) ) ( ON ?auto_1129799 ?auto_1129798 ) ( ON ?auto_1129800 ?auto_1129799 ) ( ON ?auto_1129801 ?auto_1129800 ) ( ON ?auto_1129802 ?auto_1129801 ) ( not ( = ?auto_1129798 ?auto_1129799 ) ) ( not ( = ?auto_1129798 ?auto_1129800 ) ) ( not ( = ?auto_1129798 ?auto_1129801 ) ) ( not ( = ?auto_1129798 ?auto_1129802 ) ) ( not ( = ?auto_1129798 ?auto_1129803 ) ) ( not ( = ?auto_1129798 ?auto_1129804 ) ) ( not ( = ?auto_1129798 ?auto_1129808 ) ) ( not ( = ?auto_1129798 ?auto_1129811 ) ) ( not ( = ?auto_1129799 ?auto_1129800 ) ) ( not ( = ?auto_1129799 ?auto_1129801 ) ) ( not ( = ?auto_1129799 ?auto_1129802 ) ) ( not ( = ?auto_1129799 ?auto_1129803 ) ) ( not ( = ?auto_1129799 ?auto_1129804 ) ) ( not ( = ?auto_1129799 ?auto_1129808 ) ) ( not ( = ?auto_1129799 ?auto_1129811 ) ) ( not ( = ?auto_1129800 ?auto_1129801 ) ) ( not ( = ?auto_1129800 ?auto_1129802 ) ) ( not ( = ?auto_1129800 ?auto_1129803 ) ) ( not ( = ?auto_1129800 ?auto_1129804 ) ) ( not ( = ?auto_1129800 ?auto_1129808 ) ) ( not ( = ?auto_1129800 ?auto_1129811 ) ) ( not ( = ?auto_1129801 ?auto_1129802 ) ) ( not ( = ?auto_1129801 ?auto_1129803 ) ) ( not ( = ?auto_1129801 ?auto_1129804 ) ) ( not ( = ?auto_1129801 ?auto_1129808 ) ) ( not ( = ?auto_1129801 ?auto_1129811 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129802 ?auto_1129803 ?auto_1129804 )
      ( MAKE-6CRATE-VERIFY ?auto_1129798 ?auto_1129799 ?auto_1129800 ?auto_1129801 ?auto_1129802 ?auto_1129803 ?auto_1129804 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1129812 - SURFACE
      ?auto_1129813 - SURFACE
      ?auto_1129814 - SURFACE
      ?auto_1129815 - SURFACE
      ?auto_1129816 - SURFACE
      ?auto_1129817 - SURFACE
      ?auto_1129818 - SURFACE
      ?auto_1129819 - SURFACE
    )
    :vars
    (
      ?auto_1129825 - HOIST
      ?auto_1129820 - PLACE
      ?auto_1129822 - PLACE
      ?auto_1129821 - HOIST
      ?auto_1129823 - SURFACE
      ?auto_1129824 - TRUCK
      ?auto_1129826 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129825 ?auto_1129820 ) ( IS-CRATE ?auto_1129819 ) ( not ( = ?auto_1129818 ?auto_1129819 ) ) ( not ( = ?auto_1129817 ?auto_1129818 ) ) ( not ( = ?auto_1129817 ?auto_1129819 ) ) ( not ( = ?auto_1129822 ?auto_1129820 ) ) ( HOIST-AT ?auto_1129821 ?auto_1129822 ) ( not ( = ?auto_1129825 ?auto_1129821 ) ) ( SURFACE-AT ?auto_1129819 ?auto_1129822 ) ( ON ?auto_1129819 ?auto_1129823 ) ( CLEAR ?auto_1129819 ) ( not ( = ?auto_1129818 ?auto_1129823 ) ) ( not ( = ?auto_1129819 ?auto_1129823 ) ) ( not ( = ?auto_1129817 ?auto_1129823 ) ) ( SURFACE-AT ?auto_1129817 ?auto_1129820 ) ( CLEAR ?auto_1129817 ) ( IS-CRATE ?auto_1129818 ) ( AVAILABLE ?auto_1129825 ) ( TRUCK-AT ?auto_1129824 ?auto_1129822 ) ( AVAILABLE ?auto_1129821 ) ( SURFACE-AT ?auto_1129818 ?auto_1129822 ) ( ON ?auto_1129818 ?auto_1129826 ) ( CLEAR ?auto_1129818 ) ( not ( = ?auto_1129818 ?auto_1129826 ) ) ( not ( = ?auto_1129819 ?auto_1129826 ) ) ( not ( = ?auto_1129817 ?auto_1129826 ) ) ( not ( = ?auto_1129823 ?auto_1129826 ) ) ( ON ?auto_1129813 ?auto_1129812 ) ( ON ?auto_1129814 ?auto_1129813 ) ( ON ?auto_1129815 ?auto_1129814 ) ( ON ?auto_1129816 ?auto_1129815 ) ( ON ?auto_1129817 ?auto_1129816 ) ( not ( = ?auto_1129812 ?auto_1129813 ) ) ( not ( = ?auto_1129812 ?auto_1129814 ) ) ( not ( = ?auto_1129812 ?auto_1129815 ) ) ( not ( = ?auto_1129812 ?auto_1129816 ) ) ( not ( = ?auto_1129812 ?auto_1129817 ) ) ( not ( = ?auto_1129812 ?auto_1129818 ) ) ( not ( = ?auto_1129812 ?auto_1129819 ) ) ( not ( = ?auto_1129812 ?auto_1129823 ) ) ( not ( = ?auto_1129812 ?auto_1129826 ) ) ( not ( = ?auto_1129813 ?auto_1129814 ) ) ( not ( = ?auto_1129813 ?auto_1129815 ) ) ( not ( = ?auto_1129813 ?auto_1129816 ) ) ( not ( = ?auto_1129813 ?auto_1129817 ) ) ( not ( = ?auto_1129813 ?auto_1129818 ) ) ( not ( = ?auto_1129813 ?auto_1129819 ) ) ( not ( = ?auto_1129813 ?auto_1129823 ) ) ( not ( = ?auto_1129813 ?auto_1129826 ) ) ( not ( = ?auto_1129814 ?auto_1129815 ) ) ( not ( = ?auto_1129814 ?auto_1129816 ) ) ( not ( = ?auto_1129814 ?auto_1129817 ) ) ( not ( = ?auto_1129814 ?auto_1129818 ) ) ( not ( = ?auto_1129814 ?auto_1129819 ) ) ( not ( = ?auto_1129814 ?auto_1129823 ) ) ( not ( = ?auto_1129814 ?auto_1129826 ) ) ( not ( = ?auto_1129815 ?auto_1129816 ) ) ( not ( = ?auto_1129815 ?auto_1129817 ) ) ( not ( = ?auto_1129815 ?auto_1129818 ) ) ( not ( = ?auto_1129815 ?auto_1129819 ) ) ( not ( = ?auto_1129815 ?auto_1129823 ) ) ( not ( = ?auto_1129815 ?auto_1129826 ) ) ( not ( = ?auto_1129816 ?auto_1129817 ) ) ( not ( = ?auto_1129816 ?auto_1129818 ) ) ( not ( = ?auto_1129816 ?auto_1129819 ) ) ( not ( = ?auto_1129816 ?auto_1129823 ) ) ( not ( = ?auto_1129816 ?auto_1129826 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129817 ?auto_1129818 ?auto_1129819 )
      ( MAKE-7CRATE-VERIFY ?auto_1129812 ?auto_1129813 ?auto_1129814 ?auto_1129815 ?auto_1129816 ?auto_1129817 ?auto_1129818 ?auto_1129819 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1129827 - SURFACE
      ?auto_1129828 - SURFACE
      ?auto_1129829 - SURFACE
      ?auto_1129830 - SURFACE
      ?auto_1129831 - SURFACE
      ?auto_1129832 - SURFACE
      ?auto_1129833 - SURFACE
      ?auto_1129834 - SURFACE
      ?auto_1129835 - SURFACE
    )
    :vars
    (
      ?auto_1129841 - HOIST
      ?auto_1129836 - PLACE
      ?auto_1129838 - PLACE
      ?auto_1129837 - HOIST
      ?auto_1129839 - SURFACE
      ?auto_1129840 - TRUCK
      ?auto_1129842 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129841 ?auto_1129836 ) ( IS-CRATE ?auto_1129835 ) ( not ( = ?auto_1129834 ?auto_1129835 ) ) ( not ( = ?auto_1129833 ?auto_1129834 ) ) ( not ( = ?auto_1129833 ?auto_1129835 ) ) ( not ( = ?auto_1129838 ?auto_1129836 ) ) ( HOIST-AT ?auto_1129837 ?auto_1129838 ) ( not ( = ?auto_1129841 ?auto_1129837 ) ) ( SURFACE-AT ?auto_1129835 ?auto_1129838 ) ( ON ?auto_1129835 ?auto_1129839 ) ( CLEAR ?auto_1129835 ) ( not ( = ?auto_1129834 ?auto_1129839 ) ) ( not ( = ?auto_1129835 ?auto_1129839 ) ) ( not ( = ?auto_1129833 ?auto_1129839 ) ) ( SURFACE-AT ?auto_1129833 ?auto_1129836 ) ( CLEAR ?auto_1129833 ) ( IS-CRATE ?auto_1129834 ) ( AVAILABLE ?auto_1129841 ) ( TRUCK-AT ?auto_1129840 ?auto_1129838 ) ( AVAILABLE ?auto_1129837 ) ( SURFACE-AT ?auto_1129834 ?auto_1129838 ) ( ON ?auto_1129834 ?auto_1129842 ) ( CLEAR ?auto_1129834 ) ( not ( = ?auto_1129834 ?auto_1129842 ) ) ( not ( = ?auto_1129835 ?auto_1129842 ) ) ( not ( = ?auto_1129833 ?auto_1129842 ) ) ( not ( = ?auto_1129839 ?auto_1129842 ) ) ( ON ?auto_1129828 ?auto_1129827 ) ( ON ?auto_1129829 ?auto_1129828 ) ( ON ?auto_1129830 ?auto_1129829 ) ( ON ?auto_1129831 ?auto_1129830 ) ( ON ?auto_1129832 ?auto_1129831 ) ( ON ?auto_1129833 ?auto_1129832 ) ( not ( = ?auto_1129827 ?auto_1129828 ) ) ( not ( = ?auto_1129827 ?auto_1129829 ) ) ( not ( = ?auto_1129827 ?auto_1129830 ) ) ( not ( = ?auto_1129827 ?auto_1129831 ) ) ( not ( = ?auto_1129827 ?auto_1129832 ) ) ( not ( = ?auto_1129827 ?auto_1129833 ) ) ( not ( = ?auto_1129827 ?auto_1129834 ) ) ( not ( = ?auto_1129827 ?auto_1129835 ) ) ( not ( = ?auto_1129827 ?auto_1129839 ) ) ( not ( = ?auto_1129827 ?auto_1129842 ) ) ( not ( = ?auto_1129828 ?auto_1129829 ) ) ( not ( = ?auto_1129828 ?auto_1129830 ) ) ( not ( = ?auto_1129828 ?auto_1129831 ) ) ( not ( = ?auto_1129828 ?auto_1129832 ) ) ( not ( = ?auto_1129828 ?auto_1129833 ) ) ( not ( = ?auto_1129828 ?auto_1129834 ) ) ( not ( = ?auto_1129828 ?auto_1129835 ) ) ( not ( = ?auto_1129828 ?auto_1129839 ) ) ( not ( = ?auto_1129828 ?auto_1129842 ) ) ( not ( = ?auto_1129829 ?auto_1129830 ) ) ( not ( = ?auto_1129829 ?auto_1129831 ) ) ( not ( = ?auto_1129829 ?auto_1129832 ) ) ( not ( = ?auto_1129829 ?auto_1129833 ) ) ( not ( = ?auto_1129829 ?auto_1129834 ) ) ( not ( = ?auto_1129829 ?auto_1129835 ) ) ( not ( = ?auto_1129829 ?auto_1129839 ) ) ( not ( = ?auto_1129829 ?auto_1129842 ) ) ( not ( = ?auto_1129830 ?auto_1129831 ) ) ( not ( = ?auto_1129830 ?auto_1129832 ) ) ( not ( = ?auto_1129830 ?auto_1129833 ) ) ( not ( = ?auto_1129830 ?auto_1129834 ) ) ( not ( = ?auto_1129830 ?auto_1129835 ) ) ( not ( = ?auto_1129830 ?auto_1129839 ) ) ( not ( = ?auto_1129830 ?auto_1129842 ) ) ( not ( = ?auto_1129831 ?auto_1129832 ) ) ( not ( = ?auto_1129831 ?auto_1129833 ) ) ( not ( = ?auto_1129831 ?auto_1129834 ) ) ( not ( = ?auto_1129831 ?auto_1129835 ) ) ( not ( = ?auto_1129831 ?auto_1129839 ) ) ( not ( = ?auto_1129831 ?auto_1129842 ) ) ( not ( = ?auto_1129832 ?auto_1129833 ) ) ( not ( = ?auto_1129832 ?auto_1129834 ) ) ( not ( = ?auto_1129832 ?auto_1129835 ) ) ( not ( = ?auto_1129832 ?auto_1129839 ) ) ( not ( = ?auto_1129832 ?auto_1129842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129833 ?auto_1129834 ?auto_1129835 )
      ( MAKE-8CRATE-VERIFY ?auto_1129827 ?auto_1129828 ?auto_1129829 ?auto_1129830 ?auto_1129831 ?auto_1129832 ?auto_1129833 ?auto_1129834 ?auto_1129835 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1129843 - SURFACE
      ?auto_1129844 - SURFACE
      ?auto_1129845 - SURFACE
      ?auto_1129846 - SURFACE
      ?auto_1129847 - SURFACE
      ?auto_1129848 - SURFACE
      ?auto_1129849 - SURFACE
      ?auto_1129850 - SURFACE
      ?auto_1129851 - SURFACE
      ?auto_1129852 - SURFACE
    )
    :vars
    (
      ?auto_1129858 - HOIST
      ?auto_1129853 - PLACE
      ?auto_1129855 - PLACE
      ?auto_1129854 - HOIST
      ?auto_1129856 - SURFACE
      ?auto_1129857 - TRUCK
      ?auto_1129859 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129858 ?auto_1129853 ) ( IS-CRATE ?auto_1129852 ) ( not ( = ?auto_1129851 ?auto_1129852 ) ) ( not ( = ?auto_1129850 ?auto_1129851 ) ) ( not ( = ?auto_1129850 ?auto_1129852 ) ) ( not ( = ?auto_1129855 ?auto_1129853 ) ) ( HOIST-AT ?auto_1129854 ?auto_1129855 ) ( not ( = ?auto_1129858 ?auto_1129854 ) ) ( SURFACE-AT ?auto_1129852 ?auto_1129855 ) ( ON ?auto_1129852 ?auto_1129856 ) ( CLEAR ?auto_1129852 ) ( not ( = ?auto_1129851 ?auto_1129856 ) ) ( not ( = ?auto_1129852 ?auto_1129856 ) ) ( not ( = ?auto_1129850 ?auto_1129856 ) ) ( SURFACE-AT ?auto_1129850 ?auto_1129853 ) ( CLEAR ?auto_1129850 ) ( IS-CRATE ?auto_1129851 ) ( AVAILABLE ?auto_1129858 ) ( TRUCK-AT ?auto_1129857 ?auto_1129855 ) ( AVAILABLE ?auto_1129854 ) ( SURFACE-AT ?auto_1129851 ?auto_1129855 ) ( ON ?auto_1129851 ?auto_1129859 ) ( CLEAR ?auto_1129851 ) ( not ( = ?auto_1129851 ?auto_1129859 ) ) ( not ( = ?auto_1129852 ?auto_1129859 ) ) ( not ( = ?auto_1129850 ?auto_1129859 ) ) ( not ( = ?auto_1129856 ?auto_1129859 ) ) ( ON ?auto_1129844 ?auto_1129843 ) ( ON ?auto_1129845 ?auto_1129844 ) ( ON ?auto_1129846 ?auto_1129845 ) ( ON ?auto_1129847 ?auto_1129846 ) ( ON ?auto_1129848 ?auto_1129847 ) ( ON ?auto_1129849 ?auto_1129848 ) ( ON ?auto_1129850 ?auto_1129849 ) ( not ( = ?auto_1129843 ?auto_1129844 ) ) ( not ( = ?auto_1129843 ?auto_1129845 ) ) ( not ( = ?auto_1129843 ?auto_1129846 ) ) ( not ( = ?auto_1129843 ?auto_1129847 ) ) ( not ( = ?auto_1129843 ?auto_1129848 ) ) ( not ( = ?auto_1129843 ?auto_1129849 ) ) ( not ( = ?auto_1129843 ?auto_1129850 ) ) ( not ( = ?auto_1129843 ?auto_1129851 ) ) ( not ( = ?auto_1129843 ?auto_1129852 ) ) ( not ( = ?auto_1129843 ?auto_1129856 ) ) ( not ( = ?auto_1129843 ?auto_1129859 ) ) ( not ( = ?auto_1129844 ?auto_1129845 ) ) ( not ( = ?auto_1129844 ?auto_1129846 ) ) ( not ( = ?auto_1129844 ?auto_1129847 ) ) ( not ( = ?auto_1129844 ?auto_1129848 ) ) ( not ( = ?auto_1129844 ?auto_1129849 ) ) ( not ( = ?auto_1129844 ?auto_1129850 ) ) ( not ( = ?auto_1129844 ?auto_1129851 ) ) ( not ( = ?auto_1129844 ?auto_1129852 ) ) ( not ( = ?auto_1129844 ?auto_1129856 ) ) ( not ( = ?auto_1129844 ?auto_1129859 ) ) ( not ( = ?auto_1129845 ?auto_1129846 ) ) ( not ( = ?auto_1129845 ?auto_1129847 ) ) ( not ( = ?auto_1129845 ?auto_1129848 ) ) ( not ( = ?auto_1129845 ?auto_1129849 ) ) ( not ( = ?auto_1129845 ?auto_1129850 ) ) ( not ( = ?auto_1129845 ?auto_1129851 ) ) ( not ( = ?auto_1129845 ?auto_1129852 ) ) ( not ( = ?auto_1129845 ?auto_1129856 ) ) ( not ( = ?auto_1129845 ?auto_1129859 ) ) ( not ( = ?auto_1129846 ?auto_1129847 ) ) ( not ( = ?auto_1129846 ?auto_1129848 ) ) ( not ( = ?auto_1129846 ?auto_1129849 ) ) ( not ( = ?auto_1129846 ?auto_1129850 ) ) ( not ( = ?auto_1129846 ?auto_1129851 ) ) ( not ( = ?auto_1129846 ?auto_1129852 ) ) ( not ( = ?auto_1129846 ?auto_1129856 ) ) ( not ( = ?auto_1129846 ?auto_1129859 ) ) ( not ( = ?auto_1129847 ?auto_1129848 ) ) ( not ( = ?auto_1129847 ?auto_1129849 ) ) ( not ( = ?auto_1129847 ?auto_1129850 ) ) ( not ( = ?auto_1129847 ?auto_1129851 ) ) ( not ( = ?auto_1129847 ?auto_1129852 ) ) ( not ( = ?auto_1129847 ?auto_1129856 ) ) ( not ( = ?auto_1129847 ?auto_1129859 ) ) ( not ( = ?auto_1129848 ?auto_1129849 ) ) ( not ( = ?auto_1129848 ?auto_1129850 ) ) ( not ( = ?auto_1129848 ?auto_1129851 ) ) ( not ( = ?auto_1129848 ?auto_1129852 ) ) ( not ( = ?auto_1129848 ?auto_1129856 ) ) ( not ( = ?auto_1129848 ?auto_1129859 ) ) ( not ( = ?auto_1129849 ?auto_1129850 ) ) ( not ( = ?auto_1129849 ?auto_1129851 ) ) ( not ( = ?auto_1129849 ?auto_1129852 ) ) ( not ( = ?auto_1129849 ?auto_1129856 ) ) ( not ( = ?auto_1129849 ?auto_1129859 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129850 ?auto_1129851 ?auto_1129852 )
      ( MAKE-9CRATE-VERIFY ?auto_1129843 ?auto_1129844 ?auto_1129845 ?auto_1129846 ?auto_1129847 ?auto_1129848 ?auto_1129849 ?auto_1129850 ?auto_1129851 ?auto_1129852 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1129860 - SURFACE
      ?auto_1129861 - SURFACE
      ?auto_1129862 - SURFACE
      ?auto_1129863 - SURFACE
      ?auto_1129864 - SURFACE
      ?auto_1129865 - SURFACE
      ?auto_1129866 - SURFACE
      ?auto_1129867 - SURFACE
      ?auto_1129868 - SURFACE
      ?auto_1129869 - SURFACE
      ?auto_1129870 - SURFACE
    )
    :vars
    (
      ?auto_1129876 - HOIST
      ?auto_1129871 - PLACE
      ?auto_1129873 - PLACE
      ?auto_1129872 - HOIST
      ?auto_1129874 - SURFACE
      ?auto_1129875 - TRUCK
      ?auto_1129877 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129876 ?auto_1129871 ) ( IS-CRATE ?auto_1129870 ) ( not ( = ?auto_1129869 ?auto_1129870 ) ) ( not ( = ?auto_1129868 ?auto_1129869 ) ) ( not ( = ?auto_1129868 ?auto_1129870 ) ) ( not ( = ?auto_1129873 ?auto_1129871 ) ) ( HOIST-AT ?auto_1129872 ?auto_1129873 ) ( not ( = ?auto_1129876 ?auto_1129872 ) ) ( SURFACE-AT ?auto_1129870 ?auto_1129873 ) ( ON ?auto_1129870 ?auto_1129874 ) ( CLEAR ?auto_1129870 ) ( not ( = ?auto_1129869 ?auto_1129874 ) ) ( not ( = ?auto_1129870 ?auto_1129874 ) ) ( not ( = ?auto_1129868 ?auto_1129874 ) ) ( SURFACE-AT ?auto_1129868 ?auto_1129871 ) ( CLEAR ?auto_1129868 ) ( IS-CRATE ?auto_1129869 ) ( AVAILABLE ?auto_1129876 ) ( TRUCK-AT ?auto_1129875 ?auto_1129873 ) ( AVAILABLE ?auto_1129872 ) ( SURFACE-AT ?auto_1129869 ?auto_1129873 ) ( ON ?auto_1129869 ?auto_1129877 ) ( CLEAR ?auto_1129869 ) ( not ( = ?auto_1129869 ?auto_1129877 ) ) ( not ( = ?auto_1129870 ?auto_1129877 ) ) ( not ( = ?auto_1129868 ?auto_1129877 ) ) ( not ( = ?auto_1129874 ?auto_1129877 ) ) ( ON ?auto_1129861 ?auto_1129860 ) ( ON ?auto_1129862 ?auto_1129861 ) ( ON ?auto_1129863 ?auto_1129862 ) ( ON ?auto_1129864 ?auto_1129863 ) ( ON ?auto_1129865 ?auto_1129864 ) ( ON ?auto_1129866 ?auto_1129865 ) ( ON ?auto_1129867 ?auto_1129866 ) ( ON ?auto_1129868 ?auto_1129867 ) ( not ( = ?auto_1129860 ?auto_1129861 ) ) ( not ( = ?auto_1129860 ?auto_1129862 ) ) ( not ( = ?auto_1129860 ?auto_1129863 ) ) ( not ( = ?auto_1129860 ?auto_1129864 ) ) ( not ( = ?auto_1129860 ?auto_1129865 ) ) ( not ( = ?auto_1129860 ?auto_1129866 ) ) ( not ( = ?auto_1129860 ?auto_1129867 ) ) ( not ( = ?auto_1129860 ?auto_1129868 ) ) ( not ( = ?auto_1129860 ?auto_1129869 ) ) ( not ( = ?auto_1129860 ?auto_1129870 ) ) ( not ( = ?auto_1129860 ?auto_1129874 ) ) ( not ( = ?auto_1129860 ?auto_1129877 ) ) ( not ( = ?auto_1129861 ?auto_1129862 ) ) ( not ( = ?auto_1129861 ?auto_1129863 ) ) ( not ( = ?auto_1129861 ?auto_1129864 ) ) ( not ( = ?auto_1129861 ?auto_1129865 ) ) ( not ( = ?auto_1129861 ?auto_1129866 ) ) ( not ( = ?auto_1129861 ?auto_1129867 ) ) ( not ( = ?auto_1129861 ?auto_1129868 ) ) ( not ( = ?auto_1129861 ?auto_1129869 ) ) ( not ( = ?auto_1129861 ?auto_1129870 ) ) ( not ( = ?auto_1129861 ?auto_1129874 ) ) ( not ( = ?auto_1129861 ?auto_1129877 ) ) ( not ( = ?auto_1129862 ?auto_1129863 ) ) ( not ( = ?auto_1129862 ?auto_1129864 ) ) ( not ( = ?auto_1129862 ?auto_1129865 ) ) ( not ( = ?auto_1129862 ?auto_1129866 ) ) ( not ( = ?auto_1129862 ?auto_1129867 ) ) ( not ( = ?auto_1129862 ?auto_1129868 ) ) ( not ( = ?auto_1129862 ?auto_1129869 ) ) ( not ( = ?auto_1129862 ?auto_1129870 ) ) ( not ( = ?auto_1129862 ?auto_1129874 ) ) ( not ( = ?auto_1129862 ?auto_1129877 ) ) ( not ( = ?auto_1129863 ?auto_1129864 ) ) ( not ( = ?auto_1129863 ?auto_1129865 ) ) ( not ( = ?auto_1129863 ?auto_1129866 ) ) ( not ( = ?auto_1129863 ?auto_1129867 ) ) ( not ( = ?auto_1129863 ?auto_1129868 ) ) ( not ( = ?auto_1129863 ?auto_1129869 ) ) ( not ( = ?auto_1129863 ?auto_1129870 ) ) ( not ( = ?auto_1129863 ?auto_1129874 ) ) ( not ( = ?auto_1129863 ?auto_1129877 ) ) ( not ( = ?auto_1129864 ?auto_1129865 ) ) ( not ( = ?auto_1129864 ?auto_1129866 ) ) ( not ( = ?auto_1129864 ?auto_1129867 ) ) ( not ( = ?auto_1129864 ?auto_1129868 ) ) ( not ( = ?auto_1129864 ?auto_1129869 ) ) ( not ( = ?auto_1129864 ?auto_1129870 ) ) ( not ( = ?auto_1129864 ?auto_1129874 ) ) ( not ( = ?auto_1129864 ?auto_1129877 ) ) ( not ( = ?auto_1129865 ?auto_1129866 ) ) ( not ( = ?auto_1129865 ?auto_1129867 ) ) ( not ( = ?auto_1129865 ?auto_1129868 ) ) ( not ( = ?auto_1129865 ?auto_1129869 ) ) ( not ( = ?auto_1129865 ?auto_1129870 ) ) ( not ( = ?auto_1129865 ?auto_1129874 ) ) ( not ( = ?auto_1129865 ?auto_1129877 ) ) ( not ( = ?auto_1129866 ?auto_1129867 ) ) ( not ( = ?auto_1129866 ?auto_1129868 ) ) ( not ( = ?auto_1129866 ?auto_1129869 ) ) ( not ( = ?auto_1129866 ?auto_1129870 ) ) ( not ( = ?auto_1129866 ?auto_1129874 ) ) ( not ( = ?auto_1129866 ?auto_1129877 ) ) ( not ( = ?auto_1129867 ?auto_1129868 ) ) ( not ( = ?auto_1129867 ?auto_1129869 ) ) ( not ( = ?auto_1129867 ?auto_1129870 ) ) ( not ( = ?auto_1129867 ?auto_1129874 ) ) ( not ( = ?auto_1129867 ?auto_1129877 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129868 ?auto_1129869 ?auto_1129870 )
      ( MAKE-10CRATE-VERIFY ?auto_1129860 ?auto_1129861 ?auto_1129862 ?auto_1129863 ?auto_1129864 ?auto_1129865 ?auto_1129866 ?auto_1129867 ?auto_1129868 ?auto_1129869 ?auto_1129870 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1129878 - SURFACE
      ?auto_1129879 - SURFACE
    )
    :vars
    (
      ?auto_1129886 - HOIST
      ?auto_1129880 - PLACE
      ?auto_1129884 - SURFACE
      ?auto_1129882 - PLACE
      ?auto_1129881 - HOIST
      ?auto_1129883 - SURFACE
      ?auto_1129887 - SURFACE
      ?auto_1129885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129886 ?auto_1129880 ) ( IS-CRATE ?auto_1129879 ) ( not ( = ?auto_1129878 ?auto_1129879 ) ) ( not ( = ?auto_1129884 ?auto_1129878 ) ) ( not ( = ?auto_1129884 ?auto_1129879 ) ) ( not ( = ?auto_1129882 ?auto_1129880 ) ) ( HOIST-AT ?auto_1129881 ?auto_1129882 ) ( not ( = ?auto_1129886 ?auto_1129881 ) ) ( SURFACE-AT ?auto_1129879 ?auto_1129882 ) ( ON ?auto_1129879 ?auto_1129883 ) ( CLEAR ?auto_1129879 ) ( not ( = ?auto_1129878 ?auto_1129883 ) ) ( not ( = ?auto_1129879 ?auto_1129883 ) ) ( not ( = ?auto_1129884 ?auto_1129883 ) ) ( SURFACE-AT ?auto_1129884 ?auto_1129880 ) ( CLEAR ?auto_1129884 ) ( IS-CRATE ?auto_1129878 ) ( AVAILABLE ?auto_1129886 ) ( AVAILABLE ?auto_1129881 ) ( SURFACE-AT ?auto_1129878 ?auto_1129882 ) ( ON ?auto_1129878 ?auto_1129887 ) ( CLEAR ?auto_1129878 ) ( not ( = ?auto_1129878 ?auto_1129887 ) ) ( not ( = ?auto_1129879 ?auto_1129887 ) ) ( not ( = ?auto_1129884 ?auto_1129887 ) ) ( not ( = ?auto_1129883 ?auto_1129887 ) ) ( TRUCK-AT ?auto_1129885 ?auto_1129880 ) )
    :subtasks
    ( ( !DRIVE ?auto_1129885 ?auto_1129880 ?auto_1129882 )
      ( MAKE-2CRATE ?auto_1129884 ?auto_1129878 ?auto_1129879 )
      ( MAKE-1CRATE-VERIFY ?auto_1129878 ?auto_1129879 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1129888 - SURFACE
      ?auto_1129889 - SURFACE
      ?auto_1129890 - SURFACE
    )
    :vars
    (
      ?auto_1129891 - HOIST
      ?auto_1129896 - PLACE
      ?auto_1129894 - PLACE
      ?auto_1129895 - HOIST
      ?auto_1129892 - SURFACE
      ?auto_1129893 - SURFACE
      ?auto_1129897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129891 ?auto_1129896 ) ( IS-CRATE ?auto_1129890 ) ( not ( = ?auto_1129889 ?auto_1129890 ) ) ( not ( = ?auto_1129888 ?auto_1129889 ) ) ( not ( = ?auto_1129888 ?auto_1129890 ) ) ( not ( = ?auto_1129894 ?auto_1129896 ) ) ( HOIST-AT ?auto_1129895 ?auto_1129894 ) ( not ( = ?auto_1129891 ?auto_1129895 ) ) ( SURFACE-AT ?auto_1129890 ?auto_1129894 ) ( ON ?auto_1129890 ?auto_1129892 ) ( CLEAR ?auto_1129890 ) ( not ( = ?auto_1129889 ?auto_1129892 ) ) ( not ( = ?auto_1129890 ?auto_1129892 ) ) ( not ( = ?auto_1129888 ?auto_1129892 ) ) ( SURFACE-AT ?auto_1129888 ?auto_1129896 ) ( CLEAR ?auto_1129888 ) ( IS-CRATE ?auto_1129889 ) ( AVAILABLE ?auto_1129891 ) ( AVAILABLE ?auto_1129895 ) ( SURFACE-AT ?auto_1129889 ?auto_1129894 ) ( ON ?auto_1129889 ?auto_1129893 ) ( CLEAR ?auto_1129889 ) ( not ( = ?auto_1129889 ?auto_1129893 ) ) ( not ( = ?auto_1129890 ?auto_1129893 ) ) ( not ( = ?auto_1129888 ?auto_1129893 ) ) ( not ( = ?auto_1129892 ?auto_1129893 ) ) ( TRUCK-AT ?auto_1129897 ?auto_1129896 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1129889 ?auto_1129890 )
      ( MAKE-2CRATE-VERIFY ?auto_1129888 ?auto_1129889 ?auto_1129890 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1129898 - SURFACE
      ?auto_1129899 - SURFACE
      ?auto_1129900 - SURFACE
      ?auto_1129901 - SURFACE
    )
    :vars
    (
      ?auto_1129904 - HOIST
      ?auto_1129902 - PLACE
      ?auto_1129908 - PLACE
      ?auto_1129907 - HOIST
      ?auto_1129905 - SURFACE
      ?auto_1129906 - SURFACE
      ?auto_1129903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129904 ?auto_1129902 ) ( IS-CRATE ?auto_1129901 ) ( not ( = ?auto_1129900 ?auto_1129901 ) ) ( not ( = ?auto_1129899 ?auto_1129900 ) ) ( not ( = ?auto_1129899 ?auto_1129901 ) ) ( not ( = ?auto_1129908 ?auto_1129902 ) ) ( HOIST-AT ?auto_1129907 ?auto_1129908 ) ( not ( = ?auto_1129904 ?auto_1129907 ) ) ( SURFACE-AT ?auto_1129901 ?auto_1129908 ) ( ON ?auto_1129901 ?auto_1129905 ) ( CLEAR ?auto_1129901 ) ( not ( = ?auto_1129900 ?auto_1129905 ) ) ( not ( = ?auto_1129901 ?auto_1129905 ) ) ( not ( = ?auto_1129899 ?auto_1129905 ) ) ( SURFACE-AT ?auto_1129899 ?auto_1129902 ) ( CLEAR ?auto_1129899 ) ( IS-CRATE ?auto_1129900 ) ( AVAILABLE ?auto_1129904 ) ( AVAILABLE ?auto_1129907 ) ( SURFACE-AT ?auto_1129900 ?auto_1129908 ) ( ON ?auto_1129900 ?auto_1129906 ) ( CLEAR ?auto_1129900 ) ( not ( = ?auto_1129900 ?auto_1129906 ) ) ( not ( = ?auto_1129901 ?auto_1129906 ) ) ( not ( = ?auto_1129899 ?auto_1129906 ) ) ( not ( = ?auto_1129905 ?auto_1129906 ) ) ( TRUCK-AT ?auto_1129903 ?auto_1129902 ) ( ON ?auto_1129899 ?auto_1129898 ) ( not ( = ?auto_1129898 ?auto_1129899 ) ) ( not ( = ?auto_1129898 ?auto_1129900 ) ) ( not ( = ?auto_1129898 ?auto_1129901 ) ) ( not ( = ?auto_1129898 ?auto_1129905 ) ) ( not ( = ?auto_1129898 ?auto_1129906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129899 ?auto_1129900 ?auto_1129901 )
      ( MAKE-3CRATE-VERIFY ?auto_1129898 ?auto_1129899 ?auto_1129900 ?auto_1129901 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1129909 - SURFACE
      ?auto_1129910 - SURFACE
      ?auto_1129911 - SURFACE
      ?auto_1129912 - SURFACE
      ?auto_1129913 - SURFACE
    )
    :vars
    (
      ?auto_1129916 - HOIST
      ?auto_1129914 - PLACE
      ?auto_1129920 - PLACE
      ?auto_1129919 - HOIST
      ?auto_1129917 - SURFACE
      ?auto_1129918 - SURFACE
      ?auto_1129915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129916 ?auto_1129914 ) ( IS-CRATE ?auto_1129913 ) ( not ( = ?auto_1129912 ?auto_1129913 ) ) ( not ( = ?auto_1129911 ?auto_1129912 ) ) ( not ( = ?auto_1129911 ?auto_1129913 ) ) ( not ( = ?auto_1129920 ?auto_1129914 ) ) ( HOIST-AT ?auto_1129919 ?auto_1129920 ) ( not ( = ?auto_1129916 ?auto_1129919 ) ) ( SURFACE-AT ?auto_1129913 ?auto_1129920 ) ( ON ?auto_1129913 ?auto_1129917 ) ( CLEAR ?auto_1129913 ) ( not ( = ?auto_1129912 ?auto_1129917 ) ) ( not ( = ?auto_1129913 ?auto_1129917 ) ) ( not ( = ?auto_1129911 ?auto_1129917 ) ) ( SURFACE-AT ?auto_1129911 ?auto_1129914 ) ( CLEAR ?auto_1129911 ) ( IS-CRATE ?auto_1129912 ) ( AVAILABLE ?auto_1129916 ) ( AVAILABLE ?auto_1129919 ) ( SURFACE-AT ?auto_1129912 ?auto_1129920 ) ( ON ?auto_1129912 ?auto_1129918 ) ( CLEAR ?auto_1129912 ) ( not ( = ?auto_1129912 ?auto_1129918 ) ) ( not ( = ?auto_1129913 ?auto_1129918 ) ) ( not ( = ?auto_1129911 ?auto_1129918 ) ) ( not ( = ?auto_1129917 ?auto_1129918 ) ) ( TRUCK-AT ?auto_1129915 ?auto_1129914 ) ( ON ?auto_1129910 ?auto_1129909 ) ( ON ?auto_1129911 ?auto_1129910 ) ( not ( = ?auto_1129909 ?auto_1129910 ) ) ( not ( = ?auto_1129909 ?auto_1129911 ) ) ( not ( = ?auto_1129909 ?auto_1129912 ) ) ( not ( = ?auto_1129909 ?auto_1129913 ) ) ( not ( = ?auto_1129909 ?auto_1129917 ) ) ( not ( = ?auto_1129909 ?auto_1129918 ) ) ( not ( = ?auto_1129910 ?auto_1129911 ) ) ( not ( = ?auto_1129910 ?auto_1129912 ) ) ( not ( = ?auto_1129910 ?auto_1129913 ) ) ( not ( = ?auto_1129910 ?auto_1129917 ) ) ( not ( = ?auto_1129910 ?auto_1129918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129911 ?auto_1129912 ?auto_1129913 )
      ( MAKE-4CRATE-VERIFY ?auto_1129909 ?auto_1129910 ?auto_1129911 ?auto_1129912 ?auto_1129913 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1129921 - SURFACE
      ?auto_1129922 - SURFACE
      ?auto_1129923 - SURFACE
      ?auto_1129924 - SURFACE
      ?auto_1129925 - SURFACE
      ?auto_1129926 - SURFACE
    )
    :vars
    (
      ?auto_1129929 - HOIST
      ?auto_1129927 - PLACE
      ?auto_1129933 - PLACE
      ?auto_1129932 - HOIST
      ?auto_1129930 - SURFACE
      ?auto_1129931 - SURFACE
      ?auto_1129928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129929 ?auto_1129927 ) ( IS-CRATE ?auto_1129926 ) ( not ( = ?auto_1129925 ?auto_1129926 ) ) ( not ( = ?auto_1129924 ?auto_1129925 ) ) ( not ( = ?auto_1129924 ?auto_1129926 ) ) ( not ( = ?auto_1129933 ?auto_1129927 ) ) ( HOIST-AT ?auto_1129932 ?auto_1129933 ) ( not ( = ?auto_1129929 ?auto_1129932 ) ) ( SURFACE-AT ?auto_1129926 ?auto_1129933 ) ( ON ?auto_1129926 ?auto_1129930 ) ( CLEAR ?auto_1129926 ) ( not ( = ?auto_1129925 ?auto_1129930 ) ) ( not ( = ?auto_1129926 ?auto_1129930 ) ) ( not ( = ?auto_1129924 ?auto_1129930 ) ) ( SURFACE-AT ?auto_1129924 ?auto_1129927 ) ( CLEAR ?auto_1129924 ) ( IS-CRATE ?auto_1129925 ) ( AVAILABLE ?auto_1129929 ) ( AVAILABLE ?auto_1129932 ) ( SURFACE-AT ?auto_1129925 ?auto_1129933 ) ( ON ?auto_1129925 ?auto_1129931 ) ( CLEAR ?auto_1129925 ) ( not ( = ?auto_1129925 ?auto_1129931 ) ) ( not ( = ?auto_1129926 ?auto_1129931 ) ) ( not ( = ?auto_1129924 ?auto_1129931 ) ) ( not ( = ?auto_1129930 ?auto_1129931 ) ) ( TRUCK-AT ?auto_1129928 ?auto_1129927 ) ( ON ?auto_1129922 ?auto_1129921 ) ( ON ?auto_1129923 ?auto_1129922 ) ( ON ?auto_1129924 ?auto_1129923 ) ( not ( = ?auto_1129921 ?auto_1129922 ) ) ( not ( = ?auto_1129921 ?auto_1129923 ) ) ( not ( = ?auto_1129921 ?auto_1129924 ) ) ( not ( = ?auto_1129921 ?auto_1129925 ) ) ( not ( = ?auto_1129921 ?auto_1129926 ) ) ( not ( = ?auto_1129921 ?auto_1129930 ) ) ( not ( = ?auto_1129921 ?auto_1129931 ) ) ( not ( = ?auto_1129922 ?auto_1129923 ) ) ( not ( = ?auto_1129922 ?auto_1129924 ) ) ( not ( = ?auto_1129922 ?auto_1129925 ) ) ( not ( = ?auto_1129922 ?auto_1129926 ) ) ( not ( = ?auto_1129922 ?auto_1129930 ) ) ( not ( = ?auto_1129922 ?auto_1129931 ) ) ( not ( = ?auto_1129923 ?auto_1129924 ) ) ( not ( = ?auto_1129923 ?auto_1129925 ) ) ( not ( = ?auto_1129923 ?auto_1129926 ) ) ( not ( = ?auto_1129923 ?auto_1129930 ) ) ( not ( = ?auto_1129923 ?auto_1129931 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129924 ?auto_1129925 ?auto_1129926 )
      ( MAKE-5CRATE-VERIFY ?auto_1129921 ?auto_1129922 ?auto_1129923 ?auto_1129924 ?auto_1129925 ?auto_1129926 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1129934 - SURFACE
      ?auto_1129935 - SURFACE
      ?auto_1129936 - SURFACE
      ?auto_1129937 - SURFACE
      ?auto_1129938 - SURFACE
      ?auto_1129939 - SURFACE
      ?auto_1129940 - SURFACE
    )
    :vars
    (
      ?auto_1129943 - HOIST
      ?auto_1129941 - PLACE
      ?auto_1129947 - PLACE
      ?auto_1129946 - HOIST
      ?auto_1129944 - SURFACE
      ?auto_1129945 - SURFACE
      ?auto_1129942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129943 ?auto_1129941 ) ( IS-CRATE ?auto_1129940 ) ( not ( = ?auto_1129939 ?auto_1129940 ) ) ( not ( = ?auto_1129938 ?auto_1129939 ) ) ( not ( = ?auto_1129938 ?auto_1129940 ) ) ( not ( = ?auto_1129947 ?auto_1129941 ) ) ( HOIST-AT ?auto_1129946 ?auto_1129947 ) ( not ( = ?auto_1129943 ?auto_1129946 ) ) ( SURFACE-AT ?auto_1129940 ?auto_1129947 ) ( ON ?auto_1129940 ?auto_1129944 ) ( CLEAR ?auto_1129940 ) ( not ( = ?auto_1129939 ?auto_1129944 ) ) ( not ( = ?auto_1129940 ?auto_1129944 ) ) ( not ( = ?auto_1129938 ?auto_1129944 ) ) ( SURFACE-AT ?auto_1129938 ?auto_1129941 ) ( CLEAR ?auto_1129938 ) ( IS-CRATE ?auto_1129939 ) ( AVAILABLE ?auto_1129943 ) ( AVAILABLE ?auto_1129946 ) ( SURFACE-AT ?auto_1129939 ?auto_1129947 ) ( ON ?auto_1129939 ?auto_1129945 ) ( CLEAR ?auto_1129939 ) ( not ( = ?auto_1129939 ?auto_1129945 ) ) ( not ( = ?auto_1129940 ?auto_1129945 ) ) ( not ( = ?auto_1129938 ?auto_1129945 ) ) ( not ( = ?auto_1129944 ?auto_1129945 ) ) ( TRUCK-AT ?auto_1129942 ?auto_1129941 ) ( ON ?auto_1129935 ?auto_1129934 ) ( ON ?auto_1129936 ?auto_1129935 ) ( ON ?auto_1129937 ?auto_1129936 ) ( ON ?auto_1129938 ?auto_1129937 ) ( not ( = ?auto_1129934 ?auto_1129935 ) ) ( not ( = ?auto_1129934 ?auto_1129936 ) ) ( not ( = ?auto_1129934 ?auto_1129937 ) ) ( not ( = ?auto_1129934 ?auto_1129938 ) ) ( not ( = ?auto_1129934 ?auto_1129939 ) ) ( not ( = ?auto_1129934 ?auto_1129940 ) ) ( not ( = ?auto_1129934 ?auto_1129944 ) ) ( not ( = ?auto_1129934 ?auto_1129945 ) ) ( not ( = ?auto_1129935 ?auto_1129936 ) ) ( not ( = ?auto_1129935 ?auto_1129937 ) ) ( not ( = ?auto_1129935 ?auto_1129938 ) ) ( not ( = ?auto_1129935 ?auto_1129939 ) ) ( not ( = ?auto_1129935 ?auto_1129940 ) ) ( not ( = ?auto_1129935 ?auto_1129944 ) ) ( not ( = ?auto_1129935 ?auto_1129945 ) ) ( not ( = ?auto_1129936 ?auto_1129937 ) ) ( not ( = ?auto_1129936 ?auto_1129938 ) ) ( not ( = ?auto_1129936 ?auto_1129939 ) ) ( not ( = ?auto_1129936 ?auto_1129940 ) ) ( not ( = ?auto_1129936 ?auto_1129944 ) ) ( not ( = ?auto_1129936 ?auto_1129945 ) ) ( not ( = ?auto_1129937 ?auto_1129938 ) ) ( not ( = ?auto_1129937 ?auto_1129939 ) ) ( not ( = ?auto_1129937 ?auto_1129940 ) ) ( not ( = ?auto_1129937 ?auto_1129944 ) ) ( not ( = ?auto_1129937 ?auto_1129945 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129938 ?auto_1129939 ?auto_1129940 )
      ( MAKE-6CRATE-VERIFY ?auto_1129934 ?auto_1129935 ?auto_1129936 ?auto_1129937 ?auto_1129938 ?auto_1129939 ?auto_1129940 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1129948 - SURFACE
      ?auto_1129949 - SURFACE
      ?auto_1129950 - SURFACE
      ?auto_1129951 - SURFACE
      ?auto_1129952 - SURFACE
      ?auto_1129953 - SURFACE
      ?auto_1129954 - SURFACE
      ?auto_1129955 - SURFACE
    )
    :vars
    (
      ?auto_1129958 - HOIST
      ?auto_1129956 - PLACE
      ?auto_1129962 - PLACE
      ?auto_1129961 - HOIST
      ?auto_1129959 - SURFACE
      ?auto_1129960 - SURFACE
      ?auto_1129957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129958 ?auto_1129956 ) ( IS-CRATE ?auto_1129955 ) ( not ( = ?auto_1129954 ?auto_1129955 ) ) ( not ( = ?auto_1129953 ?auto_1129954 ) ) ( not ( = ?auto_1129953 ?auto_1129955 ) ) ( not ( = ?auto_1129962 ?auto_1129956 ) ) ( HOIST-AT ?auto_1129961 ?auto_1129962 ) ( not ( = ?auto_1129958 ?auto_1129961 ) ) ( SURFACE-AT ?auto_1129955 ?auto_1129962 ) ( ON ?auto_1129955 ?auto_1129959 ) ( CLEAR ?auto_1129955 ) ( not ( = ?auto_1129954 ?auto_1129959 ) ) ( not ( = ?auto_1129955 ?auto_1129959 ) ) ( not ( = ?auto_1129953 ?auto_1129959 ) ) ( SURFACE-AT ?auto_1129953 ?auto_1129956 ) ( CLEAR ?auto_1129953 ) ( IS-CRATE ?auto_1129954 ) ( AVAILABLE ?auto_1129958 ) ( AVAILABLE ?auto_1129961 ) ( SURFACE-AT ?auto_1129954 ?auto_1129962 ) ( ON ?auto_1129954 ?auto_1129960 ) ( CLEAR ?auto_1129954 ) ( not ( = ?auto_1129954 ?auto_1129960 ) ) ( not ( = ?auto_1129955 ?auto_1129960 ) ) ( not ( = ?auto_1129953 ?auto_1129960 ) ) ( not ( = ?auto_1129959 ?auto_1129960 ) ) ( TRUCK-AT ?auto_1129957 ?auto_1129956 ) ( ON ?auto_1129949 ?auto_1129948 ) ( ON ?auto_1129950 ?auto_1129949 ) ( ON ?auto_1129951 ?auto_1129950 ) ( ON ?auto_1129952 ?auto_1129951 ) ( ON ?auto_1129953 ?auto_1129952 ) ( not ( = ?auto_1129948 ?auto_1129949 ) ) ( not ( = ?auto_1129948 ?auto_1129950 ) ) ( not ( = ?auto_1129948 ?auto_1129951 ) ) ( not ( = ?auto_1129948 ?auto_1129952 ) ) ( not ( = ?auto_1129948 ?auto_1129953 ) ) ( not ( = ?auto_1129948 ?auto_1129954 ) ) ( not ( = ?auto_1129948 ?auto_1129955 ) ) ( not ( = ?auto_1129948 ?auto_1129959 ) ) ( not ( = ?auto_1129948 ?auto_1129960 ) ) ( not ( = ?auto_1129949 ?auto_1129950 ) ) ( not ( = ?auto_1129949 ?auto_1129951 ) ) ( not ( = ?auto_1129949 ?auto_1129952 ) ) ( not ( = ?auto_1129949 ?auto_1129953 ) ) ( not ( = ?auto_1129949 ?auto_1129954 ) ) ( not ( = ?auto_1129949 ?auto_1129955 ) ) ( not ( = ?auto_1129949 ?auto_1129959 ) ) ( not ( = ?auto_1129949 ?auto_1129960 ) ) ( not ( = ?auto_1129950 ?auto_1129951 ) ) ( not ( = ?auto_1129950 ?auto_1129952 ) ) ( not ( = ?auto_1129950 ?auto_1129953 ) ) ( not ( = ?auto_1129950 ?auto_1129954 ) ) ( not ( = ?auto_1129950 ?auto_1129955 ) ) ( not ( = ?auto_1129950 ?auto_1129959 ) ) ( not ( = ?auto_1129950 ?auto_1129960 ) ) ( not ( = ?auto_1129951 ?auto_1129952 ) ) ( not ( = ?auto_1129951 ?auto_1129953 ) ) ( not ( = ?auto_1129951 ?auto_1129954 ) ) ( not ( = ?auto_1129951 ?auto_1129955 ) ) ( not ( = ?auto_1129951 ?auto_1129959 ) ) ( not ( = ?auto_1129951 ?auto_1129960 ) ) ( not ( = ?auto_1129952 ?auto_1129953 ) ) ( not ( = ?auto_1129952 ?auto_1129954 ) ) ( not ( = ?auto_1129952 ?auto_1129955 ) ) ( not ( = ?auto_1129952 ?auto_1129959 ) ) ( not ( = ?auto_1129952 ?auto_1129960 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129953 ?auto_1129954 ?auto_1129955 )
      ( MAKE-7CRATE-VERIFY ?auto_1129948 ?auto_1129949 ?auto_1129950 ?auto_1129951 ?auto_1129952 ?auto_1129953 ?auto_1129954 ?auto_1129955 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1129963 - SURFACE
      ?auto_1129964 - SURFACE
      ?auto_1129965 - SURFACE
      ?auto_1129966 - SURFACE
      ?auto_1129967 - SURFACE
      ?auto_1129968 - SURFACE
      ?auto_1129969 - SURFACE
      ?auto_1129970 - SURFACE
      ?auto_1129971 - SURFACE
    )
    :vars
    (
      ?auto_1129974 - HOIST
      ?auto_1129972 - PLACE
      ?auto_1129978 - PLACE
      ?auto_1129977 - HOIST
      ?auto_1129975 - SURFACE
      ?auto_1129976 - SURFACE
      ?auto_1129973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129974 ?auto_1129972 ) ( IS-CRATE ?auto_1129971 ) ( not ( = ?auto_1129970 ?auto_1129971 ) ) ( not ( = ?auto_1129969 ?auto_1129970 ) ) ( not ( = ?auto_1129969 ?auto_1129971 ) ) ( not ( = ?auto_1129978 ?auto_1129972 ) ) ( HOIST-AT ?auto_1129977 ?auto_1129978 ) ( not ( = ?auto_1129974 ?auto_1129977 ) ) ( SURFACE-AT ?auto_1129971 ?auto_1129978 ) ( ON ?auto_1129971 ?auto_1129975 ) ( CLEAR ?auto_1129971 ) ( not ( = ?auto_1129970 ?auto_1129975 ) ) ( not ( = ?auto_1129971 ?auto_1129975 ) ) ( not ( = ?auto_1129969 ?auto_1129975 ) ) ( SURFACE-AT ?auto_1129969 ?auto_1129972 ) ( CLEAR ?auto_1129969 ) ( IS-CRATE ?auto_1129970 ) ( AVAILABLE ?auto_1129974 ) ( AVAILABLE ?auto_1129977 ) ( SURFACE-AT ?auto_1129970 ?auto_1129978 ) ( ON ?auto_1129970 ?auto_1129976 ) ( CLEAR ?auto_1129970 ) ( not ( = ?auto_1129970 ?auto_1129976 ) ) ( not ( = ?auto_1129971 ?auto_1129976 ) ) ( not ( = ?auto_1129969 ?auto_1129976 ) ) ( not ( = ?auto_1129975 ?auto_1129976 ) ) ( TRUCK-AT ?auto_1129973 ?auto_1129972 ) ( ON ?auto_1129964 ?auto_1129963 ) ( ON ?auto_1129965 ?auto_1129964 ) ( ON ?auto_1129966 ?auto_1129965 ) ( ON ?auto_1129967 ?auto_1129966 ) ( ON ?auto_1129968 ?auto_1129967 ) ( ON ?auto_1129969 ?auto_1129968 ) ( not ( = ?auto_1129963 ?auto_1129964 ) ) ( not ( = ?auto_1129963 ?auto_1129965 ) ) ( not ( = ?auto_1129963 ?auto_1129966 ) ) ( not ( = ?auto_1129963 ?auto_1129967 ) ) ( not ( = ?auto_1129963 ?auto_1129968 ) ) ( not ( = ?auto_1129963 ?auto_1129969 ) ) ( not ( = ?auto_1129963 ?auto_1129970 ) ) ( not ( = ?auto_1129963 ?auto_1129971 ) ) ( not ( = ?auto_1129963 ?auto_1129975 ) ) ( not ( = ?auto_1129963 ?auto_1129976 ) ) ( not ( = ?auto_1129964 ?auto_1129965 ) ) ( not ( = ?auto_1129964 ?auto_1129966 ) ) ( not ( = ?auto_1129964 ?auto_1129967 ) ) ( not ( = ?auto_1129964 ?auto_1129968 ) ) ( not ( = ?auto_1129964 ?auto_1129969 ) ) ( not ( = ?auto_1129964 ?auto_1129970 ) ) ( not ( = ?auto_1129964 ?auto_1129971 ) ) ( not ( = ?auto_1129964 ?auto_1129975 ) ) ( not ( = ?auto_1129964 ?auto_1129976 ) ) ( not ( = ?auto_1129965 ?auto_1129966 ) ) ( not ( = ?auto_1129965 ?auto_1129967 ) ) ( not ( = ?auto_1129965 ?auto_1129968 ) ) ( not ( = ?auto_1129965 ?auto_1129969 ) ) ( not ( = ?auto_1129965 ?auto_1129970 ) ) ( not ( = ?auto_1129965 ?auto_1129971 ) ) ( not ( = ?auto_1129965 ?auto_1129975 ) ) ( not ( = ?auto_1129965 ?auto_1129976 ) ) ( not ( = ?auto_1129966 ?auto_1129967 ) ) ( not ( = ?auto_1129966 ?auto_1129968 ) ) ( not ( = ?auto_1129966 ?auto_1129969 ) ) ( not ( = ?auto_1129966 ?auto_1129970 ) ) ( not ( = ?auto_1129966 ?auto_1129971 ) ) ( not ( = ?auto_1129966 ?auto_1129975 ) ) ( not ( = ?auto_1129966 ?auto_1129976 ) ) ( not ( = ?auto_1129967 ?auto_1129968 ) ) ( not ( = ?auto_1129967 ?auto_1129969 ) ) ( not ( = ?auto_1129967 ?auto_1129970 ) ) ( not ( = ?auto_1129967 ?auto_1129971 ) ) ( not ( = ?auto_1129967 ?auto_1129975 ) ) ( not ( = ?auto_1129967 ?auto_1129976 ) ) ( not ( = ?auto_1129968 ?auto_1129969 ) ) ( not ( = ?auto_1129968 ?auto_1129970 ) ) ( not ( = ?auto_1129968 ?auto_1129971 ) ) ( not ( = ?auto_1129968 ?auto_1129975 ) ) ( not ( = ?auto_1129968 ?auto_1129976 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129969 ?auto_1129970 ?auto_1129971 )
      ( MAKE-8CRATE-VERIFY ?auto_1129963 ?auto_1129964 ?auto_1129965 ?auto_1129966 ?auto_1129967 ?auto_1129968 ?auto_1129969 ?auto_1129970 ?auto_1129971 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1129979 - SURFACE
      ?auto_1129980 - SURFACE
      ?auto_1129981 - SURFACE
      ?auto_1129982 - SURFACE
      ?auto_1129983 - SURFACE
      ?auto_1129984 - SURFACE
      ?auto_1129985 - SURFACE
      ?auto_1129986 - SURFACE
      ?auto_1129987 - SURFACE
      ?auto_1129988 - SURFACE
    )
    :vars
    (
      ?auto_1129991 - HOIST
      ?auto_1129989 - PLACE
      ?auto_1129995 - PLACE
      ?auto_1129994 - HOIST
      ?auto_1129992 - SURFACE
      ?auto_1129993 - SURFACE
      ?auto_1129990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129991 ?auto_1129989 ) ( IS-CRATE ?auto_1129988 ) ( not ( = ?auto_1129987 ?auto_1129988 ) ) ( not ( = ?auto_1129986 ?auto_1129987 ) ) ( not ( = ?auto_1129986 ?auto_1129988 ) ) ( not ( = ?auto_1129995 ?auto_1129989 ) ) ( HOIST-AT ?auto_1129994 ?auto_1129995 ) ( not ( = ?auto_1129991 ?auto_1129994 ) ) ( SURFACE-AT ?auto_1129988 ?auto_1129995 ) ( ON ?auto_1129988 ?auto_1129992 ) ( CLEAR ?auto_1129988 ) ( not ( = ?auto_1129987 ?auto_1129992 ) ) ( not ( = ?auto_1129988 ?auto_1129992 ) ) ( not ( = ?auto_1129986 ?auto_1129992 ) ) ( SURFACE-AT ?auto_1129986 ?auto_1129989 ) ( CLEAR ?auto_1129986 ) ( IS-CRATE ?auto_1129987 ) ( AVAILABLE ?auto_1129991 ) ( AVAILABLE ?auto_1129994 ) ( SURFACE-AT ?auto_1129987 ?auto_1129995 ) ( ON ?auto_1129987 ?auto_1129993 ) ( CLEAR ?auto_1129987 ) ( not ( = ?auto_1129987 ?auto_1129993 ) ) ( not ( = ?auto_1129988 ?auto_1129993 ) ) ( not ( = ?auto_1129986 ?auto_1129993 ) ) ( not ( = ?auto_1129992 ?auto_1129993 ) ) ( TRUCK-AT ?auto_1129990 ?auto_1129989 ) ( ON ?auto_1129980 ?auto_1129979 ) ( ON ?auto_1129981 ?auto_1129980 ) ( ON ?auto_1129982 ?auto_1129981 ) ( ON ?auto_1129983 ?auto_1129982 ) ( ON ?auto_1129984 ?auto_1129983 ) ( ON ?auto_1129985 ?auto_1129984 ) ( ON ?auto_1129986 ?auto_1129985 ) ( not ( = ?auto_1129979 ?auto_1129980 ) ) ( not ( = ?auto_1129979 ?auto_1129981 ) ) ( not ( = ?auto_1129979 ?auto_1129982 ) ) ( not ( = ?auto_1129979 ?auto_1129983 ) ) ( not ( = ?auto_1129979 ?auto_1129984 ) ) ( not ( = ?auto_1129979 ?auto_1129985 ) ) ( not ( = ?auto_1129979 ?auto_1129986 ) ) ( not ( = ?auto_1129979 ?auto_1129987 ) ) ( not ( = ?auto_1129979 ?auto_1129988 ) ) ( not ( = ?auto_1129979 ?auto_1129992 ) ) ( not ( = ?auto_1129979 ?auto_1129993 ) ) ( not ( = ?auto_1129980 ?auto_1129981 ) ) ( not ( = ?auto_1129980 ?auto_1129982 ) ) ( not ( = ?auto_1129980 ?auto_1129983 ) ) ( not ( = ?auto_1129980 ?auto_1129984 ) ) ( not ( = ?auto_1129980 ?auto_1129985 ) ) ( not ( = ?auto_1129980 ?auto_1129986 ) ) ( not ( = ?auto_1129980 ?auto_1129987 ) ) ( not ( = ?auto_1129980 ?auto_1129988 ) ) ( not ( = ?auto_1129980 ?auto_1129992 ) ) ( not ( = ?auto_1129980 ?auto_1129993 ) ) ( not ( = ?auto_1129981 ?auto_1129982 ) ) ( not ( = ?auto_1129981 ?auto_1129983 ) ) ( not ( = ?auto_1129981 ?auto_1129984 ) ) ( not ( = ?auto_1129981 ?auto_1129985 ) ) ( not ( = ?auto_1129981 ?auto_1129986 ) ) ( not ( = ?auto_1129981 ?auto_1129987 ) ) ( not ( = ?auto_1129981 ?auto_1129988 ) ) ( not ( = ?auto_1129981 ?auto_1129992 ) ) ( not ( = ?auto_1129981 ?auto_1129993 ) ) ( not ( = ?auto_1129982 ?auto_1129983 ) ) ( not ( = ?auto_1129982 ?auto_1129984 ) ) ( not ( = ?auto_1129982 ?auto_1129985 ) ) ( not ( = ?auto_1129982 ?auto_1129986 ) ) ( not ( = ?auto_1129982 ?auto_1129987 ) ) ( not ( = ?auto_1129982 ?auto_1129988 ) ) ( not ( = ?auto_1129982 ?auto_1129992 ) ) ( not ( = ?auto_1129982 ?auto_1129993 ) ) ( not ( = ?auto_1129983 ?auto_1129984 ) ) ( not ( = ?auto_1129983 ?auto_1129985 ) ) ( not ( = ?auto_1129983 ?auto_1129986 ) ) ( not ( = ?auto_1129983 ?auto_1129987 ) ) ( not ( = ?auto_1129983 ?auto_1129988 ) ) ( not ( = ?auto_1129983 ?auto_1129992 ) ) ( not ( = ?auto_1129983 ?auto_1129993 ) ) ( not ( = ?auto_1129984 ?auto_1129985 ) ) ( not ( = ?auto_1129984 ?auto_1129986 ) ) ( not ( = ?auto_1129984 ?auto_1129987 ) ) ( not ( = ?auto_1129984 ?auto_1129988 ) ) ( not ( = ?auto_1129984 ?auto_1129992 ) ) ( not ( = ?auto_1129984 ?auto_1129993 ) ) ( not ( = ?auto_1129985 ?auto_1129986 ) ) ( not ( = ?auto_1129985 ?auto_1129987 ) ) ( not ( = ?auto_1129985 ?auto_1129988 ) ) ( not ( = ?auto_1129985 ?auto_1129992 ) ) ( not ( = ?auto_1129985 ?auto_1129993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129986 ?auto_1129987 ?auto_1129988 )
      ( MAKE-9CRATE-VERIFY ?auto_1129979 ?auto_1129980 ?auto_1129981 ?auto_1129982 ?auto_1129983 ?auto_1129984 ?auto_1129985 ?auto_1129986 ?auto_1129987 ?auto_1129988 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1129996 - SURFACE
      ?auto_1129997 - SURFACE
      ?auto_1129998 - SURFACE
      ?auto_1129999 - SURFACE
      ?auto_1130000 - SURFACE
      ?auto_1130001 - SURFACE
      ?auto_1130002 - SURFACE
      ?auto_1130003 - SURFACE
      ?auto_1130004 - SURFACE
      ?auto_1130005 - SURFACE
      ?auto_1130006 - SURFACE
    )
    :vars
    (
      ?auto_1130009 - HOIST
      ?auto_1130007 - PLACE
      ?auto_1130013 - PLACE
      ?auto_1130012 - HOIST
      ?auto_1130010 - SURFACE
      ?auto_1130011 - SURFACE
      ?auto_1130008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1130009 ?auto_1130007 ) ( IS-CRATE ?auto_1130006 ) ( not ( = ?auto_1130005 ?auto_1130006 ) ) ( not ( = ?auto_1130004 ?auto_1130005 ) ) ( not ( = ?auto_1130004 ?auto_1130006 ) ) ( not ( = ?auto_1130013 ?auto_1130007 ) ) ( HOIST-AT ?auto_1130012 ?auto_1130013 ) ( not ( = ?auto_1130009 ?auto_1130012 ) ) ( SURFACE-AT ?auto_1130006 ?auto_1130013 ) ( ON ?auto_1130006 ?auto_1130010 ) ( CLEAR ?auto_1130006 ) ( not ( = ?auto_1130005 ?auto_1130010 ) ) ( not ( = ?auto_1130006 ?auto_1130010 ) ) ( not ( = ?auto_1130004 ?auto_1130010 ) ) ( SURFACE-AT ?auto_1130004 ?auto_1130007 ) ( CLEAR ?auto_1130004 ) ( IS-CRATE ?auto_1130005 ) ( AVAILABLE ?auto_1130009 ) ( AVAILABLE ?auto_1130012 ) ( SURFACE-AT ?auto_1130005 ?auto_1130013 ) ( ON ?auto_1130005 ?auto_1130011 ) ( CLEAR ?auto_1130005 ) ( not ( = ?auto_1130005 ?auto_1130011 ) ) ( not ( = ?auto_1130006 ?auto_1130011 ) ) ( not ( = ?auto_1130004 ?auto_1130011 ) ) ( not ( = ?auto_1130010 ?auto_1130011 ) ) ( TRUCK-AT ?auto_1130008 ?auto_1130007 ) ( ON ?auto_1129997 ?auto_1129996 ) ( ON ?auto_1129998 ?auto_1129997 ) ( ON ?auto_1129999 ?auto_1129998 ) ( ON ?auto_1130000 ?auto_1129999 ) ( ON ?auto_1130001 ?auto_1130000 ) ( ON ?auto_1130002 ?auto_1130001 ) ( ON ?auto_1130003 ?auto_1130002 ) ( ON ?auto_1130004 ?auto_1130003 ) ( not ( = ?auto_1129996 ?auto_1129997 ) ) ( not ( = ?auto_1129996 ?auto_1129998 ) ) ( not ( = ?auto_1129996 ?auto_1129999 ) ) ( not ( = ?auto_1129996 ?auto_1130000 ) ) ( not ( = ?auto_1129996 ?auto_1130001 ) ) ( not ( = ?auto_1129996 ?auto_1130002 ) ) ( not ( = ?auto_1129996 ?auto_1130003 ) ) ( not ( = ?auto_1129996 ?auto_1130004 ) ) ( not ( = ?auto_1129996 ?auto_1130005 ) ) ( not ( = ?auto_1129996 ?auto_1130006 ) ) ( not ( = ?auto_1129996 ?auto_1130010 ) ) ( not ( = ?auto_1129996 ?auto_1130011 ) ) ( not ( = ?auto_1129997 ?auto_1129998 ) ) ( not ( = ?auto_1129997 ?auto_1129999 ) ) ( not ( = ?auto_1129997 ?auto_1130000 ) ) ( not ( = ?auto_1129997 ?auto_1130001 ) ) ( not ( = ?auto_1129997 ?auto_1130002 ) ) ( not ( = ?auto_1129997 ?auto_1130003 ) ) ( not ( = ?auto_1129997 ?auto_1130004 ) ) ( not ( = ?auto_1129997 ?auto_1130005 ) ) ( not ( = ?auto_1129997 ?auto_1130006 ) ) ( not ( = ?auto_1129997 ?auto_1130010 ) ) ( not ( = ?auto_1129997 ?auto_1130011 ) ) ( not ( = ?auto_1129998 ?auto_1129999 ) ) ( not ( = ?auto_1129998 ?auto_1130000 ) ) ( not ( = ?auto_1129998 ?auto_1130001 ) ) ( not ( = ?auto_1129998 ?auto_1130002 ) ) ( not ( = ?auto_1129998 ?auto_1130003 ) ) ( not ( = ?auto_1129998 ?auto_1130004 ) ) ( not ( = ?auto_1129998 ?auto_1130005 ) ) ( not ( = ?auto_1129998 ?auto_1130006 ) ) ( not ( = ?auto_1129998 ?auto_1130010 ) ) ( not ( = ?auto_1129998 ?auto_1130011 ) ) ( not ( = ?auto_1129999 ?auto_1130000 ) ) ( not ( = ?auto_1129999 ?auto_1130001 ) ) ( not ( = ?auto_1129999 ?auto_1130002 ) ) ( not ( = ?auto_1129999 ?auto_1130003 ) ) ( not ( = ?auto_1129999 ?auto_1130004 ) ) ( not ( = ?auto_1129999 ?auto_1130005 ) ) ( not ( = ?auto_1129999 ?auto_1130006 ) ) ( not ( = ?auto_1129999 ?auto_1130010 ) ) ( not ( = ?auto_1129999 ?auto_1130011 ) ) ( not ( = ?auto_1130000 ?auto_1130001 ) ) ( not ( = ?auto_1130000 ?auto_1130002 ) ) ( not ( = ?auto_1130000 ?auto_1130003 ) ) ( not ( = ?auto_1130000 ?auto_1130004 ) ) ( not ( = ?auto_1130000 ?auto_1130005 ) ) ( not ( = ?auto_1130000 ?auto_1130006 ) ) ( not ( = ?auto_1130000 ?auto_1130010 ) ) ( not ( = ?auto_1130000 ?auto_1130011 ) ) ( not ( = ?auto_1130001 ?auto_1130002 ) ) ( not ( = ?auto_1130001 ?auto_1130003 ) ) ( not ( = ?auto_1130001 ?auto_1130004 ) ) ( not ( = ?auto_1130001 ?auto_1130005 ) ) ( not ( = ?auto_1130001 ?auto_1130006 ) ) ( not ( = ?auto_1130001 ?auto_1130010 ) ) ( not ( = ?auto_1130001 ?auto_1130011 ) ) ( not ( = ?auto_1130002 ?auto_1130003 ) ) ( not ( = ?auto_1130002 ?auto_1130004 ) ) ( not ( = ?auto_1130002 ?auto_1130005 ) ) ( not ( = ?auto_1130002 ?auto_1130006 ) ) ( not ( = ?auto_1130002 ?auto_1130010 ) ) ( not ( = ?auto_1130002 ?auto_1130011 ) ) ( not ( = ?auto_1130003 ?auto_1130004 ) ) ( not ( = ?auto_1130003 ?auto_1130005 ) ) ( not ( = ?auto_1130003 ?auto_1130006 ) ) ( not ( = ?auto_1130003 ?auto_1130010 ) ) ( not ( = ?auto_1130003 ?auto_1130011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1130004 ?auto_1130005 ?auto_1130006 )
      ( MAKE-10CRATE-VERIFY ?auto_1129996 ?auto_1129997 ?auto_1129998 ?auto_1129999 ?auto_1130000 ?auto_1130001 ?auto_1130002 ?auto_1130003 ?auto_1130004 ?auto_1130005 ?auto_1130006 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1130014 - SURFACE
      ?auto_1130015 - SURFACE
    )
    :vars
    (
      ?auto_1130018 - HOIST
      ?auto_1130016 - PLACE
      ?auto_1130019 - SURFACE
      ?auto_1130023 - PLACE
      ?auto_1130022 - HOIST
      ?auto_1130020 - SURFACE
      ?auto_1130021 - SURFACE
      ?auto_1130017 - TRUCK
      ?auto_1130024 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1130018 ?auto_1130016 ) ( IS-CRATE ?auto_1130015 ) ( not ( = ?auto_1130014 ?auto_1130015 ) ) ( not ( = ?auto_1130019 ?auto_1130014 ) ) ( not ( = ?auto_1130019 ?auto_1130015 ) ) ( not ( = ?auto_1130023 ?auto_1130016 ) ) ( HOIST-AT ?auto_1130022 ?auto_1130023 ) ( not ( = ?auto_1130018 ?auto_1130022 ) ) ( SURFACE-AT ?auto_1130015 ?auto_1130023 ) ( ON ?auto_1130015 ?auto_1130020 ) ( CLEAR ?auto_1130015 ) ( not ( = ?auto_1130014 ?auto_1130020 ) ) ( not ( = ?auto_1130015 ?auto_1130020 ) ) ( not ( = ?auto_1130019 ?auto_1130020 ) ) ( IS-CRATE ?auto_1130014 ) ( AVAILABLE ?auto_1130022 ) ( SURFACE-AT ?auto_1130014 ?auto_1130023 ) ( ON ?auto_1130014 ?auto_1130021 ) ( CLEAR ?auto_1130014 ) ( not ( = ?auto_1130014 ?auto_1130021 ) ) ( not ( = ?auto_1130015 ?auto_1130021 ) ) ( not ( = ?auto_1130019 ?auto_1130021 ) ) ( not ( = ?auto_1130020 ?auto_1130021 ) ) ( TRUCK-AT ?auto_1130017 ?auto_1130016 ) ( SURFACE-AT ?auto_1130024 ?auto_1130016 ) ( CLEAR ?auto_1130024 ) ( LIFTING ?auto_1130018 ?auto_1130019 ) ( IS-CRATE ?auto_1130019 ) ( not ( = ?auto_1130024 ?auto_1130019 ) ) ( not ( = ?auto_1130014 ?auto_1130024 ) ) ( not ( = ?auto_1130015 ?auto_1130024 ) ) ( not ( = ?auto_1130020 ?auto_1130024 ) ) ( not ( = ?auto_1130021 ?auto_1130024 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1130024 ?auto_1130019 )
      ( MAKE-2CRATE ?auto_1130019 ?auto_1130014 ?auto_1130015 )
      ( MAKE-1CRATE-VERIFY ?auto_1130014 ?auto_1130015 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1130025 - SURFACE
      ?auto_1130026 - SURFACE
      ?auto_1130027 - SURFACE
    )
    :vars
    (
      ?auto_1130033 - HOIST
      ?auto_1130034 - PLACE
      ?auto_1130028 - PLACE
      ?auto_1130032 - HOIST
      ?auto_1130031 - SURFACE
      ?auto_1130029 - SURFACE
      ?auto_1130035 - TRUCK
      ?auto_1130030 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1130033 ?auto_1130034 ) ( IS-CRATE ?auto_1130027 ) ( not ( = ?auto_1130026 ?auto_1130027 ) ) ( not ( = ?auto_1130025 ?auto_1130026 ) ) ( not ( = ?auto_1130025 ?auto_1130027 ) ) ( not ( = ?auto_1130028 ?auto_1130034 ) ) ( HOIST-AT ?auto_1130032 ?auto_1130028 ) ( not ( = ?auto_1130033 ?auto_1130032 ) ) ( SURFACE-AT ?auto_1130027 ?auto_1130028 ) ( ON ?auto_1130027 ?auto_1130031 ) ( CLEAR ?auto_1130027 ) ( not ( = ?auto_1130026 ?auto_1130031 ) ) ( not ( = ?auto_1130027 ?auto_1130031 ) ) ( not ( = ?auto_1130025 ?auto_1130031 ) ) ( IS-CRATE ?auto_1130026 ) ( AVAILABLE ?auto_1130032 ) ( SURFACE-AT ?auto_1130026 ?auto_1130028 ) ( ON ?auto_1130026 ?auto_1130029 ) ( CLEAR ?auto_1130026 ) ( not ( = ?auto_1130026 ?auto_1130029 ) ) ( not ( = ?auto_1130027 ?auto_1130029 ) ) ( not ( = ?auto_1130025 ?auto_1130029 ) ) ( not ( = ?auto_1130031 ?auto_1130029 ) ) ( TRUCK-AT ?auto_1130035 ?auto_1130034 ) ( SURFACE-AT ?auto_1130030 ?auto_1130034 ) ( CLEAR ?auto_1130030 ) ( LIFTING ?auto_1130033 ?auto_1130025 ) ( IS-CRATE ?auto_1130025 ) ( not ( = ?auto_1130030 ?auto_1130025 ) ) ( not ( = ?auto_1130026 ?auto_1130030 ) ) ( not ( = ?auto_1130027 ?auto_1130030 ) ) ( not ( = ?auto_1130031 ?auto_1130030 ) ) ( not ( = ?auto_1130029 ?auto_1130030 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1130026 ?auto_1130027 )
      ( MAKE-2CRATE-VERIFY ?auto_1130025 ?auto_1130026 ?auto_1130027 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1130036 - SURFACE
      ?auto_1130037 - SURFACE
      ?auto_1130038 - SURFACE
      ?auto_1130039 - SURFACE
    )
    :vars
    (
      ?auto_1130042 - HOIST
      ?auto_1130043 - PLACE
      ?auto_1130040 - PLACE
      ?auto_1130044 - HOIST
      ?auto_1130046 - SURFACE
      ?auto_1130041 - SURFACE
      ?auto_1130045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1130042 ?auto_1130043 ) ( IS-CRATE ?auto_1130039 ) ( not ( = ?auto_1130038 ?auto_1130039 ) ) ( not ( = ?auto_1130037 ?auto_1130038 ) ) ( not ( = ?auto_1130037 ?auto_1130039 ) ) ( not ( = ?auto_1130040 ?auto_1130043 ) ) ( HOIST-AT ?auto_1130044 ?auto_1130040 ) ( not ( = ?auto_1130042 ?auto_1130044 ) ) ( SURFACE-AT ?auto_1130039 ?auto_1130040 ) ( ON ?auto_1130039 ?auto_1130046 ) ( CLEAR ?auto_1130039 ) ( not ( = ?auto_1130038 ?auto_1130046 ) ) ( not ( = ?auto_1130039 ?auto_1130046 ) ) ( not ( = ?auto_1130037 ?auto_1130046 ) ) ( IS-CRATE ?auto_1130038 ) ( AVAILABLE ?auto_1130044 ) ( SURFACE-AT ?auto_1130038 ?auto_1130040 ) ( ON ?auto_1130038 ?auto_1130041 ) ( CLEAR ?auto_1130038 ) ( not ( = ?auto_1130038 ?auto_1130041 ) ) ( not ( = ?auto_1130039 ?auto_1130041 ) ) ( not ( = ?auto_1130037 ?auto_1130041 ) ) ( not ( = ?auto_1130046 ?auto_1130041 ) ) ( TRUCK-AT ?auto_1130045 ?auto_1130043 ) ( SURFACE-AT ?auto_1130036 ?auto_1130043 ) ( CLEAR ?auto_1130036 ) ( LIFTING ?auto_1130042 ?auto_1130037 ) ( IS-CRATE ?auto_1130037 ) ( not ( = ?auto_1130036 ?auto_1130037 ) ) ( not ( = ?auto_1130038 ?auto_1130036 ) ) ( not ( = ?auto_1130039 ?auto_1130036 ) ) ( not ( = ?auto_1130046 ?auto_1130036 ) ) ( not ( = ?auto_1130041 ?auto_1130036 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1130037 ?auto_1130038 ?auto_1130039 )
      ( MAKE-3CRATE-VERIFY ?auto_1130036 ?auto_1130037 ?auto_1130038 ?auto_1130039 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1130047 - SURFACE
      ?auto_1130048 - SURFACE
      ?auto_1130049 - SURFACE
      ?auto_1130050 - SURFACE
      ?auto_1130051 - SURFACE
    )
    :vars
    (
      ?auto_1130054 - HOIST
      ?auto_1130055 - PLACE
      ?auto_1130052 - PLACE
      ?auto_1130056 - HOIST
      ?auto_1130058 - SURFACE
      ?auto_1130053 - SURFACE
      ?auto_1130057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1130054 ?auto_1130055 ) ( IS-CRATE ?auto_1130051 ) ( not ( = ?auto_1130050 ?auto_1130051 ) ) ( not ( = ?auto_1130049 ?auto_1130050 ) ) ( not ( = ?auto_1130049 ?auto_1130051 ) ) ( not ( = ?auto_1130052 ?auto_1130055 ) ) ( HOIST-AT ?auto_1130056 ?auto_1130052 ) ( not ( = ?auto_1130054 ?auto_1130056 ) ) ( SURFACE-AT ?auto_1130051 ?auto_1130052 ) ( ON ?auto_1130051 ?auto_1130058 ) ( CLEAR ?auto_1130051 ) ( not ( = ?auto_1130050 ?auto_1130058 ) ) ( not ( = ?auto_1130051 ?auto_1130058 ) ) ( not ( = ?auto_1130049 ?auto_1130058 ) ) ( IS-CRATE ?auto_1130050 ) ( AVAILABLE ?auto_1130056 ) ( SURFACE-AT ?auto_1130050 ?auto_1130052 ) ( ON ?auto_1130050 ?auto_1130053 ) ( CLEAR ?auto_1130050 ) ( not ( = ?auto_1130050 ?auto_1130053 ) ) ( not ( = ?auto_1130051 ?auto_1130053 ) ) ( not ( = ?auto_1130049 ?auto_1130053 ) ) ( not ( = ?auto_1130058 ?auto_1130053 ) ) ( TRUCK-AT ?auto_1130057 ?auto_1130055 ) ( SURFACE-AT ?auto_1130048 ?auto_1130055 ) ( CLEAR ?auto_1130048 ) ( LIFTING ?auto_1130054 ?auto_1130049 ) ( IS-CRATE ?auto_1130049 ) ( not ( = ?auto_1130048 ?auto_1130049 ) ) ( not ( = ?auto_1130050 ?auto_1130048 ) ) ( not ( = ?auto_1130051 ?auto_1130048 ) ) ( not ( = ?auto_1130058 ?auto_1130048 ) ) ( not ( = ?auto_1130053 ?auto_1130048 ) ) ( ON ?auto_1130048 ?auto_1130047 ) ( not ( = ?auto_1130047 ?auto_1130048 ) ) ( not ( = ?auto_1130047 ?auto_1130049 ) ) ( not ( = ?auto_1130047 ?auto_1130050 ) ) ( not ( = ?auto_1130047 ?auto_1130051 ) ) ( not ( = ?auto_1130047 ?auto_1130058 ) ) ( not ( = ?auto_1130047 ?auto_1130053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1130049 ?auto_1130050 ?auto_1130051 )
      ( MAKE-4CRATE-VERIFY ?auto_1130047 ?auto_1130048 ?auto_1130049 ?auto_1130050 ?auto_1130051 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1130059 - SURFACE
      ?auto_1130060 - SURFACE
      ?auto_1130061 - SURFACE
      ?auto_1130062 - SURFACE
      ?auto_1130063 - SURFACE
      ?auto_1130064 - SURFACE
    )
    :vars
    (
      ?auto_1130067 - HOIST
      ?auto_1130068 - PLACE
      ?auto_1130065 - PLACE
      ?auto_1130069 - HOIST
      ?auto_1130071 - SURFACE
      ?auto_1130066 - SURFACE
      ?auto_1130070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1130067 ?auto_1130068 ) ( IS-CRATE ?auto_1130064 ) ( not ( = ?auto_1130063 ?auto_1130064 ) ) ( not ( = ?auto_1130062 ?auto_1130063 ) ) ( not ( = ?auto_1130062 ?auto_1130064 ) ) ( not ( = ?auto_1130065 ?auto_1130068 ) ) ( HOIST-AT ?auto_1130069 ?auto_1130065 ) ( not ( = ?auto_1130067 ?auto_1130069 ) ) ( SURFACE-AT ?auto_1130064 ?auto_1130065 ) ( ON ?auto_1130064 ?auto_1130071 ) ( CLEAR ?auto_1130064 ) ( not ( = ?auto_1130063 ?auto_1130071 ) ) ( not ( = ?auto_1130064 ?auto_1130071 ) ) ( not ( = ?auto_1130062 ?auto_1130071 ) ) ( IS-CRATE ?auto_1130063 ) ( AVAILABLE ?auto_1130069 ) ( SURFACE-AT ?auto_1130063 ?auto_1130065 ) ( ON ?auto_1130063 ?auto_1130066 ) ( CLEAR ?auto_1130063 ) ( not ( = ?auto_1130063 ?auto_1130066 ) ) ( not ( = ?auto_1130064 ?auto_1130066 ) ) ( not ( = ?auto_1130062 ?auto_1130066 ) ) ( not ( = ?auto_1130071 ?auto_1130066 ) ) ( TRUCK-AT ?auto_1130070 ?auto_1130068 ) ( SURFACE-AT ?auto_1130061 ?auto_1130068 ) ( CLEAR ?auto_1130061 ) ( LIFTING ?auto_1130067 ?auto_1130062 ) ( IS-CRATE ?auto_1130062 ) ( not ( = ?auto_1130061 ?auto_1130062 ) ) ( not ( = ?auto_1130063 ?auto_1130061 ) ) ( not ( = ?auto_1130064 ?auto_1130061 ) ) ( not ( = ?auto_1130071 ?auto_1130061 ) ) ( not ( = ?auto_1130066 ?auto_1130061 ) ) ( ON ?auto_1130060 ?auto_1130059 ) ( ON ?auto_1130061 ?auto_1130060 ) ( not ( = ?auto_1130059 ?auto_1130060 ) ) ( not ( = ?auto_1130059 ?auto_1130061 ) ) ( not ( = ?auto_1130059 ?auto_1130062 ) ) ( not ( = ?auto_1130059 ?auto_1130063 ) ) ( not ( = ?auto_1130059 ?auto_1130064 ) ) ( not ( = ?auto_1130059 ?auto_1130071 ) ) ( not ( = ?auto_1130059 ?auto_1130066 ) ) ( not ( = ?auto_1130060 ?auto_1130061 ) ) ( not ( = ?auto_1130060 ?auto_1130062 ) ) ( not ( = ?auto_1130060 ?auto_1130063 ) ) ( not ( = ?auto_1130060 ?auto_1130064 ) ) ( not ( = ?auto_1130060 ?auto_1130071 ) ) ( not ( = ?auto_1130060 ?auto_1130066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1130062 ?auto_1130063 ?auto_1130064 )
      ( MAKE-5CRATE-VERIFY ?auto_1130059 ?auto_1130060 ?auto_1130061 ?auto_1130062 ?auto_1130063 ?auto_1130064 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1130072 - SURFACE
      ?auto_1130073 - SURFACE
      ?auto_1130074 - SURFACE
      ?auto_1130075 - SURFACE
      ?auto_1130076 - SURFACE
      ?auto_1130077 - SURFACE
      ?auto_1130078 - SURFACE
    )
    :vars
    (
      ?auto_1130081 - HOIST
      ?auto_1130082 - PLACE
      ?auto_1130079 - PLACE
      ?auto_1130083 - HOIST
      ?auto_1130085 - SURFACE
      ?auto_1130080 - SURFACE
      ?auto_1130084 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1130081 ?auto_1130082 ) ( IS-CRATE ?auto_1130078 ) ( not ( = ?auto_1130077 ?auto_1130078 ) ) ( not ( = ?auto_1130076 ?auto_1130077 ) ) ( not ( = ?auto_1130076 ?auto_1130078 ) ) ( not ( = ?auto_1130079 ?auto_1130082 ) ) ( HOIST-AT ?auto_1130083 ?auto_1130079 ) ( not ( = ?auto_1130081 ?auto_1130083 ) ) ( SURFACE-AT ?auto_1130078 ?auto_1130079 ) ( ON ?auto_1130078 ?auto_1130085 ) ( CLEAR ?auto_1130078 ) ( not ( = ?auto_1130077 ?auto_1130085 ) ) ( not ( = ?auto_1130078 ?auto_1130085 ) ) ( not ( = ?auto_1130076 ?auto_1130085 ) ) ( IS-CRATE ?auto_1130077 ) ( AVAILABLE ?auto_1130083 ) ( SURFACE-AT ?auto_1130077 ?auto_1130079 ) ( ON ?auto_1130077 ?auto_1130080 ) ( CLEAR ?auto_1130077 ) ( not ( = ?auto_1130077 ?auto_1130080 ) ) ( not ( = ?auto_1130078 ?auto_1130080 ) ) ( not ( = ?auto_1130076 ?auto_1130080 ) ) ( not ( = ?auto_1130085 ?auto_1130080 ) ) ( TRUCK-AT ?auto_1130084 ?auto_1130082 ) ( SURFACE-AT ?auto_1130075 ?auto_1130082 ) ( CLEAR ?auto_1130075 ) ( LIFTING ?auto_1130081 ?auto_1130076 ) ( IS-CRATE ?auto_1130076 ) ( not ( = ?auto_1130075 ?auto_1130076 ) ) ( not ( = ?auto_1130077 ?auto_1130075 ) ) ( not ( = ?auto_1130078 ?auto_1130075 ) ) ( not ( = ?auto_1130085 ?auto_1130075 ) ) ( not ( = ?auto_1130080 ?auto_1130075 ) ) ( ON ?auto_1130073 ?auto_1130072 ) ( ON ?auto_1130074 ?auto_1130073 ) ( ON ?auto_1130075 ?auto_1130074 ) ( not ( = ?auto_1130072 ?auto_1130073 ) ) ( not ( = ?auto_1130072 ?auto_1130074 ) ) ( not ( = ?auto_1130072 ?auto_1130075 ) ) ( not ( = ?auto_1130072 ?auto_1130076 ) ) ( not ( = ?auto_1130072 ?auto_1130077 ) ) ( not ( = ?auto_1130072 ?auto_1130078 ) ) ( not ( = ?auto_1130072 ?auto_1130085 ) ) ( not ( = ?auto_1130072 ?auto_1130080 ) ) ( not ( = ?auto_1130073 ?auto_1130074 ) ) ( not ( = ?auto_1130073 ?auto_1130075 ) ) ( not ( = ?auto_1130073 ?auto_1130076 ) ) ( not ( = ?auto_1130073 ?auto_1130077 ) ) ( not ( = ?auto_1130073 ?auto_1130078 ) ) ( not ( = ?auto_1130073 ?auto_1130085 ) ) ( not ( = ?auto_1130073 ?auto_1130080 ) ) ( not ( = ?auto_1130074 ?auto_1130075 ) ) ( not ( = ?auto_1130074 ?auto_1130076 ) ) ( not ( = ?auto_1130074 ?auto_1130077 ) ) ( not ( = ?auto_1130074 ?auto_1130078 ) ) ( not ( = ?auto_1130074 ?auto_1130085 ) ) ( not ( = ?auto_1130074 ?auto_1130080 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1130076 ?auto_1130077 ?auto_1130078 )
      ( MAKE-6CRATE-VERIFY ?auto_1130072 ?auto_1130073 ?auto_1130074 ?auto_1130075 ?auto_1130076 ?auto_1130077 ?auto_1130078 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1130086 - SURFACE
      ?auto_1130087 - SURFACE
      ?auto_1130088 - SURFACE
      ?auto_1130089 - SURFACE
      ?auto_1130090 - SURFACE
      ?auto_1130091 - SURFACE
      ?auto_1130092 - SURFACE
      ?auto_1130093 - SURFACE
    )
    :vars
    (
      ?auto_1130096 - HOIST
      ?auto_1130097 - PLACE
      ?auto_1130094 - PLACE
      ?auto_1130098 - HOIST
      ?auto_1130100 - SURFACE
      ?auto_1130095 - SURFACE
      ?auto_1130099 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1130096 ?auto_1130097 ) ( IS-CRATE ?auto_1130093 ) ( not ( = ?auto_1130092 ?auto_1130093 ) ) ( not ( = ?auto_1130091 ?auto_1130092 ) ) ( not ( = ?auto_1130091 ?auto_1130093 ) ) ( not ( = ?auto_1130094 ?auto_1130097 ) ) ( HOIST-AT ?auto_1130098 ?auto_1130094 ) ( not ( = ?auto_1130096 ?auto_1130098 ) ) ( SURFACE-AT ?auto_1130093 ?auto_1130094 ) ( ON ?auto_1130093 ?auto_1130100 ) ( CLEAR ?auto_1130093 ) ( not ( = ?auto_1130092 ?auto_1130100 ) ) ( not ( = ?auto_1130093 ?auto_1130100 ) ) ( not ( = ?auto_1130091 ?auto_1130100 ) ) ( IS-CRATE ?auto_1130092 ) ( AVAILABLE ?auto_1130098 ) ( SURFACE-AT ?auto_1130092 ?auto_1130094 ) ( ON ?auto_1130092 ?auto_1130095 ) ( CLEAR ?auto_1130092 ) ( not ( = ?auto_1130092 ?auto_1130095 ) ) ( not ( = ?auto_1130093 ?auto_1130095 ) ) ( not ( = ?auto_1130091 ?auto_1130095 ) ) ( not ( = ?auto_1130100 ?auto_1130095 ) ) ( TRUCK-AT ?auto_1130099 ?auto_1130097 ) ( SURFACE-AT ?auto_1130090 ?auto_1130097 ) ( CLEAR ?auto_1130090 ) ( LIFTING ?auto_1130096 ?auto_1130091 ) ( IS-CRATE ?auto_1130091 ) ( not ( = ?auto_1130090 ?auto_1130091 ) ) ( not ( = ?auto_1130092 ?auto_1130090 ) ) ( not ( = ?auto_1130093 ?auto_1130090 ) ) ( not ( = ?auto_1130100 ?auto_1130090 ) ) ( not ( = ?auto_1130095 ?auto_1130090 ) ) ( ON ?auto_1130087 ?auto_1130086 ) ( ON ?auto_1130088 ?auto_1130087 ) ( ON ?auto_1130089 ?auto_1130088 ) ( ON ?auto_1130090 ?auto_1130089 ) ( not ( = ?auto_1130086 ?auto_1130087 ) ) ( not ( = ?auto_1130086 ?auto_1130088 ) ) ( not ( = ?auto_1130086 ?auto_1130089 ) ) ( not ( = ?auto_1130086 ?auto_1130090 ) ) ( not ( = ?auto_1130086 ?auto_1130091 ) ) ( not ( = ?auto_1130086 ?auto_1130092 ) ) ( not ( = ?auto_1130086 ?auto_1130093 ) ) ( not ( = ?auto_1130086 ?auto_1130100 ) ) ( not ( = ?auto_1130086 ?auto_1130095 ) ) ( not ( = ?auto_1130087 ?auto_1130088 ) ) ( not ( = ?auto_1130087 ?auto_1130089 ) ) ( not ( = ?auto_1130087 ?auto_1130090 ) ) ( not ( = ?auto_1130087 ?auto_1130091 ) ) ( not ( = ?auto_1130087 ?auto_1130092 ) ) ( not ( = ?auto_1130087 ?auto_1130093 ) ) ( not ( = ?auto_1130087 ?auto_1130100 ) ) ( not ( = ?auto_1130087 ?auto_1130095 ) ) ( not ( = ?auto_1130088 ?auto_1130089 ) ) ( not ( = ?auto_1130088 ?auto_1130090 ) ) ( not ( = ?auto_1130088 ?auto_1130091 ) ) ( not ( = ?auto_1130088 ?auto_1130092 ) ) ( not ( = ?auto_1130088 ?auto_1130093 ) ) ( not ( = ?auto_1130088 ?auto_1130100 ) ) ( not ( = ?auto_1130088 ?auto_1130095 ) ) ( not ( = ?auto_1130089 ?auto_1130090 ) ) ( not ( = ?auto_1130089 ?auto_1130091 ) ) ( not ( = ?auto_1130089 ?auto_1130092 ) ) ( not ( = ?auto_1130089 ?auto_1130093 ) ) ( not ( = ?auto_1130089 ?auto_1130100 ) ) ( not ( = ?auto_1130089 ?auto_1130095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1130091 ?auto_1130092 ?auto_1130093 )
      ( MAKE-7CRATE-VERIFY ?auto_1130086 ?auto_1130087 ?auto_1130088 ?auto_1130089 ?auto_1130090 ?auto_1130091 ?auto_1130092 ?auto_1130093 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1130101 - SURFACE
      ?auto_1130102 - SURFACE
      ?auto_1130103 - SURFACE
      ?auto_1130104 - SURFACE
      ?auto_1130105 - SURFACE
      ?auto_1130106 - SURFACE
      ?auto_1130107 - SURFACE
      ?auto_1130108 - SURFACE
      ?auto_1130109 - SURFACE
    )
    :vars
    (
      ?auto_1130112 - HOIST
      ?auto_1130113 - PLACE
      ?auto_1130110 - PLACE
      ?auto_1130114 - HOIST
      ?auto_1130116 - SURFACE
      ?auto_1130111 - SURFACE
      ?auto_1130115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1130112 ?auto_1130113 ) ( IS-CRATE ?auto_1130109 ) ( not ( = ?auto_1130108 ?auto_1130109 ) ) ( not ( = ?auto_1130107 ?auto_1130108 ) ) ( not ( = ?auto_1130107 ?auto_1130109 ) ) ( not ( = ?auto_1130110 ?auto_1130113 ) ) ( HOIST-AT ?auto_1130114 ?auto_1130110 ) ( not ( = ?auto_1130112 ?auto_1130114 ) ) ( SURFACE-AT ?auto_1130109 ?auto_1130110 ) ( ON ?auto_1130109 ?auto_1130116 ) ( CLEAR ?auto_1130109 ) ( not ( = ?auto_1130108 ?auto_1130116 ) ) ( not ( = ?auto_1130109 ?auto_1130116 ) ) ( not ( = ?auto_1130107 ?auto_1130116 ) ) ( IS-CRATE ?auto_1130108 ) ( AVAILABLE ?auto_1130114 ) ( SURFACE-AT ?auto_1130108 ?auto_1130110 ) ( ON ?auto_1130108 ?auto_1130111 ) ( CLEAR ?auto_1130108 ) ( not ( = ?auto_1130108 ?auto_1130111 ) ) ( not ( = ?auto_1130109 ?auto_1130111 ) ) ( not ( = ?auto_1130107 ?auto_1130111 ) ) ( not ( = ?auto_1130116 ?auto_1130111 ) ) ( TRUCK-AT ?auto_1130115 ?auto_1130113 ) ( SURFACE-AT ?auto_1130106 ?auto_1130113 ) ( CLEAR ?auto_1130106 ) ( LIFTING ?auto_1130112 ?auto_1130107 ) ( IS-CRATE ?auto_1130107 ) ( not ( = ?auto_1130106 ?auto_1130107 ) ) ( not ( = ?auto_1130108 ?auto_1130106 ) ) ( not ( = ?auto_1130109 ?auto_1130106 ) ) ( not ( = ?auto_1130116 ?auto_1130106 ) ) ( not ( = ?auto_1130111 ?auto_1130106 ) ) ( ON ?auto_1130102 ?auto_1130101 ) ( ON ?auto_1130103 ?auto_1130102 ) ( ON ?auto_1130104 ?auto_1130103 ) ( ON ?auto_1130105 ?auto_1130104 ) ( ON ?auto_1130106 ?auto_1130105 ) ( not ( = ?auto_1130101 ?auto_1130102 ) ) ( not ( = ?auto_1130101 ?auto_1130103 ) ) ( not ( = ?auto_1130101 ?auto_1130104 ) ) ( not ( = ?auto_1130101 ?auto_1130105 ) ) ( not ( = ?auto_1130101 ?auto_1130106 ) ) ( not ( = ?auto_1130101 ?auto_1130107 ) ) ( not ( = ?auto_1130101 ?auto_1130108 ) ) ( not ( = ?auto_1130101 ?auto_1130109 ) ) ( not ( = ?auto_1130101 ?auto_1130116 ) ) ( not ( = ?auto_1130101 ?auto_1130111 ) ) ( not ( = ?auto_1130102 ?auto_1130103 ) ) ( not ( = ?auto_1130102 ?auto_1130104 ) ) ( not ( = ?auto_1130102 ?auto_1130105 ) ) ( not ( = ?auto_1130102 ?auto_1130106 ) ) ( not ( = ?auto_1130102 ?auto_1130107 ) ) ( not ( = ?auto_1130102 ?auto_1130108 ) ) ( not ( = ?auto_1130102 ?auto_1130109 ) ) ( not ( = ?auto_1130102 ?auto_1130116 ) ) ( not ( = ?auto_1130102 ?auto_1130111 ) ) ( not ( = ?auto_1130103 ?auto_1130104 ) ) ( not ( = ?auto_1130103 ?auto_1130105 ) ) ( not ( = ?auto_1130103 ?auto_1130106 ) ) ( not ( = ?auto_1130103 ?auto_1130107 ) ) ( not ( = ?auto_1130103 ?auto_1130108 ) ) ( not ( = ?auto_1130103 ?auto_1130109 ) ) ( not ( = ?auto_1130103 ?auto_1130116 ) ) ( not ( = ?auto_1130103 ?auto_1130111 ) ) ( not ( = ?auto_1130104 ?auto_1130105 ) ) ( not ( = ?auto_1130104 ?auto_1130106 ) ) ( not ( = ?auto_1130104 ?auto_1130107 ) ) ( not ( = ?auto_1130104 ?auto_1130108 ) ) ( not ( = ?auto_1130104 ?auto_1130109 ) ) ( not ( = ?auto_1130104 ?auto_1130116 ) ) ( not ( = ?auto_1130104 ?auto_1130111 ) ) ( not ( = ?auto_1130105 ?auto_1130106 ) ) ( not ( = ?auto_1130105 ?auto_1130107 ) ) ( not ( = ?auto_1130105 ?auto_1130108 ) ) ( not ( = ?auto_1130105 ?auto_1130109 ) ) ( not ( = ?auto_1130105 ?auto_1130116 ) ) ( not ( = ?auto_1130105 ?auto_1130111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1130107 ?auto_1130108 ?auto_1130109 )
      ( MAKE-8CRATE-VERIFY ?auto_1130101 ?auto_1130102 ?auto_1130103 ?auto_1130104 ?auto_1130105 ?auto_1130106 ?auto_1130107 ?auto_1130108 ?auto_1130109 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1130117 - SURFACE
      ?auto_1130118 - SURFACE
      ?auto_1130119 - SURFACE
      ?auto_1130120 - SURFACE
      ?auto_1130121 - SURFACE
      ?auto_1130122 - SURFACE
      ?auto_1130123 - SURFACE
      ?auto_1130124 - SURFACE
      ?auto_1130125 - SURFACE
      ?auto_1130126 - SURFACE
    )
    :vars
    (
      ?auto_1130129 - HOIST
      ?auto_1130130 - PLACE
      ?auto_1130127 - PLACE
      ?auto_1130131 - HOIST
      ?auto_1130133 - SURFACE
      ?auto_1130128 - SURFACE
      ?auto_1130132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1130129 ?auto_1130130 ) ( IS-CRATE ?auto_1130126 ) ( not ( = ?auto_1130125 ?auto_1130126 ) ) ( not ( = ?auto_1130124 ?auto_1130125 ) ) ( not ( = ?auto_1130124 ?auto_1130126 ) ) ( not ( = ?auto_1130127 ?auto_1130130 ) ) ( HOIST-AT ?auto_1130131 ?auto_1130127 ) ( not ( = ?auto_1130129 ?auto_1130131 ) ) ( SURFACE-AT ?auto_1130126 ?auto_1130127 ) ( ON ?auto_1130126 ?auto_1130133 ) ( CLEAR ?auto_1130126 ) ( not ( = ?auto_1130125 ?auto_1130133 ) ) ( not ( = ?auto_1130126 ?auto_1130133 ) ) ( not ( = ?auto_1130124 ?auto_1130133 ) ) ( IS-CRATE ?auto_1130125 ) ( AVAILABLE ?auto_1130131 ) ( SURFACE-AT ?auto_1130125 ?auto_1130127 ) ( ON ?auto_1130125 ?auto_1130128 ) ( CLEAR ?auto_1130125 ) ( not ( = ?auto_1130125 ?auto_1130128 ) ) ( not ( = ?auto_1130126 ?auto_1130128 ) ) ( not ( = ?auto_1130124 ?auto_1130128 ) ) ( not ( = ?auto_1130133 ?auto_1130128 ) ) ( TRUCK-AT ?auto_1130132 ?auto_1130130 ) ( SURFACE-AT ?auto_1130123 ?auto_1130130 ) ( CLEAR ?auto_1130123 ) ( LIFTING ?auto_1130129 ?auto_1130124 ) ( IS-CRATE ?auto_1130124 ) ( not ( = ?auto_1130123 ?auto_1130124 ) ) ( not ( = ?auto_1130125 ?auto_1130123 ) ) ( not ( = ?auto_1130126 ?auto_1130123 ) ) ( not ( = ?auto_1130133 ?auto_1130123 ) ) ( not ( = ?auto_1130128 ?auto_1130123 ) ) ( ON ?auto_1130118 ?auto_1130117 ) ( ON ?auto_1130119 ?auto_1130118 ) ( ON ?auto_1130120 ?auto_1130119 ) ( ON ?auto_1130121 ?auto_1130120 ) ( ON ?auto_1130122 ?auto_1130121 ) ( ON ?auto_1130123 ?auto_1130122 ) ( not ( = ?auto_1130117 ?auto_1130118 ) ) ( not ( = ?auto_1130117 ?auto_1130119 ) ) ( not ( = ?auto_1130117 ?auto_1130120 ) ) ( not ( = ?auto_1130117 ?auto_1130121 ) ) ( not ( = ?auto_1130117 ?auto_1130122 ) ) ( not ( = ?auto_1130117 ?auto_1130123 ) ) ( not ( = ?auto_1130117 ?auto_1130124 ) ) ( not ( = ?auto_1130117 ?auto_1130125 ) ) ( not ( = ?auto_1130117 ?auto_1130126 ) ) ( not ( = ?auto_1130117 ?auto_1130133 ) ) ( not ( = ?auto_1130117 ?auto_1130128 ) ) ( not ( = ?auto_1130118 ?auto_1130119 ) ) ( not ( = ?auto_1130118 ?auto_1130120 ) ) ( not ( = ?auto_1130118 ?auto_1130121 ) ) ( not ( = ?auto_1130118 ?auto_1130122 ) ) ( not ( = ?auto_1130118 ?auto_1130123 ) ) ( not ( = ?auto_1130118 ?auto_1130124 ) ) ( not ( = ?auto_1130118 ?auto_1130125 ) ) ( not ( = ?auto_1130118 ?auto_1130126 ) ) ( not ( = ?auto_1130118 ?auto_1130133 ) ) ( not ( = ?auto_1130118 ?auto_1130128 ) ) ( not ( = ?auto_1130119 ?auto_1130120 ) ) ( not ( = ?auto_1130119 ?auto_1130121 ) ) ( not ( = ?auto_1130119 ?auto_1130122 ) ) ( not ( = ?auto_1130119 ?auto_1130123 ) ) ( not ( = ?auto_1130119 ?auto_1130124 ) ) ( not ( = ?auto_1130119 ?auto_1130125 ) ) ( not ( = ?auto_1130119 ?auto_1130126 ) ) ( not ( = ?auto_1130119 ?auto_1130133 ) ) ( not ( = ?auto_1130119 ?auto_1130128 ) ) ( not ( = ?auto_1130120 ?auto_1130121 ) ) ( not ( = ?auto_1130120 ?auto_1130122 ) ) ( not ( = ?auto_1130120 ?auto_1130123 ) ) ( not ( = ?auto_1130120 ?auto_1130124 ) ) ( not ( = ?auto_1130120 ?auto_1130125 ) ) ( not ( = ?auto_1130120 ?auto_1130126 ) ) ( not ( = ?auto_1130120 ?auto_1130133 ) ) ( not ( = ?auto_1130120 ?auto_1130128 ) ) ( not ( = ?auto_1130121 ?auto_1130122 ) ) ( not ( = ?auto_1130121 ?auto_1130123 ) ) ( not ( = ?auto_1130121 ?auto_1130124 ) ) ( not ( = ?auto_1130121 ?auto_1130125 ) ) ( not ( = ?auto_1130121 ?auto_1130126 ) ) ( not ( = ?auto_1130121 ?auto_1130133 ) ) ( not ( = ?auto_1130121 ?auto_1130128 ) ) ( not ( = ?auto_1130122 ?auto_1130123 ) ) ( not ( = ?auto_1130122 ?auto_1130124 ) ) ( not ( = ?auto_1130122 ?auto_1130125 ) ) ( not ( = ?auto_1130122 ?auto_1130126 ) ) ( not ( = ?auto_1130122 ?auto_1130133 ) ) ( not ( = ?auto_1130122 ?auto_1130128 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1130124 ?auto_1130125 ?auto_1130126 )
      ( MAKE-9CRATE-VERIFY ?auto_1130117 ?auto_1130118 ?auto_1130119 ?auto_1130120 ?auto_1130121 ?auto_1130122 ?auto_1130123 ?auto_1130124 ?auto_1130125 ?auto_1130126 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1130134 - SURFACE
      ?auto_1130135 - SURFACE
      ?auto_1130136 - SURFACE
      ?auto_1130137 - SURFACE
      ?auto_1130138 - SURFACE
      ?auto_1130139 - SURFACE
      ?auto_1130140 - SURFACE
      ?auto_1130141 - SURFACE
      ?auto_1130142 - SURFACE
      ?auto_1130143 - SURFACE
      ?auto_1130144 - SURFACE
    )
    :vars
    (
      ?auto_1130147 - HOIST
      ?auto_1130148 - PLACE
      ?auto_1130145 - PLACE
      ?auto_1130149 - HOIST
      ?auto_1130151 - SURFACE
      ?auto_1130146 - SURFACE
      ?auto_1130150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1130147 ?auto_1130148 ) ( IS-CRATE ?auto_1130144 ) ( not ( = ?auto_1130143 ?auto_1130144 ) ) ( not ( = ?auto_1130142 ?auto_1130143 ) ) ( not ( = ?auto_1130142 ?auto_1130144 ) ) ( not ( = ?auto_1130145 ?auto_1130148 ) ) ( HOIST-AT ?auto_1130149 ?auto_1130145 ) ( not ( = ?auto_1130147 ?auto_1130149 ) ) ( SURFACE-AT ?auto_1130144 ?auto_1130145 ) ( ON ?auto_1130144 ?auto_1130151 ) ( CLEAR ?auto_1130144 ) ( not ( = ?auto_1130143 ?auto_1130151 ) ) ( not ( = ?auto_1130144 ?auto_1130151 ) ) ( not ( = ?auto_1130142 ?auto_1130151 ) ) ( IS-CRATE ?auto_1130143 ) ( AVAILABLE ?auto_1130149 ) ( SURFACE-AT ?auto_1130143 ?auto_1130145 ) ( ON ?auto_1130143 ?auto_1130146 ) ( CLEAR ?auto_1130143 ) ( not ( = ?auto_1130143 ?auto_1130146 ) ) ( not ( = ?auto_1130144 ?auto_1130146 ) ) ( not ( = ?auto_1130142 ?auto_1130146 ) ) ( not ( = ?auto_1130151 ?auto_1130146 ) ) ( TRUCK-AT ?auto_1130150 ?auto_1130148 ) ( SURFACE-AT ?auto_1130141 ?auto_1130148 ) ( CLEAR ?auto_1130141 ) ( LIFTING ?auto_1130147 ?auto_1130142 ) ( IS-CRATE ?auto_1130142 ) ( not ( = ?auto_1130141 ?auto_1130142 ) ) ( not ( = ?auto_1130143 ?auto_1130141 ) ) ( not ( = ?auto_1130144 ?auto_1130141 ) ) ( not ( = ?auto_1130151 ?auto_1130141 ) ) ( not ( = ?auto_1130146 ?auto_1130141 ) ) ( ON ?auto_1130135 ?auto_1130134 ) ( ON ?auto_1130136 ?auto_1130135 ) ( ON ?auto_1130137 ?auto_1130136 ) ( ON ?auto_1130138 ?auto_1130137 ) ( ON ?auto_1130139 ?auto_1130138 ) ( ON ?auto_1130140 ?auto_1130139 ) ( ON ?auto_1130141 ?auto_1130140 ) ( not ( = ?auto_1130134 ?auto_1130135 ) ) ( not ( = ?auto_1130134 ?auto_1130136 ) ) ( not ( = ?auto_1130134 ?auto_1130137 ) ) ( not ( = ?auto_1130134 ?auto_1130138 ) ) ( not ( = ?auto_1130134 ?auto_1130139 ) ) ( not ( = ?auto_1130134 ?auto_1130140 ) ) ( not ( = ?auto_1130134 ?auto_1130141 ) ) ( not ( = ?auto_1130134 ?auto_1130142 ) ) ( not ( = ?auto_1130134 ?auto_1130143 ) ) ( not ( = ?auto_1130134 ?auto_1130144 ) ) ( not ( = ?auto_1130134 ?auto_1130151 ) ) ( not ( = ?auto_1130134 ?auto_1130146 ) ) ( not ( = ?auto_1130135 ?auto_1130136 ) ) ( not ( = ?auto_1130135 ?auto_1130137 ) ) ( not ( = ?auto_1130135 ?auto_1130138 ) ) ( not ( = ?auto_1130135 ?auto_1130139 ) ) ( not ( = ?auto_1130135 ?auto_1130140 ) ) ( not ( = ?auto_1130135 ?auto_1130141 ) ) ( not ( = ?auto_1130135 ?auto_1130142 ) ) ( not ( = ?auto_1130135 ?auto_1130143 ) ) ( not ( = ?auto_1130135 ?auto_1130144 ) ) ( not ( = ?auto_1130135 ?auto_1130151 ) ) ( not ( = ?auto_1130135 ?auto_1130146 ) ) ( not ( = ?auto_1130136 ?auto_1130137 ) ) ( not ( = ?auto_1130136 ?auto_1130138 ) ) ( not ( = ?auto_1130136 ?auto_1130139 ) ) ( not ( = ?auto_1130136 ?auto_1130140 ) ) ( not ( = ?auto_1130136 ?auto_1130141 ) ) ( not ( = ?auto_1130136 ?auto_1130142 ) ) ( not ( = ?auto_1130136 ?auto_1130143 ) ) ( not ( = ?auto_1130136 ?auto_1130144 ) ) ( not ( = ?auto_1130136 ?auto_1130151 ) ) ( not ( = ?auto_1130136 ?auto_1130146 ) ) ( not ( = ?auto_1130137 ?auto_1130138 ) ) ( not ( = ?auto_1130137 ?auto_1130139 ) ) ( not ( = ?auto_1130137 ?auto_1130140 ) ) ( not ( = ?auto_1130137 ?auto_1130141 ) ) ( not ( = ?auto_1130137 ?auto_1130142 ) ) ( not ( = ?auto_1130137 ?auto_1130143 ) ) ( not ( = ?auto_1130137 ?auto_1130144 ) ) ( not ( = ?auto_1130137 ?auto_1130151 ) ) ( not ( = ?auto_1130137 ?auto_1130146 ) ) ( not ( = ?auto_1130138 ?auto_1130139 ) ) ( not ( = ?auto_1130138 ?auto_1130140 ) ) ( not ( = ?auto_1130138 ?auto_1130141 ) ) ( not ( = ?auto_1130138 ?auto_1130142 ) ) ( not ( = ?auto_1130138 ?auto_1130143 ) ) ( not ( = ?auto_1130138 ?auto_1130144 ) ) ( not ( = ?auto_1130138 ?auto_1130151 ) ) ( not ( = ?auto_1130138 ?auto_1130146 ) ) ( not ( = ?auto_1130139 ?auto_1130140 ) ) ( not ( = ?auto_1130139 ?auto_1130141 ) ) ( not ( = ?auto_1130139 ?auto_1130142 ) ) ( not ( = ?auto_1130139 ?auto_1130143 ) ) ( not ( = ?auto_1130139 ?auto_1130144 ) ) ( not ( = ?auto_1130139 ?auto_1130151 ) ) ( not ( = ?auto_1130139 ?auto_1130146 ) ) ( not ( = ?auto_1130140 ?auto_1130141 ) ) ( not ( = ?auto_1130140 ?auto_1130142 ) ) ( not ( = ?auto_1130140 ?auto_1130143 ) ) ( not ( = ?auto_1130140 ?auto_1130144 ) ) ( not ( = ?auto_1130140 ?auto_1130151 ) ) ( not ( = ?auto_1130140 ?auto_1130146 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1130142 ?auto_1130143 ?auto_1130144 )
      ( MAKE-10CRATE-VERIFY ?auto_1130134 ?auto_1130135 ?auto_1130136 ?auto_1130137 ?auto_1130138 ?auto_1130139 ?auto_1130140 ?auto_1130141 ?auto_1130142 ?auto_1130143 ?auto_1130144 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1136650 - SURFACE
      ?auto_1136651 - SURFACE
      ?auto_1136652 - SURFACE
      ?auto_1136653 - SURFACE
      ?auto_1136654 - SURFACE
      ?auto_1136655 - SURFACE
      ?auto_1136656 - SURFACE
      ?auto_1136657 - SURFACE
      ?auto_1136658 - SURFACE
      ?auto_1136659 - SURFACE
      ?auto_1136660 - SURFACE
      ?auto_1136661 - SURFACE
    )
    :vars
    (
      ?auto_1136662 - HOIST
      ?auto_1136663 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1136662 ?auto_1136663 ) ( SURFACE-AT ?auto_1136660 ?auto_1136663 ) ( CLEAR ?auto_1136660 ) ( LIFTING ?auto_1136662 ?auto_1136661 ) ( IS-CRATE ?auto_1136661 ) ( not ( = ?auto_1136660 ?auto_1136661 ) ) ( ON ?auto_1136651 ?auto_1136650 ) ( ON ?auto_1136652 ?auto_1136651 ) ( ON ?auto_1136653 ?auto_1136652 ) ( ON ?auto_1136654 ?auto_1136653 ) ( ON ?auto_1136655 ?auto_1136654 ) ( ON ?auto_1136656 ?auto_1136655 ) ( ON ?auto_1136657 ?auto_1136656 ) ( ON ?auto_1136658 ?auto_1136657 ) ( ON ?auto_1136659 ?auto_1136658 ) ( ON ?auto_1136660 ?auto_1136659 ) ( not ( = ?auto_1136650 ?auto_1136651 ) ) ( not ( = ?auto_1136650 ?auto_1136652 ) ) ( not ( = ?auto_1136650 ?auto_1136653 ) ) ( not ( = ?auto_1136650 ?auto_1136654 ) ) ( not ( = ?auto_1136650 ?auto_1136655 ) ) ( not ( = ?auto_1136650 ?auto_1136656 ) ) ( not ( = ?auto_1136650 ?auto_1136657 ) ) ( not ( = ?auto_1136650 ?auto_1136658 ) ) ( not ( = ?auto_1136650 ?auto_1136659 ) ) ( not ( = ?auto_1136650 ?auto_1136660 ) ) ( not ( = ?auto_1136650 ?auto_1136661 ) ) ( not ( = ?auto_1136651 ?auto_1136652 ) ) ( not ( = ?auto_1136651 ?auto_1136653 ) ) ( not ( = ?auto_1136651 ?auto_1136654 ) ) ( not ( = ?auto_1136651 ?auto_1136655 ) ) ( not ( = ?auto_1136651 ?auto_1136656 ) ) ( not ( = ?auto_1136651 ?auto_1136657 ) ) ( not ( = ?auto_1136651 ?auto_1136658 ) ) ( not ( = ?auto_1136651 ?auto_1136659 ) ) ( not ( = ?auto_1136651 ?auto_1136660 ) ) ( not ( = ?auto_1136651 ?auto_1136661 ) ) ( not ( = ?auto_1136652 ?auto_1136653 ) ) ( not ( = ?auto_1136652 ?auto_1136654 ) ) ( not ( = ?auto_1136652 ?auto_1136655 ) ) ( not ( = ?auto_1136652 ?auto_1136656 ) ) ( not ( = ?auto_1136652 ?auto_1136657 ) ) ( not ( = ?auto_1136652 ?auto_1136658 ) ) ( not ( = ?auto_1136652 ?auto_1136659 ) ) ( not ( = ?auto_1136652 ?auto_1136660 ) ) ( not ( = ?auto_1136652 ?auto_1136661 ) ) ( not ( = ?auto_1136653 ?auto_1136654 ) ) ( not ( = ?auto_1136653 ?auto_1136655 ) ) ( not ( = ?auto_1136653 ?auto_1136656 ) ) ( not ( = ?auto_1136653 ?auto_1136657 ) ) ( not ( = ?auto_1136653 ?auto_1136658 ) ) ( not ( = ?auto_1136653 ?auto_1136659 ) ) ( not ( = ?auto_1136653 ?auto_1136660 ) ) ( not ( = ?auto_1136653 ?auto_1136661 ) ) ( not ( = ?auto_1136654 ?auto_1136655 ) ) ( not ( = ?auto_1136654 ?auto_1136656 ) ) ( not ( = ?auto_1136654 ?auto_1136657 ) ) ( not ( = ?auto_1136654 ?auto_1136658 ) ) ( not ( = ?auto_1136654 ?auto_1136659 ) ) ( not ( = ?auto_1136654 ?auto_1136660 ) ) ( not ( = ?auto_1136654 ?auto_1136661 ) ) ( not ( = ?auto_1136655 ?auto_1136656 ) ) ( not ( = ?auto_1136655 ?auto_1136657 ) ) ( not ( = ?auto_1136655 ?auto_1136658 ) ) ( not ( = ?auto_1136655 ?auto_1136659 ) ) ( not ( = ?auto_1136655 ?auto_1136660 ) ) ( not ( = ?auto_1136655 ?auto_1136661 ) ) ( not ( = ?auto_1136656 ?auto_1136657 ) ) ( not ( = ?auto_1136656 ?auto_1136658 ) ) ( not ( = ?auto_1136656 ?auto_1136659 ) ) ( not ( = ?auto_1136656 ?auto_1136660 ) ) ( not ( = ?auto_1136656 ?auto_1136661 ) ) ( not ( = ?auto_1136657 ?auto_1136658 ) ) ( not ( = ?auto_1136657 ?auto_1136659 ) ) ( not ( = ?auto_1136657 ?auto_1136660 ) ) ( not ( = ?auto_1136657 ?auto_1136661 ) ) ( not ( = ?auto_1136658 ?auto_1136659 ) ) ( not ( = ?auto_1136658 ?auto_1136660 ) ) ( not ( = ?auto_1136658 ?auto_1136661 ) ) ( not ( = ?auto_1136659 ?auto_1136660 ) ) ( not ( = ?auto_1136659 ?auto_1136661 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1136660 ?auto_1136661 )
      ( MAKE-11CRATE-VERIFY ?auto_1136650 ?auto_1136651 ?auto_1136652 ?auto_1136653 ?auto_1136654 ?auto_1136655 ?auto_1136656 ?auto_1136657 ?auto_1136658 ?auto_1136659 ?auto_1136660 ?auto_1136661 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1136759 - SURFACE
      ?auto_1136760 - SURFACE
      ?auto_1136761 - SURFACE
      ?auto_1136762 - SURFACE
      ?auto_1136763 - SURFACE
      ?auto_1136764 - SURFACE
      ?auto_1136765 - SURFACE
      ?auto_1136766 - SURFACE
      ?auto_1136767 - SURFACE
      ?auto_1136768 - SURFACE
      ?auto_1136769 - SURFACE
      ?auto_1136770 - SURFACE
    )
    :vars
    (
      ?auto_1136771 - HOIST
      ?auto_1136772 - PLACE
      ?auto_1136773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1136771 ?auto_1136772 ) ( SURFACE-AT ?auto_1136769 ?auto_1136772 ) ( CLEAR ?auto_1136769 ) ( IS-CRATE ?auto_1136770 ) ( not ( = ?auto_1136769 ?auto_1136770 ) ) ( TRUCK-AT ?auto_1136773 ?auto_1136772 ) ( AVAILABLE ?auto_1136771 ) ( IN ?auto_1136770 ?auto_1136773 ) ( ON ?auto_1136769 ?auto_1136768 ) ( not ( = ?auto_1136768 ?auto_1136769 ) ) ( not ( = ?auto_1136768 ?auto_1136770 ) ) ( ON ?auto_1136760 ?auto_1136759 ) ( ON ?auto_1136761 ?auto_1136760 ) ( ON ?auto_1136762 ?auto_1136761 ) ( ON ?auto_1136763 ?auto_1136762 ) ( ON ?auto_1136764 ?auto_1136763 ) ( ON ?auto_1136765 ?auto_1136764 ) ( ON ?auto_1136766 ?auto_1136765 ) ( ON ?auto_1136767 ?auto_1136766 ) ( ON ?auto_1136768 ?auto_1136767 ) ( not ( = ?auto_1136759 ?auto_1136760 ) ) ( not ( = ?auto_1136759 ?auto_1136761 ) ) ( not ( = ?auto_1136759 ?auto_1136762 ) ) ( not ( = ?auto_1136759 ?auto_1136763 ) ) ( not ( = ?auto_1136759 ?auto_1136764 ) ) ( not ( = ?auto_1136759 ?auto_1136765 ) ) ( not ( = ?auto_1136759 ?auto_1136766 ) ) ( not ( = ?auto_1136759 ?auto_1136767 ) ) ( not ( = ?auto_1136759 ?auto_1136768 ) ) ( not ( = ?auto_1136759 ?auto_1136769 ) ) ( not ( = ?auto_1136759 ?auto_1136770 ) ) ( not ( = ?auto_1136760 ?auto_1136761 ) ) ( not ( = ?auto_1136760 ?auto_1136762 ) ) ( not ( = ?auto_1136760 ?auto_1136763 ) ) ( not ( = ?auto_1136760 ?auto_1136764 ) ) ( not ( = ?auto_1136760 ?auto_1136765 ) ) ( not ( = ?auto_1136760 ?auto_1136766 ) ) ( not ( = ?auto_1136760 ?auto_1136767 ) ) ( not ( = ?auto_1136760 ?auto_1136768 ) ) ( not ( = ?auto_1136760 ?auto_1136769 ) ) ( not ( = ?auto_1136760 ?auto_1136770 ) ) ( not ( = ?auto_1136761 ?auto_1136762 ) ) ( not ( = ?auto_1136761 ?auto_1136763 ) ) ( not ( = ?auto_1136761 ?auto_1136764 ) ) ( not ( = ?auto_1136761 ?auto_1136765 ) ) ( not ( = ?auto_1136761 ?auto_1136766 ) ) ( not ( = ?auto_1136761 ?auto_1136767 ) ) ( not ( = ?auto_1136761 ?auto_1136768 ) ) ( not ( = ?auto_1136761 ?auto_1136769 ) ) ( not ( = ?auto_1136761 ?auto_1136770 ) ) ( not ( = ?auto_1136762 ?auto_1136763 ) ) ( not ( = ?auto_1136762 ?auto_1136764 ) ) ( not ( = ?auto_1136762 ?auto_1136765 ) ) ( not ( = ?auto_1136762 ?auto_1136766 ) ) ( not ( = ?auto_1136762 ?auto_1136767 ) ) ( not ( = ?auto_1136762 ?auto_1136768 ) ) ( not ( = ?auto_1136762 ?auto_1136769 ) ) ( not ( = ?auto_1136762 ?auto_1136770 ) ) ( not ( = ?auto_1136763 ?auto_1136764 ) ) ( not ( = ?auto_1136763 ?auto_1136765 ) ) ( not ( = ?auto_1136763 ?auto_1136766 ) ) ( not ( = ?auto_1136763 ?auto_1136767 ) ) ( not ( = ?auto_1136763 ?auto_1136768 ) ) ( not ( = ?auto_1136763 ?auto_1136769 ) ) ( not ( = ?auto_1136763 ?auto_1136770 ) ) ( not ( = ?auto_1136764 ?auto_1136765 ) ) ( not ( = ?auto_1136764 ?auto_1136766 ) ) ( not ( = ?auto_1136764 ?auto_1136767 ) ) ( not ( = ?auto_1136764 ?auto_1136768 ) ) ( not ( = ?auto_1136764 ?auto_1136769 ) ) ( not ( = ?auto_1136764 ?auto_1136770 ) ) ( not ( = ?auto_1136765 ?auto_1136766 ) ) ( not ( = ?auto_1136765 ?auto_1136767 ) ) ( not ( = ?auto_1136765 ?auto_1136768 ) ) ( not ( = ?auto_1136765 ?auto_1136769 ) ) ( not ( = ?auto_1136765 ?auto_1136770 ) ) ( not ( = ?auto_1136766 ?auto_1136767 ) ) ( not ( = ?auto_1136766 ?auto_1136768 ) ) ( not ( = ?auto_1136766 ?auto_1136769 ) ) ( not ( = ?auto_1136766 ?auto_1136770 ) ) ( not ( = ?auto_1136767 ?auto_1136768 ) ) ( not ( = ?auto_1136767 ?auto_1136769 ) ) ( not ( = ?auto_1136767 ?auto_1136770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1136768 ?auto_1136769 ?auto_1136770 )
      ( MAKE-11CRATE-VERIFY ?auto_1136759 ?auto_1136760 ?auto_1136761 ?auto_1136762 ?auto_1136763 ?auto_1136764 ?auto_1136765 ?auto_1136766 ?auto_1136767 ?auto_1136768 ?auto_1136769 ?auto_1136770 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1136880 - SURFACE
      ?auto_1136881 - SURFACE
      ?auto_1136882 - SURFACE
      ?auto_1136883 - SURFACE
      ?auto_1136884 - SURFACE
      ?auto_1136885 - SURFACE
      ?auto_1136886 - SURFACE
      ?auto_1136887 - SURFACE
      ?auto_1136888 - SURFACE
      ?auto_1136889 - SURFACE
      ?auto_1136890 - SURFACE
      ?auto_1136891 - SURFACE
    )
    :vars
    (
      ?auto_1136893 - HOIST
      ?auto_1136895 - PLACE
      ?auto_1136892 - TRUCK
      ?auto_1136894 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1136893 ?auto_1136895 ) ( SURFACE-AT ?auto_1136890 ?auto_1136895 ) ( CLEAR ?auto_1136890 ) ( IS-CRATE ?auto_1136891 ) ( not ( = ?auto_1136890 ?auto_1136891 ) ) ( AVAILABLE ?auto_1136893 ) ( IN ?auto_1136891 ?auto_1136892 ) ( ON ?auto_1136890 ?auto_1136889 ) ( not ( = ?auto_1136889 ?auto_1136890 ) ) ( not ( = ?auto_1136889 ?auto_1136891 ) ) ( TRUCK-AT ?auto_1136892 ?auto_1136894 ) ( not ( = ?auto_1136894 ?auto_1136895 ) ) ( ON ?auto_1136881 ?auto_1136880 ) ( ON ?auto_1136882 ?auto_1136881 ) ( ON ?auto_1136883 ?auto_1136882 ) ( ON ?auto_1136884 ?auto_1136883 ) ( ON ?auto_1136885 ?auto_1136884 ) ( ON ?auto_1136886 ?auto_1136885 ) ( ON ?auto_1136887 ?auto_1136886 ) ( ON ?auto_1136888 ?auto_1136887 ) ( ON ?auto_1136889 ?auto_1136888 ) ( not ( = ?auto_1136880 ?auto_1136881 ) ) ( not ( = ?auto_1136880 ?auto_1136882 ) ) ( not ( = ?auto_1136880 ?auto_1136883 ) ) ( not ( = ?auto_1136880 ?auto_1136884 ) ) ( not ( = ?auto_1136880 ?auto_1136885 ) ) ( not ( = ?auto_1136880 ?auto_1136886 ) ) ( not ( = ?auto_1136880 ?auto_1136887 ) ) ( not ( = ?auto_1136880 ?auto_1136888 ) ) ( not ( = ?auto_1136880 ?auto_1136889 ) ) ( not ( = ?auto_1136880 ?auto_1136890 ) ) ( not ( = ?auto_1136880 ?auto_1136891 ) ) ( not ( = ?auto_1136881 ?auto_1136882 ) ) ( not ( = ?auto_1136881 ?auto_1136883 ) ) ( not ( = ?auto_1136881 ?auto_1136884 ) ) ( not ( = ?auto_1136881 ?auto_1136885 ) ) ( not ( = ?auto_1136881 ?auto_1136886 ) ) ( not ( = ?auto_1136881 ?auto_1136887 ) ) ( not ( = ?auto_1136881 ?auto_1136888 ) ) ( not ( = ?auto_1136881 ?auto_1136889 ) ) ( not ( = ?auto_1136881 ?auto_1136890 ) ) ( not ( = ?auto_1136881 ?auto_1136891 ) ) ( not ( = ?auto_1136882 ?auto_1136883 ) ) ( not ( = ?auto_1136882 ?auto_1136884 ) ) ( not ( = ?auto_1136882 ?auto_1136885 ) ) ( not ( = ?auto_1136882 ?auto_1136886 ) ) ( not ( = ?auto_1136882 ?auto_1136887 ) ) ( not ( = ?auto_1136882 ?auto_1136888 ) ) ( not ( = ?auto_1136882 ?auto_1136889 ) ) ( not ( = ?auto_1136882 ?auto_1136890 ) ) ( not ( = ?auto_1136882 ?auto_1136891 ) ) ( not ( = ?auto_1136883 ?auto_1136884 ) ) ( not ( = ?auto_1136883 ?auto_1136885 ) ) ( not ( = ?auto_1136883 ?auto_1136886 ) ) ( not ( = ?auto_1136883 ?auto_1136887 ) ) ( not ( = ?auto_1136883 ?auto_1136888 ) ) ( not ( = ?auto_1136883 ?auto_1136889 ) ) ( not ( = ?auto_1136883 ?auto_1136890 ) ) ( not ( = ?auto_1136883 ?auto_1136891 ) ) ( not ( = ?auto_1136884 ?auto_1136885 ) ) ( not ( = ?auto_1136884 ?auto_1136886 ) ) ( not ( = ?auto_1136884 ?auto_1136887 ) ) ( not ( = ?auto_1136884 ?auto_1136888 ) ) ( not ( = ?auto_1136884 ?auto_1136889 ) ) ( not ( = ?auto_1136884 ?auto_1136890 ) ) ( not ( = ?auto_1136884 ?auto_1136891 ) ) ( not ( = ?auto_1136885 ?auto_1136886 ) ) ( not ( = ?auto_1136885 ?auto_1136887 ) ) ( not ( = ?auto_1136885 ?auto_1136888 ) ) ( not ( = ?auto_1136885 ?auto_1136889 ) ) ( not ( = ?auto_1136885 ?auto_1136890 ) ) ( not ( = ?auto_1136885 ?auto_1136891 ) ) ( not ( = ?auto_1136886 ?auto_1136887 ) ) ( not ( = ?auto_1136886 ?auto_1136888 ) ) ( not ( = ?auto_1136886 ?auto_1136889 ) ) ( not ( = ?auto_1136886 ?auto_1136890 ) ) ( not ( = ?auto_1136886 ?auto_1136891 ) ) ( not ( = ?auto_1136887 ?auto_1136888 ) ) ( not ( = ?auto_1136887 ?auto_1136889 ) ) ( not ( = ?auto_1136887 ?auto_1136890 ) ) ( not ( = ?auto_1136887 ?auto_1136891 ) ) ( not ( = ?auto_1136888 ?auto_1136889 ) ) ( not ( = ?auto_1136888 ?auto_1136890 ) ) ( not ( = ?auto_1136888 ?auto_1136891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1136889 ?auto_1136890 ?auto_1136891 )
      ( MAKE-11CRATE-VERIFY ?auto_1136880 ?auto_1136881 ?auto_1136882 ?auto_1136883 ?auto_1136884 ?auto_1136885 ?auto_1136886 ?auto_1136887 ?auto_1136888 ?auto_1136889 ?auto_1136890 ?auto_1136891 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1137012 - SURFACE
      ?auto_1137013 - SURFACE
      ?auto_1137014 - SURFACE
      ?auto_1137015 - SURFACE
      ?auto_1137016 - SURFACE
      ?auto_1137017 - SURFACE
      ?auto_1137018 - SURFACE
      ?auto_1137019 - SURFACE
      ?auto_1137020 - SURFACE
      ?auto_1137021 - SURFACE
      ?auto_1137022 - SURFACE
      ?auto_1137023 - SURFACE
    )
    :vars
    (
      ?auto_1137026 - HOIST
      ?auto_1137024 - PLACE
      ?auto_1137027 - TRUCK
      ?auto_1137025 - PLACE
      ?auto_1137028 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1137026 ?auto_1137024 ) ( SURFACE-AT ?auto_1137022 ?auto_1137024 ) ( CLEAR ?auto_1137022 ) ( IS-CRATE ?auto_1137023 ) ( not ( = ?auto_1137022 ?auto_1137023 ) ) ( AVAILABLE ?auto_1137026 ) ( ON ?auto_1137022 ?auto_1137021 ) ( not ( = ?auto_1137021 ?auto_1137022 ) ) ( not ( = ?auto_1137021 ?auto_1137023 ) ) ( TRUCK-AT ?auto_1137027 ?auto_1137025 ) ( not ( = ?auto_1137025 ?auto_1137024 ) ) ( HOIST-AT ?auto_1137028 ?auto_1137025 ) ( LIFTING ?auto_1137028 ?auto_1137023 ) ( not ( = ?auto_1137026 ?auto_1137028 ) ) ( ON ?auto_1137013 ?auto_1137012 ) ( ON ?auto_1137014 ?auto_1137013 ) ( ON ?auto_1137015 ?auto_1137014 ) ( ON ?auto_1137016 ?auto_1137015 ) ( ON ?auto_1137017 ?auto_1137016 ) ( ON ?auto_1137018 ?auto_1137017 ) ( ON ?auto_1137019 ?auto_1137018 ) ( ON ?auto_1137020 ?auto_1137019 ) ( ON ?auto_1137021 ?auto_1137020 ) ( not ( = ?auto_1137012 ?auto_1137013 ) ) ( not ( = ?auto_1137012 ?auto_1137014 ) ) ( not ( = ?auto_1137012 ?auto_1137015 ) ) ( not ( = ?auto_1137012 ?auto_1137016 ) ) ( not ( = ?auto_1137012 ?auto_1137017 ) ) ( not ( = ?auto_1137012 ?auto_1137018 ) ) ( not ( = ?auto_1137012 ?auto_1137019 ) ) ( not ( = ?auto_1137012 ?auto_1137020 ) ) ( not ( = ?auto_1137012 ?auto_1137021 ) ) ( not ( = ?auto_1137012 ?auto_1137022 ) ) ( not ( = ?auto_1137012 ?auto_1137023 ) ) ( not ( = ?auto_1137013 ?auto_1137014 ) ) ( not ( = ?auto_1137013 ?auto_1137015 ) ) ( not ( = ?auto_1137013 ?auto_1137016 ) ) ( not ( = ?auto_1137013 ?auto_1137017 ) ) ( not ( = ?auto_1137013 ?auto_1137018 ) ) ( not ( = ?auto_1137013 ?auto_1137019 ) ) ( not ( = ?auto_1137013 ?auto_1137020 ) ) ( not ( = ?auto_1137013 ?auto_1137021 ) ) ( not ( = ?auto_1137013 ?auto_1137022 ) ) ( not ( = ?auto_1137013 ?auto_1137023 ) ) ( not ( = ?auto_1137014 ?auto_1137015 ) ) ( not ( = ?auto_1137014 ?auto_1137016 ) ) ( not ( = ?auto_1137014 ?auto_1137017 ) ) ( not ( = ?auto_1137014 ?auto_1137018 ) ) ( not ( = ?auto_1137014 ?auto_1137019 ) ) ( not ( = ?auto_1137014 ?auto_1137020 ) ) ( not ( = ?auto_1137014 ?auto_1137021 ) ) ( not ( = ?auto_1137014 ?auto_1137022 ) ) ( not ( = ?auto_1137014 ?auto_1137023 ) ) ( not ( = ?auto_1137015 ?auto_1137016 ) ) ( not ( = ?auto_1137015 ?auto_1137017 ) ) ( not ( = ?auto_1137015 ?auto_1137018 ) ) ( not ( = ?auto_1137015 ?auto_1137019 ) ) ( not ( = ?auto_1137015 ?auto_1137020 ) ) ( not ( = ?auto_1137015 ?auto_1137021 ) ) ( not ( = ?auto_1137015 ?auto_1137022 ) ) ( not ( = ?auto_1137015 ?auto_1137023 ) ) ( not ( = ?auto_1137016 ?auto_1137017 ) ) ( not ( = ?auto_1137016 ?auto_1137018 ) ) ( not ( = ?auto_1137016 ?auto_1137019 ) ) ( not ( = ?auto_1137016 ?auto_1137020 ) ) ( not ( = ?auto_1137016 ?auto_1137021 ) ) ( not ( = ?auto_1137016 ?auto_1137022 ) ) ( not ( = ?auto_1137016 ?auto_1137023 ) ) ( not ( = ?auto_1137017 ?auto_1137018 ) ) ( not ( = ?auto_1137017 ?auto_1137019 ) ) ( not ( = ?auto_1137017 ?auto_1137020 ) ) ( not ( = ?auto_1137017 ?auto_1137021 ) ) ( not ( = ?auto_1137017 ?auto_1137022 ) ) ( not ( = ?auto_1137017 ?auto_1137023 ) ) ( not ( = ?auto_1137018 ?auto_1137019 ) ) ( not ( = ?auto_1137018 ?auto_1137020 ) ) ( not ( = ?auto_1137018 ?auto_1137021 ) ) ( not ( = ?auto_1137018 ?auto_1137022 ) ) ( not ( = ?auto_1137018 ?auto_1137023 ) ) ( not ( = ?auto_1137019 ?auto_1137020 ) ) ( not ( = ?auto_1137019 ?auto_1137021 ) ) ( not ( = ?auto_1137019 ?auto_1137022 ) ) ( not ( = ?auto_1137019 ?auto_1137023 ) ) ( not ( = ?auto_1137020 ?auto_1137021 ) ) ( not ( = ?auto_1137020 ?auto_1137022 ) ) ( not ( = ?auto_1137020 ?auto_1137023 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1137021 ?auto_1137022 ?auto_1137023 )
      ( MAKE-11CRATE-VERIFY ?auto_1137012 ?auto_1137013 ?auto_1137014 ?auto_1137015 ?auto_1137016 ?auto_1137017 ?auto_1137018 ?auto_1137019 ?auto_1137020 ?auto_1137021 ?auto_1137022 ?auto_1137023 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1137155 - SURFACE
      ?auto_1137156 - SURFACE
      ?auto_1137157 - SURFACE
      ?auto_1137158 - SURFACE
      ?auto_1137159 - SURFACE
      ?auto_1137160 - SURFACE
      ?auto_1137161 - SURFACE
      ?auto_1137162 - SURFACE
      ?auto_1137163 - SURFACE
      ?auto_1137164 - SURFACE
      ?auto_1137165 - SURFACE
      ?auto_1137166 - SURFACE
    )
    :vars
    (
      ?auto_1137169 - HOIST
      ?auto_1137167 - PLACE
      ?auto_1137170 - TRUCK
      ?auto_1137168 - PLACE
      ?auto_1137171 - HOIST
      ?auto_1137172 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1137169 ?auto_1137167 ) ( SURFACE-AT ?auto_1137165 ?auto_1137167 ) ( CLEAR ?auto_1137165 ) ( IS-CRATE ?auto_1137166 ) ( not ( = ?auto_1137165 ?auto_1137166 ) ) ( AVAILABLE ?auto_1137169 ) ( ON ?auto_1137165 ?auto_1137164 ) ( not ( = ?auto_1137164 ?auto_1137165 ) ) ( not ( = ?auto_1137164 ?auto_1137166 ) ) ( TRUCK-AT ?auto_1137170 ?auto_1137168 ) ( not ( = ?auto_1137168 ?auto_1137167 ) ) ( HOIST-AT ?auto_1137171 ?auto_1137168 ) ( not ( = ?auto_1137169 ?auto_1137171 ) ) ( AVAILABLE ?auto_1137171 ) ( SURFACE-AT ?auto_1137166 ?auto_1137168 ) ( ON ?auto_1137166 ?auto_1137172 ) ( CLEAR ?auto_1137166 ) ( not ( = ?auto_1137165 ?auto_1137172 ) ) ( not ( = ?auto_1137166 ?auto_1137172 ) ) ( not ( = ?auto_1137164 ?auto_1137172 ) ) ( ON ?auto_1137156 ?auto_1137155 ) ( ON ?auto_1137157 ?auto_1137156 ) ( ON ?auto_1137158 ?auto_1137157 ) ( ON ?auto_1137159 ?auto_1137158 ) ( ON ?auto_1137160 ?auto_1137159 ) ( ON ?auto_1137161 ?auto_1137160 ) ( ON ?auto_1137162 ?auto_1137161 ) ( ON ?auto_1137163 ?auto_1137162 ) ( ON ?auto_1137164 ?auto_1137163 ) ( not ( = ?auto_1137155 ?auto_1137156 ) ) ( not ( = ?auto_1137155 ?auto_1137157 ) ) ( not ( = ?auto_1137155 ?auto_1137158 ) ) ( not ( = ?auto_1137155 ?auto_1137159 ) ) ( not ( = ?auto_1137155 ?auto_1137160 ) ) ( not ( = ?auto_1137155 ?auto_1137161 ) ) ( not ( = ?auto_1137155 ?auto_1137162 ) ) ( not ( = ?auto_1137155 ?auto_1137163 ) ) ( not ( = ?auto_1137155 ?auto_1137164 ) ) ( not ( = ?auto_1137155 ?auto_1137165 ) ) ( not ( = ?auto_1137155 ?auto_1137166 ) ) ( not ( = ?auto_1137155 ?auto_1137172 ) ) ( not ( = ?auto_1137156 ?auto_1137157 ) ) ( not ( = ?auto_1137156 ?auto_1137158 ) ) ( not ( = ?auto_1137156 ?auto_1137159 ) ) ( not ( = ?auto_1137156 ?auto_1137160 ) ) ( not ( = ?auto_1137156 ?auto_1137161 ) ) ( not ( = ?auto_1137156 ?auto_1137162 ) ) ( not ( = ?auto_1137156 ?auto_1137163 ) ) ( not ( = ?auto_1137156 ?auto_1137164 ) ) ( not ( = ?auto_1137156 ?auto_1137165 ) ) ( not ( = ?auto_1137156 ?auto_1137166 ) ) ( not ( = ?auto_1137156 ?auto_1137172 ) ) ( not ( = ?auto_1137157 ?auto_1137158 ) ) ( not ( = ?auto_1137157 ?auto_1137159 ) ) ( not ( = ?auto_1137157 ?auto_1137160 ) ) ( not ( = ?auto_1137157 ?auto_1137161 ) ) ( not ( = ?auto_1137157 ?auto_1137162 ) ) ( not ( = ?auto_1137157 ?auto_1137163 ) ) ( not ( = ?auto_1137157 ?auto_1137164 ) ) ( not ( = ?auto_1137157 ?auto_1137165 ) ) ( not ( = ?auto_1137157 ?auto_1137166 ) ) ( not ( = ?auto_1137157 ?auto_1137172 ) ) ( not ( = ?auto_1137158 ?auto_1137159 ) ) ( not ( = ?auto_1137158 ?auto_1137160 ) ) ( not ( = ?auto_1137158 ?auto_1137161 ) ) ( not ( = ?auto_1137158 ?auto_1137162 ) ) ( not ( = ?auto_1137158 ?auto_1137163 ) ) ( not ( = ?auto_1137158 ?auto_1137164 ) ) ( not ( = ?auto_1137158 ?auto_1137165 ) ) ( not ( = ?auto_1137158 ?auto_1137166 ) ) ( not ( = ?auto_1137158 ?auto_1137172 ) ) ( not ( = ?auto_1137159 ?auto_1137160 ) ) ( not ( = ?auto_1137159 ?auto_1137161 ) ) ( not ( = ?auto_1137159 ?auto_1137162 ) ) ( not ( = ?auto_1137159 ?auto_1137163 ) ) ( not ( = ?auto_1137159 ?auto_1137164 ) ) ( not ( = ?auto_1137159 ?auto_1137165 ) ) ( not ( = ?auto_1137159 ?auto_1137166 ) ) ( not ( = ?auto_1137159 ?auto_1137172 ) ) ( not ( = ?auto_1137160 ?auto_1137161 ) ) ( not ( = ?auto_1137160 ?auto_1137162 ) ) ( not ( = ?auto_1137160 ?auto_1137163 ) ) ( not ( = ?auto_1137160 ?auto_1137164 ) ) ( not ( = ?auto_1137160 ?auto_1137165 ) ) ( not ( = ?auto_1137160 ?auto_1137166 ) ) ( not ( = ?auto_1137160 ?auto_1137172 ) ) ( not ( = ?auto_1137161 ?auto_1137162 ) ) ( not ( = ?auto_1137161 ?auto_1137163 ) ) ( not ( = ?auto_1137161 ?auto_1137164 ) ) ( not ( = ?auto_1137161 ?auto_1137165 ) ) ( not ( = ?auto_1137161 ?auto_1137166 ) ) ( not ( = ?auto_1137161 ?auto_1137172 ) ) ( not ( = ?auto_1137162 ?auto_1137163 ) ) ( not ( = ?auto_1137162 ?auto_1137164 ) ) ( not ( = ?auto_1137162 ?auto_1137165 ) ) ( not ( = ?auto_1137162 ?auto_1137166 ) ) ( not ( = ?auto_1137162 ?auto_1137172 ) ) ( not ( = ?auto_1137163 ?auto_1137164 ) ) ( not ( = ?auto_1137163 ?auto_1137165 ) ) ( not ( = ?auto_1137163 ?auto_1137166 ) ) ( not ( = ?auto_1137163 ?auto_1137172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1137164 ?auto_1137165 ?auto_1137166 )
      ( MAKE-11CRATE-VERIFY ?auto_1137155 ?auto_1137156 ?auto_1137157 ?auto_1137158 ?auto_1137159 ?auto_1137160 ?auto_1137161 ?auto_1137162 ?auto_1137163 ?auto_1137164 ?auto_1137165 ?auto_1137166 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1137299 - SURFACE
      ?auto_1137300 - SURFACE
      ?auto_1137301 - SURFACE
      ?auto_1137302 - SURFACE
      ?auto_1137303 - SURFACE
      ?auto_1137304 - SURFACE
      ?auto_1137305 - SURFACE
      ?auto_1137306 - SURFACE
      ?auto_1137307 - SURFACE
      ?auto_1137308 - SURFACE
      ?auto_1137309 - SURFACE
      ?auto_1137310 - SURFACE
    )
    :vars
    (
      ?auto_1137313 - HOIST
      ?auto_1137315 - PLACE
      ?auto_1137311 - PLACE
      ?auto_1137314 - HOIST
      ?auto_1137312 - SURFACE
      ?auto_1137316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1137313 ?auto_1137315 ) ( SURFACE-AT ?auto_1137309 ?auto_1137315 ) ( CLEAR ?auto_1137309 ) ( IS-CRATE ?auto_1137310 ) ( not ( = ?auto_1137309 ?auto_1137310 ) ) ( AVAILABLE ?auto_1137313 ) ( ON ?auto_1137309 ?auto_1137308 ) ( not ( = ?auto_1137308 ?auto_1137309 ) ) ( not ( = ?auto_1137308 ?auto_1137310 ) ) ( not ( = ?auto_1137311 ?auto_1137315 ) ) ( HOIST-AT ?auto_1137314 ?auto_1137311 ) ( not ( = ?auto_1137313 ?auto_1137314 ) ) ( AVAILABLE ?auto_1137314 ) ( SURFACE-AT ?auto_1137310 ?auto_1137311 ) ( ON ?auto_1137310 ?auto_1137312 ) ( CLEAR ?auto_1137310 ) ( not ( = ?auto_1137309 ?auto_1137312 ) ) ( not ( = ?auto_1137310 ?auto_1137312 ) ) ( not ( = ?auto_1137308 ?auto_1137312 ) ) ( TRUCK-AT ?auto_1137316 ?auto_1137315 ) ( ON ?auto_1137300 ?auto_1137299 ) ( ON ?auto_1137301 ?auto_1137300 ) ( ON ?auto_1137302 ?auto_1137301 ) ( ON ?auto_1137303 ?auto_1137302 ) ( ON ?auto_1137304 ?auto_1137303 ) ( ON ?auto_1137305 ?auto_1137304 ) ( ON ?auto_1137306 ?auto_1137305 ) ( ON ?auto_1137307 ?auto_1137306 ) ( ON ?auto_1137308 ?auto_1137307 ) ( not ( = ?auto_1137299 ?auto_1137300 ) ) ( not ( = ?auto_1137299 ?auto_1137301 ) ) ( not ( = ?auto_1137299 ?auto_1137302 ) ) ( not ( = ?auto_1137299 ?auto_1137303 ) ) ( not ( = ?auto_1137299 ?auto_1137304 ) ) ( not ( = ?auto_1137299 ?auto_1137305 ) ) ( not ( = ?auto_1137299 ?auto_1137306 ) ) ( not ( = ?auto_1137299 ?auto_1137307 ) ) ( not ( = ?auto_1137299 ?auto_1137308 ) ) ( not ( = ?auto_1137299 ?auto_1137309 ) ) ( not ( = ?auto_1137299 ?auto_1137310 ) ) ( not ( = ?auto_1137299 ?auto_1137312 ) ) ( not ( = ?auto_1137300 ?auto_1137301 ) ) ( not ( = ?auto_1137300 ?auto_1137302 ) ) ( not ( = ?auto_1137300 ?auto_1137303 ) ) ( not ( = ?auto_1137300 ?auto_1137304 ) ) ( not ( = ?auto_1137300 ?auto_1137305 ) ) ( not ( = ?auto_1137300 ?auto_1137306 ) ) ( not ( = ?auto_1137300 ?auto_1137307 ) ) ( not ( = ?auto_1137300 ?auto_1137308 ) ) ( not ( = ?auto_1137300 ?auto_1137309 ) ) ( not ( = ?auto_1137300 ?auto_1137310 ) ) ( not ( = ?auto_1137300 ?auto_1137312 ) ) ( not ( = ?auto_1137301 ?auto_1137302 ) ) ( not ( = ?auto_1137301 ?auto_1137303 ) ) ( not ( = ?auto_1137301 ?auto_1137304 ) ) ( not ( = ?auto_1137301 ?auto_1137305 ) ) ( not ( = ?auto_1137301 ?auto_1137306 ) ) ( not ( = ?auto_1137301 ?auto_1137307 ) ) ( not ( = ?auto_1137301 ?auto_1137308 ) ) ( not ( = ?auto_1137301 ?auto_1137309 ) ) ( not ( = ?auto_1137301 ?auto_1137310 ) ) ( not ( = ?auto_1137301 ?auto_1137312 ) ) ( not ( = ?auto_1137302 ?auto_1137303 ) ) ( not ( = ?auto_1137302 ?auto_1137304 ) ) ( not ( = ?auto_1137302 ?auto_1137305 ) ) ( not ( = ?auto_1137302 ?auto_1137306 ) ) ( not ( = ?auto_1137302 ?auto_1137307 ) ) ( not ( = ?auto_1137302 ?auto_1137308 ) ) ( not ( = ?auto_1137302 ?auto_1137309 ) ) ( not ( = ?auto_1137302 ?auto_1137310 ) ) ( not ( = ?auto_1137302 ?auto_1137312 ) ) ( not ( = ?auto_1137303 ?auto_1137304 ) ) ( not ( = ?auto_1137303 ?auto_1137305 ) ) ( not ( = ?auto_1137303 ?auto_1137306 ) ) ( not ( = ?auto_1137303 ?auto_1137307 ) ) ( not ( = ?auto_1137303 ?auto_1137308 ) ) ( not ( = ?auto_1137303 ?auto_1137309 ) ) ( not ( = ?auto_1137303 ?auto_1137310 ) ) ( not ( = ?auto_1137303 ?auto_1137312 ) ) ( not ( = ?auto_1137304 ?auto_1137305 ) ) ( not ( = ?auto_1137304 ?auto_1137306 ) ) ( not ( = ?auto_1137304 ?auto_1137307 ) ) ( not ( = ?auto_1137304 ?auto_1137308 ) ) ( not ( = ?auto_1137304 ?auto_1137309 ) ) ( not ( = ?auto_1137304 ?auto_1137310 ) ) ( not ( = ?auto_1137304 ?auto_1137312 ) ) ( not ( = ?auto_1137305 ?auto_1137306 ) ) ( not ( = ?auto_1137305 ?auto_1137307 ) ) ( not ( = ?auto_1137305 ?auto_1137308 ) ) ( not ( = ?auto_1137305 ?auto_1137309 ) ) ( not ( = ?auto_1137305 ?auto_1137310 ) ) ( not ( = ?auto_1137305 ?auto_1137312 ) ) ( not ( = ?auto_1137306 ?auto_1137307 ) ) ( not ( = ?auto_1137306 ?auto_1137308 ) ) ( not ( = ?auto_1137306 ?auto_1137309 ) ) ( not ( = ?auto_1137306 ?auto_1137310 ) ) ( not ( = ?auto_1137306 ?auto_1137312 ) ) ( not ( = ?auto_1137307 ?auto_1137308 ) ) ( not ( = ?auto_1137307 ?auto_1137309 ) ) ( not ( = ?auto_1137307 ?auto_1137310 ) ) ( not ( = ?auto_1137307 ?auto_1137312 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1137308 ?auto_1137309 ?auto_1137310 )
      ( MAKE-11CRATE-VERIFY ?auto_1137299 ?auto_1137300 ?auto_1137301 ?auto_1137302 ?auto_1137303 ?auto_1137304 ?auto_1137305 ?auto_1137306 ?auto_1137307 ?auto_1137308 ?auto_1137309 ?auto_1137310 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1137443 - SURFACE
      ?auto_1137444 - SURFACE
      ?auto_1137445 - SURFACE
      ?auto_1137446 - SURFACE
      ?auto_1137447 - SURFACE
      ?auto_1137448 - SURFACE
      ?auto_1137449 - SURFACE
      ?auto_1137450 - SURFACE
      ?auto_1137451 - SURFACE
      ?auto_1137452 - SURFACE
      ?auto_1137453 - SURFACE
      ?auto_1137454 - SURFACE
    )
    :vars
    (
      ?auto_1137460 - HOIST
      ?auto_1137458 - PLACE
      ?auto_1137459 - PLACE
      ?auto_1137455 - HOIST
      ?auto_1137456 - SURFACE
      ?auto_1137457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1137460 ?auto_1137458 ) ( IS-CRATE ?auto_1137454 ) ( not ( = ?auto_1137453 ?auto_1137454 ) ) ( not ( = ?auto_1137452 ?auto_1137453 ) ) ( not ( = ?auto_1137452 ?auto_1137454 ) ) ( not ( = ?auto_1137459 ?auto_1137458 ) ) ( HOIST-AT ?auto_1137455 ?auto_1137459 ) ( not ( = ?auto_1137460 ?auto_1137455 ) ) ( AVAILABLE ?auto_1137455 ) ( SURFACE-AT ?auto_1137454 ?auto_1137459 ) ( ON ?auto_1137454 ?auto_1137456 ) ( CLEAR ?auto_1137454 ) ( not ( = ?auto_1137453 ?auto_1137456 ) ) ( not ( = ?auto_1137454 ?auto_1137456 ) ) ( not ( = ?auto_1137452 ?auto_1137456 ) ) ( TRUCK-AT ?auto_1137457 ?auto_1137458 ) ( SURFACE-AT ?auto_1137452 ?auto_1137458 ) ( CLEAR ?auto_1137452 ) ( LIFTING ?auto_1137460 ?auto_1137453 ) ( IS-CRATE ?auto_1137453 ) ( ON ?auto_1137444 ?auto_1137443 ) ( ON ?auto_1137445 ?auto_1137444 ) ( ON ?auto_1137446 ?auto_1137445 ) ( ON ?auto_1137447 ?auto_1137446 ) ( ON ?auto_1137448 ?auto_1137447 ) ( ON ?auto_1137449 ?auto_1137448 ) ( ON ?auto_1137450 ?auto_1137449 ) ( ON ?auto_1137451 ?auto_1137450 ) ( ON ?auto_1137452 ?auto_1137451 ) ( not ( = ?auto_1137443 ?auto_1137444 ) ) ( not ( = ?auto_1137443 ?auto_1137445 ) ) ( not ( = ?auto_1137443 ?auto_1137446 ) ) ( not ( = ?auto_1137443 ?auto_1137447 ) ) ( not ( = ?auto_1137443 ?auto_1137448 ) ) ( not ( = ?auto_1137443 ?auto_1137449 ) ) ( not ( = ?auto_1137443 ?auto_1137450 ) ) ( not ( = ?auto_1137443 ?auto_1137451 ) ) ( not ( = ?auto_1137443 ?auto_1137452 ) ) ( not ( = ?auto_1137443 ?auto_1137453 ) ) ( not ( = ?auto_1137443 ?auto_1137454 ) ) ( not ( = ?auto_1137443 ?auto_1137456 ) ) ( not ( = ?auto_1137444 ?auto_1137445 ) ) ( not ( = ?auto_1137444 ?auto_1137446 ) ) ( not ( = ?auto_1137444 ?auto_1137447 ) ) ( not ( = ?auto_1137444 ?auto_1137448 ) ) ( not ( = ?auto_1137444 ?auto_1137449 ) ) ( not ( = ?auto_1137444 ?auto_1137450 ) ) ( not ( = ?auto_1137444 ?auto_1137451 ) ) ( not ( = ?auto_1137444 ?auto_1137452 ) ) ( not ( = ?auto_1137444 ?auto_1137453 ) ) ( not ( = ?auto_1137444 ?auto_1137454 ) ) ( not ( = ?auto_1137444 ?auto_1137456 ) ) ( not ( = ?auto_1137445 ?auto_1137446 ) ) ( not ( = ?auto_1137445 ?auto_1137447 ) ) ( not ( = ?auto_1137445 ?auto_1137448 ) ) ( not ( = ?auto_1137445 ?auto_1137449 ) ) ( not ( = ?auto_1137445 ?auto_1137450 ) ) ( not ( = ?auto_1137445 ?auto_1137451 ) ) ( not ( = ?auto_1137445 ?auto_1137452 ) ) ( not ( = ?auto_1137445 ?auto_1137453 ) ) ( not ( = ?auto_1137445 ?auto_1137454 ) ) ( not ( = ?auto_1137445 ?auto_1137456 ) ) ( not ( = ?auto_1137446 ?auto_1137447 ) ) ( not ( = ?auto_1137446 ?auto_1137448 ) ) ( not ( = ?auto_1137446 ?auto_1137449 ) ) ( not ( = ?auto_1137446 ?auto_1137450 ) ) ( not ( = ?auto_1137446 ?auto_1137451 ) ) ( not ( = ?auto_1137446 ?auto_1137452 ) ) ( not ( = ?auto_1137446 ?auto_1137453 ) ) ( not ( = ?auto_1137446 ?auto_1137454 ) ) ( not ( = ?auto_1137446 ?auto_1137456 ) ) ( not ( = ?auto_1137447 ?auto_1137448 ) ) ( not ( = ?auto_1137447 ?auto_1137449 ) ) ( not ( = ?auto_1137447 ?auto_1137450 ) ) ( not ( = ?auto_1137447 ?auto_1137451 ) ) ( not ( = ?auto_1137447 ?auto_1137452 ) ) ( not ( = ?auto_1137447 ?auto_1137453 ) ) ( not ( = ?auto_1137447 ?auto_1137454 ) ) ( not ( = ?auto_1137447 ?auto_1137456 ) ) ( not ( = ?auto_1137448 ?auto_1137449 ) ) ( not ( = ?auto_1137448 ?auto_1137450 ) ) ( not ( = ?auto_1137448 ?auto_1137451 ) ) ( not ( = ?auto_1137448 ?auto_1137452 ) ) ( not ( = ?auto_1137448 ?auto_1137453 ) ) ( not ( = ?auto_1137448 ?auto_1137454 ) ) ( not ( = ?auto_1137448 ?auto_1137456 ) ) ( not ( = ?auto_1137449 ?auto_1137450 ) ) ( not ( = ?auto_1137449 ?auto_1137451 ) ) ( not ( = ?auto_1137449 ?auto_1137452 ) ) ( not ( = ?auto_1137449 ?auto_1137453 ) ) ( not ( = ?auto_1137449 ?auto_1137454 ) ) ( not ( = ?auto_1137449 ?auto_1137456 ) ) ( not ( = ?auto_1137450 ?auto_1137451 ) ) ( not ( = ?auto_1137450 ?auto_1137452 ) ) ( not ( = ?auto_1137450 ?auto_1137453 ) ) ( not ( = ?auto_1137450 ?auto_1137454 ) ) ( not ( = ?auto_1137450 ?auto_1137456 ) ) ( not ( = ?auto_1137451 ?auto_1137452 ) ) ( not ( = ?auto_1137451 ?auto_1137453 ) ) ( not ( = ?auto_1137451 ?auto_1137454 ) ) ( not ( = ?auto_1137451 ?auto_1137456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1137452 ?auto_1137453 ?auto_1137454 )
      ( MAKE-11CRATE-VERIFY ?auto_1137443 ?auto_1137444 ?auto_1137445 ?auto_1137446 ?auto_1137447 ?auto_1137448 ?auto_1137449 ?auto_1137450 ?auto_1137451 ?auto_1137452 ?auto_1137453 ?auto_1137454 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1137587 - SURFACE
      ?auto_1137588 - SURFACE
      ?auto_1137589 - SURFACE
      ?auto_1137590 - SURFACE
      ?auto_1137591 - SURFACE
      ?auto_1137592 - SURFACE
      ?auto_1137593 - SURFACE
      ?auto_1137594 - SURFACE
      ?auto_1137595 - SURFACE
      ?auto_1137596 - SURFACE
      ?auto_1137597 - SURFACE
      ?auto_1137598 - SURFACE
    )
    :vars
    (
      ?auto_1137604 - HOIST
      ?auto_1137603 - PLACE
      ?auto_1137602 - PLACE
      ?auto_1137600 - HOIST
      ?auto_1137599 - SURFACE
      ?auto_1137601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1137604 ?auto_1137603 ) ( IS-CRATE ?auto_1137598 ) ( not ( = ?auto_1137597 ?auto_1137598 ) ) ( not ( = ?auto_1137596 ?auto_1137597 ) ) ( not ( = ?auto_1137596 ?auto_1137598 ) ) ( not ( = ?auto_1137602 ?auto_1137603 ) ) ( HOIST-AT ?auto_1137600 ?auto_1137602 ) ( not ( = ?auto_1137604 ?auto_1137600 ) ) ( AVAILABLE ?auto_1137600 ) ( SURFACE-AT ?auto_1137598 ?auto_1137602 ) ( ON ?auto_1137598 ?auto_1137599 ) ( CLEAR ?auto_1137598 ) ( not ( = ?auto_1137597 ?auto_1137599 ) ) ( not ( = ?auto_1137598 ?auto_1137599 ) ) ( not ( = ?auto_1137596 ?auto_1137599 ) ) ( TRUCK-AT ?auto_1137601 ?auto_1137603 ) ( SURFACE-AT ?auto_1137596 ?auto_1137603 ) ( CLEAR ?auto_1137596 ) ( IS-CRATE ?auto_1137597 ) ( AVAILABLE ?auto_1137604 ) ( IN ?auto_1137597 ?auto_1137601 ) ( ON ?auto_1137588 ?auto_1137587 ) ( ON ?auto_1137589 ?auto_1137588 ) ( ON ?auto_1137590 ?auto_1137589 ) ( ON ?auto_1137591 ?auto_1137590 ) ( ON ?auto_1137592 ?auto_1137591 ) ( ON ?auto_1137593 ?auto_1137592 ) ( ON ?auto_1137594 ?auto_1137593 ) ( ON ?auto_1137595 ?auto_1137594 ) ( ON ?auto_1137596 ?auto_1137595 ) ( not ( = ?auto_1137587 ?auto_1137588 ) ) ( not ( = ?auto_1137587 ?auto_1137589 ) ) ( not ( = ?auto_1137587 ?auto_1137590 ) ) ( not ( = ?auto_1137587 ?auto_1137591 ) ) ( not ( = ?auto_1137587 ?auto_1137592 ) ) ( not ( = ?auto_1137587 ?auto_1137593 ) ) ( not ( = ?auto_1137587 ?auto_1137594 ) ) ( not ( = ?auto_1137587 ?auto_1137595 ) ) ( not ( = ?auto_1137587 ?auto_1137596 ) ) ( not ( = ?auto_1137587 ?auto_1137597 ) ) ( not ( = ?auto_1137587 ?auto_1137598 ) ) ( not ( = ?auto_1137587 ?auto_1137599 ) ) ( not ( = ?auto_1137588 ?auto_1137589 ) ) ( not ( = ?auto_1137588 ?auto_1137590 ) ) ( not ( = ?auto_1137588 ?auto_1137591 ) ) ( not ( = ?auto_1137588 ?auto_1137592 ) ) ( not ( = ?auto_1137588 ?auto_1137593 ) ) ( not ( = ?auto_1137588 ?auto_1137594 ) ) ( not ( = ?auto_1137588 ?auto_1137595 ) ) ( not ( = ?auto_1137588 ?auto_1137596 ) ) ( not ( = ?auto_1137588 ?auto_1137597 ) ) ( not ( = ?auto_1137588 ?auto_1137598 ) ) ( not ( = ?auto_1137588 ?auto_1137599 ) ) ( not ( = ?auto_1137589 ?auto_1137590 ) ) ( not ( = ?auto_1137589 ?auto_1137591 ) ) ( not ( = ?auto_1137589 ?auto_1137592 ) ) ( not ( = ?auto_1137589 ?auto_1137593 ) ) ( not ( = ?auto_1137589 ?auto_1137594 ) ) ( not ( = ?auto_1137589 ?auto_1137595 ) ) ( not ( = ?auto_1137589 ?auto_1137596 ) ) ( not ( = ?auto_1137589 ?auto_1137597 ) ) ( not ( = ?auto_1137589 ?auto_1137598 ) ) ( not ( = ?auto_1137589 ?auto_1137599 ) ) ( not ( = ?auto_1137590 ?auto_1137591 ) ) ( not ( = ?auto_1137590 ?auto_1137592 ) ) ( not ( = ?auto_1137590 ?auto_1137593 ) ) ( not ( = ?auto_1137590 ?auto_1137594 ) ) ( not ( = ?auto_1137590 ?auto_1137595 ) ) ( not ( = ?auto_1137590 ?auto_1137596 ) ) ( not ( = ?auto_1137590 ?auto_1137597 ) ) ( not ( = ?auto_1137590 ?auto_1137598 ) ) ( not ( = ?auto_1137590 ?auto_1137599 ) ) ( not ( = ?auto_1137591 ?auto_1137592 ) ) ( not ( = ?auto_1137591 ?auto_1137593 ) ) ( not ( = ?auto_1137591 ?auto_1137594 ) ) ( not ( = ?auto_1137591 ?auto_1137595 ) ) ( not ( = ?auto_1137591 ?auto_1137596 ) ) ( not ( = ?auto_1137591 ?auto_1137597 ) ) ( not ( = ?auto_1137591 ?auto_1137598 ) ) ( not ( = ?auto_1137591 ?auto_1137599 ) ) ( not ( = ?auto_1137592 ?auto_1137593 ) ) ( not ( = ?auto_1137592 ?auto_1137594 ) ) ( not ( = ?auto_1137592 ?auto_1137595 ) ) ( not ( = ?auto_1137592 ?auto_1137596 ) ) ( not ( = ?auto_1137592 ?auto_1137597 ) ) ( not ( = ?auto_1137592 ?auto_1137598 ) ) ( not ( = ?auto_1137592 ?auto_1137599 ) ) ( not ( = ?auto_1137593 ?auto_1137594 ) ) ( not ( = ?auto_1137593 ?auto_1137595 ) ) ( not ( = ?auto_1137593 ?auto_1137596 ) ) ( not ( = ?auto_1137593 ?auto_1137597 ) ) ( not ( = ?auto_1137593 ?auto_1137598 ) ) ( not ( = ?auto_1137593 ?auto_1137599 ) ) ( not ( = ?auto_1137594 ?auto_1137595 ) ) ( not ( = ?auto_1137594 ?auto_1137596 ) ) ( not ( = ?auto_1137594 ?auto_1137597 ) ) ( not ( = ?auto_1137594 ?auto_1137598 ) ) ( not ( = ?auto_1137594 ?auto_1137599 ) ) ( not ( = ?auto_1137595 ?auto_1137596 ) ) ( not ( = ?auto_1137595 ?auto_1137597 ) ) ( not ( = ?auto_1137595 ?auto_1137598 ) ) ( not ( = ?auto_1137595 ?auto_1137599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1137596 ?auto_1137597 ?auto_1137598 )
      ( MAKE-11CRATE-VERIFY ?auto_1137587 ?auto_1137588 ?auto_1137589 ?auto_1137590 ?auto_1137591 ?auto_1137592 ?auto_1137593 ?auto_1137594 ?auto_1137595 ?auto_1137596 ?auto_1137597 ?auto_1137598 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1138672 - SURFACE
      ?auto_1138673 - SURFACE
    )
    :vars
    (
      ?auto_1138677 - HOIST
      ?auto_1138675 - PLACE
      ?auto_1138676 - SURFACE
      ?auto_1138674 - PLACE
      ?auto_1138680 - HOIST
      ?auto_1138679 - SURFACE
      ?auto_1138678 - TRUCK
      ?auto_1138681 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1138677 ?auto_1138675 ) ( SURFACE-AT ?auto_1138672 ?auto_1138675 ) ( CLEAR ?auto_1138672 ) ( IS-CRATE ?auto_1138673 ) ( not ( = ?auto_1138672 ?auto_1138673 ) ) ( ON ?auto_1138672 ?auto_1138676 ) ( not ( = ?auto_1138676 ?auto_1138672 ) ) ( not ( = ?auto_1138676 ?auto_1138673 ) ) ( not ( = ?auto_1138674 ?auto_1138675 ) ) ( HOIST-AT ?auto_1138680 ?auto_1138674 ) ( not ( = ?auto_1138677 ?auto_1138680 ) ) ( AVAILABLE ?auto_1138680 ) ( SURFACE-AT ?auto_1138673 ?auto_1138674 ) ( ON ?auto_1138673 ?auto_1138679 ) ( CLEAR ?auto_1138673 ) ( not ( = ?auto_1138672 ?auto_1138679 ) ) ( not ( = ?auto_1138673 ?auto_1138679 ) ) ( not ( = ?auto_1138676 ?auto_1138679 ) ) ( TRUCK-AT ?auto_1138678 ?auto_1138675 ) ( LIFTING ?auto_1138677 ?auto_1138681 ) ( IS-CRATE ?auto_1138681 ) ( not ( = ?auto_1138672 ?auto_1138681 ) ) ( not ( = ?auto_1138673 ?auto_1138681 ) ) ( not ( = ?auto_1138676 ?auto_1138681 ) ) ( not ( = ?auto_1138679 ?auto_1138681 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1138677 ?auto_1138681 ?auto_1138678 ?auto_1138675 )
      ( MAKE-1CRATE ?auto_1138672 ?auto_1138673 )
      ( MAKE-1CRATE-VERIFY ?auto_1138672 ?auto_1138673 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1146856 - SURFACE
      ?auto_1146857 - SURFACE
      ?auto_1146858 - SURFACE
      ?auto_1146859 - SURFACE
      ?auto_1146860 - SURFACE
      ?auto_1146861 - SURFACE
      ?auto_1146862 - SURFACE
      ?auto_1146863 - SURFACE
      ?auto_1146864 - SURFACE
      ?auto_1146865 - SURFACE
      ?auto_1146866 - SURFACE
      ?auto_1146867 - SURFACE
      ?auto_1146868 - SURFACE
    )
    :vars
    (
      ?auto_1146869 - HOIST
      ?auto_1146870 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1146869 ?auto_1146870 ) ( SURFACE-AT ?auto_1146867 ?auto_1146870 ) ( CLEAR ?auto_1146867 ) ( LIFTING ?auto_1146869 ?auto_1146868 ) ( IS-CRATE ?auto_1146868 ) ( not ( = ?auto_1146867 ?auto_1146868 ) ) ( ON ?auto_1146857 ?auto_1146856 ) ( ON ?auto_1146858 ?auto_1146857 ) ( ON ?auto_1146859 ?auto_1146858 ) ( ON ?auto_1146860 ?auto_1146859 ) ( ON ?auto_1146861 ?auto_1146860 ) ( ON ?auto_1146862 ?auto_1146861 ) ( ON ?auto_1146863 ?auto_1146862 ) ( ON ?auto_1146864 ?auto_1146863 ) ( ON ?auto_1146865 ?auto_1146864 ) ( ON ?auto_1146866 ?auto_1146865 ) ( ON ?auto_1146867 ?auto_1146866 ) ( not ( = ?auto_1146856 ?auto_1146857 ) ) ( not ( = ?auto_1146856 ?auto_1146858 ) ) ( not ( = ?auto_1146856 ?auto_1146859 ) ) ( not ( = ?auto_1146856 ?auto_1146860 ) ) ( not ( = ?auto_1146856 ?auto_1146861 ) ) ( not ( = ?auto_1146856 ?auto_1146862 ) ) ( not ( = ?auto_1146856 ?auto_1146863 ) ) ( not ( = ?auto_1146856 ?auto_1146864 ) ) ( not ( = ?auto_1146856 ?auto_1146865 ) ) ( not ( = ?auto_1146856 ?auto_1146866 ) ) ( not ( = ?auto_1146856 ?auto_1146867 ) ) ( not ( = ?auto_1146856 ?auto_1146868 ) ) ( not ( = ?auto_1146857 ?auto_1146858 ) ) ( not ( = ?auto_1146857 ?auto_1146859 ) ) ( not ( = ?auto_1146857 ?auto_1146860 ) ) ( not ( = ?auto_1146857 ?auto_1146861 ) ) ( not ( = ?auto_1146857 ?auto_1146862 ) ) ( not ( = ?auto_1146857 ?auto_1146863 ) ) ( not ( = ?auto_1146857 ?auto_1146864 ) ) ( not ( = ?auto_1146857 ?auto_1146865 ) ) ( not ( = ?auto_1146857 ?auto_1146866 ) ) ( not ( = ?auto_1146857 ?auto_1146867 ) ) ( not ( = ?auto_1146857 ?auto_1146868 ) ) ( not ( = ?auto_1146858 ?auto_1146859 ) ) ( not ( = ?auto_1146858 ?auto_1146860 ) ) ( not ( = ?auto_1146858 ?auto_1146861 ) ) ( not ( = ?auto_1146858 ?auto_1146862 ) ) ( not ( = ?auto_1146858 ?auto_1146863 ) ) ( not ( = ?auto_1146858 ?auto_1146864 ) ) ( not ( = ?auto_1146858 ?auto_1146865 ) ) ( not ( = ?auto_1146858 ?auto_1146866 ) ) ( not ( = ?auto_1146858 ?auto_1146867 ) ) ( not ( = ?auto_1146858 ?auto_1146868 ) ) ( not ( = ?auto_1146859 ?auto_1146860 ) ) ( not ( = ?auto_1146859 ?auto_1146861 ) ) ( not ( = ?auto_1146859 ?auto_1146862 ) ) ( not ( = ?auto_1146859 ?auto_1146863 ) ) ( not ( = ?auto_1146859 ?auto_1146864 ) ) ( not ( = ?auto_1146859 ?auto_1146865 ) ) ( not ( = ?auto_1146859 ?auto_1146866 ) ) ( not ( = ?auto_1146859 ?auto_1146867 ) ) ( not ( = ?auto_1146859 ?auto_1146868 ) ) ( not ( = ?auto_1146860 ?auto_1146861 ) ) ( not ( = ?auto_1146860 ?auto_1146862 ) ) ( not ( = ?auto_1146860 ?auto_1146863 ) ) ( not ( = ?auto_1146860 ?auto_1146864 ) ) ( not ( = ?auto_1146860 ?auto_1146865 ) ) ( not ( = ?auto_1146860 ?auto_1146866 ) ) ( not ( = ?auto_1146860 ?auto_1146867 ) ) ( not ( = ?auto_1146860 ?auto_1146868 ) ) ( not ( = ?auto_1146861 ?auto_1146862 ) ) ( not ( = ?auto_1146861 ?auto_1146863 ) ) ( not ( = ?auto_1146861 ?auto_1146864 ) ) ( not ( = ?auto_1146861 ?auto_1146865 ) ) ( not ( = ?auto_1146861 ?auto_1146866 ) ) ( not ( = ?auto_1146861 ?auto_1146867 ) ) ( not ( = ?auto_1146861 ?auto_1146868 ) ) ( not ( = ?auto_1146862 ?auto_1146863 ) ) ( not ( = ?auto_1146862 ?auto_1146864 ) ) ( not ( = ?auto_1146862 ?auto_1146865 ) ) ( not ( = ?auto_1146862 ?auto_1146866 ) ) ( not ( = ?auto_1146862 ?auto_1146867 ) ) ( not ( = ?auto_1146862 ?auto_1146868 ) ) ( not ( = ?auto_1146863 ?auto_1146864 ) ) ( not ( = ?auto_1146863 ?auto_1146865 ) ) ( not ( = ?auto_1146863 ?auto_1146866 ) ) ( not ( = ?auto_1146863 ?auto_1146867 ) ) ( not ( = ?auto_1146863 ?auto_1146868 ) ) ( not ( = ?auto_1146864 ?auto_1146865 ) ) ( not ( = ?auto_1146864 ?auto_1146866 ) ) ( not ( = ?auto_1146864 ?auto_1146867 ) ) ( not ( = ?auto_1146864 ?auto_1146868 ) ) ( not ( = ?auto_1146865 ?auto_1146866 ) ) ( not ( = ?auto_1146865 ?auto_1146867 ) ) ( not ( = ?auto_1146865 ?auto_1146868 ) ) ( not ( = ?auto_1146866 ?auto_1146867 ) ) ( not ( = ?auto_1146866 ?auto_1146868 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1146867 ?auto_1146868 )
      ( MAKE-12CRATE-VERIFY ?auto_1146856 ?auto_1146857 ?auto_1146858 ?auto_1146859 ?auto_1146860 ?auto_1146861 ?auto_1146862 ?auto_1146863 ?auto_1146864 ?auto_1146865 ?auto_1146866 ?auto_1146867 ?auto_1146868 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1146981 - SURFACE
      ?auto_1146982 - SURFACE
      ?auto_1146983 - SURFACE
      ?auto_1146984 - SURFACE
      ?auto_1146985 - SURFACE
      ?auto_1146986 - SURFACE
      ?auto_1146987 - SURFACE
      ?auto_1146988 - SURFACE
      ?auto_1146989 - SURFACE
      ?auto_1146990 - SURFACE
      ?auto_1146991 - SURFACE
      ?auto_1146992 - SURFACE
      ?auto_1146993 - SURFACE
    )
    :vars
    (
      ?auto_1146995 - HOIST
      ?auto_1146996 - PLACE
      ?auto_1146994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1146995 ?auto_1146996 ) ( SURFACE-AT ?auto_1146992 ?auto_1146996 ) ( CLEAR ?auto_1146992 ) ( IS-CRATE ?auto_1146993 ) ( not ( = ?auto_1146992 ?auto_1146993 ) ) ( TRUCK-AT ?auto_1146994 ?auto_1146996 ) ( AVAILABLE ?auto_1146995 ) ( IN ?auto_1146993 ?auto_1146994 ) ( ON ?auto_1146992 ?auto_1146991 ) ( not ( = ?auto_1146991 ?auto_1146992 ) ) ( not ( = ?auto_1146991 ?auto_1146993 ) ) ( ON ?auto_1146982 ?auto_1146981 ) ( ON ?auto_1146983 ?auto_1146982 ) ( ON ?auto_1146984 ?auto_1146983 ) ( ON ?auto_1146985 ?auto_1146984 ) ( ON ?auto_1146986 ?auto_1146985 ) ( ON ?auto_1146987 ?auto_1146986 ) ( ON ?auto_1146988 ?auto_1146987 ) ( ON ?auto_1146989 ?auto_1146988 ) ( ON ?auto_1146990 ?auto_1146989 ) ( ON ?auto_1146991 ?auto_1146990 ) ( not ( = ?auto_1146981 ?auto_1146982 ) ) ( not ( = ?auto_1146981 ?auto_1146983 ) ) ( not ( = ?auto_1146981 ?auto_1146984 ) ) ( not ( = ?auto_1146981 ?auto_1146985 ) ) ( not ( = ?auto_1146981 ?auto_1146986 ) ) ( not ( = ?auto_1146981 ?auto_1146987 ) ) ( not ( = ?auto_1146981 ?auto_1146988 ) ) ( not ( = ?auto_1146981 ?auto_1146989 ) ) ( not ( = ?auto_1146981 ?auto_1146990 ) ) ( not ( = ?auto_1146981 ?auto_1146991 ) ) ( not ( = ?auto_1146981 ?auto_1146992 ) ) ( not ( = ?auto_1146981 ?auto_1146993 ) ) ( not ( = ?auto_1146982 ?auto_1146983 ) ) ( not ( = ?auto_1146982 ?auto_1146984 ) ) ( not ( = ?auto_1146982 ?auto_1146985 ) ) ( not ( = ?auto_1146982 ?auto_1146986 ) ) ( not ( = ?auto_1146982 ?auto_1146987 ) ) ( not ( = ?auto_1146982 ?auto_1146988 ) ) ( not ( = ?auto_1146982 ?auto_1146989 ) ) ( not ( = ?auto_1146982 ?auto_1146990 ) ) ( not ( = ?auto_1146982 ?auto_1146991 ) ) ( not ( = ?auto_1146982 ?auto_1146992 ) ) ( not ( = ?auto_1146982 ?auto_1146993 ) ) ( not ( = ?auto_1146983 ?auto_1146984 ) ) ( not ( = ?auto_1146983 ?auto_1146985 ) ) ( not ( = ?auto_1146983 ?auto_1146986 ) ) ( not ( = ?auto_1146983 ?auto_1146987 ) ) ( not ( = ?auto_1146983 ?auto_1146988 ) ) ( not ( = ?auto_1146983 ?auto_1146989 ) ) ( not ( = ?auto_1146983 ?auto_1146990 ) ) ( not ( = ?auto_1146983 ?auto_1146991 ) ) ( not ( = ?auto_1146983 ?auto_1146992 ) ) ( not ( = ?auto_1146983 ?auto_1146993 ) ) ( not ( = ?auto_1146984 ?auto_1146985 ) ) ( not ( = ?auto_1146984 ?auto_1146986 ) ) ( not ( = ?auto_1146984 ?auto_1146987 ) ) ( not ( = ?auto_1146984 ?auto_1146988 ) ) ( not ( = ?auto_1146984 ?auto_1146989 ) ) ( not ( = ?auto_1146984 ?auto_1146990 ) ) ( not ( = ?auto_1146984 ?auto_1146991 ) ) ( not ( = ?auto_1146984 ?auto_1146992 ) ) ( not ( = ?auto_1146984 ?auto_1146993 ) ) ( not ( = ?auto_1146985 ?auto_1146986 ) ) ( not ( = ?auto_1146985 ?auto_1146987 ) ) ( not ( = ?auto_1146985 ?auto_1146988 ) ) ( not ( = ?auto_1146985 ?auto_1146989 ) ) ( not ( = ?auto_1146985 ?auto_1146990 ) ) ( not ( = ?auto_1146985 ?auto_1146991 ) ) ( not ( = ?auto_1146985 ?auto_1146992 ) ) ( not ( = ?auto_1146985 ?auto_1146993 ) ) ( not ( = ?auto_1146986 ?auto_1146987 ) ) ( not ( = ?auto_1146986 ?auto_1146988 ) ) ( not ( = ?auto_1146986 ?auto_1146989 ) ) ( not ( = ?auto_1146986 ?auto_1146990 ) ) ( not ( = ?auto_1146986 ?auto_1146991 ) ) ( not ( = ?auto_1146986 ?auto_1146992 ) ) ( not ( = ?auto_1146986 ?auto_1146993 ) ) ( not ( = ?auto_1146987 ?auto_1146988 ) ) ( not ( = ?auto_1146987 ?auto_1146989 ) ) ( not ( = ?auto_1146987 ?auto_1146990 ) ) ( not ( = ?auto_1146987 ?auto_1146991 ) ) ( not ( = ?auto_1146987 ?auto_1146992 ) ) ( not ( = ?auto_1146987 ?auto_1146993 ) ) ( not ( = ?auto_1146988 ?auto_1146989 ) ) ( not ( = ?auto_1146988 ?auto_1146990 ) ) ( not ( = ?auto_1146988 ?auto_1146991 ) ) ( not ( = ?auto_1146988 ?auto_1146992 ) ) ( not ( = ?auto_1146988 ?auto_1146993 ) ) ( not ( = ?auto_1146989 ?auto_1146990 ) ) ( not ( = ?auto_1146989 ?auto_1146991 ) ) ( not ( = ?auto_1146989 ?auto_1146992 ) ) ( not ( = ?auto_1146989 ?auto_1146993 ) ) ( not ( = ?auto_1146990 ?auto_1146991 ) ) ( not ( = ?auto_1146990 ?auto_1146992 ) ) ( not ( = ?auto_1146990 ?auto_1146993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1146991 ?auto_1146992 ?auto_1146993 )
      ( MAKE-12CRATE-VERIFY ?auto_1146981 ?auto_1146982 ?auto_1146983 ?auto_1146984 ?auto_1146985 ?auto_1146986 ?auto_1146987 ?auto_1146988 ?auto_1146989 ?auto_1146990 ?auto_1146991 ?auto_1146992 ?auto_1146993 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1147119 - SURFACE
      ?auto_1147120 - SURFACE
      ?auto_1147121 - SURFACE
      ?auto_1147122 - SURFACE
      ?auto_1147123 - SURFACE
      ?auto_1147124 - SURFACE
      ?auto_1147125 - SURFACE
      ?auto_1147126 - SURFACE
      ?auto_1147127 - SURFACE
      ?auto_1147128 - SURFACE
      ?auto_1147129 - SURFACE
      ?auto_1147130 - SURFACE
      ?auto_1147131 - SURFACE
    )
    :vars
    (
      ?auto_1147132 - HOIST
      ?auto_1147135 - PLACE
      ?auto_1147134 - TRUCK
      ?auto_1147133 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147132 ?auto_1147135 ) ( SURFACE-AT ?auto_1147130 ?auto_1147135 ) ( CLEAR ?auto_1147130 ) ( IS-CRATE ?auto_1147131 ) ( not ( = ?auto_1147130 ?auto_1147131 ) ) ( AVAILABLE ?auto_1147132 ) ( IN ?auto_1147131 ?auto_1147134 ) ( ON ?auto_1147130 ?auto_1147129 ) ( not ( = ?auto_1147129 ?auto_1147130 ) ) ( not ( = ?auto_1147129 ?auto_1147131 ) ) ( TRUCK-AT ?auto_1147134 ?auto_1147133 ) ( not ( = ?auto_1147133 ?auto_1147135 ) ) ( ON ?auto_1147120 ?auto_1147119 ) ( ON ?auto_1147121 ?auto_1147120 ) ( ON ?auto_1147122 ?auto_1147121 ) ( ON ?auto_1147123 ?auto_1147122 ) ( ON ?auto_1147124 ?auto_1147123 ) ( ON ?auto_1147125 ?auto_1147124 ) ( ON ?auto_1147126 ?auto_1147125 ) ( ON ?auto_1147127 ?auto_1147126 ) ( ON ?auto_1147128 ?auto_1147127 ) ( ON ?auto_1147129 ?auto_1147128 ) ( not ( = ?auto_1147119 ?auto_1147120 ) ) ( not ( = ?auto_1147119 ?auto_1147121 ) ) ( not ( = ?auto_1147119 ?auto_1147122 ) ) ( not ( = ?auto_1147119 ?auto_1147123 ) ) ( not ( = ?auto_1147119 ?auto_1147124 ) ) ( not ( = ?auto_1147119 ?auto_1147125 ) ) ( not ( = ?auto_1147119 ?auto_1147126 ) ) ( not ( = ?auto_1147119 ?auto_1147127 ) ) ( not ( = ?auto_1147119 ?auto_1147128 ) ) ( not ( = ?auto_1147119 ?auto_1147129 ) ) ( not ( = ?auto_1147119 ?auto_1147130 ) ) ( not ( = ?auto_1147119 ?auto_1147131 ) ) ( not ( = ?auto_1147120 ?auto_1147121 ) ) ( not ( = ?auto_1147120 ?auto_1147122 ) ) ( not ( = ?auto_1147120 ?auto_1147123 ) ) ( not ( = ?auto_1147120 ?auto_1147124 ) ) ( not ( = ?auto_1147120 ?auto_1147125 ) ) ( not ( = ?auto_1147120 ?auto_1147126 ) ) ( not ( = ?auto_1147120 ?auto_1147127 ) ) ( not ( = ?auto_1147120 ?auto_1147128 ) ) ( not ( = ?auto_1147120 ?auto_1147129 ) ) ( not ( = ?auto_1147120 ?auto_1147130 ) ) ( not ( = ?auto_1147120 ?auto_1147131 ) ) ( not ( = ?auto_1147121 ?auto_1147122 ) ) ( not ( = ?auto_1147121 ?auto_1147123 ) ) ( not ( = ?auto_1147121 ?auto_1147124 ) ) ( not ( = ?auto_1147121 ?auto_1147125 ) ) ( not ( = ?auto_1147121 ?auto_1147126 ) ) ( not ( = ?auto_1147121 ?auto_1147127 ) ) ( not ( = ?auto_1147121 ?auto_1147128 ) ) ( not ( = ?auto_1147121 ?auto_1147129 ) ) ( not ( = ?auto_1147121 ?auto_1147130 ) ) ( not ( = ?auto_1147121 ?auto_1147131 ) ) ( not ( = ?auto_1147122 ?auto_1147123 ) ) ( not ( = ?auto_1147122 ?auto_1147124 ) ) ( not ( = ?auto_1147122 ?auto_1147125 ) ) ( not ( = ?auto_1147122 ?auto_1147126 ) ) ( not ( = ?auto_1147122 ?auto_1147127 ) ) ( not ( = ?auto_1147122 ?auto_1147128 ) ) ( not ( = ?auto_1147122 ?auto_1147129 ) ) ( not ( = ?auto_1147122 ?auto_1147130 ) ) ( not ( = ?auto_1147122 ?auto_1147131 ) ) ( not ( = ?auto_1147123 ?auto_1147124 ) ) ( not ( = ?auto_1147123 ?auto_1147125 ) ) ( not ( = ?auto_1147123 ?auto_1147126 ) ) ( not ( = ?auto_1147123 ?auto_1147127 ) ) ( not ( = ?auto_1147123 ?auto_1147128 ) ) ( not ( = ?auto_1147123 ?auto_1147129 ) ) ( not ( = ?auto_1147123 ?auto_1147130 ) ) ( not ( = ?auto_1147123 ?auto_1147131 ) ) ( not ( = ?auto_1147124 ?auto_1147125 ) ) ( not ( = ?auto_1147124 ?auto_1147126 ) ) ( not ( = ?auto_1147124 ?auto_1147127 ) ) ( not ( = ?auto_1147124 ?auto_1147128 ) ) ( not ( = ?auto_1147124 ?auto_1147129 ) ) ( not ( = ?auto_1147124 ?auto_1147130 ) ) ( not ( = ?auto_1147124 ?auto_1147131 ) ) ( not ( = ?auto_1147125 ?auto_1147126 ) ) ( not ( = ?auto_1147125 ?auto_1147127 ) ) ( not ( = ?auto_1147125 ?auto_1147128 ) ) ( not ( = ?auto_1147125 ?auto_1147129 ) ) ( not ( = ?auto_1147125 ?auto_1147130 ) ) ( not ( = ?auto_1147125 ?auto_1147131 ) ) ( not ( = ?auto_1147126 ?auto_1147127 ) ) ( not ( = ?auto_1147126 ?auto_1147128 ) ) ( not ( = ?auto_1147126 ?auto_1147129 ) ) ( not ( = ?auto_1147126 ?auto_1147130 ) ) ( not ( = ?auto_1147126 ?auto_1147131 ) ) ( not ( = ?auto_1147127 ?auto_1147128 ) ) ( not ( = ?auto_1147127 ?auto_1147129 ) ) ( not ( = ?auto_1147127 ?auto_1147130 ) ) ( not ( = ?auto_1147127 ?auto_1147131 ) ) ( not ( = ?auto_1147128 ?auto_1147129 ) ) ( not ( = ?auto_1147128 ?auto_1147130 ) ) ( not ( = ?auto_1147128 ?auto_1147131 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147129 ?auto_1147130 ?auto_1147131 )
      ( MAKE-12CRATE-VERIFY ?auto_1147119 ?auto_1147120 ?auto_1147121 ?auto_1147122 ?auto_1147123 ?auto_1147124 ?auto_1147125 ?auto_1147126 ?auto_1147127 ?auto_1147128 ?auto_1147129 ?auto_1147130 ?auto_1147131 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1147269 - SURFACE
      ?auto_1147270 - SURFACE
      ?auto_1147271 - SURFACE
      ?auto_1147272 - SURFACE
      ?auto_1147273 - SURFACE
      ?auto_1147274 - SURFACE
      ?auto_1147275 - SURFACE
      ?auto_1147276 - SURFACE
      ?auto_1147277 - SURFACE
      ?auto_1147278 - SURFACE
      ?auto_1147279 - SURFACE
      ?auto_1147280 - SURFACE
      ?auto_1147281 - SURFACE
    )
    :vars
    (
      ?auto_1147282 - HOIST
      ?auto_1147286 - PLACE
      ?auto_1147284 - TRUCK
      ?auto_1147283 - PLACE
      ?auto_1147285 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147282 ?auto_1147286 ) ( SURFACE-AT ?auto_1147280 ?auto_1147286 ) ( CLEAR ?auto_1147280 ) ( IS-CRATE ?auto_1147281 ) ( not ( = ?auto_1147280 ?auto_1147281 ) ) ( AVAILABLE ?auto_1147282 ) ( ON ?auto_1147280 ?auto_1147279 ) ( not ( = ?auto_1147279 ?auto_1147280 ) ) ( not ( = ?auto_1147279 ?auto_1147281 ) ) ( TRUCK-AT ?auto_1147284 ?auto_1147283 ) ( not ( = ?auto_1147283 ?auto_1147286 ) ) ( HOIST-AT ?auto_1147285 ?auto_1147283 ) ( LIFTING ?auto_1147285 ?auto_1147281 ) ( not ( = ?auto_1147282 ?auto_1147285 ) ) ( ON ?auto_1147270 ?auto_1147269 ) ( ON ?auto_1147271 ?auto_1147270 ) ( ON ?auto_1147272 ?auto_1147271 ) ( ON ?auto_1147273 ?auto_1147272 ) ( ON ?auto_1147274 ?auto_1147273 ) ( ON ?auto_1147275 ?auto_1147274 ) ( ON ?auto_1147276 ?auto_1147275 ) ( ON ?auto_1147277 ?auto_1147276 ) ( ON ?auto_1147278 ?auto_1147277 ) ( ON ?auto_1147279 ?auto_1147278 ) ( not ( = ?auto_1147269 ?auto_1147270 ) ) ( not ( = ?auto_1147269 ?auto_1147271 ) ) ( not ( = ?auto_1147269 ?auto_1147272 ) ) ( not ( = ?auto_1147269 ?auto_1147273 ) ) ( not ( = ?auto_1147269 ?auto_1147274 ) ) ( not ( = ?auto_1147269 ?auto_1147275 ) ) ( not ( = ?auto_1147269 ?auto_1147276 ) ) ( not ( = ?auto_1147269 ?auto_1147277 ) ) ( not ( = ?auto_1147269 ?auto_1147278 ) ) ( not ( = ?auto_1147269 ?auto_1147279 ) ) ( not ( = ?auto_1147269 ?auto_1147280 ) ) ( not ( = ?auto_1147269 ?auto_1147281 ) ) ( not ( = ?auto_1147270 ?auto_1147271 ) ) ( not ( = ?auto_1147270 ?auto_1147272 ) ) ( not ( = ?auto_1147270 ?auto_1147273 ) ) ( not ( = ?auto_1147270 ?auto_1147274 ) ) ( not ( = ?auto_1147270 ?auto_1147275 ) ) ( not ( = ?auto_1147270 ?auto_1147276 ) ) ( not ( = ?auto_1147270 ?auto_1147277 ) ) ( not ( = ?auto_1147270 ?auto_1147278 ) ) ( not ( = ?auto_1147270 ?auto_1147279 ) ) ( not ( = ?auto_1147270 ?auto_1147280 ) ) ( not ( = ?auto_1147270 ?auto_1147281 ) ) ( not ( = ?auto_1147271 ?auto_1147272 ) ) ( not ( = ?auto_1147271 ?auto_1147273 ) ) ( not ( = ?auto_1147271 ?auto_1147274 ) ) ( not ( = ?auto_1147271 ?auto_1147275 ) ) ( not ( = ?auto_1147271 ?auto_1147276 ) ) ( not ( = ?auto_1147271 ?auto_1147277 ) ) ( not ( = ?auto_1147271 ?auto_1147278 ) ) ( not ( = ?auto_1147271 ?auto_1147279 ) ) ( not ( = ?auto_1147271 ?auto_1147280 ) ) ( not ( = ?auto_1147271 ?auto_1147281 ) ) ( not ( = ?auto_1147272 ?auto_1147273 ) ) ( not ( = ?auto_1147272 ?auto_1147274 ) ) ( not ( = ?auto_1147272 ?auto_1147275 ) ) ( not ( = ?auto_1147272 ?auto_1147276 ) ) ( not ( = ?auto_1147272 ?auto_1147277 ) ) ( not ( = ?auto_1147272 ?auto_1147278 ) ) ( not ( = ?auto_1147272 ?auto_1147279 ) ) ( not ( = ?auto_1147272 ?auto_1147280 ) ) ( not ( = ?auto_1147272 ?auto_1147281 ) ) ( not ( = ?auto_1147273 ?auto_1147274 ) ) ( not ( = ?auto_1147273 ?auto_1147275 ) ) ( not ( = ?auto_1147273 ?auto_1147276 ) ) ( not ( = ?auto_1147273 ?auto_1147277 ) ) ( not ( = ?auto_1147273 ?auto_1147278 ) ) ( not ( = ?auto_1147273 ?auto_1147279 ) ) ( not ( = ?auto_1147273 ?auto_1147280 ) ) ( not ( = ?auto_1147273 ?auto_1147281 ) ) ( not ( = ?auto_1147274 ?auto_1147275 ) ) ( not ( = ?auto_1147274 ?auto_1147276 ) ) ( not ( = ?auto_1147274 ?auto_1147277 ) ) ( not ( = ?auto_1147274 ?auto_1147278 ) ) ( not ( = ?auto_1147274 ?auto_1147279 ) ) ( not ( = ?auto_1147274 ?auto_1147280 ) ) ( not ( = ?auto_1147274 ?auto_1147281 ) ) ( not ( = ?auto_1147275 ?auto_1147276 ) ) ( not ( = ?auto_1147275 ?auto_1147277 ) ) ( not ( = ?auto_1147275 ?auto_1147278 ) ) ( not ( = ?auto_1147275 ?auto_1147279 ) ) ( not ( = ?auto_1147275 ?auto_1147280 ) ) ( not ( = ?auto_1147275 ?auto_1147281 ) ) ( not ( = ?auto_1147276 ?auto_1147277 ) ) ( not ( = ?auto_1147276 ?auto_1147278 ) ) ( not ( = ?auto_1147276 ?auto_1147279 ) ) ( not ( = ?auto_1147276 ?auto_1147280 ) ) ( not ( = ?auto_1147276 ?auto_1147281 ) ) ( not ( = ?auto_1147277 ?auto_1147278 ) ) ( not ( = ?auto_1147277 ?auto_1147279 ) ) ( not ( = ?auto_1147277 ?auto_1147280 ) ) ( not ( = ?auto_1147277 ?auto_1147281 ) ) ( not ( = ?auto_1147278 ?auto_1147279 ) ) ( not ( = ?auto_1147278 ?auto_1147280 ) ) ( not ( = ?auto_1147278 ?auto_1147281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147279 ?auto_1147280 ?auto_1147281 )
      ( MAKE-12CRATE-VERIFY ?auto_1147269 ?auto_1147270 ?auto_1147271 ?auto_1147272 ?auto_1147273 ?auto_1147274 ?auto_1147275 ?auto_1147276 ?auto_1147277 ?auto_1147278 ?auto_1147279 ?auto_1147280 ?auto_1147281 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1147431 - SURFACE
      ?auto_1147432 - SURFACE
      ?auto_1147433 - SURFACE
      ?auto_1147434 - SURFACE
      ?auto_1147435 - SURFACE
      ?auto_1147436 - SURFACE
      ?auto_1147437 - SURFACE
      ?auto_1147438 - SURFACE
      ?auto_1147439 - SURFACE
      ?auto_1147440 - SURFACE
      ?auto_1147441 - SURFACE
      ?auto_1147442 - SURFACE
      ?auto_1147443 - SURFACE
    )
    :vars
    (
      ?auto_1147445 - HOIST
      ?auto_1147449 - PLACE
      ?auto_1147447 - TRUCK
      ?auto_1147444 - PLACE
      ?auto_1147446 - HOIST
      ?auto_1147448 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147445 ?auto_1147449 ) ( SURFACE-AT ?auto_1147442 ?auto_1147449 ) ( CLEAR ?auto_1147442 ) ( IS-CRATE ?auto_1147443 ) ( not ( = ?auto_1147442 ?auto_1147443 ) ) ( AVAILABLE ?auto_1147445 ) ( ON ?auto_1147442 ?auto_1147441 ) ( not ( = ?auto_1147441 ?auto_1147442 ) ) ( not ( = ?auto_1147441 ?auto_1147443 ) ) ( TRUCK-AT ?auto_1147447 ?auto_1147444 ) ( not ( = ?auto_1147444 ?auto_1147449 ) ) ( HOIST-AT ?auto_1147446 ?auto_1147444 ) ( not ( = ?auto_1147445 ?auto_1147446 ) ) ( AVAILABLE ?auto_1147446 ) ( SURFACE-AT ?auto_1147443 ?auto_1147444 ) ( ON ?auto_1147443 ?auto_1147448 ) ( CLEAR ?auto_1147443 ) ( not ( = ?auto_1147442 ?auto_1147448 ) ) ( not ( = ?auto_1147443 ?auto_1147448 ) ) ( not ( = ?auto_1147441 ?auto_1147448 ) ) ( ON ?auto_1147432 ?auto_1147431 ) ( ON ?auto_1147433 ?auto_1147432 ) ( ON ?auto_1147434 ?auto_1147433 ) ( ON ?auto_1147435 ?auto_1147434 ) ( ON ?auto_1147436 ?auto_1147435 ) ( ON ?auto_1147437 ?auto_1147436 ) ( ON ?auto_1147438 ?auto_1147437 ) ( ON ?auto_1147439 ?auto_1147438 ) ( ON ?auto_1147440 ?auto_1147439 ) ( ON ?auto_1147441 ?auto_1147440 ) ( not ( = ?auto_1147431 ?auto_1147432 ) ) ( not ( = ?auto_1147431 ?auto_1147433 ) ) ( not ( = ?auto_1147431 ?auto_1147434 ) ) ( not ( = ?auto_1147431 ?auto_1147435 ) ) ( not ( = ?auto_1147431 ?auto_1147436 ) ) ( not ( = ?auto_1147431 ?auto_1147437 ) ) ( not ( = ?auto_1147431 ?auto_1147438 ) ) ( not ( = ?auto_1147431 ?auto_1147439 ) ) ( not ( = ?auto_1147431 ?auto_1147440 ) ) ( not ( = ?auto_1147431 ?auto_1147441 ) ) ( not ( = ?auto_1147431 ?auto_1147442 ) ) ( not ( = ?auto_1147431 ?auto_1147443 ) ) ( not ( = ?auto_1147431 ?auto_1147448 ) ) ( not ( = ?auto_1147432 ?auto_1147433 ) ) ( not ( = ?auto_1147432 ?auto_1147434 ) ) ( not ( = ?auto_1147432 ?auto_1147435 ) ) ( not ( = ?auto_1147432 ?auto_1147436 ) ) ( not ( = ?auto_1147432 ?auto_1147437 ) ) ( not ( = ?auto_1147432 ?auto_1147438 ) ) ( not ( = ?auto_1147432 ?auto_1147439 ) ) ( not ( = ?auto_1147432 ?auto_1147440 ) ) ( not ( = ?auto_1147432 ?auto_1147441 ) ) ( not ( = ?auto_1147432 ?auto_1147442 ) ) ( not ( = ?auto_1147432 ?auto_1147443 ) ) ( not ( = ?auto_1147432 ?auto_1147448 ) ) ( not ( = ?auto_1147433 ?auto_1147434 ) ) ( not ( = ?auto_1147433 ?auto_1147435 ) ) ( not ( = ?auto_1147433 ?auto_1147436 ) ) ( not ( = ?auto_1147433 ?auto_1147437 ) ) ( not ( = ?auto_1147433 ?auto_1147438 ) ) ( not ( = ?auto_1147433 ?auto_1147439 ) ) ( not ( = ?auto_1147433 ?auto_1147440 ) ) ( not ( = ?auto_1147433 ?auto_1147441 ) ) ( not ( = ?auto_1147433 ?auto_1147442 ) ) ( not ( = ?auto_1147433 ?auto_1147443 ) ) ( not ( = ?auto_1147433 ?auto_1147448 ) ) ( not ( = ?auto_1147434 ?auto_1147435 ) ) ( not ( = ?auto_1147434 ?auto_1147436 ) ) ( not ( = ?auto_1147434 ?auto_1147437 ) ) ( not ( = ?auto_1147434 ?auto_1147438 ) ) ( not ( = ?auto_1147434 ?auto_1147439 ) ) ( not ( = ?auto_1147434 ?auto_1147440 ) ) ( not ( = ?auto_1147434 ?auto_1147441 ) ) ( not ( = ?auto_1147434 ?auto_1147442 ) ) ( not ( = ?auto_1147434 ?auto_1147443 ) ) ( not ( = ?auto_1147434 ?auto_1147448 ) ) ( not ( = ?auto_1147435 ?auto_1147436 ) ) ( not ( = ?auto_1147435 ?auto_1147437 ) ) ( not ( = ?auto_1147435 ?auto_1147438 ) ) ( not ( = ?auto_1147435 ?auto_1147439 ) ) ( not ( = ?auto_1147435 ?auto_1147440 ) ) ( not ( = ?auto_1147435 ?auto_1147441 ) ) ( not ( = ?auto_1147435 ?auto_1147442 ) ) ( not ( = ?auto_1147435 ?auto_1147443 ) ) ( not ( = ?auto_1147435 ?auto_1147448 ) ) ( not ( = ?auto_1147436 ?auto_1147437 ) ) ( not ( = ?auto_1147436 ?auto_1147438 ) ) ( not ( = ?auto_1147436 ?auto_1147439 ) ) ( not ( = ?auto_1147436 ?auto_1147440 ) ) ( not ( = ?auto_1147436 ?auto_1147441 ) ) ( not ( = ?auto_1147436 ?auto_1147442 ) ) ( not ( = ?auto_1147436 ?auto_1147443 ) ) ( not ( = ?auto_1147436 ?auto_1147448 ) ) ( not ( = ?auto_1147437 ?auto_1147438 ) ) ( not ( = ?auto_1147437 ?auto_1147439 ) ) ( not ( = ?auto_1147437 ?auto_1147440 ) ) ( not ( = ?auto_1147437 ?auto_1147441 ) ) ( not ( = ?auto_1147437 ?auto_1147442 ) ) ( not ( = ?auto_1147437 ?auto_1147443 ) ) ( not ( = ?auto_1147437 ?auto_1147448 ) ) ( not ( = ?auto_1147438 ?auto_1147439 ) ) ( not ( = ?auto_1147438 ?auto_1147440 ) ) ( not ( = ?auto_1147438 ?auto_1147441 ) ) ( not ( = ?auto_1147438 ?auto_1147442 ) ) ( not ( = ?auto_1147438 ?auto_1147443 ) ) ( not ( = ?auto_1147438 ?auto_1147448 ) ) ( not ( = ?auto_1147439 ?auto_1147440 ) ) ( not ( = ?auto_1147439 ?auto_1147441 ) ) ( not ( = ?auto_1147439 ?auto_1147442 ) ) ( not ( = ?auto_1147439 ?auto_1147443 ) ) ( not ( = ?auto_1147439 ?auto_1147448 ) ) ( not ( = ?auto_1147440 ?auto_1147441 ) ) ( not ( = ?auto_1147440 ?auto_1147442 ) ) ( not ( = ?auto_1147440 ?auto_1147443 ) ) ( not ( = ?auto_1147440 ?auto_1147448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147441 ?auto_1147442 ?auto_1147443 )
      ( MAKE-12CRATE-VERIFY ?auto_1147431 ?auto_1147432 ?auto_1147433 ?auto_1147434 ?auto_1147435 ?auto_1147436 ?auto_1147437 ?auto_1147438 ?auto_1147439 ?auto_1147440 ?auto_1147441 ?auto_1147442 ?auto_1147443 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1147594 - SURFACE
      ?auto_1147595 - SURFACE
      ?auto_1147596 - SURFACE
      ?auto_1147597 - SURFACE
      ?auto_1147598 - SURFACE
      ?auto_1147599 - SURFACE
      ?auto_1147600 - SURFACE
      ?auto_1147601 - SURFACE
      ?auto_1147602 - SURFACE
      ?auto_1147603 - SURFACE
      ?auto_1147604 - SURFACE
      ?auto_1147605 - SURFACE
      ?auto_1147606 - SURFACE
    )
    :vars
    (
      ?auto_1147608 - HOIST
      ?auto_1147611 - PLACE
      ?auto_1147607 - PLACE
      ?auto_1147610 - HOIST
      ?auto_1147612 - SURFACE
      ?auto_1147609 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147608 ?auto_1147611 ) ( SURFACE-AT ?auto_1147605 ?auto_1147611 ) ( CLEAR ?auto_1147605 ) ( IS-CRATE ?auto_1147606 ) ( not ( = ?auto_1147605 ?auto_1147606 ) ) ( AVAILABLE ?auto_1147608 ) ( ON ?auto_1147605 ?auto_1147604 ) ( not ( = ?auto_1147604 ?auto_1147605 ) ) ( not ( = ?auto_1147604 ?auto_1147606 ) ) ( not ( = ?auto_1147607 ?auto_1147611 ) ) ( HOIST-AT ?auto_1147610 ?auto_1147607 ) ( not ( = ?auto_1147608 ?auto_1147610 ) ) ( AVAILABLE ?auto_1147610 ) ( SURFACE-AT ?auto_1147606 ?auto_1147607 ) ( ON ?auto_1147606 ?auto_1147612 ) ( CLEAR ?auto_1147606 ) ( not ( = ?auto_1147605 ?auto_1147612 ) ) ( not ( = ?auto_1147606 ?auto_1147612 ) ) ( not ( = ?auto_1147604 ?auto_1147612 ) ) ( TRUCK-AT ?auto_1147609 ?auto_1147611 ) ( ON ?auto_1147595 ?auto_1147594 ) ( ON ?auto_1147596 ?auto_1147595 ) ( ON ?auto_1147597 ?auto_1147596 ) ( ON ?auto_1147598 ?auto_1147597 ) ( ON ?auto_1147599 ?auto_1147598 ) ( ON ?auto_1147600 ?auto_1147599 ) ( ON ?auto_1147601 ?auto_1147600 ) ( ON ?auto_1147602 ?auto_1147601 ) ( ON ?auto_1147603 ?auto_1147602 ) ( ON ?auto_1147604 ?auto_1147603 ) ( not ( = ?auto_1147594 ?auto_1147595 ) ) ( not ( = ?auto_1147594 ?auto_1147596 ) ) ( not ( = ?auto_1147594 ?auto_1147597 ) ) ( not ( = ?auto_1147594 ?auto_1147598 ) ) ( not ( = ?auto_1147594 ?auto_1147599 ) ) ( not ( = ?auto_1147594 ?auto_1147600 ) ) ( not ( = ?auto_1147594 ?auto_1147601 ) ) ( not ( = ?auto_1147594 ?auto_1147602 ) ) ( not ( = ?auto_1147594 ?auto_1147603 ) ) ( not ( = ?auto_1147594 ?auto_1147604 ) ) ( not ( = ?auto_1147594 ?auto_1147605 ) ) ( not ( = ?auto_1147594 ?auto_1147606 ) ) ( not ( = ?auto_1147594 ?auto_1147612 ) ) ( not ( = ?auto_1147595 ?auto_1147596 ) ) ( not ( = ?auto_1147595 ?auto_1147597 ) ) ( not ( = ?auto_1147595 ?auto_1147598 ) ) ( not ( = ?auto_1147595 ?auto_1147599 ) ) ( not ( = ?auto_1147595 ?auto_1147600 ) ) ( not ( = ?auto_1147595 ?auto_1147601 ) ) ( not ( = ?auto_1147595 ?auto_1147602 ) ) ( not ( = ?auto_1147595 ?auto_1147603 ) ) ( not ( = ?auto_1147595 ?auto_1147604 ) ) ( not ( = ?auto_1147595 ?auto_1147605 ) ) ( not ( = ?auto_1147595 ?auto_1147606 ) ) ( not ( = ?auto_1147595 ?auto_1147612 ) ) ( not ( = ?auto_1147596 ?auto_1147597 ) ) ( not ( = ?auto_1147596 ?auto_1147598 ) ) ( not ( = ?auto_1147596 ?auto_1147599 ) ) ( not ( = ?auto_1147596 ?auto_1147600 ) ) ( not ( = ?auto_1147596 ?auto_1147601 ) ) ( not ( = ?auto_1147596 ?auto_1147602 ) ) ( not ( = ?auto_1147596 ?auto_1147603 ) ) ( not ( = ?auto_1147596 ?auto_1147604 ) ) ( not ( = ?auto_1147596 ?auto_1147605 ) ) ( not ( = ?auto_1147596 ?auto_1147606 ) ) ( not ( = ?auto_1147596 ?auto_1147612 ) ) ( not ( = ?auto_1147597 ?auto_1147598 ) ) ( not ( = ?auto_1147597 ?auto_1147599 ) ) ( not ( = ?auto_1147597 ?auto_1147600 ) ) ( not ( = ?auto_1147597 ?auto_1147601 ) ) ( not ( = ?auto_1147597 ?auto_1147602 ) ) ( not ( = ?auto_1147597 ?auto_1147603 ) ) ( not ( = ?auto_1147597 ?auto_1147604 ) ) ( not ( = ?auto_1147597 ?auto_1147605 ) ) ( not ( = ?auto_1147597 ?auto_1147606 ) ) ( not ( = ?auto_1147597 ?auto_1147612 ) ) ( not ( = ?auto_1147598 ?auto_1147599 ) ) ( not ( = ?auto_1147598 ?auto_1147600 ) ) ( not ( = ?auto_1147598 ?auto_1147601 ) ) ( not ( = ?auto_1147598 ?auto_1147602 ) ) ( not ( = ?auto_1147598 ?auto_1147603 ) ) ( not ( = ?auto_1147598 ?auto_1147604 ) ) ( not ( = ?auto_1147598 ?auto_1147605 ) ) ( not ( = ?auto_1147598 ?auto_1147606 ) ) ( not ( = ?auto_1147598 ?auto_1147612 ) ) ( not ( = ?auto_1147599 ?auto_1147600 ) ) ( not ( = ?auto_1147599 ?auto_1147601 ) ) ( not ( = ?auto_1147599 ?auto_1147602 ) ) ( not ( = ?auto_1147599 ?auto_1147603 ) ) ( not ( = ?auto_1147599 ?auto_1147604 ) ) ( not ( = ?auto_1147599 ?auto_1147605 ) ) ( not ( = ?auto_1147599 ?auto_1147606 ) ) ( not ( = ?auto_1147599 ?auto_1147612 ) ) ( not ( = ?auto_1147600 ?auto_1147601 ) ) ( not ( = ?auto_1147600 ?auto_1147602 ) ) ( not ( = ?auto_1147600 ?auto_1147603 ) ) ( not ( = ?auto_1147600 ?auto_1147604 ) ) ( not ( = ?auto_1147600 ?auto_1147605 ) ) ( not ( = ?auto_1147600 ?auto_1147606 ) ) ( not ( = ?auto_1147600 ?auto_1147612 ) ) ( not ( = ?auto_1147601 ?auto_1147602 ) ) ( not ( = ?auto_1147601 ?auto_1147603 ) ) ( not ( = ?auto_1147601 ?auto_1147604 ) ) ( not ( = ?auto_1147601 ?auto_1147605 ) ) ( not ( = ?auto_1147601 ?auto_1147606 ) ) ( not ( = ?auto_1147601 ?auto_1147612 ) ) ( not ( = ?auto_1147602 ?auto_1147603 ) ) ( not ( = ?auto_1147602 ?auto_1147604 ) ) ( not ( = ?auto_1147602 ?auto_1147605 ) ) ( not ( = ?auto_1147602 ?auto_1147606 ) ) ( not ( = ?auto_1147602 ?auto_1147612 ) ) ( not ( = ?auto_1147603 ?auto_1147604 ) ) ( not ( = ?auto_1147603 ?auto_1147605 ) ) ( not ( = ?auto_1147603 ?auto_1147606 ) ) ( not ( = ?auto_1147603 ?auto_1147612 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147604 ?auto_1147605 ?auto_1147606 )
      ( MAKE-12CRATE-VERIFY ?auto_1147594 ?auto_1147595 ?auto_1147596 ?auto_1147597 ?auto_1147598 ?auto_1147599 ?auto_1147600 ?auto_1147601 ?auto_1147602 ?auto_1147603 ?auto_1147604 ?auto_1147605 ?auto_1147606 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1147757 - SURFACE
      ?auto_1147758 - SURFACE
      ?auto_1147759 - SURFACE
      ?auto_1147760 - SURFACE
      ?auto_1147761 - SURFACE
      ?auto_1147762 - SURFACE
      ?auto_1147763 - SURFACE
      ?auto_1147764 - SURFACE
      ?auto_1147765 - SURFACE
      ?auto_1147766 - SURFACE
      ?auto_1147767 - SURFACE
      ?auto_1147768 - SURFACE
      ?auto_1147769 - SURFACE
    )
    :vars
    (
      ?auto_1147774 - HOIST
      ?auto_1147772 - PLACE
      ?auto_1147773 - PLACE
      ?auto_1147770 - HOIST
      ?auto_1147775 - SURFACE
      ?auto_1147771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147774 ?auto_1147772 ) ( IS-CRATE ?auto_1147769 ) ( not ( = ?auto_1147768 ?auto_1147769 ) ) ( not ( = ?auto_1147767 ?auto_1147768 ) ) ( not ( = ?auto_1147767 ?auto_1147769 ) ) ( not ( = ?auto_1147773 ?auto_1147772 ) ) ( HOIST-AT ?auto_1147770 ?auto_1147773 ) ( not ( = ?auto_1147774 ?auto_1147770 ) ) ( AVAILABLE ?auto_1147770 ) ( SURFACE-AT ?auto_1147769 ?auto_1147773 ) ( ON ?auto_1147769 ?auto_1147775 ) ( CLEAR ?auto_1147769 ) ( not ( = ?auto_1147768 ?auto_1147775 ) ) ( not ( = ?auto_1147769 ?auto_1147775 ) ) ( not ( = ?auto_1147767 ?auto_1147775 ) ) ( TRUCK-AT ?auto_1147771 ?auto_1147772 ) ( SURFACE-AT ?auto_1147767 ?auto_1147772 ) ( CLEAR ?auto_1147767 ) ( LIFTING ?auto_1147774 ?auto_1147768 ) ( IS-CRATE ?auto_1147768 ) ( ON ?auto_1147758 ?auto_1147757 ) ( ON ?auto_1147759 ?auto_1147758 ) ( ON ?auto_1147760 ?auto_1147759 ) ( ON ?auto_1147761 ?auto_1147760 ) ( ON ?auto_1147762 ?auto_1147761 ) ( ON ?auto_1147763 ?auto_1147762 ) ( ON ?auto_1147764 ?auto_1147763 ) ( ON ?auto_1147765 ?auto_1147764 ) ( ON ?auto_1147766 ?auto_1147765 ) ( ON ?auto_1147767 ?auto_1147766 ) ( not ( = ?auto_1147757 ?auto_1147758 ) ) ( not ( = ?auto_1147757 ?auto_1147759 ) ) ( not ( = ?auto_1147757 ?auto_1147760 ) ) ( not ( = ?auto_1147757 ?auto_1147761 ) ) ( not ( = ?auto_1147757 ?auto_1147762 ) ) ( not ( = ?auto_1147757 ?auto_1147763 ) ) ( not ( = ?auto_1147757 ?auto_1147764 ) ) ( not ( = ?auto_1147757 ?auto_1147765 ) ) ( not ( = ?auto_1147757 ?auto_1147766 ) ) ( not ( = ?auto_1147757 ?auto_1147767 ) ) ( not ( = ?auto_1147757 ?auto_1147768 ) ) ( not ( = ?auto_1147757 ?auto_1147769 ) ) ( not ( = ?auto_1147757 ?auto_1147775 ) ) ( not ( = ?auto_1147758 ?auto_1147759 ) ) ( not ( = ?auto_1147758 ?auto_1147760 ) ) ( not ( = ?auto_1147758 ?auto_1147761 ) ) ( not ( = ?auto_1147758 ?auto_1147762 ) ) ( not ( = ?auto_1147758 ?auto_1147763 ) ) ( not ( = ?auto_1147758 ?auto_1147764 ) ) ( not ( = ?auto_1147758 ?auto_1147765 ) ) ( not ( = ?auto_1147758 ?auto_1147766 ) ) ( not ( = ?auto_1147758 ?auto_1147767 ) ) ( not ( = ?auto_1147758 ?auto_1147768 ) ) ( not ( = ?auto_1147758 ?auto_1147769 ) ) ( not ( = ?auto_1147758 ?auto_1147775 ) ) ( not ( = ?auto_1147759 ?auto_1147760 ) ) ( not ( = ?auto_1147759 ?auto_1147761 ) ) ( not ( = ?auto_1147759 ?auto_1147762 ) ) ( not ( = ?auto_1147759 ?auto_1147763 ) ) ( not ( = ?auto_1147759 ?auto_1147764 ) ) ( not ( = ?auto_1147759 ?auto_1147765 ) ) ( not ( = ?auto_1147759 ?auto_1147766 ) ) ( not ( = ?auto_1147759 ?auto_1147767 ) ) ( not ( = ?auto_1147759 ?auto_1147768 ) ) ( not ( = ?auto_1147759 ?auto_1147769 ) ) ( not ( = ?auto_1147759 ?auto_1147775 ) ) ( not ( = ?auto_1147760 ?auto_1147761 ) ) ( not ( = ?auto_1147760 ?auto_1147762 ) ) ( not ( = ?auto_1147760 ?auto_1147763 ) ) ( not ( = ?auto_1147760 ?auto_1147764 ) ) ( not ( = ?auto_1147760 ?auto_1147765 ) ) ( not ( = ?auto_1147760 ?auto_1147766 ) ) ( not ( = ?auto_1147760 ?auto_1147767 ) ) ( not ( = ?auto_1147760 ?auto_1147768 ) ) ( not ( = ?auto_1147760 ?auto_1147769 ) ) ( not ( = ?auto_1147760 ?auto_1147775 ) ) ( not ( = ?auto_1147761 ?auto_1147762 ) ) ( not ( = ?auto_1147761 ?auto_1147763 ) ) ( not ( = ?auto_1147761 ?auto_1147764 ) ) ( not ( = ?auto_1147761 ?auto_1147765 ) ) ( not ( = ?auto_1147761 ?auto_1147766 ) ) ( not ( = ?auto_1147761 ?auto_1147767 ) ) ( not ( = ?auto_1147761 ?auto_1147768 ) ) ( not ( = ?auto_1147761 ?auto_1147769 ) ) ( not ( = ?auto_1147761 ?auto_1147775 ) ) ( not ( = ?auto_1147762 ?auto_1147763 ) ) ( not ( = ?auto_1147762 ?auto_1147764 ) ) ( not ( = ?auto_1147762 ?auto_1147765 ) ) ( not ( = ?auto_1147762 ?auto_1147766 ) ) ( not ( = ?auto_1147762 ?auto_1147767 ) ) ( not ( = ?auto_1147762 ?auto_1147768 ) ) ( not ( = ?auto_1147762 ?auto_1147769 ) ) ( not ( = ?auto_1147762 ?auto_1147775 ) ) ( not ( = ?auto_1147763 ?auto_1147764 ) ) ( not ( = ?auto_1147763 ?auto_1147765 ) ) ( not ( = ?auto_1147763 ?auto_1147766 ) ) ( not ( = ?auto_1147763 ?auto_1147767 ) ) ( not ( = ?auto_1147763 ?auto_1147768 ) ) ( not ( = ?auto_1147763 ?auto_1147769 ) ) ( not ( = ?auto_1147763 ?auto_1147775 ) ) ( not ( = ?auto_1147764 ?auto_1147765 ) ) ( not ( = ?auto_1147764 ?auto_1147766 ) ) ( not ( = ?auto_1147764 ?auto_1147767 ) ) ( not ( = ?auto_1147764 ?auto_1147768 ) ) ( not ( = ?auto_1147764 ?auto_1147769 ) ) ( not ( = ?auto_1147764 ?auto_1147775 ) ) ( not ( = ?auto_1147765 ?auto_1147766 ) ) ( not ( = ?auto_1147765 ?auto_1147767 ) ) ( not ( = ?auto_1147765 ?auto_1147768 ) ) ( not ( = ?auto_1147765 ?auto_1147769 ) ) ( not ( = ?auto_1147765 ?auto_1147775 ) ) ( not ( = ?auto_1147766 ?auto_1147767 ) ) ( not ( = ?auto_1147766 ?auto_1147768 ) ) ( not ( = ?auto_1147766 ?auto_1147769 ) ) ( not ( = ?auto_1147766 ?auto_1147775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147767 ?auto_1147768 ?auto_1147769 )
      ( MAKE-12CRATE-VERIFY ?auto_1147757 ?auto_1147758 ?auto_1147759 ?auto_1147760 ?auto_1147761 ?auto_1147762 ?auto_1147763 ?auto_1147764 ?auto_1147765 ?auto_1147766 ?auto_1147767 ?auto_1147768 ?auto_1147769 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1147920 - SURFACE
      ?auto_1147921 - SURFACE
      ?auto_1147922 - SURFACE
      ?auto_1147923 - SURFACE
      ?auto_1147924 - SURFACE
      ?auto_1147925 - SURFACE
      ?auto_1147926 - SURFACE
      ?auto_1147927 - SURFACE
      ?auto_1147928 - SURFACE
      ?auto_1147929 - SURFACE
      ?auto_1147930 - SURFACE
      ?auto_1147931 - SURFACE
      ?auto_1147932 - SURFACE
    )
    :vars
    (
      ?auto_1147934 - HOIST
      ?auto_1147935 - PLACE
      ?auto_1147937 - PLACE
      ?auto_1147933 - HOIST
      ?auto_1147938 - SURFACE
      ?auto_1147936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147934 ?auto_1147935 ) ( IS-CRATE ?auto_1147932 ) ( not ( = ?auto_1147931 ?auto_1147932 ) ) ( not ( = ?auto_1147930 ?auto_1147931 ) ) ( not ( = ?auto_1147930 ?auto_1147932 ) ) ( not ( = ?auto_1147937 ?auto_1147935 ) ) ( HOIST-AT ?auto_1147933 ?auto_1147937 ) ( not ( = ?auto_1147934 ?auto_1147933 ) ) ( AVAILABLE ?auto_1147933 ) ( SURFACE-AT ?auto_1147932 ?auto_1147937 ) ( ON ?auto_1147932 ?auto_1147938 ) ( CLEAR ?auto_1147932 ) ( not ( = ?auto_1147931 ?auto_1147938 ) ) ( not ( = ?auto_1147932 ?auto_1147938 ) ) ( not ( = ?auto_1147930 ?auto_1147938 ) ) ( TRUCK-AT ?auto_1147936 ?auto_1147935 ) ( SURFACE-AT ?auto_1147930 ?auto_1147935 ) ( CLEAR ?auto_1147930 ) ( IS-CRATE ?auto_1147931 ) ( AVAILABLE ?auto_1147934 ) ( IN ?auto_1147931 ?auto_1147936 ) ( ON ?auto_1147921 ?auto_1147920 ) ( ON ?auto_1147922 ?auto_1147921 ) ( ON ?auto_1147923 ?auto_1147922 ) ( ON ?auto_1147924 ?auto_1147923 ) ( ON ?auto_1147925 ?auto_1147924 ) ( ON ?auto_1147926 ?auto_1147925 ) ( ON ?auto_1147927 ?auto_1147926 ) ( ON ?auto_1147928 ?auto_1147927 ) ( ON ?auto_1147929 ?auto_1147928 ) ( ON ?auto_1147930 ?auto_1147929 ) ( not ( = ?auto_1147920 ?auto_1147921 ) ) ( not ( = ?auto_1147920 ?auto_1147922 ) ) ( not ( = ?auto_1147920 ?auto_1147923 ) ) ( not ( = ?auto_1147920 ?auto_1147924 ) ) ( not ( = ?auto_1147920 ?auto_1147925 ) ) ( not ( = ?auto_1147920 ?auto_1147926 ) ) ( not ( = ?auto_1147920 ?auto_1147927 ) ) ( not ( = ?auto_1147920 ?auto_1147928 ) ) ( not ( = ?auto_1147920 ?auto_1147929 ) ) ( not ( = ?auto_1147920 ?auto_1147930 ) ) ( not ( = ?auto_1147920 ?auto_1147931 ) ) ( not ( = ?auto_1147920 ?auto_1147932 ) ) ( not ( = ?auto_1147920 ?auto_1147938 ) ) ( not ( = ?auto_1147921 ?auto_1147922 ) ) ( not ( = ?auto_1147921 ?auto_1147923 ) ) ( not ( = ?auto_1147921 ?auto_1147924 ) ) ( not ( = ?auto_1147921 ?auto_1147925 ) ) ( not ( = ?auto_1147921 ?auto_1147926 ) ) ( not ( = ?auto_1147921 ?auto_1147927 ) ) ( not ( = ?auto_1147921 ?auto_1147928 ) ) ( not ( = ?auto_1147921 ?auto_1147929 ) ) ( not ( = ?auto_1147921 ?auto_1147930 ) ) ( not ( = ?auto_1147921 ?auto_1147931 ) ) ( not ( = ?auto_1147921 ?auto_1147932 ) ) ( not ( = ?auto_1147921 ?auto_1147938 ) ) ( not ( = ?auto_1147922 ?auto_1147923 ) ) ( not ( = ?auto_1147922 ?auto_1147924 ) ) ( not ( = ?auto_1147922 ?auto_1147925 ) ) ( not ( = ?auto_1147922 ?auto_1147926 ) ) ( not ( = ?auto_1147922 ?auto_1147927 ) ) ( not ( = ?auto_1147922 ?auto_1147928 ) ) ( not ( = ?auto_1147922 ?auto_1147929 ) ) ( not ( = ?auto_1147922 ?auto_1147930 ) ) ( not ( = ?auto_1147922 ?auto_1147931 ) ) ( not ( = ?auto_1147922 ?auto_1147932 ) ) ( not ( = ?auto_1147922 ?auto_1147938 ) ) ( not ( = ?auto_1147923 ?auto_1147924 ) ) ( not ( = ?auto_1147923 ?auto_1147925 ) ) ( not ( = ?auto_1147923 ?auto_1147926 ) ) ( not ( = ?auto_1147923 ?auto_1147927 ) ) ( not ( = ?auto_1147923 ?auto_1147928 ) ) ( not ( = ?auto_1147923 ?auto_1147929 ) ) ( not ( = ?auto_1147923 ?auto_1147930 ) ) ( not ( = ?auto_1147923 ?auto_1147931 ) ) ( not ( = ?auto_1147923 ?auto_1147932 ) ) ( not ( = ?auto_1147923 ?auto_1147938 ) ) ( not ( = ?auto_1147924 ?auto_1147925 ) ) ( not ( = ?auto_1147924 ?auto_1147926 ) ) ( not ( = ?auto_1147924 ?auto_1147927 ) ) ( not ( = ?auto_1147924 ?auto_1147928 ) ) ( not ( = ?auto_1147924 ?auto_1147929 ) ) ( not ( = ?auto_1147924 ?auto_1147930 ) ) ( not ( = ?auto_1147924 ?auto_1147931 ) ) ( not ( = ?auto_1147924 ?auto_1147932 ) ) ( not ( = ?auto_1147924 ?auto_1147938 ) ) ( not ( = ?auto_1147925 ?auto_1147926 ) ) ( not ( = ?auto_1147925 ?auto_1147927 ) ) ( not ( = ?auto_1147925 ?auto_1147928 ) ) ( not ( = ?auto_1147925 ?auto_1147929 ) ) ( not ( = ?auto_1147925 ?auto_1147930 ) ) ( not ( = ?auto_1147925 ?auto_1147931 ) ) ( not ( = ?auto_1147925 ?auto_1147932 ) ) ( not ( = ?auto_1147925 ?auto_1147938 ) ) ( not ( = ?auto_1147926 ?auto_1147927 ) ) ( not ( = ?auto_1147926 ?auto_1147928 ) ) ( not ( = ?auto_1147926 ?auto_1147929 ) ) ( not ( = ?auto_1147926 ?auto_1147930 ) ) ( not ( = ?auto_1147926 ?auto_1147931 ) ) ( not ( = ?auto_1147926 ?auto_1147932 ) ) ( not ( = ?auto_1147926 ?auto_1147938 ) ) ( not ( = ?auto_1147927 ?auto_1147928 ) ) ( not ( = ?auto_1147927 ?auto_1147929 ) ) ( not ( = ?auto_1147927 ?auto_1147930 ) ) ( not ( = ?auto_1147927 ?auto_1147931 ) ) ( not ( = ?auto_1147927 ?auto_1147932 ) ) ( not ( = ?auto_1147927 ?auto_1147938 ) ) ( not ( = ?auto_1147928 ?auto_1147929 ) ) ( not ( = ?auto_1147928 ?auto_1147930 ) ) ( not ( = ?auto_1147928 ?auto_1147931 ) ) ( not ( = ?auto_1147928 ?auto_1147932 ) ) ( not ( = ?auto_1147928 ?auto_1147938 ) ) ( not ( = ?auto_1147929 ?auto_1147930 ) ) ( not ( = ?auto_1147929 ?auto_1147931 ) ) ( not ( = ?auto_1147929 ?auto_1147932 ) ) ( not ( = ?auto_1147929 ?auto_1147938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147930 ?auto_1147931 ?auto_1147932 )
      ( MAKE-12CRATE-VERIFY ?auto_1147920 ?auto_1147921 ?auto_1147922 ?auto_1147923 ?auto_1147924 ?auto_1147925 ?auto_1147926 ?auto_1147927 ?auto_1147928 ?auto_1147929 ?auto_1147930 ?auto_1147931 ?auto_1147932 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1159524 - SURFACE
      ?auto_1159525 - SURFACE
      ?auto_1159526 - SURFACE
      ?auto_1159527 - SURFACE
      ?auto_1159528 - SURFACE
      ?auto_1159529 - SURFACE
      ?auto_1159530 - SURFACE
      ?auto_1159531 - SURFACE
      ?auto_1159532 - SURFACE
      ?auto_1159533 - SURFACE
      ?auto_1159534 - SURFACE
      ?auto_1159535 - SURFACE
      ?auto_1159536 - SURFACE
      ?auto_1159537 - SURFACE
    )
    :vars
    (
      ?auto_1159539 - HOIST
      ?auto_1159538 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1159539 ?auto_1159538 ) ( SURFACE-AT ?auto_1159536 ?auto_1159538 ) ( CLEAR ?auto_1159536 ) ( LIFTING ?auto_1159539 ?auto_1159537 ) ( IS-CRATE ?auto_1159537 ) ( not ( = ?auto_1159536 ?auto_1159537 ) ) ( ON ?auto_1159525 ?auto_1159524 ) ( ON ?auto_1159526 ?auto_1159525 ) ( ON ?auto_1159527 ?auto_1159526 ) ( ON ?auto_1159528 ?auto_1159527 ) ( ON ?auto_1159529 ?auto_1159528 ) ( ON ?auto_1159530 ?auto_1159529 ) ( ON ?auto_1159531 ?auto_1159530 ) ( ON ?auto_1159532 ?auto_1159531 ) ( ON ?auto_1159533 ?auto_1159532 ) ( ON ?auto_1159534 ?auto_1159533 ) ( ON ?auto_1159535 ?auto_1159534 ) ( ON ?auto_1159536 ?auto_1159535 ) ( not ( = ?auto_1159524 ?auto_1159525 ) ) ( not ( = ?auto_1159524 ?auto_1159526 ) ) ( not ( = ?auto_1159524 ?auto_1159527 ) ) ( not ( = ?auto_1159524 ?auto_1159528 ) ) ( not ( = ?auto_1159524 ?auto_1159529 ) ) ( not ( = ?auto_1159524 ?auto_1159530 ) ) ( not ( = ?auto_1159524 ?auto_1159531 ) ) ( not ( = ?auto_1159524 ?auto_1159532 ) ) ( not ( = ?auto_1159524 ?auto_1159533 ) ) ( not ( = ?auto_1159524 ?auto_1159534 ) ) ( not ( = ?auto_1159524 ?auto_1159535 ) ) ( not ( = ?auto_1159524 ?auto_1159536 ) ) ( not ( = ?auto_1159524 ?auto_1159537 ) ) ( not ( = ?auto_1159525 ?auto_1159526 ) ) ( not ( = ?auto_1159525 ?auto_1159527 ) ) ( not ( = ?auto_1159525 ?auto_1159528 ) ) ( not ( = ?auto_1159525 ?auto_1159529 ) ) ( not ( = ?auto_1159525 ?auto_1159530 ) ) ( not ( = ?auto_1159525 ?auto_1159531 ) ) ( not ( = ?auto_1159525 ?auto_1159532 ) ) ( not ( = ?auto_1159525 ?auto_1159533 ) ) ( not ( = ?auto_1159525 ?auto_1159534 ) ) ( not ( = ?auto_1159525 ?auto_1159535 ) ) ( not ( = ?auto_1159525 ?auto_1159536 ) ) ( not ( = ?auto_1159525 ?auto_1159537 ) ) ( not ( = ?auto_1159526 ?auto_1159527 ) ) ( not ( = ?auto_1159526 ?auto_1159528 ) ) ( not ( = ?auto_1159526 ?auto_1159529 ) ) ( not ( = ?auto_1159526 ?auto_1159530 ) ) ( not ( = ?auto_1159526 ?auto_1159531 ) ) ( not ( = ?auto_1159526 ?auto_1159532 ) ) ( not ( = ?auto_1159526 ?auto_1159533 ) ) ( not ( = ?auto_1159526 ?auto_1159534 ) ) ( not ( = ?auto_1159526 ?auto_1159535 ) ) ( not ( = ?auto_1159526 ?auto_1159536 ) ) ( not ( = ?auto_1159526 ?auto_1159537 ) ) ( not ( = ?auto_1159527 ?auto_1159528 ) ) ( not ( = ?auto_1159527 ?auto_1159529 ) ) ( not ( = ?auto_1159527 ?auto_1159530 ) ) ( not ( = ?auto_1159527 ?auto_1159531 ) ) ( not ( = ?auto_1159527 ?auto_1159532 ) ) ( not ( = ?auto_1159527 ?auto_1159533 ) ) ( not ( = ?auto_1159527 ?auto_1159534 ) ) ( not ( = ?auto_1159527 ?auto_1159535 ) ) ( not ( = ?auto_1159527 ?auto_1159536 ) ) ( not ( = ?auto_1159527 ?auto_1159537 ) ) ( not ( = ?auto_1159528 ?auto_1159529 ) ) ( not ( = ?auto_1159528 ?auto_1159530 ) ) ( not ( = ?auto_1159528 ?auto_1159531 ) ) ( not ( = ?auto_1159528 ?auto_1159532 ) ) ( not ( = ?auto_1159528 ?auto_1159533 ) ) ( not ( = ?auto_1159528 ?auto_1159534 ) ) ( not ( = ?auto_1159528 ?auto_1159535 ) ) ( not ( = ?auto_1159528 ?auto_1159536 ) ) ( not ( = ?auto_1159528 ?auto_1159537 ) ) ( not ( = ?auto_1159529 ?auto_1159530 ) ) ( not ( = ?auto_1159529 ?auto_1159531 ) ) ( not ( = ?auto_1159529 ?auto_1159532 ) ) ( not ( = ?auto_1159529 ?auto_1159533 ) ) ( not ( = ?auto_1159529 ?auto_1159534 ) ) ( not ( = ?auto_1159529 ?auto_1159535 ) ) ( not ( = ?auto_1159529 ?auto_1159536 ) ) ( not ( = ?auto_1159529 ?auto_1159537 ) ) ( not ( = ?auto_1159530 ?auto_1159531 ) ) ( not ( = ?auto_1159530 ?auto_1159532 ) ) ( not ( = ?auto_1159530 ?auto_1159533 ) ) ( not ( = ?auto_1159530 ?auto_1159534 ) ) ( not ( = ?auto_1159530 ?auto_1159535 ) ) ( not ( = ?auto_1159530 ?auto_1159536 ) ) ( not ( = ?auto_1159530 ?auto_1159537 ) ) ( not ( = ?auto_1159531 ?auto_1159532 ) ) ( not ( = ?auto_1159531 ?auto_1159533 ) ) ( not ( = ?auto_1159531 ?auto_1159534 ) ) ( not ( = ?auto_1159531 ?auto_1159535 ) ) ( not ( = ?auto_1159531 ?auto_1159536 ) ) ( not ( = ?auto_1159531 ?auto_1159537 ) ) ( not ( = ?auto_1159532 ?auto_1159533 ) ) ( not ( = ?auto_1159532 ?auto_1159534 ) ) ( not ( = ?auto_1159532 ?auto_1159535 ) ) ( not ( = ?auto_1159532 ?auto_1159536 ) ) ( not ( = ?auto_1159532 ?auto_1159537 ) ) ( not ( = ?auto_1159533 ?auto_1159534 ) ) ( not ( = ?auto_1159533 ?auto_1159535 ) ) ( not ( = ?auto_1159533 ?auto_1159536 ) ) ( not ( = ?auto_1159533 ?auto_1159537 ) ) ( not ( = ?auto_1159534 ?auto_1159535 ) ) ( not ( = ?auto_1159534 ?auto_1159536 ) ) ( not ( = ?auto_1159534 ?auto_1159537 ) ) ( not ( = ?auto_1159535 ?auto_1159536 ) ) ( not ( = ?auto_1159535 ?auto_1159537 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1159536 ?auto_1159537 )
      ( MAKE-13CRATE-VERIFY ?auto_1159524 ?auto_1159525 ?auto_1159526 ?auto_1159527 ?auto_1159528 ?auto_1159529 ?auto_1159530 ?auto_1159531 ?auto_1159532 ?auto_1159533 ?auto_1159534 ?auto_1159535 ?auto_1159536 ?auto_1159537 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1159666 - SURFACE
      ?auto_1159667 - SURFACE
      ?auto_1159668 - SURFACE
      ?auto_1159669 - SURFACE
      ?auto_1159670 - SURFACE
      ?auto_1159671 - SURFACE
      ?auto_1159672 - SURFACE
      ?auto_1159673 - SURFACE
      ?auto_1159674 - SURFACE
      ?auto_1159675 - SURFACE
      ?auto_1159676 - SURFACE
      ?auto_1159677 - SURFACE
      ?auto_1159678 - SURFACE
      ?auto_1159679 - SURFACE
    )
    :vars
    (
      ?auto_1159681 - HOIST
      ?auto_1159680 - PLACE
      ?auto_1159682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1159681 ?auto_1159680 ) ( SURFACE-AT ?auto_1159678 ?auto_1159680 ) ( CLEAR ?auto_1159678 ) ( IS-CRATE ?auto_1159679 ) ( not ( = ?auto_1159678 ?auto_1159679 ) ) ( TRUCK-AT ?auto_1159682 ?auto_1159680 ) ( AVAILABLE ?auto_1159681 ) ( IN ?auto_1159679 ?auto_1159682 ) ( ON ?auto_1159678 ?auto_1159677 ) ( not ( = ?auto_1159677 ?auto_1159678 ) ) ( not ( = ?auto_1159677 ?auto_1159679 ) ) ( ON ?auto_1159667 ?auto_1159666 ) ( ON ?auto_1159668 ?auto_1159667 ) ( ON ?auto_1159669 ?auto_1159668 ) ( ON ?auto_1159670 ?auto_1159669 ) ( ON ?auto_1159671 ?auto_1159670 ) ( ON ?auto_1159672 ?auto_1159671 ) ( ON ?auto_1159673 ?auto_1159672 ) ( ON ?auto_1159674 ?auto_1159673 ) ( ON ?auto_1159675 ?auto_1159674 ) ( ON ?auto_1159676 ?auto_1159675 ) ( ON ?auto_1159677 ?auto_1159676 ) ( not ( = ?auto_1159666 ?auto_1159667 ) ) ( not ( = ?auto_1159666 ?auto_1159668 ) ) ( not ( = ?auto_1159666 ?auto_1159669 ) ) ( not ( = ?auto_1159666 ?auto_1159670 ) ) ( not ( = ?auto_1159666 ?auto_1159671 ) ) ( not ( = ?auto_1159666 ?auto_1159672 ) ) ( not ( = ?auto_1159666 ?auto_1159673 ) ) ( not ( = ?auto_1159666 ?auto_1159674 ) ) ( not ( = ?auto_1159666 ?auto_1159675 ) ) ( not ( = ?auto_1159666 ?auto_1159676 ) ) ( not ( = ?auto_1159666 ?auto_1159677 ) ) ( not ( = ?auto_1159666 ?auto_1159678 ) ) ( not ( = ?auto_1159666 ?auto_1159679 ) ) ( not ( = ?auto_1159667 ?auto_1159668 ) ) ( not ( = ?auto_1159667 ?auto_1159669 ) ) ( not ( = ?auto_1159667 ?auto_1159670 ) ) ( not ( = ?auto_1159667 ?auto_1159671 ) ) ( not ( = ?auto_1159667 ?auto_1159672 ) ) ( not ( = ?auto_1159667 ?auto_1159673 ) ) ( not ( = ?auto_1159667 ?auto_1159674 ) ) ( not ( = ?auto_1159667 ?auto_1159675 ) ) ( not ( = ?auto_1159667 ?auto_1159676 ) ) ( not ( = ?auto_1159667 ?auto_1159677 ) ) ( not ( = ?auto_1159667 ?auto_1159678 ) ) ( not ( = ?auto_1159667 ?auto_1159679 ) ) ( not ( = ?auto_1159668 ?auto_1159669 ) ) ( not ( = ?auto_1159668 ?auto_1159670 ) ) ( not ( = ?auto_1159668 ?auto_1159671 ) ) ( not ( = ?auto_1159668 ?auto_1159672 ) ) ( not ( = ?auto_1159668 ?auto_1159673 ) ) ( not ( = ?auto_1159668 ?auto_1159674 ) ) ( not ( = ?auto_1159668 ?auto_1159675 ) ) ( not ( = ?auto_1159668 ?auto_1159676 ) ) ( not ( = ?auto_1159668 ?auto_1159677 ) ) ( not ( = ?auto_1159668 ?auto_1159678 ) ) ( not ( = ?auto_1159668 ?auto_1159679 ) ) ( not ( = ?auto_1159669 ?auto_1159670 ) ) ( not ( = ?auto_1159669 ?auto_1159671 ) ) ( not ( = ?auto_1159669 ?auto_1159672 ) ) ( not ( = ?auto_1159669 ?auto_1159673 ) ) ( not ( = ?auto_1159669 ?auto_1159674 ) ) ( not ( = ?auto_1159669 ?auto_1159675 ) ) ( not ( = ?auto_1159669 ?auto_1159676 ) ) ( not ( = ?auto_1159669 ?auto_1159677 ) ) ( not ( = ?auto_1159669 ?auto_1159678 ) ) ( not ( = ?auto_1159669 ?auto_1159679 ) ) ( not ( = ?auto_1159670 ?auto_1159671 ) ) ( not ( = ?auto_1159670 ?auto_1159672 ) ) ( not ( = ?auto_1159670 ?auto_1159673 ) ) ( not ( = ?auto_1159670 ?auto_1159674 ) ) ( not ( = ?auto_1159670 ?auto_1159675 ) ) ( not ( = ?auto_1159670 ?auto_1159676 ) ) ( not ( = ?auto_1159670 ?auto_1159677 ) ) ( not ( = ?auto_1159670 ?auto_1159678 ) ) ( not ( = ?auto_1159670 ?auto_1159679 ) ) ( not ( = ?auto_1159671 ?auto_1159672 ) ) ( not ( = ?auto_1159671 ?auto_1159673 ) ) ( not ( = ?auto_1159671 ?auto_1159674 ) ) ( not ( = ?auto_1159671 ?auto_1159675 ) ) ( not ( = ?auto_1159671 ?auto_1159676 ) ) ( not ( = ?auto_1159671 ?auto_1159677 ) ) ( not ( = ?auto_1159671 ?auto_1159678 ) ) ( not ( = ?auto_1159671 ?auto_1159679 ) ) ( not ( = ?auto_1159672 ?auto_1159673 ) ) ( not ( = ?auto_1159672 ?auto_1159674 ) ) ( not ( = ?auto_1159672 ?auto_1159675 ) ) ( not ( = ?auto_1159672 ?auto_1159676 ) ) ( not ( = ?auto_1159672 ?auto_1159677 ) ) ( not ( = ?auto_1159672 ?auto_1159678 ) ) ( not ( = ?auto_1159672 ?auto_1159679 ) ) ( not ( = ?auto_1159673 ?auto_1159674 ) ) ( not ( = ?auto_1159673 ?auto_1159675 ) ) ( not ( = ?auto_1159673 ?auto_1159676 ) ) ( not ( = ?auto_1159673 ?auto_1159677 ) ) ( not ( = ?auto_1159673 ?auto_1159678 ) ) ( not ( = ?auto_1159673 ?auto_1159679 ) ) ( not ( = ?auto_1159674 ?auto_1159675 ) ) ( not ( = ?auto_1159674 ?auto_1159676 ) ) ( not ( = ?auto_1159674 ?auto_1159677 ) ) ( not ( = ?auto_1159674 ?auto_1159678 ) ) ( not ( = ?auto_1159674 ?auto_1159679 ) ) ( not ( = ?auto_1159675 ?auto_1159676 ) ) ( not ( = ?auto_1159675 ?auto_1159677 ) ) ( not ( = ?auto_1159675 ?auto_1159678 ) ) ( not ( = ?auto_1159675 ?auto_1159679 ) ) ( not ( = ?auto_1159676 ?auto_1159677 ) ) ( not ( = ?auto_1159676 ?auto_1159678 ) ) ( not ( = ?auto_1159676 ?auto_1159679 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1159677 ?auto_1159678 ?auto_1159679 )
      ( MAKE-13CRATE-VERIFY ?auto_1159666 ?auto_1159667 ?auto_1159668 ?auto_1159669 ?auto_1159670 ?auto_1159671 ?auto_1159672 ?auto_1159673 ?auto_1159674 ?auto_1159675 ?auto_1159676 ?auto_1159677 ?auto_1159678 ?auto_1159679 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1159822 - SURFACE
      ?auto_1159823 - SURFACE
      ?auto_1159824 - SURFACE
      ?auto_1159825 - SURFACE
      ?auto_1159826 - SURFACE
      ?auto_1159827 - SURFACE
      ?auto_1159828 - SURFACE
      ?auto_1159829 - SURFACE
      ?auto_1159830 - SURFACE
      ?auto_1159831 - SURFACE
      ?auto_1159832 - SURFACE
      ?auto_1159833 - SURFACE
      ?auto_1159834 - SURFACE
      ?auto_1159835 - SURFACE
    )
    :vars
    (
      ?auto_1159838 - HOIST
      ?auto_1159839 - PLACE
      ?auto_1159837 - TRUCK
      ?auto_1159836 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1159838 ?auto_1159839 ) ( SURFACE-AT ?auto_1159834 ?auto_1159839 ) ( CLEAR ?auto_1159834 ) ( IS-CRATE ?auto_1159835 ) ( not ( = ?auto_1159834 ?auto_1159835 ) ) ( AVAILABLE ?auto_1159838 ) ( IN ?auto_1159835 ?auto_1159837 ) ( ON ?auto_1159834 ?auto_1159833 ) ( not ( = ?auto_1159833 ?auto_1159834 ) ) ( not ( = ?auto_1159833 ?auto_1159835 ) ) ( TRUCK-AT ?auto_1159837 ?auto_1159836 ) ( not ( = ?auto_1159836 ?auto_1159839 ) ) ( ON ?auto_1159823 ?auto_1159822 ) ( ON ?auto_1159824 ?auto_1159823 ) ( ON ?auto_1159825 ?auto_1159824 ) ( ON ?auto_1159826 ?auto_1159825 ) ( ON ?auto_1159827 ?auto_1159826 ) ( ON ?auto_1159828 ?auto_1159827 ) ( ON ?auto_1159829 ?auto_1159828 ) ( ON ?auto_1159830 ?auto_1159829 ) ( ON ?auto_1159831 ?auto_1159830 ) ( ON ?auto_1159832 ?auto_1159831 ) ( ON ?auto_1159833 ?auto_1159832 ) ( not ( = ?auto_1159822 ?auto_1159823 ) ) ( not ( = ?auto_1159822 ?auto_1159824 ) ) ( not ( = ?auto_1159822 ?auto_1159825 ) ) ( not ( = ?auto_1159822 ?auto_1159826 ) ) ( not ( = ?auto_1159822 ?auto_1159827 ) ) ( not ( = ?auto_1159822 ?auto_1159828 ) ) ( not ( = ?auto_1159822 ?auto_1159829 ) ) ( not ( = ?auto_1159822 ?auto_1159830 ) ) ( not ( = ?auto_1159822 ?auto_1159831 ) ) ( not ( = ?auto_1159822 ?auto_1159832 ) ) ( not ( = ?auto_1159822 ?auto_1159833 ) ) ( not ( = ?auto_1159822 ?auto_1159834 ) ) ( not ( = ?auto_1159822 ?auto_1159835 ) ) ( not ( = ?auto_1159823 ?auto_1159824 ) ) ( not ( = ?auto_1159823 ?auto_1159825 ) ) ( not ( = ?auto_1159823 ?auto_1159826 ) ) ( not ( = ?auto_1159823 ?auto_1159827 ) ) ( not ( = ?auto_1159823 ?auto_1159828 ) ) ( not ( = ?auto_1159823 ?auto_1159829 ) ) ( not ( = ?auto_1159823 ?auto_1159830 ) ) ( not ( = ?auto_1159823 ?auto_1159831 ) ) ( not ( = ?auto_1159823 ?auto_1159832 ) ) ( not ( = ?auto_1159823 ?auto_1159833 ) ) ( not ( = ?auto_1159823 ?auto_1159834 ) ) ( not ( = ?auto_1159823 ?auto_1159835 ) ) ( not ( = ?auto_1159824 ?auto_1159825 ) ) ( not ( = ?auto_1159824 ?auto_1159826 ) ) ( not ( = ?auto_1159824 ?auto_1159827 ) ) ( not ( = ?auto_1159824 ?auto_1159828 ) ) ( not ( = ?auto_1159824 ?auto_1159829 ) ) ( not ( = ?auto_1159824 ?auto_1159830 ) ) ( not ( = ?auto_1159824 ?auto_1159831 ) ) ( not ( = ?auto_1159824 ?auto_1159832 ) ) ( not ( = ?auto_1159824 ?auto_1159833 ) ) ( not ( = ?auto_1159824 ?auto_1159834 ) ) ( not ( = ?auto_1159824 ?auto_1159835 ) ) ( not ( = ?auto_1159825 ?auto_1159826 ) ) ( not ( = ?auto_1159825 ?auto_1159827 ) ) ( not ( = ?auto_1159825 ?auto_1159828 ) ) ( not ( = ?auto_1159825 ?auto_1159829 ) ) ( not ( = ?auto_1159825 ?auto_1159830 ) ) ( not ( = ?auto_1159825 ?auto_1159831 ) ) ( not ( = ?auto_1159825 ?auto_1159832 ) ) ( not ( = ?auto_1159825 ?auto_1159833 ) ) ( not ( = ?auto_1159825 ?auto_1159834 ) ) ( not ( = ?auto_1159825 ?auto_1159835 ) ) ( not ( = ?auto_1159826 ?auto_1159827 ) ) ( not ( = ?auto_1159826 ?auto_1159828 ) ) ( not ( = ?auto_1159826 ?auto_1159829 ) ) ( not ( = ?auto_1159826 ?auto_1159830 ) ) ( not ( = ?auto_1159826 ?auto_1159831 ) ) ( not ( = ?auto_1159826 ?auto_1159832 ) ) ( not ( = ?auto_1159826 ?auto_1159833 ) ) ( not ( = ?auto_1159826 ?auto_1159834 ) ) ( not ( = ?auto_1159826 ?auto_1159835 ) ) ( not ( = ?auto_1159827 ?auto_1159828 ) ) ( not ( = ?auto_1159827 ?auto_1159829 ) ) ( not ( = ?auto_1159827 ?auto_1159830 ) ) ( not ( = ?auto_1159827 ?auto_1159831 ) ) ( not ( = ?auto_1159827 ?auto_1159832 ) ) ( not ( = ?auto_1159827 ?auto_1159833 ) ) ( not ( = ?auto_1159827 ?auto_1159834 ) ) ( not ( = ?auto_1159827 ?auto_1159835 ) ) ( not ( = ?auto_1159828 ?auto_1159829 ) ) ( not ( = ?auto_1159828 ?auto_1159830 ) ) ( not ( = ?auto_1159828 ?auto_1159831 ) ) ( not ( = ?auto_1159828 ?auto_1159832 ) ) ( not ( = ?auto_1159828 ?auto_1159833 ) ) ( not ( = ?auto_1159828 ?auto_1159834 ) ) ( not ( = ?auto_1159828 ?auto_1159835 ) ) ( not ( = ?auto_1159829 ?auto_1159830 ) ) ( not ( = ?auto_1159829 ?auto_1159831 ) ) ( not ( = ?auto_1159829 ?auto_1159832 ) ) ( not ( = ?auto_1159829 ?auto_1159833 ) ) ( not ( = ?auto_1159829 ?auto_1159834 ) ) ( not ( = ?auto_1159829 ?auto_1159835 ) ) ( not ( = ?auto_1159830 ?auto_1159831 ) ) ( not ( = ?auto_1159830 ?auto_1159832 ) ) ( not ( = ?auto_1159830 ?auto_1159833 ) ) ( not ( = ?auto_1159830 ?auto_1159834 ) ) ( not ( = ?auto_1159830 ?auto_1159835 ) ) ( not ( = ?auto_1159831 ?auto_1159832 ) ) ( not ( = ?auto_1159831 ?auto_1159833 ) ) ( not ( = ?auto_1159831 ?auto_1159834 ) ) ( not ( = ?auto_1159831 ?auto_1159835 ) ) ( not ( = ?auto_1159832 ?auto_1159833 ) ) ( not ( = ?auto_1159832 ?auto_1159834 ) ) ( not ( = ?auto_1159832 ?auto_1159835 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1159833 ?auto_1159834 ?auto_1159835 )
      ( MAKE-13CRATE-VERIFY ?auto_1159822 ?auto_1159823 ?auto_1159824 ?auto_1159825 ?auto_1159826 ?auto_1159827 ?auto_1159828 ?auto_1159829 ?auto_1159830 ?auto_1159831 ?auto_1159832 ?auto_1159833 ?auto_1159834 ?auto_1159835 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1159991 - SURFACE
      ?auto_1159992 - SURFACE
      ?auto_1159993 - SURFACE
      ?auto_1159994 - SURFACE
      ?auto_1159995 - SURFACE
      ?auto_1159996 - SURFACE
      ?auto_1159997 - SURFACE
      ?auto_1159998 - SURFACE
      ?auto_1159999 - SURFACE
      ?auto_1160000 - SURFACE
      ?auto_1160001 - SURFACE
      ?auto_1160002 - SURFACE
      ?auto_1160003 - SURFACE
      ?auto_1160004 - SURFACE
    )
    :vars
    (
      ?auto_1160006 - HOIST
      ?auto_1160009 - PLACE
      ?auto_1160005 - TRUCK
      ?auto_1160007 - PLACE
      ?auto_1160008 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1160006 ?auto_1160009 ) ( SURFACE-AT ?auto_1160003 ?auto_1160009 ) ( CLEAR ?auto_1160003 ) ( IS-CRATE ?auto_1160004 ) ( not ( = ?auto_1160003 ?auto_1160004 ) ) ( AVAILABLE ?auto_1160006 ) ( ON ?auto_1160003 ?auto_1160002 ) ( not ( = ?auto_1160002 ?auto_1160003 ) ) ( not ( = ?auto_1160002 ?auto_1160004 ) ) ( TRUCK-AT ?auto_1160005 ?auto_1160007 ) ( not ( = ?auto_1160007 ?auto_1160009 ) ) ( HOIST-AT ?auto_1160008 ?auto_1160007 ) ( LIFTING ?auto_1160008 ?auto_1160004 ) ( not ( = ?auto_1160006 ?auto_1160008 ) ) ( ON ?auto_1159992 ?auto_1159991 ) ( ON ?auto_1159993 ?auto_1159992 ) ( ON ?auto_1159994 ?auto_1159993 ) ( ON ?auto_1159995 ?auto_1159994 ) ( ON ?auto_1159996 ?auto_1159995 ) ( ON ?auto_1159997 ?auto_1159996 ) ( ON ?auto_1159998 ?auto_1159997 ) ( ON ?auto_1159999 ?auto_1159998 ) ( ON ?auto_1160000 ?auto_1159999 ) ( ON ?auto_1160001 ?auto_1160000 ) ( ON ?auto_1160002 ?auto_1160001 ) ( not ( = ?auto_1159991 ?auto_1159992 ) ) ( not ( = ?auto_1159991 ?auto_1159993 ) ) ( not ( = ?auto_1159991 ?auto_1159994 ) ) ( not ( = ?auto_1159991 ?auto_1159995 ) ) ( not ( = ?auto_1159991 ?auto_1159996 ) ) ( not ( = ?auto_1159991 ?auto_1159997 ) ) ( not ( = ?auto_1159991 ?auto_1159998 ) ) ( not ( = ?auto_1159991 ?auto_1159999 ) ) ( not ( = ?auto_1159991 ?auto_1160000 ) ) ( not ( = ?auto_1159991 ?auto_1160001 ) ) ( not ( = ?auto_1159991 ?auto_1160002 ) ) ( not ( = ?auto_1159991 ?auto_1160003 ) ) ( not ( = ?auto_1159991 ?auto_1160004 ) ) ( not ( = ?auto_1159992 ?auto_1159993 ) ) ( not ( = ?auto_1159992 ?auto_1159994 ) ) ( not ( = ?auto_1159992 ?auto_1159995 ) ) ( not ( = ?auto_1159992 ?auto_1159996 ) ) ( not ( = ?auto_1159992 ?auto_1159997 ) ) ( not ( = ?auto_1159992 ?auto_1159998 ) ) ( not ( = ?auto_1159992 ?auto_1159999 ) ) ( not ( = ?auto_1159992 ?auto_1160000 ) ) ( not ( = ?auto_1159992 ?auto_1160001 ) ) ( not ( = ?auto_1159992 ?auto_1160002 ) ) ( not ( = ?auto_1159992 ?auto_1160003 ) ) ( not ( = ?auto_1159992 ?auto_1160004 ) ) ( not ( = ?auto_1159993 ?auto_1159994 ) ) ( not ( = ?auto_1159993 ?auto_1159995 ) ) ( not ( = ?auto_1159993 ?auto_1159996 ) ) ( not ( = ?auto_1159993 ?auto_1159997 ) ) ( not ( = ?auto_1159993 ?auto_1159998 ) ) ( not ( = ?auto_1159993 ?auto_1159999 ) ) ( not ( = ?auto_1159993 ?auto_1160000 ) ) ( not ( = ?auto_1159993 ?auto_1160001 ) ) ( not ( = ?auto_1159993 ?auto_1160002 ) ) ( not ( = ?auto_1159993 ?auto_1160003 ) ) ( not ( = ?auto_1159993 ?auto_1160004 ) ) ( not ( = ?auto_1159994 ?auto_1159995 ) ) ( not ( = ?auto_1159994 ?auto_1159996 ) ) ( not ( = ?auto_1159994 ?auto_1159997 ) ) ( not ( = ?auto_1159994 ?auto_1159998 ) ) ( not ( = ?auto_1159994 ?auto_1159999 ) ) ( not ( = ?auto_1159994 ?auto_1160000 ) ) ( not ( = ?auto_1159994 ?auto_1160001 ) ) ( not ( = ?auto_1159994 ?auto_1160002 ) ) ( not ( = ?auto_1159994 ?auto_1160003 ) ) ( not ( = ?auto_1159994 ?auto_1160004 ) ) ( not ( = ?auto_1159995 ?auto_1159996 ) ) ( not ( = ?auto_1159995 ?auto_1159997 ) ) ( not ( = ?auto_1159995 ?auto_1159998 ) ) ( not ( = ?auto_1159995 ?auto_1159999 ) ) ( not ( = ?auto_1159995 ?auto_1160000 ) ) ( not ( = ?auto_1159995 ?auto_1160001 ) ) ( not ( = ?auto_1159995 ?auto_1160002 ) ) ( not ( = ?auto_1159995 ?auto_1160003 ) ) ( not ( = ?auto_1159995 ?auto_1160004 ) ) ( not ( = ?auto_1159996 ?auto_1159997 ) ) ( not ( = ?auto_1159996 ?auto_1159998 ) ) ( not ( = ?auto_1159996 ?auto_1159999 ) ) ( not ( = ?auto_1159996 ?auto_1160000 ) ) ( not ( = ?auto_1159996 ?auto_1160001 ) ) ( not ( = ?auto_1159996 ?auto_1160002 ) ) ( not ( = ?auto_1159996 ?auto_1160003 ) ) ( not ( = ?auto_1159996 ?auto_1160004 ) ) ( not ( = ?auto_1159997 ?auto_1159998 ) ) ( not ( = ?auto_1159997 ?auto_1159999 ) ) ( not ( = ?auto_1159997 ?auto_1160000 ) ) ( not ( = ?auto_1159997 ?auto_1160001 ) ) ( not ( = ?auto_1159997 ?auto_1160002 ) ) ( not ( = ?auto_1159997 ?auto_1160003 ) ) ( not ( = ?auto_1159997 ?auto_1160004 ) ) ( not ( = ?auto_1159998 ?auto_1159999 ) ) ( not ( = ?auto_1159998 ?auto_1160000 ) ) ( not ( = ?auto_1159998 ?auto_1160001 ) ) ( not ( = ?auto_1159998 ?auto_1160002 ) ) ( not ( = ?auto_1159998 ?auto_1160003 ) ) ( not ( = ?auto_1159998 ?auto_1160004 ) ) ( not ( = ?auto_1159999 ?auto_1160000 ) ) ( not ( = ?auto_1159999 ?auto_1160001 ) ) ( not ( = ?auto_1159999 ?auto_1160002 ) ) ( not ( = ?auto_1159999 ?auto_1160003 ) ) ( not ( = ?auto_1159999 ?auto_1160004 ) ) ( not ( = ?auto_1160000 ?auto_1160001 ) ) ( not ( = ?auto_1160000 ?auto_1160002 ) ) ( not ( = ?auto_1160000 ?auto_1160003 ) ) ( not ( = ?auto_1160000 ?auto_1160004 ) ) ( not ( = ?auto_1160001 ?auto_1160002 ) ) ( not ( = ?auto_1160001 ?auto_1160003 ) ) ( not ( = ?auto_1160001 ?auto_1160004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1160002 ?auto_1160003 ?auto_1160004 )
      ( MAKE-13CRATE-VERIFY ?auto_1159991 ?auto_1159992 ?auto_1159993 ?auto_1159994 ?auto_1159995 ?auto_1159996 ?auto_1159997 ?auto_1159998 ?auto_1159999 ?auto_1160000 ?auto_1160001 ?auto_1160002 ?auto_1160003 ?auto_1160004 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1160173 - SURFACE
      ?auto_1160174 - SURFACE
      ?auto_1160175 - SURFACE
      ?auto_1160176 - SURFACE
      ?auto_1160177 - SURFACE
      ?auto_1160178 - SURFACE
      ?auto_1160179 - SURFACE
      ?auto_1160180 - SURFACE
      ?auto_1160181 - SURFACE
      ?auto_1160182 - SURFACE
      ?auto_1160183 - SURFACE
      ?auto_1160184 - SURFACE
      ?auto_1160185 - SURFACE
      ?auto_1160186 - SURFACE
    )
    :vars
    (
      ?auto_1160189 - HOIST
      ?auto_1160191 - PLACE
      ?auto_1160190 - TRUCK
      ?auto_1160187 - PLACE
      ?auto_1160192 - HOIST
      ?auto_1160188 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1160189 ?auto_1160191 ) ( SURFACE-AT ?auto_1160185 ?auto_1160191 ) ( CLEAR ?auto_1160185 ) ( IS-CRATE ?auto_1160186 ) ( not ( = ?auto_1160185 ?auto_1160186 ) ) ( AVAILABLE ?auto_1160189 ) ( ON ?auto_1160185 ?auto_1160184 ) ( not ( = ?auto_1160184 ?auto_1160185 ) ) ( not ( = ?auto_1160184 ?auto_1160186 ) ) ( TRUCK-AT ?auto_1160190 ?auto_1160187 ) ( not ( = ?auto_1160187 ?auto_1160191 ) ) ( HOIST-AT ?auto_1160192 ?auto_1160187 ) ( not ( = ?auto_1160189 ?auto_1160192 ) ) ( AVAILABLE ?auto_1160192 ) ( SURFACE-AT ?auto_1160186 ?auto_1160187 ) ( ON ?auto_1160186 ?auto_1160188 ) ( CLEAR ?auto_1160186 ) ( not ( = ?auto_1160185 ?auto_1160188 ) ) ( not ( = ?auto_1160186 ?auto_1160188 ) ) ( not ( = ?auto_1160184 ?auto_1160188 ) ) ( ON ?auto_1160174 ?auto_1160173 ) ( ON ?auto_1160175 ?auto_1160174 ) ( ON ?auto_1160176 ?auto_1160175 ) ( ON ?auto_1160177 ?auto_1160176 ) ( ON ?auto_1160178 ?auto_1160177 ) ( ON ?auto_1160179 ?auto_1160178 ) ( ON ?auto_1160180 ?auto_1160179 ) ( ON ?auto_1160181 ?auto_1160180 ) ( ON ?auto_1160182 ?auto_1160181 ) ( ON ?auto_1160183 ?auto_1160182 ) ( ON ?auto_1160184 ?auto_1160183 ) ( not ( = ?auto_1160173 ?auto_1160174 ) ) ( not ( = ?auto_1160173 ?auto_1160175 ) ) ( not ( = ?auto_1160173 ?auto_1160176 ) ) ( not ( = ?auto_1160173 ?auto_1160177 ) ) ( not ( = ?auto_1160173 ?auto_1160178 ) ) ( not ( = ?auto_1160173 ?auto_1160179 ) ) ( not ( = ?auto_1160173 ?auto_1160180 ) ) ( not ( = ?auto_1160173 ?auto_1160181 ) ) ( not ( = ?auto_1160173 ?auto_1160182 ) ) ( not ( = ?auto_1160173 ?auto_1160183 ) ) ( not ( = ?auto_1160173 ?auto_1160184 ) ) ( not ( = ?auto_1160173 ?auto_1160185 ) ) ( not ( = ?auto_1160173 ?auto_1160186 ) ) ( not ( = ?auto_1160173 ?auto_1160188 ) ) ( not ( = ?auto_1160174 ?auto_1160175 ) ) ( not ( = ?auto_1160174 ?auto_1160176 ) ) ( not ( = ?auto_1160174 ?auto_1160177 ) ) ( not ( = ?auto_1160174 ?auto_1160178 ) ) ( not ( = ?auto_1160174 ?auto_1160179 ) ) ( not ( = ?auto_1160174 ?auto_1160180 ) ) ( not ( = ?auto_1160174 ?auto_1160181 ) ) ( not ( = ?auto_1160174 ?auto_1160182 ) ) ( not ( = ?auto_1160174 ?auto_1160183 ) ) ( not ( = ?auto_1160174 ?auto_1160184 ) ) ( not ( = ?auto_1160174 ?auto_1160185 ) ) ( not ( = ?auto_1160174 ?auto_1160186 ) ) ( not ( = ?auto_1160174 ?auto_1160188 ) ) ( not ( = ?auto_1160175 ?auto_1160176 ) ) ( not ( = ?auto_1160175 ?auto_1160177 ) ) ( not ( = ?auto_1160175 ?auto_1160178 ) ) ( not ( = ?auto_1160175 ?auto_1160179 ) ) ( not ( = ?auto_1160175 ?auto_1160180 ) ) ( not ( = ?auto_1160175 ?auto_1160181 ) ) ( not ( = ?auto_1160175 ?auto_1160182 ) ) ( not ( = ?auto_1160175 ?auto_1160183 ) ) ( not ( = ?auto_1160175 ?auto_1160184 ) ) ( not ( = ?auto_1160175 ?auto_1160185 ) ) ( not ( = ?auto_1160175 ?auto_1160186 ) ) ( not ( = ?auto_1160175 ?auto_1160188 ) ) ( not ( = ?auto_1160176 ?auto_1160177 ) ) ( not ( = ?auto_1160176 ?auto_1160178 ) ) ( not ( = ?auto_1160176 ?auto_1160179 ) ) ( not ( = ?auto_1160176 ?auto_1160180 ) ) ( not ( = ?auto_1160176 ?auto_1160181 ) ) ( not ( = ?auto_1160176 ?auto_1160182 ) ) ( not ( = ?auto_1160176 ?auto_1160183 ) ) ( not ( = ?auto_1160176 ?auto_1160184 ) ) ( not ( = ?auto_1160176 ?auto_1160185 ) ) ( not ( = ?auto_1160176 ?auto_1160186 ) ) ( not ( = ?auto_1160176 ?auto_1160188 ) ) ( not ( = ?auto_1160177 ?auto_1160178 ) ) ( not ( = ?auto_1160177 ?auto_1160179 ) ) ( not ( = ?auto_1160177 ?auto_1160180 ) ) ( not ( = ?auto_1160177 ?auto_1160181 ) ) ( not ( = ?auto_1160177 ?auto_1160182 ) ) ( not ( = ?auto_1160177 ?auto_1160183 ) ) ( not ( = ?auto_1160177 ?auto_1160184 ) ) ( not ( = ?auto_1160177 ?auto_1160185 ) ) ( not ( = ?auto_1160177 ?auto_1160186 ) ) ( not ( = ?auto_1160177 ?auto_1160188 ) ) ( not ( = ?auto_1160178 ?auto_1160179 ) ) ( not ( = ?auto_1160178 ?auto_1160180 ) ) ( not ( = ?auto_1160178 ?auto_1160181 ) ) ( not ( = ?auto_1160178 ?auto_1160182 ) ) ( not ( = ?auto_1160178 ?auto_1160183 ) ) ( not ( = ?auto_1160178 ?auto_1160184 ) ) ( not ( = ?auto_1160178 ?auto_1160185 ) ) ( not ( = ?auto_1160178 ?auto_1160186 ) ) ( not ( = ?auto_1160178 ?auto_1160188 ) ) ( not ( = ?auto_1160179 ?auto_1160180 ) ) ( not ( = ?auto_1160179 ?auto_1160181 ) ) ( not ( = ?auto_1160179 ?auto_1160182 ) ) ( not ( = ?auto_1160179 ?auto_1160183 ) ) ( not ( = ?auto_1160179 ?auto_1160184 ) ) ( not ( = ?auto_1160179 ?auto_1160185 ) ) ( not ( = ?auto_1160179 ?auto_1160186 ) ) ( not ( = ?auto_1160179 ?auto_1160188 ) ) ( not ( = ?auto_1160180 ?auto_1160181 ) ) ( not ( = ?auto_1160180 ?auto_1160182 ) ) ( not ( = ?auto_1160180 ?auto_1160183 ) ) ( not ( = ?auto_1160180 ?auto_1160184 ) ) ( not ( = ?auto_1160180 ?auto_1160185 ) ) ( not ( = ?auto_1160180 ?auto_1160186 ) ) ( not ( = ?auto_1160180 ?auto_1160188 ) ) ( not ( = ?auto_1160181 ?auto_1160182 ) ) ( not ( = ?auto_1160181 ?auto_1160183 ) ) ( not ( = ?auto_1160181 ?auto_1160184 ) ) ( not ( = ?auto_1160181 ?auto_1160185 ) ) ( not ( = ?auto_1160181 ?auto_1160186 ) ) ( not ( = ?auto_1160181 ?auto_1160188 ) ) ( not ( = ?auto_1160182 ?auto_1160183 ) ) ( not ( = ?auto_1160182 ?auto_1160184 ) ) ( not ( = ?auto_1160182 ?auto_1160185 ) ) ( not ( = ?auto_1160182 ?auto_1160186 ) ) ( not ( = ?auto_1160182 ?auto_1160188 ) ) ( not ( = ?auto_1160183 ?auto_1160184 ) ) ( not ( = ?auto_1160183 ?auto_1160185 ) ) ( not ( = ?auto_1160183 ?auto_1160186 ) ) ( not ( = ?auto_1160183 ?auto_1160188 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1160184 ?auto_1160185 ?auto_1160186 )
      ( MAKE-13CRATE-VERIFY ?auto_1160173 ?auto_1160174 ?auto_1160175 ?auto_1160176 ?auto_1160177 ?auto_1160178 ?auto_1160179 ?auto_1160180 ?auto_1160181 ?auto_1160182 ?auto_1160183 ?auto_1160184 ?auto_1160185 ?auto_1160186 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1160356 - SURFACE
      ?auto_1160357 - SURFACE
      ?auto_1160358 - SURFACE
      ?auto_1160359 - SURFACE
      ?auto_1160360 - SURFACE
      ?auto_1160361 - SURFACE
      ?auto_1160362 - SURFACE
      ?auto_1160363 - SURFACE
      ?auto_1160364 - SURFACE
      ?auto_1160365 - SURFACE
      ?auto_1160366 - SURFACE
      ?auto_1160367 - SURFACE
      ?auto_1160368 - SURFACE
      ?auto_1160369 - SURFACE
    )
    :vars
    (
      ?auto_1160375 - HOIST
      ?auto_1160373 - PLACE
      ?auto_1160371 - PLACE
      ?auto_1160372 - HOIST
      ?auto_1160370 - SURFACE
      ?auto_1160374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1160375 ?auto_1160373 ) ( SURFACE-AT ?auto_1160368 ?auto_1160373 ) ( CLEAR ?auto_1160368 ) ( IS-CRATE ?auto_1160369 ) ( not ( = ?auto_1160368 ?auto_1160369 ) ) ( AVAILABLE ?auto_1160375 ) ( ON ?auto_1160368 ?auto_1160367 ) ( not ( = ?auto_1160367 ?auto_1160368 ) ) ( not ( = ?auto_1160367 ?auto_1160369 ) ) ( not ( = ?auto_1160371 ?auto_1160373 ) ) ( HOIST-AT ?auto_1160372 ?auto_1160371 ) ( not ( = ?auto_1160375 ?auto_1160372 ) ) ( AVAILABLE ?auto_1160372 ) ( SURFACE-AT ?auto_1160369 ?auto_1160371 ) ( ON ?auto_1160369 ?auto_1160370 ) ( CLEAR ?auto_1160369 ) ( not ( = ?auto_1160368 ?auto_1160370 ) ) ( not ( = ?auto_1160369 ?auto_1160370 ) ) ( not ( = ?auto_1160367 ?auto_1160370 ) ) ( TRUCK-AT ?auto_1160374 ?auto_1160373 ) ( ON ?auto_1160357 ?auto_1160356 ) ( ON ?auto_1160358 ?auto_1160357 ) ( ON ?auto_1160359 ?auto_1160358 ) ( ON ?auto_1160360 ?auto_1160359 ) ( ON ?auto_1160361 ?auto_1160360 ) ( ON ?auto_1160362 ?auto_1160361 ) ( ON ?auto_1160363 ?auto_1160362 ) ( ON ?auto_1160364 ?auto_1160363 ) ( ON ?auto_1160365 ?auto_1160364 ) ( ON ?auto_1160366 ?auto_1160365 ) ( ON ?auto_1160367 ?auto_1160366 ) ( not ( = ?auto_1160356 ?auto_1160357 ) ) ( not ( = ?auto_1160356 ?auto_1160358 ) ) ( not ( = ?auto_1160356 ?auto_1160359 ) ) ( not ( = ?auto_1160356 ?auto_1160360 ) ) ( not ( = ?auto_1160356 ?auto_1160361 ) ) ( not ( = ?auto_1160356 ?auto_1160362 ) ) ( not ( = ?auto_1160356 ?auto_1160363 ) ) ( not ( = ?auto_1160356 ?auto_1160364 ) ) ( not ( = ?auto_1160356 ?auto_1160365 ) ) ( not ( = ?auto_1160356 ?auto_1160366 ) ) ( not ( = ?auto_1160356 ?auto_1160367 ) ) ( not ( = ?auto_1160356 ?auto_1160368 ) ) ( not ( = ?auto_1160356 ?auto_1160369 ) ) ( not ( = ?auto_1160356 ?auto_1160370 ) ) ( not ( = ?auto_1160357 ?auto_1160358 ) ) ( not ( = ?auto_1160357 ?auto_1160359 ) ) ( not ( = ?auto_1160357 ?auto_1160360 ) ) ( not ( = ?auto_1160357 ?auto_1160361 ) ) ( not ( = ?auto_1160357 ?auto_1160362 ) ) ( not ( = ?auto_1160357 ?auto_1160363 ) ) ( not ( = ?auto_1160357 ?auto_1160364 ) ) ( not ( = ?auto_1160357 ?auto_1160365 ) ) ( not ( = ?auto_1160357 ?auto_1160366 ) ) ( not ( = ?auto_1160357 ?auto_1160367 ) ) ( not ( = ?auto_1160357 ?auto_1160368 ) ) ( not ( = ?auto_1160357 ?auto_1160369 ) ) ( not ( = ?auto_1160357 ?auto_1160370 ) ) ( not ( = ?auto_1160358 ?auto_1160359 ) ) ( not ( = ?auto_1160358 ?auto_1160360 ) ) ( not ( = ?auto_1160358 ?auto_1160361 ) ) ( not ( = ?auto_1160358 ?auto_1160362 ) ) ( not ( = ?auto_1160358 ?auto_1160363 ) ) ( not ( = ?auto_1160358 ?auto_1160364 ) ) ( not ( = ?auto_1160358 ?auto_1160365 ) ) ( not ( = ?auto_1160358 ?auto_1160366 ) ) ( not ( = ?auto_1160358 ?auto_1160367 ) ) ( not ( = ?auto_1160358 ?auto_1160368 ) ) ( not ( = ?auto_1160358 ?auto_1160369 ) ) ( not ( = ?auto_1160358 ?auto_1160370 ) ) ( not ( = ?auto_1160359 ?auto_1160360 ) ) ( not ( = ?auto_1160359 ?auto_1160361 ) ) ( not ( = ?auto_1160359 ?auto_1160362 ) ) ( not ( = ?auto_1160359 ?auto_1160363 ) ) ( not ( = ?auto_1160359 ?auto_1160364 ) ) ( not ( = ?auto_1160359 ?auto_1160365 ) ) ( not ( = ?auto_1160359 ?auto_1160366 ) ) ( not ( = ?auto_1160359 ?auto_1160367 ) ) ( not ( = ?auto_1160359 ?auto_1160368 ) ) ( not ( = ?auto_1160359 ?auto_1160369 ) ) ( not ( = ?auto_1160359 ?auto_1160370 ) ) ( not ( = ?auto_1160360 ?auto_1160361 ) ) ( not ( = ?auto_1160360 ?auto_1160362 ) ) ( not ( = ?auto_1160360 ?auto_1160363 ) ) ( not ( = ?auto_1160360 ?auto_1160364 ) ) ( not ( = ?auto_1160360 ?auto_1160365 ) ) ( not ( = ?auto_1160360 ?auto_1160366 ) ) ( not ( = ?auto_1160360 ?auto_1160367 ) ) ( not ( = ?auto_1160360 ?auto_1160368 ) ) ( not ( = ?auto_1160360 ?auto_1160369 ) ) ( not ( = ?auto_1160360 ?auto_1160370 ) ) ( not ( = ?auto_1160361 ?auto_1160362 ) ) ( not ( = ?auto_1160361 ?auto_1160363 ) ) ( not ( = ?auto_1160361 ?auto_1160364 ) ) ( not ( = ?auto_1160361 ?auto_1160365 ) ) ( not ( = ?auto_1160361 ?auto_1160366 ) ) ( not ( = ?auto_1160361 ?auto_1160367 ) ) ( not ( = ?auto_1160361 ?auto_1160368 ) ) ( not ( = ?auto_1160361 ?auto_1160369 ) ) ( not ( = ?auto_1160361 ?auto_1160370 ) ) ( not ( = ?auto_1160362 ?auto_1160363 ) ) ( not ( = ?auto_1160362 ?auto_1160364 ) ) ( not ( = ?auto_1160362 ?auto_1160365 ) ) ( not ( = ?auto_1160362 ?auto_1160366 ) ) ( not ( = ?auto_1160362 ?auto_1160367 ) ) ( not ( = ?auto_1160362 ?auto_1160368 ) ) ( not ( = ?auto_1160362 ?auto_1160369 ) ) ( not ( = ?auto_1160362 ?auto_1160370 ) ) ( not ( = ?auto_1160363 ?auto_1160364 ) ) ( not ( = ?auto_1160363 ?auto_1160365 ) ) ( not ( = ?auto_1160363 ?auto_1160366 ) ) ( not ( = ?auto_1160363 ?auto_1160367 ) ) ( not ( = ?auto_1160363 ?auto_1160368 ) ) ( not ( = ?auto_1160363 ?auto_1160369 ) ) ( not ( = ?auto_1160363 ?auto_1160370 ) ) ( not ( = ?auto_1160364 ?auto_1160365 ) ) ( not ( = ?auto_1160364 ?auto_1160366 ) ) ( not ( = ?auto_1160364 ?auto_1160367 ) ) ( not ( = ?auto_1160364 ?auto_1160368 ) ) ( not ( = ?auto_1160364 ?auto_1160369 ) ) ( not ( = ?auto_1160364 ?auto_1160370 ) ) ( not ( = ?auto_1160365 ?auto_1160366 ) ) ( not ( = ?auto_1160365 ?auto_1160367 ) ) ( not ( = ?auto_1160365 ?auto_1160368 ) ) ( not ( = ?auto_1160365 ?auto_1160369 ) ) ( not ( = ?auto_1160365 ?auto_1160370 ) ) ( not ( = ?auto_1160366 ?auto_1160367 ) ) ( not ( = ?auto_1160366 ?auto_1160368 ) ) ( not ( = ?auto_1160366 ?auto_1160369 ) ) ( not ( = ?auto_1160366 ?auto_1160370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1160367 ?auto_1160368 ?auto_1160369 )
      ( MAKE-13CRATE-VERIFY ?auto_1160356 ?auto_1160357 ?auto_1160358 ?auto_1160359 ?auto_1160360 ?auto_1160361 ?auto_1160362 ?auto_1160363 ?auto_1160364 ?auto_1160365 ?auto_1160366 ?auto_1160367 ?auto_1160368 ?auto_1160369 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1160539 - SURFACE
      ?auto_1160540 - SURFACE
      ?auto_1160541 - SURFACE
      ?auto_1160542 - SURFACE
      ?auto_1160543 - SURFACE
      ?auto_1160544 - SURFACE
      ?auto_1160545 - SURFACE
      ?auto_1160546 - SURFACE
      ?auto_1160547 - SURFACE
      ?auto_1160548 - SURFACE
      ?auto_1160549 - SURFACE
      ?auto_1160550 - SURFACE
      ?auto_1160551 - SURFACE
      ?auto_1160552 - SURFACE
    )
    :vars
    (
      ?auto_1160553 - HOIST
      ?auto_1160556 - PLACE
      ?auto_1160555 - PLACE
      ?auto_1160558 - HOIST
      ?auto_1160557 - SURFACE
      ?auto_1160554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1160553 ?auto_1160556 ) ( IS-CRATE ?auto_1160552 ) ( not ( = ?auto_1160551 ?auto_1160552 ) ) ( not ( = ?auto_1160550 ?auto_1160551 ) ) ( not ( = ?auto_1160550 ?auto_1160552 ) ) ( not ( = ?auto_1160555 ?auto_1160556 ) ) ( HOIST-AT ?auto_1160558 ?auto_1160555 ) ( not ( = ?auto_1160553 ?auto_1160558 ) ) ( AVAILABLE ?auto_1160558 ) ( SURFACE-AT ?auto_1160552 ?auto_1160555 ) ( ON ?auto_1160552 ?auto_1160557 ) ( CLEAR ?auto_1160552 ) ( not ( = ?auto_1160551 ?auto_1160557 ) ) ( not ( = ?auto_1160552 ?auto_1160557 ) ) ( not ( = ?auto_1160550 ?auto_1160557 ) ) ( TRUCK-AT ?auto_1160554 ?auto_1160556 ) ( SURFACE-AT ?auto_1160550 ?auto_1160556 ) ( CLEAR ?auto_1160550 ) ( LIFTING ?auto_1160553 ?auto_1160551 ) ( IS-CRATE ?auto_1160551 ) ( ON ?auto_1160540 ?auto_1160539 ) ( ON ?auto_1160541 ?auto_1160540 ) ( ON ?auto_1160542 ?auto_1160541 ) ( ON ?auto_1160543 ?auto_1160542 ) ( ON ?auto_1160544 ?auto_1160543 ) ( ON ?auto_1160545 ?auto_1160544 ) ( ON ?auto_1160546 ?auto_1160545 ) ( ON ?auto_1160547 ?auto_1160546 ) ( ON ?auto_1160548 ?auto_1160547 ) ( ON ?auto_1160549 ?auto_1160548 ) ( ON ?auto_1160550 ?auto_1160549 ) ( not ( = ?auto_1160539 ?auto_1160540 ) ) ( not ( = ?auto_1160539 ?auto_1160541 ) ) ( not ( = ?auto_1160539 ?auto_1160542 ) ) ( not ( = ?auto_1160539 ?auto_1160543 ) ) ( not ( = ?auto_1160539 ?auto_1160544 ) ) ( not ( = ?auto_1160539 ?auto_1160545 ) ) ( not ( = ?auto_1160539 ?auto_1160546 ) ) ( not ( = ?auto_1160539 ?auto_1160547 ) ) ( not ( = ?auto_1160539 ?auto_1160548 ) ) ( not ( = ?auto_1160539 ?auto_1160549 ) ) ( not ( = ?auto_1160539 ?auto_1160550 ) ) ( not ( = ?auto_1160539 ?auto_1160551 ) ) ( not ( = ?auto_1160539 ?auto_1160552 ) ) ( not ( = ?auto_1160539 ?auto_1160557 ) ) ( not ( = ?auto_1160540 ?auto_1160541 ) ) ( not ( = ?auto_1160540 ?auto_1160542 ) ) ( not ( = ?auto_1160540 ?auto_1160543 ) ) ( not ( = ?auto_1160540 ?auto_1160544 ) ) ( not ( = ?auto_1160540 ?auto_1160545 ) ) ( not ( = ?auto_1160540 ?auto_1160546 ) ) ( not ( = ?auto_1160540 ?auto_1160547 ) ) ( not ( = ?auto_1160540 ?auto_1160548 ) ) ( not ( = ?auto_1160540 ?auto_1160549 ) ) ( not ( = ?auto_1160540 ?auto_1160550 ) ) ( not ( = ?auto_1160540 ?auto_1160551 ) ) ( not ( = ?auto_1160540 ?auto_1160552 ) ) ( not ( = ?auto_1160540 ?auto_1160557 ) ) ( not ( = ?auto_1160541 ?auto_1160542 ) ) ( not ( = ?auto_1160541 ?auto_1160543 ) ) ( not ( = ?auto_1160541 ?auto_1160544 ) ) ( not ( = ?auto_1160541 ?auto_1160545 ) ) ( not ( = ?auto_1160541 ?auto_1160546 ) ) ( not ( = ?auto_1160541 ?auto_1160547 ) ) ( not ( = ?auto_1160541 ?auto_1160548 ) ) ( not ( = ?auto_1160541 ?auto_1160549 ) ) ( not ( = ?auto_1160541 ?auto_1160550 ) ) ( not ( = ?auto_1160541 ?auto_1160551 ) ) ( not ( = ?auto_1160541 ?auto_1160552 ) ) ( not ( = ?auto_1160541 ?auto_1160557 ) ) ( not ( = ?auto_1160542 ?auto_1160543 ) ) ( not ( = ?auto_1160542 ?auto_1160544 ) ) ( not ( = ?auto_1160542 ?auto_1160545 ) ) ( not ( = ?auto_1160542 ?auto_1160546 ) ) ( not ( = ?auto_1160542 ?auto_1160547 ) ) ( not ( = ?auto_1160542 ?auto_1160548 ) ) ( not ( = ?auto_1160542 ?auto_1160549 ) ) ( not ( = ?auto_1160542 ?auto_1160550 ) ) ( not ( = ?auto_1160542 ?auto_1160551 ) ) ( not ( = ?auto_1160542 ?auto_1160552 ) ) ( not ( = ?auto_1160542 ?auto_1160557 ) ) ( not ( = ?auto_1160543 ?auto_1160544 ) ) ( not ( = ?auto_1160543 ?auto_1160545 ) ) ( not ( = ?auto_1160543 ?auto_1160546 ) ) ( not ( = ?auto_1160543 ?auto_1160547 ) ) ( not ( = ?auto_1160543 ?auto_1160548 ) ) ( not ( = ?auto_1160543 ?auto_1160549 ) ) ( not ( = ?auto_1160543 ?auto_1160550 ) ) ( not ( = ?auto_1160543 ?auto_1160551 ) ) ( not ( = ?auto_1160543 ?auto_1160552 ) ) ( not ( = ?auto_1160543 ?auto_1160557 ) ) ( not ( = ?auto_1160544 ?auto_1160545 ) ) ( not ( = ?auto_1160544 ?auto_1160546 ) ) ( not ( = ?auto_1160544 ?auto_1160547 ) ) ( not ( = ?auto_1160544 ?auto_1160548 ) ) ( not ( = ?auto_1160544 ?auto_1160549 ) ) ( not ( = ?auto_1160544 ?auto_1160550 ) ) ( not ( = ?auto_1160544 ?auto_1160551 ) ) ( not ( = ?auto_1160544 ?auto_1160552 ) ) ( not ( = ?auto_1160544 ?auto_1160557 ) ) ( not ( = ?auto_1160545 ?auto_1160546 ) ) ( not ( = ?auto_1160545 ?auto_1160547 ) ) ( not ( = ?auto_1160545 ?auto_1160548 ) ) ( not ( = ?auto_1160545 ?auto_1160549 ) ) ( not ( = ?auto_1160545 ?auto_1160550 ) ) ( not ( = ?auto_1160545 ?auto_1160551 ) ) ( not ( = ?auto_1160545 ?auto_1160552 ) ) ( not ( = ?auto_1160545 ?auto_1160557 ) ) ( not ( = ?auto_1160546 ?auto_1160547 ) ) ( not ( = ?auto_1160546 ?auto_1160548 ) ) ( not ( = ?auto_1160546 ?auto_1160549 ) ) ( not ( = ?auto_1160546 ?auto_1160550 ) ) ( not ( = ?auto_1160546 ?auto_1160551 ) ) ( not ( = ?auto_1160546 ?auto_1160552 ) ) ( not ( = ?auto_1160546 ?auto_1160557 ) ) ( not ( = ?auto_1160547 ?auto_1160548 ) ) ( not ( = ?auto_1160547 ?auto_1160549 ) ) ( not ( = ?auto_1160547 ?auto_1160550 ) ) ( not ( = ?auto_1160547 ?auto_1160551 ) ) ( not ( = ?auto_1160547 ?auto_1160552 ) ) ( not ( = ?auto_1160547 ?auto_1160557 ) ) ( not ( = ?auto_1160548 ?auto_1160549 ) ) ( not ( = ?auto_1160548 ?auto_1160550 ) ) ( not ( = ?auto_1160548 ?auto_1160551 ) ) ( not ( = ?auto_1160548 ?auto_1160552 ) ) ( not ( = ?auto_1160548 ?auto_1160557 ) ) ( not ( = ?auto_1160549 ?auto_1160550 ) ) ( not ( = ?auto_1160549 ?auto_1160551 ) ) ( not ( = ?auto_1160549 ?auto_1160552 ) ) ( not ( = ?auto_1160549 ?auto_1160557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1160550 ?auto_1160551 ?auto_1160552 )
      ( MAKE-13CRATE-VERIFY ?auto_1160539 ?auto_1160540 ?auto_1160541 ?auto_1160542 ?auto_1160543 ?auto_1160544 ?auto_1160545 ?auto_1160546 ?auto_1160547 ?auto_1160548 ?auto_1160549 ?auto_1160550 ?auto_1160551 ?auto_1160552 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1160722 - SURFACE
      ?auto_1160723 - SURFACE
      ?auto_1160724 - SURFACE
      ?auto_1160725 - SURFACE
      ?auto_1160726 - SURFACE
      ?auto_1160727 - SURFACE
      ?auto_1160728 - SURFACE
      ?auto_1160729 - SURFACE
      ?auto_1160730 - SURFACE
      ?auto_1160731 - SURFACE
      ?auto_1160732 - SURFACE
      ?auto_1160733 - SURFACE
      ?auto_1160734 - SURFACE
      ?auto_1160735 - SURFACE
    )
    :vars
    (
      ?auto_1160736 - HOIST
      ?auto_1160737 - PLACE
      ?auto_1160739 - PLACE
      ?auto_1160741 - HOIST
      ?auto_1160738 - SURFACE
      ?auto_1160740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1160736 ?auto_1160737 ) ( IS-CRATE ?auto_1160735 ) ( not ( = ?auto_1160734 ?auto_1160735 ) ) ( not ( = ?auto_1160733 ?auto_1160734 ) ) ( not ( = ?auto_1160733 ?auto_1160735 ) ) ( not ( = ?auto_1160739 ?auto_1160737 ) ) ( HOIST-AT ?auto_1160741 ?auto_1160739 ) ( not ( = ?auto_1160736 ?auto_1160741 ) ) ( AVAILABLE ?auto_1160741 ) ( SURFACE-AT ?auto_1160735 ?auto_1160739 ) ( ON ?auto_1160735 ?auto_1160738 ) ( CLEAR ?auto_1160735 ) ( not ( = ?auto_1160734 ?auto_1160738 ) ) ( not ( = ?auto_1160735 ?auto_1160738 ) ) ( not ( = ?auto_1160733 ?auto_1160738 ) ) ( TRUCK-AT ?auto_1160740 ?auto_1160737 ) ( SURFACE-AT ?auto_1160733 ?auto_1160737 ) ( CLEAR ?auto_1160733 ) ( IS-CRATE ?auto_1160734 ) ( AVAILABLE ?auto_1160736 ) ( IN ?auto_1160734 ?auto_1160740 ) ( ON ?auto_1160723 ?auto_1160722 ) ( ON ?auto_1160724 ?auto_1160723 ) ( ON ?auto_1160725 ?auto_1160724 ) ( ON ?auto_1160726 ?auto_1160725 ) ( ON ?auto_1160727 ?auto_1160726 ) ( ON ?auto_1160728 ?auto_1160727 ) ( ON ?auto_1160729 ?auto_1160728 ) ( ON ?auto_1160730 ?auto_1160729 ) ( ON ?auto_1160731 ?auto_1160730 ) ( ON ?auto_1160732 ?auto_1160731 ) ( ON ?auto_1160733 ?auto_1160732 ) ( not ( = ?auto_1160722 ?auto_1160723 ) ) ( not ( = ?auto_1160722 ?auto_1160724 ) ) ( not ( = ?auto_1160722 ?auto_1160725 ) ) ( not ( = ?auto_1160722 ?auto_1160726 ) ) ( not ( = ?auto_1160722 ?auto_1160727 ) ) ( not ( = ?auto_1160722 ?auto_1160728 ) ) ( not ( = ?auto_1160722 ?auto_1160729 ) ) ( not ( = ?auto_1160722 ?auto_1160730 ) ) ( not ( = ?auto_1160722 ?auto_1160731 ) ) ( not ( = ?auto_1160722 ?auto_1160732 ) ) ( not ( = ?auto_1160722 ?auto_1160733 ) ) ( not ( = ?auto_1160722 ?auto_1160734 ) ) ( not ( = ?auto_1160722 ?auto_1160735 ) ) ( not ( = ?auto_1160722 ?auto_1160738 ) ) ( not ( = ?auto_1160723 ?auto_1160724 ) ) ( not ( = ?auto_1160723 ?auto_1160725 ) ) ( not ( = ?auto_1160723 ?auto_1160726 ) ) ( not ( = ?auto_1160723 ?auto_1160727 ) ) ( not ( = ?auto_1160723 ?auto_1160728 ) ) ( not ( = ?auto_1160723 ?auto_1160729 ) ) ( not ( = ?auto_1160723 ?auto_1160730 ) ) ( not ( = ?auto_1160723 ?auto_1160731 ) ) ( not ( = ?auto_1160723 ?auto_1160732 ) ) ( not ( = ?auto_1160723 ?auto_1160733 ) ) ( not ( = ?auto_1160723 ?auto_1160734 ) ) ( not ( = ?auto_1160723 ?auto_1160735 ) ) ( not ( = ?auto_1160723 ?auto_1160738 ) ) ( not ( = ?auto_1160724 ?auto_1160725 ) ) ( not ( = ?auto_1160724 ?auto_1160726 ) ) ( not ( = ?auto_1160724 ?auto_1160727 ) ) ( not ( = ?auto_1160724 ?auto_1160728 ) ) ( not ( = ?auto_1160724 ?auto_1160729 ) ) ( not ( = ?auto_1160724 ?auto_1160730 ) ) ( not ( = ?auto_1160724 ?auto_1160731 ) ) ( not ( = ?auto_1160724 ?auto_1160732 ) ) ( not ( = ?auto_1160724 ?auto_1160733 ) ) ( not ( = ?auto_1160724 ?auto_1160734 ) ) ( not ( = ?auto_1160724 ?auto_1160735 ) ) ( not ( = ?auto_1160724 ?auto_1160738 ) ) ( not ( = ?auto_1160725 ?auto_1160726 ) ) ( not ( = ?auto_1160725 ?auto_1160727 ) ) ( not ( = ?auto_1160725 ?auto_1160728 ) ) ( not ( = ?auto_1160725 ?auto_1160729 ) ) ( not ( = ?auto_1160725 ?auto_1160730 ) ) ( not ( = ?auto_1160725 ?auto_1160731 ) ) ( not ( = ?auto_1160725 ?auto_1160732 ) ) ( not ( = ?auto_1160725 ?auto_1160733 ) ) ( not ( = ?auto_1160725 ?auto_1160734 ) ) ( not ( = ?auto_1160725 ?auto_1160735 ) ) ( not ( = ?auto_1160725 ?auto_1160738 ) ) ( not ( = ?auto_1160726 ?auto_1160727 ) ) ( not ( = ?auto_1160726 ?auto_1160728 ) ) ( not ( = ?auto_1160726 ?auto_1160729 ) ) ( not ( = ?auto_1160726 ?auto_1160730 ) ) ( not ( = ?auto_1160726 ?auto_1160731 ) ) ( not ( = ?auto_1160726 ?auto_1160732 ) ) ( not ( = ?auto_1160726 ?auto_1160733 ) ) ( not ( = ?auto_1160726 ?auto_1160734 ) ) ( not ( = ?auto_1160726 ?auto_1160735 ) ) ( not ( = ?auto_1160726 ?auto_1160738 ) ) ( not ( = ?auto_1160727 ?auto_1160728 ) ) ( not ( = ?auto_1160727 ?auto_1160729 ) ) ( not ( = ?auto_1160727 ?auto_1160730 ) ) ( not ( = ?auto_1160727 ?auto_1160731 ) ) ( not ( = ?auto_1160727 ?auto_1160732 ) ) ( not ( = ?auto_1160727 ?auto_1160733 ) ) ( not ( = ?auto_1160727 ?auto_1160734 ) ) ( not ( = ?auto_1160727 ?auto_1160735 ) ) ( not ( = ?auto_1160727 ?auto_1160738 ) ) ( not ( = ?auto_1160728 ?auto_1160729 ) ) ( not ( = ?auto_1160728 ?auto_1160730 ) ) ( not ( = ?auto_1160728 ?auto_1160731 ) ) ( not ( = ?auto_1160728 ?auto_1160732 ) ) ( not ( = ?auto_1160728 ?auto_1160733 ) ) ( not ( = ?auto_1160728 ?auto_1160734 ) ) ( not ( = ?auto_1160728 ?auto_1160735 ) ) ( not ( = ?auto_1160728 ?auto_1160738 ) ) ( not ( = ?auto_1160729 ?auto_1160730 ) ) ( not ( = ?auto_1160729 ?auto_1160731 ) ) ( not ( = ?auto_1160729 ?auto_1160732 ) ) ( not ( = ?auto_1160729 ?auto_1160733 ) ) ( not ( = ?auto_1160729 ?auto_1160734 ) ) ( not ( = ?auto_1160729 ?auto_1160735 ) ) ( not ( = ?auto_1160729 ?auto_1160738 ) ) ( not ( = ?auto_1160730 ?auto_1160731 ) ) ( not ( = ?auto_1160730 ?auto_1160732 ) ) ( not ( = ?auto_1160730 ?auto_1160733 ) ) ( not ( = ?auto_1160730 ?auto_1160734 ) ) ( not ( = ?auto_1160730 ?auto_1160735 ) ) ( not ( = ?auto_1160730 ?auto_1160738 ) ) ( not ( = ?auto_1160731 ?auto_1160732 ) ) ( not ( = ?auto_1160731 ?auto_1160733 ) ) ( not ( = ?auto_1160731 ?auto_1160734 ) ) ( not ( = ?auto_1160731 ?auto_1160735 ) ) ( not ( = ?auto_1160731 ?auto_1160738 ) ) ( not ( = ?auto_1160732 ?auto_1160733 ) ) ( not ( = ?auto_1160732 ?auto_1160734 ) ) ( not ( = ?auto_1160732 ?auto_1160735 ) ) ( not ( = ?auto_1160732 ?auto_1160738 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1160733 ?auto_1160734 ?auto_1160735 )
      ( MAKE-13CRATE-VERIFY ?auto_1160722 ?auto_1160723 ?auto_1160724 ?auto_1160725 ?auto_1160726 ?auto_1160727 ?auto_1160728 ?auto_1160729 ?auto_1160730 ?auto_1160731 ?auto_1160732 ?auto_1160733 ?auto_1160734 ?auto_1160735 ) )
  )

)

