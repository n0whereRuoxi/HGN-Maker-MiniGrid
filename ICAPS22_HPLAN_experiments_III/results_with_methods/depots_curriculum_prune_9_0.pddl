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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5000 - SURFACE
      ?auto_5001 - SURFACE
    )
    :vars
    (
      ?auto_5002 - HOIST
      ?auto_5003 - PLACE
      ?auto_5005 - PLACE
      ?auto_5006 - HOIST
      ?auto_5007 - SURFACE
      ?auto_5004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5002 ?auto_5003 ) ( SURFACE-AT ?auto_5000 ?auto_5003 ) ( CLEAR ?auto_5000 ) ( IS-CRATE ?auto_5001 ) ( AVAILABLE ?auto_5002 ) ( not ( = ?auto_5005 ?auto_5003 ) ) ( HOIST-AT ?auto_5006 ?auto_5005 ) ( AVAILABLE ?auto_5006 ) ( SURFACE-AT ?auto_5001 ?auto_5005 ) ( ON ?auto_5001 ?auto_5007 ) ( CLEAR ?auto_5001 ) ( TRUCK-AT ?auto_5004 ?auto_5003 ) ( not ( = ?auto_5000 ?auto_5001 ) ) ( not ( = ?auto_5000 ?auto_5007 ) ) ( not ( = ?auto_5001 ?auto_5007 ) ) ( not ( = ?auto_5002 ?auto_5006 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5004 ?auto_5003 ?auto_5005 )
      ( !LIFT ?auto_5006 ?auto_5001 ?auto_5007 ?auto_5005 )
      ( !LOAD ?auto_5006 ?auto_5001 ?auto_5004 ?auto_5005 )
      ( !DRIVE ?auto_5004 ?auto_5005 ?auto_5003 )
      ( !UNLOAD ?auto_5002 ?auto_5001 ?auto_5004 ?auto_5003 )
      ( !DROP ?auto_5002 ?auto_5001 ?auto_5000 ?auto_5003 )
      ( MAKE-1CRATE-VERIFY ?auto_5000 ?auto_5001 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5021 - SURFACE
      ?auto_5022 - SURFACE
      ?auto_5023 - SURFACE
    )
    :vars
    (
      ?auto_5025 - HOIST
      ?auto_5028 - PLACE
      ?auto_5027 - PLACE
      ?auto_5024 - HOIST
      ?auto_5029 - SURFACE
      ?auto_5032 - PLACE
      ?auto_5031 - HOIST
      ?auto_5030 - SURFACE
      ?auto_5026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5025 ?auto_5028 ) ( IS-CRATE ?auto_5023 ) ( not ( = ?auto_5027 ?auto_5028 ) ) ( HOIST-AT ?auto_5024 ?auto_5027 ) ( AVAILABLE ?auto_5024 ) ( SURFACE-AT ?auto_5023 ?auto_5027 ) ( ON ?auto_5023 ?auto_5029 ) ( CLEAR ?auto_5023 ) ( not ( = ?auto_5022 ?auto_5023 ) ) ( not ( = ?auto_5022 ?auto_5029 ) ) ( not ( = ?auto_5023 ?auto_5029 ) ) ( not ( = ?auto_5025 ?auto_5024 ) ) ( SURFACE-AT ?auto_5021 ?auto_5028 ) ( CLEAR ?auto_5021 ) ( IS-CRATE ?auto_5022 ) ( AVAILABLE ?auto_5025 ) ( not ( = ?auto_5032 ?auto_5028 ) ) ( HOIST-AT ?auto_5031 ?auto_5032 ) ( AVAILABLE ?auto_5031 ) ( SURFACE-AT ?auto_5022 ?auto_5032 ) ( ON ?auto_5022 ?auto_5030 ) ( CLEAR ?auto_5022 ) ( TRUCK-AT ?auto_5026 ?auto_5028 ) ( not ( = ?auto_5021 ?auto_5022 ) ) ( not ( = ?auto_5021 ?auto_5030 ) ) ( not ( = ?auto_5022 ?auto_5030 ) ) ( not ( = ?auto_5025 ?auto_5031 ) ) ( not ( = ?auto_5021 ?auto_5023 ) ) ( not ( = ?auto_5021 ?auto_5029 ) ) ( not ( = ?auto_5023 ?auto_5030 ) ) ( not ( = ?auto_5027 ?auto_5032 ) ) ( not ( = ?auto_5024 ?auto_5031 ) ) ( not ( = ?auto_5029 ?auto_5030 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5021 ?auto_5022 )
      ( MAKE-1CRATE ?auto_5022 ?auto_5023 )
      ( MAKE-2CRATE-VERIFY ?auto_5021 ?auto_5022 ?auto_5023 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5047 - SURFACE
      ?auto_5048 - SURFACE
      ?auto_5049 - SURFACE
      ?auto_5050 - SURFACE
    )
    :vars
    (
      ?auto_5051 - HOIST
      ?auto_5054 - PLACE
      ?auto_5053 - PLACE
      ?auto_5055 - HOIST
      ?auto_5052 - SURFACE
      ?auto_5057 - PLACE
      ?auto_5060 - HOIST
      ?auto_5058 - SURFACE
      ?auto_5062 - PLACE
      ?auto_5061 - HOIST
      ?auto_5059 - SURFACE
      ?auto_5056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5051 ?auto_5054 ) ( IS-CRATE ?auto_5050 ) ( not ( = ?auto_5053 ?auto_5054 ) ) ( HOIST-AT ?auto_5055 ?auto_5053 ) ( AVAILABLE ?auto_5055 ) ( SURFACE-AT ?auto_5050 ?auto_5053 ) ( ON ?auto_5050 ?auto_5052 ) ( CLEAR ?auto_5050 ) ( not ( = ?auto_5049 ?auto_5050 ) ) ( not ( = ?auto_5049 ?auto_5052 ) ) ( not ( = ?auto_5050 ?auto_5052 ) ) ( not ( = ?auto_5051 ?auto_5055 ) ) ( IS-CRATE ?auto_5049 ) ( not ( = ?auto_5057 ?auto_5054 ) ) ( HOIST-AT ?auto_5060 ?auto_5057 ) ( AVAILABLE ?auto_5060 ) ( SURFACE-AT ?auto_5049 ?auto_5057 ) ( ON ?auto_5049 ?auto_5058 ) ( CLEAR ?auto_5049 ) ( not ( = ?auto_5048 ?auto_5049 ) ) ( not ( = ?auto_5048 ?auto_5058 ) ) ( not ( = ?auto_5049 ?auto_5058 ) ) ( not ( = ?auto_5051 ?auto_5060 ) ) ( SURFACE-AT ?auto_5047 ?auto_5054 ) ( CLEAR ?auto_5047 ) ( IS-CRATE ?auto_5048 ) ( AVAILABLE ?auto_5051 ) ( not ( = ?auto_5062 ?auto_5054 ) ) ( HOIST-AT ?auto_5061 ?auto_5062 ) ( AVAILABLE ?auto_5061 ) ( SURFACE-AT ?auto_5048 ?auto_5062 ) ( ON ?auto_5048 ?auto_5059 ) ( CLEAR ?auto_5048 ) ( TRUCK-AT ?auto_5056 ?auto_5054 ) ( not ( = ?auto_5047 ?auto_5048 ) ) ( not ( = ?auto_5047 ?auto_5059 ) ) ( not ( = ?auto_5048 ?auto_5059 ) ) ( not ( = ?auto_5051 ?auto_5061 ) ) ( not ( = ?auto_5047 ?auto_5049 ) ) ( not ( = ?auto_5047 ?auto_5058 ) ) ( not ( = ?auto_5049 ?auto_5059 ) ) ( not ( = ?auto_5057 ?auto_5062 ) ) ( not ( = ?auto_5060 ?auto_5061 ) ) ( not ( = ?auto_5058 ?auto_5059 ) ) ( not ( = ?auto_5047 ?auto_5050 ) ) ( not ( = ?auto_5047 ?auto_5052 ) ) ( not ( = ?auto_5048 ?auto_5050 ) ) ( not ( = ?auto_5048 ?auto_5052 ) ) ( not ( = ?auto_5050 ?auto_5058 ) ) ( not ( = ?auto_5050 ?auto_5059 ) ) ( not ( = ?auto_5053 ?auto_5057 ) ) ( not ( = ?auto_5053 ?auto_5062 ) ) ( not ( = ?auto_5055 ?auto_5060 ) ) ( not ( = ?auto_5055 ?auto_5061 ) ) ( not ( = ?auto_5052 ?auto_5058 ) ) ( not ( = ?auto_5052 ?auto_5059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5047 ?auto_5048 ?auto_5049 )
      ( MAKE-1CRATE ?auto_5049 ?auto_5050 )
      ( MAKE-3CRATE-VERIFY ?auto_5047 ?auto_5048 ?auto_5049 ?auto_5050 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5078 - SURFACE
      ?auto_5079 - SURFACE
      ?auto_5080 - SURFACE
      ?auto_5081 - SURFACE
      ?auto_5082 - SURFACE
    )
    :vars
    (
      ?auto_5087 - HOIST
      ?auto_5088 - PLACE
      ?auto_5084 - PLACE
      ?auto_5086 - HOIST
      ?auto_5085 - SURFACE
      ?auto_5089 - PLACE
      ?auto_5093 - HOIST
      ?auto_5090 - SURFACE
      ?auto_5091 - PLACE
      ?auto_5097 - HOIST
      ?auto_5092 - SURFACE
      ?auto_5094 - PLACE
      ?auto_5096 - HOIST
      ?auto_5095 - SURFACE
      ?auto_5083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5087 ?auto_5088 ) ( IS-CRATE ?auto_5082 ) ( not ( = ?auto_5084 ?auto_5088 ) ) ( HOIST-AT ?auto_5086 ?auto_5084 ) ( AVAILABLE ?auto_5086 ) ( SURFACE-AT ?auto_5082 ?auto_5084 ) ( ON ?auto_5082 ?auto_5085 ) ( CLEAR ?auto_5082 ) ( not ( = ?auto_5081 ?auto_5082 ) ) ( not ( = ?auto_5081 ?auto_5085 ) ) ( not ( = ?auto_5082 ?auto_5085 ) ) ( not ( = ?auto_5087 ?auto_5086 ) ) ( IS-CRATE ?auto_5081 ) ( not ( = ?auto_5089 ?auto_5088 ) ) ( HOIST-AT ?auto_5093 ?auto_5089 ) ( AVAILABLE ?auto_5093 ) ( SURFACE-AT ?auto_5081 ?auto_5089 ) ( ON ?auto_5081 ?auto_5090 ) ( CLEAR ?auto_5081 ) ( not ( = ?auto_5080 ?auto_5081 ) ) ( not ( = ?auto_5080 ?auto_5090 ) ) ( not ( = ?auto_5081 ?auto_5090 ) ) ( not ( = ?auto_5087 ?auto_5093 ) ) ( IS-CRATE ?auto_5080 ) ( not ( = ?auto_5091 ?auto_5088 ) ) ( HOIST-AT ?auto_5097 ?auto_5091 ) ( AVAILABLE ?auto_5097 ) ( SURFACE-AT ?auto_5080 ?auto_5091 ) ( ON ?auto_5080 ?auto_5092 ) ( CLEAR ?auto_5080 ) ( not ( = ?auto_5079 ?auto_5080 ) ) ( not ( = ?auto_5079 ?auto_5092 ) ) ( not ( = ?auto_5080 ?auto_5092 ) ) ( not ( = ?auto_5087 ?auto_5097 ) ) ( SURFACE-AT ?auto_5078 ?auto_5088 ) ( CLEAR ?auto_5078 ) ( IS-CRATE ?auto_5079 ) ( AVAILABLE ?auto_5087 ) ( not ( = ?auto_5094 ?auto_5088 ) ) ( HOIST-AT ?auto_5096 ?auto_5094 ) ( AVAILABLE ?auto_5096 ) ( SURFACE-AT ?auto_5079 ?auto_5094 ) ( ON ?auto_5079 ?auto_5095 ) ( CLEAR ?auto_5079 ) ( TRUCK-AT ?auto_5083 ?auto_5088 ) ( not ( = ?auto_5078 ?auto_5079 ) ) ( not ( = ?auto_5078 ?auto_5095 ) ) ( not ( = ?auto_5079 ?auto_5095 ) ) ( not ( = ?auto_5087 ?auto_5096 ) ) ( not ( = ?auto_5078 ?auto_5080 ) ) ( not ( = ?auto_5078 ?auto_5092 ) ) ( not ( = ?auto_5080 ?auto_5095 ) ) ( not ( = ?auto_5091 ?auto_5094 ) ) ( not ( = ?auto_5097 ?auto_5096 ) ) ( not ( = ?auto_5092 ?auto_5095 ) ) ( not ( = ?auto_5078 ?auto_5081 ) ) ( not ( = ?auto_5078 ?auto_5090 ) ) ( not ( = ?auto_5079 ?auto_5081 ) ) ( not ( = ?auto_5079 ?auto_5090 ) ) ( not ( = ?auto_5081 ?auto_5092 ) ) ( not ( = ?auto_5081 ?auto_5095 ) ) ( not ( = ?auto_5089 ?auto_5091 ) ) ( not ( = ?auto_5089 ?auto_5094 ) ) ( not ( = ?auto_5093 ?auto_5097 ) ) ( not ( = ?auto_5093 ?auto_5096 ) ) ( not ( = ?auto_5090 ?auto_5092 ) ) ( not ( = ?auto_5090 ?auto_5095 ) ) ( not ( = ?auto_5078 ?auto_5082 ) ) ( not ( = ?auto_5078 ?auto_5085 ) ) ( not ( = ?auto_5079 ?auto_5082 ) ) ( not ( = ?auto_5079 ?auto_5085 ) ) ( not ( = ?auto_5080 ?auto_5082 ) ) ( not ( = ?auto_5080 ?auto_5085 ) ) ( not ( = ?auto_5082 ?auto_5090 ) ) ( not ( = ?auto_5082 ?auto_5092 ) ) ( not ( = ?auto_5082 ?auto_5095 ) ) ( not ( = ?auto_5084 ?auto_5089 ) ) ( not ( = ?auto_5084 ?auto_5091 ) ) ( not ( = ?auto_5084 ?auto_5094 ) ) ( not ( = ?auto_5086 ?auto_5093 ) ) ( not ( = ?auto_5086 ?auto_5097 ) ) ( not ( = ?auto_5086 ?auto_5096 ) ) ( not ( = ?auto_5085 ?auto_5090 ) ) ( not ( = ?auto_5085 ?auto_5092 ) ) ( not ( = ?auto_5085 ?auto_5095 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5078 ?auto_5079 ?auto_5080 ?auto_5081 )
      ( MAKE-1CRATE ?auto_5081 ?auto_5082 )
      ( MAKE-4CRATE-VERIFY ?auto_5078 ?auto_5079 ?auto_5080 ?auto_5081 ?auto_5082 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_5114 - SURFACE
      ?auto_5115 - SURFACE
      ?auto_5116 - SURFACE
      ?auto_5117 - SURFACE
      ?auto_5118 - SURFACE
      ?auto_5119 - SURFACE
    )
    :vars
    (
      ?auto_5120 - HOIST
      ?auto_5125 - PLACE
      ?auto_5122 - PLACE
      ?auto_5121 - HOIST
      ?auto_5124 - SURFACE
      ?auto_5130 - PLACE
      ?auto_5135 - HOIST
      ?auto_5132 - SURFACE
      ?auto_5136 - PLACE
      ?auto_5127 - HOIST
      ?auto_5137 - SURFACE
      ?auto_5133 - PLACE
      ?auto_5134 - HOIST
      ?auto_5126 - SURFACE
      ?auto_5128 - PLACE
      ?auto_5131 - HOIST
      ?auto_5129 - SURFACE
      ?auto_5123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5120 ?auto_5125 ) ( IS-CRATE ?auto_5119 ) ( not ( = ?auto_5122 ?auto_5125 ) ) ( HOIST-AT ?auto_5121 ?auto_5122 ) ( AVAILABLE ?auto_5121 ) ( SURFACE-AT ?auto_5119 ?auto_5122 ) ( ON ?auto_5119 ?auto_5124 ) ( CLEAR ?auto_5119 ) ( not ( = ?auto_5118 ?auto_5119 ) ) ( not ( = ?auto_5118 ?auto_5124 ) ) ( not ( = ?auto_5119 ?auto_5124 ) ) ( not ( = ?auto_5120 ?auto_5121 ) ) ( IS-CRATE ?auto_5118 ) ( not ( = ?auto_5130 ?auto_5125 ) ) ( HOIST-AT ?auto_5135 ?auto_5130 ) ( AVAILABLE ?auto_5135 ) ( SURFACE-AT ?auto_5118 ?auto_5130 ) ( ON ?auto_5118 ?auto_5132 ) ( CLEAR ?auto_5118 ) ( not ( = ?auto_5117 ?auto_5118 ) ) ( not ( = ?auto_5117 ?auto_5132 ) ) ( not ( = ?auto_5118 ?auto_5132 ) ) ( not ( = ?auto_5120 ?auto_5135 ) ) ( IS-CRATE ?auto_5117 ) ( not ( = ?auto_5136 ?auto_5125 ) ) ( HOIST-AT ?auto_5127 ?auto_5136 ) ( AVAILABLE ?auto_5127 ) ( SURFACE-AT ?auto_5117 ?auto_5136 ) ( ON ?auto_5117 ?auto_5137 ) ( CLEAR ?auto_5117 ) ( not ( = ?auto_5116 ?auto_5117 ) ) ( not ( = ?auto_5116 ?auto_5137 ) ) ( not ( = ?auto_5117 ?auto_5137 ) ) ( not ( = ?auto_5120 ?auto_5127 ) ) ( IS-CRATE ?auto_5116 ) ( not ( = ?auto_5133 ?auto_5125 ) ) ( HOIST-AT ?auto_5134 ?auto_5133 ) ( AVAILABLE ?auto_5134 ) ( SURFACE-AT ?auto_5116 ?auto_5133 ) ( ON ?auto_5116 ?auto_5126 ) ( CLEAR ?auto_5116 ) ( not ( = ?auto_5115 ?auto_5116 ) ) ( not ( = ?auto_5115 ?auto_5126 ) ) ( not ( = ?auto_5116 ?auto_5126 ) ) ( not ( = ?auto_5120 ?auto_5134 ) ) ( SURFACE-AT ?auto_5114 ?auto_5125 ) ( CLEAR ?auto_5114 ) ( IS-CRATE ?auto_5115 ) ( AVAILABLE ?auto_5120 ) ( not ( = ?auto_5128 ?auto_5125 ) ) ( HOIST-AT ?auto_5131 ?auto_5128 ) ( AVAILABLE ?auto_5131 ) ( SURFACE-AT ?auto_5115 ?auto_5128 ) ( ON ?auto_5115 ?auto_5129 ) ( CLEAR ?auto_5115 ) ( TRUCK-AT ?auto_5123 ?auto_5125 ) ( not ( = ?auto_5114 ?auto_5115 ) ) ( not ( = ?auto_5114 ?auto_5129 ) ) ( not ( = ?auto_5115 ?auto_5129 ) ) ( not ( = ?auto_5120 ?auto_5131 ) ) ( not ( = ?auto_5114 ?auto_5116 ) ) ( not ( = ?auto_5114 ?auto_5126 ) ) ( not ( = ?auto_5116 ?auto_5129 ) ) ( not ( = ?auto_5133 ?auto_5128 ) ) ( not ( = ?auto_5134 ?auto_5131 ) ) ( not ( = ?auto_5126 ?auto_5129 ) ) ( not ( = ?auto_5114 ?auto_5117 ) ) ( not ( = ?auto_5114 ?auto_5137 ) ) ( not ( = ?auto_5115 ?auto_5117 ) ) ( not ( = ?auto_5115 ?auto_5137 ) ) ( not ( = ?auto_5117 ?auto_5126 ) ) ( not ( = ?auto_5117 ?auto_5129 ) ) ( not ( = ?auto_5136 ?auto_5133 ) ) ( not ( = ?auto_5136 ?auto_5128 ) ) ( not ( = ?auto_5127 ?auto_5134 ) ) ( not ( = ?auto_5127 ?auto_5131 ) ) ( not ( = ?auto_5137 ?auto_5126 ) ) ( not ( = ?auto_5137 ?auto_5129 ) ) ( not ( = ?auto_5114 ?auto_5118 ) ) ( not ( = ?auto_5114 ?auto_5132 ) ) ( not ( = ?auto_5115 ?auto_5118 ) ) ( not ( = ?auto_5115 ?auto_5132 ) ) ( not ( = ?auto_5116 ?auto_5118 ) ) ( not ( = ?auto_5116 ?auto_5132 ) ) ( not ( = ?auto_5118 ?auto_5137 ) ) ( not ( = ?auto_5118 ?auto_5126 ) ) ( not ( = ?auto_5118 ?auto_5129 ) ) ( not ( = ?auto_5130 ?auto_5136 ) ) ( not ( = ?auto_5130 ?auto_5133 ) ) ( not ( = ?auto_5130 ?auto_5128 ) ) ( not ( = ?auto_5135 ?auto_5127 ) ) ( not ( = ?auto_5135 ?auto_5134 ) ) ( not ( = ?auto_5135 ?auto_5131 ) ) ( not ( = ?auto_5132 ?auto_5137 ) ) ( not ( = ?auto_5132 ?auto_5126 ) ) ( not ( = ?auto_5132 ?auto_5129 ) ) ( not ( = ?auto_5114 ?auto_5119 ) ) ( not ( = ?auto_5114 ?auto_5124 ) ) ( not ( = ?auto_5115 ?auto_5119 ) ) ( not ( = ?auto_5115 ?auto_5124 ) ) ( not ( = ?auto_5116 ?auto_5119 ) ) ( not ( = ?auto_5116 ?auto_5124 ) ) ( not ( = ?auto_5117 ?auto_5119 ) ) ( not ( = ?auto_5117 ?auto_5124 ) ) ( not ( = ?auto_5119 ?auto_5132 ) ) ( not ( = ?auto_5119 ?auto_5137 ) ) ( not ( = ?auto_5119 ?auto_5126 ) ) ( not ( = ?auto_5119 ?auto_5129 ) ) ( not ( = ?auto_5122 ?auto_5130 ) ) ( not ( = ?auto_5122 ?auto_5136 ) ) ( not ( = ?auto_5122 ?auto_5133 ) ) ( not ( = ?auto_5122 ?auto_5128 ) ) ( not ( = ?auto_5121 ?auto_5135 ) ) ( not ( = ?auto_5121 ?auto_5127 ) ) ( not ( = ?auto_5121 ?auto_5134 ) ) ( not ( = ?auto_5121 ?auto_5131 ) ) ( not ( = ?auto_5124 ?auto_5132 ) ) ( not ( = ?auto_5124 ?auto_5137 ) ) ( not ( = ?auto_5124 ?auto_5126 ) ) ( not ( = ?auto_5124 ?auto_5129 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5114 ?auto_5115 ?auto_5116 ?auto_5117 ?auto_5118 )
      ( MAKE-1CRATE ?auto_5118 ?auto_5119 )
      ( MAKE-5CRATE-VERIFY ?auto_5114 ?auto_5115 ?auto_5116 ?auto_5117 ?auto_5118 ?auto_5119 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_5155 - SURFACE
      ?auto_5156 - SURFACE
      ?auto_5157 - SURFACE
      ?auto_5158 - SURFACE
      ?auto_5159 - SURFACE
      ?auto_5160 - SURFACE
      ?auto_5161 - SURFACE
    )
    :vars
    (
      ?auto_5164 - HOIST
      ?auto_5163 - PLACE
      ?auto_5165 - PLACE
      ?auto_5166 - HOIST
      ?auto_5167 - SURFACE
      ?auto_5174 - PLACE
      ?auto_5180 - HOIST
      ?auto_5175 - SURFACE
      ?auto_5169 - PLACE
      ?auto_5172 - HOIST
      ?auto_5170 - SURFACE
      ?auto_5179 - PLACE
      ?auto_5181 - HOIST
      ?auto_5173 - SURFACE
      ?auto_5178 - PLACE
      ?auto_5177 - HOIST
      ?auto_5176 - SURFACE
      ?auto_5182 - PLACE
      ?auto_5171 - HOIST
      ?auto_5168 - SURFACE
      ?auto_5162 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5164 ?auto_5163 ) ( IS-CRATE ?auto_5161 ) ( not ( = ?auto_5165 ?auto_5163 ) ) ( HOIST-AT ?auto_5166 ?auto_5165 ) ( AVAILABLE ?auto_5166 ) ( SURFACE-AT ?auto_5161 ?auto_5165 ) ( ON ?auto_5161 ?auto_5167 ) ( CLEAR ?auto_5161 ) ( not ( = ?auto_5160 ?auto_5161 ) ) ( not ( = ?auto_5160 ?auto_5167 ) ) ( not ( = ?auto_5161 ?auto_5167 ) ) ( not ( = ?auto_5164 ?auto_5166 ) ) ( IS-CRATE ?auto_5160 ) ( not ( = ?auto_5174 ?auto_5163 ) ) ( HOIST-AT ?auto_5180 ?auto_5174 ) ( AVAILABLE ?auto_5180 ) ( SURFACE-AT ?auto_5160 ?auto_5174 ) ( ON ?auto_5160 ?auto_5175 ) ( CLEAR ?auto_5160 ) ( not ( = ?auto_5159 ?auto_5160 ) ) ( not ( = ?auto_5159 ?auto_5175 ) ) ( not ( = ?auto_5160 ?auto_5175 ) ) ( not ( = ?auto_5164 ?auto_5180 ) ) ( IS-CRATE ?auto_5159 ) ( not ( = ?auto_5169 ?auto_5163 ) ) ( HOIST-AT ?auto_5172 ?auto_5169 ) ( AVAILABLE ?auto_5172 ) ( SURFACE-AT ?auto_5159 ?auto_5169 ) ( ON ?auto_5159 ?auto_5170 ) ( CLEAR ?auto_5159 ) ( not ( = ?auto_5158 ?auto_5159 ) ) ( not ( = ?auto_5158 ?auto_5170 ) ) ( not ( = ?auto_5159 ?auto_5170 ) ) ( not ( = ?auto_5164 ?auto_5172 ) ) ( IS-CRATE ?auto_5158 ) ( not ( = ?auto_5179 ?auto_5163 ) ) ( HOIST-AT ?auto_5181 ?auto_5179 ) ( AVAILABLE ?auto_5181 ) ( SURFACE-AT ?auto_5158 ?auto_5179 ) ( ON ?auto_5158 ?auto_5173 ) ( CLEAR ?auto_5158 ) ( not ( = ?auto_5157 ?auto_5158 ) ) ( not ( = ?auto_5157 ?auto_5173 ) ) ( not ( = ?auto_5158 ?auto_5173 ) ) ( not ( = ?auto_5164 ?auto_5181 ) ) ( IS-CRATE ?auto_5157 ) ( not ( = ?auto_5178 ?auto_5163 ) ) ( HOIST-AT ?auto_5177 ?auto_5178 ) ( AVAILABLE ?auto_5177 ) ( SURFACE-AT ?auto_5157 ?auto_5178 ) ( ON ?auto_5157 ?auto_5176 ) ( CLEAR ?auto_5157 ) ( not ( = ?auto_5156 ?auto_5157 ) ) ( not ( = ?auto_5156 ?auto_5176 ) ) ( not ( = ?auto_5157 ?auto_5176 ) ) ( not ( = ?auto_5164 ?auto_5177 ) ) ( SURFACE-AT ?auto_5155 ?auto_5163 ) ( CLEAR ?auto_5155 ) ( IS-CRATE ?auto_5156 ) ( AVAILABLE ?auto_5164 ) ( not ( = ?auto_5182 ?auto_5163 ) ) ( HOIST-AT ?auto_5171 ?auto_5182 ) ( AVAILABLE ?auto_5171 ) ( SURFACE-AT ?auto_5156 ?auto_5182 ) ( ON ?auto_5156 ?auto_5168 ) ( CLEAR ?auto_5156 ) ( TRUCK-AT ?auto_5162 ?auto_5163 ) ( not ( = ?auto_5155 ?auto_5156 ) ) ( not ( = ?auto_5155 ?auto_5168 ) ) ( not ( = ?auto_5156 ?auto_5168 ) ) ( not ( = ?auto_5164 ?auto_5171 ) ) ( not ( = ?auto_5155 ?auto_5157 ) ) ( not ( = ?auto_5155 ?auto_5176 ) ) ( not ( = ?auto_5157 ?auto_5168 ) ) ( not ( = ?auto_5178 ?auto_5182 ) ) ( not ( = ?auto_5177 ?auto_5171 ) ) ( not ( = ?auto_5176 ?auto_5168 ) ) ( not ( = ?auto_5155 ?auto_5158 ) ) ( not ( = ?auto_5155 ?auto_5173 ) ) ( not ( = ?auto_5156 ?auto_5158 ) ) ( not ( = ?auto_5156 ?auto_5173 ) ) ( not ( = ?auto_5158 ?auto_5176 ) ) ( not ( = ?auto_5158 ?auto_5168 ) ) ( not ( = ?auto_5179 ?auto_5178 ) ) ( not ( = ?auto_5179 ?auto_5182 ) ) ( not ( = ?auto_5181 ?auto_5177 ) ) ( not ( = ?auto_5181 ?auto_5171 ) ) ( not ( = ?auto_5173 ?auto_5176 ) ) ( not ( = ?auto_5173 ?auto_5168 ) ) ( not ( = ?auto_5155 ?auto_5159 ) ) ( not ( = ?auto_5155 ?auto_5170 ) ) ( not ( = ?auto_5156 ?auto_5159 ) ) ( not ( = ?auto_5156 ?auto_5170 ) ) ( not ( = ?auto_5157 ?auto_5159 ) ) ( not ( = ?auto_5157 ?auto_5170 ) ) ( not ( = ?auto_5159 ?auto_5173 ) ) ( not ( = ?auto_5159 ?auto_5176 ) ) ( not ( = ?auto_5159 ?auto_5168 ) ) ( not ( = ?auto_5169 ?auto_5179 ) ) ( not ( = ?auto_5169 ?auto_5178 ) ) ( not ( = ?auto_5169 ?auto_5182 ) ) ( not ( = ?auto_5172 ?auto_5181 ) ) ( not ( = ?auto_5172 ?auto_5177 ) ) ( not ( = ?auto_5172 ?auto_5171 ) ) ( not ( = ?auto_5170 ?auto_5173 ) ) ( not ( = ?auto_5170 ?auto_5176 ) ) ( not ( = ?auto_5170 ?auto_5168 ) ) ( not ( = ?auto_5155 ?auto_5160 ) ) ( not ( = ?auto_5155 ?auto_5175 ) ) ( not ( = ?auto_5156 ?auto_5160 ) ) ( not ( = ?auto_5156 ?auto_5175 ) ) ( not ( = ?auto_5157 ?auto_5160 ) ) ( not ( = ?auto_5157 ?auto_5175 ) ) ( not ( = ?auto_5158 ?auto_5160 ) ) ( not ( = ?auto_5158 ?auto_5175 ) ) ( not ( = ?auto_5160 ?auto_5170 ) ) ( not ( = ?auto_5160 ?auto_5173 ) ) ( not ( = ?auto_5160 ?auto_5176 ) ) ( not ( = ?auto_5160 ?auto_5168 ) ) ( not ( = ?auto_5174 ?auto_5169 ) ) ( not ( = ?auto_5174 ?auto_5179 ) ) ( not ( = ?auto_5174 ?auto_5178 ) ) ( not ( = ?auto_5174 ?auto_5182 ) ) ( not ( = ?auto_5180 ?auto_5172 ) ) ( not ( = ?auto_5180 ?auto_5181 ) ) ( not ( = ?auto_5180 ?auto_5177 ) ) ( not ( = ?auto_5180 ?auto_5171 ) ) ( not ( = ?auto_5175 ?auto_5170 ) ) ( not ( = ?auto_5175 ?auto_5173 ) ) ( not ( = ?auto_5175 ?auto_5176 ) ) ( not ( = ?auto_5175 ?auto_5168 ) ) ( not ( = ?auto_5155 ?auto_5161 ) ) ( not ( = ?auto_5155 ?auto_5167 ) ) ( not ( = ?auto_5156 ?auto_5161 ) ) ( not ( = ?auto_5156 ?auto_5167 ) ) ( not ( = ?auto_5157 ?auto_5161 ) ) ( not ( = ?auto_5157 ?auto_5167 ) ) ( not ( = ?auto_5158 ?auto_5161 ) ) ( not ( = ?auto_5158 ?auto_5167 ) ) ( not ( = ?auto_5159 ?auto_5161 ) ) ( not ( = ?auto_5159 ?auto_5167 ) ) ( not ( = ?auto_5161 ?auto_5175 ) ) ( not ( = ?auto_5161 ?auto_5170 ) ) ( not ( = ?auto_5161 ?auto_5173 ) ) ( not ( = ?auto_5161 ?auto_5176 ) ) ( not ( = ?auto_5161 ?auto_5168 ) ) ( not ( = ?auto_5165 ?auto_5174 ) ) ( not ( = ?auto_5165 ?auto_5169 ) ) ( not ( = ?auto_5165 ?auto_5179 ) ) ( not ( = ?auto_5165 ?auto_5178 ) ) ( not ( = ?auto_5165 ?auto_5182 ) ) ( not ( = ?auto_5166 ?auto_5180 ) ) ( not ( = ?auto_5166 ?auto_5172 ) ) ( not ( = ?auto_5166 ?auto_5181 ) ) ( not ( = ?auto_5166 ?auto_5177 ) ) ( not ( = ?auto_5166 ?auto_5171 ) ) ( not ( = ?auto_5167 ?auto_5175 ) ) ( not ( = ?auto_5167 ?auto_5170 ) ) ( not ( = ?auto_5167 ?auto_5173 ) ) ( not ( = ?auto_5167 ?auto_5176 ) ) ( not ( = ?auto_5167 ?auto_5168 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5155 ?auto_5156 ?auto_5157 ?auto_5158 ?auto_5159 ?auto_5160 )
      ( MAKE-1CRATE ?auto_5160 ?auto_5161 )
      ( MAKE-6CRATE-VERIFY ?auto_5155 ?auto_5156 ?auto_5157 ?auto_5158 ?auto_5159 ?auto_5160 ?auto_5161 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_5201 - SURFACE
      ?auto_5202 - SURFACE
      ?auto_5203 - SURFACE
      ?auto_5204 - SURFACE
      ?auto_5205 - SURFACE
      ?auto_5206 - SURFACE
      ?auto_5207 - SURFACE
      ?auto_5208 - SURFACE
    )
    :vars
    (
      ?auto_5209 - HOIST
      ?auto_5210 - PLACE
      ?auto_5213 - PLACE
      ?auto_5214 - HOIST
      ?auto_5212 - SURFACE
      ?auto_5220 - PLACE
      ?auto_5227 - HOIST
      ?auto_5221 - SURFACE
      ?auto_5217 - PLACE
      ?auto_5226 - HOIST
      ?auto_5224 - SURFACE
      ?auto_5231 - PLACE
      ?auto_5225 - HOIST
      ?auto_5215 - SURFACE
      ?auto_5228 - PLACE
      ?auto_5223 - HOIST
      ?auto_5222 - SURFACE
      ?auto_5218 - PLACE
      ?auto_5230 - HOIST
      ?auto_5232 - SURFACE
      ?auto_5216 - PLACE
      ?auto_5229 - HOIST
      ?auto_5219 - SURFACE
      ?auto_5211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5209 ?auto_5210 ) ( IS-CRATE ?auto_5208 ) ( not ( = ?auto_5213 ?auto_5210 ) ) ( HOIST-AT ?auto_5214 ?auto_5213 ) ( AVAILABLE ?auto_5214 ) ( SURFACE-AT ?auto_5208 ?auto_5213 ) ( ON ?auto_5208 ?auto_5212 ) ( CLEAR ?auto_5208 ) ( not ( = ?auto_5207 ?auto_5208 ) ) ( not ( = ?auto_5207 ?auto_5212 ) ) ( not ( = ?auto_5208 ?auto_5212 ) ) ( not ( = ?auto_5209 ?auto_5214 ) ) ( IS-CRATE ?auto_5207 ) ( not ( = ?auto_5220 ?auto_5210 ) ) ( HOIST-AT ?auto_5227 ?auto_5220 ) ( AVAILABLE ?auto_5227 ) ( SURFACE-AT ?auto_5207 ?auto_5220 ) ( ON ?auto_5207 ?auto_5221 ) ( CLEAR ?auto_5207 ) ( not ( = ?auto_5206 ?auto_5207 ) ) ( not ( = ?auto_5206 ?auto_5221 ) ) ( not ( = ?auto_5207 ?auto_5221 ) ) ( not ( = ?auto_5209 ?auto_5227 ) ) ( IS-CRATE ?auto_5206 ) ( not ( = ?auto_5217 ?auto_5210 ) ) ( HOIST-AT ?auto_5226 ?auto_5217 ) ( AVAILABLE ?auto_5226 ) ( SURFACE-AT ?auto_5206 ?auto_5217 ) ( ON ?auto_5206 ?auto_5224 ) ( CLEAR ?auto_5206 ) ( not ( = ?auto_5205 ?auto_5206 ) ) ( not ( = ?auto_5205 ?auto_5224 ) ) ( not ( = ?auto_5206 ?auto_5224 ) ) ( not ( = ?auto_5209 ?auto_5226 ) ) ( IS-CRATE ?auto_5205 ) ( not ( = ?auto_5231 ?auto_5210 ) ) ( HOIST-AT ?auto_5225 ?auto_5231 ) ( AVAILABLE ?auto_5225 ) ( SURFACE-AT ?auto_5205 ?auto_5231 ) ( ON ?auto_5205 ?auto_5215 ) ( CLEAR ?auto_5205 ) ( not ( = ?auto_5204 ?auto_5205 ) ) ( not ( = ?auto_5204 ?auto_5215 ) ) ( not ( = ?auto_5205 ?auto_5215 ) ) ( not ( = ?auto_5209 ?auto_5225 ) ) ( IS-CRATE ?auto_5204 ) ( not ( = ?auto_5228 ?auto_5210 ) ) ( HOIST-AT ?auto_5223 ?auto_5228 ) ( AVAILABLE ?auto_5223 ) ( SURFACE-AT ?auto_5204 ?auto_5228 ) ( ON ?auto_5204 ?auto_5222 ) ( CLEAR ?auto_5204 ) ( not ( = ?auto_5203 ?auto_5204 ) ) ( not ( = ?auto_5203 ?auto_5222 ) ) ( not ( = ?auto_5204 ?auto_5222 ) ) ( not ( = ?auto_5209 ?auto_5223 ) ) ( IS-CRATE ?auto_5203 ) ( not ( = ?auto_5218 ?auto_5210 ) ) ( HOIST-AT ?auto_5230 ?auto_5218 ) ( AVAILABLE ?auto_5230 ) ( SURFACE-AT ?auto_5203 ?auto_5218 ) ( ON ?auto_5203 ?auto_5232 ) ( CLEAR ?auto_5203 ) ( not ( = ?auto_5202 ?auto_5203 ) ) ( not ( = ?auto_5202 ?auto_5232 ) ) ( not ( = ?auto_5203 ?auto_5232 ) ) ( not ( = ?auto_5209 ?auto_5230 ) ) ( SURFACE-AT ?auto_5201 ?auto_5210 ) ( CLEAR ?auto_5201 ) ( IS-CRATE ?auto_5202 ) ( AVAILABLE ?auto_5209 ) ( not ( = ?auto_5216 ?auto_5210 ) ) ( HOIST-AT ?auto_5229 ?auto_5216 ) ( AVAILABLE ?auto_5229 ) ( SURFACE-AT ?auto_5202 ?auto_5216 ) ( ON ?auto_5202 ?auto_5219 ) ( CLEAR ?auto_5202 ) ( TRUCK-AT ?auto_5211 ?auto_5210 ) ( not ( = ?auto_5201 ?auto_5202 ) ) ( not ( = ?auto_5201 ?auto_5219 ) ) ( not ( = ?auto_5202 ?auto_5219 ) ) ( not ( = ?auto_5209 ?auto_5229 ) ) ( not ( = ?auto_5201 ?auto_5203 ) ) ( not ( = ?auto_5201 ?auto_5232 ) ) ( not ( = ?auto_5203 ?auto_5219 ) ) ( not ( = ?auto_5218 ?auto_5216 ) ) ( not ( = ?auto_5230 ?auto_5229 ) ) ( not ( = ?auto_5232 ?auto_5219 ) ) ( not ( = ?auto_5201 ?auto_5204 ) ) ( not ( = ?auto_5201 ?auto_5222 ) ) ( not ( = ?auto_5202 ?auto_5204 ) ) ( not ( = ?auto_5202 ?auto_5222 ) ) ( not ( = ?auto_5204 ?auto_5232 ) ) ( not ( = ?auto_5204 ?auto_5219 ) ) ( not ( = ?auto_5228 ?auto_5218 ) ) ( not ( = ?auto_5228 ?auto_5216 ) ) ( not ( = ?auto_5223 ?auto_5230 ) ) ( not ( = ?auto_5223 ?auto_5229 ) ) ( not ( = ?auto_5222 ?auto_5232 ) ) ( not ( = ?auto_5222 ?auto_5219 ) ) ( not ( = ?auto_5201 ?auto_5205 ) ) ( not ( = ?auto_5201 ?auto_5215 ) ) ( not ( = ?auto_5202 ?auto_5205 ) ) ( not ( = ?auto_5202 ?auto_5215 ) ) ( not ( = ?auto_5203 ?auto_5205 ) ) ( not ( = ?auto_5203 ?auto_5215 ) ) ( not ( = ?auto_5205 ?auto_5222 ) ) ( not ( = ?auto_5205 ?auto_5232 ) ) ( not ( = ?auto_5205 ?auto_5219 ) ) ( not ( = ?auto_5231 ?auto_5228 ) ) ( not ( = ?auto_5231 ?auto_5218 ) ) ( not ( = ?auto_5231 ?auto_5216 ) ) ( not ( = ?auto_5225 ?auto_5223 ) ) ( not ( = ?auto_5225 ?auto_5230 ) ) ( not ( = ?auto_5225 ?auto_5229 ) ) ( not ( = ?auto_5215 ?auto_5222 ) ) ( not ( = ?auto_5215 ?auto_5232 ) ) ( not ( = ?auto_5215 ?auto_5219 ) ) ( not ( = ?auto_5201 ?auto_5206 ) ) ( not ( = ?auto_5201 ?auto_5224 ) ) ( not ( = ?auto_5202 ?auto_5206 ) ) ( not ( = ?auto_5202 ?auto_5224 ) ) ( not ( = ?auto_5203 ?auto_5206 ) ) ( not ( = ?auto_5203 ?auto_5224 ) ) ( not ( = ?auto_5204 ?auto_5206 ) ) ( not ( = ?auto_5204 ?auto_5224 ) ) ( not ( = ?auto_5206 ?auto_5215 ) ) ( not ( = ?auto_5206 ?auto_5222 ) ) ( not ( = ?auto_5206 ?auto_5232 ) ) ( not ( = ?auto_5206 ?auto_5219 ) ) ( not ( = ?auto_5217 ?auto_5231 ) ) ( not ( = ?auto_5217 ?auto_5228 ) ) ( not ( = ?auto_5217 ?auto_5218 ) ) ( not ( = ?auto_5217 ?auto_5216 ) ) ( not ( = ?auto_5226 ?auto_5225 ) ) ( not ( = ?auto_5226 ?auto_5223 ) ) ( not ( = ?auto_5226 ?auto_5230 ) ) ( not ( = ?auto_5226 ?auto_5229 ) ) ( not ( = ?auto_5224 ?auto_5215 ) ) ( not ( = ?auto_5224 ?auto_5222 ) ) ( not ( = ?auto_5224 ?auto_5232 ) ) ( not ( = ?auto_5224 ?auto_5219 ) ) ( not ( = ?auto_5201 ?auto_5207 ) ) ( not ( = ?auto_5201 ?auto_5221 ) ) ( not ( = ?auto_5202 ?auto_5207 ) ) ( not ( = ?auto_5202 ?auto_5221 ) ) ( not ( = ?auto_5203 ?auto_5207 ) ) ( not ( = ?auto_5203 ?auto_5221 ) ) ( not ( = ?auto_5204 ?auto_5207 ) ) ( not ( = ?auto_5204 ?auto_5221 ) ) ( not ( = ?auto_5205 ?auto_5207 ) ) ( not ( = ?auto_5205 ?auto_5221 ) ) ( not ( = ?auto_5207 ?auto_5224 ) ) ( not ( = ?auto_5207 ?auto_5215 ) ) ( not ( = ?auto_5207 ?auto_5222 ) ) ( not ( = ?auto_5207 ?auto_5232 ) ) ( not ( = ?auto_5207 ?auto_5219 ) ) ( not ( = ?auto_5220 ?auto_5217 ) ) ( not ( = ?auto_5220 ?auto_5231 ) ) ( not ( = ?auto_5220 ?auto_5228 ) ) ( not ( = ?auto_5220 ?auto_5218 ) ) ( not ( = ?auto_5220 ?auto_5216 ) ) ( not ( = ?auto_5227 ?auto_5226 ) ) ( not ( = ?auto_5227 ?auto_5225 ) ) ( not ( = ?auto_5227 ?auto_5223 ) ) ( not ( = ?auto_5227 ?auto_5230 ) ) ( not ( = ?auto_5227 ?auto_5229 ) ) ( not ( = ?auto_5221 ?auto_5224 ) ) ( not ( = ?auto_5221 ?auto_5215 ) ) ( not ( = ?auto_5221 ?auto_5222 ) ) ( not ( = ?auto_5221 ?auto_5232 ) ) ( not ( = ?auto_5221 ?auto_5219 ) ) ( not ( = ?auto_5201 ?auto_5208 ) ) ( not ( = ?auto_5201 ?auto_5212 ) ) ( not ( = ?auto_5202 ?auto_5208 ) ) ( not ( = ?auto_5202 ?auto_5212 ) ) ( not ( = ?auto_5203 ?auto_5208 ) ) ( not ( = ?auto_5203 ?auto_5212 ) ) ( not ( = ?auto_5204 ?auto_5208 ) ) ( not ( = ?auto_5204 ?auto_5212 ) ) ( not ( = ?auto_5205 ?auto_5208 ) ) ( not ( = ?auto_5205 ?auto_5212 ) ) ( not ( = ?auto_5206 ?auto_5208 ) ) ( not ( = ?auto_5206 ?auto_5212 ) ) ( not ( = ?auto_5208 ?auto_5221 ) ) ( not ( = ?auto_5208 ?auto_5224 ) ) ( not ( = ?auto_5208 ?auto_5215 ) ) ( not ( = ?auto_5208 ?auto_5222 ) ) ( not ( = ?auto_5208 ?auto_5232 ) ) ( not ( = ?auto_5208 ?auto_5219 ) ) ( not ( = ?auto_5213 ?auto_5220 ) ) ( not ( = ?auto_5213 ?auto_5217 ) ) ( not ( = ?auto_5213 ?auto_5231 ) ) ( not ( = ?auto_5213 ?auto_5228 ) ) ( not ( = ?auto_5213 ?auto_5218 ) ) ( not ( = ?auto_5213 ?auto_5216 ) ) ( not ( = ?auto_5214 ?auto_5227 ) ) ( not ( = ?auto_5214 ?auto_5226 ) ) ( not ( = ?auto_5214 ?auto_5225 ) ) ( not ( = ?auto_5214 ?auto_5223 ) ) ( not ( = ?auto_5214 ?auto_5230 ) ) ( not ( = ?auto_5214 ?auto_5229 ) ) ( not ( = ?auto_5212 ?auto_5221 ) ) ( not ( = ?auto_5212 ?auto_5224 ) ) ( not ( = ?auto_5212 ?auto_5215 ) ) ( not ( = ?auto_5212 ?auto_5222 ) ) ( not ( = ?auto_5212 ?auto_5232 ) ) ( not ( = ?auto_5212 ?auto_5219 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5201 ?auto_5202 ?auto_5203 ?auto_5204 ?auto_5205 ?auto_5206 ?auto_5207 )
      ( MAKE-1CRATE ?auto_5207 ?auto_5208 )
      ( MAKE-7CRATE-VERIFY ?auto_5201 ?auto_5202 ?auto_5203 ?auto_5204 ?auto_5205 ?auto_5206 ?auto_5207 ?auto_5208 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_5252 - SURFACE
      ?auto_5253 - SURFACE
      ?auto_5254 - SURFACE
      ?auto_5255 - SURFACE
      ?auto_5256 - SURFACE
      ?auto_5257 - SURFACE
      ?auto_5258 - SURFACE
      ?auto_5259 - SURFACE
      ?auto_5260 - SURFACE
    )
    :vars
    (
      ?auto_5266 - HOIST
      ?auto_5265 - PLACE
      ?auto_5261 - PLACE
      ?auto_5262 - HOIST
      ?auto_5263 - SURFACE
      ?auto_5281 - PLACE
      ?auto_5278 - HOIST
      ?auto_5280 - SURFACE
      ?auto_5276 - PLACE
      ?auto_5270 - HOIST
      ?auto_5287 - SURFACE
      ?auto_5274 - PLACE
      ?auto_5284 - HOIST
      ?auto_5275 - SURFACE
      ?auto_5271 - PLACE
      ?auto_5283 - HOIST
      ?auto_5273 - SURFACE
      ?auto_5269 - PLACE
      ?auto_5286 - HOIST
      ?auto_5268 - SURFACE
      ?auto_5282 - PLACE
      ?auto_5277 - HOIST
      ?auto_5279 - SURFACE
      ?auto_5272 - PLACE
      ?auto_5285 - HOIST
      ?auto_5267 - SURFACE
      ?auto_5264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5266 ?auto_5265 ) ( IS-CRATE ?auto_5260 ) ( not ( = ?auto_5261 ?auto_5265 ) ) ( HOIST-AT ?auto_5262 ?auto_5261 ) ( AVAILABLE ?auto_5262 ) ( SURFACE-AT ?auto_5260 ?auto_5261 ) ( ON ?auto_5260 ?auto_5263 ) ( CLEAR ?auto_5260 ) ( not ( = ?auto_5259 ?auto_5260 ) ) ( not ( = ?auto_5259 ?auto_5263 ) ) ( not ( = ?auto_5260 ?auto_5263 ) ) ( not ( = ?auto_5266 ?auto_5262 ) ) ( IS-CRATE ?auto_5259 ) ( not ( = ?auto_5281 ?auto_5265 ) ) ( HOIST-AT ?auto_5278 ?auto_5281 ) ( AVAILABLE ?auto_5278 ) ( SURFACE-AT ?auto_5259 ?auto_5281 ) ( ON ?auto_5259 ?auto_5280 ) ( CLEAR ?auto_5259 ) ( not ( = ?auto_5258 ?auto_5259 ) ) ( not ( = ?auto_5258 ?auto_5280 ) ) ( not ( = ?auto_5259 ?auto_5280 ) ) ( not ( = ?auto_5266 ?auto_5278 ) ) ( IS-CRATE ?auto_5258 ) ( not ( = ?auto_5276 ?auto_5265 ) ) ( HOIST-AT ?auto_5270 ?auto_5276 ) ( AVAILABLE ?auto_5270 ) ( SURFACE-AT ?auto_5258 ?auto_5276 ) ( ON ?auto_5258 ?auto_5287 ) ( CLEAR ?auto_5258 ) ( not ( = ?auto_5257 ?auto_5258 ) ) ( not ( = ?auto_5257 ?auto_5287 ) ) ( not ( = ?auto_5258 ?auto_5287 ) ) ( not ( = ?auto_5266 ?auto_5270 ) ) ( IS-CRATE ?auto_5257 ) ( not ( = ?auto_5274 ?auto_5265 ) ) ( HOIST-AT ?auto_5284 ?auto_5274 ) ( AVAILABLE ?auto_5284 ) ( SURFACE-AT ?auto_5257 ?auto_5274 ) ( ON ?auto_5257 ?auto_5275 ) ( CLEAR ?auto_5257 ) ( not ( = ?auto_5256 ?auto_5257 ) ) ( not ( = ?auto_5256 ?auto_5275 ) ) ( not ( = ?auto_5257 ?auto_5275 ) ) ( not ( = ?auto_5266 ?auto_5284 ) ) ( IS-CRATE ?auto_5256 ) ( not ( = ?auto_5271 ?auto_5265 ) ) ( HOIST-AT ?auto_5283 ?auto_5271 ) ( AVAILABLE ?auto_5283 ) ( SURFACE-AT ?auto_5256 ?auto_5271 ) ( ON ?auto_5256 ?auto_5273 ) ( CLEAR ?auto_5256 ) ( not ( = ?auto_5255 ?auto_5256 ) ) ( not ( = ?auto_5255 ?auto_5273 ) ) ( not ( = ?auto_5256 ?auto_5273 ) ) ( not ( = ?auto_5266 ?auto_5283 ) ) ( IS-CRATE ?auto_5255 ) ( not ( = ?auto_5269 ?auto_5265 ) ) ( HOIST-AT ?auto_5286 ?auto_5269 ) ( AVAILABLE ?auto_5286 ) ( SURFACE-AT ?auto_5255 ?auto_5269 ) ( ON ?auto_5255 ?auto_5268 ) ( CLEAR ?auto_5255 ) ( not ( = ?auto_5254 ?auto_5255 ) ) ( not ( = ?auto_5254 ?auto_5268 ) ) ( not ( = ?auto_5255 ?auto_5268 ) ) ( not ( = ?auto_5266 ?auto_5286 ) ) ( IS-CRATE ?auto_5254 ) ( not ( = ?auto_5282 ?auto_5265 ) ) ( HOIST-AT ?auto_5277 ?auto_5282 ) ( AVAILABLE ?auto_5277 ) ( SURFACE-AT ?auto_5254 ?auto_5282 ) ( ON ?auto_5254 ?auto_5279 ) ( CLEAR ?auto_5254 ) ( not ( = ?auto_5253 ?auto_5254 ) ) ( not ( = ?auto_5253 ?auto_5279 ) ) ( not ( = ?auto_5254 ?auto_5279 ) ) ( not ( = ?auto_5266 ?auto_5277 ) ) ( SURFACE-AT ?auto_5252 ?auto_5265 ) ( CLEAR ?auto_5252 ) ( IS-CRATE ?auto_5253 ) ( AVAILABLE ?auto_5266 ) ( not ( = ?auto_5272 ?auto_5265 ) ) ( HOIST-AT ?auto_5285 ?auto_5272 ) ( AVAILABLE ?auto_5285 ) ( SURFACE-AT ?auto_5253 ?auto_5272 ) ( ON ?auto_5253 ?auto_5267 ) ( CLEAR ?auto_5253 ) ( TRUCK-AT ?auto_5264 ?auto_5265 ) ( not ( = ?auto_5252 ?auto_5253 ) ) ( not ( = ?auto_5252 ?auto_5267 ) ) ( not ( = ?auto_5253 ?auto_5267 ) ) ( not ( = ?auto_5266 ?auto_5285 ) ) ( not ( = ?auto_5252 ?auto_5254 ) ) ( not ( = ?auto_5252 ?auto_5279 ) ) ( not ( = ?auto_5254 ?auto_5267 ) ) ( not ( = ?auto_5282 ?auto_5272 ) ) ( not ( = ?auto_5277 ?auto_5285 ) ) ( not ( = ?auto_5279 ?auto_5267 ) ) ( not ( = ?auto_5252 ?auto_5255 ) ) ( not ( = ?auto_5252 ?auto_5268 ) ) ( not ( = ?auto_5253 ?auto_5255 ) ) ( not ( = ?auto_5253 ?auto_5268 ) ) ( not ( = ?auto_5255 ?auto_5279 ) ) ( not ( = ?auto_5255 ?auto_5267 ) ) ( not ( = ?auto_5269 ?auto_5282 ) ) ( not ( = ?auto_5269 ?auto_5272 ) ) ( not ( = ?auto_5286 ?auto_5277 ) ) ( not ( = ?auto_5286 ?auto_5285 ) ) ( not ( = ?auto_5268 ?auto_5279 ) ) ( not ( = ?auto_5268 ?auto_5267 ) ) ( not ( = ?auto_5252 ?auto_5256 ) ) ( not ( = ?auto_5252 ?auto_5273 ) ) ( not ( = ?auto_5253 ?auto_5256 ) ) ( not ( = ?auto_5253 ?auto_5273 ) ) ( not ( = ?auto_5254 ?auto_5256 ) ) ( not ( = ?auto_5254 ?auto_5273 ) ) ( not ( = ?auto_5256 ?auto_5268 ) ) ( not ( = ?auto_5256 ?auto_5279 ) ) ( not ( = ?auto_5256 ?auto_5267 ) ) ( not ( = ?auto_5271 ?auto_5269 ) ) ( not ( = ?auto_5271 ?auto_5282 ) ) ( not ( = ?auto_5271 ?auto_5272 ) ) ( not ( = ?auto_5283 ?auto_5286 ) ) ( not ( = ?auto_5283 ?auto_5277 ) ) ( not ( = ?auto_5283 ?auto_5285 ) ) ( not ( = ?auto_5273 ?auto_5268 ) ) ( not ( = ?auto_5273 ?auto_5279 ) ) ( not ( = ?auto_5273 ?auto_5267 ) ) ( not ( = ?auto_5252 ?auto_5257 ) ) ( not ( = ?auto_5252 ?auto_5275 ) ) ( not ( = ?auto_5253 ?auto_5257 ) ) ( not ( = ?auto_5253 ?auto_5275 ) ) ( not ( = ?auto_5254 ?auto_5257 ) ) ( not ( = ?auto_5254 ?auto_5275 ) ) ( not ( = ?auto_5255 ?auto_5257 ) ) ( not ( = ?auto_5255 ?auto_5275 ) ) ( not ( = ?auto_5257 ?auto_5273 ) ) ( not ( = ?auto_5257 ?auto_5268 ) ) ( not ( = ?auto_5257 ?auto_5279 ) ) ( not ( = ?auto_5257 ?auto_5267 ) ) ( not ( = ?auto_5274 ?auto_5271 ) ) ( not ( = ?auto_5274 ?auto_5269 ) ) ( not ( = ?auto_5274 ?auto_5282 ) ) ( not ( = ?auto_5274 ?auto_5272 ) ) ( not ( = ?auto_5284 ?auto_5283 ) ) ( not ( = ?auto_5284 ?auto_5286 ) ) ( not ( = ?auto_5284 ?auto_5277 ) ) ( not ( = ?auto_5284 ?auto_5285 ) ) ( not ( = ?auto_5275 ?auto_5273 ) ) ( not ( = ?auto_5275 ?auto_5268 ) ) ( not ( = ?auto_5275 ?auto_5279 ) ) ( not ( = ?auto_5275 ?auto_5267 ) ) ( not ( = ?auto_5252 ?auto_5258 ) ) ( not ( = ?auto_5252 ?auto_5287 ) ) ( not ( = ?auto_5253 ?auto_5258 ) ) ( not ( = ?auto_5253 ?auto_5287 ) ) ( not ( = ?auto_5254 ?auto_5258 ) ) ( not ( = ?auto_5254 ?auto_5287 ) ) ( not ( = ?auto_5255 ?auto_5258 ) ) ( not ( = ?auto_5255 ?auto_5287 ) ) ( not ( = ?auto_5256 ?auto_5258 ) ) ( not ( = ?auto_5256 ?auto_5287 ) ) ( not ( = ?auto_5258 ?auto_5275 ) ) ( not ( = ?auto_5258 ?auto_5273 ) ) ( not ( = ?auto_5258 ?auto_5268 ) ) ( not ( = ?auto_5258 ?auto_5279 ) ) ( not ( = ?auto_5258 ?auto_5267 ) ) ( not ( = ?auto_5276 ?auto_5274 ) ) ( not ( = ?auto_5276 ?auto_5271 ) ) ( not ( = ?auto_5276 ?auto_5269 ) ) ( not ( = ?auto_5276 ?auto_5282 ) ) ( not ( = ?auto_5276 ?auto_5272 ) ) ( not ( = ?auto_5270 ?auto_5284 ) ) ( not ( = ?auto_5270 ?auto_5283 ) ) ( not ( = ?auto_5270 ?auto_5286 ) ) ( not ( = ?auto_5270 ?auto_5277 ) ) ( not ( = ?auto_5270 ?auto_5285 ) ) ( not ( = ?auto_5287 ?auto_5275 ) ) ( not ( = ?auto_5287 ?auto_5273 ) ) ( not ( = ?auto_5287 ?auto_5268 ) ) ( not ( = ?auto_5287 ?auto_5279 ) ) ( not ( = ?auto_5287 ?auto_5267 ) ) ( not ( = ?auto_5252 ?auto_5259 ) ) ( not ( = ?auto_5252 ?auto_5280 ) ) ( not ( = ?auto_5253 ?auto_5259 ) ) ( not ( = ?auto_5253 ?auto_5280 ) ) ( not ( = ?auto_5254 ?auto_5259 ) ) ( not ( = ?auto_5254 ?auto_5280 ) ) ( not ( = ?auto_5255 ?auto_5259 ) ) ( not ( = ?auto_5255 ?auto_5280 ) ) ( not ( = ?auto_5256 ?auto_5259 ) ) ( not ( = ?auto_5256 ?auto_5280 ) ) ( not ( = ?auto_5257 ?auto_5259 ) ) ( not ( = ?auto_5257 ?auto_5280 ) ) ( not ( = ?auto_5259 ?auto_5287 ) ) ( not ( = ?auto_5259 ?auto_5275 ) ) ( not ( = ?auto_5259 ?auto_5273 ) ) ( not ( = ?auto_5259 ?auto_5268 ) ) ( not ( = ?auto_5259 ?auto_5279 ) ) ( not ( = ?auto_5259 ?auto_5267 ) ) ( not ( = ?auto_5281 ?auto_5276 ) ) ( not ( = ?auto_5281 ?auto_5274 ) ) ( not ( = ?auto_5281 ?auto_5271 ) ) ( not ( = ?auto_5281 ?auto_5269 ) ) ( not ( = ?auto_5281 ?auto_5282 ) ) ( not ( = ?auto_5281 ?auto_5272 ) ) ( not ( = ?auto_5278 ?auto_5270 ) ) ( not ( = ?auto_5278 ?auto_5284 ) ) ( not ( = ?auto_5278 ?auto_5283 ) ) ( not ( = ?auto_5278 ?auto_5286 ) ) ( not ( = ?auto_5278 ?auto_5277 ) ) ( not ( = ?auto_5278 ?auto_5285 ) ) ( not ( = ?auto_5280 ?auto_5287 ) ) ( not ( = ?auto_5280 ?auto_5275 ) ) ( not ( = ?auto_5280 ?auto_5273 ) ) ( not ( = ?auto_5280 ?auto_5268 ) ) ( not ( = ?auto_5280 ?auto_5279 ) ) ( not ( = ?auto_5280 ?auto_5267 ) ) ( not ( = ?auto_5252 ?auto_5260 ) ) ( not ( = ?auto_5252 ?auto_5263 ) ) ( not ( = ?auto_5253 ?auto_5260 ) ) ( not ( = ?auto_5253 ?auto_5263 ) ) ( not ( = ?auto_5254 ?auto_5260 ) ) ( not ( = ?auto_5254 ?auto_5263 ) ) ( not ( = ?auto_5255 ?auto_5260 ) ) ( not ( = ?auto_5255 ?auto_5263 ) ) ( not ( = ?auto_5256 ?auto_5260 ) ) ( not ( = ?auto_5256 ?auto_5263 ) ) ( not ( = ?auto_5257 ?auto_5260 ) ) ( not ( = ?auto_5257 ?auto_5263 ) ) ( not ( = ?auto_5258 ?auto_5260 ) ) ( not ( = ?auto_5258 ?auto_5263 ) ) ( not ( = ?auto_5260 ?auto_5280 ) ) ( not ( = ?auto_5260 ?auto_5287 ) ) ( not ( = ?auto_5260 ?auto_5275 ) ) ( not ( = ?auto_5260 ?auto_5273 ) ) ( not ( = ?auto_5260 ?auto_5268 ) ) ( not ( = ?auto_5260 ?auto_5279 ) ) ( not ( = ?auto_5260 ?auto_5267 ) ) ( not ( = ?auto_5261 ?auto_5281 ) ) ( not ( = ?auto_5261 ?auto_5276 ) ) ( not ( = ?auto_5261 ?auto_5274 ) ) ( not ( = ?auto_5261 ?auto_5271 ) ) ( not ( = ?auto_5261 ?auto_5269 ) ) ( not ( = ?auto_5261 ?auto_5282 ) ) ( not ( = ?auto_5261 ?auto_5272 ) ) ( not ( = ?auto_5262 ?auto_5278 ) ) ( not ( = ?auto_5262 ?auto_5270 ) ) ( not ( = ?auto_5262 ?auto_5284 ) ) ( not ( = ?auto_5262 ?auto_5283 ) ) ( not ( = ?auto_5262 ?auto_5286 ) ) ( not ( = ?auto_5262 ?auto_5277 ) ) ( not ( = ?auto_5262 ?auto_5285 ) ) ( not ( = ?auto_5263 ?auto_5280 ) ) ( not ( = ?auto_5263 ?auto_5287 ) ) ( not ( = ?auto_5263 ?auto_5275 ) ) ( not ( = ?auto_5263 ?auto_5273 ) ) ( not ( = ?auto_5263 ?auto_5268 ) ) ( not ( = ?auto_5263 ?auto_5279 ) ) ( not ( = ?auto_5263 ?auto_5267 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5252 ?auto_5253 ?auto_5254 ?auto_5255 ?auto_5256 ?auto_5257 ?auto_5258 ?auto_5259 )
      ( MAKE-1CRATE ?auto_5259 ?auto_5260 )
      ( MAKE-8CRATE-VERIFY ?auto_5252 ?auto_5253 ?auto_5254 ?auto_5255 ?auto_5256 ?auto_5257 ?auto_5258 ?auto_5259 ?auto_5260 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_5308 - SURFACE
      ?auto_5309 - SURFACE
      ?auto_5310 - SURFACE
      ?auto_5311 - SURFACE
      ?auto_5312 - SURFACE
      ?auto_5313 - SURFACE
      ?auto_5314 - SURFACE
      ?auto_5315 - SURFACE
      ?auto_5316 - SURFACE
      ?auto_5317 - SURFACE
    )
    :vars
    (
      ?auto_5321 - HOIST
      ?auto_5323 - PLACE
      ?auto_5322 - PLACE
      ?auto_5318 - HOIST
      ?auto_5319 - SURFACE
      ?auto_5344 - PLACE
      ?auto_5332 - HOIST
      ?auto_5336 - SURFACE
      ?auto_5326 - PLACE
      ?auto_5339 - HOIST
      ?auto_5325 - SURFACE
      ?auto_5324 - PLACE
      ?auto_5343 - HOIST
      ?auto_5340 - SURFACE
      ?auto_5341 - PLACE
      ?auto_5345 - HOIST
      ?auto_5331 - SURFACE
      ?auto_5333 - PLACE
      ?auto_5328 - HOIST
      ?auto_5329 - SURFACE
      ?auto_5342 - PLACE
      ?auto_5338 - HOIST
      ?auto_5330 - SURFACE
      ?auto_5327 - SURFACE
      ?auto_5335 - PLACE
      ?auto_5337 - HOIST
      ?auto_5334 - SURFACE
      ?auto_5320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5321 ?auto_5323 ) ( IS-CRATE ?auto_5317 ) ( not ( = ?auto_5322 ?auto_5323 ) ) ( HOIST-AT ?auto_5318 ?auto_5322 ) ( SURFACE-AT ?auto_5317 ?auto_5322 ) ( ON ?auto_5317 ?auto_5319 ) ( CLEAR ?auto_5317 ) ( not ( = ?auto_5316 ?auto_5317 ) ) ( not ( = ?auto_5316 ?auto_5319 ) ) ( not ( = ?auto_5317 ?auto_5319 ) ) ( not ( = ?auto_5321 ?auto_5318 ) ) ( IS-CRATE ?auto_5316 ) ( not ( = ?auto_5344 ?auto_5323 ) ) ( HOIST-AT ?auto_5332 ?auto_5344 ) ( AVAILABLE ?auto_5332 ) ( SURFACE-AT ?auto_5316 ?auto_5344 ) ( ON ?auto_5316 ?auto_5336 ) ( CLEAR ?auto_5316 ) ( not ( = ?auto_5315 ?auto_5316 ) ) ( not ( = ?auto_5315 ?auto_5336 ) ) ( not ( = ?auto_5316 ?auto_5336 ) ) ( not ( = ?auto_5321 ?auto_5332 ) ) ( IS-CRATE ?auto_5315 ) ( not ( = ?auto_5326 ?auto_5323 ) ) ( HOIST-AT ?auto_5339 ?auto_5326 ) ( AVAILABLE ?auto_5339 ) ( SURFACE-AT ?auto_5315 ?auto_5326 ) ( ON ?auto_5315 ?auto_5325 ) ( CLEAR ?auto_5315 ) ( not ( = ?auto_5314 ?auto_5315 ) ) ( not ( = ?auto_5314 ?auto_5325 ) ) ( not ( = ?auto_5315 ?auto_5325 ) ) ( not ( = ?auto_5321 ?auto_5339 ) ) ( IS-CRATE ?auto_5314 ) ( not ( = ?auto_5324 ?auto_5323 ) ) ( HOIST-AT ?auto_5343 ?auto_5324 ) ( AVAILABLE ?auto_5343 ) ( SURFACE-AT ?auto_5314 ?auto_5324 ) ( ON ?auto_5314 ?auto_5340 ) ( CLEAR ?auto_5314 ) ( not ( = ?auto_5313 ?auto_5314 ) ) ( not ( = ?auto_5313 ?auto_5340 ) ) ( not ( = ?auto_5314 ?auto_5340 ) ) ( not ( = ?auto_5321 ?auto_5343 ) ) ( IS-CRATE ?auto_5313 ) ( not ( = ?auto_5341 ?auto_5323 ) ) ( HOIST-AT ?auto_5345 ?auto_5341 ) ( AVAILABLE ?auto_5345 ) ( SURFACE-AT ?auto_5313 ?auto_5341 ) ( ON ?auto_5313 ?auto_5331 ) ( CLEAR ?auto_5313 ) ( not ( = ?auto_5312 ?auto_5313 ) ) ( not ( = ?auto_5312 ?auto_5331 ) ) ( not ( = ?auto_5313 ?auto_5331 ) ) ( not ( = ?auto_5321 ?auto_5345 ) ) ( IS-CRATE ?auto_5312 ) ( not ( = ?auto_5333 ?auto_5323 ) ) ( HOIST-AT ?auto_5328 ?auto_5333 ) ( AVAILABLE ?auto_5328 ) ( SURFACE-AT ?auto_5312 ?auto_5333 ) ( ON ?auto_5312 ?auto_5329 ) ( CLEAR ?auto_5312 ) ( not ( = ?auto_5311 ?auto_5312 ) ) ( not ( = ?auto_5311 ?auto_5329 ) ) ( not ( = ?auto_5312 ?auto_5329 ) ) ( not ( = ?auto_5321 ?auto_5328 ) ) ( IS-CRATE ?auto_5311 ) ( not ( = ?auto_5342 ?auto_5323 ) ) ( HOIST-AT ?auto_5338 ?auto_5342 ) ( AVAILABLE ?auto_5338 ) ( SURFACE-AT ?auto_5311 ?auto_5342 ) ( ON ?auto_5311 ?auto_5330 ) ( CLEAR ?auto_5311 ) ( not ( = ?auto_5310 ?auto_5311 ) ) ( not ( = ?auto_5310 ?auto_5330 ) ) ( not ( = ?auto_5311 ?auto_5330 ) ) ( not ( = ?auto_5321 ?auto_5338 ) ) ( IS-CRATE ?auto_5310 ) ( AVAILABLE ?auto_5318 ) ( SURFACE-AT ?auto_5310 ?auto_5322 ) ( ON ?auto_5310 ?auto_5327 ) ( CLEAR ?auto_5310 ) ( not ( = ?auto_5309 ?auto_5310 ) ) ( not ( = ?auto_5309 ?auto_5327 ) ) ( not ( = ?auto_5310 ?auto_5327 ) ) ( SURFACE-AT ?auto_5308 ?auto_5323 ) ( CLEAR ?auto_5308 ) ( IS-CRATE ?auto_5309 ) ( AVAILABLE ?auto_5321 ) ( not ( = ?auto_5335 ?auto_5323 ) ) ( HOIST-AT ?auto_5337 ?auto_5335 ) ( AVAILABLE ?auto_5337 ) ( SURFACE-AT ?auto_5309 ?auto_5335 ) ( ON ?auto_5309 ?auto_5334 ) ( CLEAR ?auto_5309 ) ( TRUCK-AT ?auto_5320 ?auto_5323 ) ( not ( = ?auto_5308 ?auto_5309 ) ) ( not ( = ?auto_5308 ?auto_5334 ) ) ( not ( = ?auto_5309 ?auto_5334 ) ) ( not ( = ?auto_5321 ?auto_5337 ) ) ( not ( = ?auto_5308 ?auto_5310 ) ) ( not ( = ?auto_5308 ?auto_5327 ) ) ( not ( = ?auto_5310 ?auto_5334 ) ) ( not ( = ?auto_5322 ?auto_5335 ) ) ( not ( = ?auto_5318 ?auto_5337 ) ) ( not ( = ?auto_5327 ?auto_5334 ) ) ( not ( = ?auto_5308 ?auto_5311 ) ) ( not ( = ?auto_5308 ?auto_5330 ) ) ( not ( = ?auto_5309 ?auto_5311 ) ) ( not ( = ?auto_5309 ?auto_5330 ) ) ( not ( = ?auto_5311 ?auto_5327 ) ) ( not ( = ?auto_5311 ?auto_5334 ) ) ( not ( = ?auto_5342 ?auto_5322 ) ) ( not ( = ?auto_5342 ?auto_5335 ) ) ( not ( = ?auto_5338 ?auto_5318 ) ) ( not ( = ?auto_5338 ?auto_5337 ) ) ( not ( = ?auto_5330 ?auto_5327 ) ) ( not ( = ?auto_5330 ?auto_5334 ) ) ( not ( = ?auto_5308 ?auto_5312 ) ) ( not ( = ?auto_5308 ?auto_5329 ) ) ( not ( = ?auto_5309 ?auto_5312 ) ) ( not ( = ?auto_5309 ?auto_5329 ) ) ( not ( = ?auto_5310 ?auto_5312 ) ) ( not ( = ?auto_5310 ?auto_5329 ) ) ( not ( = ?auto_5312 ?auto_5330 ) ) ( not ( = ?auto_5312 ?auto_5327 ) ) ( not ( = ?auto_5312 ?auto_5334 ) ) ( not ( = ?auto_5333 ?auto_5342 ) ) ( not ( = ?auto_5333 ?auto_5322 ) ) ( not ( = ?auto_5333 ?auto_5335 ) ) ( not ( = ?auto_5328 ?auto_5338 ) ) ( not ( = ?auto_5328 ?auto_5318 ) ) ( not ( = ?auto_5328 ?auto_5337 ) ) ( not ( = ?auto_5329 ?auto_5330 ) ) ( not ( = ?auto_5329 ?auto_5327 ) ) ( not ( = ?auto_5329 ?auto_5334 ) ) ( not ( = ?auto_5308 ?auto_5313 ) ) ( not ( = ?auto_5308 ?auto_5331 ) ) ( not ( = ?auto_5309 ?auto_5313 ) ) ( not ( = ?auto_5309 ?auto_5331 ) ) ( not ( = ?auto_5310 ?auto_5313 ) ) ( not ( = ?auto_5310 ?auto_5331 ) ) ( not ( = ?auto_5311 ?auto_5313 ) ) ( not ( = ?auto_5311 ?auto_5331 ) ) ( not ( = ?auto_5313 ?auto_5329 ) ) ( not ( = ?auto_5313 ?auto_5330 ) ) ( not ( = ?auto_5313 ?auto_5327 ) ) ( not ( = ?auto_5313 ?auto_5334 ) ) ( not ( = ?auto_5341 ?auto_5333 ) ) ( not ( = ?auto_5341 ?auto_5342 ) ) ( not ( = ?auto_5341 ?auto_5322 ) ) ( not ( = ?auto_5341 ?auto_5335 ) ) ( not ( = ?auto_5345 ?auto_5328 ) ) ( not ( = ?auto_5345 ?auto_5338 ) ) ( not ( = ?auto_5345 ?auto_5318 ) ) ( not ( = ?auto_5345 ?auto_5337 ) ) ( not ( = ?auto_5331 ?auto_5329 ) ) ( not ( = ?auto_5331 ?auto_5330 ) ) ( not ( = ?auto_5331 ?auto_5327 ) ) ( not ( = ?auto_5331 ?auto_5334 ) ) ( not ( = ?auto_5308 ?auto_5314 ) ) ( not ( = ?auto_5308 ?auto_5340 ) ) ( not ( = ?auto_5309 ?auto_5314 ) ) ( not ( = ?auto_5309 ?auto_5340 ) ) ( not ( = ?auto_5310 ?auto_5314 ) ) ( not ( = ?auto_5310 ?auto_5340 ) ) ( not ( = ?auto_5311 ?auto_5314 ) ) ( not ( = ?auto_5311 ?auto_5340 ) ) ( not ( = ?auto_5312 ?auto_5314 ) ) ( not ( = ?auto_5312 ?auto_5340 ) ) ( not ( = ?auto_5314 ?auto_5331 ) ) ( not ( = ?auto_5314 ?auto_5329 ) ) ( not ( = ?auto_5314 ?auto_5330 ) ) ( not ( = ?auto_5314 ?auto_5327 ) ) ( not ( = ?auto_5314 ?auto_5334 ) ) ( not ( = ?auto_5324 ?auto_5341 ) ) ( not ( = ?auto_5324 ?auto_5333 ) ) ( not ( = ?auto_5324 ?auto_5342 ) ) ( not ( = ?auto_5324 ?auto_5322 ) ) ( not ( = ?auto_5324 ?auto_5335 ) ) ( not ( = ?auto_5343 ?auto_5345 ) ) ( not ( = ?auto_5343 ?auto_5328 ) ) ( not ( = ?auto_5343 ?auto_5338 ) ) ( not ( = ?auto_5343 ?auto_5318 ) ) ( not ( = ?auto_5343 ?auto_5337 ) ) ( not ( = ?auto_5340 ?auto_5331 ) ) ( not ( = ?auto_5340 ?auto_5329 ) ) ( not ( = ?auto_5340 ?auto_5330 ) ) ( not ( = ?auto_5340 ?auto_5327 ) ) ( not ( = ?auto_5340 ?auto_5334 ) ) ( not ( = ?auto_5308 ?auto_5315 ) ) ( not ( = ?auto_5308 ?auto_5325 ) ) ( not ( = ?auto_5309 ?auto_5315 ) ) ( not ( = ?auto_5309 ?auto_5325 ) ) ( not ( = ?auto_5310 ?auto_5315 ) ) ( not ( = ?auto_5310 ?auto_5325 ) ) ( not ( = ?auto_5311 ?auto_5315 ) ) ( not ( = ?auto_5311 ?auto_5325 ) ) ( not ( = ?auto_5312 ?auto_5315 ) ) ( not ( = ?auto_5312 ?auto_5325 ) ) ( not ( = ?auto_5313 ?auto_5315 ) ) ( not ( = ?auto_5313 ?auto_5325 ) ) ( not ( = ?auto_5315 ?auto_5340 ) ) ( not ( = ?auto_5315 ?auto_5331 ) ) ( not ( = ?auto_5315 ?auto_5329 ) ) ( not ( = ?auto_5315 ?auto_5330 ) ) ( not ( = ?auto_5315 ?auto_5327 ) ) ( not ( = ?auto_5315 ?auto_5334 ) ) ( not ( = ?auto_5326 ?auto_5324 ) ) ( not ( = ?auto_5326 ?auto_5341 ) ) ( not ( = ?auto_5326 ?auto_5333 ) ) ( not ( = ?auto_5326 ?auto_5342 ) ) ( not ( = ?auto_5326 ?auto_5322 ) ) ( not ( = ?auto_5326 ?auto_5335 ) ) ( not ( = ?auto_5339 ?auto_5343 ) ) ( not ( = ?auto_5339 ?auto_5345 ) ) ( not ( = ?auto_5339 ?auto_5328 ) ) ( not ( = ?auto_5339 ?auto_5338 ) ) ( not ( = ?auto_5339 ?auto_5318 ) ) ( not ( = ?auto_5339 ?auto_5337 ) ) ( not ( = ?auto_5325 ?auto_5340 ) ) ( not ( = ?auto_5325 ?auto_5331 ) ) ( not ( = ?auto_5325 ?auto_5329 ) ) ( not ( = ?auto_5325 ?auto_5330 ) ) ( not ( = ?auto_5325 ?auto_5327 ) ) ( not ( = ?auto_5325 ?auto_5334 ) ) ( not ( = ?auto_5308 ?auto_5316 ) ) ( not ( = ?auto_5308 ?auto_5336 ) ) ( not ( = ?auto_5309 ?auto_5316 ) ) ( not ( = ?auto_5309 ?auto_5336 ) ) ( not ( = ?auto_5310 ?auto_5316 ) ) ( not ( = ?auto_5310 ?auto_5336 ) ) ( not ( = ?auto_5311 ?auto_5316 ) ) ( not ( = ?auto_5311 ?auto_5336 ) ) ( not ( = ?auto_5312 ?auto_5316 ) ) ( not ( = ?auto_5312 ?auto_5336 ) ) ( not ( = ?auto_5313 ?auto_5316 ) ) ( not ( = ?auto_5313 ?auto_5336 ) ) ( not ( = ?auto_5314 ?auto_5316 ) ) ( not ( = ?auto_5314 ?auto_5336 ) ) ( not ( = ?auto_5316 ?auto_5325 ) ) ( not ( = ?auto_5316 ?auto_5340 ) ) ( not ( = ?auto_5316 ?auto_5331 ) ) ( not ( = ?auto_5316 ?auto_5329 ) ) ( not ( = ?auto_5316 ?auto_5330 ) ) ( not ( = ?auto_5316 ?auto_5327 ) ) ( not ( = ?auto_5316 ?auto_5334 ) ) ( not ( = ?auto_5344 ?auto_5326 ) ) ( not ( = ?auto_5344 ?auto_5324 ) ) ( not ( = ?auto_5344 ?auto_5341 ) ) ( not ( = ?auto_5344 ?auto_5333 ) ) ( not ( = ?auto_5344 ?auto_5342 ) ) ( not ( = ?auto_5344 ?auto_5322 ) ) ( not ( = ?auto_5344 ?auto_5335 ) ) ( not ( = ?auto_5332 ?auto_5339 ) ) ( not ( = ?auto_5332 ?auto_5343 ) ) ( not ( = ?auto_5332 ?auto_5345 ) ) ( not ( = ?auto_5332 ?auto_5328 ) ) ( not ( = ?auto_5332 ?auto_5338 ) ) ( not ( = ?auto_5332 ?auto_5318 ) ) ( not ( = ?auto_5332 ?auto_5337 ) ) ( not ( = ?auto_5336 ?auto_5325 ) ) ( not ( = ?auto_5336 ?auto_5340 ) ) ( not ( = ?auto_5336 ?auto_5331 ) ) ( not ( = ?auto_5336 ?auto_5329 ) ) ( not ( = ?auto_5336 ?auto_5330 ) ) ( not ( = ?auto_5336 ?auto_5327 ) ) ( not ( = ?auto_5336 ?auto_5334 ) ) ( not ( = ?auto_5308 ?auto_5317 ) ) ( not ( = ?auto_5308 ?auto_5319 ) ) ( not ( = ?auto_5309 ?auto_5317 ) ) ( not ( = ?auto_5309 ?auto_5319 ) ) ( not ( = ?auto_5310 ?auto_5317 ) ) ( not ( = ?auto_5310 ?auto_5319 ) ) ( not ( = ?auto_5311 ?auto_5317 ) ) ( not ( = ?auto_5311 ?auto_5319 ) ) ( not ( = ?auto_5312 ?auto_5317 ) ) ( not ( = ?auto_5312 ?auto_5319 ) ) ( not ( = ?auto_5313 ?auto_5317 ) ) ( not ( = ?auto_5313 ?auto_5319 ) ) ( not ( = ?auto_5314 ?auto_5317 ) ) ( not ( = ?auto_5314 ?auto_5319 ) ) ( not ( = ?auto_5315 ?auto_5317 ) ) ( not ( = ?auto_5315 ?auto_5319 ) ) ( not ( = ?auto_5317 ?auto_5336 ) ) ( not ( = ?auto_5317 ?auto_5325 ) ) ( not ( = ?auto_5317 ?auto_5340 ) ) ( not ( = ?auto_5317 ?auto_5331 ) ) ( not ( = ?auto_5317 ?auto_5329 ) ) ( not ( = ?auto_5317 ?auto_5330 ) ) ( not ( = ?auto_5317 ?auto_5327 ) ) ( not ( = ?auto_5317 ?auto_5334 ) ) ( not ( = ?auto_5319 ?auto_5336 ) ) ( not ( = ?auto_5319 ?auto_5325 ) ) ( not ( = ?auto_5319 ?auto_5340 ) ) ( not ( = ?auto_5319 ?auto_5331 ) ) ( not ( = ?auto_5319 ?auto_5329 ) ) ( not ( = ?auto_5319 ?auto_5330 ) ) ( not ( = ?auto_5319 ?auto_5327 ) ) ( not ( = ?auto_5319 ?auto_5334 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5308 ?auto_5309 ?auto_5310 ?auto_5311 ?auto_5312 ?auto_5313 ?auto_5314 ?auto_5315 ?auto_5316 )
      ( MAKE-1CRATE ?auto_5316 ?auto_5317 )
      ( MAKE-9CRATE-VERIFY ?auto_5308 ?auto_5309 ?auto_5310 ?auto_5311 ?auto_5312 ?auto_5313 ?auto_5314 ?auto_5315 ?auto_5316 ?auto_5317 ) )
  )

)

