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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319945 - SURFACE
      ?auto_319946 - SURFACE
    )
    :vars
    (
      ?auto_319947 - HOIST
      ?auto_319948 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_319947 ?auto_319948 ) ( SURFACE-AT ?auto_319945 ?auto_319948 ) ( CLEAR ?auto_319945 ) ( LIFTING ?auto_319947 ?auto_319946 ) ( IS-CRATE ?auto_319946 ) ( not ( = ?auto_319945 ?auto_319946 ) ) )
    :subtasks
    ( ( !DROP ?auto_319947 ?auto_319946 ?auto_319945 ?auto_319948 )
      ( MAKE-1CRATE-VERIFY ?auto_319945 ?auto_319946 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319949 - SURFACE
      ?auto_319950 - SURFACE
    )
    :vars
    (
      ?auto_319952 - HOIST
      ?auto_319951 - PLACE
      ?auto_319953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319952 ?auto_319951 ) ( SURFACE-AT ?auto_319949 ?auto_319951 ) ( CLEAR ?auto_319949 ) ( IS-CRATE ?auto_319950 ) ( not ( = ?auto_319949 ?auto_319950 ) ) ( TRUCK-AT ?auto_319953 ?auto_319951 ) ( AVAILABLE ?auto_319952 ) ( IN ?auto_319950 ?auto_319953 ) )
    :subtasks
    ( ( !UNLOAD ?auto_319952 ?auto_319950 ?auto_319953 ?auto_319951 )
      ( MAKE-1CRATE ?auto_319949 ?auto_319950 )
      ( MAKE-1CRATE-VERIFY ?auto_319949 ?auto_319950 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319954 - SURFACE
      ?auto_319955 - SURFACE
    )
    :vars
    (
      ?auto_319958 - HOIST
      ?auto_319956 - PLACE
      ?auto_319957 - TRUCK
      ?auto_319959 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_319958 ?auto_319956 ) ( SURFACE-AT ?auto_319954 ?auto_319956 ) ( CLEAR ?auto_319954 ) ( IS-CRATE ?auto_319955 ) ( not ( = ?auto_319954 ?auto_319955 ) ) ( AVAILABLE ?auto_319958 ) ( IN ?auto_319955 ?auto_319957 ) ( TRUCK-AT ?auto_319957 ?auto_319959 ) ( not ( = ?auto_319959 ?auto_319956 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_319957 ?auto_319959 ?auto_319956 )
      ( MAKE-1CRATE ?auto_319954 ?auto_319955 )
      ( MAKE-1CRATE-VERIFY ?auto_319954 ?auto_319955 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319960 - SURFACE
      ?auto_319961 - SURFACE
    )
    :vars
    (
      ?auto_319964 - HOIST
      ?auto_319965 - PLACE
      ?auto_319963 - TRUCK
      ?auto_319962 - PLACE
      ?auto_319966 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_319964 ?auto_319965 ) ( SURFACE-AT ?auto_319960 ?auto_319965 ) ( CLEAR ?auto_319960 ) ( IS-CRATE ?auto_319961 ) ( not ( = ?auto_319960 ?auto_319961 ) ) ( AVAILABLE ?auto_319964 ) ( TRUCK-AT ?auto_319963 ?auto_319962 ) ( not ( = ?auto_319962 ?auto_319965 ) ) ( HOIST-AT ?auto_319966 ?auto_319962 ) ( LIFTING ?auto_319966 ?auto_319961 ) ( not ( = ?auto_319964 ?auto_319966 ) ) )
    :subtasks
    ( ( !LOAD ?auto_319966 ?auto_319961 ?auto_319963 ?auto_319962 )
      ( MAKE-1CRATE ?auto_319960 ?auto_319961 )
      ( MAKE-1CRATE-VERIFY ?auto_319960 ?auto_319961 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319967 - SURFACE
      ?auto_319968 - SURFACE
    )
    :vars
    (
      ?auto_319969 - HOIST
      ?auto_319973 - PLACE
      ?auto_319970 - TRUCK
      ?auto_319971 - PLACE
      ?auto_319972 - HOIST
      ?auto_319974 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_319969 ?auto_319973 ) ( SURFACE-AT ?auto_319967 ?auto_319973 ) ( CLEAR ?auto_319967 ) ( IS-CRATE ?auto_319968 ) ( not ( = ?auto_319967 ?auto_319968 ) ) ( AVAILABLE ?auto_319969 ) ( TRUCK-AT ?auto_319970 ?auto_319971 ) ( not ( = ?auto_319971 ?auto_319973 ) ) ( HOIST-AT ?auto_319972 ?auto_319971 ) ( not ( = ?auto_319969 ?auto_319972 ) ) ( AVAILABLE ?auto_319972 ) ( SURFACE-AT ?auto_319968 ?auto_319971 ) ( ON ?auto_319968 ?auto_319974 ) ( CLEAR ?auto_319968 ) ( not ( = ?auto_319967 ?auto_319974 ) ) ( not ( = ?auto_319968 ?auto_319974 ) ) )
    :subtasks
    ( ( !LIFT ?auto_319972 ?auto_319968 ?auto_319974 ?auto_319971 )
      ( MAKE-1CRATE ?auto_319967 ?auto_319968 )
      ( MAKE-1CRATE-VERIFY ?auto_319967 ?auto_319968 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319975 - SURFACE
      ?auto_319976 - SURFACE
    )
    :vars
    (
      ?auto_319978 - HOIST
      ?auto_319977 - PLACE
      ?auto_319981 - PLACE
      ?auto_319982 - HOIST
      ?auto_319980 - SURFACE
      ?auto_319979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319978 ?auto_319977 ) ( SURFACE-AT ?auto_319975 ?auto_319977 ) ( CLEAR ?auto_319975 ) ( IS-CRATE ?auto_319976 ) ( not ( = ?auto_319975 ?auto_319976 ) ) ( AVAILABLE ?auto_319978 ) ( not ( = ?auto_319981 ?auto_319977 ) ) ( HOIST-AT ?auto_319982 ?auto_319981 ) ( not ( = ?auto_319978 ?auto_319982 ) ) ( AVAILABLE ?auto_319982 ) ( SURFACE-AT ?auto_319976 ?auto_319981 ) ( ON ?auto_319976 ?auto_319980 ) ( CLEAR ?auto_319976 ) ( not ( = ?auto_319975 ?auto_319980 ) ) ( not ( = ?auto_319976 ?auto_319980 ) ) ( TRUCK-AT ?auto_319979 ?auto_319977 ) )
    :subtasks
    ( ( !DRIVE ?auto_319979 ?auto_319977 ?auto_319981 )
      ( MAKE-1CRATE ?auto_319975 ?auto_319976 )
      ( MAKE-1CRATE-VERIFY ?auto_319975 ?auto_319976 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_319992 - SURFACE
      ?auto_319993 - SURFACE
      ?auto_319994 - SURFACE
    )
    :vars
    (
      ?auto_319995 - HOIST
      ?auto_319996 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_319995 ?auto_319996 ) ( SURFACE-AT ?auto_319993 ?auto_319996 ) ( CLEAR ?auto_319993 ) ( LIFTING ?auto_319995 ?auto_319994 ) ( IS-CRATE ?auto_319994 ) ( not ( = ?auto_319993 ?auto_319994 ) ) ( ON ?auto_319993 ?auto_319992 ) ( not ( = ?auto_319992 ?auto_319993 ) ) ( not ( = ?auto_319992 ?auto_319994 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_319993 ?auto_319994 )
      ( MAKE-2CRATE-VERIFY ?auto_319992 ?auto_319993 ?auto_319994 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320002 - SURFACE
      ?auto_320003 - SURFACE
      ?auto_320004 - SURFACE
    )
    :vars
    (
      ?auto_320007 - HOIST
      ?auto_320005 - PLACE
      ?auto_320006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320007 ?auto_320005 ) ( SURFACE-AT ?auto_320003 ?auto_320005 ) ( CLEAR ?auto_320003 ) ( IS-CRATE ?auto_320004 ) ( not ( = ?auto_320003 ?auto_320004 ) ) ( TRUCK-AT ?auto_320006 ?auto_320005 ) ( AVAILABLE ?auto_320007 ) ( IN ?auto_320004 ?auto_320006 ) ( ON ?auto_320003 ?auto_320002 ) ( not ( = ?auto_320002 ?auto_320003 ) ) ( not ( = ?auto_320002 ?auto_320004 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320003 ?auto_320004 )
      ( MAKE-2CRATE-VERIFY ?auto_320002 ?auto_320003 ?auto_320004 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320008 - SURFACE
      ?auto_320009 - SURFACE
    )
    :vars
    (
      ?auto_320012 - HOIST
      ?auto_320010 - PLACE
      ?auto_320013 - TRUCK
      ?auto_320011 - SURFACE
      ?auto_320014 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320012 ?auto_320010 ) ( SURFACE-AT ?auto_320008 ?auto_320010 ) ( CLEAR ?auto_320008 ) ( IS-CRATE ?auto_320009 ) ( not ( = ?auto_320008 ?auto_320009 ) ) ( AVAILABLE ?auto_320012 ) ( IN ?auto_320009 ?auto_320013 ) ( ON ?auto_320008 ?auto_320011 ) ( not ( = ?auto_320011 ?auto_320008 ) ) ( not ( = ?auto_320011 ?auto_320009 ) ) ( TRUCK-AT ?auto_320013 ?auto_320014 ) ( not ( = ?auto_320014 ?auto_320010 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_320013 ?auto_320014 ?auto_320010 )
      ( MAKE-2CRATE ?auto_320011 ?auto_320008 ?auto_320009 )
      ( MAKE-1CRATE-VERIFY ?auto_320008 ?auto_320009 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320015 - SURFACE
      ?auto_320016 - SURFACE
      ?auto_320017 - SURFACE
    )
    :vars
    (
      ?auto_320018 - HOIST
      ?auto_320019 - PLACE
      ?auto_320020 - TRUCK
      ?auto_320021 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320018 ?auto_320019 ) ( SURFACE-AT ?auto_320016 ?auto_320019 ) ( CLEAR ?auto_320016 ) ( IS-CRATE ?auto_320017 ) ( not ( = ?auto_320016 ?auto_320017 ) ) ( AVAILABLE ?auto_320018 ) ( IN ?auto_320017 ?auto_320020 ) ( ON ?auto_320016 ?auto_320015 ) ( not ( = ?auto_320015 ?auto_320016 ) ) ( not ( = ?auto_320015 ?auto_320017 ) ) ( TRUCK-AT ?auto_320020 ?auto_320021 ) ( not ( = ?auto_320021 ?auto_320019 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320016 ?auto_320017 )
      ( MAKE-2CRATE-VERIFY ?auto_320015 ?auto_320016 ?auto_320017 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320022 - SURFACE
      ?auto_320023 - SURFACE
    )
    :vars
    (
      ?auto_320027 - HOIST
      ?auto_320026 - PLACE
      ?auto_320024 - SURFACE
      ?auto_320025 - TRUCK
      ?auto_320028 - PLACE
      ?auto_320029 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_320027 ?auto_320026 ) ( SURFACE-AT ?auto_320022 ?auto_320026 ) ( CLEAR ?auto_320022 ) ( IS-CRATE ?auto_320023 ) ( not ( = ?auto_320022 ?auto_320023 ) ) ( AVAILABLE ?auto_320027 ) ( ON ?auto_320022 ?auto_320024 ) ( not ( = ?auto_320024 ?auto_320022 ) ) ( not ( = ?auto_320024 ?auto_320023 ) ) ( TRUCK-AT ?auto_320025 ?auto_320028 ) ( not ( = ?auto_320028 ?auto_320026 ) ) ( HOIST-AT ?auto_320029 ?auto_320028 ) ( LIFTING ?auto_320029 ?auto_320023 ) ( not ( = ?auto_320027 ?auto_320029 ) ) )
    :subtasks
    ( ( !LOAD ?auto_320029 ?auto_320023 ?auto_320025 ?auto_320028 )
      ( MAKE-2CRATE ?auto_320024 ?auto_320022 ?auto_320023 )
      ( MAKE-1CRATE-VERIFY ?auto_320022 ?auto_320023 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320030 - SURFACE
      ?auto_320031 - SURFACE
      ?auto_320032 - SURFACE
    )
    :vars
    (
      ?auto_320037 - HOIST
      ?auto_320033 - PLACE
      ?auto_320035 - TRUCK
      ?auto_320036 - PLACE
      ?auto_320034 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_320037 ?auto_320033 ) ( SURFACE-AT ?auto_320031 ?auto_320033 ) ( CLEAR ?auto_320031 ) ( IS-CRATE ?auto_320032 ) ( not ( = ?auto_320031 ?auto_320032 ) ) ( AVAILABLE ?auto_320037 ) ( ON ?auto_320031 ?auto_320030 ) ( not ( = ?auto_320030 ?auto_320031 ) ) ( not ( = ?auto_320030 ?auto_320032 ) ) ( TRUCK-AT ?auto_320035 ?auto_320036 ) ( not ( = ?auto_320036 ?auto_320033 ) ) ( HOIST-AT ?auto_320034 ?auto_320036 ) ( LIFTING ?auto_320034 ?auto_320032 ) ( not ( = ?auto_320037 ?auto_320034 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320031 ?auto_320032 )
      ( MAKE-2CRATE-VERIFY ?auto_320030 ?auto_320031 ?auto_320032 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320038 - SURFACE
      ?auto_320039 - SURFACE
    )
    :vars
    (
      ?auto_320041 - HOIST
      ?auto_320044 - PLACE
      ?auto_320040 - SURFACE
      ?auto_320043 - TRUCK
      ?auto_320045 - PLACE
      ?auto_320042 - HOIST
      ?auto_320046 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320041 ?auto_320044 ) ( SURFACE-AT ?auto_320038 ?auto_320044 ) ( CLEAR ?auto_320038 ) ( IS-CRATE ?auto_320039 ) ( not ( = ?auto_320038 ?auto_320039 ) ) ( AVAILABLE ?auto_320041 ) ( ON ?auto_320038 ?auto_320040 ) ( not ( = ?auto_320040 ?auto_320038 ) ) ( not ( = ?auto_320040 ?auto_320039 ) ) ( TRUCK-AT ?auto_320043 ?auto_320045 ) ( not ( = ?auto_320045 ?auto_320044 ) ) ( HOIST-AT ?auto_320042 ?auto_320045 ) ( not ( = ?auto_320041 ?auto_320042 ) ) ( AVAILABLE ?auto_320042 ) ( SURFACE-AT ?auto_320039 ?auto_320045 ) ( ON ?auto_320039 ?auto_320046 ) ( CLEAR ?auto_320039 ) ( not ( = ?auto_320038 ?auto_320046 ) ) ( not ( = ?auto_320039 ?auto_320046 ) ) ( not ( = ?auto_320040 ?auto_320046 ) ) )
    :subtasks
    ( ( !LIFT ?auto_320042 ?auto_320039 ?auto_320046 ?auto_320045 )
      ( MAKE-2CRATE ?auto_320040 ?auto_320038 ?auto_320039 )
      ( MAKE-1CRATE-VERIFY ?auto_320038 ?auto_320039 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320047 - SURFACE
      ?auto_320048 - SURFACE
      ?auto_320049 - SURFACE
    )
    :vars
    (
      ?auto_320053 - HOIST
      ?auto_320050 - PLACE
      ?auto_320054 - TRUCK
      ?auto_320055 - PLACE
      ?auto_320052 - HOIST
      ?auto_320051 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320053 ?auto_320050 ) ( SURFACE-AT ?auto_320048 ?auto_320050 ) ( CLEAR ?auto_320048 ) ( IS-CRATE ?auto_320049 ) ( not ( = ?auto_320048 ?auto_320049 ) ) ( AVAILABLE ?auto_320053 ) ( ON ?auto_320048 ?auto_320047 ) ( not ( = ?auto_320047 ?auto_320048 ) ) ( not ( = ?auto_320047 ?auto_320049 ) ) ( TRUCK-AT ?auto_320054 ?auto_320055 ) ( not ( = ?auto_320055 ?auto_320050 ) ) ( HOIST-AT ?auto_320052 ?auto_320055 ) ( not ( = ?auto_320053 ?auto_320052 ) ) ( AVAILABLE ?auto_320052 ) ( SURFACE-AT ?auto_320049 ?auto_320055 ) ( ON ?auto_320049 ?auto_320051 ) ( CLEAR ?auto_320049 ) ( not ( = ?auto_320048 ?auto_320051 ) ) ( not ( = ?auto_320049 ?auto_320051 ) ) ( not ( = ?auto_320047 ?auto_320051 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320048 ?auto_320049 )
      ( MAKE-2CRATE-VERIFY ?auto_320047 ?auto_320048 ?auto_320049 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320056 - SURFACE
      ?auto_320057 - SURFACE
    )
    :vars
    (
      ?auto_320062 - HOIST
      ?auto_320058 - PLACE
      ?auto_320061 - SURFACE
      ?auto_320059 - PLACE
      ?auto_320063 - HOIST
      ?auto_320060 - SURFACE
      ?auto_320064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320062 ?auto_320058 ) ( SURFACE-AT ?auto_320056 ?auto_320058 ) ( CLEAR ?auto_320056 ) ( IS-CRATE ?auto_320057 ) ( not ( = ?auto_320056 ?auto_320057 ) ) ( AVAILABLE ?auto_320062 ) ( ON ?auto_320056 ?auto_320061 ) ( not ( = ?auto_320061 ?auto_320056 ) ) ( not ( = ?auto_320061 ?auto_320057 ) ) ( not ( = ?auto_320059 ?auto_320058 ) ) ( HOIST-AT ?auto_320063 ?auto_320059 ) ( not ( = ?auto_320062 ?auto_320063 ) ) ( AVAILABLE ?auto_320063 ) ( SURFACE-AT ?auto_320057 ?auto_320059 ) ( ON ?auto_320057 ?auto_320060 ) ( CLEAR ?auto_320057 ) ( not ( = ?auto_320056 ?auto_320060 ) ) ( not ( = ?auto_320057 ?auto_320060 ) ) ( not ( = ?auto_320061 ?auto_320060 ) ) ( TRUCK-AT ?auto_320064 ?auto_320058 ) )
    :subtasks
    ( ( !DRIVE ?auto_320064 ?auto_320058 ?auto_320059 )
      ( MAKE-2CRATE ?auto_320061 ?auto_320056 ?auto_320057 )
      ( MAKE-1CRATE-VERIFY ?auto_320056 ?auto_320057 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320065 - SURFACE
      ?auto_320066 - SURFACE
      ?auto_320067 - SURFACE
    )
    :vars
    (
      ?auto_320073 - HOIST
      ?auto_320071 - PLACE
      ?auto_320068 - PLACE
      ?auto_320072 - HOIST
      ?auto_320069 - SURFACE
      ?auto_320070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320073 ?auto_320071 ) ( SURFACE-AT ?auto_320066 ?auto_320071 ) ( CLEAR ?auto_320066 ) ( IS-CRATE ?auto_320067 ) ( not ( = ?auto_320066 ?auto_320067 ) ) ( AVAILABLE ?auto_320073 ) ( ON ?auto_320066 ?auto_320065 ) ( not ( = ?auto_320065 ?auto_320066 ) ) ( not ( = ?auto_320065 ?auto_320067 ) ) ( not ( = ?auto_320068 ?auto_320071 ) ) ( HOIST-AT ?auto_320072 ?auto_320068 ) ( not ( = ?auto_320073 ?auto_320072 ) ) ( AVAILABLE ?auto_320072 ) ( SURFACE-AT ?auto_320067 ?auto_320068 ) ( ON ?auto_320067 ?auto_320069 ) ( CLEAR ?auto_320067 ) ( not ( = ?auto_320066 ?auto_320069 ) ) ( not ( = ?auto_320067 ?auto_320069 ) ) ( not ( = ?auto_320065 ?auto_320069 ) ) ( TRUCK-AT ?auto_320070 ?auto_320071 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320066 ?auto_320067 )
      ( MAKE-2CRATE-VERIFY ?auto_320065 ?auto_320066 ?auto_320067 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320074 - SURFACE
      ?auto_320075 - SURFACE
    )
    :vars
    (
      ?auto_320078 - HOIST
      ?auto_320082 - PLACE
      ?auto_320080 - SURFACE
      ?auto_320076 - PLACE
      ?auto_320081 - HOIST
      ?auto_320077 - SURFACE
      ?auto_320079 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320078 ?auto_320082 ) ( IS-CRATE ?auto_320075 ) ( not ( = ?auto_320074 ?auto_320075 ) ) ( not ( = ?auto_320080 ?auto_320074 ) ) ( not ( = ?auto_320080 ?auto_320075 ) ) ( not ( = ?auto_320076 ?auto_320082 ) ) ( HOIST-AT ?auto_320081 ?auto_320076 ) ( not ( = ?auto_320078 ?auto_320081 ) ) ( AVAILABLE ?auto_320081 ) ( SURFACE-AT ?auto_320075 ?auto_320076 ) ( ON ?auto_320075 ?auto_320077 ) ( CLEAR ?auto_320075 ) ( not ( = ?auto_320074 ?auto_320077 ) ) ( not ( = ?auto_320075 ?auto_320077 ) ) ( not ( = ?auto_320080 ?auto_320077 ) ) ( TRUCK-AT ?auto_320079 ?auto_320082 ) ( SURFACE-AT ?auto_320080 ?auto_320082 ) ( CLEAR ?auto_320080 ) ( LIFTING ?auto_320078 ?auto_320074 ) ( IS-CRATE ?auto_320074 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320080 ?auto_320074 )
      ( MAKE-2CRATE ?auto_320080 ?auto_320074 ?auto_320075 )
      ( MAKE-1CRATE-VERIFY ?auto_320074 ?auto_320075 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320083 - SURFACE
      ?auto_320084 - SURFACE
      ?auto_320085 - SURFACE
    )
    :vars
    (
      ?auto_320090 - HOIST
      ?auto_320089 - PLACE
      ?auto_320086 - PLACE
      ?auto_320091 - HOIST
      ?auto_320088 - SURFACE
      ?auto_320087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320090 ?auto_320089 ) ( IS-CRATE ?auto_320085 ) ( not ( = ?auto_320084 ?auto_320085 ) ) ( not ( = ?auto_320083 ?auto_320084 ) ) ( not ( = ?auto_320083 ?auto_320085 ) ) ( not ( = ?auto_320086 ?auto_320089 ) ) ( HOIST-AT ?auto_320091 ?auto_320086 ) ( not ( = ?auto_320090 ?auto_320091 ) ) ( AVAILABLE ?auto_320091 ) ( SURFACE-AT ?auto_320085 ?auto_320086 ) ( ON ?auto_320085 ?auto_320088 ) ( CLEAR ?auto_320085 ) ( not ( = ?auto_320084 ?auto_320088 ) ) ( not ( = ?auto_320085 ?auto_320088 ) ) ( not ( = ?auto_320083 ?auto_320088 ) ) ( TRUCK-AT ?auto_320087 ?auto_320089 ) ( SURFACE-AT ?auto_320083 ?auto_320089 ) ( CLEAR ?auto_320083 ) ( LIFTING ?auto_320090 ?auto_320084 ) ( IS-CRATE ?auto_320084 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320084 ?auto_320085 )
      ( MAKE-2CRATE-VERIFY ?auto_320083 ?auto_320084 ?auto_320085 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320092 - SURFACE
      ?auto_320093 - SURFACE
    )
    :vars
    (
      ?auto_320100 - HOIST
      ?auto_320095 - PLACE
      ?auto_320099 - SURFACE
      ?auto_320097 - PLACE
      ?auto_320096 - HOIST
      ?auto_320094 - SURFACE
      ?auto_320098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320100 ?auto_320095 ) ( IS-CRATE ?auto_320093 ) ( not ( = ?auto_320092 ?auto_320093 ) ) ( not ( = ?auto_320099 ?auto_320092 ) ) ( not ( = ?auto_320099 ?auto_320093 ) ) ( not ( = ?auto_320097 ?auto_320095 ) ) ( HOIST-AT ?auto_320096 ?auto_320097 ) ( not ( = ?auto_320100 ?auto_320096 ) ) ( AVAILABLE ?auto_320096 ) ( SURFACE-AT ?auto_320093 ?auto_320097 ) ( ON ?auto_320093 ?auto_320094 ) ( CLEAR ?auto_320093 ) ( not ( = ?auto_320092 ?auto_320094 ) ) ( not ( = ?auto_320093 ?auto_320094 ) ) ( not ( = ?auto_320099 ?auto_320094 ) ) ( TRUCK-AT ?auto_320098 ?auto_320095 ) ( SURFACE-AT ?auto_320099 ?auto_320095 ) ( CLEAR ?auto_320099 ) ( IS-CRATE ?auto_320092 ) ( AVAILABLE ?auto_320100 ) ( IN ?auto_320092 ?auto_320098 ) )
    :subtasks
    ( ( !UNLOAD ?auto_320100 ?auto_320092 ?auto_320098 ?auto_320095 )
      ( MAKE-2CRATE ?auto_320099 ?auto_320092 ?auto_320093 )
      ( MAKE-1CRATE-VERIFY ?auto_320092 ?auto_320093 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320101 - SURFACE
      ?auto_320102 - SURFACE
      ?auto_320103 - SURFACE
    )
    :vars
    (
      ?auto_320104 - HOIST
      ?auto_320107 - PLACE
      ?auto_320105 - PLACE
      ?auto_320108 - HOIST
      ?auto_320106 - SURFACE
      ?auto_320109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320104 ?auto_320107 ) ( IS-CRATE ?auto_320103 ) ( not ( = ?auto_320102 ?auto_320103 ) ) ( not ( = ?auto_320101 ?auto_320102 ) ) ( not ( = ?auto_320101 ?auto_320103 ) ) ( not ( = ?auto_320105 ?auto_320107 ) ) ( HOIST-AT ?auto_320108 ?auto_320105 ) ( not ( = ?auto_320104 ?auto_320108 ) ) ( AVAILABLE ?auto_320108 ) ( SURFACE-AT ?auto_320103 ?auto_320105 ) ( ON ?auto_320103 ?auto_320106 ) ( CLEAR ?auto_320103 ) ( not ( = ?auto_320102 ?auto_320106 ) ) ( not ( = ?auto_320103 ?auto_320106 ) ) ( not ( = ?auto_320101 ?auto_320106 ) ) ( TRUCK-AT ?auto_320109 ?auto_320107 ) ( SURFACE-AT ?auto_320101 ?auto_320107 ) ( CLEAR ?auto_320101 ) ( IS-CRATE ?auto_320102 ) ( AVAILABLE ?auto_320104 ) ( IN ?auto_320102 ?auto_320109 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320102 ?auto_320103 )
      ( MAKE-2CRATE-VERIFY ?auto_320101 ?auto_320102 ?auto_320103 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320146 - SURFACE
      ?auto_320147 - SURFACE
    )
    :vars
    (
      ?auto_320154 - HOIST
      ?auto_320153 - PLACE
      ?auto_320149 - SURFACE
      ?auto_320150 - PLACE
      ?auto_320152 - HOIST
      ?auto_320148 - SURFACE
      ?auto_320151 - TRUCK
      ?auto_320155 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320154 ?auto_320153 ) ( SURFACE-AT ?auto_320146 ?auto_320153 ) ( CLEAR ?auto_320146 ) ( IS-CRATE ?auto_320147 ) ( not ( = ?auto_320146 ?auto_320147 ) ) ( AVAILABLE ?auto_320154 ) ( ON ?auto_320146 ?auto_320149 ) ( not ( = ?auto_320149 ?auto_320146 ) ) ( not ( = ?auto_320149 ?auto_320147 ) ) ( not ( = ?auto_320150 ?auto_320153 ) ) ( HOIST-AT ?auto_320152 ?auto_320150 ) ( not ( = ?auto_320154 ?auto_320152 ) ) ( AVAILABLE ?auto_320152 ) ( SURFACE-AT ?auto_320147 ?auto_320150 ) ( ON ?auto_320147 ?auto_320148 ) ( CLEAR ?auto_320147 ) ( not ( = ?auto_320146 ?auto_320148 ) ) ( not ( = ?auto_320147 ?auto_320148 ) ) ( not ( = ?auto_320149 ?auto_320148 ) ) ( TRUCK-AT ?auto_320151 ?auto_320155 ) ( not ( = ?auto_320155 ?auto_320153 ) ) ( not ( = ?auto_320150 ?auto_320155 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_320151 ?auto_320155 ?auto_320153 )
      ( MAKE-1CRATE ?auto_320146 ?auto_320147 )
      ( MAKE-1CRATE-VERIFY ?auto_320146 ?auto_320147 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320185 - SURFACE
      ?auto_320186 - SURFACE
      ?auto_320187 - SURFACE
      ?auto_320188 - SURFACE
    )
    :vars
    (
      ?auto_320189 - HOIST
      ?auto_320190 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320189 ?auto_320190 ) ( SURFACE-AT ?auto_320187 ?auto_320190 ) ( CLEAR ?auto_320187 ) ( LIFTING ?auto_320189 ?auto_320188 ) ( IS-CRATE ?auto_320188 ) ( not ( = ?auto_320187 ?auto_320188 ) ) ( ON ?auto_320186 ?auto_320185 ) ( ON ?auto_320187 ?auto_320186 ) ( not ( = ?auto_320185 ?auto_320186 ) ) ( not ( = ?auto_320185 ?auto_320187 ) ) ( not ( = ?auto_320185 ?auto_320188 ) ) ( not ( = ?auto_320186 ?auto_320187 ) ) ( not ( = ?auto_320186 ?auto_320188 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320187 ?auto_320188 )
      ( MAKE-3CRATE-VERIFY ?auto_320185 ?auto_320186 ?auto_320187 ?auto_320188 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320202 - SURFACE
      ?auto_320203 - SURFACE
      ?auto_320204 - SURFACE
      ?auto_320205 - SURFACE
    )
    :vars
    (
      ?auto_320206 - HOIST
      ?auto_320208 - PLACE
      ?auto_320207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320206 ?auto_320208 ) ( SURFACE-AT ?auto_320204 ?auto_320208 ) ( CLEAR ?auto_320204 ) ( IS-CRATE ?auto_320205 ) ( not ( = ?auto_320204 ?auto_320205 ) ) ( TRUCK-AT ?auto_320207 ?auto_320208 ) ( AVAILABLE ?auto_320206 ) ( IN ?auto_320205 ?auto_320207 ) ( ON ?auto_320204 ?auto_320203 ) ( not ( = ?auto_320203 ?auto_320204 ) ) ( not ( = ?auto_320203 ?auto_320205 ) ) ( ON ?auto_320203 ?auto_320202 ) ( not ( = ?auto_320202 ?auto_320203 ) ) ( not ( = ?auto_320202 ?auto_320204 ) ) ( not ( = ?auto_320202 ?auto_320205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320203 ?auto_320204 ?auto_320205 )
      ( MAKE-3CRATE-VERIFY ?auto_320202 ?auto_320203 ?auto_320204 ?auto_320205 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320223 - SURFACE
      ?auto_320224 - SURFACE
      ?auto_320225 - SURFACE
      ?auto_320226 - SURFACE
    )
    :vars
    (
      ?auto_320227 - HOIST
      ?auto_320230 - PLACE
      ?auto_320228 - TRUCK
      ?auto_320229 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320227 ?auto_320230 ) ( SURFACE-AT ?auto_320225 ?auto_320230 ) ( CLEAR ?auto_320225 ) ( IS-CRATE ?auto_320226 ) ( not ( = ?auto_320225 ?auto_320226 ) ) ( AVAILABLE ?auto_320227 ) ( IN ?auto_320226 ?auto_320228 ) ( ON ?auto_320225 ?auto_320224 ) ( not ( = ?auto_320224 ?auto_320225 ) ) ( not ( = ?auto_320224 ?auto_320226 ) ) ( TRUCK-AT ?auto_320228 ?auto_320229 ) ( not ( = ?auto_320229 ?auto_320230 ) ) ( ON ?auto_320224 ?auto_320223 ) ( not ( = ?auto_320223 ?auto_320224 ) ) ( not ( = ?auto_320223 ?auto_320225 ) ) ( not ( = ?auto_320223 ?auto_320226 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320224 ?auto_320225 ?auto_320226 )
      ( MAKE-3CRATE-VERIFY ?auto_320223 ?auto_320224 ?auto_320225 ?auto_320226 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320247 - SURFACE
      ?auto_320248 - SURFACE
      ?auto_320249 - SURFACE
      ?auto_320250 - SURFACE
    )
    :vars
    (
      ?auto_320252 - HOIST
      ?auto_320251 - PLACE
      ?auto_320254 - TRUCK
      ?auto_320253 - PLACE
      ?auto_320255 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_320252 ?auto_320251 ) ( SURFACE-AT ?auto_320249 ?auto_320251 ) ( CLEAR ?auto_320249 ) ( IS-CRATE ?auto_320250 ) ( not ( = ?auto_320249 ?auto_320250 ) ) ( AVAILABLE ?auto_320252 ) ( ON ?auto_320249 ?auto_320248 ) ( not ( = ?auto_320248 ?auto_320249 ) ) ( not ( = ?auto_320248 ?auto_320250 ) ) ( TRUCK-AT ?auto_320254 ?auto_320253 ) ( not ( = ?auto_320253 ?auto_320251 ) ) ( HOIST-AT ?auto_320255 ?auto_320253 ) ( LIFTING ?auto_320255 ?auto_320250 ) ( not ( = ?auto_320252 ?auto_320255 ) ) ( ON ?auto_320248 ?auto_320247 ) ( not ( = ?auto_320247 ?auto_320248 ) ) ( not ( = ?auto_320247 ?auto_320249 ) ) ( not ( = ?auto_320247 ?auto_320250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320248 ?auto_320249 ?auto_320250 )
      ( MAKE-3CRATE-VERIFY ?auto_320247 ?auto_320248 ?auto_320249 ?auto_320250 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320274 - SURFACE
      ?auto_320275 - SURFACE
      ?auto_320276 - SURFACE
      ?auto_320277 - SURFACE
    )
    :vars
    (
      ?auto_320279 - HOIST
      ?auto_320278 - PLACE
      ?auto_320283 - TRUCK
      ?auto_320280 - PLACE
      ?auto_320282 - HOIST
      ?auto_320281 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320279 ?auto_320278 ) ( SURFACE-AT ?auto_320276 ?auto_320278 ) ( CLEAR ?auto_320276 ) ( IS-CRATE ?auto_320277 ) ( not ( = ?auto_320276 ?auto_320277 ) ) ( AVAILABLE ?auto_320279 ) ( ON ?auto_320276 ?auto_320275 ) ( not ( = ?auto_320275 ?auto_320276 ) ) ( not ( = ?auto_320275 ?auto_320277 ) ) ( TRUCK-AT ?auto_320283 ?auto_320280 ) ( not ( = ?auto_320280 ?auto_320278 ) ) ( HOIST-AT ?auto_320282 ?auto_320280 ) ( not ( = ?auto_320279 ?auto_320282 ) ) ( AVAILABLE ?auto_320282 ) ( SURFACE-AT ?auto_320277 ?auto_320280 ) ( ON ?auto_320277 ?auto_320281 ) ( CLEAR ?auto_320277 ) ( not ( = ?auto_320276 ?auto_320281 ) ) ( not ( = ?auto_320277 ?auto_320281 ) ) ( not ( = ?auto_320275 ?auto_320281 ) ) ( ON ?auto_320275 ?auto_320274 ) ( not ( = ?auto_320274 ?auto_320275 ) ) ( not ( = ?auto_320274 ?auto_320276 ) ) ( not ( = ?auto_320274 ?auto_320277 ) ) ( not ( = ?auto_320274 ?auto_320281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320275 ?auto_320276 ?auto_320277 )
      ( MAKE-3CRATE-VERIFY ?auto_320274 ?auto_320275 ?auto_320276 ?auto_320277 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320302 - SURFACE
      ?auto_320303 - SURFACE
      ?auto_320304 - SURFACE
      ?auto_320305 - SURFACE
    )
    :vars
    (
      ?auto_320306 - HOIST
      ?auto_320310 - PLACE
      ?auto_320311 - PLACE
      ?auto_320307 - HOIST
      ?auto_320308 - SURFACE
      ?auto_320309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320306 ?auto_320310 ) ( SURFACE-AT ?auto_320304 ?auto_320310 ) ( CLEAR ?auto_320304 ) ( IS-CRATE ?auto_320305 ) ( not ( = ?auto_320304 ?auto_320305 ) ) ( AVAILABLE ?auto_320306 ) ( ON ?auto_320304 ?auto_320303 ) ( not ( = ?auto_320303 ?auto_320304 ) ) ( not ( = ?auto_320303 ?auto_320305 ) ) ( not ( = ?auto_320311 ?auto_320310 ) ) ( HOIST-AT ?auto_320307 ?auto_320311 ) ( not ( = ?auto_320306 ?auto_320307 ) ) ( AVAILABLE ?auto_320307 ) ( SURFACE-AT ?auto_320305 ?auto_320311 ) ( ON ?auto_320305 ?auto_320308 ) ( CLEAR ?auto_320305 ) ( not ( = ?auto_320304 ?auto_320308 ) ) ( not ( = ?auto_320305 ?auto_320308 ) ) ( not ( = ?auto_320303 ?auto_320308 ) ) ( TRUCK-AT ?auto_320309 ?auto_320310 ) ( ON ?auto_320303 ?auto_320302 ) ( not ( = ?auto_320302 ?auto_320303 ) ) ( not ( = ?auto_320302 ?auto_320304 ) ) ( not ( = ?auto_320302 ?auto_320305 ) ) ( not ( = ?auto_320302 ?auto_320308 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320303 ?auto_320304 ?auto_320305 )
      ( MAKE-3CRATE-VERIFY ?auto_320302 ?auto_320303 ?auto_320304 ?auto_320305 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320330 - SURFACE
      ?auto_320331 - SURFACE
      ?auto_320332 - SURFACE
      ?auto_320333 - SURFACE
    )
    :vars
    (
      ?auto_320336 - HOIST
      ?auto_320335 - PLACE
      ?auto_320338 - PLACE
      ?auto_320337 - HOIST
      ?auto_320339 - SURFACE
      ?auto_320334 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320336 ?auto_320335 ) ( IS-CRATE ?auto_320333 ) ( not ( = ?auto_320332 ?auto_320333 ) ) ( not ( = ?auto_320331 ?auto_320332 ) ) ( not ( = ?auto_320331 ?auto_320333 ) ) ( not ( = ?auto_320338 ?auto_320335 ) ) ( HOIST-AT ?auto_320337 ?auto_320338 ) ( not ( = ?auto_320336 ?auto_320337 ) ) ( AVAILABLE ?auto_320337 ) ( SURFACE-AT ?auto_320333 ?auto_320338 ) ( ON ?auto_320333 ?auto_320339 ) ( CLEAR ?auto_320333 ) ( not ( = ?auto_320332 ?auto_320339 ) ) ( not ( = ?auto_320333 ?auto_320339 ) ) ( not ( = ?auto_320331 ?auto_320339 ) ) ( TRUCK-AT ?auto_320334 ?auto_320335 ) ( SURFACE-AT ?auto_320331 ?auto_320335 ) ( CLEAR ?auto_320331 ) ( LIFTING ?auto_320336 ?auto_320332 ) ( IS-CRATE ?auto_320332 ) ( ON ?auto_320331 ?auto_320330 ) ( not ( = ?auto_320330 ?auto_320331 ) ) ( not ( = ?auto_320330 ?auto_320332 ) ) ( not ( = ?auto_320330 ?auto_320333 ) ) ( not ( = ?auto_320330 ?auto_320339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320331 ?auto_320332 ?auto_320333 )
      ( MAKE-3CRATE-VERIFY ?auto_320330 ?auto_320331 ?auto_320332 ?auto_320333 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320358 - SURFACE
      ?auto_320359 - SURFACE
      ?auto_320360 - SURFACE
      ?auto_320361 - SURFACE
    )
    :vars
    (
      ?auto_320363 - HOIST
      ?auto_320362 - PLACE
      ?auto_320367 - PLACE
      ?auto_320366 - HOIST
      ?auto_320365 - SURFACE
      ?auto_320364 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320363 ?auto_320362 ) ( IS-CRATE ?auto_320361 ) ( not ( = ?auto_320360 ?auto_320361 ) ) ( not ( = ?auto_320359 ?auto_320360 ) ) ( not ( = ?auto_320359 ?auto_320361 ) ) ( not ( = ?auto_320367 ?auto_320362 ) ) ( HOIST-AT ?auto_320366 ?auto_320367 ) ( not ( = ?auto_320363 ?auto_320366 ) ) ( AVAILABLE ?auto_320366 ) ( SURFACE-AT ?auto_320361 ?auto_320367 ) ( ON ?auto_320361 ?auto_320365 ) ( CLEAR ?auto_320361 ) ( not ( = ?auto_320360 ?auto_320365 ) ) ( not ( = ?auto_320361 ?auto_320365 ) ) ( not ( = ?auto_320359 ?auto_320365 ) ) ( TRUCK-AT ?auto_320364 ?auto_320362 ) ( SURFACE-AT ?auto_320359 ?auto_320362 ) ( CLEAR ?auto_320359 ) ( IS-CRATE ?auto_320360 ) ( AVAILABLE ?auto_320363 ) ( IN ?auto_320360 ?auto_320364 ) ( ON ?auto_320359 ?auto_320358 ) ( not ( = ?auto_320358 ?auto_320359 ) ) ( not ( = ?auto_320358 ?auto_320360 ) ) ( not ( = ?auto_320358 ?auto_320361 ) ) ( not ( = ?auto_320358 ?auto_320365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320359 ?auto_320360 ?auto_320361 )
      ( MAKE-3CRATE-VERIFY ?auto_320358 ?auto_320359 ?auto_320360 ?auto_320361 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320649 - SURFACE
      ?auto_320650 - SURFACE
      ?auto_320651 - SURFACE
      ?auto_320652 - SURFACE
      ?auto_320653 - SURFACE
    )
    :vars
    (
      ?auto_320654 - HOIST
      ?auto_320655 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320654 ?auto_320655 ) ( SURFACE-AT ?auto_320652 ?auto_320655 ) ( CLEAR ?auto_320652 ) ( LIFTING ?auto_320654 ?auto_320653 ) ( IS-CRATE ?auto_320653 ) ( not ( = ?auto_320652 ?auto_320653 ) ) ( ON ?auto_320650 ?auto_320649 ) ( ON ?auto_320651 ?auto_320650 ) ( ON ?auto_320652 ?auto_320651 ) ( not ( = ?auto_320649 ?auto_320650 ) ) ( not ( = ?auto_320649 ?auto_320651 ) ) ( not ( = ?auto_320649 ?auto_320652 ) ) ( not ( = ?auto_320649 ?auto_320653 ) ) ( not ( = ?auto_320650 ?auto_320651 ) ) ( not ( = ?auto_320650 ?auto_320652 ) ) ( not ( = ?auto_320650 ?auto_320653 ) ) ( not ( = ?auto_320651 ?auto_320652 ) ) ( not ( = ?auto_320651 ?auto_320653 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320652 ?auto_320653 )
      ( MAKE-4CRATE-VERIFY ?auto_320649 ?auto_320650 ?auto_320651 ?auto_320652 ?auto_320653 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320674 - SURFACE
      ?auto_320675 - SURFACE
      ?auto_320676 - SURFACE
      ?auto_320677 - SURFACE
      ?auto_320678 - SURFACE
    )
    :vars
    (
      ?auto_320679 - HOIST
      ?auto_320681 - PLACE
      ?auto_320680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320679 ?auto_320681 ) ( SURFACE-AT ?auto_320677 ?auto_320681 ) ( CLEAR ?auto_320677 ) ( IS-CRATE ?auto_320678 ) ( not ( = ?auto_320677 ?auto_320678 ) ) ( TRUCK-AT ?auto_320680 ?auto_320681 ) ( AVAILABLE ?auto_320679 ) ( IN ?auto_320678 ?auto_320680 ) ( ON ?auto_320677 ?auto_320676 ) ( not ( = ?auto_320676 ?auto_320677 ) ) ( not ( = ?auto_320676 ?auto_320678 ) ) ( ON ?auto_320675 ?auto_320674 ) ( ON ?auto_320676 ?auto_320675 ) ( not ( = ?auto_320674 ?auto_320675 ) ) ( not ( = ?auto_320674 ?auto_320676 ) ) ( not ( = ?auto_320674 ?auto_320677 ) ) ( not ( = ?auto_320674 ?auto_320678 ) ) ( not ( = ?auto_320675 ?auto_320676 ) ) ( not ( = ?auto_320675 ?auto_320677 ) ) ( not ( = ?auto_320675 ?auto_320678 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320676 ?auto_320677 ?auto_320678 )
      ( MAKE-4CRATE-VERIFY ?auto_320674 ?auto_320675 ?auto_320676 ?auto_320677 ?auto_320678 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320704 - SURFACE
      ?auto_320705 - SURFACE
      ?auto_320706 - SURFACE
      ?auto_320707 - SURFACE
      ?auto_320708 - SURFACE
    )
    :vars
    (
      ?auto_320710 - HOIST
      ?auto_320709 - PLACE
      ?auto_320711 - TRUCK
      ?auto_320712 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320710 ?auto_320709 ) ( SURFACE-AT ?auto_320707 ?auto_320709 ) ( CLEAR ?auto_320707 ) ( IS-CRATE ?auto_320708 ) ( not ( = ?auto_320707 ?auto_320708 ) ) ( AVAILABLE ?auto_320710 ) ( IN ?auto_320708 ?auto_320711 ) ( ON ?auto_320707 ?auto_320706 ) ( not ( = ?auto_320706 ?auto_320707 ) ) ( not ( = ?auto_320706 ?auto_320708 ) ) ( TRUCK-AT ?auto_320711 ?auto_320712 ) ( not ( = ?auto_320712 ?auto_320709 ) ) ( ON ?auto_320705 ?auto_320704 ) ( ON ?auto_320706 ?auto_320705 ) ( not ( = ?auto_320704 ?auto_320705 ) ) ( not ( = ?auto_320704 ?auto_320706 ) ) ( not ( = ?auto_320704 ?auto_320707 ) ) ( not ( = ?auto_320704 ?auto_320708 ) ) ( not ( = ?auto_320705 ?auto_320706 ) ) ( not ( = ?auto_320705 ?auto_320707 ) ) ( not ( = ?auto_320705 ?auto_320708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320706 ?auto_320707 ?auto_320708 )
      ( MAKE-4CRATE-VERIFY ?auto_320704 ?auto_320705 ?auto_320706 ?auto_320707 ?auto_320708 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320738 - SURFACE
      ?auto_320739 - SURFACE
      ?auto_320740 - SURFACE
      ?auto_320741 - SURFACE
      ?auto_320742 - SURFACE
    )
    :vars
    (
      ?auto_320743 - HOIST
      ?auto_320745 - PLACE
      ?auto_320746 - TRUCK
      ?auto_320744 - PLACE
      ?auto_320747 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_320743 ?auto_320745 ) ( SURFACE-AT ?auto_320741 ?auto_320745 ) ( CLEAR ?auto_320741 ) ( IS-CRATE ?auto_320742 ) ( not ( = ?auto_320741 ?auto_320742 ) ) ( AVAILABLE ?auto_320743 ) ( ON ?auto_320741 ?auto_320740 ) ( not ( = ?auto_320740 ?auto_320741 ) ) ( not ( = ?auto_320740 ?auto_320742 ) ) ( TRUCK-AT ?auto_320746 ?auto_320744 ) ( not ( = ?auto_320744 ?auto_320745 ) ) ( HOIST-AT ?auto_320747 ?auto_320744 ) ( LIFTING ?auto_320747 ?auto_320742 ) ( not ( = ?auto_320743 ?auto_320747 ) ) ( ON ?auto_320739 ?auto_320738 ) ( ON ?auto_320740 ?auto_320739 ) ( not ( = ?auto_320738 ?auto_320739 ) ) ( not ( = ?auto_320738 ?auto_320740 ) ) ( not ( = ?auto_320738 ?auto_320741 ) ) ( not ( = ?auto_320738 ?auto_320742 ) ) ( not ( = ?auto_320739 ?auto_320740 ) ) ( not ( = ?auto_320739 ?auto_320741 ) ) ( not ( = ?auto_320739 ?auto_320742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320740 ?auto_320741 ?auto_320742 )
      ( MAKE-4CRATE-VERIFY ?auto_320738 ?auto_320739 ?auto_320740 ?auto_320741 ?auto_320742 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320776 - SURFACE
      ?auto_320777 - SURFACE
      ?auto_320778 - SURFACE
      ?auto_320779 - SURFACE
      ?auto_320780 - SURFACE
    )
    :vars
    (
      ?auto_320782 - HOIST
      ?auto_320786 - PLACE
      ?auto_320784 - TRUCK
      ?auto_320783 - PLACE
      ?auto_320781 - HOIST
      ?auto_320785 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320782 ?auto_320786 ) ( SURFACE-AT ?auto_320779 ?auto_320786 ) ( CLEAR ?auto_320779 ) ( IS-CRATE ?auto_320780 ) ( not ( = ?auto_320779 ?auto_320780 ) ) ( AVAILABLE ?auto_320782 ) ( ON ?auto_320779 ?auto_320778 ) ( not ( = ?auto_320778 ?auto_320779 ) ) ( not ( = ?auto_320778 ?auto_320780 ) ) ( TRUCK-AT ?auto_320784 ?auto_320783 ) ( not ( = ?auto_320783 ?auto_320786 ) ) ( HOIST-AT ?auto_320781 ?auto_320783 ) ( not ( = ?auto_320782 ?auto_320781 ) ) ( AVAILABLE ?auto_320781 ) ( SURFACE-AT ?auto_320780 ?auto_320783 ) ( ON ?auto_320780 ?auto_320785 ) ( CLEAR ?auto_320780 ) ( not ( = ?auto_320779 ?auto_320785 ) ) ( not ( = ?auto_320780 ?auto_320785 ) ) ( not ( = ?auto_320778 ?auto_320785 ) ) ( ON ?auto_320777 ?auto_320776 ) ( ON ?auto_320778 ?auto_320777 ) ( not ( = ?auto_320776 ?auto_320777 ) ) ( not ( = ?auto_320776 ?auto_320778 ) ) ( not ( = ?auto_320776 ?auto_320779 ) ) ( not ( = ?auto_320776 ?auto_320780 ) ) ( not ( = ?auto_320776 ?auto_320785 ) ) ( not ( = ?auto_320777 ?auto_320778 ) ) ( not ( = ?auto_320777 ?auto_320779 ) ) ( not ( = ?auto_320777 ?auto_320780 ) ) ( not ( = ?auto_320777 ?auto_320785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320778 ?auto_320779 ?auto_320780 )
      ( MAKE-4CRATE-VERIFY ?auto_320776 ?auto_320777 ?auto_320778 ?auto_320779 ?auto_320780 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320815 - SURFACE
      ?auto_320816 - SURFACE
      ?auto_320817 - SURFACE
      ?auto_320818 - SURFACE
      ?auto_320819 - SURFACE
    )
    :vars
    (
      ?auto_320822 - HOIST
      ?auto_320824 - PLACE
      ?auto_320823 - PLACE
      ?auto_320821 - HOIST
      ?auto_320825 - SURFACE
      ?auto_320820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320822 ?auto_320824 ) ( SURFACE-AT ?auto_320818 ?auto_320824 ) ( CLEAR ?auto_320818 ) ( IS-CRATE ?auto_320819 ) ( not ( = ?auto_320818 ?auto_320819 ) ) ( AVAILABLE ?auto_320822 ) ( ON ?auto_320818 ?auto_320817 ) ( not ( = ?auto_320817 ?auto_320818 ) ) ( not ( = ?auto_320817 ?auto_320819 ) ) ( not ( = ?auto_320823 ?auto_320824 ) ) ( HOIST-AT ?auto_320821 ?auto_320823 ) ( not ( = ?auto_320822 ?auto_320821 ) ) ( AVAILABLE ?auto_320821 ) ( SURFACE-AT ?auto_320819 ?auto_320823 ) ( ON ?auto_320819 ?auto_320825 ) ( CLEAR ?auto_320819 ) ( not ( = ?auto_320818 ?auto_320825 ) ) ( not ( = ?auto_320819 ?auto_320825 ) ) ( not ( = ?auto_320817 ?auto_320825 ) ) ( TRUCK-AT ?auto_320820 ?auto_320824 ) ( ON ?auto_320816 ?auto_320815 ) ( ON ?auto_320817 ?auto_320816 ) ( not ( = ?auto_320815 ?auto_320816 ) ) ( not ( = ?auto_320815 ?auto_320817 ) ) ( not ( = ?auto_320815 ?auto_320818 ) ) ( not ( = ?auto_320815 ?auto_320819 ) ) ( not ( = ?auto_320815 ?auto_320825 ) ) ( not ( = ?auto_320816 ?auto_320817 ) ) ( not ( = ?auto_320816 ?auto_320818 ) ) ( not ( = ?auto_320816 ?auto_320819 ) ) ( not ( = ?auto_320816 ?auto_320825 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320817 ?auto_320818 ?auto_320819 )
      ( MAKE-4CRATE-VERIFY ?auto_320815 ?auto_320816 ?auto_320817 ?auto_320818 ?auto_320819 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320854 - SURFACE
      ?auto_320855 - SURFACE
      ?auto_320856 - SURFACE
      ?auto_320857 - SURFACE
      ?auto_320858 - SURFACE
    )
    :vars
    (
      ?auto_320863 - HOIST
      ?auto_320859 - PLACE
      ?auto_320862 - PLACE
      ?auto_320861 - HOIST
      ?auto_320860 - SURFACE
      ?auto_320864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320863 ?auto_320859 ) ( IS-CRATE ?auto_320858 ) ( not ( = ?auto_320857 ?auto_320858 ) ) ( not ( = ?auto_320856 ?auto_320857 ) ) ( not ( = ?auto_320856 ?auto_320858 ) ) ( not ( = ?auto_320862 ?auto_320859 ) ) ( HOIST-AT ?auto_320861 ?auto_320862 ) ( not ( = ?auto_320863 ?auto_320861 ) ) ( AVAILABLE ?auto_320861 ) ( SURFACE-AT ?auto_320858 ?auto_320862 ) ( ON ?auto_320858 ?auto_320860 ) ( CLEAR ?auto_320858 ) ( not ( = ?auto_320857 ?auto_320860 ) ) ( not ( = ?auto_320858 ?auto_320860 ) ) ( not ( = ?auto_320856 ?auto_320860 ) ) ( TRUCK-AT ?auto_320864 ?auto_320859 ) ( SURFACE-AT ?auto_320856 ?auto_320859 ) ( CLEAR ?auto_320856 ) ( LIFTING ?auto_320863 ?auto_320857 ) ( IS-CRATE ?auto_320857 ) ( ON ?auto_320855 ?auto_320854 ) ( ON ?auto_320856 ?auto_320855 ) ( not ( = ?auto_320854 ?auto_320855 ) ) ( not ( = ?auto_320854 ?auto_320856 ) ) ( not ( = ?auto_320854 ?auto_320857 ) ) ( not ( = ?auto_320854 ?auto_320858 ) ) ( not ( = ?auto_320854 ?auto_320860 ) ) ( not ( = ?auto_320855 ?auto_320856 ) ) ( not ( = ?auto_320855 ?auto_320857 ) ) ( not ( = ?auto_320855 ?auto_320858 ) ) ( not ( = ?auto_320855 ?auto_320860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320856 ?auto_320857 ?auto_320858 )
      ( MAKE-4CRATE-VERIFY ?auto_320854 ?auto_320855 ?auto_320856 ?auto_320857 ?auto_320858 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320893 - SURFACE
      ?auto_320894 - SURFACE
      ?auto_320895 - SURFACE
      ?auto_320896 - SURFACE
      ?auto_320897 - SURFACE
    )
    :vars
    (
      ?auto_320899 - HOIST
      ?auto_320898 - PLACE
      ?auto_320903 - PLACE
      ?auto_320900 - HOIST
      ?auto_320902 - SURFACE
      ?auto_320901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320899 ?auto_320898 ) ( IS-CRATE ?auto_320897 ) ( not ( = ?auto_320896 ?auto_320897 ) ) ( not ( = ?auto_320895 ?auto_320896 ) ) ( not ( = ?auto_320895 ?auto_320897 ) ) ( not ( = ?auto_320903 ?auto_320898 ) ) ( HOIST-AT ?auto_320900 ?auto_320903 ) ( not ( = ?auto_320899 ?auto_320900 ) ) ( AVAILABLE ?auto_320900 ) ( SURFACE-AT ?auto_320897 ?auto_320903 ) ( ON ?auto_320897 ?auto_320902 ) ( CLEAR ?auto_320897 ) ( not ( = ?auto_320896 ?auto_320902 ) ) ( not ( = ?auto_320897 ?auto_320902 ) ) ( not ( = ?auto_320895 ?auto_320902 ) ) ( TRUCK-AT ?auto_320901 ?auto_320898 ) ( SURFACE-AT ?auto_320895 ?auto_320898 ) ( CLEAR ?auto_320895 ) ( IS-CRATE ?auto_320896 ) ( AVAILABLE ?auto_320899 ) ( IN ?auto_320896 ?auto_320901 ) ( ON ?auto_320894 ?auto_320893 ) ( ON ?auto_320895 ?auto_320894 ) ( not ( = ?auto_320893 ?auto_320894 ) ) ( not ( = ?auto_320893 ?auto_320895 ) ) ( not ( = ?auto_320893 ?auto_320896 ) ) ( not ( = ?auto_320893 ?auto_320897 ) ) ( not ( = ?auto_320893 ?auto_320902 ) ) ( not ( = ?auto_320894 ?auto_320895 ) ) ( not ( = ?auto_320894 ?auto_320896 ) ) ( not ( = ?auto_320894 ?auto_320897 ) ) ( not ( = ?auto_320894 ?auto_320902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320895 ?auto_320896 ?auto_320897 )
      ( MAKE-4CRATE-VERIFY ?auto_320893 ?auto_320894 ?auto_320895 ?auto_320896 ?auto_320897 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321553 - SURFACE
      ?auto_321554 - SURFACE
      ?auto_321555 - SURFACE
      ?auto_321556 - SURFACE
      ?auto_321557 - SURFACE
      ?auto_321558 - SURFACE
    )
    :vars
    (
      ?auto_321560 - HOIST
      ?auto_321559 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321560 ?auto_321559 ) ( SURFACE-AT ?auto_321557 ?auto_321559 ) ( CLEAR ?auto_321557 ) ( LIFTING ?auto_321560 ?auto_321558 ) ( IS-CRATE ?auto_321558 ) ( not ( = ?auto_321557 ?auto_321558 ) ) ( ON ?auto_321554 ?auto_321553 ) ( ON ?auto_321555 ?auto_321554 ) ( ON ?auto_321556 ?auto_321555 ) ( ON ?auto_321557 ?auto_321556 ) ( not ( = ?auto_321553 ?auto_321554 ) ) ( not ( = ?auto_321553 ?auto_321555 ) ) ( not ( = ?auto_321553 ?auto_321556 ) ) ( not ( = ?auto_321553 ?auto_321557 ) ) ( not ( = ?auto_321553 ?auto_321558 ) ) ( not ( = ?auto_321554 ?auto_321555 ) ) ( not ( = ?auto_321554 ?auto_321556 ) ) ( not ( = ?auto_321554 ?auto_321557 ) ) ( not ( = ?auto_321554 ?auto_321558 ) ) ( not ( = ?auto_321555 ?auto_321556 ) ) ( not ( = ?auto_321555 ?auto_321557 ) ) ( not ( = ?auto_321555 ?auto_321558 ) ) ( not ( = ?auto_321556 ?auto_321557 ) ) ( not ( = ?auto_321556 ?auto_321558 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_321557 ?auto_321558 )
      ( MAKE-5CRATE-VERIFY ?auto_321553 ?auto_321554 ?auto_321555 ?auto_321556 ?auto_321557 ?auto_321558 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321587 - SURFACE
      ?auto_321588 - SURFACE
      ?auto_321589 - SURFACE
      ?auto_321590 - SURFACE
      ?auto_321591 - SURFACE
      ?auto_321592 - SURFACE
    )
    :vars
    (
      ?auto_321595 - HOIST
      ?auto_321594 - PLACE
      ?auto_321593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321595 ?auto_321594 ) ( SURFACE-AT ?auto_321591 ?auto_321594 ) ( CLEAR ?auto_321591 ) ( IS-CRATE ?auto_321592 ) ( not ( = ?auto_321591 ?auto_321592 ) ) ( TRUCK-AT ?auto_321593 ?auto_321594 ) ( AVAILABLE ?auto_321595 ) ( IN ?auto_321592 ?auto_321593 ) ( ON ?auto_321591 ?auto_321590 ) ( not ( = ?auto_321590 ?auto_321591 ) ) ( not ( = ?auto_321590 ?auto_321592 ) ) ( ON ?auto_321588 ?auto_321587 ) ( ON ?auto_321589 ?auto_321588 ) ( ON ?auto_321590 ?auto_321589 ) ( not ( = ?auto_321587 ?auto_321588 ) ) ( not ( = ?auto_321587 ?auto_321589 ) ) ( not ( = ?auto_321587 ?auto_321590 ) ) ( not ( = ?auto_321587 ?auto_321591 ) ) ( not ( = ?auto_321587 ?auto_321592 ) ) ( not ( = ?auto_321588 ?auto_321589 ) ) ( not ( = ?auto_321588 ?auto_321590 ) ) ( not ( = ?auto_321588 ?auto_321591 ) ) ( not ( = ?auto_321588 ?auto_321592 ) ) ( not ( = ?auto_321589 ?auto_321590 ) ) ( not ( = ?auto_321589 ?auto_321591 ) ) ( not ( = ?auto_321589 ?auto_321592 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321590 ?auto_321591 ?auto_321592 )
      ( MAKE-5CRATE-VERIFY ?auto_321587 ?auto_321588 ?auto_321589 ?auto_321590 ?auto_321591 ?auto_321592 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321627 - SURFACE
      ?auto_321628 - SURFACE
      ?auto_321629 - SURFACE
      ?auto_321630 - SURFACE
      ?auto_321631 - SURFACE
      ?auto_321632 - SURFACE
    )
    :vars
    (
      ?auto_321635 - HOIST
      ?auto_321636 - PLACE
      ?auto_321634 - TRUCK
      ?auto_321633 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321635 ?auto_321636 ) ( SURFACE-AT ?auto_321631 ?auto_321636 ) ( CLEAR ?auto_321631 ) ( IS-CRATE ?auto_321632 ) ( not ( = ?auto_321631 ?auto_321632 ) ) ( AVAILABLE ?auto_321635 ) ( IN ?auto_321632 ?auto_321634 ) ( ON ?auto_321631 ?auto_321630 ) ( not ( = ?auto_321630 ?auto_321631 ) ) ( not ( = ?auto_321630 ?auto_321632 ) ) ( TRUCK-AT ?auto_321634 ?auto_321633 ) ( not ( = ?auto_321633 ?auto_321636 ) ) ( ON ?auto_321628 ?auto_321627 ) ( ON ?auto_321629 ?auto_321628 ) ( ON ?auto_321630 ?auto_321629 ) ( not ( = ?auto_321627 ?auto_321628 ) ) ( not ( = ?auto_321627 ?auto_321629 ) ) ( not ( = ?auto_321627 ?auto_321630 ) ) ( not ( = ?auto_321627 ?auto_321631 ) ) ( not ( = ?auto_321627 ?auto_321632 ) ) ( not ( = ?auto_321628 ?auto_321629 ) ) ( not ( = ?auto_321628 ?auto_321630 ) ) ( not ( = ?auto_321628 ?auto_321631 ) ) ( not ( = ?auto_321628 ?auto_321632 ) ) ( not ( = ?auto_321629 ?auto_321630 ) ) ( not ( = ?auto_321629 ?auto_321631 ) ) ( not ( = ?auto_321629 ?auto_321632 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321630 ?auto_321631 ?auto_321632 )
      ( MAKE-5CRATE-VERIFY ?auto_321627 ?auto_321628 ?auto_321629 ?auto_321630 ?auto_321631 ?auto_321632 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321672 - SURFACE
      ?auto_321673 - SURFACE
      ?auto_321674 - SURFACE
      ?auto_321675 - SURFACE
      ?auto_321676 - SURFACE
      ?auto_321677 - SURFACE
    )
    :vars
    (
      ?auto_321680 - HOIST
      ?auto_321682 - PLACE
      ?auto_321681 - TRUCK
      ?auto_321678 - PLACE
      ?auto_321679 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_321680 ?auto_321682 ) ( SURFACE-AT ?auto_321676 ?auto_321682 ) ( CLEAR ?auto_321676 ) ( IS-CRATE ?auto_321677 ) ( not ( = ?auto_321676 ?auto_321677 ) ) ( AVAILABLE ?auto_321680 ) ( ON ?auto_321676 ?auto_321675 ) ( not ( = ?auto_321675 ?auto_321676 ) ) ( not ( = ?auto_321675 ?auto_321677 ) ) ( TRUCK-AT ?auto_321681 ?auto_321678 ) ( not ( = ?auto_321678 ?auto_321682 ) ) ( HOIST-AT ?auto_321679 ?auto_321678 ) ( LIFTING ?auto_321679 ?auto_321677 ) ( not ( = ?auto_321680 ?auto_321679 ) ) ( ON ?auto_321673 ?auto_321672 ) ( ON ?auto_321674 ?auto_321673 ) ( ON ?auto_321675 ?auto_321674 ) ( not ( = ?auto_321672 ?auto_321673 ) ) ( not ( = ?auto_321672 ?auto_321674 ) ) ( not ( = ?auto_321672 ?auto_321675 ) ) ( not ( = ?auto_321672 ?auto_321676 ) ) ( not ( = ?auto_321672 ?auto_321677 ) ) ( not ( = ?auto_321673 ?auto_321674 ) ) ( not ( = ?auto_321673 ?auto_321675 ) ) ( not ( = ?auto_321673 ?auto_321676 ) ) ( not ( = ?auto_321673 ?auto_321677 ) ) ( not ( = ?auto_321674 ?auto_321675 ) ) ( not ( = ?auto_321674 ?auto_321676 ) ) ( not ( = ?auto_321674 ?auto_321677 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321675 ?auto_321676 ?auto_321677 )
      ( MAKE-5CRATE-VERIFY ?auto_321672 ?auto_321673 ?auto_321674 ?auto_321675 ?auto_321676 ?auto_321677 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321722 - SURFACE
      ?auto_321723 - SURFACE
      ?auto_321724 - SURFACE
      ?auto_321725 - SURFACE
      ?auto_321726 - SURFACE
      ?auto_321727 - SURFACE
    )
    :vars
    (
      ?auto_321729 - HOIST
      ?auto_321731 - PLACE
      ?auto_321732 - TRUCK
      ?auto_321728 - PLACE
      ?auto_321730 - HOIST
      ?auto_321733 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321729 ?auto_321731 ) ( SURFACE-AT ?auto_321726 ?auto_321731 ) ( CLEAR ?auto_321726 ) ( IS-CRATE ?auto_321727 ) ( not ( = ?auto_321726 ?auto_321727 ) ) ( AVAILABLE ?auto_321729 ) ( ON ?auto_321726 ?auto_321725 ) ( not ( = ?auto_321725 ?auto_321726 ) ) ( not ( = ?auto_321725 ?auto_321727 ) ) ( TRUCK-AT ?auto_321732 ?auto_321728 ) ( not ( = ?auto_321728 ?auto_321731 ) ) ( HOIST-AT ?auto_321730 ?auto_321728 ) ( not ( = ?auto_321729 ?auto_321730 ) ) ( AVAILABLE ?auto_321730 ) ( SURFACE-AT ?auto_321727 ?auto_321728 ) ( ON ?auto_321727 ?auto_321733 ) ( CLEAR ?auto_321727 ) ( not ( = ?auto_321726 ?auto_321733 ) ) ( not ( = ?auto_321727 ?auto_321733 ) ) ( not ( = ?auto_321725 ?auto_321733 ) ) ( ON ?auto_321723 ?auto_321722 ) ( ON ?auto_321724 ?auto_321723 ) ( ON ?auto_321725 ?auto_321724 ) ( not ( = ?auto_321722 ?auto_321723 ) ) ( not ( = ?auto_321722 ?auto_321724 ) ) ( not ( = ?auto_321722 ?auto_321725 ) ) ( not ( = ?auto_321722 ?auto_321726 ) ) ( not ( = ?auto_321722 ?auto_321727 ) ) ( not ( = ?auto_321722 ?auto_321733 ) ) ( not ( = ?auto_321723 ?auto_321724 ) ) ( not ( = ?auto_321723 ?auto_321725 ) ) ( not ( = ?auto_321723 ?auto_321726 ) ) ( not ( = ?auto_321723 ?auto_321727 ) ) ( not ( = ?auto_321723 ?auto_321733 ) ) ( not ( = ?auto_321724 ?auto_321725 ) ) ( not ( = ?auto_321724 ?auto_321726 ) ) ( not ( = ?auto_321724 ?auto_321727 ) ) ( not ( = ?auto_321724 ?auto_321733 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321725 ?auto_321726 ?auto_321727 )
      ( MAKE-5CRATE-VERIFY ?auto_321722 ?auto_321723 ?auto_321724 ?auto_321725 ?auto_321726 ?auto_321727 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321773 - SURFACE
      ?auto_321774 - SURFACE
      ?auto_321775 - SURFACE
      ?auto_321776 - SURFACE
      ?auto_321777 - SURFACE
      ?auto_321778 - SURFACE
    )
    :vars
    (
      ?auto_321780 - HOIST
      ?auto_321781 - PLACE
      ?auto_321784 - PLACE
      ?auto_321779 - HOIST
      ?auto_321782 - SURFACE
      ?auto_321783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321780 ?auto_321781 ) ( SURFACE-AT ?auto_321777 ?auto_321781 ) ( CLEAR ?auto_321777 ) ( IS-CRATE ?auto_321778 ) ( not ( = ?auto_321777 ?auto_321778 ) ) ( AVAILABLE ?auto_321780 ) ( ON ?auto_321777 ?auto_321776 ) ( not ( = ?auto_321776 ?auto_321777 ) ) ( not ( = ?auto_321776 ?auto_321778 ) ) ( not ( = ?auto_321784 ?auto_321781 ) ) ( HOIST-AT ?auto_321779 ?auto_321784 ) ( not ( = ?auto_321780 ?auto_321779 ) ) ( AVAILABLE ?auto_321779 ) ( SURFACE-AT ?auto_321778 ?auto_321784 ) ( ON ?auto_321778 ?auto_321782 ) ( CLEAR ?auto_321778 ) ( not ( = ?auto_321777 ?auto_321782 ) ) ( not ( = ?auto_321778 ?auto_321782 ) ) ( not ( = ?auto_321776 ?auto_321782 ) ) ( TRUCK-AT ?auto_321783 ?auto_321781 ) ( ON ?auto_321774 ?auto_321773 ) ( ON ?auto_321775 ?auto_321774 ) ( ON ?auto_321776 ?auto_321775 ) ( not ( = ?auto_321773 ?auto_321774 ) ) ( not ( = ?auto_321773 ?auto_321775 ) ) ( not ( = ?auto_321773 ?auto_321776 ) ) ( not ( = ?auto_321773 ?auto_321777 ) ) ( not ( = ?auto_321773 ?auto_321778 ) ) ( not ( = ?auto_321773 ?auto_321782 ) ) ( not ( = ?auto_321774 ?auto_321775 ) ) ( not ( = ?auto_321774 ?auto_321776 ) ) ( not ( = ?auto_321774 ?auto_321777 ) ) ( not ( = ?auto_321774 ?auto_321778 ) ) ( not ( = ?auto_321774 ?auto_321782 ) ) ( not ( = ?auto_321775 ?auto_321776 ) ) ( not ( = ?auto_321775 ?auto_321777 ) ) ( not ( = ?auto_321775 ?auto_321778 ) ) ( not ( = ?auto_321775 ?auto_321782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321776 ?auto_321777 ?auto_321778 )
      ( MAKE-5CRATE-VERIFY ?auto_321773 ?auto_321774 ?auto_321775 ?auto_321776 ?auto_321777 ?auto_321778 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321824 - SURFACE
      ?auto_321825 - SURFACE
      ?auto_321826 - SURFACE
      ?auto_321827 - SURFACE
      ?auto_321828 - SURFACE
      ?auto_321829 - SURFACE
    )
    :vars
    (
      ?auto_321835 - HOIST
      ?auto_321831 - PLACE
      ?auto_321833 - PLACE
      ?auto_321834 - HOIST
      ?auto_321830 - SURFACE
      ?auto_321832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321835 ?auto_321831 ) ( IS-CRATE ?auto_321829 ) ( not ( = ?auto_321828 ?auto_321829 ) ) ( not ( = ?auto_321827 ?auto_321828 ) ) ( not ( = ?auto_321827 ?auto_321829 ) ) ( not ( = ?auto_321833 ?auto_321831 ) ) ( HOIST-AT ?auto_321834 ?auto_321833 ) ( not ( = ?auto_321835 ?auto_321834 ) ) ( AVAILABLE ?auto_321834 ) ( SURFACE-AT ?auto_321829 ?auto_321833 ) ( ON ?auto_321829 ?auto_321830 ) ( CLEAR ?auto_321829 ) ( not ( = ?auto_321828 ?auto_321830 ) ) ( not ( = ?auto_321829 ?auto_321830 ) ) ( not ( = ?auto_321827 ?auto_321830 ) ) ( TRUCK-AT ?auto_321832 ?auto_321831 ) ( SURFACE-AT ?auto_321827 ?auto_321831 ) ( CLEAR ?auto_321827 ) ( LIFTING ?auto_321835 ?auto_321828 ) ( IS-CRATE ?auto_321828 ) ( ON ?auto_321825 ?auto_321824 ) ( ON ?auto_321826 ?auto_321825 ) ( ON ?auto_321827 ?auto_321826 ) ( not ( = ?auto_321824 ?auto_321825 ) ) ( not ( = ?auto_321824 ?auto_321826 ) ) ( not ( = ?auto_321824 ?auto_321827 ) ) ( not ( = ?auto_321824 ?auto_321828 ) ) ( not ( = ?auto_321824 ?auto_321829 ) ) ( not ( = ?auto_321824 ?auto_321830 ) ) ( not ( = ?auto_321825 ?auto_321826 ) ) ( not ( = ?auto_321825 ?auto_321827 ) ) ( not ( = ?auto_321825 ?auto_321828 ) ) ( not ( = ?auto_321825 ?auto_321829 ) ) ( not ( = ?auto_321825 ?auto_321830 ) ) ( not ( = ?auto_321826 ?auto_321827 ) ) ( not ( = ?auto_321826 ?auto_321828 ) ) ( not ( = ?auto_321826 ?auto_321829 ) ) ( not ( = ?auto_321826 ?auto_321830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321827 ?auto_321828 ?auto_321829 )
      ( MAKE-5CRATE-VERIFY ?auto_321824 ?auto_321825 ?auto_321826 ?auto_321827 ?auto_321828 ?auto_321829 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321875 - SURFACE
      ?auto_321876 - SURFACE
      ?auto_321877 - SURFACE
      ?auto_321878 - SURFACE
      ?auto_321879 - SURFACE
      ?auto_321880 - SURFACE
    )
    :vars
    (
      ?auto_321884 - HOIST
      ?auto_321883 - PLACE
      ?auto_321885 - PLACE
      ?auto_321882 - HOIST
      ?auto_321881 - SURFACE
      ?auto_321886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321884 ?auto_321883 ) ( IS-CRATE ?auto_321880 ) ( not ( = ?auto_321879 ?auto_321880 ) ) ( not ( = ?auto_321878 ?auto_321879 ) ) ( not ( = ?auto_321878 ?auto_321880 ) ) ( not ( = ?auto_321885 ?auto_321883 ) ) ( HOIST-AT ?auto_321882 ?auto_321885 ) ( not ( = ?auto_321884 ?auto_321882 ) ) ( AVAILABLE ?auto_321882 ) ( SURFACE-AT ?auto_321880 ?auto_321885 ) ( ON ?auto_321880 ?auto_321881 ) ( CLEAR ?auto_321880 ) ( not ( = ?auto_321879 ?auto_321881 ) ) ( not ( = ?auto_321880 ?auto_321881 ) ) ( not ( = ?auto_321878 ?auto_321881 ) ) ( TRUCK-AT ?auto_321886 ?auto_321883 ) ( SURFACE-AT ?auto_321878 ?auto_321883 ) ( CLEAR ?auto_321878 ) ( IS-CRATE ?auto_321879 ) ( AVAILABLE ?auto_321884 ) ( IN ?auto_321879 ?auto_321886 ) ( ON ?auto_321876 ?auto_321875 ) ( ON ?auto_321877 ?auto_321876 ) ( ON ?auto_321878 ?auto_321877 ) ( not ( = ?auto_321875 ?auto_321876 ) ) ( not ( = ?auto_321875 ?auto_321877 ) ) ( not ( = ?auto_321875 ?auto_321878 ) ) ( not ( = ?auto_321875 ?auto_321879 ) ) ( not ( = ?auto_321875 ?auto_321880 ) ) ( not ( = ?auto_321875 ?auto_321881 ) ) ( not ( = ?auto_321876 ?auto_321877 ) ) ( not ( = ?auto_321876 ?auto_321878 ) ) ( not ( = ?auto_321876 ?auto_321879 ) ) ( not ( = ?auto_321876 ?auto_321880 ) ) ( not ( = ?auto_321876 ?auto_321881 ) ) ( not ( = ?auto_321877 ?auto_321878 ) ) ( not ( = ?auto_321877 ?auto_321879 ) ) ( not ( = ?auto_321877 ?auto_321880 ) ) ( not ( = ?auto_321877 ?auto_321881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321878 ?auto_321879 ?auto_321880 )
      ( MAKE-5CRATE-VERIFY ?auto_321875 ?auto_321876 ?auto_321877 ?auto_321878 ?auto_321879 ?auto_321880 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323084 - SURFACE
      ?auto_323085 - SURFACE
      ?auto_323086 - SURFACE
      ?auto_323087 - SURFACE
      ?auto_323088 - SURFACE
      ?auto_323089 - SURFACE
      ?auto_323090 - SURFACE
    )
    :vars
    (
      ?auto_323091 - HOIST
      ?auto_323092 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_323091 ?auto_323092 ) ( SURFACE-AT ?auto_323089 ?auto_323092 ) ( CLEAR ?auto_323089 ) ( LIFTING ?auto_323091 ?auto_323090 ) ( IS-CRATE ?auto_323090 ) ( not ( = ?auto_323089 ?auto_323090 ) ) ( ON ?auto_323085 ?auto_323084 ) ( ON ?auto_323086 ?auto_323085 ) ( ON ?auto_323087 ?auto_323086 ) ( ON ?auto_323088 ?auto_323087 ) ( ON ?auto_323089 ?auto_323088 ) ( not ( = ?auto_323084 ?auto_323085 ) ) ( not ( = ?auto_323084 ?auto_323086 ) ) ( not ( = ?auto_323084 ?auto_323087 ) ) ( not ( = ?auto_323084 ?auto_323088 ) ) ( not ( = ?auto_323084 ?auto_323089 ) ) ( not ( = ?auto_323084 ?auto_323090 ) ) ( not ( = ?auto_323085 ?auto_323086 ) ) ( not ( = ?auto_323085 ?auto_323087 ) ) ( not ( = ?auto_323085 ?auto_323088 ) ) ( not ( = ?auto_323085 ?auto_323089 ) ) ( not ( = ?auto_323085 ?auto_323090 ) ) ( not ( = ?auto_323086 ?auto_323087 ) ) ( not ( = ?auto_323086 ?auto_323088 ) ) ( not ( = ?auto_323086 ?auto_323089 ) ) ( not ( = ?auto_323086 ?auto_323090 ) ) ( not ( = ?auto_323087 ?auto_323088 ) ) ( not ( = ?auto_323087 ?auto_323089 ) ) ( not ( = ?auto_323087 ?auto_323090 ) ) ( not ( = ?auto_323088 ?auto_323089 ) ) ( not ( = ?auto_323088 ?auto_323090 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_323089 ?auto_323090 )
      ( MAKE-6CRATE-VERIFY ?auto_323084 ?auto_323085 ?auto_323086 ?auto_323087 ?auto_323088 ?auto_323089 ?auto_323090 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323128 - SURFACE
      ?auto_323129 - SURFACE
      ?auto_323130 - SURFACE
      ?auto_323131 - SURFACE
      ?auto_323132 - SURFACE
      ?auto_323133 - SURFACE
      ?auto_323134 - SURFACE
    )
    :vars
    (
      ?auto_323136 - HOIST
      ?auto_323137 - PLACE
      ?auto_323135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_323136 ?auto_323137 ) ( SURFACE-AT ?auto_323133 ?auto_323137 ) ( CLEAR ?auto_323133 ) ( IS-CRATE ?auto_323134 ) ( not ( = ?auto_323133 ?auto_323134 ) ) ( TRUCK-AT ?auto_323135 ?auto_323137 ) ( AVAILABLE ?auto_323136 ) ( IN ?auto_323134 ?auto_323135 ) ( ON ?auto_323133 ?auto_323132 ) ( not ( = ?auto_323132 ?auto_323133 ) ) ( not ( = ?auto_323132 ?auto_323134 ) ) ( ON ?auto_323129 ?auto_323128 ) ( ON ?auto_323130 ?auto_323129 ) ( ON ?auto_323131 ?auto_323130 ) ( ON ?auto_323132 ?auto_323131 ) ( not ( = ?auto_323128 ?auto_323129 ) ) ( not ( = ?auto_323128 ?auto_323130 ) ) ( not ( = ?auto_323128 ?auto_323131 ) ) ( not ( = ?auto_323128 ?auto_323132 ) ) ( not ( = ?auto_323128 ?auto_323133 ) ) ( not ( = ?auto_323128 ?auto_323134 ) ) ( not ( = ?auto_323129 ?auto_323130 ) ) ( not ( = ?auto_323129 ?auto_323131 ) ) ( not ( = ?auto_323129 ?auto_323132 ) ) ( not ( = ?auto_323129 ?auto_323133 ) ) ( not ( = ?auto_323129 ?auto_323134 ) ) ( not ( = ?auto_323130 ?auto_323131 ) ) ( not ( = ?auto_323130 ?auto_323132 ) ) ( not ( = ?auto_323130 ?auto_323133 ) ) ( not ( = ?auto_323130 ?auto_323134 ) ) ( not ( = ?auto_323131 ?auto_323132 ) ) ( not ( = ?auto_323131 ?auto_323133 ) ) ( not ( = ?auto_323131 ?auto_323134 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323132 ?auto_323133 ?auto_323134 )
      ( MAKE-6CRATE-VERIFY ?auto_323128 ?auto_323129 ?auto_323130 ?auto_323131 ?auto_323132 ?auto_323133 ?auto_323134 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323179 - SURFACE
      ?auto_323180 - SURFACE
      ?auto_323181 - SURFACE
      ?auto_323182 - SURFACE
      ?auto_323183 - SURFACE
      ?auto_323184 - SURFACE
      ?auto_323185 - SURFACE
    )
    :vars
    (
      ?auto_323187 - HOIST
      ?auto_323186 - PLACE
      ?auto_323189 - TRUCK
      ?auto_323188 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_323187 ?auto_323186 ) ( SURFACE-AT ?auto_323184 ?auto_323186 ) ( CLEAR ?auto_323184 ) ( IS-CRATE ?auto_323185 ) ( not ( = ?auto_323184 ?auto_323185 ) ) ( AVAILABLE ?auto_323187 ) ( IN ?auto_323185 ?auto_323189 ) ( ON ?auto_323184 ?auto_323183 ) ( not ( = ?auto_323183 ?auto_323184 ) ) ( not ( = ?auto_323183 ?auto_323185 ) ) ( TRUCK-AT ?auto_323189 ?auto_323188 ) ( not ( = ?auto_323188 ?auto_323186 ) ) ( ON ?auto_323180 ?auto_323179 ) ( ON ?auto_323181 ?auto_323180 ) ( ON ?auto_323182 ?auto_323181 ) ( ON ?auto_323183 ?auto_323182 ) ( not ( = ?auto_323179 ?auto_323180 ) ) ( not ( = ?auto_323179 ?auto_323181 ) ) ( not ( = ?auto_323179 ?auto_323182 ) ) ( not ( = ?auto_323179 ?auto_323183 ) ) ( not ( = ?auto_323179 ?auto_323184 ) ) ( not ( = ?auto_323179 ?auto_323185 ) ) ( not ( = ?auto_323180 ?auto_323181 ) ) ( not ( = ?auto_323180 ?auto_323182 ) ) ( not ( = ?auto_323180 ?auto_323183 ) ) ( not ( = ?auto_323180 ?auto_323184 ) ) ( not ( = ?auto_323180 ?auto_323185 ) ) ( not ( = ?auto_323181 ?auto_323182 ) ) ( not ( = ?auto_323181 ?auto_323183 ) ) ( not ( = ?auto_323181 ?auto_323184 ) ) ( not ( = ?auto_323181 ?auto_323185 ) ) ( not ( = ?auto_323182 ?auto_323183 ) ) ( not ( = ?auto_323182 ?auto_323184 ) ) ( not ( = ?auto_323182 ?auto_323185 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323183 ?auto_323184 ?auto_323185 )
      ( MAKE-6CRATE-VERIFY ?auto_323179 ?auto_323180 ?auto_323181 ?auto_323182 ?auto_323183 ?auto_323184 ?auto_323185 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323236 - SURFACE
      ?auto_323237 - SURFACE
      ?auto_323238 - SURFACE
      ?auto_323239 - SURFACE
      ?auto_323240 - SURFACE
      ?auto_323241 - SURFACE
      ?auto_323242 - SURFACE
    )
    :vars
    (
      ?auto_323247 - HOIST
      ?auto_323245 - PLACE
      ?auto_323243 - TRUCK
      ?auto_323246 - PLACE
      ?auto_323244 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_323247 ?auto_323245 ) ( SURFACE-AT ?auto_323241 ?auto_323245 ) ( CLEAR ?auto_323241 ) ( IS-CRATE ?auto_323242 ) ( not ( = ?auto_323241 ?auto_323242 ) ) ( AVAILABLE ?auto_323247 ) ( ON ?auto_323241 ?auto_323240 ) ( not ( = ?auto_323240 ?auto_323241 ) ) ( not ( = ?auto_323240 ?auto_323242 ) ) ( TRUCK-AT ?auto_323243 ?auto_323246 ) ( not ( = ?auto_323246 ?auto_323245 ) ) ( HOIST-AT ?auto_323244 ?auto_323246 ) ( LIFTING ?auto_323244 ?auto_323242 ) ( not ( = ?auto_323247 ?auto_323244 ) ) ( ON ?auto_323237 ?auto_323236 ) ( ON ?auto_323238 ?auto_323237 ) ( ON ?auto_323239 ?auto_323238 ) ( ON ?auto_323240 ?auto_323239 ) ( not ( = ?auto_323236 ?auto_323237 ) ) ( not ( = ?auto_323236 ?auto_323238 ) ) ( not ( = ?auto_323236 ?auto_323239 ) ) ( not ( = ?auto_323236 ?auto_323240 ) ) ( not ( = ?auto_323236 ?auto_323241 ) ) ( not ( = ?auto_323236 ?auto_323242 ) ) ( not ( = ?auto_323237 ?auto_323238 ) ) ( not ( = ?auto_323237 ?auto_323239 ) ) ( not ( = ?auto_323237 ?auto_323240 ) ) ( not ( = ?auto_323237 ?auto_323241 ) ) ( not ( = ?auto_323237 ?auto_323242 ) ) ( not ( = ?auto_323238 ?auto_323239 ) ) ( not ( = ?auto_323238 ?auto_323240 ) ) ( not ( = ?auto_323238 ?auto_323241 ) ) ( not ( = ?auto_323238 ?auto_323242 ) ) ( not ( = ?auto_323239 ?auto_323240 ) ) ( not ( = ?auto_323239 ?auto_323241 ) ) ( not ( = ?auto_323239 ?auto_323242 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323240 ?auto_323241 ?auto_323242 )
      ( MAKE-6CRATE-VERIFY ?auto_323236 ?auto_323237 ?auto_323238 ?auto_323239 ?auto_323240 ?auto_323241 ?auto_323242 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323299 - SURFACE
      ?auto_323300 - SURFACE
      ?auto_323301 - SURFACE
      ?auto_323302 - SURFACE
      ?auto_323303 - SURFACE
      ?auto_323304 - SURFACE
      ?auto_323305 - SURFACE
    )
    :vars
    (
      ?auto_323310 - HOIST
      ?auto_323308 - PLACE
      ?auto_323307 - TRUCK
      ?auto_323309 - PLACE
      ?auto_323311 - HOIST
      ?auto_323306 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_323310 ?auto_323308 ) ( SURFACE-AT ?auto_323304 ?auto_323308 ) ( CLEAR ?auto_323304 ) ( IS-CRATE ?auto_323305 ) ( not ( = ?auto_323304 ?auto_323305 ) ) ( AVAILABLE ?auto_323310 ) ( ON ?auto_323304 ?auto_323303 ) ( not ( = ?auto_323303 ?auto_323304 ) ) ( not ( = ?auto_323303 ?auto_323305 ) ) ( TRUCK-AT ?auto_323307 ?auto_323309 ) ( not ( = ?auto_323309 ?auto_323308 ) ) ( HOIST-AT ?auto_323311 ?auto_323309 ) ( not ( = ?auto_323310 ?auto_323311 ) ) ( AVAILABLE ?auto_323311 ) ( SURFACE-AT ?auto_323305 ?auto_323309 ) ( ON ?auto_323305 ?auto_323306 ) ( CLEAR ?auto_323305 ) ( not ( = ?auto_323304 ?auto_323306 ) ) ( not ( = ?auto_323305 ?auto_323306 ) ) ( not ( = ?auto_323303 ?auto_323306 ) ) ( ON ?auto_323300 ?auto_323299 ) ( ON ?auto_323301 ?auto_323300 ) ( ON ?auto_323302 ?auto_323301 ) ( ON ?auto_323303 ?auto_323302 ) ( not ( = ?auto_323299 ?auto_323300 ) ) ( not ( = ?auto_323299 ?auto_323301 ) ) ( not ( = ?auto_323299 ?auto_323302 ) ) ( not ( = ?auto_323299 ?auto_323303 ) ) ( not ( = ?auto_323299 ?auto_323304 ) ) ( not ( = ?auto_323299 ?auto_323305 ) ) ( not ( = ?auto_323299 ?auto_323306 ) ) ( not ( = ?auto_323300 ?auto_323301 ) ) ( not ( = ?auto_323300 ?auto_323302 ) ) ( not ( = ?auto_323300 ?auto_323303 ) ) ( not ( = ?auto_323300 ?auto_323304 ) ) ( not ( = ?auto_323300 ?auto_323305 ) ) ( not ( = ?auto_323300 ?auto_323306 ) ) ( not ( = ?auto_323301 ?auto_323302 ) ) ( not ( = ?auto_323301 ?auto_323303 ) ) ( not ( = ?auto_323301 ?auto_323304 ) ) ( not ( = ?auto_323301 ?auto_323305 ) ) ( not ( = ?auto_323301 ?auto_323306 ) ) ( not ( = ?auto_323302 ?auto_323303 ) ) ( not ( = ?auto_323302 ?auto_323304 ) ) ( not ( = ?auto_323302 ?auto_323305 ) ) ( not ( = ?auto_323302 ?auto_323306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323303 ?auto_323304 ?auto_323305 )
      ( MAKE-6CRATE-VERIFY ?auto_323299 ?auto_323300 ?auto_323301 ?auto_323302 ?auto_323303 ?auto_323304 ?auto_323305 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323363 - SURFACE
      ?auto_323364 - SURFACE
      ?auto_323365 - SURFACE
      ?auto_323366 - SURFACE
      ?auto_323367 - SURFACE
      ?auto_323368 - SURFACE
      ?auto_323369 - SURFACE
    )
    :vars
    (
      ?auto_323374 - HOIST
      ?auto_323373 - PLACE
      ?auto_323370 - PLACE
      ?auto_323375 - HOIST
      ?auto_323371 - SURFACE
      ?auto_323372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_323374 ?auto_323373 ) ( SURFACE-AT ?auto_323368 ?auto_323373 ) ( CLEAR ?auto_323368 ) ( IS-CRATE ?auto_323369 ) ( not ( = ?auto_323368 ?auto_323369 ) ) ( AVAILABLE ?auto_323374 ) ( ON ?auto_323368 ?auto_323367 ) ( not ( = ?auto_323367 ?auto_323368 ) ) ( not ( = ?auto_323367 ?auto_323369 ) ) ( not ( = ?auto_323370 ?auto_323373 ) ) ( HOIST-AT ?auto_323375 ?auto_323370 ) ( not ( = ?auto_323374 ?auto_323375 ) ) ( AVAILABLE ?auto_323375 ) ( SURFACE-AT ?auto_323369 ?auto_323370 ) ( ON ?auto_323369 ?auto_323371 ) ( CLEAR ?auto_323369 ) ( not ( = ?auto_323368 ?auto_323371 ) ) ( not ( = ?auto_323369 ?auto_323371 ) ) ( not ( = ?auto_323367 ?auto_323371 ) ) ( TRUCK-AT ?auto_323372 ?auto_323373 ) ( ON ?auto_323364 ?auto_323363 ) ( ON ?auto_323365 ?auto_323364 ) ( ON ?auto_323366 ?auto_323365 ) ( ON ?auto_323367 ?auto_323366 ) ( not ( = ?auto_323363 ?auto_323364 ) ) ( not ( = ?auto_323363 ?auto_323365 ) ) ( not ( = ?auto_323363 ?auto_323366 ) ) ( not ( = ?auto_323363 ?auto_323367 ) ) ( not ( = ?auto_323363 ?auto_323368 ) ) ( not ( = ?auto_323363 ?auto_323369 ) ) ( not ( = ?auto_323363 ?auto_323371 ) ) ( not ( = ?auto_323364 ?auto_323365 ) ) ( not ( = ?auto_323364 ?auto_323366 ) ) ( not ( = ?auto_323364 ?auto_323367 ) ) ( not ( = ?auto_323364 ?auto_323368 ) ) ( not ( = ?auto_323364 ?auto_323369 ) ) ( not ( = ?auto_323364 ?auto_323371 ) ) ( not ( = ?auto_323365 ?auto_323366 ) ) ( not ( = ?auto_323365 ?auto_323367 ) ) ( not ( = ?auto_323365 ?auto_323368 ) ) ( not ( = ?auto_323365 ?auto_323369 ) ) ( not ( = ?auto_323365 ?auto_323371 ) ) ( not ( = ?auto_323366 ?auto_323367 ) ) ( not ( = ?auto_323366 ?auto_323368 ) ) ( not ( = ?auto_323366 ?auto_323369 ) ) ( not ( = ?auto_323366 ?auto_323371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323367 ?auto_323368 ?auto_323369 )
      ( MAKE-6CRATE-VERIFY ?auto_323363 ?auto_323364 ?auto_323365 ?auto_323366 ?auto_323367 ?auto_323368 ?auto_323369 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323427 - SURFACE
      ?auto_323428 - SURFACE
      ?auto_323429 - SURFACE
      ?auto_323430 - SURFACE
      ?auto_323431 - SURFACE
      ?auto_323432 - SURFACE
      ?auto_323433 - SURFACE
    )
    :vars
    (
      ?auto_323436 - HOIST
      ?auto_323435 - PLACE
      ?auto_323437 - PLACE
      ?auto_323434 - HOIST
      ?auto_323439 - SURFACE
      ?auto_323438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_323436 ?auto_323435 ) ( IS-CRATE ?auto_323433 ) ( not ( = ?auto_323432 ?auto_323433 ) ) ( not ( = ?auto_323431 ?auto_323432 ) ) ( not ( = ?auto_323431 ?auto_323433 ) ) ( not ( = ?auto_323437 ?auto_323435 ) ) ( HOIST-AT ?auto_323434 ?auto_323437 ) ( not ( = ?auto_323436 ?auto_323434 ) ) ( AVAILABLE ?auto_323434 ) ( SURFACE-AT ?auto_323433 ?auto_323437 ) ( ON ?auto_323433 ?auto_323439 ) ( CLEAR ?auto_323433 ) ( not ( = ?auto_323432 ?auto_323439 ) ) ( not ( = ?auto_323433 ?auto_323439 ) ) ( not ( = ?auto_323431 ?auto_323439 ) ) ( TRUCK-AT ?auto_323438 ?auto_323435 ) ( SURFACE-AT ?auto_323431 ?auto_323435 ) ( CLEAR ?auto_323431 ) ( LIFTING ?auto_323436 ?auto_323432 ) ( IS-CRATE ?auto_323432 ) ( ON ?auto_323428 ?auto_323427 ) ( ON ?auto_323429 ?auto_323428 ) ( ON ?auto_323430 ?auto_323429 ) ( ON ?auto_323431 ?auto_323430 ) ( not ( = ?auto_323427 ?auto_323428 ) ) ( not ( = ?auto_323427 ?auto_323429 ) ) ( not ( = ?auto_323427 ?auto_323430 ) ) ( not ( = ?auto_323427 ?auto_323431 ) ) ( not ( = ?auto_323427 ?auto_323432 ) ) ( not ( = ?auto_323427 ?auto_323433 ) ) ( not ( = ?auto_323427 ?auto_323439 ) ) ( not ( = ?auto_323428 ?auto_323429 ) ) ( not ( = ?auto_323428 ?auto_323430 ) ) ( not ( = ?auto_323428 ?auto_323431 ) ) ( not ( = ?auto_323428 ?auto_323432 ) ) ( not ( = ?auto_323428 ?auto_323433 ) ) ( not ( = ?auto_323428 ?auto_323439 ) ) ( not ( = ?auto_323429 ?auto_323430 ) ) ( not ( = ?auto_323429 ?auto_323431 ) ) ( not ( = ?auto_323429 ?auto_323432 ) ) ( not ( = ?auto_323429 ?auto_323433 ) ) ( not ( = ?auto_323429 ?auto_323439 ) ) ( not ( = ?auto_323430 ?auto_323431 ) ) ( not ( = ?auto_323430 ?auto_323432 ) ) ( not ( = ?auto_323430 ?auto_323433 ) ) ( not ( = ?auto_323430 ?auto_323439 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323431 ?auto_323432 ?auto_323433 )
      ( MAKE-6CRATE-VERIFY ?auto_323427 ?auto_323428 ?auto_323429 ?auto_323430 ?auto_323431 ?auto_323432 ?auto_323433 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323491 - SURFACE
      ?auto_323492 - SURFACE
      ?auto_323493 - SURFACE
      ?auto_323494 - SURFACE
      ?auto_323495 - SURFACE
      ?auto_323496 - SURFACE
      ?auto_323497 - SURFACE
    )
    :vars
    (
      ?auto_323498 - HOIST
      ?auto_323501 - PLACE
      ?auto_323503 - PLACE
      ?auto_323500 - HOIST
      ?auto_323502 - SURFACE
      ?auto_323499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_323498 ?auto_323501 ) ( IS-CRATE ?auto_323497 ) ( not ( = ?auto_323496 ?auto_323497 ) ) ( not ( = ?auto_323495 ?auto_323496 ) ) ( not ( = ?auto_323495 ?auto_323497 ) ) ( not ( = ?auto_323503 ?auto_323501 ) ) ( HOIST-AT ?auto_323500 ?auto_323503 ) ( not ( = ?auto_323498 ?auto_323500 ) ) ( AVAILABLE ?auto_323500 ) ( SURFACE-AT ?auto_323497 ?auto_323503 ) ( ON ?auto_323497 ?auto_323502 ) ( CLEAR ?auto_323497 ) ( not ( = ?auto_323496 ?auto_323502 ) ) ( not ( = ?auto_323497 ?auto_323502 ) ) ( not ( = ?auto_323495 ?auto_323502 ) ) ( TRUCK-AT ?auto_323499 ?auto_323501 ) ( SURFACE-AT ?auto_323495 ?auto_323501 ) ( CLEAR ?auto_323495 ) ( IS-CRATE ?auto_323496 ) ( AVAILABLE ?auto_323498 ) ( IN ?auto_323496 ?auto_323499 ) ( ON ?auto_323492 ?auto_323491 ) ( ON ?auto_323493 ?auto_323492 ) ( ON ?auto_323494 ?auto_323493 ) ( ON ?auto_323495 ?auto_323494 ) ( not ( = ?auto_323491 ?auto_323492 ) ) ( not ( = ?auto_323491 ?auto_323493 ) ) ( not ( = ?auto_323491 ?auto_323494 ) ) ( not ( = ?auto_323491 ?auto_323495 ) ) ( not ( = ?auto_323491 ?auto_323496 ) ) ( not ( = ?auto_323491 ?auto_323497 ) ) ( not ( = ?auto_323491 ?auto_323502 ) ) ( not ( = ?auto_323492 ?auto_323493 ) ) ( not ( = ?auto_323492 ?auto_323494 ) ) ( not ( = ?auto_323492 ?auto_323495 ) ) ( not ( = ?auto_323492 ?auto_323496 ) ) ( not ( = ?auto_323492 ?auto_323497 ) ) ( not ( = ?auto_323492 ?auto_323502 ) ) ( not ( = ?auto_323493 ?auto_323494 ) ) ( not ( = ?auto_323493 ?auto_323495 ) ) ( not ( = ?auto_323493 ?auto_323496 ) ) ( not ( = ?auto_323493 ?auto_323497 ) ) ( not ( = ?auto_323493 ?auto_323502 ) ) ( not ( = ?auto_323494 ?auto_323495 ) ) ( not ( = ?auto_323494 ?auto_323496 ) ) ( not ( = ?auto_323494 ?auto_323497 ) ) ( not ( = ?auto_323494 ?auto_323502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323495 ?auto_323496 ?auto_323497 )
      ( MAKE-6CRATE-VERIFY ?auto_323491 ?auto_323492 ?auto_323493 ?auto_323494 ?auto_323495 ?auto_323496 ?auto_323497 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_325167 - SURFACE
      ?auto_325168 - SURFACE
    )
    :vars
    (
      ?auto_325174 - HOIST
      ?auto_325172 - PLACE
      ?auto_325169 - SURFACE
      ?auto_325171 - TRUCK
      ?auto_325170 - PLACE
      ?auto_325173 - HOIST
      ?auto_325175 - SURFACE
      ?auto_325176 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_325174 ?auto_325172 ) ( SURFACE-AT ?auto_325167 ?auto_325172 ) ( CLEAR ?auto_325167 ) ( IS-CRATE ?auto_325168 ) ( not ( = ?auto_325167 ?auto_325168 ) ) ( AVAILABLE ?auto_325174 ) ( ON ?auto_325167 ?auto_325169 ) ( not ( = ?auto_325169 ?auto_325167 ) ) ( not ( = ?auto_325169 ?auto_325168 ) ) ( TRUCK-AT ?auto_325171 ?auto_325170 ) ( not ( = ?auto_325170 ?auto_325172 ) ) ( HOIST-AT ?auto_325173 ?auto_325170 ) ( not ( = ?auto_325174 ?auto_325173 ) ) ( SURFACE-AT ?auto_325168 ?auto_325170 ) ( ON ?auto_325168 ?auto_325175 ) ( CLEAR ?auto_325168 ) ( not ( = ?auto_325167 ?auto_325175 ) ) ( not ( = ?auto_325168 ?auto_325175 ) ) ( not ( = ?auto_325169 ?auto_325175 ) ) ( LIFTING ?auto_325173 ?auto_325176 ) ( IS-CRATE ?auto_325176 ) ( not ( = ?auto_325167 ?auto_325176 ) ) ( not ( = ?auto_325168 ?auto_325176 ) ) ( not ( = ?auto_325169 ?auto_325176 ) ) ( not ( = ?auto_325175 ?auto_325176 ) ) )
    :subtasks
    ( ( !LOAD ?auto_325173 ?auto_325176 ?auto_325171 ?auto_325170 )
      ( MAKE-1CRATE ?auto_325167 ?auto_325168 )
      ( MAKE-1CRATE-VERIFY ?auto_325167 ?auto_325168 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325443 - SURFACE
      ?auto_325444 - SURFACE
      ?auto_325445 - SURFACE
      ?auto_325446 - SURFACE
      ?auto_325447 - SURFACE
      ?auto_325448 - SURFACE
      ?auto_325449 - SURFACE
      ?auto_325450 - SURFACE
    )
    :vars
    (
      ?auto_325452 - HOIST
      ?auto_325451 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_325452 ?auto_325451 ) ( SURFACE-AT ?auto_325449 ?auto_325451 ) ( CLEAR ?auto_325449 ) ( LIFTING ?auto_325452 ?auto_325450 ) ( IS-CRATE ?auto_325450 ) ( not ( = ?auto_325449 ?auto_325450 ) ) ( ON ?auto_325444 ?auto_325443 ) ( ON ?auto_325445 ?auto_325444 ) ( ON ?auto_325446 ?auto_325445 ) ( ON ?auto_325447 ?auto_325446 ) ( ON ?auto_325448 ?auto_325447 ) ( ON ?auto_325449 ?auto_325448 ) ( not ( = ?auto_325443 ?auto_325444 ) ) ( not ( = ?auto_325443 ?auto_325445 ) ) ( not ( = ?auto_325443 ?auto_325446 ) ) ( not ( = ?auto_325443 ?auto_325447 ) ) ( not ( = ?auto_325443 ?auto_325448 ) ) ( not ( = ?auto_325443 ?auto_325449 ) ) ( not ( = ?auto_325443 ?auto_325450 ) ) ( not ( = ?auto_325444 ?auto_325445 ) ) ( not ( = ?auto_325444 ?auto_325446 ) ) ( not ( = ?auto_325444 ?auto_325447 ) ) ( not ( = ?auto_325444 ?auto_325448 ) ) ( not ( = ?auto_325444 ?auto_325449 ) ) ( not ( = ?auto_325444 ?auto_325450 ) ) ( not ( = ?auto_325445 ?auto_325446 ) ) ( not ( = ?auto_325445 ?auto_325447 ) ) ( not ( = ?auto_325445 ?auto_325448 ) ) ( not ( = ?auto_325445 ?auto_325449 ) ) ( not ( = ?auto_325445 ?auto_325450 ) ) ( not ( = ?auto_325446 ?auto_325447 ) ) ( not ( = ?auto_325446 ?auto_325448 ) ) ( not ( = ?auto_325446 ?auto_325449 ) ) ( not ( = ?auto_325446 ?auto_325450 ) ) ( not ( = ?auto_325447 ?auto_325448 ) ) ( not ( = ?auto_325447 ?auto_325449 ) ) ( not ( = ?auto_325447 ?auto_325450 ) ) ( not ( = ?auto_325448 ?auto_325449 ) ) ( not ( = ?auto_325448 ?auto_325450 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_325449 ?auto_325450 )
      ( MAKE-7CRATE-VERIFY ?auto_325443 ?auto_325444 ?auto_325445 ?auto_325446 ?auto_325447 ?auto_325448 ?auto_325449 ?auto_325450 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325498 - SURFACE
      ?auto_325499 - SURFACE
      ?auto_325500 - SURFACE
      ?auto_325501 - SURFACE
      ?auto_325502 - SURFACE
      ?auto_325503 - SURFACE
      ?auto_325504 - SURFACE
      ?auto_325505 - SURFACE
    )
    :vars
    (
      ?auto_325508 - HOIST
      ?auto_325506 - PLACE
      ?auto_325507 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_325508 ?auto_325506 ) ( SURFACE-AT ?auto_325504 ?auto_325506 ) ( CLEAR ?auto_325504 ) ( IS-CRATE ?auto_325505 ) ( not ( = ?auto_325504 ?auto_325505 ) ) ( TRUCK-AT ?auto_325507 ?auto_325506 ) ( AVAILABLE ?auto_325508 ) ( IN ?auto_325505 ?auto_325507 ) ( ON ?auto_325504 ?auto_325503 ) ( not ( = ?auto_325503 ?auto_325504 ) ) ( not ( = ?auto_325503 ?auto_325505 ) ) ( ON ?auto_325499 ?auto_325498 ) ( ON ?auto_325500 ?auto_325499 ) ( ON ?auto_325501 ?auto_325500 ) ( ON ?auto_325502 ?auto_325501 ) ( ON ?auto_325503 ?auto_325502 ) ( not ( = ?auto_325498 ?auto_325499 ) ) ( not ( = ?auto_325498 ?auto_325500 ) ) ( not ( = ?auto_325498 ?auto_325501 ) ) ( not ( = ?auto_325498 ?auto_325502 ) ) ( not ( = ?auto_325498 ?auto_325503 ) ) ( not ( = ?auto_325498 ?auto_325504 ) ) ( not ( = ?auto_325498 ?auto_325505 ) ) ( not ( = ?auto_325499 ?auto_325500 ) ) ( not ( = ?auto_325499 ?auto_325501 ) ) ( not ( = ?auto_325499 ?auto_325502 ) ) ( not ( = ?auto_325499 ?auto_325503 ) ) ( not ( = ?auto_325499 ?auto_325504 ) ) ( not ( = ?auto_325499 ?auto_325505 ) ) ( not ( = ?auto_325500 ?auto_325501 ) ) ( not ( = ?auto_325500 ?auto_325502 ) ) ( not ( = ?auto_325500 ?auto_325503 ) ) ( not ( = ?auto_325500 ?auto_325504 ) ) ( not ( = ?auto_325500 ?auto_325505 ) ) ( not ( = ?auto_325501 ?auto_325502 ) ) ( not ( = ?auto_325501 ?auto_325503 ) ) ( not ( = ?auto_325501 ?auto_325504 ) ) ( not ( = ?auto_325501 ?auto_325505 ) ) ( not ( = ?auto_325502 ?auto_325503 ) ) ( not ( = ?auto_325502 ?auto_325504 ) ) ( not ( = ?auto_325502 ?auto_325505 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_325503 ?auto_325504 ?auto_325505 )
      ( MAKE-7CRATE-VERIFY ?auto_325498 ?auto_325499 ?auto_325500 ?auto_325501 ?auto_325502 ?auto_325503 ?auto_325504 ?auto_325505 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325561 - SURFACE
      ?auto_325562 - SURFACE
      ?auto_325563 - SURFACE
      ?auto_325564 - SURFACE
      ?auto_325565 - SURFACE
      ?auto_325566 - SURFACE
      ?auto_325567 - SURFACE
      ?auto_325568 - SURFACE
    )
    :vars
    (
      ?auto_325569 - HOIST
      ?auto_325572 - PLACE
      ?auto_325571 - TRUCK
      ?auto_325570 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_325569 ?auto_325572 ) ( SURFACE-AT ?auto_325567 ?auto_325572 ) ( CLEAR ?auto_325567 ) ( IS-CRATE ?auto_325568 ) ( not ( = ?auto_325567 ?auto_325568 ) ) ( AVAILABLE ?auto_325569 ) ( IN ?auto_325568 ?auto_325571 ) ( ON ?auto_325567 ?auto_325566 ) ( not ( = ?auto_325566 ?auto_325567 ) ) ( not ( = ?auto_325566 ?auto_325568 ) ) ( TRUCK-AT ?auto_325571 ?auto_325570 ) ( not ( = ?auto_325570 ?auto_325572 ) ) ( ON ?auto_325562 ?auto_325561 ) ( ON ?auto_325563 ?auto_325562 ) ( ON ?auto_325564 ?auto_325563 ) ( ON ?auto_325565 ?auto_325564 ) ( ON ?auto_325566 ?auto_325565 ) ( not ( = ?auto_325561 ?auto_325562 ) ) ( not ( = ?auto_325561 ?auto_325563 ) ) ( not ( = ?auto_325561 ?auto_325564 ) ) ( not ( = ?auto_325561 ?auto_325565 ) ) ( not ( = ?auto_325561 ?auto_325566 ) ) ( not ( = ?auto_325561 ?auto_325567 ) ) ( not ( = ?auto_325561 ?auto_325568 ) ) ( not ( = ?auto_325562 ?auto_325563 ) ) ( not ( = ?auto_325562 ?auto_325564 ) ) ( not ( = ?auto_325562 ?auto_325565 ) ) ( not ( = ?auto_325562 ?auto_325566 ) ) ( not ( = ?auto_325562 ?auto_325567 ) ) ( not ( = ?auto_325562 ?auto_325568 ) ) ( not ( = ?auto_325563 ?auto_325564 ) ) ( not ( = ?auto_325563 ?auto_325565 ) ) ( not ( = ?auto_325563 ?auto_325566 ) ) ( not ( = ?auto_325563 ?auto_325567 ) ) ( not ( = ?auto_325563 ?auto_325568 ) ) ( not ( = ?auto_325564 ?auto_325565 ) ) ( not ( = ?auto_325564 ?auto_325566 ) ) ( not ( = ?auto_325564 ?auto_325567 ) ) ( not ( = ?auto_325564 ?auto_325568 ) ) ( not ( = ?auto_325565 ?auto_325566 ) ) ( not ( = ?auto_325565 ?auto_325567 ) ) ( not ( = ?auto_325565 ?auto_325568 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_325566 ?auto_325567 ?auto_325568 )
      ( MAKE-7CRATE-VERIFY ?auto_325561 ?auto_325562 ?auto_325563 ?auto_325564 ?auto_325565 ?auto_325566 ?auto_325567 ?auto_325568 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325631 - SURFACE
      ?auto_325632 - SURFACE
      ?auto_325633 - SURFACE
      ?auto_325634 - SURFACE
      ?auto_325635 - SURFACE
      ?auto_325636 - SURFACE
      ?auto_325637 - SURFACE
      ?auto_325638 - SURFACE
    )
    :vars
    (
      ?auto_325643 - HOIST
      ?auto_325640 - PLACE
      ?auto_325639 - TRUCK
      ?auto_325642 - PLACE
      ?auto_325641 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_325643 ?auto_325640 ) ( SURFACE-AT ?auto_325637 ?auto_325640 ) ( CLEAR ?auto_325637 ) ( IS-CRATE ?auto_325638 ) ( not ( = ?auto_325637 ?auto_325638 ) ) ( AVAILABLE ?auto_325643 ) ( ON ?auto_325637 ?auto_325636 ) ( not ( = ?auto_325636 ?auto_325637 ) ) ( not ( = ?auto_325636 ?auto_325638 ) ) ( TRUCK-AT ?auto_325639 ?auto_325642 ) ( not ( = ?auto_325642 ?auto_325640 ) ) ( HOIST-AT ?auto_325641 ?auto_325642 ) ( LIFTING ?auto_325641 ?auto_325638 ) ( not ( = ?auto_325643 ?auto_325641 ) ) ( ON ?auto_325632 ?auto_325631 ) ( ON ?auto_325633 ?auto_325632 ) ( ON ?auto_325634 ?auto_325633 ) ( ON ?auto_325635 ?auto_325634 ) ( ON ?auto_325636 ?auto_325635 ) ( not ( = ?auto_325631 ?auto_325632 ) ) ( not ( = ?auto_325631 ?auto_325633 ) ) ( not ( = ?auto_325631 ?auto_325634 ) ) ( not ( = ?auto_325631 ?auto_325635 ) ) ( not ( = ?auto_325631 ?auto_325636 ) ) ( not ( = ?auto_325631 ?auto_325637 ) ) ( not ( = ?auto_325631 ?auto_325638 ) ) ( not ( = ?auto_325632 ?auto_325633 ) ) ( not ( = ?auto_325632 ?auto_325634 ) ) ( not ( = ?auto_325632 ?auto_325635 ) ) ( not ( = ?auto_325632 ?auto_325636 ) ) ( not ( = ?auto_325632 ?auto_325637 ) ) ( not ( = ?auto_325632 ?auto_325638 ) ) ( not ( = ?auto_325633 ?auto_325634 ) ) ( not ( = ?auto_325633 ?auto_325635 ) ) ( not ( = ?auto_325633 ?auto_325636 ) ) ( not ( = ?auto_325633 ?auto_325637 ) ) ( not ( = ?auto_325633 ?auto_325638 ) ) ( not ( = ?auto_325634 ?auto_325635 ) ) ( not ( = ?auto_325634 ?auto_325636 ) ) ( not ( = ?auto_325634 ?auto_325637 ) ) ( not ( = ?auto_325634 ?auto_325638 ) ) ( not ( = ?auto_325635 ?auto_325636 ) ) ( not ( = ?auto_325635 ?auto_325637 ) ) ( not ( = ?auto_325635 ?auto_325638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_325636 ?auto_325637 ?auto_325638 )
      ( MAKE-7CRATE-VERIFY ?auto_325631 ?auto_325632 ?auto_325633 ?auto_325634 ?auto_325635 ?auto_325636 ?auto_325637 ?auto_325638 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325708 - SURFACE
      ?auto_325709 - SURFACE
      ?auto_325710 - SURFACE
      ?auto_325711 - SURFACE
      ?auto_325712 - SURFACE
      ?auto_325713 - SURFACE
      ?auto_325714 - SURFACE
      ?auto_325715 - SURFACE
    )
    :vars
    (
      ?auto_325718 - HOIST
      ?auto_325721 - PLACE
      ?auto_325719 - TRUCK
      ?auto_325720 - PLACE
      ?auto_325717 - HOIST
      ?auto_325716 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_325718 ?auto_325721 ) ( SURFACE-AT ?auto_325714 ?auto_325721 ) ( CLEAR ?auto_325714 ) ( IS-CRATE ?auto_325715 ) ( not ( = ?auto_325714 ?auto_325715 ) ) ( AVAILABLE ?auto_325718 ) ( ON ?auto_325714 ?auto_325713 ) ( not ( = ?auto_325713 ?auto_325714 ) ) ( not ( = ?auto_325713 ?auto_325715 ) ) ( TRUCK-AT ?auto_325719 ?auto_325720 ) ( not ( = ?auto_325720 ?auto_325721 ) ) ( HOIST-AT ?auto_325717 ?auto_325720 ) ( not ( = ?auto_325718 ?auto_325717 ) ) ( AVAILABLE ?auto_325717 ) ( SURFACE-AT ?auto_325715 ?auto_325720 ) ( ON ?auto_325715 ?auto_325716 ) ( CLEAR ?auto_325715 ) ( not ( = ?auto_325714 ?auto_325716 ) ) ( not ( = ?auto_325715 ?auto_325716 ) ) ( not ( = ?auto_325713 ?auto_325716 ) ) ( ON ?auto_325709 ?auto_325708 ) ( ON ?auto_325710 ?auto_325709 ) ( ON ?auto_325711 ?auto_325710 ) ( ON ?auto_325712 ?auto_325711 ) ( ON ?auto_325713 ?auto_325712 ) ( not ( = ?auto_325708 ?auto_325709 ) ) ( not ( = ?auto_325708 ?auto_325710 ) ) ( not ( = ?auto_325708 ?auto_325711 ) ) ( not ( = ?auto_325708 ?auto_325712 ) ) ( not ( = ?auto_325708 ?auto_325713 ) ) ( not ( = ?auto_325708 ?auto_325714 ) ) ( not ( = ?auto_325708 ?auto_325715 ) ) ( not ( = ?auto_325708 ?auto_325716 ) ) ( not ( = ?auto_325709 ?auto_325710 ) ) ( not ( = ?auto_325709 ?auto_325711 ) ) ( not ( = ?auto_325709 ?auto_325712 ) ) ( not ( = ?auto_325709 ?auto_325713 ) ) ( not ( = ?auto_325709 ?auto_325714 ) ) ( not ( = ?auto_325709 ?auto_325715 ) ) ( not ( = ?auto_325709 ?auto_325716 ) ) ( not ( = ?auto_325710 ?auto_325711 ) ) ( not ( = ?auto_325710 ?auto_325712 ) ) ( not ( = ?auto_325710 ?auto_325713 ) ) ( not ( = ?auto_325710 ?auto_325714 ) ) ( not ( = ?auto_325710 ?auto_325715 ) ) ( not ( = ?auto_325710 ?auto_325716 ) ) ( not ( = ?auto_325711 ?auto_325712 ) ) ( not ( = ?auto_325711 ?auto_325713 ) ) ( not ( = ?auto_325711 ?auto_325714 ) ) ( not ( = ?auto_325711 ?auto_325715 ) ) ( not ( = ?auto_325711 ?auto_325716 ) ) ( not ( = ?auto_325712 ?auto_325713 ) ) ( not ( = ?auto_325712 ?auto_325714 ) ) ( not ( = ?auto_325712 ?auto_325715 ) ) ( not ( = ?auto_325712 ?auto_325716 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_325713 ?auto_325714 ?auto_325715 )
      ( MAKE-7CRATE-VERIFY ?auto_325708 ?auto_325709 ?auto_325710 ?auto_325711 ?auto_325712 ?auto_325713 ?auto_325714 ?auto_325715 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325786 - SURFACE
      ?auto_325787 - SURFACE
      ?auto_325788 - SURFACE
      ?auto_325789 - SURFACE
      ?auto_325790 - SURFACE
      ?auto_325791 - SURFACE
      ?auto_325792 - SURFACE
      ?auto_325793 - SURFACE
    )
    :vars
    (
      ?auto_325794 - HOIST
      ?auto_325796 - PLACE
      ?auto_325799 - PLACE
      ?auto_325798 - HOIST
      ?auto_325797 - SURFACE
      ?auto_325795 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_325794 ?auto_325796 ) ( SURFACE-AT ?auto_325792 ?auto_325796 ) ( CLEAR ?auto_325792 ) ( IS-CRATE ?auto_325793 ) ( not ( = ?auto_325792 ?auto_325793 ) ) ( AVAILABLE ?auto_325794 ) ( ON ?auto_325792 ?auto_325791 ) ( not ( = ?auto_325791 ?auto_325792 ) ) ( not ( = ?auto_325791 ?auto_325793 ) ) ( not ( = ?auto_325799 ?auto_325796 ) ) ( HOIST-AT ?auto_325798 ?auto_325799 ) ( not ( = ?auto_325794 ?auto_325798 ) ) ( AVAILABLE ?auto_325798 ) ( SURFACE-AT ?auto_325793 ?auto_325799 ) ( ON ?auto_325793 ?auto_325797 ) ( CLEAR ?auto_325793 ) ( not ( = ?auto_325792 ?auto_325797 ) ) ( not ( = ?auto_325793 ?auto_325797 ) ) ( not ( = ?auto_325791 ?auto_325797 ) ) ( TRUCK-AT ?auto_325795 ?auto_325796 ) ( ON ?auto_325787 ?auto_325786 ) ( ON ?auto_325788 ?auto_325787 ) ( ON ?auto_325789 ?auto_325788 ) ( ON ?auto_325790 ?auto_325789 ) ( ON ?auto_325791 ?auto_325790 ) ( not ( = ?auto_325786 ?auto_325787 ) ) ( not ( = ?auto_325786 ?auto_325788 ) ) ( not ( = ?auto_325786 ?auto_325789 ) ) ( not ( = ?auto_325786 ?auto_325790 ) ) ( not ( = ?auto_325786 ?auto_325791 ) ) ( not ( = ?auto_325786 ?auto_325792 ) ) ( not ( = ?auto_325786 ?auto_325793 ) ) ( not ( = ?auto_325786 ?auto_325797 ) ) ( not ( = ?auto_325787 ?auto_325788 ) ) ( not ( = ?auto_325787 ?auto_325789 ) ) ( not ( = ?auto_325787 ?auto_325790 ) ) ( not ( = ?auto_325787 ?auto_325791 ) ) ( not ( = ?auto_325787 ?auto_325792 ) ) ( not ( = ?auto_325787 ?auto_325793 ) ) ( not ( = ?auto_325787 ?auto_325797 ) ) ( not ( = ?auto_325788 ?auto_325789 ) ) ( not ( = ?auto_325788 ?auto_325790 ) ) ( not ( = ?auto_325788 ?auto_325791 ) ) ( not ( = ?auto_325788 ?auto_325792 ) ) ( not ( = ?auto_325788 ?auto_325793 ) ) ( not ( = ?auto_325788 ?auto_325797 ) ) ( not ( = ?auto_325789 ?auto_325790 ) ) ( not ( = ?auto_325789 ?auto_325791 ) ) ( not ( = ?auto_325789 ?auto_325792 ) ) ( not ( = ?auto_325789 ?auto_325793 ) ) ( not ( = ?auto_325789 ?auto_325797 ) ) ( not ( = ?auto_325790 ?auto_325791 ) ) ( not ( = ?auto_325790 ?auto_325792 ) ) ( not ( = ?auto_325790 ?auto_325793 ) ) ( not ( = ?auto_325790 ?auto_325797 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_325791 ?auto_325792 ?auto_325793 )
      ( MAKE-7CRATE-VERIFY ?auto_325786 ?auto_325787 ?auto_325788 ?auto_325789 ?auto_325790 ?auto_325791 ?auto_325792 ?auto_325793 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325864 - SURFACE
      ?auto_325865 - SURFACE
      ?auto_325866 - SURFACE
      ?auto_325867 - SURFACE
      ?auto_325868 - SURFACE
      ?auto_325869 - SURFACE
      ?auto_325870 - SURFACE
      ?auto_325871 - SURFACE
    )
    :vars
    (
      ?auto_325872 - HOIST
      ?auto_325875 - PLACE
      ?auto_325877 - PLACE
      ?auto_325874 - HOIST
      ?auto_325873 - SURFACE
      ?auto_325876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_325872 ?auto_325875 ) ( IS-CRATE ?auto_325871 ) ( not ( = ?auto_325870 ?auto_325871 ) ) ( not ( = ?auto_325869 ?auto_325870 ) ) ( not ( = ?auto_325869 ?auto_325871 ) ) ( not ( = ?auto_325877 ?auto_325875 ) ) ( HOIST-AT ?auto_325874 ?auto_325877 ) ( not ( = ?auto_325872 ?auto_325874 ) ) ( AVAILABLE ?auto_325874 ) ( SURFACE-AT ?auto_325871 ?auto_325877 ) ( ON ?auto_325871 ?auto_325873 ) ( CLEAR ?auto_325871 ) ( not ( = ?auto_325870 ?auto_325873 ) ) ( not ( = ?auto_325871 ?auto_325873 ) ) ( not ( = ?auto_325869 ?auto_325873 ) ) ( TRUCK-AT ?auto_325876 ?auto_325875 ) ( SURFACE-AT ?auto_325869 ?auto_325875 ) ( CLEAR ?auto_325869 ) ( LIFTING ?auto_325872 ?auto_325870 ) ( IS-CRATE ?auto_325870 ) ( ON ?auto_325865 ?auto_325864 ) ( ON ?auto_325866 ?auto_325865 ) ( ON ?auto_325867 ?auto_325866 ) ( ON ?auto_325868 ?auto_325867 ) ( ON ?auto_325869 ?auto_325868 ) ( not ( = ?auto_325864 ?auto_325865 ) ) ( not ( = ?auto_325864 ?auto_325866 ) ) ( not ( = ?auto_325864 ?auto_325867 ) ) ( not ( = ?auto_325864 ?auto_325868 ) ) ( not ( = ?auto_325864 ?auto_325869 ) ) ( not ( = ?auto_325864 ?auto_325870 ) ) ( not ( = ?auto_325864 ?auto_325871 ) ) ( not ( = ?auto_325864 ?auto_325873 ) ) ( not ( = ?auto_325865 ?auto_325866 ) ) ( not ( = ?auto_325865 ?auto_325867 ) ) ( not ( = ?auto_325865 ?auto_325868 ) ) ( not ( = ?auto_325865 ?auto_325869 ) ) ( not ( = ?auto_325865 ?auto_325870 ) ) ( not ( = ?auto_325865 ?auto_325871 ) ) ( not ( = ?auto_325865 ?auto_325873 ) ) ( not ( = ?auto_325866 ?auto_325867 ) ) ( not ( = ?auto_325866 ?auto_325868 ) ) ( not ( = ?auto_325866 ?auto_325869 ) ) ( not ( = ?auto_325866 ?auto_325870 ) ) ( not ( = ?auto_325866 ?auto_325871 ) ) ( not ( = ?auto_325866 ?auto_325873 ) ) ( not ( = ?auto_325867 ?auto_325868 ) ) ( not ( = ?auto_325867 ?auto_325869 ) ) ( not ( = ?auto_325867 ?auto_325870 ) ) ( not ( = ?auto_325867 ?auto_325871 ) ) ( not ( = ?auto_325867 ?auto_325873 ) ) ( not ( = ?auto_325868 ?auto_325869 ) ) ( not ( = ?auto_325868 ?auto_325870 ) ) ( not ( = ?auto_325868 ?auto_325871 ) ) ( not ( = ?auto_325868 ?auto_325873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_325869 ?auto_325870 ?auto_325871 )
      ( MAKE-7CRATE-VERIFY ?auto_325864 ?auto_325865 ?auto_325866 ?auto_325867 ?auto_325868 ?auto_325869 ?auto_325870 ?auto_325871 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325942 - SURFACE
      ?auto_325943 - SURFACE
      ?auto_325944 - SURFACE
      ?auto_325945 - SURFACE
      ?auto_325946 - SURFACE
      ?auto_325947 - SURFACE
      ?auto_325948 - SURFACE
      ?auto_325949 - SURFACE
    )
    :vars
    (
      ?auto_325950 - HOIST
      ?auto_325954 - PLACE
      ?auto_325953 - PLACE
      ?auto_325955 - HOIST
      ?auto_325952 - SURFACE
      ?auto_325951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_325950 ?auto_325954 ) ( IS-CRATE ?auto_325949 ) ( not ( = ?auto_325948 ?auto_325949 ) ) ( not ( = ?auto_325947 ?auto_325948 ) ) ( not ( = ?auto_325947 ?auto_325949 ) ) ( not ( = ?auto_325953 ?auto_325954 ) ) ( HOIST-AT ?auto_325955 ?auto_325953 ) ( not ( = ?auto_325950 ?auto_325955 ) ) ( AVAILABLE ?auto_325955 ) ( SURFACE-AT ?auto_325949 ?auto_325953 ) ( ON ?auto_325949 ?auto_325952 ) ( CLEAR ?auto_325949 ) ( not ( = ?auto_325948 ?auto_325952 ) ) ( not ( = ?auto_325949 ?auto_325952 ) ) ( not ( = ?auto_325947 ?auto_325952 ) ) ( TRUCK-AT ?auto_325951 ?auto_325954 ) ( SURFACE-AT ?auto_325947 ?auto_325954 ) ( CLEAR ?auto_325947 ) ( IS-CRATE ?auto_325948 ) ( AVAILABLE ?auto_325950 ) ( IN ?auto_325948 ?auto_325951 ) ( ON ?auto_325943 ?auto_325942 ) ( ON ?auto_325944 ?auto_325943 ) ( ON ?auto_325945 ?auto_325944 ) ( ON ?auto_325946 ?auto_325945 ) ( ON ?auto_325947 ?auto_325946 ) ( not ( = ?auto_325942 ?auto_325943 ) ) ( not ( = ?auto_325942 ?auto_325944 ) ) ( not ( = ?auto_325942 ?auto_325945 ) ) ( not ( = ?auto_325942 ?auto_325946 ) ) ( not ( = ?auto_325942 ?auto_325947 ) ) ( not ( = ?auto_325942 ?auto_325948 ) ) ( not ( = ?auto_325942 ?auto_325949 ) ) ( not ( = ?auto_325942 ?auto_325952 ) ) ( not ( = ?auto_325943 ?auto_325944 ) ) ( not ( = ?auto_325943 ?auto_325945 ) ) ( not ( = ?auto_325943 ?auto_325946 ) ) ( not ( = ?auto_325943 ?auto_325947 ) ) ( not ( = ?auto_325943 ?auto_325948 ) ) ( not ( = ?auto_325943 ?auto_325949 ) ) ( not ( = ?auto_325943 ?auto_325952 ) ) ( not ( = ?auto_325944 ?auto_325945 ) ) ( not ( = ?auto_325944 ?auto_325946 ) ) ( not ( = ?auto_325944 ?auto_325947 ) ) ( not ( = ?auto_325944 ?auto_325948 ) ) ( not ( = ?auto_325944 ?auto_325949 ) ) ( not ( = ?auto_325944 ?auto_325952 ) ) ( not ( = ?auto_325945 ?auto_325946 ) ) ( not ( = ?auto_325945 ?auto_325947 ) ) ( not ( = ?auto_325945 ?auto_325948 ) ) ( not ( = ?auto_325945 ?auto_325949 ) ) ( not ( = ?auto_325945 ?auto_325952 ) ) ( not ( = ?auto_325946 ?auto_325947 ) ) ( not ( = ?auto_325946 ?auto_325948 ) ) ( not ( = ?auto_325946 ?auto_325949 ) ) ( not ( = ?auto_325946 ?auto_325952 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_325947 ?auto_325948 ?auto_325949 )
      ( MAKE-7CRATE-VERIFY ?auto_325942 ?auto_325943 ?auto_325944 ?auto_325945 ?auto_325946 ?auto_325947 ?auto_325948 ?auto_325949 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_328513 - SURFACE
      ?auto_328514 - SURFACE
    )
    :vars
    (
      ?auto_328519 - HOIST
      ?auto_328517 - PLACE
      ?auto_328516 - SURFACE
      ?auto_328521 - PLACE
      ?auto_328515 - HOIST
      ?auto_328520 - SURFACE
      ?auto_328518 - TRUCK
      ?auto_328522 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_328519 ?auto_328517 ) ( SURFACE-AT ?auto_328513 ?auto_328517 ) ( CLEAR ?auto_328513 ) ( IS-CRATE ?auto_328514 ) ( not ( = ?auto_328513 ?auto_328514 ) ) ( ON ?auto_328513 ?auto_328516 ) ( not ( = ?auto_328516 ?auto_328513 ) ) ( not ( = ?auto_328516 ?auto_328514 ) ) ( not ( = ?auto_328521 ?auto_328517 ) ) ( HOIST-AT ?auto_328515 ?auto_328521 ) ( not ( = ?auto_328519 ?auto_328515 ) ) ( AVAILABLE ?auto_328515 ) ( SURFACE-AT ?auto_328514 ?auto_328521 ) ( ON ?auto_328514 ?auto_328520 ) ( CLEAR ?auto_328514 ) ( not ( = ?auto_328513 ?auto_328520 ) ) ( not ( = ?auto_328514 ?auto_328520 ) ) ( not ( = ?auto_328516 ?auto_328520 ) ) ( TRUCK-AT ?auto_328518 ?auto_328517 ) ( LIFTING ?auto_328519 ?auto_328522 ) ( IS-CRATE ?auto_328522 ) ( not ( = ?auto_328513 ?auto_328522 ) ) ( not ( = ?auto_328514 ?auto_328522 ) ) ( not ( = ?auto_328516 ?auto_328522 ) ) ( not ( = ?auto_328520 ?auto_328522 ) ) )
    :subtasks
    ( ( !LOAD ?auto_328519 ?auto_328522 ?auto_328518 ?auto_328517 )
      ( MAKE-1CRATE ?auto_328513 ?auto_328514 )
      ( MAKE-1CRATE-VERIFY ?auto_328513 ?auto_328514 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_328855 - SURFACE
      ?auto_328856 - SURFACE
      ?auto_328857 - SURFACE
      ?auto_328858 - SURFACE
      ?auto_328859 - SURFACE
      ?auto_328860 - SURFACE
      ?auto_328861 - SURFACE
      ?auto_328862 - SURFACE
      ?auto_328863 - SURFACE
    )
    :vars
    (
      ?auto_328864 - HOIST
      ?auto_328865 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_328864 ?auto_328865 ) ( SURFACE-AT ?auto_328862 ?auto_328865 ) ( CLEAR ?auto_328862 ) ( LIFTING ?auto_328864 ?auto_328863 ) ( IS-CRATE ?auto_328863 ) ( not ( = ?auto_328862 ?auto_328863 ) ) ( ON ?auto_328856 ?auto_328855 ) ( ON ?auto_328857 ?auto_328856 ) ( ON ?auto_328858 ?auto_328857 ) ( ON ?auto_328859 ?auto_328858 ) ( ON ?auto_328860 ?auto_328859 ) ( ON ?auto_328861 ?auto_328860 ) ( ON ?auto_328862 ?auto_328861 ) ( not ( = ?auto_328855 ?auto_328856 ) ) ( not ( = ?auto_328855 ?auto_328857 ) ) ( not ( = ?auto_328855 ?auto_328858 ) ) ( not ( = ?auto_328855 ?auto_328859 ) ) ( not ( = ?auto_328855 ?auto_328860 ) ) ( not ( = ?auto_328855 ?auto_328861 ) ) ( not ( = ?auto_328855 ?auto_328862 ) ) ( not ( = ?auto_328855 ?auto_328863 ) ) ( not ( = ?auto_328856 ?auto_328857 ) ) ( not ( = ?auto_328856 ?auto_328858 ) ) ( not ( = ?auto_328856 ?auto_328859 ) ) ( not ( = ?auto_328856 ?auto_328860 ) ) ( not ( = ?auto_328856 ?auto_328861 ) ) ( not ( = ?auto_328856 ?auto_328862 ) ) ( not ( = ?auto_328856 ?auto_328863 ) ) ( not ( = ?auto_328857 ?auto_328858 ) ) ( not ( = ?auto_328857 ?auto_328859 ) ) ( not ( = ?auto_328857 ?auto_328860 ) ) ( not ( = ?auto_328857 ?auto_328861 ) ) ( not ( = ?auto_328857 ?auto_328862 ) ) ( not ( = ?auto_328857 ?auto_328863 ) ) ( not ( = ?auto_328858 ?auto_328859 ) ) ( not ( = ?auto_328858 ?auto_328860 ) ) ( not ( = ?auto_328858 ?auto_328861 ) ) ( not ( = ?auto_328858 ?auto_328862 ) ) ( not ( = ?auto_328858 ?auto_328863 ) ) ( not ( = ?auto_328859 ?auto_328860 ) ) ( not ( = ?auto_328859 ?auto_328861 ) ) ( not ( = ?auto_328859 ?auto_328862 ) ) ( not ( = ?auto_328859 ?auto_328863 ) ) ( not ( = ?auto_328860 ?auto_328861 ) ) ( not ( = ?auto_328860 ?auto_328862 ) ) ( not ( = ?auto_328860 ?auto_328863 ) ) ( not ( = ?auto_328861 ?auto_328862 ) ) ( not ( = ?auto_328861 ?auto_328863 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_328862 ?auto_328863 )
      ( MAKE-8CRATE-VERIFY ?auto_328855 ?auto_328856 ?auto_328857 ?auto_328858 ?auto_328859 ?auto_328860 ?auto_328861 ?auto_328862 ?auto_328863 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_328922 - SURFACE
      ?auto_328923 - SURFACE
      ?auto_328924 - SURFACE
      ?auto_328925 - SURFACE
      ?auto_328926 - SURFACE
      ?auto_328927 - SURFACE
      ?auto_328928 - SURFACE
      ?auto_328929 - SURFACE
      ?auto_328930 - SURFACE
    )
    :vars
    (
      ?auto_328932 - HOIST
      ?auto_328933 - PLACE
      ?auto_328931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_328932 ?auto_328933 ) ( SURFACE-AT ?auto_328929 ?auto_328933 ) ( CLEAR ?auto_328929 ) ( IS-CRATE ?auto_328930 ) ( not ( = ?auto_328929 ?auto_328930 ) ) ( TRUCK-AT ?auto_328931 ?auto_328933 ) ( AVAILABLE ?auto_328932 ) ( IN ?auto_328930 ?auto_328931 ) ( ON ?auto_328929 ?auto_328928 ) ( not ( = ?auto_328928 ?auto_328929 ) ) ( not ( = ?auto_328928 ?auto_328930 ) ) ( ON ?auto_328923 ?auto_328922 ) ( ON ?auto_328924 ?auto_328923 ) ( ON ?auto_328925 ?auto_328924 ) ( ON ?auto_328926 ?auto_328925 ) ( ON ?auto_328927 ?auto_328926 ) ( ON ?auto_328928 ?auto_328927 ) ( not ( = ?auto_328922 ?auto_328923 ) ) ( not ( = ?auto_328922 ?auto_328924 ) ) ( not ( = ?auto_328922 ?auto_328925 ) ) ( not ( = ?auto_328922 ?auto_328926 ) ) ( not ( = ?auto_328922 ?auto_328927 ) ) ( not ( = ?auto_328922 ?auto_328928 ) ) ( not ( = ?auto_328922 ?auto_328929 ) ) ( not ( = ?auto_328922 ?auto_328930 ) ) ( not ( = ?auto_328923 ?auto_328924 ) ) ( not ( = ?auto_328923 ?auto_328925 ) ) ( not ( = ?auto_328923 ?auto_328926 ) ) ( not ( = ?auto_328923 ?auto_328927 ) ) ( not ( = ?auto_328923 ?auto_328928 ) ) ( not ( = ?auto_328923 ?auto_328929 ) ) ( not ( = ?auto_328923 ?auto_328930 ) ) ( not ( = ?auto_328924 ?auto_328925 ) ) ( not ( = ?auto_328924 ?auto_328926 ) ) ( not ( = ?auto_328924 ?auto_328927 ) ) ( not ( = ?auto_328924 ?auto_328928 ) ) ( not ( = ?auto_328924 ?auto_328929 ) ) ( not ( = ?auto_328924 ?auto_328930 ) ) ( not ( = ?auto_328925 ?auto_328926 ) ) ( not ( = ?auto_328925 ?auto_328927 ) ) ( not ( = ?auto_328925 ?auto_328928 ) ) ( not ( = ?auto_328925 ?auto_328929 ) ) ( not ( = ?auto_328925 ?auto_328930 ) ) ( not ( = ?auto_328926 ?auto_328927 ) ) ( not ( = ?auto_328926 ?auto_328928 ) ) ( not ( = ?auto_328926 ?auto_328929 ) ) ( not ( = ?auto_328926 ?auto_328930 ) ) ( not ( = ?auto_328927 ?auto_328928 ) ) ( not ( = ?auto_328927 ?auto_328929 ) ) ( not ( = ?auto_328927 ?auto_328930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_328928 ?auto_328929 ?auto_328930 )
      ( MAKE-8CRATE-VERIFY ?auto_328922 ?auto_328923 ?auto_328924 ?auto_328925 ?auto_328926 ?auto_328927 ?auto_328928 ?auto_328929 ?auto_328930 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_328998 - SURFACE
      ?auto_328999 - SURFACE
      ?auto_329000 - SURFACE
      ?auto_329001 - SURFACE
      ?auto_329002 - SURFACE
      ?auto_329003 - SURFACE
      ?auto_329004 - SURFACE
      ?auto_329005 - SURFACE
      ?auto_329006 - SURFACE
    )
    :vars
    (
      ?auto_329007 - HOIST
      ?auto_329008 - PLACE
      ?auto_329009 - TRUCK
      ?auto_329010 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_329007 ?auto_329008 ) ( SURFACE-AT ?auto_329005 ?auto_329008 ) ( CLEAR ?auto_329005 ) ( IS-CRATE ?auto_329006 ) ( not ( = ?auto_329005 ?auto_329006 ) ) ( AVAILABLE ?auto_329007 ) ( IN ?auto_329006 ?auto_329009 ) ( ON ?auto_329005 ?auto_329004 ) ( not ( = ?auto_329004 ?auto_329005 ) ) ( not ( = ?auto_329004 ?auto_329006 ) ) ( TRUCK-AT ?auto_329009 ?auto_329010 ) ( not ( = ?auto_329010 ?auto_329008 ) ) ( ON ?auto_328999 ?auto_328998 ) ( ON ?auto_329000 ?auto_328999 ) ( ON ?auto_329001 ?auto_329000 ) ( ON ?auto_329002 ?auto_329001 ) ( ON ?auto_329003 ?auto_329002 ) ( ON ?auto_329004 ?auto_329003 ) ( not ( = ?auto_328998 ?auto_328999 ) ) ( not ( = ?auto_328998 ?auto_329000 ) ) ( not ( = ?auto_328998 ?auto_329001 ) ) ( not ( = ?auto_328998 ?auto_329002 ) ) ( not ( = ?auto_328998 ?auto_329003 ) ) ( not ( = ?auto_328998 ?auto_329004 ) ) ( not ( = ?auto_328998 ?auto_329005 ) ) ( not ( = ?auto_328998 ?auto_329006 ) ) ( not ( = ?auto_328999 ?auto_329000 ) ) ( not ( = ?auto_328999 ?auto_329001 ) ) ( not ( = ?auto_328999 ?auto_329002 ) ) ( not ( = ?auto_328999 ?auto_329003 ) ) ( not ( = ?auto_328999 ?auto_329004 ) ) ( not ( = ?auto_328999 ?auto_329005 ) ) ( not ( = ?auto_328999 ?auto_329006 ) ) ( not ( = ?auto_329000 ?auto_329001 ) ) ( not ( = ?auto_329000 ?auto_329002 ) ) ( not ( = ?auto_329000 ?auto_329003 ) ) ( not ( = ?auto_329000 ?auto_329004 ) ) ( not ( = ?auto_329000 ?auto_329005 ) ) ( not ( = ?auto_329000 ?auto_329006 ) ) ( not ( = ?auto_329001 ?auto_329002 ) ) ( not ( = ?auto_329001 ?auto_329003 ) ) ( not ( = ?auto_329001 ?auto_329004 ) ) ( not ( = ?auto_329001 ?auto_329005 ) ) ( not ( = ?auto_329001 ?auto_329006 ) ) ( not ( = ?auto_329002 ?auto_329003 ) ) ( not ( = ?auto_329002 ?auto_329004 ) ) ( not ( = ?auto_329002 ?auto_329005 ) ) ( not ( = ?auto_329002 ?auto_329006 ) ) ( not ( = ?auto_329003 ?auto_329004 ) ) ( not ( = ?auto_329003 ?auto_329005 ) ) ( not ( = ?auto_329003 ?auto_329006 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_329004 ?auto_329005 ?auto_329006 )
      ( MAKE-8CRATE-VERIFY ?auto_328998 ?auto_328999 ?auto_329000 ?auto_329001 ?auto_329002 ?auto_329003 ?auto_329004 ?auto_329005 ?auto_329006 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_329082 - SURFACE
      ?auto_329083 - SURFACE
      ?auto_329084 - SURFACE
      ?auto_329085 - SURFACE
      ?auto_329086 - SURFACE
      ?auto_329087 - SURFACE
      ?auto_329088 - SURFACE
      ?auto_329089 - SURFACE
      ?auto_329090 - SURFACE
    )
    :vars
    (
      ?auto_329093 - HOIST
      ?auto_329092 - PLACE
      ?auto_329094 - TRUCK
      ?auto_329095 - PLACE
      ?auto_329091 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_329093 ?auto_329092 ) ( SURFACE-AT ?auto_329089 ?auto_329092 ) ( CLEAR ?auto_329089 ) ( IS-CRATE ?auto_329090 ) ( not ( = ?auto_329089 ?auto_329090 ) ) ( AVAILABLE ?auto_329093 ) ( ON ?auto_329089 ?auto_329088 ) ( not ( = ?auto_329088 ?auto_329089 ) ) ( not ( = ?auto_329088 ?auto_329090 ) ) ( TRUCK-AT ?auto_329094 ?auto_329095 ) ( not ( = ?auto_329095 ?auto_329092 ) ) ( HOIST-AT ?auto_329091 ?auto_329095 ) ( LIFTING ?auto_329091 ?auto_329090 ) ( not ( = ?auto_329093 ?auto_329091 ) ) ( ON ?auto_329083 ?auto_329082 ) ( ON ?auto_329084 ?auto_329083 ) ( ON ?auto_329085 ?auto_329084 ) ( ON ?auto_329086 ?auto_329085 ) ( ON ?auto_329087 ?auto_329086 ) ( ON ?auto_329088 ?auto_329087 ) ( not ( = ?auto_329082 ?auto_329083 ) ) ( not ( = ?auto_329082 ?auto_329084 ) ) ( not ( = ?auto_329082 ?auto_329085 ) ) ( not ( = ?auto_329082 ?auto_329086 ) ) ( not ( = ?auto_329082 ?auto_329087 ) ) ( not ( = ?auto_329082 ?auto_329088 ) ) ( not ( = ?auto_329082 ?auto_329089 ) ) ( not ( = ?auto_329082 ?auto_329090 ) ) ( not ( = ?auto_329083 ?auto_329084 ) ) ( not ( = ?auto_329083 ?auto_329085 ) ) ( not ( = ?auto_329083 ?auto_329086 ) ) ( not ( = ?auto_329083 ?auto_329087 ) ) ( not ( = ?auto_329083 ?auto_329088 ) ) ( not ( = ?auto_329083 ?auto_329089 ) ) ( not ( = ?auto_329083 ?auto_329090 ) ) ( not ( = ?auto_329084 ?auto_329085 ) ) ( not ( = ?auto_329084 ?auto_329086 ) ) ( not ( = ?auto_329084 ?auto_329087 ) ) ( not ( = ?auto_329084 ?auto_329088 ) ) ( not ( = ?auto_329084 ?auto_329089 ) ) ( not ( = ?auto_329084 ?auto_329090 ) ) ( not ( = ?auto_329085 ?auto_329086 ) ) ( not ( = ?auto_329085 ?auto_329087 ) ) ( not ( = ?auto_329085 ?auto_329088 ) ) ( not ( = ?auto_329085 ?auto_329089 ) ) ( not ( = ?auto_329085 ?auto_329090 ) ) ( not ( = ?auto_329086 ?auto_329087 ) ) ( not ( = ?auto_329086 ?auto_329088 ) ) ( not ( = ?auto_329086 ?auto_329089 ) ) ( not ( = ?auto_329086 ?auto_329090 ) ) ( not ( = ?auto_329087 ?auto_329088 ) ) ( not ( = ?auto_329087 ?auto_329089 ) ) ( not ( = ?auto_329087 ?auto_329090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_329088 ?auto_329089 ?auto_329090 )
      ( MAKE-8CRATE-VERIFY ?auto_329082 ?auto_329083 ?auto_329084 ?auto_329085 ?auto_329086 ?auto_329087 ?auto_329088 ?auto_329089 ?auto_329090 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_329174 - SURFACE
      ?auto_329175 - SURFACE
      ?auto_329176 - SURFACE
      ?auto_329177 - SURFACE
      ?auto_329178 - SURFACE
      ?auto_329179 - SURFACE
      ?auto_329180 - SURFACE
      ?auto_329181 - SURFACE
      ?auto_329182 - SURFACE
    )
    :vars
    (
      ?auto_329188 - HOIST
      ?auto_329184 - PLACE
      ?auto_329186 - TRUCK
      ?auto_329183 - PLACE
      ?auto_329185 - HOIST
      ?auto_329187 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_329188 ?auto_329184 ) ( SURFACE-AT ?auto_329181 ?auto_329184 ) ( CLEAR ?auto_329181 ) ( IS-CRATE ?auto_329182 ) ( not ( = ?auto_329181 ?auto_329182 ) ) ( AVAILABLE ?auto_329188 ) ( ON ?auto_329181 ?auto_329180 ) ( not ( = ?auto_329180 ?auto_329181 ) ) ( not ( = ?auto_329180 ?auto_329182 ) ) ( TRUCK-AT ?auto_329186 ?auto_329183 ) ( not ( = ?auto_329183 ?auto_329184 ) ) ( HOIST-AT ?auto_329185 ?auto_329183 ) ( not ( = ?auto_329188 ?auto_329185 ) ) ( AVAILABLE ?auto_329185 ) ( SURFACE-AT ?auto_329182 ?auto_329183 ) ( ON ?auto_329182 ?auto_329187 ) ( CLEAR ?auto_329182 ) ( not ( = ?auto_329181 ?auto_329187 ) ) ( not ( = ?auto_329182 ?auto_329187 ) ) ( not ( = ?auto_329180 ?auto_329187 ) ) ( ON ?auto_329175 ?auto_329174 ) ( ON ?auto_329176 ?auto_329175 ) ( ON ?auto_329177 ?auto_329176 ) ( ON ?auto_329178 ?auto_329177 ) ( ON ?auto_329179 ?auto_329178 ) ( ON ?auto_329180 ?auto_329179 ) ( not ( = ?auto_329174 ?auto_329175 ) ) ( not ( = ?auto_329174 ?auto_329176 ) ) ( not ( = ?auto_329174 ?auto_329177 ) ) ( not ( = ?auto_329174 ?auto_329178 ) ) ( not ( = ?auto_329174 ?auto_329179 ) ) ( not ( = ?auto_329174 ?auto_329180 ) ) ( not ( = ?auto_329174 ?auto_329181 ) ) ( not ( = ?auto_329174 ?auto_329182 ) ) ( not ( = ?auto_329174 ?auto_329187 ) ) ( not ( = ?auto_329175 ?auto_329176 ) ) ( not ( = ?auto_329175 ?auto_329177 ) ) ( not ( = ?auto_329175 ?auto_329178 ) ) ( not ( = ?auto_329175 ?auto_329179 ) ) ( not ( = ?auto_329175 ?auto_329180 ) ) ( not ( = ?auto_329175 ?auto_329181 ) ) ( not ( = ?auto_329175 ?auto_329182 ) ) ( not ( = ?auto_329175 ?auto_329187 ) ) ( not ( = ?auto_329176 ?auto_329177 ) ) ( not ( = ?auto_329176 ?auto_329178 ) ) ( not ( = ?auto_329176 ?auto_329179 ) ) ( not ( = ?auto_329176 ?auto_329180 ) ) ( not ( = ?auto_329176 ?auto_329181 ) ) ( not ( = ?auto_329176 ?auto_329182 ) ) ( not ( = ?auto_329176 ?auto_329187 ) ) ( not ( = ?auto_329177 ?auto_329178 ) ) ( not ( = ?auto_329177 ?auto_329179 ) ) ( not ( = ?auto_329177 ?auto_329180 ) ) ( not ( = ?auto_329177 ?auto_329181 ) ) ( not ( = ?auto_329177 ?auto_329182 ) ) ( not ( = ?auto_329177 ?auto_329187 ) ) ( not ( = ?auto_329178 ?auto_329179 ) ) ( not ( = ?auto_329178 ?auto_329180 ) ) ( not ( = ?auto_329178 ?auto_329181 ) ) ( not ( = ?auto_329178 ?auto_329182 ) ) ( not ( = ?auto_329178 ?auto_329187 ) ) ( not ( = ?auto_329179 ?auto_329180 ) ) ( not ( = ?auto_329179 ?auto_329181 ) ) ( not ( = ?auto_329179 ?auto_329182 ) ) ( not ( = ?auto_329179 ?auto_329187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_329180 ?auto_329181 ?auto_329182 )
      ( MAKE-8CRATE-VERIFY ?auto_329174 ?auto_329175 ?auto_329176 ?auto_329177 ?auto_329178 ?auto_329179 ?auto_329180 ?auto_329181 ?auto_329182 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_329267 - SURFACE
      ?auto_329268 - SURFACE
      ?auto_329269 - SURFACE
      ?auto_329270 - SURFACE
      ?auto_329271 - SURFACE
      ?auto_329272 - SURFACE
      ?auto_329273 - SURFACE
      ?auto_329274 - SURFACE
      ?auto_329275 - SURFACE
    )
    :vars
    (
      ?auto_329277 - HOIST
      ?auto_329281 - PLACE
      ?auto_329276 - PLACE
      ?auto_329279 - HOIST
      ?auto_329280 - SURFACE
      ?auto_329278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_329277 ?auto_329281 ) ( SURFACE-AT ?auto_329274 ?auto_329281 ) ( CLEAR ?auto_329274 ) ( IS-CRATE ?auto_329275 ) ( not ( = ?auto_329274 ?auto_329275 ) ) ( AVAILABLE ?auto_329277 ) ( ON ?auto_329274 ?auto_329273 ) ( not ( = ?auto_329273 ?auto_329274 ) ) ( not ( = ?auto_329273 ?auto_329275 ) ) ( not ( = ?auto_329276 ?auto_329281 ) ) ( HOIST-AT ?auto_329279 ?auto_329276 ) ( not ( = ?auto_329277 ?auto_329279 ) ) ( AVAILABLE ?auto_329279 ) ( SURFACE-AT ?auto_329275 ?auto_329276 ) ( ON ?auto_329275 ?auto_329280 ) ( CLEAR ?auto_329275 ) ( not ( = ?auto_329274 ?auto_329280 ) ) ( not ( = ?auto_329275 ?auto_329280 ) ) ( not ( = ?auto_329273 ?auto_329280 ) ) ( TRUCK-AT ?auto_329278 ?auto_329281 ) ( ON ?auto_329268 ?auto_329267 ) ( ON ?auto_329269 ?auto_329268 ) ( ON ?auto_329270 ?auto_329269 ) ( ON ?auto_329271 ?auto_329270 ) ( ON ?auto_329272 ?auto_329271 ) ( ON ?auto_329273 ?auto_329272 ) ( not ( = ?auto_329267 ?auto_329268 ) ) ( not ( = ?auto_329267 ?auto_329269 ) ) ( not ( = ?auto_329267 ?auto_329270 ) ) ( not ( = ?auto_329267 ?auto_329271 ) ) ( not ( = ?auto_329267 ?auto_329272 ) ) ( not ( = ?auto_329267 ?auto_329273 ) ) ( not ( = ?auto_329267 ?auto_329274 ) ) ( not ( = ?auto_329267 ?auto_329275 ) ) ( not ( = ?auto_329267 ?auto_329280 ) ) ( not ( = ?auto_329268 ?auto_329269 ) ) ( not ( = ?auto_329268 ?auto_329270 ) ) ( not ( = ?auto_329268 ?auto_329271 ) ) ( not ( = ?auto_329268 ?auto_329272 ) ) ( not ( = ?auto_329268 ?auto_329273 ) ) ( not ( = ?auto_329268 ?auto_329274 ) ) ( not ( = ?auto_329268 ?auto_329275 ) ) ( not ( = ?auto_329268 ?auto_329280 ) ) ( not ( = ?auto_329269 ?auto_329270 ) ) ( not ( = ?auto_329269 ?auto_329271 ) ) ( not ( = ?auto_329269 ?auto_329272 ) ) ( not ( = ?auto_329269 ?auto_329273 ) ) ( not ( = ?auto_329269 ?auto_329274 ) ) ( not ( = ?auto_329269 ?auto_329275 ) ) ( not ( = ?auto_329269 ?auto_329280 ) ) ( not ( = ?auto_329270 ?auto_329271 ) ) ( not ( = ?auto_329270 ?auto_329272 ) ) ( not ( = ?auto_329270 ?auto_329273 ) ) ( not ( = ?auto_329270 ?auto_329274 ) ) ( not ( = ?auto_329270 ?auto_329275 ) ) ( not ( = ?auto_329270 ?auto_329280 ) ) ( not ( = ?auto_329271 ?auto_329272 ) ) ( not ( = ?auto_329271 ?auto_329273 ) ) ( not ( = ?auto_329271 ?auto_329274 ) ) ( not ( = ?auto_329271 ?auto_329275 ) ) ( not ( = ?auto_329271 ?auto_329280 ) ) ( not ( = ?auto_329272 ?auto_329273 ) ) ( not ( = ?auto_329272 ?auto_329274 ) ) ( not ( = ?auto_329272 ?auto_329275 ) ) ( not ( = ?auto_329272 ?auto_329280 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_329273 ?auto_329274 ?auto_329275 )
      ( MAKE-8CRATE-VERIFY ?auto_329267 ?auto_329268 ?auto_329269 ?auto_329270 ?auto_329271 ?auto_329272 ?auto_329273 ?auto_329274 ?auto_329275 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_329360 - SURFACE
      ?auto_329361 - SURFACE
      ?auto_329362 - SURFACE
      ?auto_329363 - SURFACE
      ?auto_329364 - SURFACE
      ?auto_329365 - SURFACE
      ?auto_329366 - SURFACE
      ?auto_329367 - SURFACE
      ?auto_329368 - SURFACE
    )
    :vars
    (
      ?auto_329369 - HOIST
      ?auto_329373 - PLACE
      ?auto_329374 - PLACE
      ?auto_329371 - HOIST
      ?auto_329370 - SURFACE
      ?auto_329372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_329369 ?auto_329373 ) ( IS-CRATE ?auto_329368 ) ( not ( = ?auto_329367 ?auto_329368 ) ) ( not ( = ?auto_329366 ?auto_329367 ) ) ( not ( = ?auto_329366 ?auto_329368 ) ) ( not ( = ?auto_329374 ?auto_329373 ) ) ( HOIST-AT ?auto_329371 ?auto_329374 ) ( not ( = ?auto_329369 ?auto_329371 ) ) ( AVAILABLE ?auto_329371 ) ( SURFACE-AT ?auto_329368 ?auto_329374 ) ( ON ?auto_329368 ?auto_329370 ) ( CLEAR ?auto_329368 ) ( not ( = ?auto_329367 ?auto_329370 ) ) ( not ( = ?auto_329368 ?auto_329370 ) ) ( not ( = ?auto_329366 ?auto_329370 ) ) ( TRUCK-AT ?auto_329372 ?auto_329373 ) ( SURFACE-AT ?auto_329366 ?auto_329373 ) ( CLEAR ?auto_329366 ) ( LIFTING ?auto_329369 ?auto_329367 ) ( IS-CRATE ?auto_329367 ) ( ON ?auto_329361 ?auto_329360 ) ( ON ?auto_329362 ?auto_329361 ) ( ON ?auto_329363 ?auto_329362 ) ( ON ?auto_329364 ?auto_329363 ) ( ON ?auto_329365 ?auto_329364 ) ( ON ?auto_329366 ?auto_329365 ) ( not ( = ?auto_329360 ?auto_329361 ) ) ( not ( = ?auto_329360 ?auto_329362 ) ) ( not ( = ?auto_329360 ?auto_329363 ) ) ( not ( = ?auto_329360 ?auto_329364 ) ) ( not ( = ?auto_329360 ?auto_329365 ) ) ( not ( = ?auto_329360 ?auto_329366 ) ) ( not ( = ?auto_329360 ?auto_329367 ) ) ( not ( = ?auto_329360 ?auto_329368 ) ) ( not ( = ?auto_329360 ?auto_329370 ) ) ( not ( = ?auto_329361 ?auto_329362 ) ) ( not ( = ?auto_329361 ?auto_329363 ) ) ( not ( = ?auto_329361 ?auto_329364 ) ) ( not ( = ?auto_329361 ?auto_329365 ) ) ( not ( = ?auto_329361 ?auto_329366 ) ) ( not ( = ?auto_329361 ?auto_329367 ) ) ( not ( = ?auto_329361 ?auto_329368 ) ) ( not ( = ?auto_329361 ?auto_329370 ) ) ( not ( = ?auto_329362 ?auto_329363 ) ) ( not ( = ?auto_329362 ?auto_329364 ) ) ( not ( = ?auto_329362 ?auto_329365 ) ) ( not ( = ?auto_329362 ?auto_329366 ) ) ( not ( = ?auto_329362 ?auto_329367 ) ) ( not ( = ?auto_329362 ?auto_329368 ) ) ( not ( = ?auto_329362 ?auto_329370 ) ) ( not ( = ?auto_329363 ?auto_329364 ) ) ( not ( = ?auto_329363 ?auto_329365 ) ) ( not ( = ?auto_329363 ?auto_329366 ) ) ( not ( = ?auto_329363 ?auto_329367 ) ) ( not ( = ?auto_329363 ?auto_329368 ) ) ( not ( = ?auto_329363 ?auto_329370 ) ) ( not ( = ?auto_329364 ?auto_329365 ) ) ( not ( = ?auto_329364 ?auto_329366 ) ) ( not ( = ?auto_329364 ?auto_329367 ) ) ( not ( = ?auto_329364 ?auto_329368 ) ) ( not ( = ?auto_329364 ?auto_329370 ) ) ( not ( = ?auto_329365 ?auto_329366 ) ) ( not ( = ?auto_329365 ?auto_329367 ) ) ( not ( = ?auto_329365 ?auto_329368 ) ) ( not ( = ?auto_329365 ?auto_329370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_329366 ?auto_329367 ?auto_329368 )
      ( MAKE-8CRATE-VERIFY ?auto_329360 ?auto_329361 ?auto_329362 ?auto_329363 ?auto_329364 ?auto_329365 ?auto_329366 ?auto_329367 ?auto_329368 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_329453 - SURFACE
      ?auto_329454 - SURFACE
      ?auto_329455 - SURFACE
      ?auto_329456 - SURFACE
      ?auto_329457 - SURFACE
      ?auto_329458 - SURFACE
      ?auto_329459 - SURFACE
      ?auto_329460 - SURFACE
      ?auto_329461 - SURFACE
    )
    :vars
    (
      ?auto_329466 - HOIST
      ?auto_329463 - PLACE
      ?auto_329467 - PLACE
      ?auto_329465 - HOIST
      ?auto_329462 - SURFACE
      ?auto_329464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_329466 ?auto_329463 ) ( IS-CRATE ?auto_329461 ) ( not ( = ?auto_329460 ?auto_329461 ) ) ( not ( = ?auto_329459 ?auto_329460 ) ) ( not ( = ?auto_329459 ?auto_329461 ) ) ( not ( = ?auto_329467 ?auto_329463 ) ) ( HOIST-AT ?auto_329465 ?auto_329467 ) ( not ( = ?auto_329466 ?auto_329465 ) ) ( AVAILABLE ?auto_329465 ) ( SURFACE-AT ?auto_329461 ?auto_329467 ) ( ON ?auto_329461 ?auto_329462 ) ( CLEAR ?auto_329461 ) ( not ( = ?auto_329460 ?auto_329462 ) ) ( not ( = ?auto_329461 ?auto_329462 ) ) ( not ( = ?auto_329459 ?auto_329462 ) ) ( TRUCK-AT ?auto_329464 ?auto_329463 ) ( SURFACE-AT ?auto_329459 ?auto_329463 ) ( CLEAR ?auto_329459 ) ( IS-CRATE ?auto_329460 ) ( AVAILABLE ?auto_329466 ) ( IN ?auto_329460 ?auto_329464 ) ( ON ?auto_329454 ?auto_329453 ) ( ON ?auto_329455 ?auto_329454 ) ( ON ?auto_329456 ?auto_329455 ) ( ON ?auto_329457 ?auto_329456 ) ( ON ?auto_329458 ?auto_329457 ) ( ON ?auto_329459 ?auto_329458 ) ( not ( = ?auto_329453 ?auto_329454 ) ) ( not ( = ?auto_329453 ?auto_329455 ) ) ( not ( = ?auto_329453 ?auto_329456 ) ) ( not ( = ?auto_329453 ?auto_329457 ) ) ( not ( = ?auto_329453 ?auto_329458 ) ) ( not ( = ?auto_329453 ?auto_329459 ) ) ( not ( = ?auto_329453 ?auto_329460 ) ) ( not ( = ?auto_329453 ?auto_329461 ) ) ( not ( = ?auto_329453 ?auto_329462 ) ) ( not ( = ?auto_329454 ?auto_329455 ) ) ( not ( = ?auto_329454 ?auto_329456 ) ) ( not ( = ?auto_329454 ?auto_329457 ) ) ( not ( = ?auto_329454 ?auto_329458 ) ) ( not ( = ?auto_329454 ?auto_329459 ) ) ( not ( = ?auto_329454 ?auto_329460 ) ) ( not ( = ?auto_329454 ?auto_329461 ) ) ( not ( = ?auto_329454 ?auto_329462 ) ) ( not ( = ?auto_329455 ?auto_329456 ) ) ( not ( = ?auto_329455 ?auto_329457 ) ) ( not ( = ?auto_329455 ?auto_329458 ) ) ( not ( = ?auto_329455 ?auto_329459 ) ) ( not ( = ?auto_329455 ?auto_329460 ) ) ( not ( = ?auto_329455 ?auto_329461 ) ) ( not ( = ?auto_329455 ?auto_329462 ) ) ( not ( = ?auto_329456 ?auto_329457 ) ) ( not ( = ?auto_329456 ?auto_329458 ) ) ( not ( = ?auto_329456 ?auto_329459 ) ) ( not ( = ?auto_329456 ?auto_329460 ) ) ( not ( = ?auto_329456 ?auto_329461 ) ) ( not ( = ?auto_329456 ?auto_329462 ) ) ( not ( = ?auto_329457 ?auto_329458 ) ) ( not ( = ?auto_329457 ?auto_329459 ) ) ( not ( = ?auto_329457 ?auto_329460 ) ) ( not ( = ?auto_329457 ?auto_329461 ) ) ( not ( = ?auto_329457 ?auto_329462 ) ) ( not ( = ?auto_329458 ?auto_329459 ) ) ( not ( = ?auto_329458 ?auto_329460 ) ) ( not ( = ?auto_329458 ?auto_329461 ) ) ( not ( = ?auto_329458 ?auto_329462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_329459 ?auto_329460 ?auto_329461 )
      ( MAKE-8CRATE-VERIFY ?auto_329453 ?auto_329454 ?auto_329455 ?auto_329456 ?auto_329457 ?auto_329458 ?auto_329459 ?auto_329460 ?auto_329461 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_333569 - SURFACE
      ?auto_333570 - SURFACE
      ?auto_333571 - SURFACE
      ?auto_333572 - SURFACE
      ?auto_333573 - SURFACE
      ?auto_333574 - SURFACE
      ?auto_333575 - SURFACE
      ?auto_333576 - SURFACE
      ?auto_333577 - SURFACE
      ?auto_333578 - SURFACE
    )
    :vars
    (
      ?auto_333580 - HOIST
      ?auto_333579 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_333580 ?auto_333579 ) ( SURFACE-AT ?auto_333577 ?auto_333579 ) ( CLEAR ?auto_333577 ) ( LIFTING ?auto_333580 ?auto_333578 ) ( IS-CRATE ?auto_333578 ) ( not ( = ?auto_333577 ?auto_333578 ) ) ( ON ?auto_333570 ?auto_333569 ) ( ON ?auto_333571 ?auto_333570 ) ( ON ?auto_333572 ?auto_333571 ) ( ON ?auto_333573 ?auto_333572 ) ( ON ?auto_333574 ?auto_333573 ) ( ON ?auto_333575 ?auto_333574 ) ( ON ?auto_333576 ?auto_333575 ) ( ON ?auto_333577 ?auto_333576 ) ( not ( = ?auto_333569 ?auto_333570 ) ) ( not ( = ?auto_333569 ?auto_333571 ) ) ( not ( = ?auto_333569 ?auto_333572 ) ) ( not ( = ?auto_333569 ?auto_333573 ) ) ( not ( = ?auto_333569 ?auto_333574 ) ) ( not ( = ?auto_333569 ?auto_333575 ) ) ( not ( = ?auto_333569 ?auto_333576 ) ) ( not ( = ?auto_333569 ?auto_333577 ) ) ( not ( = ?auto_333569 ?auto_333578 ) ) ( not ( = ?auto_333570 ?auto_333571 ) ) ( not ( = ?auto_333570 ?auto_333572 ) ) ( not ( = ?auto_333570 ?auto_333573 ) ) ( not ( = ?auto_333570 ?auto_333574 ) ) ( not ( = ?auto_333570 ?auto_333575 ) ) ( not ( = ?auto_333570 ?auto_333576 ) ) ( not ( = ?auto_333570 ?auto_333577 ) ) ( not ( = ?auto_333570 ?auto_333578 ) ) ( not ( = ?auto_333571 ?auto_333572 ) ) ( not ( = ?auto_333571 ?auto_333573 ) ) ( not ( = ?auto_333571 ?auto_333574 ) ) ( not ( = ?auto_333571 ?auto_333575 ) ) ( not ( = ?auto_333571 ?auto_333576 ) ) ( not ( = ?auto_333571 ?auto_333577 ) ) ( not ( = ?auto_333571 ?auto_333578 ) ) ( not ( = ?auto_333572 ?auto_333573 ) ) ( not ( = ?auto_333572 ?auto_333574 ) ) ( not ( = ?auto_333572 ?auto_333575 ) ) ( not ( = ?auto_333572 ?auto_333576 ) ) ( not ( = ?auto_333572 ?auto_333577 ) ) ( not ( = ?auto_333572 ?auto_333578 ) ) ( not ( = ?auto_333573 ?auto_333574 ) ) ( not ( = ?auto_333573 ?auto_333575 ) ) ( not ( = ?auto_333573 ?auto_333576 ) ) ( not ( = ?auto_333573 ?auto_333577 ) ) ( not ( = ?auto_333573 ?auto_333578 ) ) ( not ( = ?auto_333574 ?auto_333575 ) ) ( not ( = ?auto_333574 ?auto_333576 ) ) ( not ( = ?auto_333574 ?auto_333577 ) ) ( not ( = ?auto_333574 ?auto_333578 ) ) ( not ( = ?auto_333575 ?auto_333576 ) ) ( not ( = ?auto_333575 ?auto_333577 ) ) ( not ( = ?auto_333575 ?auto_333578 ) ) ( not ( = ?auto_333576 ?auto_333577 ) ) ( not ( = ?auto_333576 ?auto_333578 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_333577 ?auto_333578 )
      ( MAKE-9CRATE-VERIFY ?auto_333569 ?auto_333570 ?auto_333571 ?auto_333572 ?auto_333573 ?auto_333574 ?auto_333575 ?auto_333576 ?auto_333577 ?auto_333578 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_333649 - SURFACE
      ?auto_333650 - SURFACE
      ?auto_333651 - SURFACE
      ?auto_333652 - SURFACE
      ?auto_333653 - SURFACE
      ?auto_333654 - SURFACE
      ?auto_333655 - SURFACE
      ?auto_333656 - SURFACE
      ?auto_333657 - SURFACE
      ?auto_333658 - SURFACE
    )
    :vars
    (
      ?auto_333659 - HOIST
      ?auto_333661 - PLACE
      ?auto_333660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_333659 ?auto_333661 ) ( SURFACE-AT ?auto_333657 ?auto_333661 ) ( CLEAR ?auto_333657 ) ( IS-CRATE ?auto_333658 ) ( not ( = ?auto_333657 ?auto_333658 ) ) ( TRUCK-AT ?auto_333660 ?auto_333661 ) ( AVAILABLE ?auto_333659 ) ( IN ?auto_333658 ?auto_333660 ) ( ON ?auto_333657 ?auto_333656 ) ( not ( = ?auto_333656 ?auto_333657 ) ) ( not ( = ?auto_333656 ?auto_333658 ) ) ( ON ?auto_333650 ?auto_333649 ) ( ON ?auto_333651 ?auto_333650 ) ( ON ?auto_333652 ?auto_333651 ) ( ON ?auto_333653 ?auto_333652 ) ( ON ?auto_333654 ?auto_333653 ) ( ON ?auto_333655 ?auto_333654 ) ( ON ?auto_333656 ?auto_333655 ) ( not ( = ?auto_333649 ?auto_333650 ) ) ( not ( = ?auto_333649 ?auto_333651 ) ) ( not ( = ?auto_333649 ?auto_333652 ) ) ( not ( = ?auto_333649 ?auto_333653 ) ) ( not ( = ?auto_333649 ?auto_333654 ) ) ( not ( = ?auto_333649 ?auto_333655 ) ) ( not ( = ?auto_333649 ?auto_333656 ) ) ( not ( = ?auto_333649 ?auto_333657 ) ) ( not ( = ?auto_333649 ?auto_333658 ) ) ( not ( = ?auto_333650 ?auto_333651 ) ) ( not ( = ?auto_333650 ?auto_333652 ) ) ( not ( = ?auto_333650 ?auto_333653 ) ) ( not ( = ?auto_333650 ?auto_333654 ) ) ( not ( = ?auto_333650 ?auto_333655 ) ) ( not ( = ?auto_333650 ?auto_333656 ) ) ( not ( = ?auto_333650 ?auto_333657 ) ) ( not ( = ?auto_333650 ?auto_333658 ) ) ( not ( = ?auto_333651 ?auto_333652 ) ) ( not ( = ?auto_333651 ?auto_333653 ) ) ( not ( = ?auto_333651 ?auto_333654 ) ) ( not ( = ?auto_333651 ?auto_333655 ) ) ( not ( = ?auto_333651 ?auto_333656 ) ) ( not ( = ?auto_333651 ?auto_333657 ) ) ( not ( = ?auto_333651 ?auto_333658 ) ) ( not ( = ?auto_333652 ?auto_333653 ) ) ( not ( = ?auto_333652 ?auto_333654 ) ) ( not ( = ?auto_333652 ?auto_333655 ) ) ( not ( = ?auto_333652 ?auto_333656 ) ) ( not ( = ?auto_333652 ?auto_333657 ) ) ( not ( = ?auto_333652 ?auto_333658 ) ) ( not ( = ?auto_333653 ?auto_333654 ) ) ( not ( = ?auto_333653 ?auto_333655 ) ) ( not ( = ?auto_333653 ?auto_333656 ) ) ( not ( = ?auto_333653 ?auto_333657 ) ) ( not ( = ?auto_333653 ?auto_333658 ) ) ( not ( = ?auto_333654 ?auto_333655 ) ) ( not ( = ?auto_333654 ?auto_333656 ) ) ( not ( = ?auto_333654 ?auto_333657 ) ) ( not ( = ?auto_333654 ?auto_333658 ) ) ( not ( = ?auto_333655 ?auto_333656 ) ) ( not ( = ?auto_333655 ?auto_333657 ) ) ( not ( = ?auto_333655 ?auto_333658 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_333656 ?auto_333657 ?auto_333658 )
      ( MAKE-9CRATE-VERIFY ?auto_333649 ?auto_333650 ?auto_333651 ?auto_333652 ?auto_333653 ?auto_333654 ?auto_333655 ?auto_333656 ?auto_333657 ?auto_333658 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_333739 - SURFACE
      ?auto_333740 - SURFACE
      ?auto_333741 - SURFACE
      ?auto_333742 - SURFACE
      ?auto_333743 - SURFACE
      ?auto_333744 - SURFACE
      ?auto_333745 - SURFACE
      ?auto_333746 - SURFACE
      ?auto_333747 - SURFACE
      ?auto_333748 - SURFACE
    )
    :vars
    (
      ?auto_333750 - HOIST
      ?auto_333749 - PLACE
      ?auto_333752 - TRUCK
      ?auto_333751 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_333750 ?auto_333749 ) ( SURFACE-AT ?auto_333747 ?auto_333749 ) ( CLEAR ?auto_333747 ) ( IS-CRATE ?auto_333748 ) ( not ( = ?auto_333747 ?auto_333748 ) ) ( AVAILABLE ?auto_333750 ) ( IN ?auto_333748 ?auto_333752 ) ( ON ?auto_333747 ?auto_333746 ) ( not ( = ?auto_333746 ?auto_333747 ) ) ( not ( = ?auto_333746 ?auto_333748 ) ) ( TRUCK-AT ?auto_333752 ?auto_333751 ) ( not ( = ?auto_333751 ?auto_333749 ) ) ( ON ?auto_333740 ?auto_333739 ) ( ON ?auto_333741 ?auto_333740 ) ( ON ?auto_333742 ?auto_333741 ) ( ON ?auto_333743 ?auto_333742 ) ( ON ?auto_333744 ?auto_333743 ) ( ON ?auto_333745 ?auto_333744 ) ( ON ?auto_333746 ?auto_333745 ) ( not ( = ?auto_333739 ?auto_333740 ) ) ( not ( = ?auto_333739 ?auto_333741 ) ) ( not ( = ?auto_333739 ?auto_333742 ) ) ( not ( = ?auto_333739 ?auto_333743 ) ) ( not ( = ?auto_333739 ?auto_333744 ) ) ( not ( = ?auto_333739 ?auto_333745 ) ) ( not ( = ?auto_333739 ?auto_333746 ) ) ( not ( = ?auto_333739 ?auto_333747 ) ) ( not ( = ?auto_333739 ?auto_333748 ) ) ( not ( = ?auto_333740 ?auto_333741 ) ) ( not ( = ?auto_333740 ?auto_333742 ) ) ( not ( = ?auto_333740 ?auto_333743 ) ) ( not ( = ?auto_333740 ?auto_333744 ) ) ( not ( = ?auto_333740 ?auto_333745 ) ) ( not ( = ?auto_333740 ?auto_333746 ) ) ( not ( = ?auto_333740 ?auto_333747 ) ) ( not ( = ?auto_333740 ?auto_333748 ) ) ( not ( = ?auto_333741 ?auto_333742 ) ) ( not ( = ?auto_333741 ?auto_333743 ) ) ( not ( = ?auto_333741 ?auto_333744 ) ) ( not ( = ?auto_333741 ?auto_333745 ) ) ( not ( = ?auto_333741 ?auto_333746 ) ) ( not ( = ?auto_333741 ?auto_333747 ) ) ( not ( = ?auto_333741 ?auto_333748 ) ) ( not ( = ?auto_333742 ?auto_333743 ) ) ( not ( = ?auto_333742 ?auto_333744 ) ) ( not ( = ?auto_333742 ?auto_333745 ) ) ( not ( = ?auto_333742 ?auto_333746 ) ) ( not ( = ?auto_333742 ?auto_333747 ) ) ( not ( = ?auto_333742 ?auto_333748 ) ) ( not ( = ?auto_333743 ?auto_333744 ) ) ( not ( = ?auto_333743 ?auto_333745 ) ) ( not ( = ?auto_333743 ?auto_333746 ) ) ( not ( = ?auto_333743 ?auto_333747 ) ) ( not ( = ?auto_333743 ?auto_333748 ) ) ( not ( = ?auto_333744 ?auto_333745 ) ) ( not ( = ?auto_333744 ?auto_333746 ) ) ( not ( = ?auto_333744 ?auto_333747 ) ) ( not ( = ?auto_333744 ?auto_333748 ) ) ( not ( = ?auto_333745 ?auto_333746 ) ) ( not ( = ?auto_333745 ?auto_333747 ) ) ( not ( = ?auto_333745 ?auto_333748 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_333746 ?auto_333747 ?auto_333748 )
      ( MAKE-9CRATE-VERIFY ?auto_333739 ?auto_333740 ?auto_333741 ?auto_333742 ?auto_333743 ?auto_333744 ?auto_333745 ?auto_333746 ?auto_333747 ?auto_333748 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_333838 - SURFACE
      ?auto_333839 - SURFACE
      ?auto_333840 - SURFACE
      ?auto_333841 - SURFACE
      ?auto_333842 - SURFACE
      ?auto_333843 - SURFACE
      ?auto_333844 - SURFACE
      ?auto_333845 - SURFACE
      ?auto_333846 - SURFACE
      ?auto_333847 - SURFACE
    )
    :vars
    (
      ?auto_333849 - HOIST
      ?auto_333850 - PLACE
      ?auto_333852 - TRUCK
      ?auto_333851 - PLACE
      ?auto_333848 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_333849 ?auto_333850 ) ( SURFACE-AT ?auto_333846 ?auto_333850 ) ( CLEAR ?auto_333846 ) ( IS-CRATE ?auto_333847 ) ( not ( = ?auto_333846 ?auto_333847 ) ) ( AVAILABLE ?auto_333849 ) ( ON ?auto_333846 ?auto_333845 ) ( not ( = ?auto_333845 ?auto_333846 ) ) ( not ( = ?auto_333845 ?auto_333847 ) ) ( TRUCK-AT ?auto_333852 ?auto_333851 ) ( not ( = ?auto_333851 ?auto_333850 ) ) ( HOIST-AT ?auto_333848 ?auto_333851 ) ( LIFTING ?auto_333848 ?auto_333847 ) ( not ( = ?auto_333849 ?auto_333848 ) ) ( ON ?auto_333839 ?auto_333838 ) ( ON ?auto_333840 ?auto_333839 ) ( ON ?auto_333841 ?auto_333840 ) ( ON ?auto_333842 ?auto_333841 ) ( ON ?auto_333843 ?auto_333842 ) ( ON ?auto_333844 ?auto_333843 ) ( ON ?auto_333845 ?auto_333844 ) ( not ( = ?auto_333838 ?auto_333839 ) ) ( not ( = ?auto_333838 ?auto_333840 ) ) ( not ( = ?auto_333838 ?auto_333841 ) ) ( not ( = ?auto_333838 ?auto_333842 ) ) ( not ( = ?auto_333838 ?auto_333843 ) ) ( not ( = ?auto_333838 ?auto_333844 ) ) ( not ( = ?auto_333838 ?auto_333845 ) ) ( not ( = ?auto_333838 ?auto_333846 ) ) ( not ( = ?auto_333838 ?auto_333847 ) ) ( not ( = ?auto_333839 ?auto_333840 ) ) ( not ( = ?auto_333839 ?auto_333841 ) ) ( not ( = ?auto_333839 ?auto_333842 ) ) ( not ( = ?auto_333839 ?auto_333843 ) ) ( not ( = ?auto_333839 ?auto_333844 ) ) ( not ( = ?auto_333839 ?auto_333845 ) ) ( not ( = ?auto_333839 ?auto_333846 ) ) ( not ( = ?auto_333839 ?auto_333847 ) ) ( not ( = ?auto_333840 ?auto_333841 ) ) ( not ( = ?auto_333840 ?auto_333842 ) ) ( not ( = ?auto_333840 ?auto_333843 ) ) ( not ( = ?auto_333840 ?auto_333844 ) ) ( not ( = ?auto_333840 ?auto_333845 ) ) ( not ( = ?auto_333840 ?auto_333846 ) ) ( not ( = ?auto_333840 ?auto_333847 ) ) ( not ( = ?auto_333841 ?auto_333842 ) ) ( not ( = ?auto_333841 ?auto_333843 ) ) ( not ( = ?auto_333841 ?auto_333844 ) ) ( not ( = ?auto_333841 ?auto_333845 ) ) ( not ( = ?auto_333841 ?auto_333846 ) ) ( not ( = ?auto_333841 ?auto_333847 ) ) ( not ( = ?auto_333842 ?auto_333843 ) ) ( not ( = ?auto_333842 ?auto_333844 ) ) ( not ( = ?auto_333842 ?auto_333845 ) ) ( not ( = ?auto_333842 ?auto_333846 ) ) ( not ( = ?auto_333842 ?auto_333847 ) ) ( not ( = ?auto_333843 ?auto_333844 ) ) ( not ( = ?auto_333843 ?auto_333845 ) ) ( not ( = ?auto_333843 ?auto_333846 ) ) ( not ( = ?auto_333843 ?auto_333847 ) ) ( not ( = ?auto_333844 ?auto_333845 ) ) ( not ( = ?auto_333844 ?auto_333846 ) ) ( not ( = ?auto_333844 ?auto_333847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_333845 ?auto_333846 ?auto_333847 )
      ( MAKE-9CRATE-VERIFY ?auto_333838 ?auto_333839 ?auto_333840 ?auto_333841 ?auto_333842 ?auto_333843 ?auto_333844 ?auto_333845 ?auto_333846 ?auto_333847 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_333946 - SURFACE
      ?auto_333947 - SURFACE
      ?auto_333948 - SURFACE
      ?auto_333949 - SURFACE
      ?auto_333950 - SURFACE
      ?auto_333951 - SURFACE
      ?auto_333952 - SURFACE
      ?auto_333953 - SURFACE
      ?auto_333954 - SURFACE
      ?auto_333955 - SURFACE
    )
    :vars
    (
      ?auto_333957 - HOIST
      ?auto_333959 - PLACE
      ?auto_333956 - TRUCK
      ?auto_333960 - PLACE
      ?auto_333961 - HOIST
      ?auto_333958 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_333957 ?auto_333959 ) ( SURFACE-AT ?auto_333954 ?auto_333959 ) ( CLEAR ?auto_333954 ) ( IS-CRATE ?auto_333955 ) ( not ( = ?auto_333954 ?auto_333955 ) ) ( AVAILABLE ?auto_333957 ) ( ON ?auto_333954 ?auto_333953 ) ( not ( = ?auto_333953 ?auto_333954 ) ) ( not ( = ?auto_333953 ?auto_333955 ) ) ( TRUCK-AT ?auto_333956 ?auto_333960 ) ( not ( = ?auto_333960 ?auto_333959 ) ) ( HOIST-AT ?auto_333961 ?auto_333960 ) ( not ( = ?auto_333957 ?auto_333961 ) ) ( AVAILABLE ?auto_333961 ) ( SURFACE-AT ?auto_333955 ?auto_333960 ) ( ON ?auto_333955 ?auto_333958 ) ( CLEAR ?auto_333955 ) ( not ( = ?auto_333954 ?auto_333958 ) ) ( not ( = ?auto_333955 ?auto_333958 ) ) ( not ( = ?auto_333953 ?auto_333958 ) ) ( ON ?auto_333947 ?auto_333946 ) ( ON ?auto_333948 ?auto_333947 ) ( ON ?auto_333949 ?auto_333948 ) ( ON ?auto_333950 ?auto_333949 ) ( ON ?auto_333951 ?auto_333950 ) ( ON ?auto_333952 ?auto_333951 ) ( ON ?auto_333953 ?auto_333952 ) ( not ( = ?auto_333946 ?auto_333947 ) ) ( not ( = ?auto_333946 ?auto_333948 ) ) ( not ( = ?auto_333946 ?auto_333949 ) ) ( not ( = ?auto_333946 ?auto_333950 ) ) ( not ( = ?auto_333946 ?auto_333951 ) ) ( not ( = ?auto_333946 ?auto_333952 ) ) ( not ( = ?auto_333946 ?auto_333953 ) ) ( not ( = ?auto_333946 ?auto_333954 ) ) ( not ( = ?auto_333946 ?auto_333955 ) ) ( not ( = ?auto_333946 ?auto_333958 ) ) ( not ( = ?auto_333947 ?auto_333948 ) ) ( not ( = ?auto_333947 ?auto_333949 ) ) ( not ( = ?auto_333947 ?auto_333950 ) ) ( not ( = ?auto_333947 ?auto_333951 ) ) ( not ( = ?auto_333947 ?auto_333952 ) ) ( not ( = ?auto_333947 ?auto_333953 ) ) ( not ( = ?auto_333947 ?auto_333954 ) ) ( not ( = ?auto_333947 ?auto_333955 ) ) ( not ( = ?auto_333947 ?auto_333958 ) ) ( not ( = ?auto_333948 ?auto_333949 ) ) ( not ( = ?auto_333948 ?auto_333950 ) ) ( not ( = ?auto_333948 ?auto_333951 ) ) ( not ( = ?auto_333948 ?auto_333952 ) ) ( not ( = ?auto_333948 ?auto_333953 ) ) ( not ( = ?auto_333948 ?auto_333954 ) ) ( not ( = ?auto_333948 ?auto_333955 ) ) ( not ( = ?auto_333948 ?auto_333958 ) ) ( not ( = ?auto_333949 ?auto_333950 ) ) ( not ( = ?auto_333949 ?auto_333951 ) ) ( not ( = ?auto_333949 ?auto_333952 ) ) ( not ( = ?auto_333949 ?auto_333953 ) ) ( not ( = ?auto_333949 ?auto_333954 ) ) ( not ( = ?auto_333949 ?auto_333955 ) ) ( not ( = ?auto_333949 ?auto_333958 ) ) ( not ( = ?auto_333950 ?auto_333951 ) ) ( not ( = ?auto_333950 ?auto_333952 ) ) ( not ( = ?auto_333950 ?auto_333953 ) ) ( not ( = ?auto_333950 ?auto_333954 ) ) ( not ( = ?auto_333950 ?auto_333955 ) ) ( not ( = ?auto_333950 ?auto_333958 ) ) ( not ( = ?auto_333951 ?auto_333952 ) ) ( not ( = ?auto_333951 ?auto_333953 ) ) ( not ( = ?auto_333951 ?auto_333954 ) ) ( not ( = ?auto_333951 ?auto_333955 ) ) ( not ( = ?auto_333951 ?auto_333958 ) ) ( not ( = ?auto_333952 ?auto_333953 ) ) ( not ( = ?auto_333952 ?auto_333954 ) ) ( not ( = ?auto_333952 ?auto_333955 ) ) ( not ( = ?auto_333952 ?auto_333958 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_333953 ?auto_333954 ?auto_333955 )
      ( MAKE-9CRATE-VERIFY ?auto_333946 ?auto_333947 ?auto_333948 ?auto_333949 ?auto_333950 ?auto_333951 ?auto_333952 ?auto_333953 ?auto_333954 ?auto_333955 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_334055 - SURFACE
      ?auto_334056 - SURFACE
      ?auto_334057 - SURFACE
      ?auto_334058 - SURFACE
      ?auto_334059 - SURFACE
      ?auto_334060 - SURFACE
      ?auto_334061 - SURFACE
      ?auto_334062 - SURFACE
      ?auto_334063 - SURFACE
      ?auto_334064 - SURFACE
    )
    :vars
    (
      ?auto_334068 - HOIST
      ?auto_334065 - PLACE
      ?auto_334070 - PLACE
      ?auto_334066 - HOIST
      ?auto_334069 - SURFACE
      ?auto_334067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_334068 ?auto_334065 ) ( SURFACE-AT ?auto_334063 ?auto_334065 ) ( CLEAR ?auto_334063 ) ( IS-CRATE ?auto_334064 ) ( not ( = ?auto_334063 ?auto_334064 ) ) ( AVAILABLE ?auto_334068 ) ( ON ?auto_334063 ?auto_334062 ) ( not ( = ?auto_334062 ?auto_334063 ) ) ( not ( = ?auto_334062 ?auto_334064 ) ) ( not ( = ?auto_334070 ?auto_334065 ) ) ( HOIST-AT ?auto_334066 ?auto_334070 ) ( not ( = ?auto_334068 ?auto_334066 ) ) ( AVAILABLE ?auto_334066 ) ( SURFACE-AT ?auto_334064 ?auto_334070 ) ( ON ?auto_334064 ?auto_334069 ) ( CLEAR ?auto_334064 ) ( not ( = ?auto_334063 ?auto_334069 ) ) ( not ( = ?auto_334064 ?auto_334069 ) ) ( not ( = ?auto_334062 ?auto_334069 ) ) ( TRUCK-AT ?auto_334067 ?auto_334065 ) ( ON ?auto_334056 ?auto_334055 ) ( ON ?auto_334057 ?auto_334056 ) ( ON ?auto_334058 ?auto_334057 ) ( ON ?auto_334059 ?auto_334058 ) ( ON ?auto_334060 ?auto_334059 ) ( ON ?auto_334061 ?auto_334060 ) ( ON ?auto_334062 ?auto_334061 ) ( not ( = ?auto_334055 ?auto_334056 ) ) ( not ( = ?auto_334055 ?auto_334057 ) ) ( not ( = ?auto_334055 ?auto_334058 ) ) ( not ( = ?auto_334055 ?auto_334059 ) ) ( not ( = ?auto_334055 ?auto_334060 ) ) ( not ( = ?auto_334055 ?auto_334061 ) ) ( not ( = ?auto_334055 ?auto_334062 ) ) ( not ( = ?auto_334055 ?auto_334063 ) ) ( not ( = ?auto_334055 ?auto_334064 ) ) ( not ( = ?auto_334055 ?auto_334069 ) ) ( not ( = ?auto_334056 ?auto_334057 ) ) ( not ( = ?auto_334056 ?auto_334058 ) ) ( not ( = ?auto_334056 ?auto_334059 ) ) ( not ( = ?auto_334056 ?auto_334060 ) ) ( not ( = ?auto_334056 ?auto_334061 ) ) ( not ( = ?auto_334056 ?auto_334062 ) ) ( not ( = ?auto_334056 ?auto_334063 ) ) ( not ( = ?auto_334056 ?auto_334064 ) ) ( not ( = ?auto_334056 ?auto_334069 ) ) ( not ( = ?auto_334057 ?auto_334058 ) ) ( not ( = ?auto_334057 ?auto_334059 ) ) ( not ( = ?auto_334057 ?auto_334060 ) ) ( not ( = ?auto_334057 ?auto_334061 ) ) ( not ( = ?auto_334057 ?auto_334062 ) ) ( not ( = ?auto_334057 ?auto_334063 ) ) ( not ( = ?auto_334057 ?auto_334064 ) ) ( not ( = ?auto_334057 ?auto_334069 ) ) ( not ( = ?auto_334058 ?auto_334059 ) ) ( not ( = ?auto_334058 ?auto_334060 ) ) ( not ( = ?auto_334058 ?auto_334061 ) ) ( not ( = ?auto_334058 ?auto_334062 ) ) ( not ( = ?auto_334058 ?auto_334063 ) ) ( not ( = ?auto_334058 ?auto_334064 ) ) ( not ( = ?auto_334058 ?auto_334069 ) ) ( not ( = ?auto_334059 ?auto_334060 ) ) ( not ( = ?auto_334059 ?auto_334061 ) ) ( not ( = ?auto_334059 ?auto_334062 ) ) ( not ( = ?auto_334059 ?auto_334063 ) ) ( not ( = ?auto_334059 ?auto_334064 ) ) ( not ( = ?auto_334059 ?auto_334069 ) ) ( not ( = ?auto_334060 ?auto_334061 ) ) ( not ( = ?auto_334060 ?auto_334062 ) ) ( not ( = ?auto_334060 ?auto_334063 ) ) ( not ( = ?auto_334060 ?auto_334064 ) ) ( not ( = ?auto_334060 ?auto_334069 ) ) ( not ( = ?auto_334061 ?auto_334062 ) ) ( not ( = ?auto_334061 ?auto_334063 ) ) ( not ( = ?auto_334061 ?auto_334064 ) ) ( not ( = ?auto_334061 ?auto_334069 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_334062 ?auto_334063 ?auto_334064 )
      ( MAKE-9CRATE-VERIFY ?auto_334055 ?auto_334056 ?auto_334057 ?auto_334058 ?auto_334059 ?auto_334060 ?auto_334061 ?auto_334062 ?auto_334063 ?auto_334064 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_334164 - SURFACE
      ?auto_334165 - SURFACE
      ?auto_334166 - SURFACE
      ?auto_334167 - SURFACE
      ?auto_334168 - SURFACE
      ?auto_334169 - SURFACE
      ?auto_334170 - SURFACE
      ?auto_334171 - SURFACE
      ?auto_334172 - SURFACE
      ?auto_334173 - SURFACE
    )
    :vars
    (
      ?auto_334176 - HOIST
      ?auto_334177 - PLACE
      ?auto_334179 - PLACE
      ?auto_334175 - HOIST
      ?auto_334178 - SURFACE
      ?auto_334174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_334176 ?auto_334177 ) ( IS-CRATE ?auto_334173 ) ( not ( = ?auto_334172 ?auto_334173 ) ) ( not ( = ?auto_334171 ?auto_334172 ) ) ( not ( = ?auto_334171 ?auto_334173 ) ) ( not ( = ?auto_334179 ?auto_334177 ) ) ( HOIST-AT ?auto_334175 ?auto_334179 ) ( not ( = ?auto_334176 ?auto_334175 ) ) ( AVAILABLE ?auto_334175 ) ( SURFACE-AT ?auto_334173 ?auto_334179 ) ( ON ?auto_334173 ?auto_334178 ) ( CLEAR ?auto_334173 ) ( not ( = ?auto_334172 ?auto_334178 ) ) ( not ( = ?auto_334173 ?auto_334178 ) ) ( not ( = ?auto_334171 ?auto_334178 ) ) ( TRUCK-AT ?auto_334174 ?auto_334177 ) ( SURFACE-AT ?auto_334171 ?auto_334177 ) ( CLEAR ?auto_334171 ) ( LIFTING ?auto_334176 ?auto_334172 ) ( IS-CRATE ?auto_334172 ) ( ON ?auto_334165 ?auto_334164 ) ( ON ?auto_334166 ?auto_334165 ) ( ON ?auto_334167 ?auto_334166 ) ( ON ?auto_334168 ?auto_334167 ) ( ON ?auto_334169 ?auto_334168 ) ( ON ?auto_334170 ?auto_334169 ) ( ON ?auto_334171 ?auto_334170 ) ( not ( = ?auto_334164 ?auto_334165 ) ) ( not ( = ?auto_334164 ?auto_334166 ) ) ( not ( = ?auto_334164 ?auto_334167 ) ) ( not ( = ?auto_334164 ?auto_334168 ) ) ( not ( = ?auto_334164 ?auto_334169 ) ) ( not ( = ?auto_334164 ?auto_334170 ) ) ( not ( = ?auto_334164 ?auto_334171 ) ) ( not ( = ?auto_334164 ?auto_334172 ) ) ( not ( = ?auto_334164 ?auto_334173 ) ) ( not ( = ?auto_334164 ?auto_334178 ) ) ( not ( = ?auto_334165 ?auto_334166 ) ) ( not ( = ?auto_334165 ?auto_334167 ) ) ( not ( = ?auto_334165 ?auto_334168 ) ) ( not ( = ?auto_334165 ?auto_334169 ) ) ( not ( = ?auto_334165 ?auto_334170 ) ) ( not ( = ?auto_334165 ?auto_334171 ) ) ( not ( = ?auto_334165 ?auto_334172 ) ) ( not ( = ?auto_334165 ?auto_334173 ) ) ( not ( = ?auto_334165 ?auto_334178 ) ) ( not ( = ?auto_334166 ?auto_334167 ) ) ( not ( = ?auto_334166 ?auto_334168 ) ) ( not ( = ?auto_334166 ?auto_334169 ) ) ( not ( = ?auto_334166 ?auto_334170 ) ) ( not ( = ?auto_334166 ?auto_334171 ) ) ( not ( = ?auto_334166 ?auto_334172 ) ) ( not ( = ?auto_334166 ?auto_334173 ) ) ( not ( = ?auto_334166 ?auto_334178 ) ) ( not ( = ?auto_334167 ?auto_334168 ) ) ( not ( = ?auto_334167 ?auto_334169 ) ) ( not ( = ?auto_334167 ?auto_334170 ) ) ( not ( = ?auto_334167 ?auto_334171 ) ) ( not ( = ?auto_334167 ?auto_334172 ) ) ( not ( = ?auto_334167 ?auto_334173 ) ) ( not ( = ?auto_334167 ?auto_334178 ) ) ( not ( = ?auto_334168 ?auto_334169 ) ) ( not ( = ?auto_334168 ?auto_334170 ) ) ( not ( = ?auto_334168 ?auto_334171 ) ) ( not ( = ?auto_334168 ?auto_334172 ) ) ( not ( = ?auto_334168 ?auto_334173 ) ) ( not ( = ?auto_334168 ?auto_334178 ) ) ( not ( = ?auto_334169 ?auto_334170 ) ) ( not ( = ?auto_334169 ?auto_334171 ) ) ( not ( = ?auto_334169 ?auto_334172 ) ) ( not ( = ?auto_334169 ?auto_334173 ) ) ( not ( = ?auto_334169 ?auto_334178 ) ) ( not ( = ?auto_334170 ?auto_334171 ) ) ( not ( = ?auto_334170 ?auto_334172 ) ) ( not ( = ?auto_334170 ?auto_334173 ) ) ( not ( = ?auto_334170 ?auto_334178 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_334171 ?auto_334172 ?auto_334173 )
      ( MAKE-9CRATE-VERIFY ?auto_334164 ?auto_334165 ?auto_334166 ?auto_334167 ?auto_334168 ?auto_334169 ?auto_334170 ?auto_334171 ?auto_334172 ?auto_334173 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_334273 - SURFACE
      ?auto_334274 - SURFACE
      ?auto_334275 - SURFACE
      ?auto_334276 - SURFACE
      ?auto_334277 - SURFACE
      ?auto_334278 - SURFACE
      ?auto_334279 - SURFACE
      ?auto_334280 - SURFACE
      ?auto_334281 - SURFACE
      ?auto_334282 - SURFACE
    )
    :vars
    (
      ?auto_334285 - HOIST
      ?auto_334288 - PLACE
      ?auto_334286 - PLACE
      ?auto_334287 - HOIST
      ?auto_334284 - SURFACE
      ?auto_334283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_334285 ?auto_334288 ) ( IS-CRATE ?auto_334282 ) ( not ( = ?auto_334281 ?auto_334282 ) ) ( not ( = ?auto_334280 ?auto_334281 ) ) ( not ( = ?auto_334280 ?auto_334282 ) ) ( not ( = ?auto_334286 ?auto_334288 ) ) ( HOIST-AT ?auto_334287 ?auto_334286 ) ( not ( = ?auto_334285 ?auto_334287 ) ) ( AVAILABLE ?auto_334287 ) ( SURFACE-AT ?auto_334282 ?auto_334286 ) ( ON ?auto_334282 ?auto_334284 ) ( CLEAR ?auto_334282 ) ( not ( = ?auto_334281 ?auto_334284 ) ) ( not ( = ?auto_334282 ?auto_334284 ) ) ( not ( = ?auto_334280 ?auto_334284 ) ) ( TRUCK-AT ?auto_334283 ?auto_334288 ) ( SURFACE-AT ?auto_334280 ?auto_334288 ) ( CLEAR ?auto_334280 ) ( IS-CRATE ?auto_334281 ) ( AVAILABLE ?auto_334285 ) ( IN ?auto_334281 ?auto_334283 ) ( ON ?auto_334274 ?auto_334273 ) ( ON ?auto_334275 ?auto_334274 ) ( ON ?auto_334276 ?auto_334275 ) ( ON ?auto_334277 ?auto_334276 ) ( ON ?auto_334278 ?auto_334277 ) ( ON ?auto_334279 ?auto_334278 ) ( ON ?auto_334280 ?auto_334279 ) ( not ( = ?auto_334273 ?auto_334274 ) ) ( not ( = ?auto_334273 ?auto_334275 ) ) ( not ( = ?auto_334273 ?auto_334276 ) ) ( not ( = ?auto_334273 ?auto_334277 ) ) ( not ( = ?auto_334273 ?auto_334278 ) ) ( not ( = ?auto_334273 ?auto_334279 ) ) ( not ( = ?auto_334273 ?auto_334280 ) ) ( not ( = ?auto_334273 ?auto_334281 ) ) ( not ( = ?auto_334273 ?auto_334282 ) ) ( not ( = ?auto_334273 ?auto_334284 ) ) ( not ( = ?auto_334274 ?auto_334275 ) ) ( not ( = ?auto_334274 ?auto_334276 ) ) ( not ( = ?auto_334274 ?auto_334277 ) ) ( not ( = ?auto_334274 ?auto_334278 ) ) ( not ( = ?auto_334274 ?auto_334279 ) ) ( not ( = ?auto_334274 ?auto_334280 ) ) ( not ( = ?auto_334274 ?auto_334281 ) ) ( not ( = ?auto_334274 ?auto_334282 ) ) ( not ( = ?auto_334274 ?auto_334284 ) ) ( not ( = ?auto_334275 ?auto_334276 ) ) ( not ( = ?auto_334275 ?auto_334277 ) ) ( not ( = ?auto_334275 ?auto_334278 ) ) ( not ( = ?auto_334275 ?auto_334279 ) ) ( not ( = ?auto_334275 ?auto_334280 ) ) ( not ( = ?auto_334275 ?auto_334281 ) ) ( not ( = ?auto_334275 ?auto_334282 ) ) ( not ( = ?auto_334275 ?auto_334284 ) ) ( not ( = ?auto_334276 ?auto_334277 ) ) ( not ( = ?auto_334276 ?auto_334278 ) ) ( not ( = ?auto_334276 ?auto_334279 ) ) ( not ( = ?auto_334276 ?auto_334280 ) ) ( not ( = ?auto_334276 ?auto_334281 ) ) ( not ( = ?auto_334276 ?auto_334282 ) ) ( not ( = ?auto_334276 ?auto_334284 ) ) ( not ( = ?auto_334277 ?auto_334278 ) ) ( not ( = ?auto_334277 ?auto_334279 ) ) ( not ( = ?auto_334277 ?auto_334280 ) ) ( not ( = ?auto_334277 ?auto_334281 ) ) ( not ( = ?auto_334277 ?auto_334282 ) ) ( not ( = ?auto_334277 ?auto_334284 ) ) ( not ( = ?auto_334278 ?auto_334279 ) ) ( not ( = ?auto_334278 ?auto_334280 ) ) ( not ( = ?auto_334278 ?auto_334281 ) ) ( not ( = ?auto_334278 ?auto_334282 ) ) ( not ( = ?auto_334278 ?auto_334284 ) ) ( not ( = ?auto_334279 ?auto_334280 ) ) ( not ( = ?auto_334279 ?auto_334281 ) ) ( not ( = ?auto_334279 ?auto_334282 ) ) ( not ( = ?auto_334279 ?auto_334284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_334280 ?auto_334281 ?auto_334282 )
      ( MAKE-9CRATE-VERIFY ?auto_334273 ?auto_334274 ?auto_334275 ?auto_334276 ?auto_334277 ?auto_334278 ?auto_334279 ?auto_334280 ?auto_334281 ?auto_334282 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_339838 - SURFACE
      ?auto_339839 - SURFACE
      ?auto_339840 - SURFACE
      ?auto_339841 - SURFACE
      ?auto_339842 - SURFACE
      ?auto_339843 - SURFACE
      ?auto_339844 - SURFACE
      ?auto_339845 - SURFACE
      ?auto_339846 - SURFACE
      ?auto_339847 - SURFACE
      ?auto_339848 - SURFACE
    )
    :vars
    (
      ?auto_339850 - HOIST
      ?auto_339849 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_339850 ?auto_339849 ) ( SURFACE-AT ?auto_339847 ?auto_339849 ) ( CLEAR ?auto_339847 ) ( LIFTING ?auto_339850 ?auto_339848 ) ( IS-CRATE ?auto_339848 ) ( not ( = ?auto_339847 ?auto_339848 ) ) ( ON ?auto_339839 ?auto_339838 ) ( ON ?auto_339840 ?auto_339839 ) ( ON ?auto_339841 ?auto_339840 ) ( ON ?auto_339842 ?auto_339841 ) ( ON ?auto_339843 ?auto_339842 ) ( ON ?auto_339844 ?auto_339843 ) ( ON ?auto_339845 ?auto_339844 ) ( ON ?auto_339846 ?auto_339845 ) ( ON ?auto_339847 ?auto_339846 ) ( not ( = ?auto_339838 ?auto_339839 ) ) ( not ( = ?auto_339838 ?auto_339840 ) ) ( not ( = ?auto_339838 ?auto_339841 ) ) ( not ( = ?auto_339838 ?auto_339842 ) ) ( not ( = ?auto_339838 ?auto_339843 ) ) ( not ( = ?auto_339838 ?auto_339844 ) ) ( not ( = ?auto_339838 ?auto_339845 ) ) ( not ( = ?auto_339838 ?auto_339846 ) ) ( not ( = ?auto_339838 ?auto_339847 ) ) ( not ( = ?auto_339838 ?auto_339848 ) ) ( not ( = ?auto_339839 ?auto_339840 ) ) ( not ( = ?auto_339839 ?auto_339841 ) ) ( not ( = ?auto_339839 ?auto_339842 ) ) ( not ( = ?auto_339839 ?auto_339843 ) ) ( not ( = ?auto_339839 ?auto_339844 ) ) ( not ( = ?auto_339839 ?auto_339845 ) ) ( not ( = ?auto_339839 ?auto_339846 ) ) ( not ( = ?auto_339839 ?auto_339847 ) ) ( not ( = ?auto_339839 ?auto_339848 ) ) ( not ( = ?auto_339840 ?auto_339841 ) ) ( not ( = ?auto_339840 ?auto_339842 ) ) ( not ( = ?auto_339840 ?auto_339843 ) ) ( not ( = ?auto_339840 ?auto_339844 ) ) ( not ( = ?auto_339840 ?auto_339845 ) ) ( not ( = ?auto_339840 ?auto_339846 ) ) ( not ( = ?auto_339840 ?auto_339847 ) ) ( not ( = ?auto_339840 ?auto_339848 ) ) ( not ( = ?auto_339841 ?auto_339842 ) ) ( not ( = ?auto_339841 ?auto_339843 ) ) ( not ( = ?auto_339841 ?auto_339844 ) ) ( not ( = ?auto_339841 ?auto_339845 ) ) ( not ( = ?auto_339841 ?auto_339846 ) ) ( not ( = ?auto_339841 ?auto_339847 ) ) ( not ( = ?auto_339841 ?auto_339848 ) ) ( not ( = ?auto_339842 ?auto_339843 ) ) ( not ( = ?auto_339842 ?auto_339844 ) ) ( not ( = ?auto_339842 ?auto_339845 ) ) ( not ( = ?auto_339842 ?auto_339846 ) ) ( not ( = ?auto_339842 ?auto_339847 ) ) ( not ( = ?auto_339842 ?auto_339848 ) ) ( not ( = ?auto_339843 ?auto_339844 ) ) ( not ( = ?auto_339843 ?auto_339845 ) ) ( not ( = ?auto_339843 ?auto_339846 ) ) ( not ( = ?auto_339843 ?auto_339847 ) ) ( not ( = ?auto_339843 ?auto_339848 ) ) ( not ( = ?auto_339844 ?auto_339845 ) ) ( not ( = ?auto_339844 ?auto_339846 ) ) ( not ( = ?auto_339844 ?auto_339847 ) ) ( not ( = ?auto_339844 ?auto_339848 ) ) ( not ( = ?auto_339845 ?auto_339846 ) ) ( not ( = ?auto_339845 ?auto_339847 ) ) ( not ( = ?auto_339845 ?auto_339848 ) ) ( not ( = ?auto_339846 ?auto_339847 ) ) ( not ( = ?auto_339846 ?auto_339848 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_339847 ?auto_339848 )
      ( MAKE-10CRATE-VERIFY ?auto_339838 ?auto_339839 ?auto_339840 ?auto_339841 ?auto_339842 ?auto_339843 ?auto_339844 ?auto_339845 ?auto_339846 ?auto_339847 ?auto_339848 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_339932 - SURFACE
      ?auto_339933 - SURFACE
      ?auto_339934 - SURFACE
      ?auto_339935 - SURFACE
      ?auto_339936 - SURFACE
      ?auto_339937 - SURFACE
      ?auto_339938 - SURFACE
      ?auto_339939 - SURFACE
      ?auto_339940 - SURFACE
      ?auto_339941 - SURFACE
      ?auto_339942 - SURFACE
    )
    :vars
    (
      ?auto_339943 - HOIST
      ?auto_339945 - PLACE
      ?auto_339944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_339943 ?auto_339945 ) ( SURFACE-AT ?auto_339941 ?auto_339945 ) ( CLEAR ?auto_339941 ) ( IS-CRATE ?auto_339942 ) ( not ( = ?auto_339941 ?auto_339942 ) ) ( TRUCK-AT ?auto_339944 ?auto_339945 ) ( AVAILABLE ?auto_339943 ) ( IN ?auto_339942 ?auto_339944 ) ( ON ?auto_339941 ?auto_339940 ) ( not ( = ?auto_339940 ?auto_339941 ) ) ( not ( = ?auto_339940 ?auto_339942 ) ) ( ON ?auto_339933 ?auto_339932 ) ( ON ?auto_339934 ?auto_339933 ) ( ON ?auto_339935 ?auto_339934 ) ( ON ?auto_339936 ?auto_339935 ) ( ON ?auto_339937 ?auto_339936 ) ( ON ?auto_339938 ?auto_339937 ) ( ON ?auto_339939 ?auto_339938 ) ( ON ?auto_339940 ?auto_339939 ) ( not ( = ?auto_339932 ?auto_339933 ) ) ( not ( = ?auto_339932 ?auto_339934 ) ) ( not ( = ?auto_339932 ?auto_339935 ) ) ( not ( = ?auto_339932 ?auto_339936 ) ) ( not ( = ?auto_339932 ?auto_339937 ) ) ( not ( = ?auto_339932 ?auto_339938 ) ) ( not ( = ?auto_339932 ?auto_339939 ) ) ( not ( = ?auto_339932 ?auto_339940 ) ) ( not ( = ?auto_339932 ?auto_339941 ) ) ( not ( = ?auto_339932 ?auto_339942 ) ) ( not ( = ?auto_339933 ?auto_339934 ) ) ( not ( = ?auto_339933 ?auto_339935 ) ) ( not ( = ?auto_339933 ?auto_339936 ) ) ( not ( = ?auto_339933 ?auto_339937 ) ) ( not ( = ?auto_339933 ?auto_339938 ) ) ( not ( = ?auto_339933 ?auto_339939 ) ) ( not ( = ?auto_339933 ?auto_339940 ) ) ( not ( = ?auto_339933 ?auto_339941 ) ) ( not ( = ?auto_339933 ?auto_339942 ) ) ( not ( = ?auto_339934 ?auto_339935 ) ) ( not ( = ?auto_339934 ?auto_339936 ) ) ( not ( = ?auto_339934 ?auto_339937 ) ) ( not ( = ?auto_339934 ?auto_339938 ) ) ( not ( = ?auto_339934 ?auto_339939 ) ) ( not ( = ?auto_339934 ?auto_339940 ) ) ( not ( = ?auto_339934 ?auto_339941 ) ) ( not ( = ?auto_339934 ?auto_339942 ) ) ( not ( = ?auto_339935 ?auto_339936 ) ) ( not ( = ?auto_339935 ?auto_339937 ) ) ( not ( = ?auto_339935 ?auto_339938 ) ) ( not ( = ?auto_339935 ?auto_339939 ) ) ( not ( = ?auto_339935 ?auto_339940 ) ) ( not ( = ?auto_339935 ?auto_339941 ) ) ( not ( = ?auto_339935 ?auto_339942 ) ) ( not ( = ?auto_339936 ?auto_339937 ) ) ( not ( = ?auto_339936 ?auto_339938 ) ) ( not ( = ?auto_339936 ?auto_339939 ) ) ( not ( = ?auto_339936 ?auto_339940 ) ) ( not ( = ?auto_339936 ?auto_339941 ) ) ( not ( = ?auto_339936 ?auto_339942 ) ) ( not ( = ?auto_339937 ?auto_339938 ) ) ( not ( = ?auto_339937 ?auto_339939 ) ) ( not ( = ?auto_339937 ?auto_339940 ) ) ( not ( = ?auto_339937 ?auto_339941 ) ) ( not ( = ?auto_339937 ?auto_339942 ) ) ( not ( = ?auto_339938 ?auto_339939 ) ) ( not ( = ?auto_339938 ?auto_339940 ) ) ( not ( = ?auto_339938 ?auto_339941 ) ) ( not ( = ?auto_339938 ?auto_339942 ) ) ( not ( = ?auto_339939 ?auto_339940 ) ) ( not ( = ?auto_339939 ?auto_339941 ) ) ( not ( = ?auto_339939 ?auto_339942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_339940 ?auto_339941 ?auto_339942 )
      ( MAKE-10CRATE-VERIFY ?auto_339932 ?auto_339933 ?auto_339934 ?auto_339935 ?auto_339936 ?auto_339937 ?auto_339938 ?auto_339939 ?auto_339940 ?auto_339941 ?auto_339942 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340037 - SURFACE
      ?auto_340038 - SURFACE
      ?auto_340039 - SURFACE
      ?auto_340040 - SURFACE
      ?auto_340041 - SURFACE
      ?auto_340042 - SURFACE
      ?auto_340043 - SURFACE
      ?auto_340044 - SURFACE
      ?auto_340045 - SURFACE
      ?auto_340046 - SURFACE
      ?auto_340047 - SURFACE
    )
    :vars
    (
      ?auto_340048 - HOIST
      ?auto_340051 - PLACE
      ?auto_340049 - TRUCK
      ?auto_340050 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_340048 ?auto_340051 ) ( SURFACE-AT ?auto_340046 ?auto_340051 ) ( CLEAR ?auto_340046 ) ( IS-CRATE ?auto_340047 ) ( not ( = ?auto_340046 ?auto_340047 ) ) ( AVAILABLE ?auto_340048 ) ( IN ?auto_340047 ?auto_340049 ) ( ON ?auto_340046 ?auto_340045 ) ( not ( = ?auto_340045 ?auto_340046 ) ) ( not ( = ?auto_340045 ?auto_340047 ) ) ( TRUCK-AT ?auto_340049 ?auto_340050 ) ( not ( = ?auto_340050 ?auto_340051 ) ) ( ON ?auto_340038 ?auto_340037 ) ( ON ?auto_340039 ?auto_340038 ) ( ON ?auto_340040 ?auto_340039 ) ( ON ?auto_340041 ?auto_340040 ) ( ON ?auto_340042 ?auto_340041 ) ( ON ?auto_340043 ?auto_340042 ) ( ON ?auto_340044 ?auto_340043 ) ( ON ?auto_340045 ?auto_340044 ) ( not ( = ?auto_340037 ?auto_340038 ) ) ( not ( = ?auto_340037 ?auto_340039 ) ) ( not ( = ?auto_340037 ?auto_340040 ) ) ( not ( = ?auto_340037 ?auto_340041 ) ) ( not ( = ?auto_340037 ?auto_340042 ) ) ( not ( = ?auto_340037 ?auto_340043 ) ) ( not ( = ?auto_340037 ?auto_340044 ) ) ( not ( = ?auto_340037 ?auto_340045 ) ) ( not ( = ?auto_340037 ?auto_340046 ) ) ( not ( = ?auto_340037 ?auto_340047 ) ) ( not ( = ?auto_340038 ?auto_340039 ) ) ( not ( = ?auto_340038 ?auto_340040 ) ) ( not ( = ?auto_340038 ?auto_340041 ) ) ( not ( = ?auto_340038 ?auto_340042 ) ) ( not ( = ?auto_340038 ?auto_340043 ) ) ( not ( = ?auto_340038 ?auto_340044 ) ) ( not ( = ?auto_340038 ?auto_340045 ) ) ( not ( = ?auto_340038 ?auto_340046 ) ) ( not ( = ?auto_340038 ?auto_340047 ) ) ( not ( = ?auto_340039 ?auto_340040 ) ) ( not ( = ?auto_340039 ?auto_340041 ) ) ( not ( = ?auto_340039 ?auto_340042 ) ) ( not ( = ?auto_340039 ?auto_340043 ) ) ( not ( = ?auto_340039 ?auto_340044 ) ) ( not ( = ?auto_340039 ?auto_340045 ) ) ( not ( = ?auto_340039 ?auto_340046 ) ) ( not ( = ?auto_340039 ?auto_340047 ) ) ( not ( = ?auto_340040 ?auto_340041 ) ) ( not ( = ?auto_340040 ?auto_340042 ) ) ( not ( = ?auto_340040 ?auto_340043 ) ) ( not ( = ?auto_340040 ?auto_340044 ) ) ( not ( = ?auto_340040 ?auto_340045 ) ) ( not ( = ?auto_340040 ?auto_340046 ) ) ( not ( = ?auto_340040 ?auto_340047 ) ) ( not ( = ?auto_340041 ?auto_340042 ) ) ( not ( = ?auto_340041 ?auto_340043 ) ) ( not ( = ?auto_340041 ?auto_340044 ) ) ( not ( = ?auto_340041 ?auto_340045 ) ) ( not ( = ?auto_340041 ?auto_340046 ) ) ( not ( = ?auto_340041 ?auto_340047 ) ) ( not ( = ?auto_340042 ?auto_340043 ) ) ( not ( = ?auto_340042 ?auto_340044 ) ) ( not ( = ?auto_340042 ?auto_340045 ) ) ( not ( = ?auto_340042 ?auto_340046 ) ) ( not ( = ?auto_340042 ?auto_340047 ) ) ( not ( = ?auto_340043 ?auto_340044 ) ) ( not ( = ?auto_340043 ?auto_340045 ) ) ( not ( = ?auto_340043 ?auto_340046 ) ) ( not ( = ?auto_340043 ?auto_340047 ) ) ( not ( = ?auto_340044 ?auto_340045 ) ) ( not ( = ?auto_340044 ?auto_340046 ) ) ( not ( = ?auto_340044 ?auto_340047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_340045 ?auto_340046 ?auto_340047 )
      ( MAKE-10CRATE-VERIFY ?auto_340037 ?auto_340038 ?auto_340039 ?auto_340040 ?auto_340041 ?auto_340042 ?auto_340043 ?auto_340044 ?auto_340045 ?auto_340046 ?auto_340047 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340152 - SURFACE
      ?auto_340153 - SURFACE
      ?auto_340154 - SURFACE
      ?auto_340155 - SURFACE
      ?auto_340156 - SURFACE
      ?auto_340157 - SURFACE
      ?auto_340158 - SURFACE
      ?auto_340159 - SURFACE
      ?auto_340160 - SURFACE
      ?auto_340161 - SURFACE
      ?auto_340162 - SURFACE
    )
    :vars
    (
      ?auto_340166 - HOIST
      ?auto_340164 - PLACE
      ?auto_340165 - TRUCK
      ?auto_340163 - PLACE
      ?auto_340167 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_340166 ?auto_340164 ) ( SURFACE-AT ?auto_340161 ?auto_340164 ) ( CLEAR ?auto_340161 ) ( IS-CRATE ?auto_340162 ) ( not ( = ?auto_340161 ?auto_340162 ) ) ( AVAILABLE ?auto_340166 ) ( ON ?auto_340161 ?auto_340160 ) ( not ( = ?auto_340160 ?auto_340161 ) ) ( not ( = ?auto_340160 ?auto_340162 ) ) ( TRUCK-AT ?auto_340165 ?auto_340163 ) ( not ( = ?auto_340163 ?auto_340164 ) ) ( HOIST-AT ?auto_340167 ?auto_340163 ) ( LIFTING ?auto_340167 ?auto_340162 ) ( not ( = ?auto_340166 ?auto_340167 ) ) ( ON ?auto_340153 ?auto_340152 ) ( ON ?auto_340154 ?auto_340153 ) ( ON ?auto_340155 ?auto_340154 ) ( ON ?auto_340156 ?auto_340155 ) ( ON ?auto_340157 ?auto_340156 ) ( ON ?auto_340158 ?auto_340157 ) ( ON ?auto_340159 ?auto_340158 ) ( ON ?auto_340160 ?auto_340159 ) ( not ( = ?auto_340152 ?auto_340153 ) ) ( not ( = ?auto_340152 ?auto_340154 ) ) ( not ( = ?auto_340152 ?auto_340155 ) ) ( not ( = ?auto_340152 ?auto_340156 ) ) ( not ( = ?auto_340152 ?auto_340157 ) ) ( not ( = ?auto_340152 ?auto_340158 ) ) ( not ( = ?auto_340152 ?auto_340159 ) ) ( not ( = ?auto_340152 ?auto_340160 ) ) ( not ( = ?auto_340152 ?auto_340161 ) ) ( not ( = ?auto_340152 ?auto_340162 ) ) ( not ( = ?auto_340153 ?auto_340154 ) ) ( not ( = ?auto_340153 ?auto_340155 ) ) ( not ( = ?auto_340153 ?auto_340156 ) ) ( not ( = ?auto_340153 ?auto_340157 ) ) ( not ( = ?auto_340153 ?auto_340158 ) ) ( not ( = ?auto_340153 ?auto_340159 ) ) ( not ( = ?auto_340153 ?auto_340160 ) ) ( not ( = ?auto_340153 ?auto_340161 ) ) ( not ( = ?auto_340153 ?auto_340162 ) ) ( not ( = ?auto_340154 ?auto_340155 ) ) ( not ( = ?auto_340154 ?auto_340156 ) ) ( not ( = ?auto_340154 ?auto_340157 ) ) ( not ( = ?auto_340154 ?auto_340158 ) ) ( not ( = ?auto_340154 ?auto_340159 ) ) ( not ( = ?auto_340154 ?auto_340160 ) ) ( not ( = ?auto_340154 ?auto_340161 ) ) ( not ( = ?auto_340154 ?auto_340162 ) ) ( not ( = ?auto_340155 ?auto_340156 ) ) ( not ( = ?auto_340155 ?auto_340157 ) ) ( not ( = ?auto_340155 ?auto_340158 ) ) ( not ( = ?auto_340155 ?auto_340159 ) ) ( not ( = ?auto_340155 ?auto_340160 ) ) ( not ( = ?auto_340155 ?auto_340161 ) ) ( not ( = ?auto_340155 ?auto_340162 ) ) ( not ( = ?auto_340156 ?auto_340157 ) ) ( not ( = ?auto_340156 ?auto_340158 ) ) ( not ( = ?auto_340156 ?auto_340159 ) ) ( not ( = ?auto_340156 ?auto_340160 ) ) ( not ( = ?auto_340156 ?auto_340161 ) ) ( not ( = ?auto_340156 ?auto_340162 ) ) ( not ( = ?auto_340157 ?auto_340158 ) ) ( not ( = ?auto_340157 ?auto_340159 ) ) ( not ( = ?auto_340157 ?auto_340160 ) ) ( not ( = ?auto_340157 ?auto_340161 ) ) ( not ( = ?auto_340157 ?auto_340162 ) ) ( not ( = ?auto_340158 ?auto_340159 ) ) ( not ( = ?auto_340158 ?auto_340160 ) ) ( not ( = ?auto_340158 ?auto_340161 ) ) ( not ( = ?auto_340158 ?auto_340162 ) ) ( not ( = ?auto_340159 ?auto_340160 ) ) ( not ( = ?auto_340159 ?auto_340161 ) ) ( not ( = ?auto_340159 ?auto_340162 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_340160 ?auto_340161 ?auto_340162 )
      ( MAKE-10CRATE-VERIFY ?auto_340152 ?auto_340153 ?auto_340154 ?auto_340155 ?auto_340156 ?auto_340157 ?auto_340158 ?auto_340159 ?auto_340160 ?auto_340161 ?auto_340162 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340277 - SURFACE
      ?auto_340278 - SURFACE
      ?auto_340279 - SURFACE
      ?auto_340280 - SURFACE
      ?auto_340281 - SURFACE
      ?auto_340282 - SURFACE
      ?auto_340283 - SURFACE
      ?auto_340284 - SURFACE
      ?auto_340285 - SURFACE
      ?auto_340286 - SURFACE
      ?auto_340287 - SURFACE
    )
    :vars
    (
      ?auto_340293 - HOIST
      ?auto_340291 - PLACE
      ?auto_340292 - TRUCK
      ?auto_340289 - PLACE
      ?auto_340290 - HOIST
      ?auto_340288 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_340293 ?auto_340291 ) ( SURFACE-AT ?auto_340286 ?auto_340291 ) ( CLEAR ?auto_340286 ) ( IS-CRATE ?auto_340287 ) ( not ( = ?auto_340286 ?auto_340287 ) ) ( AVAILABLE ?auto_340293 ) ( ON ?auto_340286 ?auto_340285 ) ( not ( = ?auto_340285 ?auto_340286 ) ) ( not ( = ?auto_340285 ?auto_340287 ) ) ( TRUCK-AT ?auto_340292 ?auto_340289 ) ( not ( = ?auto_340289 ?auto_340291 ) ) ( HOIST-AT ?auto_340290 ?auto_340289 ) ( not ( = ?auto_340293 ?auto_340290 ) ) ( AVAILABLE ?auto_340290 ) ( SURFACE-AT ?auto_340287 ?auto_340289 ) ( ON ?auto_340287 ?auto_340288 ) ( CLEAR ?auto_340287 ) ( not ( = ?auto_340286 ?auto_340288 ) ) ( not ( = ?auto_340287 ?auto_340288 ) ) ( not ( = ?auto_340285 ?auto_340288 ) ) ( ON ?auto_340278 ?auto_340277 ) ( ON ?auto_340279 ?auto_340278 ) ( ON ?auto_340280 ?auto_340279 ) ( ON ?auto_340281 ?auto_340280 ) ( ON ?auto_340282 ?auto_340281 ) ( ON ?auto_340283 ?auto_340282 ) ( ON ?auto_340284 ?auto_340283 ) ( ON ?auto_340285 ?auto_340284 ) ( not ( = ?auto_340277 ?auto_340278 ) ) ( not ( = ?auto_340277 ?auto_340279 ) ) ( not ( = ?auto_340277 ?auto_340280 ) ) ( not ( = ?auto_340277 ?auto_340281 ) ) ( not ( = ?auto_340277 ?auto_340282 ) ) ( not ( = ?auto_340277 ?auto_340283 ) ) ( not ( = ?auto_340277 ?auto_340284 ) ) ( not ( = ?auto_340277 ?auto_340285 ) ) ( not ( = ?auto_340277 ?auto_340286 ) ) ( not ( = ?auto_340277 ?auto_340287 ) ) ( not ( = ?auto_340277 ?auto_340288 ) ) ( not ( = ?auto_340278 ?auto_340279 ) ) ( not ( = ?auto_340278 ?auto_340280 ) ) ( not ( = ?auto_340278 ?auto_340281 ) ) ( not ( = ?auto_340278 ?auto_340282 ) ) ( not ( = ?auto_340278 ?auto_340283 ) ) ( not ( = ?auto_340278 ?auto_340284 ) ) ( not ( = ?auto_340278 ?auto_340285 ) ) ( not ( = ?auto_340278 ?auto_340286 ) ) ( not ( = ?auto_340278 ?auto_340287 ) ) ( not ( = ?auto_340278 ?auto_340288 ) ) ( not ( = ?auto_340279 ?auto_340280 ) ) ( not ( = ?auto_340279 ?auto_340281 ) ) ( not ( = ?auto_340279 ?auto_340282 ) ) ( not ( = ?auto_340279 ?auto_340283 ) ) ( not ( = ?auto_340279 ?auto_340284 ) ) ( not ( = ?auto_340279 ?auto_340285 ) ) ( not ( = ?auto_340279 ?auto_340286 ) ) ( not ( = ?auto_340279 ?auto_340287 ) ) ( not ( = ?auto_340279 ?auto_340288 ) ) ( not ( = ?auto_340280 ?auto_340281 ) ) ( not ( = ?auto_340280 ?auto_340282 ) ) ( not ( = ?auto_340280 ?auto_340283 ) ) ( not ( = ?auto_340280 ?auto_340284 ) ) ( not ( = ?auto_340280 ?auto_340285 ) ) ( not ( = ?auto_340280 ?auto_340286 ) ) ( not ( = ?auto_340280 ?auto_340287 ) ) ( not ( = ?auto_340280 ?auto_340288 ) ) ( not ( = ?auto_340281 ?auto_340282 ) ) ( not ( = ?auto_340281 ?auto_340283 ) ) ( not ( = ?auto_340281 ?auto_340284 ) ) ( not ( = ?auto_340281 ?auto_340285 ) ) ( not ( = ?auto_340281 ?auto_340286 ) ) ( not ( = ?auto_340281 ?auto_340287 ) ) ( not ( = ?auto_340281 ?auto_340288 ) ) ( not ( = ?auto_340282 ?auto_340283 ) ) ( not ( = ?auto_340282 ?auto_340284 ) ) ( not ( = ?auto_340282 ?auto_340285 ) ) ( not ( = ?auto_340282 ?auto_340286 ) ) ( not ( = ?auto_340282 ?auto_340287 ) ) ( not ( = ?auto_340282 ?auto_340288 ) ) ( not ( = ?auto_340283 ?auto_340284 ) ) ( not ( = ?auto_340283 ?auto_340285 ) ) ( not ( = ?auto_340283 ?auto_340286 ) ) ( not ( = ?auto_340283 ?auto_340287 ) ) ( not ( = ?auto_340283 ?auto_340288 ) ) ( not ( = ?auto_340284 ?auto_340285 ) ) ( not ( = ?auto_340284 ?auto_340286 ) ) ( not ( = ?auto_340284 ?auto_340287 ) ) ( not ( = ?auto_340284 ?auto_340288 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_340285 ?auto_340286 ?auto_340287 )
      ( MAKE-10CRATE-VERIFY ?auto_340277 ?auto_340278 ?auto_340279 ?auto_340280 ?auto_340281 ?auto_340282 ?auto_340283 ?auto_340284 ?auto_340285 ?auto_340286 ?auto_340287 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340403 - SURFACE
      ?auto_340404 - SURFACE
      ?auto_340405 - SURFACE
      ?auto_340406 - SURFACE
      ?auto_340407 - SURFACE
      ?auto_340408 - SURFACE
      ?auto_340409 - SURFACE
      ?auto_340410 - SURFACE
      ?auto_340411 - SURFACE
      ?auto_340412 - SURFACE
      ?auto_340413 - SURFACE
    )
    :vars
    (
      ?auto_340418 - HOIST
      ?auto_340419 - PLACE
      ?auto_340414 - PLACE
      ?auto_340415 - HOIST
      ?auto_340416 - SURFACE
      ?auto_340417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_340418 ?auto_340419 ) ( SURFACE-AT ?auto_340412 ?auto_340419 ) ( CLEAR ?auto_340412 ) ( IS-CRATE ?auto_340413 ) ( not ( = ?auto_340412 ?auto_340413 ) ) ( AVAILABLE ?auto_340418 ) ( ON ?auto_340412 ?auto_340411 ) ( not ( = ?auto_340411 ?auto_340412 ) ) ( not ( = ?auto_340411 ?auto_340413 ) ) ( not ( = ?auto_340414 ?auto_340419 ) ) ( HOIST-AT ?auto_340415 ?auto_340414 ) ( not ( = ?auto_340418 ?auto_340415 ) ) ( AVAILABLE ?auto_340415 ) ( SURFACE-AT ?auto_340413 ?auto_340414 ) ( ON ?auto_340413 ?auto_340416 ) ( CLEAR ?auto_340413 ) ( not ( = ?auto_340412 ?auto_340416 ) ) ( not ( = ?auto_340413 ?auto_340416 ) ) ( not ( = ?auto_340411 ?auto_340416 ) ) ( TRUCK-AT ?auto_340417 ?auto_340419 ) ( ON ?auto_340404 ?auto_340403 ) ( ON ?auto_340405 ?auto_340404 ) ( ON ?auto_340406 ?auto_340405 ) ( ON ?auto_340407 ?auto_340406 ) ( ON ?auto_340408 ?auto_340407 ) ( ON ?auto_340409 ?auto_340408 ) ( ON ?auto_340410 ?auto_340409 ) ( ON ?auto_340411 ?auto_340410 ) ( not ( = ?auto_340403 ?auto_340404 ) ) ( not ( = ?auto_340403 ?auto_340405 ) ) ( not ( = ?auto_340403 ?auto_340406 ) ) ( not ( = ?auto_340403 ?auto_340407 ) ) ( not ( = ?auto_340403 ?auto_340408 ) ) ( not ( = ?auto_340403 ?auto_340409 ) ) ( not ( = ?auto_340403 ?auto_340410 ) ) ( not ( = ?auto_340403 ?auto_340411 ) ) ( not ( = ?auto_340403 ?auto_340412 ) ) ( not ( = ?auto_340403 ?auto_340413 ) ) ( not ( = ?auto_340403 ?auto_340416 ) ) ( not ( = ?auto_340404 ?auto_340405 ) ) ( not ( = ?auto_340404 ?auto_340406 ) ) ( not ( = ?auto_340404 ?auto_340407 ) ) ( not ( = ?auto_340404 ?auto_340408 ) ) ( not ( = ?auto_340404 ?auto_340409 ) ) ( not ( = ?auto_340404 ?auto_340410 ) ) ( not ( = ?auto_340404 ?auto_340411 ) ) ( not ( = ?auto_340404 ?auto_340412 ) ) ( not ( = ?auto_340404 ?auto_340413 ) ) ( not ( = ?auto_340404 ?auto_340416 ) ) ( not ( = ?auto_340405 ?auto_340406 ) ) ( not ( = ?auto_340405 ?auto_340407 ) ) ( not ( = ?auto_340405 ?auto_340408 ) ) ( not ( = ?auto_340405 ?auto_340409 ) ) ( not ( = ?auto_340405 ?auto_340410 ) ) ( not ( = ?auto_340405 ?auto_340411 ) ) ( not ( = ?auto_340405 ?auto_340412 ) ) ( not ( = ?auto_340405 ?auto_340413 ) ) ( not ( = ?auto_340405 ?auto_340416 ) ) ( not ( = ?auto_340406 ?auto_340407 ) ) ( not ( = ?auto_340406 ?auto_340408 ) ) ( not ( = ?auto_340406 ?auto_340409 ) ) ( not ( = ?auto_340406 ?auto_340410 ) ) ( not ( = ?auto_340406 ?auto_340411 ) ) ( not ( = ?auto_340406 ?auto_340412 ) ) ( not ( = ?auto_340406 ?auto_340413 ) ) ( not ( = ?auto_340406 ?auto_340416 ) ) ( not ( = ?auto_340407 ?auto_340408 ) ) ( not ( = ?auto_340407 ?auto_340409 ) ) ( not ( = ?auto_340407 ?auto_340410 ) ) ( not ( = ?auto_340407 ?auto_340411 ) ) ( not ( = ?auto_340407 ?auto_340412 ) ) ( not ( = ?auto_340407 ?auto_340413 ) ) ( not ( = ?auto_340407 ?auto_340416 ) ) ( not ( = ?auto_340408 ?auto_340409 ) ) ( not ( = ?auto_340408 ?auto_340410 ) ) ( not ( = ?auto_340408 ?auto_340411 ) ) ( not ( = ?auto_340408 ?auto_340412 ) ) ( not ( = ?auto_340408 ?auto_340413 ) ) ( not ( = ?auto_340408 ?auto_340416 ) ) ( not ( = ?auto_340409 ?auto_340410 ) ) ( not ( = ?auto_340409 ?auto_340411 ) ) ( not ( = ?auto_340409 ?auto_340412 ) ) ( not ( = ?auto_340409 ?auto_340413 ) ) ( not ( = ?auto_340409 ?auto_340416 ) ) ( not ( = ?auto_340410 ?auto_340411 ) ) ( not ( = ?auto_340410 ?auto_340412 ) ) ( not ( = ?auto_340410 ?auto_340413 ) ) ( not ( = ?auto_340410 ?auto_340416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_340411 ?auto_340412 ?auto_340413 )
      ( MAKE-10CRATE-VERIFY ?auto_340403 ?auto_340404 ?auto_340405 ?auto_340406 ?auto_340407 ?auto_340408 ?auto_340409 ?auto_340410 ?auto_340411 ?auto_340412 ?auto_340413 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340529 - SURFACE
      ?auto_340530 - SURFACE
      ?auto_340531 - SURFACE
      ?auto_340532 - SURFACE
      ?auto_340533 - SURFACE
      ?auto_340534 - SURFACE
      ?auto_340535 - SURFACE
      ?auto_340536 - SURFACE
      ?auto_340537 - SURFACE
      ?auto_340538 - SURFACE
      ?auto_340539 - SURFACE
    )
    :vars
    (
      ?auto_340541 - HOIST
      ?auto_340543 - PLACE
      ?auto_340545 - PLACE
      ?auto_340540 - HOIST
      ?auto_340542 - SURFACE
      ?auto_340544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_340541 ?auto_340543 ) ( IS-CRATE ?auto_340539 ) ( not ( = ?auto_340538 ?auto_340539 ) ) ( not ( = ?auto_340537 ?auto_340538 ) ) ( not ( = ?auto_340537 ?auto_340539 ) ) ( not ( = ?auto_340545 ?auto_340543 ) ) ( HOIST-AT ?auto_340540 ?auto_340545 ) ( not ( = ?auto_340541 ?auto_340540 ) ) ( AVAILABLE ?auto_340540 ) ( SURFACE-AT ?auto_340539 ?auto_340545 ) ( ON ?auto_340539 ?auto_340542 ) ( CLEAR ?auto_340539 ) ( not ( = ?auto_340538 ?auto_340542 ) ) ( not ( = ?auto_340539 ?auto_340542 ) ) ( not ( = ?auto_340537 ?auto_340542 ) ) ( TRUCK-AT ?auto_340544 ?auto_340543 ) ( SURFACE-AT ?auto_340537 ?auto_340543 ) ( CLEAR ?auto_340537 ) ( LIFTING ?auto_340541 ?auto_340538 ) ( IS-CRATE ?auto_340538 ) ( ON ?auto_340530 ?auto_340529 ) ( ON ?auto_340531 ?auto_340530 ) ( ON ?auto_340532 ?auto_340531 ) ( ON ?auto_340533 ?auto_340532 ) ( ON ?auto_340534 ?auto_340533 ) ( ON ?auto_340535 ?auto_340534 ) ( ON ?auto_340536 ?auto_340535 ) ( ON ?auto_340537 ?auto_340536 ) ( not ( = ?auto_340529 ?auto_340530 ) ) ( not ( = ?auto_340529 ?auto_340531 ) ) ( not ( = ?auto_340529 ?auto_340532 ) ) ( not ( = ?auto_340529 ?auto_340533 ) ) ( not ( = ?auto_340529 ?auto_340534 ) ) ( not ( = ?auto_340529 ?auto_340535 ) ) ( not ( = ?auto_340529 ?auto_340536 ) ) ( not ( = ?auto_340529 ?auto_340537 ) ) ( not ( = ?auto_340529 ?auto_340538 ) ) ( not ( = ?auto_340529 ?auto_340539 ) ) ( not ( = ?auto_340529 ?auto_340542 ) ) ( not ( = ?auto_340530 ?auto_340531 ) ) ( not ( = ?auto_340530 ?auto_340532 ) ) ( not ( = ?auto_340530 ?auto_340533 ) ) ( not ( = ?auto_340530 ?auto_340534 ) ) ( not ( = ?auto_340530 ?auto_340535 ) ) ( not ( = ?auto_340530 ?auto_340536 ) ) ( not ( = ?auto_340530 ?auto_340537 ) ) ( not ( = ?auto_340530 ?auto_340538 ) ) ( not ( = ?auto_340530 ?auto_340539 ) ) ( not ( = ?auto_340530 ?auto_340542 ) ) ( not ( = ?auto_340531 ?auto_340532 ) ) ( not ( = ?auto_340531 ?auto_340533 ) ) ( not ( = ?auto_340531 ?auto_340534 ) ) ( not ( = ?auto_340531 ?auto_340535 ) ) ( not ( = ?auto_340531 ?auto_340536 ) ) ( not ( = ?auto_340531 ?auto_340537 ) ) ( not ( = ?auto_340531 ?auto_340538 ) ) ( not ( = ?auto_340531 ?auto_340539 ) ) ( not ( = ?auto_340531 ?auto_340542 ) ) ( not ( = ?auto_340532 ?auto_340533 ) ) ( not ( = ?auto_340532 ?auto_340534 ) ) ( not ( = ?auto_340532 ?auto_340535 ) ) ( not ( = ?auto_340532 ?auto_340536 ) ) ( not ( = ?auto_340532 ?auto_340537 ) ) ( not ( = ?auto_340532 ?auto_340538 ) ) ( not ( = ?auto_340532 ?auto_340539 ) ) ( not ( = ?auto_340532 ?auto_340542 ) ) ( not ( = ?auto_340533 ?auto_340534 ) ) ( not ( = ?auto_340533 ?auto_340535 ) ) ( not ( = ?auto_340533 ?auto_340536 ) ) ( not ( = ?auto_340533 ?auto_340537 ) ) ( not ( = ?auto_340533 ?auto_340538 ) ) ( not ( = ?auto_340533 ?auto_340539 ) ) ( not ( = ?auto_340533 ?auto_340542 ) ) ( not ( = ?auto_340534 ?auto_340535 ) ) ( not ( = ?auto_340534 ?auto_340536 ) ) ( not ( = ?auto_340534 ?auto_340537 ) ) ( not ( = ?auto_340534 ?auto_340538 ) ) ( not ( = ?auto_340534 ?auto_340539 ) ) ( not ( = ?auto_340534 ?auto_340542 ) ) ( not ( = ?auto_340535 ?auto_340536 ) ) ( not ( = ?auto_340535 ?auto_340537 ) ) ( not ( = ?auto_340535 ?auto_340538 ) ) ( not ( = ?auto_340535 ?auto_340539 ) ) ( not ( = ?auto_340535 ?auto_340542 ) ) ( not ( = ?auto_340536 ?auto_340537 ) ) ( not ( = ?auto_340536 ?auto_340538 ) ) ( not ( = ?auto_340536 ?auto_340539 ) ) ( not ( = ?auto_340536 ?auto_340542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_340537 ?auto_340538 ?auto_340539 )
      ( MAKE-10CRATE-VERIFY ?auto_340529 ?auto_340530 ?auto_340531 ?auto_340532 ?auto_340533 ?auto_340534 ?auto_340535 ?auto_340536 ?auto_340537 ?auto_340538 ?auto_340539 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340655 - SURFACE
      ?auto_340656 - SURFACE
      ?auto_340657 - SURFACE
      ?auto_340658 - SURFACE
      ?auto_340659 - SURFACE
      ?auto_340660 - SURFACE
      ?auto_340661 - SURFACE
      ?auto_340662 - SURFACE
      ?auto_340663 - SURFACE
      ?auto_340664 - SURFACE
      ?auto_340665 - SURFACE
    )
    :vars
    (
      ?auto_340670 - HOIST
      ?auto_340671 - PLACE
      ?auto_340669 - PLACE
      ?auto_340666 - HOIST
      ?auto_340668 - SURFACE
      ?auto_340667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_340670 ?auto_340671 ) ( IS-CRATE ?auto_340665 ) ( not ( = ?auto_340664 ?auto_340665 ) ) ( not ( = ?auto_340663 ?auto_340664 ) ) ( not ( = ?auto_340663 ?auto_340665 ) ) ( not ( = ?auto_340669 ?auto_340671 ) ) ( HOIST-AT ?auto_340666 ?auto_340669 ) ( not ( = ?auto_340670 ?auto_340666 ) ) ( AVAILABLE ?auto_340666 ) ( SURFACE-AT ?auto_340665 ?auto_340669 ) ( ON ?auto_340665 ?auto_340668 ) ( CLEAR ?auto_340665 ) ( not ( = ?auto_340664 ?auto_340668 ) ) ( not ( = ?auto_340665 ?auto_340668 ) ) ( not ( = ?auto_340663 ?auto_340668 ) ) ( TRUCK-AT ?auto_340667 ?auto_340671 ) ( SURFACE-AT ?auto_340663 ?auto_340671 ) ( CLEAR ?auto_340663 ) ( IS-CRATE ?auto_340664 ) ( AVAILABLE ?auto_340670 ) ( IN ?auto_340664 ?auto_340667 ) ( ON ?auto_340656 ?auto_340655 ) ( ON ?auto_340657 ?auto_340656 ) ( ON ?auto_340658 ?auto_340657 ) ( ON ?auto_340659 ?auto_340658 ) ( ON ?auto_340660 ?auto_340659 ) ( ON ?auto_340661 ?auto_340660 ) ( ON ?auto_340662 ?auto_340661 ) ( ON ?auto_340663 ?auto_340662 ) ( not ( = ?auto_340655 ?auto_340656 ) ) ( not ( = ?auto_340655 ?auto_340657 ) ) ( not ( = ?auto_340655 ?auto_340658 ) ) ( not ( = ?auto_340655 ?auto_340659 ) ) ( not ( = ?auto_340655 ?auto_340660 ) ) ( not ( = ?auto_340655 ?auto_340661 ) ) ( not ( = ?auto_340655 ?auto_340662 ) ) ( not ( = ?auto_340655 ?auto_340663 ) ) ( not ( = ?auto_340655 ?auto_340664 ) ) ( not ( = ?auto_340655 ?auto_340665 ) ) ( not ( = ?auto_340655 ?auto_340668 ) ) ( not ( = ?auto_340656 ?auto_340657 ) ) ( not ( = ?auto_340656 ?auto_340658 ) ) ( not ( = ?auto_340656 ?auto_340659 ) ) ( not ( = ?auto_340656 ?auto_340660 ) ) ( not ( = ?auto_340656 ?auto_340661 ) ) ( not ( = ?auto_340656 ?auto_340662 ) ) ( not ( = ?auto_340656 ?auto_340663 ) ) ( not ( = ?auto_340656 ?auto_340664 ) ) ( not ( = ?auto_340656 ?auto_340665 ) ) ( not ( = ?auto_340656 ?auto_340668 ) ) ( not ( = ?auto_340657 ?auto_340658 ) ) ( not ( = ?auto_340657 ?auto_340659 ) ) ( not ( = ?auto_340657 ?auto_340660 ) ) ( not ( = ?auto_340657 ?auto_340661 ) ) ( not ( = ?auto_340657 ?auto_340662 ) ) ( not ( = ?auto_340657 ?auto_340663 ) ) ( not ( = ?auto_340657 ?auto_340664 ) ) ( not ( = ?auto_340657 ?auto_340665 ) ) ( not ( = ?auto_340657 ?auto_340668 ) ) ( not ( = ?auto_340658 ?auto_340659 ) ) ( not ( = ?auto_340658 ?auto_340660 ) ) ( not ( = ?auto_340658 ?auto_340661 ) ) ( not ( = ?auto_340658 ?auto_340662 ) ) ( not ( = ?auto_340658 ?auto_340663 ) ) ( not ( = ?auto_340658 ?auto_340664 ) ) ( not ( = ?auto_340658 ?auto_340665 ) ) ( not ( = ?auto_340658 ?auto_340668 ) ) ( not ( = ?auto_340659 ?auto_340660 ) ) ( not ( = ?auto_340659 ?auto_340661 ) ) ( not ( = ?auto_340659 ?auto_340662 ) ) ( not ( = ?auto_340659 ?auto_340663 ) ) ( not ( = ?auto_340659 ?auto_340664 ) ) ( not ( = ?auto_340659 ?auto_340665 ) ) ( not ( = ?auto_340659 ?auto_340668 ) ) ( not ( = ?auto_340660 ?auto_340661 ) ) ( not ( = ?auto_340660 ?auto_340662 ) ) ( not ( = ?auto_340660 ?auto_340663 ) ) ( not ( = ?auto_340660 ?auto_340664 ) ) ( not ( = ?auto_340660 ?auto_340665 ) ) ( not ( = ?auto_340660 ?auto_340668 ) ) ( not ( = ?auto_340661 ?auto_340662 ) ) ( not ( = ?auto_340661 ?auto_340663 ) ) ( not ( = ?auto_340661 ?auto_340664 ) ) ( not ( = ?auto_340661 ?auto_340665 ) ) ( not ( = ?auto_340661 ?auto_340668 ) ) ( not ( = ?auto_340662 ?auto_340663 ) ) ( not ( = ?auto_340662 ?auto_340664 ) ) ( not ( = ?auto_340662 ?auto_340665 ) ) ( not ( = ?auto_340662 ?auto_340668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_340663 ?auto_340664 ?auto_340665 )
      ( MAKE-10CRATE-VERIFY ?auto_340655 ?auto_340656 ?auto_340657 ?auto_340658 ?auto_340659 ?auto_340660 ?auto_340661 ?auto_340662 ?auto_340663 ?auto_340664 ?auto_340665 ) )
  )

)

