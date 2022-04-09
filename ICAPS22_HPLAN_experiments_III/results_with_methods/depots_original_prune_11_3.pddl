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
      ?auto_517037 - SURFACE
      ?auto_517038 - SURFACE
    )
    :vars
    (
      ?auto_517039 - HOIST
      ?auto_517040 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517039 ?auto_517040 ) ( SURFACE-AT ?auto_517037 ?auto_517040 ) ( CLEAR ?auto_517037 ) ( LIFTING ?auto_517039 ?auto_517038 ) ( IS-CRATE ?auto_517038 ) ( not ( = ?auto_517037 ?auto_517038 ) ) )
    :subtasks
    ( ( !DROP ?auto_517039 ?auto_517038 ?auto_517037 ?auto_517040 )
      ( MAKE-1CRATE-VERIFY ?auto_517037 ?auto_517038 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517041 - SURFACE
      ?auto_517042 - SURFACE
    )
    :vars
    (
      ?auto_517044 - HOIST
      ?auto_517043 - PLACE
      ?auto_517045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517044 ?auto_517043 ) ( SURFACE-AT ?auto_517041 ?auto_517043 ) ( CLEAR ?auto_517041 ) ( IS-CRATE ?auto_517042 ) ( not ( = ?auto_517041 ?auto_517042 ) ) ( TRUCK-AT ?auto_517045 ?auto_517043 ) ( AVAILABLE ?auto_517044 ) ( IN ?auto_517042 ?auto_517045 ) )
    :subtasks
    ( ( !UNLOAD ?auto_517044 ?auto_517042 ?auto_517045 ?auto_517043 )
      ( MAKE-1CRATE ?auto_517041 ?auto_517042 )
      ( MAKE-1CRATE-VERIFY ?auto_517041 ?auto_517042 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517046 - SURFACE
      ?auto_517047 - SURFACE
    )
    :vars
    (
      ?auto_517048 - HOIST
      ?auto_517049 - PLACE
      ?auto_517050 - TRUCK
      ?auto_517051 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517048 ?auto_517049 ) ( SURFACE-AT ?auto_517046 ?auto_517049 ) ( CLEAR ?auto_517046 ) ( IS-CRATE ?auto_517047 ) ( not ( = ?auto_517046 ?auto_517047 ) ) ( AVAILABLE ?auto_517048 ) ( IN ?auto_517047 ?auto_517050 ) ( TRUCK-AT ?auto_517050 ?auto_517051 ) ( not ( = ?auto_517051 ?auto_517049 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_517050 ?auto_517051 ?auto_517049 )
      ( MAKE-1CRATE ?auto_517046 ?auto_517047 )
      ( MAKE-1CRATE-VERIFY ?auto_517046 ?auto_517047 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517052 - SURFACE
      ?auto_517053 - SURFACE
    )
    :vars
    (
      ?auto_517055 - HOIST
      ?auto_517054 - PLACE
      ?auto_517057 - TRUCK
      ?auto_517056 - PLACE
      ?auto_517058 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_517055 ?auto_517054 ) ( SURFACE-AT ?auto_517052 ?auto_517054 ) ( CLEAR ?auto_517052 ) ( IS-CRATE ?auto_517053 ) ( not ( = ?auto_517052 ?auto_517053 ) ) ( AVAILABLE ?auto_517055 ) ( TRUCK-AT ?auto_517057 ?auto_517056 ) ( not ( = ?auto_517056 ?auto_517054 ) ) ( HOIST-AT ?auto_517058 ?auto_517056 ) ( LIFTING ?auto_517058 ?auto_517053 ) ( not ( = ?auto_517055 ?auto_517058 ) ) )
    :subtasks
    ( ( !LOAD ?auto_517058 ?auto_517053 ?auto_517057 ?auto_517056 )
      ( MAKE-1CRATE ?auto_517052 ?auto_517053 )
      ( MAKE-1CRATE-VERIFY ?auto_517052 ?auto_517053 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517059 - SURFACE
      ?auto_517060 - SURFACE
    )
    :vars
    (
      ?auto_517061 - HOIST
      ?auto_517063 - PLACE
      ?auto_517062 - TRUCK
      ?auto_517064 - PLACE
      ?auto_517065 - HOIST
      ?auto_517066 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517061 ?auto_517063 ) ( SURFACE-AT ?auto_517059 ?auto_517063 ) ( CLEAR ?auto_517059 ) ( IS-CRATE ?auto_517060 ) ( not ( = ?auto_517059 ?auto_517060 ) ) ( AVAILABLE ?auto_517061 ) ( TRUCK-AT ?auto_517062 ?auto_517064 ) ( not ( = ?auto_517064 ?auto_517063 ) ) ( HOIST-AT ?auto_517065 ?auto_517064 ) ( not ( = ?auto_517061 ?auto_517065 ) ) ( AVAILABLE ?auto_517065 ) ( SURFACE-AT ?auto_517060 ?auto_517064 ) ( ON ?auto_517060 ?auto_517066 ) ( CLEAR ?auto_517060 ) ( not ( = ?auto_517059 ?auto_517066 ) ) ( not ( = ?auto_517060 ?auto_517066 ) ) )
    :subtasks
    ( ( !LIFT ?auto_517065 ?auto_517060 ?auto_517066 ?auto_517064 )
      ( MAKE-1CRATE ?auto_517059 ?auto_517060 )
      ( MAKE-1CRATE-VERIFY ?auto_517059 ?auto_517060 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517067 - SURFACE
      ?auto_517068 - SURFACE
    )
    :vars
    (
      ?auto_517073 - HOIST
      ?auto_517072 - PLACE
      ?auto_517070 - PLACE
      ?auto_517074 - HOIST
      ?auto_517069 - SURFACE
      ?auto_517071 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517073 ?auto_517072 ) ( SURFACE-AT ?auto_517067 ?auto_517072 ) ( CLEAR ?auto_517067 ) ( IS-CRATE ?auto_517068 ) ( not ( = ?auto_517067 ?auto_517068 ) ) ( AVAILABLE ?auto_517073 ) ( not ( = ?auto_517070 ?auto_517072 ) ) ( HOIST-AT ?auto_517074 ?auto_517070 ) ( not ( = ?auto_517073 ?auto_517074 ) ) ( AVAILABLE ?auto_517074 ) ( SURFACE-AT ?auto_517068 ?auto_517070 ) ( ON ?auto_517068 ?auto_517069 ) ( CLEAR ?auto_517068 ) ( not ( = ?auto_517067 ?auto_517069 ) ) ( not ( = ?auto_517068 ?auto_517069 ) ) ( TRUCK-AT ?auto_517071 ?auto_517072 ) )
    :subtasks
    ( ( !DRIVE ?auto_517071 ?auto_517072 ?auto_517070 )
      ( MAKE-1CRATE ?auto_517067 ?auto_517068 )
      ( MAKE-1CRATE-VERIFY ?auto_517067 ?auto_517068 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_517084 - SURFACE
      ?auto_517085 - SURFACE
      ?auto_517086 - SURFACE
    )
    :vars
    (
      ?auto_517088 - HOIST
      ?auto_517087 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517088 ?auto_517087 ) ( SURFACE-AT ?auto_517085 ?auto_517087 ) ( CLEAR ?auto_517085 ) ( LIFTING ?auto_517088 ?auto_517086 ) ( IS-CRATE ?auto_517086 ) ( not ( = ?auto_517085 ?auto_517086 ) ) ( ON ?auto_517085 ?auto_517084 ) ( not ( = ?auto_517084 ?auto_517085 ) ) ( not ( = ?auto_517084 ?auto_517086 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517085 ?auto_517086 )
      ( MAKE-2CRATE-VERIFY ?auto_517084 ?auto_517085 ?auto_517086 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_517094 - SURFACE
      ?auto_517095 - SURFACE
      ?auto_517096 - SURFACE
    )
    :vars
    (
      ?auto_517097 - HOIST
      ?auto_517099 - PLACE
      ?auto_517098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517097 ?auto_517099 ) ( SURFACE-AT ?auto_517095 ?auto_517099 ) ( CLEAR ?auto_517095 ) ( IS-CRATE ?auto_517096 ) ( not ( = ?auto_517095 ?auto_517096 ) ) ( TRUCK-AT ?auto_517098 ?auto_517099 ) ( AVAILABLE ?auto_517097 ) ( IN ?auto_517096 ?auto_517098 ) ( ON ?auto_517095 ?auto_517094 ) ( not ( = ?auto_517094 ?auto_517095 ) ) ( not ( = ?auto_517094 ?auto_517096 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517095 ?auto_517096 )
      ( MAKE-2CRATE-VERIFY ?auto_517094 ?auto_517095 ?auto_517096 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517100 - SURFACE
      ?auto_517101 - SURFACE
    )
    :vars
    (
      ?auto_517104 - HOIST
      ?auto_517105 - PLACE
      ?auto_517102 - TRUCK
      ?auto_517103 - SURFACE
      ?auto_517106 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517104 ?auto_517105 ) ( SURFACE-AT ?auto_517100 ?auto_517105 ) ( CLEAR ?auto_517100 ) ( IS-CRATE ?auto_517101 ) ( not ( = ?auto_517100 ?auto_517101 ) ) ( AVAILABLE ?auto_517104 ) ( IN ?auto_517101 ?auto_517102 ) ( ON ?auto_517100 ?auto_517103 ) ( not ( = ?auto_517103 ?auto_517100 ) ) ( not ( = ?auto_517103 ?auto_517101 ) ) ( TRUCK-AT ?auto_517102 ?auto_517106 ) ( not ( = ?auto_517106 ?auto_517105 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_517102 ?auto_517106 ?auto_517105 )
      ( MAKE-2CRATE ?auto_517103 ?auto_517100 ?auto_517101 )
      ( MAKE-1CRATE-VERIFY ?auto_517100 ?auto_517101 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_517107 - SURFACE
      ?auto_517108 - SURFACE
      ?auto_517109 - SURFACE
    )
    :vars
    (
      ?auto_517112 - HOIST
      ?auto_517110 - PLACE
      ?auto_517113 - TRUCK
      ?auto_517111 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517112 ?auto_517110 ) ( SURFACE-AT ?auto_517108 ?auto_517110 ) ( CLEAR ?auto_517108 ) ( IS-CRATE ?auto_517109 ) ( not ( = ?auto_517108 ?auto_517109 ) ) ( AVAILABLE ?auto_517112 ) ( IN ?auto_517109 ?auto_517113 ) ( ON ?auto_517108 ?auto_517107 ) ( not ( = ?auto_517107 ?auto_517108 ) ) ( not ( = ?auto_517107 ?auto_517109 ) ) ( TRUCK-AT ?auto_517113 ?auto_517111 ) ( not ( = ?auto_517111 ?auto_517110 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517108 ?auto_517109 )
      ( MAKE-2CRATE-VERIFY ?auto_517107 ?auto_517108 ?auto_517109 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517114 - SURFACE
      ?auto_517115 - SURFACE
    )
    :vars
    (
      ?auto_517116 - HOIST
      ?auto_517119 - PLACE
      ?auto_517117 - SURFACE
      ?auto_517118 - TRUCK
      ?auto_517120 - PLACE
      ?auto_517121 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_517116 ?auto_517119 ) ( SURFACE-AT ?auto_517114 ?auto_517119 ) ( CLEAR ?auto_517114 ) ( IS-CRATE ?auto_517115 ) ( not ( = ?auto_517114 ?auto_517115 ) ) ( AVAILABLE ?auto_517116 ) ( ON ?auto_517114 ?auto_517117 ) ( not ( = ?auto_517117 ?auto_517114 ) ) ( not ( = ?auto_517117 ?auto_517115 ) ) ( TRUCK-AT ?auto_517118 ?auto_517120 ) ( not ( = ?auto_517120 ?auto_517119 ) ) ( HOIST-AT ?auto_517121 ?auto_517120 ) ( LIFTING ?auto_517121 ?auto_517115 ) ( not ( = ?auto_517116 ?auto_517121 ) ) )
    :subtasks
    ( ( !LOAD ?auto_517121 ?auto_517115 ?auto_517118 ?auto_517120 )
      ( MAKE-2CRATE ?auto_517117 ?auto_517114 ?auto_517115 )
      ( MAKE-1CRATE-VERIFY ?auto_517114 ?auto_517115 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_517122 - SURFACE
      ?auto_517123 - SURFACE
      ?auto_517124 - SURFACE
    )
    :vars
    (
      ?auto_517127 - HOIST
      ?auto_517126 - PLACE
      ?auto_517125 - TRUCK
      ?auto_517128 - PLACE
      ?auto_517129 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_517127 ?auto_517126 ) ( SURFACE-AT ?auto_517123 ?auto_517126 ) ( CLEAR ?auto_517123 ) ( IS-CRATE ?auto_517124 ) ( not ( = ?auto_517123 ?auto_517124 ) ) ( AVAILABLE ?auto_517127 ) ( ON ?auto_517123 ?auto_517122 ) ( not ( = ?auto_517122 ?auto_517123 ) ) ( not ( = ?auto_517122 ?auto_517124 ) ) ( TRUCK-AT ?auto_517125 ?auto_517128 ) ( not ( = ?auto_517128 ?auto_517126 ) ) ( HOIST-AT ?auto_517129 ?auto_517128 ) ( LIFTING ?auto_517129 ?auto_517124 ) ( not ( = ?auto_517127 ?auto_517129 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517123 ?auto_517124 )
      ( MAKE-2CRATE-VERIFY ?auto_517122 ?auto_517123 ?auto_517124 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517130 - SURFACE
      ?auto_517131 - SURFACE
    )
    :vars
    (
      ?auto_517134 - HOIST
      ?auto_517136 - PLACE
      ?auto_517132 - SURFACE
      ?auto_517135 - TRUCK
      ?auto_517137 - PLACE
      ?auto_517133 - HOIST
      ?auto_517138 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517134 ?auto_517136 ) ( SURFACE-AT ?auto_517130 ?auto_517136 ) ( CLEAR ?auto_517130 ) ( IS-CRATE ?auto_517131 ) ( not ( = ?auto_517130 ?auto_517131 ) ) ( AVAILABLE ?auto_517134 ) ( ON ?auto_517130 ?auto_517132 ) ( not ( = ?auto_517132 ?auto_517130 ) ) ( not ( = ?auto_517132 ?auto_517131 ) ) ( TRUCK-AT ?auto_517135 ?auto_517137 ) ( not ( = ?auto_517137 ?auto_517136 ) ) ( HOIST-AT ?auto_517133 ?auto_517137 ) ( not ( = ?auto_517134 ?auto_517133 ) ) ( AVAILABLE ?auto_517133 ) ( SURFACE-AT ?auto_517131 ?auto_517137 ) ( ON ?auto_517131 ?auto_517138 ) ( CLEAR ?auto_517131 ) ( not ( = ?auto_517130 ?auto_517138 ) ) ( not ( = ?auto_517131 ?auto_517138 ) ) ( not ( = ?auto_517132 ?auto_517138 ) ) )
    :subtasks
    ( ( !LIFT ?auto_517133 ?auto_517131 ?auto_517138 ?auto_517137 )
      ( MAKE-2CRATE ?auto_517132 ?auto_517130 ?auto_517131 )
      ( MAKE-1CRATE-VERIFY ?auto_517130 ?auto_517131 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_517139 - SURFACE
      ?auto_517140 - SURFACE
      ?auto_517141 - SURFACE
    )
    :vars
    (
      ?auto_517145 - HOIST
      ?auto_517144 - PLACE
      ?auto_517146 - TRUCK
      ?auto_517143 - PLACE
      ?auto_517147 - HOIST
      ?auto_517142 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517145 ?auto_517144 ) ( SURFACE-AT ?auto_517140 ?auto_517144 ) ( CLEAR ?auto_517140 ) ( IS-CRATE ?auto_517141 ) ( not ( = ?auto_517140 ?auto_517141 ) ) ( AVAILABLE ?auto_517145 ) ( ON ?auto_517140 ?auto_517139 ) ( not ( = ?auto_517139 ?auto_517140 ) ) ( not ( = ?auto_517139 ?auto_517141 ) ) ( TRUCK-AT ?auto_517146 ?auto_517143 ) ( not ( = ?auto_517143 ?auto_517144 ) ) ( HOIST-AT ?auto_517147 ?auto_517143 ) ( not ( = ?auto_517145 ?auto_517147 ) ) ( AVAILABLE ?auto_517147 ) ( SURFACE-AT ?auto_517141 ?auto_517143 ) ( ON ?auto_517141 ?auto_517142 ) ( CLEAR ?auto_517141 ) ( not ( = ?auto_517140 ?auto_517142 ) ) ( not ( = ?auto_517141 ?auto_517142 ) ) ( not ( = ?auto_517139 ?auto_517142 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517140 ?auto_517141 )
      ( MAKE-2CRATE-VERIFY ?auto_517139 ?auto_517140 ?auto_517141 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517148 - SURFACE
      ?auto_517149 - SURFACE
    )
    :vars
    (
      ?auto_517152 - HOIST
      ?auto_517153 - PLACE
      ?auto_517151 - SURFACE
      ?auto_517155 - PLACE
      ?auto_517154 - HOIST
      ?auto_517156 - SURFACE
      ?auto_517150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517152 ?auto_517153 ) ( SURFACE-AT ?auto_517148 ?auto_517153 ) ( CLEAR ?auto_517148 ) ( IS-CRATE ?auto_517149 ) ( not ( = ?auto_517148 ?auto_517149 ) ) ( AVAILABLE ?auto_517152 ) ( ON ?auto_517148 ?auto_517151 ) ( not ( = ?auto_517151 ?auto_517148 ) ) ( not ( = ?auto_517151 ?auto_517149 ) ) ( not ( = ?auto_517155 ?auto_517153 ) ) ( HOIST-AT ?auto_517154 ?auto_517155 ) ( not ( = ?auto_517152 ?auto_517154 ) ) ( AVAILABLE ?auto_517154 ) ( SURFACE-AT ?auto_517149 ?auto_517155 ) ( ON ?auto_517149 ?auto_517156 ) ( CLEAR ?auto_517149 ) ( not ( = ?auto_517148 ?auto_517156 ) ) ( not ( = ?auto_517149 ?auto_517156 ) ) ( not ( = ?auto_517151 ?auto_517156 ) ) ( TRUCK-AT ?auto_517150 ?auto_517153 ) )
    :subtasks
    ( ( !DRIVE ?auto_517150 ?auto_517153 ?auto_517155 )
      ( MAKE-2CRATE ?auto_517151 ?auto_517148 ?auto_517149 )
      ( MAKE-1CRATE-VERIFY ?auto_517148 ?auto_517149 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_517157 - SURFACE
      ?auto_517158 - SURFACE
      ?auto_517159 - SURFACE
    )
    :vars
    (
      ?auto_517164 - HOIST
      ?auto_517165 - PLACE
      ?auto_517162 - PLACE
      ?auto_517160 - HOIST
      ?auto_517161 - SURFACE
      ?auto_517163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517164 ?auto_517165 ) ( SURFACE-AT ?auto_517158 ?auto_517165 ) ( CLEAR ?auto_517158 ) ( IS-CRATE ?auto_517159 ) ( not ( = ?auto_517158 ?auto_517159 ) ) ( AVAILABLE ?auto_517164 ) ( ON ?auto_517158 ?auto_517157 ) ( not ( = ?auto_517157 ?auto_517158 ) ) ( not ( = ?auto_517157 ?auto_517159 ) ) ( not ( = ?auto_517162 ?auto_517165 ) ) ( HOIST-AT ?auto_517160 ?auto_517162 ) ( not ( = ?auto_517164 ?auto_517160 ) ) ( AVAILABLE ?auto_517160 ) ( SURFACE-AT ?auto_517159 ?auto_517162 ) ( ON ?auto_517159 ?auto_517161 ) ( CLEAR ?auto_517159 ) ( not ( = ?auto_517158 ?auto_517161 ) ) ( not ( = ?auto_517159 ?auto_517161 ) ) ( not ( = ?auto_517157 ?auto_517161 ) ) ( TRUCK-AT ?auto_517163 ?auto_517165 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517158 ?auto_517159 )
      ( MAKE-2CRATE-VERIFY ?auto_517157 ?auto_517158 ?auto_517159 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517166 - SURFACE
      ?auto_517167 - SURFACE
    )
    :vars
    (
      ?auto_517173 - HOIST
      ?auto_517169 - PLACE
      ?auto_517170 - SURFACE
      ?auto_517171 - PLACE
      ?auto_517172 - HOIST
      ?auto_517174 - SURFACE
      ?auto_517168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517173 ?auto_517169 ) ( IS-CRATE ?auto_517167 ) ( not ( = ?auto_517166 ?auto_517167 ) ) ( not ( = ?auto_517170 ?auto_517166 ) ) ( not ( = ?auto_517170 ?auto_517167 ) ) ( not ( = ?auto_517171 ?auto_517169 ) ) ( HOIST-AT ?auto_517172 ?auto_517171 ) ( not ( = ?auto_517173 ?auto_517172 ) ) ( AVAILABLE ?auto_517172 ) ( SURFACE-AT ?auto_517167 ?auto_517171 ) ( ON ?auto_517167 ?auto_517174 ) ( CLEAR ?auto_517167 ) ( not ( = ?auto_517166 ?auto_517174 ) ) ( not ( = ?auto_517167 ?auto_517174 ) ) ( not ( = ?auto_517170 ?auto_517174 ) ) ( TRUCK-AT ?auto_517168 ?auto_517169 ) ( SURFACE-AT ?auto_517170 ?auto_517169 ) ( CLEAR ?auto_517170 ) ( LIFTING ?auto_517173 ?auto_517166 ) ( IS-CRATE ?auto_517166 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517170 ?auto_517166 )
      ( MAKE-2CRATE ?auto_517170 ?auto_517166 ?auto_517167 )
      ( MAKE-1CRATE-VERIFY ?auto_517166 ?auto_517167 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_517175 - SURFACE
      ?auto_517176 - SURFACE
      ?auto_517177 - SURFACE
    )
    :vars
    (
      ?auto_517179 - HOIST
      ?auto_517182 - PLACE
      ?auto_517180 - PLACE
      ?auto_517183 - HOIST
      ?auto_517181 - SURFACE
      ?auto_517178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517179 ?auto_517182 ) ( IS-CRATE ?auto_517177 ) ( not ( = ?auto_517176 ?auto_517177 ) ) ( not ( = ?auto_517175 ?auto_517176 ) ) ( not ( = ?auto_517175 ?auto_517177 ) ) ( not ( = ?auto_517180 ?auto_517182 ) ) ( HOIST-AT ?auto_517183 ?auto_517180 ) ( not ( = ?auto_517179 ?auto_517183 ) ) ( AVAILABLE ?auto_517183 ) ( SURFACE-AT ?auto_517177 ?auto_517180 ) ( ON ?auto_517177 ?auto_517181 ) ( CLEAR ?auto_517177 ) ( not ( = ?auto_517176 ?auto_517181 ) ) ( not ( = ?auto_517177 ?auto_517181 ) ) ( not ( = ?auto_517175 ?auto_517181 ) ) ( TRUCK-AT ?auto_517178 ?auto_517182 ) ( SURFACE-AT ?auto_517175 ?auto_517182 ) ( CLEAR ?auto_517175 ) ( LIFTING ?auto_517179 ?auto_517176 ) ( IS-CRATE ?auto_517176 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517176 ?auto_517177 )
      ( MAKE-2CRATE-VERIFY ?auto_517175 ?auto_517176 ?auto_517177 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517184 - SURFACE
      ?auto_517185 - SURFACE
    )
    :vars
    (
      ?auto_517192 - HOIST
      ?auto_517189 - PLACE
      ?auto_517191 - SURFACE
      ?auto_517186 - PLACE
      ?auto_517187 - HOIST
      ?auto_517190 - SURFACE
      ?auto_517188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517192 ?auto_517189 ) ( IS-CRATE ?auto_517185 ) ( not ( = ?auto_517184 ?auto_517185 ) ) ( not ( = ?auto_517191 ?auto_517184 ) ) ( not ( = ?auto_517191 ?auto_517185 ) ) ( not ( = ?auto_517186 ?auto_517189 ) ) ( HOIST-AT ?auto_517187 ?auto_517186 ) ( not ( = ?auto_517192 ?auto_517187 ) ) ( AVAILABLE ?auto_517187 ) ( SURFACE-AT ?auto_517185 ?auto_517186 ) ( ON ?auto_517185 ?auto_517190 ) ( CLEAR ?auto_517185 ) ( not ( = ?auto_517184 ?auto_517190 ) ) ( not ( = ?auto_517185 ?auto_517190 ) ) ( not ( = ?auto_517191 ?auto_517190 ) ) ( TRUCK-AT ?auto_517188 ?auto_517189 ) ( SURFACE-AT ?auto_517191 ?auto_517189 ) ( CLEAR ?auto_517191 ) ( IS-CRATE ?auto_517184 ) ( AVAILABLE ?auto_517192 ) ( IN ?auto_517184 ?auto_517188 ) )
    :subtasks
    ( ( !UNLOAD ?auto_517192 ?auto_517184 ?auto_517188 ?auto_517189 )
      ( MAKE-2CRATE ?auto_517191 ?auto_517184 ?auto_517185 )
      ( MAKE-1CRATE-VERIFY ?auto_517184 ?auto_517185 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_517193 - SURFACE
      ?auto_517194 - SURFACE
      ?auto_517195 - SURFACE
    )
    :vars
    (
      ?auto_517196 - HOIST
      ?auto_517199 - PLACE
      ?auto_517201 - PLACE
      ?auto_517197 - HOIST
      ?auto_517200 - SURFACE
      ?auto_517198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517196 ?auto_517199 ) ( IS-CRATE ?auto_517195 ) ( not ( = ?auto_517194 ?auto_517195 ) ) ( not ( = ?auto_517193 ?auto_517194 ) ) ( not ( = ?auto_517193 ?auto_517195 ) ) ( not ( = ?auto_517201 ?auto_517199 ) ) ( HOIST-AT ?auto_517197 ?auto_517201 ) ( not ( = ?auto_517196 ?auto_517197 ) ) ( AVAILABLE ?auto_517197 ) ( SURFACE-AT ?auto_517195 ?auto_517201 ) ( ON ?auto_517195 ?auto_517200 ) ( CLEAR ?auto_517195 ) ( not ( = ?auto_517194 ?auto_517200 ) ) ( not ( = ?auto_517195 ?auto_517200 ) ) ( not ( = ?auto_517193 ?auto_517200 ) ) ( TRUCK-AT ?auto_517198 ?auto_517199 ) ( SURFACE-AT ?auto_517193 ?auto_517199 ) ( CLEAR ?auto_517193 ) ( IS-CRATE ?auto_517194 ) ( AVAILABLE ?auto_517196 ) ( IN ?auto_517194 ?auto_517198 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517194 ?auto_517195 )
      ( MAKE-2CRATE-VERIFY ?auto_517193 ?auto_517194 ?auto_517195 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517238 - SURFACE
      ?auto_517239 - SURFACE
    )
    :vars
    (
      ?auto_517244 - HOIST
      ?auto_517246 - PLACE
      ?auto_517241 - SURFACE
      ?auto_517240 - PLACE
      ?auto_517245 - HOIST
      ?auto_517242 - SURFACE
      ?auto_517243 - TRUCK
      ?auto_517247 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517244 ?auto_517246 ) ( SURFACE-AT ?auto_517238 ?auto_517246 ) ( CLEAR ?auto_517238 ) ( IS-CRATE ?auto_517239 ) ( not ( = ?auto_517238 ?auto_517239 ) ) ( AVAILABLE ?auto_517244 ) ( ON ?auto_517238 ?auto_517241 ) ( not ( = ?auto_517241 ?auto_517238 ) ) ( not ( = ?auto_517241 ?auto_517239 ) ) ( not ( = ?auto_517240 ?auto_517246 ) ) ( HOIST-AT ?auto_517245 ?auto_517240 ) ( not ( = ?auto_517244 ?auto_517245 ) ) ( AVAILABLE ?auto_517245 ) ( SURFACE-AT ?auto_517239 ?auto_517240 ) ( ON ?auto_517239 ?auto_517242 ) ( CLEAR ?auto_517239 ) ( not ( = ?auto_517238 ?auto_517242 ) ) ( not ( = ?auto_517239 ?auto_517242 ) ) ( not ( = ?auto_517241 ?auto_517242 ) ) ( TRUCK-AT ?auto_517243 ?auto_517247 ) ( not ( = ?auto_517247 ?auto_517246 ) ) ( not ( = ?auto_517240 ?auto_517247 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_517243 ?auto_517247 ?auto_517246 )
      ( MAKE-1CRATE ?auto_517238 ?auto_517239 )
      ( MAKE-1CRATE-VERIFY ?auto_517238 ?auto_517239 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_517277 - SURFACE
      ?auto_517278 - SURFACE
      ?auto_517279 - SURFACE
      ?auto_517280 - SURFACE
    )
    :vars
    (
      ?auto_517281 - HOIST
      ?auto_517282 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517281 ?auto_517282 ) ( SURFACE-AT ?auto_517279 ?auto_517282 ) ( CLEAR ?auto_517279 ) ( LIFTING ?auto_517281 ?auto_517280 ) ( IS-CRATE ?auto_517280 ) ( not ( = ?auto_517279 ?auto_517280 ) ) ( ON ?auto_517278 ?auto_517277 ) ( ON ?auto_517279 ?auto_517278 ) ( not ( = ?auto_517277 ?auto_517278 ) ) ( not ( = ?auto_517277 ?auto_517279 ) ) ( not ( = ?auto_517277 ?auto_517280 ) ) ( not ( = ?auto_517278 ?auto_517279 ) ) ( not ( = ?auto_517278 ?auto_517280 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517279 ?auto_517280 )
      ( MAKE-3CRATE-VERIFY ?auto_517277 ?auto_517278 ?auto_517279 ?auto_517280 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_517294 - SURFACE
      ?auto_517295 - SURFACE
      ?auto_517296 - SURFACE
      ?auto_517297 - SURFACE
    )
    :vars
    (
      ?auto_517298 - HOIST
      ?auto_517300 - PLACE
      ?auto_517299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517298 ?auto_517300 ) ( SURFACE-AT ?auto_517296 ?auto_517300 ) ( CLEAR ?auto_517296 ) ( IS-CRATE ?auto_517297 ) ( not ( = ?auto_517296 ?auto_517297 ) ) ( TRUCK-AT ?auto_517299 ?auto_517300 ) ( AVAILABLE ?auto_517298 ) ( IN ?auto_517297 ?auto_517299 ) ( ON ?auto_517296 ?auto_517295 ) ( not ( = ?auto_517295 ?auto_517296 ) ) ( not ( = ?auto_517295 ?auto_517297 ) ) ( ON ?auto_517295 ?auto_517294 ) ( not ( = ?auto_517294 ?auto_517295 ) ) ( not ( = ?auto_517294 ?auto_517296 ) ) ( not ( = ?auto_517294 ?auto_517297 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517295 ?auto_517296 ?auto_517297 )
      ( MAKE-3CRATE-VERIFY ?auto_517294 ?auto_517295 ?auto_517296 ?auto_517297 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_517315 - SURFACE
      ?auto_517316 - SURFACE
      ?auto_517317 - SURFACE
      ?auto_517318 - SURFACE
    )
    :vars
    (
      ?auto_517320 - HOIST
      ?auto_517322 - PLACE
      ?auto_517321 - TRUCK
      ?auto_517319 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517320 ?auto_517322 ) ( SURFACE-AT ?auto_517317 ?auto_517322 ) ( CLEAR ?auto_517317 ) ( IS-CRATE ?auto_517318 ) ( not ( = ?auto_517317 ?auto_517318 ) ) ( AVAILABLE ?auto_517320 ) ( IN ?auto_517318 ?auto_517321 ) ( ON ?auto_517317 ?auto_517316 ) ( not ( = ?auto_517316 ?auto_517317 ) ) ( not ( = ?auto_517316 ?auto_517318 ) ) ( TRUCK-AT ?auto_517321 ?auto_517319 ) ( not ( = ?auto_517319 ?auto_517322 ) ) ( ON ?auto_517316 ?auto_517315 ) ( not ( = ?auto_517315 ?auto_517316 ) ) ( not ( = ?auto_517315 ?auto_517317 ) ) ( not ( = ?auto_517315 ?auto_517318 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517316 ?auto_517317 ?auto_517318 )
      ( MAKE-3CRATE-VERIFY ?auto_517315 ?auto_517316 ?auto_517317 ?auto_517318 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_517339 - SURFACE
      ?auto_517340 - SURFACE
      ?auto_517341 - SURFACE
      ?auto_517342 - SURFACE
    )
    :vars
    (
      ?auto_517347 - HOIST
      ?auto_517345 - PLACE
      ?auto_517343 - TRUCK
      ?auto_517344 - PLACE
      ?auto_517346 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_517347 ?auto_517345 ) ( SURFACE-AT ?auto_517341 ?auto_517345 ) ( CLEAR ?auto_517341 ) ( IS-CRATE ?auto_517342 ) ( not ( = ?auto_517341 ?auto_517342 ) ) ( AVAILABLE ?auto_517347 ) ( ON ?auto_517341 ?auto_517340 ) ( not ( = ?auto_517340 ?auto_517341 ) ) ( not ( = ?auto_517340 ?auto_517342 ) ) ( TRUCK-AT ?auto_517343 ?auto_517344 ) ( not ( = ?auto_517344 ?auto_517345 ) ) ( HOIST-AT ?auto_517346 ?auto_517344 ) ( LIFTING ?auto_517346 ?auto_517342 ) ( not ( = ?auto_517347 ?auto_517346 ) ) ( ON ?auto_517340 ?auto_517339 ) ( not ( = ?auto_517339 ?auto_517340 ) ) ( not ( = ?auto_517339 ?auto_517341 ) ) ( not ( = ?auto_517339 ?auto_517342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517340 ?auto_517341 ?auto_517342 )
      ( MAKE-3CRATE-VERIFY ?auto_517339 ?auto_517340 ?auto_517341 ?auto_517342 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_517366 - SURFACE
      ?auto_517367 - SURFACE
      ?auto_517368 - SURFACE
      ?auto_517369 - SURFACE
    )
    :vars
    (
      ?auto_517375 - HOIST
      ?auto_517374 - PLACE
      ?auto_517373 - TRUCK
      ?auto_517371 - PLACE
      ?auto_517372 - HOIST
      ?auto_517370 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517375 ?auto_517374 ) ( SURFACE-AT ?auto_517368 ?auto_517374 ) ( CLEAR ?auto_517368 ) ( IS-CRATE ?auto_517369 ) ( not ( = ?auto_517368 ?auto_517369 ) ) ( AVAILABLE ?auto_517375 ) ( ON ?auto_517368 ?auto_517367 ) ( not ( = ?auto_517367 ?auto_517368 ) ) ( not ( = ?auto_517367 ?auto_517369 ) ) ( TRUCK-AT ?auto_517373 ?auto_517371 ) ( not ( = ?auto_517371 ?auto_517374 ) ) ( HOIST-AT ?auto_517372 ?auto_517371 ) ( not ( = ?auto_517375 ?auto_517372 ) ) ( AVAILABLE ?auto_517372 ) ( SURFACE-AT ?auto_517369 ?auto_517371 ) ( ON ?auto_517369 ?auto_517370 ) ( CLEAR ?auto_517369 ) ( not ( = ?auto_517368 ?auto_517370 ) ) ( not ( = ?auto_517369 ?auto_517370 ) ) ( not ( = ?auto_517367 ?auto_517370 ) ) ( ON ?auto_517367 ?auto_517366 ) ( not ( = ?auto_517366 ?auto_517367 ) ) ( not ( = ?auto_517366 ?auto_517368 ) ) ( not ( = ?auto_517366 ?auto_517369 ) ) ( not ( = ?auto_517366 ?auto_517370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517367 ?auto_517368 ?auto_517369 )
      ( MAKE-3CRATE-VERIFY ?auto_517366 ?auto_517367 ?auto_517368 ?auto_517369 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_517394 - SURFACE
      ?auto_517395 - SURFACE
      ?auto_517396 - SURFACE
      ?auto_517397 - SURFACE
    )
    :vars
    (
      ?auto_517399 - HOIST
      ?auto_517400 - PLACE
      ?auto_517398 - PLACE
      ?auto_517403 - HOIST
      ?auto_517402 - SURFACE
      ?auto_517401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517399 ?auto_517400 ) ( SURFACE-AT ?auto_517396 ?auto_517400 ) ( CLEAR ?auto_517396 ) ( IS-CRATE ?auto_517397 ) ( not ( = ?auto_517396 ?auto_517397 ) ) ( AVAILABLE ?auto_517399 ) ( ON ?auto_517396 ?auto_517395 ) ( not ( = ?auto_517395 ?auto_517396 ) ) ( not ( = ?auto_517395 ?auto_517397 ) ) ( not ( = ?auto_517398 ?auto_517400 ) ) ( HOIST-AT ?auto_517403 ?auto_517398 ) ( not ( = ?auto_517399 ?auto_517403 ) ) ( AVAILABLE ?auto_517403 ) ( SURFACE-AT ?auto_517397 ?auto_517398 ) ( ON ?auto_517397 ?auto_517402 ) ( CLEAR ?auto_517397 ) ( not ( = ?auto_517396 ?auto_517402 ) ) ( not ( = ?auto_517397 ?auto_517402 ) ) ( not ( = ?auto_517395 ?auto_517402 ) ) ( TRUCK-AT ?auto_517401 ?auto_517400 ) ( ON ?auto_517395 ?auto_517394 ) ( not ( = ?auto_517394 ?auto_517395 ) ) ( not ( = ?auto_517394 ?auto_517396 ) ) ( not ( = ?auto_517394 ?auto_517397 ) ) ( not ( = ?auto_517394 ?auto_517402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517395 ?auto_517396 ?auto_517397 )
      ( MAKE-3CRATE-VERIFY ?auto_517394 ?auto_517395 ?auto_517396 ?auto_517397 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_517422 - SURFACE
      ?auto_517423 - SURFACE
      ?auto_517424 - SURFACE
      ?auto_517425 - SURFACE
    )
    :vars
    (
      ?auto_517431 - HOIST
      ?auto_517430 - PLACE
      ?auto_517426 - PLACE
      ?auto_517429 - HOIST
      ?auto_517428 - SURFACE
      ?auto_517427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517431 ?auto_517430 ) ( IS-CRATE ?auto_517425 ) ( not ( = ?auto_517424 ?auto_517425 ) ) ( not ( = ?auto_517423 ?auto_517424 ) ) ( not ( = ?auto_517423 ?auto_517425 ) ) ( not ( = ?auto_517426 ?auto_517430 ) ) ( HOIST-AT ?auto_517429 ?auto_517426 ) ( not ( = ?auto_517431 ?auto_517429 ) ) ( AVAILABLE ?auto_517429 ) ( SURFACE-AT ?auto_517425 ?auto_517426 ) ( ON ?auto_517425 ?auto_517428 ) ( CLEAR ?auto_517425 ) ( not ( = ?auto_517424 ?auto_517428 ) ) ( not ( = ?auto_517425 ?auto_517428 ) ) ( not ( = ?auto_517423 ?auto_517428 ) ) ( TRUCK-AT ?auto_517427 ?auto_517430 ) ( SURFACE-AT ?auto_517423 ?auto_517430 ) ( CLEAR ?auto_517423 ) ( LIFTING ?auto_517431 ?auto_517424 ) ( IS-CRATE ?auto_517424 ) ( ON ?auto_517423 ?auto_517422 ) ( not ( = ?auto_517422 ?auto_517423 ) ) ( not ( = ?auto_517422 ?auto_517424 ) ) ( not ( = ?auto_517422 ?auto_517425 ) ) ( not ( = ?auto_517422 ?auto_517428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517423 ?auto_517424 ?auto_517425 )
      ( MAKE-3CRATE-VERIFY ?auto_517422 ?auto_517423 ?auto_517424 ?auto_517425 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_517450 - SURFACE
      ?auto_517451 - SURFACE
      ?auto_517452 - SURFACE
      ?auto_517453 - SURFACE
    )
    :vars
    (
      ?auto_517458 - HOIST
      ?auto_517455 - PLACE
      ?auto_517457 - PLACE
      ?auto_517454 - HOIST
      ?auto_517459 - SURFACE
      ?auto_517456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517458 ?auto_517455 ) ( IS-CRATE ?auto_517453 ) ( not ( = ?auto_517452 ?auto_517453 ) ) ( not ( = ?auto_517451 ?auto_517452 ) ) ( not ( = ?auto_517451 ?auto_517453 ) ) ( not ( = ?auto_517457 ?auto_517455 ) ) ( HOIST-AT ?auto_517454 ?auto_517457 ) ( not ( = ?auto_517458 ?auto_517454 ) ) ( AVAILABLE ?auto_517454 ) ( SURFACE-AT ?auto_517453 ?auto_517457 ) ( ON ?auto_517453 ?auto_517459 ) ( CLEAR ?auto_517453 ) ( not ( = ?auto_517452 ?auto_517459 ) ) ( not ( = ?auto_517453 ?auto_517459 ) ) ( not ( = ?auto_517451 ?auto_517459 ) ) ( TRUCK-AT ?auto_517456 ?auto_517455 ) ( SURFACE-AT ?auto_517451 ?auto_517455 ) ( CLEAR ?auto_517451 ) ( IS-CRATE ?auto_517452 ) ( AVAILABLE ?auto_517458 ) ( IN ?auto_517452 ?auto_517456 ) ( ON ?auto_517451 ?auto_517450 ) ( not ( = ?auto_517450 ?auto_517451 ) ) ( not ( = ?auto_517450 ?auto_517452 ) ) ( not ( = ?auto_517450 ?auto_517453 ) ) ( not ( = ?auto_517450 ?auto_517459 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517451 ?auto_517452 ?auto_517453 )
      ( MAKE-3CRATE-VERIFY ?auto_517450 ?auto_517451 ?auto_517452 ?auto_517453 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517741 - SURFACE
      ?auto_517742 - SURFACE
      ?auto_517743 - SURFACE
      ?auto_517744 - SURFACE
      ?auto_517745 - SURFACE
    )
    :vars
    (
      ?auto_517746 - HOIST
      ?auto_517747 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517746 ?auto_517747 ) ( SURFACE-AT ?auto_517744 ?auto_517747 ) ( CLEAR ?auto_517744 ) ( LIFTING ?auto_517746 ?auto_517745 ) ( IS-CRATE ?auto_517745 ) ( not ( = ?auto_517744 ?auto_517745 ) ) ( ON ?auto_517742 ?auto_517741 ) ( ON ?auto_517743 ?auto_517742 ) ( ON ?auto_517744 ?auto_517743 ) ( not ( = ?auto_517741 ?auto_517742 ) ) ( not ( = ?auto_517741 ?auto_517743 ) ) ( not ( = ?auto_517741 ?auto_517744 ) ) ( not ( = ?auto_517741 ?auto_517745 ) ) ( not ( = ?auto_517742 ?auto_517743 ) ) ( not ( = ?auto_517742 ?auto_517744 ) ) ( not ( = ?auto_517742 ?auto_517745 ) ) ( not ( = ?auto_517743 ?auto_517744 ) ) ( not ( = ?auto_517743 ?auto_517745 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517744 ?auto_517745 )
      ( MAKE-4CRATE-VERIFY ?auto_517741 ?auto_517742 ?auto_517743 ?auto_517744 ?auto_517745 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517766 - SURFACE
      ?auto_517767 - SURFACE
      ?auto_517768 - SURFACE
      ?auto_517769 - SURFACE
      ?auto_517770 - SURFACE
    )
    :vars
    (
      ?auto_517772 - HOIST
      ?auto_517773 - PLACE
      ?auto_517771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517772 ?auto_517773 ) ( SURFACE-AT ?auto_517769 ?auto_517773 ) ( CLEAR ?auto_517769 ) ( IS-CRATE ?auto_517770 ) ( not ( = ?auto_517769 ?auto_517770 ) ) ( TRUCK-AT ?auto_517771 ?auto_517773 ) ( AVAILABLE ?auto_517772 ) ( IN ?auto_517770 ?auto_517771 ) ( ON ?auto_517769 ?auto_517768 ) ( not ( = ?auto_517768 ?auto_517769 ) ) ( not ( = ?auto_517768 ?auto_517770 ) ) ( ON ?auto_517767 ?auto_517766 ) ( ON ?auto_517768 ?auto_517767 ) ( not ( = ?auto_517766 ?auto_517767 ) ) ( not ( = ?auto_517766 ?auto_517768 ) ) ( not ( = ?auto_517766 ?auto_517769 ) ) ( not ( = ?auto_517766 ?auto_517770 ) ) ( not ( = ?auto_517767 ?auto_517768 ) ) ( not ( = ?auto_517767 ?auto_517769 ) ) ( not ( = ?auto_517767 ?auto_517770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517768 ?auto_517769 ?auto_517770 )
      ( MAKE-4CRATE-VERIFY ?auto_517766 ?auto_517767 ?auto_517768 ?auto_517769 ?auto_517770 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517796 - SURFACE
      ?auto_517797 - SURFACE
      ?auto_517798 - SURFACE
      ?auto_517799 - SURFACE
      ?auto_517800 - SURFACE
    )
    :vars
    (
      ?auto_517802 - HOIST
      ?auto_517804 - PLACE
      ?auto_517801 - TRUCK
      ?auto_517803 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517802 ?auto_517804 ) ( SURFACE-AT ?auto_517799 ?auto_517804 ) ( CLEAR ?auto_517799 ) ( IS-CRATE ?auto_517800 ) ( not ( = ?auto_517799 ?auto_517800 ) ) ( AVAILABLE ?auto_517802 ) ( IN ?auto_517800 ?auto_517801 ) ( ON ?auto_517799 ?auto_517798 ) ( not ( = ?auto_517798 ?auto_517799 ) ) ( not ( = ?auto_517798 ?auto_517800 ) ) ( TRUCK-AT ?auto_517801 ?auto_517803 ) ( not ( = ?auto_517803 ?auto_517804 ) ) ( ON ?auto_517797 ?auto_517796 ) ( ON ?auto_517798 ?auto_517797 ) ( not ( = ?auto_517796 ?auto_517797 ) ) ( not ( = ?auto_517796 ?auto_517798 ) ) ( not ( = ?auto_517796 ?auto_517799 ) ) ( not ( = ?auto_517796 ?auto_517800 ) ) ( not ( = ?auto_517797 ?auto_517798 ) ) ( not ( = ?auto_517797 ?auto_517799 ) ) ( not ( = ?auto_517797 ?auto_517800 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517798 ?auto_517799 ?auto_517800 )
      ( MAKE-4CRATE-VERIFY ?auto_517796 ?auto_517797 ?auto_517798 ?auto_517799 ?auto_517800 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517830 - SURFACE
      ?auto_517831 - SURFACE
      ?auto_517832 - SURFACE
      ?auto_517833 - SURFACE
      ?auto_517834 - SURFACE
    )
    :vars
    (
      ?auto_517836 - HOIST
      ?auto_517835 - PLACE
      ?auto_517838 - TRUCK
      ?auto_517839 - PLACE
      ?auto_517837 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_517836 ?auto_517835 ) ( SURFACE-AT ?auto_517833 ?auto_517835 ) ( CLEAR ?auto_517833 ) ( IS-CRATE ?auto_517834 ) ( not ( = ?auto_517833 ?auto_517834 ) ) ( AVAILABLE ?auto_517836 ) ( ON ?auto_517833 ?auto_517832 ) ( not ( = ?auto_517832 ?auto_517833 ) ) ( not ( = ?auto_517832 ?auto_517834 ) ) ( TRUCK-AT ?auto_517838 ?auto_517839 ) ( not ( = ?auto_517839 ?auto_517835 ) ) ( HOIST-AT ?auto_517837 ?auto_517839 ) ( LIFTING ?auto_517837 ?auto_517834 ) ( not ( = ?auto_517836 ?auto_517837 ) ) ( ON ?auto_517831 ?auto_517830 ) ( ON ?auto_517832 ?auto_517831 ) ( not ( = ?auto_517830 ?auto_517831 ) ) ( not ( = ?auto_517830 ?auto_517832 ) ) ( not ( = ?auto_517830 ?auto_517833 ) ) ( not ( = ?auto_517830 ?auto_517834 ) ) ( not ( = ?auto_517831 ?auto_517832 ) ) ( not ( = ?auto_517831 ?auto_517833 ) ) ( not ( = ?auto_517831 ?auto_517834 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517832 ?auto_517833 ?auto_517834 )
      ( MAKE-4CRATE-VERIFY ?auto_517830 ?auto_517831 ?auto_517832 ?auto_517833 ?auto_517834 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517868 - SURFACE
      ?auto_517869 - SURFACE
      ?auto_517870 - SURFACE
      ?auto_517871 - SURFACE
      ?auto_517872 - SURFACE
    )
    :vars
    (
      ?auto_517876 - HOIST
      ?auto_517878 - PLACE
      ?auto_517873 - TRUCK
      ?auto_517875 - PLACE
      ?auto_517874 - HOIST
      ?auto_517877 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_517876 ?auto_517878 ) ( SURFACE-AT ?auto_517871 ?auto_517878 ) ( CLEAR ?auto_517871 ) ( IS-CRATE ?auto_517872 ) ( not ( = ?auto_517871 ?auto_517872 ) ) ( AVAILABLE ?auto_517876 ) ( ON ?auto_517871 ?auto_517870 ) ( not ( = ?auto_517870 ?auto_517871 ) ) ( not ( = ?auto_517870 ?auto_517872 ) ) ( TRUCK-AT ?auto_517873 ?auto_517875 ) ( not ( = ?auto_517875 ?auto_517878 ) ) ( HOIST-AT ?auto_517874 ?auto_517875 ) ( not ( = ?auto_517876 ?auto_517874 ) ) ( AVAILABLE ?auto_517874 ) ( SURFACE-AT ?auto_517872 ?auto_517875 ) ( ON ?auto_517872 ?auto_517877 ) ( CLEAR ?auto_517872 ) ( not ( = ?auto_517871 ?auto_517877 ) ) ( not ( = ?auto_517872 ?auto_517877 ) ) ( not ( = ?auto_517870 ?auto_517877 ) ) ( ON ?auto_517869 ?auto_517868 ) ( ON ?auto_517870 ?auto_517869 ) ( not ( = ?auto_517868 ?auto_517869 ) ) ( not ( = ?auto_517868 ?auto_517870 ) ) ( not ( = ?auto_517868 ?auto_517871 ) ) ( not ( = ?auto_517868 ?auto_517872 ) ) ( not ( = ?auto_517868 ?auto_517877 ) ) ( not ( = ?auto_517869 ?auto_517870 ) ) ( not ( = ?auto_517869 ?auto_517871 ) ) ( not ( = ?auto_517869 ?auto_517872 ) ) ( not ( = ?auto_517869 ?auto_517877 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517870 ?auto_517871 ?auto_517872 )
      ( MAKE-4CRATE-VERIFY ?auto_517868 ?auto_517869 ?auto_517870 ?auto_517871 ?auto_517872 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517907 - SURFACE
      ?auto_517908 - SURFACE
      ?auto_517909 - SURFACE
      ?auto_517910 - SURFACE
      ?auto_517911 - SURFACE
    )
    :vars
    (
      ?auto_517914 - HOIST
      ?auto_517915 - PLACE
      ?auto_517913 - PLACE
      ?auto_517912 - HOIST
      ?auto_517917 - SURFACE
      ?auto_517916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517914 ?auto_517915 ) ( SURFACE-AT ?auto_517910 ?auto_517915 ) ( CLEAR ?auto_517910 ) ( IS-CRATE ?auto_517911 ) ( not ( = ?auto_517910 ?auto_517911 ) ) ( AVAILABLE ?auto_517914 ) ( ON ?auto_517910 ?auto_517909 ) ( not ( = ?auto_517909 ?auto_517910 ) ) ( not ( = ?auto_517909 ?auto_517911 ) ) ( not ( = ?auto_517913 ?auto_517915 ) ) ( HOIST-AT ?auto_517912 ?auto_517913 ) ( not ( = ?auto_517914 ?auto_517912 ) ) ( AVAILABLE ?auto_517912 ) ( SURFACE-AT ?auto_517911 ?auto_517913 ) ( ON ?auto_517911 ?auto_517917 ) ( CLEAR ?auto_517911 ) ( not ( = ?auto_517910 ?auto_517917 ) ) ( not ( = ?auto_517911 ?auto_517917 ) ) ( not ( = ?auto_517909 ?auto_517917 ) ) ( TRUCK-AT ?auto_517916 ?auto_517915 ) ( ON ?auto_517908 ?auto_517907 ) ( ON ?auto_517909 ?auto_517908 ) ( not ( = ?auto_517907 ?auto_517908 ) ) ( not ( = ?auto_517907 ?auto_517909 ) ) ( not ( = ?auto_517907 ?auto_517910 ) ) ( not ( = ?auto_517907 ?auto_517911 ) ) ( not ( = ?auto_517907 ?auto_517917 ) ) ( not ( = ?auto_517908 ?auto_517909 ) ) ( not ( = ?auto_517908 ?auto_517910 ) ) ( not ( = ?auto_517908 ?auto_517911 ) ) ( not ( = ?auto_517908 ?auto_517917 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517909 ?auto_517910 ?auto_517911 )
      ( MAKE-4CRATE-VERIFY ?auto_517907 ?auto_517908 ?auto_517909 ?auto_517910 ?auto_517911 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517946 - SURFACE
      ?auto_517947 - SURFACE
      ?auto_517948 - SURFACE
      ?auto_517949 - SURFACE
      ?auto_517950 - SURFACE
    )
    :vars
    (
      ?auto_517955 - HOIST
      ?auto_517954 - PLACE
      ?auto_517953 - PLACE
      ?auto_517952 - HOIST
      ?auto_517956 - SURFACE
      ?auto_517951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517955 ?auto_517954 ) ( IS-CRATE ?auto_517950 ) ( not ( = ?auto_517949 ?auto_517950 ) ) ( not ( = ?auto_517948 ?auto_517949 ) ) ( not ( = ?auto_517948 ?auto_517950 ) ) ( not ( = ?auto_517953 ?auto_517954 ) ) ( HOIST-AT ?auto_517952 ?auto_517953 ) ( not ( = ?auto_517955 ?auto_517952 ) ) ( AVAILABLE ?auto_517952 ) ( SURFACE-AT ?auto_517950 ?auto_517953 ) ( ON ?auto_517950 ?auto_517956 ) ( CLEAR ?auto_517950 ) ( not ( = ?auto_517949 ?auto_517956 ) ) ( not ( = ?auto_517950 ?auto_517956 ) ) ( not ( = ?auto_517948 ?auto_517956 ) ) ( TRUCK-AT ?auto_517951 ?auto_517954 ) ( SURFACE-AT ?auto_517948 ?auto_517954 ) ( CLEAR ?auto_517948 ) ( LIFTING ?auto_517955 ?auto_517949 ) ( IS-CRATE ?auto_517949 ) ( ON ?auto_517947 ?auto_517946 ) ( ON ?auto_517948 ?auto_517947 ) ( not ( = ?auto_517946 ?auto_517947 ) ) ( not ( = ?auto_517946 ?auto_517948 ) ) ( not ( = ?auto_517946 ?auto_517949 ) ) ( not ( = ?auto_517946 ?auto_517950 ) ) ( not ( = ?auto_517946 ?auto_517956 ) ) ( not ( = ?auto_517947 ?auto_517948 ) ) ( not ( = ?auto_517947 ?auto_517949 ) ) ( not ( = ?auto_517947 ?auto_517950 ) ) ( not ( = ?auto_517947 ?auto_517956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517948 ?auto_517949 ?auto_517950 )
      ( MAKE-4CRATE-VERIFY ?auto_517946 ?auto_517947 ?auto_517948 ?auto_517949 ?auto_517950 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_517985 - SURFACE
      ?auto_517986 - SURFACE
      ?auto_517987 - SURFACE
      ?auto_517988 - SURFACE
      ?auto_517989 - SURFACE
    )
    :vars
    (
      ?auto_517993 - HOIST
      ?auto_517992 - PLACE
      ?auto_517994 - PLACE
      ?auto_517995 - HOIST
      ?auto_517990 - SURFACE
      ?auto_517991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_517993 ?auto_517992 ) ( IS-CRATE ?auto_517989 ) ( not ( = ?auto_517988 ?auto_517989 ) ) ( not ( = ?auto_517987 ?auto_517988 ) ) ( not ( = ?auto_517987 ?auto_517989 ) ) ( not ( = ?auto_517994 ?auto_517992 ) ) ( HOIST-AT ?auto_517995 ?auto_517994 ) ( not ( = ?auto_517993 ?auto_517995 ) ) ( AVAILABLE ?auto_517995 ) ( SURFACE-AT ?auto_517989 ?auto_517994 ) ( ON ?auto_517989 ?auto_517990 ) ( CLEAR ?auto_517989 ) ( not ( = ?auto_517988 ?auto_517990 ) ) ( not ( = ?auto_517989 ?auto_517990 ) ) ( not ( = ?auto_517987 ?auto_517990 ) ) ( TRUCK-AT ?auto_517991 ?auto_517992 ) ( SURFACE-AT ?auto_517987 ?auto_517992 ) ( CLEAR ?auto_517987 ) ( IS-CRATE ?auto_517988 ) ( AVAILABLE ?auto_517993 ) ( IN ?auto_517988 ?auto_517991 ) ( ON ?auto_517986 ?auto_517985 ) ( ON ?auto_517987 ?auto_517986 ) ( not ( = ?auto_517985 ?auto_517986 ) ) ( not ( = ?auto_517985 ?auto_517987 ) ) ( not ( = ?auto_517985 ?auto_517988 ) ) ( not ( = ?auto_517985 ?auto_517989 ) ) ( not ( = ?auto_517985 ?auto_517990 ) ) ( not ( = ?auto_517986 ?auto_517987 ) ) ( not ( = ?auto_517986 ?auto_517988 ) ) ( not ( = ?auto_517986 ?auto_517989 ) ) ( not ( = ?auto_517986 ?auto_517990 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_517987 ?auto_517988 ?auto_517989 )
      ( MAKE-4CRATE-VERIFY ?auto_517985 ?auto_517986 ?auto_517987 ?auto_517988 ?auto_517989 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_518486 - SURFACE
      ?auto_518487 - SURFACE
    )
    :vars
    (
      ?auto_518490 - HOIST
      ?auto_518494 - PLACE
      ?auto_518491 - SURFACE
      ?auto_518493 - TRUCK
      ?auto_518488 - PLACE
      ?auto_518489 - HOIST
      ?auto_518492 - SURFACE
      ?auto_518495 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_518490 ?auto_518494 ) ( SURFACE-AT ?auto_518486 ?auto_518494 ) ( CLEAR ?auto_518486 ) ( IS-CRATE ?auto_518487 ) ( not ( = ?auto_518486 ?auto_518487 ) ) ( AVAILABLE ?auto_518490 ) ( ON ?auto_518486 ?auto_518491 ) ( not ( = ?auto_518491 ?auto_518486 ) ) ( not ( = ?auto_518491 ?auto_518487 ) ) ( TRUCK-AT ?auto_518493 ?auto_518488 ) ( not ( = ?auto_518488 ?auto_518494 ) ) ( HOIST-AT ?auto_518489 ?auto_518488 ) ( not ( = ?auto_518490 ?auto_518489 ) ) ( SURFACE-AT ?auto_518487 ?auto_518488 ) ( ON ?auto_518487 ?auto_518492 ) ( CLEAR ?auto_518487 ) ( not ( = ?auto_518486 ?auto_518492 ) ) ( not ( = ?auto_518487 ?auto_518492 ) ) ( not ( = ?auto_518491 ?auto_518492 ) ) ( LIFTING ?auto_518489 ?auto_518495 ) ( IS-CRATE ?auto_518495 ) ( not ( = ?auto_518486 ?auto_518495 ) ) ( not ( = ?auto_518487 ?auto_518495 ) ) ( not ( = ?auto_518491 ?auto_518495 ) ) ( not ( = ?auto_518492 ?auto_518495 ) ) )
    :subtasks
    ( ( !LOAD ?auto_518489 ?auto_518495 ?auto_518493 ?auto_518488 )
      ( MAKE-1CRATE ?auto_518486 ?auto_518487 )
      ( MAKE-1CRATE-VERIFY ?auto_518486 ?auto_518487 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518645 - SURFACE
      ?auto_518646 - SURFACE
      ?auto_518647 - SURFACE
      ?auto_518648 - SURFACE
      ?auto_518649 - SURFACE
      ?auto_518650 - SURFACE
    )
    :vars
    (
      ?auto_518651 - HOIST
      ?auto_518652 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_518651 ?auto_518652 ) ( SURFACE-AT ?auto_518649 ?auto_518652 ) ( CLEAR ?auto_518649 ) ( LIFTING ?auto_518651 ?auto_518650 ) ( IS-CRATE ?auto_518650 ) ( not ( = ?auto_518649 ?auto_518650 ) ) ( ON ?auto_518646 ?auto_518645 ) ( ON ?auto_518647 ?auto_518646 ) ( ON ?auto_518648 ?auto_518647 ) ( ON ?auto_518649 ?auto_518648 ) ( not ( = ?auto_518645 ?auto_518646 ) ) ( not ( = ?auto_518645 ?auto_518647 ) ) ( not ( = ?auto_518645 ?auto_518648 ) ) ( not ( = ?auto_518645 ?auto_518649 ) ) ( not ( = ?auto_518645 ?auto_518650 ) ) ( not ( = ?auto_518646 ?auto_518647 ) ) ( not ( = ?auto_518646 ?auto_518648 ) ) ( not ( = ?auto_518646 ?auto_518649 ) ) ( not ( = ?auto_518646 ?auto_518650 ) ) ( not ( = ?auto_518647 ?auto_518648 ) ) ( not ( = ?auto_518647 ?auto_518649 ) ) ( not ( = ?auto_518647 ?auto_518650 ) ) ( not ( = ?auto_518648 ?auto_518649 ) ) ( not ( = ?auto_518648 ?auto_518650 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_518649 ?auto_518650 )
      ( MAKE-5CRATE-VERIFY ?auto_518645 ?auto_518646 ?auto_518647 ?auto_518648 ?auto_518649 ?auto_518650 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518679 - SURFACE
      ?auto_518680 - SURFACE
      ?auto_518681 - SURFACE
      ?auto_518682 - SURFACE
      ?auto_518683 - SURFACE
      ?auto_518684 - SURFACE
    )
    :vars
    (
      ?auto_518686 - HOIST
      ?auto_518685 - PLACE
      ?auto_518687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_518686 ?auto_518685 ) ( SURFACE-AT ?auto_518683 ?auto_518685 ) ( CLEAR ?auto_518683 ) ( IS-CRATE ?auto_518684 ) ( not ( = ?auto_518683 ?auto_518684 ) ) ( TRUCK-AT ?auto_518687 ?auto_518685 ) ( AVAILABLE ?auto_518686 ) ( IN ?auto_518684 ?auto_518687 ) ( ON ?auto_518683 ?auto_518682 ) ( not ( = ?auto_518682 ?auto_518683 ) ) ( not ( = ?auto_518682 ?auto_518684 ) ) ( ON ?auto_518680 ?auto_518679 ) ( ON ?auto_518681 ?auto_518680 ) ( ON ?auto_518682 ?auto_518681 ) ( not ( = ?auto_518679 ?auto_518680 ) ) ( not ( = ?auto_518679 ?auto_518681 ) ) ( not ( = ?auto_518679 ?auto_518682 ) ) ( not ( = ?auto_518679 ?auto_518683 ) ) ( not ( = ?auto_518679 ?auto_518684 ) ) ( not ( = ?auto_518680 ?auto_518681 ) ) ( not ( = ?auto_518680 ?auto_518682 ) ) ( not ( = ?auto_518680 ?auto_518683 ) ) ( not ( = ?auto_518680 ?auto_518684 ) ) ( not ( = ?auto_518681 ?auto_518682 ) ) ( not ( = ?auto_518681 ?auto_518683 ) ) ( not ( = ?auto_518681 ?auto_518684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518682 ?auto_518683 ?auto_518684 )
      ( MAKE-5CRATE-VERIFY ?auto_518679 ?auto_518680 ?auto_518681 ?auto_518682 ?auto_518683 ?auto_518684 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518719 - SURFACE
      ?auto_518720 - SURFACE
      ?auto_518721 - SURFACE
      ?auto_518722 - SURFACE
      ?auto_518723 - SURFACE
      ?auto_518724 - SURFACE
    )
    :vars
    (
      ?auto_518728 - HOIST
      ?auto_518725 - PLACE
      ?auto_518727 - TRUCK
      ?auto_518726 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_518728 ?auto_518725 ) ( SURFACE-AT ?auto_518723 ?auto_518725 ) ( CLEAR ?auto_518723 ) ( IS-CRATE ?auto_518724 ) ( not ( = ?auto_518723 ?auto_518724 ) ) ( AVAILABLE ?auto_518728 ) ( IN ?auto_518724 ?auto_518727 ) ( ON ?auto_518723 ?auto_518722 ) ( not ( = ?auto_518722 ?auto_518723 ) ) ( not ( = ?auto_518722 ?auto_518724 ) ) ( TRUCK-AT ?auto_518727 ?auto_518726 ) ( not ( = ?auto_518726 ?auto_518725 ) ) ( ON ?auto_518720 ?auto_518719 ) ( ON ?auto_518721 ?auto_518720 ) ( ON ?auto_518722 ?auto_518721 ) ( not ( = ?auto_518719 ?auto_518720 ) ) ( not ( = ?auto_518719 ?auto_518721 ) ) ( not ( = ?auto_518719 ?auto_518722 ) ) ( not ( = ?auto_518719 ?auto_518723 ) ) ( not ( = ?auto_518719 ?auto_518724 ) ) ( not ( = ?auto_518720 ?auto_518721 ) ) ( not ( = ?auto_518720 ?auto_518722 ) ) ( not ( = ?auto_518720 ?auto_518723 ) ) ( not ( = ?auto_518720 ?auto_518724 ) ) ( not ( = ?auto_518721 ?auto_518722 ) ) ( not ( = ?auto_518721 ?auto_518723 ) ) ( not ( = ?auto_518721 ?auto_518724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518722 ?auto_518723 ?auto_518724 )
      ( MAKE-5CRATE-VERIFY ?auto_518719 ?auto_518720 ?auto_518721 ?auto_518722 ?auto_518723 ?auto_518724 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518764 - SURFACE
      ?auto_518765 - SURFACE
      ?auto_518766 - SURFACE
      ?auto_518767 - SURFACE
      ?auto_518768 - SURFACE
      ?auto_518769 - SURFACE
    )
    :vars
    (
      ?auto_518772 - HOIST
      ?auto_518774 - PLACE
      ?auto_518771 - TRUCK
      ?auto_518770 - PLACE
      ?auto_518773 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_518772 ?auto_518774 ) ( SURFACE-AT ?auto_518768 ?auto_518774 ) ( CLEAR ?auto_518768 ) ( IS-CRATE ?auto_518769 ) ( not ( = ?auto_518768 ?auto_518769 ) ) ( AVAILABLE ?auto_518772 ) ( ON ?auto_518768 ?auto_518767 ) ( not ( = ?auto_518767 ?auto_518768 ) ) ( not ( = ?auto_518767 ?auto_518769 ) ) ( TRUCK-AT ?auto_518771 ?auto_518770 ) ( not ( = ?auto_518770 ?auto_518774 ) ) ( HOIST-AT ?auto_518773 ?auto_518770 ) ( LIFTING ?auto_518773 ?auto_518769 ) ( not ( = ?auto_518772 ?auto_518773 ) ) ( ON ?auto_518765 ?auto_518764 ) ( ON ?auto_518766 ?auto_518765 ) ( ON ?auto_518767 ?auto_518766 ) ( not ( = ?auto_518764 ?auto_518765 ) ) ( not ( = ?auto_518764 ?auto_518766 ) ) ( not ( = ?auto_518764 ?auto_518767 ) ) ( not ( = ?auto_518764 ?auto_518768 ) ) ( not ( = ?auto_518764 ?auto_518769 ) ) ( not ( = ?auto_518765 ?auto_518766 ) ) ( not ( = ?auto_518765 ?auto_518767 ) ) ( not ( = ?auto_518765 ?auto_518768 ) ) ( not ( = ?auto_518765 ?auto_518769 ) ) ( not ( = ?auto_518766 ?auto_518767 ) ) ( not ( = ?auto_518766 ?auto_518768 ) ) ( not ( = ?auto_518766 ?auto_518769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518767 ?auto_518768 ?auto_518769 )
      ( MAKE-5CRATE-VERIFY ?auto_518764 ?auto_518765 ?auto_518766 ?auto_518767 ?auto_518768 ?auto_518769 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518814 - SURFACE
      ?auto_518815 - SURFACE
      ?auto_518816 - SURFACE
      ?auto_518817 - SURFACE
      ?auto_518818 - SURFACE
      ?auto_518819 - SURFACE
    )
    :vars
    (
      ?auto_518825 - HOIST
      ?auto_518823 - PLACE
      ?auto_518821 - TRUCK
      ?auto_518824 - PLACE
      ?auto_518822 - HOIST
      ?auto_518820 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_518825 ?auto_518823 ) ( SURFACE-AT ?auto_518818 ?auto_518823 ) ( CLEAR ?auto_518818 ) ( IS-CRATE ?auto_518819 ) ( not ( = ?auto_518818 ?auto_518819 ) ) ( AVAILABLE ?auto_518825 ) ( ON ?auto_518818 ?auto_518817 ) ( not ( = ?auto_518817 ?auto_518818 ) ) ( not ( = ?auto_518817 ?auto_518819 ) ) ( TRUCK-AT ?auto_518821 ?auto_518824 ) ( not ( = ?auto_518824 ?auto_518823 ) ) ( HOIST-AT ?auto_518822 ?auto_518824 ) ( not ( = ?auto_518825 ?auto_518822 ) ) ( AVAILABLE ?auto_518822 ) ( SURFACE-AT ?auto_518819 ?auto_518824 ) ( ON ?auto_518819 ?auto_518820 ) ( CLEAR ?auto_518819 ) ( not ( = ?auto_518818 ?auto_518820 ) ) ( not ( = ?auto_518819 ?auto_518820 ) ) ( not ( = ?auto_518817 ?auto_518820 ) ) ( ON ?auto_518815 ?auto_518814 ) ( ON ?auto_518816 ?auto_518815 ) ( ON ?auto_518817 ?auto_518816 ) ( not ( = ?auto_518814 ?auto_518815 ) ) ( not ( = ?auto_518814 ?auto_518816 ) ) ( not ( = ?auto_518814 ?auto_518817 ) ) ( not ( = ?auto_518814 ?auto_518818 ) ) ( not ( = ?auto_518814 ?auto_518819 ) ) ( not ( = ?auto_518814 ?auto_518820 ) ) ( not ( = ?auto_518815 ?auto_518816 ) ) ( not ( = ?auto_518815 ?auto_518817 ) ) ( not ( = ?auto_518815 ?auto_518818 ) ) ( not ( = ?auto_518815 ?auto_518819 ) ) ( not ( = ?auto_518815 ?auto_518820 ) ) ( not ( = ?auto_518816 ?auto_518817 ) ) ( not ( = ?auto_518816 ?auto_518818 ) ) ( not ( = ?auto_518816 ?auto_518819 ) ) ( not ( = ?auto_518816 ?auto_518820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518817 ?auto_518818 ?auto_518819 )
      ( MAKE-5CRATE-VERIFY ?auto_518814 ?auto_518815 ?auto_518816 ?auto_518817 ?auto_518818 ?auto_518819 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518865 - SURFACE
      ?auto_518866 - SURFACE
      ?auto_518867 - SURFACE
      ?auto_518868 - SURFACE
      ?auto_518869 - SURFACE
      ?auto_518870 - SURFACE
    )
    :vars
    (
      ?auto_518871 - HOIST
      ?auto_518875 - PLACE
      ?auto_518874 - PLACE
      ?auto_518873 - HOIST
      ?auto_518876 - SURFACE
      ?auto_518872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_518871 ?auto_518875 ) ( SURFACE-AT ?auto_518869 ?auto_518875 ) ( CLEAR ?auto_518869 ) ( IS-CRATE ?auto_518870 ) ( not ( = ?auto_518869 ?auto_518870 ) ) ( AVAILABLE ?auto_518871 ) ( ON ?auto_518869 ?auto_518868 ) ( not ( = ?auto_518868 ?auto_518869 ) ) ( not ( = ?auto_518868 ?auto_518870 ) ) ( not ( = ?auto_518874 ?auto_518875 ) ) ( HOIST-AT ?auto_518873 ?auto_518874 ) ( not ( = ?auto_518871 ?auto_518873 ) ) ( AVAILABLE ?auto_518873 ) ( SURFACE-AT ?auto_518870 ?auto_518874 ) ( ON ?auto_518870 ?auto_518876 ) ( CLEAR ?auto_518870 ) ( not ( = ?auto_518869 ?auto_518876 ) ) ( not ( = ?auto_518870 ?auto_518876 ) ) ( not ( = ?auto_518868 ?auto_518876 ) ) ( TRUCK-AT ?auto_518872 ?auto_518875 ) ( ON ?auto_518866 ?auto_518865 ) ( ON ?auto_518867 ?auto_518866 ) ( ON ?auto_518868 ?auto_518867 ) ( not ( = ?auto_518865 ?auto_518866 ) ) ( not ( = ?auto_518865 ?auto_518867 ) ) ( not ( = ?auto_518865 ?auto_518868 ) ) ( not ( = ?auto_518865 ?auto_518869 ) ) ( not ( = ?auto_518865 ?auto_518870 ) ) ( not ( = ?auto_518865 ?auto_518876 ) ) ( not ( = ?auto_518866 ?auto_518867 ) ) ( not ( = ?auto_518866 ?auto_518868 ) ) ( not ( = ?auto_518866 ?auto_518869 ) ) ( not ( = ?auto_518866 ?auto_518870 ) ) ( not ( = ?auto_518866 ?auto_518876 ) ) ( not ( = ?auto_518867 ?auto_518868 ) ) ( not ( = ?auto_518867 ?auto_518869 ) ) ( not ( = ?auto_518867 ?auto_518870 ) ) ( not ( = ?auto_518867 ?auto_518876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518868 ?auto_518869 ?auto_518870 )
      ( MAKE-5CRATE-VERIFY ?auto_518865 ?auto_518866 ?auto_518867 ?auto_518868 ?auto_518869 ?auto_518870 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518916 - SURFACE
      ?auto_518917 - SURFACE
      ?auto_518918 - SURFACE
      ?auto_518919 - SURFACE
      ?auto_518920 - SURFACE
      ?auto_518921 - SURFACE
    )
    :vars
    (
      ?auto_518922 - HOIST
      ?auto_518925 - PLACE
      ?auto_518926 - PLACE
      ?auto_518924 - HOIST
      ?auto_518927 - SURFACE
      ?auto_518923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_518922 ?auto_518925 ) ( IS-CRATE ?auto_518921 ) ( not ( = ?auto_518920 ?auto_518921 ) ) ( not ( = ?auto_518919 ?auto_518920 ) ) ( not ( = ?auto_518919 ?auto_518921 ) ) ( not ( = ?auto_518926 ?auto_518925 ) ) ( HOIST-AT ?auto_518924 ?auto_518926 ) ( not ( = ?auto_518922 ?auto_518924 ) ) ( AVAILABLE ?auto_518924 ) ( SURFACE-AT ?auto_518921 ?auto_518926 ) ( ON ?auto_518921 ?auto_518927 ) ( CLEAR ?auto_518921 ) ( not ( = ?auto_518920 ?auto_518927 ) ) ( not ( = ?auto_518921 ?auto_518927 ) ) ( not ( = ?auto_518919 ?auto_518927 ) ) ( TRUCK-AT ?auto_518923 ?auto_518925 ) ( SURFACE-AT ?auto_518919 ?auto_518925 ) ( CLEAR ?auto_518919 ) ( LIFTING ?auto_518922 ?auto_518920 ) ( IS-CRATE ?auto_518920 ) ( ON ?auto_518917 ?auto_518916 ) ( ON ?auto_518918 ?auto_518917 ) ( ON ?auto_518919 ?auto_518918 ) ( not ( = ?auto_518916 ?auto_518917 ) ) ( not ( = ?auto_518916 ?auto_518918 ) ) ( not ( = ?auto_518916 ?auto_518919 ) ) ( not ( = ?auto_518916 ?auto_518920 ) ) ( not ( = ?auto_518916 ?auto_518921 ) ) ( not ( = ?auto_518916 ?auto_518927 ) ) ( not ( = ?auto_518917 ?auto_518918 ) ) ( not ( = ?auto_518917 ?auto_518919 ) ) ( not ( = ?auto_518917 ?auto_518920 ) ) ( not ( = ?auto_518917 ?auto_518921 ) ) ( not ( = ?auto_518917 ?auto_518927 ) ) ( not ( = ?auto_518918 ?auto_518919 ) ) ( not ( = ?auto_518918 ?auto_518920 ) ) ( not ( = ?auto_518918 ?auto_518921 ) ) ( not ( = ?auto_518918 ?auto_518927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518919 ?auto_518920 ?auto_518921 )
      ( MAKE-5CRATE-VERIFY ?auto_518916 ?auto_518917 ?auto_518918 ?auto_518919 ?auto_518920 ?auto_518921 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_518967 - SURFACE
      ?auto_518968 - SURFACE
      ?auto_518969 - SURFACE
      ?auto_518970 - SURFACE
      ?auto_518971 - SURFACE
      ?auto_518972 - SURFACE
    )
    :vars
    (
      ?auto_518977 - HOIST
      ?auto_518974 - PLACE
      ?auto_518973 - PLACE
      ?auto_518978 - HOIST
      ?auto_518975 - SURFACE
      ?auto_518976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_518977 ?auto_518974 ) ( IS-CRATE ?auto_518972 ) ( not ( = ?auto_518971 ?auto_518972 ) ) ( not ( = ?auto_518970 ?auto_518971 ) ) ( not ( = ?auto_518970 ?auto_518972 ) ) ( not ( = ?auto_518973 ?auto_518974 ) ) ( HOIST-AT ?auto_518978 ?auto_518973 ) ( not ( = ?auto_518977 ?auto_518978 ) ) ( AVAILABLE ?auto_518978 ) ( SURFACE-AT ?auto_518972 ?auto_518973 ) ( ON ?auto_518972 ?auto_518975 ) ( CLEAR ?auto_518972 ) ( not ( = ?auto_518971 ?auto_518975 ) ) ( not ( = ?auto_518972 ?auto_518975 ) ) ( not ( = ?auto_518970 ?auto_518975 ) ) ( TRUCK-AT ?auto_518976 ?auto_518974 ) ( SURFACE-AT ?auto_518970 ?auto_518974 ) ( CLEAR ?auto_518970 ) ( IS-CRATE ?auto_518971 ) ( AVAILABLE ?auto_518977 ) ( IN ?auto_518971 ?auto_518976 ) ( ON ?auto_518968 ?auto_518967 ) ( ON ?auto_518969 ?auto_518968 ) ( ON ?auto_518970 ?auto_518969 ) ( not ( = ?auto_518967 ?auto_518968 ) ) ( not ( = ?auto_518967 ?auto_518969 ) ) ( not ( = ?auto_518967 ?auto_518970 ) ) ( not ( = ?auto_518967 ?auto_518971 ) ) ( not ( = ?auto_518967 ?auto_518972 ) ) ( not ( = ?auto_518967 ?auto_518975 ) ) ( not ( = ?auto_518968 ?auto_518969 ) ) ( not ( = ?auto_518968 ?auto_518970 ) ) ( not ( = ?auto_518968 ?auto_518971 ) ) ( not ( = ?auto_518968 ?auto_518972 ) ) ( not ( = ?auto_518968 ?auto_518975 ) ) ( not ( = ?auto_518969 ?auto_518970 ) ) ( not ( = ?auto_518969 ?auto_518971 ) ) ( not ( = ?auto_518969 ?auto_518972 ) ) ( not ( = ?auto_518969 ?auto_518975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_518970 ?auto_518971 ?auto_518972 )
      ( MAKE-5CRATE-VERIFY ?auto_518967 ?auto_518968 ?auto_518969 ?auto_518970 ?auto_518971 ?auto_518972 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_519959 - SURFACE
      ?auto_519960 - SURFACE
    )
    :vars
    (
      ?auto_519966 - HOIST
      ?auto_519962 - PLACE
      ?auto_519963 - SURFACE
      ?auto_519964 - PLACE
      ?auto_519965 - HOIST
      ?auto_519961 - SURFACE
      ?auto_519967 - TRUCK
      ?auto_519968 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_519966 ?auto_519962 ) ( SURFACE-AT ?auto_519959 ?auto_519962 ) ( CLEAR ?auto_519959 ) ( IS-CRATE ?auto_519960 ) ( not ( = ?auto_519959 ?auto_519960 ) ) ( ON ?auto_519959 ?auto_519963 ) ( not ( = ?auto_519963 ?auto_519959 ) ) ( not ( = ?auto_519963 ?auto_519960 ) ) ( not ( = ?auto_519964 ?auto_519962 ) ) ( HOIST-AT ?auto_519965 ?auto_519964 ) ( not ( = ?auto_519966 ?auto_519965 ) ) ( AVAILABLE ?auto_519965 ) ( SURFACE-AT ?auto_519960 ?auto_519964 ) ( ON ?auto_519960 ?auto_519961 ) ( CLEAR ?auto_519960 ) ( not ( = ?auto_519959 ?auto_519961 ) ) ( not ( = ?auto_519960 ?auto_519961 ) ) ( not ( = ?auto_519963 ?auto_519961 ) ) ( TRUCK-AT ?auto_519967 ?auto_519962 ) ( LIFTING ?auto_519966 ?auto_519968 ) ( IS-CRATE ?auto_519968 ) ( not ( = ?auto_519959 ?auto_519968 ) ) ( not ( = ?auto_519960 ?auto_519968 ) ) ( not ( = ?auto_519963 ?auto_519968 ) ) ( not ( = ?auto_519961 ?auto_519968 ) ) )
    :subtasks
    ( ( !LOAD ?auto_519966 ?auto_519968 ?auto_519967 ?auto_519962 )
      ( MAKE-1CRATE ?auto_519959 ?auto_519960 )
      ( MAKE-1CRATE-VERIFY ?auto_519959 ?auto_519960 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520174 - SURFACE
      ?auto_520175 - SURFACE
      ?auto_520176 - SURFACE
      ?auto_520177 - SURFACE
      ?auto_520178 - SURFACE
      ?auto_520179 - SURFACE
      ?auto_520180 - SURFACE
    )
    :vars
    (
      ?auto_520181 - HOIST
      ?auto_520182 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_520181 ?auto_520182 ) ( SURFACE-AT ?auto_520179 ?auto_520182 ) ( CLEAR ?auto_520179 ) ( LIFTING ?auto_520181 ?auto_520180 ) ( IS-CRATE ?auto_520180 ) ( not ( = ?auto_520179 ?auto_520180 ) ) ( ON ?auto_520175 ?auto_520174 ) ( ON ?auto_520176 ?auto_520175 ) ( ON ?auto_520177 ?auto_520176 ) ( ON ?auto_520178 ?auto_520177 ) ( ON ?auto_520179 ?auto_520178 ) ( not ( = ?auto_520174 ?auto_520175 ) ) ( not ( = ?auto_520174 ?auto_520176 ) ) ( not ( = ?auto_520174 ?auto_520177 ) ) ( not ( = ?auto_520174 ?auto_520178 ) ) ( not ( = ?auto_520174 ?auto_520179 ) ) ( not ( = ?auto_520174 ?auto_520180 ) ) ( not ( = ?auto_520175 ?auto_520176 ) ) ( not ( = ?auto_520175 ?auto_520177 ) ) ( not ( = ?auto_520175 ?auto_520178 ) ) ( not ( = ?auto_520175 ?auto_520179 ) ) ( not ( = ?auto_520175 ?auto_520180 ) ) ( not ( = ?auto_520176 ?auto_520177 ) ) ( not ( = ?auto_520176 ?auto_520178 ) ) ( not ( = ?auto_520176 ?auto_520179 ) ) ( not ( = ?auto_520176 ?auto_520180 ) ) ( not ( = ?auto_520177 ?auto_520178 ) ) ( not ( = ?auto_520177 ?auto_520179 ) ) ( not ( = ?auto_520177 ?auto_520180 ) ) ( not ( = ?auto_520178 ?auto_520179 ) ) ( not ( = ?auto_520178 ?auto_520180 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_520179 ?auto_520180 )
      ( MAKE-6CRATE-VERIFY ?auto_520174 ?auto_520175 ?auto_520176 ?auto_520177 ?auto_520178 ?auto_520179 ?auto_520180 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520218 - SURFACE
      ?auto_520219 - SURFACE
      ?auto_520220 - SURFACE
      ?auto_520221 - SURFACE
      ?auto_520222 - SURFACE
      ?auto_520223 - SURFACE
      ?auto_520224 - SURFACE
    )
    :vars
    (
      ?auto_520227 - HOIST
      ?auto_520225 - PLACE
      ?auto_520226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_520227 ?auto_520225 ) ( SURFACE-AT ?auto_520223 ?auto_520225 ) ( CLEAR ?auto_520223 ) ( IS-CRATE ?auto_520224 ) ( not ( = ?auto_520223 ?auto_520224 ) ) ( TRUCK-AT ?auto_520226 ?auto_520225 ) ( AVAILABLE ?auto_520227 ) ( IN ?auto_520224 ?auto_520226 ) ( ON ?auto_520223 ?auto_520222 ) ( not ( = ?auto_520222 ?auto_520223 ) ) ( not ( = ?auto_520222 ?auto_520224 ) ) ( ON ?auto_520219 ?auto_520218 ) ( ON ?auto_520220 ?auto_520219 ) ( ON ?auto_520221 ?auto_520220 ) ( ON ?auto_520222 ?auto_520221 ) ( not ( = ?auto_520218 ?auto_520219 ) ) ( not ( = ?auto_520218 ?auto_520220 ) ) ( not ( = ?auto_520218 ?auto_520221 ) ) ( not ( = ?auto_520218 ?auto_520222 ) ) ( not ( = ?auto_520218 ?auto_520223 ) ) ( not ( = ?auto_520218 ?auto_520224 ) ) ( not ( = ?auto_520219 ?auto_520220 ) ) ( not ( = ?auto_520219 ?auto_520221 ) ) ( not ( = ?auto_520219 ?auto_520222 ) ) ( not ( = ?auto_520219 ?auto_520223 ) ) ( not ( = ?auto_520219 ?auto_520224 ) ) ( not ( = ?auto_520220 ?auto_520221 ) ) ( not ( = ?auto_520220 ?auto_520222 ) ) ( not ( = ?auto_520220 ?auto_520223 ) ) ( not ( = ?auto_520220 ?auto_520224 ) ) ( not ( = ?auto_520221 ?auto_520222 ) ) ( not ( = ?auto_520221 ?auto_520223 ) ) ( not ( = ?auto_520221 ?auto_520224 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_520222 ?auto_520223 ?auto_520224 )
      ( MAKE-6CRATE-VERIFY ?auto_520218 ?auto_520219 ?auto_520220 ?auto_520221 ?auto_520222 ?auto_520223 ?auto_520224 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520269 - SURFACE
      ?auto_520270 - SURFACE
      ?auto_520271 - SURFACE
      ?auto_520272 - SURFACE
      ?auto_520273 - SURFACE
      ?auto_520274 - SURFACE
      ?auto_520275 - SURFACE
    )
    :vars
    (
      ?auto_520279 - HOIST
      ?auto_520278 - PLACE
      ?auto_520277 - TRUCK
      ?auto_520276 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_520279 ?auto_520278 ) ( SURFACE-AT ?auto_520274 ?auto_520278 ) ( CLEAR ?auto_520274 ) ( IS-CRATE ?auto_520275 ) ( not ( = ?auto_520274 ?auto_520275 ) ) ( AVAILABLE ?auto_520279 ) ( IN ?auto_520275 ?auto_520277 ) ( ON ?auto_520274 ?auto_520273 ) ( not ( = ?auto_520273 ?auto_520274 ) ) ( not ( = ?auto_520273 ?auto_520275 ) ) ( TRUCK-AT ?auto_520277 ?auto_520276 ) ( not ( = ?auto_520276 ?auto_520278 ) ) ( ON ?auto_520270 ?auto_520269 ) ( ON ?auto_520271 ?auto_520270 ) ( ON ?auto_520272 ?auto_520271 ) ( ON ?auto_520273 ?auto_520272 ) ( not ( = ?auto_520269 ?auto_520270 ) ) ( not ( = ?auto_520269 ?auto_520271 ) ) ( not ( = ?auto_520269 ?auto_520272 ) ) ( not ( = ?auto_520269 ?auto_520273 ) ) ( not ( = ?auto_520269 ?auto_520274 ) ) ( not ( = ?auto_520269 ?auto_520275 ) ) ( not ( = ?auto_520270 ?auto_520271 ) ) ( not ( = ?auto_520270 ?auto_520272 ) ) ( not ( = ?auto_520270 ?auto_520273 ) ) ( not ( = ?auto_520270 ?auto_520274 ) ) ( not ( = ?auto_520270 ?auto_520275 ) ) ( not ( = ?auto_520271 ?auto_520272 ) ) ( not ( = ?auto_520271 ?auto_520273 ) ) ( not ( = ?auto_520271 ?auto_520274 ) ) ( not ( = ?auto_520271 ?auto_520275 ) ) ( not ( = ?auto_520272 ?auto_520273 ) ) ( not ( = ?auto_520272 ?auto_520274 ) ) ( not ( = ?auto_520272 ?auto_520275 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_520273 ?auto_520274 ?auto_520275 )
      ( MAKE-6CRATE-VERIFY ?auto_520269 ?auto_520270 ?auto_520271 ?auto_520272 ?auto_520273 ?auto_520274 ?auto_520275 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520326 - SURFACE
      ?auto_520327 - SURFACE
      ?auto_520328 - SURFACE
      ?auto_520329 - SURFACE
      ?auto_520330 - SURFACE
      ?auto_520331 - SURFACE
      ?auto_520332 - SURFACE
    )
    :vars
    (
      ?auto_520334 - HOIST
      ?auto_520333 - PLACE
      ?auto_520337 - TRUCK
      ?auto_520336 - PLACE
      ?auto_520335 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_520334 ?auto_520333 ) ( SURFACE-AT ?auto_520331 ?auto_520333 ) ( CLEAR ?auto_520331 ) ( IS-CRATE ?auto_520332 ) ( not ( = ?auto_520331 ?auto_520332 ) ) ( AVAILABLE ?auto_520334 ) ( ON ?auto_520331 ?auto_520330 ) ( not ( = ?auto_520330 ?auto_520331 ) ) ( not ( = ?auto_520330 ?auto_520332 ) ) ( TRUCK-AT ?auto_520337 ?auto_520336 ) ( not ( = ?auto_520336 ?auto_520333 ) ) ( HOIST-AT ?auto_520335 ?auto_520336 ) ( LIFTING ?auto_520335 ?auto_520332 ) ( not ( = ?auto_520334 ?auto_520335 ) ) ( ON ?auto_520327 ?auto_520326 ) ( ON ?auto_520328 ?auto_520327 ) ( ON ?auto_520329 ?auto_520328 ) ( ON ?auto_520330 ?auto_520329 ) ( not ( = ?auto_520326 ?auto_520327 ) ) ( not ( = ?auto_520326 ?auto_520328 ) ) ( not ( = ?auto_520326 ?auto_520329 ) ) ( not ( = ?auto_520326 ?auto_520330 ) ) ( not ( = ?auto_520326 ?auto_520331 ) ) ( not ( = ?auto_520326 ?auto_520332 ) ) ( not ( = ?auto_520327 ?auto_520328 ) ) ( not ( = ?auto_520327 ?auto_520329 ) ) ( not ( = ?auto_520327 ?auto_520330 ) ) ( not ( = ?auto_520327 ?auto_520331 ) ) ( not ( = ?auto_520327 ?auto_520332 ) ) ( not ( = ?auto_520328 ?auto_520329 ) ) ( not ( = ?auto_520328 ?auto_520330 ) ) ( not ( = ?auto_520328 ?auto_520331 ) ) ( not ( = ?auto_520328 ?auto_520332 ) ) ( not ( = ?auto_520329 ?auto_520330 ) ) ( not ( = ?auto_520329 ?auto_520331 ) ) ( not ( = ?auto_520329 ?auto_520332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_520330 ?auto_520331 ?auto_520332 )
      ( MAKE-6CRATE-VERIFY ?auto_520326 ?auto_520327 ?auto_520328 ?auto_520329 ?auto_520330 ?auto_520331 ?auto_520332 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520389 - SURFACE
      ?auto_520390 - SURFACE
      ?auto_520391 - SURFACE
      ?auto_520392 - SURFACE
      ?auto_520393 - SURFACE
      ?auto_520394 - SURFACE
      ?auto_520395 - SURFACE
    )
    :vars
    (
      ?auto_520398 - HOIST
      ?auto_520401 - PLACE
      ?auto_520396 - TRUCK
      ?auto_520397 - PLACE
      ?auto_520400 - HOIST
      ?auto_520399 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_520398 ?auto_520401 ) ( SURFACE-AT ?auto_520394 ?auto_520401 ) ( CLEAR ?auto_520394 ) ( IS-CRATE ?auto_520395 ) ( not ( = ?auto_520394 ?auto_520395 ) ) ( AVAILABLE ?auto_520398 ) ( ON ?auto_520394 ?auto_520393 ) ( not ( = ?auto_520393 ?auto_520394 ) ) ( not ( = ?auto_520393 ?auto_520395 ) ) ( TRUCK-AT ?auto_520396 ?auto_520397 ) ( not ( = ?auto_520397 ?auto_520401 ) ) ( HOIST-AT ?auto_520400 ?auto_520397 ) ( not ( = ?auto_520398 ?auto_520400 ) ) ( AVAILABLE ?auto_520400 ) ( SURFACE-AT ?auto_520395 ?auto_520397 ) ( ON ?auto_520395 ?auto_520399 ) ( CLEAR ?auto_520395 ) ( not ( = ?auto_520394 ?auto_520399 ) ) ( not ( = ?auto_520395 ?auto_520399 ) ) ( not ( = ?auto_520393 ?auto_520399 ) ) ( ON ?auto_520390 ?auto_520389 ) ( ON ?auto_520391 ?auto_520390 ) ( ON ?auto_520392 ?auto_520391 ) ( ON ?auto_520393 ?auto_520392 ) ( not ( = ?auto_520389 ?auto_520390 ) ) ( not ( = ?auto_520389 ?auto_520391 ) ) ( not ( = ?auto_520389 ?auto_520392 ) ) ( not ( = ?auto_520389 ?auto_520393 ) ) ( not ( = ?auto_520389 ?auto_520394 ) ) ( not ( = ?auto_520389 ?auto_520395 ) ) ( not ( = ?auto_520389 ?auto_520399 ) ) ( not ( = ?auto_520390 ?auto_520391 ) ) ( not ( = ?auto_520390 ?auto_520392 ) ) ( not ( = ?auto_520390 ?auto_520393 ) ) ( not ( = ?auto_520390 ?auto_520394 ) ) ( not ( = ?auto_520390 ?auto_520395 ) ) ( not ( = ?auto_520390 ?auto_520399 ) ) ( not ( = ?auto_520391 ?auto_520392 ) ) ( not ( = ?auto_520391 ?auto_520393 ) ) ( not ( = ?auto_520391 ?auto_520394 ) ) ( not ( = ?auto_520391 ?auto_520395 ) ) ( not ( = ?auto_520391 ?auto_520399 ) ) ( not ( = ?auto_520392 ?auto_520393 ) ) ( not ( = ?auto_520392 ?auto_520394 ) ) ( not ( = ?auto_520392 ?auto_520395 ) ) ( not ( = ?auto_520392 ?auto_520399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_520393 ?auto_520394 ?auto_520395 )
      ( MAKE-6CRATE-VERIFY ?auto_520389 ?auto_520390 ?auto_520391 ?auto_520392 ?auto_520393 ?auto_520394 ?auto_520395 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520453 - SURFACE
      ?auto_520454 - SURFACE
      ?auto_520455 - SURFACE
      ?auto_520456 - SURFACE
      ?auto_520457 - SURFACE
      ?auto_520458 - SURFACE
      ?auto_520459 - SURFACE
    )
    :vars
    (
      ?auto_520465 - HOIST
      ?auto_520460 - PLACE
      ?auto_520464 - PLACE
      ?auto_520462 - HOIST
      ?auto_520463 - SURFACE
      ?auto_520461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_520465 ?auto_520460 ) ( SURFACE-AT ?auto_520458 ?auto_520460 ) ( CLEAR ?auto_520458 ) ( IS-CRATE ?auto_520459 ) ( not ( = ?auto_520458 ?auto_520459 ) ) ( AVAILABLE ?auto_520465 ) ( ON ?auto_520458 ?auto_520457 ) ( not ( = ?auto_520457 ?auto_520458 ) ) ( not ( = ?auto_520457 ?auto_520459 ) ) ( not ( = ?auto_520464 ?auto_520460 ) ) ( HOIST-AT ?auto_520462 ?auto_520464 ) ( not ( = ?auto_520465 ?auto_520462 ) ) ( AVAILABLE ?auto_520462 ) ( SURFACE-AT ?auto_520459 ?auto_520464 ) ( ON ?auto_520459 ?auto_520463 ) ( CLEAR ?auto_520459 ) ( not ( = ?auto_520458 ?auto_520463 ) ) ( not ( = ?auto_520459 ?auto_520463 ) ) ( not ( = ?auto_520457 ?auto_520463 ) ) ( TRUCK-AT ?auto_520461 ?auto_520460 ) ( ON ?auto_520454 ?auto_520453 ) ( ON ?auto_520455 ?auto_520454 ) ( ON ?auto_520456 ?auto_520455 ) ( ON ?auto_520457 ?auto_520456 ) ( not ( = ?auto_520453 ?auto_520454 ) ) ( not ( = ?auto_520453 ?auto_520455 ) ) ( not ( = ?auto_520453 ?auto_520456 ) ) ( not ( = ?auto_520453 ?auto_520457 ) ) ( not ( = ?auto_520453 ?auto_520458 ) ) ( not ( = ?auto_520453 ?auto_520459 ) ) ( not ( = ?auto_520453 ?auto_520463 ) ) ( not ( = ?auto_520454 ?auto_520455 ) ) ( not ( = ?auto_520454 ?auto_520456 ) ) ( not ( = ?auto_520454 ?auto_520457 ) ) ( not ( = ?auto_520454 ?auto_520458 ) ) ( not ( = ?auto_520454 ?auto_520459 ) ) ( not ( = ?auto_520454 ?auto_520463 ) ) ( not ( = ?auto_520455 ?auto_520456 ) ) ( not ( = ?auto_520455 ?auto_520457 ) ) ( not ( = ?auto_520455 ?auto_520458 ) ) ( not ( = ?auto_520455 ?auto_520459 ) ) ( not ( = ?auto_520455 ?auto_520463 ) ) ( not ( = ?auto_520456 ?auto_520457 ) ) ( not ( = ?auto_520456 ?auto_520458 ) ) ( not ( = ?auto_520456 ?auto_520459 ) ) ( not ( = ?auto_520456 ?auto_520463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_520457 ?auto_520458 ?auto_520459 )
      ( MAKE-6CRATE-VERIFY ?auto_520453 ?auto_520454 ?auto_520455 ?auto_520456 ?auto_520457 ?auto_520458 ?auto_520459 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520517 - SURFACE
      ?auto_520518 - SURFACE
      ?auto_520519 - SURFACE
      ?auto_520520 - SURFACE
      ?auto_520521 - SURFACE
      ?auto_520522 - SURFACE
      ?auto_520523 - SURFACE
    )
    :vars
    (
      ?auto_520526 - HOIST
      ?auto_520528 - PLACE
      ?auto_520527 - PLACE
      ?auto_520524 - HOIST
      ?auto_520529 - SURFACE
      ?auto_520525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_520526 ?auto_520528 ) ( IS-CRATE ?auto_520523 ) ( not ( = ?auto_520522 ?auto_520523 ) ) ( not ( = ?auto_520521 ?auto_520522 ) ) ( not ( = ?auto_520521 ?auto_520523 ) ) ( not ( = ?auto_520527 ?auto_520528 ) ) ( HOIST-AT ?auto_520524 ?auto_520527 ) ( not ( = ?auto_520526 ?auto_520524 ) ) ( AVAILABLE ?auto_520524 ) ( SURFACE-AT ?auto_520523 ?auto_520527 ) ( ON ?auto_520523 ?auto_520529 ) ( CLEAR ?auto_520523 ) ( not ( = ?auto_520522 ?auto_520529 ) ) ( not ( = ?auto_520523 ?auto_520529 ) ) ( not ( = ?auto_520521 ?auto_520529 ) ) ( TRUCK-AT ?auto_520525 ?auto_520528 ) ( SURFACE-AT ?auto_520521 ?auto_520528 ) ( CLEAR ?auto_520521 ) ( LIFTING ?auto_520526 ?auto_520522 ) ( IS-CRATE ?auto_520522 ) ( ON ?auto_520518 ?auto_520517 ) ( ON ?auto_520519 ?auto_520518 ) ( ON ?auto_520520 ?auto_520519 ) ( ON ?auto_520521 ?auto_520520 ) ( not ( = ?auto_520517 ?auto_520518 ) ) ( not ( = ?auto_520517 ?auto_520519 ) ) ( not ( = ?auto_520517 ?auto_520520 ) ) ( not ( = ?auto_520517 ?auto_520521 ) ) ( not ( = ?auto_520517 ?auto_520522 ) ) ( not ( = ?auto_520517 ?auto_520523 ) ) ( not ( = ?auto_520517 ?auto_520529 ) ) ( not ( = ?auto_520518 ?auto_520519 ) ) ( not ( = ?auto_520518 ?auto_520520 ) ) ( not ( = ?auto_520518 ?auto_520521 ) ) ( not ( = ?auto_520518 ?auto_520522 ) ) ( not ( = ?auto_520518 ?auto_520523 ) ) ( not ( = ?auto_520518 ?auto_520529 ) ) ( not ( = ?auto_520519 ?auto_520520 ) ) ( not ( = ?auto_520519 ?auto_520521 ) ) ( not ( = ?auto_520519 ?auto_520522 ) ) ( not ( = ?auto_520519 ?auto_520523 ) ) ( not ( = ?auto_520519 ?auto_520529 ) ) ( not ( = ?auto_520520 ?auto_520521 ) ) ( not ( = ?auto_520520 ?auto_520522 ) ) ( not ( = ?auto_520520 ?auto_520523 ) ) ( not ( = ?auto_520520 ?auto_520529 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_520521 ?auto_520522 ?auto_520523 )
      ( MAKE-6CRATE-VERIFY ?auto_520517 ?auto_520518 ?auto_520519 ?auto_520520 ?auto_520521 ?auto_520522 ?auto_520523 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_520581 - SURFACE
      ?auto_520582 - SURFACE
      ?auto_520583 - SURFACE
      ?auto_520584 - SURFACE
      ?auto_520585 - SURFACE
      ?auto_520586 - SURFACE
      ?auto_520587 - SURFACE
    )
    :vars
    (
      ?auto_520591 - HOIST
      ?auto_520590 - PLACE
      ?auto_520592 - PLACE
      ?auto_520589 - HOIST
      ?auto_520588 - SURFACE
      ?auto_520593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_520591 ?auto_520590 ) ( IS-CRATE ?auto_520587 ) ( not ( = ?auto_520586 ?auto_520587 ) ) ( not ( = ?auto_520585 ?auto_520586 ) ) ( not ( = ?auto_520585 ?auto_520587 ) ) ( not ( = ?auto_520592 ?auto_520590 ) ) ( HOIST-AT ?auto_520589 ?auto_520592 ) ( not ( = ?auto_520591 ?auto_520589 ) ) ( AVAILABLE ?auto_520589 ) ( SURFACE-AT ?auto_520587 ?auto_520592 ) ( ON ?auto_520587 ?auto_520588 ) ( CLEAR ?auto_520587 ) ( not ( = ?auto_520586 ?auto_520588 ) ) ( not ( = ?auto_520587 ?auto_520588 ) ) ( not ( = ?auto_520585 ?auto_520588 ) ) ( TRUCK-AT ?auto_520593 ?auto_520590 ) ( SURFACE-AT ?auto_520585 ?auto_520590 ) ( CLEAR ?auto_520585 ) ( IS-CRATE ?auto_520586 ) ( AVAILABLE ?auto_520591 ) ( IN ?auto_520586 ?auto_520593 ) ( ON ?auto_520582 ?auto_520581 ) ( ON ?auto_520583 ?auto_520582 ) ( ON ?auto_520584 ?auto_520583 ) ( ON ?auto_520585 ?auto_520584 ) ( not ( = ?auto_520581 ?auto_520582 ) ) ( not ( = ?auto_520581 ?auto_520583 ) ) ( not ( = ?auto_520581 ?auto_520584 ) ) ( not ( = ?auto_520581 ?auto_520585 ) ) ( not ( = ?auto_520581 ?auto_520586 ) ) ( not ( = ?auto_520581 ?auto_520587 ) ) ( not ( = ?auto_520581 ?auto_520588 ) ) ( not ( = ?auto_520582 ?auto_520583 ) ) ( not ( = ?auto_520582 ?auto_520584 ) ) ( not ( = ?auto_520582 ?auto_520585 ) ) ( not ( = ?auto_520582 ?auto_520586 ) ) ( not ( = ?auto_520582 ?auto_520587 ) ) ( not ( = ?auto_520582 ?auto_520588 ) ) ( not ( = ?auto_520583 ?auto_520584 ) ) ( not ( = ?auto_520583 ?auto_520585 ) ) ( not ( = ?auto_520583 ?auto_520586 ) ) ( not ( = ?auto_520583 ?auto_520587 ) ) ( not ( = ?auto_520583 ?auto_520588 ) ) ( not ( = ?auto_520584 ?auto_520585 ) ) ( not ( = ?auto_520584 ?auto_520586 ) ) ( not ( = ?auto_520584 ?auto_520587 ) ) ( not ( = ?auto_520584 ?auto_520588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_520585 ?auto_520586 ?auto_520587 )
      ( MAKE-6CRATE-VERIFY ?auto_520581 ?auto_520582 ?auto_520583 ?auto_520584 ?auto_520585 ?auto_520586 ?auto_520587 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522537 - SURFACE
      ?auto_522538 - SURFACE
      ?auto_522539 - SURFACE
      ?auto_522540 - SURFACE
      ?auto_522541 - SURFACE
      ?auto_522542 - SURFACE
      ?auto_522543 - SURFACE
      ?auto_522544 - SURFACE
    )
    :vars
    (
      ?auto_522545 - HOIST
      ?auto_522546 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_522545 ?auto_522546 ) ( SURFACE-AT ?auto_522543 ?auto_522546 ) ( CLEAR ?auto_522543 ) ( LIFTING ?auto_522545 ?auto_522544 ) ( IS-CRATE ?auto_522544 ) ( not ( = ?auto_522543 ?auto_522544 ) ) ( ON ?auto_522538 ?auto_522537 ) ( ON ?auto_522539 ?auto_522538 ) ( ON ?auto_522540 ?auto_522539 ) ( ON ?auto_522541 ?auto_522540 ) ( ON ?auto_522542 ?auto_522541 ) ( ON ?auto_522543 ?auto_522542 ) ( not ( = ?auto_522537 ?auto_522538 ) ) ( not ( = ?auto_522537 ?auto_522539 ) ) ( not ( = ?auto_522537 ?auto_522540 ) ) ( not ( = ?auto_522537 ?auto_522541 ) ) ( not ( = ?auto_522537 ?auto_522542 ) ) ( not ( = ?auto_522537 ?auto_522543 ) ) ( not ( = ?auto_522537 ?auto_522544 ) ) ( not ( = ?auto_522538 ?auto_522539 ) ) ( not ( = ?auto_522538 ?auto_522540 ) ) ( not ( = ?auto_522538 ?auto_522541 ) ) ( not ( = ?auto_522538 ?auto_522542 ) ) ( not ( = ?auto_522538 ?auto_522543 ) ) ( not ( = ?auto_522538 ?auto_522544 ) ) ( not ( = ?auto_522539 ?auto_522540 ) ) ( not ( = ?auto_522539 ?auto_522541 ) ) ( not ( = ?auto_522539 ?auto_522542 ) ) ( not ( = ?auto_522539 ?auto_522543 ) ) ( not ( = ?auto_522539 ?auto_522544 ) ) ( not ( = ?auto_522540 ?auto_522541 ) ) ( not ( = ?auto_522540 ?auto_522542 ) ) ( not ( = ?auto_522540 ?auto_522543 ) ) ( not ( = ?auto_522540 ?auto_522544 ) ) ( not ( = ?auto_522541 ?auto_522542 ) ) ( not ( = ?auto_522541 ?auto_522543 ) ) ( not ( = ?auto_522541 ?auto_522544 ) ) ( not ( = ?auto_522542 ?auto_522543 ) ) ( not ( = ?auto_522542 ?auto_522544 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_522543 ?auto_522544 )
      ( MAKE-7CRATE-VERIFY ?auto_522537 ?auto_522538 ?auto_522539 ?auto_522540 ?auto_522541 ?auto_522542 ?auto_522543 ?auto_522544 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522592 - SURFACE
      ?auto_522593 - SURFACE
      ?auto_522594 - SURFACE
      ?auto_522595 - SURFACE
      ?auto_522596 - SURFACE
      ?auto_522597 - SURFACE
      ?auto_522598 - SURFACE
      ?auto_522599 - SURFACE
    )
    :vars
    (
      ?auto_522602 - HOIST
      ?auto_522600 - PLACE
      ?auto_522601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_522602 ?auto_522600 ) ( SURFACE-AT ?auto_522598 ?auto_522600 ) ( CLEAR ?auto_522598 ) ( IS-CRATE ?auto_522599 ) ( not ( = ?auto_522598 ?auto_522599 ) ) ( TRUCK-AT ?auto_522601 ?auto_522600 ) ( AVAILABLE ?auto_522602 ) ( IN ?auto_522599 ?auto_522601 ) ( ON ?auto_522598 ?auto_522597 ) ( not ( = ?auto_522597 ?auto_522598 ) ) ( not ( = ?auto_522597 ?auto_522599 ) ) ( ON ?auto_522593 ?auto_522592 ) ( ON ?auto_522594 ?auto_522593 ) ( ON ?auto_522595 ?auto_522594 ) ( ON ?auto_522596 ?auto_522595 ) ( ON ?auto_522597 ?auto_522596 ) ( not ( = ?auto_522592 ?auto_522593 ) ) ( not ( = ?auto_522592 ?auto_522594 ) ) ( not ( = ?auto_522592 ?auto_522595 ) ) ( not ( = ?auto_522592 ?auto_522596 ) ) ( not ( = ?auto_522592 ?auto_522597 ) ) ( not ( = ?auto_522592 ?auto_522598 ) ) ( not ( = ?auto_522592 ?auto_522599 ) ) ( not ( = ?auto_522593 ?auto_522594 ) ) ( not ( = ?auto_522593 ?auto_522595 ) ) ( not ( = ?auto_522593 ?auto_522596 ) ) ( not ( = ?auto_522593 ?auto_522597 ) ) ( not ( = ?auto_522593 ?auto_522598 ) ) ( not ( = ?auto_522593 ?auto_522599 ) ) ( not ( = ?auto_522594 ?auto_522595 ) ) ( not ( = ?auto_522594 ?auto_522596 ) ) ( not ( = ?auto_522594 ?auto_522597 ) ) ( not ( = ?auto_522594 ?auto_522598 ) ) ( not ( = ?auto_522594 ?auto_522599 ) ) ( not ( = ?auto_522595 ?auto_522596 ) ) ( not ( = ?auto_522595 ?auto_522597 ) ) ( not ( = ?auto_522595 ?auto_522598 ) ) ( not ( = ?auto_522595 ?auto_522599 ) ) ( not ( = ?auto_522596 ?auto_522597 ) ) ( not ( = ?auto_522596 ?auto_522598 ) ) ( not ( = ?auto_522596 ?auto_522599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_522597 ?auto_522598 ?auto_522599 )
      ( MAKE-7CRATE-VERIFY ?auto_522592 ?auto_522593 ?auto_522594 ?auto_522595 ?auto_522596 ?auto_522597 ?auto_522598 ?auto_522599 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522655 - SURFACE
      ?auto_522656 - SURFACE
      ?auto_522657 - SURFACE
      ?auto_522658 - SURFACE
      ?auto_522659 - SURFACE
      ?auto_522660 - SURFACE
      ?auto_522661 - SURFACE
      ?auto_522662 - SURFACE
    )
    :vars
    (
      ?auto_522664 - HOIST
      ?auto_522663 - PLACE
      ?auto_522666 - TRUCK
      ?auto_522665 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_522664 ?auto_522663 ) ( SURFACE-AT ?auto_522661 ?auto_522663 ) ( CLEAR ?auto_522661 ) ( IS-CRATE ?auto_522662 ) ( not ( = ?auto_522661 ?auto_522662 ) ) ( AVAILABLE ?auto_522664 ) ( IN ?auto_522662 ?auto_522666 ) ( ON ?auto_522661 ?auto_522660 ) ( not ( = ?auto_522660 ?auto_522661 ) ) ( not ( = ?auto_522660 ?auto_522662 ) ) ( TRUCK-AT ?auto_522666 ?auto_522665 ) ( not ( = ?auto_522665 ?auto_522663 ) ) ( ON ?auto_522656 ?auto_522655 ) ( ON ?auto_522657 ?auto_522656 ) ( ON ?auto_522658 ?auto_522657 ) ( ON ?auto_522659 ?auto_522658 ) ( ON ?auto_522660 ?auto_522659 ) ( not ( = ?auto_522655 ?auto_522656 ) ) ( not ( = ?auto_522655 ?auto_522657 ) ) ( not ( = ?auto_522655 ?auto_522658 ) ) ( not ( = ?auto_522655 ?auto_522659 ) ) ( not ( = ?auto_522655 ?auto_522660 ) ) ( not ( = ?auto_522655 ?auto_522661 ) ) ( not ( = ?auto_522655 ?auto_522662 ) ) ( not ( = ?auto_522656 ?auto_522657 ) ) ( not ( = ?auto_522656 ?auto_522658 ) ) ( not ( = ?auto_522656 ?auto_522659 ) ) ( not ( = ?auto_522656 ?auto_522660 ) ) ( not ( = ?auto_522656 ?auto_522661 ) ) ( not ( = ?auto_522656 ?auto_522662 ) ) ( not ( = ?auto_522657 ?auto_522658 ) ) ( not ( = ?auto_522657 ?auto_522659 ) ) ( not ( = ?auto_522657 ?auto_522660 ) ) ( not ( = ?auto_522657 ?auto_522661 ) ) ( not ( = ?auto_522657 ?auto_522662 ) ) ( not ( = ?auto_522658 ?auto_522659 ) ) ( not ( = ?auto_522658 ?auto_522660 ) ) ( not ( = ?auto_522658 ?auto_522661 ) ) ( not ( = ?auto_522658 ?auto_522662 ) ) ( not ( = ?auto_522659 ?auto_522660 ) ) ( not ( = ?auto_522659 ?auto_522661 ) ) ( not ( = ?auto_522659 ?auto_522662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_522660 ?auto_522661 ?auto_522662 )
      ( MAKE-7CRATE-VERIFY ?auto_522655 ?auto_522656 ?auto_522657 ?auto_522658 ?auto_522659 ?auto_522660 ?auto_522661 ?auto_522662 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522725 - SURFACE
      ?auto_522726 - SURFACE
      ?auto_522727 - SURFACE
      ?auto_522728 - SURFACE
      ?auto_522729 - SURFACE
      ?auto_522730 - SURFACE
      ?auto_522731 - SURFACE
      ?auto_522732 - SURFACE
    )
    :vars
    (
      ?auto_522737 - HOIST
      ?auto_522734 - PLACE
      ?auto_522735 - TRUCK
      ?auto_522733 - PLACE
      ?auto_522736 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_522737 ?auto_522734 ) ( SURFACE-AT ?auto_522731 ?auto_522734 ) ( CLEAR ?auto_522731 ) ( IS-CRATE ?auto_522732 ) ( not ( = ?auto_522731 ?auto_522732 ) ) ( AVAILABLE ?auto_522737 ) ( ON ?auto_522731 ?auto_522730 ) ( not ( = ?auto_522730 ?auto_522731 ) ) ( not ( = ?auto_522730 ?auto_522732 ) ) ( TRUCK-AT ?auto_522735 ?auto_522733 ) ( not ( = ?auto_522733 ?auto_522734 ) ) ( HOIST-AT ?auto_522736 ?auto_522733 ) ( LIFTING ?auto_522736 ?auto_522732 ) ( not ( = ?auto_522737 ?auto_522736 ) ) ( ON ?auto_522726 ?auto_522725 ) ( ON ?auto_522727 ?auto_522726 ) ( ON ?auto_522728 ?auto_522727 ) ( ON ?auto_522729 ?auto_522728 ) ( ON ?auto_522730 ?auto_522729 ) ( not ( = ?auto_522725 ?auto_522726 ) ) ( not ( = ?auto_522725 ?auto_522727 ) ) ( not ( = ?auto_522725 ?auto_522728 ) ) ( not ( = ?auto_522725 ?auto_522729 ) ) ( not ( = ?auto_522725 ?auto_522730 ) ) ( not ( = ?auto_522725 ?auto_522731 ) ) ( not ( = ?auto_522725 ?auto_522732 ) ) ( not ( = ?auto_522726 ?auto_522727 ) ) ( not ( = ?auto_522726 ?auto_522728 ) ) ( not ( = ?auto_522726 ?auto_522729 ) ) ( not ( = ?auto_522726 ?auto_522730 ) ) ( not ( = ?auto_522726 ?auto_522731 ) ) ( not ( = ?auto_522726 ?auto_522732 ) ) ( not ( = ?auto_522727 ?auto_522728 ) ) ( not ( = ?auto_522727 ?auto_522729 ) ) ( not ( = ?auto_522727 ?auto_522730 ) ) ( not ( = ?auto_522727 ?auto_522731 ) ) ( not ( = ?auto_522727 ?auto_522732 ) ) ( not ( = ?auto_522728 ?auto_522729 ) ) ( not ( = ?auto_522728 ?auto_522730 ) ) ( not ( = ?auto_522728 ?auto_522731 ) ) ( not ( = ?auto_522728 ?auto_522732 ) ) ( not ( = ?auto_522729 ?auto_522730 ) ) ( not ( = ?auto_522729 ?auto_522731 ) ) ( not ( = ?auto_522729 ?auto_522732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_522730 ?auto_522731 ?auto_522732 )
      ( MAKE-7CRATE-VERIFY ?auto_522725 ?auto_522726 ?auto_522727 ?auto_522728 ?auto_522729 ?auto_522730 ?auto_522731 ?auto_522732 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522802 - SURFACE
      ?auto_522803 - SURFACE
      ?auto_522804 - SURFACE
      ?auto_522805 - SURFACE
      ?auto_522806 - SURFACE
      ?auto_522807 - SURFACE
      ?auto_522808 - SURFACE
      ?auto_522809 - SURFACE
    )
    :vars
    (
      ?auto_522810 - HOIST
      ?auto_522814 - PLACE
      ?auto_522813 - TRUCK
      ?auto_522812 - PLACE
      ?auto_522811 - HOIST
      ?auto_522815 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_522810 ?auto_522814 ) ( SURFACE-AT ?auto_522808 ?auto_522814 ) ( CLEAR ?auto_522808 ) ( IS-CRATE ?auto_522809 ) ( not ( = ?auto_522808 ?auto_522809 ) ) ( AVAILABLE ?auto_522810 ) ( ON ?auto_522808 ?auto_522807 ) ( not ( = ?auto_522807 ?auto_522808 ) ) ( not ( = ?auto_522807 ?auto_522809 ) ) ( TRUCK-AT ?auto_522813 ?auto_522812 ) ( not ( = ?auto_522812 ?auto_522814 ) ) ( HOIST-AT ?auto_522811 ?auto_522812 ) ( not ( = ?auto_522810 ?auto_522811 ) ) ( AVAILABLE ?auto_522811 ) ( SURFACE-AT ?auto_522809 ?auto_522812 ) ( ON ?auto_522809 ?auto_522815 ) ( CLEAR ?auto_522809 ) ( not ( = ?auto_522808 ?auto_522815 ) ) ( not ( = ?auto_522809 ?auto_522815 ) ) ( not ( = ?auto_522807 ?auto_522815 ) ) ( ON ?auto_522803 ?auto_522802 ) ( ON ?auto_522804 ?auto_522803 ) ( ON ?auto_522805 ?auto_522804 ) ( ON ?auto_522806 ?auto_522805 ) ( ON ?auto_522807 ?auto_522806 ) ( not ( = ?auto_522802 ?auto_522803 ) ) ( not ( = ?auto_522802 ?auto_522804 ) ) ( not ( = ?auto_522802 ?auto_522805 ) ) ( not ( = ?auto_522802 ?auto_522806 ) ) ( not ( = ?auto_522802 ?auto_522807 ) ) ( not ( = ?auto_522802 ?auto_522808 ) ) ( not ( = ?auto_522802 ?auto_522809 ) ) ( not ( = ?auto_522802 ?auto_522815 ) ) ( not ( = ?auto_522803 ?auto_522804 ) ) ( not ( = ?auto_522803 ?auto_522805 ) ) ( not ( = ?auto_522803 ?auto_522806 ) ) ( not ( = ?auto_522803 ?auto_522807 ) ) ( not ( = ?auto_522803 ?auto_522808 ) ) ( not ( = ?auto_522803 ?auto_522809 ) ) ( not ( = ?auto_522803 ?auto_522815 ) ) ( not ( = ?auto_522804 ?auto_522805 ) ) ( not ( = ?auto_522804 ?auto_522806 ) ) ( not ( = ?auto_522804 ?auto_522807 ) ) ( not ( = ?auto_522804 ?auto_522808 ) ) ( not ( = ?auto_522804 ?auto_522809 ) ) ( not ( = ?auto_522804 ?auto_522815 ) ) ( not ( = ?auto_522805 ?auto_522806 ) ) ( not ( = ?auto_522805 ?auto_522807 ) ) ( not ( = ?auto_522805 ?auto_522808 ) ) ( not ( = ?auto_522805 ?auto_522809 ) ) ( not ( = ?auto_522805 ?auto_522815 ) ) ( not ( = ?auto_522806 ?auto_522807 ) ) ( not ( = ?auto_522806 ?auto_522808 ) ) ( not ( = ?auto_522806 ?auto_522809 ) ) ( not ( = ?auto_522806 ?auto_522815 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_522807 ?auto_522808 ?auto_522809 )
      ( MAKE-7CRATE-VERIFY ?auto_522802 ?auto_522803 ?auto_522804 ?auto_522805 ?auto_522806 ?auto_522807 ?auto_522808 ?auto_522809 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522880 - SURFACE
      ?auto_522881 - SURFACE
      ?auto_522882 - SURFACE
      ?auto_522883 - SURFACE
      ?auto_522884 - SURFACE
      ?auto_522885 - SURFACE
      ?auto_522886 - SURFACE
      ?auto_522887 - SURFACE
    )
    :vars
    (
      ?auto_522888 - HOIST
      ?auto_522893 - PLACE
      ?auto_522891 - PLACE
      ?auto_522892 - HOIST
      ?auto_522889 - SURFACE
      ?auto_522890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_522888 ?auto_522893 ) ( SURFACE-AT ?auto_522886 ?auto_522893 ) ( CLEAR ?auto_522886 ) ( IS-CRATE ?auto_522887 ) ( not ( = ?auto_522886 ?auto_522887 ) ) ( AVAILABLE ?auto_522888 ) ( ON ?auto_522886 ?auto_522885 ) ( not ( = ?auto_522885 ?auto_522886 ) ) ( not ( = ?auto_522885 ?auto_522887 ) ) ( not ( = ?auto_522891 ?auto_522893 ) ) ( HOIST-AT ?auto_522892 ?auto_522891 ) ( not ( = ?auto_522888 ?auto_522892 ) ) ( AVAILABLE ?auto_522892 ) ( SURFACE-AT ?auto_522887 ?auto_522891 ) ( ON ?auto_522887 ?auto_522889 ) ( CLEAR ?auto_522887 ) ( not ( = ?auto_522886 ?auto_522889 ) ) ( not ( = ?auto_522887 ?auto_522889 ) ) ( not ( = ?auto_522885 ?auto_522889 ) ) ( TRUCK-AT ?auto_522890 ?auto_522893 ) ( ON ?auto_522881 ?auto_522880 ) ( ON ?auto_522882 ?auto_522881 ) ( ON ?auto_522883 ?auto_522882 ) ( ON ?auto_522884 ?auto_522883 ) ( ON ?auto_522885 ?auto_522884 ) ( not ( = ?auto_522880 ?auto_522881 ) ) ( not ( = ?auto_522880 ?auto_522882 ) ) ( not ( = ?auto_522880 ?auto_522883 ) ) ( not ( = ?auto_522880 ?auto_522884 ) ) ( not ( = ?auto_522880 ?auto_522885 ) ) ( not ( = ?auto_522880 ?auto_522886 ) ) ( not ( = ?auto_522880 ?auto_522887 ) ) ( not ( = ?auto_522880 ?auto_522889 ) ) ( not ( = ?auto_522881 ?auto_522882 ) ) ( not ( = ?auto_522881 ?auto_522883 ) ) ( not ( = ?auto_522881 ?auto_522884 ) ) ( not ( = ?auto_522881 ?auto_522885 ) ) ( not ( = ?auto_522881 ?auto_522886 ) ) ( not ( = ?auto_522881 ?auto_522887 ) ) ( not ( = ?auto_522881 ?auto_522889 ) ) ( not ( = ?auto_522882 ?auto_522883 ) ) ( not ( = ?auto_522882 ?auto_522884 ) ) ( not ( = ?auto_522882 ?auto_522885 ) ) ( not ( = ?auto_522882 ?auto_522886 ) ) ( not ( = ?auto_522882 ?auto_522887 ) ) ( not ( = ?auto_522882 ?auto_522889 ) ) ( not ( = ?auto_522883 ?auto_522884 ) ) ( not ( = ?auto_522883 ?auto_522885 ) ) ( not ( = ?auto_522883 ?auto_522886 ) ) ( not ( = ?auto_522883 ?auto_522887 ) ) ( not ( = ?auto_522883 ?auto_522889 ) ) ( not ( = ?auto_522884 ?auto_522885 ) ) ( not ( = ?auto_522884 ?auto_522886 ) ) ( not ( = ?auto_522884 ?auto_522887 ) ) ( not ( = ?auto_522884 ?auto_522889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_522885 ?auto_522886 ?auto_522887 )
      ( MAKE-7CRATE-VERIFY ?auto_522880 ?auto_522881 ?auto_522882 ?auto_522883 ?auto_522884 ?auto_522885 ?auto_522886 ?auto_522887 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_522958 - SURFACE
      ?auto_522959 - SURFACE
      ?auto_522960 - SURFACE
      ?auto_522961 - SURFACE
      ?auto_522962 - SURFACE
      ?auto_522963 - SURFACE
      ?auto_522964 - SURFACE
      ?auto_522965 - SURFACE
    )
    :vars
    (
      ?auto_522969 - HOIST
      ?auto_522966 - PLACE
      ?auto_522968 - PLACE
      ?auto_522967 - HOIST
      ?auto_522970 - SURFACE
      ?auto_522971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_522969 ?auto_522966 ) ( IS-CRATE ?auto_522965 ) ( not ( = ?auto_522964 ?auto_522965 ) ) ( not ( = ?auto_522963 ?auto_522964 ) ) ( not ( = ?auto_522963 ?auto_522965 ) ) ( not ( = ?auto_522968 ?auto_522966 ) ) ( HOIST-AT ?auto_522967 ?auto_522968 ) ( not ( = ?auto_522969 ?auto_522967 ) ) ( AVAILABLE ?auto_522967 ) ( SURFACE-AT ?auto_522965 ?auto_522968 ) ( ON ?auto_522965 ?auto_522970 ) ( CLEAR ?auto_522965 ) ( not ( = ?auto_522964 ?auto_522970 ) ) ( not ( = ?auto_522965 ?auto_522970 ) ) ( not ( = ?auto_522963 ?auto_522970 ) ) ( TRUCK-AT ?auto_522971 ?auto_522966 ) ( SURFACE-AT ?auto_522963 ?auto_522966 ) ( CLEAR ?auto_522963 ) ( LIFTING ?auto_522969 ?auto_522964 ) ( IS-CRATE ?auto_522964 ) ( ON ?auto_522959 ?auto_522958 ) ( ON ?auto_522960 ?auto_522959 ) ( ON ?auto_522961 ?auto_522960 ) ( ON ?auto_522962 ?auto_522961 ) ( ON ?auto_522963 ?auto_522962 ) ( not ( = ?auto_522958 ?auto_522959 ) ) ( not ( = ?auto_522958 ?auto_522960 ) ) ( not ( = ?auto_522958 ?auto_522961 ) ) ( not ( = ?auto_522958 ?auto_522962 ) ) ( not ( = ?auto_522958 ?auto_522963 ) ) ( not ( = ?auto_522958 ?auto_522964 ) ) ( not ( = ?auto_522958 ?auto_522965 ) ) ( not ( = ?auto_522958 ?auto_522970 ) ) ( not ( = ?auto_522959 ?auto_522960 ) ) ( not ( = ?auto_522959 ?auto_522961 ) ) ( not ( = ?auto_522959 ?auto_522962 ) ) ( not ( = ?auto_522959 ?auto_522963 ) ) ( not ( = ?auto_522959 ?auto_522964 ) ) ( not ( = ?auto_522959 ?auto_522965 ) ) ( not ( = ?auto_522959 ?auto_522970 ) ) ( not ( = ?auto_522960 ?auto_522961 ) ) ( not ( = ?auto_522960 ?auto_522962 ) ) ( not ( = ?auto_522960 ?auto_522963 ) ) ( not ( = ?auto_522960 ?auto_522964 ) ) ( not ( = ?auto_522960 ?auto_522965 ) ) ( not ( = ?auto_522960 ?auto_522970 ) ) ( not ( = ?auto_522961 ?auto_522962 ) ) ( not ( = ?auto_522961 ?auto_522963 ) ) ( not ( = ?auto_522961 ?auto_522964 ) ) ( not ( = ?auto_522961 ?auto_522965 ) ) ( not ( = ?auto_522961 ?auto_522970 ) ) ( not ( = ?auto_522962 ?auto_522963 ) ) ( not ( = ?auto_522962 ?auto_522964 ) ) ( not ( = ?auto_522962 ?auto_522965 ) ) ( not ( = ?auto_522962 ?auto_522970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_522963 ?auto_522964 ?auto_522965 )
      ( MAKE-7CRATE-VERIFY ?auto_522958 ?auto_522959 ?auto_522960 ?auto_522961 ?auto_522962 ?auto_522963 ?auto_522964 ?auto_522965 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_523036 - SURFACE
      ?auto_523037 - SURFACE
      ?auto_523038 - SURFACE
      ?auto_523039 - SURFACE
      ?auto_523040 - SURFACE
      ?auto_523041 - SURFACE
      ?auto_523042 - SURFACE
      ?auto_523043 - SURFACE
    )
    :vars
    (
      ?auto_523044 - HOIST
      ?auto_523047 - PLACE
      ?auto_523049 - PLACE
      ?auto_523048 - HOIST
      ?auto_523045 - SURFACE
      ?auto_523046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_523044 ?auto_523047 ) ( IS-CRATE ?auto_523043 ) ( not ( = ?auto_523042 ?auto_523043 ) ) ( not ( = ?auto_523041 ?auto_523042 ) ) ( not ( = ?auto_523041 ?auto_523043 ) ) ( not ( = ?auto_523049 ?auto_523047 ) ) ( HOIST-AT ?auto_523048 ?auto_523049 ) ( not ( = ?auto_523044 ?auto_523048 ) ) ( AVAILABLE ?auto_523048 ) ( SURFACE-AT ?auto_523043 ?auto_523049 ) ( ON ?auto_523043 ?auto_523045 ) ( CLEAR ?auto_523043 ) ( not ( = ?auto_523042 ?auto_523045 ) ) ( not ( = ?auto_523043 ?auto_523045 ) ) ( not ( = ?auto_523041 ?auto_523045 ) ) ( TRUCK-AT ?auto_523046 ?auto_523047 ) ( SURFACE-AT ?auto_523041 ?auto_523047 ) ( CLEAR ?auto_523041 ) ( IS-CRATE ?auto_523042 ) ( AVAILABLE ?auto_523044 ) ( IN ?auto_523042 ?auto_523046 ) ( ON ?auto_523037 ?auto_523036 ) ( ON ?auto_523038 ?auto_523037 ) ( ON ?auto_523039 ?auto_523038 ) ( ON ?auto_523040 ?auto_523039 ) ( ON ?auto_523041 ?auto_523040 ) ( not ( = ?auto_523036 ?auto_523037 ) ) ( not ( = ?auto_523036 ?auto_523038 ) ) ( not ( = ?auto_523036 ?auto_523039 ) ) ( not ( = ?auto_523036 ?auto_523040 ) ) ( not ( = ?auto_523036 ?auto_523041 ) ) ( not ( = ?auto_523036 ?auto_523042 ) ) ( not ( = ?auto_523036 ?auto_523043 ) ) ( not ( = ?auto_523036 ?auto_523045 ) ) ( not ( = ?auto_523037 ?auto_523038 ) ) ( not ( = ?auto_523037 ?auto_523039 ) ) ( not ( = ?auto_523037 ?auto_523040 ) ) ( not ( = ?auto_523037 ?auto_523041 ) ) ( not ( = ?auto_523037 ?auto_523042 ) ) ( not ( = ?auto_523037 ?auto_523043 ) ) ( not ( = ?auto_523037 ?auto_523045 ) ) ( not ( = ?auto_523038 ?auto_523039 ) ) ( not ( = ?auto_523038 ?auto_523040 ) ) ( not ( = ?auto_523038 ?auto_523041 ) ) ( not ( = ?auto_523038 ?auto_523042 ) ) ( not ( = ?auto_523038 ?auto_523043 ) ) ( not ( = ?auto_523038 ?auto_523045 ) ) ( not ( = ?auto_523039 ?auto_523040 ) ) ( not ( = ?auto_523039 ?auto_523041 ) ) ( not ( = ?auto_523039 ?auto_523042 ) ) ( not ( = ?auto_523039 ?auto_523043 ) ) ( not ( = ?auto_523039 ?auto_523045 ) ) ( not ( = ?auto_523040 ?auto_523041 ) ) ( not ( = ?auto_523040 ?auto_523042 ) ) ( not ( = ?auto_523040 ?auto_523043 ) ) ( not ( = ?auto_523040 ?auto_523045 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_523041 ?auto_523042 ?auto_523043 )
      ( MAKE-7CRATE-VERIFY ?auto_523036 ?auto_523037 ?auto_523038 ?auto_523039 ?auto_523040 ?auto_523041 ?auto_523042 ?auto_523043 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_525955 - SURFACE
      ?auto_525956 - SURFACE
      ?auto_525957 - SURFACE
      ?auto_525958 - SURFACE
      ?auto_525959 - SURFACE
      ?auto_525960 - SURFACE
      ?auto_525961 - SURFACE
      ?auto_525962 - SURFACE
      ?auto_525963 - SURFACE
    )
    :vars
    (
      ?auto_525965 - HOIST
      ?auto_525964 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_525965 ?auto_525964 ) ( SURFACE-AT ?auto_525962 ?auto_525964 ) ( CLEAR ?auto_525962 ) ( LIFTING ?auto_525965 ?auto_525963 ) ( IS-CRATE ?auto_525963 ) ( not ( = ?auto_525962 ?auto_525963 ) ) ( ON ?auto_525956 ?auto_525955 ) ( ON ?auto_525957 ?auto_525956 ) ( ON ?auto_525958 ?auto_525957 ) ( ON ?auto_525959 ?auto_525958 ) ( ON ?auto_525960 ?auto_525959 ) ( ON ?auto_525961 ?auto_525960 ) ( ON ?auto_525962 ?auto_525961 ) ( not ( = ?auto_525955 ?auto_525956 ) ) ( not ( = ?auto_525955 ?auto_525957 ) ) ( not ( = ?auto_525955 ?auto_525958 ) ) ( not ( = ?auto_525955 ?auto_525959 ) ) ( not ( = ?auto_525955 ?auto_525960 ) ) ( not ( = ?auto_525955 ?auto_525961 ) ) ( not ( = ?auto_525955 ?auto_525962 ) ) ( not ( = ?auto_525955 ?auto_525963 ) ) ( not ( = ?auto_525956 ?auto_525957 ) ) ( not ( = ?auto_525956 ?auto_525958 ) ) ( not ( = ?auto_525956 ?auto_525959 ) ) ( not ( = ?auto_525956 ?auto_525960 ) ) ( not ( = ?auto_525956 ?auto_525961 ) ) ( not ( = ?auto_525956 ?auto_525962 ) ) ( not ( = ?auto_525956 ?auto_525963 ) ) ( not ( = ?auto_525957 ?auto_525958 ) ) ( not ( = ?auto_525957 ?auto_525959 ) ) ( not ( = ?auto_525957 ?auto_525960 ) ) ( not ( = ?auto_525957 ?auto_525961 ) ) ( not ( = ?auto_525957 ?auto_525962 ) ) ( not ( = ?auto_525957 ?auto_525963 ) ) ( not ( = ?auto_525958 ?auto_525959 ) ) ( not ( = ?auto_525958 ?auto_525960 ) ) ( not ( = ?auto_525958 ?auto_525961 ) ) ( not ( = ?auto_525958 ?auto_525962 ) ) ( not ( = ?auto_525958 ?auto_525963 ) ) ( not ( = ?auto_525959 ?auto_525960 ) ) ( not ( = ?auto_525959 ?auto_525961 ) ) ( not ( = ?auto_525959 ?auto_525962 ) ) ( not ( = ?auto_525959 ?auto_525963 ) ) ( not ( = ?auto_525960 ?auto_525961 ) ) ( not ( = ?auto_525960 ?auto_525962 ) ) ( not ( = ?auto_525960 ?auto_525963 ) ) ( not ( = ?auto_525961 ?auto_525962 ) ) ( not ( = ?auto_525961 ?auto_525963 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_525962 ?auto_525963 )
      ( MAKE-8CRATE-VERIFY ?auto_525955 ?auto_525956 ?auto_525957 ?auto_525958 ?auto_525959 ?auto_525960 ?auto_525961 ?auto_525962 ?auto_525963 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_526022 - SURFACE
      ?auto_526023 - SURFACE
      ?auto_526024 - SURFACE
      ?auto_526025 - SURFACE
      ?auto_526026 - SURFACE
      ?auto_526027 - SURFACE
      ?auto_526028 - SURFACE
      ?auto_526029 - SURFACE
      ?auto_526030 - SURFACE
    )
    :vars
    (
      ?auto_526031 - HOIST
      ?auto_526032 - PLACE
      ?auto_526033 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_526031 ?auto_526032 ) ( SURFACE-AT ?auto_526029 ?auto_526032 ) ( CLEAR ?auto_526029 ) ( IS-CRATE ?auto_526030 ) ( not ( = ?auto_526029 ?auto_526030 ) ) ( TRUCK-AT ?auto_526033 ?auto_526032 ) ( AVAILABLE ?auto_526031 ) ( IN ?auto_526030 ?auto_526033 ) ( ON ?auto_526029 ?auto_526028 ) ( not ( = ?auto_526028 ?auto_526029 ) ) ( not ( = ?auto_526028 ?auto_526030 ) ) ( ON ?auto_526023 ?auto_526022 ) ( ON ?auto_526024 ?auto_526023 ) ( ON ?auto_526025 ?auto_526024 ) ( ON ?auto_526026 ?auto_526025 ) ( ON ?auto_526027 ?auto_526026 ) ( ON ?auto_526028 ?auto_526027 ) ( not ( = ?auto_526022 ?auto_526023 ) ) ( not ( = ?auto_526022 ?auto_526024 ) ) ( not ( = ?auto_526022 ?auto_526025 ) ) ( not ( = ?auto_526022 ?auto_526026 ) ) ( not ( = ?auto_526022 ?auto_526027 ) ) ( not ( = ?auto_526022 ?auto_526028 ) ) ( not ( = ?auto_526022 ?auto_526029 ) ) ( not ( = ?auto_526022 ?auto_526030 ) ) ( not ( = ?auto_526023 ?auto_526024 ) ) ( not ( = ?auto_526023 ?auto_526025 ) ) ( not ( = ?auto_526023 ?auto_526026 ) ) ( not ( = ?auto_526023 ?auto_526027 ) ) ( not ( = ?auto_526023 ?auto_526028 ) ) ( not ( = ?auto_526023 ?auto_526029 ) ) ( not ( = ?auto_526023 ?auto_526030 ) ) ( not ( = ?auto_526024 ?auto_526025 ) ) ( not ( = ?auto_526024 ?auto_526026 ) ) ( not ( = ?auto_526024 ?auto_526027 ) ) ( not ( = ?auto_526024 ?auto_526028 ) ) ( not ( = ?auto_526024 ?auto_526029 ) ) ( not ( = ?auto_526024 ?auto_526030 ) ) ( not ( = ?auto_526025 ?auto_526026 ) ) ( not ( = ?auto_526025 ?auto_526027 ) ) ( not ( = ?auto_526025 ?auto_526028 ) ) ( not ( = ?auto_526025 ?auto_526029 ) ) ( not ( = ?auto_526025 ?auto_526030 ) ) ( not ( = ?auto_526026 ?auto_526027 ) ) ( not ( = ?auto_526026 ?auto_526028 ) ) ( not ( = ?auto_526026 ?auto_526029 ) ) ( not ( = ?auto_526026 ?auto_526030 ) ) ( not ( = ?auto_526027 ?auto_526028 ) ) ( not ( = ?auto_526027 ?auto_526029 ) ) ( not ( = ?auto_526027 ?auto_526030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_526028 ?auto_526029 ?auto_526030 )
      ( MAKE-8CRATE-VERIFY ?auto_526022 ?auto_526023 ?auto_526024 ?auto_526025 ?auto_526026 ?auto_526027 ?auto_526028 ?auto_526029 ?auto_526030 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_526098 - SURFACE
      ?auto_526099 - SURFACE
      ?auto_526100 - SURFACE
      ?auto_526101 - SURFACE
      ?auto_526102 - SURFACE
      ?auto_526103 - SURFACE
      ?auto_526104 - SURFACE
      ?auto_526105 - SURFACE
      ?auto_526106 - SURFACE
    )
    :vars
    (
      ?auto_526109 - HOIST
      ?auto_526108 - PLACE
      ?auto_526107 - TRUCK
      ?auto_526110 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_526109 ?auto_526108 ) ( SURFACE-AT ?auto_526105 ?auto_526108 ) ( CLEAR ?auto_526105 ) ( IS-CRATE ?auto_526106 ) ( not ( = ?auto_526105 ?auto_526106 ) ) ( AVAILABLE ?auto_526109 ) ( IN ?auto_526106 ?auto_526107 ) ( ON ?auto_526105 ?auto_526104 ) ( not ( = ?auto_526104 ?auto_526105 ) ) ( not ( = ?auto_526104 ?auto_526106 ) ) ( TRUCK-AT ?auto_526107 ?auto_526110 ) ( not ( = ?auto_526110 ?auto_526108 ) ) ( ON ?auto_526099 ?auto_526098 ) ( ON ?auto_526100 ?auto_526099 ) ( ON ?auto_526101 ?auto_526100 ) ( ON ?auto_526102 ?auto_526101 ) ( ON ?auto_526103 ?auto_526102 ) ( ON ?auto_526104 ?auto_526103 ) ( not ( = ?auto_526098 ?auto_526099 ) ) ( not ( = ?auto_526098 ?auto_526100 ) ) ( not ( = ?auto_526098 ?auto_526101 ) ) ( not ( = ?auto_526098 ?auto_526102 ) ) ( not ( = ?auto_526098 ?auto_526103 ) ) ( not ( = ?auto_526098 ?auto_526104 ) ) ( not ( = ?auto_526098 ?auto_526105 ) ) ( not ( = ?auto_526098 ?auto_526106 ) ) ( not ( = ?auto_526099 ?auto_526100 ) ) ( not ( = ?auto_526099 ?auto_526101 ) ) ( not ( = ?auto_526099 ?auto_526102 ) ) ( not ( = ?auto_526099 ?auto_526103 ) ) ( not ( = ?auto_526099 ?auto_526104 ) ) ( not ( = ?auto_526099 ?auto_526105 ) ) ( not ( = ?auto_526099 ?auto_526106 ) ) ( not ( = ?auto_526100 ?auto_526101 ) ) ( not ( = ?auto_526100 ?auto_526102 ) ) ( not ( = ?auto_526100 ?auto_526103 ) ) ( not ( = ?auto_526100 ?auto_526104 ) ) ( not ( = ?auto_526100 ?auto_526105 ) ) ( not ( = ?auto_526100 ?auto_526106 ) ) ( not ( = ?auto_526101 ?auto_526102 ) ) ( not ( = ?auto_526101 ?auto_526103 ) ) ( not ( = ?auto_526101 ?auto_526104 ) ) ( not ( = ?auto_526101 ?auto_526105 ) ) ( not ( = ?auto_526101 ?auto_526106 ) ) ( not ( = ?auto_526102 ?auto_526103 ) ) ( not ( = ?auto_526102 ?auto_526104 ) ) ( not ( = ?auto_526102 ?auto_526105 ) ) ( not ( = ?auto_526102 ?auto_526106 ) ) ( not ( = ?auto_526103 ?auto_526104 ) ) ( not ( = ?auto_526103 ?auto_526105 ) ) ( not ( = ?auto_526103 ?auto_526106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_526104 ?auto_526105 ?auto_526106 )
      ( MAKE-8CRATE-VERIFY ?auto_526098 ?auto_526099 ?auto_526100 ?auto_526101 ?auto_526102 ?auto_526103 ?auto_526104 ?auto_526105 ?auto_526106 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_526182 - SURFACE
      ?auto_526183 - SURFACE
      ?auto_526184 - SURFACE
      ?auto_526185 - SURFACE
      ?auto_526186 - SURFACE
      ?auto_526187 - SURFACE
      ?auto_526188 - SURFACE
      ?auto_526189 - SURFACE
      ?auto_526190 - SURFACE
    )
    :vars
    (
      ?auto_526191 - HOIST
      ?auto_526194 - PLACE
      ?auto_526192 - TRUCK
      ?auto_526193 - PLACE
      ?auto_526195 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_526191 ?auto_526194 ) ( SURFACE-AT ?auto_526189 ?auto_526194 ) ( CLEAR ?auto_526189 ) ( IS-CRATE ?auto_526190 ) ( not ( = ?auto_526189 ?auto_526190 ) ) ( AVAILABLE ?auto_526191 ) ( ON ?auto_526189 ?auto_526188 ) ( not ( = ?auto_526188 ?auto_526189 ) ) ( not ( = ?auto_526188 ?auto_526190 ) ) ( TRUCK-AT ?auto_526192 ?auto_526193 ) ( not ( = ?auto_526193 ?auto_526194 ) ) ( HOIST-AT ?auto_526195 ?auto_526193 ) ( LIFTING ?auto_526195 ?auto_526190 ) ( not ( = ?auto_526191 ?auto_526195 ) ) ( ON ?auto_526183 ?auto_526182 ) ( ON ?auto_526184 ?auto_526183 ) ( ON ?auto_526185 ?auto_526184 ) ( ON ?auto_526186 ?auto_526185 ) ( ON ?auto_526187 ?auto_526186 ) ( ON ?auto_526188 ?auto_526187 ) ( not ( = ?auto_526182 ?auto_526183 ) ) ( not ( = ?auto_526182 ?auto_526184 ) ) ( not ( = ?auto_526182 ?auto_526185 ) ) ( not ( = ?auto_526182 ?auto_526186 ) ) ( not ( = ?auto_526182 ?auto_526187 ) ) ( not ( = ?auto_526182 ?auto_526188 ) ) ( not ( = ?auto_526182 ?auto_526189 ) ) ( not ( = ?auto_526182 ?auto_526190 ) ) ( not ( = ?auto_526183 ?auto_526184 ) ) ( not ( = ?auto_526183 ?auto_526185 ) ) ( not ( = ?auto_526183 ?auto_526186 ) ) ( not ( = ?auto_526183 ?auto_526187 ) ) ( not ( = ?auto_526183 ?auto_526188 ) ) ( not ( = ?auto_526183 ?auto_526189 ) ) ( not ( = ?auto_526183 ?auto_526190 ) ) ( not ( = ?auto_526184 ?auto_526185 ) ) ( not ( = ?auto_526184 ?auto_526186 ) ) ( not ( = ?auto_526184 ?auto_526187 ) ) ( not ( = ?auto_526184 ?auto_526188 ) ) ( not ( = ?auto_526184 ?auto_526189 ) ) ( not ( = ?auto_526184 ?auto_526190 ) ) ( not ( = ?auto_526185 ?auto_526186 ) ) ( not ( = ?auto_526185 ?auto_526187 ) ) ( not ( = ?auto_526185 ?auto_526188 ) ) ( not ( = ?auto_526185 ?auto_526189 ) ) ( not ( = ?auto_526185 ?auto_526190 ) ) ( not ( = ?auto_526186 ?auto_526187 ) ) ( not ( = ?auto_526186 ?auto_526188 ) ) ( not ( = ?auto_526186 ?auto_526189 ) ) ( not ( = ?auto_526186 ?auto_526190 ) ) ( not ( = ?auto_526187 ?auto_526188 ) ) ( not ( = ?auto_526187 ?auto_526189 ) ) ( not ( = ?auto_526187 ?auto_526190 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_526188 ?auto_526189 ?auto_526190 )
      ( MAKE-8CRATE-VERIFY ?auto_526182 ?auto_526183 ?auto_526184 ?auto_526185 ?auto_526186 ?auto_526187 ?auto_526188 ?auto_526189 ?auto_526190 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_526274 - SURFACE
      ?auto_526275 - SURFACE
      ?auto_526276 - SURFACE
      ?auto_526277 - SURFACE
      ?auto_526278 - SURFACE
      ?auto_526279 - SURFACE
      ?auto_526280 - SURFACE
      ?auto_526281 - SURFACE
      ?auto_526282 - SURFACE
    )
    :vars
    (
      ?auto_526286 - HOIST
      ?auto_526283 - PLACE
      ?auto_526288 - TRUCK
      ?auto_526284 - PLACE
      ?auto_526287 - HOIST
      ?auto_526285 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_526286 ?auto_526283 ) ( SURFACE-AT ?auto_526281 ?auto_526283 ) ( CLEAR ?auto_526281 ) ( IS-CRATE ?auto_526282 ) ( not ( = ?auto_526281 ?auto_526282 ) ) ( AVAILABLE ?auto_526286 ) ( ON ?auto_526281 ?auto_526280 ) ( not ( = ?auto_526280 ?auto_526281 ) ) ( not ( = ?auto_526280 ?auto_526282 ) ) ( TRUCK-AT ?auto_526288 ?auto_526284 ) ( not ( = ?auto_526284 ?auto_526283 ) ) ( HOIST-AT ?auto_526287 ?auto_526284 ) ( not ( = ?auto_526286 ?auto_526287 ) ) ( AVAILABLE ?auto_526287 ) ( SURFACE-AT ?auto_526282 ?auto_526284 ) ( ON ?auto_526282 ?auto_526285 ) ( CLEAR ?auto_526282 ) ( not ( = ?auto_526281 ?auto_526285 ) ) ( not ( = ?auto_526282 ?auto_526285 ) ) ( not ( = ?auto_526280 ?auto_526285 ) ) ( ON ?auto_526275 ?auto_526274 ) ( ON ?auto_526276 ?auto_526275 ) ( ON ?auto_526277 ?auto_526276 ) ( ON ?auto_526278 ?auto_526277 ) ( ON ?auto_526279 ?auto_526278 ) ( ON ?auto_526280 ?auto_526279 ) ( not ( = ?auto_526274 ?auto_526275 ) ) ( not ( = ?auto_526274 ?auto_526276 ) ) ( not ( = ?auto_526274 ?auto_526277 ) ) ( not ( = ?auto_526274 ?auto_526278 ) ) ( not ( = ?auto_526274 ?auto_526279 ) ) ( not ( = ?auto_526274 ?auto_526280 ) ) ( not ( = ?auto_526274 ?auto_526281 ) ) ( not ( = ?auto_526274 ?auto_526282 ) ) ( not ( = ?auto_526274 ?auto_526285 ) ) ( not ( = ?auto_526275 ?auto_526276 ) ) ( not ( = ?auto_526275 ?auto_526277 ) ) ( not ( = ?auto_526275 ?auto_526278 ) ) ( not ( = ?auto_526275 ?auto_526279 ) ) ( not ( = ?auto_526275 ?auto_526280 ) ) ( not ( = ?auto_526275 ?auto_526281 ) ) ( not ( = ?auto_526275 ?auto_526282 ) ) ( not ( = ?auto_526275 ?auto_526285 ) ) ( not ( = ?auto_526276 ?auto_526277 ) ) ( not ( = ?auto_526276 ?auto_526278 ) ) ( not ( = ?auto_526276 ?auto_526279 ) ) ( not ( = ?auto_526276 ?auto_526280 ) ) ( not ( = ?auto_526276 ?auto_526281 ) ) ( not ( = ?auto_526276 ?auto_526282 ) ) ( not ( = ?auto_526276 ?auto_526285 ) ) ( not ( = ?auto_526277 ?auto_526278 ) ) ( not ( = ?auto_526277 ?auto_526279 ) ) ( not ( = ?auto_526277 ?auto_526280 ) ) ( not ( = ?auto_526277 ?auto_526281 ) ) ( not ( = ?auto_526277 ?auto_526282 ) ) ( not ( = ?auto_526277 ?auto_526285 ) ) ( not ( = ?auto_526278 ?auto_526279 ) ) ( not ( = ?auto_526278 ?auto_526280 ) ) ( not ( = ?auto_526278 ?auto_526281 ) ) ( not ( = ?auto_526278 ?auto_526282 ) ) ( not ( = ?auto_526278 ?auto_526285 ) ) ( not ( = ?auto_526279 ?auto_526280 ) ) ( not ( = ?auto_526279 ?auto_526281 ) ) ( not ( = ?auto_526279 ?auto_526282 ) ) ( not ( = ?auto_526279 ?auto_526285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_526280 ?auto_526281 ?auto_526282 )
      ( MAKE-8CRATE-VERIFY ?auto_526274 ?auto_526275 ?auto_526276 ?auto_526277 ?auto_526278 ?auto_526279 ?auto_526280 ?auto_526281 ?auto_526282 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_526367 - SURFACE
      ?auto_526368 - SURFACE
      ?auto_526369 - SURFACE
      ?auto_526370 - SURFACE
      ?auto_526371 - SURFACE
      ?auto_526372 - SURFACE
      ?auto_526373 - SURFACE
      ?auto_526374 - SURFACE
      ?auto_526375 - SURFACE
    )
    :vars
    (
      ?auto_526376 - HOIST
      ?auto_526380 - PLACE
      ?auto_526381 - PLACE
      ?auto_526379 - HOIST
      ?auto_526378 - SURFACE
      ?auto_526377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_526376 ?auto_526380 ) ( SURFACE-AT ?auto_526374 ?auto_526380 ) ( CLEAR ?auto_526374 ) ( IS-CRATE ?auto_526375 ) ( not ( = ?auto_526374 ?auto_526375 ) ) ( AVAILABLE ?auto_526376 ) ( ON ?auto_526374 ?auto_526373 ) ( not ( = ?auto_526373 ?auto_526374 ) ) ( not ( = ?auto_526373 ?auto_526375 ) ) ( not ( = ?auto_526381 ?auto_526380 ) ) ( HOIST-AT ?auto_526379 ?auto_526381 ) ( not ( = ?auto_526376 ?auto_526379 ) ) ( AVAILABLE ?auto_526379 ) ( SURFACE-AT ?auto_526375 ?auto_526381 ) ( ON ?auto_526375 ?auto_526378 ) ( CLEAR ?auto_526375 ) ( not ( = ?auto_526374 ?auto_526378 ) ) ( not ( = ?auto_526375 ?auto_526378 ) ) ( not ( = ?auto_526373 ?auto_526378 ) ) ( TRUCK-AT ?auto_526377 ?auto_526380 ) ( ON ?auto_526368 ?auto_526367 ) ( ON ?auto_526369 ?auto_526368 ) ( ON ?auto_526370 ?auto_526369 ) ( ON ?auto_526371 ?auto_526370 ) ( ON ?auto_526372 ?auto_526371 ) ( ON ?auto_526373 ?auto_526372 ) ( not ( = ?auto_526367 ?auto_526368 ) ) ( not ( = ?auto_526367 ?auto_526369 ) ) ( not ( = ?auto_526367 ?auto_526370 ) ) ( not ( = ?auto_526367 ?auto_526371 ) ) ( not ( = ?auto_526367 ?auto_526372 ) ) ( not ( = ?auto_526367 ?auto_526373 ) ) ( not ( = ?auto_526367 ?auto_526374 ) ) ( not ( = ?auto_526367 ?auto_526375 ) ) ( not ( = ?auto_526367 ?auto_526378 ) ) ( not ( = ?auto_526368 ?auto_526369 ) ) ( not ( = ?auto_526368 ?auto_526370 ) ) ( not ( = ?auto_526368 ?auto_526371 ) ) ( not ( = ?auto_526368 ?auto_526372 ) ) ( not ( = ?auto_526368 ?auto_526373 ) ) ( not ( = ?auto_526368 ?auto_526374 ) ) ( not ( = ?auto_526368 ?auto_526375 ) ) ( not ( = ?auto_526368 ?auto_526378 ) ) ( not ( = ?auto_526369 ?auto_526370 ) ) ( not ( = ?auto_526369 ?auto_526371 ) ) ( not ( = ?auto_526369 ?auto_526372 ) ) ( not ( = ?auto_526369 ?auto_526373 ) ) ( not ( = ?auto_526369 ?auto_526374 ) ) ( not ( = ?auto_526369 ?auto_526375 ) ) ( not ( = ?auto_526369 ?auto_526378 ) ) ( not ( = ?auto_526370 ?auto_526371 ) ) ( not ( = ?auto_526370 ?auto_526372 ) ) ( not ( = ?auto_526370 ?auto_526373 ) ) ( not ( = ?auto_526370 ?auto_526374 ) ) ( not ( = ?auto_526370 ?auto_526375 ) ) ( not ( = ?auto_526370 ?auto_526378 ) ) ( not ( = ?auto_526371 ?auto_526372 ) ) ( not ( = ?auto_526371 ?auto_526373 ) ) ( not ( = ?auto_526371 ?auto_526374 ) ) ( not ( = ?auto_526371 ?auto_526375 ) ) ( not ( = ?auto_526371 ?auto_526378 ) ) ( not ( = ?auto_526372 ?auto_526373 ) ) ( not ( = ?auto_526372 ?auto_526374 ) ) ( not ( = ?auto_526372 ?auto_526375 ) ) ( not ( = ?auto_526372 ?auto_526378 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_526373 ?auto_526374 ?auto_526375 )
      ( MAKE-8CRATE-VERIFY ?auto_526367 ?auto_526368 ?auto_526369 ?auto_526370 ?auto_526371 ?auto_526372 ?auto_526373 ?auto_526374 ?auto_526375 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_526460 - SURFACE
      ?auto_526461 - SURFACE
      ?auto_526462 - SURFACE
      ?auto_526463 - SURFACE
      ?auto_526464 - SURFACE
      ?auto_526465 - SURFACE
      ?auto_526466 - SURFACE
      ?auto_526467 - SURFACE
      ?auto_526468 - SURFACE
    )
    :vars
    (
      ?auto_526474 - HOIST
      ?auto_526469 - PLACE
      ?auto_526470 - PLACE
      ?auto_526472 - HOIST
      ?auto_526471 - SURFACE
      ?auto_526473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_526474 ?auto_526469 ) ( IS-CRATE ?auto_526468 ) ( not ( = ?auto_526467 ?auto_526468 ) ) ( not ( = ?auto_526466 ?auto_526467 ) ) ( not ( = ?auto_526466 ?auto_526468 ) ) ( not ( = ?auto_526470 ?auto_526469 ) ) ( HOIST-AT ?auto_526472 ?auto_526470 ) ( not ( = ?auto_526474 ?auto_526472 ) ) ( AVAILABLE ?auto_526472 ) ( SURFACE-AT ?auto_526468 ?auto_526470 ) ( ON ?auto_526468 ?auto_526471 ) ( CLEAR ?auto_526468 ) ( not ( = ?auto_526467 ?auto_526471 ) ) ( not ( = ?auto_526468 ?auto_526471 ) ) ( not ( = ?auto_526466 ?auto_526471 ) ) ( TRUCK-AT ?auto_526473 ?auto_526469 ) ( SURFACE-AT ?auto_526466 ?auto_526469 ) ( CLEAR ?auto_526466 ) ( LIFTING ?auto_526474 ?auto_526467 ) ( IS-CRATE ?auto_526467 ) ( ON ?auto_526461 ?auto_526460 ) ( ON ?auto_526462 ?auto_526461 ) ( ON ?auto_526463 ?auto_526462 ) ( ON ?auto_526464 ?auto_526463 ) ( ON ?auto_526465 ?auto_526464 ) ( ON ?auto_526466 ?auto_526465 ) ( not ( = ?auto_526460 ?auto_526461 ) ) ( not ( = ?auto_526460 ?auto_526462 ) ) ( not ( = ?auto_526460 ?auto_526463 ) ) ( not ( = ?auto_526460 ?auto_526464 ) ) ( not ( = ?auto_526460 ?auto_526465 ) ) ( not ( = ?auto_526460 ?auto_526466 ) ) ( not ( = ?auto_526460 ?auto_526467 ) ) ( not ( = ?auto_526460 ?auto_526468 ) ) ( not ( = ?auto_526460 ?auto_526471 ) ) ( not ( = ?auto_526461 ?auto_526462 ) ) ( not ( = ?auto_526461 ?auto_526463 ) ) ( not ( = ?auto_526461 ?auto_526464 ) ) ( not ( = ?auto_526461 ?auto_526465 ) ) ( not ( = ?auto_526461 ?auto_526466 ) ) ( not ( = ?auto_526461 ?auto_526467 ) ) ( not ( = ?auto_526461 ?auto_526468 ) ) ( not ( = ?auto_526461 ?auto_526471 ) ) ( not ( = ?auto_526462 ?auto_526463 ) ) ( not ( = ?auto_526462 ?auto_526464 ) ) ( not ( = ?auto_526462 ?auto_526465 ) ) ( not ( = ?auto_526462 ?auto_526466 ) ) ( not ( = ?auto_526462 ?auto_526467 ) ) ( not ( = ?auto_526462 ?auto_526468 ) ) ( not ( = ?auto_526462 ?auto_526471 ) ) ( not ( = ?auto_526463 ?auto_526464 ) ) ( not ( = ?auto_526463 ?auto_526465 ) ) ( not ( = ?auto_526463 ?auto_526466 ) ) ( not ( = ?auto_526463 ?auto_526467 ) ) ( not ( = ?auto_526463 ?auto_526468 ) ) ( not ( = ?auto_526463 ?auto_526471 ) ) ( not ( = ?auto_526464 ?auto_526465 ) ) ( not ( = ?auto_526464 ?auto_526466 ) ) ( not ( = ?auto_526464 ?auto_526467 ) ) ( not ( = ?auto_526464 ?auto_526468 ) ) ( not ( = ?auto_526464 ?auto_526471 ) ) ( not ( = ?auto_526465 ?auto_526466 ) ) ( not ( = ?auto_526465 ?auto_526467 ) ) ( not ( = ?auto_526465 ?auto_526468 ) ) ( not ( = ?auto_526465 ?auto_526471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_526466 ?auto_526467 ?auto_526468 )
      ( MAKE-8CRATE-VERIFY ?auto_526460 ?auto_526461 ?auto_526462 ?auto_526463 ?auto_526464 ?auto_526465 ?auto_526466 ?auto_526467 ?auto_526468 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_526553 - SURFACE
      ?auto_526554 - SURFACE
      ?auto_526555 - SURFACE
      ?auto_526556 - SURFACE
      ?auto_526557 - SURFACE
      ?auto_526558 - SURFACE
      ?auto_526559 - SURFACE
      ?auto_526560 - SURFACE
      ?auto_526561 - SURFACE
    )
    :vars
    (
      ?auto_526563 - HOIST
      ?auto_526567 - PLACE
      ?auto_526564 - PLACE
      ?auto_526566 - HOIST
      ?auto_526565 - SURFACE
      ?auto_526562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_526563 ?auto_526567 ) ( IS-CRATE ?auto_526561 ) ( not ( = ?auto_526560 ?auto_526561 ) ) ( not ( = ?auto_526559 ?auto_526560 ) ) ( not ( = ?auto_526559 ?auto_526561 ) ) ( not ( = ?auto_526564 ?auto_526567 ) ) ( HOIST-AT ?auto_526566 ?auto_526564 ) ( not ( = ?auto_526563 ?auto_526566 ) ) ( AVAILABLE ?auto_526566 ) ( SURFACE-AT ?auto_526561 ?auto_526564 ) ( ON ?auto_526561 ?auto_526565 ) ( CLEAR ?auto_526561 ) ( not ( = ?auto_526560 ?auto_526565 ) ) ( not ( = ?auto_526561 ?auto_526565 ) ) ( not ( = ?auto_526559 ?auto_526565 ) ) ( TRUCK-AT ?auto_526562 ?auto_526567 ) ( SURFACE-AT ?auto_526559 ?auto_526567 ) ( CLEAR ?auto_526559 ) ( IS-CRATE ?auto_526560 ) ( AVAILABLE ?auto_526563 ) ( IN ?auto_526560 ?auto_526562 ) ( ON ?auto_526554 ?auto_526553 ) ( ON ?auto_526555 ?auto_526554 ) ( ON ?auto_526556 ?auto_526555 ) ( ON ?auto_526557 ?auto_526556 ) ( ON ?auto_526558 ?auto_526557 ) ( ON ?auto_526559 ?auto_526558 ) ( not ( = ?auto_526553 ?auto_526554 ) ) ( not ( = ?auto_526553 ?auto_526555 ) ) ( not ( = ?auto_526553 ?auto_526556 ) ) ( not ( = ?auto_526553 ?auto_526557 ) ) ( not ( = ?auto_526553 ?auto_526558 ) ) ( not ( = ?auto_526553 ?auto_526559 ) ) ( not ( = ?auto_526553 ?auto_526560 ) ) ( not ( = ?auto_526553 ?auto_526561 ) ) ( not ( = ?auto_526553 ?auto_526565 ) ) ( not ( = ?auto_526554 ?auto_526555 ) ) ( not ( = ?auto_526554 ?auto_526556 ) ) ( not ( = ?auto_526554 ?auto_526557 ) ) ( not ( = ?auto_526554 ?auto_526558 ) ) ( not ( = ?auto_526554 ?auto_526559 ) ) ( not ( = ?auto_526554 ?auto_526560 ) ) ( not ( = ?auto_526554 ?auto_526561 ) ) ( not ( = ?auto_526554 ?auto_526565 ) ) ( not ( = ?auto_526555 ?auto_526556 ) ) ( not ( = ?auto_526555 ?auto_526557 ) ) ( not ( = ?auto_526555 ?auto_526558 ) ) ( not ( = ?auto_526555 ?auto_526559 ) ) ( not ( = ?auto_526555 ?auto_526560 ) ) ( not ( = ?auto_526555 ?auto_526561 ) ) ( not ( = ?auto_526555 ?auto_526565 ) ) ( not ( = ?auto_526556 ?auto_526557 ) ) ( not ( = ?auto_526556 ?auto_526558 ) ) ( not ( = ?auto_526556 ?auto_526559 ) ) ( not ( = ?auto_526556 ?auto_526560 ) ) ( not ( = ?auto_526556 ?auto_526561 ) ) ( not ( = ?auto_526556 ?auto_526565 ) ) ( not ( = ?auto_526557 ?auto_526558 ) ) ( not ( = ?auto_526557 ?auto_526559 ) ) ( not ( = ?auto_526557 ?auto_526560 ) ) ( not ( = ?auto_526557 ?auto_526561 ) ) ( not ( = ?auto_526557 ?auto_526565 ) ) ( not ( = ?auto_526558 ?auto_526559 ) ) ( not ( = ?auto_526558 ?auto_526560 ) ) ( not ( = ?auto_526558 ?auto_526561 ) ) ( not ( = ?auto_526558 ?auto_526565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_526559 ?auto_526560 ?auto_526561 )
      ( MAKE-8CRATE-VERIFY ?auto_526553 ?auto_526554 ?auto_526555 ?auto_526556 ?auto_526557 ?auto_526558 ?auto_526559 ?auto_526560 ?auto_526561 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_530656 - SURFACE
      ?auto_530657 - SURFACE
      ?auto_530658 - SURFACE
      ?auto_530659 - SURFACE
      ?auto_530660 - SURFACE
      ?auto_530661 - SURFACE
      ?auto_530662 - SURFACE
      ?auto_530663 - SURFACE
      ?auto_530664 - SURFACE
      ?auto_530665 - SURFACE
    )
    :vars
    (
      ?auto_530667 - HOIST
      ?auto_530666 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_530667 ?auto_530666 ) ( SURFACE-AT ?auto_530664 ?auto_530666 ) ( CLEAR ?auto_530664 ) ( LIFTING ?auto_530667 ?auto_530665 ) ( IS-CRATE ?auto_530665 ) ( not ( = ?auto_530664 ?auto_530665 ) ) ( ON ?auto_530657 ?auto_530656 ) ( ON ?auto_530658 ?auto_530657 ) ( ON ?auto_530659 ?auto_530658 ) ( ON ?auto_530660 ?auto_530659 ) ( ON ?auto_530661 ?auto_530660 ) ( ON ?auto_530662 ?auto_530661 ) ( ON ?auto_530663 ?auto_530662 ) ( ON ?auto_530664 ?auto_530663 ) ( not ( = ?auto_530656 ?auto_530657 ) ) ( not ( = ?auto_530656 ?auto_530658 ) ) ( not ( = ?auto_530656 ?auto_530659 ) ) ( not ( = ?auto_530656 ?auto_530660 ) ) ( not ( = ?auto_530656 ?auto_530661 ) ) ( not ( = ?auto_530656 ?auto_530662 ) ) ( not ( = ?auto_530656 ?auto_530663 ) ) ( not ( = ?auto_530656 ?auto_530664 ) ) ( not ( = ?auto_530656 ?auto_530665 ) ) ( not ( = ?auto_530657 ?auto_530658 ) ) ( not ( = ?auto_530657 ?auto_530659 ) ) ( not ( = ?auto_530657 ?auto_530660 ) ) ( not ( = ?auto_530657 ?auto_530661 ) ) ( not ( = ?auto_530657 ?auto_530662 ) ) ( not ( = ?auto_530657 ?auto_530663 ) ) ( not ( = ?auto_530657 ?auto_530664 ) ) ( not ( = ?auto_530657 ?auto_530665 ) ) ( not ( = ?auto_530658 ?auto_530659 ) ) ( not ( = ?auto_530658 ?auto_530660 ) ) ( not ( = ?auto_530658 ?auto_530661 ) ) ( not ( = ?auto_530658 ?auto_530662 ) ) ( not ( = ?auto_530658 ?auto_530663 ) ) ( not ( = ?auto_530658 ?auto_530664 ) ) ( not ( = ?auto_530658 ?auto_530665 ) ) ( not ( = ?auto_530659 ?auto_530660 ) ) ( not ( = ?auto_530659 ?auto_530661 ) ) ( not ( = ?auto_530659 ?auto_530662 ) ) ( not ( = ?auto_530659 ?auto_530663 ) ) ( not ( = ?auto_530659 ?auto_530664 ) ) ( not ( = ?auto_530659 ?auto_530665 ) ) ( not ( = ?auto_530660 ?auto_530661 ) ) ( not ( = ?auto_530660 ?auto_530662 ) ) ( not ( = ?auto_530660 ?auto_530663 ) ) ( not ( = ?auto_530660 ?auto_530664 ) ) ( not ( = ?auto_530660 ?auto_530665 ) ) ( not ( = ?auto_530661 ?auto_530662 ) ) ( not ( = ?auto_530661 ?auto_530663 ) ) ( not ( = ?auto_530661 ?auto_530664 ) ) ( not ( = ?auto_530661 ?auto_530665 ) ) ( not ( = ?auto_530662 ?auto_530663 ) ) ( not ( = ?auto_530662 ?auto_530664 ) ) ( not ( = ?auto_530662 ?auto_530665 ) ) ( not ( = ?auto_530663 ?auto_530664 ) ) ( not ( = ?auto_530663 ?auto_530665 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_530664 ?auto_530665 )
      ( MAKE-9CRATE-VERIFY ?auto_530656 ?auto_530657 ?auto_530658 ?auto_530659 ?auto_530660 ?auto_530661 ?auto_530662 ?auto_530663 ?auto_530664 ?auto_530665 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_530736 - SURFACE
      ?auto_530737 - SURFACE
      ?auto_530738 - SURFACE
      ?auto_530739 - SURFACE
      ?auto_530740 - SURFACE
      ?auto_530741 - SURFACE
      ?auto_530742 - SURFACE
      ?auto_530743 - SURFACE
      ?auto_530744 - SURFACE
      ?auto_530745 - SURFACE
    )
    :vars
    (
      ?auto_530746 - HOIST
      ?auto_530747 - PLACE
      ?auto_530748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_530746 ?auto_530747 ) ( SURFACE-AT ?auto_530744 ?auto_530747 ) ( CLEAR ?auto_530744 ) ( IS-CRATE ?auto_530745 ) ( not ( = ?auto_530744 ?auto_530745 ) ) ( TRUCK-AT ?auto_530748 ?auto_530747 ) ( AVAILABLE ?auto_530746 ) ( IN ?auto_530745 ?auto_530748 ) ( ON ?auto_530744 ?auto_530743 ) ( not ( = ?auto_530743 ?auto_530744 ) ) ( not ( = ?auto_530743 ?auto_530745 ) ) ( ON ?auto_530737 ?auto_530736 ) ( ON ?auto_530738 ?auto_530737 ) ( ON ?auto_530739 ?auto_530738 ) ( ON ?auto_530740 ?auto_530739 ) ( ON ?auto_530741 ?auto_530740 ) ( ON ?auto_530742 ?auto_530741 ) ( ON ?auto_530743 ?auto_530742 ) ( not ( = ?auto_530736 ?auto_530737 ) ) ( not ( = ?auto_530736 ?auto_530738 ) ) ( not ( = ?auto_530736 ?auto_530739 ) ) ( not ( = ?auto_530736 ?auto_530740 ) ) ( not ( = ?auto_530736 ?auto_530741 ) ) ( not ( = ?auto_530736 ?auto_530742 ) ) ( not ( = ?auto_530736 ?auto_530743 ) ) ( not ( = ?auto_530736 ?auto_530744 ) ) ( not ( = ?auto_530736 ?auto_530745 ) ) ( not ( = ?auto_530737 ?auto_530738 ) ) ( not ( = ?auto_530737 ?auto_530739 ) ) ( not ( = ?auto_530737 ?auto_530740 ) ) ( not ( = ?auto_530737 ?auto_530741 ) ) ( not ( = ?auto_530737 ?auto_530742 ) ) ( not ( = ?auto_530737 ?auto_530743 ) ) ( not ( = ?auto_530737 ?auto_530744 ) ) ( not ( = ?auto_530737 ?auto_530745 ) ) ( not ( = ?auto_530738 ?auto_530739 ) ) ( not ( = ?auto_530738 ?auto_530740 ) ) ( not ( = ?auto_530738 ?auto_530741 ) ) ( not ( = ?auto_530738 ?auto_530742 ) ) ( not ( = ?auto_530738 ?auto_530743 ) ) ( not ( = ?auto_530738 ?auto_530744 ) ) ( not ( = ?auto_530738 ?auto_530745 ) ) ( not ( = ?auto_530739 ?auto_530740 ) ) ( not ( = ?auto_530739 ?auto_530741 ) ) ( not ( = ?auto_530739 ?auto_530742 ) ) ( not ( = ?auto_530739 ?auto_530743 ) ) ( not ( = ?auto_530739 ?auto_530744 ) ) ( not ( = ?auto_530739 ?auto_530745 ) ) ( not ( = ?auto_530740 ?auto_530741 ) ) ( not ( = ?auto_530740 ?auto_530742 ) ) ( not ( = ?auto_530740 ?auto_530743 ) ) ( not ( = ?auto_530740 ?auto_530744 ) ) ( not ( = ?auto_530740 ?auto_530745 ) ) ( not ( = ?auto_530741 ?auto_530742 ) ) ( not ( = ?auto_530741 ?auto_530743 ) ) ( not ( = ?auto_530741 ?auto_530744 ) ) ( not ( = ?auto_530741 ?auto_530745 ) ) ( not ( = ?auto_530742 ?auto_530743 ) ) ( not ( = ?auto_530742 ?auto_530744 ) ) ( not ( = ?auto_530742 ?auto_530745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_530743 ?auto_530744 ?auto_530745 )
      ( MAKE-9CRATE-VERIFY ?auto_530736 ?auto_530737 ?auto_530738 ?auto_530739 ?auto_530740 ?auto_530741 ?auto_530742 ?auto_530743 ?auto_530744 ?auto_530745 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_530826 - SURFACE
      ?auto_530827 - SURFACE
      ?auto_530828 - SURFACE
      ?auto_530829 - SURFACE
      ?auto_530830 - SURFACE
      ?auto_530831 - SURFACE
      ?auto_530832 - SURFACE
      ?auto_530833 - SURFACE
      ?auto_530834 - SURFACE
      ?auto_530835 - SURFACE
    )
    :vars
    (
      ?auto_530838 - HOIST
      ?auto_530836 - PLACE
      ?auto_530839 - TRUCK
      ?auto_530837 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_530838 ?auto_530836 ) ( SURFACE-AT ?auto_530834 ?auto_530836 ) ( CLEAR ?auto_530834 ) ( IS-CRATE ?auto_530835 ) ( not ( = ?auto_530834 ?auto_530835 ) ) ( AVAILABLE ?auto_530838 ) ( IN ?auto_530835 ?auto_530839 ) ( ON ?auto_530834 ?auto_530833 ) ( not ( = ?auto_530833 ?auto_530834 ) ) ( not ( = ?auto_530833 ?auto_530835 ) ) ( TRUCK-AT ?auto_530839 ?auto_530837 ) ( not ( = ?auto_530837 ?auto_530836 ) ) ( ON ?auto_530827 ?auto_530826 ) ( ON ?auto_530828 ?auto_530827 ) ( ON ?auto_530829 ?auto_530828 ) ( ON ?auto_530830 ?auto_530829 ) ( ON ?auto_530831 ?auto_530830 ) ( ON ?auto_530832 ?auto_530831 ) ( ON ?auto_530833 ?auto_530832 ) ( not ( = ?auto_530826 ?auto_530827 ) ) ( not ( = ?auto_530826 ?auto_530828 ) ) ( not ( = ?auto_530826 ?auto_530829 ) ) ( not ( = ?auto_530826 ?auto_530830 ) ) ( not ( = ?auto_530826 ?auto_530831 ) ) ( not ( = ?auto_530826 ?auto_530832 ) ) ( not ( = ?auto_530826 ?auto_530833 ) ) ( not ( = ?auto_530826 ?auto_530834 ) ) ( not ( = ?auto_530826 ?auto_530835 ) ) ( not ( = ?auto_530827 ?auto_530828 ) ) ( not ( = ?auto_530827 ?auto_530829 ) ) ( not ( = ?auto_530827 ?auto_530830 ) ) ( not ( = ?auto_530827 ?auto_530831 ) ) ( not ( = ?auto_530827 ?auto_530832 ) ) ( not ( = ?auto_530827 ?auto_530833 ) ) ( not ( = ?auto_530827 ?auto_530834 ) ) ( not ( = ?auto_530827 ?auto_530835 ) ) ( not ( = ?auto_530828 ?auto_530829 ) ) ( not ( = ?auto_530828 ?auto_530830 ) ) ( not ( = ?auto_530828 ?auto_530831 ) ) ( not ( = ?auto_530828 ?auto_530832 ) ) ( not ( = ?auto_530828 ?auto_530833 ) ) ( not ( = ?auto_530828 ?auto_530834 ) ) ( not ( = ?auto_530828 ?auto_530835 ) ) ( not ( = ?auto_530829 ?auto_530830 ) ) ( not ( = ?auto_530829 ?auto_530831 ) ) ( not ( = ?auto_530829 ?auto_530832 ) ) ( not ( = ?auto_530829 ?auto_530833 ) ) ( not ( = ?auto_530829 ?auto_530834 ) ) ( not ( = ?auto_530829 ?auto_530835 ) ) ( not ( = ?auto_530830 ?auto_530831 ) ) ( not ( = ?auto_530830 ?auto_530832 ) ) ( not ( = ?auto_530830 ?auto_530833 ) ) ( not ( = ?auto_530830 ?auto_530834 ) ) ( not ( = ?auto_530830 ?auto_530835 ) ) ( not ( = ?auto_530831 ?auto_530832 ) ) ( not ( = ?auto_530831 ?auto_530833 ) ) ( not ( = ?auto_530831 ?auto_530834 ) ) ( not ( = ?auto_530831 ?auto_530835 ) ) ( not ( = ?auto_530832 ?auto_530833 ) ) ( not ( = ?auto_530832 ?auto_530834 ) ) ( not ( = ?auto_530832 ?auto_530835 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_530833 ?auto_530834 ?auto_530835 )
      ( MAKE-9CRATE-VERIFY ?auto_530826 ?auto_530827 ?auto_530828 ?auto_530829 ?auto_530830 ?auto_530831 ?auto_530832 ?auto_530833 ?auto_530834 ?auto_530835 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_530925 - SURFACE
      ?auto_530926 - SURFACE
      ?auto_530927 - SURFACE
      ?auto_530928 - SURFACE
      ?auto_530929 - SURFACE
      ?auto_530930 - SURFACE
      ?auto_530931 - SURFACE
      ?auto_530932 - SURFACE
      ?auto_530933 - SURFACE
      ?auto_530934 - SURFACE
    )
    :vars
    (
      ?auto_530939 - HOIST
      ?auto_530936 - PLACE
      ?auto_530935 - TRUCK
      ?auto_530938 - PLACE
      ?auto_530937 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_530939 ?auto_530936 ) ( SURFACE-AT ?auto_530933 ?auto_530936 ) ( CLEAR ?auto_530933 ) ( IS-CRATE ?auto_530934 ) ( not ( = ?auto_530933 ?auto_530934 ) ) ( AVAILABLE ?auto_530939 ) ( ON ?auto_530933 ?auto_530932 ) ( not ( = ?auto_530932 ?auto_530933 ) ) ( not ( = ?auto_530932 ?auto_530934 ) ) ( TRUCK-AT ?auto_530935 ?auto_530938 ) ( not ( = ?auto_530938 ?auto_530936 ) ) ( HOIST-AT ?auto_530937 ?auto_530938 ) ( LIFTING ?auto_530937 ?auto_530934 ) ( not ( = ?auto_530939 ?auto_530937 ) ) ( ON ?auto_530926 ?auto_530925 ) ( ON ?auto_530927 ?auto_530926 ) ( ON ?auto_530928 ?auto_530927 ) ( ON ?auto_530929 ?auto_530928 ) ( ON ?auto_530930 ?auto_530929 ) ( ON ?auto_530931 ?auto_530930 ) ( ON ?auto_530932 ?auto_530931 ) ( not ( = ?auto_530925 ?auto_530926 ) ) ( not ( = ?auto_530925 ?auto_530927 ) ) ( not ( = ?auto_530925 ?auto_530928 ) ) ( not ( = ?auto_530925 ?auto_530929 ) ) ( not ( = ?auto_530925 ?auto_530930 ) ) ( not ( = ?auto_530925 ?auto_530931 ) ) ( not ( = ?auto_530925 ?auto_530932 ) ) ( not ( = ?auto_530925 ?auto_530933 ) ) ( not ( = ?auto_530925 ?auto_530934 ) ) ( not ( = ?auto_530926 ?auto_530927 ) ) ( not ( = ?auto_530926 ?auto_530928 ) ) ( not ( = ?auto_530926 ?auto_530929 ) ) ( not ( = ?auto_530926 ?auto_530930 ) ) ( not ( = ?auto_530926 ?auto_530931 ) ) ( not ( = ?auto_530926 ?auto_530932 ) ) ( not ( = ?auto_530926 ?auto_530933 ) ) ( not ( = ?auto_530926 ?auto_530934 ) ) ( not ( = ?auto_530927 ?auto_530928 ) ) ( not ( = ?auto_530927 ?auto_530929 ) ) ( not ( = ?auto_530927 ?auto_530930 ) ) ( not ( = ?auto_530927 ?auto_530931 ) ) ( not ( = ?auto_530927 ?auto_530932 ) ) ( not ( = ?auto_530927 ?auto_530933 ) ) ( not ( = ?auto_530927 ?auto_530934 ) ) ( not ( = ?auto_530928 ?auto_530929 ) ) ( not ( = ?auto_530928 ?auto_530930 ) ) ( not ( = ?auto_530928 ?auto_530931 ) ) ( not ( = ?auto_530928 ?auto_530932 ) ) ( not ( = ?auto_530928 ?auto_530933 ) ) ( not ( = ?auto_530928 ?auto_530934 ) ) ( not ( = ?auto_530929 ?auto_530930 ) ) ( not ( = ?auto_530929 ?auto_530931 ) ) ( not ( = ?auto_530929 ?auto_530932 ) ) ( not ( = ?auto_530929 ?auto_530933 ) ) ( not ( = ?auto_530929 ?auto_530934 ) ) ( not ( = ?auto_530930 ?auto_530931 ) ) ( not ( = ?auto_530930 ?auto_530932 ) ) ( not ( = ?auto_530930 ?auto_530933 ) ) ( not ( = ?auto_530930 ?auto_530934 ) ) ( not ( = ?auto_530931 ?auto_530932 ) ) ( not ( = ?auto_530931 ?auto_530933 ) ) ( not ( = ?auto_530931 ?auto_530934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_530932 ?auto_530933 ?auto_530934 )
      ( MAKE-9CRATE-VERIFY ?auto_530925 ?auto_530926 ?auto_530927 ?auto_530928 ?auto_530929 ?auto_530930 ?auto_530931 ?auto_530932 ?auto_530933 ?auto_530934 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_531033 - SURFACE
      ?auto_531034 - SURFACE
      ?auto_531035 - SURFACE
      ?auto_531036 - SURFACE
      ?auto_531037 - SURFACE
      ?auto_531038 - SURFACE
      ?auto_531039 - SURFACE
      ?auto_531040 - SURFACE
      ?auto_531041 - SURFACE
      ?auto_531042 - SURFACE
    )
    :vars
    (
      ?auto_531043 - HOIST
      ?auto_531045 - PLACE
      ?auto_531047 - TRUCK
      ?auto_531046 - PLACE
      ?auto_531048 - HOIST
      ?auto_531044 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_531043 ?auto_531045 ) ( SURFACE-AT ?auto_531041 ?auto_531045 ) ( CLEAR ?auto_531041 ) ( IS-CRATE ?auto_531042 ) ( not ( = ?auto_531041 ?auto_531042 ) ) ( AVAILABLE ?auto_531043 ) ( ON ?auto_531041 ?auto_531040 ) ( not ( = ?auto_531040 ?auto_531041 ) ) ( not ( = ?auto_531040 ?auto_531042 ) ) ( TRUCK-AT ?auto_531047 ?auto_531046 ) ( not ( = ?auto_531046 ?auto_531045 ) ) ( HOIST-AT ?auto_531048 ?auto_531046 ) ( not ( = ?auto_531043 ?auto_531048 ) ) ( AVAILABLE ?auto_531048 ) ( SURFACE-AT ?auto_531042 ?auto_531046 ) ( ON ?auto_531042 ?auto_531044 ) ( CLEAR ?auto_531042 ) ( not ( = ?auto_531041 ?auto_531044 ) ) ( not ( = ?auto_531042 ?auto_531044 ) ) ( not ( = ?auto_531040 ?auto_531044 ) ) ( ON ?auto_531034 ?auto_531033 ) ( ON ?auto_531035 ?auto_531034 ) ( ON ?auto_531036 ?auto_531035 ) ( ON ?auto_531037 ?auto_531036 ) ( ON ?auto_531038 ?auto_531037 ) ( ON ?auto_531039 ?auto_531038 ) ( ON ?auto_531040 ?auto_531039 ) ( not ( = ?auto_531033 ?auto_531034 ) ) ( not ( = ?auto_531033 ?auto_531035 ) ) ( not ( = ?auto_531033 ?auto_531036 ) ) ( not ( = ?auto_531033 ?auto_531037 ) ) ( not ( = ?auto_531033 ?auto_531038 ) ) ( not ( = ?auto_531033 ?auto_531039 ) ) ( not ( = ?auto_531033 ?auto_531040 ) ) ( not ( = ?auto_531033 ?auto_531041 ) ) ( not ( = ?auto_531033 ?auto_531042 ) ) ( not ( = ?auto_531033 ?auto_531044 ) ) ( not ( = ?auto_531034 ?auto_531035 ) ) ( not ( = ?auto_531034 ?auto_531036 ) ) ( not ( = ?auto_531034 ?auto_531037 ) ) ( not ( = ?auto_531034 ?auto_531038 ) ) ( not ( = ?auto_531034 ?auto_531039 ) ) ( not ( = ?auto_531034 ?auto_531040 ) ) ( not ( = ?auto_531034 ?auto_531041 ) ) ( not ( = ?auto_531034 ?auto_531042 ) ) ( not ( = ?auto_531034 ?auto_531044 ) ) ( not ( = ?auto_531035 ?auto_531036 ) ) ( not ( = ?auto_531035 ?auto_531037 ) ) ( not ( = ?auto_531035 ?auto_531038 ) ) ( not ( = ?auto_531035 ?auto_531039 ) ) ( not ( = ?auto_531035 ?auto_531040 ) ) ( not ( = ?auto_531035 ?auto_531041 ) ) ( not ( = ?auto_531035 ?auto_531042 ) ) ( not ( = ?auto_531035 ?auto_531044 ) ) ( not ( = ?auto_531036 ?auto_531037 ) ) ( not ( = ?auto_531036 ?auto_531038 ) ) ( not ( = ?auto_531036 ?auto_531039 ) ) ( not ( = ?auto_531036 ?auto_531040 ) ) ( not ( = ?auto_531036 ?auto_531041 ) ) ( not ( = ?auto_531036 ?auto_531042 ) ) ( not ( = ?auto_531036 ?auto_531044 ) ) ( not ( = ?auto_531037 ?auto_531038 ) ) ( not ( = ?auto_531037 ?auto_531039 ) ) ( not ( = ?auto_531037 ?auto_531040 ) ) ( not ( = ?auto_531037 ?auto_531041 ) ) ( not ( = ?auto_531037 ?auto_531042 ) ) ( not ( = ?auto_531037 ?auto_531044 ) ) ( not ( = ?auto_531038 ?auto_531039 ) ) ( not ( = ?auto_531038 ?auto_531040 ) ) ( not ( = ?auto_531038 ?auto_531041 ) ) ( not ( = ?auto_531038 ?auto_531042 ) ) ( not ( = ?auto_531038 ?auto_531044 ) ) ( not ( = ?auto_531039 ?auto_531040 ) ) ( not ( = ?auto_531039 ?auto_531041 ) ) ( not ( = ?auto_531039 ?auto_531042 ) ) ( not ( = ?auto_531039 ?auto_531044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_531040 ?auto_531041 ?auto_531042 )
      ( MAKE-9CRATE-VERIFY ?auto_531033 ?auto_531034 ?auto_531035 ?auto_531036 ?auto_531037 ?auto_531038 ?auto_531039 ?auto_531040 ?auto_531041 ?auto_531042 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_531142 - SURFACE
      ?auto_531143 - SURFACE
      ?auto_531144 - SURFACE
      ?auto_531145 - SURFACE
      ?auto_531146 - SURFACE
      ?auto_531147 - SURFACE
      ?auto_531148 - SURFACE
      ?auto_531149 - SURFACE
      ?auto_531150 - SURFACE
      ?auto_531151 - SURFACE
    )
    :vars
    (
      ?auto_531155 - HOIST
      ?auto_531156 - PLACE
      ?auto_531153 - PLACE
      ?auto_531152 - HOIST
      ?auto_531154 - SURFACE
      ?auto_531157 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_531155 ?auto_531156 ) ( SURFACE-AT ?auto_531150 ?auto_531156 ) ( CLEAR ?auto_531150 ) ( IS-CRATE ?auto_531151 ) ( not ( = ?auto_531150 ?auto_531151 ) ) ( AVAILABLE ?auto_531155 ) ( ON ?auto_531150 ?auto_531149 ) ( not ( = ?auto_531149 ?auto_531150 ) ) ( not ( = ?auto_531149 ?auto_531151 ) ) ( not ( = ?auto_531153 ?auto_531156 ) ) ( HOIST-AT ?auto_531152 ?auto_531153 ) ( not ( = ?auto_531155 ?auto_531152 ) ) ( AVAILABLE ?auto_531152 ) ( SURFACE-AT ?auto_531151 ?auto_531153 ) ( ON ?auto_531151 ?auto_531154 ) ( CLEAR ?auto_531151 ) ( not ( = ?auto_531150 ?auto_531154 ) ) ( not ( = ?auto_531151 ?auto_531154 ) ) ( not ( = ?auto_531149 ?auto_531154 ) ) ( TRUCK-AT ?auto_531157 ?auto_531156 ) ( ON ?auto_531143 ?auto_531142 ) ( ON ?auto_531144 ?auto_531143 ) ( ON ?auto_531145 ?auto_531144 ) ( ON ?auto_531146 ?auto_531145 ) ( ON ?auto_531147 ?auto_531146 ) ( ON ?auto_531148 ?auto_531147 ) ( ON ?auto_531149 ?auto_531148 ) ( not ( = ?auto_531142 ?auto_531143 ) ) ( not ( = ?auto_531142 ?auto_531144 ) ) ( not ( = ?auto_531142 ?auto_531145 ) ) ( not ( = ?auto_531142 ?auto_531146 ) ) ( not ( = ?auto_531142 ?auto_531147 ) ) ( not ( = ?auto_531142 ?auto_531148 ) ) ( not ( = ?auto_531142 ?auto_531149 ) ) ( not ( = ?auto_531142 ?auto_531150 ) ) ( not ( = ?auto_531142 ?auto_531151 ) ) ( not ( = ?auto_531142 ?auto_531154 ) ) ( not ( = ?auto_531143 ?auto_531144 ) ) ( not ( = ?auto_531143 ?auto_531145 ) ) ( not ( = ?auto_531143 ?auto_531146 ) ) ( not ( = ?auto_531143 ?auto_531147 ) ) ( not ( = ?auto_531143 ?auto_531148 ) ) ( not ( = ?auto_531143 ?auto_531149 ) ) ( not ( = ?auto_531143 ?auto_531150 ) ) ( not ( = ?auto_531143 ?auto_531151 ) ) ( not ( = ?auto_531143 ?auto_531154 ) ) ( not ( = ?auto_531144 ?auto_531145 ) ) ( not ( = ?auto_531144 ?auto_531146 ) ) ( not ( = ?auto_531144 ?auto_531147 ) ) ( not ( = ?auto_531144 ?auto_531148 ) ) ( not ( = ?auto_531144 ?auto_531149 ) ) ( not ( = ?auto_531144 ?auto_531150 ) ) ( not ( = ?auto_531144 ?auto_531151 ) ) ( not ( = ?auto_531144 ?auto_531154 ) ) ( not ( = ?auto_531145 ?auto_531146 ) ) ( not ( = ?auto_531145 ?auto_531147 ) ) ( not ( = ?auto_531145 ?auto_531148 ) ) ( not ( = ?auto_531145 ?auto_531149 ) ) ( not ( = ?auto_531145 ?auto_531150 ) ) ( not ( = ?auto_531145 ?auto_531151 ) ) ( not ( = ?auto_531145 ?auto_531154 ) ) ( not ( = ?auto_531146 ?auto_531147 ) ) ( not ( = ?auto_531146 ?auto_531148 ) ) ( not ( = ?auto_531146 ?auto_531149 ) ) ( not ( = ?auto_531146 ?auto_531150 ) ) ( not ( = ?auto_531146 ?auto_531151 ) ) ( not ( = ?auto_531146 ?auto_531154 ) ) ( not ( = ?auto_531147 ?auto_531148 ) ) ( not ( = ?auto_531147 ?auto_531149 ) ) ( not ( = ?auto_531147 ?auto_531150 ) ) ( not ( = ?auto_531147 ?auto_531151 ) ) ( not ( = ?auto_531147 ?auto_531154 ) ) ( not ( = ?auto_531148 ?auto_531149 ) ) ( not ( = ?auto_531148 ?auto_531150 ) ) ( not ( = ?auto_531148 ?auto_531151 ) ) ( not ( = ?auto_531148 ?auto_531154 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_531149 ?auto_531150 ?auto_531151 )
      ( MAKE-9CRATE-VERIFY ?auto_531142 ?auto_531143 ?auto_531144 ?auto_531145 ?auto_531146 ?auto_531147 ?auto_531148 ?auto_531149 ?auto_531150 ?auto_531151 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_531251 - SURFACE
      ?auto_531252 - SURFACE
      ?auto_531253 - SURFACE
      ?auto_531254 - SURFACE
      ?auto_531255 - SURFACE
      ?auto_531256 - SURFACE
      ?auto_531257 - SURFACE
      ?auto_531258 - SURFACE
      ?auto_531259 - SURFACE
      ?auto_531260 - SURFACE
    )
    :vars
    (
      ?auto_531265 - HOIST
      ?auto_531262 - PLACE
      ?auto_531266 - PLACE
      ?auto_531261 - HOIST
      ?auto_531264 - SURFACE
      ?auto_531263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_531265 ?auto_531262 ) ( IS-CRATE ?auto_531260 ) ( not ( = ?auto_531259 ?auto_531260 ) ) ( not ( = ?auto_531258 ?auto_531259 ) ) ( not ( = ?auto_531258 ?auto_531260 ) ) ( not ( = ?auto_531266 ?auto_531262 ) ) ( HOIST-AT ?auto_531261 ?auto_531266 ) ( not ( = ?auto_531265 ?auto_531261 ) ) ( AVAILABLE ?auto_531261 ) ( SURFACE-AT ?auto_531260 ?auto_531266 ) ( ON ?auto_531260 ?auto_531264 ) ( CLEAR ?auto_531260 ) ( not ( = ?auto_531259 ?auto_531264 ) ) ( not ( = ?auto_531260 ?auto_531264 ) ) ( not ( = ?auto_531258 ?auto_531264 ) ) ( TRUCK-AT ?auto_531263 ?auto_531262 ) ( SURFACE-AT ?auto_531258 ?auto_531262 ) ( CLEAR ?auto_531258 ) ( LIFTING ?auto_531265 ?auto_531259 ) ( IS-CRATE ?auto_531259 ) ( ON ?auto_531252 ?auto_531251 ) ( ON ?auto_531253 ?auto_531252 ) ( ON ?auto_531254 ?auto_531253 ) ( ON ?auto_531255 ?auto_531254 ) ( ON ?auto_531256 ?auto_531255 ) ( ON ?auto_531257 ?auto_531256 ) ( ON ?auto_531258 ?auto_531257 ) ( not ( = ?auto_531251 ?auto_531252 ) ) ( not ( = ?auto_531251 ?auto_531253 ) ) ( not ( = ?auto_531251 ?auto_531254 ) ) ( not ( = ?auto_531251 ?auto_531255 ) ) ( not ( = ?auto_531251 ?auto_531256 ) ) ( not ( = ?auto_531251 ?auto_531257 ) ) ( not ( = ?auto_531251 ?auto_531258 ) ) ( not ( = ?auto_531251 ?auto_531259 ) ) ( not ( = ?auto_531251 ?auto_531260 ) ) ( not ( = ?auto_531251 ?auto_531264 ) ) ( not ( = ?auto_531252 ?auto_531253 ) ) ( not ( = ?auto_531252 ?auto_531254 ) ) ( not ( = ?auto_531252 ?auto_531255 ) ) ( not ( = ?auto_531252 ?auto_531256 ) ) ( not ( = ?auto_531252 ?auto_531257 ) ) ( not ( = ?auto_531252 ?auto_531258 ) ) ( not ( = ?auto_531252 ?auto_531259 ) ) ( not ( = ?auto_531252 ?auto_531260 ) ) ( not ( = ?auto_531252 ?auto_531264 ) ) ( not ( = ?auto_531253 ?auto_531254 ) ) ( not ( = ?auto_531253 ?auto_531255 ) ) ( not ( = ?auto_531253 ?auto_531256 ) ) ( not ( = ?auto_531253 ?auto_531257 ) ) ( not ( = ?auto_531253 ?auto_531258 ) ) ( not ( = ?auto_531253 ?auto_531259 ) ) ( not ( = ?auto_531253 ?auto_531260 ) ) ( not ( = ?auto_531253 ?auto_531264 ) ) ( not ( = ?auto_531254 ?auto_531255 ) ) ( not ( = ?auto_531254 ?auto_531256 ) ) ( not ( = ?auto_531254 ?auto_531257 ) ) ( not ( = ?auto_531254 ?auto_531258 ) ) ( not ( = ?auto_531254 ?auto_531259 ) ) ( not ( = ?auto_531254 ?auto_531260 ) ) ( not ( = ?auto_531254 ?auto_531264 ) ) ( not ( = ?auto_531255 ?auto_531256 ) ) ( not ( = ?auto_531255 ?auto_531257 ) ) ( not ( = ?auto_531255 ?auto_531258 ) ) ( not ( = ?auto_531255 ?auto_531259 ) ) ( not ( = ?auto_531255 ?auto_531260 ) ) ( not ( = ?auto_531255 ?auto_531264 ) ) ( not ( = ?auto_531256 ?auto_531257 ) ) ( not ( = ?auto_531256 ?auto_531258 ) ) ( not ( = ?auto_531256 ?auto_531259 ) ) ( not ( = ?auto_531256 ?auto_531260 ) ) ( not ( = ?auto_531256 ?auto_531264 ) ) ( not ( = ?auto_531257 ?auto_531258 ) ) ( not ( = ?auto_531257 ?auto_531259 ) ) ( not ( = ?auto_531257 ?auto_531260 ) ) ( not ( = ?auto_531257 ?auto_531264 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_531258 ?auto_531259 ?auto_531260 )
      ( MAKE-9CRATE-VERIFY ?auto_531251 ?auto_531252 ?auto_531253 ?auto_531254 ?auto_531255 ?auto_531256 ?auto_531257 ?auto_531258 ?auto_531259 ?auto_531260 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_531360 - SURFACE
      ?auto_531361 - SURFACE
      ?auto_531362 - SURFACE
      ?auto_531363 - SURFACE
      ?auto_531364 - SURFACE
      ?auto_531365 - SURFACE
      ?auto_531366 - SURFACE
      ?auto_531367 - SURFACE
      ?auto_531368 - SURFACE
      ?auto_531369 - SURFACE
    )
    :vars
    (
      ?auto_531373 - HOIST
      ?auto_531375 - PLACE
      ?auto_531372 - PLACE
      ?auto_531370 - HOIST
      ?auto_531371 - SURFACE
      ?auto_531374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_531373 ?auto_531375 ) ( IS-CRATE ?auto_531369 ) ( not ( = ?auto_531368 ?auto_531369 ) ) ( not ( = ?auto_531367 ?auto_531368 ) ) ( not ( = ?auto_531367 ?auto_531369 ) ) ( not ( = ?auto_531372 ?auto_531375 ) ) ( HOIST-AT ?auto_531370 ?auto_531372 ) ( not ( = ?auto_531373 ?auto_531370 ) ) ( AVAILABLE ?auto_531370 ) ( SURFACE-AT ?auto_531369 ?auto_531372 ) ( ON ?auto_531369 ?auto_531371 ) ( CLEAR ?auto_531369 ) ( not ( = ?auto_531368 ?auto_531371 ) ) ( not ( = ?auto_531369 ?auto_531371 ) ) ( not ( = ?auto_531367 ?auto_531371 ) ) ( TRUCK-AT ?auto_531374 ?auto_531375 ) ( SURFACE-AT ?auto_531367 ?auto_531375 ) ( CLEAR ?auto_531367 ) ( IS-CRATE ?auto_531368 ) ( AVAILABLE ?auto_531373 ) ( IN ?auto_531368 ?auto_531374 ) ( ON ?auto_531361 ?auto_531360 ) ( ON ?auto_531362 ?auto_531361 ) ( ON ?auto_531363 ?auto_531362 ) ( ON ?auto_531364 ?auto_531363 ) ( ON ?auto_531365 ?auto_531364 ) ( ON ?auto_531366 ?auto_531365 ) ( ON ?auto_531367 ?auto_531366 ) ( not ( = ?auto_531360 ?auto_531361 ) ) ( not ( = ?auto_531360 ?auto_531362 ) ) ( not ( = ?auto_531360 ?auto_531363 ) ) ( not ( = ?auto_531360 ?auto_531364 ) ) ( not ( = ?auto_531360 ?auto_531365 ) ) ( not ( = ?auto_531360 ?auto_531366 ) ) ( not ( = ?auto_531360 ?auto_531367 ) ) ( not ( = ?auto_531360 ?auto_531368 ) ) ( not ( = ?auto_531360 ?auto_531369 ) ) ( not ( = ?auto_531360 ?auto_531371 ) ) ( not ( = ?auto_531361 ?auto_531362 ) ) ( not ( = ?auto_531361 ?auto_531363 ) ) ( not ( = ?auto_531361 ?auto_531364 ) ) ( not ( = ?auto_531361 ?auto_531365 ) ) ( not ( = ?auto_531361 ?auto_531366 ) ) ( not ( = ?auto_531361 ?auto_531367 ) ) ( not ( = ?auto_531361 ?auto_531368 ) ) ( not ( = ?auto_531361 ?auto_531369 ) ) ( not ( = ?auto_531361 ?auto_531371 ) ) ( not ( = ?auto_531362 ?auto_531363 ) ) ( not ( = ?auto_531362 ?auto_531364 ) ) ( not ( = ?auto_531362 ?auto_531365 ) ) ( not ( = ?auto_531362 ?auto_531366 ) ) ( not ( = ?auto_531362 ?auto_531367 ) ) ( not ( = ?auto_531362 ?auto_531368 ) ) ( not ( = ?auto_531362 ?auto_531369 ) ) ( not ( = ?auto_531362 ?auto_531371 ) ) ( not ( = ?auto_531363 ?auto_531364 ) ) ( not ( = ?auto_531363 ?auto_531365 ) ) ( not ( = ?auto_531363 ?auto_531366 ) ) ( not ( = ?auto_531363 ?auto_531367 ) ) ( not ( = ?auto_531363 ?auto_531368 ) ) ( not ( = ?auto_531363 ?auto_531369 ) ) ( not ( = ?auto_531363 ?auto_531371 ) ) ( not ( = ?auto_531364 ?auto_531365 ) ) ( not ( = ?auto_531364 ?auto_531366 ) ) ( not ( = ?auto_531364 ?auto_531367 ) ) ( not ( = ?auto_531364 ?auto_531368 ) ) ( not ( = ?auto_531364 ?auto_531369 ) ) ( not ( = ?auto_531364 ?auto_531371 ) ) ( not ( = ?auto_531365 ?auto_531366 ) ) ( not ( = ?auto_531365 ?auto_531367 ) ) ( not ( = ?auto_531365 ?auto_531368 ) ) ( not ( = ?auto_531365 ?auto_531369 ) ) ( not ( = ?auto_531365 ?auto_531371 ) ) ( not ( = ?auto_531366 ?auto_531367 ) ) ( not ( = ?auto_531366 ?auto_531368 ) ) ( not ( = ?auto_531366 ?auto_531369 ) ) ( not ( = ?auto_531366 ?auto_531371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_531367 ?auto_531368 ?auto_531369 )
      ( MAKE-9CRATE-VERIFY ?auto_531360 ?auto_531361 ?auto_531362 ?auto_531363 ?auto_531364 ?auto_531365 ?auto_531366 ?auto_531367 ?auto_531368 ?auto_531369 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_536888 - SURFACE
      ?auto_536889 - SURFACE
      ?auto_536890 - SURFACE
      ?auto_536891 - SURFACE
      ?auto_536892 - SURFACE
      ?auto_536893 - SURFACE
      ?auto_536894 - SURFACE
      ?auto_536895 - SURFACE
      ?auto_536896 - SURFACE
      ?auto_536897 - SURFACE
      ?auto_536898 - SURFACE
    )
    :vars
    (
      ?auto_536900 - HOIST
      ?auto_536899 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_536900 ?auto_536899 ) ( SURFACE-AT ?auto_536897 ?auto_536899 ) ( CLEAR ?auto_536897 ) ( LIFTING ?auto_536900 ?auto_536898 ) ( IS-CRATE ?auto_536898 ) ( not ( = ?auto_536897 ?auto_536898 ) ) ( ON ?auto_536889 ?auto_536888 ) ( ON ?auto_536890 ?auto_536889 ) ( ON ?auto_536891 ?auto_536890 ) ( ON ?auto_536892 ?auto_536891 ) ( ON ?auto_536893 ?auto_536892 ) ( ON ?auto_536894 ?auto_536893 ) ( ON ?auto_536895 ?auto_536894 ) ( ON ?auto_536896 ?auto_536895 ) ( ON ?auto_536897 ?auto_536896 ) ( not ( = ?auto_536888 ?auto_536889 ) ) ( not ( = ?auto_536888 ?auto_536890 ) ) ( not ( = ?auto_536888 ?auto_536891 ) ) ( not ( = ?auto_536888 ?auto_536892 ) ) ( not ( = ?auto_536888 ?auto_536893 ) ) ( not ( = ?auto_536888 ?auto_536894 ) ) ( not ( = ?auto_536888 ?auto_536895 ) ) ( not ( = ?auto_536888 ?auto_536896 ) ) ( not ( = ?auto_536888 ?auto_536897 ) ) ( not ( = ?auto_536888 ?auto_536898 ) ) ( not ( = ?auto_536889 ?auto_536890 ) ) ( not ( = ?auto_536889 ?auto_536891 ) ) ( not ( = ?auto_536889 ?auto_536892 ) ) ( not ( = ?auto_536889 ?auto_536893 ) ) ( not ( = ?auto_536889 ?auto_536894 ) ) ( not ( = ?auto_536889 ?auto_536895 ) ) ( not ( = ?auto_536889 ?auto_536896 ) ) ( not ( = ?auto_536889 ?auto_536897 ) ) ( not ( = ?auto_536889 ?auto_536898 ) ) ( not ( = ?auto_536890 ?auto_536891 ) ) ( not ( = ?auto_536890 ?auto_536892 ) ) ( not ( = ?auto_536890 ?auto_536893 ) ) ( not ( = ?auto_536890 ?auto_536894 ) ) ( not ( = ?auto_536890 ?auto_536895 ) ) ( not ( = ?auto_536890 ?auto_536896 ) ) ( not ( = ?auto_536890 ?auto_536897 ) ) ( not ( = ?auto_536890 ?auto_536898 ) ) ( not ( = ?auto_536891 ?auto_536892 ) ) ( not ( = ?auto_536891 ?auto_536893 ) ) ( not ( = ?auto_536891 ?auto_536894 ) ) ( not ( = ?auto_536891 ?auto_536895 ) ) ( not ( = ?auto_536891 ?auto_536896 ) ) ( not ( = ?auto_536891 ?auto_536897 ) ) ( not ( = ?auto_536891 ?auto_536898 ) ) ( not ( = ?auto_536892 ?auto_536893 ) ) ( not ( = ?auto_536892 ?auto_536894 ) ) ( not ( = ?auto_536892 ?auto_536895 ) ) ( not ( = ?auto_536892 ?auto_536896 ) ) ( not ( = ?auto_536892 ?auto_536897 ) ) ( not ( = ?auto_536892 ?auto_536898 ) ) ( not ( = ?auto_536893 ?auto_536894 ) ) ( not ( = ?auto_536893 ?auto_536895 ) ) ( not ( = ?auto_536893 ?auto_536896 ) ) ( not ( = ?auto_536893 ?auto_536897 ) ) ( not ( = ?auto_536893 ?auto_536898 ) ) ( not ( = ?auto_536894 ?auto_536895 ) ) ( not ( = ?auto_536894 ?auto_536896 ) ) ( not ( = ?auto_536894 ?auto_536897 ) ) ( not ( = ?auto_536894 ?auto_536898 ) ) ( not ( = ?auto_536895 ?auto_536896 ) ) ( not ( = ?auto_536895 ?auto_536897 ) ) ( not ( = ?auto_536895 ?auto_536898 ) ) ( not ( = ?auto_536896 ?auto_536897 ) ) ( not ( = ?auto_536896 ?auto_536898 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_536897 ?auto_536898 )
      ( MAKE-10CRATE-VERIFY ?auto_536888 ?auto_536889 ?auto_536890 ?auto_536891 ?auto_536892 ?auto_536893 ?auto_536894 ?auto_536895 ?auto_536896 ?auto_536897 ?auto_536898 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_536982 - SURFACE
      ?auto_536983 - SURFACE
      ?auto_536984 - SURFACE
      ?auto_536985 - SURFACE
      ?auto_536986 - SURFACE
      ?auto_536987 - SURFACE
      ?auto_536988 - SURFACE
      ?auto_536989 - SURFACE
      ?auto_536990 - SURFACE
      ?auto_536991 - SURFACE
      ?auto_536992 - SURFACE
    )
    :vars
    (
      ?auto_536993 - HOIST
      ?auto_536994 - PLACE
      ?auto_536995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_536993 ?auto_536994 ) ( SURFACE-AT ?auto_536991 ?auto_536994 ) ( CLEAR ?auto_536991 ) ( IS-CRATE ?auto_536992 ) ( not ( = ?auto_536991 ?auto_536992 ) ) ( TRUCK-AT ?auto_536995 ?auto_536994 ) ( AVAILABLE ?auto_536993 ) ( IN ?auto_536992 ?auto_536995 ) ( ON ?auto_536991 ?auto_536990 ) ( not ( = ?auto_536990 ?auto_536991 ) ) ( not ( = ?auto_536990 ?auto_536992 ) ) ( ON ?auto_536983 ?auto_536982 ) ( ON ?auto_536984 ?auto_536983 ) ( ON ?auto_536985 ?auto_536984 ) ( ON ?auto_536986 ?auto_536985 ) ( ON ?auto_536987 ?auto_536986 ) ( ON ?auto_536988 ?auto_536987 ) ( ON ?auto_536989 ?auto_536988 ) ( ON ?auto_536990 ?auto_536989 ) ( not ( = ?auto_536982 ?auto_536983 ) ) ( not ( = ?auto_536982 ?auto_536984 ) ) ( not ( = ?auto_536982 ?auto_536985 ) ) ( not ( = ?auto_536982 ?auto_536986 ) ) ( not ( = ?auto_536982 ?auto_536987 ) ) ( not ( = ?auto_536982 ?auto_536988 ) ) ( not ( = ?auto_536982 ?auto_536989 ) ) ( not ( = ?auto_536982 ?auto_536990 ) ) ( not ( = ?auto_536982 ?auto_536991 ) ) ( not ( = ?auto_536982 ?auto_536992 ) ) ( not ( = ?auto_536983 ?auto_536984 ) ) ( not ( = ?auto_536983 ?auto_536985 ) ) ( not ( = ?auto_536983 ?auto_536986 ) ) ( not ( = ?auto_536983 ?auto_536987 ) ) ( not ( = ?auto_536983 ?auto_536988 ) ) ( not ( = ?auto_536983 ?auto_536989 ) ) ( not ( = ?auto_536983 ?auto_536990 ) ) ( not ( = ?auto_536983 ?auto_536991 ) ) ( not ( = ?auto_536983 ?auto_536992 ) ) ( not ( = ?auto_536984 ?auto_536985 ) ) ( not ( = ?auto_536984 ?auto_536986 ) ) ( not ( = ?auto_536984 ?auto_536987 ) ) ( not ( = ?auto_536984 ?auto_536988 ) ) ( not ( = ?auto_536984 ?auto_536989 ) ) ( not ( = ?auto_536984 ?auto_536990 ) ) ( not ( = ?auto_536984 ?auto_536991 ) ) ( not ( = ?auto_536984 ?auto_536992 ) ) ( not ( = ?auto_536985 ?auto_536986 ) ) ( not ( = ?auto_536985 ?auto_536987 ) ) ( not ( = ?auto_536985 ?auto_536988 ) ) ( not ( = ?auto_536985 ?auto_536989 ) ) ( not ( = ?auto_536985 ?auto_536990 ) ) ( not ( = ?auto_536985 ?auto_536991 ) ) ( not ( = ?auto_536985 ?auto_536992 ) ) ( not ( = ?auto_536986 ?auto_536987 ) ) ( not ( = ?auto_536986 ?auto_536988 ) ) ( not ( = ?auto_536986 ?auto_536989 ) ) ( not ( = ?auto_536986 ?auto_536990 ) ) ( not ( = ?auto_536986 ?auto_536991 ) ) ( not ( = ?auto_536986 ?auto_536992 ) ) ( not ( = ?auto_536987 ?auto_536988 ) ) ( not ( = ?auto_536987 ?auto_536989 ) ) ( not ( = ?auto_536987 ?auto_536990 ) ) ( not ( = ?auto_536987 ?auto_536991 ) ) ( not ( = ?auto_536987 ?auto_536992 ) ) ( not ( = ?auto_536988 ?auto_536989 ) ) ( not ( = ?auto_536988 ?auto_536990 ) ) ( not ( = ?auto_536988 ?auto_536991 ) ) ( not ( = ?auto_536988 ?auto_536992 ) ) ( not ( = ?auto_536989 ?auto_536990 ) ) ( not ( = ?auto_536989 ?auto_536991 ) ) ( not ( = ?auto_536989 ?auto_536992 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_536990 ?auto_536991 ?auto_536992 )
      ( MAKE-10CRATE-VERIFY ?auto_536982 ?auto_536983 ?auto_536984 ?auto_536985 ?auto_536986 ?auto_536987 ?auto_536988 ?auto_536989 ?auto_536990 ?auto_536991 ?auto_536992 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_537087 - SURFACE
      ?auto_537088 - SURFACE
      ?auto_537089 - SURFACE
      ?auto_537090 - SURFACE
      ?auto_537091 - SURFACE
      ?auto_537092 - SURFACE
      ?auto_537093 - SURFACE
      ?auto_537094 - SURFACE
      ?auto_537095 - SURFACE
      ?auto_537096 - SURFACE
      ?auto_537097 - SURFACE
    )
    :vars
    (
      ?auto_537100 - HOIST
      ?auto_537098 - PLACE
      ?auto_537101 - TRUCK
      ?auto_537099 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_537100 ?auto_537098 ) ( SURFACE-AT ?auto_537096 ?auto_537098 ) ( CLEAR ?auto_537096 ) ( IS-CRATE ?auto_537097 ) ( not ( = ?auto_537096 ?auto_537097 ) ) ( AVAILABLE ?auto_537100 ) ( IN ?auto_537097 ?auto_537101 ) ( ON ?auto_537096 ?auto_537095 ) ( not ( = ?auto_537095 ?auto_537096 ) ) ( not ( = ?auto_537095 ?auto_537097 ) ) ( TRUCK-AT ?auto_537101 ?auto_537099 ) ( not ( = ?auto_537099 ?auto_537098 ) ) ( ON ?auto_537088 ?auto_537087 ) ( ON ?auto_537089 ?auto_537088 ) ( ON ?auto_537090 ?auto_537089 ) ( ON ?auto_537091 ?auto_537090 ) ( ON ?auto_537092 ?auto_537091 ) ( ON ?auto_537093 ?auto_537092 ) ( ON ?auto_537094 ?auto_537093 ) ( ON ?auto_537095 ?auto_537094 ) ( not ( = ?auto_537087 ?auto_537088 ) ) ( not ( = ?auto_537087 ?auto_537089 ) ) ( not ( = ?auto_537087 ?auto_537090 ) ) ( not ( = ?auto_537087 ?auto_537091 ) ) ( not ( = ?auto_537087 ?auto_537092 ) ) ( not ( = ?auto_537087 ?auto_537093 ) ) ( not ( = ?auto_537087 ?auto_537094 ) ) ( not ( = ?auto_537087 ?auto_537095 ) ) ( not ( = ?auto_537087 ?auto_537096 ) ) ( not ( = ?auto_537087 ?auto_537097 ) ) ( not ( = ?auto_537088 ?auto_537089 ) ) ( not ( = ?auto_537088 ?auto_537090 ) ) ( not ( = ?auto_537088 ?auto_537091 ) ) ( not ( = ?auto_537088 ?auto_537092 ) ) ( not ( = ?auto_537088 ?auto_537093 ) ) ( not ( = ?auto_537088 ?auto_537094 ) ) ( not ( = ?auto_537088 ?auto_537095 ) ) ( not ( = ?auto_537088 ?auto_537096 ) ) ( not ( = ?auto_537088 ?auto_537097 ) ) ( not ( = ?auto_537089 ?auto_537090 ) ) ( not ( = ?auto_537089 ?auto_537091 ) ) ( not ( = ?auto_537089 ?auto_537092 ) ) ( not ( = ?auto_537089 ?auto_537093 ) ) ( not ( = ?auto_537089 ?auto_537094 ) ) ( not ( = ?auto_537089 ?auto_537095 ) ) ( not ( = ?auto_537089 ?auto_537096 ) ) ( not ( = ?auto_537089 ?auto_537097 ) ) ( not ( = ?auto_537090 ?auto_537091 ) ) ( not ( = ?auto_537090 ?auto_537092 ) ) ( not ( = ?auto_537090 ?auto_537093 ) ) ( not ( = ?auto_537090 ?auto_537094 ) ) ( not ( = ?auto_537090 ?auto_537095 ) ) ( not ( = ?auto_537090 ?auto_537096 ) ) ( not ( = ?auto_537090 ?auto_537097 ) ) ( not ( = ?auto_537091 ?auto_537092 ) ) ( not ( = ?auto_537091 ?auto_537093 ) ) ( not ( = ?auto_537091 ?auto_537094 ) ) ( not ( = ?auto_537091 ?auto_537095 ) ) ( not ( = ?auto_537091 ?auto_537096 ) ) ( not ( = ?auto_537091 ?auto_537097 ) ) ( not ( = ?auto_537092 ?auto_537093 ) ) ( not ( = ?auto_537092 ?auto_537094 ) ) ( not ( = ?auto_537092 ?auto_537095 ) ) ( not ( = ?auto_537092 ?auto_537096 ) ) ( not ( = ?auto_537092 ?auto_537097 ) ) ( not ( = ?auto_537093 ?auto_537094 ) ) ( not ( = ?auto_537093 ?auto_537095 ) ) ( not ( = ?auto_537093 ?auto_537096 ) ) ( not ( = ?auto_537093 ?auto_537097 ) ) ( not ( = ?auto_537094 ?auto_537095 ) ) ( not ( = ?auto_537094 ?auto_537096 ) ) ( not ( = ?auto_537094 ?auto_537097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537095 ?auto_537096 ?auto_537097 )
      ( MAKE-10CRATE-VERIFY ?auto_537087 ?auto_537088 ?auto_537089 ?auto_537090 ?auto_537091 ?auto_537092 ?auto_537093 ?auto_537094 ?auto_537095 ?auto_537096 ?auto_537097 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_537202 - SURFACE
      ?auto_537203 - SURFACE
      ?auto_537204 - SURFACE
      ?auto_537205 - SURFACE
      ?auto_537206 - SURFACE
      ?auto_537207 - SURFACE
      ?auto_537208 - SURFACE
      ?auto_537209 - SURFACE
      ?auto_537210 - SURFACE
      ?auto_537211 - SURFACE
      ?auto_537212 - SURFACE
    )
    :vars
    (
      ?auto_537214 - HOIST
      ?auto_537215 - PLACE
      ?auto_537217 - TRUCK
      ?auto_537216 - PLACE
      ?auto_537213 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_537214 ?auto_537215 ) ( SURFACE-AT ?auto_537211 ?auto_537215 ) ( CLEAR ?auto_537211 ) ( IS-CRATE ?auto_537212 ) ( not ( = ?auto_537211 ?auto_537212 ) ) ( AVAILABLE ?auto_537214 ) ( ON ?auto_537211 ?auto_537210 ) ( not ( = ?auto_537210 ?auto_537211 ) ) ( not ( = ?auto_537210 ?auto_537212 ) ) ( TRUCK-AT ?auto_537217 ?auto_537216 ) ( not ( = ?auto_537216 ?auto_537215 ) ) ( HOIST-AT ?auto_537213 ?auto_537216 ) ( LIFTING ?auto_537213 ?auto_537212 ) ( not ( = ?auto_537214 ?auto_537213 ) ) ( ON ?auto_537203 ?auto_537202 ) ( ON ?auto_537204 ?auto_537203 ) ( ON ?auto_537205 ?auto_537204 ) ( ON ?auto_537206 ?auto_537205 ) ( ON ?auto_537207 ?auto_537206 ) ( ON ?auto_537208 ?auto_537207 ) ( ON ?auto_537209 ?auto_537208 ) ( ON ?auto_537210 ?auto_537209 ) ( not ( = ?auto_537202 ?auto_537203 ) ) ( not ( = ?auto_537202 ?auto_537204 ) ) ( not ( = ?auto_537202 ?auto_537205 ) ) ( not ( = ?auto_537202 ?auto_537206 ) ) ( not ( = ?auto_537202 ?auto_537207 ) ) ( not ( = ?auto_537202 ?auto_537208 ) ) ( not ( = ?auto_537202 ?auto_537209 ) ) ( not ( = ?auto_537202 ?auto_537210 ) ) ( not ( = ?auto_537202 ?auto_537211 ) ) ( not ( = ?auto_537202 ?auto_537212 ) ) ( not ( = ?auto_537203 ?auto_537204 ) ) ( not ( = ?auto_537203 ?auto_537205 ) ) ( not ( = ?auto_537203 ?auto_537206 ) ) ( not ( = ?auto_537203 ?auto_537207 ) ) ( not ( = ?auto_537203 ?auto_537208 ) ) ( not ( = ?auto_537203 ?auto_537209 ) ) ( not ( = ?auto_537203 ?auto_537210 ) ) ( not ( = ?auto_537203 ?auto_537211 ) ) ( not ( = ?auto_537203 ?auto_537212 ) ) ( not ( = ?auto_537204 ?auto_537205 ) ) ( not ( = ?auto_537204 ?auto_537206 ) ) ( not ( = ?auto_537204 ?auto_537207 ) ) ( not ( = ?auto_537204 ?auto_537208 ) ) ( not ( = ?auto_537204 ?auto_537209 ) ) ( not ( = ?auto_537204 ?auto_537210 ) ) ( not ( = ?auto_537204 ?auto_537211 ) ) ( not ( = ?auto_537204 ?auto_537212 ) ) ( not ( = ?auto_537205 ?auto_537206 ) ) ( not ( = ?auto_537205 ?auto_537207 ) ) ( not ( = ?auto_537205 ?auto_537208 ) ) ( not ( = ?auto_537205 ?auto_537209 ) ) ( not ( = ?auto_537205 ?auto_537210 ) ) ( not ( = ?auto_537205 ?auto_537211 ) ) ( not ( = ?auto_537205 ?auto_537212 ) ) ( not ( = ?auto_537206 ?auto_537207 ) ) ( not ( = ?auto_537206 ?auto_537208 ) ) ( not ( = ?auto_537206 ?auto_537209 ) ) ( not ( = ?auto_537206 ?auto_537210 ) ) ( not ( = ?auto_537206 ?auto_537211 ) ) ( not ( = ?auto_537206 ?auto_537212 ) ) ( not ( = ?auto_537207 ?auto_537208 ) ) ( not ( = ?auto_537207 ?auto_537209 ) ) ( not ( = ?auto_537207 ?auto_537210 ) ) ( not ( = ?auto_537207 ?auto_537211 ) ) ( not ( = ?auto_537207 ?auto_537212 ) ) ( not ( = ?auto_537208 ?auto_537209 ) ) ( not ( = ?auto_537208 ?auto_537210 ) ) ( not ( = ?auto_537208 ?auto_537211 ) ) ( not ( = ?auto_537208 ?auto_537212 ) ) ( not ( = ?auto_537209 ?auto_537210 ) ) ( not ( = ?auto_537209 ?auto_537211 ) ) ( not ( = ?auto_537209 ?auto_537212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537210 ?auto_537211 ?auto_537212 )
      ( MAKE-10CRATE-VERIFY ?auto_537202 ?auto_537203 ?auto_537204 ?auto_537205 ?auto_537206 ?auto_537207 ?auto_537208 ?auto_537209 ?auto_537210 ?auto_537211 ?auto_537212 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_537327 - SURFACE
      ?auto_537328 - SURFACE
      ?auto_537329 - SURFACE
      ?auto_537330 - SURFACE
      ?auto_537331 - SURFACE
      ?auto_537332 - SURFACE
      ?auto_537333 - SURFACE
      ?auto_537334 - SURFACE
      ?auto_537335 - SURFACE
      ?auto_537336 - SURFACE
      ?auto_537337 - SURFACE
    )
    :vars
    (
      ?auto_537341 - HOIST
      ?auto_537338 - PLACE
      ?auto_537339 - TRUCK
      ?auto_537343 - PLACE
      ?auto_537340 - HOIST
      ?auto_537342 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_537341 ?auto_537338 ) ( SURFACE-AT ?auto_537336 ?auto_537338 ) ( CLEAR ?auto_537336 ) ( IS-CRATE ?auto_537337 ) ( not ( = ?auto_537336 ?auto_537337 ) ) ( AVAILABLE ?auto_537341 ) ( ON ?auto_537336 ?auto_537335 ) ( not ( = ?auto_537335 ?auto_537336 ) ) ( not ( = ?auto_537335 ?auto_537337 ) ) ( TRUCK-AT ?auto_537339 ?auto_537343 ) ( not ( = ?auto_537343 ?auto_537338 ) ) ( HOIST-AT ?auto_537340 ?auto_537343 ) ( not ( = ?auto_537341 ?auto_537340 ) ) ( AVAILABLE ?auto_537340 ) ( SURFACE-AT ?auto_537337 ?auto_537343 ) ( ON ?auto_537337 ?auto_537342 ) ( CLEAR ?auto_537337 ) ( not ( = ?auto_537336 ?auto_537342 ) ) ( not ( = ?auto_537337 ?auto_537342 ) ) ( not ( = ?auto_537335 ?auto_537342 ) ) ( ON ?auto_537328 ?auto_537327 ) ( ON ?auto_537329 ?auto_537328 ) ( ON ?auto_537330 ?auto_537329 ) ( ON ?auto_537331 ?auto_537330 ) ( ON ?auto_537332 ?auto_537331 ) ( ON ?auto_537333 ?auto_537332 ) ( ON ?auto_537334 ?auto_537333 ) ( ON ?auto_537335 ?auto_537334 ) ( not ( = ?auto_537327 ?auto_537328 ) ) ( not ( = ?auto_537327 ?auto_537329 ) ) ( not ( = ?auto_537327 ?auto_537330 ) ) ( not ( = ?auto_537327 ?auto_537331 ) ) ( not ( = ?auto_537327 ?auto_537332 ) ) ( not ( = ?auto_537327 ?auto_537333 ) ) ( not ( = ?auto_537327 ?auto_537334 ) ) ( not ( = ?auto_537327 ?auto_537335 ) ) ( not ( = ?auto_537327 ?auto_537336 ) ) ( not ( = ?auto_537327 ?auto_537337 ) ) ( not ( = ?auto_537327 ?auto_537342 ) ) ( not ( = ?auto_537328 ?auto_537329 ) ) ( not ( = ?auto_537328 ?auto_537330 ) ) ( not ( = ?auto_537328 ?auto_537331 ) ) ( not ( = ?auto_537328 ?auto_537332 ) ) ( not ( = ?auto_537328 ?auto_537333 ) ) ( not ( = ?auto_537328 ?auto_537334 ) ) ( not ( = ?auto_537328 ?auto_537335 ) ) ( not ( = ?auto_537328 ?auto_537336 ) ) ( not ( = ?auto_537328 ?auto_537337 ) ) ( not ( = ?auto_537328 ?auto_537342 ) ) ( not ( = ?auto_537329 ?auto_537330 ) ) ( not ( = ?auto_537329 ?auto_537331 ) ) ( not ( = ?auto_537329 ?auto_537332 ) ) ( not ( = ?auto_537329 ?auto_537333 ) ) ( not ( = ?auto_537329 ?auto_537334 ) ) ( not ( = ?auto_537329 ?auto_537335 ) ) ( not ( = ?auto_537329 ?auto_537336 ) ) ( not ( = ?auto_537329 ?auto_537337 ) ) ( not ( = ?auto_537329 ?auto_537342 ) ) ( not ( = ?auto_537330 ?auto_537331 ) ) ( not ( = ?auto_537330 ?auto_537332 ) ) ( not ( = ?auto_537330 ?auto_537333 ) ) ( not ( = ?auto_537330 ?auto_537334 ) ) ( not ( = ?auto_537330 ?auto_537335 ) ) ( not ( = ?auto_537330 ?auto_537336 ) ) ( not ( = ?auto_537330 ?auto_537337 ) ) ( not ( = ?auto_537330 ?auto_537342 ) ) ( not ( = ?auto_537331 ?auto_537332 ) ) ( not ( = ?auto_537331 ?auto_537333 ) ) ( not ( = ?auto_537331 ?auto_537334 ) ) ( not ( = ?auto_537331 ?auto_537335 ) ) ( not ( = ?auto_537331 ?auto_537336 ) ) ( not ( = ?auto_537331 ?auto_537337 ) ) ( not ( = ?auto_537331 ?auto_537342 ) ) ( not ( = ?auto_537332 ?auto_537333 ) ) ( not ( = ?auto_537332 ?auto_537334 ) ) ( not ( = ?auto_537332 ?auto_537335 ) ) ( not ( = ?auto_537332 ?auto_537336 ) ) ( not ( = ?auto_537332 ?auto_537337 ) ) ( not ( = ?auto_537332 ?auto_537342 ) ) ( not ( = ?auto_537333 ?auto_537334 ) ) ( not ( = ?auto_537333 ?auto_537335 ) ) ( not ( = ?auto_537333 ?auto_537336 ) ) ( not ( = ?auto_537333 ?auto_537337 ) ) ( not ( = ?auto_537333 ?auto_537342 ) ) ( not ( = ?auto_537334 ?auto_537335 ) ) ( not ( = ?auto_537334 ?auto_537336 ) ) ( not ( = ?auto_537334 ?auto_537337 ) ) ( not ( = ?auto_537334 ?auto_537342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537335 ?auto_537336 ?auto_537337 )
      ( MAKE-10CRATE-VERIFY ?auto_537327 ?auto_537328 ?auto_537329 ?auto_537330 ?auto_537331 ?auto_537332 ?auto_537333 ?auto_537334 ?auto_537335 ?auto_537336 ?auto_537337 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_537453 - SURFACE
      ?auto_537454 - SURFACE
      ?auto_537455 - SURFACE
      ?auto_537456 - SURFACE
      ?auto_537457 - SURFACE
      ?auto_537458 - SURFACE
      ?auto_537459 - SURFACE
      ?auto_537460 - SURFACE
      ?auto_537461 - SURFACE
      ?auto_537462 - SURFACE
      ?auto_537463 - SURFACE
    )
    :vars
    (
      ?auto_537464 - HOIST
      ?auto_537469 - PLACE
      ?auto_537465 - PLACE
      ?auto_537467 - HOIST
      ?auto_537466 - SURFACE
      ?auto_537468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_537464 ?auto_537469 ) ( SURFACE-AT ?auto_537462 ?auto_537469 ) ( CLEAR ?auto_537462 ) ( IS-CRATE ?auto_537463 ) ( not ( = ?auto_537462 ?auto_537463 ) ) ( AVAILABLE ?auto_537464 ) ( ON ?auto_537462 ?auto_537461 ) ( not ( = ?auto_537461 ?auto_537462 ) ) ( not ( = ?auto_537461 ?auto_537463 ) ) ( not ( = ?auto_537465 ?auto_537469 ) ) ( HOIST-AT ?auto_537467 ?auto_537465 ) ( not ( = ?auto_537464 ?auto_537467 ) ) ( AVAILABLE ?auto_537467 ) ( SURFACE-AT ?auto_537463 ?auto_537465 ) ( ON ?auto_537463 ?auto_537466 ) ( CLEAR ?auto_537463 ) ( not ( = ?auto_537462 ?auto_537466 ) ) ( not ( = ?auto_537463 ?auto_537466 ) ) ( not ( = ?auto_537461 ?auto_537466 ) ) ( TRUCK-AT ?auto_537468 ?auto_537469 ) ( ON ?auto_537454 ?auto_537453 ) ( ON ?auto_537455 ?auto_537454 ) ( ON ?auto_537456 ?auto_537455 ) ( ON ?auto_537457 ?auto_537456 ) ( ON ?auto_537458 ?auto_537457 ) ( ON ?auto_537459 ?auto_537458 ) ( ON ?auto_537460 ?auto_537459 ) ( ON ?auto_537461 ?auto_537460 ) ( not ( = ?auto_537453 ?auto_537454 ) ) ( not ( = ?auto_537453 ?auto_537455 ) ) ( not ( = ?auto_537453 ?auto_537456 ) ) ( not ( = ?auto_537453 ?auto_537457 ) ) ( not ( = ?auto_537453 ?auto_537458 ) ) ( not ( = ?auto_537453 ?auto_537459 ) ) ( not ( = ?auto_537453 ?auto_537460 ) ) ( not ( = ?auto_537453 ?auto_537461 ) ) ( not ( = ?auto_537453 ?auto_537462 ) ) ( not ( = ?auto_537453 ?auto_537463 ) ) ( not ( = ?auto_537453 ?auto_537466 ) ) ( not ( = ?auto_537454 ?auto_537455 ) ) ( not ( = ?auto_537454 ?auto_537456 ) ) ( not ( = ?auto_537454 ?auto_537457 ) ) ( not ( = ?auto_537454 ?auto_537458 ) ) ( not ( = ?auto_537454 ?auto_537459 ) ) ( not ( = ?auto_537454 ?auto_537460 ) ) ( not ( = ?auto_537454 ?auto_537461 ) ) ( not ( = ?auto_537454 ?auto_537462 ) ) ( not ( = ?auto_537454 ?auto_537463 ) ) ( not ( = ?auto_537454 ?auto_537466 ) ) ( not ( = ?auto_537455 ?auto_537456 ) ) ( not ( = ?auto_537455 ?auto_537457 ) ) ( not ( = ?auto_537455 ?auto_537458 ) ) ( not ( = ?auto_537455 ?auto_537459 ) ) ( not ( = ?auto_537455 ?auto_537460 ) ) ( not ( = ?auto_537455 ?auto_537461 ) ) ( not ( = ?auto_537455 ?auto_537462 ) ) ( not ( = ?auto_537455 ?auto_537463 ) ) ( not ( = ?auto_537455 ?auto_537466 ) ) ( not ( = ?auto_537456 ?auto_537457 ) ) ( not ( = ?auto_537456 ?auto_537458 ) ) ( not ( = ?auto_537456 ?auto_537459 ) ) ( not ( = ?auto_537456 ?auto_537460 ) ) ( not ( = ?auto_537456 ?auto_537461 ) ) ( not ( = ?auto_537456 ?auto_537462 ) ) ( not ( = ?auto_537456 ?auto_537463 ) ) ( not ( = ?auto_537456 ?auto_537466 ) ) ( not ( = ?auto_537457 ?auto_537458 ) ) ( not ( = ?auto_537457 ?auto_537459 ) ) ( not ( = ?auto_537457 ?auto_537460 ) ) ( not ( = ?auto_537457 ?auto_537461 ) ) ( not ( = ?auto_537457 ?auto_537462 ) ) ( not ( = ?auto_537457 ?auto_537463 ) ) ( not ( = ?auto_537457 ?auto_537466 ) ) ( not ( = ?auto_537458 ?auto_537459 ) ) ( not ( = ?auto_537458 ?auto_537460 ) ) ( not ( = ?auto_537458 ?auto_537461 ) ) ( not ( = ?auto_537458 ?auto_537462 ) ) ( not ( = ?auto_537458 ?auto_537463 ) ) ( not ( = ?auto_537458 ?auto_537466 ) ) ( not ( = ?auto_537459 ?auto_537460 ) ) ( not ( = ?auto_537459 ?auto_537461 ) ) ( not ( = ?auto_537459 ?auto_537462 ) ) ( not ( = ?auto_537459 ?auto_537463 ) ) ( not ( = ?auto_537459 ?auto_537466 ) ) ( not ( = ?auto_537460 ?auto_537461 ) ) ( not ( = ?auto_537460 ?auto_537462 ) ) ( not ( = ?auto_537460 ?auto_537463 ) ) ( not ( = ?auto_537460 ?auto_537466 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537461 ?auto_537462 ?auto_537463 )
      ( MAKE-10CRATE-VERIFY ?auto_537453 ?auto_537454 ?auto_537455 ?auto_537456 ?auto_537457 ?auto_537458 ?auto_537459 ?auto_537460 ?auto_537461 ?auto_537462 ?auto_537463 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_537579 - SURFACE
      ?auto_537580 - SURFACE
      ?auto_537581 - SURFACE
      ?auto_537582 - SURFACE
      ?auto_537583 - SURFACE
      ?auto_537584 - SURFACE
      ?auto_537585 - SURFACE
      ?auto_537586 - SURFACE
      ?auto_537587 - SURFACE
      ?auto_537588 - SURFACE
      ?auto_537589 - SURFACE
    )
    :vars
    (
      ?auto_537594 - HOIST
      ?auto_537591 - PLACE
      ?auto_537590 - PLACE
      ?auto_537592 - HOIST
      ?auto_537593 - SURFACE
      ?auto_537595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_537594 ?auto_537591 ) ( IS-CRATE ?auto_537589 ) ( not ( = ?auto_537588 ?auto_537589 ) ) ( not ( = ?auto_537587 ?auto_537588 ) ) ( not ( = ?auto_537587 ?auto_537589 ) ) ( not ( = ?auto_537590 ?auto_537591 ) ) ( HOIST-AT ?auto_537592 ?auto_537590 ) ( not ( = ?auto_537594 ?auto_537592 ) ) ( AVAILABLE ?auto_537592 ) ( SURFACE-AT ?auto_537589 ?auto_537590 ) ( ON ?auto_537589 ?auto_537593 ) ( CLEAR ?auto_537589 ) ( not ( = ?auto_537588 ?auto_537593 ) ) ( not ( = ?auto_537589 ?auto_537593 ) ) ( not ( = ?auto_537587 ?auto_537593 ) ) ( TRUCK-AT ?auto_537595 ?auto_537591 ) ( SURFACE-AT ?auto_537587 ?auto_537591 ) ( CLEAR ?auto_537587 ) ( LIFTING ?auto_537594 ?auto_537588 ) ( IS-CRATE ?auto_537588 ) ( ON ?auto_537580 ?auto_537579 ) ( ON ?auto_537581 ?auto_537580 ) ( ON ?auto_537582 ?auto_537581 ) ( ON ?auto_537583 ?auto_537582 ) ( ON ?auto_537584 ?auto_537583 ) ( ON ?auto_537585 ?auto_537584 ) ( ON ?auto_537586 ?auto_537585 ) ( ON ?auto_537587 ?auto_537586 ) ( not ( = ?auto_537579 ?auto_537580 ) ) ( not ( = ?auto_537579 ?auto_537581 ) ) ( not ( = ?auto_537579 ?auto_537582 ) ) ( not ( = ?auto_537579 ?auto_537583 ) ) ( not ( = ?auto_537579 ?auto_537584 ) ) ( not ( = ?auto_537579 ?auto_537585 ) ) ( not ( = ?auto_537579 ?auto_537586 ) ) ( not ( = ?auto_537579 ?auto_537587 ) ) ( not ( = ?auto_537579 ?auto_537588 ) ) ( not ( = ?auto_537579 ?auto_537589 ) ) ( not ( = ?auto_537579 ?auto_537593 ) ) ( not ( = ?auto_537580 ?auto_537581 ) ) ( not ( = ?auto_537580 ?auto_537582 ) ) ( not ( = ?auto_537580 ?auto_537583 ) ) ( not ( = ?auto_537580 ?auto_537584 ) ) ( not ( = ?auto_537580 ?auto_537585 ) ) ( not ( = ?auto_537580 ?auto_537586 ) ) ( not ( = ?auto_537580 ?auto_537587 ) ) ( not ( = ?auto_537580 ?auto_537588 ) ) ( not ( = ?auto_537580 ?auto_537589 ) ) ( not ( = ?auto_537580 ?auto_537593 ) ) ( not ( = ?auto_537581 ?auto_537582 ) ) ( not ( = ?auto_537581 ?auto_537583 ) ) ( not ( = ?auto_537581 ?auto_537584 ) ) ( not ( = ?auto_537581 ?auto_537585 ) ) ( not ( = ?auto_537581 ?auto_537586 ) ) ( not ( = ?auto_537581 ?auto_537587 ) ) ( not ( = ?auto_537581 ?auto_537588 ) ) ( not ( = ?auto_537581 ?auto_537589 ) ) ( not ( = ?auto_537581 ?auto_537593 ) ) ( not ( = ?auto_537582 ?auto_537583 ) ) ( not ( = ?auto_537582 ?auto_537584 ) ) ( not ( = ?auto_537582 ?auto_537585 ) ) ( not ( = ?auto_537582 ?auto_537586 ) ) ( not ( = ?auto_537582 ?auto_537587 ) ) ( not ( = ?auto_537582 ?auto_537588 ) ) ( not ( = ?auto_537582 ?auto_537589 ) ) ( not ( = ?auto_537582 ?auto_537593 ) ) ( not ( = ?auto_537583 ?auto_537584 ) ) ( not ( = ?auto_537583 ?auto_537585 ) ) ( not ( = ?auto_537583 ?auto_537586 ) ) ( not ( = ?auto_537583 ?auto_537587 ) ) ( not ( = ?auto_537583 ?auto_537588 ) ) ( not ( = ?auto_537583 ?auto_537589 ) ) ( not ( = ?auto_537583 ?auto_537593 ) ) ( not ( = ?auto_537584 ?auto_537585 ) ) ( not ( = ?auto_537584 ?auto_537586 ) ) ( not ( = ?auto_537584 ?auto_537587 ) ) ( not ( = ?auto_537584 ?auto_537588 ) ) ( not ( = ?auto_537584 ?auto_537589 ) ) ( not ( = ?auto_537584 ?auto_537593 ) ) ( not ( = ?auto_537585 ?auto_537586 ) ) ( not ( = ?auto_537585 ?auto_537587 ) ) ( not ( = ?auto_537585 ?auto_537588 ) ) ( not ( = ?auto_537585 ?auto_537589 ) ) ( not ( = ?auto_537585 ?auto_537593 ) ) ( not ( = ?auto_537586 ?auto_537587 ) ) ( not ( = ?auto_537586 ?auto_537588 ) ) ( not ( = ?auto_537586 ?auto_537589 ) ) ( not ( = ?auto_537586 ?auto_537593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537587 ?auto_537588 ?auto_537589 )
      ( MAKE-10CRATE-VERIFY ?auto_537579 ?auto_537580 ?auto_537581 ?auto_537582 ?auto_537583 ?auto_537584 ?auto_537585 ?auto_537586 ?auto_537587 ?auto_537588 ?auto_537589 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_537705 - SURFACE
      ?auto_537706 - SURFACE
      ?auto_537707 - SURFACE
      ?auto_537708 - SURFACE
      ?auto_537709 - SURFACE
      ?auto_537710 - SURFACE
      ?auto_537711 - SURFACE
      ?auto_537712 - SURFACE
      ?auto_537713 - SURFACE
      ?auto_537714 - SURFACE
      ?auto_537715 - SURFACE
    )
    :vars
    (
      ?auto_537717 - HOIST
      ?auto_537719 - PLACE
      ?auto_537721 - PLACE
      ?auto_537716 - HOIST
      ?auto_537720 - SURFACE
      ?auto_537718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_537717 ?auto_537719 ) ( IS-CRATE ?auto_537715 ) ( not ( = ?auto_537714 ?auto_537715 ) ) ( not ( = ?auto_537713 ?auto_537714 ) ) ( not ( = ?auto_537713 ?auto_537715 ) ) ( not ( = ?auto_537721 ?auto_537719 ) ) ( HOIST-AT ?auto_537716 ?auto_537721 ) ( not ( = ?auto_537717 ?auto_537716 ) ) ( AVAILABLE ?auto_537716 ) ( SURFACE-AT ?auto_537715 ?auto_537721 ) ( ON ?auto_537715 ?auto_537720 ) ( CLEAR ?auto_537715 ) ( not ( = ?auto_537714 ?auto_537720 ) ) ( not ( = ?auto_537715 ?auto_537720 ) ) ( not ( = ?auto_537713 ?auto_537720 ) ) ( TRUCK-AT ?auto_537718 ?auto_537719 ) ( SURFACE-AT ?auto_537713 ?auto_537719 ) ( CLEAR ?auto_537713 ) ( IS-CRATE ?auto_537714 ) ( AVAILABLE ?auto_537717 ) ( IN ?auto_537714 ?auto_537718 ) ( ON ?auto_537706 ?auto_537705 ) ( ON ?auto_537707 ?auto_537706 ) ( ON ?auto_537708 ?auto_537707 ) ( ON ?auto_537709 ?auto_537708 ) ( ON ?auto_537710 ?auto_537709 ) ( ON ?auto_537711 ?auto_537710 ) ( ON ?auto_537712 ?auto_537711 ) ( ON ?auto_537713 ?auto_537712 ) ( not ( = ?auto_537705 ?auto_537706 ) ) ( not ( = ?auto_537705 ?auto_537707 ) ) ( not ( = ?auto_537705 ?auto_537708 ) ) ( not ( = ?auto_537705 ?auto_537709 ) ) ( not ( = ?auto_537705 ?auto_537710 ) ) ( not ( = ?auto_537705 ?auto_537711 ) ) ( not ( = ?auto_537705 ?auto_537712 ) ) ( not ( = ?auto_537705 ?auto_537713 ) ) ( not ( = ?auto_537705 ?auto_537714 ) ) ( not ( = ?auto_537705 ?auto_537715 ) ) ( not ( = ?auto_537705 ?auto_537720 ) ) ( not ( = ?auto_537706 ?auto_537707 ) ) ( not ( = ?auto_537706 ?auto_537708 ) ) ( not ( = ?auto_537706 ?auto_537709 ) ) ( not ( = ?auto_537706 ?auto_537710 ) ) ( not ( = ?auto_537706 ?auto_537711 ) ) ( not ( = ?auto_537706 ?auto_537712 ) ) ( not ( = ?auto_537706 ?auto_537713 ) ) ( not ( = ?auto_537706 ?auto_537714 ) ) ( not ( = ?auto_537706 ?auto_537715 ) ) ( not ( = ?auto_537706 ?auto_537720 ) ) ( not ( = ?auto_537707 ?auto_537708 ) ) ( not ( = ?auto_537707 ?auto_537709 ) ) ( not ( = ?auto_537707 ?auto_537710 ) ) ( not ( = ?auto_537707 ?auto_537711 ) ) ( not ( = ?auto_537707 ?auto_537712 ) ) ( not ( = ?auto_537707 ?auto_537713 ) ) ( not ( = ?auto_537707 ?auto_537714 ) ) ( not ( = ?auto_537707 ?auto_537715 ) ) ( not ( = ?auto_537707 ?auto_537720 ) ) ( not ( = ?auto_537708 ?auto_537709 ) ) ( not ( = ?auto_537708 ?auto_537710 ) ) ( not ( = ?auto_537708 ?auto_537711 ) ) ( not ( = ?auto_537708 ?auto_537712 ) ) ( not ( = ?auto_537708 ?auto_537713 ) ) ( not ( = ?auto_537708 ?auto_537714 ) ) ( not ( = ?auto_537708 ?auto_537715 ) ) ( not ( = ?auto_537708 ?auto_537720 ) ) ( not ( = ?auto_537709 ?auto_537710 ) ) ( not ( = ?auto_537709 ?auto_537711 ) ) ( not ( = ?auto_537709 ?auto_537712 ) ) ( not ( = ?auto_537709 ?auto_537713 ) ) ( not ( = ?auto_537709 ?auto_537714 ) ) ( not ( = ?auto_537709 ?auto_537715 ) ) ( not ( = ?auto_537709 ?auto_537720 ) ) ( not ( = ?auto_537710 ?auto_537711 ) ) ( not ( = ?auto_537710 ?auto_537712 ) ) ( not ( = ?auto_537710 ?auto_537713 ) ) ( not ( = ?auto_537710 ?auto_537714 ) ) ( not ( = ?auto_537710 ?auto_537715 ) ) ( not ( = ?auto_537710 ?auto_537720 ) ) ( not ( = ?auto_537711 ?auto_537712 ) ) ( not ( = ?auto_537711 ?auto_537713 ) ) ( not ( = ?auto_537711 ?auto_537714 ) ) ( not ( = ?auto_537711 ?auto_537715 ) ) ( not ( = ?auto_537711 ?auto_537720 ) ) ( not ( = ?auto_537712 ?auto_537713 ) ) ( not ( = ?auto_537712 ?auto_537714 ) ) ( not ( = ?auto_537712 ?auto_537715 ) ) ( not ( = ?auto_537712 ?auto_537720 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537713 ?auto_537714 ?auto_537715 )
      ( MAKE-10CRATE-VERIFY ?auto_537705 ?auto_537706 ?auto_537707 ?auto_537708 ?auto_537709 ?auto_537710 ?auto_537711 ?auto_537712 ?auto_537713 ?auto_537714 ?auto_537715 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_544944 - SURFACE
      ?auto_544945 - SURFACE
      ?auto_544946 - SURFACE
      ?auto_544947 - SURFACE
      ?auto_544948 - SURFACE
      ?auto_544949 - SURFACE
      ?auto_544950 - SURFACE
      ?auto_544951 - SURFACE
      ?auto_544952 - SURFACE
      ?auto_544953 - SURFACE
      ?auto_544954 - SURFACE
      ?auto_544955 - SURFACE
    )
    :vars
    (
      ?auto_544956 - HOIST
      ?auto_544957 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_544956 ?auto_544957 ) ( SURFACE-AT ?auto_544954 ?auto_544957 ) ( CLEAR ?auto_544954 ) ( LIFTING ?auto_544956 ?auto_544955 ) ( IS-CRATE ?auto_544955 ) ( not ( = ?auto_544954 ?auto_544955 ) ) ( ON ?auto_544945 ?auto_544944 ) ( ON ?auto_544946 ?auto_544945 ) ( ON ?auto_544947 ?auto_544946 ) ( ON ?auto_544948 ?auto_544947 ) ( ON ?auto_544949 ?auto_544948 ) ( ON ?auto_544950 ?auto_544949 ) ( ON ?auto_544951 ?auto_544950 ) ( ON ?auto_544952 ?auto_544951 ) ( ON ?auto_544953 ?auto_544952 ) ( ON ?auto_544954 ?auto_544953 ) ( not ( = ?auto_544944 ?auto_544945 ) ) ( not ( = ?auto_544944 ?auto_544946 ) ) ( not ( = ?auto_544944 ?auto_544947 ) ) ( not ( = ?auto_544944 ?auto_544948 ) ) ( not ( = ?auto_544944 ?auto_544949 ) ) ( not ( = ?auto_544944 ?auto_544950 ) ) ( not ( = ?auto_544944 ?auto_544951 ) ) ( not ( = ?auto_544944 ?auto_544952 ) ) ( not ( = ?auto_544944 ?auto_544953 ) ) ( not ( = ?auto_544944 ?auto_544954 ) ) ( not ( = ?auto_544944 ?auto_544955 ) ) ( not ( = ?auto_544945 ?auto_544946 ) ) ( not ( = ?auto_544945 ?auto_544947 ) ) ( not ( = ?auto_544945 ?auto_544948 ) ) ( not ( = ?auto_544945 ?auto_544949 ) ) ( not ( = ?auto_544945 ?auto_544950 ) ) ( not ( = ?auto_544945 ?auto_544951 ) ) ( not ( = ?auto_544945 ?auto_544952 ) ) ( not ( = ?auto_544945 ?auto_544953 ) ) ( not ( = ?auto_544945 ?auto_544954 ) ) ( not ( = ?auto_544945 ?auto_544955 ) ) ( not ( = ?auto_544946 ?auto_544947 ) ) ( not ( = ?auto_544946 ?auto_544948 ) ) ( not ( = ?auto_544946 ?auto_544949 ) ) ( not ( = ?auto_544946 ?auto_544950 ) ) ( not ( = ?auto_544946 ?auto_544951 ) ) ( not ( = ?auto_544946 ?auto_544952 ) ) ( not ( = ?auto_544946 ?auto_544953 ) ) ( not ( = ?auto_544946 ?auto_544954 ) ) ( not ( = ?auto_544946 ?auto_544955 ) ) ( not ( = ?auto_544947 ?auto_544948 ) ) ( not ( = ?auto_544947 ?auto_544949 ) ) ( not ( = ?auto_544947 ?auto_544950 ) ) ( not ( = ?auto_544947 ?auto_544951 ) ) ( not ( = ?auto_544947 ?auto_544952 ) ) ( not ( = ?auto_544947 ?auto_544953 ) ) ( not ( = ?auto_544947 ?auto_544954 ) ) ( not ( = ?auto_544947 ?auto_544955 ) ) ( not ( = ?auto_544948 ?auto_544949 ) ) ( not ( = ?auto_544948 ?auto_544950 ) ) ( not ( = ?auto_544948 ?auto_544951 ) ) ( not ( = ?auto_544948 ?auto_544952 ) ) ( not ( = ?auto_544948 ?auto_544953 ) ) ( not ( = ?auto_544948 ?auto_544954 ) ) ( not ( = ?auto_544948 ?auto_544955 ) ) ( not ( = ?auto_544949 ?auto_544950 ) ) ( not ( = ?auto_544949 ?auto_544951 ) ) ( not ( = ?auto_544949 ?auto_544952 ) ) ( not ( = ?auto_544949 ?auto_544953 ) ) ( not ( = ?auto_544949 ?auto_544954 ) ) ( not ( = ?auto_544949 ?auto_544955 ) ) ( not ( = ?auto_544950 ?auto_544951 ) ) ( not ( = ?auto_544950 ?auto_544952 ) ) ( not ( = ?auto_544950 ?auto_544953 ) ) ( not ( = ?auto_544950 ?auto_544954 ) ) ( not ( = ?auto_544950 ?auto_544955 ) ) ( not ( = ?auto_544951 ?auto_544952 ) ) ( not ( = ?auto_544951 ?auto_544953 ) ) ( not ( = ?auto_544951 ?auto_544954 ) ) ( not ( = ?auto_544951 ?auto_544955 ) ) ( not ( = ?auto_544952 ?auto_544953 ) ) ( not ( = ?auto_544952 ?auto_544954 ) ) ( not ( = ?auto_544952 ?auto_544955 ) ) ( not ( = ?auto_544953 ?auto_544954 ) ) ( not ( = ?auto_544953 ?auto_544955 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_544954 ?auto_544955 )
      ( MAKE-11CRATE-VERIFY ?auto_544944 ?auto_544945 ?auto_544946 ?auto_544947 ?auto_544948 ?auto_544949 ?auto_544950 ?auto_544951 ?auto_544952 ?auto_544953 ?auto_544954 ?auto_544955 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545053 - SURFACE
      ?auto_545054 - SURFACE
      ?auto_545055 - SURFACE
      ?auto_545056 - SURFACE
      ?auto_545057 - SURFACE
      ?auto_545058 - SURFACE
      ?auto_545059 - SURFACE
      ?auto_545060 - SURFACE
      ?auto_545061 - SURFACE
      ?auto_545062 - SURFACE
      ?auto_545063 - SURFACE
      ?auto_545064 - SURFACE
    )
    :vars
    (
      ?auto_545066 - HOIST
      ?auto_545067 - PLACE
      ?auto_545065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_545066 ?auto_545067 ) ( SURFACE-AT ?auto_545063 ?auto_545067 ) ( CLEAR ?auto_545063 ) ( IS-CRATE ?auto_545064 ) ( not ( = ?auto_545063 ?auto_545064 ) ) ( TRUCK-AT ?auto_545065 ?auto_545067 ) ( AVAILABLE ?auto_545066 ) ( IN ?auto_545064 ?auto_545065 ) ( ON ?auto_545063 ?auto_545062 ) ( not ( = ?auto_545062 ?auto_545063 ) ) ( not ( = ?auto_545062 ?auto_545064 ) ) ( ON ?auto_545054 ?auto_545053 ) ( ON ?auto_545055 ?auto_545054 ) ( ON ?auto_545056 ?auto_545055 ) ( ON ?auto_545057 ?auto_545056 ) ( ON ?auto_545058 ?auto_545057 ) ( ON ?auto_545059 ?auto_545058 ) ( ON ?auto_545060 ?auto_545059 ) ( ON ?auto_545061 ?auto_545060 ) ( ON ?auto_545062 ?auto_545061 ) ( not ( = ?auto_545053 ?auto_545054 ) ) ( not ( = ?auto_545053 ?auto_545055 ) ) ( not ( = ?auto_545053 ?auto_545056 ) ) ( not ( = ?auto_545053 ?auto_545057 ) ) ( not ( = ?auto_545053 ?auto_545058 ) ) ( not ( = ?auto_545053 ?auto_545059 ) ) ( not ( = ?auto_545053 ?auto_545060 ) ) ( not ( = ?auto_545053 ?auto_545061 ) ) ( not ( = ?auto_545053 ?auto_545062 ) ) ( not ( = ?auto_545053 ?auto_545063 ) ) ( not ( = ?auto_545053 ?auto_545064 ) ) ( not ( = ?auto_545054 ?auto_545055 ) ) ( not ( = ?auto_545054 ?auto_545056 ) ) ( not ( = ?auto_545054 ?auto_545057 ) ) ( not ( = ?auto_545054 ?auto_545058 ) ) ( not ( = ?auto_545054 ?auto_545059 ) ) ( not ( = ?auto_545054 ?auto_545060 ) ) ( not ( = ?auto_545054 ?auto_545061 ) ) ( not ( = ?auto_545054 ?auto_545062 ) ) ( not ( = ?auto_545054 ?auto_545063 ) ) ( not ( = ?auto_545054 ?auto_545064 ) ) ( not ( = ?auto_545055 ?auto_545056 ) ) ( not ( = ?auto_545055 ?auto_545057 ) ) ( not ( = ?auto_545055 ?auto_545058 ) ) ( not ( = ?auto_545055 ?auto_545059 ) ) ( not ( = ?auto_545055 ?auto_545060 ) ) ( not ( = ?auto_545055 ?auto_545061 ) ) ( not ( = ?auto_545055 ?auto_545062 ) ) ( not ( = ?auto_545055 ?auto_545063 ) ) ( not ( = ?auto_545055 ?auto_545064 ) ) ( not ( = ?auto_545056 ?auto_545057 ) ) ( not ( = ?auto_545056 ?auto_545058 ) ) ( not ( = ?auto_545056 ?auto_545059 ) ) ( not ( = ?auto_545056 ?auto_545060 ) ) ( not ( = ?auto_545056 ?auto_545061 ) ) ( not ( = ?auto_545056 ?auto_545062 ) ) ( not ( = ?auto_545056 ?auto_545063 ) ) ( not ( = ?auto_545056 ?auto_545064 ) ) ( not ( = ?auto_545057 ?auto_545058 ) ) ( not ( = ?auto_545057 ?auto_545059 ) ) ( not ( = ?auto_545057 ?auto_545060 ) ) ( not ( = ?auto_545057 ?auto_545061 ) ) ( not ( = ?auto_545057 ?auto_545062 ) ) ( not ( = ?auto_545057 ?auto_545063 ) ) ( not ( = ?auto_545057 ?auto_545064 ) ) ( not ( = ?auto_545058 ?auto_545059 ) ) ( not ( = ?auto_545058 ?auto_545060 ) ) ( not ( = ?auto_545058 ?auto_545061 ) ) ( not ( = ?auto_545058 ?auto_545062 ) ) ( not ( = ?auto_545058 ?auto_545063 ) ) ( not ( = ?auto_545058 ?auto_545064 ) ) ( not ( = ?auto_545059 ?auto_545060 ) ) ( not ( = ?auto_545059 ?auto_545061 ) ) ( not ( = ?auto_545059 ?auto_545062 ) ) ( not ( = ?auto_545059 ?auto_545063 ) ) ( not ( = ?auto_545059 ?auto_545064 ) ) ( not ( = ?auto_545060 ?auto_545061 ) ) ( not ( = ?auto_545060 ?auto_545062 ) ) ( not ( = ?auto_545060 ?auto_545063 ) ) ( not ( = ?auto_545060 ?auto_545064 ) ) ( not ( = ?auto_545061 ?auto_545062 ) ) ( not ( = ?auto_545061 ?auto_545063 ) ) ( not ( = ?auto_545061 ?auto_545064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_545062 ?auto_545063 ?auto_545064 )
      ( MAKE-11CRATE-VERIFY ?auto_545053 ?auto_545054 ?auto_545055 ?auto_545056 ?auto_545057 ?auto_545058 ?auto_545059 ?auto_545060 ?auto_545061 ?auto_545062 ?auto_545063 ?auto_545064 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545174 - SURFACE
      ?auto_545175 - SURFACE
      ?auto_545176 - SURFACE
      ?auto_545177 - SURFACE
      ?auto_545178 - SURFACE
      ?auto_545179 - SURFACE
      ?auto_545180 - SURFACE
      ?auto_545181 - SURFACE
      ?auto_545182 - SURFACE
      ?auto_545183 - SURFACE
      ?auto_545184 - SURFACE
      ?auto_545185 - SURFACE
    )
    :vars
    (
      ?auto_545188 - HOIST
      ?auto_545187 - PLACE
      ?auto_545186 - TRUCK
      ?auto_545189 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_545188 ?auto_545187 ) ( SURFACE-AT ?auto_545184 ?auto_545187 ) ( CLEAR ?auto_545184 ) ( IS-CRATE ?auto_545185 ) ( not ( = ?auto_545184 ?auto_545185 ) ) ( AVAILABLE ?auto_545188 ) ( IN ?auto_545185 ?auto_545186 ) ( ON ?auto_545184 ?auto_545183 ) ( not ( = ?auto_545183 ?auto_545184 ) ) ( not ( = ?auto_545183 ?auto_545185 ) ) ( TRUCK-AT ?auto_545186 ?auto_545189 ) ( not ( = ?auto_545189 ?auto_545187 ) ) ( ON ?auto_545175 ?auto_545174 ) ( ON ?auto_545176 ?auto_545175 ) ( ON ?auto_545177 ?auto_545176 ) ( ON ?auto_545178 ?auto_545177 ) ( ON ?auto_545179 ?auto_545178 ) ( ON ?auto_545180 ?auto_545179 ) ( ON ?auto_545181 ?auto_545180 ) ( ON ?auto_545182 ?auto_545181 ) ( ON ?auto_545183 ?auto_545182 ) ( not ( = ?auto_545174 ?auto_545175 ) ) ( not ( = ?auto_545174 ?auto_545176 ) ) ( not ( = ?auto_545174 ?auto_545177 ) ) ( not ( = ?auto_545174 ?auto_545178 ) ) ( not ( = ?auto_545174 ?auto_545179 ) ) ( not ( = ?auto_545174 ?auto_545180 ) ) ( not ( = ?auto_545174 ?auto_545181 ) ) ( not ( = ?auto_545174 ?auto_545182 ) ) ( not ( = ?auto_545174 ?auto_545183 ) ) ( not ( = ?auto_545174 ?auto_545184 ) ) ( not ( = ?auto_545174 ?auto_545185 ) ) ( not ( = ?auto_545175 ?auto_545176 ) ) ( not ( = ?auto_545175 ?auto_545177 ) ) ( not ( = ?auto_545175 ?auto_545178 ) ) ( not ( = ?auto_545175 ?auto_545179 ) ) ( not ( = ?auto_545175 ?auto_545180 ) ) ( not ( = ?auto_545175 ?auto_545181 ) ) ( not ( = ?auto_545175 ?auto_545182 ) ) ( not ( = ?auto_545175 ?auto_545183 ) ) ( not ( = ?auto_545175 ?auto_545184 ) ) ( not ( = ?auto_545175 ?auto_545185 ) ) ( not ( = ?auto_545176 ?auto_545177 ) ) ( not ( = ?auto_545176 ?auto_545178 ) ) ( not ( = ?auto_545176 ?auto_545179 ) ) ( not ( = ?auto_545176 ?auto_545180 ) ) ( not ( = ?auto_545176 ?auto_545181 ) ) ( not ( = ?auto_545176 ?auto_545182 ) ) ( not ( = ?auto_545176 ?auto_545183 ) ) ( not ( = ?auto_545176 ?auto_545184 ) ) ( not ( = ?auto_545176 ?auto_545185 ) ) ( not ( = ?auto_545177 ?auto_545178 ) ) ( not ( = ?auto_545177 ?auto_545179 ) ) ( not ( = ?auto_545177 ?auto_545180 ) ) ( not ( = ?auto_545177 ?auto_545181 ) ) ( not ( = ?auto_545177 ?auto_545182 ) ) ( not ( = ?auto_545177 ?auto_545183 ) ) ( not ( = ?auto_545177 ?auto_545184 ) ) ( not ( = ?auto_545177 ?auto_545185 ) ) ( not ( = ?auto_545178 ?auto_545179 ) ) ( not ( = ?auto_545178 ?auto_545180 ) ) ( not ( = ?auto_545178 ?auto_545181 ) ) ( not ( = ?auto_545178 ?auto_545182 ) ) ( not ( = ?auto_545178 ?auto_545183 ) ) ( not ( = ?auto_545178 ?auto_545184 ) ) ( not ( = ?auto_545178 ?auto_545185 ) ) ( not ( = ?auto_545179 ?auto_545180 ) ) ( not ( = ?auto_545179 ?auto_545181 ) ) ( not ( = ?auto_545179 ?auto_545182 ) ) ( not ( = ?auto_545179 ?auto_545183 ) ) ( not ( = ?auto_545179 ?auto_545184 ) ) ( not ( = ?auto_545179 ?auto_545185 ) ) ( not ( = ?auto_545180 ?auto_545181 ) ) ( not ( = ?auto_545180 ?auto_545182 ) ) ( not ( = ?auto_545180 ?auto_545183 ) ) ( not ( = ?auto_545180 ?auto_545184 ) ) ( not ( = ?auto_545180 ?auto_545185 ) ) ( not ( = ?auto_545181 ?auto_545182 ) ) ( not ( = ?auto_545181 ?auto_545183 ) ) ( not ( = ?auto_545181 ?auto_545184 ) ) ( not ( = ?auto_545181 ?auto_545185 ) ) ( not ( = ?auto_545182 ?auto_545183 ) ) ( not ( = ?auto_545182 ?auto_545184 ) ) ( not ( = ?auto_545182 ?auto_545185 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_545183 ?auto_545184 ?auto_545185 )
      ( MAKE-11CRATE-VERIFY ?auto_545174 ?auto_545175 ?auto_545176 ?auto_545177 ?auto_545178 ?auto_545179 ?auto_545180 ?auto_545181 ?auto_545182 ?auto_545183 ?auto_545184 ?auto_545185 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545306 - SURFACE
      ?auto_545307 - SURFACE
      ?auto_545308 - SURFACE
      ?auto_545309 - SURFACE
      ?auto_545310 - SURFACE
      ?auto_545311 - SURFACE
      ?auto_545312 - SURFACE
      ?auto_545313 - SURFACE
      ?auto_545314 - SURFACE
      ?auto_545315 - SURFACE
      ?auto_545316 - SURFACE
      ?auto_545317 - SURFACE
    )
    :vars
    (
      ?auto_545320 - HOIST
      ?auto_545318 - PLACE
      ?auto_545319 - TRUCK
      ?auto_545322 - PLACE
      ?auto_545321 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_545320 ?auto_545318 ) ( SURFACE-AT ?auto_545316 ?auto_545318 ) ( CLEAR ?auto_545316 ) ( IS-CRATE ?auto_545317 ) ( not ( = ?auto_545316 ?auto_545317 ) ) ( AVAILABLE ?auto_545320 ) ( ON ?auto_545316 ?auto_545315 ) ( not ( = ?auto_545315 ?auto_545316 ) ) ( not ( = ?auto_545315 ?auto_545317 ) ) ( TRUCK-AT ?auto_545319 ?auto_545322 ) ( not ( = ?auto_545322 ?auto_545318 ) ) ( HOIST-AT ?auto_545321 ?auto_545322 ) ( LIFTING ?auto_545321 ?auto_545317 ) ( not ( = ?auto_545320 ?auto_545321 ) ) ( ON ?auto_545307 ?auto_545306 ) ( ON ?auto_545308 ?auto_545307 ) ( ON ?auto_545309 ?auto_545308 ) ( ON ?auto_545310 ?auto_545309 ) ( ON ?auto_545311 ?auto_545310 ) ( ON ?auto_545312 ?auto_545311 ) ( ON ?auto_545313 ?auto_545312 ) ( ON ?auto_545314 ?auto_545313 ) ( ON ?auto_545315 ?auto_545314 ) ( not ( = ?auto_545306 ?auto_545307 ) ) ( not ( = ?auto_545306 ?auto_545308 ) ) ( not ( = ?auto_545306 ?auto_545309 ) ) ( not ( = ?auto_545306 ?auto_545310 ) ) ( not ( = ?auto_545306 ?auto_545311 ) ) ( not ( = ?auto_545306 ?auto_545312 ) ) ( not ( = ?auto_545306 ?auto_545313 ) ) ( not ( = ?auto_545306 ?auto_545314 ) ) ( not ( = ?auto_545306 ?auto_545315 ) ) ( not ( = ?auto_545306 ?auto_545316 ) ) ( not ( = ?auto_545306 ?auto_545317 ) ) ( not ( = ?auto_545307 ?auto_545308 ) ) ( not ( = ?auto_545307 ?auto_545309 ) ) ( not ( = ?auto_545307 ?auto_545310 ) ) ( not ( = ?auto_545307 ?auto_545311 ) ) ( not ( = ?auto_545307 ?auto_545312 ) ) ( not ( = ?auto_545307 ?auto_545313 ) ) ( not ( = ?auto_545307 ?auto_545314 ) ) ( not ( = ?auto_545307 ?auto_545315 ) ) ( not ( = ?auto_545307 ?auto_545316 ) ) ( not ( = ?auto_545307 ?auto_545317 ) ) ( not ( = ?auto_545308 ?auto_545309 ) ) ( not ( = ?auto_545308 ?auto_545310 ) ) ( not ( = ?auto_545308 ?auto_545311 ) ) ( not ( = ?auto_545308 ?auto_545312 ) ) ( not ( = ?auto_545308 ?auto_545313 ) ) ( not ( = ?auto_545308 ?auto_545314 ) ) ( not ( = ?auto_545308 ?auto_545315 ) ) ( not ( = ?auto_545308 ?auto_545316 ) ) ( not ( = ?auto_545308 ?auto_545317 ) ) ( not ( = ?auto_545309 ?auto_545310 ) ) ( not ( = ?auto_545309 ?auto_545311 ) ) ( not ( = ?auto_545309 ?auto_545312 ) ) ( not ( = ?auto_545309 ?auto_545313 ) ) ( not ( = ?auto_545309 ?auto_545314 ) ) ( not ( = ?auto_545309 ?auto_545315 ) ) ( not ( = ?auto_545309 ?auto_545316 ) ) ( not ( = ?auto_545309 ?auto_545317 ) ) ( not ( = ?auto_545310 ?auto_545311 ) ) ( not ( = ?auto_545310 ?auto_545312 ) ) ( not ( = ?auto_545310 ?auto_545313 ) ) ( not ( = ?auto_545310 ?auto_545314 ) ) ( not ( = ?auto_545310 ?auto_545315 ) ) ( not ( = ?auto_545310 ?auto_545316 ) ) ( not ( = ?auto_545310 ?auto_545317 ) ) ( not ( = ?auto_545311 ?auto_545312 ) ) ( not ( = ?auto_545311 ?auto_545313 ) ) ( not ( = ?auto_545311 ?auto_545314 ) ) ( not ( = ?auto_545311 ?auto_545315 ) ) ( not ( = ?auto_545311 ?auto_545316 ) ) ( not ( = ?auto_545311 ?auto_545317 ) ) ( not ( = ?auto_545312 ?auto_545313 ) ) ( not ( = ?auto_545312 ?auto_545314 ) ) ( not ( = ?auto_545312 ?auto_545315 ) ) ( not ( = ?auto_545312 ?auto_545316 ) ) ( not ( = ?auto_545312 ?auto_545317 ) ) ( not ( = ?auto_545313 ?auto_545314 ) ) ( not ( = ?auto_545313 ?auto_545315 ) ) ( not ( = ?auto_545313 ?auto_545316 ) ) ( not ( = ?auto_545313 ?auto_545317 ) ) ( not ( = ?auto_545314 ?auto_545315 ) ) ( not ( = ?auto_545314 ?auto_545316 ) ) ( not ( = ?auto_545314 ?auto_545317 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_545315 ?auto_545316 ?auto_545317 )
      ( MAKE-11CRATE-VERIFY ?auto_545306 ?auto_545307 ?auto_545308 ?auto_545309 ?auto_545310 ?auto_545311 ?auto_545312 ?auto_545313 ?auto_545314 ?auto_545315 ?auto_545316 ?auto_545317 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545449 - SURFACE
      ?auto_545450 - SURFACE
      ?auto_545451 - SURFACE
      ?auto_545452 - SURFACE
      ?auto_545453 - SURFACE
      ?auto_545454 - SURFACE
      ?auto_545455 - SURFACE
      ?auto_545456 - SURFACE
      ?auto_545457 - SURFACE
      ?auto_545458 - SURFACE
      ?auto_545459 - SURFACE
      ?auto_545460 - SURFACE
    )
    :vars
    (
      ?auto_545464 - HOIST
      ?auto_545463 - PLACE
      ?auto_545466 - TRUCK
      ?auto_545465 - PLACE
      ?auto_545462 - HOIST
      ?auto_545461 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_545464 ?auto_545463 ) ( SURFACE-AT ?auto_545459 ?auto_545463 ) ( CLEAR ?auto_545459 ) ( IS-CRATE ?auto_545460 ) ( not ( = ?auto_545459 ?auto_545460 ) ) ( AVAILABLE ?auto_545464 ) ( ON ?auto_545459 ?auto_545458 ) ( not ( = ?auto_545458 ?auto_545459 ) ) ( not ( = ?auto_545458 ?auto_545460 ) ) ( TRUCK-AT ?auto_545466 ?auto_545465 ) ( not ( = ?auto_545465 ?auto_545463 ) ) ( HOIST-AT ?auto_545462 ?auto_545465 ) ( not ( = ?auto_545464 ?auto_545462 ) ) ( AVAILABLE ?auto_545462 ) ( SURFACE-AT ?auto_545460 ?auto_545465 ) ( ON ?auto_545460 ?auto_545461 ) ( CLEAR ?auto_545460 ) ( not ( = ?auto_545459 ?auto_545461 ) ) ( not ( = ?auto_545460 ?auto_545461 ) ) ( not ( = ?auto_545458 ?auto_545461 ) ) ( ON ?auto_545450 ?auto_545449 ) ( ON ?auto_545451 ?auto_545450 ) ( ON ?auto_545452 ?auto_545451 ) ( ON ?auto_545453 ?auto_545452 ) ( ON ?auto_545454 ?auto_545453 ) ( ON ?auto_545455 ?auto_545454 ) ( ON ?auto_545456 ?auto_545455 ) ( ON ?auto_545457 ?auto_545456 ) ( ON ?auto_545458 ?auto_545457 ) ( not ( = ?auto_545449 ?auto_545450 ) ) ( not ( = ?auto_545449 ?auto_545451 ) ) ( not ( = ?auto_545449 ?auto_545452 ) ) ( not ( = ?auto_545449 ?auto_545453 ) ) ( not ( = ?auto_545449 ?auto_545454 ) ) ( not ( = ?auto_545449 ?auto_545455 ) ) ( not ( = ?auto_545449 ?auto_545456 ) ) ( not ( = ?auto_545449 ?auto_545457 ) ) ( not ( = ?auto_545449 ?auto_545458 ) ) ( not ( = ?auto_545449 ?auto_545459 ) ) ( not ( = ?auto_545449 ?auto_545460 ) ) ( not ( = ?auto_545449 ?auto_545461 ) ) ( not ( = ?auto_545450 ?auto_545451 ) ) ( not ( = ?auto_545450 ?auto_545452 ) ) ( not ( = ?auto_545450 ?auto_545453 ) ) ( not ( = ?auto_545450 ?auto_545454 ) ) ( not ( = ?auto_545450 ?auto_545455 ) ) ( not ( = ?auto_545450 ?auto_545456 ) ) ( not ( = ?auto_545450 ?auto_545457 ) ) ( not ( = ?auto_545450 ?auto_545458 ) ) ( not ( = ?auto_545450 ?auto_545459 ) ) ( not ( = ?auto_545450 ?auto_545460 ) ) ( not ( = ?auto_545450 ?auto_545461 ) ) ( not ( = ?auto_545451 ?auto_545452 ) ) ( not ( = ?auto_545451 ?auto_545453 ) ) ( not ( = ?auto_545451 ?auto_545454 ) ) ( not ( = ?auto_545451 ?auto_545455 ) ) ( not ( = ?auto_545451 ?auto_545456 ) ) ( not ( = ?auto_545451 ?auto_545457 ) ) ( not ( = ?auto_545451 ?auto_545458 ) ) ( not ( = ?auto_545451 ?auto_545459 ) ) ( not ( = ?auto_545451 ?auto_545460 ) ) ( not ( = ?auto_545451 ?auto_545461 ) ) ( not ( = ?auto_545452 ?auto_545453 ) ) ( not ( = ?auto_545452 ?auto_545454 ) ) ( not ( = ?auto_545452 ?auto_545455 ) ) ( not ( = ?auto_545452 ?auto_545456 ) ) ( not ( = ?auto_545452 ?auto_545457 ) ) ( not ( = ?auto_545452 ?auto_545458 ) ) ( not ( = ?auto_545452 ?auto_545459 ) ) ( not ( = ?auto_545452 ?auto_545460 ) ) ( not ( = ?auto_545452 ?auto_545461 ) ) ( not ( = ?auto_545453 ?auto_545454 ) ) ( not ( = ?auto_545453 ?auto_545455 ) ) ( not ( = ?auto_545453 ?auto_545456 ) ) ( not ( = ?auto_545453 ?auto_545457 ) ) ( not ( = ?auto_545453 ?auto_545458 ) ) ( not ( = ?auto_545453 ?auto_545459 ) ) ( not ( = ?auto_545453 ?auto_545460 ) ) ( not ( = ?auto_545453 ?auto_545461 ) ) ( not ( = ?auto_545454 ?auto_545455 ) ) ( not ( = ?auto_545454 ?auto_545456 ) ) ( not ( = ?auto_545454 ?auto_545457 ) ) ( not ( = ?auto_545454 ?auto_545458 ) ) ( not ( = ?auto_545454 ?auto_545459 ) ) ( not ( = ?auto_545454 ?auto_545460 ) ) ( not ( = ?auto_545454 ?auto_545461 ) ) ( not ( = ?auto_545455 ?auto_545456 ) ) ( not ( = ?auto_545455 ?auto_545457 ) ) ( not ( = ?auto_545455 ?auto_545458 ) ) ( not ( = ?auto_545455 ?auto_545459 ) ) ( not ( = ?auto_545455 ?auto_545460 ) ) ( not ( = ?auto_545455 ?auto_545461 ) ) ( not ( = ?auto_545456 ?auto_545457 ) ) ( not ( = ?auto_545456 ?auto_545458 ) ) ( not ( = ?auto_545456 ?auto_545459 ) ) ( not ( = ?auto_545456 ?auto_545460 ) ) ( not ( = ?auto_545456 ?auto_545461 ) ) ( not ( = ?auto_545457 ?auto_545458 ) ) ( not ( = ?auto_545457 ?auto_545459 ) ) ( not ( = ?auto_545457 ?auto_545460 ) ) ( not ( = ?auto_545457 ?auto_545461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_545458 ?auto_545459 ?auto_545460 )
      ( MAKE-11CRATE-VERIFY ?auto_545449 ?auto_545450 ?auto_545451 ?auto_545452 ?auto_545453 ?auto_545454 ?auto_545455 ?auto_545456 ?auto_545457 ?auto_545458 ?auto_545459 ?auto_545460 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545593 - SURFACE
      ?auto_545594 - SURFACE
      ?auto_545595 - SURFACE
      ?auto_545596 - SURFACE
      ?auto_545597 - SURFACE
      ?auto_545598 - SURFACE
      ?auto_545599 - SURFACE
      ?auto_545600 - SURFACE
      ?auto_545601 - SURFACE
      ?auto_545602 - SURFACE
      ?auto_545603 - SURFACE
      ?auto_545604 - SURFACE
    )
    :vars
    (
      ?auto_545606 - HOIST
      ?auto_545610 - PLACE
      ?auto_545605 - PLACE
      ?auto_545607 - HOIST
      ?auto_545608 - SURFACE
      ?auto_545609 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_545606 ?auto_545610 ) ( SURFACE-AT ?auto_545603 ?auto_545610 ) ( CLEAR ?auto_545603 ) ( IS-CRATE ?auto_545604 ) ( not ( = ?auto_545603 ?auto_545604 ) ) ( AVAILABLE ?auto_545606 ) ( ON ?auto_545603 ?auto_545602 ) ( not ( = ?auto_545602 ?auto_545603 ) ) ( not ( = ?auto_545602 ?auto_545604 ) ) ( not ( = ?auto_545605 ?auto_545610 ) ) ( HOIST-AT ?auto_545607 ?auto_545605 ) ( not ( = ?auto_545606 ?auto_545607 ) ) ( AVAILABLE ?auto_545607 ) ( SURFACE-AT ?auto_545604 ?auto_545605 ) ( ON ?auto_545604 ?auto_545608 ) ( CLEAR ?auto_545604 ) ( not ( = ?auto_545603 ?auto_545608 ) ) ( not ( = ?auto_545604 ?auto_545608 ) ) ( not ( = ?auto_545602 ?auto_545608 ) ) ( TRUCK-AT ?auto_545609 ?auto_545610 ) ( ON ?auto_545594 ?auto_545593 ) ( ON ?auto_545595 ?auto_545594 ) ( ON ?auto_545596 ?auto_545595 ) ( ON ?auto_545597 ?auto_545596 ) ( ON ?auto_545598 ?auto_545597 ) ( ON ?auto_545599 ?auto_545598 ) ( ON ?auto_545600 ?auto_545599 ) ( ON ?auto_545601 ?auto_545600 ) ( ON ?auto_545602 ?auto_545601 ) ( not ( = ?auto_545593 ?auto_545594 ) ) ( not ( = ?auto_545593 ?auto_545595 ) ) ( not ( = ?auto_545593 ?auto_545596 ) ) ( not ( = ?auto_545593 ?auto_545597 ) ) ( not ( = ?auto_545593 ?auto_545598 ) ) ( not ( = ?auto_545593 ?auto_545599 ) ) ( not ( = ?auto_545593 ?auto_545600 ) ) ( not ( = ?auto_545593 ?auto_545601 ) ) ( not ( = ?auto_545593 ?auto_545602 ) ) ( not ( = ?auto_545593 ?auto_545603 ) ) ( not ( = ?auto_545593 ?auto_545604 ) ) ( not ( = ?auto_545593 ?auto_545608 ) ) ( not ( = ?auto_545594 ?auto_545595 ) ) ( not ( = ?auto_545594 ?auto_545596 ) ) ( not ( = ?auto_545594 ?auto_545597 ) ) ( not ( = ?auto_545594 ?auto_545598 ) ) ( not ( = ?auto_545594 ?auto_545599 ) ) ( not ( = ?auto_545594 ?auto_545600 ) ) ( not ( = ?auto_545594 ?auto_545601 ) ) ( not ( = ?auto_545594 ?auto_545602 ) ) ( not ( = ?auto_545594 ?auto_545603 ) ) ( not ( = ?auto_545594 ?auto_545604 ) ) ( not ( = ?auto_545594 ?auto_545608 ) ) ( not ( = ?auto_545595 ?auto_545596 ) ) ( not ( = ?auto_545595 ?auto_545597 ) ) ( not ( = ?auto_545595 ?auto_545598 ) ) ( not ( = ?auto_545595 ?auto_545599 ) ) ( not ( = ?auto_545595 ?auto_545600 ) ) ( not ( = ?auto_545595 ?auto_545601 ) ) ( not ( = ?auto_545595 ?auto_545602 ) ) ( not ( = ?auto_545595 ?auto_545603 ) ) ( not ( = ?auto_545595 ?auto_545604 ) ) ( not ( = ?auto_545595 ?auto_545608 ) ) ( not ( = ?auto_545596 ?auto_545597 ) ) ( not ( = ?auto_545596 ?auto_545598 ) ) ( not ( = ?auto_545596 ?auto_545599 ) ) ( not ( = ?auto_545596 ?auto_545600 ) ) ( not ( = ?auto_545596 ?auto_545601 ) ) ( not ( = ?auto_545596 ?auto_545602 ) ) ( not ( = ?auto_545596 ?auto_545603 ) ) ( not ( = ?auto_545596 ?auto_545604 ) ) ( not ( = ?auto_545596 ?auto_545608 ) ) ( not ( = ?auto_545597 ?auto_545598 ) ) ( not ( = ?auto_545597 ?auto_545599 ) ) ( not ( = ?auto_545597 ?auto_545600 ) ) ( not ( = ?auto_545597 ?auto_545601 ) ) ( not ( = ?auto_545597 ?auto_545602 ) ) ( not ( = ?auto_545597 ?auto_545603 ) ) ( not ( = ?auto_545597 ?auto_545604 ) ) ( not ( = ?auto_545597 ?auto_545608 ) ) ( not ( = ?auto_545598 ?auto_545599 ) ) ( not ( = ?auto_545598 ?auto_545600 ) ) ( not ( = ?auto_545598 ?auto_545601 ) ) ( not ( = ?auto_545598 ?auto_545602 ) ) ( not ( = ?auto_545598 ?auto_545603 ) ) ( not ( = ?auto_545598 ?auto_545604 ) ) ( not ( = ?auto_545598 ?auto_545608 ) ) ( not ( = ?auto_545599 ?auto_545600 ) ) ( not ( = ?auto_545599 ?auto_545601 ) ) ( not ( = ?auto_545599 ?auto_545602 ) ) ( not ( = ?auto_545599 ?auto_545603 ) ) ( not ( = ?auto_545599 ?auto_545604 ) ) ( not ( = ?auto_545599 ?auto_545608 ) ) ( not ( = ?auto_545600 ?auto_545601 ) ) ( not ( = ?auto_545600 ?auto_545602 ) ) ( not ( = ?auto_545600 ?auto_545603 ) ) ( not ( = ?auto_545600 ?auto_545604 ) ) ( not ( = ?auto_545600 ?auto_545608 ) ) ( not ( = ?auto_545601 ?auto_545602 ) ) ( not ( = ?auto_545601 ?auto_545603 ) ) ( not ( = ?auto_545601 ?auto_545604 ) ) ( not ( = ?auto_545601 ?auto_545608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_545602 ?auto_545603 ?auto_545604 )
      ( MAKE-11CRATE-VERIFY ?auto_545593 ?auto_545594 ?auto_545595 ?auto_545596 ?auto_545597 ?auto_545598 ?auto_545599 ?auto_545600 ?auto_545601 ?auto_545602 ?auto_545603 ?auto_545604 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545737 - SURFACE
      ?auto_545738 - SURFACE
      ?auto_545739 - SURFACE
      ?auto_545740 - SURFACE
      ?auto_545741 - SURFACE
      ?auto_545742 - SURFACE
      ?auto_545743 - SURFACE
      ?auto_545744 - SURFACE
      ?auto_545745 - SURFACE
      ?auto_545746 - SURFACE
      ?auto_545747 - SURFACE
      ?auto_545748 - SURFACE
    )
    :vars
    (
      ?auto_545749 - HOIST
      ?auto_545754 - PLACE
      ?auto_545751 - PLACE
      ?auto_545752 - HOIST
      ?auto_545750 - SURFACE
      ?auto_545753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_545749 ?auto_545754 ) ( IS-CRATE ?auto_545748 ) ( not ( = ?auto_545747 ?auto_545748 ) ) ( not ( = ?auto_545746 ?auto_545747 ) ) ( not ( = ?auto_545746 ?auto_545748 ) ) ( not ( = ?auto_545751 ?auto_545754 ) ) ( HOIST-AT ?auto_545752 ?auto_545751 ) ( not ( = ?auto_545749 ?auto_545752 ) ) ( AVAILABLE ?auto_545752 ) ( SURFACE-AT ?auto_545748 ?auto_545751 ) ( ON ?auto_545748 ?auto_545750 ) ( CLEAR ?auto_545748 ) ( not ( = ?auto_545747 ?auto_545750 ) ) ( not ( = ?auto_545748 ?auto_545750 ) ) ( not ( = ?auto_545746 ?auto_545750 ) ) ( TRUCK-AT ?auto_545753 ?auto_545754 ) ( SURFACE-AT ?auto_545746 ?auto_545754 ) ( CLEAR ?auto_545746 ) ( LIFTING ?auto_545749 ?auto_545747 ) ( IS-CRATE ?auto_545747 ) ( ON ?auto_545738 ?auto_545737 ) ( ON ?auto_545739 ?auto_545738 ) ( ON ?auto_545740 ?auto_545739 ) ( ON ?auto_545741 ?auto_545740 ) ( ON ?auto_545742 ?auto_545741 ) ( ON ?auto_545743 ?auto_545742 ) ( ON ?auto_545744 ?auto_545743 ) ( ON ?auto_545745 ?auto_545744 ) ( ON ?auto_545746 ?auto_545745 ) ( not ( = ?auto_545737 ?auto_545738 ) ) ( not ( = ?auto_545737 ?auto_545739 ) ) ( not ( = ?auto_545737 ?auto_545740 ) ) ( not ( = ?auto_545737 ?auto_545741 ) ) ( not ( = ?auto_545737 ?auto_545742 ) ) ( not ( = ?auto_545737 ?auto_545743 ) ) ( not ( = ?auto_545737 ?auto_545744 ) ) ( not ( = ?auto_545737 ?auto_545745 ) ) ( not ( = ?auto_545737 ?auto_545746 ) ) ( not ( = ?auto_545737 ?auto_545747 ) ) ( not ( = ?auto_545737 ?auto_545748 ) ) ( not ( = ?auto_545737 ?auto_545750 ) ) ( not ( = ?auto_545738 ?auto_545739 ) ) ( not ( = ?auto_545738 ?auto_545740 ) ) ( not ( = ?auto_545738 ?auto_545741 ) ) ( not ( = ?auto_545738 ?auto_545742 ) ) ( not ( = ?auto_545738 ?auto_545743 ) ) ( not ( = ?auto_545738 ?auto_545744 ) ) ( not ( = ?auto_545738 ?auto_545745 ) ) ( not ( = ?auto_545738 ?auto_545746 ) ) ( not ( = ?auto_545738 ?auto_545747 ) ) ( not ( = ?auto_545738 ?auto_545748 ) ) ( not ( = ?auto_545738 ?auto_545750 ) ) ( not ( = ?auto_545739 ?auto_545740 ) ) ( not ( = ?auto_545739 ?auto_545741 ) ) ( not ( = ?auto_545739 ?auto_545742 ) ) ( not ( = ?auto_545739 ?auto_545743 ) ) ( not ( = ?auto_545739 ?auto_545744 ) ) ( not ( = ?auto_545739 ?auto_545745 ) ) ( not ( = ?auto_545739 ?auto_545746 ) ) ( not ( = ?auto_545739 ?auto_545747 ) ) ( not ( = ?auto_545739 ?auto_545748 ) ) ( not ( = ?auto_545739 ?auto_545750 ) ) ( not ( = ?auto_545740 ?auto_545741 ) ) ( not ( = ?auto_545740 ?auto_545742 ) ) ( not ( = ?auto_545740 ?auto_545743 ) ) ( not ( = ?auto_545740 ?auto_545744 ) ) ( not ( = ?auto_545740 ?auto_545745 ) ) ( not ( = ?auto_545740 ?auto_545746 ) ) ( not ( = ?auto_545740 ?auto_545747 ) ) ( not ( = ?auto_545740 ?auto_545748 ) ) ( not ( = ?auto_545740 ?auto_545750 ) ) ( not ( = ?auto_545741 ?auto_545742 ) ) ( not ( = ?auto_545741 ?auto_545743 ) ) ( not ( = ?auto_545741 ?auto_545744 ) ) ( not ( = ?auto_545741 ?auto_545745 ) ) ( not ( = ?auto_545741 ?auto_545746 ) ) ( not ( = ?auto_545741 ?auto_545747 ) ) ( not ( = ?auto_545741 ?auto_545748 ) ) ( not ( = ?auto_545741 ?auto_545750 ) ) ( not ( = ?auto_545742 ?auto_545743 ) ) ( not ( = ?auto_545742 ?auto_545744 ) ) ( not ( = ?auto_545742 ?auto_545745 ) ) ( not ( = ?auto_545742 ?auto_545746 ) ) ( not ( = ?auto_545742 ?auto_545747 ) ) ( not ( = ?auto_545742 ?auto_545748 ) ) ( not ( = ?auto_545742 ?auto_545750 ) ) ( not ( = ?auto_545743 ?auto_545744 ) ) ( not ( = ?auto_545743 ?auto_545745 ) ) ( not ( = ?auto_545743 ?auto_545746 ) ) ( not ( = ?auto_545743 ?auto_545747 ) ) ( not ( = ?auto_545743 ?auto_545748 ) ) ( not ( = ?auto_545743 ?auto_545750 ) ) ( not ( = ?auto_545744 ?auto_545745 ) ) ( not ( = ?auto_545744 ?auto_545746 ) ) ( not ( = ?auto_545744 ?auto_545747 ) ) ( not ( = ?auto_545744 ?auto_545748 ) ) ( not ( = ?auto_545744 ?auto_545750 ) ) ( not ( = ?auto_545745 ?auto_545746 ) ) ( not ( = ?auto_545745 ?auto_545747 ) ) ( not ( = ?auto_545745 ?auto_545748 ) ) ( not ( = ?auto_545745 ?auto_545750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_545746 ?auto_545747 ?auto_545748 )
      ( MAKE-11CRATE-VERIFY ?auto_545737 ?auto_545738 ?auto_545739 ?auto_545740 ?auto_545741 ?auto_545742 ?auto_545743 ?auto_545744 ?auto_545745 ?auto_545746 ?auto_545747 ?auto_545748 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_545881 - SURFACE
      ?auto_545882 - SURFACE
      ?auto_545883 - SURFACE
      ?auto_545884 - SURFACE
      ?auto_545885 - SURFACE
      ?auto_545886 - SURFACE
      ?auto_545887 - SURFACE
      ?auto_545888 - SURFACE
      ?auto_545889 - SURFACE
      ?auto_545890 - SURFACE
      ?auto_545891 - SURFACE
      ?auto_545892 - SURFACE
    )
    :vars
    (
      ?auto_545894 - HOIST
      ?auto_545898 - PLACE
      ?auto_545893 - PLACE
      ?auto_545897 - HOIST
      ?auto_545896 - SURFACE
      ?auto_545895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_545894 ?auto_545898 ) ( IS-CRATE ?auto_545892 ) ( not ( = ?auto_545891 ?auto_545892 ) ) ( not ( = ?auto_545890 ?auto_545891 ) ) ( not ( = ?auto_545890 ?auto_545892 ) ) ( not ( = ?auto_545893 ?auto_545898 ) ) ( HOIST-AT ?auto_545897 ?auto_545893 ) ( not ( = ?auto_545894 ?auto_545897 ) ) ( AVAILABLE ?auto_545897 ) ( SURFACE-AT ?auto_545892 ?auto_545893 ) ( ON ?auto_545892 ?auto_545896 ) ( CLEAR ?auto_545892 ) ( not ( = ?auto_545891 ?auto_545896 ) ) ( not ( = ?auto_545892 ?auto_545896 ) ) ( not ( = ?auto_545890 ?auto_545896 ) ) ( TRUCK-AT ?auto_545895 ?auto_545898 ) ( SURFACE-AT ?auto_545890 ?auto_545898 ) ( CLEAR ?auto_545890 ) ( IS-CRATE ?auto_545891 ) ( AVAILABLE ?auto_545894 ) ( IN ?auto_545891 ?auto_545895 ) ( ON ?auto_545882 ?auto_545881 ) ( ON ?auto_545883 ?auto_545882 ) ( ON ?auto_545884 ?auto_545883 ) ( ON ?auto_545885 ?auto_545884 ) ( ON ?auto_545886 ?auto_545885 ) ( ON ?auto_545887 ?auto_545886 ) ( ON ?auto_545888 ?auto_545887 ) ( ON ?auto_545889 ?auto_545888 ) ( ON ?auto_545890 ?auto_545889 ) ( not ( = ?auto_545881 ?auto_545882 ) ) ( not ( = ?auto_545881 ?auto_545883 ) ) ( not ( = ?auto_545881 ?auto_545884 ) ) ( not ( = ?auto_545881 ?auto_545885 ) ) ( not ( = ?auto_545881 ?auto_545886 ) ) ( not ( = ?auto_545881 ?auto_545887 ) ) ( not ( = ?auto_545881 ?auto_545888 ) ) ( not ( = ?auto_545881 ?auto_545889 ) ) ( not ( = ?auto_545881 ?auto_545890 ) ) ( not ( = ?auto_545881 ?auto_545891 ) ) ( not ( = ?auto_545881 ?auto_545892 ) ) ( not ( = ?auto_545881 ?auto_545896 ) ) ( not ( = ?auto_545882 ?auto_545883 ) ) ( not ( = ?auto_545882 ?auto_545884 ) ) ( not ( = ?auto_545882 ?auto_545885 ) ) ( not ( = ?auto_545882 ?auto_545886 ) ) ( not ( = ?auto_545882 ?auto_545887 ) ) ( not ( = ?auto_545882 ?auto_545888 ) ) ( not ( = ?auto_545882 ?auto_545889 ) ) ( not ( = ?auto_545882 ?auto_545890 ) ) ( not ( = ?auto_545882 ?auto_545891 ) ) ( not ( = ?auto_545882 ?auto_545892 ) ) ( not ( = ?auto_545882 ?auto_545896 ) ) ( not ( = ?auto_545883 ?auto_545884 ) ) ( not ( = ?auto_545883 ?auto_545885 ) ) ( not ( = ?auto_545883 ?auto_545886 ) ) ( not ( = ?auto_545883 ?auto_545887 ) ) ( not ( = ?auto_545883 ?auto_545888 ) ) ( not ( = ?auto_545883 ?auto_545889 ) ) ( not ( = ?auto_545883 ?auto_545890 ) ) ( not ( = ?auto_545883 ?auto_545891 ) ) ( not ( = ?auto_545883 ?auto_545892 ) ) ( not ( = ?auto_545883 ?auto_545896 ) ) ( not ( = ?auto_545884 ?auto_545885 ) ) ( not ( = ?auto_545884 ?auto_545886 ) ) ( not ( = ?auto_545884 ?auto_545887 ) ) ( not ( = ?auto_545884 ?auto_545888 ) ) ( not ( = ?auto_545884 ?auto_545889 ) ) ( not ( = ?auto_545884 ?auto_545890 ) ) ( not ( = ?auto_545884 ?auto_545891 ) ) ( not ( = ?auto_545884 ?auto_545892 ) ) ( not ( = ?auto_545884 ?auto_545896 ) ) ( not ( = ?auto_545885 ?auto_545886 ) ) ( not ( = ?auto_545885 ?auto_545887 ) ) ( not ( = ?auto_545885 ?auto_545888 ) ) ( not ( = ?auto_545885 ?auto_545889 ) ) ( not ( = ?auto_545885 ?auto_545890 ) ) ( not ( = ?auto_545885 ?auto_545891 ) ) ( not ( = ?auto_545885 ?auto_545892 ) ) ( not ( = ?auto_545885 ?auto_545896 ) ) ( not ( = ?auto_545886 ?auto_545887 ) ) ( not ( = ?auto_545886 ?auto_545888 ) ) ( not ( = ?auto_545886 ?auto_545889 ) ) ( not ( = ?auto_545886 ?auto_545890 ) ) ( not ( = ?auto_545886 ?auto_545891 ) ) ( not ( = ?auto_545886 ?auto_545892 ) ) ( not ( = ?auto_545886 ?auto_545896 ) ) ( not ( = ?auto_545887 ?auto_545888 ) ) ( not ( = ?auto_545887 ?auto_545889 ) ) ( not ( = ?auto_545887 ?auto_545890 ) ) ( not ( = ?auto_545887 ?auto_545891 ) ) ( not ( = ?auto_545887 ?auto_545892 ) ) ( not ( = ?auto_545887 ?auto_545896 ) ) ( not ( = ?auto_545888 ?auto_545889 ) ) ( not ( = ?auto_545888 ?auto_545890 ) ) ( not ( = ?auto_545888 ?auto_545891 ) ) ( not ( = ?auto_545888 ?auto_545892 ) ) ( not ( = ?auto_545888 ?auto_545896 ) ) ( not ( = ?auto_545889 ?auto_545890 ) ) ( not ( = ?auto_545889 ?auto_545891 ) ) ( not ( = ?auto_545889 ?auto_545892 ) ) ( not ( = ?auto_545889 ?auto_545896 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_545890 ?auto_545891 ?auto_545892 )
      ( MAKE-11CRATE-VERIFY ?auto_545881 ?auto_545882 ?auto_545883 ?auto_545884 ?auto_545885 ?auto_545886 ?auto_545887 ?auto_545888 ?auto_545889 ?auto_545890 ?auto_545891 ?auto_545892 ) )
  )

)

