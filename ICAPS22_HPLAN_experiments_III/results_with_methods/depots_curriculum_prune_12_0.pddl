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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10839 - SURFACE
      ?auto_10840 - SURFACE
      ?auto_10841 - SURFACE
    )
    :vars
    (
      ?auto_10847 - HOIST
      ?auto_10846 - PLACE
      ?auto_10845 - PLACE
      ?auto_10844 - HOIST
      ?auto_10842 - SURFACE
      ?auto_10848 - PLACE
      ?auto_10849 - HOIST
      ?auto_10850 - SURFACE
      ?auto_10843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10847 ?auto_10846 ) ( IS-CRATE ?auto_10841 ) ( not ( = ?auto_10845 ?auto_10846 ) ) ( HOIST-AT ?auto_10844 ?auto_10845 ) ( AVAILABLE ?auto_10844 ) ( SURFACE-AT ?auto_10841 ?auto_10845 ) ( ON ?auto_10841 ?auto_10842 ) ( CLEAR ?auto_10841 ) ( not ( = ?auto_10840 ?auto_10841 ) ) ( not ( = ?auto_10840 ?auto_10842 ) ) ( not ( = ?auto_10841 ?auto_10842 ) ) ( not ( = ?auto_10847 ?auto_10844 ) ) ( SURFACE-AT ?auto_10839 ?auto_10846 ) ( CLEAR ?auto_10839 ) ( IS-CRATE ?auto_10840 ) ( AVAILABLE ?auto_10847 ) ( not ( = ?auto_10848 ?auto_10846 ) ) ( HOIST-AT ?auto_10849 ?auto_10848 ) ( AVAILABLE ?auto_10849 ) ( SURFACE-AT ?auto_10840 ?auto_10848 ) ( ON ?auto_10840 ?auto_10850 ) ( CLEAR ?auto_10840 ) ( TRUCK-AT ?auto_10843 ?auto_10846 ) ( not ( = ?auto_10839 ?auto_10840 ) ) ( not ( = ?auto_10839 ?auto_10850 ) ) ( not ( = ?auto_10840 ?auto_10850 ) ) ( not ( = ?auto_10847 ?auto_10849 ) ) ( not ( = ?auto_10839 ?auto_10841 ) ) ( not ( = ?auto_10839 ?auto_10842 ) ) ( not ( = ?auto_10841 ?auto_10850 ) ) ( not ( = ?auto_10845 ?auto_10848 ) ) ( not ( = ?auto_10844 ?auto_10849 ) ) ( not ( = ?auto_10842 ?auto_10850 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10839 ?auto_10840 )
      ( MAKE-1CRATE ?auto_10840 ?auto_10841 )
      ( MAKE-2CRATE-VERIFY ?auto_10839 ?auto_10840 ?auto_10841 ) )
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
      ?auto_10870 - HOIST
      ?auto_10873 - PLACE
      ?auto_10874 - PLACE
      ?auto_10872 - HOIST
      ?auto_10871 - SURFACE
      ?auto_10877 - PLACE
      ?auto_10875 - HOIST
      ?auto_10879 - SURFACE
      ?auto_10876 - PLACE
      ?auto_10880 - HOIST
      ?auto_10878 - SURFACE
      ?auto_10869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10870 ?auto_10873 ) ( IS-CRATE ?auto_10868 ) ( not ( = ?auto_10874 ?auto_10873 ) ) ( HOIST-AT ?auto_10872 ?auto_10874 ) ( AVAILABLE ?auto_10872 ) ( SURFACE-AT ?auto_10868 ?auto_10874 ) ( ON ?auto_10868 ?auto_10871 ) ( CLEAR ?auto_10868 ) ( not ( = ?auto_10867 ?auto_10868 ) ) ( not ( = ?auto_10867 ?auto_10871 ) ) ( not ( = ?auto_10868 ?auto_10871 ) ) ( not ( = ?auto_10870 ?auto_10872 ) ) ( IS-CRATE ?auto_10867 ) ( not ( = ?auto_10877 ?auto_10873 ) ) ( HOIST-AT ?auto_10875 ?auto_10877 ) ( AVAILABLE ?auto_10875 ) ( SURFACE-AT ?auto_10867 ?auto_10877 ) ( ON ?auto_10867 ?auto_10879 ) ( CLEAR ?auto_10867 ) ( not ( = ?auto_10866 ?auto_10867 ) ) ( not ( = ?auto_10866 ?auto_10879 ) ) ( not ( = ?auto_10867 ?auto_10879 ) ) ( not ( = ?auto_10870 ?auto_10875 ) ) ( SURFACE-AT ?auto_10865 ?auto_10873 ) ( CLEAR ?auto_10865 ) ( IS-CRATE ?auto_10866 ) ( AVAILABLE ?auto_10870 ) ( not ( = ?auto_10876 ?auto_10873 ) ) ( HOIST-AT ?auto_10880 ?auto_10876 ) ( AVAILABLE ?auto_10880 ) ( SURFACE-AT ?auto_10866 ?auto_10876 ) ( ON ?auto_10866 ?auto_10878 ) ( CLEAR ?auto_10866 ) ( TRUCK-AT ?auto_10869 ?auto_10873 ) ( not ( = ?auto_10865 ?auto_10866 ) ) ( not ( = ?auto_10865 ?auto_10878 ) ) ( not ( = ?auto_10866 ?auto_10878 ) ) ( not ( = ?auto_10870 ?auto_10880 ) ) ( not ( = ?auto_10865 ?auto_10867 ) ) ( not ( = ?auto_10865 ?auto_10879 ) ) ( not ( = ?auto_10867 ?auto_10878 ) ) ( not ( = ?auto_10877 ?auto_10876 ) ) ( not ( = ?auto_10875 ?auto_10880 ) ) ( not ( = ?auto_10879 ?auto_10878 ) ) ( not ( = ?auto_10865 ?auto_10868 ) ) ( not ( = ?auto_10865 ?auto_10871 ) ) ( not ( = ?auto_10866 ?auto_10868 ) ) ( not ( = ?auto_10866 ?auto_10871 ) ) ( not ( = ?auto_10868 ?auto_10879 ) ) ( not ( = ?auto_10868 ?auto_10878 ) ) ( not ( = ?auto_10874 ?auto_10877 ) ) ( not ( = ?auto_10874 ?auto_10876 ) ) ( not ( = ?auto_10872 ?auto_10875 ) ) ( not ( = ?auto_10872 ?auto_10880 ) ) ( not ( = ?auto_10871 ?auto_10879 ) ) ( not ( = ?auto_10871 ?auto_10878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10865 ?auto_10866 ?auto_10867 )
      ( MAKE-1CRATE ?auto_10867 ?auto_10868 )
      ( MAKE-3CRATE-VERIFY ?auto_10865 ?auto_10866 ?auto_10867 ?auto_10868 ) )
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
      ?auto_10903 - HOIST
      ?auto_10902 - PLACE
      ?auto_10905 - PLACE
      ?auto_10906 - HOIST
      ?auto_10901 - SURFACE
      ?auto_10915 - PLACE
      ?auto_10912 - HOIST
      ?auto_10909 - SURFACE
      ?auto_10910 - PLACE
      ?auto_10907 - HOIST
      ?auto_10914 - SURFACE
      ?auto_10911 - PLACE
      ?auto_10908 - HOIST
      ?auto_10913 - SURFACE
      ?auto_10904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10903 ?auto_10902 ) ( IS-CRATE ?auto_10900 ) ( not ( = ?auto_10905 ?auto_10902 ) ) ( HOIST-AT ?auto_10906 ?auto_10905 ) ( AVAILABLE ?auto_10906 ) ( SURFACE-AT ?auto_10900 ?auto_10905 ) ( ON ?auto_10900 ?auto_10901 ) ( CLEAR ?auto_10900 ) ( not ( = ?auto_10899 ?auto_10900 ) ) ( not ( = ?auto_10899 ?auto_10901 ) ) ( not ( = ?auto_10900 ?auto_10901 ) ) ( not ( = ?auto_10903 ?auto_10906 ) ) ( IS-CRATE ?auto_10899 ) ( not ( = ?auto_10915 ?auto_10902 ) ) ( HOIST-AT ?auto_10912 ?auto_10915 ) ( AVAILABLE ?auto_10912 ) ( SURFACE-AT ?auto_10899 ?auto_10915 ) ( ON ?auto_10899 ?auto_10909 ) ( CLEAR ?auto_10899 ) ( not ( = ?auto_10898 ?auto_10899 ) ) ( not ( = ?auto_10898 ?auto_10909 ) ) ( not ( = ?auto_10899 ?auto_10909 ) ) ( not ( = ?auto_10903 ?auto_10912 ) ) ( IS-CRATE ?auto_10898 ) ( not ( = ?auto_10910 ?auto_10902 ) ) ( HOIST-AT ?auto_10907 ?auto_10910 ) ( AVAILABLE ?auto_10907 ) ( SURFACE-AT ?auto_10898 ?auto_10910 ) ( ON ?auto_10898 ?auto_10914 ) ( CLEAR ?auto_10898 ) ( not ( = ?auto_10897 ?auto_10898 ) ) ( not ( = ?auto_10897 ?auto_10914 ) ) ( not ( = ?auto_10898 ?auto_10914 ) ) ( not ( = ?auto_10903 ?auto_10907 ) ) ( SURFACE-AT ?auto_10896 ?auto_10902 ) ( CLEAR ?auto_10896 ) ( IS-CRATE ?auto_10897 ) ( AVAILABLE ?auto_10903 ) ( not ( = ?auto_10911 ?auto_10902 ) ) ( HOIST-AT ?auto_10908 ?auto_10911 ) ( AVAILABLE ?auto_10908 ) ( SURFACE-AT ?auto_10897 ?auto_10911 ) ( ON ?auto_10897 ?auto_10913 ) ( CLEAR ?auto_10897 ) ( TRUCK-AT ?auto_10904 ?auto_10902 ) ( not ( = ?auto_10896 ?auto_10897 ) ) ( not ( = ?auto_10896 ?auto_10913 ) ) ( not ( = ?auto_10897 ?auto_10913 ) ) ( not ( = ?auto_10903 ?auto_10908 ) ) ( not ( = ?auto_10896 ?auto_10898 ) ) ( not ( = ?auto_10896 ?auto_10914 ) ) ( not ( = ?auto_10898 ?auto_10913 ) ) ( not ( = ?auto_10910 ?auto_10911 ) ) ( not ( = ?auto_10907 ?auto_10908 ) ) ( not ( = ?auto_10914 ?auto_10913 ) ) ( not ( = ?auto_10896 ?auto_10899 ) ) ( not ( = ?auto_10896 ?auto_10909 ) ) ( not ( = ?auto_10897 ?auto_10899 ) ) ( not ( = ?auto_10897 ?auto_10909 ) ) ( not ( = ?auto_10899 ?auto_10914 ) ) ( not ( = ?auto_10899 ?auto_10913 ) ) ( not ( = ?auto_10915 ?auto_10910 ) ) ( not ( = ?auto_10915 ?auto_10911 ) ) ( not ( = ?auto_10912 ?auto_10907 ) ) ( not ( = ?auto_10912 ?auto_10908 ) ) ( not ( = ?auto_10909 ?auto_10914 ) ) ( not ( = ?auto_10909 ?auto_10913 ) ) ( not ( = ?auto_10896 ?auto_10900 ) ) ( not ( = ?auto_10896 ?auto_10901 ) ) ( not ( = ?auto_10897 ?auto_10900 ) ) ( not ( = ?auto_10897 ?auto_10901 ) ) ( not ( = ?auto_10898 ?auto_10900 ) ) ( not ( = ?auto_10898 ?auto_10901 ) ) ( not ( = ?auto_10900 ?auto_10909 ) ) ( not ( = ?auto_10900 ?auto_10914 ) ) ( not ( = ?auto_10900 ?auto_10913 ) ) ( not ( = ?auto_10905 ?auto_10915 ) ) ( not ( = ?auto_10905 ?auto_10910 ) ) ( not ( = ?auto_10905 ?auto_10911 ) ) ( not ( = ?auto_10906 ?auto_10912 ) ) ( not ( = ?auto_10906 ?auto_10907 ) ) ( not ( = ?auto_10906 ?auto_10908 ) ) ( not ( = ?auto_10901 ?auto_10909 ) ) ( not ( = ?auto_10901 ?auto_10914 ) ) ( not ( = ?auto_10901 ?auto_10913 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_10896 ?auto_10897 ?auto_10898 ?auto_10899 )
      ( MAKE-1CRATE ?auto_10899 ?auto_10900 )
      ( MAKE-4CRATE-VERIFY ?auto_10896 ?auto_10897 ?auto_10898 ?auto_10899 ?auto_10900 ) )
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
      ?auto_10943 - HOIST
      ?auto_10940 - PLACE
      ?auto_10938 - PLACE
      ?auto_10941 - HOIST
      ?auto_10942 - SURFACE
      ?auto_10953 - PLACE
      ?auto_10948 - HOIST
      ?auto_10954 - SURFACE
      ?auto_10951 - PLACE
      ?auto_10947 - HOIST
      ?auto_10950 - SURFACE
      ?auto_10955 - PLACE
      ?auto_10949 - HOIST
      ?auto_10944 - SURFACE
      ?auto_10946 - PLACE
      ?auto_10952 - HOIST
      ?auto_10945 - SURFACE
      ?auto_10939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10943 ?auto_10940 ) ( IS-CRATE ?auto_10937 ) ( not ( = ?auto_10938 ?auto_10940 ) ) ( HOIST-AT ?auto_10941 ?auto_10938 ) ( AVAILABLE ?auto_10941 ) ( SURFACE-AT ?auto_10937 ?auto_10938 ) ( ON ?auto_10937 ?auto_10942 ) ( CLEAR ?auto_10937 ) ( not ( = ?auto_10936 ?auto_10937 ) ) ( not ( = ?auto_10936 ?auto_10942 ) ) ( not ( = ?auto_10937 ?auto_10942 ) ) ( not ( = ?auto_10943 ?auto_10941 ) ) ( IS-CRATE ?auto_10936 ) ( not ( = ?auto_10953 ?auto_10940 ) ) ( HOIST-AT ?auto_10948 ?auto_10953 ) ( AVAILABLE ?auto_10948 ) ( SURFACE-AT ?auto_10936 ?auto_10953 ) ( ON ?auto_10936 ?auto_10954 ) ( CLEAR ?auto_10936 ) ( not ( = ?auto_10935 ?auto_10936 ) ) ( not ( = ?auto_10935 ?auto_10954 ) ) ( not ( = ?auto_10936 ?auto_10954 ) ) ( not ( = ?auto_10943 ?auto_10948 ) ) ( IS-CRATE ?auto_10935 ) ( not ( = ?auto_10951 ?auto_10940 ) ) ( HOIST-AT ?auto_10947 ?auto_10951 ) ( AVAILABLE ?auto_10947 ) ( SURFACE-AT ?auto_10935 ?auto_10951 ) ( ON ?auto_10935 ?auto_10950 ) ( CLEAR ?auto_10935 ) ( not ( = ?auto_10934 ?auto_10935 ) ) ( not ( = ?auto_10934 ?auto_10950 ) ) ( not ( = ?auto_10935 ?auto_10950 ) ) ( not ( = ?auto_10943 ?auto_10947 ) ) ( IS-CRATE ?auto_10934 ) ( not ( = ?auto_10955 ?auto_10940 ) ) ( HOIST-AT ?auto_10949 ?auto_10955 ) ( AVAILABLE ?auto_10949 ) ( SURFACE-AT ?auto_10934 ?auto_10955 ) ( ON ?auto_10934 ?auto_10944 ) ( CLEAR ?auto_10934 ) ( not ( = ?auto_10933 ?auto_10934 ) ) ( not ( = ?auto_10933 ?auto_10944 ) ) ( not ( = ?auto_10934 ?auto_10944 ) ) ( not ( = ?auto_10943 ?auto_10949 ) ) ( SURFACE-AT ?auto_10932 ?auto_10940 ) ( CLEAR ?auto_10932 ) ( IS-CRATE ?auto_10933 ) ( AVAILABLE ?auto_10943 ) ( not ( = ?auto_10946 ?auto_10940 ) ) ( HOIST-AT ?auto_10952 ?auto_10946 ) ( AVAILABLE ?auto_10952 ) ( SURFACE-AT ?auto_10933 ?auto_10946 ) ( ON ?auto_10933 ?auto_10945 ) ( CLEAR ?auto_10933 ) ( TRUCK-AT ?auto_10939 ?auto_10940 ) ( not ( = ?auto_10932 ?auto_10933 ) ) ( not ( = ?auto_10932 ?auto_10945 ) ) ( not ( = ?auto_10933 ?auto_10945 ) ) ( not ( = ?auto_10943 ?auto_10952 ) ) ( not ( = ?auto_10932 ?auto_10934 ) ) ( not ( = ?auto_10932 ?auto_10944 ) ) ( not ( = ?auto_10934 ?auto_10945 ) ) ( not ( = ?auto_10955 ?auto_10946 ) ) ( not ( = ?auto_10949 ?auto_10952 ) ) ( not ( = ?auto_10944 ?auto_10945 ) ) ( not ( = ?auto_10932 ?auto_10935 ) ) ( not ( = ?auto_10932 ?auto_10950 ) ) ( not ( = ?auto_10933 ?auto_10935 ) ) ( not ( = ?auto_10933 ?auto_10950 ) ) ( not ( = ?auto_10935 ?auto_10944 ) ) ( not ( = ?auto_10935 ?auto_10945 ) ) ( not ( = ?auto_10951 ?auto_10955 ) ) ( not ( = ?auto_10951 ?auto_10946 ) ) ( not ( = ?auto_10947 ?auto_10949 ) ) ( not ( = ?auto_10947 ?auto_10952 ) ) ( not ( = ?auto_10950 ?auto_10944 ) ) ( not ( = ?auto_10950 ?auto_10945 ) ) ( not ( = ?auto_10932 ?auto_10936 ) ) ( not ( = ?auto_10932 ?auto_10954 ) ) ( not ( = ?auto_10933 ?auto_10936 ) ) ( not ( = ?auto_10933 ?auto_10954 ) ) ( not ( = ?auto_10934 ?auto_10936 ) ) ( not ( = ?auto_10934 ?auto_10954 ) ) ( not ( = ?auto_10936 ?auto_10950 ) ) ( not ( = ?auto_10936 ?auto_10944 ) ) ( not ( = ?auto_10936 ?auto_10945 ) ) ( not ( = ?auto_10953 ?auto_10951 ) ) ( not ( = ?auto_10953 ?auto_10955 ) ) ( not ( = ?auto_10953 ?auto_10946 ) ) ( not ( = ?auto_10948 ?auto_10947 ) ) ( not ( = ?auto_10948 ?auto_10949 ) ) ( not ( = ?auto_10948 ?auto_10952 ) ) ( not ( = ?auto_10954 ?auto_10950 ) ) ( not ( = ?auto_10954 ?auto_10944 ) ) ( not ( = ?auto_10954 ?auto_10945 ) ) ( not ( = ?auto_10932 ?auto_10937 ) ) ( not ( = ?auto_10932 ?auto_10942 ) ) ( not ( = ?auto_10933 ?auto_10937 ) ) ( not ( = ?auto_10933 ?auto_10942 ) ) ( not ( = ?auto_10934 ?auto_10937 ) ) ( not ( = ?auto_10934 ?auto_10942 ) ) ( not ( = ?auto_10935 ?auto_10937 ) ) ( not ( = ?auto_10935 ?auto_10942 ) ) ( not ( = ?auto_10937 ?auto_10954 ) ) ( not ( = ?auto_10937 ?auto_10950 ) ) ( not ( = ?auto_10937 ?auto_10944 ) ) ( not ( = ?auto_10937 ?auto_10945 ) ) ( not ( = ?auto_10938 ?auto_10953 ) ) ( not ( = ?auto_10938 ?auto_10951 ) ) ( not ( = ?auto_10938 ?auto_10955 ) ) ( not ( = ?auto_10938 ?auto_10946 ) ) ( not ( = ?auto_10941 ?auto_10948 ) ) ( not ( = ?auto_10941 ?auto_10947 ) ) ( not ( = ?auto_10941 ?auto_10949 ) ) ( not ( = ?auto_10941 ?auto_10952 ) ) ( not ( = ?auto_10942 ?auto_10954 ) ) ( not ( = ?auto_10942 ?auto_10950 ) ) ( not ( = ?auto_10942 ?auto_10944 ) ) ( not ( = ?auto_10942 ?auto_10945 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_10932 ?auto_10933 ?auto_10934 ?auto_10935 ?auto_10936 )
      ( MAKE-1CRATE ?auto_10936 ?auto_10937 )
      ( MAKE-5CRATE-VERIFY ?auto_10932 ?auto_10933 ?auto_10934 ?auto_10935 ?auto_10936 ?auto_10937 ) )
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
      ?auto_10983 - HOIST
      ?auto_10984 - PLACE
      ?auto_10985 - PLACE
      ?auto_10980 - HOIST
      ?auto_10982 - SURFACE
      ?auto_10986 - PLACE
      ?auto_10989 - HOIST
      ?auto_11000 - SURFACE
      ?auto_10999 - PLACE
      ?auto_10992 - HOIST
      ?auto_10995 - SURFACE
      ?auto_10994 - PLACE
      ?auto_10990 - HOIST
      ?auto_10993 - SURFACE
      ?auto_10987 - PLACE
      ?auto_10991 - HOIST
      ?auto_10998 - SURFACE
      ?auto_10997 - PLACE
      ?auto_10988 - HOIST
      ?auto_10996 - SURFACE
      ?auto_10981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10983 ?auto_10984 ) ( IS-CRATE ?auto_10979 ) ( not ( = ?auto_10985 ?auto_10984 ) ) ( HOIST-AT ?auto_10980 ?auto_10985 ) ( AVAILABLE ?auto_10980 ) ( SURFACE-AT ?auto_10979 ?auto_10985 ) ( ON ?auto_10979 ?auto_10982 ) ( CLEAR ?auto_10979 ) ( not ( = ?auto_10978 ?auto_10979 ) ) ( not ( = ?auto_10978 ?auto_10982 ) ) ( not ( = ?auto_10979 ?auto_10982 ) ) ( not ( = ?auto_10983 ?auto_10980 ) ) ( IS-CRATE ?auto_10978 ) ( not ( = ?auto_10986 ?auto_10984 ) ) ( HOIST-AT ?auto_10989 ?auto_10986 ) ( AVAILABLE ?auto_10989 ) ( SURFACE-AT ?auto_10978 ?auto_10986 ) ( ON ?auto_10978 ?auto_11000 ) ( CLEAR ?auto_10978 ) ( not ( = ?auto_10977 ?auto_10978 ) ) ( not ( = ?auto_10977 ?auto_11000 ) ) ( not ( = ?auto_10978 ?auto_11000 ) ) ( not ( = ?auto_10983 ?auto_10989 ) ) ( IS-CRATE ?auto_10977 ) ( not ( = ?auto_10999 ?auto_10984 ) ) ( HOIST-AT ?auto_10992 ?auto_10999 ) ( AVAILABLE ?auto_10992 ) ( SURFACE-AT ?auto_10977 ?auto_10999 ) ( ON ?auto_10977 ?auto_10995 ) ( CLEAR ?auto_10977 ) ( not ( = ?auto_10976 ?auto_10977 ) ) ( not ( = ?auto_10976 ?auto_10995 ) ) ( not ( = ?auto_10977 ?auto_10995 ) ) ( not ( = ?auto_10983 ?auto_10992 ) ) ( IS-CRATE ?auto_10976 ) ( not ( = ?auto_10994 ?auto_10984 ) ) ( HOIST-AT ?auto_10990 ?auto_10994 ) ( AVAILABLE ?auto_10990 ) ( SURFACE-AT ?auto_10976 ?auto_10994 ) ( ON ?auto_10976 ?auto_10993 ) ( CLEAR ?auto_10976 ) ( not ( = ?auto_10975 ?auto_10976 ) ) ( not ( = ?auto_10975 ?auto_10993 ) ) ( not ( = ?auto_10976 ?auto_10993 ) ) ( not ( = ?auto_10983 ?auto_10990 ) ) ( IS-CRATE ?auto_10975 ) ( not ( = ?auto_10987 ?auto_10984 ) ) ( HOIST-AT ?auto_10991 ?auto_10987 ) ( AVAILABLE ?auto_10991 ) ( SURFACE-AT ?auto_10975 ?auto_10987 ) ( ON ?auto_10975 ?auto_10998 ) ( CLEAR ?auto_10975 ) ( not ( = ?auto_10974 ?auto_10975 ) ) ( not ( = ?auto_10974 ?auto_10998 ) ) ( not ( = ?auto_10975 ?auto_10998 ) ) ( not ( = ?auto_10983 ?auto_10991 ) ) ( SURFACE-AT ?auto_10973 ?auto_10984 ) ( CLEAR ?auto_10973 ) ( IS-CRATE ?auto_10974 ) ( AVAILABLE ?auto_10983 ) ( not ( = ?auto_10997 ?auto_10984 ) ) ( HOIST-AT ?auto_10988 ?auto_10997 ) ( AVAILABLE ?auto_10988 ) ( SURFACE-AT ?auto_10974 ?auto_10997 ) ( ON ?auto_10974 ?auto_10996 ) ( CLEAR ?auto_10974 ) ( TRUCK-AT ?auto_10981 ?auto_10984 ) ( not ( = ?auto_10973 ?auto_10974 ) ) ( not ( = ?auto_10973 ?auto_10996 ) ) ( not ( = ?auto_10974 ?auto_10996 ) ) ( not ( = ?auto_10983 ?auto_10988 ) ) ( not ( = ?auto_10973 ?auto_10975 ) ) ( not ( = ?auto_10973 ?auto_10998 ) ) ( not ( = ?auto_10975 ?auto_10996 ) ) ( not ( = ?auto_10987 ?auto_10997 ) ) ( not ( = ?auto_10991 ?auto_10988 ) ) ( not ( = ?auto_10998 ?auto_10996 ) ) ( not ( = ?auto_10973 ?auto_10976 ) ) ( not ( = ?auto_10973 ?auto_10993 ) ) ( not ( = ?auto_10974 ?auto_10976 ) ) ( not ( = ?auto_10974 ?auto_10993 ) ) ( not ( = ?auto_10976 ?auto_10998 ) ) ( not ( = ?auto_10976 ?auto_10996 ) ) ( not ( = ?auto_10994 ?auto_10987 ) ) ( not ( = ?auto_10994 ?auto_10997 ) ) ( not ( = ?auto_10990 ?auto_10991 ) ) ( not ( = ?auto_10990 ?auto_10988 ) ) ( not ( = ?auto_10993 ?auto_10998 ) ) ( not ( = ?auto_10993 ?auto_10996 ) ) ( not ( = ?auto_10973 ?auto_10977 ) ) ( not ( = ?auto_10973 ?auto_10995 ) ) ( not ( = ?auto_10974 ?auto_10977 ) ) ( not ( = ?auto_10974 ?auto_10995 ) ) ( not ( = ?auto_10975 ?auto_10977 ) ) ( not ( = ?auto_10975 ?auto_10995 ) ) ( not ( = ?auto_10977 ?auto_10993 ) ) ( not ( = ?auto_10977 ?auto_10998 ) ) ( not ( = ?auto_10977 ?auto_10996 ) ) ( not ( = ?auto_10999 ?auto_10994 ) ) ( not ( = ?auto_10999 ?auto_10987 ) ) ( not ( = ?auto_10999 ?auto_10997 ) ) ( not ( = ?auto_10992 ?auto_10990 ) ) ( not ( = ?auto_10992 ?auto_10991 ) ) ( not ( = ?auto_10992 ?auto_10988 ) ) ( not ( = ?auto_10995 ?auto_10993 ) ) ( not ( = ?auto_10995 ?auto_10998 ) ) ( not ( = ?auto_10995 ?auto_10996 ) ) ( not ( = ?auto_10973 ?auto_10978 ) ) ( not ( = ?auto_10973 ?auto_11000 ) ) ( not ( = ?auto_10974 ?auto_10978 ) ) ( not ( = ?auto_10974 ?auto_11000 ) ) ( not ( = ?auto_10975 ?auto_10978 ) ) ( not ( = ?auto_10975 ?auto_11000 ) ) ( not ( = ?auto_10976 ?auto_10978 ) ) ( not ( = ?auto_10976 ?auto_11000 ) ) ( not ( = ?auto_10978 ?auto_10995 ) ) ( not ( = ?auto_10978 ?auto_10993 ) ) ( not ( = ?auto_10978 ?auto_10998 ) ) ( not ( = ?auto_10978 ?auto_10996 ) ) ( not ( = ?auto_10986 ?auto_10999 ) ) ( not ( = ?auto_10986 ?auto_10994 ) ) ( not ( = ?auto_10986 ?auto_10987 ) ) ( not ( = ?auto_10986 ?auto_10997 ) ) ( not ( = ?auto_10989 ?auto_10992 ) ) ( not ( = ?auto_10989 ?auto_10990 ) ) ( not ( = ?auto_10989 ?auto_10991 ) ) ( not ( = ?auto_10989 ?auto_10988 ) ) ( not ( = ?auto_11000 ?auto_10995 ) ) ( not ( = ?auto_11000 ?auto_10993 ) ) ( not ( = ?auto_11000 ?auto_10998 ) ) ( not ( = ?auto_11000 ?auto_10996 ) ) ( not ( = ?auto_10973 ?auto_10979 ) ) ( not ( = ?auto_10973 ?auto_10982 ) ) ( not ( = ?auto_10974 ?auto_10979 ) ) ( not ( = ?auto_10974 ?auto_10982 ) ) ( not ( = ?auto_10975 ?auto_10979 ) ) ( not ( = ?auto_10975 ?auto_10982 ) ) ( not ( = ?auto_10976 ?auto_10979 ) ) ( not ( = ?auto_10976 ?auto_10982 ) ) ( not ( = ?auto_10977 ?auto_10979 ) ) ( not ( = ?auto_10977 ?auto_10982 ) ) ( not ( = ?auto_10979 ?auto_11000 ) ) ( not ( = ?auto_10979 ?auto_10995 ) ) ( not ( = ?auto_10979 ?auto_10993 ) ) ( not ( = ?auto_10979 ?auto_10998 ) ) ( not ( = ?auto_10979 ?auto_10996 ) ) ( not ( = ?auto_10985 ?auto_10986 ) ) ( not ( = ?auto_10985 ?auto_10999 ) ) ( not ( = ?auto_10985 ?auto_10994 ) ) ( not ( = ?auto_10985 ?auto_10987 ) ) ( not ( = ?auto_10985 ?auto_10997 ) ) ( not ( = ?auto_10980 ?auto_10989 ) ) ( not ( = ?auto_10980 ?auto_10992 ) ) ( not ( = ?auto_10980 ?auto_10990 ) ) ( not ( = ?auto_10980 ?auto_10991 ) ) ( not ( = ?auto_10980 ?auto_10988 ) ) ( not ( = ?auto_10982 ?auto_11000 ) ) ( not ( = ?auto_10982 ?auto_10995 ) ) ( not ( = ?auto_10982 ?auto_10993 ) ) ( not ( = ?auto_10982 ?auto_10998 ) ) ( not ( = ?auto_10982 ?auto_10996 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_10973 ?auto_10974 ?auto_10975 ?auto_10976 ?auto_10977 ?auto_10978 )
      ( MAKE-1CRATE ?auto_10978 ?auto_10979 )
      ( MAKE-6CRATE-VERIFY ?auto_10973 ?auto_10974 ?auto_10975 ?auto_10976 ?auto_10977 ?auto_10978 ?auto_10979 ) )
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
      ?auto_11025 - SURFACE
      ?auto_11026 - SURFACE
    )
    :vars
    (
      ?auto_11029 - HOIST
      ?auto_11031 - PLACE
      ?auto_11030 - PLACE
      ?auto_11032 - HOIST
      ?auto_11027 - SURFACE
      ?auto_11040 - PLACE
      ?auto_11039 - HOIST
      ?auto_11035 - SURFACE
      ?auto_11037 - PLACE
      ?auto_11047 - HOIST
      ?auto_11045 - SURFACE
      ?auto_11033 - PLACE
      ?auto_11048 - HOIST
      ?auto_11043 - SURFACE
      ?auto_11041 - PLACE
      ?auto_11034 - HOIST
      ?auto_11050 - SURFACE
      ?auto_11042 - PLACE
      ?auto_11046 - HOIST
      ?auto_11038 - SURFACE
      ?auto_11049 - PLACE
      ?auto_11044 - HOIST
      ?auto_11036 - SURFACE
      ?auto_11028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11029 ?auto_11031 ) ( IS-CRATE ?auto_11026 ) ( not ( = ?auto_11030 ?auto_11031 ) ) ( HOIST-AT ?auto_11032 ?auto_11030 ) ( AVAILABLE ?auto_11032 ) ( SURFACE-AT ?auto_11026 ?auto_11030 ) ( ON ?auto_11026 ?auto_11027 ) ( CLEAR ?auto_11026 ) ( not ( = ?auto_11025 ?auto_11026 ) ) ( not ( = ?auto_11025 ?auto_11027 ) ) ( not ( = ?auto_11026 ?auto_11027 ) ) ( not ( = ?auto_11029 ?auto_11032 ) ) ( IS-CRATE ?auto_11025 ) ( not ( = ?auto_11040 ?auto_11031 ) ) ( HOIST-AT ?auto_11039 ?auto_11040 ) ( AVAILABLE ?auto_11039 ) ( SURFACE-AT ?auto_11025 ?auto_11040 ) ( ON ?auto_11025 ?auto_11035 ) ( CLEAR ?auto_11025 ) ( not ( = ?auto_11024 ?auto_11025 ) ) ( not ( = ?auto_11024 ?auto_11035 ) ) ( not ( = ?auto_11025 ?auto_11035 ) ) ( not ( = ?auto_11029 ?auto_11039 ) ) ( IS-CRATE ?auto_11024 ) ( not ( = ?auto_11037 ?auto_11031 ) ) ( HOIST-AT ?auto_11047 ?auto_11037 ) ( AVAILABLE ?auto_11047 ) ( SURFACE-AT ?auto_11024 ?auto_11037 ) ( ON ?auto_11024 ?auto_11045 ) ( CLEAR ?auto_11024 ) ( not ( = ?auto_11023 ?auto_11024 ) ) ( not ( = ?auto_11023 ?auto_11045 ) ) ( not ( = ?auto_11024 ?auto_11045 ) ) ( not ( = ?auto_11029 ?auto_11047 ) ) ( IS-CRATE ?auto_11023 ) ( not ( = ?auto_11033 ?auto_11031 ) ) ( HOIST-AT ?auto_11048 ?auto_11033 ) ( AVAILABLE ?auto_11048 ) ( SURFACE-AT ?auto_11023 ?auto_11033 ) ( ON ?auto_11023 ?auto_11043 ) ( CLEAR ?auto_11023 ) ( not ( = ?auto_11022 ?auto_11023 ) ) ( not ( = ?auto_11022 ?auto_11043 ) ) ( not ( = ?auto_11023 ?auto_11043 ) ) ( not ( = ?auto_11029 ?auto_11048 ) ) ( IS-CRATE ?auto_11022 ) ( not ( = ?auto_11041 ?auto_11031 ) ) ( HOIST-AT ?auto_11034 ?auto_11041 ) ( AVAILABLE ?auto_11034 ) ( SURFACE-AT ?auto_11022 ?auto_11041 ) ( ON ?auto_11022 ?auto_11050 ) ( CLEAR ?auto_11022 ) ( not ( = ?auto_11021 ?auto_11022 ) ) ( not ( = ?auto_11021 ?auto_11050 ) ) ( not ( = ?auto_11022 ?auto_11050 ) ) ( not ( = ?auto_11029 ?auto_11034 ) ) ( IS-CRATE ?auto_11021 ) ( not ( = ?auto_11042 ?auto_11031 ) ) ( HOIST-AT ?auto_11046 ?auto_11042 ) ( AVAILABLE ?auto_11046 ) ( SURFACE-AT ?auto_11021 ?auto_11042 ) ( ON ?auto_11021 ?auto_11038 ) ( CLEAR ?auto_11021 ) ( not ( = ?auto_11020 ?auto_11021 ) ) ( not ( = ?auto_11020 ?auto_11038 ) ) ( not ( = ?auto_11021 ?auto_11038 ) ) ( not ( = ?auto_11029 ?auto_11046 ) ) ( SURFACE-AT ?auto_11019 ?auto_11031 ) ( CLEAR ?auto_11019 ) ( IS-CRATE ?auto_11020 ) ( AVAILABLE ?auto_11029 ) ( not ( = ?auto_11049 ?auto_11031 ) ) ( HOIST-AT ?auto_11044 ?auto_11049 ) ( AVAILABLE ?auto_11044 ) ( SURFACE-AT ?auto_11020 ?auto_11049 ) ( ON ?auto_11020 ?auto_11036 ) ( CLEAR ?auto_11020 ) ( TRUCK-AT ?auto_11028 ?auto_11031 ) ( not ( = ?auto_11019 ?auto_11020 ) ) ( not ( = ?auto_11019 ?auto_11036 ) ) ( not ( = ?auto_11020 ?auto_11036 ) ) ( not ( = ?auto_11029 ?auto_11044 ) ) ( not ( = ?auto_11019 ?auto_11021 ) ) ( not ( = ?auto_11019 ?auto_11038 ) ) ( not ( = ?auto_11021 ?auto_11036 ) ) ( not ( = ?auto_11042 ?auto_11049 ) ) ( not ( = ?auto_11046 ?auto_11044 ) ) ( not ( = ?auto_11038 ?auto_11036 ) ) ( not ( = ?auto_11019 ?auto_11022 ) ) ( not ( = ?auto_11019 ?auto_11050 ) ) ( not ( = ?auto_11020 ?auto_11022 ) ) ( not ( = ?auto_11020 ?auto_11050 ) ) ( not ( = ?auto_11022 ?auto_11038 ) ) ( not ( = ?auto_11022 ?auto_11036 ) ) ( not ( = ?auto_11041 ?auto_11042 ) ) ( not ( = ?auto_11041 ?auto_11049 ) ) ( not ( = ?auto_11034 ?auto_11046 ) ) ( not ( = ?auto_11034 ?auto_11044 ) ) ( not ( = ?auto_11050 ?auto_11038 ) ) ( not ( = ?auto_11050 ?auto_11036 ) ) ( not ( = ?auto_11019 ?auto_11023 ) ) ( not ( = ?auto_11019 ?auto_11043 ) ) ( not ( = ?auto_11020 ?auto_11023 ) ) ( not ( = ?auto_11020 ?auto_11043 ) ) ( not ( = ?auto_11021 ?auto_11023 ) ) ( not ( = ?auto_11021 ?auto_11043 ) ) ( not ( = ?auto_11023 ?auto_11050 ) ) ( not ( = ?auto_11023 ?auto_11038 ) ) ( not ( = ?auto_11023 ?auto_11036 ) ) ( not ( = ?auto_11033 ?auto_11041 ) ) ( not ( = ?auto_11033 ?auto_11042 ) ) ( not ( = ?auto_11033 ?auto_11049 ) ) ( not ( = ?auto_11048 ?auto_11034 ) ) ( not ( = ?auto_11048 ?auto_11046 ) ) ( not ( = ?auto_11048 ?auto_11044 ) ) ( not ( = ?auto_11043 ?auto_11050 ) ) ( not ( = ?auto_11043 ?auto_11038 ) ) ( not ( = ?auto_11043 ?auto_11036 ) ) ( not ( = ?auto_11019 ?auto_11024 ) ) ( not ( = ?auto_11019 ?auto_11045 ) ) ( not ( = ?auto_11020 ?auto_11024 ) ) ( not ( = ?auto_11020 ?auto_11045 ) ) ( not ( = ?auto_11021 ?auto_11024 ) ) ( not ( = ?auto_11021 ?auto_11045 ) ) ( not ( = ?auto_11022 ?auto_11024 ) ) ( not ( = ?auto_11022 ?auto_11045 ) ) ( not ( = ?auto_11024 ?auto_11043 ) ) ( not ( = ?auto_11024 ?auto_11050 ) ) ( not ( = ?auto_11024 ?auto_11038 ) ) ( not ( = ?auto_11024 ?auto_11036 ) ) ( not ( = ?auto_11037 ?auto_11033 ) ) ( not ( = ?auto_11037 ?auto_11041 ) ) ( not ( = ?auto_11037 ?auto_11042 ) ) ( not ( = ?auto_11037 ?auto_11049 ) ) ( not ( = ?auto_11047 ?auto_11048 ) ) ( not ( = ?auto_11047 ?auto_11034 ) ) ( not ( = ?auto_11047 ?auto_11046 ) ) ( not ( = ?auto_11047 ?auto_11044 ) ) ( not ( = ?auto_11045 ?auto_11043 ) ) ( not ( = ?auto_11045 ?auto_11050 ) ) ( not ( = ?auto_11045 ?auto_11038 ) ) ( not ( = ?auto_11045 ?auto_11036 ) ) ( not ( = ?auto_11019 ?auto_11025 ) ) ( not ( = ?auto_11019 ?auto_11035 ) ) ( not ( = ?auto_11020 ?auto_11025 ) ) ( not ( = ?auto_11020 ?auto_11035 ) ) ( not ( = ?auto_11021 ?auto_11025 ) ) ( not ( = ?auto_11021 ?auto_11035 ) ) ( not ( = ?auto_11022 ?auto_11025 ) ) ( not ( = ?auto_11022 ?auto_11035 ) ) ( not ( = ?auto_11023 ?auto_11025 ) ) ( not ( = ?auto_11023 ?auto_11035 ) ) ( not ( = ?auto_11025 ?auto_11045 ) ) ( not ( = ?auto_11025 ?auto_11043 ) ) ( not ( = ?auto_11025 ?auto_11050 ) ) ( not ( = ?auto_11025 ?auto_11038 ) ) ( not ( = ?auto_11025 ?auto_11036 ) ) ( not ( = ?auto_11040 ?auto_11037 ) ) ( not ( = ?auto_11040 ?auto_11033 ) ) ( not ( = ?auto_11040 ?auto_11041 ) ) ( not ( = ?auto_11040 ?auto_11042 ) ) ( not ( = ?auto_11040 ?auto_11049 ) ) ( not ( = ?auto_11039 ?auto_11047 ) ) ( not ( = ?auto_11039 ?auto_11048 ) ) ( not ( = ?auto_11039 ?auto_11034 ) ) ( not ( = ?auto_11039 ?auto_11046 ) ) ( not ( = ?auto_11039 ?auto_11044 ) ) ( not ( = ?auto_11035 ?auto_11045 ) ) ( not ( = ?auto_11035 ?auto_11043 ) ) ( not ( = ?auto_11035 ?auto_11050 ) ) ( not ( = ?auto_11035 ?auto_11038 ) ) ( not ( = ?auto_11035 ?auto_11036 ) ) ( not ( = ?auto_11019 ?auto_11026 ) ) ( not ( = ?auto_11019 ?auto_11027 ) ) ( not ( = ?auto_11020 ?auto_11026 ) ) ( not ( = ?auto_11020 ?auto_11027 ) ) ( not ( = ?auto_11021 ?auto_11026 ) ) ( not ( = ?auto_11021 ?auto_11027 ) ) ( not ( = ?auto_11022 ?auto_11026 ) ) ( not ( = ?auto_11022 ?auto_11027 ) ) ( not ( = ?auto_11023 ?auto_11026 ) ) ( not ( = ?auto_11023 ?auto_11027 ) ) ( not ( = ?auto_11024 ?auto_11026 ) ) ( not ( = ?auto_11024 ?auto_11027 ) ) ( not ( = ?auto_11026 ?auto_11035 ) ) ( not ( = ?auto_11026 ?auto_11045 ) ) ( not ( = ?auto_11026 ?auto_11043 ) ) ( not ( = ?auto_11026 ?auto_11050 ) ) ( not ( = ?auto_11026 ?auto_11038 ) ) ( not ( = ?auto_11026 ?auto_11036 ) ) ( not ( = ?auto_11030 ?auto_11040 ) ) ( not ( = ?auto_11030 ?auto_11037 ) ) ( not ( = ?auto_11030 ?auto_11033 ) ) ( not ( = ?auto_11030 ?auto_11041 ) ) ( not ( = ?auto_11030 ?auto_11042 ) ) ( not ( = ?auto_11030 ?auto_11049 ) ) ( not ( = ?auto_11032 ?auto_11039 ) ) ( not ( = ?auto_11032 ?auto_11047 ) ) ( not ( = ?auto_11032 ?auto_11048 ) ) ( not ( = ?auto_11032 ?auto_11034 ) ) ( not ( = ?auto_11032 ?auto_11046 ) ) ( not ( = ?auto_11032 ?auto_11044 ) ) ( not ( = ?auto_11027 ?auto_11035 ) ) ( not ( = ?auto_11027 ?auto_11045 ) ) ( not ( = ?auto_11027 ?auto_11043 ) ) ( not ( = ?auto_11027 ?auto_11050 ) ) ( not ( = ?auto_11027 ?auto_11038 ) ) ( not ( = ?auto_11027 ?auto_11036 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_11019 ?auto_11020 ?auto_11021 ?auto_11022 ?auto_11023 ?auto_11024 ?auto_11025 )
      ( MAKE-1CRATE ?auto_11025 ?auto_11026 )
      ( MAKE-7CRATE-VERIFY ?auto_11019 ?auto_11020 ?auto_11021 ?auto_11022 ?auto_11023 ?auto_11024 ?auto_11025 ?auto_11026 ) )
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
      ?auto_11076 - SURFACE
      ?auto_11077 - SURFACE
      ?auto_11078 - SURFACE
    )
    :vars
    (
      ?auto_11082 - HOIST
      ?auto_11081 - PLACE
      ?auto_11083 - PLACE
      ?auto_11084 - HOIST
      ?auto_11079 - SURFACE
      ?auto_11096 - PLACE
      ?auto_11093 - HOIST
      ?auto_11091 - SURFACE
      ?auto_11095 - PLACE
      ?auto_11087 - HOIST
      ?auto_11085 - SURFACE
      ?auto_11104 - PLACE
      ?auto_11098 - HOIST
      ?auto_11086 - SURFACE
      ?auto_11102 - PLACE
      ?auto_11092 - HOIST
      ?auto_11089 - SURFACE
      ?auto_11101 - PLACE
      ?auto_11094 - HOIST
      ?auto_11097 - SURFACE
      ?auto_11088 - PLACE
      ?auto_11103 - HOIST
      ?auto_11105 - SURFACE
      ?auto_11099 - PLACE
      ?auto_11090 - HOIST
      ?auto_11100 - SURFACE
      ?auto_11080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11082 ?auto_11081 ) ( IS-CRATE ?auto_11078 ) ( not ( = ?auto_11083 ?auto_11081 ) ) ( HOIST-AT ?auto_11084 ?auto_11083 ) ( AVAILABLE ?auto_11084 ) ( SURFACE-AT ?auto_11078 ?auto_11083 ) ( ON ?auto_11078 ?auto_11079 ) ( CLEAR ?auto_11078 ) ( not ( = ?auto_11077 ?auto_11078 ) ) ( not ( = ?auto_11077 ?auto_11079 ) ) ( not ( = ?auto_11078 ?auto_11079 ) ) ( not ( = ?auto_11082 ?auto_11084 ) ) ( IS-CRATE ?auto_11077 ) ( not ( = ?auto_11096 ?auto_11081 ) ) ( HOIST-AT ?auto_11093 ?auto_11096 ) ( AVAILABLE ?auto_11093 ) ( SURFACE-AT ?auto_11077 ?auto_11096 ) ( ON ?auto_11077 ?auto_11091 ) ( CLEAR ?auto_11077 ) ( not ( = ?auto_11076 ?auto_11077 ) ) ( not ( = ?auto_11076 ?auto_11091 ) ) ( not ( = ?auto_11077 ?auto_11091 ) ) ( not ( = ?auto_11082 ?auto_11093 ) ) ( IS-CRATE ?auto_11076 ) ( not ( = ?auto_11095 ?auto_11081 ) ) ( HOIST-AT ?auto_11087 ?auto_11095 ) ( AVAILABLE ?auto_11087 ) ( SURFACE-AT ?auto_11076 ?auto_11095 ) ( ON ?auto_11076 ?auto_11085 ) ( CLEAR ?auto_11076 ) ( not ( = ?auto_11075 ?auto_11076 ) ) ( not ( = ?auto_11075 ?auto_11085 ) ) ( not ( = ?auto_11076 ?auto_11085 ) ) ( not ( = ?auto_11082 ?auto_11087 ) ) ( IS-CRATE ?auto_11075 ) ( not ( = ?auto_11104 ?auto_11081 ) ) ( HOIST-AT ?auto_11098 ?auto_11104 ) ( AVAILABLE ?auto_11098 ) ( SURFACE-AT ?auto_11075 ?auto_11104 ) ( ON ?auto_11075 ?auto_11086 ) ( CLEAR ?auto_11075 ) ( not ( = ?auto_11074 ?auto_11075 ) ) ( not ( = ?auto_11074 ?auto_11086 ) ) ( not ( = ?auto_11075 ?auto_11086 ) ) ( not ( = ?auto_11082 ?auto_11098 ) ) ( IS-CRATE ?auto_11074 ) ( not ( = ?auto_11102 ?auto_11081 ) ) ( HOIST-AT ?auto_11092 ?auto_11102 ) ( AVAILABLE ?auto_11092 ) ( SURFACE-AT ?auto_11074 ?auto_11102 ) ( ON ?auto_11074 ?auto_11089 ) ( CLEAR ?auto_11074 ) ( not ( = ?auto_11073 ?auto_11074 ) ) ( not ( = ?auto_11073 ?auto_11089 ) ) ( not ( = ?auto_11074 ?auto_11089 ) ) ( not ( = ?auto_11082 ?auto_11092 ) ) ( IS-CRATE ?auto_11073 ) ( not ( = ?auto_11101 ?auto_11081 ) ) ( HOIST-AT ?auto_11094 ?auto_11101 ) ( AVAILABLE ?auto_11094 ) ( SURFACE-AT ?auto_11073 ?auto_11101 ) ( ON ?auto_11073 ?auto_11097 ) ( CLEAR ?auto_11073 ) ( not ( = ?auto_11072 ?auto_11073 ) ) ( not ( = ?auto_11072 ?auto_11097 ) ) ( not ( = ?auto_11073 ?auto_11097 ) ) ( not ( = ?auto_11082 ?auto_11094 ) ) ( IS-CRATE ?auto_11072 ) ( not ( = ?auto_11088 ?auto_11081 ) ) ( HOIST-AT ?auto_11103 ?auto_11088 ) ( AVAILABLE ?auto_11103 ) ( SURFACE-AT ?auto_11072 ?auto_11088 ) ( ON ?auto_11072 ?auto_11105 ) ( CLEAR ?auto_11072 ) ( not ( = ?auto_11071 ?auto_11072 ) ) ( not ( = ?auto_11071 ?auto_11105 ) ) ( not ( = ?auto_11072 ?auto_11105 ) ) ( not ( = ?auto_11082 ?auto_11103 ) ) ( SURFACE-AT ?auto_11070 ?auto_11081 ) ( CLEAR ?auto_11070 ) ( IS-CRATE ?auto_11071 ) ( AVAILABLE ?auto_11082 ) ( not ( = ?auto_11099 ?auto_11081 ) ) ( HOIST-AT ?auto_11090 ?auto_11099 ) ( AVAILABLE ?auto_11090 ) ( SURFACE-AT ?auto_11071 ?auto_11099 ) ( ON ?auto_11071 ?auto_11100 ) ( CLEAR ?auto_11071 ) ( TRUCK-AT ?auto_11080 ?auto_11081 ) ( not ( = ?auto_11070 ?auto_11071 ) ) ( not ( = ?auto_11070 ?auto_11100 ) ) ( not ( = ?auto_11071 ?auto_11100 ) ) ( not ( = ?auto_11082 ?auto_11090 ) ) ( not ( = ?auto_11070 ?auto_11072 ) ) ( not ( = ?auto_11070 ?auto_11105 ) ) ( not ( = ?auto_11072 ?auto_11100 ) ) ( not ( = ?auto_11088 ?auto_11099 ) ) ( not ( = ?auto_11103 ?auto_11090 ) ) ( not ( = ?auto_11105 ?auto_11100 ) ) ( not ( = ?auto_11070 ?auto_11073 ) ) ( not ( = ?auto_11070 ?auto_11097 ) ) ( not ( = ?auto_11071 ?auto_11073 ) ) ( not ( = ?auto_11071 ?auto_11097 ) ) ( not ( = ?auto_11073 ?auto_11105 ) ) ( not ( = ?auto_11073 ?auto_11100 ) ) ( not ( = ?auto_11101 ?auto_11088 ) ) ( not ( = ?auto_11101 ?auto_11099 ) ) ( not ( = ?auto_11094 ?auto_11103 ) ) ( not ( = ?auto_11094 ?auto_11090 ) ) ( not ( = ?auto_11097 ?auto_11105 ) ) ( not ( = ?auto_11097 ?auto_11100 ) ) ( not ( = ?auto_11070 ?auto_11074 ) ) ( not ( = ?auto_11070 ?auto_11089 ) ) ( not ( = ?auto_11071 ?auto_11074 ) ) ( not ( = ?auto_11071 ?auto_11089 ) ) ( not ( = ?auto_11072 ?auto_11074 ) ) ( not ( = ?auto_11072 ?auto_11089 ) ) ( not ( = ?auto_11074 ?auto_11097 ) ) ( not ( = ?auto_11074 ?auto_11105 ) ) ( not ( = ?auto_11074 ?auto_11100 ) ) ( not ( = ?auto_11102 ?auto_11101 ) ) ( not ( = ?auto_11102 ?auto_11088 ) ) ( not ( = ?auto_11102 ?auto_11099 ) ) ( not ( = ?auto_11092 ?auto_11094 ) ) ( not ( = ?auto_11092 ?auto_11103 ) ) ( not ( = ?auto_11092 ?auto_11090 ) ) ( not ( = ?auto_11089 ?auto_11097 ) ) ( not ( = ?auto_11089 ?auto_11105 ) ) ( not ( = ?auto_11089 ?auto_11100 ) ) ( not ( = ?auto_11070 ?auto_11075 ) ) ( not ( = ?auto_11070 ?auto_11086 ) ) ( not ( = ?auto_11071 ?auto_11075 ) ) ( not ( = ?auto_11071 ?auto_11086 ) ) ( not ( = ?auto_11072 ?auto_11075 ) ) ( not ( = ?auto_11072 ?auto_11086 ) ) ( not ( = ?auto_11073 ?auto_11075 ) ) ( not ( = ?auto_11073 ?auto_11086 ) ) ( not ( = ?auto_11075 ?auto_11089 ) ) ( not ( = ?auto_11075 ?auto_11097 ) ) ( not ( = ?auto_11075 ?auto_11105 ) ) ( not ( = ?auto_11075 ?auto_11100 ) ) ( not ( = ?auto_11104 ?auto_11102 ) ) ( not ( = ?auto_11104 ?auto_11101 ) ) ( not ( = ?auto_11104 ?auto_11088 ) ) ( not ( = ?auto_11104 ?auto_11099 ) ) ( not ( = ?auto_11098 ?auto_11092 ) ) ( not ( = ?auto_11098 ?auto_11094 ) ) ( not ( = ?auto_11098 ?auto_11103 ) ) ( not ( = ?auto_11098 ?auto_11090 ) ) ( not ( = ?auto_11086 ?auto_11089 ) ) ( not ( = ?auto_11086 ?auto_11097 ) ) ( not ( = ?auto_11086 ?auto_11105 ) ) ( not ( = ?auto_11086 ?auto_11100 ) ) ( not ( = ?auto_11070 ?auto_11076 ) ) ( not ( = ?auto_11070 ?auto_11085 ) ) ( not ( = ?auto_11071 ?auto_11076 ) ) ( not ( = ?auto_11071 ?auto_11085 ) ) ( not ( = ?auto_11072 ?auto_11076 ) ) ( not ( = ?auto_11072 ?auto_11085 ) ) ( not ( = ?auto_11073 ?auto_11076 ) ) ( not ( = ?auto_11073 ?auto_11085 ) ) ( not ( = ?auto_11074 ?auto_11076 ) ) ( not ( = ?auto_11074 ?auto_11085 ) ) ( not ( = ?auto_11076 ?auto_11086 ) ) ( not ( = ?auto_11076 ?auto_11089 ) ) ( not ( = ?auto_11076 ?auto_11097 ) ) ( not ( = ?auto_11076 ?auto_11105 ) ) ( not ( = ?auto_11076 ?auto_11100 ) ) ( not ( = ?auto_11095 ?auto_11104 ) ) ( not ( = ?auto_11095 ?auto_11102 ) ) ( not ( = ?auto_11095 ?auto_11101 ) ) ( not ( = ?auto_11095 ?auto_11088 ) ) ( not ( = ?auto_11095 ?auto_11099 ) ) ( not ( = ?auto_11087 ?auto_11098 ) ) ( not ( = ?auto_11087 ?auto_11092 ) ) ( not ( = ?auto_11087 ?auto_11094 ) ) ( not ( = ?auto_11087 ?auto_11103 ) ) ( not ( = ?auto_11087 ?auto_11090 ) ) ( not ( = ?auto_11085 ?auto_11086 ) ) ( not ( = ?auto_11085 ?auto_11089 ) ) ( not ( = ?auto_11085 ?auto_11097 ) ) ( not ( = ?auto_11085 ?auto_11105 ) ) ( not ( = ?auto_11085 ?auto_11100 ) ) ( not ( = ?auto_11070 ?auto_11077 ) ) ( not ( = ?auto_11070 ?auto_11091 ) ) ( not ( = ?auto_11071 ?auto_11077 ) ) ( not ( = ?auto_11071 ?auto_11091 ) ) ( not ( = ?auto_11072 ?auto_11077 ) ) ( not ( = ?auto_11072 ?auto_11091 ) ) ( not ( = ?auto_11073 ?auto_11077 ) ) ( not ( = ?auto_11073 ?auto_11091 ) ) ( not ( = ?auto_11074 ?auto_11077 ) ) ( not ( = ?auto_11074 ?auto_11091 ) ) ( not ( = ?auto_11075 ?auto_11077 ) ) ( not ( = ?auto_11075 ?auto_11091 ) ) ( not ( = ?auto_11077 ?auto_11085 ) ) ( not ( = ?auto_11077 ?auto_11086 ) ) ( not ( = ?auto_11077 ?auto_11089 ) ) ( not ( = ?auto_11077 ?auto_11097 ) ) ( not ( = ?auto_11077 ?auto_11105 ) ) ( not ( = ?auto_11077 ?auto_11100 ) ) ( not ( = ?auto_11096 ?auto_11095 ) ) ( not ( = ?auto_11096 ?auto_11104 ) ) ( not ( = ?auto_11096 ?auto_11102 ) ) ( not ( = ?auto_11096 ?auto_11101 ) ) ( not ( = ?auto_11096 ?auto_11088 ) ) ( not ( = ?auto_11096 ?auto_11099 ) ) ( not ( = ?auto_11093 ?auto_11087 ) ) ( not ( = ?auto_11093 ?auto_11098 ) ) ( not ( = ?auto_11093 ?auto_11092 ) ) ( not ( = ?auto_11093 ?auto_11094 ) ) ( not ( = ?auto_11093 ?auto_11103 ) ) ( not ( = ?auto_11093 ?auto_11090 ) ) ( not ( = ?auto_11091 ?auto_11085 ) ) ( not ( = ?auto_11091 ?auto_11086 ) ) ( not ( = ?auto_11091 ?auto_11089 ) ) ( not ( = ?auto_11091 ?auto_11097 ) ) ( not ( = ?auto_11091 ?auto_11105 ) ) ( not ( = ?auto_11091 ?auto_11100 ) ) ( not ( = ?auto_11070 ?auto_11078 ) ) ( not ( = ?auto_11070 ?auto_11079 ) ) ( not ( = ?auto_11071 ?auto_11078 ) ) ( not ( = ?auto_11071 ?auto_11079 ) ) ( not ( = ?auto_11072 ?auto_11078 ) ) ( not ( = ?auto_11072 ?auto_11079 ) ) ( not ( = ?auto_11073 ?auto_11078 ) ) ( not ( = ?auto_11073 ?auto_11079 ) ) ( not ( = ?auto_11074 ?auto_11078 ) ) ( not ( = ?auto_11074 ?auto_11079 ) ) ( not ( = ?auto_11075 ?auto_11078 ) ) ( not ( = ?auto_11075 ?auto_11079 ) ) ( not ( = ?auto_11076 ?auto_11078 ) ) ( not ( = ?auto_11076 ?auto_11079 ) ) ( not ( = ?auto_11078 ?auto_11091 ) ) ( not ( = ?auto_11078 ?auto_11085 ) ) ( not ( = ?auto_11078 ?auto_11086 ) ) ( not ( = ?auto_11078 ?auto_11089 ) ) ( not ( = ?auto_11078 ?auto_11097 ) ) ( not ( = ?auto_11078 ?auto_11105 ) ) ( not ( = ?auto_11078 ?auto_11100 ) ) ( not ( = ?auto_11083 ?auto_11096 ) ) ( not ( = ?auto_11083 ?auto_11095 ) ) ( not ( = ?auto_11083 ?auto_11104 ) ) ( not ( = ?auto_11083 ?auto_11102 ) ) ( not ( = ?auto_11083 ?auto_11101 ) ) ( not ( = ?auto_11083 ?auto_11088 ) ) ( not ( = ?auto_11083 ?auto_11099 ) ) ( not ( = ?auto_11084 ?auto_11093 ) ) ( not ( = ?auto_11084 ?auto_11087 ) ) ( not ( = ?auto_11084 ?auto_11098 ) ) ( not ( = ?auto_11084 ?auto_11092 ) ) ( not ( = ?auto_11084 ?auto_11094 ) ) ( not ( = ?auto_11084 ?auto_11103 ) ) ( not ( = ?auto_11084 ?auto_11090 ) ) ( not ( = ?auto_11079 ?auto_11091 ) ) ( not ( = ?auto_11079 ?auto_11085 ) ) ( not ( = ?auto_11079 ?auto_11086 ) ) ( not ( = ?auto_11079 ?auto_11089 ) ) ( not ( = ?auto_11079 ?auto_11097 ) ) ( not ( = ?auto_11079 ?auto_11105 ) ) ( not ( = ?auto_11079 ?auto_11100 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_11070 ?auto_11071 ?auto_11072 ?auto_11073 ?auto_11074 ?auto_11075 ?auto_11076 ?auto_11077 )
      ( MAKE-1CRATE ?auto_11077 ?auto_11078 )
      ( MAKE-8CRATE-VERIFY ?auto_11070 ?auto_11071 ?auto_11072 ?auto_11073 ?auto_11074 ?auto_11075 ?auto_11076 ?auto_11077 ?auto_11078 ) )
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
      ?auto_11132 - SURFACE
      ?auto_11133 - SURFACE
      ?auto_11134 - SURFACE
      ?auto_11135 - SURFACE
    )
    :vars
    (
      ?auto_11136 - HOIST
      ?auto_11140 - PLACE
      ?auto_11139 - PLACE
      ?auto_11138 - HOIST
      ?auto_11141 - SURFACE
      ?auto_11158 - PLACE
      ?auto_11146 - HOIST
      ?auto_11143 - SURFACE
      ?auto_11142 - PLACE
      ?auto_11160 - HOIST
      ?auto_11147 - SURFACE
      ?auto_11155 - PLACE
      ?auto_11152 - HOIST
      ?auto_11154 - SURFACE
      ?auto_11161 - SURFACE
      ?auto_11159 - PLACE
      ?auto_11162 - HOIST
      ?auto_11151 - SURFACE
      ?auto_11150 - PLACE
      ?auto_11163 - HOIST
      ?auto_11157 - SURFACE
      ?auto_11153 - PLACE
      ?auto_11145 - HOIST
      ?auto_11144 - SURFACE
      ?auto_11148 - PLACE
      ?auto_11149 - HOIST
      ?auto_11156 - SURFACE
      ?auto_11137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11136 ?auto_11140 ) ( IS-CRATE ?auto_11135 ) ( not ( = ?auto_11139 ?auto_11140 ) ) ( HOIST-AT ?auto_11138 ?auto_11139 ) ( SURFACE-AT ?auto_11135 ?auto_11139 ) ( ON ?auto_11135 ?auto_11141 ) ( CLEAR ?auto_11135 ) ( not ( = ?auto_11134 ?auto_11135 ) ) ( not ( = ?auto_11134 ?auto_11141 ) ) ( not ( = ?auto_11135 ?auto_11141 ) ) ( not ( = ?auto_11136 ?auto_11138 ) ) ( IS-CRATE ?auto_11134 ) ( not ( = ?auto_11158 ?auto_11140 ) ) ( HOIST-AT ?auto_11146 ?auto_11158 ) ( AVAILABLE ?auto_11146 ) ( SURFACE-AT ?auto_11134 ?auto_11158 ) ( ON ?auto_11134 ?auto_11143 ) ( CLEAR ?auto_11134 ) ( not ( = ?auto_11133 ?auto_11134 ) ) ( not ( = ?auto_11133 ?auto_11143 ) ) ( not ( = ?auto_11134 ?auto_11143 ) ) ( not ( = ?auto_11136 ?auto_11146 ) ) ( IS-CRATE ?auto_11133 ) ( not ( = ?auto_11142 ?auto_11140 ) ) ( HOIST-AT ?auto_11160 ?auto_11142 ) ( AVAILABLE ?auto_11160 ) ( SURFACE-AT ?auto_11133 ?auto_11142 ) ( ON ?auto_11133 ?auto_11147 ) ( CLEAR ?auto_11133 ) ( not ( = ?auto_11132 ?auto_11133 ) ) ( not ( = ?auto_11132 ?auto_11147 ) ) ( not ( = ?auto_11133 ?auto_11147 ) ) ( not ( = ?auto_11136 ?auto_11160 ) ) ( IS-CRATE ?auto_11132 ) ( not ( = ?auto_11155 ?auto_11140 ) ) ( HOIST-AT ?auto_11152 ?auto_11155 ) ( AVAILABLE ?auto_11152 ) ( SURFACE-AT ?auto_11132 ?auto_11155 ) ( ON ?auto_11132 ?auto_11154 ) ( CLEAR ?auto_11132 ) ( not ( = ?auto_11131 ?auto_11132 ) ) ( not ( = ?auto_11131 ?auto_11154 ) ) ( not ( = ?auto_11132 ?auto_11154 ) ) ( not ( = ?auto_11136 ?auto_11152 ) ) ( IS-CRATE ?auto_11131 ) ( AVAILABLE ?auto_11138 ) ( SURFACE-AT ?auto_11131 ?auto_11139 ) ( ON ?auto_11131 ?auto_11161 ) ( CLEAR ?auto_11131 ) ( not ( = ?auto_11130 ?auto_11131 ) ) ( not ( = ?auto_11130 ?auto_11161 ) ) ( not ( = ?auto_11131 ?auto_11161 ) ) ( IS-CRATE ?auto_11130 ) ( not ( = ?auto_11159 ?auto_11140 ) ) ( HOIST-AT ?auto_11162 ?auto_11159 ) ( AVAILABLE ?auto_11162 ) ( SURFACE-AT ?auto_11130 ?auto_11159 ) ( ON ?auto_11130 ?auto_11151 ) ( CLEAR ?auto_11130 ) ( not ( = ?auto_11129 ?auto_11130 ) ) ( not ( = ?auto_11129 ?auto_11151 ) ) ( not ( = ?auto_11130 ?auto_11151 ) ) ( not ( = ?auto_11136 ?auto_11162 ) ) ( IS-CRATE ?auto_11129 ) ( not ( = ?auto_11150 ?auto_11140 ) ) ( HOIST-AT ?auto_11163 ?auto_11150 ) ( AVAILABLE ?auto_11163 ) ( SURFACE-AT ?auto_11129 ?auto_11150 ) ( ON ?auto_11129 ?auto_11157 ) ( CLEAR ?auto_11129 ) ( not ( = ?auto_11128 ?auto_11129 ) ) ( not ( = ?auto_11128 ?auto_11157 ) ) ( not ( = ?auto_11129 ?auto_11157 ) ) ( not ( = ?auto_11136 ?auto_11163 ) ) ( IS-CRATE ?auto_11128 ) ( not ( = ?auto_11153 ?auto_11140 ) ) ( HOIST-AT ?auto_11145 ?auto_11153 ) ( AVAILABLE ?auto_11145 ) ( SURFACE-AT ?auto_11128 ?auto_11153 ) ( ON ?auto_11128 ?auto_11144 ) ( CLEAR ?auto_11128 ) ( not ( = ?auto_11127 ?auto_11128 ) ) ( not ( = ?auto_11127 ?auto_11144 ) ) ( not ( = ?auto_11128 ?auto_11144 ) ) ( not ( = ?auto_11136 ?auto_11145 ) ) ( SURFACE-AT ?auto_11126 ?auto_11140 ) ( CLEAR ?auto_11126 ) ( IS-CRATE ?auto_11127 ) ( AVAILABLE ?auto_11136 ) ( not ( = ?auto_11148 ?auto_11140 ) ) ( HOIST-AT ?auto_11149 ?auto_11148 ) ( AVAILABLE ?auto_11149 ) ( SURFACE-AT ?auto_11127 ?auto_11148 ) ( ON ?auto_11127 ?auto_11156 ) ( CLEAR ?auto_11127 ) ( TRUCK-AT ?auto_11137 ?auto_11140 ) ( not ( = ?auto_11126 ?auto_11127 ) ) ( not ( = ?auto_11126 ?auto_11156 ) ) ( not ( = ?auto_11127 ?auto_11156 ) ) ( not ( = ?auto_11136 ?auto_11149 ) ) ( not ( = ?auto_11126 ?auto_11128 ) ) ( not ( = ?auto_11126 ?auto_11144 ) ) ( not ( = ?auto_11128 ?auto_11156 ) ) ( not ( = ?auto_11153 ?auto_11148 ) ) ( not ( = ?auto_11145 ?auto_11149 ) ) ( not ( = ?auto_11144 ?auto_11156 ) ) ( not ( = ?auto_11126 ?auto_11129 ) ) ( not ( = ?auto_11126 ?auto_11157 ) ) ( not ( = ?auto_11127 ?auto_11129 ) ) ( not ( = ?auto_11127 ?auto_11157 ) ) ( not ( = ?auto_11129 ?auto_11144 ) ) ( not ( = ?auto_11129 ?auto_11156 ) ) ( not ( = ?auto_11150 ?auto_11153 ) ) ( not ( = ?auto_11150 ?auto_11148 ) ) ( not ( = ?auto_11163 ?auto_11145 ) ) ( not ( = ?auto_11163 ?auto_11149 ) ) ( not ( = ?auto_11157 ?auto_11144 ) ) ( not ( = ?auto_11157 ?auto_11156 ) ) ( not ( = ?auto_11126 ?auto_11130 ) ) ( not ( = ?auto_11126 ?auto_11151 ) ) ( not ( = ?auto_11127 ?auto_11130 ) ) ( not ( = ?auto_11127 ?auto_11151 ) ) ( not ( = ?auto_11128 ?auto_11130 ) ) ( not ( = ?auto_11128 ?auto_11151 ) ) ( not ( = ?auto_11130 ?auto_11157 ) ) ( not ( = ?auto_11130 ?auto_11144 ) ) ( not ( = ?auto_11130 ?auto_11156 ) ) ( not ( = ?auto_11159 ?auto_11150 ) ) ( not ( = ?auto_11159 ?auto_11153 ) ) ( not ( = ?auto_11159 ?auto_11148 ) ) ( not ( = ?auto_11162 ?auto_11163 ) ) ( not ( = ?auto_11162 ?auto_11145 ) ) ( not ( = ?auto_11162 ?auto_11149 ) ) ( not ( = ?auto_11151 ?auto_11157 ) ) ( not ( = ?auto_11151 ?auto_11144 ) ) ( not ( = ?auto_11151 ?auto_11156 ) ) ( not ( = ?auto_11126 ?auto_11131 ) ) ( not ( = ?auto_11126 ?auto_11161 ) ) ( not ( = ?auto_11127 ?auto_11131 ) ) ( not ( = ?auto_11127 ?auto_11161 ) ) ( not ( = ?auto_11128 ?auto_11131 ) ) ( not ( = ?auto_11128 ?auto_11161 ) ) ( not ( = ?auto_11129 ?auto_11131 ) ) ( not ( = ?auto_11129 ?auto_11161 ) ) ( not ( = ?auto_11131 ?auto_11151 ) ) ( not ( = ?auto_11131 ?auto_11157 ) ) ( not ( = ?auto_11131 ?auto_11144 ) ) ( not ( = ?auto_11131 ?auto_11156 ) ) ( not ( = ?auto_11139 ?auto_11159 ) ) ( not ( = ?auto_11139 ?auto_11150 ) ) ( not ( = ?auto_11139 ?auto_11153 ) ) ( not ( = ?auto_11139 ?auto_11148 ) ) ( not ( = ?auto_11138 ?auto_11162 ) ) ( not ( = ?auto_11138 ?auto_11163 ) ) ( not ( = ?auto_11138 ?auto_11145 ) ) ( not ( = ?auto_11138 ?auto_11149 ) ) ( not ( = ?auto_11161 ?auto_11151 ) ) ( not ( = ?auto_11161 ?auto_11157 ) ) ( not ( = ?auto_11161 ?auto_11144 ) ) ( not ( = ?auto_11161 ?auto_11156 ) ) ( not ( = ?auto_11126 ?auto_11132 ) ) ( not ( = ?auto_11126 ?auto_11154 ) ) ( not ( = ?auto_11127 ?auto_11132 ) ) ( not ( = ?auto_11127 ?auto_11154 ) ) ( not ( = ?auto_11128 ?auto_11132 ) ) ( not ( = ?auto_11128 ?auto_11154 ) ) ( not ( = ?auto_11129 ?auto_11132 ) ) ( not ( = ?auto_11129 ?auto_11154 ) ) ( not ( = ?auto_11130 ?auto_11132 ) ) ( not ( = ?auto_11130 ?auto_11154 ) ) ( not ( = ?auto_11132 ?auto_11161 ) ) ( not ( = ?auto_11132 ?auto_11151 ) ) ( not ( = ?auto_11132 ?auto_11157 ) ) ( not ( = ?auto_11132 ?auto_11144 ) ) ( not ( = ?auto_11132 ?auto_11156 ) ) ( not ( = ?auto_11155 ?auto_11139 ) ) ( not ( = ?auto_11155 ?auto_11159 ) ) ( not ( = ?auto_11155 ?auto_11150 ) ) ( not ( = ?auto_11155 ?auto_11153 ) ) ( not ( = ?auto_11155 ?auto_11148 ) ) ( not ( = ?auto_11152 ?auto_11138 ) ) ( not ( = ?auto_11152 ?auto_11162 ) ) ( not ( = ?auto_11152 ?auto_11163 ) ) ( not ( = ?auto_11152 ?auto_11145 ) ) ( not ( = ?auto_11152 ?auto_11149 ) ) ( not ( = ?auto_11154 ?auto_11161 ) ) ( not ( = ?auto_11154 ?auto_11151 ) ) ( not ( = ?auto_11154 ?auto_11157 ) ) ( not ( = ?auto_11154 ?auto_11144 ) ) ( not ( = ?auto_11154 ?auto_11156 ) ) ( not ( = ?auto_11126 ?auto_11133 ) ) ( not ( = ?auto_11126 ?auto_11147 ) ) ( not ( = ?auto_11127 ?auto_11133 ) ) ( not ( = ?auto_11127 ?auto_11147 ) ) ( not ( = ?auto_11128 ?auto_11133 ) ) ( not ( = ?auto_11128 ?auto_11147 ) ) ( not ( = ?auto_11129 ?auto_11133 ) ) ( not ( = ?auto_11129 ?auto_11147 ) ) ( not ( = ?auto_11130 ?auto_11133 ) ) ( not ( = ?auto_11130 ?auto_11147 ) ) ( not ( = ?auto_11131 ?auto_11133 ) ) ( not ( = ?auto_11131 ?auto_11147 ) ) ( not ( = ?auto_11133 ?auto_11154 ) ) ( not ( = ?auto_11133 ?auto_11161 ) ) ( not ( = ?auto_11133 ?auto_11151 ) ) ( not ( = ?auto_11133 ?auto_11157 ) ) ( not ( = ?auto_11133 ?auto_11144 ) ) ( not ( = ?auto_11133 ?auto_11156 ) ) ( not ( = ?auto_11142 ?auto_11155 ) ) ( not ( = ?auto_11142 ?auto_11139 ) ) ( not ( = ?auto_11142 ?auto_11159 ) ) ( not ( = ?auto_11142 ?auto_11150 ) ) ( not ( = ?auto_11142 ?auto_11153 ) ) ( not ( = ?auto_11142 ?auto_11148 ) ) ( not ( = ?auto_11160 ?auto_11152 ) ) ( not ( = ?auto_11160 ?auto_11138 ) ) ( not ( = ?auto_11160 ?auto_11162 ) ) ( not ( = ?auto_11160 ?auto_11163 ) ) ( not ( = ?auto_11160 ?auto_11145 ) ) ( not ( = ?auto_11160 ?auto_11149 ) ) ( not ( = ?auto_11147 ?auto_11154 ) ) ( not ( = ?auto_11147 ?auto_11161 ) ) ( not ( = ?auto_11147 ?auto_11151 ) ) ( not ( = ?auto_11147 ?auto_11157 ) ) ( not ( = ?auto_11147 ?auto_11144 ) ) ( not ( = ?auto_11147 ?auto_11156 ) ) ( not ( = ?auto_11126 ?auto_11134 ) ) ( not ( = ?auto_11126 ?auto_11143 ) ) ( not ( = ?auto_11127 ?auto_11134 ) ) ( not ( = ?auto_11127 ?auto_11143 ) ) ( not ( = ?auto_11128 ?auto_11134 ) ) ( not ( = ?auto_11128 ?auto_11143 ) ) ( not ( = ?auto_11129 ?auto_11134 ) ) ( not ( = ?auto_11129 ?auto_11143 ) ) ( not ( = ?auto_11130 ?auto_11134 ) ) ( not ( = ?auto_11130 ?auto_11143 ) ) ( not ( = ?auto_11131 ?auto_11134 ) ) ( not ( = ?auto_11131 ?auto_11143 ) ) ( not ( = ?auto_11132 ?auto_11134 ) ) ( not ( = ?auto_11132 ?auto_11143 ) ) ( not ( = ?auto_11134 ?auto_11147 ) ) ( not ( = ?auto_11134 ?auto_11154 ) ) ( not ( = ?auto_11134 ?auto_11161 ) ) ( not ( = ?auto_11134 ?auto_11151 ) ) ( not ( = ?auto_11134 ?auto_11157 ) ) ( not ( = ?auto_11134 ?auto_11144 ) ) ( not ( = ?auto_11134 ?auto_11156 ) ) ( not ( = ?auto_11158 ?auto_11142 ) ) ( not ( = ?auto_11158 ?auto_11155 ) ) ( not ( = ?auto_11158 ?auto_11139 ) ) ( not ( = ?auto_11158 ?auto_11159 ) ) ( not ( = ?auto_11158 ?auto_11150 ) ) ( not ( = ?auto_11158 ?auto_11153 ) ) ( not ( = ?auto_11158 ?auto_11148 ) ) ( not ( = ?auto_11146 ?auto_11160 ) ) ( not ( = ?auto_11146 ?auto_11152 ) ) ( not ( = ?auto_11146 ?auto_11138 ) ) ( not ( = ?auto_11146 ?auto_11162 ) ) ( not ( = ?auto_11146 ?auto_11163 ) ) ( not ( = ?auto_11146 ?auto_11145 ) ) ( not ( = ?auto_11146 ?auto_11149 ) ) ( not ( = ?auto_11143 ?auto_11147 ) ) ( not ( = ?auto_11143 ?auto_11154 ) ) ( not ( = ?auto_11143 ?auto_11161 ) ) ( not ( = ?auto_11143 ?auto_11151 ) ) ( not ( = ?auto_11143 ?auto_11157 ) ) ( not ( = ?auto_11143 ?auto_11144 ) ) ( not ( = ?auto_11143 ?auto_11156 ) ) ( not ( = ?auto_11126 ?auto_11135 ) ) ( not ( = ?auto_11126 ?auto_11141 ) ) ( not ( = ?auto_11127 ?auto_11135 ) ) ( not ( = ?auto_11127 ?auto_11141 ) ) ( not ( = ?auto_11128 ?auto_11135 ) ) ( not ( = ?auto_11128 ?auto_11141 ) ) ( not ( = ?auto_11129 ?auto_11135 ) ) ( not ( = ?auto_11129 ?auto_11141 ) ) ( not ( = ?auto_11130 ?auto_11135 ) ) ( not ( = ?auto_11130 ?auto_11141 ) ) ( not ( = ?auto_11131 ?auto_11135 ) ) ( not ( = ?auto_11131 ?auto_11141 ) ) ( not ( = ?auto_11132 ?auto_11135 ) ) ( not ( = ?auto_11132 ?auto_11141 ) ) ( not ( = ?auto_11133 ?auto_11135 ) ) ( not ( = ?auto_11133 ?auto_11141 ) ) ( not ( = ?auto_11135 ?auto_11143 ) ) ( not ( = ?auto_11135 ?auto_11147 ) ) ( not ( = ?auto_11135 ?auto_11154 ) ) ( not ( = ?auto_11135 ?auto_11161 ) ) ( not ( = ?auto_11135 ?auto_11151 ) ) ( not ( = ?auto_11135 ?auto_11157 ) ) ( not ( = ?auto_11135 ?auto_11144 ) ) ( not ( = ?auto_11135 ?auto_11156 ) ) ( not ( = ?auto_11141 ?auto_11143 ) ) ( not ( = ?auto_11141 ?auto_11147 ) ) ( not ( = ?auto_11141 ?auto_11154 ) ) ( not ( = ?auto_11141 ?auto_11161 ) ) ( not ( = ?auto_11141 ?auto_11151 ) ) ( not ( = ?auto_11141 ?auto_11157 ) ) ( not ( = ?auto_11141 ?auto_11144 ) ) ( not ( = ?auto_11141 ?auto_11156 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_11126 ?auto_11127 ?auto_11128 ?auto_11129 ?auto_11130 ?auto_11131 ?auto_11132 ?auto_11133 ?auto_11134 )
      ( MAKE-1CRATE ?auto_11134 ?auto_11135 )
      ( MAKE-9CRATE-VERIFY ?auto_11126 ?auto_11127 ?auto_11128 ?auto_11129 ?auto_11130 ?auto_11131 ?auto_11132 ?auto_11133 ?auto_11134 ?auto_11135 ) )
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
      ?auto_11191 - SURFACE
      ?auto_11192 - SURFACE
      ?auto_11193 - SURFACE
      ?auto_11194 - SURFACE
      ?auto_11195 - SURFACE
    )
    :vars
    (
      ?auto_11196 - HOIST
      ?auto_11199 - PLACE
      ?auto_11201 - PLACE
      ?auto_11200 - HOIST
      ?auto_11198 - SURFACE
      ?auto_11219 - PLACE
      ?auto_11216 - HOIST
      ?auto_11207 - SURFACE
      ?auto_11215 - PLACE
      ?auto_11221 - HOIST
      ?auto_11210 - SURFACE
      ?auto_11218 - PLACE
      ?auto_11208 - HOIST
      ?auto_11222 - SURFACE
      ?auto_11214 - PLACE
      ?auto_11213 - HOIST
      ?auto_11223 - SURFACE
      ?auto_11211 - SURFACE
      ?auto_11202 - PLACE
      ?auto_11212 - HOIST
      ?auto_11224 - SURFACE
      ?auto_11209 - SURFACE
      ?auto_11205 - PLACE
      ?auto_11206 - HOIST
      ?auto_11203 - SURFACE
      ?auto_11220 - PLACE
      ?auto_11204 - HOIST
      ?auto_11217 - SURFACE
      ?auto_11197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11196 ?auto_11199 ) ( IS-CRATE ?auto_11195 ) ( not ( = ?auto_11201 ?auto_11199 ) ) ( HOIST-AT ?auto_11200 ?auto_11201 ) ( SURFACE-AT ?auto_11195 ?auto_11201 ) ( ON ?auto_11195 ?auto_11198 ) ( CLEAR ?auto_11195 ) ( not ( = ?auto_11194 ?auto_11195 ) ) ( not ( = ?auto_11194 ?auto_11198 ) ) ( not ( = ?auto_11195 ?auto_11198 ) ) ( not ( = ?auto_11196 ?auto_11200 ) ) ( IS-CRATE ?auto_11194 ) ( not ( = ?auto_11219 ?auto_11199 ) ) ( HOIST-AT ?auto_11216 ?auto_11219 ) ( SURFACE-AT ?auto_11194 ?auto_11219 ) ( ON ?auto_11194 ?auto_11207 ) ( CLEAR ?auto_11194 ) ( not ( = ?auto_11193 ?auto_11194 ) ) ( not ( = ?auto_11193 ?auto_11207 ) ) ( not ( = ?auto_11194 ?auto_11207 ) ) ( not ( = ?auto_11196 ?auto_11216 ) ) ( IS-CRATE ?auto_11193 ) ( not ( = ?auto_11215 ?auto_11199 ) ) ( HOIST-AT ?auto_11221 ?auto_11215 ) ( AVAILABLE ?auto_11221 ) ( SURFACE-AT ?auto_11193 ?auto_11215 ) ( ON ?auto_11193 ?auto_11210 ) ( CLEAR ?auto_11193 ) ( not ( = ?auto_11192 ?auto_11193 ) ) ( not ( = ?auto_11192 ?auto_11210 ) ) ( not ( = ?auto_11193 ?auto_11210 ) ) ( not ( = ?auto_11196 ?auto_11221 ) ) ( IS-CRATE ?auto_11192 ) ( not ( = ?auto_11218 ?auto_11199 ) ) ( HOIST-AT ?auto_11208 ?auto_11218 ) ( AVAILABLE ?auto_11208 ) ( SURFACE-AT ?auto_11192 ?auto_11218 ) ( ON ?auto_11192 ?auto_11222 ) ( CLEAR ?auto_11192 ) ( not ( = ?auto_11191 ?auto_11192 ) ) ( not ( = ?auto_11191 ?auto_11222 ) ) ( not ( = ?auto_11192 ?auto_11222 ) ) ( not ( = ?auto_11196 ?auto_11208 ) ) ( IS-CRATE ?auto_11191 ) ( not ( = ?auto_11214 ?auto_11199 ) ) ( HOIST-AT ?auto_11213 ?auto_11214 ) ( AVAILABLE ?auto_11213 ) ( SURFACE-AT ?auto_11191 ?auto_11214 ) ( ON ?auto_11191 ?auto_11223 ) ( CLEAR ?auto_11191 ) ( not ( = ?auto_11190 ?auto_11191 ) ) ( not ( = ?auto_11190 ?auto_11223 ) ) ( not ( = ?auto_11191 ?auto_11223 ) ) ( not ( = ?auto_11196 ?auto_11213 ) ) ( IS-CRATE ?auto_11190 ) ( AVAILABLE ?auto_11216 ) ( SURFACE-AT ?auto_11190 ?auto_11219 ) ( ON ?auto_11190 ?auto_11211 ) ( CLEAR ?auto_11190 ) ( not ( = ?auto_11189 ?auto_11190 ) ) ( not ( = ?auto_11189 ?auto_11211 ) ) ( not ( = ?auto_11190 ?auto_11211 ) ) ( IS-CRATE ?auto_11189 ) ( not ( = ?auto_11202 ?auto_11199 ) ) ( HOIST-AT ?auto_11212 ?auto_11202 ) ( AVAILABLE ?auto_11212 ) ( SURFACE-AT ?auto_11189 ?auto_11202 ) ( ON ?auto_11189 ?auto_11224 ) ( CLEAR ?auto_11189 ) ( not ( = ?auto_11188 ?auto_11189 ) ) ( not ( = ?auto_11188 ?auto_11224 ) ) ( not ( = ?auto_11189 ?auto_11224 ) ) ( not ( = ?auto_11196 ?auto_11212 ) ) ( IS-CRATE ?auto_11188 ) ( AVAILABLE ?auto_11200 ) ( SURFACE-AT ?auto_11188 ?auto_11201 ) ( ON ?auto_11188 ?auto_11209 ) ( CLEAR ?auto_11188 ) ( not ( = ?auto_11187 ?auto_11188 ) ) ( not ( = ?auto_11187 ?auto_11209 ) ) ( not ( = ?auto_11188 ?auto_11209 ) ) ( IS-CRATE ?auto_11187 ) ( not ( = ?auto_11205 ?auto_11199 ) ) ( HOIST-AT ?auto_11206 ?auto_11205 ) ( AVAILABLE ?auto_11206 ) ( SURFACE-AT ?auto_11187 ?auto_11205 ) ( ON ?auto_11187 ?auto_11203 ) ( CLEAR ?auto_11187 ) ( not ( = ?auto_11186 ?auto_11187 ) ) ( not ( = ?auto_11186 ?auto_11203 ) ) ( not ( = ?auto_11187 ?auto_11203 ) ) ( not ( = ?auto_11196 ?auto_11206 ) ) ( SURFACE-AT ?auto_11185 ?auto_11199 ) ( CLEAR ?auto_11185 ) ( IS-CRATE ?auto_11186 ) ( AVAILABLE ?auto_11196 ) ( not ( = ?auto_11220 ?auto_11199 ) ) ( HOIST-AT ?auto_11204 ?auto_11220 ) ( AVAILABLE ?auto_11204 ) ( SURFACE-AT ?auto_11186 ?auto_11220 ) ( ON ?auto_11186 ?auto_11217 ) ( CLEAR ?auto_11186 ) ( TRUCK-AT ?auto_11197 ?auto_11199 ) ( not ( = ?auto_11185 ?auto_11186 ) ) ( not ( = ?auto_11185 ?auto_11217 ) ) ( not ( = ?auto_11186 ?auto_11217 ) ) ( not ( = ?auto_11196 ?auto_11204 ) ) ( not ( = ?auto_11185 ?auto_11187 ) ) ( not ( = ?auto_11185 ?auto_11203 ) ) ( not ( = ?auto_11187 ?auto_11217 ) ) ( not ( = ?auto_11205 ?auto_11220 ) ) ( not ( = ?auto_11206 ?auto_11204 ) ) ( not ( = ?auto_11203 ?auto_11217 ) ) ( not ( = ?auto_11185 ?auto_11188 ) ) ( not ( = ?auto_11185 ?auto_11209 ) ) ( not ( = ?auto_11186 ?auto_11188 ) ) ( not ( = ?auto_11186 ?auto_11209 ) ) ( not ( = ?auto_11188 ?auto_11203 ) ) ( not ( = ?auto_11188 ?auto_11217 ) ) ( not ( = ?auto_11201 ?auto_11205 ) ) ( not ( = ?auto_11201 ?auto_11220 ) ) ( not ( = ?auto_11200 ?auto_11206 ) ) ( not ( = ?auto_11200 ?auto_11204 ) ) ( not ( = ?auto_11209 ?auto_11203 ) ) ( not ( = ?auto_11209 ?auto_11217 ) ) ( not ( = ?auto_11185 ?auto_11189 ) ) ( not ( = ?auto_11185 ?auto_11224 ) ) ( not ( = ?auto_11186 ?auto_11189 ) ) ( not ( = ?auto_11186 ?auto_11224 ) ) ( not ( = ?auto_11187 ?auto_11189 ) ) ( not ( = ?auto_11187 ?auto_11224 ) ) ( not ( = ?auto_11189 ?auto_11209 ) ) ( not ( = ?auto_11189 ?auto_11203 ) ) ( not ( = ?auto_11189 ?auto_11217 ) ) ( not ( = ?auto_11202 ?auto_11201 ) ) ( not ( = ?auto_11202 ?auto_11205 ) ) ( not ( = ?auto_11202 ?auto_11220 ) ) ( not ( = ?auto_11212 ?auto_11200 ) ) ( not ( = ?auto_11212 ?auto_11206 ) ) ( not ( = ?auto_11212 ?auto_11204 ) ) ( not ( = ?auto_11224 ?auto_11209 ) ) ( not ( = ?auto_11224 ?auto_11203 ) ) ( not ( = ?auto_11224 ?auto_11217 ) ) ( not ( = ?auto_11185 ?auto_11190 ) ) ( not ( = ?auto_11185 ?auto_11211 ) ) ( not ( = ?auto_11186 ?auto_11190 ) ) ( not ( = ?auto_11186 ?auto_11211 ) ) ( not ( = ?auto_11187 ?auto_11190 ) ) ( not ( = ?auto_11187 ?auto_11211 ) ) ( not ( = ?auto_11188 ?auto_11190 ) ) ( not ( = ?auto_11188 ?auto_11211 ) ) ( not ( = ?auto_11190 ?auto_11224 ) ) ( not ( = ?auto_11190 ?auto_11209 ) ) ( not ( = ?auto_11190 ?auto_11203 ) ) ( not ( = ?auto_11190 ?auto_11217 ) ) ( not ( = ?auto_11219 ?auto_11202 ) ) ( not ( = ?auto_11219 ?auto_11201 ) ) ( not ( = ?auto_11219 ?auto_11205 ) ) ( not ( = ?auto_11219 ?auto_11220 ) ) ( not ( = ?auto_11216 ?auto_11212 ) ) ( not ( = ?auto_11216 ?auto_11200 ) ) ( not ( = ?auto_11216 ?auto_11206 ) ) ( not ( = ?auto_11216 ?auto_11204 ) ) ( not ( = ?auto_11211 ?auto_11224 ) ) ( not ( = ?auto_11211 ?auto_11209 ) ) ( not ( = ?auto_11211 ?auto_11203 ) ) ( not ( = ?auto_11211 ?auto_11217 ) ) ( not ( = ?auto_11185 ?auto_11191 ) ) ( not ( = ?auto_11185 ?auto_11223 ) ) ( not ( = ?auto_11186 ?auto_11191 ) ) ( not ( = ?auto_11186 ?auto_11223 ) ) ( not ( = ?auto_11187 ?auto_11191 ) ) ( not ( = ?auto_11187 ?auto_11223 ) ) ( not ( = ?auto_11188 ?auto_11191 ) ) ( not ( = ?auto_11188 ?auto_11223 ) ) ( not ( = ?auto_11189 ?auto_11191 ) ) ( not ( = ?auto_11189 ?auto_11223 ) ) ( not ( = ?auto_11191 ?auto_11211 ) ) ( not ( = ?auto_11191 ?auto_11224 ) ) ( not ( = ?auto_11191 ?auto_11209 ) ) ( not ( = ?auto_11191 ?auto_11203 ) ) ( not ( = ?auto_11191 ?auto_11217 ) ) ( not ( = ?auto_11214 ?auto_11219 ) ) ( not ( = ?auto_11214 ?auto_11202 ) ) ( not ( = ?auto_11214 ?auto_11201 ) ) ( not ( = ?auto_11214 ?auto_11205 ) ) ( not ( = ?auto_11214 ?auto_11220 ) ) ( not ( = ?auto_11213 ?auto_11216 ) ) ( not ( = ?auto_11213 ?auto_11212 ) ) ( not ( = ?auto_11213 ?auto_11200 ) ) ( not ( = ?auto_11213 ?auto_11206 ) ) ( not ( = ?auto_11213 ?auto_11204 ) ) ( not ( = ?auto_11223 ?auto_11211 ) ) ( not ( = ?auto_11223 ?auto_11224 ) ) ( not ( = ?auto_11223 ?auto_11209 ) ) ( not ( = ?auto_11223 ?auto_11203 ) ) ( not ( = ?auto_11223 ?auto_11217 ) ) ( not ( = ?auto_11185 ?auto_11192 ) ) ( not ( = ?auto_11185 ?auto_11222 ) ) ( not ( = ?auto_11186 ?auto_11192 ) ) ( not ( = ?auto_11186 ?auto_11222 ) ) ( not ( = ?auto_11187 ?auto_11192 ) ) ( not ( = ?auto_11187 ?auto_11222 ) ) ( not ( = ?auto_11188 ?auto_11192 ) ) ( not ( = ?auto_11188 ?auto_11222 ) ) ( not ( = ?auto_11189 ?auto_11192 ) ) ( not ( = ?auto_11189 ?auto_11222 ) ) ( not ( = ?auto_11190 ?auto_11192 ) ) ( not ( = ?auto_11190 ?auto_11222 ) ) ( not ( = ?auto_11192 ?auto_11223 ) ) ( not ( = ?auto_11192 ?auto_11211 ) ) ( not ( = ?auto_11192 ?auto_11224 ) ) ( not ( = ?auto_11192 ?auto_11209 ) ) ( not ( = ?auto_11192 ?auto_11203 ) ) ( not ( = ?auto_11192 ?auto_11217 ) ) ( not ( = ?auto_11218 ?auto_11214 ) ) ( not ( = ?auto_11218 ?auto_11219 ) ) ( not ( = ?auto_11218 ?auto_11202 ) ) ( not ( = ?auto_11218 ?auto_11201 ) ) ( not ( = ?auto_11218 ?auto_11205 ) ) ( not ( = ?auto_11218 ?auto_11220 ) ) ( not ( = ?auto_11208 ?auto_11213 ) ) ( not ( = ?auto_11208 ?auto_11216 ) ) ( not ( = ?auto_11208 ?auto_11212 ) ) ( not ( = ?auto_11208 ?auto_11200 ) ) ( not ( = ?auto_11208 ?auto_11206 ) ) ( not ( = ?auto_11208 ?auto_11204 ) ) ( not ( = ?auto_11222 ?auto_11223 ) ) ( not ( = ?auto_11222 ?auto_11211 ) ) ( not ( = ?auto_11222 ?auto_11224 ) ) ( not ( = ?auto_11222 ?auto_11209 ) ) ( not ( = ?auto_11222 ?auto_11203 ) ) ( not ( = ?auto_11222 ?auto_11217 ) ) ( not ( = ?auto_11185 ?auto_11193 ) ) ( not ( = ?auto_11185 ?auto_11210 ) ) ( not ( = ?auto_11186 ?auto_11193 ) ) ( not ( = ?auto_11186 ?auto_11210 ) ) ( not ( = ?auto_11187 ?auto_11193 ) ) ( not ( = ?auto_11187 ?auto_11210 ) ) ( not ( = ?auto_11188 ?auto_11193 ) ) ( not ( = ?auto_11188 ?auto_11210 ) ) ( not ( = ?auto_11189 ?auto_11193 ) ) ( not ( = ?auto_11189 ?auto_11210 ) ) ( not ( = ?auto_11190 ?auto_11193 ) ) ( not ( = ?auto_11190 ?auto_11210 ) ) ( not ( = ?auto_11191 ?auto_11193 ) ) ( not ( = ?auto_11191 ?auto_11210 ) ) ( not ( = ?auto_11193 ?auto_11222 ) ) ( not ( = ?auto_11193 ?auto_11223 ) ) ( not ( = ?auto_11193 ?auto_11211 ) ) ( not ( = ?auto_11193 ?auto_11224 ) ) ( not ( = ?auto_11193 ?auto_11209 ) ) ( not ( = ?auto_11193 ?auto_11203 ) ) ( not ( = ?auto_11193 ?auto_11217 ) ) ( not ( = ?auto_11215 ?auto_11218 ) ) ( not ( = ?auto_11215 ?auto_11214 ) ) ( not ( = ?auto_11215 ?auto_11219 ) ) ( not ( = ?auto_11215 ?auto_11202 ) ) ( not ( = ?auto_11215 ?auto_11201 ) ) ( not ( = ?auto_11215 ?auto_11205 ) ) ( not ( = ?auto_11215 ?auto_11220 ) ) ( not ( = ?auto_11221 ?auto_11208 ) ) ( not ( = ?auto_11221 ?auto_11213 ) ) ( not ( = ?auto_11221 ?auto_11216 ) ) ( not ( = ?auto_11221 ?auto_11212 ) ) ( not ( = ?auto_11221 ?auto_11200 ) ) ( not ( = ?auto_11221 ?auto_11206 ) ) ( not ( = ?auto_11221 ?auto_11204 ) ) ( not ( = ?auto_11210 ?auto_11222 ) ) ( not ( = ?auto_11210 ?auto_11223 ) ) ( not ( = ?auto_11210 ?auto_11211 ) ) ( not ( = ?auto_11210 ?auto_11224 ) ) ( not ( = ?auto_11210 ?auto_11209 ) ) ( not ( = ?auto_11210 ?auto_11203 ) ) ( not ( = ?auto_11210 ?auto_11217 ) ) ( not ( = ?auto_11185 ?auto_11194 ) ) ( not ( = ?auto_11185 ?auto_11207 ) ) ( not ( = ?auto_11186 ?auto_11194 ) ) ( not ( = ?auto_11186 ?auto_11207 ) ) ( not ( = ?auto_11187 ?auto_11194 ) ) ( not ( = ?auto_11187 ?auto_11207 ) ) ( not ( = ?auto_11188 ?auto_11194 ) ) ( not ( = ?auto_11188 ?auto_11207 ) ) ( not ( = ?auto_11189 ?auto_11194 ) ) ( not ( = ?auto_11189 ?auto_11207 ) ) ( not ( = ?auto_11190 ?auto_11194 ) ) ( not ( = ?auto_11190 ?auto_11207 ) ) ( not ( = ?auto_11191 ?auto_11194 ) ) ( not ( = ?auto_11191 ?auto_11207 ) ) ( not ( = ?auto_11192 ?auto_11194 ) ) ( not ( = ?auto_11192 ?auto_11207 ) ) ( not ( = ?auto_11194 ?auto_11210 ) ) ( not ( = ?auto_11194 ?auto_11222 ) ) ( not ( = ?auto_11194 ?auto_11223 ) ) ( not ( = ?auto_11194 ?auto_11211 ) ) ( not ( = ?auto_11194 ?auto_11224 ) ) ( not ( = ?auto_11194 ?auto_11209 ) ) ( not ( = ?auto_11194 ?auto_11203 ) ) ( not ( = ?auto_11194 ?auto_11217 ) ) ( not ( = ?auto_11207 ?auto_11210 ) ) ( not ( = ?auto_11207 ?auto_11222 ) ) ( not ( = ?auto_11207 ?auto_11223 ) ) ( not ( = ?auto_11207 ?auto_11211 ) ) ( not ( = ?auto_11207 ?auto_11224 ) ) ( not ( = ?auto_11207 ?auto_11209 ) ) ( not ( = ?auto_11207 ?auto_11203 ) ) ( not ( = ?auto_11207 ?auto_11217 ) ) ( not ( = ?auto_11185 ?auto_11195 ) ) ( not ( = ?auto_11185 ?auto_11198 ) ) ( not ( = ?auto_11186 ?auto_11195 ) ) ( not ( = ?auto_11186 ?auto_11198 ) ) ( not ( = ?auto_11187 ?auto_11195 ) ) ( not ( = ?auto_11187 ?auto_11198 ) ) ( not ( = ?auto_11188 ?auto_11195 ) ) ( not ( = ?auto_11188 ?auto_11198 ) ) ( not ( = ?auto_11189 ?auto_11195 ) ) ( not ( = ?auto_11189 ?auto_11198 ) ) ( not ( = ?auto_11190 ?auto_11195 ) ) ( not ( = ?auto_11190 ?auto_11198 ) ) ( not ( = ?auto_11191 ?auto_11195 ) ) ( not ( = ?auto_11191 ?auto_11198 ) ) ( not ( = ?auto_11192 ?auto_11195 ) ) ( not ( = ?auto_11192 ?auto_11198 ) ) ( not ( = ?auto_11193 ?auto_11195 ) ) ( not ( = ?auto_11193 ?auto_11198 ) ) ( not ( = ?auto_11195 ?auto_11207 ) ) ( not ( = ?auto_11195 ?auto_11210 ) ) ( not ( = ?auto_11195 ?auto_11222 ) ) ( not ( = ?auto_11195 ?auto_11223 ) ) ( not ( = ?auto_11195 ?auto_11211 ) ) ( not ( = ?auto_11195 ?auto_11224 ) ) ( not ( = ?auto_11195 ?auto_11209 ) ) ( not ( = ?auto_11195 ?auto_11203 ) ) ( not ( = ?auto_11195 ?auto_11217 ) ) ( not ( = ?auto_11198 ?auto_11207 ) ) ( not ( = ?auto_11198 ?auto_11210 ) ) ( not ( = ?auto_11198 ?auto_11222 ) ) ( not ( = ?auto_11198 ?auto_11223 ) ) ( not ( = ?auto_11198 ?auto_11211 ) ) ( not ( = ?auto_11198 ?auto_11224 ) ) ( not ( = ?auto_11198 ?auto_11209 ) ) ( not ( = ?auto_11198 ?auto_11203 ) ) ( not ( = ?auto_11198 ?auto_11217 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_11185 ?auto_11186 ?auto_11187 ?auto_11188 ?auto_11189 ?auto_11190 ?auto_11191 ?auto_11192 ?auto_11193 ?auto_11194 )
      ( MAKE-1CRATE ?auto_11194 ?auto_11195 )
      ( MAKE-10CRATE-VERIFY ?auto_11185 ?auto_11186 ?auto_11187 ?auto_11188 ?auto_11189 ?auto_11190 ?auto_11191 ?auto_11192 ?auto_11193 ?auto_11194 ?auto_11195 ) )
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
      ?auto_11253 - SURFACE
      ?auto_11254 - SURFACE
      ?auto_11255 - SURFACE
      ?auto_11256 - SURFACE
      ?auto_11257 - SURFACE
      ?auto_11258 - SURFACE
    )
    :vars
    (
      ?auto_11259 - HOIST
      ?auto_11260 - PLACE
      ?auto_11264 - PLACE
      ?auto_11263 - HOIST
      ?auto_11261 - SURFACE
      ?auto_11277 - PLACE
      ?auto_11274 - HOIST
      ?auto_11268 - SURFACE
      ?auto_11269 - PLACE
      ?auto_11288 - HOIST
      ?auto_11290 - SURFACE
      ?auto_11271 - PLACE
      ?auto_11275 - HOIST
      ?auto_11283 - SURFACE
      ?auto_11278 - PLACE
      ?auto_11270 - HOIST
      ?auto_11286 - SURFACE
      ?auto_11265 - PLACE
      ?auto_11276 - HOIST
      ?auto_11280 - SURFACE
      ?auto_11267 - SURFACE
      ?auto_11284 - PLACE
      ?auto_11273 - HOIST
      ?auto_11281 - SURFACE
      ?auto_11285 - SURFACE
      ?auto_11287 - PLACE
      ?auto_11282 - HOIST
      ?auto_11272 - SURFACE
      ?auto_11279 - PLACE
      ?auto_11289 - HOIST
      ?auto_11266 - SURFACE
      ?auto_11262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11259 ?auto_11260 ) ( IS-CRATE ?auto_11258 ) ( not ( = ?auto_11264 ?auto_11260 ) ) ( HOIST-AT ?auto_11263 ?auto_11264 ) ( AVAILABLE ?auto_11263 ) ( SURFACE-AT ?auto_11258 ?auto_11264 ) ( ON ?auto_11258 ?auto_11261 ) ( CLEAR ?auto_11258 ) ( not ( = ?auto_11257 ?auto_11258 ) ) ( not ( = ?auto_11257 ?auto_11261 ) ) ( not ( = ?auto_11258 ?auto_11261 ) ) ( not ( = ?auto_11259 ?auto_11263 ) ) ( IS-CRATE ?auto_11257 ) ( not ( = ?auto_11277 ?auto_11260 ) ) ( HOIST-AT ?auto_11274 ?auto_11277 ) ( SURFACE-AT ?auto_11257 ?auto_11277 ) ( ON ?auto_11257 ?auto_11268 ) ( CLEAR ?auto_11257 ) ( not ( = ?auto_11256 ?auto_11257 ) ) ( not ( = ?auto_11256 ?auto_11268 ) ) ( not ( = ?auto_11257 ?auto_11268 ) ) ( not ( = ?auto_11259 ?auto_11274 ) ) ( IS-CRATE ?auto_11256 ) ( not ( = ?auto_11269 ?auto_11260 ) ) ( HOIST-AT ?auto_11288 ?auto_11269 ) ( SURFACE-AT ?auto_11256 ?auto_11269 ) ( ON ?auto_11256 ?auto_11290 ) ( CLEAR ?auto_11256 ) ( not ( = ?auto_11255 ?auto_11256 ) ) ( not ( = ?auto_11255 ?auto_11290 ) ) ( not ( = ?auto_11256 ?auto_11290 ) ) ( not ( = ?auto_11259 ?auto_11288 ) ) ( IS-CRATE ?auto_11255 ) ( not ( = ?auto_11271 ?auto_11260 ) ) ( HOIST-AT ?auto_11275 ?auto_11271 ) ( AVAILABLE ?auto_11275 ) ( SURFACE-AT ?auto_11255 ?auto_11271 ) ( ON ?auto_11255 ?auto_11283 ) ( CLEAR ?auto_11255 ) ( not ( = ?auto_11254 ?auto_11255 ) ) ( not ( = ?auto_11254 ?auto_11283 ) ) ( not ( = ?auto_11255 ?auto_11283 ) ) ( not ( = ?auto_11259 ?auto_11275 ) ) ( IS-CRATE ?auto_11254 ) ( not ( = ?auto_11278 ?auto_11260 ) ) ( HOIST-AT ?auto_11270 ?auto_11278 ) ( AVAILABLE ?auto_11270 ) ( SURFACE-AT ?auto_11254 ?auto_11278 ) ( ON ?auto_11254 ?auto_11286 ) ( CLEAR ?auto_11254 ) ( not ( = ?auto_11253 ?auto_11254 ) ) ( not ( = ?auto_11253 ?auto_11286 ) ) ( not ( = ?auto_11254 ?auto_11286 ) ) ( not ( = ?auto_11259 ?auto_11270 ) ) ( IS-CRATE ?auto_11253 ) ( not ( = ?auto_11265 ?auto_11260 ) ) ( HOIST-AT ?auto_11276 ?auto_11265 ) ( AVAILABLE ?auto_11276 ) ( SURFACE-AT ?auto_11253 ?auto_11265 ) ( ON ?auto_11253 ?auto_11280 ) ( CLEAR ?auto_11253 ) ( not ( = ?auto_11252 ?auto_11253 ) ) ( not ( = ?auto_11252 ?auto_11280 ) ) ( not ( = ?auto_11253 ?auto_11280 ) ) ( not ( = ?auto_11259 ?auto_11276 ) ) ( IS-CRATE ?auto_11252 ) ( AVAILABLE ?auto_11288 ) ( SURFACE-AT ?auto_11252 ?auto_11269 ) ( ON ?auto_11252 ?auto_11267 ) ( CLEAR ?auto_11252 ) ( not ( = ?auto_11251 ?auto_11252 ) ) ( not ( = ?auto_11251 ?auto_11267 ) ) ( not ( = ?auto_11252 ?auto_11267 ) ) ( IS-CRATE ?auto_11251 ) ( not ( = ?auto_11284 ?auto_11260 ) ) ( HOIST-AT ?auto_11273 ?auto_11284 ) ( AVAILABLE ?auto_11273 ) ( SURFACE-AT ?auto_11251 ?auto_11284 ) ( ON ?auto_11251 ?auto_11281 ) ( CLEAR ?auto_11251 ) ( not ( = ?auto_11250 ?auto_11251 ) ) ( not ( = ?auto_11250 ?auto_11281 ) ) ( not ( = ?auto_11251 ?auto_11281 ) ) ( not ( = ?auto_11259 ?auto_11273 ) ) ( IS-CRATE ?auto_11250 ) ( AVAILABLE ?auto_11274 ) ( SURFACE-AT ?auto_11250 ?auto_11277 ) ( ON ?auto_11250 ?auto_11285 ) ( CLEAR ?auto_11250 ) ( not ( = ?auto_11249 ?auto_11250 ) ) ( not ( = ?auto_11249 ?auto_11285 ) ) ( not ( = ?auto_11250 ?auto_11285 ) ) ( IS-CRATE ?auto_11249 ) ( not ( = ?auto_11287 ?auto_11260 ) ) ( HOIST-AT ?auto_11282 ?auto_11287 ) ( AVAILABLE ?auto_11282 ) ( SURFACE-AT ?auto_11249 ?auto_11287 ) ( ON ?auto_11249 ?auto_11272 ) ( CLEAR ?auto_11249 ) ( not ( = ?auto_11248 ?auto_11249 ) ) ( not ( = ?auto_11248 ?auto_11272 ) ) ( not ( = ?auto_11249 ?auto_11272 ) ) ( not ( = ?auto_11259 ?auto_11282 ) ) ( SURFACE-AT ?auto_11247 ?auto_11260 ) ( CLEAR ?auto_11247 ) ( IS-CRATE ?auto_11248 ) ( AVAILABLE ?auto_11259 ) ( not ( = ?auto_11279 ?auto_11260 ) ) ( HOIST-AT ?auto_11289 ?auto_11279 ) ( AVAILABLE ?auto_11289 ) ( SURFACE-AT ?auto_11248 ?auto_11279 ) ( ON ?auto_11248 ?auto_11266 ) ( CLEAR ?auto_11248 ) ( TRUCK-AT ?auto_11262 ?auto_11260 ) ( not ( = ?auto_11247 ?auto_11248 ) ) ( not ( = ?auto_11247 ?auto_11266 ) ) ( not ( = ?auto_11248 ?auto_11266 ) ) ( not ( = ?auto_11259 ?auto_11289 ) ) ( not ( = ?auto_11247 ?auto_11249 ) ) ( not ( = ?auto_11247 ?auto_11272 ) ) ( not ( = ?auto_11249 ?auto_11266 ) ) ( not ( = ?auto_11287 ?auto_11279 ) ) ( not ( = ?auto_11282 ?auto_11289 ) ) ( not ( = ?auto_11272 ?auto_11266 ) ) ( not ( = ?auto_11247 ?auto_11250 ) ) ( not ( = ?auto_11247 ?auto_11285 ) ) ( not ( = ?auto_11248 ?auto_11250 ) ) ( not ( = ?auto_11248 ?auto_11285 ) ) ( not ( = ?auto_11250 ?auto_11272 ) ) ( not ( = ?auto_11250 ?auto_11266 ) ) ( not ( = ?auto_11277 ?auto_11287 ) ) ( not ( = ?auto_11277 ?auto_11279 ) ) ( not ( = ?auto_11274 ?auto_11282 ) ) ( not ( = ?auto_11274 ?auto_11289 ) ) ( not ( = ?auto_11285 ?auto_11272 ) ) ( not ( = ?auto_11285 ?auto_11266 ) ) ( not ( = ?auto_11247 ?auto_11251 ) ) ( not ( = ?auto_11247 ?auto_11281 ) ) ( not ( = ?auto_11248 ?auto_11251 ) ) ( not ( = ?auto_11248 ?auto_11281 ) ) ( not ( = ?auto_11249 ?auto_11251 ) ) ( not ( = ?auto_11249 ?auto_11281 ) ) ( not ( = ?auto_11251 ?auto_11285 ) ) ( not ( = ?auto_11251 ?auto_11272 ) ) ( not ( = ?auto_11251 ?auto_11266 ) ) ( not ( = ?auto_11284 ?auto_11277 ) ) ( not ( = ?auto_11284 ?auto_11287 ) ) ( not ( = ?auto_11284 ?auto_11279 ) ) ( not ( = ?auto_11273 ?auto_11274 ) ) ( not ( = ?auto_11273 ?auto_11282 ) ) ( not ( = ?auto_11273 ?auto_11289 ) ) ( not ( = ?auto_11281 ?auto_11285 ) ) ( not ( = ?auto_11281 ?auto_11272 ) ) ( not ( = ?auto_11281 ?auto_11266 ) ) ( not ( = ?auto_11247 ?auto_11252 ) ) ( not ( = ?auto_11247 ?auto_11267 ) ) ( not ( = ?auto_11248 ?auto_11252 ) ) ( not ( = ?auto_11248 ?auto_11267 ) ) ( not ( = ?auto_11249 ?auto_11252 ) ) ( not ( = ?auto_11249 ?auto_11267 ) ) ( not ( = ?auto_11250 ?auto_11252 ) ) ( not ( = ?auto_11250 ?auto_11267 ) ) ( not ( = ?auto_11252 ?auto_11281 ) ) ( not ( = ?auto_11252 ?auto_11285 ) ) ( not ( = ?auto_11252 ?auto_11272 ) ) ( not ( = ?auto_11252 ?auto_11266 ) ) ( not ( = ?auto_11269 ?auto_11284 ) ) ( not ( = ?auto_11269 ?auto_11277 ) ) ( not ( = ?auto_11269 ?auto_11287 ) ) ( not ( = ?auto_11269 ?auto_11279 ) ) ( not ( = ?auto_11288 ?auto_11273 ) ) ( not ( = ?auto_11288 ?auto_11274 ) ) ( not ( = ?auto_11288 ?auto_11282 ) ) ( not ( = ?auto_11288 ?auto_11289 ) ) ( not ( = ?auto_11267 ?auto_11281 ) ) ( not ( = ?auto_11267 ?auto_11285 ) ) ( not ( = ?auto_11267 ?auto_11272 ) ) ( not ( = ?auto_11267 ?auto_11266 ) ) ( not ( = ?auto_11247 ?auto_11253 ) ) ( not ( = ?auto_11247 ?auto_11280 ) ) ( not ( = ?auto_11248 ?auto_11253 ) ) ( not ( = ?auto_11248 ?auto_11280 ) ) ( not ( = ?auto_11249 ?auto_11253 ) ) ( not ( = ?auto_11249 ?auto_11280 ) ) ( not ( = ?auto_11250 ?auto_11253 ) ) ( not ( = ?auto_11250 ?auto_11280 ) ) ( not ( = ?auto_11251 ?auto_11253 ) ) ( not ( = ?auto_11251 ?auto_11280 ) ) ( not ( = ?auto_11253 ?auto_11267 ) ) ( not ( = ?auto_11253 ?auto_11281 ) ) ( not ( = ?auto_11253 ?auto_11285 ) ) ( not ( = ?auto_11253 ?auto_11272 ) ) ( not ( = ?auto_11253 ?auto_11266 ) ) ( not ( = ?auto_11265 ?auto_11269 ) ) ( not ( = ?auto_11265 ?auto_11284 ) ) ( not ( = ?auto_11265 ?auto_11277 ) ) ( not ( = ?auto_11265 ?auto_11287 ) ) ( not ( = ?auto_11265 ?auto_11279 ) ) ( not ( = ?auto_11276 ?auto_11288 ) ) ( not ( = ?auto_11276 ?auto_11273 ) ) ( not ( = ?auto_11276 ?auto_11274 ) ) ( not ( = ?auto_11276 ?auto_11282 ) ) ( not ( = ?auto_11276 ?auto_11289 ) ) ( not ( = ?auto_11280 ?auto_11267 ) ) ( not ( = ?auto_11280 ?auto_11281 ) ) ( not ( = ?auto_11280 ?auto_11285 ) ) ( not ( = ?auto_11280 ?auto_11272 ) ) ( not ( = ?auto_11280 ?auto_11266 ) ) ( not ( = ?auto_11247 ?auto_11254 ) ) ( not ( = ?auto_11247 ?auto_11286 ) ) ( not ( = ?auto_11248 ?auto_11254 ) ) ( not ( = ?auto_11248 ?auto_11286 ) ) ( not ( = ?auto_11249 ?auto_11254 ) ) ( not ( = ?auto_11249 ?auto_11286 ) ) ( not ( = ?auto_11250 ?auto_11254 ) ) ( not ( = ?auto_11250 ?auto_11286 ) ) ( not ( = ?auto_11251 ?auto_11254 ) ) ( not ( = ?auto_11251 ?auto_11286 ) ) ( not ( = ?auto_11252 ?auto_11254 ) ) ( not ( = ?auto_11252 ?auto_11286 ) ) ( not ( = ?auto_11254 ?auto_11280 ) ) ( not ( = ?auto_11254 ?auto_11267 ) ) ( not ( = ?auto_11254 ?auto_11281 ) ) ( not ( = ?auto_11254 ?auto_11285 ) ) ( not ( = ?auto_11254 ?auto_11272 ) ) ( not ( = ?auto_11254 ?auto_11266 ) ) ( not ( = ?auto_11278 ?auto_11265 ) ) ( not ( = ?auto_11278 ?auto_11269 ) ) ( not ( = ?auto_11278 ?auto_11284 ) ) ( not ( = ?auto_11278 ?auto_11277 ) ) ( not ( = ?auto_11278 ?auto_11287 ) ) ( not ( = ?auto_11278 ?auto_11279 ) ) ( not ( = ?auto_11270 ?auto_11276 ) ) ( not ( = ?auto_11270 ?auto_11288 ) ) ( not ( = ?auto_11270 ?auto_11273 ) ) ( not ( = ?auto_11270 ?auto_11274 ) ) ( not ( = ?auto_11270 ?auto_11282 ) ) ( not ( = ?auto_11270 ?auto_11289 ) ) ( not ( = ?auto_11286 ?auto_11280 ) ) ( not ( = ?auto_11286 ?auto_11267 ) ) ( not ( = ?auto_11286 ?auto_11281 ) ) ( not ( = ?auto_11286 ?auto_11285 ) ) ( not ( = ?auto_11286 ?auto_11272 ) ) ( not ( = ?auto_11286 ?auto_11266 ) ) ( not ( = ?auto_11247 ?auto_11255 ) ) ( not ( = ?auto_11247 ?auto_11283 ) ) ( not ( = ?auto_11248 ?auto_11255 ) ) ( not ( = ?auto_11248 ?auto_11283 ) ) ( not ( = ?auto_11249 ?auto_11255 ) ) ( not ( = ?auto_11249 ?auto_11283 ) ) ( not ( = ?auto_11250 ?auto_11255 ) ) ( not ( = ?auto_11250 ?auto_11283 ) ) ( not ( = ?auto_11251 ?auto_11255 ) ) ( not ( = ?auto_11251 ?auto_11283 ) ) ( not ( = ?auto_11252 ?auto_11255 ) ) ( not ( = ?auto_11252 ?auto_11283 ) ) ( not ( = ?auto_11253 ?auto_11255 ) ) ( not ( = ?auto_11253 ?auto_11283 ) ) ( not ( = ?auto_11255 ?auto_11286 ) ) ( not ( = ?auto_11255 ?auto_11280 ) ) ( not ( = ?auto_11255 ?auto_11267 ) ) ( not ( = ?auto_11255 ?auto_11281 ) ) ( not ( = ?auto_11255 ?auto_11285 ) ) ( not ( = ?auto_11255 ?auto_11272 ) ) ( not ( = ?auto_11255 ?auto_11266 ) ) ( not ( = ?auto_11271 ?auto_11278 ) ) ( not ( = ?auto_11271 ?auto_11265 ) ) ( not ( = ?auto_11271 ?auto_11269 ) ) ( not ( = ?auto_11271 ?auto_11284 ) ) ( not ( = ?auto_11271 ?auto_11277 ) ) ( not ( = ?auto_11271 ?auto_11287 ) ) ( not ( = ?auto_11271 ?auto_11279 ) ) ( not ( = ?auto_11275 ?auto_11270 ) ) ( not ( = ?auto_11275 ?auto_11276 ) ) ( not ( = ?auto_11275 ?auto_11288 ) ) ( not ( = ?auto_11275 ?auto_11273 ) ) ( not ( = ?auto_11275 ?auto_11274 ) ) ( not ( = ?auto_11275 ?auto_11282 ) ) ( not ( = ?auto_11275 ?auto_11289 ) ) ( not ( = ?auto_11283 ?auto_11286 ) ) ( not ( = ?auto_11283 ?auto_11280 ) ) ( not ( = ?auto_11283 ?auto_11267 ) ) ( not ( = ?auto_11283 ?auto_11281 ) ) ( not ( = ?auto_11283 ?auto_11285 ) ) ( not ( = ?auto_11283 ?auto_11272 ) ) ( not ( = ?auto_11283 ?auto_11266 ) ) ( not ( = ?auto_11247 ?auto_11256 ) ) ( not ( = ?auto_11247 ?auto_11290 ) ) ( not ( = ?auto_11248 ?auto_11256 ) ) ( not ( = ?auto_11248 ?auto_11290 ) ) ( not ( = ?auto_11249 ?auto_11256 ) ) ( not ( = ?auto_11249 ?auto_11290 ) ) ( not ( = ?auto_11250 ?auto_11256 ) ) ( not ( = ?auto_11250 ?auto_11290 ) ) ( not ( = ?auto_11251 ?auto_11256 ) ) ( not ( = ?auto_11251 ?auto_11290 ) ) ( not ( = ?auto_11252 ?auto_11256 ) ) ( not ( = ?auto_11252 ?auto_11290 ) ) ( not ( = ?auto_11253 ?auto_11256 ) ) ( not ( = ?auto_11253 ?auto_11290 ) ) ( not ( = ?auto_11254 ?auto_11256 ) ) ( not ( = ?auto_11254 ?auto_11290 ) ) ( not ( = ?auto_11256 ?auto_11283 ) ) ( not ( = ?auto_11256 ?auto_11286 ) ) ( not ( = ?auto_11256 ?auto_11280 ) ) ( not ( = ?auto_11256 ?auto_11267 ) ) ( not ( = ?auto_11256 ?auto_11281 ) ) ( not ( = ?auto_11256 ?auto_11285 ) ) ( not ( = ?auto_11256 ?auto_11272 ) ) ( not ( = ?auto_11256 ?auto_11266 ) ) ( not ( = ?auto_11290 ?auto_11283 ) ) ( not ( = ?auto_11290 ?auto_11286 ) ) ( not ( = ?auto_11290 ?auto_11280 ) ) ( not ( = ?auto_11290 ?auto_11267 ) ) ( not ( = ?auto_11290 ?auto_11281 ) ) ( not ( = ?auto_11290 ?auto_11285 ) ) ( not ( = ?auto_11290 ?auto_11272 ) ) ( not ( = ?auto_11290 ?auto_11266 ) ) ( not ( = ?auto_11247 ?auto_11257 ) ) ( not ( = ?auto_11247 ?auto_11268 ) ) ( not ( = ?auto_11248 ?auto_11257 ) ) ( not ( = ?auto_11248 ?auto_11268 ) ) ( not ( = ?auto_11249 ?auto_11257 ) ) ( not ( = ?auto_11249 ?auto_11268 ) ) ( not ( = ?auto_11250 ?auto_11257 ) ) ( not ( = ?auto_11250 ?auto_11268 ) ) ( not ( = ?auto_11251 ?auto_11257 ) ) ( not ( = ?auto_11251 ?auto_11268 ) ) ( not ( = ?auto_11252 ?auto_11257 ) ) ( not ( = ?auto_11252 ?auto_11268 ) ) ( not ( = ?auto_11253 ?auto_11257 ) ) ( not ( = ?auto_11253 ?auto_11268 ) ) ( not ( = ?auto_11254 ?auto_11257 ) ) ( not ( = ?auto_11254 ?auto_11268 ) ) ( not ( = ?auto_11255 ?auto_11257 ) ) ( not ( = ?auto_11255 ?auto_11268 ) ) ( not ( = ?auto_11257 ?auto_11290 ) ) ( not ( = ?auto_11257 ?auto_11283 ) ) ( not ( = ?auto_11257 ?auto_11286 ) ) ( not ( = ?auto_11257 ?auto_11280 ) ) ( not ( = ?auto_11257 ?auto_11267 ) ) ( not ( = ?auto_11257 ?auto_11281 ) ) ( not ( = ?auto_11257 ?auto_11285 ) ) ( not ( = ?auto_11257 ?auto_11272 ) ) ( not ( = ?auto_11257 ?auto_11266 ) ) ( not ( = ?auto_11268 ?auto_11290 ) ) ( not ( = ?auto_11268 ?auto_11283 ) ) ( not ( = ?auto_11268 ?auto_11286 ) ) ( not ( = ?auto_11268 ?auto_11280 ) ) ( not ( = ?auto_11268 ?auto_11267 ) ) ( not ( = ?auto_11268 ?auto_11281 ) ) ( not ( = ?auto_11268 ?auto_11285 ) ) ( not ( = ?auto_11268 ?auto_11272 ) ) ( not ( = ?auto_11268 ?auto_11266 ) ) ( not ( = ?auto_11247 ?auto_11258 ) ) ( not ( = ?auto_11247 ?auto_11261 ) ) ( not ( = ?auto_11248 ?auto_11258 ) ) ( not ( = ?auto_11248 ?auto_11261 ) ) ( not ( = ?auto_11249 ?auto_11258 ) ) ( not ( = ?auto_11249 ?auto_11261 ) ) ( not ( = ?auto_11250 ?auto_11258 ) ) ( not ( = ?auto_11250 ?auto_11261 ) ) ( not ( = ?auto_11251 ?auto_11258 ) ) ( not ( = ?auto_11251 ?auto_11261 ) ) ( not ( = ?auto_11252 ?auto_11258 ) ) ( not ( = ?auto_11252 ?auto_11261 ) ) ( not ( = ?auto_11253 ?auto_11258 ) ) ( not ( = ?auto_11253 ?auto_11261 ) ) ( not ( = ?auto_11254 ?auto_11258 ) ) ( not ( = ?auto_11254 ?auto_11261 ) ) ( not ( = ?auto_11255 ?auto_11258 ) ) ( not ( = ?auto_11255 ?auto_11261 ) ) ( not ( = ?auto_11256 ?auto_11258 ) ) ( not ( = ?auto_11256 ?auto_11261 ) ) ( not ( = ?auto_11258 ?auto_11268 ) ) ( not ( = ?auto_11258 ?auto_11290 ) ) ( not ( = ?auto_11258 ?auto_11283 ) ) ( not ( = ?auto_11258 ?auto_11286 ) ) ( not ( = ?auto_11258 ?auto_11280 ) ) ( not ( = ?auto_11258 ?auto_11267 ) ) ( not ( = ?auto_11258 ?auto_11281 ) ) ( not ( = ?auto_11258 ?auto_11285 ) ) ( not ( = ?auto_11258 ?auto_11272 ) ) ( not ( = ?auto_11258 ?auto_11266 ) ) ( not ( = ?auto_11264 ?auto_11277 ) ) ( not ( = ?auto_11264 ?auto_11269 ) ) ( not ( = ?auto_11264 ?auto_11271 ) ) ( not ( = ?auto_11264 ?auto_11278 ) ) ( not ( = ?auto_11264 ?auto_11265 ) ) ( not ( = ?auto_11264 ?auto_11284 ) ) ( not ( = ?auto_11264 ?auto_11287 ) ) ( not ( = ?auto_11264 ?auto_11279 ) ) ( not ( = ?auto_11263 ?auto_11274 ) ) ( not ( = ?auto_11263 ?auto_11288 ) ) ( not ( = ?auto_11263 ?auto_11275 ) ) ( not ( = ?auto_11263 ?auto_11270 ) ) ( not ( = ?auto_11263 ?auto_11276 ) ) ( not ( = ?auto_11263 ?auto_11273 ) ) ( not ( = ?auto_11263 ?auto_11282 ) ) ( not ( = ?auto_11263 ?auto_11289 ) ) ( not ( = ?auto_11261 ?auto_11268 ) ) ( not ( = ?auto_11261 ?auto_11290 ) ) ( not ( = ?auto_11261 ?auto_11283 ) ) ( not ( = ?auto_11261 ?auto_11286 ) ) ( not ( = ?auto_11261 ?auto_11280 ) ) ( not ( = ?auto_11261 ?auto_11267 ) ) ( not ( = ?auto_11261 ?auto_11281 ) ) ( not ( = ?auto_11261 ?auto_11285 ) ) ( not ( = ?auto_11261 ?auto_11272 ) ) ( not ( = ?auto_11261 ?auto_11266 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_11247 ?auto_11248 ?auto_11249 ?auto_11250 ?auto_11251 ?auto_11252 ?auto_11253 ?auto_11254 ?auto_11255 ?auto_11256 ?auto_11257 )
      ( MAKE-1CRATE ?auto_11257 ?auto_11258 )
      ( MAKE-11CRATE-VERIFY ?auto_11247 ?auto_11248 ?auto_11249 ?auto_11250 ?auto_11251 ?auto_11252 ?auto_11253 ?auto_11254 ?auto_11255 ?auto_11256 ?auto_11257 ?auto_11258 ) )
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
      ?auto_11320 - SURFACE
      ?auto_11321 - SURFACE
      ?auto_11322 - SURFACE
      ?auto_11323 - SURFACE
      ?auto_11324 - SURFACE
      ?auto_11325 - SURFACE
      ?auto_11326 - SURFACE
    )
    :vars
    (
      ?auto_11330 - HOIST
      ?auto_11331 - PLACE
      ?auto_11328 - PLACE
      ?auto_11327 - HOIST
      ?auto_11329 - SURFACE
      ?auto_11333 - SURFACE
      ?auto_11342 - PLACE
      ?auto_11357 - HOIST
      ?auto_11354 - SURFACE
      ?auto_11347 - PLACE
      ?auto_11353 - HOIST
      ?auto_11351 - SURFACE
      ?auto_11336 - PLACE
      ?auto_11358 - HOIST
      ?auto_11339 - SURFACE
      ?auto_11343 - PLACE
      ?auto_11344 - HOIST
      ?auto_11349 - SURFACE
      ?auto_11335 - PLACE
      ?auto_11337 - HOIST
      ?auto_11355 - SURFACE
      ?auto_11350 - SURFACE
      ?auto_11341 - PLACE
      ?auto_11346 - HOIST
      ?auto_11338 - SURFACE
      ?auto_11359 - SURFACE
      ?auto_11334 - PLACE
      ?auto_11340 - HOIST
      ?auto_11356 - SURFACE
      ?auto_11348 - PLACE
      ?auto_11352 - HOIST
      ?auto_11345 - SURFACE
      ?auto_11332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11330 ?auto_11331 ) ( IS-CRATE ?auto_11326 ) ( not ( = ?auto_11328 ?auto_11331 ) ) ( HOIST-AT ?auto_11327 ?auto_11328 ) ( SURFACE-AT ?auto_11326 ?auto_11328 ) ( ON ?auto_11326 ?auto_11329 ) ( CLEAR ?auto_11326 ) ( not ( = ?auto_11325 ?auto_11326 ) ) ( not ( = ?auto_11325 ?auto_11329 ) ) ( not ( = ?auto_11326 ?auto_11329 ) ) ( not ( = ?auto_11330 ?auto_11327 ) ) ( IS-CRATE ?auto_11325 ) ( AVAILABLE ?auto_11327 ) ( SURFACE-AT ?auto_11325 ?auto_11328 ) ( ON ?auto_11325 ?auto_11333 ) ( CLEAR ?auto_11325 ) ( not ( = ?auto_11324 ?auto_11325 ) ) ( not ( = ?auto_11324 ?auto_11333 ) ) ( not ( = ?auto_11325 ?auto_11333 ) ) ( IS-CRATE ?auto_11324 ) ( not ( = ?auto_11342 ?auto_11331 ) ) ( HOIST-AT ?auto_11357 ?auto_11342 ) ( SURFACE-AT ?auto_11324 ?auto_11342 ) ( ON ?auto_11324 ?auto_11354 ) ( CLEAR ?auto_11324 ) ( not ( = ?auto_11323 ?auto_11324 ) ) ( not ( = ?auto_11323 ?auto_11354 ) ) ( not ( = ?auto_11324 ?auto_11354 ) ) ( not ( = ?auto_11330 ?auto_11357 ) ) ( IS-CRATE ?auto_11323 ) ( not ( = ?auto_11347 ?auto_11331 ) ) ( HOIST-AT ?auto_11353 ?auto_11347 ) ( SURFACE-AT ?auto_11323 ?auto_11347 ) ( ON ?auto_11323 ?auto_11351 ) ( CLEAR ?auto_11323 ) ( not ( = ?auto_11322 ?auto_11323 ) ) ( not ( = ?auto_11322 ?auto_11351 ) ) ( not ( = ?auto_11323 ?auto_11351 ) ) ( not ( = ?auto_11330 ?auto_11353 ) ) ( IS-CRATE ?auto_11322 ) ( not ( = ?auto_11336 ?auto_11331 ) ) ( HOIST-AT ?auto_11358 ?auto_11336 ) ( AVAILABLE ?auto_11358 ) ( SURFACE-AT ?auto_11322 ?auto_11336 ) ( ON ?auto_11322 ?auto_11339 ) ( CLEAR ?auto_11322 ) ( not ( = ?auto_11321 ?auto_11322 ) ) ( not ( = ?auto_11321 ?auto_11339 ) ) ( not ( = ?auto_11322 ?auto_11339 ) ) ( not ( = ?auto_11330 ?auto_11358 ) ) ( IS-CRATE ?auto_11321 ) ( not ( = ?auto_11343 ?auto_11331 ) ) ( HOIST-AT ?auto_11344 ?auto_11343 ) ( AVAILABLE ?auto_11344 ) ( SURFACE-AT ?auto_11321 ?auto_11343 ) ( ON ?auto_11321 ?auto_11349 ) ( CLEAR ?auto_11321 ) ( not ( = ?auto_11320 ?auto_11321 ) ) ( not ( = ?auto_11320 ?auto_11349 ) ) ( not ( = ?auto_11321 ?auto_11349 ) ) ( not ( = ?auto_11330 ?auto_11344 ) ) ( IS-CRATE ?auto_11320 ) ( not ( = ?auto_11335 ?auto_11331 ) ) ( HOIST-AT ?auto_11337 ?auto_11335 ) ( AVAILABLE ?auto_11337 ) ( SURFACE-AT ?auto_11320 ?auto_11335 ) ( ON ?auto_11320 ?auto_11355 ) ( CLEAR ?auto_11320 ) ( not ( = ?auto_11319 ?auto_11320 ) ) ( not ( = ?auto_11319 ?auto_11355 ) ) ( not ( = ?auto_11320 ?auto_11355 ) ) ( not ( = ?auto_11330 ?auto_11337 ) ) ( IS-CRATE ?auto_11319 ) ( AVAILABLE ?auto_11353 ) ( SURFACE-AT ?auto_11319 ?auto_11347 ) ( ON ?auto_11319 ?auto_11350 ) ( CLEAR ?auto_11319 ) ( not ( = ?auto_11318 ?auto_11319 ) ) ( not ( = ?auto_11318 ?auto_11350 ) ) ( not ( = ?auto_11319 ?auto_11350 ) ) ( IS-CRATE ?auto_11318 ) ( not ( = ?auto_11341 ?auto_11331 ) ) ( HOIST-AT ?auto_11346 ?auto_11341 ) ( AVAILABLE ?auto_11346 ) ( SURFACE-AT ?auto_11318 ?auto_11341 ) ( ON ?auto_11318 ?auto_11338 ) ( CLEAR ?auto_11318 ) ( not ( = ?auto_11317 ?auto_11318 ) ) ( not ( = ?auto_11317 ?auto_11338 ) ) ( not ( = ?auto_11318 ?auto_11338 ) ) ( not ( = ?auto_11330 ?auto_11346 ) ) ( IS-CRATE ?auto_11317 ) ( AVAILABLE ?auto_11357 ) ( SURFACE-AT ?auto_11317 ?auto_11342 ) ( ON ?auto_11317 ?auto_11359 ) ( CLEAR ?auto_11317 ) ( not ( = ?auto_11316 ?auto_11317 ) ) ( not ( = ?auto_11316 ?auto_11359 ) ) ( not ( = ?auto_11317 ?auto_11359 ) ) ( IS-CRATE ?auto_11316 ) ( not ( = ?auto_11334 ?auto_11331 ) ) ( HOIST-AT ?auto_11340 ?auto_11334 ) ( AVAILABLE ?auto_11340 ) ( SURFACE-AT ?auto_11316 ?auto_11334 ) ( ON ?auto_11316 ?auto_11356 ) ( CLEAR ?auto_11316 ) ( not ( = ?auto_11315 ?auto_11316 ) ) ( not ( = ?auto_11315 ?auto_11356 ) ) ( not ( = ?auto_11316 ?auto_11356 ) ) ( not ( = ?auto_11330 ?auto_11340 ) ) ( SURFACE-AT ?auto_11314 ?auto_11331 ) ( CLEAR ?auto_11314 ) ( IS-CRATE ?auto_11315 ) ( AVAILABLE ?auto_11330 ) ( not ( = ?auto_11348 ?auto_11331 ) ) ( HOIST-AT ?auto_11352 ?auto_11348 ) ( AVAILABLE ?auto_11352 ) ( SURFACE-AT ?auto_11315 ?auto_11348 ) ( ON ?auto_11315 ?auto_11345 ) ( CLEAR ?auto_11315 ) ( TRUCK-AT ?auto_11332 ?auto_11331 ) ( not ( = ?auto_11314 ?auto_11315 ) ) ( not ( = ?auto_11314 ?auto_11345 ) ) ( not ( = ?auto_11315 ?auto_11345 ) ) ( not ( = ?auto_11330 ?auto_11352 ) ) ( not ( = ?auto_11314 ?auto_11316 ) ) ( not ( = ?auto_11314 ?auto_11356 ) ) ( not ( = ?auto_11316 ?auto_11345 ) ) ( not ( = ?auto_11334 ?auto_11348 ) ) ( not ( = ?auto_11340 ?auto_11352 ) ) ( not ( = ?auto_11356 ?auto_11345 ) ) ( not ( = ?auto_11314 ?auto_11317 ) ) ( not ( = ?auto_11314 ?auto_11359 ) ) ( not ( = ?auto_11315 ?auto_11317 ) ) ( not ( = ?auto_11315 ?auto_11359 ) ) ( not ( = ?auto_11317 ?auto_11356 ) ) ( not ( = ?auto_11317 ?auto_11345 ) ) ( not ( = ?auto_11342 ?auto_11334 ) ) ( not ( = ?auto_11342 ?auto_11348 ) ) ( not ( = ?auto_11357 ?auto_11340 ) ) ( not ( = ?auto_11357 ?auto_11352 ) ) ( not ( = ?auto_11359 ?auto_11356 ) ) ( not ( = ?auto_11359 ?auto_11345 ) ) ( not ( = ?auto_11314 ?auto_11318 ) ) ( not ( = ?auto_11314 ?auto_11338 ) ) ( not ( = ?auto_11315 ?auto_11318 ) ) ( not ( = ?auto_11315 ?auto_11338 ) ) ( not ( = ?auto_11316 ?auto_11318 ) ) ( not ( = ?auto_11316 ?auto_11338 ) ) ( not ( = ?auto_11318 ?auto_11359 ) ) ( not ( = ?auto_11318 ?auto_11356 ) ) ( not ( = ?auto_11318 ?auto_11345 ) ) ( not ( = ?auto_11341 ?auto_11342 ) ) ( not ( = ?auto_11341 ?auto_11334 ) ) ( not ( = ?auto_11341 ?auto_11348 ) ) ( not ( = ?auto_11346 ?auto_11357 ) ) ( not ( = ?auto_11346 ?auto_11340 ) ) ( not ( = ?auto_11346 ?auto_11352 ) ) ( not ( = ?auto_11338 ?auto_11359 ) ) ( not ( = ?auto_11338 ?auto_11356 ) ) ( not ( = ?auto_11338 ?auto_11345 ) ) ( not ( = ?auto_11314 ?auto_11319 ) ) ( not ( = ?auto_11314 ?auto_11350 ) ) ( not ( = ?auto_11315 ?auto_11319 ) ) ( not ( = ?auto_11315 ?auto_11350 ) ) ( not ( = ?auto_11316 ?auto_11319 ) ) ( not ( = ?auto_11316 ?auto_11350 ) ) ( not ( = ?auto_11317 ?auto_11319 ) ) ( not ( = ?auto_11317 ?auto_11350 ) ) ( not ( = ?auto_11319 ?auto_11338 ) ) ( not ( = ?auto_11319 ?auto_11359 ) ) ( not ( = ?auto_11319 ?auto_11356 ) ) ( not ( = ?auto_11319 ?auto_11345 ) ) ( not ( = ?auto_11347 ?auto_11341 ) ) ( not ( = ?auto_11347 ?auto_11342 ) ) ( not ( = ?auto_11347 ?auto_11334 ) ) ( not ( = ?auto_11347 ?auto_11348 ) ) ( not ( = ?auto_11353 ?auto_11346 ) ) ( not ( = ?auto_11353 ?auto_11357 ) ) ( not ( = ?auto_11353 ?auto_11340 ) ) ( not ( = ?auto_11353 ?auto_11352 ) ) ( not ( = ?auto_11350 ?auto_11338 ) ) ( not ( = ?auto_11350 ?auto_11359 ) ) ( not ( = ?auto_11350 ?auto_11356 ) ) ( not ( = ?auto_11350 ?auto_11345 ) ) ( not ( = ?auto_11314 ?auto_11320 ) ) ( not ( = ?auto_11314 ?auto_11355 ) ) ( not ( = ?auto_11315 ?auto_11320 ) ) ( not ( = ?auto_11315 ?auto_11355 ) ) ( not ( = ?auto_11316 ?auto_11320 ) ) ( not ( = ?auto_11316 ?auto_11355 ) ) ( not ( = ?auto_11317 ?auto_11320 ) ) ( not ( = ?auto_11317 ?auto_11355 ) ) ( not ( = ?auto_11318 ?auto_11320 ) ) ( not ( = ?auto_11318 ?auto_11355 ) ) ( not ( = ?auto_11320 ?auto_11350 ) ) ( not ( = ?auto_11320 ?auto_11338 ) ) ( not ( = ?auto_11320 ?auto_11359 ) ) ( not ( = ?auto_11320 ?auto_11356 ) ) ( not ( = ?auto_11320 ?auto_11345 ) ) ( not ( = ?auto_11335 ?auto_11347 ) ) ( not ( = ?auto_11335 ?auto_11341 ) ) ( not ( = ?auto_11335 ?auto_11342 ) ) ( not ( = ?auto_11335 ?auto_11334 ) ) ( not ( = ?auto_11335 ?auto_11348 ) ) ( not ( = ?auto_11337 ?auto_11353 ) ) ( not ( = ?auto_11337 ?auto_11346 ) ) ( not ( = ?auto_11337 ?auto_11357 ) ) ( not ( = ?auto_11337 ?auto_11340 ) ) ( not ( = ?auto_11337 ?auto_11352 ) ) ( not ( = ?auto_11355 ?auto_11350 ) ) ( not ( = ?auto_11355 ?auto_11338 ) ) ( not ( = ?auto_11355 ?auto_11359 ) ) ( not ( = ?auto_11355 ?auto_11356 ) ) ( not ( = ?auto_11355 ?auto_11345 ) ) ( not ( = ?auto_11314 ?auto_11321 ) ) ( not ( = ?auto_11314 ?auto_11349 ) ) ( not ( = ?auto_11315 ?auto_11321 ) ) ( not ( = ?auto_11315 ?auto_11349 ) ) ( not ( = ?auto_11316 ?auto_11321 ) ) ( not ( = ?auto_11316 ?auto_11349 ) ) ( not ( = ?auto_11317 ?auto_11321 ) ) ( not ( = ?auto_11317 ?auto_11349 ) ) ( not ( = ?auto_11318 ?auto_11321 ) ) ( not ( = ?auto_11318 ?auto_11349 ) ) ( not ( = ?auto_11319 ?auto_11321 ) ) ( not ( = ?auto_11319 ?auto_11349 ) ) ( not ( = ?auto_11321 ?auto_11355 ) ) ( not ( = ?auto_11321 ?auto_11350 ) ) ( not ( = ?auto_11321 ?auto_11338 ) ) ( not ( = ?auto_11321 ?auto_11359 ) ) ( not ( = ?auto_11321 ?auto_11356 ) ) ( not ( = ?auto_11321 ?auto_11345 ) ) ( not ( = ?auto_11343 ?auto_11335 ) ) ( not ( = ?auto_11343 ?auto_11347 ) ) ( not ( = ?auto_11343 ?auto_11341 ) ) ( not ( = ?auto_11343 ?auto_11342 ) ) ( not ( = ?auto_11343 ?auto_11334 ) ) ( not ( = ?auto_11343 ?auto_11348 ) ) ( not ( = ?auto_11344 ?auto_11337 ) ) ( not ( = ?auto_11344 ?auto_11353 ) ) ( not ( = ?auto_11344 ?auto_11346 ) ) ( not ( = ?auto_11344 ?auto_11357 ) ) ( not ( = ?auto_11344 ?auto_11340 ) ) ( not ( = ?auto_11344 ?auto_11352 ) ) ( not ( = ?auto_11349 ?auto_11355 ) ) ( not ( = ?auto_11349 ?auto_11350 ) ) ( not ( = ?auto_11349 ?auto_11338 ) ) ( not ( = ?auto_11349 ?auto_11359 ) ) ( not ( = ?auto_11349 ?auto_11356 ) ) ( not ( = ?auto_11349 ?auto_11345 ) ) ( not ( = ?auto_11314 ?auto_11322 ) ) ( not ( = ?auto_11314 ?auto_11339 ) ) ( not ( = ?auto_11315 ?auto_11322 ) ) ( not ( = ?auto_11315 ?auto_11339 ) ) ( not ( = ?auto_11316 ?auto_11322 ) ) ( not ( = ?auto_11316 ?auto_11339 ) ) ( not ( = ?auto_11317 ?auto_11322 ) ) ( not ( = ?auto_11317 ?auto_11339 ) ) ( not ( = ?auto_11318 ?auto_11322 ) ) ( not ( = ?auto_11318 ?auto_11339 ) ) ( not ( = ?auto_11319 ?auto_11322 ) ) ( not ( = ?auto_11319 ?auto_11339 ) ) ( not ( = ?auto_11320 ?auto_11322 ) ) ( not ( = ?auto_11320 ?auto_11339 ) ) ( not ( = ?auto_11322 ?auto_11349 ) ) ( not ( = ?auto_11322 ?auto_11355 ) ) ( not ( = ?auto_11322 ?auto_11350 ) ) ( not ( = ?auto_11322 ?auto_11338 ) ) ( not ( = ?auto_11322 ?auto_11359 ) ) ( not ( = ?auto_11322 ?auto_11356 ) ) ( not ( = ?auto_11322 ?auto_11345 ) ) ( not ( = ?auto_11336 ?auto_11343 ) ) ( not ( = ?auto_11336 ?auto_11335 ) ) ( not ( = ?auto_11336 ?auto_11347 ) ) ( not ( = ?auto_11336 ?auto_11341 ) ) ( not ( = ?auto_11336 ?auto_11342 ) ) ( not ( = ?auto_11336 ?auto_11334 ) ) ( not ( = ?auto_11336 ?auto_11348 ) ) ( not ( = ?auto_11358 ?auto_11344 ) ) ( not ( = ?auto_11358 ?auto_11337 ) ) ( not ( = ?auto_11358 ?auto_11353 ) ) ( not ( = ?auto_11358 ?auto_11346 ) ) ( not ( = ?auto_11358 ?auto_11357 ) ) ( not ( = ?auto_11358 ?auto_11340 ) ) ( not ( = ?auto_11358 ?auto_11352 ) ) ( not ( = ?auto_11339 ?auto_11349 ) ) ( not ( = ?auto_11339 ?auto_11355 ) ) ( not ( = ?auto_11339 ?auto_11350 ) ) ( not ( = ?auto_11339 ?auto_11338 ) ) ( not ( = ?auto_11339 ?auto_11359 ) ) ( not ( = ?auto_11339 ?auto_11356 ) ) ( not ( = ?auto_11339 ?auto_11345 ) ) ( not ( = ?auto_11314 ?auto_11323 ) ) ( not ( = ?auto_11314 ?auto_11351 ) ) ( not ( = ?auto_11315 ?auto_11323 ) ) ( not ( = ?auto_11315 ?auto_11351 ) ) ( not ( = ?auto_11316 ?auto_11323 ) ) ( not ( = ?auto_11316 ?auto_11351 ) ) ( not ( = ?auto_11317 ?auto_11323 ) ) ( not ( = ?auto_11317 ?auto_11351 ) ) ( not ( = ?auto_11318 ?auto_11323 ) ) ( not ( = ?auto_11318 ?auto_11351 ) ) ( not ( = ?auto_11319 ?auto_11323 ) ) ( not ( = ?auto_11319 ?auto_11351 ) ) ( not ( = ?auto_11320 ?auto_11323 ) ) ( not ( = ?auto_11320 ?auto_11351 ) ) ( not ( = ?auto_11321 ?auto_11323 ) ) ( not ( = ?auto_11321 ?auto_11351 ) ) ( not ( = ?auto_11323 ?auto_11339 ) ) ( not ( = ?auto_11323 ?auto_11349 ) ) ( not ( = ?auto_11323 ?auto_11355 ) ) ( not ( = ?auto_11323 ?auto_11350 ) ) ( not ( = ?auto_11323 ?auto_11338 ) ) ( not ( = ?auto_11323 ?auto_11359 ) ) ( not ( = ?auto_11323 ?auto_11356 ) ) ( not ( = ?auto_11323 ?auto_11345 ) ) ( not ( = ?auto_11351 ?auto_11339 ) ) ( not ( = ?auto_11351 ?auto_11349 ) ) ( not ( = ?auto_11351 ?auto_11355 ) ) ( not ( = ?auto_11351 ?auto_11350 ) ) ( not ( = ?auto_11351 ?auto_11338 ) ) ( not ( = ?auto_11351 ?auto_11359 ) ) ( not ( = ?auto_11351 ?auto_11356 ) ) ( not ( = ?auto_11351 ?auto_11345 ) ) ( not ( = ?auto_11314 ?auto_11324 ) ) ( not ( = ?auto_11314 ?auto_11354 ) ) ( not ( = ?auto_11315 ?auto_11324 ) ) ( not ( = ?auto_11315 ?auto_11354 ) ) ( not ( = ?auto_11316 ?auto_11324 ) ) ( not ( = ?auto_11316 ?auto_11354 ) ) ( not ( = ?auto_11317 ?auto_11324 ) ) ( not ( = ?auto_11317 ?auto_11354 ) ) ( not ( = ?auto_11318 ?auto_11324 ) ) ( not ( = ?auto_11318 ?auto_11354 ) ) ( not ( = ?auto_11319 ?auto_11324 ) ) ( not ( = ?auto_11319 ?auto_11354 ) ) ( not ( = ?auto_11320 ?auto_11324 ) ) ( not ( = ?auto_11320 ?auto_11354 ) ) ( not ( = ?auto_11321 ?auto_11324 ) ) ( not ( = ?auto_11321 ?auto_11354 ) ) ( not ( = ?auto_11322 ?auto_11324 ) ) ( not ( = ?auto_11322 ?auto_11354 ) ) ( not ( = ?auto_11324 ?auto_11351 ) ) ( not ( = ?auto_11324 ?auto_11339 ) ) ( not ( = ?auto_11324 ?auto_11349 ) ) ( not ( = ?auto_11324 ?auto_11355 ) ) ( not ( = ?auto_11324 ?auto_11350 ) ) ( not ( = ?auto_11324 ?auto_11338 ) ) ( not ( = ?auto_11324 ?auto_11359 ) ) ( not ( = ?auto_11324 ?auto_11356 ) ) ( not ( = ?auto_11324 ?auto_11345 ) ) ( not ( = ?auto_11354 ?auto_11351 ) ) ( not ( = ?auto_11354 ?auto_11339 ) ) ( not ( = ?auto_11354 ?auto_11349 ) ) ( not ( = ?auto_11354 ?auto_11355 ) ) ( not ( = ?auto_11354 ?auto_11350 ) ) ( not ( = ?auto_11354 ?auto_11338 ) ) ( not ( = ?auto_11354 ?auto_11359 ) ) ( not ( = ?auto_11354 ?auto_11356 ) ) ( not ( = ?auto_11354 ?auto_11345 ) ) ( not ( = ?auto_11314 ?auto_11325 ) ) ( not ( = ?auto_11314 ?auto_11333 ) ) ( not ( = ?auto_11315 ?auto_11325 ) ) ( not ( = ?auto_11315 ?auto_11333 ) ) ( not ( = ?auto_11316 ?auto_11325 ) ) ( not ( = ?auto_11316 ?auto_11333 ) ) ( not ( = ?auto_11317 ?auto_11325 ) ) ( not ( = ?auto_11317 ?auto_11333 ) ) ( not ( = ?auto_11318 ?auto_11325 ) ) ( not ( = ?auto_11318 ?auto_11333 ) ) ( not ( = ?auto_11319 ?auto_11325 ) ) ( not ( = ?auto_11319 ?auto_11333 ) ) ( not ( = ?auto_11320 ?auto_11325 ) ) ( not ( = ?auto_11320 ?auto_11333 ) ) ( not ( = ?auto_11321 ?auto_11325 ) ) ( not ( = ?auto_11321 ?auto_11333 ) ) ( not ( = ?auto_11322 ?auto_11325 ) ) ( not ( = ?auto_11322 ?auto_11333 ) ) ( not ( = ?auto_11323 ?auto_11325 ) ) ( not ( = ?auto_11323 ?auto_11333 ) ) ( not ( = ?auto_11325 ?auto_11354 ) ) ( not ( = ?auto_11325 ?auto_11351 ) ) ( not ( = ?auto_11325 ?auto_11339 ) ) ( not ( = ?auto_11325 ?auto_11349 ) ) ( not ( = ?auto_11325 ?auto_11355 ) ) ( not ( = ?auto_11325 ?auto_11350 ) ) ( not ( = ?auto_11325 ?auto_11338 ) ) ( not ( = ?auto_11325 ?auto_11359 ) ) ( not ( = ?auto_11325 ?auto_11356 ) ) ( not ( = ?auto_11325 ?auto_11345 ) ) ( not ( = ?auto_11328 ?auto_11342 ) ) ( not ( = ?auto_11328 ?auto_11347 ) ) ( not ( = ?auto_11328 ?auto_11336 ) ) ( not ( = ?auto_11328 ?auto_11343 ) ) ( not ( = ?auto_11328 ?auto_11335 ) ) ( not ( = ?auto_11328 ?auto_11341 ) ) ( not ( = ?auto_11328 ?auto_11334 ) ) ( not ( = ?auto_11328 ?auto_11348 ) ) ( not ( = ?auto_11327 ?auto_11357 ) ) ( not ( = ?auto_11327 ?auto_11353 ) ) ( not ( = ?auto_11327 ?auto_11358 ) ) ( not ( = ?auto_11327 ?auto_11344 ) ) ( not ( = ?auto_11327 ?auto_11337 ) ) ( not ( = ?auto_11327 ?auto_11346 ) ) ( not ( = ?auto_11327 ?auto_11340 ) ) ( not ( = ?auto_11327 ?auto_11352 ) ) ( not ( = ?auto_11333 ?auto_11354 ) ) ( not ( = ?auto_11333 ?auto_11351 ) ) ( not ( = ?auto_11333 ?auto_11339 ) ) ( not ( = ?auto_11333 ?auto_11349 ) ) ( not ( = ?auto_11333 ?auto_11355 ) ) ( not ( = ?auto_11333 ?auto_11350 ) ) ( not ( = ?auto_11333 ?auto_11338 ) ) ( not ( = ?auto_11333 ?auto_11359 ) ) ( not ( = ?auto_11333 ?auto_11356 ) ) ( not ( = ?auto_11333 ?auto_11345 ) ) ( not ( = ?auto_11314 ?auto_11326 ) ) ( not ( = ?auto_11314 ?auto_11329 ) ) ( not ( = ?auto_11315 ?auto_11326 ) ) ( not ( = ?auto_11315 ?auto_11329 ) ) ( not ( = ?auto_11316 ?auto_11326 ) ) ( not ( = ?auto_11316 ?auto_11329 ) ) ( not ( = ?auto_11317 ?auto_11326 ) ) ( not ( = ?auto_11317 ?auto_11329 ) ) ( not ( = ?auto_11318 ?auto_11326 ) ) ( not ( = ?auto_11318 ?auto_11329 ) ) ( not ( = ?auto_11319 ?auto_11326 ) ) ( not ( = ?auto_11319 ?auto_11329 ) ) ( not ( = ?auto_11320 ?auto_11326 ) ) ( not ( = ?auto_11320 ?auto_11329 ) ) ( not ( = ?auto_11321 ?auto_11326 ) ) ( not ( = ?auto_11321 ?auto_11329 ) ) ( not ( = ?auto_11322 ?auto_11326 ) ) ( not ( = ?auto_11322 ?auto_11329 ) ) ( not ( = ?auto_11323 ?auto_11326 ) ) ( not ( = ?auto_11323 ?auto_11329 ) ) ( not ( = ?auto_11324 ?auto_11326 ) ) ( not ( = ?auto_11324 ?auto_11329 ) ) ( not ( = ?auto_11326 ?auto_11333 ) ) ( not ( = ?auto_11326 ?auto_11354 ) ) ( not ( = ?auto_11326 ?auto_11351 ) ) ( not ( = ?auto_11326 ?auto_11339 ) ) ( not ( = ?auto_11326 ?auto_11349 ) ) ( not ( = ?auto_11326 ?auto_11355 ) ) ( not ( = ?auto_11326 ?auto_11350 ) ) ( not ( = ?auto_11326 ?auto_11338 ) ) ( not ( = ?auto_11326 ?auto_11359 ) ) ( not ( = ?auto_11326 ?auto_11356 ) ) ( not ( = ?auto_11326 ?auto_11345 ) ) ( not ( = ?auto_11329 ?auto_11333 ) ) ( not ( = ?auto_11329 ?auto_11354 ) ) ( not ( = ?auto_11329 ?auto_11351 ) ) ( not ( = ?auto_11329 ?auto_11339 ) ) ( not ( = ?auto_11329 ?auto_11349 ) ) ( not ( = ?auto_11329 ?auto_11355 ) ) ( not ( = ?auto_11329 ?auto_11350 ) ) ( not ( = ?auto_11329 ?auto_11338 ) ) ( not ( = ?auto_11329 ?auto_11359 ) ) ( not ( = ?auto_11329 ?auto_11356 ) ) ( not ( = ?auto_11329 ?auto_11345 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_11314 ?auto_11315 ?auto_11316 ?auto_11317 ?auto_11318 ?auto_11319 ?auto_11320 ?auto_11321 ?auto_11322 ?auto_11323 ?auto_11324 ?auto_11325 )
      ( MAKE-1CRATE ?auto_11325 ?auto_11326 )
      ( MAKE-12CRATE-VERIFY ?auto_11314 ?auto_11315 ?auto_11316 ?auto_11317 ?auto_11318 ?auto_11319 ?auto_11320 ?auto_11321 ?auto_11322 ?auto_11323 ?auto_11324 ?auto_11325 ?auto_11326 ) )
  )

)

