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

  ( :method MAKE-14CRATE-VERIFY
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
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1173822 - SURFACE
      ?auto_1173823 - SURFACE
    )
    :vars
    (
      ?auto_1173824 - HOIST
      ?auto_1173825 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173824 ?auto_1173825 ) ( SURFACE-AT ?auto_1173822 ?auto_1173825 ) ( CLEAR ?auto_1173822 ) ( LIFTING ?auto_1173824 ?auto_1173823 ) ( IS-CRATE ?auto_1173823 ) ( not ( = ?auto_1173822 ?auto_1173823 ) ) )
    :subtasks
    ( ( !DROP ?auto_1173824 ?auto_1173823 ?auto_1173822 ?auto_1173825 )
      ( MAKE-1CRATE-VERIFY ?auto_1173822 ?auto_1173823 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1173826 - SURFACE
      ?auto_1173827 - SURFACE
    )
    :vars
    (
      ?auto_1173829 - HOIST
      ?auto_1173828 - PLACE
      ?auto_1173830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173829 ?auto_1173828 ) ( SURFACE-AT ?auto_1173826 ?auto_1173828 ) ( CLEAR ?auto_1173826 ) ( IS-CRATE ?auto_1173827 ) ( not ( = ?auto_1173826 ?auto_1173827 ) ) ( TRUCK-AT ?auto_1173830 ?auto_1173828 ) ( AVAILABLE ?auto_1173829 ) ( IN ?auto_1173827 ?auto_1173830 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1173829 ?auto_1173827 ?auto_1173830 ?auto_1173828 )
      ( MAKE-1CRATE ?auto_1173826 ?auto_1173827 )
      ( MAKE-1CRATE-VERIFY ?auto_1173826 ?auto_1173827 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1173831 - SURFACE
      ?auto_1173832 - SURFACE
    )
    :vars
    (
      ?auto_1173834 - HOIST
      ?auto_1173835 - PLACE
      ?auto_1173833 - TRUCK
      ?auto_1173836 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173834 ?auto_1173835 ) ( SURFACE-AT ?auto_1173831 ?auto_1173835 ) ( CLEAR ?auto_1173831 ) ( IS-CRATE ?auto_1173832 ) ( not ( = ?auto_1173831 ?auto_1173832 ) ) ( AVAILABLE ?auto_1173834 ) ( IN ?auto_1173832 ?auto_1173833 ) ( TRUCK-AT ?auto_1173833 ?auto_1173836 ) ( not ( = ?auto_1173836 ?auto_1173835 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1173833 ?auto_1173836 ?auto_1173835 )
      ( MAKE-1CRATE ?auto_1173831 ?auto_1173832 )
      ( MAKE-1CRATE-VERIFY ?auto_1173831 ?auto_1173832 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1173837 - SURFACE
      ?auto_1173838 - SURFACE
    )
    :vars
    (
      ?auto_1173842 - HOIST
      ?auto_1173840 - PLACE
      ?auto_1173841 - TRUCK
      ?auto_1173839 - PLACE
      ?auto_1173843 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173842 ?auto_1173840 ) ( SURFACE-AT ?auto_1173837 ?auto_1173840 ) ( CLEAR ?auto_1173837 ) ( IS-CRATE ?auto_1173838 ) ( not ( = ?auto_1173837 ?auto_1173838 ) ) ( AVAILABLE ?auto_1173842 ) ( TRUCK-AT ?auto_1173841 ?auto_1173839 ) ( not ( = ?auto_1173839 ?auto_1173840 ) ) ( HOIST-AT ?auto_1173843 ?auto_1173839 ) ( LIFTING ?auto_1173843 ?auto_1173838 ) ( not ( = ?auto_1173842 ?auto_1173843 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1173843 ?auto_1173838 ?auto_1173841 ?auto_1173839 )
      ( MAKE-1CRATE ?auto_1173837 ?auto_1173838 )
      ( MAKE-1CRATE-VERIFY ?auto_1173837 ?auto_1173838 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1173844 - SURFACE
      ?auto_1173845 - SURFACE
    )
    :vars
    (
      ?auto_1173849 - HOIST
      ?auto_1173848 - PLACE
      ?auto_1173850 - TRUCK
      ?auto_1173846 - PLACE
      ?auto_1173847 - HOIST
      ?auto_1173851 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173849 ?auto_1173848 ) ( SURFACE-AT ?auto_1173844 ?auto_1173848 ) ( CLEAR ?auto_1173844 ) ( IS-CRATE ?auto_1173845 ) ( not ( = ?auto_1173844 ?auto_1173845 ) ) ( AVAILABLE ?auto_1173849 ) ( TRUCK-AT ?auto_1173850 ?auto_1173846 ) ( not ( = ?auto_1173846 ?auto_1173848 ) ) ( HOIST-AT ?auto_1173847 ?auto_1173846 ) ( not ( = ?auto_1173849 ?auto_1173847 ) ) ( AVAILABLE ?auto_1173847 ) ( SURFACE-AT ?auto_1173845 ?auto_1173846 ) ( ON ?auto_1173845 ?auto_1173851 ) ( CLEAR ?auto_1173845 ) ( not ( = ?auto_1173844 ?auto_1173851 ) ) ( not ( = ?auto_1173845 ?auto_1173851 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1173847 ?auto_1173845 ?auto_1173851 ?auto_1173846 )
      ( MAKE-1CRATE ?auto_1173844 ?auto_1173845 )
      ( MAKE-1CRATE-VERIFY ?auto_1173844 ?auto_1173845 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1173852 - SURFACE
      ?auto_1173853 - SURFACE
    )
    :vars
    (
      ?auto_1173859 - HOIST
      ?auto_1173858 - PLACE
      ?auto_1173854 - PLACE
      ?auto_1173857 - HOIST
      ?auto_1173855 - SURFACE
      ?auto_1173856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173859 ?auto_1173858 ) ( SURFACE-AT ?auto_1173852 ?auto_1173858 ) ( CLEAR ?auto_1173852 ) ( IS-CRATE ?auto_1173853 ) ( not ( = ?auto_1173852 ?auto_1173853 ) ) ( AVAILABLE ?auto_1173859 ) ( not ( = ?auto_1173854 ?auto_1173858 ) ) ( HOIST-AT ?auto_1173857 ?auto_1173854 ) ( not ( = ?auto_1173859 ?auto_1173857 ) ) ( AVAILABLE ?auto_1173857 ) ( SURFACE-AT ?auto_1173853 ?auto_1173854 ) ( ON ?auto_1173853 ?auto_1173855 ) ( CLEAR ?auto_1173853 ) ( not ( = ?auto_1173852 ?auto_1173855 ) ) ( not ( = ?auto_1173853 ?auto_1173855 ) ) ( TRUCK-AT ?auto_1173856 ?auto_1173858 ) )
    :subtasks
    ( ( !DRIVE ?auto_1173856 ?auto_1173858 ?auto_1173854 )
      ( MAKE-1CRATE ?auto_1173852 ?auto_1173853 )
      ( MAKE-1CRATE-VERIFY ?auto_1173852 ?auto_1173853 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1173869 - SURFACE
      ?auto_1173870 - SURFACE
      ?auto_1173871 - SURFACE
    )
    :vars
    (
      ?auto_1173873 - HOIST
      ?auto_1173872 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173873 ?auto_1173872 ) ( SURFACE-AT ?auto_1173870 ?auto_1173872 ) ( CLEAR ?auto_1173870 ) ( LIFTING ?auto_1173873 ?auto_1173871 ) ( IS-CRATE ?auto_1173871 ) ( not ( = ?auto_1173870 ?auto_1173871 ) ) ( ON ?auto_1173870 ?auto_1173869 ) ( not ( = ?auto_1173869 ?auto_1173870 ) ) ( not ( = ?auto_1173869 ?auto_1173871 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1173870 ?auto_1173871 )
      ( MAKE-2CRATE-VERIFY ?auto_1173869 ?auto_1173870 ?auto_1173871 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1173879 - SURFACE
      ?auto_1173880 - SURFACE
      ?auto_1173881 - SURFACE
    )
    :vars
    (
      ?auto_1173883 - HOIST
      ?auto_1173882 - PLACE
      ?auto_1173884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173883 ?auto_1173882 ) ( SURFACE-AT ?auto_1173880 ?auto_1173882 ) ( CLEAR ?auto_1173880 ) ( IS-CRATE ?auto_1173881 ) ( not ( = ?auto_1173880 ?auto_1173881 ) ) ( TRUCK-AT ?auto_1173884 ?auto_1173882 ) ( AVAILABLE ?auto_1173883 ) ( IN ?auto_1173881 ?auto_1173884 ) ( ON ?auto_1173880 ?auto_1173879 ) ( not ( = ?auto_1173879 ?auto_1173880 ) ) ( not ( = ?auto_1173879 ?auto_1173881 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1173880 ?auto_1173881 )
      ( MAKE-2CRATE-VERIFY ?auto_1173879 ?auto_1173880 ?auto_1173881 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1173885 - SURFACE
      ?auto_1173886 - SURFACE
    )
    :vars
    (
      ?auto_1173890 - HOIST
      ?auto_1173887 - PLACE
      ?auto_1173888 - TRUCK
      ?auto_1173889 - SURFACE
      ?auto_1173891 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173890 ?auto_1173887 ) ( SURFACE-AT ?auto_1173885 ?auto_1173887 ) ( CLEAR ?auto_1173885 ) ( IS-CRATE ?auto_1173886 ) ( not ( = ?auto_1173885 ?auto_1173886 ) ) ( AVAILABLE ?auto_1173890 ) ( IN ?auto_1173886 ?auto_1173888 ) ( ON ?auto_1173885 ?auto_1173889 ) ( not ( = ?auto_1173889 ?auto_1173885 ) ) ( not ( = ?auto_1173889 ?auto_1173886 ) ) ( TRUCK-AT ?auto_1173888 ?auto_1173891 ) ( not ( = ?auto_1173891 ?auto_1173887 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1173888 ?auto_1173891 ?auto_1173887 )
      ( MAKE-2CRATE ?auto_1173889 ?auto_1173885 ?auto_1173886 )
      ( MAKE-1CRATE-VERIFY ?auto_1173885 ?auto_1173886 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1173892 - SURFACE
      ?auto_1173893 - SURFACE
      ?auto_1173894 - SURFACE
    )
    :vars
    (
      ?auto_1173896 - HOIST
      ?auto_1173895 - PLACE
      ?auto_1173897 - TRUCK
      ?auto_1173898 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173896 ?auto_1173895 ) ( SURFACE-AT ?auto_1173893 ?auto_1173895 ) ( CLEAR ?auto_1173893 ) ( IS-CRATE ?auto_1173894 ) ( not ( = ?auto_1173893 ?auto_1173894 ) ) ( AVAILABLE ?auto_1173896 ) ( IN ?auto_1173894 ?auto_1173897 ) ( ON ?auto_1173893 ?auto_1173892 ) ( not ( = ?auto_1173892 ?auto_1173893 ) ) ( not ( = ?auto_1173892 ?auto_1173894 ) ) ( TRUCK-AT ?auto_1173897 ?auto_1173898 ) ( not ( = ?auto_1173898 ?auto_1173895 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1173893 ?auto_1173894 )
      ( MAKE-2CRATE-VERIFY ?auto_1173892 ?auto_1173893 ?auto_1173894 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1173899 - SURFACE
      ?auto_1173900 - SURFACE
    )
    :vars
    (
      ?auto_1173903 - HOIST
      ?auto_1173904 - PLACE
      ?auto_1173902 - SURFACE
      ?auto_1173901 - TRUCK
      ?auto_1173905 - PLACE
      ?auto_1173906 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173903 ?auto_1173904 ) ( SURFACE-AT ?auto_1173899 ?auto_1173904 ) ( CLEAR ?auto_1173899 ) ( IS-CRATE ?auto_1173900 ) ( not ( = ?auto_1173899 ?auto_1173900 ) ) ( AVAILABLE ?auto_1173903 ) ( ON ?auto_1173899 ?auto_1173902 ) ( not ( = ?auto_1173902 ?auto_1173899 ) ) ( not ( = ?auto_1173902 ?auto_1173900 ) ) ( TRUCK-AT ?auto_1173901 ?auto_1173905 ) ( not ( = ?auto_1173905 ?auto_1173904 ) ) ( HOIST-AT ?auto_1173906 ?auto_1173905 ) ( LIFTING ?auto_1173906 ?auto_1173900 ) ( not ( = ?auto_1173903 ?auto_1173906 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1173906 ?auto_1173900 ?auto_1173901 ?auto_1173905 )
      ( MAKE-2CRATE ?auto_1173902 ?auto_1173899 ?auto_1173900 )
      ( MAKE-1CRATE-VERIFY ?auto_1173899 ?auto_1173900 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1173907 - SURFACE
      ?auto_1173908 - SURFACE
      ?auto_1173909 - SURFACE
    )
    :vars
    (
      ?auto_1173911 - HOIST
      ?auto_1173914 - PLACE
      ?auto_1173913 - TRUCK
      ?auto_1173910 - PLACE
      ?auto_1173912 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173911 ?auto_1173914 ) ( SURFACE-AT ?auto_1173908 ?auto_1173914 ) ( CLEAR ?auto_1173908 ) ( IS-CRATE ?auto_1173909 ) ( not ( = ?auto_1173908 ?auto_1173909 ) ) ( AVAILABLE ?auto_1173911 ) ( ON ?auto_1173908 ?auto_1173907 ) ( not ( = ?auto_1173907 ?auto_1173908 ) ) ( not ( = ?auto_1173907 ?auto_1173909 ) ) ( TRUCK-AT ?auto_1173913 ?auto_1173910 ) ( not ( = ?auto_1173910 ?auto_1173914 ) ) ( HOIST-AT ?auto_1173912 ?auto_1173910 ) ( LIFTING ?auto_1173912 ?auto_1173909 ) ( not ( = ?auto_1173911 ?auto_1173912 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1173908 ?auto_1173909 )
      ( MAKE-2CRATE-VERIFY ?auto_1173907 ?auto_1173908 ?auto_1173909 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1173915 - SURFACE
      ?auto_1173916 - SURFACE
    )
    :vars
    (
      ?auto_1173920 - HOIST
      ?auto_1173917 - PLACE
      ?auto_1173918 - SURFACE
      ?auto_1173922 - TRUCK
      ?auto_1173919 - PLACE
      ?auto_1173921 - HOIST
      ?auto_1173923 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173920 ?auto_1173917 ) ( SURFACE-AT ?auto_1173915 ?auto_1173917 ) ( CLEAR ?auto_1173915 ) ( IS-CRATE ?auto_1173916 ) ( not ( = ?auto_1173915 ?auto_1173916 ) ) ( AVAILABLE ?auto_1173920 ) ( ON ?auto_1173915 ?auto_1173918 ) ( not ( = ?auto_1173918 ?auto_1173915 ) ) ( not ( = ?auto_1173918 ?auto_1173916 ) ) ( TRUCK-AT ?auto_1173922 ?auto_1173919 ) ( not ( = ?auto_1173919 ?auto_1173917 ) ) ( HOIST-AT ?auto_1173921 ?auto_1173919 ) ( not ( = ?auto_1173920 ?auto_1173921 ) ) ( AVAILABLE ?auto_1173921 ) ( SURFACE-AT ?auto_1173916 ?auto_1173919 ) ( ON ?auto_1173916 ?auto_1173923 ) ( CLEAR ?auto_1173916 ) ( not ( = ?auto_1173915 ?auto_1173923 ) ) ( not ( = ?auto_1173916 ?auto_1173923 ) ) ( not ( = ?auto_1173918 ?auto_1173923 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1173921 ?auto_1173916 ?auto_1173923 ?auto_1173919 )
      ( MAKE-2CRATE ?auto_1173918 ?auto_1173915 ?auto_1173916 )
      ( MAKE-1CRATE-VERIFY ?auto_1173915 ?auto_1173916 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1173924 - SURFACE
      ?auto_1173925 - SURFACE
      ?auto_1173926 - SURFACE
    )
    :vars
    (
      ?auto_1173928 - HOIST
      ?auto_1173932 - PLACE
      ?auto_1173930 - TRUCK
      ?auto_1173927 - PLACE
      ?auto_1173929 - HOIST
      ?auto_1173931 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173928 ?auto_1173932 ) ( SURFACE-AT ?auto_1173925 ?auto_1173932 ) ( CLEAR ?auto_1173925 ) ( IS-CRATE ?auto_1173926 ) ( not ( = ?auto_1173925 ?auto_1173926 ) ) ( AVAILABLE ?auto_1173928 ) ( ON ?auto_1173925 ?auto_1173924 ) ( not ( = ?auto_1173924 ?auto_1173925 ) ) ( not ( = ?auto_1173924 ?auto_1173926 ) ) ( TRUCK-AT ?auto_1173930 ?auto_1173927 ) ( not ( = ?auto_1173927 ?auto_1173932 ) ) ( HOIST-AT ?auto_1173929 ?auto_1173927 ) ( not ( = ?auto_1173928 ?auto_1173929 ) ) ( AVAILABLE ?auto_1173929 ) ( SURFACE-AT ?auto_1173926 ?auto_1173927 ) ( ON ?auto_1173926 ?auto_1173931 ) ( CLEAR ?auto_1173926 ) ( not ( = ?auto_1173925 ?auto_1173931 ) ) ( not ( = ?auto_1173926 ?auto_1173931 ) ) ( not ( = ?auto_1173924 ?auto_1173931 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1173925 ?auto_1173926 )
      ( MAKE-2CRATE-VERIFY ?auto_1173924 ?auto_1173925 ?auto_1173926 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1173933 - SURFACE
      ?auto_1173934 - SURFACE
    )
    :vars
    (
      ?auto_1173936 - HOIST
      ?auto_1173939 - PLACE
      ?auto_1173935 - SURFACE
      ?auto_1173941 - PLACE
      ?auto_1173938 - HOIST
      ?auto_1173937 - SURFACE
      ?auto_1173940 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173936 ?auto_1173939 ) ( SURFACE-AT ?auto_1173933 ?auto_1173939 ) ( CLEAR ?auto_1173933 ) ( IS-CRATE ?auto_1173934 ) ( not ( = ?auto_1173933 ?auto_1173934 ) ) ( AVAILABLE ?auto_1173936 ) ( ON ?auto_1173933 ?auto_1173935 ) ( not ( = ?auto_1173935 ?auto_1173933 ) ) ( not ( = ?auto_1173935 ?auto_1173934 ) ) ( not ( = ?auto_1173941 ?auto_1173939 ) ) ( HOIST-AT ?auto_1173938 ?auto_1173941 ) ( not ( = ?auto_1173936 ?auto_1173938 ) ) ( AVAILABLE ?auto_1173938 ) ( SURFACE-AT ?auto_1173934 ?auto_1173941 ) ( ON ?auto_1173934 ?auto_1173937 ) ( CLEAR ?auto_1173934 ) ( not ( = ?auto_1173933 ?auto_1173937 ) ) ( not ( = ?auto_1173934 ?auto_1173937 ) ) ( not ( = ?auto_1173935 ?auto_1173937 ) ) ( TRUCK-AT ?auto_1173940 ?auto_1173939 ) )
    :subtasks
    ( ( !DRIVE ?auto_1173940 ?auto_1173939 ?auto_1173941 )
      ( MAKE-2CRATE ?auto_1173935 ?auto_1173933 ?auto_1173934 )
      ( MAKE-1CRATE-VERIFY ?auto_1173933 ?auto_1173934 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1173942 - SURFACE
      ?auto_1173943 - SURFACE
      ?auto_1173944 - SURFACE
    )
    :vars
    (
      ?auto_1173947 - HOIST
      ?auto_1173946 - PLACE
      ?auto_1173949 - PLACE
      ?auto_1173950 - HOIST
      ?auto_1173945 - SURFACE
      ?auto_1173948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173947 ?auto_1173946 ) ( SURFACE-AT ?auto_1173943 ?auto_1173946 ) ( CLEAR ?auto_1173943 ) ( IS-CRATE ?auto_1173944 ) ( not ( = ?auto_1173943 ?auto_1173944 ) ) ( AVAILABLE ?auto_1173947 ) ( ON ?auto_1173943 ?auto_1173942 ) ( not ( = ?auto_1173942 ?auto_1173943 ) ) ( not ( = ?auto_1173942 ?auto_1173944 ) ) ( not ( = ?auto_1173949 ?auto_1173946 ) ) ( HOIST-AT ?auto_1173950 ?auto_1173949 ) ( not ( = ?auto_1173947 ?auto_1173950 ) ) ( AVAILABLE ?auto_1173950 ) ( SURFACE-AT ?auto_1173944 ?auto_1173949 ) ( ON ?auto_1173944 ?auto_1173945 ) ( CLEAR ?auto_1173944 ) ( not ( = ?auto_1173943 ?auto_1173945 ) ) ( not ( = ?auto_1173944 ?auto_1173945 ) ) ( not ( = ?auto_1173942 ?auto_1173945 ) ) ( TRUCK-AT ?auto_1173948 ?auto_1173946 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1173943 ?auto_1173944 )
      ( MAKE-2CRATE-VERIFY ?auto_1173942 ?auto_1173943 ?auto_1173944 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1173951 - SURFACE
      ?auto_1173952 - SURFACE
    )
    :vars
    (
      ?auto_1173959 - HOIST
      ?auto_1173954 - PLACE
      ?auto_1173956 - SURFACE
      ?auto_1173957 - PLACE
      ?auto_1173953 - HOIST
      ?auto_1173955 - SURFACE
      ?auto_1173958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173959 ?auto_1173954 ) ( IS-CRATE ?auto_1173952 ) ( not ( = ?auto_1173951 ?auto_1173952 ) ) ( not ( = ?auto_1173956 ?auto_1173951 ) ) ( not ( = ?auto_1173956 ?auto_1173952 ) ) ( not ( = ?auto_1173957 ?auto_1173954 ) ) ( HOIST-AT ?auto_1173953 ?auto_1173957 ) ( not ( = ?auto_1173959 ?auto_1173953 ) ) ( AVAILABLE ?auto_1173953 ) ( SURFACE-AT ?auto_1173952 ?auto_1173957 ) ( ON ?auto_1173952 ?auto_1173955 ) ( CLEAR ?auto_1173952 ) ( not ( = ?auto_1173951 ?auto_1173955 ) ) ( not ( = ?auto_1173952 ?auto_1173955 ) ) ( not ( = ?auto_1173956 ?auto_1173955 ) ) ( TRUCK-AT ?auto_1173958 ?auto_1173954 ) ( SURFACE-AT ?auto_1173956 ?auto_1173954 ) ( CLEAR ?auto_1173956 ) ( LIFTING ?auto_1173959 ?auto_1173951 ) ( IS-CRATE ?auto_1173951 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1173956 ?auto_1173951 )
      ( MAKE-2CRATE ?auto_1173956 ?auto_1173951 ?auto_1173952 )
      ( MAKE-1CRATE-VERIFY ?auto_1173951 ?auto_1173952 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1173960 - SURFACE
      ?auto_1173961 - SURFACE
      ?auto_1173962 - SURFACE
    )
    :vars
    (
      ?auto_1173965 - HOIST
      ?auto_1173964 - PLACE
      ?auto_1173968 - PLACE
      ?auto_1173966 - HOIST
      ?auto_1173967 - SURFACE
      ?auto_1173963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173965 ?auto_1173964 ) ( IS-CRATE ?auto_1173962 ) ( not ( = ?auto_1173961 ?auto_1173962 ) ) ( not ( = ?auto_1173960 ?auto_1173961 ) ) ( not ( = ?auto_1173960 ?auto_1173962 ) ) ( not ( = ?auto_1173968 ?auto_1173964 ) ) ( HOIST-AT ?auto_1173966 ?auto_1173968 ) ( not ( = ?auto_1173965 ?auto_1173966 ) ) ( AVAILABLE ?auto_1173966 ) ( SURFACE-AT ?auto_1173962 ?auto_1173968 ) ( ON ?auto_1173962 ?auto_1173967 ) ( CLEAR ?auto_1173962 ) ( not ( = ?auto_1173961 ?auto_1173967 ) ) ( not ( = ?auto_1173962 ?auto_1173967 ) ) ( not ( = ?auto_1173960 ?auto_1173967 ) ) ( TRUCK-AT ?auto_1173963 ?auto_1173964 ) ( SURFACE-AT ?auto_1173960 ?auto_1173964 ) ( CLEAR ?auto_1173960 ) ( LIFTING ?auto_1173965 ?auto_1173961 ) ( IS-CRATE ?auto_1173961 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1173961 ?auto_1173962 )
      ( MAKE-2CRATE-VERIFY ?auto_1173960 ?auto_1173961 ?auto_1173962 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1173969 - SURFACE
      ?auto_1173970 - SURFACE
    )
    :vars
    (
      ?auto_1173975 - HOIST
      ?auto_1173972 - PLACE
      ?auto_1173973 - SURFACE
      ?auto_1173976 - PLACE
      ?auto_1173977 - HOIST
      ?auto_1173974 - SURFACE
      ?auto_1173971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173975 ?auto_1173972 ) ( IS-CRATE ?auto_1173970 ) ( not ( = ?auto_1173969 ?auto_1173970 ) ) ( not ( = ?auto_1173973 ?auto_1173969 ) ) ( not ( = ?auto_1173973 ?auto_1173970 ) ) ( not ( = ?auto_1173976 ?auto_1173972 ) ) ( HOIST-AT ?auto_1173977 ?auto_1173976 ) ( not ( = ?auto_1173975 ?auto_1173977 ) ) ( AVAILABLE ?auto_1173977 ) ( SURFACE-AT ?auto_1173970 ?auto_1173976 ) ( ON ?auto_1173970 ?auto_1173974 ) ( CLEAR ?auto_1173970 ) ( not ( = ?auto_1173969 ?auto_1173974 ) ) ( not ( = ?auto_1173970 ?auto_1173974 ) ) ( not ( = ?auto_1173973 ?auto_1173974 ) ) ( TRUCK-AT ?auto_1173971 ?auto_1173972 ) ( SURFACE-AT ?auto_1173973 ?auto_1173972 ) ( CLEAR ?auto_1173973 ) ( IS-CRATE ?auto_1173969 ) ( AVAILABLE ?auto_1173975 ) ( IN ?auto_1173969 ?auto_1173971 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1173975 ?auto_1173969 ?auto_1173971 ?auto_1173972 )
      ( MAKE-2CRATE ?auto_1173973 ?auto_1173969 ?auto_1173970 )
      ( MAKE-1CRATE-VERIFY ?auto_1173969 ?auto_1173970 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1173978 - SURFACE
      ?auto_1173979 - SURFACE
      ?auto_1173980 - SURFACE
    )
    :vars
    (
      ?auto_1173983 - HOIST
      ?auto_1173985 - PLACE
      ?auto_1173984 - PLACE
      ?auto_1173981 - HOIST
      ?auto_1173982 - SURFACE
      ?auto_1173986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173983 ?auto_1173985 ) ( IS-CRATE ?auto_1173980 ) ( not ( = ?auto_1173979 ?auto_1173980 ) ) ( not ( = ?auto_1173978 ?auto_1173979 ) ) ( not ( = ?auto_1173978 ?auto_1173980 ) ) ( not ( = ?auto_1173984 ?auto_1173985 ) ) ( HOIST-AT ?auto_1173981 ?auto_1173984 ) ( not ( = ?auto_1173983 ?auto_1173981 ) ) ( AVAILABLE ?auto_1173981 ) ( SURFACE-AT ?auto_1173980 ?auto_1173984 ) ( ON ?auto_1173980 ?auto_1173982 ) ( CLEAR ?auto_1173980 ) ( not ( = ?auto_1173979 ?auto_1173982 ) ) ( not ( = ?auto_1173980 ?auto_1173982 ) ) ( not ( = ?auto_1173978 ?auto_1173982 ) ) ( TRUCK-AT ?auto_1173986 ?auto_1173985 ) ( SURFACE-AT ?auto_1173978 ?auto_1173985 ) ( CLEAR ?auto_1173978 ) ( IS-CRATE ?auto_1173979 ) ( AVAILABLE ?auto_1173983 ) ( IN ?auto_1173979 ?auto_1173986 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1173979 ?auto_1173980 )
      ( MAKE-2CRATE-VERIFY ?auto_1173978 ?auto_1173979 ?auto_1173980 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174023 - SURFACE
      ?auto_1174024 - SURFACE
    )
    :vars
    (
      ?auto_1174028 - HOIST
      ?auto_1174027 - PLACE
      ?auto_1174026 - SURFACE
      ?auto_1174031 - PLACE
      ?auto_1174029 - HOIST
      ?auto_1174025 - SURFACE
      ?auto_1174030 - TRUCK
      ?auto_1174032 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174028 ?auto_1174027 ) ( SURFACE-AT ?auto_1174023 ?auto_1174027 ) ( CLEAR ?auto_1174023 ) ( IS-CRATE ?auto_1174024 ) ( not ( = ?auto_1174023 ?auto_1174024 ) ) ( AVAILABLE ?auto_1174028 ) ( ON ?auto_1174023 ?auto_1174026 ) ( not ( = ?auto_1174026 ?auto_1174023 ) ) ( not ( = ?auto_1174026 ?auto_1174024 ) ) ( not ( = ?auto_1174031 ?auto_1174027 ) ) ( HOIST-AT ?auto_1174029 ?auto_1174031 ) ( not ( = ?auto_1174028 ?auto_1174029 ) ) ( AVAILABLE ?auto_1174029 ) ( SURFACE-AT ?auto_1174024 ?auto_1174031 ) ( ON ?auto_1174024 ?auto_1174025 ) ( CLEAR ?auto_1174024 ) ( not ( = ?auto_1174023 ?auto_1174025 ) ) ( not ( = ?auto_1174024 ?auto_1174025 ) ) ( not ( = ?auto_1174026 ?auto_1174025 ) ) ( TRUCK-AT ?auto_1174030 ?auto_1174032 ) ( not ( = ?auto_1174032 ?auto_1174027 ) ) ( not ( = ?auto_1174031 ?auto_1174032 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1174030 ?auto_1174032 ?auto_1174027 )
      ( MAKE-1CRATE ?auto_1174023 ?auto_1174024 )
      ( MAKE-1CRATE-VERIFY ?auto_1174023 ?auto_1174024 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1174062 - SURFACE
      ?auto_1174063 - SURFACE
      ?auto_1174064 - SURFACE
      ?auto_1174065 - SURFACE
    )
    :vars
    (
      ?auto_1174067 - HOIST
      ?auto_1174066 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174067 ?auto_1174066 ) ( SURFACE-AT ?auto_1174064 ?auto_1174066 ) ( CLEAR ?auto_1174064 ) ( LIFTING ?auto_1174067 ?auto_1174065 ) ( IS-CRATE ?auto_1174065 ) ( not ( = ?auto_1174064 ?auto_1174065 ) ) ( ON ?auto_1174063 ?auto_1174062 ) ( ON ?auto_1174064 ?auto_1174063 ) ( not ( = ?auto_1174062 ?auto_1174063 ) ) ( not ( = ?auto_1174062 ?auto_1174064 ) ) ( not ( = ?auto_1174062 ?auto_1174065 ) ) ( not ( = ?auto_1174063 ?auto_1174064 ) ) ( not ( = ?auto_1174063 ?auto_1174065 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174064 ?auto_1174065 )
      ( MAKE-3CRATE-VERIFY ?auto_1174062 ?auto_1174063 ?auto_1174064 ?auto_1174065 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1174079 - SURFACE
      ?auto_1174080 - SURFACE
      ?auto_1174081 - SURFACE
      ?auto_1174082 - SURFACE
    )
    :vars
    (
      ?auto_1174083 - HOIST
      ?auto_1174085 - PLACE
      ?auto_1174084 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174083 ?auto_1174085 ) ( SURFACE-AT ?auto_1174081 ?auto_1174085 ) ( CLEAR ?auto_1174081 ) ( IS-CRATE ?auto_1174082 ) ( not ( = ?auto_1174081 ?auto_1174082 ) ) ( TRUCK-AT ?auto_1174084 ?auto_1174085 ) ( AVAILABLE ?auto_1174083 ) ( IN ?auto_1174082 ?auto_1174084 ) ( ON ?auto_1174081 ?auto_1174080 ) ( not ( = ?auto_1174080 ?auto_1174081 ) ) ( not ( = ?auto_1174080 ?auto_1174082 ) ) ( ON ?auto_1174080 ?auto_1174079 ) ( not ( = ?auto_1174079 ?auto_1174080 ) ) ( not ( = ?auto_1174079 ?auto_1174081 ) ) ( not ( = ?auto_1174079 ?auto_1174082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1174080 ?auto_1174081 ?auto_1174082 )
      ( MAKE-3CRATE-VERIFY ?auto_1174079 ?auto_1174080 ?auto_1174081 ?auto_1174082 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1174100 - SURFACE
      ?auto_1174101 - SURFACE
      ?auto_1174102 - SURFACE
      ?auto_1174103 - SURFACE
    )
    :vars
    (
      ?auto_1174106 - HOIST
      ?auto_1174105 - PLACE
      ?auto_1174107 - TRUCK
      ?auto_1174104 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174106 ?auto_1174105 ) ( SURFACE-AT ?auto_1174102 ?auto_1174105 ) ( CLEAR ?auto_1174102 ) ( IS-CRATE ?auto_1174103 ) ( not ( = ?auto_1174102 ?auto_1174103 ) ) ( AVAILABLE ?auto_1174106 ) ( IN ?auto_1174103 ?auto_1174107 ) ( ON ?auto_1174102 ?auto_1174101 ) ( not ( = ?auto_1174101 ?auto_1174102 ) ) ( not ( = ?auto_1174101 ?auto_1174103 ) ) ( TRUCK-AT ?auto_1174107 ?auto_1174104 ) ( not ( = ?auto_1174104 ?auto_1174105 ) ) ( ON ?auto_1174101 ?auto_1174100 ) ( not ( = ?auto_1174100 ?auto_1174101 ) ) ( not ( = ?auto_1174100 ?auto_1174102 ) ) ( not ( = ?auto_1174100 ?auto_1174103 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1174101 ?auto_1174102 ?auto_1174103 )
      ( MAKE-3CRATE-VERIFY ?auto_1174100 ?auto_1174101 ?auto_1174102 ?auto_1174103 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1174124 - SURFACE
      ?auto_1174125 - SURFACE
      ?auto_1174126 - SURFACE
      ?auto_1174127 - SURFACE
    )
    :vars
    (
      ?auto_1174130 - HOIST
      ?auto_1174128 - PLACE
      ?auto_1174132 - TRUCK
      ?auto_1174131 - PLACE
      ?auto_1174129 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174130 ?auto_1174128 ) ( SURFACE-AT ?auto_1174126 ?auto_1174128 ) ( CLEAR ?auto_1174126 ) ( IS-CRATE ?auto_1174127 ) ( not ( = ?auto_1174126 ?auto_1174127 ) ) ( AVAILABLE ?auto_1174130 ) ( ON ?auto_1174126 ?auto_1174125 ) ( not ( = ?auto_1174125 ?auto_1174126 ) ) ( not ( = ?auto_1174125 ?auto_1174127 ) ) ( TRUCK-AT ?auto_1174132 ?auto_1174131 ) ( not ( = ?auto_1174131 ?auto_1174128 ) ) ( HOIST-AT ?auto_1174129 ?auto_1174131 ) ( LIFTING ?auto_1174129 ?auto_1174127 ) ( not ( = ?auto_1174130 ?auto_1174129 ) ) ( ON ?auto_1174125 ?auto_1174124 ) ( not ( = ?auto_1174124 ?auto_1174125 ) ) ( not ( = ?auto_1174124 ?auto_1174126 ) ) ( not ( = ?auto_1174124 ?auto_1174127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1174125 ?auto_1174126 ?auto_1174127 )
      ( MAKE-3CRATE-VERIFY ?auto_1174124 ?auto_1174125 ?auto_1174126 ?auto_1174127 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1174151 - SURFACE
      ?auto_1174152 - SURFACE
      ?auto_1174153 - SURFACE
      ?auto_1174154 - SURFACE
    )
    :vars
    (
      ?auto_1174159 - HOIST
      ?auto_1174155 - PLACE
      ?auto_1174160 - TRUCK
      ?auto_1174156 - PLACE
      ?auto_1174158 - HOIST
      ?auto_1174157 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174159 ?auto_1174155 ) ( SURFACE-AT ?auto_1174153 ?auto_1174155 ) ( CLEAR ?auto_1174153 ) ( IS-CRATE ?auto_1174154 ) ( not ( = ?auto_1174153 ?auto_1174154 ) ) ( AVAILABLE ?auto_1174159 ) ( ON ?auto_1174153 ?auto_1174152 ) ( not ( = ?auto_1174152 ?auto_1174153 ) ) ( not ( = ?auto_1174152 ?auto_1174154 ) ) ( TRUCK-AT ?auto_1174160 ?auto_1174156 ) ( not ( = ?auto_1174156 ?auto_1174155 ) ) ( HOIST-AT ?auto_1174158 ?auto_1174156 ) ( not ( = ?auto_1174159 ?auto_1174158 ) ) ( AVAILABLE ?auto_1174158 ) ( SURFACE-AT ?auto_1174154 ?auto_1174156 ) ( ON ?auto_1174154 ?auto_1174157 ) ( CLEAR ?auto_1174154 ) ( not ( = ?auto_1174153 ?auto_1174157 ) ) ( not ( = ?auto_1174154 ?auto_1174157 ) ) ( not ( = ?auto_1174152 ?auto_1174157 ) ) ( ON ?auto_1174152 ?auto_1174151 ) ( not ( = ?auto_1174151 ?auto_1174152 ) ) ( not ( = ?auto_1174151 ?auto_1174153 ) ) ( not ( = ?auto_1174151 ?auto_1174154 ) ) ( not ( = ?auto_1174151 ?auto_1174157 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1174152 ?auto_1174153 ?auto_1174154 )
      ( MAKE-3CRATE-VERIFY ?auto_1174151 ?auto_1174152 ?auto_1174153 ?auto_1174154 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1174179 - SURFACE
      ?auto_1174180 - SURFACE
      ?auto_1174181 - SURFACE
      ?auto_1174182 - SURFACE
    )
    :vars
    (
      ?auto_1174186 - HOIST
      ?auto_1174184 - PLACE
      ?auto_1174188 - PLACE
      ?auto_1174187 - HOIST
      ?auto_1174183 - SURFACE
      ?auto_1174185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174186 ?auto_1174184 ) ( SURFACE-AT ?auto_1174181 ?auto_1174184 ) ( CLEAR ?auto_1174181 ) ( IS-CRATE ?auto_1174182 ) ( not ( = ?auto_1174181 ?auto_1174182 ) ) ( AVAILABLE ?auto_1174186 ) ( ON ?auto_1174181 ?auto_1174180 ) ( not ( = ?auto_1174180 ?auto_1174181 ) ) ( not ( = ?auto_1174180 ?auto_1174182 ) ) ( not ( = ?auto_1174188 ?auto_1174184 ) ) ( HOIST-AT ?auto_1174187 ?auto_1174188 ) ( not ( = ?auto_1174186 ?auto_1174187 ) ) ( AVAILABLE ?auto_1174187 ) ( SURFACE-AT ?auto_1174182 ?auto_1174188 ) ( ON ?auto_1174182 ?auto_1174183 ) ( CLEAR ?auto_1174182 ) ( not ( = ?auto_1174181 ?auto_1174183 ) ) ( not ( = ?auto_1174182 ?auto_1174183 ) ) ( not ( = ?auto_1174180 ?auto_1174183 ) ) ( TRUCK-AT ?auto_1174185 ?auto_1174184 ) ( ON ?auto_1174180 ?auto_1174179 ) ( not ( = ?auto_1174179 ?auto_1174180 ) ) ( not ( = ?auto_1174179 ?auto_1174181 ) ) ( not ( = ?auto_1174179 ?auto_1174182 ) ) ( not ( = ?auto_1174179 ?auto_1174183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1174180 ?auto_1174181 ?auto_1174182 )
      ( MAKE-3CRATE-VERIFY ?auto_1174179 ?auto_1174180 ?auto_1174181 ?auto_1174182 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1174207 - SURFACE
      ?auto_1174208 - SURFACE
      ?auto_1174209 - SURFACE
      ?auto_1174210 - SURFACE
    )
    :vars
    (
      ?auto_1174215 - HOIST
      ?auto_1174211 - PLACE
      ?auto_1174213 - PLACE
      ?auto_1174214 - HOIST
      ?auto_1174216 - SURFACE
      ?auto_1174212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174215 ?auto_1174211 ) ( IS-CRATE ?auto_1174210 ) ( not ( = ?auto_1174209 ?auto_1174210 ) ) ( not ( = ?auto_1174208 ?auto_1174209 ) ) ( not ( = ?auto_1174208 ?auto_1174210 ) ) ( not ( = ?auto_1174213 ?auto_1174211 ) ) ( HOIST-AT ?auto_1174214 ?auto_1174213 ) ( not ( = ?auto_1174215 ?auto_1174214 ) ) ( AVAILABLE ?auto_1174214 ) ( SURFACE-AT ?auto_1174210 ?auto_1174213 ) ( ON ?auto_1174210 ?auto_1174216 ) ( CLEAR ?auto_1174210 ) ( not ( = ?auto_1174209 ?auto_1174216 ) ) ( not ( = ?auto_1174210 ?auto_1174216 ) ) ( not ( = ?auto_1174208 ?auto_1174216 ) ) ( TRUCK-AT ?auto_1174212 ?auto_1174211 ) ( SURFACE-AT ?auto_1174208 ?auto_1174211 ) ( CLEAR ?auto_1174208 ) ( LIFTING ?auto_1174215 ?auto_1174209 ) ( IS-CRATE ?auto_1174209 ) ( ON ?auto_1174208 ?auto_1174207 ) ( not ( = ?auto_1174207 ?auto_1174208 ) ) ( not ( = ?auto_1174207 ?auto_1174209 ) ) ( not ( = ?auto_1174207 ?auto_1174210 ) ) ( not ( = ?auto_1174207 ?auto_1174216 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1174208 ?auto_1174209 ?auto_1174210 )
      ( MAKE-3CRATE-VERIFY ?auto_1174207 ?auto_1174208 ?auto_1174209 ?auto_1174210 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1174235 - SURFACE
      ?auto_1174236 - SURFACE
      ?auto_1174237 - SURFACE
      ?auto_1174238 - SURFACE
    )
    :vars
    (
      ?auto_1174243 - HOIST
      ?auto_1174240 - PLACE
      ?auto_1174241 - PLACE
      ?auto_1174242 - HOIST
      ?auto_1174239 - SURFACE
      ?auto_1174244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174243 ?auto_1174240 ) ( IS-CRATE ?auto_1174238 ) ( not ( = ?auto_1174237 ?auto_1174238 ) ) ( not ( = ?auto_1174236 ?auto_1174237 ) ) ( not ( = ?auto_1174236 ?auto_1174238 ) ) ( not ( = ?auto_1174241 ?auto_1174240 ) ) ( HOIST-AT ?auto_1174242 ?auto_1174241 ) ( not ( = ?auto_1174243 ?auto_1174242 ) ) ( AVAILABLE ?auto_1174242 ) ( SURFACE-AT ?auto_1174238 ?auto_1174241 ) ( ON ?auto_1174238 ?auto_1174239 ) ( CLEAR ?auto_1174238 ) ( not ( = ?auto_1174237 ?auto_1174239 ) ) ( not ( = ?auto_1174238 ?auto_1174239 ) ) ( not ( = ?auto_1174236 ?auto_1174239 ) ) ( TRUCK-AT ?auto_1174244 ?auto_1174240 ) ( SURFACE-AT ?auto_1174236 ?auto_1174240 ) ( CLEAR ?auto_1174236 ) ( IS-CRATE ?auto_1174237 ) ( AVAILABLE ?auto_1174243 ) ( IN ?auto_1174237 ?auto_1174244 ) ( ON ?auto_1174236 ?auto_1174235 ) ( not ( = ?auto_1174235 ?auto_1174236 ) ) ( not ( = ?auto_1174235 ?auto_1174237 ) ) ( not ( = ?auto_1174235 ?auto_1174238 ) ) ( not ( = ?auto_1174235 ?auto_1174239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1174236 ?auto_1174237 ?auto_1174238 )
      ( MAKE-3CRATE-VERIFY ?auto_1174235 ?auto_1174236 ?auto_1174237 ?auto_1174238 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1174526 - SURFACE
      ?auto_1174527 - SURFACE
      ?auto_1174528 - SURFACE
      ?auto_1174530 - SURFACE
      ?auto_1174529 - SURFACE
    )
    :vars
    (
      ?auto_1174531 - HOIST
      ?auto_1174532 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174531 ?auto_1174532 ) ( SURFACE-AT ?auto_1174530 ?auto_1174532 ) ( CLEAR ?auto_1174530 ) ( LIFTING ?auto_1174531 ?auto_1174529 ) ( IS-CRATE ?auto_1174529 ) ( not ( = ?auto_1174530 ?auto_1174529 ) ) ( ON ?auto_1174527 ?auto_1174526 ) ( ON ?auto_1174528 ?auto_1174527 ) ( ON ?auto_1174530 ?auto_1174528 ) ( not ( = ?auto_1174526 ?auto_1174527 ) ) ( not ( = ?auto_1174526 ?auto_1174528 ) ) ( not ( = ?auto_1174526 ?auto_1174530 ) ) ( not ( = ?auto_1174526 ?auto_1174529 ) ) ( not ( = ?auto_1174527 ?auto_1174528 ) ) ( not ( = ?auto_1174527 ?auto_1174530 ) ) ( not ( = ?auto_1174527 ?auto_1174529 ) ) ( not ( = ?auto_1174528 ?auto_1174530 ) ) ( not ( = ?auto_1174528 ?auto_1174529 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174530 ?auto_1174529 )
      ( MAKE-4CRATE-VERIFY ?auto_1174526 ?auto_1174527 ?auto_1174528 ?auto_1174530 ?auto_1174529 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1174551 - SURFACE
      ?auto_1174552 - SURFACE
      ?auto_1174553 - SURFACE
      ?auto_1174555 - SURFACE
      ?auto_1174554 - SURFACE
    )
    :vars
    (
      ?auto_1174558 - HOIST
      ?auto_1174557 - PLACE
      ?auto_1174556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174558 ?auto_1174557 ) ( SURFACE-AT ?auto_1174555 ?auto_1174557 ) ( CLEAR ?auto_1174555 ) ( IS-CRATE ?auto_1174554 ) ( not ( = ?auto_1174555 ?auto_1174554 ) ) ( TRUCK-AT ?auto_1174556 ?auto_1174557 ) ( AVAILABLE ?auto_1174558 ) ( IN ?auto_1174554 ?auto_1174556 ) ( ON ?auto_1174555 ?auto_1174553 ) ( not ( = ?auto_1174553 ?auto_1174555 ) ) ( not ( = ?auto_1174553 ?auto_1174554 ) ) ( ON ?auto_1174552 ?auto_1174551 ) ( ON ?auto_1174553 ?auto_1174552 ) ( not ( = ?auto_1174551 ?auto_1174552 ) ) ( not ( = ?auto_1174551 ?auto_1174553 ) ) ( not ( = ?auto_1174551 ?auto_1174555 ) ) ( not ( = ?auto_1174551 ?auto_1174554 ) ) ( not ( = ?auto_1174552 ?auto_1174553 ) ) ( not ( = ?auto_1174552 ?auto_1174555 ) ) ( not ( = ?auto_1174552 ?auto_1174554 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1174553 ?auto_1174555 ?auto_1174554 )
      ( MAKE-4CRATE-VERIFY ?auto_1174551 ?auto_1174552 ?auto_1174553 ?auto_1174555 ?auto_1174554 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1174581 - SURFACE
      ?auto_1174582 - SURFACE
      ?auto_1174583 - SURFACE
      ?auto_1174585 - SURFACE
      ?auto_1174584 - SURFACE
    )
    :vars
    (
      ?auto_1174587 - HOIST
      ?auto_1174586 - PLACE
      ?auto_1174588 - TRUCK
      ?auto_1174589 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174587 ?auto_1174586 ) ( SURFACE-AT ?auto_1174585 ?auto_1174586 ) ( CLEAR ?auto_1174585 ) ( IS-CRATE ?auto_1174584 ) ( not ( = ?auto_1174585 ?auto_1174584 ) ) ( AVAILABLE ?auto_1174587 ) ( IN ?auto_1174584 ?auto_1174588 ) ( ON ?auto_1174585 ?auto_1174583 ) ( not ( = ?auto_1174583 ?auto_1174585 ) ) ( not ( = ?auto_1174583 ?auto_1174584 ) ) ( TRUCK-AT ?auto_1174588 ?auto_1174589 ) ( not ( = ?auto_1174589 ?auto_1174586 ) ) ( ON ?auto_1174582 ?auto_1174581 ) ( ON ?auto_1174583 ?auto_1174582 ) ( not ( = ?auto_1174581 ?auto_1174582 ) ) ( not ( = ?auto_1174581 ?auto_1174583 ) ) ( not ( = ?auto_1174581 ?auto_1174585 ) ) ( not ( = ?auto_1174581 ?auto_1174584 ) ) ( not ( = ?auto_1174582 ?auto_1174583 ) ) ( not ( = ?auto_1174582 ?auto_1174585 ) ) ( not ( = ?auto_1174582 ?auto_1174584 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1174583 ?auto_1174585 ?auto_1174584 )
      ( MAKE-4CRATE-VERIFY ?auto_1174581 ?auto_1174582 ?auto_1174583 ?auto_1174585 ?auto_1174584 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1174615 - SURFACE
      ?auto_1174616 - SURFACE
      ?auto_1174617 - SURFACE
      ?auto_1174619 - SURFACE
      ?auto_1174618 - SURFACE
    )
    :vars
    (
      ?auto_1174621 - HOIST
      ?auto_1174623 - PLACE
      ?auto_1174622 - TRUCK
      ?auto_1174620 - PLACE
      ?auto_1174624 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174621 ?auto_1174623 ) ( SURFACE-AT ?auto_1174619 ?auto_1174623 ) ( CLEAR ?auto_1174619 ) ( IS-CRATE ?auto_1174618 ) ( not ( = ?auto_1174619 ?auto_1174618 ) ) ( AVAILABLE ?auto_1174621 ) ( ON ?auto_1174619 ?auto_1174617 ) ( not ( = ?auto_1174617 ?auto_1174619 ) ) ( not ( = ?auto_1174617 ?auto_1174618 ) ) ( TRUCK-AT ?auto_1174622 ?auto_1174620 ) ( not ( = ?auto_1174620 ?auto_1174623 ) ) ( HOIST-AT ?auto_1174624 ?auto_1174620 ) ( LIFTING ?auto_1174624 ?auto_1174618 ) ( not ( = ?auto_1174621 ?auto_1174624 ) ) ( ON ?auto_1174616 ?auto_1174615 ) ( ON ?auto_1174617 ?auto_1174616 ) ( not ( = ?auto_1174615 ?auto_1174616 ) ) ( not ( = ?auto_1174615 ?auto_1174617 ) ) ( not ( = ?auto_1174615 ?auto_1174619 ) ) ( not ( = ?auto_1174615 ?auto_1174618 ) ) ( not ( = ?auto_1174616 ?auto_1174617 ) ) ( not ( = ?auto_1174616 ?auto_1174619 ) ) ( not ( = ?auto_1174616 ?auto_1174618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1174617 ?auto_1174619 ?auto_1174618 )
      ( MAKE-4CRATE-VERIFY ?auto_1174615 ?auto_1174616 ?auto_1174617 ?auto_1174619 ?auto_1174618 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1174653 - SURFACE
      ?auto_1174654 - SURFACE
      ?auto_1174655 - SURFACE
      ?auto_1174657 - SURFACE
      ?auto_1174656 - SURFACE
    )
    :vars
    (
      ?auto_1174663 - HOIST
      ?auto_1174662 - PLACE
      ?auto_1174658 - TRUCK
      ?auto_1174660 - PLACE
      ?auto_1174659 - HOIST
      ?auto_1174661 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174663 ?auto_1174662 ) ( SURFACE-AT ?auto_1174657 ?auto_1174662 ) ( CLEAR ?auto_1174657 ) ( IS-CRATE ?auto_1174656 ) ( not ( = ?auto_1174657 ?auto_1174656 ) ) ( AVAILABLE ?auto_1174663 ) ( ON ?auto_1174657 ?auto_1174655 ) ( not ( = ?auto_1174655 ?auto_1174657 ) ) ( not ( = ?auto_1174655 ?auto_1174656 ) ) ( TRUCK-AT ?auto_1174658 ?auto_1174660 ) ( not ( = ?auto_1174660 ?auto_1174662 ) ) ( HOIST-AT ?auto_1174659 ?auto_1174660 ) ( not ( = ?auto_1174663 ?auto_1174659 ) ) ( AVAILABLE ?auto_1174659 ) ( SURFACE-AT ?auto_1174656 ?auto_1174660 ) ( ON ?auto_1174656 ?auto_1174661 ) ( CLEAR ?auto_1174656 ) ( not ( = ?auto_1174657 ?auto_1174661 ) ) ( not ( = ?auto_1174656 ?auto_1174661 ) ) ( not ( = ?auto_1174655 ?auto_1174661 ) ) ( ON ?auto_1174654 ?auto_1174653 ) ( ON ?auto_1174655 ?auto_1174654 ) ( not ( = ?auto_1174653 ?auto_1174654 ) ) ( not ( = ?auto_1174653 ?auto_1174655 ) ) ( not ( = ?auto_1174653 ?auto_1174657 ) ) ( not ( = ?auto_1174653 ?auto_1174656 ) ) ( not ( = ?auto_1174653 ?auto_1174661 ) ) ( not ( = ?auto_1174654 ?auto_1174655 ) ) ( not ( = ?auto_1174654 ?auto_1174657 ) ) ( not ( = ?auto_1174654 ?auto_1174656 ) ) ( not ( = ?auto_1174654 ?auto_1174661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1174655 ?auto_1174657 ?auto_1174656 )
      ( MAKE-4CRATE-VERIFY ?auto_1174653 ?auto_1174654 ?auto_1174655 ?auto_1174657 ?auto_1174656 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1174692 - SURFACE
      ?auto_1174693 - SURFACE
      ?auto_1174694 - SURFACE
      ?auto_1174696 - SURFACE
      ?auto_1174695 - SURFACE
    )
    :vars
    (
      ?auto_1174700 - HOIST
      ?auto_1174701 - PLACE
      ?auto_1174699 - PLACE
      ?auto_1174702 - HOIST
      ?auto_1174698 - SURFACE
      ?auto_1174697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174700 ?auto_1174701 ) ( SURFACE-AT ?auto_1174696 ?auto_1174701 ) ( CLEAR ?auto_1174696 ) ( IS-CRATE ?auto_1174695 ) ( not ( = ?auto_1174696 ?auto_1174695 ) ) ( AVAILABLE ?auto_1174700 ) ( ON ?auto_1174696 ?auto_1174694 ) ( not ( = ?auto_1174694 ?auto_1174696 ) ) ( not ( = ?auto_1174694 ?auto_1174695 ) ) ( not ( = ?auto_1174699 ?auto_1174701 ) ) ( HOIST-AT ?auto_1174702 ?auto_1174699 ) ( not ( = ?auto_1174700 ?auto_1174702 ) ) ( AVAILABLE ?auto_1174702 ) ( SURFACE-AT ?auto_1174695 ?auto_1174699 ) ( ON ?auto_1174695 ?auto_1174698 ) ( CLEAR ?auto_1174695 ) ( not ( = ?auto_1174696 ?auto_1174698 ) ) ( not ( = ?auto_1174695 ?auto_1174698 ) ) ( not ( = ?auto_1174694 ?auto_1174698 ) ) ( TRUCK-AT ?auto_1174697 ?auto_1174701 ) ( ON ?auto_1174693 ?auto_1174692 ) ( ON ?auto_1174694 ?auto_1174693 ) ( not ( = ?auto_1174692 ?auto_1174693 ) ) ( not ( = ?auto_1174692 ?auto_1174694 ) ) ( not ( = ?auto_1174692 ?auto_1174696 ) ) ( not ( = ?auto_1174692 ?auto_1174695 ) ) ( not ( = ?auto_1174692 ?auto_1174698 ) ) ( not ( = ?auto_1174693 ?auto_1174694 ) ) ( not ( = ?auto_1174693 ?auto_1174696 ) ) ( not ( = ?auto_1174693 ?auto_1174695 ) ) ( not ( = ?auto_1174693 ?auto_1174698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1174694 ?auto_1174696 ?auto_1174695 )
      ( MAKE-4CRATE-VERIFY ?auto_1174692 ?auto_1174693 ?auto_1174694 ?auto_1174696 ?auto_1174695 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1174731 - SURFACE
      ?auto_1174732 - SURFACE
      ?auto_1174733 - SURFACE
      ?auto_1174735 - SURFACE
      ?auto_1174734 - SURFACE
    )
    :vars
    (
      ?auto_1174741 - HOIST
      ?auto_1174739 - PLACE
      ?auto_1174738 - PLACE
      ?auto_1174737 - HOIST
      ?auto_1174740 - SURFACE
      ?auto_1174736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174741 ?auto_1174739 ) ( IS-CRATE ?auto_1174734 ) ( not ( = ?auto_1174735 ?auto_1174734 ) ) ( not ( = ?auto_1174733 ?auto_1174735 ) ) ( not ( = ?auto_1174733 ?auto_1174734 ) ) ( not ( = ?auto_1174738 ?auto_1174739 ) ) ( HOIST-AT ?auto_1174737 ?auto_1174738 ) ( not ( = ?auto_1174741 ?auto_1174737 ) ) ( AVAILABLE ?auto_1174737 ) ( SURFACE-AT ?auto_1174734 ?auto_1174738 ) ( ON ?auto_1174734 ?auto_1174740 ) ( CLEAR ?auto_1174734 ) ( not ( = ?auto_1174735 ?auto_1174740 ) ) ( not ( = ?auto_1174734 ?auto_1174740 ) ) ( not ( = ?auto_1174733 ?auto_1174740 ) ) ( TRUCK-AT ?auto_1174736 ?auto_1174739 ) ( SURFACE-AT ?auto_1174733 ?auto_1174739 ) ( CLEAR ?auto_1174733 ) ( LIFTING ?auto_1174741 ?auto_1174735 ) ( IS-CRATE ?auto_1174735 ) ( ON ?auto_1174732 ?auto_1174731 ) ( ON ?auto_1174733 ?auto_1174732 ) ( not ( = ?auto_1174731 ?auto_1174732 ) ) ( not ( = ?auto_1174731 ?auto_1174733 ) ) ( not ( = ?auto_1174731 ?auto_1174735 ) ) ( not ( = ?auto_1174731 ?auto_1174734 ) ) ( not ( = ?auto_1174731 ?auto_1174740 ) ) ( not ( = ?auto_1174732 ?auto_1174733 ) ) ( not ( = ?auto_1174732 ?auto_1174735 ) ) ( not ( = ?auto_1174732 ?auto_1174734 ) ) ( not ( = ?auto_1174732 ?auto_1174740 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1174733 ?auto_1174735 ?auto_1174734 )
      ( MAKE-4CRATE-VERIFY ?auto_1174731 ?auto_1174732 ?auto_1174733 ?auto_1174735 ?auto_1174734 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1174770 - SURFACE
      ?auto_1174771 - SURFACE
      ?auto_1174772 - SURFACE
      ?auto_1174774 - SURFACE
      ?auto_1174773 - SURFACE
    )
    :vars
    (
      ?auto_1174780 - HOIST
      ?auto_1174775 - PLACE
      ?auto_1174778 - PLACE
      ?auto_1174776 - HOIST
      ?auto_1174777 - SURFACE
      ?auto_1174779 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174780 ?auto_1174775 ) ( IS-CRATE ?auto_1174773 ) ( not ( = ?auto_1174774 ?auto_1174773 ) ) ( not ( = ?auto_1174772 ?auto_1174774 ) ) ( not ( = ?auto_1174772 ?auto_1174773 ) ) ( not ( = ?auto_1174778 ?auto_1174775 ) ) ( HOIST-AT ?auto_1174776 ?auto_1174778 ) ( not ( = ?auto_1174780 ?auto_1174776 ) ) ( AVAILABLE ?auto_1174776 ) ( SURFACE-AT ?auto_1174773 ?auto_1174778 ) ( ON ?auto_1174773 ?auto_1174777 ) ( CLEAR ?auto_1174773 ) ( not ( = ?auto_1174774 ?auto_1174777 ) ) ( not ( = ?auto_1174773 ?auto_1174777 ) ) ( not ( = ?auto_1174772 ?auto_1174777 ) ) ( TRUCK-AT ?auto_1174779 ?auto_1174775 ) ( SURFACE-AT ?auto_1174772 ?auto_1174775 ) ( CLEAR ?auto_1174772 ) ( IS-CRATE ?auto_1174774 ) ( AVAILABLE ?auto_1174780 ) ( IN ?auto_1174774 ?auto_1174779 ) ( ON ?auto_1174771 ?auto_1174770 ) ( ON ?auto_1174772 ?auto_1174771 ) ( not ( = ?auto_1174770 ?auto_1174771 ) ) ( not ( = ?auto_1174770 ?auto_1174772 ) ) ( not ( = ?auto_1174770 ?auto_1174774 ) ) ( not ( = ?auto_1174770 ?auto_1174773 ) ) ( not ( = ?auto_1174770 ?auto_1174777 ) ) ( not ( = ?auto_1174771 ?auto_1174772 ) ) ( not ( = ?auto_1174771 ?auto_1174774 ) ) ( not ( = ?auto_1174771 ?auto_1174773 ) ) ( not ( = ?auto_1174771 ?auto_1174777 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1174772 ?auto_1174774 ?auto_1174773 )
      ( MAKE-4CRATE-VERIFY ?auto_1174770 ?auto_1174771 ?auto_1174772 ?auto_1174774 ?auto_1174773 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1175430 - SURFACE
      ?auto_1175431 - SURFACE
      ?auto_1175432 - SURFACE
      ?auto_1175434 - SURFACE
      ?auto_1175433 - SURFACE
      ?auto_1175435 - SURFACE
    )
    :vars
    (
      ?auto_1175436 - HOIST
      ?auto_1175437 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175436 ?auto_1175437 ) ( SURFACE-AT ?auto_1175433 ?auto_1175437 ) ( CLEAR ?auto_1175433 ) ( LIFTING ?auto_1175436 ?auto_1175435 ) ( IS-CRATE ?auto_1175435 ) ( not ( = ?auto_1175433 ?auto_1175435 ) ) ( ON ?auto_1175431 ?auto_1175430 ) ( ON ?auto_1175432 ?auto_1175431 ) ( ON ?auto_1175434 ?auto_1175432 ) ( ON ?auto_1175433 ?auto_1175434 ) ( not ( = ?auto_1175430 ?auto_1175431 ) ) ( not ( = ?auto_1175430 ?auto_1175432 ) ) ( not ( = ?auto_1175430 ?auto_1175434 ) ) ( not ( = ?auto_1175430 ?auto_1175433 ) ) ( not ( = ?auto_1175430 ?auto_1175435 ) ) ( not ( = ?auto_1175431 ?auto_1175432 ) ) ( not ( = ?auto_1175431 ?auto_1175434 ) ) ( not ( = ?auto_1175431 ?auto_1175433 ) ) ( not ( = ?auto_1175431 ?auto_1175435 ) ) ( not ( = ?auto_1175432 ?auto_1175434 ) ) ( not ( = ?auto_1175432 ?auto_1175433 ) ) ( not ( = ?auto_1175432 ?auto_1175435 ) ) ( not ( = ?auto_1175434 ?auto_1175433 ) ) ( not ( = ?auto_1175434 ?auto_1175435 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1175433 ?auto_1175435 )
      ( MAKE-5CRATE-VERIFY ?auto_1175430 ?auto_1175431 ?auto_1175432 ?auto_1175434 ?auto_1175433 ?auto_1175435 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1175464 - SURFACE
      ?auto_1175465 - SURFACE
      ?auto_1175466 - SURFACE
      ?auto_1175468 - SURFACE
      ?auto_1175467 - SURFACE
      ?auto_1175469 - SURFACE
    )
    :vars
    (
      ?auto_1175470 - HOIST
      ?auto_1175471 - PLACE
      ?auto_1175472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175470 ?auto_1175471 ) ( SURFACE-AT ?auto_1175467 ?auto_1175471 ) ( CLEAR ?auto_1175467 ) ( IS-CRATE ?auto_1175469 ) ( not ( = ?auto_1175467 ?auto_1175469 ) ) ( TRUCK-AT ?auto_1175472 ?auto_1175471 ) ( AVAILABLE ?auto_1175470 ) ( IN ?auto_1175469 ?auto_1175472 ) ( ON ?auto_1175467 ?auto_1175468 ) ( not ( = ?auto_1175468 ?auto_1175467 ) ) ( not ( = ?auto_1175468 ?auto_1175469 ) ) ( ON ?auto_1175465 ?auto_1175464 ) ( ON ?auto_1175466 ?auto_1175465 ) ( ON ?auto_1175468 ?auto_1175466 ) ( not ( = ?auto_1175464 ?auto_1175465 ) ) ( not ( = ?auto_1175464 ?auto_1175466 ) ) ( not ( = ?auto_1175464 ?auto_1175468 ) ) ( not ( = ?auto_1175464 ?auto_1175467 ) ) ( not ( = ?auto_1175464 ?auto_1175469 ) ) ( not ( = ?auto_1175465 ?auto_1175466 ) ) ( not ( = ?auto_1175465 ?auto_1175468 ) ) ( not ( = ?auto_1175465 ?auto_1175467 ) ) ( not ( = ?auto_1175465 ?auto_1175469 ) ) ( not ( = ?auto_1175466 ?auto_1175468 ) ) ( not ( = ?auto_1175466 ?auto_1175467 ) ) ( not ( = ?auto_1175466 ?auto_1175469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175468 ?auto_1175467 ?auto_1175469 )
      ( MAKE-5CRATE-VERIFY ?auto_1175464 ?auto_1175465 ?auto_1175466 ?auto_1175468 ?auto_1175467 ?auto_1175469 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1175504 - SURFACE
      ?auto_1175505 - SURFACE
      ?auto_1175506 - SURFACE
      ?auto_1175508 - SURFACE
      ?auto_1175507 - SURFACE
      ?auto_1175509 - SURFACE
    )
    :vars
    (
      ?auto_1175511 - HOIST
      ?auto_1175513 - PLACE
      ?auto_1175510 - TRUCK
      ?auto_1175512 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175511 ?auto_1175513 ) ( SURFACE-AT ?auto_1175507 ?auto_1175513 ) ( CLEAR ?auto_1175507 ) ( IS-CRATE ?auto_1175509 ) ( not ( = ?auto_1175507 ?auto_1175509 ) ) ( AVAILABLE ?auto_1175511 ) ( IN ?auto_1175509 ?auto_1175510 ) ( ON ?auto_1175507 ?auto_1175508 ) ( not ( = ?auto_1175508 ?auto_1175507 ) ) ( not ( = ?auto_1175508 ?auto_1175509 ) ) ( TRUCK-AT ?auto_1175510 ?auto_1175512 ) ( not ( = ?auto_1175512 ?auto_1175513 ) ) ( ON ?auto_1175505 ?auto_1175504 ) ( ON ?auto_1175506 ?auto_1175505 ) ( ON ?auto_1175508 ?auto_1175506 ) ( not ( = ?auto_1175504 ?auto_1175505 ) ) ( not ( = ?auto_1175504 ?auto_1175506 ) ) ( not ( = ?auto_1175504 ?auto_1175508 ) ) ( not ( = ?auto_1175504 ?auto_1175507 ) ) ( not ( = ?auto_1175504 ?auto_1175509 ) ) ( not ( = ?auto_1175505 ?auto_1175506 ) ) ( not ( = ?auto_1175505 ?auto_1175508 ) ) ( not ( = ?auto_1175505 ?auto_1175507 ) ) ( not ( = ?auto_1175505 ?auto_1175509 ) ) ( not ( = ?auto_1175506 ?auto_1175508 ) ) ( not ( = ?auto_1175506 ?auto_1175507 ) ) ( not ( = ?auto_1175506 ?auto_1175509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175508 ?auto_1175507 ?auto_1175509 )
      ( MAKE-5CRATE-VERIFY ?auto_1175504 ?auto_1175505 ?auto_1175506 ?auto_1175508 ?auto_1175507 ?auto_1175509 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1175549 - SURFACE
      ?auto_1175550 - SURFACE
      ?auto_1175551 - SURFACE
      ?auto_1175553 - SURFACE
      ?auto_1175552 - SURFACE
      ?auto_1175554 - SURFACE
    )
    :vars
    (
      ?auto_1175555 - HOIST
      ?auto_1175559 - PLACE
      ?auto_1175558 - TRUCK
      ?auto_1175556 - PLACE
      ?auto_1175557 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175555 ?auto_1175559 ) ( SURFACE-AT ?auto_1175552 ?auto_1175559 ) ( CLEAR ?auto_1175552 ) ( IS-CRATE ?auto_1175554 ) ( not ( = ?auto_1175552 ?auto_1175554 ) ) ( AVAILABLE ?auto_1175555 ) ( ON ?auto_1175552 ?auto_1175553 ) ( not ( = ?auto_1175553 ?auto_1175552 ) ) ( not ( = ?auto_1175553 ?auto_1175554 ) ) ( TRUCK-AT ?auto_1175558 ?auto_1175556 ) ( not ( = ?auto_1175556 ?auto_1175559 ) ) ( HOIST-AT ?auto_1175557 ?auto_1175556 ) ( LIFTING ?auto_1175557 ?auto_1175554 ) ( not ( = ?auto_1175555 ?auto_1175557 ) ) ( ON ?auto_1175550 ?auto_1175549 ) ( ON ?auto_1175551 ?auto_1175550 ) ( ON ?auto_1175553 ?auto_1175551 ) ( not ( = ?auto_1175549 ?auto_1175550 ) ) ( not ( = ?auto_1175549 ?auto_1175551 ) ) ( not ( = ?auto_1175549 ?auto_1175553 ) ) ( not ( = ?auto_1175549 ?auto_1175552 ) ) ( not ( = ?auto_1175549 ?auto_1175554 ) ) ( not ( = ?auto_1175550 ?auto_1175551 ) ) ( not ( = ?auto_1175550 ?auto_1175553 ) ) ( not ( = ?auto_1175550 ?auto_1175552 ) ) ( not ( = ?auto_1175550 ?auto_1175554 ) ) ( not ( = ?auto_1175551 ?auto_1175553 ) ) ( not ( = ?auto_1175551 ?auto_1175552 ) ) ( not ( = ?auto_1175551 ?auto_1175554 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175553 ?auto_1175552 ?auto_1175554 )
      ( MAKE-5CRATE-VERIFY ?auto_1175549 ?auto_1175550 ?auto_1175551 ?auto_1175553 ?auto_1175552 ?auto_1175554 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1175599 - SURFACE
      ?auto_1175600 - SURFACE
      ?auto_1175601 - SURFACE
      ?auto_1175603 - SURFACE
      ?auto_1175602 - SURFACE
      ?auto_1175604 - SURFACE
    )
    :vars
    (
      ?auto_1175609 - HOIST
      ?auto_1175607 - PLACE
      ?auto_1175605 - TRUCK
      ?auto_1175610 - PLACE
      ?auto_1175608 - HOIST
      ?auto_1175606 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175609 ?auto_1175607 ) ( SURFACE-AT ?auto_1175602 ?auto_1175607 ) ( CLEAR ?auto_1175602 ) ( IS-CRATE ?auto_1175604 ) ( not ( = ?auto_1175602 ?auto_1175604 ) ) ( AVAILABLE ?auto_1175609 ) ( ON ?auto_1175602 ?auto_1175603 ) ( not ( = ?auto_1175603 ?auto_1175602 ) ) ( not ( = ?auto_1175603 ?auto_1175604 ) ) ( TRUCK-AT ?auto_1175605 ?auto_1175610 ) ( not ( = ?auto_1175610 ?auto_1175607 ) ) ( HOIST-AT ?auto_1175608 ?auto_1175610 ) ( not ( = ?auto_1175609 ?auto_1175608 ) ) ( AVAILABLE ?auto_1175608 ) ( SURFACE-AT ?auto_1175604 ?auto_1175610 ) ( ON ?auto_1175604 ?auto_1175606 ) ( CLEAR ?auto_1175604 ) ( not ( = ?auto_1175602 ?auto_1175606 ) ) ( not ( = ?auto_1175604 ?auto_1175606 ) ) ( not ( = ?auto_1175603 ?auto_1175606 ) ) ( ON ?auto_1175600 ?auto_1175599 ) ( ON ?auto_1175601 ?auto_1175600 ) ( ON ?auto_1175603 ?auto_1175601 ) ( not ( = ?auto_1175599 ?auto_1175600 ) ) ( not ( = ?auto_1175599 ?auto_1175601 ) ) ( not ( = ?auto_1175599 ?auto_1175603 ) ) ( not ( = ?auto_1175599 ?auto_1175602 ) ) ( not ( = ?auto_1175599 ?auto_1175604 ) ) ( not ( = ?auto_1175599 ?auto_1175606 ) ) ( not ( = ?auto_1175600 ?auto_1175601 ) ) ( not ( = ?auto_1175600 ?auto_1175603 ) ) ( not ( = ?auto_1175600 ?auto_1175602 ) ) ( not ( = ?auto_1175600 ?auto_1175604 ) ) ( not ( = ?auto_1175600 ?auto_1175606 ) ) ( not ( = ?auto_1175601 ?auto_1175603 ) ) ( not ( = ?auto_1175601 ?auto_1175602 ) ) ( not ( = ?auto_1175601 ?auto_1175604 ) ) ( not ( = ?auto_1175601 ?auto_1175606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175603 ?auto_1175602 ?auto_1175604 )
      ( MAKE-5CRATE-VERIFY ?auto_1175599 ?auto_1175600 ?auto_1175601 ?auto_1175603 ?auto_1175602 ?auto_1175604 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1175650 - SURFACE
      ?auto_1175651 - SURFACE
      ?auto_1175652 - SURFACE
      ?auto_1175654 - SURFACE
      ?auto_1175653 - SURFACE
      ?auto_1175655 - SURFACE
    )
    :vars
    (
      ?auto_1175661 - HOIST
      ?auto_1175660 - PLACE
      ?auto_1175658 - PLACE
      ?auto_1175659 - HOIST
      ?auto_1175657 - SURFACE
      ?auto_1175656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175661 ?auto_1175660 ) ( SURFACE-AT ?auto_1175653 ?auto_1175660 ) ( CLEAR ?auto_1175653 ) ( IS-CRATE ?auto_1175655 ) ( not ( = ?auto_1175653 ?auto_1175655 ) ) ( AVAILABLE ?auto_1175661 ) ( ON ?auto_1175653 ?auto_1175654 ) ( not ( = ?auto_1175654 ?auto_1175653 ) ) ( not ( = ?auto_1175654 ?auto_1175655 ) ) ( not ( = ?auto_1175658 ?auto_1175660 ) ) ( HOIST-AT ?auto_1175659 ?auto_1175658 ) ( not ( = ?auto_1175661 ?auto_1175659 ) ) ( AVAILABLE ?auto_1175659 ) ( SURFACE-AT ?auto_1175655 ?auto_1175658 ) ( ON ?auto_1175655 ?auto_1175657 ) ( CLEAR ?auto_1175655 ) ( not ( = ?auto_1175653 ?auto_1175657 ) ) ( not ( = ?auto_1175655 ?auto_1175657 ) ) ( not ( = ?auto_1175654 ?auto_1175657 ) ) ( TRUCK-AT ?auto_1175656 ?auto_1175660 ) ( ON ?auto_1175651 ?auto_1175650 ) ( ON ?auto_1175652 ?auto_1175651 ) ( ON ?auto_1175654 ?auto_1175652 ) ( not ( = ?auto_1175650 ?auto_1175651 ) ) ( not ( = ?auto_1175650 ?auto_1175652 ) ) ( not ( = ?auto_1175650 ?auto_1175654 ) ) ( not ( = ?auto_1175650 ?auto_1175653 ) ) ( not ( = ?auto_1175650 ?auto_1175655 ) ) ( not ( = ?auto_1175650 ?auto_1175657 ) ) ( not ( = ?auto_1175651 ?auto_1175652 ) ) ( not ( = ?auto_1175651 ?auto_1175654 ) ) ( not ( = ?auto_1175651 ?auto_1175653 ) ) ( not ( = ?auto_1175651 ?auto_1175655 ) ) ( not ( = ?auto_1175651 ?auto_1175657 ) ) ( not ( = ?auto_1175652 ?auto_1175654 ) ) ( not ( = ?auto_1175652 ?auto_1175653 ) ) ( not ( = ?auto_1175652 ?auto_1175655 ) ) ( not ( = ?auto_1175652 ?auto_1175657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175654 ?auto_1175653 ?auto_1175655 )
      ( MAKE-5CRATE-VERIFY ?auto_1175650 ?auto_1175651 ?auto_1175652 ?auto_1175654 ?auto_1175653 ?auto_1175655 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1175701 - SURFACE
      ?auto_1175702 - SURFACE
      ?auto_1175703 - SURFACE
      ?auto_1175705 - SURFACE
      ?auto_1175704 - SURFACE
      ?auto_1175706 - SURFACE
    )
    :vars
    (
      ?auto_1175708 - HOIST
      ?auto_1175707 - PLACE
      ?auto_1175710 - PLACE
      ?auto_1175709 - HOIST
      ?auto_1175711 - SURFACE
      ?auto_1175712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175708 ?auto_1175707 ) ( IS-CRATE ?auto_1175706 ) ( not ( = ?auto_1175704 ?auto_1175706 ) ) ( not ( = ?auto_1175705 ?auto_1175704 ) ) ( not ( = ?auto_1175705 ?auto_1175706 ) ) ( not ( = ?auto_1175710 ?auto_1175707 ) ) ( HOIST-AT ?auto_1175709 ?auto_1175710 ) ( not ( = ?auto_1175708 ?auto_1175709 ) ) ( AVAILABLE ?auto_1175709 ) ( SURFACE-AT ?auto_1175706 ?auto_1175710 ) ( ON ?auto_1175706 ?auto_1175711 ) ( CLEAR ?auto_1175706 ) ( not ( = ?auto_1175704 ?auto_1175711 ) ) ( not ( = ?auto_1175706 ?auto_1175711 ) ) ( not ( = ?auto_1175705 ?auto_1175711 ) ) ( TRUCK-AT ?auto_1175712 ?auto_1175707 ) ( SURFACE-AT ?auto_1175705 ?auto_1175707 ) ( CLEAR ?auto_1175705 ) ( LIFTING ?auto_1175708 ?auto_1175704 ) ( IS-CRATE ?auto_1175704 ) ( ON ?auto_1175702 ?auto_1175701 ) ( ON ?auto_1175703 ?auto_1175702 ) ( ON ?auto_1175705 ?auto_1175703 ) ( not ( = ?auto_1175701 ?auto_1175702 ) ) ( not ( = ?auto_1175701 ?auto_1175703 ) ) ( not ( = ?auto_1175701 ?auto_1175705 ) ) ( not ( = ?auto_1175701 ?auto_1175704 ) ) ( not ( = ?auto_1175701 ?auto_1175706 ) ) ( not ( = ?auto_1175701 ?auto_1175711 ) ) ( not ( = ?auto_1175702 ?auto_1175703 ) ) ( not ( = ?auto_1175702 ?auto_1175705 ) ) ( not ( = ?auto_1175702 ?auto_1175704 ) ) ( not ( = ?auto_1175702 ?auto_1175706 ) ) ( not ( = ?auto_1175702 ?auto_1175711 ) ) ( not ( = ?auto_1175703 ?auto_1175705 ) ) ( not ( = ?auto_1175703 ?auto_1175704 ) ) ( not ( = ?auto_1175703 ?auto_1175706 ) ) ( not ( = ?auto_1175703 ?auto_1175711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175705 ?auto_1175704 ?auto_1175706 )
      ( MAKE-5CRATE-VERIFY ?auto_1175701 ?auto_1175702 ?auto_1175703 ?auto_1175705 ?auto_1175704 ?auto_1175706 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1175752 - SURFACE
      ?auto_1175753 - SURFACE
      ?auto_1175754 - SURFACE
      ?auto_1175756 - SURFACE
      ?auto_1175755 - SURFACE
      ?auto_1175757 - SURFACE
    )
    :vars
    (
      ?auto_1175759 - HOIST
      ?auto_1175758 - PLACE
      ?auto_1175763 - PLACE
      ?auto_1175762 - HOIST
      ?auto_1175761 - SURFACE
      ?auto_1175760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175759 ?auto_1175758 ) ( IS-CRATE ?auto_1175757 ) ( not ( = ?auto_1175755 ?auto_1175757 ) ) ( not ( = ?auto_1175756 ?auto_1175755 ) ) ( not ( = ?auto_1175756 ?auto_1175757 ) ) ( not ( = ?auto_1175763 ?auto_1175758 ) ) ( HOIST-AT ?auto_1175762 ?auto_1175763 ) ( not ( = ?auto_1175759 ?auto_1175762 ) ) ( AVAILABLE ?auto_1175762 ) ( SURFACE-AT ?auto_1175757 ?auto_1175763 ) ( ON ?auto_1175757 ?auto_1175761 ) ( CLEAR ?auto_1175757 ) ( not ( = ?auto_1175755 ?auto_1175761 ) ) ( not ( = ?auto_1175757 ?auto_1175761 ) ) ( not ( = ?auto_1175756 ?auto_1175761 ) ) ( TRUCK-AT ?auto_1175760 ?auto_1175758 ) ( SURFACE-AT ?auto_1175756 ?auto_1175758 ) ( CLEAR ?auto_1175756 ) ( IS-CRATE ?auto_1175755 ) ( AVAILABLE ?auto_1175759 ) ( IN ?auto_1175755 ?auto_1175760 ) ( ON ?auto_1175753 ?auto_1175752 ) ( ON ?auto_1175754 ?auto_1175753 ) ( ON ?auto_1175756 ?auto_1175754 ) ( not ( = ?auto_1175752 ?auto_1175753 ) ) ( not ( = ?auto_1175752 ?auto_1175754 ) ) ( not ( = ?auto_1175752 ?auto_1175756 ) ) ( not ( = ?auto_1175752 ?auto_1175755 ) ) ( not ( = ?auto_1175752 ?auto_1175757 ) ) ( not ( = ?auto_1175752 ?auto_1175761 ) ) ( not ( = ?auto_1175753 ?auto_1175754 ) ) ( not ( = ?auto_1175753 ?auto_1175756 ) ) ( not ( = ?auto_1175753 ?auto_1175755 ) ) ( not ( = ?auto_1175753 ?auto_1175757 ) ) ( not ( = ?auto_1175753 ?auto_1175761 ) ) ( not ( = ?auto_1175754 ?auto_1175756 ) ) ( not ( = ?auto_1175754 ?auto_1175755 ) ) ( not ( = ?auto_1175754 ?auto_1175757 ) ) ( not ( = ?auto_1175754 ?auto_1175761 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175756 ?auto_1175755 ?auto_1175757 )
      ( MAKE-5CRATE-VERIFY ?auto_1175752 ?auto_1175753 ?auto_1175754 ?auto_1175756 ?auto_1175755 ?auto_1175757 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1176961 - SURFACE
      ?auto_1176962 - SURFACE
      ?auto_1176963 - SURFACE
      ?auto_1176965 - SURFACE
      ?auto_1176964 - SURFACE
      ?auto_1176966 - SURFACE
      ?auto_1176967 - SURFACE
    )
    :vars
    (
      ?auto_1176968 - HOIST
      ?auto_1176969 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176968 ?auto_1176969 ) ( SURFACE-AT ?auto_1176966 ?auto_1176969 ) ( CLEAR ?auto_1176966 ) ( LIFTING ?auto_1176968 ?auto_1176967 ) ( IS-CRATE ?auto_1176967 ) ( not ( = ?auto_1176966 ?auto_1176967 ) ) ( ON ?auto_1176962 ?auto_1176961 ) ( ON ?auto_1176963 ?auto_1176962 ) ( ON ?auto_1176965 ?auto_1176963 ) ( ON ?auto_1176964 ?auto_1176965 ) ( ON ?auto_1176966 ?auto_1176964 ) ( not ( = ?auto_1176961 ?auto_1176962 ) ) ( not ( = ?auto_1176961 ?auto_1176963 ) ) ( not ( = ?auto_1176961 ?auto_1176965 ) ) ( not ( = ?auto_1176961 ?auto_1176964 ) ) ( not ( = ?auto_1176961 ?auto_1176966 ) ) ( not ( = ?auto_1176961 ?auto_1176967 ) ) ( not ( = ?auto_1176962 ?auto_1176963 ) ) ( not ( = ?auto_1176962 ?auto_1176965 ) ) ( not ( = ?auto_1176962 ?auto_1176964 ) ) ( not ( = ?auto_1176962 ?auto_1176966 ) ) ( not ( = ?auto_1176962 ?auto_1176967 ) ) ( not ( = ?auto_1176963 ?auto_1176965 ) ) ( not ( = ?auto_1176963 ?auto_1176964 ) ) ( not ( = ?auto_1176963 ?auto_1176966 ) ) ( not ( = ?auto_1176963 ?auto_1176967 ) ) ( not ( = ?auto_1176965 ?auto_1176964 ) ) ( not ( = ?auto_1176965 ?auto_1176966 ) ) ( not ( = ?auto_1176965 ?auto_1176967 ) ) ( not ( = ?auto_1176964 ?auto_1176966 ) ) ( not ( = ?auto_1176964 ?auto_1176967 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1176966 ?auto_1176967 )
      ( MAKE-6CRATE-VERIFY ?auto_1176961 ?auto_1176962 ?auto_1176963 ?auto_1176965 ?auto_1176964 ?auto_1176966 ?auto_1176967 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1177005 - SURFACE
      ?auto_1177006 - SURFACE
      ?auto_1177007 - SURFACE
      ?auto_1177009 - SURFACE
      ?auto_1177008 - SURFACE
      ?auto_1177010 - SURFACE
      ?auto_1177011 - SURFACE
    )
    :vars
    (
      ?auto_1177012 - HOIST
      ?auto_1177014 - PLACE
      ?auto_1177013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1177012 ?auto_1177014 ) ( SURFACE-AT ?auto_1177010 ?auto_1177014 ) ( CLEAR ?auto_1177010 ) ( IS-CRATE ?auto_1177011 ) ( not ( = ?auto_1177010 ?auto_1177011 ) ) ( TRUCK-AT ?auto_1177013 ?auto_1177014 ) ( AVAILABLE ?auto_1177012 ) ( IN ?auto_1177011 ?auto_1177013 ) ( ON ?auto_1177010 ?auto_1177008 ) ( not ( = ?auto_1177008 ?auto_1177010 ) ) ( not ( = ?auto_1177008 ?auto_1177011 ) ) ( ON ?auto_1177006 ?auto_1177005 ) ( ON ?auto_1177007 ?auto_1177006 ) ( ON ?auto_1177009 ?auto_1177007 ) ( ON ?auto_1177008 ?auto_1177009 ) ( not ( = ?auto_1177005 ?auto_1177006 ) ) ( not ( = ?auto_1177005 ?auto_1177007 ) ) ( not ( = ?auto_1177005 ?auto_1177009 ) ) ( not ( = ?auto_1177005 ?auto_1177008 ) ) ( not ( = ?auto_1177005 ?auto_1177010 ) ) ( not ( = ?auto_1177005 ?auto_1177011 ) ) ( not ( = ?auto_1177006 ?auto_1177007 ) ) ( not ( = ?auto_1177006 ?auto_1177009 ) ) ( not ( = ?auto_1177006 ?auto_1177008 ) ) ( not ( = ?auto_1177006 ?auto_1177010 ) ) ( not ( = ?auto_1177006 ?auto_1177011 ) ) ( not ( = ?auto_1177007 ?auto_1177009 ) ) ( not ( = ?auto_1177007 ?auto_1177008 ) ) ( not ( = ?auto_1177007 ?auto_1177010 ) ) ( not ( = ?auto_1177007 ?auto_1177011 ) ) ( not ( = ?auto_1177009 ?auto_1177008 ) ) ( not ( = ?auto_1177009 ?auto_1177010 ) ) ( not ( = ?auto_1177009 ?auto_1177011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1177008 ?auto_1177010 ?auto_1177011 )
      ( MAKE-6CRATE-VERIFY ?auto_1177005 ?auto_1177006 ?auto_1177007 ?auto_1177009 ?auto_1177008 ?auto_1177010 ?auto_1177011 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1177056 - SURFACE
      ?auto_1177057 - SURFACE
      ?auto_1177058 - SURFACE
      ?auto_1177060 - SURFACE
      ?auto_1177059 - SURFACE
      ?auto_1177061 - SURFACE
      ?auto_1177062 - SURFACE
    )
    :vars
    (
      ?auto_1177063 - HOIST
      ?auto_1177064 - PLACE
      ?auto_1177066 - TRUCK
      ?auto_1177065 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1177063 ?auto_1177064 ) ( SURFACE-AT ?auto_1177061 ?auto_1177064 ) ( CLEAR ?auto_1177061 ) ( IS-CRATE ?auto_1177062 ) ( not ( = ?auto_1177061 ?auto_1177062 ) ) ( AVAILABLE ?auto_1177063 ) ( IN ?auto_1177062 ?auto_1177066 ) ( ON ?auto_1177061 ?auto_1177059 ) ( not ( = ?auto_1177059 ?auto_1177061 ) ) ( not ( = ?auto_1177059 ?auto_1177062 ) ) ( TRUCK-AT ?auto_1177066 ?auto_1177065 ) ( not ( = ?auto_1177065 ?auto_1177064 ) ) ( ON ?auto_1177057 ?auto_1177056 ) ( ON ?auto_1177058 ?auto_1177057 ) ( ON ?auto_1177060 ?auto_1177058 ) ( ON ?auto_1177059 ?auto_1177060 ) ( not ( = ?auto_1177056 ?auto_1177057 ) ) ( not ( = ?auto_1177056 ?auto_1177058 ) ) ( not ( = ?auto_1177056 ?auto_1177060 ) ) ( not ( = ?auto_1177056 ?auto_1177059 ) ) ( not ( = ?auto_1177056 ?auto_1177061 ) ) ( not ( = ?auto_1177056 ?auto_1177062 ) ) ( not ( = ?auto_1177057 ?auto_1177058 ) ) ( not ( = ?auto_1177057 ?auto_1177060 ) ) ( not ( = ?auto_1177057 ?auto_1177059 ) ) ( not ( = ?auto_1177057 ?auto_1177061 ) ) ( not ( = ?auto_1177057 ?auto_1177062 ) ) ( not ( = ?auto_1177058 ?auto_1177060 ) ) ( not ( = ?auto_1177058 ?auto_1177059 ) ) ( not ( = ?auto_1177058 ?auto_1177061 ) ) ( not ( = ?auto_1177058 ?auto_1177062 ) ) ( not ( = ?auto_1177060 ?auto_1177059 ) ) ( not ( = ?auto_1177060 ?auto_1177061 ) ) ( not ( = ?auto_1177060 ?auto_1177062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1177059 ?auto_1177061 ?auto_1177062 )
      ( MAKE-6CRATE-VERIFY ?auto_1177056 ?auto_1177057 ?auto_1177058 ?auto_1177060 ?auto_1177059 ?auto_1177061 ?auto_1177062 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1177113 - SURFACE
      ?auto_1177114 - SURFACE
      ?auto_1177115 - SURFACE
      ?auto_1177117 - SURFACE
      ?auto_1177116 - SURFACE
      ?auto_1177118 - SURFACE
      ?auto_1177119 - SURFACE
    )
    :vars
    (
      ?auto_1177120 - HOIST
      ?auto_1177122 - PLACE
      ?auto_1177124 - TRUCK
      ?auto_1177121 - PLACE
      ?auto_1177123 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1177120 ?auto_1177122 ) ( SURFACE-AT ?auto_1177118 ?auto_1177122 ) ( CLEAR ?auto_1177118 ) ( IS-CRATE ?auto_1177119 ) ( not ( = ?auto_1177118 ?auto_1177119 ) ) ( AVAILABLE ?auto_1177120 ) ( ON ?auto_1177118 ?auto_1177116 ) ( not ( = ?auto_1177116 ?auto_1177118 ) ) ( not ( = ?auto_1177116 ?auto_1177119 ) ) ( TRUCK-AT ?auto_1177124 ?auto_1177121 ) ( not ( = ?auto_1177121 ?auto_1177122 ) ) ( HOIST-AT ?auto_1177123 ?auto_1177121 ) ( LIFTING ?auto_1177123 ?auto_1177119 ) ( not ( = ?auto_1177120 ?auto_1177123 ) ) ( ON ?auto_1177114 ?auto_1177113 ) ( ON ?auto_1177115 ?auto_1177114 ) ( ON ?auto_1177117 ?auto_1177115 ) ( ON ?auto_1177116 ?auto_1177117 ) ( not ( = ?auto_1177113 ?auto_1177114 ) ) ( not ( = ?auto_1177113 ?auto_1177115 ) ) ( not ( = ?auto_1177113 ?auto_1177117 ) ) ( not ( = ?auto_1177113 ?auto_1177116 ) ) ( not ( = ?auto_1177113 ?auto_1177118 ) ) ( not ( = ?auto_1177113 ?auto_1177119 ) ) ( not ( = ?auto_1177114 ?auto_1177115 ) ) ( not ( = ?auto_1177114 ?auto_1177117 ) ) ( not ( = ?auto_1177114 ?auto_1177116 ) ) ( not ( = ?auto_1177114 ?auto_1177118 ) ) ( not ( = ?auto_1177114 ?auto_1177119 ) ) ( not ( = ?auto_1177115 ?auto_1177117 ) ) ( not ( = ?auto_1177115 ?auto_1177116 ) ) ( not ( = ?auto_1177115 ?auto_1177118 ) ) ( not ( = ?auto_1177115 ?auto_1177119 ) ) ( not ( = ?auto_1177117 ?auto_1177116 ) ) ( not ( = ?auto_1177117 ?auto_1177118 ) ) ( not ( = ?auto_1177117 ?auto_1177119 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1177116 ?auto_1177118 ?auto_1177119 )
      ( MAKE-6CRATE-VERIFY ?auto_1177113 ?auto_1177114 ?auto_1177115 ?auto_1177117 ?auto_1177116 ?auto_1177118 ?auto_1177119 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1177176 - SURFACE
      ?auto_1177177 - SURFACE
      ?auto_1177178 - SURFACE
      ?auto_1177180 - SURFACE
      ?auto_1177179 - SURFACE
      ?auto_1177181 - SURFACE
      ?auto_1177182 - SURFACE
    )
    :vars
    (
      ?auto_1177185 - HOIST
      ?auto_1177184 - PLACE
      ?auto_1177186 - TRUCK
      ?auto_1177187 - PLACE
      ?auto_1177183 - HOIST
      ?auto_1177188 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1177185 ?auto_1177184 ) ( SURFACE-AT ?auto_1177181 ?auto_1177184 ) ( CLEAR ?auto_1177181 ) ( IS-CRATE ?auto_1177182 ) ( not ( = ?auto_1177181 ?auto_1177182 ) ) ( AVAILABLE ?auto_1177185 ) ( ON ?auto_1177181 ?auto_1177179 ) ( not ( = ?auto_1177179 ?auto_1177181 ) ) ( not ( = ?auto_1177179 ?auto_1177182 ) ) ( TRUCK-AT ?auto_1177186 ?auto_1177187 ) ( not ( = ?auto_1177187 ?auto_1177184 ) ) ( HOIST-AT ?auto_1177183 ?auto_1177187 ) ( not ( = ?auto_1177185 ?auto_1177183 ) ) ( AVAILABLE ?auto_1177183 ) ( SURFACE-AT ?auto_1177182 ?auto_1177187 ) ( ON ?auto_1177182 ?auto_1177188 ) ( CLEAR ?auto_1177182 ) ( not ( = ?auto_1177181 ?auto_1177188 ) ) ( not ( = ?auto_1177182 ?auto_1177188 ) ) ( not ( = ?auto_1177179 ?auto_1177188 ) ) ( ON ?auto_1177177 ?auto_1177176 ) ( ON ?auto_1177178 ?auto_1177177 ) ( ON ?auto_1177180 ?auto_1177178 ) ( ON ?auto_1177179 ?auto_1177180 ) ( not ( = ?auto_1177176 ?auto_1177177 ) ) ( not ( = ?auto_1177176 ?auto_1177178 ) ) ( not ( = ?auto_1177176 ?auto_1177180 ) ) ( not ( = ?auto_1177176 ?auto_1177179 ) ) ( not ( = ?auto_1177176 ?auto_1177181 ) ) ( not ( = ?auto_1177176 ?auto_1177182 ) ) ( not ( = ?auto_1177176 ?auto_1177188 ) ) ( not ( = ?auto_1177177 ?auto_1177178 ) ) ( not ( = ?auto_1177177 ?auto_1177180 ) ) ( not ( = ?auto_1177177 ?auto_1177179 ) ) ( not ( = ?auto_1177177 ?auto_1177181 ) ) ( not ( = ?auto_1177177 ?auto_1177182 ) ) ( not ( = ?auto_1177177 ?auto_1177188 ) ) ( not ( = ?auto_1177178 ?auto_1177180 ) ) ( not ( = ?auto_1177178 ?auto_1177179 ) ) ( not ( = ?auto_1177178 ?auto_1177181 ) ) ( not ( = ?auto_1177178 ?auto_1177182 ) ) ( not ( = ?auto_1177178 ?auto_1177188 ) ) ( not ( = ?auto_1177180 ?auto_1177179 ) ) ( not ( = ?auto_1177180 ?auto_1177181 ) ) ( not ( = ?auto_1177180 ?auto_1177182 ) ) ( not ( = ?auto_1177180 ?auto_1177188 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1177179 ?auto_1177181 ?auto_1177182 )
      ( MAKE-6CRATE-VERIFY ?auto_1177176 ?auto_1177177 ?auto_1177178 ?auto_1177180 ?auto_1177179 ?auto_1177181 ?auto_1177182 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1177240 - SURFACE
      ?auto_1177241 - SURFACE
      ?auto_1177242 - SURFACE
      ?auto_1177244 - SURFACE
      ?auto_1177243 - SURFACE
      ?auto_1177245 - SURFACE
      ?auto_1177246 - SURFACE
    )
    :vars
    (
      ?auto_1177248 - HOIST
      ?auto_1177252 - PLACE
      ?auto_1177247 - PLACE
      ?auto_1177249 - HOIST
      ?auto_1177251 - SURFACE
      ?auto_1177250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1177248 ?auto_1177252 ) ( SURFACE-AT ?auto_1177245 ?auto_1177252 ) ( CLEAR ?auto_1177245 ) ( IS-CRATE ?auto_1177246 ) ( not ( = ?auto_1177245 ?auto_1177246 ) ) ( AVAILABLE ?auto_1177248 ) ( ON ?auto_1177245 ?auto_1177243 ) ( not ( = ?auto_1177243 ?auto_1177245 ) ) ( not ( = ?auto_1177243 ?auto_1177246 ) ) ( not ( = ?auto_1177247 ?auto_1177252 ) ) ( HOIST-AT ?auto_1177249 ?auto_1177247 ) ( not ( = ?auto_1177248 ?auto_1177249 ) ) ( AVAILABLE ?auto_1177249 ) ( SURFACE-AT ?auto_1177246 ?auto_1177247 ) ( ON ?auto_1177246 ?auto_1177251 ) ( CLEAR ?auto_1177246 ) ( not ( = ?auto_1177245 ?auto_1177251 ) ) ( not ( = ?auto_1177246 ?auto_1177251 ) ) ( not ( = ?auto_1177243 ?auto_1177251 ) ) ( TRUCK-AT ?auto_1177250 ?auto_1177252 ) ( ON ?auto_1177241 ?auto_1177240 ) ( ON ?auto_1177242 ?auto_1177241 ) ( ON ?auto_1177244 ?auto_1177242 ) ( ON ?auto_1177243 ?auto_1177244 ) ( not ( = ?auto_1177240 ?auto_1177241 ) ) ( not ( = ?auto_1177240 ?auto_1177242 ) ) ( not ( = ?auto_1177240 ?auto_1177244 ) ) ( not ( = ?auto_1177240 ?auto_1177243 ) ) ( not ( = ?auto_1177240 ?auto_1177245 ) ) ( not ( = ?auto_1177240 ?auto_1177246 ) ) ( not ( = ?auto_1177240 ?auto_1177251 ) ) ( not ( = ?auto_1177241 ?auto_1177242 ) ) ( not ( = ?auto_1177241 ?auto_1177244 ) ) ( not ( = ?auto_1177241 ?auto_1177243 ) ) ( not ( = ?auto_1177241 ?auto_1177245 ) ) ( not ( = ?auto_1177241 ?auto_1177246 ) ) ( not ( = ?auto_1177241 ?auto_1177251 ) ) ( not ( = ?auto_1177242 ?auto_1177244 ) ) ( not ( = ?auto_1177242 ?auto_1177243 ) ) ( not ( = ?auto_1177242 ?auto_1177245 ) ) ( not ( = ?auto_1177242 ?auto_1177246 ) ) ( not ( = ?auto_1177242 ?auto_1177251 ) ) ( not ( = ?auto_1177244 ?auto_1177243 ) ) ( not ( = ?auto_1177244 ?auto_1177245 ) ) ( not ( = ?auto_1177244 ?auto_1177246 ) ) ( not ( = ?auto_1177244 ?auto_1177251 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1177243 ?auto_1177245 ?auto_1177246 )
      ( MAKE-6CRATE-VERIFY ?auto_1177240 ?auto_1177241 ?auto_1177242 ?auto_1177244 ?auto_1177243 ?auto_1177245 ?auto_1177246 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1177304 - SURFACE
      ?auto_1177305 - SURFACE
      ?auto_1177306 - SURFACE
      ?auto_1177308 - SURFACE
      ?auto_1177307 - SURFACE
      ?auto_1177309 - SURFACE
      ?auto_1177310 - SURFACE
    )
    :vars
    (
      ?auto_1177315 - HOIST
      ?auto_1177311 - PLACE
      ?auto_1177312 - PLACE
      ?auto_1177316 - HOIST
      ?auto_1177314 - SURFACE
      ?auto_1177313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1177315 ?auto_1177311 ) ( IS-CRATE ?auto_1177310 ) ( not ( = ?auto_1177309 ?auto_1177310 ) ) ( not ( = ?auto_1177307 ?auto_1177309 ) ) ( not ( = ?auto_1177307 ?auto_1177310 ) ) ( not ( = ?auto_1177312 ?auto_1177311 ) ) ( HOIST-AT ?auto_1177316 ?auto_1177312 ) ( not ( = ?auto_1177315 ?auto_1177316 ) ) ( AVAILABLE ?auto_1177316 ) ( SURFACE-AT ?auto_1177310 ?auto_1177312 ) ( ON ?auto_1177310 ?auto_1177314 ) ( CLEAR ?auto_1177310 ) ( not ( = ?auto_1177309 ?auto_1177314 ) ) ( not ( = ?auto_1177310 ?auto_1177314 ) ) ( not ( = ?auto_1177307 ?auto_1177314 ) ) ( TRUCK-AT ?auto_1177313 ?auto_1177311 ) ( SURFACE-AT ?auto_1177307 ?auto_1177311 ) ( CLEAR ?auto_1177307 ) ( LIFTING ?auto_1177315 ?auto_1177309 ) ( IS-CRATE ?auto_1177309 ) ( ON ?auto_1177305 ?auto_1177304 ) ( ON ?auto_1177306 ?auto_1177305 ) ( ON ?auto_1177308 ?auto_1177306 ) ( ON ?auto_1177307 ?auto_1177308 ) ( not ( = ?auto_1177304 ?auto_1177305 ) ) ( not ( = ?auto_1177304 ?auto_1177306 ) ) ( not ( = ?auto_1177304 ?auto_1177308 ) ) ( not ( = ?auto_1177304 ?auto_1177307 ) ) ( not ( = ?auto_1177304 ?auto_1177309 ) ) ( not ( = ?auto_1177304 ?auto_1177310 ) ) ( not ( = ?auto_1177304 ?auto_1177314 ) ) ( not ( = ?auto_1177305 ?auto_1177306 ) ) ( not ( = ?auto_1177305 ?auto_1177308 ) ) ( not ( = ?auto_1177305 ?auto_1177307 ) ) ( not ( = ?auto_1177305 ?auto_1177309 ) ) ( not ( = ?auto_1177305 ?auto_1177310 ) ) ( not ( = ?auto_1177305 ?auto_1177314 ) ) ( not ( = ?auto_1177306 ?auto_1177308 ) ) ( not ( = ?auto_1177306 ?auto_1177307 ) ) ( not ( = ?auto_1177306 ?auto_1177309 ) ) ( not ( = ?auto_1177306 ?auto_1177310 ) ) ( not ( = ?auto_1177306 ?auto_1177314 ) ) ( not ( = ?auto_1177308 ?auto_1177307 ) ) ( not ( = ?auto_1177308 ?auto_1177309 ) ) ( not ( = ?auto_1177308 ?auto_1177310 ) ) ( not ( = ?auto_1177308 ?auto_1177314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1177307 ?auto_1177309 ?auto_1177310 )
      ( MAKE-6CRATE-VERIFY ?auto_1177304 ?auto_1177305 ?auto_1177306 ?auto_1177308 ?auto_1177307 ?auto_1177309 ?auto_1177310 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1177368 - SURFACE
      ?auto_1177369 - SURFACE
      ?auto_1177370 - SURFACE
      ?auto_1177372 - SURFACE
      ?auto_1177371 - SURFACE
      ?auto_1177373 - SURFACE
      ?auto_1177374 - SURFACE
    )
    :vars
    (
      ?auto_1177378 - HOIST
      ?auto_1177377 - PLACE
      ?auto_1177376 - PLACE
      ?auto_1177375 - HOIST
      ?auto_1177380 - SURFACE
      ?auto_1177379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1177378 ?auto_1177377 ) ( IS-CRATE ?auto_1177374 ) ( not ( = ?auto_1177373 ?auto_1177374 ) ) ( not ( = ?auto_1177371 ?auto_1177373 ) ) ( not ( = ?auto_1177371 ?auto_1177374 ) ) ( not ( = ?auto_1177376 ?auto_1177377 ) ) ( HOIST-AT ?auto_1177375 ?auto_1177376 ) ( not ( = ?auto_1177378 ?auto_1177375 ) ) ( AVAILABLE ?auto_1177375 ) ( SURFACE-AT ?auto_1177374 ?auto_1177376 ) ( ON ?auto_1177374 ?auto_1177380 ) ( CLEAR ?auto_1177374 ) ( not ( = ?auto_1177373 ?auto_1177380 ) ) ( not ( = ?auto_1177374 ?auto_1177380 ) ) ( not ( = ?auto_1177371 ?auto_1177380 ) ) ( TRUCK-AT ?auto_1177379 ?auto_1177377 ) ( SURFACE-AT ?auto_1177371 ?auto_1177377 ) ( CLEAR ?auto_1177371 ) ( IS-CRATE ?auto_1177373 ) ( AVAILABLE ?auto_1177378 ) ( IN ?auto_1177373 ?auto_1177379 ) ( ON ?auto_1177369 ?auto_1177368 ) ( ON ?auto_1177370 ?auto_1177369 ) ( ON ?auto_1177372 ?auto_1177370 ) ( ON ?auto_1177371 ?auto_1177372 ) ( not ( = ?auto_1177368 ?auto_1177369 ) ) ( not ( = ?auto_1177368 ?auto_1177370 ) ) ( not ( = ?auto_1177368 ?auto_1177372 ) ) ( not ( = ?auto_1177368 ?auto_1177371 ) ) ( not ( = ?auto_1177368 ?auto_1177373 ) ) ( not ( = ?auto_1177368 ?auto_1177374 ) ) ( not ( = ?auto_1177368 ?auto_1177380 ) ) ( not ( = ?auto_1177369 ?auto_1177370 ) ) ( not ( = ?auto_1177369 ?auto_1177372 ) ) ( not ( = ?auto_1177369 ?auto_1177371 ) ) ( not ( = ?auto_1177369 ?auto_1177373 ) ) ( not ( = ?auto_1177369 ?auto_1177374 ) ) ( not ( = ?auto_1177369 ?auto_1177380 ) ) ( not ( = ?auto_1177370 ?auto_1177372 ) ) ( not ( = ?auto_1177370 ?auto_1177371 ) ) ( not ( = ?auto_1177370 ?auto_1177373 ) ) ( not ( = ?auto_1177370 ?auto_1177374 ) ) ( not ( = ?auto_1177370 ?auto_1177380 ) ) ( not ( = ?auto_1177372 ?auto_1177371 ) ) ( not ( = ?auto_1177372 ?auto_1177373 ) ) ( not ( = ?auto_1177372 ?auto_1177374 ) ) ( not ( = ?auto_1177372 ?auto_1177380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1177371 ?auto_1177373 ?auto_1177374 )
      ( MAKE-6CRATE-VERIFY ?auto_1177368 ?auto_1177369 ?auto_1177370 ?auto_1177372 ?auto_1177371 ?auto_1177373 ?auto_1177374 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1179324 - SURFACE
      ?auto_1179325 - SURFACE
      ?auto_1179326 - SURFACE
      ?auto_1179328 - SURFACE
      ?auto_1179327 - SURFACE
      ?auto_1179329 - SURFACE
      ?auto_1179330 - SURFACE
      ?auto_1179331 - SURFACE
    )
    :vars
    (
      ?auto_1179333 - HOIST
      ?auto_1179332 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1179333 ?auto_1179332 ) ( SURFACE-AT ?auto_1179330 ?auto_1179332 ) ( CLEAR ?auto_1179330 ) ( LIFTING ?auto_1179333 ?auto_1179331 ) ( IS-CRATE ?auto_1179331 ) ( not ( = ?auto_1179330 ?auto_1179331 ) ) ( ON ?auto_1179325 ?auto_1179324 ) ( ON ?auto_1179326 ?auto_1179325 ) ( ON ?auto_1179328 ?auto_1179326 ) ( ON ?auto_1179327 ?auto_1179328 ) ( ON ?auto_1179329 ?auto_1179327 ) ( ON ?auto_1179330 ?auto_1179329 ) ( not ( = ?auto_1179324 ?auto_1179325 ) ) ( not ( = ?auto_1179324 ?auto_1179326 ) ) ( not ( = ?auto_1179324 ?auto_1179328 ) ) ( not ( = ?auto_1179324 ?auto_1179327 ) ) ( not ( = ?auto_1179324 ?auto_1179329 ) ) ( not ( = ?auto_1179324 ?auto_1179330 ) ) ( not ( = ?auto_1179324 ?auto_1179331 ) ) ( not ( = ?auto_1179325 ?auto_1179326 ) ) ( not ( = ?auto_1179325 ?auto_1179328 ) ) ( not ( = ?auto_1179325 ?auto_1179327 ) ) ( not ( = ?auto_1179325 ?auto_1179329 ) ) ( not ( = ?auto_1179325 ?auto_1179330 ) ) ( not ( = ?auto_1179325 ?auto_1179331 ) ) ( not ( = ?auto_1179326 ?auto_1179328 ) ) ( not ( = ?auto_1179326 ?auto_1179327 ) ) ( not ( = ?auto_1179326 ?auto_1179329 ) ) ( not ( = ?auto_1179326 ?auto_1179330 ) ) ( not ( = ?auto_1179326 ?auto_1179331 ) ) ( not ( = ?auto_1179328 ?auto_1179327 ) ) ( not ( = ?auto_1179328 ?auto_1179329 ) ) ( not ( = ?auto_1179328 ?auto_1179330 ) ) ( not ( = ?auto_1179328 ?auto_1179331 ) ) ( not ( = ?auto_1179327 ?auto_1179329 ) ) ( not ( = ?auto_1179327 ?auto_1179330 ) ) ( not ( = ?auto_1179327 ?auto_1179331 ) ) ( not ( = ?auto_1179329 ?auto_1179330 ) ) ( not ( = ?auto_1179329 ?auto_1179331 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1179330 ?auto_1179331 )
      ( MAKE-7CRATE-VERIFY ?auto_1179324 ?auto_1179325 ?auto_1179326 ?auto_1179328 ?auto_1179327 ?auto_1179329 ?auto_1179330 ?auto_1179331 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1179379 - SURFACE
      ?auto_1179380 - SURFACE
      ?auto_1179381 - SURFACE
      ?auto_1179383 - SURFACE
      ?auto_1179382 - SURFACE
      ?auto_1179384 - SURFACE
      ?auto_1179385 - SURFACE
      ?auto_1179386 - SURFACE
    )
    :vars
    (
      ?auto_1179388 - HOIST
      ?auto_1179389 - PLACE
      ?auto_1179387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1179388 ?auto_1179389 ) ( SURFACE-AT ?auto_1179385 ?auto_1179389 ) ( CLEAR ?auto_1179385 ) ( IS-CRATE ?auto_1179386 ) ( not ( = ?auto_1179385 ?auto_1179386 ) ) ( TRUCK-AT ?auto_1179387 ?auto_1179389 ) ( AVAILABLE ?auto_1179388 ) ( IN ?auto_1179386 ?auto_1179387 ) ( ON ?auto_1179385 ?auto_1179384 ) ( not ( = ?auto_1179384 ?auto_1179385 ) ) ( not ( = ?auto_1179384 ?auto_1179386 ) ) ( ON ?auto_1179380 ?auto_1179379 ) ( ON ?auto_1179381 ?auto_1179380 ) ( ON ?auto_1179383 ?auto_1179381 ) ( ON ?auto_1179382 ?auto_1179383 ) ( ON ?auto_1179384 ?auto_1179382 ) ( not ( = ?auto_1179379 ?auto_1179380 ) ) ( not ( = ?auto_1179379 ?auto_1179381 ) ) ( not ( = ?auto_1179379 ?auto_1179383 ) ) ( not ( = ?auto_1179379 ?auto_1179382 ) ) ( not ( = ?auto_1179379 ?auto_1179384 ) ) ( not ( = ?auto_1179379 ?auto_1179385 ) ) ( not ( = ?auto_1179379 ?auto_1179386 ) ) ( not ( = ?auto_1179380 ?auto_1179381 ) ) ( not ( = ?auto_1179380 ?auto_1179383 ) ) ( not ( = ?auto_1179380 ?auto_1179382 ) ) ( not ( = ?auto_1179380 ?auto_1179384 ) ) ( not ( = ?auto_1179380 ?auto_1179385 ) ) ( not ( = ?auto_1179380 ?auto_1179386 ) ) ( not ( = ?auto_1179381 ?auto_1179383 ) ) ( not ( = ?auto_1179381 ?auto_1179382 ) ) ( not ( = ?auto_1179381 ?auto_1179384 ) ) ( not ( = ?auto_1179381 ?auto_1179385 ) ) ( not ( = ?auto_1179381 ?auto_1179386 ) ) ( not ( = ?auto_1179383 ?auto_1179382 ) ) ( not ( = ?auto_1179383 ?auto_1179384 ) ) ( not ( = ?auto_1179383 ?auto_1179385 ) ) ( not ( = ?auto_1179383 ?auto_1179386 ) ) ( not ( = ?auto_1179382 ?auto_1179384 ) ) ( not ( = ?auto_1179382 ?auto_1179385 ) ) ( not ( = ?auto_1179382 ?auto_1179386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1179384 ?auto_1179385 ?auto_1179386 )
      ( MAKE-7CRATE-VERIFY ?auto_1179379 ?auto_1179380 ?auto_1179381 ?auto_1179383 ?auto_1179382 ?auto_1179384 ?auto_1179385 ?auto_1179386 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1179442 - SURFACE
      ?auto_1179443 - SURFACE
      ?auto_1179444 - SURFACE
      ?auto_1179446 - SURFACE
      ?auto_1179445 - SURFACE
      ?auto_1179447 - SURFACE
      ?auto_1179448 - SURFACE
      ?auto_1179449 - SURFACE
    )
    :vars
    (
      ?auto_1179450 - HOIST
      ?auto_1179453 - PLACE
      ?auto_1179451 - TRUCK
      ?auto_1179452 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1179450 ?auto_1179453 ) ( SURFACE-AT ?auto_1179448 ?auto_1179453 ) ( CLEAR ?auto_1179448 ) ( IS-CRATE ?auto_1179449 ) ( not ( = ?auto_1179448 ?auto_1179449 ) ) ( AVAILABLE ?auto_1179450 ) ( IN ?auto_1179449 ?auto_1179451 ) ( ON ?auto_1179448 ?auto_1179447 ) ( not ( = ?auto_1179447 ?auto_1179448 ) ) ( not ( = ?auto_1179447 ?auto_1179449 ) ) ( TRUCK-AT ?auto_1179451 ?auto_1179452 ) ( not ( = ?auto_1179452 ?auto_1179453 ) ) ( ON ?auto_1179443 ?auto_1179442 ) ( ON ?auto_1179444 ?auto_1179443 ) ( ON ?auto_1179446 ?auto_1179444 ) ( ON ?auto_1179445 ?auto_1179446 ) ( ON ?auto_1179447 ?auto_1179445 ) ( not ( = ?auto_1179442 ?auto_1179443 ) ) ( not ( = ?auto_1179442 ?auto_1179444 ) ) ( not ( = ?auto_1179442 ?auto_1179446 ) ) ( not ( = ?auto_1179442 ?auto_1179445 ) ) ( not ( = ?auto_1179442 ?auto_1179447 ) ) ( not ( = ?auto_1179442 ?auto_1179448 ) ) ( not ( = ?auto_1179442 ?auto_1179449 ) ) ( not ( = ?auto_1179443 ?auto_1179444 ) ) ( not ( = ?auto_1179443 ?auto_1179446 ) ) ( not ( = ?auto_1179443 ?auto_1179445 ) ) ( not ( = ?auto_1179443 ?auto_1179447 ) ) ( not ( = ?auto_1179443 ?auto_1179448 ) ) ( not ( = ?auto_1179443 ?auto_1179449 ) ) ( not ( = ?auto_1179444 ?auto_1179446 ) ) ( not ( = ?auto_1179444 ?auto_1179445 ) ) ( not ( = ?auto_1179444 ?auto_1179447 ) ) ( not ( = ?auto_1179444 ?auto_1179448 ) ) ( not ( = ?auto_1179444 ?auto_1179449 ) ) ( not ( = ?auto_1179446 ?auto_1179445 ) ) ( not ( = ?auto_1179446 ?auto_1179447 ) ) ( not ( = ?auto_1179446 ?auto_1179448 ) ) ( not ( = ?auto_1179446 ?auto_1179449 ) ) ( not ( = ?auto_1179445 ?auto_1179447 ) ) ( not ( = ?auto_1179445 ?auto_1179448 ) ) ( not ( = ?auto_1179445 ?auto_1179449 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1179447 ?auto_1179448 ?auto_1179449 )
      ( MAKE-7CRATE-VERIFY ?auto_1179442 ?auto_1179443 ?auto_1179444 ?auto_1179446 ?auto_1179445 ?auto_1179447 ?auto_1179448 ?auto_1179449 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1179512 - SURFACE
      ?auto_1179513 - SURFACE
      ?auto_1179514 - SURFACE
      ?auto_1179516 - SURFACE
      ?auto_1179515 - SURFACE
      ?auto_1179517 - SURFACE
      ?auto_1179518 - SURFACE
      ?auto_1179519 - SURFACE
    )
    :vars
    (
      ?auto_1179521 - HOIST
      ?auto_1179520 - PLACE
      ?auto_1179522 - TRUCK
      ?auto_1179523 - PLACE
      ?auto_1179524 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1179521 ?auto_1179520 ) ( SURFACE-AT ?auto_1179518 ?auto_1179520 ) ( CLEAR ?auto_1179518 ) ( IS-CRATE ?auto_1179519 ) ( not ( = ?auto_1179518 ?auto_1179519 ) ) ( AVAILABLE ?auto_1179521 ) ( ON ?auto_1179518 ?auto_1179517 ) ( not ( = ?auto_1179517 ?auto_1179518 ) ) ( not ( = ?auto_1179517 ?auto_1179519 ) ) ( TRUCK-AT ?auto_1179522 ?auto_1179523 ) ( not ( = ?auto_1179523 ?auto_1179520 ) ) ( HOIST-AT ?auto_1179524 ?auto_1179523 ) ( LIFTING ?auto_1179524 ?auto_1179519 ) ( not ( = ?auto_1179521 ?auto_1179524 ) ) ( ON ?auto_1179513 ?auto_1179512 ) ( ON ?auto_1179514 ?auto_1179513 ) ( ON ?auto_1179516 ?auto_1179514 ) ( ON ?auto_1179515 ?auto_1179516 ) ( ON ?auto_1179517 ?auto_1179515 ) ( not ( = ?auto_1179512 ?auto_1179513 ) ) ( not ( = ?auto_1179512 ?auto_1179514 ) ) ( not ( = ?auto_1179512 ?auto_1179516 ) ) ( not ( = ?auto_1179512 ?auto_1179515 ) ) ( not ( = ?auto_1179512 ?auto_1179517 ) ) ( not ( = ?auto_1179512 ?auto_1179518 ) ) ( not ( = ?auto_1179512 ?auto_1179519 ) ) ( not ( = ?auto_1179513 ?auto_1179514 ) ) ( not ( = ?auto_1179513 ?auto_1179516 ) ) ( not ( = ?auto_1179513 ?auto_1179515 ) ) ( not ( = ?auto_1179513 ?auto_1179517 ) ) ( not ( = ?auto_1179513 ?auto_1179518 ) ) ( not ( = ?auto_1179513 ?auto_1179519 ) ) ( not ( = ?auto_1179514 ?auto_1179516 ) ) ( not ( = ?auto_1179514 ?auto_1179515 ) ) ( not ( = ?auto_1179514 ?auto_1179517 ) ) ( not ( = ?auto_1179514 ?auto_1179518 ) ) ( not ( = ?auto_1179514 ?auto_1179519 ) ) ( not ( = ?auto_1179516 ?auto_1179515 ) ) ( not ( = ?auto_1179516 ?auto_1179517 ) ) ( not ( = ?auto_1179516 ?auto_1179518 ) ) ( not ( = ?auto_1179516 ?auto_1179519 ) ) ( not ( = ?auto_1179515 ?auto_1179517 ) ) ( not ( = ?auto_1179515 ?auto_1179518 ) ) ( not ( = ?auto_1179515 ?auto_1179519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1179517 ?auto_1179518 ?auto_1179519 )
      ( MAKE-7CRATE-VERIFY ?auto_1179512 ?auto_1179513 ?auto_1179514 ?auto_1179516 ?auto_1179515 ?auto_1179517 ?auto_1179518 ?auto_1179519 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1179589 - SURFACE
      ?auto_1179590 - SURFACE
      ?auto_1179591 - SURFACE
      ?auto_1179593 - SURFACE
      ?auto_1179592 - SURFACE
      ?auto_1179594 - SURFACE
      ?auto_1179595 - SURFACE
      ?auto_1179596 - SURFACE
    )
    :vars
    (
      ?auto_1179597 - HOIST
      ?auto_1179598 - PLACE
      ?auto_1179601 - TRUCK
      ?auto_1179599 - PLACE
      ?auto_1179600 - HOIST
      ?auto_1179602 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1179597 ?auto_1179598 ) ( SURFACE-AT ?auto_1179595 ?auto_1179598 ) ( CLEAR ?auto_1179595 ) ( IS-CRATE ?auto_1179596 ) ( not ( = ?auto_1179595 ?auto_1179596 ) ) ( AVAILABLE ?auto_1179597 ) ( ON ?auto_1179595 ?auto_1179594 ) ( not ( = ?auto_1179594 ?auto_1179595 ) ) ( not ( = ?auto_1179594 ?auto_1179596 ) ) ( TRUCK-AT ?auto_1179601 ?auto_1179599 ) ( not ( = ?auto_1179599 ?auto_1179598 ) ) ( HOIST-AT ?auto_1179600 ?auto_1179599 ) ( not ( = ?auto_1179597 ?auto_1179600 ) ) ( AVAILABLE ?auto_1179600 ) ( SURFACE-AT ?auto_1179596 ?auto_1179599 ) ( ON ?auto_1179596 ?auto_1179602 ) ( CLEAR ?auto_1179596 ) ( not ( = ?auto_1179595 ?auto_1179602 ) ) ( not ( = ?auto_1179596 ?auto_1179602 ) ) ( not ( = ?auto_1179594 ?auto_1179602 ) ) ( ON ?auto_1179590 ?auto_1179589 ) ( ON ?auto_1179591 ?auto_1179590 ) ( ON ?auto_1179593 ?auto_1179591 ) ( ON ?auto_1179592 ?auto_1179593 ) ( ON ?auto_1179594 ?auto_1179592 ) ( not ( = ?auto_1179589 ?auto_1179590 ) ) ( not ( = ?auto_1179589 ?auto_1179591 ) ) ( not ( = ?auto_1179589 ?auto_1179593 ) ) ( not ( = ?auto_1179589 ?auto_1179592 ) ) ( not ( = ?auto_1179589 ?auto_1179594 ) ) ( not ( = ?auto_1179589 ?auto_1179595 ) ) ( not ( = ?auto_1179589 ?auto_1179596 ) ) ( not ( = ?auto_1179589 ?auto_1179602 ) ) ( not ( = ?auto_1179590 ?auto_1179591 ) ) ( not ( = ?auto_1179590 ?auto_1179593 ) ) ( not ( = ?auto_1179590 ?auto_1179592 ) ) ( not ( = ?auto_1179590 ?auto_1179594 ) ) ( not ( = ?auto_1179590 ?auto_1179595 ) ) ( not ( = ?auto_1179590 ?auto_1179596 ) ) ( not ( = ?auto_1179590 ?auto_1179602 ) ) ( not ( = ?auto_1179591 ?auto_1179593 ) ) ( not ( = ?auto_1179591 ?auto_1179592 ) ) ( not ( = ?auto_1179591 ?auto_1179594 ) ) ( not ( = ?auto_1179591 ?auto_1179595 ) ) ( not ( = ?auto_1179591 ?auto_1179596 ) ) ( not ( = ?auto_1179591 ?auto_1179602 ) ) ( not ( = ?auto_1179593 ?auto_1179592 ) ) ( not ( = ?auto_1179593 ?auto_1179594 ) ) ( not ( = ?auto_1179593 ?auto_1179595 ) ) ( not ( = ?auto_1179593 ?auto_1179596 ) ) ( not ( = ?auto_1179593 ?auto_1179602 ) ) ( not ( = ?auto_1179592 ?auto_1179594 ) ) ( not ( = ?auto_1179592 ?auto_1179595 ) ) ( not ( = ?auto_1179592 ?auto_1179596 ) ) ( not ( = ?auto_1179592 ?auto_1179602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1179594 ?auto_1179595 ?auto_1179596 )
      ( MAKE-7CRATE-VERIFY ?auto_1179589 ?auto_1179590 ?auto_1179591 ?auto_1179593 ?auto_1179592 ?auto_1179594 ?auto_1179595 ?auto_1179596 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1179667 - SURFACE
      ?auto_1179668 - SURFACE
      ?auto_1179669 - SURFACE
      ?auto_1179671 - SURFACE
      ?auto_1179670 - SURFACE
      ?auto_1179672 - SURFACE
      ?auto_1179673 - SURFACE
      ?auto_1179674 - SURFACE
    )
    :vars
    (
      ?auto_1179680 - HOIST
      ?auto_1179679 - PLACE
      ?auto_1179675 - PLACE
      ?auto_1179678 - HOIST
      ?auto_1179677 - SURFACE
      ?auto_1179676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1179680 ?auto_1179679 ) ( SURFACE-AT ?auto_1179673 ?auto_1179679 ) ( CLEAR ?auto_1179673 ) ( IS-CRATE ?auto_1179674 ) ( not ( = ?auto_1179673 ?auto_1179674 ) ) ( AVAILABLE ?auto_1179680 ) ( ON ?auto_1179673 ?auto_1179672 ) ( not ( = ?auto_1179672 ?auto_1179673 ) ) ( not ( = ?auto_1179672 ?auto_1179674 ) ) ( not ( = ?auto_1179675 ?auto_1179679 ) ) ( HOIST-AT ?auto_1179678 ?auto_1179675 ) ( not ( = ?auto_1179680 ?auto_1179678 ) ) ( AVAILABLE ?auto_1179678 ) ( SURFACE-AT ?auto_1179674 ?auto_1179675 ) ( ON ?auto_1179674 ?auto_1179677 ) ( CLEAR ?auto_1179674 ) ( not ( = ?auto_1179673 ?auto_1179677 ) ) ( not ( = ?auto_1179674 ?auto_1179677 ) ) ( not ( = ?auto_1179672 ?auto_1179677 ) ) ( TRUCK-AT ?auto_1179676 ?auto_1179679 ) ( ON ?auto_1179668 ?auto_1179667 ) ( ON ?auto_1179669 ?auto_1179668 ) ( ON ?auto_1179671 ?auto_1179669 ) ( ON ?auto_1179670 ?auto_1179671 ) ( ON ?auto_1179672 ?auto_1179670 ) ( not ( = ?auto_1179667 ?auto_1179668 ) ) ( not ( = ?auto_1179667 ?auto_1179669 ) ) ( not ( = ?auto_1179667 ?auto_1179671 ) ) ( not ( = ?auto_1179667 ?auto_1179670 ) ) ( not ( = ?auto_1179667 ?auto_1179672 ) ) ( not ( = ?auto_1179667 ?auto_1179673 ) ) ( not ( = ?auto_1179667 ?auto_1179674 ) ) ( not ( = ?auto_1179667 ?auto_1179677 ) ) ( not ( = ?auto_1179668 ?auto_1179669 ) ) ( not ( = ?auto_1179668 ?auto_1179671 ) ) ( not ( = ?auto_1179668 ?auto_1179670 ) ) ( not ( = ?auto_1179668 ?auto_1179672 ) ) ( not ( = ?auto_1179668 ?auto_1179673 ) ) ( not ( = ?auto_1179668 ?auto_1179674 ) ) ( not ( = ?auto_1179668 ?auto_1179677 ) ) ( not ( = ?auto_1179669 ?auto_1179671 ) ) ( not ( = ?auto_1179669 ?auto_1179670 ) ) ( not ( = ?auto_1179669 ?auto_1179672 ) ) ( not ( = ?auto_1179669 ?auto_1179673 ) ) ( not ( = ?auto_1179669 ?auto_1179674 ) ) ( not ( = ?auto_1179669 ?auto_1179677 ) ) ( not ( = ?auto_1179671 ?auto_1179670 ) ) ( not ( = ?auto_1179671 ?auto_1179672 ) ) ( not ( = ?auto_1179671 ?auto_1179673 ) ) ( not ( = ?auto_1179671 ?auto_1179674 ) ) ( not ( = ?auto_1179671 ?auto_1179677 ) ) ( not ( = ?auto_1179670 ?auto_1179672 ) ) ( not ( = ?auto_1179670 ?auto_1179673 ) ) ( not ( = ?auto_1179670 ?auto_1179674 ) ) ( not ( = ?auto_1179670 ?auto_1179677 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1179672 ?auto_1179673 ?auto_1179674 )
      ( MAKE-7CRATE-VERIFY ?auto_1179667 ?auto_1179668 ?auto_1179669 ?auto_1179671 ?auto_1179670 ?auto_1179672 ?auto_1179673 ?auto_1179674 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1179745 - SURFACE
      ?auto_1179746 - SURFACE
      ?auto_1179747 - SURFACE
      ?auto_1179749 - SURFACE
      ?auto_1179748 - SURFACE
      ?auto_1179750 - SURFACE
      ?auto_1179751 - SURFACE
      ?auto_1179752 - SURFACE
    )
    :vars
    (
      ?auto_1179756 - HOIST
      ?auto_1179753 - PLACE
      ?auto_1179757 - PLACE
      ?auto_1179758 - HOIST
      ?auto_1179754 - SURFACE
      ?auto_1179755 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1179756 ?auto_1179753 ) ( IS-CRATE ?auto_1179752 ) ( not ( = ?auto_1179751 ?auto_1179752 ) ) ( not ( = ?auto_1179750 ?auto_1179751 ) ) ( not ( = ?auto_1179750 ?auto_1179752 ) ) ( not ( = ?auto_1179757 ?auto_1179753 ) ) ( HOIST-AT ?auto_1179758 ?auto_1179757 ) ( not ( = ?auto_1179756 ?auto_1179758 ) ) ( AVAILABLE ?auto_1179758 ) ( SURFACE-AT ?auto_1179752 ?auto_1179757 ) ( ON ?auto_1179752 ?auto_1179754 ) ( CLEAR ?auto_1179752 ) ( not ( = ?auto_1179751 ?auto_1179754 ) ) ( not ( = ?auto_1179752 ?auto_1179754 ) ) ( not ( = ?auto_1179750 ?auto_1179754 ) ) ( TRUCK-AT ?auto_1179755 ?auto_1179753 ) ( SURFACE-AT ?auto_1179750 ?auto_1179753 ) ( CLEAR ?auto_1179750 ) ( LIFTING ?auto_1179756 ?auto_1179751 ) ( IS-CRATE ?auto_1179751 ) ( ON ?auto_1179746 ?auto_1179745 ) ( ON ?auto_1179747 ?auto_1179746 ) ( ON ?auto_1179749 ?auto_1179747 ) ( ON ?auto_1179748 ?auto_1179749 ) ( ON ?auto_1179750 ?auto_1179748 ) ( not ( = ?auto_1179745 ?auto_1179746 ) ) ( not ( = ?auto_1179745 ?auto_1179747 ) ) ( not ( = ?auto_1179745 ?auto_1179749 ) ) ( not ( = ?auto_1179745 ?auto_1179748 ) ) ( not ( = ?auto_1179745 ?auto_1179750 ) ) ( not ( = ?auto_1179745 ?auto_1179751 ) ) ( not ( = ?auto_1179745 ?auto_1179752 ) ) ( not ( = ?auto_1179745 ?auto_1179754 ) ) ( not ( = ?auto_1179746 ?auto_1179747 ) ) ( not ( = ?auto_1179746 ?auto_1179749 ) ) ( not ( = ?auto_1179746 ?auto_1179748 ) ) ( not ( = ?auto_1179746 ?auto_1179750 ) ) ( not ( = ?auto_1179746 ?auto_1179751 ) ) ( not ( = ?auto_1179746 ?auto_1179752 ) ) ( not ( = ?auto_1179746 ?auto_1179754 ) ) ( not ( = ?auto_1179747 ?auto_1179749 ) ) ( not ( = ?auto_1179747 ?auto_1179748 ) ) ( not ( = ?auto_1179747 ?auto_1179750 ) ) ( not ( = ?auto_1179747 ?auto_1179751 ) ) ( not ( = ?auto_1179747 ?auto_1179752 ) ) ( not ( = ?auto_1179747 ?auto_1179754 ) ) ( not ( = ?auto_1179749 ?auto_1179748 ) ) ( not ( = ?auto_1179749 ?auto_1179750 ) ) ( not ( = ?auto_1179749 ?auto_1179751 ) ) ( not ( = ?auto_1179749 ?auto_1179752 ) ) ( not ( = ?auto_1179749 ?auto_1179754 ) ) ( not ( = ?auto_1179748 ?auto_1179750 ) ) ( not ( = ?auto_1179748 ?auto_1179751 ) ) ( not ( = ?auto_1179748 ?auto_1179752 ) ) ( not ( = ?auto_1179748 ?auto_1179754 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1179750 ?auto_1179751 ?auto_1179752 )
      ( MAKE-7CRATE-VERIFY ?auto_1179745 ?auto_1179746 ?auto_1179747 ?auto_1179749 ?auto_1179748 ?auto_1179750 ?auto_1179751 ?auto_1179752 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1179823 - SURFACE
      ?auto_1179824 - SURFACE
      ?auto_1179825 - SURFACE
      ?auto_1179827 - SURFACE
      ?auto_1179826 - SURFACE
      ?auto_1179828 - SURFACE
      ?auto_1179829 - SURFACE
      ?auto_1179830 - SURFACE
    )
    :vars
    (
      ?auto_1179831 - HOIST
      ?auto_1179836 - PLACE
      ?auto_1179832 - PLACE
      ?auto_1179835 - HOIST
      ?auto_1179833 - SURFACE
      ?auto_1179834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1179831 ?auto_1179836 ) ( IS-CRATE ?auto_1179830 ) ( not ( = ?auto_1179829 ?auto_1179830 ) ) ( not ( = ?auto_1179828 ?auto_1179829 ) ) ( not ( = ?auto_1179828 ?auto_1179830 ) ) ( not ( = ?auto_1179832 ?auto_1179836 ) ) ( HOIST-AT ?auto_1179835 ?auto_1179832 ) ( not ( = ?auto_1179831 ?auto_1179835 ) ) ( AVAILABLE ?auto_1179835 ) ( SURFACE-AT ?auto_1179830 ?auto_1179832 ) ( ON ?auto_1179830 ?auto_1179833 ) ( CLEAR ?auto_1179830 ) ( not ( = ?auto_1179829 ?auto_1179833 ) ) ( not ( = ?auto_1179830 ?auto_1179833 ) ) ( not ( = ?auto_1179828 ?auto_1179833 ) ) ( TRUCK-AT ?auto_1179834 ?auto_1179836 ) ( SURFACE-AT ?auto_1179828 ?auto_1179836 ) ( CLEAR ?auto_1179828 ) ( IS-CRATE ?auto_1179829 ) ( AVAILABLE ?auto_1179831 ) ( IN ?auto_1179829 ?auto_1179834 ) ( ON ?auto_1179824 ?auto_1179823 ) ( ON ?auto_1179825 ?auto_1179824 ) ( ON ?auto_1179827 ?auto_1179825 ) ( ON ?auto_1179826 ?auto_1179827 ) ( ON ?auto_1179828 ?auto_1179826 ) ( not ( = ?auto_1179823 ?auto_1179824 ) ) ( not ( = ?auto_1179823 ?auto_1179825 ) ) ( not ( = ?auto_1179823 ?auto_1179827 ) ) ( not ( = ?auto_1179823 ?auto_1179826 ) ) ( not ( = ?auto_1179823 ?auto_1179828 ) ) ( not ( = ?auto_1179823 ?auto_1179829 ) ) ( not ( = ?auto_1179823 ?auto_1179830 ) ) ( not ( = ?auto_1179823 ?auto_1179833 ) ) ( not ( = ?auto_1179824 ?auto_1179825 ) ) ( not ( = ?auto_1179824 ?auto_1179827 ) ) ( not ( = ?auto_1179824 ?auto_1179826 ) ) ( not ( = ?auto_1179824 ?auto_1179828 ) ) ( not ( = ?auto_1179824 ?auto_1179829 ) ) ( not ( = ?auto_1179824 ?auto_1179830 ) ) ( not ( = ?auto_1179824 ?auto_1179833 ) ) ( not ( = ?auto_1179825 ?auto_1179827 ) ) ( not ( = ?auto_1179825 ?auto_1179826 ) ) ( not ( = ?auto_1179825 ?auto_1179828 ) ) ( not ( = ?auto_1179825 ?auto_1179829 ) ) ( not ( = ?auto_1179825 ?auto_1179830 ) ) ( not ( = ?auto_1179825 ?auto_1179833 ) ) ( not ( = ?auto_1179827 ?auto_1179826 ) ) ( not ( = ?auto_1179827 ?auto_1179828 ) ) ( not ( = ?auto_1179827 ?auto_1179829 ) ) ( not ( = ?auto_1179827 ?auto_1179830 ) ) ( not ( = ?auto_1179827 ?auto_1179833 ) ) ( not ( = ?auto_1179826 ?auto_1179828 ) ) ( not ( = ?auto_1179826 ?auto_1179829 ) ) ( not ( = ?auto_1179826 ?auto_1179830 ) ) ( not ( = ?auto_1179826 ?auto_1179833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1179828 ?auto_1179829 ?auto_1179830 )
      ( MAKE-7CRATE-VERIFY ?auto_1179823 ?auto_1179824 ?auto_1179825 ?auto_1179827 ?auto_1179826 ?auto_1179828 ?auto_1179829 ?auto_1179830 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1182742 - SURFACE
      ?auto_1182743 - SURFACE
      ?auto_1182744 - SURFACE
      ?auto_1182746 - SURFACE
      ?auto_1182745 - SURFACE
      ?auto_1182747 - SURFACE
      ?auto_1182748 - SURFACE
      ?auto_1182749 - SURFACE
      ?auto_1182750 - SURFACE
    )
    :vars
    (
      ?auto_1182751 - HOIST
      ?auto_1182752 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1182751 ?auto_1182752 ) ( SURFACE-AT ?auto_1182749 ?auto_1182752 ) ( CLEAR ?auto_1182749 ) ( LIFTING ?auto_1182751 ?auto_1182750 ) ( IS-CRATE ?auto_1182750 ) ( not ( = ?auto_1182749 ?auto_1182750 ) ) ( ON ?auto_1182743 ?auto_1182742 ) ( ON ?auto_1182744 ?auto_1182743 ) ( ON ?auto_1182746 ?auto_1182744 ) ( ON ?auto_1182745 ?auto_1182746 ) ( ON ?auto_1182747 ?auto_1182745 ) ( ON ?auto_1182748 ?auto_1182747 ) ( ON ?auto_1182749 ?auto_1182748 ) ( not ( = ?auto_1182742 ?auto_1182743 ) ) ( not ( = ?auto_1182742 ?auto_1182744 ) ) ( not ( = ?auto_1182742 ?auto_1182746 ) ) ( not ( = ?auto_1182742 ?auto_1182745 ) ) ( not ( = ?auto_1182742 ?auto_1182747 ) ) ( not ( = ?auto_1182742 ?auto_1182748 ) ) ( not ( = ?auto_1182742 ?auto_1182749 ) ) ( not ( = ?auto_1182742 ?auto_1182750 ) ) ( not ( = ?auto_1182743 ?auto_1182744 ) ) ( not ( = ?auto_1182743 ?auto_1182746 ) ) ( not ( = ?auto_1182743 ?auto_1182745 ) ) ( not ( = ?auto_1182743 ?auto_1182747 ) ) ( not ( = ?auto_1182743 ?auto_1182748 ) ) ( not ( = ?auto_1182743 ?auto_1182749 ) ) ( not ( = ?auto_1182743 ?auto_1182750 ) ) ( not ( = ?auto_1182744 ?auto_1182746 ) ) ( not ( = ?auto_1182744 ?auto_1182745 ) ) ( not ( = ?auto_1182744 ?auto_1182747 ) ) ( not ( = ?auto_1182744 ?auto_1182748 ) ) ( not ( = ?auto_1182744 ?auto_1182749 ) ) ( not ( = ?auto_1182744 ?auto_1182750 ) ) ( not ( = ?auto_1182746 ?auto_1182745 ) ) ( not ( = ?auto_1182746 ?auto_1182747 ) ) ( not ( = ?auto_1182746 ?auto_1182748 ) ) ( not ( = ?auto_1182746 ?auto_1182749 ) ) ( not ( = ?auto_1182746 ?auto_1182750 ) ) ( not ( = ?auto_1182745 ?auto_1182747 ) ) ( not ( = ?auto_1182745 ?auto_1182748 ) ) ( not ( = ?auto_1182745 ?auto_1182749 ) ) ( not ( = ?auto_1182745 ?auto_1182750 ) ) ( not ( = ?auto_1182747 ?auto_1182748 ) ) ( not ( = ?auto_1182747 ?auto_1182749 ) ) ( not ( = ?auto_1182747 ?auto_1182750 ) ) ( not ( = ?auto_1182748 ?auto_1182749 ) ) ( not ( = ?auto_1182748 ?auto_1182750 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1182749 ?auto_1182750 )
      ( MAKE-8CRATE-VERIFY ?auto_1182742 ?auto_1182743 ?auto_1182744 ?auto_1182746 ?auto_1182745 ?auto_1182747 ?auto_1182748 ?auto_1182749 ?auto_1182750 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1182809 - SURFACE
      ?auto_1182810 - SURFACE
      ?auto_1182811 - SURFACE
      ?auto_1182813 - SURFACE
      ?auto_1182812 - SURFACE
      ?auto_1182814 - SURFACE
      ?auto_1182815 - SURFACE
      ?auto_1182816 - SURFACE
      ?auto_1182817 - SURFACE
    )
    :vars
    (
      ?auto_1182819 - HOIST
      ?auto_1182818 - PLACE
      ?auto_1182820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1182819 ?auto_1182818 ) ( SURFACE-AT ?auto_1182816 ?auto_1182818 ) ( CLEAR ?auto_1182816 ) ( IS-CRATE ?auto_1182817 ) ( not ( = ?auto_1182816 ?auto_1182817 ) ) ( TRUCK-AT ?auto_1182820 ?auto_1182818 ) ( AVAILABLE ?auto_1182819 ) ( IN ?auto_1182817 ?auto_1182820 ) ( ON ?auto_1182816 ?auto_1182815 ) ( not ( = ?auto_1182815 ?auto_1182816 ) ) ( not ( = ?auto_1182815 ?auto_1182817 ) ) ( ON ?auto_1182810 ?auto_1182809 ) ( ON ?auto_1182811 ?auto_1182810 ) ( ON ?auto_1182813 ?auto_1182811 ) ( ON ?auto_1182812 ?auto_1182813 ) ( ON ?auto_1182814 ?auto_1182812 ) ( ON ?auto_1182815 ?auto_1182814 ) ( not ( = ?auto_1182809 ?auto_1182810 ) ) ( not ( = ?auto_1182809 ?auto_1182811 ) ) ( not ( = ?auto_1182809 ?auto_1182813 ) ) ( not ( = ?auto_1182809 ?auto_1182812 ) ) ( not ( = ?auto_1182809 ?auto_1182814 ) ) ( not ( = ?auto_1182809 ?auto_1182815 ) ) ( not ( = ?auto_1182809 ?auto_1182816 ) ) ( not ( = ?auto_1182809 ?auto_1182817 ) ) ( not ( = ?auto_1182810 ?auto_1182811 ) ) ( not ( = ?auto_1182810 ?auto_1182813 ) ) ( not ( = ?auto_1182810 ?auto_1182812 ) ) ( not ( = ?auto_1182810 ?auto_1182814 ) ) ( not ( = ?auto_1182810 ?auto_1182815 ) ) ( not ( = ?auto_1182810 ?auto_1182816 ) ) ( not ( = ?auto_1182810 ?auto_1182817 ) ) ( not ( = ?auto_1182811 ?auto_1182813 ) ) ( not ( = ?auto_1182811 ?auto_1182812 ) ) ( not ( = ?auto_1182811 ?auto_1182814 ) ) ( not ( = ?auto_1182811 ?auto_1182815 ) ) ( not ( = ?auto_1182811 ?auto_1182816 ) ) ( not ( = ?auto_1182811 ?auto_1182817 ) ) ( not ( = ?auto_1182813 ?auto_1182812 ) ) ( not ( = ?auto_1182813 ?auto_1182814 ) ) ( not ( = ?auto_1182813 ?auto_1182815 ) ) ( not ( = ?auto_1182813 ?auto_1182816 ) ) ( not ( = ?auto_1182813 ?auto_1182817 ) ) ( not ( = ?auto_1182812 ?auto_1182814 ) ) ( not ( = ?auto_1182812 ?auto_1182815 ) ) ( not ( = ?auto_1182812 ?auto_1182816 ) ) ( not ( = ?auto_1182812 ?auto_1182817 ) ) ( not ( = ?auto_1182814 ?auto_1182815 ) ) ( not ( = ?auto_1182814 ?auto_1182816 ) ) ( not ( = ?auto_1182814 ?auto_1182817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1182815 ?auto_1182816 ?auto_1182817 )
      ( MAKE-8CRATE-VERIFY ?auto_1182809 ?auto_1182810 ?auto_1182811 ?auto_1182813 ?auto_1182812 ?auto_1182814 ?auto_1182815 ?auto_1182816 ?auto_1182817 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1182885 - SURFACE
      ?auto_1182886 - SURFACE
      ?auto_1182887 - SURFACE
      ?auto_1182889 - SURFACE
      ?auto_1182888 - SURFACE
      ?auto_1182890 - SURFACE
      ?auto_1182891 - SURFACE
      ?auto_1182892 - SURFACE
      ?auto_1182893 - SURFACE
    )
    :vars
    (
      ?auto_1182894 - HOIST
      ?auto_1182895 - PLACE
      ?auto_1182896 - TRUCK
      ?auto_1182897 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1182894 ?auto_1182895 ) ( SURFACE-AT ?auto_1182892 ?auto_1182895 ) ( CLEAR ?auto_1182892 ) ( IS-CRATE ?auto_1182893 ) ( not ( = ?auto_1182892 ?auto_1182893 ) ) ( AVAILABLE ?auto_1182894 ) ( IN ?auto_1182893 ?auto_1182896 ) ( ON ?auto_1182892 ?auto_1182891 ) ( not ( = ?auto_1182891 ?auto_1182892 ) ) ( not ( = ?auto_1182891 ?auto_1182893 ) ) ( TRUCK-AT ?auto_1182896 ?auto_1182897 ) ( not ( = ?auto_1182897 ?auto_1182895 ) ) ( ON ?auto_1182886 ?auto_1182885 ) ( ON ?auto_1182887 ?auto_1182886 ) ( ON ?auto_1182889 ?auto_1182887 ) ( ON ?auto_1182888 ?auto_1182889 ) ( ON ?auto_1182890 ?auto_1182888 ) ( ON ?auto_1182891 ?auto_1182890 ) ( not ( = ?auto_1182885 ?auto_1182886 ) ) ( not ( = ?auto_1182885 ?auto_1182887 ) ) ( not ( = ?auto_1182885 ?auto_1182889 ) ) ( not ( = ?auto_1182885 ?auto_1182888 ) ) ( not ( = ?auto_1182885 ?auto_1182890 ) ) ( not ( = ?auto_1182885 ?auto_1182891 ) ) ( not ( = ?auto_1182885 ?auto_1182892 ) ) ( not ( = ?auto_1182885 ?auto_1182893 ) ) ( not ( = ?auto_1182886 ?auto_1182887 ) ) ( not ( = ?auto_1182886 ?auto_1182889 ) ) ( not ( = ?auto_1182886 ?auto_1182888 ) ) ( not ( = ?auto_1182886 ?auto_1182890 ) ) ( not ( = ?auto_1182886 ?auto_1182891 ) ) ( not ( = ?auto_1182886 ?auto_1182892 ) ) ( not ( = ?auto_1182886 ?auto_1182893 ) ) ( not ( = ?auto_1182887 ?auto_1182889 ) ) ( not ( = ?auto_1182887 ?auto_1182888 ) ) ( not ( = ?auto_1182887 ?auto_1182890 ) ) ( not ( = ?auto_1182887 ?auto_1182891 ) ) ( not ( = ?auto_1182887 ?auto_1182892 ) ) ( not ( = ?auto_1182887 ?auto_1182893 ) ) ( not ( = ?auto_1182889 ?auto_1182888 ) ) ( not ( = ?auto_1182889 ?auto_1182890 ) ) ( not ( = ?auto_1182889 ?auto_1182891 ) ) ( not ( = ?auto_1182889 ?auto_1182892 ) ) ( not ( = ?auto_1182889 ?auto_1182893 ) ) ( not ( = ?auto_1182888 ?auto_1182890 ) ) ( not ( = ?auto_1182888 ?auto_1182891 ) ) ( not ( = ?auto_1182888 ?auto_1182892 ) ) ( not ( = ?auto_1182888 ?auto_1182893 ) ) ( not ( = ?auto_1182890 ?auto_1182891 ) ) ( not ( = ?auto_1182890 ?auto_1182892 ) ) ( not ( = ?auto_1182890 ?auto_1182893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1182891 ?auto_1182892 ?auto_1182893 )
      ( MAKE-8CRATE-VERIFY ?auto_1182885 ?auto_1182886 ?auto_1182887 ?auto_1182889 ?auto_1182888 ?auto_1182890 ?auto_1182891 ?auto_1182892 ?auto_1182893 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1182969 - SURFACE
      ?auto_1182970 - SURFACE
      ?auto_1182971 - SURFACE
      ?auto_1182973 - SURFACE
      ?auto_1182972 - SURFACE
      ?auto_1182974 - SURFACE
      ?auto_1182975 - SURFACE
      ?auto_1182976 - SURFACE
      ?auto_1182977 - SURFACE
    )
    :vars
    (
      ?auto_1182979 - HOIST
      ?auto_1182981 - PLACE
      ?auto_1182980 - TRUCK
      ?auto_1182982 - PLACE
      ?auto_1182978 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1182979 ?auto_1182981 ) ( SURFACE-AT ?auto_1182976 ?auto_1182981 ) ( CLEAR ?auto_1182976 ) ( IS-CRATE ?auto_1182977 ) ( not ( = ?auto_1182976 ?auto_1182977 ) ) ( AVAILABLE ?auto_1182979 ) ( ON ?auto_1182976 ?auto_1182975 ) ( not ( = ?auto_1182975 ?auto_1182976 ) ) ( not ( = ?auto_1182975 ?auto_1182977 ) ) ( TRUCK-AT ?auto_1182980 ?auto_1182982 ) ( not ( = ?auto_1182982 ?auto_1182981 ) ) ( HOIST-AT ?auto_1182978 ?auto_1182982 ) ( LIFTING ?auto_1182978 ?auto_1182977 ) ( not ( = ?auto_1182979 ?auto_1182978 ) ) ( ON ?auto_1182970 ?auto_1182969 ) ( ON ?auto_1182971 ?auto_1182970 ) ( ON ?auto_1182973 ?auto_1182971 ) ( ON ?auto_1182972 ?auto_1182973 ) ( ON ?auto_1182974 ?auto_1182972 ) ( ON ?auto_1182975 ?auto_1182974 ) ( not ( = ?auto_1182969 ?auto_1182970 ) ) ( not ( = ?auto_1182969 ?auto_1182971 ) ) ( not ( = ?auto_1182969 ?auto_1182973 ) ) ( not ( = ?auto_1182969 ?auto_1182972 ) ) ( not ( = ?auto_1182969 ?auto_1182974 ) ) ( not ( = ?auto_1182969 ?auto_1182975 ) ) ( not ( = ?auto_1182969 ?auto_1182976 ) ) ( not ( = ?auto_1182969 ?auto_1182977 ) ) ( not ( = ?auto_1182970 ?auto_1182971 ) ) ( not ( = ?auto_1182970 ?auto_1182973 ) ) ( not ( = ?auto_1182970 ?auto_1182972 ) ) ( not ( = ?auto_1182970 ?auto_1182974 ) ) ( not ( = ?auto_1182970 ?auto_1182975 ) ) ( not ( = ?auto_1182970 ?auto_1182976 ) ) ( not ( = ?auto_1182970 ?auto_1182977 ) ) ( not ( = ?auto_1182971 ?auto_1182973 ) ) ( not ( = ?auto_1182971 ?auto_1182972 ) ) ( not ( = ?auto_1182971 ?auto_1182974 ) ) ( not ( = ?auto_1182971 ?auto_1182975 ) ) ( not ( = ?auto_1182971 ?auto_1182976 ) ) ( not ( = ?auto_1182971 ?auto_1182977 ) ) ( not ( = ?auto_1182973 ?auto_1182972 ) ) ( not ( = ?auto_1182973 ?auto_1182974 ) ) ( not ( = ?auto_1182973 ?auto_1182975 ) ) ( not ( = ?auto_1182973 ?auto_1182976 ) ) ( not ( = ?auto_1182973 ?auto_1182977 ) ) ( not ( = ?auto_1182972 ?auto_1182974 ) ) ( not ( = ?auto_1182972 ?auto_1182975 ) ) ( not ( = ?auto_1182972 ?auto_1182976 ) ) ( not ( = ?auto_1182972 ?auto_1182977 ) ) ( not ( = ?auto_1182974 ?auto_1182975 ) ) ( not ( = ?auto_1182974 ?auto_1182976 ) ) ( not ( = ?auto_1182974 ?auto_1182977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1182975 ?auto_1182976 ?auto_1182977 )
      ( MAKE-8CRATE-VERIFY ?auto_1182969 ?auto_1182970 ?auto_1182971 ?auto_1182973 ?auto_1182972 ?auto_1182974 ?auto_1182975 ?auto_1182976 ?auto_1182977 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1183061 - SURFACE
      ?auto_1183062 - SURFACE
      ?auto_1183063 - SURFACE
      ?auto_1183065 - SURFACE
      ?auto_1183064 - SURFACE
      ?auto_1183066 - SURFACE
      ?auto_1183067 - SURFACE
      ?auto_1183068 - SURFACE
      ?auto_1183069 - SURFACE
    )
    :vars
    (
      ?auto_1183072 - HOIST
      ?auto_1183075 - PLACE
      ?auto_1183073 - TRUCK
      ?auto_1183070 - PLACE
      ?auto_1183074 - HOIST
      ?auto_1183071 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1183072 ?auto_1183075 ) ( SURFACE-AT ?auto_1183068 ?auto_1183075 ) ( CLEAR ?auto_1183068 ) ( IS-CRATE ?auto_1183069 ) ( not ( = ?auto_1183068 ?auto_1183069 ) ) ( AVAILABLE ?auto_1183072 ) ( ON ?auto_1183068 ?auto_1183067 ) ( not ( = ?auto_1183067 ?auto_1183068 ) ) ( not ( = ?auto_1183067 ?auto_1183069 ) ) ( TRUCK-AT ?auto_1183073 ?auto_1183070 ) ( not ( = ?auto_1183070 ?auto_1183075 ) ) ( HOIST-AT ?auto_1183074 ?auto_1183070 ) ( not ( = ?auto_1183072 ?auto_1183074 ) ) ( AVAILABLE ?auto_1183074 ) ( SURFACE-AT ?auto_1183069 ?auto_1183070 ) ( ON ?auto_1183069 ?auto_1183071 ) ( CLEAR ?auto_1183069 ) ( not ( = ?auto_1183068 ?auto_1183071 ) ) ( not ( = ?auto_1183069 ?auto_1183071 ) ) ( not ( = ?auto_1183067 ?auto_1183071 ) ) ( ON ?auto_1183062 ?auto_1183061 ) ( ON ?auto_1183063 ?auto_1183062 ) ( ON ?auto_1183065 ?auto_1183063 ) ( ON ?auto_1183064 ?auto_1183065 ) ( ON ?auto_1183066 ?auto_1183064 ) ( ON ?auto_1183067 ?auto_1183066 ) ( not ( = ?auto_1183061 ?auto_1183062 ) ) ( not ( = ?auto_1183061 ?auto_1183063 ) ) ( not ( = ?auto_1183061 ?auto_1183065 ) ) ( not ( = ?auto_1183061 ?auto_1183064 ) ) ( not ( = ?auto_1183061 ?auto_1183066 ) ) ( not ( = ?auto_1183061 ?auto_1183067 ) ) ( not ( = ?auto_1183061 ?auto_1183068 ) ) ( not ( = ?auto_1183061 ?auto_1183069 ) ) ( not ( = ?auto_1183061 ?auto_1183071 ) ) ( not ( = ?auto_1183062 ?auto_1183063 ) ) ( not ( = ?auto_1183062 ?auto_1183065 ) ) ( not ( = ?auto_1183062 ?auto_1183064 ) ) ( not ( = ?auto_1183062 ?auto_1183066 ) ) ( not ( = ?auto_1183062 ?auto_1183067 ) ) ( not ( = ?auto_1183062 ?auto_1183068 ) ) ( not ( = ?auto_1183062 ?auto_1183069 ) ) ( not ( = ?auto_1183062 ?auto_1183071 ) ) ( not ( = ?auto_1183063 ?auto_1183065 ) ) ( not ( = ?auto_1183063 ?auto_1183064 ) ) ( not ( = ?auto_1183063 ?auto_1183066 ) ) ( not ( = ?auto_1183063 ?auto_1183067 ) ) ( not ( = ?auto_1183063 ?auto_1183068 ) ) ( not ( = ?auto_1183063 ?auto_1183069 ) ) ( not ( = ?auto_1183063 ?auto_1183071 ) ) ( not ( = ?auto_1183065 ?auto_1183064 ) ) ( not ( = ?auto_1183065 ?auto_1183066 ) ) ( not ( = ?auto_1183065 ?auto_1183067 ) ) ( not ( = ?auto_1183065 ?auto_1183068 ) ) ( not ( = ?auto_1183065 ?auto_1183069 ) ) ( not ( = ?auto_1183065 ?auto_1183071 ) ) ( not ( = ?auto_1183064 ?auto_1183066 ) ) ( not ( = ?auto_1183064 ?auto_1183067 ) ) ( not ( = ?auto_1183064 ?auto_1183068 ) ) ( not ( = ?auto_1183064 ?auto_1183069 ) ) ( not ( = ?auto_1183064 ?auto_1183071 ) ) ( not ( = ?auto_1183066 ?auto_1183067 ) ) ( not ( = ?auto_1183066 ?auto_1183068 ) ) ( not ( = ?auto_1183066 ?auto_1183069 ) ) ( not ( = ?auto_1183066 ?auto_1183071 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1183067 ?auto_1183068 ?auto_1183069 )
      ( MAKE-8CRATE-VERIFY ?auto_1183061 ?auto_1183062 ?auto_1183063 ?auto_1183065 ?auto_1183064 ?auto_1183066 ?auto_1183067 ?auto_1183068 ?auto_1183069 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1183154 - SURFACE
      ?auto_1183155 - SURFACE
      ?auto_1183156 - SURFACE
      ?auto_1183158 - SURFACE
      ?auto_1183157 - SURFACE
      ?auto_1183159 - SURFACE
      ?auto_1183160 - SURFACE
      ?auto_1183161 - SURFACE
      ?auto_1183162 - SURFACE
    )
    :vars
    (
      ?auto_1183164 - HOIST
      ?auto_1183165 - PLACE
      ?auto_1183167 - PLACE
      ?auto_1183166 - HOIST
      ?auto_1183163 - SURFACE
      ?auto_1183168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1183164 ?auto_1183165 ) ( SURFACE-AT ?auto_1183161 ?auto_1183165 ) ( CLEAR ?auto_1183161 ) ( IS-CRATE ?auto_1183162 ) ( not ( = ?auto_1183161 ?auto_1183162 ) ) ( AVAILABLE ?auto_1183164 ) ( ON ?auto_1183161 ?auto_1183160 ) ( not ( = ?auto_1183160 ?auto_1183161 ) ) ( not ( = ?auto_1183160 ?auto_1183162 ) ) ( not ( = ?auto_1183167 ?auto_1183165 ) ) ( HOIST-AT ?auto_1183166 ?auto_1183167 ) ( not ( = ?auto_1183164 ?auto_1183166 ) ) ( AVAILABLE ?auto_1183166 ) ( SURFACE-AT ?auto_1183162 ?auto_1183167 ) ( ON ?auto_1183162 ?auto_1183163 ) ( CLEAR ?auto_1183162 ) ( not ( = ?auto_1183161 ?auto_1183163 ) ) ( not ( = ?auto_1183162 ?auto_1183163 ) ) ( not ( = ?auto_1183160 ?auto_1183163 ) ) ( TRUCK-AT ?auto_1183168 ?auto_1183165 ) ( ON ?auto_1183155 ?auto_1183154 ) ( ON ?auto_1183156 ?auto_1183155 ) ( ON ?auto_1183158 ?auto_1183156 ) ( ON ?auto_1183157 ?auto_1183158 ) ( ON ?auto_1183159 ?auto_1183157 ) ( ON ?auto_1183160 ?auto_1183159 ) ( not ( = ?auto_1183154 ?auto_1183155 ) ) ( not ( = ?auto_1183154 ?auto_1183156 ) ) ( not ( = ?auto_1183154 ?auto_1183158 ) ) ( not ( = ?auto_1183154 ?auto_1183157 ) ) ( not ( = ?auto_1183154 ?auto_1183159 ) ) ( not ( = ?auto_1183154 ?auto_1183160 ) ) ( not ( = ?auto_1183154 ?auto_1183161 ) ) ( not ( = ?auto_1183154 ?auto_1183162 ) ) ( not ( = ?auto_1183154 ?auto_1183163 ) ) ( not ( = ?auto_1183155 ?auto_1183156 ) ) ( not ( = ?auto_1183155 ?auto_1183158 ) ) ( not ( = ?auto_1183155 ?auto_1183157 ) ) ( not ( = ?auto_1183155 ?auto_1183159 ) ) ( not ( = ?auto_1183155 ?auto_1183160 ) ) ( not ( = ?auto_1183155 ?auto_1183161 ) ) ( not ( = ?auto_1183155 ?auto_1183162 ) ) ( not ( = ?auto_1183155 ?auto_1183163 ) ) ( not ( = ?auto_1183156 ?auto_1183158 ) ) ( not ( = ?auto_1183156 ?auto_1183157 ) ) ( not ( = ?auto_1183156 ?auto_1183159 ) ) ( not ( = ?auto_1183156 ?auto_1183160 ) ) ( not ( = ?auto_1183156 ?auto_1183161 ) ) ( not ( = ?auto_1183156 ?auto_1183162 ) ) ( not ( = ?auto_1183156 ?auto_1183163 ) ) ( not ( = ?auto_1183158 ?auto_1183157 ) ) ( not ( = ?auto_1183158 ?auto_1183159 ) ) ( not ( = ?auto_1183158 ?auto_1183160 ) ) ( not ( = ?auto_1183158 ?auto_1183161 ) ) ( not ( = ?auto_1183158 ?auto_1183162 ) ) ( not ( = ?auto_1183158 ?auto_1183163 ) ) ( not ( = ?auto_1183157 ?auto_1183159 ) ) ( not ( = ?auto_1183157 ?auto_1183160 ) ) ( not ( = ?auto_1183157 ?auto_1183161 ) ) ( not ( = ?auto_1183157 ?auto_1183162 ) ) ( not ( = ?auto_1183157 ?auto_1183163 ) ) ( not ( = ?auto_1183159 ?auto_1183160 ) ) ( not ( = ?auto_1183159 ?auto_1183161 ) ) ( not ( = ?auto_1183159 ?auto_1183162 ) ) ( not ( = ?auto_1183159 ?auto_1183163 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1183160 ?auto_1183161 ?auto_1183162 )
      ( MAKE-8CRATE-VERIFY ?auto_1183154 ?auto_1183155 ?auto_1183156 ?auto_1183158 ?auto_1183157 ?auto_1183159 ?auto_1183160 ?auto_1183161 ?auto_1183162 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1183247 - SURFACE
      ?auto_1183248 - SURFACE
      ?auto_1183249 - SURFACE
      ?auto_1183251 - SURFACE
      ?auto_1183250 - SURFACE
      ?auto_1183252 - SURFACE
      ?auto_1183253 - SURFACE
      ?auto_1183254 - SURFACE
      ?auto_1183255 - SURFACE
    )
    :vars
    (
      ?auto_1183258 - HOIST
      ?auto_1183256 - PLACE
      ?auto_1183261 - PLACE
      ?auto_1183259 - HOIST
      ?auto_1183260 - SURFACE
      ?auto_1183257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1183258 ?auto_1183256 ) ( IS-CRATE ?auto_1183255 ) ( not ( = ?auto_1183254 ?auto_1183255 ) ) ( not ( = ?auto_1183253 ?auto_1183254 ) ) ( not ( = ?auto_1183253 ?auto_1183255 ) ) ( not ( = ?auto_1183261 ?auto_1183256 ) ) ( HOIST-AT ?auto_1183259 ?auto_1183261 ) ( not ( = ?auto_1183258 ?auto_1183259 ) ) ( AVAILABLE ?auto_1183259 ) ( SURFACE-AT ?auto_1183255 ?auto_1183261 ) ( ON ?auto_1183255 ?auto_1183260 ) ( CLEAR ?auto_1183255 ) ( not ( = ?auto_1183254 ?auto_1183260 ) ) ( not ( = ?auto_1183255 ?auto_1183260 ) ) ( not ( = ?auto_1183253 ?auto_1183260 ) ) ( TRUCK-AT ?auto_1183257 ?auto_1183256 ) ( SURFACE-AT ?auto_1183253 ?auto_1183256 ) ( CLEAR ?auto_1183253 ) ( LIFTING ?auto_1183258 ?auto_1183254 ) ( IS-CRATE ?auto_1183254 ) ( ON ?auto_1183248 ?auto_1183247 ) ( ON ?auto_1183249 ?auto_1183248 ) ( ON ?auto_1183251 ?auto_1183249 ) ( ON ?auto_1183250 ?auto_1183251 ) ( ON ?auto_1183252 ?auto_1183250 ) ( ON ?auto_1183253 ?auto_1183252 ) ( not ( = ?auto_1183247 ?auto_1183248 ) ) ( not ( = ?auto_1183247 ?auto_1183249 ) ) ( not ( = ?auto_1183247 ?auto_1183251 ) ) ( not ( = ?auto_1183247 ?auto_1183250 ) ) ( not ( = ?auto_1183247 ?auto_1183252 ) ) ( not ( = ?auto_1183247 ?auto_1183253 ) ) ( not ( = ?auto_1183247 ?auto_1183254 ) ) ( not ( = ?auto_1183247 ?auto_1183255 ) ) ( not ( = ?auto_1183247 ?auto_1183260 ) ) ( not ( = ?auto_1183248 ?auto_1183249 ) ) ( not ( = ?auto_1183248 ?auto_1183251 ) ) ( not ( = ?auto_1183248 ?auto_1183250 ) ) ( not ( = ?auto_1183248 ?auto_1183252 ) ) ( not ( = ?auto_1183248 ?auto_1183253 ) ) ( not ( = ?auto_1183248 ?auto_1183254 ) ) ( not ( = ?auto_1183248 ?auto_1183255 ) ) ( not ( = ?auto_1183248 ?auto_1183260 ) ) ( not ( = ?auto_1183249 ?auto_1183251 ) ) ( not ( = ?auto_1183249 ?auto_1183250 ) ) ( not ( = ?auto_1183249 ?auto_1183252 ) ) ( not ( = ?auto_1183249 ?auto_1183253 ) ) ( not ( = ?auto_1183249 ?auto_1183254 ) ) ( not ( = ?auto_1183249 ?auto_1183255 ) ) ( not ( = ?auto_1183249 ?auto_1183260 ) ) ( not ( = ?auto_1183251 ?auto_1183250 ) ) ( not ( = ?auto_1183251 ?auto_1183252 ) ) ( not ( = ?auto_1183251 ?auto_1183253 ) ) ( not ( = ?auto_1183251 ?auto_1183254 ) ) ( not ( = ?auto_1183251 ?auto_1183255 ) ) ( not ( = ?auto_1183251 ?auto_1183260 ) ) ( not ( = ?auto_1183250 ?auto_1183252 ) ) ( not ( = ?auto_1183250 ?auto_1183253 ) ) ( not ( = ?auto_1183250 ?auto_1183254 ) ) ( not ( = ?auto_1183250 ?auto_1183255 ) ) ( not ( = ?auto_1183250 ?auto_1183260 ) ) ( not ( = ?auto_1183252 ?auto_1183253 ) ) ( not ( = ?auto_1183252 ?auto_1183254 ) ) ( not ( = ?auto_1183252 ?auto_1183255 ) ) ( not ( = ?auto_1183252 ?auto_1183260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1183253 ?auto_1183254 ?auto_1183255 )
      ( MAKE-8CRATE-VERIFY ?auto_1183247 ?auto_1183248 ?auto_1183249 ?auto_1183251 ?auto_1183250 ?auto_1183252 ?auto_1183253 ?auto_1183254 ?auto_1183255 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1183340 - SURFACE
      ?auto_1183341 - SURFACE
      ?auto_1183342 - SURFACE
      ?auto_1183344 - SURFACE
      ?auto_1183343 - SURFACE
      ?auto_1183345 - SURFACE
      ?auto_1183346 - SURFACE
      ?auto_1183347 - SURFACE
      ?auto_1183348 - SURFACE
    )
    :vars
    (
      ?auto_1183351 - HOIST
      ?auto_1183352 - PLACE
      ?auto_1183354 - PLACE
      ?auto_1183353 - HOIST
      ?auto_1183350 - SURFACE
      ?auto_1183349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1183351 ?auto_1183352 ) ( IS-CRATE ?auto_1183348 ) ( not ( = ?auto_1183347 ?auto_1183348 ) ) ( not ( = ?auto_1183346 ?auto_1183347 ) ) ( not ( = ?auto_1183346 ?auto_1183348 ) ) ( not ( = ?auto_1183354 ?auto_1183352 ) ) ( HOIST-AT ?auto_1183353 ?auto_1183354 ) ( not ( = ?auto_1183351 ?auto_1183353 ) ) ( AVAILABLE ?auto_1183353 ) ( SURFACE-AT ?auto_1183348 ?auto_1183354 ) ( ON ?auto_1183348 ?auto_1183350 ) ( CLEAR ?auto_1183348 ) ( not ( = ?auto_1183347 ?auto_1183350 ) ) ( not ( = ?auto_1183348 ?auto_1183350 ) ) ( not ( = ?auto_1183346 ?auto_1183350 ) ) ( TRUCK-AT ?auto_1183349 ?auto_1183352 ) ( SURFACE-AT ?auto_1183346 ?auto_1183352 ) ( CLEAR ?auto_1183346 ) ( IS-CRATE ?auto_1183347 ) ( AVAILABLE ?auto_1183351 ) ( IN ?auto_1183347 ?auto_1183349 ) ( ON ?auto_1183341 ?auto_1183340 ) ( ON ?auto_1183342 ?auto_1183341 ) ( ON ?auto_1183344 ?auto_1183342 ) ( ON ?auto_1183343 ?auto_1183344 ) ( ON ?auto_1183345 ?auto_1183343 ) ( ON ?auto_1183346 ?auto_1183345 ) ( not ( = ?auto_1183340 ?auto_1183341 ) ) ( not ( = ?auto_1183340 ?auto_1183342 ) ) ( not ( = ?auto_1183340 ?auto_1183344 ) ) ( not ( = ?auto_1183340 ?auto_1183343 ) ) ( not ( = ?auto_1183340 ?auto_1183345 ) ) ( not ( = ?auto_1183340 ?auto_1183346 ) ) ( not ( = ?auto_1183340 ?auto_1183347 ) ) ( not ( = ?auto_1183340 ?auto_1183348 ) ) ( not ( = ?auto_1183340 ?auto_1183350 ) ) ( not ( = ?auto_1183341 ?auto_1183342 ) ) ( not ( = ?auto_1183341 ?auto_1183344 ) ) ( not ( = ?auto_1183341 ?auto_1183343 ) ) ( not ( = ?auto_1183341 ?auto_1183345 ) ) ( not ( = ?auto_1183341 ?auto_1183346 ) ) ( not ( = ?auto_1183341 ?auto_1183347 ) ) ( not ( = ?auto_1183341 ?auto_1183348 ) ) ( not ( = ?auto_1183341 ?auto_1183350 ) ) ( not ( = ?auto_1183342 ?auto_1183344 ) ) ( not ( = ?auto_1183342 ?auto_1183343 ) ) ( not ( = ?auto_1183342 ?auto_1183345 ) ) ( not ( = ?auto_1183342 ?auto_1183346 ) ) ( not ( = ?auto_1183342 ?auto_1183347 ) ) ( not ( = ?auto_1183342 ?auto_1183348 ) ) ( not ( = ?auto_1183342 ?auto_1183350 ) ) ( not ( = ?auto_1183344 ?auto_1183343 ) ) ( not ( = ?auto_1183344 ?auto_1183345 ) ) ( not ( = ?auto_1183344 ?auto_1183346 ) ) ( not ( = ?auto_1183344 ?auto_1183347 ) ) ( not ( = ?auto_1183344 ?auto_1183348 ) ) ( not ( = ?auto_1183344 ?auto_1183350 ) ) ( not ( = ?auto_1183343 ?auto_1183345 ) ) ( not ( = ?auto_1183343 ?auto_1183346 ) ) ( not ( = ?auto_1183343 ?auto_1183347 ) ) ( not ( = ?auto_1183343 ?auto_1183348 ) ) ( not ( = ?auto_1183343 ?auto_1183350 ) ) ( not ( = ?auto_1183345 ?auto_1183346 ) ) ( not ( = ?auto_1183345 ?auto_1183347 ) ) ( not ( = ?auto_1183345 ?auto_1183348 ) ) ( not ( = ?auto_1183345 ?auto_1183350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1183346 ?auto_1183347 ?auto_1183348 )
      ( MAKE-8CRATE-VERIFY ?auto_1183340 ?auto_1183341 ?auto_1183342 ?auto_1183344 ?auto_1183343 ?auto_1183345 ?auto_1183346 ?auto_1183347 ?auto_1183348 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1187456 - SURFACE
      ?auto_1187457 - SURFACE
      ?auto_1187458 - SURFACE
      ?auto_1187460 - SURFACE
      ?auto_1187459 - SURFACE
      ?auto_1187461 - SURFACE
      ?auto_1187462 - SURFACE
      ?auto_1187463 - SURFACE
      ?auto_1187464 - SURFACE
      ?auto_1187465 - SURFACE
    )
    :vars
    (
      ?auto_1187467 - HOIST
      ?auto_1187466 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1187467 ?auto_1187466 ) ( SURFACE-AT ?auto_1187464 ?auto_1187466 ) ( CLEAR ?auto_1187464 ) ( LIFTING ?auto_1187467 ?auto_1187465 ) ( IS-CRATE ?auto_1187465 ) ( not ( = ?auto_1187464 ?auto_1187465 ) ) ( ON ?auto_1187457 ?auto_1187456 ) ( ON ?auto_1187458 ?auto_1187457 ) ( ON ?auto_1187460 ?auto_1187458 ) ( ON ?auto_1187459 ?auto_1187460 ) ( ON ?auto_1187461 ?auto_1187459 ) ( ON ?auto_1187462 ?auto_1187461 ) ( ON ?auto_1187463 ?auto_1187462 ) ( ON ?auto_1187464 ?auto_1187463 ) ( not ( = ?auto_1187456 ?auto_1187457 ) ) ( not ( = ?auto_1187456 ?auto_1187458 ) ) ( not ( = ?auto_1187456 ?auto_1187460 ) ) ( not ( = ?auto_1187456 ?auto_1187459 ) ) ( not ( = ?auto_1187456 ?auto_1187461 ) ) ( not ( = ?auto_1187456 ?auto_1187462 ) ) ( not ( = ?auto_1187456 ?auto_1187463 ) ) ( not ( = ?auto_1187456 ?auto_1187464 ) ) ( not ( = ?auto_1187456 ?auto_1187465 ) ) ( not ( = ?auto_1187457 ?auto_1187458 ) ) ( not ( = ?auto_1187457 ?auto_1187460 ) ) ( not ( = ?auto_1187457 ?auto_1187459 ) ) ( not ( = ?auto_1187457 ?auto_1187461 ) ) ( not ( = ?auto_1187457 ?auto_1187462 ) ) ( not ( = ?auto_1187457 ?auto_1187463 ) ) ( not ( = ?auto_1187457 ?auto_1187464 ) ) ( not ( = ?auto_1187457 ?auto_1187465 ) ) ( not ( = ?auto_1187458 ?auto_1187460 ) ) ( not ( = ?auto_1187458 ?auto_1187459 ) ) ( not ( = ?auto_1187458 ?auto_1187461 ) ) ( not ( = ?auto_1187458 ?auto_1187462 ) ) ( not ( = ?auto_1187458 ?auto_1187463 ) ) ( not ( = ?auto_1187458 ?auto_1187464 ) ) ( not ( = ?auto_1187458 ?auto_1187465 ) ) ( not ( = ?auto_1187460 ?auto_1187459 ) ) ( not ( = ?auto_1187460 ?auto_1187461 ) ) ( not ( = ?auto_1187460 ?auto_1187462 ) ) ( not ( = ?auto_1187460 ?auto_1187463 ) ) ( not ( = ?auto_1187460 ?auto_1187464 ) ) ( not ( = ?auto_1187460 ?auto_1187465 ) ) ( not ( = ?auto_1187459 ?auto_1187461 ) ) ( not ( = ?auto_1187459 ?auto_1187462 ) ) ( not ( = ?auto_1187459 ?auto_1187463 ) ) ( not ( = ?auto_1187459 ?auto_1187464 ) ) ( not ( = ?auto_1187459 ?auto_1187465 ) ) ( not ( = ?auto_1187461 ?auto_1187462 ) ) ( not ( = ?auto_1187461 ?auto_1187463 ) ) ( not ( = ?auto_1187461 ?auto_1187464 ) ) ( not ( = ?auto_1187461 ?auto_1187465 ) ) ( not ( = ?auto_1187462 ?auto_1187463 ) ) ( not ( = ?auto_1187462 ?auto_1187464 ) ) ( not ( = ?auto_1187462 ?auto_1187465 ) ) ( not ( = ?auto_1187463 ?auto_1187464 ) ) ( not ( = ?auto_1187463 ?auto_1187465 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1187464 ?auto_1187465 )
      ( MAKE-9CRATE-VERIFY ?auto_1187456 ?auto_1187457 ?auto_1187458 ?auto_1187460 ?auto_1187459 ?auto_1187461 ?auto_1187462 ?auto_1187463 ?auto_1187464 ?auto_1187465 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1187536 - SURFACE
      ?auto_1187537 - SURFACE
      ?auto_1187538 - SURFACE
      ?auto_1187540 - SURFACE
      ?auto_1187539 - SURFACE
      ?auto_1187541 - SURFACE
      ?auto_1187542 - SURFACE
      ?auto_1187543 - SURFACE
      ?auto_1187544 - SURFACE
      ?auto_1187545 - SURFACE
    )
    :vars
    (
      ?auto_1187546 - HOIST
      ?auto_1187547 - PLACE
      ?auto_1187548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1187546 ?auto_1187547 ) ( SURFACE-AT ?auto_1187544 ?auto_1187547 ) ( CLEAR ?auto_1187544 ) ( IS-CRATE ?auto_1187545 ) ( not ( = ?auto_1187544 ?auto_1187545 ) ) ( TRUCK-AT ?auto_1187548 ?auto_1187547 ) ( AVAILABLE ?auto_1187546 ) ( IN ?auto_1187545 ?auto_1187548 ) ( ON ?auto_1187544 ?auto_1187543 ) ( not ( = ?auto_1187543 ?auto_1187544 ) ) ( not ( = ?auto_1187543 ?auto_1187545 ) ) ( ON ?auto_1187537 ?auto_1187536 ) ( ON ?auto_1187538 ?auto_1187537 ) ( ON ?auto_1187540 ?auto_1187538 ) ( ON ?auto_1187539 ?auto_1187540 ) ( ON ?auto_1187541 ?auto_1187539 ) ( ON ?auto_1187542 ?auto_1187541 ) ( ON ?auto_1187543 ?auto_1187542 ) ( not ( = ?auto_1187536 ?auto_1187537 ) ) ( not ( = ?auto_1187536 ?auto_1187538 ) ) ( not ( = ?auto_1187536 ?auto_1187540 ) ) ( not ( = ?auto_1187536 ?auto_1187539 ) ) ( not ( = ?auto_1187536 ?auto_1187541 ) ) ( not ( = ?auto_1187536 ?auto_1187542 ) ) ( not ( = ?auto_1187536 ?auto_1187543 ) ) ( not ( = ?auto_1187536 ?auto_1187544 ) ) ( not ( = ?auto_1187536 ?auto_1187545 ) ) ( not ( = ?auto_1187537 ?auto_1187538 ) ) ( not ( = ?auto_1187537 ?auto_1187540 ) ) ( not ( = ?auto_1187537 ?auto_1187539 ) ) ( not ( = ?auto_1187537 ?auto_1187541 ) ) ( not ( = ?auto_1187537 ?auto_1187542 ) ) ( not ( = ?auto_1187537 ?auto_1187543 ) ) ( not ( = ?auto_1187537 ?auto_1187544 ) ) ( not ( = ?auto_1187537 ?auto_1187545 ) ) ( not ( = ?auto_1187538 ?auto_1187540 ) ) ( not ( = ?auto_1187538 ?auto_1187539 ) ) ( not ( = ?auto_1187538 ?auto_1187541 ) ) ( not ( = ?auto_1187538 ?auto_1187542 ) ) ( not ( = ?auto_1187538 ?auto_1187543 ) ) ( not ( = ?auto_1187538 ?auto_1187544 ) ) ( not ( = ?auto_1187538 ?auto_1187545 ) ) ( not ( = ?auto_1187540 ?auto_1187539 ) ) ( not ( = ?auto_1187540 ?auto_1187541 ) ) ( not ( = ?auto_1187540 ?auto_1187542 ) ) ( not ( = ?auto_1187540 ?auto_1187543 ) ) ( not ( = ?auto_1187540 ?auto_1187544 ) ) ( not ( = ?auto_1187540 ?auto_1187545 ) ) ( not ( = ?auto_1187539 ?auto_1187541 ) ) ( not ( = ?auto_1187539 ?auto_1187542 ) ) ( not ( = ?auto_1187539 ?auto_1187543 ) ) ( not ( = ?auto_1187539 ?auto_1187544 ) ) ( not ( = ?auto_1187539 ?auto_1187545 ) ) ( not ( = ?auto_1187541 ?auto_1187542 ) ) ( not ( = ?auto_1187541 ?auto_1187543 ) ) ( not ( = ?auto_1187541 ?auto_1187544 ) ) ( not ( = ?auto_1187541 ?auto_1187545 ) ) ( not ( = ?auto_1187542 ?auto_1187543 ) ) ( not ( = ?auto_1187542 ?auto_1187544 ) ) ( not ( = ?auto_1187542 ?auto_1187545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1187543 ?auto_1187544 ?auto_1187545 )
      ( MAKE-9CRATE-VERIFY ?auto_1187536 ?auto_1187537 ?auto_1187538 ?auto_1187540 ?auto_1187539 ?auto_1187541 ?auto_1187542 ?auto_1187543 ?auto_1187544 ?auto_1187545 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1187626 - SURFACE
      ?auto_1187627 - SURFACE
      ?auto_1187628 - SURFACE
      ?auto_1187630 - SURFACE
      ?auto_1187629 - SURFACE
      ?auto_1187631 - SURFACE
      ?auto_1187632 - SURFACE
      ?auto_1187633 - SURFACE
      ?auto_1187634 - SURFACE
      ?auto_1187635 - SURFACE
    )
    :vars
    (
      ?auto_1187639 - HOIST
      ?auto_1187638 - PLACE
      ?auto_1187637 - TRUCK
      ?auto_1187636 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1187639 ?auto_1187638 ) ( SURFACE-AT ?auto_1187634 ?auto_1187638 ) ( CLEAR ?auto_1187634 ) ( IS-CRATE ?auto_1187635 ) ( not ( = ?auto_1187634 ?auto_1187635 ) ) ( AVAILABLE ?auto_1187639 ) ( IN ?auto_1187635 ?auto_1187637 ) ( ON ?auto_1187634 ?auto_1187633 ) ( not ( = ?auto_1187633 ?auto_1187634 ) ) ( not ( = ?auto_1187633 ?auto_1187635 ) ) ( TRUCK-AT ?auto_1187637 ?auto_1187636 ) ( not ( = ?auto_1187636 ?auto_1187638 ) ) ( ON ?auto_1187627 ?auto_1187626 ) ( ON ?auto_1187628 ?auto_1187627 ) ( ON ?auto_1187630 ?auto_1187628 ) ( ON ?auto_1187629 ?auto_1187630 ) ( ON ?auto_1187631 ?auto_1187629 ) ( ON ?auto_1187632 ?auto_1187631 ) ( ON ?auto_1187633 ?auto_1187632 ) ( not ( = ?auto_1187626 ?auto_1187627 ) ) ( not ( = ?auto_1187626 ?auto_1187628 ) ) ( not ( = ?auto_1187626 ?auto_1187630 ) ) ( not ( = ?auto_1187626 ?auto_1187629 ) ) ( not ( = ?auto_1187626 ?auto_1187631 ) ) ( not ( = ?auto_1187626 ?auto_1187632 ) ) ( not ( = ?auto_1187626 ?auto_1187633 ) ) ( not ( = ?auto_1187626 ?auto_1187634 ) ) ( not ( = ?auto_1187626 ?auto_1187635 ) ) ( not ( = ?auto_1187627 ?auto_1187628 ) ) ( not ( = ?auto_1187627 ?auto_1187630 ) ) ( not ( = ?auto_1187627 ?auto_1187629 ) ) ( not ( = ?auto_1187627 ?auto_1187631 ) ) ( not ( = ?auto_1187627 ?auto_1187632 ) ) ( not ( = ?auto_1187627 ?auto_1187633 ) ) ( not ( = ?auto_1187627 ?auto_1187634 ) ) ( not ( = ?auto_1187627 ?auto_1187635 ) ) ( not ( = ?auto_1187628 ?auto_1187630 ) ) ( not ( = ?auto_1187628 ?auto_1187629 ) ) ( not ( = ?auto_1187628 ?auto_1187631 ) ) ( not ( = ?auto_1187628 ?auto_1187632 ) ) ( not ( = ?auto_1187628 ?auto_1187633 ) ) ( not ( = ?auto_1187628 ?auto_1187634 ) ) ( not ( = ?auto_1187628 ?auto_1187635 ) ) ( not ( = ?auto_1187630 ?auto_1187629 ) ) ( not ( = ?auto_1187630 ?auto_1187631 ) ) ( not ( = ?auto_1187630 ?auto_1187632 ) ) ( not ( = ?auto_1187630 ?auto_1187633 ) ) ( not ( = ?auto_1187630 ?auto_1187634 ) ) ( not ( = ?auto_1187630 ?auto_1187635 ) ) ( not ( = ?auto_1187629 ?auto_1187631 ) ) ( not ( = ?auto_1187629 ?auto_1187632 ) ) ( not ( = ?auto_1187629 ?auto_1187633 ) ) ( not ( = ?auto_1187629 ?auto_1187634 ) ) ( not ( = ?auto_1187629 ?auto_1187635 ) ) ( not ( = ?auto_1187631 ?auto_1187632 ) ) ( not ( = ?auto_1187631 ?auto_1187633 ) ) ( not ( = ?auto_1187631 ?auto_1187634 ) ) ( not ( = ?auto_1187631 ?auto_1187635 ) ) ( not ( = ?auto_1187632 ?auto_1187633 ) ) ( not ( = ?auto_1187632 ?auto_1187634 ) ) ( not ( = ?auto_1187632 ?auto_1187635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1187633 ?auto_1187634 ?auto_1187635 )
      ( MAKE-9CRATE-VERIFY ?auto_1187626 ?auto_1187627 ?auto_1187628 ?auto_1187630 ?auto_1187629 ?auto_1187631 ?auto_1187632 ?auto_1187633 ?auto_1187634 ?auto_1187635 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1187725 - SURFACE
      ?auto_1187726 - SURFACE
      ?auto_1187727 - SURFACE
      ?auto_1187729 - SURFACE
      ?auto_1187728 - SURFACE
      ?auto_1187730 - SURFACE
      ?auto_1187731 - SURFACE
      ?auto_1187732 - SURFACE
      ?auto_1187733 - SURFACE
      ?auto_1187734 - SURFACE
    )
    :vars
    (
      ?auto_1187738 - HOIST
      ?auto_1187736 - PLACE
      ?auto_1187735 - TRUCK
      ?auto_1187739 - PLACE
      ?auto_1187737 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1187738 ?auto_1187736 ) ( SURFACE-AT ?auto_1187733 ?auto_1187736 ) ( CLEAR ?auto_1187733 ) ( IS-CRATE ?auto_1187734 ) ( not ( = ?auto_1187733 ?auto_1187734 ) ) ( AVAILABLE ?auto_1187738 ) ( ON ?auto_1187733 ?auto_1187732 ) ( not ( = ?auto_1187732 ?auto_1187733 ) ) ( not ( = ?auto_1187732 ?auto_1187734 ) ) ( TRUCK-AT ?auto_1187735 ?auto_1187739 ) ( not ( = ?auto_1187739 ?auto_1187736 ) ) ( HOIST-AT ?auto_1187737 ?auto_1187739 ) ( LIFTING ?auto_1187737 ?auto_1187734 ) ( not ( = ?auto_1187738 ?auto_1187737 ) ) ( ON ?auto_1187726 ?auto_1187725 ) ( ON ?auto_1187727 ?auto_1187726 ) ( ON ?auto_1187729 ?auto_1187727 ) ( ON ?auto_1187728 ?auto_1187729 ) ( ON ?auto_1187730 ?auto_1187728 ) ( ON ?auto_1187731 ?auto_1187730 ) ( ON ?auto_1187732 ?auto_1187731 ) ( not ( = ?auto_1187725 ?auto_1187726 ) ) ( not ( = ?auto_1187725 ?auto_1187727 ) ) ( not ( = ?auto_1187725 ?auto_1187729 ) ) ( not ( = ?auto_1187725 ?auto_1187728 ) ) ( not ( = ?auto_1187725 ?auto_1187730 ) ) ( not ( = ?auto_1187725 ?auto_1187731 ) ) ( not ( = ?auto_1187725 ?auto_1187732 ) ) ( not ( = ?auto_1187725 ?auto_1187733 ) ) ( not ( = ?auto_1187725 ?auto_1187734 ) ) ( not ( = ?auto_1187726 ?auto_1187727 ) ) ( not ( = ?auto_1187726 ?auto_1187729 ) ) ( not ( = ?auto_1187726 ?auto_1187728 ) ) ( not ( = ?auto_1187726 ?auto_1187730 ) ) ( not ( = ?auto_1187726 ?auto_1187731 ) ) ( not ( = ?auto_1187726 ?auto_1187732 ) ) ( not ( = ?auto_1187726 ?auto_1187733 ) ) ( not ( = ?auto_1187726 ?auto_1187734 ) ) ( not ( = ?auto_1187727 ?auto_1187729 ) ) ( not ( = ?auto_1187727 ?auto_1187728 ) ) ( not ( = ?auto_1187727 ?auto_1187730 ) ) ( not ( = ?auto_1187727 ?auto_1187731 ) ) ( not ( = ?auto_1187727 ?auto_1187732 ) ) ( not ( = ?auto_1187727 ?auto_1187733 ) ) ( not ( = ?auto_1187727 ?auto_1187734 ) ) ( not ( = ?auto_1187729 ?auto_1187728 ) ) ( not ( = ?auto_1187729 ?auto_1187730 ) ) ( not ( = ?auto_1187729 ?auto_1187731 ) ) ( not ( = ?auto_1187729 ?auto_1187732 ) ) ( not ( = ?auto_1187729 ?auto_1187733 ) ) ( not ( = ?auto_1187729 ?auto_1187734 ) ) ( not ( = ?auto_1187728 ?auto_1187730 ) ) ( not ( = ?auto_1187728 ?auto_1187731 ) ) ( not ( = ?auto_1187728 ?auto_1187732 ) ) ( not ( = ?auto_1187728 ?auto_1187733 ) ) ( not ( = ?auto_1187728 ?auto_1187734 ) ) ( not ( = ?auto_1187730 ?auto_1187731 ) ) ( not ( = ?auto_1187730 ?auto_1187732 ) ) ( not ( = ?auto_1187730 ?auto_1187733 ) ) ( not ( = ?auto_1187730 ?auto_1187734 ) ) ( not ( = ?auto_1187731 ?auto_1187732 ) ) ( not ( = ?auto_1187731 ?auto_1187733 ) ) ( not ( = ?auto_1187731 ?auto_1187734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1187732 ?auto_1187733 ?auto_1187734 )
      ( MAKE-9CRATE-VERIFY ?auto_1187725 ?auto_1187726 ?auto_1187727 ?auto_1187729 ?auto_1187728 ?auto_1187730 ?auto_1187731 ?auto_1187732 ?auto_1187733 ?auto_1187734 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1187833 - SURFACE
      ?auto_1187834 - SURFACE
      ?auto_1187835 - SURFACE
      ?auto_1187837 - SURFACE
      ?auto_1187836 - SURFACE
      ?auto_1187838 - SURFACE
      ?auto_1187839 - SURFACE
      ?auto_1187840 - SURFACE
      ?auto_1187841 - SURFACE
      ?auto_1187842 - SURFACE
    )
    :vars
    (
      ?auto_1187843 - HOIST
      ?auto_1187846 - PLACE
      ?auto_1187844 - TRUCK
      ?auto_1187845 - PLACE
      ?auto_1187847 - HOIST
      ?auto_1187848 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1187843 ?auto_1187846 ) ( SURFACE-AT ?auto_1187841 ?auto_1187846 ) ( CLEAR ?auto_1187841 ) ( IS-CRATE ?auto_1187842 ) ( not ( = ?auto_1187841 ?auto_1187842 ) ) ( AVAILABLE ?auto_1187843 ) ( ON ?auto_1187841 ?auto_1187840 ) ( not ( = ?auto_1187840 ?auto_1187841 ) ) ( not ( = ?auto_1187840 ?auto_1187842 ) ) ( TRUCK-AT ?auto_1187844 ?auto_1187845 ) ( not ( = ?auto_1187845 ?auto_1187846 ) ) ( HOIST-AT ?auto_1187847 ?auto_1187845 ) ( not ( = ?auto_1187843 ?auto_1187847 ) ) ( AVAILABLE ?auto_1187847 ) ( SURFACE-AT ?auto_1187842 ?auto_1187845 ) ( ON ?auto_1187842 ?auto_1187848 ) ( CLEAR ?auto_1187842 ) ( not ( = ?auto_1187841 ?auto_1187848 ) ) ( not ( = ?auto_1187842 ?auto_1187848 ) ) ( not ( = ?auto_1187840 ?auto_1187848 ) ) ( ON ?auto_1187834 ?auto_1187833 ) ( ON ?auto_1187835 ?auto_1187834 ) ( ON ?auto_1187837 ?auto_1187835 ) ( ON ?auto_1187836 ?auto_1187837 ) ( ON ?auto_1187838 ?auto_1187836 ) ( ON ?auto_1187839 ?auto_1187838 ) ( ON ?auto_1187840 ?auto_1187839 ) ( not ( = ?auto_1187833 ?auto_1187834 ) ) ( not ( = ?auto_1187833 ?auto_1187835 ) ) ( not ( = ?auto_1187833 ?auto_1187837 ) ) ( not ( = ?auto_1187833 ?auto_1187836 ) ) ( not ( = ?auto_1187833 ?auto_1187838 ) ) ( not ( = ?auto_1187833 ?auto_1187839 ) ) ( not ( = ?auto_1187833 ?auto_1187840 ) ) ( not ( = ?auto_1187833 ?auto_1187841 ) ) ( not ( = ?auto_1187833 ?auto_1187842 ) ) ( not ( = ?auto_1187833 ?auto_1187848 ) ) ( not ( = ?auto_1187834 ?auto_1187835 ) ) ( not ( = ?auto_1187834 ?auto_1187837 ) ) ( not ( = ?auto_1187834 ?auto_1187836 ) ) ( not ( = ?auto_1187834 ?auto_1187838 ) ) ( not ( = ?auto_1187834 ?auto_1187839 ) ) ( not ( = ?auto_1187834 ?auto_1187840 ) ) ( not ( = ?auto_1187834 ?auto_1187841 ) ) ( not ( = ?auto_1187834 ?auto_1187842 ) ) ( not ( = ?auto_1187834 ?auto_1187848 ) ) ( not ( = ?auto_1187835 ?auto_1187837 ) ) ( not ( = ?auto_1187835 ?auto_1187836 ) ) ( not ( = ?auto_1187835 ?auto_1187838 ) ) ( not ( = ?auto_1187835 ?auto_1187839 ) ) ( not ( = ?auto_1187835 ?auto_1187840 ) ) ( not ( = ?auto_1187835 ?auto_1187841 ) ) ( not ( = ?auto_1187835 ?auto_1187842 ) ) ( not ( = ?auto_1187835 ?auto_1187848 ) ) ( not ( = ?auto_1187837 ?auto_1187836 ) ) ( not ( = ?auto_1187837 ?auto_1187838 ) ) ( not ( = ?auto_1187837 ?auto_1187839 ) ) ( not ( = ?auto_1187837 ?auto_1187840 ) ) ( not ( = ?auto_1187837 ?auto_1187841 ) ) ( not ( = ?auto_1187837 ?auto_1187842 ) ) ( not ( = ?auto_1187837 ?auto_1187848 ) ) ( not ( = ?auto_1187836 ?auto_1187838 ) ) ( not ( = ?auto_1187836 ?auto_1187839 ) ) ( not ( = ?auto_1187836 ?auto_1187840 ) ) ( not ( = ?auto_1187836 ?auto_1187841 ) ) ( not ( = ?auto_1187836 ?auto_1187842 ) ) ( not ( = ?auto_1187836 ?auto_1187848 ) ) ( not ( = ?auto_1187838 ?auto_1187839 ) ) ( not ( = ?auto_1187838 ?auto_1187840 ) ) ( not ( = ?auto_1187838 ?auto_1187841 ) ) ( not ( = ?auto_1187838 ?auto_1187842 ) ) ( not ( = ?auto_1187838 ?auto_1187848 ) ) ( not ( = ?auto_1187839 ?auto_1187840 ) ) ( not ( = ?auto_1187839 ?auto_1187841 ) ) ( not ( = ?auto_1187839 ?auto_1187842 ) ) ( not ( = ?auto_1187839 ?auto_1187848 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1187840 ?auto_1187841 ?auto_1187842 )
      ( MAKE-9CRATE-VERIFY ?auto_1187833 ?auto_1187834 ?auto_1187835 ?auto_1187837 ?auto_1187836 ?auto_1187838 ?auto_1187839 ?auto_1187840 ?auto_1187841 ?auto_1187842 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1187942 - SURFACE
      ?auto_1187943 - SURFACE
      ?auto_1187944 - SURFACE
      ?auto_1187946 - SURFACE
      ?auto_1187945 - SURFACE
      ?auto_1187947 - SURFACE
      ?auto_1187948 - SURFACE
      ?auto_1187949 - SURFACE
      ?auto_1187950 - SURFACE
      ?auto_1187951 - SURFACE
    )
    :vars
    (
      ?auto_1187953 - HOIST
      ?auto_1187955 - PLACE
      ?auto_1187954 - PLACE
      ?auto_1187956 - HOIST
      ?auto_1187952 - SURFACE
      ?auto_1187957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1187953 ?auto_1187955 ) ( SURFACE-AT ?auto_1187950 ?auto_1187955 ) ( CLEAR ?auto_1187950 ) ( IS-CRATE ?auto_1187951 ) ( not ( = ?auto_1187950 ?auto_1187951 ) ) ( AVAILABLE ?auto_1187953 ) ( ON ?auto_1187950 ?auto_1187949 ) ( not ( = ?auto_1187949 ?auto_1187950 ) ) ( not ( = ?auto_1187949 ?auto_1187951 ) ) ( not ( = ?auto_1187954 ?auto_1187955 ) ) ( HOIST-AT ?auto_1187956 ?auto_1187954 ) ( not ( = ?auto_1187953 ?auto_1187956 ) ) ( AVAILABLE ?auto_1187956 ) ( SURFACE-AT ?auto_1187951 ?auto_1187954 ) ( ON ?auto_1187951 ?auto_1187952 ) ( CLEAR ?auto_1187951 ) ( not ( = ?auto_1187950 ?auto_1187952 ) ) ( not ( = ?auto_1187951 ?auto_1187952 ) ) ( not ( = ?auto_1187949 ?auto_1187952 ) ) ( TRUCK-AT ?auto_1187957 ?auto_1187955 ) ( ON ?auto_1187943 ?auto_1187942 ) ( ON ?auto_1187944 ?auto_1187943 ) ( ON ?auto_1187946 ?auto_1187944 ) ( ON ?auto_1187945 ?auto_1187946 ) ( ON ?auto_1187947 ?auto_1187945 ) ( ON ?auto_1187948 ?auto_1187947 ) ( ON ?auto_1187949 ?auto_1187948 ) ( not ( = ?auto_1187942 ?auto_1187943 ) ) ( not ( = ?auto_1187942 ?auto_1187944 ) ) ( not ( = ?auto_1187942 ?auto_1187946 ) ) ( not ( = ?auto_1187942 ?auto_1187945 ) ) ( not ( = ?auto_1187942 ?auto_1187947 ) ) ( not ( = ?auto_1187942 ?auto_1187948 ) ) ( not ( = ?auto_1187942 ?auto_1187949 ) ) ( not ( = ?auto_1187942 ?auto_1187950 ) ) ( not ( = ?auto_1187942 ?auto_1187951 ) ) ( not ( = ?auto_1187942 ?auto_1187952 ) ) ( not ( = ?auto_1187943 ?auto_1187944 ) ) ( not ( = ?auto_1187943 ?auto_1187946 ) ) ( not ( = ?auto_1187943 ?auto_1187945 ) ) ( not ( = ?auto_1187943 ?auto_1187947 ) ) ( not ( = ?auto_1187943 ?auto_1187948 ) ) ( not ( = ?auto_1187943 ?auto_1187949 ) ) ( not ( = ?auto_1187943 ?auto_1187950 ) ) ( not ( = ?auto_1187943 ?auto_1187951 ) ) ( not ( = ?auto_1187943 ?auto_1187952 ) ) ( not ( = ?auto_1187944 ?auto_1187946 ) ) ( not ( = ?auto_1187944 ?auto_1187945 ) ) ( not ( = ?auto_1187944 ?auto_1187947 ) ) ( not ( = ?auto_1187944 ?auto_1187948 ) ) ( not ( = ?auto_1187944 ?auto_1187949 ) ) ( not ( = ?auto_1187944 ?auto_1187950 ) ) ( not ( = ?auto_1187944 ?auto_1187951 ) ) ( not ( = ?auto_1187944 ?auto_1187952 ) ) ( not ( = ?auto_1187946 ?auto_1187945 ) ) ( not ( = ?auto_1187946 ?auto_1187947 ) ) ( not ( = ?auto_1187946 ?auto_1187948 ) ) ( not ( = ?auto_1187946 ?auto_1187949 ) ) ( not ( = ?auto_1187946 ?auto_1187950 ) ) ( not ( = ?auto_1187946 ?auto_1187951 ) ) ( not ( = ?auto_1187946 ?auto_1187952 ) ) ( not ( = ?auto_1187945 ?auto_1187947 ) ) ( not ( = ?auto_1187945 ?auto_1187948 ) ) ( not ( = ?auto_1187945 ?auto_1187949 ) ) ( not ( = ?auto_1187945 ?auto_1187950 ) ) ( not ( = ?auto_1187945 ?auto_1187951 ) ) ( not ( = ?auto_1187945 ?auto_1187952 ) ) ( not ( = ?auto_1187947 ?auto_1187948 ) ) ( not ( = ?auto_1187947 ?auto_1187949 ) ) ( not ( = ?auto_1187947 ?auto_1187950 ) ) ( not ( = ?auto_1187947 ?auto_1187951 ) ) ( not ( = ?auto_1187947 ?auto_1187952 ) ) ( not ( = ?auto_1187948 ?auto_1187949 ) ) ( not ( = ?auto_1187948 ?auto_1187950 ) ) ( not ( = ?auto_1187948 ?auto_1187951 ) ) ( not ( = ?auto_1187948 ?auto_1187952 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1187949 ?auto_1187950 ?auto_1187951 )
      ( MAKE-9CRATE-VERIFY ?auto_1187942 ?auto_1187943 ?auto_1187944 ?auto_1187946 ?auto_1187945 ?auto_1187947 ?auto_1187948 ?auto_1187949 ?auto_1187950 ?auto_1187951 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1188051 - SURFACE
      ?auto_1188052 - SURFACE
      ?auto_1188053 - SURFACE
      ?auto_1188055 - SURFACE
      ?auto_1188054 - SURFACE
      ?auto_1188056 - SURFACE
      ?auto_1188057 - SURFACE
      ?auto_1188058 - SURFACE
      ?auto_1188059 - SURFACE
      ?auto_1188060 - SURFACE
    )
    :vars
    (
      ?auto_1188066 - HOIST
      ?auto_1188065 - PLACE
      ?auto_1188062 - PLACE
      ?auto_1188063 - HOIST
      ?auto_1188064 - SURFACE
      ?auto_1188061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188066 ?auto_1188065 ) ( IS-CRATE ?auto_1188060 ) ( not ( = ?auto_1188059 ?auto_1188060 ) ) ( not ( = ?auto_1188058 ?auto_1188059 ) ) ( not ( = ?auto_1188058 ?auto_1188060 ) ) ( not ( = ?auto_1188062 ?auto_1188065 ) ) ( HOIST-AT ?auto_1188063 ?auto_1188062 ) ( not ( = ?auto_1188066 ?auto_1188063 ) ) ( AVAILABLE ?auto_1188063 ) ( SURFACE-AT ?auto_1188060 ?auto_1188062 ) ( ON ?auto_1188060 ?auto_1188064 ) ( CLEAR ?auto_1188060 ) ( not ( = ?auto_1188059 ?auto_1188064 ) ) ( not ( = ?auto_1188060 ?auto_1188064 ) ) ( not ( = ?auto_1188058 ?auto_1188064 ) ) ( TRUCK-AT ?auto_1188061 ?auto_1188065 ) ( SURFACE-AT ?auto_1188058 ?auto_1188065 ) ( CLEAR ?auto_1188058 ) ( LIFTING ?auto_1188066 ?auto_1188059 ) ( IS-CRATE ?auto_1188059 ) ( ON ?auto_1188052 ?auto_1188051 ) ( ON ?auto_1188053 ?auto_1188052 ) ( ON ?auto_1188055 ?auto_1188053 ) ( ON ?auto_1188054 ?auto_1188055 ) ( ON ?auto_1188056 ?auto_1188054 ) ( ON ?auto_1188057 ?auto_1188056 ) ( ON ?auto_1188058 ?auto_1188057 ) ( not ( = ?auto_1188051 ?auto_1188052 ) ) ( not ( = ?auto_1188051 ?auto_1188053 ) ) ( not ( = ?auto_1188051 ?auto_1188055 ) ) ( not ( = ?auto_1188051 ?auto_1188054 ) ) ( not ( = ?auto_1188051 ?auto_1188056 ) ) ( not ( = ?auto_1188051 ?auto_1188057 ) ) ( not ( = ?auto_1188051 ?auto_1188058 ) ) ( not ( = ?auto_1188051 ?auto_1188059 ) ) ( not ( = ?auto_1188051 ?auto_1188060 ) ) ( not ( = ?auto_1188051 ?auto_1188064 ) ) ( not ( = ?auto_1188052 ?auto_1188053 ) ) ( not ( = ?auto_1188052 ?auto_1188055 ) ) ( not ( = ?auto_1188052 ?auto_1188054 ) ) ( not ( = ?auto_1188052 ?auto_1188056 ) ) ( not ( = ?auto_1188052 ?auto_1188057 ) ) ( not ( = ?auto_1188052 ?auto_1188058 ) ) ( not ( = ?auto_1188052 ?auto_1188059 ) ) ( not ( = ?auto_1188052 ?auto_1188060 ) ) ( not ( = ?auto_1188052 ?auto_1188064 ) ) ( not ( = ?auto_1188053 ?auto_1188055 ) ) ( not ( = ?auto_1188053 ?auto_1188054 ) ) ( not ( = ?auto_1188053 ?auto_1188056 ) ) ( not ( = ?auto_1188053 ?auto_1188057 ) ) ( not ( = ?auto_1188053 ?auto_1188058 ) ) ( not ( = ?auto_1188053 ?auto_1188059 ) ) ( not ( = ?auto_1188053 ?auto_1188060 ) ) ( not ( = ?auto_1188053 ?auto_1188064 ) ) ( not ( = ?auto_1188055 ?auto_1188054 ) ) ( not ( = ?auto_1188055 ?auto_1188056 ) ) ( not ( = ?auto_1188055 ?auto_1188057 ) ) ( not ( = ?auto_1188055 ?auto_1188058 ) ) ( not ( = ?auto_1188055 ?auto_1188059 ) ) ( not ( = ?auto_1188055 ?auto_1188060 ) ) ( not ( = ?auto_1188055 ?auto_1188064 ) ) ( not ( = ?auto_1188054 ?auto_1188056 ) ) ( not ( = ?auto_1188054 ?auto_1188057 ) ) ( not ( = ?auto_1188054 ?auto_1188058 ) ) ( not ( = ?auto_1188054 ?auto_1188059 ) ) ( not ( = ?auto_1188054 ?auto_1188060 ) ) ( not ( = ?auto_1188054 ?auto_1188064 ) ) ( not ( = ?auto_1188056 ?auto_1188057 ) ) ( not ( = ?auto_1188056 ?auto_1188058 ) ) ( not ( = ?auto_1188056 ?auto_1188059 ) ) ( not ( = ?auto_1188056 ?auto_1188060 ) ) ( not ( = ?auto_1188056 ?auto_1188064 ) ) ( not ( = ?auto_1188057 ?auto_1188058 ) ) ( not ( = ?auto_1188057 ?auto_1188059 ) ) ( not ( = ?auto_1188057 ?auto_1188060 ) ) ( not ( = ?auto_1188057 ?auto_1188064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1188058 ?auto_1188059 ?auto_1188060 )
      ( MAKE-9CRATE-VERIFY ?auto_1188051 ?auto_1188052 ?auto_1188053 ?auto_1188055 ?auto_1188054 ?auto_1188056 ?auto_1188057 ?auto_1188058 ?auto_1188059 ?auto_1188060 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1188160 - SURFACE
      ?auto_1188161 - SURFACE
      ?auto_1188162 - SURFACE
      ?auto_1188164 - SURFACE
      ?auto_1188163 - SURFACE
      ?auto_1188165 - SURFACE
      ?auto_1188166 - SURFACE
      ?auto_1188167 - SURFACE
      ?auto_1188168 - SURFACE
      ?auto_1188169 - SURFACE
    )
    :vars
    (
      ?auto_1188174 - HOIST
      ?auto_1188171 - PLACE
      ?auto_1188170 - PLACE
      ?auto_1188173 - HOIST
      ?auto_1188172 - SURFACE
      ?auto_1188175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188174 ?auto_1188171 ) ( IS-CRATE ?auto_1188169 ) ( not ( = ?auto_1188168 ?auto_1188169 ) ) ( not ( = ?auto_1188167 ?auto_1188168 ) ) ( not ( = ?auto_1188167 ?auto_1188169 ) ) ( not ( = ?auto_1188170 ?auto_1188171 ) ) ( HOIST-AT ?auto_1188173 ?auto_1188170 ) ( not ( = ?auto_1188174 ?auto_1188173 ) ) ( AVAILABLE ?auto_1188173 ) ( SURFACE-AT ?auto_1188169 ?auto_1188170 ) ( ON ?auto_1188169 ?auto_1188172 ) ( CLEAR ?auto_1188169 ) ( not ( = ?auto_1188168 ?auto_1188172 ) ) ( not ( = ?auto_1188169 ?auto_1188172 ) ) ( not ( = ?auto_1188167 ?auto_1188172 ) ) ( TRUCK-AT ?auto_1188175 ?auto_1188171 ) ( SURFACE-AT ?auto_1188167 ?auto_1188171 ) ( CLEAR ?auto_1188167 ) ( IS-CRATE ?auto_1188168 ) ( AVAILABLE ?auto_1188174 ) ( IN ?auto_1188168 ?auto_1188175 ) ( ON ?auto_1188161 ?auto_1188160 ) ( ON ?auto_1188162 ?auto_1188161 ) ( ON ?auto_1188164 ?auto_1188162 ) ( ON ?auto_1188163 ?auto_1188164 ) ( ON ?auto_1188165 ?auto_1188163 ) ( ON ?auto_1188166 ?auto_1188165 ) ( ON ?auto_1188167 ?auto_1188166 ) ( not ( = ?auto_1188160 ?auto_1188161 ) ) ( not ( = ?auto_1188160 ?auto_1188162 ) ) ( not ( = ?auto_1188160 ?auto_1188164 ) ) ( not ( = ?auto_1188160 ?auto_1188163 ) ) ( not ( = ?auto_1188160 ?auto_1188165 ) ) ( not ( = ?auto_1188160 ?auto_1188166 ) ) ( not ( = ?auto_1188160 ?auto_1188167 ) ) ( not ( = ?auto_1188160 ?auto_1188168 ) ) ( not ( = ?auto_1188160 ?auto_1188169 ) ) ( not ( = ?auto_1188160 ?auto_1188172 ) ) ( not ( = ?auto_1188161 ?auto_1188162 ) ) ( not ( = ?auto_1188161 ?auto_1188164 ) ) ( not ( = ?auto_1188161 ?auto_1188163 ) ) ( not ( = ?auto_1188161 ?auto_1188165 ) ) ( not ( = ?auto_1188161 ?auto_1188166 ) ) ( not ( = ?auto_1188161 ?auto_1188167 ) ) ( not ( = ?auto_1188161 ?auto_1188168 ) ) ( not ( = ?auto_1188161 ?auto_1188169 ) ) ( not ( = ?auto_1188161 ?auto_1188172 ) ) ( not ( = ?auto_1188162 ?auto_1188164 ) ) ( not ( = ?auto_1188162 ?auto_1188163 ) ) ( not ( = ?auto_1188162 ?auto_1188165 ) ) ( not ( = ?auto_1188162 ?auto_1188166 ) ) ( not ( = ?auto_1188162 ?auto_1188167 ) ) ( not ( = ?auto_1188162 ?auto_1188168 ) ) ( not ( = ?auto_1188162 ?auto_1188169 ) ) ( not ( = ?auto_1188162 ?auto_1188172 ) ) ( not ( = ?auto_1188164 ?auto_1188163 ) ) ( not ( = ?auto_1188164 ?auto_1188165 ) ) ( not ( = ?auto_1188164 ?auto_1188166 ) ) ( not ( = ?auto_1188164 ?auto_1188167 ) ) ( not ( = ?auto_1188164 ?auto_1188168 ) ) ( not ( = ?auto_1188164 ?auto_1188169 ) ) ( not ( = ?auto_1188164 ?auto_1188172 ) ) ( not ( = ?auto_1188163 ?auto_1188165 ) ) ( not ( = ?auto_1188163 ?auto_1188166 ) ) ( not ( = ?auto_1188163 ?auto_1188167 ) ) ( not ( = ?auto_1188163 ?auto_1188168 ) ) ( not ( = ?auto_1188163 ?auto_1188169 ) ) ( not ( = ?auto_1188163 ?auto_1188172 ) ) ( not ( = ?auto_1188165 ?auto_1188166 ) ) ( not ( = ?auto_1188165 ?auto_1188167 ) ) ( not ( = ?auto_1188165 ?auto_1188168 ) ) ( not ( = ?auto_1188165 ?auto_1188169 ) ) ( not ( = ?auto_1188165 ?auto_1188172 ) ) ( not ( = ?auto_1188166 ?auto_1188167 ) ) ( not ( = ?auto_1188166 ?auto_1188168 ) ) ( not ( = ?auto_1188166 ?auto_1188169 ) ) ( not ( = ?auto_1188166 ?auto_1188172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1188167 ?auto_1188168 ?auto_1188169 )
      ( MAKE-9CRATE-VERIFY ?auto_1188160 ?auto_1188161 ?auto_1188162 ?auto_1188164 ?auto_1188163 ?auto_1188165 ?auto_1188166 ?auto_1188167 ?auto_1188168 ?auto_1188169 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1193725 - SURFACE
      ?auto_1193726 - SURFACE
      ?auto_1193727 - SURFACE
      ?auto_1193729 - SURFACE
      ?auto_1193728 - SURFACE
      ?auto_1193730 - SURFACE
      ?auto_1193731 - SURFACE
      ?auto_1193732 - SURFACE
      ?auto_1193733 - SURFACE
      ?auto_1193734 - SURFACE
      ?auto_1193735 - SURFACE
    )
    :vars
    (
      ?auto_1193736 - HOIST
      ?auto_1193737 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1193736 ?auto_1193737 ) ( SURFACE-AT ?auto_1193734 ?auto_1193737 ) ( CLEAR ?auto_1193734 ) ( LIFTING ?auto_1193736 ?auto_1193735 ) ( IS-CRATE ?auto_1193735 ) ( not ( = ?auto_1193734 ?auto_1193735 ) ) ( ON ?auto_1193726 ?auto_1193725 ) ( ON ?auto_1193727 ?auto_1193726 ) ( ON ?auto_1193729 ?auto_1193727 ) ( ON ?auto_1193728 ?auto_1193729 ) ( ON ?auto_1193730 ?auto_1193728 ) ( ON ?auto_1193731 ?auto_1193730 ) ( ON ?auto_1193732 ?auto_1193731 ) ( ON ?auto_1193733 ?auto_1193732 ) ( ON ?auto_1193734 ?auto_1193733 ) ( not ( = ?auto_1193725 ?auto_1193726 ) ) ( not ( = ?auto_1193725 ?auto_1193727 ) ) ( not ( = ?auto_1193725 ?auto_1193729 ) ) ( not ( = ?auto_1193725 ?auto_1193728 ) ) ( not ( = ?auto_1193725 ?auto_1193730 ) ) ( not ( = ?auto_1193725 ?auto_1193731 ) ) ( not ( = ?auto_1193725 ?auto_1193732 ) ) ( not ( = ?auto_1193725 ?auto_1193733 ) ) ( not ( = ?auto_1193725 ?auto_1193734 ) ) ( not ( = ?auto_1193725 ?auto_1193735 ) ) ( not ( = ?auto_1193726 ?auto_1193727 ) ) ( not ( = ?auto_1193726 ?auto_1193729 ) ) ( not ( = ?auto_1193726 ?auto_1193728 ) ) ( not ( = ?auto_1193726 ?auto_1193730 ) ) ( not ( = ?auto_1193726 ?auto_1193731 ) ) ( not ( = ?auto_1193726 ?auto_1193732 ) ) ( not ( = ?auto_1193726 ?auto_1193733 ) ) ( not ( = ?auto_1193726 ?auto_1193734 ) ) ( not ( = ?auto_1193726 ?auto_1193735 ) ) ( not ( = ?auto_1193727 ?auto_1193729 ) ) ( not ( = ?auto_1193727 ?auto_1193728 ) ) ( not ( = ?auto_1193727 ?auto_1193730 ) ) ( not ( = ?auto_1193727 ?auto_1193731 ) ) ( not ( = ?auto_1193727 ?auto_1193732 ) ) ( not ( = ?auto_1193727 ?auto_1193733 ) ) ( not ( = ?auto_1193727 ?auto_1193734 ) ) ( not ( = ?auto_1193727 ?auto_1193735 ) ) ( not ( = ?auto_1193729 ?auto_1193728 ) ) ( not ( = ?auto_1193729 ?auto_1193730 ) ) ( not ( = ?auto_1193729 ?auto_1193731 ) ) ( not ( = ?auto_1193729 ?auto_1193732 ) ) ( not ( = ?auto_1193729 ?auto_1193733 ) ) ( not ( = ?auto_1193729 ?auto_1193734 ) ) ( not ( = ?auto_1193729 ?auto_1193735 ) ) ( not ( = ?auto_1193728 ?auto_1193730 ) ) ( not ( = ?auto_1193728 ?auto_1193731 ) ) ( not ( = ?auto_1193728 ?auto_1193732 ) ) ( not ( = ?auto_1193728 ?auto_1193733 ) ) ( not ( = ?auto_1193728 ?auto_1193734 ) ) ( not ( = ?auto_1193728 ?auto_1193735 ) ) ( not ( = ?auto_1193730 ?auto_1193731 ) ) ( not ( = ?auto_1193730 ?auto_1193732 ) ) ( not ( = ?auto_1193730 ?auto_1193733 ) ) ( not ( = ?auto_1193730 ?auto_1193734 ) ) ( not ( = ?auto_1193730 ?auto_1193735 ) ) ( not ( = ?auto_1193731 ?auto_1193732 ) ) ( not ( = ?auto_1193731 ?auto_1193733 ) ) ( not ( = ?auto_1193731 ?auto_1193734 ) ) ( not ( = ?auto_1193731 ?auto_1193735 ) ) ( not ( = ?auto_1193732 ?auto_1193733 ) ) ( not ( = ?auto_1193732 ?auto_1193734 ) ) ( not ( = ?auto_1193732 ?auto_1193735 ) ) ( not ( = ?auto_1193733 ?auto_1193734 ) ) ( not ( = ?auto_1193733 ?auto_1193735 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1193734 ?auto_1193735 )
      ( MAKE-10CRATE-VERIFY ?auto_1193725 ?auto_1193726 ?auto_1193727 ?auto_1193729 ?auto_1193728 ?auto_1193730 ?auto_1193731 ?auto_1193732 ?auto_1193733 ?auto_1193734 ?auto_1193735 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1193819 - SURFACE
      ?auto_1193820 - SURFACE
      ?auto_1193821 - SURFACE
      ?auto_1193823 - SURFACE
      ?auto_1193822 - SURFACE
      ?auto_1193824 - SURFACE
      ?auto_1193825 - SURFACE
      ?auto_1193826 - SURFACE
      ?auto_1193827 - SURFACE
      ?auto_1193828 - SURFACE
      ?auto_1193829 - SURFACE
    )
    :vars
    (
      ?auto_1193830 - HOIST
      ?auto_1193831 - PLACE
      ?auto_1193832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1193830 ?auto_1193831 ) ( SURFACE-AT ?auto_1193828 ?auto_1193831 ) ( CLEAR ?auto_1193828 ) ( IS-CRATE ?auto_1193829 ) ( not ( = ?auto_1193828 ?auto_1193829 ) ) ( TRUCK-AT ?auto_1193832 ?auto_1193831 ) ( AVAILABLE ?auto_1193830 ) ( IN ?auto_1193829 ?auto_1193832 ) ( ON ?auto_1193828 ?auto_1193827 ) ( not ( = ?auto_1193827 ?auto_1193828 ) ) ( not ( = ?auto_1193827 ?auto_1193829 ) ) ( ON ?auto_1193820 ?auto_1193819 ) ( ON ?auto_1193821 ?auto_1193820 ) ( ON ?auto_1193823 ?auto_1193821 ) ( ON ?auto_1193822 ?auto_1193823 ) ( ON ?auto_1193824 ?auto_1193822 ) ( ON ?auto_1193825 ?auto_1193824 ) ( ON ?auto_1193826 ?auto_1193825 ) ( ON ?auto_1193827 ?auto_1193826 ) ( not ( = ?auto_1193819 ?auto_1193820 ) ) ( not ( = ?auto_1193819 ?auto_1193821 ) ) ( not ( = ?auto_1193819 ?auto_1193823 ) ) ( not ( = ?auto_1193819 ?auto_1193822 ) ) ( not ( = ?auto_1193819 ?auto_1193824 ) ) ( not ( = ?auto_1193819 ?auto_1193825 ) ) ( not ( = ?auto_1193819 ?auto_1193826 ) ) ( not ( = ?auto_1193819 ?auto_1193827 ) ) ( not ( = ?auto_1193819 ?auto_1193828 ) ) ( not ( = ?auto_1193819 ?auto_1193829 ) ) ( not ( = ?auto_1193820 ?auto_1193821 ) ) ( not ( = ?auto_1193820 ?auto_1193823 ) ) ( not ( = ?auto_1193820 ?auto_1193822 ) ) ( not ( = ?auto_1193820 ?auto_1193824 ) ) ( not ( = ?auto_1193820 ?auto_1193825 ) ) ( not ( = ?auto_1193820 ?auto_1193826 ) ) ( not ( = ?auto_1193820 ?auto_1193827 ) ) ( not ( = ?auto_1193820 ?auto_1193828 ) ) ( not ( = ?auto_1193820 ?auto_1193829 ) ) ( not ( = ?auto_1193821 ?auto_1193823 ) ) ( not ( = ?auto_1193821 ?auto_1193822 ) ) ( not ( = ?auto_1193821 ?auto_1193824 ) ) ( not ( = ?auto_1193821 ?auto_1193825 ) ) ( not ( = ?auto_1193821 ?auto_1193826 ) ) ( not ( = ?auto_1193821 ?auto_1193827 ) ) ( not ( = ?auto_1193821 ?auto_1193828 ) ) ( not ( = ?auto_1193821 ?auto_1193829 ) ) ( not ( = ?auto_1193823 ?auto_1193822 ) ) ( not ( = ?auto_1193823 ?auto_1193824 ) ) ( not ( = ?auto_1193823 ?auto_1193825 ) ) ( not ( = ?auto_1193823 ?auto_1193826 ) ) ( not ( = ?auto_1193823 ?auto_1193827 ) ) ( not ( = ?auto_1193823 ?auto_1193828 ) ) ( not ( = ?auto_1193823 ?auto_1193829 ) ) ( not ( = ?auto_1193822 ?auto_1193824 ) ) ( not ( = ?auto_1193822 ?auto_1193825 ) ) ( not ( = ?auto_1193822 ?auto_1193826 ) ) ( not ( = ?auto_1193822 ?auto_1193827 ) ) ( not ( = ?auto_1193822 ?auto_1193828 ) ) ( not ( = ?auto_1193822 ?auto_1193829 ) ) ( not ( = ?auto_1193824 ?auto_1193825 ) ) ( not ( = ?auto_1193824 ?auto_1193826 ) ) ( not ( = ?auto_1193824 ?auto_1193827 ) ) ( not ( = ?auto_1193824 ?auto_1193828 ) ) ( not ( = ?auto_1193824 ?auto_1193829 ) ) ( not ( = ?auto_1193825 ?auto_1193826 ) ) ( not ( = ?auto_1193825 ?auto_1193827 ) ) ( not ( = ?auto_1193825 ?auto_1193828 ) ) ( not ( = ?auto_1193825 ?auto_1193829 ) ) ( not ( = ?auto_1193826 ?auto_1193827 ) ) ( not ( = ?auto_1193826 ?auto_1193828 ) ) ( not ( = ?auto_1193826 ?auto_1193829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1193827 ?auto_1193828 ?auto_1193829 )
      ( MAKE-10CRATE-VERIFY ?auto_1193819 ?auto_1193820 ?auto_1193821 ?auto_1193823 ?auto_1193822 ?auto_1193824 ?auto_1193825 ?auto_1193826 ?auto_1193827 ?auto_1193828 ?auto_1193829 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1193924 - SURFACE
      ?auto_1193925 - SURFACE
      ?auto_1193926 - SURFACE
      ?auto_1193928 - SURFACE
      ?auto_1193927 - SURFACE
      ?auto_1193929 - SURFACE
      ?auto_1193930 - SURFACE
      ?auto_1193931 - SURFACE
      ?auto_1193932 - SURFACE
      ?auto_1193933 - SURFACE
      ?auto_1193934 - SURFACE
    )
    :vars
    (
      ?auto_1193938 - HOIST
      ?auto_1193935 - PLACE
      ?auto_1193937 - TRUCK
      ?auto_1193936 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1193938 ?auto_1193935 ) ( SURFACE-AT ?auto_1193933 ?auto_1193935 ) ( CLEAR ?auto_1193933 ) ( IS-CRATE ?auto_1193934 ) ( not ( = ?auto_1193933 ?auto_1193934 ) ) ( AVAILABLE ?auto_1193938 ) ( IN ?auto_1193934 ?auto_1193937 ) ( ON ?auto_1193933 ?auto_1193932 ) ( not ( = ?auto_1193932 ?auto_1193933 ) ) ( not ( = ?auto_1193932 ?auto_1193934 ) ) ( TRUCK-AT ?auto_1193937 ?auto_1193936 ) ( not ( = ?auto_1193936 ?auto_1193935 ) ) ( ON ?auto_1193925 ?auto_1193924 ) ( ON ?auto_1193926 ?auto_1193925 ) ( ON ?auto_1193928 ?auto_1193926 ) ( ON ?auto_1193927 ?auto_1193928 ) ( ON ?auto_1193929 ?auto_1193927 ) ( ON ?auto_1193930 ?auto_1193929 ) ( ON ?auto_1193931 ?auto_1193930 ) ( ON ?auto_1193932 ?auto_1193931 ) ( not ( = ?auto_1193924 ?auto_1193925 ) ) ( not ( = ?auto_1193924 ?auto_1193926 ) ) ( not ( = ?auto_1193924 ?auto_1193928 ) ) ( not ( = ?auto_1193924 ?auto_1193927 ) ) ( not ( = ?auto_1193924 ?auto_1193929 ) ) ( not ( = ?auto_1193924 ?auto_1193930 ) ) ( not ( = ?auto_1193924 ?auto_1193931 ) ) ( not ( = ?auto_1193924 ?auto_1193932 ) ) ( not ( = ?auto_1193924 ?auto_1193933 ) ) ( not ( = ?auto_1193924 ?auto_1193934 ) ) ( not ( = ?auto_1193925 ?auto_1193926 ) ) ( not ( = ?auto_1193925 ?auto_1193928 ) ) ( not ( = ?auto_1193925 ?auto_1193927 ) ) ( not ( = ?auto_1193925 ?auto_1193929 ) ) ( not ( = ?auto_1193925 ?auto_1193930 ) ) ( not ( = ?auto_1193925 ?auto_1193931 ) ) ( not ( = ?auto_1193925 ?auto_1193932 ) ) ( not ( = ?auto_1193925 ?auto_1193933 ) ) ( not ( = ?auto_1193925 ?auto_1193934 ) ) ( not ( = ?auto_1193926 ?auto_1193928 ) ) ( not ( = ?auto_1193926 ?auto_1193927 ) ) ( not ( = ?auto_1193926 ?auto_1193929 ) ) ( not ( = ?auto_1193926 ?auto_1193930 ) ) ( not ( = ?auto_1193926 ?auto_1193931 ) ) ( not ( = ?auto_1193926 ?auto_1193932 ) ) ( not ( = ?auto_1193926 ?auto_1193933 ) ) ( not ( = ?auto_1193926 ?auto_1193934 ) ) ( not ( = ?auto_1193928 ?auto_1193927 ) ) ( not ( = ?auto_1193928 ?auto_1193929 ) ) ( not ( = ?auto_1193928 ?auto_1193930 ) ) ( not ( = ?auto_1193928 ?auto_1193931 ) ) ( not ( = ?auto_1193928 ?auto_1193932 ) ) ( not ( = ?auto_1193928 ?auto_1193933 ) ) ( not ( = ?auto_1193928 ?auto_1193934 ) ) ( not ( = ?auto_1193927 ?auto_1193929 ) ) ( not ( = ?auto_1193927 ?auto_1193930 ) ) ( not ( = ?auto_1193927 ?auto_1193931 ) ) ( not ( = ?auto_1193927 ?auto_1193932 ) ) ( not ( = ?auto_1193927 ?auto_1193933 ) ) ( not ( = ?auto_1193927 ?auto_1193934 ) ) ( not ( = ?auto_1193929 ?auto_1193930 ) ) ( not ( = ?auto_1193929 ?auto_1193931 ) ) ( not ( = ?auto_1193929 ?auto_1193932 ) ) ( not ( = ?auto_1193929 ?auto_1193933 ) ) ( not ( = ?auto_1193929 ?auto_1193934 ) ) ( not ( = ?auto_1193930 ?auto_1193931 ) ) ( not ( = ?auto_1193930 ?auto_1193932 ) ) ( not ( = ?auto_1193930 ?auto_1193933 ) ) ( not ( = ?auto_1193930 ?auto_1193934 ) ) ( not ( = ?auto_1193931 ?auto_1193932 ) ) ( not ( = ?auto_1193931 ?auto_1193933 ) ) ( not ( = ?auto_1193931 ?auto_1193934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1193932 ?auto_1193933 ?auto_1193934 )
      ( MAKE-10CRATE-VERIFY ?auto_1193924 ?auto_1193925 ?auto_1193926 ?auto_1193928 ?auto_1193927 ?auto_1193929 ?auto_1193930 ?auto_1193931 ?auto_1193932 ?auto_1193933 ?auto_1193934 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1194039 - SURFACE
      ?auto_1194040 - SURFACE
      ?auto_1194041 - SURFACE
      ?auto_1194043 - SURFACE
      ?auto_1194042 - SURFACE
      ?auto_1194044 - SURFACE
      ?auto_1194045 - SURFACE
      ?auto_1194046 - SURFACE
      ?auto_1194047 - SURFACE
      ?auto_1194048 - SURFACE
      ?auto_1194049 - SURFACE
    )
    :vars
    (
      ?auto_1194050 - HOIST
      ?auto_1194053 - PLACE
      ?auto_1194051 - TRUCK
      ?auto_1194052 - PLACE
      ?auto_1194054 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194050 ?auto_1194053 ) ( SURFACE-AT ?auto_1194048 ?auto_1194053 ) ( CLEAR ?auto_1194048 ) ( IS-CRATE ?auto_1194049 ) ( not ( = ?auto_1194048 ?auto_1194049 ) ) ( AVAILABLE ?auto_1194050 ) ( ON ?auto_1194048 ?auto_1194047 ) ( not ( = ?auto_1194047 ?auto_1194048 ) ) ( not ( = ?auto_1194047 ?auto_1194049 ) ) ( TRUCK-AT ?auto_1194051 ?auto_1194052 ) ( not ( = ?auto_1194052 ?auto_1194053 ) ) ( HOIST-AT ?auto_1194054 ?auto_1194052 ) ( LIFTING ?auto_1194054 ?auto_1194049 ) ( not ( = ?auto_1194050 ?auto_1194054 ) ) ( ON ?auto_1194040 ?auto_1194039 ) ( ON ?auto_1194041 ?auto_1194040 ) ( ON ?auto_1194043 ?auto_1194041 ) ( ON ?auto_1194042 ?auto_1194043 ) ( ON ?auto_1194044 ?auto_1194042 ) ( ON ?auto_1194045 ?auto_1194044 ) ( ON ?auto_1194046 ?auto_1194045 ) ( ON ?auto_1194047 ?auto_1194046 ) ( not ( = ?auto_1194039 ?auto_1194040 ) ) ( not ( = ?auto_1194039 ?auto_1194041 ) ) ( not ( = ?auto_1194039 ?auto_1194043 ) ) ( not ( = ?auto_1194039 ?auto_1194042 ) ) ( not ( = ?auto_1194039 ?auto_1194044 ) ) ( not ( = ?auto_1194039 ?auto_1194045 ) ) ( not ( = ?auto_1194039 ?auto_1194046 ) ) ( not ( = ?auto_1194039 ?auto_1194047 ) ) ( not ( = ?auto_1194039 ?auto_1194048 ) ) ( not ( = ?auto_1194039 ?auto_1194049 ) ) ( not ( = ?auto_1194040 ?auto_1194041 ) ) ( not ( = ?auto_1194040 ?auto_1194043 ) ) ( not ( = ?auto_1194040 ?auto_1194042 ) ) ( not ( = ?auto_1194040 ?auto_1194044 ) ) ( not ( = ?auto_1194040 ?auto_1194045 ) ) ( not ( = ?auto_1194040 ?auto_1194046 ) ) ( not ( = ?auto_1194040 ?auto_1194047 ) ) ( not ( = ?auto_1194040 ?auto_1194048 ) ) ( not ( = ?auto_1194040 ?auto_1194049 ) ) ( not ( = ?auto_1194041 ?auto_1194043 ) ) ( not ( = ?auto_1194041 ?auto_1194042 ) ) ( not ( = ?auto_1194041 ?auto_1194044 ) ) ( not ( = ?auto_1194041 ?auto_1194045 ) ) ( not ( = ?auto_1194041 ?auto_1194046 ) ) ( not ( = ?auto_1194041 ?auto_1194047 ) ) ( not ( = ?auto_1194041 ?auto_1194048 ) ) ( not ( = ?auto_1194041 ?auto_1194049 ) ) ( not ( = ?auto_1194043 ?auto_1194042 ) ) ( not ( = ?auto_1194043 ?auto_1194044 ) ) ( not ( = ?auto_1194043 ?auto_1194045 ) ) ( not ( = ?auto_1194043 ?auto_1194046 ) ) ( not ( = ?auto_1194043 ?auto_1194047 ) ) ( not ( = ?auto_1194043 ?auto_1194048 ) ) ( not ( = ?auto_1194043 ?auto_1194049 ) ) ( not ( = ?auto_1194042 ?auto_1194044 ) ) ( not ( = ?auto_1194042 ?auto_1194045 ) ) ( not ( = ?auto_1194042 ?auto_1194046 ) ) ( not ( = ?auto_1194042 ?auto_1194047 ) ) ( not ( = ?auto_1194042 ?auto_1194048 ) ) ( not ( = ?auto_1194042 ?auto_1194049 ) ) ( not ( = ?auto_1194044 ?auto_1194045 ) ) ( not ( = ?auto_1194044 ?auto_1194046 ) ) ( not ( = ?auto_1194044 ?auto_1194047 ) ) ( not ( = ?auto_1194044 ?auto_1194048 ) ) ( not ( = ?auto_1194044 ?auto_1194049 ) ) ( not ( = ?auto_1194045 ?auto_1194046 ) ) ( not ( = ?auto_1194045 ?auto_1194047 ) ) ( not ( = ?auto_1194045 ?auto_1194048 ) ) ( not ( = ?auto_1194045 ?auto_1194049 ) ) ( not ( = ?auto_1194046 ?auto_1194047 ) ) ( not ( = ?auto_1194046 ?auto_1194048 ) ) ( not ( = ?auto_1194046 ?auto_1194049 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194047 ?auto_1194048 ?auto_1194049 )
      ( MAKE-10CRATE-VERIFY ?auto_1194039 ?auto_1194040 ?auto_1194041 ?auto_1194043 ?auto_1194042 ?auto_1194044 ?auto_1194045 ?auto_1194046 ?auto_1194047 ?auto_1194048 ?auto_1194049 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1194164 - SURFACE
      ?auto_1194165 - SURFACE
      ?auto_1194166 - SURFACE
      ?auto_1194168 - SURFACE
      ?auto_1194167 - SURFACE
      ?auto_1194169 - SURFACE
      ?auto_1194170 - SURFACE
      ?auto_1194171 - SURFACE
      ?auto_1194172 - SURFACE
      ?auto_1194173 - SURFACE
      ?auto_1194174 - SURFACE
    )
    :vars
    (
      ?auto_1194180 - HOIST
      ?auto_1194178 - PLACE
      ?auto_1194175 - TRUCK
      ?auto_1194177 - PLACE
      ?auto_1194179 - HOIST
      ?auto_1194176 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194180 ?auto_1194178 ) ( SURFACE-AT ?auto_1194173 ?auto_1194178 ) ( CLEAR ?auto_1194173 ) ( IS-CRATE ?auto_1194174 ) ( not ( = ?auto_1194173 ?auto_1194174 ) ) ( AVAILABLE ?auto_1194180 ) ( ON ?auto_1194173 ?auto_1194172 ) ( not ( = ?auto_1194172 ?auto_1194173 ) ) ( not ( = ?auto_1194172 ?auto_1194174 ) ) ( TRUCK-AT ?auto_1194175 ?auto_1194177 ) ( not ( = ?auto_1194177 ?auto_1194178 ) ) ( HOIST-AT ?auto_1194179 ?auto_1194177 ) ( not ( = ?auto_1194180 ?auto_1194179 ) ) ( AVAILABLE ?auto_1194179 ) ( SURFACE-AT ?auto_1194174 ?auto_1194177 ) ( ON ?auto_1194174 ?auto_1194176 ) ( CLEAR ?auto_1194174 ) ( not ( = ?auto_1194173 ?auto_1194176 ) ) ( not ( = ?auto_1194174 ?auto_1194176 ) ) ( not ( = ?auto_1194172 ?auto_1194176 ) ) ( ON ?auto_1194165 ?auto_1194164 ) ( ON ?auto_1194166 ?auto_1194165 ) ( ON ?auto_1194168 ?auto_1194166 ) ( ON ?auto_1194167 ?auto_1194168 ) ( ON ?auto_1194169 ?auto_1194167 ) ( ON ?auto_1194170 ?auto_1194169 ) ( ON ?auto_1194171 ?auto_1194170 ) ( ON ?auto_1194172 ?auto_1194171 ) ( not ( = ?auto_1194164 ?auto_1194165 ) ) ( not ( = ?auto_1194164 ?auto_1194166 ) ) ( not ( = ?auto_1194164 ?auto_1194168 ) ) ( not ( = ?auto_1194164 ?auto_1194167 ) ) ( not ( = ?auto_1194164 ?auto_1194169 ) ) ( not ( = ?auto_1194164 ?auto_1194170 ) ) ( not ( = ?auto_1194164 ?auto_1194171 ) ) ( not ( = ?auto_1194164 ?auto_1194172 ) ) ( not ( = ?auto_1194164 ?auto_1194173 ) ) ( not ( = ?auto_1194164 ?auto_1194174 ) ) ( not ( = ?auto_1194164 ?auto_1194176 ) ) ( not ( = ?auto_1194165 ?auto_1194166 ) ) ( not ( = ?auto_1194165 ?auto_1194168 ) ) ( not ( = ?auto_1194165 ?auto_1194167 ) ) ( not ( = ?auto_1194165 ?auto_1194169 ) ) ( not ( = ?auto_1194165 ?auto_1194170 ) ) ( not ( = ?auto_1194165 ?auto_1194171 ) ) ( not ( = ?auto_1194165 ?auto_1194172 ) ) ( not ( = ?auto_1194165 ?auto_1194173 ) ) ( not ( = ?auto_1194165 ?auto_1194174 ) ) ( not ( = ?auto_1194165 ?auto_1194176 ) ) ( not ( = ?auto_1194166 ?auto_1194168 ) ) ( not ( = ?auto_1194166 ?auto_1194167 ) ) ( not ( = ?auto_1194166 ?auto_1194169 ) ) ( not ( = ?auto_1194166 ?auto_1194170 ) ) ( not ( = ?auto_1194166 ?auto_1194171 ) ) ( not ( = ?auto_1194166 ?auto_1194172 ) ) ( not ( = ?auto_1194166 ?auto_1194173 ) ) ( not ( = ?auto_1194166 ?auto_1194174 ) ) ( not ( = ?auto_1194166 ?auto_1194176 ) ) ( not ( = ?auto_1194168 ?auto_1194167 ) ) ( not ( = ?auto_1194168 ?auto_1194169 ) ) ( not ( = ?auto_1194168 ?auto_1194170 ) ) ( not ( = ?auto_1194168 ?auto_1194171 ) ) ( not ( = ?auto_1194168 ?auto_1194172 ) ) ( not ( = ?auto_1194168 ?auto_1194173 ) ) ( not ( = ?auto_1194168 ?auto_1194174 ) ) ( not ( = ?auto_1194168 ?auto_1194176 ) ) ( not ( = ?auto_1194167 ?auto_1194169 ) ) ( not ( = ?auto_1194167 ?auto_1194170 ) ) ( not ( = ?auto_1194167 ?auto_1194171 ) ) ( not ( = ?auto_1194167 ?auto_1194172 ) ) ( not ( = ?auto_1194167 ?auto_1194173 ) ) ( not ( = ?auto_1194167 ?auto_1194174 ) ) ( not ( = ?auto_1194167 ?auto_1194176 ) ) ( not ( = ?auto_1194169 ?auto_1194170 ) ) ( not ( = ?auto_1194169 ?auto_1194171 ) ) ( not ( = ?auto_1194169 ?auto_1194172 ) ) ( not ( = ?auto_1194169 ?auto_1194173 ) ) ( not ( = ?auto_1194169 ?auto_1194174 ) ) ( not ( = ?auto_1194169 ?auto_1194176 ) ) ( not ( = ?auto_1194170 ?auto_1194171 ) ) ( not ( = ?auto_1194170 ?auto_1194172 ) ) ( not ( = ?auto_1194170 ?auto_1194173 ) ) ( not ( = ?auto_1194170 ?auto_1194174 ) ) ( not ( = ?auto_1194170 ?auto_1194176 ) ) ( not ( = ?auto_1194171 ?auto_1194172 ) ) ( not ( = ?auto_1194171 ?auto_1194173 ) ) ( not ( = ?auto_1194171 ?auto_1194174 ) ) ( not ( = ?auto_1194171 ?auto_1194176 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194172 ?auto_1194173 ?auto_1194174 )
      ( MAKE-10CRATE-VERIFY ?auto_1194164 ?auto_1194165 ?auto_1194166 ?auto_1194168 ?auto_1194167 ?auto_1194169 ?auto_1194170 ?auto_1194171 ?auto_1194172 ?auto_1194173 ?auto_1194174 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1194290 - SURFACE
      ?auto_1194291 - SURFACE
      ?auto_1194292 - SURFACE
      ?auto_1194294 - SURFACE
      ?auto_1194293 - SURFACE
      ?auto_1194295 - SURFACE
      ?auto_1194296 - SURFACE
      ?auto_1194297 - SURFACE
      ?auto_1194298 - SURFACE
      ?auto_1194299 - SURFACE
      ?auto_1194300 - SURFACE
    )
    :vars
    (
      ?auto_1194301 - HOIST
      ?auto_1194302 - PLACE
      ?auto_1194303 - PLACE
      ?auto_1194305 - HOIST
      ?auto_1194306 - SURFACE
      ?auto_1194304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194301 ?auto_1194302 ) ( SURFACE-AT ?auto_1194299 ?auto_1194302 ) ( CLEAR ?auto_1194299 ) ( IS-CRATE ?auto_1194300 ) ( not ( = ?auto_1194299 ?auto_1194300 ) ) ( AVAILABLE ?auto_1194301 ) ( ON ?auto_1194299 ?auto_1194298 ) ( not ( = ?auto_1194298 ?auto_1194299 ) ) ( not ( = ?auto_1194298 ?auto_1194300 ) ) ( not ( = ?auto_1194303 ?auto_1194302 ) ) ( HOIST-AT ?auto_1194305 ?auto_1194303 ) ( not ( = ?auto_1194301 ?auto_1194305 ) ) ( AVAILABLE ?auto_1194305 ) ( SURFACE-AT ?auto_1194300 ?auto_1194303 ) ( ON ?auto_1194300 ?auto_1194306 ) ( CLEAR ?auto_1194300 ) ( not ( = ?auto_1194299 ?auto_1194306 ) ) ( not ( = ?auto_1194300 ?auto_1194306 ) ) ( not ( = ?auto_1194298 ?auto_1194306 ) ) ( TRUCK-AT ?auto_1194304 ?auto_1194302 ) ( ON ?auto_1194291 ?auto_1194290 ) ( ON ?auto_1194292 ?auto_1194291 ) ( ON ?auto_1194294 ?auto_1194292 ) ( ON ?auto_1194293 ?auto_1194294 ) ( ON ?auto_1194295 ?auto_1194293 ) ( ON ?auto_1194296 ?auto_1194295 ) ( ON ?auto_1194297 ?auto_1194296 ) ( ON ?auto_1194298 ?auto_1194297 ) ( not ( = ?auto_1194290 ?auto_1194291 ) ) ( not ( = ?auto_1194290 ?auto_1194292 ) ) ( not ( = ?auto_1194290 ?auto_1194294 ) ) ( not ( = ?auto_1194290 ?auto_1194293 ) ) ( not ( = ?auto_1194290 ?auto_1194295 ) ) ( not ( = ?auto_1194290 ?auto_1194296 ) ) ( not ( = ?auto_1194290 ?auto_1194297 ) ) ( not ( = ?auto_1194290 ?auto_1194298 ) ) ( not ( = ?auto_1194290 ?auto_1194299 ) ) ( not ( = ?auto_1194290 ?auto_1194300 ) ) ( not ( = ?auto_1194290 ?auto_1194306 ) ) ( not ( = ?auto_1194291 ?auto_1194292 ) ) ( not ( = ?auto_1194291 ?auto_1194294 ) ) ( not ( = ?auto_1194291 ?auto_1194293 ) ) ( not ( = ?auto_1194291 ?auto_1194295 ) ) ( not ( = ?auto_1194291 ?auto_1194296 ) ) ( not ( = ?auto_1194291 ?auto_1194297 ) ) ( not ( = ?auto_1194291 ?auto_1194298 ) ) ( not ( = ?auto_1194291 ?auto_1194299 ) ) ( not ( = ?auto_1194291 ?auto_1194300 ) ) ( not ( = ?auto_1194291 ?auto_1194306 ) ) ( not ( = ?auto_1194292 ?auto_1194294 ) ) ( not ( = ?auto_1194292 ?auto_1194293 ) ) ( not ( = ?auto_1194292 ?auto_1194295 ) ) ( not ( = ?auto_1194292 ?auto_1194296 ) ) ( not ( = ?auto_1194292 ?auto_1194297 ) ) ( not ( = ?auto_1194292 ?auto_1194298 ) ) ( not ( = ?auto_1194292 ?auto_1194299 ) ) ( not ( = ?auto_1194292 ?auto_1194300 ) ) ( not ( = ?auto_1194292 ?auto_1194306 ) ) ( not ( = ?auto_1194294 ?auto_1194293 ) ) ( not ( = ?auto_1194294 ?auto_1194295 ) ) ( not ( = ?auto_1194294 ?auto_1194296 ) ) ( not ( = ?auto_1194294 ?auto_1194297 ) ) ( not ( = ?auto_1194294 ?auto_1194298 ) ) ( not ( = ?auto_1194294 ?auto_1194299 ) ) ( not ( = ?auto_1194294 ?auto_1194300 ) ) ( not ( = ?auto_1194294 ?auto_1194306 ) ) ( not ( = ?auto_1194293 ?auto_1194295 ) ) ( not ( = ?auto_1194293 ?auto_1194296 ) ) ( not ( = ?auto_1194293 ?auto_1194297 ) ) ( not ( = ?auto_1194293 ?auto_1194298 ) ) ( not ( = ?auto_1194293 ?auto_1194299 ) ) ( not ( = ?auto_1194293 ?auto_1194300 ) ) ( not ( = ?auto_1194293 ?auto_1194306 ) ) ( not ( = ?auto_1194295 ?auto_1194296 ) ) ( not ( = ?auto_1194295 ?auto_1194297 ) ) ( not ( = ?auto_1194295 ?auto_1194298 ) ) ( not ( = ?auto_1194295 ?auto_1194299 ) ) ( not ( = ?auto_1194295 ?auto_1194300 ) ) ( not ( = ?auto_1194295 ?auto_1194306 ) ) ( not ( = ?auto_1194296 ?auto_1194297 ) ) ( not ( = ?auto_1194296 ?auto_1194298 ) ) ( not ( = ?auto_1194296 ?auto_1194299 ) ) ( not ( = ?auto_1194296 ?auto_1194300 ) ) ( not ( = ?auto_1194296 ?auto_1194306 ) ) ( not ( = ?auto_1194297 ?auto_1194298 ) ) ( not ( = ?auto_1194297 ?auto_1194299 ) ) ( not ( = ?auto_1194297 ?auto_1194300 ) ) ( not ( = ?auto_1194297 ?auto_1194306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194298 ?auto_1194299 ?auto_1194300 )
      ( MAKE-10CRATE-VERIFY ?auto_1194290 ?auto_1194291 ?auto_1194292 ?auto_1194294 ?auto_1194293 ?auto_1194295 ?auto_1194296 ?auto_1194297 ?auto_1194298 ?auto_1194299 ?auto_1194300 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1194416 - SURFACE
      ?auto_1194417 - SURFACE
      ?auto_1194418 - SURFACE
      ?auto_1194420 - SURFACE
      ?auto_1194419 - SURFACE
      ?auto_1194421 - SURFACE
      ?auto_1194422 - SURFACE
      ?auto_1194423 - SURFACE
      ?auto_1194424 - SURFACE
      ?auto_1194425 - SURFACE
      ?auto_1194426 - SURFACE
    )
    :vars
    (
      ?auto_1194429 - HOIST
      ?auto_1194432 - PLACE
      ?auto_1194427 - PLACE
      ?auto_1194431 - HOIST
      ?auto_1194428 - SURFACE
      ?auto_1194430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194429 ?auto_1194432 ) ( IS-CRATE ?auto_1194426 ) ( not ( = ?auto_1194425 ?auto_1194426 ) ) ( not ( = ?auto_1194424 ?auto_1194425 ) ) ( not ( = ?auto_1194424 ?auto_1194426 ) ) ( not ( = ?auto_1194427 ?auto_1194432 ) ) ( HOIST-AT ?auto_1194431 ?auto_1194427 ) ( not ( = ?auto_1194429 ?auto_1194431 ) ) ( AVAILABLE ?auto_1194431 ) ( SURFACE-AT ?auto_1194426 ?auto_1194427 ) ( ON ?auto_1194426 ?auto_1194428 ) ( CLEAR ?auto_1194426 ) ( not ( = ?auto_1194425 ?auto_1194428 ) ) ( not ( = ?auto_1194426 ?auto_1194428 ) ) ( not ( = ?auto_1194424 ?auto_1194428 ) ) ( TRUCK-AT ?auto_1194430 ?auto_1194432 ) ( SURFACE-AT ?auto_1194424 ?auto_1194432 ) ( CLEAR ?auto_1194424 ) ( LIFTING ?auto_1194429 ?auto_1194425 ) ( IS-CRATE ?auto_1194425 ) ( ON ?auto_1194417 ?auto_1194416 ) ( ON ?auto_1194418 ?auto_1194417 ) ( ON ?auto_1194420 ?auto_1194418 ) ( ON ?auto_1194419 ?auto_1194420 ) ( ON ?auto_1194421 ?auto_1194419 ) ( ON ?auto_1194422 ?auto_1194421 ) ( ON ?auto_1194423 ?auto_1194422 ) ( ON ?auto_1194424 ?auto_1194423 ) ( not ( = ?auto_1194416 ?auto_1194417 ) ) ( not ( = ?auto_1194416 ?auto_1194418 ) ) ( not ( = ?auto_1194416 ?auto_1194420 ) ) ( not ( = ?auto_1194416 ?auto_1194419 ) ) ( not ( = ?auto_1194416 ?auto_1194421 ) ) ( not ( = ?auto_1194416 ?auto_1194422 ) ) ( not ( = ?auto_1194416 ?auto_1194423 ) ) ( not ( = ?auto_1194416 ?auto_1194424 ) ) ( not ( = ?auto_1194416 ?auto_1194425 ) ) ( not ( = ?auto_1194416 ?auto_1194426 ) ) ( not ( = ?auto_1194416 ?auto_1194428 ) ) ( not ( = ?auto_1194417 ?auto_1194418 ) ) ( not ( = ?auto_1194417 ?auto_1194420 ) ) ( not ( = ?auto_1194417 ?auto_1194419 ) ) ( not ( = ?auto_1194417 ?auto_1194421 ) ) ( not ( = ?auto_1194417 ?auto_1194422 ) ) ( not ( = ?auto_1194417 ?auto_1194423 ) ) ( not ( = ?auto_1194417 ?auto_1194424 ) ) ( not ( = ?auto_1194417 ?auto_1194425 ) ) ( not ( = ?auto_1194417 ?auto_1194426 ) ) ( not ( = ?auto_1194417 ?auto_1194428 ) ) ( not ( = ?auto_1194418 ?auto_1194420 ) ) ( not ( = ?auto_1194418 ?auto_1194419 ) ) ( not ( = ?auto_1194418 ?auto_1194421 ) ) ( not ( = ?auto_1194418 ?auto_1194422 ) ) ( not ( = ?auto_1194418 ?auto_1194423 ) ) ( not ( = ?auto_1194418 ?auto_1194424 ) ) ( not ( = ?auto_1194418 ?auto_1194425 ) ) ( not ( = ?auto_1194418 ?auto_1194426 ) ) ( not ( = ?auto_1194418 ?auto_1194428 ) ) ( not ( = ?auto_1194420 ?auto_1194419 ) ) ( not ( = ?auto_1194420 ?auto_1194421 ) ) ( not ( = ?auto_1194420 ?auto_1194422 ) ) ( not ( = ?auto_1194420 ?auto_1194423 ) ) ( not ( = ?auto_1194420 ?auto_1194424 ) ) ( not ( = ?auto_1194420 ?auto_1194425 ) ) ( not ( = ?auto_1194420 ?auto_1194426 ) ) ( not ( = ?auto_1194420 ?auto_1194428 ) ) ( not ( = ?auto_1194419 ?auto_1194421 ) ) ( not ( = ?auto_1194419 ?auto_1194422 ) ) ( not ( = ?auto_1194419 ?auto_1194423 ) ) ( not ( = ?auto_1194419 ?auto_1194424 ) ) ( not ( = ?auto_1194419 ?auto_1194425 ) ) ( not ( = ?auto_1194419 ?auto_1194426 ) ) ( not ( = ?auto_1194419 ?auto_1194428 ) ) ( not ( = ?auto_1194421 ?auto_1194422 ) ) ( not ( = ?auto_1194421 ?auto_1194423 ) ) ( not ( = ?auto_1194421 ?auto_1194424 ) ) ( not ( = ?auto_1194421 ?auto_1194425 ) ) ( not ( = ?auto_1194421 ?auto_1194426 ) ) ( not ( = ?auto_1194421 ?auto_1194428 ) ) ( not ( = ?auto_1194422 ?auto_1194423 ) ) ( not ( = ?auto_1194422 ?auto_1194424 ) ) ( not ( = ?auto_1194422 ?auto_1194425 ) ) ( not ( = ?auto_1194422 ?auto_1194426 ) ) ( not ( = ?auto_1194422 ?auto_1194428 ) ) ( not ( = ?auto_1194423 ?auto_1194424 ) ) ( not ( = ?auto_1194423 ?auto_1194425 ) ) ( not ( = ?auto_1194423 ?auto_1194426 ) ) ( not ( = ?auto_1194423 ?auto_1194428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194424 ?auto_1194425 ?auto_1194426 )
      ( MAKE-10CRATE-VERIFY ?auto_1194416 ?auto_1194417 ?auto_1194418 ?auto_1194420 ?auto_1194419 ?auto_1194421 ?auto_1194422 ?auto_1194423 ?auto_1194424 ?auto_1194425 ?auto_1194426 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1194542 - SURFACE
      ?auto_1194543 - SURFACE
      ?auto_1194544 - SURFACE
      ?auto_1194546 - SURFACE
      ?auto_1194545 - SURFACE
      ?auto_1194547 - SURFACE
      ?auto_1194548 - SURFACE
      ?auto_1194549 - SURFACE
      ?auto_1194550 - SURFACE
      ?auto_1194551 - SURFACE
      ?auto_1194552 - SURFACE
    )
    :vars
    (
      ?auto_1194558 - HOIST
      ?auto_1194555 - PLACE
      ?auto_1194554 - PLACE
      ?auto_1194556 - HOIST
      ?auto_1194553 - SURFACE
      ?auto_1194557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194558 ?auto_1194555 ) ( IS-CRATE ?auto_1194552 ) ( not ( = ?auto_1194551 ?auto_1194552 ) ) ( not ( = ?auto_1194550 ?auto_1194551 ) ) ( not ( = ?auto_1194550 ?auto_1194552 ) ) ( not ( = ?auto_1194554 ?auto_1194555 ) ) ( HOIST-AT ?auto_1194556 ?auto_1194554 ) ( not ( = ?auto_1194558 ?auto_1194556 ) ) ( AVAILABLE ?auto_1194556 ) ( SURFACE-AT ?auto_1194552 ?auto_1194554 ) ( ON ?auto_1194552 ?auto_1194553 ) ( CLEAR ?auto_1194552 ) ( not ( = ?auto_1194551 ?auto_1194553 ) ) ( not ( = ?auto_1194552 ?auto_1194553 ) ) ( not ( = ?auto_1194550 ?auto_1194553 ) ) ( TRUCK-AT ?auto_1194557 ?auto_1194555 ) ( SURFACE-AT ?auto_1194550 ?auto_1194555 ) ( CLEAR ?auto_1194550 ) ( IS-CRATE ?auto_1194551 ) ( AVAILABLE ?auto_1194558 ) ( IN ?auto_1194551 ?auto_1194557 ) ( ON ?auto_1194543 ?auto_1194542 ) ( ON ?auto_1194544 ?auto_1194543 ) ( ON ?auto_1194546 ?auto_1194544 ) ( ON ?auto_1194545 ?auto_1194546 ) ( ON ?auto_1194547 ?auto_1194545 ) ( ON ?auto_1194548 ?auto_1194547 ) ( ON ?auto_1194549 ?auto_1194548 ) ( ON ?auto_1194550 ?auto_1194549 ) ( not ( = ?auto_1194542 ?auto_1194543 ) ) ( not ( = ?auto_1194542 ?auto_1194544 ) ) ( not ( = ?auto_1194542 ?auto_1194546 ) ) ( not ( = ?auto_1194542 ?auto_1194545 ) ) ( not ( = ?auto_1194542 ?auto_1194547 ) ) ( not ( = ?auto_1194542 ?auto_1194548 ) ) ( not ( = ?auto_1194542 ?auto_1194549 ) ) ( not ( = ?auto_1194542 ?auto_1194550 ) ) ( not ( = ?auto_1194542 ?auto_1194551 ) ) ( not ( = ?auto_1194542 ?auto_1194552 ) ) ( not ( = ?auto_1194542 ?auto_1194553 ) ) ( not ( = ?auto_1194543 ?auto_1194544 ) ) ( not ( = ?auto_1194543 ?auto_1194546 ) ) ( not ( = ?auto_1194543 ?auto_1194545 ) ) ( not ( = ?auto_1194543 ?auto_1194547 ) ) ( not ( = ?auto_1194543 ?auto_1194548 ) ) ( not ( = ?auto_1194543 ?auto_1194549 ) ) ( not ( = ?auto_1194543 ?auto_1194550 ) ) ( not ( = ?auto_1194543 ?auto_1194551 ) ) ( not ( = ?auto_1194543 ?auto_1194552 ) ) ( not ( = ?auto_1194543 ?auto_1194553 ) ) ( not ( = ?auto_1194544 ?auto_1194546 ) ) ( not ( = ?auto_1194544 ?auto_1194545 ) ) ( not ( = ?auto_1194544 ?auto_1194547 ) ) ( not ( = ?auto_1194544 ?auto_1194548 ) ) ( not ( = ?auto_1194544 ?auto_1194549 ) ) ( not ( = ?auto_1194544 ?auto_1194550 ) ) ( not ( = ?auto_1194544 ?auto_1194551 ) ) ( not ( = ?auto_1194544 ?auto_1194552 ) ) ( not ( = ?auto_1194544 ?auto_1194553 ) ) ( not ( = ?auto_1194546 ?auto_1194545 ) ) ( not ( = ?auto_1194546 ?auto_1194547 ) ) ( not ( = ?auto_1194546 ?auto_1194548 ) ) ( not ( = ?auto_1194546 ?auto_1194549 ) ) ( not ( = ?auto_1194546 ?auto_1194550 ) ) ( not ( = ?auto_1194546 ?auto_1194551 ) ) ( not ( = ?auto_1194546 ?auto_1194552 ) ) ( not ( = ?auto_1194546 ?auto_1194553 ) ) ( not ( = ?auto_1194545 ?auto_1194547 ) ) ( not ( = ?auto_1194545 ?auto_1194548 ) ) ( not ( = ?auto_1194545 ?auto_1194549 ) ) ( not ( = ?auto_1194545 ?auto_1194550 ) ) ( not ( = ?auto_1194545 ?auto_1194551 ) ) ( not ( = ?auto_1194545 ?auto_1194552 ) ) ( not ( = ?auto_1194545 ?auto_1194553 ) ) ( not ( = ?auto_1194547 ?auto_1194548 ) ) ( not ( = ?auto_1194547 ?auto_1194549 ) ) ( not ( = ?auto_1194547 ?auto_1194550 ) ) ( not ( = ?auto_1194547 ?auto_1194551 ) ) ( not ( = ?auto_1194547 ?auto_1194552 ) ) ( not ( = ?auto_1194547 ?auto_1194553 ) ) ( not ( = ?auto_1194548 ?auto_1194549 ) ) ( not ( = ?auto_1194548 ?auto_1194550 ) ) ( not ( = ?auto_1194548 ?auto_1194551 ) ) ( not ( = ?auto_1194548 ?auto_1194552 ) ) ( not ( = ?auto_1194548 ?auto_1194553 ) ) ( not ( = ?auto_1194549 ?auto_1194550 ) ) ( not ( = ?auto_1194549 ?auto_1194551 ) ) ( not ( = ?auto_1194549 ?auto_1194552 ) ) ( not ( = ?auto_1194549 ?auto_1194553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194550 ?auto_1194551 ?auto_1194552 )
      ( MAKE-10CRATE-VERIFY ?auto_1194542 ?auto_1194543 ?auto_1194544 ?auto_1194546 ?auto_1194545 ?auto_1194547 ?auto_1194548 ?auto_1194549 ?auto_1194550 ?auto_1194551 ?auto_1194552 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1194559 - SURFACE
      ?auto_1194560 - SURFACE
    )
    :vars
    (
      ?auto_1194566 - HOIST
      ?auto_1194563 - PLACE
      ?auto_1194567 - SURFACE
      ?auto_1194562 - PLACE
      ?auto_1194564 - HOIST
      ?auto_1194561 - SURFACE
      ?auto_1194565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194566 ?auto_1194563 ) ( IS-CRATE ?auto_1194560 ) ( not ( = ?auto_1194559 ?auto_1194560 ) ) ( not ( = ?auto_1194567 ?auto_1194559 ) ) ( not ( = ?auto_1194567 ?auto_1194560 ) ) ( not ( = ?auto_1194562 ?auto_1194563 ) ) ( HOIST-AT ?auto_1194564 ?auto_1194562 ) ( not ( = ?auto_1194566 ?auto_1194564 ) ) ( AVAILABLE ?auto_1194564 ) ( SURFACE-AT ?auto_1194560 ?auto_1194562 ) ( ON ?auto_1194560 ?auto_1194561 ) ( CLEAR ?auto_1194560 ) ( not ( = ?auto_1194559 ?auto_1194561 ) ) ( not ( = ?auto_1194560 ?auto_1194561 ) ) ( not ( = ?auto_1194567 ?auto_1194561 ) ) ( SURFACE-AT ?auto_1194567 ?auto_1194563 ) ( CLEAR ?auto_1194567 ) ( IS-CRATE ?auto_1194559 ) ( AVAILABLE ?auto_1194566 ) ( IN ?auto_1194559 ?auto_1194565 ) ( TRUCK-AT ?auto_1194565 ?auto_1194562 ) )
    :subtasks
    ( ( !DRIVE ?auto_1194565 ?auto_1194562 ?auto_1194563 )
      ( MAKE-2CRATE ?auto_1194567 ?auto_1194559 ?auto_1194560 )
      ( MAKE-1CRATE-VERIFY ?auto_1194559 ?auto_1194560 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1194568 - SURFACE
      ?auto_1194569 - SURFACE
      ?auto_1194570 - SURFACE
    )
    :vars
    (
      ?auto_1194573 - HOIST
      ?auto_1194572 - PLACE
      ?auto_1194576 - PLACE
      ?auto_1194575 - HOIST
      ?auto_1194571 - SURFACE
      ?auto_1194574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194573 ?auto_1194572 ) ( IS-CRATE ?auto_1194570 ) ( not ( = ?auto_1194569 ?auto_1194570 ) ) ( not ( = ?auto_1194568 ?auto_1194569 ) ) ( not ( = ?auto_1194568 ?auto_1194570 ) ) ( not ( = ?auto_1194576 ?auto_1194572 ) ) ( HOIST-AT ?auto_1194575 ?auto_1194576 ) ( not ( = ?auto_1194573 ?auto_1194575 ) ) ( AVAILABLE ?auto_1194575 ) ( SURFACE-AT ?auto_1194570 ?auto_1194576 ) ( ON ?auto_1194570 ?auto_1194571 ) ( CLEAR ?auto_1194570 ) ( not ( = ?auto_1194569 ?auto_1194571 ) ) ( not ( = ?auto_1194570 ?auto_1194571 ) ) ( not ( = ?auto_1194568 ?auto_1194571 ) ) ( SURFACE-AT ?auto_1194568 ?auto_1194572 ) ( CLEAR ?auto_1194568 ) ( IS-CRATE ?auto_1194569 ) ( AVAILABLE ?auto_1194573 ) ( IN ?auto_1194569 ?auto_1194574 ) ( TRUCK-AT ?auto_1194574 ?auto_1194576 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1194569 ?auto_1194570 )
      ( MAKE-2CRATE-VERIFY ?auto_1194568 ?auto_1194569 ?auto_1194570 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1194577 - SURFACE
      ?auto_1194578 - SURFACE
      ?auto_1194579 - SURFACE
      ?auto_1194580 - SURFACE
    )
    :vars
    (
      ?auto_1194584 - HOIST
      ?auto_1194583 - PLACE
      ?auto_1194586 - PLACE
      ?auto_1194582 - HOIST
      ?auto_1194585 - SURFACE
      ?auto_1194581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194584 ?auto_1194583 ) ( IS-CRATE ?auto_1194580 ) ( not ( = ?auto_1194579 ?auto_1194580 ) ) ( not ( = ?auto_1194578 ?auto_1194579 ) ) ( not ( = ?auto_1194578 ?auto_1194580 ) ) ( not ( = ?auto_1194586 ?auto_1194583 ) ) ( HOIST-AT ?auto_1194582 ?auto_1194586 ) ( not ( = ?auto_1194584 ?auto_1194582 ) ) ( AVAILABLE ?auto_1194582 ) ( SURFACE-AT ?auto_1194580 ?auto_1194586 ) ( ON ?auto_1194580 ?auto_1194585 ) ( CLEAR ?auto_1194580 ) ( not ( = ?auto_1194579 ?auto_1194585 ) ) ( not ( = ?auto_1194580 ?auto_1194585 ) ) ( not ( = ?auto_1194578 ?auto_1194585 ) ) ( SURFACE-AT ?auto_1194578 ?auto_1194583 ) ( CLEAR ?auto_1194578 ) ( IS-CRATE ?auto_1194579 ) ( AVAILABLE ?auto_1194584 ) ( IN ?auto_1194579 ?auto_1194581 ) ( TRUCK-AT ?auto_1194581 ?auto_1194586 ) ( ON ?auto_1194578 ?auto_1194577 ) ( not ( = ?auto_1194577 ?auto_1194578 ) ) ( not ( = ?auto_1194577 ?auto_1194579 ) ) ( not ( = ?auto_1194577 ?auto_1194580 ) ) ( not ( = ?auto_1194577 ?auto_1194585 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194578 ?auto_1194579 ?auto_1194580 )
      ( MAKE-3CRATE-VERIFY ?auto_1194577 ?auto_1194578 ?auto_1194579 ?auto_1194580 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1194587 - SURFACE
      ?auto_1194588 - SURFACE
      ?auto_1194589 - SURFACE
      ?auto_1194591 - SURFACE
      ?auto_1194590 - SURFACE
    )
    :vars
    (
      ?auto_1194595 - HOIST
      ?auto_1194594 - PLACE
      ?auto_1194597 - PLACE
      ?auto_1194593 - HOIST
      ?auto_1194596 - SURFACE
      ?auto_1194592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194595 ?auto_1194594 ) ( IS-CRATE ?auto_1194590 ) ( not ( = ?auto_1194591 ?auto_1194590 ) ) ( not ( = ?auto_1194589 ?auto_1194591 ) ) ( not ( = ?auto_1194589 ?auto_1194590 ) ) ( not ( = ?auto_1194597 ?auto_1194594 ) ) ( HOIST-AT ?auto_1194593 ?auto_1194597 ) ( not ( = ?auto_1194595 ?auto_1194593 ) ) ( AVAILABLE ?auto_1194593 ) ( SURFACE-AT ?auto_1194590 ?auto_1194597 ) ( ON ?auto_1194590 ?auto_1194596 ) ( CLEAR ?auto_1194590 ) ( not ( = ?auto_1194591 ?auto_1194596 ) ) ( not ( = ?auto_1194590 ?auto_1194596 ) ) ( not ( = ?auto_1194589 ?auto_1194596 ) ) ( SURFACE-AT ?auto_1194589 ?auto_1194594 ) ( CLEAR ?auto_1194589 ) ( IS-CRATE ?auto_1194591 ) ( AVAILABLE ?auto_1194595 ) ( IN ?auto_1194591 ?auto_1194592 ) ( TRUCK-AT ?auto_1194592 ?auto_1194597 ) ( ON ?auto_1194588 ?auto_1194587 ) ( ON ?auto_1194589 ?auto_1194588 ) ( not ( = ?auto_1194587 ?auto_1194588 ) ) ( not ( = ?auto_1194587 ?auto_1194589 ) ) ( not ( = ?auto_1194587 ?auto_1194591 ) ) ( not ( = ?auto_1194587 ?auto_1194590 ) ) ( not ( = ?auto_1194587 ?auto_1194596 ) ) ( not ( = ?auto_1194588 ?auto_1194589 ) ) ( not ( = ?auto_1194588 ?auto_1194591 ) ) ( not ( = ?auto_1194588 ?auto_1194590 ) ) ( not ( = ?auto_1194588 ?auto_1194596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194589 ?auto_1194591 ?auto_1194590 )
      ( MAKE-4CRATE-VERIFY ?auto_1194587 ?auto_1194588 ?auto_1194589 ?auto_1194591 ?auto_1194590 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1194598 - SURFACE
      ?auto_1194599 - SURFACE
      ?auto_1194600 - SURFACE
      ?auto_1194602 - SURFACE
      ?auto_1194601 - SURFACE
      ?auto_1194603 - SURFACE
    )
    :vars
    (
      ?auto_1194607 - HOIST
      ?auto_1194606 - PLACE
      ?auto_1194609 - PLACE
      ?auto_1194605 - HOIST
      ?auto_1194608 - SURFACE
      ?auto_1194604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194607 ?auto_1194606 ) ( IS-CRATE ?auto_1194603 ) ( not ( = ?auto_1194601 ?auto_1194603 ) ) ( not ( = ?auto_1194602 ?auto_1194601 ) ) ( not ( = ?auto_1194602 ?auto_1194603 ) ) ( not ( = ?auto_1194609 ?auto_1194606 ) ) ( HOIST-AT ?auto_1194605 ?auto_1194609 ) ( not ( = ?auto_1194607 ?auto_1194605 ) ) ( AVAILABLE ?auto_1194605 ) ( SURFACE-AT ?auto_1194603 ?auto_1194609 ) ( ON ?auto_1194603 ?auto_1194608 ) ( CLEAR ?auto_1194603 ) ( not ( = ?auto_1194601 ?auto_1194608 ) ) ( not ( = ?auto_1194603 ?auto_1194608 ) ) ( not ( = ?auto_1194602 ?auto_1194608 ) ) ( SURFACE-AT ?auto_1194602 ?auto_1194606 ) ( CLEAR ?auto_1194602 ) ( IS-CRATE ?auto_1194601 ) ( AVAILABLE ?auto_1194607 ) ( IN ?auto_1194601 ?auto_1194604 ) ( TRUCK-AT ?auto_1194604 ?auto_1194609 ) ( ON ?auto_1194599 ?auto_1194598 ) ( ON ?auto_1194600 ?auto_1194599 ) ( ON ?auto_1194602 ?auto_1194600 ) ( not ( = ?auto_1194598 ?auto_1194599 ) ) ( not ( = ?auto_1194598 ?auto_1194600 ) ) ( not ( = ?auto_1194598 ?auto_1194602 ) ) ( not ( = ?auto_1194598 ?auto_1194601 ) ) ( not ( = ?auto_1194598 ?auto_1194603 ) ) ( not ( = ?auto_1194598 ?auto_1194608 ) ) ( not ( = ?auto_1194599 ?auto_1194600 ) ) ( not ( = ?auto_1194599 ?auto_1194602 ) ) ( not ( = ?auto_1194599 ?auto_1194601 ) ) ( not ( = ?auto_1194599 ?auto_1194603 ) ) ( not ( = ?auto_1194599 ?auto_1194608 ) ) ( not ( = ?auto_1194600 ?auto_1194602 ) ) ( not ( = ?auto_1194600 ?auto_1194601 ) ) ( not ( = ?auto_1194600 ?auto_1194603 ) ) ( not ( = ?auto_1194600 ?auto_1194608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194602 ?auto_1194601 ?auto_1194603 )
      ( MAKE-5CRATE-VERIFY ?auto_1194598 ?auto_1194599 ?auto_1194600 ?auto_1194602 ?auto_1194601 ?auto_1194603 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1194610 - SURFACE
      ?auto_1194611 - SURFACE
      ?auto_1194612 - SURFACE
      ?auto_1194614 - SURFACE
      ?auto_1194613 - SURFACE
      ?auto_1194615 - SURFACE
      ?auto_1194616 - SURFACE
    )
    :vars
    (
      ?auto_1194620 - HOIST
      ?auto_1194619 - PLACE
      ?auto_1194622 - PLACE
      ?auto_1194618 - HOIST
      ?auto_1194621 - SURFACE
      ?auto_1194617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194620 ?auto_1194619 ) ( IS-CRATE ?auto_1194616 ) ( not ( = ?auto_1194615 ?auto_1194616 ) ) ( not ( = ?auto_1194613 ?auto_1194615 ) ) ( not ( = ?auto_1194613 ?auto_1194616 ) ) ( not ( = ?auto_1194622 ?auto_1194619 ) ) ( HOIST-AT ?auto_1194618 ?auto_1194622 ) ( not ( = ?auto_1194620 ?auto_1194618 ) ) ( AVAILABLE ?auto_1194618 ) ( SURFACE-AT ?auto_1194616 ?auto_1194622 ) ( ON ?auto_1194616 ?auto_1194621 ) ( CLEAR ?auto_1194616 ) ( not ( = ?auto_1194615 ?auto_1194621 ) ) ( not ( = ?auto_1194616 ?auto_1194621 ) ) ( not ( = ?auto_1194613 ?auto_1194621 ) ) ( SURFACE-AT ?auto_1194613 ?auto_1194619 ) ( CLEAR ?auto_1194613 ) ( IS-CRATE ?auto_1194615 ) ( AVAILABLE ?auto_1194620 ) ( IN ?auto_1194615 ?auto_1194617 ) ( TRUCK-AT ?auto_1194617 ?auto_1194622 ) ( ON ?auto_1194611 ?auto_1194610 ) ( ON ?auto_1194612 ?auto_1194611 ) ( ON ?auto_1194614 ?auto_1194612 ) ( ON ?auto_1194613 ?auto_1194614 ) ( not ( = ?auto_1194610 ?auto_1194611 ) ) ( not ( = ?auto_1194610 ?auto_1194612 ) ) ( not ( = ?auto_1194610 ?auto_1194614 ) ) ( not ( = ?auto_1194610 ?auto_1194613 ) ) ( not ( = ?auto_1194610 ?auto_1194615 ) ) ( not ( = ?auto_1194610 ?auto_1194616 ) ) ( not ( = ?auto_1194610 ?auto_1194621 ) ) ( not ( = ?auto_1194611 ?auto_1194612 ) ) ( not ( = ?auto_1194611 ?auto_1194614 ) ) ( not ( = ?auto_1194611 ?auto_1194613 ) ) ( not ( = ?auto_1194611 ?auto_1194615 ) ) ( not ( = ?auto_1194611 ?auto_1194616 ) ) ( not ( = ?auto_1194611 ?auto_1194621 ) ) ( not ( = ?auto_1194612 ?auto_1194614 ) ) ( not ( = ?auto_1194612 ?auto_1194613 ) ) ( not ( = ?auto_1194612 ?auto_1194615 ) ) ( not ( = ?auto_1194612 ?auto_1194616 ) ) ( not ( = ?auto_1194612 ?auto_1194621 ) ) ( not ( = ?auto_1194614 ?auto_1194613 ) ) ( not ( = ?auto_1194614 ?auto_1194615 ) ) ( not ( = ?auto_1194614 ?auto_1194616 ) ) ( not ( = ?auto_1194614 ?auto_1194621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194613 ?auto_1194615 ?auto_1194616 )
      ( MAKE-6CRATE-VERIFY ?auto_1194610 ?auto_1194611 ?auto_1194612 ?auto_1194614 ?auto_1194613 ?auto_1194615 ?auto_1194616 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1194623 - SURFACE
      ?auto_1194624 - SURFACE
      ?auto_1194625 - SURFACE
      ?auto_1194627 - SURFACE
      ?auto_1194626 - SURFACE
      ?auto_1194628 - SURFACE
      ?auto_1194629 - SURFACE
      ?auto_1194630 - SURFACE
    )
    :vars
    (
      ?auto_1194634 - HOIST
      ?auto_1194633 - PLACE
      ?auto_1194636 - PLACE
      ?auto_1194632 - HOIST
      ?auto_1194635 - SURFACE
      ?auto_1194631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194634 ?auto_1194633 ) ( IS-CRATE ?auto_1194630 ) ( not ( = ?auto_1194629 ?auto_1194630 ) ) ( not ( = ?auto_1194628 ?auto_1194629 ) ) ( not ( = ?auto_1194628 ?auto_1194630 ) ) ( not ( = ?auto_1194636 ?auto_1194633 ) ) ( HOIST-AT ?auto_1194632 ?auto_1194636 ) ( not ( = ?auto_1194634 ?auto_1194632 ) ) ( AVAILABLE ?auto_1194632 ) ( SURFACE-AT ?auto_1194630 ?auto_1194636 ) ( ON ?auto_1194630 ?auto_1194635 ) ( CLEAR ?auto_1194630 ) ( not ( = ?auto_1194629 ?auto_1194635 ) ) ( not ( = ?auto_1194630 ?auto_1194635 ) ) ( not ( = ?auto_1194628 ?auto_1194635 ) ) ( SURFACE-AT ?auto_1194628 ?auto_1194633 ) ( CLEAR ?auto_1194628 ) ( IS-CRATE ?auto_1194629 ) ( AVAILABLE ?auto_1194634 ) ( IN ?auto_1194629 ?auto_1194631 ) ( TRUCK-AT ?auto_1194631 ?auto_1194636 ) ( ON ?auto_1194624 ?auto_1194623 ) ( ON ?auto_1194625 ?auto_1194624 ) ( ON ?auto_1194627 ?auto_1194625 ) ( ON ?auto_1194626 ?auto_1194627 ) ( ON ?auto_1194628 ?auto_1194626 ) ( not ( = ?auto_1194623 ?auto_1194624 ) ) ( not ( = ?auto_1194623 ?auto_1194625 ) ) ( not ( = ?auto_1194623 ?auto_1194627 ) ) ( not ( = ?auto_1194623 ?auto_1194626 ) ) ( not ( = ?auto_1194623 ?auto_1194628 ) ) ( not ( = ?auto_1194623 ?auto_1194629 ) ) ( not ( = ?auto_1194623 ?auto_1194630 ) ) ( not ( = ?auto_1194623 ?auto_1194635 ) ) ( not ( = ?auto_1194624 ?auto_1194625 ) ) ( not ( = ?auto_1194624 ?auto_1194627 ) ) ( not ( = ?auto_1194624 ?auto_1194626 ) ) ( not ( = ?auto_1194624 ?auto_1194628 ) ) ( not ( = ?auto_1194624 ?auto_1194629 ) ) ( not ( = ?auto_1194624 ?auto_1194630 ) ) ( not ( = ?auto_1194624 ?auto_1194635 ) ) ( not ( = ?auto_1194625 ?auto_1194627 ) ) ( not ( = ?auto_1194625 ?auto_1194626 ) ) ( not ( = ?auto_1194625 ?auto_1194628 ) ) ( not ( = ?auto_1194625 ?auto_1194629 ) ) ( not ( = ?auto_1194625 ?auto_1194630 ) ) ( not ( = ?auto_1194625 ?auto_1194635 ) ) ( not ( = ?auto_1194627 ?auto_1194626 ) ) ( not ( = ?auto_1194627 ?auto_1194628 ) ) ( not ( = ?auto_1194627 ?auto_1194629 ) ) ( not ( = ?auto_1194627 ?auto_1194630 ) ) ( not ( = ?auto_1194627 ?auto_1194635 ) ) ( not ( = ?auto_1194626 ?auto_1194628 ) ) ( not ( = ?auto_1194626 ?auto_1194629 ) ) ( not ( = ?auto_1194626 ?auto_1194630 ) ) ( not ( = ?auto_1194626 ?auto_1194635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194628 ?auto_1194629 ?auto_1194630 )
      ( MAKE-7CRATE-VERIFY ?auto_1194623 ?auto_1194624 ?auto_1194625 ?auto_1194627 ?auto_1194626 ?auto_1194628 ?auto_1194629 ?auto_1194630 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1194637 - SURFACE
      ?auto_1194638 - SURFACE
      ?auto_1194639 - SURFACE
      ?auto_1194641 - SURFACE
      ?auto_1194640 - SURFACE
      ?auto_1194642 - SURFACE
      ?auto_1194643 - SURFACE
      ?auto_1194644 - SURFACE
      ?auto_1194645 - SURFACE
    )
    :vars
    (
      ?auto_1194649 - HOIST
      ?auto_1194648 - PLACE
      ?auto_1194651 - PLACE
      ?auto_1194647 - HOIST
      ?auto_1194650 - SURFACE
      ?auto_1194646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194649 ?auto_1194648 ) ( IS-CRATE ?auto_1194645 ) ( not ( = ?auto_1194644 ?auto_1194645 ) ) ( not ( = ?auto_1194643 ?auto_1194644 ) ) ( not ( = ?auto_1194643 ?auto_1194645 ) ) ( not ( = ?auto_1194651 ?auto_1194648 ) ) ( HOIST-AT ?auto_1194647 ?auto_1194651 ) ( not ( = ?auto_1194649 ?auto_1194647 ) ) ( AVAILABLE ?auto_1194647 ) ( SURFACE-AT ?auto_1194645 ?auto_1194651 ) ( ON ?auto_1194645 ?auto_1194650 ) ( CLEAR ?auto_1194645 ) ( not ( = ?auto_1194644 ?auto_1194650 ) ) ( not ( = ?auto_1194645 ?auto_1194650 ) ) ( not ( = ?auto_1194643 ?auto_1194650 ) ) ( SURFACE-AT ?auto_1194643 ?auto_1194648 ) ( CLEAR ?auto_1194643 ) ( IS-CRATE ?auto_1194644 ) ( AVAILABLE ?auto_1194649 ) ( IN ?auto_1194644 ?auto_1194646 ) ( TRUCK-AT ?auto_1194646 ?auto_1194651 ) ( ON ?auto_1194638 ?auto_1194637 ) ( ON ?auto_1194639 ?auto_1194638 ) ( ON ?auto_1194641 ?auto_1194639 ) ( ON ?auto_1194640 ?auto_1194641 ) ( ON ?auto_1194642 ?auto_1194640 ) ( ON ?auto_1194643 ?auto_1194642 ) ( not ( = ?auto_1194637 ?auto_1194638 ) ) ( not ( = ?auto_1194637 ?auto_1194639 ) ) ( not ( = ?auto_1194637 ?auto_1194641 ) ) ( not ( = ?auto_1194637 ?auto_1194640 ) ) ( not ( = ?auto_1194637 ?auto_1194642 ) ) ( not ( = ?auto_1194637 ?auto_1194643 ) ) ( not ( = ?auto_1194637 ?auto_1194644 ) ) ( not ( = ?auto_1194637 ?auto_1194645 ) ) ( not ( = ?auto_1194637 ?auto_1194650 ) ) ( not ( = ?auto_1194638 ?auto_1194639 ) ) ( not ( = ?auto_1194638 ?auto_1194641 ) ) ( not ( = ?auto_1194638 ?auto_1194640 ) ) ( not ( = ?auto_1194638 ?auto_1194642 ) ) ( not ( = ?auto_1194638 ?auto_1194643 ) ) ( not ( = ?auto_1194638 ?auto_1194644 ) ) ( not ( = ?auto_1194638 ?auto_1194645 ) ) ( not ( = ?auto_1194638 ?auto_1194650 ) ) ( not ( = ?auto_1194639 ?auto_1194641 ) ) ( not ( = ?auto_1194639 ?auto_1194640 ) ) ( not ( = ?auto_1194639 ?auto_1194642 ) ) ( not ( = ?auto_1194639 ?auto_1194643 ) ) ( not ( = ?auto_1194639 ?auto_1194644 ) ) ( not ( = ?auto_1194639 ?auto_1194645 ) ) ( not ( = ?auto_1194639 ?auto_1194650 ) ) ( not ( = ?auto_1194641 ?auto_1194640 ) ) ( not ( = ?auto_1194641 ?auto_1194642 ) ) ( not ( = ?auto_1194641 ?auto_1194643 ) ) ( not ( = ?auto_1194641 ?auto_1194644 ) ) ( not ( = ?auto_1194641 ?auto_1194645 ) ) ( not ( = ?auto_1194641 ?auto_1194650 ) ) ( not ( = ?auto_1194640 ?auto_1194642 ) ) ( not ( = ?auto_1194640 ?auto_1194643 ) ) ( not ( = ?auto_1194640 ?auto_1194644 ) ) ( not ( = ?auto_1194640 ?auto_1194645 ) ) ( not ( = ?auto_1194640 ?auto_1194650 ) ) ( not ( = ?auto_1194642 ?auto_1194643 ) ) ( not ( = ?auto_1194642 ?auto_1194644 ) ) ( not ( = ?auto_1194642 ?auto_1194645 ) ) ( not ( = ?auto_1194642 ?auto_1194650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194643 ?auto_1194644 ?auto_1194645 )
      ( MAKE-8CRATE-VERIFY ?auto_1194637 ?auto_1194638 ?auto_1194639 ?auto_1194641 ?auto_1194640 ?auto_1194642 ?auto_1194643 ?auto_1194644 ?auto_1194645 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1194652 - SURFACE
      ?auto_1194653 - SURFACE
      ?auto_1194654 - SURFACE
      ?auto_1194656 - SURFACE
      ?auto_1194655 - SURFACE
      ?auto_1194657 - SURFACE
      ?auto_1194658 - SURFACE
      ?auto_1194659 - SURFACE
      ?auto_1194660 - SURFACE
      ?auto_1194661 - SURFACE
    )
    :vars
    (
      ?auto_1194665 - HOIST
      ?auto_1194664 - PLACE
      ?auto_1194667 - PLACE
      ?auto_1194663 - HOIST
      ?auto_1194666 - SURFACE
      ?auto_1194662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194665 ?auto_1194664 ) ( IS-CRATE ?auto_1194661 ) ( not ( = ?auto_1194660 ?auto_1194661 ) ) ( not ( = ?auto_1194659 ?auto_1194660 ) ) ( not ( = ?auto_1194659 ?auto_1194661 ) ) ( not ( = ?auto_1194667 ?auto_1194664 ) ) ( HOIST-AT ?auto_1194663 ?auto_1194667 ) ( not ( = ?auto_1194665 ?auto_1194663 ) ) ( AVAILABLE ?auto_1194663 ) ( SURFACE-AT ?auto_1194661 ?auto_1194667 ) ( ON ?auto_1194661 ?auto_1194666 ) ( CLEAR ?auto_1194661 ) ( not ( = ?auto_1194660 ?auto_1194666 ) ) ( not ( = ?auto_1194661 ?auto_1194666 ) ) ( not ( = ?auto_1194659 ?auto_1194666 ) ) ( SURFACE-AT ?auto_1194659 ?auto_1194664 ) ( CLEAR ?auto_1194659 ) ( IS-CRATE ?auto_1194660 ) ( AVAILABLE ?auto_1194665 ) ( IN ?auto_1194660 ?auto_1194662 ) ( TRUCK-AT ?auto_1194662 ?auto_1194667 ) ( ON ?auto_1194653 ?auto_1194652 ) ( ON ?auto_1194654 ?auto_1194653 ) ( ON ?auto_1194656 ?auto_1194654 ) ( ON ?auto_1194655 ?auto_1194656 ) ( ON ?auto_1194657 ?auto_1194655 ) ( ON ?auto_1194658 ?auto_1194657 ) ( ON ?auto_1194659 ?auto_1194658 ) ( not ( = ?auto_1194652 ?auto_1194653 ) ) ( not ( = ?auto_1194652 ?auto_1194654 ) ) ( not ( = ?auto_1194652 ?auto_1194656 ) ) ( not ( = ?auto_1194652 ?auto_1194655 ) ) ( not ( = ?auto_1194652 ?auto_1194657 ) ) ( not ( = ?auto_1194652 ?auto_1194658 ) ) ( not ( = ?auto_1194652 ?auto_1194659 ) ) ( not ( = ?auto_1194652 ?auto_1194660 ) ) ( not ( = ?auto_1194652 ?auto_1194661 ) ) ( not ( = ?auto_1194652 ?auto_1194666 ) ) ( not ( = ?auto_1194653 ?auto_1194654 ) ) ( not ( = ?auto_1194653 ?auto_1194656 ) ) ( not ( = ?auto_1194653 ?auto_1194655 ) ) ( not ( = ?auto_1194653 ?auto_1194657 ) ) ( not ( = ?auto_1194653 ?auto_1194658 ) ) ( not ( = ?auto_1194653 ?auto_1194659 ) ) ( not ( = ?auto_1194653 ?auto_1194660 ) ) ( not ( = ?auto_1194653 ?auto_1194661 ) ) ( not ( = ?auto_1194653 ?auto_1194666 ) ) ( not ( = ?auto_1194654 ?auto_1194656 ) ) ( not ( = ?auto_1194654 ?auto_1194655 ) ) ( not ( = ?auto_1194654 ?auto_1194657 ) ) ( not ( = ?auto_1194654 ?auto_1194658 ) ) ( not ( = ?auto_1194654 ?auto_1194659 ) ) ( not ( = ?auto_1194654 ?auto_1194660 ) ) ( not ( = ?auto_1194654 ?auto_1194661 ) ) ( not ( = ?auto_1194654 ?auto_1194666 ) ) ( not ( = ?auto_1194656 ?auto_1194655 ) ) ( not ( = ?auto_1194656 ?auto_1194657 ) ) ( not ( = ?auto_1194656 ?auto_1194658 ) ) ( not ( = ?auto_1194656 ?auto_1194659 ) ) ( not ( = ?auto_1194656 ?auto_1194660 ) ) ( not ( = ?auto_1194656 ?auto_1194661 ) ) ( not ( = ?auto_1194656 ?auto_1194666 ) ) ( not ( = ?auto_1194655 ?auto_1194657 ) ) ( not ( = ?auto_1194655 ?auto_1194658 ) ) ( not ( = ?auto_1194655 ?auto_1194659 ) ) ( not ( = ?auto_1194655 ?auto_1194660 ) ) ( not ( = ?auto_1194655 ?auto_1194661 ) ) ( not ( = ?auto_1194655 ?auto_1194666 ) ) ( not ( = ?auto_1194657 ?auto_1194658 ) ) ( not ( = ?auto_1194657 ?auto_1194659 ) ) ( not ( = ?auto_1194657 ?auto_1194660 ) ) ( not ( = ?auto_1194657 ?auto_1194661 ) ) ( not ( = ?auto_1194657 ?auto_1194666 ) ) ( not ( = ?auto_1194658 ?auto_1194659 ) ) ( not ( = ?auto_1194658 ?auto_1194660 ) ) ( not ( = ?auto_1194658 ?auto_1194661 ) ) ( not ( = ?auto_1194658 ?auto_1194666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194659 ?auto_1194660 ?auto_1194661 )
      ( MAKE-9CRATE-VERIFY ?auto_1194652 ?auto_1194653 ?auto_1194654 ?auto_1194656 ?auto_1194655 ?auto_1194657 ?auto_1194658 ?auto_1194659 ?auto_1194660 ?auto_1194661 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1194668 - SURFACE
      ?auto_1194669 - SURFACE
      ?auto_1194670 - SURFACE
      ?auto_1194672 - SURFACE
      ?auto_1194671 - SURFACE
      ?auto_1194673 - SURFACE
      ?auto_1194674 - SURFACE
      ?auto_1194675 - SURFACE
      ?auto_1194676 - SURFACE
      ?auto_1194677 - SURFACE
      ?auto_1194678 - SURFACE
    )
    :vars
    (
      ?auto_1194682 - HOIST
      ?auto_1194681 - PLACE
      ?auto_1194684 - PLACE
      ?auto_1194680 - HOIST
      ?auto_1194683 - SURFACE
      ?auto_1194679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194682 ?auto_1194681 ) ( IS-CRATE ?auto_1194678 ) ( not ( = ?auto_1194677 ?auto_1194678 ) ) ( not ( = ?auto_1194676 ?auto_1194677 ) ) ( not ( = ?auto_1194676 ?auto_1194678 ) ) ( not ( = ?auto_1194684 ?auto_1194681 ) ) ( HOIST-AT ?auto_1194680 ?auto_1194684 ) ( not ( = ?auto_1194682 ?auto_1194680 ) ) ( AVAILABLE ?auto_1194680 ) ( SURFACE-AT ?auto_1194678 ?auto_1194684 ) ( ON ?auto_1194678 ?auto_1194683 ) ( CLEAR ?auto_1194678 ) ( not ( = ?auto_1194677 ?auto_1194683 ) ) ( not ( = ?auto_1194678 ?auto_1194683 ) ) ( not ( = ?auto_1194676 ?auto_1194683 ) ) ( SURFACE-AT ?auto_1194676 ?auto_1194681 ) ( CLEAR ?auto_1194676 ) ( IS-CRATE ?auto_1194677 ) ( AVAILABLE ?auto_1194682 ) ( IN ?auto_1194677 ?auto_1194679 ) ( TRUCK-AT ?auto_1194679 ?auto_1194684 ) ( ON ?auto_1194669 ?auto_1194668 ) ( ON ?auto_1194670 ?auto_1194669 ) ( ON ?auto_1194672 ?auto_1194670 ) ( ON ?auto_1194671 ?auto_1194672 ) ( ON ?auto_1194673 ?auto_1194671 ) ( ON ?auto_1194674 ?auto_1194673 ) ( ON ?auto_1194675 ?auto_1194674 ) ( ON ?auto_1194676 ?auto_1194675 ) ( not ( = ?auto_1194668 ?auto_1194669 ) ) ( not ( = ?auto_1194668 ?auto_1194670 ) ) ( not ( = ?auto_1194668 ?auto_1194672 ) ) ( not ( = ?auto_1194668 ?auto_1194671 ) ) ( not ( = ?auto_1194668 ?auto_1194673 ) ) ( not ( = ?auto_1194668 ?auto_1194674 ) ) ( not ( = ?auto_1194668 ?auto_1194675 ) ) ( not ( = ?auto_1194668 ?auto_1194676 ) ) ( not ( = ?auto_1194668 ?auto_1194677 ) ) ( not ( = ?auto_1194668 ?auto_1194678 ) ) ( not ( = ?auto_1194668 ?auto_1194683 ) ) ( not ( = ?auto_1194669 ?auto_1194670 ) ) ( not ( = ?auto_1194669 ?auto_1194672 ) ) ( not ( = ?auto_1194669 ?auto_1194671 ) ) ( not ( = ?auto_1194669 ?auto_1194673 ) ) ( not ( = ?auto_1194669 ?auto_1194674 ) ) ( not ( = ?auto_1194669 ?auto_1194675 ) ) ( not ( = ?auto_1194669 ?auto_1194676 ) ) ( not ( = ?auto_1194669 ?auto_1194677 ) ) ( not ( = ?auto_1194669 ?auto_1194678 ) ) ( not ( = ?auto_1194669 ?auto_1194683 ) ) ( not ( = ?auto_1194670 ?auto_1194672 ) ) ( not ( = ?auto_1194670 ?auto_1194671 ) ) ( not ( = ?auto_1194670 ?auto_1194673 ) ) ( not ( = ?auto_1194670 ?auto_1194674 ) ) ( not ( = ?auto_1194670 ?auto_1194675 ) ) ( not ( = ?auto_1194670 ?auto_1194676 ) ) ( not ( = ?auto_1194670 ?auto_1194677 ) ) ( not ( = ?auto_1194670 ?auto_1194678 ) ) ( not ( = ?auto_1194670 ?auto_1194683 ) ) ( not ( = ?auto_1194672 ?auto_1194671 ) ) ( not ( = ?auto_1194672 ?auto_1194673 ) ) ( not ( = ?auto_1194672 ?auto_1194674 ) ) ( not ( = ?auto_1194672 ?auto_1194675 ) ) ( not ( = ?auto_1194672 ?auto_1194676 ) ) ( not ( = ?auto_1194672 ?auto_1194677 ) ) ( not ( = ?auto_1194672 ?auto_1194678 ) ) ( not ( = ?auto_1194672 ?auto_1194683 ) ) ( not ( = ?auto_1194671 ?auto_1194673 ) ) ( not ( = ?auto_1194671 ?auto_1194674 ) ) ( not ( = ?auto_1194671 ?auto_1194675 ) ) ( not ( = ?auto_1194671 ?auto_1194676 ) ) ( not ( = ?auto_1194671 ?auto_1194677 ) ) ( not ( = ?auto_1194671 ?auto_1194678 ) ) ( not ( = ?auto_1194671 ?auto_1194683 ) ) ( not ( = ?auto_1194673 ?auto_1194674 ) ) ( not ( = ?auto_1194673 ?auto_1194675 ) ) ( not ( = ?auto_1194673 ?auto_1194676 ) ) ( not ( = ?auto_1194673 ?auto_1194677 ) ) ( not ( = ?auto_1194673 ?auto_1194678 ) ) ( not ( = ?auto_1194673 ?auto_1194683 ) ) ( not ( = ?auto_1194674 ?auto_1194675 ) ) ( not ( = ?auto_1194674 ?auto_1194676 ) ) ( not ( = ?auto_1194674 ?auto_1194677 ) ) ( not ( = ?auto_1194674 ?auto_1194678 ) ) ( not ( = ?auto_1194674 ?auto_1194683 ) ) ( not ( = ?auto_1194675 ?auto_1194676 ) ) ( not ( = ?auto_1194675 ?auto_1194677 ) ) ( not ( = ?auto_1194675 ?auto_1194678 ) ) ( not ( = ?auto_1194675 ?auto_1194683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194676 ?auto_1194677 ?auto_1194678 )
      ( MAKE-10CRATE-VERIFY ?auto_1194668 ?auto_1194669 ?auto_1194670 ?auto_1194672 ?auto_1194671 ?auto_1194673 ?auto_1194674 ?auto_1194675 ?auto_1194676 ?auto_1194677 ?auto_1194678 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1194685 - SURFACE
      ?auto_1194686 - SURFACE
    )
    :vars
    (
      ?auto_1194691 - HOIST
      ?auto_1194690 - PLACE
      ?auto_1194689 - SURFACE
      ?auto_1194693 - PLACE
      ?auto_1194688 - HOIST
      ?auto_1194692 - SURFACE
      ?auto_1194687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194691 ?auto_1194690 ) ( IS-CRATE ?auto_1194686 ) ( not ( = ?auto_1194685 ?auto_1194686 ) ) ( not ( = ?auto_1194689 ?auto_1194685 ) ) ( not ( = ?auto_1194689 ?auto_1194686 ) ) ( not ( = ?auto_1194693 ?auto_1194690 ) ) ( HOIST-AT ?auto_1194688 ?auto_1194693 ) ( not ( = ?auto_1194691 ?auto_1194688 ) ) ( SURFACE-AT ?auto_1194686 ?auto_1194693 ) ( ON ?auto_1194686 ?auto_1194692 ) ( CLEAR ?auto_1194686 ) ( not ( = ?auto_1194685 ?auto_1194692 ) ) ( not ( = ?auto_1194686 ?auto_1194692 ) ) ( not ( = ?auto_1194689 ?auto_1194692 ) ) ( SURFACE-AT ?auto_1194689 ?auto_1194690 ) ( CLEAR ?auto_1194689 ) ( IS-CRATE ?auto_1194685 ) ( AVAILABLE ?auto_1194691 ) ( TRUCK-AT ?auto_1194687 ?auto_1194693 ) ( LIFTING ?auto_1194688 ?auto_1194685 ) )
    :subtasks
    ( ( !LOAD ?auto_1194688 ?auto_1194685 ?auto_1194687 ?auto_1194693 )
      ( MAKE-2CRATE ?auto_1194689 ?auto_1194685 ?auto_1194686 )
      ( MAKE-1CRATE-VERIFY ?auto_1194685 ?auto_1194686 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1194694 - SURFACE
      ?auto_1194695 - SURFACE
      ?auto_1194696 - SURFACE
    )
    :vars
    (
      ?auto_1194701 - HOIST
      ?auto_1194699 - PLACE
      ?auto_1194697 - PLACE
      ?auto_1194702 - HOIST
      ?auto_1194700 - SURFACE
      ?auto_1194698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194701 ?auto_1194699 ) ( IS-CRATE ?auto_1194696 ) ( not ( = ?auto_1194695 ?auto_1194696 ) ) ( not ( = ?auto_1194694 ?auto_1194695 ) ) ( not ( = ?auto_1194694 ?auto_1194696 ) ) ( not ( = ?auto_1194697 ?auto_1194699 ) ) ( HOIST-AT ?auto_1194702 ?auto_1194697 ) ( not ( = ?auto_1194701 ?auto_1194702 ) ) ( SURFACE-AT ?auto_1194696 ?auto_1194697 ) ( ON ?auto_1194696 ?auto_1194700 ) ( CLEAR ?auto_1194696 ) ( not ( = ?auto_1194695 ?auto_1194700 ) ) ( not ( = ?auto_1194696 ?auto_1194700 ) ) ( not ( = ?auto_1194694 ?auto_1194700 ) ) ( SURFACE-AT ?auto_1194694 ?auto_1194699 ) ( CLEAR ?auto_1194694 ) ( IS-CRATE ?auto_1194695 ) ( AVAILABLE ?auto_1194701 ) ( TRUCK-AT ?auto_1194698 ?auto_1194697 ) ( LIFTING ?auto_1194702 ?auto_1194695 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1194695 ?auto_1194696 )
      ( MAKE-2CRATE-VERIFY ?auto_1194694 ?auto_1194695 ?auto_1194696 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1194703 - SURFACE
      ?auto_1194704 - SURFACE
      ?auto_1194705 - SURFACE
      ?auto_1194706 - SURFACE
    )
    :vars
    (
      ?auto_1194709 - HOIST
      ?auto_1194707 - PLACE
      ?auto_1194712 - PLACE
      ?auto_1194711 - HOIST
      ?auto_1194710 - SURFACE
      ?auto_1194708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194709 ?auto_1194707 ) ( IS-CRATE ?auto_1194706 ) ( not ( = ?auto_1194705 ?auto_1194706 ) ) ( not ( = ?auto_1194704 ?auto_1194705 ) ) ( not ( = ?auto_1194704 ?auto_1194706 ) ) ( not ( = ?auto_1194712 ?auto_1194707 ) ) ( HOIST-AT ?auto_1194711 ?auto_1194712 ) ( not ( = ?auto_1194709 ?auto_1194711 ) ) ( SURFACE-AT ?auto_1194706 ?auto_1194712 ) ( ON ?auto_1194706 ?auto_1194710 ) ( CLEAR ?auto_1194706 ) ( not ( = ?auto_1194705 ?auto_1194710 ) ) ( not ( = ?auto_1194706 ?auto_1194710 ) ) ( not ( = ?auto_1194704 ?auto_1194710 ) ) ( SURFACE-AT ?auto_1194704 ?auto_1194707 ) ( CLEAR ?auto_1194704 ) ( IS-CRATE ?auto_1194705 ) ( AVAILABLE ?auto_1194709 ) ( TRUCK-AT ?auto_1194708 ?auto_1194712 ) ( LIFTING ?auto_1194711 ?auto_1194705 ) ( ON ?auto_1194704 ?auto_1194703 ) ( not ( = ?auto_1194703 ?auto_1194704 ) ) ( not ( = ?auto_1194703 ?auto_1194705 ) ) ( not ( = ?auto_1194703 ?auto_1194706 ) ) ( not ( = ?auto_1194703 ?auto_1194710 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194704 ?auto_1194705 ?auto_1194706 )
      ( MAKE-3CRATE-VERIFY ?auto_1194703 ?auto_1194704 ?auto_1194705 ?auto_1194706 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1194713 - SURFACE
      ?auto_1194714 - SURFACE
      ?auto_1194715 - SURFACE
      ?auto_1194717 - SURFACE
      ?auto_1194716 - SURFACE
    )
    :vars
    (
      ?auto_1194720 - HOIST
      ?auto_1194718 - PLACE
      ?auto_1194723 - PLACE
      ?auto_1194722 - HOIST
      ?auto_1194721 - SURFACE
      ?auto_1194719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194720 ?auto_1194718 ) ( IS-CRATE ?auto_1194716 ) ( not ( = ?auto_1194717 ?auto_1194716 ) ) ( not ( = ?auto_1194715 ?auto_1194717 ) ) ( not ( = ?auto_1194715 ?auto_1194716 ) ) ( not ( = ?auto_1194723 ?auto_1194718 ) ) ( HOIST-AT ?auto_1194722 ?auto_1194723 ) ( not ( = ?auto_1194720 ?auto_1194722 ) ) ( SURFACE-AT ?auto_1194716 ?auto_1194723 ) ( ON ?auto_1194716 ?auto_1194721 ) ( CLEAR ?auto_1194716 ) ( not ( = ?auto_1194717 ?auto_1194721 ) ) ( not ( = ?auto_1194716 ?auto_1194721 ) ) ( not ( = ?auto_1194715 ?auto_1194721 ) ) ( SURFACE-AT ?auto_1194715 ?auto_1194718 ) ( CLEAR ?auto_1194715 ) ( IS-CRATE ?auto_1194717 ) ( AVAILABLE ?auto_1194720 ) ( TRUCK-AT ?auto_1194719 ?auto_1194723 ) ( LIFTING ?auto_1194722 ?auto_1194717 ) ( ON ?auto_1194714 ?auto_1194713 ) ( ON ?auto_1194715 ?auto_1194714 ) ( not ( = ?auto_1194713 ?auto_1194714 ) ) ( not ( = ?auto_1194713 ?auto_1194715 ) ) ( not ( = ?auto_1194713 ?auto_1194717 ) ) ( not ( = ?auto_1194713 ?auto_1194716 ) ) ( not ( = ?auto_1194713 ?auto_1194721 ) ) ( not ( = ?auto_1194714 ?auto_1194715 ) ) ( not ( = ?auto_1194714 ?auto_1194717 ) ) ( not ( = ?auto_1194714 ?auto_1194716 ) ) ( not ( = ?auto_1194714 ?auto_1194721 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194715 ?auto_1194717 ?auto_1194716 )
      ( MAKE-4CRATE-VERIFY ?auto_1194713 ?auto_1194714 ?auto_1194715 ?auto_1194717 ?auto_1194716 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1194724 - SURFACE
      ?auto_1194725 - SURFACE
      ?auto_1194726 - SURFACE
      ?auto_1194728 - SURFACE
      ?auto_1194727 - SURFACE
      ?auto_1194729 - SURFACE
    )
    :vars
    (
      ?auto_1194732 - HOIST
      ?auto_1194730 - PLACE
      ?auto_1194735 - PLACE
      ?auto_1194734 - HOIST
      ?auto_1194733 - SURFACE
      ?auto_1194731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194732 ?auto_1194730 ) ( IS-CRATE ?auto_1194729 ) ( not ( = ?auto_1194727 ?auto_1194729 ) ) ( not ( = ?auto_1194728 ?auto_1194727 ) ) ( not ( = ?auto_1194728 ?auto_1194729 ) ) ( not ( = ?auto_1194735 ?auto_1194730 ) ) ( HOIST-AT ?auto_1194734 ?auto_1194735 ) ( not ( = ?auto_1194732 ?auto_1194734 ) ) ( SURFACE-AT ?auto_1194729 ?auto_1194735 ) ( ON ?auto_1194729 ?auto_1194733 ) ( CLEAR ?auto_1194729 ) ( not ( = ?auto_1194727 ?auto_1194733 ) ) ( not ( = ?auto_1194729 ?auto_1194733 ) ) ( not ( = ?auto_1194728 ?auto_1194733 ) ) ( SURFACE-AT ?auto_1194728 ?auto_1194730 ) ( CLEAR ?auto_1194728 ) ( IS-CRATE ?auto_1194727 ) ( AVAILABLE ?auto_1194732 ) ( TRUCK-AT ?auto_1194731 ?auto_1194735 ) ( LIFTING ?auto_1194734 ?auto_1194727 ) ( ON ?auto_1194725 ?auto_1194724 ) ( ON ?auto_1194726 ?auto_1194725 ) ( ON ?auto_1194728 ?auto_1194726 ) ( not ( = ?auto_1194724 ?auto_1194725 ) ) ( not ( = ?auto_1194724 ?auto_1194726 ) ) ( not ( = ?auto_1194724 ?auto_1194728 ) ) ( not ( = ?auto_1194724 ?auto_1194727 ) ) ( not ( = ?auto_1194724 ?auto_1194729 ) ) ( not ( = ?auto_1194724 ?auto_1194733 ) ) ( not ( = ?auto_1194725 ?auto_1194726 ) ) ( not ( = ?auto_1194725 ?auto_1194728 ) ) ( not ( = ?auto_1194725 ?auto_1194727 ) ) ( not ( = ?auto_1194725 ?auto_1194729 ) ) ( not ( = ?auto_1194725 ?auto_1194733 ) ) ( not ( = ?auto_1194726 ?auto_1194728 ) ) ( not ( = ?auto_1194726 ?auto_1194727 ) ) ( not ( = ?auto_1194726 ?auto_1194729 ) ) ( not ( = ?auto_1194726 ?auto_1194733 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194728 ?auto_1194727 ?auto_1194729 )
      ( MAKE-5CRATE-VERIFY ?auto_1194724 ?auto_1194725 ?auto_1194726 ?auto_1194728 ?auto_1194727 ?auto_1194729 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1194736 - SURFACE
      ?auto_1194737 - SURFACE
      ?auto_1194738 - SURFACE
      ?auto_1194740 - SURFACE
      ?auto_1194739 - SURFACE
      ?auto_1194741 - SURFACE
      ?auto_1194742 - SURFACE
    )
    :vars
    (
      ?auto_1194745 - HOIST
      ?auto_1194743 - PLACE
      ?auto_1194748 - PLACE
      ?auto_1194747 - HOIST
      ?auto_1194746 - SURFACE
      ?auto_1194744 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194745 ?auto_1194743 ) ( IS-CRATE ?auto_1194742 ) ( not ( = ?auto_1194741 ?auto_1194742 ) ) ( not ( = ?auto_1194739 ?auto_1194741 ) ) ( not ( = ?auto_1194739 ?auto_1194742 ) ) ( not ( = ?auto_1194748 ?auto_1194743 ) ) ( HOIST-AT ?auto_1194747 ?auto_1194748 ) ( not ( = ?auto_1194745 ?auto_1194747 ) ) ( SURFACE-AT ?auto_1194742 ?auto_1194748 ) ( ON ?auto_1194742 ?auto_1194746 ) ( CLEAR ?auto_1194742 ) ( not ( = ?auto_1194741 ?auto_1194746 ) ) ( not ( = ?auto_1194742 ?auto_1194746 ) ) ( not ( = ?auto_1194739 ?auto_1194746 ) ) ( SURFACE-AT ?auto_1194739 ?auto_1194743 ) ( CLEAR ?auto_1194739 ) ( IS-CRATE ?auto_1194741 ) ( AVAILABLE ?auto_1194745 ) ( TRUCK-AT ?auto_1194744 ?auto_1194748 ) ( LIFTING ?auto_1194747 ?auto_1194741 ) ( ON ?auto_1194737 ?auto_1194736 ) ( ON ?auto_1194738 ?auto_1194737 ) ( ON ?auto_1194740 ?auto_1194738 ) ( ON ?auto_1194739 ?auto_1194740 ) ( not ( = ?auto_1194736 ?auto_1194737 ) ) ( not ( = ?auto_1194736 ?auto_1194738 ) ) ( not ( = ?auto_1194736 ?auto_1194740 ) ) ( not ( = ?auto_1194736 ?auto_1194739 ) ) ( not ( = ?auto_1194736 ?auto_1194741 ) ) ( not ( = ?auto_1194736 ?auto_1194742 ) ) ( not ( = ?auto_1194736 ?auto_1194746 ) ) ( not ( = ?auto_1194737 ?auto_1194738 ) ) ( not ( = ?auto_1194737 ?auto_1194740 ) ) ( not ( = ?auto_1194737 ?auto_1194739 ) ) ( not ( = ?auto_1194737 ?auto_1194741 ) ) ( not ( = ?auto_1194737 ?auto_1194742 ) ) ( not ( = ?auto_1194737 ?auto_1194746 ) ) ( not ( = ?auto_1194738 ?auto_1194740 ) ) ( not ( = ?auto_1194738 ?auto_1194739 ) ) ( not ( = ?auto_1194738 ?auto_1194741 ) ) ( not ( = ?auto_1194738 ?auto_1194742 ) ) ( not ( = ?auto_1194738 ?auto_1194746 ) ) ( not ( = ?auto_1194740 ?auto_1194739 ) ) ( not ( = ?auto_1194740 ?auto_1194741 ) ) ( not ( = ?auto_1194740 ?auto_1194742 ) ) ( not ( = ?auto_1194740 ?auto_1194746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194739 ?auto_1194741 ?auto_1194742 )
      ( MAKE-6CRATE-VERIFY ?auto_1194736 ?auto_1194737 ?auto_1194738 ?auto_1194740 ?auto_1194739 ?auto_1194741 ?auto_1194742 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1194749 - SURFACE
      ?auto_1194750 - SURFACE
      ?auto_1194751 - SURFACE
      ?auto_1194753 - SURFACE
      ?auto_1194752 - SURFACE
      ?auto_1194754 - SURFACE
      ?auto_1194755 - SURFACE
      ?auto_1194756 - SURFACE
    )
    :vars
    (
      ?auto_1194759 - HOIST
      ?auto_1194757 - PLACE
      ?auto_1194762 - PLACE
      ?auto_1194761 - HOIST
      ?auto_1194760 - SURFACE
      ?auto_1194758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194759 ?auto_1194757 ) ( IS-CRATE ?auto_1194756 ) ( not ( = ?auto_1194755 ?auto_1194756 ) ) ( not ( = ?auto_1194754 ?auto_1194755 ) ) ( not ( = ?auto_1194754 ?auto_1194756 ) ) ( not ( = ?auto_1194762 ?auto_1194757 ) ) ( HOIST-AT ?auto_1194761 ?auto_1194762 ) ( not ( = ?auto_1194759 ?auto_1194761 ) ) ( SURFACE-AT ?auto_1194756 ?auto_1194762 ) ( ON ?auto_1194756 ?auto_1194760 ) ( CLEAR ?auto_1194756 ) ( not ( = ?auto_1194755 ?auto_1194760 ) ) ( not ( = ?auto_1194756 ?auto_1194760 ) ) ( not ( = ?auto_1194754 ?auto_1194760 ) ) ( SURFACE-AT ?auto_1194754 ?auto_1194757 ) ( CLEAR ?auto_1194754 ) ( IS-CRATE ?auto_1194755 ) ( AVAILABLE ?auto_1194759 ) ( TRUCK-AT ?auto_1194758 ?auto_1194762 ) ( LIFTING ?auto_1194761 ?auto_1194755 ) ( ON ?auto_1194750 ?auto_1194749 ) ( ON ?auto_1194751 ?auto_1194750 ) ( ON ?auto_1194753 ?auto_1194751 ) ( ON ?auto_1194752 ?auto_1194753 ) ( ON ?auto_1194754 ?auto_1194752 ) ( not ( = ?auto_1194749 ?auto_1194750 ) ) ( not ( = ?auto_1194749 ?auto_1194751 ) ) ( not ( = ?auto_1194749 ?auto_1194753 ) ) ( not ( = ?auto_1194749 ?auto_1194752 ) ) ( not ( = ?auto_1194749 ?auto_1194754 ) ) ( not ( = ?auto_1194749 ?auto_1194755 ) ) ( not ( = ?auto_1194749 ?auto_1194756 ) ) ( not ( = ?auto_1194749 ?auto_1194760 ) ) ( not ( = ?auto_1194750 ?auto_1194751 ) ) ( not ( = ?auto_1194750 ?auto_1194753 ) ) ( not ( = ?auto_1194750 ?auto_1194752 ) ) ( not ( = ?auto_1194750 ?auto_1194754 ) ) ( not ( = ?auto_1194750 ?auto_1194755 ) ) ( not ( = ?auto_1194750 ?auto_1194756 ) ) ( not ( = ?auto_1194750 ?auto_1194760 ) ) ( not ( = ?auto_1194751 ?auto_1194753 ) ) ( not ( = ?auto_1194751 ?auto_1194752 ) ) ( not ( = ?auto_1194751 ?auto_1194754 ) ) ( not ( = ?auto_1194751 ?auto_1194755 ) ) ( not ( = ?auto_1194751 ?auto_1194756 ) ) ( not ( = ?auto_1194751 ?auto_1194760 ) ) ( not ( = ?auto_1194753 ?auto_1194752 ) ) ( not ( = ?auto_1194753 ?auto_1194754 ) ) ( not ( = ?auto_1194753 ?auto_1194755 ) ) ( not ( = ?auto_1194753 ?auto_1194756 ) ) ( not ( = ?auto_1194753 ?auto_1194760 ) ) ( not ( = ?auto_1194752 ?auto_1194754 ) ) ( not ( = ?auto_1194752 ?auto_1194755 ) ) ( not ( = ?auto_1194752 ?auto_1194756 ) ) ( not ( = ?auto_1194752 ?auto_1194760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194754 ?auto_1194755 ?auto_1194756 )
      ( MAKE-7CRATE-VERIFY ?auto_1194749 ?auto_1194750 ?auto_1194751 ?auto_1194753 ?auto_1194752 ?auto_1194754 ?auto_1194755 ?auto_1194756 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1194763 - SURFACE
      ?auto_1194764 - SURFACE
      ?auto_1194765 - SURFACE
      ?auto_1194767 - SURFACE
      ?auto_1194766 - SURFACE
      ?auto_1194768 - SURFACE
      ?auto_1194769 - SURFACE
      ?auto_1194770 - SURFACE
      ?auto_1194771 - SURFACE
    )
    :vars
    (
      ?auto_1194774 - HOIST
      ?auto_1194772 - PLACE
      ?auto_1194777 - PLACE
      ?auto_1194776 - HOIST
      ?auto_1194775 - SURFACE
      ?auto_1194773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194774 ?auto_1194772 ) ( IS-CRATE ?auto_1194771 ) ( not ( = ?auto_1194770 ?auto_1194771 ) ) ( not ( = ?auto_1194769 ?auto_1194770 ) ) ( not ( = ?auto_1194769 ?auto_1194771 ) ) ( not ( = ?auto_1194777 ?auto_1194772 ) ) ( HOIST-AT ?auto_1194776 ?auto_1194777 ) ( not ( = ?auto_1194774 ?auto_1194776 ) ) ( SURFACE-AT ?auto_1194771 ?auto_1194777 ) ( ON ?auto_1194771 ?auto_1194775 ) ( CLEAR ?auto_1194771 ) ( not ( = ?auto_1194770 ?auto_1194775 ) ) ( not ( = ?auto_1194771 ?auto_1194775 ) ) ( not ( = ?auto_1194769 ?auto_1194775 ) ) ( SURFACE-AT ?auto_1194769 ?auto_1194772 ) ( CLEAR ?auto_1194769 ) ( IS-CRATE ?auto_1194770 ) ( AVAILABLE ?auto_1194774 ) ( TRUCK-AT ?auto_1194773 ?auto_1194777 ) ( LIFTING ?auto_1194776 ?auto_1194770 ) ( ON ?auto_1194764 ?auto_1194763 ) ( ON ?auto_1194765 ?auto_1194764 ) ( ON ?auto_1194767 ?auto_1194765 ) ( ON ?auto_1194766 ?auto_1194767 ) ( ON ?auto_1194768 ?auto_1194766 ) ( ON ?auto_1194769 ?auto_1194768 ) ( not ( = ?auto_1194763 ?auto_1194764 ) ) ( not ( = ?auto_1194763 ?auto_1194765 ) ) ( not ( = ?auto_1194763 ?auto_1194767 ) ) ( not ( = ?auto_1194763 ?auto_1194766 ) ) ( not ( = ?auto_1194763 ?auto_1194768 ) ) ( not ( = ?auto_1194763 ?auto_1194769 ) ) ( not ( = ?auto_1194763 ?auto_1194770 ) ) ( not ( = ?auto_1194763 ?auto_1194771 ) ) ( not ( = ?auto_1194763 ?auto_1194775 ) ) ( not ( = ?auto_1194764 ?auto_1194765 ) ) ( not ( = ?auto_1194764 ?auto_1194767 ) ) ( not ( = ?auto_1194764 ?auto_1194766 ) ) ( not ( = ?auto_1194764 ?auto_1194768 ) ) ( not ( = ?auto_1194764 ?auto_1194769 ) ) ( not ( = ?auto_1194764 ?auto_1194770 ) ) ( not ( = ?auto_1194764 ?auto_1194771 ) ) ( not ( = ?auto_1194764 ?auto_1194775 ) ) ( not ( = ?auto_1194765 ?auto_1194767 ) ) ( not ( = ?auto_1194765 ?auto_1194766 ) ) ( not ( = ?auto_1194765 ?auto_1194768 ) ) ( not ( = ?auto_1194765 ?auto_1194769 ) ) ( not ( = ?auto_1194765 ?auto_1194770 ) ) ( not ( = ?auto_1194765 ?auto_1194771 ) ) ( not ( = ?auto_1194765 ?auto_1194775 ) ) ( not ( = ?auto_1194767 ?auto_1194766 ) ) ( not ( = ?auto_1194767 ?auto_1194768 ) ) ( not ( = ?auto_1194767 ?auto_1194769 ) ) ( not ( = ?auto_1194767 ?auto_1194770 ) ) ( not ( = ?auto_1194767 ?auto_1194771 ) ) ( not ( = ?auto_1194767 ?auto_1194775 ) ) ( not ( = ?auto_1194766 ?auto_1194768 ) ) ( not ( = ?auto_1194766 ?auto_1194769 ) ) ( not ( = ?auto_1194766 ?auto_1194770 ) ) ( not ( = ?auto_1194766 ?auto_1194771 ) ) ( not ( = ?auto_1194766 ?auto_1194775 ) ) ( not ( = ?auto_1194768 ?auto_1194769 ) ) ( not ( = ?auto_1194768 ?auto_1194770 ) ) ( not ( = ?auto_1194768 ?auto_1194771 ) ) ( not ( = ?auto_1194768 ?auto_1194775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194769 ?auto_1194770 ?auto_1194771 )
      ( MAKE-8CRATE-VERIFY ?auto_1194763 ?auto_1194764 ?auto_1194765 ?auto_1194767 ?auto_1194766 ?auto_1194768 ?auto_1194769 ?auto_1194770 ?auto_1194771 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1194778 - SURFACE
      ?auto_1194779 - SURFACE
      ?auto_1194780 - SURFACE
      ?auto_1194782 - SURFACE
      ?auto_1194781 - SURFACE
      ?auto_1194783 - SURFACE
      ?auto_1194784 - SURFACE
      ?auto_1194785 - SURFACE
      ?auto_1194786 - SURFACE
      ?auto_1194787 - SURFACE
    )
    :vars
    (
      ?auto_1194790 - HOIST
      ?auto_1194788 - PLACE
      ?auto_1194793 - PLACE
      ?auto_1194792 - HOIST
      ?auto_1194791 - SURFACE
      ?auto_1194789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194790 ?auto_1194788 ) ( IS-CRATE ?auto_1194787 ) ( not ( = ?auto_1194786 ?auto_1194787 ) ) ( not ( = ?auto_1194785 ?auto_1194786 ) ) ( not ( = ?auto_1194785 ?auto_1194787 ) ) ( not ( = ?auto_1194793 ?auto_1194788 ) ) ( HOIST-AT ?auto_1194792 ?auto_1194793 ) ( not ( = ?auto_1194790 ?auto_1194792 ) ) ( SURFACE-AT ?auto_1194787 ?auto_1194793 ) ( ON ?auto_1194787 ?auto_1194791 ) ( CLEAR ?auto_1194787 ) ( not ( = ?auto_1194786 ?auto_1194791 ) ) ( not ( = ?auto_1194787 ?auto_1194791 ) ) ( not ( = ?auto_1194785 ?auto_1194791 ) ) ( SURFACE-AT ?auto_1194785 ?auto_1194788 ) ( CLEAR ?auto_1194785 ) ( IS-CRATE ?auto_1194786 ) ( AVAILABLE ?auto_1194790 ) ( TRUCK-AT ?auto_1194789 ?auto_1194793 ) ( LIFTING ?auto_1194792 ?auto_1194786 ) ( ON ?auto_1194779 ?auto_1194778 ) ( ON ?auto_1194780 ?auto_1194779 ) ( ON ?auto_1194782 ?auto_1194780 ) ( ON ?auto_1194781 ?auto_1194782 ) ( ON ?auto_1194783 ?auto_1194781 ) ( ON ?auto_1194784 ?auto_1194783 ) ( ON ?auto_1194785 ?auto_1194784 ) ( not ( = ?auto_1194778 ?auto_1194779 ) ) ( not ( = ?auto_1194778 ?auto_1194780 ) ) ( not ( = ?auto_1194778 ?auto_1194782 ) ) ( not ( = ?auto_1194778 ?auto_1194781 ) ) ( not ( = ?auto_1194778 ?auto_1194783 ) ) ( not ( = ?auto_1194778 ?auto_1194784 ) ) ( not ( = ?auto_1194778 ?auto_1194785 ) ) ( not ( = ?auto_1194778 ?auto_1194786 ) ) ( not ( = ?auto_1194778 ?auto_1194787 ) ) ( not ( = ?auto_1194778 ?auto_1194791 ) ) ( not ( = ?auto_1194779 ?auto_1194780 ) ) ( not ( = ?auto_1194779 ?auto_1194782 ) ) ( not ( = ?auto_1194779 ?auto_1194781 ) ) ( not ( = ?auto_1194779 ?auto_1194783 ) ) ( not ( = ?auto_1194779 ?auto_1194784 ) ) ( not ( = ?auto_1194779 ?auto_1194785 ) ) ( not ( = ?auto_1194779 ?auto_1194786 ) ) ( not ( = ?auto_1194779 ?auto_1194787 ) ) ( not ( = ?auto_1194779 ?auto_1194791 ) ) ( not ( = ?auto_1194780 ?auto_1194782 ) ) ( not ( = ?auto_1194780 ?auto_1194781 ) ) ( not ( = ?auto_1194780 ?auto_1194783 ) ) ( not ( = ?auto_1194780 ?auto_1194784 ) ) ( not ( = ?auto_1194780 ?auto_1194785 ) ) ( not ( = ?auto_1194780 ?auto_1194786 ) ) ( not ( = ?auto_1194780 ?auto_1194787 ) ) ( not ( = ?auto_1194780 ?auto_1194791 ) ) ( not ( = ?auto_1194782 ?auto_1194781 ) ) ( not ( = ?auto_1194782 ?auto_1194783 ) ) ( not ( = ?auto_1194782 ?auto_1194784 ) ) ( not ( = ?auto_1194782 ?auto_1194785 ) ) ( not ( = ?auto_1194782 ?auto_1194786 ) ) ( not ( = ?auto_1194782 ?auto_1194787 ) ) ( not ( = ?auto_1194782 ?auto_1194791 ) ) ( not ( = ?auto_1194781 ?auto_1194783 ) ) ( not ( = ?auto_1194781 ?auto_1194784 ) ) ( not ( = ?auto_1194781 ?auto_1194785 ) ) ( not ( = ?auto_1194781 ?auto_1194786 ) ) ( not ( = ?auto_1194781 ?auto_1194787 ) ) ( not ( = ?auto_1194781 ?auto_1194791 ) ) ( not ( = ?auto_1194783 ?auto_1194784 ) ) ( not ( = ?auto_1194783 ?auto_1194785 ) ) ( not ( = ?auto_1194783 ?auto_1194786 ) ) ( not ( = ?auto_1194783 ?auto_1194787 ) ) ( not ( = ?auto_1194783 ?auto_1194791 ) ) ( not ( = ?auto_1194784 ?auto_1194785 ) ) ( not ( = ?auto_1194784 ?auto_1194786 ) ) ( not ( = ?auto_1194784 ?auto_1194787 ) ) ( not ( = ?auto_1194784 ?auto_1194791 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194785 ?auto_1194786 ?auto_1194787 )
      ( MAKE-9CRATE-VERIFY ?auto_1194778 ?auto_1194779 ?auto_1194780 ?auto_1194782 ?auto_1194781 ?auto_1194783 ?auto_1194784 ?auto_1194785 ?auto_1194786 ?auto_1194787 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1194794 - SURFACE
      ?auto_1194795 - SURFACE
      ?auto_1194796 - SURFACE
      ?auto_1194798 - SURFACE
      ?auto_1194797 - SURFACE
      ?auto_1194799 - SURFACE
      ?auto_1194800 - SURFACE
      ?auto_1194801 - SURFACE
      ?auto_1194802 - SURFACE
      ?auto_1194803 - SURFACE
      ?auto_1194804 - SURFACE
    )
    :vars
    (
      ?auto_1194807 - HOIST
      ?auto_1194805 - PLACE
      ?auto_1194810 - PLACE
      ?auto_1194809 - HOIST
      ?auto_1194808 - SURFACE
      ?auto_1194806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194807 ?auto_1194805 ) ( IS-CRATE ?auto_1194804 ) ( not ( = ?auto_1194803 ?auto_1194804 ) ) ( not ( = ?auto_1194802 ?auto_1194803 ) ) ( not ( = ?auto_1194802 ?auto_1194804 ) ) ( not ( = ?auto_1194810 ?auto_1194805 ) ) ( HOIST-AT ?auto_1194809 ?auto_1194810 ) ( not ( = ?auto_1194807 ?auto_1194809 ) ) ( SURFACE-AT ?auto_1194804 ?auto_1194810 ) ( ON ?auto_1194804 ?auto_1194808 ) ( CLEAR ?auto_1194804 ) ( not ( = ?auto_1194803 ?auto_1194808 ) ) ( not ( = ?auto_1194804 ?auto_1194808 ) ) ( not ( = ?auto_1194802 ?auto_1194808 ) ) ( SURFACE-AT ?auto_1194802 ?auto_1194805 ) ( CLEAR ?auto_1194802 ) ( IS-CRATE ?auto_1194803 ) ( AVAILABLE ?auto_1194807 ) ( TRUCK-AT ?auto_1194806 ?auto_1194810 ) ( LIFTING ?auto_1194809 ?auto_1194803 ) ( ON ?auto_1194795 ?auto_1194794 ) ( ON ?auto_1194796 ?auto_1194795 ) ( ON ?auto_1194798 ?auto_1194796 ) ( ON ?auto_1194797 ?auto_1194798 ) ( ON ?auto_1194799 ?auto_1194797 ) ( ON ?auto_1194800 ?auto_1194799 ) ( ON ?auto_1194801 ?auto_1194800 ) ( ON ?auto_1194802 ?auto_1194801 ) ( not ( = ?auto_1194794 ?auto_1194795 ) ) ( not ( = ?auto_1194794 ?auto_1194796 ) ) ( not ( = ?auto_1194794 ?auto_1194798 ) ) ( not ( = ?auto_1194794 ?auto_1194797 ) ) ( not ( = ?auto_1194794 ?auto_1194799 ) ) ( not ( = ?auto_1194794 ?auto_1194800 ) ) ( not ( = ?auto_1194794 ?auto_1194801 ) ) ( not ( = ?auto_1194794 ?auto_1194802 ) ) ( not ( = ?auto_1194794 ?auto_1194803 ) ) ( not ( = ?auto_1194794 ?auto_1194804 ) ) ( not ( = ?auto_1194794 ?auto_1194808 ) ) ( not ( = ?auto_1194795 ?auto_1194796 ) ) ( not ( = ?auto_1194795 ?auto_1194798 ) ) ( not ( = ?auto_1194795 ?auto_1194797 ) ) ( not ( = ?auto_1194795 ?auto_1194799 ) ) ( not ( = ?auto_1194795 ?auto_1194800 ) ) ( not ( = ?auto_1194795 ?auto_1194801 ) ) ( not ( = ?auto_1194795 ?auto_1194802 ) ) ( not ( = ?auto_1194795 ?auto_1194803 ) ) ( not ( = ?auto_1194795 ?auto_1194804 ) ) ( not ( = ?auto_1194795 ?auto_1194808 ) ) ( not ( = ?auto_1194796 ?auto_1194798 ) ) ( not ( = ?auto_1194796 ?auto_1194797 ) ) ( not ( = ?auto_1194796 ?auto_1194799 ) ) ( not ( = ?auto_1194796 ?auto_1194800 ) ) ( not ( = ?auto_1194796 ?auto_1194801 ) ) ( not ( = ?auto_1194796 ?auto_1194802 ) ) ( not ( = ?auto_1194796 ?auto_1194803 ) ) ( not ( = ?auto_1194796 ?auto_1194804 ) ) ( not ( = ?auto_1194796 ?auto_1194808 ) ) ( not ( = ?auto_1194798 ?auto_1194797 ) ) ( not ( = ?auto_1194798 ?auto_1194799 ) ) ( not ( = ?auto_1194798 ?auto_1194800 ) ) ( not ( = ?auto_1194798 ?auto_1194801 ) ) ( not ( = ?auto_1194798 ?auto_1194802 ) ) ( not ( = ?auto_1194798 ?auto_1194803 ) ) ( not ( = ?auto_1194798 ?auto_1194804 ) ) ( not ( = ?auto_1194798 ?auto_1194808 ) ) ( not ( = ?auto_1194797 ?auto_1194799 ) ) ( not ( = ?auto_1194797 ?auto_1194800 ) ) ( not ( = ?auto_1194797 ?auto_1194801 ) ) ( not ( = ?auto_1194797 ?auto_1194802 ) ) ( not ( = ?auto_1194797 ?auto_1194803 ) ) ( not ( = ?auto_1194797 ?auto_1194804 ) ) ( not ( = ?auto_1194797 ?auto_1194808 ) ) ( not ( = ?auto_1194799 ?auto_1194800 ) ) ( not ( = ?auto_1194799 ?auto_1194801 ) ) ( not ( = ?auto_1194799 ?auto_1194802 ) ) ( not ( = ?auto_1194799 ?auto_1194803 ) ) ( not ( = ?auto_1194799 ?auto_1194804 ) ) ( not ( = ?auto_1194799 ?auto_1194808 ) ) ( not ( = ?auto_1194800 ?auto_1194801 ) ) ( not ( = ?auto_1194800 ?auto_1194802 ) ) ( not ( = ?auto_1194800 ?auto_1194803 ) ) ( not ( = ?auto_1194800 ?auto_1194804 ) ) ( not ( = ?auto_1194800 ?auto_1194808 ) ) ( not ( = ?auto_1194801 ?auto_1194802 ) ) ( not ( = ?auto_1194801 ?auto_1194803 ) ) ( not ( = ?auto_1194801 ?auto_1194804 ) ) ( not ( = ?auto_1194801 ?auto_1194808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194802 ?auto_1194803 ?auto_1194804 )
      ( MAKE-10CRATE-VERIFY ?auto_1194794 ?auto_1194795 ?auto_1194796 ?auto_1194798 ?auto_1194797 ?auto_1194799 ?auto_1194800 ?auto_1194801 ?auto_1194802 ?auto_1194803 ?auto_1194804 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1194811 - SURFACE
      ?auto_1194812 - SURFACE
    )
    :vars
    (
      ?auto_1194816 - HOIST
      ?auto_1194813 - PLACE
      ?auto_1194815 - SURFACE
      ?auto_1194819 - PLACE
      ?auto_1194818 - HOIST
      ?auto_1194817 - SURFACE
      ?auto_1194814 - TRUCK
      ?auto_1194820 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194816 ?auto_1194813 ) ( IS-CRATE ?auto_1194812 ) ( not ( = ?auto_1194811 ?auto_1194812 ) ) ( not ( = ?auto_1194815 ?auto_1194811 ) ) ( not ( = ?auto_1194815 ?auto_1194812 ) ) ( not ( = ?auto_1194819 ?auto_1194813 ) ) ( HOIST-AT ?auto_1194818 ?auto_1194819 ) ( not ( = ?auto_1194816 ?auto_1194818 ) ) ( SURFACE-AT ?auto_1194812 ?auto_1194819 ) ( ON ?auto_1194812 ?auto_1194817 ) ( CLEAR ?auto_1194812 ) ( not ( = ?auto_1194811 ?auto_1194817 ) ) ( not ( = ?auto_1194812 ?auto_1194817 ) ) ( not ( = ?auto_1194815 ?auto_1194817 ) ) ( SURFACE-AT ?auto_1194815 ?auto_1194813 ) ( CLEAR ?auto_1194815 ) ( IS-CRATE ?auto_1194811 ) ( AVAILABLE ?auto_1194816 ) ( TRUCK-AT ?auto_1194814 ?auto_1194819 ) ( AVAILABLE ?auto_1194818 ) ( SURFACE-AT ?auto_1194811 ?auto_1194819 ) ( ON ?auto_1194811 ?auto_1194820 ) ( CLEAR ?auto_1194811 ) ( not ( = ?auto_1194811 ?auto_1194820 ) ) ( not ( = ?auto_1194812 ?auto_1194820 ) ) ( not ( = ?auto_1194815 ?auto_1194820 ) ) ( not ( = ?auto_1194817 ?auto_1194820 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1194818 ?auto_1194811 ?auto_1194820 ?auto_1194819 )
      ( MAKE-2CRATE ?auto_1194815 ?auto_1194811 ?auto_1194812 )
      ( MAKE-1CRATE-VERIFY ?auto_1194811 ?auto_1194812 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1194821 - SURFACE
      ?auto_1194822 - SURFACE
      ?auto_1194823 - SURFACE
    )
    :vars
    (
      ?auto_1194827 - HOIST
      ?auto_1194826 - PLACE
      ?auto_1194829 - PLACE
      ?auto_1194828 - HOIST
      ?auto_1194830 - SURFACE
      ?auto_1194825 - TRUCK
      ?auto_1194824 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194827 ?auto_1194826 ) ( IS-CRATE ?auto_1194823 ) ( not ( = ?auto_1194822 ?auto_1194823 ) ) ( not ( = ?auto_1194821 ?auto_1194822 ) ) ( not ( = ?auto_1194821 ?auto_1194823 ) ) ( not ( = ?auto_1194829 ?auto_1194826 ) ) ( HOIST-AT ?auto_1194828 ?auto_1194829 ) ( not ( = ?auto_1194827 ?auto_1194828 ) ) ( SURFACE-AT ?auto_1194823 ?auto_1194829 ) ( ON ?auto_1194823 ?auto_1194830 ) ( CLEAR ?auto_1194823 ) ( not ( = ?auto_1194822 ?auto_1194830 ) ) ( not ( = ?auto_1194823 ?auto_1194830 ) ) ( not ( = ?auto_1194821 ?auto_1194830 ) ) ( SURFACE-AT ?auto_1194821 ?auto_1194826 ) ( CLEAR ?auto_1194821 ) ( IS-CRATE ?auto_1194822 ) ( AVAILABLE ?auto_1194827 ) ( TRUCK-AT ?auto_1194825 ?auto_1194829 ) ( AVAILABLE ?auto_1194828 ) ( SURFACE-AT ?auto_1194822 ?auto_1194829 ) ( ON ?auto_1194822 ?auto_1194824 ) ( CLEAR ?auto_1194822 ) ( not ( = ?auto_1194822 ?auto_1194824 ) ) ( not ( = ?auto_1194823 ?auto_1194824 ) ) ( not ( = ?auto_1194821 ?auto_1194824 ) ) ( not ( = ?auto_1194830 ?auto_1194824 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1194822 ?auto_1194823 )
      ( MAKE-2CRATE-VERIFY ?auto_1194821 ?auto_1194822 ?auto_1194823 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1194831 - SURFACE
      ?auto_1194832 - SURFACE
      ?auto_1194833 - SURFACE
      ?auto_1194834 - SURFACE
    )
    :vars
    (
      ?auto_1194841 - HOIST
      ?auto_1194837 - PLACE
      ?auto_1194835 - PLACE
      ?auto_1194836 - HOIST
      ?auto_1194838 - SURFACE
      ?auto_1194839 - TRUCK
      ?auto_1194840 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194841 ?auto_1194837 ) ( IS-CRATE ?auto_1194834 ) ( not ( = ?auto_1194833 ?auto_1194834 ) ) ( not ( = ?auto_1194832 ?auto_1194833 ) ) ( not ( = ?auto_1194832 ?auto_1194834 ) ) ( not ( = ?auto_1194835 ?auto_1194837 ) ) ( HOIST-AT ?auto_1194836 ?auto_1194835 ) ( not ( = ?auto_1194841 ?auto_1194836 ) ) ( SURFACE-AT ?auto_1194834 ?auto_1194835 ) ( ON ?auto_1194834 ?auto_1194838 ) ( CLEAR ?auto_1194834 ) ( not ( = ?auto_1194833 ?auto_1194838 ) ) ( not ( = ?auto_1194834 ?auto_1194838 ) ) ( not ( = ?auto_1194832 ?auto_1194838 ) ) ( SURFACE-AT ?auto_1194832 ?auto_1194837 ) ( CLEAR ?auto_1194832 ) ( IS-CRATE ?auto_1194833 ) ( AVAILABLE ?auto_1194841 ) ( TRUCK-AT ?auto_1194839 ?auto_1194835 ) ( AVAILABLE ?auto_1194836 ) ( SURFACE-AT ?auto_1194833 ?auto_1194835 ) ( ON ?auto_1194833 ?auto_1194840 ) ( CLEAR ?auto_1194833 ) ( not ( = ?auto_1194833 ?auto_1194840 ) ) ( not ( = ?auto_1194834 ?auto_1194840 ) ) ( not ( = ?auto_1194832 ?auto_1194840 ) ) ( not ( = ?auto_1194838 ?auto_1194840 ) ) ( ON ?auto_1194832 ?auto_1194831 ) ( not ( = ?auto_1194831 ?auto_1194832 ) ) ( not ( = ?auto_1194831 ?auto_1194833 ) ) ( not ( = ?auto_1194831 ?auto_1194834 ) ) ( not ( = ?auto_1194831 ?auto_1194838 ) ) ( not ( = ?auto_1194831 ?auto_1194840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194832 ?auto_1194833 ?auto_1194834 )
      ( MAKE-3CRATE-VERIFY ?auto_1194831 ?auto_1194832 ?auto_1194833 ?auto_1194834 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1194842 - SURFACE
      ?auto_1194843 - SURFACE
      ?auto_1194844 - SURFACE
      ?auto_1194846 - SURFACE
      ?auto_1194845 - SURFACE
    )
    :vars
    (
      ?auto_1194853 - HOIST
      ?auto_1194849 - PLACE
      ?auto_1194847 - PLACE
      ?auto_1194848 - HOIST
      ?auto_1194850 - SURFACE
      ?auto_1194851 - TRUCK
      ?auto_1194852 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194853 ?auto_1194849 ) ( IS-CRATE ?auto_1194845 ) ( not ( = ?auto_1194846 ?auto_1194845 ) ) ( not ( = ?auto_1194844 ?auto_1194846 ) ) ( not ( = ?auto_1194844 ?auto_1194845 ) ) ( not ( = ?auto_1194847 ?auto_1194849 ) ) ( HOIST-AT ?auto_1194848 ?auto_1194847 ) ( not ( = ?auto_1194853 ?auto_1194848 ) ) ( SURFACE-AT ?auto_1194845 ?auto_1194847 ) ( ON ?auto_1194845 ?auto_1194850 ) ( CLEAR ?auto_1194845 ) ( not ( = ?auto_1194846 ?auto_1194850 ) ) ( not ( = ?auto_1194845 ?auto_1194850 ) ) ( not ( = ?auto_1194844 ?auto_1194850 ) ) ( SURFACE-AT ?auto_1194844 ?auto_1194849 ) ( CLEAR ?auto_1194844 ) ( IS-CRATE ?auto_1194846 ) ( AVAILABLE ?auto_1194853 ) ( TRUCK-AT ?auto_1194851 ?auto_1194847 ) ( AVAILABLE ?auto_1194848 ) ( SURFACE-AT ?auto_1194846 ?auto_1194847 ) ( ON ?auto_1194846 ?auto_1194852 ) ( CLEAR ?auto_1194846 ) ( not ( = ?auto_1194846 ?auto_1194852 ) ) ( not ( = ?auto_1194845 ?auto_1194852 ) ) ( not ( = ?auto_1194844 ?auto_1194852 ) ) ( not ( = ?auto_1194850 ?auto_1194852 ) ) ( ON ?auto_1194843 ?auto_1194842 ) ( ON ?auto_1194844 ?auto_1194843 ) ( not ( = ?auto_1194842 ?auto_1194843 ) ) ( not ( = ?auto_1194842 ?auto_1194844 ) ) ( not ( = ?auto_1194842 ?auto_1194846 ) ) ( not ( = ?auto_1194842 ?auto_1194845 ) ) ( not ( = ?auto_1194842 ?auto_1194850 ) ) ( not ( = ?auto_1194842 ?auto_1194852 ) ) ( not ( = ?auto_1194843 ?auto_1194844 ) ) ( not ( = ?auto_1194843 ?auto_1194846 ) ) ( not ( = ?auto_1194843 ?auto_1194845 ) ) ( not ( = ?auto_1194843 ?auto_1194850 ) ) ( not ( = ?auto_1194843 ?auto_1194852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194844 ?auto_1194846 ?auto_1194845 )
      ( MAKE-4CRATE-VERIFY ?auto_1194842 ?auto_1194843 ?auto_1194844 ?auto_1194846 ?auto_1194845 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1194854 - SURFACE
      ?auto_1194855 - SURFACE
      ?auto_1194856 - SURFACE
      ?auto_1194858 - SURFACE
      ?auto_1194857 - SURFACE
      ?auto_1194859 - SURFACE
    )
    :vars
    (
      ?auto_1194866 - HOIST
      ?auto_1194862 - PLACE
      ?auto_1194860 - PLACE
      ?auto_1194861 - HOIST
      ?auto_1194863 - SURFACE
      ?auto_1194864 - TRUCK
      ?auto_1194865 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194866 ?auto_1194862 ) ( IS-CRATE ?auto_1194859 ) ( not ( = ?auto_1194857 ?auto_1194859 ) ) ( not ( = ?auto_1194858 ?auto_1194857 ) ) ( not ( = ?auto_1194858 ?auto_1194859 ) ) ( not ( = ?auto_1194860 ?auto_1194862 ) ) ( HOIST-AT ?auto_1194861 ?auto_1194860 ) ( not ( = ?auto_1194866 ?auto_1194861 ) ) ( SURFACE-AT ?auto_1194859 ?auto_1194860 ) ( ON ?auto_1194859 ?auto_1194863 ) ( CLEAR ?auto_1194859 ) ( not ( = ?auto_1194857 ?auto_1194863 ) ) ( not ( = ?auto_1194859 ?auto_1194863 ) ) ( not ( = ?auto_1194858 ?auto_1194863 ) ) ( SURFACE-AT ?auto_1194858 ?auto_1194862 ) ( CLEAR ?auto_1194858 ) ( IS-CRATE ?auto_1194857 ) ( AVAILABLE ?auto_1194866 ) ( TRUCK-AT ?auto_1194864 ?auto_1194860 ) ( AVAILABLE ?auto_1194861 ) ( SURFACE-AT ?auto_1194857 ?auto_1194860 ) ( ON ?auto_1194857 ?auto_1194865 ) ( CLEAR ?auto_1194857 ) ( not ( = ?auto_1194857 ?auto_1194865 ) ) ( not ( = ?auto_1194859 ?auto_1194865 ) ) ( not ( = ?auto_1194858 ?auto_1194865 ) ) ( not ( = ?auto_1194863 ?auto_1194865 ) ) ( ON ?auto_1194855 ?auto_1194854 ) ( ON ?auto_1194856 ?auto_1194855 ) ( ON ?auto_1194858 ?auto_1194856 ) ( not ( = ?auto_1194854 ?auto_1194855 ) ) ( not ( = ?auto_1194854 ?auto_1194856 ) ) ( not ( = ?auto_1194854 ?auto_1194858 ) ) ( not ( = ?auto_1194854 ?auto_1194857 ) ) ( not ( = ?auto_1194854 ?auto_1194859 ) ) ( not ( = ?auto_1194854 ?auto_1194863 ) ) ( not ( = ?auto_1194854 ?auto_1194865 ) ) ( not ( = ?auto_1194855 ?auto_1194856 ) ) ( not ( = ?auto_1194855 ?auto_1194858 ) ) ( not ( = ?auto_1194855 ?auto_1194857 ) ) ( not ( = ?auto_1194855 ?auto_1194859 ) ) ( not ( = ?auto_1194855 ?auto_1194863 ) ) ( not ( = ?auto_1194855 ?auto_1194865 ) ) ( not ( = ?auto_1194856 ?auto_1194858 ) ) ( not ( = ?auto_1194856 ?auto_1194857 ) ) ( not ( = ?auto_1194856 ?auto_1194859 ) ) ( not ( = ?auto_1194856 ?auto_1194863 ) ) ( not ( = ?auto_1194856 ?auto_1194865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194858 ?auto_1194857 ?auto_1194859 )
      ( MAKE-5CRATE-VERIFY ?auto_1194854 ?auto_1194855 ?auto_1194856 ?auto_1194858 ?auto_1194857 ?auto_1194859 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1194867 - SURFACE
      ?auto_1194868 - SURFACE
      ?auto_1194869 - SURFACE
      ?auto_1194871 - SURFACE
      ?auto_1194870 - SURFACE
      ?auto_1194872 - SURFACE
      ?auto_1194873 - SURFACE
    )
    :vars
    (
      ?auto_1194880 - HOIST
      ?auto_1194876 - PLACE
      ?auto_1194874 - PLACE
      ?auto_1194875 - HOIST
      ?auto_1194877 - SURFACE
      ?auto_1194878 - TRUCK
      ?auto_1194879 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194880 ?auto_1194876 ) ( IS-CRATE ?auto_1194873 ) ( not ( = ?auto_1194872 ?auto_1194873 ) ) ( not ( = ?auto_1194870 ?auto_1194872 ) ) ( not ( = ?auto_1194870 ?auto_1194873 ) ) ( not ( = ?auto_1194874 ?auto_1194876 ) ) ( HOIST-AT ?auto_1194875 ?auto_1194874 ) ( not ( = ?auto_1194880 ?auto_1194875 ) ) ( SURFACE-AT ?auto_1194873 ?auto_1194874 ) ( ON ?auto_1194873 ?auto_1194877 ) ( CLEAR ?auto_1194873 ) ( not ( = ?auto_1194872 ?auto_1194877 ) ) ( not ( = ?auto_1194873 ?auto_1194877 ) ) ( not ( = ?auto_1194870 ?auto_1194877 ) ) ( SURFACE-AT ?auto_1194870 ?auto_1194876 ) ( CLEAR ?auto_1194870 ) ( IS-CRATE ?auto_1194872 ) ( AVAILABLE ?auto_1194880 ) ( TRUCK-AT ?auto_1194878 ?auto_1194874 ) ( AVAILABLE ?auto_1194875 ) ( SURFACE-AT ?auto_1194872 ?auto_1194874 ) ( ON ?auto_1194872 ?auto_1194879 ) ( CLEAR ?auto_1194872 ) ( not ( = ?auto_1194872 ?auto_1194879 ) ) ( not ( = ?auto_1194873 ?auto_1194879 ) ) ( not ( = ?auto_1194870 ?auto_1194879 ) ) ( not ( = ?auto_1194877 ?auto_1194879 ) ) ( ON ?auto_1194868 ?auto_1194867 ) ( ON ?auto_1194869 ?auto_1194868 ) ( ON ?auto_1194871 ?auto_1194869 ) ( ON ?auto_1194870 ?auto_1194871 ) ( not ( = ?auto_1194867 ?auto_1194868 ) ) ( not ( = ?auto_1194867 ?auto_1194869 ) ) ( not ( = ?auto_1194867 ?auto_1194871 ) ) ( not ( = ?auto_1194867 ?auto_1194870 ) ) ( not ( = ?auto_1194867 ?auto_1194872 ) ) ( not ( = ?auto_1194867 ?auto_1194873 ) ) ( not ( = ?auto_1194867 ?auto_1194877 ) ) ( not ( = ?auto_1194867 ?auto_1194879 ) ) ( not ( = ?auto_1194868 ?auto_1194869 ) ) ( not ( = ?auto_1194868 ?auto_1194871 ) ) ( not ( = ?auto_1194868 ?auto_1194870 ) ) ( not ( = ?auto_1194868 ?auto_1194872 ) ) ( not ( = ?auto_1194868 ?auto_1194873 ) ) ( not ( = ?auto_1194868 ?auto_1194877 ) ) ( not ( = ?auto_1194868 ?auto_1194879 ) ) ( not ( = ?auto_1194869 ?auto_1194871 ) ) ( not ( = ?auto_1194869 ?auto_1194870 ) ) ( not ( = ?auto_1194869 ?auto_1194872 ) ) ( not ( = ?auto_1194869 ?auto_1194873 ) ) ( not ( = ?auto_1194869 ?auto_1194877 ) ) ( not ( = ?auto_1194869 ?auto_1194879 ) ) ( not ( = ?auto_1194871 ?auto_1194870 ) ) ( not ( = ?auto_1194871 ?auto_1194872 ) ) ( not ( = ?auto_1194871 ?auto_1194873 ) ) ( not ( = ?auto_1194871 ?auto_1194877 ) ) ( not ( = ?auto_1194871 ?auto_1194879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194870 ?auto_1194872 ?auto_1194873 )
      ( MAKE-6CRATE-VERIFY ?auto_1194867 ?auto_1194868 ?auto_1194869 ?auto_1194871 ?auto_1194870 ?auto_1194872 ?auto_1194873 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1194881 - SURFACE
      ?auto_1194882 - SURFACE
      ?auto_1194883 - SURFACE
      ?auto_1194885 - SURFACE
      ?auto_1194884 - SURFACE
      ?auto_1194886 - SURFACE
      ?auto_1194887 - SURFACE
      ?auto_1194888 - SURFACE
    )
    :vars
    (
      ?auto_1194895 - HOIST
      ?auto_1194891 - PLACE
      ?auto_1194889 - PLACE
      ?auto_1194890 - HOIST
      ?auto_1194892 - SURFACE
      ?auto_1194893 - TRUCK
      ?auto_1194894 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194895 ?auto_1194891 ) ( IS-CRATE ?auto_1194888 ) ( not ( = ?auto_1194887 ?auto_1194888 ) ) ( not ( = ?auto_1194886 ?auto_1194887 ) ) ( not ( = ?auto_1194886 ?auto_1194888 ) ) ( not ( = ?auto_1194889 ?auto_1194891 ) ) ( HOIST-AT ?auto_1194890 ?auto_1194889 ) ( not ( = ?auto_1194895 ?auto_1194890 ) ) ( SURFACE-AT ?auto_1194888 ?auto_1194889 ) ( ON ?auto_1194888 ?auto_1194892 ) ( CLEAR ?auto_1194888 ) ( not ( = ?auto_1194887 ?auto_1194892 ) ) ( not ( = ?auto_1194888 ?auto_1194892 ) ) ( not ( = ?auto_1194886 ?auto_1194892 ) ) ( SURFACE-AT ?auto_1194886 ?auto_1194891 ) ( CLEAR ?auto_1194886 ) ( IS-CRATE ?auto_1194887 ) ( AVAILABLE ?auto_1194895 ) ( TRUCK-AT ?auto_1194893 ?auto_1194889 ) ( AVAILABLE ?auto_1194890 ) ( SURFACE-AT ?auto_1194887 ?auto_1194889 ) ( ON ?auto_1194887 ?auto_1194894 ) ( CLEAR ?auto_1194887 ) ( not ( = ?auto_1194887 ?auto_1194894 ) ) ( not ( = ?auto_1194888 ?auto_1194894 ) ) ( not ( = ?auto_1194886 ?auto_1194894 ) ) ( not ( = ?auto_1194892 ?auto_1194894 ) ) ( ON ?auto_1194882 ?auto_1194881 ) ( ON ?auto_1194883 ?auto_1194882 ) ( ON ?auto_1194885 ?auto_1194883 ) ( ON ?auto_1194884 ?auto_1194885 ) ( ON ?auto_1194886 ?auto_1194884 ) ( not ( = ?auto_1194881 ?auto_1194882 ) ) ( not ( = ?auto_1194881 ?auto_1194883 ) ) ( not ( = ?auto_1194881 ?auto_1194885 ) ) ( not ( = ?auto_1194881 ?auto_1194884 ) ) ( not ( = ?auto_1194881 ?auto_1194886 ) ) ( not ( = ?auto_1194881 ?auto_1194887 ) ) ( not ( = ?auto_1194881 ?auto_1194888 ) ) ( not ( = ?auto_1194881 ?auto_1194892 ) ) ( not ( = ?auto_1194881 ?auto_1194894 ) ) ( not ( = ?auto_1194882 ?auto_1194883 ) ) ( not ( = ?auto_1194882 ?auto_1194885 ) ) ( not ( = ?auto_1194882 ?auto_1194884 ) ) ( not ( = ?auto_1194882 ?auto_1194886 ) ) ( not ( = ?auto_1194882 ?auto_1194887 ) ) ( not ( = ?auto_1194882 ?auto_1194888 ) ) ( not ( = ?auto_1194882 ?auto_1194892 ) ) ( not ( = ?auto_1194882 ?auto_1194894 ) ) ( not ( = ?auto_1194883 ?auto_1194885 ) ) ( not ( = ?auto_1194883 ?auto_1194884 ) ) ( not ( = ?auto_1194883 ?auto_1194886 ) ) ( not ( = ?auto_1194883 ?auto_1194887 ) ) ( not ( = ?auto_1194883 ?auto_1194888 ) ) ( not ( = ?auto_1194883 ?auto_1194892 ) ) ( not ( = ?auto_1194883 ?auto_1194894 ) ) ( not ( = ?auto_1194885 ?auto_1194884 ) ) ( not ( = ?auto_1194885 ?auto_1194886 ) ) ( not ( = ?auto_1194885 ?auto_1194887 ) ) ( not ( = ?auto_1194885 ?auto_1194888 ) ) ( not ( = ?auto_1194885 ?auto_1194892 ) ) ( not ( = ?auto_1194885 ?auto_1194894 ) ) ( not ( = ?auto_1194884 ?auto_1194886 ) ) ( not ( = ?auto_1194884 ?auto_1194887 ) ) ( not ( = ?auto_1194884 ?auto_1194888 ) ) ( not ( = ?auto_1194884 ?auto_1194892 ) ) ( not ( = ?auto_1194884 ?auto_1194894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194886 ?auto_1194887 ?auto_1194888 )
      ( MAKE-7CRATE-VERIFY ?auto_1194881 ?auto_1194882 ?auto_1194883 ?auto_1194885 ?auto_1194884 ?auto_1194886 ?auto_1194887 ?auto_1194888 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1194896 - SURFACE
      ?auto_1194897 - SURFACE
      ?auto_1194898 - SURFACE
      ?auto_1194900 - SURFACE
      ?auto_1194899 - SURFACE
      ?auto_1194901 - SURFACE
      ?auto_1194902 - SURFACE
      ?auto_1194903 - SURFACE
      ?auto_1194904 - SURFACE
    )
    :vars
    (
      ?auto_1194911 - HOIST
      ?auto_1194907 - PLACE
      ?auto_1194905 - PLACE
      ?auto_1194906 - HOIST
      ?auto_1194908 - SURFACE
      ?auto_1194909 - TRUCK
      ?auto_1194910 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194911 ?auto_1194907 ) ( IS-CRATE ?auto_1194904 ) ( not ( = ?auto_1194903 ?auto_1194904 ) ) ( not ( = ?auto_1194902 ?auto_1194903 ) ) ( not ( = ?auto_1194902 ?auto_1194904 ) ) ( not ( = ?auto_1194905 ?auto_1194907 ) ) ( HOIST-AT ?auto_1194906 ?auto_1194905 ) ( not ( = ?auto_1194911 ?auto_1194906 ) ) ( SURFACE-AT ?auto_1194904 ?auto_1194905 ) ( ON ?auto_1194904 ?auto_1194908 ) ( CLEAR ?auto_1194904 ) ( not ( = ?auto_1194903 ?auto_1194908 ) ) ( not ( = ?auto_1194904 ?auto_1194908 ) ) ( not ( = ?auto_1194902 ?auto_1194908 ) ) ( SURFACE-AT ?auto_1194902 ?auto_1194907 ) ( CLEAR ?auto_1194902 ) ( IS-CRATE ?auto_1194903 ) ( AVAILABLE ?auto_1194911 ) ( TRUCK-AT ?auto_1194909 ?auto_1194905 ) ( AVAILABLE ?auto_1194906 ) ( SURFACE-AT ?auto_1194903 ?auto_1194905 ) ( ON ?auto_1194903 ?auto_1194910 ) ( CLEAR ?auto_1194903 ) ( not ( = ?auto_1194903 ?auto_1194910 ) ) ( not ( = ?auto_1194904 ?auto_1194910 ) ) ( not ( = ?auto_1194902 ?auto_1194910 ) ) ( not ( = ?auto_1194908 ?auto_1194910 ) ) ( ON ?auto_1194897 ?auto_1194896 ) ( ON ?auto_1194898 ?auto_1194897 ) ( ON ?auto_1194900 ?auto_1194898 ) ( ON ?auto_1194899 ?auto_1194900 ) ( ON ?auto_1194901 ?auto_1194899 ) ( ON ?auto_1194902 ?auto_1194901 ) ( not ( = ?auto_1194896 ?auto_1194897 ) ) ( not ( = ?auto_1194896 ?auto_1194898 ) ) ( not ( = ?auto_1194896 ?auto_1194900 ) ) ( not ( = ?auto_1194896 ?auto_1194899 ) ) ( not ( = ?auto_1194896 ?auto_1194901 ) ) ( not ( = ?auto_1194896 ?auto_1194902 ) ) ( not ( = ?auto_1194896 ?auto_1194903 ) ) ( not ( = ?auto_1194896 ?auto_1194904 ) ) ( not ( = ?auto_1194896 ?auto_1194908 ) ) ( not ( = ?auto_1194896 ?auto_1194910 ) ) ( not ( = ?auto_1194897 ?auto_1194898 ) ) ( not ( = ?auto_1194897 ?auto_1194900 ) ) ( not ( = ?auto_1194897 ?auto_1194899 ) ) ( not ( = ?auto_1194897 ?auto_1194901 ) ) ( not ( = ?auto_1194897 ?auto_1194902 ) ) ( not ( = ?auto_1194897 ?auto_1194903 ) ) ( not ( = ?auto_1194897 ?auto_1194904 ) ) ( not ( = ?auto_1194897 ?auto_1194908 ) ) ( not ( = ?auto_1194897 ?auto_1194910 ) ) ( not ( = ?auto_1194898 ?auto_1194900 ) ) ( not ( = ?auto_1194898 ?auto_1194899 ) ) ( not ( = ?auto_1194898 ?auto_1194901 ) ) ( not ( = ?auto_1194898 ?auto_1194902 ) ) ( not ( = ?auto_1194898 ?auto_1194903 ) ) ( not ( = ?auto_1194898 ?auto_1194904 ) ) ( not ( = ?auto_1194898 ?auto_1194908 ) ) ( not ( = ?auto_1194898 ?auto_1194910 ) ) ( not ( = ?auto_1194900 ?auto_1194899 ) ) ( not ( = ?auto_1194900 ?auto_1194901 ) ) ( not ( = ?auto_1194900 ?auto_1194902 ) ) ( not ( = ?auto_1194900 ?auto_1194903 ) ) ( not ( = ?auto_1194900 ?auto_1194904 ) ) ( not ( = ?auto_1194900 ?auto_1194908 ) ) ( not ( = ?auto_1194900 ?auto_1194910 ) ) ( not ( = ?auto_1194899 ?auto_1194901 ) ) ( not ( = ?auto_1194899 ?auto_1194902 ) ) ( not ( = ?auto_1194899 ?auto_1194903 ) ) ( not ( = ?auto_1194899 ?auto_1194904 ) ) ( not ( = ?auto_1194899 ?auto_1194908 ) ) ( not ( = ?auto_1194899 ?auto_1194910 ) ) ( not ( = ?auto_1194901 ?auto_1194902 ) ) ( not ( = ?auto_1194901 ?auto_1194903 ) ) ( not ( = ?auto_1194901 ?auto_1194904 ) ) ( not ( = ?auto_1194901 ?auto_1194908 ) ) ( not ( = ?auto_1194901 ?auto_1194910 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194902 ?auto_1194903 ?auto_1194904 )
      ( MAKE-8CRATE-VERIFY ?auto_1194896 ?auto_1194897 ?auto_1194898 ?auto_1194900 ?auto_1194899 ?auto_1194901 ?auto_1194902 ?auto_1194903 ?auto_1194904 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1194912 - SURFACE
      ?auto_1194913 - SURFACE
      ?auto_1194914 - SURFACE
      ?auto_1194916 - SURFACE
      ?auto_1194915 - SURFACE
      ?auto_1194917 - SURFACE
      ?auto_1194918 - SURFACE
      ?auto_1194919 - SURFACE
      ?auto_1194920 - SURFACE
      ?auto_1194921 - SURFACE
    )
    :vars
    (
      ?auto_1194928 - HOIST
      ?auto_1194924 - PLACE
      ?auto_1194922 - PLACE
      ?auto_1194923 - HOIST
      ?auto_1194925 - SURFACE
      ?auto_1194926 - TRUCK
      ?auto_1194927 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194928 ?auto_1194924 ) ( IS-CRATE ?auto_1194921 ) ( not ( = ?auto_1194920 ?auto_1194921 ) ) ( not ( = ?auto_1194919 ?auto_1194920 ) ) ( not ( = ?auto_1194919 ?auto_1194921 ) ) ( not ( = ?auto_1194922 ?auto_1194924 ) ) ( HOIST-AT ?auto_1194923 ?auto_1194922 ) ( not ( = ?auto_1194928 ?auto_1194923 ) ) ( SURFACE-AT ?auto_1194921 ?auto_1194922 ) ( ON ?auto_1194921 ?auto_1194925 ) ( CLEAR ?auto_1194921 ) ( not ( = ?auto_1194920 ?auto_1194925 ) ) ( not ( = ?auto_1194921 ?auto_1194925 ) ) ( not ( = ?auto_1194919 ?auto_1194925 ) ) ( SURFACE-AT ?auto_1194919 ?auto_1194924 ) ( CLEAR ?auto_1194919 ) ( IS-CRATE ?auto_1194920 ) ( AVAILABLE ?auto_1194928 ) ( TRUCK-AT ?auto_1194926 ?auto_1194922 ) ( AVAILABLE ?auto_1194923 ) ( SURFACE-AT ?auto_1194920 ?auto_1194922 ) ( ON ?auto_1194920 ?auto_1194927 ) ( CLEAR ?auto_1194920 ) ( not ( = ?auto_1194920 ?auto_1194927 ) ) ( not ( = ?auto_1194921 ?auto_1194927 ) ) ( not ( = ?auto_1194919 ?auto_1194927 ) ) ( not ( = ?auto_1194925 ?auto_1194927 ) ) ( ON ?auto_1194913 ?auto_1194912 ) ( ON ?auto_1194914 ?auto_1194913 ) ( ON ?auto_1194916 ?auto_1194914 ) ( ON ?auto_1194915 ?auto_1194916 ) ( ON ?auto_1194917 ?auto_1194915 ) ( ON ?auto_1194918 ?auto_1194917 ) ( ON ?auto_1194919 ?auto_1194918 ) ( not ( = ?auto_1194912 ?auto_1194913 ) ) ( not ( = ?auto_1194912 ?auto_1194914 ) ) ( not ( = ?auto_1194912 ?auto_1194916 ) ) ( not ( = ?auto_1194912 ?auto_1194915 ) ) ( not ( = ?auto_1194912 ?auto_1194917 ) ) ( not ( = ?auto_1194912 ?auto_1194918 ) ) ( not ( = ?auto_1194912 ?auto_1194919 ) ) ( not ( = ?auto_1194912 ?auto_1194920 ) ) ( not ( = ?auto_1194912 ?auto_1194921 ) ) ( not ( = ?auto_1194912 ?auto_1194925 ) ) ( not ( = ?auto_1194912 ?auto_1194927 ) ) ( not ( = ?auto_1194913 ?auto_1194914 ) ) ( not ( = ?auto_1194913 ?auto_1194916 ) ) ( not ( = ?auto_1194913 ?auto_1194915 ) ) ( not ( = ?auto_1194913 ?auto_1194917 ) ) ( not ( = ?auto_1194913 ?auto_1194918 ) ) ( not ( = ?auto_1194913 ?auto_1194919 ) ) ( not ( = ?auto_1194913 ?auto_1194920 ) ) ( not ( = ?auto_1194913 ?auto_1194921 ) ) ( not ( = ?auto_1194913 ?auto_1194925 ) ) ( not ( = ?auto_1194913 ?auto_1194927 ) ) ( not ( = ?auto_1194914 ?auto_1194916 ) ) ( not ( = ?auto_1194914 ?auto_1194915 ) ) ( not ( = ?auto_1194914 ?auto_1194917 ) ) ( not ( = ?auto_1194914 ?auto_1194918 ) ) ( not ( = ?auto_1194914 ?auto_1194919 ) ) ( not ( = ?auto_1194914 ?auto_1194920 ) ) ( not ( = ?auto_1194914 ?auto_1194921 ) ) ( not ( = ?auto_1194914 ?auto_1194925 ) ) ( not ( = ?auto_1194914 ?auto_1194927 ) ) ( not ( = ?auto_1194916 ?auto_1194915 ) ) ( not ( = ?auto_1194916 ?auto_1194917 ) ) ( not ( = ?auto_1194916 ?auto_1194918 ) ) ( not ( = ?auto_1194916 ?auto_1194919 ) ) ( not ( = ?auto_1194916 ?auto_1194920 ) ) ( not ( = ?auto_1194916 ?auto_1194921 ) ) ( not ( = ?auto_1194916 ?auto_1194925 ) ) ( not ( = ?auto_1194916 ?auto_1194927 ) ) ( not ( = ?auto_1194915 ?auto_1194917 ) ) ( not ( = ?auto_1194915 ?auto_1194918 ) ) ( not ( = ?auto_1194915 ?auto_1194919 ) ) ( not ( = ?auto_1194915 ?auto_1194920 ) ) ( not ( = ?auto_1194915 ?auto_1194921 ) ) ( not ( = ?auto_1194915 ?auto_1194925 ) ) ( not ( = ?auto_1194915 ?auto_1194927 ) ) ( not ( = ?auto_1194917 ?auto_1194918 ) ) ( not ( = ?auto_1194917 ?auto_1194919 ) ) ( not ( = ?auto_1194917 ?auto_1194920 ) ) ( not ( = ?auto_1194917 ?auto_1194921 ) ) ( not ( = ?auto_1194917 ?auto_1194925 ) ) ( not ( = ?auto_1194917 ?auto_1194927 ) ) ( not ( = ?auto_1194918 ?auto_1194919 ) ) ( not ( = ?auto_1194918 ?auto_1194920 ) ) ( not ( = ?auto_1194918 ?auto_1194921 ) ) ( not ( = ?auto_1194918 ?auto_1194925 ) ) ( not ( = ?auto_1194918 ?auto_1194927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194919 ?auto_1194920 ?auto_1194921 )
      ( MAKE-9CRATE-VERIFY ?auto_1194912 ?auto_1194913 ?auto_1194914 ?auto_1194916 ?auto_1194915 ?auto_1194917 ?auto_1194918 ?auto_1194919 ?auto_1194920 ?auto_1194921 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1194929 - SURFACE
      ?auto_1194930 - SURFACE
      ?auto_1194931 - SURFACE
      ?auto_1194933 - SURFACE
      ?auto_1194932 - SURFACE
      ?auto_1194934 - SURFACE
      ?auto_1194935 - SURFACE
      ?auto_1194936 - SURFACE
      ?auto_1194937 - SURFACE
      ?auto_1194938 - SURFACE
      ?auto_1194939 - SURFACE
    )
    :vars
    (
      ?auto_1194946 - HOIST
      ?auto_1194942 - PLACE
      ?auto_1194940 - PLACE
      ?auto_1194941 - HOIST
      ?auto_1194943 - SURFACE
      ?auto_1194944 - TRUCK
      ?auto_1194945 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194946 ?auto_1194942 ) ( IS-CRATE ?auto_1194939 ) ( not ( = ?auto_1194938 ?auto_1194939 ) ) ( not ( = ?auto_1194937 ?auto_1194938 ) ) ( not ( = ?auto_1194937 ?auto_1194939 ) ) ( not ( = ?auto_1194940 ?auto_1194942 ) ) ( HOIST-AT ?auto_1194941 ?auto_1194940 ) ( not ( = ?auto_1194946 ?auto_1194941 ) ) ( SURFACE-AT ?auto_1194939 ?auto_1194940 ) ( ON ?auto_1194939 ?auto_1194943 ) ( CLEAR ?auto_1194939 ) ( not ( = ?auto_1194938 ?auto_1194943 ) ) ( not ( = ?auto_1194939 ?auto_1194943 ) ) ( not ( = ?auto_1194937 ?auto_1194943 ) ) ( SURFACE-AT ?auto_1194937 ?auto_1194942 ) ( CLEAR ?auto_1194937 ) ( IS-CRATE ?auto_1194938 ) ( AVAILABLE ?auto_1194946 ) ( TRUCK-AT ?auto_1194944 ?auto_1194940 ) ( AVAILABLE ?auto_1194941 ) ( SURFACE-AT ?auto_1194938 ?auto_1194940 ) ( ON ?auto_1194938 ?auto_1194945 ) ( CLEAR ?auto_1194938 ) ( not ( = ?auto_1194938 ?auto_1194945 ) ) ( not ( = ?auto_1194939 ?auto_1194945 ) ) ( not ( = ?auto_1194937 ?auto_1194945 ) ) ( not ( = ?auto_1194943 ?auto_1194945 ) ) ( ON ?auto_1194930 ?auto_1194929 ) ( ON ?auto_1194931 ?auto_1194930 ) ( ON ?auto_1194933 ?auto_1194931 ) ( ON ?auto_1194932 ?auto_1194933 ) ( ON ?auto_1194934 ?auto_1194932 ) ( ON ?auto_1194935 ?auto_1194934 ) ( ON ?auto_1194936 ?auto_1194935 ) ( ON ?auto_1194937 ?auto_1194936 ) ( not ( = ?auto_1194929 ?auto_1194930 ) ) ( not ( = ?auto_1194929 ?auto_1194931 ) ) ( not ( = ?auto_1194929 ?auto_1194933 ) ) ( not ( = ?auto_1194929 ?auto_1194932 ) ) ( not ( = ?auto_1194929 ?auto_1194934 ) ) ( not ( = ?auto_1194929 ?auto_1194935 ) ) ( not ( = ?auto_1194929 ?auto_1194936 ) ) ( not ( = ?auto_1194929 ?auto_1194937 ) ) ( not ( = ?auto_1194929 ?auto_1194938 ) ) ( not ( = ?auto_1194929 ?auto_1194939 ) ) ( not ( = ?auto_1194929 ?auto_1194943 ) ) ( not ( = ?auto_1194929 ?auto_1194945 ) ) ( not ( = ?auto_1194930 ?auto_1194931 ) ) ( not ( = ?auto_1194930 ?auto_1194933 ) ) ( not ( = ?auto_1194930 ?auto_1194932 ) ) ( not ( = ?auto_1194930 ?auto_1194934 ) ) ( not ( = ?auto_1194930 ?auto_1194935 ) ) ( not ( = ?auto_1194930 ?auto_1194936 ) ) ( not ( = ?auto_1194930 ?auto_1194937 ) ) ( not ( = ?auto_1194930 ?auto_1194938 ) ) ( not ( = ?auto_1194930 ?auto_1194939 ) ) ( not ( = ?auto_1194930 ?auto_1194943 ) ) ( not ( = ?auto_1194930 ?auto_1194945 ) ) ( not ( = ?auto_1194931 ?auto_1194933 ) ) ( not ( = ?auto_1194931 ?auto_1194932 ) ) ( not ( = ?auto_1194931 ?auto_1194934 ) ) ( not ( = ?auto_1194931 ?auto_1194935 ) ) ( not ( = ?auto_1194931 ?auto_1194936 ) ) ( not ( = ?auto_1194931 ?auto_1194937 ) ) ( not ( = ?auto_1194931 ?auto_1194938 ) ) ( not ( = ?auto_1194931 ?auto_1194939 ) ) ( not ( = ?auto_1194931 ?auto_1194943 ) ) ( not ( = ?auto_1194931 ?auto_1194945 ) ) ( not ( = ?auto_1194933 ?auto_1194932 ) ) ( not ( = ?auto_1194933 ?auto_1194934 ) ) ( not ( = ?auto_1194933 ?auto_1194935 ) ) ( not ( = ?auto_1194933 ?auto_1194936 ) ) ( not ( = ?auto_1194933 ?auto_1194937 ) ) ( not ( = ?auto_1194933 ?auto_1194938 ) ) ( not ( = ?auto_1194933 ?auto_1194939 ) ) ( not ( = ?auto_1194933 ?auto_1194943 ) ) ( not ( = ?auto_1194933 ?auto_1194945 ) ) ( not ( = ?auto_1194932 ?auto_1194934 ) ) ( not ( = ?auto_1194932 ?auto_1194935 ) ) ( not ( = ?auto_1194932 ?auto_1194936 ) ) ( not ( = ?auto_1194932 ?auto_1194937 ) ) ( not ( = ?auto_1194932 ?auto_1194938 ) ) ( not ( = ?auto_1194932 ?auto_1194939 ) ) ( not ( = ?auto_1194932 ?auto_1194943 ) ) ( not ( = ?auto_1194932 ?auto_1194945 ) ) ( not ( = ?auto_1194934 ?auto_1194935 ) ) ( not ( = ?auto_1194934 ?auto_1194936 ) ) ( not ( = ?auto_1194934 ?auto_1194937 ) ) ( not ( = ?auto_1194934 ?auto_1194938 ) ) ( not ( = ?auto_1194934 ?auto_1194939 ) ) ( not ( = ?auto_1194934 ?auto_1194943 ) ) ( not ( = ?auto_1194934 ?auto_1194945 ) ) ( not ( = ?auto_1194935 ?auto_1194936 ) ) ( not ( = ?auto_1194935 ?auto_1194937 ) ) ( not ( = ?auto_1194935 ?auto_1194938 ) ) ( not ( = ?auto_1194935 ?auto_1194939 ) ) ( not ( = ?auto_1194935 ?auto_1194943 ) ) ( not ( = ?auto_1194935 ?auto_1194945 ) ) ( not ( = ?auto_1194936 ?auto_1194937 ) ) ( not ( = ?auto_1194936 ?auto_1194938 ) ) ( not ( = ?auto_1194936 ?auto_1194939 ) ) ( not ( = ?auto_1194936 ?auto_1194943 ) ) ( not ( = ?auto_1194936 ?auto_1194945 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194937 ?auto_1194938 ?auto_1194939 )
      ( MAKE-10CRATE-VERIFY ?auto_1194929 ?auto_1194930 ?auto_1194931 ?auto_1194933 ?auto_1194932 ?auto_1194934 ?auto_1194935 ?auto_1194936 ?auto_1194937 ?auto_1194938 ?auto_1194939 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1194947 - SURFACE
      ?auto_1194948 - SURFACE
    )
    :vars
    (
      ?auto_1194956 - HOIST
      ?auto_1194951 - PLACE
      ?auto_1194953 - SURFACE
      ?auto_1194949 - PLACE
      ?auto_1194950 - HOIST
      ?auto_1194952 - SURFACE
      ?auto_1194955 - SURFACE
      ?auto_1194954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194956 ?auto_1194951 ) ( IS-CRATE ?auto_1194948 ) ( not ( = ?auto_1194947 ?auto_1194948 ) ) ( not ( = ?auto_1194953 ?auto_1194947 ) ) ( not ( = ?auto_1194953 ?auto_1194948 ) ) ( not ( = ?auto_1194949 ?auto_1194951 ) ) ( HOIST-AT ?auto_1194950 ?auto_1194949 ) ( not ( = ?auto_1194956 ?auto_1194950 ) ) ( SURFACE-AT ?auto_1194948 ?auto_1194949 ) ( ON ?auto_1194948 ?auto_1194952 ) ( CLEAR ?auto_1194948 ) ( not ( = ?auto_1194947 ?auto_1194952 ) ) ( not ( = ?auto_1194948 ?auto_1194952 ) ) ( not ( = ?auto_1194953 ?auto_1194952 ) ) ( SURFACE-AT ?auto_1194953 ?auto_1194951 ) ( CLEAR ?auto_1194953 ) ( IS-CRATE ?auto_1194947 ) ( AVAILABLE ?auto_1194956 ) ( AVAILABLE ?auto_1194950 ) ( SURFACE-AT ?auto_1194947 ?auto_1194949 ) ( ON ?auto_1194947 ?auto_1194955 ) ( CLEAR ?auto_1194947 ) ( not ( = ?auto_1194947 ?auto_1194955 ) ) ( not ( = ?auto_1194948 ?auto_1194955 ) ) ( not ( = ?auto_1194953 ?auto_1194955 ) ) ( not ( = ?auto_1194952 ?auto_1194955 ) ) ( TRUCK-AT ?auto_1194954 ?auto_1194951 ) )
    :subtasks
    ( ( !DRIVE ?auto_1194954 ?auto_1194951 ?auto_1194949 )
      ( MAKE-2CRATE ?auto_1194953 ?auto_1194947 ?auto_1194948 )
      ( MAKE-1CRATE-VERIFY ?auto_1194947 ?auto_1194948 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1194957 - SURFACE
      ?auto_1194958 - SURFACE
      ?auto_1194959 - SURFACE
    )
    :vars
    (
      ?auto_1194963 - HOIST
      ?auto_1194966 - PLACE
      ?auto_1194961 - PLACE
      ?auto_1194964 - HOIST
      ?auto_1194965 - SURFACE
      ?auto_1194962 - SURFACE
      ?auto_1194960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194963 ?auto_1194966 ) ( IS-CRATE ?auto_1194959 ) ( not ( = ?auto_1194958 ?auto_1194959 ) ) ( not ( = ?auto_1194957 ?auto_1194958 ) ) ( not ( = ?auto_1194957 ?auto_1194959 ) ) ( not ( = ?auto_1194961 ?auto_1194966 ) ) ( HOIST-AT ?auto_1194964 ?auto_1194961 ) ( not ( = ?auto_1194963 ?auto_1194964 ) ) ( SURFACE-AT ?auto_1194959 ?auto_1194961 ) ( ON ?auto_1194959 ?auto_1194965 ) ( CLEAR ?auto_1194959 ) ( not ( = ?auto_1194958 ?auto_1194965 ) ) ( not ( = ?auto_1194959 ?auto_1194965 ) ) ( not ( = ?auto_1194957 ?auto_1194965 ) ) ( SURFACE-AT ?auto_1194957 ?auto_1194966 ) ( CLEAR ?auto_1194957 ) ( IS-CRATE ?auto_1194958 ) ( AVAILABLE ?auto_1194963 ) ( AVAILABLE ?auto_1194964 ) ( SURFACE-AT ?auto_1194958 ?auto_1194961 ) ( ON ?auto_1194958 ?auto_1194962 ) ( CLEAR ?auto_1194958 ) ( not ( = ?auto_1194958 ?auto_1194962 ) ) ( not ( = ?auto_1194959 ?auto_1194962 ) ) ( not ( = ?auto_1194957 ?auto_1194962 ) ) ( not ( = ?auto_1194965 ?auto_1194962 ) ) ( TRUCK-AT ?auto_1194960 ?auto_1194966 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1194958 ?auto_1194959 )
      ( MAKE-2CRATE-VERIFY ?auto_1194957 ?auto_1194958 ?auto_1194959 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1194967 - SURFACE
      ?auto_1194968 - SURFACE
      ?auto_1194969 - SURFACE
      ?auto_1194970 - SURFACE
    )
    :vars
    (
      ?auto_1194977 - HOIST
      ?auto_1194974 - PLACE
      ?auto_1194972 - PLACE
      ?auto_1194975 - HOIST
      ?auto_1194976 - SURFACE
      ?auto_1194971 - SURFACE
      ?auto_1194973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194977 ?auto_1194974 ) ( IS-CRATE ?auto_1194970 ) ( not ( = ?auto_1194969 ?auto_1194970 ) ) ( not ( = ?auto_1194968 ?auto_1194969 ) ) ( not ( = ?auto_1194968 ?auto_1194970 ) ) ( not ( = ?auto_1194972 ?auto_1194974 ) ) ( HOIST-AT ?auto_1194975 ?auto_1194972 ) ( not ( = ?auto_1194977 ?auto_1194975 ) ) ( SURFACE-AT ?auto_1194970 ?auto_1194972 ) ( ON ?auto_1194970 ?auto_1194976 ) ( CLEAR ?auto_1194970 ) ( not ( = ?auto_1194969 ?auto_1194976 ) ) ( not ( = ?auto_1194970 ?auto_1194976 ) ) ( not ( = ?auto_1194968 ?auto_1194976 ) ) ( SURFACE-AT ?auto_1194968 ?auto_1194974 ) ( CLEAR ?auto_1194968 ) ( IS-CRATE ?auto_1194969 ) ( AVAILABLE ?auto_1194977 ) ( AVAILABLE ?auto_1194975 ) ( SURFACE-AT ?auto_1194969 ?auto_1194972 ) ( ON ?auto_1194969 ?auto_1194971 ) ( CLEAR ?auto_1194969 ) ( not ( = ?auto_1194969 ?auto_1194971 ) ) ( not ( = ?auto_1194970 ?auto_1194971 ) ) ( not ( = ?auto_1194968 ?auto_1194971 ) ) ( not ( = ?auto_1194976 ?auto_1194971 ) ) ( TRUCK-AT ?auto_1194973 ?auto_1194974 ) ( ON ?auto_1194968 ?auto_1194967 ) ( not ( = ?auto_1194967 ?auto_1194968 ) ) ( not ( = ?auto_1194967 ?auto_1194969 ) ) ( not ( = ?auto_1194967 ?auto_1194970 ) ) ( not ( = ?auto_1194967 ?auto_1194976 ) ) ( not ( = ?auto_1194967 ?auto_1194971 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194968 ?auto_1194969 ?auto_1194970 )
      ( MAKE-3CRATE-VERIFY ?auto_1194967 ?auto_1194968 ?auto_1194969 ?auto_1194970 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1194978 - SURFACE
      ?auto_1194979 - SURFACE
      ?auto_1194980 - SURFACE
      ?auto_1194982 - SURFACE
      ?auto_1194981 - SURFACE
    )
    :vars
    (
      ?auto_1194989 - HOIST
      ?auto_1194986 - PLACE
      ?auto_1194984 - PLACE
      ?auto_1194987 - HOIST
      ?auto_1194988 - SURFACE
      ?auto_1194983 - SURFACE
      ?auto_1194985 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194989 ?auto_1194986 ) ( IS-CRATE ?auto_1194981 ) ( not ( = ?auto_1194982 ?auto_1194981 ) ) ( not ( = ?auto_1194980 ?auto_1194982 ) ) ( not ( = ?auto_1194980 ?auto_1194981 ) ) ( not ( = ?auto_1194984 ?auto_1194986 ) ) ( HOIST-AT ?auto_1194987 ?auto_1194984 ) ( not ( = ?auto_1194989 ?auto_1194987 ) ) ( SURFACE-AT ?auto_1194981 ?auto_1194984 ) ( ON ?auto_1194981 ?auto_1194988 ) ( CLEAR ?auto_1194981 ) ( not ( = ?auto_1194982 ?auto_1194988 ) ) ( not ( = ?auto_1194981 ?auto_1194988 ) ) ( not ( = ?auto_1194980 ?auto_1194988 ) ) ( SURFACE-AT ?auto_1194980 ?auto_1194986 ) ( CLEAR ?auto_1194980 ) ( IS-CRATE ?auto_1194982 ) ( AVAILABLE ?auto_1194989 ) ( AVAILABLE ?auto_1194987 ) ( SURFACE-AT ?auto_1194982 ?auto_1194984 ) ( ON ?auto_1194982 ?auto_1194983 ) ( CLEAR ?auto_1194982 ) ( not ( = ?auto_1194982 ?auto_1194983 ) ) ( not ( = ?auto_1194981 ?auto_1194983 ) ) ( not ( = ?auto_1194980 ?auto_1194983 ) ) ( not ( = ?auto_1194988 ?auto_1194983 ) ) ( TRUCK-AT ?auto_1194985 ?auto_1194986 ) ( ON ?auto_1194979 ?auto_1194978 ) ( ON ?auto_1194980 ?auto_1194979 ) ( not ( = ?auto_1194978 ?auto_1194979 ) ) ( not ( = ?auto_1194978 ?auto_1194980 ) ) ( not ( = ?auto_1194978 ?auto_1194982 ) ) ( not ( = ?auto_1194978 ?auto_1194981 ) ) ( not ( = ?auto_1194978 ?auto_1194988 ) ) ( not ( = ?auto_1194978 ?auto_1194983 ) ) ( not ( = ?auto_1194979 ?auto_1194980 ) ) ( not ( = ?auto_1194979 ?auto_1194982 ) ) ( not ( = ?auto_1194979 ?auto_1194981 ) ) ( not ( = ?auto_1194979 ?auto_1194988 ) ) ( not ( = ?auto_1194979 ?auto_1194983 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194980 ?auto_1194982 ?auto_1194981 )
      ( MAKE-4CRATE-VERIFY ?auto_1194978 ?auto_1194979 ?auto_1194980 ?auto_1194982 ?auto_1194981 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1194990 - SURFACE
      ?auto_1194991 - SURFACE
      ?auto_1194992 - SURFACE
      ?auto_1194994 - SURFACE
      ?auto_1194993 - SURFACE
      ?auto_1194995 - SURFACE
    )
    :vars
    (
      ?auto_1195002 - HOIST
      ?auto_1194999 - PLACE
      ?auto_1194997 - PLACE
      ?auto_1195000 - HOIST
      ?auto_1195001 - SURFACE
      ?auto_1194996 - SURFACE
      ?auto_1194998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195002 ?auto_1194999 ) ( IS-CRATE ?auto_1194995 ) ( not ( = ?auto_1194993 ?auto_1194995 ) ) ( not ( = ?auto_1194994 ?auto_1194993 ) ) ( not ( = ?auto_1194994 ?auto_1194995 ) ) ( not ( = ?auto_1194997 ?auto_1194999 ) ) ( HOIST-AT ?auto_1195000 ?auto_1194997 ) ( not ( = ?auto_1195002 ?auto_1195000 ) ) ( SURFACE-AT ?auto_1194995 ?auto_1194997 ) ( ON ?auto_1194995 ?auto_1195001 ) ( CLEAR ?auto_1194995 ) ( not ( = ?auto_1194993 ?auto_1195001 ) ) ( not ( = ?auto_1194995 ?auto_1195001 ) ) ( not ( = ?auto_1194994 ?auto_1195001 ) ) ( SURFACE-AT ?auto_1194994 ?auto_1194999 ) ( CLEAR ?auto_1194994 ) ( IS-CRATE ?auto_1194993 ) ( AVAILABLE ?auto_1195002 ) ( AVAILABLE ?auto_1195000 ) ( SURFACE-AT ?auto_1194993 ?auto_1194997 ) ( ON ?auto_1194993 ?auto_1194996 ) ( CLEAR ?auto_1194993 ) ( not ( = ?auto_1194993 ?auto_1194996 ) ) ( not ( = ?auto_1194995 ?auto_1194996 ) ) ( not ( = ?auto_1194994 ?auto_1194996 ) ) ( not ( = ?auto_1195001 ?auto_1194996 ) ) ( TRUCK-AT ?auto_1194998 ?auto_1194999 ) ( ON ?auto_1194991 ?auto_1194990 ) ( ON ?auto_1194992 ?auto_1194991 ) ( ON ?auto_1194994 ?auto_1194992 ) ( not ( = ?auto_1194990 ?auto_1194991 ) ) ( not ( = ?auto_1194990 ?auto_1194992 ) ) ( not ( = ?auto_1194990 ?auto_1194994 ) ) ( not ( = ?auto_1194990 ?auto_1194993 ) ) ( not ( = ?auto_1194990 ?auto_1194995 ) ) ( not ( = ?auto_1194990 ?auto_1195001 ) ) ( not ( = ?auto_1194990 ?auto_1194996 ) ) ( not ( = ?auto_1194991 ?auto_1194992 ) ) ( not ( = ?auto_1194991 ?auto_1194994 ) ) ( not ( = ?auto_1194991 ?auto_1194993 ) ) ( not ( = ?auto_1194991 ?auto_1194995 ) ) ( not ( = ?auto_1194991 ?auto_1195001 ) ) ( not ( = ?auto_1194991 ?auto_1194996 ) ) ( not ( = ?auto_1194992 ?auto_1194994 ) ) ( not ( = ?auto_1194992 ?auto_1194993 ) ) ( not ( = ?auto_1194992 ?auto_1194995 ) ) ( not ( = ?auto_1194992 ?auto_1195001 ) ) ( not ( = ?auto_1194992 ?auto_1194996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194994 ?auto_1194993 ?auto_1194995 )
      ( MAKE-5CRATE-VERIFY ?auto_1194990 ?auto_1194991 ?auto_1194992 ?auto_1194994 ?auto_1194993 ?auto_1194995 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1195003 - SURFACE
      ?auto_1195004 - SURFACE
      ?auto_1195005 - SURFACE
      ?auto_1195007 - SURFACE
      ?auto_1195006 - SURFACE
      ?auto_1195008 - SURFACE
      ?auto_1195009 - SURFACE
    )
    :vars
    (
      ?auto_1195016 - HOIST
      ?auto_1195013 - PLACE
      ?auto_1195011 - PLACE
      ?auto_1195014 - HOIST
      ?auto_1195015 - SURFACE
      ?auto_1195010 - SURFACE
      ?auto_1195012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195016 ?auto_1195013 ) ( IS-CRATE ?auto_1195009 ) ( not ( = ?auto_1195008 ?auto_1195009 ) ) ( not ( = ?auto_1195006 ?auto_1195008 ) ) ( not ( = ?auto_1195006 ?auto_1195009 ) ) ( not ( = ?auto_1195011 ?auto_1195013 ) ) ( HOIST-AT ?auto_1195014 ?auto_1195011 ) ( not ( = ?auto_1195016 ?auto_1195014 ) ) ( SURFACE-AT ?auto_1195009 ?auto_1195011 ) ( ON ?auto_1195009 ?auto_1195015 ) ( CLEAR ?auto_1195009 ) ( not ( = ?auto_1195008 ?auto_1195015 ) ) ( not ( = ?auto_1195009 ?auto_1195015 ) ) ( not ( = ?auto_1195006 ?auto_1195015 ) ) ( SURFACE-AT ?auto_1195006 ?auto_1195013 ) ( CLEAR ?auto_1195006 ) ( IS-CRATE ?auto_1195008 ) ( AVAILABLE ?auto_1195016 ) ( AVAILABLE ?auto_1195014 ) ( SURFACE-AT ?auto_1195008 ?auto_1195011 ) ( ON ?auto_1195008 ?auto_1195010 ) ( CLEAR ?auto_1195008 ) ( not ( = ?auto_1195008 ?auto_1195010 ) ) ( not ( = ?auto_1195009 ?auto_1195010 ) ) ( not ( = ?auto_1195006 ?auto_1195010 ) ) ( not ( = ?auto_1195015 ?auto_1195010 ) ) ( TRUCK-AT ?auto_1195012 ?auto_1195013 ) ( ON ?auto_1195004 ?auto_1195003 ) ( ON ?auto_1195005 ?auto_1195004 ) ( ON ?auto_1195007 ?auto_1195005 ) ( ON ?auto_1195006 ?auto_1195007 ) ( not ( = ?auto_1195003 ?auto_1195004 ) ) ( not ( = ?auto_1195003 ?auto_1195005 ) ) ( not ( = ?auto_1195003 ?auto_1195007 ) ) ( not ( = ?auto_1195003 ?auto_1195006 ) ) ( not ( = ?auto_1195003 ?auto_1195008 ) ) ( not ( = ?auto_1195003 ?auto_1195009 ) ) ( not ( = ?auto_1195003 ?auto_1195015 ) ) ( not ( = ?auto_1195003 ?auto_1195010 ) ) ( not ( = ?auto_1195004 ?auto_1195005 ) ) ( not ( = ?auto_1195004 ?auto_1195007 ) ) ( not ( = ?auto_1195004 ?auto_1195006 ) ) ( not ( = ?auto_1195004 ?auto_1195008 ) ) ( not ( = ?auto_1195004 ?auto_1195009 ) ) ( not ( = ?auto_1195004 ?auto_1195015 ) ) ( not ( = ?auto_1195004 ?auto_1195010 ) ) ( not ( = ?auto_1195005 ?auto_1195007 ) ) ( not ( = ?auto_1195005 ?auto_1195006 ) ) ( not ( = ?auto_1195005 ?auto_1195008 ) ) ( not ( = ?auto_1195005 ?auto_1195009 ) ) ( not ( = ?auto_1195005 ?auto_1195015 ) ) ( not ( = ?auto_1195005 ?auto_1195010 ) ) ( not ( = ?auto_1195007 ?auto_1195006 ) ) ( not ( = ?auto_1195007 ?auto_1195008 ) ) ( not ( = ?auto_1195007 ?auto_1195009 ) ) ( not ( = ?auto_1195007 ?auto_1195015 ) ) ( not ( = ?auto_1195007 ?auto_1195010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195006 ?auto_1195008 ?auto_1195009 )
      ( MAKE-6CRATE-VERIFY ?auto_1195003 ?auto_1195004 ?auto_1195005 ?auto_1195007 ?auto_1195006 ?auto_1195008 ?auto_1195009 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1195017 - SURFACE
      ?auto_1195018 - SURFACE
      ?auto_1195019 - SURFACE
      ?auto_1195021 - SURFACE
      ?auto_1195020 - SURFACE
      ?auto_1195022 - SURFACE
      ?auto_1195023 - SURFACE
      ?auto_1195024 - SURFACE
    )
    :vars
    (
      ?auto_1195031 - HOIST
      ?auto_1195028 - PLACE
      ?auto_1195026 - PLACE
      ?auto_1195029 - HOIST
      ?auto_1195030 - SURFACE
      ?auto_1195025 - SURFACE
      ?auto_1195027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195031 ?auto_1195028 ) ( IS-CRATE ?auto_1195024 ) ( not ( = ?auto_1195023 ?auto_1195024 ) ) ( not ( = ?auto_1195022 ?auto_1195023 ) ) ( not ( = ?auto_1195022 ?auto_1195024 ) ) ( not ( = ?auto_1195026 ?auto_1195028 ) ) ( HOIST-AT ?auto_1195029 ?auto_1195026 ) ( not ( = ?auto_1195031 ?auto_1195029 ) ) ( SURFACE-AT ?auto_1195024 ?auto_1195026 ) ( ON ?auto_1195024 ?auto_1195030 ) ( CLEAR ?auto_1195024 ) ( not ( = ?auto_1195023 ?auto_1195030 ) ) ( not ( = ?auto_1195024 ?auto_1195030 ) ) ( not ( = ?auto_1195022 ?auto_1195030 ) ) ( SURFACE-AT ?auto_1195022 ?auto_1195028 ) ( CLEAR ?auto_1195022 ) ( IS-CRATE ?auto_1195023 ) ( AVAILABLE ?auto_1195031 ) ( AVAILABLE ?auto_1195029 ) ( SURFACE-AT ?auto_1195023 ?auto_1195026 ) ( ON ?auto_1195023 ?auto_1195025 ) ( CLEAR ?auto_1195023 ) ( not ( = ?auto_1195023 ?auto_1195025 ) ) ( not ( = ?auto_1195024 ?auto_1195025 ) ) ( not ( = ?auto_1195022 ?auto_1195025 ) ) ( not ( = ?auto_1195030 ?auto_1195025 ) ) ( TRUCK-AT ?auto_1195027 ?auto_1195028 ) ( ON ?auto_1195018 ?auto_1195017 ) ( ON ?auto_1195019 ?auto_1195018 ) ( ON ?auto_1195021 ?auto_1195019 ) ( ON ?auto_1195020 ?auto_1195021 ) ( ON ?auto_1195022 ?auto_1195020 ) ( not ( = ?auto_1195017 ?auto_1195018 ) ) ( not ( = ?auto_1195017 ?auto_1195019 ) ) ( not ( = ?auto_1195017 ?auto_1195021 ) ) ( not ( = ?auto_1195017 ?auto_1195020 ) ) ( not ( = ?auto_1195017 ?auto_1195022 ) ) ( not ( = ?auto_1195017 ?auto_1195023 ) ) ( not ( = ?auto_1195017 ?auto_1195024 ) ) ( not ( = ?auto_1195017 ?auto_1195030 ) ) ( not ( = ?auto_1195017 ?auto_1195025 ) ) ( not ( = ?auto_1195018 ?auto_1195019 ) ) ( not ( = ?auto_1195018 ?auto_1195021 ) ) ( not ( = ?auto_1195018 ?auto_1195020 ) ) ( not ( = ?auto_1195018 ?auto_1195022 ) ) ( not ( = ?auto_1195018 ?auto_1195023 ) ) ( not ( = ?auto_1195018 ?auto_1195024 ) ) ( not ( = ?auto_1195018 ?auto_1195030 ) ) ( not ( = ?auto_1195018 ?auto_1195025 ) ) ( not ( = ?auto_1195019 ?auto_1195021 ) ) ( not ( = ?auto_1195019 ?auto_1195020 ) ) ( not ( = ?auto_1195019 ?auto_1195022 ) ) ( not ( = ?auto_1195019 ?auto_1195023 ) ) ( not ( = ?auto_1195019 ?auto_1195024 ) ) ( not ( = ?auto_1195019 ?auto_1195030 ) ) ( not ( = ?auto_1195019 ?auto_1195025 ) ) ( not ( = ?auto_1195021 ?auto_1195020 ) ) ( not ( = ?auto_1195021 ?auto_1195022 ) ) ( not ( = ?auto_1195021 ?auto_1195023 ) ) ( not ( = ?auto_1195021 ?auto_1195024 ) ) ( not ( = ?auto_1195021 ?auto_1195030 ) ) ( not ( = ?auto_1195021 ?auto_1195025 ) ) ( not ( = ?auto_1195020 ?auto_1195022 ) ) ( not ( = ?auto_1195020 ?auto_1195023 ) ) ( not ( = ?auto_1195020 ?auto_1195024 ) ) ( not ( = ?auto_1195020 ?auto_1195030 ) ) ( not ( = ?auto_1195020 ?auto_1195025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195022 ?auto_1195023 ?auto_1195024 )
      ( MAKE-7CRATE-VERIFY ?auto_1195017 ?auto_1195018 ?auto_1195019 ?auto_1195021 ?auto_1195020 ?auto_1195022 ?auto_1195023 ?auto_1195024 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1195032 - SURFACE
      ?auto_1195033 - SURFACE
      ?auto_1195034 - SURFACE
      ?auto_1195036 - SURFACE
      ?auto_1195035 - SURFACE
      ?auto_1195037 - SURFACE
      ?auto_1195038 - SURFACE
      ?auto_1195039 - SURFACE
      ?auto_1195040 - SURFACE
    )
    :vars
    (
      ?auto_1195047 - HOIST
      ?auto_1195044 - PLACE
      ?auto_1195042 - PLACE
      ?auto_1195045 - HOIST
      ?auto_1195046 - SURFACE
      ?auto_1195041 - SURFACE
      ?auto_1195043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195047 ?auto_1195044 ) ( IS-CRATE ?auto_1195040 ) ( not ( = ?auto_1195039 ?auto_1195040 ) ) ( not ( = ?auto_1195038 ?auto_1195039 ) ) ( not ( = ?auto_1195038 ?auto_1195040 ) ) ( not ( = ?auto_1195042 ?auto_1195044 ) ) ( HOIST-AT ?auto_1195045 ?auto_1195042 ) ( not ( = ?auto_1195047 ?auto_1195045 ) ) ( SURFACE-AT ?auto_1195040 ?auto_1195042 ) ( ON ?auto_1195040 ?auto_1195046 ) ( CLEAR ?auto_1195040 ) ( not ( = ?auto_1195039 ?auto_1195046 ) ) ( not ( = ?auto_1195040 ?auto_1195046 ) ) ( not ( = ?auto_1195038 ?auto_1195046 ) ) ( SURFACE-AT ?auto_1195038 ?auto_1195044 ) ( CLEAR ?auto_1195038 ) ( IS-CRATE ?auto_1195039 ) ( AVAILABLE ?auto_1195047 ) ( AVAILABLE ?auto_1195045 ) ( SURFACE-AT ?auto_1195039 ?auto_1195042 ) ( ON ?auto_1195039 ?auto_1195041 ) ( CLEAR ?auto_1195039 ) ( not ( = ?auto_1195039 ?auto_1195041 ) ) ( not ( = ?auto_1195040 ?auto_1195041 ) ) ( not ( = ?auto_1195038 ?auto_1195041 ) ) ( not ( = ?auto_1195046 ?auto_1195041 ) ) ( TRUCK-AT ?auto_1195043 ?auto_1195044 ) ( ON ?auto_1195033 ?auto_1195032 ) ( ON ?auto_1195034 ?auto_1195033 ) ( ON ?auto_1195036 ?auto_1195034 ) ( ON ?auto_1195035 ?auto_1195036 ) ( ON ?auto_1195037 ?auto_1195035 ) ( ON ?auto_1195038 ?auto_1195037 ) ( not ( = ?auto_1195032 ?auto_1195033 ) ) ( not ( = ?auto_1195032 ?auto_1195034 ) ) ( not ( = ?auto_1195032 ?auto_1195036 ) ) ( not ( = ?auto_1195032 ?auto_1195035 ) ) ( not ( = ?auto_1195032 ?auto_1195037 ) ) ( not ( = ?auto_1195032 ?auto_1195038 ) ) ( not ( = ?auto_1195032 ?auto_1195039 ) ) ( not ( = ?auto_1195032 ?auto_1195040 ) ) ( not ( = ?auto_1195032 ?auto_1195046 ) ) ( not ( = ?auto_1195032 ?auto_1195041 ) ) ( not ( = ?auto_1195033 ?auto_1195034 ) ) ( not ( = ?auto_1195033 ?auto_1195036 ) ) ( not ( = ?auto_1195033 ?auto_1195035 ) ) ( not ( = ?auto_1195033 ?auto_1195037 ) ) ( not ( = ?auto_1195033 ?auto_1195038 ) ) ( not ( = ?auto_1195033 ?auto_1195039 ) ) ( not ( = ?auto_1195033 ?auto_1195040 ) ) ( not ( = ?auto_1195033 ?auto_1195046 ) ) ( not ( = ?auto_1195033 ?auto_1195041 ) ) ( not ( = ?auto_1195034 ?auto_1195036 ) ) ( not ( = ?auto_1195034 ?auto_1195035 ) ) ( not ( = ?auto_1195034 ?auto_1195037 ) ) ( not ( = ?auto_1195034 ?auto_1195038 ) ) ( not ( = ?auto_1195034 ?auto_1195039 ) ) ( not ( = ?auto_1195034 ?auto_1195040 ) ) ( not ( = ?auto_1195034 ?auto_1195046 ) ) ( not ( = ?auto_1195034 ?auto_1195041 ) ) ( not ( = ?auto_1195036 ?auto_1195035 ) ) ( not ( = ?auto_1195036 ?auto_1195037 ) ) ( not ( = ?auto_1195036 ?auto_1195038 ) ) ( not ( = ?auto_1195036 ?auto_1195039 ) ) ( not ( = ?auto_1195036 ?auto_1195040 ) ) ( not ( = ?auto_1195036 ?auto_1195046 ) ) ( not ( = ?auto_1195036 ?auto_1195041 ) ) ( not ( = ?auto_1195035 ?auto_1195037 ) ) ( not ( = ?auto_1195035 ?auto_1195038 ) ) ( not ( = ?auto_1195035 ?auto_1195039 ) ) ( not ( = ?auto_1195035 ?auto_1195040 ) ) ( not ( = ?auto_1195035 ?auto_1195046 ) ) ( not ( = ?auto_1195035 ?auto_1195041 ) ) ( not ( = ?auto_1195037 ?auto_1195038 ) ) ( not ( = ?auto_1195037 ?auto_1195039 ) ) ( not ( = ?auto_1195037 ?auto_1195040 ) ) ( not ( = ?auto_1195037 ?auto_1195046 ) ) ( not ( = ?auto_1195037 ?auto_1195041 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195038 ?auto_1195039 ?auto_1195040 )
      ( MAKE-8CRATE-VERIFY ?auto_1195032 ?auto_1195033 ?auto_1195034 ?auto_1195036 ?auto_1195035 ?auto_1195037 ?auto_1195038 ?auto_1195039 ?auto_1195040 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1195048 - SURFACE
      ?auto_1195049 - SURFACE
      ?auto_1195050 - SURFACE
      ?auto_1195052 - SURFACE
      ?auto_1195051 - SURFACE
      ?auto_1195053 - SURFACE
      ?auto_1195054 - SURFACE
      ?auto_1195055 - SURFACE
      ?auto_1195056 - SURFACE
      ?auto_1195057 - SURFACE
    )
    :vars
    (
      ?auto_1195064 - HOIST
      ?auto_1195061 - PLACE
      ?auto_1195059 - PLACE
      ?auto_1195062 - HOIST
      ?auto_1195063 - SURFACE
      ?auto_1195058 - SURFACE
      ?auto_1195060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195064 ?auto_1195061 ) ( IS-CRATE ?auto_1195057 ) ( not ( = ?auto_1195056 ?auto_1195057 ) ) ( not ( = ?auto_1195055 ?auto_1195056 ) ) ( not ( = ?auto_1195055 ?auto_1195057 ) ) ( not ( = ?auto_1195059 ?auto_1195061 ) ) ( HOIST-AT ?auto_1195062 ?auto_1195059 ) ( not ( = ?auto_1195064 ?auto_1195062 ) ) ( SURFACE-AT ?auto_1195057 ?auto_1195059 ) ( ON ?auto_1195057 ?auto_1195063 ) ( CLEAR ?auto_1195057 ) ( not ( = ?auto_1195056 ?auto_1195063 ) ) ( not ( = ?auto_1195057 ?auto_1195063 ) ) ( not ( = ?auto_1195055 ?auto_1195063 ) ) ( SURFACE-AT ?auto_1195055 ?auto_1195061 ) ( CLEAR ?auto_1195055 ) ( IS-CRATE ?auto_1195056 ) ( AVAILABLE ?auto_1195064 ) ( AVAILABLE ?auto_1195062 ) ( SURFACE-AT ?auto_1195056 ?auto_1195059 ) ( ON ?auto_1195056 ?auto_1195058 ) ( CLEAR ?auto_1195056 ) ( not ( = ?auto_1195056 ?auto_1195058 ) ) ( not ( = ?auto_1195057 ?auto_1195058 ) ) ( not ( = ?auto_1195055 ?auto_1195058 ) ) ( not ( = ?auto_1195063 ?auto_1195058 ) ) ( TRUCK-AT ?auto_1195060 ?auto_1195061 ) ( ON ?auto_1195049 ?auto_1195048 ) ( ON ?auto_1195050 ?auto_1195049 ) ( ON ?auto_1195052 ?auto_1195050 ) ( ON ?auto_1195051 ?auto_1195052 ) ( ON ?auto_1195053 ?auto_1195051 ) ( ON ?auto_1195054 ?auto_1195053 ) ( ON ?auto_1195055 ?auto_1195054 ) ( not ( = ?auto_1195048 ?auto_1195049 ) ) ( not ( = ?auto_1195048 ?auto_1195050 ) ) ( not ( = ?auto_1195048 ?auto_1195052 ) ) ( not ( = ?auto_1195048 ?auto_1195051 ) ) ( not ( = ?auto_1195048 ?auto_1195053 ) ) ( not ( = ?auto_1195048 ?auto_1195054 ) ) ( not ( = ?auto_1195048 ?auto_1195055 ) ) ( not ( = ?auto_1195048 ?auto_1195056 ) ) ( not ( = ?auto_1195048 ?auto_1195057 ) ) ( not ( = ?auto_1195048 ?auto_1195063 ) ) ( not ( = ?auto_1195048 ?auto_1195058 ) ) ( not ( = ?auto_1195049 ?auto_1195050 ) ) ( not ( = ?auto_1195049 ?auto_1195052 ) ) ( not ( = ?auto_1195049 ?auto_1195051 ) ) ( not ( = ?auto_1195049 ?auto_1195053 ) ) ( not ( = ?auto_1195049 ?auto_1195054 ) ) ( not ( = ?auto_1195049 ?auto_1195055 ) ) ( not ( = ?auto_1195049 ?auto_1195056 ) ) ( not ( = ?auto_1195049 ?auto_1195057 ) ) ( not ( = ?auto_1195049 ?auto_1195063 ) ) ( not ( = ?auto_1195049 ?auto_1195058 ) ) ( not ( = ?auto_1195050 ?auto_1195052 ) ) ( not ( = ?auto_1195050 ?auto_1195051 ) ) ( not ( = ?auto_1195050 ?auto_1195053 ) ) ( not ( = ?auto_1195050 ?auto_1195054 ) ) ( not ( = ?auto_1195050 ?auto_1195055 ) ) ( not ( = ?auto_1195050 ?auto_1195056 ) ) ( not ( = ?auto_1195050 ?auto_1195057 ) ) ( not ( = ?auto_1195050 ?auto_1195063 ) ) ( not ( = ?auto_1195050 ?auto_1195058 ) ) ( not ( = ?auto_1195052 ?auto_1195051 ) ) ( not ( = ?auto_1195052 ?auto_1195053 ) ) ( not ( = ?auto_1195052 ?auto_1195054 ) ) ( not ( = ?auto_1195052 ?auto_1195055 ) ) ( not ( = ?auto_1195052 ?auto_1195056 ) ) ( not ( = ?auto_1195052 ?auto_1195057 ) ) ( not ( = ?auto_1195052 ?auto_1195063 ) ) ( not ( = ?auto_1195052 ?auto_1195058 ) ) ( not ( = ?auto_1195051 ?auto_1195053 ) ) ( not ( = ?auto_1195051 ?auto_1195054 ) ) ( not ( = ?auto_1195051 ?auto_1195055 ) ) ( not ( = ?auto_1195051 ?auto_1195056 ) ) ( not ( = ?auto_1195051 ?auto_1195057 ) ) ( not ( = ?auto_1195051 ?auto_1195063 ) ) ( not ( = ?auto_1195051 ?auto_1195058 ) ) ( not ( = ?auto_1195053 ?auto_1195054 ) ) ( not ( = ?auto_1195053 ?auto_1195055 ) ) ( not ( = ?auto_1195053 ?auto_1195056 ) ) ( not ( = ?auto_1195053 ?auto_1195057 ) ) ( not ( = ?auto_1195053 ?auto_1195063 ) ) ( not ( = ?auto_1195053 ?auto_1195058 ) ) ( not ( = ?auto_1195054 ?auto_1195055 ) ) ( not ( = ?auto_1195054 ?auto_1195056 ) ) ( not ( = ?auto_1195054 ?auto_1195057 ) ) ( not ( = ?auto_1195054 ?auto_1195063 ) ) ( not ( = ?auto_1195054 ?auto_1195058 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195055 ?auto_1195056 ?auto_1195057 )
      ( MAKE-9CRATE-VERIFY ?auto_1195048 ?auto_1195049 ?auto_1195050 ?auto_1195052 ?auto_1195051 ?auto_1195053 ?auto_1195054 ?auto_1195055 ?auto_1195056 ?auto_1195057 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1195065 - SURFACE
      ?auto_1195066 - SURFACE
      ?auto_1195067 - SURFACE
      ?auto_1195069 - SURFACE
      ?auto_1195068 - SURFACE
      ?auto_1195070 - SURFACE
      ?auto_1195071 - SURFACE
      ?auto_1195072 - SURFACE
      ?auto_1195073 - SURFACE
      ?auto_1195074 - SURFACE
      ?auto_1195075 - SURFACE
    )
    :vars
    (
      ?auto_1195082 - HOIST
      ?auto_1195079 - PLACE
      ?auto_1195077 - PLACE
      ?auto_1195080 - HOIST
      ?auto_1195081 - SURFACE
      ?auto_1195076 - SURFACE
      ?auto_1195078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195082 ?auto_1195079 ) ( IS-CRATE ?auto_1195075 ) ( not ( = ?auto_1195074 ?auto_1195075 ) ) ( not ( = ?auto_1195073 ?auto_1195074 ) ) ( not ( = ?auto_1195073 ?auto_1195075 ) ) ( not ( = ?auto_1195077 ?auto_1195079 ) ) ( HOIST-AT ?auto_1195080 ?auto_1195077 ) ( not ( = ?auto_1195082 ?auto_1195080 ) ) ( SURFACE-AT ?auto_1195075 ?auto_1195077 ) ( ON ?auto_1195075 ?auto_1195081 ) ( CLEAR ?auto_1195075 ) ( not ( = ?auto_1195074 ?auto_1195081 ) ) ( not ( = ?auto_1195075 ?auto_1195081 ) ) ( not ( = ?auto_1195073 ?auto_1195081 ) ) ( SURFACE-AT ?auto_1195073 ?auto_1195079 ) ( CLEAR ?auto_1195073 ) ( IS-CRATE ?auto_1195074 ) ( AVAILABLE ?auto_1195082 ) ( AVAILABLE ?auto_1195080 ) ( SURFACE-AT ?auto_1195074 ?auto_1195077 ) ( ON ?auto_1195074 ?auto_1195076 ) ( CLEAR ?auto_1195074 ) ( not ( = ?auto_1195074 ?auto_1195076 ) ) ( not ( = ?auto_1195075 ?auto_1195076 ) ) ( not ( = ?auto_1195073 ?auto_1195076 ) ) ( not ( = ?auto_1195081 ?auto_1195076 ) ) ( TRUCK-AT ?auto_1195078 ?auto_1195079 ) ( ON ?auto_1195066 ?auto_1195065 ) ( ON ?auto_1195067 ?auto_1195066 ) ( ON ?auto_1195069 ?auto_1195067 ) ( ON ?auto_1195068 ?auto_1195069 ) ( ON ?auto_1195070 ?auto_1195068 ) ( ON ?auto_1195071 ?auto_1195070 ) ( ON ?auto_1195072 ?auto_1195071 ) ( ON ?auto_1195073 ?auto_1195072 ) ( not ( = ?auto_1195065 ?auto_1195066 ) ) ( not ( = ?auto_1195065 ?auto_1195067 ) ) ( not ( = ?auto_1195065 ?auto_1195069 ) ) ( not ( = ?auto_1195065 ?auto_1195068 ) ) ( not ( = ?auto_1195065 ?auto_1195070 ) ) ( not ( = ?auto_1195065 ?auto_1195071 ) ) ( not ( = ?auto_1195065 ?auto_1195072 ) ) ( not ( = ?auto_1195065 ?auto_1195073 ) ) ( not ( = ?auto_1195065 ?auto_1195074 ) ) ( not ( = ?auto_1195065 ?auto_1195075 ) ) ( not ( = ?auto_1195065 ?auto_1195081 ) ) ( not ( = ?auto_1195065 ?auto_1195076 ) ) ( not ( = ?auto_1195066 ?auto_1195067 ) ) ( not ( = ?auto_1195066 ?auto_1195069 ) ) ( not ( = ?auto_1195066 ?auto_1195068 ) ) ( not ( = ?auto_1195066 ?auto_1195070 ) ) ( not ( = ?auto_1195066 ?auto_1195071 ) ) ( not ( = ?auto_1195066 ?auto_1195072 ) ) ( not ( = ?auto_1195066 ?auto_1195073 ) ) ( not ( = ?auto_1195066 ?auto_1195074 ) ) ( not ( = ?auto_1195066 ?auto_1195075 ) ) ( not ( = ?auto_1195066 ?auto_1195081 ) ) ( not ( = ?auto_1195066 ?auto_1195076 ) ) ( not ( = ?auto_1195067 ?auto_1195069 ) ) ( not ( = ?auto_1195067 ?auto_1195068 ) ) ( not ( = ?auto_1195067 ?auto_1195070 ) ) ( not ( = ?auto_1195067 ?auto_1195071 ) ) ( not ( = ?auto_1195067 ?auto_1195072 ) ) ( not ( = ?auto_1195067 ?auto_1195073 ) ) ( not ( = ?auto_1195067 ?auto_1195074 ) ) ( not ( = ?auto_1195067 ?auto_1195075 ) ) ( not ( = ?auto_1195067 ?auto_1195081 ) ) ( not ( = ?auto_1195067 ?auto_1195076 ) ) ( not ( = ?auto_1195069 ?auto_1195068 ) ) ( not ( = ?auto_1195069 ?auto_1195070 ) ) ( not ( = ?auto_1195069 ?auto_1195071 ) ) ( not ( = ?auto_1195069 ?auto_1195072 ) ) ( not ( = ?auto_1195069 ?auto_1195073 ) ) ( not ( = ?auto_1195069 ?auto_1195074 ) ) ( not ( = ?auto_1195069 ?auto_1195075 ) ) ( not ( = ?auto_1195069 ?auto_1195081 ) ) ( not ( = ?auto_1195069 ?auto_1195076 ) ) ( not ( = ?auto_1195068 ?auto_1195070 ) ) ( not ( = ?auto_1195068 ?auto_1195071 ) ) ( not ( = ?auto_1195068 ?auto_1195072 ) ) ( not ( = ?auto_1195068 ?auto_1195073 ) ) ( not ( = ?auto_1195068 ?auto_1195074 ) ) ( not ( = ?auto_1195068 ?auto_1195075 ) ) ( not ( = ?auto_1195068 ?auto_1195081 ) ) ( not ( = ?auto_1195068 ?auto_1195076 ) ) ( not ( = ?auto_1195070 ?auto_1195071 ) ) ( not ( = ?auto_1195070 ?auto_1195072 ) ) ( not ( = ?auto_1195070 ?auto_1195073 ) ) ( not ( = ?auto_1195070 ?auto_1195074 ) ) ( not ( = ?auto_1195070 ?auto_1195075 ) ) ( not ( = ?auto_1195070 ?auto_1195081 ) ) ( not ( = ?auto_1195070 ?auto_1195076 ) ) ( not ( = ?auto_1195071 ?auto_1195072 ) ) ( not ( = ?auto_1195071 ?auto_1195073 ) ) ( not ( = ?auto_1195071 ?auto_1195074 ) ) ( not ( = ?auto_1195071 ?auto_1195075 ) ) ( not ( = ?auto_1195071 ?auto_1195081 ) ) ( not ( = ?auto_1195071 ?auto_1195076 ) ) ( not ( = ?auto_1195072 ?auto_1195073 ) ) ( not ( = ?auto_1195072 ?auto_1195074 ) ) ( not ( = ?auto_1195072 ?auto_1195075 ) ) ( not ( = ?auto_1195072 ?auto_1195081 ) ) ( not ( = ?auto_1195072 ?auto_1195076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195073 ?auto_1195074 ?auto_1195075 )
      ( MAKE-10CRATE-VERIFY ?auto_1195065 ?auto_1195066 ?auto_1195067 ?auto_1195069 ?auto_1195068 ?auto_1195070 ?auto_1195071 ?auto_1195072 ?auto_1195073 ?auto_1195074 ?auto_1195075 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1195083 - SURFACE
      ?auto_1195084 - SURFACE
    )
    :vars
    (
      ?auto_1195092 - HOIST
      ?auto_1195089 - PLACE
      ?auto_1195086 - SURFACE
      ?auto_1195087 - PLACE
      ?auto_1195090 - HOIST
      ?auto_1195091 - SURFACE
      ?auto_1195085 - SURFACE
      ?auto_1195088 - TRUCK
      ?auto_1195093 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195092 ?auto_1195089 ) ( IS-CRATE ?auto_1195084 ) ( not ( = ?auto_1195083 ?auto_1195084 ) ) ( not ( = ?auto_1195086 ?auto_1195083 ) ) ( not ( = ?auto_1195086 ?auto_1195084 ) ) ( not ( = ?auto_1195087 ?auto_1195089 ) ) ( HOIST-AT ?auto_1195090 ?auto_1195087 ) ( not ( = ?auto_1195092 ?auto_1195090 ) ) ( SURFACE-AT ?auto_1195084 ?auto_1195087 ) ( ON ?auto_1195084 ?auto_1195091 ) ( CLEAR ?auto_1195084 ) ( not ( = ?auto_1195083 ?auto_1195091 ) ) ( not ( = ?auto_1195084 ?auto_1195091 ) ) ( not ( = ?auto_1195086 ?auto_1195091 ) ) ( IS-CRATE ?auto_1195083 ) ( AVAILABLE ?auto_1195090 ) ( SURFACE-AT ?auto_1195083 ?auto_1195087 ) ( ON ?auto_1195083 ?auto_1195085 ) ( CLEAR ?auto_1195083 ) ( not ( = ?auto_1195083 ?auto_1195085 ) ) ( not ( = ?auto_1195084 ?auto_1195085 ) ) ( not ( = ?auto_1195086 ?auto_1195085 ) ) ( not ( = ?auto_1195091 ?auto_1195085 ) ) ( TRUCK-AT ?auto_1195088 ?auto_1195089 ) ( SURFACE-AT ?auto_1195093 ?auto_1195089 ) ( CLEAR ?auto_1195093 ) ( LIFTING ?auto_1195092 ?auto_1195086 ) ( IS-CRATE ?auto_1195086 ) ( not ( = ?auto_1195093 ?auto_1195086 ) ) ( not ( = ?auto_1195083 ?auto_1195093 ) ) ( not ( = ?auto_1195084 ?auto_1195093 ) ) ( not ( = ?auto_1195091 ?auto_1195093 ) ) ( not ( = ?auto_1195085 ?auto_1195093 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1195093 ?auto_1195086 )
      ( MAKE-2CRATE ?auto_1195086 ?auto_1195083 ?auto_1195084 )
      ( MAKE-1CRATE-VERIFY ?auto_1195083 ?auto_1195084 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1195094 - SURFACE
      ?auto_1195095 - SURFACE
      ?auto_1195096 - SURFACE
    )
    :vars
    (
      ?auto_1195101 - HOIST
      ?auto_1195097 - PLACE
      ?auto_1195100 - PLACE
      ?auto_1195098 - HOIST
      ?auto_1195104 - SURFACE
      ?auto_1195103 - SURFACE
      ?auto_1195099 - TRUCK
      ?auto_1195102 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195101 ?auto_1195097 ) ( IS-CRATE ?auto_1195096 ) ( not ( = ?auto_1195095 ?auto_1195096 ) ) ( not ( = ?auto_1195094 ?auto_1195095 ) ) ( not ( = ?auto_1195094 ?auto_1195096 ) ) ( not ( = ?auto_1195100 ?auto_1195097 ) ) ( HOIST-AT ?auto_1195098 ?auto_1195100 ) ( not ( = ?auto_1195101 ?auto_1195098 ) ) ( SURFACE-AT ?auto_1195096 ?auto_1195100 ) ( ON ?auto_1195096 ?auto_1195104 ) ( CLEAR ?auto_1195096 ) ( not ( = ?auto_1195095 ?auto_1195104 ) ) ( not ( = ?auto_1195096 ?auto_1195104 ) ) ( not ( = ?auto_1195094 ?auto_1195104 ) ) ( IS-CRATE ?auto_1195095 ) ( AVAILABLE ?auto_1195098 ) ( SURFACE-AT ?auto_1195095 ?auto_1195100 ) ( ON ?auto_1195095 ?auto_1195103 ) ( CLEAR ?auto_1195095 ) ( not ( = ?auto_1195095 ?auto_1195103 ) ) ( not ( = ?auto_1195096 ?auto_1195103 ) ) ( not ( = ?auto_1195094 ?auto_1195103 ) ) ( not ( = ?auto_1195104 ?auto_1195103 ) ) ( TRUCK-AT ?auto_1195099 ?auto_1195097 ) ( SURFACE-AT ?auto_1195102 ?auto_1195097 ) ( CLEAR ?auto_1195102 ) ( LIFTING ?auto_1195101 ?auto_1195094 ) ( IS-CRATE ?auto_1195094 ) ( not ( = ?auto_1195102 ?auto_1195094 ) ) ( not ( = ?auto_1195095 ?auto_1195102 ) ) ( not ( = ?auto_1195096 ?auto_1195102 ) ) ( not ( = ?auto_1195104 ?auto_1195102 ) ) ( not ( = ?auto_1195103 ?auto_1195102 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1195095 ?auto_1195096 )
      ( MAKE-2CRATE-VERIFY ?auto_1195094 ?auto_1195095 ?auto_1195096 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1195105 - SURFACE
      ?auto_1195106 - SURFACE
      ?auto_1195107 - SURFACE
      ?auto_1195108 - SURFACE
    )
    :vars
    (
      ?auto_1195109 - HOIST
      ?auto_1195115 - PLACE
      ?auto_1195110 - PLACE
      ?auto_1195113 - HOIST
      ?auto_1195114 - SURFACE
      ?auto_1195111 - SURFACE
      ?auto_1195112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195109 ?auto_1195115 ) ( IS-CRATE ?auto_1195108 ) ( not ( = ?auto_1195107 ?auto_1195108 ) ) ( not ( = ?auto_1195106 ?auto_1195107 ) ) ( not ( = ?auto_1195106 ?auto_1195108 ) ) ( not ( = ?auto_1195110 ?auto_1195115 ) ) ( HOIST-AT ?auto_1195113 ?auto_1195110 ) ( not ( = ?auto_1195109 ?auto_1195113 ) ) ( SURFACE-AT ?auto_1195108 ?auto_1195110 ) ( ON ?auto_1195108 ?auto_1195114 ) ( CLEAR ?auto_1195108 ) ( not ( = ?auto_1195107 ?auto_1195114 ) ) ( not ( = ?auto_1195108 ?auto_1195114 ) ) ( not ( = ?auto_1195106 ?auto_1195114 ) ) ( IS-CRATE ?auto_1195107 ) ( AVAILABLE ?auto_1195113 ) ( SURFACE-AT ?auto_1195107 ?auto_1195110 ) ( ON ?auto_1195107 ?auto_1195111 ) ( CLEAR ?auto_1195107 ) ( not ( = ?auto_1195107 ?auto_1195111 ) ) ( not ( = ?auto_1195108 ?auto_1195111 ) ) ( not ( = ?auto_1195106 ?auto_1195111 ) ) ( not ( = ?auto_1195114 ?auto_1195111 ) ) ( TRUCK-AT ?auto_1195112 ?auto_1195115 ) ( SURFACE-AT ?auto_1195105 ?auto_1195115 ) ( CLEAR ?auto_1195105 ) ( LIFTING ?auto_1195109 ?auto_1195106 ) ( IS-CRATE ?auto_1195106 ) ( not ( = ?auto_1195105 ?auto_1195106 ) ) ( not ( = ?auto_1195107 ?auto_1195105 ) ) ( not ( = ?auto_1195108 ?auto_1195105 ) ) ( not ( = ?auto_1195114 ?auto_1195105 ) ) ( not ( = ?auto_1195111 ?auto_1195105 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195106 ?auto_1195107 ?auto_1195108 )
      ( MAKE-3CRATE-VERIFY ?auto_1195105 ?auto_1195106 ?auto_1195107 ?auto_1195108 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1195116 - SURFACE
      ?auto_1195117 - SURFACE
      ?auto_1195118 - SURFACE
      ?auto_1195120 - SURFACE
      ?auto_1195119 - SURFACE
    )
    :vars
    (
      ?auto_1195121 - HOIST
      ?auto_1195127 - PLACE
      ?auto_1195122 - PLACE
      ?auto_1195125 - HOIST
      ?auto_1195126 - SURFACE
      ?auto_1195123 - SURFACE
      ?auto_1195124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195121 ?auto_1195127 ) ( IS-CRATE ?auto_1195119 ) ( not ( = ?auto_1195120 ?auto_1195119 ) ) ( not ( = ?auto_1195118 ?auto_1195120 ) ) ( not ( = ?auto_1195118 ?auto_1195119 ) ) ( not ( = ?auto_1195122 ?auto_1195127 ) ) ( HOIST-AT ?auto_1195125 ?auto_1195122 ) ( not ( = ?auto_1195121 ?auto_1195125 ) ) ( SURFACE-AT ?auto_1195119 ?auto_1195122 ) ( ON ?auto_1195119 ?auto_1195126 ) ( CLEAR ?auto_1195119 ) ( not ( = ?auto_1195120 ?auto_1195126 ) ) ( not ( = ?auto_1195119 ?auto_1195126 ) ) ( not ( = ?auto_1195118 ?auto_1195126 ) ) ( IS-CRATE ?auto_1195120 ) ( AVAILABLE ?auto_1195125 ) ( SURFACE-AT ?auto_1195120 ?auto_1195122 ) ( ON ?auto_1195120 ?auto_1195123 ) ( CLEAR ?auto_1195120 ) ( not ( = ?auto_1195120 ?auto_1195123 ) ) ( not ( = ?auto_1195119 ?auto_1195123 ) ) ( not ( = ?auto_1195118 ?auto_1195123 ) ) ( not ( = ?auto_1195126 ?auto_1195123 ) ) ( TRUCK-AT ?auto_1195124 ?auto_1195127 ) ( SURFACE-AT ?auto_1195117 ?auto_1195127 ) ( CLEAR ?auto_1195117 ) ( LIFTING ?auto_1195121 ?auto_1195118 ) ( IS-CRATE ?auto_1195118 ) ( not ( = ?auto_1195117 ?auto_1195118 ) ) ( not ( = ?auto_1195120 ?auto_1195117 ) ) ( not ( = ?auto_1195119 ?auto_1195117 ) ) ( not ( = ?auto_1195126 ?auto_1195117 ) ) ( not ( = ?auto_1195123 ?auto_1195117 ) ) ( ON ?auto_1195117 ?auto_1195116 ) ( not ( = ?auto_1195116 ?auto_1195117 ) ) ( not ( = ?auto_1195116 ?auto_1195118 ) ) ( not ( = ?auto_1195116 ?auto_1195120 ) ) ( not ( = ?auto_1195116 ?auto_1195119 ) ) ( not ( = ?auto_1195116 ?auto_1195126 ) ) ( not ( = ?auto_1195116 ?auto_1195123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195118 ?auto_1195120 ?auto_1195119 )
      ( MAKE-4CRATE-VERIFY ?auto_1195116 ?auto_1195117 ?auto_1195118 ?auto_1195120 ?auto_1195119 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1195128 - SURFACE
      ?auto_1195129 - SURFACE
      ?auto_1195130 - SURFACE
      ?auto_1195132 - SURFACE
      ?auto_1195131 - SURFACE
      ?auto_1195133 - SURFACE
    )
    :vars
    (
      ?auto_1195134 - HOIST
      ?auto_1195140 - PLACE
      ?auto_1195135 - PLACE
      ?auto_1195138 - HOIST
      ?auto_1195139 - SURFACE
      ?auto_1195136 - SURFACE
      ?auto_1195137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195134 ?auto_1195140 ) ( IS-CRATE ?auto_1195133 ) ( not ( = ?auto_1195131 ?auto_1195133 ) ) ( not ( = ?auto_1195132 ?auto_1195131 ) ) ( not ( = ?auto_1195132 ?auto_1195133 ) ) ( not ( = ?auto_1195135 ?auto_1195140 ) ) ( HOIST-AT ?auto_1195138 ?auto_1195135 ) ( not ( = ?auto_1195134 ?auto_1195138 ) ) ( SURFACE-AT ?auto_1195133 ?auto_1195135 ) ( ON ?auto_1195133 ?auto_1195139 ) ( CLEAR ?auto_1195133 ) ( not ( = ?auto_1195131 ?auto_1195139 ) ) ( not ( = ?auto_1195133 ?auto_1195139 ) ) ( not ( = ?auto_1195132 ?auto_1195139 ) ) ( IS-CRATE ?auto_1195131 ) ( AVAILABLE ?auto_1195138 ) ( SURFACE-AT ?auto_1195131 ?auto_1195135 ) ( ON ?auto_1195131 ?auto_1195136 ) ( CLEAR ?auto_1195131 ) ( not ( = ?auto_1195131 ?auto_1195136 ) ) ( not ( = ?auto_1195133 ?auto_1195136 ) ) ( not ( = ?auto_1195132 ?auto_1195136 ) ) ( not ( = ?auto_1195139 ?auto_1195136 ) ) ( TRUCK-AT ?auto_1195137 ?auto_1195140 ) ( SURFACE-AT ?auto_1195130 ?auto_1195140 ) ( CLEAR ?auto_1195130 ) ( LIFTING ?auto_1195134 ?auto_1195132 ) ( IS-CRATE ?auto_1195132 ) ( not ( = ?auto_1195130 ?auto_1195132 ) ) ( not ( = ?auto_1195131 ?auto_1195130 ) ) ( not ( = ?auto_1195133 ?auto_1195130 ) ) ( not ( = ?auto_1195139 ?auto_1195130 ) ) ( not ( = ?auto_1195136 ?auto_1195130 ) ) ( ON ?auto_1195129 ?auto_1195128 ) ( ON ?auto_1195130 ?auto_1195129 ) ( not ( = ?auto_1195128 ?auto_1195129 ) ) ( not ( = ?auto_1195128 ?auto_1195130 ) ) ( not ( = ?auto_1195128 ?auto_1195132 ) ) ( not ( = ?auto_1195128 ?auto_1195131 ) ) ( not ( = ?auto_1195128 ?auto_1195133 ) ) ( not ( = ?auto_1195128 ?auto_1195139 ) ) ( not ( = ?auto_1195128 ?auto_1195136 ) ) ( not ( = ?auto_1195129 ?auto_1195130 ) ) ( not ( = ?auto_1195129 ?auto_1195132 ) ) ( not ( = ?auto_1195129 ?auto_1195131 ) ) ( not ( = ?auto_1195129 ?auto_1195133 ) ) ( not ( = ?auto_1195129 ?auto_1195139 ) ) ( not ( = ?auto_1195129 ?auto_1195136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195132 ?auto_1195131 ?auto_1195133 )
      ( MAKE-5CRATE-VERIFY ?auto_1195128 ?auto_1195129 ?auto_1195130 ?auto_1195132 ?auto_1195131 ?auto_1195133 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1195141 - SURFACE
      ?auto_1195142 - SURFACE
      ?auto_1195143 - SURFACE
      ?auto_1195145 - SURFACE
      ?auto_1195144 - SURFACE
      ?auto_1195146 - SURFACE
      ?auto_1195147 - SURFACE
    )
    :vars
    (
      ?auto_1195148 - HOIST
      ?auto_1195154 - PLACE
      ?auto_1195149 - PLACE
      ?auto_1195152 - HOIST
      ?auto_1195153 - SURFACE
      ?auto_1195150 - SURFACE
      ?auto_1195151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195148 ?auto_1195154 ) ( IS-CRATE ?auto_1195147 ) ( not ( = ?auto_1195146 ?auto_1195147 ) ) ( not ( = ?auto_1195144 ?auto_1195146 ) ) ( not ( = ?auto_1195144 ?auto_1195147 ) ) ( not ( = ?auto_1195149 ?auto_1195154 ) ) ( HOIST-AT ?auto_1195152 ?auto_1195149 ) ( not ( = ?auto_1195148 ?auto_1195152 ) ) ( SURFACE-AT ?auto_1195147 ?auto_1195149 ) ( ON ?auto_1195147 ?auto_1195153 ) ( CLEAR ?auto_1195147 ) ( not ( = ?auto_1195146 ?auto_1195153 ) ) ( not ( = ?auto_1195147 ?auto_1195153 ) ) ( not ( = ?auto_1195144 ?auto_1195153 ) ) ( IS-CRATE ?auto_1195146 ) ( AVAILABLE ?auto_1195152 ) ( SURFACE-AT ?auto_1195146 ?auto_1195149 ) ( ON ?auto_1195146 ?auto_1195150 ) ( CLEAR ?auto_1195146 ) ( not ( = ?auto_1195146 ?auto_1195150 ) ) ( not ( = ?auto_1195147 ?auto_1195150 ) ) ( not ( = ?auto_1195144 ?auto_1195150 ) ) ( not ( = ?auto_1195153 ?auto_1195150 ) ) ( TRUCK-AT ?auto_1195151 ?auto_1195154 ) ( SURFACE-AT ?auto_1195145 ?auto_1195154 ) ( CLEAR ?auto_1195145 ) ( LIFTING ?auto_1195148 ?auto_1195144 ) ( IS-CRATE ?auto_1195144 ) ( not ( = ?auto_1195145 ?auto_1195144 ) ) ( not ( = ?auto_1195146 ?auto_1195145 ) ) ( not ( = ?auto_1195147 ?auto_1195145 ) ) ( not ( = ?auto_1195153 ?auto_1195145 ) ) ( not ( = ?auto_1195150 ?auto_1195145 ) ) ( ON ?auto_1195142 ?auto_1195141 ) ( ON ?auto_1195143 ?auto_1195142 ) ( ON ?auto_1195145 ?auto_1195143 ) ( not ( = ?auto_1195141 ?auto_1195142 ) ) ( not ( = ?auto_1195141 ?auto_1195143 ) ) ( not ( = ?auto_1195141 ?auto_1195145 ) ) ( not ( = ?auto_1195141 ?auto_1195144 ) ) ( not ( = ?auto_1195141 ?auto_1195146 ) ) ( not ( = ?auto_1195141 ?auto_1195147 ) ) ( not ( = ?auto_1195141 ?auto_1195153 ) ) ( not ( = ?auto_1195141 ?auto_1195150 ) ) ( not ( = ?auto_1195142 ?auto_1195143 ) ) ( not ( = ?auto_1195142 ?auto_1195145 ) ) ( not ( = ?auto_1195142 ?auto_1195144 ) ) ( not ( = ?auto_1195142 ?auto_1195146 ) ) ( not ( = ?auto_1195142 ?auto_1195147 ) ) ( not ( = ?auto_1195142 ?auto_1195153 ) ) ( not ( = ?auto_1195142 ?auto_1195150 ) ) ( not ( = ?auto_1195143 ?auto_1195145 ) ) ( not ( = ?auto_1195143 ?auto_1195144 ) ) ( not ( = ?auto_1195143 ?auto_1195146 ) ) ( not ( = ?auto_1195143 ?auto_1195147 ) ) ( not ( = ?auto_1195143 ?auto_1195153 ) ) ( not ( = ?auto_1195143 ?auto_1195150 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195144 ?auto_1195146 ?auto_1195147 )
      ( MAKE-6CRATE-VERIFY ?auto_1195141 ?auto_1195142 ?auto_1195143 ?auto_1195145 ?auto_1195144 ?auto_1195146 ?auto_1195147 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1195155 - SURFACE
      ?auto_1195156 - SURFACE
      ?auto_1195157 - SURFACE
      ?auto_1195159 - SURFACE
      ?auto_1195158 - SURFACE
      ?auto_1195160 - SURFACE
      ?auto_1195161 - SURFACE
      ?auto_1195162 - SURFACE
    )
    :vars
    (
      ?auto_1195163 - HOIST
      ?auto_1195169 - PLACE
      ?auto_1195164 - PLACE
      ?auto_1195167 - HOIST
      ?auto_1195168 - SURFACE
      ?auto_1195165 - SURFACE
      ?auto_1195166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195163 ?auto_1195169 ) ( IS-CRATE ?auto_1195162 ) ( not ( = ?auto_1195161 ?auto_1195162 ) ) ( not ( = ?auto_1195160 ?auto_1195161 ) ) ( not ( = ?auto_1195160 ?auto_1195162 ) ) ( not ( = ?auto_1195164 ?auto_1195169 ) ) ( HOIST-AT ?auto_1195167 ?auto_1195164 ) ( not ( = ?auto_1195163 ?auto_1195167 ) ) ( SURFACE-AT ?auto_1195162 ?auto_1195164 ) ( ON ?auto_1195162 ?auto_1195168 ) ( CLEAR ?auto_1195162 ) ( not ( = ?auto_1195161 ?auto_1195168 ) ) ( not ( = ?auto_1195162 ?auto_1195168 ) ) ( not ( = ?auto_1195160 ?auto_1195168 ) ) ( IS-CRATE ?auto_1195161 ) ( AVAILABLE ?auto_1195167 ) ( SURFACE-AT ?auto_1195161 ?auto_1195164 ) ( ON ?auto_1195161 ?auto_1195165 ) ( CLEAR ?auto_1195161 ) ( not ( = ?auto_1195161 ?auto_1195165 ) ) ( not ( = ?auto_1195162 ?auto_1195165 ) ) ( not ( = ?auto_1195160 ?auto_1195165 ) ) ( not ( = ?auto_1195168 ?auto_1195165 ) ) ( TRUCK-AT ?auto_1195166 ?auto_1195169 ) ( SURFACE-AT ?auto_1195158 ?auto_1195169 ) ( CLEAR ?auto_1195158 ) ( LIFTING ?auto_1195163 ?auto_1195160 ) ( IS-CRATE ?auto_1195160 ) ( not ( = ?auto_1195158 ?auto_1195160 ) ) ( not ( = ?auto_1195161 ?auto_1195158 ) ) ( not ( = ?auto_1195162 ?auto_1195158 ) ) ( not ( = ?auto_1195168 ?auto_1195158 ) ) ( not ( = ?auto_1195165 ?auto_1195158 ) ) ( ON ?auto_1195156 ?auto_1195155 ) ( ON ?auto_1195157 ?auto_1195156 ) ( ON ?auto_1195159 ?auto_1195157 ) ( ON ?auto_1195158 ?auto_1195159 ) ( not ( = ?auto_1195155 ?auto_1195156 ) ) ( not ( = ?auto_1195155 ?auto_1195157 ) ) ( not ( = ?auto_1195155 ?auto_1195159 ) ) ( not ( = ?auto_1195155 ?auto_1195158 ) ) ( not ( = ?auto_1195155 ?auto_1195160 ) ) ( not ( = ?auto_1195155 ?auto_1195161 ) ) ( not ( = ?auto_1195155 ?auto_1195162 ) ) ( not ( = ?auto_1195155 ?auto_1195168 ) ) ( not ( = ?auto_1195155 ?auto_1195165 ) ) ( not ( = ?auto_1195156 ?auto_1195157 ) ) ( not ( = ?auto_1195156 ?auto_1195159 ) ) ( not ( = ?auto_1195156 ?auto_1195158 ) ) ( not ( = ?auto_1195156 ?auto_1195160 ) ) ( not ( = ?auto_1195156 ?auto_1195161 ) ) ( not ( = ?auto_1195156 ?auto_1195162 ) ) ( not ( = ?auto_1195156 ?auto_1195168 ) ) ( not ( = ?auto_1195156 ?auto_1195165 ) ) ( not ( = ?auto_1195157 ?auto_1195159 ) ) ( not ( = ?auto_1195157 ?auto_1195158 ) ) ( not ( = ?auto_1195157 ?auto_1195160 ) ) ( not ( = ?auto_1195157 ?auto_1195161 ) ) ( not ( = ?auto_1195157 ?auto_1195162 ) ) ( not ( = ?auto_1195157 ?auto_1195168 ) ) ( not ( = ?auto_1195157 ?auto_1195165 ) ) ( not ( = ?auto_1195159 ?auto_1195158 ) ) ( not ( = ?auto_1195159 ?auto_1195160 ) ) ( not ( = ?auto_1195159 ?auto_1195161 ) ) ( not ( = ?auto_1195159 ?auto_1195162 ) ) ( not ( = ?auto_1195159 ?auto_1195168 ) ) ( not ( = ?auto_1195159 ?auto_1195165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195160 ?auto_1195161 ?auto_1195162 )
      ( MAKE-7CRATE-VERIFY ?auto_1195155 ?auto_1195156 ?auto_1195157 ?auto_1195159 ?auto_1195158 ?auto_1195160 ?auto_1195161 ?auto_1195162 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1195170 - SURFACE
      ?auto_1195171 - SURFACE
      ?auto_1195172 - SURFACE
      ?auto_1195174 - SURFACE
      ?auto_1195173 - SURFACE
      ?auto_1195175 - SURFACE
      ?auto_1195176 - SURFACE
      ?auto_1195177 - SURFACE
      ?auto_1195178 - SURFACE
    )
    :vars
    (
      ?auto_1195179 - HOIST
      ?auto_1195185 - PLACE
      ?auto_1195180 - PLACE
      ?auto_1195183 - HOIST
      ?auto_1195184 - SURFACE
      ?auto_1195181 - SURFACE
      ?auto_1195182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195179 ?auto_1195185 ) ( IS-CRATE ?auto_1195178 ) ( not ( = ?auto_1195177 ?auto_1195178 ) ) ( not ( = ?auto_1195176 ?auto_1195177 ) ) ( not ( = ?auto_1195176 ?auto_1195178 ) ) ( not ( = ?auto_1195180 ?auto_1195185 ) ) ( HOIST-AT ?auto_1195183 ?auto_1195180 ) ( not ( = ?auto_1195179 ?auto_1195183 ) ) ( SURFACE-AT ?auto_1195178 ?auto_1195180 ) ( ON ?auto_1195178 ?auto_1195184 ) ( CLEAR ?auto_1195178 ) ( not ( = ?auto_1195177 ?auto_1195184 ) ) ( not ( = ?auto_1195178 ?auto_1195184 ) ) ( not ( = ?auto_1195176 ?auto_1195184 ) ) ( IS-CRATE ?auto_1195177 ) ( AVAILABLE ?auto_1195183 ) ( SURFACE-AT ?auto_1195177 ?auto_1195180 ) ( ON ?auto_1195177 ?auto_1195181 ) ( CLEAR ?auto_1195177 ) ( not ( = ?auto_1195177 ?auto_1195181 ) ) ( not ( = ?auto_1195178 ?auto_1195181 ) ) ( not ( = ?auto_1195176 ?auto_1195181 ) ) ( not ( = ?auto_1195184 ?auto_1195181 ) ) ( TRUCK-AT ?auto_1195182 ?auto_1195185 ) ( SURFACE-AT ?auto_1195175 ?auto_1195185 ) ( CLEAR ?auto_1195175 ) ( LIFTING ?auto_1195179 ?auto_1195176 ) ( IS-CRATE ?auto_1195176 ) ( not ( = ?auto_1195175 ?auto_1195176 ) ) ( not ( = ?auto_1195177 ?auto_1195175 ) ) ( not ( = ?auto_1195178 ?auto_1195175 ) ) ( not ( = ?auto_1195184 ?auto_1195175 ) ) ( not ( = ?auto_1195181 ?auto_1195175 ) ) ( ON ?auto_1195171 ?auto_1195170 ) ( ON ?auto_1195172 ?auto_1195171 ) ( ON ?auto_1195174 ?auto_1195172 ) ( ON ?auto_1195173 ?auto_1195174 ) ( ON ?auto_1195175 ?auto_1195173 ) ( not ( = ?auto_1195170 ?auto_1195171 ) ) ( not ( = ?auto_1195170 ?auto_1195172 ) ) ( not ( = ?auto_1195170 ?auto_1195174 ) ) ( not ( = ?auto_1195170 ?auto_1195173 ) ) ( not ( = ?auto_1195170 ?auto_1195175 ) ) ( not ( = ?auto_1195170 ?auto_1195176 ) ) ( not ( = ?auto_1195170 ?auto_1195177 ) ) ( not ( = ?auto_1195170 ?auto_1195178 ) ) ( not ( = ?auto_1195170 ?auto_1195184 ) ) ( not ( = ?auto_1195170 ?auto_1195181 ) ) ( not ( = ?auto_1195171 ?auto_1195172 ) ) ( not ( = ?auto_1195171 ?auto_1195174 ) ) ( not ( = ?auto_1195171 ?auto_1195173 ) ) ( not ( = ?auto_1195171 ?auto_1195175 ) ) ( not ( = ?auto_1195171 ?auto_1195176 ) ) ( not ( = ?auto_1195171 ?auto_1195177 ) ) ( not ( = ?auto_1195171 ?auto_1195178 ) ) ( not ( = ?auto_1195171 ?auto_1195184 ) ) ( not ( = ?auto_1195171 ?auto_1195181 ) ) ( not ( = ?auto_1195172 ?auto_1195174 ) ) ( not ( = ?auto_1195172 ?auto_1195173 ) ) ( not ( = ?auto_1195172 ?auto_1195175 ) ) ( not ( = ?auto_1195172 ?auto_1195176 ) ) ( not ( = ?auto_1195172 ?auto_1195177 ) ) ( not ( = ?auto_1195172 ?auto_1195178 ) ) ( not ( = ?auto_1195172 ?auto_1195184 ) ) ( not ( = ?auto_1195172 ?auto_1195181 ) ) ( not ( = ?auto_1195174 ?auto_1195173 ) ) ( not ( = ?auto_1195174 ?auto_1195175 ) ) ( not ( = ?auto_1195174 ?auto_1195176 ) ) ( not ( = ?auto_1195174 ?auto_1195177 ) ) ( not ( = ?auto_1195174 ?auto_1195178 ) ) ( not ( = ?auto_1195174 ?auto_1195184 ) ) ( not ( = ?auto_1195174 ?auto_1195181 ) ) ( not ( = ?auto_1195173 ?auto_1195175 ) ) ( not ( = ?auto_1195173 ?auto_1195176 ) ) ( not ( = ?auto_1195173 ?auto_1195177 ) ) ( not ( = ?auto_1195173 ?auto_1195178 ) ) ( not ( = ?auto_1195173 ?auto_1195184 ) ) ( not ( = ?auto_1195173 ?auto_1195181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195176 ?auto_1195177 ?auto_1195178 )
      ( MAKE-8CRATE-VERIFY ?auto_1195170 ?auto_1195171 ?auto_1195172 ?auto_1195174 ?auto_1195173 ?auto_1195175 ?auto_1195176 ?auto_1195177 ?auto_1195178 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1195186 - SURFACE
      ?auto_1195187 - SURFACE
      ?auto_1195188 - SURFACE
      ?auto_1195190 - SURFACE
      ?auto_1195189 - SURFACE
      ?auto_1195191 - SURFACE
      ?auto_1195192 - SURFACE
      ?auto_1195193 - SURFACE
      ?auto_1195194 - SURFACE
      ?auto_1195195 - SURFACE
    )
    :vars
    (
      ?auto_1195196 - HOIST
      ?auto_1195202 - PLACE
      ?auto_1195197 - PLACE
      ?auto_1195200 - HOIST
      ?auto_1195201 - SURFACE
      ?auto_1195198 - SURFACE
      ?auto_1195199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195196 ?auto_1195202 ) ( IS-CRATE ?auto_1195195 ) ( not ( = ?auto_1195194 ?auto_1195195 ) ) ( not ( = ?auto_1195193 ?auto_1195194 ) ) ( not ( = ?auto_1195193 ?auto_1195195 ) ) ( not ( = ?auto_1195197 ?auto_1195202 ) ) ( HOIST-AT ?auto_1195200 ?auto_1195197 ) ( not ( = ?auto_1195196 ?auto_1195200 ) ) ( SURFACE-AT ?auto_1195195 ?auto_1195197 ) ( ON ?auto_1195195 ?auto_1195201 ) ( CLEAR ?auto_1195195 ) ( not ( = ?auto_1195194 ?auto_1195201 ) ) ( not ( = ?auto_1195195 ?auto_1195201 ) ) ( not ( = ?auto_1195193 ?auto_1195201 ) ) ( IS-CRATE ?auto_1195194 ) ( AVAILABLE ?auto_1195200 ) ( SURFACE-AT ?auto_1195194 ?auto_1195197 ) ( ON ?auto_1195194 ?auto_1195198 ) ( CLEAR ?auto_1195194 ) ( not ( = ?auto_1195194 ?auto_1195198 ) ) ( not ( = ?auto_1195195 ?auto_1195198 ) ) ( not ( = ?auto_1195193 ?auto_1195198 ) ) ( not ( = ?auto_1195201 ?auto_1195198 ) ) ( TRUCK-AT ?auto_1195199 ?auto_1195202 ) ( SURFACE-AT ?auto_1195192 ?auto_1195202 ) ( CLEAR ?auto_1195192 ) ( LIFTING ?auto_1195196 ?auto_1195193 ) ( IS-CRATE ?auto_1195193 ) ( not ( = ?auto_1195192 ?auto_1195193 ) ) ( not ( = ?auto_1195194 ?auto_1195192 ) ) ( not ( = ?auto_1195195 ?auto_1195192 ) ) ( not ( = ?auto_1195201 ?auto_1195192 ) ) ( not ( = ?auto_1195198 ?auto_1195192 ) ) ( ON ?auto_1195187 ?auto_1195186 ) ( ON ?auto_1195188 ?auto_1195187 ) ( ON ?auto_1195190 ?auto_1195188 ) ( ON ?auto_1195189 ?auto_1195190 ) ( ON ?auto_1195191 ?auto_1195189 ) ( ON ?auto_1195192 ?auto_1195191 ) ( not ( = ?auto_1195186 ?auto_1195187 ) ) ( not ( = ?auto_1195186 ?auto_1195188 ) ) ( not ( = ?auto_1195186 ?auto_1195190 ) ) ( not ( = ?auto_1195186 ?auto_1195189 ) ) ( not ( = ?auto_1195186 ?auto_1195191 ) ) ( not ( = ?auto_1195186 ?auto_1195192 ) ) ( not ( = ?auto_1195186 ?auto_1195193 ) ) ( not ( = ?auto_1195186 ?auto_1195194 ) ) ( not ( = ?auto_1195186 ?auto_1195195 ) ) ( not ( = ?auto_1195186 ?auto_1195201 ) ) ( not ( = ?auto_1195186 ?auto_1195198 ) ) ( not ( = ?auto_1195187 ?auto_1195188 ) ) ( not ( = ?auto_1195187 ?auto_1195190 ) ) ( not ( = ?auto_1195187 ?auto_1195189 ) ) ( not ( = ?auto_1195187 ?auto_1195191 ) ) ( not ( = ?auto_1195187 ?auto_1195192 ) ) ( not ( = ?auto_1195187 ?auto_1195193 ) ) ( not ( = ?auto_1195187 ?auto_1195194 ) ) ( not ( = ?auto_1195187 ?auto_1195195 ) ) ( not ( = ?auto_1195187 ?auto_1195201 ) ) ( not ( = ?auto_1195187 ?auto_1195198 ) ) ( not ( = ?auto_1195188 ?auto_1195190 ) ) ( not ( = ?auto_1195188 ?auto_1195189 ) ) ( not ( = ?auto_1195188 ?auto_1195191 ) ) ( not ( = ?auto_1195188 ?auto_1195192 ) ) ( not ( = ?auto_1195188 ?auto_1195193 ) ) ( not ( = ?auto_1195188 ?auto_1195194 ) ) ( not ( = ?auto_1195188 ?auto_1195195 ) ) ( not ( = ?auto_1195188 ?auto_1195201 ) ) ( not ( = ?auto_1195188 ?auto_1195198 ) ) ( not ( = ?auto_1195190 ?auto_1195189 ) ) ( not ( = ?auto_1195190 ?auto_1195191 ) ) ( not ( = ?auto_1195190 ?auto_1195192 ) ) ( not ( = ?auto_1195190 ?auto_1195193 ) ) ( not ( = ?auto_1195190 ?auto_1195194 ) ) ( not ( = ?auto_1195190 ?auto_1195195 ) ) ( not ( = ?auto_1195190 ?auto_1195201 ) ) ( not ( = ?auto_1195190 ?auto_1195198 ) ) ( not ( = ?auto_1195189 ?auto_1195191 ) ) ( not ( = ?auto_1195189 ?auto_1195192 ) ) ( not ( = ?auto_1195189 ?auto_1195193 ) ) ( not ( = ?auto_1195189 ?auto_1195194 ) ) ( not ( = ?auto_1195189 ?auto_1195195 ) ) ( not ( = ?auto_1195189 ?auto_1195201 ) ) ( not ( = ?auto_1195189 ?auto_1195198 ) ) ( not ( = ?auto_1195191 ?auto_1195192 ) ) ( not ( = ?auto_1195191 ?auto_1195193 ) ) ( not ( = ?auto_1195191 ?auto_1195194 ) ) ( not ( = ?auto_1195191 ?auto_1195195 ) ) ( not ( = ?auto_1195191 ?auto_1195201 ) ) ( not ( = ?auto_1195191 ?auto_1195198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195193 ?auto_1195194 ?auto_1195195 )
      ( MAKE-9CRATE-VERIFY ?auto_1195186 ?auto_1195187 ?auto_1195188 ?auto_1195190 ?auto_1195189 ?auto_1195191 ?auto_1195192 ?auto_1195193 ?auto_1195194 ?auto_1195195 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1195203 - SURFACE
      ?auto_1195204 - SURFACE
      ?auto_1195205 - SURFACE
      ?auto_1195207 - SURFACE
      ?auto_1195206 - SURFACE
      ?auto_1195208 - SURFACE
      ?auto_1195209 - SURFACE
      ?auto_1195210 - SURFACE
      ?auto_1195211 - SURFACE
      ?auto_1195212 - SURFACE
      ?auto_1195213 - SURFACE
    )
    :vars
    (
      ?auto_1195214 - HOIST
      ?auto_1195220 - PLACE
      ?auto_1195215 - PLACE
      ?auto_1195218 - HOIST
      ?auto_1195219 - SURFACE
      ?auto_1195216 - SURFACE
      ?auto_1195217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195214 ?auto_1195220 ) ( IS-CRATE ?auto_1195213 ) ( not ( = ?auto_1195212 ?auto_1195213 ) ) ( not ( = ?auto_1195211 ?auto_1195212 ) ) ( not ( = ?auto_1195211 ?auto_1195213 ) ) ( not ( = ?auto_1195215 ?auto_1195220 ) ) ( HOIST-AT ?auto_1195218 ?auto_1195215 ) ( not ( = ?auto_1195214 ?auto_1195218 ) ) ( SURFACE-AT ?auto_1195213 ?auto_1195215 ) ( ON ?auto_1195213 ?auto_1195219 ) ( CLEAR ?auto_1195213 ) ( not ( = ?auto_1195212 ?auto_1195219 ) ) ( not ( = ?auto_1195213 ?auto_1195219 ) ) ( not ( = ?auto_1195211 ?auto_1195219 ) ) ( IS-CRATE ?auto_1195212 ) ( AVAILABLE ?auto_1195218 ) ( SURFACE-AT ?auto_1195212 ?auto_1195215 ) ( ON ?auto_1195212 ?auto_1195216 ) ( CLEAR ?auto_1195212 ) ( not ( = ?auto_1195212 ?auto_1195216 ) ) ( not ( = ?auto_1195213 ?auto_1195216 ) ) ( not ( = ?auto_1195211 ?auto_1195216 ) ) ( not ( = ?auto_1195219 ?auto_1195216 ) ) ( TRUCK-AT ?auto_1195217 ?auto_1195220 ) ( SURFACE-AT ?auto_1195210 ?auto_1195220 ) ( CLEAR ?auto_1195210 ) ( LIFTING ?auto_1195214 ?auto_1195211 ) ( IS-CRATE ?auto_1195211 ) ( not ( = ?auto_1195210 ?auto_1195211 ) ) ( not ( = ?auto_1195212 ?auto_1195210 ) ) ( not ( = ?auto_1195213 ?auto_1195210 ) ) ( not ( = ?auto_1195219 ?auto_1195210 ) ) ( not ( = ?auto_1195216 ?auto_1195210 ) ) ( ON ?auto_1195204 ?auto_1195203 ) ( ON ?auto_1195205 ?auto_1195204 ) ( ON ?auto_1195207 ?auto_1195205 ) ( ON ?auto_1195206 ?auto_1195207 ) ( ON ?auto_1195208 ?auto_1195206 ) ( ON ?auto_1195209 ?auto_1195208 ) ( ON ?auto_1195210 ?auto_1195209 ) ( not ( = ?auto_1195203 ?auto_1195204 ) ) ( not ( = ?auto_1195203 ?auto_1195205 ) ) ( not ( = ?auto_1195203 ?auto_1195207 ) ) ( not ( = ?auto_1195203 ?auto_1195206 ) ) ( not ( = ?auto_1195203 ?auto_1195208 ) ) ( not ( = ?auto_1195203 ?auto_1195209 ) ) ( not ( = ?auto_1195203 ?auto_1195210 ) ) ( not ( = ?auto_1195203 ?auto_1195211 ) ) ( not ( = ?auto_1195203 ?auto_1195212 ) ) ( not ( = ?auto_1195203 ?auto_1195213 ) ) ( not ( = ?auto_1195203 ?auto_1195219 ) ) ( not ( = ?auto_1195203 ?auto_1195216 ) ) ( not ( = ?auto_1195204 ?auto_1195205 ) ) ( not ( = ?auto_1195204 ?auto_1195207 ) ) ( not ( = ?auto_1195204 ?auto_1195206 ) ) ( not ( = ?auto_1195204 ?auto_1195208 ) ) ( not ( = ?auto_1195204 ?auto_1195209 ) ) ( not ( = ?auto_1195204 ?auto_1195210 ) ) ( not ( = ?auto_1195204 ?auto_1195211 ) ) ( not ( = ?auto_1195204 ?auto_1195212 ) ) ( not ( = ?auto_1195204 ?auto_1195213 ) ) ( not ( = ?auto_1195204 ?auto_1195219 ) ) ( not ( = ?auto_1195204 ?auto_1195216 ) ) ( not ( = ?auto_1195205 ?auto_1195207 ) ) ( not ( = ?auto_1195205 ?auto_1195206 ) ) ( not ( = ?auto_1195205 ?auto_1195208 ) ) ( not ( = ?auto_1195205 ?auto_1195209 ) ) ( not ( = ?auto_1195205 ?auto_1195210 ) ) ( not ( = ?auto_1195205 ?auto_1195211 ) ) ( not ( = ?auto_1195205 ?auto_1195212 ) ) ( not ( = ?auto_1195205 ?auto_1195213 ) ) ( not ( = ?auto_1195205 ?auto_1195219 ) ) ( not ( = ?auto_1195205 ?auto_1195216 ) ) ( not ( = ?auto_1195207 ?auto_1195206 ) ) ( not ( = ?auto_1195207 ?auto_1195208 ) ) ( not ( = ?auto_1195207 ?auto_1195209 ) ) ( not ( = ?auto_1195207 ?auto_1195210 ) ) ( not ( = ?auto_1195207 ?auto_1195211 ) ) ( not ( = ?auto_1195207 ?auto_1195212 ) ) ( not ( = ?auto_1195207 ?auto_1195213 ) ) ( not ( = ?auto_1195207 ?auto_1195219 ) ) ( not ( = ?auto_1195207 ?auto_1195216 ) ) ( not ( = ?auto_1195206 ?auto_1195208 ) ) ( not ( = ?auto_1195206 ?auto_1195209 ) ) ( not ( = ?auto_1195206 ?auto_1195210 ) ) ( not ( = ?auto_1195206 ?auto_1195211 ) ) ( not ( = ?auto_1195206 ?auto_1195212 ) ) ( not ( = ?auto_1195206 ?auto_1195213 ) ) ( not ( = ?auto_1195206 ?auto_1195219 ) ) ( not ( = ?auto_1195206 ?auto_1195216 ) ) ( not ( = ?auto_1195208 ?auto_1195209 ) ) ( not ( = ?auto_1195208 ?auto_1195210 ) ) ( not ( = ?auto_1195208 ?auto_1195211 ) ) ( not ( = ?auto_1195208 ?auto_1195212 ) ) ( not ( = ?auto_1195208 ?auto_1195213 ) ) ( not ( = ?auto_1195208 ?auto_1195219 ) ) ( not ( = ?auto_1195208 ?auto_1195216 ) ) ( not ( = ?auto_1195209 ?auto_1195210 ) ) ( not ( = ?auto_1195209 ?auto_1195211 ) ) ( not ( = ?auto_1195209 ?auto_1195212 ) ) ( not ( = ?auto_1195209 ?auto_1195213 ) ) ( not ( = ?auto_1195209 ?auto_1195219 ) ) ( not ( = ?auto_1195209 ?auto_1195216 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195211 ?auto_1195212 ?auto_1195213 )
      ( MAKE-10CRATE-VERIFY ?auto_1195203 ?auto_1195204 ?auto_1195205 ?auto_1195207 ?auto_1195206 ?auto_1195208 ?auto_1195209 ?auto_1195210 ?auto_1195211 ?auto_1195212 ?auto_1195213 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1201719 - SURFACE
      ?auto_1201720 - SURFACE
      ?auto_1201721 - SURFACE
      ?auto_1201723 - SURFACE
      ?auto_1201722 - SURFACE
      ?auto_1201724 - SURFACE
      ?auto_1201725 - SURFACE
      ?auto_1201726 - SURFACE
      ?auto_1201727 - SURFACE
      ?auto_1201728 - SURFACE
      ?auto_1201729 - SURFACE
      ?auto_1201730 - SURFACE
    )
    :vars
    (
      ?auto_1201731 - HOIST
      ?auto_1201732 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1201731 ?auto_1201732 ) ( SURFACE-AT ?auto_1201729 ?auto_1201732 ) ( CLEAR ?auto_1201729 ) ( LIFTING ?auto_1201731 ?auto_1201730 ) ( IS-CRATE ?auto_1201730 ) ( not ( = ?auto_1201729 ?auto_1201730 ) ) ( ON ?auto_1201720 ?auto_1201719 ) ( ON ?auto_1201721 ?auto_1201720 ) ( ON ?auto_1201723 ?auto_1201721 ) ( ON ?auto_1201722 ?auto_1201723 ) ( ON ?auto_1201724 ?auto_1201722 ) ( ON ?auto_1201725 ?auto_1201724 ) ( ON ?auto_1201726 ?auto_1201725 ) ( ON ?auto_1201727 ?auto_1201726 ) ( ON ?auto_1201728 ?auto_1201727 ) ( ON ?auto_1201729 ?auto_1201728 ) ( not ( = ?auto_1201719 ?auto_1201720 ) ) ( not ( = ?auto_1201719 ?auto_1201721 ) ) ( not ( = ?auto_1201719 ?auto_1201723 ) ) ( not ( = ?auto_1201719 ?auto_1201722 ) ) ( not ( = ?auto_1201719 ?auto_1201724 ) ) ( not ( = ?auto_1201719 ?auto_1201725 ) ) ( not ( = ?auto_1201719 ?auto_1201726 ) ) ( not ( = ?auto_1201719 ?auto_1201727 ) ) ( not ( = ?auto_1201719 ?auto_1201728 ) ) ( not ( = ?auto_1201719 ?auto_1201729 ) ) ( not ( = ?auto_1201719 ?auto_1201730 ) ) ( not ( = ?auto_1201720 ?auto_1201721 ) ) ( not ( = ?auto_1201720 ?auto_1201723 ) ) ( not ( = ?auto_1201720 ?auto_1201722 ) ) ( not ( = ?auto_1201720 ?auto_1201724 ) ) ( not ( = ?auto_1201720 ?auto_1201725 ) ) ( not ( = ?auto_1201720 ?auto_1201726 ) ) ( not ( = ?auto_1201720 ?auto_1201727 ) ) ( not ( = ?auto_1201720 ?auto_1201728 ) ) ( not ( = ?auto_1201720 ?auto_1201729 ) ) ( not ( = ?auto_1201720 ?auto_1201730 ) ) ( not ( = ?auto_1201721 ?auto_1201723 ) ) ( not ( = ?auto_1201721 ?auto_1201722 ) ) ( not ( = ?auto_1201721 ?auto_1201724 ) ) ( not ( = ?auto_1201721 ?auto_1201725 ) ) ( not ( = ?auto_1201721 ?auto_1201726 ) ) ( not ( = ?auto_1201721 ?auto_1201727 ) ) ( not ( = ?auto_1201721 ?auto_1201728 ) ) ( not ( = ?auto_1201721 ?auto_1201729 ) ) ( not ( = ?auto_1201721 ?auto_1201730 ) ) ( not ( = ?auto_1201723 ?auto_1201722 ) ) ( not ( = ?auto_1201723 ?auto_1201724 ) ) ( not ( = ?auto_1201723 ?auto_1201725 ) ) ( not ( = ?auto_1201723 ?auto_1201726 ) ) ( not ( = ?auto_1201723 ?auto_1201727 ) ) ( not ( = ?auto_1201723 ?auto_1201728 ) ) ( not ( = ?auto_1201723 ?auto_1201729 ) ) ( not ( = ?auto_1201723 ?auto_1201730 ) ) ( not ( = ?auto_1201722 ?auto_1201724 ) ) ( not ( = ?auto_1201722 ?auto_1201725 ) ) ( not ( = ?auto_1201722 ?auto_1201726 ) ) ( not ( = ?auto_1201722 ?auto_1201727 ) ) ( not ( = ?auto_1201722 ?auto_1201728 ) ) ( not ( = ?auto_1201722 ?auto_1201729 ) ) ( not ( = ?auto_1201722 ?auto_1201730 ) ) ( not ( = ?auto_1201724 ?auto_1201725 ) ) ( not ( = ?auto_1201724 ?auto_1201726 ) ) ( not ( = ?auto_1201724 ?auto_1201727 ) ) ( not ( = ?auto_1201724 ?auto_1201728 ) ) ( not ( = ?auto_1201724 ?auto_1201729 ) ) ( not ( = ?auto_1201724 ?auto_1201730 ) ) ( not ( = ?auto_1201725 ?auto_1201726 ) ) ( not ( = ?auto_1201725 ?auto_1201727 ) ) ( not ( = ?auto_1201725 ?auto_1201728 ) ) ( not ( = ?auto_1201725 ?auto_1201729 ) ) ( not ( = ?auto_1201725 ?auto_1201730 ) ) ( not ( = ?auto_1201726 ?auto_1201727 ) ) ( not ( = ?auto_1201726 ?auto_1201728 ) ) ( not ( = ?auto_1201726 ?auto_1201729 ) ) ( not ( = ?auto_1201726 ?auto_1201730 ) ) ( not ( = ?auto_1201727 ?auto_1201728 ) ) ( not ( = ?auto_1201727 ?auto_1201729 ) ) ( not ( = ?auto_1201727 ?auto_1201730 ) ) ( not ( = ?auto_1201728 ?auto_1201729 ) ) ( not ( = ?auto_1201728 ?auto_1201730 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1201729 ?auto_1201730 )
      ( MAKE-11CRATE-VERIFY ?auto_1201719 ?auto_1201720 ?auto_1201721 ?auto_1201723 ?auto_1201722 ?auto_1201724 ?auto_1201725 ?auto_1201726 ?auto_1201727 ?auto_1201728 ?auto_1201729 ?auto_1201730 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1201828 - SURFACE
      ?auto_1201829 - SURFACE
      ?auto_1201830 - SURFACE
      ?auto_1201832 - SURFACE
      ?auto_1201831 - SURFACE
      ?auto_1201833 - SURFACE
      ?auto_1201834 - SURFACE
      ?auto_1201835 - SURFACE
      ?auto_1201836 - SURFACE
      ?auto_1201837 - SURFACE
      ?auto_1201838 - SURFACE
      ?auto_1201839 - SURFACE
    )
    :vars
    (
      ?auto_1201841 - HOIST
      ?auto_1201842 - PLACE
      ?auto_1201840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1201841 ?auto_1201842 ) ( SURFACE-AT ?auto_1201838 ?auto_1201842 ) ( CLEAR ?auto_1201838 ) ( IS-CRATE ?auto_1201839 ) ( not ( = ?auto_1201838 ?auto_1201839 ) ) ( TRUCK-AT ?auto_1201840 ?auto_1201842 ) ( AVAILABLE ?auto_1201841 ) ( IN ?auto_1201839 ?auto_1201840 ) ( ON ?auto_1201838 ?auto_1201837 ) ( not ( = ?auto_1201837 ?auto_1201838 ) ) ( not ( = ?auto_1201837 ?auto_1201839 ) ) ( ON ?auto_1201829 ?auto_1201828 ) ( ON ?auto_1201830 ?auto_1201829 ) ( ON ?auto_1201832 ?auto_1201830 ) ( ON ?auto_1201831 ?auto_1201832 ) ( ON ?auto_1201833 ?auto_1201831 ) ( ON ?auto_1201834 ?auto_1201833 ) ( ON ?auto_1201835 ?auto_1201834 ) ( ON ?auto_1201836 ?auto_1201835 ) ( ON ?auto_1201837 ?auto_1201836 ) ( not ( = ?auto_1201828 ?auto_1201829 ) ) ( not ( = ?auto_1201828 ?auto_1201830 ) ) ( not ( = ?auto_1201828 ?auto_1201832 ) ) ( not ( = ?auto_1201828 ?auto_1201831 ) ) ( not ( = ?auto_1201828 ?auto_1201833 ) ) ( not ( = ?auto_1201828 ?auto_1201834 ) ) ( not ( = ?auto_1201828 ?auto_1201835 ) ) ( not ( = ?auto_1201828 ?auto_1201836 ) ) ( not ( = ?auto_1201828 ?auto_1201837 ) ) ( not ( = ?auto_1201828 ?auto_1201838 ) ) ( not ( = ?auto_1201828 ?auto_1201839 ) ) ( not ( = ?auto_1201829 ?auto_1201830 ) ) ( not ( = ?auto_1201829 ?auto_1201832 ) ) ( not ( = ?auto_1201829 ?auto_1201831 ) ) ( not ( = ?auto_1201829 ?auto_1201833 ) ) ( not ( = ?auto_1201829 ?auto_1201834 ) ) ( not ( = ?auto_1201829 ?auto_1201835 ) ) ( not ( = ?auto_1201829 ?auto_1201836 ) ) ( not ( = ?auto_1201829 ?auto_1201837 ) ) ( not ( = ?auto_1201829 ?auto_1201838 ) ) ( not ( = ?auto_1201829 ?auto_1201839 ) ) ( not ( = ?auto_1201830 ?auto_1201832 ) ) ( not ( = ?auto_1201830 ?auto_1201831 ) ) ( not ( = ?auto_1201830 ?auto_1201833 ) ) ( not ( = ?auto_1201830 ?auto_1201834 ) ) ( not ( = ?auto_1201830 ?auto_1201835 ) ) ( not ( = ?auto_1201830 ?auto_1201836 ) ) ( not ( = ?auto_1201830 ?auto_1201837 ) ) ( not ( = ?auto_1201830 ?auto_1201838 ) ) ( not ( = ?auto_1201830 ?auto_1201839 ) ) ( not ( = ?auto_1201832 ?auto_1201831 ) ) ( not ( = ?auto_1201832 ?auto_1201833 ) ) ( not ( = ?auto_1201832 ?auto_1201834 ) ) ( not ( = ?auto_1201832 ?auto_1201835 ) ) ( not ( = ?auto_1201832 ?auto_1201836 ) ) ( not ( = ?auto_1201832 ?auto_1201837 ) ) ( not ( = ?auto_1201832 ?auto_1201838 ) ) ( not ( = ?auto_1201832 ?auto_1201839 ) ) ( not ( = ?auto_1201831 ?auto_1201833 ) ) ( not ( = ?auto_1201831 ?auto_1201834 ) ) ( not ( = ?auto_1201831 ?auto_1201835 ) ) ( not ( = ?auto_1201831 ?auto_1201836 ) ) ( not ( = ?auto_1201831 ?auto_1201837 ) ) ( not ( = ?auto_1201831 ?auto_1201838 ) ) ( not ( = ?auto_1201831 ?auto_1201839 ) ) ( not ( = ?auto_1201833 ?auto_1201834 ) ) ( not ( = ?auto_1201833 ?auto_1201835 ) ) ( not ( = ?auto_1201833 ?auto_1201836 ) ) ( not ( = ?auto_1201833 ?auto_1201837 ) ) ( not ( = ?auto_1201833 ?auto_1201838 ) ) ( not ( = ?auto_1201833 ?auto_1201839 ) ) ( not ( = ?auto_1201834 ?auto_1201835 ) ) ( not ( = ?auto_1201834 ?auto_1201836 ) ) ( not ( = ?auto_1201834 ?auto_1201837 ) ) ( not ( = ?auto_1201834 ?auto_1201838 ) ) ( not ( = ?auto_1201834 ?auto_1201839 ) ) ( not ( = ?auto_1201835 ?auto_1201836 ) ) ( not ( = ?auto_1201835 ?auto_1201837 ) ) ( not ( = ?auto_1201835 ?auto_1201838 ) ) ( not ( = ?auto_1201835 ?auto_1201839 ) ) ( not ( = ?auto_1201836 ?auto_1201837 ) ) ( not ( = ?auto_1201836 ?auto_1201838 ) ) ( not ( = ?auto_1201836 ?auto_1201839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1201837 ?auto_1201838 ?auto_1201839 )
      ( MAKE-11CRATE-VERIFY ?auto_1201828 ?auto_1201829 ?auto_1201830 ?auto_1201832 ?auto_1201831 ?auto_1201833 ?auto_1201834 ?auto_1201835 ?auto_1201836 ?auto_1201837 ?auto_1201838 ?auto_1201839 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1201949 - SURFACE
      ?auto_1201950 - SURFACE
      ?auto_1201951 - SURFACE
      ?auto_1201953 - SURFACE
      ?auto_1201952 - SURFACE
      ?auto_1201954 - SURFACE
      ?auto_1201955 - SURFACE
      ?auto_1201956 - SURFACE
      ?auto_1201957 - SURFACE
      ?auto_1201958 - SURFACE
      ?auto_1201959 - SURFACE
      ?auto_1201960 - SURFACE
    )
    :vars
    (
      ?auto_1201964 - HOIST
      ?auto_1201962 - PLACE
      ?auto_1201961 - TRUCK
      ?auto_1201963 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1201964 ?auto_1201962 ) ( SURFACE-AT ?auto_1201959 ?auto_1201962 ) ( CLEAR ?auto_1201959 ) ( IS-CRATE ?auto_1201960 ) ( not ( = ?auto_1201959 ?auto_1201960 ) ) ( AVAILABLE ?auto_1201964 ) ( IN ?auto_1201960 ?auto_1201961 ) ( ON ?auto_1201959 ?auto_1201958 ) ( not ( = ?auto_1201958 ?auto_1201959 ) ) ( not ( = ?auto_1201958 ?auto_1201960 ) ) ( TRUCK-AT ?auto_1201961 ?auto_1201963 ) ( not ( = ?auto_1201963 ?auto_1201962 ) ) ( ON ?auto_1201950 ?auto_1201949 ) ( ON ?auto_1201951 ?auto_1201950 ) ( ON ?auto_1201953 ?auto_1201951 ) ( ON ?auto_1201952 ?auto_1201953 ) ( ON ?auto_1201954 ?auto_1201952 ) ( ON ?auto_1201955 ?auto_1201954 ) ( ON ?auto_1201956 ?auto_1201955 ) ( ON ?auto_1201957 ?auto_1201956 ) ( ON ?auto_1201958 ?auto_1201957 ) ( not ( = ?auto_1201949 ?auto_1201950 ) ) ( not ( = ?auto_1201949 ?auto_1201951 ) ) ( not ( = ?auto_1201949 ?auto_1201953 ) ) ( not ( = ?auto_1201949 ?auto_1201952 ) ) ( not ( = ?auto_1201949 ?auto_1201954 ) ) ( not ( = ?auto_1201949 ?auto_1201955 ) ) ( not ( = ?auto_1201949 ?auto_1201956 ) ) ( not ( = ?auto_1201949 ?auto_1201957 ) ) ( not ( = ?auto_1201949 ?auto_1201958 ) ) ( not ( = ?auto_1201949 ?auto_1201959 ) ) ( not ( = ?auto_1201949 ?auto_1201960 ) ) ( not ( = ?auto_1201950 ?auto_1201951 ) ) ( not ( = ?auto_1201950 ?auto_1201953 ) ) ( not ( = ?auto_1201950 ?auto_1201952 ) ) ( not ( = ?auto_1201950 ?auto_1201954 ) ) ( not ( = ?auto_1201950 ?auto_1201955 ) ) ( not ( = ?auto_1201950 ?auto_1201956 ) ) ( not ( = ?auto_1201950 ?auto_1201957 ) ) ( not ( = ?auto_1201950 ?auto_1201958 ) ) ( not ( = ?auto_1201950 ?auto_1201959 ) ) ( not ( = ?auto_1201950 ?auto_1201960 ) ) ( not ( = ?auto_1201951 ?auto_1201953 ) ) ( not ( = ?auto_1201951 ?auto_1201952 ) ) ( not ( = ?auto_1201951 ?auto_1201954 ) ) ( not ( = ?auto_1201951 ?auto_1201955 ) ) ( not ( = ?auto_1201951 ?auto_1201956 ) ) ( not ( = ?auto_1201951 ?auto_1201957 ) ) ( not ( = ?auto_1201951 ?auto_1201958 ) ) ( not ( = ?auto_1201951 ?auto_1201959 ) ) ( not ( = ?auto_1201951 ?auto_1201960 ) ) ( not ( = ?auto_1201953 ?auto_1201952 ) ) ( not ( = ?auto_1201953 ?auto_1201954 ) ) ( not ( = ?auto_1201953 ?auto_1201955 ) ) ( not ( = ?auto_1201953 ?auto_1201956 ) ) ( not ( = ?auto_1201953 ?auto_1201957 ) ) ( not ( = ?auto_1201953 ?auto_1201958 ) ) ( not ( = ?auto_1201953 ?auto_1201959 ) ) ( not ( = ?auto_1201953 ?auto_1201960 ) ) ( not ( = ?auto_1201952 ?auto_1201954 ) ) ( not ( = ?auto_1201952 ?auto_1201955 ) ) ( not ( = ?auto_1201952 ?auto_1201956 ) ) ( not ( = ?auto_1201952 ?auto_1201957 ) ) ( not ( = ?auto_1201952 ?auto_1201958 ) ) ( not ( = ?auto_1201952 ?auto_1201959 ) ) ( not ( = ?auto_1201952 ?auto_1201960 ) ) ( not ( = ?auto_1201954 ?auto_1201955 ) ) ( not ( = ?auto_1201954 ?auto_1201956 ) ) ( not ( = ?auto_1201954 ?auto_1201957 ) ) ( not ( = ?auto_1201954 ?auto_1201958 ) ) ( not ( = ?auto_1201954 ?auto_1201959 ) ) ( not ( = ?auto_1201954 ?auto_1201960 ) ) ( not ( = ?auto_1201955 ?auto_1201956 ) ) ( not ( = ?auto_1201955 ?auto_1201957 ) ) ( not ( = ?auto_1201955 ?auto_1201958 ) ) ( not ( = ?auto_1201955 ?auto_1201959 ) ) ( not ( = ?auto_1201955 ?auto_1201960 ) ) ( not ( = ?auto_1201956 ?auto_1201957 ) ) ( not ( = ?auto_1201956 ?auto_1201958 ) ) ( not ( = ?auto_1201956 ?auto_1201959 ) ) ( not ( = ?auto_1201956 ?auto_1201960 ) ) ( not ( = ?auto_1201957 ?auto_1201958 ) ) ( not ( = ?auto_1201957 ?auto_1201959 ) ) ( not ( = ?auto_1201957 ?auto_1201960 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1201958 ?auto_1201959 ?auto_1201960 )
      ( MAKE-11CRATE-VERIFY ?auto_1201949 ?auto_1201950 ?auto_1201951 ?auto_1201953 ?auto_1201952 ?auto_1201954 ?auto_1201955 ?auto_1201956 ?auto_1201957 ?auto_1201958 ?auto_1201959 ?auto_1201960 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1202081 - SURFACE
      ?auto_1202082 - SURFACE
      ?auto_1202083 - SURFACE
      ?auto_1202085 - SURFACE
      ?auto_1202084 - SURFACE
      ?auto_1202086 - SURFACE
      ?auto_1202087 - SURFACE
      ?auto_1202088 - SURFACE
      ?auto_1202089 - SURFACE
      ?auto_1202090 - SURFACE
      ?auto_1202091 - SURFACE
      ?auto_1202092 - SURFACE
    )
    :vars
    (
      ?auto_1202094 - HOIST
      ?auto_1202097 - PLACE
      ?auto_1202095 - TRUCK
      ?auto_1202096 - PLACE
      ?auto_1202093 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1202094 ?auto_1202097 ) ( SURFACE-AT ?auto_1202091 ?auto_1202097 ) ( CLEAR ?auto_1202091 ) ( IS-CRATE ?auto_1202092 ) ( not ( = ?auto_1202091 ?auto_1202092 ) ) ( AVAILABLE ?auto_1202094 ) ( ON ?auto_1202091 ?auto_1202090 ) ( not ( = ?auto_1202090 ?auto_1202091 ) ) ( not ( = ?auto_1202090 ?auto_1202092 ) ) ( TRUCK-AT ?auto_1202095 ?auto_1202096 ) ( not ( = ?auto_1202096 ?auto_1202097 ) ) ( HOIST-AT ?auto_1202093 ?auto_1202096 ) ( LIFTING ?auto_1202093 ?auto_1202092 ) ( not ( = ?auto_1202094 ?auto_1202093 ) ) ( ON ?auto_1202082 ?auto_1202081 ) ( ON ?auto_1202083 ?auto_1202082 ) ( ON ?auto_1202085 ?auto_1202083 ) ( ON ?auto_1202084 ?auto_1202085 ) ( ON ?auto_1202086 ?auto_1202084 ) ( ON ?auto_1202087 ?auto_1202086 ) ( ON ?auto_1202088 ?auto_1202087 ) ( ON ?auto_1202089 ?auto_1202088 ) ( ON ?auto_1202090 ?auto_1202089 ) ( not ( = ?auto_1202081 ?auto_1202082 ) ) ( not ( = ?auto_1202081 ?auto_1202083 ) ) ( not ( = ?auto_1202081 ?auto_1202085 ) ) ( not ( = ?auto_1202081 ?auto_1202084 ) ) ( not ( = ?auto_1202081 ?auto_1202086 ) ) ( not ( = ?auto_1202081 ?auto_1202087 ) ) ( not ( = ?auto_1202081 ?auto_1202088 ) ) ( not ( = ?auto_1202081 ?auto_1202089 ) ) ( not ( = ?auto_1202081 ?auto_1202090 ) ) ( not ( = ?auto_1202081 ?auto_1202091 ) ) ( not ( = ?auto_1202081 ?auto_1202092 ) ) ( not ( = ?auto_1202082 ?auto_1202083 ) ) ( not ( = ?auto_1202082 ?auto_1202085 ) ) ( not ( = ?auto_1202082 ?auto_1202084 ) ) ( not ( = ?auto_1202082 ?auto_1202086 ) ) ( not ( = ?auto_1202082 ?auto_1202087 ) ) ( not ( = ?auto_1202082 ?auto_1202088 ) ) ( not ( = ?auto_1202082 ?auto_1202089 ) ) ( not ( = ?auto_1202082 ?auto_1202090 ) ) ( not ( = ?auto_1202082 ?auto_1202091 ) ) ( not ( = ?auto_1202082 ?auto_1202092 ) ) ( not ( = ?auto_1202083 ?auto_1202085 ) ) ( not ( = ?auto_1202083 ?auto_1202084 ) ) ( not ( = ?auto_1202083 ?auto_1202086 ) ) ( not ( = ?auto_1202083 ?auto_1202087 ) ) ( not ( = ?auto_1202083 ?auto_1202088 ) ) ( not ( = ?auto_1202083 ?auto_1202089 ) ) ( not ( = ?auto_1202083 ?auto_1202090 ) ) ( not ( = ?auto_1202083 ?auto_1202091 ) ) ( not ( = ?auto_1202083 ?auto_1202092 ) ) ( not ( = ?auto_1202085 ?auto_1202084 ) ) ( not ( = ?auto_1202085 ?auto_1202086 ) ) ( not ( = ?auto_1202085 ?auto_1202087 ) ) ( not ( = ?auto_1202085 ?auto_1202088 ) ) ( not ( = ?auto_1202085 ?auto_1202089 ) ) ( not ( = ?auto_1202085 ?auto_1202090 ) ) ( not ( = ?auto_1202085 ?auto_1202091 ) ) ( not ( = ?auto_1202085 ?auto_1202092 ) ) ( not ( = ?auto_1202084 ?auto_1202086 ) ) ( not ( = ?auto_1202084 ?auto_1202087 ) ) ( not ( = ?auto_1202084 ?auto_1202088 ) ) ( not ( = ?auto_1202084 ?auto_1202089 ) ) ( not ( = ?auto_1202084 ?auto_1202090 ) ) ( not ( = ?auto_1202084 ?auto_1202091 ) ) ( not ( = ?auto_1202084 ?auto_1202092 ) ) ( not ( = ?auto_1202086 ?auto_1202087 ) ) ( not ( = ?auto_1202086 ?auto_1202088 ) ) ( not ( = ?auto_1202086 ?auto_1202089 ) ) ( not ( = ?auto_1202086 ?auto_1202090 ) ) ( not ( = ?auto_1202086 ?auto_1202091 ) ) ( not ( = ?auto_1202086 ?auto_1202092 ) ) ( not ( = ?auto_1202087 ?auto_1202088 ) ) ( not ( = ?auto_1202087 ?auto_1202089 ) ) ( not ( = ?auto_1202087 ?auto_1202090 ) ) ( not ( = ?auto_1202087 ?auto_1202091 ) ) ( not ( = ?auto_1202087 ?auto_1202092 ) ) ( not ( = ?auto_1202088 ?auto_1202089 ) ) ( not ( = ?auto_1202088 ?auto_1202090 ) ) ( not ( = ?auto_1202088 ?auto_1202091 ) ) ( not ( = ?auto_1202088 ?auto_1202092 ) ) ( not ( = ?auto_1202089 ?auto_1202090 ) ) ( not ( = ?auto_1202089 ?auto_1202091 ) ) ( not ( = ?auto_1202089 ?auto_1202092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1202090 ?auto_1202091 ?auto_1202092 )
      ( MAKE-11CRATE-VERIFY ?auto_1202081 ?auto_1202082 ?auto_1202083 ?auto_1202085 ?auto_1202084 ?auto_1202086 ?auto_1202087 ?auto_1202088 ?auto_1202089 ?auto_1202090 ?auto_1202091 ?auto_1202092 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1202224 - SURFACE
      ?auto_1202225 - SURFACE
      ?auto_1202226 - SURFACE
      ?auto_1202228 - SURFACE
      ?auto_1202227 - SURFACE
      ?auto_1202229 - SURFACE
      ?auto_1202230 - SURFACE
      ?auto_1202231 - SURFACE
      ?auto_1202232 - SURFACE
      ?auto_1202233 - SURFACE
      ?auto_1202234 - SURFACE
      ?auto_1202235 - SURFACE
    )
    :vars
    (
      ?auto_1202239 - HOIST
      ?auto_1202241 - PLACE
      ?auto_1202236 - TRUCK
      ?auto_1202238 - PLACE
      ?auto_1202240 - HOIST
      ?auto_1202237 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1202239 ?auto_1202241 ) ( SURFACE-AT ?auto_1202234 ?auto_1202241 ) ( CLEAR ?auto_1202234 ) ( IS-CRATE ?auto_1202235 ) ( not ( = ?auto_1202234 ?auto_1202235 ) ) ( AVAILABLE ?auto_1202239 ) ( ON ?auto_1202234 ?auto_1202233 ) ( not ( = ?auto_1202233 ?auto_1202234 ) ) ( not ( = ?auto_1202233 ?auto_1202235 ) ) ( TRUCK-AT ?auto_1202236 ?auto_1202238 ) ( not ( = ?auto_1202238 ?auto_1202241 ) ) ( HOIST-AT ?auto_1202240 ?auto_1202238 ) ( not ( = ?auto_1202239 ?auto_1202240 ) ) ( AVAILABLE ?auto_1202240 ) ( SURFACE-AT ?auto_1202235 ?auto_1202238 ) ( ON ?auto_1202235 ?auto_1202237 ) ( CLEAR ?auto_1202235 ) ( not ( = ?auto_1202234 ?auto_1202237 ) ) ( not ( = ?auto_1202235 ?auto_1202237 ) ) ( not ( = ?auto_1202233 ?auto_1202237 ) ) ( ON ?auto_1202225 ?auto_1202224 ) ( ON ?auto_1202226 ?auto_1202225 ) ( ON ?auto_1202228 ?auto_1202226 ) ( ON ?auto_1202227 ?auto_1202228 ) ( ON ?auto_1202229 ?auto_1202227 ) ( ON ?auto_1202230 ?auto_1202229 ) ( ON ?auto_1202231 ?auto_1202230 ) ( ON ?auto_1202232 ?auto_1202231 ) ( ON ?auto_1202233 ?auto_1202232 ) ( not ( = ?auto_1202224 ?auto_1202225 ) ) ( not ( = ?auto_1202224 ?auto_1202226 ) ) ( not ( = ?auto_1202224 ?auto_1202228 ) ) ( not ( = ?auto_1202224 ?auto_1202227 ) ) ( not ( = ?auto_1202224 ?auto_1202229 ) ) ( not ( = ?auto_1202224 ?auto_1202230 ) ) ( not ( = ?auto_1202224 ?auto_1202231 ) ) ( not ( = ?auto_1202224 ?auto_1202232 ) ) ( not ( = ?auto_1202224 ?auto_1202233 ) ) ( not ( = ?auto_1202224 ?auto_1202234 ) ) ( not ( = ?auto_1202224 ?auto_1202235 ) ) ( not ( = ?auto_1202224 ?auto_1202237 ) ) ( not ( = ?auto_1202225 ?auto_1202226 ) ) ( not ( = ?auto_1202225 ?auto_1202228 ) ) ( not ( = ?auto_1202225 ?auto_1202227 ) ) ( not ( = ?auto_1202225 ?auto_1202229 ) ) ( not ( = ?auto_1202225 ?auto_1202230 ) ) ( not ( = ?auto_1202225 ?auto_1202231 ) ) ( not ( = ?auto_1202225 ?auto_1202232 ) ) ( not ( = ?auto_1202225 ?auto_1202233 ) ) ( not ( = ?auto_1202225 ?auto_1202234 ) ) ( not ( = ?auto_1202225 ?auto_1202235 ) ) ( not ( = ?auto_1202225 ?auto_1202237 ) ) ( not ( = ?auto_1202226 ?auto_1202228 ) ) ( not ( = ?auto_1202226 ?auto_1202227 ) ) ( not ( = ?auto_1202226 ?auto_1202229 ) ) ( not ( = ?auto_1202226 ?auto_1202230 ) ) ( not ( = ?auto_1202226 ?auto_1202231 ) ) ( not ( = ?auto_1202226 ?auto_1202232 ) ) ( not ( = ?auto_1202226 ?auto_1202233 ) ) ( not ( = ?auto_1202226 ?auto_1202234 ) ) ( not ( = ?auto_1202226 ?auto_1202235 ) ) ( not ( = ?auto_1202226 ?auto_1202237 ) ) ( not ( = ?auto_1202228 ?auto_1202227 ) ) ( not ( = ?auto_1202228 ?auto_1202229 ) ) ( not ( = ?auto_1202228 ?auto_1202230 ) ) ( not ( = ?auto_1202228 ?auto_1202231 ) ) ( not ( = ?auto_1202228 ?auto_1202232 ) ) ( not ( = ?auto_1202228 ?auto_1202233 ) ) ( not ( = ?auto_1202228 ?auto_1202234 ) ) ( not ( = ?auto_1202228 ?auto_1202235 ) ) ( not ( = ?auto_1202228 ?auto_1202237 ) ) ( not ( = ?auto_1202227 ?auto_1202229 ) ) ( not ( = ?auto_1202227 ?auto_1202230 ) ) ( not ( = ?auto_1202227 ?auto_1202231 ) ) ( not ( = ?auto_1202227 ?auto_1202232 ) ) ( not ( = ?auto_1202227 ?auto_1202233 ) ) ( not ( = ?auto_1202227 ?auto_1202234 ) ) ( not ( = ?auto_1202227 ?auto_1202235 ) ) ( not ( = ?auto_1202227 ?auto_1202237 ) ) ( not ( = ?auto_1202229 ?auto_1202230 ) ) ( not ( = ?auto_1202229 ?auto_1202231 ) ) ( not ( = ?auto_1202229 ?auto_1202232 ) ) ( not ( = ?auto_1202229 ?auto_1202233 ) ) ( not ( = ?auto_1202229 ?auto_1202234 ) ) ( not ( = ?auto_1202229 ?auto_1202235 ) ) ( not ( = ?auto_1202229 ?auto_1202237 ) ) ( not ( = ?auto_1202230 ?auto_1202231 ) ) ( not ( = ?auto_1202230 ?auto_1202232 ) ) ( not ( = ?auto_1202230 ?auto_1202233 ) ) ( not ( = ?auto_1202230 ?auto_1202234 ) ) ( not ( = ?auto_1202230 ?auto_1202235 ) ) ( not ( = ?auto_1202230 ?auto_1202237 ) ) ( not ( = ?auto_1202231 ?auto_1202232 ) ) ( not ( = ?auto_1202231 ?auto_1202233 ) ) ( not ( = ?auto_1202231 ?auto_1202234 ) ) ( not ( = ?auto_1202231 ?auto_1202235 ) ) ( not ( = ?auto_1202231 ?auto_1202237 ) ) ( not ( = ?auto_1202232 ?auto_1202233 ) ) ( not ( = ?auto_1202232 ?auto_1202234 ) ) ( not ( = ?auto_1202232 ?auto_1202235 ) ) ( not ( = ?auto_1202232 ?auto_1202237 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1202233 ?auto_1202234 ?auto_1202235 )
      ( MAKE-11CRATE-VERIFY ?auto_1202224 ?auto_1202225 ?auto_1202226 ?auto_1202228 ?auto_1202227 ?auto_1202229 ?auto_1202230 ?auto_1202231 ?auto_1202232 ?auto_1202233 ?auto_1202234 ?auto_1202235 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1202368 - SURFACE
      ?auto_1202369 - SURFACE
      ?auto_1202370 - SURFACE
      ?auto_1202372 - SURFACE
      ?auto_1202371 - SURFACE
      ?auto_1202373 - SURFACE
      ?auto_1202374 - SURFACE
      ?auto_1202375 - SURFACE
      ?auto_1202376 - SURFACE
      ?auto_1202377 - SURFACE
      ?auto_1202378 - SURFACE
      ?auto_1202379 - SURFACE
    )
    :vars
    (
      ?auto_1202384 - HOIST
      ?auto_1202383 - PLACE
      ?auto_1202382 - PLACE
      ?auto_1202380 - HOIST
      ?auto_1202381 - SURFACE
      ?auto_1202385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1202384 ?auto_1202383 ) ( SURFACE-AT ?auto_1202378 ?auto_1202383 ) ( CLEAR ?auto_1202378 ) ( IS-CRATE ?auto_1202379 ) ( not ( = ?auto_1202378 ?auto_1202379 ) ) ( AVAILABLE ?auto_1202384 ) ( ON ?auto_1202378 ?auto_1202377 ) ( not ( = ?auto_1202377 ?auto_1202378 ) ) ( not ( = ?auto_1202377 ?auto_1202379 ) ) ( not ( = ?auto_1202382 ?auto_1202383 ) ) ( HOIST-AT ?auto_1202380 ?auto_1202382 ) ( not ( = ?auto_1202384 ?auto_1202380 ) ) ( AVAILABLE ?auto_1202380 ) ( SURFACE-AT ?auto_1202379 ?auto_1202382 ) ( ON ?auto_1202379 ?auto_1202381 ) ( CLEAR ?auto_1202379 ) ( not ( = ?auto_1202378 ?auto_1202381 ) ) ( not ( = ?auto_1202379 ?auto_1202381 ) ) ( not ( = ?auto_1202377 ?auto_1202381 ) ) ( TRUCK-AT ?auto_1202385 ?auto_1202383 ) ( ON ?auto_1202369 ?auto_1202368 ) ( ON ?auto_1202370 ?auto_1202369 ) ( ON ?auto_1202372 ?auto_1202370 ) ( ON ?auto_1202371 ?auto_1202372 ) ( ON ?auto_1202373 ?auto_1202371 ) ( ON ?auto_1202374 ?auto_1202373 ) ( ON ?auto_1202375 ?auto_1202374 ) ( ON ?auto_1202376 ?auto_1202375 ) ( ON ?auto_1202377 ?auto_1202376 ) ( not ( = ?auto_1202368 ?auto_1202369 ) ) ( not ( = ?auto_1202368 ?auto_1202370 ) ) ( not ( = ?auto_1202368 ?auto_1202372 ) ) ( not ( = ?auto_1202368 ?auto_1202371 ) ) ( not ( = ?auto_1202368 ?auto_1202373 ) ) ( not ( = ?auto_1202368 ?auto_1202374 ) ) ( not ( = ?auto_1202368 ?auto_1202375 ) ) ( not ( = ?auto_1202368 ?auto_1202376 ) ) ( not ( = ?auto_1202368 ?auto_1202377 ) ) ( not ( = ?auto_1202368 ?auto_1202378 ) ) ( not ( = ?auto_1202368 ?auto_1202379 ) ) ( not ( = ?auto_1202368 ?auto_1202381 ) ) ( not ( = ?auto_1202369 ?auto_1202370 ) ) ( not ( = ?auto_1202369 ?auto_1202372 ) ) ( not ( = ?auto_1202369 ?auto_1202371 ) ) ( not ( = ?auto_1202369 ?auto_1202373 ) ) ( not ( = ?auto_1202369 ?auto_1202374 ) ) ( not ( = ?auto_1202369 ?auto_1202375 ) ) ( not ( = ?auto_1202369 ?auto_1202376 ) ) ( not ( = ?auto_1202369 ?auto_1202377 ) ) ( not ( = ?auto_1202369 ?auto_1202378 ) ) ( not ( = ?auto_1202369 ?auto_1202379 ) ) ( not ( = ?auto_1202369 ?auto_1202381 ) ) ( not ( = ?auto_1202370 ?auto_1202372 ) ) ( not ( = ?auto_1202370 ?auto_1202371 ) ) ( not ( = ?auto_1202370 ?auto_1202373 ) ) ( not ( = ?auto_1202370 ?auto_1202374 ) ) ( not ( = ?auto_1202370 ?auto_1202375 ) ) ( not ( = ?auto_1202370 ?auto_1202376 ) ) ( not ( = ?auto_1202370 ?auto_1202377 ) ) ( not ( = ?auto_1202370 ?auto_1202378 ) ) ( not ( = ?auto_1202370 ?auto_1202379 ) ) ( not ( = ?auto_1202370 ?auto_1202381 ) ) ( not ( = ?auto_1202372 ?auto_1202371 ) ) ( not ( = ?auto_1202372 ?auto_1202373 ) ) ( not ( = ?auto_1202372 ?auto_1202374 ) ) ( not ( = ?auto_1202372 ?auto_1202375 ) ) ( not ( = ?auto_1202372 ?auto_1202376 ) ) ( not ( = ?auto_1202372 ?auto_1202377 ) ) ( not ( = ?auto_1202372 ?auto_1202378 ) ) ( not ( = ?auto_1202372 ?auto_1202379 ) ) ( not ( = ?auto_1202372 ?auto_1202381 ) ) ( not ( = ?auto_1202371 ?auto_1202373 ) ) ( not ( = ?auto_1202371 ?auto_1202374 ) ) ( not ( = ?auto_1202371 ?auto_1202375 ) ) ( not ( = ?auto_1202371 ?auto_1202376 ) ) ( not ( = ?auto_1202371 ?auto_1202377 ) ) ( not ( = ?auto_1202371 ?auto_1202378 ) ) ( not ( = ?auto_1202371 ?auto_1202379 ) ) ( not ( = ?auto_1202371 ?auto_1202381 ) ) ( not ( = ?auto_1202373 ?auto_1202374 ) ) ( not ( = ?auto_1202373 ?auto_1202375 ) ) ( not ( = ?auto_1202373 ?auto_1202376 ) ) ( not ( = ?auto_1202373 ?auto_1202377 ) ) ( not ( = ?auto_1202373 ?auto_1202378 ) ) ( not ( = ?auto_1202373 ?auto_1202379 ) ) ( not ( = ?auto_1202373 ?auto_1202381 ) ) ( not ( = ?auto_1202374 ?auto_1202375 ) ) ( not ( = ?auto_1202374 ?auto_1202376 ) ) ( not ( = ?auto_1202374 ?auto_1202377 ) ) ( not ( = ?auto_1202374 ?auto_1202378 ) ) ( not ( = ?auto_1202374 ?auto_1202379 ) ) ( not ( = ?auto_1202374 ?auto_1202381 ) ) ( not ( = ?auto_1202375 ?auto_1202376 ) ) ( not ( = ?auto_1202375 ?auto_1202377 ) ) ( not ( = ?auto_1202375 ?auto_1202378 ) ) ( not ( = ?auto_1202375 ?auto_1202379 ) ) ( not ( = ?auto_1202375 ?auto_1202381 ) ) ( not ( = ?auto_1202376 ?auto_1202377 ) ) ( not ( = ?auto_1202376 ?auto_1202378 ) ) ( not ( = ?auto_1202376 ?auto_1202379 ) ) ( not ( = ?auto_1202376 ?auto_1202381 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1202377 ?auto_1202378 ?auto_1202379 )
      ( MAKE-11CRATE-VERIFY ?auto_1202368 ?auto_1202369 ?auto_1202370 ?auto_1202372 ?auto_1202371 ?auto_1202373 ?auto_1202374 ?auto_1202375 ?auto_1202376 ?auto_1202377 ?auto_1202378 ?auto_1202379 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1202512 - SURFACE
      ?auto_1202513 - SURFACE
      ?auto_1202514 - SURFACE
      ?auto_1202516 - SURFACE
      ?auto_1202515 - SURFACE
      ?auto_1202517 - SURFACE
      ?auto_1202518 - SURFACE
      ?auto_1202519 - SURFACE
      ?auto_1202520 - SURFACE
      ?auto_1202521 - SURFACE
      ?auto_1202522 - SURFACE
      ?auto_1202523 - SURFACE
    )
    :vars
    (
      ?auto_1202525 - HOIST
      ?auto_1202526 - PLACE
      ?auto_1202529 - PLACE
      ?auto_1202524 - HOIST
      ?auto_1202527 - SURFACE
      ?auto_1202528 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1202525 ?auto_1202526 ) ( IS-CRATE ?auto_1202523 ) ( not ( = ?auto_1202522 ?auto_1202523 ) ) ( not ( = ?auto_1202521 ?auto_1202522 ) ) ( not ( = ?auto_1202521 ?auto_1202523 ) ) ( not ( = ?auto_1202529 ?auto_1202526 ) ) ( HOIST-AT ?auto_1202524 ?auto_1202529 ) ( not ( = ?auto_1202525 ?auto_1202524 ) ) ( AVAILABLE ?auto_1202524 ) ( SURFACE-AT ?auto_1202523 ?auto_1202529 ) ( ON ?auto_1202523 ?auto_1202527 ) ( CLEAR ?auto_1202523 ) ( not ( = ?auto_1202522 ?auto_1202527 ) ) ( not ( = ?auto_1202523 ?auto_1202527 ) ) ( not ( = ?auto_1202521 ?auto_1202527 ) ) ( TRUCK-AT ?auto_1202528 ?auto_1202526 ) ( SURFACE-AT ?auto_1202521 ?auto_1202526 ) ( CLEAR ?auto_1202521 ) ( LIFTING ?auto_1202525 ?auto_1202522 ) ( IS-CRATE ?auto_1202522 ) ( ON ?auto_1202513 ?auto_1202512 ) ( ON ?auto_1202514 ?auto_1202513 ) ( ON ?auto_1202516 ?auto_1202514 ) ( ON ?auto_1202515 ?auto_1202516 ) ( ON ?auto_1202517 ?auto_1202515 ) ( ON ?auto_1202518 ?auto_1202517 ) ( ON ?auto_1202519 ?auto_1202518 ) ( ON ?auto_1202520 ?auto_1202519 ) ( ON ?auto_1202521 ?auto_1202520 ) ( not ( = ?auto_1202512 ?auto_1202513 ) ) ( not ( = ?auto_1202512 ?auto_1202514 ) ) ( not ( = ?auto_1202512 ?auto_1202516 ) ) ( not ( = ?auto_1202512 ?auto_1202515 ) ) ( not ( = ?auto_1202512 ?auto_1202517 ) ) ( not ( = ?auto_1202512 ?auto_1202518 ) ) ( not ( = ?auto_1202512 ?auto_1202519 ) ) ( not ( = ?auto_1202512 ?auto_1202520 ) ) ( not ( = ?auto_1202512 ?auto_1202521 ) ) ( not ( = ?auto_1202512 ?auto_1202522 ) ) ( not ( = ?auto_1202512 ?auto_1202523 ) ) ( not ( = ?auto_1202512 ?auto_1202527 ) ) ( not ( = ?auto_1202513 ?auto_1202514 ) ) ( not ( = ?auto_1202513 ?auto_1202516 ) ) ( not ( = ?auto_1202513 ?auto_1202515 ) ) ( not ( = ?auto_1202513 ?auto_1202517 ) ) ( not ( = ?auto_1202513 ?auto_1202518 ) ) ( not ( = ?auto_1202513 ?auto_1202519 ) ) ( not ( = ?auto_1202513 ?auto_1202520 ) ) ( not ( = ?auto_1202513 ?auto_1202521 ) ) ( not ( = ?auto_1202513 ?auto_1202522 ) ) ( not ( = ?auto_1202513 ?auto_1202523 ) ) ( not ( = ?auto_1202513 ?auto_1202527 ) ) ( not ( = ?auto_1202514 ?auto_1202516 ) ) ( not ( = ?auto_1202514 ?auto_1202515 ) ) ( not ( = ?auto_1202514 ?auto_1202517 ) ) ( not ( = ?auto_1202514 ?auto_1202518 ) ) ( not ( = ?auto_1202514 ?auto_1202519 ) ) ( not ( = ?auto_1202514 ?auto_1202520 ) ) ( not ( = ?auto_1202514 ?auto_1202521 ) ) ( not ( = ?auto_1202514 ?auto_1202522 ) ) ( not ( = ?auto_1202514 ?auto_1202523 ) ) ( not ( = ?auto_1202514 ?auto_1202527 ) ) ( not ( = ?auto_1202516 ?auto_1202515 ) ) ( not ( = ?auto_1202516 ?auto_1202517 ) ) ( not ( = ?auto_1202516 ?auto_1202518 ) ) ( not ( = ?auto_1202516 ?auto_1202519 ) ) ( not ( = ?auto_1202516 ?auto_1202520 ) ) ( not ( = ?auto_1202516 ?auto_1202521 ) ) ( not ( = ?auto_1202516 ?auto_1202522 ) ) ( not ( = ?auto_1202516 ?auto_1202523 ) ) ( not ( = ?auto_1202516 ?auto_1202527 ) ) ( not ( = ?auto_1202515 ?auto_1202517 ) ) ( not ( = ?auto_1202515 ?auto_1202518 ) ) ( not ( = ?auto_1202515 ?auto_1202519 ) ) ( not ( = ?auto_1202515 ?auto_1202520 ) ) ( not ( = ?auto_1202515 ?auto_1202521 ) ) ( not ( = ?auto_1202515 ?auto_1202522 ) ) ( not ( = ?auto_1202515 ?auto_1202523 ) ) ( not ( = ?auto_1202515 ?auto_1202527 ) ) ( not ( = ?auto_1202517 ?auto_1202518 ) ) ( not ( = ?auto_1202517 ?auto_1202519 ) ) ( not ( = ?auto_1202517 ?auto_1202520 ) ) ( not ( = ?auto_1202517 ?auto_1202521 ) ) ( not ( = ?auto_1202517 ?auto_1202522 ) ) ( not ( = ?auto_1202517 ?auto_1202523 ) ) ( not ( = ?auto_1202517 ?auto_1202527 ) ) ( not ( = ?auto_1202518 ?auto_1202519 ) ) ( not ( = ?auto_1202518 ?auto_1202520 ) ) ( not ( = ?auto_1202518 ?auto_1202521 ) ) ( not ( = ?auto_1202518 ?auto_1202522 ) ) ( not ( = ?auto_1202518 ?auto_1202523 ) ) ( not ( = ?auto_1202518 ?auto_1202527 ) ) ( not ( = ?auto_1202519 ?auto_1202520 ) ) ( not ( = ?auto_1202519 ?auto_1202521 ) ) ( not ( = ?auto_1202519 ?auto_1202522 ) ) ( not ( = ?auto_1202519 ?auto_1202523 ) ) ( not ( = ?auto_1202519 ?auto_1202527 ) ) ( not ( = ?auto_1202520 ?auto_1202521 ) ) ( not ( = ?auto_1202520 ?auto_1202522 ) ) ( not ( = ?auto_1202520 ?auto_1202523 ) ) ( not ( = ?auto_1202520 ?auto_1202527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1202521 ?auto_1202522 ?auto_1202523 )
      ( MAKE-11CRATE-VERIFY ?auto_1202512 ?auto_1202513 ?auto_1202514 ?auto_1202516 ?auto_1202515 ?auto_1202517 ?auto_1202518 ?auto_1202519 ?auto_1202520 ?auto_1202521 ?auto_1202522 ?auto_1202523 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1202656 - SURFACE
      ?auto_1202657 - SURFACE
      ?auto_1202658 - SURFACE
      ?auto_1202660 - SURFACE
      ?auto_1202659 - SURFACE
      ?auto_1202661 - SURFACE
      ?auto_1202662 - SURFACE
      ?auto_1202663 - SURFACE
      ?auto_1202664 - SURFACE
      ?auto_1202665 - SURFACE
      ?auto_1202666 - SURFACE
      ?auto_1202667 - SURFACE
    )
    :vars
    (
      ?auto_1202673 - HOIST
      ?auto_1202672 - PLACE
      ?auto_1202671 - PLACE
      ?auto_1202668 - HOIST
      ?auto_1202670 - SURFACE
      ?auto_1202669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1202673 ?auto_1202672 ) ( IS-CRATE ?auto_1202667 ) ( not ( = ?auto_1202666 ?auto_1202667 ) ) ( not ( = ?auto_1202665 ?auto_1202666 ) ) ( not ( = ?auto_1202665 ?auto_1202667 ) ) ( not ( = ?auto_1202671 ?auto_1202672 ) ) ( HOIST-AT ?auto_1202668 ?auto_1202671 ) ( not ( = ?auto_1202673 ?auto_1202668 ) ) ( AVAILABLE ?auto_1202668 ) ( SURFACE-AT ?auto_1202667 ?auto_1202671 ) ( ON ?auto_1202667 ?auto_1202670 ) ( CLEAR ?auto_1202667 ) ( not ( = ?auto_1202666 ?auto_1202670 ) ) ( not ( = ?auto_1202667 ?auto_1202670 ) ) ( not ( = ?auto_1202665 ?auto_1202670 ) ) ( TRUCK-AT ?auto_1202669 ?auto_1202672 ) ( SURFACE-AT ?auto_1202665 ?auto_1202672 ) ( CLEAR ?auto_1202665 ) ( IS-CRATE ?auto_1202666 ) ( AVAILABLE ?auto_1202673 ) ( IN ?auto_1202666 ?auto_1202669 ) ( ON ?auto_1202657 ?auto_1202656 ) ( ON ?auto_1202658 ?auto_1202657 ) ( ON ?auto_1202660 ?auto_1202658 ) ( ON ?auto_1202659 ?auto_1202660 ) ( ON ?auto_1202661 ?auto_1202659 ) ( ON ?auto_1202662 ?auto_1202661 ) ( ON ?auto_1202663 ?auto_1202662 ) ( ON ?auto_1202664 ?auto_1202663 ) ( ON ?auto_1202665 ?auto_1202664 ) ( not ( = ?auto_1202656 ?auto_1202657 ) ) ( not ( = ?auto_1202656 ?auto_1202658 ) ) ( not ( = ?auto_1202656 ?auto_1202660 ) ) ( not ( = ?auto_1202656 ?auto_1202659 ) ) ( not ( = ?auto_1202656 ?auto_1202661 ) ) ( not ( = ?auto_1202656 ?auto_1202662 ) ) ( not ( = ?auto_1202656 ?auto_1202663 ) ) ( not ( = ?auto_1202656 ?auto_1202664 ) ) ( not ( = ?auto_1202656 ?auto_1202665 ) ) ( not ( = ?auto_1202656 ?auto_1202666 ) ) ( not ( = ?auto_1202656 ?auto_1202667 ) ) ( not ( = ?auto_1202656 ?auto_1202670 ) ) ( not ( = ?auto_1202657 ?auto_1202658 ) ) ( not ( = ?auto_1202657 ?auto_1202660 ) ) ( not ( = ?auto_1202657 ?auto_1202659 ) ) ( not ( = ?auto_1202657 ?auto_1202661 ) ) ( not ( = ?auto_1202657 ?auto_1202662 ) ) ( not ( = ?auto_1202657 ?auto_1202663 ) ) ( not ( = ?auto_1202657 ?auto_1202664 ) ) ( not ( = ?auto_1202657 ?auto_1202665 ) ) ( not ( = ?auto_1202657 ?auto_1202666 ) ) ( not ( = ?auto_1202657 ?auto_1202667 ) ) ( not ( = ?auto_1202657 ?auto_1202670 ) ) ( not ( = ?auto_1202658 ?auto_1202660 ) ) ( not ( = ?auto_1202658 ?auto_1202659 ) ) ( not ( = ?auto_1202658 ?auto_1202661 ) ) ( not ( = ?auto_1202658 ?auto_1202662 ) ) ( not ( = ?auto_1202658 ?auto_1202663 ) ) ( not ( = ?auto_1202658 ?auto_1202664 ) ) ( not ( = ?auto_1202658 ?auto_1202665 ) ) ( not ( = ?auto_1202658 ?auto_1202666 ) ) ( not ( = ?auto_1202658 ?auto_1202667 ) ) ( not ( = ?auto_1202658 ?auto_1202670 ) ) ( not ( = ?auto_1202660 ?auto_1202659 ) ) ( not ( = ?auto_1202660 ?auto_1202661 ) ) ( not ( = ?auto_1202660 ?auto_1202662 ) ) ( not ( = ?auto_1202660 ?auto_1202663 ) ) ( not ( = ?auto_1202660 ?auto_1202664 ) ) ( not ( = ?auto_1202660 ?auto_1202665 ) ) ( not ( = ?auto_1202660 ?auto_1202666 ) ) ( not ( = ?auto_1202660 ?auto_1202667 ) ) ( not ( = ?auto_1202660 ?auto_1202670 ) ) ( not ( = ?auto_1202659 ?auto_1202661 ) ) ( not ( = ?auto_1202659 ?auto_1202662 ) ) ( not ( = ?auto_1202659 ?auto_1202663 ) ) ( not ( = ?auto_1202659 ?auto_1202664 ) ) ( not ( = ?auto_1202659 ?auto_1202665 ) ) ( not ( = ?auto_1202659 ?auto_1202666 ) ) ( not ( = ?auto_1202659 ?auto_1202667 ) ) ( not ( = ?auto_1202659 ?auto_1202670 ) ) ( not ( = ?auto_1202661 ?auto_1202662 ) ) ( not ( = ?auto_1202661 ?auto_1202663 ) ) ( not ( = ?auto_1202661 ?auto_1202664 ) ) ( not ( = ?auto_1202661 ?auto_1202665 ) ) ( not ( = ?auto_1202661 ?auto_1202666 ) ) ( not ( = ?auto_1202661 ?auto_1202667 ) ) ( not ( = ?auto_1202661 ?auto_1202670 ) ) ( not ( = ?auto_1202662 ?auto_1202663 ) ) ( not ( = ?auto_1202662 ?auto_1202664 ) ) ( not ( = ?auto_1202662 ?auto_1202665 ) ) ( not ( = ?auto_1202662 ?auto_1202666 ) ) ( not ( = ?auto_1202662 ?auto_1202667 ) ) ( not ( = ?auto_1202662 ?auto_1202670 ) ) ( not ( = ?auto_1202663 ?auto_1202664 ) ) ( not ( = ?auto_1202663 ?auto_1202665 ) ) ( not ( = ?auto_1202663 ?auto_1202666 ) ) ( not ( = ?auto_1202663 ?auto_1202667 ) ) ( not ( = ?auto_1202663 ?auto_1202670 ) ) ( not ( = ?auto_1202664 ?auto_1202665 ) ) ( not ( = ?auto_1202664 ?auto_1202666 ) ) ( not ( = ?auto_1202664 ?auto_1202667 ) ) ( not ( = ?auto_1202664 ?auto_1202670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1202665 ?auto_1202666 ?auto_1202667 )
      ( MAKE-11CRATE-VERIFY ?auto_1202656 ?auto_1202657 ?auto_1202658 ?auto_1202660 ?auto_1202659 ?auto_1202661 ?auto_1202662 ?auto_1202663 ?auto_1202664 ?auto_1202665 ?auto_1202666 ?auto_1202667 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1203741 - SURFACE
      ?auto_1203742 - SURFACE
    )
    :vars
    (
      ?auto_1203746 - HOIST
      ?auto_1203745 - PLACE
      ?auto_1203749 - SURFACE
      ?auto_1203747 - PLACE
      ?auto_1203748 - HOIST
      ?auto_1203744 - SURFACE
      ?auto_1203743 - TRUCK
      ?auto_1203750 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1203746 ?auto_1203745 ) ( SURFACE-AT ?auto_1203741 ?auto_1203745 ) ( CLEAR ?auto_1203741 ) ( IS-CRATE ?auto_1203742 ) ( not ( = ?auto_1203741 ?auto_1203742 ) ) ( ON ?auto_1203741 ?auto_1203749 ) ( not ( = ?auto_1203749 ?auto_1203741 ) ) ( not ( = ?auto_1203749 ?auto_1203742 ) ) ( not ( = ?auto_1203747 ?auto_1203745 ) ) ( HOIST-AT ?auto_1203748 ?auto_1203747 ) ( not ( = ?auto_1203746 ?auto_1203748 ) ) ( AVAILABLE ?auto_1203748 ) ( SURFACE-AT ?auto_1203742 ?auto_1203747 ) ( ON ?auto_1203742 ?auto_1203744 ) ( CLEAR ?auto_1203742 ) ( not ( = ?auto_1203741 ?auto_1203744 ) ) ( not ( = ?auto_1203742 ?auto_1203744 ) ) ( not ( = ?auto_1203749 ?auto_1203744 ) ) ( TRUCK-AT ?auto_1203743 ?auto_1203745 ) ( LIFTING ?auto_1203746 ?auto_1203750 ) ( IS-CRATE ?auto_1203750 ) ( not ( = ?auto_1203741 ?auto_1203750 ) ) ( not ( = ?auto_1203742 ?auto_1203750 ) ) ( not ( = ?auto_1203749 ?auto_1203750 ) ) ( not ( = ?auto_1203744 ?auto_1203750 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1203746 ?auto_1203750 ?auto_1203743 ?auto_1203745 )
      ( MAKE-1CRATE ?auto_1203741 ?auto_1203742 )
      ( MAKE-1CRATE-VERIFY ?auto_1203741 ?auto_1203742 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1211925 - SURFACE
      ?auto_1211926 - SURFACE
      ?auto_1211927 - SURFACE
      ?auto_1211929 - SURFACE
      ?auto_1211928 - SURFACE
      ?auto_1211930 - SURFACE
      ?auto_1211931 - SURFACE
      ?auto_1211932 - SURFACE
      ?auto_1211933 - SURFACE
      ?auto_1211934 - SURFACE
      ?auto_1211935 - SURFACE
      ?auto_1211936 - SURFACE
      ?auto_1211937 - SURFACE
    )
    :vars
    (
      ?auto_1211939 - HOIST
      ?auto_1211938 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1211939 ?auto_1211938 ) ( SURFACE-AT ?auto_1211936 ?auto_1211938 ) ( CLEAR ?auto_1211936 ) ( LIFTING ?auto_1211939 ?auto_1211937 ) ( IS-CRATE ?auto_1211937 ) ( not ( = ?auto_1211936 ?auto_1211937 ) ) ( ON ?auto_1211926 ?auto_1211925 ) ( ON ?auto_1211927 ?auto_1211926 ) ( ON ?auto_1211929 ?auto_1211927 ) ( ON ?auto_1211928 ?auto_1211929 ) ( ON ?auto_1211930 ?auto_1211928 ) ( ON ?auto_1211931 ?auto_1211930 ) ( ON ?auto_1211932 ?auto_1211931 ) ( ON ?auto_1211933 ?auto_1211932 ) ( ON ?auto_1211934 ?auto_1211933 ) ( ON ?auto_1211935 ?auto_1211934 ) ( ON ?auto_1211936 ?auto_1211935 ) ( not ( = ?auto_1211925 ?auto_1211926 ) ) ( not ( = ?auto_1211925 ?auto_1211927 ) ) ( not ( = ?auto_1211925 ?auto_1211929 ) ) ( not ( = ?auto_1211925 ?auto_1211928 ) ) ( not ( = ?auto_1211925 ?auto_1211930 ) ) ( not ( = ?auto_1211925 ?auto_1211931 ) ) ( not ( = ?auto_1211925 ?auto_1211932 ) ) ( not ( = ?auto_1211925 ?auto_1211933 ) ) ( not ( = ?auto_1211925 ?auto_1211934 ) ) ( not ( = ?auto_1211925 ?auto_1211935 ) ) ( not ( = ?auto_1211925 ?auto_1211936 ) ) ( not ( = ?auto_1211925 ?auto_1211937 ) ) ( not ( = ?auto_1211926 ?auto_1211927 ) ) ( not ( = ?auto_1211926 ?auto_1211929 ) ) ( not ( = ?auto_1211926 ?auto_1211928 ) ) ( not ( = ?auto_1211926 ?auto_1211930 ) ) ( not ( = ?auto_1211926 ?auto_1211931 ) ) ( not ( = ?auto_1211926 ?auto_1211932 ) ) ( not ( = ?auto_1211926 ?auto_1211933 ) ) ( not ( = ?auto_1211926 ?auto_1211934 ) ) ( not ( = ?auto_1211926 ?auto_1211935 ) ) ( not ( = ?auto_1211926 ?auto_1211936 ) ) ( not ( = ?auto_1211926 ?auto_1211937 ) ) ( not ( = ?auto_1211927 ?auto_1211929 ) ) ( not ( = ?auto_1211927 ?auto_1211928 ) ) ( not ( = ?auto_1211927 ?auto_1211930 ) ) ( not ( = ?auto_1211927 ?auto_1211931 ) ) ( not ( = ?auto_1211927 ?auto_1211932 ) ) ( not ( = ?auto_1211927 ?auto_1211933 ) ) ( not ( = ?auto_1211927 ?auto_1211934 ) ) ( not ( = ?auto_1211927 ?auto_1211935 ) ) ( not ( = ?auto_1211927 ?auto_1211936 ) ) ( not ( = ?auto_1211927 ?auto_1211937 ) ) ( not ( = ?auto_1211929 ?auto_1211928 ) ) ( not ( = ?auto_1211929 ?auto_1211930 ) ) ( not ( = ?auto_1211929 ?auto_1211931 ) ) ( not ( = ?auto_1211929 ?auto_1211932 ) ) ( not ( = ?auto_1211929 ?auto_1211933 ) ) ( not ( = ?auto_1211929 ?auto_1211934 ) ) ( not ( = ?auto_1211929 ?auto_1211935 ) ) ( not ( = ?auto_1211929 ?auto_1211936 ) ) ( not ( = ?auto_1211929 ?auto_1211937 ) ) ( not ( = ?auto_1211928 ?auto_1211930 ) ) ( not ( = ?auto_1211928 ?auto_1211931 ) ) ( not ( = ?auto_1211928 ?auto_1211932 ) ) ( not ( = ?auto_1211928 ?auto_1211933 ) ) ( not ( = ?auto_1211928 ?auto_1211934 ) ) ( not ( = ?auto_1211928 ?auto_1211935 ) ) ( not ( = ?auto_1211928 ?auto_1211936 ) ) ( not ( = ?auto_1211928 ?auto_1211937 ) ) ( not ( = ?auto_1211930 ?auto_1211931 ) ) ( not ( = ?auto_1211930 ?auto_1211932 ) ) ( not ( = ?auto_1211930 ?auto_1211933 ) ) ( not ( = ?auto_1211930 ?auto_1211934 ) ) ( not ( = ?auto_1211930 ?auto_1211935 ) ) ( not ( = ?auto_1211930 ?auto_1211936 ) ) ( not ( = ?auto_1211930 ?auto_1211937 ) ) ( not ( = ?auto_1211931 ?auto_1211932 ) ) ( not ( = ?auto_1211931 ?auto_1211933 ) ) ( not ( = ?auto_1211931 ?auto_1211934 ) ) ( not ( = ?auto_1211931 ?auto_1211935 ) ) ( not ( = ?auto_1211931 ?auto_1211936 ) ) ( not ( = ?auto_1211931 ?auto_1211937 ) ) ( not ( = ?auto_1211932 ?auto_1211933 ) ) ( not ( = ?auto_1211932 ?auto_1211934 ) ) ( not ( = ?auto_1211932 ?auto_1211935 ) ) ( not ( = ?auto_1211932 ?auto_1211936 ) ) ( not ( = ?auto_1211932 ?auto_1211937 ) ) ( not ( = ?auto_1211933 ?auto_1211934 ) ) ( not ( = ?auto_1211933 ?auto_1211935 ) ) ( not ( = ?auto_1211933 ?auto_1211936 ) ) ( not ( = ?auto_1211933 ?auto_1211937 ) ) ( not ( = ?auto_1211934 ?auto_1211935 ) ) ( not ( = ?auto_1211934 ?auto_1211936 ) ) ( not ( = ?auto_1211934 ?auto_1211937 ) ) ( not ( = ?auto_1211935 ?auto_1211936 ) ) ( not ( = ?auto_1211935 ?auto_1211937 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1211936 ?auto_1211937 )
      ( MAKE-12CRATE-VERIFY ?auto_1211925 ?auto_1211926 ?auto_1211927 ?auto_1211929 ?auto_1211928 ?auto_1211930 ?auto_1211931 ?auto_1211932 ?auto_1211933 ?auto_1211934 ?auto_1211935 ?auto_1211936 ?auto_1211937 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1212050 - SURFACE
      ?auto_1212051 - SURFACE
      ?auto_1212052 - SURFACE
      ?auto_1212054 - SURFACE
      ?auto_1212053 - SURFACE
      ?auto_1212055 - SURFACE
      ?auto_1212056 - SURFACE
      ?auto_1212057 - SURFACE
      ?auto_1212058 - SURFACE
      ?auto_1212059 - SURFACE
      ?auto_1212060 - SURFACE
      ?auto_1212061 - SURFACE
      ?auto_1212062 - SURFACE
    )
    :vars
    (
      ?auto_1212064 - HOIST
      ?auto_1212065 - PLACE
      ?auto_1212063 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1212064 ?auto_1212065 ) ( SURFACE-AT ?auto_1212061 ?auto_1212065 ) ( CLEAR ?auto_1212061 ) ( IS-CRATE ?auto_1212062 ) ( not ( = ?auto_1212061 ?auto_1212062 ) ) ( TRUCK-AT ?auto_1212063 ?auto_1212065 ) ( AVAILABLE ?auto_1212064 ) ( IN ?auto_1212062 ?auto_1212063 ) ( ON ?auto_1212061 ?auto_1212060 ) ( not ( = ?auto_1212060 ?auto_1212061 ) ) ( not ( = ?auto_1212060 ?auto_1212062 ) ) ( ON ?auto_1212051 ?auto_1212050 ) ( ON ?auto_1212052 ?auto_1212051 ) ( ON ?auto_1212054 ?auto_1212052 ) ( ON ?auto_1212053 ?auto_1212054 ) ( ON ?auto_1212055 ?auto_1212053 ) ( ON ?auto_1212056 ?auto_1212055 ) ( ON ?auto_1212057 ?auto_1212056 ) ( ON ?auto_1212058 ?auto_1212057 ) ( ON ?auto_1212059 ?auto_1212058 ) ( ON ?auto_1212060 ?auto_1212059 ) ( not ( = ?auto_1212050 ?auto_1212051 ) ) ( not ( = ?auto_1212050 ?auto_1212052 ) ) ( not ( = ?auto_1212050 ?auto_1212054 ) ) ( not ( = ?auto_1212050 ?auto_1212053 ) ) ( not ( = ?auto_1212050 ?auto_1212055 ) ) ( not ( = ?auto_1212050 ?auto_1212056 ) ) ( not ( = ?auto_1212050 ?auto_1212057 ) ) ( not ( = ?auto_1212050 ?auto_1212058 ) ) ( not ( = ?auto_1212050 ?auto_1212059 ) ) ( not ( = ?auto_1212050 ?auto_1212060 ) ) ( not ( = ?auto_1212050 ?auto_1212061 ) ) ( not ( = ?auto_1212050 ?auto_1212062 ) ) ( not ( = ?auto_1212051 ?auto_1212052 ) ) ( not ( = ?auto_1212051 ?auto_1212054 ) ) ( not ( = ?auto_1212051 ?auto_1212053 ) ) ( not ( = ?auto_1212051 ?auto_1212055 ) ) ( not ( = ?auto_1212051 ?auto_1212056 ) ) ( not ( = ?auto_1212051 ?auto_1212057 ) ) ( not ( = ?auto_1212051 ?auto_1212058 ) ) ( not ( = ?auto_1212051 ?auto_1212059 ) ) ( not ( = ?auto_1212051 ?auto_1212060 ) ) ( not ( = ?auto_1212051 ?auto_1212061 ) ) ( not ( = ?auto_1212051 ?auto_1212062 ) ) ( not ( = ?auto_1212052 ?auto_1212054 ) ) ( not ( = ?auto_1212052 ?auto_1212053 ) ) ( not ( = ?auto_1212052 ?auto_1212055 ) ) ( not ( = ?auto_1212052 ?auto_1212056 ) ) ( not ( = ?auto_1212052 ?auto_1212057 ) ) ( not ( = ?auto_1212052 ?auto_1212058 ) ) ( not ( = ?auto_1212052 ?auto_1212059 ) ) ( not ( = ?auto_1212052 ?auto_1212060 ) ) ( not ( = ?auto_1212052 ?auto_1212061 ) ) ( not ( = ?auto_1212052 ?auto_1212062 ) ) ( not ( = ?auto_1212054 ?auto_1212053 ) ) ( not ( = ?auto_1212054 ?auto_1212055 ) ) ( not ( = ?auto_1212054 ?auto_1212056 ) ) ( not ( = ?auto_1212054 ?auto_1212057 ) ) ( not ( = ?auto_1212054 ?auto_1212058 ) ) ( not ( = ?auto_1212054 ?auto_1212059 ) ) ( not ( = ?auto_1212054 ?auto_1212060 ) ) ( not ( = ?auto_1212054 ?auto_1212061 ) ) ( not ( = ?auto_1212054 ?auto_1212062 ) ) ( not ( = ?auto_1212053 ?auto_1212055 ) ) ( not ( = ?auto_1212053 ?auto_1212056 ) ) ( not ( = ?auto_1212053 ?auto_1212057 ) ) ( not ( = ?auto_1212053 ?auto_1212058 ) ) ( not ( = ?auto_1212053 ?auto_1212059 ) ) ( not ( = ?auto_1212053 ?auto_1212060 ) ) ( not ( = ?auto_1212053 ?auto_1212061 ) ) ( not ( = ?auto_1212053 ?auto_1212062 ) ) ( not ( = ?auto_1212055 ?auto_1212056 ) ) ( not ( = ?auto_1212055 ?auto_1212057 ) ) ( not ( = ?auto_1212055 ?auto_1212058 ) ) ( not ( = ?auto_1212055 ?auto_1212059 ) ) ( not ( = ?auto_1212055 ?auto_1212060 ) ) ( not ( = ?auto_1212055 ?auto_1212061 ) ) ( not ( = ?auto_1212055 ?auto_1212062 ) ) ( not ( = ?auto_1212056 ?auto_1212057 ) ) ( not ( = ?auto_1212056 ?auto_1212058 ) ) ( not ( = ?auto_1212056 ?auto_1212059 ) ) ( not ( = ?auto_1212056 ?auto_1212060 ) ) ( not ( = ?auto_1212056 ?auto_1212061 ) ) ( not ( = ?auto_1212056 ?auto_1212062 ) ) ( not ( = ?auto_1212057 ?auto_1212058 ) ) ( not ( = ?auto_1212057 ?auto_1212059 ) ) ( not ( = ?auto_1212057 ?auto_1212060 ) ) ( not ( = ?auto_1212057 ?auto_1212061 ) ) ( not ( = ?auto_1212057 ?auto_1212062 ) ) ( not ( = ?auto_1212058 ?auto_1212059 ) ) ( not ( = ?auto_1212058 ?auto_1212060 ) ) ( not ( = ?auto_1212058 ?auto_1212061 ) ) ( not ( = ?auto_1212058 ?auto_1212062 ) ) ( not ( = ?auto_1212059 ?auto_1212060 ) ) ( not ( = ?auto_1212059 ?auto_1212061 ) ) ( not ( = ?auto_1212059 ?auto_1212062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1212060 ?auto_1212061 ?auto_1212062 )
      ( MAKE-12CRATE-VERIFY ?auto_1212050 ?auto_1212051 ?auto_1212052 ?auto_1212054 ?auto_1212053 ?auto_1212055 ?auto_1212056 ?auto_1212057 ?auto_1212058 ?auto_1212059 ?auto_1212060 ?auto_1212061 ?auto_1212062 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1212188 - SURFACE
      ?auto_1212189 - SURFACE
      ?auto_1212190 - SURFACE
      ?auto_1212192 - SURFACE
      ?auto_1212191 - SURFACE
      ?auto_1212193 - SURFACE
      ?auto_1212194 - SURFACE
      ?auto_1212195 - SURFACE
      ?auto_1212196 - SURFACE
      ?auto_1212197 - SURFACE
      ?auto_1212198 - SURFACE
      ?auto_1212199 - SURFACE
      ?auto_1212200 - SURFACE
    )
    :vars
    (
      ?auto_1212202 - HOIST
      ?auto_1212201 - PLACE
      ?auto_1212203 - TRUCK
      ?auto_1212204 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1212202 ?auto_1212201 ) ( SURFACE-AT ?auto_1212199 ?auto_1212201 ) ( CLEAR ?auto_1212199 ) ( IS-CRATE ?auto_1212200 ) ( not ( = ?auto_1212199 ?auto_1212200 ) ) ( AVAILABLE ?auto_1212202 ) ( IN ?auto_1212200 ?auto_1212203 ) ( ON ?auto_1212199 ?auto_1212198 ) ( not ( = ?auto_1212198 ?auto_1212199 ) ) ( not ( = ?auto_1212198 ?auto_1212200 ) ) ( TRUCK-AT ?auto_1212203 ?auto_1212204 ) ( not ( = ?auto_1212204 ?auto_1212201 ) ) ( ON ?auto_1212189 ?auto_1212188 ) ( ON ?auto_1212190 ?auto_1212189 ) ( ON ?auto_1212192 ?auto_1212190 ) ( ON ?auto_1212191 ?auto_1212192 ) ( ON ?auto_1212193 ?auto_1212191 ) ( ON ?auto_1212194 ?auto_1212193 ) ( ON ?auto_1212195 ?auto_1212194 ) ( ON ?auto_1212196 ?auto_1212195 ) ( ON ?auto_1212197 ?auto_1212196 ) ( ON ?auto_1212198 ?auto_1212197 ) ( not ( = ?auto_1212188 ?auto_1212189 ) ) ( not ( = ?auto_1212188 ?auto_1212190 ) ) ( not ( = ?auto_1212188 ?auto_1212192 ) ) ( not ( = ?auto_1212188 ?auto_1212191 ) ) ( not ( = ?auto_1212188 ?auto_1212193 ) ) ( not ( = ?auto_1212188 ?auto_1212194 ) ) ( not ( = ?auto_1212188 ?auto_1212195 ) ) ( not ( = ?auto_1212188 ?auto_1212196 ) ) ( not ( = ?auto_1212188 ?auto_1212197 ) ) ( not ( = ?auto_1212188 ?auto_1212198 ) ) ( not ( = ?auto_1212188 ?auto_1212199 ) ) ( not ( = ?auto_1212188 ?auto_1212200 ) ) ( not ( = ?auto_1212189 ?auto_1212190 ) ) ( not ( = ?auto_1212189 ?auto_1212192 ) ) ( not ( = ?auto_1212189 ?auto_1212191 ) ) ( not ( = ?auto_1212189 ?auto_1212193 ) ) ( not ( = ?auto_1212189 ?auto_1212194 ) ) ( not ( = ?auto_1212189 ?auto_1212195 ) ) ( not ( = ?auto_1212189 ?auto_1212196 ) ) ( not ( = ?auto_1212189 ?auto_1212197 ) ) ( not ( = ?auto_1212189 ?auto_1212198 ) ) ( not ( = ?auto_1212189 ?auto_1212199 ) ) ( not ( = ?auto_1212189 ?auto_1212200 ) ) ( not ( = ?auto_1212190 ?auto_1212192 ) ) ( not ( = ?auto_1212190 ?auto_1212191 ) ) ( not ( = ?auto_1212190 ?auto_1212193 ) ) ( not ( = ?auto_1212190 ?auto_1212194 ) ) ( not ( = ?auto_1212190 ?auto_1212195 ) ) ( not ( = ?auto_1212190 ?auto_1212196 ) ) ( not ( = ?auto_1212190 ?auto_1212197 ) ) ( not ( = ?auto_1212190 ?auto_1212198 ) ) ( not ( = ?auto_1212190 ?auto_1212199 ) ) ( not ( = ?auto_1212190 ?auto_1212200 ) ) ( not ( = ?auto_1212192 ?auto_1212191 ) ) ( not ( = ?auto_1212192 ?auto_1212193 ) ) ( not ( = ?auto_1212192 ?auto_1212194 ) ) ( not ( = ?auto_1212192 ?auto_1212195 ) ) ( not ( = ?auto_1212192 ?auto_1212196 ) ) ( not ( = ?auto_1212192 ?auto_1212197 ) ) ( not ( = ?auto_1212192 ?auto_1212198 ) ) ( not ( = ?auto_1212192 ?auto_1212199 ) ) ( not ( = ?auto_1212192 ?auto_1212200 ) ) ( not ( = ?auto_1212191 ?auto_1212193 ) ) ( not ( = ?auto_1212191 ?auto_1212194 ) ) ( not ( = ?auto_1212191 ?auto_1212195 ) ) ( not ( = ?auto_1212191 ?auto_1212196 ) ) ( not ( = ?auto_1212191 ?auto_1212197 ) ) ( not ( = ?auto_1212191 ?auto_1212198 ) ) ( not ( = ?auto_1212191 ?auto_1212199 ) ) ( not ( = ?auto_1212191 ?auto_1212200 ) ) ( not ( = ?auto_1212193 ?auto_1212194 ) ) ( not ( = ?auto_1212193 ?auto_1212195 ) ) ( not ( = ?auto_1212193 ?auto_1212196 ) ) ( not ( = ?auto_1212193 ?auto_1212197 ) ) ( not ( = ?auto_1212193 ?auto_1212198 ) ) ( not ( = ?auto_1212193 ?auto_1212199 ) ) ( not ( = ?auto_1212193 ?auto_1212200 ) ) ( not ( = ?auto_1212194 ?auto_1212195 ) ) ( not ( = ?auto_1212194 ?auto_1212196 ) ) ( not ( = ?auto_1212194 ?auto_1212197 ) ) ( not ( = ?auto_1212194 ?auto_1212198 ) ) ( not ( = ?auto_1212194 ?auto_1212199 ) ) ( not ( = ?auto_1212194 ?auto_1212200 ) ) ( not ( = ?auto_1212195 ?auto_1212196 ) ) ( not ( = ?auto_1212195 ?auto_1212197 ) ) ( not ( = ?auto_1212195 ?auto_1212198 ) ) ( not ( = ?auto_1212195 ?auto_1212199 ) ) ( not ( = ?auto_1212195 ?auto_1212200 ) ) ( not ( = ?auto_1212196 ?auto_1212197 ) ) ( not ( = ?auto_1212196 ?auto_1212198 ) ) ( not ( = ?auto_1212196 ?auto_1212199 ) ) ( not ( = ?auto_1212196 ?auto_1212200 ) ) ( not ( = ?auto_1212197 ?auto_1212198 ) ) ( not ( = ?auto_1212197 ?auto_1212199 ) ) ( not ( = ?auto_1212197 ?auto_1212200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1212198 ?auto_1212199 ?auto_1212200 )
      ( MAKE-12CRATE-VERIFY ?auto_1212188 ?auto_1212189 ?auto_1212190 ?auto_1212192 ?auto_1212191 ?auto_1212193 ?auto_1212194 ?auto_1212195 ?auto_1212196 ?auto_1212197 ?auto_1212198 ?auto_1212199 ?auto_1212200 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1212338 - SURFACE
      ?auto_1212339 - SURFACE
      ?auto_1212340 - SURFACE
      ?auto_1212342 - SURFACE
      ?auto_1212341 - SURFACE
      ?auto_1212343 - SURFACE
      ?auto_1212344 - SURFACE
      ?auto_1212345 - SURFACE
      ?auto_1212346 - SURFACE
      ?auto_1212347 - SURFACE
      ?auto_1212348 - SURFACE
      ?auto_1212349 - SURFACE
      ?auto_1212350 - SURFACE
    )
    :vars
    (
      ?auto_1212351 - HOIST
      ?auto_1212352 - PLACE
      ?auto_1212354 - TRUCK
      ?auto_1212353 - PLACE
      ?auto_1212355 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1212351 ?auto_1212352 ) ( SURFACE-AT ?auto_1212349 ?auto_1212352 ) ( CLEAR ?auto_1212349 ) ( IS-CRATE ?auto_1212350 ) ( not ( = ?auto_1212349 ?auto_1212350 ) ) ( AVAILABLE ?auto_1212351 ) ( ON ?auto_1212349 ?auto_1212348 ) ( not ( = ?auto_1212348 ?auto_1212349 ) ) ( not ( = ?auto_1212348 ?auto_1212350 ) ) ( TRUCK-AT ?auto_1212354 ?auto_1212353 ) ( not ( = ?auto_1212353 ?auto_1212352 ) ) ( HOIST-AT ?auto_1212355 ?auto_1212353 ) ( LIFTING ?auto_1212355 ?auto_1212350 ) ( not ( = ?auto_1212351 ?auto_1212355 ) ) ( ON ?auto_1212339 ?auto_1212338 ) ( ON ?auto_1212340 ?auto_1212339 ) ( ON ?auto_1212342 ?auto_1212340 ) ( ON ?auto_1212341 ?auto_1212342 ) ( ON ?auto_1212343 ?auto_1212341 ) ( ON ?auto_1212344 ?auto_1212343 ) ( ON ?auto_1212345 ?auto_1212344 ) ( ON ?auto_1212346 ?auto_1212345 ) ( ON ?auto_1212347 ?auto_1212346 ) ( ON ?auto_1212348 ?auto_1212347 ) ( not ( = ?auto_1212338 ?auto_1212339 ) ) ( not ( = ?auto_1212338 ?auto_1212340 ) ) ( not ( = ?auto_1212338 ?auto_1212342 ) ) ( not ( = ?auto_1212338 ?auto_1212341 ) ) ( not ( = ?auto_1212338 ?auto_1212343 ) ) ( not ( = ?auto_1212338 ?auto_1212344 ) ) ( not ( = ?auto_1212338 ?auto_1212345 ) ) ( not ( = ?auto_1212338 ?auto_1212346 ) ) ( not ( = ?auto_1212338 ?auto_1212347 ) ) ( not ( = ?auto_1212338 ?auto_1212348 ) ) ( not ( = ?auto_1212338 ?auto_1212349 ) ) ( not ( = ?auto_1212338 ?auto_1212350 ) ) ( not ( = ?auto_1212339 ?auto_1212340 ) ) ( not ( = ?auto_1212339 ?auto_1212342 ) ) ( not ( = ?auto_1212339 ?auto_1212341 ) ) ( not ( = ?auto_1212339 ?auto_1212343 ) ) ( not ( = ?auto_1212339 ?auto_1212344 ) ) ( not ( = ?auto_1212339 ?auto_1212345 ) ) ( not ( = ?auto_1212339 ?auto_1212346 ) ) ( not ( = ?auto_1212339 ?auto_1212347 ) ) ( not ( = ?auto_1212339 ?auto_1212348 ) ) ( not ( = ?auto_1212339 ?auto_1212349 ) ) ( not ( = ?auto_1212339 ?auto_1212350 ) ) ( not ( = ?auto_1212340 ?auto_1212342 ) ) ( not ( = ?auto_1212340 ?auto_1212341 ) ) ( not ( = ?auto_1212340 ?auto_1212343 ) ) ( not ( = ?auto_1212340 ?auto_1212344 ) ) ( not ( = ?auto_1212340 ?auto_1212345 ) ) ( not ( = ?auto_1212340 ?auto_1212346 ) ) ( not ( = ?auto_1212340 ?auto_1212347 ) ) ( not ( = ?auto_1212340 ?auto_1212348 ) ) ( not ( = ?auto_1212340 ?auto_1212349 ) ) ( not ( = ?auto_1212340 ?auto_1212350 ) ) ( not ( = ?auto_1212342 ?auto_1212341 ) ) ( not ( = ?auto_1212342 ?auto_1212343 ) ) ( not ( = ?auto_1212342 ?auto_1212344 ) ) ( not ( = ?auto_1212342 ?auto_1212345 ) ) ( not ( = ?auto_1212342 ?auto_1212346 ) ) ( not ( = ?auto_1212342 ?auto_1212347 ) ) ( not ( = ?auto_1212342 ?auto_1212348 ) ) ( not ( = ?auto_1212342 ?auto_1212349 ) ) ( not ( = ?auto_1212342 ?auto_1212350 ) ) ( not ( = ?auto_1212341 ?auto_1212343 ) ) ( not ( = ?auto_1212341 ?auto_1212344 ) ) ( not ( = ?auto_1212341 ?auto_1212345 ) ) ( not ( = ?auto_1212341 ?auto_1212346 ) ) ( not ( = ?auto_1212341 ?auto_1212347 ) ) ( not ( = ?auto_1212341 ?auto_1212348 ) ) ( not ( = ?auto_1212341 ?auto_1212349 ) ) ( not ( = ?auto_1212341 ?auto_1212350 ) ) ( not ( = ?auto_1212343 ?auto_1212344 ) ) ( not ( = ?auto_1212343 ?auto_1212345 ) ) ( not ( = ?auto_1212343 ?auto_1212346 ) ) ( not ( = ?auto_1212343 ?auto_1212347 ) ) ( not ( = ?auto_1212343 ?auto_1212348 ) ) ( not ( = ?auto_1212343 ?auto_1212349 ) ) ( not ( = ?auto_1212343 ?auto_1212350 ) ) ( not ( = ?auto_1212344 ?auto_1212345 ) ) ( not ( = ?auto_1212344 ?auto_1212346 ) ) ( not ( = ?auto_1212344 ?auto_1212347 ) ) ( not ( = ?auto_1212344 ?auto_1212348 ) ) ( not ( = ?auto_1212344 ?auto_1212349 ) ) ( not ( = ?auto_1212344 ?auto_1212350 ) ) ( not ( = ?auto_1212345 ?auto_1212346 ) ) ( not ( = ?auto_1212345 ?auto_1212347 ) ) ( not ( = ?auto_1212345 ?auto_1212348 ) ) ( not ( = ?auto_1212345 ?auto_1212349 ) ) ( not ( = ?auto_1212345 ?auto_1212350 ) ) ( not ( = ?auto_1212346 ?auto_1212347 ) ) ( not ( = ?auto_1212346 ?auto_1212348 ) ) ( not ( = ?auto_1212346 ?auto_1212349 ) ) ( not ( = ?auto_1212346 ?auto_1212350 ) ) ( not ( = ?auto_1212347 ?auto_1212348 ) ) ( not ( = ?auto_1212347 ?auto_1212349 ) ) ( not ( = ?auto_1212347 ?auto_1212350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1212348 ?auto_1212349 ?auto_1212350 )
      ( MAKE-12CRATE-VERIFY ?auto_1212338 ?auto_1212339 ?auto_1212340 ?auto_1212342 ?auto_1212341 ?auto_1212343 ?auto_1212344 ?auto_1212345 ?auto_1212346 ?auto_1212347 ?auto_1212348 ?auto_1212349 ?auto_1212350 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1212500 - SURFACE
      ?auto_1212501 - SURFACE
      ?auto_1212502 - SURFACE
      ?auto_1212504 - SURFACE
      ?auto_1212503 - SURFACE
      ?auto_1212505 - SURFACE
      ?auto_1212506 - SURFACE
      ?auto_1212507 - SURFACE
      ?auto_1212508 - SURFACE
      ?auto_1212509 - SURFACE
      ?auto_1212510 - SURFACE
      ?auto_1212511 - SURFACE
      ?auto_1212512 - SURFACE
    )
    :vars
    (
      ?auto_1212514 - HOIST
      ?auto_1212513 - PLACE
      ?auto_1212517 - TRUCK
      ?auto_1212518 - PLACE
      ?auto_1212515 - HOIST
      ?auto_1212516 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1212514 ?auto_1212513 ) ( SURFACE-AT ?auto_1212511 ?auto_1212513 ) ( CLEAR ?auto_1212511 ) ( IS-CRATE ?auto_1212512 ) ( not ( = ?auto_1212511 ?auto_1212512 ) ) ( AVAILABLE ?auto_1212514 ) ( ON ?auto_1212511 ?auto_1212510 ) ( not ( = ?auto_1212510 ?auto_1212511 ) ) ( not ( = ?auto_1212510 ?auto_1212512 ) ) ( TRUCK-AT ?auto_1212517 ?auto_1212518 ) ( not ( = ?auto_1212518 ?auto_1212513 ) ) ( HOIST-AT ?auto_1212515 ?auto_1212518 ) ( not ( = ?auto_1212514 ?auto_1212515 ) ) ( AVAILABLE ?auto_1212515 ) ( SURFACE-AT ?auto_1212512 ?auto_1212518 ) ( ON ?auto_1212512 ?auto_1212516 ) ( CLEAR ?auto_1212512 ) ( not ( = ?auto_1212511 ?auto_1212516 ) ) ( not ( = ?auto_1212512 ?auto_1212516 ) ) ( not ( = ?auto_1212510 ?auto_1212516 ) ) ( ON ?auto_1212501 ?auto_1212500 ) ( ON ?auto_1212502 ?auto_1212501 ) ( ON ?auto_1212504 ?auto_1212502 ) ( ON ?auto_1212503 ?auto_1212504 ) ( ON ?auto_1212505 ?auto_1212503 ) ( ON ?auto_1212506 ?auto_1212505 ) ( ON ?auto_1212507 ?auto_1212506 ) ( ON ?auto_1212508 ?auto_1212507 ) ( ON ?auto_1212509 ?auto_1212508 ) ( ON ?auto_1212510 ?auto_1212509 ) ( not ( = ?auto_1212500 ?auto_1212501 ) ) ( not ( = ?auto_1212500 ?auto_1212502 ) ) ( not ( = ?auto_1212500 ?auto_1212504 ) ) ( not ( = ?auto_1212500 ?auto_1212503 ) ) ( not ( = ?auto_1212500 ?auto_1212505 ) ) ( not ( = ?auto_1212500 ?auto_1212506 ) ) ( not ( = ?auto_1212500 ?auto_1212507 ) ) ( not ( = ?auto_1212500 ?auto_1212508 ) ) ( not ( = ?auto_1212500 ?auto_1212509 ) ) ( not ( = ?auto_1212500 ?auto_1212510 ) ) ( not ( = ?auto_1212500 ?auto_1212511 ) ) ( not ( = ?auto_1212500 ?auto_1212512 ) ) ( not ( = ?auto_1212500 ?auto_1212516 ) ) ( not ( = ?auto_1212501 ?auto_1212502 ) ) ( not ( = ?auto_1212501 ?auto_1212504 ) ) ( not ( = ?auto_1212501 ?auto_1212503 ) ) ( not ( = ?auto_1212501 ?auto_1212505 ) ) ( not ( = ?auto_1212501 ?auto_1212506 ) ) ( not ( = ?auto_1212501 ?auto_1212507 ) ) ( not ( = ?auto_1212501 ?auto_1212508 ) ) ( not ( = ?auto_1212501 ?auto_1212509 ) ) ( not ( = ?auto_1212501 ?auto_1212510 ) ) ( not ( = ?auto_1212501 ?auto_1212511 ) ) ( not ( = ?auto_1212501 ?auto_1212512 ) ) ( not ( = ?auto_1212501 ?auto_1212516 ) ) ( not ( = ?auto_1212502 ?auto_1212504 ) ) ( not ( = ?auto_1212502 ?auto_1212503 ) ) ( not ( = ?auto_1212502 ?auto_1212505 ) ) ( not ( = ?auto_1212502 ?auto_1212506 ) ) ( not ( = ?auto_1212502 ?auto_1212507 ) ) ( not ( = ?auto_1212502 ?auto_1212508 ) ) ( not ( = ?auto_1212502 ?auto_1212509 ) ) ( not ( = ?auto_1212502 ?auto_1212510 ) ) ( not ( = ?auto_1212502 ?auto_1212511 ) ) ( not ( = ?auto_1212502 ?auto_1212512 ) ) ( not ( = ?auto_1212502 ?auto_1212516 ) ) ( not ( = ?auto_1212504 ?auto_1212503 ) ) ( not ( = ?auto_1212504 ?auto_1212505 ) ) ( not ( = ?auto_1212504 ?auto_1212506 ) ) ( not ( = ?auto_1212504 ?auto_1212507 ) ) ( not ( = ?auto_1212504 ?auto_1212508 ) ) ( not ( = ?auto_1212504 ?auto_1212509 ) ) ( not ( = ?auto_1212504 ?auto_1212510 ) ) ( not ( = ?auto_1212504 ?auto_1212511 ) ) ( not ( = ?auto_1212504 ?auto_1212512 ) ) ( not ( = ?auto_1212504 ?auto_1212516 ) ) ( not ( = ?auto_1212503 ?auto_1212505 ) ) ( not ( = ?auto_1212503 ?auto_1212506 ) ) ( not ( = ?auto_1212503 ?auto_1212507 ) ) ( not ( = ?auto_1212503 ?auto_1212508 ) ) ( not ( = ?auto_1212503 ?auto_1212509 ) ) ( not ( = ?auto_1212503 ?auto_1212510 ) ) ( not ( = ?auto_1212503 ?auto_1212511 ) ) ( not ( = ?auto_1212503 ?auto_1212512 ) ) ( not ( = ?auto_1212503 ?auto_1212516 ) ) ( not ( = ?auto_1212505 ?auto_1212506 ) ) ( not ( = ?auto_1212505 ?auto_1212507 ) ) ( not ( = ?auto_1212505 ?auto_1212508 ) ) ( not ( = ?auto_1212505 ?auto_1212509 ) ) ( not ( = ?auto_1212505 ?auto_1212510 ) ) ( not ( = ?auto_1212505 ?auto_1212511 ) ) ( not ( = ?auto_1212505 ?auto_1212512 ) ) ( not ( = ?auto_1212505 ?auto_1212516 ) ) ( not ( = ?auto_1212506 ?auto_1212507 ) ) ( not ( = ?auto_1212506 ?auto_1212508 ) ) ( not ( = ?auto_1212506 ?auto_1212509 ) ) ( not ( = ?auto_1212506 ?auto_1212510 ) ) ( not ( = ?auto_1212506 ?auto_1212511 ) ) ( not ( = ?auto_1212506 ?auto_1212512 ) ) ( not ( = ?auto_1212506 ?auto_1212516 ) ) ( not ( = ?auto_1212507 ?auto_1212508 ) ) ( not ( = ?auto_1212507 ?auto_1212509 ) ) ( not ( = ?auto_1212507 ?auto_1212510 ) ) ( not ( = ?auto_1212507 ?auto_1212511 ) ) ( not ( = ?auto_1212507 ?auto_1212512 ) ) ( not ( = ?auto_1212507 ?auto_1212516 ) ) ( not ( = ?auto_1212508 ?auto_1212509 ) ) ( not ( = ?auto_1212508 ?auto_1212510 ) ) ( not ( = ?auto_1212508 ?auto_1212511 ) ) ( not ( = ?auto_1212508 ?auto_1212512 ) ) ( not ( = ?auto_1212508 ?auto_1212516 ) ) ( not ( = ?auto_1212509 ?auto_1212510 ) ) ( not ( = ?auto_1212509 ?auto_1212511 ) ) ( not ( = ?auto_1212509 ?auto_1212512 ) ) ( not ( = ?auto_1212509 ?auto_1212516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1212510 ?auto_1212511 ?auto_1212512 )
      ( MAKE-12CRATE-VERIFY ?auto_1212500 ?auto_1212501 ?auto_1212502 ?auto_1212504 ?auto_1212503 ?auto_1212505 ?auto_1212506 ?auto_1212507 ?auto_1212508 ?auto_1212509 ?auto_1212510 ?auto_1212511 ?auto_1212512 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1212663 - SURFACE
      ?auto_1212664 - SURFACE
      ?auto_1212665 - SURFACE
      ?auto_1212667 - SURFACE
      ?auto_1212666 - SURFACE
      ?auto_1212668 - SURFACE
      ?auto_1212669 - SURFACE
      ?auto_1212670 - SURFACE
      ?auto_1212671 - SURFACE
      ?auto_1212672 - SURFACE
      ?auto_1212673 - SURFACE
      ?auto_1212674 - SURFACE
      ?auto_1212675 - SURFACE
    )
    :vars
    (
      ?auto_1212676 - HOIST
      ?auto_1212680 - PLACE
      ?auto_1212677 - PLACE
      ?auto_1212679 - HOIST
      ?auto_1212681 - SURFACE
      ?auto_1212678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1212676 ?auto_1212680 ) ( SURFACE-AT ?auto_1212674 ?auto_1212680 ) ( CLEAR ?auto_1212674 ) ( IS-CRATE ?auto_1212675 ) ( not ( = ?auto_1212674 ?auto_1212675 ) ) ( AVAILABLE ?auto_1212676 ) ( ON ?auto_1212674 ?auto_1212673 ) ( not ( = ?auto_1212673 ?auto_1212674 ) ) ( not ( = ?auto_1212673 ?auto_1212675 ) ) ( not ( = ?auto_1212677 ?auto_1212680 ) ) ( HOIST-AT ?auto_1212679 ?auto_1212677 ) ( not ( = ?auto_1212676 ?auto_1212679 ) ) ( AVAILABLE ?auto_1212679 ) ( SURFACE-AT ?auto_1212675 ?auto_1212677 ) ( ON ?auto_1212675 ?auto_1212681 ) ( CLEAR ?auto_1212675 ) ( not ( = ?auto_1212674 ?auto_1212681 ) ) ( not ( = ?auto_1212675 ?auto_1212681 ) ) ( not ( = ?auto_1212673 ?auto_1212681 ) ) ( TRUCK-AT ?auto_1212678 ?auto_1212680 ) ( ON ?auto_1212664 ?auto_1212663 ) ( ON ?auto_1212665 ?auto_1212664 ) ( ON ?auto_1212667 ?auto_1212665 ) ( ON ?auto_1212666 ?auto_1212667 ) ( ON ?auto_1212668 ?auto_1212666 ) ( ON ?auto_1212669 ?auto_1212668 ) ( ON ?auto_1212670 ?auto_1212669 ) ( ON ?auto_1212671 ?auto_1212670 ) ( ON ?auto_1212672 ?auto_1212671 ) ( ON ?auto_1212673 ?auto_1212672 ) ( not ( = ?auto_1212663 ?auto_1212664 ) ) ( not ( = ?auto_1212663 ?auto_1212665 ) ) ( not ( = ?auto_1212663 ?auto_1212667 ) ) ( not ( = ?auto_1212663 ?auto_1212666 ) ) ( not ( = ?auto_1212663 ?auto_1212668 ) ) ( not ( = ?auto_1212663 ?auto_1212669 ) ) ( not ( = ?auto_1212663 ?auto_1212670 ) ) ( not ( = ?auto_1212663 ?auto_1212671 ) ) ( not ( = ?auto_1212663 ?auto_1212672 ) ) ( not ( = ?auto_1212663 ?auto_1212673 ) ) ( not ( = ?auto_1212663 ?auto_1212674 ) ) ( not ( = ?auto_1212663 ?auto_1212675 ) ) ( not ( = ?auto_1212663 ?auto_1212681 ) ) ( not ( = ?auto_1212664 ?auto_1212665 ) ) ( not ( = ?auto_1212664 ?auto_1212667 ) ) ( not ( = ?auto_1212664 ?auto_1212666 ) ) ( not ( = ?auto_1212664 ?auto_1212668 ) ) ( not ( = ?auto_1212664 ?auto_1212669 ) ) ( not ( = ?auto_1212664 ?auto_1212670 ) ) ( not ( = ?auto_1212664 ?auto_1212671 ) ) ( not ( = ?auto_1212664 ?auto_1212672 ) ) ( not ( = ?auto_1212664 ?auto_1212673 ) ) ( not ( = ?auto_1212664 ?auto_1212674 ) ) ( not ( = ?auto_1212664 ?auto_1212675 ) ) ( not ( = ?auto_1212664 ?auto_1212681 ) ) ( not ( = ?auto_1212665 ?auto_1212667 ) ) ( not ( = ?auto_1212665 ?auto_1212666 ) ) ( not ( = ?auto_1212665 ?auto_1212668 ) ) ( not ( = ?auto_1212665 ?auto_1212669 ) ) ( not ( = ?auto_1212665 ?auto_1212670 ) ) ( not ( = ?auto_1212665 ?auto_1212671 ) ) ( not ( = ?auto_1212665 ?auto_1212672 ) ) ( not ( = ?auto_1212665 ?auto_1212673 ) ) ( not ( = ?auto_1212665 ?auto_1212674 ) ) ( not ( = ?auto_1212665 ?auto_1212675 ) ) ( not ( = ?auto_1212665 ?auto_1212681 ) ) ( not ( = ?auto_1212667 ?auto_1212666 ) ) ( not ( = ?auto_1212667 ?auto_1212668 ) ) ( not ( = ?auto_1212667 ?auto_1212669 ) ) ( not ( = ?auto_1212667 ?auto_1212670 ) ) ( not ( = ?auto_1212667 ?auto_1212671 ) ) ( not ( = ?auto_1212667 ?auto_1212672 ) ) ( not ( = ?auto_1212667 ?auto_1212673 ) ) ( not ( = ?auto_1212667 ?auto_1212674 ) ) ( not ( = ?auto_1212667 ?auto_1212675 ) ) ( not ( = ?auto_1212667 ?auto_1212681 ) ) ( not ( = ?auto_1212666 ?auto_1212668 ) ) ( not ( = ?auto_1212666 ?auto_1212669 ) ) ( not ( = ?auto_1212666 ?auto_1212670 ) ) ( not ( = ?auto_1212666 ?auto_1212671 ) ) ( not ( = ?auto_1212666 ?auto_1212672 ) ) ( not ( = ?auto_1212666 ?auto_1212673 ) ) ( not ( = ?auto_1212666 ?auto_1212674 ) ) ( not ( = ?auto_1212666 ?auto_1212675 ) ) ( not ( = ?auto_1212666 ?auto_1212681 ) ) ( not ( = ?auto_1212668 ?auto_1212669 ) ) ( not ( = ?auto_1212668 ?auto_1212670 ) ) ( not ( = ?auto_1212668 ?auto_1212671 ) ) ( not ( = ?auto_1212668 ?auto_1212672 ) ) ( not ( = ?auto_1212668 ?auto_1212673 ) ) ( not ( = ?auto_1212668 ?auto_1212674 ) ) ( not ( = ?auto_1212668 ?auto_1212675 ) ) ( not ( = ?auto_1212668 ?auto_1212681 ) ) ( not ( = ?auto_1212669 ?auto_1212670 ) ) ( not ( = ?auto_1212669 ?auto_1212671 ) ) ( not ( = ?auto_1212669 ?auto_1212672 ) ) ( not ( = ?auto_1212669 ?auto_1212673 ) ) ( not ( = ?auto_1212669 ?auto_1212674 ) ) ( not ( = ?auto_1212669 ?auto_1212675 ) ) ( not ( = ?auto_1212669 ?auto_1212681 ) ) ( not ( = ?auto_1212670 ?auto_1212671 ) ) ( not ( = ?auto_1212670 ?auto_1212672 ) ) ( not ( = ?auto_1212670 ?auto_1212673 ) ) ( not ( = ?auto_1212670 ?auto_1212674 ) ) ( not ( = ?auto_1212670 ?auto_1212675 ) ) ( not ( = ?auto_1212670 ?auto_1212681 ) ) ( not ( = ?auto_1212671 ?auto_1212672 ) ) ( not ( = ?auto_1212671 ?auto_1212673 ) ) ( not ( = ?auto_1212671 ?auto_1212674 ) ) ( not ( = ?auto_1212671 ?auto_1212675 ) ) ( not ( = ?auto_1212671 ?auto_1212681 ) ) ( not ( = ?auto_1212672 ?auto_1212673 ) ) ( not ( = ?auto_1212672 ?auto_1212674 ) ) ( not ( = ?auto_1212672 ?auto_1212675 ) ) ( not ( = ?auto_1212672 ?auto_1212681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1212673 ?auto_1212674 ?auto_1212675 )
      ( MAKE-12CRATE-VERIFY ?auto_1212663 ?auto_1212664 ?auto_1212665 ?auto_1212667 ?auto_1212666 ?auto_1212668 ?auto_1212669 ?auto_1212670 ?auto_1212671 ?auto_1212672 ?auto_1212673 ?auto_1212674 ?auto_1212675 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1212826 - SURFACE
      ?auto_1212827 - SURFACE
      ?auto_1212828 - SURFACE
      ?auto_1212830 - SURFACE
      ?auto_1212829 - SURFACE
      ?auto_1212831 - SURFACE
      ?auto_1212832 - SURFACE
      ?auto_1212833 - SURFACE
      ?auto_1212834 - SURFACE
      ?auto_1212835 - SURFACE
      ?auto_1212836 - SURFACE
      ?auto_1212837 - SURFACE
      ?auto_1212838 - SURFACE
    )
    :vars
    (
      ?auto_1212841 - HOIST
      ?auto_1212839 - PLACE
      ?auto_1212840 - PLACE
      ?auto_1212842 - HOIST
      ?auto_1212843 - SURFACE
      ?auto_1212844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1212841 ?auto_1212839 ) ( IS-CRATE ?auto_1212838 ) ( not ( = ?auto_1212837 ?auto_1212838 ) ) ( not ( = ?auto_1212836 ?auto_1212837 ) ) ( not ( = ?auto_1212836 ?auto_1212838 ) ) ( not ( = ?auto_1212840 ?auto_1212839 ) ) ( HOIST-AT ?auto_1212842 ?auto_1212840 ) ( not ( = ?auto_1212841 ?auto_1212842 ) ) ( AVAILABLE ?auto_1212842 ) ( SURFACE-AT ?auto_1212838 ?auto_1212840 ) ( ON ?auto_1212838 ?auto_1212843 ) ( CLEAR ?auto_1212838 ) ( not ( = ?auto_1212837 ?auto_1212843 ) ) ( not ( = ?auto_1212838 ?auto_1212843 ) ) ( not ( = ?auto_1212836 ?auto_1212843 ) ) ( TRUCK-AT ?auto_1212844 ?auto_1212839 ) ( SURFACE-AT ?auto_1212836 ?auto_1212839 ) ( CLEAR ?auto_1212836 ) ( LIFTING ?auto_1212841 ?auto_1212837 ) ( IS-CRATE ?auto_1212837 ) ( ON ?auto_1212827 ?auto_1212826 ) ( ON ?auto_1212828 ?auto_1212827 ) ( ON ?auto_1212830 ?auto_1212828 ) ( ON ?auto_1212829 ?auto_1212830 ) ( ON ?auto_1212831 ?auto_1212829 ) ( ON ?auto_1212832 ?auto_1212831 ) ( ON ?auto_1212833 ?auto_1212832 ) ( ON ?auto_1212834 ?auto_1212833 ) ( ON ?auto_1212835 ?auto_1212834 ) ( ON ?auto_1212836 ?auto_1212835 ) ( not ( = ?auto_1212826 ?auto_1212827 ) ) ( not ( = ?auto_1212826 ?auto_1212828 ) ) ( not ( = ?auto_1212826 ?auto_1212830 ) ) ( not ( = ?auto_1212826 ?auto_1212829 ) ) ( not ( = ?auto_1212826 ?auto_1212831 ) ) ( not ( = ?auto_1212826 ?auto_1212832 ) ) ( not ( = ?auto_1212826 ?auto_1212833 ) ) ( not ( = ?auto_1212826 ?auto_1212834 ) ) ( not ( = ?auto_1212826 ?auto_1212835 ) ) ( not ( = ?auto_1212826 ?auto_1212836 ) ) ( not ( = ?auto_1212826 ?auto_1212837 ) ) ( not ( = ?auto_1212826 ?auto_1212838 ) ) ( not ( = ?auto_1212826 ?auto_1212843 ) ) ( not ( = ?auto_1212827 ?auto_1212828 ) ) ( not ( = ?auto_1212827 ?auto_1212830 ) ) ( not ( = ?auto_1212827 ?auto_1212829 ) ) ( not ( = ?auto_1212827 ?auto_1212831 ) ) ( not ( = ?auto_1212827 ?auto_1212832 ) ) ( not ( = ?auto_1212827 ?auto_1212833 ) ) ( not ( = ?auto_1212827 ?auto_1212834 ) ) ( not ( = ?auto_1212827 ?auto_1212835 ) ) ( not ( = ?auto_1212827 ?auto_1212836 ) ) ( not ( = ?auto_1212827 ?auto_1212837 ) ) ( not ( = ?auto_1212827 ?auto_1212838 ) ) ( not ( = ?auto_1212827 ?auto_1212843 ) ) ( not ( = ?auto_1212828 ?auto_1212830 ) ) ( not ( = ?auto_1212828 ?auto_1212829 ) ) ( not ( = ?auto_1212828 ?auto_1212831 ) ) ( not ( = ?auto_1212828 ?auto_1212832 ) ) ( not ( = ?auto_1212828 ?auto_1212833 ) ) ( not ( = ?auto_1212828 ?auto_1212834 ) ) ( not ( = ?auto_1212828 ?auto_1212835 ) ) ( not ( = ?auto_1212828 ?auto_1212836 ) ) ( not ( = ?auto_1212828 ?auto_1212837 ) ) ( not ( = ?auto_1212828 ?auto_1212838 ) ) ( not ( = ?auto_1212828 ?auto_1212843 ) ) ( not ( = ?auto_1212830 ?auto_1212829 ) ) ( not ( = ?auto_1212830 ?auto_1212831 ) ) ( not ( = ?auto_1212830 ?auto_1212832 ) ) ( not ( = ?auto_1212830 ?auto_1212833 ) ) ( not ( = ?auto_1212830 ?auto_1212834 ) ) ( not ( = ?auto_1212830 ?auto_1212835 ) ) ( not ( = ?auto_1212830 ?auto_1212836 ) ) ( not ( = ?auto_1212830 ?auto_1212837 ) ) ( not ( = ?auto_1212830 ?auto_1212838 ) ) ( not ( = ?auto_1212830 ?auto_1212843 ) ) ( not ( = ?auto_1212829 ?auto_1212831 ) ) ( not ( = ?auto_1212829 ?auto_1212832 ) ) ( not ( = ?auto_1212829 ?auto_1212833 ) ) ( not ( = ?auto_1212829 ?auto_1212834 ) ) ( not ( = ?auto_1212829 ?auto_1212835 ) ) ( not ( = ?auto_1212829 ?auto_1212836 ) ) ( not ( = ?auto_1212829 ?auto_1212837 ) ) ( not ( = ?auto_1212829 ?auto_1212838 ) ) ( not ( = ?auto_1212829 ?auto_1212843 ) ) ( not ( = ?auto_1212831 ?auto_1212832 ) ) ( not ( = ?auto_1212831 ?auto_1212833 ) ) ( not ( = ?auto_1212831 ?auto_1212834 ) ) ( not ( = ?auto_1212831 ?auto_1212835 ) ) ( not ( = ?auto_1212831 ?auto_1212836 ) ) ( not ( = ?auto_1212831 ?auto_1212837 ) ) ( not ( = ?auto_1212831 ?auto_1212838 ) ) ( not ( = ?auto_1212831 ?auto_1212843 ) ) ( not ( = ?auto_1212832 ?auto_1212833 ) ) ( not ( = ?auto_1212832 ?auto_1212834 ) ) ( not ( = ?auto_1212832 ?auto_1212835 ) ) ( not ( = ?auto_1212832 ?auto_1212836 ) ) ( not ( = ?auto_1212832 ?auto_1212837 ) ) ( not ( = ?auto_1212832 ?auto_1212838 ) ) ( not ( = ?auto_1212832 ?auto_1212843 ) ) ( not ( = ?auto_1212833 ?auto_1212834 ) ) ( not ( = ?auto_1212833 ?auto_1212835 ) ) ( not ( = ?auto_1212833 ?auto_1212836 ) ) ( not ( = ?auto_1212833 ?auto_1212837 ) ) ( not ( = ?auto_1212833 ?auto_1212838 ) ) ( not ( = ?auto_1212833 ?auto_1212843 ) ) ( not ( = ?auto_1212834 ?auto_1212835 ) ) ( not ( = ?auto_1212834 ?auto_1212836 ) ) ( not ( = ?auto_1212834 ?auto_1212837 ) ) ( not ( = ?auto_1212834 ?auto_1212838 ) ) ( not ( = ?auto_1212834 ?auto_1212843 ) ) ( not ( = ?auto_1212835 ?auto_1212836 ) ) ( not ( = ?auto_1212835 ?auto_1212837 ) ) ( not ( = ?auto_1212835 ?auto_1212838 ) ) ( not ( = ?auto_1212835 ?auto_1212843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1212836 ?auto_1212837 ?auto_1212838 )
      ( MAKE-12CRATE-VERIFY ?auto_1212826 ?auto_1212827 ?auto_1212828 ?auto_1212830 ?auto_1212829 ?auto_1212831 ?auto_1212832 ?auto_1212833 ?auto_1212834 ?auto_1212835 ?auto_1212836 ?auto_1212837 ?auto_1212838 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1212989 - SURFACE
      ?auto_1212990 - SURFACE
      ?auto_1212991 - SURFACE
      ?auto_1212993 - SURFACE
      ?auto_1212992 - SURFACE
      ?auto_1212994 - SURFACE
      ?auto_1212995 - SURFACE
      ?auto_1212996 - SURFACE
      ?auto_1212997 - SURFACE
      ?auto_1212998 - SURFACE
      ?auto_1212999 - SURFACE
      ?auto_1213000 - SURFACE
      ?auto_1213001 - SURFACE
    )
    :vars
    (
      ?auto_1213002 - HOIST
      ?auto_1213004 - PLACE
      ?auto_1213003 - PLACE
      ?auto_1213005 - HOIST
      ?auto_1213006 - SURFACE
      ?auto_1213007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213002 ?auto_1213004 ) ( IS-CRATE ?auto_1213001 ) ( not ( = ?auto_1213000 ?auto_1213001 ) ) ( not ( = ?auto_1212999 ?auto_1213000 ) ) ( not ( = ?auto_1212999 ?auto_1213001 ) ) ( not ( = ?auto_1213003 ?auto_1213004 ) ) ( HOIST-AT ?auto_1213005 ?auto_1213003 ) ( not ( = ?auto_1213002 ?auto_1213005 ) ) ( AVAILABLE ?auto_1213005 ) ( SURFACE-AT ?auto_1213001 ?auto_1213003 ) ( ON ?auto_1213001 ?auto_1213006 ) ( CLEAR ?auto_1213001 ) ( not ( = ?auto_1213000 ?auto_1213006 ) ) ( not ( = ?auto_1213001 ?auto_1213006 ) ) ( not ( = ?auto_1212999 ?auto_1213006 ) ) ( TRUCK-AT ?auto_1213007 ?auto_1213004 ) ( SURFACE-AT ?auto_1212999 ?auto_1213004 ) ( CLEAR ?auto_1212999 ) ( IS-CRATE ?auto_1213000 ) ( AVAILABLE ?auto_1213002 ) ( IN ?auto_1213000 ?auto_1213007 ) ( ON ?auto_1212990 ?auto_1212989 ) ( ON ?auto_1212991 ?auto_1212990 ) ( ON ?auto_1212993 ?auto_1212991 ) ( ON ?auto_1212992 ?auto_1212993 ) ( ON ?auto_1212994 ?auto_1212992 ) ( ON ?auto_1212995 ?auto_1212994 ) ( ON ?auto_1212996 ?auto_1212995 ) ( ON ?auto_1212997 ?auto_1212996 ) ( ON ?auto_1212998 ?auto_1212997 ) ( ON ?auto_1212999 ?auto_1212998 ) ( not ( = ?auto_1212989 ?auto_1212990 ) ) ( not ( = ?auto_1212989 ?auto_1212991 ) ) ( not ( = ?auto_1212989 ?auto_1212993 ) ) ( not ( = ?auto_1212989 ?auto_1212992 ) ) ( not ( = ?auto_1212989 ?auto_1212994 ) ) ( not ( = ?auto_1212989 ?auto_1212995 ) ) ( not ( = ?auto_1212989 ?auto_1212996 ) ) ( not ( = ?auto_1212989 ?auto_1212997 ) ) ( not ( = ?auto_1212989 ?auto_1212998 ) ) ( not ( = ?auto_1212989 ?auto_1212999 ) ) ( not ( = ?auto_1212989 ?auto_1213000 ) ) ( not ( = ?auto_1212989 ?auto_1213001 ) ) ( not ( = ?auto_1212989 ?auto_1213006 ) ) ( not ( = ?auto_1212990 ?auto_1212991 ) ) ( not ( = ?auto_1212990 ?auto_1212993 ) ) ( not ( = ?auto_1212990 ?auto_1212992 ) ) ( not ( = ?auto_1212990 ?auto_1212994 ) ) ( not ( = ?auto_1212990 ?auto_1212995 ) ) ( not ( = ?auto_1212990 ?auto_1212996 ) ) ( not ( = ?auto_1212990 ?auto_1212997 ) ) ( not ( = ?auto_1212990 ?auto_1212998 ) ) ( not ( = ?auto_1212990 ?auto_1212999 ) ) ( not ( = ?auto_1212990 ?auto_1213000 ) ) ( not ( = ?auto_1212990 ?auto_1213001 ) ) ( not ( = ?auto_1212990 ?auto_1213006 ) ) ( not ( = ?auto_1212991 ?auto_1212993 ) ) ( not ( = ?auto_1212991 ?auto_1212992 ) ) ( not ( = ?auto_1212991 ?auto_1212994 ) ) ( not ( = ?auto_1212991 ?auto_1212995 ) ) ( not ( = ?auto_1212991 ?auto_1212996 ) ) ( not ( = ?auto_1212991 ?auto_1212997 ) ) ( not ( = ?auto_1212991 ?auto_1212998 ) ) ( not ( = ?auto_1212991 ?auto_1212999 ) ) ( not ( = ?auto_1212991 ?auto_1213000 ) ) ( not ( = ?auto_1212991 ?auto_1213001 ) ) ( not ( = ?auto_1212991 ?auto_1213006 ) ) ( not ( = ?auto_1212993 ?auto_1212992 ) ) ( not ( = ?auto_1212993 ?auto_1212994 ) ) ( not ( = ?auto_1212993 ?auto_1212995 ) ) ( not ( = ?auto_1212993 ?auto_1212996 ) ) ( not ( = ?auto_1212993 ?auto_1212997 ) ) ( not ( = ?auto_1212993 ?auto_1212998 ) ) ( not ( = ?auto_1212993 ?auto_1212999 ) ) ( not ( = ?auto_1212993 ?auto_1213000 ) ) ( not ( = ?auto_1212993 ?auto_1213001 ) ) ( not ( = ?auto_1212993 ?auto_1213006 ) ) ( not ( = ?auto_1212992 ?auto_1212994 ) ) ( not ( = ?auto_1212992 ?auto_1212995 ) ) ( not ( = ?auto_1212992 ?auto_1212996 ) ) ( not ( = ?auto_1212992 ?auto_1212997 ) ) ( not ( = ?auto_1212992 ?auto_1212998 ) ) ( not ( = ?auto_1212992 ?auto_1212999 ) ) ( not ( = ?auto_1212992 ?auto_1213000 ) ) ( not ( = ?auto_1212992 ?auto_1213001 ) ) ( not ( = ?auto_1212992 ?auto_1213006 ) ) ( not ( = ?auto_1212994 ?auto_1212995 ) ) ( not ( = ?auto_1212994 ?auto_1212996 ) ) ( not ( = ?auto_1212994 ?auto_1212997 ) ) ( not ( = ?auto_1212994 ?auto_1212998 ) ) ( not ( = ?auto_1212994 ?auto_1212999 ) ) ( not ( = ?auto_1212994 ?auto_1213000 ) ) ( not ( = ?auto_1212994 ?auto_1213001 ) ) ( not ( = ?auto_1212994 ?auto_1213006 ) ) ( not ( = ?auto_1212995 ?auto_1212996 ) ) ( not ( = ?auto_1212995 ?auto_1212997 ) ) ( not ( = ?auto_1212995 ?auto_1212998 ) ) ( not ( = ?auto_1212995 ?auto_1212999 ) ) ( not ( = ?auto_1212995 ?auto_1213000 ) ) ( not ( = ?auto_1212995 ?auto_1213001 ) ) ( not ( = ?auto_1212995 ?auto_1213006 ) ) ( not ( = ?auto_1212996 ?auto_1212997 ) ) ( not ( = ?auto_1212996 ?auto_1212998 ) ) ( not ( = ?auto_1212996 ?auto_1212999 ) ) ( not ( = ?auto_1212996 ?auto_1213000 ) ) ( not ( = ?auto_1212996 ?auto_1213001 ) ) ( not ( = ?auto_1212996 ?auto_1213006 ) ) ( not ( = ?auto_1212997 ?auto_1212998 ) ) ( not ( = ?auto_1212997 ?auto_1212999 ) ) ( not ( = ?auto_1212997 ?auto_1213000 ) ) ( not ( = ?auto_1212997 ?auto_1213001 ) ) ( not ( = ?auto_1212997 ?auto_1213006 ) ) ( not ( = ?auto_1212998 ?auto_1212999 ) ) ( not ( = ?auto_1212998 ?auto_1213000 ) ) ( not ( = ?auto_1212998 ?auto_1213001 ) ) ( not ( = ?auto_1212998 ?auto_1213006 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1212999 ?auto_1213000 ?auto_1213001 )
      ( MAKE-12CRATE-VERIFY ?auto_1212989 ?auto_1212990 ?auto_1212991 ?auto_1212993 ?auto_1212992 ?auto_1212994 ?auto_1212995 ?auto_1212996 ?auto_1212997 ?auto_1212998 ?auto_1212999 ?auto_1213000 ?auto_1213001 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1213134 - SURFACE
      ?auto_1213135 - SURFACE
      ?auto_1213136 - SURFACE
      ?auto_1213138 - SURFACE
      ?auto_1213137 - SURFACE
      ?auto_1213139 - SURFACE
      ?auto_1213140 - SURFACE
      ?auto_1213141 - SURFACE
      ?auto_1213142 - SURFACE
      ?auto_1213143 - SURFACE
      ?auto_1213144 - SURFACE
      ?auto_1213145 - SURFACE
    )
    :vars
    (
      ?auto_1213146 - HOIST
      ?auto_1213151 - PLACE
      ?auto_1213150 - PLACE
      ?auto_1213147 - HOIST
      ?auto_1213148 - SURFACE
      ?auto_1213149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213146 ?auto_1213151 ) ( IS-CRATE ?auto_1213145 ) ( not ( = ?auto_1213144 ?auto_1213145 ) ) ( not ( = ?auto_1213143 ?auto_1213144 ) ) ( not ( = ?auto_1213143 ?auto_1213145 ) ) ( not ( = ?auto_1213150 ?auto_1213151 ) ) ( HOIST-AT ?auto_1213147 ?auto_1213150 ) ( not ( = ?auto_1213146 ?auto_1213147 ) ) ( AVAILABLE ?auto_1213147 ) ( SURFACE-AT ?auto_1213145 ?auto_1213150 ) ( ON ?auto_1213145 ?auto_1213148 ) ( CLEAR ?auto_1213145 ) ( not ( = ?auto_1213144 ?auto_1213148 ) ) ( not ( = ?auto_1213145 ?auto_1213148 ) ) ( not ( = ?auto_1213143 ?auto_1213148 ) ) ( SURFACE-AT ?auto_1213143 ?auto_1213151 ) ( CLEAR ?auto_1213143 ) ( IS-CRATE ?auto_1213144 ) ( AVAILABLE ?auto_1213146 ) ( IN ?auto_1213144 ?auto_1213149 ) ( TRUCK-AT ?auto_1213149 ?auto_1213150 ) ( ON ?auto_1213135 ?auto_1213134 ) ( ON ?auto_1213136 ?auto_1213135 ) ( ON ?auto_1213138 ?auto_1213136 ) ( ON ?auto_1213137 ?auto_1213138 ) ( ON ?auto_1213139 ?auto_1213137 ) ( ON ?auto_1213140 ?auto_1213139 ) ( ON ?auto_1213141 ?auto_1213140 ) ( ON ?auto_1213142 ?auto_1213141 ) ( ON ?auto_1213143 ?auto_1213142 ) ( not ( = ?auto_1213134 ?auto_1213135 ) ) ( not ( = ?auto_1213134 ?auto_1213136 ) ) ( not ( = ?auto_1213134 ?auto_1213138 ) ) ( not ( = ?auto_1213134 ?auto_1213137 ) ) ( not ( = ?auto_1213134 ?auto_1213139 ) ) ( not ( = ?auto_1213134 ?auto_1213140 ) ) ( not ( = ?auto_1213134 ?auto_1213141 ) ) ( not ( = ?auto_1213134 ?auto_1213142 ) ) ( not ( = ?auto_1213134 ?auto_1213143 ) ) ( not ( = ?auto_1213134 ?auto_1213144 ) ) ( not ( = ?auto_1213134 ?auto_1213145 ) ) ( not ( = ?auto_1213134 ?auto_1213148 ) ) ( not ( = ?auto_1213135 ?auto_1213136 ) ) ( not ( = ?auto_1213135 ?auto_1213138 ) ) ( not ( = ?auto_1213135 ?auto_1213137 ) ) ( not ( = ?auto_1213135 ?auto_1213139 ) ) ( not ( = ?auto_1213135 ?auto_1213140 ) ) ( not ( = ?auto_1213135 ?auto_1213141 ) ) ( not ( = ?auto_1213135 ?auto_1213142 ) ) ( not ( = ?auto_1213135 ?auto_1213143 ) ) ( not ( = ?auto_1213135 ?auto_1213144 ) ) ( not ( = ?auto_1213135 ?auto_1213145 ) ) ( not ( = ?auto_1213135 ?auto_1213148 ) ) ( not ( = ?auto_1213136 ?auto_1213138 ) ) ( not ( = ?auto_1213136 ?auto_1213137 ) ) ( not ( = ?auto_1213136 ?auto_1213139 ) ) ( not ( = ?auto_1213136 ?auto_1213140 ) ) ( not ( = ?auto_1213136 ?auto_1213141 ) ) ( not ( = ?auto_1213136 ?auto_1213142 ) ) ( not ( = ?auto_1213136 ?auto_1213143 ) ) ( not ( = ?auto_1213136 ?auto_1213144 ) ) ( not ( = ?auto_1213136 ?auto_1213145 ) ) ( not ( = ?auto_1213136 ?auto_1213148 ) ) ( not ( = ?auto_1213138 ?auto_1213137 ) ) ( not ( = ?auto_1213138 ?auto_1213139 ) ) ( not ( = ?auto_1213138 ?auto_1213140 ) ) ( not ( = ?auto_1213138 ?auto_1213141 ) ) ( not ( = ?auto_1213138 ?auto_1213142 ) ) ( not ( = ?auto_1213138 ?auto_1213143 ) ) ( not ( = ?auto_1213138 ?auto_1213144 ) ) ( not ( = ?auto_1213138 ?auto_1213145 ) ) ( not ( = ?auto_1213138 ?auto_1213148 ) ) ( not ( = ?auto_1213137 ?auto_1213139 ) ) ( not ( = ?auto_1213137 ?auto_1213140 ) ) ( not ( = ?auto_1213137 ?auto_1213141 ) ) ( not ( = ?auto_1213137 ?auto_1213142 ) ) ( not ( = ?auto_1213137 ?auto_1213143 ) ) ( not ( = ?auto_1213137 ?auto_1213144 ) ) ( not ( = ?auto_1213137 ?auto_1213145 ) ) ( not ( = ?auto_1213137 ?auto_1213148 ) ) ( not ( = ?auto_1213139 ?auto_1213140 ) ) ( not ( = ?auto_1213139 ?auto_1213141 ) ) ( not ( = ?auto_1213139 ?auto_1213142 ) ) ( not ( = ?auto_1213139 ?auto_1213143 ) ) ( not ( = ?auto_1213139 ?auto_1213144 ) ) ( not ( = ?auto_1213139 ?auto_1213145 ) ) ( not ( = ?auto_1213139 ?auto_1213148 ) ) ( not ( = ?auto_1213140 ?auto_1213141 ) ) ( not ( = ?auto_1213140 ?auto_1213142 ) ) ( not ( = ?auto_1213140 ?auto_1213143 ) ) ( not ( = ?auto_1213140 ?auto_1213144 ) ) ( not ( = ?auto_1213140 ?auto_1213145 ) ) ( not ( = ?auto_1213140 ?auto_1213148 ) ) ( not ( = ?auto_1213141 ?auto_1213142 ) ) ( not ( = ?auto_1213141 ?auto_1213143 ) ) ( not ( = ?auto_1213141 ?auto_1213144 ) ) ( not ( = ?auto_1213141 ?auto_1213145 ) ) ( not ( = ?auto_1213141 ?auto_1213148 ) ) ( not ( = ?auto_1213142 ?auto_1213143 ) ) ( not ( = ?auto_1213142 ?auto_1213144 ) ) ( not ( = ?auto_1213142 ?auto_1213145 ) ) ( not ( = ?auto_1213142 ?auto_1213148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213143 ?auto_1213144 ?auto_1213145 )
      ( MAKE-11CRATE-VERIFY ?auto_1213134 ?auto_1213135 ?auto_1213136 ?auto_1213138 ?auto_1213137 ?auto_1213139 ?auto_1213140 ?auto_1213141 ?auto_1213142 ?auto_1213143 ?auto_1213144 ?auto_1213145 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213152 - SURFACE
      ?auto_1213153 - SURFACE
      ?auto_1213154 - SURFACE
      ?auto_1213156 - SURFACE
      ?auto_1213155 - SURFACE
      ?auto_1213157 - SURFACE
      ?auto_1213158 - SURFACE
      ?auto_1213159 - SURFACE
      ?auto_1213160 - SURFACE
      ?auto_1213161 - SURFACE
      ?auto_1213162 - SURFACE
      ?auto_1213163 - SURFACE
      ?auto_1213164 - SURFACE
    )
    :vars
    (
      ?auto_1213165 - HOIST
      ?auto_1213170 - PLACE
      ?auto_1213169 - PLACE
      ?auto_1213166 - HOIST
      ?auto_1213167 - SURFACE
      ?auto_1213168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213165 ?auto_1213170 ) ( IS-CRATE ?auto_1213164 ) ( not ( = ?auto_1213163 ?auto_1213164 ) ) ( not ( = ?auto_1213162 ?auto_1213163 ) ) ( not ( = ?auto_1213162 ?auto_1213164 ) ) ( not ( = ?auto_1213169 ?auto_1213170 ) ) ( HOIST-AT ?auto_1213166 ?auto_1213169 ) ( not ( = ?auto_1213165 ?auto_1213166 ) ) ( AVAILABLE ?auto_1213166 ) ( SURFACE-AT ?auto_1213164 ?auto_1213169 ) ( ON ?auto_1213164 ?auto_1213167 ) ( CLEAR ?auto_1213164 ) ( not ( = ?auto_1213163 ?auto_1213167 ) ) ( not ( = ?auto_1213164 ?auto_1213167 ) ) ( not ( = ?auto_1213162 ?auto_1213167 ) ) ( SURFACE-AT ?auto_1213162 ?auto_1213170 ) ( CLEAR ?auto_1213162 ) ( IS-CRATE ?auto_1213163 ) ( AVAILABLE ?auto_1213165 ) ( IN ?auto_1213163 ?auto_1213168 ) ( TRUCK-AT ?auto_1213168 ?auto_1213169 ) ( ON ?auto_1213153 ?auto_1213152 ) ( ON ?auto_1213154 ?auto_1213153 ) ( ON ?auto_1213156 ?auto_1213154 ) ( ON ?auto_1213155 ?auto_1213156 ) ( ON ?auto_1213157 ?auto_1213155 ) ( ON ?auto_1213158 ?auto_1213157 ) ( ON ?auto_1213159 ?auto_1213158 ) ( ON ?auto_1213160 ?auto_1213159 ) ( ON ?auto_1213161 ?auto_1213160 ) ( ON ?auto_1213162 ?auto_1213161 ) ( not ( = ?auto_1213152 ?auto_1213153 ) ) ( not ( = ?auto_1213152 ?auto_1213154 ) ) ( not ( = ?auto_1213152 ?auto_1213156 ) ) ( not ( = ?auto_1213152 ?auto_1213155 ) ) ( not ( = ?auto_1213152 ?auto_1213157 ) ) ( not ( = ?auto_1213152 ?auto_1213158 ) ) ( not ( = ?auto_1213152 ?auto_1213159 ) ) ( not ( = ?auto_1213152 ?auto_1213160 ) ) ( not ( = ?auto_1213152 ?auto_1213161 ) ) ( not ( = ?auto_1213152 ?auto_1213162 ) ) ( not ( = ?auto_1213152 ?auto_1213163 ) ) ( not ( = ?auto_1213152 ?auto_1213164 ) ) ( not ( = ?auto_1213152 ?auto_1213167 ) ) ( not ( = ?auto_1213153 ?auto_1213154 ) ) ( not ( = ?auto_1213153 ?auto_1213156 ) ) ( not ( = ?auto_1213153 ?auto_1213155 ) ) ( not ( = ?auto_1213153 ?auto_1213157 ) ) ( not ( = ?auto_1213153 ?auto_1213158 ) ) ( not ( = ?auto_1213153 ?auto_1213159 ) ) ( not ( = ?auto_1213153 ?auto_1213160 ) ) ( not ( = ?auto_1213153 ?auto_1213161 ) ) ( not ( = ?auto_1213153 ?auto_1213162 ) ) ( not ( = ?auto_1213153 ?auto_1213163 ) ) ( not ( = ?auto_1213153 ?auto_1213164 ) ) ( not ( = ?auto_1213153 ?auto_1213167 ) ) ( not ( = ?auto_1213154 ?auto_1213156 ) ) ( not ( = ?auto_1213154 ?auto_1213155 ) ) ( not ( = ?auto_1213154 ?auto_1213157 ) ) ( not ( = ?auto_1213154 ?auto_1213158 ) ) ( not ( = ?auto_1213154 ?auto_1213159 ) ) ( not ( = ?auto_1213154 ?auto_1213160 ) ) ( not ( = ?auto_1213154 ?auto_1213161 ) ) ( not ( = ?auto_1213154 ?auto_1213162 ) ) ( not ( = ?auto_1213154 ?auto_1213163 ) ) ( not ( = ?auto_1213154 ?auto_1213164 ) ) ( not ( = ?auto_1213154 ?auto_1213167 ) ) ( not ( = ?auto_1213156 ?auto_1213155 ) ) ( not ( = ?auto_1213156 ?auto_1213157 ) ) ( not ( = ?auto_1213156 ?auto_1213158 ) ) ( not ( = ?auto_1213156 ?auto_1213159 ) ) ( not ( = ?auto_1213156 ?auto_1213160 ) ) ( not ( = ?auto_1213156 ?auto_1213161 ) ) ( not ( = ?auto_1213156 ?auto_1213162 ) ) ( not ( = ?auto_1213156 ?auto_1213163 ) ) ( not ( = ?auto_1213156 ?auto_1213164 ) ) ( not ( = ?auto_1213156 ?auto_1213167 ) ) ( not ( = ?auto_1213155 ?auto_1213157 ) ) ( not ( = ?auto_1213155 ?auto_1213158 ) ) ( not ( = ?auto_1213155 ?auto_1213159 ) ) ( not ( = ?auto_1213155 ?auto_1213160 ) ) ( not ( = ?auto_1213155 ?auto_1213161 ) ) ( not ( = ?auto_1213155 ?auto_1213162 ) ) ( not ( = ?auto_1213155 ?auto_1213163 ) ) ( not ( = ?auto_1213155 ?auto_1213164 ) ) ( not ( = ?auto_1213155 ?auto_1213167 ) ) ( not ( = ?auto_1213157 ?auto_1213158 ) ) ( not ( = ?auto_1213157 ?auto_1213159 ) ) ( not ( = ?auto_1213157 ?auto_1213160 ) ) ( not ( = ?auto_1213157 ?auto_1213161 ) ) ( not ( = ?auto_1213157 ?auto_1213162 ) ) ( not ( = ?auto_1213157 ?auto_1213163 ) ) ( not ( = ?auto_1213157 ?auto_1213164 ) ) ( not ( = ?auto_1213157 ?auto_1213167 ) ) ( not ( = ?auto_1213158 ?auto_1213159 ) ) ( not ( = ?auto_1213158 ?auto_1213160 ) ) ( not ( = ?auto_1213158 ?auto_1213161 ) ) ( not ( = ?auto_1213158 ?auto_1213162 ) ) ( not ( = ?auto_1213158 ?auto_1213163 ) ) ( not ( = ?auto_1213158 ?auto_1213164 ) ) ( not ( = ?auto_1213158 ?auto_1213167 ) ) ( not ( = ?auto_1213159 ?auto_1213160 ) ) ( not ( = ?auto_1213159 ?auto_1213161 ) ) ( not ( = ?auto_1213159 ?auto_1213162 ) ) ( not ( = ?auto_1213159 ?auto_1213163 ) ) ( not ( = ?auto_1213159 ?auto_1213164 ) ) ( not ( = ?auto_1213159 ?auto_1213167 ) ) ( not ( = ?auto_1213160 ?auto_1213161 ) ) ( not ( = ?auto_1213160 ?auto_1213162 ) ) ( not ( = ?auto_1213160 ?auto_1213163 ) ) ( not ( = ?auto_1213160 ?auto_1213164 ) ) ( not ( = ?auto_1213160 ?auto_1213167 ) ) ( not ( = ?auto_1213161 ?auto_1213162 ) ) ( not ( = ?auto_1213161 ?auto_1213163 ) ) ( not ( = ?auto_1213161 ?auto_1213164 ) ) ( not ( = ?auto_1213161 ?auto_1213167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213162 ?auto_1213163 ?auto_1213164 )
      ( MAKE-12CRATE-VERIFY ?auto_1213152 ?auto_1213153 ?auto_1213154 ?auto_1213156 ?auto_1213155 ?auto_1213157 ?auto_1213158 ?auto_1213159 ?auto_1213160 ?auto_1213161 ?auto_1213162 ?auto_1213163 ?auto_1213164 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1213297 - SURFACE
      ?auto_1213298 - SURFACE
      ?auto_1213299 - SURFACE
      ?auto_1213301 - SURFACE
      ?auto_1213300 - SURFACE
      ?auto_1213302 - SURFACE
      ?auto_1213303 - SURFACE
      ?auto_1213304 - SURFACE
      ?auto_1213305 - SURFACE
      ?auto_1213306 - SURFACE
      ?auto_1213307 - SURFACE
      ?auto_1213308 - SURFACE
    )
    :vars
    (
      ?auto_1213309 - HOIST
      ?auto_1213312 - PLACE
      ?auto_1213311 - PLACE
      ?auto_1213313 - HOIST
      ?auto_1213314 - SURFACE
      ?auto_1213310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213309 ?auto_1213312 ) ( IS-CRATE ?auto_1213308 ) ( not ( = ?auto_1213307 ?auto_1213308 ) ) ( not ( = ?auto_1213306 ?auto_1213307 ) ) ( not ( = ?auto_1213306 ?auto_1213308 ) ) ( not ( = ?auto_1213311 ?auto_1213312 ) ) ( HOIST-AT ?auto_1213313 ?auto_1213311 ) ( not ( = ?auto_1213309 ?auto_1213313 ) ) ( SURFACE-AT ?auto_1213308 ?auto_1213311 ) ( ON ?auto_1213308 ?auto_1213314 ) ( CLEAR ?auto_1213308 ) ( not ( = ?auto_1213307 ?auto_1213314 ) ) ( not ( = ?auto_1213308 ?auto_1213314 ) ) ( not ( = ?auto_1213306 ?auto_1213314 ) ) ( SURFACE-AT ?auto_1213306 ?auto_1213312 ) ( CLEAR ?auto_1213306 ) ( IS-CRATE ?auto_1213307 ) ( AVAILABLE ?auto_1213309 ) ( TRUCK-AT ?auto_1213310 ?auto_1213311 ) ( LIFTING ?auto_1213313 ?auto_1213307 ) ( ON ?auto_1213298 ?auto_1213297 ) ( ON ?auto_1213299 ?auto_1213298 ) ( ON ?auto_1213301 ?auto_1213299 ) ( ON ?auto_1213300 ?auto_1213301 ) ( ON ?auto_1213302 ?auto_1213300 ) ( ON ?auto_1213303 ?auto_1213302 ) ( ON ?auto_1213304 ?auto_1213303 ) ( ON ?auto_1213305 ?auto_1213304 ) ( ON ?auto_1213306 ?auto_1213305 ) ( not ( = ?auto_1213297 ?auto_1213298 ) ) ( not ( = ?auto_1213297 ?auto_1213299 ) ) ( not ( = ?auto_1213297 ?auto_1213301 ) ) ( not ( = ?auto_1213297 ?auto_1213300 ) ) ( not ( = ?auto_1213297 ?auto_1213302 ) ) ( not ( = ?auto_1213297 ?auto_1213303 ) ) ( not ( = ?auto_1213297 ?auto_1213304 ) ) ( not ( = ?auto_1213297 ?auto_1213305 ) ) ( not ( = ?auto_1213297 ?auto_1213306 ) ) ( not ( = ?auto_1213297 ?auto_1213307 ) ) ( not ( = ?auto_1213297 ?auto_1213308 ) ) ( not ( = ?auto_1213297 ?auto_1213314 ) ) ( not ( = ?auto_1213298 ?auto_1213299 ) ) ( not ( = ?auto_1213298 ?auto_1213301 ) ) ( not ( = ?auto_1213298 ?auto_1213300 ) ) ( not ( = ?auto_1213298 ?auto_1213302 ) ) ( not ( = ?auto_1213298 ?auto_1213303 ) ) ( not ( = ?auto_1213298 ?auto_1213304 ) ) ( not ( = ?auto_1213298 ?auto_1213305 ) ) ( not ( = ?auto_1213298 ?auto_1213306 ) ) ( not ( = ?auto_1213298 ?auto_1213307 ) ) ( not ( = ?auto_1213298 ?auto_1213308 ) ) ( not ( = ?auto_1213298 ?auto_1213314 ) ) ( not ( = ?auto_1213299 ?auto_1213301 ) ) ( not ( = ?auto_1213299 ?auto_1213300 ) ) ( not ( = ?auto_1213299 ?auto_1213302 ) ) ( not ( = ?auto_1213299 ?auto_1213303 ) ) ( not ( = ?auto_1213299 ?auto_1213304 ) ) ( not ( = ?auto_1213299 ?auto_1213305 ) ) ( not ( = ?auto_1213299 ?auto_1213306 ) ) ( not ( = ?auto_1213299 ?auto_1213307 ) ) ( not ( = ?auto_1213299 ?auto_1213308 ) ) ( not ( = ?auto_1213299 ?auto_1213314 ) ) ( not ( = ?auto_1213301 ?auto_1213300 ) ) ( not ( = ?auto_1213301 ?auto_1213302 ) ) ( not ( = ?auto_1213301 ?auto_1213303 ) ) ( not ( = ?auto_1213301 ?auto_1213304 ) ) ( not ( = ?auto_1213301 ?auto_1213305 ) ) ( not ( = ?auto_1213301 ?auto_1213306 ) ) ( not ( = ?auto_1213301 ?auto_1213307 ) ) ( not ( = ?auto_1213301 ?auto_1213308 ) ) ( not ( = ?auto_1213301 ?auto_1213314 ) ) ( not ( = ?auto_1213300 ?auto_1213302 ) ) ( not ( = ?auto_1213300 ?auto_1213303 ) ) ( not ( = ?auto_1213300 ?auto_1213304 ) ) ( not ( = ?auto_1213300 ?auto_1213305 ) ) ( not ( = ?auto_1213300 ?auto_1213306 ) ) ( not ( = ?auto_1213300 ?auto_1213307 ) ) ( not ( = ?auto_1213300 ?auto_1213308 ) ) ( not ( = ?auto_1213300 ?auto_1213314 ) ) ( not ( = ?auto_1213302 ?auto_1213303 ) ) ( not ( = ?auto_1213302 ?auto_1213304 ) ) ( not ( = ?auto_1213302 ?auto_1213305 ) ) ( not ( = ?auto_1213302 ?auto_1213306 ) ) ( not ( = ?auto_1213302 ?auto_1213307 ) ) ( not ( = ?auto_1213302 ?auto_1213308 ) ) ( not ( = ?auto_1213302 ?auto_1213314 ) ) ( not ( = ?auto_1213303 ?auto_1213304 ) ) ( not ( = ?auto_1213303 ?auto_1213305 ) ) ( not ( = ?auto_1213303 ?auto_1213306 ) ) ( not ( = ?auto_1213303 ?auto_1213307 ) ) ( not ( = ?auto_1213303 ?auto_1213308 ) ) ( not ( = ?auto_1213303 ?auto_1213314 ) ) ( not ( = ?auto_1213304 ?auto_1213305 ) ) ( not ( = ?auto_1213304 ?auto_1213306 ) ) ( not ( = ?auto_1213304 ?auto_1213307 ) ) ( not ( = ?auto_1213304 ?auto_1213308 ) ) ( not ( = ?auto_1213304 ?auto_1213314 ) ) ( not ( = ?auto_1213305 ?auto_1213306 ) ) ( not ( = ?auto_1213305 ?auto_1213307 ) ) ( not ( = ?auto_1213305 ?auto_1213308 ) ) ( not ( = ?auto_1213305 ?auto_1213314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213306 ?auto_1213307 ?auto_1213308 )
      ( MAKE-11CRATE-VERIFY ?auto_1213297 ?auto_1213298 ?auto_1213299 ?auto_1213301 ?auto_1213300 ?auto_1213302 ?auto_1213303 ?auto_1213304 ?auto_1213305 ?auto_1213306 ?auto_1213307 ?auto_1213308 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213315 - SURFACE
      ?auto_1213316 - SURFACE
      ?auto_1213317 - SURFACE
      ?auto_1213319 - SURFACE
      ?auto_1213318 - SURFACE
      ?auto_1213320 - SURFACE
      ?auto_1213321 - SURFACE
      ?auto_1213322 - SURFACE
      ?auto_1213323 - SURFACE
      ?auto_1213324 - SURFACE
      ?auto_1213325 - SURFACE
      ?auto_1213326 - SURFACE
      ?auto_1213327 - SURFACE
    )
    :vars
    (
      ?auto_1213328 - HOIST
      ?auto_1213331 - PLACE
      ?auto_1213330 - PLACE
      ?auto_1213332 - HOIST
      ?auto_1213333 - SURFACE
      ?auto_1213329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213328 ?auto_1213331 ) ( IS-CRATE ?auto_1213327 ) ( not ( = ?auto_1213326 ?auto_1213327 ) ) ( not ( = ?auto_1213325 ?auto_1213326 ) ) ( not ( = ?auto_1213325 ?auto_1213327 ) ) ( not ( = ?auto_1213330 ?auto_1213331 ) ) ( HOIST-AT ?auto_1213332 ?auto_1213330 ) ( not ( = ?auto_1213328 ?auto_1213332 ) ) ( SURFACE-AT ?auto_1213327 ?auto_1213330 ) ( ON ?auto_1213327 ?auto_1213333 ) ( CLEAR ?auto_1213327 ) ( not ( = ?auto_1213326 ?auto_1213333 ) ) ( not ( = ?auto_1213327 ?auto_1213333 ) ) ( not ( = ?auto_1213325 ?auto_1213333 ) ) ( SURFACE-AT ?auto_1213325 ?auto_1213331 ) ( CLEAR ?auto_1213325 ) ( IS-CRATE ?auto_1213326 ) ( AVAILABLE ?auto_1213328 ) ( TRUCK-AT ?auto_1213329 ?auto_1213330 ) ( LIFTING ?auto_1213332 ?auto_1213326 ) ( ON ?auto_1213316 ?auto_1213315 ) ( ON ?auto_1213317 ?auto_1213316 ) ( ON ?auto_1213319 ?auto_1213317 ) ( ON ?auto_1213318 ?auto_1213319 ) ( ON ?auto_1213320 ?auto_1213318 ) ( ON ?auto_1213321 ?auto_1213320 ) ( ON ?auto_1213322 ?auto_1213321 ) ( ON ?auto_1213323 ?auto_1213322 ) ( ON ?auto_1213324 ?auto_1213323 ) ( ON ?auto_1213325 ?auto_1213324 ) ( not ( = ?auto_1213315 ?auto_1213316 ) ) ( not ( = ?auto_1213315 ?auto_1213317 ) ) ( not ( = ?auto_1213315 ?auto_1213319 ) ) ( not ( = ?auto_1213315 ?auto_1213318 ) ) ( not ( = ?auto_1213315 ?auto_1213320 ) ) ( not ( = ?auto_1213315 ?auto_1213321 ) ) ( not ( = ?auto_1213315 ?auto_1213322 ) ) ( not ( = ?auto_1213315 ?auto_1213323 ) ) ( not ( = ?auto_1213315 ?auto_1213324 ) ) ( not ( = ?auto_1213315 ?auto_1213325 ) ) ( not ( = ?auto_1213315 ?auto_1213326 ) ) ( not ( = ?auto_1213315 ?auto_1213327 ) ) ( not ( = ?auto_1213315 ?auto_1213333 ) ) ( not ( = ?auto_1213316 ?auto_1213317 ) ) ( not ( = ?auto_1213316 ?auto_1213319 ) ) ( not ( = ?auto_1213316 ?auto_1213318 ) ) ( not ( = ?auto_1213316 ?auto_1213320 ) ) ( not ( = ?auto_1213316 ?auto_1213321 ) ) ( not ( = ?auto_1213316 ?auto_1213322 ) ) ( not ( = ?auto_1213316 ?auto_1213323 ) ) ( not ( = ?auto_1213316 ?auto_1213324 ) ) ( not ( = ?auto_1213316 ?auto_1213325 ) ) ( not ( = ?auto_1213316 ?auto_1213326 ) ) ( not ( = ?auto_1213316 ?auto_1213327 ) ) ( not ( = ?auto_1213316 ?auto_1213333 ) ) ( not ( = ?auto_1213317 ?auto_1213319 ) ) ( not ( = ?auto_1213317 ?auto_1213318 ) ) ( not ( = ?auto_1213317 ?auto_1213320 ) ) ( not ( = ?auto_1213317 ?auto_1213321 ) ) ( not ( = ?auto_1213317 ?auto_1213322 ) ) ( not ( = ?auto_1213317 ?auto_1213323 ) ) ( not ( = ?auto_1213317 ?auto_1213324 ) ) ( not ( = ?auto_1213317 ?auto_1213325 ) ) ( not ( = ?auto_1213317 ?auto_1213326 ) ) ( not ( = ?auto_1213317 ?auto_1213327 ) ) ( not ( = ?auto_1213317 ?auto_1213333 ) ) ( not ( = ?auto_1213319 ?auto_1213318 ) ) ( not ( = ?auto_1213319 ?auto_1213320 ) ) ( not ( = ?auto_1213319 ?auto_1213321 ) ) ( not ( = ?auto_1213319 ?auto_1213322 ) ) ( not ( = ?auto_1213319 ?auto_1213323 ) ) ( not ( = ?auto_1213319 ?auto_1213324 ) ) ( not ( = ?auto_1213319 ?auto_1213325 ) ) ( not ( = ?auto_1213319 ?auto_1213326 ) ) ( not ( = ?auto_1213319 ?auto_1213327 ) ) ( not ( = ?auto_1213319 ?auto_1213333 ) ) ( not ( = ?auto_1213318 ?auto_1213320 ) ) ( not ( = ?auto_1213318 ?auto_1213321 ) ) ( not ( = ?auto_1213318 ?auto_1213322 ) ) ( not ( = ?auto_1213318 ?auto_1213323 ) ) ( not ( = ?auto_1213318 ?auto_1213324 ) ) ( not ( = ?auto_1213318 ?auto_1213325 ) ) ( not ( = ?auto_1213318 ?auto_1213326 ) ) ( not ( = ?auto_1213318 ?auto_1213327 ) ) ( not ( = ?auto_1213318 ?auto_1213333 ) ) ( not ( = ?auto_1213320 ?auto_1213321 ) ) ( not ( = ?auto_1213320 ?auto_1213322 ) ) ( not ( = ?auto_1213320 ?auto_1213323 ) ) ( not ( = ?auto_1213320 ?auto_1213324 ) ) ( not ( = ?auto_1213320 ?auto_1213325 ) ) ( not ( = ?auto_1213320 ?auto_1213326 ) ) ( not ( = ?auto_1213320 ?auto_1213327 ) ) ( not ( = ?auto_1213320 ?auto_1213333 ) ) ( not ( = ?auto_1213321 ?auto_1213322 ) ) ( not ( = ?auto_1213321 ?auto_1213323 ) ) ( not ( = ?auto_1213321 ?auto_1213324 ) ) ( not ( = ?auto_1213321 ?auto_1213325 ) ) ( not ( = ?auto_1213321 ?auto_1213326 ) ) ( not ( = ?auto_1213321 ?auto_1213327 ) ) ( not ( = ?auto_1213321 ?auto_1213333 ) ) ( not ( = ?auto_1213322 ?auto_1213323 ) ) ( not ( = ?auto_1213322 ?auto_1213324 ) ) ( not ( = ?auto_1213322 ?auto_1213325 ) ) ( not ( = ?auto_1213322 ?auto_1213326 ) ) ( not ( = ?auto_1213322 ?auto_1213327 ) ) ( not ( = ?auto_1213322 ?auto_1213333 ) ) ( not ( = ?auto_1213323 ?auto_1213324 ) ) ( not ( = ?auto_1213323 ?auto_1213325 ) ) ( not ( = ?auto_1213323 ?auto_1213326 ) ) ( not ( = ?auto_1213323 ?auto_1213327 ) ) ( not ( = ?auto_1213323 ?auto_1213333 ) ) ( not ( = ?auto_1213324 ?auto_1213325 ) ) ( not ( = ?auto_1213324 ?auto_1213326 ) ) ( not ( = ?auto_1213324 ?auto_1213327 ) ) ( not ( = ?auto_1213324 ?auto_1213333 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213325 ?auto_1213326 ?auto_1213327 )
      ( MAKE-12CRATE-VERIFY ?auto_1213315 ?auto_1213316 ?auto_1213317 ?auto_1213319 ?auto_1213318 ?auto_1213320 ?auto_1213321 ?auto_1213322 ?auto_1213323 ?auto_1213324 ?auto_1213325 ?auto_1213326 ?auto_1213327 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1213470 - SURFACE
      ?auto_1213471 - SURFACE
      ?auto_1213472 - SURFACE
      ?auto_1213474 - SURFACE
      ?auto_1213473 - SURFACE
      ?auto_1213475 - SURFACE
      ?auto_1213476 - SURFACE
      ?auto_1213477 - SURFACE
      ?auto_1213478 - SURFACE
      ?auto_1213479 - SURFACE
      ?auto_1213480 - SURFACE
      ?auto_1213481 - SURFACE
    )
    :vars
    (
      ?auto_1213485 - HOIST
      ?auto_1213487 - PLACE
      ?auto_1213483 - PLACE
      ?auto_1213486 - HOIST
      ?auto_1213488 - SURFACE
      ?auto_1213484 - TRUCK
      ?auto_1213482 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213485 ?auto_1213487 ) ( IS-CRATE ?auto_1213481 ) ( not ( = ?auto_1213480 ?auto_1213481 ) ) ( not ( = ?auto_1213479 ?auto_1213480 ) ) ( not ( = ?auto_1213479 ?auto_1213481 ) ) ( not ( = ?auto_1213483 ?auto_1213487 ) ) ( HOIST-AT ?auto_1213486 ?auto_1213483 ) ( not ( = ?auto_1213485 ?auto_1213486 ) ) ( SURFACE-AT ?auto_1213481 ?auto_1213483 ) ( ON ?auto_1213481 ?auto_1213488 ) ( CLEAR ?auto_1213481 ) ( not ( = ?auto_1213480 ?auto_1213488 ) ) ( not ( = ?auto_1213481 ?auto_1213488 ) ) ( not ( = ?auto_1213479 ?auto_1213488 ) ) ( SURFACE-AT ?auto_1213479 ?auto_1213487 ) ( CLEAR ?auto_1213479 ) ( IS-CRATE ?auto_1213480 ) ( AVAILABLE ?auto_1213485 ) ( TRUCK-AT ?auto_1213484 ?auto_1213483 ) ( AVAILABLE ?auto_1213486 ) ( SURFACE-AT ?auto_1213480 ?auto_1213483 ) ( ON ?auto_1213480 ?auto_1213482 ) ( CLEAR ?auto_1213480 ) ( not ( = ?auto_1213480 ?auto_1213482 ) ) ( not ( = ?auto_1213481 ?auto_1213482 ) ) ( not ( = ?auto_1213479 ?auto_1213482 ) ) ( not ( = ?auto_1213488 ?auto_1213482 ) ) ( ON ?auto_1213471 ?auto_1213470 ) ( ON ?auto_1213472 ?auto_1213471 ) ( ON ?auto_1213474 ?auto_1213472 ) ( ON ?auto_1213473 ?auto_1213474 ) ( ON ?auto_1213475 ?auto_1213473 ) ( ON ?auto_1213476 ?auto_1213475 ) ( ON ?auto_1213477 ?auto_1213476 ) ( ON ?auto_1213478 ?auto_1213477 ) ( ON ?auto_1213479 ?auto_1213478 ) ( not ( = ?auto_1213470 ?auto_1213471 ) ) ( not ( = ?auto_1213470 ?auto_1213472 ) ) ( not ( = ?auto_1213470 ?auto_1213474 ) ) ( not ( = ?auto_1213470 ?auto_1213473 ) ) ( not ( = ?auto_1213470 ?auto_1213475 ) ) ( not ( = ?auto_1213470 ?auto_1213476 ) ) ( not ( = ?auto_1213470 ?auto_1213477 ) ) ( not ( = ?auto_1213470 ?auto_1213478 ) ) ( not ( = ?auto_1213470 ?auto_1213479 ) ) ( not ( = ?auto_1213470 ?auto_1213480 ) ) ( not ( = ?auto_1213470 ?auto_1213481 ) ) ( not ( = ?auto_1213470 ?auto_1213488 ) ) ( not ( = ?auto_1213470 ?auto_1213482 ) ) ( not ( = ?auto_1213471 ?auto_1213472 ) ) ( not ( = ?auto_1213471 ?auto_1213474 ) ) ( not ( = ?auto_1213471 ?auto_1213473 ) ) ( not ( = ?auto_1213471 ?auto_1213475 ) ) ( not ( = ?auto_1213471 ?auto_1213476 ) ) ( not ( = ?auto_1213471 ?auto_1213477 ) ) ( not ( = ?auto_1213471 ?auto_1213478 ) ) ( not ( = ?auto_1213471 ?auto_1213479 ) ) ( not ( = ?auto_1213471 ?auto_1213480 ) ) ( not ( = ?auto_1213471 ?auto_1213481 ) ) ( not ( = ?auto_1213471 ?auto_1213488 ) ) ( not ( = ?auto_1213471 ?auto_1213482 ) ) ( not ( = ?auto_1213472 ?auto_1213474 ) ) ( not ( = ?auto_1213472 ?auto_1213473 ) ) ( not ( = ?auto_1213472 ?auto_1213475 ) ) ( not ( = ?auto_1213472 ?auto_1213476 ) ) ( not ( = ?auto_1213472 ?auto_1213477 ) ) ( not ( = ?auto_1213472 ?auto_1213478 ) ) ( not ( = ?auto_1213472 ?auto_1213479 ) ) ( not ( = ?auto_1213472 ?auto_1213480 ) ) ( not ( = ?auto_1213472 ?auto_1213481 ) ) ( not ( = ?auto_1213472 ?auto_1213488 ) ) ( not ( = ?auto_1213472 ?auto_1213482 ) ) ( not ( = ?auto_1213474 ?auto_1213473 ) ) ( not ( = ?auto_1213474 ?auto_1213475 ) ) ( not ( = ?auto_1213474 ?auto_1213476 ) ) ( not ( = ?auto_1213474 ?auto_1213477 ) ) ( not ( = ?auto_1213474 ?auto_1213478 ) ) ( not ( = ?auto_1213474 ?auto_1213479 ) ) ( not ( = ?auto_1213474 ?auto_1213480 ) ) ( not ( = ?auto_1213474 ?auto_1213481 ) ) ( not ( = ?auto_1213474 ?auto_1213488 ) ) ( not ( = ?auto_1213474 ?auto_1213482 ) ) ( not ( = ?auto_1213473 ?auto_1213475 ) ) ( not ( = ?auto_1213473 ?auto_1213476 ) ) ( not ( = ?auto_1213473 ?auto_1213477 ) ) ( not ( = ?auto_1213473 ?auto_1213478 ) ) ( not ( = ?auto_1213473 ?auto_1213479 ) ) ( not ( = ?auto_1213473 ?auto_1213480 ) ) ( not ( = ?auto_1213473 ?auto_1213481 ) ) ( not ( = ?auto_1213473 ?auto_1213488 ) ) ( not ( = ?auto_1213473 ?auto_1213482 ) ) ( not ( = ?auto_1213475 ?auto_1213476 ) ) ( not ( = ?auto_1213475 ?auto_1213477 ) ) ( not ( = ?auto_1213475 ?auto_1213478 ) ) ( not ( = ?auto_1213475 ?auto_1213479 ) ) ( not ( = ?auto_1213475 ?auto_1213480 ) ) ( not ( = ?auto_1213475 ?auto_1213481 ) ) ( not ( = ?auto_1213475 ?auto_1213488 ) ) ( not ( = ?auto_1213475 ?auto_1213482 ) ) ( not ( = ?auto_1213476 ?auto_1213477 ) ) ( not ( = ?auto_1213476 ?auto_1213478 ) ) ( not ( = ?auto_1213476 ?auto_1213479 ) ) ( not ( = ?auto_1213476 ?auto_1213480 ) ) ( not ( = ?auto_1213476 ?auto_1213481 ) ) ( not ( = ?auto_1213476 ?auto_1213488 ) ) ( not ( = ?auto_1213476 ?auto_1213482 ) ) ( not ( = ?auto_1213477 ?auto_1213478 ) ) ( not ( = ?auto_1213477 ?auto_1213479 ) ) ( not ( = ?auto_1213477 ?auto_1213480 ) ) ( not ( = ?auto_1213477 ?auto_1213481 ) ) ( not ( = ?auto_1213477 ?auto_1213488 ) ) ( not ( = ?auto_1213477 ?auto_1213482 ) ) ( not ( = ?auto_1213478 ?auto_1213479 ) ) ( not ( = ?auto_1213478 ?auto_1213480 ) ) ( not ( = ?auto_1213478 ?auto_1213481 ) ) ( not ( = ?auto_1213478 ?auto_1213488 ) ) ( not ( = ?auto_1213478 ?auto_1213482 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213479 ?auto_1213480 ?auto_1213481 )
      ( MAKE-11CRATE-VERIFY ?auto_1213470 ?auto_1213471 ?auto_1213472 ?auto_1213474 ?auto_1213473 ?auto_1213475 ?auto_1213476 ?auto_1213477 ?auto_1213478 ?auto_1213479 ?auto_1213480 ?auto_1213481 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213489 - SURFACE
      ?auto_1213490 - SURFACE
      ?auto_1213491 - SURFACE
      ?auto_1213493 - SURFACE
      ?auto_1213492 - SURFACE
      ?auto_1213494 - SURFACE
      ?auto_1213495 - SURFACE
      ?auto_1213496 - SURFACE
      ?auto_1213497 - SURFACE
      ?auto_1213498 - SURFACE
      ?auto_1213499 - SURFACE
      ?auto_1213500 - SURFACE
      ?auto_1213501 - SURFACE
    )
    :vars
    (
      ?auto_1213505 - HOIST
      ?auto_1213507 - PLACE
      ?auto_1213503 - PLACE
      ?auto_1213506 - HOIST
      ?auto_1213508 - SURFACE
      ?auto_1213504 - TRUCK
      ?auto_1213502 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213505 ?auto_1213507 ) ( IS-CRATE ?auto_1213501 ) ( not ( = ?auto_1213500 ?auto_1213501 ) ) ( not ( = ?auto_1213499 ?auto_1213500 ) ) ( not ( = ?auto_1213499 ?auto_1213501 ) ) ( not ( = ?auto_1213503 ?auto_1213507 ) ) ( HOIST-AT ?auto_1213506 ?auto_1213503 ) ( not ( = ?auto_1213505 ?auto_1213506 ) ) ( SURFACE-AT ?auto_1213501 ?auto_1213503 ) ( ON ?auto_1213501 ?auto_1213508 ) ( CLEAR ?auto_1213501 ) ( not ( = ?auto_1213500 ?auto_1213508 ) ) ( not ( = ?auto_1213501 ?auto_1213508 ) ) ( not ( = ?auto_1213499 ?auto_1213508 ) ) ( SURFACE-AT ?auto_1213499 ?auto_1213507 ) ( CLEAR ?auto_1213499 ) ( IS-CRATE ?auto_1213500 ) ( AVAILABLE ?auto_1213505 ) ( TRUCK-AT ?auto_1213504 ?auto_1213503 ) ( AVAILABLE ?auto_1213506 ) ( SURFACE-AT ?auto_1213500 ?auto_1213503 ) ( ON ?auto_1213500 ?auto_1213502 ) ( CLEAR ?auto_1213500 ) ( not ( = ?auto_1213500 ?auto_1213502 ) ) ( not ( = ?auto_1213501 ?auto_1213502 ) ) ( not ( = ?auto_1213499 ?auto_1213502 ) ) ( not ( = ?auto_1213508 ?auto_1213502 ) ) ( ON ?auto_1213490 ?auto_1213489 ) ( ON ?auto_1213491 ?auto_1213490 ) ( ON ?auto_1213493 ?auto_1213491 ) ( ON ?auto_1213492 ?auto_1213493 ) ( ON ?auto_1213494 ?auto_1213492 ) ( ON ?auto_1213495 ?auto_1213494 ) ( ON ?auto_1213496 ?auto_1213495 ) ( ON ?auto_1213497 ?auto_1213496 ) ( ON ?auto_1213498 ?auto_1213497 ) ( ON ?auto_1213499 ?auto_1213498 ) ( not ( = ?auto_1213489 ?auto_1213490 ) ) ( not ( = ?auto_1213489 ?auto_1213491 ) ) ( not ( = ?auto_1213489 ?auto_1213493 ) ) ( not ( = ?auto_1213489 ?auto_1213492 ) ) ( not ( = ?auto_1213489 ?auto_1213494 ) ) ( not ( = ?auto_1213489 ?auto_1213495 ) ) ( not ( = ?auto_1213489 ?auto_1213496 ) ) ( not ( = ?auto_1213489 ?auto_1213497 ) ) ( not ( = ?auto_1213489 ?auto_1213498 ) ) ( not ( = ?auto_1213489 ?auto_1213499 ) ) ( not ( = ?auto_1213489 ?auto_1213500 ) ) ( not ( = ?auto_1213489 ?auto_1213501 ) ) ( not ( = ?auto_1213489 ?auto_1213508 ) ) ( not ( = ?auto_1213489 ?auto_1213502 ) ) ( not ( = ?auto_1213490 ?auto_1213491 ) ) ( not ( = ?auto_1213490 ?auto_1213493 ) ) ( not ( = ?auto_1213490 ?auto_1213492 ) ) ( not ( = ?auto_1213490 ?auto_1213494 ) ) ( not ( = ?auto_1213490 ?auto_1213495 ) ) ( not ( = ?auto_1213490 ?auto_1213496 ) ) ( not ( = ?auto_1213490 ?auto_1213497 ) ) ( not ( = ?auto_1213490 ?auto_1213498 ) ) ( not ( = ?auto_1213490 ?auto_1213499 ) ) ( not ( = ?auto_1213490 ?auto_1213500 ) ) ( not ( = ?auto_1213490 ?auto_1213501 ) ) ( not ( = ?auto_1213490 ?auto_1213508 ) ) ( not ( = ?auto_1213490 ?auto_1213502 ) ) ( not ( = ?auto_1213491 ?auto_1213493 ) ) ( not ( = ?auto_1213491 ?auto_1213492 ) ) ( not ( = ?auto_1213491 ?auto_1213494 ) ) ( not ( = ?auto_1213491 ?auto_1213495 ) ) ( not ( = ?auto_1213491 ?auto_1213496 ) ) ( not ( = ?auto_1213491 ?auto_1213497 ) ) ( not ( = ?auto_1213491 ?auto_1213498 ) ) ( not ( = ?auto_1213491 ?auto_1213499 ) ) ( not ( = ?auto_1213491 ?auto_1213500 ) ) ( not ( = ?auto_1213491 ?auto_1213501 ) ) ( not ( = ?auto_1213491 ?auto_1213508 ) ) ( not ( = ?auto_1213491 ?auto_1213502 ) ) ( not ( = ?auto_1213493 ?auto_1213492 ) ) ( not ( = ?auto_1213493 ?auto_1213494 ) ) ( not ( = ?auto_1213493 ?auto_1213495 ) ) ( not ( = ?auto_1213493 ?auto_1213496 ) ) ( not ( = ?auto_1213493 ?auto_1213497 ) ) ( not ( = ?auto_1213493 ?auto_1213498 ) ) ( not ( = ?auto_1213493 ?auto_1213499 ) ) ( not ( = ?auto_1213493 ?auto_1213500 ) ) ( not ( = ?auto_1213493 ?auto_1213501 ) ) ( not ( = ?auto_1213493 ?auto_1213508 ) ) ( not ( = ?auto_1213493 ?auto_1213502 ) ) ( not ( = ?auto_1213492 ?auto_1213494 ) ) ( not ( = ?auto_1213492 ?auto_1213495 ) ) ( not ( = ?auto_1213492 ?auto_1213496 ) ) ( not ( = ?auto_1213492 ?auto_1213497 ) ) ( not ( = ?auto_1213492 ?auto_1213498 ) ) ( not ( = ?auto_1213492 ?auto_1213499 ) ) ( not ( = ?auto_1213492 ?auto_1213500 ) ) ( not ( = ?auto_1213492 ?auto_1213501 ) ) ( not ( = ?auto_1213492 ?auto_1213508 ) ) ( not ( = ?auto_1213492 ?auto_1213502 ) ) ( not ( = ?auto_1213494 ?auto_1213495 ) ) ( not ( = ?auto_1213494 ?auto_1213496 ) ) ( not ( = ?auto_1213494 ?auto_1213497 ) ) ( not ( = ?auto_1213494 ?auto_1213498 ) ) ( not ( = ?auto_1213494 ?auto_1213499 ) ) ( not ( = ?auto_1213494 ?auto_1213500 ) ) ( not ( = ?auto_1213494 ?auto_1213501 ) ) ( not ( = ?auto_1213494 ?auto_1213508 ) ) ( not ( = ?auto_1213494 ?auto_1213502 ) ) ( not ( = ?auto_1213495 ?auto_1213496 ) ) ( not ( = ?auto_1213495 ?auto_1213497 ) ) ( not ( = ?auto_1213495 ?auto_1213498 ) ) ( not ( = ?auto_1213495 ?auto_1213499 ) ) ( not ( = ?auto_1213495 ?auto_1213500 ) ) ( not ( = ?auto_1213495 ?auto_1213501 ) ) ( not ( = ?auto_1213495 ?auto_1213508 ) ) ( not ( = ?auto_1213495 ?auto_1213502 ) ) ( not ( = ?auto_1213496 ?auto_1213497 ) ) ( not ( = ?auto_1213496 ?auto_1213498 ) ) ( not ( = ?auto_1213496 ?auto_1213499 ) ) ( not ( = ?auto_1213496 ?auto_1213500 ) ) ( not ( = ?auto_1213496 ?auto_1213501 ) ) ( not ( = ?auto_1213496 ?auto_1213508 ) ) ( not ( = ?auto_1213496 ?auto_1213502 ) ) ( not ( = ?auto_1213497 ?auto_1213498 ) ) ( not ( = ?auto_1213497 ?auto_1213499 ) ) ( not ( = ?auto_1213497 ?auto_1213500 ) ) ( not ( = ?auto_1213497 ?auto_1213501 ) ) ( not ( = ?auto_1213497 ?auto_1213508 ) ) ( not ( = ?auto_1213497 ?auto_1213502 ) ) ( not ( = ?auto_1213498 ?auto_1213499 ) ) ( not ( = ?auto_1213498 ?auto_1213500 ) ) ( not ( = ?auto_1213498 ?auto_1213501 ) ) ( not ( = ?auto_1213498 ?auto_1213508 ) ) ( not ( = ?auto_1213498 ?auto_1213502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213499 ?auto_1213500 ?auto_1213501 )
      ( MAKE-12CRATE-VERIFY ?auto_1213489 ?auto_1213490 ?auto_1213491 ?auto_1213493 ?auto_1213492 ?auto_1213494 ?auto_1213495 ?auto_1213496 ?auto_1213497 ?auto_1213498 ?auto_1213499 ?auto_1213500 ?auto_1213501 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1213645 - SURFACE
      ?auto_1213646 - SURFACE
      ?auto_1213647 - SURFACE
      ?auto_1213649 - SURFACE
      ?auto_1213648 - SURFACE
      ?auto_1213650 - SURFACE
      ?auto_1213651 - SURFACE
      ?auto_1213652 - SURFACE
      ?auto_1213653 - SURFACE
      ?auto_1213654 - SURFACE
      ?auto_1213655 - SURFACE
      ?auto_1213656 - SURFACE
    )
    :vars
    (
      ?auto_1213663 - HOIST
      ?auto_1213659 - PLACE
      ?auto_1213661 - PLACE
      ?auto_1213657 - HOIST
      ?auto_1213662 - SURFACE
      ?auto_1213660 - SURFACE
      ?auto_1213658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213663 ?auto_1213659 ) ( IS-CRATE ?auto_1213656 ) ( not ( = ?auto_1213655 ?auto_1213656 ) ) ( not ( = ?auto_1213654 ?auto_1213655 ) ) ( not ( = ?auto_1213654 ?auto_1213656 ) ) ( not ( = ?auto_1213661 ?auto_1213659 ) ) ( HOIST-AT ?auto_1213657 ?auto_1213661 ) ( not ( = ?auto_1213663 ?auto_1213657 ) ) ( SURFACE-AT ?auto_1213656 ?auto_1213661 ) ( ON ?auto_1213656 ?auto_1213662 ) ( CLEAR ?auto_1213656 ) ( not ( = ?auto_1213655 ?auto_1213662 ) ) ( not ( = ?auto_1213656 ?auto_1213662 ) ) ( not ( = ?auto_1213654 ?auto_1213662 ) ) ( SURFACE-AT ?auto_1213654 ?auto_1213659 ) ( CLEAR ?auto_1213654 ) ( IS-CRATE ?auto_1213655 ) ( AVAILABLE ?auto_1213663 ) ( AVAILABLE ?auto_1213657 ) ( SURFACE-AT ?auto_1213655 ?auto_1213661 ) ( ON ?auto_1213655 ?auto_1213660 ) ( CLEAR ?auto_1213655 ) ( not ( = ?auto_1213655 ?auto_1213660 ) ) ( not ( = ?auto_1213656 ?auto_1213660 ) ) ( not ( = ?auto_1213654 ?auto_1213660 ) ) ( not ( = ?auto_1213662 ?auto_1213660 ) ) ( TRUCK-AT ?auto_1213658 ?auto_1213659 ) ( ON ?auto_1213646 ?auto_1213645 ) ( ON ?auto_1213647 ?auto_1213646 ) ( ON ?auto_1213649 ?auto_1213647 ) ( ON ?auto_1213648 ?auto_1213649 ) ( ON ?auto_1213650 ?auto_1213648 ) ( ON ?auto_1213651 ?auto_1213650 ) ( ON ?auto_1213652 ?auto_1213651 ) ( ON ?auto_1213653 ?auto_1213652 ) ( ON ?auto_1213654 ?auto_1213653 ) ( not ( = ?auto_1213645 ?auto_1213646 ) ) ( not ( = ?auto_1213645 ?auto_1213647 ) ) ( not ( = ?auto_1213645 ?auto_1213649 ) ) ( not ( = ?auto_1213645 ?auto_1213648 ) ) ( not ( = ?auto_1213645 ?auto_1213650 ) ) ( not ( = ?auto_1213645 ?auto_1213651 ) ) ( not ( = ?auto_1213645 ?auto_1213652 ) ) ( not ( = ?auto_1213645 ?auto_1213653 ) ) ( not ( = ?auto_1213645 ?auto_1213654 ) ) ( not ( = ?auto_1213645 ?auto_1213655 ) ) ( not ( = ?auto_1213645 ?auto_1213656 ) ) ( not ( = ?auto_1213645 ?auto_1213662 ) ) ( not ( = ?auto_1213645 ?auto_1213660 ) ) ( not ( = ?auto_1213646 ?auto_1213647 ) ) ( not ( = ?auto_1213646 ?auto_1213649 ) ) ( not ( = ?auto_1213646 ?auto_1213648 ) ) ( not ( = ?auto_1213646 ?auto_1213650 ) ) ( not ( = ?auto_1213646 ?auto_1213651 ) ) ( not ( = ?auto_1213646 ?auto_1213652 ) ) ( not ( = ?auto_1213646 ?auto_1213653 ) ) ( not ( = ?auto_1213646 ?auto_1213654 ) ) ( not ( = ?auto_1213646 ?auto_1213655 ) ) ( not ( = ?auto_1213646 ?auto_1213656 ) ) ( not ( = ?auto_1213646 ?auto_1213662 ) ) ( not ( = ?auto_1213646 ?auto_1213660 ) ) ( not ( = ?auto_1213647 ?auto_1213649 ) ) ( not ( = ?auto_1213647 ?auto_1213648 ) ) ( not ( = ?auto_1213647 ?auto_1213650 ) ) ( not ( = ?auto_1213647 ?auto_1213651 ) ) ( not ( = ?auto_1213647 ?auto_1213652 ) ) ( not ( = ?auto_1213647 ?auto_1213653 ) ) ( not ( = ?auto_1213647 ?auto_1213654 ) ) ( not ( = ?auto_1213647 ?auto_1213655 ) ) ( not ( = ?auto_1213647 ?auto_1213656 ) ) ( not ( = ?auto_1213647 ?auto_1213662 ) ) ( not ( = ?auto_1213647 ?auto_1213660 ) ) ( not ( = ?auto_1213649 ?auto_1213648 ) ) ( not ( = ?auto_1213649 ?auto_1213650 ) ) ( not ( = ?auto_1213649 ?auto_1213651 ) ) ( not ( = ?auto_1213649 ?auto_1213652 ) ) ( not ( = ?auto_1213649 ?auto_1213653 ) ) ( not ( = ?auto_1213649 ?auto_1213654 ) ) ( not ( = ?auto_1213649 ?auto_1213655 ) ) ( not ( = ?auto_1213649 ?auto_1213656 ) ) ( not ( = ?auto_1213649 ?auto_1213662 ) ) ( not ( = ?auto_1213649 ?auto_1213660 ) ) ( not ( = ?auto_1213648 ?auto_1213650 ) ) ( not ( = ?auto_1213648 ?auto_1213651 ) ) ( not ( = ?auto_1213648 ?auto_1213652 ) ) ( not ( = ?auto_1213648 ?auto_1213653 ) ) ( not ( = ?auto_1213648 ?auto_1213654 ) ) ( not ( = ?auto_1213648 ?auto_1213655 ) ) ( not ( = ?auto_1213648 ?auto_1213656 ) ) ( not ( = ?auto_1213648 ?auto_1213662 ) ) ( not ( = ?auto_1213648 ?auto_1213660 ) ) ( not ( = ?auto_1213650 ?auto_1213651 ) ) ( not ( = ?auto_1213650 ?auto_1213652 ) ) ( not ( = ?auto_1213650 ?auto_1213653 ) ) ( not ( = ?auto_1213650 ?auto_1213654 ) ) ( not ( = ?auto_1213650 ?auto_1213655 ) ) ( not ( = ?auto_1213650 ?auto_1213656 ) ) ( not ( = ?auto_1213650 ?auto_1213662 ) ) ( not ( = ?auto_1213650 ?auto_1213660 ) ) ( not ( = ?auto_1213651 ?auto_1213652 ) ) ( not ( = ?auto_1213651 ?auto_1213653 ) ) ( not ( = ?auto_1213651 ?auto_1213654 ) ) ( not ( = ?auto_1213651 ?auto_1213655 ) ) ( not ( = ?auto_1213651 ?auto_1213656 ) ) ( not ( = ?auto_1213651 ?auto_1213662 ) ) ( not ( = ?auto_1213651 ?auto_1213660 ) ) ( not ( = ?auto_1213652 ?auto_1213653 ) ) ( not ( = ?auto_1213652 ?auto_1213654 ) ) ( not ( = ?auto_1213652 ?auto_1213655 ) ) ( not ( = ?auto_1213652 ?auto_1213656 ) ) ( not ( = ?auto_1213652 ?auto_1213662 ) ) ( not ( = ?auto_1213652 ?auto_1213660 ) ) ( not ( = ?auto_1213653 ?auto_1213654 ) ) ( not ( = ?auto_1213653 ?auto_1213655 ) ) ( not ( = ?auto_1213653 ?auto_1213656 ) ) ( not ( = ?auto_1213653 ?auto_1213662 ) ) ( not ( = ?auto_1213653 ?auto_1213660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213654 ?auto_1213655 ?auto_1213656 )
      ( MAKE-11CRATE-VERIFY ?auto_1213645 ?auto_1213646 ?auto_1213647 ?auto_1213649 ?auto_1213648 ?auto_1213650 ?auto_1213651 ?auto_1213652 ?auto_1213653 ?auto_1213654 ?auto_1213655 ?auto_1213656 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213664 - SURFACE
      ?auto_1213665 - SURFACE
      ?auto_1213666 - SURFACE
      ?auto_1213668 - SURFACE
      ?auto_1213667 - SURFACE
      ?auto_1213669 - SURFACE
      ?auto_1213670 - SURFACE
      ?auto_1213671 - SURFACE
      ?auto_1213672 - SURFACE
      ?auto_1213673 - SURFACE
      ?auto_1213674 - SURFACE
      ?auto_1213675 - SURFACE
      ?auto_1213676 - SURFACE
    )
    :vars
    (
      ?auto_1213683 - HOIST
      ?auto_1213679 - PLACE
      ?auto_1213681 - PLACE
      ?auto_1213677 - HOIST
      ?auto_1213682 - SURFACE
      ?auto_1213680 - SURFACE
      ?auto_1213678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213683 ?auto_1213679 ) ( IS-CRATE ?auto_1213676 ) ( not ( = ?auto_1213675 ?auto_1213676 ) ) ( not ( = ?auto_1213674 ?auto_1213675 ) ) ( not ( = ?auto_1213674 ?auto_1213676 ) ) ( not ( = ?auto_1213681 ?auto_1213679 ) ) ( HOIST-AT ?auto_1213677 ?auto_1213681 ) ( not ( = ?auto_1213683 ?auto_1213677 ) ) ( SURFACE-AT ?auto_1213676 ?auto_1213681 ) ( ON ?auto_1213676 ?auto_1213682 ) ( CLEAR ?auto_1213676 ) ( not ( = ?auto_1213675 ?auto_1213682 ) ) ( not ( = ?auto_1213676 ?auto_1213682 ) ) ( not ( = ?auto_1213674 ?auto_1213682 ) ) ( SURFACE-AT ?auto_1213674 ?auto_1213679 ) ( CLEAR ?auto_1213674 ) ( IS-CRATE ?auto_1213675 ) ( AVAILABLE ?auto_1213683 ) ( AVAILABLE ?auto_1213677 ) ( SURFACE-AT ?auto_1213675 ?auto_1213681 ) ( ON ?auto_1213675 ?auto_1213680 ) ( CLEAR ?auto_1213675 ) ( not ( = ?auto_1213675 ?auto_1213680 ) ) ( not ( = ?auto_1213676 ?auto_1213680 ) ) ( not ( = ?auto_1213674 ?auto_1213680 ) ) ( not ( = ?auto_1213682 ?auto_1213680 ) ) ( TRUCK-AT ?auto_1213678 ?auto_1213679 ) ( ON ?auto_1213665 ?auto_1213664 ) ( ON ?auto_1213666 ?auto_1213665 ) ( ON ?auto_1213668 ?auto_1213666 ) ( ON ?auto_1213667 ?auto_1213668 ) ( ON ?auto_1213669 ?auto_1213667 ) ( ON ?auto_1213670 ?auto_1213669 ) ( ON ?auto_1213671 ?auto_1213670 ) ( ON ?auto_1213672 ?auto_1213671 ) ( ON ?auto_1213673 ?auto_1213672 ) ( ON ?auto_1213674 ?auto_1213673 ) ( not ( = ?auto_1213664 ?auto_1213665 ) ) ( not ( = ?auto_1213664 ?auto_1213666 ) ) ( not ( = ?auto_1213664 ?auto_1213668 ) ) ( not ( = ?auto_1213664 ?auto_1213667 ) ) ( not ( = ?auto_1213664 ?auto_1213669 ) ) ( not ( = ?auto_1213664 ?auto_1213670 ) ) ( not ( = ?auto_1213664 ?auto_1213671 ) ) ( not ( = ?auto_1213664 ?auto_1213672 ) ) ( not ( = ?auto_1213664 ?auto_1213673 ) ) ( not ( = ?auto_1213664 ?auto_1213674 ) ) ( not ( = ?auto_1213664 ?auto_1213675 ) ) ( not ( = ?auto_1213664 ?auto_1213676 ) ) ( not ( = ?auto_1213664 ?auto_1213682 ) ) ( not ( = ?auto_1213664 ?auto_1213680 ) ) ( not ( = ?auto_1213665 ?auto_1213666 ) ) ( not ( = ?auto_1213665 ?auto_1213668 ) ) ( not ( = ?auto_1213665 ?auto_1213667 ) ) ( not ( = ?auto_1213665 ?auto_1213669 ) ) ( not ( = ?auto_1213665 ?auto_1213670 ) ) ( not ( = ?auto_1213665 ?auto_1213671 ) ) ( not ( = ?auto_1213665 ?auto_1213672 ) ) ( not ( = ?auto_1213665 ?auto_1213673 ) ) ( not ( = ?auto_1213665 ?auto_1213674 ) ) ( not ( = ?auto_1213665 ?auto_1213675 ) ) ( not ( = ?auto_1213665 ?auto_1213676 ) ) ( not ( = ?auto_1213665 ?auto_1213682 ) ) ( not ( = ?auto_1213665 ?auto_1213680 ) ) ( not ( = ?auto_1213666 ?auto_1213668 ) ) ( not ( = ?auto_1213666 ?auto_1213667 ) ) ( not ( = ?auto_1213666 ?auto_1213669 ) ) ( not ( = ?auto_1213666 ?auto_1213670 ) ) ( not ( = ?auto_1213666 ?auto_1213671 ) ) ( not ( = ?auto_1213666 ?auto_1213672 ) ) ( not ( = ?auto_1213666 ?auto_1213673 ) ) ( not ( = ?auto_1213666 ?auto_1213674 ) ) ( not ( = ?auto_1213666 ?auto_1213675 ) ) ( not ( = ?auto_1213666 ?auto_1213676 ) ) ( not ( = ?auto_1213666 ?auto_1213682 ) ) ( not ( = ?auto_1213666 ?auto_1213680 ) ) ( not ( = ?auto_1213668 ?auto_1213667 ) ) ( not ( = ?auto_1213668 ?auto_1213669 ) ) ( not ( = ?auto_1213668 ?auto_1213670 ) ) ( not ( = ?auto_1213668 ?auto_1213671 ) ) ( not ( = ?auto_1213668 ?auto_1213672 ) ) ( not ( = ?auto_1213668 ?auto_1213673 ) ) ( not ( = ?auto_1213668 ?auto_1213674 ) ) ( not ( = ?auto_1213668 ?auto_1213675 ) ) ( not ( = ?auto_1213668 ?auto_1213676 ) ) ( not ( = ?auto_1213668 ?auto_1213682 ) ) ( not ( = ?auto_1213668 ?auto_1213680 ) ) ( not ( = ?auto_1213667 ?auto_1213669 ) ) ( not ( = ?auto_1213667 ?auto_1213670 ) ) ( not ( = ?auto_1213667 ?auto_1213671 ) ) ( not ( = ?auto_1213667 ?auto_1213672 ) ) ( not ( = ?auto_1213667 ?auto_1213673 ) ) ( not ( = ?auto_1213667 ?auto_1213674 ) ) ( not ( = ?auto_1213667 ?auto_1213675 ) ) ( not ( = ?auto_1213667 ?auto_1213676 ) ) ( not ( = ?auto_1213667 ?auto_1213682 ) ) ( not ( = ?auto_1213667 ?auto_1213680 ) ) ( not ( = ?auto_1213669 ?auto_1213670 ) ) ( not ( = ?auto_1213669 ?auto_1213671 ) ) ( not ( = ?auto_1213669 ?auto_1213672 ) ) ( not ( = ?auto_1213669 ?auto_1213673 ) ) ( not ( = ?auto_1213669 ?auto_1213674 ) ) ( not ( = ?auto_1213669 ?auto_1213675 ) ) ( not ( = ?auto_1213669 ?auto_1213676 ) ) ( not ( = ?auto_1213669 ?auto_1213682 ) ) ( not ( = ?auto_1213669 ?auto_1213680 ) ) ( not ( = ?auto_1213670 ?auto_1213671 ) ) ( not ( = ?auto_1213670 ?auto_1213672 ) ) ( not ( = ?auto_1213670 ?auto_1213673 ) ) ( not ( = ?auto_1213670 ?auto_1213674 ) ) ( not ( = ?auto_1213670 ?auto_1213675 ) ) ( not ( = ?auto_1213670 ?auto_1213676 ) ) ( not ( = ?auto_1213670 ?auto_1213682 ) ) ( not ( = ?auto_1213670 ?auto_1213680 ) ) ( not ( = ?auto_1213671 ?auto_1213672 ) ) ( not ( = ?auto_1213671 ?auto_1213673 ) ) ( not ( = ?auto_1213671 ?auto_1213674 ) ) ( not ( = ?auto_1213671 ?auto_1213675 ) ) ( not ( = ?auto_1213671 ?auto_1213676 ) ) ( not ( = ?auto_1213671 ?auto_1213682 ) ) ( not ( = ?auto_1213671 ?auto_1213680 ) ) ( not ( = ?auto_1213672 ?auto_1213673 ) ) ( not ( = ?auto_1213672 ?auto_1213674 ) ) ( not ( = ?auto_1213672 ?auto_1213675 ) ) ( not ( = ?auto_1213672 ?auto_1213676 ) ) ( not ( = ?auto_1213672 ?auto_1213682 ) ) ( not ( = ?auto_1213672 ?auto_1213680 ) ) ( not ( = ?auto_1213673 ?auto_1213674 ) ) ( not ( = ?auto_1213673 ?auto_1213675 ) ) ( not ( = ?auto_1213673 ?auto_1213676 ) ) ( not ( = ?auto_1213673 ?auto_1213682 ) ) ( not ( = ?auto_1213673 ?auto_1213680 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213674 ?auto_1213675 ?auto_1213676 )
      ( MAKE-12CRATE-VERIFY ?auto_1213664 ?auto_1213665 ?auto_1213666 ?auto_1213668 ?auto_1213667 ?auto_1213669 ?auto_1213670 ?auto_1213671 ?auto_1213672 ?auto_1213673 ?auto_1213674 ?auto_1213675 ?auto_1213676 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1213822 - SURFACE
      ?auto_1213823 - SURFACE
      ?auto_1213824 - SURFACE
      ?auto_1213826 - SURFACE
      ?auto_1213825 - SURFACE
      ?auto_1213827 - SURFACE
      ?auto_1213828 - SURFACE
      ?auto_1213829 - SURFACE
      ?auto_1213830 - SURFACE
      ?auto_1213831 - SURFACE
      ?auto_1213832 - SURFACE
      ?auto_1213833 - SURFACE
    )
    :vars
    (
      ?auto_1213835 - HOIST
      ?auto_1213839 - PLACE
      ?auto_1213837 - PLACE
      ?auto_1213840 - HOIST
      ?auto_1213836 - SURFACE
      ?auto_1213838 - SURFACE
      ?auto_1213834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213835 ?auto_1213839 ) ( IS-CRATE ?auto_1213833 ) ( not ( = ?auto_1213832 ?auto_1213833 ) ) ( not ( = ?auto_1213831 ?auto_1213832 ) ) ( not ( = ?auto_1213831 ?auto_1213833 ) ) ( not ( = ?auto_1213837 ?auto_1213839 ) ) ( HOIST-AT ?auto_1213840 ?auto_1213837 ) ( not ( = ?auto_1213835 ?auto_1213840 ) ) ( SURFACE-AT ?auto_1213833 ?auto_1213837 ) ( ON ?auto_1213833 ?auto_1213836 ) ( CLEAR ?auto_1213833 ) ( not ( = ?auto_1213832 ?auto_1213836 ) ) ( not ( = ?auto_1213833 ?auto_1213836 ) ) ( not ( = ?auto_1213831 ?auto_1213836 ) ) ( IS-CRATE ?auto_1213832 ) ( AVAILABLE ?auto_1213840 ) ( SURFACE-AT ?auto_1213832 ?auto_1213837 ) ( ON ?auto_1213832 ?auto_1213838 ) ( CLEAR ?auto_1213832 ) ( not ( = ?auto_1213832 ?auto_1213838 ) ) ( not ( = ?auto_1213833 ?auto_1213838 ) ) ( not ( = ?auto_1213831 ?auto_1213838 ) ) ( not ( = ?auto_1213836 ?auto_1213838 ) ) ( TRUCK-AT ?auto_1213834 ?auto_1213839 ) ( SURFACE-AT ?auto_1213830 ?auto_1213839 ) ( CLEAR ?auto_1213830 ) ( LIFTING ?auto_1213835 ?auto_1213831 ) ( IS-CRATE ?auto_1213831 ) ( not ( = ?auto_1213830 ?auto_1213831 ) ) ( not ( = ?auto_1213832 ?auto_1213830 ) ) ( not ( = ?auto_1213833 ?auto_1213830 ) ) ( not ( = ?auto_1213836 ?auto_1213830 ) ) ( not ( = ?auto_1213838 ?auto_1213830 ) ) ( ON ?auto_1213823 ?auto_1213822 ) ( ON ?auto_1213824 ?auto_1213823 ) ( ON ?auto_1213826 ?auto_1213824 ) ( ON ?auto_1213825 ?auto_1213826 ) ( ON ?auto_1213827 ?auto_1213825 ) ( ON ?auto_1213828 ?auto_1213827 ) ( ON ?auto_1213829 ?auto_1213828 ) ( ON ?auto_1213830 ?auto_1213829 ) ( not ( = ?auto_1213822 ?auto_1213823 ) ) ( not ( = ?auto_1213822 ?auto_1213824 ) ) ( not ( = ?auto_1213822 ?auto_1213826 ) ) ( not ( = ?auto_1213822 ?auto_1213825 ) ) ( not ( = ?auto_1213822 ?auto_1213827 ) ) ( not ( = ?auto_1213822 ?auto_1213828 ) ) ( not ( = ?auto_1213822 ?auto_1213829 ) ) ( not ( = ?auto_1213822 ?auto_1213830 ) ) ( not ( = ?auto_1213822 ?auto_1213831 ) ) ( not ( = ?auto_1213822 ?auto_1213832 ) ) ( not ( = ?auto_1213822 ?auto_1213833 ) ) ( not ( = ?auto_1213822 ?auto_1213836 ) ) ( not ( = ?auto_1213822 ?auto_1213838 ) ) ( not ( = ?auto_1213823 ?auto_1213824 ) ) ( not ( = ?auto_1213823 ?auto_1213826 ) ) ( not ( = ?auto_1213823 ?auto_1213825 ) ) ( not ( = ?auto_1213823 ?auto_1213827 ) ) ( not ( = ?auto_1213823 ?auto_1213828 ) ) ( not ( = ?auto_1213823 ?auto_1213829 ) ) ( not ( = ?auto_1213823 ?auto_1213830 ) ) ( not ( = ?auto_1213823 ?auto_1213831 ) ) ( not ( = ?auto_1213823 ?auto_1213832 ) ) ( not ( = ?auto_1213823 ?auto_1213833 ) ) ( not ( = ?auto_1213823 ?auto_1213836 ) ) ( not ( = ?auto_1213823 ?auto_1213838 ) ) ( not ( = ?auto_1213824 ?auto_1213826 ) ) ( not ( = ?auto_1213824 ?auto_1213825 ) ) ( not ( = ?auto_1213824 ?auto_1213827 ) ) ( not ( = ?auto_1213824 ?auto_1213828 ) ) ( not ( = ?auto_1213824 ?auto_1213829 ) ) ( not ( = ?auto_1213824 ?auto_1213830 ) ) ( not ( = ?auto_1213824 ?auto_1213831 ) ) ( not ( = ?auto_1213824 ?auto_1213832 ) ) ( not ( = ?auto_1213824 ?auto_1213833 ) ) ( not ( = ?auto_1213824 ?auto_1213836 ) ) ( not ( = ?auto_1213824 ?auto_1213838 ) ) ( not ( = ?auto_1213826 ?auto_1213825 ) ) ( not ( = ?auto_1213826 ?auto_1213827 ) ) ( not ( = ?auto_1213826 ?auto_1213828 ) ) ( not ( = ?auto_1213826 ?auto_1213829 ) ) ( not ( = ?auto_1213826 ?auto_1213830 ) ) ( not ( = ?auto_1213826 ?auto_1213831 ) ) ( not ( = ?auto_1213826 ?auto_1213832 ) ) ( not ( = ?auto_1213826 ?auto_1213833 ) ) ( not ( = ?auto_1213826 ?auto_1213836 ) ) ( not ( = ?auto_1213826 ?auto_1213838 ) ) ( not ( = ?auto_1213825 ?auto_1213827 ) ) ( not ( = ?auto_1213825 ?auto_1213828 ) ) ( not ( = ?auto_1213825 ?auto_1213829 ) ) ( not ( = ?auto_1213825 ?auto_1213830 ) ) ( not ( = ?auto_1213825 ?auto_1213831 ) ) ( not ( = ?auto_1213825 ?auto_1213832 ) ) ( not ( = ?auto_1213825 ?auto_1213833 ) ) ( not ( = ?auto_1213825 ?auto_1213836 ) ) ( not ( = ?auto_1213825 ?auto_1213838 ) ) ( not ( = ?auto_1213827 ?auto_1213828 ) ) ( not ( = ?auto_1213827 ?auto_1213829 ) ) ( not ( = ?auto_1213827 ?auto_1213830 ) ) ( not ( = ?auto_1213827 ?auto_1213831 ) ) ( not ( = ?auto_1213827 ?auto_1213832 ) ) ( not ( = ?auto_1213827 ?auto_1213833 ) ) ( not ( = ?auto_1213827 ?auto_1213836 ) ) ( not ( = ?auto_1213827 ?auto_1213838 ) ) ( not ( = ?auto_1213828 ?auto_1213829 ) ) ( not ( = ?auto_1213828 ?auto_1213830 ) ) ( not ( = ?auto_1213828 ?auto_1213831 ) ) ( not ( = ?auto_1213828 ?auto_1213832 ) ) ( not ( = ?auto_1213828 ?auto_1213833 ) ) ( not ( = ?auto_1213828 ?auto_1213836 ) ) ( not ( = ?auto_1213828 ?auto_1213838 ) ) ( not ( = ?auto_1213829 ?auto_1213830 ) ) ( not ( = ?auto_1213829 ?auto_1213831 ) ) ( not ( = ?auto_1213829 ?auto_1213832 ) ) ( not ( = ?auto_1213829 ?auto_1213833 ) ) ( not ( = ?auto_1213829 ?auto_1213836 ) ) ( not ( = ?auto_1213829 ?auto_1213838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213831 ?auto_1213832 ?auto_1213833 )
      ( MAKE-11CRATE-VERIFY ?auto_1213822 ?auto_1213823 ?auto_1213824 ?auto_1213826 ?auto_1213825 ?auto_1213827 ?auto_1213828 ?auto_1213829 ?auto_1213830 ?auto_1213831 ?auto_1213832 ?auto_1213833 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213841 - SURFACE
      ?auto_1213842 - SURFACE
      ?auto_1213843 - SURFACE
      ?auto_1213845 - SURFACE
      ?auto_1213844 - SURFACE
      ?auto_1213846 - SURFACE
      ?auto_1213847 - SURFACE
      ?auto_1213848 - SURFACE
      ?auto_1213849 - SURFACE
      ?auto_1213850 - SURFACE
      ?auto_1213851 - SURFACE
      ?auto_1213852 - SURFACE
      ?auto_1213853 - SURFACE
    )
    :vars
    (
      ?auto_1213855 - HOIST
      ?auto_1213859 - PLACE
      ?auto_1213857 - PLACE
      ?auto_1213860 - HOIST
      ?auto_1213856 - SURFACE
      ?auto_1213858 - SURFACE
      ?auto_1213854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213855 ?auto_1213859 ) ( IS-CRATE ?auto_1213853 ) ( not ( = ?auto_1213852 ?auto_1213853 ) ) ( not ( = ?auto_1213851 ?auto_1213852 ) ) ( not ( = ?auto_1213851 ?auto_1213853 ) ) ( not ( = ?auto_1213857 ?auto_1213859 ) ) ( HOIST-AT ?auto_1213860 ?auto_1213857 ) ( not ( = ?auto_1213855 ?auto_1213860 ) ) ( SURFACE-AT ?auto_1213853 ?auto_1213857 ) ( ON ?auto_1213853 ?auto_1213856 ) ( CLEAR ?auto_1213853 ) ( not ( = ?auto_1213852 ?auto_1213856 ) ) ( not ( = ?auto_1213853 ?auto_1213856 ) ) ( not ( = ?auto_1213851 ?auto_1213856 ) ) ( IS-CRATE ?auto_1213852 ) ( AVAILABLE ?auto_1213860 ) ( SURFACE-AT ?auto_1213852 ?auto_1213857 ) ( ON ?auto_1213852 ?auto_1213858 ) ( CLEAR ?auto_1213852 ) ( not ( = ?auto_1213852 ?auto_1213858 ) ) ( not ( = ?auto_1213853 ?auto_1213858 ) ) ( not ( = ?auto_1213851 ?auto_1213858 ) ) ( not ( = ?auto_1213856 ?auto_1213858 ) ) ( TRUCK-AT ?auto_1213854 ?auto_1213859 ) ( SURFACE-AT ?auto_1213850 ?auto_1213859 ) ( CLEAR ?auto_1213850 ) ( LIFTING ?auto_1213855 ?auto_1213851 ) ( IS-CRATE ?auto_1213851 ) ( not ( = ?auto_1213850 ?auto_1213851 ) ) ( not ( = ?auto_1213852 ?auto_1213850 ) ) ( not ( = ?auto_1213853 ?auto_1213850 ) ) ( not ( = ?auto_1213856 ?auto_1213850 ) ) ( not ( = ?auto_1213858 ?auto_1213850 ) ) ( ON ?auto_1213842 ?auto_1213841 ) ( ON ?auto_1213843 ?auto_1213842 ) ( ON ?auto_1213845 ?auto_1213843 ) ( ON ?auto_1213844 ?auto_1213845 ) ( ON ?auto_1213846 ?auto_1213844 ) ( ON ?auto_1213847 ?auto_1213846 ) ( ON ?auto_1213848 ?auto_1213847 ) ( ON ?auto_1213849 ?auto_1213848 ) ( ON ?auto_1213850 ?auto_1213849 ) ( not ( = ?auto_1213841 ?auto_1213842 ) ) ( not ( = ?auto_1213841 ?auto_1213843 ) ) ( not ( = ?auto_1213841 ?auto_1213845 ) ) ( not ( = ?auto_1213841 ?auto_1213844 ) ) ( not ( = ?auto_1213841 ?auto_1213846 ) ) ( not ( = ?auto_1213841 ?auto_1213847 ) ) ( not ( = ?auto_1213841 ?auto_1213848 ) ) ( not ( = ?auto_1213841 ?auto_1213849 ) ) ( not ( = ?auto_1213841 ?auto_1213850 ) ) ( not ( = ?auto_1213841 ?auto_1213851 ) ) ( not ( = ?auto_1213841 ?auto_1213852 ) ) ( not ( = ?auto_1213841 ?auto_1213853 ) ) ( not ( = ?auto_1213841 ?auto_1213856 ) ) ( not ( = ?auto_1213841 ?auto_1213858 ) ) ( not ( = ?auto_1213842 ?auto_1213843 ) ) ( not ( = ?auto_1213842 ?auto_1213845 ) ) ( not ( = ?auto_1213842 ?auto_1213844 ) ) ( not ( = ?auto_1213842 ?auto_1213846 ) ) ( not ( = ?auto_1213842 ?auto_1213847 ) ) ( not ( = ?auto_1213842 ?auto_1213848 ) ) ( not ( = ?auto_1213842 ?auto_1213849 ) ) ( not ( = ?auto_1213842 ?auto_1213850 ) ) ( not ( = ?auto_1213842 ?auto_1213851 ) ) ( not ( = ?auto_1213842 ?auto_1213852 ) ) ( not ( = ?auto_1213842 ?auto_1213853 ) ) ( not ( = ?auto_1213842 ?auto_1213856 ) ) ( not ( = ?auto_1213842 ?auto_1213858 ) ) ( not ( = ?auto_1213843 ?auto_1213845 ) ) ( not ( = ?auto_1213843 ?auto_1213844 ) ) ( not ( = ?auto_1213843 ?auto_1213846 ) ) ( not ( = ?auto_1213843 ?auto_1213847 ) ) ( not ( = ?auto_1213843 ?auto_1213848 ) ) ( not ( = ?auto_1213843 ?auto_1213849 ) ) ( not ( = ?auto_1213843 ?auto_1213850 ) ) ( not ( = ?auto_1213843 ?auto_1213851 ) ) ( not ( = ?auto_1213843 ?auto_1213852 ) ) ( not ( = ?auto_1213843 ?auto_1213853 ) ) ( not ( = ?auto_1213843 ?auto_1213856 ) ) ( not ( = ?auto_1213843 ?auto_1213858 ) ) ( not ( = ?auto_1213845 ?auto_1213844 ) ) ( not ( = ?auto_1213845 ?auto_1213846 ) ) ( not ( = ?auto_1213845 ?auto_1213847 ) ) ( not ( = ?auto_1213845 ?auto_1213848 ) ) ( not ( = ?auto_1213845 ?auto_1213849 ) ) ( not ( = ?auto_1213845 ?auto_1213850 ) ) ( not ( = ?auto_1213845 ?auto_1213851 ) ) ( not ( = ?auto_1213845 ?auto_1213852 ) ) ( not ( = ?auto_1213845 ?auto_1213853 ) ) ( not ( = ?auto_1213845 ?auto_1213856 ) ) ( not ( = ?auto_1213845 ?auto_1213858 ) ) ( not ( = ?auto_1213844 ?auto_1213846 ) ) ( not ( = ?auto_1213844 ?auto_1213847 ) ) ( not ( = ?auto_1213844 ?auto_1213848 ) ) ( not ( = ?auto_1213844 ?auto_1213849 ) ) ( not ( = ?auto_1213844 ?auto_1213850 ) ) ( not ( = ?auto_1213844 ?auto_1213851 ) ) ( not ( = ?auto_1213844 ?auto_1213852 ) ) ( not ( = ?auto_1213844 ?auto_1213853 ) ) ( not ( = ?auto_1213844 ?auto_1213856 ) ) ( not ( = ?auto_1213844 ?auto_1213858 ) ) ( not ( = ?auto_1213846 ?auto_1213847 ) ) ( not ( = ?auto_1213846 ?auto_1213848 ) ) ( not ( = ?auto_1213846 ?auto_1213849 ) ) ( not ( = ?auto_1213846 ?auto_1213850 ) ) ( not ( = ?auto_1213846 ?auto_1213851 ) ) ( not ( = ?auto_1213846 ?auto_1213852 ) ) ( not ( = ?auto_1213846 ?auto_1213853 ) ) ( not ( = ?auto_1213846 ?auto_1213856 ) ) ( not ( = ?auto_1213846 ?auto_1213858 ) ) ( not ( = ?auto_1213847 ?auto_1213848 ) ) ( not ( = ?auto_1213847 ?auto_1213849 ) ) ( not ( = ?auto_1213847 ?auto_1213850 ) ) ( not ( = ?auto_1213847 ?auto_1213851 ) ) ( not ( = ?auto_1213847 ?auto_1213852 ) ) ( not ( = ?auto_1213847 ?auto_1213853 ) ) ( not ( = ?auto_1213847 ?auto_1213856 ) ) ( not ( = ?auto_1213847 ?auto_1213858 ) ) ( not ( = ?auto_1213848 ?auto_1213849 ) ) ( not ( = ?auto_1213848 ?auto_1213850 ) ) ( not ( = ?auto_1213848 ?auto_1213851 ) ) ( not ( = ?auto_1213848 ?auto_1213852 ) ) ( not ( = ?auto_1213848 ?auto_1213853 ) ) ( not ( = ?auto_1213848 ?auto_1213856 ) ) ( not ( = ?auto_1213848 ?auto_1213858 ) ) ( not ( = ?auto_1213849 ?auto_1213850 ) ) ( not ( = ?auto_1213849 ?auto_1213851 ) ) ( not ( = ?auto_1213849 ?auto_1213852 ) ) ( not ( = ?auto_1213849 ?auto_1213853 ) ) ( not ( = ?auto_1213849 ?auto_1213856 ) ) ( not ( = ?auto_1213849 ?auto_1213858 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213851 ?auto_1213852 ?auto_1213853 )
      ( MAKE-12CRATE-VERIFY ?auto_1213841 ?auto_1213842 ?auto_1213843 ?auto_1213845 ?auto_1213844 ?auto_1213846 ?auto_1213847 ?auto_1213848 ?auto_1213849 ?auto_1213850 ?auto_1213851 ?auto_1213852 ?auto_1213853 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1224410 - SURFACE
      ?auto_1224411 - SURFACE
      ?auto_1224412 - SURFACE
      ?auto_1224414 - SURFACE
      ?auto_1224413 - SURFACE
      ?auto_1224415 - SURFACE
      ?auto_1224416 - SURFACE
      ?auto_1224417 - SURFACE
      ?auto_1224418 - SURFACE
      ?auto_1224419 - SURFACE
      ?auto_1224420 - SURFACE
      ?auto_1224421 - SURFACE
      ?auto_1224422 - SURFACE
      ?auto_1224423 - SURFACE
    )
    :vars
    (
      ?auto_1224425 - HOIST
      ?auto_1224424 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1224425 ?auto_1224424 ) ( SURFACE-AT ?auto_1224422 ?auto_1224424 ) ( CLEAR ?auto_1224422 ) ( LIFTING ?auto_1224425 ?auto_1224423 ) ( IS-CRATE ?auto_1224423 ) ( not ( = ?auto_1224422 ?auto_1224423 ) ) ( ON ?auto_1224411 ?auto_1224410 ) ( ON ?auto_1224412 ?auto_1224411 ) ( ON ?auto_1224414 ?auto_1224412 ) ( ON ?auto_1224413 ?auto_1224414 ) ( ON ?auto_1224415 ?auto_1224413 ) ( ON ?auto_1224416 ?auto_1224415 ) ( ON ?auto_1224417 ?auto_1224416 ) ( ON ?auto_1224418 ?auto_1224417 ) ( ON ?auto_1224419 ?auto_1224418 ) ( ON ?auto_1224420 ?auto_1224419 ) ( ON ?auto_1224421 ?auto_1224420 ) ( ON ?auto_1224422 ?auto_1224421 ) ( not ( = ?auto_1224410 ?auto_1224411 ) ) ( not ( = ?auto_1224410 ?auto_1224412 ) ) ( not ( = ?auto_1224410 ?auto_1224414 ) ) ( not ( = ?auto_1224410 ?auto_1224413 ) ) ( not ( = ?auto_1224410 ?auto_1224415 ) ) ( not ( = ?auto_1224410 ?auto_1224416 ) ) ( not ( = ?auto_1224410 ?auto_1224417 ) ) ( not ( = ?auto_1224410 ?auto_1224418 ) ) ( not ( = ?auto_1224410 ?auto_1224419 ) ) ( not ( = ?auto_1224410 ?auto_1224420 ) ) ( not ( = ?auto_1224410 ?auto_1224421 ) ) ( not ( = ?auto_1224410 ?auto_1224422 ) ) ( not ( = ?auto_1224410 ?auto_1224423 ) ) ( not ( = ?auto_1224411 ?auto_1224412 ) ) ( not ( = ?auto_1224411 ?auto_1224414 ) ) ( not ( = ?auto_1224411 ?auto_1224413 ) ) ( not ( = ?auto_1224411 ?auto_1224415 ) ) ( not ( = ?auto_1224411 ?auto_1224416 ) ) ( not ( = ?auto_1224411 ?auto_1224417 ) ) ( not ( = ?auto_1224411 ?auto_1224418 ) ) ( not ( = ?auto_1224411 ?auto_1224419 ) ) ( not ( = ?auto_1224411 ?auto_1224420 ) ) ( not ( = ?auto_1224411 ?auto_1224421 ) ) ( not ( = ?auto_1224411 ?auto_1224422 ) ) ( not ( = ?auto_1224411 ?auto_1224423 ) ) ( not ( = ?auto_1224412 ?auto_1224414 ) ) ( not ( = ?auto_1224412 ?auto_1224413 ) ) ( not ( = ?auto_1224412 ?auto_1224415 ) ) ( not ( = ?auto_1224412 ?auto_1224416 ) ) ( not ( = ?auto_1224412 ?auto_1224417 ) ) ( not ( = ?auto_1224412 ?auto_1224418 ) ) ( not ( = ?auto_1224412 ?auto_1224419 ) ) ( not ( = ?auto_1224412 ?auto_1224420 ) ) ( not ( = ?auto_1224412 ?auto_1224421 ) ) ( not ( = ?auto_1224412 ?auto_1224422 ) ) ( not ( = ?auto_1224412 ?auto_1224423 ) ) ( not ( = ?auto_1224414 ?auto_1224413 ) ) ( not ( = ?auto_1224414 ?auto_1224415 ) ) ( not ( = ?auto_1224414 ?auto_1224416 ) ) ( not ( = ?auto_1224414 ?auto_1224417 ) ) ( not ( = ?auto_1224414 ?auto_1224418 ) ) ( not ( = ?auto_1224414 ?auto_1224419 ) ) ( not ( = ?auto_1224414 ?auto_1224420 ) ) ( not ( = ?auto_1224414 ?auto_1224421 ) ) ( not ( = ?auto_1224414 ?auto_1224422 ) ) ( not ( = ?auto_1224414 ?auto_1224423 ) ) ( not ( = ?auto_1224413 ?auto_1224415 ) ) ( not ( = ?auto_1224413 ?auto_1224416 ) ) ( not ( = ?auto_1224413 ?auto_1224417 ) ) ( not ( = ?auto_1224413 ?auto_1224418 ) ) ( not ( = ?auto_1224413 ?auto_1224419 ) ) ( not ( = ?auto_1224413 ?auto_1224420 ) ) ( not ( = ?auto_1224413 ?auto_1224421 ) ) ( not ( = ?auto_1224413 ?auto_1224422 ) ) ( not ( = ?auto_1224413 ?auto_1224423 ) ) ( not ( = ?auto_1224415 ?auto_1224416 ) ) ( not ( = ?auto_1224415 ?auto_1224417 ) ) ( not ( = ?auto_1224415 ?auto_1224418 ) ) ( not ( = ?auto_1224415 ?auto_1224419 ) ) ( not ( = ?auto_1224415 ?auto_1224420 ) ) ( not ( = ?auto_1224415 ?auto_1224421 ) ) ( not ( = ?auto_1224415 ?auto_1224422 ) ) ( not ( = ?auto_1224415 ?auto_1224423 ) ) ( not ( = ?auto_1224416 ?auto_1224417 ) ) ( not ( = ?auto_1224416 ?auto_1224418 ) ) ( not ( = ?auto_1224416 ?auto_1224419 ) ) ( not ( = ?auto_1224416 ?auto_1224420 ) ) ( not ( = ?auto_1224416 ?auto_1224421 ) ) ( not ( = ?auto_1224416 ?auto_1224422 ) ) ( not ( = ?auto_1224416 ?auto_1224423 ) ) ( not ( = ?auto_1224417 ?auto_1224418 ) ) ( not ( = ?auto_1224417 ?auto_1224419 ) ) ( not ( = ?auto_1224417 ?auto_1224420 ) ) ( not ( = ?auto_1224417 ?auto_1224421 ) ) ( not ( = ?auto_1224417 ?auto_1224422 ) ) ( not ( = ?auto_1224417 ?auto_1224423 ) ) ( not ( = ?auto_1224418 ?auto_1224419 ) ) ( not ( = ?auto_1224418 ?auto_1224420 ) ) ( not ( = ?auto_1224418 ?auto_1224421 ) ) ( not ( = ?auto_1224418 ?auto_1224422 ) ) ( not ( = ?auto_1224418 ?auto_1224423 ) ) ( not ( = ?auto_1224419 ?auto_1224420 ) ) ( not ( = ?auto_1224419 ?auto_1224421 ) ) ( not ( = ?auto_1224419 ?auto_1224422 ) ) ( not ( = ?auto_1224419 ?auto_1224423 ) ) ( not ( = ?auto_1224420 ?auto_1224421 ) ) ( not ( = ?auto_1224420 ?auto_1224422 ) ) ( not ( = ?auto_1224420 ?auto_1224423 ) ) ( not ( = ?auto_1224421 ?auto_1224422 ) ) ( not ( = ?auto_1224421 ?auto_1224423 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1224422 ?auto_1224423 )
      ( MAKE-13CRATE-VERIFY ?auto_1224410 ?auto_1224411 ?auto_1224412 ?auto_1224414 ?auto_1224413 ?auto_1224415 ?auto_1224416 ?auto_1224417 ?auto_1224418 ?auto_1224419 ?auto_1224420 ?auto_1224421 ?auto_1224422 ?auto_1224423 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1224552 - SURFACE
      ?auto_1224553 - SURFACE
      ?auto_1224554 - SURFACE
      ?auto_1224556 - SURFACE
      ?auto_1224555 - SURFACE
      ?auto_1224557 - SURFACE
      ?auto_1224558 - SURFACE
      ?auto_1224559 - SURFACE
      ?auto_1224560 - SURFACE
      ?auto_1224561 - SURFACE
      ?auto_1224562 - SURFACE
      ?auto_1224563 - SURFACE
      ?auto_1224564 - SURFACE
      ?auto_1224565 - SURFACE
    )
    :vars
    (
      ?auto_1224567 - HOIST
      ?auto_1224566 - PLACE
      ?auto_1224568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1224567 ?auto_1224566 ) ( SURFACE-AT ?auto_1224564 ?auto_1224566 ) ( CLEAR ?auto_1224564 ) ( IS-CRATE ?auto_1224565 ) ( not ( = ?auto_1224564 ?auto_1224565 ) ) ( TRUCK-AT ?auto_1224568 ?auto_1224566 ) ( AVAILABLE ?auto_1224567 ) ( IN ?auto_1224565 ?auto_1224568 ) ( ON ?auto_1224564 ?auto_1224563 ) ( not ( = ?auto_1224563 ?auto_1224564 ) ) ( not ( = ?auto_1224563 ?auto_1224565 ) ) ( ON ?auto_1224553 ?auto_1224552 ) ( ON ?auto_1224554 ?auto_1224553 ) ( ON ?auto_1224556 ?auto_1224554 ) ( ON ?auto_1224555 ?auto_1224556 ) ( ON ?auto_1224557 ?auto_1224555 ) ( ON ?auto_1224558 ?auto_1224557 ) ( ON ?auto_1224559 ?auto_1224558 ) ( ON ?auto_1224560 ?auto_1224559 ) ( ON ?auto_1224561 ?auto_1224560 ) ( ON ?auto_1224562 ?auto_1224561 ) ( ON ?auto_1224563 ?auto_1224562 ) ( not ( = ?auto_1224552 ?auto_1224553 ) ) ( not ( = ?auto_1224552 ?auto_1224554 ) ) ( not ( = ?auto_1224552 ?auto_1224556 ) ) ( not ( = ?auto_1224552 ?auto_1224555 ) ) ( not ( = ?auto_1224552 ?auto_1224557 ) ) ( not ( = ?auto_1224552 ?auto_1224558 ) ) ( not ( = ?auto_1224552 ?auto_1224559 ) ) ( not ( = ?auto_1224552 ?auto_1224560 ) ) ( not ( = ?auto_1224552 ?auto_1224561 ) ) ( not ( = ?auto_1224552 ?auto_1224562 ) ) ( not ( = ?auto_1224552 ?auto_1224563 ) ) ( not ( = ?auto_1224552 ?auto_1224564 ) ) ( not ( = ?auto_1224552 ?auto_1224565 ) ) ( not ( = ?auto_1224553 ?auto_1224554 ) ) ( not ( = ?auto_1224553 ?auto_1224556 ) ) ( not ( = ?auto_1224553 ?auto_1224555 ) ) ( not ( = ?auto_1224553 ?auto_1224557 ) ) ( not ( = ?auto_1224553 ?auto_1224558 ) ) ( not ( = ?auto_1224553 ?auto_1224559 ) ) ( not ( = ?auto_1224553 ?auto_1224560 ) ) ( not ( = ?auto_1224553 ?auto_1224561 ) ) ( not ( = ?auto_1224553 ?auto_1224562 ) ) ( not ( = ?auto_1224553 ?auto_1224563 ) ) ( not ( = ?auto_1224553 ?auto_1224564 ) ) ( not ( = ?auto_1224553 ?auto_1224565 ) ) ( not ( = ?auto_1224554 ?auto_1224556 ) ) ( not ( = ?auto_1224554 ?auto_1224555 ) ) ( not ( = ?auto_1224554 ?auto_1224557 ) ) ( not ( = ?auto_1224554 ?auto_1224558 ) ) ( not ( = ?auto_1224554 ?auto_1224559 ) ) ( not ( = ?auto_1224554 ?auto_1224560 ) ) ( not ( = ?auto_1224554 ?auto_1224561 ) ) ( not ( = ?auto_1224554 ?auto_1224562 ) ) ( not ( = ?auto_1224554 ?auto_1224563 ) ) ( not ( = ?auto_1224554 ?auto_1224564 ) ) ( not ( = ?auto_1224554 ?auto_1224565 ) ) ( not ( = ?auto_1224556 ?auto_1224555 ) ) ( not ( = ?auto_1224556 ?auto_1224557 ) ) ( not ( = ?auto_1224556 ?auto_1224558 ) ) ( not ( = ?auto_1224556 ?auto_1224559 ) ) ( not ( = ?auto_1224556 ?auto_1224560 ) ) ( not ( = ?auto_1224556 ?auto_1224561 ) ) ( not ( = ?auto_1224556 ?auto_1224562 ) ) ( not ( = ?auto_1224556 ?auto_1224563 ) ) ( not ( = ?auto_1224556 ?auto_1224564 ) ) ( not ( = ?auto_1224556 ?auto_1224565 ) ) ( not ( = ?auto_1224555 ?auto_1224557 ) ) ( not ( = ?auto_1224555 ?auto_1224558 ) ) ( not ( = ?auto_1224555 ?auto_1224559 ) ) ( not ( = ?auto_1224555 ?auto_1224560 ) ) ( not ( = ?auto_1224555 ?auto_1224561 ) ) ( not ( = ?auto_1224555 ?auto_1224562 ) ) ( not ( = ?auto_1224555 ?auto_1224563 ) ) ( not ( = ?auto_1224555 ?auto_1224564 ) ) ( not ( = ?auto_1224555 ?auto_1224565 ) ) ( not ( = ?auto_1224557 ?auto_1224558 ) ) ( not ( = ?auto_1224557 ?auto_1224559 ) ) ( not ( = ?auto_1224557 ?auto_1224560 ) ) ( not ( = ?auto_1224557 ?auto_1224561 ) ) ( not ( = ?auto_1224557 ?auto_1224562 ) ) ( not ( = ?auto_1224557 ?auto_1224563 ) ) ( not ( = ?auto_1224557 ?auto_1224564 ) ) ( not ( = ?auto_1224557 ?auto_1224565 ) ) ( not ( = ?auto_1224558 ?auto_1224559 ) ) ( not ( = ?auto_1224558 ?auto_1224560 ) ) ( not ( = ?auto_1224558 ?auto_1224561 ) ) ( not ( = ?auto_1224558 ?auto_1224562 ) ) ( not ( = ?auto_1224558 ?auto_1224563 ) ) ( not ( = ?auto_1224558 ?auto_1224564 ) ) ( not ( = ?auto_1224558 ?auto_1224565 ) ) ( not ( = ?auto_1224559 ?auto_1224560 ) ) ( not ( = ?auto_1224559 ?auto_1224561 ) ) ( not ( = ?auto_1224559 ?auto_1224562 ) ) ( not ( = ?auto_1224559 ?auto_1224563 ) ) ( not ( = ?auto_1224559 ?auto_1224564 ) ) ( not ( = ?auto_1224559 ?auto_1224565 ) ) ( not ( = ?auto_1224560 ?auto_1224561 ) ) ( not ( = ?auto_1224560 ?auto_1224562 ) ) ( not ( = ?auto_1224560 ?auto_1224563 ) ) ( not ( = ?auto_1224560 ?auto_1224564 ) ) ( not ( = ?auto_1224560 ?auto_1224565 ) ) ( not ( = ?auto_1224561 ?auto_1224562 ) ) ( not ( = ?auto_1224561 ?auto_1224563 ) ) ( not ( = ?auto_1224561 ?auto_1224564 ) ) ( not ( = ?auto_1224561 ?auto_1224565 ) ) ( not ( = ?auto_1224562 ?auto_1224563 ) ) ( not ( = ?auto_1224562 ?auto_1224564 ) ) ( not ( = ?auto_1224562 ?auto_1224565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1224563 ?auto_1224564 ?auto_1224565 )
      ( MAKE-13CRATE-VERIFY ?auto_1224552 ?auto_1224553 ?auto_1224554 ?auto_1224556 ?auto_1224555 ?auto_1224557 ?auto_1224558 ?auto_1224559 ?auto_1224560 ?auto_1224561 ?auto_1224562 ?auto_1224563 ?auto_1224564 ?auto_1224565 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1224708 - SURFACE
      ?auto_1224709 - SURFACE
      ?auto_1224710 - SURFACE
      ?auto_1224712 - SURFACE
      ?auto_1224711 - SURFACE
      ?auto_1224713 - SURFACE
      ?auto_1224714 - SURFACE
      ?auto_1224715 - SURFACE
      ?auto_1224716 - SURFACE
      ?auto_1224717 - SURFACE
      ?auto_1224718 - SURFACE
      ?auto_1224719 - SURFACE
      ?auto_1224720 - SURFACE
      ?auto_1224721 - SURFACE
    )
    :vars
    (
      ?auto_1224722 - HOIST
      ?auto_1224724 - PLACE
      ?auto_1224723 - TRUCK
      ?auto_1224725 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1224722 ?auto_1224724 ) ( SURFACE-AT ?auto_1224720 ?auto_1224724 ) ( CLEAR ?auto_1224720 ) ( IS-CRATE ?auto_1224721 ) ( not ( = ?auto_1224720 ?auto_1224721 ) ) ( AVAILABLE ?auto_1224722 ) ( IN ?auto_1224721 ?auto_1224723 ) ( ON ?auto_1224720 ?auto_1224719 ) ( not ( = ?auto_1224719 ?auto_1224720 ) ) ( not ( = ?auto_1224719 ?auto_1224721 ) ) ( TRUCK-AT ?auto_1224723 ?auto_1224725 ) ( not ( = ?auto_1224725 ?auto_1224724 ) ) ( ON ?auto_1224709 ?auto_1224708 ) ( ON ?auto_1224710 ?auto_1224709 ) ( ON ?auto_1224712 ?auto_1224710 ) ( ON ?auto_1224711 ?auto_1224712 ) ( ON ?auto_1224713 ?auto_1224711 ) ( ON ?auto_1224714 ?auto_1224713 ) ( ON ?auto_1224715 ?auto_1224714 ) ( ON ?auto_1224716 ?auto_1224715 ) ( ON ?auto_1224717 ?auto_1224716 ) ( ON ?auto_1224718 ?auto_1224717 ) ( ON ?auto_1224719 ?auto_1224718 ) ( not ( = ?auto_1224708 ?auto_1224709 ) ) ( not ( = ?auto_1224708 ?auto_1224710 ) ) ( not ( = ?auto_1224708 ?auto_1224712 ) ) ( not ( = ?auto_1224708 ?auto_1224711 ) ) ( not ( = ?auto_1224708 ?auto_1224713 ) ) ( not ( = ?auto_1224708 ?auto_1224714 ) ) ( not ( = ?auto_1224708 ?auto_1224715 ) ) ( not ( = ?auto_1224708 ?auto_1224716 ) ) ( not ( = ?auto_1224708 ?auto_1224717 ) ) ( not ( = ?auto_1224708 ?auto_1224718 ) ) ( not ( = ?auto_1224708 ?auto_1224719 ) ) ( not ( = ?auto_1224708 ?auto_1224720 ) ) ( not ( = ?auto_1224708 ?auto_1224721 ) ) ( not ( = ?auto_1224709 ?auto_1224710 ) ) ( not ( = ?auto_1224709 ?auto_1224712 ) ) ( not ( = ?auto_1224709 ?auto_1224711 ) ) ( not ( = ?auto_1224709 ?auto_1224713 ) ) ( not ( = ?auto_1224709 ?auto_1224714 ) ) ( not ( = ?auto_1224709 ?auto_1224715 ) ) ( not ( = ?auto_1224709 ?auto_1224716 ) ) ( not ( = ?auto_1224709 ?auto_1224717 ) ) ( not ( = ?auto_1224709 ?auto_1224718 ) ) ( not ( = ?auto_1224709 ?auto_1224719 ) ) ( not ( = ?auto_1224709 ?auto_1224720 ) ) ( not ( = ?auto_1224709 ?auto_1224721 ) ) ( not ( = ?auto_1224710 ?auto_1224712 ) ) ( not ( = ?auto_1224710 ?auto_1224711 ) ) ( not ( = ?auto_1224710 ?auto_1224713 ) ) ( not ( = ?auto_1224710 ?auto_1224714 ) ) ( not ( = ?auto_1224710 ?auto_1224715 ) ) ( not ( = ?auto_1224710 ?auto_1224716 ) ) ( not ( = ?auto_1224710 ?auto_1224717 ) ) ( not ( = ?auto_1224710 ?auto_1224718 ) ) ( not ( = ?auto_1224710 ?auto_1224719 ) ) ( not ( = ?auto_1224710 ?auto_1224720 ) ) ( not ( = ?auto_1224710 ?auto_1224721 ) ) ( not ( = ?auto_1224712 ?auto_1224711 ) ) ( not ( = ?auto_1224712 ?auto_1224713 ) ) ( not ( = ?auto_1224712 ?auto_1224714 ) ) ( not ( = ?auto_1224712 ?auto_1224715 ) ) ( not ( = ?auto_1224712 ?auto_1224716 ) ) ( not ( = ?auto_1224712 ?auto_1224717 ) ) ( not ( = ?auto_1224712 ?auto_1224718 ) ) ( not ( = ?auto_1224712 ?auto_1224719 ) ) ( not ( = ?auto_1224712 ?auto_1224720 ) ) ( not ( = ?auto_1224712 ?auto_1224721 ) ) ( not ( = ?auto_1224711 ?auto_1224713 ) ) ( not ( = ?auto_1224711 ?auto_1224714 ) ) ( not ( = ?auto_1224711 ?auto_1224715 ) ) ( not ( = ?auto_1224711 ?auto_1224716 ) ) ( not ( = ?auto_1224711 ?auto_1224717 ) ) ( not ( = ?auto_1224711 ?auto_1224718 ) ) ( not ( = ?auto_1224711 ?auto_1224719 ) ) ( not ( = ?auto_1224711 ?auto_1224720 ) ) ( not ( = ?auto_1224711 ?auto_1224721 ) ) ( not ( = ?auto_1224713 ?auto_1224714 ) ) ( not ( = ?auto_1224713 ?auto_1224715 ) ) ( not ( = ?auto_1224713 ?auto_1224716 ) ) ( not ( = ?auto_1224713 ?auto_1224717 ) ) ( not ( = ?auto_1224713 ?auto_1224718 ) ) ( not ( = ?auto_1224713 ?auto_1224719 ) ) ( not ( = ?auto_1224713 ?auto_1224720 ) ) ( not ( = ?auto_1224713 ?auto_1224721 ) ) ( not ( = ?auto_1224714 ?auto_1224715 ) ) ( not ( = ?auto_1224714 ?auto_1224716 ) ) ( not ( = ?auto_1224714 ?auto_1224717 ) ) ( not ( = ?auto_1224714 ?auto_1224718 ) ) ( not ( = ?auto_1224714 ?auto_1224719 ) ) ( not ( = ?auto_1224714 ?auto_1224720 ) ) ( not ( = ?auto_1224714 ?auto_1224721 ) ) ( not ( = ?auto_1224715 ?auto_1224716 ) ) ( not ( = ?auto_1224715 ?auto_1224717 ) ) ( not ( = ?auto_1224715 ?auto_1224718 ) ) ( not ( = ?auto_1224715 ?auto_1224719 ) ) ( not ( = ?auto_1224715 ?auto_1224720 ) ) ( not ( = ?auto_1224715 ?auto_1224721 ) ) ( not ( = ?auto_1224716 ?auto_1224717 ) ) ( not ( = ?auto_1224716 ?auto_1224718 ) ) ( not ( = ?auto_1224716 ?auto_1224719 ) ) ( not ( = ?auto_1224716 ?auto_1224720 ) ) ( not ( = ?auto_1224716 ?auto_1224721 ) ) ( not ( = ?auto_1224717 ?auto_1224718 ) ) ( not ( = ?auto_1224717 ?auto_1224719 ) ) ( not ( = ?auto_1224717 ?auto_1224720 ) ) ( not ( = ?auto_1224717 ?auto_1224721 ) ) ( not ( = ?auto_1224718 ?auto_1224719 ) ) ( not ( = ?auto_1224718 ?auto_1224720 ) ) ( not ( = ?auto_1224718 ?auto_1224721 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1224719 ?auto_1224720 ?auto_1224721 )
      ( MAKE-13CRATE-VERIFY ?auto_1224708 ?auto_1224709 ?auto_1224710 ?auto_1224712 ?auto_1224711 ?auto_1224713 ?auto_1224714 ?auto_1224715 ?auto_1224716 ?auto_1224717 ?auto_1224718 ?auto_1224719 ?auto_1224720 ?auto_1224721 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1224877 - SURFACE
      ?auto_1224878 - SURFACE
      ?auto_1224879 - SURFACE
      ?auto_1224881 - SURFACE
      ?auto_1224880 - SURFACE
      ?auto_1224882 - SURFACE
      ?auto_1224883 - SURFACE
      ?auto_1224884 - SURFACE
      ?auto_1224885 - SURFACE
      ?auto_1224886 - SURFACE
      ?auto_1224887 - SURFACE
      ?auto_1224888 - SURFACE
      ?auto_1224889 - SURFACE
      ?auto_1224890 - SURFACE
    )
    :vars
    (
      ?auto_1224893 - HOIST
      ?auto_1224891 - PLACE
      ?auto_1224892 - TRUCK
      ?auto_1224894 - PLACE
      ?auto_1224895 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1224893 ?auto_1224891 ) ( SURFACE-AT ?auto_1224889 ?auto_1224891 ) ( CLEAR ?auto_1224889 ) ( IS-CRATE ?auto_1224890 ) ( not ( = ?auto_1224889 ?auto_1224890 ) ) ( AVAILABLE ?auto_1224893 ) ( ON ?auto_1224889 ?auto_1224888 ) ( not ( = ?auto_1224888 ?auto_1224889 ) ) ( not ( = ?auto_1224888 ?auto_1224890 ) ) ( TRUCK-AT ?auto_1224892 ?auto_1224894 ) ( not ( = ?auto_1224894 ?auto_1224891 ) ) ( HOIST-AT ?auto_1224895 ?auto_1224894 ) ( LIFTING ?auto_1224895 ?auto_1224890 ) ( not ( = ?auto_1224893 ?auto_1224895 ) ) ( ON ?auto_1224878 ?auto_1224877 ) ( ON ?auto_1224879 ?auto_1224878 ) ( ON ?auto_1224881 ?auto_1224879 ) ( ON ?auto_1224880 ?auto_1224881 ) ( ON ?auto_1224882 ?auto_1224880 ) ( ON ?auto_1224883 ?auto_1224882 ) ( ON ?auto_1224884 ?auto_1224883 ) ( ON ?auto_1224885 ?auto_1224884 ) ( ON ?auto_1224886 ?auto_1224885 ) ( ON ?auto_1224887 ?auto_1224886 ) ( ON ?auto_1224888 ?auto_1224887 ) ( not ( = ?auto_1224877 ?auto_1224878 ) ) ( not ( = ?auto_1224877 ?auto_1224879 ) ) ( not ( = ?auto_1224877 ?auto_1224881 ) ) ( not ( = ?auto_1224877 ?auto_1224880 ) ) ( not ( = ?auto_1224877 ?auto_1224882 ) ) ( not ( = ?auto_1224877 ?auto_1224883 ) ) ( not ( = ?auto_1224877 ?auto_1224884 ) ) ( not ( = ?auto_1224877 ?auto_1224885 ) ) ( not ( = ?auto_1224877 ?auto_1224886 ) ) ( not ( = ?auto_1224877 ?auto_1224887 ) ) ( not ( = ?auto_1224877 ?auto_1224888 ) ) ( not ( = ?auto_1224877 ?auto_1224889 ) ) ( not ( = ?auto_1224877 ?auto_1224890 ) ) ( not ( = ?auto_1224878 ?auto_1224879 ) ) ( not ( = ?auto_1224878 ?auto_1224881 ) ) ( not ( = ?auto_1224878 ?auto_1224880 ) ) ( not ( = ?auto_1224878 ?auto_1224882 ) ) ( not ( = ?auto_1224878 ?auto_1224883 ) ) ( not ( = ?auto_1224878 ?auto_1224884 ) ) ( not ( = ?auto_1224878 ?auto_1224885 ) ) ( not ( = ?auto_1224878 ?auto_1224886 ) ) ( not ( = ?auto_1224878 ?auto_1224887 ) ) ( not ( = ?auto_1224878 ?auto_1224888 ) ) ( not ( = ?auto_1224878 ?auto_1224889 ) ) ( not ( = ?auto_1224878 ?auto_1224890 ) ) ( not ( = ?auto_1224879 ?auto_1224881 ) ) ( not ( = ?auto_1224879 ?auto_1224880 ) ) ( not ( = ?auto_1224879 ?auto_1224882 ) ) ( not ( = ?auto_1224879 ?auto_1224883 ) ) ( not ( = ?auto_1224879 ?auto_1224884 ) ) ( not ( = ?auto_1224879 ?auto_1224885 ) ) ( not ( = ?auto_1224879 ?auto_1224886 ) ) ( not ( = ?auto_1224879 ?auto_1224887 ) ) ( not ( = ?auto_1224879 ?auto_1224888 ) ) ( not ( = ?auto_1224879 ?auto_1224889 ) ) ( not ( = ?auto_1224879 ?auto_1224890 ) ) ( not ( = ?auto_1224881 ?auto_1224880 ) ) ( not ( = ?auto_1224881 ?auto_1224882 ) ) ( not ( = ?auto_1224881 ?auto_1224883 ) ) ( not ( = ?auto_1224881 ?auto_1224884 ) ) ( not ( = ?auto_1224881 ?auto_1224885 ) ) ( not ( = ?auto_1224881 ?auto_1224886 ) ) ( not ( = ?auto_1224881 ?auto_1224887 ) ) ( not ( = ?auto_1224881 ?auto_1224888 ) ) ( not ( = ?auto_1224881 ?auto_1224889 ) ) ( not ( = ?auto_1224881 ?auto_1224890 ) ) ( not ( = ?auto_1224880 ?auto_1224882 ) ) ( not ( = ?auto_1224880 ?auto_1224883 ) ) ( not ( = ?auto_1224880 ?auto_1224884 ) ) ( not ( = ?auto_1224880 ?auto_1224885 ) ) ( not ( = ?auto_1224880 ?auto_1224886 ) ) ( not ( = ?auto_1224880 ?auto_1224887 ) ) ( not ( = ?auto_1224880 ?auto_1224888 ) ) ( not ( = ?auto_1224880 ?auto_1224889 ) ) ( not ( = ?auto_1224880 ?auto_1224890 ) ) ( not ( = ?auto_1224882 ?auto_1224883 ) ) ( not ( = ?auto_1224882 ?auto_1224884 ) ) ( not ( = ?auto_1224882 ?auto_1224885 ) ) ( not ( = ?auto_1224882 ?auto_1224886 ) ) ( not ( = ?auto_1224882 ?auto_1224887 ) ) ( not ( = ?auto_1224882 ?auto_1224888 ) ) ( not ( = ?auto_1224882 ?auto_1224889 ) ) ( not ( = ?auto_1224882 ?auto_1224890 ) ) ( not ( = ?auto_1224883 ?auto_1224884 ) ) ( not ( = ?auto_1224883 ?auto_1224885 ) ) ( not ( = ?auto_1224883 ?auto_1224886 ) ) ( not ( = ?auto_1224883 ?auto_1224887 ) ) ( not ( = ?auto_1224883 ?auto_1224888 ) ) ( not ( = ?auto_1224883 ?auto_1224889 ) ) ( not ( = ?auto_1224883 ?auto_1224890 ) ) ( not ( = ?auto_1224884 ?auto_1224885 ) ) ( not ( = ?auto_1224884 ?auto_1224886 ) ) ( not ( = ?auto_1224884 ?auto_1224887 ) ) ( not ( = ?auto_1224884 ?auto_1224888 ) ) ( not ( = ?auto_1224884 ?auto_1224889 ) ) ( not ( = ?auto_1224884 ?auto_1224890 ) ) ( not ( = ?auto_1224885 ?auto_1224886 ) ) ( not ( = ?auto_1224885 ?auto_1224887 ) ) ( not ( = ?auto_1224885 ?auto_1224888 ) ) ( not ( = ?auto_1224885 ?auto_1224889 ) ) ( not ( = ?auto_1224885 ?auto_1224890 ) ) ( not ( = ?auto_1224886 ?auto_1224887 ) ) ( not ( = ?auto_1224886 ?auto_1224888 ) ) ( not ( = ?auto_1224886 ?auto_1224889 ) ) ( not ( = ?auto_1224886 ?auto_1224890 ) ) ( not ( = ?auto_1224887 ?auto_1224888 ) ) ( not ( = ?auto_1224887 ?auto_1224889 ) ) ( not ( = ?auto_1224887 ?auto_1224890 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1224888 ?auto_1224889 ?auto_1224890 )
      ( MAKE-13CRATE-VERIFY ?auto_1224877 ?auto_1224878 ?auto_1224879 ?auto_1224881 ?auto_1224880 ?auto_1224882 ?auto_1224883 ?auto_1224884 ?auto_1224885 ?auto_1224886 ?auto_1224887 ?auto_1224888 ?auto_1224889 ?auto_1224890 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1225059 - SURFACE
      ?auto_1225060 - SURFACE
      ?auto_1225061 - SURFACE
      ?auto_1225063 - SURFACE
      ?auto_1225062 - SURFACE
      ?auto_1225064 - SURFACE
      ?auto_1225065 - SURFACE
      ?auto_1225066 - SURFACE
      ?auto_1225067 - SURFACE
      ?auto_1225068 - SURFACE
      ?auto_1225069 - SURFACE
      ?auto_1225070 - SURFACE
      ?auto_1225071 - SURFACE
      ?auto_1225072 - SURFACE
    )
    :vars
    (
      ?auto_1225073 - HOIST
      ?auto_1225078 - PLACE
      ?auto_1225075 - TRUCK
      ?auto_1225076 - PLACE
      ?auto_1225074 - HOIST
      ?auto_1225077 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1225073 ?auto_1225078 ) ( SURFACE-AT ?auto_1225071 ?auto_1225078 ) ( CLEAR ?auto_1225071 ) ( IS-CRATE ?auto_1225072 ) ( not ( = ?auto_1225071 ?auto_1225072 ) ) ( AVAILABLE ?auto_1225073 ) ( ON ?auto_1225071 ?auto_1225070 ) ( not ( = ?auto_1225070 ?auto_1225071 ) ) ( not ( = ?auto_1225070 ?auto_1225072 ) ) ( TRUCK-AT ?auto_1225075 ?auto_1225076 ) ( not ( = ?auto_1225076 ?auto_1225078 ) ) ( HOIST-AT ?auto_1225074 ?auto_1225076 ) ( not ( = ?auto_1225073 ?auto_1225074 ) ) ( AVAILABLE ?auto_1225074 ) ( SURFACE-AT ?auto_1225072 ?auto_1225076 ) ( ON ?auto_1225072 ?auto_1225077 ) ( CLEAR ?auto_1225072 ) ( not ( = ?auto_1225071 ?auto_1225077 ) ) ( not ( = ?auto_1225072 ?auto_1225077 ) ) ( not ( = ?auto_1225070 ?auto_1225077 ) ) ( ON ?auto_1225060 ?auto_1225059 ) ( ON ?auto_1225061 ?auto_1225060 ) ( ON ?auto_1225063 ?auto_1225061 ) ( ON ?auto_1225062 ?auto_1225063 ) ( ON ?auto_1225064 ?auto_1225062 ) ( ON ?auto_1225065 ?auto_1225064 ) ( ON ?auto_1225066 ?auto_1225065 ) ( ON ?auto_1225067 ?auto_1225066 ) ( ON ?auto_1225068 ?auto_1225067 ) ( ON ?auto_1225069 ?auto_1225068 ) ( ON ?auto_1225070 ?auto_1225069 ) ( not ( = ?auto_1225059 ?auto_1225060 ) ) ( not ( = ?auto_1225059 ?auto_1225061 ) ) ( not ( = ?auto_1225059 ?auto_1225063 ) ) ( not ( = ?auto_1225059 ?auto_1225062 ) ) ( not ( = ?auto_1225059 ?auto_1225064 ) ) ( not ( = ?auto_1225059 ?auto_1225065 ) ) ( not ( = ?auto_1225059 ?auto_1225066 ) ) ( not ( = ?auto_1225059 ?auto_1225067 ) ) ( not ( = ?auto_1225059 ?auto_1225068 ) ) ( not ( = ?auto_1225059 ?auto_1225069 ) ) ( not ( = ?auto_1225059 ?auto_1225070 ) ) ( not ( = ?auto_1225059 ?auto_1225071 ) ) ( not ( = ?auto_1225059 ?auto_1225072 ) ) ( not ( = ?auto_1225059 ?auto_1225077 ) ) ( not ( = ?auto_1225060 ?auto_1225061 ) ) ( not ( = ?auto_1225060 ?auto_1225063 ) ) ( not ( = ?auto_1225060 ?auto_1225062 ) ) ( not ( = ?auto_1225060 ?auto_1225064 ) ) ( not ( = ?auto_1225060 ?auto_1225065 ) ) ( not ( = ?auto_1225060 ?auto_1225066 ) ) ( not ( = ?auto_1225060 ?auto_1225067 ) ) ( not ( = ?auto_1225060 ?auto_1225068 ) ) ( not ( = ?auto_1225060 ?auto_1225069 ) ) ( not ( = ?auto_1225060 ?auto_1225070 ) ) ( not ( = ?auto_1225060 ?auto_1225071 ) ) ( not ( = ?auto_1225060 ?auto_1225072 ) ) ( not ( = ?auto_1225060 ?auto_1225077 ) ) ( not ( = ?auto_1225061 ?auto_1225063 ) ) ( not ( = ?auto_1225061 ?auto_1225062 ) ) ( not ( = ?auto_1225061 ?auto_1225064 ) ) ( not ( = ?auto_1225061 ?auto_1225065 ) ) ( not ( = ?auto_1225061 ?auto_1225066 ) ) ( not ( = ?auto_1225061 ?auto_1225067 ) ) ( not ( = ?auto_1225061 ?auto_1225068 ) ) ( not ( = ?auto_1225061 ?auto_1225069 ) ) ( not ( = ?auto_1225061 ?auto_1225070 ) ) ( not ( = ?auto_1225061 ?auto_1225071 ) ) ( not ( = ?auto_1225061 ?auto_1225072 ) ) ( not ( = ?auto_1225061 ?auto_1225077 ) ) ( not ( = ?auto_1225063 ?auto_1225062 ) ) ( not ( = ?auto_1225063 ?auto_1225064 ) ) ( not ( = ?auto_1225063 ?auto_1225065 ) ) ( not ( = ?auto_1225063 ?auto_1225066 ) ) ( not ( = ?auto_1225063 ?auto_1225067 ) ) ( not ( = ?auto_1225063 ?auto_1225068 ) ) ( not ( = ?auto_1225063 ?auto_1225069 ) ) ( not ( = ?auto_1225063 ?auto_1225070 ) ) ( not ( = ?auto_1225063 ?auto_1225071 ) ) ( not ( = ?auto_1225063 ?auto_1225072 ) ) ( not ( = ?auto_1225063 ?auto_1225077 ) ) ( not ( = ?auto_1225062 ?auto_1225064 ) ) ( not ( = ?auto_1225062 ?auto_1225065 ) ) ( not ( = ?auto_1225062 ?auto_1225066 ) ) ( not ( = ?auto_1225062 ?auto_1225067 ) ) ( not ( = ?auto_1225062 ?auto_1225068 ) ) ( not ( = ?auto_1225062 ?auto_1225069 ) ) ( not ( = ?auto_1225062 ?auto_1225070 ) ) ( not ( = ?auto_1225062 ?auto_1225071 ) ) ( not ( = ?auto_1225062 ?auto_1225072 ) ) ( not ( = ?auto_1225062 ?auto_1225077 ) ) ( not ( = ?auto_1225064 ?auto_1225065 ) ) ( not ( = ?auto_1225064 ?auto_1225066 ) ) ( not ( = ?auto_1225064 ?auto_1225067 ) ) ( not ( = ?auto_1225064 ?auto_1225068 ) ) ( not ( = ?auto_1225064 ?auto_1225069 ) ) ( not ( = ?auto_1225064 ?auto_1225070 ) ) ( not ( = ?auto_1225064 ?auto_1225071 ) ) ( not ( = ?auto_1225064 ?auto_1225072 ) ) ( not ( = ?auto_1225064 ?auto_1225077 ) ) ( not ( = ?auto_1225065 ?auto_1225066 ) ) ( not ( = ?auto_1225065 ?auto_1225067 ) ) ( not ( = ?auto_1225065 ?auto_1225068 ) ) ( not ( = ?auto_1225065 ?auto_1225069 ) ) ( not ( = ?auto_1225065 ?auto_1225070 ) ) ( not ( = ?auto_1225065 ?auto_1225071 ) ) ( not ( = ?auto_1225065 ?auto_1225072 ) ) ( not ( = ?auto_1225065 ?auto_1225077 ) ) ( not ( = ?auto_1225066 ?auto_1225067 ) ) ( not ( = ?auto_1225066 ?auto_1225068 ) ) ( not ( = ?auto_1225066 ?auto_1225069 ) ) ( not ( = ?auto_1225066 ?auto_1225070 ) ) ( not ( = ?auto_1225066 ?auto_1225071 ) ) ( not ( = ?auto_1225066 ?auto_1225072 ) ) ( not ( = ?auto_1225066 ?auto_1225077 ) ) ( not ( = ?auto_1225067 ?auto_1225068 ) ) ( not ( = ?auto_1225067 ?auto_1225069 ) ) ( not ( = ?auto_1225067 ?auto_1225070 ) ) ( not ( = ?auto_1225067 ?auto_1225071 ) ) ( not ( = ?auto_1225067 ?auto_1225072 ) ) ( not ( = ?auto_1225067 ?auto_1225077 ) ) ( not ( = ?auto_1225068 ?auto_1225069 ) ) ( not ( = ?auto_1225068 ?auto_1225070 ) ) ( not ( = ?auto_1225068 ?auto_1225071 ) ) ( not ( = ?auto_1225068 ?auto_1225072 ) ) ( not ( = ?auto_1225068 ?auto_1225077 ) ) ( not ( = ?auto_1225069 ?auto_1225070 ) ) ( not ( = ?auto_1225069 ?auto_1225071 ) ) ( not ( = ?auto_1225069 ?auto_1225072 ) ) ( not ( = ?auto_1225069 ?auto_1225077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1225070 ?auto_1225071 ?auto_1225072 )
      ( MAKE-13CRATE-VERIFY ?auto_1225059 ?auto_1225060 ?auto_1225061 ?auto_1225063 ?auto_1225062 ?auto_1225064 ?auto_1225065 ?auto_1225066 ?auto_1225067 ?auto_1225068 ?auto_1225069 ?auto_1225070 ?auto_1225071 ?auto_1225072 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1225242 - SURFACE
      ?auto_1225243 - SURFACE
      ?auto_1225244 - SURFACE
      ?auto_1225246 - SURFACE
      ?auto_1225245 - SURFACE
      ?auto_1225247 - SURFACE
      ?auto_1225248 - SURFACE
      ?auto_1225249 - SURFACE
      ?auto_1225250 - SURFACE
      ?auto_1225251 - SURFACE
      ?auto_1225252 - SURFACE
      ?auto_1225253 - SURFACE
      ?auto_1225254 - SURFACE
      ?auto_1225255 - SURFACE
    )
    :vars
    (
      ?auto_1225257 - HOIST
      ?auto_1225261 - PLACE
      ?auto_1225259 - PLACE
      ?auto_1225260 - HOIST
      ?auto_1225258 - SURFACE
      ?auto_1225256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1225257 ?auto_1225261 ) ( SURFACE-AT ?auto_1225254 ?auto_1225261 ) ( CLEAR ?auto_1225254 ) ( IS-CRATE ?auto_1225255 ) ( not ( = ?auto_1225254 ?auto_1225255 ) ) ( AVAILABLE ?auto_1225257 ) ( ON ?auto_1225254 ?auto_1225253 ) ( not ( = ?auto_1225253 ?auto_1225254 ) ) ( not ( = ?auto_1225253 ?auto_1225255 ) ) ( not ( = ?auto_1225259 ?auto_1225261 ) ) ( HOIST-AT ?auto_1225260 ?auto_1225259 ) ( not ( = ?auto_1225257 ?auto_1225260 ) ) ( AVAILABLE ?auto_1225260 ) ( SURFACE-AT ?auto_1225255 ?auto_1225259 ) ( ON ?auto_1225255 ?auto_1225258 ) ( CLEAR ?auto_1225255 ) ( not ( = ?auto_1225254 ?auto_1225258 ) ) ( not ( = ?auto_1225255 ?auto_1225258 ) ) ( not ( = ?auto_1225253 ?auto_1225258 ) ) ( TRUCK-AT ?auto_1225256 ?auto_1225261 ) ( ON ?auto_1225243 ?auto_1225242 ) ( ON ?auto_1225244 ?auto_1225243 ) ( ON ?auto_1225246 ?auto_1225244 ) ( ON ?auto_1225245 ?auto_1225246 ) ( ON ?auto_1225247 ?auto_1225245 ) ( ON ?auto_1225248 ?auto_1225247 ) ( ON ?auto_1225249 ?auto_1225248 ) ( ON ?auto_1225250 ?auto_1225249 ) ( ON ?auto_1225251 ?auto_1225250 ) ( ON ?auto_1225252 ?auto_1225251 ) ( ON ?auto_1225253 ?auto_1225252 ) ( not ( = ?auto_1225242 ?auto_1225243 ) ) ( not ( = ?auto_1225242 ?auto_1225244 ) ) ( not ( = ?auto_1225242 ?auto_1225246 ) ) ( not ( = ?auto_1225242 ?auto_1225245 ) ) ( not ( = ?auto_1225242 ?auto_1225247 ) ) ( not ( = ?auto_1225242 ?auto_1225248 ) ) ( not ( = ?auto_1225242 ?auto_1225249 ) ) ( not ( = ?auto_1225242 ?auto_1225250 ) ) ( not ( = ?auto_1225242 ?auto_1225251 ) ) ( not ( = ?auto_1225242 ?auto_1225252 ) ) ( not ( = ?auto_1225242 ?auto_1225253 ) ) ( not ( = ?auto_1225242 ?auto_1225254 ) ) ( not ( = ?auto_1225242 ?auto_1225255 ) ) ( not ( = ?auto_1225242 ?auto_1225258 ) ) ( not ( = ?auto_1225243 ?auto_1225244 ) ) ( not ( = ?auto_1225243 ?auto_1225246 ) ) ( not ( = ?auto_1225243 ?auto_1225245 ) ) ( not ( = ?auto_1225243 ?auto_1225247 ) ) ( not ( = ?auto_1225243 ?auto_1225248 ) ) ( not ( = ?auto_1225243 ?auto_1225249 ) ) ( not ( = ?auto_1225243 ?auto_1225250 ) ) ( not ( = ?auto_1225243 ?auto_1225251 ) ) ( not ( = ?auto_1225243 ?auto_1225252 ) ) ( not ( = ?auto_1225243 ?auto_1225253 ) ) ( not ( = ?auto_1225243 ?auto_1225254 ) ) ( not ( = ?auto_1225243 ?auto_1225255 ) ) ( not ( = ?auto_1225243 ?auto_1225258 ) ) ( not ( = ?auto_1225244 ?auto_1225246 ) ) ( not ( = ?auto_1225244 ?auto_1225245 ) ) ( not ( = ?auto_1225244 ?auto_1225247 ) ) ( not ( = ?auto_1225244 ?auto_1225248 ) ) ( not ( = ?auto_1225244 ?auto_1225249 ) ) ( not ( = ?auto_1225244 ?auto_1225250 ) ) ( not ( = ?auto_1225244 ?auto_1225251 ) ) ( not ( = ?auto_1225244 ?auto_1225252 ) ) ( not ( = ?auto_1225244 ?auto_1225253 ) ) ( not ( = ?auto_1225244 ?auto_1225254 ) ) ( not ( = ?auto_1225244 ?auto_1225255 ) ) ( not ( = ?auto_1225244 ?auto_1225258 ) ) ( not ( = ?auto_1225246 ?auto_1225245 ) ) ( not ( = ?auto_1225246 ?auto_1225247 ) ) ( not ( = ?auto_1225246 ?auto_1225248 ) ) ( not ( = ?auto_1225246 ?auto_1225249 ) ) ( not ( = ?auto_1225246 ?auto_1225250 ) ) ( not ( = ?auto_1225246 ?auto_1225251 ) ) ( not ( = ?auto_1225246 ?auto_1225252 ) ) ( not ( = ?auto_1225246 ?auto_1225253 ) ) ( not ( = ?auto_1225246 ?auto_1225254 ) ) ( not ( = ?auto_1225246 ?auto_1225255 ) ) ( not ( = ?auto_1225246 ?auto_1225258 ) ) ( not ( = ?auto_1225245 ?auto_1225247 ) ) ( not ( = ?auto_1225245 ?auto_1225248 ) ) ( not ( = ?auto_1225245 ?auto_1225249 ) ) ( not ( = ?auto_1225245 ?auto_1225250 ) ) ( not ( = ?auto_1225245 ?auto_1225251 ) ) ( not ( = ?auto_1225245 ?auto_1225252 ) ) ( not ( = ?auto_1225245 ?auto_1225253 ) ) ( not ( = ?auto_1225245 ?auto_1225254 ) ) ( not ( = ?auto_1225245 ?auto_1225255 ) ) ( not ( = ?auto_1225245 ?auto_1225258 ) ) ( not ( = ?auto_1225247 ?auto_1225248 ) ) ( not ( = ?auto_1225247 ?auto_1225249 ) ) ( not ( = ?auto_1225247 ?auto_1225250 ) ) ( not ( = ?auto_1225247 ?auto_1225251 ) ) ( not ( = ?auto_1225247 ?auto_1225252 ) ) ( not ( = ?auto_1225247 ?auto_1225253 ) ) ( not ( = ?auto_1225247 ?auto_1225254 ) ) ( not ( = ?auto_1225247 ?auto_1225255 ) ) ( not ( = ?auto_1225247 ?auto_1225258 ) ) ( not ( = ?auto_1225248 ?auto_1225249 ) ) ( not ( = ?auto_1225248 ?auto_1225250 ) ) ( not ( = ?auto_1225248 ?auto_1225251 ) ) ( not ( = ?auto_1225248 ?auto_1225252 ) ) ( not ( = ?auto_1225248 ?auto_1225253 ) ) ( not ( = ?auto_1225248 ?auto_1225254 ) ) ( not ( = ?auto_1225248 ?auto_1225255 ) ) ( not ( = ?auto_1225248 ?auto_1225258 ) ) ( not ( = ?auto_1225249 ?auto_1225250 ) ) ( not ( = ?auto_1225249 ?auto_1225251 ) ) ( not ( = ?auto_1225249 ?auto_1225252 ) ) ( not ( = ?auto_1225249 ?auto_1225253 ) ) ( not ( = ?auto_1225249 ?auto_1225254 ) ) ( not ( = ?auto_1225249 ?auto_1225255 ) ) ( not ( = ?auto_1225249 ?auto_1225258 ) ) ( not ( = ?auto_1225250 ?auto_1225251 ) ) ( not ( = ?auto_1225250 ?auto_1225252 ) ) ( not ( = ?auto_1225250 ?auto_1225253 ) ) ( not ( = ?auto_1225250 ?auto_1225254 ) ) ( not ( = ?auto_1225250 ?auto_1225255 ) ) ( not ( = ?auto_1225250 ?auto_1225258 ) ) ( not ( = ?auto_1225251 ?auto_1225252 ) ) ( not ( = ?auto_1225251 ?auto_1225253 ) ) ( not ( = ?auto_1225251 ?auto_1225254 ) ) ( not ( = ?auto_1225251 ?auto_1225255 ) ) ( not ( = ?auto_1225251 ?auto_1225258 ) ) ( not ( = ?auto_1225252 ?auto_1225253 ) ) ( not ( = ?auto_1225252 ?auto_1225254 ) ) ( not ( = ?auto_1225252 ?auto_1225255 ) ) ( not ( = ?auto_1225252 ?auto_1225258 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1225253 ?auto_1225254 ?auto_1225255 )
      ( MAKE-13CRATE-VERIFY ?auto_1225242 ?auto_1225243 ?auto_1225244 ?auto_1225246 ?auto_1225245 ?auto_1225247 ?auto_1225248 ?auto_1225249 ?auto_1225250 ?auto_1225251 ?auto_1225252 ?auto_1225253 ?auto_1225254 ?auto_1225255 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1225425 - SURFACE
      ?auto_1225426 - SURFACE
      ?auto_1225427 - SURFACE
      ?auto_1225429 - SURFACE
      ?auto_1225428 - SURFACE
      ?auto_1225430 - SURFACE
      ?auto_1225431 - SURFACE
      ?auto_1225432 - SURFACE
      ?auto_1225433 - SURFACE
      ?auto_1225434 - SURFACE
      ?auto_1225435 - SURFACE
      ?auto_1225436 - SURFACE
      ?auto_1225437 - SURFACE
      ?auto_1225438 - SURFACE
    )
    :vars
    (
      ?auto_1225441 - HOIST
      ?auto_1225439 - PLACE
      ?auto_1225442 - PLACE
      ?auto_1225443 - HOIST
      ?auto_1225444 - SURFACE
      ?auto_1225440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1225441 ?auto_1225439 ) ( IS-CRATE ?auto_1225438 ) ( not ( = ?auto_1225437 ?auto_1225438 ) ) ( not ( = ?auto_1225436 ?auto_1225437 ) ) ( not ( = ?auto_1225436 ?auto_1225438 ) ) ( not ( = ?auto_1225442 ?auto_1225439 ) ) ( HOIST-AT ?auto_1225443 ?auto_1225442 ) ( not ( = ?auto_1225441 ?auto_1225443 ) ) ( AVAILABLE ?auto_1225443 ) ( SURFACE-AT ?auto_1225438 ?auto_1225442 ) ( ON ?auto_1225438 ?auto_1225444 ) ( CLEAR ?auto_1225438 ) ( not ( = ?auto_1225437 ?auto_1225444 ) ) ( not ( = ?auto_1225438 ?auto_1225444 ) ) ( not ( = ?auto_1225436 ?auto_1225444 ) ) ( TRUCK-AT ?auto_1225440 ?auto_1225439 ) ( SURFACE-AT ?auto_1225436 ?auto_1225439 ) ( CLEAR ?auto_1225436 ) ( LIFTING ?auto_1225441 ?auto_1225437 ) ( IS-CRATE ?auto_1225437 ) ( ON ?auto_1225426 ?auto_1225425 ) ( ON ?auto_1225427 ?auto_1225426 ) ( ON ?auto_1225429 ?auto_1225427 ) ( ON ?auto_1225428 ?auto_1225429 ) ( ON ?auto_1225430 ?auto_1225428 ) ( ON ?auto_1225431 ?auto_1225430 ) ( ON ?auto_1225432 ?auto_1225431 ) ( ON ?auto_1225433 ?auto_1225432 ) ( ON ?auto_1225434 ?auto_1225433 ) ( ON ?auto_1225435 ?auto_1225434 ) ( ON ?auto_1225436 ?auto_1225435 ) ( not ( = ?auto_1225425 ?auto_1225426 ) ) ( not ( = ?auto_1225425 ?auto_1225427 ) ) ( not ( = ?auto_1225425 ?auto_1225429 ) ) ( not ( = ?auto_1225425 ?auto_1225428 ) ) ( not ( = ?auto_1225425 ?auto_1225430 ) ) ( not ( = ?auto_1225425 ?auto_1225431 ) ) ( not ( = ?auto_1225425 ?auto_1225432 ) ) ( not ( = ?auto_1225425 ?auto_1225433 ) ) ( not ( = ?auto_1225425 ?auto_1225434 ) ) ( not ( = ?auto_1225425 ?auto_1225435 ) ) ( not ( = ?auto_1225425 ?auto_1225436 ) ) ( not ( = ?auto_1225425 ?auto_1225437 ) ) ( not ( = ?auto_1225425 ?auto_1225438 ) ) ( not ( = ?auto_1225425 ?auto_1225444 ) ) ( not ( = ?auto_1225426 ?auto_1225427 ) ) ( not ( = ?auto_1225426 ?auto_1225429 ) ) ( not ( = ?auto_1225426 ?auto_1225428 ) ) ( not ( = ?auto_1225426 ?auto_1225430 ) ) ( not ( = ?auto_1225426 ?auto_1225431 ) ) ( not ( = ?auto_1225426 ?auto_1225432 ) ) ( not ( = ?auto_1225426 ?auto_1225433 ) ) ( not ( = ?auto_1225426 ?auto_1225434 ) ) ( not ( = ?auto_1225426 ?auto_1225435 ) ) ( not ( = ?auto_1225426 ?auto_1225436 ) ) ( not ( = ?auto_1225426 ?auto_1225437 ) ) ( not ( = ?auto_1225426 ?auto_1225438 ) ) ( not ( = ?auto_1225426 ?auto_1225444 ) ) ( not ( = ?auto_1225427 ?auto_1225429 ) ) ( not ( = ?auto_1225427 ?auto_1225428 ) ) ( not ( = ?auto_1225427 ?auto_1225430 ) ) ( not ( = ?auto_1225427 ?auto_1225431 ) ) ( not ( = ?auto_1225427 ?auto_1225432 ) ) ( not ( = ?auto_1225427 ?auto_1225433 ) ) ( not ( = ?auto_1225427 ?auto_1225434 ) ) ( not ( = ?auto_1225427 ?auto_1225435 ) ) ( not ( = ?auto_1225427 ?auto_1225436 ) ) ( not ( = ?auto_1225427 ?auto_1225437 ) ) ( not ( = ?auto_1225427 ?auto_1225438 ) ) ( not ( = ?auto_1225427 ?auto_1225444 ) ) ( not ( = ?auto_1225429 ?auto_1225428 ) ) ( not ( = ?auto_1225429 ?auto_1225430 ) ) ( not ( = ?auto_1225429 ?auto_1225431 ) ) ( not ( = ?auto_1225429 ?auto_1225432 ) ) ( not ( = ?auto_1225429 ?auto_1225433 ) ) ( not ( = ?auto_1225429 ?auto_1225434 ) ) ( not ( = ?auto_1225429 ?auto_1225435 ) ) ( not ( = ?auto_1225429 ?auto_1225436 ) ) ( not ( = ?auto_1225429 ?auto_1225437 ) ) ( not ( = ?auto_1225429 ?auto_1225438 ) ) ( not ( = ?auto_1225429 ?auto_1225444 ) ) ( not ( = ?auto_1225428 ?auto_1225430 ) ) ( not ( = ?auto_1225428 ?auto_1225431 ) ) ( not ( = ?auto_1225428 ?auto_1225432 ) ) ( not ( = ?auto_1225428 ?auto_1225433 ) ) ( not ( = ?auto_1225428 ?auto_1225434 ) ) ( not ( = ?auto_1225428 ?auto_1225435 ) ) ( not ( = ?auto_1225428 ?auto_1225436 ) ) ( not ( = ?auto_1225428 ?auto_1225437 ) ) ( not ( = ?auto_1225428 ?auto_1225438 ) ) ( not ( = ?auto_1225428 ?auto_1225444 ) ) ( not ( = ?auto_1225430 ?auto_1225431 ) ) ( not ( = ?auto_1225430 ?auto_1225432 ) ) ( not ( = ?auto_1225430 ?auto_1225433 ) ) ( not ( = ?auto_1225430 ?auto_1225434 ) ) ( not ( = ?auto_1225430 ?auto_1225435 ) ) ( not ( = ?auto_1225430 ?auto_1225436 ) ) ( not ( = ?auto_1225430 ?auto_1225437 ) ) ( not ( = ?auto_1225430 ?auto_1225438 ) ) ( not ( = ?auto_1225430 ?auto_1225444 ) ) ( not ( = ?auto_1225431 ?auto_1225432 ) ) ( not ( = ?auto_1225431 ?auto_1225433 ) ) ( not ( = ?auto_1225431 ?auto_1225434 ) ) ( not ( = ?auto_1225431 ?auto_1225435 ) ) ( not ( = ?auto_1225431 ?auto_1225436 ) ) ( not ( = ?auto_1225431 ?auto_1225437 ) ) ( not ( = ?auto_1225431 ?auto_1225438 ) ) ( not ( = ?auto_1225431 ?auto_1225444 ) ) ( not ( = ?auto_1225432 ?auto_1225433 ) ) ( not ( = ?auto_1225432 ?auto_1225434 ) ) ( not ( = ?auto_1225432 ?auto_1225435 ) ) ( not ( = ?auto_1225432 ?auto_1225436 ) ) ( not ( = ?auto_1225432 ?auto_1225437 ) ) ( not ( = ?auto_1225432 ?auto_1225438 ) ) ( not ( = ?auto_1225432 ?auto_1225444 ) ) ( not ( = ?auto_1225433 ?auto_1225434 ) ) ( not ( = ?auto_1225433 ?auto_1225435 ) ) ( not ( = ?auto_1225433 ?auto_1225436 ) ) ( not ( = ?auto_1225433 ?auto_1225437 ) ) ( not ( = ?auto_1225433 ?auto_1225438 ) ) ( not ( = ?auto_1225433 ?auto_1225444 ) ) ( not ( = ?auto_1225434 ?auto_1225435 ) ) ( not ( = ?auto_1225434 ?auto_1225436 ) ) ( not ( = ?auto_1225434 ?auto_1225437 ) ) ( not ( = ?auto_1225434 ?auto_1225438 ) ) ( not ( = ?auto_1225434 ?auto_1225444 ) ) ( not ( = ?auto_1225435 ?auto_1225436 ) ) ( not ( = ?auto_1225435 ?auto_1225437 ) ) ( not ( = ?auto_1225435 ?auto_1225438 ) ) ( not ( = ?auto_1225435 ?auto_1225444 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1225436 ?auto_1225437 ?auto_1225438 )
      ( MAKE-13CRATE-VERIFY ?auto_1225425 ?auto_1225426 ?auto_1225427 ?auto_1225429 ?auto_1225428 ?auto_1225430 ?auto_1225431 ?auto_1225432 ?auto_1225433 ?auto_1225434 ?auto_1225435 ?auto_1225436 ?auto_1225437 ?auto_1225438 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1225608 - SURFACE
      ?auto_1225609 - SURFACE
      ?auto_1225610 - SURFACE
      ?auto_1225612 - SURFACE
      ?auto_1225611 - SURFACE
      ?auto_1225613 - SURFACE
      ?auto_1225614 - SURFACE
      ?auto_1225615 - SURFACE
      ?auto_1225616 - SURFACE
      ?auto_1225617 - SURFACE
      ?auto_1225618 - SURFACE
      ?auto_1225619 - SURFACE
      ?auto_1225620 - SURFACE
      ?auto_1225621 - SURFACE
    )
    :vars
    (
      ?auto_1225626 - HOIST
      ?auto_1225625 - PLACE
      ?auto_1225623 - PLACE
      ?auto_1225622 - HOIST
      ?auto_1225627 - SURFACE
      ?auto_1225624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1225626 ?auto_1225625 ) ( IS-CRATE ?auto_1225621 ) ( not ( = ?auto_1225620 ?auto_1225621 ) ) ( not ( = ?auto_1225619 ?auto_1225620 ) ) ( not ( = ?auto_1225619 ?auto_1225621 ) ) ( not ( = ?auto_1225623 ?auto_1225625 ) ) ( HOIST-AT ?auto_1225622 ?auto_1225623 ) ( not ( = ?auto_1225626 ?auto_1225622 ) ) ( AVAILABLE ?auto_1225622 ) ( SURFACE-AT ?auto_1225621 ?auto_1225623 ) ( ON ?auto_1225621 ?auto_1225627 ) ( CLEAR ?auto_1225621 ) ( not ( = ?auto_1225620 ?auto_1225627 ) ) ( not ( = ?auto_1225621 ?auto_1225627 ) ) ( not ( = ?auto_1225619 ?auto_1225627 ) ) ( TRUCK-AT ?auto_1225624 ?auto_1225625 ) ( SURFACE-AT ?auto_1225619 ?auto_1225625 ) ( CLEAR ?auto_1225619 ) ( IS-CRATE ?auto_1225620 ) ( AVAILABLE ?auto_1225626 ) ( IN ?auto_1225620 ?auto_1225624 ) ( ON ?auto_1225609 ?auto_1225608 ) ( ON ?auto_1225610 ?auto_1225609 ) ( ON ?auto_1225612 ?auto_1225610 ) ( ON ?auto_1225611 ?auto_1225612 ) ( ON ?auto_1225613 ?auto_1225611 ) ( ON ?auto_1225614 ?auto_1225613 ) ( ON ?auto_1225615 ?auto_1225614 ) ( ON ?auto_1225616 ?auto_1225615 ) ( ON ?auto_1225617 ?auto_1225616 ) ( ON ?auto_1225618 ?auto_1225617 ) ( ON ?auto_1225619 ?auto_1225618 ) ( not ( = ?auto_1225608 ?auto_1225609 ) ) ( not ( = ?auto_1225608 ?auto_1225610 ) ) ( not ( = ?auto_1225608 ?auto_1225612 ) ) ( not ( = ?auto_1225608 ?auto_1225611 ) ) ( not ( = ?auto_1225608 ?auto_1225613 ) ) ( not ( = ?auto_1225608 ?auto_1225614 ) ) ( not ( = ?auto_1225608 ?auto_1225615 ) ) ( not ( = ?auto_1225608 ?auto_1225616 ) ) ( not ( = ?auto_1225608 ?auto_1225617 ) ) ( not ( = ?auto_1225608 ?auto_1225618 ) ) ( not ( = ?auto_1225608 ?auto_1225619 ) ) ( not ( = ?auto_1225608 ?auto_1225620 ) ) ( not ( = ?auto_1225608 ?auto_1225621 ) ) ( not ( = ?auto_1225608 ?auto_1225627 ) ) ( not ( = ?auto_1225609 ?auto_1225610 ) ) ( not ( = ?auto_1225609 ?auto_1225612 ) ) ( not ( = ?auto_1225609 ?auto_1225611 ) ) ( not ( = ?auto_1225609 ?auto_1225613 ) ) ( not ( = ?auto_1225609 ?auto_1225614 ) ) ( not ( = ?auto_1225609 ?auto_1225615 ) ) ( not ( = ?auto_1225609 ?auto_1225616 ) ) ( not ( = ?auto_1225609 ?auto_1225617 ) ) ( not ( = ?auto_1225609 ?auto_1225618 ) ) ( not ( = ?auto_1225609 ?auto_1225619 ) ) ( not ( = ?auto_1225609 ?auto_1225620 ) ) ( not ( = ?auto_1225609 ?auto_1225621 ) ) ( not ( = ?auto_1225609 ?auto_1225627 ) ) ( not ( = ?auto_1225610 ?auto_1225612 ) ) ( not ( = ?auto_1225610 ?auto_1225611 ) ) ( not ( = ?auto_1225610 ?auto_1225613 ) ) ( not ( = ?auto_1225610 ?auto_1225614 ) ) ( not ( = ?auto_1225610 ?auto_1225615 ) ) ( not ( = ?auto_1225610 ?auto_1225616 ) ) ( not ( = ?auto_1225610 ?auto_1225617 ) ) ( not ( = ?auto_1225610 ?auto_1225618 ) ) ( not ( = ?auto_1225610 ?auto_1225619 ) ) ( not ( = ?auto_1225610 ?auto_1225620 ) ) ( not ( = ?auto_1225610 ?auto_1225621 ) ) ( not ( = ?auto_1225610 ?auto_1225627 ) ) ( not ( = ?auto_1225612 ?auto_1225611 ) ) ( not ( = ?auto_1225612 ?auto_1225613 ) ) ( not ( = ?auto_1225612 ?auto_1225614 ) ) ( not ( = ?auto_1225612 ?auto_1225615 ) ) ( not ( = ?auto_1225612 ?auto_1225616 ) ) ( not ( = ?auto_1225612 ?auto_1225617 ) ) ( not ( = ?auto_1225612 ?auto_1225618 ) ) ( not ( = ?auto_1225612 ?auto_1225619 ) ) ( not ( = ?auto_1225612 ?auto_1225620 ) ) ( not ( = ?auto_1225612 ?auto_1225621 ) ) ( not ( = ?auto_1225612 ?auto_1225627 ) ) ( not ( = ?auto_1225611 ?auto_1225613 ) ) ( not ( = ?auto_1225611 ?auto_1225614 ) ) ( not ( = ?auto_1225611 ?auto_1225615 ) ) ( not ( = ?auto_1225611 ?auto_1225616 ) ) ( not ( = ?auto_1225611 ?auto_1225617 ) ) ( not ( = ?auto_1225611 ?auto_1225618 ) ) ( not ( = ?auto_1225611 ?auto_1225619 ) ) ( not ( = ?auto_1225611 ?auto_1225620 ) ) ( not ( = ?auto_1225611 ?auto_1225621 ) ) ( not ( = ?auto_1225611 ?auto_1225627 ) ) ( not ( = ?auto_1225613 ?auto_1225614 ) ) ( not ( = ?auto_1225613 ?auto_1225615 ) ) ( not ( = ?auto_1225613 ?auto_1225616 ) ) ( not ( = ?auto_1225613 ?auto_1225617 ) ) ( not ( = ?auto_1225613 ?auto_1225618 ) ) ( not ( = ?auto_1225613 ?auto_1225619 ) ) ( not ( = ?auto_1225613 ?auto_1225620 ) ) ( not ( = ?auto_1225613 ?auto_1225621 ) ) ( not ( = ?auto_1225613 ?auto_1225627 ) ) ( not ( = ?auto_1225614 ?auto_1225615 ) ) ( not ( = ?auto_1225614 ?auto_1225616 ) ) ( not ( = ?auto_1225614 ?auto_1225617 ) ) ( not ( = ?auto_1225614 ?auto_1225618 ) ) ( not ( = ?auto_1225614 ?auto_1225619 ) ) ( not ( = ?auto_1225614 ?auto_1225620 ) ) ( not ( = ?auto_1225614 ?auto_1225621 ) ) ( not ( = ?auto_1225614 ?auto_1225627 ) ) ( not ( = ?auto_1225615 ?auto_1225616 ) ) ( not ( = ?auto_1225615 ?auto_1225617 ) ) ( not ( = ?auto_1225615 ?auto_1225618 ) ) ( not ( = ?auto_1225615 ?auto_1225619 ) ) ( not ( = ?auto_1225615 ?auto_1225620 ) ) ( not ( = ?auto_1225615 ?auto_1225621 ) ) ( not ( = ?auto_1225615 ?auto_1225627 ) ) ( not ( = ?auto_1225616 ?auto_1225617 ) ) ( not ( = ?auto_1225616 ?auto_1225618 ) ) ( not ( = ?auto_1225616 ?auto_1225619 ) ) ( not ( = ?auto_1225616 ?auto_1225620 ) ) ( not ( = ?auto_1225616 ?auto_1225621 ) ) ( not ( = ?auto_1225616 ?auto_1225627 ) ) ( not ( = ?auto_1225617 ?auto_1225618 ) ) ( not ( = ?auto_1225617 ?auto_1225619 ) ) ( not ( = ?auto_1225617 ?auto_1225620 ) ) ( not ( = ?auto_1225617 ?auto_1225621 ) ) ( not ( = ?auto_1225617 ?auto_1225627 ) ) ( not ( = ?auto_1225618 ?auto_1225619 ) ) ( not ( = ?auto_1225618 ?auto_1225620 ) ) ( not ( = ?auto_1225618 ?auto_1225621 ) ) ( not ( = ?auto_1225618 ?auto_1225627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1225619 ?auto_1225620 ?auto_1225621 )
      ( MAKE-13CRATE-VERIFY ?auto_1225608 ?auto_1225609 ?auto_1225610 ?auto_1225612 ?auto_1225611 ?auto_1225613 ?auto_1225614 ?auto_1225615 ?auto_1225616 ?auto_1225617 ?auto_1225618 ?auto_1225619 ?auto_1225620 ?auto_1225621 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1239821 - SURFACE
      ?auto_1239822 - SURFACE
      ?auto_1239823 - SURFACE
      ?auto_1239825 - SURFACE
      ?auto_1239824 - SURFACE
      ?auto_1239826 - SURFACE
      ?auto_1239827 - SURFACE
      ?auto_1239828 - SURFACE
      ?auto_1239829 - SURFACE
      ?auto_1239830 - SURFACE
      ?auto_1239831 - SURFACE
      ?auto_1239832 - SURFACE
      ?auto_1239833 - SURFACE
      ?auto_1239834 - SURFACE
      ?auto_1239835 - SURFACE
    )
    :vars
    (
      ?auto_1239837 - HOIST
      ?auto_1239836 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1239837 ?auto_1239836 ) ( SURFACE-AT ?auto_1239834 ?auto_1239836 ) ( CLEAR ?auto_1239834 ) ( LIFTING ?auto_1239837 ?auto_1239835 ) ( IS-CRATE ?auto_1239835 ) ( not ( = ?auto_1239834 ?auto_1239835 ) ) ( ON ?auto_1239822 ?auto_1239821 ) ( ON ?auto_1239823 ?auto_1239822 ) ( ON ?auto_1239825 ?auto_1239823 ) ( ON ?auto_1239824 ?auto_1239825 ) ( ON ?auto_1239826 ?auto_1239824 ) ( ON ?auto_1239827 ?auto_1239826 ) ( ON ?auto_1239828 ?auto_1239827 ) ( ON ?auto_1239829 ?auto_1239828 ) ( ON ?auto_1239830 ?auto_1239829 ) ( ON ?auto_1239831 ?auto_1239830 ) ( ON ?auto_1239832 ?auto_1239831 ) ( ON ?auto_1239833 ?auto_1239832 ) ( ON ?auto_1239834 ?auto_1239833 ) ( not ( = ?auto_1239821 ?auto_1239822 ) ) ( not ( = ?auto_1239821 ?auto_1239823 ) ) ( not ( = ?auto_1239821 ?auto_1239825 ) ) ( not ( = ?auto_1239821 ?auto_1239824 ) ) ( not ( = ?auto_1239821 ?auto_1239826 ) ) ( not ( = ?auto_1239821 ?auto_1239827 ) ) ( not ( = ?auto_1239821 ?auto_1239828 ) ) ( not ( = ?auto_1239821 ?auto_1239829 ) ) ( not ( = ?auto_1239821 ?auto_1239830 ) ) ( not ( = ?auto_1239821 ?auto_1239831 ) ) ( not ( = ?auto_1239821 ?auto_1239832 ) ) ( not ( = ?auto_1239821 ?auto_1239833 ) ) ( not ( = ?auto_1239821 ?auto_1239834 ) ) ( not ( = ?auto_1239821 ?auto_1239835 ) ) ( not ( = ?auto_1239822 ?auto_1239823 ) ) ( not ( = ?auto_1239822 ?auto_1239825 ) ) ( not ( = ?auto_1239822 ?auto_1239824 ) ) ( not ( = ?auto_1239822 ?auto_1239826 ) ) ( not ( = ?auto_1239822 ?auto_1239827 ) ) ( not ( = ?auto_1239822 ?auto_1239828 ) ) ( not ( = ?auto_1239822 ?auto_1239829 ) ) ( not ( = ?auto_1239822 ?auto_1239830 ) ) ( not ( = ?auto_1239822 ?auto_1239831 ) ) ( not ( = ?auto_1239822 ?auto_1239832 ) ) ( not ( = ?auto_1239822 ?auto_1239833 ) ) ( not ( = ?auto_1239822 ?auto_1239834 ) ) ( not ( = ?auto_1239822 ?auto_1239835 ) ) ( not ( = ?auto_1239823 ?auto_1239825 ) ) ( not ( = ?auto_1239823 ?auto_1239824 ) ) ( not ( = ?auto_1239823 ?auto_1239826 ) ) ( not ( = ?auto_1239823 ?auto_1239827 ) ) ( not ( = ?auto_1239823 ?auto_1239828 ) ) ( not ( = ?auto_1239823 ?auto_1239829 ) ) ( not ( = ?auto_1239823 ?auto_1239830 ) ) ( not ( = ?auto_1239823 ?auto_1239831 ) ) ( not ( = ?auto_1239823 ?auto_1239832 ) ) ( not ( = ?auto_1239823 ?auto_1239833 ) ) ( not ( = ?auto_1239823 ?auto_1239834 ) ) ( not ( = ?auto_1239823 ?auto_1239835 ) ) ( not ( = ?auto_1239825 ?auto_1239824 ) ) ( not ( = ?auto_1239825 ?auto_1239826 ) ) ( not ( = ?auto_1239825 ?auto_1239827 ) ) ( not ( = ?auto_1239825 ?auto_1239828 ) ) ( not ( = ?auto_1239825 ?auto_1239829 ) ) ( not ( = ?auto_1239825 ?auto_1239830 ) ) ( not ( = ?auto_1239825 ?auto_1239831 ) ) ( not ( = ?auto_1239825 ?auto_1239832 ) ) ( not ( = ?auto_1239825 ?auto_1239833 ) ) ( not ( = ?auto_1239825 ?auto_1239834 ) ) ( not ( = ?auto_1239825 ?auto_1239835 ) ) ( not ( = ?auto_1239824 ?auto_1239826 ) ) ( not ( = ?auto_1239824 ?auto_1239827 ) ) ( not ( = ?auto_1239824 ?auto_1239828 ) ) ( not ( = ?auto_1239824 ?auto_1239829 ) ) ( not ( = ?auto_1239824 ?auto_1239830 ) ) ( not ( = ?auto_1239824 ?auto_1239831 ) ) ( not ( = ?auto_1239824 ?auto_1239832 ) ) ( not ( = ?auto_1239824 ?auto_1239833 ) ) ( not ( = ?auto_1239824 ?auto_1239834 ) ) ( not ( = ?auto_1239824 ?auto_1239835 ) ) ( not ( = ?auto_1239826 ?auto_1239827 ) ) ( not ( = ?auto_1239826 ?auto_1239828 ) ) ( not ( = ?auto_1239826 ?auto_1239829 ) ) ( not ( = ?auto_1239826 ?auto_1239830 ) ) ( not ( = ?auto_1239826 ?auto_1239831 ) ) ( not ( = ?auto_1239826 ?auto_1239832 ) ) ( not ( = ?auto_1239826 ?auto_1239833 ) ) ( not ( = ?auto_1239826 ?auto_1239834 ) ) ( not ( = ?auto_1239826 ?auto_1239835 ) ) ( not ( = ?auto_1239827 ?auto_1239828 ) ) ( not ( = ?auto_1239827 ?auto_1239829 ) ) ( not ( = ?auto_1239827 ?auto_1239830 ) ) ( not ( = ?auto_1239827 ?auto_1239831 ) ) ( not ( = ?auto_1239827 ?auto_1239832 ) ) ( not ( = ?auto_1239827 ?auto_1239833 ) ) ( not ( = ?auto_1239827 ?auto_1239834 ) ) ( not ( = ?auto_1239827 ?auto_1239835 ) ) ( not ( = ?auto_1239828 ?auto_1239829 ) ) ( not ( = ?auto_1239828 ?auto_1239830 ) ) ( not ( = ?auto_1239828 ?auto_1239831 ) ) ( not ( = ?auto_1239828 ?auto_1239832 ) ) ( not ( = ?auto_1239828 ?auto_1239833 ) ) ( not ( = ?auto_1239828 ?auto_1239834 ) ) ( not ( = ?auto_1239828 ?auto_1239835 ) ) ( not ( = ?auto_1239829 ?auto_1239830 ) ) ( not ( = ?auto_1239829 ?auto_1239831 ) ) ( not ( = ?auto_1239829 ?auto_1239832 ) ) ( not ( = ?auto_1239829 ?auto_1239833 ) ) ( not ( = ?auto_1239829 ?auto_1239834 ) ) ( not ( = ?auto_1239829 ?auto_1239835 ) ) ( not ( = ?auto_1239830 ?auto_1239831 ) ) ( not ( = ?auto_1239830 ?auto_1239832 ) ) ( not ( = ?auto_1239830 ?auto_1239833 ) ) ( not ( = ?auto_1239830 ?auto_1239834 ) ) ( not ( = ?auto_1239830 ?auto_1239835 ) ) ( not ( = ?auto_1239831 ?auto_1239832 ) ) ( not ( = ?auto_1239831 ?auto_1239833 ) ) ( not ( = ?auto_1239831 ?auto_1239834 ) ) ( not ( = ?auto_1239831 ?auto_1239835 ) ) ( not ( = ?auto_1239832 ?auto_1239833 ) ) ( not ( = ?auto_1239832 ?auto_1239834 ) ) ( not ( = ?auto_1239832 ?auto_1239835 ) ) ( not ( = ?auto_1239833 ?auto_1239834 ) ) ( not ( = ?auto_1239833 ?auto_1239835 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1239834 ?auto_1239835 )
      ( MAKE-14CRATE-VERIFY ?auto_1239821 ?auto_1239822 ?auto_1239823 ?auto_1239825 ?auto_1239824 ?auto_1239826 ?auto_1239827 ?auto_1239828 ?auto_1239829 ?auto_1239830 ?auto_1239831 ?auto_1239832 ?auto_1239833 ?auto_1239834 ?auto_1239835 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1239981 - SURFACE
      ?auto_1239982 - SURFACE
      ?auto_1239983 - SURFACE
      ?auto_1239985 - SURFACE
      ?auto_1239984 - SURFACE
      ?auto_1239986 - SURFACE
      ?auto_1239987 - SURFACE
      ?auto_1239988 - SURFACE
      ?auto_1239989 - SURFACE
      ?auto_1239990 - SURFACE
      ?auto_1239991 - SURFACE
      ?auto_1239992 - SURFACE
      ?auto_1239993 - SURFACE
      ?auto_1239994 - SURFACE
      ?auto_1239995 - SURFACE
    )
    :vars
    (
      ?auto_1239997 - HOIST
      ?auto_1239998 - PLACE
      ?auto_1239996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1239997 ?auto_1239998 ) ( SURFACE-AT ?auto_1239994 ?auto_1239998 ) ( CLEAR ?auto_1239994 ) ( IS-CRATE ?auto_1239995 ) ( not ( = ?auto_1239994 ?auto_1239995 ) ) ( TRUCK-AT ?auto_1239996 ?auto_1239998 ) ( AVAILABLE ?auto_1239997 ) ( IN ?auto_1239995 ?auto_1239996 ) ( ON ?auto_1239994 ?auto_1239993 ) ( not ( = ?auto_1239993 ?auto_1239994 ) ) ( not ( = ?auto_1239993 ?auto_1239995 ) ) ( ON ?auto_1239982 ?auto_1239981 ) ( ON ?auto_1239983 ?auto_1239982 ) ( ON ?auto_1239985 ?auto_1239983 ) ( ON ?auto_1239984 ?auto_1239985 ) ( ON ?auto_1239986 ?auto_1239984 ) ( ON ?auto_1239987 ?auto_1239986 ) ( ON ?auto_1239988 ?auto_1239987 ) ( ON ?auto_1239989 ?auto_1239988 ) ( ON ?auto_1239990 ?auto_1239989 ) ( ON ?auto_1239991 ?auto_1239990 ) ( ON ?auto_1239992 ?auto_1239991 ) ( ON ?auto_1239993 ?auto_1239992 ) ( not ( = ?auto_1239981 ?auto_1239982 ) ) ( not ( = ?auto_1239981 ?auto_1239983 ) ) ( not ( = ?auto_1239981 ?auto_1239985 ) ) ( not ( = ?auto_1239981 ?auto_1239984 ) ) ( not ( = ?auto_1239981 ?auto_1239986 ) ) ( not ( = ?auto_1239981 ?auto_1239987 ) ) ( not ( = ?auto_1239981 ?auto_1239988 ) ) ( not ( = ?auto_1239981 ?auto_1239989 ) ) ( not ( = ?auto_1239981 ?auto_1239990 ) ) ( not ( = ?auto_1239981 ?auto_1239991 ) ) ( not ( = ?auto_1239981 ?auto_1239992 ) ) ( not ( = ?auto_1239981 ?auto_1239993 ) ) ( not ( = ?auto_1239981 ?auto_1239994 ) ) ( not ( = ?auto_1239981 ?auto_1239995 ) ) ( not ( = ?auto_1239982 ?auto_1239983 ) ) ( not ( = ?auto_1239982 ?auto_1239985 ) ) ( not ( = ?auto_1239982 ?auto_1239984 ) ) ( not ( = ?auto_1239982 ?auto_1239986 ) ) ( not ( = ?auto_1239982 ?auto_1239987 ) ) ( not ( = ?auto_1239982 ?auto_1239988 ) ) ( not ( = ?auto_1239982 ?auto_1239989 ) ) ( not ( = ?auto_1239982 ?auto_1239990 ) ) ( not ( = ?auto_1239982 ?auto_1239991 ) ) ( not ( = ?auto_1239982 ?auto_1239992 ) ) ( not ( = ?auto_1239982 ?auto_1239993 ) ) ( not ( = ?auto_1239982 ?auto_1239994 ) ) ( not ( = ?auto_1239982 ?auto_1239995 ) ) ( not ( = ?auto_1239983 ?auto_1239985 ) ) ( not ( = ?auto_1239983 ?auto_1239984 ) ) ( not ( = ?auto_1239983 ?auto_1239986 ) ) ( not ( = ?auto_1239983 ?auto_1239987 ) ) ( not ( = ?auto_1239983 ?auto_1239988 ) ) ( not ( = ?auto_1239983 ?auto_1239989 ) ) ( not ( = ?auto_1239983 ?auto_1239990 ) ) ( not ( = ?auto_1239983 ?auto_1239991 ) ) ( not ( = ?auto_1239983 ?auto_1239992 ) ) ( not ( = ?auto_1239983 ?auto_1239993 ) ) ( not ( = ?auto_1239983 ?auto_1239994 ) ) ( not ( = ?auto_1239983 ?auto_1239995 ) ) ( not ( = ?auto_1239985 ?auto_1239984 ) ) ( not ( = ?auto_1239985 ?auto_1239986 ) ) ( not ( = ?auto_1239985 ?auto_1239987 ) ) ( not ( = ?auto_1239985 ?auto_1239988 ) ) ( not ( = ?auto_1239985 ?auto_1239989 ) ) ( not ( = ?auto_1239985 ?auto_1239990 ) ) ( not ( = ?auto_1239985 ?auto_1239991 ) ) ( not ( = ?auto_1239985 ?auto_1239992 ) ) ( not ( = ?auto_1239985 ?auto_1239993 ) ) ( not ( = ?auto_1239985 ?auto_1239994 ) ) ( not ( = ?auto_1239985 ?auto_1239995 ) ) ( not ( = ?auto_1239984 ?auto_1239986 ) ) ( not ( = ?auto_1239984 ?auto_1239987 ) ) ( not ( = ?auto_1239984 ?auto_1239988 ) ) ( not ( = ?auto_1239984 ?auto_1239989 ) ) ( not ( = ?auto_1239984 ?auto_1239990 ) ) ( not ( = ?auto_1239984 ?auto_1239991 ) ) ( not ( = ?auto_1239984 ?auto_1239992 ) ) ( not ( = ?auto_1239984 ?auto_1239993 ) ) ( not ( = ?auto_1239984 ?auto_1239994 ) ) ( not ( = ?auto_1239984 ?auto_1239995 ) ) ( not ( = ?auto_1239986 ?auto_1239987 ) ) ( not ( = ?auto_1239986 ?auto_1239988 ) ) ( not ( = ?auto_1239986 ?auto_1239989 ) ) ( not ( = ?auto_1239986 ?auto_1239990 ) ) ( not ( = ?auto_1239986 ?auto_1239991 ) ) ( not ( = ?auto_1239986 ?auto_1239992 ) ) ( not ( = ?auto_1239986 ?auto_1239993 ) ) ( not ( = ?auto_1239986 ?auto_1239994 ) ) ( not ( = ?auto_1239986 ?auto_1239995 ) ) ( not ( = ?auto_1239987 ?auto_1239988 ) ) ( not ( = ?auto_1239987 ?auto_1239989 ) ) ( not ( = ?auto_1239987 ?auto_1239990 ) ) ( not ( = ?auto_1239987 ?auto_1239991 ) ) ( not ( = ?auto_1239987 ?auto_1239992 ) ) ( not ( = ?auto_1239987 ?auto_1239993 ) ) ( not ( = ?auto_1239987 ?auto_1239994 ) ) ( not ( = ?auto_1239987 ?auto_1239995 ) ) ( not ( = ?auto_1239988 ?auto_1239989 ) ) ( not ( = ?auto_1239988 ?auto_1239990 ) ) ( not ( = ?auto_1239988 ?auto_1239991 ) ) ( not ( = ?auto_1239988 ?auto_1239992 ) ) ( not ( = ?auto_1239988 ?auto_1239993 ) ) ( not ( = ?auto_1239988 ?auto_1239994 ) ) ( not ( = ?auto_1239988 ?auto_1239995 ) ) ( not ( = ?auto_1239989 ?auto_1239990 ) ) ( not ( = ?auto_1239989 ?auto_1239991 ) ) ( not ( = ?auto_1239989 ?auto_1239992 ) ) ( not ( = ?auto_1239989 ?auto_1239993 ) ) ( not ( = ?auto_1239989 ?auto_1239994 ) ) ( not ( = ?auto_1239989 ?auto_1239995 ) ) ( not ( = ?auto_1239990 ?auto_1239991 ) ) ( not ( = ?auto_1239990 ?auto_1239992 ) ) ( not ( = ?auto_1239990 ?auto_1239993 ) ) ( not ( = ?auto_1239990 ?auto_1239994 ) ) ( not ( = ?auto_1239990 ?auto_1239995 ) ) ( not ( = ?auto_1239991 ?auto_1239992 ) ) ( not ( = ?auto_1239991 ?auto_1239993 ) ) ( not ( = ?auto_1239991 ?auto_1239994 ) ) ( not ( = ?auto_1239991 ?auto_1239995 ) ) ( not ( = ?auto_1239992 ?auto_1239993 ) ) ( not ( = ?auto_1239992 ?auto_1239994 ) ) ( not ( = ?auto_1239992 ?auto_1239995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1239993 ?auto_1239994 ?auto_1239995 )
      ( MAKE-14CRATE-VERIFY ?auto_1239981 ?auto_1239982 ?auto_1239983 ?auto_1239985 ?auto_1239984 ?auto_1239986 ?auto_1239987 ?auto_1239988 ?auto_1239989 ?auto_1239990 ?auto_1239991 ?auto_1239992 ?auto_1239993 ?auto_1239994 ?auto_1239995 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1240156 - SURFACE
      ?auto_1240157 - SURFACE
      ?auto_1240158 - SURFACE
      ?auto_1240160 - SURFACE
      ?auto_1240159 - SURFACE
      ?auto_1240161 - SURFACE
      ?auto_1240162 - SURFACE
      ?auto_1240163 - SURFACE
      ?auto_1240164 - SURFACE
      ?auto_1240165 - SURFACE
      ?auto_1240166 - SURFACE
      ?auto_1240167 - SURFACE
      ?auto_1240168 - SURFACE
      ?auto_1240169 - SURFACE
      ?auto_1240170 - SURFACE
    )
    :vars
    (
      ?auto_1240173 - HOIST
      ?auto_1240172 - PLACE
      ?auto_1240171 - TRUCK
      ?auto_1240174 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1240173 ?auto_1240172 ) ( SURFACE-AT ?auto_1240169 ?auto_1240172 ) ( CLEAR ?auto_1240169 ) ( IS-CRATE ?auto_1240170 ) ( not ( = ?auto_1240169 ?auto_1240170 ) ) ( AVAILABLE ?auto_1240173 ) ( IN ?auto_1240170 ?auto_1240171 ) ( ON ?auto_1240169 ?auto_1240168 ) ( not ( = ?auto_1240168 ?auto_1240169 ) ) ( not ( = ?auto_1240168 ?auto_1240170 ) ) ( TRUCK-AT ?auto_1240171 ?auto_1240174 ) ( not ( = ?auto_1240174 ?auto_1240172 ) ) ( ON ?auto_1240157 ?auto_1240156 ) ( ON ?auto_1240158 ?auto_1240157 ) ( ON ?auto_1240160 ?auto_1240158 ) ( ON ?auto_1240159 ?auto_1240160 ) ( ON ?auto_1240161 ?auto_1240159 ) ( ON ?auto_1240162 ?auto_1240161 ) ( ON ?auto_1240163 ?auto_1240162 ) ( ON ?auto_1240164 ?auto_1240163 ) ( ON ?auto_1240165 ?auto_1240164 ) ( ON ?auto_1240166 ?auto_1240165 ) ( ON ?auto_1240167 ?auto_1240166 ) ( ON ?auto_1240168 ?auto_1240167 ) ( not ( = ?auto_1240156 ?auto_1240157 ) ) ( not ( = ?auto_1240156 ?auto_1240158 ) ) ( not ( = ?auto_1240156 ?auto_1240160 ) ) ( not ( = ?auto_1240156 ?auto_1240159 ) ) ( not ( = ?auto_1240156 ?auto_1240161 ) ) ( not ( = ?auto_1240156 ?auto_1240162 ) ) ( not ( = ?auto_1240156 ?auto_1240163 ) ) ( not ( = ?auto_1240156 ?auto_1240164 ) ) ( not ( = ?auto_1240156 ?auto_1240165 ) ) ( not ( = ?auto_1240156 ?auto_1240166 ) ) ( not ( = ?auto_1240156 ?auto_1240167 ) ) ( not ( = ?auto_1240156 ?auto_1240168 ) ) ( not ( = ?auto_1240156 ?auto_1240169 ) ) ( not ( = ?auto_1240156 ?auto_1240170 ) ) ( not ( = ?auto_1240157 ?auto_1240158 ) ) ( not ( = ?auto_1240157 ?auto_1240160 ) ) ( not ( = ?auto_1240157 ?auto_1240159 ) ) ( not ( = ?auto_1240157 ?auto_1240161 ) ) ( not ( = ?auto_1240157 ?auto_1240162 ) ) ( not ( = ?auto_1240157 ?auto_1240163 ) ) ( not ( = ?auto_1240157 ?auto_1240164 ) ) ( not ( = ?auto_1240157 ?auto_1240165 ) ) ( not ( = ?auto_1240157 ?auto_1240166 ) ) ( not ( = ?auto_1240157 ?auto_1240167 ) ) ( not ( = ?auto_1240157 ?auto_1240168 ) ) ( not ( = ?auto_1240157 ?auto_1240169 ) ) ( not ( = ?auto_1240157 ?auto_1240170 ) ) ( not ( = ?auto_1240158 ?auto_1240160 ) ) ( not ( = ?auto_1240158 ?auto_1240159 ) ) ( not ( = ?auto_1240158 ?auto_1240161 ) ) ( not ( = ?auto_1240158 ?auto_1240162 ) ) ( not ( = ?auto_1240158 ?auto_1240163 ) ) ( not ( = ?auto_1240158 ?auto_1240164 ) ) ( not ( = ?auto_1240158 ?auto_1240165 ) ) ( not ( = ?auto_1240158 ?auto_1240166 ) ) ( not ( = ?auto_1240158 ?auto_1240167 ) ) ( not ( = ?auto_1240158 ?auto_1240168 ) ) ( not ( = ?auto_1240158 ?auto_1240169 ) ) ( not ( = ?auto_1240158 ?auto_1240170 ) ) ( not ( = ?auto_1240160 ?auto_1240159 ) ) ( not ( = ?auto_1240160 ?auto_1240161 ) ) ( not ( = ?auto_1240160 ?auto_1240162 ) ) ( not ( = ?auto_1240160 ?auto_1240163 ) ) ( not ( = ?auto_1240160 ?auto_1240164 ) ) ( not ( = ?auto_1240160 ?auto_1240165 ) ) ( not ( = ?auto_1240160 ?auto_1240166 ) ) ( not ( = ?auto_1240160 ?auto_1240167 ) ) ( not ( = ?auto_1240160 ?auto_1240168 ) ) ( not ( = ?auto_1240160 ?auto_1240169 ) ) ( not ( = ?auto_1240160 ?auto_1240170 ) ) ( not ( = ?auto_1240159 ?auto_1240161 ) ) ( not ( = ?auto_1240159 ?auto_1240162 ) ) ( not ( = ?auto_1240159 ?auto_1240163 ) ) ( not ( = ?auto_1240159 ?auto_1240164 ) ) ( not ( = ?auto_1240159 ?auto_1240165 ) ) ( not ( = ?auto_1240159 ?auto_1240166 ) ) ( not ( = ?auto_1240159 ?auto_1240167 ) ) ( not ( = ?auto_1240159 ?auto_1240168 ) ) ( not ( = ?auto_1240159 ?auto_1240169 ) ) ( not ( = ?auto_1240159 ?auto_1240170 ) ) ( not ( = ?auto_1240161 ?auto_1240162 ) ) ( not ( = ?auto_1240161 ?auto_1240163 ) ) ( not ( = ?auto_1240161 ?auto_1240164 ) ) ( not ( = ?auto_1240161 ?auto_1240165 ) ) ( not ( = ?auto_1240161 ?auto_1240166 ) ) ( not ( = ?auto_1240161 ?auto_1240167 ) ) ( not ( = ?auto_1240161 ?auto_1240168 ) ) ( not ( = ?auto_1240161 ?auto_1240169 ) ) ( not ( = ?auto_1240161 ?auto_1240170 ) ) ( not ( = ?auto_1240162 ?auto_1240163 ) ) ( not ( = ?auto_1240162 ?auto_1240164 ) ) ( not ( = ?auto_1240162 ?auto_1240165 ) ) ( not ( = ?auto_1240162 ?auto_1240166 ) ) ( not ( = ?auto_1240162 ?auto_1240167 ) ) ( not ( = ?auto_1240162 ?auto_1240168 ) ) ( not ( = ?auto_1240162 ?auto_1240169 ) ) ( not ( = ?auto_1240162 ?auto_1240170 ) ) ( not ( = ?auto_1240163 ?auto_1240164 ) ) ( not ( = ?auto_1240163 ?auto_1240165 ) ) ( not ( = ?auto_1240163 ?auto_1240166 ) ) ( not ( = ?auto_1240163 ?auto_1240167 ) ) ( not ( = ?auto_1240163 ?auto_1240168 ) ) ( not ( = ?auto_1240163 ?auto_1240169 ) ) ( not ( = ?auto_1240163 ?auto_1240170 ) ) ( not ( = ?auto_1240164 ?auto_1240165 ) ) ( not ( = ?auto_1240164 ?auto_1240166 ) ) ( not ( = ?auto_1240164 ?auto_1240167 ) ) ( not ( = ?auto_1240164 ?auto_1240168 ) ) ( not ( = ?auto_1240164 ?auto_1240169 ) ) ( not ( = ?auto_1240164 ?auto_1240170 ) ) ( not ( = ?auto_1240165 ?auto_1240166 ) ) ( not ( = ?auto_1240165 ?auto_1240167 ) ) ( not ( = ?auto_1240165 ?auto_1240168 ) ) ( not ( = ?auto_1240165 ?auto_1240169 ) ) ( not ( = ?auto_1240165 ?auto_1240170 ) ) ( not ( = ?auto_1240166 ?auto_1240167 ) ) ( not ( = ?auto_1240166 ?auto_1240168 ) ) ( not ( = ?auto_1240166 ?auto_1240169 ) ) ( not ( = ?auto_1240166 ?auto_1240170 ) ) ( not ( = ?auto_1240167 ?auto_1240168 ) ) ( not ( = ?auto_1240167 ?auto_1240169 ) ) ( not ( = ?auto_1240167 ?auto_1240170 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1240168 ?auto_1240169 ?auto_1240170 )
      ( MAKE-14CRATE-VERIFY ?auto_1240156 ?auto_1240157 ?auto_1240158 ?auto_1240160 ?auto_1240159 ?auto_1240161 ?auto_1240162 ?auto_1240163 ?auto_1240164 ?auto_1240165 ?auto_1240166 ?auto_1240167 ?auto_1240168 ?auto_1240169 ?auto_1240170 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1240345 - SURFACE
      ?auto_1240346 - SURFACE
      ?auto_1240347 - SURFACE
      ?auto_1240349 - SURFACE
      ?auto_1240348 - SURFACE
      ?auto_1240350 - SURFACE
      ?auto_1240351 - SURFACE
      ?auto_1240352 - SURFACE
      ?auto_1240353 - SURFACE
      ?auto_1240354 - SURFACE
      ?auto_1240355 - SURFACE
      ?auto_1240356 - SURFACE
      ?auto_1240357 - SURFACE
      ?auto_1240358 - SURFACE
      ?auto_1240359 - SURFACE
    )
    :vars
    (
      ?auto_1240363 - HOIST
      ?auto_1240364 - PLACE
      ?auto_1240362 - TRUCK
      ?auto_1240360 - PLACE
      ?auto_1240361 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1240363 ?auto_1240364 ) ( SURFACE-AT ?auto_1240358 ?auto_1240364 ) ( CLEAR ?auto_1240358 ) ( IS-CRATE ?auto_1240359 ) ( not ( = ?auto_1240358 ?auto_1240359 ) ) ( AVAILABLE ?auto_1240363 ) ( ON ?auto_1240358 ?auto_1240357 ) ( not ( = ?auto_1240357 ?auto_1240358 ) ) ( not ( = ?auto_1240357 ?auto_1240359 ) ) ( TRUCK-AT ?auto_1240362 ?auto_1240360 ) ( not ( = ?auto_1240360 ?auto_1240364 ) ) ( HOIST-AT ?auto_1240361 ?auto_1240360 ) ( LIFTING ?auto_1240361 ?auto_1240359 ) ( not ( = ?auto_1240363 ?auto_1240361 ) ) ( ON ?auto_1240346 ?auto_1240345 ) ( ON ?auto_1240347 ?auto_1240346 ) ( ON ?auto_1240349 ?auto_1240347 ) ( ON ?auto_1240348 ?auto_1240349 ) ( ON ?auto_1240350 ?auto_1240348 ) ( ON ?auto_1240351 ?auto_1240350 ) ( ON ?auto_1240352 ?auto_1240351 ) ( ON ?auto_1240353 ?auto_1240352 ) ( ON ?auto_1240354 ?auto_1240353 ) ( ON ?auto_1240355 ?auto_1240354 ) ( ON ?auto_1240356 ?auto_1240355 ) ( ON ?auto_1240357 ?auto_1240356 ) ( not ( = ?auto_1240345 ?auto_1240346 ) ) ( not ( = ?auto_1240345 ?auto_1240347 ) ) ( not ( = ?auto_1240345 ?auto_1240349 ) ) ( not ( = ?auto_1240345 ?auto_1240348 ) ) ( not ( = ?auto_1240345 ?auto_1240350 ) ) ( not ( = ?auto_1240345 ?auto_1240351 ) ) ( not ( = ?auto_1240345 ?auto_1240352 ) ) ( not ( = ?auto_1240345 ?auto_1240353 ) ) ( not ( = ?auto_1240345 ?auto_1240354 ) ) ( not ( = ?auto_1240345 ?auto_1240355 ) ) ( not ( = ?auto_1240345 ?auto_1240356 ) ) ( not ( = ?auto_1240345 ?auto_1240357 ) ) ( not ( = ?auto_1240345 ?auto_1240358 ) ) ( not ( = ?auto_1240345 ?auto_1240359 ) ) ( not ( = ?auto_1240346 ?auto_1240347 ) ) ( not ( = ?auto_1240346 ?auto_1240349 ) ) ( not ( = ?auto_1240346 ?auto_1240348 ) ) ( not ( = ?auto_1240346 ?auto_1240350 ) ) ( not ( = ?auto_1240346 ?auto_1240351 ) ) ( not ( = ?auto_1240346 ?auto_1240352 ) ) ( not ( = ?auto_1240346 ?auto_1240353 ) ) ( not ( = ?auto_1240346 ?auto_1240354 ) ) ( not ( = ?auto_1240346 ?auto_1240355 ) ) ( not ( = ?auto_1240346 ?auto_1240356 ) ) ( not ( = ?auto_1240346 ?auto_1240357 ) ) ( not ( = ?auto_1240346 ?auto_1240358 ) ) ( not ( = ?auto_1240346 ?auto_1240359 ) ) ( not ( = ?auto_1240347 ?auto_1240349 ) ) ( not ( = ?auto_1240347 ?auto_1240348 ) ) ( not ( = ?auto_1240347 ?auto_1240350 ) ) ( not ( = ?auto_1240347 ?auto_1240351 ) ) ( not ( = ?auto_1240347 ?auto_1240352 ) ) ( not ( = ?auto_1240347 ?auto_1240353 ) ) ( not ( = ?auto_1240347 ?auto_1240354 ) ) ( not ( = ?auto_1240347 ?auto_1240355 ) ) ( not ( = ?auto_1240347 ?auto_1240356 ) ) ( not ( = ?auto_1240347 ?auto_1240357 ) ) ( not ( = ?auto_1240347 ?auto_1240358 ) ) ( not ( = ?auto_1240347 ?auto_1240359 ) ) ( not ( = ?auto_1240349 ?auto_1240348 ) ) ( not ( = ?auto_1240349 ?auto_1240350 ) ) ( not ( = ?auto_1240349 ?auto_1240351 ) ) ( not ( = ?auto_1240349 ?auto_1240352 ) ) ( not ( = ?auto_1240349 ?auto_1240353 ) ) ( not ( = ?auto_1240349 ?auto_1240354 ) ) ( not ( = ?auto_1240349 ?auto_1240355 ) ) ( not ( = ?auto_1240349 ?auto_1240356 ) ) ( not ( = ?auto_1240349 ?auto_1240357 ) ) ( not ( = ?auto_1240349 ?auto_1240358 ) ) ( not ( = ?auto_1240349 ?auto_1240359 ) ) ( not ( = ?auto_1240348 ?auto_1240350 ) ) ( not ( = ?auto_1240348 ?auto_1240351 ) ) ( not ( = ?auto_1240348 ?auto_1240352 ) ) ( not ( = ?auto_1240348 ?auto_1240353 ) ) ( not ( = ?auto_1240348 ?auto_1240354 ) ) ( not ( = ?auto_1240348 ?auto_1240355 ) ) ( not ( = ?auto_1240348 ?auto_1240356 ) ) ( not ( = ?auto_1240348 ?auto_1240357 ) ) ( not ( = ?auto_1240348 ?auto_1240358 ) ) ( not ( = ?auto_1240348 ?auto_1240359 ) ) ( not ( = ?auto_1240350 ?auto_1240351 ) ) ( not ( = ?auto_1240350 ?auto_1240352 ) ) ( not ( = ?auto_1240350 ?auto_1240353 ) ) ( not ( = ?auto_1240350 ?auto_1240354 ) ) ( not ( = ?auto_1240350 ?auto_1240355 ) ) ( not ( = ?auto_1240350 ?auto_1240356 ) ) ( not ( = ?auto_1240350 ?auto_1240357 ) ) ( not ( = ?auto_1240350 ?auto_1240358 ) ) ( not ( = ?auto_1240350 ?auto_1240359 ) ) ( not ( = ?auto_1240351 ?auto_1240352 ) ) ( not ( = ?auto_1240351 ?auto_1240353 ) ) ( not ( = ?auto_1240351 ?auto_1240354 ) ) ( not ( = ?auto_1240351 ?auto_1240355 ) ) ( not ( = ?auto_1240351 ?auto_1240356 ) ) ( not ( = ?auto_1240351 ?auto_1240357 ) ) ( not ( = ?auto_1240351 ?auto_1240358 ) ) ( not ( = ?auto_1240351 ?auto_1240359 ) ) ( not ( = ?auto_1240352 ?auto_1240353 ) ) ( not ( = ?auto_1240352 ?auto_1240354 ) ) ( not ( = ?auto_1240352 ?auto_1240355 ) ) ( not ( = ?auto_1240352 ?auto_1240356 ) ) ( not ( = ?auto_1240352 ?auto_1240357 ) ) ( not ( = ?auto_1240352 ?auto_1240358 ) ) ( not ( = ?auto_1240352 ?auto_1240359 ) ) ( not ( = ?auto_1240353 ?auto_1240354 ) ) ( not ( = ?auto_1240353 ?auto_1240355 ) ) ( not ( = ?auto_1240353 ?auto_1240356 ) ) ( not ( = ?auto_1240353 ?auto_1240357 ) ) ( not ( = ?auto_1240353 ?auto_1240358 ) ) ( not ( = ?auto_1240353 ?auto_1240359 ) ) ( not ( = ?auto_1240354 ?auto_1240355 ) ) ( not ( = ?auto_1240354 ?auto_1240356 ) ) ( not ( = ?auto_1240354 ?auto_1240357 ) ) ( not ( = ?auto_1240354 ?auto_1240358 ) ) ( not ( = ?auto_1240354 ?auto_1240359 ) ) ( not ( = ?auto_1240355 ?auto_1240356 ) ) ( not ( = ?auto_1240355 ?auto_1240357 ) ) ( not ( = ?auto_1240355 ?auto_1240358 ) ) ( not ( = ?auto_1240355 ?auto_1240359 ) ) ( not ( = ?auto_1240356 ?auto_1240357 ) ) ( not ( = ?auto_1240356 ?auto_1240358 ) ) ( not ( = ?auto_1240356 ?auto_1240359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1240357 ?auto_1240358 ?auto_1240359 )
      ( MAKE-14CRATE-VERIFY ?auto_1240345 ?auto_1240346 ?auto_1240347 ?auto_1240349 ?auto_1240348 ?auto_1240350 ?auto_1240351 ?auto_1240352 ?auto_1240353 ?auto_1240354 ?auto_1240355 ?auto_1240356 ?auto_1240357 ?auto_1240358 ?auto_1240359 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1240548 - SURFACE
      ?auto_1240549 - SURFACE
      ?auto_1240550 - SURFACE
      ?auto_1240552 - SURFACE
      ?auto_1240551 - SURFACE
      ?auto_1240553 - SURFACE
      ?auto_1240554 - SURFACE
      ?auto_1240555 - SURFACE
      ?auto_1240556 - SURFACE
      ?auto_1240557 - SURFACE
      ?auto_1240558 - SURFACE
      ?auto_1240559 - SURFACE
      ?auto_1240560 - SURFACE
      ?auto_1240561 - SURFACE
      ?auto_1240562 - SURFACE
    )
    :vars
    (
      ?auto_1240564 - HOIST
      ?auto_1240568 - PLACE
      ?auto_1240567 - TRUCK
      ?auto_1240565 - PLACE
      ?auto_1240563 - HOIST
      ?auto_1240566 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1240564 ?auto_1240568 ) ( SURFACE-AT ?auto_1240561 ?auto_1240568 ) ( CLEAR ?auto_1240561 ) ( IS-CRATE ?auto_1240562 ) ( not ( = ?auto_1240561 ?auto_1240562 ) ) ( AVAILABLE ?auto_1240564 ) ( ON ?auto_1240561 ?auto_1240560 ) ( not ( = ?auto_1240560 ?auto_1240561 ) ) ( not ( = ?auto_1240560 ?auto_1240562 ) ) ( TRUCK-AT ?auto_1240567 ?auto_1240565 ) ( not ( = ?auto_1240565 ?auto_1240568 ) ) ( HOIST-AT ?auto_1240563 ?auto_1240565 ) ( not ( = ?auto_1240564 ?auto_1240563 ) ) ( AVAILABLE ?auto_1240563 ) ( SURFACE-AT ?auto_1240562 ?auto_1240565 ) ( ON ?auto_1240562 ?auto_1240566 ) ( CLEAR ?auto_1240562 ) ( not ( = ?auto_1240561 ?auto_1240566 ) ) ( not ( = ?auto_1240562 ?auto_1240566 ) ) ( not ( = ?auto_1240560 ?auto_1240566 ) ) ( ON ?auto_1240549 ?auto_1240548 ) ( ON ?auto_1240550 ?auto_1240549 ) ( ON ?auto_1240552 ?auto_1240550 ) ( ON ?auto_1240551 ?auto_1240552 ) ( ON ?auto_1240553 ?auto_1240551 ) ( ON ?auto_1240554 ?auto_1240553 ) ( ON ?auto_1240555 ?auto_1240554 ) ( ON ?auto_1240556 ?auto_1240555 ) ( ON ?auto_1240557 ?auto_1240556 ) ( ON ?auto_1240558 ?auto_1240557 ) ( ON ?auto_1240559 ?auto_1240558 ) ( ON ?auto_1240560 ?auto_1240559 ) ( not ( = ?auto_1240548 ?auto_1240549 ) ) ( not ( = ?auto_1240548 ?auto_1240550 ) ) ( not ( = ?auto_1240548 ?auto_1240552 ) ) ( not ( = ?auto_1240548 ?auto_1240551 ) ) ( not ( = ?auto_1240548 ?auto_1240553 ) ) ( not ( = ?auto_1240548 ?auto_1240554 ) ) ( not ( = ?auto_1240548 ?auto_1240555 ) ) ( not ( = ?auto_1240548 ?auto_1240556 ) ) ( not ( = ?auto_1240548 ?auto_1240557 ) ) ( not ( = ?auto_1240548 ?auto_1240558 ) ) ( not ( = ?auto_1240548 ?auto_1240559 ) ) ( not ( = ?auto_1240548 ?auto_1240560 ) ) ( not ( = ?auto_1240548 ?auto_1240561 ) ) ( not ( = ?auto_1240548 ?auto_1240562 ) ) ( not ( = ?auto_1240548 ?auto_1240566 ) ) ( not ( = ?auto_1240549 ?auto_1240550 ) ) ( not ( = ?auto_1240549 ?auto_1240552 ) ) ( not ( = ?auto_1240549 ?auto_1240551 ) ) ( not ( = ?auto_1240549 ?auto_1240553 ) ) ( not ( = ?auto_1240549 ?auto_1240554 ) ) ( not ( = ?auto_1240549 ?auto_1240555 ) ) ( not ( = ?auto_1240549 ?auto_1240556 ) ) ( not ( = ?auto_1240549 ?auto_1240557 ) ) ( not ( = ?auto_1240549 ?auto_1240558 ) ) ( not ( = ?auto_1240549 ?auto_1240559 ) ) ( not ( = ?auto_1240549 ?auto_1240560 ) ) ( not ( = ?auto_1240549 ?auto_1240561 ) ) ( not ( = ?auto_1240549 ?auto_1240562 ) ) ( not ( = ?auto_1240549 ?auto_1240566 ) ) ( not ( = ?auto_1240550 ?auto_1240552 ) ) ( not ( = ?auto_1240550 ?auto_1240551 ) ) ( not ( = ?auto_1240550 ?auto_1240553 ) ) ( not ( = ?auto_1240550 ?auto_1240554 ) ) ( not ( = ?auto_1240550 ?auto_1240555 ) ) ( not ( = ?auto_1240550 ?auto_1240556 ) ) ( not ( = ?auto_1240550 ?auto_1240557 ) ) ( not ( = ?auto_1240550 ?auto_1240558 ) ) ( not ( = ?auto_1240550 ?auto_1240559 ) ) ( not ( = ?auto_1240550 ?auto_1240560 ) ) ( not ( = ?auto_1240550 ?auto_1240561 ) ) ( not ( = ?auto_1240550 ?auto_1240562 ) ) ( not ( = ?auto_1240550 ?auto_1240566 ) ) ( not ( = ?auto_1240552 ?auto_1240551 ) ) ( not ( = ?auto_1240552 ?auto_1240553 ) ) ( not ( = ?auto_1240552 ?auto_1240554 ) ) ( not ( = ?auto_1240552 ?auto_1240555 ) ) ( not ( = ?auto_1240552 ?auto_1240556 ) ) ( not ( = ?auto_1240552 ?auto_1240557 ) ) ( not ( = ?auto_1240552 ?auto_1240558 ) ) ( not ( = ?auto_1240552 ?auto_1240559 ) ) ( not ( = ?auto_1240552 ?auto_1240560 ) ) ( not ( = ?auto_1240552 ?auto_1240561 ) ) ( not ( = ?auto_1240552 ?auto_1240562 ) ) ( not ( = ?auto_1240552 ?auto_1240566 ) ) ( not ( = ?auto_1240551 ?auto_1240553 ) ) ( not ( = ?auto_1240551 ?auto_1240554 ) ) ( not ( = ?auto_1240551 ?auto_1240555 ) ) ( not ( = ?auto_1240551 ?auto_1240556 ) ) ( not ( = ?auto_1240551 ?auto_1240557 ) ) ( not ( = ?auto_1240551 ?auto_1240558 ) ) ( not ( = ?auto_1240551 ?auto_1240559 ) ) ( not ( = ?auto_1240551 ?auto_1240560 ) ) ( not ( = ?auto_1240551 ?auto_1240561 ) ) ( not ( = ?auto_1240551 ?auto_1240562 ) ) ( not ( = ?auto_1240551 ?auto_1240566 ) ) ( not ( = ?auto_1240553 ?auto_1240554 ) ) ( not ( = ?auto_1240553 ?auto_1240555 ) ) ( not ( = ?auto_1240553 ?auto_1240556 ) ) ( not ( = ?auto_1240553 ?auto_1240557 ) ) ( not ( = ?auto_1240553 ?auto_1240558 ) ) ( not ( = ?auto_1240553 ?auto_1240559 ) ) ( not ( = ?auto_1240553 ?auto_1240560 ) ) ( not ( = ?auto_1240553 ?auto_1240561 ) ) ( not ( = ?auto_1240553 ?auto_1240562 ) ) ( not ( = ?auto_1240553 ?auto_1240566 ) ) ( not ( = ?auto_1240554 ?auto_1240555 ) ) ( not ( = ?auto_1240554 ?auto_1240556 ) ) ( not ( = ?auto_1240554 ?auto_1240557 ) ) ( not ( = ?auto_1240554 ?auto_1240558 ) ) ( not ( = ?auto_1240554 ?auto_1240559 ) ) ( not ( = ?auto_1240554 ?auto_1240560 ) ) ( not ( = ?auto_1240554 ?auto_1240561 ) ) ( not ( = ?auto_1240554 ?auto_1240562 ) ) ( not ( = ?auto_1240554 ?auto_1240566 ) ) ( not ( = ?auto_1240555 ?auto_1240556 ) ) ( not ( = ?auto_1240555 ?auto_1240557 ) ) ( not ( = ?auto_1240555 ?auto_1240558 ) ) ( not ( = ?auto_1240555 ?auto_1240559 ) ) ( not ( = ?auto_1240555 ?auto_1240560 ) ) ( not ( = ?auto_1240555 ?auto_1240561 ) ) ( not ( = ?auto_1240555 ?auto_1240562 ) ) ( not ( = ?auto_1240555 ?auto_1240566 ) ) ( not ( = ?auto_1240556 ?auto_1240557 ) ) ( not ( = ?auto_1240556 ?auto_1240558 ) ) ( not ( = ?auto_1240556 ?auto_1240559 ) ) ( not ( = ?auto_1240556 ?auto_1240560 ) ) ( not ( = ?auto_1240556 ?auto_1240561 ) ) ( not ( = ?auto_1240556 ?auto_1240562 ) ) ( not ( = ?auto_1240556 ?auto_1240566 ) ) ( not ( = ?auto_1240557 ?auto_1240558 ) ) ( not ( = ?auto_1240557 ?auto_1240559 ) ) ( not ( = ?auto_1240557 ?auto_1240560 ) ) ( not ( = ?auto_1240557 ?auto_1240561 ) ) ( not ( = ?auto_1240557 ?auto_1240562 ) ) ( not ( = ?auto_1240557 ?auto_1240566 ) ) ( not ( = ?auto_1240558 ?auto_1240559 ) ) ( not ( = ?auto_1240558 ?auto_1240560 ) ) ( not ( = ?auto_1240558 ?auto_1240561 ) ) ( not ( = ?auto_1240558 ?auto_1240562 ) ) ( not ( = ?auto_1240558 ?auto_1240566 ) ) ( not ( = ?auto_1240559 ?auto_1240560 ) ) ( not ( = ?auto_1240559 ?auto_1240561 ) ) ( not ( = ?auto_1240559 ?auto_1240562 ) ) ( not ( = ?auto_1240559 ?auto_1240566 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1240560 ?auto_1240561 ?auto_1240562 )
      ( MAKE-14CRATE-VERIFY ?auto_1240548 ?auto_1240549 ?auto_1240550 ?auto_1240552 ?auto_1240551 ?auto_1240553 ?auto_1240554 ?auto_1240555 ?auto_1240556 ?auto_1240557 ?auto_1240558 ?auto_1240559 ?auto_1240560 ?auto_1240561 ?auto_1240562 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1240752 - SURFACE
      ?auto_1240753 - SURFACE
      ?auto_1240754 - SURFACE
      ?auto_1240756 - SURFACE
      ?auto_1240755 - SURFACE
      ?auto_1240757 - SURFACE
      ?auto_1240758 - SURFACE
      ?auto_1240759 - SURFACE
      ?auto_1240760 - SURFACE
      ?auto_1240761 - SURFACE
      ?auto_1240762 - SURFACE
      ?auto_1240763 - SURFACE
      ?auto_1240764 - SURFACE
      ?auto_1240765 - SURFACE
      ?auto_1240766 - SURFACE
    )
    :vars
    (
      ?auto_1240769 - HOIST
      ?auto_1240772 - PLACE
      ?auto_1240768 - PLACE
      ?auto_1240771 - HOIST
      ?auto_1240770 - SURFACE
      ?auto_1240767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1240769 ?auto_1240772 ) ( SURFACE-AT ?auto_1240765 ?auto_1240772 ) ( CLEAR ?auto_1240765 ) ( IS-CRATE ?auto_1240766 ) ( not ( = ?auto_1240765 ?auto_1240766 ) ) ( AVAILABLE ?auto_1240769 ) ( ON ?auto_1240765 ?auto_1240764 ) ( not ( = ?auto_1240764 ?auto_1240765 ) ) ( not ( = ?auto_1240764 ?auto_1240766 ) ) ( not ( = ?auto_1240768 ?auto_1240772 ) ) ( HOIST-AT ?auto_1240771 ?auto_1240768 ) ( not ( = ?auto_1240769 ?auto_1240771 ) ) ( AVAILABLE ?auto_1240771 ) ( SURFACE-AT ?auto_1240766 ?auto_1240768 ) ( ON ?auto_1240766 ?auto_1240770 ) ( CLEAR ?auto_1240766 ) ( not ( = ?auto_1240765 ?auto_1240770 ) ) ( not ( = ?auto_1240766 ?auto_1240770 ) ) ( not ( = ?auto_1240764 ?auto_1240770 ) ) ( TRUCK-AT ?auto_1240767 ?auto_1240772 ) ( ON ?auto_1240753 ?auto_1240752 ) ( ON ?auto_1240754 ?auto_1240753 ) ( ON ?auto_1240756 ?auto_1240754 ) ( ON ?auto_1240755 ?auto_1240756 ) ( ON ?auto_1240757 ?auto_1240755 ) ( ON ?auto_1240758 ?auto_1240757 ) ( ON ?auto_1240759 ?auto_1240758 ) ( ON ?auto_1240760 ?auto_1240759 ) ( ON ?auto_1240761 ?auto_1240760 ) ( ON ?auto_1240762 ?auto_1240761 ) ( ON ?auto_1240763 ?auto_1240762 ) ( ON ?auto_1240764 ?auto_1240763 ) ( not ( = ?auto_1240752 ?auto_1240753 ) ) ( not ( = ?auto_1240752 ?auto_1240754 ) ) ( not ( = ?auto_1240752 ?auto_1240756 ) ) ( not ( = ?auto_1240752 ?auto_1240755 ) ) ( not ( = ?auto_1240752 ?auto_1240757 ) ) ( not ( = ?auto_1240752 ?auto_1240758 ) ) ( not ( = ?auto_1240752 ?auto_1240759 ) ) ( not ( = ?auto_1240752 ?auto_1240760 ) ) ( not ( = ?auto_1240752 ?auto_1240761 ) ) ( not ( = ?auto_1240752 ?auto_1240762 ) ) ( not ( = ?auto_1240752 ?auto_1240763 ) ) ( not ( = ?auto_1240752 ?auto_1240764 ) ) ( not ( = ?auto_1240752 ?auto_1240765 ) ) ( not ( = ?auto_1240752 ?auto_1240766 ) ) ( not ( = ?auto_1240752 ?auto_1240770 ) ) ( not ( = ?auto_1240753 ?auto_1240754 ) ) ( not ( = ?auto_1240753 ?auto_1240756 ) ) ( not ( = ?auto_1240753 ?auto_1240755 ) ) ( not ( = ?auto_1240753 ?auto_1240757 ) ) ( not ( = ?auto_1240753 ?auto_1240758 ) ) ( not ( = ?auto_1240753 ?auto_1240759 ) ) ( not ( = ?auto_1240753 ?auto_1240760 ) ) ( not ( = ?auto_1240753 ?auto_1240761 ) ) ( not ( = ?auto_1240753 ?auto_1240762 ) ) ( not ( = ?auto_1240753 ?auto_1240763 ) ) ( not ( = ?auto_1240753 ?auto_1240764 ) ) ( not ( = ?auto_1240753 ?auto_1240765 ) ) ( not ( = ?auto_1240753 ?auto_1240766 ) ) ( not ( = ?auto_1240753 ?auto_1240770 ) ) ( not ( = ?auto_1240754 ?auto_1240756 ) ) ( not ( = ?auto_1240754 ?auto_1240755 ) ) ( not ( = ?auto_1240754 ?auto_1240757 ) ) ( not ( = ?auto_1240754 ?auto_1240758 ) ) ( not ( = ?auto_1240754 ?auto_1240759 ) ) ( not ( = ?auto_1240754 ?auto_1240760 ) ) ( not ( = ?auto_1240754 ?auto_1240761 ) ) ( not ( = ?auto_1240754 ?auto_1240762 ) ) ( not ( = ?auto_1240754 ?auto_1240763 ) ) ( not ( = ?auto_1240754 ?auto_1240764 ) ) ( not ( = ?auto_1240754 ?auto_1240765 ) ) ( not ( = ?auto_1240754 ?auto_1240766 ) ) ( not ( = ?auto_1240754 ?auto_1240770 ) ) ( not ( = ?auto_1240756 ?auto_1240755 ) ) ( not ( = ?auto_1240756 ?auto_1240757 ) ) ( not ( = ?auto_1240756 ?auto_1240758 ) ) ( not ( = ?auto_1240756 ?auto_1240759 ) ) ( not ( = ?auto_1240756 ?auto_1240760 ) ) ( not ( = ?auto_1240756 ?auto_1240761 ) ) ( not ( = ?auto_1240756 ?auto_1240762 ) ) ( not ( = ?auto_1240756 ?auto_1240763 ) ) ( not ( = ?auto_1240756 ?auto_1240764 ) ) ( not ( = ?auto_1240756 ?auto_1240765 ) ) ( not ( = ?auto_1240756 ?auto_1240766 ) ) ( not ( = ?auto_1240756 ?auto_1240770 ) ) ( not ( = ?auto_1240755 ?auto_1240757 ) ) ( not ( = ?auto_1240755 ?auto_1240758 ) ) ( not ( = ?auto_1240755 ?auto_1240759 ) ) ( not ( = ?auto_1240755 ?auto_1240760 ) ) ( not ( = ?auto_1240755 ?auto_1240761 ) ) ( not ( = ?auto_1240755 ?auto_1240762 ) ) ( not ( = ?auto_1240755 ?auto_1240763 ) ) ( not ( = ?auto_1240755 ?auto_1240764 ) ) ( not ( = ?auto_1240755 ?auto_1240765 ) ) ( not ( = ?auto_1240755 ?auto_1240766 ) ) ( not ( = ?auto_1240755 ?auto_1240770 ) ) ( not ( = ?auto_1240757 ?auto_1240758 ) ) ( not ( = ?auto_1240757 ?auto_1240759 ) ) ( not ( = ?auto_1240757 ?auto_1240760 ) ) ( not ( = ?auto_1240757 ?auto_1240761 ) ) ( not ( = ?auto_1240757 ?auto_1240762 ) ) ( not ( = ?auto_1240757 ?auto_1240763 ) ) ( not ( = ?auto_1240757 ?auto_1240764 ) ) ( not ( = ?auto_1240757 ?auto_1240765 ) ) ( not ( = ?auto_1240757 ?auto_1240766 ) ) ( not ( = ?auto_1240757 ?auto_1240770 ) ) ( not ( = ?auto_1240758 ?auto_1240759 ) ) ( not ( = ?auto_1240758 ?auto_1240760 ) ) ( not ( = ?auto_1240758 ?auto_1240761 ) ) ( not ( = ?auto_1240758 ?auto_1240762 ) ) ( not ( = ?auto_1240758 ?auto_1240763 ) ) ( not ( = ?auto_1240758 ?auto_1240764 ) ) ( not ( = ?auto_1240758 ?auto_1240765 ) ) ( not ( = ?auto_1240758 ?auto_1240766 ) ) ( not ( = ?auto_1240758 ?auto_1240770 ) ) ( not ( = ?auto_1240759 ?auto_1240760 ) ) ( not ( = ?auto_1240759 ?auto_1240761 ) ) ( not ( = ?auto_1240759 ?auto_1240762 ) ) ( not ( = ?auto_1240759 ?auto_1240763 ) ) ( not ( = ?auto_1240759 ?auto_1240764 ) ) ( not ( = ?auto_1240759 ?auto_1240765 ) ) ( not ( = ?auto_1240759 ?auto_1240766 ) ) ( not ( = ?auto_1240759 ?auto_1240770 ) ) ( not ( = ?auto_1240760 ?auto_1240761 ) ) ( not ( = ?auto_1240760 ?auto_1240762 ) ) ( not ( = ?auto_1240760 ?auto_1240763 ) ) ( not ( = ?auto_1240760 ?auto_1240764 ) ) ( not ( = ?auto_1240760 ?auto_1240765 ) ) ( not ( = ?auto_1240760 ?auto_1240766 ) ) ( not ( = ?auto_1240760 ?auto_1240770 ) ) ( not ( = ?auto_1240761 ?auto_1240762 ) ) ( not ( = ?auto_1240761 ?auto_1240763 ) ) ( not ( = ?auto_1240761 ?auto_1240764 ) ) ( not ( = ?auto_1240761 ?auto_1240765 ) ) ( not ( = ?auto_1240761 ?auto_1240766 ) ) ( not ( = ?auto_1240761 ?auto_1240770 ) ) ( not ( = ?auto_1240762 ?auto_1240763 ) ) ( not ( = ?auto_1240762 ?auto_1240764 ) ) ( not ( = ?auto_1240762 ?auto_1240765 ) ) ( not ( = ?auto_1240762 ?auto_1240766 ) ) ( not ( = ?auto_1240762 ?auto_1240770 ) ) ( not ( = ?auto_1240763 ?auto_1240764 ) ) ( not ( = ?auto_1240763 ?auto_1240765 ) ) ( not ( = ?auto_1240763 ?auto_1240766 ) ) ( not ( = ?auto_1240763 ?auto_1240770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1240764 ?auto_1240765 ?auto_1240766 )
      ( MAKE-14CRATE-VERIFY ?auto_1240752 ?auto_1240753 ?auto_1240754 ?auto_1240756 ?auto_1240755 ?auto_1240757 ?auto_1240758 ?auto_1240759 ?auto_1240760 ?auto_1240761 ?auto_1240762 ?auto_1240763 ?auto_1240764 ?auto_1240765 ?auto_1240766 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1240956 - SURFACE
      ?auto_1240957 - SURFACE
      ?auto_1240958 - SURFACE
      ?auto_1240960 - SURFACE
      ?auto_1240959 - SURFACE
      ?auto_1240961 - SURFACE
      ?auto_1240962 - SURFACE
      ?auto_1240963 - SURFACE
      ?auto_1240964 - SURFACE
      ?auto_1240965 - SURFACE
      ?auto_1240966 - SURFACE
      ?auto_1240967 - SURFACE
      ?auto_1240968 - SURFACE
      ?auto_1240969 - SURFACE
      ?auto_1240970 - SURFACE
    )
    :vars
    (
      ?auto_1240975 - HOIST
      ?auto_1240976 - PLACE
      ?auto_1240974 - PLACE
      ?auto_1240973 - HOIST
      ?auto_1240971 - SURFACE
      ?auto_1240972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1240975 ?auto_1240976 ) ( IS-CRATE ?auto_1240970 ) ( not ( = ?auto_1240969 ?auto_1240970 ) ) ( not ( = ?auto_1240968 ?auto_1240969 ) ) ( not ( = ?auto_1240968 ?auto_1240970 ) ) ( not ( = ?auto_1240974 ?auto_1240976 ) ) ( HOIST-AT ?auto_1240973 ?auto_1240974 ) ( not ( = ?auto_1240975 ?auto_1240973 ) ) ( AVAILABLE ?auto_1240973 ) ( SURFACE-AT ?auto_1240970 ?auto_1240974 ) ( ON ?auto_1240970 ?auto_1240971 ) ( CLEAR ?auto_1240970 ) ( not ( = ?auto_1240969 ?auto_1240971 ) ) ( not ( = ?auto_1240970 ?auto_1240971 ) ) ( not ( = ?auto_1240968 ?auto_1240971 ) ) ( TRUCK-AT ?auto_1240972 ?auto_1240976 ) ( SURFACE-AT ?auto_1240968 ?auto_1240976 ) ( CLEAR ?auto_1240968 ) ( LIFTING ?auto_1240975 ?auto_1240969 ) ( IS-CRATE ?auto_1240969 ) ( ON ?auto_1240957 ?auto_1240956 ) ( ON ?auto_1240958 ?auto_1240957 ) ( ON ?auto_1240960 ?auto_1240958 ) ( ON ?auto_1240959 ?auto_1240960 ) ( ON ?auto_1240961 ?auto_1240959 ) ( ON ?auto_1240962 ?auto_1240961 ) ( ON ?auto_1240963 ?auto_1240962 ) ( ON ?auto_1240964 ?auto_1240963 ) ( ON ?auto_1240965 ?auto_1240964 ) ( ON ?auto_1240966 ?auto_1240965 ) ( ON ?auto_1240967 ?auto_1240966 ) ( ON ?auto_1240968 ?auto_1240967 ) ( not ( = ?auto_1240956 ?auto_1240957 ) ) ( not ( = ?auto_1240956 ?auto_1240958 ) ) ( not ( = ?auto_1240956 ?auto_1240960 ) ) ( not ( = ?auto_1240956 ?auto_1240959 ) ) ( not ( = ?auto_1240956 ?auto_1240961 ) ) ( not ( = ?auto_1240956 ?auto_1240962 ) ) ( not ( = ?auto_1240956 ?auto_1240963 ) ) ( not ( = ?auto_1240956 ?auto_1240964 ) ) ( not ( = ?auto_1240956 ?auto_1240965 ) ) ( not ( = ?auto_1240956 ?auto_1240966 ) ) ( not ( = ?auto_1240956 ?auto_1240967 ) ) ( not ( = ?auto_1240956 ?auto_1240968 ) ) ( not ( = ?auto_1240956 ?auto_1240969 ) ) ( not ( = ?auto_1240956 ?auto_1240970 ) ) ( not ( = ?auto_1240956 ?auto_1240971 ) ) ( not ( = ?auto_1240957 ?auto_1240958 ) ) ( not ( = ?auto_1240957 ?auto_1240960 ) ) ( not ( = ?auto_1240957 ?auto_1240959 ) ) ( not ( = ?auto_1240957 ?auto_1240961 ) ) ( not ( = ?auto_1240957 ?auto_1240962 ) ) ( not ( = ?auto_1240957 ?auto_1240963 ) ) ( not ( = ?auto_1240957 ?auto_1240964 ) ) ( not ( = ?auto_1240957 ?auto_1240965 ) ) ( not ( = ?auto_1240957 ?auto_1240966 ) ) ( not ( = ?auto_1240957 ?auto_1240967 ) ) ( not ( = ?auto_1240957 ?auto_1240968 ) ) ( not ( = ?auto_1240957 ?auto_1240969 ) ) ( not ( = ?auto_1240957 ?auto_1240970 ) ) ( not ( = ?auto_1240957 ?auto_1240971 ) ) ( not ( = ?auto_1240958 ?auto_1240960 ) ) ( not ( = ?auto_1240958 ?auto_1240959 ) ) ( not ( = ?auto_1240958 ?auto_1240961 ) ) ( not ( = ?auto_1240958 ?auto_1240962 ) ) ( not ( = ?auto_1240958 ?auto_1240963 ) ) ( not ( = ?auto_1240958 ?auto_1240964 ) ) ( not ( = ?auto_1240958 ?auto_1240965 ) ) ( not ( = ?auto_1240958 ?auto_1240966 ) ) ( not ( = ?auto_1240958 ?auto_1240967 ) ) ( not ( = ?auto_1240958 ?auto_1240968 ) ) ( not ( = ?auto_1240958 ?auto_1240969 ) ) ( not ( = ?auto_1240958 ?auto_1240970 ) ) ( not ( = ?auto_1240958 ?auto_1240971 ) ) ( not ( = ?auto_1240960 ?auto_1240959 ) ) ( not ( = ?auto_1240960 ?auto_1240961 ) ) ( not ( = ?auto_1240960 ?auto_1240962 ) ) ( not ( = ?auto_1240960 ?auto_1240963 ) ) ( not ( = ?auto_1240960 ?auto_1240964 ) ) ( not ( = ?auto_1240960 ?auto_1240965 ) ) ( not ( = ?auto_1240960 ?auto_1240966 ) ) ( not ( = ?auto_1240960 ?auto_1240967 ) ) ( not ( = ?auto_1240960 ?auto_1240968 ) ) ( not ( = ?auto_1240960 ?auto_1240969 ) ) ( not ( = ?auto_1240960 ?auto_1240970 ) ) ( not ( = ?auto_1240960 ?auto_1240971 ) ) ( not ( = ?auto_1240959 ?auto_1240961 ) ) ( not ( = ?auto_1240959 ?auto_1240962 ) ) ( not ( = ?auto_1240959 ?auto_1240963 ) ) ( not ( = ?auto_1240959 ?auto_1240964 ) ) ( not ( = ?auto_1240959 ?auto_1240965 ) ) ( not ( = ?auto_1240959 ?auto_1240966 ) ) ( not ( = ?auto_1240959 ?auto_1240967 ) ) ( not ( = ?auto_1240959 ?auto_1240968 ) ) ( not ( = ?auto_1240959 ?auto_1240969 ) ) ( not ( = ?auto_1240959 ?auto_1240970 ) ) ( not ( = ?auto_1240959 ?auto_1240971 ) ) ( not ( = ?auto_1240961 ?auto_1240962 ) ) ( not ( = ?auto_1240961 ?auto_1240963 ) ) ( not ( = ?auto_1240961 ?auto_1240964 ) ) ( not ( = ?auto_1240961 ?auto_1240965 ) ) ( not ( = ?auto_1240961 ?auto_1240966 ) ) ( not ( = ?auto_1240961 ?auto_1240967 ) ) ( not ( = ?auto_1240961 ?auto_1240968 ) ) ( not ( = ?auto_1240961 ?auto_1240969 ) ) ( not ( = ?auto_1240961 ?auto_1240970 ) ) ( not ( = ?auto_1240961 ?auto_1240971 ) ) ( not ( = ?auto_1240962 ?auto_1240963 ) ) ( not ( = ?auto_1240962 ?auto_1240964 ) ) ( not ( = ?auto_1240962 ?auto_1240965 ) ) ( not ( = ?auto_1240962 ?auto_1240966 ) ) ( not ( = ?auto_1240962 ?auto_1240967 ) ) ( not ( = ?auto_1240962 ?auto_1240968 ) ) ( not ( = ?auto_1240962 ?auto_1240969 ) ) ( not ( = ?auto_1240962 ?auto_1240970 ) ) ( not ( = ?auto_1240962 ?auto_1240971 ) ) ( not ( = ?auto_1240963 ?auto_1240964 ) ) ( not ( = ?auto_1240963 ?auto_1240965 ) ) ( not ( = ?auto_1240963 ?auto_1240966 ) ) ( not ( = ?auto_1240963 ?auto_1240967 ) ) ( not ( = ?auto_1240963 ?auto_1240968 ) ) ( not ( = ?auto_1240963 ?auto_1240969 ) ) ( not ( = ?auto_1240963 ?auto_1240970 ) ) ( not ( = ?auto_1240963 ?auto_1240971 ) ) ( not ( = ?auto_1240964 ?auto_1240965 ) ) ( not ( = ?auto_1240964 ?auto_1240966 ) ) ( not ( = ?auto_1240964 ?auto_1240967 ) ) ( not ( = ?auto_1240964 ?auto_1240968 ) ) ( not ( = ?auto_1240964 ?auto_1240969 ) ) ( not ( = ?auto_1240964 ?auto_1240970 ) ) ( not ( = ?auto_1240964 ?auto_1240971 ) ) ( not ( = ?auto_1240965 ?auto_1240966 ) ) ( not ( = ?auto_1240965 ?auto_1240967 ) ) ( not ( = ?auto_1240965 ?auto_1240968 ) ) ( not ( = ?auto_1240965 ?auto_1240969 ) ) ( not ( = ?auto_1240965 ?auto_1240970 ) ) ( not ( = ?auto_1240965 ?auto_1240971 ) ) ( not ( = ?auto_1240966 ?auto_1240967 ) ) ( not ( = ?auto_1240966 ?auto_1240968 ) ) ( not ( = ?auto_1240966 ?auto_1240969 ) ) ( not ( = ?auto_1240966 ?auto_1240970 ) ) ( not ( = ?auto_1240966 ?auto_1240971 ) ) ( not ( = ?auto_1240967 ?auto_1240968 ) ) ( not ( = ?auto_1240967 ?auto_1240969 ) ) ( not ( = ?auto_1240967 ?auto_1240970 ) ) ( not ( = ?auto_1240967 ?auto_1240971 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1240968 ?auto_1240969 ?auto_1240970 )
      ( MAKE-14CRATE-VERIFY ?auto_1240956 ?auto_1240957 ?auto_1240958 ?auto_1240960 ?auto_1240959 ?auto_1240961 ?auto_1240962 ?auto_1240963 ?auto_1240964 ?auto_1240965 ?auto_1240966 ?auto_1240967 ?auto_1240968 ?auto_1240969 ?auto_1240970 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1241160 - SURFACE
      ?auto_1241161 - SURFACE
      ?auto_1241162 - SURFACE
      ?auto_1241164 - SURFACE
      ?auto_1241163 - SURFACE
      ?auto_1241165 - SURFACE
      ?auto_1241166 - SURFACE
      ?auto_1241167 - SURFACE
      ?auto_1241168 - SURFACE
      ?auto_1241169 - SURFACE
      ?auto_1241170 - SURFACE
      ?auto_1241171 - SURFACE
      ?auto_1241172 - SURFACE
      ?auto_1241173 - SURFACE
      ?auto_1241174 - SURFACE
    )
    :vars
    (
      ?auto_1241180 - HOIST
      ?auto_1241178 - PLACE
      ?auto_1241177 - PLACE
      ?auto_1241176 - HOIST
      ?auto_1241179 - SURFACE
      ?auto_1241175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1241180 ?auto_1241178 ) ( IS-CRATE ?auto_1241174 ) ( not ( = ?auto_1241173 ?auto_1241174 ) ) ( not ( = ?auto_1241172 ?auto_1241173 ) ) ( not ( = ?auto_1241172 ?auto_1241174 ) ) ( not ( = ?auto_1241177 ?auto_1241178 ) ) ( HOIST-AT ?auto_1241176 ?auto_1241177 ) ( not ( = ?auto_1241180 ?auto_1241176 ) ) ( AVAILABLE ?auto_1241176 ) ( SURFACE-AT ?auto_1241174 ?auto_1241177 ) ( ON ?auto_1241174 ?auto_1241179 ) ( CLEAR ?auto_1241174 ) ( not ( = ?auto_1241173 ?auto_1241179 ) ) ( not ( = ?auto_1241174 ?auto_1241179 ) ) ( not ( = ?auto_1241172 ?auto_1241179 ) ) ( TRUCK-AT ?auto_1241175 ?auto_1241178 ) ( SURFACE-AT ?auto_1241172 ?auto_1241178 ) ( CLEAR ?auto_1241172 ) ( IS-CRATE ?auto_1241173 ) ( AVAILABLE ?auto_1241180 ) ( IN ?auto_1241173 ?auto_1241175 ) ( ON ?auto_1241161 ?auto_1241160 ) ( ON ?auto_1241162 ?auto_1241161 ) ( ON ?auto_1241164 ?auto_1241162 ) ( ON ?auto_1241163 ?auto_1241164 ) ( ON ?auto_1241165 ?auto_1241163 ) ( ON ?auto_1241166 ?auto_1241165 ) ( ON ?auto_1241167 ?auto_1241166 ) ( ON ?auto_1241168 ?auto_1241167 ) ( ON ?auto_1241169 ?auto_1241168 ) ( ON ?auto_1241170 ?auto_1241169 ) ( ON ?auto_1241171 ?auto_1241170 ) ( ON ?auto_1241172 ?auto_1241171 ) ( not ( = ?auto_1241160 ?auto_1241161 ) ) ( not ( = ?auto_1241160 ?auto_1241162 ) ) ( not ( = ?auto_1241160 ?auto_1241164 ) ) ( not ( = ?auto_1241160 ?auto_1241163 ) ) ( not ( = ?auto_1241160 ?auto_1241165 ) ) ( not ( = ?auto_1241160 ?auto_1241166 ) ) ( not ( = ?auto_1241160 ?auto_1241167 ) ) ( not ( = ?auto_1241160 ?auto_1241168 ) ) ( not ( = ?auto_1241160 ?auto_1241169 ) ) ( not ( = ?auto_1241160 ?auto_1241170 ) ) ( not ( = ?auto_1241160 ?auto_1241171 ) ) ( not ( = ?auto_1241160 ?auto_1241172 ) ) ( not ( = ?auto_1241160 ?auto_1241173 ) ) ( not ( = ?auto_1241160 ?auto_1241174 ) ) ( not ( = ?auto_1241160 ?auto_1241179 ) ) ( not ( = ?auto_1241161 ?auto_1241162 ) ) ( not ( = ?auto_1241161 ?auto_1241164 ) ) ( not ( = ?auto_1241161 ?auto_1241163 ) ) ( not ( = ?auto_1241161 ?auto_1241165 ) ) ( not ( = ?auto_1241161 ?auto_1241166 ) ) ( not ( = ?auto_1241161 ?auto_1241167 ) ) ( not ( = ?auto_1241161 ?auto_1241168 ) ) ( not ( = ?auto_1241161 ?auto_1241169 ) ) ( not ( = ?auto_1241161 ?auto_1241170 ) ) ( not ( = ?auto_1241161 ?auto_1241171 ) ) ( not ( = ?auto_1241161 ?auto_1241172 ) ) ( not ( = ?auto_1241161 ?auto_1241173 ) ) ( not ( = ?auto_1241161 ?auto_1241174 ) ) ( not ( = ?auto_1241161 ?auto_1241179 ) ) ( not ( = ?auto_1241162 ?auto_1241164 ) ) ( not ( = ?auto_1241162 ?auto_1241163 ) ) ( not ( = ?auto_1241162 ?auto_1241165 ) ) ( not ( = ?auto_1241162 ?auto_1241166 ) ) ( not ( = ?auto_1241162 ?auto_1241167 ) ) ( not ( = ?auto_1241162 ?auto_1241168 ) ) ( not ( = ?auto_1241162 ?auto_1241169 ) ) ( not ( = ?auto_1241162 ?auto_1241170 ) ) ( not ( = ?auto_1241162 ?auto_1241171 ) ) ( not ( = ?auto_1241162 ?auto_1241172 ) ) ( not ( = ?auto_1241162 ?auto_1241173 ) ) ( not ( = ?auto_1241162 ?auto_1241174 ) ) ( not ( = ?auto_1241162 ?auto_1241179 ) ) ( not ( = ?auto_1241164 ?auto_1241163 ) ) ( not ( = ?auto_1241164 ?auto_1241165 ) ) ( not ( = ?auto_1241164 ?auto_1241166 ) ) ( not ( = ?auto_1241164 ?auto_1241167 ) ) ( not ( = ?auto_1241164 ?auto_1241168 ) ) ( not ( = ?auto_1241164 ?auto_1241169 ) ) ( not ( = ?auto_1241164 ?auto_1241170 ) ) ( not ( = ?auto_1241164 ?auto_1241171 ) ) ( not ( = ?auto_1241164 ?auto_1241172 ) ) ( not ( = ?auto_1241164 ?auto_1241173 ) ) ( not ( = ?auto_1241164 ?auto_1241174 ) ) ( not ( = ?auto_1241164 ?auto_1241179 ) ) ( not ( = ?auto_1241163 ?auto_1241165 ) ) ( not ( = ?auto_1241163 ?auto_1241166 ) ) ( not ( = ?auto_1241163 ?auto_1241167 ) ) ( not ( = ?auto_1241163 ?auto_1241168 ) ) ( not ( = ?auto_1241163 ?auto_1241169 ) ) ( not ( = ?auto_1241163 ?auto_1241170 ) ) ( not ( = ?auto_1241163 ?auto_1241171 ) ) ( not ( = ?auto_1241163 ?auto_1241172 ) ) ( not ( = ?auto_1241163 ?auto_1241173 ) ) ( not ( = ?auto_1241163 ?auto_1241174 ) ) ( not ( = ?auto_1241163 ?auto_1241179 ) ) ( not ( = ?auto_1241165 ?auto_1241166 ) ) ( not ( = ?auto_1241165 ?auto_1241167 ) ) ( not ( = ?auto_1241165 ?auto_1241168 ) ) ( not ( = ?auto_1241165 ?auto_1241169 ) ) ( not ( = ?auto_1241165 ?auto_1241170 ) ) ( not ( = ?auto_1241165 ?auto_1241171 ) ) ( not ( = ?auto_1241165 ?auto_1241172 ) ) ( not ( = ?auto_1241165 ?auto_1241173 ) ) ( not ( = ?auto_1241165 ?auto_1241174 ) ) ( not ( = ?auto_1241165 ?auto_1241179 ) ) ( not ( = ?auto_1241166 ?auto_1241167 ) ) ( not ( = ?auto_1241166 ?auto_1241168 ) ) ( not ( = ?auto_1241166 ?auto_1241169 ) ) ( not ( = ?auto_1241166 ?auto_1241170 ) ) ( not ( = ?auto_1241166 ?auto_1241171 ) ) ( not ( = ?auto_1241166 ?auto_1241172 ) ) ( not ( = ?auto_1241166 ?auto_1241173 ) ) ( not ( = ?auto_1241166 ?auto_1241174 ) ) ( not ( = ?auto_1241166 ?auto_1241179 ) ) ( not ( = ?auto_1241167 ?auto_1241168 ) ) ( not ( = ?auto_1241167 ?auto_1241169 ) ) ( not ( = ?auto_1241167 ?auto_1241170 ) ) ( not ( = ?auto_1241167 ?auto_1241171 ) ) ( not ( = ?auto_1241167 ?auto_1241172 ) ) ( not ( = ?auto_1241167 ?auto_1241173 ) ) ( not ( = ?auto_1241167 ?auto_1241174 ) ) ( not ( = ?auto_1241167 ?auto_1241179 ) ) ( not ( = ?auto_1241168 ?auto_1241169 ) ) ( not ( = ?auto_1241168 ?auto_1241170 ) ) ( not ( = ?auto_1241168 ?auto_1241171 ) ) ( not ( = ?auto_1241168 ?auto_1241172 ) ) ( not ( = ?auto_1241168 ?auto_1241173 ) ) ( not ( = ?auto_1241168 ?auto_1241174 ) ) ( not ( = ?auto_1241168 ?auto_1241179 ) ) ( not ( = ?auto_1241169 ?auto_1241170 ) ) ( not ( = ?auto_1241169 ?auto_1241171 ) ) ( not ( = ?auto_1241169 ?auto_1241172 ) ) ( not ( = ?auto_1241169 ?auto_1241173 ) ) ( not ( = ?auto_1241169 ?auto_1241174 ) ) ( not ( = ?auto_1241169 ?auto_1241179 ) ) ( not ( = ?auto_1241170 ?auto_1241171 ) ) ( not ( = ?auto_1241170 ?auto_1241172 ) ) ( not ( = ?auto_1241170 ?auto_1241173 ) ) ( not ( = ?auto_1241170 ?auto_1241174 ) ) ( not ( = ?auto_1241170 ?auto_1241179 ) ) ( not ( = ?auto_1241171 ?auto_1241172 ) ) ( not ( = ?auto_1241171 ?auto_1241173 ) ) ( not ( = ?auto_1241171 ?auto_1241174 ) ) ( not ( = ?auto_1241171 ?auto_1241179 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1241172 ?auto_1241173 ?auto_1241174 )
      ( MAKE-14CRATE-VERIFY ?auto_1241160 ?auto_1241161 ?auto_1241162 ?auto_1241164 ?auto_1241163 ?auto_1241165 ?auto_1241166 ?auto_1241167 ?auto_1241168 ?auto_1241169 ?auto_1241170 ?auto_1241171 ?auto_1241172 ?auto_1241173 ?auto_1241174 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1257416 - SURFACE
      ?auto_1257417 - SURFACE
    )
    :vars
    (
      ?auto_1257419 - HOIST
      ?auto_1257423 - PLACE
      ?auto_1257424 - SURFACE
      ?auto_1257420 - TRUCK
      ?auto_1257418 - PLACE
      ?auto_1257421 - HOIST
      ?auto_1257422 - SURFACE
      ?auto_1257425 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1257419 ?auto_1257423 ) ( SURFACE-AT ?auto_1257416 ?auto_1257423 ) ( CLEAR ?auto_1257416 ) ( IS-CRATE ?auto_1257417 ) ( not ( = ?auto_1257416 ?auto_1257417 ) ) ( AVAILABLE ?auto_1257419 ) ( ON ?auto_1257416 ?auto_1257424 ) ( not ( = ?auto_1257424 ?auto_1257416 ) ) ( not ( = ?auto_1257424 ?auto_1257417 ) ) ( TRUCK-AT ?auto_1257420 ?auto_1257418 ) ( not ( = ?auto_1257418 ?auto_1257423 ) ) ( HOIST-AT ?auto_1257421 ?auto_1257418 ) ( not ( = ?auto_1257419 ?auto_1257421 ) ) ( SURFACE-AT ?auto_1257417 ?auto_1257418 ) ( ON ?auto_1257417 ?auto_1257422 ) ( CLEAR ?auto_1257417 ) ( not ( = ?auto_1257416 ?auto_1257422 ) ) ( not ( = ?auto_1257417 ?auto_1257422 ) ) ( not ( = ?auto_1257424 ?auto_1257422 ) ) ( LIFTING ?auto_1257421 ?auto_1257425 ) ( IS-CRATE ?auto_1257425 ) ( not ( = ?auto_1257416 ?auto_1257425 ) ) ( not ( = ?auto_1257417 ?auto_1257425 ) ) ( not ( = ?auto_1257424 ?auto_1257425 ) ) ( not ( = ?auto_1257422 ?auto_1257425 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1257421 ?auto_1257425 ?auto_1257420 ?auto_1257418 )
      ( MAKE-1CRATE ?auto_1257416 ?auto_1257417 )
      ( MAKE-1CRATE-VERIFY ?auto_1257416 ?auto_1257417 ) )
  )

)

