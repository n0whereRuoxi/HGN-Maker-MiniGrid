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
      ?auto_10876 - SURFACE
      ?auto_10877 - SURFACE
    )
    :vars
    (
      ?auto_10878 - HOIST
      ?auto_10879 - PLACE
      ?auto_10881 - PLACE
      ?auto_10882 - HOIST
      ?auto_10883 - SURFACE
      ?auto_10880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10878 ?auto_10879 ) ( SURFACE-AT ?auto_10876 ?auto_10879 ) ( CLEAR ?auto_10876 ) ( IS-CRATE ?auto_10877 ) ( AVAILABLE ?auto_10878 ) ( not ( = ?auto_10881 ?auto_10879 ) ) ( HOIST-AT ?auto_10882 ?auto_10881 ) ( AVAILABLE ?auto_10882 ) ( SURFACE-AT ?auto_10877 ?auto_10881 ) ( ON ?auto_10877 ?auto_10883 ) ( CLEAR ?auto_10877 ) ( TRUCK-AT ?auto_10880 ?auto_10879 ) ( not ( = ?auto_10876 ?auto_10877 ) ) ( not ( = ?auto_10876 ?auto_10883 ) ) ( not ( = ?auto_10877 ?auto_10883 ) ) ( not ( = ?auto_10878 ?auto_10882 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10880 ?auto_10879 ?auto_10881 )
      ( !LIFT ?auto_10882 ?auto_10877 ?auto_10883 ?auto_10881 )
      ( !LOAD ?auto_10882 ?auto_10877 ?auto_10880 ?auto_10881 )
      ( !DRIVE ?auto_10880 ?auto_10881 ?auto_10879 )
      ( !UNLOAD ?auto_10878 ?auto_10877 ?auto_10880 ?auto_10879 )
      ( !DROP ?auto_10878 ?auto_10877 ?auto_10876 ?auto_10879 )
      ( MAKE-1CRATE-VERIFY ?auto_10876 ?auto_10877 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10886 - SURFACE
      ?auto_10887 - SURFACE
    )
    :vars
    (
      ?auto_10888 - HOIST
      ?auto_10889 - PLACE
      ?auto_10891 - PLACE
      ?auto_10892 - HOIST
      ?auto_10893 - SURFACE
      ?auto_10890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10888 ?auto_10889 ) ( SURFACE-AT ?auto_10886 ?auto_10889 ) ( CLEAR ?auto_10886 ) ( IS-CRATE ?auto_10887 ) ( AVAILABLE ?auto_10888 ) ( not ( = ?auto_10891 ?auto_10889 ) ) ( HOIST-AT ?auto_10892 ?auto_10891 ) ( AVAILABLE ?auto_10892 ) ( SURFACE-AT ?auto_10887 ?auto_10891 ) ( ON ?auto_10887 ?auto_10893 ) ( CLEAR ?auto_10887 ) ( TRUCK-AT ?auto_10890 ?auto_10889 ) ( not ( = ?auto_10886 ?auto_10887 ) ) ( not ( = ?auto_10886 ?auto_10893 ) ) ( not ( = ?auto_10887 ?auto_10893 ) ) ( not ( = ?auto_10888 ?auto_10892 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10890 ?auto_10889 ?auto_10891 )
      ( !LIFT ?auto_10892 ?auto_10887 ?auto_10893 ?auto_10891 )
      ( !LOAD ?auto_10892 ?auto_10887 ?auto_10890 ?auto_10891 )
      ( !DRIVE ?auto_10890 ?auto_10891 ?auto_10889 )
      ( !UNLOAD ?auto_10888 ?auto_10887 ?auto_10890 ?auto_10889 )
      ( !DROP ?auto_10888 ?auto_10887 ?auto_10886 ?auto_10889 )
      ( MAKE-1CRATE-VERIFY ?auto_10886 ?auto_10887 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10897 - SURFACE
      ?auto_10898 - SURFACE
      ?auto_10899 - SURFACE
    )
    :vars
    (
      ?auto_10901 - HOIST
      ?auto_10902 - PLACE
      ?auto_10904 - PLACE
      ?auto_10903 - HOIST
      ?auto_10900 - SURFACE
      ?auto_10906 - PLACE
      ?auto_10907 - HOIST
      ?auto_10908 - SURFACE
      ?auto_10905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10901 ?auto_10902 ) ( IS-CRATE ?auto_10899 ) ( not ( = ?auto_10904 ?auto_10902 ) ) ( HOIST-AT ?auto_10903 ?auto_10904 ) ( AVAILABLE ?auto_10903 ) ( SURFACE-AT ?auto_10899 ?auto_10904 ) ( ON ?auto_10899 ?auto_10900 ) ( CLEAR ?auto_10899 ) ( not ( = ?auto_10898 ?auto_10899 ) ) ( not ( = ?auto_10898 ?auto_10900 ) ) ( not ( = ?auto_10899 ?auto_10900 ) ) ( not ( = ?auto_10901 ?auto_10903 ) ) ( SURFACE-AT ?auto_10897 ?auto_10902 ) ( CLEAR ?auto_10897 ) ( IS-CRATE ?auto_10898 ) ( AVAILABLE ?auto_10901 ) ( not ( = ?auto_10906 ?auto_10902 ) ) ( HOIST-AT ?auto_10907 ?auto_10906 ) ( AVAILABLE ?auto_10907 ) ( SURFACE-AT ?auto_10898 ?auto_10906 ) ( ON ?auto_10898 ?auto_10908 ) ( CLEAR ?auto_10898 ) ( TRUCK-AT ?auto_10905 ?auto_10902 ) ( not ( = ?auto_10897 ?auto_10898 ) ) ( not ( = ?auto_10897 ?auto_10908 ) ) ( not ( = ?auto_10898 ?auto_10908 ) ) ( not ( = ?auto_10901 ?auto_10907 ) ) ( not ( = ?auto_10897 ?auto_10899 ) ) ( not ( = ?auto_10897 ?auto_10900 ) ) ( not ( = ?auto_10899 ?auto_10908 ) ) ( not ( = ?auto_10904 ?auto_10906 ) ) ( not ( = ?auto_10903 ?auto_10907 ) ) ( not ( = ?auto_10900 ?auto_10908 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10897 ?auto_10898 )
      ( MAKE-1CRATE ?auto_10898 ?auto_10899 )
      ( MAKE-2CRATE-VERIFY ?auto_10897 ?auto_10898 ?auto_10899 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10911 - SURFACE
      ?auto_10912 - SURFACE
    )
    :vars
    (
      ?auto_10913 - HOIST
      ?auto_10914 - PLACE
      ?auto_10916 - PLACE
      ?auto_10917 - HOIST
      ?auto_10918 - SURFACE
      ?auto_10915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10913 ?auto_10914 ) ( SURFACE-AT ?auto_10911 ?auto_10914 ) ( CLEAR ?auto_10911 ) ( IS-CRATE ?auto_10912 ) ( AVAILABLE ?auto_10913 ) ( not ( = ?auto_10916 ?auto_10914 ) ) ( HOIST-AT ?auto_10917 ?auto_10916 ) ( AVAILABLE ?auto_10917 ) ( SURFACE-AT ?auto_10912 ?auto_10916 ) ( ON ?auto_10912 ?auto_10918 ) ( CLEAR ?auto_10912 ) ( TRUCK-AT ?auto_10915 ?auto_10914 ) ( not ( = ?auto_10911 ?auto_10912 ) ) ( not ( = ?auto_10911 ?auto_10918 ) ) ( not ( = ?auto_10912 ?auto_10918 ) ) ( not ( = ?auto_10913 ?auto_10917 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10915 ?auto_10914 ?auto_10916 )
      ( !LIFT ?auto_10917 ?auto_10912 ?auto_10918 ?auto_10916 )
      ( !LOAD ?auto_10917 ?auto_10912 ?auto_10915 ?auto_10916 )
      ( !DRIVE ?auto_10915 ?auto_10916 ?auto_10914 )
      ( !UNLOAD ?auto_10913 ?auto_10912 ?auto_10915 ?auto_10914 )
      ( !DROP ?auto_10913 ?auto_10912 ?auto_10911 ?auto_10914 )
      ( MAKE-1CRATE-VERIFY ?auto_10911 ?auto_10912 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10923 - SURFACE
      ?auto_10924 - SURFACE
      ?auto_10925 - SURFACE
      ?auto_10926 - SURFACE
    )
    :vars
    (
      ?auto_10927 - HOIST
      ?auto_10928 - PLACE
      ?auto_10929 - PLACE
      ?auto_10931 - HOIST
      ?auto_10932 - SURFACE
      ?auto_10938 - PLACE
      ?auto_10937 - HOIST
      ?auto_10935 - SURFACE
      ?auto_10936 - PLACE
      ?auto_10934 - HOIST
      ?auto_10933 - SURFACE
      ?auto_10930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10927 ?auto_10928 ) ( IS-CRATE ?auto_10926 ) ( not ( = ?auto_10929 ?auto_10928 ) ) ( HOIST-AT ?auto_10931 ?auto_10929 ) ( AVAILABLE ?auto_10931 ) ( SURFACE-AT ?auto_10926 ?auto_10929 ) ( ON ?auto_10926 ?auto_10932 ) ( CLEAR ?auto_10926 ) ( not ( = ?auto_10925 ?auto_10926 ) ) ( not ( = ?auto_10925 ?auto_10932 ) ) ( not ( = ?auto_10926 ?auto_10932 ) ) ( not ( = ?auto_10927 ?auto_10931 ) ) ( IS-CRATE ?auto_10925 ) ( not ( = ?auto_10938 ?auto_10928 ) ) ( HOIST-AT ?auto_10937 ?auto_10938 ) ( AVAILABLE ?auto_10937 ) ( SURFACE-AT ?auto_10925 ?auto_10938 ) ( ON ?auto_10925 ?auto_10935 ) ( CLEAR ?auto_10925 ) ( not ( = ?auto_10924 ?auto_10925 ) ) ( not ( = ?auto_10924 ?auto_10935 ) ) ( not ( = ?auto_10925 ?auto_10935 ) ) ( not ( = ?auto_10927 ?auto_10937 ) ) ( SURFACE-AT ?auto_10923 ?auto_10928 ) ( CLEAR ?auto_10923 ) ( IS-CRATE ?auto_10924 ) ( AVAILABLE ?auto_10927 ) ( not ( = ?auto_10936 ?auto_10928 ) ) ( HOIST-AT ?auto_10934 ?auto_10936 ) ( AVAILABLE ?auto_10934 ) ( SURFACE-AT ?auto_10924 ?auto_10936 ) ( ON ?auto_10924 ?auto_10933 ) ( CLEAR ?auto_10924 ) ( TRUCK-AT ?auto_10930 ?auto_10928 ) ( not ( = ?auto_10923 ?auto_10924 ) ) ( not ( = ?auto_10923 ?auto_10933 ) ) ( not ( = ?auto_10924 ?auto_10933 ) ) ( not ( = ?auto_10927 ?auto_10934 ) ) ( not ( = ?auto_10923 ?auto_10925 ) ) ( not ( = ?auto_10923 ?auto_10935 ) ) ( not ( = ?auto_10925 ?auto_10933 ) ) ( not ( = ?auto_10938 ?auto_10936 ) ) ( not ( = ?auto_10937 ?auto_10934 ) ) ( not ( = ?auto_10935 ?auto_10933 ) ) ( not ( = ?auto_10923 ?auto_10926 ) ) ( not ( = ?auto_10923 ?auto_10932 ) ) ( not ( = ?auto_10924 ?auto_10926 ) ) ( not ( = ?auto_10924 ?auto_10932 ) ) ( not ( = ?auto_10926 ?auto_10935 ) ) ( not ( = ?auto_10926 ?auto_10933 ) ) ( not ( = ?auto_10929 ?auto_10938 ) ) ( not ( = ?auto_10929 ?auto_10936 ) ) ( not ( = ?auto_10931 ?auto_10937 ) ) ( not ( = ?auto_10931 ?auto_10934 ) ) ( not ( = ?auto_10932 ?auto_10935 ) ) ( not ( = ?auto_10932 ?auto_10933 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10923 ?auto_10924 ?auto_10925 )
      ( MAKE-1CRATE ?auto_10925 ?auto_10926 )
      ( MAKE-3CRATE-VERIFY ?auto_10923 ?auto_10924 ?auto_10925 ?auto_10926 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10941 - SURFACE
      ?auto_10942 - SURFACE
    )
    :vars
    (
      ?auto_10943 - HOIST
      ?auto_10944 - PLACE
      ?auto_10946 - PLACE
      ?auto_10947 - HOIST
      ?auto_10948 - SURFACE
      ?auto_10945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10943 ?auto_10944 ) ( SURFACE-AT ?auto_10941 ?auto_10944 ) ( CLEAR ?auto_10941 ) ( IS-CRATE ?auto_10942 ) ( AVAILABLE ?auto_10943 ) ( not ( = ?auto_10946 ?auto_10944 ) ) ( HOIST-AT ?auto_10947 ?auto_10946 ) ( AVAILABLE ?auto_10947 ) ( SURFACE-AT ?auto_10942 ?auto_10946 ) ( ON ?auto_10942 ?auto_10948 ) ( CLEAR ?auto_10942 ) ( TRUCK-AT ?auto_10945 ?auto_10944 ) ( not ( = ?auto_10941 ?auto_10942 ) ) ( not ( = ?auto_10941 ?auto_10948 ) ) ( not ( = ?auto_10942 ?auto_10948 ) ) ( not ( = ?auto_10943 ?auto_10947 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10945 ?auto_10944 ?auto_10946 )
      ( !LIFT ?auto_10947 ?auto_10942 ?auto_10948 ?auto_10946 )
      ( !LOAD ?auto_10947 ?auto_10942 ?auto_10945 ?auto_10946 )
      ( !DRIVE ?auto_10945 ?auto_10946 ?auto_10944 )
      ( !UNLOAD ?auto_10943 ?auto_10942 ?auto_10945 ?auto_10944 )
      ( !DROP ?auto_10943 ?auto_10942 ?auto_10941 ?auto_10944 )
      ( MAKE-1CRATE-VERIFY ?auto_10941 ?auto_10942 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10954 - SURFACE
      ?auto_10955 - SURFACE
      ?auto_10956 - SURFACE
      ?auto_10957 - SURFACE
      ?auto_10958 - SURFACE
    )
    :vars
    (
      ?auto_10960 - HOIST
      ?auto_10963 - PLACE
      ?auto_10964 - PLACE
      ?auto_10962 - HOIST
      ?auto_10961 - SURFACE
      ?auto_10970 - PLACE
      ?auto_10971 - HOIST
      ?auto_10968 - SURFACE
      ?auto_10966 - PLACE
      ?auto_10965 - HOIST
      ?auto_10967 - SURFACE
      ?auto_10969 - SURFACE
      ?auto_10959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10960 ?auto_10963 ) ( IS-CRATE ?auto_10958 ) ( not ( = ?auto_10964 ?auto_10963 ) ) ( HOIST-AT ?auto_10962 ?auto_10964 ) ( SURFACE-AT ?auto_10958 ?auto_10964 ) ( ON ?auto_10958 ?auto_10961 ) ( CLEAR ?auto_10958 ) ( not ( = ?auto_10957 ?auto_10958 ) ) ( not ( = ?auto_10957 ?auto_10961 ) ) ( not ( = ?auto_10958 ?auto_10961 ) ) ( not ( = ?auto_10960 ?auto_10962 ) ) ( IS-CRATE ?auto_10957 ) ( not ( = ?auto_10970 ?auto_10963 ) ) ( HOIST-AT ?auto_10971 ?auto_10970 ) ( AVAILABLE ?auto_10971 ) ( SURFACE-AT ?auto_10957 ?auto_10970 ) ( ON ?auto_10957 ?auto_10968 ) ( CLEAR ?auto_10957 ) ( not ( = ?auto_10956 ?auto_10957 ) ) ( not ( = ?auto_10956 ?auto_10968 ) ) ( not ( = ?auto_10957 ?auto_10968 ) ) ( not ( = ?auto_10960 ?auto_10971 ) ) ( IS-CRATE ?auto_10956 ) ( not ( = ?auto_10966 ?auto_10963 ) ) ( HOIST-AT ?auto_10965 ?auto_10966 ) ( AVAILABLE ?auto_10965 ) ( SURFACE-AT ?auto_10956 ?auto_10966 ) ( ON ?auto_10956 ?auto_10967 ) ( CLEAR ?auto_10956 ) ( not ( = ?auto_10955 ?auto_10956 ) ) ( not ( = ?auto_10955 ?auto_10967 ) ) ( not ( = ?auto_10956 ?auto_10967 ) ) ( not ( = ?auto_10960 ?auto_10965 ) ) ( SURFACE-AT ?auto_10954 ?auto_10963 ) ( CLEAR ?auto_10954 ) ( IS-CRATE ?auto_10955 ) ( AVAILABLE ?auto_10960 ) ( AVAILABLE ?auto_10962 ) ( SURFACE-AT ?auto_10955 ?auto_10964 ) ( ON ?auto_10955 ?auto_10969 ) ( CLEAR ?auto_10955 ) ( TRUCK-AT ?auto_10959 ?auto_10963 ) ( not ( = ?auto_10954 ?auto_10955 ) ) ( not ( = ?auto_10954 ?auto_10969 ) ) ( not ( = ?auto_10955 ?auto_10969 ) ) ( not ( = ?auto_10954 ?auto_10956 ) ) ( not ( = ?auto_10954 ?auto_10967 ) ) ( not ( = ?auto_10956 ?auto_10969 ) ) ( not ( = ?auto_10966 ?auto_10964 ) ) ( not ( = ?auto_10965 ?auto_10962 ) ) ( not ( = ?auto_10967 ?auto_10969 ) ) ( not ( = ?auto_10954 ?auto_10957 ) ) ( not ( = ?auto_10954 ?auto_10968 ) ) ( not ( = ?auto_10955 ?auto_10957 ) ) ( not ( = ?auto_10955 ?auto_10968 ) ) ( not ( = ?auto_10957 ?auto_10967 ) ) ( not ( = ?auto_10957 ?auto_10969 ) ) ( not ( = ?auto_10970 ?auto_10966 ) ) ( not ( = ?auto_10970 ?auto_10964 ) ) ( not ( = ?auto_10971 ?auto_10965 ) ) ( not ( = ?auto_10971 ?auto_10962 ) ) ( not ( = ?auto_10968 ?auto_10967 ) ) ( not ( = ?auto_10968 ?auto_10969 ) ) ( not ( = ?auto_10954 ?auto_10958 ) ) ( not ( = ?auto_10954 ?auto_10961 ) ) ( not ( = ?auto_10955 ?auto_10958 ) ) ( not ( = ?auto_10955 ?auto_10961 ) ) ( not ( = ?auto_10956 ?auto_10958 ) ) ( not ( = ?auto_10956 ?auto_10961 ) ) ( not ( = ?auto_10958 ?auto_10968 ) ) ( not ( = ?auto_10958 ?auto_10967 ) ) ( not ( = ?auto_10958 ?auto_10969 ) ) ( not ( = ?auto_10961 ?auto_10968 ) ) ( not ( = ?auto_10961 ?auto_10967 ) ) ( not ( = ?auto_10961 ?auto_10969 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_10954 ?auto_10955 ?auto_10956 ?auto_10957 )
      ( MAKE-1CRATE ?auto_10957 ?auto_10958 )
      ( MAKE-4CRATE-VERIFY ?auto_10954 ?auto_10955 ?auto_10956 ?auto_10957 ?auto_10958 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10974 - SURFACE
      ?auto_10975 - SURFACE
    )
    :vars
    (
      ?auto_10976 - HOIST
      ?auto_10977 - PLACE
      ?auto_10979 - PLACE
      ?auto_10980 - HOIST
      ?auto_10981 - SURFACE
      ?auto_10978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10976 ?auto_10977 ) ( SURFACE-AT ?auto_10974 ?auto_10977 ) ( CLEAR ?auto_10974 ) ( IS-CRATE ?auto_10975 ) ( AVAILABLE ?auto_10976 ) ( not ( = ?auto_10979 ?auto_10977 ) ) ( HOIST-AT ?auto_10980 ?auto_10979 ) ( AVAILABLE ?auto_10980 ) ( SURFACE-AT ?auto_10975 ?auto_10979 ) ( ON ?auto_10975 ?auto_10981 ) ( CLEAR ?auto_10975 ) ( TRUCK-AT ?auto_10978 ?auto_10977 ) ( not ( = ?auto_10974 ?auto_10975 ) ) ( not ( = ?auto_10974 ?auto_10981 ) ) ( not ( = ?auto_10975 ?auto_10981 ) ) ( not ( = ?auto_10976 ?auto_10980 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10978 ?auto_10977 ?auto_10979 )
      ( !LIFT ?auto_10980 ?auto_10975 ?auto_10981 ?auto_10979 )
      ( !LOAD ?auto_10980 ?auto_10975 ?auto_10978 ?auto_10979 )
      ( !DRIVE ?auto_10978 ?auto_10979 ?auto_10977 )
      ( !UNLOAD ?auto_10976 ?auto_10975 ?auto_10978 ?auto_10977 )
      ( !DROP ?auto_10976 ?auto_10975 ?auto_10974 ?auto_10977 )
      ( MAKE-1CRATE-VERIFY ?auto_10974 ?auto_10975 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_10988 - SURFACE
      ?auto_10989 - SURFACE
      ?auto_10990 - SURFACE
      ?auto_10991 - SURFACE
      ?auto_10992 - SURFACE
      ?auto_10993 - SURFACE
    )
    :vars
    (
      ?auto_10996 - HOIST
      ?auto_10994 - PLACE
      ?auto_10999 - PLACE
      ?auto_10998 - HOIST
      ?auto_10995 - SURFACE
      ?auto_11001 - PLACE
      ?auto_11002 - HOIST
      ?auto_11000 - SURFACE
      ?auto_11005 - SURFACE
      ?auto_11004 - PLACE
      ?auto_11007 - HOIST
      ?auto_11003 - SURFACE
      ?auto_11006 - SURFACE
      ?auto_10997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10996 ?auto_10994 ) ( IS-CRATE ?auto_10993 ) ( not ( = ?auto_10999 ?auto_10994 ) ) ( HOIST-AT ?auto_10998 ?auto_10999 ) ( SURFACE-AT ?auto_10993 ?auto_10999 ) ( ON ?auto_10993 ?auto_10995 ) ( CLEAR ?auto_10993 ) ( not ( = ?auto_10992 ?auto_10993 ) ) ( not ( = ?auto_10992 ?auto_10995 ) ) ( not ( = ?auto_10993 ?auto_10995 ) ) ( not ( = ?auto_10996 ?auto_10998 ) ) ( IS-CRATE ?auto_10992 ) ( not ( = ?auto_11001 ?auto_10994 ) ) ( HOIST-AT ?auto_11002 ?auto_11001 ) ( SURFACE-AT ?auto_10992 ?auto_11001 ) ( ON ?auto_10992 ?auto_11000 ) ( CLEAR ?auto_10992 ) ( not ( = ?auto_10991 ?auto_10992 ) ) ( not ( = ?auto_10991 ?auto_11000 ) ) ( not ( = ?auto_10992 ?auto_11000 ) ) ( not ( = ?auto_10996 ?auto_11002 ) ) ( IS-CRATE ?auto_10991 ) ( AVAILABLE ?auto_10998 ) ( SURFACE-AT ?auto_10991 ?auto_10999 ) ( ON ?auto_10991 ?auto_11005 ) ( CLEAR ?auto_10991 ) ( not ( = ?auto_10990 ?auto_10991 ) ) ( not ( = ?auto_10990 ?auto_11005 ) ) ( not ( = ?auto_10991 ?auto_11005 ) ) ( IS-CRATE ?auto_10990 ) ( not ( = ?auto_11004 ?auto_10994 ) ) ( HOIST-AT ?auto_11007 ?auto_11004 ) ( AVAILABLE ?auto_11007 ) ( SURFACE-AT ?auto_10990 ?auto_11004 ) ( ON ?auto_10990 ?auto_11003 ) ( CLEAR ?auto_10990 ) ( not ( = ?auto_10989 ?auto_10990 ) ) ( not ( = ?auto_10989 ?auto_11003 ) ) ( not ( = ?auto_10990 ?auto_11003 ) ) ( not ( = ?auto_10996 ?auto_11007 ) ) ( SURFACE-AT ?auto_10988 ?auto_10994 ) ( CLEAR ?auto_10988 ) ( IS-CRATE ?auto_10989 ) ( AVAILABLE ?auto_10996 ) ( AVAILABLE ?auto_11002 ) ( SURFACE-AT ?auto_10989 ?auto_11001 ) ( ON ?auto_10989 ?auto_11006 ) ( CLEAR ?auto_10989 ) ( TRUCK-AT ?auto_10997 ?auto_10994 ) ( not ( = ?auto_10988 ?auto_10989 ) ) ( not ( = ?auto_10988 ?auto_11006 ) ) ( not ( = ?auto_10989 ?auto_11006 ) ) ( not ( = ?auto_10988 ?auto_10990 ) ) ( not ( = ?auto_10988 ?auto_11003 ) ) ( not ( = ?auto_10990 ?auto_11006 ) ) ( not ( = ?auto_11004 ?auto_11001 ) ) ( not ( = ?auto_11007 ?auto_11002 ) ) ( not ( = ?auto_11003 ?auto_11006 ) ) ( not ( = ?auto_10988 ?auto_10991 ) ) ( not ( = ?auto_10988 ?auto_11005 ) ) ( not ( = ?auto_10989 ?auto_10991 ) ) ( not ( = ?auto_10989 ?auto_11005 ) ) ( not ( = ?auto_10991 ?auto_11003 ) ) ( not ( = ?auto_10991 ?auto_11006 ) ) ( not ( = ?auto_10999 ?auto_11004 ) ) ( not ( = ?auto_10999 ?auto_11001 ) ) ( not ( = ?auto_10998 ?auto_11007 ) ) ( not ( = ?auto_10998 ?auto_11002 ) ) ( not ( = ?auto_11005 ?auto_11003 ) ) ( not ( = ?auto_11005 ?auto_11006 ) ) ( not ( = ?auto_10988 ?auto_10992 ) ) ( not ( = ?auto_10988 ?auto_11000 ) ) ( not ( = ?auto_10989 ?auto_10992 ) ) ( not ( = ?auto_10989 ?auto_11000 ) ) ( not ( = ?auto_10990 ?auto_10992 ) ) ( not ( = ?auto_10990 ?auto_11000 ) ) ( not ( = ?auto_10992 ?auto_11005 ) ) ( not ( = ?auto_10992 ?auto_11003 ) ) ( not ( = ?auto_10992 ?auto_11006 ) ) ( not ( = ?auto_11000 ?auto_11005 ) ) ( not ( = ?auto_11000 ?auto_11003 ) ) ( not ( = ?auto_11000 ?auto_11006 ) ) ( not ( = ?auto_10988 ?auto_10993 ) ) ( not ( = ?auto_10988 ?auto_10995 ) ) ( not ( = ?auto_10989 ?auto_10993 ) ) ( not ( = ?auto_10989 ?auto_10995 ) ) ( not ( = ?auto_10990 ?auto_10993 ) ) ( not ( = ?auto_10990 ?auto_10995 ) ) ( not ( = ?auto_10991 ?auto_10993 ) ) ( not ( = ?auto_10991 ?auto_10995 ) ) ( not ( = ?auto_10993 ?auto_11000 ) ) ( not ( = ?auto_10993 ?auto_11005 ) ) ( not ( = ?auto_10993 ?auto_11003 ) ) ( not ( = ?auto_10993 ?auto_11006 ) ) ( not ( = ?auto_10995 ?auto_11000 ) ) ( not ( = ?auto_10995 ?auto_11005 ) ) ( not ( = ?auto_10995 ?auto_11003 ) ) ( not ( = ?auto_10995 ?auto_11006 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_10988 ?auto_10989 ?auto_10990 ?auto_10991 ?auto_10992 )
      ( MAKE-1CRATE ?auto_10992 ?auto_10993 )
      ( MAKE-5CRATE-VERIFY ?auto_10988 ?auto_10989 ?auto_10990 ?auto_10991 ?auto_10992 ?auto_10993 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11010 - SURFACE
      ?auto_11011 - SURFACE
    )
    :vars
    (
      ?auto_11012 - HOIST
      ?auto_11013 - PLACE
      ?auto_11015 - PLACE
      ?auto_11016 - HOIST
      ?auto_11017 - SURFACE
      ?auto_11014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11012 ?auto_11013 ) ( SURFACE-AT ?auto_11010 ?auto_11013 ) ( CLEAR ?auto_11010 ) ( IS-CRATE ?auto_11011 ) ( AVAILABLE ?auto_11012 ) ( not ( = ?auto_11015 ?auto_11013 ) ) ( HOIST-AT ?auto_11016 ?auto_11015 ) ( AVAILABLE ?auto_11016 ) ( SURFACE-AT ?auto_11011 ?auto_11015 ) ( ON ?auto_11011 ?auto_11017 ) ( CLEAR ?auto_11011 ) ( TRUCK-AT ?auto_11014 ?auto_11013 ) ( not ( = ?auto_11010 ?auto_11011 ) ) ( not ( = ?auto_11010 ?auto_11017 ) ) ( not ( = ?auto_11011 ?auto_11017 ) ) ( not ( = ?auto_11012 ?auto_11016 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11014 ?auto_11013 ?auto_11015 )
      ( !LIFT ?auto_11016 ?auto_11011 ?auto_11017 ?auto_11015 )
      ( !LOAD ?auto_11016 ?auto_11011 ?auto_11014 ?auto_11015 )
      ( !DRIVE ?auto_11014 ?auto_11015 ?auto_11013 )
      ( !UNLOAD ?auto_11012 ?auto_11011 ?auto_11014 ?auto_11013 )
      ( !DROP ?auto_11012 ?auto_11011 ?auto_11010 ?auto_11013 )
      ( MAKE-1CRATE-VERIFY ?auto_11010 ?auto_11011 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_11025 - SURFACE
      ?auto_11026 - SURFACE
      ?auto_11027 - SURFACE
      ?auto_11028 - SURFACE
      ?auto_11029 - SURFACE
      ?auto_11030 - SURFACE
      ?auto_11031 - SURFACE
    )
    :vars
    (
      ?auto_11037 - HOIST
      ?auto_11036 - PLACE
      ?auto_11032 - PLACE
      ?auto_11033 - HOIST
      ?auto_11035 - SURFACE
      ?auto_11038 - PLACE
      ?auto_11044 - HOIST
      ?auto_11043 - SURFACE
      ?auto_11047 - PLACE
      ?auto_11045 - HOIST
      ?auto_11046 - SURFACE
      ?auto_11040 - SURFACE
      ?auto_11042 - PLACE
      ?auto_11048 - HOIST
      ?auto_11041 - SURFACE
      ?auto_11039 - SURFACE
      ?auto_11034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11037 ?auto_11036 ) ( IS-CRATE ?auto_11031 ) ( not ( = ?auto_11032 ?auto_11036 ) ) ( HOIST-AT ?auto_11033 ?auto_11032 ) ( AVAILABLE ?auto_11033 ) ( SURFACE-AT ?auto_11031 ?auto_11032 ) ( ON ?auto_11031 ?auto_11035 ) ( CLEAR ?auto_11031 ) ( not ( = ?auto_11030 ?auto_11031 ) ) ( not ( = ?auto_11030 ?auto_11035 ) ) ( not ( = ?auto_11031 ?auto_11035 ) ) ( not ( = ?auto_11037 ?auto_11033 ) ) ( IS-CRATE ?auto_11030 ) ( not ( = ?auto_11038 ?auto_11036 ) ) ( HOIST-AT ?auto_11044 ?auto_11038 ) ( SURFACE-AT ?auto_11030 ?auto_11038 ) ( ON ?auto_11030 ?auto_11043 ) ( CLEAR ?auto_11030 ) ( not ( = ?auto_11029 ?auto_11030 ) ) ( not ( = ?auto_11029 ?auto_11043 ) ) ( not ( = ?auto_11030 ?auto_11043 ) ) ( not ( = ?auto_11037 ?auto_11044 ) ) ( IS-CRATE ?auto_11029 ) ( not ( = ?auto_11047 ?auto_11036 ) ) ( HOIST-AT ?auto_11045 ?auto_11047 ) ( SURFACE-AT ?auto_11029 ?auto_11047 ) ( ON ?auto_11029 ?auto_11046 ) ( CLEAR ?auto_11029 ) ( not ( = ?auto_11028 ?auto_11029 ) ) ( not ( = ?auto_11028 ?auto_11046 ) ) ( not ( = ?auto_11029 ?auto_11046 ) ) ( not ( = ?auto_11037 ?auto_11045 ) ) ( IS-CRATE ?auto_11028 ) ( AVAILABLE ?auto_11044 ) ( SURFACE-AT ?auto_11028 ?auto_11038 ) ( ON ?auto_11028 ?auto_11040 ) ( CLEAR ?auto_11028 ) ( not ( = ?auto_11027 ?auto_11028 ) ) ( not ( = ?auto_11027 ?auto_11040 ) ) ( not ( = ?auto_11028 ?auto_11040 ) ) ( IS-CRATE ?auto_11027 ) ( not ( = ?auto_11042 ?auto_11036 ) ) ( HOIST-AT ?auto_11048 ?auto_11042 ) ( AVAILABLE ?auto_11048 ) ( SURFACE-AT ?auto_11027 ?auto_11042 ) ( ON ?auto_11027 ?auto_11041 ) ( CLEAR ?auto_11027 ) ( not ( = ?auto_11026 ?auto_11027 ) ) ( not ( = ?auto_11026 ?auto_11041 ) ) ( not ( = ?auto_11027 ?auto_11041 ) ) ( not ( = ?auto_11037 ?auto_11048 ) ) ( SURFACE-AT ?auto_11025 ?auto_11036 ) ( CLEAR ?auto_11025 ) ( IS-CRATE ?auto_11026 ) ( AVAILABLE ?auto_11037 ) ( AVAILABLE ?auto_11045 ) ( SURFACE-AT ?auto_11026 ?auto_11047 ) ( ON ?auto_11026 ?auto_11039 ) ( CLEAR ?auto_11026 ) ( TRUCK-AT ?auto_11034 ?auto_11036 ) ( not ( = ?auto_11025 ?auto_11026 ) ) ( not ( = ?auto_11025 ?auto_11039 ) ) ( not ( = ?auto_11026 ?auto_11039 ) ) ( not ( = ?auto_11025 ?auto_11027 ) ) ( not ( = ?auto_11025 ?auto_11041 ) ) ( not ( = ?auto_11027 ?auto_11039 ) ) ( not ( = ?auto_11042 ?auto_11047 ) ) ( not ( = ?auto_11048 ?auto_11045 ) ) ( not ( = ?auto_11041 ?auto_11039 ) ) ( not ( = ?auto_11025 ?auto_11028 ) ) ( not ( = ?auto_11025 ?auto_11040 ) ) ( not ( = ?auto_11026 ?auto_11028 ) ) ( not ( = ?auto_11026 ?auto_11040 ) ) ( not ( = ?auto_11028 ?auto_11041 ) ) ( not ( = ?auto_11028 ?auto_11039 ) ) ( not ( = ?auto_11038 ?auto_11042 ) ) ( not ( = ?auto_11038 ?auto_11047 ) ) ( not ( = ?auto_11044 ?auto_11048 ) ) ( not ( = ?auto_11044 ?auto_11045 ) ) ( not ( = ?auto_11040 ?auto_11041 ) ) ( not ( = ?auto_11040 ?auto_11039 ) ) ( not ( = ?auto_11025 ?auto_11029 ) ) ( not ( = ?auto_11025 ?auto_11046 ) ) ( not ( = ?auto_11026 ?auto_11029 ) ) ( not ( = ?auto_11026 ?auto_11046 ) ) ( not ( = ?auto_11027 ?auto_11029 ) ) ( not ( = ?auto_11027 ?auto_11046 ) ) ( not ( = ?auto_11029 ?auto_11040 ) ) ( not ( = ?auto_11029 ?auto_11041 ) ) ( not ( = ?auto_11029 ?auto_11039 ) ) ( not ( = ?auto_11046 ?auto_11040 ) ) ( not ( = ?auto_11046 ?auto_11041 ) ) ( not ( = ?auto_11046 ?auto_11039 ) ) ( not ( = ?auto_11025 ?auto_11030 ) ) ( not ( = ?auto_11025 ?auto_11043 ) ) ( not ( = ?auto_11026 ?auto_11030 ) ) ( not ( = ?auto_11026 ?auto_11043 ) ) ( not ( = ?auto_11027 ?auto_11030 ) ) ( not ( = ?auto_11027 ?auto_11043 ) ) ( not ( = ?auto_11028 ?auto_11030 ) ) ( not ( = ?auto_11028 ?auto_11043 ) ) ( not ( = ?auto_11030 ?auto_11046 ) ) ( not ( = ?auto_11030 ?auto_11040 ) ) ( not ( = ?auto_11030 ?auto_11041 ) ) ( not ( = ?auto_11030 ?auto_11039 ) ) ( not ( = ?auto_11043 ?auto_11046 ) ) ( not ( = ?auto_11043 ?auto_11040 ) ) ( not ( = ?auto_11043 ?auto_11041 ) ) ( not ( = ?auto_11043 ?auto_11039 ) ) ( not ( = ?auto_11025 ?auto_11031 ) ) ( not ( = ?auto_11025 ?auto_11035 ) ) ( not ( = ?auto_11026 ?auto_11031 ) ) ( not ( = ?auto_11026 ?auto_11035 ) ) ( not ( = ?auto_11027 ?auto_11031 ) ) ( not ( = ?auto_11027 ?auto_11035 ) ) ( not ( = ?auto_11028 ?auto_11031 ) ) ( not ( = ?auto_11028 ?auto_11035 ) ) ( not ( = ?auto_11029 ?auto_11031 ) ) ( not ( = ?auto_11029 ?auto_11035 ) ) ( not ( = ?auto_11031 ?auto_11043 ) ) ( not ( = ?auto_11031 ?auto_11046 ) ) ( not ( = ?auto_11031 ?auto_11040 ) ) ( not ( = ?auto_11031 ?auto_11041 ) ) ( not ( = ?auto_11031 ?auto_11039 ) ) ( not ( = ?auto_11032 ?auto_11038 ) ) ( not ( = ?auto_11032 ?auto_11047 ) ) ( not ( = ?auto_11032 ?auto_11042 ) ) ( not ( = ?auto_11033 ?auto_11044 ) ) ( not ( = ?auto_11033 ?auto_11045 ) ) ( not ( = ?auto_11033 ?auto_11048 ) ) ( not ( = ?auto_11035 ?auto_11043 ) ) ( not ( = ?auto_11035 ?auto_11046 ) ) ( not ( = ?auto_11035 ?auto_11040 ) ) ( not ( = ?auto_11035 ?auto_11041 ) ) ( not ( = ?auto_11035 ?auto_11039 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_11025 ?auto_11026 ?auto_11027 ?auto_11028 ?auto_11029 ?auto_11030 )
      ( MAKE-1CRATE ?auto_11030 ?auto_11031 )
      ( MAKE-6CRATE-VERIFY ?auto_11025 ?auto_11026 ?auto_11027 ?auto_11028 ?auto_11029 ?auto_11030 ?auto_11031 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11051 - SURFACE
      ?auto_11052 - SURFACE
    )
    :vars
    (
      ?auto_11053 - HOIST
      ?auto_11054 - PLACE
      ?auto_11056 - PLACE
      ?auto_11057 - HOIST
      ?auto_11058 - SURFACE
      ?auto_11055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11053 ?auto_11054 ) ( SURFACE-AT ?auto_11051 ?auto_11054 ) ( CLEAR ?auto_11051 ) ( IS-CRATE ?auto_11052 ) ( AVAILABLE ?auto_11053 ) ( not ( = ?auto_11056 ?auto_11054 ) ) ( HOIST-AT ?auto_11057 ?auto_11056 ) ( AVAILABLE ?auto_11057 ) ( SURFACE-AT ?auto_11052 ?auto_11056 ) ( ON ?auto_11052 ?auto_11058 ) ( CLEAR ?auto_11052 ) ( TRUCK-AT ?auto_11055 ?auto_11054 ) ( not ( = ?auto_11051 ?auto_11052 ) ) ( not ( = ?auto_11051 ?auto_11058 ) ) ( not ( = ?auto_11052 ?auto_11058 ) ) ( not ( = ?auto_11053 ?auto_11057 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11055 ?auto_11054 ?auto_11056 )
      ( !LIFT ?auto_11057 ?auto_11052 ?auto_11058 ?auto_11056 )
      ( !LOAD ?auto_11057 ?auto_11052 ?auto_11055 ?auto_11056 )
      ( !DRIVE ?auto_11055 ?auto_11056 ?auto_11054 )
      ( !UNLOAD ?auto_11053 ?auto_11052 ?auto_11055 ?auto_11054 )
      ( !DROP ?auto_11053 ?auto_11052 ?auto_11051 ?auto_11054 )
      ( MAKE-1CRATE-VERIFY ?auto_11051 ?auto_11052 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_11067 - SURFACE
      ?auto_11068 - SURFACE
      ?auto_11069 - SURFACE
      ?auto_11070 - SURFACE
      ?auto_11071 - SURFACE
      ?auto_11072 - SURFACE
      ?auto_11073 - SURFACE
      ?auto_11074 - SURFACE
    )
    :vars
    (
      ?auto_11077 - HOIST
      ?auto_11078 - PLACE
      ?auto_11076 - PLACE
      ?auto_11075 - HOIST
      ?auto_11079 - SURFACE
      ?auto_11086 - PLACE
      ?auto_11091 - HOIST
      ?auto_11092 - SURFACE
      ?auto_11089 - SURFACE
      ?auto_11084 - PLACE
      ?auto_11085 - HOIST
      ?auto_11082 - SURFACE
      ?auto_11088 - SURFACE
      ?auto_11090 - PLACE
      ?auto_11083 - HOIST
      ?auto_11081 - SURFACE
      ?auto_11087 - SURFACE
      ?auto_11080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11077 ?auto_11078 ) ( IS-CRATE ?auto_11074 ) ( not ( = ?auto_11076 ?auto_11078 ) ) ( HOIST-AT ?auto_11075 ?auto_11076 ) ( SURFACE-AT ?auto_11074 ?auto_11076 ) ( ON ?auto_11074 ?auto_11079 ) ( CLEAR ?auto_11074 ) ( not ( = ?auto_11073 ?auto_11074 ) ) ( not ( = ?auto_11073 ?auto_11079 ) ) ( not ( = ?auto_11074 ?auto_11079 ) ) ( not ( = ?auto_11077 ?auto_11075 ) ) ( IS-CRATE ?auto_11073 ) ( not ( = ?auto_11086 ?auto_11078 ) ) ( HOIST-AT ?auto_11091 ?auto_11086 ) ( AVAILABLE ?auto_11091 ) ( SURFACE-AT ?auto_11073 ?auto_11086 ) ( ON ?auto_11073 ?auto_11092 ) ( CLEAR ?auto_11073 ) ( not ( = ?auto_11072 ?auto_11073 ) ) ( not ( = ?auto_11072 ?auto_11092 ) ) ( not ( = ?auto_11073 ?auto_11092 ) ) ( not ( = ?auto_11077 ?auto_11091 ) ) ( IS-CRATE ?auto_11072 ) ( SURFACE-AT ?auto_11072 ?auto_11076 ) ( ON ?auto_11072 ?auto_11089 ) ( CLEAR ?auto_11072 ) ( not ( = ?auto_11071 ?auto_11072 ) ) ( not ( = ?auto_11071 ?auto_11089 ) ) ( not ( = ?auto_11072 ?auto_11089 ) ) ( IS-CRATE ?auto_11071 ) ( not ( = ?auto_11084 ?auto_11078 ) ) ( HOIST-AT ?auto_11085 ?auto_11084 ) ( SURFACE-AT ?auto_11071 ?auto_11084 ) ( ON ?auto_11071 ?auto_11082 ) ( CLEAR ?auto_11071 ) ( not ( = ?auto_11070 ?auto_11071 ) ) ( not ( = ?auto_11070 ?auto_11082 ) ) ( not ( = ?auto_11071 ?auto_11082 ) ) ( not ( = ?auto_11077 ?auto_11085 ) ) ( IS-CRATE ?auto_11070 ) ( AVAILABLE ?auto_11075 ) ( SURFACE-AT ?auto_11070 ?auto_11076 ) ( ON ?auto_11070 ?auto_11088 ) ( CLEAR ?auto_11070 ) ( not ( = ?auto_11069 ?auto_11070 ) ) ( not ( = ?auto_11069 ?auto_11088 ) ) ( not ( = ?auto_11070 ?auto_11088 ) ) ( IS-CRATE ?auto_11069 ) ( not ( = ?auto_11090 ?auto_11078 ) ) ( HOIST-AT ?auto_11083 ?auto_11090 ) ( AVAILABLE ?auto_11083 ) ( SURFACE-AT ?auto_11069 ?auto_11090 ) ( ON ?auto_11069 ?auto_11081 ) ( CLEAR ?auto_11069 ) ( not ( = ?auto_11068 ?auto_11069 ) ) ( not ( = ?auto_11068 ?auto_11081 ) ) ( not ( = ?auto_11069 ?auto_11081 ) ) ( not ( = ?auto_11077 ?auto_11083 ) ) ( SURFACE-AT ?auto_11067 ?auto_11078 ) ( CLEAR ?auto_11067 ) ( IS-CRATE ?auto_11068 ) ( AVAILABLE ?auto_11077 ) ( AVAILABLE ?auto_11085 ) ( SURFACE-AT ?auto_11068 ?auto_11084 ) ( ON ?auto_11068 ?auto_11087 ) ( CLEAR ?auto_11068 ) ( TRUCK-AT ?auto_11080 ?auto_11078 ) ( not ( = ?auto_11067 ?auto_11068 ) ) ( not ( = ?auto_11067 ?auto_11087 ) ) ( not ( = ?auto_11068 ?auto_11087 ) ) ( not ( = ?auto_11067 ?auto_11069 ) ) ( not ( = ?auto_11067 ?auto_11081 ) ) ( not ( = ?auto_11069 ?auto_11087 ) ) ( not ( = ?auto_11090 ?auto_11084 ) ) ( not ( = ?auto_11083 ?auto_11085 ) ) ( not ( = ?auto_11081 ?auto_11087 ) ) ( not ( = ?auto_11067 ?auto_11070 ) ) ( not ( = ?auto_11067 ?auto_11088 ) ) ( not ( = ?auto_11068 ?auto_11070 ) ) ( not ( = ?auto_11068 ?auto_11088 ) ) ( not ( = ?auto_11070 ?auto_11081 ) ) ( not ( = ?auto_11070 ?auto_11087 ) ) ( not ( = ?auto_11076 ?auto_11090 ) ) ( not ( = ?auto_11076 ?auto_11084 ) ) ( not ( = ?auto_11075 ?auto_11083 ) ) ( not ( = ?auto_11075 ?auto_11085 ) ) ( not ( = ?auto_11088 ?auto_11081 ) ) ( not ( = ?auto_11088 ?auto_11087 ) ) ( not ( = ?auto_11067 ?auto_11071 ) ) ( not ( = ?auto_11067 ?auto_11082 ) ) ( not ( = ?auto_11068 ?auto_11071 ) ) ( not ( = ?auto_11068 ?auto_11082 ) ) ( not ( = ?auto_11069 ?auto_11071 ) ) ( not ( = ?auto_11069 ?auto_11082 ) ) ( not ( = ?auto_11071 ?auto_11088 ) ) ( not ( = ?auto_11071 ?auto_11081 ) ) ( not ( = ?auto_11071 ?auto_11087 ) ) ( not ( = ?auto_11082 ?auto_11088 ) ) ( not ( = ?auto_11082 ?auto_11081 ) ) ( not ( = ?auto_11082 ?auto_11087 ) ) ( not ( = ?auto_11067 ?auto_11072 ) ) ( not ( = ?auto_11067 ?auto_11089 ) ) ( not ( = ?auto_11068 ?auto_11072 ) ) ( not ( = ?auto_11068 ?auto_11089 ) ) ( not ( = ?auto_11069 ?auto_11072 ) ) ( not ( = ?auto_11069 ?auto_11089 ) ) ( not ( = ?auto_11070 ?auto_11072 ) ) ( not ( = ?auto_11070 ?auto_11089 ) ) ( not ( = ?auto_11072 ?auto_11082 ) ) ( not ( = ?auto_11072 ?auto_11088 ) ) ( not ( = ?auto_11072 ?auto_11081 ) ) ( not ( = ?auto_11072 ?auto_11087 ) ) ( not ( = ?auto_11089 ?auto_11082 ) ) ( not ( = ?auto_11089 ?auto_11088 ) ) ( not ( = ?auto_11089 ?auto_11081 ) ) ( not ( = ?auto_11089 ?auto_11087 ) ) ( not ( = ?auto_11067 ?auto_11073 ) ) ( not ( = ?auto_11067 ?auto_11092 ) ) ( not ( = ?auto_11068 ?auto_11073 ) ) ( not ( = ?auto_11068 ?auto_11092 ) ) ( not ( = ?auto_11069 ?auto_11073 ) ) ( not ( = ?auto_11069 ?auto_11092 ) ) ( not ( = ?auto_11070 ?auto_11073 ) ) ( not ( = ?auto_11070 ?auto_11092 ) ) ( not ( = ?auto_11071 ?auto_11073 ) ) ( not ( = ?auto_11071 ?auto_11092 ) ) ( not ( = ?auto_11073 ?auto_11089 ) ) ( not ( = ?auto_11073 ?auto_11082 ) ) ( not ( = ?auto_11073 ?auto_11088 ) ) ( not ( = ?auto_11073 ?auto_11081 ) ) ( not ( = ?auto_11073 ?auto_11087 ) ) ( not ( = ?auto_11086 ?auto_11076 ) ) ( not ( = ?auto_11086 ?auto_11084 ) ) ( not ( = ?auto_11086 ?auto_11090 ) ) ( not ( = ?auto_11091 ?auto_11075 ) ) ( not ( = ?auto_11091 ?auto_11085 ) ) ( not ( = ?auto_11091 ?auto_11083 ) ) ( not ( = ?auto_11092 ?auto_11089 ) ) ( not ( = ?auto_11092 ?auto_11082 ) ) ( not ( = ?auto_11092 ?auto_11088 ) ) ( not ( = ?auto_11092 ?auto_11081 ) ) ( not ( = ?auto_11092 ?auto_11087 ) ) ( not ( = ?auto_11067 ?auto_11074 ) ) ( not ( = ?auto_11067 ?auto_11079 ) ) ( not ( = ?auto_11068 ?auto_11074 ) ) ( not ( = ?auto_11068 ?auto_11079 ) ) ( not ( = ?auto_11069 ?auto_11074 ) ) ( not ( = ?auto_11069 ?auto_11079 ) ) ( not ( = ?auto_11070 ?auto_11074 ) ) ( not ( = ?auto_11070 ?auto_11079 ) ) ( not ( = ?auto_11071 ?auto_11074 ) ) ( not ( = ?auto_11071 ?auto_11079 ) ) ( not ( = ?auto_11072 ?auto_11074 ) ) ( not ( = ?auto_11072 ?auto_11079 ) ) ( not ( = ?auto_11074 ?auto_11092 ) ) ( not ( = ?auto_11074 ?auto_11089 ) ) ( not ( = ?auto_11074 ?auto_11082 ) ) ( not ( = ?auto_11074 ?auto_11088 ) ) ( not ( = ?auto_11074 ?auto_11081 ) ) ( not ( = ?auto_11074 ?auto_11087 ) ) ( not ( = ?auto_11079 ?auto_11092 ) ) ( not ( = ?auto_11079 ?auto_11089 ) ) ( not ( = ?auto_11079 ?auto_11082 ) ) ( not ( = ?auto_11079 ?auto_11088 ) ) ( not ( = ?auto_11079 ?auto_11081 ) ) ( not ( = ?auto_11079 ?auto_11087 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_11067 ?auto_11068 ?auto_11069 ?auto_11070 ?auto_11071 ?auto_11072 ?auto_11073 )
      ( MAKE-1CRATE ?auto_11073 ?auto_11074 )
      ( MAKE-7CRATE-VERIFY ?auto_11067 ?auto_11068 ?auto_11069 ?auto_11070 ?auto_11071 ?auto_11072 ?auto_11073 ?auto_11074 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11095 - SURFACE
      ?auto_11096 - SURFACE
    )
    :vars
    (
      ?auto_11097 - HOIST
      ?auto_11098 - PLACE
      ?auto_11100 - PLACE
      ?auto_11101 - HOIST
      ?auto_11102 - SURFACE
      ?auto_11099 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11097 ?auto_11098 ) ( SURFACE-AT ?auto_11095 ?auto_11098 ) ( CLEAR ?auto_11095 ) ( IS-CRATE ?auto_11096 ) ( AVAILABLE ?auto_11097 ) ( not ( = ?auto_11100 ?auto_11098 ) ) ( HOIST-AT ?auto_11101 ?auto_11100 ) ( AVAILABLE ?auto_11101 ) ( SURFACE-AT ?auto_11096 ?auto_11100 ) ( ON ?auto_11096 ?auto_11102 ) ( CLEAR ?auto_11096 ) ( TRUCK-AT ?auto_11099 ?auto_11098 ) ( not ( = ?auto_11095 ?auto_11096 ) ) ( not ( = ?auto_11095 ?auto_11102 ) ) ( not ( = ?auto_11096 ?auto_11102 ) ) ( not ( = ?auto_11097 ?auto_11101 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11099 ?auto_11098 ?auto_11100 )
      ( !LIFT ?auto_11101 ?auto_11096 ?auto_11102 ?auto_11100 )
      ( !LOAD ?auto_11101 ?auto_11096 ?auto_11099 ?auto_11100 )
      ( !DRIVE ?auto_11099 ?auto_11100 ?auto_11098 )
      ( !UNLOAD ?auto_11097 ?auto_11096 ?auto_11099 ?auto_11098 )
      ( !DROP ?auto_11097 ?auto_11096 ?auto_11095 ?auto_11098 )
      ( MAKE-1CRATE-VERIFY ?auto_11095 ?auto_11096 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_11112 - SURFACE
      ?auto_11113 - SURFACE
      ?auto_11114 - SURFACE
      ?auto_11115 - SURFACE
      ?auto_11116 - SURFACE
      ?auto_11117 - SURFACE
      ?auto_11118 - SURFACE
      ?auto_11120 - SURFACE
      ?auto_11119 - SURFACE
    )
    :vars
    (
      ?auto_11125 - HOIST
      ?auto_11124 - PLACE
      ?auto_11126 - PLACE
      ?auto_11122 - HOIST
      ?auto_11121 - SURFACE
      ?auto_11131 - PLACE
      ?auto_11127 - HOIST
      ?auto_11130 - SURFACE
      ?auto_11139 - PLACE
      ?auto_11134 - HOIST
      ?auto_11136 - SURFACE
      ?auto_11133 - SURFACE
      ?auto_11132 - PLACE
      ?auto_11140 - HOIST
      ?auto_11128 - SURFACE
      ?auto_11137 - SURFACE
      ?auto_11135 - PLACE
      ?auto_11129 - HOIST
      ?auto_11141 - SURFACE
      ?auto_11138 - SURFACE
      ?auto_11123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11125 ?auto_11124 ) ( IS-CRATE ?auto_11119 ) ( not ( = ?auto_11126 ?auto_11124 ) ) ( HOIST-AT ?auto_11122 ?auto_11126 ) ( AVAILABLE ?auto_11122 ) ( SURFACE-AT ?auto_11119 ?auto_11126 ) ( ON ?auto_11119 ?auto_11121 ) ( CLEAR ?auto_11119 ) ( not ( = ?auto_11120 ?auto_11119 ) ) ( not ( = ?auto_11120 ?auto_11121 ) ) ( not ( = ?auto_11119 ?auto_11121 ) ) ( not ( = ?auto_11125 ?auto_11122 ) ) ( IS-CRATE ?auto_11120 ) ( not ( = ?auto_11131 ?auto_11124 ) ) ( HOIST-AT ?auto_11127 ?auto_11131 ) ( SURFACE-AT ?auto_11120 ?auto_11131 ) ( ON ?auto_11120 ?auto_11130 ) ( CLEAR ?auto_11120 ) ( not ( = ?auto_11118 ?auto_11120 ) ) ( not ( = ?auto_11118 ?auto_11130 ) ) ( not ( = ?auto_11120 ?auto_11130 ) ) ( not ( = ?auto_11125 ?auto_11127 ) ) ( IS-CRATE ?auto_11118 ) ( not ( = ?auto_11139 ?auto_11124 ) ) ( HOIST-AT ?auto_11134 ?auto_11139 ) ( AVAILABLE ?auto_11134 ) ( SURFACE-AT ?auto_11118 ?auto_11139 ) ( ON ?auto_11118 ?auto_11136 ) ( CLEAR ?auto_11118 ) ( not ( = ?auto_11117 ?auto_11118 ) ) ( not ( = ?auto_11117 ?auto_11136 ) ) ( not ( = ?auto_11118 ?auto_11136 ) ) ( not ( = ?auto_11125 ?auto_11134 ) ) ( IS-CRATE ?auto_11117 ) ( SURFACE-AT ?auto_11117 ?auto_11131 ) ( ON ?auto_11117 ?auto_11133 ) ( CLEAR ?auto_11117 ) ( not ( = ?auto_11116 ?auto_11117 ) ) ( not ( = ?auto_11116 ?auto_11133 ) ) ( not ( = ?auto_11117 ?auto_11133 ) ) ( IS-CRATE ?auto_11116 ) ( not ( = ?auto_11132 ?auto_11124 ) ) ( HOIST-AT ?auto_11140 ?auto_11132 ) ( SURFACE-AT ?auto_11116 ?auto_11132 ) ( ON ?auto_11116 ?auto_11128 ) ( CLEAR ?auto_11116 ) ( not ( = ?auto_11115 ?auto_11116 ) ) ( not ( = ?auto_11115 ?auto_11128 ) ) ( not ( = ?auto_11116 ?auto_11128 ) ) ( not ( = ?auto_11125 ?auto_11140 ) ) ( IS-CRATE ?auto_11115 ) ( AVAILABLE ?auto_11127 ) ( SURFACE-AT ?auto_11115 ?auto_11131 ) ( ON ?auto_11115 ?auto_11137 ) ( CLEAR ?auto_11115 ) ( not ( = ?auto_11114 ?auto_11115 ) ) ( not ( = ?auto_11114 ?auto_11137 ) ) ( not ( = ?auto_11115 ?auto_11137 ) ) ( IS-CRATE ?auto_11114 ) ( not ( = ?auto_11135 ?auto_11124 ) ) ( HOIST-AT ?auto_11129 ?auto_11135 ) ( AVAILABLE ?auto_11129 ) ( SURFACE-AT ?auto_11114 ?auto_11135 ) ( ON ?auto_11114 ?auto_11141 ) ( CLEAR ?auto_11114 ) ( not ( = ?auto_11113 ?auto_11114 ) ) ( not ( = ?auto_11113 ?auto_11141 ) ) ( not ( = ?auto_11114 ?auto_11141 ) ) ( not ( = ?auto_11125 ?auto_11129 ) ) ( SURFACE-AT ?auto_11112 ?auto_11124 ) ( CLEAR ?auto_11112 ) ( IS-CRATE ?auto_11113 ) ( AVAILABLE ?auto_11125 ) ( AVAILABLE ?auto_11140 ) ( SURFACE-AT ?auto_11113 ?auto_11132 ) ( ON ?auto_11113 ?auto_11138 ) ( CLEAR ?auto_11113 ) ( TRUCK-AT ?auto_11123 ?auto_11124 ) ( not ( = ?auto_11112 ?auto_11113 ) ) ( not ( = ?auto_11112 ?auto_11138 ) ) ( not ( = ?auto_11113 ?auto_11138 ) ) ( not ( = ?auto_11112 ?auto_11114 ) ) ( not ( = ?auto_11112 ?auto_11141 ) ) ( not ( = ?auto_11114 ?auto_11138 ) ) ( not ( = ?auto_11135 ?auto_11132 ) ) ( not ( = ?auto_11129 ?auto_11140 ) ) ( not ( = ?auto_11141 ?auto_11138 ) ) ( not ( = ?auto_11112 ?auto_11115 ) ) ( not ( = ?auto_11112 ?auto_11137 ) ) ( not ( = ?auto_11113 ?auto_11115 ) ) ( not ( = ?auto_11113 ?auto_11137 ) ) ( not ( = ?auto_11115 ?auto_11141 ) ) ( not ( = ?auto_11115 ?auto_11138 ) ) ( not ( = ?auto_11131 ?auto_11135 ) ) ( not ( = ?auto_11131 ?auto_11132 ) ) ( not ( = ?auto_11127 ?auto_11129 ) ) ( not ( = ?auto_11127 ?auto_11140 ) ) ( not ( = ?auto_11137 ?auto_11141 ) ) ( not ( = ?auto_11137 ?auto_11138 ) ) ( not ( = ?auto_11112 ?auto_11116 ) ) ( not ( = ?auto_11112 ?auto_11128 ) ) ( not ( = ?auto_11113 ?auto_11116 ) ) ( not ( = ?auto_11113 ?auto_11128 ) ) ( not ( = ?auto_11114 ?auto_11116 ) ) ( not ( = ?auto_11114 ?auto_11128 ) ) ( not ( = ?auto_11116 ?auto_11137 ) ) ( not ( = ?auto_11116 ?auto_11141 ) ) ( not ( = ?auto_11116 ?auto_11138 ) ) ( not ( = ?auto_11128 ?auto_11137 ) ) ( not ( = ?auto_11128 ?auto_11141 ) ) ( not ( = ?auto_11128 ?auto_11138 ) ) ( not ( = ?auto_11112 ?auto_11117 ) ) ( not ( = ?auto_11112 ?auto_11133 ) ) ( not ( = ?auto_11113 ?auto_11117 ) ) ( not ( = ?auto_11113 ?auto_11133 ) ) ( not ( = ?auto_11114 ?auto_11117 ) ) ( not ( = ?auto_11114 ?auto_11133 ) ) ( not ( = ?auto_11115 ?auto_11117 ) ) ( not ( = ?auto_11115 ?auto_11133 ) ) ( not ( = ?auto_11117 ?auto_11128 ) ) ( not ( = ?auto_11117 ?auto_11137 ) ) ( not ( = ?auto_11117 ?auto_11141 ) ) ( not ( = ?auto_11117 ?auto_11138 ) ) ( not ( = ?auto_11133 ?auto_11128 ) ) ( not ( = ?auto_11133 ?auto_11137 ) ) ( not ( = ?auto_11133 ?auto_11141 ) ) ( not ( = ?auto_11133 ?auto_11138 ) ) ( not ( = ?auto_11112 ?auto_11118 ) ) ( not ( = ?auto_11112 ?auto_11136 ) ) ( not ( = ?auto_11113 ?auto_11118 ) ) ( not ( = ?auto_11113 ?auto_11136 ) ) ( not ( = ?auto_11114 ?auto_11118 ) ) ( not ( = ?auto_11114 ?auto_11136 ) ) ( not ( = ?auto_11115 ?auto_11118 ) ) ( not ( = ?auto_11115 ?auto_11136 ) ) ( not ( = ?auto_11116 ?auto_11118 ) ) ( not ( = ?auto_11116 ?auto_11136 ) ) ( not ( = ?auto_11118 ?auto_11133 ) ) ( not ( = ?auto_11118 ?auto_11128 ) ) ( not ( = ?auto_11118 ?auto_11137 ) ) ( not ( = ?auto_11118 ?auto_11141 ) ) ( not ( = ?auto_11118 ?auto_11138 ) ) ( not ( = ?auto_11139 ?auto_11131 ) ) ( not ( = ?auto_11139 ?auto_11132 ) ) ( not ( = ?auto_11139 ?auto_11135 ) ) ( not ( = ?auto_11134 ?auto_11127 ) ) ( not ( = ?auto_11134 ?auto_11140 ) ) ( not ( = ?auto_11134 ?auto_11129 ) ) ( not ( = ?auto_11136 ?auto_11133 ) ) ( not ( = ?auto_11136 ?auto_11128 ) ) ( not ( = ?auto_11136 ?auto_11137 ) ) ( not ( = ?auto_11136 ?auto_11141 ) ) ( not ( = ?auto_11136 ?auto_11138 ) ) ( not ( = ?auto_11112 ?auto_11120 ) ) ( not ( = ?auto_11112 ?auto_11130 ) ) ( not ( = ?auto_11113 ?auto_11120 ) ) ( not ( = ?auto_11113 ?auto_11130 ) ) ( not ( = ?auto_11114 ?auto_11120 ) ) ( not ( = ?auto_11114 ?auto_11130 ) ) ( not ( = ?auto_11115 ?auto_11120 ) ) ( not ( = ?auto_11115 ?auto_11130 ) ) ( not ( = ?auto_11116 ?auto_11120 ) ) ( not ( = ?auto_11116 ?auto_11130 ) ) ( not ( = ?auto_11117 ?auto_11120 ) ) ( not ( = ?auto_11117 ?auto_11130 ) ) ( not ( = ?auto_11120 ?auto_11136 ) ) ( not ( = ?auto_11120 ?auto_11133 ) ) ( not ( = ?auto_11120 ?auto_11128 ) ) ( not ( = ?auto_11120 ?auto_11137 ) ) ( not ( = ?auto_11120 ?auto_11141 ) ) ( not ( = ?auto_11120 ?auto_11138 ) ) ( not ( = ?auto_11130 ?auto_11136 ) ) ( not ( = ?auto_11130 ?auto_11133 ) ) ( not ( = ?auto_11130 ?auto_11128 ) ) ( not ( = ?auto_11130 ?auto_11137 ) ) ( not ( = ?auto_11130 ?auto_11141 ) ) ( not ( = ?auto_11130 ?auto_11138 ) ) ( not ( = ?auto_11112 ?auto_11119 ) ) ( not ( = ?auto_11112 ?auto_11121 ) ) ( not ( = ?auto_11113 ?auto_11119 ) ) ( not ( = ?auto_11113 ?auto_11121 ) ) ( not ( = ?auto_11114 ?auto_11119 ) ) ( not ( = ?auto_11114 ?auto_11121 ) ) ( not ( = ?auto_11115 ?auto_11119 ) ) ( not ( = ?auto_11115 ?auto_11121 ) ) ( not ( = ?auto_11116 ?auto_11119 ) ) ( not ( = ?auto_11116 ?auto_11121 ) ) ( not ( = ?auto_11117 ?auto_11119 ) ) ( not ( = ?auto_11117 ?auto_11121 ) ) ( not ( = ?auto_11118 ?auto_11119 ) ) ( not ( = ?auto_11118 ?auto_11121 ) ) ( not ( = ?auto_11119 ?auto_11130 ) ) ( not ( = ?auto_11119 ?auto_11136 ) ) ( not ( = ?auto_11119 ?auto_11133 ) ) ( not ( = ?auto_11119 ?auto_11128 ) ) ( not ( = ?auto_11119 ?auto_11137 ) ) ( not ( = ?auto_11119 ?auto_11141 ) ) ( not ( = ?auto_11119 ?auto_11138 ) ) ( not ( = ?auto_11126 ?auto_11131 ) ) ( not ( = ?auto_11126 ?auto_11139 ) ) ( not ( = ?auto_11126 ?auto_11132 ) ) ( not ( = ?auto_11126 ?auto_11135 ) ) ( not ( = ?auto_11122 ?auto_11127 ) ) ( not ( = ?auto_11122 ?auto_11134 ) ) ( not ( = ?auto_11122 ?auto_11140 ) ) ( not ( = ?auto_11122 ?auto_11129 ) ) ( not ( = ?auto_11121 ?auto_11130 ) ) ( not ( = ?auto_11121 ?auto_11136 ) ) ( not ( = ?auto_11121 ?auto_11133 ) ) ( not ( = ?auto_11121 ?auto_11128 ) ) ( not ( = ?auto_11121 ?auto_11137 ) ) ( not ( = ?auto_11121 ?auto_11141 ) ) ( not ( = ?auto_11121 ?auto_11138 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_11112 ?auto_11113 ?auto_11114 ?auto_11115 ?auto_11116 ?auto_11117 ?auto_11118 ?auto_11120 )
      ( MAKE-1CRATE ?auto_11120 ?auto_11119 )
      ( MAKE-8CRATE-VERIFY ?auto_11112 ?auto_11113 ?auto_11114 ?auto_11115 ?auto_11116 ?auto_11117 ?auto_11118 ?auto_11120 ?auto_11119 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11144 - SURFACE
      ?auto_11145 - SURFACE
    )
    :vars
    (
      ?auto_11146 - HOIST
      ?auto_11147 - PLACE
      ?auto_11149 - PLACE
      ?auto_11150 - HOIST
      ?auto_11151 - SURFACE
      ?auto_11148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11146 ?auto_11147 ) ( SURFACE-AT ?auto_11144 ?auto_11147 ) ( CLEAR ?auto_11144 ) ( IS-CRATE ?auto_11145 ) ( AVAILABLE ?auto_11146 ) ( not ( = ?auto_11149 ?auto_11147 ) ) ( HOIST-AT ?auto_11150 ?auto_11149 ) ( AVAILABLE ?auto_11150 ) ( SURFACE-AT ?auto_11145 ?auto_11149 ) ( ON ?auto_11145 ?auto_11151 ) ( CLEAR ?auto_11145 ) ( TRUCK-AT ?auto_11148 ?auto_11147 ) ( not ( = ?auto_11144 ?auto_11145 ) ) ( not ( = ?auto_11144 ?auto_11151 ) ) ( not ( = ?auto_11145 ?auto_11151 ) ) ( not ( = ?auto_11146 ?auto_11150 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11148 ?auto_11147 ?auto_11149 )
      ( !LIFT ?auto_11150 ?auto_11145 ?auto_11151 ?auto_11149 )
      ( !LOAD ?auto_11150 ?auto_11145 ?auto_11148 ?auto_11149 )
      ( !DRIVE ?auto_11148 ?auto_11149 ?auto_11147 )
      ( !UNLOAD ?auto_11146 ?auto_11145 ?auto_11148 ?auto_11147 )
      ( !DROP ?auto_11146 ?auto_11145 ?auto_11144 ?auto_11147 )
      ( MAKE-1CRATE-VERIFY ?auto_11144 ?auto_11145 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_11162 - SURFACE
      ?auto_11163 - SURFACE
      ?auto_11164 - SURFACE
      ?auto_11165 - SURFACE
      ?auto_11166 - SURFACE
      ?auto_11167 - SURFACE
      ?auto_11168 - SURFACE
      ?auto_11171 - SURFACE
      ?auto_11170 - SURFACE
      ?auto_11169 - SURFACE
    )
    :vars
    (
      ?auto_11173 - HOIST
      ?auto_11176 - PLACE
      ?auto_11174 - PLACE
      ?auto_11177 - HOIST
      ?auto_11172 - SURFACE
      ?auto_11190 - PLACE
      ?auto_11189 - HOIST
      ?auto_11191 - SURFACE
      ?auto_11188 - PLACE
      ?auto_11180 - HOIST
      ?auto_11179 - SURFACE
      ?auto_11183 - SURFACE
      ?auto_11186 - SURFACE
      ?auto_11187 - PLACE
      ?auto_11185 - HOIST
      ?auto_11178 - SURFACE
      ?auto_11182 - SURFACE
      ?auto_11181 - PLACE
      ?auto_11193 - HOIST
      ?auto_11192 - SURFACE
      ?auto_11184 - SURFACE
      ?auto_11175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11173 ?auto_11176 ) ( IS-CRATE ?auto_11169 ) ( not ( = ?auto_11174 ?auto_11176 ) ) ( HOIST-AT ?auto_11177 ?auto_11174 ) ( SURFACE-AT ?auto_11169 ?auto_11174 ) ( ON ?auto_11169 ?auto_11172 ) ( CLEAR ?auto_11169 ) ( not ( = ?auto_11170 ?auto_11169 ) ) ( not ( = ?auto_11170 ?auto_11172 ) ) ( not ( = ?auto_11169 ?auto_11172 ) ) ( not ( = ?auto_11173 ?auto_11177 ) ) ( IS-CRATE ?auto_11170 ) ( not ( = ?auto_11190 ?auto_11176 ) ) ( HOIST-AT ?auto_11189 ?auto_11190 ) ( AVAILABLE ?auto_11189 ) ( SURFACE-AT ?auto_11170 ?auto_11190 ) ( ON ?auto_11170 ?auto_11191 ) ( CLEAR ?auto_11170 ) ( not ( = ?auto_11171 ?auto_11170 ) ) ( not ( = ?auto_11171 ?auto_11191 ) ) ( not ( = ?auto_11170 ?auto_11191 ) ) ( not ( = ?auto_11173 ?auto_11189 ) ) ( IS-CRATE ?auto_11171 ) ( not ( = ?auto_11188 ?auto_11176 ) ) ( HOIST-AT ?auto_11180 ?auto_11188 ) ( SURFACE-AT ?auto_11171 ?auto_11188 ) ( ON ?auto_11171 ?auto_11179 ) ( CLEAR ?auto_11171 ) ( not ( = ?auto_11168 ?auto_11171 ) ) ( not ( = ?auto_11168 ?auto_11179 ) ) ( not ( = ?auto_11171 ?auto_11179 ) ) ( not ( = ?auto_11173 ?auto_11180 ) ) ( IS-CRATE ?auto_11168 ) ( AVAILABLE ?auto_11177 ) ( SURFACE-AT ?auto_11168 ?auto_11174 ) ( ON ?auto_11168 ?auto_11183 ) ( CLEAR ?auto_11168 ) ( not ( = ?auto_11167 ?auto_11168 ) ) ( not ( = ?auto_11167 ?auto_11183 ) ) ( not ( = ?auto_11168 ?auto_11183 ) ) ( IS-CRATE ?auto_11167 ) ( SURFACE-AT ?auto_11167 ?auto_11188 ) ( ON ?auto_11167 ?auto_11186 ) ( CLEAR ?auto_11167 ) ( not ( = ?auto_11166 ?auto_11167 ) ) ( not ( = ?auto_11166 ?auto_11186 ) ) ( not ( = ?auto_11167 ?auto_11186 ) ) ( IS-CRATE ?auto_11166 ) ( not ( = ?auto_11187 ?auto_11176 ) ) ( HOIST-AT ?auto_11185 ?auto_11187 ) ( SURFACE-AT ?auto_11166 ?auto_11187 ) ( ON ?auto_11166 ?auto_11178 ) ( CLEAR ?auto_11166 ) ( not ( = ?auto_11165 ?auto_11166 ) ) ( not ( = ?auto_11165 ?auto_11178 ) ) ( not ( = ?auto_11166 ?auto_11178 ) ) ( not ( = ?auto_11173 ?auto_11185 ) ) ( IS-CRATE ?auto_11165 ) ( AVAILABLE ?auto_11180 ) ( SURFACE-AT ?auto_11165 ?auto_11188 ) ( ON ?auto_11165 ?auto_11182 ) ( CLEAR ?auto_11165 ) ( not ( = ?auto_11164 ?auto_11165 ) ) ( not ( = ?auto_11164 ?auto_11182 ) ) ( not ( = ?auto_11165 ?auto_11182 ) ) ( IS-CRATE ?auto_11164 ) ( not ( = ?auto_11181 ?auto_11176 ) ) ( HOIST-AT ?auto_11193 ?auto_11181 ) ( AVAILABLE ?auto_11193 ) ( SURFACE-AT ?auto_11164 ?auto_11181 ) ( ON ?auto_11164 ?auto_11192 ) ( CLEAR ?auto_11164 ) ( not ( = ?auto_11163 ?auto_11164 ) ) ( not ( = ?auto_11163 ?auto_11192 ) ) ( not ( = ?auto_11164 ?auto_11192 ) ) ( not ( = ?auto_11173 ?auto_11193 ) ) ( SURFACE-AT ?auto_11162 ?auto_11176 ) ( CLEAR ?auto_11162 ) ( IS-CRATE ?auto_11163 ) ( AVAILABLE ?auto_11173 ) ( AVAILABLE ?auto_11185 ) ( SURFACE-AT ?auto_11163 ?auto_11187 ) ( ON ?auto_11163 ?auto_11184 ) ( CLEAR ?auto_11163 ) ( TRUCK-AT ?auto_11175 ?auto_11176 ) ( not ( = ?auto_11162 ?auto_11163 ) ) ( not ( = ?auto_11162 ?auto_11184 ) ) ( not ( = ?auto_11163 ?auto_11184 ) ) ( not ( = ?auto_11162 ?auto_11164 ) ) ( not ( = ?auto_11162 ?auto_11192 ) ) ( not ( = ?auto_11164 ?auto_11184 ) ) ( not ( = ?auto_11181 ?auto_11187 ) ) ( not ( = ?auto_11193 ?auto_11185 ) ) ( not ( = ?auto_11192 ?auto_11184 ) ) ( not ( = ?auto_11162 ?auto_11165 ) ) ( not ( = ?auto_11162 ?auto_11182 ) ) ( not ( = ?auto_11163 ?auto_11165 ) ) ( not ( = ?auto_11163 ?auto_11182 ) ) ( not ( = ?auto_11165 ?auto_11192 ) ) ( not ( = ?auto_11165 ?auto_11184 ) ) ( not ( = ?auto_11188 ?auto_11181 ) ) ( not ( = ?auto_11188 ?auto_11187 ) ) ( not ( = ?auto_11180 ?auto_11193 ) ) ( not ( = ?auto_11180 ?auto_11185 ) ) ( not ( = ?auto_11182 ?auto_11192 ) ) ( not ( = ?auto_11182 ?auto_11184 ) ) ( not ( = ?auto_11162 ?auto_11166 ) ) ( not ( = ?auto_11162 ?auto_11178 ) ) ( not ( = ?auto_11163 ?auto_11166 ) ) ( not ( = ?auto_11163 ?auto_11178 ) ) ( not ( = ?auto_11164 ?auto_11166 ) ) ( not ( = ?auto_11164 ?auto_11178 ) ) ( not ( = ?auto_11166 ?auto_11182 ) ) ( not ( = ?auto_11166 ?auto_11192 ) ) ( not ( = ?auto_11166 ?auto_11184 ) ) ( not ( = ?auto_11178 ?auto_11182 ) ) ( not ( = ?auto_11178 ?auto_11192 ) ) ( not ( = ?auto_11178 ?auto_11184 ) ) ( not ( = ?auto_11162 ?auto_11167 ) ) ( not ( = ?auto_11162 ?auto_11186 ) ) ( not ( = ?auto_11163 ?auto_11167 ) ) ( not ( = ?auto_11163 ?auto_11186 ) ) ( not ( = ?auto_11164 ?auto_11167 ) ) ( not ( = ?auto_11164 ?auto_11186 ) ) ( not ( = ?auto_11165 ?auto_11167 ) ) ( not ( = ?auto_11165 ?auto_11186 ) ) ( not ( = ?auto_11167 ?auto_11178 ) ) ( not ( = ?auto_11167 ?auto_11182 ) ) ( not ( = ?auto_11167 ?auto_11192 ) ) ( not ( = ?auto_11167 ?auto_11184 ) ) ( not ( = ?auto_11186 ?auto_11178 ) ) ( not ( = ?auto_11186 ?auto_11182 ) ) ( not ( = ?auto_11186 ?auto_11192 ) ) ( not ( = ?auto_11186 ?auto_11184 ) ) ( not ( = ?auto_11162 ?auto_11168 ) ) ( not ( = ?auto_11162 ?auto_11183 ) ) ( not ( = ?auto_11163 ?auto_11168 ) ) ( not ( = ?auto_11163 ?auto_11183 ) ) ( not ( = ?auto_11164 ?auto_11168 ) ) ( not ( = ?auto_11164 ?auto_11183 ) ) ( not ( = ?auto_11165 ?auto_11168 ) ) ( not ( = ?auto_11165 ?auto_11183 ) ) ( not ( = ?auto_11166 ?auto_11168 ) ) ( not ( = ?auto_11166 ?auto_11183 ) ) ( not ( = ?auto_11168 ?auto_11186 ) ) ( not ( = ?auto_11168 ?auto_11178 ) ) ( not ( = ?auto_11168 ?auto_11182 ) ) ( not ( = ?auto_11168 ?auto_11192 ) ) ( not ( = ?auto_11168 ?auto_11184 ) ) ( not ( = ?auto_11174 ?auto_11188 ) ) ( not ( = ?auto_11174 ?auto_11187 ) ) ( not ( = ?auto_11174 ?auto_11181 ) ) ( not ( = ?auto_11177 ?auto_11180 ) ) ( not ( = ?auto_11177 ?auto_11185 ) ) ( not ( = ?auto_11177 ?auto_11193 ) ) ( not ( = ?auto_11183 ?auto_11186 ) ) ( not ( = ?auto_11183 ?auto_11178 ) ) ( not ( = ?auto_11183 ?auto_11182 ) ) ( not ( = ?auto_11183 ?auto_11192 ) ) ( not ( = ?auto_11183 ?auto_11184 ) ) ( not ( = ?auto_11162 ?auto_11171 ) ) ( not ( = ?auto_11162 ?auto_11179 ) ) ( not ( = ?auto_11163 ?auto_11171 ) ) ( not ( = ?auto_11163 ?auto_11179 ) ) ( not ( = ?auto_11164 ?auto_11171 ) ) ( not ( = ?auto_11164 ?auto_11179 ) ) ( not ( = ?auto_11165 ?auto_11171 ) ) ( not ( = ?auto_11165 ?auto_11179 ) ) ( not ( = ?auto_11166 ?auto_11171 ) ) ( not ( = ?auto_11166 ?auto_11179 ) ) ( not ( = ?auto_11167 ?auto_11171 ) ) ( not ( = ?auto_11167 ?auto_11179 ) ) ( not ( = ?auto_11171 ?auto_11183 ) ) ( not ( = ?auto_11171 ?auto_11186 ) ) ( not ( = ?auto_11171 ?auto_11178 ) ) ( not ( = ?auto_11171 ?auto_11182 ) ) ( not ( = ?auto_11171 ?auto_11192 ) ) ( not ( = ?auto_11171 ?auto_11184 ) ) ( not ( = ?auto_11179 ?auto_11183 ) ) ( not ( = ?auto_11179 ?auto_11186 ) ) ( not ( = ?auto_11179 ?auto_11178 ) ) ( not ( = ?auto_11179 ?auto_11182 ) ) ( not ( = ?auto_11179 ?auto_11192 ) ) ( not ( = ?auto_11179 ?auto_11184 ) ) ( not ( = ?auto_11162 ?auto_11170 ) ) ( not ( = ?auto_11162 ?auto_11191 ) ) ( not ( = ?auto_11163 ?auto_11170 ) ) ( not ( = ?auto_11163 ?auto_11191 ) ) ( not ( = ?auto_11164 ?auto_11170 ) ) ( not ( = ?auto_11164 ?auto_11191 ) ) ( not ( = ?auto_11165 ?auto_11170 ) ) ( not ( = ?auto_11165 ?auto_11191 ) ) ( not ( = ?auto_11166 ?auto_11170 ) ) ( not ( = ?auto_11166 ?auto_11191 ) ) ( not ( = ?auto_11167 ?auto_11170 ) ) ( not ( = ?auto_11167 ?auto_11191 ) ) ( not ( = ?auto_11168 ?auto_11170 ) ) ( not ( = ?auto_11168 ?auto_11191 ) ) ( not ( = ?auto_11170 ?auto_11179 ) ) ( not ( = ?auto_11170 ?auto_11183 ) ) ( not ( = ?auto_11170 ?auto_11186 ) ) ( not ( = ?auto_11170 ?auto_11178 ) ) ( not ( = ?auto_11170 ?auto_11182 ) ) ( not ( = ?auto_11170 ?auto_11192 ) ) ( not ( = ?auto_11170 ?auto_11184 ) ) ( not ( = ?auto_11190 ?auto_11188 ) ) ( not ( = ?auto_11190 ?auto_11174 ) ) ( not ( = ?auto_11190 ?auto_11187 ) ) ( not ( = ?auto_11190 ?auto_11181 ) ) ( not ( = ?auto_11189 ?auto_11180 ) ) ( not ( = ?auto_11189 ?auto_11177 ) ) ( not ( = ?auto_11189 ?auto_11185 ) ) ( not ( = ?auto_11189 ?auto_11193 ) ) ( not ( = ?auto_11191 ?auto_11179 ) ) ( not ( = ?auto_11191 ?auto_11183 ) ) ( not ( = ?auto_11191 ?auto_11186 ) ) ( not ( = ?auto_11191 ?auto_11178 ) ) ( not ( = ?auto_11191 ?auto_11182 ) ) ( not ( = ?auto_11191 ?auto_11192 ) ) ( not ( = ?auto_11191 ?auto_11184 ) ) ( not ( = ?auto_11162 ?auto_11169 ) ) ( not ( = ?auto_11162 ?auto_11172 ) ) ( not ( = ?auto_11163 ?auto_11169 ) ) ( not ( = ?auto_11163 ?auto_11172 ) ) ( not ( = ?auto_11164 ?auto_11169 ) ) ( not ( = ?auto_11164 ?auto_11172 ) ) ( not ( = ?auto_11165 ?auto_11169 ) ) ( not ( = ?auto_11165 ?auto_11172 ) ) ( not ( = ?auto_11166 ?auto_11169 ) ) ( not ( = ?auto_11166 ?auto_11172 ) ) ( not ( = ?auto_11167 ?auto_11169 ) ) ( not ( = ?auto_11167 ?auto_11172 ) ) ( not ( = ?auto_11168 ?auto_11169 ) ) ( not ( = ?auto_11168 ?auto_11172 ) ) ( not ( = ?auto_11171 ?auto_11169 ) ) ( not ( = ?auto_11171 ?auto_11172 ) ) ( not ( = ?auto_11169 ?auto_11191 ) ) ( not ( = ?auto_11169 ?auto_11179 ) ) ( not ( = ?auto_11169 ?auto_11183 ) ) ( not ( = ?auto_11169 ?auto_11186 ) ) ( not ( = ?auto_11169 ?auto_11178 ) ) ( not ( = ?auto_11169 ?auto_11182 ) ) ( not ( = ?auto_11169 ?auto_11192 ) ) ( not ( = ?auto_11169 ?auto_11184 ) ) ( not ( = ?auto_11172 ?auto_11191 ) ) ( not ( = ?auto_11172 ?auto_11179 ) ) ( not ( = ?auto_11172 ?auto_11183 ) ) ( not ( = ?auto_11172 ?auto_11186 ) ) ( not ( = ?auto_11172 ?auto_11178 ) ) ( not ( = ?auto_11172 ?auto_11182 ) ) ( not ( = ?auto_11172 ?auto_11192 ) ) ( not ( = ?auto_11172 ?auto_11184 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_11162 ?auto_11163 ?auto_11164 ?auto_11165 ?auto_11166 ?auto_11167 ?auto_11168 ?auto_11171 ?auto_11170 )
      ( MAKE-1CRATE ?auto_11170 ?auto_11169 )
      ( MAKE-9CRATE-VERIFY ?auto_11162 ?auto_11163 ?auto_11164 ?auto_11165 ?auto_11166 ?auto_11167 ?auto_11168 ?auto_11171 ?auto_11170 ?auto_11169 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11196 - SURFACE
      ?auto_11197 - SURFACE
    )
    :vars
    (
      ?auto_11198 - HOIST
      ?auto_11199 - PLACE
      ?auto_11201 - PLACE
      ?auto_11202 - HOIST
      ?auto_11203 - SURFACE
      ?auto_11200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11198 ?auto_11199 ) ( SURFACE-AT ?auto_11196 ?auto_11199 ) ( CLEAR ?auto_11196 ) ( IS-CRATE ?auto_11197 ) ( AVAILABLE ?auto_11198 ) ( not ( = ?auto_11201 ?auto_11199 ) ) ( HOIST-AT ?auto_11202 ?auto_11201 ) ( AVAILABLE ?auto_11202 ) ( SURFACE-AT ?auto_11197 ?auto_11201 ) ( ON ?auto_11197 ?auto_11203 ) ( CLEAR ?auto_11197 ) ( TRUCK-AT ?auto_11200 ?auto_11199 ) ( not ( = ?auto_11196 ?auto_11197 ) ) ( not ( = ?auto_11196 ?auto_11203 ) ) ( not ( = ?auto_11197 ?auto_11203 ) ) ( not ( = ?auto_11198 ?auto_11202 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11200 ?auto_11199 ?auto_11201 )
      ( !LIFT ?auto_11202 ?auto_11197 ?auto_11203 ?auto_11201 )
      ( !LOAD ?auto_11202 ?auto_11197 ?auto_11200 ?auto_11201 )
      ( !DRIVE ?auto_11200 ?auto_11201 ?auto_11199 )
      ( !UNLOAD ?auto_11198 ?auto_11197 ?auto_11200 ?auto_11199 )
      ( !DROP ?auto_11198 ?auto_11197 ?auto_11196 ?auto_11199 )
      ( MAKE-1CRATE-VERIFY ?auto_11196 ?auto_11197 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_11215 - SURFACE
      ?auto_11216 - SURFACE
      ?auto_11217 - SURFACE
      ?auto_11218 - SURFACE
      ?auto_11219 - SURFACE
      ?auto_11220 - SURFACE
      ?auto_11221 - SURFACE
      ?auto_11224 - SURFACE
      ?auto_11223 - SURFACE
      ?auto_11222 - SURFACE
      ?auto_11225 - SURFACE
    )
    :vars
    (
      ?auto_11228 - HOIST
      ?auto_11229 - PLACE
      ?auto_11227 - PLACE
      ?auto_11231 - HOIST
      ?auto_11226 - SURFACE
      ?auto_11232 - SURFACE
      ?auto_11238 - PLACE
      ?auto_11236 - HOIST
      ?auto_11234 - SURFACE
      ?auto_11240 - PLACE
      ?auto_11239 - HOIST
      ?auto_11246 - SURFACE
      ?auto_11244 - SURFACE
      ?auto_11247 - SURFACE
      ?auto_11233 - PLACE
      ?auto_11235 - HOIST
      ?auto_11248 - SURFACE
      ?auto_11245 - SURFACE
      ?auto_11241 - PLACE
      ?auto_11237 - HOIST
      ?auto_11242 - SURFACE
      ?auto_11243 - SURFACE
      ?auto_11230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11228 ?auto_11229 ) ( IS-CRATE ?auto_11225 ) ( not ( = ?auto_11227 ?auto_11229 ) ) ( HOIST-AT ?auto_11231 ?auto_11227 ) ( SURFACE-AT ?auto_11225 ?auto_11227 ) ( ON ?auto_11225 ?auto_11226 ) ( CLEAR ?auto_11225 ) ( not ( = ?auto_11222 ?auto_11225 ) ) ( not ( = ?auto_11222 ?auto_11226 ) ) ( not ( = ?auto_11225 ?auto_11226 ) ) ( not ( = ?auto_11228 ?auto_11231 ) ) ( IS-CRATE ?auto_11222 ) ( SURFACE-AT ?auto_11222 ?auto_11227 ) ( ON ?auto_11222 ?auto_11232 ) ( CLEAR ?auto_11222 ) ( not ( = ?auto_11223 ?auto_11222 ) ) ( not ( = ?auto_11223 ?auto_11232 ) ) ( not ( = ?auto_11222 ?auto_11232 ) ) ( IS-CRATE ?auto_11223 ) ( not ( = ?auto_11238 ?auto_11229 ) ) ( HOIST-AT ?auto_11236 ?auto_11238 ) ( AVAILABLE ?auto_11236 ) ( SURFACE-AT ?auto_11223 ?auto_11238 ) ( ON ?auto_11223 ?auto_11234 ) ( CLEAR ?auto_11223 ) ( not ( = ?auto_11224 ?auto_11223 ) ) ( not ( = ?auto_11224 ?auto_11234 ) ) ( not ( = ?auto_11223 ?auto_11234 ) ) ( not ( = ?auto_11228 ?auto_11236 ) ) ( IS-CRATE ?auto_11224 ) ( not ( = ?auto_11240 ?auto_11229 ) ) ( HOIST-AT ?auto_11239 ?auto_11240 ) ( SURFACE-AT ?auto_11224 ?auto_11240 ) ( ON ?auto_11224 ?auto_11246 ) ( CLEAR ?auto_11224 ) ( not ( = ?auto_11221 ?auto_11224 ) ) ( not ( = ?auto_11221 ?auto_11246 ) ) ( not ( = ?auto_11224 ?auto_11246 ) ) ( not ( = ?auto_11228 ?auto_11239 ) ) ( IS-CRATE ?auto_11221 ) ( AVAILABLE ?auto_11231 ) ( SURFACE-AT ?auto_11221 ?auto_11227 ) ( ON ?auto_11221 ?auto_11244 ) ( CLEAR ?auto_11221 ) ( not ( = ?auto_11220 ?auto_11221 ) ) ( not ( = ?auto_11220 ?auto_11244 ) ) ( not ( = ?auto_11221 ?auto_11244 ) ) ( IS-CRATE ?auto_11220 ) ( SURFACE-AT ?auto_11220 ?auto_11240 ) ( ON ?auto_11220 ?auto_11247 ) ( CLEAR ?auto_11220 ) ( not ( = ?auto_11219 ?auto_11220 ) ) ( not ( = ?auto_11219 ?auto_11247 ) ) ( not ( = ?auto_11220 ?auto_11247 ) ) ( IS-CRATE ?auto_11219 ) ( not ( = ?auto_11233 ?auto_11229 ) ) ( HOIST-AT ?auto_11235 ?auto_11233 ) ( SURFACE-AT ?auto_11219 ?auto_11233 ) ( ON ?auto_11219 ?auto_11248 ) ( CLEAR ?auto_11219 ) ( not ( = ?auto_11218 ?auto_11219 ) ) ( not ( = ?auto_11218 ?auto_11248 ) ) ( not ( = ?auto_11219 ?auto_11248 ) ) ( not ( = ?auto_11228 ?auto_11235 ) ) ( IS-CRATE ?auto_11218 ) ( AVAILABLE ?auto_11239 ) ( SURFACE-AT ?auto_11218 ?auto_11240 ) ( ON ?auto_11218 ?auto_11245 ) ( CLEAR ?auto_11218 ) ( not ( = ?auto_11217 ?auto_11218 ) ) ( not ( = ?auto_11217 ?auto_11245 ) ) ( not ( = ?auto_11218 ?auto_11245 ) ) ( IS-CRATE ?auto_11217 ) ( not ( = ?auto_11241 ?auto_11229 ) ) ( HOIST-AT ?auto_11237 ?auto_11241 ) ( AVAILABLE ?auto_11237 ) ( SURFACE-AT ?auto_11217 ?auto_11241 ) ( ON ?auto_11217 ?auto_11242 ) ( CLEAR ?auto_11217 ) ( not ( = ?auto_11216 ?auto_11217 ) ) ( not ( = ?auto_11216 ?auto_11242 ) ) ( not ( = ?auto_11217 ?auto_11242 ) ) ( not ( = ?auto_11228 ?auto_11237 ) ) ( SURFACE-AT ?auto_11215 ?auto_11229 ) ( CLEAR ?auto_11215 ) ( IS-CRATE ?auto_11216 ) ( AVAILABLE ?auto_11228 ) ( AVAILABLE ?auto_11235 ) ( SURFACE-AT ?auto_11216 ?auto_11233 ) ( ON ?auto_11216 ?auto_11243 ) ( CLEAR ?auto_11216 ) ( TRUCK-AT ?auto_11230 ?auto_11229 ) ( not ( = ?auto_11215 ?auto_11216 ) ) ( not ( = ?auto_11215 ?auto_11243 ) ) ( not ( = ?auto_11216 ?auto_11243 ) ) ( not ( = ?auto_11215 ?auto_11217 ) ) ( not ( = ?auto_11215 ?auto_11242 ) ) ( not ( = ?auto_11217 ?auto_11243 ) ) ( not ( = ?auto_11241 ?auto_11233 ) ) ( not ( = ?auto_11237 ?auto_11235 ) ) ( not ( = ?auto_11242 ?auto_11243 ) ) ( not ( = ?auto_11215 ?auto_11218 ) ) ( not ( = ?auto_11215 ?auto_11245 ) ) ( not ( = ?auto_11216 ?auto_11218 ) ) ( not ( = ?auto_11216 ?auto_11245 ) ) ( not ( = ?auto_11218 ?auto_11242 ) ) ( not ( = ?auto_11218 ?auto_11243 ) ) ( not ( = ?auto_11240 ?auto_11241 ) ) ( not ( = ?auto_11240 ?auto_11233 ) ) ( not ( = ?auto_11239 ?auto_11237 ) ) ( not ( = ?auto_11239 ?auto_11235 ) ) ( not ( = ?auto_11245 ?auto_11242 ) ) ( not ( = ?auto_11245 ?auto_11243 ) ) ( not ( = ?auto_11215 ?auto_11219 ) ) ( not ( = ?auto_11215 ?auto_11248 ) ) ( not ( = ?auto_11216 ?auto_11219 ) ) ( not ( = ?auto_11216 ?auto_11248 ) ) ( not ( = ?auto_11217 ?auto_11219 ) ) ( not ( = ?auto_11217 ?auto_11248 ) ) ( not ( = ?auto_11219 ?auto_11245 ) ) ( not ( = ?auto_11219 ?auto_11242 ) ) ( not ( = ?auto_11219 ?auto_11243 ) ) ( not ( = ?auto_11248 ?auto_11245 ) ) ( not ( = ?auto_11248 ?auto_11242 ) ) ( not ( = ?auto_11248 ?auto_11243 ) ) ( not ( = ?auto_11215 ?auto_11220 ) ) ( not ( = ?auto_11215 ?auto_11247 ) ) ( not ( = ?auto_11216 ?auto_11220 ) ) ( not ( = ?auto_11216 ?auto_11247 ) ) ( not ( = ?auto_11217 ?auto_11220 ) ) ( not ( = ?auto_11217 ?auto_11247 ) ) ( not ( = ?auto_11218 ?auto_11220 ) ) ( not ( = ?auto_11218 ?auto_11247 ) ) ( not ( = ?auto_11220 ?auto_11248 ) ) ( not ( = ?auto_11220 ?auto_11245 ) ) ( not ( = ?auto_11220 ?auto_11242 ) ) ( not ( = ?auto_11220 ?auto_11243 ) ) ( not ( = ?auto_11247 ?auto_11248 ) ) ( not ( = ?auto_11247 ?auto_11245 ) ) ( not ( = ?auto_11247 ?auto_11242 ) ) ( not ( = ?auto_11247 ?auto_11243 ) ) ( not ( = ?auto_11215 ?auto_11221 ) ) ( not ( = ?auto_11215 ?auto_11244 ) ) ( not ( = ?auto_11216 ?auto_11221 ) ) ( not ( = ?auto_11216 ?auto_11244 ) ) ( not ( = ?auto_11217 ?auto_11221 ) ) ( not ( = ?auto_11217 ?auto_11244 ) ) ( not ( = ?auto_11218 ?auto_11221 ) ) ( not ( = ?auto_11218 ?auto_11244 ) ) ( not ( = ?auto_11219 ?auto_11221 ) ) ( not ( = ?auto_11219 ?auto_11244 ) ) ( not ( = ?auto_11221 ?auto_11247 ) ) ( not ( = ?auto_11221 ?auto_11248 ) ) ( not ( = ?auto_11221 ?auto_11245 ) ) ( not ( = ?auto_11221 ?auto_11242 ) ) ( not ( = ?auto_11221 ?auto_11243 ) ) ( not ( = ?auto_11227 ?auto_11240 ) ) ( not ( = ?auto_11227 ?auto_11233 ) ) ( not ( = ?auto_11227 ?auto_11241 ) ) ( not ( = ?auto_11231 ?auto_11239 ) ) ( not ( = ?auto_11231 ?auto_11235 ) ) ( not ( = ?auto_11231 ?auto_11237 ) ) ( not ( = ?auto_11244 ?auto_11247 ) ) ( not ( = ?auto_11244 ?auto_11248 ) ) ( not ( = ?auto_11244 ?auto_11245 ) ) ( not ( = ?auto_11244 ?auto_11242 ) ) ( not ( = ?auto_11244 ?auto_11243 ) ) ( not ( = ?auto_11215 ?auto_11224 ) ) ( not ( = ?auto_11215 ?auto_11246 ) ) ( not ( = ?auto_11216 ?auto_11224 ) ) ( not ( = ?auto_11216 ?auto_11246 ) ) ( not ( = ?auto_11217 ?auto_11224 ) ) ( not ( = ?auto_11217 ?auto_11246 ) ) ( not ( = ?auto_11218 ?auto_11224 ) ) ( not ( = ?auto_11218 ?auto_11246 ) ) ( not ( = ?auto_11219 ?auto_11224 ) ) ( not ( = ?auto_11219 ?auto_11246 ) ) ( not ( = ?auto_11220 ?auto_11224 ) ) ( not ( = ?auto_11220 ?auto_11246 ) ) ( not ( = ?auto_11224 ?auto_11244 ) ) ( not ( = ?auto_11224 ?auto_11247 ) ) ( not ( = ?auto_11224 ?auto_11248 ) ) ( not ( = ?auto_11224 ?auto_11245 ) ) ( not ( = ?auto_11224 ?auto_11242 ) ) ( not ( = ?auto_11224 ?auto_11243 ) ) ( not ( = ?auto_11246 ?auto_11244 ) ) ( not ( = ?auto_11246 ?auto_11247 ) ) ( not ( = ?auto_11246 ?auto_11248 ) ) ( not ( = ?auto_11246 ?auto_11245 ) ) ( not ( = ?auto_11246 ?auto_11242 ) ) ( not ( = ?auto_11246 ?auto_11243 ) ) ( not ( = ?auto_11215 ?auto_11223 ) ) ( not ( = ?auto_11215 ?auto_11234 ) ) ( not ( = ?auto_11216 ?auto_11223 ) ) ( not ( = ?auto_11216 ?auto_11234 ) ) ( not ( = ?auto_11217 ?auto_11223 ) ) ( not ( = ?auto_11217 ?auto_11234 ) ) ( not ( = ?auto_11218 ?auto_11223 ) ) ( not ( = ?auto_11218 ?auto_11234 ) ) ( not ( = ?auto_11219 ?auto_11223 ) ) ( not ( = ?auto_11219 ?auto_11234 ) ) ( not ( = ?auto_11220 ?auto_11223 ) ) ( not ( = ?auto_11220 ?auto_11234 ) ) ( not ( = ?auto_11221 ?auto_11223 ) ) ( not ( = ?auto_11221 ?auto_11234 ) ) ( not ( = ?auto_11223 ?auto_11246 ) ) ( not ( = ?auto_11223 ?auto_11244 ) ) ( not ( = ?auto_11223 ?auto_11247 ) ) ( not ( = ?auto_11223 ?auto_11248 ) ) ( not ( = ?auto_11223 ?auto_11245 ) ) ( not ( = ?auto_11223 ?auto_11242 ) ) ( not ( = ?auto_11223 ?auto_11243 ) ) ( not ( = ?auto_11238 ?auto_11240 ) ) ( not ( = ?auto_11238 ?auto_11227 ) ) ( not ( = ?auto_11238 ?auto_11233 ) ) ( not ( = ?auto_11238 ?auto_11241 ) ) ( not ( = ?auto_11236 ?auto_11239 ) ) ( not ( = ?auto_11236 ?auto_11231 ) ) ( not ( = ?auto_11236 ?auto_11235 ) ) ( not ( = ?auto_11236 ?auto_11237 ) ) ( not ( = ?auto_11234 ?auto_11246 ) ) ( not ( = ?auto_11234 ?auto_11244 ) ) ( not ( = ?auto_11234 ?auto_11247 ) ) ( not ( = ?auto_11234 ?auto_11248 ) ) ( not ( = ?auto_11234 ?auto_11245 ) ) ( not ( = ?auto_11234 ?auto_11242 ) ) ( not ( = ?auto_11234 ?auto_11243 ) ) ( not ( = ?auto_11215 ?auto_11222 ) ) ( not ( = ?auto_11215 ?auto_11232 ) ) ( not ( = ?auto_11216 ?auto_11222 ) ) ( not ( = ?auto_11216 ?auto_11232 ) ) ( not ( = ?auto_11217 ?auto_11222 ) ) ( not ( = ?auto_11217 ?auto_11232 ) ) ( not ( = ?auto_11218 ?auto_11222 ) ) ( not ( = ?auto_11218 ?auto_11232 ) ) ( not ( = ?auto_11219 ?auto_11222 ) ) ( not ( = ?auto_11219 ?auto_11232 ) ) ( not ( = ?auto_11220 ?auto_11222 ) ) ( not ( = ?auto_11220 ?auto_11232 ) ) ( not ( = ?auto_11221 ?auto_11222 ) ) ( not ( = ?auto_11221 ?auto_11232 ) ) ( not ( = ?auto_11224 ?auto_11222 ) ) ( not ( = ?auto_11224 ?auto_11232 ) ) ( not ( = ?auto_11222 ?auto_11234 ) ) ( not ( = ?auto_11222 ?auto_11246 ) ) ( not ( = ?auto_11222 ?auto_11244 ) ) ( not ( = ?auto_11222 ?auto_11247 ) ) ( not ( = ?auto_11222 ?auto_11248 ) ) ( not ( = ?auto_11222 ?auto_11245 ) ) ( not ( = ?auto_11222 ?auto_11242 ) ) ( not ( = ?auto_11222 ?auto_11243 ) ) ( not ( = ?auto_11232 ?auto_11234 ) ) ( not ( = ?auto_11232 ?auto_11246 ) ) ( not ( = ?auto_11232 ?auto_11244 ) ) ( not ( = ?auto_11232 ?auto_11247 ) ) ( not ( = ?auto_11232 ?auto_11248 ) ) ( not ( = ?auto_11232 ?auto_11245 ) ) ( not ( = ?auto_11232 ?auto_11242 ) ) ( not ( = ?auto_11232 ?auto_11243 ) ) ( not ( = ?auto_11215 ?auto_11225 ) ) ( not ( = ?auto_11215 ?auto_11226 ) ) ( not ( = ?auto_11216 ?auto_11225 ) ) ( not ( = ?auto_11216 ?auto_11226 ) ) ( not ( = ?auto_11217 ?auto_11225 ) ) ( not ( = ?auto_11217 ?auto_11226 ) ) ( not ( = ?auto_11218 ?auto_11225 ) ) ( not ( = ?auto_11218 ?auto_11226 ) ) ( not ( = ?auto_11219 ?auto_11225 ) ) ( not ( = ?auto_11219 ?auto_11226 ) ) ( not ( = ?auto_11220 ?auto_11225 ) ) ( not ( = ?auto_11220 ?auto_11226 ) ) ( not ( = ?auto_11221 ?auto_11225 ) ) ( not ( = ?auto_11221 ?auto_11226 ) ) ( not ( = ?auto_11224 ?auto_11225 ) ) ( not ( = ?auto_11224 ?auto_11226 ) ) ( not ( = ?auto_11223 ?auto_11225 ) ) ( not ( = ?auto_11223 ?auto_11226 ) ) ( not ( = ?auto_11225 ?auto_11232 ) ) ( not ( = ?auto_11225 ?auto_11234 ) ) ( not ( = ?auto_11225 ?auto_11246 ) ) ( not ( = ?auto_11225 ?auto_11244 ) ) ( not ( = ?auto_11225 ?auto_11247 ) ) ( not ( = ?auto_11225 ?auto_11248 ) ) ( not ( = ?auto_11225 ?auto_11245 ) ) ( not ( = ?auto_11225 ?auto_11242 ) ) ( not ( = ?auto_11225 ?auto_11243 ) ) ( not ( = ?auto_11226 ?auto_11232 ) ) ( not ( = ?auto_11226 ?auto_11234 ) ) ( not ( = ?auto_11226 ?auto_11246 ) ) ( not ( = ?auto_11226 ?auto_11244 ) ) ( not ( = ?auto_11226 ?auto_11247 ) ) ( not ( = ?auto_11226 ?auto_11248 ) ) ( not ( = ?auto_11226 ?auto_11245 ) ) ( not ( = ?auto_11226 ?auto_11242 ) ) ( not ( = ?auto_11226 ?auto_11243 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_11215 ?auto_11216 ?auto_11217 ?auto_11218 ?auto_11219 ?auto_11220 ?auto_11221 ?auto_11224 ?auto_11223 ?auto_11222 )
      ( MAKE-1CRATE ?auto_11222 ?auto_11225 )
      ( MAKE-10CRATE-VERIFY ?auto_11215 ?auto_11216 ?auto_11217 ?auto_11218 ?auto_11219 ?auto_11220 ?auto_11221 ?auto_11224 ?auto_11223 ?auto_11222 ?auto_11225 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11251 - SURFACE
      ?auto_11252 - SURFACE
    )
    :vars
    (
      ?auto_11253 - HOIST
      ?auto_11254 - PLACE
      ?auto_11256 - PLACE
      ?auto_11257 - HOIST
      ?auto_11258 - SURFACE
      ?auto_11255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11253 ?auto_11254 ) ( SURFACE-AT ?auto_11251 ?auto_11254 ) ( CLEAR ?auto_11251 ) ( IS-CRATE ?auto_11252 ) ( AVAILABLE ?auto_11253 ) ( not ( = ?auto_11256 ?auto_11254 ) ) ( HOIST-AT ?auto_11257 ?auto_11256 ) ( AVAILABLE ?auto_11257 ) ( SURFACE-AT ?auto_11252 ?auto_11256 ) ( ON ?auto_11252 ?auto_11258 ) ( CLEAR ?auto_11252 ) ( TRUCK-AT ?auto_11255 ?auto_11254 ) ( not ( = ?auto_11251 ?auto_11252 ) ) ( not ( = ?auto_11251 ?auto_11258 ) ) ( not ( = ?auto_11252 ?auto_11258 ) ) ( not ( = ?auto_11253 ?auto_11257 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11255 ?auto_11254 ?auto_11256 )
      ( !LIFT ?auto_11257 ?auto_11252 ?auto_11258 ?auto_11256 )
      ( !LOAD ?auto_11257 ?auto_11252 ?auto_11255 ?auto_11256 )
      ( !DRIVE ?auto_11255 ?auto_11256 ?auto_11254 )
      ( !UNLOAD ?auto_11253 ?auto_11252 ?auto_11255 ?auto_11254 )
      ( !DROP ?auto_11253 ?auto_11252 ?auto_11251 ?auto_11254 )
      ( MAKE-1CRATE-VERIFY ?auto_11251 ?auto_11252 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_11271 - SURFACE
      ?auto_11272 - SURFACE
      ?auto_11273 - SURFACE
      ?auto_11274 - SURFACE
      ?auto_11275 - SURFACE
      ?auto_11276 - SURFACE
      ?auto_11277 - SURFACE
      ?auto_11280 - SURFACE
      ?auto_11279 - SURFACE
      ?auto_11278 - SURFACE
      ?auto_11281 - SURFACE
      ?auto_11282 - SURFACE
    )
    :vars
    (
      ?auto_11285 - HOIST
      ?auto_11283 - PLACE
      ?auto_11287 - PLACE
      ?auto_11284 - HOIST
      ?auto_11288 - SURFACE
      ?auto_11299 - PLACE
      ?auto_11289 - HOIST
      ?auto_11307 - SURFACE
      ?auto_11290 - SURFACE
      ?auto_11302 - PLACE
      ?auto_11295 - HOIST
      ?auto_11293 - SURFACE
      ?auto_11305 - PLACE
      ?auto_11296 - HOIST
      ?auto_11308 - SURFACE
      ?auto_11297 - SURFACE
      ?auto_11304 - SURFACE
      ?auto_11301 - PLACE
      ?auto_11291 - HOIST
      ?auto_11292 - SURFACE
      ?auto_11303 - SURFACE
      ?auto_11300 - PLACE
      ?auto_11306 - HOIST
      ?auto_11298 - SURFACE
      ?auto_11294 - SURFACE
      ?auto_11286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11285 ?auto_11283 ) ( IS-CRATE ?auto_11282 ) ( not ( = ?auto_11287 ?auto_11283 ) ) ( HOIST-AT ?auto_11284 ?auto_11287 ) ( AVAILABLE ?auto_11284 ) ( SURFACE-AT ?auto_11282 ?auto_11287 ) ( ON ?auto_11282 ?auto_11288 ) ( CLEAR ?auto_11282 ) ( not ( = ?auto_11281 ?auto_11282 ) ) ( not ( = ?auto_11281 ?auto_11288 ) ) ( not ( = ?auto_11282 ?auto_11288 ) ) ( not ( = ?auto_11285 ?auto_11284 ) ) ( IS-CRATE ?auto_11281 ) ( not ( = ?auto_11299 ?auto_11283 ) ) ( HOIST-AT ?auto_11289 ?auto_11299 ) ( SURFACE-AT ?auto_11281 ?auto_11299 ) ( ON ?auto_11281 ?auto_11307 ) ( CLEAR ?auto_11281 ) ( not ( = ?auto_11278 ?auto_11281 ) ) ( not ( = ?auto_11278 ?auto_11307 ) ) ( not ( = ?auto_11281 ?auto_11307 ) ) ( not ( = ?auto_11285 ?auto_11289 ) ) ( IS-CRATE ?auto_11278 ) ( SURFACE-AT ?auto_11278 ?auto_11299 ) ( ON ?auto_11278 ?auto_11290 ) ( CLEAR ?auto_11278 ) ( not ( = ?auto_11279 ?auto_11278 ) ) ( not ( = ?auto_11279 ?auto_11290 ) ) ( not ( = ?auto_11278 ?auto_11290 ) ) ( IS-CRATE ?auto_11279 ) ( not ( = ?auto_11302 ?auto_11283 ) ) ( HOIST-AT ?auto_11295 ?auto_11302 ) ( AVAILABLE ?auto_11295 ) ( SURFACE-AT ?auto_11279 ?auto_11302 ) ( ON ?auto_11279 ?auto_11293 ) ( CLEAR ?auto_11279 ) ( not ( = ?auto_11280 ?auto_11279 ) ) ( not ( = ?auto_11280 ?auto_11293 ) ) ( not ( = ?auto_11279 ?auto_11293 ) ) ( not ( = ?auto_11285 ?auto_11295 ) ) ( IS-CRATE ?auto_11280 ) ( not ( = ?auto_11305 ?auto_11283 ) ) ( HOIST-AT ?auto_11296 ?auto_11305 ) ( SURFACE-AT ?auto_11280 ?auto_11305 ) ( ON ?auto_11280 ?auto_11308 ) ( CLEAR ?auto_11280 ) ( not ( = ?auto_11277 ?auto_11280 ) ) ( not ( = ?auto_11277 ?auto_11308 ) ) ( not ( = ?auto_11280 ?auto_11308 ) ) ( not ( = ?auto_11285 ?auto_11296 ) ) ( IS-CRATE ?auto_11277 ) ( AVAILABLE ?auto_11289 ) ( SURFACE-AT ?auto_11277 ?auto_11299 ) ( ON ?auto_11277 ?auto_11297 ) ( CLEAR ?auto_11277 ) ( not ( = ?auto_11276 ?auto_11277 ) ) ( not ( = ?auto_11276 ?auto_11297 ) ) ( not ( = ?auto_11277 ?auto_11297 ) ) ( IS-CRATE ?auto_11276 ) ( SURFACE-AT ?auto_11276 ?auto_11305 ) ( ON ?auto_11276 ?auto_11304 ) ( CLEAR ?auto_11276 ) ( not ( = ?auto_11275 ?auto_11276 ) ) ( not ( = ?auto_11275 ?auto_11304 ) ) ( not ( = ?auto_11276 ?auto_11304 ) ) ( IS-CRATE ?auto_11275 ) ( not ( = ?auto_11301 ?auto_11283 ) ) ( HOIST-AT ?auto_11291 ?auto_11301 ) ( SURFACE-AT ?auto_11275 ?auto_11301 ) ( ON ?auto_11275 ?auto_11292 ) ( CLEAR ?auto_11275 ) ( not ( = ?auto_11274 ?auto_11275 ) ) ( not ( = ?auto_11274 ?auto_11292 ) ) ( not ( = ?auto_11275 ?auto_11292 ) ) ( not ( = ?auto_11285 ?auto_11291 ) ) ( IS-CRATE ?auto_11274 ) ( AVAILABLE ?auto_11296 ) ( SURFACE-AT ?auto_11274 ?auto_11305 ) ( ON ?auto_11274 ?auto_11303 ) ( CLEAR ?auto_11274 ) ( not ( = ?auto_11273 ?auto_11274 ) ) ( not ( = ?auto_11273 ?auto_11303 ) ) ( not ( = ?auto_11274 ?auto_11303 ) ) ( IS-CRATE ?auto_11273 ) ( not ( = ?auto_11300 ?auto_11283 ) ) ( HOIST-AT ?auto_11306 ?auto_11300 ) ( AVAILABLE ?auto_11306 ) ( SURFACE-AT ?auto_11273 ?auto_11300 ) ( ON ?auto_11273 ?auto_11298 ) ( CLEAR ?auto_11273 ) ( not ( = ?auto_11272 ?auto_11273 ) ) ( not ( = ?auto_11272 ?auto_11298 ) ) ( not ( = ?auto_11273 ?auto_11298 ) ) ( not ( = ?auto_11285 ?auto_11306 ) ) ( SURFACE-AT ?auto_11271 ?auto_11283 ) ( CLEAR ?auto_11271 ) ( IS-CRATE ?auto_11272 ) ( AVAILABLE ?auto_11285 ) ( AVAILABLE ?auto_11291 ) ( SURFACE-AT ?auto_11272 ?auto_11301 ) ( ON ?auto_11272 ?auto_11294 ) ( CLEAR ?auto_11272 ) ( TRUCK-AT ?auto_11286 ?auto_11283 ) ( not ( = ?auto_11271 ?auto_11272 ) ) ( not ( = ?auto_11271 ?auto_11294 ) ) ( not ( = ?auto_11272 ?auto_11294 ) ) ( not ( = ?auto_11271 ?auto_11273 ) ) ( not ( = ?auto_11271 ?auto_11298 ) ) ( not ( = ?auto_11273 ?auto_11294 ) ) ( not ( = ?auto_11300 ?auto_11301 ) ) ( not ( = ?auto_11306 ?auto_11291 ) ) ( not ( = ?auto_11298 ?auto_11294 ) ) ( not ( = ?auto_11271 ?auto_11274 ) ) ( not ( = ?auto_11271 ?auto_11303 ) ) ( not ( = ?auto_11272 ?auto_11274 ) ) ( not ( = ?auto_11272 ?auto_11303 ) ) ( not ( = ?auto_11274 ?auto_11298 ) ) ( not ( = ?auto_11274 ?auto_11294 ) ) ( not ( = ?auto_11305 ?auto_11300 ) ) ( not ( = ?auto_11305 ?auto_11301 ) ) ( not ( = ?auto_11296 ?auto_11306 ) ) ( not ( = ?auto_11296 ?auto_11291 ) ) ( not ( = ?auto_11303 ?auto_11298 ) ) ( not ( = ?auto_11303 ?auto_11294 ) ) ( not ( = ?auto_11271 ?auto_11275 ) ) ( not ( = ?auto_11271 ?auto_11292 ) ) ( not ( = ?auto_11272 ?auto_11275 ) ) ( not ( = ?auto_11272 ?auto_11292 ) ) ( not ( = ?auto_11273 ?auto_11275 ) ) ( not ( = ?auto_11273 ?auto_11292 ) ) ( not ( = ?auto_11275 ?auto_11303 ) ) ( not ( = ?auto_11275 ?auto_11298 ) ) ( not ( = ?auto_11275 ?auto_11294 ) ) ( not ( = ?auto_11292 ?auto_11303 ) ) ( not ( = ?auto_11292 ?auto_11298 ) ) ( not ( = ?auto_11292 ?auto_11294 ) ) ( not ( = ?auto_11271 ?auto_11276 ) ) ( not ( = ?auto_11271 ?auto_11304 ) ) ( not ( = ?auto_11272 ?auto_11276 ) ) ( not ( = ?auto_11272 ?auto_11304 ) ) ( not ( = ?auto_11273 ?auto_11276 ) ) ( not ( = ?auto_11273 ?auto_11304 ) ) ( not ( = ?auto_11274 ?auto_11276 ) ) ( not ( = ?auto_11274 ?auto_11304 ) ) ( not ( = ?auto_11276 ?auto_11292 ) ) ( not ( = ?auto_11276 ?auto_11303 ) ) ( not ( = ?auto_11276 ?auto_11298 ) ) ( not ( = ?auto_11276 ?auto_11294 ) ) ( not ( = ?auto_11304 ?auto_11292 ) ) ( not ( = ?auto_11304 ?auto_11303 ) ) ( not ( = ?auto_11304 ?auto_11298 ) ) ( not ( = ?auto_11304 ?auto_11294 ) ) ( not ( = ?auto_11271 ?auto_11277 ) ) ( not ( = ?auto_11271 ?auto_11297 ) ) ( not ( = ?auto_11272 ?auto_11277 ) ) ( not ( = ?auto_11272 ?auto_11297 ) ) ( not ( = ?auto_11273 ?auto_11277 ) ) ( not ( = ?auto_11273 ?auto_11297 ) ) ( not ( = ?auto_11274 ?auto_11277 ) ) ( not ( = ?auto_11274 ?auto_11297 ) ) ( not ( = ?auto_11275 ?auto_11277 ) ) ( not ( = ?auto_11275 ?auto_11297 ) ) ( not ( = ?auto_11277 ?auto_11304 ) ) ( not ( = ?auto_11277 ?auto_11292 ) ) ( not ( = ?auto_11277 ?auto_11303 ) ) ( not ( = ?auto_11277 ?auto_11298 ) ) ( not ( = ?auto_11277 ?auto_11294 ) ) ( not ( = ?auto_11299 ?auto_11305 ) ) ( not ( = ?auto_11299 ?auto_11301 ) ) ( not ( = ?auto_11299 ?auto_11300 ) ) ( not ( = ?auto_11289 ?auto_11296 ) ) ( not ( = ?auto_11289 ?auto_11291 ) ) ( not ( = ?auto_11289 ?auto_11306 ) ) ( not ( = ?auto_11297 ?auto_11304 ) ) ( not ( = ?auto_11297 ?auto_11292 ) ) ( not ( = ?auto_11297 ?auto_11303 ) ) ( not ( = ?auto_11297 ?auto_11298 ) ) ( not ( = ?auto_11297 ?auto_11294 ) ) ( not ( = ?auto_11271 ?auto_11280 ) ) ( not ( = ?auto_11271 ?auto_11308 ) ) ( not ( = ?auto_11272 ?auto_11280 ) ) ( not ( = ?auto_11272 ?auto_11308 ) ) ( not ( = ?auto_11273 ?auto_11280 ) ) ( not ( = ?auto_11273 ?auto_11308 ) ) ( not ( = ?auto_11274 ?auto_11280 ) ) ( not ( = ?auto_11274 ?auto_11308 ) ) ( not ( = ?auto_11275 ?auto_11280 ) ) ( not ( = ?auto_11275 ?auto_11308 ) ) ( not ( = ?auto_11276 ?auto_11280 ) ) ( not ( = ?auto_11276 ?auto_11308 ) ) ( not ( = ?auto_11280 ?auto_11297 ) ) ( not ( = ?auto_11280 ?auto_11304 ) ) ( not ( = ?auto_11280 ?auto_11292 ) ) ( not ( = ?auto_11280 ?auto_11303 ) ) ( not ( = ?auto_11280 ?auto_11298 ) ) ( not ( = ?auto_11280 ?auto_11294 ) ) ( not ( = ?auto_11308 ?auto_11297 ) ) ( not ( = ?auto_11308 ?auto_11304 ) ) ( not ( = ?auto_11308 ?auto_11292 ) ) ( not ( = ?auto_11308 ?auto_11303 ) ) ( not ( = ?auto_11308 ?auto_11298 ) ) ( not ( = ?auto_11308 ?auto_11294 ) ) ( not ( = ?auto_11271 ?auto_11279 ) ) ( not ( = ?auto_11271 ?auto_11293 ) ) ( not ( = ?auto_11272 ?auto_11279 ) ) ( not ( = ?auto_11272 ?auto_11293 ) ) ( not ( = ?auto_11273 ?auto_11279 ) ) ( not ( = ?auto_11273 ?auto_11293 ) ) ( not ( = ?auto_11274 ?auto_11279 ) ) ( not ( = ?auto_11274 ?auto_11293 ) ) ( not ( = ?auto_11275 ?auto_11279 ) ) ( not ( = ?auto_11275 ?auto_11293 ) ) ( not ( = ?auto_11276 ?auto_11279 ) ) ( not ( = ?auto_11276 ?auto_11293 ) ) ( not ( = ?auto_11277 ?auto_11279 ) ) ( not ( = ?auto_11277 ?auto_11293 ) ) ( not ( = ?auto_11279 ?auto_11308 ) ) ( not ( = ?auto_11279 ?auto_11297 ) ) ( not ( = ?auto_11279 ?auto_11304 ) ) ( not ( = ?auto_11279 ?auto_11292 ) ) ( not ( = ?auto_11279 ?auto_11303 ) ) ( not ( = ?auto_11279 ?auto_11298 ) ) ( not ( = ?auto_11279 ?auto_11294 ) ) ( not ( = ?auto_11302 ?auto_11305 ) ) ( not ( = ?auto_11302 ?auto_11299 ) ) ( not ( = ?auto_11302 ?auto_11301 ) ) ( not ( = ?auto_11302 ?auto_11300 ) ) ( not ( = ?auto_11295 ?auto_11296 ) ) ( not ( = ?auto_11295 ?auto_11289 ) ) ( not ( = ?auto_11295 ?auto_11291 ) ) ( not ( = ?auto_11295 ?auto_11306 ) ) ( not ( = ?auto_11293 ?auto_11308 ) ) ( not ( = ?auto_11293 ?auto_11297 ) ) ( not ( = ?auto_11293 ?auto_11304 ) ) ( not ( = ?auto_11293 ?auto_11292 ) ) ( not ( = ?auto_11293 ?auto_11303 ) ) ( not ( = ?auto_11293 ?auto_11298 ) ) ( not ( = ?auto_11293 ?auto_11294 ) ) ( not ( = ?auto_11271 ?auto_11278 ) ) ( not ( = ?auto_11271 ?auto_11290 ) ) ( not ( = ?auto_11272 ?auto_11278 ) ) ( not ( = ?auto_11272 ?auto_11290 ) ) ( not ( = ?auto_11273 ?auto_11278 ) ) ( not ( = ?auto_11273 ?auto_11290 ) ) ( not ( = ?auto_11274 ?auto_11278 ) ) ( not ( = ?auto_11274 ?auto_11290 ) ) ( not ( = ?auto_11275 ?auto_11278 ) ) ( not ( = ?auto_11275 ?auto_11290 ) ) ( not ( = ?auto_11276 ?auto_11278 ) ) ( not ( = ?auto_11276 ?auto_11290 ) ) ( not ( = ?auto_11277 ?auto_11278 ) ) ( not ( = ?auto_11277 ?auto_11290 ) ) ( not ( = ?auto_11280 ?auto_11278 ) ) ( not ( = ?auto_11280 ?auto_11290 ) ) ( not ( = ?auto_11278 ?auto_11293 ) ) ( not ( = ?auto_11278 ?auto_11308 ) ) ( not ( = ?auto_11278 ?auto_11297 ) ) ( not ( = ?auto_11278 ?auto_11304 ) ) ( not ( = ?auto_11278 ?auto_11292 ) ) ( not ( = ?auto_11278 ?auto_11303 ) ) ( not ( = ?auto_11278 ?auto_11298 ) ) ( not ( = ?auto_11278 ?auto_11294 ) ) ( not ( = ?auto_11290 ?auto_11293 ) ) ( not ( = ?auto_11290 ?auto_11308 ) ) ( not ( = ?auto_11290 ?auto_11297 ) ) ( not ( = ?auto_11290 ?auto_11304 ) ) ( not ( = ?auto_11290 ?auto_11292 ) ) ( not ( = ?auto_11290 ?auto_11303 ) ) ( not ( = ?auto_11290 ?auto_11298 ) ) ( not ( = ?auto_11290 ?auto_11294 ) ) ( not ( = ?auto_11271 ?auto_11281 ) ) ( not ( = ?auto_11271 ?auto_11307 ) ) ( not ( = ?auto_11272 ?auto_11281 ) ) ( not ( = ?auto_11272 ?auto_11307 ) ) ( not ( = ?auto_11273 ?auto_11281 ) ) ( not ( = ?auto_11273 ?auto_11307 ) ) ( not ( = ?auto_11274 ?auto_11281 ) ) ( not ( = ?auto_11274 ?auto_11307 ) ) ( not ( = ?auto_11275 ?auto_11281 ) ) ( not ( = ?auto_11275 ?auto_11307 ) ) ( not ( = ?auto_11276 ?auto_11281 ) ) ( not ( = ?auto_11276 ?auto_11307 ) ) ( not ( = ?auto_11277 ?auto_11281 ) ) ( not ( = ?auto_11277 ?auto_11307 ) ) ( not ( = ?auto_11280 ?auto_11281 ) ) ( not ( = ?auto_11280 ?auto_11307 ) ) ( not ( = ?auto_11279 ?auto_11281 ) ) ( not ( = ?auto_11279 ?auto_11307 ) ) ( not ( = ?auto_11281 ?auto_11290 ) ) ( not ( = ?auto_11281 ?auto_11293 ) ) ( not ( = ?auto_11281 ?auto_11308 ) ) ( not ( = ?auto_11281 ?auto_11297 ) ) ( not ( = ?auto_11281 ?auto_11304 ) ) ( not ( = ?auto_11281 ?auto_11292 ) ) ( not ( = ?auto_11281 ?auto_11303 ) ) ( not ( = ?auto_11281 ?auto_11298 ) ) ( not ( = ?auto_11281 ?auto_11294 ) ) ( not ( = ?auto_11307 ?auto_11290 ) ) ( not ( = ?auto_11307 ?auto_11293 ) ) ( not ( = ?auto_11307 ?auto_11308 ) ) ( not ( = ?auto_11307 ?auto_11297 ) ) ( not ( = ?auto_11307 ?auto_11304 ) ) ( not ( = ?auto_11307 ?auto_11292 ) ) ( not ( = ?auto_11307 ?auto_11303 ) ) ( not ( = ?auto_11307 ?auto_11298 ) ) ( not ( = ?auto_11307 ?auto_11294 ) ) ( not ( = ?auto_11271 ?auto_11282 ) ) ( not ( = ?auto_11271 ?auto_11288 ) ) ( not ( = ?auto_11272 ?auto_11282 ) ) ( not ( = ?auto_11272 ?auto_11288 ) ) ( not ( = ?auto_11273 ?auto_11282 ) ) ( not ( = ?auto_11273 ?auto_11288 ) ) ( not ( = ?auto_11274 ?auto_11282 ) ) ( not ( = ?auto_11274 ?auto_11288 ) ) ( not ( = ?auto_11275 ?auto_11282 ) ) ( not ( = ?auto_11275 ?auto_11288 ) ) ( not ( = ?auto_11276 ?auto_11282 ) ) ( not ( = ?auto_11276 ?auto_11288 ) ) ( not ( = ?auto_11277 ?auto_11282 ) ) ( not ( = ?auto_11277 ?auto_11288 ) ) ( not ( = ?auto_11280 ?auto_11282 ) ) ( not ( = ?auto_11280 ?auto_11288 ) ) ( not ( = ?auto_11279 ?auto_11282 ) ) ( not ( = ?auto_11279 ?auto_11288 ) ) ( not ( = ?auto_11278 ?auto_11282 ) ) ( not ( = ?auto_11278 ?auto_11288 ) ) ( not ( = ?auto_11282 ?auto_11307 ) ) ( not ( = ?auto_11282 ?auto_11290 ) ) ( not ( = ?auto_11282 ?auto_11293 ) ) ( not ( = ?auto_11282 ?auto_11308 ) ) ( not ( = ?auto_11282 ?auto_11297 ) ) ( not ( = ?auto_11282 ?auto_11304 ) ) ( not ( = ?auto_11282 ?auto_11292 ) ) ( not ( = ?auto_11282 ?auto_11303 ) ) ( not ( = ?auto_11282 ?auto_11298 ) ) ( not ( = ?auto_11282 ?auto_11294 ) ) ( not ( = ?auto_11287 ?auto_11299 ) ) ( not ( = ?auto_11287 ?auto_11302 ) ) ( not ( = ?auto_11287 ?auto_11305 ) ) ( not ( = ?auto_11287 ?auto_11301 ) ) ( not ( = ?auto_11287 ?auto_11300 ) ) ( not ( = ?auto_11284 ?auto_11289 ) ) ( not ( = ?auto_11284 ?auto_11295 ) ) ( not ( = ?auto_11284 ?auto_11296 ) ) ( not ( = ?auto_11284 ?auto_11291 ) ) ( not ( = ?auto_11284 ?auto_11306 ) ) ( not ( = ?auto_11288 ?auto_11307 ) ) ( not ( = ?auto_11288 ?auto_11290 ) ) ( not ( = ?auto_11288 ?auto_11293 ) ) ( not ( = ?auto_11288 ?auto_11308 ) ) ( not ( = ?auto_11288 ?auto_11297 ) ) ( not ( = ?auto_11288 ?auto_11304 ) ) ( not ( = ?auto_11288 ?auto_11292 ) ) ( not ( = ?auto_11288 ?auto_11303 ) ) ( not ( = ?auto_11288 ?auto_11298 ) ) ( not ( = ?auto_11288 ?auto_11294 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_11271 ?auto_11272 ?auto_11273 ?auto_11274 ?auto_11275 ?auto_11276 ?auto_11277 ?auto_11280 ?auto_11279 ?auto_11278 ?auto_11281 )
      ( MAKE-1CRATE ?auto_11281 ?auto_11282 )
      ( MAKE-11CRATE-VERIFY ?auto_11271 ?auto_11272 ?auto_11273 ?auto_11274 ?auto_11275 ?auto_11276 ?auto_11277 ?auto_11280 ?auto_11279 ?auto_11278 ?auto_11281 ?auto_11282 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11311 - SURFACE
      ?auto_11312 - SURFACE
    )
    :vars
    (
      ?auto_11313 - HOIST
      ?auto_11314 - PLACE
      ?auto_11316 - PLACE
      ?auto_11317 - HOIST
      ?auto_11318 - SURFACE
      ?auto_11315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11313 ?auto_11314 ) ( SURFACE-AT ?auto_11311 ?auto_11314 ) ( CLEAR ?auto_11311 ) ( IS-CRATE ?auto_11312 ) ( AVAILABLE ?auto_11313 ) ( not ( = ?auto_11316 ?auto_11314 ) ) ( HOIST-AT ?auto_11317 ?auto_11316 ) ( AVAILABLE ?auto_11317 ) ( SURFACE-AT ?auto_11312 ?auto_11316 ) ( ON ?auto_11312 ?auto_11318 ) ( CLEAR ?auto_11312 ) ( TRUCK-AT ?auto_11315 ?auto_11314 ) ( not ( = ?auto_11311 ?auto_11312 ) ) ( not ( = ?auto_11311 ?auto_11318 ) ) ( not ( = ?auto_11312 ?auto_11318 ) ) ( not ( = ?auto_11313 ?auto_11317 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11315 ?auto_11314 ?auto_11316 )
      ( !LIFT ?auto_11317 ?auto_11312 ?auto_11318 ?auto_11316 )
      ( !LOAD ?auto_11317 ?auto_11312 ?auto_11315 ?auto_11316 )
      ( !DRIVE ?auto_11315 ?auto_11316 ?auto_11314 )
      ( !UNLOAD ?auto_11313 ?auto_11312 ?auto_11315 ?auto_11314 )
      ( !DROP ?auto_11313 ?auto_11312 ?auto_11311 ?auto_11314 )
      ( MAKE-1CRATE-VERIFY ?auto_11311 ?auto_11312 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_11332 - SURFACE
      ?auto_11333 - SURFACE
      ?auto_11334 - SURFACE
      ?auto_11335 - SURFACE
      ?auto_11336 - SURFACE
      ?auto_11337 - SURFACE
      ?auto_11338 - SURFACE
      ?auto_11341 - SURFACE
      ?auto_11340 - SURFACE
      ?auto_11339 - SURFACE
      ?auto_11342 - SURFACE
      ?auto_11343 - SURFACE
      ?auto_11344 - SURFACE
    )
    :vars
    (
      ?auto_11350 - HOIST
      ?auto_11348 - PLACE
      ?auto_11346 - PLACE
      ?auto_11347 - HOIST
      ?auto_11345 - SURFACE
      ?auto_11365 - PLACE
      ?auto_11352 - HOIST
      ?auto_11363 - SURFACE
      ?auto_11356 - PLACE
      ?auto_11362 - HOIST
      ?auto_11360 - SURFACE
      ?auto_11364 - SURFACE
      ?auto_11353 - SURFACE
      ?auto_11367 - PLACE
      ?auto_11369 - HOIST
      ?auto_11371 - SURFACE
      ?auto_11358 - SURFACE
      ?auto_11354 - SURFACE
      ?auto_11370 - PLACE
      ?auto_11366 - HOIST
      ?auto_11361 - SURFACE
      ?auto_11359 - SURFACE
      ?auto_11355 - PLACE
      ?auto_11368 - HOIST
      ?auto_11357 - SURFACE
      ?auto_11351 - SURFACE
      ?auto_11349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11350 ?auto_11348 ) ( IS-CRATE ?auto_11344 ) ( not ( = ?auto_11346 ?auto_11348 ) ) ( HOIST-AT ?auto_11347 ?auto_11346 ) ( SURFACE-AT ?auto_11344 ?auto_11346 ) ( ON ?auto_11344 ?auto_11345 ) ( CLEAR ?auto_11344 ) ( not ( = ?auto_11343 ?auto_11344 ) ) ( not ( = ?auto_11343 ?auto_11345 ) ) ( not ( = ?auto_11344 ?auto_11345 ) ) ( not ( = ?auto_11350 ?auto_11347 ) ) ( IS-CRATE ?auto_11343 ) ( not ( = ?auto_11365 ?auto_11348 ) ) ( HOIST-AT ?auto_11352 ?auto_11365 ) ( AVAILABLE ?auto_11352 ) ( SURFACE-AT ?auto_11343 ?auto_11365 ) ( ON ?auto_11343 ?auto_11363 ) ( CLEAR ?auto_11343 ) ( not ( = ?auto_11342 ?auto_11343 ) ) ( not ( = ?auto_11342 ?auto_11363 ) ) ( not ( = ?auto_11343 ?auto_11363 ) ) ( not ( = ?auto_11350 ?auto_11352 ) ) ( IS-CRATE ?auto_11342 ) ( not ( = ?auto_11356 ?auto_11348 ) ) ( HOIST-AT ?auto_11362 ?auto_11356 ) ( SURFACE-AT ?auto_11342 ?auto_11356 ) ( ON ?auto_11342 ?auto_11360 ) ( CLEAR ?auto_11342 ) ( not ( = ?auto_11339 ?auto_11342 ) ) ( not ( = ?auto_11339 ?auto_11360 ) ) ( not ( = ?auto_11342 ?auto_11360 ) ) ( not ( = ?auto_11350 ?auto_11362 ) ) ( IS-CRATE ?auto_11339 ) ( SURFACE-AT ?auto_11339 ?auto_11356 ) ( ON ?auto_11339 ?auto_11364 ) ( CLEAR ?auto_11339 ) ( not ( = ?auto_11340 ?auto_11339 ) ) ( not ( = ?auto_11340 ?auto_11364 ) ) ( not ( = ?auto_11339 ?auto_11364 ) ) ( IS-CRATE ?auto_11340 ) ( AVAILABLE ?auto_11347 ) ( SURFACE-AT ?auto_11340 ?auto_11346 ) ( ON ?auto_11340 ?auto_11353 ) ( CLEAR ?auto_11340 ) ( not ( = ?auto_11341 ?auto_11340 ) ) ( not ( = ?auto_11341 ?auto_11353 ) ) ( not ( = ?auto_11340 ?auto_11353 ) ) ( IS-CRATE ?auto_11341 ) ( not ( = ?auto_11367 ?auto_11348 ) ) ( HOIST-AT ?auto_11369 ?auto_11367 ) ( SURFACE-AT ?auto_11341 ?auto_11367 ) ( ON ?auto_11341 ?auto_11371 ) ( CLEAR ?auto_11341 ) ( not ( = ?auto_11338 ?auto_11341 ) ) ( not ( = ?auto_11338 ?auto_11371 ) ) ( not ( = ?auto_11341 ?auto_11371 ) ) ( not ( = ?auto_11350 ?auto_11369 ) ) ( IS-CRATE ?auto_11338 ) ( AVAILABLE ?auto_11362 ) ( SURFACE-AT ?auto_11338 ?auto_11356 ) ( ON ?auto_11338 ?auto_11358 ) ( CLEAR ?auto_11338 ) ( not ( = ?auto_11337 ?auto_11338 ) ) ( not ( = ?auto_11337 ?auto_11358 ) ) ( not ( = ?auto_11338 ?auto_11358 ) ) ( IS-CRATE ?auto_11337 ) ( SURFACE-AT ?auto_11337 ?auto_11367 ) ( ON ?auto_11337 ?auto_11354 ) ( CLEAR ?auto_11337 ) ( not ( = ?auto_11336 ?auto_11337 ) ) ( not ( = ?auto_11336 ?auto_11354 ) ) ( not ( = ?auto_11337 ?auto_11354 ) ) ( IS-CRATE ?auto_11336 ) ( not ( = ?auto_11370 ?auto_11348 ) ) ( HOIST-AT ?auto_11366 ?auto_11370 ) ( SURFACE-AT ?auto_11336 ?auto_11370 ) ( ON ?auto_11336 ?auto_11361 ) ( CLEAR ?auto_11336 ) ( not ( = ?auto_11335 ?auto_11336 ) ) ( not ( = ?auto_11335 ?auto_11361 ) ) ( not ( = ?auto_11336 ?auto_11361 ) ) ( not ( = ?auto_11350 ?auto_11366 ) ) ( IS-CRATE ?auto_11335 ) ( AVAILABLE ?auto_11369 ) ( SURFACE-AT ?auto_11335 ?auto_11367 ) ( ON ?auto_11335 ?auto_11359 ) ( CLEAR ?auto_11335 ) ( not ( = ?auto_11334 ?auto_11335 ) ) ( not ( = ?auto_11334 ?auto_11359 ) ) ( not ( = ?auto_11335 ?auto_11359 ) ) ( IS-CRATE ?auto_11334 ) ( not ( = ?auto_11355 ?auto_11348 ) ) ( HOIST-AT ?auto_11368 ?auto_11355 ) ( AVAILABLE ?auto_11368 ) ( SURFACE-AT ?auto_11334 ?auto_11355 ) ( ON ?auto_11334 ?auto_11357 ) ( CLEAR ?auto_11334 ) ( not ( = ?auto_11333 ?auto_11334 ) ) ( not ( = ?auto_11333 ?auto_11357 ) ) ( not ( = ?auto_11334 ?auto_11357 ) ) ( not ( = ?auto_11350 ?auto_11368 ) ) ( SURFACE-AT ?auto_11332 ?auto_11348 ) ( CLEAR ?auto_11332 ) ( IS-CRATE ?auto_11333 ) ( AVAILABLE ?auto_11350 ) ( AVAILABLE ?auto_11366 ) ( SURFACE-AT ?auto_11333 ?auto_11370 ) ( ON ?auto_11333 ?auto_11351 ) ( CLEAR ?auto_11333 ) ( TRUCK-AT ?auto_11349 ?auto_11348 ) ( not ( = ?auto_11332 ?auto_11333 ) ) ( not ( = ?auto_11332 ?auto_11351 ) ) ( not ( = ?auto_11333 ?auto_11351 ) ) ( not ( = ?auto_11332 ?auto_11334 ) ) ( not ( = ?auto_11332 ?auto_11357 ) ) ( not ( = ?auto_11334 ?auto_11351 ) ) ( not ( = ?auto_11355 ?auto_11370 ) ) ( not ( = ?auto_11368 ?auto_11366 ) ) ( not ( = ?auto_11357 ?auto_11351 ) ) ( not ( = ?auto_11332 ?auto_11335 ) ) ( not ( = ?auto_11332 ?auto_11359 ) ) ( not ( = ?auto_11333 ?auto_11335 ) ) ( not ( = ?auto_11333 ?auto_11359 ) ) ( not ( = ?auto_11335 ?auto_11357 ) ) ( not ( = ?auto_11335 ?auto_11351 ) ) ( not ( = ?auto_11367 ?auto_11355 ) ) ( not ( = ?auto_11367 ?auto_11370 ) ) ( not ( = ?auto_11369 ?auto_11368 ) ) ( not ( = ?auto_11369 ?auto_11366 ) ) ( not ( = ?auto_11359 ?auto_11357 ) ) ( not ( = ?auto_11359 ?auto_11351 ) ) ( not ( = ?auto_11332 ?auto_11336 ) ) ( not ( = ?auto_11332 ?auto_11361 ) ) ( not ( = ?auto_11333 ?auto_11336 ) ) ( not ( = ?auto_11333 ?auto_11361 ) ) ( not ( = ?auto_11334 ?auto_11336 ) ) ( not ( = ?auto_11334 ?auto_11361 ) ) ( not ( = ?auto_11336 ?auto_11359 ) ) ( not ( = ?auto_11336 ?auto_11357 ) ) ( not ( = ?auto_11336 ?auto_11351 ) ) ( not ( = ?auto_11361 ?auto_11359 ) ) ( not ( = ?auto_11361 ?auto_11357 ) ) ( not ( = ?auto_11361 ?auto_11351 ) ) ( not ( = ?auto_11332 ?auto_11337 ) ) ( not ( = ?auto_11332 ?auto_11354 ) ) ( not ( = ?auto_11333 ?auto_11337 ) ) ( not ( = ?auto_11333 ?auto_11354 ) ) ( not ( = ?auto_11334 ?auto_11337 ) ) ( not ( = ?auto_11334 ?auto_11354 ) ) ( not ( = ?auto_11335 ?auto_11337 ) ) ( not ( = ?auto_11335 ?auto_11354 ) ) ( not ( = ?auto_11337 ?auto_11361 ) ) ( not ( = ?auto_11337 ?auto_11359 ) ) ( not ( = ?auto_11337 ?auto_11357 ) ) ( not ( = ?auto_11337 ?auto_11351 ) ) ( not ( = ?auto_11354 ?auto_11361 ) ) ( not ( = ?auto_11354 ?auto_11359 ) ) ( not ( = ?auto_11354 ?auto_11357 ) ) ( not ( = ?auto_11354 ?auto_11351 ) ) ( not ( = ?auto_11332 ?auto_11338 ) ) ( not ( = ?auto_11332 ?auto_11358 ) ) ( not ( = ?auto_11333 ?auto_11338 ) ) ( not ( = ?auto_11333 ?auto_11358 ) ) ( not ( = ?auto_11334 ?auto_11338 ) ) ( not ( = ?auto_11334 ?auto_11358 ) ) ( not ( = ?auto_11335 ?auto_11338 ) ) ( not ( = ?auto_11335 ?auto_11358 ) ) ( not ( = ?auto_11336 ?auto_11338 ) ) ( not ( = ?auto_11336 ?auto_11358 ) ) ( not ( = ?auto_11338 ?auto_11354 ) ) ( not ( = ?auto_11338 ?auto_11361 ) ) ( not ( = ?auto_11338 ?auto_11359 ) ) ( not ( = ?auto_11338 ?auto_11357 ) ) ( not ( = ?auto_11338 ?auto_11351 ) ) ( not ( = ?auto_11356 ?auto_11367 ) ) ( not ( = ?auto_11356 ?auto_11370 ) ) ( not ( = ?auto_11356 ?auto_11355 ) ) ( not ( = ?auto_11362 ?auto_11369 ) ) ( not ( = ?auto_11362 ?auto_11366 ) ) ( not ( = ?auto_11362 ?auto_11368 ) ) ( not ( = ?auto_11358 ?auto_11354 ) ) ( not ( = ?auto_11358 ?auto_11361 ) ) ( not ( = ?auto_11358 ?auto_11359 ) ) ( not ( = ?auto_11358 ?auto_11357 ) ) ( not ( = ?auto_11358 ?auto_11351 ) ) ( not ( = ?auto_11332 ?auto_11341 ) ) ( not ( = ?auto_11332 ?auto_11371 ) ) ( not ( = ?auto_11333 ?auto_11341 ) ) ( not ( = ?auto_11333 ?auto_11371 ) ) ( not ( = ?auto_11334 ?auto_11341 ) ) ( not ( = ?auto_11334 ?auto_11371 ) ) ( not ( = ?auto_11335 ?auto_11341 ) ) ( not ( = ?auto_11335 ?auto_11371 ) ) ( not ( = ?auto_11336 ?auto_11341 ) ) ( not ( = ?auto_11336 ?auto_11371 ) ) ( not ( = ?auto_11337 ?auto_11341 ) ) ( not ( = ?auto_11337 ?auto_11371 ) ) ( not ( = ?auto_11341 ?auto_11358 ) ) ( not ( = ?auto_11341 ?auto_11354 ) ) ( not ( = ?auto_11341 ?auto_11361 ) ) ( not ( = ?auto_11341 ?auto_11359 ) ) ( not ( = ?auto_11341 ?auto_11357 ) ) ( not ( = ?auto_11341 ?auto_11351 ) ) ( not ( = ?auto_11371 ?auto_11358 ) ) ( not ( = ?auto_11371 ?auto_11354 ) ) ( not ( = ?auto_11371 ?auto_11361 ) ) ( not ( = ?auto_11371 ?auto_11359 ) ) ( not ( = ?auto_11371 ?auto_11357 ) ) ( not ( = ?auto_11371 ?auto_11351 ) ) ( not ( = ?auto_11332 ?auto_11340 ) ) ( not ( = ?auto_11332 ?auto_11353 ) ) ( not ( = ?auto_11333 ?auto_11340 ) ) ( not ( = ?auto_11333 ?auto_11353 ) ) ( not ( = ?auto_11334 ?auto_11340 ) ) ( not ( = ?auto_11334 ?auto_11353 ) ) ( not ( = ?auto_11335 ?auto_11340 ) ) ( not ( = ?auto_11335 ?auto_11353 ) ) ( not ( = ?auto_11336 ?auto_11340 ) ) ( not ( = ?auto_11336 ?auto_11353 ) ) ( not ( = ?auto_11337 ?auto_11340 ) ) ( not ( = ?auto_11337 ?auto_11353 ) ) ( not ( = ?auto_11338 ?auto_11340 ) ) ( not ( = ?auto_11338 ?auto_11353 ) ) ( not ( = ?auto_11340 ?auto_11371 ) ) ( not ( = ?auto_11340 ?auto_11358 ) ) ( not ( = ?auto_11340 ?auto_11354 ) ) ( not ( = ?auto_11340 ?auto_11361 ) ) ( not ( = ?auto_11340 ?auto_11359 ) ) ( not ( = ?auto_11340 ?auto_11357 ) ) ( not ( = ?auto_11340 ?auto_11351 ) ) ( not ( = ?auto_11346 ?auto_11367 ) ) ( not ( = ?auto_11346 ?auto_11356 ) ) ( not ( = ?auto_11346 ?auto_11370 ) ) ( not ( = ?auto_11346 ?auto_11355 ) ) ( not ( = ?auto_11347 ?auto_11369 ) ) ( not ( = ?auto_11347 ?auto_11362 ) ) ( not ( = ?auto_11347 ?auto_11366 ) ) ( not ( = ?auto_11347 ?auto_11368 ) ) ( not ( = ?auto_11353 ?auto_11371 ) ) ( not ( = ?auto_11353 ?auto_11358 ) ) ( not ( = ?auto_11353 ?auto_11354 ) ) ( not ( = ?auto_11353 ?auto_11361 ) ) ( not ( = ?auto_11353 ?auto_11359 ) ) ( not ( = ?auto_11353 ?auto_11357 ) ) ( not ( = ?auto_11353 ?auto_11351 ) ) ( not ( = ?auto_11332 ?auto_11339 ) ) ( not ( = ?auto_11332 ?auto_11364 ) ) ( not ( = ?auto_11333 ?auto_11339 ) ) ( not ( = ?auto_11333 ?auto_11364 ) ) ( not ( = ?auto_11334 ?auto_11339 ) ) ( not ( = ?auto_11334 ?auto_11364 ) ) ( not ( = ?auto_11335 ?auto_11339 ) ) ( not ( = ?auto_11335 ?auto_11364 ) ) ( not ( = ?auto_11336 ?auto_11339 ) ) ( not ( = ?auto_11336 ?auto_11364 ) ) ( not ( = ?auto_11337 ?auto_11339 ) ) ( not ( = ?auto_11337 ?auto_11364 ) ) ( not ( = ?auto_11338 ?auto_11339 ) ) ( not ( = ?auto_11338 ?auto_11364 ) ) ( not ( = ?auto_11341 ?auto_11339 ) ) ( not ( = ?auto_11341 ?auto_11364 ) ) ( not ( = ?auto_11339 ?auto_11353 ) ) ( not ( = ?auto_11339 ?auto_11371 ) ) ( not ( = ?auto_11339 ?auto_11358 ) ) ( not ( = ?auto_11339 ?auto_11354 ) ) ( not ( = ?auto_11339 ?auto_11361 ) ) ( not ( = ?auto_11339 ?auto_11359 ) ) ( not ( = ?auto_11339 ?auto_11357 ) ) ( not ( = ?auto_11339 ?auto_11351 ) ) ( not ( = ?auto_11364 ?auto_11353 ) ) ( not ( = ?auto_11364 ?auto_11371 ) ) ( not ( = ?auto_11364 ?auto_11358 ) ) ( not ( = ?auto_11364 ?auto_11354 ) ) ( not ( = ?auto_11364 ?auto_11361 ) ) ( not ( = ?auto_11364 ?auto_11359 ) ) ( not ( = ?auto_11364 ?auto_11357 ) ) ( not ( = ?auto_11364 ?auto_11351 ) ) ( not ( = ?auto_11332 ?auto_11342 ) ) ( not ( = ?auto_11332 ?auto_11360 ) ) ( not ( = ?auto_11333 ?auto_11342 ) ) ( not ( = ?auto_11333 ?auto_11360 ) ) ( not ( = ?auto_11334 ?auto_11342 ) ) ( not ( = ?auto_11334 ?auto_11360 ) ) ( not ( = ?auto_11335 ?auto_11342 ) ) ( not ( = ?auto_11335 ?auto_11360 ) ) ( not ( = ?auto_11336 ?auto_11342 ) ) ( not ( = ?auto_11336 ?auto_11360 ) ) ( not ( = ?auto_11337 ?auto_11342 ) ) ( not ( = ?auto_11337 ?auto_11360 ) ) ( not ( = ?auto_11338 ?auto_11342 ) ) ( not ( = ?auto_11338 ?auto_11360 ) ) ( not ( = ?auto_11341 ?auto_11342 ) ) ( not ( = ?auto_11341 ?auto_11360 ) ) ( not ( = ?auto_11340 ?auto_11342 ) ) ( not ( = ?auto_11340 ?auto_11360 ) ) ( not ( = ?auto_11342 ?auto_11364 ) ) ( not ( = ?auto_11342 ?auto_11353 ) ) ( not ( = ?auto_11342 ?auto_11371 ) ) ( not ( = ?auto_11342 ?auto_11358 ) ) ( not ( = ?auto_11342 ?auto_11354 ) ) ( not ( = ?auto_11342 ?auto_11361 ) ) ( not ( = ?auto_11342 ?auto_11359 ) ) ( not ( = ?auto_11342 ?auto_11357 ) ) ( not ( = ?auto_11342 ?auto_11351 ) ) ( not ( = ?auto_11360 ?auto_11364 ) ) ( not ( = ?auto_11360 ?auto_11353 ) ) ( not ( = ?auto_11360 ?auto_11371 ) ) ( not ( = ?auto_11360 ?auto_11358 ) ) ( not ( = ?auto_11360 ?auto_11354 ) ) ( not ( = ?auto_11360 ?auto_11361 ) ) ( not ( = ?auto_11360 ?auto_11359 ) ) ( not ( = ?auto_11360 ?auto_11357 ) ) ( not ( = ?auto_11360 ?auto_11351 ) ) ( not ( = ?auto_11332 ?auto_11343 ) ) ( not ( = ?auto_11332 ?auto_11363 ) ) ( not ( = ?auto_11333 ?auto_11343 ) ) ( not ( = ?auto_11333 ?auto_11363 ) ) ( not ( = ?auto_11334 ?auto_11343 ) ) ( not ( = ?auto_11334 ?auto_11363 ) ) ( not ( = ?auto_11335 ?auto_11343 ) ) ( not ( = ?auto_11335 ?auto_11363 ) ) ( not ( = ?auto_11336 ?auto_11343 ) ) ( not ( = ?auto_11336 ?auto_11363 ) ) ( not ( = ?auto_11337 ?auto_11343 ) ) ( not ( = ?auto_11337 ?auto_11363 ) ) ( not ( = ?auto_11338 ?auto_11343 ) ) ( not ( = ?auto_11338 ?auto_11363 ) ) ( not ( = ?auto_11341 ?auto_11343 ) ) ( not ( = ?auto_11341 ?auto_11363 ) ) ( not ( = ?auto_11340 ?auto_11343 ) ) ( not ( = ?auto_11340 ?auto_11363 ) ) ( not ( = ?auto_11339 ?auto_11343 ) ) ( not ( = ?auto_11339 ?auto_11363 ) ) ( not ( = ?auto_11343 ?auto_11360 ) ) ( not ( = ?auto_11343 ?auto_11364 ) ) ( not ( = ?auto_11343 ?auto_11353 ) ) ( not ( = ?auto_11343 ?auto_11371 ) ) ( not ( = ?auto_11343 ?auto_11358 ) ) ( not ( = ?auto_11343 ?auto_11354 ) ) ( not ( = ?auto_11343 ?auto_11361 ) ) ( not ( = ?auto_11343 ?auto_11359 ) ) ( not ( = ?auto_11343 ?auto_11357 ) ) ( not ( = ?auto_11343 ?auto_11351 ) ) ( not ( = ?auto_11365 ?auto_11356 ) ) ( not ( = ?auto_11365 ?auto_11346 ) ) ( not ( = ?auto_11365 ?auto_11367 ) ) ( not ( = ?auto_11365 ?auto_11370 ) ) ( not ( = ?auto_11365 ?auto_11355 ) ) ( not ( = ?auto_11352 ?auto_11362 ) ) ( not ( = ?auto_11352 ?auto_11347 ) ) ( not ( = ?auto_11352 ?auto_11369 ) ) ( not ( = ?auto_11352 ?auto_11366 ) ) ( not ( = ?auto_11352 ?auto_11368 ) ) ( not ( = ?auto_11363 ?auto_11360 ) ) ( not ( = ?auto_11363 ?auto_11364 ) ) ( not ( = ?auto_11363 ?auto_11353 ) ) ( not ( = ?auto_11363 ?auto_11371 ) ) ( not ( = ?auto_11363 ?auto_11358 ) ) ( not ( = ?auto_11363 ?auto_11354 ) ) ( not ( = ?auto_11363 ?auto_11361 ) ) ( not ( = ?auto_11363 ?auto_11359 ) ) ( not ( = ?auto_11363 ?auto_11357 ) ) ( not ( = ?auto_11363 ?auto_11351 ) ) ( not ( = ?auto_11332 ?auto_11344 ) ) ( not ( = ?auto_11332 ?auto_11345 ) ) ( not ( = ?auto_11333 ?auto_11344 ) ) ( not ( = ?auto_11333 ?auto_11345 ) ) ( not ( = ?auto_11334 ?auto_11344 ) ) ( not ( = ?auto_11334 ?auto_11345 ) ) ( not ( = ?auto_11335 ?auto_11344 ) ) ( not ( = ?auto_11335 ?auto_11345 ) ) ( not ( = ?auto_11336 ?auto_11344 ) ) ( not ( = ?auto_11336 ?auto_11345 ) ) ( not ( = ?auto_11337 ?auto_11344 ) ) ( not ( = ?auto_11337 ?auto_11345 ) ) ( not ( = ?auto_11338 ?auto_11344 ) ) ( not ( = ?auto_11338 ?auto_11345 ) ) ( not ( = ?auto_11341 ?auto_11344 ) ) ( not ( = ?auto_11341 ?auto_11345 ) ) ( not ( = ?auto_11340 ?auto_11344 ) ) ( not ( = ?auto_11340 ?auto_11345 ) ) ( not ( = ?auto_11339 ?auto_11344 ) ) ( not ( = ?auto_11339 ?auto_11345 ) ) ( not ( = ?auto_11342 ?auto_11344 ) ) ( not ( = ?auto_11342 ?auto_11345 ) ) ( not ( = ?auto_11344 ?auto_11363 ) ) ( not ( = ?auto_11344 ?auto_11360 ) ) ( not ( = ?auto_11344 ?auto_11364 ) ) ( not ( = ?auto_11344 ?auto_11353 ) ) ( not ( = ?auto_11344 ?auto_11371 ) ) ( not ( = ?auto_11344 ?auto_11358 ) ) ( not ( = ?auto_11344 ?auto_11354 ) ) ( not ( = ?auto_11344 ?auto_11361 ) ) ( not ( = ?auto_11344 ?auto_11359 ) ) ( not ( = ?auto_11344 ?auto_11357 ) ) ( not ( = ?auto_11344 ?auto_11351 ) ) ( not ( = ?auto_11345 ?auto_11363 ) ) ( not ( = ?auto_11345 ?auto_11360 ) ) ( not ( = ?auto_11345 ?auto_11364 ) ) ( not ( = ?auto_11345 ?auto_11353 ) ) ( not ( = ?auto_11345 ?auto_11371 ) ) ( not ( = ?auto_11345 ?auto_11358 ) ) ( not ( = ?auto_11345 ?auto_11354 ) ) ( not ( = ?auto_11345 ?auto_11361 ) ) ( not ( = ?auto_11345 ?auto_11359 ) ) ( not ( = ?auto_11345 ?auto_11357 ) ) ( not ( = ?auto_11345 ?auto_11351 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_11332 ?auto_11333 ?auto_11334 ?auto_11335 ?auto_11336 ?auto_11337 ?auto_11338 ?auto_11341 ?auto_11340 ?auto_11339 ?auto_11342 ?auto_11343 )
      ( MAKE-1CRATE ?auto_11343 ?auto_11344 )
      ( MAKE-12CRATE-VERIFY ?auto_11332 ?auto_11333 ?auto_11334 ?auto_11335 ?auto_11336 ?auto_11337 ?auto_11338 ?auto_11341 ?auto_11340 ?auto_11339 ?auto_11342 ?auto_11343 ?auto_11344 ) )
  )

)

