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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10933 - SURFACE
      ?auto_10934 - SURFACE
    )
    :vars
    (
      ?auto_10935 - HOIST
      ?auto_10936 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10935 ?auto_10936 ) ( SURFACE-AT ?auto_10933 ?auto_10936 ) ( CLEAR ?auto_10933 ) ( LIFTING ?auto_10935 ?auto_10934 ) ( IS-CRATE ?auto_10934 ) ( not ( = ?auto_10933 ?auto_10934 ) ) )
    :subtasks
    ( ( !DROP ?auto_10935 ?auto_10934 ?auto_10933 ?auto_10936 )
      ( MAKE-1CRATE-VERIFY ?auto_10933 ?auto_10934 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10937 - SURFACE
      ?auto_10938 - SURFACE
    )
    :vars
    (
      ?auto_10939 - HOIST
      ?auto_10940 - PLACE
      ?auto_10941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10939 ?auto_10940 ) ( SURFACE-AT ?auto_10937 ?auto_10940 ) ( CLEAR ?auto_10937 ) ( IS-CRATE ?auto_10938 ) ( not ( = ?auto_10937 ?auto_10938 ) ) ( TRUCK-AT ?auto_10941 ?auto_10940 ) ( AVAILABLE ?auto_10939 ) ( IN ?auto_10938 ?auto_10941 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10939 ?auto_10938 ?auto_10941 ?auto_10940 )
      ( MAKE-1CRATE ?auto_10937 ?auto_10938 )
      ( MAKE-1CRATE-VERIFY ?auto_10937 ?auto_10938 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10942 - SURFACE
      ?auto_10943 - SURFACE
    )
    :vars
    (
      ?auto_10946 - HOIST
      ?auto_10945 - PLACE
      ?auto_10944 - TRUCK
      ?auto_10947 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10946 ?auto_10945 ) ( SURFACE-AT ?auto_10942 ?auto_10945 ) ( CLEAR ?auto_10942 ) ( IS-CRATE ?auto_10943 ) ( not ( = ?auto_10942 ?auto_10943 ) ) ( AVAILABLE ?auto_10946 ) ( IN ?auto_10943 ?auto_10944 ) ( TRUCK-AT ?auto_10944 ?auto_10947 ) ( not ( = ?auto_10947 ?auto_10945 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10944 ?auto_10947 ?auto_10945 )
      ( MAKE-1CRATE ?auto_10942 ?auto_10943 )
      ( MAKE-1CRATE-VERIFY ?auto_10942 ?auto_10943 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10948 - SURFACE
      ?auto_10949 - SURFACE
    )
    :vars
    (
      ?auto_10950 - HOIST
      ?auto_10952 - PLACE
      ?auto_10951 - TRUCK
      ?auto_10953 - PLACE
      ?auto_10954 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10950 ?auto_10952 ) ( SURFACE-AT ?auto_10948 ?auto_10952 ) ( CLEAR ?auto_10948 ) ( IS-CRATE ?auto_10949 ) ( not ( = ?auto_10948 ?auto_10949 ) ) ( AVAILABLE ?auto_10950 ) ( TRUCK-AT ?auto_10951 ?auto_10953 ) ( not ( = ?auto_10953 ?auto_10952 ) ) ( HOIST-AT ?auto_10954 ?auto_10953 ) ( LIFTING ?auto_10954 ?auto_10949 ) ( not ( = ?auto_10950 ?auto_10954 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10954 ?auto_10949 ?auto_10951 ?auto_10953 )
      ( MAKE-1CRATE ?auto_10948 ?auto_10949 )
      ( MAKE-1CRATE-VERIFY ?auto_10948 ?auto_10949 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10955 - SURFACE
      ?auto_10956 - SURFACE
    )
    :vars
    (
      ?auto_10959 - HOIST
      ?auto_10958 - PLACE
      ?auto_10957 - TRUCK
      ?auto_10961 - PLACE
      ?auto_10960 - HOIST
      ?auto_10962 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10959 ?auto_10958 ) ( SURFACE-AT ?auto_10955 ?auto_10958 ) ( CLEAR ?auto_10955 ) ( IS-CRATE ?auto_10956 ) ( not ( = ?auto_10955 ?auto_10956 ) ) ( AVAILABLE ?auto_10959 ) ( TRUCK-AT ?auto_10957 ?auto_10961 ) ( not ( = ?auto_10961 ?auto_10958 ) ) ( HOIST-AT ?auto_10960 ?auto_10961 ) ( not ( = ?auto_10959 ?auto_10960 ) ) ( AVAILABLE ?auto_10960 ) ( SURFACE-AT ?auto_10956 ?auto_10961 ) ( ON ?auto_10956 ?auto_10962 ) ( CLEAR ?auto_10956 ) ( not ( = ?auto_10955 ?auto_10962 ) ) ( not ( = ?auto_10956 ?auto_10962 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10960 ?auto_10956 ?auto_10962 ?auto_10961 )
      ( MAKE-1CRATE ?auto_10955 ?auto_10956 )
      ( MAKE-1CRATE-VERIFY ?auto_10955 ?auto_10956 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10963 - SURFACE
      ?auto_10964 - SURFACE
    )
    :vars
    (
      ?auto_10966 - HOIST
      ?auto_10967 - PLACE
      ?auto_10970 - PLACE
      ?auto_10969 - HOIST
      ?auto_10968 - SURFACE
      ?auto_10965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10966 ?auto_10967 ) ( SURFACE-AT ?auto_10963 ?auto_10967 ) ( CLEAR ?auto_10963 ) ( IS-CRATE ?auto_10964 ) ( not ( = ?auto_10963 ?auto_10964 ) ) ( AVAILABLE ?auto_10966 ) ( not ( = ?auto_10970 ?auto_10967 ) ) ( HOIST-AT ?auto_10969 ?auto_10970 ) ( not ( = ?auto_10966 ?auto_10969 ) ) ( AVAILABLE ?auto_10969 ) ( SURFACE-AT ?auto_10964 ?auto_10970 ) ( ON ?auto_10964 ?auto_10968 ) ( CLEAR ?auto_10964 ) ( not ( = ?auto_10963 ?auto_10968 ) ) ( not ( = ?auto_10964 ?auto_10968 ) ) ( TRUCK-AT ?auto_10965 ?auto_10967 ) )
    :subtasks
    ( ( !DRIVE ?auto_10965 ?auto_10967 ?auto_10970 )
      ( MAKE-1CRATE ?auto_10963 ?auto_10964 )
      ( MAKE-1CRATE-VERIFY ?auto_10963 ?auto_10964 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10980 - SURFACE
      ?auto_10981 - SURFACE
      ?auto_10982 - SURFACE
    )
    :vars
    (
      ?auto_10984 - HOIST
      ?auto_10983 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10984 ?auto_10983 ) ( SURFACE-AT ?auto_10981 ?auto_10983 ) ( CLEAR ?auto_10981 ) ( LIFTING ?auto_10984 ?auto_10982 ) ( IS-CRATE ?auto_10982 ) ( not ( = ?auto_10981 ?auto_10982 ) ) ( ON ?auto_10981 ?auto_10980 ) ( not ( = ?auto_10980 ?auto_10981 ) ) ( not ( = ?auto_10980 ?auto_10982 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10981 ?auto_10982 )
      ( MAKE-2CRATE-VERIFY ?auto_10980 ?auto_10981 ?auto_10982 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10990 - SURFACE
      ?auto_10991 - SURFACE
      ?auto_10992 - SURFACE
    )
    :vars
    (
      ?auto_10995 - HOIST
      ?auto_10994 - PLACE
      ?auto_10993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10995 ?auto_10994 ) ( SURFACE-AT ?auto_10991 ?auto_10994 ) ( CLEAR ?auto_10991 ) ( IS-CRATE ?auto_10992 ) ( not ( = ?auto_10991 ?auto_10992 ) ) ( TRUCK-AT ?auto_10993 ?auto_10994 ) ( AVAILABLE ?auto_10995 ) ( IN ?auto_10992 ?auto_10993 ) ( ON ?auto_10991 ?auto_10990 ) ( not ( = ?auto_10990 ?auto_10991 ) ) ( not ( = ?auto_10990 ?auto_10992 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10991 ?auto_10992 )
      ( MAKE-2CRATE-VERIFY ?auto_10990 ?auto_10991 ?auto_10992 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10996 - SURFACE
      ?auto_10997 - SURFACE
    )
    :vars
    (
      ?auto_10999 - HOIST
      ?auto_11001 - PLACE
      ?auto_11000 - TRUCK
      ?auto_10998 - SURFACE
      ?auto_11002 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10999 ?auto_11001 ) ( SURFACE-AT ?auto_10996 ?auto_11001 ) ( CLEAR ?auto_10996 ) ( IS-CRATE ?auto_10997 ) ( not ( = ?auto_10996 ?auto_10997 ) ) ( AVAILABLE ?auto_10999 ) ( IN ?auto_10997 ?auto_11000 ) ( ON ?auto_10996 ?auto_10998 ) ( not ( = ?auto_10998 ?auto_10996 ) ) ( not ( = ?auto_10998 ?auto_10997 ) ) ( TRUCK-AT ?auto_11000 ?auto_11002 ) ( not ( = ?auto_11002 ?auto_11001 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11000 ?auto_11002 ?auto_11001 )
      ( MAKE-2CRATE ?auto_10998 ?auto_10996 ?auto_10997 )
      ( MAKE-1CRATE-VERIFY ?auto_10996 ?auto_10997 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11003 - SURFACE
      ?auto_11004 - SURFACE
      ?auto_11005 - SURFACE
    )
    :vars
    (
      ?auto_11007 - HOIST
      ?auto_11006 - PLACE
      ?auto_11008 - TRUCK
      ?auto_11009 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11007 ?auto_11006 ) ( SURFACE-AT ?auto_11004 ?auto_11006 ) ( CLEAR ?auto_11004 ) ( IS-CRATE ?auto_11005 ) ( not ( = ?auto_11004 ?auto_11005 ) ) ( AVAILABLE ?auto_11007 ) ( IN ?auto_11005 ?auto_11008 ) ( ON ?auto_11004 ?auto_11003 ) ( not ( = ?auto_11003 ?auto_11004 ) ) ( not ( = ?auto_11003 ?auto_11005 ) ) ( TRUCK-AT ?auto_11008 ?auto_11009 ) ( not ( = ?auto_11009 ?auto_11006 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11004 ?auto_11005 )
      ( MAKE-2CRATE-VERIFY ?auto_11003 ?auto_11004 ?auto_11005 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11010 - SURFACE
      ?auto_11011 - SURFACE
    )
    :vars
    (
      ?auto_11015 - HOIST
      ?auto_11016 - PLACE
      ?auto_11012 - SURFACE
      ?auto_11014 - TRUCK
      ?auto_11013 - PLACE
      ?auto_11017 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11015 ?auto_11016 ) ( SURFACE-AT ?auto_11010 ?auto_11016 ) ( CLEAR ?auto_11010 ) ( IS-CRATE ?auto_11011 ) ( not ( = ?auto_11010 ?auto_11011 ) ) ( AVAILABLE ?auto_11015 ) ( ON ?auto_11010 ?auto_11012 ) ( not ( = ?auto_11012 ?auto_11010 ) ) ( not ( = ?auto_11012 ?auto_11011 ) ) ( TRUCK-AT ?auto_11014 ?auto_11013 ) ( not ( = ?auto_11013 ?auto_11016 ) ) ( HOIST-AT ?auto_11017 ?auto_11013 ) ( LIFTING ?auto_11017 ?auto_11011 ) ( not ( = ?auto_11015 ?auto_11017 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11017 ?auto_11011 ?auto_11014 ?auto_11013 )
      ( MAKE-2CRATE ?auto_11012 ?auto_11010 ?auto_11011 )
      ( MAKE-1CRATE-VERIFY ?auto_11010 ?auto_11011 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11018 - SURFACE
      ?auto_11019 - SURFACE
      ?auto_11020 - SURFACE
    )
    :vars
    (
      ?auto_11022 - HOIST
      ?auto_11025 - PLACE
      ?auto_11023 - TRUCK
      ?auto_11024 - PLACE
      ?auto_11021 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11022 ?auto_11025 ) ( SURFACE-AT ?auto_11019 ?auto_11025 ) ( CLEAR ?auto_11019 ) ( IS-CRATE ?auto_11020 ) ( not ( = ?auto_11019 ?auto_11020 ) ) ( AVAILABLE ?auto_11022 ) ( ON ?auto_11019 ?auto_11018 ) ( not ( = ?auto_11018 ?auto_11019 ) ) ( not ( = ?auto_11018 ?auto_11020 ) ) ( TRUCK-AT ?auto_11023 ?auto_11024 ) ( not ( = ?auto_11024 ?auto_11025 ) ) ( HOIST-AT ?auto_11021 ?auto_11024 ) ( LIFTING ?auto_11021 ?auto_11020 ) ( not ( = ?auto_11022 ?auto_11021 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11019 ?auto_11020 )
      ( MAKE-2CRATE-VERIFY ?auto_11018 ?auto_11019 ?auto_11020 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11026 - SURFACE
      ?auto_11027 - SURFACE
    )
    :vars
    (
      ?auto_11028 - HOIST
      ?auto_11032 - PLACE
      ?auto_11031 - SURFACE
      ?auto_11033 - TRUCK
      ?auto_11029 - PLACE
      ?auto_11030 - HOIST
      ?auto_11034 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11028 ?auto_11032 ) ( SURFACE-AT ?auto_11026 ?auto_11032 ) ( CLEAR ?auto_11026 ) ( IS-CRATE ?auto_11027 ) ( not ( = ?auto_11026 ?auto_11027 ) ) ( AVAILABLE ?auto_11028 ) ( ON ?auto_11026 ?auto_11031 ) ( not ( = ?auto_11031 ?auto_11026 ) ) ( not ( = ?auto_11031 ?auto_11027 ) ) ( TRUCK-AT ?auto_11033 ?auto_11029 ) ( not ( = ?auto_11029 ?auto_11032 ) ) ( HOIST-AT ?auto_11030 ?auto_11029 ) ( not ( = ?auto_11028 ?auto_11030 ) ) ( AVAILABLE ?auto_11030 ) ( SURFACE-AT ?auto_11027 ?auto_11029 ) ( ON ?auto_11027 ?auto_11034 ) ( CLEAR ?auto_11027 ) ( not ( = ?auto_11026 ?auto_11034 ) ) ( not ( = ?auto_11027 ?auto_11034 ) ) ( not ( = ?auto_11031 ?auto_11034 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11030 ?auto_11027 ?auto_11034 ?auto_11029 )
      ( MAKE-2CRATE ?auto_11031 ?auto_11026 ?auto_11027 )
      ( MAKE-1CRATE-VERIFY ?auto_11026 ?auto_11027 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11035 - SURFACE
      ?auto_11036 - SURFACE
      ?auto_11037 - SURFACE
    )
    :vars
    (
      ?auto_11040 - HOIST
      ?auto_11042 - PLACE
      ?auto_11043 - TRUCK
      ?auto_11041 - PLACE
      ?auto_11038 - HOIST
      ?auto_11039 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11040 ?auto_11042 ) ( SURFACE-AT ?auto_11036 ?auto_11042 ) ( CLEAR ?auto_11036 ) ( IS-CRATE ?auto_11037 ) ( not ( = ?auto_11036 ?auto_11037 ) ) ( AVAILABLE ?auto_11040 ) ( ON ?auto_11036 ?auto_11035 ) ( not ( = ?auto_11035 ?auto_11036 ) ) ( not ( = ?auto_11035 ?auto_11037 ) ) ( TRUCK-AT ?auto_11043 ?auto_11041 ) ( not ( = ?auto_11041 ?auto_11042 ) ) ( HOIST-AT ?auto_11038 ?auto_11041 ) ( not ( = ?auto_11040 ?auto_11038 ) ) ( AVAILABLE ?auto_11038 ) ( SURFACE-AT ?auto_11037 ?auto_11041 ) ( ON ?auto_11037 ?auto_11039 ) ( CLEAR ?auto_11037 ) ( not ( = ?auto_11036 ?auto_11039 ) ) ( not ( = ?auto_11037 ?auto_11039 ) ) ( not ( = ?auto_11035 ?auto_11039 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11036 ?auto_11037 )
      ( MAKE-2CRATE-VERIFY ?auto_11035 ?auto_11036 ?auto_11037 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11044 - SURFACE
      ?auto_11045 - SURFACE
    )
    :vars
    (
      ?auto_11051 - HOIST
      ?auto_11048 - PLACE
      ?auto_11052 - SURFACE
      ?auto_11047 - PLACE
      ?auto_11046 - HOIST
      ?auto_11049 - SURFACE
      ?auto_11050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11051 ?auto_11048 ) ( SURFACE-AT ?auto_11044 ?auto_11048 ) ( CLEAR ?auto_11044 ) ( IS-CRATE ?auto_11045 ) ( not ( = ?auto_11044 ?auto_11045 ) ) ( AVAILABLE ?auto_11051 ) ( ON ?auto_11044 ?auto_11052 ) ( not ( = ?auto_11052 ?auto_11044 ) ) ( not ( = ?auto_11052 ?auto_11045 ) ) ( not ( = ?auto_11047 ?auto_11048 ) ) ( HOIST-AT ?auto_11046 ?auto_11047 ) ( not ( = ?auto_11051 ?auto_11046 ) ) ( AVAILABLE ?auto_11046 ) ( SURFACE-AT ?auto_11045 ?auto_11047 ) ( ON ?auto_11045 ?auto_11049 ) ( CLEAR ?auto_11045 ) ( not ( = ?auto_11044 ?auto_11049 ) ) ( not ( = ?auto_11045 ?auto_11049 ) ) ( not ( = ?auto_11052 ?auto_11049 ) ) ( TRUCK-AT ?auto_11050 ?auto_11048 ) )
    :subtasks
    ( ( !DRIVE ?auto_11050 ?auto_11048 ?auto_11047 )
      ( MAKE-2CRATE ?auto_11052 ?auto_11044 ?auto_11045 )
      ( MAKE-1CRATE-VERIFY ?auto_11044 ?auto_11045 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11053 - SURFACE
      ?auto_11054 - SURFACE
      ?auto_11055 - SURFACE
    )
    :vars
    (
      ?auto_11056 - HOIST
      ?auto_11061 - PLACE
      ?auto_11057 - PLACE
      ?auto_11059 - HOIST
      ?auto_11060 - SURFACE
      ?auto_11058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11056 ?auto_11061 ) ( SURFACE-AT ?auto_11054 ?auto_11061 ) ( CLEAR ?auto_11054 ) ( IS-CRATE ?auto_11055 ) ( not ( = ?auto_11054 ?auto_11055 ) ) ( AVAILABLE ?auto_11056 ) ( ON ?auto_11054 ?auto_11053 ) ( not ( = ?auto_11053 ?auto_11054 ) ) ( not ( = ?auto_11053 ?auto_11055 ) ) ( not ( = ?auto_11057 ?auto_11061 ) ) ( HOIST-AT ?auto_11059 ?auto_11057 ) ( not ( = ?auto_11056 ?auto_11059 ) ) ( AVAILABLE ?auto_11059 ) ( SURFACE-AT ?auto_11055 ?auto_11057 ) ( ON ?auto_11055 ?auto_11060 ) ( CLEAR ?auto_11055 ) ( not ( = ?auto_11054 ?auto_11060 ) ) ( not ( = ?auto_11055 ?auto_11060 ) ) ( not ( = ?auto_11053 ?auto_11060 ) ) ( TRUCK-AT ?auto_11058 ?auto_11061 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11054 ?auto_11055 )
      ( MAKE-2CRATE-VERIFY ?auto_11053 ?auto_11054 ?auto_11055 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11062 - SURFACE
      ?auto_11063 - SURFACE
    )
    :vars
    (
      ?auto_11067 - HOIST
      ?auto_11066 - PLACE
      ?auto_11068 - SURFACE
      ?auto_11070 - PLACE
      ?auto_11065 - HOIST
      ?auto_11064 - SURFACE
      ?auto_11069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11067 ?auto_11066 ) ( IS-CRATE ?auto_11063 ) ( not ( = ?auto_11062 ?auto_11063 ) ) ( not ( = ?auto_11068 ?auto_11062 ) ) ( not ( = ?auto_11068 ?auto_11063 ) ) ( not ( = ?auto_11070 ?auto_11066 ) ) ( HOIST-AT ?auto_11065 ?auto_11070 ) ( not ( = ?auto_11067 ?auto_11065 ) ) ( AVAILABLE ?auto_11065 ) ( SURFACE-AT ?auto_11063 ?auto_11070 ) ( ON ?auto_11063 ?auto_11064 ) ( CLEAR ?auto_11063 ) ( not ( = ?auto_11062 ?auto_11064 ) ) ( not ( = ?auto_11063 ?auto_11064 ) ) ( not ( = ?auto_11068 ?auto_11064 ) ) ( TRUCK-AT ?auto_11069 ?auto_11066 ) ( SURFACE-AT ?auto_11068 ?auto_11066 ) ( CLEAR ?auto_11068 ) ( LIFTING ?auto_11067 ?auto_11062 ) ( IS-CRATE ?auto_11062 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11068 ?auto_11062 )
      ( MAKE-2CRATE ?auto_11068 ?auto_11062 ?auto_11063 )
      ( MAKE-1CRATE-VERIFY ?auto_11062 ?auto_11063 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11071 - SURFACE
      ?auto_11072 - SURFACE
      ?auto_11073 - SURFACE
    )
    :vars
    (
      ?auto_11074 - HOIST
      ?auto_11077 - PLACE
      ?auto_11079 - PLACE
      ?auto_11078 - HOIST
      ?auto_11075 - SURFACE
      ?auto_11076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11074 ?auto_11077 ) ( IS-CRATE ?auto_11073 ) ( not ( = ?auto_11072 ?auto_11073 ) ) ( not ( = ?auto_11071 ?auto_11072 ) ) ( not ( = ?auto_11071 ?auto_11073 ) ) ( not ( = ?auto_11079 ?auto_11077 ) ) ( HOIST-AT ?auto_11078 ?auto_11079 ) ( not ( = ?auto_11074 ?auto_11078 ) ) ( AVAILABLE ?auto_11078 ) ( SURFACE-AT ?auto_11073 ?auto_11079 ) ( ON ?auto_11073 ?auto_11075 ) ( CLEAR ?auto_11073 ) ( not ( = ?auto_11072 ?auto_11075 ) ) ( not ( = ?auto_11073 ?auto_11075 ) ) ( not ( = ?auto_11071 ?auto_11075 ) ) ( TRUCK-AT ?auto_11076 ?auto_11077 ) ( SURFACE-AT ?auto_11071 ?auto_11077 ) ( CLEAR ?auto_11071 ) ( LIFTING ?auto_11074 ?auto_11072 ) ( IS-CRATE ?auto_11072 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11072 ?auto_11073 )
      ( MAKE-2CRATE-VERIFY ?auto_11071 ?auto_11072 ?auto_11073 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11080 - SURFACE
      ?auto_11081 - SURFACE
    )
    :vars
    (
      ?auto_11084 - HOIST
      ?auto_11082 - PLACE
      ?auto_11085 - SURFACE
      ?auto_11088 - PLACE
      ?auto_11086 - HOIST
      ?auto_11087 - SURFACE
      ?auto_11083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11084 ?auto_11082 ) ( IS-CRATE ?auto_11081 ) ( not ( = ?auto_11080 ?auto_11081 ) ) ( not ( = ?auto_11085 ?auto_11080 ) ) ( not ( = ?auto_11085 ?auto_11081 ) ) ( not ( = ?auto_11088 ?auto_11082 ) ) ( HOIST-AT ?auto_11086 ?auto_11088 ) ( not ( = ?auto_11084 ?auto_11086 ) ) ( AVAILABLE ?auto_11086 ) ( SURFACE-AT ?auto_11081 ?auto_11088 ) ( ON ?auto_11081 ?auto_11087 ) ( CLEAR ?auto_11081 ) ( not ( = ?auto_11080 ?auto_11087 ) ) ( not ( = ?auto_11081 ?auto_11087 ) ) ( not ( = ?auto_11085 ?auto_11087 ) ) ( TRUCK-AT ?auto_11083 ?auto_11082 ) ( SURFACE-AT ?auto_11085 ?auto_11082 ) ( CLEAR ?auto_11085 ) ( IS-CRATE ?auto_11080 ) ( AVAILABLE ?auto_11084 ) ( IN ?auto_11080 ?auto_11083 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11084 ?auto_11080 ?auto_11083 ?auto_11082 )
      ( MAKE-2CRATE ?auto_11085 ?auto_11080 ?auto_11081 )
      ( MAKE-1CRATE-VERIFY ?auto_11080 ?auto_11081 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11089 - SURFACE
      ?auto_11090 - SURFACE
      ?auto_11091 - SURFACE
    )
    :vars
    (
      ?auto_11094 - HOIST
      ?auto_11096 - PLACE
      ?auto_11092 - PLACE
      ?auto_11095 - HOIST
      ?auto_11093 - SURFACE
      ?auto_11097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11094 ?auto_11096 ) ( IS-CRATE ?auto_11091 ) ( not ( = ?auto_11090 ?auto_11091 ) ) ( not ( = ?auto_11089 ?auto_11090 ) ) ( not ( = ?auto_11089 ?auto_11091 ) ) ( not ( = ?auto_11092 ?auto_11096 ) ) ( HOIST-AT ?auto_11095 ?auto_11092 ) ( not ( = ?auto_11094 ?auto_11095 ) ) ( AVAILABLE ?auto_11095 ) ( SURFACE-AT ?auto_11091 ?auto_11092 ) ( ON ?auto_11091 ?auto_11093 ) ( CLEAR ?auto_11091 ) ( not ( = ?auto_11090 ?auto_11093 ) ) ( not ( = ?auto_11091 ?auto_11093 ) ) ( not ( = ?auto_11089 ?auto_11093 ) ) ( TRUCK-AT ?auto_11097 ?auto_11096 ) ( SURFACE-AT ?auto_11089 ?auto_11096 ) ( CLEAR ?auto_11089 ) ( IS-CRATE ?auto_11090 ) ( AVAILABLE ?auto_11094 ) ( IN ?auto_11090 ?auto_11097 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11090 ?auto_11091 )
      ( MAKE-2CRATE-VERIFY ?auto_11089 ?auto_11090 ?auto_11091 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11134 - SURFACE
      ?auto_11135 - SURFACE
    )
    :vars
    (
      ?auto_11140 - HOIST
      ?auto_11138 - PLACE
      ?auto_11139 - SURFACE
      ?auto_11137 - PLACE
      ?auto_11136 - HOIST
      ?auto_11142 - SURFACE
      ?auto_11141 - TRUCK
      ?auto_11143 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11140 ?auto_11138 ) ( SURFACE-AT ?auto_11134 ?auto_11138 ) ( CLEAR ?auto_11134 ) ( IS-CRATE ?auto_11135 ) ( not ( = ?auto_11134 ?auto_11135 ) ) ( AVAILABLE ?auto_11140 ) ( ON ?auto_11134 ?auto_11139 ) ( not ( = ?auto_11139 ?auto_11134 ) ) ( not ( = ?auto_11139 ?auto_11135 ) ) ( not ( = ?auto_11137 ?auto_11138 ) ) ( HOIST-AT ?auto_11136 ?auto_11137 ) ( not ( = ?auto_11140 ?auto_11136 ) ) ( AVAILABLE ?auto_11136 ) ( SURFACE-AT ?auto_11135 ?auto_11137 ) ( ON ?auto_11135 ?auto_11142 ) ( CLEAR ?auto_11135 ) ( not ( = ?auto_11134 ?auto_11142 ) ) ( not ( = ?auto_11135 ?auto_11142 ) ) ( not ( = ?auto_11139 ?auto_11142 ) ) ( TRUCK-AT ?auto_11141 ?auto_11143 ) ( not ( = ?auto_11143 ?auto_11138 ) ) ( not ( = ?auto_11137 ?auto_11143 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11141 ?auto_11143 ?auto_11138 )
      ( MAKE-1CRATE ?auto_11134 ?auto_11135 )
      ( MAKE-1CRATE-VERIFY ?auto_11134 ?auto_11135 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11173 - SURFACE
      ?auto_11174 - SURFACE
      ?auto_11175 - SURFACE
      ?auto_11176 - SURFACE
    )
    :vars
    (
      ?auto_11177 - HOIST
      ?auto_11178 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11177 ?auto_11178 ) ( SURFACE-AT ?auto_11175 ?auto_11178 ) ( CLEAR ?auto_11175 ) ( LIFTING ?auto_11177 ?auto_11176 ) ( IS-CRATE ?auto_11176 ) ( not ( = ?auto_11175 ?auto_11176 ) ) ( ON ?auto_11174 ?auto_11173 ) ( ON ?auto_11175 ?auto_11174 ) ( not ( = ?auto_11173 ?auto_11174 ) ) ( not ( = ?auto_11173 ?auto_11175 ) ) ( not ( = ?auto_11173 ?auto_11176 ) ) ( not ( = ?auto_11174 ?auto_11175 ) ) ( not ( = ?auto_11174 ?auto_11176 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11175 ?auto_11176 )
      ( MAKE-3CRATE-VERIFY ?auto_11173 ?auto_11174 ?auto_11175 ?auto_11176 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11190 - SURFACE
      ?auto_11191 - SURFACE
      ?auto_11192 - SURFACE
      ?auto_11193 - SURFACE
    )
    :vars
    (
      ?auto_11196 - HOIST
      ?auto_11195 - PLACE
      ?auto_11194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11196 ?auto_11195 ) ( SURFACE-AT ?auto_11192 ?auto_11195 ) ( CLEAR ?auto_11192 ) ( IS-CRATE ?auto_11193 ) ( not ( = ?auto_11192 ?auto_11193 ) ) ( TRUCK-AT ?auto_11194 ?auto_11195 ) ( AVAILABLE ?auto_11196 ) ( IN ?auto_11193 ?auto_11194 ) ( ON ?auto_11192 ?auto_11191 ) ( not ( = ?auto_11191 ?auto_11192 ) ) ( not ( = ?auto_11191 ?auto_11193 ) ) ( ON ?auto_11191 ?auto_11190 ) ( not ( = ?auto_11190 ?auto_11191 ) ) ( not ( = ?auto_11190 ?auto_11192 ) ) ( not ( = ?auto_11190 ?auto_11193 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11191 ?auto_11192 ?auto_11193 )
      ( MAKE-3CRATE-VERIFY ?auto_11190 ?auto_11191 ?auto_11192 ?auto_11193 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11211 - SURFACE
      ?auto_11212 - SURFACE
      ?auto_11213 - SURFACE
      ?auto_11214 - SURFACE
    )
    :vars
    (
      ?auto_11216 - HOIST
      ?auto_11217 - PLACE
      ?auto_11218 - TRUCK
      ?auto_11215 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11216 ?auto_11217 ) ( SURFACE-AT ?auto_11213 ?auto_11217 ) ( CLEAR ?auto_11213 ) ( IS-CRATE ?auto_11214 ) ( not ( = ?auto_11213 ?auto_11214 ) ) ( AVAILABLE ?auto_11216 ) ( IN ?auto_11214 ?auto_11218 ) ( ON ?auto_11213 ?auto_11212 ) ( not ( = ?auto_11212 ?auto_11213 ) ) ( not ( = ?auto_11212 ?auto_11214 ) ) ( TRUCK-AT ?auto_11218 ?auto_11215 ) ( not ( = ?auto_11215 ?auto_11217 ) ) ( ON ?auto_11212 ?auto_11211 ) ( not ( = ?auto_11211 ?auto_11212 ) ) ( not ( = ?auto_11211 ?auto_11213 ) ) ( not ( = ?auto_11211 ?auto_11214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11212 ?auto_11213 ?auto_11214 )
      ( MAKE-3CRATE-VERIFY ?auto_11211 ?auto_11212 ?auto_11213 ?auto_11214 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11235 - SURFACE
      ?auto_11236 - SURFACE
      ?auto_11237 - SURFACE
      ?auto_11238 - SURFACE
    )
    :vars
    (
      ?auto_11240 - HOIST
      ?auto_11241 - PLACE
      ?auto_11239 - TRUCK
      ?auto_11242 - PLACE
      ?auto_11243 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11240 ?auto_11241 ) ( SURFACE-AT ?auto_11237 ?auto_11241 ) ( CLEAR ?auto_11237 ) ( IS-CRATE ?auto_11238 ) ( not ( = ?auto_11237 ?auto_11238 ) ) ( AVAILABLE ?auto_11240 ) ( ON ?auto_11237 ?auto_11236 ) ( not ( = ?auto_11236 ?auto_11237 ) ) ( not ( = ?auto_11236 ?auto_11238 ) ) ( TRUCK-AT ?auto_11239 ?auto_11242 ) ( not ( = ?auto_11242 ?auto_11241 ) ) ( HOIST-AT ?auto_11243 ?auto_11242 ) ( LIFTING ?auto_11243 ?auto_11238 ) ( not ( = ?auto_11240 ?auto_11243 ) ) ( ON ?auto_11236 ?auto_11235 ) ( not ( = ?auto_11235 ?auto_11236 ) ) ( not ( = ?auto_11235 ?auto_11237 ) ) ( not ( = ?auto_11235 ?auto_11238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11236 ?auto_11237 ?auto_11238 )
      ( MAKE-3CRATE-VERIFY ?auto_11235 ?auto_11236 ?auto_11237 ?auto_11238 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11262 - SURFACE
      ?auto_11263 - SURFACE
      ?auto_11264 - SURFACE
      ?auto_11265 - SURFACE
    )
    :vars
    (
      ?auto_11266 - HOIST
      ?auto_11267 - PLACE
      ?auto_11270 - TRUCK
      ?auto_11271 - PLACE
      ?auto_11269 - HOIST
      ?auto_11268 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11266 ?auto_11267 ) ( SURFACE-AT ?auto_11264 ?auto_11267 ) ( CLEAR ?auto_11264 ) ( IS-CRATE ?auto_11265 ) ( not ( = ?auto_11264 ?auto_11265 ) ) ( AVAILABLE ?auto_11266 ) ( ON ?auto_11264 ?auto_11263 ) ( not ( = ?auto_11263 ?auto_11264 ) ) ( not ( = ?auto_11263 ?auto_11265 ) ) ( TRUCK-AT ?auto_11270 ?auto_11271 ) ( not ( = ?auto_11271 ?auto_11267 ) ) ( HOIST-AT ?auto_11269 ?auto_11271 ) ( not ( = ?auto_11266 ?auto_11269 ) ) ( AVAILABLE ?auto_11269 ) ( SURFACE-AT ?auto_11265 ?auto_11271 ) ( ON ?auto_11265 ?auto_11268 ) ( CLEAR ?auto_11265 ) ( not ( = ?auto_11264 ?auto_11268 ) ) ( not ( = ?auto_11265 ?auto_11268 ) ) ( not ( = ?auto_11263 ?auto_11268 ) ) ( ON ?auto_11263 ?auto_11262 ) ( not ( = ?auto_11262 ?auto_11263 ) ) ( not ( = ?auto_11262 ?auto_11264 ) ) ( not ( = ?auto_11262 ?auto_11265 ) ) ( not ( = ?auto_11262 ?auto_11268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11263 ?auto_11264 ?auto_11265 )
      ( MAKE-3CRATE-VERIFY ?auto_11262 ?auto_11263 ?auto_11264 ?auto_11265 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11290 - SURFACE
      ?auto_11291 - SURFACE
      ?auto_11292 - SURFACE
      ?auto_11293 - SURFACE
    )
    :vars
    (
      ?auto_11296 - HOIST
      ?auto_11298 - PLACE
      ?auto_11299 - PLACE
      ?auto_11295 - HOIST
      ?auto_11297 - SURFACE
      ?auto_11294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11296 ?auto_11298 ) ( SURFACE-AT ?auto_11292 ?auto_11298 ) ( CLEAR ?auto_11292 ) ( IS-CRATE ?auto_11293 ) ( not ( = ?auto_11292 ?auto_11293 ) ) ( AVAILABLE ?auto_11296 ) ( ON ?auto_11292 ?auto_11291 ) ( not ( = ?auto_11291 ?auto_11292 ) ) ( not ( = ?auto_11291 ?auto_11293 ) ) ( not ( = ?auto_11299 ?auto_11298 ) ) ( HOIST-AT ?auto_11295 ?auto_11299 ) ( not ( = ?auto_11296 ?auto_11295 ) ) ( AVAILABLE ?auto_11295 ) ( SURFACE-AT ?auto_11293 ?auto_11299 ) ( ON ?auto_11293 ?auto_11297 ) ( CLEAR ?auto_11293 ) ( not ( = ?auto_11292 ?auto_11297 ) ) ( not ( = ?auto_11293 ?auto_11297 ) ) ( not ( = ?auto_11291 ?auto_11297 ) ) ( TRUCK-AT ?auto_11294 ?auto_11298 ) ( ON ?auto_11291 ?auto_11290 ) ( not ( = ?auto_11290 ?auto_11291 ) ) ( not ( = ?auto_11290 ?auto_11292 ) ) ( not ( = ?auto_11290 ?auto_11293 ) ) ( not ( = ?auto_11290 ?auto_11297 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11291 ?auto_11292 ?auto_11293 )
      ( MAKE-3CRATE-VERIFY ?auto_11290 ?auto_11291 ?auto_11292 ?auto_11293 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11318 - SURFACE
      ?auto_11319 - SURFACE
      ?auto_11320 - SURFACE
      ?auto_11321 - SURFACE
    )
    :vars
    (
      ?auto_11327 - HOIST
      ?auto_11323 - PLACE
      ?auto_11324 - PLACE
      ?auto_11326 - HOIST
      ?auto_11322 - SURFACE
      ?auto_11325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11327 ?auto_11323 ) ( IS-CRATE ?auto_11321 ) ( not ( = ?auto_11320 ?auto_11321 ) ) ( not ( = ?auto_11319 ?auto_11320 ) ) ( not ( = ?auto_11319 ?auto_11321 ) ) ( not ( = ?auto_11324 ?auto_11323 ) ) ( HOIST-AT ?auto_11326 ?auto_11324 ) ( not ( = ?auto_11327 ?auto_11326 ) ) ( AVAILABLE ?auto_11326 ) ( SURFACE-AT ?auto_11321 ?auto_11324 ) ( ON ?auto_11321 ?auto_11322 ) ( CLEAR ?auto_11321 ) ( not ( = ?auto_11320 ?auto_11322 ) ) ( not ( = ?auto_11321 ?auto_11322 ) ) ( not ( = ?auto_11319 ?auto_11322 ) ) ( TRUCK-AT ?auto_11325 ?auto_11323 ) ( SURFACE-AT ?auto_11319 ?auto_11323 ) ( CLEAR ?auto_11319 ) ( LIFTING ?auto_11327 ?auto_11320 ) ( IS-CRATE ?auto_11320 ) ( ON ?auto_11319 ?auto_11318 ) ( not ( = ?auto_11318 ?auto_11319 ) ) ( not ( = ?auto_11318 ?auto_11320 ) ) ( not ( = ?auto_11318 ?auto_11321 ) ) ( not ( = ?auto_11318 ?auto_11322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11319 ?auto_11320 ?auto_11321 )
      ( MAKE-3CRATE-VERIFY ?auto_11318 ?auto_11319 ?auto_11320 ?auto_11321 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11346 - SURFACE
      ?auto_11347 - SURFACE
      ?auto_11348 - SURFACE
      ?auto_11349 - SURFACE
    )
    :vars
    (
      ?auto_11352 - HOIST
      ?auto_11353 - PLACE
      ?auto_11350 - PLACE
      ?auto_11354 - HOIST
      ?auto_11355 - SURFACE
      ?auto_11351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11352 ?auto_11353 ) ( IS-CRATE ?auto_11349 ) ( not ( = ?auto_11348 ?auto_11349 ) ) ( not ( = ?auto_11347 ?auto_11348 ) ) ( not ( = ?auto_11347 ?auto_11349 ) ) ( not ( = ?auto_11350 ?auto_11353 ) ) ( HOIST-AT ?auto_11354 ?auto_11350 ) ( not ( = ?auto_11352 ?auto_11354 ) ) ( AVAILABLE ?auto_11354 ) ( SURFACE-AT ?auto_11349 ?auto_11350 ) ( ON ?auto_11349 ?auto_11355 ) ( CLEAR ?auto_11349 ) ( not ( = ?auto_11348 ?auto_11355 ) ) ( not ( = ?auto_11349 ?auto_11355 ) ) ( not ( = ?auto_11347 ?auto_11355 ) ) ( TRUCK-AT ?auto_11351 ?auto_11353 ) ( SURFACE-AT ?auto_11347 ?auto_11353 ) ( CLEAR ?auto_11347 ) ( IS-CRATE ?auto_11348 ) ( AVAILABLE ?auto_11352 ) ( IN ?auto_11348 ?auto_11351 ) ( ON ?auto_11347 ?auto_11346 ) ( not ( = ?auto_11346 ?auto_11347 ) ) ( not ( = ?auto_11346 ?auto_11348 ) ) ( not ( = ?auto_11346 ?auto_11349 ) ) ( not ( = ?auto_11346 ?auto_11355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11347 ?auto_11348 ?auto_11349 )
      ( MAKE-3CRATE-VERIFY ?auto_11346 ?auto_11347 ?auto_11348 ?auto_11349 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11637 - SURFACE
      ?auto_11638 - SURFACE
      ?auto_11639 - SURFACE
      ?auto_11640 - SURFACE
      ?auto_11641 - SURFACE
    )
    :vars
    (
      ?auto_11643 - HOIST
      ?auto_11642 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11643 ?auto_11642 ) ( SURFACE-AT ?auto_11640 ?auto_11642 ) ( CLEAR ?auto_11640 ) ( LIFTING ?auto_11643 ?auto_11641 ) ( IS-CRATE ?auto_11641 ) ( not ( = ?auto_11640 ?auto_11641 ) ) ( ON ?auto_11638 ?auto_11637 ) ( ON ?auto_11639 ?auto_11638 ) ( ON ?auto_11640 ?auto_11639 ) ( not ( = ?auto_11637 ?auto_11638 ) ) ( not ( = ?auto_11637 ?auto_11639 ) ) ( not ( = ?auto_11637 ?auto_11640 ) ) ( not ( = ?auto_11637 ?auto_11641 ) ) ( not ( = ?auto_11638 ?auto_11639 ) ) ( not ( = ?auto_11638 ?auto_11640 ) ) ( not ( = ?auto_11638 ?auto_11641 ) ) ( not ( = ?auto_11639 ?auto_11640 ) ) ( not ( = ?auto_11639 ?auto_11641 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11640 ?auto_11641 )
      ( MAKE-4CRATE-VERIFY ?auto_11637 ?auto_11638 ?auto_11639 ?auto_11640 ?auto_11641 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11662 - SURFACE
      ?auto_11663 - SURFACE
      ?auto_11664 - SURFACE
      ?auto_11665 - SURFACE
      ?auto_11666 - SURFACE
    )
    :vars
    (
      ?auto_11668 - HOIST
      ?auto_11669 - PLACE
      ?auto_11667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11668 ?auto_11669 ) ( SURFACE-AT ?auto_11665 ?auto_11669 ) ( CLEAR ?auto_11665 ) ( IS-CRATE ?auto_11666 ) ( not ( = ?auto_11665 ?auto_11666 ) ) ( TRUCK-AT ?auto_11667 ?auto_11669 ) ( AVAILABLE ?auto_11668 ) ( IN ?auto_11666 ?auto_11667 ) ( ON ?auto_11665 ?auto_11664 ) ( not ( = ?auto_11664 ?auto_11665 ) ) ( not ( = ?auto_11664 ?auto_11666 ) ) ( ON ?auto_11663 ?auto_11662 ) ( ON ?auto_11664 ?auto_11663 ) ( not ( = ?auto_11662 ?auto_11663 ) ) ( not ( = ?auto_11662 ?auto_11664 ) ) ( not ( = ?auto_11662 ?auto_11665 ) ) ( not ( = ?auto_11662 ?auto_11666 ) ) ( not ( = ?auto_11663 ?auto_11664 ) ) ( not ( = ?auto_11663 ?auto_11665 ) ) ( not ( = ?auto_11663 ?auto_11666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11664 ?auto_11665 ?auto_11666 )
      ( MAKE-4CRATE-VERIFY ?auto_11662 ?auto_11663 ?auto_11664 ?auto_11665 ?auto_11666 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11692 - SURFACE
      ?auto_11693 - SURFACE
      ?auto_11694 - SURFACE
      ?auto_11695 - SURFACE
      ?auto_11696 - SURFACE
    )
    :vars
    (
      ?auto_11700 - HOIST
      ?auto_11699 - PLACE
      ?auto_11698 - TRUCK
      ?auto_11697 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11700 ?auto_11699 ) ( SURFACE-AT ?auto_11695 ?auto_11699 ) ( CLEAR ?auto_11695 ) ( IS-CRATE ?auto_11696 ) ( not ( = ?auto_11695 ?auto_11696 ) ) ( AVAILABLE ?auto_11700 ) ( IN ?auto_11696 ?auto_11698 ) ( ON ?auto_11695 ?auto_11694 ) ( not ( = ?auto_11694 ?auto_11695 ) ) ( not ( = ?auto_11694 ?auto_11696 ) ) ( TRUCK-AT ?auto_11698 ?auto_11697 ) ( not ( = ?auto_11697 ?auto_11699 ) ) ( ON ?auto_11693 ?auto_11692 ) ( ON ?auto_11694 ?auto_11693 ) ( not ( = ?auto_11692 ?auto_11693 ) ) ( not ( = ?auto_11692 ?auto_11694 ) ) ( not ( = ?auto_11692 ?auto_11695 ) ) ( not ( = ?auto_11692 ?auto_11696 ) ) ( not ( = ?auto_11693 ?auto_11694 ) ) ( not ( = ?auto_11693 ?auto_11695 ) ) ( not ( = ?auto_11693 ?auto_11696 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11694 ?auto_11695 ?auto_11696 )
      ( MAKE-4CRATE-VERIFY ?auto_11692 ?auto_11693 ?auto_11694 ?auto_11695 ?auto_11696 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11726 - SURFACE
      ?auto_11727 - SURFACE
      ?auto_11728 - SURFACE
      ?auto_11729 - SURFACE
      ?auto_11730 - SURFACE
    )
    :vars
    (
      ?auto_11731 - HOIST
      ?auto_11732 - PLACE
      ?auto_11734 - TRUCK
      ?auto_11733 - PLACE
      ?auto_11735 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11731 ?auto_11732 ) ( SURFACE-AT ?auto_11729 ?auto_11732 ) ( CLEAR ?auto_11729 ) ( IS-CRATE ?auto_11730 ) ( not ( = ?auto_11729 ?auto_11730 ) ) ( AVAILABLE ?auto_11731 ) ( ON ?auto_11729 ?auto_11728 ) ( not ( = ?auto_11728 ?auto_11729 ) ) ( not ( = ?auto_11728 ?auto_11730 ) ) ( TRUCK-AT ?auto_11734 ?auto_11733 ) ( not ( = ?auto_11733 ?auto_11732 ) ) ( HOIST-AT ?auto_11735 ?auto_11733 ) ( LIFTING ?auto_11735 ?auto_11730 ) ( not ( = ?auto_11731 ?auto_11735 ) ) ( ON ?auto_11727 ?auto_11726 ) ( ON ?auto_11728 ?auto_11727 ) ( not ( = ?auto_11726 ?auto_11727 ) ) ( not ( = ?auto_11726 ?auto_11728 ) ) ( not ( = ?auto_11726 ?auto_11729 ) ) ( not ( = ?auto_11726 ?auto_11730 ) ) ( not ( = ?auto_11727 ?auto_11728 ) ) ( not ( = ?auto_11727 ?auto_11729 ) ) ( not ( = ?auto_11727 ?auto_11730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11728 ?auto_11729 ?auto_11730 )
      ( MAKE-4CRATE-VERIFY ?auto_11726 ?auto_11727 ?auto_11728 ?auto_11729 ?auto_11730 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11764 - SURFACE
      ?auto_11765 - SURFACE
      ?auto_11766 - SURFACE
      ?auto_11767 - SURFACE
      ?auto_11768 - SURFACE
    )
    :vars
    (
      ?auto_11773 - HOIST
      ?auto_11770 - PLACE
      ?auto_11769 - TRUCK
      ?auto_11771 - PLACE
      ?auto_11774 - HOIST
      ?auto_11772 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11773 ?auto_11770 ) ( SURFACE-AT ?auto_11767 ?auto_11770 ) ( CLEAR ?auto_11767 ) ( IS-CRATE ?auto_11768 ) ( not ( = ?auto_11767 ?auto_11768 ) ) ( AVAILABLE ?auto_11773 ) ( ON ?auto_11767 ?auto_11766 ) ( not ( = ?auto_11766 ?auto_11767 ) ) ( not ( = ?auto_11766 ?auto_11768 ) ) ( TRUCK-AT ?auto_11769 ?auto_11771 ) ( not ( = ?auto_11771 ?auto_11770 ) ) ( HOIST-AT ?auto_11774 ?auto_11771 ) ( not ( = ?auto_11773 ?auto_11774 ) ) ( AVAILABLE ?auto_11774 ) ( SURFACE-AT ?auto_11768 ?auto_11771 ) ( ON ?auto_11768 ?auto_11772 ) ( CLEAR ?auto_11768 ) ( not ( = ?auto_11767 ?auto_11772 ) ) ( not ( = ?auto_11768 ?auto_11772 ) ) ( not ( = ?auto_11766 ?auto_11772 ) ) ( ON ?auto_11765 ?auto_11764 ) ( ON ?auto_11766 ?auto_11765 ) ( not ( = ?auto_11764 ?auto_11765 ) ) ( not ( = ?auto_11764 ?auto_11766 ) ) ( not ( = ?auto_11764 ?auto_11767 ) ) ( not ( = ?auto_11764 ?auto_11768 ) ) ( not ( = ?auto_11764 ?auto_11772 ) ) ( not ( = ?auto_11765 ?auto_11766 ) ) ( not ( = ?auto_11765 ?auto_11767 ) ) ( not ( = ?auto_11765 ?auto_11768 ) ) ( not ( = ?auto_11765 ?auto_11772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11766 ?auto_11767 ?auto_11768 )
      ( MAKE-4CRATE-VERIFY ?auto_11764 ?auto_11765 ?auto_11766 ?auto_11767 ?auto_11768 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11803 - SURFACE
      ?auto_11804 - SURFACE
      ?auto_11805 - SURFACE
      ?auto_11806 - SURFACE
      ?auto_11807 - SURFACE
    )
    :vars
    (
      ?auto_11808 - HOIST
      ?auto_11809 - PLACE
      ?auto_11811 - PLACE
      ?auto_11810 - HOIST
      ?auto_11812 - SURFACE
      ?auto_11813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11808 ?auto_11809 ) ( SURFACE-AT ?auto_11806 ?auto_11809 ) ( CLEAR ?auto_11806 ) ( IS-CRATE ?auto_11807 ) ( not ( = ?auto_11806 ?auto_11807 ) ) ( AVAILABLE ?auto_11808 ) ( ON ?auto_11806 ?auto_11805 ) ( not ( = ?auto_11805 ?auto_11806 ) ) ( not ( = ?auto_11805 ?auto_11807 ) ) ( not ( = ?auto_11811 ?auto_11809 ) ) ( HOIST-AT ?auto_11810 ?auto_11811 ) ( not ( = ?auto_11808 ?auto_11810 ) ) ( AVAILABLE ?auto_11810 ) ( SURFACE-AT ?auto_11807 ?auto_11811 ) ( ON ?auto_11807 ?auto_11812 ) ( CLEAR ?auto_11807 ) ( not ( = ?auto_11806 ?auto_11812 ) ) ( not ( = ?auto_11807 ?auto_11812 ) ) ( not ( = ?auto_11805 ?auto_11812 ) ) ( TRUCK-AT ?auto_11813 ?auto_11809 ) ( ON ?auto_11804 ?auto_11803 ) ( ON ?auto_11805 ?auto_11804 ) ( not ( = ?auto_11803 ?auto_11804 ) ) ( not ( = ?auto_11803 ?auto_11805 ) ) ( not ( = ?auto_11803 ?auto_11806 ) ) ( not ( = ?auto_11803 ?auto_11807 ) ) ( not ( = ?auto_11803 ?auto_11812 ) ) ( not ( = ?auto_11804 ?auto_11805 ) ) ( not ( = ?auto_11804 ?auto_11806 ) ) ( not ( = ?auto_11804 ?auto_11807 ) ) ( not ( = ?auto_11804 ?auto_11812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11805 ?auto_11806 ?auto_11807 )
      ( MAKE-4CRATE-VERIFY ?auto_11803 ?auto_11804 ?auto_11805 ?auto_11806 ?auto_11807 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11842 - SURFACE
      ?auto_11843 - SURFACE
      ?auto_11844 - SURFACE
      ?auto_11845 - SURFACE
      ?auto_11846 - SURFACE
    )
    :vars
    (
      ?auto_11851 - HOIST
      ?auto_11847 - PLACE
      ?auto_11850 - PLACE
      ?auto_11849 - HOIST
      ?auto_11852 - SURFACE
      ?auto_11848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11851 ?auto_11847 ) ( IS-CRATE ?auto_11846 ) ( not ( = ?auto_11845 ?auto_11846 ) ) ( not ( = ?auto_11844 ?auto_11845 ) ) ( not ( = ?auto_11844 ?auto_11846 ) ) ( not ( = ?auto_11850 ?auto_11847 ) ) ( HOIST-AT ?auto_11849 ?auto_11850 ) ( not ( = ?auto_11851 ?auto_11849 ) ) ( AVAILABLE ?auto_11849 ) ( SURFACE-AT ?auto_11846 ?auto_11850 ) ( ON ?auto_11846 ?auto_11852 ) ( CLEAR ?auto_11846 ) ( not ( = ?auto_11845 ?auto_11852 ) ) ( not ( = ?auto_11846 ?auto_11852 ) ) ( not ( = ?auto_11844 ?auto_11852 ) ) ( TRUCK-AT ?auto_11848 ?auto_11847 ) ( SURFACE-AT ?auto_11844 ?auto_11847 ) ( CLEAR ?auto_11844 ) ( LIFTING ?auto_11851 ?auto_11845 ) ( IS-CRATE ?auto_11845 ) ( ON ?auto_11843 ?auto_11842 ) ( ON ?auto_11844 ?auto_11843 ) ( not ( = ?auto_11842 ?auto_11843 ) ) ( not ( = ?auto_11842 ?auto_11844 ) ) ( not ( = ?auto_11842 ?auto_11845 ) ) ( not ( = ?auto_11842 ?auto_11846 ) ) ( not ( = ?auto_11842 ?auto_11852 ) ) ( not ( = ?auto_11843 ?auto_11844 ) ) ( not ( = ?auto_11843 ?auto_11845 ) ) ( not ( = ?auto_11843 ?auto_11846 ) ) ( not ( = ?auto_11843 ?auto_11852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11844 ?auto_11845 ?auto_11846 )
      ( MAKE-4CRATE-VERIFY ?auto_11842 ?auto_11843 ?auto_11844 ?auto_11845 ?auto_11846 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11881 - SURFACE
      ?auto_11882 - SURFACE
      ?auto_11883 - SURFACE
      ?auto_11884 - SURFACE
      ?auto_11885 - SURFACE
    )
    :vars
    (
      ?auto_11886 - HOIST
      ?auto_11889 - PLACE
      ?auto_11890 - PLACE
      ?auto_11888 - HOIST
      ?auto_11887 - SURFACE
      ?auto_11891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11886 ?auto_11889 ) ( IS-CRATE ?auto_11885 ) ( not ( = ?auto_11884 ?auto_11885 ) ) ( not ( = ?auto_11883 ?auto_11884 ) ) ( not ( = ?auto_11883 ?auto_11885 ) ) ( not ( = ?auto_11890 ?auto_11889 ) ) ( HOIST-AT ?auto_11888 ?auto_11890 ) ( not ( = ?auto_11886 ?auto_11888 ) ) ( AVAILABLE ?auto_11888 ) ( SURFACE-AT ?auto_11885 ?auto_11890 ) ( ON ?auto_11885 ?auto_11887 ) ( CLEAR ?auto_11885 ) ( not ( = ?auto_11884 ?auto_11887 ) ) ( not ( = ?auto_11885 ?auto_11887 ) ) ( not ( = ?auto_11883 ?auto_11887 ) ) ( TRUCK-AT ?auto_11891 ?auto_11889 ) ( SURFACE-AT ?auto_11883 ?auto_11889 ) ( CLEAR ?auto_11883 ) ( IS-CRATE ?auto_11884 ) ( AVAILABLE ?auto_11886 ) ( IN ?auto_11884 ?auto_11891 ) ( ON ?auto_11882 ?auto_11881 ) ( ON ?auto_11883 ?auto_11882 ) ( not ( = ?auto_11881 ?auto_11882 ) ) ( not ( = ?auto_11881 ?auto_11883 ) ) ( not ( = ?auto_11881 ?auto_11884 ) ) ( not ( = ?auto_11881 ?auto_11885 ) ) ( not ( = ?auto_11881 ?auto_11887 ) ) ( not ( = ?auto_11882 ?auto_11883 ) ) ( not ( = ?auto_11882 ?auto_11884 ) ) ( not ( = ?auto_11882 ?auto_11885 ) ) ( not ( = ?auto_11882 ?auto_11887 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11883 ?auto_11884 ?auto_11885 )
      ( MAKE-4CRATE-VERIFY ?auto_11881 ?auto_11882 ?auto_11883 ?auto_11884 ?auto_11885 ) )
  )

)

