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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10818 - SURFACE
      ?auto_10819 - SURFACE
    )
    :vars
    (
      ?auto_10820 - HOIST
      ?auto_10821 - PLACE
      ?auto_10823 - PLACE
      ?auto_10824 - HOIST
      ?auto_10825 - SURFACE
      ?auto_10822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10820 ?auto_10821 ) ( SURFACE-AT ?auto_10818 ?auto_10821 ) ( CLEAR ?auto_10818 ) ( IS-CRATE ?auto_10819 ) ( AVAILABLE ?auto_10820 ) ( not ( = ?auto_10823 ?auto_10821 ) ) ( HOIST-AT ?auto_10824 ?auto_10823 ) ( AVAILABLE ?auto_10824 ) ( SURFACE-AT ?auto_10819 ?auto_10823 ) ( ON ?auto_10819 ?auto_10825 ) ( CLEAR ?auto_10819 ) ( TRUCK-AT ?auto_10822 ?auto_10821 ) ( not ( = ?auto_10818 ?auto_10819 ) ) ( not ( = ?auto_10818 ?auto_10825 ) ) ( not ( = ?auto_10819 ?auto_10825 ) ) ( not ( = ?auto_10820 ?auto_10824 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10822 ?auto_10821 ?auto_10823 )
      ( !LIFT ?auto_10824 ?auto_10819 ?auto_10825 ?auto_10823 )
      ( !LOAD ?auto_10824 ?auto_10819 ?auto_10822 ?auto_10823 )
      ( !DRIVE ?auto_10822 ?auto_10823 ?auto_10821 )
      ( !UNLOAD ?auto_10820 ?auto_10819 ?auto_10822 ?auto_10821 )
      ( !DROP ?auto_10820 ?auto_10819 ?auto_10818 ?auto_10821 )
      ( MAKE-1CRATE-VERIFY ?auto_10818 ?auto_10819 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10828 - SURFACE
      ?auto_10829 - SURFACE
    )
    :vars
    (
      ?auto_10830 - HOIST
      ?auto_10831 - PLACE
      ?auto_10833 - PLACE
      ?auto_10834 - HOIST
      ?auto_10835 - SURFACE
      ?auto_10832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10830 ?auto_10831 ) ( SURFACE-AT ?auto_10828 ?auto_10831 ) ( CLEAR ?auto_10828 ) ( IS-CRATE ?auto_10829 ) ( AVAILABLE ?auto_10830 ) ( not ( = ?auto_10833 ?auto_10831 ) ) ( HOIST-AT ?auto_10834 ?auto_10833 ) ( AVAILABLE ?auto_10834 ) ( SURFACE-AT ?auto_10829 ?auto_10833 ) ( ON ?auto_10829 ?auto_10835 ) ( CLEAR ?auto_10829 ) ( TRUCK-AT ?auto_10832 ?auto_10831 ) ( not ( = ?auto_10828 ?auto_10829 ) ) ( not ( = ?auto_10828 ?auto_10835 ) ) ( not ( = ?auto_10829 ?auto_10835 ) ) ( not ( = ?auto_10830 ?auto_10834 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10832 ?auto_10831 ?auto_10833 )
      ( !LIFT ?auto_10834 ?auto_10829 ?auto_10835 ?auto_10833 )
      ( !LOAD ?auto_10834 ?auto_10829 ?auto_10832 ?auto_10833 )
      ( !DRIVE ?auto_10832 ?auto_10833 ?auto_10831 )
      ( !UNLOAD ?auto_10830 ?auto_10829 ?auto_10832 ?auto_10831 )
      ( !DROP ?auto_10830 ?auto_10829 ?auto_10828 ?auto_10831 )
      ( MAKE-1CRATE-VERIFY ?auto_10828 ?auto_10829 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10839 - SURFACE
      ?auto_10840 - SURFACE
      ?auto_10841 - SURFACE
    )
    :vars
    (
      ?auto_10844 - HOIST
      ?auto_10845 - PLACE
      ?auto_10843 - PLACE
      ?auto_10846 - HOIST
      ?auto_10847 - SURFACE
      ?auto_10848 - PLACE
      ?auto_10850 - HOIST
      ?auto_10849 - SURFACE
      ?auto_10842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10844 ?auto_10845 ) ( IS-CRATE ?auto_10841 ) ( not ( = ?auto_10843 ?auto_10845 ) ) ( HOIST-AT ?auto_10846 ?auto_10843 ) ( AVAILABLE ?auto_10846 ) ( SURFACE-AT ?auto_10841 ?auto_10843 ) ( ON ?auto_10841 ?auto_10847 ) ( CLEAR ?auto_10841 ) ( not ( = ?auto_10840 ?auto_10841 ) ) ( not ( = ?auto_10840 ?auto_10847 ) ) ( not ( = ?auto_10841 ?auto_10847 ) ) ( not ( = ?auto_10844 ?auto_10846 ) ) ( SURFACE-AT ?auto_10839 ?auto_10845 ) ( CLEAR ?auto_10839 ) ( IS-CRATE ?auto_10840 ) ( AVAILABLE ?auto_10844 ) ( not ( = ?auto_10848 ?auto_10845 ) ) ( HOIST-AT ?auto_10850 ?auto_10848 ) ( AVAILABLE ?auto_10850 ) ( SURFACE-AT ?auto_10840 ?auto_10848 ) ( ON ?auto_10840 ?auto_10849 ) ( CLEAR ?auto_10840 ) ( TRUCK-AT ?auto_10842 ?auto_10845 ) ( not ( = ?auto_10839 ?auto_10840 ) ) ( not ( = ?auto_10839 ?auto_10849 ) ) ( not ( = ?auto_10840 ?auto_10849 ) ) ( not ( = ?auto_10844 ?auto_10850 ) ) ( not ( = ?auto_10839 ?auto_10841 ) ) ( not ( = ?auto_10839 ?auto_10847 ) ) ( not ( = ?auto_10841 ?auto_10849 ) ) ( not ( = ?auto_10843 ?auto_10848 ) ) ( not ( = ?auto_10846 ?auto_10850 ) ) ( not ( = ?auto_10847 ?auto_10849 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10839 ?auto_10840 )
      ( MAKE-1CRATE ?auto_10840 ?auto_10841 )
      ( MAKE-2CRATE-VERIFY ?auto_10839 ?auto_10840 ?auto_10841 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10853 - SURFACE
      ?auto_10854 - SURFACE
    )
    :vars
    (
      ?auto_10855 - HOIST
      ?auto_10856 - PLACE
      ?auto_10858 - PLACE
      ?auto_10859 - HOIST
      ?auto_10860 - SURFACE
      ?auto_10857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10855 ?auto_10856 ) ( SURFACE-AT ?auto_10853 ?auto_10856 ) ( CLEAR ?auto_10853 ) ( IS-CRATE ?auto_10854 ) ( AVAILABLE ?auto_10855 ) ( not ( = ?auto_10858 ?auto_10856 ) ) ( HOIST-AT ?auto_10859 ?auto_10858 ) ( AVAILABLE ?auto_10859 ) ( SURFACE-AT ?auto_10854 ?auto_10858 ) ( ON ?auto_10854 ?auto_10860 ) ( CLEAR ?auto_10854 ) ( TRUCK-AT ?auto_10857 ?auto_10856 ) ( not ( = ?auto_10853 ?auto_10854 ) ) ( not ( = ?auto_10853 ?auto_10860 ) ) ( not ( = ?auto_10854 ?auto_10860 ) ) ( not ( = ?auto_10855 ?auto_10859 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10857 ?auto_10856 ?auto_10858 )
      ( !LIFT ?auto_10859 ?auto_10854 ?auto_10860 ?auto_10858 )
      ( !LOAD ?auto_10859 ?auto_10854 ?auto_10857 ?auto_10858 )
      ( !DRIVE ?auto_10857 ?auto_10858 ?auto_10856 )
      ( !UNLOAD ?auto_10855 ?auto_10854 ?auto_10857 ?auto_10856 )
      ( !DROP ?auto_10855 ?auto_10854 ?auto_10853 ?auto_10856 )
      ( MAKE-1CRATE-VERIFY ?auto_10853 ?auto_10854 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10865 - SURFACE
      ?auto_10866 - SURFACE
      ?auto_10867 - SURFACE
      ?auto_10868 - SURFACE
    )
    :vars
    (
      ?auto_10874 - HOIST
      ?auto_10869 - PLACE
      ?auto_10872 - PLACE
      ?auto_10871 - HOIST
      ?auto_10873 - SURFACE
      ?auto_10880 - PLACE
      ?auto_10877 - HOIST
      ?auto_10879 - SURFACE
      ?auto_10876 - PLACE
      ?auto_10878 - HOIST
      ?auto_10875 - SURFACE
      ?auto_10870 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10874 ?auto_10869 ) ( IS-CRATE ?auto_10868 ) ( not ( = ?auto_10872 ?auto_10869 ) ) ( HOIST-AT ?auto_10871 ?auto_10872 ) ( AVAILABLE ?auto_10871 ) ( SURFACE-AT ?auto_10868 ?auto_10872 ) ( ON ?auto_10868 ?auto_10873 ) ( CLEAR ?auto_10868 ) ( not ( = ?auto_10867 ?auto_10868 ) ) ( not ( = ?auto_10867 ?auto_10873 ) ) ( not ( = ?auto_10868 ?auto_10873 ) ) ( not ( = ?auto_10874 ?auto_10871 ) ) ( IS-CRATE ?auto_10867 ) ( not ( = ?auto_10880 ?auto_10869 ) ) ( HOIST-AT ?auto_10877 ?auto_10880 ) ( AVAILABLE ?auto_10877 ) ( SURFACE-AT ?auto_10867 ?auto_10880 ) ( ON ?auto_10867 ?auto_10879 ) ( CLEAR ?auto_10867 ) ( not ( = ?auto_10866 ?auto_10867 ) ) ( not ( = ?auto_10866 ?auto_10879 ) ) ( not ( = ?auto_10867 ?auto_10879 ) ) ( not ( = ?auto_10874 ?auto_10877 ) ) ( SURFACE-AT ?auto_10865 ?auto_10869 ) ( CLEAR ?auto_10865 ) ( IS-CRATE ?auto_10866 ) ( AVAILABLE ?auto_10874 ) ( not ( = ?auto_10876 ?auto_10869 ) ) ( HOIST-AT ?auto_10878 ?auto_10876 ) ( AVAILABLE ?auto_10878 ) ( SURFACE-AT ?auto_10866 ?auto_10876 ) ( ON ?auto_10866 ?auto_10875 ) ( CLEAR ?auto_10866 ) ( TRUCK-AT ?auto_10870 ?auto_10869 ) ( not ( = ?auto_10865 ?auto_10866 ) ) ( not ( = ?auto_10865 ?auto_10875 ) ) ( not ( = ?auto_10866 ?auto_10875 ) ) ( not ( = ?auto_10874 ?auto_10878 ) ) ( not ( = ?auto_10865 ?auto_10867 ) ) ( not ( = ?auto_10865 ?auto_10879 ) ) ( not ( = ?auto_10867 ?auto_10875 ) ) ( not ( = ?auto_10880 ?auto_10876 ) ) ( not ( = ?auto_10877 ?auto_10878 ) ) ( not ( = ?auto_10879 ?auto_10875 ) ) ( not ( = ?auto_10865 ?auto_10868 ) ) ( not ( = ?auto_10865 ?auto_10873 ) ) ( not ( = ?auto_10866 ?auto_10868 ) ) ( not ( = ?auto_10866 ?auto_10873 ) ) ( not ( = ?auto_10868 ?auto_10879 ) ) ( not ( = ?auto_10868 ?auto_10875 ) ) ( not ( = ?auto_10872 ?auto_10880 ) ) ( not ( = ?auto_10872 ?auto_10876 ) ) ( not ( = ?auto_10871 ?auto_10877 ) ) ( not ( = ?auto_10871 ?auto_10878 ) ) ( not ( = ?auto_10873 ?auto_10879 ) ) ( not ( = ?auto_10873 ?auto_10875 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10865 ?auto_10866 ?auto_10867 )
      ( MAKE-1CRATE ?auto_10867 ?auto_10868 )
      ( MAKE-3CRATE-VERIFY ?auto_10865 ?auto_10866 ?auto_10867 ?auto_10868 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10883 - SURFACE
      ?auto_10884 - SURFACE
    )
    :vars
    (
      ?auto_10885 - HOIST
      ?auto_10886 - PLACE
      ?auto_10888 - PLACE
      ?auto_10889 - HOIST
      ?auto_10890 - SURFACE
      ?auto_10887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10885 ?auto_10886 ) ( SURFACE-AT ?auto_10883 ?auto_10886 ) ( CLEAR ?auto_10883 ) ( IS-CRATE ?auto_10884 ) ( AVAILABLE ?auto_10885 ) ( not ( = ?auto_10888 ?auto_10886 ) ) ( HOIST-AT ?auto_10889 ?auto_10888 ) ( AVAILABLE ?auto_10889 ) ( SURFACE-AT ?auto_10884 ?auto_10888 ) ( ON ?auto_10884 ?auto_10890 ) ( CLEAR ?auto_10884 ) ( TRUCK-AT ?auto_10887 ?auto_10886 ) ( not ( = ?auto_10883 ?auto_10884 ) ) ( not ( = ?auto_10883 ?auto_10890 ) ) ( not ( = ?auto_10884 ?auto_10890 ) ) ( not ( = ?auto_10885 ?auto_10889 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10887 ?auto_10886 ?auto_10888 )
      ( !LIFT ?auto_10889 ?auto_10884 ?auto_10890 ?auto_10888 )
      ( !LOAD ?auto_10889 ?auto_10884 ?auto_10887 ?auto_10888 )
      ( !DRIVE ?auto_10887 ?auto_10888 ?auto_10886 )
      ( !UNLOAD ?auto_10885 ?auto_10884 ?auto_10887 ?auto_10886 )
      ( !DROP ?auto_10885 ?auto_10884 ?auto_10883 ?auto_10886 )
      ( MAKE-1CRATE-VERIFY ?auto_10883 ?auto_10884 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10896 - SURFACE
      ?auto_10897 - SURFACE
      ?auto_10898 - SURFACE
      ?auto_10899 - SURFACE
      ?auto_10900 - SURFACE
    )
    :vars
    (
      ?auto_10906 - HOIST
      ?auto_10902 - PLACE
      ?auto_10903 - PLACE
      ?auto_10905 - HOIST
      ?auto_10901 - SURFACE
      ?auto_10910 - PLACE
      ?auto_10914 - HOIST
      ?auto_10911 - SURFACE
      ?auto_10907 - PLACE
      ?auto_10915 - HOIST
      ?auto_10909 - SURFACE
      ?auto_10908 - PLACE
      ?auto_10913 - HOIST
      ?auto_10912 - SURFACE
      ?auto_10904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10906 ?auto_10902 ) ( IS-CRATE ?auto_10900 ) ( not ( = ?auto_10903 ?auto_10902 ) ) ( HOIST-AT ?auto_10905 ?auto_10903 ) ( AVAILABLE ?auto_10905 ) ( SURFACE-AT ?auto_10900 ?auto_10903 ) ( ON ?auto_10900 ?auto_10901 ) ( CLEAR ?auto_10900 ) ( not ( = ?auto_10899 ?auto_10900 ) ) ( not ( = ?auto_10899 ?auto_10901 ) ) ( not ( = ?auto_10900 ?auto_10901 ) ) ( not ( = ?auto_10906 ?auto_10905 ) ) ( IS-CRATE ?auto_10899 ) ( not ( = ?auto_10910 ?auto_10902 ) ) ( HOIST-AT ?auto_10914 ?auto_10910 ) ( AVAILABLE ?auto_10914 ) ( SURFACE-AT ?auto_10899 ?auto_10910 ) ( ON ?auto_10899 ?auto_10911 ) ( CLEAR ?auto_10899 ) ( not ( = ?auto_10898 ?auto_10899 ) ) ( not ( = ?auto_10898 ?auto_10911 ) ) ( not ( = ?auto_10899 ?auto_10911 ) ) ( not ( = ?auto_10906 ?auto_10914 ) ) ( IS-CRATE ?auto_10898 ) ( not ( = ?auto_10907 ?auto_10902 ) ) ( HOIST-AT ?auto_10915 ?auto_10907 ) ( AVAILABLE ?auto_10915 ) ( SURFACE-AT ?auto_10898 ?auto_10907 ) ( ON ?auto_10898 ?auto_10909 ) ( CLEAR ?auto_10898 ) ( not ( = ?auto_10897 ?auto_10898 ) ) ( not ( = ?auto_10897 ?auto_10909 ) ) ( not ( = ?auto_10898 ?auto_10909 ) ) ( not ( = ?auto_10906 ?auto_10915 ) ) ( SURFACE-AT ?auto_10896 ?auto_10902 ) ( CLEAR ?auto_10896 ) ( IS-CRATE ?auto_10897 ) ( AVAILABLE ?auto_10906 ) ( not ( = ?auto_10908 ?auto_10902 ) ) ( HOIST-AT ?auto_10913 ?auto_10908 ) ( AVAILABLE ?auto_10913 ) ( SURFACE-AT ?auto_10897 ?auto_10908 ) ( ON ?auto_10897 ?auto_10912 ) ( CLEAR ?auto_10897 ) ( TRUCK-AT ?auto_10904 ?auto_10902 ) ( not ( = ?auto_10896 ?auto_10897 ) ) ( not ( = ?auto_10896 ?auto_10912 ) ) ( not ( = ?auto_10897 ?auto_10912 ) ) ( not ( = ?auto_10906 ?auto_10913 ) ) ( not ( = ?auto_10896 ?auto_10898 ) ) ( not ( = ?auto_10896 ?auto_10909 ) ) ( not ( = ?auto_10898 ?auto_10912 ) ) ( not ( = ?auto_10907 ?auto_10908 ) ) ( not ( = ?auto_10915 ?auto_10913 ) ) ( not ( = ?auto_10909 ?auto_10912 ) ) ( not ( = ?auto_10896 ?auto_10899 ) ) ( not ( = ?auto_10896 ?auto_10911 ) ) ( not ( = ?auto_10897 ?auto_10899 ) ) ( not ( = ?auto_10897 ?auto_10911 ) ) ( not ( = ?auto_10899 ?auto_10909 ) ) ( not ( = ?auto_10899 ?auto_10912 ) ) ( not ( = ?auto_10910 ?auto_10907 ) ) ( not ( = ?auto_10910 ?auto_10908 ) ) ( not ( = ?auto_10914 ?auto_10915 ) ) ( not ( = ?auto_10914 ?auto_10913 ) ) ( not ( = ?auto_10911 ?auto_10909 ) ) ( not ( = ?auto_10911 ?auto_10912 ) ) ( not ( = ?auto_10896 ?auto_10900 ) ) ( not ( = ?auto_10896 ?auto_10901 ) ) ( not ( = ?auto_10897 ?auto_10900 ) ) ( not ( = ?auto_10897 ?auto_10901 ) ) ( not ( = ?auto_10898 ?auto_10900 ) ) ( not ( = ?auto_10898 ?auto_10901 ) ) ( not ( = ?auto_10900 ?auto_10911 ) ) ( not ( = ?auto_10900 ?auto_10909 ) ) ( not ( = ?auto_10900 ?auto_10912 ) ) ( not ( = ?auto_10903 ?auto_10910 ) ) ( not ( = ?auto_10903 ?auto_10907 ) ) ( not ( = ?auto_10903 ?auto_10908 ) ) ( not ( = ?auto_10905 ?auto_10914 ) ) ( not ( = ?auto_10905 ?auto_10915 ) ) ( not ( = ?auto_10905 ?auto_10913 ) ) ( not ( = ?auto_10901 ?auto_10911 ) ) ( not ( = ?auto_10901 ?auto_10909 ) ) ( not ( = ?auto_10901 ?auto_10912 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_10896 ?auto_10897 ?auto_10898 ?auto_10899 )
      ( MAKE-1CRATE ?auto_10899 ?auto_10900 )
      ( MAKE-4CRATE-VERIFY ?auto_10896 ?auto_10897 ?auto_10898 ?auto_10899 ?auto_10900 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10918 - SURFACE
      ?auto_10919 - SURFACE
    )
    :vars
    (
      ?auto_10920 - HOIST
      ?auto_10921 - PLACE
      ?auto_10923 - PLACE
      ?auto_10924 - HOIST
      ?auto_10925 - SURFACE
      ?auto_10922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10920 ?auto_10921 ) ( SURFACE-AT ?auto_10918 ?auto_10921 ) ( CLEAR ?auto_10918 ) ( IS-CRATE ?auto_10919 ) ( AVAILABLE ?auto_10920 ) ( not ( = ?auto_10923 ?auto_10921 ) ) ( HOIST-AT ?auto_10924 ?auto_10923 ) ( AVAILABLE ?auto_10924 ) ( SURFACE-AT ?auto_10919 ?auto_10923 ) ( ON ?auto_10919 ?auto_10925 ) ( CLEAR ?auto_10919 ) ( TRUCK-AT ?auto_10922 ?auto_10921 ) ( not ( = ?auto_10918 ?auto_10919 ) ) ( not ( = ?auto_10918 ?auto_10925 ) ) ( not ( = ?auto_10919 ?auto_10925 ) ) ( not ( = ?auto_10920 ?auto_10924 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10922 ?auto_10921 ?auto_10923 )
      ( !LIFT ?auto_10924 ?auto_10919 ?auto_10925 ?auto_10923 )
      ( !LOAD ?auto_10924 ?auto_10919 ?auto_10922 ?auto_10923 )
      ( !DRIVE ?auto_10922 ?auto_10923 ?auto_10921 )
      ( !UNLOAD ?auto_10920 ?auto_10919 ?auto_10922 ?auto_10921 )
      ( !DROP ?auto_10920 ?auto_10919 ?auto_10918 ?auto_10921 )
      ( MAKE-1CRATE-VERIFY ?auto_10918 ?auto_10919 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_10932 - SURFACE
      ?auto_10933 - SURFACE
      ?auto_10934 - SURFACE
      ?auto_10935 - SURFACE
      ?auto_10936 - SURFACE
      ?auto_10937 - SURFACE
    )
    :vars
    (
      ?auto_10941 - HOIST
      ?auto_10938 - PLACE
      ?auto_10943 - PLACE
      ?auto_10939 - HOIST
      ?auto_10940 - SURFACE
      ?auto_10944 - PLACE
      ?auto_10953 - HOIST
      ?auto_10947 - SURFACE
      ?auto_10946 - PLACE
      ?auto_10945 - HOIST
      ?auto_10949 - SURFACE
      ?auto_10954 - PLACE
      ?auto_10951 - HOIST
      ?auto_10950 - SURFACE
      ?auto_10952 - PLACE
      ?auto_10955 - HOIST
      ?auto_10948 - SURFACE
      ?auto_10942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10941 ?auto_10938 ) ( IS-CRATE ?auto_10937 ) ( not ( = ?auto_10943 ?auto_10938 ) ) ( HOIST-AT ?auto_10939 ?auto_10943 ) ( AVAILABLE ?auto_10939 ) ( SURFACE-AT ?auto_10937 ?auto_10943 ) ( ON ?auto_10937 ?auto_10940 ) ( CLEAR ?auto_10937 ) ( not ( = ?auto_10936 ?auto_10937 ) ) ( not ( = ?auto_10936 ?auto_10940 ) ) ( not ( = ?auto_10937 ?auto_10940 ) ) ( not ( = ?auto_10941 ?auto_10939 ) ) ( IS-CRATE ?auto_10936 ) ( not ( = ?auto_10944 ?auto_10938 ) ) ( HOIST-AT ?auto_10953 ?auto_10944 ) ( AVAILABLE ?auto_10953 ) ( SURFACE-AT ?auto_10936 ?auto_10944 ) ( ON ?auto_10936 ?auto_10947 ) ( CLEAR ?auto_10936 ) ( not ( = ?auto_10935 ?auto_10936 ) ) ( not ( = ?auto_10935 ?auto_10947 ) ) ( not ( = ?auto_10936 ?auto_10947 ) ) ( not ( = ?auto_10941 ?auto_10953 ) ) ( IS-CRATE ?auto_10935 ) ( not ( = ?auto_10946 ?auto_10938 ) ) ( HOIST-AT ?auto_10945 ?auto_10946 ) ( AVAILABLE ?auto_10945 ) ( SURFACE-AT ?auto_10935 ?auto_10946 ) ( ON ?auto_10935 ?auto_10949 ) ( CLEAR ?auto_10935 ) ( not ( = ?auto_10934 ?auto_10935 ) ) ( not ( = ?auto_10934 ?auto_10949 ) ) ( not ( = ?auto_10935 ?auto_10949 ) ) ( not ( = ?auto_10941 ?auto_10945 ) ) ( IS-CRATE ?auto_10934 ) ( not ( = ?auto_10954 ?auto_10938 ) ) ( HOIST-AT ?auto_10951 ?auto_10954 ) ( AVAILABLE ?auto_10951 ) ( SURFACE-AT ?auto_10934 ?auto_10954 ) ( ON ?auto_10934 ?auto_10950 ) ( CLEAR ?auto_10934 ) ( not ( = ?auto_10933 ?auto_10934 ) ) ( not ( = ?auto_10933 ?auto_10950 ) ) ( not ( = ?auto_10934 ?auto_10950 ) ) ( not ( = ?auto_10941 ?auto_10951 ) ) ( SURFACE-AT ?auto_10932 ?auto_10938 ) ( CLEAR ?auto_10932 ) ( IS-CRATE ?auto_10933 ) ( AVAILABLE ?auto_10941 ) ( not ( = ?auto_10952 ?auto_10938 ) ) ( HOIST-AT ?auto_10955 ?auto_10952 ) ( AVAILABLE ?auto_10955 ) ( SURFACE-AT ?auto_10933 ?auto_10952 ) ( ON ?auto_10933 ?auto_10948 ) ( CLEAR ?auto_10933 ) ( TRUCK-AT ?auto_10942 ?auto_10938 ) ( not ( = ?auto_10932 ?auto_10933 ) ) ( not ( = ?auto_10932 ?auto_10948 ) ) ( not ( = ?auto_10933 ?auto_10948 ) ) ( not ( = ?auto_10941 ?auto_10955 ) ) ( not ( = ?auto_10932 ?auto_10934 ) ) ( not ( = ?auto_10932 ?auto_10950 ) ) ( not ( = ?auto_10934 ?auto_10948 ) ) ( not ( = ?auto_10954 ?auto_10952 ) ) ( not ( = ?auto_10951 ?auto_10955 ) ) ( not ( = ?auto_10950 ?auto_10948 ) ) ( not ( = ?auto_10932 ?auto_10935 ) ) ( not ( = ?auto_10932 ?auto_10949 ) ) ( not ( = ?auto_10933 ?auto_10935 ) ) ( not ( = ?auto_10933 ?auto_10949 ) ) ( not ( = ?auto_10935 ?auto_10950 ) ) ( not ( = ?auto_10935 ?auto_10948 ) ) ( not ( = ?auto_10946 ?auto_10954 ) ) ( not ( = ?auto_10946 ?auto_10952 ) ) ( not ( = ?auto_10945 ?auto_10951 ) ) ( not ( = ?auto_10945 ?auto_10955 ) ) ( not ( = ?auto_10949 ?auto_10950 ) ) ( not ( = ?auto_10949 ?auto_10948 ) ) ( not ( = ?auto_10932 ?auto_10936 ) ) ( not ( = ?auto_10932 ?auto_10947 ) ) ( not ( = ?auto_10933 ?auto_10936 ) ) ( not ( = ?auto_10933 ?auto_10947 ) ) ( not ( = ?auto_10934 ?auto_10936 ) ) ( not ( = ?auto_10934 ?auto_10947 ) ) ( not ( = ?auto_10936 ?auto_10949 ) ) ( not ( = ?auto_10936 ?auto_10950 ) ) ( not ( = ?auto_10936 ?auto_10948 ) ) ( not ( = ?auto_10944 ?auto_10946 ) ) ( not ( = ?auto_10944 ?auto_10954 ) ) ( not ( = ?auto_10944 ?auto_10952 ) ) ( not ( = ?auto_10953 ?auto_10945 ) ) ( not ( = ?auto_10953 ?auto_10951 ) ) ( not ( = ?auto_10953 ?auto_10955 ) ) ( not ( = ?auto_10947 ?auto_10949 ) ) ( not ( = ?auto_10947 ?auto_10950 ) ) ( not ( = ?auto_10947 ?auto_10948 ) ) ( not ( = ?auto_10932 ?auto_10937 ) ) ( not ( = ?auto_10932 ?auto_10940 ) ) ( not ( = ?auto_10933 ?auto_10937 ) ) ( not ( = ?auto_10933 ?auto_10940 ) ) ( not ( = ?auto_10934 ?auto_10937 ) ) ( not ( = ?auto_10934 ?auto_10940 ) ) ( not ( = ?auto_10935 ?auto_10937 ) ) ( not ( = ?auto_10935 ?auto_10940 ) ) ( not ( = ?auto_10937 ?auto_10947 ) ) ( not ( = ?auto_10937 ?auto_10949 ) ) ( not ( = ?auto_10937 ?auto_10950 ) ) ( not ( = ?auto_10937 ?auto_10948 ) ) ( not ( = ?auto_10943 ?auto_10944 ) ) ( not ( = ?auto_10943 ?auto_10946 ) ) ( not ( = ?auto_10943 ?auto_10954 ) ) ( not ( = ?auto_10943 ?auto_10952 ) ) ( not ( = ?auto_10939 ?auto_10953 ) ) ( not ( = ?auto_10939 ?auto_10945 ) ) ( not ( = ?auto_10939 ?auto_10951 ) ) ( not ( = ?auto_10939 ?auto_10955 ) ) ( not ( = ?auto_10940 ?auto_10947 ) ) ( not ( = ?auto_10940 ?auto_10949 ) ) ( not ( = ?auto_10940 ?auto_10950 ) ) ( not ( = ?auto_10940 ?auto_10948 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_10932 ?auto_10933 ?auto_10934 ?auto_10935 ?auto_10936 )
      ( MAKE-1CRATE ?auto_10936 ?auto_10937 )
      ( MAKE-5CRATE-VERIFY ?auto_10932 ?auto_10933 ?auto_10934 ?auto_10935 ?auto_10936 ?auto_10937 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10958 - SURFACE
      ?auto_10959 - SURFACE
    )
    :vars
    (
      ?auto_10960 - HOIST
      ?auto_10961 - PLACE
      ?auto_10963 - PLACE
      ?auto_10964 - HOIST
      ?auto_10965 - SURFACE
      ?auto_10962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10960 ?auto_10961 ) ( SURFACE-AT ?auto_10958 ?auto_10961 ) ( CLEAR ?auto_10958 ) ( IS-CRATE ?auto_10959 ) ( AVAILABLE ?auto_10960 ) ( not ( = ?auto_10963 ?auto_10961 ) ) ( HOIST-AT ?auto_10964 ?auto_10963 ) ( AVAILABLE ?auto_10964 ) ( SURFACE-AT ?auto_10959 ?auto_10963 ) ( ON ?auto_10959 ?auto_10965 ) ( CLEAR ?auto_10959 ) ( TRUCK-AT ?auto_10962 ?auto_10961 ) ( not ( = ?auto_10958 ?auto_10959 ) ) ( not ( = ?auto_10958 ?auto_10965 ) ) ( not ( = ?auto_10959 ?auto_10965 ) ) ( not ( = ?auto_10960 ?auto_10964 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10962 ?auto_10961 ?auto_10963 )
      ( !LIFT ?auto_10964 ?auto_10959 ?auto_10965 ?auto_10963 )
      ( !LOAD ?auto_10964 ?auto_10959 ?auto_10962 ?auto_10963 )
      ( !DRIVE ?auto_10962 ?auto_10963 ?auto_10961 )
      ( !UNLOAD ?auto_10960 ?auto_10959 ?auto_10962 ?auto_10961 )
      ( !DROP ?auto_10960 ?auto_10959 ?auto_10958 ?auto_10961 )
      ( MAKE-1CRATE-VERIFY ?auto_10958 ?auto_10959 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_10973 - SURFACE
      ?auto_10974 - SURFACE
      ?auto_10975 - SURFACE
      ?auto_10976 - SURFACE
      ?auto_10977 - SURFACE
      ?auto_10978 - SURFACE
      ?auto_10979 - SURFACE
    )
    :vars
    (
      ?auto_10984 - HOIST
      ?auto_10981 - PLACE
      ?auto_10980 - PLACE
      ?auto_10983 - HOIST
      ?auto_10985 - SURFACE
      ?auto_10996 - PLACE
      ?auto_10986 - HOIST
      ?auto_10992 - SURFACE
      ?auto_10997 - PLACE
      ?auto_10995 - HOIST
      ?auto_10990 - SURFACE
      ?auto_10993 - PLACE
      ?auto_10994 - HOIST
      ?auto_10987 - SURFACE
      ?auto_10998 - PLACE
      ?auto_10989 - HOIST
      ?auto_10988 - SURFACE
      ?auto_10999 - PLACE
      ?auto_11000 - HOIST
      ?auto_10991 - SURFACE
      ?auto_10982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10984 ?auto_10981 ) ( IS-CRATE ?auto_10979 ) ( not ( = ?auto_10980 ?auto_10981 ) ) ( HOIST-AT ?auto_10983 ?auto_10980 ) ( AVAILABLE ?auto_10983 ) ( SURFACE-AT ?auto_10979 ?auto_10980 ) ( ON ?auto_10979 ?auto_10985 ) ( CLEAR ?auto_10979 ) ( not ( = ?auto_10978 ?auto_10979 ) ) ( not ( = ?auto_10978 ?auto_10985 ) ) ( not ( = ?auto_10979 ?auto_10985 ) ) ( not ( = ?auto_10984 ?auto_10983 ) ) ( IS-CRATE ?auto_10978 ) ( not ( = ?auto_10996 ?auto_10981 ) ) ( HOIST-AT ?auto_10986 ?auto_10996 ) ( AVAILABLE ?auto_10986 ) ( SURFACE-AT ?auto_10978 ?auto_10996 ) ( ON ?auto_10978 ?auto_10992 ) ( CLEAR ?auto_10978 ) ( not ( = ?auto_10977 ?auto_10978 ) ) ( not ( = ?auto_10977 ?auto_10992 ) ) ( not ( = ?auto_10978 ?auto_10992 ) ) ( not ( = ?auto_10984 ?auto_10986 ) ) ( IS-CRATE ?auto_10977 ) ( not ( = ?auto_10997 ?auto_10981 ) ) ( HOIST-AT ?auto_10995 ?auto_10997 ) ( AVAILABLE ?auto_10995 ) ( SURFACE-AT ?auto_10977 ?auto_10997 ) ( ON ?auto_10977 ?auto_10990 ) ( CLEAR ?auto_10977 ) ( not ( = ?auto_10976 ?auto_10977 ) ) ( not ( = ?auto_10976 ?auto_10990 ) ) ( not ( = ?auto_10977 ?auto_10990 ) ) ( not ( = ?auto_10984 ?auto_10995 ) ) ( IS-CRATE ?auto_10976 ) ( not ( = ?auto_10993 ?auto_10981 ) ) ( HOIST-AT ?auto_10994 ?auto_10993 ) ( AVAILABLE ?auto_10994 ) ( SURFACE-AT ?auto_10976 ?auto_10993 ) ( ON ?auto_10976 ?auto_10987 ) ( CLEAR ?auto_10976 ) ( not ( = ?auto_10975 ?auto_10976 ) ) ( not ( = ?auto_10975 ?auto_10987 ) ) ( not ( = ?auto_10976 ?auto_10987 ) ) ( not ( = ?auto_10984 ?auto_10994 ) ) ( IS-CRATE ?auto_10975 ) ( not ( = ?auto_10998 ?auto_10981 ) ) ( HOIST-AT ?auto_10989 ?auto_10998 ) ( AVAILABLE ?auto_10989 ) ( SURFACE-AT ?auto_10975 ?auto_10998 ) ( ON ?auto_10975 ?auto_10988 ) ( CLEAR ?auto_10975 ) ( not ( = ?auto_10974 ?auto_10975 ) ) ( not ( = ?auto_10974 ?auto_10988 ) ) ( not ( = ?auto_10975 ?auto_10988 ) ) ( not ( = ?auto_10984 ?auto_10989 ) ) ( SURFACE-AT ?auto_10973 ?auto_10981 ) ( CLEAR ?auto_10973 ) ( IS-CRATE ?auto_10974 ) ( AVAILABLE ?auto_10984 ) ( not ( = ?auto_10999 ?auto_10981 ) ) ( HOIST-AT ?auto_11000 ?auto_10999 ) ( AVAILABLE ?auto_11000 ) ( SURFACE-AT ?auto_10974 ?auto_10999 ) ( ON ?auto_10974 ?auto_10991 ) ( CLEAR ?auto_10974 ) ( TRUCK-AT ?auto_10982 ?auto_10981 ) ( not ( = ?auto_10973 ?auto_10974 ) ) ( not ( = ?auto_10973 ?auto_10991 ) ) ( not ( = ?auto_10974 ?auto_10991 ) ) ( not ( = ?auto_10984 ?auto_11000 ) ) ( not ( = ?auto_10973 ?auto_10975 ) ) ( not ( = ?auto_10973 ?auto_10988 ) ) ( not ( = ?auto_10975 ?auto_10991 ) ) ( not ( = ?auto_10998 ?auto_10999 ) ) ( not ( = ?auto_10989 ?auto_11000 ) ) ( not ( = ?auto_10988 ?auto_10991 ) ) ( not ( = ?auto_10973 ?auto_10976 ) ) ( not ( = ?auto_10973 ?auto_10987 ) ) ( not ( = ?auto_10974 ?auto_10976 ) ) ( not ( = ?auto_10974 ?auto_10987 ) ) ( not ( = ?auto_10976 ?auto_10988 ) ) ( not ( = ?auto_10976 ?auto_10991 ) ) ( not ( = ?auto_10993 ?auto_10998 ) ) ( not ( = ?auto_10993 ?auto_10999 ) ) ( not ( = ?auto_10994 ?auto_10989 ) ) ( not ( = ?auto_10994 ?auto_11000 ) ) ( not ( = ?auto_10987 ?auto_10988 ) ) ( not ( = ?auto_10987 ?auto_10991 ) ) ( not ( = ?auto_10973 ?auto_10977 ) ) ( not ( = ?auto_10973 ?auto_10990 ) ) ( not ( = ?auto_10974 ?auto_10977 ) ) ( not ( = ?auto_10974 ?auto_10990 ) ) ( not ( = ?auto_10975 ?auto_10977 ) ) ( not ( = ?auto_10975 ?auto_10990 ) ) ( not ( = ?auto_10977 ?auto_10987 ) ) ( not ( = ?auto_10977 ?auto_10988 ) ) ( not ( = ?auto_10977 ?auto_10991 ) ) ( not ( = ?auto_10997 ?auto_10993 ) ) ( not ( = ?auto_10997 ?auto_10998 ) ) ( not ( = ?auto_10997 ?auto_10999 ) ) ( not ( = ?auto_10995 ?auto_10994 ) ) ( not ( = ?auto_10995 ?auto_10989 ) ) ( not ( = ?auto_10995 ?auto_11000 ) ) ( not ( = ?auto_10990 ?auto_10987 ) ) ( not ( = ?auto_10990 ?auto_10988 ) ) ( not ( = ?auto_10990 ?auto_10991 ) ) ( not ( = ?auto_10973 ?auto_10978 ) ) ( not ( = ?auto_10973 ?auto_10992 ) ) ( not ( = ?auto_10974 ?auto_10978 ) ) ( not ( = ?auto_10974 ?auto_10992 ) ) ( not ( = ?auto_10975 ?auto_10978 ) ) ( not ( = ?auto_10975 ?auto_10992 ) ) ( not ( = ?auto_10976 ?auto_10978 ) ) ( not ( = ?auto_10976 ?auto_10992 ) ) ( not ( = ?auto_10978 ?auto_10990 ) ) ( not ( = ?auto_10978 ?auto_10987 ) ) ( not ( = ?auto_10978 ?auto_10988 ) ) ( not ( = ?auto_10978 ?auto_10991 ) ) ( not ( = ?auto_10996 ?auto_10997 ) ) ( not ( = ?auto_10996 ?auto_10993 ) ) ( not ( = ?auto_10996 ?auto_10998 ) ) ( not ( = ?auto_10996 ?auto_10999 ) ) ( not ( = ?auto_10986 ?auto_10995 ) ) ( not ( = ?auto_10986 ?auto_10994 ) ) ( not ( = ?auto_10986 ?auto_10989 ) ) ( not ( = ?auto_10986 ?auto_11000 ) ) ( not ( = ?auto_10992 ?auto_10990 ) ) ( not ( = ?auto_10992 ?auto_10987 ) ) ( not ( = ?auto_10992 ?auto_10988 ) ) ( not ( = ?auto_10992 ?auto_10991 ) ) ( not ( = ?auto_10973 ?auto_10979 ) ) ( not ( = ?auto_10973 ?auto_10985 ) ) ( not ( = ?auto_10974 ?auto_10979 ) ) ( not ( = ?auto_10974 ?auto_10985 ) ) ( not ( = ?auto_10975 ?auto_10979 ) ) ( not ( = ?auto_10975 ?auto_10985 ) ) ( not ( = ?auto_10976 ?auto_10979 ) ) ( not ( = ?auto_10976 ?auto_10985 ) ) ( not ( = ?auto_10977 ?auto_10979 ) ) ( not ( = ?auto_10977 ?auto_10985 ) ) ( not ( = ?auto_10979 ?auto_10992 ) ) ( not ( = ?auto_10979 ?auto_10990 ) ) ( not ( = ?auto_10979 ?auto_10987 ) ) ( not ( = ?auto_10979 ?auto_10988 ) ) ( not ( = ?auto_10979 ?auto_10991 ) ) ( not ( = ?auto_10980 ?auto_10996 ) ) ( not ( = ?auto_10980 ?auto_10997 ) ) ( not ( = ?auto_10980 ?auto_10993 ) ) ( not ( = ?auto_10980 ?auto_10998 ) ) ( not ( = ?auto_10980 ?auto_10999 ) ) ( not ( = ?auto_10983 ?auto_10986 ) ) ( not ( = ?auto_10983 ?auto_10995 ) ) ( not ( = ?auto_10983 ?auto_10994 ) ) ( not ( = ?auto_10983 ?auto_10989 ) ) ( not ( = ?auto_10983 ?auto_11000 ) ) ( not ( = ?auto_10985 ?auto_10992 ) ) ( not ( = ?auto_10985 ?auto_10990 ) ) ( not ( = ?auto_10985 ?auto_10987 ) ) ( not ( = ?auto_10985 ?auto_10988 ) ) ( not ( = ?auto_10985 ?auto_10991 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_10973 ?auto_10974 ?auto_10975 ?auto_10976 ?auto_10977 ?auto_10978 )
      ( MAKE-1CRATE ?auto_10978 ?auto_10979 )
      ( MAKE-6CRATE-VERIFY ?auto_10973 ?auto_10974 ?auto_10975 ?auto_10976 ?auto_10977 ?auto_10978 ?auto_10979 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11003 - SURFACE
      ?auto_11004 - SURFACE
    )
    :vars
    (
      ?auto_11005 - HOIST
      ?auto_11006 - PLACE
      ?auto_11008 - PLACE
      ?auto_11009 - HOIST
      ?auto_11010 - SURFACE
      ?auto_11007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11005 ?auto_11006 ) ( SURFACE-AT ?auto_11003 ?auto_11006 ) ( CLEAR ?auto_11003 ) ( IS-CRATE ?auto_11004 ) ( AVAILABLE ?auto_11005 ) ( not ( = ?auto_11008 ?auto_11006 ) ) ( HOIST-AT ?auto_11009 ?auto_11008 ) ( AVAILABLE ?auto_11009 ) ( SURFACE-AT ?auto_11004 ?auto_11008 ) ( ON ?auto_11004 ?auto_11010 ) ( CLEAR ?auto_11004 ) ( TRUCK-AT ?auto_11007 ?auto_11006 ) ( not ( = ?auto_11003 ?auto_11004 ) ) ( not ( = ?auto_11003 ?auto_11010 ) ) ( not ( = ?auto_11004 ?auto_11010 ) ) ( not ( = ?auto_11005 ?auto_11009 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11007 ?auto_11006 ?auto_11008 )
      ( !LIFT ?auto_11009 ?auto_11004 ?auto_11010 ?auto_11008 )
      ( !LOAD ?auto_11009 ?auto_11004 ?auto_11007 ?auto_11008 )
      ( !DRIVE ?auto_11007 ?auto_11008 ?auto_11006 )
      ( !UNLOAD ?auto_11005 ?auto_11004 ?auto_11007 ?auto_11006 )
      ( !DROP ?auto_11005 ?auto_11004 ?auto_11003 ?auto_11006 )
      ( MAKE-1CRATE-VERIFY ?auto_11003 ?auto_11004 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_11019 - SURFACE
      ?auto_11020 - SURFACE
      ?auto_11021 - SURFACE
      ?auto_11022 - SURFACE
      ?auto_11023 - SURFACE
      ?auto_11024 - SURFACE
      ?auto_11026 - SURFACE
      ?auto_11025 - SURFACE
    )
    :vars
    (
      ?auto_11029 - HOIST
      ?auto_11028 - PLACE
      ?auto_11027 - PLACE
      ?auto_11030 - HOIST
      ?auto_11031 - SURFACE
      ?auto_11041 - PLACE
      ?auto_11048 - HOIST
      ?auto_11044 - SURFACE
      ?auto_11046 - PLACE
      ?auto_11043 - HOIST
      ?auto_11038 - SURFACE
      ?auto_11034 - PLACE
      ?auto_11033 - HOIST
      ?auto_11040 - SURFACE
      ?auto_11037 - PLACE
      ?auto_11045 - HOIST
      ?auto_11042 - SURFACE
      ?auto_11035 - PLACE
      ?auto_11047 - HOIST
      ?auto_11049 - SURFACE
      ?auto_11036 - PLACE
      ?auto_11050 - HOIST
      ?auto_11039 - SURFACE
      ?auto_11032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11029 ?auto_11028 ) ( IS-CRATE ?auto_11025 ) ( not ( = ?auto_11027 ?auto_11028 ) ) ( HOIST-AT ?auto_11030 ?auto_11027 ) ( AVAILABLE ?auto_11030 ) ( SURFACE-AT ?auto_11025 ?auto_11027 ) ( ON ?auto_11025 ?auto_11031 ) ( CLEAR ?auto_11025 ) ( not ( = ?auto_11026 ?auto_11025 ) ) ( not ( = ?auto_11026 ?auto_11031 ) ) ( not ( = ?auto_11025 ?auto_11031 ) ) ( not ( = ?auto_11029 ?auto_11030 ) ) ( IS-CRATE ?auto_11026 ) ( not ( = ?auto_11041 ?auto_11028 ) ) ( HOIST-AT ?auto_11048 ?auto_11041 ) ( AVAILABLE ?auto_11048 ) ( SURFACE-AT ?auto_11026 ?auto_11041 ) ( ON ?auto_11026 ?auto_11044 ) ( CLEAR ?auto_11026 ) ( not ( = ?auto_11024 ?auto_11026 ) ) ( not ( = ?auto_11024 ?auto_11044 ) ) ( not ( = ?auto_11026 ?auto_11044 ) ) ( not ( = ?auto_11029 ?auto_11048 ) ) ( IS-CRATE ?auto_11024 ) ( not ( = ?auto_11046 ?auto_11028 ) ) ( HOIST-AT ?auto_11043 ?auto_11046 ) ( AVAILABLE ?auto_11043 ) ( SURFACE-AT ?auto_11024 ?auto_11046 ) ( ON ?auto_11024 ?auto_11038 ) ( CLEAR ?auto_11024 ) ( not ( = ?auto_11023 ?auto_11024 ) ) ( not ( = ?auto_11023 ?auto_11038 ) ) ( not ( = ?auto_11024 ?auto_11038 ) ) ( not ( = ?auto_11029 ?auto_11043 ) ) ( IS-CRATE ?auto_11023 ) ( not ( = ?auto_11034 ?auto_11028 ) ) ( HOIST-AT ?auto_11033 ?auto_11034 ) ( AVAILABLE ?auto_11033 ) ( SURFACE-AT ?auto_11023 ?auto_11034 ) ( ON ?auto_11023 ?auto_11040 ) ( CLEAR ?auto_11023 ) ( not ( = ?auto_11022 ?auto_11023 ) ) ( not ( = ?auto_11022 ?auto_11040 ) ) ( not ( = ?auto_11023 ?auto_11040 ) ) ( not ( = ?auto_11029 ?auto_11033 ) ) ( IS-CRATE ?auto_11022 ) ( not ( = ?auto_11037 ?auto_11028 ) ) ( HOIST-AT ?auto_11045 ?auto_11037 ) ( AVAILABLE ?auto_11045 ) ( SURFACE-AT ?auto_11022 ?auto_11037 ) ( ON ?auto_11022 ?auto_11042 ) ( CLEAR ?auto_11022 ) ( not ( = ?auto_11021 ?auto_11022 ) ) ( not ( = ?auto_11021 ?auto_11042 ) ) ( not ( = ?auto_11022 ?auto_11042 ) ) ( not ( = ?auto_11029 ?auto_11045 ) ) ( IS-CRATE ?auto_11021 ) ( not ( = ?auto_11035 ?auto_11028 ) ) ( HOIST-AT ?auto_11047 ?auto_11035 ) ( AVAILABLE ?auto_11047 ) ( SURFACE-AT ?auto_11021 ?auto_11035 ) ( ON ?auto_11021 ?auto_11049 ) ( CLEAR ?auto_11021 ) ( not ( = ?auto_11020 ?auto_11021 ) ) ( not ( = ?auto_11020 ?auto_11049 ) ) ( not ( = ?auto_11021 ?auto_11049 ) ) ( not ( = ?auto_11029 ?auto_11047 ) ) ( SURFACE-AT ?auto_11019 ?auto_11028 ) ( CLEAR ?auto_11019 ) ( IS-CRATE ?auto_11020 ) ( AVAILABLE ?auto_11029 ) ( not ( = ?auto_11036 ?auto_11028 ) ) ( HOIST-AT ?auto_11050 ?auto_11036 ) ( AVAILABLE ?auto_11050 ) ( SURFACE-AT ?auto_11020 ?auto_11036 ) ( ON ?auto_11020 ?auto_11039 ) ( CLEAR ?auto_11020 ) ( TRUCK-AT ?auto_11032 ?auto_11028 ) ( not ( = ?auto_11019 ?auto_11020 ) ) ( not ( = ?auto_11019 ?auto_11039 ) ) ( not ( = ?auto_11020 ?auto_11039 ) ) ( not ( = ?auto_11029 ?auto_11050 ) ) ( not ( = ?auto_11019 ?auto_11021 ) ) ( not ( = ?auto_11019 ?auto_11049 ) ) ( not ( = ?auto_11021 ?auto_11039 ) ) ( not ( = ?auto_11035 ?auto_11036 ) ) ( not ( = ?auto_11047 ?auto_11050 ) ) ( not ( = ?auto_11049 ?auto_11039 ) ) ( not ( = ?auto_11019 ?auto_11022 ) ) ( not ( = ?auto_11019 ?auto_11042 ) ) ( not ( = ?auto_11020 ?auto_11022 ) ) ( not ( = ?auto_11020 ?auto_11042 ) ) ( not ( = ?auto_11022 ?auto_11049 ) ) ( not ( = ?auto_11022 ?auto_11039 ) ) ( not ( = ?auto_11037 ?auto_11035 ) ) ( not ( = ?auto_11037 ?auto_11036 ) ) ( not ( = ?auto_11045 ?auto_11047 ) ) ( not ( = ?auto_11045 ?auto_11050 ) ) ( not ( = ?auto_11042 ?auto_11049 ) ) ( not ( = ?auto_11042 ?auto_11039 ) ) ( not ( = ?auto_11019 ?auto_11023 ) ) ( not ( = ?auto_11019 ?auto_11040 ) ) ( not ( = ?auto_11020 ?auto_11023 ) ) ( not ( = ?auto_11020 ?auto_11040 ) ) ( not ( = ?auto_11021 ?auto_11023 ) ) ( not ( = ?auto_11021 ?auto_11040 ) ) ( not ( = ?auto_11023 ?auto_11042 ) ) ( not ( = ?auto_11023 ?auto_11049 ) ) ( not ( = ?auto_11023 ?auto_11039 ) ) ( not ( = ?auto_11034 ?auto_11037 ) ) ( not ( = ?auto_11034 ?auto_11035 ) ) ( not ( = ?auto_11034 ?auto_11036 ) ) ( not ( = ?auto_11033 ?auto_11045 ) ) ( not ( = ?auto_11033 ?auto_11047 ) ) ( not ( = ?auto_11033 ?auto_11050 ) ) ( not ( = ?auto_11040 ?auto_11042 ) ) ( not ( = ?auto_11040 ?auto_11049 ) ) ( not ( = ?auto_11040 ?auto_11039 ) ) ( not ( = ?auto_11019 ?auto_11024 ) ) ( not ( = ?auto_11019 ?auto_11038 ) ) ( not ( = ?auto_11020 ?auto_11024 ) ) ( not ( = ?auto_11020 ?auto_11038 ) ) ( not ( = ?auto_11021 ?auto_11024 ) ) ( not ( = ?auto_11021 ?auto_11038 ) ) ( not ( = ?auto_11022 ?auto_11024 ) ) ( not ( = ?auto_11022 ?auto_11038 ) ) ( not ( = ?auto_11024 ?auto_11040 ) ) ( not ( = ?auto_11024 ?auto_11042 ) ) ( not ( = ?auto_11024 ?auto_11049 ) ) ( not ( = ?auto_11024 ?auto_11039 ) ) ( not ( = ?auto_11046 ?auto_11034 ) ) ( not ( = ?auto_11046 ?auto_11037 ) ) ( not ( = ?auto_11046 ?auto_11035 ) ) ( not ( = ?auto_11046 ?auto_11036 ) ) ( not ( = ?auto_11043 ?auto_11033 ) ) ( not ( = ?auto_11043 ?auto_11045 ) ) ( not ( = ?auto_11043 ?auto_11047 ) ) ( not ( = ?auto_11043 ?auto_11050 ) ) ( not ( = ?auto_11038 ?auto_11040 ) ) ( not ( = ?auto_11038 ?auto_11042 ) ) ( not ( = ?auto_11038 ?auto_11049 ) ) ( not ( = ?auto_11038 ?auto_11039 ) ) ( not ( = ?auto_11019 ?auto_11026 ) ) ( not ( = ?auto_11019 ?auto_11044 ) ) ( not ( = ?auto_11020 ?auto_11026 ) ) ( not ( = ?auto_11020 ?auto_11044 ) ) ( not ( = ?auto_11021 ?auto_11026 ) ) ( not ( = ?auto_11021 ?auto_11044 ) ) ( not ( = ?auto_11022 ?auto_11026 ) ) ( not ( = ?auto_11022 ?auto_11044 ) ) ( not ( = ?auto_11023 ?auto_11026 ) ) ( not ( = ?auto_11023 ?auto_11044 ) ) ( not ( = ?auto_11026 ?auto_11038 ) ) ( not ( = ?auto_11026 ?auto_11040 ) ) ( not ( = ?auto_11026 ?auto_11042 ) ) ( not ( = ?auto_11026 ?auto_11049 ) ) ( not ( = ?auto_11026 ?auto_11039 ) ) ( not ( = ?auto_11041 ?auto_11046 ) ) ( not ( = ?auto_11041 ?auto_11034 ) ) ( not ( = ?auto_11041 ?auto_11037 ) ) ( not ( = ?auto_11041 ?auto_11035 ) ) ( not ( = ?auto_11041 ?auto_11036 ) ) ( not ( = ?auto_11048 ?auto_11043 ) ) ( not ( = ?auto_11048 ?auto_11033 ) ) ( not ( = ?auto_11048 ?auto_11045 ) ) ( not ( = ?auto_11048 ?auto_11047 ) ) ( not ( = ?auto_11048 ?auto_11050 ) ) ( not ( = ?auto_11044 ?auto_11038 ) ) ( not ( = ?auto_11044 ?auto_11040 ) ) ( not ( = ?auto_11044 ?auto_11042 ) ) ( not ( = ?auto_11044 ?auto_11049 ) ) ( not ( = ?auto_11044 ?auto_11039 ) ) ( not ( = ?auto_11019 ?auto_11025 ) ) ( not ( = ?auto_11019 ?auto_11031 ) ) ( not ( = ?auto_11020 ?auto_11025 ) ) ( not ( = ?auto_11020 ?auto_11031 ) ) ( not ( = ?auto_11021 ?auto_11025 ) ) ( not ( = ?auto_11021 ?auto_11031 ) ) ( not ( = ?auto_11022 ?auto_11025 ) ) ( not ( = ?auto_11022 ?auto_11031 ) ) ( not ( = ?auto_11023 ?auto_11025 ) ) ( not ( = ?auto_11023 ?auto_11031 ) ) ( not ( = ?auto_11024 ?auto_11025 ) ) ( not ( = ?auto_11024 ?auto_11031 ) ) ( not ( = ?auto_11025 ?auto_11044 ) ) ( not ( = ?auto_11025 ?auto_11038 ) ) ( not ( = ?auto_11025 ?auto_11040 ) ) ( not ( = ?auto_11025 ?auto_11042 ) ) ( not ( = ?auto_11025 ?auto_11049 ) ) ( not ( = ?auto_11025 ?auto_11039 ) ) ( not ( = ?auto_11027 ?auto_11041 ) ) ( not ( = ?auto_11027 ?auto_11046 ) ) ( not ( = ?auto_11027 ?auto_11034 ) ) ( not ( = ?auto_11027 ?auto_11037 ) ) ( not ( = ?auto_11027 ?auto_11035 ) ) ( not ( = ?auto_11027 ?auto_11036 ) ) ( not ( = ?auto_11030 ?auto_11048 ) ) ( not ( = ?auto_11030 ?auto_11043 ) ) ( not ( = ?auto_11030 ?auto_11033 ) ) ( not ( = ?auto_11030 ?auto_11045 ) ) ( not ( = ?auto_11030 ?auto_11047 ) ) ( not ( = ?auto_11030 ?auto_11050 ) ) ( not ( = ?auto_11031 ?auto_11044 ) ) ( not ( = ?auto_11031 ?auto_11038 ) ) ( not ( = ?auto_11031 ?auto_11040 ) ) ( not ( = ?auto_11031 ?auto_11042 ) ) ( not ( = ?auto_11031 ?auto_11049 ) ) ( not ( = ?auto_11031 ?auto_11039 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_11019 ?auto_11020 ?auto_11021 ?auto_11022 ?auto_11023 ?auto_11024 ?auto_11026 )
      ( MAKE-1CRATE ?auto_11026 ?auto_11025 )
      ( MAKE-7CRATE-VERIFY ?auto_11019 ?auto_11020 ?auto_11021 ?auto_11022 ?auto_11023 ?auto_11024 ?auto_11026 ?auto_11025 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11053 - SURFACE
      ?auto_11054 - SURFACE
    )
    :vars
    (
      ?auto_11055 - HOIST
      ?auto_11056 - PLACE
      ?auto_11058 - PLACE
      ?auto_11059 - HOIST
      ?auto_11060 - SURFACE
      ?auto_11057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11055 ?auto_11056 ) ( SURFACE-AT ?auto_11053 ?auto_11056 ) ( CLEAR ?auto_11053 ) ( IS-CRATE ?auto_11054 ) ( AVAILABLE ?auto_11055 ) ( not ( = ?auto_11058 ?auto_11056 ) ) ( HOIST-AT ?auto_11059 ?auto_11058 ) ( AVAILABLE ?auto_11059 ) ( SURFACE-AT ?auto_11054 ?auto_11058 ) ( ON ?auto_11054 ?auto_11060 ) ( CLEAR ?auto_11054 ) ( TRUCK-AT ?auto_11057 ?auto_11056 ) ( not ( = ?auto_11053 ?auto_11054 ) ) ( not ( = ?auto_11053 ?auto_11060 ) ) ( not ( = ?auto_11054 ?auto_11060 ) ) ( not ( = ?auto_11055 ?auto_11059 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11057 ?auto_11056 ?auto_11058 )
      ( !LIFT ?auto_11059 ?auto_11054 ?auto_11060 ?auto_11058 )
      ( !LOAD ?auto_11059 ?auto_11054 ?auto_11057 ?auto_11058 )
      ( !DRIVE ?auto_11057 ?auto_11058 ?auto_11056 )
      ( !UNLOAD ?auto_11055 ?auto_11054 ?auto_11057 ?auto_11056 )
      ( !DROP ?auto_11055 ?auto_11054 ?auto_11053 ?auto_11056 )
      ( MAKE-1CRATE-VERIFY ?auto_11053 ?auto_11054 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_11070 - SURFACE
      ?auto_11071 - SURFACE
      ?auto_11072 - SURFACE
      ?auto_11073 - SURFACE
      ?auto_11074 - SURFACE
      ?auto_11075 - SURFACE
      ?auto_11078 - SURFACE
      ?auto_11077 - SURFACE
      ?auto_11076 - SURFACE
    )
    :vars
    (
      ?auto_11082 - HOIST
      ?auto_11081 - PLACE
      ?auto_11079 - PLACE
      ?auto_11084 - HOIST
      ?auto_11083 - SURFACE
      ?auto_11101 - PLACE
      ?auto_11100 - HOIST
      ?auto_11102 - SURFACE
      ?auto_11090 - PLACE
      ?auto_11089 - HOIST
      ?auto_11093 - SURFACE
      ?auto_11095 - PLACE
      ?auto_11091 - HOIST
      ?auto_11098 - SURFACE
      ?auto_11104 - PLACE
      ?auto_11088 - HOIST
      ?auto_11096 - SURFACE
      ?auto_11099 - PLACE
      ?auto_11094 - HOIST
      ?auto_11092 - SURFACE
      ?auto_11103 - PLACE
      ?auto_11086 - HOIST
      ?auto_11105 - SURFACE
      ?auto_11085 - PLACE
      ?auto_11087 - HOIST
      ?auto_11097 - SURFACE
      ?auto_11080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11082 ?auto_11081 ) ( IS-CRATE ?auto_11076 ) ( not ( = ?auto_11079 ?auto_11081 ) ) ( HOIST-AT ?auto_11084 ?auto_11079 ) ( AVAILABLE ?auto_11084 ) ( SURFACE-AT ?auto_11076 ?auto_11079 ) ( ON ?auto_11076 ?auto_11083 ) ( CLEAR ?auto_11076 ) ( not ( = ?auto_11077 ?auto_11076 ) ) ( not ( = ?auto_11077 ?auto_11083 ) ) ( not ( = ?auto_11076 ?auto_11083 ) ) ( not ( = ?auto_11082 ?auto_11084 ) ) ( IS-CRATE ?auto_11077 ) ( not ( = ?auto_11101 ?auto_11081 ) ) ( HOIST-AT ?auto_11100 ?auto_11101 ) ( AVAILABLE ?auto_11100 ) ( SURFACE-AT ?auto_11077 ?auto_11101 ) ( ON ?auto_11077 ?auto_11102 ) ( CLEAR ?auto_11077 ) ( not ( = ?auto_11078 ?auto_11077 ) ) ( not ( = ?auto_11078 ?auto_11102 ) ) ( not ( = ?auto_11077 ?auto_11102 ) ) ( not ( = ?auto_11082 ?auto_11100 ) ) ( IS-CRATE ?auto_11078 ) ( not ( = ?auto_11090 ?auto_11081 ) ) ( HOIST-AT ?auto_11089 ?auto_11090 ) ( AVAILABLE ?auto_11089 ) ( SURFACE-AT ?auto_11078 ?auto_11090 ) ( ON ?auto_11078 ?auto_11093 ) ( CLEAR ?auto_11078 ) ( not ( = ?auto_11075 ?auto_11078 ) ) ( not ( = ?auto_11075 ?auto_11093 ) ) ( not ( = ?auto_11078 ?auto_11093 ) ) ( not ( = ?auto_11082 ?auto_11089 ) ) ( IS-CRATE ?auto_11075 ) ( not ( = ?auto_11095 ?auto_11081 ) ) ( HOIST-AT ?auto_11091 ?auto_11095 ) ( AVAILABLE ?auto_11091 ) ( SURFACE-AT ?auto_11075 ?auto_11095 ) ( ON ?auto_11075 ?auto_11098 ) ( CLEAR ?auto_11075 ) ( not ( = ?auto_11074 ?auto_11075 ) ) ( not ( = ?auto_11074 ?auto_11098 ) ) ( not ( = ?auto_11075 ?auto_11098 ) ) ( not ( = ?auto_11082 ?auto_11091 ) ) ( IS-CRATE ?auto_11074 ) ( not ( = ?auto_11104 ?auto_11081 ) ) ( HOIST-AT ?auto_11088 ?auto_11104 ) ( AVAILABLE ?auto_11088 ) ( SURFACE-AT ?auto_11074 ?auto_11104 ) ( ON ?auto_11074 ?auto_11096 ) ( CLEAR ?auto_11074 ) ( not ( = ?auto_11073 ?auto_11074 ) ) ( not ( = ?auto_11073 ?auto_11096 ) ) ( not ( = ?auto_11074 ?auto_11096 ) ) ( not ( = ?auto_11082 ?auto_11088 ) ) ( IS-CRATE ?auto_11073 ) ( not ( = ?auto_11099 ?auto_11081 ) ) ( HOIST-AT ?auto_11094 ?auto_11099 ) ( AVAILABLE ?auto_11094 ) ( SURFACE-AT ?auto_11073 ?auto_11099 ) ( ON ?auto_11073 ?auto_11092 ) ( CLEAR ?auto_11073 ) ( not ( = ?auto_11072 ?auto_11073 ) ) ( not ( = ?auto_11072 ?auto_11092 ) ) ( not ( = ?auto_11073 ?auto_11092 ) ) ( not ( = ?auto_11082 ?auto_11094 ) ) ( IS-CRATE ?auto_11072 ) ( not ( = ?auto_11103 ?auto_11081 ) ) ( HOIST-AT ?auto_11086 ?auto_11103 ) ( AVAILABLE ?auto_11086 ) ( SURFACE-AT ?auto_11072 ?auto_11103 ) ( ON ?auto_11072 ?auto_11105 ) ( CLEAR ?auto_11072 ) ( not ( = ?auto_11071 ?auto_11072 ) ) ( not ( = ?auto_11071 ?auto_11105 ) ) ( not ( = ?auto_11072 ?auto_11105 ) ) ( not ( = ?auto_11082 ?auto_11086 ) ) ( SURFACE-AT ?auto_11070 ?auto_11081 ) ( CLEAR ?auto_11070 ) ( IS-CRATE ?auto_11071 ) ( AVAILABLE ?auto_11082 ) ( not ( = ?auto_11085 ?auto_11081 ) ) ( HOIST-AT ?auto_11087 ?auto_11085 ) ( AVAILABLE ?auto_11087 ) ( SURFACE-AT ?auto_11071 ?auto_11085 ) ( ON ?auto_11071 ?auto_11097 ) ( CLEAR ?auto_11071 ) ( TRUCK-AT ?auto_11080 ?auto_11081 ) ( not ( = ?auto_11070 ?auto_11071 ) ) ( not ( = ?auto_11070 ?auto_11097 ) ) ( not ( = ?auto_11071 ?auto_11097 ) ) ( not ( = ?auto_11082 ?auto_11087 ) ) ( not ( = ?auto_11070 ?auto_11072 ) ) ( not ( = ?auto_11070 ?auto_11105 ) ) ( not ( = ?auto_11072 ?auto_11097 ) ) ( not ( = ?auto_11103 ?auto_11085 ) ) ( not ( = ?auto_11086 ?auto_11087 ) ) ( not ( = ?auto_11105 ?auto_11097 ) ) ( not ( = ?auto_11070 ?auto_11073 ) ) ( not ( = ?auto_11070 ?auto_11092 ) ) ( not ( = ?auto_11071 ?auto_11073 ) ) ( not ( = ?auto_11071 ?auto_11092 ) ) ( not ( = ?auto_11073 ?auto_11105 ) ) ( not ( = ?auto_11073 ?auto_11097 ) ) ( not ( = ?auto_11099 ?auto_11103 ) ) ( not ( = ?auto_11099 ?auto_11085 ) ) ( not ( = ?auto_11094 ?auto_11086 ) ) ( not ( = ?auto_11094 ?auto_11087 ) ) ( not ( = ?auto_11092 ?auto_11105 ) ) ( not ( = ?auto_11092 ?auto_11097 ) ) ( not ( = ?auto_11070 ?auto_11074 ) ) ( not ( = ?auto_11070 ?auto_11096 ) ) ( not ( = ?auto_11071 ?auto_11074 ) ) ( not ( = ?auto_11071 ?auto_11096 ) ) ( not ( = ?auto_11072 ?auto_11074 ) ) ( not ( = ?auto_11072 ?auto_11096 ) ) ( not ( = ?auto_11074 ?auto_11092 ) ) ( not ( = ?auto_11074 ?auto_11105 ) ) ( not ( = ?auto_11074 ?auto_11097 ) ) ( not ( = ?auto_11104 ?auto_11099 ) ) ( not ( = ?auto_11104 ?auto_11103 ) ) ( not ( = ?auto_11104 ?auto_11085 ) ) ( not ( = ?auto_11088 ?auto_11094 ) ) ( not ( = ?auto_11088 ?auto_11086 ) ) ( not ( = ?auto_11088 ?auto_11087 ) ) ( not ( = ?auto_11096 ?auto_11092 ) ) ( not ( = ?auto_11096 ?auto_11105 ) ) ( not ( = ?auto_11096 ?auto_11097 ) ) ( not ( = ?auto_11070 ?auto_11075 ) ) ( not ( = ?auto_11070 ?auto_11098 ) ) ( not ( = ?auto_11071 ?auto_11075 ) ) ( not ( = ?auto_11071 ?auto_11098 ) ) ( not ( = ?auto_11072 ?auto_11075 ) ) ( not ( = ?auto_11072 ?auto_11098 ) ) ( not ( = ?auto_11073 ?auto_11075 ) ) ( not ( = ?auto_11073 ?auto_11098 ) ) ( not ( = ?auto_11075 ?auto_11096 ) ) ( not ( = ?auto_11075 ?auto_11092 ) ) ( not ( = ?auto_11075 ?auto_11105 ) ) ( not ( = ?auto_11075 ?auto_11097 ) ) ( not ( = ?auto_11095 ?auto_11104 ) ) ( not ( = ?auto_11095 ?auto_11099 ) ) ( not ( = ?auto_11095 ?auto_11103 ) ) ( not ( = ?auto_11095 ?auto_11085 ) ) ( not ( = ?auto_11091 ?auto_11088 ) ) ( not ( = ?auto_11091 ?auto_11094 ) ) ( not ( = ?auto_11091 ?auto_11086 ) ) ( not ( = ?auto_11091 ?auto_11087 ) ) ( not ( = ?auto_11098 ?auto_11096 ) ) ( not ( = ?auto_11098 ?auto_11092 ) ) ( not ( = ?auto_11098 ?auto_11105 ) ) ( not ( = ?auto_11098 ?auto_11097 ) ) ( not ( = ?auto_11070 ?auto_11078 ) ) ( not ( = ?auto_11070 ?auto_11093 ) ) ( not ( = ?auto_11071 ?auto_11078 ) ) ( not ( = ?auto_11071 ?auto_11093 ) ) ( not ( = ?auto_11072 ?auto_11078 ) ) ( not ( = ?auto_11072 ?auto_11093 ) ) ( not ( = ?auto_11073 ?auto_11078 ) ) ( not ( = ?auto_11073 ?auto_11093 ) ) ( not ( = ?auto_11074 ?auto_11078 ) ) ( not ( = ?auto_11074 ?auto_11093 ) ) ( not ( = ?auto_11078 ?auto_11098 ) ) ( not ( = ?auto_11078 ?auto_11096 ) ) ( not ( = ?auto_11078 ?auto_11092 ) ) ( not ( = ?auto_11078 ?auto_11105 ) ) ( not ( = ?auto_11078 ?auto_11097 ) ) ( not ( = ?auto_11090 ?auto_11095 ) ) ( not ( = ?auto_11090 ?auto_11104 ) ) ( not ( = ?auto_11090 ?auto_11099 ) ) ( not ( = ?auto_11090 ?auto_11103 ) ) ( not ( = ?auto_11090 ?auto_11085 ) ) ( not ( = ?auto_11089 ?auto_11091 ) ) ( not ( = ?auto_11089 ?auto_11088 ) ) ( not ( = ?auto_11089 ?auto_11094 ) ) ( not ( = ?auto_11089 ?auto_11086 ) ) ( not ( = ?auto_11089 ?auto_11087 ) ) ( not ( = ?auto_11093 ?auto_11098 ) ) ( not ( = ?auto_11093 ?auto_11096 ) ) ( not ( = ?auto_11093 ?auto_11092 ) ) ( not ( = ?auto_11093 ?auto_11105 ) ) ( not ( = ?auto_11093 ?auto_11097 ) ) ( not ( = ?auto_11070 ?auto_11077 ) ) ( not ( = ?auto_11070 ?auto_11102 ) ) ( not ( = ?auto_11071 ?auto_11077 ) ) ( not ( = ?auto_11071 ?auto_11102 ) ) ( not ( = ?auto_11072 ?auto_11077 ) ) ( not ( = ?auto_11072 ?auto_11102 ) ) ( not ( = ?auto_11073 ?auto_11077 ) ) ( not ( = ?auto_11073 ?auto_11102 ) ) ( not ( = ?auto_11074 ?auto_11077 ) ) ( not ( = ?auto_11074 ?auto_11102 ) ) ( not ( = ?auto_11075 ?auto_11077 ) ) ( not ( = ?auto_11075 ?auto_11102 ) ) ( not ( = ?auto_11077 ?auto_11093 ) ) ( not ( = ?auto_11077 ?auto_11098 ) ) ( not ( = ?auto_11077 ?auto_11096 ) ) ( not ( = ?auto_11077 ?auto_11092 ) ) ( not ( = ?auto_11077 ?auto_11105 ) ) ( not ( = ?auto_11077 ?auto_11097 ) ) ( not ( = ?auto_11101 ?auto_11090 ) ) ( not ( = ?auto_11101 ?auto_11095 ) ) ( not ( = ?auto_11101 ?auto_11104 ) ) ( not ( = ?auto_11101 ?auto_11099 ) ) ( not ( = ?auto_11101 ?auto_11103 ) ) ( not ( = ?auto_11101 ?auto_11085 ) ) ( not ( = ?auto_11100 ?auto_11089 ) ) ( not ( = ?auto_11100 ?auto_11091 ) ) ( not ( = ?auto_11100 ?auto_11088 ) ) ( not ( = ?auto_11100 ?auto_11094 ) ) ( not ( = ?auto_11100 ?auto_11086 ) ) ( not ( = ?auto_11100 ?auto_11087 ) ) ( not ( = ?auto_11102 ?auto_11093 ) ) ( not ( = ?auto_11102 ?auto_11098 ) ) ( not ( = ?auto_11102 ?auto_11096 ) ) ( not ( = ?auto_11102 ?auto_11092 ) ) ( not ( = ?auto_11102 ?auto_11105 ) ) ( not ( = ?auto_11102 ?auto_11097 ) ) ( not ( = ?auto_11070 ?auto_11076 ) ) ( not ( = ?auto_11070 ?auto_11083 ) ) ( not ( = ?auto_11071 ?auto_11076 ) ) ( not ( = ?auto_11071 ?auto_11083 ) ) ( not ( = ?auto_11072 ?auto_11076 ) ) ( not ( = ?auto_11072 ?auto_11083 ) ) ( not ( = ?auto_11073 ?auto_11076 ) ) ( not ( = ?auto_11073 ?auto_11083 ) ) ( not ( = ?auto_11074 ?auto_11076 ) ) ( not ( = ?auto_11074 ?auto_11083 ) ) ( not ( = ?auto_11075 ?auto_11076 ) ) ( not ( = ?auto_11075 ?auto_11083 ) ) ( not ( = ?auto_11078 ?auto_11076 ) ) ( not ( = ?auto_11078 ?auto_11083 ) ) ( not ( = ?auto_11076 ?auto_11102 ) ) ( not ( = ?auto_11076 ?auto_11093 ) ) ( not ( = ?auto_11076 ?auto_11098 ) ) ( not ( = ?auto_11076 ?auto_11096 ) ) ( not ( = ?auto_11076 ?auto_11092 ) ) ( not ( = ?auto_11076 ?auto_11105 ) ) ( not ( = ?auto_11076 ?auto_11097 ) ) ( not ( = ?auto_11079 ?auto_11101 ) ) ( not ( = ?auto_11079 ?auto_11090 ) ) ( not ( = ?auto_11079 ?auto_11095 ) ) ( not ( = ?auto_11079 ?auto_11104 ) ) ( not ( = ?auto_11079 ?auto_11099 ) ) ( not ( = ?auto_11079 ?auto_11103 ) ) ( not ( = ?auto_11079 ?auto_11085 ) ) ( not ( = ?auto_11084 ?auto_11100 ) ) ( not ( = ?auto_11084 ?auto_11089 ) ) ( not ( = ?auto_11084 ?auto_11091 ) ) ( not ( = ?auto_11084 ?auto_11088 ) ) ( not ( = ?auto_11084 ?auto_11094 ) ) ( not ( = ?auto_11084 ?auto_11086 ) ) ( not ( = ?auto_11084 ?auto_11087 ) ) ( not ( = ?auto_11083 ?auto_11102 ) ) ( not ( = ?auto_11083 ?auto_11093 ) ) ( not ( = ?auto_11083 ?auto_11098 ) ) ( not ( = ?auto_11083 ?auto_11096 ) ) ( not ( = ?auto_11083 ?auto_11092 ) ) ( not ( = ?auto_11083 ?auto_11105 ) ) ( not ( = ?auto_11083 ?auto_11097 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_11070 ?auto_11071 ?auto_11072 ?auto_11073 ?auto_11074 ?auto_11075 ?auto_11078 ?auto_11077 )
      ( MAKE-1CRATE ?auto_11077 ?auto_11076 )
      ( MAKE-8CRATE-VERIFY ?auto_11070 ?auto_11071 ?auto_11072 ?auto_11073 ?auto_11074 ?auto_11075 ?auto_11078 ?auto_11077 ?auto_11076 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11108 - SURFACE
      ?auto_11109 - SURFACE
    )
    :vars
    (
      ?auto_11110 - HOIST
      ?auto_11111 - PLACE
      ?auto_11113 - PLACE
      ?auto_11114 - HOIST
      ?auto_11115 - SURFACE
      ?auto_11112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11110 ?auto_11111 ) ( SURFACE-AT ?auto_11108 ?auto_11111 ) ( CLEAR ?auto_11108 ) ( IS-CRATE ?auto_11109 ) ( AVAILABLE ?auto_11110 ) ( not ( = ?auto_11113 ?auto_11111 ) ) ( HOIST-AT ?auto_11114 ?auto_11113 ) ( AVAILABLE ?auto_11114 ) ( SURFACE-AT ?auto_11109 ?auto_11113 ) ( ON ?auto_11109 ?auto_11115 ) ( CLEAR ?auto_11109 ) ( TRUCK-AT ?auto_11112 ?auto_11111 ) ( not ( = ?auto_11108 ?auto_11109 ) ) ( not ( = ?auto_11108 ?auto_11115 ) ) ( not ( = ?auto_11109 ?auto_11115 ) ) ( not ( = ?auto_11110 ?auto_11114 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11112 ?auto_11111 ?auto_11113 )
      ( !LIFT ?auto_11114 ?auto_11109 ?auto_11115 ?auto_11113 )
      ( !LOAD ?auto_11114 ?auto_11109 ?auto_11112 ?auto_11113 )
      ( !DRIVE ?auto_11112 ?auto_11113 ?auto_11111 )
      ( !UNLOAD ?auto_11110 ?auto_11109 ?auto_11112 ?auto_11111 )
      ( !DROP ?auto_11110 ?auto_11109 ?auto_11108 ?auto_11111 )
      ( MAKE-1CRATE-VERIFY ?auto_11108 ?auto_11109 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_11126 - SURFACE
      ?auto_11127 - SURFACE
      ?auto_11128 - SURFACE
      ?auto_11129 - SURFACE
      ?auto_11130 - SURFACE
      ?auto_11131 - SURFACE
      ?auto_11134 - SURFACE
      ?auto_11133 - SURFACE
      ?auto_11132 - SURFACE
      ?auto_11135 - SURFACE
    )
    :vars
    (
      ?auto_11136 - HOIST
      ?auto_11140 - PLACE
      ?auto_11139 - PLACE
      ?auto_11141 - HOIST
      ?auto_11138 - SURFACE
      ?auto_11143 - PLACE
      ?auto_11147 - HOIST
      ?auto_11145 - SURFACE
      ?auto_11151 - PLACE
      ?auto_11155 - HOIST
      ?auto_11144 - SURFACE
      ?auto_11162 - PLACE
      ?auto_11163 - HOIST
      ?auto_11156 - SURFACE
      ?auto_11160 - SURFACE
      ?auto_11154 - PLACE
      ?auto_11142 - HOIST
      ?auto_11158 - SURFACE
      ?auto_11148 - PLACE
      ?auto_11157 - HOIST
      ?auto_11161 - SURFACE
      ?auto_11152 - PLACE
      ?auto_11149 - HOIST
      ?auto_11153 - SURFACE
      ?auto_11150 - PLACE
      ?auto_11146 - HOIST
      ?auto_11159 - SURFACE
      ?auto_11137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11136 ?auto_11140 ) ( IS-CRATE ?auto_11135 ) ( not ( = ?auto_11139 ?auto_11140 ) ) ( HOIST-AT ?auto_11141 ?auto_11139 ) ( SURFACE-AT ?auto_11135 ?auto_11139 ) ( ON ?auto_11135 ?auto_11138 ) ( CLEAR ?auto_11135 ) ( not ( = ?auto_11132 ?auto_11135 ) ) ( not ( = ?auto_11132 ?auto_11138 ) ) ( not ( = ?auto_11135 ?auto_11138 ) ) ( not ( = ?auto_11136 ?auto_11141 ) ) ( IS-CRATE ?auto_11132 ) ( not ( = ?auto_11143 ?auto_11140 ) ) ( HOIST-AT ?auto_11147 ?auto_11143 ) ( AVAILABLE ?auto_11147 ) ( SURFACE-AT ?auto_11132 ?auto_11143 ) ( ON ?auto_11132 ?auto_11145 ) ( CLEAR ?auto_11132 ) ( not ( = ?auto_11133 ?auto_11132 ) ) ( not ( = ?auto_11133 ?auto_11145 ) ) ( not ( = ?auto_11132 ?auto_11145 ) ) ( not ( = ?auto_11136 ?auto_11147 ) ) ( IS-CRATE ?auto_11133 ) ( not ( = ?auto_11151 ?auto_11140 ) ) ( HOIST-AT ?auto_11155 ?auto_11151 ) ( AVAILABLE ?auto_11155 ) ( SURFACE-AT ?auto_11133 ?auto_11151 ) ( ON ?auto_11133 ?auto_11144 ) ( CLEAR ?auto_11133 ) ( not ( = ?auto_11134 ?auto_11133 ) ) ( not ( = ?auto_11134 ?auto_11144 ) ) ( not ( = ?auto_11133 ?auto_11144 ) ) ( not ( = ?auto_11136 ?auto_11155 ) ) ( IS-CRATE ?auto_11134 ) ( not ( = ?auto_11162 ?auto_11140 ) ) ( HOIST-AT ?auto_11163 ?auto_11162 ) ( AVAILABLE ?auto_11163 ) ( SURFACE-AT ?auto_11134 ?auto_11162 ) ( ON ?auto_11134 ?auto_11156 ) ( CLEAR ?auto_11134 ) ( not ( = ?auto_11131 ?auto_11134 ) ) ( not ( = ?auto_11131 ?auto_11156 ) ) ( not ( = ?auto_11134 ?auto_11156 ) ) ( not ( = ?auto_11136 ?auto_11163 ) ) ( IS-CRATE ?auto_11131 ) ( AVAILABLE ?auto_11141 ) ( SURFACE-AT ?auto_11131 ?auto_11139 ) ( ON ?auto_11131 ?auto_11160 ) ( CLEAR ?auto_11131 ) ( not ( = ?auto_11130 ?auto_11131 ) ) ( not ( = ?auto_11130 ?auto_11160 ) ) ( not ( = ?auto_11131 ?auto_11160 ) ) ( IS-CRATE ?auto_11130 ) ( not ( = ?auto_11154 ?auto_11140 ) ) ( HOIST-AT ?auto_11142 ?auto_11154 ) ( AVAILABLE ?auto_11142 ) ( SURFACE-AT ?auto_11130 ?auto_11154 ) ( ON ?auto_11130 ?auto_11158 ) ( CLEAR ?auto_11130 ) ( not ( = ?auto_11129 ?auto_11130 ) ) ( not ( = ?auto_11129 ?auto_11158 ) ) ( not ( = ?auto_11130 ?auto_11158 ) ) ( not ( = ?auto_11136 ?auto_11142 ) ) ( IS-CRATE ?auto_11129 ) ( not ( = ?auto_11148 ?auto_11140 ) ) ( HOIST-AT ?auto_11157 ?auto_11148 ) ( AVAILABLE ?auto_11157 ) ( SURFACE-AT ?auto_11129 ?auto_11148 ) ( ON ?auto_11129 ?auto_11161 ) ( CLEAR ?auto_11129 ) ( not ( = ?auto_11128 ?auto_11129 ) ) ( not ( = ?auto_11128 ?auto_11161 ) ) ( not ( = ?auto_11129 ?auto_11161 ) ) ( not ( = ?auto_11136 ?auto_11157 ) ) ( IS-CRATE ?auto_11128 ) ( not ( = ?auto_11152 ?auto_11140 ) ) ( HOIST-AT ?auto_11149 ?auto_11152 ) ( AVAILABLE ?auto_11149 ) ( SURFACE-AT ?auto_11128 ?auto_11152 ) ( ON ?auto_11128 ?auto_11153 ) ( CLEAR ?auto_11128 ) ( not ( = ?auto_11127 ?auto_11128 ) ) ( not ( = ?auto_11127 ?auto_11153 ) ) ( not ( = ?auto_11128 ?auto_11153 ) ) ( not ( = ?auto_11136 ?auto_11149 ) ) ( SURFACE-AT ?auto_11126 ?auto_11140 ) ( CLEAR ?auto_11126 ) ( IS-CRATE ?auto_11127 ) ( AVAILABLE ?auto_11136 ) ( not ( = ?auto_11150 ?auto_11140 ) ) ( HOIST-AT ?auto_11146 ?auto_11150 ) ( AVAILABLE ?auto_11146 ) ( SURFACE-AT ?auto_11127 ?auto_11150 ) ( ON ?auto_11127 ?auto_11159 ) ( CLEAR ?auto_11127 ) ( TRUCK-AT ?auto_11137 ?auto_11140 ) ( not ( = ?auto_11126 ?auto_11127 ) ) ( not ( = ?auto_11126 ?auto_11159 ) ) ( not ( = ?auto_11127 ?auto_11159 ) ) ( not ( = ?auto_11136 ?auto_11146 ) ) ( not ( = ?auto_11126 ?auto_11128 ) ) ( not ( = ?auto_11126 ?auto_11153 ) ) ( not ( = ?auto_11128 ?auto_11159 ) ) ( not ( = ?auto_11152 ?auto_11150 ) ) ( not ( = ?auto_11149 ?auto_11146 ) ) ( not ( = ?auto_11153 ?auto_11159 ) ) ( not ( = ?auto_11126 ?auto_11129 ) ) ( not ( = ?auto_11126 ?auto_11161 ) ) ( not ( = ?auto_11127 ?auto_11129 ) ) ( not ( = ?auto_11127 ?auto_11161 ) ) ( not ( = ?auto_11129 ?auto_11153 ) ) ( not ( = ?auto_11129 ?auto_11159 ) ) ( not ( = ?auto_11148 ?auto_11152 ) ) ( not ( = ?auto_11148 ?auto_11150 ) ) ( not ( = ?auto_11157 ?auto_11149 ) ) ( not ( = ?auto_11157 ?auto_11146 ) ) ( not ( = ?auto_11161 ?auto_11153 ) ) ( not ( = ?auto_11161 ?auto_11159 ) ) ( not ( = ?auto_11126 ?auto_11130 ) ) ( not ( = ?auto_11126 ?auto_11158 ) ) ( not ( = ?auto_11127 ?auto_11130 ) ) ( not ( = ?auto_11127 ?auto_11158 ) ) ( not ( = ?auto_11128 ?auto_11130 ) ) ( not ( = ?auto_11128 ?auto_11158 ) ) ( not ( = ?auto_11130 ?auto_11161 ) ) ( not ( = ?auto_11130 ?auto_11153 ) ) ( not ( = ?auto_11130 ?auto_11159 ) ) ( not ( = ?auto_11154 ?auto_11148 ) ) ( not ( = ?auto_11154 ?auto_11152 ) ) ( not ( = ?auto_11154 ?auto_11150 ) ) ( not ( = ?auto_11142 ?auto_11157 ) ) ( not ( = ?auto_11142 ?auto_11149 ) ) ( not ( = ?auto_11142 ?auto_11146 ) ) ( not ( = ?auto_11158 ?auto_11161 ) ) ( not ( = ?auto_11158 ?auto_11153 ) ) ( not ( = ?auto_11158 ?auto_11159 ) ) ( not ( = ?auto_11126 ?auto_11131 ) ) ( not ( = ?auto_11126 ?auto_11160 ) ) ( not ( = ?auto_11127 ?auto_11131 ) ) ( not ( = ?auto_11127 ?auto_11160 ) ) ( not ( = ?auto_11128 ?auto_11131 ) ) ( not ( = ?auto_11128 ?auto_11160 ) ) ( not ( = ?auto_11129 ?auto_11131 ) ) ( not ( = ?auto_11129 ?auto_11160 ) ) ( not ( = ?auto_11131 ?auto_11158 ) ) ( not ( = ?auto_11131 ?auto_11161 ) ) ( not ( = ?auto_11131 ?auto_11153 ) ) ( not ( = ?auto_11131 ?auto_11159 ) ) ( not ( = ?auto_11139 ?auto_11154 ) ) ( not ( = ?auto_11139 ?auto_11148 ) ) ( not ( = ?auto_11139 ?auto_11152 ) ) ( not ( = ?auto_11139 ?auto_11150 ) ) ( not ( = ?auto_11141 ?auto_11142 ) ) ( not ( = ?auto_11141 ?auto_11157 ) ) ( not ( = ?auto_11141 ?auto_11149 ) ) ( not ( = ?auto_11141 ?auto_11146 ) ) ( not ( = ?auto_11160 ?auto_11158 ) ) ( not ( = ?auto_11160 ?auto_11161 ) ) ( not ( = ?auto_11160 ?auto_11153 ) ) ( not ( = ?auto_11160 ?auto_11159 ) ) ( not ( = ?auto_11126 ?auto_11134 ) ) ( not ( = ?auto_11126 ?auto_11156 ) ) ( not ( = ?auto_11127 ?auto_11134 ) ) ( not ( = ?auto_11127 ?auto_11156 ) ) ( not ( = ?auto_11128 ?auto_11134 ) ) ( not ( = ?auto_11128 ?auto_11156 ) ) ( not ( = ?auto_11129 ?auto_11134 ) ) ( not ( = ?auto_11129 ?auto_11156 ) ) ( not ( = ?auto_11130 ?auto_11134 ) ) ( not ( = ?auto_11130 ?auto_11156 ) ) ( not ( = ?auto_11134 ?auto_11160 ) ) ( not ( = ?auto_11134 ?auto_11158 ) ) ( not ( = ?auto_11134 ?auto_11161 ) ) ( not ( = ?auto_11134 ?auto_11153 ) ) ( not ( = ?auto_11134 ?auto_11159 ) ) ( not ( = ?auto_11162 ?auto_11139 ) ) ( not ( = ?auto_11162 ?auto_11154 ) ) ( not ( = ?auto_11162 ?auto_11148 ) ) ( not ( = ?auto_11162 ?auto_11152 ) ) ( not ( = ?auto_11162 ?auto_11150 ) ) ( not ( = ?auto_11163 ?auto_11141 ) ) ( not ( = ?auto_11163 ?auto_11142 ) ) ( not ( = ?auto_11163 ?auto_11157 ) ) ( not ( = ?auto_11163 ?auto_11149 ) ) ( not ( = ?auto_11163 ?auto_11146 ) ) ( not ( = ?auto_11156 ?auto_11160 ) ) ( not ( = ?auto_11156 ?auto_11158 ) ) ( not ( = ?auto_11156 ?auto_11161 ) ) ( not ( = ?auto_11156 ?auto_11153 ) ) ( not ( = ?auto_11156 ?auto_11159 ) ) ( not ( = ?auto_11126 ?auto_11133 ) ) ( not ( = ?auto_11126 ?auto_11144 ) ) ( not ( = ?auto_11127 ?auto_11133 ) ) ( not ( = ?auto_11127 ?auto_11144 ) ) ( not ( = ?auto_11128 ?auto_11133 ) ) ( not ( = ?auto_11128 ?auto_11144 ) ) ( not ( = ?auto_11129 ?auto_11133 ) ) ( not ( = ?auto_11129 ?auto_11144 ) ) ( not ( = ?auto_11130 ?auto_11133 ) ) ( not ( = ?auto_11130 ?auto_11144 ) ) ( not ( = ?auto_11131 ?auto_11133 ) ) ( not ( = ?auto_11131 ?auto_11144 ) ) ( not ( = ?auto_11133 ?auto_11156 ) ) ( not ( = ?auto_11133 ?auto_11160 ) ) ( not ( = ?auto_11133 ?auto_11158 ) ) ( not ( = ?auto_11133 ?auto_11161 ) ) ( not ( = ?auto_11133 ?auto_11153 ) ) ( not ( = ?auto_11133 ?auto_11159 ) ) ( not ( = ?auto_11151 ?auto_11162 ) ) ( not ( = ?auto_11151 ?auto_11139 ) ) ( not ( = ?auto_11151 ?auto_11154 ) ) ( not ( = ?auto_11151 ?auto_11148 ) ) ( not ( = ?auto_11151 ?auto_11152 ) ) ( not ( = ?auto_11151 ?auto_11150 ) ) ( not ( = ?auto_11155 ?auto_11163 ) ) ( not ( = ?auto_11155 ?auto_11141 ) ) ( not ( = ?auto_11155 ?auto_11142 ) ) ( not ( = ?auto_11155 ?auto_11157 ) ) ( not ( = ?auto_11155 ?auto_11149 ) ) ( not ( = ?auto_11155 ?auto_11146 ) ) ( not ( = ?auto_11144 ?auto_11156 ) ) ( not ( = ?auto_11144 ?auto_11160 ) ) ( not ( = ?auto_11144 ?auto_11158 ) ) ( not ( = ?auto_11144 ?auto_11161 ) ) ( not ( = ?auto_11144 ?auto_11153 ) ) ( not ( = ?auto_11144 ?auto_11159 ) ) ( not ( = ?auto_11126 ?auto_11132 ) ) ( not ( = ?auto_11126 ?auto_11145 ) ) ( not ( = ?auto_11127 ?auto_11132 ) ) ( not ( = ?auto_11127 ?auto_11145 ) ) ( not ( = ?auto_11128 ?auto_11132 ) ) ( not ( = ?auto_11128 ?auto_11145 ) ) ( not ( = ?auto_11129 ?auto_11132 ) ) ( not ( = ?auto_11129 ?auto_11145 ) ) ( not ( = ?auto_11130 ?auto_11132 ) ) ( not ( = ?auto_11130 ?auto_11145 ) ) ( not ( = ?auto_11131 ?auto_11132 ) ) ( not ( = ?auto_11131 ?auto_11145 ) ) ( not ( = ?auto_11134 ?auto_11132 ) ) ( not ( = ?auto_11134 ?auto_11145 ) ) ( not ( = ?auto_11132 ?auto_11144 ) ) ( not ( = ?auto_11132 ?auto_11156 ) ) ( not ( = ?auto_11132 ?auto_11160 ) ) ( not ( = ?auto_11132 ?auto_11158 ) ) ( not ( = ?auto_11132 ?auto_11161 ) ) ( not ( = ?auto_11132 ?auto_11153 ) ) ( not ( = ?auto_11132 ?auto_11159 ) ) ( not ( = ?auto_11143 ?auto_11151 ) ) ( not ( = ?auto_11143 ?auto_11162 ) ) ( not ( = ?auto_11143 ?auto_11139 ) ) ( not ( = ?auto_11143 ?auto_11154 ) ) ( not ( = ?auto_11143 ?auto_11148 ) ) ( not ( = ?auto_11143 ?auto_11152 ) ) ( not ( = ?auto_11143 ?auto_11150 ) ) ( not ( = ?auto_11147 ?auto_11155 ) ) ( not ( = ?auto_11147 ?auto_11163 ) ) ( not ( = ?auto_11147 ?auto_11141 ) ) ( not ( = ?auto_11147 ?auto_11142 ) ) ( not ( = ?auto_11147 ?auto_11157 ) ) ( not ( = ?auto_11147 ?auto_11149 ) ) ( not ( = ?auto_11147 ?auto_11146 ) ) ( not ( = ?auto_11145 ?auto_11144 ) ) ( not ( = ?auto_11145 ?auto_11156 ) ) ( not ( = ?auto_11145 ?auto_11160 ) ) ( not ( = ?auto_11145 ?auto_11158 ) ) ( not ( = ?auto_11145 ?auto_11161 ) ) ( not ( = ?auto_11145 ?auto_11153 ) ) ( not ( = ?auto_11145 ?auto_11159 ) ) ( not ( = ?auto_11126 ?auto_11135 ) ) ( not ( = ?auto_11126 ?auto_11138 ) ) ( not ( = ?auto_11127 ?auto_11135 ) ) ( not ( = ?auto_11127 ?auto_11138 ) ) ( not ( = ?auto_11128 ?auto_11135 ) ) ( not ( = ?auto_11128 ?auto_11138 ) ) ( not ( = ?auto_11129 ?auto_11135 ) ) ( not ( = ?auto_11129 ?auto_11138 ) ) ( not ( = ?auto_11130 ?auto_11135 ) ) ( not ( = ?auto_11130 ?auto_11138 ) ) ( not ( = ?auto_11131 ?auto_11135 ) ) ( not ( = ?auto_11131 ?auto_11138 ) ) ( not ( = ?auto_11134 ?auto_11135 ) ) ( not ( = ?auto_11134 ?auto_11138 ) ) ( not ( = ?auto_11133 ?auto_11135 ) ) ( not ( = ?auto_11133 ?auto_11138 ) ) ( not ( = ?auto_11135 ?auto_11145 ) ) ( not ( = ?auto_11135 ?auto_11144 ) ) ( not ( = ?auto_11135 ?auto_11156 ) ) ( not ( = ?auto_11135 ?auto_11160 ) ) ( not ( = ?auto_11135 ?auto_11158 ) ) ( not ( = ?auto_11135 ?auto_11161 ) ) ( not ( = ?auto_11135 ?auto_11153 ) ) ( not ( = ?auto_11135 ?auto_11159 ) ) ( not ( = ?auto_11138 ?auto_11145 ) ) ( not ( = ?auto_11138 ?auto_11144 ) ) ( not ( = ?auto_11138 ?auto_11156 ) ) ( not ( = ?auto_11138 ?auto_11160 ) ) ( not ( = ?auto_11138 ?auto_11158 ) ) ( not ( = ?auto_11138 ?auto_11161 ) ) ( not ( = ?auto_11138 ?auto_11153 ) ) ( not ( = ?auto_11138 ?auto_11159 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_11126 ?auto_11127 ?auto_11128 ?auto_11129 ?auto_11130 ?auto_11131 ?auto_11134 ?auto_11133 ?auto_11132 )
      ( MAKE-1CRATE ?auto_11132 ?auto_11135 )
      ( MAKE-9CRATE-VERIFY ?auto_11126 ?auto_11127 ?auto_11128 ?auto_11129 ?auto_11130 ?auto_11131 ?auto_11134 ?auto_11133 ?auto_11132 ?auto_11135 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11166 - SURFACE
      ?auto_11167 - SURFACE
    )
    :vars
    (
      ?auto_11168 - HOIST
      ?auto_11169 - PLACE
      ?auto_11171 - PLACE
      ?auto_11172 - HOIST
      ?auto_11173 - SURFACE
      ?auto_11170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11168 ?auto_11169 ) ( SURFACE-AT ?auto_11166 ?auto_11169 ) ( CLEAR ?auto_11166 ) ( IS-CRATE ?auto_11167 ) ( AVAILABLE ?auto_11168 ) ( not ( = ?auto_11171 ?auto_11169 ) ) ( HOIST-AT ?auto_11172 ?auto_11171 ) ( AVAILABLE ?auto_11172 ) ( SURFACE-AT ?auto_11167 ?auto_11171 ) ( ON ?auto_11167 ?auto_11173 ) ( CLEAR ?auto_11167 ) ( TRUCK-AT ?auto_11170 ?auto_11169 ) ( not ( = ?auto_11166 ?auto_11167 ) ) ( not ( = ?auto_11166 ?auto_11173 ) ) ( not ( = ?auto_11167 ?auto_11173 ) ) ( not ( = ?auto_11168 ?auto_11172 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11170 ?auto_11169 ?auto_11171 )
      ( !LIFT ?auto_11172 ?auto_11167 ?auto_11173 ?auto_11171 )
      ( !LOAD ?auto_11172 ?auto_11167 ?auto_11170 ?auto_11171 )
      ( !DRIVE ?auto_11170 ?auto_11171 ?auto_11169 )
      ( !UNLOAD ?auto_11168 ?auto_11167 ?auto_11170 ?auto_11169 )
      ( !DROP ?auto_11168 ?auto_11167 ?auto_11166 ?auto_11169 )
      ( MAKE-1CRATE-VERIFY ?auto_11166 ?auto_11167 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_11185 - SURFACE
      ?auto_11186 - SURFACE
      ?auto_11187 - SURFACE
      ?auto_11188 - SURFACE
      ?auto_11189 - SURFACE
      ?auto_11190 - SURFACE
      ?auto_11193 - SURFACE
      ?auto_11192 - SURFACE
      ?auto_11191 - SURFACE
      ?auto_11194 - SURFACE
      ?auto_11195 - SURFACE
    )
    :vars
    (
      ?auto_11196 - HOIST
      ?auto_11198 - PLACE
      ?auto_11197 - PLACE
      ?auto_11199 - HOIST
      ?auto_11200 - SURFACE
      ?auto_11221 - PLACE
      ?auto_11222 - HOIST
      ?auto_11219 - SURFACE
      ?auto_11211 - PLACE
      ?auto_11202 - HOIST
      ?auto_11218 - SURFACE
      ?auto_11207 - PLACE
      ?auto_11209 - HOIST
      ?auto_11215 - SURFACE
      ?auto_11212 - PLACE
      ?auto_11204 - HOIST
      ?auto_11220 - SURFACE
      ?auto_11205 - SURFACE
      ?auto_11208 - PLACE
      ?auto_11223 - HOIST
      ?auto_11214 - SURFACE
      ?auto_11213 - SURFACE
      ?auto_11216 - PLACE
      ?auto_11224 - HOIST
      ?auto_11210 - SURFACE
      ?auto_11206 - PLACE
      ?auto_11203 - HOIST
      ?auto_11217 - SURFACE
      ?auto_11201 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11196 ?auto_11198 ) ( IS-CRATE ?auto_11195 ) ( not ( = ?auto_11197 ?auto_11198 ) ) ( HOIST-AT ?auto_11199 ?auto_11197 ) ( SURFACE-AT ?auto_11195 ?auto_11197 ) ( ON ?auto_11195 ?auto_11200 ) ( CLEAR ?auto_11195 ) ( not ( = ?auto_11194 ?auto_11195 ) ) ( not ( = ?auto_11194 ?auto_11200 ) ) ( not ( = ?auto_11195 ?auto_11200 ) ) ( not ( = ?auto_11196 ?auto_11199 ) ) ( IS-CRATE ?auto_11194 ) ( not ( = ?auto_11221 ?auto_11198 ) ) ( HOIST-AT ?auto_11222 ?auto_11221 ) ( SURFACE-AT ?auto_11194 ?auto_11221 ) ( ON ?auto_11194 ?auto_11219 ) ( CLEAR ?auto_11194 ) ( not ( = ?auto_11191 ?auto_11194 ) ) ( not ( = ?auto_11191 ?auto_11219 ) ) ( not ( = ?auto_11194 ?auto_11219 ) ) ( not ( = ?auto_11196 ?auto_11222 ) ) ( IS-CRATE ?auto_11191 ) ( not ( = ?auto_11211 ?auto_11198 ) ) ( HOIST-AT ?auto_11202 ?auto_11211 ) ( AVAILABLE ?auto_11202 ) ( SURFACE-AT ?auto_11191 ?auto_11211 ) ( ON ?auto_11191 ?auto_11218 ) ( CLEAR ?auto_11191 ) ( not ( = ?auto_11192 ?auto_11191 ) ) ( not ( = ?auto_11192 ?auto_11218 ) ) ( not ( = ?auto_11191 ?auto_11218 ) ) ( not ( = ?auto_11196 ?auto_11202 ) ) ( IS-CRATE ?auto_11192 ) ( not ( = ?auto_11207 ?auto_11198 ) ) ( HOIST-AT ?auto_11209 ?auto_11207 ) ( AVAILABLE ?auto_11209 ) ( SURFACE-AT ?auto_11192 ?auto_11207 ) ( ON ?auto_11192 ?auto_11215 ) ( CLEAR ?auto_11192 ) ( not ( = ?auto_11193 ?auto_11192 ) ) ( not ( = ?auto_11193 ?auto_11215 ) ) ( not ( = ?auto_11192 ?auto_11215 ) ) ( not ( = ?auto_11196 ?auto_11209 ) ) ( IS-CRATE ?auto_11193 ) ( not ( = ?auto_11212 ?auto_11198 ) ) ( HOIST-AT ?auto_11204 ?auto_11212 ) ( AVAILABLE ?auto_11204 ) ( SURFACE-AT ?auto_11193 ?auto_11212 ) ( ON ?auto_11193 ?auto_11220 ) ( CLEAR ?auto_11193 ) ( not ( = ?auto_11190 ?auto_11193 ) ) ( not ( = ?auto_11190 ?auto_11220 ) ) ( not ( = ?auto_11193 ?auto_11220 ) ) ( not ( = ?auto_11196 ?auto_11204 ) ) ( IS-CRATE ?auto_11190 ) ( AVAILABLE ?auto_11222 ) ( SURFACE-AT ?auto_11190 ?auto_11221 ) ( ON ?auto_11190 ?auto_11205 ) ( CLEAR ?auto_11190 ) ( not ( = ?auto_11189 ?auto_11190 ) ) ( not ( = ?auto_11189 ?auto_11205 ) ) ( not ( = ?auto_11190 ?auto_11205 ) ) ( IS-CRATE ?auto_11189 ) ( not ( = ?auto_11208 ?auto_11198 ) ) ( HOIST-AT ?auto_11223 ?auto_11208 ) ( AVAILABLE ?auto_11223 ) ( SURFACE-AT ?auto_11189 ?auto_11208 ) ( ON ?auto_11189 ?auto_11214 ) ( CLEAR ?auto_11189 ) ( not ( = ?auto_11188 ?auto_11189 ) ) ( not ( = ?auto_11188 ?auto_11214 ) ) ( not ( = ?auto_11189 ?auto_11214 ) ) ( not ( = ?auto_11196 ?auto_11223 ) ) ( IS-CRATE ?auto_11188 ) ( AVAILABLE ?auto_11199 ) ( SURFACE-AT ?auto_11188 ?auto_11197 ) ( ON ?auto_11188 ?auto_11213 ) ( CLEAR ?auto_11188 ) ( not ( = ?auto_11187 ?auto_11188 ) ) ( not ( = ?auto_11187 ?auto_11213 ) ) ( not ( = ?auto_11188 ?auto_11213 ) ) ( IS-CRATE ?auto_11187 ) ( not ( = ?auto_11216 ?auto_11198 ) ) ( HOIST-AT ?auto_11224 ?auto_11216 ) ( AVAILABLE ?auto_11224 ) ( SURFACE-AT ?auto_11187 ?auto_11216 ) ( ON ?auto_11187 ?auto_11210 ) ( CLEAR ?auto_11187 ) ( not ( = ?auto_11186 ?auto_11187 ) ) ( not ( = ?auto_11186 ?auto_11210 ) ) ( not ( = ?auto_11187 ?auto_11210 ) ) ( not ( = ?auto_11196 ?auto_11224 ) ) ( SURFACE-AT ?auto_11185 ?auto_11198 ) ( CLEAR ?auto_11185 ) ( IS-CRATE ?auto_11186 ) ( AVAILABLE ?auto_11196 ) ( not ( = ?auto_11206 ?auto_11198 ) ) ( HOIST-AT ?auto_11203 ?auto_11206 ) ( AVAILABLE ?auto_11203 ) ( SURFACE-AT ?auto_11186 ?auto_11206 ) ( ON ?auto_11186 ?auto_11217 ) ( CLEAR ?auto_11186 ) ( TRUCK-AT ?auto_11201 ?auto_11198 ) ( not ( = ?auto_11185 ?auto_11186 ) ) ( not ( = ?auto_11185 ?auto_11217 ) ) ( not ( = ?auto_11186 ?auto_11217 ) ) ( not ( = ?auto_11196 ?auto_11203 ) ) ( not ( = ?auto_11185 ?auto_11187 ) ) ( not ( = ?auto_11185 ?auto_11210 ) ) ( not ( = ?auto_11187 ?auto_11217 ) ) ( not ( = ?auto_11216 ?auto_11206 ) ) ( not ( = ?auto_11224 ?auto_11203 ) ) ( not ( = ?auto_11210 ?auto_11217 ) ) ( not ( = ?auto_11185 ?auto_11188 ) ) ( not ( = ?auto_11185 ?auto_11213 ) ) ( not ( = ?auto_11186 ?auto_11188 ) ) ( not ( = ?auto_11186 ?auto_11213 ) ) ( not ( = ?auto_11188 ?auto_11210 ) ) ( not ( = ?auto_11188 ?auto_11217 ) ) ( not ( = ?auto_11197 ?auto_11216 ) ) ( not ( = ?auto_11197 ?auto_11206 ) ) ( not ( = ?auto_11199 ?auto_11224 ) ) ( not ( = ?auto_11199 ?auto_11203 ) ) ( not ( = ?auto_11213 ?auto_11210 ) ) ( not ( = ?auto_11213 ?auto_11217 ) ) ( not ( = ?auto_11185 ?auto_11189 ) ) ( not ( = ?auto_11185 ?auto_11214 ) ) ( not ( = ?auto_11186 ?auto_11189 ) ) ( not ( = ?auto_11186 ?auto_11214 ) ) ( not ( = ?auto_11187 ?auto_11189 ) ) ( not ( = ?auto_11187 ?auto_11214 ) ) ( not ( = ?auto_11189 ?auto_11213 ) ) ( not ( = ?auto_11189 ?auto_11210 ) ) ( not ( = ?auto_11189 ?auto_11217 ) ) ( not ( = ?auto_11208 ?auto_11197 ) ) ( not ( = ?auto_11208 ?auto_11216 ) ) ( not ( = ?auto_11208 ?auto_11206 ) ) ( not ( = ?auto_11223 ?auto_11199 ) ) ( not ( = ?auto_11223 ?auto_11224 ) ) ( not ( = ?auto_11223 ?auto_11203 ) ) ( not ( = ?auto_11214 ?auto_11213 ) ) ( not ( = ?auto_11214 ?auto_11210 ) ) ( not ( = ?auto_11214 ?auto_11217 ) ) ( not ( = ?auto_11185 ?auto_11190 ) ) ( not ( = ?auto_11185 ?auto_11205 ) ) ( not ( = ?auto_11186 ?auto_11190 ) ) ( not ( = ?auto_11186 ?auto_11205 ) ) ( not ( = ?auto_11187 ?auto_11190 ) ) ( not ( = ?auto_11187 ?auto_11205 ) ) ( not ( = ?auto_11188 ?auto_11190 ) ) ( not ( = ?auto_11188 ?auto_11205 ) ) ( not ( = ?auto_11190 ?auto_11214 ) ) ( not ( = ?auto_11190 ?auto_11213 ) ) ( not ( = ?auto_11190 ?auto_11210 ) ) ( not ( = ?auto_11190 ?auto_11217 ) ) ( not ( = ?auto_11221 ?auto_11208 ) ) ( not ( = ?auto_11221 ?auto_11197 ) ) ( not ( = ?auto_11221 ?auto_11216 ) ) ( not ( = ?auto_11221 ?auto_11206 ) ) ( not ( = ?auto_11222 ?auto_11223 ) ) ( not ( = ?auto_11222 ?auto_11199 ) ) ( not ( = ?auto_11222 ?auto_11224 ) ) ( not ( = ?auto_11222 ?auto_11203 ) ) ( not ( = ?auto_11205 ?auto_11214 ) ) ( not ( = ?auto_11205 ?auto_11213 ) ) ( not ( = ?auto_11205 ?auto_11210 ) ) ( not ( = ?auto_11205 ?auto_11217 ) ) ( not ( = ?auto_11185 ?auto_11193 ) ) ( not ( = ?auto_11185 ?auto_11220 ) ) ( not ( = ?auto_11186 ?auto_11193 ) ) ( not ( = ?auto_11186 ?auto_11220 ) ) ( not ( = ?auto_11187 ?auto_11193 ) ) ( not ( = ?auto_11187 ?auto_11220 ) ) ( not ( = ?auto_11188 ?auto_11193 ) ) ( not ( = ?auto_11188 ?auto_11220 ) ) ( not ( = ?auto_11189 ?auto_11193 ) ) ( not ( = ?auto_11189 ?auto_11220 ) ) ( not ( = ?auto_11193 ?auto_11205 ) ) ( not ( = ?auto_11193 ?auto_11214 ) ) ( not ( = ?auto_11193 ?auto_11213 ) ) ( not ( = ?auto_11193 ?auto_11210 ) ) ( not ( = ?auto_11193 ?auto_11217 ) ) ( not ( = ?auto_11212 ?auto_11221 ) ) ( not ( = ?auto_11212 ?auto_11208 ) ) ( not ( = ?auto_11212 ?auto_11197 ) ) ( not ( = ?auto_11212 ?auto_11216 ) ) ( not ( = ?auto_11212 ?auto_11206 ) ) ( not ( = ?auto_11204 ?auto_11222 ) ) ( not ( = ?auto_11204 ?auto_11223 ) ) ( not ( = ?auto_11204 ?auto_11199 ) ) ( not ( = ?auto_11204 ?auto_11224 ) ) ( not ( = ?auto_11204 ?auto_11203 ) ) ( not ( = ?auto_11220 ?auto_11205 ) ) ( not ( = ?auto_11220 ?auto_11214 ) ) ( not ( = ?auto_11220 ?auto_11213 ) ) ( not ( = ?auto_11220 ?auto_11210 ) ) ( not ( = ?auto_11220 ?auto_11217 ) ) ( not ( = ?auto_11185 ?auto_11192 ) ) ( not ( = ?auto_11185 ?auto_11215 ) ) ( not ( = ?auto_11186 ?auto_11192 ) ) ( not ( = ?auto_11186 ?auto_11215 ) ) ( not ( = ?auto_11187 ?auto_11192 ) ) ( not ( = ?auto_11187 ?auto_11215 ) ) ( not ( = ?auto_11188 ?auto_11192 ) ) ( not ( = ?auto_11188 ?auto_11215 ) ) ( not ( = ?auto_11189 ?auto_11192 ) ) ( not ( = ?auto_11189 ?auto_11215 ) ) ( not ( = ?auto_11190 ?auto_11192 ) ) ( not ( = ?auto_11190 ?auto_11215 ) ) ( not ( = ?auto_11192 ?auto_11220 ) ) ( not ( = ?auto_11192 ?auto_11205 ) ) ( not ( = ?auto_11192 ?auto_11214 ) ) ( not ( = ?auto_11192 ?auto_11213 ) ) ( not ( = ?auto_11192 ?auto_11210 ) ) ( not ( = ?auto_11192 ?auto_11217 ) ) ( not ( = ?auto_11207 ?auto_11212 ) ) ( not ( = ?auto_11207 ?auto_11221 ) ) ( not ( = ?auto_11207 ?auto_11208 ) ) ( not ( = ?auto_11207 ?auto_11197 ) ) ( not ( = ?auto_11207 ?auto_11216 ) ) ( not ( = ?auto_11207 ?auto_11206 ) ) ( not ( = ?auto_11209 ?auto_11204 ) ) ( not ( = ?auto_11209 ?auto_11222 ) ) ( not ( = ?auto_11209 ?auto_11223 ) ) ( not ( = ?auto_11209 ?auto_11199 ) ) ( not ( = ?auto_11209 ?auto_11224 ) ) ( not ( = ?auto_11209 ?auto_11203 ) ) ( not ( = ?auto_11215 ?auto_11220 ) ) ( not ( = ?auto_11215 ?auto_11205 ) ) ( not ( = ?auto_11215 ?auto_11214 ) ) ( not ( = ?auto_11215 ?auto_11213 ) ) ( not ( = ?auto_11215 ?auto_11210 ) ) ( not ( = ?auto_11215 ?auto_11217 ) ) ( not ( = ?auto_11185 ?auto_11191 ) ) ( not ( = ?auto_11185 ?auto_11218 ) ) ( not ( = ?auto_11186 ?auto_11191 ) ) ( not ( = ?auto_11186 ?auto_11218 ) ) ( not ( = ?auto_11187 ?auto_11191 ) ) ( not ( = ?auto_11187 ?auto_11218 ) ) ( not ( = ?auto_11188 ?auto_11191 ) ) ( not ( = ?auto_11188 ?auto_11218 ) ) ( not ( = ?auto_11189 ?auto_11191 ) ) ( not ( = ?auto_11189 ?auto_11218 ) ) ( not ( = ?auto_11190 ?auto_11191 ) ) ( not ( = ?auto_11190 ?auto_11218 ) ) ( not ( = ?auto_11193 ?auto_11191 ) ) ( not ( = ?auto_11193 ?auto_11218 ) ) ( not ( = ?auto_11191 ?auto_11215 ) ) ( not ( = ?auto_11191 ?auto_11220 ) ) ( not ( = ?auto_11191 ?auto_11205 ) ) ( not ( = ?auto_11191 ?auto_11214 ) ) ( not ( = ?auto_11191 ?auto_11213 ) ) ( not ( = ?auto_11191 ?auto_11210 ) ) ( not ( = ?auto_11191 ?auto_11217 ) ) ( not ( = ?auto_11211 ?auto_11207 ) ) ( not ( = ?auto_11211 ?auto_11212 ) ) ( not ( = ?auto_11211 ?auto_11221 ) ) ( not ( = ?auto_11211 ?auto_11208 ) ) ( not ( = ?auto_11211 ?auto_11197 ) ) ( not ( = ?auto_11211 ?auto_11216 ) ) ( not ( = ?auto_11211 ?auto_11206 ) ) ( not ( = ?auto_11202 ?auto_11209 ) ) ( not ( = ?auto_11202 ?auto_11204 ) ) ( not ( = ?auto_11202 ?auto_11222 ) ) ( not ( = ?auto_11202 ?auto_11223 ) ) ( not ( = ?auto_11202 ?auto_11199 ) ) ( not ( = ?auto_11202 ?auto_11224 ) ) ( not ( = ?auto_11202 ?auto_11203 ) ) ( not ( = ?auto_11218 ?auto_11215 ) ) ( not ( = ?auto_11218 ?auto_11220 ) ) ( not ( = ?auto_11218 ?auto_11205 ) ) ( not ( = ?auto_11218 ?auto_11214 ) ) ( not ( = ?auto_11218 ?auto_11213 ) ) ( not ( = ?auto_11218 ?auto_11210 ) ) ( not ( = ?auto_11218 ?auto_11217 ) ) ( not ( = ?auto_11185 ?auto_11194 ) ) ( not ( = ?auto_11185 ?auto_11219 ) ) ( not ( = ?auto_11186 ?auto_11194 ) ) ( not ( = ?auto_11186 ?auto_11219 ) ) ( not ( = ?auto_11187 ?auto_11194 ) ) ( not ( = ?auto_11187 ?auto_11219 ) ) ( not ( = ?auto_11188 ?auto_11194 ) ) ( not ( = ?auto_11188 ?auto_11219 ) ) ( not ( = ?auto_11189 ?auto_11194 ) ) ( not ( = ?auto_11189 ?auto_11219 ) ) ( not ( = ?auto_11190 ?auto_11194 ) ) ( not ( = ?auto_11190 ?auto_11219 ) ) ( not ( = ?auto_11193 ?auto_11194 ) ) ( not ( = ?auto_11193 ?auto_11219 ) ) ( not ( = ?auto_11192 ?auto_11194 ) ) ( not ( = ?auto_11192 ?auto_11219 ) ) ( not ( = ?auto_11194 ?auto_11218 ) ) ( not ( = ?auto_11194 ?auto_11215 ) ) ( not ( = ?auto_11194 ?auto_11220 ) ) ( not ( = ?auto_11194 ?auto_11205 ) ) ( not ( = ?auto_11194 ?auto_11214 ) ) ( not ( = ?auto_11194 ?auto_11213 ) ) ( not ( = ?auto_11194 ?auto_11210 ) ) ( not ( = ?auto_11194 ?auto_11217 ) ) ( not ( = ?auto_11219 ?auto_11218 ) ) ( not ( = ?auto_11219 ?auto_11215 ) ) ( not ( = ?auto_11219 ?auto_11220 ) ) ( not ( = ?auto_11219 ?auto_11205 ) ) ( not ( = ?auto_11219 ?auto_11214 ) ) ( not ( = ?auto_11219 ?auto_11213 ) ) ( not ( = ?auto_11219 ?auto_11210 ) ) ( not ( = ?auto_11219 ?auto_11217 ) ) ( not ( = ?auto_11185 ?auto_11195 ) ) ( not ( = ?auto_11185 ?auto_11200 ) ) ( not ( = ?auto_11186 ?auto_11195 ) ) ( not ( = ?auto_11186 ?auto_11200 ) ) ( not ( = ?auto_11187 ?auto_11195 ) ) ( not ( = ?auto_11187 ?auto_11200 ) ) ( not ( = ?auto_11188 ?auto_11195 ) ) ( not ( = ?auto_11188 ?auto_11200 ) ) ( not ( = ?auto_11189 ?auto_11195 ) ) ( not ( = ?auto_11189 ?auto_11200 ) ) ( not ( = ?auto_11190 ?auto_11195 ) ) ( not ( = ?auto_11190 ?auto_11200 ) ) ( not ( = ?auto_11193 ?auto_11195 ) ) ( not ( = ?auto_11193 ?auto_11200 ) ) ( not ( = ?auto_11192 ?auto_11195 ) ) ( not ( = ?auto_11192 ?auto_11200 ) ) ( not ( = ?auto_11191 ?auto_11195 ) ) ( not ( = ?auto_11191 ?auto_11200 ) ) ( not ( = ?auto_11195 ?auto_11219 ) ) ( not ( = ?auto_11195 ?auto_11218 ) ) ( not ( = ?auto_11195 ?auto_11215 ) ) ( not ( = ?auto_11195 ?auto_11220 ) ) ( not ( = ?auto_11195 ?auto_11205 ) ) ( not ( = ?auto_11195 ?auto_11214 ) ) ( not ( = ?auto_11195 ?auto_11213 ) ) ( not ( = ?auto_11195 ?auto_11210 ) ) ( not ( = ?auto_11195 ?auto_11217 ) ) ( not ( = ?auto_11200 ?auto_11219 ) ) ( not ( = ?auto_11200 ?auto_11218 ) ) ( not ( = ?auto_11200 ?auto_11215 ) ) ( not ( = ?auto_11200 ?auto_11220 ) ) ( not ( = ?auto_11200 ?auto_11205 ) ) ( not ( = ?auto_11200 ?auto_11214 ) ) ( not ( = ?auto_11200 ?auto_11213 ) ) ( not ( = ?auto_11200 ?auto_11210 ) ) ( not ( = ?auto_11200 ?auto_11217 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_11185 ?auto_11186 ?auto_11187 ?auto_11188 ?auto_11189 ?auto_11190 ?auto_11193 ?auto_11192 ?auto_11191 ?auto_11194 )
      ( MAKE-1CRATE ?auto_11194 ?auto_11195 )
      ( MAKE-10CRATE-VERIFY ?auto_11185 ?auto_11186 ?auto_11187 ?auto_11188 ?auto_11189 ?auto_11190 ?auto_11193 ?auto_11192 ?auto_11191 ?auto_11194 ?auto_11195 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11227 - SURFACE
      ?auto_11228 - SURFACE
    )
    :vars
    (
      ?auto_11229 - HOIST
      ?auto_11230 - PLACE
      ?auto_11232 - PLACE
      ?auto_11233 - HOIST
      ?auto_11234 - SURFACE
      ?auto_11231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11229 ?auto_11230 ) ( SURFACE-AT ?auto_11227 ?auto_11230 ) ( CLEAR ?auto_11227 ) ( IS-CRATE ?auto_11228 ) ( AVAILABLE ?auto_11229 ) ( not ( = ?auto_11232 ?auto_11230 ) ) ( HOIST-AT ?auto_11233 ?auto_11232 ) ( AVAILABLE ?auto_11233 ) ( SURFACE-AT ?auto_11228 ?auto_11232 ) ( ON ?auto_11228 ?auto_11234 ) ( CLEAR ?auto_11228 ) ( TRUCK-AT ?auto_11231 ?auto_11230 ) ( not ( = ?auto_11227 ?auto_11228 ) ) ( not ( = ?auto_11227 ?auto_11234 ) ) ( not ( = ?auto_11228 ?auto_11234 ) ) ( not ( = ?auto_11229 ?auto_11233 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11231 ?auto_11230 ?auto_11232 )
      ( !LIFT ?auto_11233 ?auto_11228 ?auto_11234 ?auto_11232 )
      ( !LOAD ?auto_11233 ?auto_11228 ?auto_11231 ?auto_11232 )
      ( !DRIVE ?auto_11231 ?auto_11232 ?auto_11230 )
      ( !UNLOAD ?auto_11229 ?auto_11228 ?auto_11231 ?auto_11230 )
      ( !DROP ?auto_11229 ?auto_11228 ?auto_11227 ?auto_11230 )
      ( MAKE-1CRATE-VERIFY ?auto_11227 ?auto_11228 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_11247 - SURFACE
      ?auto_11248 - SURFACE
      ?auto_11249 - SURFACE
      ?auto_11250 - SURFACE
      ?auto_11251 - SURFACE
      ?auto_11252 - SURFACE
      ?auto_11255 - SURFACE
      ?auto_11254 - SURFACE
      ?auto_11253 - SURFACE
      ?auto_11256 - SURFACE
      ?auto_11258 - SURFACE
      ?auto_11257 - SURFACE
    )
    :vars
    (
      ?auto_11264 - HOIST
      ?auto_11261 - PLACE
      ?auto_11263 - PLACE
      ?auto_11260 - HOIST
      ?auto_11262 - SURFACE
      ?auto_11269 - PLACE
      ?auto_11265 - HOIST
      ?auto_11290 - SURFACE
      ?auto_11266 - PLACE
      ?auto_11267 - HOIST
      ?auto_11279 - SURFACE
      ?auto_11289 - PLACE
      ?auto_11273 - HOIST
      ?auto_11276 - SURFACE
      ?auto_11272 - PLACE
      ?auto_11281 - HOIST
      ?auto_11285 - SURFACE
      ?auto_11288 - PLACE
      ?auto_11277 - HOIST
      ?auto_11274 - SURFACE
      ?auto_11275 - SURFACE
      ?auto_11284 - PLACE
      ?auto_11268 - HOIST
      ?auto_11287 - SURFACE
      ?auto_11278 - SURFACE
      ?auto_11270 - PLACE
      ?auto_11282 - HOIST
      ?auto_11271 - SURFACE
      ?auto_11280 - PLACE
      ?auto_11283 - HOIST
      ?auto_11286 - SURFACE
      ?auto_11259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11264 ?auto_11261 ) ( IS-CRATE ?auto_11257 ) ( not ( = ?auto_11263 ?auto_11261 ) ) ( HOIST-AT ?auto_11260 ?auto_11263 ) ( AVAILABLE ?auto_11260 ) ( SURFACE-AT ?auto_11257 ?auto_11263 ) ( ON ?auto_11257 ?auto_11262 ) ( CLEAR ?auto_11257 ) ( not ( = ?auto_11258 ?auto_11257 ) ) ( not ( = ?auto_11258 ?auto_11262 ) ) ( not ( = ?auto_11257 ?auto_11262 ) ) ( not ( = ?auto_11264 ?auto_11260 ) ) ( IS-CRATE ?auto_11258 ) ( not ( = ?auto_11269 ?auto_11261 ) ) ( HOIST-AT ?auto_11265 ?auto_11269 ) ( SURFACE-AT ?auto_11258 ?auto_11269 ) ( ON ?auto_11258 ?auto_11290 ) ( CLEAR ?auto_11258 ) ( not ( = ?auto_11256 ?auto_11258 ) ) ( not ( = ?auto_11256 ?auto_11290 ) ) ( not ( = ?auto_11258 ?auto_11290 ) ) ( not ( = ?auto_11264 ?auto_11265 ) ) ( IS-CRATE ?auto_11256 ) ( not ( = ?auto_11266 ?auto_11261 ) ) ( HOIST-AT ?auto_11267 ?auto_11266 ) ( SURFACE-AT ?auto_11256 ?auto_11266 ) ( ON ?auto_11256 ?auto_11279 ) ( CLEAR ?auto_11256 ) ( not ( = ?auto_11253 ?auto_11256 ) ) ( not ( = ?auto_11253 ?auto_11279 ) ) ( not ( = ?auto_11256 ?auto_11279 ) ) ( not ( = ?auto_11264 ?auto_11267 ) ) ( IS-CRATE ?auto_11253 ) ( not ( = ?auto_11289 ?auto_11261 ) ) ( HOIST-AT ?auto_11273 ?auto_11289 ) ( AVAILABLE ?auto_11273 ) ( SURFACE-AT ?auto_11253 ?auto_11289 ) ( ON ?auto_11253 ?auto_11276 ) ( CLEAR ?auto_11253 ) ( not ( = ?auto_11254 ?auto_11253 ) ) ( not ( = ?auto_11254 ?auto_11276 ) ) ( not ( = ?auto_11253 ?auto_11276 ) ) ( not ( = ?auto_11264 ?auto_11273 ) ) ( IS-CRATE ?auto_11254 ) ( not ( = ?auto_11272 ?auto_11261 ) ) ( HOIST-AT ?auto_11281 ?auto_11272 ) ( AVAILABLE ?auto_11281 ) ( SURFACE-AT ?auto_11254 ?auto_11272 ) ( ON ?auto_11254 ?auto_11285 ) ( CLEAR ?auto_11254 ) ( not ( = ?auto_11255 ?auto_11254 ) ) ( not ( = ?auto_11255 ?auto_11285 ) ) ( not ( = ?auto_11254 ?auto_11285 ) ) ( not ( = ?auto_11264 ?auto_11281 ) ) ( IS-CRATE ?auto_11255 ) ( not ( = ?auto_11288 ?auto_11261 ) ) ( HOIST-AT ?auto_11277 ?auto_11288 ) ( AVAILABLE ?auto_11277 ) ( SURFACE-AT ?auto_11255 ?auto_11288 ) ( ON ?auto_11255 ?auto_11274 ) ( CLEAR ?auto_11255 ) ( not ( = ?auto_11252 ?auto_11255 ) ) ( not ( = ?auto_11252 ?auto_11274 ) ) ( not ( = ?auto_11255 ?auto_11274 ) ) ( not ( = ?auto_11264 ?auto_11277 ) ) ( IS-CRATE ?auto_11252 ) ( AVAILABLE ?auto_11267 ) ( SURFACE-AT ?auto_11252 ?auto_11266 ) ( ON ?auto_11252 ?auto_11275 ) ( CLEAR ?auto_11252 ) ( not ( = ?auto_11251 ?auto_11252 ) ) ( not ( = ?auto_11251 ?auto_11275 ) ) ( not ( = ?auto_11252 ?auto_11275 ) ) ( IS-CRATE ?auto_11251 ) ( not ( = ?auto_11284 ?auto_11261 ) ) ( HOIST-AT ?auto_11268 ?auto_11284 ) ( AVAILABLE ?auto_11268 ) ( SURFACE-AT ?auto_11251 ?auto_11284 ) ( ON ?auto_11251 ?auto_11287 ) ( CLEAR ?auto_11251 ) ( not ( = ?auto_11250 ?auto_11251 ) ) ( not ( = ?auto_11250 ?auto_11287 ) ) ( not ( = ?auto_11251 ?auto_11287 ) ) ( not ( = ?auto_11264 ?auto_11268 ) ) ( IS-CRATE ?auto_11250 ) ( AVAILABLE ?auto_11265 ) ( SURFACE-AT ?auto_11250 ?auto_11269 ) ( ON ?auto_11250 ?auto_11278 ) ( CLEAR ?auto_11250 ) ( not ( = ?auto_11249 ?auto_11250 ) ) ( not ( = ?auto_11249 ?auto_11278 ) ) ( not ( = ?auto_11250 ?auto_11278 ) ) ( IS-CRATE ?auto_11249 ) ( not ( = ?auto_11270 ?auto_11261 ) ) ( HOIST-AT ?auto_11282 ?auto_11270 ) ( AVAILABLE ?auto_11282 ) ( SURFACE-AT ?auto_11249 ?auto_11270 ) ( ON ?auto_11249 ?auto_11271 ) ( CLEAR ?auto_11249 ) ( not ( = ?auto_11248 ?auto_11249 ) ) ( not ( = ?auto_11248 ?auto_11271 ) ) ( not ( = ?auto_11249 ?auto_11271 ) ) ( not ( = ?auto_11264 ?auto_11282 ) ) ( SURFACE-AT ?auto_11247 ?auto_11261 ) ( CLEAR ?auto_11247 ) ( IS-CRATE ?auto_11248 ) ( AVAILABLE ?auto_11264 ) ( not ( = ?auto_11280 ?auto_11261 ) ) ( HOIST-AT ?auto_11283 ?auto_11280 ) ( AVAILABLE ?auto_11283 ) ( SURFACE-AT ?auto_11248 ?auto_11280 ) ( ON ?auto_11248 ?auto_11286 ) ( CLEAR ?auto_11248 ) ( TRUCK-AT ?auto_11259 ?auto_11261 ) ( not ( = ?auto_11247 ?auto_11248 ) ) ( not ( = ?auto_11247 ?auto_11286 ) ) ( not ( = ?auto_11248 ?auto_11286 ) ) ( not ( = ?auto_11264 ?auto_11283 ) ) ( not ( = ?auto_11247 ?auto_11249 ) ) ( not ( = ?auto_11247 ?auto_11271 ) ) ( not ( = ?auto_11249 ?auto_11286 ) ) ( not ( = ?auto_11270 ?auto_11280 ) ) ( not ( = ?auto_11282 ?auto_11283 ) ) ( not ( = ?auto_11271 ?auto_11286 ) ) ( not ( = ?auto_11247 ?auto_11250 ) ) ( not ( = ?auto_11247 ?auto_11278 ) ) ( not ( = ?auto_11248 ?auto_11250 ) ) ( not ( = ?auto_11248 ?auto_11278 ) ) ( not ( = ?auto_11250 ?auto_11271 ) ) ( not ( = ?auto_11250 ?auto_11286 ) ) ( not ( = ?auto_11269 ?auto_11270 ) ) ( not ( = ?auto_11269 ?auto_11280 ) ) ( not ( = ?auto_11265 ?auto_11282 ) ) ( not ( = ?auto_11265 ?auto_11283 ) ) ( not ( = ?auto_11278 ?auto_11271 ) ) ( not ( = ?auto_11278 ?auto_11286 ) ) ( not ( = ?auto_11247 ?auto_11251 ) ) ( not ( = ?auto_11247 ?auto_11287 ) ) ( not ( = ?auto_11248 ?auto_11251 ) ) ( not ( = ?auto_11248 ?auto_11287 ) ) ( not ( = ?auto_11249 ?auto_11251 ) ) ( not ( = ?auto_11249 ?auto_11287 ) ) ( not ( = ?auto_11251 ?auto_11278 ) ) ( not ( = ?auto_11251 ?auto_11271 ) ) ( not ( = ?auto_11251 ?auto_11286 ) ) ( not ( = ?auto_11284 ?auto_11269 ) ) ( not ( = ?auto_11284 ?auto_11270 ) ) ( not ( = ?auto_11284 ?auto_11280 ) ) ( not ( = ?auto_11268 ?auto_11265 ) ) ( not ( = ?auto_11268 ?auto_11282 ) ) ( not ( = ?auto_11268 ?auto_11283 ) ) ( not ( = ?auto_11287 ?auto_11278 ) ) ( not ( = ?auto_11287 ?auto_11271 ) ) ( not ( = ?auto_11287 ?auto_11286 ) ) ( not ( = ?auto_11247 ?auto_11252 ) ) ( not ( = ?auto_11247 ?auto_11275 ) ) ( not ( = ?auto_11248 ?auto_11252 ) ) ( not ( = ?auto_11248 ?auto_11275 ) ) ( not ( = ?auto_11249 ?auto_11252 ) ) ( not ( = ?auto_11249 ?auto_11275 ) ) ( not ( = ?auto_11250 ?auto_11252 ) ) ( not ( = ?auto_11250 ?auto_11275 ) ) ( not ( = ?auto_11252 ?auto_11287 ) ) ( not ( = ?auto_11252 ?auto_11278 ) ) ( not ( = ?auto_11252 ?auto_11271 ) ) ( not ( = ?auto_11252 ?auto_11286 ) ) ( not ( = ?auto_11266 ?auto_11284 ) ) ( not ( = ?auto_11266 ?auto_11269 ) ) ( not ( = ?auto_11266 ?auto_11270 ) ) ( not ( = ?auto_11266 ?auto_11280 ) ) ( not ( = ?auto_11267 ?auto_11268 ) ) ( not ( = ?auto_11267 ?auto_11265 ) ) ( not ( = ?auto_11267 ?auto_11282 ) ) ( not ( = ?auto_11267 ?auto_11283 ) ) ( not ( = ?auto_11275 ?auto_11287 ) ) ( not ( = ?auto_11275 ?auto_11278 ) ) ( not ( = ?auto_11275 ?auto_11271 ) ) ( not ( = ?auto_11275 ?auto_11286 ) ) ( not ( = ?auto_11247 ?auto_11255 ) ) ( not ( = ?auto_11247 ?auto_11274 ) ) ( not ( = ?auto_11248 ?auto_11255 ) ) ( not ( = ?auto_11248 ?auto_11274 ) ) ( not ( = ?auto_11249 ?auto_11255 ) ) ( not ( = ?auto_11249 ?auto_11274 ) ) ( not ( = ?auto_11250 ?auto_11255 ) ) ( not ( = ?auto_11250 ?auto_11274 ) ) ( not ( = ?auto_11251 ?auto_11255 ) ) ( not ( = ?auto_11251 ?auto_11274 ) ) ( not ( = ?auto_11255 ?auto_11275 ) ) ( not ( = ?auto_11255 ?auto_11287 ) ) ( not ( = ?auto_11255 ?auto_11278 ) ) ( not ( = ?auto_11255 ?auto_11271 ) ) ( not ( = ?auto_11255 ?auto_11286 ) ) ( not ( = ?auto_11288 ?auto_11266 ) ) ( not ( = ?auto_11288 ?auto_11284 ) ) ( not ( = ?auto_11288 ?auto_11269 ) ) ( not ( = ?auto_11288 ?auto_11270 ) ) ( not ( = ?auto_11288 ?auto_11280 ) ) ( not ( = ?auto_11277 ?auto_11267 ) ) ( not ( = ?auto_11277 ?auto_11268 ) ) ( not ( = ?auto_11277 ?auto_11265 ) ) ( not ( = ?auto_11277 ?auto_11282 ) ) ( not ( = ?auto_11277 ?auto_11283 ) ) ( not ( = ?auto_11274 ?auto_11275 ) ) ( not ( = ?auto_11274 ?auto_11287 ) ) ( not ( = ?auto_11274 ?auto_11278 ) ) ( not ( = ?auto_11274 ?auto_11271 ) ) ( not ( = ?auto_11274 ?auto_11286 ) ) ( not ( = ?auto_11247 ?auto_11254 ) ) ( not ( = ?auto_11247 ?auto_11285 ) ) ( not ( = ?auto_11248 ?auto_11254 ) ) ( not ( = ?auto_11248 ?auto_11285 ) ) ( not ( = ?auto_11249 ?auto_11254 ) ) ( not ( = ?auto_11249 ?auto_11285 ) ) ( not ( = ?auto_11250 ?auto_11254 ) ) ( not ( = ?auto_11250 ?auto_11285 ) ) ( not ( = ?auto_11251 ?auto_11254 ) ) ( not ( = ?auto_11251 ?auto_11285 ) ) ( not ( = ?auto_11252 ?auto_11254 ) ) ( not ( = ?auto_11252 ?auto_11285 ) ) ( not ( = ?auto_11254 ?auto_11274 ) ) ( not ( = ?auto_11254 ?auto_11275 ) ) ( not ( = ?auto_11254 ?auto_11287 ) ) ( not ( = ?auto_11254 ?auto_11278 ) ) ( not ( = ?auto_11254 ?auto_11271 ) ) ( not ( = ?auto_11254 ?auto_11286 ) ) ( not ( = ?auto_11272 ?auto_11288 ) ) ( not ( = ?auto_11272 ?auto_11266 ) ) ( not ( = ?auto_11272 ?auto_11284 ) ) ( not ( = ?auto_11272 ?auto_11269 ) ) ( not ( = ?auto_11272 ?auto_11270 ) ) ( not ( = ?auto_11272 ?auto_11280 ) ) ( not ( = ?auto_11281 ?auto_11277 ) ) ( not ( = ?auto_11281 ?auto_11267 ) ) ( not ( = ?auto_11281 ?auto_11268 ) ) ( not ( = ?auto_11281 ?auto_11265 ) ) ( not ( = ?auto_11281 ?auto_11282 ) ) ( not ( = ?auto_11281 ?auto_11283 ) ) ( not ( = ?auto_11285 ?auto_11274 ) ) ( not ( = ?auto_11285 ?auto_11275 ) ) ( not ( = ?auto_11285 ?auto_11287 ) ) ( not ( = ?auto_11285 ?auto_11278 ) ) ( not ( = ?auto_11285 ?auto_11271 ) ) ( not ( = ?auto_11285 ?auto_11286 ) ) ( not ( = ?auto_11247 ?auto_11253 ) ) ( not ( = ?auto_11247 ?auto_11276 ) ) ( not ( = ?auto_11248 ?auto_11253 ) ) ( not ( = ?auto_11248 ?auto_11276 ) ) ( not ( = ?auto_11249 ?auto_11253 ) ) ( not ( = ?auto_11249 ?auto_11276 ) ) ( not ( = ?auto_11250 ?auto_11253 ) ) ( not ( = ?auto_11250 ?auto_11276 ) ) ( not ( = ?auto_11251 ?auto_11253 ) ) ( not ( = ?auto_11251 ?auto_11276 ) ) ( not ( = ?auto_11252 ?auto_11253 ) ) ( not ( = ?auto_11252 ?auto_11276 ) ) ( not ( = ?auto_11255 ?auto_11253 ) ) ( not ( = ?auto_11255 ?auto_11276 ) ) ( not ( = ?auto_11253 ?auto_11285 ) ) ( not ( = ?auto_11253 ?auto_11274 ) ) ( not ( = ?auto_11253 ?auto_11275 ) ) ( not ( = ?auto_11253 ?auto_11287 ) ) ( not ( = ?auto_11253 ?auto_11278 ) ) ( not ( = ?auto_11253 ?auto_11271 ) ) ( not ( = ?auto_11253 ?auto_11286 ) ) ( not ( = ?auto_11289 ?auto_11272 ) ) ( not ( = ?auto_11289 ?auto_11288 ) ) ( not ( = ?auto_11289 ?auto_11266 ) ) ( not ( = ?auto_11289 ?auto_11284 ) ) ( not ( = ?auto_11289 ?auto_11269 ) ) ( not ( = ?auto_11289 ?auto_11270 ) ) ( not ( = ?auto_11289 ?auto_11280 ) ) ( not ( = ?auto_11273 ?auto_11281 ) ) ( not ( = ?auto_11273 ?auto_11277 ) ) ( not ( = ?auto_11273 ?auto_11267 ) ) ( not ( = ?auto_11273 ?auto_11268 ) ) ( not ( = ?auto_11273 ?auto_11265 ) ) ( not ( = ?auto_11273 ?auto_11282 ) ) ( not ( = ?auto_11273 ?auto_11283 ) ) ( not ( = ?auto_11276 ?auto_11285 ) ) ( not ( = ?auto_11276 ?auto_11274 ) ) ( not ( = ?auto_11276 ?auto_11275 ) ) ( not ( = ?auto_11276 ?auto_11287 ) ) ( not ( = ?auto_11276 ?auto_11278 ) ) ( not ( = ?auto_11276 ?auto_11271 ) ) ( not ( = ?auto_11276 ?auto_11286 ) ) ( not ( = ?auto_11247 ?auto_11256 ) ) ( not ( = ?auto_11247 ?auto_11279 ) ) ( not ( = ?auto_11248 ?auto_11256 ) ) ( not ( = ?auto_11248 ?auto_11279 ) ) ( not ( = ?auto_11249 ?auto_11256 ) ) ( not ( = ?auto_11249 ?auto_11279 ) ) ( not ( = ?auto_11250 ?auto_11256 ) ) ( not ( = ?auto_11250 ?auto_11279 ) ) ( not ( = ?auto_11251 ?auto_11256 ) ) ( not ( = ?auto_11251 ?auto_11279 ) ) ( not ( = ?auto_11252 ?auto_11256 ) ) ( not ( = ?auto_11252 ?auto_11279 ) ) ( not ( = ?auto_11255 ?auto_11256 ) ) ( not ( = ?auto_11255 ?auto_11279 ) ) ( not ( = ?auto_11254 ?auto_11256 ) ) ( not ( = ?auto_11254 ?auto_11279 ) ) ( not ( = ?auto_11256 ?auto_11276 ) ) ( not ( = ?auto_11256 ?auto_11285 ) ) ( not ( = ?auto_11256 ?auto_11274 ) ) ( not ( = ?auto_11256 ?auto_11275 ) ) ( not ( = ?auto_11256 ?auto_11287 ) ) ( not ( = ?auto_11256 ?auto_11278 ) ) ( not ( = ?auto_11256 ?auto_11271 ) ) ( not ( = ?auto_11256 ?auto_11286 ) ) ( not ( = ?auto_11279 ?auto_11276 ) ) ( not ( = ?auto_11279 ?auto_11285 ) ) ( not ( = ?auto_11279 ?auto_11274 ) ) ( not ( = ?auto_11279 ?auto_11275 ) ) ( not ( = ?auto_11279 ?auto_11287 ) ) ( not ( = ?auto_11279 ?auto_11278 ) ) ( not ( = ?auto_11279 ?auto_11271 ) ) ( not ( = ?auto_11279 ?auto_11286 ) ) ( not ( = ?auto_11247 ?auto_11258 ) ) ( not ( = ?auto_11247 ?auto_11290 ) ) ( not ( = ?auto_11248 ?auto_11258 ) ) ( not ( = ?auto_11248 ?auto_11290 ) ) ( not ( = ?auto_11249 ?auto_11258 ) ) ( not ( = ?auto_11249 ?auto_11290 ) ) ( not ( = ?auto_11250 ?auto_11258 ) ) ( not ( = ?auto_11250 ?auto_11290 ) ) ( not ( = ?auto_11251 ?auto_11258 ) ) ( not ( = ?auto_11251 ?auto_11290 ) ) ( not ( = ?auto_11252 ?auto_11258 ) ) ( not ( = ?auto_11252 ?auto_11290 ) ) ( not ( = ?auto_11255 ?auto_11258 ) ) ( not ( = ?auto_11255 ?auto_11290 ) ) ( not ( = ?auto_11254 ?auto_11258 ) ) ( not ( = ?auto_11254 ?auto_11290 ) ) ( not ( = ?auto_11253 ?auto_11258 ) ) ( not ( = ?auto_11253 ?auto_11290 ) ) ( not ( = ?auto_11258 ?auto_11279 ) ) ( not ( = ?auto_11258 ?auto_11276 ) ) ( not ( = ?auto_11258 ?auto_11285 ) ) ( not ( = ?auto_11258 ?auto_11274 ) ) ( not ( = ?auto_11258 ?auto_11275 ) ) ( not ( = ?auto_11258 ?auto_11287 ) ) ( not ( = ?auto_11258 ?auto_11278 ) ) ( not ( = ?auto_11258 ?auto_11271 ) ) ( not ( = ?auto_11258 ?auto_11286 ) ) ( not ( = ?auto_11290 ?auto_11279 ) ) ( not ( = ?auto_11290 ?auto_11276 ) ) ( not ( = ?auto_11290 ?auto_11285 ) ) ( not ( = ?auto_11290 ?auto_11274 ) ) ( not ( = ?auto_11290 ?auto_11275 ) ) ( not ( = ?auto_11290 ?auto_11287 ) ) ( not ( = ?auto_11290 ?auto_11278 ) ) ( not ( = ?auto_11290 ?auto_11271 ) ) ( not ( = ?auto_11290 ?auto_11286 ) ) ( not ( = ?auto_11247 ?auto_11257 ) ) ( not ( = ?auto_11247 ?auto_11262 ) ) ( not ( = ?auto_11248 ?auto_11257 ) ) ( not ( = ?auto_11248 ?auto_11262 ) ) ( not ( = ?auto_11249 ?auto_11257 ) ) ( not ( = ?auto_11249 ?auto_11262 ) ) ( not ( = ?auto_11250 ?auto_11257 ) ) ( not ( = ?auto_11250 ?auto_11262 ) ) ( not ( = ?auto_11251 ?auto_11257 ) ) ( not ( = ?auto_11251 ?auto_11262 ) ) ( not ( = ?auto_11252 ?auto_11257 ) ) ( not ( = ?auto_11252 ?auto_11262 ) ) ( not ( = ?auto_11255 ?auto_11257 ) ) ( not ( = ?auto_11255 ?auto_11262 ) ) ( not ( = ?auto_11254 ?auto_11257 ) ) ( not ( = ?auto_11254 ?auto_11262 ) ) ( not ( = ?auto_11253 ?auto_11257 ) ) ( not ( = ?auto_11253 ?auto_11262 ) ) ( not ( = ?auto_11256 ?auto_11257 ) ) ( not ( = ?auto_11256 ?auto_11262 ) ) ( not ( = ?auto_11257 ?auto_11290 ) ) ( not ( = ?auto_11257 ?auto_11279 ) ) ( not ( = ?auto_11257 ?auto_11276 ) ) ( not ( = ?auto_11257 ?auto_11285 ) ) ( not ( = ?auto_11257 ?auto_11274 ) ) ( not ( = ?auto_11257 ?auto_11275 ) ) ( not ( = ?auto_11257 ?auto_11287 ) ) ( not ( = ?auto_11257 ?auto_11278 ) ) ( not ( = ?auto_11257 ?auto_11271 ) ) ( not ( = ?auto_11257 ?auto_11286 ) ) ( not ( = ?auto_11263 ?auto_11269 ) ) ( not ( = ?auto_11263 ?auto_11266 ) ) ( not ( = ?auto_11263 ?auto_11289 ) ) ( not ( = ?auto_11263 ?auto_11272 ) ) ( not ( = ?auto_11263 ?auto_11288 ) ) ( not ( = ?auto_11263 ?auto_11284 ) ) ( not ( = ?auto_11263 ?auto_11270 ) ) ( not ( = ?auto_11263 ?auto_11280 ) ) ( not ( = ?auto_11260 ?auto_11265 ) ) ( not ( = ?auto_11260 ?auto_11267 ) ) ( not ( = ?auto_11260 ?auto_11273 ) ) ( not ( = ?auto_11260 ?auto_11281 ) ) ( not ( = ?auto_11260 ?auto_11277 ) ) ( not ( = ?auto_11260 ?auto_11268 ) ) ( not ( = ?auto_11260 ?auto_11282 ) ) ( not ( = ?auto_11260 ?auto_11283 ) ) ( not ( = ?auto_11262 ?auto_11290 ) ) ( not ( = ?auto_11262 ?auto_11279 ) ) ( not ( = ?auto_11262 ?auto_11276 ) ) ( not ( = ?auto_11262 ?auto_11285 ) ) ( not ( = ?auto_11262 ?auto_11274 ) ) ( not ( = ?auto_11262 ?auto_11275 ) ) ( not ( = ?auto_11262 ?auto_11287 ) ) ( not ( = ?auto_11262 ?auto_11278 ) ) ( not ( = ?auto_11262 ?auto_11271 ) ) ( not ( = ?auto_11262 ?auto_11286 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_11247 ?auto_11248 ?auto_11249 ?auto_11250 ?auto_11251 ?auto_11252 ?auto_11255 ?auto_11254 ?auto_11253 ?auto_11256 ?auto_11258 )
      ( MAKE-1CRATE ?auto_11258 ?auto_11257 )
      ( MAKE-11CRATE-VERIFY ?auto_11247 ?auto_11248 ?auto_11249 ?auto_11250 ?auto_11251 ?auto_11252 ?auto_11255 ?auto_11254 ?auto_11253 ?auto_11256 ?auto_11258 ?auto_11257 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11293 - SURFACE
      ?auto_11294 - SURFACE
    )
    :vars
    (
      ?auto_11295 - HOIST
      ?auto_11296 - PLACE
      ?auto_11298 - PLACE
      ?auto_11299 - HOIST
      ?auto_11300 - SURFACE
      ?auto_11297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11295 ?auto_11296 ) ( SURFACE-AT ?auto_11293 ?auto_11296 ) ( CLEAR ?auto_11293 ) ( IS-CRATE ?auto_11294 ) ( AVAILABLE ?auto_11295 ) ( not ( = ?auto_11298 ?auto_11296 ) ) ( HOIST-AT ?auto_11299 ?auto_11298 ) ( AVAILABLE ?auto_11299 ) ( SURFACE-AT ?auto_11294 ?auto_11298 ) ( ON ?auto_11294 ?auto_11300 ) ( CLEAR ?auto_11294 ) ( TRUCK-AT ?auto_11297 ?auto_11296 ) ( not ( = ?auto_11293 ?auto_11294 ) ) ( not ( = ?auto_11293 ?auto_11300 ) ) ( not ( = ?auto_11294 ?auto_11300 ) ) ( not ( = ?auto_11295 ?auto_11299 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11297 ?auto_11296 ?auto_11298 )
      ( !LIFT ?auto_11299 ?auto_11294 ?auto_11300 ?auto_11298 )
      ( !LOAD ?auto_11299 ?auto_11294 ?auto_11297 ?auto_11298 )
      ( !DRIVE ?auto_11297 ?auto_11298 ?auto_11296 )
      ( !UNLOAD ?auto_11295 ?auto_11294 ?auto_11297 ?auto_11296 )
      ( !DROP ?auto_11295 ?auto_11294 ?auto_11293 ?auto_11296 )
      ( MAKE-1CRATE-VERIFY ?auto_11293 ?auto_11294 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_11314 - SURFACE
      ?auto_11315 - SURFACE
      ?auto_11316 - SURFACE
      ?auto_11317 - SURFACE
      ?auto_11318 - SURFACE
      ?auto_11319 - SURFACE
      ?auto_11322 - SURFACE
      ?auto_11321 - SURFACE
      ?auto_11320 - SURFACE
      ?auto_11323 - SURFACE
      ?auto_11325 - SURFACE
      ?auto_11324 - SURFACE
      ?auto_11326 - SURFACE
    )
    :vars
    (
      ?auto_11330 - HOIST
      ?auto_11327 - PLACE
      ?auto_11328 - PLACE
      ?auto_11331 - HOIST
      ?auto_11332 - SURFACE
      ?auto_11348 - SURFACE
      ?auto_11358 - PLACE
      ?auto_11356 - HOIST
      ?auto_11338 - SURFACE
      ?auto_11346 - PLACE
      ?auto_11336 - HOIST
      ?auto_11353 - SURFACE
      ?auto_11335 - PLACE
      ?auto_11345 - HOIST
      ?auto_11359 - SURFACE
      ?auto_11339 - PLACE
      ?auto_11334 - HOIST
      ?auto_11349 - SURFACE
      ?auto_11337 - PLACE
      ?auto_11340 - HOIST
      ?auto_11351 - SURFACE
      ?auto_11350 - SURFACE
      ?auto_11342 - PLACE
      ?auto_11355 - HOIST
      ?auto_11357 - SURFACE
      ?auto_11352 - SURFACE
      ?auto_11344 - PLACE
      ?auto_11333 - HOIST
      ?auto_11341 - SURFACE
      ?auto_11343 - PLACE
      ?auto_11354 - HOIST
      ?auto_11347 - SURFACE
      ?auto_11329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11330 ?auto_11327 ) ( IS-CRATE ?auto_11326 ) ( not ( = ?auto_11328 ?auto_11327 ) ) ( HOIST-AT ?auto_11331 ?auto_11328 ) ( SURFACE-AT ?auto_11326 ?auto_11328 ) ( ON ?auto_11326 ?auto_11332 ) ( CLEAR ?auto_11326 ) ( not ( = ?auto_11324 ?auto_11326 ) ) ( not ( = ?auto_11324 ?auto_11332 ) ) ( not ( = ?auto_11326 ?auto_11332 ) ) ( not ( = ?auto_11330 ?auto_11331 ) ) ( IS-CRATE ?auto_11324 ) ( AVAILABLE ?auto_11331 ) ( SURFACE-AT ?auto_11324 ?auto_11328 ) ( ON ?auto_11324 ?auto_11348 ) ( CLEAR ?auto_11324 ) ( not ( = ?auto_11325 ?auto_11324 ) ) ( not ( = ?auto_11325 ?auto_11348 ) ) ( not ( = ?auto_11324 ?auto_11348 ) ) ( IS-CRATE ?auto_11325 ) ( not ( = ?auto_11358 ?auto_11327 ) ) ( HOIST-AT ?auto_11356 ?auto_11358 ) ( SURFACE-AT ?auto_11325 ?auto_11358 ) ( ON ?auto_11325 ?auto_11338 ) ( CLEAR ?auto_11325 ) ( not ( = ?auto_11323 ?auto_11325 ) ) ( not ( = ?auto_11323 ?auto_11338 ) ) ( not ( = ?auto_11325 ?auto_11338 ) ) ( not ( = ?auto_11330 ?auto_11356 ) ) ( IS-CRATE ?auto_11323 ) ( not ( = ?auto_11346 ?auto_11327 ) ) ( HOIST-AT ?auto_11336 ?auto_11346 ) ( SURFACE-AT ?auto_11323 ?auto_11346 ) ( ON ?auto_11323 ?auto_11353 ) ( CLEAR ?auto_11323 ) ( not ( = ?auto_11320 ?auto_11323 ) ) ( not ( = ?auto_11320 ?auto_11353 ) ) ( not ( = ?auto_11323 ?auto_11353 ) ) ( not ( = ?auto_11330 ?auto_11336 ) ) ( IS-CRATE ?auto_11320 ) ( not ( = ?auto_11335 ?auto_11327 ) ) ( HOIST-AT ?auto_11345 ?auto_11335 ) ( AVAILABLE ?auto_11345 ) ( SURFACE-AT ?auto_11320 ?auto_11335 ) ( ON ?auto_11320 ?auto_11359 ) ( CLEAR ?auto_11320 ) ( not ( = ?auto_11321 ?auto_11320 ) ) ( not ( = ?auto_11321 ?auto_11359 ) ) ( not ( = ?auto_11320 ?auto_11359 ) ) ( not ( = ?auto_11330 ?auto_11345 ) ) ( IS-CRATE ?auto_11321 ) ( not ( = ?auto_11339 ?auto_11327 ) ) ( HOIST-AT ?auto_11334 ?auto_11339 ) ( AVAILABLE ?auto_11334 ) ( SURFACE-AT ?auto_11321 ?auto_11339 ) ( ON ?auto_11321 ?auto_11349 ) ( CLEAR ?auto_11321 ) ( not ( = ?auto_11322 ?auto_11321 ) ) ( not ( = ?auto_11322 ?auto_11349 ) ) ( not ( = ?auto_11321 ?auto_11349 ) ) ( not ( = ?auto_11330 ?auto_11334 ) ) ( IS-CRATE ?auto_11322 ) ( not ( = ?auto_11337 ?auto_11327 ) ) ( HOIST-AT ?auto_11340 ?auto_11337 ) ( AVAILABLE ?auto_11340 ) ( SURFACE-AT ?auto_11322 ?auto_11337 ) ( ON ?auto_11322 ?auto_11351 ) ( CLEAR ?auto_11322 ) ( not ( = ?auto_11319 ?auto_11322 ) ) ( not ( = ?auto_11319 ?auto_11351 ) ) ( not ( = ?auto_11322 ?auto_11351 ) ) ( not ( = ?auto_11330 ?auto_11340 ) ) ( IS-CRATE ?auto_11319 ) ( AVAILABLE ?auto_11336 ) ( SURFACE-AT ?auto_11319 ?auto_11346 ) ( ON ?auto_11319 ?auto_11350 ) ( CLEAR ?auto_11319 ) ( not ( = ?auto_11318 ?auto_11319 ) ) ( not ( = ?auto_11318 ?auto_11350 ) ) ( not ( = ?auto_11319 ?auto_11350 ) ) ( IS-CRATE ?auto_11318 ) ( not ( = ?auto_11342 ?auto_11327 ) ) ( HOIST-AT ?auto_11355 ?auto_11342 ) ( AVAILABLE ?auto_11355 ) ( SURFACE-AT ?auto_11318 ?auto_11342 ) ( ON ?auto_11318 ?auto_11357 ) ( CLEAR ?auto_11318 ) ( not ( = ?auto_11317 ?auto_11318 ) ) ( not ( = ?auto_11317 ?auto_11357 ) ) ( not ( = ?auto_11318 ?auto_11357 ) ) ( not ( = ?auto_11330 ?auto_11355 ) ) ( IS-CRATE ?auto_11317 ) ( AVAILABLE ?auto_11356 ) ( SURFACE-AT ?auto_11317 ?auto_11358 ) ( ON ?auto_11317 ?auto_11352 ) ( CLEAR ?auto_11317 ) ( not ( = ?auto_11316 ?auto_11317 ) ) ( not ( = ?auto_11316 ?auto_11352 ) ) ( not ( = ?auto_11317 ?auto_11352 ) ) ( IS-CRATE ?auto_11316 ) ( not ( = ?auto_11344 ?auto_11327 ) ) ( HOIST-AT ?auto_11333 ?auto_11344 ) ( AVAILABLE ?auto_11333 ) ( SURFACE-AT ?auto_11316 ?auto_11344 ) ( ON ?auto_11316 ?auto_11341 ) ( CLEAR ?auto_11316 ) ( not ( = ?auto_11315 ?auto_11316 ) ) ( not ( = ?auto_11315 ?auto_11341 ) ) ( not ( = ?auto_11316 ?auto_11341 ) ) ( not ( = ?auto_11330 ?auto_11333 ) ) ( SURFACE-AT ?auto_11314 ?auto_11327 ) ( CLEAR ?auto_11314 ) ( IS-CRATE ?auto_11315 ) ( AVAILABLE ?auto_11330 ) ( not ( = ?auto_11343 ?auto_11327 ) ) ( HOIST-AT ?auto_11354 ?auto_11343 ) ( AVAILABLE ?auto_11354 ) ( SURFACE-AT ?auto_11315 ?auto_11343 ) ( ON ?auto_11315 ?auto_11347 ) ( CLEAR ?auto_11315 ) ( TRUCK-AT ?auto_11329 ?auto_11327 ) ( not ( = ?auto_11314 ?auto_11315 ) ) ( not ( = ?auto_11314 ?auto_11347 ) ) ( not ( = ?auto_11315 ?auto_11347 ) ) ( not ( = ?auto_11330 ?auto_11354 ) ) ( not ( = ?auto_11314 ?auto_11316 ) ) ( not ( = ?auto_11314 ?auto_11341 ) ) ( not ( = ?auto_11316 ?auto_11347 ) ) ( not ( = ?auto_11344 ?auto_11343 ) ) ( not ( = ?auto_11333 ?auto_11354 ) ) ( not ( = ?auto_11341 ?auto_11347 ) ) ( not ( = ?auto_11314 ?auto_11317 ) ) ( not ( = ?auto_11314 ?auto_11352 ) ) ( not ( = ?auto_11315 ?auto_11317 ) ) ( not ( = ?auto_11315 ?auto_11352 ) ) ( not ( = ?auto_11317 ?auto_11341 ) ) ( not ( = ?auto_11317 ?auto_11347 ) ) ( not ( = ?auto_11358 ?auto_11344 ) ) ( not ( = ?auto_11358 ?auto_11343 ) ) ( not ( = ?auto_11356 ?auto_11333 ) ) ( not ( = ?auto_11356 ?auto_11354 ) ) ( not ( = ?auto_11352 ?auto_11341 ) ) ( not ( = ?auto_11352 ?auto_11347 ) ) ( not ( = ?auto_11314 ?auto_11318 ) ) ( not ( = ?auto_11314 ?auto_11357 ) ) ( not ( = ?auto_11315 ?auto_11318 ) ) ( not ( = ?auto_11315 ?auto_11357 ) ) ( not ( = ?auto_11316 ?auto_11318 ) ) ( not ( = ?auto_11316 ?auto_11357 ) ) ( not ( = ?auto_11318 ?auto_11352 ) ) ( not ( = ?auto_11318 ?auto_11341 ) ) ( not ( = ?auto_11318 ?auto_11347 ) ) ( not ( = ?auto_11342 ?auto_11358 ) ) ( not ( = ?auto_11342 ?auto_11344 ) ) ( not ( = ?auto_11342 ?auto_11343 ) ) ( not ( = ?auto_11355 ?auto_11356 ) ) ( not ( = ?auto_11355 ?auto_11333 ) ) ( not ( = ?auto_11355 ?auto_11354 ) ) ( not ( = ?auto_11357 ?auto_11352 ) ) ( not ( = ?auto_11357 ?auto_11341 ) ) ( not ( = ?auto_11357 ?auto_11347 ) ) ( not ( = ?auto_11314 ?auto_11319 ) ) ( not ( = ?auto_11314 ?auto_11350 ) ) ( not ( = ?auto_11315 ?auto_11319 ) ) ( not ( = ?auto_11315 ?auto_11350 ) ) ( not ( = ?auto_11316 ?auto_11319 ) ) ( not ( = ?auto_11316 ?auto_11350 ) ) ( not ( = ?auto_11317 ?auto_11319 ) ) ( not ( = ?auto_11317 ?auto_11350 ) ) ( not ( = ?auto_11319 ?auto_11357 ) ) ( not ( = ?auto_11319 ?auto_11352 ) ) ( not ( = ?auto_11319 ?auto_11341 ) ) ( not ( = ?auto_11319 ?auto_11347 ) ) ( not ( = ?auto_11346 ?auto_11342 ) ) ( not ( = ?auto_11346 ?auto_11358 ) ) ( not ( = ?auto_11346 ?auto_11344 ) ) ( not ( = ?auto_11346 ?auto_11343 ) ) ( not ( = ?auto_11336 ?auto_11355 ) ) ( not ( = ?auto_11336 ?auto_11356 ) ) ( not ( = ?auto_11336 ?auto_11333 ) ) ( not ( = ?auto_11336 ?auto_11354 ) ) ( not ( = ?auto_11350 ?auto_11357 ) ) ( not ( = ?auto_11350 ?auto_11352 ) ) ( not ( = ?auto_11350 ?auto_11341 ) ) ( not ( = ?auto_11350 ?auto_11347 ) ) ( not ( = ?auto_11314 ?auto_11322 ) ) ( not ( = ?auto_11314 ?auto_11351 ) ) ( not ( = ?auto_11315 ?auto_11322 ) ) ( not ( = ?auto_11315 ?auto_11351 ) ) ( not ( = ?auto_11316 ?auto_11322 ) ) ( not ( = ?auto_11316 ?auto_11351 ) ) ( not ( = ?auto_11317 ?auto_11322 ) ) ( not ( = ?auto_11317 ?auto_11351 ) ) ( not ( = ?auto_11318 ?auto_11322 ) ) ( not ( = ?auto_11318 ?auto_11351 ) ) ( not ( = ?auto_11322 ?auto_11350 ) ) ( not ( = ?auto_11322 ?auto_11357 ) ) ( not ( = ?auto_11322 ?auto_11352 ) ) ( not ( = ?auto_11322 ?auto_11341 ) ) ( not ( = ?auto_11322 ?auto_11347 ) ) ( not ( = ?auto_11337 ?auto_11346 ) ) ( not ( = ?auto_11337 ?auto_11342 ) ) ( not ( = ?auto_11337 ?auto_11358 ) ) ( not ( = ?auto_11337 ?auto_11344 ) ) ( not ( = ?auto_11337 ?auto_11343 ) ) ( not ( = ?auto_11340 ?auto_11336 ) ) ( not ( = ?auto_11340 ?auto_11355 ) ) ( not ( = ?auto_11340 ?auto_11356 ) ) ( not ( = ?auto_11340 ?auto_11333 ) ) ( not ( = ?auto_11340 ?auto_11354 ) ) ( not ( = ?auto_11351 ?auto_11350 ) ) ( not ( = ?auto_11351 ?auto_11357 ) ) ( not ( = ?auto_11351 ?auto_11352 ) ) ( not ( = ?auto_11351 ?auto_11341 ) ) ( not ( = ?auto_11351 ?auto_11347 ) ) ( not ( = ?auto_11314 ?auto_11321 ) ) ( not ( = ?auto_11314 ?auto_11349 ) ) ( not ( = ?auto_11315 ?auto_11321 ) ) ( not ( = ?auto_11315 ?auto_11349 ) ) ( not ( = ?auto_11316 ?auto_11321 ) ) ( not ( = ?auto_11316 ?auto_11349 ) ) ( not ( = ?auto_11317 ?auto_11321 ) ) ( not ( = ?auto_11317 ?auto_11349 ) ) ( not ( = ?auto_11318 ?auto_11321 ) ) ( not ( = ?auto_11318 ?auto_11349 ) ) ( not ( = ?auto_11319 ?auto_11321 ) ) ( not ( = ?auto_11319 ?auto_11349 ) ) ( not ( = ?auto_11321 ?auto_11351 ) ) ( not ( = ?auto_11321 ?auto_11350 ) ) ( not ( = ?auto_11321 ?auto_11357 ) ) ( not ( = ?auto_11321 ?auto_11352 ) ) ( not ( = ?auto_11321 ?auto_11341 ) ) ( not ( = ?auto_11321 ?auto_11347 ) ) ( not ( = ?auto_11339 ?auto_11337 ) ) ( not ( = ?auto_11339 ?auto_11346 ) ) ( not ( = ?auto_11339 ?auto_11342 ) ) ( not ( = ?auto_11339 ?auto_11358 ) ) ( not ( = ?auto_11339 ?auto_11344 ) ) ( not ( = ?auto_11339 ?auto_11343 ) ) ( not ( = ?auto_11334 ?auto_11340 ) ) ( not ( = ?auto_11334 ?auto_11336 ) ) ( not ( = ?auto_11334 ?auto_11355 ) ) ( not ( = ?auto_11334 ?auto_11356 ) ) ( not ( = ?auto_11334 ?auto_11333 ) ) ( not ( = ?auto_11334 ?auto_11354 ) ) ( not ( = ?auto_11349 ?auto_11351 ) ) ( not ( = ?auto_11349 ?auto_11350 ) ) ( not ( = ?auto_11349 ?auto_11357 ) ) ( not ( = ?auto_11349 ?auto_11352 ) ) ( not ( = ?auto_11349 ?auto_11341 ) ) ( not ( = ?auto_11349 ?auto_11347 ) ) ( not ( = ?auto_11314 ?auto_11320 ) ) ( not ( = ?auto_11314 ?auto_11359 ) ) ( not ( = ?auto_11315 ?auto_11320 ) ) ( not ( = ?auto_11315 ?auto_11359 ) ) ( not ( = ?auto_11316 ?auto_11320 ) ) ( not ( = ?auto_11316 ?auto_11359 ) ) ( not ( = ?auto_11317 ?auto_11320 ) ) ( not ( = ?auto_11317 ?auto_11359 ) ) ( not ( = ?auto_11318 ?auto_11320 ) ) ( not ( = ?auto_11318 ?auto_11359 ) ) ( not ( = ?auto_11319 ?auto_11320 ) ) ( not ( = ?auto_11319 ?auto_11359 ) ) ( not ( = ?auto_11322 ?auto_11320 ) ) ( not ( = ?auto_11322 ?auto_11359 ) ) ( not ( = ?auto_11320 ?auto_11349 ) ) ( not ( = ?auto_11320 ?auto_11351 ) ) ( not ( = ?auto_11320 ?auto_11350 ) ) ( not ( = ?auto_11320 ?auto_11357 ) ) ( not ( = ?auto_11320 ?auto_11352 ) ) ( not ( = ?auto_11320 ?auto_11341 ) ) ( not ( = ?auto_11320 ?auto_11347 ) ) ( not ( = ?auto_11335 ?auto_11339 ) ) ( not ( = ?auto_11335 ?auto_11337 ) ) ( not ( = ?auto_11335 ?auto_11346 ) ) ( not ( = ?auto_11335 ?auto_11342 ) ) ( not ( = ?auto_11335 ?auto_11358 ) ) ( not ( = ?auto_11335 ?auto_11344 ) ) ( not ( = ?auto_11335 ?auto_11343 ) ) ( not ( = ?auto_11345 ?auto_11334 ) ) ( not ( = ?auto_11345 ?auto_11340 ) ) ( not ( = ?auto_11345 ?auto_11336 ) ) ( not ( = ?auto_11345 ?auto_11355 ) ) ( not ( = ?auto_11345 ?auto_11356 ) ) ( not ( = ?auto_11345 ?auto_11333 ) ) ( not ( = ?auto_11345 ?auto_11354 ) ) ( not ( = ?auto_11359 ?auto_11349 ) ) ( not ( = ?auto_11359 ?auto_11351 ) ) ( not ( = ?auto_11359 ?auto_11350 ) ) ( not ( = ?auto_11359 ?auto_11357 ) ) ( not ( = ?auto_11359 ?auto_11352 ) ) ( not ( = ?auto_11359 ?auto_11341 ) ) ( not ( = ?auto_11359 ?auto_11347 ) ) ( not ( = ?auto_11314 ?auto_11323 ) ) ( not ( = ?auto_11314 ?auto_11353 ) ) ( not ( = ?auto_11315 ?auto_11323 ) ) ( not ( = ?auto_11315 ?auto_11353 ) ) ( not ( = ?auto_11316 ?auto_11323 ) ) ( not ( = ?auto_11316 ?auto_11353 ) ) ( not ( = ?auto_11317 ?auto_11323 ) ) ( not ( = ?auto_11317 ?auto_11353 ) ) ( not ( = ?auto_11318 ?auto_11323 ) ) ( not ( = ?auto_11318 ?auto_11353 ) ) ( not ( = ?auto_11319 ?auto_11323 ) ) ( not ( = ?auto_11319 ?auto_11353 ) ) ( not ( = ?auto_11322 ?auto_11323 ) ) ( not ( = ?auto_11322 ?auto_11353 ) ) ( not ( = ?auto_11321 ?auto_11323 ) ) ( not ( = ?auto_11321 ?auto_11353 ) ) ( not ( = ?auto_11323 ?auto_11359 ) ) ( not ( = ?auto_11323 ?auto_11349 ) ) ( not ( = ?auto_11323 ?auto_11351 ) ) ( not ( = ?auto_11323 ?auto_11350 ) ) ( not ( = ?auto_11323 ?auto_11357 ) ) ( not ( = ?auto_11323 ?auto_11352 ) ) ( not ( = ?auto_11323 ?auto_11341 ) ) ( not ( = ?auto_11323 ?auto_11347 ) ) ( not ( = ?auto_11353 ?auto_11359 ) ) ( not ( = ?auto_11353 ?auto_11349 ) ) ( not ( = ?auto_11353 ?auto_11351 ) ) ( not ( = ?auto_11353 ?auto_11350 ) ) ( not ( = ?auto_11353 ?auto_11357 ) ) ( not ( = ?auto_11353 ?auto_11352 ) ) ( not ( = ?auto_11353 ?auto_11341 ) ) ( not ( = ?auto_11353 ?auto_11347 ) ) ( not ( = ?auto_11314 ?auto_11325 ) ) ( not ( = ?auto_11314 ?auto_11338 ) ) ( not ( = ?auto_11315 ?auto_11325 ) ) ( not ( = ?auto_11315 ?auto_11338 ) ) ( not ( = ?auto_11316 ?auto_11325 ) ) ( not ( = ?auto_11316 ?auto_11338 ) ) ( not ( = ?auto_11317 ?auto_11325 ) ) ( not ( = ?auto_11317 ?auto_11338 ) ) ( not ( = ?auto_11318 ?auto_11325 ) ) ( not ( = ?auto_11318 ?auto_11338 ) ) ( not ( = ?auto_11319 ?auto_11325 ) ) ( not ( = ?auto_11319 ?auto_11338 ) ) ( not ( = ?auto_11322 ?auto_11325 ) ) ( not ( = ?auto_11322 ?auto_11338 ) ) ( not ( = ?auto_11321 ?auto_11325 ) ) ( not ( = ?auto_11321 ?auto_11338 ) ) ( not ( = ?auto_11320 ?auto_11325 ) ) ( not ( = ?auto_11320 ?auto_11338 ) ) ( not ( = ?auto_11325 ?auto_11353 ) ) ( not ( = ?auto_11325 ?auto_11359 ) ) ( not ( = ?auto_11325 ?auto_11349 ) ) ( not ( = ?auto_11325 ?auto_11351 ) ) ( not ( = ?auto_11325 ?auto_11350 ) ) ( not ( = ?auto_11325 ?auto_11357 ) ) ( not ( = ?auto_11325 ?auto_11352 ) ) ( not ( = ?auto_11325 ?auto_11341 ) ) ( not ( = ?auto_11325 ?auto_11347 ) ) ( not ( = ?auto_11338 ?auto_11353 ) ) ( not ( = ?auto_11338 ?auto_11359 ) ) ( not ( = ?auto_11338 ?auto_11349 ) ) ( not ( = ?auto_11338 ?auto_11351 ) ) ( not ( = ?auto_11338 ?auto_11350 ) ) ( not ( = ?auto_11338 ?auto_11357 ) ) ( not ( = ?auto_11338 ?auto_11352 ) ) ( not ( = ?auto_11338 ?auto_11341 ) ) ( not ( = ?auto_11338 ?auto_11347 ) ) ( not ( = ?auto_11314 ?auto_11324 ) ) ( not ( = ?auto_11314 ?auto_11348 ) ) ( not ( = ?auto_11315 ?auto_11324 ) ) ( not ( = ?auto_11315 ?auto_11348 ) ) ( not ( = ?auto_11316 ?auto_11324 ) ) ( not ( = ?auto_11316 ?auto_11348 ) ) ( not ( = ?auto_11317 ?auto_11324 ) ) ( not ( = ?auto_11317 ?auto_11348 ) ) ( not ( = ?auto_11318 ?auto_11324 ) ) ( not ( = ?auto_11318 ?auto_11348 ) ) ( not ( = ?auto_11319 ?auto_11324 ) ) ( not ( = ?auto_11319 ?auto_11348 ) ) ( not ( = ?auto_11322 ?auto_11324 ) ) ( not ( = ?auto_11322 ?auto_11348 ) ) ( not ( = ?auto_11321 ?auto_11324 ) ) ( not ( = ?auto_11321 ?auto_11348 ) ) ( not ( = ?auto_11320 ?auto_11324 ) ) ( not ( = ?auto_11320 ?auto_11348 ) ) ( not ( = ?auto_11323 ?auto_11324 ) ) ( not ( = ?auto_11323 ?auto_11348 ) ) ( not ( = ?auto_11324 ?auto_11338 ) ) ( not ( = ?auto_11324 ?auto_11353 ) ) ( not ( = ?auto_11324 ?auto_11359 ) ) ( not ( = ?auto_11324 ?auto_11349 ) ) ( not ( = ?auto_11324 ?auto_11351 ) ) ( not ( = ?auto_11324 ?auto_11350 ) ) ( not ( = ?auto_11324 ?auto_11357 ) ) ( not ( = ?auto_11324 ?auto_11352 ) ) ( not ( = ?auto_11324 ?auto_11341 ) ) ( not ( = ?auto_11324 ?auto_11347 ) ) ( not ( = ?auto_11328 ?auto_11358 ) ) ( not ( = ?auto_11328 ?auto_11346 ) ) ( not ( = ?auto_11328 ?auto_11335 ) ) ( not ( = ?auto_11328 ?auto_11339 ) ) ( not ( = ?auto_11328 ?auto_11337 ) ) ( not ( = ?auto_11328 ?auto_11342 ) ) ( not ( = ?auto_11328 ?auto_11344 ) ) ( not ( = ?auto_11328 ?auto_11343 ) ) ( not ( = ?auto_11331 ?auto_11356 ) ) ( not ( = ?auto_11331 ?auto_11336 ) ) ( not ( = ?auto_11331 ?auto_11345 ) ) ( not ( = ?auto_11331 ?auto_11334 ) ) ( not ( = ?auto_11331 ?auto_11340 ) ) ( not ( = ?auto_11331 ?auto_11355 ) ) ( not ( = ?auto_11331 ?auto_11333 ) ) ( not ( = ?auto_11331 ?auto_11354 ) ) ( not ( = ?auto_11348 ?auto_11338 ) ) ( not ( = ?auto_11348 ?auto_11353 ) ) ( not ( = ?auto_11348 ?auto_11359 ) ) ( not ( = ?auto_11348 ?auto_11349 ) ) ( not ( = ?auto_11348 ?auto_11351 ) ) ( not ( = ?auto_11348 ?auto_11350 ) ) ( not ( = ?auto_11348 ?auto_11357 ) ) ( not ( = ?auto_11348 ?auto_11352 ) ) ( not ( = ?auto_11348 ?auto_11341 ) ) ( not ( = ?auto_11348 ?auto_11347 ) ) ( not ( = ?auto_11314 ?auto_11326 ) ) ( not ( = ?auto_11314 ?auto_11332 ) ) ( not ( = ?auto_11315 ?auto_11326 ) ) ( not ( = ?auto_11315 ?auto_11332 ) ) ( not ( = ?auto_11316 ?auto_11326 ) ) ( not ( = ?auto_11316 ?auto_11332 ) ) ( not ( = ?auto_11317 ?auto_11326 ) ) ( not ( = ?auto_11317 ?auto_11332 ) ) ( not ( = ?auto_11318 ?auto_11326 ) ) ( not ( = ?auto_11318 ?auto_11332 ) ) ( not ( = ?auto_11319 ?auto_11326 ) ) ( not ( = ?auto_11319 ?auto_11332 ) ) ( not ( = ?auto_11322 ?auto_11326 ) ) ( not ( = ?auto_11322 ?auto_11332 ) ) ( not ( = ?auto_11321 ?auto_11326 ) ) ( not ( = ?auto_11321 ?auto_11332 ) ) ( not ( = ?auto_11320 ?auto_11326 ) ) ( not ( = ?auto_11320 ?auto_11332 ) ) ( not ( = ?auto_11323 ?auto_11326 ) ) ( not ( = ?auto_11323 ?auto_11332 ) ) ( not ( = ?auto_11325 ?auto_11326 ) ) ( not ( = ?auto_11325 ?auto_11332 ) ) ( not ( = ?auto_11326 ?auto_11348 ) ) ( not ( = ?auto_11326 ?auto_11338 ) ) ( not ( = ?auto_11326 ?auto_11353 ) ) ( not ( = ?auto_11326 ?auto_11359 ) ) ( not ( = ?auto_11326 ?auto_11349 ) ) ( not ( = ?auto_11326 ?auto_11351 ) ) ( not ( = ?auto_11326 ?auto_11350 ) ) ( not ( = ?auto_11326 ?auto_11357 ) ) ( not ( = ?auto_11326 ?auto_11352 ) ) ( not ( = ?auto_11326 ?auto_11341 ) ) ( not ( = ?auto_11326 ?auto_11347 ) ) ( not ( = ?auto_11332 ?auto_11348 ) ) ( not ( = ?auto_11332 ?auto_11338 ) ) ( not ( = ?auto_11332 ?auto_11353 ) ) ( not ( = ?auto_11332 ?auto_11359 ) ) ( not ( = ?auto_11332 ?auto_11349 ) ) ( not ( = ?auto_11332 ?auto_11351 ) ) ( not ( = ?auto_11332 ?auto_11350 ) ) ( not ( = ?auto_11332 ?auto_11357 ) ) ( not ( = ?auto_11332 ?auto_11352 ) ) ( not ( = ?auto_11332 ?auto_11341 ) ) ( not ( = ?auto_11332 ?auto_11347 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_11314 ?auto_11315 ?auto_11316 ?auto_11317 ?auto_11318 ?auto_11319 ?auto_11322 ?auto_11321 ?auto_11320 ?auto_11323 ?auto_11325 ?auto_11324 )
      ( MAKE-1CRATE ?auto_11324 ?auto_11326 )
      ( MAKE-12CRATE-VERIFY ?auto_11314 ?auto_11315 ?auto_11316 ?auto_11317 ?auto_11318 ?auto_11319 ?auto_11322 ?auto_11321 ?auto_11320 ?auto_11323 ?auto_11325 ?auto_11324 ?auto_11326 ) )
  )

)

