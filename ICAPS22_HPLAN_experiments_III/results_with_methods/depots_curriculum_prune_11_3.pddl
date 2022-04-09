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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9981 - SURFACE
      ?auto_9982 - SURFACE
      ?auto_9983 - SURFACE
    )
    :vars
    (
      ?auto_9988 - HOIST
      ?auto_9989 - PLACE
      ?auto_9985 - PLACE
      ?auto_9984 - HOIST
      ?auto_9986 - SURFACE
      ?auto_9991 - PLACE
      ?auto_9992 - HOIST
      ?auto_9990 - SURFACE
      ?auto_9987 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9988 ?auto_9989 ) ( IS-CRATE ?auto_9983 ) ( not ( = ?auto_9985 ?auto_9989 ) ) ( HOIST-AT ?auto_9984 ?auto_9985 ) ( AVAILABLE ?auto_9984 ) ( SURFACE-AT ?auto_9983 ?auto_9985 ) ( ON ?auto_9983 ?auto_9986 ) ( CLEAR ?auto_9983 ) ( not ( = ?auto_9982 ?auto_9983 ) ) ( not ( = ?auto_9982 ?auto_9986 ) ) ( not ( = ?auto_9983 ?auto_9986 ) ) ( not ( = ?auto_9988 ?auto_9984 ) ) ( SURFACE-AT ?auto_9981 ?auto_9989 ) ( CLEAR ?auto_9981 ) ( IS-CRATE ?auto_9982 ) ( AVAILABLE ?auto_9988 ) ( not ( = ?auto_9991 ?auto_9989 ) ) ( HOIST-AT ?auto_9992 ?auto_9991 ) ( AVAILABLE ?auto_9992 ) ( SURFACE-AT ?auto_9982 ?auto_9991 ) ( ON ?auto_9982 ?auto_9990 ) ( CLEAR ?auto_9982 ) ( TRUCK-AT ?auto_9987 ?auto_9989 ) ( not ( = ?auto_9981 ?auto_9982 ) ) ( not ( = ?auto_9981 ?auto_9990 ) ) ( not ( = ?auto_9982 ?auto_9990 ) ) ( not ( = ?auto_9988 ?auto_9992 ) ) ( not ( = ?auto_9981 ?auto_9983 ) ) ( not ( = ?auto_9981 ?auto_9986 ) ) ( not ( = ?auto_9983 ?auto_9990 ) ) ( not ( = ?auto_9985 ?auto_9991 ) ) ( not ( = ?auto_9984 ?auto_9992 ) ) ( not ( = ?auto_9986 ?auto_9990 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9981 ?auto_9982 )
      ( MAKE-1CRATE ?auto_9982 ?auto_9983 )
      ( MAKE-2CRATE-VERIFY ?auto_9981 ?auto_9982 ?auto_9983 ) )
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
      ?auto_10011 - HOIST
      ?auto_10014 - PLACE
      ?auto_10012 - PLACE
      ?auto_10013 - HOIST
      ?auto_10015 - SURFACE
      ?auto_10021 - PLACE
      ?auto_10022 - HOIST
      ?auto_10017 - SURFACE
      ?auto_10019 - PLACE
      ?auto_10018 - HOIST
      ?auto_10020 - SURFACE
      ?auto_10016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10011 ?auto_10014 ) ( IS-CRATE ?auto_10010 ) ( not ( = ?auto_10012 ?auto_10014 ) ) ( HOIST-AT ?auto_10013 ?auto_10012 ) ( AVAILABLE ?auto_10013 ) ( SURFACE-AT ?auto_10010 ?auto_10012 ) ( ON ?auto_10010 ?auto_10015 ) ( CLEAR ?auto_10010 ) ( not ( = ?auto_10009 ?auto_10010 ) ) ( not ( = ?auto_10009 ?auto_10015 ) ) ( not ( = ?auto_10010 ?auto_10015 ) ) ( not ( = ?auto_10011 ?auto_10013 ) ) ( IS-CRATE ?auto_10009 ) ( not ( = ?auto_10021 ?auto_10014 ) ) ( HOIST-AT ?auto_10022 ?auto_10021 ) ( AVAILABLE ?auto_10022 ) ( SURFACE-AT ?auto_10009 ?auto_10021 ) ( ON ?auto_10009 ?auto_10017 ) ( CLEAR ?auto_10009 ) ( not ( = ?auto_10008 ?auto_10009 ) ) ( not ( = ?auto_10008 ?auto_10017 ) ) ( not ( = ?auto_10009 ?auto_10017 ) ) ( not ( = ?auto_10011 ?auto_10022 ) ) ( SURFACE-AT ?auto_10007 ?auto_10014 ) ( CLEAR ?auto_10007 ) ( IS-CRATE ?auto_10008 ) ( AVAILABLE ?auto_10011 ) ( not ( = ?auto_10019 ?auto_10014 ) ) ( HOIST-AT ?auto_10018 ?auto_10019 ) ( AVAILABLE ?auto_10018 ) ( SURFACE-AT ?auto_10008 ?auto_10019 ) ( ON ?auto_10008 ?auto_10020 ) ( CLEAR ?auto_10008 ) ( TRUCK-AT ?auto_10016 ?auto_10014 ) ( not ( = ?auto_10007 ?auto_10008 ) ) ( not ( = ?auto_10007 ?auto_10020 ) ) ( not ( = ?auto_10008 ?auto_10020 ) ) ( not ( = ?auto_10011 ?auto_10018 ) ) ( not ( = ?auto_10007 ?auto_10009 ) ) ( not ( = ?auto_10007 ?auto_10017 ) ) ( not ( = ?auto_10009 ?auto_10020 ) ) ( not ( = ?auto_10021 ?auto_10019 ) ) ( not ( = ?auto_10022 ?auto_10018 ) ) ( not ( = ?auto_10017 ?auto_10020 ) ) ( not ( = ?auto_10007 ?auto_10010 ) ) ( not ( = ?auto_10007 ?auto_10015 ) ) ( not ( = ?auto_10008 ?auto_10010 ) ) ( not ( = ?auto_10008 ?auto_10015 ) ) ( not ( = ?auto_10010 ?auto_10017 ) ) ( not ( = ?auto_10010 ?auto_10020 ) ) ( not ( = ?auto_10012 ?auto_10021 ) ) ( not ( = ?auto_10012 ?auto_10019 ) ) ( not ( = ?auto_10013 ?auto_10022 ) ) ( not ( = ?auto_10013 ?auto_10018 ) ) ( not ( = ?auto_10015 ?auto_10017 ) ) ( not ( = ?auto_10015 ?auto_10020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10007 ?auto_10008 ?auto_10009 )
      ( MAKE-1CRATE ?auto_10009 ?auto_10010 )
      ( MAKE-3CRATE-VERIFY ?auto_10007 ?auto_10008 ?auto_10009 ?auto_10010 ) )
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
      ?auto_10043 - HOIST
      ?auto_10048 - PLACE
      ?auto_10045 - PLACE
      ?auto_10047 - HOIST
      ?auto_10046 - SURFACE
      ?auto_10052 - PLACE
      ?auto_10049 - HOIST
      ?auto_10054 - SURFACE
      ?auto_10050 - PLACE
      ?auto_10055 - HOIST
      ?auto_10053 - SURFACE
      ?auto_10051 - SURFACE
      ?auto_10044 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10043 ?auto_10048 ) ( IS-CRATE ?auto_10042 ) ( not ( = ?auto_10045 ?auto_10048 ) ) ( HOIST-AT ?auto_10047 ?auto_10045 ) ( SURFACE-AT ?auto_10042 ?auto_10045 ) ( ON ?auto_10042 ?auto_10046 ) ( CLEAR ?auto_10042 ) ( not ( = ?auto_10041 ?auto_10042 ) ) ( not ( = ?auto_10041 ?auto_10046 ) ) ( not ( = ?auto_10042 ?auto_10046 ) ) ( not ( = ?auto_10043 ?auto_10047 ) ) ( IS-CRATE ?auto_10041 ) ( not ( = ?auto_10052 ?auto_10048 ) ) ( HOIST-AT ?auto_10049 ?auto_10052 ) ( AVAILABLE ?auto_10049 ) ( SURFACE-AT ?auto_10041 ?auto_10052 ) ( ON ?auto_10041 ?auto_10054 ) ( CLEAR ?auto_10041 ) ( not ( = ?auto_10040 ?auto_10041 ) ) ( not ( = ?auto_10040 ?auto_10054 ) ) ( not ( = ?auto_10041 ?auto_10054 ) ) ( not ( = ?auto_10043 ?auto_10049 ) ) ( IS-CRATE ?auto_10040 ) ( not ( = ?auto_10050 ?auto_10048 ) ) ( HOIST-AT ?auto_10055 ?auto_10050 ) ( AVAILABLE ?auto_10055 ) ( SURFACE-AT ?auto_10040 ?auto_10050 ) ( ON ?auto_10040 ?auto_10053 ) ( CLEAR ?auto_10040 ) ( not ( = ?auto_10039 ?auto_10040 ) ) ( not ( = ?auto_10039 ?auto_10053 ) ) ( not ( = ?auto_10040 ?auto_10053 ) ) ( not ( = ?auto_10043 ?auto_10055 ) ) ( SURFACE-AT ?auto_10038 ?auto_10048 ) ( CLEAR ?auto_10038 ) ( IS-CRATE ?auto_10039 ) ( AVAILABLE ?auto_10043 ) ( AVAILABLE ?auto_10047 ) ( SURFACE-AT ?auto_10039 ?auto_10045 ) ( ON ?auto_10039 ?auto_10051 ) ( CLEAR ?auto_10039 ) ( TRUCK-AT ?auto_10044 ?auto_10048 ) ( not ( = ?auto_10038 ?auto_10039 ) ) ( not ( = ?auto_10038 ?auto_10051 ) ) ( not ( = ?auto_10039 ?auto_10051 ) ) ( not ( = ?auto_10038 ?auto_10040 ) ) ( not ( = ?auto_10038 ?auto_10053 ) ) ( not ( = ?auto_10040 ?auto_10051 ) ) ( not ( = ?auto_10050 ?auto_10045 ) ) ( not ( = ?auto_10055 ?auto_10047 ) ) ( not ( = ?auto_10053 ?auto_10051 ) ) ( not ( = ?auto_10038 ?auto_10041 ) ) ( not ( = ?auto_10038 ?auto_10054 ) ) ( not ( = ?auto_10039 ?auto_10041 ) ) ( not ( = ?auto_10039 ?auto_10054 ) ) ( not ( = ?auto_10041 ?auto_10053 ) ) ( not ( = ?auto_10041 ?auto_10051 ) ) ( not ( = ?auto_10052 ?auto_10050 ) ) ( not ( = ?auto_10052 ?auto_10045 ) ) ( not ( = ?auto_10049 ?auto_10055 ) ) ( not ( = ?auto_10049 ?auto_10047 ) ) ( not ( = ?auto_10054 ?auto_10053 ) ) ( not ( = ?auto_10054 ?auto_10051 ) ) ( not ( = ?auto_10038 ?auto_10042 ) ) ( not ( = ?auto_10038 ?auto_10046 ) ) ( not ( = ?auto_10039 ?auto_10042 ) ) ( not ( = ?auto_10039 ?auto_10046 ) ) ( not ( = ?auto_10040 ?auto_10042 ) ) ( not ( = ?auto_10040 ?auto_10046 ) ) ( not ( = ?auto_10042 ?auto_10054 ) ) ( not ( = ?auto_10042 ?auto_10053 ) ) ( not ( = ?auto_10042 ?auto_10051 ) ) ( not ( = ?auto_10046 ?auto_10054 ) ) ( not ( = ?auto_10046 ?auto_10053 ) ) ( not ( = ?auto_10046 ?auto_10051 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_10038 ?auto_10039 ?auto_10040 ?auto_10041 )
      ( MAKE-1CRATE ?auto_10041 ?auto_10042 )
      ( MAKE-4CRATE-VERIFY ?auto_10038 ?auto_10039 ?auto_10040 ?auto_10041 ?auto_10042 ) )
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
      ?auto_10081 - HOIST
      ?auto_10078 - PLACE
      ?auto_10080 - PLACE
      ?auto_10079 - HOIST
      ?auto_10082 - SURFACE
      ?auto_10091 - PLACE
      ?auto_10086 - HOIST
      ?auto_10090 - SURFACE
      ?auto_10093 - PLACE
      ?auto_10087 - HOIST
      ?auto_10085 - SURFACE
      ?auto_10092 - PLACE
      ?auto_10089 - HOIST
      ?auto_10084 - SURFACE
      ?auto_10088 - SURFACE
      ?auto_10083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10081 ?auto_10078 ) ( IS-CRATE ?auto_10077 ) ( not ( = ?auto_10080 ?auto_10078 ) ) ( HOIST-AT ?auto_10079 ?auto_10080 ) ( AVAILABLE ?auto_10079 ) ( SURFACE-AT ?auto_10077 ?auto_10080 ) ( ON ?auto_10077 ?auto_10082 ) ( CLEAR ?auto_10077 ) ( not ( = ?auto_10076 ?auto_10077 ) ) ( not ( = ?auto_10076 ?auto_10082 ) ) ( not ( = ?auto_10077 ?auto_10082 ) ) ( not ( = ?auto_10081 ?auto_10079 ) ) ( IS-CRATE ?auto_10076 ) ( not ( = ?auto_10091 ?auto_10078 ) ) ( HOIST-AT ?auto_10086 ?auto_10091 ) ( SURFACE-AT ?auto_10076 ?auto_10091 ) ( ON ?auto_10076 ?auto_10090 ) ( CLEAR ?auto_10076 ) ( not ( = ?auto_10075 ?auto_10076 ) ) ( not ( = ?auto_10075 ?auto_10090 ) ) ( not ( = ?auto_10076 ?auto_10090 ) ) ( not ( = ?auto_10081 ?auto_10086 ) ) ( IS-CRATE ?auto_10075 ) ( not ( = ?auto_10093 ?auto_10078 ) ) ( HOIST-AT ?auto_10087 ?auto_10093 ) ( AVAILABLE ?auto_10087 ) ( SURFACE-AT ?auto_10075 ?auto_10093 ) ( ON ?auto_10075 ?auto_10085 ) ( CLEAR ?auto_10075 ) ( not ( = ?auto_10074 ?auto_10075 ) ) ( not ( = ?auto_10074 ?auto_10085 ) ) ( not ( = ?auto_10075 ?auto_10085 ) ) ( not ( = ?auto_10081 ?auto_10087 ) ) ( IS-CRATE ?auto_10074 ) ( not ( = ?auto_10092 ?auto_10078 ) ) ( HOIST-AT ?auto_10089 ?auto_10092 ) ( AVAILABLE ?auto_10089 ) ( SURFACE-AT ?auto_10074 ?auto_10092 ) ( ON ?auto_10074 ?auto_10084 ) ( CLEAR ?auto_10074 ) ( not ( = ?auto_10073 ?auto_10074 ) ) ( not ( = ?auto_10073 ?auto_10084 ) ) ( not ( = ?auto_10074 ?auto_10084 ) ) ( not ( = ?auto_10081 ?auto_10089 ) ) ( SURFACE-AT ?auto_10072 ?auto_10078 ) ( CLEAR ?auto_10072 ) ( IS-CRATE ?auto_10073 ) ( AVAILABLE ?auto_10081 ) ( AVAILABLE ?auto_10086 ) ( SURFACE-AT ?auto_10073 ?auto_10091 ) ( ON ?auto_10073 ?auto_10088 ) ( CLEAR ?auto_10073 ) ( TRUCK-AT ?auto_10083 ?auto_10078 ) ( not ( = ?auto_10072 ?auto_10073 ) ) ( not ( = ?auto_10072 ?auto_10088 ) ) ( not ( = ?auto_10073 ?auto_10088 ) ) ( not ( = ?auto_10072 ?auto_10074 ) ) ( not ( = ?auto_10072 ?auto_10084 ) ) ( not ( = ?auto_10074 ?auto_10088 ) ) ( not ( = ?auto_10092 ?auto_10091 ) ) ( not ( = ?auto_10089 ?auto_10086 ) ) ( not ( = ?auto_10084 ?auto_10088 ) ) ( not ( = ?auto_10072 ?auto_10075 ) ) ( not ( = ?auto_10072 ?auto_10085 ) ) ( not ( = ?auto_10073 ?auto_10075 ) ) ( not ( = ?auto_10073 ?auto_10085 ) ) ( not ( = ?auto_10075 ?auto_10084 ) ) ( not ( = ?auto_10075 ?auto_10088 ) ) ( not ( = ?auto_10093 ?auto_10092 ) ) ( not ( = ?auto_10093 ?auto_10091 ) ) ( not ( = ?auto_10087 ?auto_10089 ) ) ( not ( = ?auto_10087 ?auto_10086 ) ) ( not ( = ?auto_10085 ?auto_10084 ) ) ( not ( = ?auto_10085 ?auto_10088 ) ) ( not ( = ?auto_10072 ?auto_10076 ) ) ( not ( = ?auto_10072 ?auto_10090 ) ) ( not ( = ?auto_10073 ?auto_10076 ) ) ( not ( = ?auto_10073 ?auto_10090 ) ) ( not ( = ?auto_10074 ?auto_10076 ) ) ( not ( = ?auto_10074 ?auto_10090 ) ) ( not ( = ?auto_10076 ?auto_10085 ) ) ( not ( = ?auto_10076 ?auto_10084 ) ) ( not ( = ?auto_10076 ?auto_10088 ) ) ( not ( = ?auto_10090 ?auto_10085 ) ) ( not ( = ?auto_10090 ?auto_10084 ) ) ( not ( = ?auto_10090 ?auto_10088 ) ) ( not ( = ?auto_10072 ?auto_10077 ) ) ( not ( = ?auto_10072 ?auto_10082 ) ) ( not ( = ?auto_10073 ?auto_10077 ) ) ( not ( = ?auto_10073 ?auto_10082 ) ) ( not ( = ?auto_10074 ?auto_10077 ) ) ( not ( = ?auto_10074 ?auto_10082 ) ) ( not ( = ?auto_10075 ?auto_10077 ) ) ( not ( = ?auto_10075 ?auto_10082 ) ) ( not ( = ?auto_10077 ?auto_10090 ) ) ( not ( = ?auto_10077 ?auto_10085 ) ) ( not ( = ?auto_10077 ?auto_10084 ) ) ( not ( = ?auto_10077 ?auto_10088 ) ) ( not ( = ?auto_10080 ?auto_10091 ) ) ( not ( = ?auto_10080 ?auto_10093 ) ) ( not ( = ?auto_10080 ?auto_10092 ) ) ( not ( = ?auto_10079 ?auto_10086 ) ) ( not ( = ?auto_10079 ?auto_10087 ) ) ( not ( = ?auto_10079 ?auto_10089 ) ) ( not ( = ?auto_10082 ?auto_10090 ) ) ( not ( = ?auto_10082 ?auto_10085 ) ) ( not ( = ?auto_10082 ?auto_10084 ) ) ( not ( = ?auto_10082 ?auto_10088 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_10072 ?auto_10073 ?auto_10074 ?auto_10075 ?auto_10076 )
      ( MAKE-1CRATE ?auto_10076 ?auto_10077 )
      ( MAKE-5CRATE-VERIFY ?auto_10072 ?auto_10073 ?auto_10074 ?auto_10075 ?auto_10076 ?auto_10077 ) )
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
      ?auto_10118 - PLACE
      ?auto_10120 - PLACE
      ?auto_10121 - HOIST
      ?auto_10119 - SURFACE
      ?auto_10130 - PLACE
      ?auto_10132 - HOIST
      ?auto_10127 - SURFACE
      ?auto_10135 - PLACE
      ?auto_10129 - HOIST
      ?auto_10134 - SURFACE
      ?auto_10131 - PLACE
      ?auto_10125 - HOIST
      ?auto_10133 - SURFACE
      ?auto_10128 - PLACE
      ?auto_10126 - HOIST
      ?auto_10124 - SURFACE
      ?auto_10136 - SURFACE
      ?auto_10123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10122 ?auto_10118 ) ( IS-CRATE ?auto_10117 ) ( not ( = ?auto_10120 ?auto_10118 ) ) ( HOIST-AT ?auto_10121 ?auto_10120 ) ( AVAILABLE ?auto_10121 ) ( SURFACE-AT ?auto_10117 ?auto_10120 ) ( ON ?auto_10117 ?auto_10119 ) ( CLEAR ?auto_10117 ) ( not ( = ?auto_10116 ?auto_10117 ) ) ( not ( = ?auto_10116 ?auto_10119 ) ) ( not ( = ?auto_10117 ?auto_10119 ) ) ( not ( = ?auto_10122 ?auto_10121 ) ) ( IS-CRATE ?auto_10116 ) ( not ( = ?auto_10130 ?auto_10118 ) ) ( HOIST-AT ?auto_10132 ?auto_10130 ) ( AVAILABLE ?auto_10132 ) ( SURFACE-AT ?auto_10116 ?auto_10130 ) ( ON ?auto_10116 ?auto_10127 ) ( CLEAR ?auto_10116 ) ( not ( = ?auto_10115 ?auto_10116 ) ) ( not ( = ?auto_10115 ?auto_10127 ) ) ( not ( = ?auto_10116 ?auto_10127 ) ) ( not ( = ?auto_10122 ?auto_10132 ) ) ( IS-CRATE ?auto_10115 ) ( not ( = ?auto_10135 ?auto_10118 ) ) ( HOIST-AT ?auto_10129 ?auto_10135 ) ( SURFACE-AT ?auto_10115 ?auto_10135 ) ( ON ?auto_10115 ?auto_10134 ) ( CLEAR ?auto_10115 ) ( not ( = ?auto_10114 ?auto_10115 ) ) ( not ( = ?auto_10114 ?auto_10134 ) ) ( not ( = ?auto_10115 ?auto_10134 ) ) ( not ( = ?auto_10122 ?auto_10129 ) ) ( IS-CRATE ?auto_10114 ) ( not ( = ?auto_10131 ?auto_10118 ) ) ( HOIST-AT ?auto_10125 ?auto_10131 ) ( AVAILABLE ?auto_10125 ) ( SURFACE-AT ?auto_10114 ?auto_10131 ) ( ON ?auto_10114 ?auto_10133 ) ( CLEAR ?auto_10114 ) ( not ( = ?auto_10113 ?auto_10114 ) ) ( not ( = ?auto_10113 ?auto_10133 ) ) ( not ( = ?auto_10114 ?auto_10133 ) ) ( not ( = ?auto_10122 ?auto_10125 ) ) ( IS-CRATE ?auto_10113 ) ( not ( = ?auto_10128 ?auto_10118 ) ) ( HOIST-AT ?auto_10126 ?auto_10128 ) ( AVAILABLE ?auto_10126 ) ( SURFACE-AT ?auto_10113 ?auto_10128 ) ( ON ?auto_10113 ?auto_10124 ) ( CLEAR ?auto_10113 ) ( not ( = ?auto_10112 ?auto_10113 ) ) ( not ( = ?auto_10112 ?auto_10124 ) ) ( not ( = ?auto_10113 ?auto_10124 ) ) ( not ( = ?auto_10122 ?auto_10126 ) ) ( SURFACE-AT ?auto_10111 ?auto_10118 ) ( CLEAR ?auto_10111 ) ( IS-CRATE ?auto_10112 ) ( AVAILABLE ?auto_10122 ) ( AVAILABLE ?auto_10129 ) ( SURFACE-AT ?auto_10112 ?auto_10135 ) ( ON ?auto_10112 ?auto_10136 ) ( CLEAR ?auto_10112 ) ( TRUCK-AT ?auto_10123 ?auto_10118 ) ( not ( = ?auto_10111 ?auto_10112 ) ) ( not ( = ?auto_10111 ?auto_10136 ) ) ( not ( = ?auto_10112 ?auto_10136 ) ) ( not ( = ?auto_10111 ?auto_10113 ) ) ( not ( = ?auto_10111 ?auto_10124 ) ) ( not ( = ?auto_10113 ?auto_10136 ) ) ( not ( = ?auto_10128 ?auto_10135 ) ) ( not ( = ?auto_10126 ?auto_10129 ) ) ( not ( = ?auto_10124 ?auto_10136 ) ) ( not ( = ?auto_10111 ?auto_10114 ) ) ( not ( = ?auto_10111 ?auto_10133 ) ) ( not ( = ?auto_10112 ?auto_10114 ) ) ( not ( = ?auto_10112 ?auto_10133 ) ) ( not ( = ?auto_10114 ?auto_10124 ) ) ( not ( = ?auto_10114 ?auto_10136 ) ) ( not ( = ?auto_10131 ?auto_10128 ) ) ( not ( = ?auto_10131 ?auto_10135 ) ) ( not ( = ?auto_10125 ?auto_10126 ) ) ( not ( = ?auto_10125 ?auto_10129 ) ) ( not ( = ?auto_10133 ?auto_10124 ) ) ( not ( = ?auto_10133 ?auto_10136 ) ) ( not ( = ?auto_10111 ?auto_10115 ) ) ( not ( = ?auto_10111 ?auto_10134 ) ) ( not ( = ?auto_10112 ?auto_10115 ) ) ( not ( = ?auto_10112 ?auto_10134 ) ) ( not ( = ?auto_10113 ?auto_10115 ) ) ( not ( = ?auto_10113 ?auto_10134 ) ) ( not ( = ?auto_10115 ?auto_10133 ) ) ( not ( = ?auto_10115 ?auto_10124 ) ) ( not ( = ?auto_10115 ?auto_10136 ) ) ( not ( = ?auto_10134 ?auto_10133 ) ) ( not ( = ?auto_10134 ?auto_10124 ) ) ( not ( = ?auto_10134 ?auto_10136 ) ) ( not ( = ?auto_10111 ?auto_10116 ) ) ( not ( = ?auto_10111 ?auto_10127 ) ) ( not ( = ?auto_10112 ?auto_10116 ) ) ( not ( = ?auto_10112 ?auto_10127 ) ) ( not ( = ?auto_10113 ?auto_10116 ) ) ( not ( = ?auto_10113 ?auto_10127 ) ) ( not ( = ?auto_10114 ?auto_10116 ) ) ( not ( = ?auto_10114 ?auto_10127 ) ) ( not ( = ?auto_10116 ?auto_10134 ) ) ( not ( = ?auto_10116 ?auto_10133 ) ) ( not ( = ?auto_10116 ?auto_10124 ) ) ( not ( = ?auto_10116 ?auto_10136 ) ) ( not ( = ?auto_10130 ?auto_10135 ) ) ( not ( = ?auto_10130 ?auto_10131 ) ) ( not ( = ?auto_10130 ?auto_10128 ) ) ( not ( = ?auto_10132 ?auto_10129 ) ) ( not ( = ?auto_10132 ?auto_10125 ) ) ( not ( = ?auto_10132 ?auto_10126 ) ) ( not ( = ?auto_10127 ?auto_10134 ) ) ( not ( = ?auto_10127 ?auto_10133 ) ) ( not ( = ?auto_10127 ?auto_10124 ) ) ( not ( = ?auto_10127 ?auto_10136 ) ) ( not ( = ?auto_10111 ?auto_10117 ) ) ( not ( = ?auto_10111 ?auto_10119 ) ) ( not ( = ?auto_10112 ?auto_10117 ) ) ( not ( = ?auto_10112 ?auto_10119 ) ) ( not ( = ?auto_10113 ?auto_10117 ) ) ( not ( = ?auto_10113 ?auto_10119 ) ) ( not ( = ?auto_10114 ?auto_10117 ) ) ( not ( = ?auto_10114 ?auto_10119 ) ) ( not ( = ?auto_10115 ?auto_10117 ) ) ( not ( = ?auto_10115 ?auto_10119 ) ) ( not ( = ?auto_10117 ?auto_10127 ) ) ( not ( = ?auto_10117 ?auto_10134 ) ) ( not ( = ?auto_10117 ?auto_10133 ) ) ( not ( = ?auto_10117 ?auto_10124 ) ) ( not ( = ?auto_10117 ?auto_10136 ) ) ( not ( = ?auto_10120 ?auto_10130 ) ) ( not ( = ?auto_10120 ?auto_10135 ) ) ( not ( = ?auto_10120 ?auto_10131 ) ) ( not ( = ?auto_10120 ?auto_10128 ) ) ( not ( = ?auto_10121 ?auto_10132 ) ) ( not ( = ?auto_10121 ?auto_10129 ) ) ( not ( = ?auto_10121 ?auto_10125 ) ) ( not ( = ?auto_10121 ?auto_10126 ) ) ( not ( = ?auto_10119 ?auto_10127 ) ) ( not ( = ?auto_10119 ?auto_10134 ) ) ( not ( = ?auto_10119 ?auto_10133 ) ) ( not ( = ?auto_10119 ?auto_10124 ) ) ( not ( = ?auto_10119 ?auto_10136 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_10111 ?auto_10112 ?auto_10113 ?auto_10114 ?auto_10115 ?auto_10116 )
      ( MAKE-1CRATE ?auto_10116 ?auto_10117 )
      ( MAKE-6CRATE-VERIFY ?auto_10111 ?auto_10112 ?auto_10113 ?auto_10114 ?auto_10115 ?auto_10116 ?auto_10117 ) )
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
      ?auto_10167 - HOIST
      ?auto_10166 - PLACE
      ?auto_10168 - PLACE
      ?auto_10163 - HOIST
      ?auto_10164 - SURFACE
      ?auto_10184 - PLACE
      ?auto_10176 - HOIST
      ?auto_10174 - SURFACE
      ?auto_10170 - PLACE
      ?auto_10171 - HOIST
      ?auto_10172 - SURFACE
      ?auto_10181 - PLACE
      ?auto_10179 - HOIST
      ?auto_10177 - SURFACE
      ?auto_10178 - PLACE
      ?auto_10169 - HOIST
      ?auto_10182 - SURFACE
      ?auto_10183 - PLACE
      ?auto_10180 - HOIST
      ?auto_10173 - SURFACE
      ?auto_10175 - SURFACE
      ?auto_10165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10167 ?auto_10166 ) ( IS-CRATE ?auto_10162 ) ( not ( = ?auto_10168 ?auto_10166 ) ) ( HOIST-AT ?auto_10163 ?auto_10168 ) ( AVAILABLE ?auto_10163 ) ( SURFACE-AT ?auto_10162 ?auto_10168 ) ( ON ?auto_10162 ?auto_10164 ) ( CLEAR ?auto_10162 ) ( not ( = ?auto_10161 ?auto_10162 ) ) ( not ( = ?auto_10161 ?auto_10164 ) ) ( not ( = ?auto_10162 ?auto_10164 ) ) ( not ( = ?auto_10167 ?auto_10163 ) ) ( IS-CRATE ?auto_10161 ) ( not ( = ?auto_10184 ?auto_10166 ) ) ( HOIST-AT ?auto_10176 ?auto_10184 ) ( AVAILABLE ?auto_10176 ) ( SURFACE-AT ?auto_10161 ?auto_10184 ) ( ON ?auto_10161 ?auto_10174 ) ( CLEAR ?auto_10161 ) ( not ( = ?auto_10160 ?auto_10161 ) ) ( not ( = ?auto_10160 ?auto_10174 ) ) ( not ( = ?auto_10161 ?auto_10174 ) ) ( not ( = ?auto_10167 ?auto_10176 ) ) ( IS-CRATE ?auto_10160 ) ( not ( = ?auto_10170 ?auto_10166 ) ) ( HOIST-AT ?auto_10171 ?auto_10170 ) ( AVAILABLE ?auto_10171 ) ( SURFACE-AT ?auto_10160 ?auto_10170 ) ( ON ?auto_10160 ?auto_10172 ) ( CLEAR ?auto_10160 ) ( not ( = ?auto_10159 ?auto_10160 ) ) ( not ( = ?auto_10159 ?auto_10172 ) ) ( not ( = ?auto_10160 ?auto_10172 ) ) ( not ( = ?auto_10167 ?auto_10171 ) ) ( IS-CRATE ?auto_10159 ) ( not ( = ?auto_10181 ?auto_10166 ) ) ( HOIST-AT ?auto_10179 ?auto_10181 ) ( SURFACE-AT ?auto_10159 ?auto_10181 ) ( ON ?auto_10159 ?auto_10177 ) ( CLEAR ?auto_10159 ) ( not ( = ?auto_10158 ?auto_10159 ) ) ( not ( = ?auto_10158 ?auto_10177 ) ) ( not ( = ?auto_10159 ?auto_10177 ) ) ( not ( = ?auto_10167 ?auto_10179 ) ) ( IS-CRATE ?auto_10158 ) ( not ( = ?auto_10178 ?auto_10166 ) ) ( HOIST-AT ?auto_10169 ?auto_10178 ) ( AVAILABLE ?auto_10169 ) ( SURFACE-AT ?auto_10158 ?auto_10178 ) ( ON ?auto_10158 ?auto_10182 ) ( CLEAR ?auto_10158 ) ( not ( = ?auto_10157 ?auto_10158 ) ) ( not ( = ?auto_10157 ?auto_10182 ) ) ( not ( = ?auto_10158 ?auto_10182 ) ) ( not ( = ?auto_10167 ?auto_10169 ) ) ( IS-CRATE ?auto_10157 ) ( not ( = ?auto_10183 ?auto_10166 ) ) ( HOIST-AT ?auto_10180 ?auto_10183 ) ( AVAILABLE ?auto_10180 ) ( SURFACE-AT ?auto_10157 ?auto_10183 ) ( ON ?auto_10157 ?auto_10173 ) ( CLEAR ?auto_10157 ) ( not ( = ?auto_10156 ?auto_10157 ) ) ( not ( = ?auto_10156 ?auto_10173 ) ) ( not ( = ?auto_10157 ?auto_10173 ) ) ( not ( = ?auto_10167 ?auto_10180 ) ) ( SURFACE-AT ?auto_10155 ?auto_10166 ) ( CLEAR ?auto_10155 ) ( IS-CRATE ?auto_10156 ) ( AVAILABLE ?auto_10167 ) ( AVAILABLE ?auto_10179 ) ( SURFACE-AT ?auto_10156 ?auto_10181 ) ( ON ?auto_10156 ?auto_10175 ) ( CLEAR ?auto_10156 ) ( TRUCK-AT ?auto_10165 ?auto_10166 ) ( not ( = ?auto_10155 ?auto_10156 ) ) ( not ( = ?auto_10155 ?auto_10175 ) ) ( not ( = ?auto_10156 ?auto_10175 ) ) ( not ( = ?auto_10155 ?auto_10157 ) ) ( not ( = ?auto_10155 ?auto_10173 ) ) ( not ( = ?auto_10157 ?auto_10175 ) ) ( not ( = ?auto_10183 ?auto_10181 ) ) ( not ( = ?auto_10180 ?auto_10179 ) ) ( not ( = ?auto_10173 ?auto_10175 ) ) ( not ( = ?auto_10155 ?auto_10158 ) ) ( not ( = ?auto_10155 ?auto_10182 ) ) ( not ( = ?auto_10156 ?auto_10158 ) ) ( not ( = ?auto_10156 ?auto_10182 ) ) ( not ( = ?auto_10158 ?auto_10173 ) ) ( not ( = ?auto_10158 ?auto_10175 ) ) ( not ( = ?auto_10178 ?auto_10183 ) ) ( not ( = ?auto_10178 ?auto_10181 ) ) ( not ( = ?auto_10169 ?auto_10180 ) ) ( not ( = ?auto_10169 ?auto_10179 ) ) ( not ( = ?auto_10182 ?auto_10173 ) ) ( not ( = ?auto_10182 ?auto_10175 ) ) ( not ( = ?auto_10155 ?auto_10159 ) ) ( not ( = ?auto_10155 ?auto_10177 ) ) ( not ( = ?auto_10156 ?auto_10159 ) ) ( not ( = ?auto_10156 ?auto_10177 ) ) ( not ( = ?auto_10157 ?auto_10159 ) ) ( not ( = ?auto_10157 ?auto_10177 ) ) ( not ( = ?auto_10159 ?auto_10182 ) ) ( not ( = ?auto_10159 ?auto_10173 ) ) ( not ( = ?auto_10159 ?auto_10175 ) ) ( not ( = ?auto_10177 ?auto_10182 ) ) ( not ( = ?auto_10177 ?auto_10173 ) ) ( not ( = ?auto_10177 ?auto_10175 ) ) ( not ( = ?auto_10155 ?auto_10160 ) ) ( not ( = ?auto_10155 ?auto_10172 ) ) ( not ( = ?auto_10156 ?auto_10160 ) ) ( not ( = ?auto_10156 ?auto_10172 ) ) ( not ( = ?auto_10157 ?auto_10160 ) ) ( not ( = ?auto_10157 ?auto_10172 ) ) ( not ( = ?auto_10158 ?auto_10160 ) ) ( not ( = ?auto_10158 ?auto_10172 ) ) ( not ( = ?auto_10160 ?auto_10177 ) ) ( not ( = ?auto_10160 ?auto_10182 ) ) ( not ( = ?auto_10160 ?auto_10173 ) ) ( not ( = ?auto_10160 ?auto_10175 ) ) ( not ( = ?auto_10170 ?auto_10181 ) ) ( not ( = ?auto_10170 ?auto_10178 ) ) ( not ( = ?auto_10170 ?auto_10183 ) ) ( not ( = ?auto_10171 ?auto_10179 ) ) ( not ( = ?auto_10171 ?auto_10169 ) ) ( not ( = ?auto_10171 ?auto_10180 ) ) ( not ( = ?auto_10172 ?auto_10177 ) ) ( not ( = ?auto_10172 ?auto_10182 ) ) ( not ( = ?auto_10172 ?auto_10173 ) ) ( not ( = ?auto_10172 ?auto_10175 ) ) ( not ( = ?auto_10155 ?auto_10161 ) ) ( not ( = ?auto_10155 ?auto_10174 ) ) ( not ( = ?auto_10156 ?auto_10161 ) ) ( not ( = ?auto_10156 ?auto_10174 ) ) ( not ( = ?auto_10157 ?auto_10161 ) ) ( not ( = ?auto_10157 ?auto_10174 ) ) ( not ( = ?auto_10158 ?auto_10161 ) ) ( not ( = ?auto_10158 ?auto_10174 ) ) ( not ( = ?auto_10159 ?auto_10161 ) ) ( not ( = ?auto_10159 ?auto_10174 ) ) ( not ( = ?auto_10161 ?auto_10172 ) ) ( not ( = ?auto_10161 ?auto_10177 ) ) ( not ( = ?auto_10161 ?auto_10182 ) ) ( not ( = ?auto_10161 ?auto_10173 ) ) ( not ( = ?auto_10161 ?auto_10175 ) ) ( not ( = ?auto_10184 ?auto_10170 ) ) ( not ( = ?auto_10184 ?auto_10181 ) ) ( not ( = ?auto_10184 ?auto_10178 ) ) ( not ( = ?auto_10184 ?auto_10183 ) ) ( not ( = ?auto_10176 ?auto_10171 ) ) ( not ( = ?auto_10176 ?auto_10179 ) ) ( not ( = ?auto_10176 ?auto_10169 ) ) ( not ( = ?auto_10176 ?auto_10180 ) ) ( not ( = ?auto_10174 ?auto_10172 ) ) ( not ( = ?auto_10174 ?auto_10177 ) ) ( not ( = ?auto_10174 ?auto_10182 ) ) ( not ( = ?auto_10174 ?auto_10173 ) ) ( not ( = ?auto_10174 ?auto_10175 ) ) ( not ( = ?auto_10155 ?auto_10162 ) ) ( not ( = ?auto_10155 ?auto_10164 ) ) ( not ( = ?auto_10156 ?auto_10162 ) ) ( not ( = ?auto_10156 ?auto_10164 ) ) ( not ( = ?auto_10157 ?auto_10162 ) ) ( not ( = ?auto_10157 ?auto_10164 ) ) ( not ( = ?auto_10158 ?auto_10162 ) ) ( not ( = ?auto_10158 ?auto_10164 ) ) ( not ( = ?auto_10159 ?auto_10162 ) ) ( not ( = ?auto_10159 ?auto_10164 ) ) ( not ( = ?auto_10160 ?auto_10162 ) ) ( not ( = ?auto_10160 ?auto_10164 ) ) ( not ( = ?auto_10162 ?auto_10174 ) ) ( not ( = ?auto_10162 ?auto_10172 ) ) ( not ( = ?auto_10162 ?auto_10177 ) ) ( not ( = ?auto_10162 ?auto_10182 ) ) ( not ( = ?auto_10162 ?auto_10173 ) ) ( not ( = ?auto_10162 ?auto_10175 ) ) ( not ( = ?auto_10168 ?auto_10184 ) ) ( not ( = ?auto_10168 ?auto_10170 ) ) ( not ( = ?auto_10168 ?auto_10181 ) ) ( not ( = ?auto_10168 ?auto_10178 ) ) ( not ( = ?auto_10168 ?auto_10183 ) ) ( not ( = ?auto_10163 ?auto_10176 ) ) ( not ( = ?auto_10163 ?auto_10171 ) ) ( not ( = ?auto_10163 ?auto_10179 ) ) ( not ( = ?auto_10163 ?auto_10169 ) ) ( not ( = ?auto_10163 ?auto_10180 ) ) ( not ( = ?auto_10164 ?auto_10174 ) ) ( not ( = ?auto_10164 ?auto_10172 ) ) ( not ( = ?auto_10164 ?auto_10177 ) ) ( not ( = ?auto_10164 ?auto_10182 ) ) ( not ( = ?auto_10164 ?auto_10173 ) ) ( not ( = ?auto_10164 ?auto_10175 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_10155 ?auto_10156 ?auto_10157 ?auto_10158 ?auto_10159 ?auto_10160 ?auto_10161 )
      ( MAKE-1CRATE ?auto_10161 ?auto_10162 )
      ( MAKE-7CRATE-VERIFY ?auto_10155 ?auto_10156 ?auto_10157 ?auto_10158 ?auto_10159 ?auto_10160 ?auto_10161 ?auto_10162 ) )
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
      ?auto_10211 - SURFACE
      ?auto_10212 - SURFACE
    )
    :vars
    (
      ?auto_10217 - HOIST
      ?auto_10213 - PLACE
      ?auto_10214 - PLACE
      ?auto_10218 - HOIST
      ?auto_10215 - SURFACE
      ?auto_10223 - PLACE
      ?auto_10221 - HOIST
      ?auto_10232 - SURFACE
      ?auto_10231 - SURFACE
      ?auto_10228 - PLACE
      ?auto_10227 - HOIST
      ?auto_10229 - SURFACE
      ?auto_10220 - PLACE
      ?auto_10235 - HOIST
      ?auto_10225 - SURFACE
      ?auto_10233 - PLACE
      ?auto_10222 - HOIST
      ?auto_10224 - SURFACE
      ?auto_10234 - PLACE
      ?auto_10226 - HOIST
      ?auto_10230 - SURFACE
      ?auto_10219 - SURFACE
      ?auto_10216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10217 ?auto_10213 ) ( IS-CRATE ?auto_10212 ) ( not ( = ?auto_10214 ?auto_10213 ) ) ( HOIST-AT ?auto_10218 ?auto_10214 ) ( SURFACE-AT ?auto_10212 ?auto_10214 ) ( ON ?auto_10212 ?auto_10215 ) ( CLEAR ?auto_10212 ) ( not ( = ?auto_10211 ?auto_10212 ) ) ( not ( = ?auto_10211 ?auto_10215 ) ) ( not ( = ?auto_10212 ?auto_10215 ) ) ( not ( = ?auto_10217 ?auto_10218 ) ) ( IS-CRATE ?auto_10211 ) ( not ( = ?auto_10223 ?auto_10213 ) ) ( HOIST-AT ?auto_10221 ?auto_10223 ) ( AVAILABLE ?auto_10221 ) ( SURFACE-AT ?auto_10211 ?auto_10223 ) ( ON ?auto_10211 ?auto_10232 ) ( CLEAR ?auto_10211 ) ( not ( = ?auto_10210 ?auto_10211 ) ) ( not ( = ?auto_10210 ?auto_10232 ) ) ( not ( = ?auto_10211 ?auto_10232 ) ) ( not ( = ?auto_10217 ?auto_10221 ) ) ( IS-CRATE ?auto_10210 ) ( AVAILABLE ?auto_10218 ) ( SURFACE-AT ?auto_10210 ?auto_10214 ) ( ON ?auto_10210 ?auto_10231 ) ( CLEAR ?auto_10210 ) ( not ( = ?auto_10209 ?auto_10210 ) ) ( not ( = ?auto_10209 ?auto_10231 ) ) ( not ( = ?auto_10210 ?auto_10231 ) ) ( IS-CRATE ?auto_10209 ) ( not ( = ?auto_10228 ?auto_10213 ) ) ( HOIST-AT ?auto_10227 ?auto_10228 ) ( AVAILABLE ?auto_10227 ) ( SURFACE-AT ?auto_10209 ?auto_10228 ) ( ON ?auto_10209 ?auto_10229 ) ( CLEAR ?auto_10209 ) ( not ( = ?auto_10208 ?auto_10209 ) ) ( not ( = ?auto_10208 ?auto_10229 ) ) ( not ( = ?auto_10209 ?auto_10229 ) ) ( not ( = ?auto_10217 ?auto_10227 ) ) ( IS-CRATE ?auto_10208 ) ( not ( = ?auto_10220 ?auto_10213 ) ) ( HOIST-AT ?auto_10235 ?auto_10220 ) ( SURFACE-AT ?auto_10208 ?auto_10220 ) ( ON ?auto_10208 ?auto_10225 ) ( CLEAR ?auto_10208 ) ( not ( = ?auto_10207 ?auto_10208 ) ) ( not ( = ?auto_10207 ?auto_10225 ) ) ( not ( = ?auto_10208 ?auto_10225 ) ) ( not ( = ?auto_10217 ?auto_10235 ) ) ( IS-CRATE ?auto_10207 ) ( not ( = ?auto_10233 ?auto_10213 ) ) ( HOIST-AT ?auto_10222 ?auto_10233 ) ( AVAILABLE ?auto_10222 ) ( SURFACE-AT ?auto_10207 ?auto_10233 ) ( ON ?auto_10207 ?auto_10224 ) ( CLEAR ?auto_10207 ) ( not ( = ?auto_10206 ?auto_10207 ) ) ( not ( = ?auto_10206 ?auto_10224 ) ) ( not ( = ?auto_10207 ?auto_10224 ) ) ( not ( = ?auto_10217 ?auto_10222 ) ) ( IS-CRATE ?auto_10206 ) ( not ( = ?auto_10234 ?auto_10213 ) ) ( HOIST-AT ?auto_10226 ?auto_10234 ) ( AVAILABLE ?auto_10226 ) ( SURFACE-AT ?auto_10206 ?auto_10234 ) ( ON ?auto_10206 ?auto_10230 ) ( CLEAR ?auto_10206 ) ( not ( = ?auto_10205 ?auto_10206 ) ) ( not ( = ?auto_10205 ?auto_10230 ) ) ( not ( = ?auto_10206 ?auto_10230 ) ) ( not ( = ?auto_10217 ?auto_10226 ) ) ( SURFACE-AT ?auto_10204 ?auto_10213 ) ( CLEAR ?auto_10204 ) ( IS-CRATE ?auto_10205 ) ( AVAILABLE ?auto_10217 ) ( AVAILABLE ?auto_10235 ) ( SURFACE-AT ?auto_10205 ?auto_10220 ) ( ON ?auto_10205 ?auto_10219 ) ( CLEAR ?auto_10205 ) ( TRUCK-AT ?auto_10216 ?auto_10213 ) ( not ( = ?auto_10204 ?auto_10205 ) ) ( not ( = ?auto_10204 ?auto_10219 ) ) ( not ( = ?auto_10205 ?auto_10219 ) ) ( not ( = ?auto_10204 ?auto_10206 ) ) ( not ( = ?auto_10204 ?auto_10230 ) ) ( not ( = ?auto_10206 ?auto_10219 ) ) ( not ( = ?auto_10234 ?auto_10220 ) ) ( not ( = ?auto_10226 ?auto_10235 ) ) ( not ( = ?auto_10230 ?auto_10219 ) ) ( not ( = ?auto_10204 ?auto_10207 ) ) ( not ( = ?auto_10204 ?auto_10224 ) ) ( not ( = ?auto_10205 ?auto_10207 ) ) ( not ( = ?auto_10205 ?auto_10224 ) ) ( not ( = ?auto_10207 ?auto_10230 ) ) ( not ( = ?auto_10207 ?auto_10219 ) ) ( not ( = ?auto_10233 ?auto_10234 ) ) ( not ( = ?auto_10233 ?auto_10220 ) ) ( not ( = ?auto_10222 ?auto_10226 ) ) ( not ( = ?auto_10222 ?auto_10235 ) ) ( not ( = ?auto_10224 ?auto_10230 ) ) ( not ( = ?auto_10224 ?auto_10219 ) ) ( not ( = ?auto_10204 ?auto_10208 ) ) ( not ( = ?auto_10204 ?auto_10225 ) ) ( not ( = ?auto_10205 ?auto_10208 ) ) ( not ( = ?auto_10205 ?auto_10225 ) ) ( not ( = ?auto_10206 ?auto_10208 ) ) ( not ( = ?auto_10206 ?auto_10225 ) ) ( not ( = ?auto_10208 ?auto_10224 ) ) ( not ( = ?auto_10208 ?auto_10230 ) ) ( not ( = ?auto_10208 ?auto_10219 ) ) ( not ( = ?auto_10225 ?auto_10224 ) ) ( not ( = ?auto_10225 ?auto_10230 ) ) ( not ( = ?auto_10225 ?auto_10219 ) ) ( not ( = ?auto_10204 ?auto_10209 ) ) ( not ( = ?auto_10204 ?auto_10229 ) ) ( not ( = ?auto_10205 ?auto_10209 ) ) ( not ( = ?auto_10205 ?auto_10229 ) ) ( not ( = ?auto_10206 ?auto_10209 ) ) ( not ( = ?auto_10206 ?auto_10229 ) ) ( not ( = ?auto_10207 ?auto_10209 ) ) ( not ( = ?auto_10207 ?auto_10229 ) ) ( not ( = ?auto_10209 ?auto_10225 ) ) ( not ( = ?auto_10209 ?auto_10224 ) ) ( not ( = ?auto_10209 ?auto_10230 ) ) ( not ( = ?auto_10209 ?auto_10219 ) ) ( not ( = ?auto_10228 ?auto_10220 ) ) ( not ( = ?auto_10228 ?auto_10233 ) ) ( not ( = ?auto_10228 ?auto_10234 ) ) ( not ( = ?auto_10227 ?auto_10235 ) ) ( not ( = ?auto_10227 ?auto_10222 ) ) ( not ( = ?auto_10227 ?auto_10226 ) ) ( not ( = ?auto_10229 ?auto_10225 ) ) ( not ( = ?auto_10229 ?auto_10224 ) ) ( not ( = ?auto_10229 ?auto_10230 ) ) ( not ( = ?auto_10229 ?auto_10219 ) ) ( not ( = ?auto_10204 ?auto_10210 ) ) ( not ( = ?auto_10204 ?auto_10231 ) ) ( not ( = ?auto_10205 ?auto_10210 ) ) ( not ( = ?auto_10205 ?auto_10231 ) ) ( not ( = ?auto_10206 ?auto_10210 ) ) ( not ( = ?auto_10206 ?auto_10231 ) ) ( not ( = ?auto_10207 ?auto_10210 ) ) ( not ( = ?auto_10207 ?auto_10231 ) ) ( not ( = ?auto_10208 ?auto_10210 ) ) ( not ( = ?auto_10208 ?auto_10231 ) ) ( not ( = ?auto_10210 ?auto_10229 ) ) ( not ( = ?auto_10210 ?auto_10225 ) ) ( not ( = ?auto_10210 ?auto_10224 ) ) ( not ( = ?auto_10210 ?auto_10230 ) ) ( not ( = ?auto_10210 ?auto_10219 ) ) ( not ( = ?auto_10214 ?auto_10228 ) ) ( not ( = ?auto_10214 ?auto_10220 ) ) ( not ( = ?auto_10214 ?auto_10233 ) ) ( not ( = ?auto_10214 ?auto_10234 ) ) ( not ( = ?auto_10218 ?auto_10227 ) ) ( not ( = ?auto_10218 ?auto_10235 ) ) ( not ( = ?auto_10218 ?auto_10222 ) ) ( not ( = ?auto_10218 ?auto_10226 ) ) ( not ( = ?auto_10231 ?auto_10229 ) ) ( not ( = ?auto_10231 ?auto_10225 ) ) ( not ( = ?auto_10231 ?auto_10224 ) ) ( not ( = ?auto_10231 ?auto_10230 ) ) ( not ( = ?auto_10231 ?auto_10219 ) ) ( not ( = ?auto_10204 ?auto_10211 ) ) ( not ( = ?auto_10204 ?auto_10232 ) ) ( not ( = ?auto_10205 ?auto_10211 ) ) ( not ( = ?auto_10205 ?auto_10232 ) ) ( not ( = ?auto_10206 ?auto_10211 ) ) ( not ( = ?auto_10206 ?auto_10232 ) ) ( not ( = ?auto_10207 ?auto_10211 ) ) ( not ( = ?auto_10207 ?auto_10232 ) ) ( not ( = ?auto_10208 ?auto_10211 ) ) ( not ( = ?auto_10208 ?auto_10232 ) ) ( not ( = ?auto_10209 ?auto_10211 ) ) ( not ( = ?auto_10209 ?auto_10232 ) ) ( not ( = ?auto_10211 ?auto_10231 ) ) ( not ( = ?auto_10211 ?auto_10229 ) ) ( not ( = ?auto_10211 ?auto_10225 ) ) ( not ( = ?auto_10211 ?auto_10224 ) ) ( not ( = ?auto_10211 ?auto_10230 ) ) ( not ( = ?auto_10211 ?auto_10219 ) ) ( not ( = ?auto_10223 ?auto_10214 ) ) ( not ( = ?auto_10223 ?auto_10228 ) ) ( not ( = ?auto_10223 ?auto_10220 ) ) ( not ( = ?auto_10223 ?auto_10233 ) ) ( not ( = ?auto_10223 ?auto_10234 ) ) ( not ( = ?auto_10221 ?auto_10218 ) ) ( not ( = ?auto_10221 ?auto_10227 ) ) ( not ( = ?auto_10221 ?auto_10235 ) ) ( not ( = ?auto_10221 ?auto_10222 ) ) ( not ( = ?auto_10221 ?auto_10226 ) ) ( not ( = ?auto_10232 ?auto_10231 ) ) ( not ( = ?auto_10232 ?auto_10229 ) ) ( not ( = ?auto_10232 ?auto_10225 ) ) ( not ( = ?auto_10232 ?auto_10224 ) ) ( not ( = ?auto_10232 ?auto_10230 ) ) ( not ( = ?auto_10232 ?auto_10219 ) ) ( not ( = ?auto_10204 ?auto_10212 ) ) ( not ( = ?auto_10204 ?auto_10215 ) ) ( not ( = ?auto_10205 ?auto_10212 ) ) ( not ( = ?auto_10205 ?auto_10215 ) ) ( not ( = ?auto_10206 ?auto_10212 ) ) ( not ( = ?auto_10206 ?auto_10215 ) ) ( not ( = ?auto_10207 ?auto_10212 ) ) ( not ( = ?auto_10207 ?auto_10215 ) ) ( not ( = ?auto_10208 ?auto_10212 ) ) ( not ( = ?auto_10208 ?auto_10215 ) ) ( not ( = ?auto_10209 ?auto_10212 ) ) ( not ( = ?auto_10209 ?auto_10215 ) ) ( not ( = ?auto_10210 ?auto_10212 ) ) ( not ( = ?auto_10210 ?auto_10215 ) ) ( not ( = ?auto_10212 ?auto_10232 ) ) ( not ( = ?auto_10212 ?auto_10231 ) ) ( not ( = ?auto_10212 ?auto_10229 ) ) ( not ( = ?auto_10212 ?auto_10225 ) ) ( not ( = ?auto_10212 ?auto_10224 ) ) ( not ( = ?auto_10212 ?auto_10230 ) ) ( not ( = ?auto_10212 ?auto_10219 ) ) ( not ( = ?auto_10215 ?auto_10232 ) ) ( not ( = ?auto_10215 ?auto_10231 ) ) ( not ( = ?auto_10215 ?auto_10229 ) ) ( not ( = ?auto_10215 ?auto_10225 ) ) ( not ( = ?auto_10215 ?auto_10224 ) ) ( not ( = ?auto_10215 ?auto_10230 ) ) ( not ( = ?auto_10215 ?auto_10219 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_10204 ?auto_10205 ?auto_10206 ?auto_10207 ?auto_10208 ?auto_10209 ?auto_10210 ?auto_10211 )
      ( MAKE-1CRATE ?auto_10211 ?auto_10212 )
      ( MAKE-8CRATE-VERIFY ?auto_10204 ?auto_10205 ?auto_10206 ?auto_10207 ?auto_10208 ?auto_10209 ?auto_10210 ?auto_10211 ?auto_10212 ) )
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
      ?auto_10263 - SURFACE
      ?auto_10264 - SURFACE
      ?auto_10265 - SURFACE
    )
    :vars
    (
      ?auto_10271 - HOIST
      ?auto_10270 - PLACE
      ?auto_10268 - PLACE
      ?auto_10267 - HOIST
      ?auto_10269 - SURFACE
      ?auto_10289 - PLACE
      ?auto_10286 - HOIST
      ?auto_10274 - SURFACE
      ?auto_10272 - PLACE
      ?auto_10276 - HOIST
      ?auto_10282 - SURFACE
      ?auto_10285 - SURFACE
      ?auto_10283 - SURFACE
      ?auto_10281 - PLACE
      ?auto_10273 - HOIST
      ?auto_10284 - SURFACE
      ?auto_10287 - PLACE
      ?auto_10277 - HOIST
      ?auto_10280 - SURFACE
      ?auto_10278 - PLACE
      ?auto_10275 - HOIST
      ?auto_10279 - SURFACE
      ?auto_10288 - SURFACE
      ?auto_10266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10271 ?auto_10270 ) ( IS-CRATE ?auto_10265 ) ( not ( = ?auto_10268 ?auto_10270 ) ) ( HOIST-AT ?auto_10267 ?auto_10268 ) ( SURFACE-AT ?auto_10265 ?auto_10268 ) ( ON ?auto_10265 ?auto_10269 ) ( CLEAR ?auto_10265 ) ( not ( = ?auto_10264 ?auto_10265 ) ) ( not ( = ?auto_10264 ?auto_10269 ) ) ( not ( = ?auto_10265 ?auto_10269 ) ) ( not ( = ?auto_10271 ?auto_10267 ) ) ( IS-CRATE ?auto_10264 ) ( not ( = ?auto_10289 ?auto_10270 ) ) ( HOIST-AT ?auto_10286 ?auto_10289 ) ( SURFACE-AT ?auto_10264 ?auto_10289 ) ( ON ?auto_10264 ?auto_10274 ) ( CLEAR ?auto_10264 ) ( not ( = ?auto_10263 ?auto_10264 ) ) ( not ( = ?auto_10263 ?auto_10274 ) ) ( not ( = ?auto_10264 ?auto_10274 ) ) ( not ( = ?auto_10271 ?auto_10286 ) ) ( IS-CRATE ?auto_10263 ) ( not ( = ?auto_10272 ?auto_10270 ) ) ( HOIST-AT ?auto_10276 ?auto_10272 ) ( AVAILABLE ?auto_10276 ) ( SURFACE-AT ?auto_10263 ?auto_10272 ) ( ON ?auto_10263 ?auto_10282 ) ( CLEAR ?auto_10263 ) ( not ( = ?auto_10262 ?auto_10263 ) ) ( not ( = ?auto_10262 ?auto_10282 ) ) ( not ( = ?auto_10263 ?auto_10282 ) ) ( not ( = ?auto_10271 ?auto_10276 ) ) ( IS-CRATE ?auto_10262 ) ( AVAILABLE ?auto_10286 ) ( SURFACE-AT ?auto_10262 ?auto_10289 ) ( ON ?auto_10262 ?auto_10285 ) ( CLEAR ?auto_10262 ) ( not ( = ?auto_10261 ?auto_10262 ) ) ( not ( = ?auto_10261 ?auto_10285 ) ) ( not ( = ?auto_10262 ?auto_10285 ) ) ( IS-CRATE ?auto_10261 ) ( AVAILABLE ?auto_10267 ) ( SURFACE-AT ?auto_10261 ?auto_10268 ) ( ON ?auto_10261 ?auto_10283 ) ( CLEAR ?auto_10261 ) ( not ( = ?auto_10260 ?auto_10261 ) ) ( not ( = ?auto_10260 ?auto_10283 ) ) ( not ( = ?auto_10261 ?auto_10283 ) ) ( IS-CRATE ?auto_10260 ) ( not ( = ?auto_10281 ?auto_10270 ) ) ( HOIST-AT ?auto_10273 ?auto_10281 ) ( SURFACE-AT ?auto_10260 ?auto_10281 ) ( ON ?auto_10260 ?auto_10284 ) ( CLEAR ?auto_10260 ) ( not ( = ?auto_10259 ?auto_10260 ) ) ( not ( = ?auto_10259 ?auto_10284 ) ) ( not ( = ?auto_10260 ?auto_10284 ) ) ( not ( = ?auto_10271 ?auto_10273 ) ) ( IS-CRATE ?auto_10259 ) ( not ( = ?auto_10287 ?auto_10270 ) ) ( HOIST-AT ?auto_10277 ?auto_10287 ) ( AVAILABLE ?auto_10277 ) ( SURFACE-AT ?auto_10259 ?auto_10287 ) ( ON ?auto_10259 ?auto_10280 ) ( CLEAR ?auto_10259 ) ( not ( = ?auto_10258 ?auto_10259 ) ) ( not ( = ?auto_10258 ?auto_10280 ) ) ( not ( = ?auto_10259 ?auto_10280 ) ) ( not ( = ?auto_10271 ?auto_10277 ) ) ( IS-CRATE ?auto_10258 ) ( not ( = ?auto_10278 ?auto_10270 ) ) ( HOIST-AT ?auto_10275 ?auto_10278 ) ( AVAILABLE ?auto_10275 ) ( SURFACE-AT ?auto_10258 ?auto_10278 ) ( ON ?auto_10258 ?auto_10279 ) ( CLEAR ?auto_10258 ) ( not ( = ?auto_10257 ?auto_10258 ) ) ( not ( = ?auto_10257 ?auto_10279 ) ) ( not ( = ?auto_10258 ?auto_10279 ) ) ( not ( = ?auto_10271 ?auto_10275 ) ) ( SURFACE-AT ?auto_10256 ?auto_10270 ) ( CLEAR ?auto_10256 ) ( IS-CRATE ?auto_10257 ) ( AVAILABLE ?auto_10271 ) ( AVAILABLE ?auto_10273 ) ( SURFACE-AT ?auto_10257 ?auto_10281 ) ( ON ?auto_10257 ?auto_10288 ) ( CLEAR ?auto_10257 ) ( TRUCK-AT ?auto_10266 ?auto_10270 ) ( not ( = ?auto_10256 ?auto_10257 ) ) ( not ( = ?auto_10256 ?auto_10288 ) ) ( not ( = ?auto_10257 ?auto_10288 ) ) ( not ( = ?auto_10256 ?auto_10258 ) ) ( not ( = ?auto_10256 ?auto_10279 ) ) ( not ( = ?auto_10258 ?auto_10288 ) ) ( not ( = ?auto_10278 ?auto_10281 ) ) ( not ( = ?auto_10275 ?auto_10273 ) ) ( not ( = ?auto_10279 ?auto_10288 ) ) ( not ( = ?auto_10256 ?auto_10259 ) ) ( not ( = ?auto_10256 ?auto_10280 ) ) ( not ( = ?auto_10257 ?auto_10259 ) ) ( not ( = ?auto_10257 ?auto_10280 ) ) ( not ( = ?auto_10259 ?auto_10279 ) ) ( not ( = ?auto_10259 ?auto_10288 ) ) ( not ( = ?auto_10287 ?auto_10278 ) ) ( not ( = ?auto_10287 ?auto_10281 ) ) ( not ( = ?auto_10277 ?auto_10275 ) ) ( not ( = ?auto_10277 ?auto_10273 ) ) ( not ( = ?auto_10280 ?auto_10279 ) ) ( not ( = ?auto_10280 ?auto_10288 ) ) ( not ( = ?auto_10256 ?auto_10260 ) ) ( not ( = ?auto_10256 ?auto_10284 ) ) ( not ( = ?auto_10257 ?auto_10260 ) ) ( not ( = ?auto_10257 ?auto_10284 ) ) ( not ( = ?auto_10258 ?auto_10260 ) ) ( not ( = ?auto_10258 ?auto_10284 ) ) ( not ( = ?auto_10260 ?auto_10280 ) ) ( not ( = ?auto_10260 ?auto_10279 ) ) ( not ( = ?auto_10260 ?auto_10288 ) ) ( not ( = ?auto_10284 ?auto_10280 ) ) ( not ( = ?auto_10284 ?auto_10279 ) ) ( not ( = ?auto_10284 ?auto_10288 ) ) ( not ( = ?auto_10256 ?auto_10261 ) ) ( not ( = ?auto_10256 ?auto_10283 ) ) ( not ( = ?auto_10257 ?auto_10261 ) ) ( not ( = ?auto_10257 ?auto_10283 ) ) ( not ( = ?auto_10258 ?auto_10261 ) ) ( not ( = ?auto_10258 ?auto_10283 ) ) ( not ( = ?auto_10259 ?auto_10261 ) ) ( not ( = ?auto_10259 ?auto_10283 ) ) ( not ( = ?auto_10261 ?auto_10284 ) ) ( not ( = ?auto_10261 ?auto_10280 ) ) ( not ( = ?auto_10261 ?auto_10279 ) ) ( not ( = ?auto_10261 ?auto_10288 ) ) ( not ( = ?auto_10268 ?auto_10281 ) ) ( not ( = ?auto_10268 ?auto_10287 ) ) ( not ( = ?auto_10268 ?auto_10278 ) ) ( not ( = ?auto_10267 ?auto_10273 ) ) ( not ( = ?auto_10267 ?auto_10277 ) ) ( not ( = ?auto_10267 ?auto_10275 ) ) ( not ( = ?auto_10283 ?auto_10284 ) ) ( not ( = ?auto_10283 ?auto_10280 ) ) ( not ( = ?auto_10283 ?auto_10279 ) ) ( not ( = ?auto_10283 ?auto_10288 ) ) ( not ( = ?auto_10256 ?auto_10262 ) ) ( not ( = ?auto_10256 ?auto_10285 ) ) ( not ( = ?auto_10257 ?auto_10262 ) ) ( not ( = ?auto_10257 ?auto_10285 ) ) ( not ( = ?auto_10258 ?auto_10262 ) ) ( not ( = ?auto_10258 ?auto_10285 ) ) ( not ( = ?auto_10259 ?auto_10262 ) ) ( not ( = ?auto_10259 ?auto_10285 ) ) ( not ( = ?auto_10260 ?auto_10262 ) ) ( not ( = ?auto_10260 ?auto_10285 ) ) ( not ( = ?auto_10262 ?auto_10283 ) ) ( not ( = ?auto_10262 ?auto_10284 ) ) ( not ( = ?auto_10262 ?auto_10280 ) ) ( not ( = ?auto_10262 ?auto_10279 ) ) ( not ( = ?auto_10262 ?auto_10288 ) ) ( not ( = ?auto_10289 ?auto_10268 ) ) ( not ( = ?auto_10289 ?auto_10281 ) ) ( not ( = ?auto_10289 ?auto_10287 ) ) ( not ( = ?auto_10289 ?auto_10278 ) ) ( not ( = ?auto_10286 ?auto_10267 ) ) ( not ( = ?auto_10286 ?auto_10273 ) ) ( not ( = ?auto_10286 ?auto_10277 ) ) ( not ( = ?auto_10286 ?auto_10275 ) ) ( not ( = ?auto_10285 ?auto_10283 ) ) ( not ( = ?auto_10285 ?auto_10284 ) ) ( not ( = ?auto_10285 ?auto_10280 ) ) ( not ( = ?auto_10285 ?auto_10279 ) ) ( not ( = ?auto_10285 ?auto_10288 ) ) ( not ( = ?auto_10256 ?auto_10263 ) ) ( not ( = ?auto_10256 ?auto_10282 ) ) ( not ( = ?auto_10257 ?auto_10263 ) ) ( not ( = ?auto_10257 ?auto_10282 ) ) ( not ( = ?auto_10258 ?auto_10263 ) ) ( not ( = ?auto_10258 ?auto_10282 ) ) ( not ( = ?auto_10259 ?auto_10263 ) ) ( not ( = ?auto_10259 ?auto_10282 ) ) ( not ( = ?auto_10260 ?auto_10263 ) ) ( not ( = ?auto_10260 ?auto_10282 ) ) ( not ( = ?auto_10261 ?auto_10263 ) ) ( not ( = ?auto_10261 ?auto_10282 ) ) ( not ( = ?auto_10263 ?auto_10285 ) ) ( not ( = ?auto_10263 ?auto_10283 ) ) ( not ( = ?auto_10263 ?auto_10284 ) ) ( not ( = ?auto_10263 ?auto_10280 ) ) ( not ( = ?auto_10263 ?auto_10279 ) ) ( not ( = ?auto_10263 ?auto_10288 ) ) ( not ( = ?auto_10272 ?auto_10289 ) ) ( not ( = ?auto_10272 ?auto_10268 ) ) ( not ( = ?auto_10272 ?auto_10281 ) ) ( not ( = ?auto_10272 ?auto_10287 ) ) ( not ( = ?auto_10272 ?auto_10278 ) ) ( not ( = ?auto_10276 ?auto_10286 ) ) ( not ( = ?auto_10276 ?auto_10267 ) ) ( not ( = ?auto_10276 ?auto_10273 ) ) ( not ( = ?auto_10276 ?auto_10277 ) ) ( not ( = ?auto_10276 ?auto_10275 ) ) ( not ( = ?auto_10282 ?auto_10285 ) ) ( not ( = ?auto_10282 ?auto_10283 ) ) ( not ( = ?auto_10282 ?auto_10284 ) ) ( not ( = ?auto_10282 ?auto_10280 ) ) ( not ( = ?auto_10282 ?auto_10279 ) ) ( not ( = ?auto_10282 ?auto_10288 ) ) ( not ( = ?auto_10256 ?auto_10264 ) ) ( not ( = ?auto_10256 ?auto_10274 ) ) ( not ( = ?auto_10257 ?auto_10264 ) ) ( not ( = ?auto_10257 ?auto_10274 ) ) ( not ( = ?auto_10258 ?auto_10264 ) ) ( not ( = ?auto_10258 ?auto_10274 ) ) ( not ( = ?auto_10259 ?auto_10264 ) ) ( not ( = ?auto_10259 ?auto_10274 ) ) ( not ( = ?auto_10260 ?auto_10264 ) ) ( not ( = ?auto_10260 ?auto_10274 ) ) ( not ( = ?auto_10261 ?auto_10264 ) ) ( not ( = ?auto_10261 ?auto_10274 ) ) ( not ( = ?auto_10262 ?auto_10264 ) ) ( not ( = ?auto_10262 ?auto_10274 ) ) ( not ( = ?auto_10264 ?auto_10282 ) ) ( not ( = ?auto_10264 ?auto_10285 ) ) ( not ( = ?auto_10264 ?auto_10283 ) ) ( not ( = ?auto_10264 ?auto_10284 ) ) ( not ( = ?auto_10264 ?auto_10280 ) ) ( not ( = ?auto_10264 ?auto_10279 ) ) ( not ( = ?auto_10264 ?auto_10288 ) ) ( not ( = ?auto_10274 ?auto_10282 ) ) ( not ( = ?auto_10274 ?auto_10285 ) ) ( not ( = ?auto_10274 ?auto_10283 ) ) ( not ( = ?auto_10274 ?auto_10284 ) ) ( not ( = ?auto_10274 ?auto_10280 ) ) ( not ( = ?auto_10274 ?auto_10279 ) ) ( not ( = ?auto_10274 ?auto_10288 ) ) ( not ( = ?auto_10256 ?auto_10265 ) ) ( not ( = ?auto_10256 ?auto_10269 ) ) ( not ( = ?auto_10257 ?auto_10265 ) ) ( not ( = ?auto_10257 ?auto_10269 ) ) ( not ( = ?auto_10258 ?auto_10265 ) ) ( not ( = ?auto_10258 ?auto_10269 ) ) ( not ( = ?auto_10259 ?auto_10265 ) ) ( not ( = ?auto_10259 ?auto_10269 ) ) ( not ( = ?auto_10260 ?auto_10265 ) ) ( not ( = ?auto_10260 ?auto_10269 ) ) ( not ( = ?auto_10261 ?auto_10265 ) ) ( not ( = ?auto_10261 ?auto_10269 ) ) ( not ( = ?auto_10262 ?auto_10265 ) ) ( not ( = ?auto_10262 ?auto_10269 ) ) ( not ( = ?auto_10263 ?auto_10265 ) ) ( not ( = ?auto_10263 ?auto_10269 ) ) ( not ( = ?auto_10265 ?auto_10274 ) ) ( not ( = ?auto_10265 ?auto_10282 ) ) ( not ( = ?auto_10265 ?auto_10285 ) ) ( not ( = ?auto_10265 ?auto_10283 ) ) ( not ( = ?auto_10265 ?auto_10284 ) ) ( not ( = ?auto_10265 ?auto_10280 ) ) ( not ( = ?auto_10265 ?auto_10279 ) ) ( not ( = ?auto_10265 ?auto_10288 ) ) ( not ( = ?auto_10269 ?auto_10274 ) ) ( not ( = ?auto_10269 ?auto_10282 ) ) ( not ( = ?auto_10269 ?auto_10285 ) ) ( not ( = ?auto_10269 ?auto_10283 ) ) ( not ( = ?auto_10269 ?auto_10284 ) ) ( not ( = ?auto_10269 ?auto_10280 ) ) ( not ( = ?auto_10269 ?auto_10279 ) ) ( not ( = ?auto_10269 ?auto_10288 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_10256 ?auto_10257 ?auto_10258 ?auto_10259 ?auto_10260 ?auto_10261 ?auto_10262 ?auto_10263 ?auto_10264 )
      ( MAKE-1CRATE ?auto_10264 ?auto_10265 )
      ( MAKE-9CRATE-VERIFY ?auto_10256 ?auto_10257 ?auto_10258 ?auto_10259 ?auto_10260 ?auto_10261 ?auto_10262 ?auto_10263 ?auto_10264 ?auto_10265 ) )
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
      ?auto_10318 - SURFACE
      ?auto_10319 - SURFACE
      ?auto_10320 - SURFACE
      ?auto_10321 - SURFACE
    )
    :vars
    (
      ?auto_10327 - HOIST
      ?auto_10325 - PLACE
      ?auto_10322 - PLACE
      ?auto_10324 - HOIST
      ?auto_10323 - SURFACE
      ?auto_10336 - PLACE
      ?auto_10330 - HOIST
      ?auto_10332 - SURFACE
      ?auto_10339 - PLACE
      ?auto_10345 - HOIST
      ?auto_10343 - SURFACE
      ?auto_10341 - PLACE
      ?auto_10331 - HOIST
      ?auto_10340 - SURFACE
      ?auto_10337 - SURFACE
      ?auto_10334 - SURFACE
      ?auto_10333 - PLACE
      ?auto_10342 - HOIST
      ?auto_10328 - SURFACE
      ?auto_10346 - PLACE
      ?auto_10335 - HOIST
      ?auto_10344 - SURFACE
      ?auto_10329 - SURFACE
      ?auto_10338 - SURFACE
      ?auto_10326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10327 ?auto_10325 ) ( IS-CRATE ?auto_10321 ) ( not ( = ?auto_10322 ?auto_10325 ) ) ( HOIST-AT ?auto_10324 ?auto_10322 ) ( SURFACE-AT ?auto_10321 ?auto_10322 ) ( ON ?auto_10321 ?auto_10323 ) ( CLEAR ?auto_10321 ) ( not ( = ?auto_10320 ?auto_10321 ) ) ( not ( = ?auto_10320 ?auto_10323 ) ) ( not ( = ?auto_10321 ?auto_10323 ) ) ( not ( = ?auto_10327 ?auto_10324 ) ) ( IS-CRATE ?auto_10320 ) ( not ( = ?auto_10336 ?auto_10325 ) ) ( HOIST-AT ?auto_10330 ?auto_10336 ) ( SURFACE-AT ?auto_10320 ?auto_10336 ) ( ON ?auto_10320 ?auto_10332 ) ( CLEAR ?auto_10320 ) ( not ( = ?auto_10319 ?auto_10320 ) ) ( not ( = ?auto_10319 ?auto_10332 ) ) ( not ( = ?auto_10320 ?auto_10332 ) ) ( not ( = ?auto_10327 ?auto_10330 ) ) ( IS-CRATE ?auto_10319 ) ( not ( = ?auto_10339 ?auto_10325 ) ) ( HOIST-AT ?auto_10345 ?auto_10339 ) ( SURFACE-AT ?auto_10319 ?auto_10339 ) ( ON ?auto_10319 ?auto_10343 ) ( CLEAR ?auto_10319 ) ( not ( = ?auto_10318 ?auto_10319 ) ) ( not ( = ?auto_10318 ?auto_10343 ) ) ( not ( = ?auto_10319 ?auto_10343 ) ) ( not ( = ?auto_10327 ?auto_10345 ) ) ( IS-CRATE ?auto_10318 ) ( not ( = ?auto_10341 ?auto_10325 ) ) ( HOIST-AT ?auto_10331 ?auto_10341 ) ( AVAILABLE ?auto_10331 ) ( SURFACE-AT ?auto_10318 ?auto_10341 ) ( ON ?auto_10318 ?auto_10340 ) ( CLEAR ?auto_10318 ) ( not ( = ?auto_10317 ?auto_10318 ) ) ( not ( = ?auto_10317 ?auto_10340 ) ) ( not ( = ?auto_10318 ?auto_10340 ) ) ( not ( = ?auto_10327 ?auto_10331 ) ) ( IS-CRATE ?auto_10317 ) ( AVAILABLE ?auto_10345 ) ( SURFACE-AT ?auto_10317 ?auto_10339 ) ( ON ?auto_10317 ?auto_10337 ) ( CLEAR ?auto_10317 ) ( not ( = ?auto_10316 ?auto_10317 ) ) ( not ( = ?auto_10316 ?auto_10337 ) ) ( not ( = ?auto_10317 ?auto_10337 ) ) ( IS-CRATE ?auto_10316 ) ( AVAILABLE ?auto_10330 ) ( SURFACE-AT ?auto_10316 ?auto_10336 ) ( ON ?auto_10316 ?auto_10334 ) ( CLEAR ?auto_10316 ) ( not ( = ?auto_10315 ?auto_10316 ) ) ( not ( = ?auto_10315 ?auto_10334 ) ) ( not ( = ?auto_10316 ?auto_10334 ) ) ( IS-CRATE ?auto_10315 ) ( not ( = ?auto_10333 ?auto_10325 ) ) ( HOIST-AT ?auto_10342 ?auto_10333 ) ( SURFACE-AT ?auto_10315 ?auto_10333 ) ( ON ?auto_10315 ?auto_10328 ) ( CLEAR ?auto_10315 ) ( not ( = ?auto_10314 ?auto_10315 ) ) ( not ( = ?auto_10314 ?auto_10328 ) ) ( not ( = ?auto_10315 ?auto_10328 ) ) ( not ( = ?auto_10327 ?auto_10342 ) ) ( IS-CRATE ?auto_10314 ) ( not ( = ?auto_10346 ?auto_10325 ) ) ( HOIST-AT ?auto_10335 ?auto_10346 ) ( AVAILABLE ?auto_10335 ) ( SURFACE-AT ?auto_10314 ?auto_10346 ) ( ON ?auto_10314 ?auto_10344 ) ( CLEAR ?auto_10314 ) ( not ( = ?auto_10313 ?auto_10314 ) ) ( not ( = ?auto_10313 ?auto_10344 ) ) ( not ( = ?auto_10314 ?auto_10344 ) ) ( not ( = ?auto_10327 ?auto_10335 ) ) ( IS-CRATE ?auto_10313 ) ( AVAILABLE ?auto_10324 ) ( SURFACE-AT ?auto_10313 ?auto_10322 ) ( ON ?auto_10313 ?auto_10329 ) ( CLEAR ?auto_10313 ) ( not ( = ?auto_10312 ?auto_10313 ) ) ( not ( = ?auto_10312 ?auto_10329 ) ) ( not ( = ?auto_10313 ?auto_10329 ) ) ( SURFACE-AT ?auto_10311 ?auto_10325 ) ( CLEAR ?auto_10311 ) ( IS-CRATE ?auto_10312 ) ( AVAILABLE ?auto_10327 ) ( AVAILABLE ?auto_10342 ) ( SURFACE-AT ?auto_10312 ?auto_10333 ) ( ON ?auto_10312 ?auto_10338 ) ( CLEAR ?auto_10312 ) ( TRUCK-AT ?auto_10326 ?auto_10325 ) ( not ( = ?auto_10311 ?auto_10312 ) ) ( not ( = ?auto_10311 ?auto_10338 ) ) ( not ( = ?auto_10312 ?auto_10338 ) ) ( not ( = ?auto_10311 ?auto_10313 ) ) ( not ( = ?auto_10311 ?auto_10329 ) ) ( not ( = ?auto_10313 ?auto_10338 ) ) ( not ( = ?auto_10322 ?auto_10333 ) ) ( not ( = ?auto_10324 ?auto_10342 ) ) ( not ( = ?auto_10329 ?auto_10338 ) ) ( not ( = ?auto_10311 ?auto_10314 ) ) ( not ( = ?auto_10311 ?auto_10344 ) ) ( not ( = ?auto_10312 ?auto_10314 ) ) ( not ( = ?auto_10312 ?auto_10344 ) ) ( not ( = ?auto_10314 ?auto_10329 ) ) ( not ( = ?auto_10314 ?auto_10338 ) ) ( not ( = ?auto_10346 ?auto_10322 ) ) ( not ( = ?auto_10346 ?auto_10333 ) ) ( not ( = ?auto_10335 ?auto_10324 ) ) ( not ( = ?auto_10335 ?auto_10342 ) ) ( not ( = ?auto_10344 ?auto_10329 ) ) ( not ( = ?auto_10344 ?auto_10338 ) ) ( not ( = ?auto_10311 ?auto_10315 ) ) ( not ( = ?auto_10311 ?auto_10328 ) ) ( not ( = ?auto_10312 ?auto_10315 ) ) ( not ( = ?auto_10312 ?auto_10328 ) ) ( not ( = ?auto_10313 ?auto_10315 ) ) ( not ( = ?auto_10313 ?auto_10328 ) ) ( not ( = ?auto_10315 ?auto_10344 ) ) ( not ( = ?auto_10315 ?auto_10329 ) ) ( not ( = ?auto_10315 ?auto_10338 ) ) ( not ( = ?auto_10328 ?auto_10344 ) ) ( not ( = ?auto_10328 ?auto_10329 ) ) ( not ( = ?auto_10328 ?auto_10338 ) ) ( not ( = ?auto_10311 ?auto_10316 ) ) ( not ( = ?auto_10311 ?auto_10334 ) ) ( not ( = ?auto_10312 ?auto_10316 ) ) ( not ( = ?auto_10312 ?auto_10334 ) ) ( not ( = ?auto_10313 ?auto_10316 ) ) ( not ( = ?auto_10313 ?auto_10334 ) ) ( not ( = ?auto_10314 ?auto_10316 ) ) ( not ( = ?auto_10314 ?auto_10334 ) ) ( not ( = ?auto_10316 ?auto_10328 ) ) ( not ( = ?auto_10316 ?auto_10344 ) ) ( not ( = ?auto_10316 ?auto_10329 ) ) ( not ( = ?auto_10316 ?auto_10338 ) ) ( not ( = ?auto_10336 ?auto_10333 ) ) ( not ( = ?auto_10336 ?auto_10346 ) ) ( not ( = ?auto_10336 ?auto_10322 ) ) ( not ( = ?auto_10330 ?auto_10342 ) ) ( not ( = ?auto_10330 ?auto_10335 ) ) ( not ( = ?auto_10330 ?auto_10324 ) ) ( not ( = ?auto_10334 ?auto_10328 ) ) ( not ( = ?auto_10334 ?auto_10344 ) ) ( not ( = ?auto_10334 ?auto_10329 ) ) ( not ( = ?auto_10334 ?auto_10338 ) ) ( not ( = ?auto_10311 ?auto_10317 ) ) ( not ( = ?auto_10311 ?auto_10337 ) ) ( not ( = ?auto_10312 ?auto_10317 ) ) ( not ( = ?auto_10312 ?auto_10337 ) ) ( not ( = ?auto_10313 ?auto_10317 ) ) ( not ( = ?auto_10313 ?auto_10337 ) ) ( not ( = ?auto_10314 ?auto_10317 ) ) ( not ( = ?auto_10314 ?auto_10337 ) ) ( not ( = ?auto_10315 ?auto_10317 ) ) ( not ( = ?auto_10315 ?auto_10337 ) ) ( not ( = ?auto_10317 ?auto_10334 ) ) ( not ( = ?auto_10317 ?auto_10328 ) ) ( not ( = ?auto_10317 ?auto_10344 ) ) ( not ( = ?auto_10317 ?auto_10329 ) ) ( not ( = ?auto_10317 ?auto_10338 ) ) ( not ( = ?auto_10339 ?auto_10336 ) ) ( not ( = ?auto_10339 ?auto_10333 ) ) ( not ( = ?auto_10339 ?auto_10346 ) ) ( not ( = ?auto_10339 ?auto_10322 ) ) ( not ( = ?auto_10345 ?auto_10330 ) ) ( not ( = ?auto_10345 ?auto_10342 ) ) ( not ( = ?auto_10345 ?auto_10335 ) ) ( not ( = ?auto_10345 ?auto_10324 ) ) ( not ( = ?auto_10337 ?auto_10334 ) ) ( not ( = ?auto_10337 ?auto_10328 ) ) ( not ( = ?auto_10337 ?auto_10344 ) ) ( not ( = ?auto_10337 ?auto_10329 ) ) ( not ( = ?auto_10337 ?auto_10338 ) ) ( not ( = ?auto_10311 ?auto_10318 ) ) ( not ( = ?auto_10311 ?auto_10340 ) ) ( not ( = ?auto_10312 ?auto_10318 ) ) ( not ( = ?auto_10312 ?auto_10340 ) ) ( not ( = ?auto_10313 ?auto_10318 ) ) ( not ( = ?auto_10313 ?auto_10340 ) ) ( not ( = ?auto_10314 ?auto_10318 ) ) ( not ( = ?auto_10314 ?auto_10340 ) ) ( not ( = ?auto_10315 ?auto_10318 ) ) ( not ( = ?auto_10315 ?auto_10340 ) ) ( not ( = ?auto_10316 ?auto_10318 ) ) ( not ( = ?auto_10316 ?auto_10340 ) ) ( not ( = ?auto_10318 ?auto_10337 ) ) ( not ( = ?auto_10318 ?auto_10334 ) ) ( not ( = ?auto_10318 ?auto_10328 ) ) ( not ( = ?auto_10318 ?auto_10344 ) ) ( not ( = ?auto_10318 ?auto_10329 ) ) ( not ( = ?auto_10318 ?auto_10338 ) ) ( not ( = ?auto_10341 ?auto_10339 ) ) ( not ( = ?auto_10341 ?auto_10336 ) ) ( not ( = ?auto_10341 ?auto_10333 ) ) ( not ( = ?auto_10341 ?auto_10346 ) ) ( not ( = ?auto_10341 ?auto_10322 ) ) ( not ( = ?auto_10331 ?auto_10345 ) ) ( not ( = ?auto_10331 ?auto_10330 ) ) ( not ( = ?auto_10331 ?auto_10342 ) ) ( not ( = ?auto_10331 ?auto_10335 ) ) ( not ( = ?auto_10331 ?auto_10324 ) ) ( not ( = ?auto_10340 ?auto_10337 ) ) ( not ( = ?auto_10340 ?auto_10334 ) ) ( not ( = ?auto_10340 ?auto_10328 ) ) ( not ( = ?auto_10340 ?auto_10344 ) ) ( not ( = ?auto_10340 ?auto_10329 ) ) ( not ( = ?auto_10340 ?auto_10338 ) ) ( not ( = ?auto_10311 ?auto_10319 ) ) ( not ( = ?auto_10311 ?auto_10343 ) ) ( not ( = ?auto_10312 ?auto_10319 ) ) ( not ( = ?auto_10312 ?auto_10343 ) ) ( not ( = ?auto_10313 ?auto_10319 ) ) ( not ( = ?auto_10313 ?auto_10343 ) ) ( not ( = ?auto_10314 ?auto_10319 ) ) ( not ( = ?auto_10314 ?auto_10343 ) ) ( not ( = ?auto_10315 ?auto_10319 ) ) ( not ( = ?auto_10315 ?auto_10343 ) ) ( not ( = ?auto_10316 ?auto_10319 ) ) ( not ( = ?auto_10316 ?auto_10343 ) ) ( not ( = ?auto_10317 ?auto_10319 ) ) ( not ( = ?auto_10317 ?auto_10343 ) ) ( not ( = ?auto_10319 ?auto_10340 ) ) ( not ( = ?auto_10319 ?auto_10337 ) ) ( not ( = ?auto_10319 ?auto_10334 ) ) ( not ( = ?auto_10319 ?auto_10328 ) ) ( not ( = ?auto_10319 ?auto_10344 ) ) ( not ( = ?auto_10319 ?auto_10329 ) ) ( not ( = ?auto_10319 ?auto_10338 ) ) ( not ( = ?auto_10343 ?auto_10340 ) ) ( not ( = ?auto_10343 ?auto_10337 ) ) ( not ( = ?auto_10343 ?auto_10334 ) ) ( not ( = ?auto_10343 ?auto_10328 ) ) ( not ( = ?auto_10343 ?auto_10344 ) ) ( not ( = ?auto_10343 ?auto_10329 ) ) ( not ( = ?auto_10343 ?auto_10338 ) ) ( not ( = ?auto_10311 ?auto_10320 ) ) ( not ( = ?auto_10311 ?auto_10332 ) ) ( not ( = ?auto_10312 ?auto_10320 ) ) ( not ( = ?auto_10312 ?auto_10332 ) ) ( not ( = ?auto_10313 ?auto_10320 ) ) ( not ( = ?auto_10313 ?auto_10332 ) ) ( not ( = ?auto_10314 ?auto_10320 ) ) ( not ( = ?auto_10314 ?auto_10332 ) ) ( not ( = ?auto_10315 ?auto_10320 ) ) ( not ( = ?auto_10315 ?auto_10332 ) ) ( not ( = ?auto_10316 ?auto_10320 ) ) ( not ( = ?auto_10316 ?auto_10332 ) ) ( not ( = ?auto_10317 ?auto_10320 ) ) ( not ( = ?auto_10317 ?auto_10332 ) ) ( not ( = ?auto_10318 ?auto_10320 ) ) ( not ( = ?auto_10318 ?auto_10332 ) ) ( not ( = ?auto_10320 ?auto_10343 ) ) ( not ( = ?auto_10320 ?auto_10340 ) ) ( not ( = ?auto_10320 ?auto_10337 ) ) ( not ( = ?auto_10320 ?auto_10334 ) ) ( not ( = ?auto_10320 ?auto_10328 ) ) ( not ( = ?auto_10320 ?auto_10344 ) ) ( not ( = ?auto_10320 ?auto_10329 ) ) ( not ( = ?auto_10320 ?auto_10338 ) ) ( not ( = ?auto_10332 ?auto_10343 ) ) ( not ( = ?auto_10332 ?auto_10340 ) ) ( not ( = ?auto_10332 ?auto_10337 ) ) ( not ( = ?auto_10332 ?auto_10334 ) ) ( not ( = ?auto_10332 ?auto_10328 ) ) ( not ( = ?auto_10332 ?auto_10344 ) ) ( not ( = ?auto_10332 ?auto_10329 ) ) ( not ( = ?auto_10332 ?auto_10338 ) ) ( not ( = ?auto_10311 ?auto_10321 ) ) ( not ( = ?auto_10311 ?auto_10323 ) ) ( not ( = ?auto_10312 ?auto_10321 ) ) ( not ( = ?auto_10312 ?auto_10323 ) ) ( not ( = ?auto_10313 ?auto_10321 ) ) ( not ( = ?auto_10313 ?auto_10323 ) ) ( not ( = ?auto_10314 ?auto_10321 ) ) ( not ( = ?auto_10314 ?auto_10323 ) ) ( not ( = ?auto_10315 ?auto_10321 ) ) ( not ( = ?auto_10315 ?auto_10323 ) ) ( not ( = ?auto_10316 ?auto_10321 ) ) ( not ( = ?auto_10316 ?auto_10323 ) ) ( not ( = ?auto_10317 ?auto_10321 ) ) ( not ( = ?auto_10317 ?auto_10323 ) ) ( not ( = ?auto_10318 ?auto_10321 ) ) ( not ( = ?auto_10318 ?auto_10323 ) ) ( not ( = ?auto_10319 ?auto_10321 ) ) ( not ( = ?auto_10319 ?auto_10323 ) ) ( not ( = ?auto_10321 ?auto_10332 ) ) ( not ( = ?auto_10321 ?auto_10343 ) ) ( not ( = ?auto_10321 ?auto_10340 ) ) ( not ( = ?auto_10321 ?auto_10337 ) ) ( not ( = ?auto_10321 ?auto_10334 ) ) ( not ( = ?auto_10321 ?auto_10328 ) ) ( not ( = ?auto_10321 ?auto_10344 ) ) ( not ( = ?auto_10321 ?auto_10329 ) ) ( not ( = ?auto_10321 ?auto_10338 ) ) ( not ( = ?auto_10323 ?auto_10332 ) ) ( not ( = ?auto_10323 ?auto_10343 ) ) ( not ( = ?auto_10323 ?auto_10340 ) ) ( not ( = ?auto_10323 ?auto_10337 ) ) ( not ( = ?auto_10323 ?auto_10334 ) ) ( not ( = ?auto_10323 ?auto_10328 ) ) ( not ( = ?auto_10323 ?auto_10344 ) ) ( not ( = ?auto_10323 ?auto_10329 ) ) ( not ( = ?auto_10323 ?auto_10338 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_10311 ?auto_10312 ?auto_10313 ?auto_10314 ?auto_10315 ?auto_10316 ?auto_10317 ?auto_10318 ?auto_10319 ?auto_10320 )
      ( MAKE-1CRATE ?auto_10320 ?auto_10321 )
      ( MAKE-10CRATE-VERIFY ?auto_10311 ?auto_10312 ?auto_10313 ?auto_10314 ?auto_10315 ?auto_10316 ?auto_10317 ?auto_10318 ?auto_10319 ?auto_10320 ?auto_10321 ) )
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
      ?auto_10376 - SURFACE
      ?auto_10377 - SURFACE
      ?auto_10378 - SURFACE
      ?auto_10379 - SURFACE
      ?auto_10380 - SURFACE
    )
    :vars
    (
      ?auto_10386 - HOIST
      ?auto_10383 - PLACE
      ?auto_10384 - PLACE
      ?auto_10385 - HOIST
      ?auto_10381 - SURFACE
      ?auto_10401 - PLACE
      ?auto_10398 - HOIST
      ?auto_10400 - SURFACE
      ?auto_10390 - PLACE
      ?auto_10389 - HOIST
      ?auto_10395 - SURFACE
      ?auto_10387 - PLACE
      ?auto_10396 - HOIST
      ?auto_10406 - SURFACE
      ?auto_10402 - PLACE
      ?auto_10391 - HOIST
      ?auto_10404 - SURFACE
      ?auto_10403 - SURFACE
      ?auto_10399 - SURFACE
      ?auto_10388 - SURFACE
      ?auto_10394 - PLACE
      ?auto_10397 - HOIST
      ?auto_10392 - SURFACE
      ?auto_10393 - SURFACE
      ?auto_10405 - SURFACE
      ?auto_10382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10386 ?auto_10383 ) ( IS-CRATE ?auto_10380 ) ( not ( = ?auto_10384 ?auto_10383 ) ) ( HOIST-AT ?auto_10385 ?auto_10384 ) ( SURFACE-AT ?auto_10380 ?auto_10384 ) ( ON ?auto_10380 ?auto_10381 ) ( CLEAR ?auto_10380 ) ( not ( = ?auto_10379 ?auto_10380 ) ) ( not ( = ?auto_10379 ?auto_10381 ) ) ( not ( = ?auto_10380 ?auto_10381 ) ) ( not ( = ?auto_10386 ?auto_10385 ) ) ( IS-CRATE ?auto_10379 ) ( not ( = ?auto_10401 ?auto_10383 ) ) ( HOIST-AT ?auto_10398 ?auto_10401 ) ( SURFACE-AT ?auto_10379 ?auto_10401 ) ( ON ?auto_10379 ?auto_10400 ) ( CLEAR ?auto_10379 ) ( not ( = ?auto_10378 ?auto_10379 ) ) ( not ( = ?auto_10378 ?auto_10400 ) ) ( not ( = ?auto_10379 ?auto_10400 ) ) ( not ( = ?auto_10386 ?auto_10398 ) ) ( IS-CRATE ?auto_10378 ) ( not ( = ?auto_10390 ?auto_10383 ) ) ( HOIST-AT ?auto_10389 ?auto_10390 ) ( SURFACE-AT ?auto_10378 ?auto_10390 ) ( ON ?auto_10378 ?auto_10395 ) ( CLEAR ?auto_10378 ) ( not ( = ?auto_10377 ?auto_10378 ) ) ( not ( = ?auto_10377 ?auto_10395 ) ) ( not ( = ?auto_10378 ?auto_10395 ) ) ( not ( = ?auto_10386 ?auto_10389 ) ) ( IS-CRATE ?auto_10377 ) ( not ( = ?auto_10387 ?auto_10383 ) ) ( HOIST-AT ?auto_10396 ?auto_10387 ) ( SURFACE-AT ?auto_10377 ?auto_10387 ) ( ON ?auto_10377 ?auto_10406 ) ( CLEAR ?auto_10377 ) ( not ( = ?auto_10376 ?auto_10377 ) ) ( not ( = ?auto_10376 ?auto_10406 ) ) ( not ( = ?auto_10377 ?auto_10406 ) ) ( not ( = ?auto_10386 ?auto_10396 ) ) ( IS-CRATE ?auto_10376 ) ( not ( = ?auto_10402 ?auto_10383 ) ) ( HOIST-AT ?auto_10391 ?auto_10402 ) ( AVAILABLE ?auto_10391 ) ( SURFACE-AT ?auto_10376 ?auto_10402 ) ( ON ?auto_10376 ?auto_10404 ) ( CLEAR ?auto_10376 ) ( not ( = ?auto_10375 ?auto_10376 ) ) ( not ( = ?auto_10375 ?auto_10404 ) ) ( not ( = ?auto_10376 ?auto_10404 ) ) ( not ( = ?auto_10386 ?auto_10391 ) ) ( IS-CRATE ?auto_10375 ) ( AVAILABLE ?auto_10396 ) ( SURFACE-AT ?auto_10375 ?auto_10387 ) ( ON ?auto_10375 ?auto_10403 ) ( CLEAR ?auto_10375 ) ( not ( = ?auto_10374 ?auto_10375 ) ) ( not ( = ?auto_10374 ?auto_10403 ) ) ( not ( = ?auto_10375 ?auto_10403 ) ) ( IS-CRATE ?auto_10374 ) ( AVAILABLE ?auto_10389 ) ( SURFACE-AT ?auto_10374 ?auto_10390 ) ( ON ?auto_10374 ?auto_10399 ) ( CLEAR ?auto_10374 ) ( not ( = ?auto_10373 ?auto_10374 ) ) ( not ( = ?auto_10373 ?auto_10399 ) ) ( not ( = ?auto_10374 ?auto_10399 ) ) ( IS-CRATE ?auto_10373 ) ( SURFACE-AT ?auto_10373 ?auto_10384 ) ( ON ?auto_10373 ?auto_10388 ) ( CLEAR ?auto_10373 ) ( not ( = ?auto_10372 ?auto_10373 ) ) ( not ( = ?auto_10372 ?auto_10388 ) ) ( not ( = ?auto_10373 ?auto_10388 ) ) ( IS-CRATE ?auto_10372 ) ( not ( = ?auto_10394 ?auto_10383 ) ) ( HOIST-AT ?auto_10397 ?auto_10394 ) ( AVAILABLE ?auto_10397 ) ( SURFACE-AT ?auto_10372 ?auto_10394 ) ( ON ?auto_10372 ?auto_10392 ) ( CLEAR ?auto_10372 ) ( not ( = ?auto_10371 ?auto_10372 ) ) ( not ( = ?auto_10371 ?auto_10392 ) ) ( not ( = ?auto_10372 ?auto_10392 ) ) ( not ( = ?auto_10386 ?auto_10397 ) ) ( IS-CRATE ?auto_10371 ) ( AVAILABLE ?auto_10398 ) ( SURFACE-AT ?auto_10371 ?auto_10401 ) ( ON ?auto_10371 ?auto_10393 ) ( CLEAR ?auto_10371 ) ( not ( = ?auto_10370 ?auto_10371 ) ) ( not ( = ?auto_10370 ?auto_10393 ) ) ( not ( = ?auto_10371 ?auto_10393 ) ) ( SURFACE-AT ?auto_10369 ?auto_10383 ) ( CLEAR ?auto_10369 ) ( IS-CRATE ?auto_10370 ) ( AVAILABLE ?auto_10386 ) ( AVAILABLE ?auto_10385 ) ( SURFACE-AT ?auto_10370 ?auto_10384 ) ( ON ?auto_10370 ?auto_10405 ) ( CLEAR ?auto_10370 ) ( TRUCK-AT ?auto_10382 ?auto_10383 ) ( not ( = ?auto_10369 ?auto_10370 ) ) ( not ( = ?auto_10369 ?auto_10405 ) ) ( not ( = ?auto_10370 ?auto_10405 ) ) ( not ( = ?auto_10369 ?auto_10371 ) ) ( not ( = ?auto_10369 ?auto_10393 ) ) ( not ( = ?auto_10371 ?auto_10405 ) ) ( not ( = ?auto_10401 ?auto_10384 ) ) ( not ( = ?auto_10398 ?auto_10385 ) ) ( not ( = ?auto_10393 ?auto_10405 ) ) ( not ( = ?auto_10369 ?auto_10372 ) ) ( not ( = ?auto_10369 ?auto_10392 ) ) ( not ( = ?auto_10370 ?auto_10372 ) ) ( not ( = ?auto_10370 ?auto_10392 ) ) ( not ( = ?auto_10372 ?auto_10393 ) ) ( not ( = ?auto_10372 ?auto_10405 ) ) ( not ( = ?auto_10394 ?auto_10401 ) ) ( not ( = ?auto_10394 ?auto_10384 ) ) ( not ( = ?auto_10397 ?auto_10398 ) ) ( not ( = ?auto_10397 ?auto_10385 ) ) ( not ( = ?auto_10392 ?auto_10393 ) ) ( not ( = ?auto_10392 ?auto_10405 ) ) ( not ( = ?auto_10369 ?auto_10373 ) ) ( not ( = ?auto_10369 ?auto_10388 ) ) ( not ( = ?auto_10370 ?auto_10373 ) ) ( not ( = ?auto_10370 ?auto_10388 ) ) ( not ( = ?auto_10371 ?auto_10373 ) ) ( not ( = ?auto_10371 ?auto_10388 ) ) ( not ( = ?auto_10373 ?auto_10392 ) ) ( not ( = ?auto_10373 ?auto_10393 ) ) ( not ( = ?auto_10373 ?auto_10405 ) ) ( not ( = ?auto_10388 ?auto_10392 ) ) ( not ( = ?auto_10388 ?auto_10393 ) ) ( not ( = ?auto_10388 ?auto_10405 ) ) ( not ( = ?auto_10369 ?auto_10374 ) ) ( not ( = ?auto_10369 ?auto_10399 ) ) ( not ( = ?auto_10370 ?auto_10374 ) ) ( not ( = ?auto_10370 ?auto_10399 ) ) ( not ( = ?auto_10371 ?auto_10374 ) ) ( not ( = ?auto_10371 ?auto_10399 ) ) ( not ( = ?auto_10372 ?auto_10374 ) ) ( not ( = ?auto_10372 ?auto_10399 ) ) ( not ( = ?auto_10374 ?auto_10388 ) ) ( not ( = ?auto_10374 ?auto_10392 ) ) ( not ( = ?auto_10374 ?auto_10393 ) ) ( not ( = ?auto_10374 ?auto_10405 ) ) ( not ( = ?auto_10390 ?auto_10384 ) ) ( not ( = ?auto_10390 ?auto_10394 ) ) ( not ( = ?auto_10390 ?auto_10401 ) ) ( not ( = ?auto_10389 ?auto_10385 ) ) ( not ( = ?auto_10389 ?auto_10397 ) ) ( not ( = ?auto_10389 ?auto_10398 ) ) ( not ( = ?auto_10399 ?auto_10388 ) ) ( not ( = ?auto_10399 ?auto_10392 ) ) ( not ( = ?auto_10399 ?auto_10393 ) ) ( not ( = ?auto_10399 ?auto_10405 ) ) ( not ( = ?auto_10369 ?auto_10375 ) ) ( not ( = ?auto_10369 ?auto_10403 ) ) ( not ( = ?auto_10370 ?auto_10375 ) ) ( not ( = ?auto_10370 ?auto_10403 ) ) ( not ( = ?auto_10371 ?auto_10375 ) ) ( not ( = ?auto_10371 ?auto_10403 ) ) ( not ( = ?auto_10372 ?auto_10375 ) ) ( not ( = ?auto_10372 ?auto_10403 ) ) ( not ( = ?auto_10373 ?auto_10375 ) ) ( not ( = ?auto_10373 ?auto_10403 ) ) ( not ( = ?auto_10375 ?auto_10399 ) ) ( not ( = ?auto_10375 ?auto_10388 ) ) ( not ( = ?auto_10375 ?auto_10392 ) ) ( not ( = ?auto_10375 ?auto_10393 ) ) ( not ( = ?auto_10375 ?auto_10405 ) ) ( not ( = ?auto_10387 ?auto_10390 ) ) ( not ( = ?auto_10387 ?auto_10384 ) ) ( not ( = ?auto_10387 ?auto_10394 ) ) ( not ( = ?auto_10387 ?auto_10401 ) ) ( not ( = ?auto_10396 ?auto_10389 ) ) ( not ( = ?auto_10396 ?auto_10385 ) ) ( not ( = ?auto_10396 ?auto_10397 ) ) ( not ( = ?auto_10396 ?auto_10398 ) ) ( not ( = ?auto_10403 ?auto_10399 ) ) ( not ( = ?auto_10403 ?auto_10388 ) ) ( not ( = ?auto_10403 ?auto_10392 ) ) ( not ( = ?auto_10403 ?auto_10393 ) ) ( not ( = ?auto_10403 ?auto_10405 ) ) ( not ( = ?auto_10369 ?auto_10376 ) ) ( not ( = ?auto_10369 ?auto_10404 ) ) ( not ( = ?auto_10370 ?auto_10376 ) ) ( not ( = ?auto_10370 ?auto_10404 ) ) ( not ( = ?auto_10371 ?auto_10376 ) ) ( not ( = ?auto_10371 ?auto_10404 ) ) ( not ( = ?auto_10372 ?auto_10376 ) ) ( not ( = ?auto_10372 ?auto_10404 ) ) ( not ( = ?auto_10373 ?auto_10376 ) ) ( not ( = ?auto_10373 ?auto_10404 ) ) ( not ( = ?auto_10374 ?auto_10376 ) ) ( not ( = ?auto_10374 ?auto_10404 ) ) ( not ( = ?auto_10376 ?auto_10403 ) ) ( not ( = ?auto_10376 ?auto_10399 ) ) ( not ( = ?auto_10376 ?auto_10388 ) ) ( not ( = ?auto_10376 ?auto_10392 ) ) ( not ( = ?auto_10376 ?auto_10393 ) ) ( not ( = ?auto_10376 ?auto_10405 ) ) ( not ( = ?auto_10402 ?auto_10387 ) ) ( not ( = ?auto_10402 ?auto_10390 ) ) ( not ( = ?auto_10402 ?auto_10384 ) ) ( not ( = ?auto_10402 ?auto_10394 ) ) ( not ( = ?auto_10402 ?auto_10401 ) ) ( not ( = ?auto_10391 ?auto_10396 ) ) ( not ( = ?auto_10391 ?auto_10389 ) ) ( not ( = ?auto_10391 ?auto_10385 ) ) ( not ( = ?auto_10391 ?auto_10397 ) ) ( not ( = ?auto_10391 ?auto_10398 ) ) ( not ( = ?auto_10404 ?auto_10403 ) ) ( not ( = ?auto_10404 ?auto_10399 ) ) ( not ( = ?auto_10404 ?auto_10388 ) ) ( not ( = ?auto_10404 ?auto_10392 ) ) ( not ( = ?auto_10404 ?auto_10393 ) ) ( not ( = ?auto_10404 ?auto_10405 ) ) ( not ( = ?auto_10369 ?auto_10377 ) ) ( not ( = ?auto_10369 ?auto_10406 ) ) ( not ( = ?auto_10370 ?auto_10377 ) ) ( not ( = ?auto_10370 ?auto_10406 ) ) ( not ( = ?auto_10371 ?auto_10377 ) ) ( not ( = ?auto_10371 ?auto_10406 ) ) ( not ( = ?auto_10372 ?auto_10377 ) ) ( not ( = ?auto_10372 ?auto_10406 ) ) ( not ( = ?auto_10373 ?auto_10377 ) ) ( not ( = ?auto_10373 ?auto_10406 ) ) ( not ( = ?auto_10374 ?auto_10377 ) ) ( not ( = ?auto_10374 ?auto_10406 ) ) ( not ( = ?auto_10375 ?auto_10377 ) ) ( not ( = ?auto_10375 ?auto_10406 ) ) ( not ( = ?auto_10377 ?auto_10404 ) ) ( not ( = ?auto_10377 ?auto_10403 ) ) ( not ( = ?auto_10377 ?auto_10399 ) ) ( not ( = ?auto_10377 ?auto_10388 ) ) ( not ( = ?auto_10377 ?auto_10392 ) ) ( not ( = ?auto_10377 ?auto_10393 ) ) ( not ( = ?auto_10377 ?auto_10405 ) ) ( not ( = ?auto_10406 ?auto_10404 ) ) ( not ( = ?auto_10406 ?auto_10403 ) ) ( not ( = ?auto_10406 ?auto_10399 ) ) ( not ( = ?auto_10406 ?auto_10388 ) ) ( not ( = ?auto_10406 ?auto_10392 ) ) ( not ( = ?auto_10406 ?auto_10393 ) ) ( not ( = ?auto_10406 ?auto_10405 ) ) ( not ( = ?auto_10369 ?auto_10378 ) ) ( not ( = ?auto_10369 ?auto_10395 ) ) ( not ( = ?auto_10370 ?auto_10378 ) ) ( not ( = ?auto_10370 ?auto_10395 ) ) ( not ( = ?auto_10371 ?auto_10378 ) ) ( not ( = ?auto_10371 ?auto_10395 ) ) ( not ( = ?auto_10372 ?auto_10378 ) ) ( not ( = ?auto_10372 ?auto_10395 ) ) ( not ( = ?auto_10373 ?auto_10378 ) ) ( not ( = ?auto_10373 ?auto_10395 ) ) ( not ( = ?auto_10374 ?auto_10378 ) ) ( not ( = ?auto_10374 ?auto_10395 ) ) ( not ( = ?auto_10375 ?auto_10378 ) ) ( not ( = ?auto_10375 ?auto_10395 ) ) ( not ( = ?auto_10376 ?auto_10378 ) ) ( not ( = ?auto_10376 ?auto_10395 ) ) ( not ( = ?auto_10378 ?auto_10406 ) ) ( not ( = ?auto_10378 ?auto_10404 ) ) ( not ( = ?auto_10378 ?auto_10403 ) ) ( not ( = ?auto_10378 ?auto_10399 ) ) ( not ( = ?auto_10378 ?auto_10388 ) ) ( not ( = ?auto_10378 ?auto_10392 ) ) ( not ( = ?auto_10378 ?auto_10393 ) ) ( not ( = ?auto_10378 ?auto_10405 ) ) ( not ( = ?auto_10395 ?auto_10406 ) ) ( not ( = ?auto_10395 ?auto_10404 ) ) ( not ( = ?auto_10395 ?auto_10403 ) ) ( not ( = ?auto_10395 ?auto_10399 ) ) ( not ( = ?auto_10395 ?auto_10388 ) ) ( not ( = ?auto_10395 ?auto_10392 ) ) ( not ( = ?auto_10395 ?auto_10393 ) ) ( not ( = ?auto_10395 ?auto_10405 ) ) ( not ( = ?auto_10369 ?auto_10379 ) ) ( not ( = ?auto_10369 ?auto_10400 ) ) ( not ( = ?auto_10370 ?auto_10379 ) ) ( not ( = ?auto_10370 ?auto_10400 ) ) ( not ( = ?auto_10371 ?auto_10379 ) ) ( not ( = ?auto_10371 ?auto_10400 ) ) ( not ( = ?auto_10372 ?auto_10379 ) ) ( not ( = ?auto_10372 ?auto_10400 ) ) ( not ( = ?auto_10373 ?auto_10379 ) ) ( not ( = ?auto_10373 ?auto_10400 ) ) ( not ( = ?auto_10374 ?auto_10379 ) ) ( not ( = ?auto_10374 ?auto_10400 ) ) ( not ( = ?auto_10375 ?auto_10379 ) ) ( not ( = ?auto_10375 ?auto_10400 ) ) ( not ( = ?auto_10376 ?auto_10379 ) ) ( not ( = ?auto_10376 ?auto_10400 ) ) ( not ( = ?auto_10377 ?auto_10379 ) ) ( not ( = ?auto_10377 ?auto_10400 ) ) ( not ( = ?auto_10379 ?auto_10395 ) ) ( not ( = ?auto_10379 ?auto_10406 ) ) ( not ( = ?auto_10379 ?auto_10404 ) ) ( not ( = ?auto_10379 ?auto_10403 ) ) ( not ( = ?auto_10379 ?auto_10399 ) ) ( not ( = ?auto_10379 ?auto_10388 ) ) ( not ( = ?auto_10379 ?auto_10392 ) ) ( not ( = ?auto_10379 ?auto_10393 ) ) ( not ( = ?auto_10379 ?auto_10405 ) ) ( not ( = ?auto_10400 ?auto_10395 ) ) ( not ( = ?auto_10400 ?auto_10406 ) ) ( not ( = ?auto_10400 ?auto_10404 ) ) ( not ( = ?auto_10400 ?auto_10403 ) ) ( not ( = ?auto_10400 ?auto_10399 ) ) ( not ( = ?auto_10400 ?auto_10388 ) ) ( not ( = ?auto_10400 ?auto_10392 ) ) ( not ( = ?auto_10400 ?auto_10393 ) ) ( not ( = ?auto_10400 ?auto_10405 ) ) ( not ( = ?auto_10369 ?auto_10380 ) ) ( not ( = ?auto_10369 ?auto_10381 ) ) ( not ( = ?auto_10370 ?auto_10380 ) ) ( not ( = ?auto_10370 ?auto_10381 ) ) ( not ( = ?auto_10371 ?auto_10380 ) ) ( not ( = ?auto_10371 ?auto_10381 ) ) ( not ( = ?auto_10372 ?auto_10380 ) ) ( not ( = ?auto_10372 ?auto_10381 ) ) ( not ( = ?auto_10373 ?auto_10380 ) ) ( not ( = ?auto_10373 ?auto_10381 ) ) ( not ( = ?auto_10374 ?auto_10380 ) ) ( not ( = ?auto_10374 ?auto_10381 ) ) ( not ( = ?auto_10375 ?auto_10380 ) ) ( not ( = ?auto_10375 ?auto_10381 ) ) ( not ( = ?auto_10376 ?auto_10380 ) ) ( not ( = ?auto_10376 ?auto_10381 ) ) ( not ( = ?auto_10377 ?auto_10380 ) ) ( not ( = ?auto_10377 ?auto_10381 ) ) ( not ( = ?auto_10378 ?auto_10380 ) ) ( not ( = ?auto_10378 ?auto_10381 ) ) ( not ( = ?auto_10380 ?auto_10400 ) ) ( not ( = ?auto_10380 ?auto_10395 ) ) ( not ( = ?auto_10380 ?auto_10406 ) ) ( not ( = ?auto_10380 ?auto_10404 ) ) ( not ( = ?auto_10380 ?auto_10403 ) ) ( not ( = ?auto_10380 ?auto_10399 ) ) ( not ( = ?auto_10380 ?auto_10388 ) ) ( not ( = ?auto_10380 ?auto_10392 ) ) ( not ( = ?auto_10380 ?auto_10393 ) ) ( not ( = ?auto_10380 ?auto_10405 ) ) ( not ( = ?auto_10381 ?auto_10400 ) ) ( not ( = ?auto_10381 ?auto_10395 ) ) ( not ( = ?auto_10381 ?auto_10406 ) ) ( not ( = ?auto_10381 ?auto_10404 ) ) ( not ( = ?auto_10381 ?auto_10403 ) ) ( not ( = ?auto_10381 ?auto_10399 ) ) ( not ( = ?auto_10381 ?auto_10388 ) ) ( not ( = ?auto_10381 ?auto_10392 ) ) ( not ( = ?auto_10381 ?auto_10393 ) ) ( not ( = ?auto_10381 ?auto_10405 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_10369 ?auto_10370 ?auto_10371 ?auto_10372 ?auto_10373 ?auto_10374 ?auto_10375 ?auto_10376 ?auto_10377 ?auto_10378 ?auto_10379 )
      ( MAKE-1CRATE ?auto_10379 ?auto_10380 )
      ( MAKE-11CRATE-VERIFY ?auto_10369 ?auto_10370 ?auto_10371 ?auto_10372 ?auto_10373 ?auto_10374 ?auto_10375 ?auto_10376 ?auto_10377 ?auto_10378 ?auto_10379 ?auto_10380 ) )
  )

)

