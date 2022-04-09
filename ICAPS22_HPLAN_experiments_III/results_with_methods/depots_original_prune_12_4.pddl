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
      ?auto_794920 - SURFACE
      ?auto_794921 - SURFACE
    )
    :vars
    (
      ?auto_794922 - HOIST
      ?auto_794923 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794922 ?auto_794923 ) ( SURFACE-AT ?auto_794920 ?auto_794923 ) ( CLEAR ?auto_794920 ) ( LIFTING ?auto_794922 ?auto_794921 ) ( IS-CRATE ?auto_794921 ) ( not ( = ?auto_794920 ?auto_794921 ) ) )
    :subtasks
    ( ( !DROP ?auto_794922 ?auto_794921 ?auto_794920 ?auto_794923 )
      ( MAKE-1CRATE-VERIFY ?auto_794920 ?auto_794921 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794924 - SURFACE
      ?auto_794925 - SURFACE
    )
    :vars
    (
      ?auto_794926 - HOIST
      ?auto_794927 - PLACE
      ?auto_794928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794926 ?auto_794927 ) ( SURFACE-AT ?auto_794924 ?auto_794927 ) ( CLEAR ?auto_794924 ) ( IS-CRATE ?auto_794925 ) ( not ( = ?auto_794924 ?auto_794925 ) ) ( TRUCK-AT ?auto_794928 ?auto_794927 ) ( AVAILABLE ?auto_794926 ) ( IN ?auto_794925 ?auto_794928 ) )
    :subtasks
    ( ( !UNLOAD ?auto_794926 ?auto_794925 ?auto_794928 ?auto_794927 )
      ( MAKE-1CRATE ?auto_794924 ?auto_794925 )
      ( MAKE-1CRATE-VERIFY ?auto_794924 ?auto_794925 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794929 - SURFACE
      ?auto_794930 - SURFACE
    )
    :vars
    (
      ?auto_794932 - HOIST
      ?auto_794931 - PLACE
      ?auto_794933 - TRUCK
      ?auto_794934 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794932 ?auto_794931 ) ( SURFACE-AT ?auto_794929 ?auto_794931 ) ( CLEAR ?auto_794929 ) ( IS-CRATE ?auto_794930 ) ( not ( = ?auto_794929 ?auto_794930 ) ) ( AVAILABLE ?auto_794932 ) ( IN ?auto_794930 ?auto_794933 ) ( TRUCK-AT ?auto_794933 ?auto_794934 ) ( not ( = ?auto_794934 ?auto_794931 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_794933 ?auto_794934 ?auto_794931 )
      ( MAKE-1CRATE ?auto_794929 ?auto_794930 )
      ( MAKE-1CRATE-VERIFY ?auto_794929 ?auto_794930 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794935 - SURFACE
      ?auto_794936 - SURFACE
    )
    :vars
    (
      ?auto_794940 - HOIST
      ?auto_794937 - PLACE
      ?auto_794938 - TRUCK
      ?auto_794939 - PLACE
      ?auto_794941 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_794940 ?auto_794937 ) ( SURFACE-AT ?auto_794935 ?auto_794937 ) ( CLEAR ?auto_794935 ) ( IS-CRATE ?auto_794936 ) ( not ( = ?auto_794935 ?auto_794936 ) ) ( AVAILABLE ?auto_794940 ) ( TRUCK-AT ?auto_794938 ?auto_794939 ) ( not ( = ?auto_794939 ?auto_794937 ) ) ( HOIST-AT ?auto_794941 ?auto_794939 ) ( LIFTING ?auto_794941 ?auto_794936 ) ( not ( = ?auto_794940 ?auto_794941 ) ) )
    :subtasks
    ( ( !LOAD ?auto_794941 ?auto_794936 ?auto_794938 ?auto_794939 )
      ( MAKE-1CRATE ?auto_794935 ?auto_794936 )
      ( MAKE-1CRATE-VERIFY ?auto_794935 ?auto_794936 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794942 - SURFACE
      ?auto_794943 - SURFACE
    )
    :vars
    (
      ?auto_794946 - HOIST
      ?auto_794944 - PLACE
      ?auto_794947 - TRUCK
      ?auto_794945 - PLACE
      ?auto_794948 - HOIST
      ?auto_794949 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794946 ?auto_794944 ) ( SURFACE-AT ?auto_794942 ?auto_794944 ) ( CLEAR ?auto_794942 ) ( IS-CRATE ?auto_794943 ) ( not ( = ?auto_794942 ?auto_794943 ) ) ( AVAILABLE ?auto_794946 ) ( TRUCK-AT ?auto_794947 ?auto_794945 ) ( not ( = ?auto_794945 ?auto_794944 ) ) ( HOIST-AT ?auto_794948 ?auto_794945 ) ( not ( = ?auto_794946 ?auto_794948 ) ) ( AVAILABLE ?auto_794948 ) ( SURFACE-AT ?auto_794943 ?auto_794945 ) ( ON ?auto_794943 ?auto_794949 ) ( CLEAR ?auto_794943 ) ( not ( = ?auto_794942 ?auto_794949 ) ) ( not ( = ?auto_794943 ?auto_794949 ) ) )
    :subtasks
    ( ( !LIFT ?auto_794948 ?auto_794943 ?auto_794949 ?auto_794945 )
      ( MAKE-1CRATE ?auto_794942 ?auto_794943 )
      ( MAKE-1CRATE-VERIFY ?auto_794942 ?auto_794943 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794950 - SURFACE
      ?auto_794951 - SURFACE
    )
    :vars
    (
      ?auto_794954 - HOIST
      ?auto_794957 - PLACE
      ?auto_794953 - PLACE
      ?auto_794952 - HOIST
      ?auto_794956 - SURFACE
      ?auto_794955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794954 ?auto_794957 ) ( SURFACE-AT ?auto_794950 ?auto_794957 ) ( CLEAR ?auto_794950 ) ( IS-CRATE ?auto_794951 ) ( not ( = ?auto_794950 ?auto_794951 ) ) ( AVAILABLE ?auto_794954 ) ( not ( = ?auto_794953 ?auto_794957 ) ) ( HOIST-AT ?auto_794952 ?auto_794953 ) ( not ( = ?auto_794954 ?auto_794952 ) ) ( AVAILABLE ?auto_794952 ) ( SURFACE-AT ?auto_794951 ?auto_794953 ) ( ON ?auto_794951 ?auto_794956 ) ( CLEAR ?auto_794951 ) ( not ( = ?auto_794950 ?auto_794956 ) ) ( not ( = ?auto_794951 ?auto_794956 ) ) ( TRUCK-AT ?auto_794955 ?auto_794957 ) )
    :subtasks
    ( ( !DRIVE ?auto_794955 ?auto_794957 ?auto_794953 )
      ( MAKE-1CRATE ?auto_794950 ?auto_794951 )
      ( MAKE-1CRATE-VERIFY ?auto_794950 ?auto_794951 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_794967 - SURFACE
      ?auto_794968 - SURFACE
      ?auto_794969 - SURFACE
    )
    :vars
    (
      ?auto_794970 - HOIST
      ?auto_794971 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794970 ?auto_794971 ) ( SURFACE-AT ?auto_794968 ?auto_794971 ) ( CLEAR ?auto_794968 ) ( LIFTING ?auto_794970 ?auto_794969 ) ( IS-CRATE ?auto_794969 ) ( not ( = ?auto_794968 ?auto_794969 ) ) ( ON ?auto_794968 ?auto_794967 ) ( not ( = ?auto_794967 ?auto_794968 ) ) ( not ( = ?auto_794967 ?auto_794969 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794968 ?auto_794969 )
      ( MAKE-2CRATE-VERIFY ?auto_794967 ?auto_794968 ?auto_794969 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_794977 - SURFACE
      ?auto_794978 - SURFACE
      ?auto_794979 - SURFACE
    )
    :vars
    (
      ?auto_794982 - HOIST
      ?auto_794980 - PLACE
      ?auto_794981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794982 ?auto_794980 ) ( SURFACE-AT ?auto_794978 ?auto_794980 ) ( CLEAR ?auto_794978 ) ( IS-CRATE ?auto_794979 ) ( not ( = ?auto_794978 ?auto_794979 ) ) ( TRUCK-AT ?auto_794981 ?auto_794980 ) ( AVAILABLE ?auto_794982 ) ( IN ?auto_794979 ?auto_794981 ) ( ON ?auto_794978 ?auto_794977 ) ( not ( = ?auto_794977 ?auto_794978 ) ) ( not ( = ?auto_794977 ?auto_794979 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794978 ?auto_794979 )
      ( MAKE-2CRATE-VERIFY ?auto_794977 ?auto_794978 ?auto_794979 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794983 - SURFACE
      ?auto_794984 - SURFACE
    )
    :vars
    (
      ?auto_794985 - HOIST
      ?auto_794986 - PLACE
      ?auto_794987 - TRUCK
      ?auto_794988 - SURFACE
      ?auto_794989 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794985 ?auto_794986 ) ( SURFACE-AT ?auto_794983 ?auto_794986 ) ( CLEAR ?auto_794983 ) ( IS-CRATE ?auto_794984 ) ( not ( = ?auto_794983 ?auto_794984 ) ) ( AVAILABLE ?auto_794985 ) ( IN ?auto_794984 ?auto_794987 ) ( ON ?auto_794983 ?auto_794988 ) ( not ( = ?auto_794988 ?auto_794983 ) ) ( not ( = ?auto_794988 ?auto_794984 ) ) ( TRUCK-AT ?auto_794987 ?auto_794989 ) ( not ( = ?auto_794989 ?auto_794986 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_794987 ?auto_794989 ?auto_794986 )
      ( MAKE-2CRATE ?auto_794988 ?auto_794983 ?auto_794984 )
      ( MAKE-1CRATE-VERIFY ?auto_794983 ?auto_794984 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_794990 - SURFACE
      ?auto_794991 - SURFACE
      ?auto_794992 - SURFACE
    )
    :vars
    (
      ?auto_794995 - HOIST
      ?auto_794994 - PLACE
      ?auto_794993 - TRUCK
      ?auto_794996 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794995 ?auto_794994 ) ( SURFACE-AT ?auto_794991 ?auto_794994 ) ( CLEAR ?auto_794991 ) ( IS-CRATE ?auto_794992 ) ( not ( = ?auto_794991 ?auto_794992 ) ) ( AVAILABLE ?auto_794995 ) ( IN ?auto_794992 ?auto_794993 ) ( ON ?auto_794991 ?auto_794990 ) ( not ( = ?auto_794990 ?auto_794991 ) ) ( not ( = ?auto_794990 ?auto_794992 ) ) ( TRUCK-AT ?auto_794993 ?auto_794996 ) ( not ( = ?auto_794996 ?auto_794994 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794991 ?auto_794992 )
      ( MAKE-2CRATE-VERIFY ?auto_794990 ?auto_794991 ?auto_794992 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794997 - SURFACE
      ?auto_794998 - SURFACE
    )
    :vars
    (
      ?auto_794999 - HOIST
      ?auto_795001 - PLACE
      ?auto_795002 - SURFACE
      ?auto_795003 - TRUCK
      ?auto_795000 - PLACE
      ?auto_795004 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_794999 ?auto_795001 ) ( SURFACE-AT ?auto_794997 ?auto_795001 ) ( CLEAR ?auto_794997 ) ( IS-CRATE ?auto_794998 ) ( not ( = ?auto_794997 ?auto_794998 ) ) ( AVAILABLE ?auto_794999 ) ( ON ?auto_794997 ?auto_795002 ) ( not ( = ?auto_795002 ?auto_794997 ) ) ( not ( = ?auto_795002 ?auto_794998 ) ) ( TRUCK-AT ?auto_795003 ?auto_795000 ) ( not ( = ?auto_795000 ?auto_795001 ) ) ( HOIST-AT ?auto_795004 ?auto_795000 ) ( LIFTING ?auto_795004 ?auto_794998 ) ( not ( = ?auto_794999 ?auto_795004 ) ) )
    :subtasks
    ( ( !LOAD ?auto_795004 ?auto_794998 ?auto_795003 ?auto_795000 )
      ( MAKE-2CRATE ?auto_795002 ?auto_794997 ?auto_794998 )
      ( MAKE-1CRATE-VERIFY ?auto_794997 ?auto_794998 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_795005 - SURFACE
      ?auto_795006 - SURFACE
      ?auto_795007 - SURFACE
    )
    :vars
    (
      ?auto_795010 - HOIST
      ?auto_795008 - PLACE
      ?auto_795009 - TRUCK
      ?auto_795012 - PLACE
      ?auto_795011 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_795010 ?auto_795008 ) ( SURFACE-AT ?auto_795006 ?auto_795008 ) ( CLEAR ?auto_795006 ) ( IS-CRATE ?auto_795007 ) ( not ( = ?auto_795006 ?auto_795007 ) ) ( AVAILABLE ?auto_795010 ) ( ON ?auto_795006 ?auto_795005 ) ( not ( = ?auto_795005 ?auto_795006 ) ) ( not ( = ?auto_795005 ?auto_795007 ) ) ( TRUCK-AT ?auto_795009 ?auto_795012 ) ( not ( = ?auto_795012 ?auto_795008 ) ) ( HOIST-AT ?auto_795011 ?auto_795012 ) ( LIFTING ?auto_795011 ?auto_795007 ) ( not ( = ?auto_795010 ?auto_795011 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_795006 ?auto_795007 )
      ( MAKE-2CRATE-VERIFY ?auto_795005 ?auto_795006 ?auto_795007 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_795013 - SURFACE
      ?auto_795014 - SURFACE
    )
    :vars
    (
      ?auto_795017 - HOIST
      ?auto_795020 - PLACE
      ?auto_795018 - SURFACE
      ?auto_795019 - TRUCK
      ?auto_795016 - PLACE
      ?auto_795015 - HOIST
      ?auto_795021 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795017 ?auto_795020 ) ( SURFACE-AT ?auto_795013 ?auto_795020 ) ( CLEAR ?auto_795013 ) ( IS-CRATE ?auto_795014 ) ( not ( = ?auto_795013 ?auto_795014 ) ) ( AVAILABLE ?auto_795017 ) ( ON ?auto_795013 ?auto_795018 ) ( not ( = ?auto_795018 ?auto_795013 ) ) ( not ( = ?auto_795018 ?auto_795014 ) ) ( TRUCK-AT ?auto_795019 ?auto_795016 ) ( not ( = ?auto_795016 ?auto_795020 ) ) ( HOIST-AT ?auto_795015 ?auto_795016 ) ( not ( = ?auto_795017 ?auto_795015 ) ) ( AVAILABLE ?auto_795015 ) ( SURFACE-AT ?auto_795014 ?auto_795016 ) ( ON ?auto_795014 ?auto_795021 ) ( CLEAR ?auto_795014 ) ( not ( = ?auto_795013 ?auto_795021 ) ) ( not ( = ?auto_795014 ?auto_795021 ) ) ( not ( = ?auto_795018 ?auto_795021 ) ) )
    :subtasks
    ( ( !LIFT ?auto_795015 ?auto_795014 ?auto_795021 ?auto_795016 )
      ( MAKE-2CRATE ?auto_795018 ?auto_795013 ?auto_795014 )
      ( MAKE-1CRATE-VERIFY ?auto_795013 ?auto_795014 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_795022 - SURFACE
      ?auto_795023 - SURFACE
      ?auto_795024 - SURFACE
    )
    :vars
    (
      ?auto_795028 - HOIST
      ?auto_795027 - PLACE
      ?auto_795026 - TRUCK
      ?auto_795030 - PLACE
      ?auto_795029 - HOIST
      ?auto_795025 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795028 ?auto_795027 ) ( SURFACE-AT ?auto_795023 ?auto_795027 ) ( CLEAR ?auto_795023 ) ( IS-CRATE ?auto_795024 ) ( not ( = ?auto_795023 ?auto_795024 ) ) ( AVAILABLE ?auto_795028 ) ( ON ?auto_795023 ?auto_795022 ) ( not ( = ?auto_795022 ?auto_795023 ) ) ( not ( = ?auto_795022 ?auto_795024 ) ) ( TRUCK-AT ?auto_795026 ?auto_795030 ) ( not ( = ?auto_795030 ?auto_795027 ) ) ( HOIST-AT ?auto_795029 ?auto_795030 ) ( not ( = ?auto_795028 ?auto_795029 ) ) ( AVAILABLE ?auto_795029 ) ( SURFACE-AT ?auto_795024 ?auto_795030 ) ( ON ?auto_795024 ?auto_795025 ) ( CLEAR ?auto_795024 ) ( not ( = ?auto_795023 ?auto_795025 ) ) ( not ( = ?auto_795024 ?auto_795025 ) ) ( not ( = ?auto_795022 ?auto_795025 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_795023 ?auto_795024 )
      ( MAKE-2CRATE-VERIFY ?auto_795022 ?auto_795023 ?auto_795024 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_795031 - SURFACE
      ?auto_795032 - SURFACE
    )
    :vars
    (
      ?auto_795039 - HOIST
      ?auto_795038 - PLACE
      ?auto_795037 - SURFACE
      ?auto_795035 - PLACE
      ?auto_795034 - HOIST
      ?auto_795033 - SURFACE
      ?auto_795036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795039 ?auto_795038 ) ( SURFACE-AT ?auto_795031 ?auto_795038 ) ( CLEAR ?auto_795031 ) ( IS-CRATE ?auto_795032 ) ( not ( = ?auto_795031 ?auto_795032 ) ) ( AVAILABLE ?auto_795039 ) ( ON ?auto_795031 ?auto_795037 ) ( not ( = ?auto_795037 ?auto_795031 ) ) ( not ( = ?auto_795037 ?auto_795032 ) ) ( not ( = ?auto_795035 ?auto_795038 ) ) ( HOIST-AT ?auto_795034 ?auto_795035 ) ( not ( = ?auto_795039 ?auto_795034 ) ) ( AVAILABLE ?auto_795034 ) ( SURFACE-AT ?auto_795032 ?auto_795035 ) ( ON ?auto_795032 ?auto_795033 ) ( CLEAR ?auto_795032 ) ( not ( = ?auto_795031 ?auto_795033 ) ) ( not ( = ?auto_795032 ?auto_795033 ) ) ( not ( = ?auto_795037 ?auto_795033 ) ) ( TRUCK-AT ?auto_795036 ?auto_795038 ) )
    :subtasks
    ( ( !DRIVE ?auto_795036 ?auto_795038 ?auto_795035 )
      ( MAKE-2CRATE ?auto_795037 ?auto_795031 ?auto_795032 )
      ( MAKE-1CRATE-VERIFY ?auto_795031 ?auto_795032 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_795040 - SURFACE
      ?auto_795041 - SURFACE
      ?auto_795042 - SURFACE
    )
    :vars
    (
      ?auto_795043 - HOIST
      ?auto_795045 - PLACE
      ?auto_795048 - PLACE
      ?auto_795046 - HOIST
      ?auto_795044 - SURFACE
      ?auto_795047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795043 ?auto_795045 ) ( SURFACE-AT ?auto_795041 ?auto_795045 ) ( CLEAR ?auto_795041 ) ( IS-CRATE ?auto_795042 ) ( not ( = ?auto_795041 ?auto_795042 ) ) ( AVAILABLE ?auto_795043 ) ( ON ?auto_795041 ?auto_795040 ) ( not ( = ?auto_795040 ?auto_795041 ) ) ( not ( = ?auto_795040 ?auto_795042 ) ) ( not ( = ?auto_795048 ?auto_795045 ) ) ( HOIST-AT ?auto_795046 ?auto_795048 ) ( not ( = ?auto_795043 ?auto_795046 ) ) ( AVAILABLE ?auto_795046 ) ( SURFACE-AT ?auto_795042 ?auto_795048 ) ( ON ?auto_795042 ?auto_795044 ) ( CLEAR ?auto_795042 ) ( not ( = ?auto_795041 ?auto_795044 ) ) ( not ( = ?auto_795042 ?auto_795044 ) ) ( not ( = ?auto_795040 ?auto_795044 ) ) ( TRUCK-AT ?auto_795047 ?auto_795045 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_795041 ?auto_795042 )
      ( MAKE-2CRATE-VERIFY ?auto_795040 ?auto_795041 ?auto_795042 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_795049 - SURFACE
      ?auto_795050 - SURFACE
    )
    :vars
    (
      ?auto_795055 - HOIST
      ?auto_795057 - PLACE
      ?auto_795056 - SURFACE
      ?auto_795053 - PLACE
      ?auto_795051 - HOIST
      ?auto_795052 - SURFACE
      ?auto_795054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795055 ?auto_795057 ) ( IS-CRATE ?auto_795050 ) ( not ( = ?auto_795049 ?auto_795050 ) ) ( not ( = ?auto_795056 ?auto_795049 ) ) ( not ( = ?auto_795056 ?auto_795050 ) ) ( not ( = ?auto_795053 ?auto_795057 ) ) ( HOIST-AT ?auto_795051 ?auto_795053 ) ( not ( = ?auto_795055 ?auto_795051 ) ) ( AVAILABLE ?auto_795051 ) ( SURFACE-AT ?auto_795050 ?auto_795053 ) ( ON ?auto_795050 ?auto_795052 ) ( CLEAR ?auto_795050 ) ( not ( = ?auto_795049 ?auto_795052 ) ) ( not ( = ?auto_795050 ?auto_795052 ) ) ( not ( = ?auto_795056 ?auto_795052 ) ) ( TRUCK-AT ?auto_795054 ?auto_795057 ) ( SURFACE-AT ?auto_795056 ?auto_795057 ) ( CLEAR ?auto_795056 ) ( LIFTING ?auto_795055 ?auto_795049 ) ( IS-CRATE ?auto_795049 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_795056 ?auto_795049 )
      ( MAKE-2CRATE ?auto_795056 ?auto_795049 ?auto_795050 )
      ( MAKE-1CRATE-VERIFY ?auto_795049 ?auto_795050 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_795058 - SURFACE
      ?auto_795059 - SURFACE
      ?auto_795060 - SURFACE
    )
    :vars
    (
      ?auto_795063 - HOIST
      ?auto_795062 - PLACE
      ?auto_795065 - PLACE
      ?auto_795064 - HOIST
      ?auto_795066 - SURFACE
      ?auto_795061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795063 ?auto_795062 ) ( IS-CRATE ?auto_795060 ) ( not ( = ?auto_795059 ?auto_795060 ) ) ( not ( = ?auto_795058 ?auto_795059 ) ) ( not ( = ?auto_795058 ?auto_795060 ) ) ( not ( = ?auto_795065 ?auto_795062 ) ) ( HOIST-AT ?auto_795064 ?auto_795065 ) ( not ( = ?auto_795063 ?auto_795064 ) ) ( AVAILABLE ?auto_795064 ) ( SURFACE-AT ?auto_795060 ?auto_795065 ) ( ON ?auto_795060 ?auto_795066 ) ( CLEAR ?auto_795060 ) ( not ( = ?auto_795059 ?auto_795066 ) ) ( not ( = ?auto_795060 ?auto_795066 ) ) ( not ( = ?auto_795058 ?auto_795066 ) ) ( TRUCK-AT ?auto_795061 ?auto_795062 ) ( SURFACE-AT ?auto_795058 ?auto_795062 ) ( CLEAR ?auto_795058 ) ( LIFTING ?auto_795063 ?auto_795059 ) ( IS-CRATE ?auto_795059 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_795059 ?auto_795060 )
      ( MAKE-2CRATE-VERIFY ?auto_795058 ?auto_795059 ?auto_795060 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_795067 - SURFACE
      ?auto_795068 - SURFACE
    )
    :vars
    (
      ?auto_795074 - HOIST
      ?auto_795071 - PLACE
      ?auto_795070 - SURFACE
      ?auto_795075 - PLACE
      ?auto_795072 - HOIST
      ?auto_795073 - SURFACE
      ?auto_795069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795074 ?auto_795071 ) ( IS-CRATE ?auto_795068 ) ( not ( = ?auto_795067 ?auto_795068 ) ) ( not ( = ?auto_795070 ?auto_795067 ) ) ( not ( = ?auto_795070 ?auto_795068 ) ) ( not ( = ?auto_795075 ?auto_795071 ) ) ( HOIST-AT ?auto_795072 ?auto_795075 ) ( not ( = ?auto_795074 ?auto_795072 ) ) ( AVAILABLE ?auto_795072 ) ( SURFACE-AT ?auto_795068 ?auto_795075 ) ( ON ?auto_795068 ?auto_795073 ) ( CLEAR ?auto_795068 ) ( not ( = ?auto_795067 ?auto_795073 ) ) ( not ( = ?auto_795068 ?auto_795073 ) ) ( not ( = ?auto_795070 ?auto_795073 ) ) ( TRUCK-AT ?auto_795069 ?auto_795071 ) ( SURFACE-AT ?auto_795070 ?auto_795071 ) ( CLEAR ?auto_795070 ) ( IS-CRATE ?auto_795067 ) ( AVAILABLE ?auto_795074 ) ( IN ?auto_795067 ?auto_795069 ) )
    :subtasks
    ( ( !UNLOAD ?auto_795074 ?auto_795067 ?auto_795069 ?auto_795071 )
      ( MAKE-2CRATE ?auto_795070 ?auto_795067 ?auto_795068 )
      ( MAKE-1CRATE-VERIFY ?auto_795067 ?auto_795068 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_795076 - SURFACE
      ?auto_795077 - SURFACE
      ?auto_795078 - SURFACE
    )
    :vars
    (
      ?auto_795079 - HOIST
      ?auto_795082 - PLACE
      ?auto_795084 - PLACE
      ?auto_795083 - HOIST
      ?auto_795080 - SURFACE
      ?auto_795081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795079 ?auto_795082 ) ( IS-CRATE ?auto_795078 ) ( not ( = ?auto_795077 ?auto_795078 ) ) ( not ( = ?auto_795076 ?auto_795077 ) ) ( not ( = ?auto_795076 ?auto_795078 ) ) ( not ( = ?auto_795084 ?auto_795082 ) ) ( HOIST-AT ?auto_795083 ?auto_795084 ) ( not ( = ?auto_795079 ?auto_795083 ) ) ( AVAILABLE ?auto_795083 ) ( SURFACE-AT ?auto_795078 ?auto_795084 ) ( ON ?auto_795078 ?auto_795080 ) ( CLEAR ?auto_795078 ) ( not ( = ?auto_795077 ?auto_795080 ) ) ( not ( = ?auto_795078 ?auto_795080 ) ) ( not ( = ?auto_795076 ?auto_795080 ) ) ( TRUCK-AT ?auto_795081 ?auto_795082 ) ( SURFACE-AT ?auto_795076 ?auto_795082 ) ( CLEAR ?auto_795076 ) ( IS-CRATE ?auto_795077 ) ( AVAILABLE ?auto_795079 ) ( IN ?auto_795077 ?auto_795081 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_795077 ?auto_795078 )
      ( MAKE-2CRATE-VERIFY ?auto_795076 ?auto_795077 ?auto_795078 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_795121 - SURFACE
      ?auto_795122 - SURFACE
    )
    :vars
    (
      ?auto_795126 - HOIST
      ?auto_795128 - PLACE
      ?auto_795125 - SURFACE
      ?auto_795123 - PLACE
      ?auto_795127 - HOIST
      ?auto_795129 - SURFACE
      ?auto_795124 - TRUCK
      ?auto_795130 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795126 ?auto_795128 ) ( SURFACE-AT ?auto_795121 ?auto_795128 ) ( CLEAR ?auto_795121 ) ( IS-CRATE ?auto_795122 ) ( not ( = ?auto_795121 ?auto_795122 ) ) ( AVAILABLE ?auto_795126 ) ( ON ?auto_795121 ?auto_795125 ) ( not ( = ?auto_795125 ?auto_795121 ) ) ( not ( = ?auto_795125 ?auto_795122 ) ) ( not ( = ?auto_795123 ?auto_795128 ) ) ( HOIST-AT ?auto_795127 ?auto_795123 ) ( not ( = ?auto_795126 ?auto_795127 ) ) ( AVAILABLE ?auto_795127 ) ( SURFACE-AT ?auto_795122 ?auto_795123 ) ( ON ?auto_795122 ?auto_795129 ) ( CLEAR ?auto_795122 ) ( not ( = ?auto_795121 ?auto_795129 ) ) ( not ( = ?auto_795122 ?auto_795129 ) ) ( not ( = ?auto_795125 ?auto_795129 ) ) ( TRUCK-AT ?auto_795124 ?auto_795130 ) ( not ( = ?auto_795130 ?auto_795128 ) ) ( not ( = ?auto_795123 ?auto_795130 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_795124 ?auto_795130 ?auto_795128 )
      ( MAKE-1CRATE ?auto_795121 ?auto_795122 )
      ( MAKE-1CRATE-VERIFY ?auto_795121 ?auto_795122 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_795160 - SURFACE
      ?auto_795161 - SURFACE
      ?auto_795162 - SURFACE
      ?auto_795163 - SURFACE
    )
    :vars
    (
      ?auto_795164 - HOIST
      ?auto_795165 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795164 ?auto_795165 ) ( SURFACE-AT ?auto_795162 ?auto_795165 ) ( CLEAR ?auto_795162 ) ( LIFTING ?auto_795164 ?auto_795163 ) ( IS-CRATE ?auto_795163 ) ( not ( = ?auto_795162 ?auto_795163 ) ) ( ON ?auto_795161 ?auto_795160 ) ( ON ?auto_795162 ?auto_795161 ) ( not ( = ?auto_795160 ?auto_795161 ) ) ( not ( = ?auto_795160 ?auto_795162 ) ) ( not ( = ?auto_795160 ?auto_795163 ) ) ( not ( = ?auto_795161 ?auto_795162 ) ) ( not ( = ?auto_795161 ?auto_795163 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_795162 ?auto_795163 )
      ( MAKE-3CRATE-VERIFY ?auto_795160 ?auto_795161 ?auto_795162 ?auto_795163 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_795177 - SURFACE
      ?auto_795178 - SURFACE
      ?auto_795179 - SURFACE
      ?auto_795180 - SURFACE
    )
    :vars
    (
      ?auto_795181 - HOIST
      ?auto_795183 - PLACE
      ?auto_795182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795181 ?auto_795183 ) ( SURFACE-AT ?auto_795179 ?auto_795183 ) ( CLEAR ?auto_795179 ) ( IS-CRATE ?auto_795180 ) ( not ( = ?auto_795179 ?auto_795180 ) ) ( TRUCK-AT ?auto_795182 ?auto_795183 ) ( AVAILABLE ?auto_795181 ) ( IN ?auto_795180 ?auto_795182 ) ( ON ?auto_795179 ?auto_795178 ) ( not ( = ?auto_795178 ?auto_795179 ) ) ( not ( = ?auto_795178 ?auto_795180 ) ) ( ON ?auto_795178 ?auto_795177 ) ( not ( = ?auto_795177 ?auto_795178 ) ) ( not ( = ?auto_795177 ?auto_795179 ) ) ( not ( = ?auto_795177 ?auto_795180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795178 ?auto_795179 ?auto_795180 )
      ( MAKE-3CRATE-VERIFY ?auto_795177 ?auto_795178 ?auto_795179 ?auto_795180 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_795198 - SURFACE
      ?auto_795199 - SURFACE
      ?auto_795200 - SURFACE
      ?auto_795201 - SURFACE
    )
    :vars
    (
      ?auto_795204 - HOIST
      ?auto_795202 - PLACE
      ?auto_795205 - TRUCK
      ?auto_795203 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795204 ?auto_795202 ) ( SURFACE-AT ?auto_795200 ?auto_795202 ) ( CLEAR ?auto_795200 ) ( IS-CRATE ?auto_795201 ) ( not ( = ?auto_795200 ?auto_795201 ) ) ( AVAILABLE ?auto_795204 ) ( IN ?auto_795201 ?auto_795205 ) ( ON ?auto_795200 ?auto_795199 ) ( not ( = ?auto_795199 ?auto_795200 ) ) ( not ( = ?auto_795199 ?auto_795201 ) ) ( TRUCK-AT ?auto_795205 ?auto_795203 ) ( not ( = ?auto_795203 ?auto_795202 ) ) ( ON ?auto_795199 ?auto_795198 ) ( not ( = ?auto_795198 ?auto_795199 ) ) ( not ( = ?auto_795198 ?auto_795200 ) ) ( not ( = ?auto_795198 ?auto_795201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795199 ?auto_795200 ?auto_795201 )
      ( MAKE-3CRATE-VERIFY ?auto_795198 ?auto_795199 ?auto_795200 ?auto_795201 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_795222 - SURFACE
      ?auto_795223 - SURFACE
      ?auto_795224 - SURFACE
      ?auto_795225 - SURFACE
    )
    :vars
    (
      ?auto_795230 - HOIST
      ?auto_795226 - PLACE
      ?auto_795228 - TRUCK
      ?auto_795227 - PLACE
      ?auto_795229 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_795230 ?auto_795226 ) ( SURFACE-AT ?auto_795224 ?auto_795226 ) ( CLEAR ?auto_795224 ) ( IS-CRATE ?auto_795225 ) ( not ( = ?auto_795224 ?auto_795225 ) ) ( AVAILABLE ?auto_795230 ) ( ON ?auto_795224 ?auto_795223 ) ( not ( = ?auto_795223 ?auto_795224 ) ) ( not ( = ?auto_795223 ?auto_795225 ) ) ( TRUCK-AT ?auto_795228 ?auto_795227 ) ( not ( = ?auto_795227 ?auto_795226 ) ) ( HOIST-AT ?auto_795229 ?auto_795227 ) ( LIFTING ?auto_795229 ?auto_795225 ) ( not ( = ?auto_795230 ?auto_795229 ) ) ( ON ?auto_795223 ?auto_795222 ) ( not ( = ?auto_795222 ?auto_795223 ) ) ( not ( = ?auto_795222 ?auto_795224 ) ) ( not ( = ?auto_795222 ?auto_795225 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795223 ?auto_795224 ?auto_795225 )
      ( MAKE-3CRATE-VERIFY ?auto_795222 ?auto_795223 ?auto_795224 ?auto_795225 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_795249 - SURFACE
      ?auto_795250 - SURFACE
      ?auto_795251 - SURFACE
      ?auto_795252 - SURFACE
    )
    :vars
    (
      ?auto_795258 - HOIST
      ?auto_795257 - PLACE
      ?auto_795254 - TRUCK
      ?auto_795255 - PLACE
      ?auto_795253 - HOIST
      ?auto_795256 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795258 ?auto_795257 ) ( SURFACE-AT ?auto_795251 ?auto_795257 ) ( CLEAR ?auto_795251 ) ( IS-CRATE ?auto_795252 ) ( not ( = ?auto_795251 ?auto_795252 ) ) ( AVAILABLE ?auto_795258 ) ( ON ?auto_795251 ?auto_795250 ) ( not ( = ?auto_795250 ?auto_795251 ) ) ( not ( = ?auto_795250 ?auto_795252 ) ) ( TRUCK-AT ?auto_795254 ?auto_795255 ) ( not ( = ?auto_795255 ?auto_795257 ) ) ( HOIST-AT ?auto_795253 ?auto_795255 ) ( not ( = ?auto_795258 ?auto_795253 ) ) ( AVAILABLE ?auto_795253 ) ( SURFACE-AT ?auto_795252 ?auto_795255 ) ( ON ?auto_795252 ?auto_795256 ) ( CLEAR ?auto_795252 ) ( not ( = ?auto_795251 ?auto_795256 ) ) ( not ( = ?auto_795252 ?auto_795256 ) ) ( not ( = ?auto_795250 ?auto_795256 ) ) ( ON ?auto_795250 ?auto_795249 ) ( not ( = ?auto_795249 ?auto_795250 ) ) ( not ( = ?auto_795249 ?auto_795251 ) ) ( not ( = ?auto_795249 ?auto_795252 ) ) ( not ( = ?auto_795249 ?auto_795256 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795250 ?auto_795251 ?auto_795252 )
      ( MAKE-3CRATE-VERIFY ?auto_795249 ?auto_795250 ?auto_795251 ?auto_795252 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_795277 - SURFACE
      ?auto_795278 - SURFACE
      ?auto_795279 - SURFACE
      ?auto_795280 - SURFACE
    )
    :vars
    (
      ?auto_795286 - HOIST
      ?auto_795283 - PLACE
      ?auto_795281 - PLACE
      ?auto_795282 - HOIST
      ?auto_795284 - SURFACE
      ?auto_795285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795286 ?auto_795283 ) ( SURFACE-AT ?auto_795279 ?auto_795283 ) ( CLEAR ?auto_795279 ) ( IS-CRATE ?auto_795280 ) ( not ( = ?auto_795279 ?auto_795280 ) ) ( AVAILABLE ?auto_795286 ) ( ON ?auto_795279 ?auto_795278 ) ( not ( = ?auto_795278 ?auto_795279 ) ) ( not ( = ?auto_795278 ?auto_795280 ) ) ( not ( = ?auto_795281 ?auto_795283 ) ) ( HOIST-AT ?auto_795282 ?auto_795281 ) ( not ( = ?auto_795286 ?auto_795282 ) ) ( AVAILABLE ?auto_795282 ) ( SURFACE-AT ?auto_795280 ?auto_795281 ) ( ON ?auto_795280 ?auto_795284 ) ( CLEAR ?auto_795280 ) ( not ( = ?auto_795279 ?auto_795284 ) ) ( not ( = ?auto_795280 ?auto_795284 ) ) ( not ( = ?auto_795278 ?auto_795284 ) ) ( TRUCK-AT ?auto_795285 ?auto_795283 ) ( ON ?auto_795278 ?auto_795277 ) ( not ( = ?auto_795277 ?auto_795278 ) ) ( not ( = ?auto_795277 ?auto_795279 ) ) ( not ( = ?auto_795277 ?auto_795280 ) ) ( not ( = ?auto_795277 ?auto_795284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795278 ?auto_795279 ?auto_795280 )
      ( MAKE-3CRATE-VERIFY ?auto_795277 ?auto_795278 ?auto_795279 ?auto_795280 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_795305 - SURFACE
      ?auto_795306 - SURFACE
      ?auto_795307 - SURFACE
      ?auto_795308 - SURFACE
    )
    :vars
    (
      ?auto_795309 - HOIST
      ?auto_795314 - PLACE
      ?auto_795311 - PLACE
      ?auto_795310 - HOIST
      ?auto_795312 - SURFACE
      ?auto_795313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795309 ?auto_795314 ) ( IS-CRATE ?auto_795308 ) ( not ( = ?auto_795307 ?auto_795308 ) ) ( not ( = ?auto_795306 ?auto_795307 ) ) ( not ( = ?auto_795306 ?auto_795308 ) ) ( not ( = ?auto_795311 ?auto_795314 ) ) ( HOIST-AT ?auto_795310 ?auto_795311 ) ( not ( = ?auto_795309 ?auto_795310 ) ) ( AVAILABLE ?auto_795310 ) ( SURFACE-AT ?auto_795308 ?auto_795311 ) ( ON ?auto_795308 ?auto_795312 ) ( CLEAR ?auto_795308 ) ( not ( = ?auto_795307 ?auto_795312 ) ) ( not ( = ?auto_795308 ?auto_795312 ) ) ( not ( = ?auto_795306 ?auto_795312 ) ) ( TRUCK-AT ?auto_795313 ?auto_795314 ) ( SURFACE-AT ?auto_795306 ?auto_795314 ) ( CLEAR ?auto_795306 ) ( LIFTING ?auto_795309 ?auto_795307 ) ( IS-CRATE ?auto_795307 ) ( ON ?auto_795306 ?auto_795305 ) ( not ( = ?auto_795305 ?auto_795306 ) ) ( not ( = ?auto_795305 ?auto_795307 ) ) ( not ( = ?auto_795305 ?auto_795308 ) ) ( not ( = ?auto_795305 ?auto_795312 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795306 ?auto_795307 ?auto_795308 )
      ( MAKE-3CRATE-VERIFY ?auto_795305 ?auto_795306 ?auto_795307 ?auto_795308 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_795333 - SURFACE
      ?auto_795334 - SURFACE
      ?auto_795335 - SURFACE
      ?auto_795336 - SURFACE
    )
    :vars
    (
      ?auto_795342 - HOIST
      ?auto_795338 - PLACE
      ?auto_795340 - PLACE
      ?auto_795339 - HOIST
      ?auto_795337 - SURFACE
      ?auto_795341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795342 ?auto_795338 ) ( IS-CRATE ?auto_795336 ) ( not ( = ?auto_795335 ?auto_795336 ) ) ( not ( = ?auto_795334 ?auto_795335 ) ) ( not ( = ?auto_795334 ?auto_795336 ) ) ( not ( = ?auto_795340 ?auto_795338 ) ) ( HOIST-AT ?auto_795339 ?auto_795340 ) ( not ( = ?auto_795342 ?auto_795339 ) ) ( AVAILABLE ?auto_795339 ) ( SURFACE-AT ?auto_795336 ?auto_795340 ) ( ON ?auto_795336 ?auto_795337 ) ( CLEAR ?auto_795336 ) ( not ( = ?auto_795335 ?auto_795337 ) ) ( not ( = ?auto_795336 ?auto_795337 ) ) ( not ( = ?auto_795334 ?auto_795337 ) ) ( TRUCK-AT ?auto_795341 ?auto_795338 ) ( SURFACE-AT ?auto_795334 ?auto_795338 ) ( CLEAR ?auto_795334 ) ( IS-CRATE ?auto_795335 ) ( AVAILABLE ?auto_795342 ) ( IN ?auto_795335 ?auto_795341 ) ( ON ?auto_795334 ?auto_795333 ) ( not ( = ?auto_795333 ?auto_795334 ) ) ( not ( = ?auto_795333 ?auto_795335 ) ) ( not ( = ?auto_795333 ?auto_795336 ) ) ( not ( = ?auto_795333 ?auto_795337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795334 ?auto_795335 ?auto_795336 )
      ( MAKE-3CRATE-VERIFY ?auto_795333 ?auto_795334 ?auto_795335 ?auto_795336 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795624 - SURFACE
      ?auto_795625 - SURFACE
      ?auto_795626 - SURFACE
      ?auto_795627 - SURFACE
      ?auto_795628 - SURFACE
    )
    :vars
    (
      ?auto_795629 - HOIST
      ?auto_795630 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795629 ?auto_795630 ) ( SURFACE-AT ?auto_795627 ?auto_795630 ) ( CLEAR ?auto_795627 ) ( LIFTING ?auto_795629 ?auto_795628 ) ( IS-CRATE ?auto_795628 ) ( not ( = ?auto_795627 ?auto_795628 ) ) ( ON ?auto_795625 ?auto_795624 ) ( ON ?auto_795626 ?auto_795625 ) ( ON ?auto_795627 ?auto_795626 ) ( not ( = ?auto_795624 ?auto_795625 ) ) ( not ( = ?auto_795624 ?auto_795626 ) ) ( not ( = ?auto_795624 ?auto_795627 ) ) ( not ( = ?auto_795624 ?auto_795628 ) ) ( not ( = ?auto_795625 ?auto_795626 ) ) ( not ( = ?auto_795625 ?auto_795627 ) ) ( not ( = ?auto_795625 ?auto_795628 ) ) ( not ( = ?auto_795626 ?auto_795627 ) ) ( not ( = ?auto_795626 ?auto_795628 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_795627 ?auto_795628 )
      ( MAKE-4CRATE-VERIFY ?auto_795624 ?auto_795625 ?auto_795626 ?auto_795627 ?auto_795628 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795649 - SURFACE
      ?auto_795650 - SURFACE
      ?auto_795651 - SURFACE
      ?auto_795652 - SURFACE
      ?auto_795653 - SURFACE
    )
    :vars
    (
      ?auto_795654 - HOIST
      ?auto_795656 - PLACE
      ?auto_795655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795654 ?auto_795656 ) ( SURFACE-AT ?auto_795652 ?auto_795656 ) ( CLEAR ?auto_795652 ) ( IS-CRATE ?auto_795653 ) ( not ( = ?auto_795652 ?auto_795653 ) ) ( TRUCK-AT ?auto_795655 ?auto_795656 ) ( AVAILABLE ?auto_795654 ) ( IN ?auto_795653 ?auto_795655 ) ( ON ?auto_795652 ?auto_795651 ) ( not ( = ?auto_795651 ?auto_795652 ) ) ( not ( = ?auto_795651 ?auto_795653 ) ) ( ON ?auto_795650 ?auto_795649 ) ( ON ?auto_795651 ?auto_795650 ) ( not ( = ?auto_795649 ?auto_795650 ) ) ( not ( = ?auto_795649 ?auto_795651 ) ) ( not ( = ?auto_795649 ?auto_795652 ) ) ( not ( = ?auto_795649 ?auto_795653 ) ) ( not ( = ?auto_795650 ?auto_795651 ) ) ( not ( = ?auto_795650 ?auto_795652 ) ) ( not ( = ?auto_795650 ?auto_795653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795651 ?auto_795652 ?auto_795653 )
      ( MAKE-4CRATE-VERIFY ?auto_795649 ?auto_795650 ?auto_795651 ?auto_795652 ?auto_795653 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795679 - SURFACE
      ?auto_795680 - SURFACE
      ?auto_795681 - SURFACE
      ?auto_795682 - SURFACE
      ?auto_795683 - SURFACE
    )
    :vars
    (
      ?auto_795687 - HOIST
      ?auto_795685 - PLACE
      ?auto_795684 - TRUCK
      ?auto_795686 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795687 ?auto_795685 ) ( SURFACE-AT ?auto_795682 ?auto_795685 ) ( CLEAR ?auto_795682 ) ( IS-CRATE ?auto_795683 ) ( not ( = ?auto_795682 ?auto_795683 ) ) ( AVAILABLE ?auto_795687 ) ( IN ?auto_795683 ?auto_795684 ) ( ON ?auto_795682 ?auto_795681 ) ( not ( = ?auto_795681 ?auto_795682 ) ) ( not ( = ?auto_795681 ?auto_795683 ) ) ( TRUCK-AT ?auto_795684 ?auto_795686 ) ( not ( = ?auto_795686 ?auto_795685 ) ) ( ON ?auto_795680 ?auto_795679 ) ( ON ?auto_795681 ?auto_795680 ) ( not ( = ?auto_795679 ?auto_795680 ) ) ( not ( = ?auto_795679 ?auto_795681 ) ) ( not ( = ?auto_795679 ?auto_795682 ) ) ( not ( = ?auto_795679 ?auto_795683 ) ) ( not ( = ?auto_795680 ?auto_795681 ) ) ( not ( = ?auto_795680 ?auto_795682 ) ) ( not ( = ?auto_795680 ?auto_795683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795681 ?auto_795682 ?auto_795683 )
      ( MAKE-4CRATE-VERIFY ?auto_795679 ?auto_795680 ?auto_795681 ?auto_795682 ?auto_795683 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795713 - SURFACE
      ?auto_795714 - SURFACE
      ?auto_795715 - SURFACE
      ?auto_795716 - SURFACE
      ?auto_795717 - SURFACE
    )
    :vars
    (
      ?auto_795720 - HOIST
      ?auto_795722 - PLACE
      ?auto_795719 - TRUCK
      ?auto_795721 - PLACE
      ?auto_795718 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_795720 ?auto_795722 ) ( SURFACE-AT ?auto_795716 ?auto_795722 ) ( CLEAR ?auto_795716 ) ( IS-CRATE ?auto_795717 ) ( not ( = ?auto_795716 ?auto_795717 ) ) ( AVAILABLE ?auto_795720 ) ( ON ?auto_795716 ?auto_795715 ) ( not ( = ?auto_795715 ?auto_795716 ) ) ( not ( = ?auto_795715 ?auto_795717 ) ) ( TRUCK-AT ?auto_795719 ?auto_795721 ) ( not ( = ?auto_795721 ?auto_795722 ) ) ( HOIST-AT ?auto_795718 ?auto_795721 ) ( LIFTING ?auto_795718 ?auto_795717 ) ( not ( = ?auto_795720 ?auto_795718 ) ) ( ON ?auto_795714 ?auto_795713 ) ( ON ?auto_795715 ?auto_795714 ) ( not ( = ?auto_795713 ?auto_795714 ) ) ( not ( = ?auto_795713 ?auto_795715 ) ) ( not ( = ?auto_795713 ?auto_795716 ) ) ( not ( = ?auto_795713 ?auto_795717 ) ) ( not ( = ?auto_795714 ?auto_795715 ) ) ( not ( = ?auto_795714 ?auto_795716 ) ) ( not ( = ?auto_795714 ?auto_795717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795715 ?auto_795716 ?auto_795717 )
      ( MAKE-4CRATE-VERIFY ?auto_795713 ?auto_795714 ?auto_795715 ?auto_795716 ?auto_795717 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795751 - SURFACE
      ?auto_795752 - SURFACE
      ?auto_795753 - SURFACE
      ?auto_795754 - SURFACE
      ?auto_795755 - SURFACE
    )
    :vars
    (
      ?auto_795757 - HOIST
      ?auto_795758 - PLACE
      ?auto_795759 - TRUCK
      ?auto_795760 - PLACE
      ?auto_795756 - HOIST
      ?auto_795761 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795757 ?auto_795758 ) ( SURFACE-AT ?auto_795754 ?auto_795758 ) ( CLEAR ?auto_795754 ) ( IS-CRATE ?auto_795755 ) ( not ( = ?auto_795754 ?auto_795755 ) ) ( AVAILABLE ?auto_795757 ) ( ON ?auto_795754 ?auto_795753 ) ( not ( = ?auto_795753 ?auto_795754 ) ) ( not ( = ?auto_795753 ?auto_795755 ) ) ( TRUCK-AT ?auto_795759 ?auto_795760 ) ( not ( = ?auto_795760 ?auto_795758 ) ) ( HOIST-AT ?auto_795756 ?auto_795760 ) ( not ( = ?auto_795757 ?auto_795756 ) ) ( AVAILABLE ?auto_795756 ) ( SURFACE-AT ?auto_795755 ?auto_795760 ) ( ON ?auto_795755 ?auto_795761 ) ( CLEAR ?auto_795755 ) ( not ( = ?auto_795754 ?auto_795761 ) ) ( not ( = ?auto_795755 ?auto_795761 ) ) ( not ( = ?auto_795753 ?auto_795761 ) ) ( ON ?auto_795752 ?auto_795751 ) ( ON ?auto_795753 ?auto_795752 ) ( not ( = ?auto_795751 ?auto_795752 ) ) ( not ( = ?auto_795751 ?auto_795753 ) ) ( not ( = ?auto_795751 ?auto_795754 ) ) ( not ( = ?auto_795751 ?auto_795755 ) ) ( not ( = ?auto_795751 ?auto_795761 ) ) ( not ( = ?auto_795752 ?auto_795753 ) ) ( not ( = ?auto_795752 ?auto_795754 ) ) ( not ( = ?auto_795752 ?auto_795755 ) ) ( not ( = ?auto_795752 ?auto_795761 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795753 ?auto_795754 ?auto_795755 )
      ( MAKE-4CRATE-VERIFY ?auto_795751 ?auto_795752 ?auto_795753 ?auto_795754 ?auto_795755 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795790 - SURFACE
      ?auto_795791 - SURFACE
      ?auto_795792 - SURFACE
      ?auto_795793 - SURFACE
      ?auto_795794 - SURFACE
    )
    :vars
    (
      ?auto_795799 - HOIST
      ?auto_795798 - PLACE
      ?auto_795796 - PLACE
      ?auto_795795 - HOIST
      ?auto_795800 - SURFACE
      ?auto_795797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795799 ?auto_795798 ) ( SURFACE-AT ?auto_795793 ?auto_795798 ) ( CLEAR ?auto_795793 ) ( IS-CRATE ?auto_795794 ) ( not ( = ?auto_795793 ?auto_795794 ) ) ( AVAILABLE ?auto_795799 ) ( ON ?auto_795793 ?auto_795792 ) ( not ( = ?auto_795792 ?auto_795793 ) ) ( not ( = ?auto_795792 ?auto_795794 ) ) ( not ( = ?auto_795796 ?auto_795798 ) ) ( HOIST-AT ?auto_795795 ?auto_795796 ) ( not ( = ?auto_795799 ?auto_795795 ) ) ( AVAILABLE ?auto_795795 ) ( SURFACE-AT ?auto_795794 ?auto_795796 ) ( ON ?auto_795794 ?auto_795800 ) ( CLEAR ?auto_795794 ) ( not ( = ?auto_795793 ?auto_795800 ) ) ( not ( = ?auto_795794 ?auto_795800 ) ) ( not ( = ?auto_795792 ?auto_795800 ) ) ( TRUCK-AT ?auto_795797 ?auto_795798 ) ( ON ?auto_795791 ?auto_795790 ) ( ON ?auto_795792 ?auto_795791 ) ( not ( = ?auto_795790 ?auto_795791 ) ) ( not ( = ?auto_795790 ?auto_795792 ) ) ( not ( = ?auto_795790 ?auto_795793 ) ) ( not ( = ?auto_795790 ?auto_795794 ) ) ( not ( = ?auto_795790 ?auto_795800 ) ) ( not ( = ?auto_795791 ?auto_795792 ) ) ( not ( = ?auto_795791 ?auto_795793 ) ) ( not ( = ?auto_795791 ?auto_795794 ) ) ( not ( = ?auto_795791 ?auto_795800 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795792 ?auto_795793 ?auto_795794 )
      ( MAKE-4CRATE-VERIFY ?auto_795790 ?auto_795791 ?auto_795792 ?auto_795793 ?auto_795794 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795829 - SURFACE
      ?auto_795830 - SURFACE
      ?auto_795831 - SURFACE
      ?auto_795832 - SURFACE
      ?auto_795833 - SURFACE
    )
    :vars
    (
      ?auto_795838 - HOIST
      ?auto_795837 - PLACE
      ?auto_795834 - PLACE
      ?auto_795835 - HOIST
      ?auto_795836 - SURFACE
      ?auto_795839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795838 ?auto_795837 ) ( IS-CRATE ?auto_795833 ) ( not ( = ?auto_795832 ?auto_795833 ) ) ( not ( = ?auto_795831 ?auto_795832 ) ) ( not ( = ?auto_795831 ?auto_795833 ) ) ( not ( = ?auto_795834 ?auto_795837 ) ) ( HOIST-AT ?auto_795835 ?auto_795834 ) ( not ( = ?auto_795838 ?auto_795835 ) ) ( AVAILABLE ?auto_795835 ) ( SURFACE-AT ?auto_795833 ?auto_795834 ) ( ON ?auto_795833 ?auto_795836 ) ( CLEAR ?auto_795833 ) ( not ( = ?auto_795832 ?auto_795836 ) ) ( not ( = ?auto_795833 ?auto_795836 ) ) ( not ( = ?auto_795831 ?auto_795836 ) ) ( TRUCK-AT ?auto_795839 ?auto_795837 ) ( SURFACE-AT ?auto_795831 ?auto_795837 ) ( CLEAR ?auto_795831 ) ( LIFTING ?auto_795838 ?auto_795832 ) ( IS-CRATE ?auto_795832 ) ( ON ?auto_795830 ?auto_795829 ) ( ON ?auto_795831 ?auto_795830 ) ( not ( = ?auto_795829 ?auto_795830 ) ) ( not ( = ?auto_795829 ?auto_795831 ) ) ( not ( = ?auto_795829 ?auto_795832 ) ) ( not ( = ?auto_795829 ?auto_795833 ) ) ( not ( = ?auto_795829 ?auto_795836 ) ) ( not ( = ?auto_795830 ?auto_795831 ) ) ( not ( = ?auto_795830 ?auto_795832 ) ) ( not ( = ?auto_795830 ?auto_795833 ) ) ( not ( = ?auto_795830 ?auto_795836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795831 ?auto_795832 ?auto_795833 )
      ( MAKE-4CRATE-VERIFY ?auto_795829 ?auto_795830 ?auto_795831 ?auto_795832 ?auto_795833 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795868 - SURFACE
      ?auto_795869 - SURFACE
      ?auto_795870 - SURFACE
      ?auto_795871 - SURFACE
      ?auto_795872 - SURFACE
    )
    :vars
    (
      ?auto_795875 - HOIST
      ?auto_795878 - PLACE
      ?auto_795873 - PLACE
      ?auto_795874 - HOIST
      ?auto_795876 - SURFACE
      ?auto_795877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795875 ?auto_795878 ) ( IS-CRATE ?auto_795872 ) ( not ( = ?auto_795871 ?auto_795872 ) ) ( not ( = ?auto_795870 ?auto_795871 ) ) ( not ( = ?auto_795870 ?auto_795872 ) ) ( not ( = ?auto_795873 ?auto_795878 ) ) ( HOIST-AT ?auto_795874 ?auto_795873 ) ( not ( = ?auto_795875 ?auto_795874 ) ) ( AVAILABLE ?auto_795874 ) ( SURFACE-AT ?auto_795872 ?auto_795873 ) ( ON ?auto_795872 ?auto_795876 ) ( CLEAR ?auto_795872 ) ( not ( = ?auto_795871 ?auto_795876 ) ) ( not ( = ?auto_795872 ?auto_795876 ) ) ( not ( = ?auto_795870 ?auto_795876 ) ) ( TRUCK-AT ?auto_795877 ?auto_795878 ) ( SURFACE-AT ?auto_795870 ?auto_795878 ) ( CLEAR ?auto_795870 ) ( IS-CRATE ?auto_795871 ) ( AVAILABLE ?auto_795875 ) ( IN ?auto_795871 ?auto_795877 ) ( ON ?auto_795869 ?auto_795868 ) ( ON ?auto_795870 ?auto_795869 ) ( not ( = ?auto_795868 ?auto_795869 ) ) ( not ( = ?auto_795868 ?auto_795870 ) ) ( not ( = ?auto_795868 ?auto_795871 ) ) ( not ( = ?auto_795868 ?auto_795872 ) ) ( not ( = ?auto_795868 ?auto_795876 ) ) ( not ( = ?auto_795869 ?auto_795870 ) ) ( not ( = ?auto_795869 ?auto_795871 ) ) ( not ( = ?auto_795869 ?auto_795872 ) ) ( not ( = ?auto_795869 ?auto_795876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795870 ?auto_795871 ?auto_795872 )
      ( MAKE-4CRATE-VERIFY ?auto_795868 ?auto_795869 ?auto_795870 ?auto_795871 ?auto_795872 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796528 - SURFACE
      ?auto_796529 - SURFACE
      ?auto_796530 - SURFACE
      ?auto_796531 - SURFACE
      ?auto_796532 - SURFACE
      ?auto_796533 - SURFACE
    )
    :vars
    (
      ?auto_796534 - HOIST
      ?auto_796535 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_796534 ?auto_796535 ) ( SURFACE-AT ?auto_796532 ?auto_796535 ) ( CLEAR ?auto_796532 ) ( LIFTING ?auto_796534 ?auto_796533 ) ( IS-CRATE ?auto_796533 ) ( not ( = ?auto_796532 ?auto_796533 ) ) ( ON ?auto_796529 ?auto_796528 ) ( ON ?auto_796530 ?auto_796529 ) ( ON ?auto_796531 ?auto_796530 ) ( ON ?auto_796532 ?auto_796531 ) ( not ( = ?auto_796528 ?auto_796529 ) ) ( not ( = ?auto_796528 ?auto_796530 ) ) ( not ( = ?auto_796528 ?auto_796531 ) ) ( not ( = ?auto_796528 ?auto_796532 ) ) ( not ( = ?auto_796528 ?auto_796533 ) ) ( not ( = ?auto_796529 ?auto_796530 ) ) ( not ( = ?auto_796529 ?auto_796531 ) ) ( not ( = ?auto_796529 ?auto_796532 ) ) ( not ( = ?auto_796529 ?auto_796533 ) ) ( not ( = ?auto_796530 ?auto_796531 ) ) ( not ( = ?auto_796530 ?auto_796532 ) ) ( not ( = ?auto_796530 ?auto_796533 ) ) ( not ( = ?auto_796531 ?auto_796532 ) ) ( not ( = ?auto_796531 ?auto_796533 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_796532 ?auto_796533 )
      ( MAKE-5CRATE-VERIFY ?auto_796528 ?auto_796529 ?auto_796530 ?auto_796531 ?auto_796532 ?auto_796533 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796562 - SURFACE
      ?auto_796563 - SURFACE
      ?auto_796564 - SURFACE
      ?auto_796565 - SURFACE
      ?auto_796566 - SURFACE
      ?auto_796567 - SURFACE
    )
    :vars
    (
      ?auto_796568 - HOIST
      ?auto_796570 - PLACE
      ?auto_796569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_796568 ?auto_796570 ) ( SURFACE-AT ?auto_796566 ?auto_796570 ) ( CLEAR ?auto_796566 ) ( IS-CRATE ?auto_796567 ) ( not ( = ?auto_796566 ?auto_796567 ) ) ( TRUCK-AT ?auto_796569 ?auto_796570 ) ( AVAILABLE ?auto_796568 ) ( IN ?auto_796567 ?auto_796569 ) ( ON ?auto_796566 ?auto_796565 ) ( not ( = ?auto_796565 ?auto_796566 ) ) ( not ( = ?auto_796565 ?auto_796567 ) ) ( ON ?auto_796563 ?auto_796562 ) ( ON ?auto_796564 ?auto_796563 ) ( ON ?auto_796565 ?auto_796564 ) ( not ( = ?auto_796562 ?auto_796563 ) ) ( not ( = ?auto_796562 ?auto_796564 ) ) ( not ( = ?auto_796562 ?auto_796565 ) ) ( not ( = ?auto_796562 ?auto_796566 ) ) ( not ( = ?auto_796562 ?auto_796567 ) ) ( not ( = ?auto_796563 ?auto_796564 ) ) ( not ( = ?auto_796563 ?auto_796565 ) ) ( not ( = ?auto_796563 ?auto_796566 ) ) ( not ( = ?auto_796563 ?auto_796567 ) ) ( not ( = ?auto_796564 ?auto_796565 ) ) ( not ( = ?auto_796564 ?auto_796566 ) ) ( not ( = ?auto_796564 ?auto_796567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796565 ?auto_796566 ?auto_796567 )
      ( MAKE-5CRATE-VERIFY ?auto_796562 ?auto_796563 ?auto_796564 ?auto_796565 ?auto_796566 ?auto_796567 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796602 - SURFACE
      ?auto_796603 - SURFACE
      ?auto_796604 - SURFACE
      ?auto_796605 - SURFACE
      ?auto_796606 - SURFACE
      ?auto_796607 - SURFACE
    )
    :vars
    (
      ?auto_796608 - HOIST
      ?auto_796610 - PLACE
      ?auto_796609 - TRUCK
      ?auto_796611 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_796608 ?auto_796610 ) ( SURFACE-AT ?auto_796606 ?auto_796610 ) ( CLEAR ?auto_796606 ) ( IS-CRATE ?auto_796607 ) ( not ( = ?auto_796606 ?auto_796607 ) ) ( AVAILABLE ?auto_796608 ) ( IN ?auto_796607 ?auto_796609 ) ( ON ?auto_796606 ?auto_796605 ) ( not ( = ?auto_796605 ?auto_796606 ) ) ( not ( = ?auto_796605 ?auto_796607 ) ) ( TRUCK-AT ?auto_796609 ?auto_796611 ) ( not ( = ?auto_796611 ?auto_796610 ) ) ( ON ?auto_796603 ?auto_796602 ) ( ON ?auto_796604 ?auto_796603 ) ( ON ?auto_796605 ?auto_796604 ) ( not ( = ?auto_796602 ?auto_796603 ) ) ( not ( = ?auto_796602 ?auto_796604 ) ) ( not ( = ?auto_796602 ?auto_796605 ) ) ( not ( = ?auto_796602 ?auto_796606 ) ) ( not ( = ?auto_796602 ?auto_796607 ) ) ( not ( = ?auto_796603 ?auto_796604 ) ) ( not ( = ?auto_796603 ?auto_796605 ) ) ( not ( = ?auto_796603 ?auto_796606 ) ) ( not ( = ?auto_796603 ?auto_796607 ) ) ( not ( = ?auto_796604 ?auto_796605 ) ) ( not ( = ?auto_796604 ?auto_796606 ) ) ( not ( = ?auto_796604 ?auto_796607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796605 ?auto_796606 ?auto_796607 )
      ( MAKE-5CRATE-VERIFY ?auto_796602 ?auto_796603 ?auto_796604 ?auto_796605 ?auto_796606 ?auto_796607 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796647 - SURFACE
      ?auto_796648 - SURFACE
      ?auto_796649 - SURFACE
      ?auto_796650 - SURFACE
      ?auto_796651 - SURFACE
      ?auto_796652 - SURFACE
    )
    :vars
    (
      ?auto_796657 - HOIST
      ?auto_796654 - PLACE
      ?auto_796656 - TRUCK
      ?auto_796653 - PLACE
      ?auto_796655 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_796657 ?auto_796654 ) ( SURFACE-AT ?auto_796651 ?auto_796654 ) ( CLEAR ?auto_796651 ) ( IS-CRATE ?auto_796652 ) ( not ( = ?auto_796651 ?auto_796652 ) ) ( AVAILABLE ?auto_796657 ) ( ON ?auto_796651 ?auto_796650 ) ( not ( = ?auto_796650 ?auto_796651 ) ) ( not ( = ?auto_796650 ?auto_796652 ) ) ( TRUCK-AT ?auto_796656 ?auto_796653 ) ( not ( = ?auto_796653 ?auto_796654 ) ) ( HOIST-AT ?auto_796655 ?auto_796653 ) ( LIFTING ?auto_796655 ?auto_796652 ) ( not ( = ?auto_796657 ?auto_796655 ) ) ( ON ?auto_796648 ?auto_796647 ) ( ON ?auto_796649 ?auto_796648 ) ( ON ?auto_796650 ?auto_796649 ) ( not ( = ?auto_796647 ?auto_796648 ) ) ( not ( = ?auto_796647 ?auto_796649 ) ) ( not ( = ?auto_796647 ?auto_796650 ) ) ( not ( = ?auto_796647 ?auto_796651 ) ) ( not ( = ?auto_796647 ?auto_796652 ) ) ( not ( = ?auto_796648 ?auto_796649 ) ) ( not ( = ?auto_796648 ?auto_796650 ) ) ( not ( = ?auto_796648 ?auto_796651 ) ) ( not ( = ?auto_796648 ?auto_796652 ) ) ( not ( = ?auto_796649 ?auto_796650 ) ) ( not ( = ?auto_796649 ?auto_796651 ) ) ( not ( = ?auto_796649 ?auto_796652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796650 ?auto_796651 ?auto_796652 )
      ( MAKE-5CRATE-VERIFY ?auto_796647 ?auto_796648 ?auto_796649 ?auto_796650 ?auto_796651 ?auto_796652 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796697 - SURFACE
      ?auto_796698 - SURFACE
      ?auto_796699 - SURFACE
      ?auto_796700 - SURFACE
      ?auto_796701 - SURFACE
      ?auto_796702 - SURFACE
    )
    :vars
    (
      ?auto_796705 - HOIST
      ?auto_796704 - PLACE
      ?auto_796703 - TRUCK
      ?auto_796706 - PLACE
      ?auto_796708 - HOIST
      ?auto_796707 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_796705 ?auto_796704 ) ( SURFACE-AT ?auto_796701 ?auto_796704 ) ( CLEAR ?auto_796701 ) ( IS-CRATE ?auto_796702 ) ( not ( = ?auto_796701 ?auto_796702 ) ) ( AVAILABLE ?auto_796705 ) ( ON ?auto_796701 ?auto_796700 ) ( not ( = ?auto_796700 ?auto_796701 ) ) ( not ( = ?auto_796700 ?auto_796702 ) ) ( TRUCK-AT ?auto_796703 ?auto_796706 ) ( not ( = ?auto_796706 ?auto_796704 ) ) ( HOIST-AT ?auto_796708 ?auto_796706 ) ( not ( = ?auto_796705 ?auto_796708 ) ) ( AVAILABLE ?auto_796708 ) ( SURFACE-AT ?auto_796702 ?auto_796706 ) ( ON ?auto_796702 ?auto_796707 ) ( CLEAR ?auto_796702 ) ( not ( = ?auto_796701 ?auto_796707 ) ) ( not ( = ?auto_796702 ?auto_796707 ) ) ( not ( = ?auto_796700 ?auto_796707 ) ) ( ON ?auto_796698 ?auto_796697 ) ( ON ?auto_796699 ?auto_796698 ) ( ON ?auto_796700 ?auto_796699 ) ( not ( = ?auto_796697 ?auto_796698 ) ) ( not ( = ?auto_796697 ?auto_796699 ) ) ( not ( = ?auto_796697 ?auto_796700 ) ) ( not ( = ?auto_796697 ?auto_796701 ) ) ( not ( = ?auto_796697 ?auto_796702 ) ) ( not ( = ?auto_796697 ?auto_796707 ) ) ( not ( = ?auto_796698 ?auto_796699 ) ) ( not ( = ?auto_796698 ?auto_796700 ) ) ( not ( = ?auto_796698 ?auto_796701 ) ) ( not ( = ?auto_796698 ?auto_796702 ) ) ( not ( = ?auto_796698 ?auto_796707 ) ) ( not ( = ?auto_796699 ?auto_796700 ) ) ( not ( = ?auto_796699 ?auto_796701 ) ) ( not ( = ?auto_796699 ?auto_796702 ) ) ( not ( = ?auto_796699 ?auto_796707 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796700 ?auto_796701 ?auto_796702 )
      ( MAKE-5CRATE-VERIFY ?auto_796697 ?auto_796698 ?auto_796699 ?auto_796700 ?auto_796701 ?auto_796702 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796748 - SURFACE
      ?auto_796749 - SURFACE
      ?auto_796750 - SURFACE
      ?auto_796751 - SURFACE
      ?auto_796752 - SURFACE
      ?auto_796753 - SURFACE
    )
    :vars
    (
      ?auto_796757 - HOIST
      ?auto_796754 - PLACE
      ?auto_796758 - PLACE
      ?auto_796759 - HOIST
      ?auto_796755 - SURFACE
      ?auto_796756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_796757 ?auto_796754 ) ( SURFACE-AT ?auto_796752 ?auto_796754 ) ( CLEAR ?auto_796752 ) ( IS-CRATE ?auto_796753 ) ( not ( = ?auto_796752 ?auto_796753 ) ) ( AVAILABLE ?auto_796757 ) ( ON ?auto_796752 ?auto_796751 ) ( not ( = ?auto_796751 ?auto_796752 ) ) ( not ( = ?auto_796751 ?auto_796753 ) ) ( not ( = ?auto_796758 ?auto_796754 ) ) ( HOIST-AT ?auto_796759 ?auto_796758 ) ( not ( = ?auto_796757 ?auto_796759 ) ) ( AVAILABLE ?auto_796759 ) ( SURFACE-AT ?auto_796753 ?auto_796758 ) ( ON ?auto_796753 ?auto_796755 ) ( CLEAR ?auto_796753 ) ( not ( = ?auto_796752 ?auto_796755 ) ) ( not ( = ?auto_796753 ?auto_796755 ) ) ( not ( = ?auto_796751 ?auto_796755 ) ) ( TRUCK-AT ?auto_796756 ?auto_796754 ) ( ON ?auto_796749 ?auto_796748 ) ( ON ?auto_796750 ?auto_796749 ) ( ON ?auto_796751 ?auto_796750 ) ( not ( = ?auto_796748 ?auto_796749 ) ) ( not ( = ?auto_796748 ?auto_796750 ) ) ( not ( = ?auto_796748 ?auto_796751 ) ) ( not ( = ?auto_796748 ?auto_796752 ) ) ( not ( = ?auto_796748 ?auto_796753 ) ) ( not ( = ?auto_796748 ?auto_796755 ) ) ( not ( = ?auto_796749 ?auto_796750 ) ) ( not ( = ?auto_796749 ?auto_796751 ) ) ( not ( = ?auto_796749 ?auto_796752 ) ) ( not ( = ?auto_796749 ?auto_796753 ) ) ( not ( = ?auto_796749 ?auto_796755 ) ) ( not ( = ?auto_796750 ?auto_796751 ) ) ( not ( = ?auto_796750 ?auto_796752 ) ) ( not ( = ?auto_796750 ?auto_796753 ) ) ( not ( = ?auto_796750 ?auto_796755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796751 ?auto_796752 ?auto_796753 )
      ( MAKE-5CRATE-VERIFY ?auto_796748 ?auto_796749 ?auto_796750 ?auto_796751 ?auto_796752 ?auto_796753 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796799 - SURFACE
      ?auto_796800 - SURFACE
      ?auto_796801 - SURFACE
      ?auto_796802 - SURFACE
      ?auto_796803 - SURFACE
      ?auto_796804 - SURFACE
    )
    :vars
    (
      ?auto_796805 - HOIST
      ?auto_796806 - PLACE
      ?auto_796808 - PLACE
      ?auto_796810 - HOIST
      ?auto_796807 - SURFACE
      ?auto_796809 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_796805 ?auto_796806 ) ( IS-CRATE ?auto_796804 ) ( not ( = ?auto_796803 ?auto_796804 ) ) ( not ( = ?auto_796802 ?auto_796803 ) ) ( not ( = ?auto_796802 ?auto_796804 ) ) ( not ( = ?auto_796808 ?auto_796806 ) ) ( HOIST-AT ?auto_796810 ?auto_796808 ) ( not ( = ?auto_796805 ?auto_796810 ) ) ( AVAILABLE ?auto_796810 ) ( SURFACE-AT ?auto_796804 ?auto_796808 ) ( ON ?auto_796804 ?auto_796807 ) ( CLEAR ?auto_796804 ) ( not ( = ?auto_796803 ?auto_796807 ) ) ( not ( = ?auto_796804 ?auto_796807 ) ) ( not ( = ?auto_796802 ?auto_796807 ) ) ( TRUCK-AT ?auto_796809 ?auto_796806 ) ( SURFACE-AT ?auto_796802 ?auto_796806 ) ( CLEAR ?auto_796802 ) ( LIFTING ?auto_796805 ?auto_796803 ) ( IS-CRATE ?auto_796803 ) ( ON ?auto_796800 ?auto_796799 ) ( ON ?auto_796801 ?auto_796800 ) ( ON ?auto_796802 ?auto_796801 ) ( not ( = ?auto_796799 ?auto_796800 ) ) ( not ( = ?auto_796799 ?auto_796801 ) ) ( not ( = ?auto_796799 ?auto_796802 ) ) ( not ( = ?auto_796799 ?auto_796803 ) ) ( not ( = ?auto_796799 ?auto_796804 ) ) ( not ( = ?auto_796799 ?auto_796807 ) ) ( not ( = ?auto_796800 ?auto_796801 ) ) ( not ( = ?auto_796800 ?auto_796802 ) ) ( not ( = ?auto_796800 ?auto_796803 ) ) ( not ( = ?auto_796800 ?auto_796804 ) ) ( not ( = ?auto_796800 ?auto_796807 ) ) ( not ( = ?auto_796801 ?auto_796802 ) ) ( not ( = ?auto_796801 ?auto_796803 ) ) ( not ( = ?auto_796801 ?auto_796804 ) ) ( not ( = ?auto_796801 ?auto_796807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796802 ?auto_796803 ?auto_796804 )
      ( MAKE-5CRATE-VERIFY ?auto_796799 ?auto_796800 ?auto_796801 ?auto_796802 ?auto_796803 ?auto_796804 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796850 - SURFACE
      ?auto_796851 - SURFACE
      ?auto_796852 - SURFACE
      ?auto_796853 - SURFACE
      ?auto_796854 - SURFACE
      ?auto_796855 - SURFACE
    )
    :vars
    (
      ?auto_796857 - HOIST
      ?auto_796860 - PLACE
      ?auto_796859 - PLACE
      ?auto_796856 - HOIST
      ?auto_796861 - SURFACE
      ?auto_796858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_796857 ?auto_796860 ) ( IS-CRATE ?auto_796855 ) ( not ( = ?auto_796854 ?auto_796855 ) ) ( not ( = ?auto_796853 ?auto_796854 ) ) ( not ( = ?auto_796853 ?auto_796855 ) ) ( not ( = ?auto_796859 ?auto_796860 ) ) ( HOIST-AT ?auto_796856 ?auto_796859 ) ( not ( = ?auto_796857 ?auto_796856 ) ) ( AVAILABLE ?auto_796856 ) ( SURFACE-AT ?auto_796855 ?auto_796859 ) ( ON ?auto_796855 ?auto_796861 ) ( CLEAR ?auto_796855 ) ( not ( = ?auto_796854 ?auto_796861 ) ) ( not ( = ?auto_796855 ?auto_796861 ) ) ( not ( = ?auto_796853 ?auto_796861 ) ) ( TRUCK-AT ?auto_796858 ?auto_796860 ) ( SURFACE-AT ?auto_796853 ?auto_796860 ) ( CLEAR ?auto_796853 ) ( IS-CRATE ?auto_796854 ) ( AVAILABLE ?auto_796857 ) ( IN ?auto_796854 ?auto_796858 ) ( ON ?auto_796851 ?auto_796850 ) ( ON ?auto_796852 ?auto_796851 ) ( ON ?auto_796853 ?auto_796852 ) ( not ( = ?auto_796850 ?auto_796851 ) ) ( not ( = ?auto_796850 ?auto_796852 ) ) ( not ( = ?auto_796850 ?auto_796853 ) ) ( not ( = ?auto_796850 ?auto_796854 ) ) ( not ( = ?auto_796850 ?auto_796855 ) ) ( not ( = ?auto_796850 ?auto_796861 ) ) ( not ( = ?auto_796851 ?auto_796852 ) ) ( not ( = ?auto_796851 ?auto_796853 ) ) ( not ( = ?auto_796851 ?auto_796854 ) ) ( not ( = ?auto_796851 ?auto_796855 ) ) ( not ( = ?auto_796851 ?auto_796861 ) ) ( not ( = ?auto_796852 ?auto_796853 ) ) ( not ( = ?auto_796852 ?auto_796854 ) ) ( not ( = ?auto_796852 ?auto_796855 ) ) ( not ( = ?auto_796852 ?auto_796861 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796853 ?auto_796854 ?auto_796855 )
      ( MAKE-5CRATE-VERIFY ?auto_796850 ?auto_796851 ?auto_796852 ?auto_796853 ?auto_796854 ?auto_796855 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798059 - SURFACE
      ?auto_798060 - SURFACE
      ?auto_798061 - SURFACE
      ?auto_798062 - SURFACE
      ?auto_798063 - SURFACE
      ?auto_798064 - SURFACE
      ?auto_798065 - SURFACE
    )
    :vars
    (
      ?auto_798066 - HOIST
      ?auto_798067 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_798066 ?auto_798067 ) ( SURFACE-AT ?auto_798064 ?auto_798067 ) ( CLEAR ?auto_798064 ) ( LIFTING ?auto_798066 ?auto_798065 ) ( IS-CRATE ?auto_798065 ) ( not ( = ?auto_798064 ?auto_798065 ) ) ( ON ?auto_798060 ?auto_798059 ) ( ON ?auto_798061 ?auto_798060 ) ( ON ?auto_798062 ?auto_798061 ) ( ON ?auto_798063 ?auto_798062 ) ( ON ?auto_798064 ?auto_798063 ) ( not ( = ?auto_798059 ?auto_798060 ) ) ( not ( = ?auto_798059 ?auto_798061 ) ) ( not ( = ?auto_798059 ?auto_798062 ) ) ( not ( = ?auto_798059 ?auto_798063 ) ) ( not ( = ?auto_798059 ?auto_798064 ) ) ( not ( = ?auto_798059 ?auto_798065 ) ) ( not ( = ?auto_798060 ?auto_798061 ) ) ( not ( = ?auto_798060 ?auto_798062 ) ) ( not ( = ?auto_798060 ?auto_798063 ) ) ( not ( = ?auto_798060 ?auto_798064 ) ) ( not ( = ?auto_798060 ?auto_798065 ) ) ( not ( = ?auto_798061 ?auto_798062 ) ) ( not ( = ?auto_798061 ?auto_798063 ) ) ( not ( = ?auto_798061 ?auto_798064 ) ) ( not ( = ?auto_798061 ?auto_798065 ) ) ( not ( = ?auto_798062 ?auto_798063 ) ) ( not ( = ?auto_798062 ?auto_798064 ) ) ( not ( = ?auto_798062 ?auto_798065 ) ) ( not ( = ?auto_798063 ?auto_798064 ) ) ( not ( = ?auto_798063 ?auto_798065 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_798064 ?auto_798065 )
      ( MAKE-6CRATE-VERIFY ?auto_798059 ?auto_798060 ?auto_798061 ?auto_798062 ?auto_798063 ?auto_798064 ?auto_798065 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798103 - SURFACE
      ?auto_798104 - SURFACE
      ?auto_798105 - SURFACE
      ?auto_798106 - SURFACE
      ?auto_798107 - SURFACE
      ?auto_798108 - SURFACE
      ?auto_798109 - SURFACE
    )
    :vars
    (
      ?auto_798112 - HOIST
      ?auto_798111 - PLACE
      ?auto_798110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798112 ?auto_798111 ) ( SURFACE-AT ?auto_798108 ?auto_798111 ) ( CLEAR ?auto_798108 ) ( IS-CRATE ?auto_798109 ) ( not ( = ?auto_798108 ?auto_798109 ) ) ( TRUCK-AT ?auto_798110 ?auto_798111 ) ( AVAILABLE ?auto_798112 ) ( IN ?auto_798109 ?auto_798110 ) ( ON ?auto_798108 ?auto_798107 ) ( not ( = ?auto_798107 ?auto_798108 ) ) ( not ( = ?auto_798107 ?auto_798109 ) ) ( ON ?auto_798104 ?auto_798103 ) ( ON ?auto_798105 ?auto_798104 ) ( ON ?auto_798106 ?auto_798105 ) ( ON ?auto_798107 ?auto_798106 ) ( not ( = ?auto_798103 ?auto_798104 ) ) ( not ( = ?auto_798103 ?auto_798105 ) ) ( not ( = ?auto_798103 ?auto_798106 ) ) ( not ( = ?auto_798103 ?auto_798107 ) ) ( not ( = ?auto_798103 ?auto_798108 ) ) ( not ( = ?auto_798103 ?auto_798109 ) ) ( not ( = ?auto_798104 ?auto_798105 ) ) ( not ( = ?auto_798104 ?auto_798106 ) ) ( not ( = ?auto_798104 ?auto_798107 ) ) ( not ( = ?auto_798104 ?auto_798108 ) ) ( not ( = ?auto_798104 ?auto_798109 ) ) ( not ( = ?auto_798105 ?auto_798106 ) ) ( not ( = ?auto_798105 ?auto_798107 ) ) ( not ( = ?auto_798105 ?auto_798108 ) ) ( not ( = ?auto_798105 ?auto_798109 ) ) ( not ( = ?auto_798106 ?auto_798107 ) ) ( not ( = ?auto_798106 ?auto_798108 ) ) ( not ( = ?auto_798106 ?auto_798109 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798107 ?auto_798108 ?auto_798109 )
      ( MAKE-6CRATE-VERIFY ?auto_798103 ?auto_798104 ?auto_798105 ?auto_798106 ?auto_798107 ?auto_798108 ?auto_798109 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798154 - SURFACE
      ?auto_798155 - SURFACE
      ?auto_798156 - SURFACE
      ?auto_798157 - SURFACE
      ?auto_798158 - SURFACE
      ?auto_798159 - SURFACE
      ?auto_798160 - SURFACE
    )
    :vars
    (
      ?auto_798163 - HOIST
      ?auto_798164 - PLACE
      ?auto_798162 - TRUCK
      ?auto_798161 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_798163 ?auto_798164 ) ( SURFACE-AT ?auto_798159 ?auto_798164 ) ( CLEAR ?auto_798159 ) ( IS-CRATE ?auto_798160 ) ( not ( = ?auto_798159 ?auto_798160 ) ) ( AVAILABLE ?auto_798163 ) ( IN ?auto_798160 ?auto_798162 ) ( ON ?auto_798159 ?auto_798158 ) ( not ( = ?auto_798158 ?auto_798159 ) ) ( not ( = ?auto_798158 ?auto_798160 ) ) ( TRUCK-AT ?auto_798162 ?auto_798161 ) ( not ( = ?auto_798161 ?auto_798164 ) ) ( ON ?auto_798155 ?auto_798154 ) ( ON ?auto_798156 ?auto_798155 ) ( ON ?auto_798157 ?auto_798156 ) ( ON ?auto_798158 ?auto_798157 ) ( not ( = ?auto_798154 ?auto_798155 ) ) ( not ( = ?auto_798154 ?auto_798156 ) ) ( not ( = ?auto_798154 ?auto_798157 ) ) ( not ( = ?auto_798154 ?auto_798158 ) ) ( not ( = ?auto_798154 ?auto_798159 ) ) ( not ( = ?auto_798154 ?auto_798160 ) ) ( not ( = ?auto_798155 ?auto_798156 ) ) ( not ( = ?auto_798155 ?auto_798157 ) ) ( not ( = ?auto_798155 ?auto_798158 ) ) ( not ( = ?auto_798155 ?auto_798159 ) ) ( not ( = ?auto_798155 ?auto_798160 ) ) ( not ( = ?auto_798156 ?auto_798157 ) ) ( not ( = ?auto_798156 ?auto_798158 ) ) ( not ( = ?auto_798156 ?auto_798159 ) ) ( not ( = ?auto_798156 ?auto_798160 ) ) ( not ( = ?auto_798157 ?auto_798158 ) ) ( not ( = ?auto_798157 ?auto_798159 ) ) ( not ( = ?auto_798157 ?auto_798160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798158 ?auto_798159 ?auto_798160 )
      ( MAKE-6CRATE-VERIFY ?auto_798154 ?auto_798155 ?auto_798156 ?auto_798157 ?auto_798158 ?auto_798159 ?auto_798160 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798211 - SURFACE
      ?auto_798212 - SURFACE
      ?auto_798213 - SURFACE
      ?auto_798214 - SURFACE
      ?auto_798215 - SURFACE
      ?auto_798216 - SURFACE
      ?auto_798217 - SURFACE
    )
    :vars
    (
      ?auto_798221 - HOIST
      ?auto_798222 - PLACE
      ?auto_798218 - TRUCK
      ?auto_798219 - PLACE
      ?auto_798220 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_798221 ?auto_798222 ) ( SURFACE-AT ?auto_798216 ?auto_798222 ) ( CLEAR ?auto_798216 ) ( IS-CRATE ?auto_798217 ) ( not ( = ?auto_798216 ?auto_798217 ) ) ( AVAILABLE ?auto_798221 ) ( ON ?auto_798216 ?auto_798215 ) ( not ( = ?auto_798215 ?auto_798216 ) ) ( not ( = ?auto_798215 ?auto_798217 ) ) ( TRUCK-AT ?auto_798218 ?auto_798219 ) ( not ( = ?auto_798219 ?auto_798222 ) ) ( HOIST-AT ?auto_798220 ?auto_798219 ) ( LIFTING ?auto_798220 ?auto_798217 ) ( not ( = ?auto_798221 ?auto_798220 ) ) ( ON ?auto_798212 ?auto_798211 ) ( ON ?auto_798213 ?auto_798212 ) ( ON ?auto_798214 ?auto_798213 ) ( ON ?auto_798215 ?auto_798214 ) ( not ( = ?auto_798211 ?auto_798212 ) ) ( not ( = ?auto_798211 ?auto_798213 ) ) ( not ( = ?auto_798211 ?auto_798214 ) ) ( not ( = ?auto_798211 ?auto_798215 ) ) ( not ( = ?auto_798211 ?auto_798216 ) ) ( not ( = ?auto_798211 ?auto_798217 ) ) ( not ( = ?auto_798212 ?auto_798213 ) ) ( not ( = ?auto_798212 ?auto_798214 ) ) ( not ( = ?auto_798212 ?auto_798215 ) ) ( not ( = ?auto_798212 ?auto_798216 ) ) ( not ( = ?auto_798212 ?auto_798217 ) ) ( not ( = ?auto_798213 ?auto_798214 ) ) ( not ( = ?auto_798213 ?auto_798215 ) ) ( not ( = ?auto_798213 ?auto_798216 ) ) ( not ( = ?auto_798213 ?auto_798217 ) ) ( not ( = ?auto_798214 ?auto_798215 ) ) ( not ( = ?auto_798214 ?auto_798216 ) ) ( not ( = ?auto_798214 ?auto_798217 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798215 ?auto_798216 ?auto_798217 )
      ( MAKE-6CRATE-VERIFY ?auto_798211 ?auto_798212 ?auto_798213 ?auto_798214 ?auto_798215 ?auto_798216 ?auto_798217 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798274 - SURFACE
      ?auto_798275 - SURFACE
      ?auto_798276 - SURFACE
      ?auto_798277 - SURFACE
      ?auto_798278 - SURFACE
      ?auto_798279 - SURFACE
      ?auto_798280 - SURFACE
    )
    :vars
    (
      ?auto_798282 - HOIST
      ?auto_798281 - PLACE
      ?auto_798286 - TRUCK
      ?auto_798283 - PLACE
      ?auto_798284 - HOIST
      ?auto_798285 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_798282 ?auto_798281 ) ( SURFACE-AT ?auto_798279 ?auto_798281 ) ( CLEAR ?auto_798279 ) ( IS-CRATE ?auto_798280 ) ( not ( = ?auto_798279 ?auto_798280 ) ) ( AVAILABLE ?auto_798282 ) ( ON ?auto_798279 ?auto_798278 ) ( not ( = ?auto_798278 ?auto_798279 ) ) ( not ( = ?auto_798278 ?auto_798280 ) ) ( TRUCK-AT ?auto_798286 ?auto_798283 ) ( not ( = ?auto_798283 ?auto_798281 ) ) ( HOIST-AT ?auto_798284 ?auto_798283 ) ( not ( = ?auto_798282 ?auto_798284 ) ) ( AVAILABLE ?auto_798284 ) ( SURFACE-AT ?auto_798280 ?auto_798283 ) ( ON ?auto_798280 ?auto_798285 ) ( CLEAR ?auto_798280 ) ( not ( = ?auto_798279 ?auto_798285 ) ) ( not ( = ?auto_798280 ?auto_798285 ) ) ( not ( = ?auto_798278 ?auto_798285 ) ) ( ON ?auto_798275 ?auto_798274 ) ( ON ?auto_798276 ?auto_798275 ) ( ON ?auto_798277 ?auto_798276 ) ( ON ?auto_798278 ?auto_798277 ) ( not ( = ?auto_798274 ?auto_798275 ) ) ( not ( = ?auto_798274 ?auto_798276 ) ) ( not ( = ?auto_798274 ?auto_798277 ) ) ( not ( = ?auto_798274 ?auto_798278 ) ) ( not ( = ?auto_798274 ?auto_798279 ) ) ( not ( = ?auto_798274 ?auto_798280 ) ) ( not ( = ?auto_798274 ?auto_798285 ) ) ( not ( = ?auto_798275 ?auto_798276 ) ) ( not ( = ?auto_798275 ?auto_798277 ) ) ( not ( = ?auto_798275 ?auto_798278 ) ) ( not ( = ?auto_798275 ?auto_798279 ) ) ( not ( = ?auto_798275 ?auto_798280 ) ) ( not ( = ?auto_798275 ?auto_798285 ) ) ( not ( = ?auto_798276 ?auto_798277 ) ) ( not ( = ?auto_798276 ?auto_798278 ) ) ( not ( = ?auto_798276 ?auto_798279 ) ) ( not ( = ?auto_798276 ?auto_798280 ) ) ( not ( = ?auto_798276 ?auto_798285 ) ) ( not ( = ?auto_798277 ?auto_798278 ) ) ( not ( = ?auto_798277 ?auto_798279 ) ) ( not ( = ?auto_798277 ?auto_798280 ) ) ( not ( = ?auto_798277 ?auto_798285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798278 ?auto_798279 ?auto_798280 )
      ( MAKE-6CRATE-VERIFY ?auto_798274 ?auto_798275 ?auto_798276 ?auto_798277 ?auto_798278 ?auto_798279 ?auto_798280 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798338 - SURFACE
      ?auto_798339 - SURFACE
      ?auto_798340 - SURFACE
      ?auto_798341 - SURFACE
      ?auto_798342 - SURFACE
      ?auto_798343 - SURFACE
      ?auto_798344 - SURFACE
    )
    :vars
    (
      ?auto_798345 - HOIST
      ?auto_798347 - PLACE
      ?auto_798346 - PLACE
      ?auto_798349 - HOIST
      ?auto_798350 - SURFACE
      ?auto_798348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798345 ?auto_798347 ) ( SURFACE-AT ?auto_798343 ?auto_798347 ) ( CLEAR ?auto_798343 ) ( IS-CRATE ?auto_798344 ) ( not ( = ?auto_798343 ?auto_798344 ) ) ( AVAILABLE ?auto_798345 ) ( ON ?auto_798343 ?auto_798342 ) ( not ( = ?auto_798342 ?auto_798343 ) ) ( not ( = ?auto_798342 ?auto_798344 ) ) ( not ( = ?auto_798346 ?auto_798347 ) ) ( HOIST-AT ?auto_798349 ?auto_798346 ) ( not ( = ?auto_798345 ?auto_798349 ) ) ( AVAILABLE ?auto_798349 ) ( SURFACE-AT ?auto_798344 ?auto_798346 ) ( ON ?auto_798344 ?auto_798350 ) ( CLEAR ?auto_798344 ) ( not ( = ?auto_798343 ?auto_798350 ) ) ( not ( = ?auto_798344 ?auto_798350 ) ) ( not ( = ?auto_798342 ?auto_798350 ) ) ( TRUCK-AT ?auto_798348 ?auto_798347 ) ( ON ?auto_798339 ?auto_798338 ) ( ON ?auto_798340 ?auto_798339 ) ( ON ?auto_798341 ?auto_798340 ) ( ON ?auto_798342 ?auto_798341 ) ( not ( = ?auto_798338 ?auto_798339 ) ) ( not ( = ?auto_798338 ?auto_798340 ) ) ( not ( = ?auto_798338 ?auto_798341 ) ) ( not ( = ?auto_798338 ?auto_798342 ) ) ( not ( = ?auto_798338 ?auto_798343 ) ) ( not ( = ?auto_798338 ?auto_798344 ) ) ( not ( = ?auto_798338 ?auto_798350 ) ) ( not ( = ?auto_798339 ?auto_798340 ) ) ( not ( = ?auto_798339 ?auto_798341 ) ) ( not ( = ?auto_798339 ?auto_798342 ) ) ( not ( = ?auto_798339 ?auto_798343 ) ) ( not ( = ?auto_798339 ?auto_798344 ) ) ( not ( = ?auto_798339 ?auto_798350 ) ) ( not ( = ?auto_798340 ?auto_798341 ) ) ( not ( = ?auto_798340 ?auto_798342 ) ) ( not ( = ?auto_798340 ?auto_798343 ) ) ( not ( = ?auto_798340 ?auto_798344 ) ) ( not ( = ?auto_798340 ?auto_798350 ) ) ( not ( = ?auto_798341 ?auto_798342 ) ) ( not ( = ?auto_798341 ?auto_798343 ) ) ( not ( = ?auto_798341 ?auto_798344 ) ) ( not ( = ?auto_798341 ?auto_798350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798342 ?auto_798343 ?auto_798344 )
      ( MAKE-6CRATE-VERIFY ?auto_798338 ?auto_798339 ?auto_798340 ?auto_798341 ?auto_798342 ?auto_798343 ?auto_798344 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798402 - SURFACE
      ?auto_798403 - SURFACE
      ?auto_798404 - SURFACE
      ?auto_798405 - SURFACE
      ?auto_798406 - SURFACE
      ?auto_798407 - SURFACE
      ?auto_798408 - SURFACE
    )
    :vars
    (
      ?auto_798410 - HOIST
      ?auto_798411 - PLACE
      ?auto_798409 - PLACE
      ?auto_798413 - HOIST
      ?auto_798414 - SURFACE
      ?auto_798412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798410 ?auto_798411 ) ( IS-CRATE ?auto_798408 ) ( not ( = ?auto_798407 ?auto_798408 ) ) ( not ( = ?auto_798406 ?auto_798407 ) ) ( not ( = ?auto_798406 ?auto_798408 ) ) ( not ( = ?auto_798409 ?auto_798411 ) ) ( HOIST-AT ?auto_798413 ?auto_798409 ) ( not ( = ?auto_798410 ?auto_798413 ) ) ( AVAILABLE ?auto_798413 ) ( SURFACE-AT ?auto_798408 ?auto_798409 ) ( ON ?auto_798408 ?auto_798414 ) ( CLEAR ?auto_798408 ) ( not ( = ?auto_798407 ?auto_798414 ) ) ( not ( = ?auto_798408 ?auto_798414 ) ) ( not ( = ?auto_798406 ?auto_798414 ) ) ( TRUCK-AT ?auto_798412 ?auto_798411 ) ( SURFACE-AT ?auto_798406 ?auto_798411 ) ( CLEAR ?auto_798406 ) ( LIFTING ?auto_798410 ?auto_798407 ) ( IS-CRATE ?auto_798407 ) ( ON ?auto_798403 ?auto_798402 ) ( ON ?auto_798404 ?auto_798403 ) ( ON ?auto_798405 ?auto_798404 ) ( ON ?auto_798406 ?auto_798405 ) ( not ( = ?auto_798402 ?auto_798403 ) ) ( not ( = ?auto_798402 ?auto_798404 ) ) ( not ( = ?auto_798402 ?auto_798405 ) ) ( not ( = ?auto_798402 ?auto_798406 ) ) ( not ( = ?auto_798402 ?auto_798407 ) ) ( not ( = ?auto_798402 ?auto_798408 ) ) ( not ( = ?auto_798402 ?auto_798414 ) ) ( not ( = ?auto_798403 ?auto_798404 ) ) ( not ( = ?auto_798403 ?auto_798405 ) ) ( not ( = ?auto_798403 ?auto_798406 ) ) ( not ( = ?auto_798403 ?auto_798407 ) ) ( not ( = ?auto_798403 ?auto_798408 ) ) ( not ( = ?auto_798403 ?auto_798414 ) ) ( not ( = ?auto_798404 ?auto_798405 ) ) ( not ( = ?auto_798404 ?auto_798406 ) ) ( not ( = ?auto_798404 ?auto_798407 ) ) ( not ( = ?auto_798404 ?auto_798408 ) ) ( not ( = ?auto_798404 ?auto_798414 ) ) ( not ( = ?auto_798405 ?auto_798406 ) ) ( not ( = ?auto_798405 ?auto_798407 ) ) ( not ( = ?auto_798405 ?auto_798408 ) ) ( not ( = ?auto_798405 ?auto_798414 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798406 ?auto_798407 ?auto_798408 )
      ( MAKE-6CRATE-VERIFY ?auto_798402 ?auto_798403 ?auto_798404 ?auto_798405 ?auto_798406 ?auto_798407 ?auto_798408 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798466 - SURFACE
      ?auto_798467 - SURFACE
      ?auto_798468 - SURFACE
      ?auto_798469 - SURFACE
      ?auto_798470 - SURFACE
      ?auto_798471 - SURFACE
      ?auto_798472 - SURFACE
    )
    :vars
    (
      ?auto_798473 - HOIST
      ?auto_798476 - PLACE
      ?auto_798475 - PLACE
      ?auto_798474 - HOIST
      ?auto_798478 - SURFACE
      ?auto_798477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798473 ?auto_798476 ) ( IS-CRATE ?auto_798472 ) ( not ( = ?auto_798471 ?auto_798472 ) ) ( not ( = ?auto_798470 ?auto_798471 ) ) ( not ( = ?auto_798470 ?auto_798472 ) ) ( not ( = ?auto_798475 ?auto_798476 ) ) ( HOIST-AT ?auto_798474 ?auto_798475 ) ( not ( = ?auto_798473 ?auto_798474 ) ) ( AVAILABLE ?auto_798474 ) ( SURFACE-AT ?auto_798472 ?auto_798475 ) ( ON ?auto_798472 ?auto_798478 ) ( CLEAR ?auto_798472 ) ( not ( = ?auto_798471 ?auto_798478 ) ) ( not ( = ?auto_798472 ?auto_798478 ) ) ( not ( = ?auto_798470 ?auto_798478 ) ) ( TRUCK-AT ?auto_798477 ?auto_798476 ) ( SURFACE-AT ?auto_798470 ?auto_798476 ) ( CLEAR ?auto_798470 ) ( IS-CRATE ?auto_798471 ) ( AVAILABLE ?auto_798473 ) ( IN ?auto_798471 ?auto_798477 ) ( ON ?auto_798467 ?auto_798466 ) ( ON ?auto_798468 ?auto_798467 ) ( ON ?auto_798469 ?auto_798468 ) ( ON ?auto_798470 ?auto_798469 ) ( not ( = ?auto_798466 ?auto_798467 ) ) ( not ( = ?auto_798466 ?auto_798468 ) ) ( not ( = ?auto_798466 ?auto_798469 ) ) ( not ( = ?auto_798466 ?auto_798470 ) ) ( not ( = ?auto_798466 ?auto_798471 ) ) ( not ( = ?auto_798466 ?auto_798472 ) ) ( not ( = ?auto_798466 ?auto_798478 ) ) ( not ( = ?auto_798467 ?auto_798468 ) ) ( not ( = ?auto_798467 ?auto_798469 ) ) ( not ( = ?auto_798467 ?auto_798470 ) ) ( not ( = ?auto_798467 ?auto_798471 ) ) ( not ( = ?auto_798467 ?auto_798472 ) ) ( not ( = ?auto_798467 ?auto_798478 ) ) ( not ( = ?auto_798468 ?auto_798469 ) ) ( not ( = ?auto_798468 ?auto_798470 ) ) ( not ( = ?auto_798468 ?auto_798471 ) ) ( not ( = ?auto_798468 ?auto_798472 ) ) ( not ( = ?auto_798468 ?auto_798478 ) ) ( not ( = ?auto_798469 ?auto_798470 ) ) ( not ( = ?auto_798469 ?auto_798471 ) ) ( not ( = ?auto_798469 ?auto_798472 ) ) ( not ( = ?auto_798469 ?auto_798478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798470 ?auto_798471 ?auto_798472 )
      ( MAKE-6CRATE-VERIFY ?auto_798466 ?auto_798467 ?auto_798468 ?auto_798469 ?auto_798470 ?auto_798471 ?auto_798472 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_798479 - SURFACE
      ?auto_798480 - SURFACE
    )
    :vars
    (
      ?auto_798481 - HOIST
      ?auto_798484 - PLACE
      ?auto_798485 - SURFACE
      ?auto_798483 - PLACE
      ?auto_798482 - HOIST
      ?auto_798487 - SURFACE
      ?auto_798486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798481 ?auto_798484 ) ( IS-CRATE ?auto_798480 ) ( not ( = ?auto_798479 ?auto_798480 ) ) ( not ( = ?auto_798485 ?auto_798479 ) ) ( not ( = ?auto_798485 ?auto_798480 ) ) ( not ( = ?auto_798483 ?auto_798484 ) ) ( HOIST-AT ?auto_798482 ?auto_798483 ) ( not ( = ?auto_798481 ?auto_798482 ) ) ( AVAILABLE ?auto_798482 ) ( SURFACE-AT ?auto_798480 ?auto_798483 ) ( ON ?auto_798480 ?auto_798487 ) ( CLEAR ?auto_798480 ) ( not ( = ?auto_798479 ?auto_798487 ) ) ( not ( = ?auto_798480 ?auto_798487 ) ) ( not ( = ?auto_798485 ?auto_798487 ) ) ( SURFACE-AT ?auto_798485 ?auto_798484 ) ( CLEAR ?auto_798485 ) ( IS-CRATE ?auto_798479 ) ( AVAILABLE ?auto_798481 ) ( IN ?auto_798479 ?auto_798486 ) ( TRUCK-AT ?auto_798486 ?auto_798483 ) )
    :subtasks
    ( ( !DRIVE ?auto_798486 ?auto_798483 ?auto_798484 )
      ( MAKE-2CRATE ?auto_798485 ?auto_798479 ?auto_798480 )
      ( MAKE-1CRATE-VERIFY ?auto_798479 ?auto_798480 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_798488 - SURFACE
      ?auto_798489 - SURFACE
      ?auto_798490 - SURFACE
    )
    :vars
    (
      ?auto_798496 - HOIST
      ?auto_798494 - PLACE
      ?auto_798492 - PLACE
      ?auto_798491 - HOIST
      ?auto_798495 - SURFACE
      ?auto_798493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798496 ?auto_798494 ) ( IS-CRATE ?auto_798490 ) ( not ( = ?auto_798489 ?auto_798490 ) ) ( not ( = ?auto_798488 ?auto_798489 ) ) ( not ( = ?auto_798488 ?auto_798490 ) ) ( not ( = ?auto_798492 ?auto_798494 ) ) ( HOIST-AT ?auto_798491 ?auto_798492 ) ( not ( = ?auto_798496 ?auto_798491 ) ) ( AVAILABLE ?auto_798491 ) ( SURFACE-AT ?auto_798490 ?auto_798492 ) ( ON ?auto_798490 ?auto_798495 ) ( CLEAR ?auto_798490 ) ( not ( = ?auto_798489 ?auto_798495 ) ) ( not ( = ?auto_798490 ?auto_798495 ) ) ( not ( = ?auto_798488 ?auto_798495 ) ) ( SURFACE-AT ?auto_798488 ?auto_798494 ) ( CLEAR ?auto_798488 ) ( IS-CRATE ?auto_798489 ) ( AVAILABLE ?auto_798496 ) ( IN ?auto_798489 ?auto_798493 ) ( TRUCK-AT ?auto_798493 ?auto_798492 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_798489 ?auto_798490 )
      ( MAKE-2CRATE-VERIFY ?auto_798488 ?auto_798489 ?auto_798490 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_798497 - SURFACE
      ?auto_798498 - SURFACE
      ?auto_798499 - SURFACE
      ?auto_798500 - SURFACE
    )
    :vars
    (
      ?auto_798501 - HOIST
      ?auto_798504 - PLACE
      ?auto_798503 - PLACE
      ?auto_798502 - HOIST
      ?auto_798506 - SURFACE
      ?auto_798505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798501 ?auto_798504 ) ( IS-CRATE ?auto_798500 ) ( not ( = ?auto_798499 ?auto_798500 ) ) ( not ( = ?auto_798498 ?auto_798499 ) ) ( not ( = ?auto_798498 ?auto_798500 ) ) ( not ( = ?auto_798503 ?auto_798504 ) ) ( HOIST-AT ?auto_798502 ?auto_798503 ) ( not ( = ?auto_798501 ?auto_798502 ) ) ( AVAILABLE ?auto_798502 ) ( SURFACE-AT ?auto_798500 ?auto_798503 ) ( ON ?auto_798500 ?auto_798506 ) ( CLEAR ?auto_798500 ) ( not ( = ?auto_798499 ?auto_798506 ) ) ( not ( = ?auto_798500 ?auto_798506 ) ) ( not ( = ?auto_798498 ?auto_798506 ) ) ( SURFACE-AT ?auto_798498 ?auto_798504 ) ( CLEAR ?auto_798498 ) ( IS-CRATE ?auto_798499 ) ( AVAILABLE ?auto_798501 ) ( IN ?auto_798499 ?auto_798505 ) ( TRUCK-AT ?auto_798505 ?auto_798503 ) ( ON ?auto_798498 ?auto_798497 ) ( not ( = ?auto_798497 ?auto_798498 ) ) ( not ( = ?auto_798497 ?auto_798499 ) ) ( not ( = ?auto_798497 ?auto_798500 ) ) ( not ( = ?auto_798497 ?auto_798506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798498 ?auto_798499 ?auto_798500 )
      ( MAKE-3CRATE-VERIFY ?auto_798497 ?auto_798498 ?auto_798499 ?auto_798500 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_798507 - SURFACE
      ?auto_798508 - SURFACE
      ?auto_798509 - SURFACE
      ?auto_798510 - SURFACE
      ?auto_798511 - SURFACE
    )
    :vars
    (
      ?auto_798512 - HOIST
      ?auto_798515 - PLACE
      ?auto_798514 - PLACE
      ?auto_798513 - HOIST
      ?auto_798517 - SURFACE
      ?auto_798516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798512 ?auto_798515 ) ( IS-CRATE ?auto_798511 ) ( not ( = ?auto_798510 ?auto_798511 ) ) ( not ( = ?auto_798509 ?auto_798510 ) ) ( not ( = ?auto_798509 ?auto_798511 ) ) ( not ( = ?auto_798514 ?auto_798515 ) ) ( HOIST-AT ?auto_798513 ?auto_798514 ) ( not ( = ?auto_798512 ?auto_798513 ) ) ( AVAILABLE ?auto_798513 ) ( SURFACE-AT ?auto_798511 ?auto_798514 ) ( ON ?auto_798511 ?auto_798517 ) ( CLEAR ?auto_798511 ) ( not ( = ?auto_798510 ?auto_798517 ) ) ( not ( = ?auto_798511 ?auto_798517 ) ) ( not ( = ?auto_798509 ?auto_798517 ) ) ( SURFACE-AT ?auto_798509 ?auto_798515 ) ( CLEAR ?auto_798509 ) ( IS-CRATE ?auto_798510 ) ( AVAILABLE ?auto_798512 ) ( IN ?auto_798510 ?auto_798516 ) ( TRUCK-AT ?auto_798516 ?auto_798514 ) ( ON ?auto_798508 ?auto_798507 ) ( ON ?auto_798509 ?auto_798508 ) ( not ( = ?auto_798507 ?auto_798508 ) ) ( not ( = ?auto_798507 ?auto_798509 ) ) ( not ( = ?auto_798507 ?auto_798510 ) ) ( not ( = ?auto_798507 ?auto_798511 ) ) ( not ( = ?auto_798507 ?auto_798517 ) ) ( not ( = ?auto_798508 ?auto_798509 ) ) ( not ( = ?auto_798508 ?auto_798510 ) ) ( not ( = ?auto_798508 ?auto_798511 ) ) ( not ( = ?auto_798508 ?auto_798517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798509 ?auto_798510 ?auto_798511 )
      ( MAKE-4CRATE-VERIFY ?auto_798507 ?auto_798508 ?auto_798509 ?auto_798510 ?auto_798511 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_798518 - SURFACE
      ?auto_798519 - SURFACE
      ?auto_798520 - SURFACE
      ?auto_798521 - SURFACE
      ?auto_798522 - SURFACE
      ?auto_798523 - SURFACE
    )
    :vars
    (
      ?auto_798524 - HOIST
      ?auto_798527 - PLACE
      ?auto_798526 - PLACE
      ?auto_798525 - HOIST
      ?auto_798529 - SURFACE
      ?auto_798528 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798524 ?auto_798527 ) ( IS-CRATE ?auto_798523 ) ( not ( = ?auto_798522 ?auto_798523 ) ) ( not ( = ?auto_798521 ?auto_798522 ) ) ( not ( = ?auto_798521 ?auto_798523 ) ) ( not ( = ?auto_798526 ?auto_798527 ) ) ( HOIST-AT ?auto_798525 ?auto_798526 ) ( not ( = ?auto_798524 ?auto_798525 ) ) ( AVAILABLE ?auto_798525 ) ( SURFACE-AT ?auto_798523 ?auto_798526 ) ( ON ?auto_798523 ?auto_798529 ) ( CLEAR ?auto_798523 ) ( not ( = ?auto_798522 ?auto_798529 ) ) ( not ( = ?auto_798523 ?auto_798529 ) ) ( not ( = ?auto_798521 ?auto_798529 ) ) ( SURFACE-AT ?auto_798521 ?auto_798527 ) ( CLEAR ?auto_798521 ) ( IS-CRATE ?auto_798522 ) ( AVAILABLE ?auto_798524 ) ( IN ?auto_798522 ?auto_798528 ) ( TRUCK-AT ?auto_798528 ?auto_798526 ) ( ON ?auto_798519 ?auto_798518 ) ( ON ?auto_798520 ?auto_798519 ) ( ON ?auto_798521 ?auto_798520 ) ( not ( = ?auto_798518 ?auto_798519 ) ) ( not ( = ?auto_798518 ?auto_798520 ) ) ( not ( = ?auto_798518 ?auto_798521 ) ) ( not ( = ?auto_798518 ?auto_798522 ) ) ( not ( = ?auto_798518 ?auto_798523 ) ) ( not ( = ?auto_798518 ?auto_798529 ) ) ( not ( = ?auto_798519 ?auto_798520 ) ) ( not ( = ?auto_798519 ?auto_798521 ) ) ( not ( = ?auto_798519 ?auto_798522 ) ) ( not ( = ?auto_798519 ?auto_798523 ) ) ( not ( = ?auto_798519 ?auto_798529 ) ) ( not ( = ?auto_798520 ?auto_798521 ) ) ( not ( = ?auto_798520 ?auto_798522 ) ) ( not ( = ?auto_798520 ?auto_798523 ) ) ( not ( = ?auto_798520 ?auto_798529 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798521 ?auto_798522 ?auto_798523 )
      ( MAKE-5CRATE-VERIFY ?auto_798518 ?auto_798519 ?auto_798520 ?auto_798521 ?auto_798522 ?auto_798523 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798530 - SURFACE
      ?auto_798531 - SURFACE
      ?auto_798532 - SURFACE
      ?auto_798533 - SURFACE
      ?auto_798534 - SURFACE
      ?auto_798535 - SURFACE
      ?auto_798536 - SURFACE
    )
    :vars
    (
      ?auto_798537 - HOIST
      ?auto_798540 - PLACE
      ?auto_798539 - PLACE
      ?auto_798538 - HOIST
      ?auto_798542 - SURFACE
      ?auto_798541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798537 ?auto_798540 ) ( IS-CRATE ?auto_798536 ) ( not ( = ?auto_798535 ?auto_798536 ) ) ( not ( = ?auto_798534 ?auto_798535 ) ) ( not ( = ?auto_798534 ?auto_798536 ) ) ( not ( = ?auto_798539 ?auto_798540 ) ) ( HOIST-AT ?auto_798538 ?auto_798539 ) ( not ( = ?auto_798537 ?auto_798538 ) ) ( AVAILABLE ?auto_798538 ) ( SURFACE-AT ?auto_798536 ?auto_798539 ) ( ON ?auto_798536 ?auto_798542 ) ( CLEAR ?auto_798536 ) ( not ( = ?auto_798535 ?auto_798542 ) ) ( not ( = ?auto_798536 ?auto_798542 ) ) ( not ( = ?auto_798534 ?auto_798542 ) ) ( SURFACE-AT ?auto_798534 ?auto_798540 ) ( CLEAR ?auto_798534 ) ( IS-CRATE ?auto_798535 ) ( AVAILABLE ?auto_798537 ) ( IN ?auto_798535 ?auto_798541 ) ( TRUCK-AT ?auto_798541 ?auto_798539 ) ( ON ?auto_798531 ?auto_798530 ) ( ON ?auto_798532 ?auto_798531 ) ( ON ?auto_798533 ?auto_798532 ) ( ON ?auto_798534 ?auto_798533 ) ( not ( = ?auto_798530 ?auto_798531 ) ) ( not ( = ?auto_798530 ?auto_798532 ) ) ( not ( = ?auto_798530 ?auto_798533 ) ) ( not ( = ?auto_798530 ?auto_798534 ) ) ( not ( = ?auto_798530 ?auto_798535 ) ) ( not ( = ?auto_798530 ?auto_798536 ) ) ( not ( = ?auto_798530 ?auto_798542 ) ) ( not ( = ?auto_798531 ?auto_798532 ) ) ( not ( = ?auto_798531 ?auto_798533 ) ) ( not ( = ?auto_798531 ?auto_798534 ) ) ( not ( = ?auto_798531 ?auto_798535 ) ) ( not ( = ?auto_798531 ?auto_798536 ) ) ( not ( = ?auto_798531 ?auto_798542 ) ) ( not ( = ?auto_798532 ?auto_798533 ) ) ( not ( = ?auto_798532 ?auto_798534 ) ) ( not ( = ?auto_798532 ?auto_798535 ) ) ( not ( = ?auto_798532 ?auto_798536 ) ) ( not ( = ?auto_798532 ?auto_798542 ) ) ( not ( = ?auto_798533 ?auto_798534 ) ) ( not ( = ?auto_798533 ?auto_798535 ) ) ( not ( = ?auto_798533 ?auto_798536 ) ) ( not ( = ?auto_798533 ?auto_798542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798534 ?auto_798535 ?auto_798536 )
      ( MAKE-6CRATE-VERIFY ?auto_798530 ?auto_798531 ?auto_798532 ?auto_798533 ?auto_798534 ?auto_798535 ?auto_798536 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_798543 - SURFACE
      ?auto_798544 - SURFACE
    )
    :vars
    (
      ?auto_798545 - HOIST
      ?auto_798548 - PLACE
      ?auto_798551 - SURFACE
      ?auto_798547 - PLACE
      ?auto_798546 - HOIST
      ?auto_798550 - SURFACE
      ?auto_798549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798545 ?auto_798548 ) ( IS-CRATE ?auto_798544 ) ( not ( = ?auto_798543 ?auto_798544 ) ) ( not ( = ?auto_798551 ?auto_798543 ) ) ( not ( = ?auto_798551 ?auto_798544 ) ) ( not ( = ?auto_798547 ?auto_798548 ) ) ( HOIST-AT ?auto_798546 ?auto_798547 ) ( not ( = ?auto_798545 ?auto_798546 ) ) ( SURFACE-AT ?auto_798544 ?auto_798547 ) ( ON ?auto_798544 ?auto_798550 ) ( CLEAR ?auto_798544 ) ( not ( = ?auto_798543 ?auto_798550 ) ) ( not ( = ?auto_798544 ?auto_798550 ) ) ( not ( = ?auto_798551 ?auto_798550 ) ) ( SURFACE-AT ?auto_798551 ?auto_798548 ) ( CLEAR ?auto_798551 ) ( IS-CRATE ?auto_798543 ) ( AVAILABLE ?auto_798545 ) ( TRUCK-AT ?auto_798549 ?auto_798547 ) ( LIFTING ?auto_798546 ?auto_798543 ) )
    :subtasks
    ( ( !LOAD ?auto_798546 ?auto_798543 ?auto_798549 ?auto_798547 )
      ( MAKE-2CRATE ?auto_798551 ?auto_798543 ?auto_798544 )
      ( MAKE-1CRATE-VERIFY ?auto_798543 ?auto_798544 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_798552 - SURFACE
      ?auto_798553 - SURFACE
      ?auto_798554 - SURFACE
    )
    :vars
    (
      ?auto_798559 - HOIST
      ?auto_798557 - PLACE
      ?auto_798560 - PLACE
      ?auto_798555 - HOIST
      ?auto_798556 - SURFACE
      ?auto_798558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798559 ?auto_798557 ) ( IS-CRATE ?auto_798554 ) ( not ( = ?auto_798553 ?auto_798554 ) ) ( not ( = ?auto_798552 ?auto_798553 ) ) ( not ( = ?auto_798552 ?auto_798554 ) ) ( not ( = ?auto_798560 ?auto_798557 ) ) ( HOIST-AT ?auto_798555 ?auto_798560 ) ( not ( = ?auto_798559 ?auto_798555 ) ) ( SURFACE-AT ?auto_798554 ?auto_798560 ) ( ON ?auto_798554 ?auto_798556 ) ( CLEAR ?auto_798554 ) ( not ( = ?auto_798553 ?auto_798556 ) ) ( not ( = ?auto_798554 ?auto_798556 ) ) ( not ( = ?auto_798552 ?auto_798556 ) ) ( SURFACE-AT ?auto_798552 ?auto_798557 ) ( CLEAR ?auto_798552 ) ( IS-CRATE ?auto_798553 ) ( AVAILABLE ?auto_798559 ) ( TRUCK-AT ?auto_798558 ?auto_798560 ) ( LIFTING ?auto_798555 ?auto_798553 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_798553 ?auto_798554 )
      ( MAKE-2CRATE-VERIFY ?auto_798552 ?auto_798553 ?auto_798554 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_798561 - SURFACE
      ?auto_798562 - SURFACE
      ?auto_798563 - SURFACE
      ?auto_798564 - SURFACE
    )
    :vars
    (
      ?auto_798566 - HOIST
      ?auto_798570 - PLACE
      ?auto_798567 - PLACE
      ?auto_798568 - HOIST
      ?auto_798565 - SURFACE
      ?auto_798569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798566 ?auto_798570 ) ( IS-CRATE ?auto_798564 ) ( not ( = ?auto_798563 ?auto_798564 ) ) ( not ( = ?auto_798562 ?auto_798563 ) ) ( not ( = ?auto_798562 ?auto_798564 ) ) ( not ( = ?auto_798567 ?auto_798570 ) ) ( HOIST-AT ?auto_798568 ?auto_798567 ) ( not ( = ?auto_798566 ?auto_798568 ) ) ( SURFACE-AT ?auto_798564 ?auto_798567 ) ( ON ?auto_798564 ?auto_798565 ) ( CLEAR ?auto_798564 ) ( not ( = ?auto_798563 ?auto_798565 ) ) ( not ( = ?auto_798564 ?auto_798565 ) ) ( not ( = ?auto_798562 ?auto_798565 ) ) ( SURFACE-AT ?auto_798562 ?auto_798570 ) ( CLEAR ?auto_798562 ) ( IS-CRATE ?auto_798563 ) ( AVAILABLE ?auto_798566 ) ( TRUCK-AT ?auto_798569 ?auto_798567 ) ( LIFTING ?auto_798568 ?auto_798563 ) ( ON ?auto_798562 ?auto_798561 ) ( not ( = ?auto_798561 ?auto_798562 ) ) ( not ( = ?auto_798561 ?auto_798563 ) ) ( not ( = ?auto_798561 ?auto_798564 ) ) ( not ( = ?auto_798561 ?auto_798565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798562 ?auto_798563 ?auto_798564 )
      ( MAKE-3CRATE-VERIFY ?auto_798561 ?auto_798562 ?auto_798563 ?auto_798564 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_798571 - SURFACE
      ?auto_798572 - SURFACE
      ?auto_798573 - SURFACE
      ?auto_798574 - SURFACE
      ?auto_798575 - SURFACE
    )
    :vars
    (
      ?auto_798577 - HOIST
      ?auto_798581 - PLACE
      ?auto_798578 - PLACE
      ?auto_798579 - HOIST
      ?auto_798576 - SURFACE
      ?auto_798580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798577 ?auto_798581 ) ( IS-CRATE ?auto_798575 ) ( not ( = ?auto_798574 ?auto_798575 ) ) ( not ( = ?auto_798573 ?auto_798574 ) ) ( not ( = ?auto_798573 ?auto_798575 ) ) ( not ( = ?auto_798578 ?auto_798581 ) ) ( HOIST-AT ?auto_798579 ?auto_798578 ) ( not ( = ?auto_798577 ?auto_798579 ) ) ( SURFACE-AT ?auto_798575 ?auto_798578 ) ( ON ?auto_798575 ?auto_798576 ) ( CLEAR ?auto_798575 ) ( not ( = ?auto_798574 ?auto_798576 ) ) ( not ( = ?auto_798575 ?auto_798576 ) ) ( not ( = ?auto_798573 ?auto_798576 ) ) ( SURFACE-AT ?auto_798573 ?auto_798581 ) ( CLEAR ?auto_798573 ) ( IS-CRATE ?auto_798574 ) ( AVAILABLE ?auto_798577 ) ( TRUCK-AT ?auto_798580 ?auto_798578 ) ( LIFTING ?auto_798579 ?auto_798574 ) ( ON ?auto_798572 ?auto_798571 ) ( ON ?auto_798573 ?auto_798572 ) ( not ( = ?auto_798571 ?auto_798572 ) ) ( not ( = ?auto_798571 ?auto_798573 ) ) ( not ( = ?auto_798571 ?auto_798574 ) ) ( not ( = ?auto_798571 ?auto_798575 ) ) ( not ( = ?auto_798571 ?auto_798576 ) ) ( not ( = ?auto_798572 ?auto_798573 ) ) ( not ( = ?auto_798572 ?auto_798574 ) ) ( not ( = ?auto_798572 ?auto_798575 ) ) ( not ( = ?auto_798572 ?auto_798576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798573 ?auto_798574 ?auto_798575 )
      ( MAKE-4CRATE-VERIFY ?auto_798571 ?auto_798572 ?auto_798573 ?auto_798574 ?auto_798575 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_798582 - SURFACE
      ?auto_798583 - SURFACE
      ?auto_798584 - SURFACE
      ?auto_798585 - SURFACE
      ?auto_798586 - SURFACE
      ?auto_798587 - SURFACE
    )
    :vars
    (
      ?auto_798589 - HOIST
      ?auto_798593 - PLACE
      ?auto_798590 - PLACE
      ?auto_798591 - HOIST
      ?auto_798588 - SURFACE
      ?auto_798592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798589 ?auto_798593 ) ( IS-CRATE ?auto_798587 ) ( not ( = ?auto_798586 ?auto_798587 ) ) ( not ( = ?auto_798585 ?auto_798586 ) ) ( not ( = ?auto_798585 ?auto_798587 ) ) ( not ( = ?auto_798590 ?auto_798593 ) ) ( HOIST-AT ?auto_798591 ?auto_798590 ) ( not ( = ?auto_798589 ?auto_798591 ) ) ( SURFACE-AT ?auto_798587 ?auto_798590 ) ( ON ?auto_798587 ?auto_798588 ) ( CLEAR ?auto_798587 ) ( not ( = ?auto_798586 ?auto_798588 ) ) ( not ( = ?auto_798587 ?auto_798588 ) ) ( not ( = ?auto_798585 ?auto_798588 ) ) ( SURFACE-AT ?auto_798585 ?auto_798593 ) ( CLEAR ?auto_798585 ) ( IS-CRATE ?auto_798586 ) ( AVAILABLE ?auto_798589 ) ( TRUCK-AT ?auto_798592 ?auto_798590 ) ( LIFTING ?auto_798591 ?auto_798586 ) ( ON ?auto_798583 ?auto_798582 ) ( ON ?auto_798584 ?auto_798583 ) ( ON ?auto_798585 ?auto_798584 ) ( not ( = ?auto_798582 ?auto_798583 ) ) ( not ( = ?auto_798582 ?auto_798584 ) ) ( not ( = ?auto_798582 ?auto_798585 ) ) ( not ( = ?auto_798582 ?auto_798586 ) ) ( not ( = ?auto_798582 ?auto_798587 ) ) ( not ( = ?auto_798582 ?auto_798588 ) ) ( not ( = ?auto_798583 ?auto_798584 ) ) ( not ( = ?auto_798583 ?auto_798585 ) ) ( not ( = ?auto_798583 ?auto_798586 ) ) ( not ( = ?auto_798583 ?auto_798587 ) ) ( not ( = ?auto_798583 ?auto_798588 ) ) ( not ( = ?auto_798584 ?auto_798585 ) ) ( not ( = ?auto_798584 ?auto_798586 ) ) ( not ( = ?auto_798584 ?auto_798587 ) ) ( not ( = ?auto_798584 ?auto_798588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798585 ?auto_798586 ?auto_798587 )
      ( MAKE-5CRATE-VERIFY ?auto_798582 ?auto_798583 ?auto_798584 ?auto_798585 ?auto_798586 ?auto_798587 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798594 - SURFACE
      ?auto_798595 - SURFACE
      ?auto_798596 - SURFACE
      ?auto_798597 - SURFACE
      ?auto_798598 - SURFACE
      ?auto_798599 - SURFACE
      ?auto_798600 - SURFACE
    )
    :vars
    (
      ?auto_798602 - HOIST
      ?auto_798606 - PLACE
      ?auto_798603 - PLACE
      ?auto_798604 - HOIST
      ?auto_798601 - SURFACE
      ?auto_798605 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798602 ?auto_798606 ) ( IS-CRATE ?auto_798600 ) ( not ( = ?auto_798599 ?auto_798600 ) ) ( not ( = ?auto_798598 ?auto_798599 ) ) ( not ( = ?auto_798598 ?auto_798600 ) ) ( not ( = ?auto_798603 ?auto_798606 ) ) ( HOIST-AT ?auto_798604 ?auto_798603 ) ( not ( = ?auto_798602 ?auto_798604 ) ) ( SURFACE-AT ?auto_798600 ?auto_798603 ) ( ON ?auto_798600 ?auto_798601 ) ( CLEAR ?auto_798600 ) ( not ( = ?auto_798599 ?auto_798601 ) ) ( not ( = ?auto_798600 ?auto_798601 ) ) ( not ( = ?auto_798598 ?auto_798601 ) ) ( SURFACE-AT ?auto_798598 ?auto_798606 ) ( CLEAR ?auto_798598 ) ( IS-CRATE ?auto_798599 ) ( AVAILABLE ?auto_798602 ) ( TRUCK-AT ?auto_798605 ?auto_798603 ) ( LIFTING ?auto_798604 ?auto_798599 ) ( ON ?auto_798595 ?auto_798594 ) ( ON ?auto_798596 ?auto_798595 ) ( ON ?auto_798597 ?auto_798596 ) ( ON ?auto_798598 ?auto_798597 ) ( not ( = ?auto_798594 ?auto_798595 ) ) ( not ( = ?auto_798594 ?auto_798596 ) ) ( not ( = ?auto_798594 ?auto_798597 ) ) ( not ( = ?auto_798594 ?auto_798598 ) ) ( not ( = ?auto_798594 ?auto_798599 ) ) ( not ( = ?auto_798594 ?auto_798600 ) ) ( not ( = ?auto_798594 ?auto_798601 ) ) ( not ( = ?auto_798595 ?auto_798596 ) ) ( not ( = ?auto_798595 ?auto_798597 ) ) ( not ( = ?auto_798595 ?auto_798598 ) ) ( not ( = ?auto_798595 ?auto_798599 ) ) ( not ( = ?auto_798595 ?auto_798600 ) ) ( not ( = ?auto_798595 ?auto_798601 ) ) ( not ( = ?auto_798596 ?auto_798597 ) ) ( not ( = ?auto_798596 ?auto_798598 ) ) ( not ( = ?auto_798596 ?auto_798599 ) ) ( not ( = ?auto_798596 ?auto_798600 ) ) ( not ( = ?auto_798596 ?auto_798601 ) ) ( not ( = ?auto_798597 ?auto_798598 ) ) ( not ( = ?auto_798597 ?auto_798599 ) ) ( not ( = ?auto_798597 ?auto_798600 ) ) ( not ( = ?auto_798597 ?auto_798601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798598 ?auto_798599 ?auto_798600 )
      ( MAKE-6CRATE-VERIFY ?auto_798594 ?auto_798595 ?auto_798596 ?auto_798597 ?auto_798598 ?auto_798599 ?auto_798600 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_798607 - SURFACE
      ?auto_798608 - SURFACE
    )
    :vars
    (
      ?auto_798610 - HOIST
      ?auto_798615 - PLACE
      ?auto_798614 - SURFACE
      ?auto_798611 - PLACE
      ?auto_798612 - HOIST
      ?auto_798609 - SURFACE
      ?auto_798613 - TRUCK
      ?auto_798616 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_798610 ?auto_798615 ) ( IS-CRATE ?auto_798608 ) ( not ( = ?auto_798607 ?auto_798608 ) ) ( not ( = ?auto_798614 ?auto_798607 ) ) ( not ( = ?auto_798614 ?auto_798608 ) ) ( not ( = ?auto_798611 ?auto_798615 ) ) ( HOIST-AT ?auto_798612 ?auto_798611 ) ( not ( = ?auto_798610 ?auto_798612 ) ) ( SURFACE-AT ?auto_798608 ?auto_798611 ) ( ON ?auto_798608 ?auto_798609 ) ( CLEAR ?auto_798608 ) ( not ( = ?auto_798607 ?auto_798609 ) ) ( not ( = ?auto_798608 ?auto_798609 ) ) ( not ( = ?auto_798614 ?auto_798609 ) ) ( SURFACE-AT ?auto_798614 ?auto_798615 ) ( CLEAR ?auto_798614 ) ( IS-CRATE ?auto_798607 ) ( AVAILABLE ?auto_798610 ) ( TRUCK-AT ?auto_798613 ?auto_798611 ) ( AVAILABLE ?auto_798612 ) ( SURFACE-AT ?auto_798607 ?auto_798611 ) ( ON ?auto_798607 ?auto_798616 ) ( CLEAR ?auto_798607 ) ( not ( = ?auto_798607 ?auto_798616 ) ) ( not ( = ?auto_798608 ?auto_798616 ) ) ( not ( = ?auto_798614 ?auto_798616 ) ) ( not ( = ?auto_798609 ?auto_798616 ) ) )
    :subtasks
    ( ( !LIFT ?auto_798612 ?auto_798607 ?auto_798616 ?auto_798611 )
      ( MAKE-2CRATE ?auto_798614 ?auto_798607 ?auto_798608 )
      ( MAKE-1CRATE-VERIFY ?auto_798607 ?auto_798608 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_798617 - SURFACE
      ?auto_798618 - SURFACE
      ?auto_798619 - SURFACE
    )
    :vars
    (
      ?auto_798625 - HOIST
      ?auto_798620 - PLACE
      ?auto_798622 - PLACE
      ?auto_798621 - HOIST
      ?auto_798623 - SURFACE
      ?auto_798624 - TRUCK
      ?auto_798626 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_798625 ?auto_798620 ) ( IS-CRATE ?auto_798619 ) ( not ( = ?auto_798618 ?auto_798619 ) ) ( not ( = ?auto_798617 ?auto_798618 ) ) ( not ( = ?auto_798617 ?auto_798619 ) ) ( not ( = ?auto_798622 ?auto_798620 ) ) ( HOIST-AT ?auto_798621 ?auto_798622 ) ( not ( = ?auto_798625 ?auto_798621 ) ) ( SURFACE-AT ?auto_798619 ?auto_798622 ) ( ON ?auto_798619 ?auto_798623 ) ( CLEAR ?auto_798619 ) ( not ( = ?auto_798618 ?auto_798623 ) ) ( not ( = ?auto_798619 ?auto_798623 ) ) ( not ( = ?auto_798617 ?auto_798623 ) ) ( SURFACE-AT ?auto_798617 ?auto_798620 ) ( CLEAR ?auto_798617 ) ( IS-CRATE ?auto_798618 ) ( AVAILABLE ?auto_798625 ) ( TRUCK-AT ?auto_798624 ?auto_798622 ) ( AVAILABLE ?auto_798621 ) ( SURFACE-AT ?auto_798618 ?auto_798622 ) ( ON ?auto_798618 ?auto_798626 ) ( CLEAR ?auto_798618 ) ( not ( = ?auto_798618 ?auto_798626 ) ) ( not ( = ?auto_798619 ?auto_798626 ) ) ( not ( = ?auto_798617 ?auto_798626 ) ) ( not ( = ?auto_798623 ?auto_798626 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_798618 ?auto_798619 )
      ( MAKE-2CRATE-VERIFY ?auto_798617 ?auto_798618 ?auto_798619 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_798627 - SURFACE
      ?auto_798628 - SURFACE
      ?auto_798629 - SURFACE
      ?auto_798630 - SURFACE
    )
    :vars
    (
      ?auto_798637 - HOIST
      ?auto_798636 - PLACE
      ?auto_798631 - PLACE
      ?auto_798632 - HOIST
      ?auto_798635 - SURFACE
      ?auto_798633 - TRUCK
      ?auto_798634 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_798637 ?auto_798636 ) ( IS-CRATE ?auto_798630 ) ( not ( = ?auto_798629 ?auto_798630 ) ) ( not ( = ?auto_798628 ?auto_798629 ) ) ( not ( = ?auto_798628 ?auto_798630 ) ) ( not ( = ?auto_798631 ?auto_798636 ) ) ( HOIST-AT ?auto_798632 ?auto_798631 ) ( not ( = ?auto_798637 ?auto_798632 ) ) ( SURFACE-AT ?auto_798630 ?auto_798631 ) ( ON ?auto_798630 ?auto_798635 ) ( CLEAR ?auto_798630 ) ( not ( = ?auto_798629 ?auto_798635 ) ) ( not ( = ?auto_798630 ?auto_798635 ) ) ( not ( = ?auto_798628 ?auto_798635 ) ) ( SURFACE-AT ?auto_798628 ?auto_798636 ) ( CLEAR ?auto_798628 ) ( IS-CRATE ?auto_798629 ) ( AVAILABLE ?auto_798637 ) ( TRUCK-AT ?auto_798633 ?auto_798631 ) ( AVAILABLE ?auto_798632 ) ( SURFACE-AT ?auto_798629 ?auto_798631 ) ( ON ?auto_798629 ?auto_798634 ) ( CLEAR ?auto_798629 ) ( not ( = ?auto_798629 ?auto_798634 ) ) ( not ( = ?auto_798630 ?auto_798634 ) ) ( not ( = ?auto_798628 ?auto_798634 ) ) ( not ( = ?auto_798635 ?auto_798634 ) ) ( ON ?auto_798628 ?auto_798627 ) ( not ( = ?auto_798627 ?auto_798628 ) ) ( not ( = ?auto_798627 ?auto_798629 ) ) ( not ( = ?auto_798627 ?auto_798630 ) ) ( not ( = ?auto_798627 ?auto_798635 ) ) ( not ( = ?auto_798627 ?auto_798634 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798628 ?auto_798629 ?auto_798630 )
      ( MAKE-3CRATE-VERIFY ?auto_798627 ?auto_798628 ?auto_798629 ?auto_798630 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_798638 - SURFACE
      ?auto_798639 - SURFACE
      ?auto_798640 - SURFACE
      ?auto_798641 - SURFACE
      ?auto_798642 - SURFACE
    )
    :vars
    (
      ?auto_798649 - HOIST
      ?auto_798648 - PLACE
      ?auto_798643 - PLACE
      ?auto_798644 - HOIST
      ?auto_798647 - SURFACE
      ?auto_798645 - TRUCK
      ?auto_798646 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_798649 ?auto_798648 ) ( IS-CRATE ?auto_798642 ) ( not ( = ?auto_798641 ?auto_798642 ) ) ( not ( = ?auto_798640 ?auto_798641 ) ) ( not ( = ?auto_798640 ?auto_798642 ) ) ( not ( = ?auto_798643 ?auto_798648 ) ) ( HOIST-AT ?auto_798644 ?auto_798643 ) ( not ( = ?auto_798649 ?auto_798644 ) ) ( SURFACE-AT ?auto_798642 ?auto_798643 ) ( ON ?auto_798642 ?auto_798647 ) ( CLEAR ?auto_798642 ) ( not ( = ?auto_798641 ?auto_798647 ) ) ( not ( = ?auto_798642 ?auto_798647 ) ) ( not ( = ?auto_798640 ?auto_798647 ) ) ( SURFACE-AT ?auto_798640 ?auto_798648 ) ( CLEAR ?auto_798640 ) ( IS-CRATE ?auto_798641 ) ( AVAILABLE ?auto_798649 ) ( TRUCK-AT ?auto_798645 ?auto_798643 ) ( AVAILABLE ?auto_798644 ) ( SURFACE-AT ?auto_798641 ?auto_798643 ) ( ON ?auto_798641 ?auto_798646 ) ( CLEAR ?auto_798641 ) ( not ( = ?auto_798641 ?auto_798646 ) ) ( not ( = ?auto_798642 ?auto_798646 ) ) ( not ( = ?auto_798640 ?auto_798646 ) ) ( not ( = ?auto_798647 ?auto_798646 ) ) ( ON ?auto_798639 ?auto_798638 ) ( ON ?auto_798640 ?auto_798639 ) ( not ( = ?auto_798638 ?auto_798639 ) ) ( not ( = ?auto_798638 ?auto_798640 ) ) ( not ( = ?auto_798638 ?auto_798641 ) ) ( not ( = ?auto_798638 ?auto_798642 ) ) ( not ( = ?auto_798638 ?auto_798647 ) ) ( not ( = ?auto_798638 ?auto_798646 ) ) ( not ( = ?auto_798639 ?auto_798640 ) ) ( not ( = ?auto_798639 ?auto_798641 ) ) ( not ( = ?auto_798639 ?auto_798642 ) ) ( not ( = ?auto_798639 ?auto_798647 ) ) ( not ( = ?auto_798639 ?auto_798646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798640 ?auto_798641 ?auto_798642 )
      ( MAKE-4CRATE-VERIFY ?auto_798638 ?auto_798639 ?auto_798640 ?auto_798641 ?auto_798642 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_798650 - SURFACE
      ?auto_798651 - SURFACE
      ?auto_798652 - SURFACE
      ?auto_798653 - SURFACE
      ?auto_798654 - SURFACE
      ?auto_798655 - SURFACE
    )
    :vars
    (
      ?auto_798662 - HOIST
      ?auto_798661 - PLACE
      ?auto_798656 - PLACE
      ?auto_798657 - HOIST
      ?auto_798660 - SURFACE
      ?auto_798658 - TRUCK
      ?auto_798659 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_798662 ?auto_798661 ) ( IS-CRATE ?auto_798655 ) ( not ( = ?auto_798654 ?auto_798655 ) ) ( not ( = ?auto_798653 ?auto_798654 ) ) ( not ( = ?auto_798653 ?auto_798655 ) ) ( not ( = ?auto_798656 ?auto_798661 ) ) ( HOIST-AT ?auto_798657 ?auto_798656 ) ( not ( = ?auto_798662 ?auto_798657 ) ) ( SURFACE-AT ?auto_798655 ?auto_798656 ) ( ON ?auto_798655 ?auto_798660 ) ( CLEAR ?auto_798655 ) ( not ( = ?auto_798654 ?auto_798660 ) ) ( not ( = ?auto_798655 ?auto_798660 ) ) ( not ( = ?auto_798653 ?auto_798660 ) ) ( SURFACE-AT ?auto_798653 ?auto_798661 ) ( CLEAR ?auto_798653 ) ( IS-CRATE ?auto_798654 ) ( AVAILABLE ?auto_798662 ) ( TRUCK-AT ?auto_798658 ?auto_798656 ) ( AVAILABLE ?auto_798657 ) ( SURFACE-AT ?auto_798654 ?auto_798656 ) ( ON ?auto_798654 ?auto_798659 ) ( CLEAR ?auto_798654 ) ( not ( = ?auto_798654 ?auto_798659 ) ) ( not ( = ?auto_798655 ?auto_798659 ) ) ( not ( = ?auto_798653 ?auto_798659 ) ) ( not ( = ?auto_798660 ?auto_798659 ) ) ( ON ?auto_798651 ?auto_798650 ) ( ON ?auto_798652 ?auto_798651 ) ( ON ?auto_798653 ?auto_798652 ) ( not ( = ?auto_798650 ?auto_798651 ) ) ( not ( = ?auto_798650 ?auto_798652 ) ) ( not ( = ?auto_798650 ?auto_798653 ) ) ( not ( = ?auto_798650 ?auto_798654 ) ) ( not ( = ?auto_798650 ?auto_798655 ) ) ( not ( = ?auto_798650 ?auto_798660 ) ) ( not ( = ?auto_798650 ?auto_798659 ) ) ( not ( = ?auto_798651 ?auto_798652 ) ) ( not ( = ?auto_798651 ?auto_798653 ) ) ( not ( = ?auto_798651 ?auto_798654 ) ) ( not ( = ?auto_798651 ?auto_798655 ) ) ( not ( = ?auto_798651 ?auto_798660 ) ) ( not ( = ?auto_798651 ?auto_798659 ) ) ( not ( = ?auto_798652 ?auto_798653 ) ) ( not ( = ?auto_798652 ?auto_798654 ) ) ( not ( = ?auto_798652 ?auto_798655 ) ) ( not ( = ?auto_798652 ?auto_798660 ) ) ( not ( = ?auto_798652 ?auto_798659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798653 ?auto_798654 ?auto_798655 )
      ( MAKE-5CRATE-VERIFY ?auto_798650 ?auto_798651 ?auto_798652 ?auto_798653 ?auto_798654 ?auto_798655 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798663 - SURFACE
      ?auto_798664 - SURFACE
      ?auto_798665 - SURFACE
      ?auto_798666 - SURFACE
      ?auto_798667 - SURFACE
      ?auto_798668 - SURFACE
      ?auto_798669 - SURFACE
    )
    :vars
    (
      ?auto_798676 - HOIST
      ?auto_798675 - PLACE
      ?auto_798670 - PLACE
      ?auto_798671 - HOIST
      ?auto_798674 - SURFACE
      ?auto_798672 - TRUCK
      ?auto_798673 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_798676 ?auto_798675 ) ( IS-CRATE ?auto_798669 ) ( not ( = ?auto_798668 ?auto_798669 ) ) ( not ( = ?auto_798667 ?auto_798668 ) ) ( not ( = ?auto_798667 ?auto_798669 ) ) ( not ( = ?auto_798670 ?auto_798675 ) ) ( HOIST-AT ?auto_798671 ?auto_798670 ) ( not ( = ?auto_798676 ?auto_798671 ) ) ( SURFACE-AT ?auto_798669 ?auto_798670 ) ( ON ?auto_798669 ?auto_798674 ) ( CLEAR ?auto_798669 ) ( not ( = ?auto_798668 ?auto_798674 ) ) ( not ( = ?auto_798669 ?auto_798674 ) ) ( not ( = ?auto_798667 ?auto_798674 ) ) ( SURFACE-AT ?auto_798667 ?auto_798675 ) ( CLEAR ?auto_798667 ) ( IS-CRATE ?auto_798668 ) ( AVAILABLE ?auto_798676 ) ( TRUCK-AT ?auto_798672 ?auto_798670 ) ( AVAILABLE ?auto_798671 ) ( SURFACE-AT ?auto_798668 ?auto_798670 ) ( ON ?auto_798668 ?auto_798673 ) ( CLEAR ?auto_798668 ) ( not ( = ?auto_798668 ?auto_798673 ) ) ( not ( = ?auto_798669 ?auto_798673 ) ) ( not ( = ?auto_798667 ?auto_798673 ) ) ( not ( = ?auto_798674 ?auto_798673 ) ) ( ON ?auto_798664 ?auto_798663 ) ( ON ?auto_798665 ?auto_798664 ) ( ON ?auto_798666 ?auto_798665 ) ( ON ?auto_798667 ?auto_798666 ) ( not ( = ?auto_798663 ?auto_798664 ) ) ( not ( = ?auto_798663 ?auto_798665 ) ) ( not ( = ?auto_798663 ?auto_798666 ) ) ( not ( = ?auto_798663 ?auto_798667 ) ) ( not ( = ?auto_798663 ?auto_798668 ) ) ( not ( = ?auto_798663 ?auto_798669 ) ) ( not ( = ?auto_798663 ?auto_798674 ) ) ( not ( = ?auto_798663 ?auto_798673 ) ) ( not ( = ?auto_798664 ?auto_798665 ) ) ( not ( = ?auto_798664 ?auto_798666 ) ) ( not ( = ?auto_798664 ?auto_798667 ) ) ( not ( = ?auto_798664 ?auto_798668 ) ) ( not ( = ?auto_798664 ?auto_798669 ) ) ( not ( = ?auto_798664 ?auto_798674 ) ) ( not ( = ?auto_798664 ?auto_798673 ) ) ( not ( = ?auto_798665 ?auto_798666 ) ) ( not ( = ?auto_798665 ?auto_798667 ) ) ( not ( = ?auto_798665 ?auto_798668 ) ) ( not ( = ?auto_798665 ?auto_798669 ) ) ( not ( = ?auto_798665 ?auto_798674 ) ) ( not ( = ?auto_798665 ?auto_798673 ) ) ( not ( = ?auto_798666 ?auto_798667 ) ) ( not ( = ?auto_798666 ?auto_798668 ) ) ( not ( = ?auto_798666 ?auto_798669 ) ) ( not ( = ?auto_798666 ?auto_798674 ) ) ( not ( = ?auto_798666 ?auto_798673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798667 ?auto_798668 ?auto_798669 )
      ( MAKE-6CRATE-VERIFY ?auto_798663 ?auto_798664 ?auto_798665 ?auto_798666 ?auto_798667 ?auto_798668 ?auto_798669 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_798677 - SURFACE
      ?auto_798678 - SURFACE
    )
    :vars
    (
      ?auto_798685 - HOIST
      ?auto_798684 - PLACE
      ?auto_798686 - SURFACE
      ?auto_798679 - PLACE
      ?auto_798680 - HOIST
      ?auto_798683 - SURFACE
      ?auto_798682 - SURFACE
      ?auto_798681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798685 ?auto_798684 ) ( IS-CRATE ?auto_798678 ) ( not ( = ?auto_798677 ?auto_798678 ) ) ( not ( = ?auto_798686 ?auto_798677 ) ) ( not ( = ?auto_798686 ?auto_798678 ) ) ( not ( = ?auto_798679 ?auto_798684 ) ) ( HOIST-AT ?auto_798680 ?auto_798679 ) ( not ( = ?auto_798685 ?auto_798680 ) ) ( SURFACE-AT ?auto_798678 ?auto_798679 ) ( ON ?auto_798678 ?auto_798683 ) ( CLEAR ?auto_798678 ) ( not ( = ?auto_798677 ?auto_798683 ) ) ( not ( = ?auto_798678 ?auto_798683 ) ) ( not ( = ?auto_798686 ?auto_798683 ) ) ( SURFACE-AT ?auto_798686 ?auto_798684 ) ( CLEAR ?auto_798686 ) ( IS-CRATE ?auto_798677 ) ( AVAILABLE ?auto_798685 ) ( AVAILABLE ?auto_798680 ) ( SURFACE-AT ?auto_798677 ?auto_798679 ) ( ON ?auto_798677 ?auto_798682 ) ( CLEAR ?auto_798677 ) ( not ( = ?auto_798677 ?auto_798682 ) ) ( not ( = ?auto_798678 ?auto_798682 ) ) ( not ( = ?auto_798686 ?auto_798682 ) ) ( not ( = ?auto_798683 ?auto_798682 ) ) ( TRUCK-AT ?auto_798681 ?auto_798684 ) )
    :subtasks
    ( ( !DRIVE ?auto_798681 ?auto_798684 ?auto_798679 )
      ( MAKE-2CRATE ?auto_798686 ?auto_798677 ?auto_798678 )
      ( MAKE-1CRATE-VERIFY ?auto_798677 ?auto_798678 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_798687 - SURFACE
      ?auto_798688 - SURFACE
      ?auto_798689 - SURFACE
    )
    :vars
    (
      ?auto_798694 - HOIST
      ?auto_798691 - PLACE
      ?auto_798693 - PLACE
      ?auto_798695 - HOIST
      ?auto_798696 - SURFACE
      ?auto_798692 - SURFACE
      ?auto_798690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798694 ?auto_798691 ) ( IS-CRATE ?auto_798689 ) ( not ( = ?auto_798688 ?auto_798689 ) ) ( not ( = ?auto_798687 ?auto_798688 ) ) ( not ( = ?auto_798687 ?auto_798689 ) ) ( not ( = ?auto_798693 ?auto_798691 ) ) ( HOIST-AT ?auto_798695 ?auto_798693 ) ( not ( = ?auto_798694 ?auto_798695 ) ) ( SURFACE-AT ?auto_798689 ?auto_798693 ) ( ON ?auto_798689 ?auto_798696 ) ( CLEAR ?auto_798689 ) ( not ( = ?auto_798688 ?auto_798696 ) ) ( not ( = ?auto_798689 ?auto_798696 ) ) ( not ( = ?auto_798687 ?auto_798696 ) ) ( SURFACE-AT ?auto_798687 ?auto_798691 ) ( CLEAR ?auto_798687 ) ( IS-CRATE ?auto_798688 ) ( AVAILABLE ?auto_798694 ) ( AVAILABLE ?auto_798695 ) ( SURFACE-AT ?auto_798688 ?auto_798693 ) ( ON ?auto_798688 ?auto_798692 ) ( CLEAR ?auto_798688 ) ( not ( = ?auto_798688 ?auto_798692 ) ) ( not ( = ?auto_798689 ?auto_798692 ) ) ( not ( = ?auto_798687 ?auto_798692 ) ) ( not ( = ?auto_798696 ?auto_798692 ) ) ( TRUCK-AT ?auto_798690 ?auto_798691 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_798688 ?auto_798689 )
      ( MAKE-2CRATE-VERIFY ?auto_798687 ?auto_798688 ?auto_798689 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_798697 - SURFACE
      ?auto_798698 - SURFACE
      ?auto_798699 - SURFACE
      ?auto_798700 - SURFACE
    )
    :vars
    (
      ?auto_798704 - HOIST
      ?auto_798707 - PLACE
      ?auto_798705 - PLACE
      ?auto_798702 - HOIST
      ?auto_798701 - SURFACE
      ?auto_798703 - SURFACE
      ?auto_798706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798704 ?auto_798707 ) ( IS-CRATE ?auto_798700 ) ( not ( = ?auto_798699 ?auto_798700 ) ) ( not ( = ?auto_798698 ?auto_798699 ) ) ( not ( = ?auto_798698 ?auto_798700 ) ) ( not ( = ?auto_798705 ?auto_798707 ) ) ( HOIST-AT ?auto_798702 ?auto_798705 ) ( not ( = ?auto_798704 ?auto_798702 ) ) ( SURFACE-AT ?auto_798700 ?auto_798705 ) ( ON ?auto_798700 ?auto_798701 ) ( CLEAR ?auto_798700 ) ( not ( = ?auto_798699 ?auto_798701 ) ) ( not ( = ?auto_798700 ?auto_798701 ) ) ( not ( = ?auto_798698 ?auto_798701 ) ) ( SURFACE-AT ?auto_798698 ?auto_798707 ) ( CLEAR ?auto_798698 ) ( IS-CRATE ?auto_798699 ) ( AVAILABLE ?auto_798704 ) ( AVAILABLE ?auto_798702 ) ( SURFACE-AT ?auto_798699 ?auto_798705 ) ( ON ?auto_798699 ?auto_798703 ) ( CLEAR ?auto_798699 ) ( not ( = ?auto_798699 ?auto_798703 ) ) ( not ( = ?auto_798700 ?auto_798703 ) ) ( not ( = ?auto_798698 ?auto_798703 ) ) ( not ( = ?auto_798701 ?auto_798703 ) ) ( TRUCK-AT ?auto_798706 ?auto_798707 ) ( ON ?auto_798698 ?auto_798697 ) ( not ( = ?auto_798697 ?auto_798698 ) ) ( not ( = ?auto_798697 ?auto_798699 ) ) ( not ( = ?auto_798697 ?auto_798700 ) ) ( not ( = ?auto_798697 ?auto_798701 ) ) ( not ( = ?auto_798697 ?auto_798703 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798698 ?auto_798699 ?auto_798700 )
      ( MAKE-3CRATE-VERIFY ?auto_798697 ?auto_798698 ?auto_798699 ?auto_798700 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_798708 - SURFACE
      ?auto_798709 - SURFACE
      ?auto_798710 - SURFACE
      ?auto_798711 - SURFACE
      ?auto_798712 - SURFACE
    )
    :vars
    (
      ?auto_798716 - HOIST
      ?auto_798719 - PLACE
      ?auto_798717 - PLACE
      ?auto_798714 - HOIST
      ?auto_798713 - SURFACE
      ?auto_798715 - SURFACE
      ?auto_798718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798716 ?auto_798719 ) ( IS-CRATE ?auto_798712 ) ( not ( = ?auto_798711 ?auto_798712 ) ) ( not ( = ?auto_798710 ?auto_798711 ) ) ( not ( = ?auto_798710 ?auto_798712 ) ) ( not ( = ?auto_798717 ?auto_798719 ) ) ( HOIST-AT ?auto_798714 ?auto_798717 ) ( not ( = ?auto_798716 ?auto_798714 ) ) ( SURFACE-AT ?auto_798712 ?auto_798717 ) ( ON ?auto_798712 ?auto_798713 ) ( CLEAR ?auto_798712 ) ( not ( = ?auto_798711 ?auto_798713 ) ) ( not ( = ?auto_798712 ?auto_798713 ) ) ( not ( = ?auto_798710 ?auto_798713 ) ) ( SURFACE-AT ?auto_798710 ?auto_798719 ) ( CLEAR ?auto_798710 ) ( IS-CRATE ?auto_798711 ) ( AVAILABLE ?auto_798716 ) ( AVAILABLE ?auto_798714 ) ( SURFACE-AT ?auto_798711 ?auto_798717 ) ( ON ?auto_798711 ?auto_798715 ) ( CLEAR ?auto_798711 ) ( not ( = ?auto_798711 ?auto_798715 ) ) ( not ( = ?auto_798712 ?auto_798715 ) ) ( not ( = ?auto_798710 ?auto_798715 ) ) ( not ( = ?auto_798713 ?auto_798715 ) ) ( TRUCK-AT ?auto_798718 ?auto_798719 ) ( ON ?auto_798709 ?auto_798708 ) ( ON ?auto_798710 ?auto_798709 ) ( not ( = ?auto_798708 ?auto_798709 ) ) ( not ( = ?auto_798708 ?auto_798710 ) ) ( not ( = ?auto_798708 ?auto_798711 ) ) ( not ( = ?auto_798708 ?auto_798712 ) ) ( not ( = ?auto_798708 ?auto_798713 ) ) ( not ( = ?auto_798708 ?auto_798715 ) ) ( not ( = ?auto_798709 ?auto_798710 ) ) ( not ( = ?auto_798709 ?auto_798711 ) ) ( not ( = ?auto_798709 ?auto_798712 ) ) ( not ( = ?auto_798709 ?auto_798713 ) ) ( not ( = ?auto_798709 ?auto_798715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798710 ?auto_798711 ?auto_798712 )
      ( MAKE-4CRATE-VERIFY ?auto_798708 ?auto_798709 ?auto_798710 ?auto_798711 ?auto_798712 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_798720 - SURFACE
      ?auto_798721 - SURFACE
      ?auto_798722 - SURFACE
      ?auto_798723 - SURFACE
      ?auto_798724 - SURFACE
      ?auto_798725 - SURFACE
    )
    :vars
    (
      ?auto_798729 - HOIST
      ?auto_798732 - PLACE
      ?auto_798730 - PLACE
      ?auto_798727 - HOIST
      ?auto_798726 - SURFACE
      ?auto_798728 - SURFACE
      ?auto_798731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798729 ?auto_798732 ) ( IS-CRATE ?auto_798725 ) ( not ( = ?auto_798724 ?auto_798725 ) ) ( not ( = ?auto_798723 ?auto_798724 ) ) ( not ( = ?auto_798723 ?auto_798725 ) ) ( not ( = ?auto_798730 ?auto_798732 ) ) ( HOIST-AT ?auto_798727 ?auto_798730 ) ( not ( = ?auto_798729 ?auto_798727 ) ) ( SURFACE-AT ?auto_798725 ?auto_798730 ) ( ON ?auto_798725 ?auto_798726 ) ( CLEAR ?auto_798725 ) ( not ( = ?auto_798724 ?auto_798726 ) ) ( not ( = ?auto_798725 ?auto_798726 ) ) ( not ( = ?auto_798723 ?auto_798726 ) ) ( SURFACE-AT ?auto_798723 ?auto_798732 ) ( CLEAR ?auto_798723 ) ( IS-CRATE ?auto_798724 ) ( AVAILABLE ?auto_798729 ) ( AVAILABLE ?auto_798727 ) ( SURFACE-AT ?auto_798724 ?auto_798730 ) ( ON ?auto_798724 ?auto_798728 ) ( CLEAR ?auto_798724 ) ( not ( = ?auto_798724 ?auto_798728 ) ) ( not ( = ?auto_798725 ?auto_798728 ) ) ( not ( = ?auto_798723 ?auto_798728 ) ) ( not ( = ?auto_798726 ?auto_798728 ) ) ( TRUCK-AT ?auto_798731 ?auto_798732 ) ( ON ?auto_798721 ?auto_798720 ) ( ON ?auto_798722 ?auto_798721 ) ( ON ?auto_798723 ?auto_798722 ) ( not ( = ?auto_798720 ?auto_798721 ) ) ( not ( = ?auto_798720 ?auto_798722 ) ) ( not ( = ?auto_798720 ?auto_798723 ) ) ( not ( = ?auto_798720 ?auto_798724 ) ) ( not ( = ?auto_798720 ?auto_798725 ) ) ( not ( = ?auto_798720 ?auto_798726 ) ) ( not ( = ?auto_798720 ?auto_798728 ) ) ( not ( = ?auto_798721 ?auto_798722 ) ) ( not ( = ?auto_798721 ?auto_798723 ) ) ( not ( = ?auto_798721 ?auto_798724 ) ) ( not ( = ?auto_798721 ?auto_798725 ) ) ( not ( = ?auto_798721 ?auto_798726 ) ) ( not ( = ?auto_798721 ?auto_798728 ) ) ( not ( = ?auto_798722 ?auto_798723 ) ) ( not ( = ?auto_798722 ?auto_798724 ) ) ( not ( = ?auto_798722 ?auto_798725 ) ) ( not ( = ?auto_798722 ?auto_798726 ) ) ( not ( = ?auto_798722 ?auto_798728 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798723 ?auto_798724 ?auto_798725 )
      ( MAKE-5CRATE-VERIFY ?auto_798720 ?auto_798721 ?auto_798722 ?auto_798723 ?auto_798724 ?auto_798725 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798733 - SURFACE
      ?auto_798734 - SURFACE
      ?auto_798735 - SURFACE
      ?auto_798736 - SURFACE
      ?auto_798737 - SURFACE
      ?auto_798738 - SURFACE
      ?auto_798739 - SURFACE
    )
    :vars
    (
      ?auto_798743 - HOIST
      ?auto_798746 - PLACE
      ?auto_798744 - PLACE
      ?auto_798741 - HOIST
      ?auto_798740 - SURFACE
      ?auto_798742 - SURFACE
      ?auto_798745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798743 ?auto_798746 ) ( IS-CRATE ?auto_798739 ) ( not ( = ?auto_798738 ?auto_798739 ) ) ( not ( = ?auto_798737 ?auto_798738 ) ) ( not ( = ?auto_798737 ?auto_798739 ) ) ( not ( = ?auto_798744 ?auto_798746 ) ) ( HOIST-AT ?auto_798741 ?auto_798744 ) ( not ( = ?auto_798743 ?auto_798741 ) ) ( SURFACE-AT ?auto_798739 ?auto_798744 ) ( ON ?auto_798739 ?auto_798740 ) ( CLEAR ?auto_798739 ) ( not ( = ?auto_798738 ?auto_798740 ) ) ( not ( = ?auto_798739 ?auto_798740 ) ) ( not ( = ?auto_798737 ?auto_798740 ) ) ( SURFACE-AT ?auto_798737 ?auto_798746 ) ( CLEAR ?auto_798737 ) ( IS-CRATE ?auto_798738 ) ( AVAILABLE ?auto_798743 ) ( AVAILABLE ?auto_798741 ) ( SURFACE-AT ?auto_798738 ?auto_798744 ) ( ON ?auto_798738 ?auto_798742 ) ( CLEAR ?auto_798738 ) ( not ( = ?auto_798738 ?auto_798742 ) ) ( not ( = ?auto_798739 ?auto_798742 ) ) ( not ( = ?auto_798737 ?auto_798742 ) ) ( not ( = ?auto_798740 ?auto_798742 ) ) ( TRUCK-AT ?auto_798745 ?auto_798746 ) ( ON ?auto_798734 ?auto_798733 ) ( ON ?auto_798735 ?auto_798734 ) ( ON ?auto_798736 ?auto_798735 ) ( ON ?auto_798737 ?auto_798736 ) ( not ( = ?auto_798733 ?auto_798734 ) ) ( not ( = ?auto_798733 ?auto_798735 ) ) ( not ( = ?auto_798733 ?auto_798736 ) ) ( not ( = ?auto_798733 ?auto_798737 ) ) ( not ( = ?auto_798733 ?auto_798738 ) ) ( not ( = ?auto_798733 ?auto_798739 ) ) ( not ( = ?auto_798733 ?auto_798740 ) ) ( not ( = ?auto_798733 ?auto_798742 ) ) ( not ( = ?auto_798734 ?auto_798735 ) ) ( not ( = ?auto_798734 ?auto_798736 ) ) ( not ( = ?auto_798734 ?auto_798737 ) ) ( not ( = ?auto_798734 ?auto_798738 ) ) ( not ( = ?auto_798734 ?auto_798739 ) ) ( not ( = ?auto_798734 ?auto_798740 ) ) ( not ( = ?auto_798734 ?auto_798742 ) ) ( not ( = ?auto_798735 ?auto_798736 ) ) ( not ( = ?auto_798735 ?auto_798737 ) ) ( not ( = ?auto_798735 ?auto_798738 ) ) ( not ( = ?auto_798735 ?auto_798739 ) ) ( not ( = ?auto_798735 ?auto_798740 ) ) ( not ( = ?auto_798735 ?auto_798742 ) ) ( not ( = ?auto_798736 ?auto_798737 ) ) ( not ( = ?auto_798736 ?auto_798738 ) ) ( not ( = ?auto_798736 ?auto_798739 ) ) ( not ( = ?auto_798736 ?auto_798740 ) ) ( not ( = ?auto_798736 ?auto_798742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798737 ?auto_798738 ?auto_798739 )
      ( MAKE-6CRATE-VERIFY ?auto_798733 ?auto_798734 ?auto_798735 ?auto_798736 ?auto_798737 ?auto_798738 ?auto_798739 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_798747 - SURFACE
      ?auto_798748 - SURFACE
    )
    :vars
    (
      ?auto_798752 - HOIST
      ?auto_798756 - PLACE
      ?auto_798753 - SURFACE
      ?auto_798754 - PLACE
      ?auto_798750 - HOIST
      ?auto_798749 - SURFACE
      ?auto_798751 - SURFACE
      ?auto_798755 - TRUCK
      ?auto_798757 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_798752 ?auto_798756 ) ( IS-CRATE ?auto_798748 ) ( not ( = ?auto_798747 ?auto_798748 ) ) ( not ( = ?auto_798753 ?auto_798747 ) ) ( not ( = ?auto_798753 ?auto_798748 ) ) ( not ( = ?auto_798754 ?auto_798756 ) ) ( HOIST-AT ?auto_798750 ?auto_798754 ) ( not ( = ?auto_798752 ?auto_798750 ) ) ( SURFACE-AT ?auto_798748 ?auto_798754 ) ( ON ?auto_798748 ?auto_798749 ) ( CLEAR ?auto_798748 ) ( not ( = ?auto_798747 ?auto_798749 ) ) ( not ( = ?auto_798748 ?auto_798749 ) ) ( not ( = ?auto_798753 ?auto_798749 ) ) ( IS-CRATE ?auto_798747 ) ( AVAILABLE ?auto_798750 ) ( SURFACE-AT ?auto_798747 ?auto_798754 ) ( ON ?auto_798747 ?auto_798751 ) ( CLEAR ?auto_798747 ) ( not ( = ?auto_798747 ?auto_798751 ) ) ( not ( = ?auto_798748 ?auto_798751 ) ) ( not ( = ?auto_798753 ?auto_798751 ) ) ( not ( = ?auto_798749 ?auto_798751 ) ) ( TRUCK-AT ?auto_798755 ?auto_798756 ) ( SURFACE-AT ?auto_798757 ?auto_798756 ) ( CLEAR ?auto_798757 ) ( LIFTING ?auto_798752 ?auto_798753 ) ( IS-CRATE ?auto_798753 ) ( not ( = ?auto_798757 ?auto_798753 ) ) ( not ( = ?auto_798747 ?auto_798757 ) ) ( not ( = ?auto_798748 ?auto_798757 ) ) ( not ( = ?auto_798749 ?auto_798757 ) ) ( not ( = ?auto_798751 ?auto_798757 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_798757 ?auto_798753 )
      ( MAKE-2CRATE ?auto_798753 ?auto_798747 ?auto_798748 )
      ( MAKE-1CRATE-VERIFY ?auto_798747 ?auto_798748 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_798758 - SURFACE
      ?auto_798759 - SURFACE
      ?auto_798760 - SURFACE
    )
    :vars
    (
      ?auto_798766 - HOIST
      ?auto_798768 - PLACE
      ?auto_798761 - PLACE
      ?auto_798764 - HOIST
      ?auto_798762 - SURFACE
      ?auto_798767 - SURFACE
      ?auto_798765 - TRUCK
      ?auto_798763 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_798766 ?auto_798768 ) ( IS-CRATE ?auto_798760 ) ( not ( = ?auto_798759 ?auto_798760 ) ) ( not ( = ?auto_798758 ?auto_798759 ) ) ( not ( = ?auto_798758 ?auto_798760 ) ) ( not ( = ?auto_798761 ?auto_798768 ) ) ( HOIST-AT ?auto_798764 ?auto_798761 ) ( not ( = ?auto_798766 ?auto_798764 ) ) ( SURFACE-AT ?auto_798760 ?auto_798761 ) ( ON ?auto_798760 ?auto_798762 ) ( CLEAR ?auto_798760 ) ( not ( = ?auto_798759 ?auto_798762 ) ) ( not ( = ?auto_798760 ?auto_798762 ) ) ( not ( = ?auto_798758 ?auto_798762 ) ) ( IS-CRATE ?auto_798759 ) ( AVAILABLE ?auto_798764 ) ( SURFACE-AT ?auto_798759 ?auto_798761 ) ( ON ?auto_798759 ?auto_798767 ) ( CLEAR ?auto_798759 ) ( not ( = ?auto_798759 ?auto_798767 ) ) ( not ( = ?auto_798760 ?auto_798767 ) ) ( not ( = ?auto_798758 ?auto_798767 ) ) ( not ( = ?auto_798762 ?auto_798767 ) ) ( TRUCK-AT ?auto_798765 ?auto_798768 ) ( SURFACE-AT ?auto_798763 ?auto_798768 ) ( CLEAR ?auto_798763 ) ( LIFTING ?auto_798766 ?auto_798758 ) ( IS-CRATE ?auto_798758 ) ( not ( = ?auto_798763 ?auto_798758 ) ) ( not ( = ?auto_798759 ?auto_798763 ) ) ( not ( = ?auto_798760 ?auto_798763 ) ) ( not ( = ?auto_798762 ?auto_798763 ) ) ( not ( = ?auto_798767 ?auto_798763 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_798759 ?auto_798760 )
      ( MAKE-2CRATE-VERIFY ?auto_798758 ?auto_798759 ?auto_798760 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_798769 - SURFACE
      ?auto_798770 - SURFACE
      ?auto_798771 - SURFACE
      ?auto_798772 - SURFACE
    )
    :vars
    (
      ?auto_798775 - HOIST
      ?auto_798774 - PLACE
      ?auto_798779 - PLACE
      ?auto_798776 - HOIST
      ?auto_798777 - SURFACE
      ?auto_798778 - SURFACE
      ?auto_798773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798775 ?auto_798774 ) ( IS-CRATE ?auto_798772 ) ( not ( = ?auto_798771 ?auto_798772 ) ) ( not ( = ?auto_798770 ?auto_798771 ) ) ( not ( = ?auto_798770 ?auto_798772 ) ) ( not ( = ?auto_798779 ?auto_798774 ) ) ( HOIST-AT ?auto_798776 ?auto_798779 ) ( not ( = ?auto_798775 ?auto_798776 ) ) ( SURFACE-AT ?auto_798772 ?auto_798779 ) ( ON ?auto_798772 ?auto_798777 ) ( CLEAR ?auto_798772 ) ( not ( = ?auto_798771 ?auto_798777 ) ) ( not ( = ?auto_798772 ?auto_798777 ) ) ( not ( = ?auto_798770 ?auto_798777 ) ) ( IS-CRATE ?auto_798771 ) ( AVAILABLE ?auto_798776 ) ( SURFACE-AT ?auto_798771 ?auto_798779 ) ( ON ?auto_798771 ?auto_798778 ) ( CLEAR ?auto_798771 ) ( not ( = ?auto_798771 ?auto_798778 ) ) ( not ( = ?auto_798772 ?auto_798778 ) ) ( not ( = ?auto_798770 ?auto_798778 ) ) ( not ( = ?auto_798777 ?auto_798778 ) ) ( TRUCK-AT ?auto_798773 ?auto_798774 ) ( SURFACE-AT ?auto_798769 ?auto_798774 ) ( CLEAR ?auto_798769 ) ( LIFTING ?auto_798775 ?auto_798770 ) ( IS-CRATE ?auto_798770 ) ( not ( = ?auto_798769 ?auto_798770 ) ) ( not ( = ?auto_798771 ?auto_798769 ) ) ( not ( = ?auto_798772 ?auto_798769 ) ) ( not ( = ?auto_798777 ?auto_798769 ) ) ( not ( = ?auto_798778 ?auto_798769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798770 ?auto_798771 ?auto_798772 )
      ( MAKE-3CRATE-VERIFY ?auto_798769 ?auto_798770 ?auto_798771 ?auto_798772 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_798780 - SURFACE
      ?auto_798781 - SURFACE
      ?auto_798782 - SURFACE
      ?auto_798783 - SURFACE
      ?auto_798784 - SURFACE
    )
    :vars
    (
      ?auto_798787 - HOIST
      ?auto_798786 - PLACE
      ?auto_798791 - PLACE
      ?auto_798788 - HOIST
      ?auto_798789 - SURFACE
      ?auto_798790 - SURFACE
      ?auto_798785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798787 ?auto_798786 ) ( IS-CRATE ?auto_798784 ) ( not ( = ?auto_798783 ?auto_798784 ) ) ( not ( = ?auto_798782 ?auto_798783 ) ) ( not ( = ?auto_798782 ?auto_798784 ) ) ( not ( = ?auto_798791 ?auto_798786 ) ) ( HOIST-AT ?auto_798788 ?auto_798791 ) ( not ( = ?auto_798787 ?auto_798788 ) ) ( SURFACE-AT ?auto_798784 ?auto_798791 ) ( ON ?auto_798784 ?auto_798789 ) ( CLEAR ?auto_798784 ) ( not ( = ?auto_798783 ?auto_798789 ) ) ( not ( = ?auto_798784 ?auto_798789 ) ) ( not ( = ?auto_798782 ?auto_798789 ) ) ( IS-CRATE ?auto_798783 ) ( AVAILABLE ?auto_798788 ) ( SURFACE-AT ?auto_798783 ?auto_798791 ) ( ON ?auto_798783 ?auto_798790 ) ( CLEAR ?auto_798783 ) ( not ( = ?auto_798783 ?auto_798790 ) ) ( not ( = ?auto_798784 ?auto_798790 ) ) ( not ( = ?auto_798782 ?auto_798790 ) ) ( not ( = ?auto_798789 ?auto_798790 ) ) ( TRUCK-AT ?auto_798785 ?auto_798786 ) ( SURFACE-AT ?auto_798781 ?auto_798786 ) ( CLEAR ?auto_798781 ) ( LIFTING ?auto_798787 ?auto_798782 ) ( IS-CRATE ?auto_798782 ) ( not ( = ?auto_798781 ?auto_798782 ) ) ( not ( = ?auto_798783 ?auto_798781 ) ) ( not ( = ?auto_798784 ?auto_798781 ) ) ( not ( = ?auto_798789 ?auto_798781 ) ) ( not ( = ?auto_798790 ?auto_798781 ) ) ( ON ?auto_798781 ?auto_798780 ) ( not ( = ?auto_798780 ?auto_798781 ) ) ( not ( = ?auto_798780 ?auto_798782 ) ) ( not ( = ?auto_798780 ?auto_798783 ) ) ( not ( = ?auto_798780 ?auto_798784 ) ) ( not ( = ?auto_798780 ?auto_798789 ) ) ( not ( = ?auto_798780 ?auto_798790 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798782 ?auto_798783 ?auto_798784 )
      ( MAKE-4CRATE-VERIFY ?auto_798780 ?auto_798781 ?auto_798782 ?auto_798783 ?auto_798784 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_798792 - SURFACE
      ?auto_798793 - SURFACE
      ?auto_798794 - SURFACE
      ?auto_798795 - SURFACE
      ?auto_798796 - SURFACE
      ?auto_798797 - SURFACE
    )
    :vars
    (
      ?auto_798800 - HOIST
      ?auto_798799 - PLACE
      ?auto_798804 - PLACE
      ?auto_798801 - HOIST
      ?auto_798802 - SURFACE
      ?auto_798803 - SURFACE
      ?auto_798798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798800 ?auto_798799 ) ( IS-CRATE ?auto_798797 ) ( not ( = ?auto_798796 ?auto_798797 ) ) ( not ( = ?auto_798795 ?auto_798796 ) ) ( not ( = ?auto_798795 ?auto_798797 ) ) ( not ( = ?auto_798804 ?auto_798799 ) ) ( HOIST-AT ?auto_798801 ?auto_798804 ) ( not ( = ?auto_798800 ?auto_798801 ) ) ( SURFACE-AT ?auto_798797 ?auto_798804 ) ( ON ?auto_798797 ?auto_798802 ) ( CLEAR ?auto_798797 ) ( not ( = ?auto_798796 ?auto_798802 ) ) ( not ( = ?auto_798797 ?auto_798802 ) ) ( not ( = ?auto_798795 ?auto_798802 ) ) ( IS-CRATE ?auto_798796 ) ( AVAILABLE ?auto_798801 ) ( SURFACE-AT ?auto_798796 ?auto_798804 ) ( ON ?auto_798796 ?auto_798803 ) ( CLEAR ?auto_798796 ) ( not ( = ?auto_798796 ?auto_798803 ) ) ( not ( = ?auto_798797 ?auto_798803 ) ) ( not ( = ?auto_798795 ?auto_798803 ) ) ( not ( = ?auto_798802 ?auto_798803 ) ) ( TRUCK-AT ?auto_798798 ?auto_798799 ) ( SURFACE-AT ?auto_798794 ?auto_798799 ) ( CLEAR ?auto_798794 ) ( LIFTING ?auto_798800 ?auto_798795 ) ( IS-CRATE ?auto_798795 ) ( not ( = ?auto_798794 ?auto_798795 ) ) ( not ( = ?auto_798796 ?auto_798794 ) ) ( not ( = ?auto_798797 ?auto_798794 ) ) ( not ( = ?auto_798802 ?auto_798794 ) ) ( not ( = ?auto_798803 ?auto_798794 ) ) ( ON ?auto_798793 ?auto_798792 ) ( ON ?auto_798794 ?auto_798793 ) ( not ( = ?auto_798792 ?auto_798793 ) ) ( not ( = ?auto_798792 ?auto_798794 ) ) ( not ( = ?auto_798792 ?auto_798795 ) ) ( not ( = ?auto_798792 ?auto_798796 ) ) ( not ( = ?auto_798792 ?auto_798797 ) ) ( not ( = ?auto_798792 ?auto_798802 ) ) ( not ( = ?auto_798792 ?auto_798803 ) ) ( not ( = ?auto_798793 ?auto_798794 ) ) ( not ( = ?auto_798793 ?auto_798795 ) ) ( not ( = ?auto_798793 ?auto_798796 ) ) ( not ( = ?auto_798793 ?auto_798797 ) ) ( not ( = ?auto_798793 ?auto_798802 ) ) ( not ( = ?auto_798793 ?auto_798803 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798795 ?auto_798796 ?auto_798797 )
      ( MAKE-5CRATE-VERIFY ?auto_798792 ?auto_798793 ?auto_798794 ?auto_798795 ?auto_798796 ?auto_798797 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798805 - SURFACE
      ?auto_798806 - SURFACE
      ?auto_798807 - SURFACE
      ?auto_798808 - SURFACE
      ?auto_798809 - SURFACE
      ?auto_798810 - SURFACE
      ?auto_798811 - SURFACE
    )
    :vars
    (
      ?auto_798814 - HOIST
      ?auto_798813 - PLACE
      ?auto_798818 - PLACE
      ?auto_798815 - HOIST
      ?auto_798816 - SURFACE
      ?auto_798817 - SURFACE
      ?auto_798812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798814 ?auto_798813 ) ( IS-CRATE ?auto_798811 ) ( not ( = ?auto_798810 ?auto_798811 ) ) ( not ( = ?auto_798809 ?auto_798810 ) ) ( not ( = ?auto_798809 ?auto_798811 ) ) ( not ( = ?auto_798818 ?auto_798813 ) ) ( HOIST-AT ?auto_798815 ?auto_798818 ) ( not ( = ?auto_798814 ?auto_798815 ) ) ( SURFACE-AT ?auto_798811 ?auto_798818 ) ( ON ?auto_798811 ?auto_798816 ) ( CLEAR ?auto_798811 ) ( not ( = ?auto_798810 ?auto_798816 ) ) ( not ( = ?auto_798811 ?auto_798816 ) ) ( not ( = ?auto_798809 ?auto_798816 ) ) ( IS-CRATE ?auto_798810 ) ( AVAILABLE ?auto_798815 ) ( SURFACE-AT ?auto_798810 ?auto_798818 ) ( ON ?auto_798810 ?auto_798817 ) ( CLEAR ?auto_798810 ) ( not ( = ?auto_798810 ?auto_798817 ) ) ( not ( = ?auto_798811 ?auto_798817 ) ) ( not ( = ?auto_798809 ?auto_798817 ) ) ( not ( = ?auto_798816 ?auto_798817 ) ) ( TRUCK-AT ?auto_798812 ?auto_798813 ) ( SURFACE-AT ?auto_798808 ?auto_798813 ) ( CLEAR ?auto_798808 ) ( LIFTING ?auto_798814 ?auto_798809 ) ( IS-CRATE ?auto_798809 ) ( not ( = ?auto_798808 ?auto_798809 ) ) ( not ( = ?auto_798810 ?auto_798808 ) ) ( not ( = ?auto_798811 ?auto_798808 ) ) ( not ( = ?auto_798816 ?auto_798808 ) ) ( not ( = ?auto_798817 ?auto_798808 ) ) ( ON ?auto_798806 ?auto_798805 ) ( ON ?auto_798807 ?auto_798806 ) ( ON ?auto_798808 ?auto_798807 ) ( not ( = ?auto_798805 ?auto_798806 ) ) ( not ( = ?auto_798805 ?auto_798807 ) ) ( not ( = ?auto_798805 ?auto_798808 ) ) ( not ( = ?auto_798805 ?auto_798809 ) ) ( not ( = ?auto_798805 ?auto_798810 ) ) ( not ( = ?auto_798805 ?auto_798811 ) ) ( not ( = ?auto_798805 ?auto_798816 ) ) ( not ( = ?auto_798805 ?auto_798817 ) ) ( not ( = ?auto_798806 ?auto_798807 ) ) ( not ( = ?auto_798806 ?auto_798808 ) ) ( not ( = ?auto_798806 ?auto_798809 ) ) ( not ( = ?auto_798806 ?auto_798810 ) ) ( not ( = ?auto_798806 ?auto_798811 ) ) ( not ( = ?auto_798806 ?auto_798816 ) ) ( not ( = ?auto_798806 ?auto_798817 ) ) ( not ( = ?auto_798807 ?auto_798808 ) ) ( not ( = ?auto_798807 ?auto_798809 ) ) ( not ( = ?auto_798807 ?auto_798810 ) ) ( not ( = ?auto_798807 ?auto_798811 ) ) ( not ( = ?auto_798807 ?auto_798816 ) ) ( not ( = ?auto_798807 ?auto_798817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798809 ?auto_798810 ?auto_798811 )
      ( MAKE-6CRATE-VERIFY ?auto_798805 ?auto_798806 ?auto_798807 ?auto_798808 ?auto_798809 ?auto_798810 ?auto_798811 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800391 - SURFACE
      ?auto_800392 - SURFACE
      ?auto_800393 - SURFACE
      ?auto_800394 - SURFACE
      ?auto_800395 - SURFACE
      ?auto_800396 - SURFACE
      ?auto_800397 - SURFACE
      ?auto_800398 - SURFACE
    )
    :vars
    (
      ?auto_800399 - HOIST
      ?auto_800400 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_800399 ?auto_800400 ) ( SURFACE-AT ?auto_800397 ?auto_800400 ) ( CLEAR ?auto_800397 ) ( LIFTING ?auto_800399 ?auto_800398 ) ( IS-CRATE ?auto_800398 ) ( not ( = ?auto_800397 ?auto_800398 ) ) ( ON ?auto_800392 ?auto_800391 ) ( ON ?auto_800393 ?auto_800392 ) ( ON ?auto_800394 ?auto_800393 ) ( ON ?auto_800395 ?auto_800394 ) ( ON ?auto_800396 ?auto_800395 ) ( ON ?auto_800397 ?auto_800396 ) ( not ( = ?auto_800391 ?auto_800392 ) ) ( not ( = ?auto_800391 ?auto_800393 ) ) ( not ( = ?auto_800391 ?auto_800394 ) ) ( not ( = ?auto_800391 ?auto_800395 ) ) ( not ( = ?auto_800391 ?auto_800396 ) ) ( not ( = ?auto_800391 ?auto_800397 ) ) ( not ( = ?auto_800391 ?auto_800398 ) ) ( not ( = ?auto_800392 ?auto_800393 ) ) ( not ( = ?auto_800392 ?auto_800394 ) ) ( not ( = ?auto_800392 ?auto_800395 ) ) ( not ( = ?auto_800392 ?auto_800396 ) ) ( not ( = ?auto_800392 ?auto_800397 ) ) ( not ( = ?auto_800392 ?auto_800398 ) ) ( not ( = ?auto_800393 ?auto_800394 ) ) ( not ( = ?auto_800393 ?auto_800395 ) ) ( not ( = ?auto_800393 ?auto_800396 ) ) ( not ( = ?auto_800393 ?auto_800397 ) ) ( not ( = ?auto_800393 ?auto_800398 ) ) ( not ( = ?auto_800394 ?auto_800395 ) ) ( not ( = ?auto_800394 ?auto_800396 ) ) ( not ( = ?auto_800394 ?auto_800397 ) ) ( not ( = ?auto_800394 ?auto_800398 ) ) ( not ( = ?auto_800395 ?auto_800396 ) ) ( not ( = ?auto_800395 ?auto_800397 ) ) ( not ( = ?auto_800395 ?auto_800398 ) ) ( not ( = ?auto_800396 ?auto_800397 ) ) ( not ( = ?auto_800396 ?auto_800398 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_800397 ?auto_800398 )
      ( MAKE-7CRATE-VERIFY ?auto_800391 ?auto_800392 ?auto_800393 ?auto_800394 ?auto_800395 ?auto_800396 ?auto_800397 ?auto_800398 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800446 - SURFACE
      ?auto_800447 - SURFACE
      ?auto_800448 - SURFACE
      ?auto_800449 - SURFACE
      ?auto_800450 - SURFACE
      ?auto_800451 - SURFACE
      ?auto_800452 - SURFACE
      ?auto_800453 - SURFACE
    )
    :vars
    (
      ?auto_800456 - HOIST
      ?auto_800454 - PLACE
      ?auto_800455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_800456 ?auto_800454 ) ( SURFACE-AT ?auto_800452 ?auto_800454 ) ( CLEAR ?auto_800452 ) ( IS-CRATE ?auto_800453 ) ( not ( = ?auto_800452 ?auto_800453 ) ) ( TRUCK-AT ?auto_800455 ?auto_800454 ) ( AVAILABLE ?auto_800456 ) ( IN ?auto_800453 ?auto_800455 ) ( ON ?auto_800452 ?auto_800451 ) ( not ( = ?auto_800451 ?auto_800452 ) ) ( not ( = ?auto_800451 ?auto_800453 ) ) ( ON ?auto_800447 ?auto_800446 ) ( ON ?auto_800448 ?auto_800447 ) ( ON ?auto_800449 ?auto_800448 ) ( ON ?auto_800450 ?auto_800449 ) ( ON ?auto_800451 ?auto_800450 ) ( not ( = ?auto_800446 ?auto_800447 ) ) ( not ( = ?auto_800446 ?auto_800448 ) ) ( not ( = ?auto_800446 ?auto_800449 ) ) ( not ( = ?auto_800446 ?auto_800450 ) ) ( not ( = ?auto_800446 ?auto_800451 ) ) ( not ( = ?auto_800446 ?auto_800452 ) ) ( not ( = ?auto_800446 ?auto_800453 ) ) ( not ( = ?auto_800447 ?auto_800448 ) ) ( not ( = ?auto_800447 ?auto_800449 ) ) ( not ( = ?auto_800447 ?auto_800450 ) ) ( not ( = ?auto_800447 ?auto_800451 ) ) ( not ( = ?auto_800447 ?auto_800452 ) ) ( not ( = ?auto_800447 ?auto_800453 ) ) ( not ( = ?auto_800448 ?auto_800449 ) ) ( not ( = ?auto_800448 ?auto_800450 ) ) ( not ( = ?auto_800448 ?auto_800451 ) ) ( not ( = ?auto_800448 ?auto_800452 ) ) ( not ( = ?auto_800448 ?auto_800453 ) ) ( not ( = ?auto_800449 ?auto_800450 ) ) ( not ( = ?auto_800449 ?auto_800451 ) ) ( not ( = ?auto_800449 ?auto_800452 ) ) ( not ( = ?auto_800449 ?auto_800453 ) ) ( not ( = ?auto_800450 ?auto_800451 ) ) ( not ( = ?auto_800450 ?auto_800452 ) ) ( not ( = ?auto_800450 ?auto_800453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800451 ?auto_800452 ?auto_800453 )
      ( MAKE-7CRATE-VERIFY ?auto_800446 ?auto_800447 ?auto_800448 ?auto_800449 ?auto_800450 ?auto_800451 ?auto_800452 ?auto_800453 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800509 - SURFACE
      ?auto_800510 - SURFACE
      ?auto_800511 - SURFACE
      ?auto_800512 - SURFACE
      ?auto_800513 - SURFACE
      ?auto_800514 - SURFACE
      ?auto_800515 - SURFACE
      ?auto_800516 - SURFACE
    )
    :vars
    (
      ?auto_800519 - HOIST
      ?auto_800517 - PLACE
      ?auto_800518 - TRUCK
      ?auto_800520 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_800519 ?auto_800517 ) ( SURFACE-AT ?auto_800515 ?auto_800517 ) ( CLEAR ?auto_800515 ) ( IS-CRATE ?auto_800516 ) ( not ( = ?auto_800515 ?auto_800516 ) ) ( AVAILABLE ?auto_800519 ) ( IN ?auto_800516 ?auto_800518 ) ( ON ?auto_800515 ?auto_800514 ) ( not ( = ?auto_800514 ?auto_800515 ) ) ( not ( = ?auto_800514 ?auto_800516 ) ) ( TRUCK-AT ?auto_800518 ?auto_800520 ) ( not ( = ?auto_800520 ?auto_800517 ) ) ( ON ?auto_800510 ?auto_800509 ) ( ON ?auto_800511 ?auto_800510 ) ( ON ?auto_800512 ?auto_800511 ) ( ON ?auto_800513 ?auto_800512 ) ( ON ?auto_800514 ?auto_800513 ) ( not ( = ?auto_800509 ?auto_800510 ) ) ( not ( = ?auto_800509 ?auto_800511 ) ) ( not ( = ?auto_800509 ?auto_800512 ) ) ( not ( = ?auto_800509 ?auto_800513 ) ) ( not ( = ?auto_800509 ?auto_800514 ) ) ( not ( = ?auto_800509 ?auto_800515 ) ) ( not ( = ?auto_800509 ?auto_800516 ) ) ( not ( = ?auto_800510 ?auto_800511 ) ) ( not ( = ?auto_800510 ?auto_800512 ) ) ( not ( = ?auto_800510 ?auto_800513 ) ) ( not ( = ?auto_800510 ?auto_800514 ) ) ( not ( = ?auto_800510 ?auto_800515 ) ) ( not ( = ?auto_800510 ?auto_800516 ) ) ( not ( = ?auto_800511 ?auto_800512 ) ) ( not ( = ?auto_800511 ?auto_800513 ) ) ( not ( = ?auto_800511 ?auto_800514 ) ) ( not ( = ?auto_800511 ?auto_800515 ) ) ( not ( = ?auto_800511 ?auto_800516 ) ) ( not ( = ?auto_800512 ?auto_800513 ) ) ( not ( = ?auto_800512 ?auto_800514 ) ) ( not ( = ?auto_800512 ?auto_800515 ) ) ( not ( = ?auto_800512 ?auto_800516 ) ) ( not ( = ?auto_800513 ?auto_800514 ) ) ( not ( = ?auto_800513 ?auto_800515 ) ) ( not ( = ?auto_800513 ?auto_800516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800514 ?auto_800515 ?auto_800516 )
      ( MAKE-7CRATE-VERIFY ?auto_800509 ?auto_800510 ?auto_800511 ?auto_800512 ?auto_800513 ?auto_800514 ?auto_800515 ?auto_800516 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800579 - SURFACE
      ?auto_800580 - SURFACE
      ?auto_800581 - SURFACE
      ?auto_800582 - SURFACE
      ?auto_800583 - SURFACE
      ?auto_800584 - SURFACE
      ?auto_800585 - SURFACE
      ?auto_800586 - SURFACE
    )
    :vars
    (
      ?auto_800591 - HOIST
      ?auto_800590 - PLACE
      ?auto_800589 - TRUCK
      ?auto_800587 - PLACE
      ?auto_800588 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_800591 ?auto_800590 ) ( SURFACE-AT ?auto_800585 ?auto_800590 ) ( CLEAR ?auto_800585 ) ( IS-CRATE ?auto_800586 ) ( not ( = ?auto_800585 ?auto_800586 ) ) ( AVAILABLE ?auto_800591 ) ( ON ?auto_800585 ?auto_800584 ) ( not ( = ?auto_800584 ?auto_800585 ) ) ( not ( = ?auto_800584 ?auto_800586 ) ) ( TRUCK-AT ?auto_800589 ?auto_800587 ) ( not ( = ?auto_800587 ?auto_800590 ) ) ( HOIST-AT ?auto_800588 ?auto_800587 ) ( LIFTING ?auto_800588 ?auto_800586 ) ( not ( = ?auto_800591 ?auto_800588 ) ) ( ON ?auto_800580 ?auto_800579 ) ( ON ?auto_800581 ?auto_800580 ) ( ON ?auto_800582 ?auto_800581 ) ( ON ?auto_800583 ?auto_800582 ) ( ON ?auto_800584 ?auto_800583 ) ( not ( = ?auto_800579 ?auto_800580 ) ) ( not ( = ?auto_800579 ?auto_800581 ) ) ( not ( = ?auto_800579 ?auto_800582 ) ) ( not ( = ?auto_800579 ?auto_800583 ) ) ( not ( = ?auto_800579 ?auto_800584 ) ) ( not ( = ?auto_800579 ?auto_800585 ) ) ( not ( = ?auto_800579 ?auto_800586 ) ) ( not ( = ?auto_800580 ?auto_800581 ) ) ( not ( = ?auto_800580 ?auto_800582 ) ) ( not ( = ?auto_800580 ?auto_800583 ) ) ( not ( = ?auto_800580 ?auto_800584 ) ) ( not ( = ?auto_800580 ?auto_800585 ) ) ( not ( = ?auto_800580 ?auto_800586 ) ) ( not ( = ?auto_800581 ?auto_800582 ) ) ( not ( = ?auto_800581 ?auto_800583 ) ) ( not ( = ?auto_800581 ?auto_800584 ) ) ( not ( = ?auto_800581 ?auto_800585 ) ) ( not ( = ?auto_800581 ?auto_800586 ) ) ( not ( = ?auto_800582 ?auto_800583 ) ) ( not ( = ?auto_800582 ?auto_800584 ) ) ( not ( = ?auto_800582 ?auto_800585 ) ) ( not ( = ?auto_800582 ?auto_800586 ) ) ( not ( = ?auto_800583 ?auto_800584 ) ) ( not ( = ?auto_800583 ?auto_800585 ) ) ( not ( = ?auto_800583 ?auto_800586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800584 ?auto_800585 ?auto_800586 )
      ( MAKE-7CRATE-VERIFY ?auto_800579 ?auto_800580 ?auto_800581 ?auto_800582 ?auto_800583 ?auto_800584 ?auto_800585 ?auto_800586 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800656 - SURFACE
      ?auto_800657 - SURFACE
      ?auto_800658 - SURFACE
      ?auto_800659 - SURFACE
      ?auto_800660 - SURFACE
      ?auto_800661 - SURFACE
      ?auto_800662 - SURFACE
      ?auto_800663 - SURFACE
    )
    :vars
    (
      ?auto_800664 - HOIST
      ?auto_800667 - PLACE
      ?auto_800668 - TRUCK
      ?auto_800669 - PLACE
      ?auto_800665 - HOIST
      ?auto_800666 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_800664 ?auto_800667 ) ( SURFACE-AT ?auto_800662 ?auto_800667 ) ( CLEAR ?auto_800662 ) ( IS-CRATE ?auto_800663 ) ( not ( = ?auto_800662 ?auto_800663 ) ) ( AVAILABLE ?auto_800664 ) ( ON ?auto_800662 ?auto_800661 ) ( not ( = ?auto_800661 ?auto_800662 ) ) ( not ( = ?auto_800661 ?auto_800663 ) ) ( TRUCK-AT ?auto_800668 ?auto_800669 ) ( not ( = ?auto_800669 ?auto_800667 ) ) ( HOIST-AT ?auto_800665 ?auto_800669 ) ( not ( = ?auto_800664 ?auto_800665 ) ) ( AVAILABLE ?auto_800665 ) ( SURFACE-AT ?auto_800663 ?auto_800669 ) ( ON ?auto_800663 ?auto_800666 ) ( CLEAR ?auto_800663 ) ( not ( = ?auto_800662 ?auto_800666 ) ) ( not ( = ?auto_800663 ?auto_800666 ) ) ( not ( = ?auto_800661 ?auto_800666 ) ) ( ON ?auto_800657 ?auto_800656 ) ( ON ?auto_800658 ?auto_800657 ) ( ON ?auto_800659 ?auto_800658 ) ( ON ?auto_800660 ?auto_800659 ) ( ON ?auto_800661 ?auto_800660 ) ( not ( = ?auto_800656 ?auto_800657 ) ) ( not ( = ?auto_800656 ?auto_800658 ) ) ( not ( = ?auto_800656 ?auto_800659 ) ) ( not ( = ?auto_800656 ?auto_800660 ) ) ( not ( = ?auto_800656 ?auto_800661 ) ) ( not ( = ?auto_800656 ?auto_800662 ) ) ( not ( = ?auto_800656 ?auto_800663 ) ) ( not ( = ?auto_800656 ?auto_800666 ) ) ( not ( = ?auto_800657 ?auto_800658 ) ) ( not ( = ?auto_800657 ?auto_800659 ) ) ( not ( = ?auto_800657 ?auto_800660 ) ) ( not ( = ?auto_800657 ?auto_800661 ) ) ( not ( = ?auto_800657 ?auto_800662 ) ) ( not ( = ?auto_800657 ?auto_800663 ) ) ( not ( = ?auto_800657 ?auto_800666 ) ) ( not ( = ?auto_800658 ?auto_800659 ) ) ( not ( = ?auto_800658 ?auto_800660 ) ) ( not ( = ?auto_800658 ?auto_800661 ) ) ( not ( = ?auto_800658 ?auto_800662 ) ) ( not ( = ?auto_800658 ?auto_800663 ) ) ( not ( = ?auto_800658 ?auto_800666 ) ) ( not ( = ?auto_800659 ?auto_800660 ) ) ( not ( = ?auto_800659 ?auto_800661 ) ) ( not ( = ?auto_800659 ?auto_800662 ) ) ( not ( = ?auto_800659 ?auto_800663 ) ) ( not ( = ?auto_800659 ?auto_800666 ) ) ( not ( = ?auto_800660 ?auto_800661 ) ) ( not ( = ?auto_800660 ?auto_800662 ) ) ( not ( = ?auto_800660 ?auto_800663 ) ) ( not ( = ?auto_800660 ?auto_800666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800661 ?auto_800662 ?auto_800663 )
      ( MAKE-7CRATE-VERIFY ?auto_800656 ?auto_800657 ?auto_800658 ?auto_800659 ?auto_800660 ?auto_800661 ?auto_800662 ?auto_800663 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800734 - SURFACE
      ?auto_800735 - SURFACE
      ?auto_800736 - SURFACE
      ?auto_800737 - SURFACE
      ?auto_800738 - SURFACE
      ?auto_800739 - SURFACE
      ?auto_800740 - SURFACE
      ?auto_800741 - SURFACE
    )
    :vars
    (
      ?auto_800747 - HOIST
      ?auto_800743 - PLACE
      ?auto_800746 - PLACE
      ?auto_800744 - HOIST
      ?auto_800742 - SURFACE
      ?auto_800745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_800747 ?auto_800743 ) ( SURFACE-AT ?auto_800740 ?auto_800743 ) ( CLEAR ?auto_800740 ) ( IS-CRATE ?auto_800741 ) ( not ( = ?auto_800740 ?auto_800741 ) ) ( AVAILABLE ?auto_800747 ) ( ON ?auto_800740 ?auto_800739 ) ( not ( = ?auto_800739 ?auto_800740 ) ) ( not ( = ?auto_800739 ?auto_800741 ) ) ( not ( = ?auto_800746 ?auto_800743 ) ) ( HOIST-AT ?auto_800744 ?auto_800746 ) ( not ( = ?auto_800747 ?auto_800744 ) ) ( AVAILABLE ?auto_800744 ) ( SURFACE-AT ?auto_800741 ?auto_800746 ) ( ON ?auto_800741 ?auto_800742 ) ( CLEAR ?auto_800741 ) ( not ( = ?auto_800740 ?auto_800742 ) ) ( not ( = ?auto_800741 ?auto_800742 ) ) ( not ( = ?auto_800739 ?auto_800742 ) ) ( TRUCK-AT ?auto_800745 ?auto_800743 ) ( ON ?auto_800735 ?auto_800734 ) ( ON ?auto_800736 ?auto_800735 ) ( ON ?auto_800737 ?auto_800736 ) ( ON ?auto_800738 ?auto_800737 ) ( ON ?auto_800739 ?auto_800738 ) ( not ( = ?auto_800734 ?auto_800735 ) ) ( not ( = ?auto_800734 ?auto_800736 ) ) ( not ( = ?auto_800734 ?auto_800737 ) ) ( not ( = ?auto_800734 ?auto_800738 ) ) ( not ( = ?auto_800734 ?auto_800739 ) ) ( not ( = ?auto_800734 ?auto_800740 ) ) ( not ( = ?auto_800734 ?auto_800741 ) ) ( not ( = ?auto_800734 ?auto_800742 ) ) ( not ( = ?auto_800735 ?auto_800736 ) ) ( not ( = ?auto_800735 ?auto_800737 ) ) ( not ( = ?auto_800735 ?auto_800738 ) ) ( not ( = ?auto_800735 ?auto_800739 ) ) ( not ( = ?auto_800735 ?auto_800740 ) ) ( not ( = ?auto_800735 ?auto_800741 ) ) ( not ( = ?auto_800735 ?auto_800742 ) ) ( not ( = ?auto_800736 ?auto_800737 ) ) ( not ( = ?auto_800736 ?auto_800738 ) ) ( not ( = ?auto_800736 ?auto_800739 ) ) ( not ( = ?auto_800736 ?auto_800740 ) ) ( not ( = ?auto_800736 ?auto_800741 ) ) ( not ( = ?auto_800736 ?auto_800742 ) ) ( not ( = ?auto_800737 ?auto_800738 ) ) ( not ( = ?auto_800737 ?auto_800739 ) ) ( not ( = ?auto_800737 ?auto_800740 ) ) ( not ( = ?auto_800737 ?auto_800741 ) ) ( not ( = ?auto_800737 ?auto_800742 ) ) ( not ( = ?auto_800738 ?auto_800739 ) ) ( not ( = ?auto_800738 ?auto_800740 ) ) ( not ( = ?auto_800738 ?auto_800741 ) ) ( not ( = ?auto_800738 ?auto_800742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800739 ?auto_800740 ?auto_800741 )
      ( MAKE-7CRATE-VERIFY ?auto_800734 ?auto_800735 ?auto_800736 ?auto_800737 ?auto_800738 ?auto_800739 ?auto_800740 ?auto_800741 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800812 - SURFACE
      ?auto_800813 - SURFACE
      ?auto_800814 - SURFACE
      ?auto_800815 - SURFACE
      ?auto_800816 - SURFACE
      ?auto_800817 - SURFACE
      ?auto_800818 - SURFACE
      ?auto_800819 - SURFACE
    )
    :vars
    (
      ?auto_800820 - HOIST
      ?auto_800824 - PLACE
      ?auto_800825 - PLACE
      ?auto_800823 - HOIST
      ?auto_800821 - SURFACE
      ?auto_800822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_800820 ?auto_800824 ) ( IS-CRATE ?auto_800819 ) ( not ( = ?auto_800818 ?auto_800819 ) ) ( not ( = ?auto_800817 ?auto_800818 ) ) ( not ( = ?auto_800817 ?auto_800819 ) ) ( not ( = ?auto_800825 ?auto_800824 ) ) ( HOIST-AT ?auto_800823 ?auto_800825 ) ( not ( = ?auto_800820 ?auto_800823 ) ) ( AVAILABLE ?auto_800823 ) ( SURFACE-AT ?auto_800819 ?auto_800825 ) ( ON ?auto_800819 ?auto_800821 ) ( CLEAR ?auto_800819 ) ( not ( = ?auto_800818 ?auto_800821 ) ) ( not ( = ?auto_800819 ?auto_800821 ) ) ( not ( = ?auto_800817 ?auto_800821 ) ) ( TRUCK-AT ?auto_800822 ?auto_800824 ) ( SURFACE-AT ?auto_800817 ?auto_800824 ) ( CLEAR ?auto_800817 ) ( LIFTING ?auto_800820 ?auto_800818 ) ( IS-CRATE ?auto_800818 ) ( ON ?auto_800813 ?auto_800812 ) ( ON ?auto_800814 ?auto_800813 ) ( ON ?auto_800815 ?auto_800814 ) ( ON ?auto_800816 ?auto_800815 ) ( ON ?auto_800817 ?auto_800816 ) ( not ( = ?auto_800812 ?auto_800813 ) ) ( not ( = ?auto_800812 ?auto_800814 ) ) ( not ( = ?auto_800812 ?auto_800815 ) ) ( not ( = ?auto_800812 ?auto_800816 ) ) ( not ( = ?auto_800812 ?auto_800817 ) ) ( not ( = ?auto_800812 ?auto_800818 ) ) ( not ( = ?auto_800812 ?auto_800819 ) ) ( not ( = ?auto_800812 ?auto_800821 ) ) ( not ( = ?auto_800813 ?auto_800814 ) ) ( not ( = ?auto_800813 ?auto_800815 ) ) ( not ( = ?auto_800813 ?auto_800816 ) ) ( not ( = ?auto_800813 ?auto_800817 ) ) ( not ( = ?auto_800813 ?auto_800818 ) ) ( not ( = ?auto_800813 ?auto_800819 ) ) ( not ( = ?auto_800813 ?auto_800821 ) ) ( not ( = ?auto_800814 ?auto_800815 ) ) ( not ( = ?auto_800814 ?auto_800816 ) ) ( not ( = ?auto_800814 ?auto_800817 ) ) ( not ( = ?auto_800814 ?auto_800818 ) ) ( not ( = ?auto_800814 ?auto_800819 ) ) ( not ( = ?auto_800814 ?auto_800821 ) ) ( not ( = ?auto_800815 ?auto_800816 ) ) ( not ( = ?auto_800815 ?auto_800817 ) ) ( not ( = ?auto_800815 ?auto_800818 ) ) ( not ( = ?auto_800815 ?auto_800819 ) ) ( not ( = ?auto_800815 ?auto_800821 ) ) ( not ( = ?auto_800816 ?auto_800817 ) ) ( not ( = ?auto_800816 ?auto_800818 ) ) ( not ( = ?auto_800816 ?auto_800819 ) ) ( not ( = ?auto_800816 ?auto_800821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800817 ?auto_800818 ?auto_800819 )
      ( MAKE-7CRATE-VERIFY ?auto_800812 ?auto_800813 ?auto_800814 ?auto_800815 ?auto_800816 ?auto_800817 ?auto_800818 ?auto_800819 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800890 - SURFACE
      ?auto_800891 - SURFACE
      ?auto_800892 - SURFACE
      ?auto_800893 - SURFACE
      ?auto_800894 - SURFACE
      ?auto_800895 - SURFACE
      ?auto_800896 - SURFACE
      ?auto_800897 - SURFACE
    )
    :vars
    (
      ?auto_800899 - HOIST
      ?auto_800900 - PLACE
      ?auto_800902 - PLACE
      ?auto_800903 - HOIST
      ?auto_800898 - SURFACE
      ?auto_800901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_800899 ?auto_800900 ) ( IS-CRATE ?auto_800897 ) ( not ( = ?auto_800896 ?auto_800897 ) ) ( not ( = ?auto_800895 ?auto_800896 ) ) ( not ( = ?auto_800895 ?auto_800897 ) ) ( not ( = ?auto_800902 ?auto_800900 ) ) ( HOIST-AT ?auto_800903 ?auto_800902 ) ( not ( = ?auto_800899 ?auto_800903 ) ) ( AVAILABLE ?auto_800903 ) ( SURFACE-AT ?auto_800897 ?auto_800902 ) ( ON ?auto_800897 ?auto_800898 ) ( CLEAR ?auto_800897 ) ( not ( = ?auto_800896 ?auto_800898 ) ) ( not ( = ?auto_800897 ?auto_800898 ) ) ( not ( = ?auto_800895 ?auto_800898 ) ) ( TRUCK-AT ?auto_800901 ?auto_800900 ) ( SURFACE-AT ?auto_800895 ?auto_800900 ) ( CLEAR ?auto_800895 ) ( IS-CRATE ?auto_800896 ) ( AVAILABLE ?auto_800899 ) ( IN ?auto_800896 ?auto_800901 ) ( ON ?auto_800891 ?auto_800890 ) ( ON ?auto_800892 ?auto_800891 ) ( ON ?auto_800893 ?auto_800892 ) ( ON ?auto_800894 ?auto_800893 ) ( ON ?auto_800895 ?auto_800894 ) ( not ( = ?auto_800890 ?auto_800891 ) ) ( not ( = ?auto_800890 ?auto_800892 ) ) ( not ( = ?auto_800890 ?auto_800893 ) ) ( not ( = ?auto_800890 ?auto_800894 ) ) ( not ( = ?auto_800890 ?auto_800895 ) ) ( not ( = ?auto_800890 ?auto_800896 ) ) ( not ( = ?auto_800890 ?auto_800897 ) ) ( not ( = ?auto_800890 ?auto_800898 ) ) ( not ( = ?auto_800891 ?auto_800892 ) ) ( not ( = ?auto_800891 ?auto_800893 ) ) ( not ( = ?auto_800891 ?auto_800894 ) ) ( not ( = ?auto_800891 ?auto_800895 ) ) ( not ( = ?auto_800891 ?auto_800896 ) ) ( not ( = ?auto_800891 ?auto_800897 ) ) ( not ( = ?auto_800891 ?auto_800898 ) ) ( not ( = ?auto_800892 ?auto_800893 ) ) ( not ( = ?auto_800892 ?auto_800894 ) ) ( not ( = ?auto_800892 ?auto_800895 ) ) ( not ( = ?auto_800892 ?auto_800896 ) ) ( not ( = ?auto_800892 ?auto_800897 ) ) ( not ( = ?auto_800892 ?auto_800898 ) ) ( not ( = ?auto_800893 ?auto_800894 ) ) ( not ( = ?auto_800893 ?auto_800895 ) ) ( not ( = ?auto_800893 ?auto_800896 ) ) ( not ( = ?auto_800893 ?auto_800897 ) ) ( not ( = ?auto_800893 ?auto_800898 ) ) ( not ( = ?auto_800894 ?auto_800895 ) ) ( not ( = ?auto_800894 ?auto_800896 ) ) ( not ( = ?auto_800894 ?auto_800897 ) ) ( not ( = ?auto_800894 ?auto_800898 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800895 ?auto_800896 ?auto_800897 )
      ( MAKE-7CRATE-VERIFY ?auto_800890 ?auto_800891 ?auto_800892 ?auto_800893 ?auto_800894 ?auto_800895 ?auto_800896 ?auto_800897 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_801469 - SURFACE
      ?auto_801470 - SURFACE
    )
    :vars
    (
      ?auto_801473 - HOIST
      ?auto_801474 - PLACE
      ?auto_801475 - SURFACE
      ?auto_801471 - PLACE
      ?auto_801476 - HOIST
      ?auto_801472 - SURFACE
      ?auto_801477 - TRUCK
      ?auto_801478 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_801473 ?auto_801474 ) ( SURFACE-AT ?auto_801469 ?auto_801474 ) ( CLEAR ?auto_801469 ) ( IS-CRATE ?auto_801470 ) ( not ( = ?auto_801469 ?auto_801470 ) ) ( ON ?auto_801469 ?auto_801475 ) ( not ( = ?auto_801475 ?auto_801469 ) ) ( not ( = ?auto_801475 ?auto_801470 ) ) ( not ( = ?auto_801471 ?auto_801474 ) ) ( HOIST-AT ?auto_801476 ?auto_801471 ) ( not ( = ?auto_801473 ?auto_801476 ) ) ( AVAILABLE ?auto_801476 ) ( SURFACE-AT ?auto_801470 ?auto_801471 ) ( ON ?auto_801470 ?auto_801472 ) ( CLEAR ?auto_801470 ) ( not ( = ?auto_801469 ?auto_801472 ) ) ( not ( = ?auto_801470 ?auto_801472 ) ) ( not ( = ?auto_801475 ?auto_801472 ) ) ( TRUCK-AT ?auto_801477 ?auto_801474 ) ( LIFTING ?auto_801473 ?auto_801478 ) ( IS-CRATE ?auto_801478 ) ( not ( = ?auto_801469 ?auto_801478 ) ) ( not ( = ?auto_801470 ?auto_801478 ) ) ( not ( = ?auto_801475 ?auto_801478 ) ) ( not ( = ?auto_801472 ?auto_801478 ) ) )
    :subtasks
    ( ( !LOAD ?auto_801473 ?auto_801478 ?auto_801477 ?auto_801474 )
      ( MAKE-1CRATE ?auto_801469 ?auto_801470 )
      ( MAKE-1CRATE-VERIFY ?auto_801469 ?auto_801470 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_801957 - SURFACE
      ?auto_801958 - SURFACE
    )
    :vars
    (
      ?auto_801963 - HOIST
      ?auto_801965 - PLACE
      ?auto_801962 - SURFACE
      ?auto_801964 - TRUCK
      ?auto_801959 - PLACE
      ?auto_801961 - HOIST
      ?auto_801960 - SURFACE
      ?auto_801966 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_801963 ?auto_801965 ) ( SURFACE-AT ?auto_801957 ?auto_801965 ) ( CLEAR ?auto_801957 ) ( IS-CRATE ?auto_801958 ) ( not ( = ?auto_801957 ?auto_801958 ) ) ( AVAILABLE ?auto_801963 ) ( ON ?auto_801957 ?auto_801962 ) ( not ( = ?auto_801962 ?auto_801957 ) ) ( not ( = ?auto_801962 ?auto_801958 ) ) ( TRUCK-AT ?auto_801964 ?auto_801959 ) ( not ( = ?auto_801959 ?auto_801965 ) ) ( HOIST-AT ?auto_801961 ?auto_801959 ) ( not ( = ?auto_801963 ?auto_801961 ) ) ( SURFACE-AT ?auto_801958 ?auto_801959 ) ( ON ?auto_801958 ?auto_801960 ) ( CLEAR ?auto_801958 ) ( not ( = ?auto_801957 ?auto_801960 ) ) ( not ( = ?auto_801958 ?auto_801960 ) ) ( not ( = ?auto_801962 ?auto_801960 ) ) ( LIFTING ?auto_801961 ?auto_801966 ) ( IS-CRATE ?auto_801966 ) ( not ( = ?auto_801957 ?auto_801966 ) ) ( not ( = ?auto_801958 ?auto_801966 ) ) ( not ( = ?auto_801962 ?auto_801966 ) ) ( not ( = ?auto_801960 ?auto_801966 ) ) )
    :subtasks
    ( ( !LOAD ?auto_801961 ?auto_801966 ?auto_801964 ?auto_801959 )
      ( MAKE-1CRATE ?auto_801957 ?auto_801958 )
      ( MAKE-1CRATE-VERIFY ?auto_801957 ?auto_801958 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_803790 - SURFACE
      ?auto_803791 - SURFACE
      ?auto_803792 - SURFACE
      ?auto_803793 - SURFACE
      ?auto_803794 - SURFACE
      ?auto_803795 - SURFACE
      ?auto_803796 - SURFACE
      ?auto_803797 - SURFACE
      ?auto_803798 - SURFACE
    )
    :vars
    (
      ?auto_803800 - HOIST
      ?auto_803799 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_803800 ?auto_803799 ) ( SURFACE-AT ?auto_803797 ?auto_803799 ) ( CLEAR ?auto_803797 ) ( LIFTING ?auto_803800 ?auto_803798 ) ( IS-CRATE ?auto_803798 ) ( not ( = ?auto_803797 ?auto_803798 ) ) ( ON ?auto_803791 ?auto_803790 ) ( ON ?auto_803792 ?auto_803791 ) ( ON ?auto_803793 ?auto_803792 ) ( ON ?auto_803794 ?auto_803793 ) ( ON ?auto_803795 ?auto_803794 ) ( ON ?auto_803796 ?auto_803795 ) ( ON ?auto_803797 ?auto_803796 ) ( not ( = ?auto_803790 ?auto_803791 ) ) ( not ( = ?auto_803790 ?auto_803792 ) ) ( not ( = ?auto_803790 ?auto_803793 ) ) ( not ( = ?auto_803790 ?auto_803794 ) ) ( not ( = ?auto_803790 ?auto_803795 ) ) ( not ( = ?auto_803790 ?auto_803796 ) ) ( not ( = ?auto_803790 ?auto_803797 ) ) ( not ( = ?auto_803790 ?auto_803798 ) ) ( not ( = ?auto_803791 ?auto_803792 ) ) ( not ( = ?auto_803791 ?auto_803793 ) ) ( not ( = ?auto_803791 ?auto_803794 ) ) ( not ( = ?auto_803791 ?auto_803795 ) ) ( not ( = ?auto_803791 ?auto_803796 ) ) ( not ( = ?auto_803791 ?auto_803797 ) ) ( not ( = ?auto_803791 ?auto_803798 ) ) ( not ( = ?auto_803792 ?auto_803793 ) ) ( not ( = ?auto_803792 ?auto_803794 ) ) ( not ( = ?auto_803792 ?auto_803795 ) ) ( not ( = ?auto_803792 ?auto_803796 ) ) ( not ( = ?auto_803792 ?auto_803797 ) ) ( not ( = ?auto_803792 ?auto_803798 ) ) ( not ( = ?auto_803793 ?auto_803794 ) ) ( not ( = ?auto_803793 ?auto_803795 ) ) ( not ( = ?auto_803793 ?auto_803796 ) ) ( not ( = ?auto_803793 ?auto_803797 ) ) ( not ( = ?auto_803793 ?auto_803798 ) ) ( not ( = ?auto_803794 ?auto_803795 ) ) ( not ( = ?auto_803794 ?auto_803796 ) ) ( not ( = ?auto_803794 ?auto_803797 ) ) ( not ( = ?auto_803794 ?auto_803798 ) ) ( not ( = ?auto_803795 ?auto_803796 ) ) ( not ( = ?auto_803795 ?auto_803797 ) ) ( not ( = ?auto_803795 ?auto_803798 ) ) ( not ( = ?auto_803796 ?auto_803797 ) ) ( not ( = ?auto_803796 ?auto_803798 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_803797 ?auto_803798 )
      ( MAKE-8CRATE-VERIFY ?auto_803790 ?auto_803791 ?auto_803792 ?auto_803793 ?auto_803794 ?auto_803795 ?auto_803796 ?auto_803797 ?auto_803798 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_803857 - SURFACE
      ?auto_803858 - SURFACE
      ?auto_803859 - SURFACE
      ?auto_803860 - SURFACE
      ?auto_803861 - SURFACE
      ?auto_803862 - SURFACE
      ?auto_803863 - SURFACE
      ?auto_803864 - SURFACE
      ?auto_803865 - SURFACE
    )
    :vars
    (
      ?auto_803868 - HOIST
      ?auto_803867 - PLACE
      ?auto_803866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_803868 ?auto_803867 ) ( SURFACE-AT ?auto_803864 ?auto_803867 ) ( CLEAR ?auto_803864 ) ( IS-CRATE ?auto_803865 ) ( not ( = ?auto_803864 ?auto_803865 ) ) ( TRUCK-AT ?auto_803866 ?auto_803867 ) ( AVAILABLE ?auto_803868 ) ( IN ?auto_803865 ?auto_803866 ) ( ON ?auto_803864 ?auto_803863 ) ( not ( = ?auto_803863 ?auto_803864 ) ) ( not ( = ?auto_803863 ?auto_803865 ) ) ( ON ?auto_803858 ?auto_803857 ) ( ON ?auto_803859 ?auto_803858 ) ( ON ?auto_803860 ?auto_803859 ) ( ON ?auto_803861 ?auto_803860 ) ( ON ?auto_803862 ?auto_803861 ) ( ON ?auto_803863 ?auto_803862 ) ( not ( = ?auto_803857 ?auto_803858 ) ) ( not ( = ?auto_803857 ?auto_803859 ) ) ( not ( = ?auto_803857 ?auto_803860 ) ) ( not ( = ?auto_803857 ?auto_803861 ) ) ( not ( = ?auto_803857 ?auto_803862 ) ) ( not ( = ?auto_803857 ?auto_803863 ) ) ( not ( = ?auto_803857 ?auto_803864 ) ) ( not ( = ?auto_803857 ?auto_803865 ) ) ( not ( = ?auto_803858 ?auto_803859 ) ) ( not ( = ?auto_803858 ?auto_803860 ) ) ( not ( = ?auto_803858 ?auto_803861 ) ) ( not ( = ?auto_803858 ?auto_803862 ) ) ( not ( = ?auto_803858 ?auto_803863 ) ) ( not ( = ?auto_803858 ?auto_803864 ) ) ( not ( = ?auto_803858 ?auto_803865 ) ) ( not ( = ?auto_803859 ?auto_803860 ) ) ( not ( = ?auto_803859 ?auto_803861 ) ) ( not ( = ?auto_803859 ?auto_803862 ) ) ( not ( = ?auto_803859 ?auto_803863 ) ) ( not ( = ?auto_803859 ?auto_803864 ) ) ( not ( = ?auto_803859 ?auto_803865 ) ) ( not ( = ?auto_803860 ?auto_803861 ) ) ( not ( = ?auto_803860 ?auto_803862 ) ) ( not ( = ?auto_803860 ?auto_803863 ) ) ( not ( = ?auto_803860 ?auto_803864 ) ) ( not ( = ?auto_803860 ?auto_803865 ) ) ( not ( = ?auto_803861 ?auto_803862 ) ) ( not ( = ?auto_803861 ?auto_803863 ) ) ( not ( = ?auto_803861 ?auto_803864 ) ) ( not ( = ?auto_803861 ?auto_803865 ) ) ( not ( = ?auto_803862 ?auto_803863 ) ) ( not ( = ?auto_803862 ?auto_803864 ) ) ( not ( = ?auto_803862 ?auto_803865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_803863 ?auto_803864 ?auto_803865 )
      ( MAKE-8CRATE-VERIFY ?auto_803857 ?auto_803858 ?auto_803859 ?auto_803860 ?auto_803861 ?auto_803862 ?auto_803863 ?auto_803864 ?auto_803865 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_803933 - SURFACE
      ?auto_803934 - SURFACE
      ?auto_803935 - SURFACE
      ?auto_803936 - SURFACE
      ?auto_803937 - SURFACE
      ?auto_803938 - SURFACE
      ?auto_803939 - SURFACE
      ?auto_803940 - SURFACE
      ?auto_803941 - SURFACE
    )
    :vars
    (
      ?auto_803943 - HOIST
      ?auto_803942 - PLACE
      ?auto_803944 - TRUCK
      ?auto_803945 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_803943 ?auto_803942 ) ( SURFACE-AT ?auto_803940 ?auto_803942 ) ( CLEAR ?auto_803940 ) ( IS-CRATE ?auto_803941 ) ( not ( = ?auto_803940 ?auto_803941 ) ) ( AVAILABLE ?auto_803943 ) ( IN ?auto_803941 ?auto_803944 ) ( ON ?auto_803940 ?auto_803939 ) ( not ( = ?auto_803939 ?auto_803940 ) ) ( not ( = ?auto_803939 ?auto_803941 ) ) ( TRUCK-AT ?auto_803944 ?auto_803945 ) ( not ( = ?auto_803945 ?auto_803942 ) ) ( ON ?auto_803934 ?auto_803933 ) ( ON ?auto_803935 ?auto_803934 ) ( ON ?auto_803936 ?auto_803935 ) ( ON ?auto_803937 ?auto_803936 ) ( ON ?auto_803938 ?auto_803937 ) ( ON ?auto_803939 ?auto_803938 ) ( not ( = ?auto_803933 ?auto_803934 ) ) ( not ( = ?auto_803933 ?auto_803935 ) ) ( not ( = ?auto_803933 ?auto_803936 ) ) ( not ( = ?auto_803933 ?auto_803937 ) ) ( not ( = ?auto_803933 ?auto_803938 ) ) ( not ( = ?auto_803933 ?auto_803939 ) ) ( not ( = ?auto_803933 ?auto_803940 ) ) ( not ( = ?auto_803933 ?auto_803941 ) ) ( not ( = ?auto_803934 ?auto_803935 ) ) ( not ( = ?auto_803934 ?auto_803936 ) ) ( not ( = ?auto_803934 ?auto_803937 ) ) ( not ( = ?auto_803934 ?auto_803938 ) ) ( not ( = ?auto_803934 ?auto_803939 ) ) ( not ( = ?auto_803934 ?auto_803940 ) ) ( not ( = ?auto_803934 ?auto_803941 ) ) ( not ( = ?auto_803935 ?auto_803936 ) ) ( not ( = ?auto_803935 ?auto_803937 ) ) ( not ( = ?auto_803935 ?auto_803938 ) ) ( not ( = ?auto_803935 ?auto_803939 ) ) ( not ( = ?auto_803935 ?auto_803940 ) ) ( not ( = ?auto_803935 ?auto_803941 ) ) ( not ( = ?auto_803936 ?auto_803937 ) ) ( not ( = ?auto_803936 ?auto_803938 ) ) ( not ( = ?auto_803936 ?auto_803939 ) ) ( not ( = ?auto_803936 ?auto_803940 ) ) ( not ( = ?auto_803936 ?auto_803941 ) ) ( not ( = ?auto_803937 ?auto_803938 ) ) ( not ( = ?auto_803937 ?auto_803939 ) ) ( not ( = ?auto_803937 ?auto_803940 ) ) ( not ( = ?auto_803937 ?auto_803941 ) ) ( not ( = ?auto_803938 ?auto_803939 ) ) ( not ( = ?auto_803938 ?auto_803940 ) ) ( not ( = ?auto_803938 ?auto_803941 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_803939 ?auto_803940 ?auto_803941 )
      ( MAKE-8CRATE-VERIFY ?auto_803933 ?auto_803934 ?auto_803935 ?auto_803936 ?auto_803937 ?auto_803938 ?auto_803939 ?auto_803940 ?auto_803941 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_804017 - SURFACE
      ?auto_804018 - SURFACE
      ?auto_804019 - SURFACE
      ?auto_804020 - SURFACE
      ?auto_804021 - SURFACE
      ?auto_804022 - SURFACE
      ?auto_804023 - SURFACE
      ?auto_804024 - SURFACE
      ?auto_804025 - SURFACE
    )
    :vars
    (
      ?auto_804029 - HOIST
      ?auto_804030 - PLACE
      ?auto_804028 - TRUCK
      ?auto_804026 - PLACE
      ?auto_804027 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_804029 ?auto_804030 ) ( SURFACE-AT ?auto_804024 ?auto_804030 ) ( CLEAR ?auto_804024 ) ( IS-CRATE ?auto_804025 ) ( not ( = ?auto_804024 ?auto_804025 ) ) ( AVAILABLE ?auto_804029 ) ( ON ?auto_804024 ?auto_804023 ) ( not ( = ?auto_804023 ?auto_804024 ) ) ( not ( = ?auto_804023 ?auto_804025 ) ) ( TRUCK-AT ?auto_804028 ?auto_804026 ) ( not ( = ?auto_804026 ?auto_804030 ) ) ( HOIST-AT ?auto_804027 ?auto_804026 ) ( LIFTING ?auto_804027 ?auto_804025 ) ( not ( = ?auto_804029 ?auto_804027 ) ) ( ON ?auto_804018 ?auto_804017 ) ( ON ?auto_804019 ?auto_804018 ) ( ON ?auto_804020 ?auto_804019 ) ( ON ?auto_804021 ?auto_804020 ) ( ON ?auto_804022 ?auto_804021 ) ( ON ?auto_804023 ?auto_804022 ) ( not ( = ?auto_804017 ?auto_804018 ) ) ( not ( = ?auto_804017 ?auto_804019 ) ) ( not ( = ?auto_804017 ?auto_804020 ) ) ( not ( = ?auto_804017 ?auto_804021 ) ) ( not ( = ?auto_804017 ?auto_804022 ) ) ( not ( = ?auto_804017 ?auto_804023 ) ) ( not ( = ?auto_804017 ?auto_804024 ) ) ( not ( = ?auto_804017 ?auto_804025 ) ) ( not ( = ?auto_804018 ?auto_804019 ) ) ( not ( = ?auto_804018 ?auto_804020 ) ) ( not ( = ?auto_804018 ?auto_804021 ) ) ( not ( = ?auto_804018 ?auto_804022 ) ) ( not ( = ?auto_804018 ?auto_804023 ) ) ( not ( = ?auto_804018 ?auto_804024 ) ) ( not ( = ?auto_804018 ?auto_804025 ) ) ( not ( = ?auto_804019 ?auto_804020 ) ) ( not ( = ?auto_804019 ?auto_804021 ) ) ( not ( = ?auto_804019 ?auto_804022 ) ) ( not ( = ?auto_804019 ?auto_804023 ) ) ( not ( = ?auto_804019 ?auto_804024 ) ) ( not ( = ?auto_804019 ?auto_804025 ) ) ( not ( = ?auto_804020 ?auto_804021 ) ) ( not ( = ?auto_804020 ?auto_804022 ) ) ( not ( = ?auto_804020 ?auto_804023 ) ) ( not ( = ?auto_804020 ?auto_804024 ) ) ( not ( = ?auto_804020 ?auto_804025 ) ) ( not ( = ?auto_804021 ?auto_804022 ) ) ( not ( = ?auto_804021 ?auto_804023 ) ) ( not ( = ?auto_804021 ?auto_804024 ) ) ( not ( = ?auto_804021 ?auto_804025 ) ) ( not ( = ?auto_804022 ?auto_804023 ) ) ( not ( = ?auto_804022 ?auto_804024 ) ) ( not ( = ?auto_804022 ?auto_804025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_804023 ?auto_804024 ?auto_804025 )
      ( MAKE-8CRATE-VERIFY ?auto_804017 ?auto_804018 ?auto_804019 ?auto_804020 ?auto_804021 ?auto_804022 ?auto_804023 ?auto_804024 ?auto_804025 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_804109 - SURFACE
      ?auto_804110 - SURFACE
      ?auto_804111 - SURFACE
      ?auto_804112 - SURFACE
      ?auto_804113 - SURFACE
      ?auto_804114 - SURFACE
      ?auto_804115 - SURFACE
      ?auto_804116 - SURFACE
      ?auto_804117 - SURFACE
    )
    :vars
    (
      ?auto_804122 - HOIST
      ?auto_804120 - PLACE
      ?auto_804118 - TRUCK
      ?auto_804121 - PLACE
      ?auto_804119 - HOIST
      ?auto_804123 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_804122 ?auto_804120 ) ( SURFACE-AT ?auto_804116 ?auto_804120 ) ( CLEAR ?auto_804116 ) ( IS-CRATE ?auto_804117 ) ( not ( = ?auto_804116 ?auto_804117 ) ) ( AVAILABLE ?auto_804122 ) ( ON ?auto_804116 ?auto_804115 ) ( not ( = ?auto_804115 ?auto_804116 ) ) ( not ( = ?auto_804115 ?auto_804117 ) ) ( TRUCK-AT ?auto_804118 ?auto_804121 ) ( not ( = ?auto_804121 ?auto_804120 ) ) ( HOIST-AT ?auto_804119 ?auto_804121 ) ( not ( = ?auto_804122 ?auto_804119 ) ) ( AVAILABLE ?auto_804119 ) ( SURFACE-AT ?auto_804117 ?auto_804121 ) ( ON ?auto_804117 ?auto_804123 ) ( CLEAR ?auto_804117 ) ( not ( = ?auto_804116 ?auto_804123 ) ) ( not ( = ?auto_804117 ?auto_804123 ) ) ( not ( = ?auto_804115 ?auto_804123 ) ) ( ON ?auto_804110 ?auto_804109 ) ( ON ?auto_804111 ?auto_804110 ) ( ON ?auto_804112 ?auto_804111 ) ( ON ?auto_804113 ?auto_804112 ) ( ON ?auto_804114 ?auto_804113 ) ( ON ?auto_804115 ?auto_804114 ) ( not ( = ?auto_804109 ?auto_804110 ) ) ( not ( = ?auto_804109 ?auto_804111 ) ) ( not ( = ?auto_804109 ?auto_804112 ) ) ( not ( = ?auto_804109 ?auto_804113 ) ) ( not ( = ?auto_804109 ?auto_804114 ) ) ( not ( = ?auto_804109 ?auto_804115 ) ) ( not ( = ?auto_804109 ?auto_804116 ) ) ( not ( = ?auto_804109 ?auto_804117 ) ) ( not ( = ?auto_804109 ?auto_804123 ) ) ( not ( = ?auto_804110 ?auto_804111 ) ) ( not ( = ?auto_804110 ?auto_804112 ) ) ( not ( = ?auto_804110 ?auto_804113 ) ) ( not ( = ?auto_804110 ?auto_804114 ) ) ( not ( = ?auto_804110 ?auto_804115 ) ) ( not ( = ?auto_804110 ?auto_804116 ) ) ( not ( = ?auto_804110 ?auto_804117 ) ) ( not ( = ?auto_804110 ?auto_804123 ) ) ( not ( = ?auto_804111 ?auto_804112 ) ) ( not ( = ?auto_804111 ?auto_804113 ) ) ( not ( = ?auto_804111 ?auto_804114 ) ) ( not ( = ?auto_804111 ?auto_804115 ) ) ( not ( = ?auto_804111 ?auto_804116 ) ) ( not ( = ?auto_804111 ?auto_804117 ) ) ( not ( = ?auto_804111 ?auto_804123 ) ) ( not ( = ?auto_804112 ?auto_804113 ) ) ( not ( = ?auto_804112 ?auto_804114 ) ) ( not ( = ?auto_804112 ?auto_804115 ) ) ( not ( = ?auto_804112 ?auto_804116 ) ) ( not ( = ?auto_804112 ?auto_804117 ) ) ( not ( = ?auto_804112 ?auto_804123 ) ) ( not ( = ?auto_804113 ?auto_804114 ) ) ( not ( = ?auto_804113 ?auto_804115 ) ) ( not ( = ?auto_804113 ?auto_804116 ) ) ( not ( = ?auto_804113 ?auto_804117 ) ) ( not ( = ?auto_804113 ?auto_804123 ) ) ( not ( = ?auto_804114 ?auto_804115 ) ) ( not ( = ?auto_804114 ?auto_804116 ) ) ( not ( = ?auto_804114 ?auto_804117 ) ) ( not ( = ?auto_804114 ?auto_804123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_804115 ?auto_804116 ?auto_804117 )
      ( MAKE-8CRATE-VERIFY ?auto_804109 ?auto_804110 ?auto_804111 ?auto_804112 ?auto_804113 ?auto_804114 ?auto_804115 ?auto_804116 ?auto_804117 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_804202 - SURFACE
      ?auto_804203 - SURFACE
      ?auto_804204 - SURFACE
      ?auto_804205 - SURFACE
      ?auto_804206 - SURFACE
      ?auto_804207 - SURFACE
      ?auto_804208 - SURFACE
      ?auto_804209 - SURFACE
      ?auto_804210 - SURFACE
    )
    :vars
    (
      ?auto_804214 - HOIST
      ?auto_804213 - PLACE
      ?auto_804211 - PLACE
      ?auto_804216 - HOIST
      ?auto_804212 - SURFACE
      ?auto_804215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_804214 ?auto_804213 ) ( SURFACE-AT ?auto_804209 ?auto_804213 ) ( CLEAR ?auto_804209 ) ( IS-CRATE ?auto_804210 ) ( not ( = ?auto_804209 ?auto_804210 ) ) ( AVAILABLE ?auto_804214 ) ( ON ?auto_804209 ?auto_804208 ) ( not ( = ?auto_804208 ?auto_804209 ) ) ( not ( = ?auto_804208 ?auto_804210 ) ) ( not ( = ?auto_804211 ?auto_804213 ) ) ( HOIST-AT ?auto_804216 ?auto_804211 ) ( not ( = ?auto_804214 ?auto_804216 ) ) ( AVAILABLE ?auto_804216 ) ( SURFACE-AT ?auto_804210 ?auto_804211 ) ( ON ?auto_804210 ?auto_804212 ) ( CLEAR ?auto_804210 ) ( not ( = ?auto_804209 ?auto_804212 ) ) ( not ( = ?auto_804210 ?auto_804212 ) ) ( not ( = ?auto_804208 ?auto_804212 ) ) ( TRUCK-AT ?auto_804215 ?auto_804213 ) ( ON ?auto_804203 ?auto_804202 ) ( ON ?auto_804204 ?auto_804203 ) ( ON ?auto_804205 ?auto_804204 ) ( ON ?auto_804206 ?auto_804205 ) ( ON ?auto_804207 ?auto_804206 ) ( ON ?auto_804208 ?auto_804207 ) ( not ( = ?auto_804202 ?auto_804203 ) ) ( not ( = ?auto_804202 ?auto_804204 ) ) ( not ( = ?auto_804202 ?auto_804205 ) ) ( not ( = ?auto_804202 ?auto_804206 ) ) ( not ( = ?auto_804202 ?auto_804207 ) ) ( not ( = ?auto_804202 ?auto_804208 ) ) ( not ( = ?auto_804202 ?auto_804209 ) ) ( not ( = ?auto_804202 ?auto_804210 ) ) ( not ( = ?auto_804202 ?auto_804212 ) ) ( not ( = ?auto_804203 ?auto_804204 ) ) ( not ( = ?auto_804203 ?auto_804205 ) ) ( not ( = ?auto_804203 ?auto_804206 ) ) ( not ( = ?auto_804203 ?auto_804207 ) ) ( not ( = ?auto_804203 ?auto_804208 ) ) ( not ( = ?auto_804203 ?auto_804209 ) ) ( not ( = ?auto_804203 ?auto_804210 ) ) ( not ( = ?auto_804203 ?auto_804212 ) ) ( not ( = ?auto_804204 ?auto_804205 ) ) ( not ( = ?auto_804204 ?auto_804206 ) ) ( not ( = ?auto_804204 ?auto_804207 ) ) ( not ( = ?auto_804204 ?auto_804208 ) ) ( not ( = ?auto_804204 ?auto_804209 ) ) ( not ( = ?auto_804204 ?auto_804210 ) ) ( not ( = ?auto_804204 ?auto_804212 ) ) ( not ( = ?auto_804205 ?auto_804206 ) ) ( not ( = ?auto_804205 ?auto_804207 ) ) ( not ( = ?auto_804205 ?auto_804208 ) ) ( not ( = ?auto_804205 ?auto_804209 ) ) ( not ( = ?auto_804205 ?auto_804210 ) ) ( not ( = ?auto_804205 ?auto_804212 ) ) ( not ( = ?auto_804206 ?auto_804207 ) ) ( not ( = ?auto_804206 ?auto_804208 ) ) ( not ( = ?auto_804206 ?auto_804209 ) ) ( not ( = ?auto_804206 ?auto_804210 ) ) ( not ( = ?auto_804206 ?auto_804212 ) ) ( not ( = ?auto_804207 ?auto_804208 ) ) ( not ( = ?auto_804207 ?auto_804209 ) ) ( not ( = ?auto_804207 ?auto_804210 ) ) ( not ( = ?auto_804207 ?auto_804212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_804208 ?auto_804209 ?auto_804210 )
      ( MAKE-8CRATE-VERIFY ?auto_804202 ?auto_804203 ?auto_804204 ?auto_804205 ?auto_804206 ?auto_804207 ?auto_804208 ?auto_804209 ?auto_804210 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_804295 - SURFACE
      ?auto_804296 - SURFACE
      ?auto_804297 - SURFACE
      ?auto_804298 - SURFACE
      ?auto_804299 - SURFACE
      ?auto_804300 - SURFACE
      ?auto_804301 - SURFACE
      ?auto_804302 - SURFACE
      ?auto_804303 - SURFACE
    )
    :vars
    (
      ?auto_804304 - HOIST
      ?auto_804309 - PLACE
      ?auto_804308 - PLACE
      ?auto_804307 - HOIST
      ?auto_804306 - SURFACE
      ?auto_804305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_804304 ?auto_804309 ) ( IS-CRATE ?auto_804303 ) ( not ( = ?auto_804302 ?auto_804303 ) ) ( not ( = ?auto_804301 ?auto_804302 ) ) ( not ( = ?auto_804301 ?auto_804303 ) ) ( not ( = ?auto_804308 ?auto_804309 ) ) ( HOIST-AT ?auto_804307 ?auto_804308 ) ( not ( = ?auto_804304 ?auto_804307 ) ) ( AVAILABLE ?auto_804307 ) ( SURFACE-AT ?auto_804303 ?auto_804308 ) ( ON ?auto_804303 ?auto_804306 ) ( CLEAR ?auto_804303 ) ( not ( = ?auto_804302 ?auto_804306 ) ) ( not ( = ?auto_804303 ?auto_804306 ) ) ( not ( = ?auto_804301 ?auto_804306 ) ) ( TRUCK-AT ?auto_804305 ?auto_804309 ) ( SURFACE-AT ?auto_804301 ?auto_804309 ) ( CLEAR ?auto_804301 ) ( LIFTING ?auto_804304 ?auto_804302 ) ( IS-CRATE ?auto_804302 ) ( ON ?auto_804296 ?auto_804295 ) ( ON ?auto_804297 ?auto_804296 ) ( ON ?auto_804298 ?auto_804297 ) ( ON ?auto_804299 ?auto_804298 ) ( ON ?auto_804300 ?auto_804299 ) ( ON ?auto_804301 ?auto_804300 ) ( not ( = ?auto_804295 ?auto_804296 ) ) ( not ( = ?auto_804295 ?auto_804297 ) ) ( not ( = ?auto_804295 ?auto_804298 ) ) ( not ( = ?auto_804295 ?auto_804299 ) ) ( not ( = ?auto_804295 ?auto_804300 ) ) ( not ( = ?auto_804295 ?auto_804301 ) ) ( not ( = ?auto_804295 ?auto_804302 ) ) ( not ( = ?auto_804295 ?auto_804303 ) ) ( not ( = ?auto_804295 ?auto_804306 ) ) ( not ( = ?auto_804296 ?auto_804297 ) ) ( not ( = ?auto_804296 ?auto_804298 ) ) ( not ( = ?auto_804296 ?auto_804299 ) ) ( not ( = ?auto_804296 ?auto_804300 ) ) ( not ( = ?auto_804296 ?auto_804301 ) ) ( not ( = ?auto_804296 ?auto_804302 ) ) ( not ( = ?auto_804296 ?auto_804303 ) ) ( not ( = ?auto_804296 ?auto_804306 ) ) ( not ( = ?auto_804297 ?auto_804298 ) ) ( not ( = ?auto_804297 ?auto_804299 ) ) ( not ( = ?auto_804297 ?auto_804300 ) ) ( not ( = ?auto_804297 ?auto_804301 ) ) ( not ( = ?auto_804297 ?auto_804302 ) ) ( not ( = ?auto_804297 ?auto_804303 ) ) ( not ( = ?auto_804297 ?auto_804306 ) ) ( not ( = ?auto_804298 ?auto_804299 ) ) ( not ( = ?auto_804298 ?auto_804300 ) ) ( not ( = ?auto_804298 ?auto_804301 ) ) ( not ( = ?auto_804298 ?auto_804302 ) ) ( not ( = ?auto_804298 ?auto_804303 ) ) ( not ( = ?auto_804298 ?auto_804306 ) ) ( not ( = ?auto_804299 ?auto_804300 ) ) ( not ( = ?auto_804299 ?auto_804301 ) ) ( not ( = ?auto_804299 ?auto_804302 ) ) ( not ( = ?auto_804299 ?auto_804303 ) ) ( not ( = ?auto_804299 ?auto_804306 ) ) ( not ( = ?auto_804300 ?auto_804301 ) ) ( not ( = ?auto_804300 ?auto_804302 ) ) ( not ( = ?auto_804300 ?auto_804303 ) ) ( not ( = ?auto_804300 ?auto_804306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_804301 ?auto_804302 ?auto_804303 )
      ( MAKE-8CRATE-VERIFY ?auto_804295 ?auto_804296 ?auto_804297 ?auto_804298 ?auto_804299 ?auto_804300 ?auto_804301 ?auto_804302 ?auto_804303 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_804388 - SURFACE
      ?auto_804389 - SURFACE
      ?auto_804390 - SURFACE
      ?auto_804391 - SURFACE
      ?auto_804392 - SURFACE
      ?auto_804393 - SURFACE
      ?auto_804394 - SURFACE
      ?auto_804395 - SURFACE
      ?auto_804396 - SURFACE
    )
    :vars
    (
      ?auto_804397 - HOIST
      ?auto_804398 - PLACE
      ?auto_804400 - PLACE
      ?auto_804401 - HOIST
      ?auto_804399 - SURFACE
      ?auto_804402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_804397 ?auto_804398 ) ( IS-CRATE ?auto_804396 ) ( not ( = ?auto_804395 ?auto_804396 ) ) ( not ( = ?auto_804394 ?auto_804395 ) ) ( not ( = ?auto_804394 ?auto_804396 ) ) ( not ( = ?auto_804400 ?auto_804398 ) ) ( HOIST-AT ?auto_804401 ?auto_804400 ) ( not ( = ?auto_804397 ?auto_804401 ) ) ( AVAILABLE ?auto_804401 ) ( SURFACE-AT ?auto_804396 ?auto_804400 ) ( ON ?auto_804396 ?auto_804399 ) ( CLEAR ?auto_804396 ) ( not ( = ?auto_804395 ?auto_804399 ) ) ( not ( = ?auto_804396 ?auto_804399 ) ) ( not ( = ?auto_804394 ?auto_804399 ) ) ( TRUCK-AT ?auto_804402 ?auto_804398 ) ( SURFACE-AT ?auto_804394 ?auto_804398 ) ( CLEAR ?auto_804394 ) ( IS-CRATE ?auto_804395 ) ( AVAILABLE ?auto_804397 ) ( IN ?auto_804395 ?auto_804402 ) ( ON ?auto_804389 ?auto_804388 ) ( ON ?auto_804390 ?auto_804389 ) ( ON ?auto_804391 ?auto_804390 ) ( ON ?auto_804392 ?auto_804391 ) ( ON ?auto_804393 ?auto_804392 ) ( ON ?auto_804394 ?auto_804393 ) ( not ( = ?auto_804388 ?auto_804389 ) ) ( not ( = ?auto_804388 ?auto_804390 ) ) ( not ( = ?auto_804388 ?auto_804391 ) ) ( not ( = ?auto_804388 ?auto_804392 ) ) ( not ( = ?auto_804388 ?auto_804393 ) ) ( not ( = ?auto_804388 ?auto_804394 ) ) ( not ( = ?auto_804388 ?auto_804395 ) ) ( not ( = ?auto_804388 ?auto_804396 ) ) ( not ( = ?auto_804388 ?auto_804399 ) ) ( not ( = ?auto_804389 ?auto_804390 ) ) ( not ( = ?auto_804389 ?auto_804391 ) ) ( not ( = ?auto_804389 ?auto_804392 ) ) ( not ( = ?auto_804389 ?auto_804393 ) ) ( not ( = ?auto_804389 ?auto_804394 ) ) ( not ( = ?auto_804389 ?auto_804395 ) ) ( not ( = ?auto_804389 ?auto_804396 ) ) ( not ( = ?auto_804389 ?auto_804399 ) ) ( not ( = ?auto_804390 ?auto_804391 ) ) ( not ( = ?auto_804390 ?auto_804392 ) ) ( not ( = ?auto_804390 ?auto_804393 ) ) ( not ( = ?auto_804390 ?auto_804394 ) ) ( not ( = ?auto_804390 ?auto_804395 ) ) ( not ( = ?auto_804390 ?auto_804396 ) ) ( not ( = ?auto_804390 ?auto_804399 ) ) ( not ( = ?auto_804391 ?auto_804392 ) ) ( not ( = ?auto_804391 ?auto_804393 ) ) ( not ( = ?auto_804391 ?auto_804394 ) ) ( not ( = ?auto_804391 ?auto_804395 ) ) ( not ( = ?auto_804391 ?auto_804396 ) ) ( not ( = ?auto_804391 ?auto_804399 ) ) ( not ( = ?auto_804392 ?auto_804393 ) ) ( not ( = ?auto_804392 ?auto_804394 ) ) ( not ( = ?auto_804392 ?auto_804395 ) ) ( not ( = ?auto_804392 ?auto_804396 ) ) ( not ( = ?auto_804392 ?auto_804399 ) ) ( not ( = ?auto_804393 ?auto_804394 ) ) ( not ( = ?auto_804393 ?auto_804395 ) ) ( not ( = ?auto_804393 ?auto_804396 ) ) ( not ( = ?auto_804393 ?auto_804399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_804394 ?auto_804395 ?auto_804396 )
      ( MAKE-8CRATE-VERIFY ?auto_804388 ?auto_804389 ?auto_804390 ?auto_804391 ?auto_804392 ?auto_804393 ?auto_804394 ?auto_804395 ?auto_804396 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808469 - SURFACE
      ?auto_808470 - SURFACE
      ?auto_808471 - SURFACE
      ?auto_808472 - SURFACE
      ?auto_808473 - SURFACE
      ?auto_808474 - SURFACE
      ?auto_808475 - SURFACE
      ?auto_808476 - SURFACE
      ?auto_808477 - SURFACE
      ?auto_808478 - SURFACE
    )
    :vars
    (
      ?auto_808479 - HOIST
      ?auto_808480 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_808479 ?auto_808480 ) ( SURFACE-AT ?auto_808477 ?auto_808480 ) ( CLEAR ?auto_808477 ) ( LIFTING ?auto_808479 ?auto_808478 ) ( IS-CRATE ?auto_808478 ) ( not ( = ?auto_808477 ?auto_808478 ) ) ( ON ?auto_808470 ?auto_808469 ) ( ON ?auto_808471 ?auto_808470 ) ( ON ?auto_808472 ?auto_808471 ) ( ON ?auto_808473 ?auto_808472 ) ( ON ?auto_808474 ?auto_808473 ) ( ON ?auto_808475 ?auto_808474 ) ( ON ?auto_808476 ?auto_808475 ) ( ON ?auto_808477 ?auto_808476 ) ( not ( = ?auto_808469 ?auto_808470 ) ) ( not ( = ?auto_808469 ?auto_808471 ) ) ( not ( = ?auto_808469 ?auto_808472 ) ) ( not ( = ?auto_808469 ?auto_808473 ) ) ( not ( = ?auto_808469 ?auto_808474 ) ) ( not ( = ?auto_808469 ?auto_808475 ) ) ( not ( = ?auto_808469 ?auto_808476 ) ) ( not ( = ?auto_808469 ?auto_808477 ) ) ( not ( = ?auto_808469 ?auto_808478 ) ) ( not ( = ?auto_808470 ?auto_808471 ) ) ( not ( = ?auto_808470 ?auto_808472 ) ) ( not ( = ?auto_808470 ?auto_808473 ) ) ( not ( = ?auto_808470 ?auto_808474 ) ) ( not ( = ?auto_808470 ?auto_808475 ) ) ( not ( = ?auto_808470 ?auto_808476 ) ) ( not ( = ?auto_808470 ?auto_808477 ) ) ( not ( = ?auto_808470 ?auto_808478 ) ) ( not ( = ?auto_808471 ?auto_808472 ) ) ( not ( = ?auto_808471 ?auto_808473 ) ) ( not ( = ?auto_808471 ?auto_808474 ) ) ( not ( = ?auto_808471 ?auto_808475 ) ) ( not ( = ?auto_808471 ?auto_808476 ) ) ( not ( = ?auto_808471 ?auto_808477 ) ) ( not ( = ?auto_808471 ?auto_808478 ) ) ( not ( = ?auto_808472 ?auto_808473 ) ) ( not ( = ?auto_808472 ?auto_808474 ) ) ( not ( = ?auto_808472 ?auto_808475 ) ) ( not ( = ?auto_808472 ?auto_808476 ) ) ( not ( = ?auto_808472 ?auto_808477 ) ) ( not ( = ?auto_808472 ?auto_808478 ) ) ( not ( = ?auto_808473 ?auto_808474 ) ) ( not ( = ?auto_808473 ?auto_808475 ) ) ( not ( = ?auto_808473 ?auto_808476 ) ) ( not ( = ?auto_808473 ?auto_808477 ) ) ( not ( = ?auto_808473 ?auto_808478 ) ) ( not ( = ?auto_808474 ?auto_808475 ) ) ( not ( = ?auto_808474 ?auto_808476 ) ) ( not ( = ?auto_808474 ?auto_808477 ) ) ( not ( = ?auto_808474 ?auto_808478 ) ) ( not ( = ?auto_808475 ?auto_808476 ) ) ( not ( = ?auto_808475 ?auto_808477 ) ) ( not ( = ?auto_808475 ?auto_808478 ) ) ( not ( = ?auto_808476 ?auto_808477 ) ) ( not ( = ?auto_808476 ?auto_808478 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_808477 ?auto_808478 )
      ( MAKE-9CRATE-VERIFY ?auto_808469 ?auto_808470 ?auto_808471 ?auto_808472 ?auto_808473 ?auto_808474 ?auto_808475 ?auto_808476 ?auto_808477 ?auto_808478 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808549 - SURFACE
      ?auto_808550 - SURFACE
      ?auto_808551 - SURFACE
      ?auto_808552 - SURFACE
      ?auto_808553 - SURFACE
      ?auto_808554 - SURFACE
      ?auto_808555 - SURFACE
      ?auto_808556 - SURFACE
      ?auto_808557 - SURFACE
      ?auto_808558 - SURFACE
    )
    :vars
    (
      ?auto_808561 - HOIST
      ?auto_808559 - PLACE
      ?auto_808560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_808561 ?auto_808559 ) ( SURFACE-AT ?auto_808557 ?auto_808559 ) ( CLEAR ?auto_808557 ) ( IS-CRATE ?auto_808558 ) ( not ( = ?auto_808557 ?auto_808558 ) ) ( TRUCK-AT ?auto_808560 ?auto_808559 ) ( AVAILABLE ?auto_808561 ) ( IN ?auto_808558 ?auto_808560 ) ( ON ?auto_808557 ?auto_808556 ) ( not ( = ?auto_808556 ?auto_808557 ) ) ( not ( = ?auto_808556 ?auto_808558 ) ) ( ON ?auto_808550 ?auto_808549 ) ( ON ?auto_808551 ?auto_808550 ) ( ON ?auto_808552 ?auto_808551 ) ( ON ?auto_808553 ?auto_808552 ) ( ON ?auto_808554 ?auto_808553 ) ( ON ?auto_808555 ?auto_808554 ) ( ON ?auto_808556 ?auto_808555 ) ( not ( = ?auto_808549 ?auto_808550 ) ) ( not ( = ?auto_808549 ?auto_808551 ) ) ( not ( = ?auto_808549 ?auto_808552 ) ) ( not ( = ?auto_808549 ?auto_808553 ) ) ( not ( = ?auto_808549 ?auto_808554 ) ) ( not ( = ?auto_808549 ?auto_808555 ) ) ( not ( = ?auto_808549 ?auto_808556 ) ) ( not ( = ?auto_808549 ?auto_808557 ) ) ( not ( = ?auto_808549 ?auto_808558 ) ) ( not ( = ?auto_808550 ?auto_808551 ) ) ( not ( = ?auto_808550 ?auto_808552 ) ) ( not ( = ?auto_808550 ?auto_808553 ) ) ( not ( = ?auto_808550 ?auto_808554 ) ) ( not ( = ?auto_808550 ?auto_808555 ) ) ( not ( = ?auto_808550 ?auto_808556 ) ) ( not ( = ?auto_808550 ?auto_808557 ) ) ( not ( = ?auto_808550 ?auto_808558 ) ) ( not ( = ?auto_808551 ?auto_808552 ) ) ( not ( = ?auto_808551 ?auto_808553 ) ) ( not ( = ?auto_808551 ?auto_808554 ) ) ( not ( = ?auto_808551 ?auto_808555 ) ) ( not ( = ?auto_808551 ?auto_808556 ) ) ( not ( = ?auto_808551 ?auto_808557 ) ) ( not ( = ?auto_808551 ?auto_808558 ) ) ( not ( = ?auto_808552 ?auto_808553 ) ) ( not ( = ?auto_808552 ?auto_808554 ) ) ( not ( = ?auto_808552 ?auto_808555 ) ) ( not ( = ?auto_808552 ?auto_808556 ) ) ( not ( = ?auto_808552 ?auto_808557 ) ) ( not ( = ?auto_808552 ?auto_808558 ) ) ( not ( = ?auto_808553 ?auto_808554 ) ) ( not ( = ?auto_808553 ?auto_808555 ) ) ( not ( = ?auto_808553 ?auto_808556 ) ) ( not ( = ?auto_808553 ?auto_808557 ) ) ( not ( = ?auto_808553 ?auto_808558 ) ) ( not ( = ?auto_808554 ?auto_808555 ) ) ( not ( = ?auto_808554 ?auto_808556 ) ) ( not ( = ?auto_808554 ?auto_808557 ) ) ( not ( = ?auto_808554 ?auto_808558 ) ) ( not ( = ?auto_808555 ?auto_808556 ) ) ( not ( = ?auto_808555 ?auto_808557 ) ) ( not ( = ?auto_808555 ?auto_808558 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_808556 ?auto_808557 ?auto_808558 )
      ( MAKE-9CRATE-VERIFY ?auto_808549 ?auto_808550 ?auto_808551 ?auto_808552 ?auto_808553 ?auto_808554 ?auto_808555 ?auto_808556 ?auto_808557 ?auto_808558 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808639 - SURFACE
      ?auto_808640 - SURFACE
      ?auto_808641 - SURFACE
      ?auto_808642 - SURFACE
      ?auto_808643 - SURFACE
      ?auto_808644 - SURFACE
      ?auto_808645 - SURFACE
      ?auto_808646 - SURFACE
      ?auto_808647 - SURFACE
      ?auto_808648 - SURFACE
    )
    :vars
    (
      ?auto_808649 - HOIST
      ?auto_808651 - PLACE
      ?auto_808652 - TRUCK
      ?auto_808650 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_808649 ?auto_808651 ) ( SURFACE-AT ?auto_808647 ?auto_808651 ) ( CLEAR ?auto_808647 ) ( IS-CRATE ?auto_808648 ) ( not ( = ?auto_808647 ?auto_808648 ) ) ( AVAILABLE ?auto_808649 ) ( IN ?auto_808648 ?auto_808652 ) ( ON ?auto_808647 ?auto_808646 ) ( not ( = ?auto_808646 ?auto_808647 ) ) ( not ( = ?auto_808646 ?auto_808648 ) ) ( TRUCK-AT ?auto_808652 ?auto_808650 ) ( not ( = ?auto_808650 ?auto_808651 ) ) ( ON ?auto_808640 ?auto_808639 ) ( ON ?auto_808641 ?auto_808640 ) ( ON ?auto_808642 ?auto_808641 ) ( ON ?auto_808643 ?auto_808642 ) ( ON ?auto_808644 ?auto_808643 ) ( ON ?auto_808645 ?auto_808644 ) ( ON ?auto_808646 ?auto_808645 ) ( not ( = ?auto_808639 ?auto_808640 ) ) ( not ( = ?auto_808639 ?auto_808641 ) ) ( not ( = ?auto_808639 ?auto_808642 ) ) ( not ( = ?auto_808639 ?auto_808643 ) ) ( not ( = ?auto_808639 ?auto_808644 ) ) ( not ( = ?auto_808639 ?auto_808645 ) ) ( not ( = ?auto_808639 ?auto_808646 ) ) ( not ( = ?auto_808639 ?auto_808647 ) ) ( not ( = ?auto_808639 ?auto_808648 ) ) ( not ( = ?auto_808640 ?auto_808641 ) ) ( not ( = ?auto_808640 ?auto_808642 ) ) ( not ( = ?auto_808640 ?auto_808643 ) ) ( not ( = ?auto_808640 ?auto_808644 ) ) ( not ( = ?auto_808640 ?auto_808645 ) ) ( not ( = ?auto_808640 ?auto_808646 ) ) ( not ( = ?auto_808640 ?auto_808647 ) ) ( not ( = ?auto_808640 ?auto_808648 ) ) ( not ( = ?auto_808641 ?auto_808642 ) ) ( not ( = ?auto_808641 ?auto_808643 ) ) ( not ( = ?auto_808641 ?auto_808644 ) ) ( not ( = ?auto_808641 ?auto_808645 ) ) ( not ( = ?auto_808641 ?auto_808646 ) ) ( not ( = ?auto_808641 ?auto_808647 ) ) ( not ( = ?auto_808641 ?auto_808648 ) ) ( not ( = ?auto_808642 ?auto_808643 ) ) ( not ( = ?auto_808642 ?auto_808644 ) ) ( not ( = ?auto_808642 ?auto_808645 ) ) ( not ( = ?auto_808642 ?auto_808646 ) ) ( not ( = ?auto_808642 ?auto_808647 ) ) ( not ( = ?auto_808642 ?auto_808648 ) ) ( not ( = ?auto_808643 ?auto_808644 ) ) ( not ( = ?auto_808643 ?auto_808645 ) ) ( not ( = ?auto_808643 ?auto_808646 ) ) ( not ( = ?auto_808643 ?auto_808647 ) ) ( not ( = ?auto_808643 ?auto_808648 ) ) ( not ( = ?auto_808644 ?auto_808645 ) ) ( not ( = ?auto_808644 ?auto_808646 ) ) ( not ( = ?auto_808644 ?auto_808647 ) ) ( not ( = ?auto_808644 ?auto_808648 ) ) ( not ( = ?auto_808645 ?auto_808646 ) ) ( not ( = ?auto_808645 ?auto_808647 ) ) ( not ( = ?auto_808645 ?auto_808648 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_808646 ?auto_808647 ?auto_808648 )
      ( MAKE-9CRATE-VERIFY ?auto_808639 ?auto_808640 ?auto_808641 ?auto_808642 ?auto_808643 ?auto_808644 ?auto_808645 ?auto_808646 ?auto_808647 ?auto_808648 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808738 - SURFACE
      ?auto_808739 - SURFACE
      ?auto_808740 - SURFACE
      ?auto_808741 - SURFACE
      ?auto_808742 - SURFACE
      ?auto_808743 - SURFACE
      ?auto_808744 - SURFACE
      ?auto_808745 - SURFACE
      ?auto_808746 - SURFACE
      ?auto_808747 - SURFACE
    )
    :vars
    (
      ?auto_808752 - HOIST
      ?auto_808751 - PLACE
      ?auto_808749 - TRUCK
      ?auto_808748 - PLACE
      ?auto_808750 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_808752 ?auto_808751 ) ( SURFACE-AT ?auto_808746 ?auto_808751 ) ( CLEAR ?auto_808746 ) ( IS-CRATE ?auto_808747 ) ( not ( = ?auto_808746 ?auto_808747 ) ) ( AVAILABLE ?auto_808752 ) ( ON ?auto_808746 ?auto_808745 ) ( not ( = ?auto_808745 ?auto_808746 ) ) ( not ( = ?auto_808745 ?auto_808747 ) ) ( TRUCK-AT ?auto_808749 ?auto_808748 ) ( not ( = ?auto_808748 ?auto_808751 ) ) ( HOIST-AT ?auto_808750 ?auto_808748 ) ( LIFTING ?auto_808750 ?auto_808747 ) ( not ( = ?auto_808752 ?auto_808750 ) ) ( ON ?auto_808739 ?auto_808738 ) ( ON ?auto_808740 ?auto_808739 ) ( ON ?auto_808741 ?auto_808740 ) ( ON ?auto_808742 ?auto_808741 ) ( ON ?auto_808743 ?auto_808742 ) ( ON ?auto_808744 ?auto_808743 ) ( ON ?auto_808745 ?auto_808744 ) ( not ( = ?auto_808738 ?auto_808739 ) ) ( not ( = ?auto_808738 ?auto_808740 ) ) ( not ( = ?auto_808738 ?auto_808741 ) ) ( not ( = ?auto_808738 ?auto_808742 ) ) ( not ( = ?auto_808738 ?auto_808743 ) ) ( not ( = ?auto_808738 ?auto_808744 ) ) ( not ( = ?auto_808738 ?auto_808745 ) ) ( not ( = ?auto_808738 ?auto_808746 ) ) ( not ( = ?auto_808738 ?auto_808747 ) ) ( not ( = ?auto_808739 ?auto_808740 ) ) ( not ( = ?auto_808739 ?auto_808741 ) ) ( not ( = ?auto_808739 ?auto_808742 ) ) ( not ( = ?auto_808739 ?auto_808743 ) ) ( not ( = ?auto_808739 ?auto_808744 ) ) ( not ( = ?auto_808739 ?auto_808745 ) ) ( not ( = ?auto_808739 ?auto_808746 ) ) ( not ( = ?auto_808739 ?auto_808747 ) ) ( not ( = ?auto_808740 ?auto_808741 ) ) ( not ( = ?auto_808740 ?auto_808742 ) ) ( not ( = ?auto_808740 ?auto_808743 ) ) ( not ( = ?auto_808740 ?auto_808744 ) ) ( not ( = ?auto_808740 ?auto_808745 ) ) ( not ( = ?auto_808740 ?auto_808746 ) ) ( not ( = ?auto_808740 ?auto_808747 ) ) ( not ( = ?auto_808741 ?auto_808742 ) ) ( not ( = ?auto_808741 ?auto_808743 ) ) ( not ( = ?auto_808741 ?auto_808744 ) ) ( not ( = ?auto_808741 ?auto_808745 ) ) ( not ( = ?auto_808741 ?auto_808746 ) ) ( not ( = ?auto_808741 ?auto_808747 ) ) ( not ( = ?auto_808742 ?auto_808743 ) ) ( not ( = ?auto_808742 ?auto_808744 ) ) ( not ( = ?auto_808742 ?auto_808745 ) ) ( not ( = ?auto_808742 ?auto_808746 ) ) ( not ( = ?auto_808742 ?auto_808747 ) ) ( not ( = ?auto_808743 ?auto_808744 ) ) ( not ( = ?auto_808743 ?auto_808745 ) ) ( not ( = ?auto_808743 ?auto_808746 ) ) ( not ( = ?auto_808743 ?auto_808747 ) ) ( not ( = ?auto_808744 ?auto_808745 ) ) ( not ( = ?auto_808744 ?auto_808746 ) ) ( not ( = ?auto_808744 ?auto_808747 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_808745 ?auto_808746 ?auto_808747 )
      ( MAKE-9CRATE-VERIFY ?auto_808738 ?auto_808739 ?auto_808740 ?auto_808741 ?auto_808742 ?auto_808743 ?auto_808744 ?auto_808745 ?auto_808746 ?auto_808747 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808846 - SURFACE
      ?auto_808847 - SURFACE
      ?auto_808848 - SURFACE
      ?auto_808849 - SURFACE
      ?auto_808850 - SURFACE
      ?auto_808851 - SURFACE
      ?auto_808852 - SURFACE
      ?auto_808853 - SURFACE
      ?auto_808854 - SURFACE
      ?auto_808855 - SURFACE
    )
    :vars
    (
      ?auto_808858 - HOIST
      ?auto_808856 - PLACE
      ?auto_808857 - TRUCK
      ?auto_808859 - PLACE
      ?auto_808861 - HOIST
      ?auto_808860 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_808858 ?auto_808856 ) ( SURFACE-AT ?auto_808854 ?auto_808856 ) ( CLEAR ?auto_808854 ) ( IS-CRATE ?auto_808855 ) ( not ( = ?auto_808854 ?auto_808855 ) ) ( AVAILABLE ?auto_808858 ) ( ON ?auto_808854 ?auto_808853 ) ( not ( = ?auto_808853 ?auto_808854 ) ) ( not ( = ?auto_808853 ?auto_808855 ) ) ( TRUCK-AT ?auto_808857 ?auto_808859 ) ( not ( = ?auto_808859 ?auto_808856 ) ) ( HOIST-AT ?auto_808861 ?auto_808859 ) ( not ( = ?auto_808858 ?auto_808861 ) ) ( AVAILABLE ?auto_808861 ) ( SURFACE-AT ?auto_808855 ?auto_808859 ) ( ON ?auto_808855 ?auto_808860 ) ( CLEAR ?auto_808855 ) ( not ( = ?auto_808854 ?auto_808860 ) ) ( not ( = ?auto_808855 ?auto_808860 ) ) ( not ( = ?auto_808853 ?auto_808860 ) ) ( ON ?auto_808847 ?auto_808846 ) ( ON ?auto_808848 ?auto_808847 ) ( ON ?auto_808849 ?auto_808848 ) ( ON ?auto_808850 ?auto_808849 ) ( ON ?auto_808851 ?auto_808850 ) ( ON ?auto_808852 ?auto_808851 ) ( ON ?auto_808853 ?auto_808852 ) ( not ( = ?auto_808846 ?auto_808847 ) ) ( not ( = ?auto_808846 ?auto_808848 ) ) ( not ( = ?auto_808846 ?auto_808849 ) ) ( not ( = ?auto_808846 ?auto_808850 ) ) ( not ( = ?auto_808846 ?auto_808851 ) ) ( not ( = ?auto_808846 ?auto_808852 ) ) ( not ( = ?auto_808846 ?auto_808853 ) ) ( not ( = ?auto_808846 ?auto_808854 ) ) ( not ( = ?auto_808846 ?auto_808855 ) ) ( not ( = ?auto_808846 ?auto_808860 ) ) ( not ( = ?auto_808847 ?auto_808848 ) ) ( not ( = ?auto_808847 ?auto_808849 ) ) ( not ( = ?auto_808847 ?auto_808850 ) ) ( not ( = ?auto_808847 ?auto_808851 ) ) ( not ( = ?auto_808847 ?auto_808852 ) ) ( not ( = ?auto_808847 ?auto_808853 ) ) ( not ( = ?auto_808847 ?auto_808854 ) ) ( not ( = ?auto_808847 ?auto_808855 ) ) ( not ( = ?auto_808847 ?auto_808860 ) ) ( not ( = ?auto_808848 ?auto_808849 ) ) ( not ( = ?auto_808848 ?auto_808850 ) ) ( not ( = ?auto_808848 ?auto_808851 ) ) ( not ( = ?auto_808848 ?auto_808852 ) ) ( not ( = ?auto_808848 ?auto_808853 ) ) ( not ( = ?auto_808848 ?auto_808854 ) ) ( not ( = ?auto_808848 ?auto_808855 ) ) ( not ( = ?auto_808848 ?auto_808860 ) ) ( not ( = ?auto_808849 ?auto_808850 ) ) ( not ( = ?auto_808849 ?auto_808851 ) ) ( not ( = ?auto_808849 ?auto_808852 ) ) ( not ( = ?auto_808849 ?auto_808853 ) ) ( not ( = ?auto_808849 ?auto_808854 ) ) ( not ( = ?auto_808849 ?auto_808855 ) ) ( not ( = ?auto_808849 ?auto_808860 ) ) ( not ( = ?auto_808850 ?auto_808851 ) ) ( not ( = ?auto_808850 ?auto_808852 ) ) ( not ( = ?auto_808850 ?auto_808853 ) ) ( not ( = ?auto_808850 ?auto_808854 ) ) ( not ( = ?auto_808850 ?auto_808855 ) ) ( not ( = ?auto_808850 ?auto_808860 ) ) ( not ( = ?auto_808851 ?auto_808852 ) ) ( not ( = ?auto_808851 ?auto_808853 ) ) ( not ( = ?auto_808851 ?auto_808854 ) ) ( not ( = ?auto_808851 ?auto_808855 ) ) ( not ( = ?auto_808851 ?auto_808860 ) ) ( not ( = ?auto_808852 ?auto_808853 ) ) ( not ( = ?auto_808852 ?auto_808854 ) ) ( not ( = ?auto_808852 ?auto_808855 ) ) ( not ( = ?auto_808852 ?auto_808860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_808853 ?auto_808854 ?auto_808855 )
      ( MAKE-9CRATE-VERIFY ?auto_808846 ?auto_808847 ?auto_808848 ?auto_808849 ?auto_808850 ?auto_808851 ?auto_808852 ?auto_808853 ?auto_808854 ?auto_808855 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808955 - SURFACE
      ?auto_808956 - SURFACE
      ?auto_808957 - SURFACE
      ?auto_808958 - SURFACE
      ?auto_808959 - SURFACE
      ?auto_808960 - SURFACE
      ?auto_808961 - SURFACE
      ?auto_808962 - SURFACE
      ?auto_808963 - SURFACE
      ?auto_808964 - SURFACE
    )
    :vars
    (
      ?auto_808966 - HOIST
      ?auto_808965 - PLACE
      ?auto_808969 - PLACE
      ?auto_808968 - HOIST
      ?auto_808970 - SURFACE
      ?auto_808967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_808966 ?auto_808965 ) ( SURFACE-AT ?auto_808963 ?auto_808965 ) ( CLEAR ?auto_808963 ) ( IS-CRATE ?auto_808964 ) ( not ( = ?auto_808963 ?auto_808964 ) ) ( AVAILABLE ?auto_808966 ) ( ON ?auto_808963 ?auto_808962 ) ( not ( = ?auto_808962 ?auto_808963 ) ) ( not ( = ?auto_808962 ?auto_808964 ) ) ( not ( = ?auto_808969 ?auto_808965 ) ) ( HOIST-AT ?auto_808968 ?auto_808969 ) ( not ( = ?auto_808966 ?auto_808968 ) ) ( AVAILABLE ?auto_808968 ) ( SURFACE-AT ?auto_808964 ?auto_808969 ) ( ON ?auto_808964 ?auto_808970 ) ( CLEAR ?auto_808964 ) ( not ( = ?auto_808963 ?auto_808970 ) ) ( not ( = ?auto_808964 ?auto_808970 ) ) ( not ( = ?auto_808962 ?auto_808970 ) ) ( TRUCK-AT ?auto_808967 ?auto_808965 ) ( ON ?auto_808956 ?auto_808955 ) ( ON ?auto_808957 ?auto_808956 ) ( ON ?auto_808958 ?auto_808957 ) ( ON ?auto_808959 ?auto_808958 ) ( ON ?auto_808960 ?auto_808959 ) ( ON ?auto_808961 ?auto_808960 ) ( ON ?auto_808962 ?auto_808961 ) ( not ( = ?auto_808955 ?auto_808956 ) ) ( not ( = ?auto_808955 ?auto_808957 ) ) ( not ( = ?auto_808955 ?auto_808958 ) ) ( not ( = ?auto_808955 ?auto_808959 ) ) ( not ( = ?auto_808955 ?auto_808960 ) ) ( not ( = ?auto_808955 ?auto_808961 ) ) ( not ( = ?auto_808955 ?auto_808962 ) ) ( not ( = ?auto_808955 ?auto_808963 ) ) ( not ( = ?auto_808955 ?auto_808964 ) ) ( not ( = ?auto_808955 ?auto_808970 ) ) ( not ( = ?auto_808956 ?auto_808957 ) ) ( not ( = ?auto_808956 ?auto_808958 ) ) ( not ( = ?auto_808956 ?auto_808959 ) ) ( not ( = ?auto_808956 ?auto_808960 ) ) ( not ( = ?auto_808956 ?auto_808961 ) ) ( not ( = ?auto_808956 ?auto_808962 ) ) ( not ( = ?auto_808956 ?auto_808963 ) ) ( not ( = ?auto_808956 ?auto_808964 ) ) ( not ( = ?auto_808956 ?auto_808970 ) ) ( not ( = ?auto_808957 ?auto_808958 ) ) ( not ( = ?auto_808957 ?auto_808959 ) ) ( not ( = ?auto_808957 ?auto_808960 ) ) ( not ( = ?auto_808957 ?auto_808961 ) ) ( not ( = ?auto_808957 ?auto_808962 ) ) ( not ( = ?auto_808957 ?auto_808963 ) ) ( not ( = ?auto_808957 ?auto_808964 ) ) ( not ( = ?auto_808957 ?auto_808970 ) ) ( not ( = ?auto_808958 ?auto_808959 ) ) ( not ( = ?auto_808958 ?auto_808960 ) ) ( not ( = ?auto_808958 ?auto_808961 ) ) ( not ( = ?auto_808958 ?auto_808962 ) ) ( not ( = ?auto_808958 ?auto_808963 ) ) ( not ( = ?auto_808958 ?auto_808964 ) ) ( not ( = ?auto_808958 ?auto_808970 ) ) ( not ( = ?auto_808959 ?auto_808960 ) ) ( not ( = ?auto_808959 ?auto_808961 ) ) ( not ( = ?auto_808959 ?auto_808962 ) ) ( not ( = ?auto_808959 ?auto_808963 ) ) ( not ( = ?auto_808959 ?auto_808964 ) ) ( not ( = ?auto_808959 ?auto_808970 ) ) ( not ( = ?auto_808960 ?auto_808961 ) ) ( not ( = ?auto_808960 ?auto_808962 ) ) ( not ( = ?auto_808960 ?auto_808963 ) ) ( not ( = ?auto_808960 ?auto_808964 ) ) ( not ( = ?auto_808960 ?auto_808970 ) ) ( not ( = ?auto_808961 ?auto_808962 ) ) ( not ( = ?auto_808961 ?auto_808963 ) ) ( not ( = ?auto_808961 ?auto_808964 ) ) ( not ( = ?auto_808961 ?auto_808970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_808962 ?auto_808963 ?auto_808964 )
      ( MAKE-9CRATE-VERIFY ?auto_808955 ?auto_808956 ?auto_808957 ?auto_808958 ?auto_808959 ?auto_808960 ?auto_808961 ?auto_808962 ?auto_808963 ?auto_808964 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_809064 - SURFACE
      ?auto_809065 - SURFACE
      ?auto_809066 - SURFACE
      ?auto_809067 - SURFACE
      ?auto_809068 - SURFACE
      ?auto_809069 - SURFACE
      ?auto_809070 - SURFACE
      ?auto_809071 - SURFACE
      ?auto_809072 - SURFACE
      ?auto_809073 - SURFACE
    )
    :vars
    (
      ?auto_809078 - HOIST
      ?auto_809079 - PLACE
      ?auto_809077 - PLACE
      ?auto_809075 - HOIST
      ?auto_809074 - SURFACE
      ?auto_809076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_809078 ?auto_809079 ) ( IS-CRATE ?auto_809073 ) ( not ( = ?auto_809072 ?auto_809073 ) ) ( not ( = ?auto_809071 ?auto_809072 ) ) ( not ( = ?auto_809071 ?auto_809073 ) ) ( not ( = ?auto_809077 ?auto_809079 ) ) ( HOIST-AT ?auto_809075 ?auto_809077 ) ( not ( = ?auto_809078 ?auto_809075 ) ) ( AVAILABLE ?auto_809075 ) ( SURFACE-AT ?auto_809073 ?auto_809077 ) ( ON ?auto_809073 ?auto_809074 ) ( CLEAR ?auto_809073 ) ( not ( = ?auto_809072 ?auto_809074 ) ) ( not ( = ?auto_809073 ?auto_809074 ) ) ( not ( = ?auto_809071 ?auto_809074 ) ) ( TRUCK-AT ?auto_809076 ?auto_809079 ) ( SURFACE-AT ?auto_809071 ?auto_809079 ) ( CLEAR ?auto_809071 ) ( LIFTING ?auto_809078 ?auto_809072 ) ( IS-CRATE ?auto_809072 ) ( ON ?auto_809065 ?auto_809064 ) ( ON ?auto_809066 ?auto_809065 ) ( ON ?auto_809067 ?auto_809066 ) ( ON ?auto_809068 ?auto_809067 ) ( ON ?auto_809069 ?auto_809068 ) ( ON ?auto_809070 ?auto_809069 ) ( ON ?auto_809071 ?auto_809070 ) ( not ( = ?auto_809064 ?auto_809065 ) ) ( not ( = ?auto_809064 ?auto_809066 ) ) ( not ( = ?auto_809064 ?auto_809067 ) ) ( not ( = ?auto_809064 ?auto_809068 ) ) ( not ( = ?auto_809064 ?auto_809069 ) ) ( not ( = ?auto_809064 ?auto_809070 ) ) ( not ( = ?auto_809064 ?auto_809071 ) ) ( not ( = ?auto_809064 ?auto_809072 ) ) ( not ( = ?auto_809064 ?auto_809073 ) ) ( not ( = ?auto_809064 ?auto_809074 ) ) ( not ( = ?auto_809065 ?auto_809066 ) ) ( not ( = ?auto_809065 ?auto_809067 ) ) ( not ( = ?auto_809065 ?auto_809068 ) ) ( not ( = ?auto_809065 ?auto_809069 ) ) ( not ( = ?auto_809065 ?auto_809070 ) ) ( not ( = ?auto_809065 ?auto_809071 ) ) ( not ( = ?auto_809065 ?auto_809072 ) ) ( not ( = ?auto_809065 ?auto_809073 ) ) ( not ( = ?auto_809065 ?auto_809074 ) ) ( not ( = ?auto_809066 ?auto_809067 ) ) ( not ( = ?auto_809066 ?auto_809068 ) ) ( not ( = ?auto_809066 ?auto_809069 ) ) ( not ( = ?auto_809066 ?auto_809070 ) ) ( not ( = ?auto_809066 ?auto_809071 ) ) ( not ( = ?auto_809066 ?auto_809072 ) ) ( not ( = ?auto_809066 ?auto_809073 ) ) ( not ( = ?auto_809066 ?auto_809074 ) ) ( not ( = ?auto_809067 ?auto_809068 ) ) ( not ( = ?auto_809067 ?auto_809069 ) ) ( not ( = ?auto_809067 ?auto_809070 ) ) ( not ( = ?auto_809067 ?auto_809071 ) ) ( not ( = ?auto_809067 ?auto_809072 ) ) ( not ( = ?auto_809067 ?auto_809073 ) ) ( not ( = ?auto_809067 ?auto_809074 ) ) ( not ( = ?auto_809068 ?auto_809069 ) ) ( not ( = ?auto_809068 ?auto_809070 ) ) ( not ( = ?auto_809068 ?auto_809071 ) ) ( not ( = ?auto_809068 ?auto_809072 ) ) ( not ( = ?auto_809068 ?auto_809073 ) ) ( not ( = ?auto_809068 ?auto_809074 ) ) ( not ( = ?auto_809069 ?auto_809070 ) ) ( not ( = ?auto_809069 ?auto_809071 ) ) ( not ( = ?auto_809069 ?auto_809072 ) ) ( not ( = ?auto_809069 ?auto_809073 ) ) ( not ( = ?auto_809069 ?auto_809074 ) ) ( not ( = ?auto_809070 ?auto_809071 ) ) ( not ( = ?auto_809070 ?auto_809072 ) ) ( not ( = ?auto_809070 ?auto_809073 ) ) ( not ( = ?auto_809070 ?auto_809074 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_809071 ?auto_809072 ?auto_809073 )
      ( MAKE-9CRATE-VERIFY ?auto_809064 ?auto_809065 ?auto_809066 ?auto_809067 ?auto_809068 ?auto_809069 ?auto_809070 ?auto_809071 ?auto_809072 ?auto_809073 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_809173 - SURFACE
      ?auto_809174 - SURFACE
      ?auto_809175 - SURFACE
      ?auto_809176 - SURFACE
      ?auto_809177 - SURFACE
      ?auto_809178 - SURFACE
      ?auto_809179 - SURFACE
      ?auto_809180 - SURFACE
      ?auto_809181 - SURFACE
      ?auto_809182 - SURFACE
    )
    :vars
    (
      ?auto_809185 - HOIST
      ?auto_809188 - PLACE
      ?auto_809184 - PLACE
      ?auto_809186 - HOIST
      ?auto_809183 - SURFACE
      ?auto_809187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_809185 ?auto_809188 ) ( IS-CRATE ?auto_809182 ) ( not ( = ?auto_809181 ?auto_809182 ) ) ( not ( = ?auto_809180 ?auto_809181 ) ) ( not ( = ?auto_809180 ?auto_809182 ) ) ( not ( = ?auto_809184 ?auto_809188 ) ) ( HOIST-AT ?auto_809186 ?auto_809184 ) ( not ( = ?auto_809185 ?auto_809186 ) ) ( AVAILABLE ?auto_809186 ) ( SURFACE-AT ?auto_809182 ?auto_809184 ) ( ON ?auto_809182 ?auto_809183 ) ( CLEAR ?auto_809182 ) ( not ( = ?auto_809181 ?auto_809183 ) ) ( not ( = ?auto_809182 ?auto_809183 ) ) ( not ( = ?auto_809180 ?auto_809183 ) ) ( TRUCK-AT ?auto_809187 ?auto_809188 ) ( SURFACE-AT ?auto_809180 ?auto_809188 ) ( CLEAR ?auto_809180 ) ( IS-CRATE ?auto_809181 ) ( AVAILABLE ?auto_809185 ) ( IN ?auto_809181 ?auto_809187 ) ( ON ?auto_809174 ?auto_809173 ) ( ON ?auto_809175 ?auto_809174 ) ( ON ?auto_809176 ?auto_809175 ) ( ON ?auto_809177 ?auto_809176 ) ( ON ?auto_809178 ?auto_809177 ) ( ON ?auto_809179 ?auto_809178 ) ( ON ?auto_809180 ?auto_809179 ) ( not ( = ?auto_809173 ?auto_809174 ) ) ( not ( = ?auto_809173 ?auto_809175 ) ) ( not ( = ?auto_809173 ?auto_809176 ) ) ( not ( = ?auto_809173 ?auto_809177 ) ) ( not ( = ?auto_809173 ?auto_809178 ) ) ( not ( = ?auto_809173 ?auto_809179 ) ) ( not ( = ?auto_809173 ?auto_809180 ) ) ( not ( = ?auto_809173 ?auto_809181 ) ) ( not ( = ?auto_809173 ?auto_809182 ) ) ( not ( = ?auto_809173 ?auto_809183 ) ) ( not ( = ?auto_809174 ?auto_809175 ) ) ( not ( = ?auto_809174 ?auto_809176 ) ) ( not ( = ?auto_809174 ?auto_809177 ) ) ( not ( = ?auto_809174 ?auto_809178 ) ) ( not ( = ?auto_809174 ?auto_809179 ) ) ( not ( = ?auto_809174 ?auto_809180 ) ) ( not ( = ?auto_809174 ?auto_809181 ) ) ( not ( = ?auto_809174 ?auto_809182 ) ) ( not ( = ?auto_809174 ?auto_809183 ) ) ( not ( = ?auto_809175 ?auto_809176 ) ) ( not ( = ?auto_809175 ?auto_809177 ) ) ( not ( = ?auto_809175 ?auto_809178 ) ) ( not ( = ?auto_809175 ?auto_809179 ) ) ( not ( = ?auto_809175 ?auto_809180 ) ) ( not ( = ?auto_809175 ?auto_809181 ) ) ( not ( = ?auto_809175 ?auto_809182 ) ) ( not ( = ?auto_809175 ?auto_809183 ) ) ( not ( = ?auto_809176 ?auto_809177 ) ) ( not ( = ?auto_809176 ?auto_809178 ) ) ( not ( = ?auto_809176 ?auto_809179 ) ) ( not ( = ?auto_809176 ?auto_809180 ) ) ( not ( = ?auto_809176 ?auto_809181 ) ) ( not ( = ?auto_809176 ?auto_809182 ) ) ( not ( = ?auto_809176 ?auto_809183 ) ) ( not ( = ?auto_809177 ?auto_809178 ) ) ( not ( = ?auto_809177 ?auto_809179 ) ) ( not ( = ?auto_809177 ?auto_809180 ) ) ( not ( = ?auto_809177 ?auto_809181 ) ) ( not ( = ?auto_809177 ?auto_809182 ) ) ( not ( = ?auto_809177 ?auto_809183 ) ) ( not ( = ?auto_809178 ?auto_809179 ) ) ( not ( = ?auto_809178 ?auto_809180 ) ) ( not ( = ?auto_809178 ?auto_809181 ) ) ( not ( = ?auto_809178 ?auto_809182 ) ) ( not ( = ?auto_809178 ?auto_809183 ) ) ( not ( = ?auto_809179 ?auto_809180 ) ) ( not ( = ?auto_809179 ?auto_809181 ) ) ( not ( = ?auto_809179 ?auto_809182 ) ) ( not ( = ?auto_809179 ?auto_809183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_809180 ?auto_809181 ?auto_809182 )
      ( MAKE-9CRATE-VERIFY ?auto_809173 ?auto_809174 ?auto_809175 ?auto_809176 ?auto_809177 ?auto_809178 ?auto_809179 ?auto_809180 ?auto_809181 ?auto_809182 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_814683 - SURFACE
      ?auto_814684 - SURFACE
      ?auto_814685 - SURFACE
      ?auto_814686 - SURFACE
      ?auto_814687 - SURFACE
      ?auto_814688 - SURFACE
      ?auto_814689 - SURFACE
      ?auto_814690 - SURFACE
      ?auto_814691 - SURFACE
      ?auto_814692 - SURFACE
      ?auto_814693 - SURFACE
    )
    :vars
    (
      ?auto_814694 - HOIST
      ?auto_814695 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_814694 ?auto_814695 ) ( SURFACE-AT ?auto_814692 ?auto_814695 ) ( CLEAR ?auto_814692 ) ( LIFTING ?auto_814694 ?auto_814693 ) ( IS-CRATE ?auto_814693 ) ( not ( = ?auto_814692 ?auto_814693 ) ) ( ON ?auto_814684 ?auto_814683 ) ( ON ?auto_814685 ?auto_814684 ) ( ON ?auto_814686 ?auto_814685 ) ( ON ?auto_814687 ?auto_814686 ) ( ON ?auto_814688 ?auto_814687 ) ( ON ?auto_814689 ?auto_814688 ) ( ON ?auto_814690 ?auto_814689 ) ( ON ?auto_814691 ?auto_814690 ) ( ON ?auto_814692 ?auto_814691 ) ( not ( = ?auto_814683 ?auto_814684 ) ) ( not ( = ?auto_814683 ?auto_814685 ) ) ( not ( = ?auto_814683 ?auto_814686 ) ) ( not ( = ?auto_814683 ?auto_814687 ) ) ( not ( = ?auto_814683 ?auto_814688 ) ) ( not ( = ?auto_814683 ?auto_814689 ) ) ( not ( = ?auto_814683 ?auto_814690 ) ) ( not ( = ?auto_814683 ?auto_814691 ) ) ( not ( = ?auto_814683 ?auto_814692 ) ) ( not ( = ?auto_814683 ?auto_814693 ) ) ( not ( = ?auto_814684 ?auto_814685 ) ) ( not ( = ?auto_814684 ?auto_814686 ) ) ( not ( = ?auto_814684 ?auto_814687 ) ) ( not ( = ?auto_814684 ?auto_814688 ) ) ( not ( = ?auto_814684 ?auto_814689 ) ) ( not ( = ?auto_814684 ?auto_814690 ) ) ( not ( = ?auto_814684 ?auto_814691 ) ) ( not ( = ?auto_814684 ?auto_814692 ) ) ( not ( = ?auto_814684 ?auto_814693 ) ) ( not ( = ?auto_814685 ?auto_814686 ) ) ( not ( = ?auto_814685 ?auto_814687 ) ) ( not ( = ?auto_814685 ?auto_814688 ) ) ( not ( = ?auto_814685 ?auto_814689 ) ) ( not ( = ?auto_814685 ?auto_814690 ) ) ( not ( = ?auto_814685 ?auto_814691 ) ) ( not ( = ?auto_814685 ?auto_814692 ) ) ( not ( = ?auto_814685 ?auto_814693 ) ) ( not ( = ?auto_814686 ?auto_814687 ) ) ( not ( = ?auto_814686 ?auto_814688 ) ) ( not ( = ?auto_814686 ?auto_814689 ) ) ( not ( = ?auto_814686 ?auto_814690 ) ) ( not ( = ?auto_814686 ?auto_814691 ) ) ( not ( = ?auto_814686 ?auto_814692 ) ) ( not ( = ?auto_814686 ?auto_814693 ) ) ( not ( = ?auto_814687 ?auto_814688 ) ) ( not ( = ?auto_814687 ?auto_814689 ) ) ( not ( = ?auto_814687 ?auto_814690 ) ) ( not ( = ?auto_814687 ?auto_814691 ) ) ( not ( = ?auto_814687 ?auto_814692 ) ) ( not ( = ?auto_814687 ?auto_814693 ) ) ( not ( = ?auto_814688 ?auto_814689 ) ) ( not ( = ?auto_814688 ?auto_814690 ) ) ( not ( = ?auto_814688 ?auto_814691 ) ) ( not ( = ?auto_814688 ?auto_814692 ) ) ( not ( = ?auto_814688 ?auto_814693 ) ) ( not ( = ?auto_814689 ?auto_814690 ) ) ( not ( = ?auto_814689 ?auto_814691 ) ) ( not ( = ?auto_814689 ?auto_814692 ) ) ( not ( = ?auto_814689 ?auto_814693 ) ) ( not ( = ?auto_814690 ?auto_814691 ) ) ( not ( = ?auto_814690 ?auto_814692 ) ) ( not ( = ?auto_814690 ?auto_814693 ) ) ( not ( = ?auto_814691 ?auto_814692 ) ) ( not ( = ?auto_814691 ?auto_814693 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_814692 ?auto_814693 )
      ( MAKE-10CRATE-VERIFY ?auto_814683 ?auto_814684 ?auto_814685 ?auto_814686 ?auto_814687 ?auto_814688 ?auto_814689 ?auto_814690 ?auto_814691 ?auto_814692 ?auto_814693 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_814777 - SURFACE
      ?auto_814778 - SURFACE
      ?auto_814779 - SURFACE
      ?auto_814780 - SURFACE
      ?auto_814781 - SURFACE
      ?auto_814782 - SURFACE
      ?auto_814783 - SURFACE
      ?auto_814784 - SURFACE
      ?auto_814785 - SURFACE
      ?auto_814786 - SURFACE
      ?auto_814787 - SURFACE
    )
    :vars
    (
      ?auto_814788 - HOIST
      ?auto_814790 - PLACE
      ?auto_814789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_814788 ?auto_814790 ) ( SURFACE-AT ?auto_814786 ?auto_814790 ) ( CLEAR ?auto_814786 ) ( IS-CRATE ?auto_814787 ) ( not ( = ?auto_814786 ?auto_814787 ) ) ( TRUCK-AT ?auto_814789 ?auto_814790 ) ( AVAILABLE ?auto_814788 ) ( IN ?auto_814787 ?auto_814789 ) ( ON ?auto_814786 ?auto_814785 ) ( not ( = ?auto_814785 ?auto_814786 ) ) ( not ( = ?auto_814785 ?auto_814787 ) ) ( ON ?auto_814778 ?auto_814777 ) ( ON ?auto_814779 ?auto_814778 ) ( ON ?auto_814780 ?auto_814779 ) ( ON ?auto_814781 ?auto_814780 ) ( ON ?auto_814782 ?auto_814781 ) ( ON ?auto_814783 ?auto_814782 ) ( ON ?auto_814784 ?auto_814783 ) ( ON ?auto_814785 ?auto_814784 ) ( not ( = ?auto_814777 ?auto_814778 ) ) ( not ( = ?auto_814777 ?auto_814779 ) ) ( not ( = ?auto_814777 ?auto_814780 ) ) ( not ( = ?auto_814777 ?auto_814781 ) ) ( not ( = ?auto_814777 ?auto_814782 ) ) ( not ( = ?auto_814777 ?auto_814783 ) ) ( not ( = ?auto_814777 ?auto_814784 ) ) ( not ( = ?auto_814777 ?auto_814785 ) ) ( not ( = ?auto_814777 ?auto_814786 ) ) ( not ( = ?auto_814777 ?auto_814787 ) ) ( not ( = ?auto_814778 ?auto_814779 ) ) ( not ( = ?auto_814778 ?auto_814780 ) ) ( not ( = ?auto_814778 ?auto_814781 ) ) ( not ( = ?auto_814778 ?auto_814782 ) ) ( not ( = ?auto_814778 ?auto_814783 ) ) ( not ( = ?auto_814778 ?auto_814784 ) ) ( not ( = ?auto_814778 ?auto_814785 ) ) ( not ( = ?auto_814778 ?auto_814786 ) ) ( not ( = ?auto_814778 ?auto_814787 ) ) ( not ( = ?auto_814779 ?auto_814780 ) ) ( not ( = ?auto_814779 ?auto_814781 ) ) ( not ( = ?auto_814779 ?auto_814782 ) ) ( not ( = ?auto_814779 ?auto_814783 ) ) ( not ( = ?auto_814779 ?auto_814784 ) ) ( not ( = ?auto_814779 ?auto_814785 ) ) ( not ( = ?auto_814779 ?auto_814786 ) ) ( not ( = ?auto_814779 ?auto_814787 ) ) ( not ( = ?auto_814780 ?auto_814781 ) ) ( not ( = ?auto_814780 ?auto_814782 ) ) ( not ( = ?auto_814780 ?auto_814783 ) ) ( not ( = ?auto_814780 ?auto_814784 ) ) ( not ( = ?auto_814780 ?auto_814785 ) ) ( not ( = ?auto_814780 ?auto_814786 ) ) ( not ( = ?auto_814780 ?auto_814787 ) ) ( not ( = ?auto_814781 ?auto_814782 ) ) ( not ( = ?auto_814781 ?auto_814783 ) ) ( not ( = ?auto_814781 ?auto_814784 ) ) ( not ( = ?auto_814781 ?auto_814785 ) ) ( not ( = ?auto_814781 ?auto_814786 ) ) ( not ( = ?auto_814781 ?auto_814787 ) ) ( not ( = ?auto_814782 ?auto_814783 ) ) ( not ( = ?auto_814782 ?auto_814784 ) ) ( not ( = ?auto_814782 ?auto_814785 ) ) ( not ( = ?auto_814782 ?auto_814786 ) ) ( not ( = ?auto_814782 ?auto_814787 ) ) ( not ( = ?auto_814783 ?auto_814784 ) ) ( not ( = ?auto_814783 ?auto_814785 ) ) ( not ( = ?auto_814783 ?auto_814786 ) ) ( not ( = ?auto_814783 ?auto_814787 ) ) ( not ( = ?auto_814784 ?auto_814785 ) ) ( not ( = ?auto_814784 ?auto_814786 ) ) ( not ( = ?auto_814784 ?auto_814787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_814785 ?auto_814786 ?auto_814787 )
      ( MAKE-10CRATE-VERIFY ?auto_814777 ?auto_814778 ?auto_814779 ?auto_814780 ?auto_814781 ?auto_814782 ?auto_814783 ?auto_814784 ?auto_814785 ?auto_814786 ?auto_814787 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_814882 - SURFACE
      ?auto_814883 - SURFACE
      ?auto_814884 - SURFACE
      ?auto_814885 - SURFACE
      ?auto_814886 - SURFACE
      ?auto_814887 - SURFACE
      ?auto_814888 - SURFACE
      ?auto_814889 - SURFACE
      ?auto_814890 - SURFACE
      ?auto_814891 - SURFACE
      ?auto_814892 - SURFACE
    )
    :vars
    (
      ?auto_814896 - HOIST
      ?auto_814895 - PLACE
      ?auto_814894 - TRUCK
      ?auto_814893 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_814896 ?auto_814895 ) ( SURFACE-AT ?auto_814891 ?auto_814895 ) ( CLEAR ?auto_814891 ) ( IS-CRATE ?auto_814892 ) ( not ( = ?auto_814891 ?auto_814892 ) ) ( AVAILABLE ?auto_814896 ) ( IN ?auto_814892 ?auto_814894 ) ( ON ?auto_814891 ?auto_814890 ) ( not ( = ?auto_814890 ?auto_814891 ) ) ( not ( = ?auto_814890 ?auto_814892 ) ) ( TRUCK-AT ?auto_814894 ?auto_814893 ) ( not ( = ?auto_814893 ?auto_814895 ) ) ( ON ?auto_814883 ?auto_814882 ) ( ON ?auto_814884 ?auto_814883 ) ( ON ?auto_814885 ?auto_814884 ) ( ON ?auto_814886 ?auto_814885 ) ( ON ?auto_814887 ?auto_814886 ) ( ON ?auto_814888 ?auto_814887 ) ( ON ?auto_814889 ?auto_814888 ) ( ON ?auto_814890 ?auto_814889 ) ( not ( = ?auto_814882 ?auto_814883 ) ) ( not ( = ?auto_814882 ?auto_814884 ) ) ( not ( = ?auto_814882 ?auto_814885 ) ) ( not ( = ?auto_814882 ?auto_814886 ) ) ( not ( = ?auto_814882 ?auto_814887 ) ) ( not ( = ?auto_814882 ?auto_814888 ) ) ( not ( = ?auto_814882 ?auto_814889 ) ) ( not ( = ?auto_814882 ?auto_814890 ) ) ( not ( = ?auto_814882 ?auto_814891 ) ) ( not ( = ?auto_814882 ?auto_814892 ) ) ( not ( = ?auto_814883 ?auto_814884 ) ) ( not ( = ?auto_814883 ?auto_814885 ) ) ( not ( = ?auto_814883 ?auto_814886 ) ) ( not ( = ?auto_814883 ?auto_814887 ) ) ( not ( = ?auto_814883 ?auto_814888 ) ) ( not ( = ?auto_814883 ?auto_814889 ) ) ( not ( = ?auto_814883 ?auto_814890 ) ) ( not ( = ?auto_814883 ?auto_814891 ) ) ( not ( = ?auto_814883 ?auto_814892 ) ) ( not ( = ?auto_814884 ?auto_814885 ) ) ( not ( = ?auto_814884 ?auto_814886 ) ) ( not ( = ?auto_814884 ?auto_814887 ) ) ( not ( = ?auto_814884 ?auto_814888 ) ) ( not ( = ?auto_814884 ?auto_814889 ) ) ( not ( = ?auto_814884 ?auto_814890 ) ) ( not ( = ?auto_814884 ?auto_814891 ) ) ( not ( = ?auto_814884 ?auto_814892 ) ) ( not ( = ?auto_814885 ?auto_814886 ) ) ( not ( = ?auto_814885 ?auto_814887 ) ) ( not ( = ?auto_814885 ?auto_814888 ) ) ( not ( = ?auto_814885 ?auto_814889 ) ) ( not ( = ?auto_814885 ?auto_814890 ) ) ( not ( = ?auto_814885 ?auto_814891 ) ) ( not ( = ?auto_814885 ?auto_814892 ) ) ( not ( = ?auto_814886 ?auto_814887 ) ) ( not ( = ?auto_814886 ?auto_814888 ) ) ( not ( = ?auto_814886 ?auto_814889 ) ) ( not ( = ?auto_814886 ?auto_814890 ) ) ( not ( = ?auto_814886 ?auto_814891 ) ) ( not ( = ?auto_814886 ?auto_814892 ) ) ( not ( = ?auto_814887 ?auto_814888 ) ) ( not ( = ?auto_814887 ?auto_814889 ) ) ( not ( = ?auto_814887 ?auto_814890 ) ) ( not ( = ?auto_814887 ?auto_814891 ) ) ( not ( = ?auto_814887 ?auto_814892 ) ) ( not ( = ?auto_814888 ?auto_814889 ) ) ( not ( = ?auto_814888 ?auto_814890 ) ) ( not ( = ?auto_814888 ?auto_814891 ) ) ( not ( = ?auto_814888 ?auto_814892 ) ) ( not ( = ?auto_814889 ?auto_814890 ) ) ( not ( = ?auto_814889 ?auto_814891 ) ) ( not ( = ?auto_814889 ?auto_814892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_814890 ?auto_814891 ?auto_814892 )
      ( MAKE-10CRATE-VERIFY ?auto_814882 ?auto_814883 ?auto_814884 ?auto_814885 ?auto_814886 ?auto_814887 ?auto_814888 ?auto_814889 ?auto_814890 ?auto_814891 ?auto_814892 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_814997 - SURFACE
      ?auto_814998 - SURFACE
      ?auto_814999 - SURFACE
      ?auto_815000 - SURFACE
      ?auto_815001 - SURFACE
      ?auto_815002 - SURFACE
      ?auto_815003 - SURFACE
      ?auto_815004 - SURFACE
      ?auto_815005 - SURFACE
      ?auto_815006 - SURFACE
      ?auto_815007 - SURFACE
    )
    :vars
    (
      ?auto_815009 - HOIST
      ?auto_815010 - PLACE
      ?auto_815012 - TRUCK
      ?auto_815008 - PLACE
      ?auto_815011 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_815009 ?auto_815010 ) ( SURFACE-AT ?auto_815006 ?auto_815010 ) ( CLEAR ?auto_815006 ) ( IS-CRATE ?auto_815007 ) ( not ( = ?auto_815006 ?auto_815007 ) ) ( AVAILABLE ?auto_815009 ) ( ON ?auto_815006 ?auto_815005 ) ( not ( = ?auto_815005 ?auto_815006 ) ) ( not ( = ?auto_815005 ?auto_815007 ) ) ( TRUCK-AT ?auto_815012 ?auto_815008 ) ( not ( = ?auto_815008 ?auto_815010 ) ) ( HOIST-AT ?auto_815011 ?auto_815008 ) ( LIFTING ?auto_815011 ?auto_815007 ) ( not ( = ?auto_815009 ?auto_815011 ) ) ( ON ?auto_814998 ?auto_814997 ) ( ON ?auto_814999 ?auto_814998 ) ( ON ?auto_815000 ?auto_814999 ) ( ON ?auto_815001 ?auto_815000 ) ( ON ?auto_815002 ?auto_815001 ) ( ON ?auto_815003 ?auto_815002 ) ( ON ?auto_815004 ?auto_815003 ) ( ON ?auto_815005 ?auto_815004 ) ( not ( = ?auto_814997 ?auto_814998 ) ) ( not ( = ?auto_814997 ?auto_814999 ) ) ( not ( = ?auto_814997 ?auto_815000 ) ) ( not ( = ?auto_814997 ?auto_815001 ) ) ( not ( = ?auto_814997 ?auto_815002 ) ) ( not ( = ?auto_814997 ?auto_815003 ) ) ( not ( = ?auto_814997 ?auto_815004 ) ) ( not ( = ?auto_814997 ?auto_815005 ) ) ( not ( = ?auto_814997 ?auto_815006 ) ) ( not ( = ?auto_814997 ?auto_815007 ) ) ( not ( = ?auto_814998 ?auto_814999 ) ) ( not ( = ?auto_814998 ?auto_815000 ) ) ( not ( = ?auto_814998 ?auto_815001 ) ) ( not ( = ?auto_814998 ?auto_815002 ) ) ( not ( = ?auto_814998 ?auto_815003 ) ) ( not ( = ?auto_814998 ?auto_815004 ) ) ( not ( = ?auto_814998 ?auto_815005 ) ) ( not ( = ?auto_814998 ?auto_815006 ) ) ( not ( = ?auto_814998 ?auto_815007 ) ) ( not ( = ?auto_814999 ?auto_815000 ) ) ( not ( = ?auto_814999 ?auto_815001 ) ) ( not ( = ?auto_814999 ?auto_815002 ) ) ( not ( = ?auto_814999 ?auto_815003 ) ) ( not ( = ?auto_814999 ?auto_815004 ) ) ( not ( = ?auto_814999 ?auto_815005 ) ) ( not ( = ?auto_814999 ?auto_815006 ) ) ( not ( = ?auto_814999 ?auto_815007 ) ) ( not ( = ?auto_815000 ?auto_815001 ) ) ( not ( = ?auto_815000 ?auto_815002 ) ) ( not ( = ?auto_815000 ?auto_815003 ) ) ( not ( = ?auto_815000 ?auto_815004 ) ) ( not ( = ?auto_815000 ?auto_815005 ) ) ( not ( = ?auto_815000 ?auto_815006 ) ) ( not ( = ?auto_815000 ?auto_815007 ) ) ( not ( = ?auto_815001 ?auto_815002 ) ) ( not ( = ?auto_815001 ?auto_815003 ) ) ( not ( = ?auto_815001 ?auto_815004 ) ) ( not ( = ?auto_815001 ?auto_815005 ) ) ( not ( = ?auto_815001 ?auto_815006 ) ) ( not ( = ?auto_815001 ?auto_815007 ) ) ( not ( = ?auto_815002 ?auto_815003 ) ) ( not ( = ?auto_815002 ?auto_815004 ) ) ( not ( = ?auto_815002 ?auto_815005 ) ) ( not ( = ?auto_815002 ?auto_815006 ) ) ( not ( = ?auto_815002 ?auto_815007 ) ) ( not ( = ?auto_815003 ?auto_815004 ) ) ( not ( = ?auto_815003 ?auto_815005 ) ) ( not ( = ?auto_815003 ?auto_815006 ) ) ( not ( = ?auto_815003 ?auto_815007 ) ) ( not ( = ?auto_815004 ?auto_815005 ) ) ( not ( = ?auto_815004 ?auto_815006 ) ) ( not ( = ?auto_815004 ?auto_815007 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_815005 ?auto_815006 ?auto_815007 )
      ( MAKE-10CRATE-VERIFY ?auto_814997 ?auto_814998 ?auto_814999 ?auto_815000 ?auto_815001 ?auto_815002 ?auto_815003 ?auto_815004 ?auto_815005 ?auto_815006 ?auto_815007 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_815122 - SURFACE
      ?auto_815123 - SURFACE
      ?auto_815124 - SURFACE
      ?auto_815125 - SURFACE
      ?auto_815126 - SURFACE
      ?auto_815127 - SURFACE
      ?auto_815128 - SURFACE
      ?auto_815129 - SURFACE
      ?auto_815130 - SURFACE
      ?auto_815131 - SURFACE
      ?auto_815132 - SURFACE
    )
    :vars
    (
      ?auto_815138 - HOIST
      ?auto_815134 - PLACE
      ?auto_815133 - TRUCK
      ?auto_815135 - PLACE
      ?auto_815136 - HOIST
      ?auto_815137 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_815138 ?auto_815134 ) ( SURFACE-AT ?auto_815131 ?auto_815134 ) ( CLEAR ?auto_815131 ) ( IS-CRATE ?auto_815132 ) ( not ( = ?auto_815131 ?auto_815132 ) ) ( AVAILABLE ?auto_815138 ) ( ON ?auto_815131 ?auto_815130 ) ( not ( = ?auto_815130 ?auto_815131 ) ) ( not ( = ?auto_815130 ?auto_815132 ) ) ( TRUCK-AT ?auto_815133 ?auto_815135 ) ( not ( = ?auto_815135 ?auto_815134 ) ) ( HOIST-AT ?auto_815136 ?auto_815135 ) ( not ( = ?auto_815138 ?auto_815136 ) ) ( AVAILABLE ?auto_815136 ) ( SURFACE-AT ?auto_815132 ?auto_815135 ) ( ON ?auto_815132 ?auto_815137 ) ( CLEAR ?auto_815132 ) ( not ( = ?auto_815131 ?auto_815137 ) ) ( not ( = ?auto_815132 ?auto_815137 ) ) ( not ( = ?auto_815130 ?auto_815137 ) ) ( ON ?auto_815123 ?auto_815122 ) ( ON ?auto_815124 ?auto_815123 ) ( ON ?auto_815125 ?auto_815124 ) ( ON ?auto_815126 ?auto_815125 ) ( ON ?auto_815127 ?auto_815126 ) ( ON ?auto_815128 ?auto_815127 ) ( ON ?auto_815129 ?auto_815128 ) ( ON ?auto_815130 ?auto_815129 ) ( not ( = ?auto_815122 ?auto_815123 ) ) ( not ( = ?auto_815122 ?auto_815124 ) ) ( not ( = ?auto_815122 ?auto_815125 ) ) ( not ( = ?auto_815122 ?auto_815126 ) ) ( not ( = ?auto_815122 ?auto_815127 ) ) ( not ( = ?auto_815122 ?auto_815128 ) ) ( not ( = ?auto_815122 ?auto_815129 ) ) ( not ( = ?auto_815122 ?auto_815130 ) ) ( not ( = ?auto_815122 ?auto_815131 ) ) ( not ( = ?auto_815122 ?auto_815132 ) ) ( not ( = ?auto_815122 ?auto_815137 ) ) ( not ( = ?auto_815123 ?auto_815124 ) ) ( not ( = ?auto_815123 ?auto_815125 ) ) ( not ( = ?auto_815123 ?auto_815126 ) ) ( not ( = ?auto_815123 ?auto_815127 ) ) ( not ( = ?auto_815123 ?auto_815128 ) ) ( not ( = ?auto_815123 ?auto_815129 ) ) ( not ( = ?auto_815123 ?auto_815130 ) ) ( not ( = ?auto_815123 ?auto_815131 ) ) ( not ( = ?auto_815123 ?auto_815132 ) ) ( not ( = ?auto_815123 ?auto_815137 ) ) ( not ( = ?auto_815124 ?auto_815125 ) ) ( not ( = ?auto_815124 ?auto_815126 ) ) ( not ( = ?auto_815124 ?auto_815127 ) ) ( not ( = ?auto_815124 ?auto_815128 ) ) ( not ( = ?auto_815124 ?auto_815129 ) ) ( not ( = ?auto_815124 ?auto_815130 ) ) ( not ( = ?auto_815124 ?auto_815131 ) ) ( not ( = ?auto_815124 ?auto_815132 ) ) ( not ( = ?auto_815124 ?auto_815137 ) ) ( not ( = ?auto_815125 ?auto_815126 ) ) ( not ( = ?auto_815125 ?auto_815127 ) ) ( not ( = ?auto_815125 ?auto_815128 ) ) ( not ( = ?auto_815125 ?auto_815129 ) ) ( not ( = ?auto_815125 ?auto_815130 ) ) ( not ( = ?auto_815125 ?auto_815131 ) ) ( not ( = ?auto_815125 ?auto_815132 ) ) ( not ( = ?auto_815125 ?auto_815137 ) ) ( not ( = ?auto_815126 ?auto_815127 ) ) ( not ( = ?auto_815126 ?auto_815128 ) ) ( not ( = ?auto_815126 ?auto_815129 ) ) ( not ( = ?auto_815126 ?auto_815130 ) ) ( not ( = ?auto_815126 ?auto_815131 ) ) ( not ( = ?auto_815126 ?auto_815132 ) ) ( not ( = ?auto_815126 ?auto_815137 ) ) ( not ( = ?auto_815127 ?auto_815128 ) ) ( not ( = ?auto_815127 ?auto_815129 ) ) ( not ( = ?auto_815127 ?auto_815130 ) ) ( not ( = ?auto_815127 ?auto_815131 ) ) ( not ( = ?auto_815127 ?auto_815132 ) ) ( not ( = ?auto_815127 ?auto_815137 ) ) ( not ( = ?auto_815128 ?auto_815129 ) ) ( not ( = ?auto_815128 ?auto_815130 ) ) ( not ( = ?auto_815128 ?auto_815131 ) ) ( not ( = ?auto_815128 ?auto_815132 ) ) ( not ( = ?auto_815128 ?auto_815137 ) ) ( not ( = ?auto_815129 ?auto_815130 ) ) ( not ( = ?auto_815129 ?auto_815131 ) ) ( not ( = ?auto_815129 ?auto_815132 ) ) ( not ( = ?auto_815129 ?auto_815137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_815130 ?auto_815131 ?auto_815132 )
      ( MAKE-10CRATE-VERIFY ?auto_815122 ?auto_815123 ?auto_815124 ?auto_815125 ?auto_815126 ?auto_815127 ?auto_815128 ?auto_815129 ?auto_815130 ?auto_815131 ?auto_815132 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_815248 - SURFACE
      ?auto_815249 - SURFACE
      ?auto_815250 - SURFACE
      ?auto_815251 - SURFACE
      ?auto_815252 - SURFACE
      ?auto_815253 - SURFACE
      ?auto_815254 - SURFACE
      ?auto_815255 - SURFACE
      ?auto_815256 - SURFACE
      ?auto_815257 - SURFACE
      ?auto_815258 - SURFACE
    )
    :vars
    (
      ?auto_815262 - HOIST
      ?auto_815264 - PLACE
      ?auto_815261 - PLACE
      ?auto_815263 - HOIST
      ?auto_815260 - SURFACE
      ?auto_815259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_815262 ?auto_815264 ) ( SURFACE-AT ?auto_815257 ?auto_815264 ) ( CLEAR ?auto_815257 ) ( IS-CRATE ?auto_815258 ) ( not ( = ?auto_815257 ?auto_815258 ) ) ( AVAILABLE ?auto_815262 ) ( ON ?auto_815257 ?auto_815256 ) ( not ( = ?auto_815256 ?auto_815257 ) ) ( not ( = ?auto_815256 ?auto_815258 ) ) ( not ( = ?auto_815261 ?auto_815264 ) ) ( HOIST-AT ?auto_815263 ?auto_815261 ) ( not ( = ?auto_815262 ?auto_815263 ) ) ( AVAILABLE ?auto_815263 ) ( SURFACE-AT ?auto_815258 ?auto_815261 ) ( ON ?auto_815258 ?auto_815260 ) ( CLEAR ?auto_815258 ) ( not ( = ?auto_815257 ?auto_815260 ) ) ( not ( = ?auto_815258 ?auto_815260 ) ) ( not ( = ?auto_815256 ?auto_815260 ) ) ( TRUCK-AT ?auto_815259 ?auto_815264 ) ( ON ?auto_815249 ?auto_815248 ) ( ON ?auto_815250 ?auto_815249 ) ( ON ?auto_815251 ?auto_815250 ) ( ON ?auto_815252 ?auto_815251 ) ( ON ?auto_815253 ?auto_815252 ) ( ON ?auto_815254 ?auto_815253 ) ( ON ?auto_815255 ?auto_815254 ) ( ON ?auto_815256 ?auto_815255 ) ( not ( = ?auto_815248 ?auto_815249 ) ) ( not ( = ?auto_815248 ?auto_815250 ) ) ( not ( = ?auto_815248 ?auto_815251 ) ) ( not ( = ?auto_815248 ?auto_815252 ) ) ( not ( = ?auto_815248 ?auto_815253 ) ) ( not ( = ?auto_815248 ?auto_815254 ) ) ( not ( = ?auto_815248 ?auto_815255 ) ) ( not ( = ?auto_815248 ?auto_815256 ) ) ( not ( = ?auto_815248 ?auto_815257 ) ) ( not ( = ?auto_815248 ?auto_815258 ) ) ( not ( = ?auto_815248 ?auto_815260 ) ) ( not ( = ?auto_815249 ?auto_815250 ) ) ( not ( = ?auto_815249 ?auto_815251 ) ) ( not ( = ?auto_815249 ?auto_815252 ) ) ( not ( = ?auto_815249 ?auto_815253 ) ) ( not ( = ?auto_815249 ?auto_815254 ) ) ( not ( = ?auto_815249 ?auto_815255 ) ) ( not ( = ?auto_815249 ?auto_815256 ) ) ( not ( = ?auto_815249 ?auto_815257 ) ) ( not ( = ?auto_815249 ?auto_815258 ) ) ( not ( = ?auto_815249 ?auto_815260 ) ) ( not ( = ?auto_815250 ?auto_815251 ) ) ( not ( = ?auto_815250 ?auto_815252 ) ) ( not ( = ?auto_815250 ?auto_815253 ) ) ( not ( = ?auto_815250 ?auto_815254 ) ) ( not ( = ?auto_815250 ?auto_815255 ) ) ( not ( = ?auto_815250 ?auto_815256 ) ) ( not ( = ?auto_815250 ?auto_815257 ) ) ( not ( = ?auto_815250 ?auto_815258 ) ) ( not ( = ?auto_815250 ?auto_815260 ) ) ( not ( = ?auto_815251 ?auto_815252 ) ) ( not ( = ?auto_815251 ?auto_815253 ) ) ( not ( = ?auto_815251 ?auto_815254 ) ) ( not ( = ?auto_815251 ?auto_815255 ) ) ( not ( = ?auto_815251 ?auto_815256 ) ) ( not ( = ?auto_815251 ?auto_815257 ) ) ( not ( = ?auto_815251 ?auto_815258 ) ) ( not ( = ?auto_815251 ?auto_815260 ) ) ( not ( = ?auto_815252 ?auto_815253 ) ) ( not ( = ?auto_815252 ?auto_815254 ) ) ( not ( = ?auto_815252 ?auto_815255 ) ) ( not ( = ?auto_815252 ?auto_815256 ) ) ( not ( = ?auto_815252 ?auto_815257 ) ) ( not ( = ?auto_815252 ?auto_815258 ) ) ( not ( = ?auto_815252 ?auto_815260 ) ) ( not ( = ?auto_815253 ?auto_815254 ) ) ( not ( = ?auto_815253 ?auto_815255 ) ) ( not ( = ?auto_815253 ?auto_815256 ) ) ( not ( = ?auto_815253 ?auto_815257 ) ) ( not ( = ?auto_815253 ?auto_815258 ) ) ( not ( = ?auto_815253 ?auto_815260 ) ) ( not ( = ?auto_815254 ?auto_815255 ) ) ( not ( = ?auto_815254 ?auto_815256 ) ) ( not ( = ?auto_815254 ?auto_815257 ) ) ( not ( = ?auto_815254 ?auto_815258 ) ) ( not ( = ?auto_815254 ?auto_815260 ) ) ( not ( = ?auto_815255 ?auto_815256 ) ) ( not ( = ?auto_815255 ?auto_815257 ) ) ( not ( = ?auto_815255 ?auto_815258 ) ) ( not ( = ?auto_815255 ?auto_815260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_815256 ?auto_815257 ?auto_815258 )
      ( MAKE-10CRATE-VERIFY ?auto_815248 ?auto_815249 ?auto_815250 ?auto_815251 ?auto_815252 ?auto_815253 ?auto_815254 ?auto_815255 ?auto_815256 ?auto_815257 ?auto_815258 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_815374 - SURFACE
      ?auto_815375 - SURFACE
      ?auto_815376 - SURFACE
      ?auto_815377 - SURFACE
      ?auto_815378 - SURFACE
      ?auto_815379 - SURFACE
      ?auto_815380 - SURFACE
      ?auto_815381 - SURFACE
      ?auto_815382 - SURFACE
      ?auto_815383 - SURFACE
      ?auto_815384 - SURFACE
    )
    :vars
    (
      ?auto_815388 - HOIST
      ?auto_815389 - PLACE
      ?auto_815387 - PLACE
      ?auto_815385 - HOIST
      ?auto_815386 - SURFACE
      ?auto_815390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_815388 ?auto_815389 ) ( IS-CRATE ?auto_815384 ) ( not ( = ?auto_815383 ?auto_815384 ) ) ( not ( = ?auto_815382 ?auto_815383 ) ) ( not ( = ?auto_815382 ?auto_815384 ) ) ( not ( = ?auto_815387 ?auto_815389 ) ) ( HOIST-AT ?auto_815385 ?auto_815387 ) ( not ( = ?auto_815388 ?auto_815385 ) ) ( AVAILABLE ?auto_815385 ) ( SURFACE-AT ?auto_815384 ?auto_815387 ) ( ON ?auto_815384 ?auto_815386 ) ( CLEAR ?auto_815384 ) ( not ( = ?auto_815383 ?auto_815386 ) ) ( not ( = ?auto_815384 ?auto_815386 ) ) ( not ( = ?auto_815382 ?auto_815386 ) ) ( TRUCK-AT ?auto_815390 ?auto_815389 ) ( SURFACE-AT ?auto_815382 ?auto_815389 ) ( CLEAR ?auto_815382 ) ( LIFTING ?auto_815388 ?auto_815383 ) ( IS-CRATE ?auto_815383 ) ( ON ?auto_815375 ?auto_815374 ) ( ON ?auto_815376 ?auto_815375 ) ( ON ?auto_815377 ?auto_815376 ) ( ON ?auto_815378 ?auto_815377 ) ( ON ?auto_815379 ?auto_815378 ) ( ON ?auto_815380 ?auto_815379 ) ( ON ?auto_815381 ?auto_815380 ) ( ON ?auto_815382 ?auto_815381 ) ( not ( = ?auto_815374 ?auto_815375 ) ) ( not ( = ?auto_815374 ?auto_815376 ) ) ( not ( = ?auto_815374 ?auto_815377 ) ) ( not ( = ?auto_815374 ?auto_815378 ) ) ( not ( = ?auto_815374 ?auto_815379 ) ) ( not ( = ?auto_815374 ?auto_815380 ) ) ( not ( = ?auto_815374 ?auto_815381 ) ) ( not ( = ?auto_815374 ?auto_815382 ) ) ( not ( = ?auto_815374 ?auto_815383 ) ) ( not ( = ?auto_815374 ?auto_815384 ) ) ( not ( = ?auto_815374 ?auto_815386 ) ) ( not ( = ?auto_815375 ?auto_815376 ) ) ( not ( = ?auto_815375 ?auto_815377 ) ) ( not ( = ?auto_815375 ?auto_815378 ) ) ( not ( = ?auto_815375 ?auto_815379 ) ) ( not ( = ?auto_815375 ?auto_815380 ) ) ( not ( = ?auto_815375 ?auto_815381 ) ) ( not ( = ?auto_815375 ?auto_815382 ) ) ( not ( = ?auto_815375 ?auto_815383 ) ) ( not ( = ?auto_815375 ?auto_815384 ) ) ( not ( = ?auto_815375 ?auto_815386 ) ) ( not ( = ?auto_815376 ?auto_815377 ) ) ( not ( = ?auto_815376 ?auto_815378 ) ) ( not ( = ?auto_815376 ?auto_815379 ) ) ( not ( = ?auto_815376 ?auto_815380 ) ) ( not ( = ?auto_815376 ?auto_815381 ) ) ( not ( = ?auto_815376 ?auto_815382 ) ) ( not ( = ?auto_815376 ?auto_815383 ) ) ( not ( = ?auto_815376 ?auto_815384 ) ) ( not ( = ?auto_815376 ?auto_815386 ) ) ( not ( = ?auto_815377 ?auto_815378 ) ) ( not ( = ?auto_815377 ?auto_815379 ) ) ( not ( = ?auto_815377 ?auto_815380 ) ) ( not ( = ?auto_815377 ?auto_815381 ) ) ( not ( = ?auto_815377 ?auto_815382 ) ) ( not ( = ?auto_815377 ?auto_815383 ) ) ( not ( = ?auto_815377 ?auto_815384 ) ) ( not ( = ?auto_815377 ?auto_815386 ) ) ( not ( = ?auto_815378 ?auto_815379 ) ) ( not ( = ?auto_815378 ?auto_815380 ) ) ( not ( = ?auto_815378 ?auto_815381 ) ) ( not ( = ?auto_815378 ?auto_815382 ) ) ( not ( = ?auto_815378 ?auto_815383 ) ) ( not ( = ?auto_815378 ?auto_815384 ) ) ( not ( = ?auto_815378 ?auto_815386 ) ) ( not ( = ?auto_815379 ?auto_815380 ) ) ( not ( = ?auto_815379 ?auto_815381 ) ) ( not ( = ?auto_815379 ?auto_815382 ) ) ( not ( = ?auto_815379 ?auto_815383 ) ) ( not ( = ?auto_815379 ?auto_815384 ) ) ( not ( = ?auto_815379 ?auto_815386 ) ) ( not ( = ?auto_815380 ?auto_815381 ) ) ( not ( = ?auto_815380 ?auto_815382 ) ) ( not ( = ?auto_815380 ?auto_815383 ) ) ( not ( = ?auto_815380 ?auto_815384 ) ) ( not ( = ?auto_815380 ?auto_815386 ) ) ( not ( = ?auto_815381 ?auto_815382 ) ) ( not ( = ?auto_815381 ?auto_815383 ) ) ( not ( = ?auto_815381 ?auto_815384 ) ) ( not ( = ?auto_815381 ?auto_815386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_815382 ?auto_815383 ?auto_815384 )
      ( MAKE-10CRATE-VERIFY ?auto_815374 ?auto_815375 ?auto_815376 ?auto_815377 ?auto_815378 ?auto_815379 ?auto_815380 ?auto_815381 ?auto_815382 ?auto_815383 ?auto_815384 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_815500 - SURFACE
      ?auto_815501 - SURFACE
      ?auto_815502 - SURFACE
      ?auto_815503 - SURFACE
      ?auto_815504 - SURFACE
      ?auto_815505 - SURFACE
      ?auto_815506 - SURFACE
      ?auto_815507 - SURFACE
      ?auto_815508 - SURFACE
      ?auto_815509 - SURFACE
      ?auto_815510 - SURFACE
    )
    :vars
    (
      ?auto_815515 - HOIST
      ?auto_815516 - PLACE
      ?auto_815512 - PLACE
      ?auto_815514 - HOIST
      ?auto_815511 - SURFACE
      ?auto_815513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_815515 ?auto_815516 ) ( IS-CRATE ?auto_815510 ) ( not ( = ?auto_815509 ?auto_815510 ) ) ( not ( = ?auto_815508 ?auto_815509 ) ) ( not ( = ?auto_815508 ?auto_815510 ) ) ( not ( = ?auto_815512 ?auto_815516 ) ) ( HOIST-AT ?auto_815514 ?auto_815512 ) ( not ( = ?auto_815515 ?auto_815514 ) ) ( AVAILABLE ?auto_815514 ) ( SURFACE-AT ?auto_815510 ?auto_815512 ) ( ON ?auto_815510 ?auto_815511 ) ( CLEAR ?auto_815510 ) ( not ( = ?auto_815509 ?auto_815511 ) ) ( not ( = ?auto_815510 ?auto_815511 ) ) ( not ( = ?auto_815508 ?auto_815511 ) ) ( TRUCK-AT ?auto_815513 ?auto_815516 ) ( SURFACE-AT ?auto_815508 ?auto_815516 ) ( CLEAR ?auto_815508 ) ( IS-CRATE ?auto_815509 ) ( AVAILABLE ?auto_815515 ) ( IN ?auto_815509 ?auto_815513 ) ( ON ?auto_815501 ?auto_815500 ) ( ON ?auto_815502 ?auto_815501 ) ( ON ?auto_815503 ?auto_815502 ) ( ON ?auto_815504 ?auto_815503 ) ( ON ?auto_815505 ?auto_815504 ) ( ON ?auto_815506 ?auto_815505 ) ( ON ?auto_815507 ?auto_815506 ) ( ON ?auto_815508 ?auto_815507 ) ( not ( = ?auto_815500 ?auto_815501 ) ) ( not ( = ?auto_815500 ?auto_815502 ) ) ( not ( = ?auto_815500 ?auto_815503 ) ) ( not ( = ?auto_815500 ?auto_815504 ) ) ( not ( = ?auto_815500 ?auto_815505 ) ) ( not ( = ?auto_815500 ?auto_815506 ) ) ( not ( = ?auto_815500 ?auto_815507 ) ) ( not ( = ?auto_815500 ?auto_815508 ) ) ( not ( = ?auto_815500 ?auto_815509 ) ) ( not ( = ?auto_815500 ?auto_815510 ) ) ( not ( = ?auto_815500 ?auto_815511 ) ) ( not ( = ?auto_815501 ?auto_815502 ) ) ( not ( = ?auto_815501 ?auto_815503 ) ) ( not ( = ?auto_815501 ?auto_815504 ) ) ( not ( = ?auto_815501 ?auto_815505 ) ) ( not ( = ?auto_815501 ?auto_815506 ) ) ( not ( = ?auto_815501 ?auto_815507 ) ) ( not ( = ?auto_815501 ?auto_815508 ) ) ( not ( = ?auto_815501 ?auto_815509 ) ) ( not ( = ?auto_815501 ?auto_815510 ) ) ( not ( = ?auto_815501 ?auto_815511 ) ) ( not ( = ?auto_815502 ?auto_815503 ) ) ( not ( = ?auto_815502 ?auto_815504 ) ) ( not ( = ?auto_815502 ?auto_815505 ) ) ( not ( = ?auto_815502 ?auto_815506 ) ) ( not ( = ?auto_815502 ?auto_815507 ) ) ( not ( = ?auto_815502 ?auto_815508 ) ) ( not ( = ?auto_815502 ?auto_815509 ) ) ( not ( = ?auto_815502 ?auto_815510 ) ) ( not ( = ?auto_815502 ?auto_815511 ) ) ( not ( = ?auto_815503 ?auto_815504 ) ) ( not ( = ?auto_815503 ?auto_815505 ) ) ( not ( = ?auto_815503 ?auto_815506 ) ) ( not ( = ?auto_815503 ?auto_815507 ) ) ( not ( = ?auto_815503 ?auto_815508 ) ) ( not ( = ?auto_815503 ?auto_815509 ) ) ( not ( = ?auto_815503 ?auto_815510 ) ) ( not ( = ?auto_815503 ?auto_815511 ) ) ( not ( = ?auto_815504 ?auto_815505 ) ) ( not ( = ?auto_815504 ?auto_815506 ) ) ( not ( = ?auto_815504 ?auto_815507 ) ) ( not ( = ?auto_815504 ?auto_815508 ) ) ( not ( = ?auto_815504 ?auto_815509 ) ) ( not ( = ?auto_815504 ?auto_815510 ) ) ( not ( = ?auto_815504 ?auto_815511 ) ) ( not ( = ?auto_815505 ?auto_815506 ) ) ( not ( = ?auto_815505 ?auto_815507 ) ) ( not ( = ?auto_815505 ?auto_815508 ) ) ( not ( = ?auto_815505 ?auto_815509 ) ) ( not ( = ?auto_815505 ?auto_815510 ) ) ( not ( = ?auto_815505 ?auto_815511 ) ) ( not ( = ?auto_815506 ?auto_815507 ) ) ( not ( = ?auto_815506 ?auto_815508 ) ) ( not ( = ?auto_815506 ?auto_815509 ) ) ( not ( = ?auto_815506 ?auto_815510 ) ) ( not ( = ?auto_815506 ?auto_815511 ) ) ( not ( = ?auto_815507 ?auto_815508 ) ) ( not ( = ?auto_815507 ?auto_815509 ) ) ( not ( = ?auto_815507 ?auto_815510 ) ) ( not ( = ?auto_815507 ?auto_815511 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_815508 ?auto_815509 ?auto_815510 )
      ( MAKE-10CRATE-VERIFY ?auto_815500 ?auto_815501 ?auto_815502 ?auto_815503 ?auto_815504 ?auto_815505 ?auto_815506 ?auto_815507 ?auto_815508 ?auto_815509 ?auto_815510 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_822743 - SURFACE
      ?auto_822744 - SURFACE
      ?auto_822745 - SURFACE
      ?auto_822746 - SURFACE
      ?auto_822747 - SURFACE
      ?auto_822748 - SURFACE
      ?auto_822749 - SURFACE
      ?auto_822750 - SURFACE
      ?auto_822751 - SURFACE
      ?auto_822752 - SURFACE
      ?auto_822753 - SURFACE
      ?auto_822754 - SURFACE
    )
    :vars
    (
      ?auto_822756 - HOIST
      ?auto_822755 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_822756 ?auto_822755 ) ( SURFACE-AT ?auto_822753 ?auto_822755 ) ( CLEAR ?auto_822753 ) ( LIFTING ?auto_822756 ?auto_822754 ) ( IS-CRATE ?auto_822754 ) ( not ( = ?auto_822753 ?auto_822754 ) ) ( ON ?auto_822744 ?auto_822743 ) ( ON ?auto_822745 ?auto_822744 ) ( ON ?auto_822746 ?auto_822745 ) ( ON ?auto_822747 ?auto_822746 ) ( ON ?auto_822748 ?auto_822747 ) ( ON ?auto_822749 ?auto_822748 ) ( ON ?auto_822750 ?auto_822749 ) ( ON ?auto_822751 ?auto_822750 ) ( ON ?auto_822752 ?auto_822751 ) ( ON ?auto_822753 ?auto_822752 ) ( not ( = ?auto_822743 ?auto_822744 ) ) ( not ( = ?auto_822743 ?auto_822745 ) ) ( not ( = ?auto_822743 ?auto_822746 ) ) ( not ( = ?auto_822743 ?auto_822747 ) ) ( not ( = ?auto_822743 ?auto_822748 ) ) ( not ( = ?auto_822743 ?auto_822749 ) ) ( not ( = ?auto_822743 ?auto_822750 ) ) ( not ( = ?auto_822743 ?auto_822751 ) ) ( not ( = ?auto_822743 ?auto_822752 ) ) ( not ( = ?auto_822743 ?auto_822753 ) ) ( not ( = ?auto_822743 ?auto_822754 ) ) ( not ( = ?auto_822744 ?auto_822745 ) ) ( not ( = ?auto_822744 ?auto_822746 ) ) ( not ( = ?auto_822744 ?auto_822747 ) ) ( not ( = ?auto_822744 ?auto_822748 ) ) ( not ( = ?auto_822744 ?auto_822749 ) ) ( not ( = ?auto_822744 ?auto_822750 ) ) ( not ( = ?auto_822744 ?auto_822751 ) ) ( not ( = ?auto_822744 ?auto_822752 ) ) ( not ( = ?auto_822744 ?auto_822753 ) ) ( not ( = ?auto_822744 ?auto_822754 ) ) ( not ( = ?auto_822745 ?auto_822746 ) ) ( not ( = ?auto_822745 ?auto_822747 ) ) ( not ( = ?auto_822745 ?auto_822748 ) ) ( not ( = ?auto_822745 ?auto_822749 ) ) ( not ( = ?auto_822745 ?auto_822750 ) ) ( not ( = ?auto_822745 ?auto_822751 ) ) ( not ( = ?auto_822745 ?auto_822752 ) ) ( not ( = ?auto_822745 ?auto_822753 ) ) ( not ( = ?auto_822745 ?auto_822754 ) ) ( not ( = ?auto_822746 ?auto_822747 ) ) ( not ( = ?auto_822746 ?auto_822748 ) ) ( not ( = ?auto_822746 ?auto_822749 ) ) ( not ( = ?auto_822746 ?auto_822750 ) ) ( not ( = ?auto_822746 ?auto_822751 ) ) ( not ( = ?auto_822746 ?auto_822752 ) ) ( not ( = ?auto_822746 ?auto_822753 ) ) ( not ( = ?auto_822746 ?auto_822754 ) ) ( not ( = ?auto_822747 ?auto_822748 ) ) ( not ( = ?auto_822747 ?auto_822749 ) ) ( not ( = ?auto_822747 ?auto_822750 ) ) ( not ( = ?auto_822747 ?auto_822751 ) ) ( not ( = ?auto_822747 ?auto_822752 ) ) ( not ( = ?auto_822747 ?auto_822753 ) ) ( not ( = ?auto_822747 ?auto_822754 ) ) ( not ( = ?auto_822748 ?auto_822749 ) ) ( not ( = ?auto_822748 ?auto_822750 ) ) ( not ( = ?auto_822748 ?auto_822751 ) ) ( not ( = ?auto_822748 ?auto_822752 ) ) ( not ( = ?auto_822748 ?auto_822753 ) ) ( not ( = ?auto_822748 ?auto_822754 ) ) ( not ( = ?auto_822749 ?auto_822750 ) ) ( not ( = ?auto_822749 ?auto_822751 ) ) ( not ( = ?auto_822749 ?auto_822752 ) ) ( not ( = ?auto_822749 ?auto_822753 ) ) ( not ( = ?auto_822749 ?auto_822754 ) ) ( not ( = ?auto_822750 ?auto_822751 ) ) ( not ( = ?auto_822750 ?auto_822752 ) ) ( not ( = ?auto_822750 ?auto_822753 ) ) ( not ( = ?auto_822750 ?auto_822754 ) ) ( not ( = ?auto_822751 ?auto_822752 ) ) ( not ( = ?auto_822751 ?auto_822753 ) ) ( not ( = ?auto_822751 ?auto_822754 ) ) ( not ( = ?auto_822752 ?auto_822753 ) ) ( not ( = ?auto_822752 ?auto_822754 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_822753 ?auto_822754 )
      ( MAKE-11CRATE-VERIFY ?auto_822743 ?auto_822744 ?auto_822745 ?auto_822746 ?auto_822747 ?auto_822748 ?auto_822749 ?auto_822750 ?auto_822751 ?auto_822752 ?auto_822753 ?auto_822754 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_822852 - SURFACE
      ?auto_822853 - SURFACE
      ?auto_822854 - SURFACE
      ?auto_822855 - SURFACE
      ?auto_822856 - SURFACE
      ?auto_822857 - SURFACE
      ?auto_822858 - SURFACE
      ?auto_822859 - SURFACE
      ?auto_822860 - SURFACE
      ?auto_822861 - SURFACE
      ?auto_822862 - SURFACE
      ?auto_822863 - SURFACE
    )
    :vars
    (
      ?auto_822864 - HOIST
      ?auto_822865 - PLACE
      ?auto_822866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_822864 ?auto_822865 ) ( SURFACE-AT ?auto_822862 ?auto_822865 ) ( CLEAR ?auto_822862 ) ( IS-CRATE ?auto_822863 ) ( not ( = ?auto_822862 ?auto_822863 ) ) ( TRUCK-AT ?auto_822866 ?auto_822865 ) ( AVAILABLE ?auto_822864 ) ( IN ?auto_822863 ?auto_822866 ) ( ON ?auto_822862 ?auto_822861 ) ( not ( = ?auto_822861 ?auto_822862 ) ) ( not ( = ?auto_822861 ?auto_822863 ) ) ( ON ?auto_822853 ?auto_822852 ) ( ON ?auto_822854 ?auto_822853 ) ( ON ?auto_822855 ?auto_822854 ) ( ON ?auto_822856 ?auto_822855 ) ( ON ?auto_822857 ?auto_822856 ) ( ON ?auto_822858 ?auto_822857 ) ( ON ?auto_822859 ?auto_822858 ) ( ON ?auto_822860 ?auto_822859 ) ( ON ?auto_822861 ?auto_822860 ) ( not ( = ?auto_822852 ?auto_822853 ) ) ( not ( = ?auto_822852 ?auto_822854 ) ) ( not ( = ?auto_822852 ?auto_822855 ) ) ( not ( = ?auto_822852 ?auto_822856 ) ) ( not ( = ?auto_822852 ?auto_822857 ) ) ( not ( = ?auto_822852 ?auto_822858 ) ) ( not ( = ?auto_822852 ?auto_822859 ) ) ( not ( = ?auto_822852 ?auto_822860 ) ) ( not ( = ?auto_822852 ?auto_822861 ) ) ( not ( = ?auto_822852 ?auto_822862 ) ) ( not ( = ?auto_822852 ?auto_822863 ) ) ( not ( = ?auto_822853 ?auto_822854 ) ) ( not ( = ?auto_822853 ?auto_822855 ) ) ( not ( = ?auto_822853 ?auto_822856 ) ) ( not ( = ?auto_822853 ?auto_822857 ) ) ( not ( = ?auto_822853 ?auto_822858 ) ) ( not ( = ?auto_822853 ?auto_822859 ) ) ( not ( = ?auto_822853 ?auto_822860 ) ) ( not ( = ?auto_822853 ?auto_822861 ) ) ( not ( = ?auto_822853 ?auto_822862 ) ) ( not ( = ?auto_822853 ?auto_822863 ) ) ( not ( = ?auto_822854 ?auto_822855 ) ) ( not ( = ?auto_822854 ?auto_822856 ) ) ( not ( = ?auto_822854 ?auto_822857 ) ) ( not ( = ?auto_822854 ?auto_822858 ) ) ( not ( = ?auto_822854 ?auto_822859 ) ) ( not ( = ?auto_822854 ?auto_822860 ) ) ( not ( = ?auto_822854 ?auto_822861 ) ) ( not ( = ?auto_822854 ?auto_822862 ) ) ( not ( = ?auto_822854 ?auto_822863 ) ) ( not ( = ?auto_822855 ?auto_822856 ) ) ( not ( = ?auto_822855 ?auto_822857 ) ) ( not ( = ?auto_822855 ?auto_822858 ) ) ( not ( = ?auto_822855 ?auto_822859 ) ) ( not ( = ?auto_822855 ?auto_822860 ) ) ( not ( = ?auto_822855 ?auto_822861 ) ) ( not ( = ?auto_822855 ?auto_822862 ) ) ( not ( = ?auto_822855 ?auto_822863 ) ) ( not ( = ?auto_822856 ?auto_822857 ) ) ( not ( = ?auto_822856 ?auto_822858 ) ) ( not ( = ?auto_822856 ?auto_822859 ) ) ( not ( = ?auto_822856 ?auto_822860 ) ) ( not ( = ?auto_822856 ?auto_822861 ) ) ( not ( = ?auto_822856 ?auto_822862 ) ) ( not ( = ?auto_822856 ?auto_822863 ) ) ( not ( = ?auto_822857 ?auto_822858 ) ) ( not ( = ?auto_822857 ?auto_822859 ) ) ( not ( = ?auto_822857 ?auto_822860 ) ) ( not ( = ?auto_822857 ?auto_822861 ) ) ( not ( = ?auto_822857 ?auto_822862 ) ) ( not ( = ?auto_822857 ?auto_822863 ) ) ( not ( = ?auto_822858 ?auto_822859 ) ) ( not ( = ?auto_822858 ?auto_822860 ) ) ( not ( = ?auto_822858 ?auto_822861 ) ) ( not ( = ?auto_822858 ?auto_822862 ) ) ( not ( = ?auto_822858 ?auto_822863 ) ) ( not ( = ?auto_822859 ?auto_822860 ) ) ( not ( = ?auto_822859 ?auto_822861 ) ) ( not ( = ?auto_822859 ?auto_822862 ) ) ( not ( = ?auto_822859 ?auto_822863 ) ) ( not ( = ?auto_822860 ?auto_822861 ) ) ( not ( = ?auto_822860 ?auto_822862 ) ) ( not ( = ?auto_822860 ?auto_822863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_822861 ?auto_822862 ?auto_822863 )
      ( MAKE-11CRATE-VERIFY ?auto_822852 ?auto_822853 ?auto_822854 ?auto_822855 ?auto_822856 ?auto_822857 ?auto_822858 ?auto_822859 ?auto_822860 ?auto_822861 ?auto_822862 ?auto_822863 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_822973 - SURFACE
      ?auto_822974 - SURFACE
      ?auto_822975 - SURFACE
      ?auto_822976 - SURFACE
      ?auto_822977 - SURFACE
      ?auto_822978 - SURFACE
      ?auto_822979 - SURFACE
      ?auto_822980 - SURFACE
      ?auto_822981 - SURFACE
      ?auto_822982 - SURFACE
      ?auto_822983 - SURFACE
      ?auto_822984 - SURFACE
    )
    :vars
    (
      ?auto_822987 - HOIST
      ?auto_822988 - PLACE
      ?auto_822986 - TRUCK
      ?auto_822985 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_822987 ?auto_822988 ) ( SURFACE-AT ?auto_822983 ?auto_822988 ) ( CLEAR ?auto_822983 ) ( IS-CRATE ?auto_822984 ) ( not ( = ?auto_822983 ?auto_822984 ) ) ( AVAILABLE ?auto_822987 ) ( IN ?auto_822984 ?auto_822986 ) ( ON ?auto_822983 ?auto_822982 ) ( not ( = ?auto_822982 ?auto_822983 ) ) ( not ( = ?auto_822982 ?auto_822984 ) ) ( TRUCK-AT ?auto_822986 ?auto_822985 ) ( not ( = ?auto_822985 ?auto_822988 ) ) ( ON ?auto_822974 ?auto_822973 ) ( ON ?auto_822975 ?auto_822974 ) ( ON ?auto_822976 ?auto_822975 ) ( ON ?auto_822977 ?auto_822976 ) ( ON ?auto_822978 ?auto_822977 ) ( ON ?auto_822979 ?auto_822978 ) ( ON ?auto_822980 ?auto_822979 ) ( ON ?auto_822981 ?auto_822980 ) ( ON ?auto_822982 ?auto_822981 ) ( not ( = ?auto_822973 ?auto_822974 ) ) ( not ( = ?auto_822973 ?auto_822975 ) ) ( not ( = ?auto_822973 ?auto_822976 ) ) ( not ( = ?auto_822973 ?auto_822977 ) ) ( not ( = ?auto_822973 ?auto_822978 ) ) ( not ( = ?auto_822973 ?auto_822979 ) ) ( not ( = ?auto_822973 ?auto_822980 ) ) ( not ( = ?auto_822973 ?auto_822981 ) ) ( not ( = ?auto_822973 ?auto_822982 ) ) ( not ( = ?auto_822973 ?auto_822983 ) ) ( not ( = ?auto_822973 ?auto_822984 ) ) ( not ( = ?auto_822974 ?auto_822975 ) ) ( not ( = ?auto_822974 ?auto_822976 ) ) ( not ( = ?auto_822974 ?auto_822977 ) ) ( not ( = ?auto_822974 ?auto_822978 ) ) ( not ( = ?auto_822974 ?auto_822979 ) ) ( not ( = ?auto_822974 ?auto_822980 ) ) ( not ( = ?auto_822974 ?auto_822981 ) ) ( not ( = ?auto_822974 ?auto_822982 ) ) ( not ( = ?auto_822974 ?auto_822983 ) ) ( not ( = ?auto_822974 ?auto_822984 ) ) ( not ( = ?auto_822975 ?auto_822976 ) ) ( not ( = ?auto_822975 ?auto_822977 ) ) ( not ( = ?auto_822975 ?auto_822978 ) ) ( not ( = ?auto_822975 ?auto_822979 ) ) ( not ( = ?auto_822975 ?auto_822980 ) ) ( not ( = ?auto_822975 ?auto_822981 ) ) ( not ( = ?auto_822975 ?auto_822982 ) ) ( not ( = ?auto_822975 ?auto_822983 ) ) ( not ( = ?auto_822975 ?auto_822984 ) ) ( not ( = ?auto_822976 ?auto_822977 ) ) ( not ( = ?auto_822976 ?auto_822978 ) ) ( not ( = ?auto_822976 ?auto_822979 ) ) ( not ( = ?auto_822976 ?auto_822980 ) ) ( not ( = ?auto_822976 ?auto_822981 ) ) ( not ( = ?auto_822976 ?auto_822982 ) ) ( not ( = ?auto_822976 ?auto_822983 ) ) ( not ( = ?auto_822976 ?auto_822984 ) ) ( not ( = ?auto_822977 ?auto_822978 ) ) ( not ( = ?auto_822977 ?auto_822979 ) ) ( not ( = ?auto_822977 ?auto_822980 ) ) ( not ( = ?auto_822977 ?auto_822981 ) ) ( not ( = ?auto_822977 ?auto_822982 ) ) ( not ( = ?auto_822977 ?auto_822983 ) ) ( not ( = ?auto_822977 ?auto_822984 ) ) ( not ( = ?auto_822978 ?auto_822979 ) ) ( not ( = ?auto_822978 ?auto_822980 ) ) ( not ( = ?auto_822978 ?auto_822981 ) ) ( not ( = ?auto_822978 ?auto_822982 ) ) ( not ( = ?auto_822978 ?auto_822983 ) ) ( not ( = ?auto_822978 ?auto_822984 ) ) ( not ( = ?auto_822979 ?auto_822980 ) ) ( not ( = ?auto_822979 ?auto_822981 ) ) ( not ( = ?auto_822979 ?auto_822982 ) ) ( not ( = ?auto_822979 ?auto_822983 ) ) ( not ( = ?auto_822979 ?auto_822984 ) ) ( not ( = ?auto_822980 ?auto_822981 ) ) ( not ( = ?auto_822980 ?auto_822982 ) ) ( not ( = ?auto_822980 ?auto_822983 ) ) ( not ( = ?auto_822980 ?auto_822984 ) ) ( not ( = ?auto_822981 ?auto_822982 ) ) ( not ( = ?auto_822981 ?auto_822983 ) ) ( not ( = ?auto_822981 ?auto_822984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_822982 ?auto_822983 ?auto_822984 )
      ( MAKE-11CRATE-VERIFY ?auto_822973 ?auto_822974 ?auto_822975 ?auto_822976 ?auto_822977 ?auto_822978 ?auto_822979 ?auto_822980 ?auto_822981 ?auto_822982 ?auto_822983 ?auto_822984 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_823105 - SURFACE
      ?auto_823106 - SURFACE
      ?auto_823107 - SURFACE
      ?auto_823108 - SURFACE
      ?auto_823109 - SURFACE
      ?auto_823110 - SURFACE
      ?auto_823111 - SURFACE
      ?auto_823112 - SURFACE
      ?auto_823113 - SURFACE
      ?auto_823114 - SURFACE
      ?auto_823115 - SURFACE
      ?auto_823116 - SURFACE
    )
    :vars
    (
      ?auto_823117 - HOIST
      ?auto_823118 - PLACE
      ?auto_823119 - TRUCK
      ?auto_823120 - PLACE
      ?auto_823121 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_823117 ?auto_823118 ) ( SURFACE-AT ?auto_823115 ?auto_823118 ) ( CLEAR ?auto_823115 ) ( IS-CRATE ?auto_823116 ) ( not ( = ?auto_823115 ?auto_823116 ) ) ( AVAILABLE ?auto_823117 ) ( ON ?auto_823115 ?auto_823114 ) ( not ( = ?auto_823114 ?auto_823115 ) ) ( not ( = ?auto_823114 ?auto_823116 ) ) ( TRUCK-AT ?auto_823119 ?auto_823120 ) ( not ( = ?auto_823120 ?auto_823118 ) ) ( HOIST-AT ?auto_823121 ?auto_823120 ) ( LIFTING ?auto_823121 ?auto_823116 ) ( not ( = ?auto_823117 ?auto_823121 ) ) ( ON ?auto_823106 ?auto_823105 ) ( ON ?auto_823107 ?auto_823106 ) ( ON ?auto_823108 ?auto_823107 ) ( ON ?auto_823109 ?auto_823108 ) ( ON ?auto_823110 ?auto_823109 ) ( ON ?auto_823111 ?auto_823110 ) ( ON ?auto_823112 ?auto_823111 ) ( ON ?auto_823113 ?auto_823112 ) ( ON ?auto_823114 ?auto_823113 ) ( not ( = ?auto_823105 ?auto_823106 ) ) ( not ( = ?auto_823105 ?auto_823107 ) ) ( not ( = ?auto_823105 ?auto_823108 ) ) ( not ( = ?auto_823105 ?auto_823109 ) ) ( not ( = ?auto_823105 ?auto_823110 ) ) ( not ( = ?auto_823105 ?auto_823111 ) ) ( not ( = ?auto_823105 ?auto_823112 ) ) ( not ( = ?auto_823105 ?auto_823113 ) ) ( not ( = ?auto_823105 ?auto_823114 ) ) ( not ( = ?auto_823105 ?auto_823115 ) ) ( not ( = ?auto_823105 ?auto_823116 ) ) ( not ( = ?auto_823106 ?auto_823107 ) ) ( not ( = ?auto_823106 ?auto_823108 ) ) ( not ( = ?auto_823106 ?auto_823109 ) ) ( not ( = ?auto_823106 ?auto_823110 ) ) ( not ( = ?auto_823106 ?auto_823111 ) ) ( not ( = ?auto_823106 ?auto_823112 ) ) ( not ( = ?auto_823106 ?auto_823113 ) ) ( not ( = ?auto_823106 ?auto_823114 ) ) ( not ( = ?auto_823106 ?auto_823115 ) ) ( not ( = ?auto_823106 ?auto_823116 ) ) ( not ( = ?auto_823107 ?auto_823108 ) ) ( not ( = ?auto_823107 ?auto_823109 ) ) ( not ( = ?auto_823107 ?auto_823110 ) ) ( not ( = ?auto_823107 ?auto_823111 ) ) ( not ( = ?auto_823107 ?auto_823112 ) ) ( not ( = ?auto_823107 ?auto_823113 ) ) ( not ( = ?auto_823107 ?auto_823114 ) ) ( not ( = ?auto_823107 ?auto_823115 ) ) ( not ( = ?auto_823107 ?auto_823116 ) ) ( not ( = ?auto_823108 ?auto_823109 ) ) ( not ( = ?auto_823108 ?auto_823110 ) ) ( not ( = ?auto_823108 ?auto_823111 ) ) ( not ( = ?auto_823108 ?auto_823112 ) ) ( not ( = ?auto_823108 ?auto_823113 ) ) ( not ( = ?auto_823108 ?auto_823114 ) ) ( not ( = ?auto_823108 ?auto_823115 ) ) ( not ( = ?auto_823108 ?auto_823116 ) ) ( not ( = ?auto_823109 ?auto_823110 ) ) ( not ( = ?auto_823109 ?auto_823111 ) ) ( not ( = ?auto_823109 ?auto_823112 ) ) ( not ( = ?auto_823109 ?auto_823113 ) ) ( not ( = ?auto_823109 ?auto_823114 ) ) ( not ( = ?auto_823109 ?auto_823115 ) ) ( not ( = ?auto_823109 ?auto_823116 ) ) ( not ( = ?auto_823110 ?auto_823111 ) ) ( not ( = ?auto_823110 ?auto_823112 ) ) ( not ( = ?auto_823110 ?auto_823113 ) ) ( not ( = ?auto_823110 ?auto_823114 ) ) ( not ( = ?auto_823110 ?auto_823115 ) ) ( not ( = ?auto_823110 ?auto_823116 ) ) ( not ( = ?auto_823111 ?auto_823112 ) ) ( not ( = ?auto_823111 ?auto_823113 ) ) ( not ( = ?auto_823111 ?auto_823114 ) ) ( not ( = ?auto_823111 ?auto_823115 ) ) ( not ( = ?auto_823111 ?auto_823116 ) ) ( not ( = ?auto_823112 ?auto_823113 ) ) ( not ( = ?auto_823112 ?auto_823114 ) ) ( not ( = ?auto_823112 ?auto_823115 ) ) ( not ( = ?auto_823112 ?auto_823116 ) ) ( not ( = ?auto_823113 ?auto_823114 ) ) ( not ( = ?auto_823113 ?auto_823115 ) ) ( not ( = ?auto_823113 ?auto_823116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823114 ?auto_823115 ?auto_823116 )
      ( MAKE-11CRATE-VERIFY ?auto_823105 ?auto_823106 ?auto_823107 ?auto_823108 ?auto_823109 ?auto_823110 ?auto_823111 ?auto_823112 ?auto_823113 ?auto_823114 ?auto_823115 ?auto_823116 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_823248 - SURFACE
      ?auto_823249 - SURFACE
      ?auto_823250 - SURFACE
      ?auto_823251 - SURFACE
      ?auto_823252 - SURFACE
      ?auto_823253 - SURFACE
      ?auto_823254 - SURFACE
      ?auto_823255 - SURFACE
      ?auto_823256 - SURFACE
      ?auto_823257 - SURFACE
      ?auto_823258 - SURFACE
      ?auto_823259 - SURFACE
    )
    :vars
    (
      ?auto_823261 - HOIST
      ?auto_823264 - PLACE
      ?auto_823263 - TRUCK
      ?auto_823260 - PLACE
      ?auto_823262 - HOIST
      ?auto_823265 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_823261 ?auto_823264 ) ( SURFACE-AT ?auto_823258 ?auto_823264 ) ( CLEAR ?auto_823258 ) ( IS-CRATE ?auto_823259 ) ( not ( = ?auto_823258 ?auto_823259 ) ) ( AVAILABLE ?auto_823261 ) ( ON ?auto_823258 ?auto_823257 ) ( not ( = ?auto_823257 ?auto_823258 ) ) ( not ( = ?auto_823257 ?auto_823259 ) ) ( TRUCK-AT ?auto_823263 ?auto_823260 ) ( not ( = ?auto_823260 ?auto_823264 ) ) ( HOIST-AT ?auto_823262 ?auto_823260 ) ( not ( = ?auto_823261 ?auto_823262 ) ) ( AVAILABLE ?auto_823262 ) ( SURFACE-AT ?auto_823259 ?auto_823260 ) ( ON ?auto_823259 ?auto_823265 ) ( CLEAR ?auto_823259 ) ( not ( = ?auto_823258 ?auto_823265 ) ) ( not ( = ?auto_823259 ?auto_823265 ) ) ( not ( = ?auto_823257 ?auto_823265 ) ) ( ON ?auto_823249 ?auto_823248 ) ( ON ?auto_823250 ?auto_823249 ) ( ON ?auto_823251 ?auto_823250 ) ( ON ?auto_823252 ?auto_823251 ) ( ON ?auto_823253 ?auto_823252 ) ( ON ?auto_823254 ?auto_823253 ) ( ON ?auto_823255 ?auto_823254 ) ( ON ?auto_823256 ?auto_823255 ) ( ON ?auto_823257 ?auto_823256 ) ( not ( = ?auto_823248 ?auto_823249 ) ) ( not ( = ?auto_823248 ?auto_823250 ) ) ( not ( = ?auto_823248 ?auto_823251 ) ) ( not ( = ?auto_823248 ?auto_823252 ) ) ( not ( = ?auto_823248 ?auto_823253 ) ) ( not ( = ?auto_823248 ?auto_823254 ) ) ( not ( = ?auto_823248 ?auto_823255 ) ) ( not ( = ?auto_823248 ?auto_823256 ) ) ( not ( = ?auto_823248 ?auto_823257 ) ) ( not ( = ?auto_823248 ?auto_823258 ) ) ( not ( = ?auto_823248 ?auto_823259 ) ) ( not ( = ?auto_823248 ?auto_823265 ) ) ( not ( = ?auto_823249 ?auto_823250 ) ) ( not ( = ?auto_823249 ?auto_823251 ) ) ( not ( = ?auto_823249 ?auto_823252 ) ) ( not ( = ?auto_823249 ?auto_823253 ) ) ( not ( = ?auto_823249 ?auto_823254 ) ) ( not ( = ?auto_823249 ?auto_823255 ) ) ( not ( = ?auto_823249 ?auto_823256 ) ) ( not ( = ?auto_823249 ?auto_823257 ) ) ( not ( = ?auto_823249 ?auto_823258 ) ) ( not ( = ?auto_823249 ?auto_823259 ) ) ( not ( = ?auto_823249 ?auto_823265 ) ) ( not ( = ?auto_823250 ?auto_823251 ) ) ( not ( = ?auto_823250 ?auto_823252 ) ) ( not ( = ?auto_823250 ?auto_823253 ) ) ( not ( = ?auto_823250 ?auto_823254 ) ) ( not ( = ?auto_823250 ?auto_823255 ) ) ( not ( = ?auto_823250 ?auto_823256 ) ) ( not ( = ?auto_823250 ?auto_823257 ) ) ( not ( = ?auto_823250 ?auto_823258 ) ) ( not ( = ?auto_823250 ?auto_823259 ) ) ( not ( = ?auto_823250 ?auto_823265 ) ) ( not ( = ?auto_823251 ?auto_823252 ) ) ( not ( = ?auto_823251 ?auto_823253 ) ) ( not ( = ?auto_823251 ?auto_823254 ) ) ( not ( = ?auto_823251 ?auto_823255 ) ) ( not ( = ?auto_823251 ?auto_823256 ) ) ( not ( = ?auto_823251 ?auto_823257 ) ) ( not ( = ?auto_823251 ?auto_823258 ) ) ( not ( = ?auto_823251 ?auto_823259 ) ) ( not ( = ?auto_823251 ?auto_823265 ) ) ( not ( = ?auto_823252 ?auto_823253 ) ) ( not ( = ?auto_823252 ?auto_823254 ) ) ( not ( = ?auto_823252 ?auto_823255 ) ) ( not ( = ?auto_823252 ?auto_823256 ) ) ( not ( = ?auto_823252 ?auto_823257 ) ) ( not ( = ?auto_823252 ?auto_823258 ) ) ( not ( = ?auto_823252 ?auto_823259 ) ) ( not ( = ?auto_823252 ?auto_823265 ) ) ( not ( = ?auto_823253 ?auto_823254 ) ) ( not ( = ?auto_823253 ?auto_823255 ) ) ( not ( = ?auto_823253 ?auto_823256 ) ) ( not ( = ?auto_823253 ?auto_823257 ) ) ( not ( = ?auto_823253 ?auto_823258 ) ) ( not ( = ?auto_823253 ?auto_823259 ) ) ( not ( = ?auto_823253 ?auto_823265 ) ) ( not ( = ?auto_823254 ?auto_823255 ) ) ( not ( = ?auto_823254 ?auto_823256 ) ) ( not ( = ?auto_823254 ?auto_823257 ) ) ( not ( = ?auto_823254 ?auto_823258 ) ) ( not ( = ?auto_823254 ?auto_823259 ) ) ( not ( = ?auto_823254 ?auto_823265 ) ) ( not ( = ?auto_823255 ?auto_823256 ) ) ( not ( = ?auto_823255 ?auto_823257 ) ) ( not ( = ?auto_823255 ?auto_823258 ) ) ( not ( = ?auto_823255 ?auto_823259 ) ) ( not ( = ?auto_823255 ?auto_823265 ) ) ( not ( = ?auto_823256 ?auto_823257 ) ) ( not ( = ?auto_823256 ?auto_823258 ) ) ( not ( = ?auto_823256 ?auto_823259 ) ) ( not ( = ?auto_823256 ?auto_823265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823257 ?auto_823258 ?auto_823259 )
      ( MAKE-11CRATE-VERIFY ?auto_823248 ?auto_823249 ?auto_823250 ?auto_823251 ?auto_823252 ?auto_823253 ?auto_823254 ?auto_823255 ?auto_823256 ?auto_823257 ?auto_823258 ?auto_823259 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_823392 - SURFACE
      ?auto_823393 - SURFACE
      ?auto_823394 - SURFACE
      ?auto_823395 - SURFACE
      ?auto_823396 - SURFACE
      ?auto_823397 - SURFACE
      ?auto_823398 - SURFACE
      ?auto_823399 - SURFACE
      ?auto_823400 - SURFACE
      ?auto_823401 - SURFACE
      ?auto_823402 - SURFACE
      ?auto_823403 - SURFACE
    )
    :vars
    (
      ?auto_823408 - HOIST
      ?auto_823409 - PLACE
      ?auto_823404 - PLACE
      ?auto_823405 - HOIST
      ?auto_823406 - SURFACE
      ?auto_823407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_823408 ?auto_823409 ) ( SURFACE-AT ?auto_823402 ?auto_823409 ) ( CLEAR ?auto_823402 ) ( IS-CRATE ?auto_823403 ) ( not ( = ?auto_823402 ?auto_823403 ) ) ( AVAILABLE ?auto_823408 ) ( ON ?auto_823402 ?auto_823401 ) ( not ( = ?auto_823401 ?auto_823402 ) ) ( not ( = ?auto_823401 ?auto_823403 ) ) ( not ( = ?auto_823404 ?auto_823409 ) ) ( HOIST-AT ?auto_823405 ?auto_823404 ) ( not ( = ?auto_823408 ?auto_823405 ) ) ( AVAILABLE ?auto_823405 ) ( SURFACE-AT ?auto_823403 ?auto_823404 ) ( ON ?auto_823403 ?auto_823406 ) ( CLEAR ?auto_823403 ) ( not ( = ?auto_823402 ?auto_823406 ) ) ( not ( = ?auto_823403 ?auto_823406 ) ) ( not ( = ?auto_823401 ?auto_823406 ) ) ( TRUCK-AT ?auto_823407 ?auto_823409 ) ( ON ?auto_823393 ?auto_823392 ) ( ON ?auto_823394 ?auto_823393 ) ( ON ?auto_823395 ?auto_823394 ) ( ON ?auto_823396 ?auto_823395 ) ( ON ?auto_823397 ?auto_823396 ) ( ON ?auto_823398 ?auto_823397 ) ( ON ?auto_823399 ?auto_823398 ) ( ON ?auto_823400 ?auto_823399 ) ( ON ?auto_823401 ?auto_823400 ) ( not ( = ?auto_823392 ?auto_823393 ) ) ( not ( = ?auto_823392 ?auto_823394 ) ) ( not ( = ?auto_823392 ?auto_823395 ) ) ( not ( = ?auto_823392 ?auto_823396 ) ) ( not ( = ?auto_823392 ?auto_823397 ) ) ( not ( = ?auto_823392 ?auto_823398 ) ) ( not ( = ?auto_823392 ?auto_823399 ) ) ( not ( = ?auto_823392 ?auto_823400 ) ) ( not ( = ?auto_823392 ?auto_823401 ) ) ( not ( = ?auto_823392 ?auto_823402 ) ) ( not ( = ?auto_823392 ?auto_823403 ) ) ( not ( = ?auto_823392 ?auto_823406 ) ) ( not ( = ?auto_823393 ?auto_823394 ) ) ( not ( = ?auto_823393 ?auto_823395 ) ) ( not ( = ?auto_823393 ?auto_823396 ) ) ( not ( = ?auto_823393 ?auto_823397 ) ) ( not ( = ?auto_823393 ?auto_823398 ) ) ( not ( = ?auto_823393 ?auto_823399 ) ) ( not ( = ?auto_823393 ?auto_823400 ) ) ( not ( = ?auto_823393 ?auto_823401 ) ) ( not ( = ?auto_823393 ?auto_823402 ) ) ( not ( = ?auto_823393 ?auto_823403 ) ) ( not ( = ?auto_823393 ?auto_823406 ) ) ( not ( = ?auto_823394 ?auto_823395 ) ) ( not ( = ?auto_823394 ?auto_823396 ) ) ( not ( = ?auto_823394 ?auto_823397 ) ) ( not ( = ?auto_823394 ?auto_823398 ) ) ( not ( = ?auto_823394 ?auto_823399 ) ) ( not ( = ?auto_823394 ?auto_823400 ) ) ( not ( = ?auto_823394 ?auto_823401 ) ) ( not ( = ?auto_823394 ?auto_823402 ) ) ( not ( = ?auto_823394 ?auto_823403 ) ) ( not ( = ?auto_823394 ?auto_823406 ) ) ( not ( = ?auto_823395 ?auto_823396 ) ) ( not ( = ?auto_823395 ?auto_823397 ) ) ( not ( = ?auto_823395 ?auto_823398 ) ) ( not ( = ?auto_823395 ?auto_823399 ) ) ( not ( = ?auto_823395 ?auto_823400 ) ) ( not ( = ?auto_823395 ?auto_823401 ) ) ( not ( = ?auto_823395 ?auto_823402 ) ) ( not ( = ?auto_823395 ?auto_823403 ) ) ( not ( = ?auto_823395 ?auto_823406 ) ) ( not ( = ?auto_823396 ?auto_823397 ) ) ( not ( = ?auto_823396 ?auto_823398 ) ) ( not ( = ?auto_823396 ?auto_823399 ) ) ( not ( = ?auto_823396 ?auto_823400 ) ) ( not ( = ?auto_823396 ?auto_823401 ) ) ( not ( = ?auto_823396 ?auto_823402 ) ) ( not ( = ?auto_823396 ?auto_823403 ) ) ( not ( = ?auto_823396 ?auto_823406 ) ) ( not ( = ?auto_823397 ?auto_823398 ) ) ( not ( = ?auto_823397 ?auto_823399 ) ) ( not ( = ?auto_823397 ?auto_823400 ) ) ( not ( = ?auto_823397 ?auto_823401 ) ) ( not ( = ?auto_823397 ?auto_823402 ) ) ( not ( = ?auto_823397 ?auto_823403 ) ) ( not ( = ?auto_823397 ?auto_823406 ) ) ( not ( = ?auto_823398 ?auto_823399 ) ) ( not ( = ?auto_823398 ?auto_823400 ) ) ( not ( = ?auto_823398 ?auto_823401 ) ) ( not ( = ?auto_823398 ?auto_823402 ) ) ( not ( = ?auto_823398 ?auto_823403 ) ) ( not ( = ?auto_823398 ?auto_823406 ) ) ( not ( = ?auto_823399 ?auto_823400 ) ) ( not ( = ?auto_823399 ?auto_823401 ) ) ( not ( = ?auto_823399 ?auto_823402 ) ) ( not ( = ?auto_823399 ?auto_823403 ) ) ( not ( = ?auto_823399 ?auto_823406 ) ) ( not ( = ?auto_823400 ?auto_823401 ) ) ( not ( = ?auto_823400 ?auto_823402 ) ) ( not ( = ?auto_823400 ?auto_823403 ) ) ( not ( = ?auto_823400 ?auto_823406 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823401 ?auto_823402 ?auto_823403 )
      ( MAKE-11CRATE-VERIFY ?auto_823392 ?auto_823393 ?auto_823394 ?auto_823395 ?auto_823396 ?auto_823397 ?auto_823398 ?auto_823399 ?auto_823400 ?auto_823401 ?auto_823402 ?auto_823403 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_823536 - SURFACE
      ?auto_823537 - SURFACE
      ?auto_823538 - SURFACE
      ?auto_823539 - SURFACE
      ?auto_823540 - SURFACE
      ?auto_823541 - SURFACE
      ?auto_823542 - SURFACE
      ?auto_823543 - SURFACE
      ?auto_823544 - SURFACE
      ?auto_823545 - SURFACE
      ?auto_823546 - SURFACE
      ?auto_823547 - SURFACE
    )
    :vars
    (
      ?auto_823553 - HOIST
      ?auto_823550 - PLACE
      ?auto_823552 - PLACE
      ?auto_823551 - HOIST
      ?auto_823549 - SURFACE
      ?auto_823548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_823553 ?auto_823550 ) ( IS-CRATE ?auto_823547 ) ( not ( = ?auto_823546 ?auto_823547 ) ) ( not ( = ?auto_823545 ?auto_823546 ) ) ( not ( = ?auto_823545 ?auto_823547 ) ) ( not ( = ?auto_823552 ?auto_823550 ) ) ( HOIST-AT ?auto_823551 ?auto_823552 ) ( not ( = ?auto_823553 ?auto_823551 ) ) ( AVAILABLE ?auto_823551 ) ( SURFACE-AT ?auto_823547 ?auto_823552 ) ( ON ?auto_823547 ?auto_823549 ) ( CLEAR ?auto_823547 ) ( not ( = ?auto_823546 ?auto_823549 ) ) ( not ( = ?auto_823547 ?auto_823549 ) ) ( not ( = ?auto_823545 ?auto_823549 ) ) ( TRUCK-AT ?auto_823548 ?auto_823550 ) ( SURFACE-AT ?auto_823545 ?auto_823550 ) ( CLEAR ?auto_823545 ) ( LIFTING ?auto_823553 ?auto_823546 ) ( IS-CRATE ?auto_823546 ) ( ON ?auto_823537 ?auto_823536 ) ( ON ?auto_823538 ?auto_823537 ) ( ON ?auto_823539 ?auto_823538 ) ( ON ?auto_823540 ?auto_823539 ) ( ON ?auto_823541 ?auto_823540 ) ( ON ?auto_823542 ?auto_823541 ) ( ON ?auto_823543 ?auto_823542 ) ( ON ?auto_823544 ?auto_823543 ) ( ON ?auto_823545 ?auto_823544 ) ( not ( = ?auto_823536 ?auto_823537 ) ) ( not ( = ?auto_823536 ?auto_823538 ) ) ( not ( = ?auto_823536 ?auto_823539 ) ) ( not ( = ?auto_823536 ?auto_823540 ) ) ( not ( = ?auto_823536 ?auto_823541 ) ) ( not ( = ?auto_823536 ?auto_823542 ) ) ( not ( = ?auto_823536 ?auto_823543 ) ) ( not ( = ?auto_823536 ?auto_823544 ) ) ( not ( = ?auto_823536 ?auto_823545 ) ) ( not ( = ?auto_823536 ?auto_823546 ) ) ( not ( = ?auto_823536 ?auto_823547 ) ) ( not ( = ?auto_823536 ?auto_823549 ) ) ( not ( = ?auto_823537 ?auto_823538 ) ) ( not ( = ?auto_823537 ?auto_823539 ) ) ( not ( = ?auto_823537 ?auto_823540 ) ) ( not ( = ?auto_823537 ?auto_823541 ) ) ( not ( = ?auto_823537 ?auto_823542 ) ) ( not ( = ?auto_823537 ?auto_823543 ) ) ( not ( = ?auto_823537 ?auto_823544 ) ) ( not ( = ?auto_823537 ?auto_823545 ) ) ( not ( = ?auto_823537 ?auto_823546 ) ) ( not ( = ?auto_823537 ?auto_823547 ) ) ( not ( = ?auto_823537 ?auto_823549 ) ) ( not ( = ?auto_823538 ?auto_823539 ) ) ( not ( = ?auto_823538 ?auto_823540 ) ) ( not ( = ?auto_823538 ?auto_823541 ) ) ( not ( = ?auto_823538 ?auto_823542 ) ) ( not ( = ?auto_823538 ?auto_823543 ) ) ( not ( = ?auto_823538 ?auto_823544 ) ) ( not ( = ?auto_823538 ?auto_823545 ) ) ( not ( = ?auto_823538 ?auto_823546 ) ) ( not ( = ?auto_823538 ?auto_823547 ) ) ( not ( = ?auto_823538 ?auto_823549 ) ) ( not ( = ?auto_823539 ?auto_823540 ) ) ( not ( = ?auto_823539 ?auto_823541 ) ) ( not ( = ?auto_823539 ?auto_823542 ) ) ( not ( = ?auto_823539 ?auto_823543 ) ) ( not ( = ?auto_823539 ?auto_823544 ) ) ( not ( = ?auto_823539 ?auto_823545 ) ) ( not ( = ?auto_823539 ?auto_823546 ) ) ( not ( = ?auto_823539 ?auto_823547 ) ) ( not ( = ?auto_823539 ?auto_823549 ) ) ( not ( = ?auto_823540 ?auto_823541 ) ) ( not ( = ?auto_823540 ?auto_823542 ) ) ( not ( = ?auto_823540 ?auto_823543 ) ) ( not ( = ?auto_823540 ?auto_823544 ) ) ( not ( = ?auto_823540 ?auto_823545 ) ) ( not ( = ?auto_823540 ?auto_823546 ) ) ( not ( = ?auto_823540 ?auto_823547 ) ) ( not ( = ?auto_823540 ?auto_823549 ) ) ( not ( = ?auto_823541 ?auto_823542 ) ) ( not ( = ?auto_823541 ?auto_823543 ) ) ( not ( = ?auto_823541 ?auto_823544 ) ) ( not ( = ?auto_823541 ?auto_823545 ) ) ( not ( = ?auto_823541 ?auto_823546 ) ) ( not ( = ?auto_823541 ?auto_823547 ) ) ( not ( = ?auto_823541 ?auto_823549 ) ) ( not ( = ?auto_823542 ?auto_823543 ) ) ( not ( = ?auto_823542 ?auto_823544 ) ) ( not ( = ?auto_823542 ?auto_823545 ) ) ( not ( = ?auto_823542 ?auto_823546 ) ) ( not ( = ?auto_823542 ?auto_823547 ) ) ( not ( = ?auto_823542 ?auto_823549 ) ) ( not ( = ?auto_823543 ?auto_823544 ) ) ( not ( = ?auto_823543 ?auto_823545 ) ) ( not ( = ?auto_823543 ?auto_823546 ) ) ( not ( = ?auto_823543 ?auto_823547 ) ) ( not ( = ?auto_823543 ?auto_823549 ) ) ( not ( = ?auto_823544 ?auto_823545 ) ) ( not ( = ?auto_823544 ?auto_823546 ) ) ( not ( = ?auto_823544 ?auto_823547 ) ) ( not ( = ?auto_823544 ?auto_823549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823545 ?auto_823546 ?auto_823547 )
      ( MAKE-11CRATE-VERIFY ?auto_823536 ?auto_823537 ?auto_823538 ?auto_823539 ?auto_823540 ?auto_823541 ?auto_823542 ?auto_823543 ?auto_823544 ?auto_823545 ?auto_823546 ?auto_823547 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_823680 - SURFACE
      ?auto_823681 - SURFACE
      ?auto_823682 - SURFACE
      ?auto_823683 - SURFACE
      ?auto_823684 - SURFACE
      ?auto_823685 - SURFACE
      ?auto_823686 - SURFACE
      ?auto_823687 - SURFACE
      ?auto_823688 - SURFACE
      ?auto_823689 - SURFACE
      ?auto_823690 - SURFACE
      ?auto_823691 - SURFACE
    )
    :vars
    (
      ?auto_823696 - HOIST
      ?auto_823694 - PLACE
      ?auto_823693 - PLACE
      ?auto_823695 - HOIST
      ?auto_823692 - SURFACE
      ?auto_823697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_823696 ?auto_823694 ) ( IS-CRATE ?auto_823691 ) ( not ( = ?auto_823690 ?auto_823691 ) ) ( not ( = ?auto_823689 ?auto_823690 ) ) ( not ( = ?auto_823689 ?auto_823691 ) ) ( not ( = ?auto_823693 ?auto_823694 ) ) ( HOIST-AT ?auto_823695 ?auto_823693 ) ( not ( = ?auto_823696 ?auto_823695 ) ) ( AVAILABLE ?auto_823695 ) ( SURFACE-AT ?auto_823691 ?auto_823693 ) ( ON ?auto_823691 ?auto_823692 ) ( CLEAR ?auto_823691 ) ( not ( = ?auto_823690 ?auto_823692 ) ) ( not ( = ?auto_823691 ?auto_823692 ) ) ( not ( = ?auto_823689 ?auto_823692 ) ) ( TRUCK-AT ?auto_823697 ?auto_823694 ) ( SURFACE-AT ?auto_823689 ?auto_823694 ) ( CLEAR ?auto_823689 ) ( IS-CRATE ?auto_823690 ) ( AVAILABLE ?auto_823696 ) ( IN ?auto_823690 ?auto_823697 ) ( ON ?auto_823681 ?auto_823680 ) ( ON ?auto_823682 ?auto_823681 ) ( ON ?auto_823683 ?auto_823682 ) ( ON ?auto_823684 ?auto_823683 ) ( ON ?auto_823685 ?auto_823684 ) ( ON ?auto_823686 ?auto_823685 ) ( ON ?auto_823687 ?auto_823686 ) ( ON ?auto_823688 ?auto_823687 ) ( ON ?auto_823689 ?auto_823688 ) ( not ( = ?auto_823680 ?auto_823681 ) ) ( not ( = ?auto_823680 ?auto_823682 ) ) ( not ( = ?auto_823680 ?auto_823683 ) ) ( not ( = ?auto_823680 ?auto_823684 ) ) ( not ( = ?auto_823680 ?auto_823685 ) ) ( not ( = ?auto_823680 ?auto_823686 ) ) ( not ( = ?auto_823680 ?auto_823687 ) ) ( not ( = ?auto_823680 ?auto_823688 ) ) ( not ( = ?auto_823680 ?auto_823689 ) ) ( not ( = ?auto_823680 ?auto_823690 ) ) ( not ( = ?auto_823680 ?auto_823691 ) ) ( not ( = ?auto_823680 ?auto_823692 ) ) ( not ( = ?auto_823681 ?auto_823682 ) ) ( not ( = ?auto_823681 ?auto_823683 ) ) ( not ( = ?auto_823681 ?auto_823684 ) ) ( not ( = ?auto_823681 ?auto_823685 ) ) ( not ( = ?auto_823681 ?auto_823686 ) ) ( not ( = ?auto_823681 ?auto_823687 ) ) ( not ( = ?auto_823681 ?auto_823688 ) ) ( not ( = ?auto_823681 ?auto_823689 ) ) ( not ( = ?auto_823681 ?auto_823690 ) ) ( not ( = ?auto_823681 ?auto_823691 ) ) ( not ( = ?auto_823681 ?auto_823692 ) ) ( not ( = ?auto_823682 ?auto_823683 ) ) ( not ( = ?auto_823682 ?auto_823684 ) ) ( not ( = ?auto_823682 ?auto_823685 ) ) ( not ( = ?auto_823682 ?auto_823686 ) ) ( not ( = ?auto_823682 ?auto_823687 ) ) ( not ( = ?auto_823682 ?auto_823688 ) ) ( not ( = ?auto_823682 ?auto_823689 ) ) ( not ( = ?auto_823682 ?auto_823690 ) ) ( not ( = ?auto_823682 ?auto_823691 ) ) ( not ( = ?auto_823682 ?auto_823692 ) ) ( not ( = ?auto_823683 ?auto_823684 ) ) ( not ( = ?auto_823683 ?auto_823685 ) ) ( not ( = ?auto_823683 ?auto_823686 ) ) ( not ( = ?auto_823683 ?auto_823687 ) ) ( not ( = ?auto_823683 ?auto_823688 ) ) ( not ( = ?auto_823683 ?auto_823689 ) ) ( not ( = ?auto_823683 ?auto_823690 ) ) ( not ( = ?auto_823683 ?auto_823691 ) ) ( not ( = ?auto_823683 ?auto_823692 ) ) ( not ( = ?auto_823684 ?auto_823685 ) ) ( not ( = ?auto_823684 ?auto_823686 ) ) ( not ( = ?auto_823684 ?auto_823687 ) ) ( not ( = ?auto_823684 ?auto_823688 ) ) ( not ( = ?auto_823684 ?auto_823689 ) ) ( not ( = ?auto_823684 ?auto_823690 ) ) ( not ( = ?auto_823684 ?auto_823691 ) ) ( not ( = ?auto_823684 ?auto_823692 ) ) ( not ( = ?auto_823685 ?auto_823686 ) ) ( not ( = ?auto_823685 ?auto_823687 ) ) ( not ( = ?auto_823685 ?auto_823688 ) ) ( not ( = ?auto_823685 ?auto_823689 ) ) ( not ( = ?auto_823685 ?auto_823690 ) ) ( not ( = ?auto_823685 ?auto_823691 ) ) ( not ( = ?auto_823685 ?auto_823692 ) ) ( not ( = ?auto_823686 ?auto_823687 ) ) ( not ( = ?auto_823686 ?auto_823688 ) ) ( not ( = ?auto_823686 ?auto_823689 ) ) ( not ( = ?auto_823686 ?auto_823690 ) ) ( not ( = ?auto_823686 ?auto_823691 ) ) ( not ( = ?auto_823686 ?auto_823692 ) ) ( not ( = ?auto_823687 ?auto_823688 ) ) ( not ( = ?auto_823687 ?auto_823689 ) ) ( not ( = ?auto_823687 ?auto_823690 ) ) ( not ( = ?auto_823687 ?auto_823691 ) ) ( not ( = ?auto_823687 ?auto_823692 ) ) ( not ( = ?auto_823688 ?auto_823689 ) ) ( not ( = ?auto_823688 ?auto_823690 ) ) ( not ( = ?auto_823688 ?auto_823691 ) ) ( not ( = ?auto_823688 ?auto_823692 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823689 ?auto_823690 ?auto_823691 )
      ( MAKE-11CRATE-VERIFY ?auto_823680 ?auto_823681 ?auto_823682 ?auto_823683 ?auto_823684 ?auto_823685 ?auto_823686 ?auto_823687 ?auto_823688 ?auto_823689 ?auto_823690 ?auto_823691 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_832947 - SURFACE
      ?auto_832948 - SURFACE
      ?auto_832949 - SURFACE
      ?auto_832950 - SURFACE
      ?auto_832951 - SURFACE
      ?auto_832952 - SURFACE
      ?auto_832953 - SURFACE
      ?auto_832954 - SURFACE
      ?auto_832955 - SURFACE
      ?auto_832956 - SURFACE
      ?auto_832957 - SURFACE
      ?auto_832958 - SURFACE
      ?auto_832959 - SURFACE
    )
    :vars
    (
      ?auto_832960 - HOIST
      ?auto_832961 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_832960 ?auto_832961 ) ( SURFACE-AT ?auto_832958 ?auto_832961 ) ( CLEAR ?auto_832958 ) ( LIFTING ?auto_832960 ?auto_832959 ) ( IS-CRATE ?auto_832959 ) ( not ( = ?auto_832958 ?auto_832959 ) ) ( ON ?auto_832948 ?auto_832947 ) ( ON ?auto_832949 ?auto_832948 ) ( ON ?auto_832950 ?auto_832949 ) ( ON ?auto_832951 ?auto_832950 ) ( ON ?auto_832952 ?auto_832951 ) ( ON ?auto_832953 ?auto_832952 ) ( ON ?auto_832954 ?auto_832953 ) ( ON ?auto_832955 ?auto_832954 ) ( ON ?auto_832956 ?auto_832955 ) ( ON ?auto_832957 ?auto_832956 ) ( ON ?auto_832958 ?auto_832957 ) ( not ( = ?auto_832947 ?auto_832948 ) ) ( not ( = ?auto_832947 ?auto_832949 ) ) ( not ( = ?auto_832947 ?auto_832950 ) ) ( not ( = ?auto_832947 ?auto_832951 ) ) ( not ( = ?auto_832947 ?auto_832952 ) ) ( not ( = ?auto_832947 ?auto_832953 ) ) ( not ( = ?auto_832947 ?auto_832954 ) ) ( not ( = ?auto_832947 ?auto_832955 ) ) ( not ( = ?auto_832947 ?auto_832956 ) ) ( not ( = ?auto_832947 ?auto_832957 ) ) ( not ( = ?auto_832947 ?auto_832958 ) ) ( not ( = ?auto_832947 ?auto_832959 ) ) ( not ( = ?auto_832948 ?auto_832949 ) ) ( not ( = ?auto_832948 ?auto_832950 ) ) ( not ( = ?auto_832948 ?auto_832951 ) ) ( not ( = ?auto_832948 ?auto_832952 ) ) ( not ( = ?auto_832948 ?auto_832953 ) ) ( not ( = ?auto_832948 ?auto_832954 ) ) ( not ( = ?auto_832948 ?auto_832955 ) ) ( not ( = ?auto_832948 ?auto_832956 ) ) ( not ( = ?auto_832948 ?auto_832957 ) ) ( not ( = ?auto_832948 ?auto_832958 ) ) ( not ( = ?auto_832948 ?auto_832959 ) ) ( not ( = ?auto_832949 ?auto_832950 ) ) ( not ( = ?auto_832949 ?auto_832951 ) ) ( not ( = ?auto_832949 ?auto_832952 ) ) ( not ( = ?auto_832949 ?auto_832953 ) ) ( not ( = ?auto_832949 ?auto_832954 ) ) ( not ( = ?auto_832949 ?auto_832955 ) ) ( not ( = ?auto_832949 ?auto_832956 ) ) ( not ( = ?auto_832949 ?auto_832957 ) ) ( not ( = ?auto_832949 ?auto_832958 ) ) ( not ( = ?auto_832949 ?auto_832959 ) ) ( not ( = ?auto_832950 ?auto_832951 ) ) ( not ( = ?auto_832950 ?auto_832952 ) ) ( not ( = ?auto_832950 ?auto_832953 ) ) ( not ( = ?auto_832950 ?auto_832954 ) ) ( not ( = ?auto_832950 ?auto_832955 ) ) ( not ( = ?auto_832950 ?auto_832956 ) ) ( not ( = ?auto_832950 ?auto_832957 ) ) ( not ( = ?auto_832950 ?auto_832958 ) ) ( not ( = ?auto_832950 ?auto_832959 ) ) ( not ( = ?auto_832951 ?auto_832952 ) ) ( not ( = ?auto_832951 ?auto_832953 ) ) ( not ( = ?auto_832951 ?auto_832954 ) ) ( not ( = ?auto_832951 ?auto_832955 ) ) ( not ( = ?auto_832951 ?auto_832956 ) ) ( not ( = ?auto_832951 ?auto_832957 ) ) ( not ( = ?auto_832951 ?auto_832958 ) ) ( not ( = ?auto_832951 ?auto_832959 ) ) ( not ( = ?auto_832952 ?auto_832953 ) ) ( not ( = ?auto_832952 ?auto_832954 ) ) ( not ( = ?auto_832952 ?auto_832955 ) ) ( not ( = ?auto_832952 ?auto_832956 ) ) ( not ( = ?auto_832952 ?auto_832957 ) ) ( not ( = ?auto_832952 ?auto_832958 ) ) ( not ( = ?auto_832952 ?auto_832959 ) ) ( not ( = ?auto_832953 ?auto_832954 ) ) ( not ( = ?auto_832953 ?auto_832955 ) ) ( not ( = ?auto_832953 ?auto_832956 ) ) ( not ( = ?auto_832953 ?auto_832957 ) ) ( not ( = ?auto_832953 ?auto_832958 ) ) ( not ( = ?auto_832953 ?auto_832959 ) ) ( not ( = ?auto_832954 ?auto_832955 ) ) ( not ( = ?auto_832954 ?auto_832956 ) ) ( not ( = ?auto_832954 ?auto_832957 ) ) ( not ( = ?auto_832954 ?auto_832958 ) ) ( not ( = ?auto_832954 ?auto_832959 ) ) ( not ( = ?auto_832955 ?auto_832956 ) ) ( not ( = ?auto_832955 ?auto_832957 ) ) ( not ( = ?auto_832955 ?auto_832958 ) ) ( not ( = ?auto_832955 ?auto_832959 ) ) ( not ( = ?auto_832956 ?auto_832957 ) ) ( not ( = ?auto_832956 ?auto_832958 ) ) ( not ( = ?auto_832956 ?auto_832959 ) ) ( not ( = ?auto_832957 ?auto_832958 ) ) ( not ( = ?auto_832957 ?auto_832959 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_832958 ?auto_832959 )
      ( MAKE-12CRATE-VERIFY ?auto_832947 ?auto_832948 ?auto_832949 ?auto_832950 ?auto_832951 ?auto_832952 ?auto_832953 ?auto_832954 ?auto_832955 ?auto_832956 ?auto_832957 ?auto_832958 ?auto_832959 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_833072 - SURFACE
      ?auto_833073 - SURFACE
      ?auto_833074 - SURFACE
      ?auto_833075 - SURFACE
      ?auto_833076 - SURFACE
      ?auto_833077 - SURFACE
      ?auto_833078 - SURFACE
      ?auto_833079 - SURFACE
      ?auto_833080 - SURFACE
      ?auto_833081 - SURFACE
      ?auto_833082 - SURFACE
      ?auto_833083 - SURFACE
      ?auto_833084 - SURFACE
    )
    :vars
    (
      ?auto_833085 - HOIST
      ?auto_833087 - PLACE
      ?auto_833086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_833085 ?auto_833087 ) ( SURFACE-AT ?auto_833083 ?auto_833087 ) ( CLEAR ?auto_833083 ) ( IS-CRATE ?auto_833084 ) ( not ( = ?auto_833083 ?auto_833084 ) ) ( TRUCK-AT ?auto_833086 ?auto_833087 ) ( AVAILABLE ?auto_833085 ) ( IN ?auto_833084 ?auto_833086 ) ( ON ?auto_833083 ?auto_833082 ) ( not ( = ?auto_833082 ?auto_833083 ) ) ( not ( = ?auto_833082 ?auto_833084 ) ) ( ON ?auto_833073 ?auto_833072 ) ( ON ?auto_833074 ?auto_833073 ) ( ON ?auto_833075 ?auto_833074 ) ( ON ?auto_833076 ?auto_833075 ) ( ON ?auto_833077 ?auto_833076 ) ( ON ?auto_833078 ?auto_833077 ) ( ON ?auto_833079 ?auto_833078 ) ( ON ?auto_833080 ?auto_833079 ) ( ON ?auto_833081 ?auto_833080 ) ( ON ?auto_833082 ?auto_833081 ) ( not ( = ?auto_833072 ?auto_833073 ) ) ( not ( = ?auto_833072 ?auto_833074 ) ) ( not ( = ?auto_833072 ?auto_833075 ) ) ( not ( = ?auto_833072 ?auto_833076 ) ) ( not ( = ?auto_833072 ?auto_833077 ) ) ( not ( = ?auto_833072 ?auto_833078 ) ) ( not ( = ?auto_833072 ?auto_833079 ) ) ( not ( = ?auto_833072 ?auto_833080 ) ) ( not ( = ?auto_833072 ?auto_833081 ) ) ( not ( = ?auto_833072 ?auto_833082 ) ) ( not ( = ?auto_833072 ?auto_833083 ) ) ( not ( = ?auto_833072 ?auto_833084 ) ) ( not ( = ?auto_833073 ?auto_833074 ) ) ( not ( = ?auto_833073 ?auto_833075 ) ) ( not ( = ?auto_833073 ?auto_833076 ) ) ( not ( = ?auto_833073 ?auto_833077 ) ) ( not ( = ?auto_833073 ?auto_833078 ) ) ( not ( = ?auto_833073 ?auto_833079 ) ) ( not ( = ?auto_833073 ?auto_833080 ) ) ( not ( = ?auto_833073 ?auto_833081 ) ) ( not ( = ?auto_833073 ?auto_833082 ) ) ( not ( = ?auto_833073 ?auto_833083 ) ) ( not ( = ?auto_833073 ?auto_833084 ) ) ( not ( = ?auto_833074 ?auto_833075 ) ) ( not ( = ?auto_833074 ?auto_833076 ) ) ( not ( = ?auto_833074 ?auto_833077 ) ) ( not ( = ?auto_833074 ?auto_833078 ) ) ( not ( = ?auto_833074 ?auto_833079 ) ) ( not ( = ?auto_833074 ?auto_833080 ) ) ( not ( = ?auto_833074 ?auto_833081 ) ) ( not ( = ?auto_833074 ?auto_833082 ) ) ( not ( = ?auto_833074 ?auto_833083 ) ) ( not ( = ?auto_833074 ?auto_833084 ) ) ( not ( = ?auto_833075 ?auto_833076 ) ) ( not ( = ?auto_833075 ?auto_833077 ) ) ( not ( = ?auto_833075 ?auto_833078 ) ) ( not ( = ?auto_833075 ?auto_833079 ) ) ( not ( = ?auto_833075 ?auto_833080 ) ) ( not ( = ?auto_833075 ?auto_833081 ) ) ( not ( = ?auto_833075 ?auto_833082 ) ) ( not ( = ?auto_833075 ?auto_833083 ) ) ( not ( = ?auto_833075 ?auto_833084 ) ) ( not ( = ?auto_833076 ?auto_833077 ) ) ( not ( = ?auto_833076 ?auto_833078 ) ) ( not ( = ?auto_833076 ?auto_833079 ) ) ( not ( = ?auto_833076 ?auto_833080 ) ) ( not ( = ?auto_833076 ?auto_833081 ) ) ( not ( = ?auto_833076 ?auto_833082 ) ) ( not ( = ?auto_833076 ?auto_833083 ) ) ( not ( = ?auto_833076 ?auto_833084 ) ) ( not ( = ?auto_833077 ?auto_833078 ) ) ( not ( = ?auto_833077 ?auto_833079 ) ) ( not ( = ?auto_833077 ?auto_833080 ) ) ( not ( = ?auto_833077 ?auto_833081 ) ) ( not ( = ?auto_833077 ?auto_833082 ) ) ( not ( = ?auto_833077 ?auto_833083 ) ) ( not ( = ?auto_833077 ?auto_833084 ) ) ( not ( = ?auto_833078 ?auto_833079 ) ) ( not ( = ?auto_833078 ?auto_833080 ) ) ( not ( = ?auto_833078 ?auto_833081 ) ) ( not ( = ?auto_833078 ?auto_833082 ) ) ( not ( = ?auto_833078 ?auto_833083 ) ) ( not ( = ?auto_833078 ?auto_833084 ) ) ( not ( = ?auto_833079 ?auto_833080 ) ) ( not ( = ?auto_833079 ?auto_833081 ) ) ( not ( = ?auto_833079 ?auto_833082 ) ) ( not ( = ?auto_833079 ?auto_833083 ) ) ( not ( = ?auto_833079 ?auto_833084 ) ) ( not ( = ?auto_833080 ?auto_833081 ) ) ( not ( = ?auto_833080 ?auto_833082 ) ) ( not ( = ?auto_833080 ?auto_833083 ) ) ( not ( = ?auto_833080 ?auto_833084 ) ) ( not ( = ?auto_833081 ?auto_833082 ) ) ( not ( = ?auto_833081 ?auto_833083 ) ) ( not ( = ?auto_833081 ?auto_833084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_833082 ?auto_833083 ?auto_833084 )
      ( MAKE-12CRATE-VERIFY ?auto_833072 ?auto_833073 ?auto_833074 ?auto_833075 ?auto_833076 ?auto_833077 ?auto_833078 ?auto_833079 ?auto_833080 ?auto_833081 ?auto_833082 ?auto_833083 ?auto_833084 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_833210 - SURFACE
      ?auto_833211 - SURFACE
      ?auto_833212 - SURFACE
      ?auto_833213 - SURFACE
      ?auto_833214 - SURFACE
      ?auto_833215 - SURFACE
      ?auto_833216 - SURFACE
      ?auto_833217 - SURFACE
      ?auto_833218 - SURFACE
      ?auto_833219 - SURFACE
      ?auto_833220 - SURFACE
      ?auto_833221 - SURFACE
      ?auto_833222 - SURFACE
    )
    :vars
    (
      ?auto_833225 - HOIST
      ?auto_833226 - PLACE
      ?auto_833223 - TRUCK
      ?auto_833224 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_833225 ?auto_833226 ) ( SURFACE-AT ?auto_833221 ?auto_833226 ) ( CLEAR ?auto_833221 ) ( IS-CRATE ?auto_833222 ) ( not ( = ?auto_833221 ?auto_833222 ) ) ( AVAILABLE ?auto_833225 ) ( IN ?auto_833222 ?auto_833223 ) ( ON ?auto_833221 ?auto_833220 ) ( not ( = ?auto_833220 ?auto_833221 ) ) ( not ( = ?auto_833220 ?auto_833222 ) ) ( TRUCK-AT ?auto_833223 ?auto_833224 ) ( not ( = ?auto_833224 ?auto_833226 ) ) ( ON ?auto_833211 ?auto_833210 ) ( ON ?auto_833212 ?auto_833211 ) ( ON ?auto_833213 ?auto_833212 ) ( ON ?auto_833214 ?auto_833213 ) ( ON ?auto_833215 ?auto_833214 ) ( ON ?auto_833216 ?auto_833215 ) ( ON ?auto_833217 ?auto_833216 ) ( ON ?auto_833218 ?auto_833217 ) ( ON ?auto_833219 ?auto_833218 ) ( ON ?auto_833220 ?auto_833219 ) ( not ( = ?auto_833210 ?auto_833211 ) ) ( not ( = ?auto_833210 ?auto_833212 ) ) ( not ( = ?auto_833210 ?auto_833213 ) ) ( not ( = ?auto_833210 ?auto_833214 ) ) ( not ( = ?auto_833210 ?auto_833215 ) ) ( not ( = ?auto_833210 ?auto_833216 ) ) ( not ( = ?auto_833210 ?auto_833217 ) ) ( not ( = ?auto_833210 ?auto_833218 ) ) ( not ( = ?auto_833210 ?auto_833219 ) ) ( not ( = ?auto_833210 ?auto_833220 ) ) ( not ( = ?auto_833210 ?auto_833221 ) ) ( not ( = ?auto_833210 ?auto_833222 ) ) ( not ( = ?auto_833211 ?auto_833212 ) ) ( not ( = ?auto_833211 ?auto_833213 ) ) ( not ( = ?auto_833211 ?auto_833214 ) ) ( not ( = ?auto_833211 ?auto_833215 ) ) ( not ( = ?auto_833211 ?auto_833216 ) ) ( not ( = ?auto_833211 ?auto_833217 ) ) ( not ( = ?auto_833211 ?auto_833218 ) ) ( not ( = ?auto_833211 ?auto_833219 ) ) ( not ( = ?auto_833211 ?auto_833220 ) ) ( not ( = ?auto_833211 ?auto_833221 ) ) ( not ( = ?auto_833211 ?auto_833222 ) ) ( not ( = ?auto_833212 ?auto_833213 ) ) ( not ( = ?auto_833212 ?auto_833214 ) ) ( not ( = ?auto_833212 ?auto_833215 ) ) ( not ( = ?auto_833212 ?auto_833216 ) ) ( not ( = ?auto_833212 ?auto_833217 ) ) ( not ( = ?auto_833212 ?auto_833218 ) ) ( not ( = ?auto_833212 ?auto_833219 ) ) ( not ( = ?auto_833212 ?auto_833220 ) ) ( not ( = ?auto_833212 ?auto_833221 ) ) ( not ( = ?auto_833212 ?auto_833222 ) ) ( not ( = ?auto_833213 ?auto_833214 ) ) ( not ( = ?auto_833213 ?auto_833215 ) ) ( not ( = ?auto_833213 ?auto_833216 ) ) ( not ( = ?auto_833213 ?auto_833217 ) ) ( not ( = ?auto_833213 ?auto_833218 ) ) ( not ( = ?auto_833213 ?auto_833219 ) ) ( not ( = ?auto_833213 ?auto_833220 ) ) ( not ( = ?auto_833213 ?auto_833221 ) ) ( not ( = ?auto_833213 ?auto_833222 ) ) ( not ( = ?auto_833214 ?auto_833215 ) ) ( not ( = ?auto_833214 ?auto_833216 ) ) ( not ( = ?auto_833214 ?auto_833217 ) ) ( not ( = ?auto_833214 ?auto_833218 ) ) ( not ( = ?auto_833214 ?auto_833219 ) ) ( not ( = ?auto_833214 ?auto_833220 ) ) ( not ( = ?auto_833214 ?auto_833221 ) ) ( not ( = ?auto_833214 ?auto_833222 ) ) ( not ( = ?auto_833215 ?auto_833216 ) ) ( not ( = ?auto_833215 ?auto_833217 ) ) ( not ( = ?auto_833215 ?auto_833218 ) ) ( not ( = ?auto_833215 ?auto_833219 ) ) ( not ( = ?auto_833215 ?auto_833220 ) ) ( not ( = ?auto_833215 ?auto_833221 ) ) ( not ( = ?auto_833215 ?auto_833222 ) ) ( not ( = ?auto_833216 ?auto_833217 ) ) ( not ( = ?auto_833216 ?auto_833218 ) ) ( not ( = ?auto_833216 ?auto_833219 ) ) ( not ( = ?auto_833216 ?auto_833220 ) ) ( not ( = ?auto_833216 ?auto_833221 ) ) ( not ( = ?auto_833216 ?auto_833222 ) ) ( not ( = ?auto_833217 ?auto_833218 ) ) ( not ( = ?auto_833217 ?auto_833219 ) ) ( not ( = ?auto_833217 ?auto_833220 ) ) ( not ( = ?auto_833217 ?auto_833221 ) ) ( not ( = ?auto_833217 ?auto_833222 ) ) ( not ( = ?auto_833218 ?auto_833219 ) ) ( not ( = ?auto_833218 ?auto_833220 ) ) ( not ( = ?auto_833218 ?auto_833221 ) ) ( not ( = ?auto_833218 ?auto_833222 ) ) ( not ( = ?auto_833219 ?auto_833220 ) ) ( not ( = ?auto_833219 ?auto_833221 ) ) ( not ( = ?auto_833219 ?auto_833222 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_833220 ?auto_833221 ?auto_833222 )
      ( MAKE-12CRATE-VERIFY ?auto_833210 ?auto_833211 ?auto_833212 ?auto_833213 ?auto_833214 ?auto_833215 ?auto_833216 ?auto_833217 ?auto_833218 ?auto_833219 ?auto_833220 ?auto_833221 ?auto_833222 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_833360 - SURFACE
      ?auto_833361 - SURFACE
      ?auto_833362 - SURFACE
      ?auto_833363 - SURFACE
      ?auto_833364 - SURFACE
      ?auto_833365 - SURFACE
      ?auto_833366 - SURFACE
      ?auto_833367 - SURFACE
      ?auto_833368 - SURFACE
      ?auto_833369 - SURFACE
      ?auto_833370 - SURFACE
      ?auto_833371 - SURFACE
      ?auto_833372 - SURFACE
    )
    :vars
    (
      ?auto_833373 - HOIST
      ?auto_833377 - PLACE
      ?auto_833375 - TRUCK
      ?auto_833374 - PLACE
      ?auto_833376 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_833373 ?auto_833377 ) ( SURFACE-AT ?auto_833371 ?auto_833377 ) ( CLEAR ?auto_833371 ) ( IS-CRATE ?auto_833372 ) ( not ( = ?auto_833371 ?auto_833372 ) ) ( AVAILABLE ?auto_833373 ) ( ON ?auto_833371 ?auto_833370 ) ( not ( = ?auto_833370 ?auto_833371 ) ) ( not ( = ?auto_833370 ?auto_833372 ) ) ( TRUCK-AT ?auto_833375 ?auto_833374 ) ( not ( = ?auto_833374 ?auto_833377 ) ) ( HOIST-AT ?auto_833376 ?auto_833374 ) ( LIFTING ?auto_833376 ?auto_833372 ) ( not ( = ?auto_833373 ?auto_833376 ) ) ( ON ?auto_833361 ?auto_833360 ) ( ON ?auto_833362 ?auto_833361 ) ( ON ?auto_833363 ?auto_833362 ) ( ON ?auto_833364 ?auto_833363 ) ( ON ?auto_833365 ?auto_833364 ) ( ON ?auto_833366 ?auto_833365 ) ( ON ?auto_833367 ?auto_833366 ) ( ON ?auto_833368 ?auto_833367 ) ( ON ?auto_833369 ?auto_833368 ) ( ON ?auto_833370 ?auto_833369 ) ( not ( = ?auto_833360 ?auto_833361 ) ) ( not ( = ?auto_833360 ?auto_833362 ) ) ( not ( = ?auto_833360 ?auto_833363 ) ) ( not ( = ?auto_833360 ?auto_833364 ) ) ( not ( = ?auto_833360 ?auto_833365 ) ) ( not ( = ?auto_833360 ?auto_833366 ) ) ( not ( = ?auto_833360 ?auto_833367 ) ) ( not ( = ?auto_833360 ?auto_833368 ) ) ( not ( = ?auto_833360 ?auto_833369 ) ) ( not ( = ?auto_833360 ?auto_833370 ) ) ( not ( = ?auto_833360 ?auto_833371 ) ) ( not ( = ?auto_833360 ?auto_833372 ) ) ( not ( = ?auto_833361 ?auto_833362 ) ) ( not ( = ?auto_833361 ?auto_833363 ) ) ( not ( = ?auto_833361 ?auto_833364 ) ) ( not ( = ?auto_833361 ?auto_833365 ) ) ( not ( = ?auto_833361 ?auto_833366 ) ) ( not ( = ?auto_833361 ?auto_833367 ) ) ( not ( = ?auto_833361 ?auto_833368 ) ) ( not ( = ?auto_833361 ?auto_833369 ) ) ( not ( = ?auto_833361 ?auto_833370 ) ) ( not ( = ?auto_833361 ?auto_833371 ) ) ( not ( = ?auto_833361 ?auto_833372 ) ) ( not ( = ?auto_833362 ?auto_833363 ) ) ( not ( = ?auto_833362 ?auto_833364 ) ) ( not ( = ?auto_833362 ?auto_833365 ) ) ( not ( = ?auto_833362 ?auto_833366 ) ) ( not ( = ?auto_833362 ?auto_833367 ) ) ( not ( = ?auto_833362 ?auto_833368 ) ) ( not ( = ?auto_833362 ?auto_833369 ) ) ( not ( = ?auto_833362 ?auto_833370 ) ) ( not ( = ?auto_833362 ?auto_833371 ) ) ( not ( = ?auto_833362 ?auto_833372 ) ) ( not ( = ?auto_833363 ?auto_833364 ) ) ( not ( = ?auto_833363 ?auto_833365 ) ) ( not ( = ?auto_833363 ?auto_833366 ) ) ( not ( = ?auto_833363 ?auto_833367 ) ) ( not ( = ?auto_833363 ?auto_833368 ) ) ( not ( = ?auto_833363 ?auto_833369 ) ) ( not ( = ?auto_833363 ?auto_833370 ) ) ( not ( = ?auto_833363 ?auto_833371 ) ) ( not ( = ?auto_833363 ?auto_833372 ) ) ( not ( = ?auto_833364 ?auto_833365 ) ) ( not ( = ?auto_833364 ?auto_833366 ) ) ( not ( = ?auto_833364 ?auto_833367 ) ) ( not ( = ?auto_833364 ?auto_833368 ) ) ( not ( = ?auto_833364 ?auto_833369 ) ) ( not ( = ?auto_833364 ?auto_833370 ) ) ( not ( = ?auto_833364 ?auto_833371 ) ) ( not ( = ?auto_833364 ?auto_833372 ) ) ( not ( = ?auto_833365 ?auto_833366 ) ) ( not ( = ?auto_833365 ?auto_833367 ) ) ( not ( = ?auto_833365 ?auto_833368 ) ) ( not ( = ?auto_833365 ?auto_833369 ) ) ( not ( = ?auto_833365 ?auto_833370 ) ) ( not ( = ?auto_833365 ?auto_833371 ) ) ( not ( = ?auto_833365 ?auto_833372 ) ) ( not ( = ?auto_833366 ?auto_833367 ) ) ( not ( = ?auto_833366 ?auto_833368 ) ) ( not ( = ?auto_833366 ?auto_833369 ) ) ( not ( = ?auto_833366 ?auto_833370 ) ) ( not ( = ?auto_833366 ?auto_833371 ) ) ( not ( = ?auto_833366 ?auto_833372 ) ) ( not ( = ?auto_833367 ?auto_833368 ) ) ( not ( = ?auto_833367 ?auto_833369 ) ) ( not ( = ?auto_833367 ?auto_833370 ) ) ( not ( = ?auto_833367 ?auto_833371 ) ) ( not ( = ?auto_833367 ?auto_833372 ) ) ( not ( = ?auto_833368 ?auto_833369 ) ) ( not ( = ?auto_833368 ?auto_833370 ) ) ( not ( = ?auto_833368 ?auto_833371 ) ) ( not ( = ?auto_833368 ?auto_833372 ) ) ( not ( = ?auto_833369 ?auto_833370 ) ) ( not ( = ?auto_833369 ?auto_833371 ) ) ( not ( = ?auto_833369 ?auto_833372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_833370 ?auto_833371 ?auto_833372 )
      ( MAKE-12CRATE-VERIFY ?auto_833360 ?auto_833361 ?auto_833362 ?auto_833363 ?auto_833364 ?auto_833365 ?auto_833366 ?auto_833367 ?auto_833368 ?auto_833369 ?auto_833370 ?auto_833371 ?auto_833372 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_833522 - SURFACE
      ?auto_833523 - SURFACE
      ?auto_833524 - SURFACE
      ?auto_833525 - SURFACE
      ?auto_833526 - SURFACE
      ?auto_833527 - SURFACE
      ?auto_833528 - SURFACE
      ?auto_833529 - SURFACE
      ?auto_833530 - SURFACE
      ?auto_833531 - SURFACE
      ?auto_833532 - SURFACE
      ?auto_833533 - SURFACE
      ?auto_833534 - SURFACE
    )
    :vars
    (
      ?auto_833539 - HOIST
      ?auto_833535 - PLACE
      ?auto_833538 - TRUCK
      ?auto_833540 - PLACE
      ?auto_833537 - HOIST
      ?auto_833536 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_833539 ?auto_833535 ) ( SURFACE-AT ?auto_833533 ?auto_833535 ) ( CLEAR ?auto_833533 ) ( IS-CRATE ?auto_833534 ) ( not ( = ?auto_833533 ?auto_833534 ) ) ( AVAILABLE ?auto_833539 ) ( ON ?auto_833533 ?auto_833532 ) ( not ( = ?auto_833532 ?auto_833533 ) ) ( not ( = ?auto_833532 ?auto_833534 ) ) ( TRUCK-AT ?auto_833538 ?auto_833540 ) ( not ( = ?auto_833540 ?auto_833535 ) ) ( HOIST-AT ?auto_833537 ?auto_833540 ) ( not ( = ?auto_833539 ?auto_833537 ) ) ( AVAILABLE ?auto_833537 ) ( SURFACE-AT ?auto_833534 ?auto_833540 ) ( ON ?auto_833534 ?auto_833536 ) ( CLEAR ?auto_833534 ) ( not ( = ?auto_833533 ?auto_833536 ) ) ( not ( = ?auto_833534 ?auto_833536 ) ) ( not ( = ?auto_833532 ?auto_833536 ) ) ( ON ?auto_833523 ?auto_833522 ) ( ON ?auto_833524 ?auto_833523 ) ( ON ?auto_833525 ?auto_833524 ) ( ON ?auto_833526 ?auto_833525 ) ( ON ?auto_833527 ?auto_833526 ) ( ON ?auto_833528 ?auto_833527 ) ( ON ?auto_833529 ?auto_833528 ) ( ON ?auto_833530 ?auto_833529 ) ( ON ?auto_833531 ?auto_833530 ) ( ON ?auto_833532 ?auto_833531 ) ( not ( = ?auto_833522 ?auto_833523 ) ) ( not ( = ?auto_833522 ?auto_833524 ) ) ( not ( = ?auto_833522 ?auto_833525 ) ) ( not ( = ?auto_833522 ?auto_833526 ) ) ( not ( = ?auto_833522 ?auto_833527 ) ) ( not ( = ?auto_833522 ?auto_833528 ) ) ( not ( = ?auto_833522 ?auto_833529 ) ) ( not ( = ?auto_833522 ?auto_833530 ) ) ( not ( = ?auto_833522 ?auto_833531 ) ) ( not ( = ?auto_833522 ?auto_833532 ) ) ( not ( = ?auto_833522 ?auto_833533 ) ) ( not ( = ?auto_833522 ?auto_833534 ) ) ( not ( = ?auto_833522 ?auto_833536 ) ) ( not ( = ?auto_833523 ?auto_833524 ) ) ( not ( = ?auto_833523 ?auto_833525 ) ) ( not ( = ?auto_833523 ?auto_833526 ) ) ( not ( = ?auto_833523 ?auto_833527 ) ) ( not ( = ?auto_833523 ?auto_833528 ) ) ( not ( = ?auto_833523 ?auto_833529 ) ) ( not ( = ?auto_833523 ?auto_833530 ) ) ( not ( = ?auto_833523 ?auto_833531 ) ) ( not ( = ?auto_833523 ?auto_833532 ) ) ( not ( = ?auto_833523 ?auto_833533 ) ) ( not ( = ?auto_833523 ?auto_833534 ) ) ( not ( = ?auto_833523 ?auto_833536 ) ) ( not ( = ?auto_833524 ?auto_833525 ) ) ( not ( = ?auto_833524 ?auto_833526 ) ) ( not ( = ?auto_833524 ?auto_833527 ) ) ( not ( = ?auto_833524 ?auto_833528 ) ) ( not ( = ?auto_833524 ?auto_833529 ) ) ( not ( = ?auto_833524 ?auto_833530 ) ) ( not ( = ?auto_833524 ?auto_833531 ) ) ( not ( = ?auto_833524 ?auto_833532 ) ) ( not ( = ?auto_833524 ?auto_833533 ) ) ( not ( = ?auto_833524 ?auto_833534 ) ) ( not ( = ?auto_833524 ?auto_833536 ) ) ( not ( = ?auto_833525 ?auto_833526 ) ) ( not ( = ?auto_833525 ?auto_833527 ) ) ( not ( = ?auto_833525 ?auto_833528 ) ) ( not ( = ?auto_833525 ?auto_833529 ) ) ( not ( = ?auto_833525 ?auto_833530 ) ) ( not ( = ?auto_833525 ?auto_833531 ) ) ( not ( = ?auto_833525 ?auto_833532 ) ) ( not ( = ?auto_833525 ?auto_833533 ) ) ( not ( = ?auto_833525 ?auto_833534 ) ) ( not ( = ?auto_833525 ?auto_833536 ) ) ( not ( = ?auto_833526 ?auto_833527 ) ) ( not ( = ?auto_833526 ?auto_833528 ) ) ( not ( = ?auto_833526 ?auto_833529 ) ) ( not ( = ?auto_833526 ?auto_833530 ) ) ( not ( = ?auto_833526 ?auto_833531 ) ) ( not ( = ?auto_833526 ?auto_833532 ) ) ( not ( = ?auto_833526 ?auto_833533 ) ) ( not ( = ?auto_833526 ?auto_833534 ) ) ( not ( = ?auto_833526 ?auto_833536 ) ) ( not ( = ?auto_833527 ?auto_833528 ) ) ( not ( = ?auto_833527 ?auto_833529 ) ) ( not ( = ?auto_833527 ?auto_833530 ) ) ( not ( = ?auto_833527 ?auto_833531 ) ) ( not ( = ?auto_833527 ?auto_833532 ) ) ( not ( = ?auto_833527 ?auto_833533 ) ) ( not ( = ?auto_833527 ?auto_833534 ) ) ( not ( = ?auto_833527 ?auto_833536 ) ) ( not ( = ?auto_833528 ?auto_833529 ) ) ( not ( = ?auto_833528 ?auto_833530 ) ) ( not ( = ?auto_833528 ?auto_833531 ) ) ( not ( = ?auto_833528 ?auto_833532 ) ) ( not ( = ?auto_833528 ?auto_833533 ) ) ( not ( = ?auto_833528 ?auto_833534 ) ) ( not ( = ?auto_833528 ?auto_833536 ) ) ( not ( = ?auto_833529 ?auto_833530 ) ) ( not ( = ?auto_833529 ?auto_833531 ) ) ( not ( = ?auto_833529 ?auto_833532 ) ) ( not ( = ?auto_833529 ?auto_833533 ) ) ( not ( = ?auto_833529 ?auto_833534 ) ) ( not ( = ?auto_833529 ?auto_833536 ) ) ( not ( = ?auto_833530 ?auto_833531 ) ) ( not ( = ?auto_833530 ?auto_833532 ) ) ( not ( = ?auto_833530 ?auto_833533 ) ) ( not ( = ?auto_833530 ?auto_833534 ) ) ( not ( = ?auto_833530 ?auto_833536 ) ) ( not ( = ?auto_833531 ?auto_833532 ) ) ( not ( = ?auto_833531 ?auto_833533 ) ) ( not ( = ?auto_833531 ?auto_833534 ) ) ( not ( = ?auto_833531 ?auto_833536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_833532 ?auto_833533 ?auto_833534 )
      ( MAKE-12CRATE-VERIFY ?auto_833522 ?auto_833523 ?auto_833524 ?auto_833525 ?auto_833526 ?auto_833527 ?auto_833528 ?auto_833529 ?auto_833530 ?auto_833531 ?auto_833532 ?auto_833533 ?auto_833534 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_833685 - SURFACE
      ?auto_833686 - SURFACE
      ?auto_833687 - SURFACE
      ?auto_833688 - SURFACE
      ?auto_833689 - SURFACE
      ?auto_833690 - SURFACE
      ?auto_833691 - SURFACE
      ?auto_833692 - SURFACE
      ?auto_833693 - SURFACE
      ?auto_833694 - SURFACE
      ?auto_833695 - SURFACE
      ?auto_833696 - SURFACE
      ?auto_833697 - SURFACE
    )
    :vars
    (
      ?auto_833699 - HOIST
      ?auto_833698 - PLACE
      ?auto_833701 - PLACE
      ?auto_833702 - HOIST
      ?auto_833703 - SURFACE
      ?auto_833700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_833699 ?auto_833698 ) ( SURFACE-AT ?auto_833696 ?auto_833698 ) ( CLEAR ?auto_833696 ) ( IS-CRATE ?auto_833697 ) ( not ( = ?auto_833696 ?auto_833697 ) ) ( AVAILABLE ?auto_833699 ) ( ON ?auto_833696 ?auto_833695 ) ( not ( = ?auto_833695 ?auto_833696 ) ) ( not ( = ?auto_833695 ?auto_833697 ) ) ( not ( = ?auto_833701 ?auto_833698 ) ) ( HOIST-AT ?auto_833702 ?auto_833701 ) ( not ( = ?auto_833699 ?auto_833702 ) ) ( AVAILABLE ?auto_833702 ) ( SURFACE-AT ?auto_833697 ?auto_833701 ) ( ON ?auto_833697 ?auto_833703 ) ( CLEAR ?auto_833697 ) ( not ( = ?auto_833696 ?auto_833703 ) ) ( not ( = ?auto_833697 ?auto_833703 ) ) ( not ( = ?auto_833695 ?auto_833703 ) ) ( TRUCK-AT ?auto_833700 ?auto_833698 ) ( ON ?auto_833686 ?auto_833685 ) ( ON ?auto_833687 ?auto_833686 ) ( ON ?auto_833688 ?auto_833687 ) ( ON ?auto_833689 ?auto_833688 ) ( ON ?auto_833690 ?auto_833689 ) ( ON ?auto_833691 ?auto_833690 ) ( ON ?auto_833692 ?auto_833691 ) ( ON ?auto_833693 ?auto_833692 ) ( ON ?auto_833694 ?auto_833693 ) ( ON ?auto_833695 ?auto_833694 ) ( not ( = ?auto_833685 ?auto_833686 ) ) ( not ( = ?auto_833685 ?auto_833687 ) ) ( not ( = ?auto_833685 ?auto_833688 ) ) ( not ( = ?auto_833685 ?auto_833689 ) ) ( not ( = ?auto_833685 ?auto_833690 ) ) ( not ( = ?auto_833685 ?auto_833691 ) ) ( not ( = ?auto_833685 ?auto_833692 ) ) ( not ( = ?auto_833685 ?auto_833693 ) ) ( not ( = ?auto_833685 ?auto_833694 ) ) ( not ( = ?auto_833685 ?auto_833695 ) ) ( not ( = ?auto_833685 ?auto_833696 ) ) ( not ( = ?auto_833685 ?auto_833697 ) ) ( not ( = ?auto_833685 ?auto_833703 ) ) ( not ( = ?auto_833686 ?auto_833687 ) ) ( not ( = ?auto_833686 ?auto_833688 ) ) ( not ( = ?auto_833686 ?auto_833689 ) ) ( not ( = ?auto_833686 ?auto_833690 ) ) ( not ( = ?auto_833686 ?auto_833691 ) ) ( not ( = ?auto_833686 ?auto_833692 ) ) ( not ( = ?auto_833686 ?auto_833693 ) ) ( not ( = ?auto_833686 ?auto_833694 ) ) ( not ( = ?auto_833686 ?auto_833695 ) ) ( not ( = ?auto_833686 ?auto_833696 ) ) ( not ( = ?auto_833686 ?auto_833697 ) ) ( not ( = ?auto_833686 ?auto_833703 ) ) ( not ( = ?auto_833687 ?auto_833688 ) ) ( not ( = ?auto_833687 ?auto_833689 ) ) ( not ( = ?auto_833687 ?auto_833690 ) ) ( not ( = ?auto_833687 ?auto_833691 ) ) ( not ( = ?auto_833687 ?auto_833692 ) ) ( not ( = ?auto_833687 ?auto_833693 ) ) ( not ( = ?auto_833687 ?auto_833694 ) ) ( not ( = ?auto_833687 ?auto_833695 ) ) ( not ( = ?auto_833687 ?auto_833696 ) ) ( not ( = ?auto_833687 ?auto_833697 ) ) ( not ( = ?auto_833687 ?auto_833703 ) ) ( not ( = ?auto_833688 ?auto_833689 ) ) ( not ( = ?auto_833688 ?auto_833690 ) ) ( not ( = ?auto_833688 ?auto_833691 ) ) ( not ( = ?auto_833688 ?auto_833692 ) ) ( not ( = ?auto_833688 ?auto_833693 ) ) ( not ( = ?auto_833688 ?auto_833694 ) ) ( not ( = ?auto_833688 ?auto_833695 ) ) ( not ( = ?auto_833688 ?auto_833696 ) ) ( not ( = ?auto_833688 ?auto_833697 ) ) ( not ( = ?auto_833688 ?auto_833703 ) ) ( not ( = ?auto_833689 ?auto_833690 ) ) ( not ( = ?auto_833689 ?auto_833691 ) ) ( not ( = ?auto_833689 ?auto_833692 ) ) ( not ( = ?auto_833689 ?auto_833693 ) ) ( not ( = ?auto_833689 ?auto_833694 ) ) ( not ( = ?auto_833689 ?auto_833695 ) ) ( not ( = ?auto_833689 ?auto_833696 ) ) ( not ( = ?auto_833689 ?auto_833697 ) ) ( not ( = ?auto_833689 ?auto_833703 ) ) ( not ( = ?auto_833690 ?auto_833691 ) ) ( not ( = ?auto_833690 ?auto_833692 ) ) ( not ( = ?auto_833690 ?auto_833693 ) ) ( not ( = ?auto_833690 ?auto_833694 ) ) ( not ( = ?auto_833690 ?auto_833695 ) ) ( not ( = ?auto_833690 ?auto_833696 ) ) ( not ( = ?auto_833690 ?auto_833697 ) ) ( not ( = ?auto_833690 ?auto_833703 ) ) ( not ( = ?auto_833691 ?auto_833692 ) ) ( not ( = ?auto_833691 ?auto_833693 ) ) ( not ( = ?auto_833691 ?auto_833694 ) ) ( not ( = ?auto_833691 ?auto_833695 ) ) ( not ( = ?auto_833691 ?auto_833696 ) ) ( not ( = ?auto_833691 ?auto_833697 ) ) ( not ( = ?auto_833691 ?auto_833703 ) ) ( not ( = ?auto_833692 ?auto_833693 ) ) ( not ( = ?auto_833692 ?auto_833694 ) ) ( not ( = ?auto_833692 ?auto_833695 ) ) ( not ( = ?auto_833692 ?auto_833696 ) ) ( not ( = ?auto_833692 ?auto_833697 ) ) ( not ( = ?auto_833692 ?auto_833703 ) ) ( not ( = ?auto_833693 ?auto_833694 ) ) ( not ( = ?auto_833693 ?auto_833695 ) ) ( not ( = ?auto_833693 ?auto_833696 ) ) ( not ( = ?auto_833693 ?auto_833697 ) ) ( not ( = ?auto_833693 ?auto_833703 ) ) ( not ( = ?auto_833694 ?auto_833695 ) ) ( not ( = ?auto_833694 ?auto_833696 ) ) ( not ( = ?auto_833694 ?auto_833697 ) ) ( not ( = ?auto_833694 ?auto_833703 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_833695 ?auto_833696 ?auto_833697 )
      ( MAKE-12CRATE-VERIFY ?auto_833685 ?auto_833686 ?auto_833687 ?auto_833688 ?auto_833689 ?auto_833690 ?auto_833691 ?auto_833692 ?auto_833693 ?auto_833694 ?auto_833695 ?auto_833696 ?auto_833697 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_833848 - SURFACE
      ?auto_833849 - SURFACE
      ?auto_833850 - SURFACE
      ?auto_833851 - SURFACE
      ?auto_833852 - SURFACE
      ?auto_833853 - SURFACE
      ?auto_833854 - SURFACE
      ?auto_833855 - SURFACE
      ?auto_833856 - SURFACE
      ?auto_833857 - SURFACE
      ?auto_833858 - SURFACE
      ?auto_833859 - SURFACE
      ?auto_833860 - SURFACE
    )
    :vars
    (
      ?auto_833865 - HOIST
      ?auto_833861 - PLACE
      ?auto_833864 - PLACE
      ?auto_833863 - HOIST
      ?auto_833866 - SURFACE
      ?auto_833862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_833865 ?auto_833861 ) ( IS-CRATE ?auto_833860 ) ( not ( = ?auto_833859 ?auto_833860 ) ) ( not ( = ?auto_833858 ?auto_833859 ) ) ( not ( = ?auto_833858 ?auto_833860 ) ) ( not ( = ?auto_833864 ?auto_833861 ) ) ( HOIST-AT ?auto_833863 ?auto_833864 ) ( not ( = ?auto_833865 ?auto_833863 ) ) ( AVAILABLE ?auto_833863 ) ( SURFACE-AT ?auto_833860 ?auto_833864 ) ( ON ?auto_833860 ?auto_833866 ) ( CLEAR ?auto_833860 ) ( not ( = ?auto_833859 ?auto_833866 ) ) ( not ( = ?auto_833860 ?auto_833866 ) ) ( not ( = ?auto_833858 ?auto_833866 ) ) ( TRUCK-AT ?auto_833862 ?auto_833861 ) ( SURFACE-AT ?auto_833858 ?auto_833861 ) ( CLEAR ?auto_833858 ) ( LIFTING ?auto_833865 ?auto_833859 ) ( IS-CRATE ?auto_833859 ) ( ON ?auto_833849 ?auto_833848 ) ( ON ?auto_833850 ?auto_833849 ) ( ON ?auto_833851 ?auto_833850 ) ( ON ?auto_833852 ?auto_833851 ) ( ON ?auto_833853 ?auto_833852 ) ( ON ?auto_833854 ?auto_833853 ) ( ON ?auto_833855 ?auto_833854 ) ( ON ?auto_833856 ?auto_833855 ) ( ON ?auto_833857 ?auto_833856 ) ( ON ?auto_833858 ?auto_833857 ) ( not ( = ?auto_833848 ?auto_833849 ) ) ( not ( = ?auto_833848 ?auto_833850 ) ) ( not ( = ?auto_833848 ?auto_833851 ) ) ( not ( = ?auto_833848 ?auto_833852 ) ) ( not ( = ?auto_833848 ?auto_833853 ) ) ( not ( = ?auto_833848 ?auto_833854 ) ) ( not ( = ?auto_833848 ?auto_833855 ) ) ( not ( = ?auto_833848 ?auto_833856 ) ) ( not ( = ?auto_833848 ?auto_833857 ) ) ( not ( = ?auto_833848 ?auto_833858 ) ) ( not ( = ?auto_833848 ?auto_833859 ) ) ( not ( = ?auto_833848 ?auto_833860 ) ) ( not ( = ?auto_833848 ?auto_833866 ) ) ( not ( = ?auto_833849 ?auto_833850 ) ) ( not ( = ?auto_833849 ?auto_833851 ) ) ( not ( = ?auto_833849 ?auto_833852 ) ) ( not ( = ?auto_833849 ?auto_833853 ) ) ( not ( = ?auto_833849 ?auto_833854 ) ) ( not ( = ?auto_833849 ?auto_833855 ) ) ( not ( = ?auto_833849 ?auto_833856 ) ) ( not ( = ?auto_833849 ?auto_833857 ) ) ( not ( = ?auto_833849 ?auto_833858 ) ) ( not ( = ?auto_833849 ?auto_833859 ) ) ( not ( = ?auto_833849 ?auto_833860 ) ) ( not ( = ?auto_833849 ?auto_833866 ) ) ( not ( = ?auto_833850 ?auto_833851 ) ) ( not ( = ?auto_833850 ?auto_833852 ) ) ( not ( = ?auto_833850 ?auto_833853 ) ) ( not ( = ?auto_833850 ?auto_833854 ) ) ( not ( = ?auto_833850 ?auto_833855 ) ) ( not ( = ?auto_833850 ?auto_833856 ) ) ( not ( = ?auto_833850 ?auto_833857 ) ) ( not ( = ?auto_833850 ?auto_833858 ) ) ( not ( = ?auto_833850 ?auto_833859 ) ) ( not ( = ?auto_833850 ?auto_833860 ) ) ( not ( = ?auto_833850 ?auto_833866 ) ) ( not ( = ?auto_833851 ?auto_833852 ) ) ( not ( = ?auto_833851 ?auto_833853 ) ) ( not ( = ?auto_833851 ?auto_833854 ) ) ( not ( = ?auto_833851 ?auto_833855 ) ) ( not ( = ?auto_833851 ?auto_833856 ) ) ( not ( = ?auto_833851 ?auto_833857 ) ) ( not ( = ?auto_833851 ?auto_833858 ) ) ( not ( = ?auto_833851 ?auto_833859 ) ) ( not ( = ?auto_833851 ?auto_833860 ) ) ( not ( = ?auto_833851 ?auto_833866 ) ) ( not ( = ?auto_833852 ?auto_833853 ) ) ( not ( = ?auto_833852 ?auto_833854 ) ) ( not ( = ?auto_833852 ?auto_833855 ) ) ( not ( = ?auto_833852 ?auto_833856 ) ) ( not ( = ?auto_833852 ?auto_833857 ) ) ( not ( = ?auto_833852 ?auto_833858 ) ) ( not ( = ?auto_833852 ?auto_833859 ) ) ( not ( = ?auto_833852 ?auto_833860 ) ) ( not ( = ?auto_833852 ?auto_833866 ) ) ( not ( = ?auto_833853 ?auto_833854 ) ) ( not ( = ?auto_833853 ?auto_833855 ) ) ( not ( = ?auto_833853 ?auto_833856 ) ) ( not ( = ?auto_833853 ?auto_833857 ) ) ( not ( = ?auto_833853 ?auto_833858 ) ) ( not ( = ?auto_833853 ?auto_833859 ) ) ( not ( = ?auto_833853 ?auto_833860 ) ) ( not ( = ?auto_833853 ?auto_833866 ) ) ( not ( = ?auto_833854 ?auto_833855 ) ) ( not ( = ?auto_833854 ?auto_833856 ) ) ( not ( = ?auto_833854 ?auto_833857 ) ) ( not ( = ?auto_833854 ?auto_833858 ) ) ( not ( = ?auto_833854 ?auto_833859 ) ) ( not ( = ?auto_833854 ?auto_833860 ) ) ( not ( = ?auto_833854 ?auto_833866 ) ) ( not ( = ?auto_833855 ?auto_833856 ) ) ( not ( = ?auto_833855 ?auto_833857 ) ) ( not ( = ?auto_833855 ?auto_833858 ) ) ( not ( = ?auto_833855 ?auto_833859 ) ) ( not ( = ?auto_833855 ?auto_833860 ) ) ( not ( = ?auto_833855 ?auto_833866 ) ) ( not ( = ?auto_833856 ?auto_833857 ) ) ( not ( = ?auto_833856 ?auto_833858 ) ) ( not ( = ?auto_833856 ?auto_833859 ) ) ( not ( = ?auto_833856 ?auto_833860 ) ) ( not ( = ?auto_833856 ?auto_833866 ) ) ( not ( = ?auto_833857 ?auto_833858 ) ) ( not ( = ?auto_833857 ?auto_833859 ) ) ( not ( = ?auto_833857 ?auto_833860 ) ) ( not ( = ?auto_833857 ?auto_833866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_833858 ?auto_833859 ?auto_833860 )
      ( MAKE-12CRATE-VERIFY ?auto_833848 ?auto_833849 ?auto_833850 ?auto_833851 ?auto_833852 ?auto_833853 ?auto_833854 ?auto_833855 ?auto_833856 ?auto_833857 ?auto_833858 ?auto_833859 ?auto_833860 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_834011 - SURFACE
      ?auto_834012 - SURFACE
      ?auto_834013 - SURFACE
      ?auto_834014 - SURFACE
      ?auto_834015 - SURFACE
      ?auto_834016 - SURFACE
      ?auto_834017 - SURFACE
      ?auto_834018 - SURFACE
      ?auto_834019 - SURFACE
      ?auto_834020 - SURFACE
      ?auto_834021 - SURFACE
      ?auto_834022 - SURFACE
      ?auto_834023 - SURFACE
    )
    :vars
    (
      ?auto_834026 - HOIST
      ?auto_834028 - PLACE
      ?auto_834029 - PLACE
      ?auto_834024 - HOIST
      ?auto_834027 - SURFACE
      ?auto_834025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_834026 ?auto_834028 ) ( IS-CRATE ?auto_834023 ) ( not ( = ?auto_834022 ?auto_834023 ) ) ( not ( = ?auto_834021 ?auto_834022 ) ) ( not ( = ?auto_834021 ?auto_834023 ) ) ( not ( = ?auto_834029 ?auto_834028 ) ) ( HOIST-AT ?auto_834024 ?auto_834029 ) ( not ( = ?auto_834026 ?auto_834024 ) ) ( AVAILABLE ?auto_834024 ) ( SURFACE-AT ?auto_834023 ?auto_834029 ) ( ON ?auto_834023 ?auto_834027 ) ( CLEAR ?auto_834023 ) ( not ( = ?auto_834022 ?auto_834027 ) ) ( not ( = ?auto_834023 ?auto_834027 ) ) ( not ( = ?auto_834021 ?auto_834027 ) ) ( TRUCK-AT ?auto_834025 ?auto_834028 ) ( SURFACE-AT ?auto_834021 ?auto_834028 ) ( CLEAR ?auto_834021 ) ( IS-CRATE ?auto_834022 ) ( AVAILABLE ?auto_834026 ) ( IN ?auto_834022 ?auto_834025 ) ( ON ?auto_834012 ?auto_834011 ) ( ON ?auto_834013 ?auto_834012 ) ( ON ?auto_834014 ?auto_834013 ) ( ON ?auto_834015 ?auto_834014 ) ( ON ?auto_834016 ?auto_834015 ) ( ON ?auto_834017 ?auto_834016 ) ( ON ?auto_834018 ?auto_834017 ) ( ON ?auto_834019 ?auto_834018 ) ( ON ?auto_834020 ?auto_834019 ) ( ON ?auto_834021 ?auto_834020 ) ( not ( = ?auto_834011 ?auto_834012 ) ) ( not ( = ?auto_834011 ?auto_834013 ) ) ( not ( = ?auto_834011 ?auto_834014 ) ) ( not ( = ?auto_834011 ?auto_834015 ) ) ( not ( = ?auto_834011 ?auto_834016 ) ) ( not ( = ?auto_834011 ?auto_834017 ) ) ( not ( = ?auto_834011 ?auto_834018 ) ) ( not ( = ?auto_834011 ?auto_834019 ) ) ( not ( = ?auto_834011 ?auto_834020 ) ) ( not ( = ?auto_834011 ?auto_834021 ) ) ( not ( = ?auto_834011 ?auto_834022 ) ) ( not ( = ?auto_834011 ?auto_834023 ) ) ( not ( = ?auto_834011 ?auto_834027 ) ) ( not ( = ?auto_834012 ?auto_834013 ) ) ( not ( = ?auto_834012 ?auto_834014 ) ) ( not ( = ?auto_834012 ?auto_834015 ) ) ( not ( = ?auto_834012 ?auto_834016 ) ) ( not ( = ?auto_834012 ?auto_834017 ) ) ( not ( = ?auto_834012 ?auto_834018 ) ) ( not ( = ?auto_834012 ?auto_834019 ) ) ( not ( = ?auto_834012 ?auto_834020 ) ) ( not ( = ?auto_834012 ?auto_834021 ) ) ( not ( = ?auto_834012 ?auto_834022 ) ) ( not ( = ?auto_834012 ?auto_834023 ) ) ( not ( = ?auto_834012 ?auto_834027 ) ) ( not ( = ?auto_834013 ?auto_834014 ) ) ( not ( = ?auto_834013 ?auto_834015 ) ) ( not ( = ?auto_834013 ?auto_834016 ) ) ( not ( = ?auto_834013 ?auto_834017 ) ) ( not ( = ?auto_834013 ?auto_834018 ) ) ( not ( = ?auto_834013 ?auto_834019 ) ) ( not ( = ?auto_834013 ?auto_834020 ) ) ( not ( = ?auto_834013 ?auto_834021 ) ) ( not ( = ?auto_834013 ?auto_834022 ) ) ( not ( = ?auto_834013 ?auto_834023 ) ) ( not ( = ?auto_834013 ?auto_834027 ) ) ( not ( = ?auto_834014 ?auto_834015 ) ) ( not ( = ?auto_834014 ?auto_834016 ) ) ( not ( = ?auto_834014 ?auto_834017 ) ) ( not ( = ?auto_834014 ?auto_834018 ) ) ( not ( = ?auto_834014 ?auto_834019 ) ) ( not ( = ?auto_834014 ?auto_834020 ) ) ( not ( = ?auto_834014 ?auto_834021 ) ) ( not ( = ?auto_834014 ?auto_834022 ) ) ( not ( = ?auto_834014 ?auto_834023 ) ) ( not ( = ?auto_834014 ?auto_834027 ) ) ( not ( = ?auto_834015 ?auto_834016 ) ) ( not ( = ?auto_834015 ?auto_834017 ) ) ( not ( = ?auto_834015 ?auto_834018 ) ) ( not ( = ?auto_834015 ?auto_834019 ) ) ( not ( = ?auto_834015 ?auto_834020 ) ) ( not ( = ?auto_834015 ?auto_834021 ) ) ( not ( = ?auto_834015 ?auto_834022 ) ) ( not ( = ?auto_834015 ?auto_834023 ) ) ( not ( = ?auto_834015 ?auto_834027 ) ) ( not ( = ?auto_834016 ?auto_834017 ) ) ( not ( = ?auto_834016 ?auto_834018 ) ) ( not ( = ?auto_834016 ?auto_834019 ) ) ( not ( = ?auto_834016 ?auto_834020 ) ) ( not ( = ?auto_834016 ?auto_834021 ) ) ( not ( = ?auto_834016 ?auto_834022 ) ) ( not ( = ?auto_834016 ?auto_834023 ) ) ( not ( = ?auto_834016 ?auto_834027 ) ) ( not ( = ?auto_834017 ?auto_834018 ) ) ( not ( = ?auto_834017 ?auto_834019 ) ) ( not ( = ?auto_834017 ?auto_834020 ) ) ( not ( = ?auto_834017 ?auto_834021 ) ) ( not ( = ?auto_834017 ?auto_834022 ) ) ( not ( = ?auto_834017 ?auto_834023 ) ) ( not ( = ?auto_834017 ?auto_834027 ) ) ( not ( = ?auto_834018 ?auto_834019 ) ) ( not ( = ?auto_834018 ?auto_834020 ) ) ( not ( = ?auto_834018 ?auto_834021 ) ) ( not ( = ?auto_834018 ?auto_834022 ) ) ( not ( = ?auto_834018 ?auto_834023 ) ) ( not ( = ?auto_834018 ?auto_834027 ) ) ( not ( = ?auto_834019 ?auto_834020 ) ) ( not ( = ?auto_834019 ?auto_834021 ) ) ( not ( = ?auto_834019 ?auto_834022 ) ) ( not ( = ?auto_834019 ?auto_834023 ) ) ( not ( = ?auto_834019 ?auto_834027 ) ) ( not ( = ?auto_834020 ?auto_834021 ) ) ( not ( = ?auto_834020 ?auto_834022 ) ) ( not ( = ?auto_834020 ?auto_834023 ) ) ( not ( = ?auto_834020 ?auto_834027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_834021 ?auto_834022 ?auto_834023 )
      ( MAKE-12CRATE-VERIFY ?auto_834011 ?auto_834012 ?auto_834013 ?auto_834014 ?auto_834015 ?auto_834016 ?auto_834017 ?auto_834018 ?auto_834019 ?auto_834020 ?auto_834021 ?auto_834022 ?auto_834023 ) )
  )

)

