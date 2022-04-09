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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9960 - SURFACE
      ?auto_9961 - SURFACE
    )
    :vars
    (
      ?auto_9962 - HOIST
      ?auto_9963 - PLACE
      ?auto_9965 - PLACE
      ?auto_9966 - HOIST
      ?auto_9967 - SURFACE
      ?auto_9964 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9962 ?auto_9963 ) ( SURFACE-AT ?auto_9960 ?auto_9963 ) ( CLEAR ?auto_9960 ) ( IS-CRATE ?auto_9961 ) ( AVAILABLE ?auto_9962 ) ( not ( = ?auto_9965 ?auto_9963 ) ) ( HOIST-AT ?auto_9966 ?auto_9965 ) ( AVAILABLE ?auto_9966 ) ( SURFACE-AT ?auto_9961 ?auto_9965 ) ( ON ?auto_9961 ?auto_9967 ) ( CLEAR ?auto_9961 ) ( TRUCK-AT ?auto_9964 ?auto_9963 ) ( not ( = ?auto_9960 ?auto_9961 ) ) ( not ( = ?auto_9960 ?auto_9967 ) ) ( not ( = ?auto_9961 ?auto_9967 ) ) ( not ( = ?auto_9962 ?auto_9966 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9964 ?auto_9963 ?auto_9965 )
      ( !LIFT ?auto_9966 ?auto_9961 ?auto_9967 ?auto_9965 )
      ( !LOAD ?auto_9966 ?auto_9961 ?auto_9964 ?auto_9965 )
      ( !DRIVE ?auto_9964 ?auto_9965 ?auto_9963 )
      ( !UNLOAD ?auto_9962 ?auto_9961 ?auto_9964 ?auto_9963 )
      ( !DROP ?auto_9962 ?auto_9961 ?auto_9960 ?auto_9963 )
      ( MAKE-1CRATE-VERIFY ?auto_9960 ?auto_9961 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9970 - SURFACE
      ?auto_9971 - SURFACE
    )
    :vars
    (
      ?auto_9972 - HOIST
      ?auto_9973 - PLACE
      ?auto_9975 - PLACE
      ?auto_9976 - HOIST
      ?auto_9977 - SURFACE
      ?auto_9974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9972 ?auto_9973 ) ( SURFACE-AT ?auto_9970 ?auto_9973 ) ( CLEAR ?auto_9970 ) ( IS-CRATE ?auto_9971 ) ( AVAILABLE ?auto_9972 ) ( not ( = ?auto_9975 ?auto_9973 ) ) ( HOIST-AT ?auto_9976 ?auto_9975 ) ( AVAILABLE ?auto_9976 ) ( SURFACE-AT ?auto_9971 ?auto_9975 ) ( ON ?auto_9971 ?auto_9977 ) ( CLEAR ?auto_9971 ) ( TRUCK-AT ?auto_9974 ?auto_9973 ) ( not ( = ?auto_9970 ?auto_9971 ) ) ( not ( = ?auto_9970 ?auto_9977 ) ) ( not ( = ?auto_9971 ?auto_9977 ) ) ( not ( = ?auto_9972 ?auto_9976 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9974 ?auto_9973 ?auto_9975 )
      ( !LIFT ?auto_9976 ?auto_9971 ?auto_9977 ?auto_9975 )
      ( !LOAD ?auto_9976 ?auto_9971 ?auto_9974 ?auto_9975 )
      ( !DRIVE ?auto_9974 ?auto_9975 ?auto_9973 )
      ( !UNLOAD ?auto_9972 ?auto_9971 ?auto_9974 ?auto_9973 )
      ( !DROP ?auto_9972 ?auto_9971 ?auto_9970 ?auto_9973 )
      ( MAKE-1CRATE-VERIFY ?auto_9970 ?auto_9971 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9981 - SURFACE
      ?auto_9982 - SURFACE
      ?auto_9983 - SURFACE
    )
    :vars
    (
      ?auto_9986 - HOIST
      ?auto_9987 - PLACE
      ?auto_9988 - PLACE
      ?auto_9984 - HOIST
      ?auto_9985 - SURFACE
      ?auto_9992 - PLACE
      ?auto_9990 - HOIST
      ?auto_9991 - SURFACE
      ?auto_9989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9986 ?auto_9987 ) ( IS-CRATE ?auto_9983 ) ( not ( = ?auto_9988 ?auto_9987 ) ) ( HOIST-AT ?auto_9984 ?auto_9988 ) ( AVAILABLE ?auto_9984 ) ( SURFACE-AT ?auto_9983 ?auto_9988 ) ( ON ?auto_9983 ?auto_9985 ) ( CLEAR ?auto_9983 ) ( not ( = ?auto_9982 ?auto_9983 ) ) ( not ( = ?auto_9982 ?auto_9985 ) ) ( not ( = ?auto_9983 ?auto_9985 ) ) ( not ( = ?auto_9986 ?auto_9984 ) ) ( SURFACE-AT ?auto_9981 ?auto_9987 ) ( CLEAR ?auto_9981 ) ( IS-CRATE ?auto_9982 ) ( AVAILABLE ?auto_9986 ) ( not ( = ?auto_9992 ?auto_9987 ) ) ( HOIST-AT ?auto_9990 ?auto_9992 ) ( AVAILABLE ?auto_9990 ) ( SURFACE-AT ?auto_9982 ?auto_9992 ) ( ON ?auto_9982 ?auto_9991 ) ( CLEAR ?auto_9982 ) ( TRUCK-AT ?auto_9989 ?auto_9987 ) ( not ( = ?auto_9981 ?auto_9982 ) ) ( not ( = ?auto_9981 ?auto_9991 ) ) ( not ( = ?auto_9982 ?auto_9991 ) ) ( not ( = ?auto_9986 ?auto_9990 ) ) ( not ( = ?auto_9981 ?auto_9983 ) ) ( not ( = ?auto_9981 ?auto_9985 ) ) ( not ( = ?auto_9983 ?auto_9991 ) ) ( not ( = ?auto_9988 ?auto_9992 ) ) ( not ( = ?auto_9984 ?auto_9990 ) ) ( not ( = ?auto_9985 ?auto_9991 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9981 ?auto_9982 )
      ( MAKE-1CRATE ?auto_9982 ?auto_9983 )
      ( MAKE-2CRATE-VERIFY ?auto_9981 ?auto_9982 ?auto_9983 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9995 - SURFACE
      ?auto_9996 - SURFACE
    )
    :vars
    (
      ?auto_9997 - HOIST
      ?auto_9998 - PLACE
      ?auto_10000 - PLACE
      ?auto_10001 - HOIST
      ?auto_10002 - SURFACE
      ?auto_9999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9997 ?auto_9998 ) ( SURFACE-AT ?auto_9995 ?auto_9998 ) ( CLEAR ?auto_9995 ) ( IS-CRATE ?auto_9996 ) ( AVAILABLE ?auto_9997 ) ( not ( = ?auto_10000 ?auto_9998 ) ) ( HOIST-AT ?auto_10001 ?auto_10000 ) ( AVAILABLE ?auto_10001 ) ( SURFACE-AT ?auto_9996 ?auto_10000 ) ( ON ?auto_9996 ?auto_10002 ) ( CLEAR ?auto_9996 ) ( TRUCK-AT ?auto_9999 ?auto_9998 ) ( not ( = ?auto_9995 ?auto_9996 ) ) ( not ( = ?auto_9995 ?auto_10002 ) ) ( not ( = ?auto_9996 ?auto_10002 ) ) ( not ( = ?auto_9997 ?auto_10001 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9999 ?auto_9998 ?auto_10000 )
      ( !LIFT ?auto_10001 ?auto_9996 ?auto_10002 ?auto_10000 )
      ( !LOAD ?auto_10001 ?auto_9996 ?auto_9999 ?auto_10000 )
      ( !DRIVE ?auto_9999 ?auto_10000 ?auto_9998 )
      ( !UNLOAD ?auto_9997 ?auto_9996 ?auto_9999 ?auto_9998 )
      ( !DROP ?auto_9997 ?auto_9996 ?auto_9995 ?auto_9998 )
      ( MAKE-1CRATE-VERIFY ?auto_9995 ?auto_9996 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10007 - SURFACE
      ?auto_10008 - SURFACE
      ?auto_10009 - SURFACE
      ?auto_10010 - SURFACE
    )
    :vars
    (
      ?auto_10016 - HOIST
      ?auto_10011 - PLACE
      ?auto_10014 - PLACE
      ?auto_10012 - HOIST
      ?auto_10015 - SURFACE
      ?auto_10018 - PLACE
      ?auto_10020 - HOIST
      ?auto_10019 - SURFACE
      ?auto_10017 - PLACE
      ?auto_10022 - HOIST
      ?auto_10021 - SURFACE
      ?auto_10013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10016 ?auto_10011 ) ( IS-CRATE ?auto_10010 ) ( not ( = ?auto_10014 ?auto_10011 ) ) ( HOIST-AT ?auto_10012 ?auto_10014 ) ( AVAILABLE ?auto_10012 ) ( SURFACE-AT ?auto_10010 ?auto_10014 ) ( ON ?auto_10010 ?auto_10015 ) ( CLEAR ?auto_10010 ) ( not ( = ?auto_10009 ?auto_10010 ) ) ( not ( = ?auto_10009 ?auto_10015 ) ) ( not ( = ?auto_10010 ?auto_10015 ) ) ( not ( = ?auto_10016 ?auto_10012 ) ) ( IS-CRATE ?auto_10009 ) ( not ( = ?auto_10018 ?auto_10011 ) ) ( HOIST-AT ?auto_10020 ?auto_10018 ) ( AVAILABLE ?auto_10020 ) ( SURFACE-AT ?auto_10009 ?auto_10018 ) ( ON ?auto_10009 ?auto_10019 ) ( CLEAR ?auto_10009 ) ( not ( = ?auto_10008 ?auto_10009 ) ) ( not ( = ?auto_10008 ?auto_10019 ) ) ( not ( = ?auto_10009 ?auto_10019 ) ) ( not ( = ?auto_10016 ?auto_10020 ) ) ( SURFACE-AT ?auto_10007 ?auto_10011 ) ( CLEAR ?auto_10007 ) ( IS-CRATE ?auto_10008 ) ( AVAILABLE ?auto_10016 ) ( not ( = ?auto_10017 ?auto_10011 ) ) ( HOIST-AT ?auto_10022 ?auto_10017 ) ( AVAILABLE ?auto_10022 ) ( SURFACE-AT ?auto_10008 ?auto_10017 ) ( ON ?auto_10008 ?auto_10021 ) ( CLEAR ?auto_10008 ) ( TRUCK-AT ?auto_10013 ?auto_10011 ) ( not ( = ?auto_10007 ?auto_10008 ) ) ( not ( = ?auto_10007 ?auto_10021 ) ) ( not ( = ?auto_10008 ?auto_10021 ) ) ( not ( = ?auto_10016 ?auto_10022 ) ) ( not ( = ?auto_10007 ?auto_10009 ) ) ( not ( = ?auto_10007 ?auto_10019 ) ) ( not ( = ?auto_10009 ?auto_10021 ) ) ( not ( = ?auto_10018 ?auto_10017 ) ) ( not ( = ?auto_10020 ?auto_10022 ) ) ( not ( = ?auto_10019 ?auto_10021 ) ) ( not ( = ?auto_10007 ?auto_10010 ) ) ( not ( = ?auto_10007 ?auto_10015 ) ) ( not ( = ?auto_10008 ?auto_10010 ) ) ( not ( = ?auto_10008 ?auto_10015 ) ) ( not ( = ?auto_10010 ?auto_10019 ) ) ( not ( = ?auto_10010 ?auto_10021 ) ) ( not ( = ?auto_10014 ?auto_10018 ) ) ( not ( = ?auto_10014 ?auto_10017 ) ) ( not ( = ?auto_10012 ?auto_10020 ) ) ( not ( = ?auto_10012 ?auto_10022 ) ) ( not ( = ?auto_10015 ?auto_10019 ) ) ( not ( = ?auto_10015 ?auto_10021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10007 ?auto_10008 ?auto_10009 )
      ( MAKE-1CRATE ?auto_10009 ?auto_10010 )
      ( MAKE-3CRATE-VERIFY ?auto_10007 ?auto_10008 ?auto_10009 ?auto_10010 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10025 - SURFACE
      ?auto_10026 - SURFACE
    )
    :vars
    (
      ?auto_10027 - HOIST
      ?auto_10028 - PLACE
      ?auto_10030 - PLACE
      ?auto_10031 - HOIST
      ?auto_10032 - SURFACE
      ?auto_10029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10027 ?auto_10028 ) ( SURFACE-AT ?auto_10025 ?auto_10028 ) ( CLEAR ?auto_10025 ) ( IS-CRATE ?auto_10026 ) ( AVAILABLE ?auto_10027 ) ( not ( = ?auto_10030 ?auto_10028 ) ) ( HOIST-AT ?auto_10031 ?auto_10030 ) ( AVAILABLE ?auto_10031 ) ( SURFACE-AT ?auto_10026 ?auto_10030 ) ( ON ?auto_10026 ?auto_10032 ) ( CLEAR ?auto_10026 ) ( TRUCK-AT ?auto_10029 ?auto_10028 ) ( not ( = ?auto_10025 ?auto_10026 ) ) ( not ( = ?auto_10025 ?auto_10032 ) ) ( not ( = ?auto_10026 ?auto_10032 ) ) ( not ( = ?auto_10027 ?auto_10031 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10029 ?auto_10028 ?auto_10030 )
      ( !LIFT ?auto_10031 ?auto_10026 ?auto_10032 ?auto_10030 )
      ( !LOAD ?auto_10031 ?auto_10026 ?auto_10029 ?auto_10030 )
      ( !DRIVE ?auto_10029 ?auto_10030 ?auto_10028 )
      ( !UNLOAD ?auto_10027 ?auto_10026 ?auto_10029 ?auto_10028 )
      ( !DROP ?auto_10027 ?auto_10026 ?auto_10025 ?auto_10028 )
      ( MAKE-1CRATE-VERIFY ?auto_10025 ?auto_10026 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10038 - SURFACE
      ?auto_10039 - SURFACE
      ?auto_10040 - SURFACE
      ?auto_10041 - SURFACE
      ?auto_10042 - SURFACE
    )
    :vars
    (
      ?auto_10046 - HOIST
      ?auto_10045 - PLACE
      ?auto_10048 - PLACE
      ?auto_10043 - HOIST
      ?auto_10044 - SURFACE
      ?auto_10055 - PLACE
      ?auto_10051 - HOIST
      ?auto_10049 - SURFACE
      ?auto_10050 - PLACE
      ?auto_10054 - HOIST
      ?auto_10053 - SURFACE
      ?auto_10052 - SURFACE
      ?auto_10047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10046 ?auto_10045 ) ( IS-CRATE ?auto_10042 ) ( not ( = ?auto_10048 ?auto_10045 ) ) ( HOIST-AT ?auto_10043 ?auto_10048 ) ( SURFACE-AT ?auto_10042 ?auto_10048 ) ( ON ?auto_10042 ?auto_10044 ) ( CLEAR ?auto_10042 ) ( not ( = ?auto_10041 ?auto_10042 ) ) ( not ( = ?auto_10041 ?auto_10044 ) ) ( not ( = ?auto_10042 ?auto_10044 ) ) ( not ( = ?auto_10046 ?auto_10043 ) ) ( IS-CRATE ?auto_10041 ) ( not ( = ?auto_10055 ?auto_10045 ) ) ( HOIST-AT ?auto_10051 ?auto_10055 ) ( AVAILABLE ?auto_10051 ) ( SURFACE-AT ?auto_10041 ?auto_10055 ) ( ON ?auto_10041 ?auto_10049 ) ( CLEAR ?auto_10041 ) ( not ( = ?auto_10040 ?auto_10041 ) ) ( not ( = ?auto_10040 ?auto_10049 ) ) ( not ( = ?auto_10041 ?auto_10049 ) ) ( not ( = ?auto_10046 ?auto_10051 ) ) ( IS-CRATE ?auto_10040 ) ( not ( = ?auto_10050 ?auto_10045 ) ) ( HOIST-AT ?auto_10054 ?auto_10050 ) ( AVAILABLE ?auto_10054 ) ( SURFACE-AT ?auto_10040 ?auto_10050 ) ( ON ?auto_10040 ?auto_10053 ) ( CLEAR ?auto_10040 ) ( not ( = ?auto_10039 ?auto_10040 ) ) ( not ( = ?auto_10039 ?auto_10053 ) ) ( not ( = ?auto_10040 ?auto_10053 ) ) ( not ( = ?auto_10046 ?auto_10054 ) ) ( SURFACE-AT ?auto_10038 ?auto_10045 ) ( CLEAR ?auto_10038 ) ( IS-CRATE ?auto_10039 ) ( AVAILABLE ?auto_10046 ) ( AVAILABLE ?auto_10043 ) ( SURFACE-AT ?auto_10039 ?auto_10048 ) ( ON ?auto_10039 ?auto_10052 ) ( CLEAR ?auto_10039 ) ( TRUCK-AT ?auto_10047 ?auto_10045 ) ( not ( = ?auto_10038 ?auto_10039 ) ) ( not ( = ?auto_10038 ?auto_10052 ) ) ( not ( = ?auto_10039 ?auto_10052 ) ) ( not ( = ?auto_10038 ?auto_10040 ) ) ( not ( = ?auto_10038 ?auto_10053 ) ) ( not ( = ?auto_10040 ?auto_10052 ) ) ( not ( = ?auto_10050 ?auto_10048 ) ) ( not ( = ?auto_10054 ?auto_10043 ) ) ( not ( = ?auto_10053 ?auto_10052 ) ) ( not ( = ?auto_10038 ?auto_10041 ) ) ( not ( = ?auto_10038 ?auto_10049 ) ) ( not ( = ?auto_10039 ?auto_10041 ) ) ( not ( = ?auto_10039 ?auto_10049 ) ) ( not ( = ?auto_10041 ?auto_10053 ) ) ( not ( = ?auto_10041 ?auto_10052 ) ) ( not ( = ?auto_10055 ?auto_10050 ) ) ( not ( = ?auto_10055 ?auto_10048 ) ) ( not ( = ?auto_10051 ?auto_10054 ) ) ( not ( = ?auto_10051 ?auto_10043 ) ) ( not ( = ?auto_10049 ?auto_10053 ) ) ( not ( = ?auto_10049 ?auto_10052 ) ) ( not ( = ?auto_10038 ?auto_10042 ) ) ( not ( = ?auto_10038 ?auto_10044 ) ) ( not ( = ?auto_10039 ?auto_10042 ) ) ( not ( = ?auto_10039 ?auto_10044 ) ) ( not ( = ?auto_10040 ?auto_10042 ) ) ( not ( = ?auto_10040 ?auto_10044 ) ) ( not ( = ?auto_10042 ?auto_10049 ) ) ( not ( = ?auto_10042 ?auto_10053 ) ) ( not ( = ?auto_10042 ?auto_10052 ) ) ( not ( = ?auto_10044 ?auto_10049 ) ) ( not ( = ?auto_10044 ?auto_10053 ) ) ( not ( = ?auto_10044 ?auto_10052 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_10038 ?auto_10039 ?auto_10040 ?auto_10041 )
      ( MAKE-1CRATE ?auto_10041 ?auto_10042 )
      ( MAKE-4CRATE-VERIFY ?auto_10038 ?auto_10039 ?auto_10040 ?auto_10041 ?auto_10042 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10058 - SURFACE
      ?auto_10059 - SURFACE
    )
    :vars
    (
      ?auto_10060 - HOIST
      ?auto_10061 - PLACE
      ?auto_10063 - PLACE
      ?auto_10064 - HOIST
      ?auto_10065 - SURFACE
      ?auto_10062 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10060 ?auto_10061 ) ( SURFACE-AT ?auto_10058 ?auto_10061 ) ( CLEAR ?auto_10058 ) ( IS-CRATE ?auto_10059 ) ( AVAILABLE ?auto_10060 ) ( not ( = ?auto_10063 ?auto_10061 ) ) ( HOIST-AT ?auto_10064 ?auto_10063 ) ( AVAILABLE ?auto_10064 ) ( SURFACE-AT ?auto_10059 ?auto_10063 ) ( ON ?auto_10059 ?auto_10065 ) ( CLEAR ?auto_10059 ) ( TRUCK-AT ?auto_10062 ?auto_10061 ) ( not ( = ?auto_10058 ?auto_10059 ) ) ( not ( = ?auto_10058 ?auto_10065 ) ) ( not ( = ?auto_10059 ?auto_10065 ) ) ( not ( = ?auto_10060 ?auto_10064 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10062 ?auto_10061 ?auto_10063 )
      ( !LIFT ?auto_10064 ?auto_10059 ?auto_10065 ?auto_10063 )
      ( !LOAD ?auto_10064 ?auto_10059 ?auto_10062 ?auto_10063 )
      ( !DRIVE ?auto_10062 ?auto_10063 ?auto_10061 )
      ( !UNLOAD ?auto_10060 ?auto_10059 ?auto_10062 ?auto_10061 )
      ( !DROP ?auto_10060 ?auto_10059 ?auto_10058 ?auto_10061 )
      ( MAKE-1CRATE-VERIFY ?auto_10058 ?auto_10059 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_10072 - SURFACE
      ?auto_10073 - SURFACE
      ?auto_10074 - SURFACE
      ?auto_10075 - SURFACE
      ?auto_10076 - SURFACE
      ?auto_10077 - SURFACE
    )
    :vars
    (
      ?auto_10082 - HOIST
      ?auto_10083 - PLACE
      ?auto_10081 - PLACE
      ?auto_10078 - HOIST
      ?auto_10079 - SURFACE
      ?auto_10091 - PLACE
      ?auto_10093 - HOIST
      ?auto_10086 - SURFACE
      ?auto_10085 - PLACE
      ?auto_10090 - HOIST
      ?auto_10089 - SURFACE
      ?auto_10092 - PLACE
      ?auto_10088 - HOIST
      ?auto_10087 - SURFACE
      ?auto_10084 - SURFACE
      ?auto_10080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10082 ?auto_10083 ) ( IS-CRATE ?auto_10077 ) ( not ( = ?auto_10081 ?auto_10083 ) ) ( HOIST-AT ?auto_10078 ?auto_10081 ) ( AVAILABLE ?auto_10078 ) ( SURFACE-AT ?auto_10077 ?auto_10081 ) ( ON ?auto_10077 ?auto_10079 ) ( CLEAR ?auto_10077 ) ( not ( = ?auto_10076 ?auto_10077 ) ) ( not ( = ?auto_10076 ?auto_10079 ) ) ( not ( = ?auto_10077 ?auto_10079 ) ) ( not ( = ?auto_10082 ?auto_10078 ) ) ( IS-CRATE ?auto_10076 ) ( not ( = ?auto_10091 ?auto_10083 ) ) ( HOIST-AT ?auto_10093 ?auto_10091 ) ( SURFACE-AT ?auto_10076 ?auto_10091 ) ( ON ?auto_10076 ?auto_10086 ) ( CLEAR ?auto_10076 ) ( not ( = ?auto_10075 ?auto_10076 ) ) ( not ( = ?auto_10075 ?auto_10086 ) ) ( not ( = ?auto_10076 ?auto_10086 ) ) ( not ( = ?auto_10082 ?auto_10093 ) ) ( IS-CRATE ?auto_10075 ) ( not ( = ?auto_10085 ?auto_10083 ) ) ( HOIST-AT ?auto_10090 ?auto_10085 ) ( AVAILABLE ?auto_10090 ) ( SURFACE-AT ?auto_10075 ?auto_10085 ) ( ON ?auto_10075 ?auto_10089 ) ( CLEAR ?auto_10075 ) ( not ( = ?auto_10074 ?auto_10075 ) ) ( not ( = ?auto_10074 ?auto_10089 ) ) ( not ( = ?auto_10075 ?auto_10089 ) ) ( not ( = ?auto_10082 ?auto_10090 ) ) ( IS-CRATE ?auto_10074 ) ( not ( = ?auto_10092 ?auto_10083 ) ) ( HOIST-AT ?auto_10088 ?auto_10092 ) ( AVAILABLE ?auto_10088 ) ( SURFACE-AT ?auto_10074 ?auto_10092 ) ( ON ?auto_10074 ?auto_10087 ) ( CLEAR ?auto_10074 ) ( not ( = ?auto_10073 ?auto_10074 ) ) ( not ( = ?auto_10073 ?auto_10087 ) ) ( not ( = ?auto_10074 ?auto_10087 ) ) ( not ( = ?auto_10082 ?auto_10088 ) ) ( SURFACE-AT ?auto_10072 ?auto_10083 ) ( CLEAR ?auto_10072 ) ( IS-CRATE ?auto_10073 ) ( AVAILABLE ?auto_10082 ) ( AVAILABLE ?auto_10093 ) ( SURFACE-AT ?auto_10073 ?auto_10091 ) ( ON ?auto_10073 ?auto_10084 ) ( CLEAR ?auto_10073 ) ( TRUCK-AT ?auto_10080 ?auto_10083 ) ( not ( = ?auto_10072 ?auto_10073 ) ) ( not ( = ?auto_10072 ?auto_10084 ) ) ( not ( = ?auto_10073 ?auto_10084 ) ) ( not ( = ?auto_10072 ?auto_10074 ) ) ( not ( = ?auto_10072 ?auto_10087 ) ) ( not ( = ?auto_10074 ?auto_10084 ) ) ( not ( = ?auto_10092 ?auto_10091 ) ) ( not ( = ?auto_10088 ?auto_10093 ) ) ( not ( = ?auto_10087 ?auto_10084 ) ) ( not ( = ?auto_10072 ?auto_10075 ) ) ( not ( = ?auto_10072 ?auto_10089 ) ) ( not ( = ?auto_10073 ?auto_10075 ) ) ( not ( = ?auto_10073 ?auto_10089 ) ) ( not ( = ?auto_10075 ?auto_10087 ) ) ( not ( = ?auto_10075 ?auto_10084 ) ) ( not ( = ?auto_10085 ?auto_10092 ) ) ( not ( = ?auto_10085 ?auto_10091 ) ) ( not ( = ?auto_10090 ?auto_10088 ) ) ( not ( = ?auto_10090 ?auto_10093 ) ) ( not ( = ?auto_10089 ?auto_10087 ) ) ( not ( = ?auto_10089 ?auto_10084 ) ) ( not ( = ?auto_10072 ?auto_10076 ) ) ( not ( = ?auto_10072 ?auto_10086 ) ) ( not ( = ?auto_10073 ?auto_10076 ) ) ( not ( = ?auto_10073 ?auto_10086 ) ) ( not ( = ?auto_10074 ?auto_10076 ) ) ( not ( = ?auto_10074 ?auto_10086 ) ) ( not ( = ?auto_10076 ?auto_10089 ) ) ( not ( = ?auto_10076 ?auto_10087 ) ) ( not ( = ?auto_10076 ?auto_10084 ) ) ( not ( = ?auto_10086 ?auto_10089 ) ) ( not ( = ?auto_10086 ?auto_10087 ) ) ( not ( = ?auto_10086 ?auto_10084 ) ) ( not ( = ?auto_10072 ?auto_10077 ) ) ( not ( = ?auto_10072 ?auto_10079 ) ) ( not ( = ?auto_10073 ?auto_10077 ) ) ( not ( = ?auto_10073 ?auto_10079 ) ) ( not ( = ?auto_10074 ?auto_10077 ) ) ( not ( = ?auto_10074 ?auto_10079 ) ) ( not ( = ?auto_10075 ?auto_10077 ) ) ( not ( = ?auto_10075 ?auto_10079 ) ) ( not ( = ?auto_10077 ?auto_10086 ) ) ( not ( = ?auto_10077 ?auto_10089 ) ) ( not ( = ?auto_10077 ?auto_10087 ) ) ( not ( = ?auto_10077 ?auto_10084 ) ) ( not ( = ?auto_10081 ?auto_10091 ) ) ( not ( = ?auto_10081 ?auto_10085 ) ) ( not ( = ?auto_10081 ?auto_10092 ) ) ( not ( = ?auto_10078 ?auto_10093 ) ) ( not ( = ?auto_10078 ?auto_10090 ) ) ( not ( = ?auto_10078 ?auto_10088 ) ) ( not ( = ?auto_10079 ?auto_10086 ) ) ( not ( = ?auto_10079 ?auto_10089 ) ) ( not ( = ?auto_10079 ?auto_10087 ) ) ( not ( = ?auto_10079 ?auto_10084 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_10072 ?auto_10073 ?auto_10074 ?auto_10075 ?auto_10076 )
      ( MAKE-1CRATE ?auto_10076 ?auto_10077 )
      ( MAKE-5CRATE-VERIFY ?auto_10072 ?auto_10073 ?auto_10074 ?auto_10075 ?auto_10076 ?auto_10077 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10096 - SURFACE
      ?auto_10097 - SURFACE
    )
    :vars
    (
      ?auto_10098 - HOIST
      ?auto_10099 - PLACE
      ?auto_10101 - PLACE
      ?auto_10102 - HOIST
      ?auto_10103 - SURFACE
      ?auto_10100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10098 ?auto_10099 ) ( SURFACE-AT ?auto_10096 ?auto_10099 ) ( CLEAR ?auto_10096 ) ( IS-CRATE ?auto_10097 ) ( AVAILABLE ?auto_10098 ) ( not ( = ?auto_10101 ?auto_10099 ) ) ( HOIST-AT ?auto_10102 ?auto_10101 ) ( AVAILABLE ?auto_10102 ) ( SURFACE-AT ?auto_10097 ?auto_10101 ) ( ON ?auto_10097 ?auto_10103 ) ( CLEAR ?auto_10097 ) ( TRUCK-AT ?auto_10100 ?auto_10099 ) ( not ( = ?auto_10096 ?auto_10097 ) ) ( not ( = ?auto_10096 ?auto_10103 ) ) ( not ( = ?auto_10097 ?auto_10103 ) ) ( not ( = ?auto_10098 ?auto_10102 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10100 ?auto_10099 ?auto_10101 )
      ( !LIFT ?auto_10102 ?auto_10097 ?auto_10103 ?auto_10101 )
      ( !LOAD ?auto_10102 ?auto_10097 ?auto_10100 ?auto_10101 )
      ( !DRIVE ?auto_10100 ?auto_10101 ?auto_10099 )
      ( !UNLOAD ?auto_10098 ?auto_10097 ?auto_10100 ?auto_10099 )
      ( !DROP ?auto_10098 ?auto_10097 ?auto_10096 ?auto_10099 )
      ( MAKE-1CRATE-VERIFY ?auto_10096 ?auto_10097 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_10111 - SURFACE
      ?auto_10112 - SURFACE
      ?auto_10113 - SURFACE
      ?auto_10114 - SURFACE
      ?auto_10115 - SURFACE
      ?auto_10116 - SURFACE
      ?auto_10117 - SURFACE
    )
    :vars
    (
      ?auto_10122 - HOIST
      ?auto_10120 - PLACE
      ?auto_10121 - PLACE
      ?auto_10119 - HOIST
      ?auto_10118 - SURFACE
      ?auto_10129 - PLACE
      ?auto_10125 - HOIST
      ?auto_10124 - SURFACE
      ?auto_10130 - PLACE
      ?auto_10133 - HOIST
      ?auto_10131 - SURFACE
      ?auto_10127 - PLACE
      ?auto_10136 - HOIST
      ?auto_10126 - SURFACE
      ?auto_10134 - PLACE
      ?auto_10135 - HOIST
      ?auto_10132 - SURFACE
      ?auto_10128 - SURFACE
      ?auto_10123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10122 ?auto_10120 ) ( IS-CRATE ?auto_10117 ) ( not ( = ?auto_10121 ?auto_10120 ) ) ( HOIST-AT ?auto_10119 ?auto_10121 ) ( AVAILABLE ?auto_10119 ) ( SURFACE-AT ?auto_10117 ?auto_10121 ) ( ON ?auto_10117 ?auto_10118 ) ( CLEAR ?auto_10117 ) ( not ( = ?auto_10116 ?auto_10117 ) ) ( not ( = ?auto_10116 ?auto_10118 ) ) ( not ( = ?auto_10117 ?auto_10118 ) ) ( not ( = ?auto_10122 ?auto_10119 ) ) ( IS-CRATE ?auto_10116 ) ( not ( = ?auto_10129 ?auto_10120 ) ) ( HOIST-AT ?auto_10125 ?auto_10129 ) ( AVAILABLE ?auto_10125 ) ( SURFACE-AT ?auto_10116 ?auto_10129 ) ( ON ?auto_10116 ?auto_10124 ) ( CLEAR ?auto_10116 ) ( not ( = ?auto_10115 ?auto_10116 ) ) ( not ( = ?auto_10115 ?auto_10124 ) ) ( not ( = ?auto_10116 ?auto_10124 ) ) ( not ( = ?auto_10122 ?auto_10125 ) ) ( IS-CRATE ?auto_10115 ) ( not ( = ?auto_10130 ?auto_10120 ) ) ( HOIST-AT ?auto_10133 ?auto_10130 ) ( SURFACE-AT ?auto_10115 ?auto_10130 ) ( ON ?auto_10115 ?auto_10131 ) ( CLEAR ?auto_10115 ) ( not ( = ?auto_10114 ?auto_10115 ) ) ( not ( = ?auto_10114 ?auto_10131 ) ) ( not ( = ?auto_10115 ?auto_10131 ) ) ( not ( = ?auto_10122 ?auto_10133 ) ) ( IS-CRATE ?auto_10114 ) ( not ( = ?auto_10127 ?auto_10120 ) ) ( HOIST-AT ?auto_10136 ?auto_10127 ) ( AVAILABLE ?auto_10136 ) ( SURFACE-AT ?auto_10114 ?auto_10127 ) ( ON ?auto_10114 ?auto_10126 ) ( CLEAR ?auto_10114 ) ( not ( = ?auto_10113 ?auto_10114 ) ) ( not ( = ?auto_10113 ?auto_10126 ) ) ( not ( = ?auto_10114 ?auto_10126 ) ) ( not ( = ?auto_10122 ?auto_10136 ) ) ( IS-CRATE ?auto_10113 ) ( not ( = ?auto_10134 ?auto_10120 ) ) ( HOIST-AT ?auto_10135 ?auto_10134 ) ( AVAILABLE ?auto_10135 ) ( SURFACE-AT ?auto_10113 ?auto_10134 ) ( ON ?auto_10113 ?auto_10132 ) ( CLEAR ?auto_10113 ) ( not ( = ?auto_10112 ?auto_10113 ) ) ( not ( = ?auto_10112 ?auto_10132 ) ) ( not ( = ?auto_10113 ?auto_10132 ) ) ( not ( = ?auto_10122 ?auto_10135 ) ) ( SURFACE-AT ?auto_10111 ?auto_10120 ) ( CLEAR ?auto_10111 ) ( IS-CRATE ?auto_10112 ) ( AVAILABLE ?auto_10122 ) ( AVAILABLE ?auto_10133 ) ( SURFACE-AT ?auto_10112 ?auto_10130 ) ( ON ?auto_10112 ?auto_10128 ) ( CLEAR ?auto_10112 ) ( TRUCK-AT ?auto_10123 ?auto_10120 ) ( not ( = ?auto_10111 ?auto_10112 ) ) ( not ( = ?auto_10111 ?auto_10128 ) ) ( not ( = ?auto_10112 ?auto_10128 ) ) ( not ( = ?auto_10111 ?auto_10113 ) ) ( not ( = ?auto_10111 ?auto_10132 ) ) ( not ( = ?auto_10113 ?auto_10128 ) ) ( not ( = ?auto_10134 ?auto_10130 ) ) ( not ( = ?auto_10135 ?auto_10133 ) ) ( not ( = ?auto_10132 ?auto_10128 ) ) ( not ( = ?auto_10111 ?auto_10114 ) ) ( not ( = ?auto_10111 ?auto_10126 ) ) ( not ( = ?auto_10112 ?auto_10114 ) ) ( not ( = ?auto_10112 ?auto_10126 ) ) ( not ( = ?auto_10114 ?auto_10132 ) ) ( not ( = ?auto_10114 ?auto_10128 ) ) ( not ( = ?auto_10127 ?auto_10134 ) ) ( not ( = ?auto_10127 ?auto_10130 ) ) ( not ( = ?auto_10136 ?auto_10135 ) ) ( not ( = ?auto_10136 ?auto_10133 ) ) ( not ( = ?auto_10126 ?auto_10132 ) ) ( not ( = ?auto_10126 ?auto_10128 ) ) ( not ( = ?auto_10111 ?auto_10115 ) ) ( not ( = ?auto_10111 ?auto_10131 ) ) ( not ( = ?auto_10112 ?auto_10115 ) ) ( not ( = ?auto_10112 ?auto_10131 ) ) ( not ( = ?auto_10113 ?auto_10115 ) ) ( not ( = ?auto_10113 ?auto_10131 ) ) ( not ( = ?auto_10115 ?auto_10126 ) ) ( not ( = ?auto_10115 ?auto_10132 ) ) ( not ( = ?auto_10115 ?auto_10128 ) ) ( not ( = ?auto_10131 ?auto_10126 ) ) ( not ( = ?auto_10131 ?auto_10132 ) ) ( not ( = ?auto_10131 ?auto_10128 ) ) ( not ( = ?auto_10111 ?auto_10116 ) ) ( not ( = ?auto_10111 ?auto_10124 ) ) ( not ( = ?auto_10112 ?auto_10116 ) ) ( not ( = ?auto_10112 ?auto_10124 ) ) ( not ( = ?auto_10113 ?auto_10116 ) ) ( not ( = ?auto_10113 ?auto_10124 ) ) ( not ( = ?auto_10114 ?auto_10116 ) ) ( not ( = ?auto_10114 ?auto_10124 ) ) ( not ( = ?auto_10116 ?auto_10131 ) ) ( not ( = ?auto_10116 ?auto_10126 ) ) ( not ( = ?auto_10116 ?auto_10132 ) ) ( not ( = ?auto_10116 ?auto_10128 ) ) ( not ( = ?auto_10129 ?auto_10130 ) ) ( not ( = ?auto_10129 ?auto_10127 ) ) ( not ( = ?auto_10129 ?auto_10134 ) ) ( not ( = ?auto_10125 ?auto_10133 ) ) ( not ( = ?auto_10125 ?auto_10136 ) ) ( not ( = ?auto_10125 ?auto_10135 ) ) ( not ( = ?auto_10124 ?auto_10131 ) ) ( not ( = ?auto_10124 ?auto_10126 ) ) ( not ( = ?auto_10124 ?auto_10132 ) ) ( not ( = ?auto_10124 ?auto_10128 ) ) ( not ( = ?auto_10111 ?auto_10117 ) ) ( not ( = ?auto_10111 ?auto_10118 ) ) ( not ( = ?auto_10112 ?auto_10117 ) ) ( not ( = ?auto_10112 ?auto_10118 ) ) ( not ( = ?auto_10113 ?auto_10117 ) ) ( not ( = ?auto_10113 ?auto_10118 ) ) ( not ( = ?auto_10114 ?auto_10117 ) ) ( not ( = ?auto_10114 ?auto_10118 ) ) ( not ( = ?auto_10115 ?auto_10117 ) ) ( not ( = ?auto_10115 ?auto_10118 ) ) ( not ( = ?auto_10117 ?auto_10124 ) ) ( not ( = ?auto_10117 ?auto_10131 ) ) ( not ( = ?auto_10117 ?auto_10126 ) ) ( not ( = ?auto_10117 ?auto_10132 ) ) ( not ( = ?auto_10117 ?auto_10128 ) ) ( not ( = ?auto_10121 ?auto_10129 ) ) ( not ( = ?auto_10121 ?auto_10130 ) ) ( not ( = ?auto_10121 ?auto_10127 ) ) ( not ( = ?auto_10121 ?auto_10134 ) ) ( not ( = ?auto_10119 ?auto_10125 ) ) ( not ( = ?auto_10119 ?auto_10133 ) ) ( not ( = ?auto_10119 ?auto_10136 ) ) ( not ( = ?auto_10119 ?auto_10135 ) ) ( not ( = ?auto_10118 ?auto_10124 ) ) ( not ( = ?auto_10118 ?auto_10131 ) ) ( not ( = ?auto_10118 ?auto_10126 ) ) ( not ( = ?auto_10118 ?auto_10132 ) ) ( not ( = ?auto_10118 ?auto_10128 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_10111 ?auto_10112 ?auto_10113 ?auto_10114 ?auto_10115 ?auto_10116 )
      ( MAKE-1CRATE ?auto_10116 ?auto_10117 )
      ( MAKE-6CRATE-VERIFY ?auto_10111 ?auto_10112 ?auto_10113 ?auto_10114 ?auto_10115 ?auto_10116 ?auto_10117 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10139 - SURFACE
      ?auto_10140 - SURFACE
    )
    :vars
    (
      ?auto_10141 - HOIST
      ?auto_10142 - PLACE
      ?auto_10144 - PLACE
      ?auto_10145 - HOIST
      ?auto_10146 - SURFACE
      ?auto_10143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10141 ?auto_10142 ) ( SURFACE-AT ?auto_10139 ?auto_10142 ) ( CLEAR ?auto_10139 ) ( IS-CRATE ?auto_10140 ) ( AVAILABLE ?auto_10141 ) ( not ( = ?auto_10144 ?auto_10142 ) ) ( HOIST-AT ?auto_10145 ?auto_10144 ) ( AVAILABLE ?auto_10145 ) ( SURFACE-AT ?auto_10140 ?auto_10144 ) ( ON ?auto_10140 ?auto_10146 ) ( CLEAR ?auto_10140 ) ( TRUCK-AT ?auto_10143 ?auto_10142 ) ( not ( = ?auto_10139 ?auto_10140 ) ) ( not ( = ?auto_10139 ?auto_10146 ) ) ( not ( = ?auto_10140 ?auto_10146 ) ) ( not ( = ?auto_10141 ?auto_10145 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10143 ?auto_10142 ?auto_10144 )
      ( !LIFT ?auto_10145 ?auto_10140 ?auto_10146 ?auto_10144 )
      ( !LOAD ?auto_10145 ?auto_10140 ?auto_10143 ?auto_10144 )
      ( !DRIVE ?auto_10143 ?auto_10144 ?auto_10142 )
      ( !UNLOAD ?auto_10141 ?auto_10140 ?auto_10143 ?auto_10142 )
      ( !DROP ?auto_10141 ?auto_10140 ?auto_10139 ?auto_10142 )
      ( MAKE-1CRATE-VERIFY ?auto_10139 ?auto_10140 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_10155 - SURFACE
      ?auto_10156 - SURFACE
      ?auto_10157 - SURFACE
      ?auto_10158 - SURFACE
      ?auto_10159 - SURFACE
      ?auto_10160 - SURFACE
      ?auto_10161 - SURFACE
      ?auto_10162 - SURFACE
    )
    :vars
    (
      ?auto_10163 - HOIST
      ?auto_10165 - PLACE
      ?auto_10167 - PLACE
      ?auto_10168 - HOIST
      ?auto_10164 - SURFACE
      ?auto_10174 - PLACE
      ?auto_10173 - HOIST
      ?auto_10169 - SURFACE
      ?auto_10183 - PLACE
      ?auto_10172 - HOIST
      ?auto_10171 - SURFACE
      ?auto_10182 - PLACE
      ?auto_10178 - HOIST
      ?auto_10181 - SURFACE
      ?auto_10170 - PLACE
      ?auto_10180 - HOIST
      ?auto_10175 - SURFACE
      ?auto_10177 - PLACE
      ?auto_10179 - HOIST
      ?auto_10176 - SURFACE
      ?auto_10184 - SURFACE
      ?auto_10166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10163 ?auto_10165 ) ( IS-CRATE ?auto_10162 ) ( not ( = ?auto_10167 ?auto_10165 ) ) ( HOIST-AT ?auto_10168 ?auto_10167 ) ( AVAILABLE ?auto_10168 ) ( SURFACE-AT ?auto_10162 ?auto_10167 ) ( ON ?auto_10162 ?auto_10164 ) ( CLEAR ?auto_10162 ) ( not ( = ?auto_10161 ?auto_10162 ) ) ( not ( = ?auto_10161 ?auto_10164 ) ) ( not ( = ?auto_10162 ?auto_10164 ) ) ( not ( = ?auto_10163 ?auto_10168 ) ) ( IS-CRATE ?auto_10161 ) ( not ( = ?auto_10174 ?auto_10165 ) ) ( HOIST-AT ?auto_10173 ?auto_10174 ) ( AVAILABLE ?auto_10173 ) ( SURFACE-AT ?auto_10161 ?auto_10174 ) ( ON ?auto_10161 ?auto_10169 ) ( CLEAR ?auto_10161 ) ( not ( = ?auto_10160 ?auto_10161 ) ) ( not ( = ?auto_10160 ?auto_10169 ) ) ( not ( = ?auto_10161 ?auto_10169 ) ) ( not ( = ?auto_10163 ?auto_10173 ) ) ( IS-CRATE ?auto_10160 ) ( not ( = ?auto_10183 ?auto_10165 ) ) ( HOIST-AT ?auto_10172 ?auto_10183 ) ( AVAILABLE ?auto_10172 ) ( SURFACE-AT ?auto_10160 ?auto_10183 ) ( ON ?auto_10160 ?auto_10171 ) ( CLEAR ?auto_10160 ) ( not ( = ?auto_10159 ?auto_10160 ) ) ( not ( = ?auto_10159 ?auto_10171 ) ) ( not ( = ?auto_10160 ?auto_10171 ) ) ( not ( = ?auto_10163 ?auto_10172 ) ) ( IS-CRATE ?auto_10159 ) ( not ( = ?auto_10182 ?auto_10165 ) ) ( HOIST-AT ?auto_10178 ?auto_10182 ) ( SURFACE-AT ?auto_10159 ?auto_10182 ) ( ON ?auto_10159 ?auto_10181 ) ( CLEAR ?auto_10159 ) ( not ( = ?auto_10158 ?auto_10159 ) ) ( not ( = ?auto_10158 ?auto_10181 ) ) ( not ( = ?auto_10159 ?auto_10181 ) ) ( not ( = ?auto_10163 ?auto_10178 ) ) ( IS-CRATE ?auto_10158 ) ( not ( = ?auto_10170 ?auto_10165 ) ) ( HOIST-AT ?auto_10180 ?auto_10170 ) ( AVAILABLE ?auto_10180 ) ( SURFACE-AT ?auto_10158 ?auto_10170 ) ( ON ?auto_10158 ?auto_10175 ) ( CLEAR ?auto_10158 ) ( not ( = ?auto_10157 ?auto_10158 ) ) ( not ( = ?auto_10157 ?auto_10175 ) ) ( not ( = ?auto_10158 ?auto_10175 ) ) ( not ( = ?auto_10163 ?auto_10180 ) ) ( IS-CRATE ?auto_10157 ) ( not ( = ?auto_10177 ?auto_10165 ) ) ( HOIST-AT ?auto_10179 ?auto_10177 ) ( AVAILABLE ?auto_10179 ) ( SURFACE-AT ?auto_10157 ?auto_10177 ) ( ON ?auto_10157 ?auto_10176 ) ( CLEAR ?auto_10157 ) ( not ( = ?auto_10156 ?auto_10157 ) ) ( not ( = ?auto_10156 ?auto_10176 ) ) ( not ( = ?auto_10157 ?auto_10176 ) ) ( not ( = ?auto_10163 ?auto_10179 ) ) ( SURFACE-AT ?auto_10155 ?auto_10165 ) ( CLEAR ?auto_10155 ) ( IS-CRATE ?auto_10156 ) ( AVAILABLE ?auto_10163 ) ( AVAILABLE ?auto_10178 ) ( SURFACE-AT ?auto_10156 ?auto_10182 ) ( ON ?auto_10156 ?auto_10184 ) ( CLEAR ?auto_10156 ) ( TRUCK-AT ?auto_10166 ?auto_10165 ) ( not ( = ?auto_10155 ?auto_10156 ) ) ( not ( = ?auto_10155 ?auto_10184 ) ) ( not ( = ?auto_10156 ?auto_10184 ) ) ( not ( = ?auto_10155 ?auto_10157 ) ) ( not ( = ?auto_10155 ?auto_10176 ) ) ( not ( = ?auto_10157 ?auto_10184 ) ) ( not ( = ?auto_10177 ?auto_10182 ) ) ( not ( = ?auto_10179 ?auto_10178 ) ) ( not ( = ?auto_10176 ?auto_10184 ) ) ( not ( = ?auto_10155 ?auto_10158 ) ) ( not ( = ?auto_10155 ?auto_10175 ) ) ( not ( = ?auto_10156 ?auto_10158 ) ) ( not ( = ?auto_10156 ?auto_10175 ) ) ( not ( = ?auto_10158 ?auto_10176 ) ) ( not ( = ?auto_10158 ?auto_10184 ) ) ( not ( = ?auto_10170 ?auto_10177 ) ) ( not ( = ?auto_10170 ?auto_10182 ) ) ( not ( = ?auto_10180 ?auto_10179 ) ) ( not ( = ?auto_10180 ?auto_10178 ) ) ( not ( = ?auto_10175 ?auto_10176 ) ) ( not ( = ?auto_10175 ?auto_10184 ) ) ( not ( = ?auto_10155 ?auto_10159 ) ) ( not ( = ?auto_10155 ?auto_10181 ) ) ( not ( = ?auto_10156 ?auto_10159 ) ) ( not ( = ?auto_10156 ?auto_10181 ) ) ( not ( = ?auto_10157 ?auto_10159 ) ) ( not ( = ?auto_10157 ?auto_10181 ) ) ( not ( = ?auto_10159 ?auto_10175 ) ) ( not ( = ?auto_10159 ?auto_10176 ) ) ( not ( = ?auto_10159 ?auto_10184 ) ) ( not ( = ?auto_10181 ?auto_10175 ) ) ( not ( = ?auto_10181 ?auto_10176 ) ) ( not ( = ?auto_10181 ?auto_10184 ) ) ( not ( = ?auto_10155 ?auto_10160 ) ) ( not ( = ?auto_10155 ?auto_10171 ) ) ( not ( = ?auto_10156 ?auto_10160 ) ) ( not ( = ?auto_10156 ?auto_10171 ) ) ( not ( = ?auto_10157 ?auto_10160 ) ) ( not ( = ?auto_10157 ?auto_10171 ) ) ( not ( = ?auto_10158 ?auto_10160 ) ) ( not ( = ?auto_10158 ?auto_10171 ) ) ( not ( = ?auto_10160 ?auto_10181 ) ) ( not ( = ?auto_10160 ?auto_10175 ) ) ( not ( = ?auto_10160 ?auto_10176 ) ) ( not ( = ?auto_10160 ?auto_10184 ) ) ( not ( = ?auto_10183 ?auto_10182 ) ) ( not ( = ?auto_10183 ?auto_10170 ) ) ( not ( = ?auto_10183 ?auto_10177 ) ) ( not ( = ?auto_10172 ?auto_10178 ) ) ( not ( = ?auto_10172 ?auto_10180 ) ) ( not ( = ?auto_10172 ?auto_10179 ) ) ( not ( = ?auto_10171 ?auto_10181 ) ) ( not ( = ?auto_10171 ?auto_10175 ) ) ( not ( = ?auto_10171 ?auto_10176 ) ) ( not ( = ?auto_10171 ?auto_10184 ) ) ( not ( = ?auto_10155 ?auto_10161 ) ) ( not ( = ?auto_10155 ?auto_10169 ) ) ( not ( = ?auto_10156 ?auto_10161 ) ) ( not ( = ?auto_10156 ?auto_10169 ) ) ( not ( = ?auto_10157 ?auto_10161 ) ) ( not ( = ?auto_10157 ?auto_10169 ) ) ( not ( = ?auto_10158 ?auto_10161 ) ) ( not ( = ?auto_10158 ?auto_10169 ) ) ( not ( = ?auto_10159 ?auto_10161 ) ) ( not ( = ?auto_10159 ?auto_10169 ) ) ( not ( = ?auto_10161 ?auto_10171 ) ) ( not ( = ?auto_10161 ?auto_10181 ) ) ( not ( = ?auto_10161 ?auto_10175 ) ) ( not ( = ?auto_10161 ?auto_10176 ) ) ( not ( = ?auto_10161 ?auto_10184 ) ) ( not ( = ?auto_10174 ?auto_10183 ) ) ( not ( = ?auto_10174 ?auto_10182 ) ) ( not ( = ?auto_10174 ?auto_10170 ) ) ( not ( = ?auto_10174 ?auto_10177 ) ) ( not ( = ?auto_10173 ?auto_10172 ) ) ( not ( = ?auto_10173 ?auto_10178 ) ) ( not ( = ?auto_10173 ?auto_10180 ) ) ( not ( = ?auto_10173 ?auto_10179 ) ) ( not ( = ?auto_10169 ?auto_10171 ) ) ( not ( = ?auto_10169 ?auto_10181 ) ) ( not ( = ?auto_10169 ?auto_10175 ) ) ( not ( = ?auto_10169 ?auto_10176 ) ) ( not ( = ?auto_10169 ?auto_10184 ) ) ( not ( = ?auto_10155 ?auto_10162 ) ) ( not ( = ?auto_10155 ?auto_10164 ) ) ( not ( = ?auto_10156 ?auto_10162 ) ) ( not ( = ?auto_10156 ?auto_10164 ) ) ( not ( = ?auto_10157 ?auto_10162 ) ) ( not ( = ?auto_10157 ?auto_10164 ) ) ( not ( = ?auto_10158 ?auto_10162 ) ) ( not ( = ?auto_10158 ?auto_10164 ) ) ( not ( = ?auto_10159 ?auto_10162 ) ) ( not ( = ?auto_10159 ?auto_10164 ) ) ( not ( = ?auto_10160 ?auto_10162 ) ) ( not ( = ?auto_10160 ?auto_10164 ) ) ( not ( = ?auto_10162 ?auto_10169 ) ) ( not ( = ?auto_10162 ?auto_10171 ) ) ( not ( = ?auto_10162 ?auto_10181 ) ) ( not ( = ?auto_10162 ?auto_10175 ) ) ( not ( = ?auto_10162 ?auto_10176 ) ) ( not ( = ?auto_10162 ?auto_10184 ) ) ( not ( = ?auto_10167 ?auto_10174 ) ) ( not ( = ?auto_10167 ?auto_10183 ) ) ( not ( = ?auto_10167 ?auto_10182 ) ) ( not ( = ?auto_10167 ?auto_10170 ) ) ( not ( = ?auto_10167 ?auto_10177 ) ) ( not ( = ?auto_10168 ?auto_10173 ) ) ( not ( = ?auto_10168 ?auto_10172 ) ) ( not ( = ?auto_10168 ?auto_10178 ) ) ( not ( = ?auto_10168 ?auto_10180 ) ) ( not ( = ?auto_10168 ?auto_10179 ) ) ( not ( = ?auto_10164 ?auto_10169 ) ) ( not ( = ?auto_10164 ?auto_10171 ) ) ( not ( = ?auto_10164 ?auto_10181 ) ) ( not ( = ?auto_10164 ?auto_10175 ) ) ( not ( = ?auto_10164 ?auto_10176 ) ) ( not ( = ?auto_10164 ?auto_10184 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_10155 ?auto_10156 ?auto_10157 ?auto_10158 ?auto_10159 ?auto_10160 ?auto_10161 )
      ( MAKE-1CRATE ?auto_10161 ?auto_10162 )
      ( MAKE-7CRATE-VERIFY ?auto_10155 ?auto_10156 ?auto_10157 ?auto_10158 ?auto_10159 ?auto_10160 ?auto_10161 ?auto_10162 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10187 - SURFACE
      ?auto_10188 - SURFACE
    )
    :vars
    (
      ?auto_10189 - HOIST
      ?auto_10190 - PLACE
      ?auto_10192 - PLACE
      ?auto_10193 - HOIST
      ?auto_10194 - SURFACE
      ?auto_10191 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10189 ?auto_10190 ) ( SURFACE-AT ?auto_10187 ?auto_10190 ) ( CLEAR ?auto_10187 ) ( IS-CRATE ?auto_10188 ) ( AVAILABLE ?auto_10189 ) ( not ( = ?auto_10192 ?auto_10190 ) ) ( HOIST-AT ?auto_10193 ?auto_10192 ) ( AVAILABLE ?auto_10193 ) ( SURFACE-AT ?auto_10188 ?auto_10192 ) ( ON ?auto_10188 ?auto_10194 ) ( CLEAR ?auto_10188 ) ( TRUCK-AT ?auto_10191 ?auto_10190 ) ( not ( = ?auto_10187 ?auto_10188 ) ) ( not ( = ?auto_10187 ?auto_10194 ) ) ( not ( = ?auto_10188 ?auto_10194 ) ) ( not ( = ?auto_10189 ?auto_10193 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10191 ?auto_10190 ?auto_10192 )
      ( !LIFT ?auto_10193 ?auto_10188 ?auto_10194 ?auto_10192 )
      ( !LOAD ?auto_10193 ?auto_10188 ?auto_10191 ?auto_10192 )
      ( !DRIVE ?auto_10191 ?auto_10192 ?auto_10190 )
      ( !UNLOAD ?auto_10189 ?auto_10188 ?auto_10191 ?auto_10190 )
      ( !DROP ?auto_10189 ?auto_10188 ?auto_10187 ?auto_10190 )
      ( MAKE-1CRATE-VERIFY ?auto_10187 ?auto_10188 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_10204 - SURFACE
      ?auto_10205 - SURFACE
      ?auto_10206 - SURFACE
      ?auto_10207 - SURFACE
      ?auto_10208 - SURFACE
      ?auto_10209 - SURFACE
      ?auto_10210 - SURFACE
      ?auto_10212 - SURFACE
      ?auto_10211 - SURFACE
    )
    :vars
    (
      ?auto_10217 - HOIST
      ?auto_10216 - PLACE
      ?auto_10218 - PLACE
      ?auto_10214 - HOIST
      ?auto_10213 - SURFACE
      ?auto_10234 - PLACE
      ?auto_10220 - HOIST
      ?auto_10225 - SURFACE
      ?auto_10235 - SURFACE
      ?auto_10222 - PLACE
      ?auto_10219 - HOIST
      ?auto_10223 - SURFACE
      ?auto_10231 - PLACE
      ?auto_10228 - HOIST
      ?auto_10230 - SURFACE
      ?auto_10224 - PLACE
      ?auto_10229 - HOIST
      ?auto_10233 - SURFACE
      ?auto_10226 - PLACE
      ?auto_10227 - HOIST
      ?auto_10232 - SURFACE
      ?auto_10221 - SURFACE
      ?auto_10215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10217 ?auto_10216 ) ( IS-CRATE ?auto_10211 ) ( not ( = ?auto_10218 ?auto_10216 ) ) ( HOIST-AT ?auto_10214 ?auto_10218 ) ( SURFACE-AT ?auto_10211 ?auto_10218 ) ( ON ?auto_10211 ?auto_10213 ) ( CLEAR ?auto_10211 ) ( not ( = ?auto_10212 ?auto_10211 ) ) ( not ( = ?auto_10212 ?auto_10213 ) ) ( not ( = ?auto_10211 ?auto_10213 ) ) ( not ( = ?auto_10217 ?auto_10214 ) ) ( IS-CRATE ?auto_10212 ) ( not ( = ?auto_10234 ?auto_10216 ) ) ( HOIST-AT ?auto_10220 ?auto_10234 ) ( AVAILABLE ?auto_10220 ) ( SURFACE-AT ?auto_10212 ?auto_10234 ) ( ON ?auto_10212 ?auto_10225 ) ( CLEAR ?auto_10212 ) ( not ( = ?auto_10210 ?auto_10212 ) ) ( not ( = ?auto_10210 ?auto_10225 ) ) ( not ( = ?auto_10212 ?auto_10225 ) ) ( not ( = ?auto_10217 ?auto_10220 ) ) ( IS-CRATE ?auto_10210 ) ( AVAILABLE ?auto_10214 ) ( SURFACE-AT ?auto_10210 ?auto_10218 ) ( ON ?auto_10210 ?auto_10235 ) ( CLEAR ?auto_10210 ) ( not ( = ?auto_10209 ?auto_10210 ) ) ( not ( = ?auto_10209 ?auto_10235 ) ) ( not ( = ?auto_10210 ?auto_10235 ) ) ( IS-CRATE ?auto_10209 ) ( not ( = ?auto_10222 ?auto_10216 ) ) ( HOIST-AT ?auto_10219 ?auto_10222 ) ( AVAILABLE ?auto_10219 ) ( SURFACE-AT ?auto_10209 ?auto_10222 ) ( ON ?auto_10209 ?auto_10223 ) ( CLEAR ?auto_10209 ) ( not ( = ?auto_10208 ?auto_10209 ) ) ( not ( = ?auto_10208 ?auto_10223 ) ) ( not ( = ?auto_10209 ?auto_10223 ) ) ( not ( = ?auto_10217 ?auto_10219 ) ) ( IS-CRATE ?auto_10208 ) ( not ( = ?auto_10231 ?auto_10216 ) ) ( HOIST-AT ?auto_10228 ?auto_10231 ) ( SURFACE-AT ?auto_10208 ?auto_10231 ) ( ON ?auto_10208 ?auto_10230 ) ( CLEAR ?auto_10208 ) ( not ( = ?auto_10207 ?auto_10208 ) ) ( not ( = ?auto_10207 ?auto_10230 ) ) ( not ( = ?auto_10208 ?auto_10230 ) ) ( not ( = ?auto_10217 ?auto_10228 ) ) ( IS-CRATE ?auto_10207 ) ( not ( = ?auto_10224 ?auto_10216 ) ) ( HOIST-AT ?auto_10229 ?auto_10224 ) ( AVAILABLE ?auto_10229 ) ( SURFACE-AT ?auto_10207 ?auto_10224 ) ( ON ?auto_10207 ?auto_10233 ) ( CLEAR ?auto_10207 ) ( not ( = ?auto_10206 ?auto_10207 ) ) ( not ( = ?auto_10206 ?auto_10233 ) ) ( not ( = ?auto_10207 ?auto_10233 ) ) ( not ( = ?auto_10217 ?auto_10229 ) ) ( IS-CRATE ?auto_10206 ) ( not ( = ?auto_10226 ?auto_10216 ) ) ( HOIST-AT ?auto_10227 ?auto_10226 ) ( AVAILABLE ?auto_10227 ) ( SURFACE-AT ?auto_10206 ?auto_10226 ) ( ON ?auto_10206 ?auto_10232 ) ( CLEAR ?auto_10206 ) ( not ( = ?auto_10205 ?auto_10206 ) ) ( not ( = ?auto_10205 ?auto_10232 ) ) ( not ( = ?auto_10206 ?auto_10232 ) ) ( not ( = ?auto_10217 ?auto_10227 ) ) ( SURFACE-AT ?auto_10204 ?auto_10216 ) ( CLEAR ?auto_10204 ) ( IS-CRATE ?auto_10205 ) ( AVAILABLE ?auto_10217 ) ( AVAILABLE ?auto_10228 ) ( SURFACE-AT ?auto_10205 ?auto_10231 ) ( ON ?auto_10205 ?auto_10221 ) ( CLEAR ?auto_10205 ) ( TRUCK-AT ?auto_10215 ?auto_10216 ) ( not ( = ?auto_10204 ?auto_10205 ) ) ( not ( = ?auto_10204 ?auto_10221 ) ) ( not ( = ?auto_10205 ?auto_10221 ) ) ( not ( = ?auto_10204 ?auto_10206 ) ) ( not ( = ?auto_10204 ?auto_10232 ) ) ( not ( = ?auto_10206 ?auto_10221 ) ) ( not ( = ?auto_10226 ?auto_10231 ) ) ( not ( = ?auto_10227 ?auto_10228 ) ) ( not ( = ?auto_10232 ?auto_10221 ) ) ( not ( = ?auto_10204 ?auto_10207 ) ) ( not ( = ?auto_10204 ?auto_10233 ) ) ( not ( = ?auto_10205 ?auto_10207 ) ) ( not ( = ?auto_10205 ?auto_10233 ) ) ( not ( = ?auto_10207 ?auto_10232 ) ) ( not ( = ?auto_10207 ?auto_10221 ) ) ( not ( = ?auto_10224 ?auto_10226 ) ) ( not ( = ?auto_10224 ?auto_10231 ) ) ( not ( = ?auto_10229 ?auto_10227 ) ) ( not ( = ?auto_10229 ?auto_10228 ) ) ( not ( = ?auto_10233 ?auto_10232 ) ) ( not ( = ?auto_10233 ?auto_10221 ) ) ( not ( = ?auto_10204 ?auto_10208 ) ) ( not ( = ?auto_10204 ?auto_10230 ) ) ( not ( = ?auto_10205 ?auto_10208 ) ) ( not ( = ?auto_10205 ?auto_10230 ) ) ( not ( = ?auto_10206 ?auto_10208 ) ) ( not ( = ?auto_10206 ?auto_10230 ) ) ( not ( = ?auto_10208 ?auto_10233 ) ) ( not ( = ?auto_10208 ?auto_10232 ) ) ( not ( = ?auto_10208 ?auto_10221 ) ) ( not ( = ?auto_10230 ?auto_10233 ) ) ( not ( = ?auto_10230 ?auto_10232 ) ) ( not ( = ?auto_10230 ?auto_10221 ) ) ( not ( = ?auto_10204 ?auto_10209 ) ) ( not ( = ?auto_10204 ?auto_10223 ) ) ( not ( = ?auto_10205 ?auto_10209 ) ) ( not ( = ?auto_10205 ?auto_10223 ) ) ( not ( = ?auto_10206 ?auto_10209 ) ) ( not ( = ?auto_10206 ?auto_10223 ) ) ( not ( = ?auto_10207 ?auto_10209 ) ) ( not ( = ?auto_10207 ?auto_10223 ) ) ( not ( = ?auto_10209 ?auto_10230 ) ) ( not ( = ?auto_10209 ?auto_10233 ) ) ( not ( = ?auto_10209 ?auto_10232 ) ) ( not ( = ?auto_10209 ?auto_10221 ) ) ( not ( = ?auto_10222 ?auto_10231 ) ) ( not ( = ?auto_10222 ?auto_10224 ) ) ( not ( = ?auto_10222 ?auto_10226 ) ) ( not ( = ?auto_10219 ?auto_10228 ) ) ( not ( = ?auto_10219 ?auto_10229 ) ) ( not ( = ?auto_10219 ?auto_10227 ) ) ( not ( = ?auto_10223 ?auto_10230 ) ) ( not ( = ?auto_10223 ?auto_10233 ) ) ( not ( = ?auto_10223 ?auto_10232 ) ) ( not ( = ?auto_10223 ?auto_10221 ) ) ( not ( = ?auto_10204 ?auto_10210 ) ) ( not ( = ?auto_10204 ?auto_10235 ) ) ( not ( = ?auto_10205 ?auto_10210 ) ) ( not ( = ?auto_10205 ?auto_10235 ) ) ( not ( = ?auto_10206 ?auto_10210 ) ) ( not ( = ?auto_10206 ?auto_10235 ) ) ( not ( = ?auto_10207 ?auto_10210 ) ) ( not ( = ?auto_10207 ?auto_10235 ) ) ( not ( = ?auto_10208 ?auto_10210 ) ) ( not ( = ?auto_10208 ?auto_10235 ) ) ( not ( = ?auto_10210 ?auto_10223 ) ) ( not ( = ?auto_10210 ?auto_10230 ) ) ( not ( = ?auto_10210 ?auto_10233 ) ) ( not ( = ?auto_10210 ?auto_10232 ) ) ( not ( = ?auto_10210 ?auto_10221 ) ) ( not ( = ?auto_10218 ?auto_10222 ) ) ( not ( = ?auto_10218 ?auto_10231 ) ) ( not ( = ?auto_10218 ?auto_10224 ) ) ( not ( = ?auto_10218 ?auto_10226 ) ) ( not ( = ?auto_10214 ?auto_10219 ) ) ( not ( = ?auto_10214 ?auto_10228 ) ) ( not ( = ?auto_10214 ?auto_10229 ) ) ( not ( = ?auto_10214 ?auto_10227 ) ) ( not ( = ?auto_10235 ?auto_10223 ) ) ( not ( = ?auto_10235 ?auto_10230 ) ) ( not ( = ?auto_10235 ?auto_10233 ) ) ( not ( = ?auto_10235 ?auto_10232 ) ) ( not ( = ?auto_10235 ?auto_10221 ) ) ( not ( = ?auto_10204 ?auto_10212 ) ) ( not ( = ?auto_10204 ?auto_10225 ) ) ( not ( = ?auto_10205 ?auto_10212 ) ) ( not ( = ?auto_10205 ?auto_10225 ) ) ( not ( = ?auto_10206 ?auto_10212 ) ) ( not ( = ?auto_10206 ?auto_10225 ) ) ( not ( = ?auto_10207 ?auto_10212 ) ) ( not ( = ?auto_10207 ?auto_10225 ) ) ( not ( = ?auto_10208 ?auto_10212 ) ) ( not ( = ?auto_10208 ?auto_10225 ) ) ( not ( = ?auto_10209 ?auto_10212 ) ) ( not ( = ?auto_10209 ?auto_10225 ) ) ( not ( = ?auto_10212 ?auto_10235 ) ) ( not ( = ?auto_10212 ?auto_10223 ) ) ( not ( = ?auto_10212 ?auto_10230 ) ) ( not ( = ?auto_10212 ?auto_10233 ) ) ( not ( = ?auto_10212 ?auto_10232 ) ) ( not ( = ?auto_10212 ?auto_10221 ) ) ( not ( = ?auto_10234 ?auto_10218 ) ) ( not ( = ?auto_10234 ?auto_10222 ) ) ( not ( = ?auto_10234 ?auto_10231 ) ) ( not ( = ?auto_10234 ?auto_10224 ) ) ( not ( = ?auto_10234 ?auto_10226 ) ) ( not ( = ?auto_10220 ?auto_10214 ) ) ( not ( = ?auto_10220 ?auto_10219 ) ) ( not ( = ?auto_10220 ?auto_10228 ) ) ( not ( = ?auto_10220 ?auto_10229 ) ) ( not ( = ?auto_10220 ?auto_10227 ) ) ( not ( = ?auto_10225 ?auto_10235 ) ) ( not ( = ?auto_10225 ?auto_10223 ) ) ( not ( = ?auto_10225 ?auto_10230 ) ) ( not ( = ?auto_10225 ?auto_10233 ) ) ( not ( = ?auto_10225 ?auto_10232 ) ) ( not ( = ?auto_10225 ?auto_10221 ) ) ( not ( = ?auto_10204 ?auto_10211 ) ) ( not ( = ?auto_10204 ?auto_10213 ) ) ( not ( = ?auto_10205 ?auto_10211 ) ) ( not ( = ?auto_10205 ?auto_10213 ) ) ( not ( = ?auto_10206 ?auto_10211 ) ) ( not ( = ?auto_10206 ?auto_10213 ) ) ( not ( = ?auto_10207 ?auto_10211 ) ) ( not ( = ?auto_10207 ?auto_10213 ) ) ( not ( = ?auto_10208 ?auto_10211 ) ) ( not ( = ?auto_10208 ?auto_10213 ) ) ( not ( = ?auto_10209 ?auto_10211 ) ) ( not ( = ?auto_10209 ?auto_10213 ) ) ( not ( = ?auto_10210 ?auto_10211 ) ) ( not ( = ?auto_10210 ?auto_10213 ) ) ( not ( = ?auto_10211 ?auto_10225 ) ) ( not ( = ?auto_10211 ?auto_10235 ) ) ( not ( = ?auto_10211 ?auto_10223 ) ) ( not ( = ?auto_10211 ?auto_10230 ) ) ( not ( = ?auto_10211 ?auto_10233 ) ) ( not ( = ?auto_10211 ?auto_10232 ) ) ( not ( = ?auto_10211 ?auto_10221 ) ) ( not ( = ?auto_10213 ?auto_10225 ) ) ( not ( = ?auto_10213 ?auto_10235 ) ) ( not ( = ?auto_10213 ?auto_10223 ) ) ( not ( = ?auto_10213 ?auto_10230 ) ) ( not ( = ?auto_10213 ?auto_10233 ) ) ( not ( = ?auto_10213 ?auto_10232 ) ) ( not ( = ?auto_10213 ?auto_10221 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_10204 ?auto_10205 ?auto_10206 ?auto_10207 ?auto_10208 ?auto_10209 ?auto_10210 ?auto_10212 )
      ( MAKE-1CRATE ?auto_10212 ?auto_10211 )
      ( MAKE-8CRATE-VERIFY ?auto_10204 ?auto_10205 ?auto_10206 ?auto_10207 ?auto_10208 ?auto_10209 ?auto_10210 ?auto_10212 ?auto_10211 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10238 - SURFACE
      ?auto_10239 - SURFACE
    )
    :vars
    (
      ?auto_10240 - HOIST
      ?auto_10241 - PLACE
      ?auto_10243 - PLACE
      ?auto_10244 - HOIST
      ?auto_10245 - SURFACE
      ?auto_10242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10240 ?auto_10241 ) ( SURFACE-AT ?auto_10238 ?auto_10241 ) ( CLEAR ?auto_10238 ) ( IS-CRATE ?auto_10239 ) ( AVAILABLE ?auto_10240 ) ( not ( = ?auto_10243 ?auto_10241 ) ) ( HOIST-AT ?auto_10244 ?auto_10243 ) ( AVAILABLE ?auto_10244 ) ( SURFACE-AT ?auto_10239 ?auto_10243 ) ( ON ?auto_10239 ?auto_10245 ) ( CLEAR ?auto_10239 ) ( TRUCK-AT ?auto_10242 ?auto_10241 ) ( not ( = ?auto_10238 ?auto_10239 ) ) ( not ( = ?auto_10238 ?auto_10245 ) ) ( not ( = ?auto_10239 ?auto_10245 ) ) ( not ( = ?auto_10240 ?auto_10244 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10242 ?auto_10241 ?auto_10243 )
      ( !LIFT ?auto_10244 ?auto_10239 ?auto_10245 ?auto_10243 )
      ( !LOAD ?auto_10244 ?auto_10239 ?auto_10242 ?auto_10243 )
      ( !DRIVE ?auto_10242 ?auto_10243 ?auto_10241 )
      ( !UNLOAD ?auto_10240 ?auto_10239 ?auto_10242 ?auto_10241 )
      ( !DROP ?auto_10240 ?auto_10239 ?auto_10238 ?auto_10241 )
      ( MAKE-1CRATE-VERIFY ?auto_10238 ?auto_10239 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_10256 - SURFACE
      ?auto_10257 - SURFACE
      ?auto_10258 - SURFACE
      ?auto_10259 - SURFACE
      ?auto_10260 - SURFACE
      ?auto_10261 - SURFACE
      ?auto_10262 - SURFACE
      ?auto_10265 - SURFACE
      ?auto_10264 - SURFACE
      ?auto_10263 - SURFACE
    )
    :vars
    (
      ?auto_10270 - HOIST
      ?auto_10271 - PLACE
      ?auto_10268 - PLACE
      ?auto_10269 - HOIST
      ?auto_10266 - SURFACE
      ?auto_10274 - PLACE
      ?auto_10287 - HOIST
      ?auto_10288 - SURFACE
      ?auto_10276 - PLACE
      ?auto_10273 - HOIST
      ?auto_10284 - SURFACE
      ?auto_10275 - SURFACE
      ?auto_10286 - SURFACE
      ?auto_10281 - PLACE
      ?auto_10279 - HOIST
      ?auto_10280 - SURFACE
      ?auto_10285 - PLACE
      ?auto_10278 - HOIST
      ?auto_10272 - SURFACE
      ?auto_10283 - PLACE
      ?auto_10277 - HOIST
      ?auto_10282 - SURFACE
      ?auto_10289 - SURFACE
      ?auto_10267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10270 ?auto_10271 ) ( IS-CRATE ?auto_10263 ) ( not ( = ?auto_10268 ?auto_10271 ) ) ( HOIST-AT ?auto_10269 ?auto_10268 ) ( SURFACE-AT ?auto_10263 ?auto_10268 ) ( ON ?auto_10263 ?auto_10266 ) ( CLEAR ?auto_10263 ) ( not ( = ?auto_10264 ?auto_10263 ) ) ( not ( = ?auto_10264 ?auto_10266 ) ) ( not ( = ?auto_10263 ?auto_10266 ) ) ( not ( = ?auto_10270 ?auto_10269 ) ) ( IS-CRATE ?auto_10264 ) ( not ( = ?auto_10274 ?auto_10271 ) ) ( HOIST-AT ?auto_10287 ?auto_10274 ) ( SURFACE-AT ?auto_10264 ?auto_10274 ) ( ON ?auto_10264 ?auto_10288 ) ( CLEAR ?auto_10264 ) ( not ( = ?auto_10265 ?auto_10264 ) ) ( not ( = ?auto_10265 ?auto_10288 ) ) ( not ( = ?auto_10264 ?auto_10288 ) ) ( not ( = ?auto_10270 ?auto_10287 ) ) ( IS-CRATE ?auto_10265 ) ( not ( = ?auto_10276 ?auto_10271 ) ) ( HOIST-AT ?auto_10273 ?auto_10276 ) ( AVAILABLE ?auto_10273 ) ( SURFACE-AT ?auto_10265 ?auto_10276 ) ( ON ?auto_10265 ?auto_10284 ) ( CLEAR ?auto_10265 ) ( not ( = ?auto_10262 ?auto_10265 ) ) ( not ( = ?auto_10262 ?auto_10284 ) ) ( not ( = ?auto_10265 ?auto_10284 ) ) ( not ( = ?auto_10270 ?auto_10273 ) ) ( IS-CRATE ?auto_10262 ) ( AVAILABLE ?auto_10287 ) ( SURFACE-AT ?auto_10262 ?auto_10274 ) ( ON ?auto_10262 ?auto_10275 ) ( CLEAR ?auto_10262 ) ( not ( = ?auto_10261 ?auto_10262 ) ) ( not ( = ?auto_10261 ?auto_10275 ) ) ( not ( = ?auto_10262 ?auto_10275 ) ) ( IS-CRATE ?auto_10261 ) ( AVAILABLE ?auto_10269 ) ( SURFACE-AT ?auto_10261 ?auto_10268 ) ( ON ?auto_10261 ?auto_10286 ) ( CLEAR ?auto_10261 ) ( not ( = ?auto_10260 ?auto_10261 ) ) ( not ( = ?auto_10260 ?auto_10286 ) ) ( not ( = ?auto_10261 ?auto_10286 ) ) ( IS-CRATE ?auto_10260 ) ( not ( = ?auto_10281 ?auto_10271 ) ) ( HOIST-AT ?auto_10279 ?auto_10281 ) ( SURFACE-AT ?auto_10260 ?auto_10281 ) ( ON ?auto_10260 ?auto_10280 ) ( CLEAR ?auto_10260 ) ( not ( = ?auto_10259 ?auto_10260 ) ) ( not ( = ?auto_10259 ?auto_10280 ) ) ( not ( = ?auto_10260 ?auto_10280 ) ) ( not ( = ?auto_10270 ?auto_10279 ) ) ( IS-CRATE ?auto_10259 ) ( not ( = ?auto_10285 ?auto_10271 ) ) ( HOIST-AT ?auto_10278 ?auto_10285 ) ( AVAILABLE ?auto_10278 ) ( SURFACE-AT ?auto_10259 ?auto_10285 ) ( ON ?auto_10259 ?auto_10272 ) ( CLEAR ?auto_10259 ) ( not ( = ?auto_10258 ?auto_10259 ) ) ( not ( = ?auto_10258 ?auto_10272 ) ) ( not ( = ?auto_10259 ?auto_10272 ) ) ( not ( = ?auto_10270 ?auto_10278 ) ) ( IS-CRATE ?auto_10258 ) ( not ( = ?auto_10283 ?auto_10271 ) ) ( HOIST-AT ?auto_10277 ?auto_10283 ) ( AVAILABLE ?auto_10277 ) ( SURFACE-AT ?auto_10258 ?auto_10283 ) ( ON ?auto_10258 ?auto_10282 ) ( CLEAR ?auto_10258 ) ( not ( = ?auto_10257 ?auto_10258 ) ) ( not ( = ?auto_10257 ?auto_10282 ) ) ( not ( = ?auto_10258 ?auto_10282 ) ) ( not ( = ?auto_10270 ?auto_10277 ) ) ( SURFACE-AT ?auto_10256 ?auto_10271 ) ( CLEAR ?auto_10256 ) ( IS-CRATE ?auto_10257 ) ( AVAILABLE ?auto_10270 ) ( AVAILABLE ?auto_10279 ) ( SURFACE-AT ?auto_10257 ?auto_10281 ) ( ON ?auto_10257 ?auto_10289 ) ( CLEAR ?auto_10257 ) ( TRUCK-AT ?auto_10267 ?auto_10271 ) ( not ( = ?auto_10256 ?auto_10257 ) ) ( not ( = ?auto_10256 ?auto_10289 ) ) ( not ( = ?auto_10257 ?auto_10289 ) ) ( not ( = ?auto_10256 ?auto_10258 ) ) ( not ( = ?auto_10256 ?auto_10282 ) ) ( not ( = ?auto_10258 ?auto_10289 ) ) ( not ( = ?auto_10283 ?auto_10281 ) ) ( not ( = ?auto_10277 ?auto_10279 ) ) ( not ( = ?auto_10282 ?auto_10289 ) ) ( not ( = ?auto_10256 ?auto_10259 ) ) ( not ( = ?auto_10256 ?auto_10272 ) ) ( not ( = ?auto_10257 ?auto_10259 ) ) ( not ( = ?auto_10257 ?auto_10272 ) ) ( not ( = ?auto_10259 ?auto_10282 ) ) ( not ( = ?auto_10259 ?auto_10289 ) ) ( not ( = ?auto_10285 ?auto_10283 ) ) ( not ( = ?auto_10285 ?auto_10281 ) ) ( not ( = ?auto_10278 ?auto_10277 ) ) ( not ( = ?auto_10278 ?auto_10279 ) ) ( not ( = ?auto_10272 ?auto_10282 ) ) ( not ( = ?auto_10272 ?auto_10289 ) ) ( not ( = ?auto_10256 ?auto_10260 ) ) ( not ( = ?auto_10256 ?auto_10280 ) ) ( not ( = ?auto_10257 ?auto_10260 ) ) ( not ( = ?auto_10257 ?auto_10280 ) ) ( not ( = ?auto_10258 ?auto_10260 ) ) ( not ( = ?auto_10258 ?auto_10280 ) ) ( not ( = ?auto_10260 ?auto_10272 ) ) ( not ( = ?auto_10260 ?auto_10282 ) ) ( not ( = ?auto_10260 ?auto_10289 ) ) ( not ( = ?auto_10280 ?auto_10272 ) ) ( not ( = ?auto_10280 ?auto_10282 ) ) ( not ( = ?auto_10280 ?auto_10289 ) ) ( not ( = ?auto_10256 ?auto_10261 ) ) ( not ( = ?auto_10256 ?auto_10286 ) ) ( not ( = ?auto_10257 ?auto_10261 ) ) ( not ( = ?auto_10257 ?auto_10286 ) ) ( not ( = ?auto_10258 ?auto_10261 ) ) ( not ( = ?auto_10258 ?auto_10286 ) ) ( not ( = ?auto_10259 ?auto_10261 ) ) ( not ( = ?auto_10259 ?auto_10286 ) ) ( not ( = ?auto_10261 ?auto_10280 ) ) ( not ( = ?auto_10261 ?auto_10272 ) ) ( not ( = ?auto_10261 ?auto_10282 ) ) ( not ( = ?auto_10261 ?auto_10289 ) ) ( not ( = ?auto_10268 ?auto_10281 ) ) ( not ( = ?auto_10268 ?auto_10285 ) ) ( not ( = ?auto_10268 ?auto_10283 ) ) ( not ( = ?auto_10269 ?auto_10279 ) ) ( not ( = ?auto_10269 ?auto_10278 ) ) ( not ( = ?auto_10269 ?auto_10277 ) ) ( not ( = ?auto_10286 ?auto_10280 ) ) ( not ( = ?auto_10286 ?auto_10272 ) ) ( not ( = ?auto_10286 ?auto_10282 ) ) ( not ( = ?auto_10286 ?auto_10289 ) ) ( not ( = ?auto_10256 ?auto_10262 ) ) ( not ( = ?auto_10256 ?auto_10275 ) ) ( not ( = ?auto_10257 ?auto_10262 ) ) ( not ( = ?auto_10257 ?auto_10275 ) ) ( not ( = ?auto_10258 ?auto_10262 ) ) ( not ( = ?auto_10258 ?auto_10275 ) ) ( not ( = ?auto_10259 ?auto_10262 ) ) ( not ( = ?auto_10259 ?auto_10275 ) ) ( not ( = ?auto_10260 ?auto_10262 ) ) ( not ( = ?auto_10260 ?auto_10275 ) ) ( not ( = ?auto_10262 ?auto_10286 ) ) ( not ( = ?auto_10262 ?auto_10280 ) ) ( not ( = ?auto_10262 ?auto_10272 ) ) ( not ( = ?auto_10262 ?auto_10282 ) ) ( not ( = ?auto_10262 ?auto_10289 ) ) ( not ( = ?auto_10274 ?auto_10268 ) ) ( not ( = ?auto_10274 ?auto_10281 ) ) ( not ( = ?auto_10274 ?auto_10285 ) ) ( not ( = ?auto_10274 ?auto_10283 ) ) ( not ( = ?auto_10287 ?auto_10269 ) ) ( not ( = ?auto_10287 ?auto_10279 ) ) ( not ( = ?auto_10287 ?auto_10278 ) ) ( not ( = ?auto_10287 ?auto_10277 ) ) ( not ( = ?auto_10275 ?auto_10286 ) ) ( not ( = ?auto_10275 ?auto_10280 ) ) ( not ( = ?auto_10275 ?auto_10272 ) ) ( not ( = ?auto_10275 ?auto_10282 ) ) ( not ( = ?auto_10275 ?auto_10289 ) ) ( not ( = ?auto_10256 ?auto_10265 ) ) ( not ( = ?auto_10256 ?auto_10284 ) ) ( not ( = ?auto_10257 ?auto_10265 ) ) ( not ( = ?auto_10257 ?auto_10284 ) ) ( not ( = ?auto_10258 ?auto_10265 ) ) ( not ( = ?auto_10258 ?auto_10284 ) ) ( not ( = ?auto_10259 ?auto_10265 ) ) ( not ( = ?auto_10259 ?auto_10284 ) ) ( not ( = ?auto_10260 ?auto_10265 ) ) ( not ( = ?auto_10260 ?auto_10284 ) ) ( not ( = ?auto_10261 ?auto_10265 ) ) ( not ( = ?auto_10261 ?auto_10284 ) ) ( not ( = ?auto_10265 ?auto_10275 ) ) ( not ( = ?auto_10265 ?auto_10286 ) ) ( not ( = ?auto_10265 ?auto_10280 ) ) ( not ( = ?auto_10265 ?auto_10272 ) ) ( not ( = ?auto_10265 ?auto_10282 ) ) ( not ( = ?auto_10265 ?auto_10289 ) ) ( not ( = ?auto_10276 ?auto_10274 ) ) ( not ( = ?auto_10276 ?auto_10268 ) ) ( not ( = ?auto_10276 ?auto_10281 ) ) ( not ( = ?auto_10276 ?auto_10285 ) ) ( not ( = ?auto_10276 ?auto_10283 ) ) ( not ( = ?auto_10273 ?auto_10287 ) ) ( not ( = ?auto_10273 ?auto_10269 ) ) ( not ( = ?auto_10273 ?auto_10279 ) ) ( not ( = ?auto_10273 ?auto_10278 ) ) ( not ( = ?auto_10273 ?auto_10277 ) ) ( not ( = ?auto_10284 ?auto_10275 ) ) ( not ( = ?auto_10284 ?auto_10286 ) ) ( not ( = ?auto_10284 ?auto_10280 ) ) ( not ( = ?auto_10284 ?auto_10272 ) ) ( not ( = ?auto_10284 ?auto_10282 ) ) ( not ( = ?auto_10284 ?auto_10289 ) ) ( not ( = ?auto_10256 ?auto_10264 ) ) ( not ( = ?auto_10256 ?auto_10288 ) ) ( not ( = ?auto_10257 ?auto_10264 ) ) ( not ( = ?auto_10257 ?auto_10288 ) ) ( not ( = ?auto_10258 ?auto_10264 ) ) ( not ( = ?auto_10258 ?auto_10288 ) ) ( not ( = ?auto_10259 ?auto_10264 ) ) ( not ( = ?auto_10259 ?auto_10288 ) ) ( not ( = ?auto_10260 ?auto_10264 ) ) ( not ( = ?auto_10260 ?auto_10288 ) ) ( not ( = ?auto_10261 ?auto_10264 ) ) ( not ( = ?auto_10261 ?auto_10288 ) ) ( not ( = ?auto_10262 ?auto_10264 ) ) ( not ( = ?auto_10262 ?auto_10288 ) ) ( not ( = ?auto_10264 ?auto_10284 ) ) ( not ( = ?auto_10264 ?auto_10275 ) ) ( not ( = ?auto_10264 ?auto_10286 ) ) ( not ( = ?auto_10264 ?auto_10280 ) ) ( not ( = ?auto_10264 ?auto_10272 ) ) ( not ( = ?auto_10264 ?auto_10282 ) ) ( not ( = ?auto_10264 ?auto_10289 ) ) ( not ( = ?auto_10288 ?auto_10284 ) ) ( not ( = ?auto_10288 ?auto_10275 ) ) ( not ( = ?auto_10288 ?auto_10286 ) ) ( not ( = ?auto_10288 ?auto_10280 ) ) ( not ( = ?auto_10288 ?auto_10272 ) ) ( not ( = ?auto_10288 ?auto_10282 ) ) ( not ( = ?auto_10288 ?auto_10289 ) ) ( not ( = ?auto_10256 ?auto_10263 ) ) ( not ( = ?auto_10256 ?auto_10266 ) ) ( not ( = ?auto_10257 ?auto_10263 ) ) ( not ( = ?auto_10257 ?auto_10266 ) ) ( not ( = ?auto_10258 ?auto_10263 ) ) ( not ( = ?auto_10258 ?auto_10266 ) ) ( not ( = ?auto_10259 ?auto_10263 ) ) ( not ( = ?auto_10259 ?auto_10266 ) ) ( not ( = ?auto_10260 ?auto_10263 ) ) ( not ( = ?auto_10260 ?auto_10266 ) ) ( not ( = ?auto_10261 ?auto_10263 ) ) ( not ( = ?auto_10261 ?auto_10266 ) ) ( not ( = ?auto_10262 ?auto_10263 ) ) ( not ( = ?auto_10262 ?auto_10266 ) ) ( not ( = ?auto_10265 ?auto_10263 ) ) ( not ( = ?auto_10265 ?auto_10266 ) ) ( not ( = ?auto_10263 ?auto_10288 ) ) ( not ( = ?auto_10263 ?auto_10284 ) ) ( not ( = ?auto_10263 ?auto_10275 ) ) ( not ( = ?auto_10263 ?auto_10286 ) ) ( not ( = ?auto_10263 ?auto_10280 ) ) ( not ( = ?auto_10263 ?auto_10272 ) ) ( not ( = ?auto_10263 ?auto_10282 ) ) ( not ( = ?auto_10263 ?auto_10289 ) ) ( not ( = ?auto_10266 ?auto_10288 ) ) ( not ( = ?auto_10266 ?auto_10284 ) ) ( not ( = ?auto_10266 ?auto_10275 ) ) ( not ( = ?auto_10266 ?auto_10286 ) ) ( not ( = ?auto_10266 ?auto_10280 ) ) ( not ( = ?auto_10266 ?auto_10272 ) ) ( not ( = ?auto_10266 ?auto_10282 ) ) ( not ( = ?auto_10266 ?auto_10289 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_10256 ?auto_10257 ?auto_10258 ?auto_10259 ?auto_10260 ?auto_10261 ?auto_10262 ?auto_10265 ?auto_10264 )
      ( MAKE-1CRATE ?auto_10264 ?auto_10263 )
      ( MAKE-9CRATE-VERIFY ?auto_10256 ?auto_10257 ?auto_10258 ?auto_10259 ?auto_10260 ?auto_10261 ?auto_10262 ?auto_10265 ?auto_10264 ?auto_10263 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10292 - SURFACE
      ?auto_10293 - SURFACE
    )
    :vars
    (
      ?auto_10294 - HOIST
      ?auto_10295 - PLACE
      ?auto_10297 - PLACE
      ?auto_10298 - HOIST
      ?auto_10299 - SURFACE
      ?auto_10296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10294 ?auto_10295 ) ( SURFACE-AT ?auto_10292 ?auto_10295 ) ( CLEAR ?auto_10292 ) ( IS-CRATE ?auto_10293 ) ( AVAILABLE ?auto_10294 ) ( not ( = ?auto_10297 ?auto_10295 ) ) ( HOIST-AT ?auto_10298 ?auto_10297 ) ( AVAILABLE ?auto_10298 ) ( SURFACE-AT ?auto_10293 ?auto_10297 ) ( ON ?auto_10293 ?auto_10299 ) ( CLEAR ?auto_10293 ) ( TRUCK-AT ?auto_10296 ?auto_10295 ) ( not ( = ?auto_10292 ?auto_10293 ) ) ( not ( = ?auto_10292 ?auto_10299 ) ) ( not ( = ?auto_10293 ?auto_10299 ) ) ( not ( = ?auto_10294 ?auto_10298 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10296 ?auto_10295 ?auto_10297 )
      ( !LIFT ?auto_10298 ?auto_10293 ?auto_10299 ?auto_10297 )
      ( !LOAD ?auto_10298 ?auto_10293 ?auto_10296 ?auto_10297 )
      ( !DRIVE ?auto_10296 ?auto_10297 ?auto_10295 )
      ( !UNLOAD ?auto_10294 ?auto_10293 ?auto_10296 ?auto_10295 )
      ( !DROP ?auto_10294 ?auto_10293 ?auto_10292 ?auto_10295 )
      ( MAKE-1CRATE-VERIFY ?auto_10292 ?auto_10293 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_10311 - SURFACE
      ?auto_10312 - SURFACE
      ?auto_10313 - SURFACE
      ?auto_10314 - SURFACE
      ?auto_10315 - SURFACE
      ?auto_10316 - SURFACE
      ?auto_10317 - SURFACE
      ?auto_10320 - SURFACE
      ?auto_10319 - SURFACE
      ?auto_10318 - SURFACE
      ?auto_10321 - SURFACE
    )
    :vars
    (
      ?auto_10327 - HOIST
      ?auto_10325 - PLACE
      ?auto_10324 - PLACE
      ?auto_10323 - HOIST
      ?auto_10322 - SURFACE
      ?auto_10342 - PLACE
      ?auto_10344 - HOIST
      ?auto_10336 - SURFACE
      ?auto_10332 - PLACE
      ?auto_10341 - HOIST
      ?auto_10331 - SURFACE
      ?auto_10330 - PLACE
      ?auto_10329 - HOIST
      ?auto_10346 - SURFACE
      ?auto_10335 - SURFACE
      ?auto_10343 - SURFACE
      ?auto_10338 - PLACE
      ?auto_10340 - HOIST
      ?auto_10337 - SURFACE
      ?auto_10339 - PLACE
      ?auto_10345 - HOIST
      ?auto_10328 - SURFACE
      ?auto_10333 - SURFACE
      ?auto_10334 - SURFACE
      ?auto_10326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10327 ?auto_10325 ) ( IS-CRATE ?auto_10321 ) ( not ( = ?auto_10324 ?auto_10325 ) ) ( HOIST-AT ?auto_10323 ?auto_10324 ) ( SURFACE-AT ?auto_10321 ?auto_10324 ) ( ON ?auto_10321 ?auto_10322 ) ( CLEAR ?auto_10321 ) ( not ( = ?auto_10318 ?auto_10321 ) ) ( not ( = ?auto_10318 ?auto_10322 ) ) ( not ( = ?auto_10321 ?auto_10322 ) ) ( not ( = ?auto_10327 ?auto_10323 ) ) ( IS-CRATE ?auto_10318 ) ( not ( = ?auto_10342 ?auto_10325 ) ) ( HOIST-AT ?auto_10344 ?auto_10342 ) ( SURFACE-AT ?auto_10318 ?auto_10342 ) ( ON ?auto_10318 ?auto_10336 ) ( CLEAR ?auto_10318 ) ( not ( = ?auto_10319 ?auto_10318 ) ) ( not ( = ?auto_10319 ?auto_10336 ) ) ( not ( = ?auto_10318 ?auto_10336 ) ) ( not ( = ?auto_10327 ?auto_10344 ) ) ( IS-CRATE ?auto_10319 ) ( not ( = ?auto_10332 ?auto_10325 ) ) ( HOIST-AT ?auto_10341 ?auto_10332 ) ( SURFACE-AT ?auto_10319 ?auto_10332 ) ( ON ?auto_10319 ?auto_10331 ) ( CLEAR ?auto_10319 ) ( not ( = ?auto_10320 ?auto_10319 ) ) ( not ( = ?auto_10320 ?auto_10331 ) ) ( not ( = ?auto_10319 ?auto_10331 ) ) ( not ( = ?auto_10327 ?auto_10341 ) ) ( IS-CRATE ?auto_10320 ) ( not ( = ?auto_10330 ?auto_10325 ) ) ( HOIST-AT ?auto_10329 ?auto_10330 ) ( AVAILABLE ?auto_10329 ) ( SURFACE-AT ?auto_10320 ?auto_10330 ) ( ON ?auto_10320 ?auto_10346 ) ( CLEAR ?auto_10320 ) ( not ( = ?auto_10317 ?auto_10320 ) ) ( not ( = ?auto_10317 ?auto_10346 ) ) ( not ( = ?auto_10320 ?auto_10346 ) ) ( not ( = ?auto_10327 ?auto_10329 ) ) ( IS-CRATE ?auto_10317 ) ( AVAILABLE ?auto_10341 ) ( SURFACE-AT ?auto_10317 ?auto_10332 ) ( ON ?auto_10317 ?auto_10335 ) ( CLEAR ?auto_10317 ) ( not ( = ?auto_10316 ?auto_10317 ) ) ( not ( = ?auto_10316 ?auto_10335 ) ) ( not ( = ?auto_10317 ?auto_10335 ) ) ( IS-CRATE ?auto_10316 ) ( AVAILABLE ?auto_10344 ) ( SURFACE-AT ?auto_10316 ?auto_10342 ) ( ON ?auto_10316 ?auto_10343 ) ( CLEAR ?auto_10316 ) ( not ( = ?auto_10315 ?auto_10316 ) ) ( not ( = ?auto_10315 ?auto_10343 ) ) ( not ( = ?auto_10316 ?auto_10343 ) ) ( IS-CRATE ?auto_10315 ) ( not ( = ?auto_10338 ?auto_10325 ) ) ( HOIST-AT ?auto_10340 ?auto_10338 ) ( SURFACE-AT ?auto_10315 ?auto_10338 ) ( ON ?auto_10315 ?auto_10337 ) ( CLEAR ?auto_10315 ) ( not ( = ?auto_10314 ?auto_10315 ) ) ( not ( = ?auto_10314 ?auto_10337 ) ) ( not ( = ?auto_10315 ?auto_10337 ) ) ( not ( = ?auto_10327 ?auto_10340 ) ) ( IS-CRATE ?auto_10314 ) ( not ( = ?auto_10339 ?auto_10325 ) ) ( HOIST-AT ?auto_10345 ?auto_10339 ) ( AVAILABLE ?auto_10345 ) ( SURFACE-AT ?auto_10314 ?auto_10339 ) ( ON ?auto_10314 ?auto_10328 ) ( CLEAR ?auto_10314 ) ( not ( = ?auto_10313 ?auto_10314 ) ) ( not ( = ?auto_10313 ?auto_10328 ) ) ( not ( = ?auto_10314 ?auto_10328 ) ) ( not ( = ?auto_10327 ?auto_10345 ) ) ( IS-CRATE ?auto_10313 ) ( AVAILABLE ?auto_10323 ) ( SURFACE-AT ?auto_10313 ?auto_10324 ) ( ON ?auto_10313 ?auto_10333 ) ( CLEAR ?auto_10313 ) ( not ( = ?auto_10312 ?auto_10313 ) ) ( not ( = ?auto_10312 ?auto_10333 ) ) ( not ( = ?auto_10313 ?auto_10333 ) ) ( SURFACE-AT ?auto_10311 ?auto_10325 ) ( CLEAR ?auto_10311 ) ( IS-CRATE ?auto_10312 ) ( AVAILABLE ?auto_10327 ) ( AVAILABLE ?auto_10340 ) ( SURFACE-AT ?auto_10312 ?auto_10338 ) ( ON ?auto_10312 ?auto_10334 ) ( CLEAR ?auto_10312 ) ( TRUCK-AT ?auto_10326 ?auto_10325 ) ( not ( = ?auto_10311 ?auto_10312 ) ) ( not ( = ?auto_10311 ?auto_10334 ) ) ( not ( = ?auto_10312 ?auto_10334 ) ) ( not ( = ?auto_10311 ?auto_10313 ) ) ( not ( = ?auto_10311 ?auto_10333 ) ) ( not ( = ?auto_10313 ?auto_10334 ) ) ( not ( = ?auto_10324 ?auto_10338 ) ) ( not ( = ?auto_10323 ?auto_10340 ) ) ( not ( = ?auto_10333 ?auto_10334 ) ) ( not ( = ?auto_10311 ?auto_10314 ) ) ( not ( = ?auto_10311 ?auto_10328 ) ) ( not ( = ?auto_10312 ?auto_10314 ) ) ( not ( = ?auto_10312 ?auto_10328 ) ) ( not ( = ?auto_10314 ?auto_10333 ) ) ( not ( = ?auto_10314 ?auto_10334 ) ) ( not ( = ?auto_10339 ?auto_10324 ) ) ( not ( = ?auto_10339 ?auto_10338 ) ) ( not ( = ?auto_10345 ?auto_10323 ) ) ( not ( = ?auto_10345 ?auto_10340 ) ) ( not ( = ?auto_10328 ?auto_10333 ) ) ( not ( = ?auto_10328 ?auto_10334 ) ) ( not ( = ?auto_10311 ?auto_10315 ) ) ( not ( = ?auto_10311 ?auto_10337 ) ) ( not ( = ?auto_10312 ?auto_10315 ) ) ( not ( = ?auto_10312 ?auto_10337 ) ) ( not ( = ?auto_10313 ?auto_10315 ) ) ( not ( = ?auto_10313 ?auto_10337 ) ) ( not ( = ?auto_10315 ?auto_10328 ) ) ( not ( = ?auto_10315 ?auto_10333 ) ) ( not ( = ?auto_10315 ?auto_10334 ) ) ( not ( = ?auto_10337 ?auto_10328 ) ) ( not ( = ?auto_10337 ?auto_10333 ) ) ( not ( = ?auto_10337 ?auto_10334 ) ) ( not ( = ?auto_10311 ?auto_10316 ) ) ( not ( = ?auto_10311 ?auto_10343 ) ) ( not ( = ?auto_10312 ?auto_10316 ) ) ( not ( = ?auto_10312 ?auto_10343 ) ) ( not ( = ?auto_10313 ?auto_10316 ) ) ( not ( = ?auto_10313 ?auto_10343 ) ) ( not ( = ?auto_10314 ?auto_10316 ) ) ( not ( = ?auto_10314 ?auto_10343 ) ) ( not ( = ?auto_10316 ?auto_10337 ) ) ( not ( = ?auto_10316 ?auto_10328 ) ) ( not ( = ?auto_10316 ?auto_10333 ) ) ( not ( = ?auto_10316 ?auto_10334 ) ) ( not ( = ?auto_10342 ?auto_10338 ) ) ( not ( = ?auto_10342 ?auto_10339 ) ) ( not ( = ?auto_10342 ?auto_10324 ) ) ( not ( = ?auto_10344 ?auto_10340 ) ) ( not ( = ?auto_10344 ?auto_10345 ) ) ( not ( = ?auto_10344 ?auto_10323 ) ) ( not ( = ?auto_10343 ?auto_10337 ) ) ( not ( = ?auto_10343 ?auto_10328 ) ) ( not ( = ?auto_10343 ?auto_10333 ) ) ( not ( = ?auto_10343 ?auto_10334 ) ) ( not ( = ?auto_10311 ?auto_10317 ) ) ( not ( = ?auto_10311 ?auto_10335 ) ) ( not ( = ?auto_10312 ?auto_10317 ) ) ( not ( = ?auto_10312 ?auto_10335 ) ) ( not ( = ?auto_10313 ?auto_10317 ) ) ( not ( = ?auto_10313 ?auto_10335 ) ) ( not ( = ?auto_10314 ?auto_10317 ) ) ( not ( = ?auto_10314 ?auto_10335 ) ) ( not ( = ?auto_10315 ?auto_10317 ) ) ( not ( = ?auto_10315 ?auto_10335 ) ) ( not ( = ?auto_10317 ?auto_10343 ) ) ( not ( = ?auto_10317 ?auto_10337 ) ) ( not ( = ?auto_10317 ?auto_10328 ) ) ( not ( = ?auto_10317 ?auto_10333 ) ) ( not ( = ?auto_10317 ?auto_10334 ) ) ( not ( = ?auto_10332 ?auto_10342 ) ) ( not ( = ?auto_10332 ?auto_10338 ) ) ( not ( = ?auto_10332 ?auto_10339 ) ) ( not ( = ?auto_10332 ?auto_10324 ) ) ( not ( = ?auto_10341 ?auto_10344 ) ) ( not ( = ?auto_10341 ?auto_10340 ) ) ( not ( = ?auto_10341 ?auto_10345 ) ) ( not ( = ?auto_10341 ?auto_10323 ) ) ( not ( = ?auto_10335 ?auto_10343 ) ) ( not ( = ?auto_10335 ?auto_10337 ) ) ( not ( = ?auto_10335 ?auto_10328 ) ) ( not ( = ?auto_10335 ?auto_10333 ) ) ( not ( = ?auto_10335 ?auto_10334 ) ) ( not ( = ?auto_10311 ?auto_10320 ) ) ( not ( = ?auto_10311 ?auto_10346 ) ) ( not ( = ?auto_10312 ?auto_10320 ) ) ( not ( = ?auto_10312 ?auto_10346 ) ) ( not ( = ?auto_10313 ?auto_10320 ) ) ( not ( = ?auto_10313 ?auto_10346 ) ) ( not ( = ?auto_10314 ?auto_10320 ) ) ( not ( = ?auto_10314 ?auto_10346 ) ) ( not ( = ?auto_10315 ?auto_10320 ) ) ( not ( = ?auto_10315 ?auto_10346 ) ) ( not ( = ?auto_10316 ?auto_10320 ) ) ( not ( = ?auto_10316 ?auto_10346 ) ) ( not ( = ?auto_10320 ?auto_10335 ) ) ( not ( = ?auto_10320 ?auto_10343 ) ) ( not ( = ?auto_10320 ?auto_10337 ) ) ( not ( = ?auto_10320 ?auto_10328 ) ) ( not ( = ?auto_10320 ?auto_10333 ) ) ( not ( = ?auto_10320 ?auto_10334 ) ) ( not ( = ?auto_10330 ?auto_10332 ) ) ( not ( = ?auto_10330 ?auto_10342 ) ) ( not ( = ?auto_10330 ?auto_10338 ) ) ( not ( = ?auto_10330 ?auto_10339 ) ) ( not ( = ?auto_10330 ?auto_10324 ) ) ( not ( = ?auto_10329 ?auto_10341 ) ) ( not ( = ?auto_10329 ?auto_10344 ) ) ( not ( = ?auto_10329 ?auto_10340 ) ) ( not ( = ?auto_10329 ?auto_10345 ) ) ( not ( = ?auto_10329 ?auto_10323 ) ) ( not ( = ?auto_10346 ?auto_10335 ) ) ( not ( = ?auto_10346 ?auto_10343 ) ) ( not ( = ?auto_10346 ?auto_10337 ) ) ( not ( = ?auto_10346 ?auto_10328 ) ) ( not ( = ?auto_10346 ?auto_10333 ) ) ( not ( = ?auto_10346 ?auto_10334 ) ) ( not ( = ?auto_10311 ?auto_10319 ) ) ( not ( = ?auto_10311 ?auto_10331 ) ) ( not ( = ?auto_10312 ?auto_10319 ) ) ( not ( = ?auto_10312 ?auto_10331 ) ) ( not ( = ?auto_10313 ?auto_10319 ) ) ( not ( = ?auto_10313 ?auto_10331 ) ) ( not ( = ?auto_10314 ?auto_10319 ) ) ( not ( = ?auto_10314 ?auto_10331 ) ) ( not ( = ?auto_10315 ?auto_10319 ) ) ( not ( = ?auto_10315 ?auto_10331 ) ) ( not ( = ?auto_10316 ?auto_10319 ) ) ( not ( = ?auto_10316 ?auto_10331 ) ) ( not ( = ?auto_10317 ?auto_10319 ) ) ( not ( = ?auto_10317 ?auto_10331 ) ) ( not ( = ?auto_10319 ?auto_10346 ) ) ( not ( = ?auto_10319 ?auto_10335 ) ) ( not ( = ?auto_10319 ?auto_10343 ) ) ( not ( = ?auto_10319 ?auto_10337 ) ) ( not ( = ?auto_10319 ?auto_10328 ) ) ( not ( = ?auto_10319 ?auto_10333 ) ) ( not ( = ?auto_10319 ?auto_10334 ) ) ( not ( = ?auto_10331 ?auto_10346 ) ) ( not ( = ?auto_10331 ?auto_10335 ) ) ( not ( = ?auto_10331 ?auto_10343 ) ) ( not ( = ?auto_10331 ?auto_10337 ) ) ( not ( = ?auto_10331 ?auto_10328 ) ) ( not ( = ?auto_10331 ?auto_10333 ) ) ( not ( = ?auto_10331 ?auto_10334 ) ) ( not ( = ?auto_10311 ?auto_10318 ) ) ( not ( = ?auto_10311 ?auto_10336 ) ) ( not ( = ?auto_10312 ?auto_10318 ) ) ( not ( = ?auto_10312 ?auto_10336 ) ) ( not ( = ?auto_10313 ?auto_10318 ) ) ( not ( = ?auto_10313 ?auto_10336 ) ) ( not ( = ?auto_10314 ?auto_10318 ) ) ( not ( = ?auto_10314 ?auto_10336 ) ) ( not ( = ?auto_10315 ?auto_10318 ) ) ( not ( = ?auto_10315 ?auto_10336 ) ) ( not ( = ?auto_10316 ?auto_10318 ) ) ( not ( = ?auto_10316 ?auto_10336 ) ) ( not ( = ?auto_10317 ?auto_10318 ) ) ( not ( = ?auto_10317 ?auto_10336 ) ) ( not ( = ?auto_10320 ?auto_10318 ) ) ( not ( = ?auto_10320 ?auto_10336 ) ) ( not ( = ?auto_10318 ?auto_10331 ) ) ( not ( = ?auto_10318 ?auto_10346 ) ) ( not ( = ?auto_10318 ?auto_10335 ) ) ( not ( = ?auto_10318 ?auto_10343 ) ) ( not ( = ?auto_10318 ?auto_10337 ) ) ( not ( = ?auto_10318 ?auto_10328 ) ) ( not ( = ?auto_10318 ?auto_10333 ) ) ( not ( = ?auto_10318 ?auto_10334 ) ) ( not ( = ?auto_10336 ?auto_10331 ) ) ( not ( = ?auto_10336 ?auto_10346 ) ) ( not ( = ?auto_10336 ?auto_10335 ) ) ( not ( = ?auto_10336 ?auto_10343 ) ) ( not ( = ?auto_10336 ?auto_10337 ) ) ( not ( = ?auto_10336 ?auto_10328 ) ) ( not ( = ?auto_10336 ?auto_10333 ) ) ( not ( = ?auto_10336 ?auto_10334 ) ) ( not ( = ?auto_10311 ?auto_10321 ) ) ( not ( = ?auto_10311 ?auto_10322 ) ) ( not ( = ?auto_10312 ?auto_10321 ) ) ( not ( = ?auto_10312 ?auto_10322 ) ) ( not ( = ?auto_10313 ?auto_10321 ) ) ( not ( = ?auto_10313 ?auto_10322 ) ) ( not ( = ?auto_10314 ?auto_10321 ) ) ( not ( = ?auto_10314 ?auto_10322 ) ) ( not ( = ?auto_10315 ?auto_10321 ) ) ( not ( = ?auto_10315 ?auto_10322 ) ) ( not ( = ?auto_10316 ?auto_10321 ) ) ( not ( = ?auto_10316 ?auto_10322 ) ) ( not ( = ?auto_10317 ?auto_10321 ) ) ( not ( = ?auto_10317 ?auto_10322 ) ) ( not ( = ?auto_10320 ?auto_10321 ) ) ( not ( = ?auto_10320 ?auto_10322 ) ) ( not ( = ?auto_10319 ?auto_10321 ) ) ( not ( = ?auto_10319 ?auto_10322 ) ) ( not ( = ?auto_10321 ?auto_10336 ) ) ( not ( = ?auto_10321 ?auto_10331 ) ) ( not ( = ?auto_10321 ?auto_10346 ) ) ( not ( = ?auto_10321 ?auto_10335 ) ) ( not ( = ?auto_10321 ?auto_10343 ) ) ( not ( = ?auto_10321 ?auto_10337 ) ) ( not ( = ?auto_10321 ?auto_10328 ) ) ( not ( = ?auto_10321 ?auto_10333 ) ) ( not ( = ?auto_10321 ?auto_10334 ) ) ( not ( = ?auto_10322 ?auto_10336 ) ) ( not ( = ?auto_10322 ?auto_10331 ) ) ( not ( = ?auto_10322 ?auto_10346 ) ) ( not ( = ?auto_10322 ?auto_10335 ) ) ( not ( = ?auto_10322 ?auto_10343 ) ) ( not ( = ?auto_10322 ?auto_10337 ) ) ( not ( = ?auto_10322 ?auto_10328 ) ) ( not ( = ?auto_10322 ?auto_10333 ) ) ( not ( = ?auto_10322 ?auto_10334 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_10311 ?auto_10312 ?auto_10313 ?auto_10314 ?auto_10315 ?auto_10316 ?auto_10317 ?auto_10320 ?auto_10319 ?auto_10318 )
      ( MAKE-1CRATE ?auto_10318 ?auto_10321 )
      ( MAKE-10CRATE-VERIFY ?auto_10311 ?auto_10312 ?auto_10313 ?auto_10314 ?auto_10315 ?auto_10316 ?auto_10317 ?auto_10320 ?auto_10319 ?auto_10318 ?auto_10321 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10349 - SURFACE
      ?auto_10350 - SURFACE
    )
    :vars
    (
      ?auto_10351 - HOIST
      ?auto_10352 - PLACE
      ?auto_10354 - PLACE
      ?auto_10355 - HOIST
      ?auto_10356 - SURFACE
      ?auto_10353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10351 ?auto_10352 ) ( SURFACE-AT ?auto_10349 ?auto_10352 ) ( CLEAR ?auto_10349 ) ( IS-CRATE ?auto_10350 ) ( AVAILABLE ?auto_10351 ) ( not ( = ?auto_10354 ?auto_10352 ) ) ( HOIST-AT ?auto_10355 ?auto_10354 ) ( AVAILABLE ?auto_10355 ) ( SURFACE-AT ?auto_10350 ?auto_10354 ) ( ON ?auto_10350 ?auto_10356 ) ( CLEAR ?auto_10350 ) ( TRUCK-AT ?auto_10353 ?auto_10352 ) ( not ( = ?auto_10349 ?auto_10350 ) ) ( not ( = ?auto_10349 ?auto_10356 ) ) ( not ( = ?auto_10350 ?auto_10356 ) ) ( not ( = ?auto_10351 ?auto_10355 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10353 ?auto_10352 ?auto_10354 )
      ( !LIFT ?auto_10355 ?auto_10350 ?auto_10356 ?auto_10354 )
      ( !LOAD ?auto_10355 ?auto_10350 ?auto_10353 ?auto_10354 )
      ( !DRIVE ?auto_10353 ?auto_10354 ?auto_10352 )
      ( !UNLOAD ?auto_10351 ?auto_10350 ?auto_10353 ?auto_10352 )
      ( !DROP ?auto_10351 ?auto_10350 ?auto_10349 ?auto_10352 )
      ( MAKE-1CRATE-VERIFY ?auto_10349 ?auto_10350 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_10369 - SURFACE
      ?auto_10370 - SURFACE
      ?auto_10371 - SURFACE
      ?auto_10372 - SURFACE
      ?auto_10373 - SURFACE
      ?auto_10374 - SURFACE
      ?auto_10375 - SURFACE
      ?auto_10378 - SURFACE
      ?auto_10377 - SURFACE
      ?auto_10376 - SURFACE
      ?auto_10379 - SURFACE
      ?auto_10380 - SURFACE
    )
    :vars
    (
      ?auto_10386 - HOIST
      ?auto_10382 - PLACE
      ?auto_10384 - PLACE
      ?auto_10381 - HOIST
      ?auto_10383 - SURFACE
      ?auto_10389 - PLACE
      ?auto_10387 - HOIST
      ?auto_10390 - SURFACE
      ?auto_10401 - PLACE
      ?auto_10396 - HOIST
      ?auto_10391 - SURFACE
      ?auto_10400 - PLACE
      ?auto_10404 - HOIST
      ?auto_10395 - SURFACE
      ?auto_10397 - PLACE
      ?auto_10402 - HOIST
      ?auto_10394 - SURFACE
      ?auto_10388 - SURFACE
      ?auto_10405 - SURFACE
      ?auto_10406 - SURFACE
      ?auto_10398 - PLACE
      ?auto_10399 - HOIST
      ?auto_10393 - SURFACE
      ?auto_10392 - SURFACE
      ?auto_10403 - SURFACE
      ?auto_10385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10386 ?auto_10382 ) ( IS-CRATE ?auto_10380 ) ( not ( = ?auto_10384 ?auto_10382 ) ) ( HOIST-AT ?auto_10381 ?auto_10384 ) ( SURFACE-AT ?auto_10380 ?auto_10384 ) ( ON ?auto_10380 ?auto_10383 ) ( CLEAR ?auto_10380 ) ( not ( = ?auto_10379 ?auto_10380 ) ) ( not ( = ?auto_10379 ?auto_10383 ) ) ( not ( = ?auto_10380 ?auto_10383 ) ) ( not ( = ?auto_10386 ?auto_10381 ) ) ( IS-CRATE ?auto_10379 ) ( not ( = ?auto_10389 ?auto_10382 ) ) ( HOIST-AT ?auto_10387 ?auto_10389 ) ( SURFACE-AT ?auto_10379 ?auto_10389 ) ( ON ?auto_10379 ?auto_10390 ) ( CLEAR ?auto_10379 ) ( not ( = ?auto_10376 ?auto_10379 ) ) ( not ( = ?auto_10376 ?auto_10390 ) ) ( not ( = ?auto_10379 ?auto_10390 ) ) ( not ( = ?auto_10386 ?auto_10387 ) ) ( IS-CRATE ?auto_10376 ) ( not ( = ?auto_10401 ?auto_10382 ) ) ( HOIST-AT ?auto_10396 ?auto_10401 ) ( SURFACE-AT ?auto_10376 ?auto_10401 ) ( ON ?auto_10376 ?auto_10391 ) ( CLEAR ?auto_10376 ) ( not ( = ?auto_10377 ?auto_10376 ) ) ( not ( = ?auto_10377 ?auto_10391 ) ) ( not ( = ?auto_10376 ?auto_10391 ) ) ( not ( = ?auto_10386 ?auto_10396 ) ) ( IS-CRATE ?auto_10377 ) ( not ( = ?auto_10400 ?auto_10382 ) ) ( HOIST-AT ?auto_10404 ?auto_10400 ) ( SURFACE-AT ?auto_10377 ?auto_10400 ) ( ON ?auto_10377 ?auto_10395 ) ( CLEAR ?auto_10377 ) ( not ( = ?auto_10378 ?auto_10377 ) ) ( not ( = ?auto_10378 ?auto_10395 ) ) ( not ( = ?auto_10377 ?auto_10395 ) ) ( not ( = ?auto_10386 ?auto_10404 ) ) ( IS-CRATE ?auto_10378 ) ( not ( = ?auto_10397 ?auto_10382 ) ) ( HOIST-AT ?auto_10402 ?auto_10397 ) ( AVAILABLE ?auto_10402 ) ( SURFACE-AT ?auto_10378 ?auto_10397 ) ( ON ?auto_10378 ?auto_10394 ) ( CLEAR ?auto_10378 ) ( not ( = ?auto_10375 ?auto_10378 ) ) ( not ( = ?auto_10375 ?auto_10394 ) ) ( not ( = ?auto_10378 ?auto_10394 ) ) ( not ( = ?auto_10386 ?auto_10402 ) ) ( IS-CRATE ?auto_10375 ) ( AVAILABLE ?auto_10404 ) ( SURFACE-AT ?auto_10375 ?auto_10400 ) ( ON ?auto_10375 ?auto_10388 ) ( CLEAR ?auto_10375 ) ( not ( = ?auto_10374 ?auto_10375 ) ) ( not ( = ?auto_10374 ?auto_10388 ) ) ( not ( = ?auto_10375 ?auto_10388 ) ) ( IS-CRATE ?auto_10374 ) ( AVAILABLE ?auto_10396 ) ( SURFACE-AT ?auto_10374 ?auto_10401 ) ( ON ?auto_10374 ?auto_10405 ) ( CLEAR ?auto_10374 ) ( not ( = ?auto_10373 ?auto_10374 ) ) ( not ( = ?auto_10373 ?auto_10405 ) ) ( not ( = ?auto_10374 ?auto_10405 ) ) ( IS-CRATE ?auto_10373 ) ( SURFACE-AT ?auto_10373 ?auto_10384 ) ( ON ?auto_10373 ?auto_10406 ) ( CLEAR ?auto_10373 ) ( not ( = ?auto_10372 ?auto_10373 ) ) ( not ( = ?auto_10372 ?auto_10406 ) ) ( not ( = ?auto_10373 ?auto_10406 ) ) ( IS-CRATE ?auto_10372 ) ( not ( = ?auto_10398 ?auto_10382 ) ) ( HOIST-AT ?auto_10399 ?auto_10398 ) ( AVAILABLE ?auto_10399 ) ( SURFACE-AT ?auto_10372 ?auto_10398 ) ( ON ?auto_10372 ?auto_10393 ) ( CLEAR ?auto_10372 ) ( not ( = ?auto_10371 ?auto_10372 ) ) ( not ( = ?auto_10371 ?auto_10393 ) ) ( not ( = ?auto_10372 ?auto_10393 ) ) ( not ( = ?auto_10386 ?auto_10399 ) ) ( IS-CRATE ?auto_10371 ) ( AVAILABLE ?auto_10387 ) ( SURFACE-AT ?auto_10371 ?auto_10389 ) ( ON ?auto_10371 ?auto_10392 ) ( CLEAR ?auto_10371 ) ( not ( = ?auto_10370 ?auto_10371 ) ) ( not ( = ?auto_10370 ?auto_10392 ) ) ( not ( = ?auto_10371 ?auto_10392 ) ) ( SURFACE-AT ?auto_10369 ?auto_10382 ) ( CLEAR ?auto_10369 ) ( IS-CRATE ?auto_10370 ) ( AVAILABLE ?auto_10386 ) ( AVAILABLE ?auto_10381 ) ( SURFACE-AT ?auto_10370 ?auto_10384 ) ( ON ?auto_10370 ?auto_10403 ) ( CLEAR ?auto_10370 ) ( TRUCK-AT ?auto_10385 ?auto_10382 ) ( not ( = ?auto_10369 ?auto_10370 ) ) ( not ( = ?auto_10369 ?auto_10403 ) ) ( not ( = ?auto_10370 ?auto_10403 ) ) ( not ( = ?auto_10369 ?auto_10371 ) ) ( not ( = ?auto_10369 ?auto_10392 ) ) ( not ( = ?auto_10371 ?auto_10403 ) ) ( not ( = ?auto_10389 ?auto_10384 ) ) ( not ( = ?auto_10387 ?auto_10381 ) ) ( not ( = ?auto_10392 ?auto_10403 ) ) ( not ( = ?auto_10369 ?auto_10372 ) ) ( not ( = ?auto_10369 ?auto_10393 ) ) ( not ( = ?auto_10370 ?auto_10372 ) ) ( not ( = ?auto_10370 ?auto_10393 ) ) ( not ( = ?auto_10372 ?auto_10392 ) ) ( not ( = ?auto_10372 ?auto_10403 ) ) ( not ( = ?auto_10398 ?auto_10389 ) ) ( not ( = ?auto_10398 ?auto_10384 ) ) ( not ( = ?auto_10399 ?auto_10387 ) ) ( not ( = ?auto_10399 ?auto_10381 ) ) ( not ( = ?auto_10393 ?auto_10392 ) ) ( not ( = ?auto_10393 ?auto_10403 ) ) ( not ( = ?auto_10369 ?auto_10373 ) ) ( not ( = ?auto_10369 ?auto_10406 ) ) ( not ( = ?auto_10370 ?auto_10373 ) ) ( not ( = ?auto_10370 ?auto_10406 ) ) ( not ( = ?auto_10371 ?auto_10373 ) ) ( not ( = ?auto_10371 ?auto_10406 ) ) ( not ( = ?auto_10373 ?auto_10393 ) ) ( not ( = ?auto_10373 ?auto_10392 ) ) ( not ( = ?auto_10373 ?auto_10403 ) ) ( not ( = ?auto_10406 ?auto_10393 ) ) ( not ( = ?auto_10406 ?auto_10392 ) ) ( not ( = ?auto_10406 ?auto_10403 ) ) ( not ( = ?auto_10369 ?auto_10374 ) ) ( not ( = ?auto_10369 ?auto_10405 ) ) ( not ( = ?auto_10370 ?auto_10374 ) ) ( not ( = ?auto_10370 ?auto_10405 ) ) ( not ( = ?auto_10371 ?auto_10374 ) ) ( not ( = ?auto_10371 ?auto_10405 ) ) ( not ( = ?auto_10372 ?auto_10374 ) ) ( not ( = ?auto_10372 ?auto_10405 ) ) ( not ( = ?auto_10374 ?auto_10406 ) ) ( not ( = ?auto_10374 ?auto_10393 ) ) ( not ( = ?auto_10374 ?auto_10392 ) ) ( not ( = ?auto_10374 ?auto_10403 ) ) ( not ( = ?auto_10401 ?auto_10384 ) ) ( not ( = ?auto_10401 ?auto_10398 ) ) ( not ( = ?auto_10401 ?auto_10389 ) ) ( not ( = ?auto_10396 ?auto_10381 ) ) ( not ( = ?auto_10396 ?auto_10399 ) ) ( not ( = ?auto_10396 ?auto_10387 ) ) ( not ( = ?auto_10405 ?auto_10406 ) ) ( not ( = ?auto_10405 ?auto_10393 ) ) ( not ( = ?auto_10405 ?auto_10392 ) ) ( not ( = ?auto_10405 ?auto_10403 ) ) ( not ( = ?auto_10369 ?auto_10375 ) ) ( not ( = ?auto_10369 ?auto_10388 ) ) ( not ( = ?auto_10370 ?auto_10375 ) ) ( not ( = ?auto_10370 ?auto_10388 ) ) ( not ( = ?auto_10371 ?auto_10375 ) ) ( not ( = ?auto_10371 ?auto_10388 ) ) ( not ( = ?auto_10372 ?auto_10375 ) ) ( not ( = ?auto_10372 ?auto_10388 ) ) ( not ( = ?auto_10373 ?auto_10375 ) ) ( not ( = ?auto_10373 ?auto_10388 ) ) ( not ( = ?auto_10375 ?auto_10405 ) ) ( not ( = ?auto_10375 ?auto_10406 ) ) ( not ( = ?auto_10375 ?auto_10393 ) ) ( not ( = ?auto_10375 ?auto_10392 ) ) ( not ( = ?auto_10375 ?auto_10403 ) ) ( not ( = ?auto_10400 ?auto_10401 ) ) ( not ( = ?auto_10400 ?auto_10384 ) ) ( not ( = ?auto_10400 ?auto_10398 ) ) ( not ( = ?auto_10400 ?auto_10389 ) ) ( not ( = ?auto_10404 ?auto_10396 ) ) ( not ( = ?auto_10404 ?auto_10381 ) ) ( not ( = ?auto_10404 ?auto_10399 ) ) ( not ( = ?auto_10404 ?auto_10387 ) ) ( not ( = ?auto_10388 ?auto_10405 ) ) ( not ( = ?auto_10388 ?auto_10406 ) ) ( not ( = ?auto_10388 ?auto_10393 ) ) ( not ( = ?auto_10388 ?auto_10392 ) ) ( not ( = ?auto_10388 ?auto_10403 ) ) ( not ( = ?auto_10369 ?auto_10378 ) ) ( not ( = ?auto_10369 ?auto_10394 ) ) ( not ( = ?auto_10370 ?auto_10378 ) ) ( not ( = ?auto_10370 ?auto_10394 ) ) ( not ( = ?auto_10371 ?auto_10378 ) ) ( not ( = ?auto_10371 ?auto_10394 ) ) ( not ( = ?auto_10372 ?auto_10378 ) ) ( not ( = ?auto_10372 ?auto_10394 ) ) ( not ( = ?auto_10373 ?auto_10378 ) ) ( not ( = ?auto_10373 ?auto_10394 ) ) ( not ( = ?auto_10374 ?auto_10378 ) ) ( not ( = ?auto_10374 ?auto_10394 ) ) ( not ( = ?auto_10378 ?auto_10388 ) ) ( not ( = ?auto_10378 ?auto_10405 ) ) ( not ( = ?auto_10378 ?auto_10406 ) ) ( not ( = ?auto_10378 ?auto_10393 ) ) ( not ( = ?auto_10378 ?auto_10392 ) ) ( not ( = ?auto_10378 ?auto_10403 ) ) ( not ( = ?auto_10397 ?auto_10400 ) ) ( not ( = ?auto_10397 ?auto_10401 ) ) ( not ( = ?auto_10397 ?auto_10384 ) ) ( not ( = ?auto_10397 ?auto_10398 ) ) ( not ( = ?auto_10397 ?auto_10389 ) ) ( not ( = ?auto_10402 ?auto_10404 ) ) ( not ( = ?auto_10402 ?auto_10396 ) ) ( not ( = ?auto_10402 ?auto_10381 ) ) ( not ( = ?auto_10402 ?auto_10399 ) ) ( not ( = ?auto_10402 ?auto_10387 ) ) ( not ( = ?auto_10394 ?auto_10388 ) ) ( not ( = ?auto_10394 ?auto_10405 ) ) ( not ( = ?auto_10394 ?auto_10406 ) ) ( not ( = ?auto_10394 ?auto_10393 ) ) ( not ( = ?auto_10394 ?auto_10392 ) ) ( not ( = ?auto_10394 ?auto_10403 ) ) ( not ( = ?auto_10369 ?auto_10377 ) ) ( not ( = ?auto_10369 ?auto_10395 ) ) ( not ( = ?auto_10370 ?auto_10377 ) ) ( not ( = ?auto_10370 ?auto_10395 ) ) ( not ( = ?auto_10371 ?auto_10377 ) ) ( not ( = ?auto_10371 ?auto_10395 ) ) ( not ( = ?auto_10372 ?auto_10377 ) ) ( not ( = ?auto_10372 ?auto_10395 ) ) ( not ( = ?auto_10373 ?auto_10377 ) ) ( not ( = ?auto_10373 ?auto_10395 ) ) ( not ( = ?auto_10374 ?auto_10377 ) ) ( not ( = ?auto_10374 ?auto_10395 ) ) ( not ( = ?auto_10375 ?auto_10377 ) ) ( not ( = ?auto_10375 ?auto_10395 ) ) ( not ( = ?auto_10377 ?auto_10394 ) ) ( not ( = ?auto_10377 ?auto_10388 ) ) ( not ( = ?auto_10377 ?auto_10405 ) ) ( not ( = ?auto_10377 ?auto_10406 ) ) ( not ( = ?auto_10377 ?auto_10393 ) ) ( not ( = ?auto_10377 ?auto_10392 ) ) ( not ( = ?auto_10377 ?auto_10403 ) ) ( not ( = ?auto_10395 ?auto_10394 ) ) ( not ( = ?auto_10395 ?auto_10388 ) ) ( not ( = ?auto_10395 ?auto_10405 ) ) ( not ( = ?auto_10395 ?auto_10406 ) ) ( not ( = ?auto_10395 ?auto_10393 ) ) ( not ( = ?auto_10395 ?auto_10392 ) ) ( not ( = ?auto_10395 ?auto_10403 ) ) ( not ( = ?auto_10369 ?auto_10376 ) ) ( not ( = ?auto_10369 ?auto_10391 ) ) ( not ( = ?auto_10370 ?auto_10376 ) ) ( not ( = ?auto_10370 ?auto_10391 ) ) ( not ( = ?auto_10371 ?auto_10376 ) ) ( not ( = ?auto_10371 ?auto_10391 ) ) ( not ( = ?auto_10372 ?auto_10376 ) ) ( not ( = ?auto_10372 ?auto_10391 ) ) ( not ( = ?auto_10373 ?auto_10376 ) ) ( not ( = ?auto_10373 ?auto_10391 ) ) ( not ( = ?auto_10374 ?auto_10376 ) ) ( not ( = ?auto_10374 ?auto_10391 ) ) ( not ( = ?auto_10375 ?auto_10376 ) ) ( not ( = ?auto_10375 ?auto_10391 ) ) ( not ( = ?auto_10378 ?auto_10376 ) ) ( not ( = ?auto_10378 ?auto_10391 ) ) ( not ( = ?auto_10376 ?auto_10395 ) ) ( not ( = ?auto_10376 ?auto_10394 ) ) ( not ( = ?auto_10376 ?auto_10388 ) ) ( not ( = ?auto_10376 ?auto_10405 ) ) ( not ( = ?auto_10376 ?auto_10406 ) ) ( not ( = ?auto_10376 ?auto_10393 ) ) ( not ( = ?auto_10376 ?auto_10392 ) ) ( not ( = ?auto_10376 ?auto_10403 ) ) ( not ( = ?auto_10391 ?auto_10395 ) ) ( not ( = ?auto_10391 ?auto_10394 ) ) ( not ( = ?auto_10391 ?auto_10388 ) ) ( not ( = ?auto_10391 ?auto_10405 ) ) ( not ( = ?auto_10391 ?auto_10406 ) ) ( not ( = ?auto_10391 ?auto_10393 ) ) ( not ( = ?auto_10391 ?auto_10392 ) ) ( not ( = ?auto_10391 ?auto_10403 ) ) ( not ( = ?auto_10369 ?auto_10379 ) ) ( not ( = ?auto_10369 ?auto_10390 ) ) ( not ( = ?auto_10370 ?auto_10379 ) ) ( not ( = ?auto_10370 ?auto_10390 ) ) ( not ( = ?auto_10371 ?auto_10379 ) ) ( not ( = ?auto_10371 ?auto_10390 ) ) ( not ( = ?auto_10372 ?auto_10379 ) ) ( not ( = ?auto_10372 ?auto_10390 ) ) ( not ( = ?auto_10373 ?auto_10379 ) ) ( not ( = ?auto_10373 ?auto_10390 ) ) ( not ( = ?auto_10374 ?auto_10379 ) ) ( not ( = ?auto_10374 ?auto_10390 ) ) ( not ( = ?auto_10375 ?auto_10379 ) ) ( not ( = ?auto_10375 ?auto_10390 ) ) ( not ( = ?auto_10378 ?auto_10379 ) ) ( not ( = ?auto_10378 ?auto_10390 ) ) ( not ( = ?auto_10377 ?auto_10379 ) ) ( not ( = ?auto_10377 ?auto_10390 ) ) ( not ( = ?auto_10379 ?auto_10391 ) ) ( not ( = ?auto_10379 ?auto_10395 ) ) ( not ( = ?auto_10379 ?auto_10394 ) ) ( not ( = ?auto_10379 ?auto_10388 ) ) ( not ( = ?auto_10379 ?auto_10405 ) ) ( not ( = ?auto_10379 ?auto_10406 ) ) ( not ( = ?auto_10379 ?auto_10393 ) ) ( not ( = ?auto_10379 ?auto_10392 ) ) ( not ( = ?auto_10379 ?auto_10403 ) ) ( not ( = ?auto_10390 ?auto_10391 ) ) ( not ( = ?auto_10390 ?auto_10395 ) ) ( not ( = ?auto_10390 ?auto_10394 ) ) ( not ( = ?auto_10390 ?auto_10388 ) ) ( not ( = ?auto_10390 ?auto_10405 ) ) ( not ( = ?auto_10390 ?auto_10406 ) ) ( not ( = ?auto_10390 ?auto_10393 ) ) ( not ( = ?auto_10390 ?auto_10392 ) ) ( not ( = ?auto_10390 ?auto_10403 ) ) ( not ( = ?auto_10369 ?auto_10380 ) ) ( not ( = ?auto_10369 ?auto_10383 ) ) ( not ( = ?auto_10370 ?auto_10380 ) ) ( not ( = ?auto_10370 ?auto_10383 ) ) ( not ( = ?auto_10371 ?auto_10380 ) ) ( not ( = ?auto_10371 ?auto_10383 ) ) ( not ( = ?auto_10372 ?auto_10380 ) ) ( not ( = ?auto_10372 ?auto_10383 ) ) ( not ( = ?auto_10373 ?auto_10380 ) ) ( not ( = ?auto_10373 ?auto_10383 ) ) ( not ( = ?auto_10374 ?auto_10380 ) ) ( not ( = ?auto_10374 ?auto_10383 ) ) ( not ( = ?auto_10375 ?auto_10380 ) ) ( not ( = ?auto_10375 ?auto_10383 ) ) ( not ( = ?auto_10378 ?auto_10380 ) ) ( not ( = ?auto_10378 ?auto_10383 ) ) ( not ( = ?auto_10377 ?auto_10380 ) ) ( not ( = ?auto_10377 ?auto_10383 ) ) ( not ( = ?auto_10376 ?auto_10380 ) ) ( not ( = ?auto_10376 ?auto_10383 ) ) ( not ( = ?auto_10380 ?auto_10390 ) ) ( not ( = ?auto_10380 ?auto_10391 ) ) ( not ( = ?auto_10380 ?auto_10395 ) ) ( not ( = ?auto_10380 ?auto_10394 ) ) ( not ( = ?auto_10380 ?auto_10388 ) ) ( not ( = ?auto_10380 ?auto_10405 ) ) ( not ( = ?auto_10380 ?auto_10406 ) ) ( not ( = ?auto_10380 ?auto_10393 ) ) ( not ( = ?auto_10380 ?auto_10392 ) ) ( not ( = ?auto_10380 ?auto_10403 ) ) ( not ( = ?auto_10383 ?auto_10390 ) ) ( not ( = ?auto_10383 ?auto_10391 ) ) ( not ( = ?auto_10383 ?auto_10395 ) ) ( not ( = ?auto_10383 ?auto_10394 ) ) ( not ( = ?auto_10383 ?auto_10388 ) ) ( not ( = ?auto_10383 ?auto_10405 ) ) ( not ( = ?auto_10383 ?auto_10406 ) ) ( not ( = ?auto_10383 ?auto_10393 ) ) ( not ( = ?auto_10383 ?auto_10392 ) ) ( not ( = ?auto_10383 ?auto_10403 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_10369 ?auto_10370 ?auto_10371 ?auto_10372 ?auto_10373 ?auto_10374 ?auto_10375 ?auto_10378 ?auto_10377 ?auto_10376 ?auto_10379 )
      ( MAKE-1CRATE ?auto_10379 ?auto_10380 )
      ( MAKE-11CRATE-VERIFY ?auto_10369 ?auto_10370 ?auto_10371 ?auto_10372 ?auto_10373 ?auto_10374 ?auto_10375 ?auto_10378 ?auto_10377 ?auto_10376 ?auto_10379 ?auto_10380 ) )
  )

)

