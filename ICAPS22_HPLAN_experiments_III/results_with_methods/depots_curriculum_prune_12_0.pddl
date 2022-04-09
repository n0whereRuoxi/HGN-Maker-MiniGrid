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
      ?auto_10845 - HOIST
      ?auto_10844 - PLACE
      ?auto_10846 - PLACE
      ?auto_10843 - HOIST
      ?auto_10842 - SURFACE
      ?auto_10849 - PLACE
      ?auto_10850 - HOIST
      ?auto_10848 - SURFACE
      ?auto_10847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10845 ?auto_10844 ) ( IS-CRATE ?auto_10841 ) ( not ( = ?auto_10846 ?auto_10844 ) ) ( HOIST-AT ?auto_10843 ?auto_10846 ) ( AVAILABLE ?auto_10843 ) ( SURFACE-AT ?auto_10841 ?auto_10846 ) ( ON ?auto_10841 ?auto_10842 ) ( CLEAR ?auto_10841 ) ( not ( = ?auto_10840 ?auto_10841 ) ) ( not ( = ?auto_10840 ?auto_10842 ) ) ( not ( = ?auto_10841 ?auto_10842 ) ) ( not ( = ?auto_10845 ?auto_10843 ) ) ( SURFACE-AT ?auto_10839 ?auto_10844 ) ( CLEAR ?auto_10839 ) ( IS-CRATE ?auto_10840 ) ( AVAILABLE ?auto_10845 ) ( not ( = ?auto_10849 ?auto_10844 ) ) ( HOIST-AT ?auto_10850 ?auto_10849 ) ( AVAILABLE ?auto_10850 ) ( SURFACE-AT ?auto_10840 ?auto_10849 ) ( ON ?auto_10840 ?auto_10848 ) ( CLEAR ?auto_10840 ) ( TRUCK-AT ?auto_10847 ?auto_10844 ) ( not ( = ?auto_10839 ?auto_10840 ) ) ( not ( = ?auto_10839 ?auto_10848 ) ) ( not ( = ?auto_10840 ?auto_10848 ) ) ( not ( = ?auto_10845 ?auto_10850 ) ) ( not ( = ?auto_10839 ?auto_10841 ) ) ( not ( = ?auto_10839 ?auto_10842 ) ) ( not ( = ?auto_10841 ?auto_10848 ) ) ( not ( = ?auto_10846 ?auto_10849 ) ) ( not ( = ?auto_10843 ?auto_10850 ) ) ( not ( = ?auto_10842 ?auto_10848 ) ) )
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
      ?auto_10871 - PLACE
      ?auto_10869 - PLACE
      ?auto_10872 - HOIST
      ?auto_10873 - SURFACE
      ?auto_10875 - PLACE
      ?auto_10880 - HOIST
      ?auto_10879 - SURFACE
      ?auto_10876 - PLACE
      ?auto_10877 - HOIST
      ?auto_10878 - SURFACE
      ?auto_10874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10870 ?auto_10871 ) ( IS-CRATE ?auto_10868 ) ( not ( = ?auto_10869 ?auto_10871 ) ) ( HOIST-AT ?auto_10872 ?auto_10869 ) ( AVAILABLE ?auto_10872 ) ( SURFACE-AT ?auto_10868 ?auto_10869 ) ( ON ?auto_10868 ?auto_10873 ) ( CLEAR ?auto_10868 ) ( not ( = ?auto_10867 ?auto_10868 ) ) ( not ( = ?auto_10867 ?auto_10873 ) ) ( not ( = ?auto_10868 ?auto_10873 ) ) ( not ( = ?auto_10870 ?auto_10872 ) ) ( IS-CRATE ?auto_10867 ) ( not ( = ?auto_10875 ?auto_10871 ) ) ( HOIST-AT ?auto_10880 ?auto_10875 ) ( AVAILABLE ?auto_10880 ) ( SURFACE-AT ?auto_10867 ?auto_10875 ) ( ON ?auto_10867 ?auto_10879 ) ( CLEAR ?auto_10867 ) ( not ( = ?auto_10866 ?auto_10867 ) ) ( not ( = ?auto_10866 ?auto_10879 ) ) ( not ( = ?auto_10867 ?auto_10879 ) ) ( not ( = ?auto_10870 ?auto_10880 ) ) ( SURFACE-AT ?auto_10865 ?auto_10871 ) ( CLEAR ?auto_10865 ) ( IS-CRATE ?auto_10866 ) ( AVAILABLE ?auto_10870 ) ( not ( = ?auto_10876 ?auto_10871 ) ) ( HOIST-AT ?auto_10877 ?auto_10876 ) ( AVAILABLE ?auto_10877 ) ( SURFACE-AT ?auto_10866 ?auto_10876 ) ( ON ?auto_10866 ?auto_10878 ) ( CLEAR ?auto_10866 ) ( TRUCK-AT ?auto_10874 ?auto_10871 ) ( not ( = ?auto_10865 ?auto_10866 ) ) ( not ( = ?auto_10865 ?auto_10878 ) ) ( not ( = ?auto_10866 ?auto_10878 ) ) ( not ( = ?auto_10870 ?auto_10877 ) ) ( not ( = ?auto_10865 ?auto_10867 ) ) ( not ( = ?auto_10865 ?auto_10879 ) ) ( not ( = ?auto_10867 ?auto_10878 ) ) ( not ( = ?auto_10875 ?auto_10876 ) ) ( not ( = ?auto_10880 ?auto_10877 ) ) ( not ( = ?auto_10879 ?auto_10878 ) ) ( not ( = ?auto_10865 ?auto_10868 ) ) ( not ( = ?auto_10865 ?auto_10873 ) ) ( not ( = ?auto_10866 ?auto_10868 ) ) ( not ( = ?auto_10866 ?auto_10873 ) ) ( not ( = ?auto_10868 ?auto_10879 ) ) ( not ( = ?auto_10868 ?auto_10878 ) ) ( not ( = ?auto_10869 ?auto_10875 ) ) ( not ( = ?auto_10869 ?auto_10876 ) ) ( not ( = ?auto_10872 ?auto_10880 ) ) ( not ( = ?auto_10872 ?auto_10877 ) ) ( not ( = ?auto_10873 ?auto_10879 ) ) ( not ( = ?auto_10873 ?auto_10878 ) ) )
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
      ?auto_10905 - HOIST
      ?auto_10903 - PLACE
      ?auto_10902 - PLACE
      ?auto_10906 - HOIST
      ?auto_10901 - SURFACE
      ?auto_10914 - PLACE
      ?auto_10915 - HOIST
      ?auto_10907 - SURFACE
      ?auto_10908 - PLACE
      ?auto_10911 - HOIST
      ?auto_10913 - SURFACE
      ?auto_10909 - PLACE
      ?auto_10912 - HOIST
      ?auto_10910 - SURFACE
      ?auto_10904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10905 ?auto_10903 ) ( IS-CRATE ?auto_10900 ) ( not ( = ?auto_10902 ?auto_10903 ) ) ( HOIST-AT ?auto_10906 ?auto_10902 ) ( AVAILABLE ?auto_10906 ) ( SURFACE-AT ?auto_10900 ?auto_10902 ) ( ON ?auto_10900 ?auto_10901 ) ( CLEAR ?auto_10900 ) ( not ( = ?auto_10899 ?auto_10900 ) ) ( not ( = ?auto_10899 ?auto_10901 ) ) ( not ( = ?auto_10900 ?auto_10901 ) ) ( not ( = ?auto_10905 ?auto_10906 ) ) ( IS-CRATE ?auto_10899 ) ( not ( = ?auto_10914 ?auto_10903 ) ) ( HOIST-AT ?auto_10915 ?auto_10914 ) ( AVAILABLE ?auto_10915 ) ( SURFACE-AT ?auto_10899 ?auto_10914 ) ( ON ?auto_10899 ?auto_10907 ) ( CLEAR ?auto_10899 ) ( not ( = ?auto_10898 ?auto_10899 ) ) ( not ( = ?auto_10898 ?auto_10907 ) ) ( not ( = ?auto_10899 ?auto_10907 ) ) ( not ( = ?auto_10905 ?auto_10915 ) ) ( IS-CRATE ?auto_10898 ) ( not ( = ?auto_10908 ?auto_10903 ) ) ( HOIST-AT ?auto_10911 ?auto_10908 ) ( AVAILABLE ?auto_10911 ) ( SURFACE-AT ?auto_10898 ?auto_10908 ) ( ON ?auto_10898 ?auto_10913 ) ( CLEAR ?auto_10898 ) ( not ( = ?auto_10897 ?auto_10898 ) ) ( not ( = ?auto_10897 ?auto_10913 ) ) ( not ( = ?auto_10898 ?auto_10913 ) ) ( not ( = ?auto_10905 ?auto_10911 ) ) ( SURFACE-AT ?auto_10896 ?auto_10903 ) ( CLEAR ?auto_10896 ) ( IS-CRATE ?auto_10897 ) ( AVAILABLE ?auto_10905 ) ( not ( = ?auto_10909 ?auto_10903 ) ) ( HOIST-AT ?auto_10912 ?auto_10909 ) ( AVAILABLE ?auto_10912 ) ( SURFACE-AT ?auto_10897 ?auto_10909 ) ( ON ?auto_10897 ?auto_10910 ) ( CLEAR ?auto_10897 ) ( TRUCK-AT ?auto_10904 ?auto_10903 ) ( not ( = ?auto_10896 ?auto_10897 ) ) ( not ( = ?auto_10896 ?auto_10910 ) ) ( not ( = ?auto_10897 ?auto_10910 ) ) ( not ( = ?auto_10905 ?auto_10912 ) ) ( not ( = ?auto_10896 ?auto_10898 ) ) ( not ( = ?auto_10896 ?auto_10913 ) ) ( not ( = ?auto_10898 ?auto_10910 ) ) ( not ( = ?auto_10908 ?auto_10909 ) ) ( not ( = ?auto_10911 ?auto_10912 ) ) ( not ( = ?auto_10913 ?auto_10910 ) ) ( not ( = ?auto_10896 ?auto_10899 ) ) ( not ( = ?auto_10896 ?auto_10907 ) ) ( not ( = ?auto_10897 ?auto_10899 ) ) ( not ( = ?auto_10897 ?auto_10907 ) ) ( not ( = ?auto_10899 ?auto_10913 ) ) ( not ( = ?auto_10899 ?auto_10910 ) ) ( not ( = ?auto_10914 ?auto_10908 ) ) ( not ( = ?auto_10914 ?auto_10909 ) ) ( not ( = ?auto_10915 ?auto_10911 ) ) ( not ( = ?auto_10915 ?auto_10912 ) ) ( not ( = ?auto_10907 ?auto_10913 ) ) ( not ( = ?auto_10907 ?auto_10910 ) ) ( not ( = ?auto_10896 ?auto_10900 ) ) ( not ( = ?auto_10896 ?auto_10901 ) ) ( not ( = ?auto_10897 ?auto_10900 ) ) ( not ( = ?auto_10897 ?auto_10901 ) ) ( not ( = ?auto_10898 ?auto_10900 ) ) ( not ( = ?auto_10898 ?auto_10901 ) ) ( not ( = ?auto_10900 ?auto_10907 ) ) ( not ( = ?auto_10900 ?auto_10913 ) ) ( not ( = ?auto_10900 ?auto_10910 ) ) ( not ( = ?auto_10902 ?auto_10914 ) ) ( not ( = ?auto_10902 ?auto_10908 ) ) ( not ( = ?auto_10902 ?auto_10909 ) ) ( not ( = ?auto_10906 ?auto_10915 ) ) ( not ( = ?auto_10906 ?auto_10911 ) ) ( not ( = ?auto_10906 ?auto_10912 ) ) ( not ( = ?auto_10901 ?auto_10907 ) ) ( not ( = ?auto_10901 ?auto_10913 ) ) ( not ( = ?auto_10901 ?auto_10910 ) ) )
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
      ?auto_10942 - PLACE
      ?auto_10941 - PLACE
      ?auto_10939 - HOIST
      ?auto_10940 - SURFACE
      ?auto_10950 - PLACE
      ?auto_10948 - HOIST
      ?auto_10944 - SURFACE
      ?auto_10949 - PLACE
      ?auto_10947 - HOIST
      ?auto_10945 - SURFACE
      ?auto_10954 - PLACE
      ?auto_10952 - HOIST
      ?auto_10951 - SURFACE
      ?auto_10946 - PLACE
      ?auto_10953 - HOIST
      ?auto_10955 - SURFACE
      ?auto_10938 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10943 ?auto_10942 ) ( IS-CRATE ?auto_10937 ) ( not ( = ?auto_10941 ?auto_10942 ) ) ( HOIST-AT ?auto_10939 ?auto_10941 ) ( AVAILABLE ?auto_10939 ) ( SURFACE-AT ?auto_10937 ?auto_10941 ) ( ON ?auto_10937 ?auto_10940 ) ( CLEAR ?auto_10937 ) ( not ( = ?auto_10936 ?auto_10937 ) ) ( not ( = ?auto_10936 ?auto_10940 ) ) ( not ( = ?auto_10937 ?auto_10940 ) ) ( not ( = ?auto_10943 ?auto_10939 ) ) ( IS-CRATE ?auto_10936 ) ( not ( = ?auto_10950 ?auto_10942 ) ) ( HOIST-AT ?auto_10948 ?auto_10950 ) ( AVAILABLE ?auto_10948 ) ( SURFACE-AT ?auto_10936 ?auto_10950 ) ( ON ?auto_10936 ?auto_10944 ) ( CLEAR ?auto_10936 ) ( not ( = ?auto_10935 ?auto_10936 ) ) ( not ( = ?auto_10935 ?auto_10944 ) ) ( not ( = ?auto_10936 ?auto_10944 ) ) ( not ( = ?auto_10943 ?auto_10948 ) ) ( IS-CRATE ?auto_10935 ) ( not ( = ?auto_10949 ?auto_10942 ) ) ( HOIST-AT ?auto_10947 ?auto_10949 ) ( AVAILABLE ?auto_10947 ) ( SURFACE-AT ?auto_10935 ?auto_10949 ) ( ON ?auto_10935 ?auto_10945 ) ( CLEAR ?auto_10935 ) ( not ( = ?auto_10934 ?auto_10935 ) ) ( not ( = ?auto_10934 ?auto_10945 ) ) ( not ( = ?auto_10935 ?auto_10945 ) ) ( not ( = ?auto_10943 ?auto_10947 ) ) ( IS-CRATE ?auto_10934 ) ( not ( = ?auto_10954 ?auto_10942 ) ) ( HOIST-AT ?auto_10952 ?auto_10954 ) ( AVAILABLE ?auto_10952 ) ( SURFACE-AT ?auto_10934 ?auto_10954 ) ( ON ?auto_10934 ?auto_10951 ) ( CLEAR ?auto_10934 ) ( not ( = ?auto_10933 ?auto_10934 ) ) ( not ( = ?auto_10933 ?auto_10951 ) ) ( not ( = ?auto_10934 ?auto_10951 ) ) ( not ( = ?auto_10943 ?auto_10952 ) ) ( SURFACE-AT ?auto_10932 ?auto_10942 ) ( CLEAR ?auto_10932 ) ( IS-CRATE ?auto_10933 ) ( AVAILABLE ?auto_10943 ) ( not ( = ?auto_10946 ?auto_10942 ) ) ( HOIST-AT ?auto_10953 ?auto_10946 ) ( AVAILABLE ?auto_10953 ) ( SURFACE-AT ?auto_10933 ?auto_10946 ) ( ON ?auto_10933 ?auto_10955 ) ( CLEAR ?auto_10933 ) ( TRUCK-AT ?auto_10938 ?auto_10942 ) ( not ( = ?auto_10932 ?auto_10933 ) ) ( not ( = ?auto_10932 ?auto_10955 ) ) ( not ( = ?auto_10933 ?auto_10955 ) ) ( not ( = ?auto_10943 ?auto_10953 ) ) ( not ( = ?auto_10932 ?auto_10934 ) ) ( not ( = ?auto_10932 ?auto_10951 ) ) ( not ( = ?auto_10934 ?auto_10955 ) ) ( not ( = ?auto_10954 ?auto_10946 ) ) ( not ( = ?auto_10952 ?auto_10953 ) ) ( not ( = ?auto_10951 ?auto_10955 ) ) ( not ( = ?auto_10932 ?auto_10935 ) ) ( not ( = ?auto_10932 ?auto_10945 ) ) ( not ( = ?auto_10933 ?auto_10935 ) ) ( not ( = ?auto_10933 ?auto_10945 ) ) ( not ( = ?auto_10935 ?auto_10951 ) ) ( not ( = ?auto_10935 ?auto_10955 ) ) ( not ( = ?auto_10949 ?auto_10954 ) ) ( not ( = ?auto_10949 ?auto_10946 ) ) ( not ( = ?auto_10947 ?auto_10952 ) ) ( not ( = ?auto_10947 ?auto_10953 ) ) ( not ( = ?auto_10945 ?auto_10951 ) ) ( not ( = ?auto_10945 ?auto_10955 ) ) ( not ( = ?auto_10932 ?auto_10936 ) ) ( not ( = ?auto_10932 ?auto_10944 ) ) ( not ( = ?auto_10933 ?auto_10936 ) ) ( not ( = ?auto_10933 ?auto_10944 ) ) ( not ( = ?auto_10934 ?auto_10936 ) ) ( not ( = ?auto_10934 ?auto_10944 ) ) ( not ( = ?auto_10936 ?auto_10945 ) ) ( not ( = ?auto_10936 ?auto_10951 ) ) ( not ( = ?auto_10936 ?auto_10955 ) ) ( not ( = ?auto_10950 ?auto_10949 ) ) ( not ( = ?auto_10950 ?auto_10954 ) ) ( not ( = ?auto_10950 ?auto_10946 ) ) ( not ( = ?auto_10948 ?auto_10947 ) ) ( not ( = ?auto_10948 ?auto_10952 ) ) ( not ( = ?auto_10948 ?auto_10953 ) ) ( not ( = ?auto_10944 ?auto_10945 ) ) ( not ( = ?auto_10944 ?auto_10951 ) ) ( not ( = ?auto_10944 ?auto_10955 ) ) ( not ( = ?auto_10932 ?auto_10937 ) ) ( not ( = ?auto_10932 ?auto_10940 ) ) ( not ( = ?auto_10933 ?auto_10937 ) ) ( not ( = ?auto_10933 ?auto_10940 ) ) ( not ( = ?auto_10934 ?auto_10937 ) ) ( not ( = ?auto_10934 ?auto_10940 ) ) ( not ( = ?auto_10935 ?auto_10937 ) ) ( not ( = ?auto_10935 ?auto_10940 ) ) ( not ( = ?auto_10937 ?auto_10944 ) ) ( not ( = ?auto_10937 ?auto_10945 ) ) ( not ( = ?auto_10937 ?auto_10951 ) ) ( not ( = ?auto_10937 ?auto_10955 ) ) ( not ( = ?auto_10941 ?auto_10950 ) ) ( not ( = ?auto_10941 ?auto_10949 ) ) ( not ( = ?auto_10941 ?auto_10954 ) ) ( not ( = ?auto_10941 ?auto_10946 ) ) ( not ( = ?auto_10939 ?auto_10948 ) ) ( not ( = ?auto_10939 ?auto_10947 ) ) ( not ( = ?auto_10939 ?auto_10952 ) ) ( not ( = ?auto_10939 ?auto_10953 ) ) ( not ( = ?auto_10940 ?auto_10944 ) ) ( not ( = ?auto_10940 ?auto_10945 ) ) ( not ( = ?auto_10940 ?auto_10951 ) ) ( not ( = ?auto_10940 ?auto_10955 ) ) )
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
      ?auto_10980 - HOIST
      ?auto_10981 - PLACE
      ?auto_10985 - PLACE
      ?auto_10983 - HOIST
      ?auto_10982 - SURFACE
      ?auto_10994 - PLACE
      ?auto_10988 - HOIST
      ?auto_10993 - SURFACE
      ?auto_11000 - PLACE
      ?auto_10999 - HOIST
      ?auto_10997 - SURFACE
      ?auto_10989 - PLACE
      ?auto_10998 - HOIST
      ?auto_10995 - SURFACE
      ?auto_10987 - PLACE
      ?auto_10991 - HOIST
      ?auto_10990 - SURFACE
      ?auto_10996 - PLACE
      ?auto_10986 - HOIST
      ?auto_10992 - SURFACE
      ?auto_10984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10980 ?auto_10981 ) ( IS-CRATE ?auto_10979 ) ( not ( = ?auto_10985 ?auto_10981 ) ) ( HOIST-AT ?auto_10983 ?auto_10985 ) ( AVAILABLE ?auto_10983 ) ( SURFACE-AT ?auto_10979 ?auto_10985 ) ( ON ?auto_10979 ?auto_10982 ) ( CLEAR ?auto_10979 ) ( not ( = ?auto_10978 ?auto_10979 ) ) ( not ( = ?auto_10978 ?auto_10982 ) ) ( not ( = ?auto_10979 ?auto_10982 ) ) ( not ( = ?auto_10980 ?auto_10983 ) ) ( IS-CRATE ?auto_10978 ) ( not ( = ?auto_10994 ?auto_10981 ) ) ( HOIST-AT ?auto_10988 ?auto_10994 ) ( AVAILABLE ?auto_10988 ) ( SURFACE-AT ?auto_10978 ?auto_10994 ) ( ON ?auto_10978 ?auto_10993 ) ( CLEAR ?auto_10978 ) ( not ( = ?auto_10977 ?auto_10978 ) ) ( not ( = ?auto_10977 ?auto_10993 ) ) ( not ( = ?auto_10978 ?auto_10993 ) ) ( not ( = ?auto_10980 ?auto_10988 ) ) ( IS-CRATE ?auto_10977 ) ( not ( = ?auto_11000 ?auto_10981 ) ) ( HOIST-AT ?auto_10999 ?auto_11000 ) ( AVAILABLE ?auto_10999 ) ( SURFACE-AT ?auto_10977 ?auto_11000 ) ( ON ?auto_10977 ?auto_10997 ) ( CLEAR ?auto_10977 ) ( not ( = ?auto_10976 ?auto_10977 ) ) ( not ( = ?auto_10976 ?auto_10997 ) ) ( not ( = ?auto_10977 ?auto_10997 ) ) ( not ( = ?auto_10980 ?auto_10999 ) ) ( IS-CRATE ?auto_10976 ) ( not ( = ?auto_10989 ?auto_10981 ) ) ( HOIST-AT ?auto_10998 ?auto_10989 ) ( AVAILABLE ?auto_10998 ) ( SURFACE-AT ?auto_10976 ?auto_10989 ) ( ON ?auto_10976 ?auto_10995 ) ( CLEAR ?auto_10976 ) ( not ( = ?auto_10975 ?auto_10976 ) ) ( not ( = ?auto_10975 ?auto_10995 ) ) ( not ( = ?auto_10976 ?auto_10995 ) ) ( not ( = ?auto_10980 ?auto_10998 ) ) ( IS-CRATE ?auto_10975 ) ( not ( = ?auto_10987 ?auto_10981 ) ) ( HOIST-AT ?auto_10991 ?auto_10987 ) ( AVAILABLE ?auto_10991 ) ( SURFACE-AT ?auto_10975 ?auto_10987 ) ( ON ?auto_10975 ?auto_10990 ) ( CLEAR ?auto_10975 ) ( not ( = ?auto_10974 ?auto_10975 ) ) ( not ( = ?auto_10974 ?auto_10990 ) ) ( not ( = ?auto_10975 ?auto_10990 ) ) ( not ( = ?auto_10980 ?auto_10991 ) ) ( SURFACE-AT ?auto_10973 ?auto_10981 ) ( CLEAR ?auto_10973 ) ( IS-CRATE ?auto_10974 ) ( AVAILABLE ?auto_10980 ) ( not ( = ?auto_10996 ?auto_10981 ) ) ( HOIST-AT ?auto_10986 ?auto_10996 ) ( AVAILABLE ?auto_10986 ) ( SURFACE-AT ?auto_10974 ?auto_10996 ) ( ON ?auto_10974 ?auto_10992 ) ( CLEAR ?auto_10974 ) ( TRUCK-AT ?auto_10984 ?auto_10981 ) ( not ( = ?auto_10973 ?auto_10974 ) ) ( not ( = ?auto_10973 ?auto_10992 ) ) ( not ( = ?auto_10974 ?auto_10992 ) ) ( not ( = ?auto_10980 ?auto_10986 ) ) ( not ( = ?auto_10973 ?auto_10975 ) ) ( not ( = ?auto_10973 ?auto_10990 ) ) ( not ( = ?auto_10975 ?auto_10992 ) ) ( not ( = ?auto_10987 ?auto_10996 ) ) ( not ( = ?auto_10991 ?auto_10986 ) ) ( not ( = ?auto_10990 ?auto_10992 ) ) ( not ( = ?auto_10973 ?auto_10976 ) ) ( not ( = ?auto_10973 ?auto_10995 ) ) ( not ( = ?auto_10974 ?auto_10976 ) ) ( not ( = ?auto_10974 ?auto_10995 ) ) ( not ( = ?auto_10976 ?auto_10990 ) ) ( not ( = ?auto_10976 ?auto_10992 ) ) ( not ( = ?auto_10989 ?auto_10987 ) ) ( not ( = ?auto_10989 ?auto_10996 ) ) ( not ( = ?auto_10998 ?auto_10991 ) ) ( not ( = ?auto_10998 ?auto_10986 ) ) ( not ( = ?auto_10995 ?auto_10990 ) ) ( not ( = ?auto_10995 ?auto_10992 ) ) ( not ( = ?auto_10973 ?auto_10977 ) ) ( not ( = ?auto_10973 ?auto_10997 ) ) ( not ( = ?auto_10974 ?auto_10977 ) ) ( not ( = ?auto_10974 ?auto_10997 ) ) ( not ( = ?auto_10975 ?auto_10977 ) ) ( not ( = ?auto_10975 ?auto_10997 ) ) ( not ( = ?auto_10977 ?auto_10995 ) ) ( not ( = ?auto_10977 ?auto_10990 ) ) ( not ( = ?auto_10977 ?auto_10992 ) ) ( not ( = ?auto_11000 ?auto_10989 ) ) ( not ( = ?auto_11000 ?auto_10987 ) ) ( not ( = ?auto_11000 ?auto_10996 ) ) ( not ( = ?auto_10999 ?auto_10998 ) ) ( not ( = ?auto_10999 ?auto_10991 ) ) ( not ( = ?auto_10999 ?auto_10986 ) ) ( not ( = ?auto_10997 ?auto_10995 ) ) ( not ( = ?auto_10997 ?auto_10990 ) ) ( not ( = ?auto_10997 ?auto_10992 ) ) ( not ( = ?auto_10973 ?auto_10978 ) ) ( not ( = ?auto_10973 ?auto_10993 ) ) ( not ( = ?auto_10974 ?auto_10978 ) ) ( not ( = ?auto_10974 ?auto_10993 ) ) ( not ( = ?auto_10975 ?auto_10978 ) ) ( not ( = ?auto_10975 ?auto_10993 ) ) ( not ( = ?auto_10976 ?auto_10978 ) ) ( not ( = ?auto_10976 ?auto_10993 ) ) ( not ( = ?auto_10978 ?auto_10997 ) ) ( not ( = ?auto_10978 ?auto_10995 ) ) ( not ( = ?auto_10978 ?auto_10990 ) ) ( not ( = ?auto_10978 ?auto_10992 ) ) ( not ( = ?auto_10994 ?auto_11000 ) ) ( not ( = ?auto_10994 ?auto_10989 ) ) ( not ( = ?auto_10994 ?auto_10987 ) ) ( not ( = ?auto_10994 ?auto_10996 ) ) ( not ( = ?auto_10988 ?auto_10999 ) ) ( not ( = ?auto_10988 ?auto_10998 ) ) ( not ( = ?auto_10988 ?auto_10991 ) ) ( not ( = ?auto_10988 ?auto_10986 ) ) ( not ( = ?auto_10993 ?auto_10997 ) ) ( not ( = ?auto_10993 ?auto_10995 ) ) ( not ( = ?auto_10993 ?auto_10990 ) ) ( not ( = ?auto_10993 ?auto_10992 ) ) ( not ( = ?auto_10973 ?auto_10979 ) ) ( not ( = ?auto_10973 ?auto_10982 ) ) ( not ( = ?auto_10974 ?auto_10979 ) ) ( not ( = ?auto_10974 ?auto_10982 ) ) ( not ( = ?auto_10975 ?auto_10979 ) ) ( not ( = ?auto_10975 ?auto_10982 ) ) ( not ( = ?auto_10976 ?auto_10979 ) ) ( not ( = ?auto_10976 ?auto_10982 ) ) ( not ( = ?auto_10977 ?auto_10979 ) ) ( not ( = ?auto_10977 ?auto_10982 ) ) ( not ( = ?auto_10979 ?auto_10993 ) ) ( not ( = ?auto_10979 ?auto_10997 ) ) ( not ( = ?auto_10979 ?auto_10995 ) ) ( not ( = ?auto_10979 ?auto_10990 ) ) ( not ( = ?auto_10979 ?auto_10992 ) ) ( not ( = ?auto_10985 ?auto_10994 ) ) ( not ( = ?auto_10985 ?auto_11000 ) ) ( not ( = ?auto_10985 ?auto_10989 ) ) ( not ( = ?auto_10985 ?auto_10987 ) ) ( not ( = ?auto_10985 ?auto_10996 ) ) ( not ( = ?auto_10983 ?auto_10988 ) ) ( not ( = ?auto_10983 ?auto_10999 ) ) ( not ( = ?auto_10983 ?auto_10998 ) ) ( not ( = ?auto_10983 ?auto_10991 ) ) ( not ( = ?auto_10983 ?auto_10986 ) ) ( not ( = ?auto_10982 ?auto_10993 ) ) ( not ( = ?auto_10982 ?auto_10997 ) ) ( not ( = ?auto_10982 ?auto_10995 ) ) ( not ( = ?auto_10982 ?auto_10990 ) ) ( not ( = ?auto_10982 ?auto_10992 ) ) )
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
      ?auto_11032 - HOIST
      ?auto_11028 - PLACE
      ?auto_11030 - PLACE
      ?auto_11029 - HOIST
      ?auto_11027 - SURFACE
      ?auto_11033 - PLACE
      ?auto_11044 - HOIST
      ?auto_11049 - SURFACE
      ?auto_11047 - PLACE
      ?auto_11041 - HOIST
      ?auto_11037 - SURFACE
      ?auto_11042 - PLACE
      ?auto_11038 - HOIST
      ?auto_11046 - SURFACE
      ?auto_11043 - PLACE
      ?auto_11050 - HOIST
      ?auto_11040 - SURFACE
      ?auto_11039 - PLACE
      ?auto_11034 - HOIST
      ?auto_11036 - SURFACE
      ?auto_11048 - PLACE
      ?auto_11035 - HOIST
      ?auto_11045 - SURFACE
      ?auto_11031 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11032 ?auto_11028 ) ( IS-CRATE ?auto_11026 ) ( not ( = ?auto_11030 ?auto_11028 ) ) ( HOIST-AT ?auto_11029 ?auto_11030 ) ( AVAILABLE ?auto_11029 ) ( SURFACE-AT ?auto_11026 ?auto_11030 ) ( ON ?auto_11026 ?auto_11027 ) ( CLEAR ?auto_11026 ) ( not ( = ?auto_11025 ?auto_11026 ) ) ( not ( = ?auto_11025 ?auto_11027 ) ) ( not ( = ?auto_11026 ?auto_11027 ) ) ( not ( = ?auto_11032 ?auto_11029 ) ) ( IS-CRATE ?auto_11025 ) ( not ( = ?auto_11033 ?auto_11028 ) ) ( HOIST-AT ?auto_11044 ?auto_11033 ) ( AVAILABLE ?auto_11044 ) ( SURFACE-AT ?auto_11025 ?auto_11033 ) ( ON ?auto_11025 ?auto_11049 ) ( CLEAR ?auto_11025 ) ( not ( = ?auto_11024 ?auto_11025 ) ) ( not ( = ?auto_11024 ?auto_11049 ) ) ( not ( = ?auto_11025 ?auto_11049 ) ) ( not ( = ?auto_11032 ?auto_11044 ) ) ( IS-CRATE ?auto_11024 ) ( not ( = ?auto_11047 ?auto_11028 ) ) ( HOIST-AT ?auto_11041 ?auto_11047 ) ( AVAILABLE ?auto_11041 ) ( SURFACE-AT ?auto_11024 ?auto_11047 ) ( ON ?auto_11024 ?auto_11037 ) ( CLEAR ?auto_11024 ) ( not ( = ?auto_11023 ?auto_11024 ) ) ( not ( = ?auto_11023 ?auto_11037 ) ) ( not ( = ?auto_11024 ?auto_11037 ) ) ( not ( = ?auto_11032 ?auto_11041 ) ) ( IS-CRATE ?auto_11023 ) ( not ( = ?auto_11042 ?auto_11028 ) ) ( HOIST-AT ?auto_11038 ?auto_11042 ) ( AVAILABLE ?auto_11038 ) ( SURFACE-AT ?auto_11023 ?auto_11042 ) ( ON ?auto_11023 ?auto_11046 ) ( CLEAR ?auto_11023 ) ( not ( = ?auto_11022 ?auto_11023 ) ) ( not ( = ?auto_11022 ?auto_11046 ) ) ( not ( = ?auto_11023 ?auto_11046 ) ) ( not ( = ?auto_11032 ?auto_11038 ) ) ( IS-CRATE ?auto_11022 ) ( not ( = ?auto_11043 ?auto_11028 ) ) ( HOIST-AT ?auto_11050 ?auto_11043 ) ( AVAILABLE ?auto_11050 ) ( SURFACE-AT ?auto_11022 ?auto_11043 ) ( ON ?auto_11022 ?auto_11040 ) ( CLEAR ?auto_11022 ) ( not ( = ?auto_11021 ?auto_11022 ) ) ( not ( = ?auto_11021 ?auto_11040 ) ) ( not ( = ?auto_11022 ?auto_11040 ) ) ( not ( = ?auto_11032 ?auto_11050 ) ) ( IS-CRATE ?auto_11021 ) ( not ( = ?auto_11039 ?auto_11028 ) ) ( HOIST-AT ?auto_11034 ?auto_11039 ) ( AVAILABLE ?auto_11034 ) ( SURFACE-AT ?auto_11021 ?auto_11039 ) ( ON ?auto_11021 ?auto_11036 ) ( CLEAR ?auto_11021 ) ( not ( = ?auto_11020 ?auto_11021 ) ) ( not ( = ?auto_11020 ?auto_11036 ) ) ( not ( = ?auto_11021 ?auto_11036 ) ) ( not ( = ?auto_11032 ?auto_11034 ) ) ( SURFACE-AT ?auto_11019 ?auto_11028 ) ( CLEAR ?auto_11019 ) ( IS-CRATE ?auto_11020 ) ( AVAILABLE ?auto_11032 ) ( not ( = ?auto_11048 ?auto_11028 ) ) ( HOIST-AT ?auto_11035 ?auto_11048 ) ( AVAILABLE ?auto_11035 ) ( SURFACE-AT ?auto_11020 ?auto_11048 ) ( ON ?auto_11020 ?auto_11045 ) ( CLEAR ?auto_11020 ) ( TRUCK-AT ?auto_11031 ?auto_11028 ) ( not ( = ?auto_11019 ?auto_11020 ) ) ( not ( = ?auto_11019 ?auto_11045 ) ) ( not ( = ?auto_11020 ?auto_11045 ) ) ( not ( = ?auto_11032 ?auto_11035 ) ) ( not ( = ?auto_11019 ?auto_11021 ) ) ( not ( = ?auto_11019 ?auto_11036 ) ) ( not ( = ?auto_11021 ?auto_11045 ) ) ( not ( = ?auto_11039 ?auto_11048 ) ) ( not ( = ?auto_11034 ?auto_11035 ) ) ( not ( = ?auto_11036 ?auto_11045 ) ) ( not ( = ?auto_11019 ?auto_11022 ) ) ( not ( = ?auto_11019 ?auto_11040 ) ) ( not ( = ?auto_11020 ?auto_11022 ) ) ( not ( = ?auto_11020 ?auto_11040 ) ) ( not ( = ?auto_11022 ?auto_11036 ) ) ( not ( = ?auto_11022 ?auto_11045 ) ) ( not ( = ?auto_11043 ?auto_11039 ) ) ( not ( = ?auto_11043 ?auto_11048 ) ) ( not ( = ?auto_11050 ?auto_11034 ) ) ( not ( = ?auto_11050 ?auto_11035 ) ) ( not ( = ?auto_11040 ?auto_11036 ) ) ( not ( = ?auto_11040 ?auto_11045 ) ) ( not ( = ?auto_11019 ?auto_11023 ) ) ( not ( = ?auto_11019 ?auto_11046 ) ) ( not ( = ?auto_11020 ?auto_11023 ) ) ( not ( = ?auto_11020 ?auto_11046 ) ) ( not ( = ?auto_11021 ?auto_11023 ) ) ( not ( = ?auto_11021 ?auto_11046 ) ) ( not ( = ?auto_11023 ?auto_11040 ) ) ( not ( = ?auto_11023 ?auto_11036 ) ) ( not ( = ?auto_11023 ?auto_11045 ) ) ( not ( = ?auto_11042 ?auto_11043 ) ) ( not ( = ?auto_11042 ?auto_11039 ) ) ( not ( = ?auto_11042 ?auto_11048 ) ) ( not ( = ?auto_11038 ?auto_11050 ) ) ( not ( = ?auto_11038 ?auto_11034 ) ) ( not ( = ?auto_11038 ?auto_11035 ) ) ( not ( = ?auto_11046 ?auto_11040 ) ) ( not ( = ?auto_11046 ?auto_11036 ) ) ( not ( = ?auto_11046 ?auto_11045 ) ) ( not ( = ?auto_11019 ?auto_11024 ) ) ( not ( = ?auto_11019 ?auto_11037 ) ) ( not ( = ?auto_11020 ?auto_11024 ) ) ( not ( = ?auto_11020 ?auto_11037 ) ) ( not ( = ?auto_11021 ?auto_11024 ) ) ( not ( = ?auto_11021 ?auto_11037 ) ) ( not ( = ?auto_11022 ?auto_11024 ) ) ( not ( = ?auto_11022 ?auto_11037 ) ) ( not ( = ?auto_11024 ?auto_11046 ) ) ( not ( = ?auto_11024 ?auto_11040 ) ) ( not ( = ?auto_11024 ?auto_11036 ) ) ( not ( = ?auto_11024 ?auto_11045 ) ) ( not ( = ?auto_11047 ?auto_11042 ) ) ( not ( = ?auto_11047 ?auto_11043 ) ) ( not ( = ?auto_11047 ?auto_11039 ) ) ( not ( = ?auto_11047 ?auto_11048 ) ) ( not ( = ?auto_11041 ?auto_11038 ) ) ( not ( = ?auto_11041 ?auto_11050 ) ) ( not ( = ?auto_11041 ?auto_11034 ) ) ( not ( = ?auto_11041 ?auto_11035 ) ) ( not ( = ?auto_11037 ?auto_11046 ) ) ( not ( = ?auto_11037 ?auto_11040 ) ) ( not ( = ?auto_11037 ?auto_11036 ) ) ( not ( = ?auto_11037 ?auto_11045 ) ) ( not ( = ?auto_11019 ?auto_11025 ) ) ( not ( = ?auto_11019 ?auto_11049 ) ) ( not ( = ?auto_11020 ?auto_11025 ) ) ( not ( = ?auto_11020 ?auto_11049 ) ) ( not ( = ?auto_11021 ?auto_11025 ) ) ( not ( = ?auto_11021 ?auto_11049 ) ) ( not ( = ?auto_11022 ?auto_11025 ) ) ( not ( = ?auto_11022 ?auto_11049 ) ) ( not ( = ?auto_11023 ?auto_11025 ) ) ( not ( = ?auto_11023 ?auto_11049 ) ) ( not ( = ?auto_11025 ?auto_11037 ) ) ( not ( = ?auto_11025 ?auto_11046 ) ) ( not ( = ?auto_11025 ?auto_11040 ) ) ( not ( = ?auto_11025 ?auto_11036 ) ) ( not ( = ?auto_11025 ?auto_11045 ) ) ( not ( = ?auto_11033 ?auto_11047 ) ) ( not ( = ?auto_11033 ?auto_11042 ) ) ( not ( = ?auto_11033 ?auto_11043 ) ) ( not ( = ?auto_11033 ?auto_11039 ) ) ( not ( = ?auto_11033 ?auto_11048 ) ) ( not ( = ?auto_11044 ?auto_11041 ) ) ( not ( = ?auto_11044 ?auto_11038 ) ) ( not ( = ?auto_11044 ?auto_11050 ) ) ( not ( = ?auto_11044 ?auto_11034 ) ) ( not ( = ?auto_11044 ?auto_11035 ) ) ( not ( = ?auto_11049 ?auto_11037 ) ) ( not ( = ?auto_11049 ?auto_11046 ) ) ( not ( = ?auto_11049 ?auto_11040 ) ) ( not ( = ?auto_11049 ?auto_11036 ) ) ( not ( = ?auto_11049 ?auto_11045 ) ) ( not ( = ?auto_11019 ?auto_11026 ) ) ( not ( = ?auto_11019 ?auto_11027 ) ) ( not ( = ?auto_11020 ?auto_11026 ) ) ( not ( = ?auto_11020 ?auto_11027 ) ) ( not ( = ?auto_11021 ?auto_11026 ) ) ( not ( = ?auto_11021 ?auto_11027 ) ) ( not ( = ?auto_11022 ?auto_11026 ) ) ( not ( = ?auto_11022 ?auto_11027 ) ) ( not ( = ?auto_11023 ?auto_11026 ) ) ( not ( = ?auto_11023 ?auto_11027 ) ) ( not ( = ?auto_11024 ?auto_11026 ) ) ( not ( = ?auto_11024 ?auto_11027 ) ) ( not ( = ?auto_11026 ?auto_11049 ) ) ( not ( = ?auto_11026 ?auto_11037 ) ) ( not ( = ?auto_11026 ?auto_11046 ) ) ( not ( = ?auto_11026 ?auto_11040 ) ) ( not ( = ?auto_11026 ?auto_11036 ) ) ( not ( = ?auto_11026 ?auto_11045 ) ) ( not ( = ?auto_11030 ?auto_11033 ) ) ( not ( = ?auto_11030 ?auto_11047 ) ) ( not ( = ?auto_11030 ?auto_11042 ) ) ( not ( = ?auto_11030 ?auto_11043 ) ) ( not ( = ?auto_11030 ?auto_11039 ) ) ( not ( = ?auto_11030 ?auto_11048 ) ) ( not ( = ?auto_11029 ?auto_11044 ) ) ( not ( = ?auto_11029 ?auto_11041 ) ) ( not ( = ?auto_11029 ?auto_11038 ) ) ( not ( = ?auto_11029 ?auto_11050 ) ) ( not ( = ?auto_11029 ?auto_11034 ) ) ( not ( = ?auto_11029 ?auto_11035 ) ) ( not ( = ?auto_11027 ?auto_11049 ) ) ( not ( = ?auto_11027 ?auto_11037 ) ) ( not ( = ?auto_11027 ?auto_11046 ) ) ( not ( = ?auto_11027 ?auto_11040 ) ) ( not ( = ?auto_11027 ?auto_11036 ) ) ( not ( = ?auto_11027 ?auto_11045 ) ) )
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
      ?auto_11081 - HOIST
      ?auto_11080 - PLACE
      ?auto_11084 - PLACE
      ?auto_11083 - HOIST
      ?auto_11082 - SURFACE
      ?auto_11103 - PLACE
      ?auto_11104 - HOIST
      ?auto_11100 - SURFACE
      ?auto_11097 - PLACE
      ?auto_11101 - HOIST
      ?auto_11094 - SURFACE
      ?auto_11099 - PLACE
      ?auto_11095 - HOIST
      ?auto_11093 - SURFACE
      ?auto_11092 - PLACE
      ?auto_11090 - HOIST
      ?auto_11089 - SURFACE
      ?auto_11102 - PLACE
      ?auto_11105 - HOIST
      ?auto_11098 - SURFACE
      ?auto_11091 - PLACE
      ?auto_11087 - HOIST
      ?auto_11086 - SURFACE
      ?auto_11096 - PLACE
      ?auto_11088 - HOIST
      ?auto_11085 - SURFACE
      ?auto_11079 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11081 ?auto_11080 ) ( IS-CRATE ?auto_11078 ) ( not ( = ?auto_11084 ?auto_11080 ) ) ( HOIST-AT ?auto_11083 ?auto_11084 ) ( AVAILABLE ?auto_11083 ) ( SURFACE-AT ?auto_11078 ?auto_11084 ) ( ON ?auto_11078 ?auto_11082 ) ( CLEAR ?auto_11078 ) ( not ( = ?auto_11077 ?auto_11078 ) ) ( not ( = ?auto_11077 ?auto_11082 ) ) ( not ( = ?auto_11078 ?auto_11082 ) ) ( not ( = ?auto_11081 ?auto_11083 ) ) ( IS-CRATE ?auto_11077 ) ( not ( = ?auto_11103 ?auto_11080 ) ) ( HOIST-AT ?auto_11104 ?auto_11103 ) ( AVAILABLE ?auto_11104 ) ( SURFACE-AT ?auto_11077 ?auto_11103 ) ( ON ?auto_11077 ?auto_11100 ) ( CLEAR ?auto_11077 ) ( not ( = ?auto_11076 ?auto_11077 ) ) ( not ( = ?auto_11076 ?auto_11100 ) ) ( not ( = ?auto_11077 ?auto_11100 ) ) ( not ( = ?auto_11081 ?auto_11104 ) ) ( IS-CRATE ?auto_11076 ) ( not ( = ?auto_11097 ?auto_11080 ) ) ( HOIST-AT ?auto_11101 ?auto_11097 ) ( AVAILABLE ?auto_11101 ) ( SURFACE-AT ?auto_11076 ?auto_11097 ) ( ON ?auto_11076 ?auto_11094 ) ( CLEAR ?auto_11076 ) ( not ( = ?auto_11075 ?auto_11076 ) ) ( not ( = ?auto_11075 ?auto_11094 ) ) ( not ( = ?auto_11076 ?auto_11094 ) ) ( not ( = ?auto_11081 ?auto_11101 ) ) ( IS-CRATE ?auto_11075 ) ( not ( = ?auto_11099 ?auto_11080 ) ) ( HOIST-AT ?auto_11095 ?auto_11099 ) ( AVAILABLE ?auto_11095 ) ( SURFACE-AT ?auto_11075 ?auto_11099 ) ( ON ?auto_11075 ?auto_11093 ) ( CLEAR ?auto_11075 ) ( not ( = ?auto_11074 ?auto_11075 ) ) ( not ( = ?auto_11074 ?auto_11093 ) ) ( not ( = ?auto_11075 ?auto_11093 ) ) ( not ( = ?auto_11081 ?auto_11095 ) ) ( IS-CRATE ?auto_11074 ) ( not ( = ?auto_11092 ?auto_11080 ) ) ( HOIST-AT ?auto_11090 ?auto_11092 ) ( AVAILABLE ?auto_11090 ) ( SURFACE-AT ?auto_11074 ?auto_11092 ) ( ON ?auto_11074 ?auto_11089 ) ( CLEAR ?auto_11074 ) ( not ( = ?auto_11073 ?auto_11074 ) ) ( not ( = ?auto_11073 ?auto_11089 ) ) ( not ( = ?auto_11074 ?auto_11089 ) ) ( not ( = ?auto_11081 ?auto_11090 ) ) ( IS-CRATE ?auto_11073 ) ( not ( = ?auto_11102 ?auto_11080 ) ) ( HOIST-AT ?auto_11105 ?auto_11102 ) ( AVAILABLE ?auto_11105 ) ( SURFACE-AT ?auto_11073 ?auto_11102 ) ( ON ?auto_11073 ?auto_11098 ) ( CLEAR ?auto_11073 ) ( not ( = ?auto_11072 ?auto_11073 ) ) ( not ( = ?auto_11072 ?auto_11098 ) ) ( not ( = ?auto_11073 ?auto_11098 ) ) ( not ( = ?auto_11081 ?auto_11105 ) ) ( IS-CRATE ?auto_11072 ) ( not ( = ?auto_11091 ?auto_11080 ) ) ( HOIST-AT ?auto_11087 ?auto_11091 ) ( AVAILABLE ?auto_11087 ) ( SURFACE-AT ?auto_11072 ?auto_11091 ) ( ON ?auto_11072 ?auto_11086 ) ( CLEAR ?auto_11072 ) ( not ( = ?auto_11071 ?auto_11072 ) ) ( not ( = ?auto_11071 ?auto_11086 ) ) ( not ( = ?auto_11072 ?auto_11086 ) ) ( not ( = ?auto_11081 ?auto_11087 ) ) ( SURFACE-AT ?auto_11070 ?auto_11080 ) ( CLEAR ?auto_11070 ) ( IS-CRATE ?auto_11071 ) ( AVAILABLE ?auto_11081 ) ( not ( = ?auto_11096 ?auto_11080 ) ) ( HOIST-AT ?auto_11088 ?auto_11096 ) ( AVAILABLE ?auto_11088 ) ( SURFACE-AT ?auto_11071 ?auto_11096 ) ( ON ?auto_11071 ?auto_11085 ) ( CLEAR ?auto_11071 ) ( TRUCK-AT ?auto_11079 ?auto_11080 ) ( not ( = ?auto_11070 ?auto_11071 ) ) ( not ( = ?auto_11070 ?auto_11085 ) ) ( not ( = ?auto_11071 ?auto_11085 ) ) ( not ( = ?auto_11081 ?auto_11088 ) ) ( not ( = ?auto_11070 ?auto_11072 ) ) ( not ( = ?auto_11070 ?auto_11086 ) ) ( not ( = ?auto_11072 ?auto_11085 ) ) ( not ( = ?auto_11091 ?auto_11096 ) ) ( not ( = ?auto_11087 ?auto_11088 ) ) ( not ( = ?auto_11086 ?auto_11085 ) ) ( not ( = ?auto_11070 ?auto_11073 ) ) ( not ( = ?auto_11070 ?auto_11098 ) ) ( not ( = ?auto_11071 ?auto_11073 ) ) ( not ( = ?auto_11071 ?auto_11098 ) ) ( not ( = ?auto_11073 ?auto_11086 ) ) ( not ( = ?auto_11073 ?auto_11085 ) ) ( not ( = ?auto_11102 ?auto_11091 ) ) ( not ( = ?auto_11102 ?auto_11096 ) ) ( not ( = ?auto_11105 ?auto_11087 ) ) ( not ( = ?auto_11105 ?auto_11088 ) ) ( not ( = ?auto_11098 ?auto_11086 ) ) ( not ( = ?auto_11098 ?auto_11085 ) ) ( not ( = ?auto_11070 ?auto_11074 ) ) ( not ( = ?auto_11070 ?auto_11089 ) ) ( not ( = ?auto_11071 ?auto_11074 ) ) ( not ( = ?auto_11071 ?auto_11089 ) ) ( not ( = ?auto_11072 ?auto_11074 ) ) ( not ( = ?auto_11072 ?auto_11089 ) ) ( not ( = ?auto_11074 ?auto_11098 ) ) ( not ( = ?auto_11074 ?auto_11086 ) ) ( not ( = ?auto_11074 ?auto_11085 ) ) ( not ( = ?auto_11092 ?auto_11102 ) ) ( not ( = ?auto_11092 ?auto_11091 ) ) ( not ( = ?auto_11092 ?auto_11096 ) ) ( not ( = ?auto_11090 ?auto_11105 ) ) ( not ( = ?auto_11090 ?auto_11087 ) ) ( not ( = ?auto_11090 ?auto_11088 ) ) ( not ( = ?auto_11089 ?auto_11098 ) ) ( not ( = ?auto_11089 ?auto_11086 ) ) ( not ( = ?auto_11089 ?auto_11085 ) ) ( not ( = ?auto_11070 ?auto_11075 ) ) ( not ( = ?auto_11070 ?auto_11093 ) ) ( not ( = ?auto_11071 ?auto_11075 ) ) ( not ( = ?auto_11071 ?auto_11093 ) ) ( not ( = ?auto_11072 ?auto_11075 ) ) ( not ( = ?auto_11072 ?auto_11093 ) ) ( not ( = ?auto_11073 ?auto_11075 ) ) ( not ( = ?auto_11073 ?auto_11093 ) ) ( not ( = ?auto_11075 ?auto_11089 ) ) ( not ( = ?auto_11075 ?auto_11098 ) ) ( not ( = ?auto_11075 ?auto_11086 ) ) ( not ( = ?auto_11075 ?auto_11085 ) ) ( not ( = ?auto_11099 ?auto_11092 ) ) ( not ( = ?auto_11099 ?auto_11102 ) ) ( not ( = ?auto_11099 ?auto_11091 ) ) ( not ( = ?auto_11099 ?auto_11096 ) ) ( not ( = ?auto_11095 ?auto_11090 ) ) ( not ( = ?auto_11095 ?auto_11105 ) ) ( not ( = ?auto_11095 ?auto_11087 ) ) ( not ( = ?auto_11095 ?auto_11088 ) ) ( not ( = ?auto_11093 ?auto_11089 ) ) ( not ( = ?auto_11093 ?auto_11098 ) ) ( not ( = ?auto_11093 ?auto_11086 ) ) ( not ( = ?auto_11093 ?auto_11085 ) ) ( not ( = ?auto_11070 ?auto_11076 ) ) ( not ( = ?auto_11070 ?auto_11094 ) ) ( not ( = ?auto_11071 ?auto_11076 ) ) ( not ( = ?auto_11071 ?auto_11094 ) ) ( not ( = ?auto_11072 ?auto_11076 ) ) ( not ( = ?auto_11072 ?auto_11094 ) ) ( not ( = ?auto_11073 ?auto_11076 ) ) ( not ( = ?auto_11073 ?auto_11094 ) ) ( not ( = ?auto_11074 ?auto_11076 ) ) ( not ( = ?auto_11074 ?auto_11094 ) ) ( not ( = ?auto_11076 ?auto_11093 ) ) ( not ( = ?auto_11076 ?auto_11089 ) ) ( not ( = ?auto_11076 ?auto_11098 ) ) ( not ( = ?auto_11076 ?auto_11086 ) ) ( not ( = ?auto_11076 ?auto_11085 ) ) ( not ( = ?auto_11097 ?auto_11099 ) ) ( not ( = ?auto_11097 ?auto_11092 ) ) ( not ( = ?auto_11097 ?auto_11102 ) ) ( not ( = ?auto_11097 ?auto_11091 ) ) ( not ( = ?auto_11097 ?auto_11096 ) ) ( not ( = ?auto_11101 ?auto_11095 ) ) ( not ( = ?auto_11101 ?auto_11090 ) ) ( not ( = ?auto_11101 ?auto_11105 ) ) ( not ( = ?auto_11101 ?auto_11087 ) ) ( not ( = ?auto_11101 ?auto_11088 ) ) ( not ( = ?auto_11094 ?auto_11093 ) ) ( not ( = ?auto_11094 ?auto_11089 ) ) ( not ( = ?auto_11094 ?auto_11098 ) ) ( not ( = ?auto_11094 ?auto_11086 ) ) ( not ( = ?auto_11094 ?auto_11085 ) ) ( not ( = ?auto_11070 ?auto_11077 ) ) ( not ( = ?auto_11070 ?auto_11100 ) ) ( not ( = ?auto_11071 ?auto_11077 ) ) ( not ( = ?auto_11071 ?auto_11100 ) ) ( not ( = ?auto_11072 ?auto_11077 ) ) ( not ( = ?auto_11072 ?auto_11100 ) ) ( not ( = ?auto_11073 ?auto_11077 ) ) ( not ( = ?auto_11073 ?auto_11100 ) ) ( not ( = ?auto_11074 ?auto_11077 ) ) ( not ( = ?auto_11074 ?auto_11100 ) ) ( not ( = ?auto_11075 ?auto_11077 ) ) ( not ( = ?auto_11075 ?auto_11100 ) ) ( not ( = ?auto_11077 ?auto_11094 ) ) ( not ( = ?auto_11077 ?auto_11093 ) ) ( not ( = ?auto_11077 ?auto_11089 ) ) ( not ( = ?auto_11077 ?auto_11098 ) ) ( not ( = ?auto_11077 ?auto_11086 ) ) ( not ( = ?auto_11077 ?auto_11085 ) ) ( not ( = ?auto_11103 ?auto_11097 ) ) ( not ( = ?auto_11103 ?auto_11099 ) ) ( not ( = ?auto_11103 ?auto_11092 ) ) ( not ( = ?auto_11103 ?auto_11102 ) ) ( not ( = ?auto_11103 ?auto_11091 ) ) ( not ( = ?auto_11103 ?auto_11096 ) ) ( not ( = ?auto_11104 ?auto_11101 ) ) ( not ( = ?auto_11104 ?auto_11095 ) ) ( not ( = ?auto_11104 ?auto_11090 ) ) ( not ( = ?auto_11104 ?auto_11105 ) ) ( not ( = ?auto_11104 ?auto_11087 ) ) ( not ( = ?auto_11104 ?auto_11088 ) ) ( not ( = ?auto_11100 ?auto_11094 ) ) ( not ( = ?auto_11100 ?auto_11093 ) ) ( not ( = ?auto_11100 ?auto_11089 ) ) ( not ( = ?auto_11100 ?auto_11098 ) ) ( not ( = ?auto_11100 ?auto_11086 ) ) ( not ( = ?auto_11100 ?auto_11085 ) ) ( not ( = ?auto_11070 ?auto_11078 ) ) ( not ( = ?auto_11070 ?auto_11082 ) ) ( not ( = ?auto_11071 ?auto_11078 ) ) ( not ( = ?auto_11071 ?auto_11082 ) ) ( not ( = ?auto_11072 ?auto_11078 ) ) ( not ( = ?auto_11072 ?auto_11082 ) ) ( not ( = ?auto_11073 ?auto_11078 ) ) ( not ( = ?auto_11073 ?auto_11082 ) ) ( not ( = ?auto_11074 ?auto_11078 ) ) ( not ( = ?auto_11074 ?auto_11082 ) ) ( not ( = ?auto_11075 ?auto_11078 ) ) ( not ( = ?auto_11075 ?auto_11082 ) ) ( not ( = ?auto_11076 ?auto_11078 ) ) ( not ( = ?auto_11076 ?auto_11082 ) ) ( not ( = ?auto_11078 ?auto_11100 ) ) ( not ( = ?auto_11078 ?auto_11094 ) ) ( not ( = ?auto_11078 ?auto_11093 ) ) ( not ( = ?auto_11078 ?auto_11089 ) ) ( not ( = ?auto_11078 ?auto_11098 ) ) ( not ( = ?auto_11078 ?auto_11086 ) ) ( not ( = ?auto_11078 ?auto_11085 ) ) ( not ( = ?auto_11084 ?auto_11103 ) ) ( not ( = ?auto_11084 ?auto_11097 ) ) ( not ( = ?auto_11084 ?auto_11099 ) ) ( not ( = ?auto_11084 ?auto_11092 ) ) ( not ( = ?auto_11084 ?auto_11102 ) ) ( not ( = ?auto_11084 ?auto_11091 ) ) ( not ( = ?auto_11084 ?auto_11096 ) ) ( not ( = ?auto_11083 ?auto_11104 ) ) ( not ( = ?auto_11083 ?auto_11101 ) ) ( not ( = ?auto_11083 ?auto_11095 ) ) ( not ( = ?auto_11083 ?auto_11090 ) ) ( not ( = ?auto_11083 ?auto_11105 ) ) ( not ( = ?auto_11083 ?auto_11087 ) ) ( not ( = ?auto_11083 ?auto_11088 ) ) ( not ( = ?auto_11082 ?auto_11100 ) ) ( not ( = ?auto_11082 ?auto_11094 ) ) ( not ( = ?auto_11082 ?auto_11093 ) ) ( not ( = ?auto_11082 ?auto_11089 ) ) ( not ( = ?auto_11082 ?auto_11098 ) ) ( not ( = ?auto_11082 ?auto_11086 ) ) ( not ( = ?auto_11082 ?auto_11085 ) ) )
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
      ?auto_11138 - HOIST
      ?auto_11140 - PLACE
      ?auto_11139 - PLACE
      ?auto_11141 - HOIST
      ?auto_11137 - SURFACE
      ?auto_11142 - PLACE
      ?auto_11144 - HOIST
      ?auto_11143 - SURFACE
      ?auto_11149 - PLACE
      ?auto_11159 - HOIST
      ?auto_11154 - SURFACE
      ?auto_11158 - PLACE
      ?auto_11161 - HOIST
      ?auto_11148 - SURFACE
      ?auto_11153 - SURFACE
      ?auto_11145 - PLACE
      ?auto_11152 - HOIST
      ?auto_11157 - SURFACE
      ?auto_11155 - PLACE
      ?auto_11156 - HOIST
      ?auto_11151 - SURFACE
      ?auto_11150 - PLACE
      ?auto_11146 - HOIST
      ?auto_11163 - SURFACE
      ?auto_11162 - PLACE
      ?auto_11147 - HOIST
      ?auto_11160 - SURFACE
      ?auto_11136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11138 ?auto_11140 ) ( IS-CRATE ?auto_11135 ) ( not ( = ?auto_11139 ?auto_11140 ) ) ( HOIST-AT ?auto_11141 ?auto_11139 ) ( SURFACE-AT ?auto_11135 ?auto_11139 ) ( ON ?auto_11135 ?auto_11137 ) ( CLEAR ?auto_11135 ) ( not ( = ?auto_11134 ?auto_11135 ) ) ( not ( = ?auto_11134 ?auto_11137 ) ) ( not ( = ?auto_11135 ?auto_11137 ) ) ( not ( = ?auto_11138 ?auto_11141 ) ) ( IS-CRATE ?auto_11134 ) ( not ( = ?auto_11142 ?auto_11140 ) ) ( HOIST-AT ?auto_11144 ?auto_11142 ) ( AVAILABLE ?auto_11144 ) ( SURFACE-AT ?auto_11134 ?auto_11142 ) ( ON ?auto_11134 ?auto_11143 ) ( CLEAR ?auto_11134 ) ( not ( = ?auto_11133 ?auto_11134 ) ) ( not ( = ?auto_11133 ?auto_11143 ) ) ( not ( = ?auto_11134 ?auto_11143 ) ) ( not ( = ?auto_11138 ?auto_11144 ) ) ( IS-CRATE ?auto_11133 ) ( not ( = ?auto_11149 ?auto_11140 ) ) ( HOIST-AT ?auto_11159 ?auto_11149 ) ( AVAILABLE ?auto_11159 ) ( SURFACE-AT ?auto_11133 ?auto_11149 ) ( ON ?auto_11133 ?auto_11154 ) ( CLEAR ?auto_11133 ) ( not ( = ?auto_11132 ?auto_11133 ) ) ( not ( = ?auto_11132 ?auto_11154 ) ) ( not ( = ?auto_11133 ?auto_11154 ) ) ( not ( = ?auto_11138 ?auto_11159 ) ) ( IS-CRATE ?auto_11132 ) ( not ( = ?auto_11158 ?auto_11140 ) ) ( HOIST-AT ?auto_11161 ?auto_11158 ) ( AVAILABLE ?auto_11161 ) ( SURFACE-AT ?auto_11132 ?auto_11158 ) ( ON ?auto_11132 ?auto_11148 ) ( CLEAR ?auto_11132 ) ( not ( = ?auto_11131 ?auto_11132 ) ) ( not ( = ?auto_11131 ?auto_11148 ) ) ( not ( = ?auto_11132 ?auto_11148 ) ) ( not ( = ?auto_11138 ?auto_11161 ) ) ( IS-CRATE ?auto_11131 ) ( AVAILABLE ?auto_11141 ) ( SURFACE-AT ?auto_11131 ?auto_11139 ) ( ON ?auto_11131 ?auto_11153 ) ( CLEAR ?auto_11131 ) ( not ( = ?auto_11130 ?auto_11131 ) ) ( not ( = ?auto_11130 ?auto_11153 ) ) ( not ( = ?auto_11131 ?auto_11153 ) ) ( IS-CRATE ?auto_11130 ) ( not ( = ?auto_11145 ?auto_11140 ) ) ( HOIST-AT ?auto_11152 ?auto_11145 ) ( AVAILABLE ?auto_11152 ) ( SURFACE-AT ?auto_11130 ?auto_11145 ) ( ON ?auto_11130 ?auto_11157 ) ( CLEAR ?auto_11130 ) ( not ( = ?auto_11129 ?auto_11130 ) ) ( not ( = ?auto_11129 ?auto_11157 ) ) ( not ( = ?auto_11130 ?auto_11157 ) ) ( not ( = ?auto_11138 ?auto_11152 ) ) ( IS-CRATE ?auto_11129 ) ( not ( = ?auto_11155 ?auto_11140 ) ) ( HOIST-AT ?auto_11156 ?auto_11155 ) ( AVAILABLE ?auto_11156 ) ( SURFACE-AT ?auto_11129 ?auto_11155 ) ( ON ?auto_11129 ?auto_11151 ) ( CLEAR ?auto_11129 ) ( not ( = ?auto_11128 ?auto_11129 ) ) ( not ( = ?auto_11128 ?auto_11151 ) ) ( not ( = ?auto_11129 ?auto_11151 ) ) ( not ( = ?auto_11138 ?auto_11156 ) ) ( IS-CRATE ?auto_11128 ) ( not ( = ?auto_11150 ?auto_11140 ) ) ( HOIST-AT ?auto_11146 ?auto_11150 ) ( AVAILABLE ?auto_11146 ) ( SURFACE-AT ?auto_11128 ?auto_11150 ) ( ON ?auto_11128 ?auto_11163 ) ( CLEAR ?auto_11128 ) ( not ( = ?auto_11127 ?auto_11128 ) ) ( not ( = ?auto_11127 ?auto_11163 ) ) ( not ( = ?auto_11128 ?auto_11163 ) ) ( not ( = ?auto_11138 ?auto_11146 ) ) ( SURFACE-AT ?auto_11126 ?auto_11140 ) ( CLEAR ?auto_11126 ) ( IS-CRATE ?auto_11127 ) ( AVAILABLE ?auto_11138 ) ( not ( = ?auto_11162 ?auto_11140 ) ) ( HOIST-AT ?auto_11147 ?auto_11162 ) ( AVAILABLE ?auto_11147 ) ( SURFACE-AT ?auto_11127 ?auto_11162 ) ( ON ?auto_11127 ?auto_11160 ) ( CLEAR ?auto_11127 ) ( TRUCK-AT ?auto_11136 ?auto_11140 ) ( not ( = ?auto_11126 ?auto_11127 ) ) ( not ( = ?auto_11126 ?auto_11160 ) ) ( not ( = ?auto_11127 ?auto_11160 ) ) ( not ( = ?auto_11138 ?auto_11147 ) ) ( not ( = ?auto_11126 ?auto_11128 ) ) ( not ( = ?auto_11126 ?auto_11163 ) ) ( not ( = ?auto_11128 ?auto_11160 ) ) ( not ( = ?auto_11150 ?auto_11162 ) ) ( not ( = ?auto_11146 ?auto_11147 ) ) ( not ( = ?auto_11163 ?auto_11160 ) ) ( not ( = ?auto_11126 ?auto_11129 ) ) ( not ( = ?auto_11126 ?auto_11151 ) ) ( not ( = ?auto_11127 ?auto_11129 ) ) ( not ( = ?auto_11127 ?auto_11151 ) ) ( not ( = ?auto_11129 ?auto_11163 ) ) ( not ( = ?auto_11129 ?auto_11160 ) ) ( not ( = ?auto_11155 ?auto_11150 ) ) ( not ( = ?auto_11155 ?auto_11162 ) ) ( not ( = ?auto_11156 ?auto_11146 ) ) ( not ( = ?auto_11156 ?auto_11147 ) ) ( not ( = ?auto_11151 ?auto_11163 ) ) ( not ( = ?auto_11151 ?auto_11160 ) ) ( not ( = ?auto_11126 ?auto_11130 ) ) ( not ( = ?auto_11126 ?auto_11157 ) ) ( not ( = ?auto_11127 ?auto_11130 ) ) ( not ( = ?auto_11127 ?auto_11157 ) ) ( not ( = ?auto_11128 ?auto_11130 ) ) ( not ( = ?auto_11128 ?auto_11157 ) ) ( not ( = ?auto_11130 ?auto_11151 ) ) ( not ( = ?auto_11130 ?auto_11163 ) ) ( not ( = ?auto_11130 ?auto_11160 ) ) ( not ( = ?auto_11145 ?auto_11155 ) ) ( not ( = ?auto_11145 ?auto_11150 ) ) ( not ( = ?auto_11145 ?auto_11162 ) ) ( not ( = ?auto_11152 ?auto_11156 ) ) ( not ( = ?auto_11152 ?auto_11146 ) ) ( not ( = ?auto_11152 ?auto_11147 ) ) ( not ( = ?auto_11157 ?auto_11151 ) ) ( not ( = ?auto_11157 ?auto_11163 ) ) ( not ( = ?auto_11157 ?auto_11160 ) ) ( not ( = ?auto_11126 ?auto_11131 ) ) ( not ( = ?auto_11126 ?auto_11153 ) ) ( not ( = ?auto_11127 ?auto_11131 ) ) ( not ( = ?auto_11127 ?auto_11153 ) ) ( not ( = ?auto_11128 ?auto_11131 ) ) ( not ( = ?auto_11128 ?auto_11153 ) ) ( not ( = ?auto_11129 ?auto_11131 ) ) ( not ( = ?auto_11129 ?auto_11153 ) ) ( not ( = ?auto_11131 ?auto_11157 ) ) ( not ( = ?auto_11131 ?auto_11151 ) ) ( not ( = ?auto_11131 ?auto_11163 ) ) ( not ( = ?auto_11131 ?auto_11160 ) ) ( not ( = ?auto_11139 ?auto_11145 ) ) ( not ( = ?auto_11139 ?auto_11155 ) ) ( not ( = ?auto_11139 ?auto_11150 ) ) ( not ( = ?auto_11139 ?auto_11162 ) ) ( not ( = ?auto_11141 ?auto_11152 ) ) ( not ( = ?auto_11141 ?auto_11156 ) ) ( not ( = ?auto_11141 ?auto_11146 ) ) ( not ( = ?auto_11141 ?auto_11147 ) ) ( not ( = ?auto_11153 ?auto_11157 ) ) ( not ( = ?auto_11153 ?auto_11151 ) ) ( not ( = ?auto_11153 ?auto_11163 ) ) ( not ( = ?auto_11153 ?auto_11160 ) ) ( not ( = ?auto_11126 ?auto_11132 ) ) ( not ( = ?auto_11126 ?auto_11148 ) ) ( not ( = ?auto_11127 ?auto_11132 ) ) ( not ( = ?auto_11127 ?auto_11148 ) ) ( not ( = ?auto_11128 ?auto_11132 ) ) ( not ( = ?auto_11128 ?auto_11148 ) ) ( not ( = ?auto_11129 ?auto_11132 ) ) ( not ( = ?auto_11129 ?auto_11148 ) ) ( not ( = ?auto_11130 ?auto_11132 ) ) ( not ( = ?auto_11130 ?auto_11148 ) ) ( not ( = ?auto_11132 ?auto_11153 ) ) ( not ( = ?auto_11132 ?auto_11157 ) ) ( not ( = ?auto_11132 ?auto_11151 ) ) ( not ( = ?auto_11132 ?auto_11163 ) ) ( not ( = ?auto_11132 ?auto_11160 ) ) ( not ( = ?auto_11158 ?auto_11139 ) ) ( not ( = ?auto_11158 ?auto_11145 ) ) ( not ( = ?auto_11158 ?auto_11155 ) ) ( not ( = ?auto_11158 ?auto_11150 ) ) ( not ( = ?auto_11158 ?auto_11162 ) ) ( not ( = ?auto_11161 ?auto_11141 ) ) ( not ( = ?auto_11161 ?auto_11152 ) ) ( not ( = ?auto_11161 ?auto_11156 ) ) ( not ( = ?auto_11161 ?auto_11146 ) ) ( not ( = ?auto_11161 ?auto_11147 ) ) ( not ( = ?auto_11148 ?auto_11153 ) ) ( not ( = ?auto_11148 ?auto_11157 ) ) ( not ( = ?auto_11148 ?auto_11151 ) ) ( not ( = ?auto_11148 ?auto_11163 ) ) ( not ( = ?auto_11148 ?auto_11160 ) ) ( not ( = ?auto_11126 ?auto_11133 ) ) ( not ( = ?auto_11126 ?auto_11154 ) ) ( not ( = ?auto_11127 ?auto_11133 ) ) ( not ( = ?auto_11127 ?auto_11154 ) ) ( not ( = ?auto_11128 ?auto_11133 ) ) ( not ( = ?auto_11128 ?auto_11154 ) ) ( not ( = ?auto_11129 ?auto_11133 ) ) ( not ( = ?auto_11129 ?auto_11154 ) ) ( not ( = ?auto_11130 ?auto_11133 ) ) ( not ( = ?auto_11130 ?auto_11154 ) ) ( not ( = ?auto_11131 ?auto_11133 ) ) ( not ( = ?auto_11131 ?auto_11154 ) ) ( not ( = ?auto_11133 ?auto_11148 ) ) ( not ( = ?auto_11133 ?auto_11153 ) ) ( not ( = ?auto_11133 ?auto_11157 ) ) ( not ( = ?auto_11133 ?auto_11151 ) ) ( not ( = ?auto_11133 ?auto_11163 ) ) ( not ( = ?auto_11133 ?auto_11160 ) ) ( not ( = ?auto_11149 ?auto_11158 ) ) ( not ( = ?auto_11149 ?auto_11139 ) ) ( not ( = ?auto_11149 ?auto_11145 ) ) ( not ( = ?auto_11149 ?auto_11155 ) ) ( not ( = ?auto_11149 ?auto_11150 ) ) ( not ( = ?auto_11149 ?auto_11162 ) ) ( not ( = ?auto_11159 ?auto_11161 ) ) ( not ( = ?auto_11159 ?auto_11141 ) ) ( not ( = ?auto_11159 ?auto_11152 ) ) ( not ( = ?auto_11159 ?auto_11156 ) ) ( not ( = ?auto_11159 ?auto_11146 ) ) ( not ( = ?auto_11159 ?auto_11147 ) ) ( not ( = ?auto_11154 ?auto_11148 ) ) ( not ( = ?auto_11154 ?auto_11153 ) ) ( not ( = ?auto_11154 ?auto_11157 ) ) ( not ( = ?auto_11154 ?auto_11151 ) ) ( not ( = ?auto_11154 ?auto_11163 ) ) ( not ( = ?auto_11154 ?auto_11160 ) ) ( not ( = ?auto_11126 ?auto_11134 ) ) ( not ( = ?auto_11126 ?auto_11143 ) ) ( not ( = ?auto_11127 ?auto_11134 ) ) ( not ( = ?auto_11127 ?auto_11143 ) ) ( not ( = ?auto_11128 ?auto_11134 ) ) ( not ( = ?auto_11128 ?auto_11143 ) ) ( not ( = ?auto_11129 ?auto_11134 ) ) ( not ( = ?auto_11129 ?auto_11143 ) ) ( not ( = ?auto_11130 ?auto_11134 ) ) ( not ( = ?auto_11130 ?auto_11143 ) ) ( not ( = ?auto_11131 ?auto_11134 ) ) ( not ( = ?auto_11131 ?auto_11143 ) ) ( not ( = ?auto_11132 ?auto_11134 ) ) ( not ( = ?auto_11132 ?auto_11143 ) ) ( not ( = ?auto_11134 ?auto_11154 ) ) ( not ( = ?auto_11134 ?auto_11148 ) ) ( not ( = ?auto_11134 ?auto_11153 ) ) ( not ( = ?auto_11134 ?auto_11157 ) ) ( not ( = ?auto_11134 ?auto_11151 ) ) ( not ( = ?auto_11134 ?auto_11163 ) ) ( not ( = ?auto_11134 ?auto_11160 ) ) ( not ( = ?auto_11142 ?auto_11149 ) ) ( not ( = ?auto_11142 ?auto_11158 ) ) ( not ( = ?auto_11142 ?auto_11139 ) ) ( not ( = ?auto_11142 ?auto_11145 ) ) ( not ( = ?auto_11142 ?auto_11155 ) ) ( not ( = ?auto_11142 ?auto_11150 ) ) ( not ( = ?auto_11142 ?auto_11162 ) ) ( not ( = ?auto_11144 ?auto_11159 ) ) ( not ( = ?auto_11144 ?auto_11161 ) ) ( not ( = ?auto_11144 ?auto_11141 ) ) ( not ( = ?auto_11144 ?auto_11152 ) ) ( not ( = ?auto_11144 ?auto_11156 ) ) ( not ( = ?auto_11144 ?auto_11146 ) ) ( not ( = ?auto_11144 ?auto_11147 ) ) ( not ( = ?auto_11143 ?auto_11154 ) ) ( not ( = ?auto_11143 ?auto_11148 ) ) ( not ( = ?auto_11143 ?auto_11153 ) ) ( not ( = ?auto_11143 ?auto_11157 ) ) ( not ( = ?auto_11143 ?auto_11151 ) ) ( not ( = ?auto_11143 ?auto_11163 ) ) ( not ( = ?auto_11143 ?auto_11160 ) ) ( not ( = ?auto_11126 ?auto_11135 ) ) ( not ( = ?auto_11126 ?auto_11137 ) ) ( not ( = ?auto_11127 ?auto_11135 ) ) ( not ( = ?auto_11127 ?auto_11137 ) ) ( not ( = ?auto_11128 ?auto_11135 ) ) ( not ( = ?auto_11128 ?auto_11137 ) ) ( not ( = ?auto_11129 ?auto_11135 ) ) ( not ( = ?auto_11129 ?auto_11137 ) ) ( not ( = ?auto_11130 ?auto_11135 ) ) ( not ( = ?auto_11130 ?auto_11137 ) ) ( not ( = ?auto_11131 ?auto_11135 ) ) ( not ( = ?auto_11131 ?auto_11137 ) ) ( not ( = ?auto_11132 ?auto_11135 ) ) ( not ( = ?auto_11132 ?auto_11137 ) ) ( not ( = ?auto_11133 ?auto_11135 ) ) ( not ( = ?auto_11133 ?auto_11137 ) ) ( not ( = ?auto_11135 ?auto_11143 ) ) ( not ( = ?auto_11135 ?auto_11154 ) ) ( not ( = ?auto_11135 ?auto_11148 ) ) ( not ( = ?auto_11135 ?auto_11153 ) ) ( not ( = ?auto_11135 ?auto_11157 ) ) ( not ( = ?auto_11135 ?auto_11151 ) ) ( not ( = ?auto_11135 ?auto_11163 ) ) ( not ( = ?auto_11135 ?auto_11160 ) ) ( not ( = ?auto_11137 ?auto_11143 ) ) ( not ( = ?auto_11137 ?auto_11154 ) ) ( not ( = ?auto_11137 ?auto_11148 ) ) ( not ( = ?auto_11137 ?auto_11153 ) ) ( not ( = ?auto_11137 ?auto_11157 ) ) ( not ( = ?auto_11137 ?auto_11151 ) ) ( not ( = ?auto_11137 ?auto_11163 ) ) ( not ( = ?auto_11137 ?auto_11160 ) ) )
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
      ?auto_11197 - HOIST
      ?auto_11198 - PLACE
      ?auto_11200 - PLACE
      ?auto_11196 - HOIST
      ?auto_11199 - SURFACE
      ?auto_11223 - PLACE
      ?auto_11219 - HOIST
      ?auto_11224 - SURFACE
      ?auto_11215 - PLACE
      ?auto_11214 - HOIST
      ?auto_11216 - SURFACE
      ?auto_11213 - PLACE
      ?auto_11206 - HOIST
      ?auto_11209 - SURFACE
      ?auto_11208 - PLACE
      ?auto_11210 - HOIST
      ?auto_11205 - SURFACE
      ?auto_11218 - SURFACE
      ?auto_11202 - PLACE
      ?auto_11217 - HOIST
      ?auto_11204 - SURFACE
      ?auto_11211 - SURFACE
      ?auto_11212 - PLACE
      ?auto_11220 - HOIST
      ?auto_11203 - SURFACE
      ?auto_11207 - PLACE
      ?auto_11221 - HOIST
      ?auto_11222 - SURFACE
      ?auto_11201 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11197 ?auto_11198 ) ( IS-CRATE ?auto_11195 ) ( not ( = ?auto_11200 ?auto_11198 ) ) ( HOIST-AT ?auto_11196 ?auto_11200 ) ( SURFACE-AT ?auto_11195 ?auto_11200 ) ( ON ?auto_11195 ?auto_11199 ) ( CLEAR ?auto_11195 ) ( not ( = ?auto_11194 ?auto_11195 ) ) ( not ( = ?auto_11194 ?auto_11199 ) ) ( not ( = ?auto_11195 ?auto_11199 ) ) ( not ( = ?auto_11197 ?auto_11196 ) ) ( IS-CRATE ?auto_11194 ) ( not ( = ?auto_11223 ?auto_11198 ) ) ( HOIST-AT ?auto_11219 ?auto_11223 ) ( SURFACE-AT ?auto_11194 ?auto_11223 ) ( ON ?auto_11194 ?auto_11224 ) ( CLEAR ?auto_11194 ) ( not ( = ?auto_11193 ?auto_11194 ) ) ( not ( = ?auto_11193 ?auto_11224 ) ) ( not ( = ?auto_11194 ?auto_11224 ) ) ( not ( = ?auto_11197 ?auto_11219 ) ) ( IS-CRATE ?auto_11193 ) ( not ( = ?auto_11215 ?auto_11198 ) ) ( HOIST-AT ?auto_11214 ?auto_11215 ) ( AVAILABLE ?auto_11214 ) ( SURFACE-AT ?auto_11193 ?auto_11215 ) ( ON ?auto_11193 ?auto_11216 ) ( CLEAR ?auto_11193 ) ( not ( = ?auto_11192 ?auto_11193 ) ) ( not ( = ?auto_11192 ?auto_11216 ) ) ( not ( = ?auto_11193 ?auto_11216 ) ) ( not ( = ?auto_11197 ?auto_11214 ) ) ( IS-CRATE ?auto_11192 ) ( not ( = ?auto_11213 ?auto_11198 ) ) ( HOIST-AT ?auto_11206 ?auto_11213 ) ( AVAILABLE ?auto_11206 ) ( SURFACE-AT ?auto_11192 ?auto_11213 ) ( ON ?auto_11192 ?auto_11209 ) ( CLEAR ?auto_11192 ) ( not ( = ?auto_11191 ?auto_11192 ) ) ( not ( = ?auto_11191 ?auto_11209 ) ) ( not ( = ?auto_11192 ?auto_11209 ) ) ( not ( = ?auto_11197 ?auto_11206 ) ) ( IS-CRATE ?auto_11191 ) ( not ( = ?auto_11208 ?auto_11198 ) ) ( HOIST-AT ?auto_11210 ?auto_11208 ) ( AVAILABLE ?auto_11210 ) ( SURFACE-AT ?auto_11191 ?auto_11208 ) ( ON ?auto_11191 ?auto_11205 ) ( CLEAR ?auto_11191 ) ( not ( = ?auto_11190 ?auto_11191 ) ) ( not ( = ?auto_11190 ?auto_11205 ) ) ( not ( = ?auto_11191 ?auto_11205 ) ) ( not ( = ?auto_11197 ?auto_11210 ) ) ( IS-CRATE ?auto_11190 ) ( AVAILABLE ?auto_11219 ) ( SURFACE-AT ?auto_11190 ?auto_11223 ) ( ON ?auto_11190 ?auto_11218 ) ( CLEAR ?auto_11190 ) ( not ( = ?auto_11189 ?auto_11190 ) ) ( not ( = ?auto_11189 ?auto_11218 ) ) ( not ( = ?auto_11190 ?auto_11218 ) ) ( IS-CRATE ?auto_11189 ) ( not ( = ?auto_11202 ?auto_11198 ) ) ( HOIST-AT ?auto_11217 ?auto_11202 ) ( AVAILABLE ?auto_11217 ) ( SURFACE-AT ?auto_11189 ?auto_11202 ) ( ON ?auto_11189 ?auto_11204 ) ( CLEAR ?auto_11189 ) ( not ( = ?auto_11188 ?auto_11189 ) ) ( not ( = ?auto_11188 ?auto_11204 ) ) ( not ( = ?auto_11189 ?auto_11204 ) ) ( not ( = ?auto_11197 ?auto_11217 ) ) ( IS-CRATE ?auto_11188 ) ( AVAILABLE ?auto_11196 ) ( SURFACE-AT ?auto_11188 ?auto_11200 ) ( ON ?auto_11188 ?auto_11211 ) ( CLEAR ?auto_11188 ) ( not ( = ?auto_11187 ?auto_11188 ) ) ( not ( = ?auto_11187 ?auto_11211 ) ) ( not ( = ?auto_11188 ?auto_11211 ) ) ( IS-CRATE ?auto_11187 ) ( not ( = ?auto_11212 ?auto_11198 ) ) ( HOIST-AT ?auto_11220 ?auto_11212 ) ( AVAILABLE ?auto_11220 ) ( SURFACE-AT ?auto_11187 ?auto_11212 ) ( ON ?auto_11187 ?auto_11203 ) ( CLEAR ?auto_11187 ) ( not ( = ?auto_11186 ?auto_11187 ) ) ( not ( = ?auto_11186 ?auto_11203 ) ) ( not ( = ?auto_11187 ?auto_11203 ) ) ( not ( = ?auto_11197 ?auto_11220 ) ) ( SURFACE-AT ?auto_11185 ?auto_11198 ) ( CLEAR ?auto_11185 ) ( IS-CRATE ?auto_11186 ) ( AVAILABLE ?auto_11197 ) ( not ( = ?auto_11207 ?auto_11198 ) ) ( HOIST-AT ?auto_11221 ?auto_11207 ) ( AVAILABLE ?auto_11221 ) ( SURFACE-AT ?auto_11186 ?auto_11207 ) ( ON ?auto_11186 ?auto_11222 ) ( CLEAR ?auto_11186 ) ( TRUCK-AT ?auto_11201 ?auto_11198 ) ( not ( = ?auto_11185 ?auto_11186 ) ) ( not ( = ?auto_11185 ?auto_11222 ) ) ( not ( = ?auto_11186 ?auto_11222 ) ) ( not ( = ?auto_11197 ?auto_11221 ) ) ( not ( = ?auto_11185 ?auto_11187 ) ) ( not ( = ?auto_11185 ?auto_11203 ) ) ( not ( = ?auto_11187 ?auto_11222 ) ) ( not ( = ?auto_11212 ?auto_11207 ) ) ( not ( = ?auto_11220 ?auto_11221 ) ) ( not ( = ?auto_11203 ?auto_11222 ) ) ( not ( = ?auto_11185 ?auto_11188 ) ) ( not ( = ?auto_11185 ?auto_11211 ) ) ( not ( = ?auto_11186 ?auto_11188 ) ) ( not ( = ?auto_11186 ?auto_11211 ) ) ( not ( = ?auto_11188 ?auto_11203 ) ) ( not ( = ?auto_11188 ?auto_11222 ) ) ( not ( = ?auto_11200 ?auto_11212 ) ) ( not ( = ?auto_11200 ?auto_11207 ) ) ( not ( = ?auto_11196 ?auto_11220 ) ) ( not ( = ?auto_11196 ?auto_11221 ) ) ( not ( = ?auto_11211 ?auto_11203 ) ) ( not ( = ?auto_11211 ?auto_11222 ) ) ( not ( = ?auto_11185 ?auto_11189 ) ) ( not ( = ?auto_11185 ?auto_11204 ) ) ( not ( = ?auto_11186 ?auto_11189 ) ) ( not ( = ?auto_11186 ?auto_11204 ) ) ( not ( = ?auto_11187 ?auto_11189 ) ) ( not ( = ?auto_11187 ?auto_11204 ) ) ( not ( = ?auto_11189 ?auto_11211 ) ) ( not ( = ?auto_11189 ?auto_11203 ) ) ( not ( = ?auto_11189 ?auto_11222 ) ) ( not ( = ?auto_11202 ?auto_11200 ) ) ( not ( = ?auto_11202 ?auto_11212 ) ) ( not ( = ?auto_11202 ?auto_11207 ) ) ( not ( = ?auto_11217 ?auto_11196 ) ) ( not ( = ?auto_11217 ?auto_11220 ) ) ( not ( = ?auto_11217 ?auto_11221 ) ) ( not ( = ?auto_11204 ?auto_11211 ) ) ( not ( = ?auto_11204 ?auto_11203 ) ) ( not ( = ?auto_11204 ?auto_11222 ) ) ( not ( = ?auto_11185 ?auto_11190 ) ) ( not ( = ?auto_11185 ?auto_11218 ) ) ( not ( = ?auto_11186 ?auto_11190 ) ) ( not ( = ?auto_11186 ?auto_11218 ) ) ( not ( = ?auto_11187 ?auto_11190 ) ) ( not ( = ?auto_11187 ?auto_11218 ) ) ( not ( = ?auto_11188 ?auto_11190 ) ) ( not ( = ?auto_11188 ?auto_11218 ) ) ( not ( = ?auto_11190 ?auto_11204 ) ) ( not ( = ?auto_11190 ?auto_11211 ) ) ( not ( = ?auto_11190 ?auto_11203 ) ) ( not ( = ?auto_11190 ?auto_11222 ) ) ( not ( = ?auto_11223 ?auto_11202 ) ) ( not ( = ?auto_11223 ?auto_11200 ) ) ( not ( = ?auto_11223 ?auto_11212 ) ) ( not ( = ?auto_11223 ?auto_11207 ) ) ( not ( = ?auto_11219 ?auto_11217 ) ) ( not ( = ?auto_11219 ?auto_11196 ) ) ( not ( = ?auto_11219 ?auto_11220 ) ) ( not ( = ?auto_11219 ?auto_11221 ) ) ( not ( = ?auto_11218 ?auto_11204 ) ) ( not ( = ?auto_11218 ?auto_11211 ) ) ( not ( = ?auto_11218 ?auto_11203 ) ) ( not ( = ?auto_11218 ?auto_11222 ) ) ( not ( = ?auto_11185 ?auto_11191 ) ) ( not ( = ?auto_11185 ?auto_11205 ) ) ( not ( = ?auto_11186 ?auto_11191 ) ) ( not ( = ?auto_11186 ?auto_11205 ) ) ( not ( = ?auto_11187 ?auto_11191 ) ) ( not ( = ?auto_11187 ?auto_11205 ) ) ( not ( = ?auto_11188 ?auto_11191 ) ) ( not ( = ?auto_11188 ?auto_11205 ) ) ( not ( = ?auto_11189 ?auto_11191 ) ) ( not ( = ?auto_11189 ?auto_11205 ) ) ( not ( = ?auto_11191 ?auto_11218 ) ) ( not ( = ?auto_11191 ?auto_11204 ) ) ( not ( = ?auto_11191 ?auto_11211 ) ) ( not ( = ?auto_11191 ?auto_11203 ) ) ( not ( = ?auto_11191 ?auto_11222 ) ) ( not ( = ?auto_11208 ?auto_11223 ) ) ( not ( = ?auto_11208 ?auto_11202 ) ) ( not ( = ?auto_11208 ?auto_11200 ) ) ( not ( = ?auto_11208 ?auto_11212 ) ) ( not ( = ?auto_11208 ?auto_11207 ) ) ( not ( = ?auto_11210 ?auto_11219 ) ) ( not ( = ?auto_11210 ?auto_11217 ) ) ( not ( = ?auto_11210 ?auto_11196 ) ) ( not ( = ?auto_11210 ?auto_11220 ) ) ( not ( = ?auto_11210 ?auto_11221 ) ) ( not ( = ?auto_11205 ?auto_11218 ) ) ( not ( = ?auto_11205 ?auto_11204 ) ) ( not ( = ?auto_11205 ?auto_11211 ) ) ( not ( = ?auto_11205 ?auto_11203 ) ) ( not ( = ?auto_11205 ?auto_11222 ) ) ( not ( = ?auto_11185 ?auto_11192 ) ) ( not ( = ?auto_11185 ?auto_11209 ) ) ( not ( = ?auto_11186 ?auto_11192 ) ) ( not ( = ?auto_11186 ?auto_11209 ) ) ( not ( = ?auto_11187 ?auto_11192 ) ) ( not ( = ?auto_11187 ?auto_11209 ) ) ( not ( = ?auto_11188 ?auto_11192 ) ) ( not ( = ?auto_11188 ?auto_11209 ) ) ( not ( = ?auto_11189 ?auto_11192 ) ) ( not ( = ?auto_11189 ?auto_11209 ) ) ( not ( = ?auto_11190 ?auto_11192 ) ) ( not ( = ?auto_11190 ?auto_11209 ) ) ( not ( = ?auto_11192 ?auto_11205 ) ) ( not ( = ?auto_11192 ?auto_11218 ) ) ( not ( = ?auto_11192 ?auto_11204 ) ) ( not ( = ?auto_11192 ?auto_11211 ) ) ( not ( = ?auto_11192 ?auto_11203 ) ) ( not ( = ?auto_11192 ?auto_11222 ) ) ( not ( = ?auto_11213 ?auto_11208 ) ) ( not ( = ?auto_11213 ?auto_11223 ) ) ( not ( = ?auto_11213 ?auto_11202 ) ) ( not ( = ?auto_11213 ?auto_11200 ) ) ( not ( = ?auto_11213 ?auto_11212 ) ) ( not ( = ?auto_11213 ?auto_11207 ) ) ( not ( = ?auto_11206 ?auto_11210 ) ) ( not ( = ?auto_11206 ?auto_11219 ) ) ( not ( = ?auto_11206 ?auto_11217 ) ) ( not ( = ?auto_11206 ?auto_11196 ) ) ( not ( = ?auto_11206 ?auto_11220 ) ) ( not ( = ?auto_11206 ?auto_11221 ) ) ( not ( = ?auto_11209 ?auto_11205 ) ) ( not ( = ?auto_11209 ?auto_11218 ) ) ( not ( = ?auto_11209 ?auto_11204 ) ) ( not ( = ?auto_11209 ?auto_11211 ) ) ( not ( = ?auto_11209 ?auto_11203 ) ) ( not ( = ?auto_11209 ?auto_11222 ) ) ( not ( = ?auto_11185 ?auto_11193 ) ) ( not ( = ?auto_11185 ?auto_11216 ) ) ( not ( = ?auto_11186 ?auto_11193 ) ) ( not ( = ?auto_11186 ?auto_11216 ) ) ( not ( = ?auto_11187 ?auto_11193 ) ) ( not ( = ?auto_11187 ?auto_11216 ) ) ( not ( = ?auto_11188 ?auto_11193 ) ) ( not ( = ?auto_11188 ?auto_11216 ) ) ( not ( = ?auto_11189 ?auto_11193 ) ) ( not ( = ?auto_11189 ?auto_11216 ) ) ( not ( = ?auto_11190 ?auto_11193 ) ) ( not ( = ?auto_11190 ?auto_11216 ) ) ( not ( = ?auto_11191 ?auto_11193 ) ) ( not ( = ?auto_11191 ?auto_11216 ) ) ( not ( = ?auto_11193 ?auto_11209 ) ) ( not ( = ?auto_11193 ?auto_11205 ) ) ( not ( = ?auto_11193 ?auto_11218 ) ) ( not ( = ?auto_11193 ?auto_11204 ) ) ( not ( = ?auto_11193 ?auto_11211 ) ) ( not ( = ?auto_11193 ?auto_11203 ) ) ( not ( = ?auto_11193 ?auto_11222 ) ) ( not ( = ?auto_11215 ?auto_11213 ) ) ( not ( = ?auto_11215 ?auto_11208 ) ) ( not ( = ?auto_11215 ?auto_11223 ) ) ( not ( = ?auto_11215 ?auto_11202 ) ) ( not ( = ?auto_11215 ?auto_11200 ) ) ( not ( = ?auto_11215 ?auto_11212 ) ) ( not ( = ?auto_11215 ?auto_11207 ) ) ( not ( = ?auto_11214 ?auto_11206 ) ) ( not ( = ?auto_11214 ?auto_11210 ) ) ( not ( = ?auto_11214 ?auto_11219 ) ) ( not ( = ?auto_11214 ?auto_11217 ) ) ( not ( = ?auto_11214 ?auto_11196 ) ) ( not ( = ?auto_11214 ?auto_11220 ) ) ( not ( = ?auto_11214 ?auto_11221 ) ) ( not ( = ?auto_11216 ?auto_11209 ) ) ( not ( = ?auto_11216 ?auto_11205 ) ) ( not ( = ?auto_11216 ?auto_11218 ) ) ( not ( = ?auto_11216 ?auto_11204 ) ) ( not ( = ?auto_11216 ?auto_11211 ) ) ( not ( = ?auto_11216 ?auto_11203 ) ) ( not ( = ?auto_11216 ?auto_11222 ) ) ( not ( = ?auto_11185 ?auto_11194 ) ) ( not ( = ?auto_11185 ?auto_11224 ) ) ( not ( = ?auto_11186 ?auto_11194 ) ) ( not ( = ?auto_11186 ?auto_11224 ) ) ( not ( = ?auto_11187 ?auto_11194 ) ) ( not ( = ?auto_11187 ?auto_11224 ) ) ( not ( = ?auto_11188 ?auto_11194 ) ) ( not ( = ?auto_11188 ?auto_11224 ) ) ( not ( = ?auto_11189 ?auto_11194 ) ) ( not ( = ?auto_11189 ?auto_11224 ) ) ( not ( = ?auto_11190 ?auto_11194 ) ) ( not ( = ?auto_11190 ?auto_11224 ) ) ( not ( = ?auto_11191 ?auto_11194 ) ) ( not ( = ?auto_11191 ?auto_11224 ) ) ( not ( = ?auto_11192 ?auto_11194 ) ) ( not ( = ?auto_11192 ?auto_11224 ) ) ( not ( = ?auto_11194 ?auto_11216 ) ) ( not ( = ?auto_11194 ?auto_11209 ) ) ( not ( = ?auto_11194 ?auto_11205 ) ) ( not ( = ?auto_11194 ?auto_11218 ) ) ( not ( = ?auto_11194 ?auto_11204 ) ) ( not ( = ?auto_11194 ?auto_11211 ) ) ( not ( = ?auto_11194 ?auto_11203 ) ) ( not ( = ?auto_11194 ?auto_11222 ) ) ( not ( = ?auto_11224 ?auto_11216 ) ) ( not ( = ?auto_11224 ?auto_11209 ) ) ( not ( = ?auto_11224 ?auto_11205 ) ) ( not ( = ?auto_11224 ?auto_11218 ) ) ( not ( = ?auto_11224 ?auto_11204 ) ) ( not ( = ?auto_11224 ?auto_11211 ) ) ( not ( = ?auto_11224 ?auto_11203 ) ) ( not ( = ?auto_11224 ?auto_11222 ) ) ( not ( = ?auto_11185 ?auto_11195 ) ) ( not ( = ?auto_11185 ?auto_11199 ) ) ( not ( = ?auto_11186 ?auto_11195 ) ) ( not ( = ?auto_11186 ?auto_11199 ) ) ( not ( = ?auto_11187 ?auto_11195 ) ) ( not ( = ?auto_11187 ?auto_11199 ) ) ( not ( = ?auto_11188 ?auto_11195 ) ) ( not ( = ?auto_11188 ?auto_11199 ) ) ( not ( = ?auto_11189 ?auto_11195 ) ) ( not ( = ?auto_11189 ?auto_11199 ) ) ( not ( = ?auto_11190 ?auto_11195 ) ) ( not ( = ?auto_11190 ?auto_11199 ) ) ( not ( = ?auto_11191 ?auto_11195 ) ) ( not ( = ?auto_11191 ?auto_11199 ) ) ( not ( = ?auto_11192 ?auto_11195 ) ) ( not ( = ?auto_11192 ?auto_11199 ) ) ( not ( = ?auto_11193 ?auto_11195 ) ) ( not ( = ?auto_11193 ?auto_11199 ) ) ( not ( = ?auto_11195 ?auto_11224 ) ) ( not ( = ?auto_11195 ?auto_11216 ) ) ( not ( = ?auto_11195 ?auto_11209 ) ) ( not ( = ?auto_11195 ?auto_11205 ) ) ( not ( = ?auto_11195 ?auto_11218 ) ) ( not ( = ?auto_11195 ?auto_11204 ) ) ( not ( = ?auto_11195 ?auto_11211 ) ) ( not ( = ?auto_11195 ?auto_11203 ) ) ( not ( = ?auto_11195 ?auto_11222 ) ) ( not ( = ?auto_11199 ?auto_11224 ) ) ( not ( = ?auto_11199 ?auto_11216 ) ) ( not ( = ?auto_11199 ?auto_11209 ) ) ( not ( = ?auto_11199 ?auto_11205 ) ) ( not ( = ?auto_11199 ?auto_11218 ) ) ( not ( = ?auto_11199 ?auto_11204 ) ) ( not ( = ?auto_11199 ?auto_11211 ) ) ( not ( = ?auto_11199 ?auto_11203 ) ) ( not ( = ?auto_11199 ?auto_11222 ) ) )
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
      ?auto_11264 - HOIST
      ?auto_11261 - PLACE
      ?auto_11259 - PLACE
      ?auto_11262 - HOIST
      ?auto_11263 - SURFACE
      ?auto_11290 - PLACE
      ?auto_11275 - HOIST
      ?auto_11279 - SURFACE
      ?auto_11271 - PLACE
      ?auto_11265 - HOIST
      ?auto_11278 - SURFACE
      ?auto_11285 - PLACE
      ?auto_11282 - HOIST
      ?auto_11276 - SURFACE
      ?auto_11268 - PLACE
      ?auto_11269 - HOIST
      ?auto_11267 - SURFACE
      ?auto_11283 - PLACE
      ?auto_11274 - HOIST
      ?auto_11289 - SURFACE
      ?auto_11277 - SURFACE
      ?auto_11287 - PLACE
      ?auto_11281 - HOIST
      ?auto_11270 - SURFACE
      ?auto_11280 - SURFACE
      ?auto_11286 - PLACE
      ?auto_11266 - HOIST
      ?auto_11284 - SURFACE
      ?auto_11288 - PLACE
      ?auto_11273 - HOIST
      ?auto_11272 - SURFACE
      ?auto_11260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11264 ?auto_11261 ) ( IS-CRATE ?auto_11258 ) ( not ( = ?auto_11259 ?auto_11261 ) ) ( HOIST-AT ?auto_11262 ?auto_11259 ) ( AVAILABLE ?auto_11262 ) ( SURFACE-AT ?auto_11258 ?auto_11259 ) ( ON ?auto_11258 ?auto_11263 ) ( CLEAR ?auto_11258 ) ( not ( = ?auto_11257 ?auto_11258 ) ) ( not ( = ?auto_11257 ?auto_11263 ) ) ( not ( = ?auto_11258 ?auto_11263 ) ) ( not ( = ?auto_11264 ?auto_11262 ) ) ( IS-CRATE ?auto_11257 ) ( not ( = ?auto_11290 ?auto_11261 ) ) ( HOIST-AT ?auto_11275 ?auto_11290 ) ( SURFACE-AT ?auto_11257 ?auto_11290 ) ( ON ?auto_11257 ?auto_11279 ) ( CLEAR ?auto_11257 ) ( not ( = ?auto_11256 ?auto_11257 ) ) ( not ( = ?auto_11256 ?auto_11279 ) ) ( not ( = ?auto_11257 ?auto_11279 ) ) ( not ( = ?auto_11264 ?auto_11275 ) ) ( IS-CRATE ?auto_11256 ) ( not ( = ?auto_11271 ?auto_11261 ) ) ( HOIST-AT ?auto_11265 ?auto_11271 ) ( SURFACE-AT ?auto_11256 ?auto_11271 ) ( ON ?auto_11256 ?auto_11278 ) ( CLEAR ?auto_11256 ) ( not ( = ?auto_11255 ?auto_11256 ) ) ( not ( = ?auto_11255 ?auto_11278 ) ) ( not ( = ?auto_11256 ?auto_11278 ) ) ( not ( = ?auto_11264 ?auto_11265 ) ) ( IS-CRATE ?auto_11255 ) ( not ( = ?auto_11285 ?auto_11261 ) ) ( HOIST-AT ?auto_11282 ?auto_11285 ) ( AVAILABLE ?auto_11282 ) ( SURFACE-AT ?auto_11255 ?auto_11285 ) ( ON ?auto_11255 ?auto_11276 ) ( CLEAR ?auto_11255 ) ( not ( = ?auto_11254 ?auto_11255 ) ) ( not ( = ?auto_11254 ?auto_11276 ) ) ( not ( = ?auto_11255 ?auto_11276 ) ) ( not ( = ?auto_11264 ?auto_11282 ) ) ( IS-CRATE ?auto_11254 ) ( not ( = ?auto_11268 ?auto_11261 ) ) ( HOIST-AT ?auto_11269 ?auto_11268 ) ( AVAILABLE ?auto_11269 ) ( SURFACE-AT ?auto_11254 ?auto_11268 ) ( ON ?auto_11254 ?auto_11267 ) ( CLEAR ?auto_11254 ) ( not ( = ?auto_11253 ?auto_11254 ) ) ( not ( = ?auto_11253 ?auto_11267 ) ) ( not ( = ?auto_11254 ?auto_11267 ) ) ( not ( = ?auto_11264 ?auto_11269 ) ) ( IS-CRATE ?auto_11253 ) ( not ( = ?auto_11283 ?auto_11261 ) ) ( HOIST-AT ?auto_11274 ?auto_11283 ) ( AVAILABLE ?auto_11274 ) ( SURFACE-AT ?auto_11253 ?auto_11283 ) ( ON ?auto_11253 ?auto_11289 ) ( CLEAR ?auto_11253 ) ( not ( = ?auto_11252 ?auto_11253 ) ) ( not ( = ?auto_11252 ?auto_11289 ) ) ( not ( = ?auto_11253 ?auto_11289 ) ) ( not ( = ?auto_11264 ?auto_11274 ) ) ( IS-CRATE ?auto_11252 ) ( AVAILABLE ?auto_11265 ) ( SURFACE-AT ?auto_11252 ?auto_11271 ) ( ON ?auto_11252 ?auto_11277 ) ( CLEAR ?auto_11252 ) ( not ( = ?auto_11251 ?auto_11252 ) ) ( not ( = ?auto_11251 ?auto_11277 ) ) ( not ( = ?auto_11252 ?auto_11277 ) ) ( IS-CRATE ?auto_11251 ) ( not ( = ?auto_11287 ?auto_11261 ) ) ( HOIST-AT ?auto_11281 ?auto_11287 ) ( AVAILABLE ?auto_11281 ) ( SURFACE-AT ?auto_11251 ?auto_11287 ) ( ON ?auto_11251 ?auto_11270 ) ( CLEAR ?auto_11251 ) ( not ( = ?auto_11250 ?auto_11251 ) ) ( not ( = ?auto_11250 ?auto_11270 ) ) ( not ( = ?auto_11251 ?auto_11270 ) ) ( not ( = ?auto_11264 ?auto_11281 ) ) ( IS-CRATE ?auto_11250 ) ( AVAILABLE ?auto_11275 ) ( SURFACE-AT ?auto_11250 ?auto_11290 ) ( ON ?auto_11250 ?auto_11280 ) ( CLEAR ?auto_11250 ) ( not ( = ?auto_11249 ?auto_11250 ) ) ( not ( = ?auto_11249 ?auto_11280 ) ) ( not ( = ?auto_11250 ?auto_11280 ) ) ( IS-CRATE ?auto_11249 ) ( not ( = ?auto_11286 ?auto_11261 ) ) ( HOIST-AT ?auto_11266 ?auto_11286 ) ( AVAILABLE ?auto_11266 ) ( SURFACE-AT ?auto_11249 ?auto_11286 ) ( ON ?auto_11249 ?auto_11284 ) ( CLEAR ?auto_11249 ) ( not ( = ?auto_11248 ?auto_11249 ) ) ( not ( = ?auto_11248 ?auto_11284 ) ) ( not ( = ?auto_11249 ?auto_11284 ) ) ( not ( = ?auto_11264 ?auto_11266 ) ) ( SURFACE-AT ?auto_11247 ?auto_11261 ) ( CLEAR ?auto_11247 ) ( IS-CRATE ?auto_11248 ) ( AVAILABLE ?auto_11264 ) ( not ( = ?auto_11288 ?auto_11261 ) ) ( HOIST-AT ?auto_11273 ?auto_11288 ) ( AVAILABLE ?auto_11273 ) ( SURFACE-AT ?auto_11248 ?auto_11288 ) ( ON ?auto_11248 ?auto_11272 ) ( CLEAR ?auto_11248 ) ( TRUCK-AT ?auto_11260 ?auto_11261 ) ( not ( = ?auto_11247 ?auto_11248 ) ) ( not ( = ?auto_11247 ?auto_11272 ) ) ( not ( = ?auto_11248 ?auto_11272 ) ) ( not ( = ?auto_11264 ?auto_11273 ) ) ( not ( = ?auto_11247 ?auto_11249 ) ) ( not ( = ?auto_11247 ?auto_11284 ) ) ( not ( = ?auto_11249 ?auto_11272 ) ) ( not ( = ?auto_11286 ?auto_11288 ) ) ( not ( = ?auto_11266 ?auto_11273 ) ) ( not ( = ?auto_11284 ?auto_11272 ) ) ( not ( = ?auto_11247 ?auto_11250 ) ) ( not ( = ?auto_11247 ?auto_11280 ) ) ( not ( = ?auto_11248 ?auto_11250 ) ) ( not ( = ?auto_11248 ?auto_11280 ) ) ( not ( = ?auto_11250 ?auto_11284 ) ) ( not ( = ?auto_11250 ?auto_11272 ) ) ( not ( = ?auto_11290 ?auto_11286 ) ) ( not ( = ?auto_11290 ?auto_11288 ) ) ( not ( = ?auto_11275 ?auto_11266 ) ) ( not ( = ?auto_11275 ?auto_11273 ) ) ( not ( = ?auto_11280 ?auto_11284 ) ) ( not ( = ?auto_11280 ?auto_11272 ) ) ( not ( = ?auto_11247 ?auto_11251 ) ) ( not ( = ?auto_11247 ?auto_11270 ) ) ( not ( = ?auto_11248 ?auto_11251 ) ) ( not ( = ?auto_11248 ?auto_11270 ) ) ( not ( = ?auto_11249 ?auto_11251 ) ) ( not ( = ?auto_11249 ?auto_11270 ) ) ( not ( = ?auto_11251 ?auto_11280 ) ) ( not ( = ?auto_11251 ?auto_11284 ) ) ( not ( = ?auto_11251 ?auto_11272 ) ) ( not ( = ?auto_11287 ?auto_11290 ) ) ( not ( = ?auto_11287 ?auto_11286 ) ) ( not ( = ?auto_11287 ?auto_11288 ) ) ( not ( = ?auto_11281 ?auto_11275 ) ) ( not ( = ?auto_11281 ?auto_11266 ) ) ( not ( = ?auto_11281 ?auto_11273 ) ) ( not ( = ?auto_11270 ?auto_11280 ) ) ( not ( = ?auto_11270 ?auto_11284 ) ) ( not ( = ?auto_11270 ?auto_11272 ) ) ( not ( = ?auto_11247 ?auto_11252 ) ) ( not ( = ?auto_11247 ?auto_11277 ) ) ( not ( = ?auto_11248 ?auto_11252 ) ) ( not ( = ?auto_11248 ?auto_11277 ) ) ( not ( = ?auto_11249 ?auto_11252 ) ) ( not ( = ?auto_11249 ?auto_11277 ) ) ( not ( = ?auto_11250 ?auto_11252 ) ) ( not ( = ?auto_11250 ?auto_11277 ) ) ( not ( = ?auto_11252 ?auto_11270 ) ) ( not ( = ?auto_11252 ?auto_11280 ) ) ( not ( = ?auto_11252 ?auto_11284 ) ) ( not ( = ?auto_11252 ?auto_11272 ) ) ( not ( = ?auto_11271 ?auto_11287 ) ) ( not ( = ?auto_11271 ?auto_11290 ) ) ( not ( = ?auto_11271 ?auto_11286 ) ) ( not ( = ?auto_11271 ?auto_11288 ) ) ( not ( = ?auto_11265 ?auto_11281 ) ) ( not ( = ?auto_11265 ?auto_11275 ) ) ( not ( = ?auto_11265 ?auto_11266 ) ) ( not ( = ?auto_11265 ?auto_11273 ) ) ( not ( = ?auto_11277 ?auto_11270 ) ) ( not ( = ?auto_11277 ?auto_11280 ) ) ( not ( = ?auto_11277 ?auto_11284 ) ) ( not ( = ?auto_11277 ?auto_11272 ) ) ( not ( = ?auto_11247 ?auto_11253 ) ) ( not ( = ?auto_11247 ?auto_11289 ) ) ( not ( = ?auto_11248 ?auto_11253 ) ) ( not ( = ?auto_11248 ?auto_11289 ) ) ( not ( = ?auto_11249 ?auto_11253 ) ) ( not ( = ?auto_11249 ?auto_11289 ) ) ( not ( = ?auto_11250 ?auto_11253 ) ) ( not ( = ?auto_11250 ?auto_11289 ) ) ( not ( = ?auto_11251 ?auto_11253 ) ) ( not ( = ?auto_11251 ?auto_11289 ) ) ( not ( = ?auto_11253 ?auto_11277 ) ) ( not ( = ?auto_11253 ?auto_11270 ) ) ( not ( = ?auto_11253 ?auto_11280 ) ) ( not ( = ?auto_11253 ?auto_11284 ) ) ( not ( = ?auto_11253 ?auto_11272 ) ) ( not ( = ?auto_11283 ?auto_11271 ) ) ( not ( = ?auto_11283 ?auto_11287 ) ) ( not ( = ?auto_11283 ?auto_11290 ) ) ( not ( = ?auto_11283 ?auto_11286 ) ) ( not ( = ?auto_11283 ?auto_11288 ) ) ( not ( = ?auto_11274 ?auto_11265 ) ) ( not ( = ?auto_11274 ?auto_11281 ) ) ( not ( = ?auto_11274 ?auto_11275 ) ) ( not ( = ?auto_11274 ?auto_11266 ) ) ( not ( = ?auto_11274 ?auto_11273 ) ) ( not ( = ?auto_11289 ?auto_11277 ) ) ( not ( = ?auto_11289 ?auto_11270 ) ) ( not ( = ?auto_11289 ?auto_11280 ) ) ( not ( = ?auto_11289 ?auto_11284 ) ) ( not ( = ?auto_11289 ?auto_11272 ) ) ( not ( = ?auto_11247 ?auto_11254 ) ) ( not ( = ?auto_11247 ?auto_11267 ) ) ( not ( = ?auto_11248 ?auto_11254 ) ) ( not ( = ?auto_11248 ?auto_11267 ) ) ( not ( = ?auto_11249 ?auto_11254 ) ) ( not ( = ?auto_11249 ?auto_11267 ) ) ( not ( = ?auto_11250 ?auto_11254 ) ) ( not ( = ?auto_11250 ?auto_11267 ) ) ( not ( = ?auto_11251 ?auto_11254 ) ) ( not ( = ?auto_11251 ?auto_11267 ) ) ( not ( = ?auto_11252 ?auto_11254 ) ) ( not ( = ?auto_11252 ?auto_11267 ) ) ( not ( = ?auto_11254 ?auto_11289 ) ) ( not ( = ?auto_11254 ?auto_11277 ) ) ( not ( = ?auto_11254 ?auto_11270 ) ) ( not ( = ?auto_11254 ?auto_11280 ) ) ( not ( = ?auto_11254 ?auto_11284 ) ) ( not ( = ?auto_11254 ?auto_11272 ) ) ( not ( = ?auto_11268 ?auto_11283 ) ) ( not ( = ?auto_11268 ?auto_11271 ) ) ( not ( = ?auto_11268 ?auto_11287 ) ) ( not ( = ?auto_11268 ?auto_11290 ) ) ( not ( = ?auto_11268 ?auto_11286 ) ) ( not ( = ?auto_11268 ?auto_11288 ) ) ( not ( = ?auto_11269 ?auto_11274 ) ) ( not ( = ?auto_11269 ?auto_11265 ) ) ( not ( = ?auto_11269 ?auto_11281 ) ) ( not ( = ?auto_11269 ?auto_11275 ) ) ( not ( = ?auto_11269 ?auto_11266 ) ) ( not ( = ?auto_11269 ?auto_11273 ) ) ( not ( = ?auto_11267 ?auto_11289 ) ) ( not ( = ?auto_11267 ?auto_11277 ) ) ( not ( = ?auto_11267 ?auto_11270 ) ) ( not ( = ?auto_11267 ?auto_11280 ) ) ( not ( = ?auto_11267 ?auto_11284 ) ) ( not ( = ?auto_11267 ?auto_11272 ) ) ( not ( = ?auto_11247 ?auto_11255 ) ) ( not ( = ?auto_11247 ?auto_11276 ) ) ( not ( = ?auto_11248 ?auto_11255 ) ) ( not ( = ?auto_11248 ?auto_11276 ) ) ( not ( = ?auto_11249 ?auto_11255 ) ) ( not ( = ?auto_11249 ?auto_11276 ) ) ( not ( = ?auto_11250 ?auto_11255 ) ) ( not ( = ?auto_11250 ?auto_11276 ) ) ( not ( = ?auto_11251 ?auto_11255 ) ) ( not ( = ?auto_11251 ?auto_11276 ) ) ( not ( = ?auto_11252 ?auto_11255 ) ) ( not ( = ?auto_11252 ?auto_11276 ) ) ( not ( = ?auto_11253 ?auto_11255 ) ) ( not ( = ?auto_11253 ?auto_11276 ) ) ( not ( = ?auto_11255 ?auto_11267 ) ) ( not ( = ?auto_11255 ?auto_11289 ) ) ( not ( = ?auto_11255 ?auto_11277 ) ) ( not ( = ?auto_11255 ?auto_11270 ) ) ( not ( = ?auto_11255 ?auto_11280 ) ) ( not ( = ?auto_11255 ?auto_11284 ) ) ( not ( = ?auto_11255 ?auto_11272 ) ) ( not ( = ?auto_11285 ?auto_11268 ) ) ( not ( = ?auto_11285 ?auto_11283 ) ) ( not ( = ?auto_11285 ?auto_11271 ) ) ( not ( = ?auto_11285 ?auto_11287 ) ) ( not ( = ?auto_11285 ?auto_11290 ) ) ( not ( = ?auto_11285 ?auto_11286 ) ) ( not ( = ?auto_11285 ?auto_11288 ) ) ( not ( = ?auto_11282 ?auto_11269 ) ) ( not ( = ?auto_11282 ?auto_11274 ) ) ( not ( = ?auto_11282 ?auto_11265 ) ) ( not ( = ?auto_11282 ?auto_11281 ) ) ( not ( = ?auto_11282 ?auto_11275 ) ) ( not ( = ?auto_11282 ?auto_11266 ) ) ( not ( = ?auto_11282 ?auto_11273 ) ) ( not ( = ?auto_11276 ?auto_11267 ) ) ( not ( = ?auto_11276 ?auto_11289 ) ) ( not ( = ?auto_11276 ?auto_11277 ) ) ( not ( = ?auto_11276 ?auto_11270 ) ) ( not ( = ?auto_11276 ?auto_11280 ) ) ( not ( = ?auto_11276 ?auto_11284 ) ) ( not ( = ?auto_11276 ?auto_11272 ) ) ( not ( = ?auto_11247 ?auto_11256 ) ) ( not ( = ?auto_11247 ?auto_11278 ) ) ( not ( = ?auto_11248 ?auto_11256 ) ) ( not ( = ?auto_11248 ?auto_11278 ) ) ( not ( = ?auto_11249 ?auto_11256 ) ) ( not ( = ?auto_11249 ?auto_11278 ) ) ( not ( = ?auto_11250 ?auto_11256 ) ) ( not ( = ?auto_11250 ?auto_11278 ) ) ( not ( = ?auto_11251 ?auto_11256 ) ) ( not ( = ?auto_11251 ?auto_11278 ) ) ( not ( = ?auto_11252 ?auto_11256 ) ) ( not ( = ?auto_11252 ?auto_11278 ) ) ( not ( = ?auto_11253 ?auto_11256 ) ) ( not ( = ?auto_11253 ?auto_11278 ) ) ( not ( = ?auto_11254 ?auto_11256 ) ) ( not ( = ?auto_11254 ?auto_11278 ) ) ( not ( = ?auto_11256 ?auto_11276 ) ) ( not ( = ?auto_11256 ?auto_11267 ) ) ( not ( = ?auto_11256 ?auto_11289 ) ) ( not ( = ?auto_11256 ?auto_11277 ) ) ( not ( = ?auto_11256 ?auto_11270 ) ) ( not ( = ?auto_11256 ?auto_11280 ) ) ( not ( = ?auto_11256 ?auto_11284 ) ) ( not ( = ?auto_11256 ?auto_11272 ) ) ( not ( = ?auto_11278 ?auto_11276 ) ) ( not ( = ?auto_11278 ?auto_11267 ) ) ( not ( = ?auto_11278 ?auto_11289 ) ) ( not ( = ?auto_11278 ?auto_11277 ) ) ( not ( = ?auto_11278 ?auto_11270 ) ) ( not ( = ?auto_11278 ?auto_11280 ) ) ( not ( = ?auto_11278 ?auto_11284 ) ) ( not ( = ?auto_11278 ?auto_11272 ) ) ( not ( = ?auto_11247 ?auto_11257 ) ) ( not ( = ?auto_11247 ?auto_11279 ) ) ( not ( = ?auto_11248 ?auto_11257 ) ) ( not ( = ?auto_11248 ?auto_11279 ) ) ( not ( = ?auto_11249 ?auto_11257 ) ) ( not ( = ?auto_11249 ?auto_11279 ) ) ( not ( = ?auto_11250 ?auto_11257 ) ) ( not ( = ?auto_11250 ?auto_11279 ) ) ( not ( = ?auto_11251 ?auto_11257 ) ) ( not ( = ?auto_11251 ?auto_11279 ) ) ( not ( = ?auto_11252 ?auto_11257 ) ) ( not ( = ?auto_11252 ?auto_11279 ) ) ( not ( = ?auto_11253 ?auto_11257 ) ) ( not ( = ?auto_11253 ?auto_11279 ) ) ( not ( = ?auto_11254 ?auto_11257 ) ) ( not ( = ?auto_11254 ?auto_11279 ) ) ( not ( = ?auto_11255 ?auto_11257 ) ) ( not ( = ?auto_11255 ?auto_11279 ) ) ( not ( = ?auto_11257 ?auto_11278 ) ) ( not ( = ?auto_11257 ?auto_11276 ) ) ( not ( = ?auto_11257 ?auto_11267 ) ) ( not ( = ?auto_11257 ?auto_11289 ) ) ( not ( = ?auto_11257 ?auto_11277 ) ) ( not ( = ?auto_11257 ?auto_11270 ) ) ( not ( = ?auto_11257 ?auto_11280 ) ) ( not ( = ?auto_11257 ?auto_11284 ) ) ( not ( = ?auto_11257 ?auto_11272 ) ) ( not ( = ?auto_11279 ?auto_11278 ) ) ( not ( = ?auto_11279 ?auto_11276 ) ) ( not ( = ?auto_11279 ?auto_11267 ) ) ( not ( = ?auto_11279 ?auto_11289 ) ) ( not ( = ?auto_11279 ?auto_11277 ) ) ( not ( = ?auto_11279 ?auto_11270 ) ) ( not ( = ?auto_11279 ?auto_11280 ) ) ( not ( = ?auto_11279 ?auto_11284 ) ) ( not ( = ?auto_11279 ?auto_11272 ) ) ( not ( = ?auto_11247 ?auto_11258 ) ) ( not ( = ?auto_11247 ?auto_11263 ) ) ( not ( = ?auto_11248 ?auto_11258 ) ) ( not ( = ?auto_11248 ?auto_11263 ) ) ( not ( = ?auto_11249 ?auto_11258 ) ) ( not ( = ?auto_11249 ?auto_11263 ) ) ( not ( = ?auto_11250 ?auto_11258 ) ) ( not ( = ?auto_11250 ?auto_11263 ) ) ( not ( = ?auto_11251 ?auto_11258 ) ) ( not ( = ?auto_11251 ?auto_11263 ) ) ( not ( = ?auto_11252 ?auto_11258 ) ) ( not ( = ?auto_11252 ?auto_11263 ) ) ( not ( = ?auto_11253 ?auto_11258 ) ) ( not ( = ?auto_11253 ?auto_11263 ) ) ( not ( = ?auto_11254 ?auto_11258 ) ) ( not ( = ?auto_11254 ?auto_11263 ) ) ( not ( = ?auto_11255 ?auto_11258 ) ) ( not ( = ?auto_11255 ?auto_11263 ) ) ( not ( = ?auto_11256 ?auto_11258 ) ) ( not ( = ?auto_11256 ?auto_11263 ) ) ( not ( = ?auto_11258 ?auto_11279 ) ) ( not ( = ?auto_11258 ?auto_11278 ) ) ( not ( = ?auto_11258 ?auto_11276 ) ) ( not ( = ?auto_11258 ?auto_11267 ) ) ( not ( = ?auto_11258 ?auto_11289 ) ) ( not ( = ?auto_11258 ?auto_11277 ) ) ( not ( = ?auto_11258 ?auto_11270 ) ) ( not ( = ?auto_11258 ?auto_11280 ) ) ( not ( = ?auto_11258 ?auto_11284 ) ) ( not ( = ?auto_11258 ?auto_11272 ) ) ( not ( = ?auto_11259 ?auto_11290 ) ) ( not ( = ?auto_11259 ?auto_11271 ) ) ( not ( = ?auto_11259 ?auto_11285 ) ) ( not ( = ?auto_11259 ?auto_11268 ) ) ( not ( = ?auto_11259 ?auto_11283 ) ) ( not ( = ?auto_11259 ?auto_11287 ) ) ( not ( = ?auto_11259 ?auto_11286 ) ) ( not ( = ?auto_11259 ?auto_11288 ) ) ( not ( = ?auto_11262 ?auto_11275 ) ) ( not ( = ?auto_11262 ?auto_11265 ) ) ( not ( = ?auto_11262 ?auto_11282 ) ) ( not ( = ?auto_11262 ?auto_11269 ) ) ( not ( = ?auto_11262 ?auto_11274 ) ) ( not ( = ?auto_11262 ?auto_11281 ) ) ( not ( = ?auto_11262 ?auto_11266 ) ) ( not ( = ?auto_11262 ?auto_11273 ) ) ( not ( = ?auto_11263 ?auto_11279 ) ) ( not ( = ?auto_11263 ?auto_11278 ) ) ( not ( = ?auto_11263 ?auto_11276 ) ) ( not ( = ?auto_11263 ?auto_11267 ) ) ( not ( = ?auto_11263 ?auto_11289 ) ) ( not ( = ?auto_11263 ?auto_11277 ) ) ( not ( = ?auto_11263 ?auto_11270 ) ) ( not ( = ?auto_11263 ?auto_11280 ) ) ( not ( = ?auto_11263 ?auto_11284 ) ) ( not ( = ?auto_11263 ?auto_11272 ) ) )
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
      ?auto_11327 - HOIST
      ?auto_11331 - PLACE
      ?auto_11329 - PLACE
      ?auto_11332 - HOIST
      ?auto_11328 - SURFACE
      ?auto_11350 - SURFACE
      ?auto_11334 - PLACE
      ?auto_11357 - HOIST
      ?auto_11345 - SURFACE
      ?auto_11335 - PLACE
      ?auto_11355 - HOIST
      ?auto_11354 - SURFACE
      ?auto_11359 - PLACE
      ?auto_11346 - HOIST
      ?auto_11351 - SURFACE
      ?auto_11344 - PLACE
      ?auto_11353 - HOIST
      ?auto_11333 - SURFACE
      ?auto_11347 - PLACE
      ?auto_11358 - HOIST
      ?auto_11336 - SURFACE
      ?auto_11352 - SURFACE
      ?auto_11348 - PLACE
      ?auto_11349 - HOIST
      ?auto_11343 - SURFACE
      ?auto_11340 - SURFACE
      ?auto_11337 - PLACE
      ?auto_11356 - HOIST
      ?auto_11339 - SURFACE
      ?auto_11338 - PLACE
      ?auto_11342 - HOIST
      ?auto_11341 - SURFACE
      ?auto_11330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11327 ?auto_11331 ) ( IS-CRATE ?auto_11326 ) ( not ( = ?auto_11329 ?auto_11331 ) ) ( HOIST-AT ?auto_11332 ?auto_11329 ) ( SURFACE-AT ?auto_11326 ?auto_11329 ) ( ON ?auto_11326 ?auto_11328 ) ( CLEAR ?auto_11326 ) ( not ( = ?auto_11325 ?auto_11326 ) ) ( not ( = ?auto_11325 ?auto_11328 ) ) ( not ( = ?auto_11326 ?auto_11328 ) ) ( not ( = ?auto_11327 ?auto_11332 ) ) ( IS-CRATE ?auto_11325 ) ( AVAILABLE ?auto_11332 ) ( SURFACE-AT ?auto_11325 ?auto_11329 ) ( ON ?auto_11325 ?auto_11350 ) ( CLEAR ?auto_11325 ) ( not ( = ?auto_11324 ?auto_11325 ) ) ( not ( = ?auto_11324 ?auto_11350 ) ) ( not ( = ?auto_11325 ?auto_11350 ) ) ( IS-CRATE ?auto_11324 ) ( not ( = ?auto_11334 ?auto_11331 ) ) ( HOIST-AT ?auto_11357 ?auto_11334 ) ( SURFACE-AT ?auto_11324 ?auto_11334 ) ( ON ?auto_11324 ?auto_11345 ) ( CLEAR ?auto_11324 ) ( not ( = ?auto_11323 ?auto_11324 ) ) ( not ( = ?auto_11323 ?auto_11345 ) ) ( not ( = ?auto_11324 ?auto_11345 ) ) ( not ( = ?auto_11327 ?auto_11357 ) ) ( IS-CRATE ?auto_11323 ) ( not ( = ?auto_11335 ?auto_11331 ) ) ( HOIST-AT ?auto_11355 ?auto_11335 ) ( SURFACE-AT ?auto_11323 ?auto_11335 ) ( ON ?auto_11323 ?auto_11354 ) ( CLEAR ?auto_11323 ) ( not ( = ?auto_11322 ?auto_11323 ) ) ( not ( = ?auto_11322 ?auto_11354 ) ) ( not ( = ?auto_11323 ?auto_11354 ) ) ( not ( = ?auto_11327 ?auto_11355 ) ) ( IS-CRATE ?auto_11322 ) ( not ( = ?auto_11359 ?auto_11331 ) ) ( HOIST-AT ?auto_11346 ?auto_11359 ) ( AVAILABLE ?auto_11346 ) ( SURFACE-AT ?auto_11322 ?auto_11359 ) ( ON ?auto_11322 ?auto_11351 ) ( CLEAR ?auto_11322 ) ( not ( = ?auto_11321 ?auto_11322 ) ) ( not ( = ?auto_11321 ?auto_11351 ) ) ( not ( = ?auto_11322 ?auto_11351 ) ) ( not ( = ?auto_11327 ?auto_11346 ) ) ( IS-CRATE ?auto_11321 ) ( not ( = ?auto_11344 ?auto_11331 ) ) ( HOIST-AT ?auto_11353 ?auto_11344 ) ( AVAILABLE ?auto_11353 ) ( SURFACE-AT ?auto_11321 ?auto_11344 ) ( ON ?auto_11321 ?auto_11333 ) ( CLEAR ?auto_11321 ) ( not ( = ?auto_11320 ?auto_11321 ) ) ( not ( = ?auto_11320 ?auto_11333 ) ) ( not ( = ?auto_11321 ?auto_11333 ) ) ( not ( = ?auto_11327 ?auto_11353 ) ) ( IS-CRATE ?auto_11320 ) ( not ( = ?auto_11347 ?auto_11331 ) ) ( HOIST-AT ?auto_11358 ?auto_11347 ) ( AVAILABLE ?auto_11358 ) ( SURFACE-AT ?auto_11320 ?auto_11347 ) ( ON ?auto_11320 ?auto_11336 ) ( CLEAR ?auto_11320 ) ( not ( = ?auto_11319 ?auto_11320 ) ) ( not ( = ?auto_11319 ?auto_11336 ) ) ( not ( = ?auto_11320 ?auto_11336 ) ) ( not ( = ?auto_11327 ?auto_11358 ) ) ( IS-CRATE ?auto_11319 ) ( AVAILABLE ?auto_11355 ) ( SURFACE-AT ?auto_11319 ?auto_11335 ) ( ON ?auto_11319 ?auto_11352 ) ( CLEAR ?auto_11319 ) ( not ( = ?auto_11318 ?auto_11319 ) ) ( not ( = ?auto_11318 ?auto_11352 ) ) ( not ( = ?auto_11319 ?auto_11352 ) ) ( IS-CRATE ?auto_11318 ) ( not ( = ?auto_11348 ?auto_11331 ) ) ( HOIST-AT ?auto_11349 ?auto_11348 ) ( AVAILABLE ?auto_11349 ) ( SURFACE-AT ?auto_11318 ?auto_11348 ) ( ON ?auto_11318 ?auto_11343 ) ( CLEAR ?auto_11318 ) ( not ( = ?auto_11317 ?auto_11318 ) ) ( not ( = ?auto_11317 ?auto_11343 ) ) ( not ( = ?auto_11318 ?auto_11343 ) ) ( not ( = ?auto_11327 ?auto_11349 ) ) ( IS-CRATE ?auto_11317 ) ( AVAILABLE ?auto_11357 ) ( SURFACE-AT ?auto_11317 ?auto_11334 ) ( ON ?auto_11317 ?auto_11340 ) ( CLEAR ?auto_11317 ) ( not ( = ?auto_11316 ?auto_11317 ) ) ( not ( = ?auto_11316 ?auto_11340 ) ) ( not ( = ?auto_11317 ?auto_11340 ) ) ( IS-CRATE ?auto_11316 ) ( not ( = ?auto_11337 ?auto_11331 ) ) ( HOIST-AT ?auto_11356 ?auto_11337 ) ( AVAILABLE ?auto_11356 ) ( SURFACE-AT ?auto_11316 ?auto_11337 ) ( ON ?auto_11316 ?auto_11339 ) ( CLEAR ?auto_11316 ) ( not ( = ?auto_11315 ?auto_11316 ) ) ( not ( = ?auto_11315 ?auto_11339 ) ) ( not ( = ?auto_11316 ?auto_11339 ) ) ( not ( = ?auto_11327 ?auto_11356 ) ) ( SURFACE-AT ?auto_11314 ?auto_11331 ) ( CLEAR ?auto_11314 ) ( IS-CRATE ?auto_11315 ) ( AVAILABLE ?auto_11327 ) ( not ( = ?auto_11338 ?auto_11331 ) ) ( HOIST-AT ?auto_11342 ?auto_11338 ) ( AVAILABLE ?auto_11342 ) ( SURFACE-AT ?auto_11315 ?auto_11338 ) ( ON ?auto_11315 ?auto_11341 ) ( CLEAR ?auto_11315 ) ( TRUCK-AT ?auto_11330 ?auto_11331 ) ( not ( = ?auto_11314 ?auto_11315 ) ) ( not ( = ?auto_11314 ?auto_11341 ) ) ( not ( = ?auto_11315 ?auto_11341 ) ) ( not ( = ?auto_11327 ?auto_11342 ) ) ( not ( = ?auto_11314 ?auto_11316 ) ) ( not ( = ?auto_11314 ?auto_11339 ) ) ( not ( = ?auto_11316 ?auto_11341 ) ) ( not ( = ?auto_11337 ?auto_11338 ) ) ( not ( = ?auto_11356 ?auto_11342 ) ) ( not ( = ?auto_11339 ?auto_11341 ) ) ( not ( = ?auto_11314 ?auto_11317 ) ) ( not ( = ?auto_11314 ?auto_11340 ) ) ( not ( = ?auto_11315 ?auto_11317 ) ) ( not ( = ?auto_11315 ?auto_11340 ) ) ( not ( = ?auto_11317 ?auto_11339 ) ) ( not ( = ?auto_11317 ?auto_11341 ) ) ( not ( = ?auto_11334 ?auto_11337 ) ) ( not ( = ?auto_11334 ?auto_11338 ) ) ( not ( = ?auto_11357 ?auto_11356 ) ) ( not ( = ?auto_11357 ?auto_11342 ) ) ( not ( = ?auto_11340 ?auto_11339 ) ) ( not ( = ?auto_11340 ?auto_11341 ) ) ( not ( = ?auto_11314 ?auto_11318 ) ) ( not ( = ?auto_11314 ?auto_11343 ) ) ( not ( = ?auto_11315 ?auto_11318 ) ) ( not ( = ?auto_11315 ?auto_11343 ) ) ( not ( = ?auto_11316 ?auto_11318 ) ) ( not ( = ?auto_11316 ?auto_11343 ) ) ( not ( = ?auto_11318 ?auto_11340 ) ) ( not ( = ?auto_11318 ?auto_11339 ) ) ( not ( = ?auto_11318 ?auto_11341 ) ) ( not ( = ?auto_11348 ?auto_11334 ) ) ( not ( = ?auto_11348 ?auto_11337 ) ) ( not ( = ?auto_11348 ?auto_11338 ) ) ( not ( = ?auto_11349 ?auto_11357 ) ) ( not ( = ?auto_11349 ?auto_11356 ) ) ( not ( = ?auto_11349 ?auto_11342 ) ) ( not ( = ?auto_11343 ?auto_11340 ) ) ( not ( = ?auto_11343 ?auto_11339 ) ) ( not ( = ?auto_11343 ?auto_11341 ) ) ( not ( = ?auto_11314 ?auto_11319 ) ) ( not ( = ?auto_11314 ?auto_11352 ) ) ( not ( = ?auto_11315 ?auto_11319 ) ) ( not ( = ?auto_11315 ?auto_11352 ) ) ( not ( = ?auto_11316 ?auto_11319 ) ) ( not ( = ?auto_11316 ?auto_11352 ) ) ( not ( = ?auto_11317 ?auto_11319 ) ) ( not ( = ?auto_11317 ?auto_11352 ) ) ( not ( = ?auto_11319 ?auto_11343 ) ) ( not ( = ?auto_11319 ?auto_11340 ) ) ( not ( = ?auto_11319 ?auto_11339 ) ) ( not ( = ?auto_11319 ?auto_11341 ) ) ( not ( = ?auto_11335 ?auto_11348 ) ) ( not ( = ?auto_11335 ?auto_11334 ) ) ( not ( = ?auto_11335 ?auto_11337 ) ) ( not ( = ?auto_11335 ?auto_11338 ) ) ( not ( = ?auto_11355 ?auto_11349 ) ) ( not ( = ?auto_11355 ?auto_11357 ) ) ( not ( = ?auto_11355 ?auto_11356 ) ) ( not ( = ?auto_11355 ?auto_11342 ) ) ( not ( = ?auto_11352 ?auto_11343 ) ) ( not ( = ?auto_11352 ?auto_11340 ) ) ( not ( = ?auto_11352 ?auto_11339 ) ) ( not ( = ?auto_11352 ?auto_11341 ) ) ( not ( = ?auto_11314 ?auto_11320 ) ) ( not ( = ?auto_11314 ?auto_11336 ) ) ( not ( = ?auto_11315 ?auto_11320 ) ) ( not ( = ?auto_11315 ?auto_11336 ) ) ( not ( = ?auto_11316 ?auto_11320 ) ) ( not ( = ?auto_11316 ?auto_11336 ) ) ( not ( = ?auto_11317 ?auto_11320 ) ) ( not ( = ?auto_11317 ?auto_11336 ) ) ( not ( = ?auto_11318 ?auto_11320 ) ) ( not ( = ?auto_11318 ?auto_11336 ) ) ( not ( = ?auto_11320 ?auto_11352 ) ) ( not ( = ?auto_11320 ?auto_11343 ) ) ( not ( = ?auto_11320 ?auto_11340 ) ) ( not ( = ?auto_11320 ?auto_11339 ) ) ( not ( = ?auto_11320 ?auto_11341 ) ) ( not ( = ?auto_11347 ?auto_11335 ) ) ( not ( = ?auto_11347 ?auto_11348 ) ) ( not ( = ?auto_11347 ?auto_11334 ) ) ( not ( = ?auto_11347 ?auto_11337 ) ) ( not ( = ?auto_11347 ?auto_11338 ) ) ( not ( = ?auto_11358 ?auto_11355 ) ) ( not ( = ?auto_11358 ?auto_11349 ) ) ( not ( = ?auto_11358 ?auto_11357 ) ) ( not ( = ?auto_11358 ?auto_11356 ) ) ( not ( = ?auto_11358 ?auto_11342 ) ) ( not ( = ?auto_11336 ?auto_11352 ) ) ( not ( = ?auto_11336 ?auto_11343 ) ) ( not ( = ?auto_11336 ?auto_11340 ) ) ( not ( = ?auto_11336 ?auto_11339 ) ) ( not ( = ?auto_11336 ?auto_11341 ) ) ( not ( = ?auto_11314 ?auto_11321 ) ) ( not ( = ?auto_11314 ?auto_11333 ) ) ( not ( = ?auto_11315 ?auto_11321 ) ) ( not ( = ?auto_11315 ?auto_11333 ) ) ( not ( = ?auto_11316 ?auto_11321 ) ) ( not ( = ?auto_11316 ?auto_11333 ) ) ( not ( = ?auto_11317 ?auto_11321 ) ) ( not ( = ?auto_11317 ?auto_11333 ) ) ( not ( = ?auto_11318 ?auto_11321 ) ) ( not ( = ?auto_11318 ?auto_11333 ) ) ( not ( = ?auto_11319 ?auto_11321 ) ) ( not ( = ?auto_11319 ?auto_11333 ) ) ( not ( = ?auto_11321 ?auto_11336 ) ) ( not ( = ?auto_11321 ?auto_11352 ) ) ( not ( = ?auto_11321 ?auto_11343 ) ) ( not ( = ?auto_11321 ?auto_11340 ) ) ( not ( = ?auto_11321 ?auto_11339 ) ) ( not ( = ?auto_11321 ?auto_11341 ) ) ( not ( = ?auto_11344 ?auto_11347 ) ) ( not ( = ?auto_11344 ?auto_11335 ) ) ( not ( = ?auto_11344 ?auto_11348 ) ) ( not ( = ?auto_11344 ?auto_11334 ) ) ( not ( = ?auto_11344 ?auto_11337 ) ) ( not ( = ?auto_11344 ?auto_11338 ) ) ( not ( = ?auto_11353 ?auto_11358 ) ) ( not ( = ?auto_11353 ?auto_11355 ) ) ( not ( = ?auto_11353 ?auto_11349 ) ) ( not ( = ?auto_11353 ?auto_11357 ) ) ( not ( = ?auto_11353 ?auto_11356 ) ) ( not ( = ?auto_11353 ?auto_11342 ) ) ( not ( = ?auto_11333 ?auto_11336 ) ) ( not ( = ?auto_11333 ?auto_11352 ) ) ( not ( = ?auto_11333 ?auto_11343 ) ) ( not ( = ?auto_11333 ?auto_11340 ) ) ( not ( = ?auto_11333 ?auto_11339 ) ) ( not ( = ?auto_11333 ?auto_11341 ) ) ( not ( = ?auto_11314 ?auto_11322 ) ) ( not ( = ?auto_11314 ?auto_11351 ) ) ( not ( = ?auto_11315 ?auto_11322 ) ) ( not ( = ?auto_11315 ?auto_11351 ) ) ( not ( = ?auto_11316 ?auto_11322 ) ) ( not ( = ?auto_11316 ?auto_11351 ) ) ( not ( = ?auto_11317 ?auto_11322 ) ) ( not ( = ?auto_11317 ?auto_11351 ) ) ( not ( = ?auto_11318 ?auto_11322 ) ) ( not ( = ?auto_11318 ?auto_11351 ) ) ( not ( = ?auto_11319 ?auto_11322 ) ) ( not ( = ?auto_11319 ?auto_11351 ) ) ( not ( = ?auto_11320 ?auto_11322 ) ) ( not ( = ?auto_11320 ?auto_11351 ) ) ( not ( = ?auto_11322 ?auto_11333 ) ) ( not ( = ?auto_11322 ?auto_11336 ) ) ( not ( = ?auto_11322 ?auto_11352 ) ) ( not ( = ?auto_11322 ?auto_11343 ) ) ( not ( = ?auto_11322 ?auto_11340 ) ) ( not ( = ?auto_11322 ?auto_11339 ) ) ( not ( = ?auto_11322 ?auto_11341 ) ) ( not ( = ?auto_11359 ?auto_11344 ) ) ( not ( = ?auto_11359 ?auto_11347 ) ) ( not ( = ?auto_11359 ?auto_11335 ) ) ( not ( = ?auto_11359 ?auto_11348 ) ) ( not ( = ?auto_11359 ?auto_11334 ) ) ( not ( = ?auto_11359 ?auto_11337 ) ) ( not ( = ?auto_11359 ?auto_11338 ) ) ( not ( = ?auto_11346 ?auto_11353 ) ) ( not ( = ?auto_11346 ?auto_11358 ) ) ( not ( = ?auto_11346 ?auto_11355 ) ) ( not ( = ?auto_11346 ?auto_11349 ) ) ( not ( = ?auto_11346 ?auto_11357 ) ) ( not ( = ?auto_11346 ?auto_11356 ) ) ( not ( = ?auto_11346 ?auto_11342 ) ) ( not ( = ?auto_11351 ?auto_11333 ) ) ( not ( = ?auto_11351 ?auto_11336 ) ) ( not ( = ?auto_11351 ?auto_11352 ) ) ( not ( = ?auto_11351 ?auto_11343 ) ) ( not ( = ?auto_11351 ?auto_11340 ) ) ( not ( = ?auto_11351 ?auto_11339 ) ) ( not ( = ?auto_11351 ?auto_11341 ) ) ( not ( = ?auto_11314 ?auto_11323 ) ) ( not ( = ?auto_11314 ?auto_11354 ) ) ( not ( = ?auto_11315 ?auto_11323 ) ) ( not ( = ?auto_11315 ?auto_11354 ) ) ( not ( = ?auto_11316 ?auto_11323 ) ) ( not ( = ?auto_11316 ?auto_11354 ) ) ( not ( = ?auto_11317 ?auto_11323 ) ) ( not ( = ?auto_11317 ?auto_11354 ) ) ( not ( = ?auto_11318 ?auto_11323 ) ) ( not ( = ?auto_11318 ?auto_11354 ) ) ( not ( = ?auto_11319 ?auto_11323 ) ) ( not ( = ?auto_11319 ?auto_11354 ) ) ( not ( = ?auto_11320 ?auto_11323 ) ) ( not ( = ?auto_11320 ?auto_11354 ) ) ( not ( = ?auto_11321 ?auto_11323 ) ) ( not ( = ?auto_11321 ?auto_11354 ) ) ( not ( = ?auto_11323 ?auto_11351 ) ) ( not ( = ?auto_11323 ?auto_11333 ) ) ( not ( = ?auto_11323 ?auto_11336 ) ) ( not ( = ?auto_11323 ?auto_11352 ) ) ( not ( = ?auto_11323 ?auto_11343 ) ) ( not ( = ?auto_11323 ?auto_11340 ) ) ( not ( = ?auto_11323 ?auto_11339 ) ) ( not ( = ?auto_11323 ?auto_11341 ) ) ( not ( = ?auto_11354 ?auto_11351 ) ) ( not ( = ?auto_11354 ?auto_11333 ) ) ( not ( = ?auto_11354 ?auto_11336 ) ) ( not ( = ?auto_11354 ?auto_11352 ) ) ( not ( = ?auto_11354 ?auto_11343 ) ) ( not ( = ?auto_11354 ?auto_11340 ) ) ( not ( = ?auto_11354 ?auto_11339 ) ) ( not ( = ?auto_11354 ?auto_11341 ) ) ( not ( = ?auto_11314 ?auto_11324 ) ) ( not ( = ?auto_11314 ?auto_11345 ) ) ( not ( = ?auto_11315 ?auto_11324 ) ) ( not ( = ?auto_11315 ?auto_11345 ) ) ( not ( = ?auto_11316 ?auto_11324 ) ) ( not ( = ?auto_11316 ?auto_11345 ) ) ( not ( = ?auto_11317 ?auto_11324 ) ) ( not ( = ?auto_11317 ?auto_11345 ) ) ( not ( = ?auto_11318 ?auto_11324 ) ) ( not ( = ?auto_11318 ?auto_11345 ) ) ( not ( = ?auto_11319 ?auto_11324 ) ) ( not ( = ?auto_11319 ?auto_11345 ) ) ( not ( = ?auto_11320 ?auto_11324 ) ) ( not ( = ?auto_11320 ?auto_11345 ) ) ( not ( = ?auto_11321 ?auto_11324 ) ) ( not ( = ?auto_11321 ?auto_11345 ) ) ( not ( = ?auto_11322 ?auto_11324 ) ) ( not ( = ?auto_11322 ?auto_11345 ) ) ( not ( = ?auto_11324 ?auto_11354 ) ) ( not ( = ?auto_11324 ?auto_11351 ) ) ( not ( = ?auto_11324 ?auto_11333 ) ) ( not ( = ?auto_11324 ?auto_11336 ) ) ( not ( = ?auto_11324 ?auto_11352 ) ) ( not ( = ?auto_11324 ?auto_11343 ) ) ( not ( = ?auto_11324 ?auto_11340 ) ) ( not ( = ?auto_11324 ?auto_11339 ) ) ( not ( = ?auto_11324 ?auto_11341 ) ) ( not ( = ?auto_11345 ?auto_11354 ) ) ( not ( = ?auto_11345 ?auto_11351 ) ) ( not ( = ?auto_11345 ?auto_11333 ) ) ( not ( = ?auto_11345 ?auto_11336 ) ) ( not ( = ?auto_11345 ?auto_11352 ) ) ( not ( = ?auto_11345 ?auto_11343 ) ) ( not ( = ?auto_11345 ?auto_11340 ) ) ( not ( = ?auto_11345 ?auto_11339 ) ) ( not ( = ?auto_11345 ?auto_11341 ) ) ( not ( = ?auto_11314 ?auto_11325 ) ) ( not ( = ?auto_11314 ?auto_11350 ) ) ( not ( = ?auto_11315 ?auto_11325 ) ) ( not ( = ?auto_11315 ?auto_11350 ) ) ( not ( = ?auto_11316 ?auto_11325 ) ) ( not ( = ?auto_11316 ?auto_11350 ) ) ( not ( = ?auto_11317 ?auto_11325 ) ) ( not ( = ?auto_11317 ?auto_11350 ) ) ( not ( = ?auto_11318 ?auto_11325 ) ) ( not ( = ?auto_11318 ?auto_11350 ) ) ( not ( = ?auto_11319 ?auto_11325 ) ) ( not ( = ?auto_11319 ?auto_11350 ) ) ( not ( = ?auto_11320 ?auto_11325 ) ) ( not ( = ?auto_11320 ?auto_11350 ) ) ( not ( = ?auto_11321 ?auto_11325 ) ) ( not ( = ?auto_11321 ?auto_11350 ) ) ( not ( = ?auto_11322 ?auto_11325 ) ) ( not ( = ?auto_11322 ?auto_11350 ) ) ( not ( = ?auto_11323 ?auto_11325 ) ) ( not ( = ?auto_11323 ?auto_11350 ) ) ( not ( = ?auto_11325 ?auto_11345 ) ) ( not ( = ?auto_11325 ?auto_11354 ) ) ( not ( = ?auto_11325 ?auto_11351 ) ) ( not ( = ?auto_11325 ?auto_11333 ) ) ( not ( = ?auto_11325 ?auto_11336 ) ) ( not ( = ?auto_11325 ?auto_11352 ) ) ( not ( = ?auto_11325 ?auto_11343 ) ) ( not ( = ?auto_11325 ?auto_11340 ) ) ( not ( = ?auto_11325 ?auto_11339 ) ) ( not ( = ?auto_11325 ?auto_11341 ) ) ( not ( = ?auto_11329 ?auto_11334 ) ) ( not ( = ?auto_11329 ?auto_11335 ) ) ( not ( = ?auto_11329 ?auto_11359 ) ) ( not ( = ?auto_11329 ?auto_11344 ) ) ( not ( = ?auto_11329 ?auto_11347 ) ) ( not ( = ?auto_11329 ?auto_11348 ) ) ( not ( = ?auto_11329 ?auto_11337 ) ) ( not ( = ?auto_11329 ?auto_11338 ) ) ( not ( = ?auto_11332 ?auto_11357 ) ) ( not ( = ?auto_11332 ?auto_11355 ) ) ( not ( = ?auto_11332 ?auto_11346 ) ) ( not ( = ?auto_11332 ?auto_11353 ) ) ( not ( = ?auto_11332 ?auto_11358 ) ) ( not ( = ?auto_11332 ?auto_11349 ) ) ( not ( = ?auto_11332 ?auto_11356 ) ) ( not ( = ?auto_11332 ?auto_11342 ) ) ( not ( = ?auto_11350 ?auto_11345 ) ) ( not ( = ?auto_11350 ?auto_11354 ) ) ( not ( = ?auto_11350 ?auto_11351 ) ) ( not ( = ?auto_11350 ?auto_11333 ) ) ( not ( = ?auto_11350 ?auto_11336 ) ) ( not ( = ?auto_11350 ?auto_11352 ) ) ( not ( = ?auto_11350 ?auto_11343 ) ) ( not ( = ?auto_11350 ?auto_11340 ) ) ( not ( = ?auto_11350 ?auto_11339 ) ) ( not ( = ?auto_11350 ?auto_11341 ) ) ( not ( = ?auto_11314 ?auto_11326 ) ) ( not ( = ?auto_11314 ?auto_11328 ) ) ( not ( = ?auto_11315 ?auto_11326 ) ) ( not ( = ?auto_11315 ?auto_11328 ) ) ( not ( = ?auto_11316 ?auto_11326 ) ) ( not ( = ?auto_11316 ?auto_11328 ) ) ( not ( = ?auto_11317 ?auto_11326 ) ) ( not ( = ?auto_11317 ?auto_11328 ) ) ( not ( = ?auto_11318 ?auto_11326 ) ) ( not ( = ?auto_11318 ?auto_11328 ) ) ( not ( = ?auto_11319 ?auto_11326 ) ) ( not ( = ?auto_11319 ?auto_11328 ) ) ( not ( = ?auto_11320 ?auto_11326 ) ) ( not ( = ?auto_11320 ?auto_11328 ) ) ( not ( = ?auto_11321 ?auto_11326 ) ) ( not ( = ?auto_11321 ?auto_11328 ) ) ( not ( = ?auto_11322 ?auto_11326 ) ) ( not ( = ?auto_11322 ?auto_11328 ) ) ( not ( = ?auto_11323 ?auto_11326 ) ) ( not ( = ?auto_11323 ?auto_11328 ) ) ( not ( = ?auto_11324 ?auto_11326 ) ) ( not ( = ?auto_11324 ?auto_11328 ) ) ( not ( = ?auto_11326 ?auto_11350 ) ) ( not ( = ?auto_11326 ?auto_11345 ) ) ( not ( = ?auto_11326 ?auto_11354 ) ) ( not ( = ?auto_11326 ?auto_11351 ) ) ( not ( = ?auto_11326 ?auto_11333 ) ) ( not ( = ?auto_11326 ?auto_11336 ) ) ( not ( = ?auto_11326 ?auto_11352 ) ) ( not ( = ?auto_11326 ?auto_11343 ) ) ( not ( = ?auto_11326 ?auto_11340 ) ) ( not ( = ?auto_11326 ?auto_11339 ) ) ( not ( = ?auto_11326 ?auto_11341 ) ) ( not ( = ?auto_11328 ?auto_11350 ) ) ( not ( = ?auto_11328 ?auto_11345 ) ) ( not ( = ?auto_11328 ?auto_11354 ) ) ( not ( = ?auto_11328 ?auto_11351 ) ) ( not ( = ?auto_11328 ?auto_11333 ) ) ( not ( = ?auto_11328 ?auto_11336 ) ) ( not ( = ?auto_11328 ?auto_11352 ) ) ( not ( = ?auto_11328 ?auto_11343 ) ) ( not ( = ?auto_11328 ?auto_11340 ) ) ( not ( = ?auto_11328 ?auto_11339 ) ) ( not ( = ?auto_11328 ?auto_11341 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_11314 ?auto_11315 ?auto_11316 ?auto_11317 ?auto_11318 ?auto_11319 ?auto_11320 ?auto_11321 ?auto_11322 ?auto_11323 ?auto_11324 ?auto_11325 )
      ( MAKE-1CRATE ?auto_11325 ?auto_11326 )
      ( MAKE-12CRATE-VERIFY ?auto_11314 ?auto_11315 ?auto_11316 ?auto_11317 ?auto_11318 ?auto_11319 ?auto_11320 ?auto_11321 ?auto_11322 ?auto_11323 ?auto_11324 ?auto_11325 ?auto_11326 ) )
  )

)

