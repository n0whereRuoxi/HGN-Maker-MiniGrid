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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5010 - SURFACE
      ?auto_5011 - SURFACE
    )
    :vars
    (
      ?auto_5012 - HOIST
      ?auto_5013 - PLACE
      ?auto_5015 - PLACE
      ?auto_5016 - HOIST
      ?auto_5017 - SURFACE
      ?auto_5014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5012 ?auto_5013 ) ( SURFACE-AT ?auto_5010 ?auto_5013 ) ( CLEAR ?auto_5010 ) ( IS-CRATE ?auto_5011 ) ( AVAILABLE ?auto_5012 ) ( not ( = ?auto_5015 ?auto_5013 ) ) ( HOIST-AT ?auto_5016 ?auto_5015 ) ( AVAILABLE ?auto_5016 ) ( SURFACE-AT ?auto_5011 ?auto_5015 ) ( ON ?auto_5011 ?auto_5017 ) ( CLEAR ?auto_5011 ) ( TRUCK-AT ?auto_5014 ?auto_5013 ) ( not ( = ?auto_5010 ?auto_5011 ) ) ( not ( = ?auto_5010 ?auto_5017 ) ) ( not ( = ?auto_5011 ?auto_5017 ) ) ( not ( = ?auto_5012 ?auto_5016 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5014 ?auto_5013 ?auto_5015 )
      ( !LIFT ?auto_5016 ?auto_5011 ?auto_5017 ?auto_5015 )
      ( !LOAD ?auto_5016 ?auto_5011 ?auto_5014 ?auto_5015 )
      ( !DRIVE ?auto_5014 ?auto_5015 ?auto_5013 )
      ( !UNLOAD ?auto_5012 ?auto_5011 ?auto_5014 ?auto_5013 )
      ( !DROP ?auto_5012 ?auto_5011 ?auto_5010 ?auto_5013 )
      ( MAKE-1CRATE-VERIFY ?auto_5010 ?auto_5011 ) )
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
      ?auto_5026 - HOIST
      ?auto_5028 - PLACE
      ?auto_5024 - PLACE
      ?auto_5025 - HOIST
      ?auto_5029 - SURFACE
      ?auto_5030 - PLACE
      ?auto_5031 - HOIST
      ?auto_5032 - SURFACE
      ?auto_5027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5026 ?auto_5028 ) ( IS-CRATE ?auto_5023 ) ( not ( = ?auto_5024 ?auto_5028 ) ) ( HOIST-AT ?auto_5025 ?auto_5024 ) ( AVAILABLE ?auto_5025 ) ( SURFACE-AT ?auto_5023 ?auto_5024 ) ( ON ?auto_5023 ?auto_5029 ) ( CLEAR ?auto_5023 ) ( not ( = ?auto_5022 ?auto_5023 ) ) ( not ( = ?auto_5022 ?auto_5029 ) ) ( not ( = ?auto_5023 ?auto_5029 ) ) ( not ( = ?auto_5026 ?auto_5025 ) ) ( SURFACE-AT ?auto_5021 ?auto_5028 ) ( CLEAR ?auto_5021 ) ( IS-CRATE ?auto_5022 ) ( AVAILABLE ?auto_5026 ) ( not ( = ?auto_5030 ?auto_5028 ) ) ( HOIST-AT ?auto_5031 ?auto_5030 ) ( AVAILABLE ?auto_5031 ) ( SURFACE-AT ?auto_5022 ?auto_5030 ) ( ON ?auto_5022 ?auto_5032 ) ( CLEAR ?auto_5022 ) ( TRUCK-AT ?auto_5027 ?auto_5028 ) ( not ( = ?auto_5021 ?auto_5022 ) ) ( not ( = ?auto_5021 ?auto_5032 ) ) ( not ( = ?auto_5022 ?auto_5032 ) ) ( not ( = ?auto_5026 ?auto_5031 ) ) ( not ( = ?auto_5021 ?auto_5023 ) ) ( not ( = ?auto_5021 ?auto_5029 ) ) ( not ( = ?auto_5023 ?auto_5032 ) ) ( not ( = ?auto_5024 ?auto_5030 ) ) ( not ( = ?auto_5025 ?auto_5031 ) ) ( not ( = ?auto_5029 ?auto_5032 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5021 ?auto_5022 )
      ( MAKE-1CRATE ?auto_5022 ?auto_5023 )
      ( MAKE-2CRATE-VERIFY ?auto_5021 ?auto_5022 ?auto_5023 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5035 - SURFACE
      ?auto_5036 - SURFACE
    )
    :vars
    (
      ?auto_5037 - HOIST
      ?auto_5038 - PLACE
      ?auto_5040 - PLACE
      ?auto_5041 - HOIST
      ?auto_5042 - SURFACE
      ?auto_5039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5037 ?auto_5038 ) ( SURFACE-AT ?auto_5035 ?auto_5038 ) ( CLEAR ?auto_5035 ) ( IS-CRATE ?auto_5036 ) ( AVAILABLE ?auto_5037 ) ( not ( = ?auto_5040 ?auto_5038 ) ) ( HOIST-AT ?auto_5041 ?auto_5040 ) ( AVAILABLE ?auto_5041 ) ( SURFACE-AT ?auto_5036 ?auto_5040 ) ( ON ?auto_5036 ?auto_5042 ) ( CLEAR ?auto_5036 ) ( TRUCK-AT ?auto_5039 ?auto_5038 ) ( not ( = ?auto_5035 ?auto_5036 ) ) ( not ( = ?auto_5035 ?auto_5042 ) ) ( not ( = ?auto_5036 ?auto_5042 ) ) ( not ( = ?auto_5037 ?auto_5041 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5039 ?auto_5038 ?auto_5040 )
      ( !LIFT ?auto_5041 ?auto_5036 ?auto_5042 ?auto_5040 )
      ( !LOAD ?auto_5041 ?auto_5036 ?auto_5039 ?auto_5040 )
      ( !DRIVE ?auto_5039 ?auto_5040 ?auto_5038 )
      ( !UNLOAD ?auto_5037 ?auto_5036 ?auto_5039 ?auto_5038 )
      ( !DROP ?auto_5037 ?auto_5036 ?auto_5035 ?auto_5038 )
      ( MAKE-1CRATE-VERIFY ?auto_5035 ?auto_5036 ) )
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
      ?auto_5052 - HOIST
      ?auto_5055 - PLACE
      ?auto_5053 - PLACE
      ?auto_5054 - HOIST
      ?auto_5056 - SURFACE
      ?auto_5059 - PLACE
      ?auto_5062 - HOIST
      ?auto_5057 - SURFACE
      ?auto_5060 - PLACE
      ?auto_5058 - HOIST
      ?auto_5061 - SURFACE
      ?auto_5051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5052 ?auto_5055 ) ( IS-CRATE ?auto_5050 ) ( not ( = ?auto_5053 ?auto_5055 ) ) ( HOIST-AT ?auto_5054 ?auto_5053 ) ( AVAILABLE ?auto_5054 ) ( SURFACE-AT ?auto_5050 ?auto_5053 ) ( ON ?auto_5050 ?auto_5056 ) ( CLEAR ?auto_5050 ) ( not ( = ?auto_5049 ?auto_5050 ) ) ( not ( = ?auto_5049 ?auto_5056 ) ) ( not ( = ?auto_5050 ?auto_5056 ) ) ( not ( = ?auto_5052 ?auto_5054 ) ) ( IS-CRATE ?auto_5049 ) ( not ( = ?auto_5059 ?auto_5055 ) ) ( HOIST-AT ?auto_5062 ?auto_5059 ) ( AVAILABLE ?auto_5062 ) ( SURFACE-AT ?auto_5049 ?auto_5059 ) ( ON ?auto_5049 ?auto_5057 ) ( CLEAR ?auto_5049 ) ( not ( = ?auto_5048 ?auto_5049 ) ) ( not ( = ?auto_5048 ?auto_5057 ) ) ( not ( = ?auto_5049 ?auto_5057 ) ) ( not ( = ?auto_5052 ?auto_5062 ) ) ( SURFACE-AT ?auto_5047 ?auto_5055 ) ( CLEAR ?auto_5047 ) ( IS-CRATE ?auto_5048 ) ( AVAILABLE ?auto_5052 ) ( not ( = ?auto_5060 ?auto_5055 ) ) ( HOIST-AT ?auto_5058 ?auto_5060 ) ( AVAILABLE ?auto_5058 ) ( SURFACE-AT ?auto_5048 ?auto_5060 ) ( ON ?auto_5048 ?auto_5061 ) ( CLEAR ?auto_5048 ) ( TRUCK-AT ?auto_5051 ?auto_5055 ) ( not ( = ?auto_5047 ?auto_5048 ) ) ( not ( = ?auto_5047 ?auto_5061 ) ) ( not ( = ?auto_5048 ?auto_5061 ) ) ( not ( = ?auto_5052 ?auto_5058 ) ) ( not ( = ?auto_5047 ?auto_5049 ) ) ( not ( = ?auto_5047 ?auto_5057 ) ) ( not ( = ?auto_5049 ?auto_5061 ) ) ( not ( = ?auto_5059 ?auto_5060 ) ) ( not ( = ?auto_5062 ?auto_5058 ) ) ( not ( = ?auto_5057 ?auto_5061 ) ) ( not ( = ?auto_5047 ?auto_5050 ) ) ( not ( = ?auto_5047 ?auto_5056 ) ) ( not ( = ?auto_5048 ?auto_5050 ) ) ( not ( = ?auto_5048 ?auto_5056 ) ) ( not ( = ?auto_5050 ?auto_5057 ) ) ( not ( = ?auto_5050 ?auto_5061 ) ) ( not ( = ?auto_5053 ?auto_5059 ) ) ( not ( = ?auto_5053 ?auto_5060 ) ) ( not ( = ?auto_5054 ?auto_5062 ) ) ( not ( = ?auto_5054 ?auto_5058 ) ) ( not ( = ?auto_5056 ?auto_5057 ) ) ( not ( = ?auto_5056 ?auto_5061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5047 ?auto_5048 ?auto_5049 )
      ( MAKE-1CRATE ?auto_5049 ?auto_5050 )
      ( MAKE-3CRATE-VERIFY ?auto_5047 ?auto_5048 ?auto_5049 ?auto_5050 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5065 - SURFACE
      ?auto_5066 - SURFACE
    )
    :vars
    (
      ?auto_5067 - HOIST
      ?auto_5068 - PLACE
      ?auto_5070 - PLACE
      ?auto_5071 - HOIST
      ?auto_5072 - SURFACE
      ?auto_5069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5067 ?auto_5068 ) ( SURFACE-AT ?auto_5065 ?auto_5068 ) ( CLEAR ?auto_5065 ) ( IS-CRATE ?auto_5066 ) ( AVAILABLE ?auto_5067 ) ( not ( = ?auto_5070 ?auto_5068 ) ) ( HOIST-AT ?auto_5071 ?auto_5070 ) ( AVAILABLE ?auto_5071 ) ( SURFACE-AT ?auto_5066 ?auto_5070 ) ( ON ?auto_5066 ?auto_5072 ) ( CLEAR ?auto_5066 ) ( TRUCK-AT ?auto_5069 ?auto_5068 ) ( not ( = ?auto_5065 ?auto_5066 ) ) ( not ( = ?auto_5065 ?auto_5072 ) ) ( not ( = ?auto_5066 ?auto_5072 ) ) ( not ( = ?auto_5067 ?auto_5071 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5069 ?auto_5068 ?auto_5070 )
      ( !LIFT ?auto_5071 ?auto_5066 ?auto_5072 ?auto_5070 )
      ( !LOAD ?auto_5071 ?auto_5066 ?auto_5069 ?auto_5070 )
      ( !DRIVE ?auto_5069 ?auto_5070 ?auto_5068 )
      ( !UNLOAD ?auto_5067 ?auto_5066 ?auto_5069 ?auto_5068 )
      ( !DROP ?auto_5067 ?auto_5066 ?auto_5065 ?auto_5068 )
      ( MAKE-1CRATE-VERIFY ?auto_5065 ?auto_5066 ) )
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
      ?auto_5088 - HOIST
      ?auto_5085 - PLACE
      ?auto_5084 - PLACE
      ?auto_5083 - HOIST
      ?auto_5087 - SURFACE
      ?auto_5097 - PLACE
      ?auto_5095 - HOIST
      ?auto_5096 - SURFACE
      ?auto_5090 - PLACE
      ?auto_5089 - HOIST
      ?auto_5093 - SURFACE
      ?auto_5092 - PLACE
      ?auto_5094 - HOIST
      ?auto_5091 - SURFACE
      ?auto_5086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5088 ?auto_5085 ) ( IS-CRATE ?auto_5082 ) ( not ( = ?auto_5084 ?auto_5085 ) ) ( HOIST-AT ?auto_5083 ?auto_5084 ) ( AVAILABLE ?auto_5083 ) ( SURFACE-AT ?auto_5082 ?auto_5084 ) ( ON ?auto_5082 ?auto_5087 ) ( CLEAR ?auto_5082 ) ( not ( = ?auto_5081 ?auto_5082 ) ) ( not ( = ?auto_5081 ?auto_5087 ) ) ( not ( = ?auto_5082 ?auto_5087 ) ) ( not ( = ?auto_5088 ?auto_5083 ) ) ( IS-CRATE ?auto_5081 ) ( not ( = ?auto_5097 ?auto_5085 ) ) ( HOIST-AT ?auto_5095 ?auto_5097 ) ( AVAILABLE ?auto_5095 ) ( SURFACE-AT ?auto_5081 ?auto_5097 ) ( ON ?auto_5081 ?auto_5096 ) ( CLEAR ?auto_5081 ) ( not ( = ?auto_5080 ?auto_5081 ) ) ( not ( = ?auto_5080 ?auto_5096 ) ) ( not ( = ?auto_5081 ?auto_5096 ) ) ( not ( = ?auto_5088 ?auto_5095 ) ) ( IS-CRATE ?auto_5080 ) ( not ( = ?auto_5090 ?auto_5085 ) ) ( HOIST-AT ?auto_5089 ?auto_5090 ) ( AVAILABLE ?auto_5089 ) ( SURFACE-AT ?auto_5080 ?auto_5090 ) ( ON ?auto_5080 ?auto_5093 ) ( CLEAR ?auto_5080 ) ( not ( = ?auto_5079 ?auto_5080 ) ) ( not ( = ?auto_5079 ?auto_5093 ) ) ( not ( = ?auto_5080 ?auto_5093 ) ) ( not ( = ?auto_5088 ?auto_5089 ) ) ( SURFACE-AT ?auto_5078 ?auto_5085 ) ( CLEAR ?auto_5078 ) ( IS-CRATE ?auto_5079 ) ( AVAILABLE ?auto_5088 ) ( not ( = ?auto_5092 ?auto_5085 ) ) ( HOIST-AT ?auto_5094 ?auto_5092 ) ( AVAILABLE ?auto_5094 ) ( SURFACE-AT ?auto_5079 ?auto_5092 ) ( ON ?auto_5079 ?auto_5091 ) ( CLEAR ?auto_5079 ) ( TRUCK-AT ?auto_5086 ?auto_5085 ) ( not ( = ?auto_5078 ?auto_5079 ) ) ( not ( = ?auto_5078 ?auto_5091 ) ) ( not ( = ?auto_5079 ?auto_5091 ) ) ( not ( = ?auto_5088 ?auto_5094 ) ) ( not ( = ?auto_5078 ?auto_5080 ) ) ( not ( = ?auto_5078 ?auto_5093 ) ) ( not ( = ?auto_5080 ?auto_5091 ) ) ( not ( = ?auto_5090 ?auto_5092 ) ) ( not ( = ?auto_5089 ?auto_5094 ) ) ( not ( = ?auto_5093 ?auto_5091 ) ) ( not ( = ?auto_5078 ?auto_5081 ) ) ( not ( = ?auto_5078 ?auto_5096 ) ) ( not ( = ?auto_5079 ?auto_5081 ) ) ( not ( = ?auto_5079 ?auto_5096 ) ) ( not ( = ?auto_5081 ?auto_5093 ) ) ( not ( = ?auto_5081 ?auto_5091 ) ) ( not ( = ?auto_5097 ?auto_5090 ) ) ( not ( = ?auto_5097 ?auto_5092 ) ) ( not ( = ?auto_5095 ?auto_5089 ) ) ( not ( = ?auto_5095 ?auto_5094 ) ) ( not ( = ?auto_5096 ?auto_5093 ) ) ( not ( = ?auto_5096 ?auto_5091 ) ) ( not ( = ?auto_5078 ?auto_5082 ) ) ( not ( = ?auto_5078 ?auto_5087 ) ) ( not ( = ?auto_5079 ?auto_5082 ) ) ( not ( = ?auto_5079 ?auto_5087 ) ) ( not ( = ?auto_5080 ?auto_5082 ) ) ( not ( = ?auto_5080 ?auto_5087 ) ) ( not ( = ?auto_5082 ?auto_5096 ) ) ( not ( = ?auto_5082 ?auto_5093 ) ) ( not ( = ?auto_5082 ?auto_5091 ) ) ( not ( = ?auto_5084 ?auto_5097 ) ) ( not ( = ?auto_5084 ?auto_5090 ) ) ( not ( = ?auto_5084 ?auto_5092 ) ) ( not ( = ?auto_5083 ?auto_5095 ) ) ( not ( = ?auto_5083 ?auto_5089 ) ) ( not ( = ?auto_5083 ?auto_5094 ) ) ( not ( = ?auto_5087 ?auto_5096 ) ) ( not ( = ?auto_5087 ?auto_5093 ) ) ( not ( = ?auto_5087 ?auto_5091 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5078 ?auto_5079 ?auto_5080 ?auto_5081 )
      ( MAKE-1CRATE ?auto_5081 ?auto_5082 )
      ( MAKE-4CRATE-VERIFY ?auto_5078 ?auto_5079 ?auto_5080 ?auto_5081 ?auto_5082 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5100 - SURFACE
      ?auto_5101 - SURFACE
    )
    :vars
    (
      ?auto_5102 - HOIST
      ?auto_5103 - PLACE
      ?auto_5105 - PLACE
      ?auto_5106 - HOIST
      ?auto_5107 - SURFACE
      ?auto_5104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5102 ?auto_5103 ) ( SURFACE-AT ?auto_5100 ?auto_5103 ) ( CLEAR ?auto_5100 ) ( IS-CRATE ?auto_5101 ) ( AVAILABLE ?auto_5102 ) ( not ( = ?auto_5105 ?auto_5103 ) ) ( HOIST-AT ?auto_5106 ?auto_5105 ) ( AVAILABLE ?auto_5106 ) ( SURFACE-AT ?auto_5101 ?auto_5105 ) ( ON ?auto_5101 ?auto_5107 ) ( CLEAR ?auto_5101 ) ( TRUCK-AT ?auto_5104 ?auto_5103 ) ( not ( = ?auto_5100 ?auto_5101 ) ) ( not ( = ?auto_5100 ?auto_5107 ) ) ( not ( = ?auto_5101 ?auto_5107 ) ) ( not ( = ?auto_5102 ?auto_5106 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5104 ?auto_5103 ?auto_5105 )
      ( !LIFT ?auto_5106 ?auto_5101 ?auto_5107 ?auto_5105 )
      ( !LOAD ?auto_5106 ?auto_5101 ?auto_5104 ?auto_5105 )
      ( !DRIVE ?auto_5104 ?auto_5105 ?auto_5103 )
      ( !UNLOAD ?auto_5102 ?auto_5101 ?auto_5104 ?auto_5103 )
      ( !DROP ?auto_5102 ?auto_5101 ?auto_5100 ?auto_5103 )
      ( MAKE-1CRATE-VERIFY ?auto_5100 ?auto_5101 ) )
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
      ?auto_5123 - HOIST
      ?auto_5122 - PLACE
      ?auto_5125 - PLACE
      ?auto_5120 - HOIST
      ?auto_5121 - SURFACE
      ?auto_5129 - PLACE
      ?auto_5137 - HOIST
      ?auto_5136 - SURFACE
      ?auto_5132 - PLACE
      ?auto_5130 - HOIST
      ?auto_5131 - SURFACE
      ?auto_5133 - PLACE
      ?auto_5127 - HOIST
      ?auto_5135 - SURFACE
      ?auto_5134 - PLACE
      ?auto_5126 - HOIST
      ?auto_5128 - SURFACE
      ?auto_5124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5123 ?auto_5122 ) ( IS-CRATE ?auto_5119 ) ( not ( = ?auto_5125 ?auto_5122 ) ) ( HOIST-AT ?auto_5120 ?auto_5125 ) ( AVAILABLE ?auto_5120 ) ( SURFACE-AT ?auto_5119 ?auto_5125 ) ( ON ?auto_5119 ?auto_5121 ) ( CLEAR ?auto_5119 ) ( not ( = ?auto_5118 ?auto_5119 ) ) ( not ( = ?auto_5118 ?auto_5121 ) ) ( not ( = ?auto_5119 ?auto_5121 ) ) ( not ( = ?auto_5123 ?auto_5120 ) ) ( IS-CRATE ?auto_5118 ) ( not ( = ?auto_5129 ?auto_5122 ) ) ( HOIST-AT ?auto_5137 ?auto_5129 ) ( AVAILABLE ?auto_5137 ) ( SURFACE-AT ?auto_5118 ?auto_5129 ) ( ON ?auto_5118 ?auto_5136 ) ( CLEAR ?auto_5118 ) ( not ( = ?auto_5117 ?auto_5118 ) ) ( not ( = ?auto_5117 ?auto_5136 ) ) ( not ( = ?auto_5118 ?auto_5136 ) ) ( not ( = ?auto_5123 ?auto_5137 ) ) ( IS-CRATE ?auto_5117 ) ( not ( = ?auto_5132 ?auto_5122 ) ) ( HOIST-AT ?auto_5130 ?auto_5132 ) ( AVAILABLE ?auto_5130 ) ( SURFACE-AT ?auto_5117 ?auto_5132 ) ( ON ?auto_5117 ?auto_5131 ) ( CLEAR ?auto_5117 ) ( not ( = ?auto_5116 ?auto_5117 ) ) ( not ( = ?auto_5116 ?auto_5131 ) ) ( not ( = ?auto_5117 ?auto_5131 ) ) ( not ( = ?auto_5123 ?auto_5130 ) ) ( IS-CRATE ?auto_5116 ) ( not ( = ?auto_5133 ?auto_5122 ) ) ( HOIST-AT ?auto_5127 ?auto_5133 ) ( AVAILABLE ?auto_5127 ) ( SURFACE-AT ?auto_5116 ?auto_5133 ) ( ON ?auto_5116 ?auto_5135 ) ( CLEAR ?auto_5116 ) ( not ( = ?auto_5115 ?auto_5116 ) ) ( not ( = ?auto_5115 ?auto_5135 ) ) ( not ( = ?auto_5116 ?auto_5135 ) ) ( not ( = ?auto_5123 ?auto_5127 ) ) ( SURFACE-AT ?auto_5114 ?auto_5122 ) ( CLEAR ?auto_5114 ) ( IS-CRATE ?auto_5115 ) ( AVAILABLE ?auto_5123 ) ( not ( = ?auto_5134 ?auto_5122 ) ) ( HOIST-AT ?auto_5126 ?auto_5134 ) ( AVAILABLE ?auto_5126 ) ( SURFACE-AT ?auto_5115 ?auto_5134 ) ( ON ?auto_5115 ?auto_5128 ) ( CLEAR ?auto_5115 ) ( TRUCK-AT ?auto_5124 ?auto_5122 ) ( not ( = ?auto_5114 ?auto_5115 ) ) ( not ( = ?auto_5114 ?auto_5128 ) ) ( not ( = ?auto_5115 ?auto_5128 ) ) ( not ( = ?auto_5123 ?auto_5126 ) ) ( not ( = ?auto_5114 ?auto_5116 ) ) ( not ( = ?auto_5114 ?auto_5135 ) ) ( not ( = ?auto_5116 ?auto_5128 ) ) ( not ( = ?auto_5133 ?auto_5134 ) ) ( not ( = ?auto_5127 ?auto_5126 ) ) ( not ( = ?auto_5135 ?auto_5128 ) ) ( not ( = ?auto_5114 ?auto_5117 ) ) ( not ( = ?auto_5114 ?auto_5131 ) ) ( not ( = ?auto_5115 ?auto_5117 ) ) ( not ( = ?auto_5115 ?auto_5131 ) ) ( not ( = ?auto_5117 ?auto_5135 ) ) ( not ( = ?auto_5117 ?auto_5128 ) ) ( not ( = ?auto_5132 ?auto_5133 ) ) ( not ( = ?auto_5132 ?auto_5134 ) ) ( not ( = ?auto_5130 ?auto_5127 ) ) ( not ( = ?auto_5130 ?auto_5126 ) ) ( not ( = ?auto_5131 ?auto_5135 ) ) ( not ( = ?auto_5131 ?auto_5128 ) ) ( not ( = ?auto_5114 ?auto_5118 ) ) ( not ( = ?auto_5114 ?auto_5136 ) ) ( not ( = ?auto_5115 ?auto_5118 ) ) ( not ( = ?auto_5115 ?auto_5136 ) ) ( not ( = ?auto_5116 ?auto_5118 ) ) ( not ( = ?auto_5116 ?auto_5136 ) ) ( not ( = ?auto_5118 ?auto_5131 ) ) ( not ( = ?auto_5118 ?auto_5135 ) ) ( not ( = ?auto_5118 ?auto_5128 ) ) ( not ( = ?auto_5129 ?auto_5132 ) ) ( not ( = ?auto_5129 ?auto_5133 ) ) ( not ( = ?auto_5129 ?auto_5134 ) ) ( not ( = ?auto_5137 ?auto_5130 ) ) ( not ( = ?auto_5137 ?auto_5127 ) ) ( not ( = ?auto_5137 ?auto_5126 ) ) ( not ( = ?auto_5136 ?auto_5131 ) ) ( not ( = ?auto_5136 ?auto_5135 ) ) ( not ( = ?auto_5136 ?auto_5128 ) ) ( not ( = ?auto_5114 ?auto_5119 ) ) ( not ( = ?auto_5114 ?auto_5121 ) ) ( not ( = ?auto_5115 ?auto_5119 ) ) ( not ( = ?auto_5115 ?auto_5121 ) ) ( not ( = ?auto_5116 ?auto_5119 ) ) ( not ( = ?auto_5116 ?auto_5121 ) ) ( not ( = ?auto_5117 ?auto_5119 ) ) ( not ( = ?auto_5117 ?auto_5121 ) ) ( not ( = ?auto_5119 ?auto_5136 ) ) ( not ( = ?auto_5119 ?auto_5131 ) ) ( not ( = ?auto_5119 ?auto_5135 ) ) ( not ( = ?auto_5119 ?auto_5128 ) ) ( not ( = ?auto_5125 ?auto_5129 ) ) ( not ( = ?auto_5125 ?auto_5132 ) ) ( not ( = ?auto_5125 ?auto_5133 ) ) ( not ( = ?auto_5125 ?auto_5134 ) ) ( not ( = ?auto_5120 ?auto_5137 ) ) ( not ( = ?auto_5120 ?auto_5130 ) ) ( not ( = ?auto_5120 ?auto_5127 ) ) ( not ( = ?auto_5120 ?auto_5126 ) ) ( not ( = ?auto_5121 ?auto_5136 ) ) ( not ( = ?auto_5121 ?auto_5131 ) ) ( not ( = ?auto_5121 ?auto_5135 ) ) ( not ( = ?auto_5121 ?auto_5128 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5114 ?auto_5115 ?auto_5116 ?auto_5117 ?auto_5118 )
      ( MAKE-1CRATE ?auto_5118 ?auto_5119 )
      ( MAKE-5CRATE-VERIFY ?auto_5114 ?auto_5115 ?auto_5116 ?auto_5117 ?auto_5118 ?auto_5119 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5140 - SURFACE
      ?auto_5141 - SURFACE
    )
    :vars
    (
      ?auto_5142 - HOIST
      ?auto_5143 - PLACE
      ?auto_5145 - PLACE
      ?auto_5146 - HOIST
      ?auto_5147 - SURFACE
      ?auto_5144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5142 ?auto_5143 ) ( SURFACE-AT ?auto_5140 ?auto_5143 ) ( CLEAR ?auto_5140 ) ( IS-CRATE ?auto_5141 ) ( AVAILABLE ?auto_5142 ) ( not ( = ?auto_5145 ?auto_5143 ) ) ( HOIST-AT ?auto_5146 ?auto_5145 ) ( AVAILABLE ?auto_5146 ) ( SURFACE-AT ?auto_5141 ?auto_5145 ) ( ON ?auto_5141 ?auto_5147 ) ( CLEAR ?auto_5141 ) ( TRUCK-AT ?auto_5144 ?auto_5143 ) ( not ( = ?auto_5140 ?auto_5141 ) ) ( not ( = ?auto_5140 ?auto_5147 ) ) ( not ( = ?auto_5141 ?auto_5147 ) ) ( not ( = ?auto_5142 ?auto_5146 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5144 ?auto_5143 ?auto_5145 )
      ( !LIFT ?auto_5146 ?auto_5141 ?auto_5147 ?auto_5145 )
      ( !LOAD ?auto_5146 ?auto_5141 ?auto_5144 ?auto_5145 )
      ( !DRIVE ?auto_5144 ?auto_5145 ?auto_5143 )
      ( !UNLOAD ?auto_5142 ?auto_5141 ?auto_5144 ?auto_5143 )
      ( !DROP ?auto_5142 ?auto_5141 ?auto_5140 ?auto_5143 )
      ( MAKE-1CRATE-VERIFY ?auto_5140 ?auto_5141 ) )
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
      ?auto_5167 - HOIST
      ?auto_5166 - PLACE
      ?auto_5164 - PLACE
      ?auto_5162 - HOIST
      ?auto_5163 - SURFACE
      ?auto_5177 - PLACE
      ?auto_5176 - HOIST
      ?auto_5168 - SURFACE
      ?auto_5173 - PLACE
      ?auto_5175 - HOIST
      ?auto_5181 - SURFACE
      ?auto_5169 - PLACE
      ?auto_5170 - HOIST
      ?auto_5171 - SURFACE
      ?auto_5172 - PLACE
      ?auto_5179 - HOIST
      ?auto_5180 - SURFACE
      ?auto_5174 - PLACE
      ?auto_5182 - HOIST
      ?auto_5178 - SURFACE
      ?auto_5165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5167 ?auto_5166 ) ( IS-CRATE ?auto_5161 ) ( not ( = ?auto_5164 ?auto_5166 ) ) ( HOIST-AT ?auto_5162 ?auto_5164 ) ( AVAILABLE ?auto_5162 ) ( SURFACE-AT ?auto_5161 ?auto_5164 ) ( ON ?auto_5161 ?auto_5163 ) ( CLEAR ?auto_5161 ) ( not ( = ?auto_5160 ?auto_5161 ) ) ( not ( = ?auto_5160 ?auto_5163 ) ) ( not ( = ?auto_5161 ?auto_5163 ) ) ( not ( = ?auto_5167 ?auto_5162 ) ) ( IS-CRATE ?auto_5160 ) ( not ( = ?auto_5177 ?auto_5166 ) ) ( HOIST-AT ?auto_5176 ?auto_5177 ) ( AVAILABLE ?auto_5176 ) ( SURFACE-AT ?auto_5160 ?auto_5177 ) ( ON ?auto_5160 ?auto_5168 ) ( CLEAR ?auto_5160 ) ( not ( = ?auto_5159 ?auto_5160 ) ) ( not ( = ?auto_5159 ?auto_5168 ) ) ( not ( = ?auto_5160 ?auto_5168 ) ) ( not ( = ?auto_5167 ?auto_5176 ) ) ( IS-CRATE ?auto_5159 ) ( not ( = ?auto_5173 ?auto_5166 ) ) ( HOIST-AT ?auto_5175 ?auto_5173 ) ( AVAILABLE ?auto_5175 ) ( SURFACE-AT ?auto_5159 ?auto_5173 ) ( ON ?auto_5159 ?auto_5181 ) ( CLEAR ?auto_5159 ) ( not ( = ?auto_5158 ?auto_5159 ) ) ( not ( = ?auto_5158 ?auto_5181 ) ) ( not ( = ?auto_5159 ?auto_5181 ) ) ( not ( = ?auto_5167 ?auto_5175 ) ) ( IS-CRATE ?auto_5158 ) ( not ( = ?auto_5169 ?auto_5166 ) ) ( HOIST-AT ?auto_5170 ?auto_5169 ) ( AVAILABLE ?auto_5170 ) ( SURFACE-AT ?auto_5158 ?auto_5169 ) ( ON ?auto_5158 ?auto_5171 ) ( CLEAR ?auto_5158 ) ( not ( = ?auto_5157 ?auto_5158 ) ) ( not ( = ?auto_5157 ?auto_5171 ) ) ( not ( = ?auto_5158 ?auto_5171 ) ) ( not ( = ?auto_5167 ?auto_5170 ) ) ( IS-CRATE ?auto_5157 ) ( not ( = ?auto_5172 ?auto_5166 ) ) ( HOIST-AT ?auto_5179 ?auto_5172 ) ( AVAILABLE ?auto_5179 ) ( SURFACE-AT ?auto_5157 ?auto_5172 ) ( ON ?auto_5157 ?auto_5180 ) ( CLEAR ?auto_5157 ) ( not ( = ?auto_5156 ?auto_5157 ) ) ( not ( = ?auto_5156 ?auto_5180 ) ) ( not ( = ?auto_5157 ?auto_5180 ) ) ( not ( = ?auto_5167 ?auto_5179 ) ) ( SURFACE-AT ?auto_5155 ?auto_5166 ) ( CLEAR ?auto_5155 ) ( IS-CRATE ?auto_5156 ) ( AVAILABLE ?auto_5167 ) ( not ( = ?auto_5174 ?auto_5166 ) ) ( HOIST-AT ?auto_5182 ?auto_5174 ) ( AVAILABLE ?auto_5182 ) ( SURFACE-AT ?auto_5156 ?auto_5174 ) ( ON ?auto_5156 ?auto_5178 ) ( CLEAR ?auto_5156 ) ( TRUCK-AT ?auto_5165 ?auto_5166 ) ( not ( = ?auto_5155 ?auto_5156 ) ) ( not ( = ?auto_5155 ?auto_5178 ) ) ( not ( = ?auto_5156 ?auto_5178 ) ) ( not ( = ?auto_5167 ?auto_5182 ) ) ( not ( = ?auto_5155 ?auto_5157 ) ) ( not ( = ?auto_5155 ?auto_5180 ) ) ( not ( = ?auto_5157 ?auto_5178 ) ) ( not ( = ?auto_5172 ?auto_5174 ) ) ( not ( = ?auto_5179 ?auto_5182 ) ) ( not ( = ?auto_5180 ?auto_5178 ) ) ( not ( = ?auto_5155 ?auto_5158 ) ) ( not ( = ?auto_5155 ?auto_5171 ) ) ( not ( = ?auto_5156 ?auto_5158 ) ) ( not ( = ?auto_5156 ?auto_5171 ) ) ( not ( = ?auto_5158 ?auto_5180 ) ) ( not ( = ?auto_5158 ?auto_5178 ) ) ( not ( = ?auto_5169 ?auto_5172 ) ) ( not ( = ?auto_5169 ?auto_5174 ) ) ( not ( = ?auto_5170 ?auto_5179 ) ) ( not ( = ?auto_5170 ?auto_5182 ) ) ( not ( = ?auto_5171 ?auto_5180 ) ) ( not ( = ?auto_5171 ?auto_5178 ) ) ( not ( = ?auto_5155 ?auto_5159 ) ) ( not ( = ?auto_5155 ?auto_5181 ) ) ( not ( = ?auto_5156 ?auto_5159 ) ) ( not ( = ?auto_5156 ?auto_5181 ) ) ( not ( = ?auto_5157 ?auto_5159 ) ) ( not ( = ?auto_5157 ?auto_5181 ) ) ( not ( = ?auto_5159 ?auto_5171 ) ) ( not ( = ?auto_5159 ?auto_5180 ) ) ( not ( = ?auto_5159 ?auto_5178 ) ) ( not ( = ?auto_5173 ?auto_5169 ) ) ( not ( = ?auto_5173 ?auto_5172 ) ) ( not ( = ?auto_5173 ?auto_5174 ) ) ( not ( = ?auto_5175 ?auto_5170 ) ) ( not ( = ?auto_5175 ?auto_5179 ) ) ( not ( = ?auto_5175 ?auto_5182 ) ) ( not ( = ?auto_5181 ?auto_5171 ) ) ( not ( = ?auto_5181 ?auto_5180 ) ) ( not ( = ?auto_5181 ?auto_5178 ) ) ( not ( = ?auto_5155 ?auto_5160 ) ) ( not ( = ?auto_5155 ?auto_5168 ) ) ( not ( = ?auto_5156 ?auto_5160 ) ) ( not ( = ?auto_5156 ?auto_5168 ) ) ( not ( = ?auto_5157 ?auto_5160 ) ) ( not ( = ?auto_5157 ?auto_5168 ) ) ( not ( = ?auto_5158 ?auto_5160 ) ) ( not ( = ?auto_5158 ?auto_5168 ) ) ( not ( = ?auto_5160 ?auto_5181 ) ) ( not ( = ?auto_5160 ?auto_5171 ) ) ( not ( = ?auto_5160 ?auto_5180 ) ) ( not ( = ?auto_5160 ?auto_5178 ) ) ( not ( = ?auto_5177 ?auto_5173 ) ) ( not ( = ?auto_5177 ?auto_5169 ) ) ( not ( = ?auto_5177 ?auto_5172 ) ) ( not ( = ?auto_5177 ?auto_5174 ) ) ( not ( = ?auto_5176 ?auto_5175 ) ) ( not ( = ?auto_5176 ?auto_5170 ) ) ( not ( = ?auto_5176 ?auto_5179 ) ) ( not ( = ?auto_5176 ?auto_5182 ) ) ( not ( = ?auto_5168 ?auto_5181 ) ) ( not ( = ?auto_5168 ?auto_5171 ) ) ( not ( = ?auto_5168 ?auto_5180 ) ) ( not ( = ?auto_5168 ?auto_5178 ) ) ( not ( = ?auto_5155 ?auto_5161 ) ) ( not ( = ?auto_5155 ?auto_5163 ) ) ( not ( = ?auto_5156 ?auto_5161 ) ) ( not ( = ?auto_5156 ?auto_5163 ) ) ( not ( = ?auto_5157 ?auto_5161 ) ) ( not ( = ?auto_5157 ?auto_5163 ) ) ( not ( = ?auto_5158 ?auto_5161 ) ) ( not ( = ?auto_5158 ?auto_5163 ) ) ( not ( = ?auto_5159 ?auto_5161 ) ) ( not ( = ?auto_5159 ?auto_5163 ) ) ( not ( = ?auto_5161 ?auto_5168 ) ) ( not ( = ?auto_5161 ?auto_5181 ) ) ( not ( = ?auto_5161 ?auto_5171 ) ) ( not ( = ?auto_5161 ?auto_5180 ) ) ( not ( = ?auto_5161 ?auto_5178 ) ) ( not ( = ?auto_5164 ?auto_5177 ) ) ( not ( = ?auto_5164 ?auto_5173 ) ) ( not ( = ?auto_5164 ?auto_5169 ) ) ( not ( = ?auto_5164 ?auto_5172 ) ) ( not ( = ?auto_5164 ?auto_5174 ) ) ( not ( = ?auto_5162 ?auto_5176 ) ) ( not ( = ?auto_5162 ?auto_5175 ) ) ( not ( = ?auto_5162 ?auto_5170 ) ) ( not ( = ?auto_5162 ?auto_5179 ) ) ( not ( = ?auto_5162 ?auto_5182 ) ) ( not ( = ?auto_5163 ?auto_5168 ) ) ( not ( = ?auto_5163 ?auto_5181 ) ) ( not ( = ?auto_5163 ?auto_5171 ) ) ( not ( = ?auto_5163 ?auto_5180 ) ) ( not ( = ?auto_5163 ?auto_5178 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5155 ?auto_5156 ?auto_5157 ?auto_5158 ?auto_5159 ?auto_5160 )
      ( MAKE-1CRATE ?auto_5160 ?auto_5161 )
      ( MAKE-6CRATE-VERIFY ?auto_5155 ?auto_5156 ?auto_5157 ?auto_5158 ?auto_5159 ?auto_5160 ?auto_5161 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5185 - SURFACE
      ?auto_5186 - SURFACE
    )
    :vars
    (
      ?auto_5187 - HOIST
      ?auto_5188 - PLACE
      ?auto_5190 - PLACE
      ?auto_5191 - HOIST
      ?auto_5192 - SURFACE
      ?auto_5189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5187 ?auto_5188 ) ( SURFACE-AT ?auto_5185 ?auto_5188 ) ( CLEAR ?auto_5185 ) ( IS-CRATE ?auto_5186 ) ( AVAILABLE ?auto_5187 ) ( not ( = ?auto_5190 ?auto_5188 ) ) ( HOIST-AT ?auto_5191 ?auto_5190 ) ( AVAILABLE ?auto_5191 ) ( SURFACE-AT ?auto_5186 ?auto_5190 ) ( ON ?auto_5186 ?auto_5192 ) ( CLEAR ?auto_5186 ) ( TRUCK-AT ?auto_5189 ?auto_5188 ) ( not ( = ?auto_5185 ?auto_5186 ) ) ( not ( = ?auto_5185 ?auto_5192 ) ) ( not ( = ?auto_5186 ?auto_5192 ) ) ( not ( = ?auto_5187 ?auto_5191 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5189 ?auto_5188 ?auto_5190 )
      ( !LIFT ?auto_5191 ?auto_5186 ?auto_5192 ?auto_5190 )
      ( !LOAD ?auto_5191 ?auto_5186 ?auto_5189 ?auto_5190 )
      ( !DRIVE ?auto_5189 ?auto_5190 ?auto_5188 )
      ( !UNLOAD ?auto_5187 ?auto_5186 ?auto_5189 ?auto_5188 )
      ( !DROP ?auto_5187 ?auto_5186 ?auto_5185 ?auto_5188 )
      ( MAKE-1CRATE-VERIFY ?auto_5185 ?auto_5186 ) )
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
      ?auto_5213 - HOIST
      ?auto_5211 - PLACE
      ?auto_5209 - PLACE
      ?auto_5210 - HOIST
      ?auto_5212 - SURFACE
      ?auto_5220 - PLACE
      ?auto_5221 - HOIST
      ?auto_5226 - SURFACE
      ?auto_5229 - PLACE
      ?auto_5231 - HOIST
      ?auto_5227 - SURFACE
      ?auto_5218 - PLACE
      ?auto_5216 - HOIST
      ?auto_5228 - SURFACE
      ?auto_5224 - PLACE
      ?auto_5222 - HOIST
      ?auto_5225 - SURFACE
      ?auto_5219 - PLACE
      ?auto_5215 - HOIST
      ?auto_5232 - SURFACE
      ?auto_5217 - PLACE
      ?auto_5223 - HOIST
      ?auto_5230 - SURFACE
      ?auto_5214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5213 ?auto_5211 ) ( IS-CRATE ?auto_5208 ) ( not ( = ?auto_5209 ?auto_5211 ) ) ( HOIST-AT ?auto_5210 ?auto_5209 ) ( AVAILABLE ?auto_5210 ) ( SURFACE-AT ?auto_5208 ?auto_5209 ) ( ON ?auto_5208 ?auto_5212 ) ( CLEAR ?auto_5208 ) ( not ( = ?auto_5207 ?auto_5208 ) ) ( not ( = ?auto_5207 ?auto_5212 ) ) ( not ( = ?auto_5208 ?auto_5212 ) ) ( not ( = ?auto_5213 ?auto_5210 ) ) ( IS-CRATE ?auto_5207 ) ( not ( = ?auto_5220 ?auto_5211 ) ) ( HOIST-AT ?auto_5221 ?auto_5220 ) ( AVAILABLE ?auto_5221 ) ( SURFACE-AT ?auto_5207 ?auto_5220 ) ( ON ?auto_5207 ?auto_5226 ) ( CLEAR ?auto_5207 ) ( not ( = ?auto_5206 ?auto_5207 ) ) ( not ( = ?auto_5206 ?auto_5226 ) ) ( not ( = ?auto_5207 ?auto_5226 ) ) ( not ( = ?auto_5213 ?auto_5221 ) ) ( IS-CRATE ?auto_5206 ) ( not ( = ?auto_5229 ?auto_5211 ) ) ( HOIST-AT ?auto_5231 ?auto_5229 ) ( AVAILABLE ?auto_5231 ) ( SURFACE-AT ?auto_5206 ?auto_5229 ) ( ON ?auto_5206 ?auto_5227 ) ( CLEAR ?auto_5206 ) ( not ( = ?auto_5205 ?auto_5206 ) ) ( not ( = ?auto_5205 ?auto_5227 ) ) ( not ( = ?auto_5206 ?auto_5227 ) ) ( not ( = ?auto_5213 ?auto_5231 ) ) ( IS-CRATE ?auto_5205 ) ( not ( = ?auto_5218 ?auto_5211 ) ) ( HOIST-AT ?auto_5216 ?auto_5218 ) ( AVAILABLE ?auto_5216 ) ( SURFACE-AT ?auto_5205 ?auto_5218 ) ( ON ?auto_5205 ?auto_5228 ) ( CLEAR ?auto_5205 ) ( not ( = ?auto_5204 ?auto_5205 ) ) ( not ( = ?auto_5204 ?auto_5228 ) ) ( not ( = ?auto_5205 ?auto_5228 ) ) ( not ( = ?auto_5213 ?auto_5216 ) ) ( IS-CRATE ?auto_5204 ) ( not ( = ?auto_5224 ?auto_5211 ) ) ( HOIST-AT ?auto_5222 ?auto_5224 ) ( AVAILABLE ?auto_5222 ) ( SURFACE-AT ?auto_5204 ?auto_5224 ) ( ON ?auto_5204 ?auto_5225 ) ( CLEAR ?auto_5204 ) ( not ( = ?auto_5203 ?auto_5204 ) ) ( not ( = ?auto_5203 ?auto_5225 ) ) ( not ( = ?auto_5204 ?auto_5225 ) ) ( not ( = ?auto_5213 ?auto_5222 ) ) ( IS-CRATE ?auto_5203 ) ( not ( = ?auto_5219 ?auto_5211 ) ) ( HOIST-AT ?auto_5215 ?auto_5219 ) ( AVAILABLE ?auto_5215 ) ( SURFACE-AT ?auto_5203 ?auto_5219 ) ( ON ?auto_5203 ?auto_5232 ) ( CLEAR ?auto_5203 ) ( not ( = ?auto_5202 ?auto_5203 ) ) ( not ( = ?auto_5202 ?auto_5232 ) ) ( not ( = ?auto_5203 ?auto_5232 ) ) ( not ( = ?auto_5213 ?auto_5215 ) ) ( SURFACE-AT ?auto_5201 ?auto_5211 ) ( CLEAR ?auto_5201 ) ( IS-CRATE ?auto_5202 ) ( AVAILABLE ?auto_5213 ) ( not ( = ?auto_5217 ?auto_5211 ) ) ( HOIST-AT ?auto_5223 ?auto_5217 ) ( AVAILABLE ?auto_5223 ) ( SURFACE-AT ?auto_5202 ?auto_5217 ) ( ON ?auto_5202 ?auto_5230 ) ( CLEAR ?auto_5202 ) ( TRUCK-AT ?auto_5214 ?auto_5211 ) ( not ( = ?auto_5201 ?auto_5202 ) ) ( not ( = ?auto_5201 ?auto_5230 ) ) ( not ( = ?auto_5202 ?auto_5230 ) ) ( not ( = ?auto_5213 ?auto_5223 ) ) ( not ( = ?auto_5201 ?auto_5203 ) ) ( not ( = ?auto_5201 ?auto_5232 ) ) ( not ( = ?auto_5203 ?auto_5230 ) ) ( not ( = ?auto_5219 ?auto_5217 ) ) ( not ( = ?auto_5215 ?auto_5223 ) ) ( not ( = ?auto_5232 ?auto_5230 ) ) ( not ( = ?auto_5201 ?auto_5204 ) ) ( not ( = ?auto_5201 ?auto_5225 ) ) ( not ( = ?auto_5202 ?auto_5204 ) ) ( not ( = ?auto_5202 ?auto_5225 ) ) ( not ( = ?auto_5204 ?auto_5232 ) ) ( not ( = ?auto_5204 ?auto_5230 ) ) ( not ( = ?auto_5224 ?auto_5219 ) ) ( not ( = ?auto_5224 ?auto_5217 ) ) ( not ( = ?auto_5222 ?auto_5215 ) ) ( not ( = ?auto_5222 ?auto_5223 ) ) ( not ( = ?auto_5225 ?auto_5232 ) ) ( not ( = ?auto_5225 ?auto_5230 ) ) ( not ( = ?auto_5201 ?auto_5205 ) ) ( not ( = ?auto_5201 ?auto_5228 ) ) ( not ( = ?auto_5202 ?auto_5205 ) ) ( not ( = ?auto_5202 ?auto_5228 ) ) ( not ( = ?auto_5203 ?auto_5205 ) ) ( not ( = ?auto_5203 ?auto_5228 ) ) ( not ( = ?auto_5205 ?auto_5225 ) ) ( not ( = ?auto_5205 ?auto_5232 ) ) ( not ( = ?auto_5205 ?auto_5230 ) ) ( not ( = ?auto_5218 ?auto_5224 ) ) ( not ( = ?auto_5218 ?auto_5219 ) ) ( not ( = ?auto_5218 ?auto_5217 ) ) ( not ( = ?auto_5216 ?auto_5222 ) ) ( not ( = ?auto_5216 ?auto_5215 ) ) ( not ( = ?auto_5216 ?auto_5223 ) ) ( not ( = ?auto_5228 ?auto_5225 ) ) ( not ( = ?auto_5228 ?auto_5232 ) ) ( not ( = ?auto_5228 ?auto_5230 ) ) ( not ( = ?auto_5201 ?auto_5206 ) ) ( not ( = ?auto_5201 ?auto_5227 ) ) ( not ( = ?auto_5202 ?auto_5206 ) ) ( not ( = ?auto_5202 ?auto_5227 ) ) ( not ( = ?auto_5203 ?auto_5206 ) ) ( not ( = ?auto_5203 ?auto_5227 ) ) ( not ( = ?auto_5204 ?auto_5206 ) ) ( not ( = ?auto_5204 ?auto_5227 ) ) ( not ( = ?auto_5206 ?auto_5228 ) ) ( not ( = ?auto_5206 ?auto_5225 ) ) ( not ( = ?auto_5206 ?auto_5232 ) ) ( not ( = ?auto_5206 ?auto_5230 ) ) ( not ( = ?auto_5229 ?auto_5218 ) ) ( not ( = ?auto_5229 ?auto_5224 ) ) ( not ( = ?auto_5229 ?auto_5219 ) ) ( not ( = ?auto_5229 ?auto_5217 ) ) ( not ( = ?auto_5231 ?auto_5216 ) ) ( not ( = ?auto_5231 ?auto_5222 ) ) ( not ( = ?auto_5231 ?auto_5215 ) ) ( not ( = ?auto_5231 ?auto_5223 ) ) ( not ( = ?auto_5227 ?auto_5228 ) ) ( not ( = ?auto_5227 ?auto_5225 ) ) ( not ( = ?auto_5227 ?auto_5232 ) ) ( not ( = ?auto_5227 ?auto_5230 ) ) ( not ( = ?auto_5201 ?auto_5207 ) ) ( not ( = ?auto_5201 ?auto_5226 ) ) ( not ( = ?auto_5202 ?auto_5207 ) ) ( not ( = ?auto_5202 ?auto_5226 ) ) ( not ( = ?auto_5203 ?auto_5207 ) ) ( not ( = ?auto_5203 ?auto_5226 ) ) ( not ( = ?auto_5204 ?auto_5207 ) ) ( not ( = ?auto_5204 ?auto_5226 ) ) ( not ( = ?auto_5205 ?auto_5207 ) ) ( not ( = ?auto_5205 ?auto_5226 ) ) ( not ( = ?auto_5207 ?auto_5227 ) ) ( not ( = ?auto_5207 ?auto_5228 ) ) ( not ( = ?auto_5207 ?auto_5225 ) ) ( not ( = ?auto_5207 ?auto_5232 ) ) ( not ( = ?auto_5207 ?auto_5230 ) ) ( not ( = ?auto_5220 ?auto_5229 ) ) ( not ( = ?auto_5220 ?auto_5218 ) ) ( not ( = ?auto_5220 ?auto_5224 ) ) ( not ( = ?auto_5220 ?auto_5219 ) ) ( not ( = ?auto_5220 ?auto_5217 ) ) ( not ( = ?auto_5221 ?auto_5231 ) ) ( not ( = ?auto_5221 ?auto_5216 ) ) ( not ( = ?auto_5221 ?auto_5222 ) ) ( not ( = ?auto_5221 ?auto_5215 ) ) ( not ( = ?auto_5221 ?auto_5223 ) ) ( not ( = ?auto_5226 ?auto_5227 ) ) ( not ( = ?auto_5226 ?auto_5228 ) ) ( not ( = ?auto_5226 ?auto_5225 ) ) ( not ( = ?auto_5226 ?auto_5232 ) ) ( not ( = ?auto_5226 ?auto_5230 ) ) ( not ( = ?auto_5201 ?auto_5208 ) ) ( not ( = ?auto_5201 ?auto_5212 ) ) ( not ( = ?auto_5202 ?auto_5208 ) ) ( not ( = ?auto_5202 ?auto_5212 ) ) ( not ( = ?auto_5203 ?auto_5208 ) ) ( not ( = ?auto_5203 ?auto_5212 ) ) ( not ( = ?auto_5204 ?auto_5208 ) ) ( not ( = ?auto_5204 ?auto_5212 ) ) ( not ( = ?auto_5205 ?auto_5208 ) ) ( not ( = ?auto_5205 ?auto_5212 ) ) ( not ( = ?auto_5206 ?auto_5208 ) ) ( not ( = ?auto_5206 ?auto_5212 ) ) ( not ( = ?auto_5208 ?auto_5226 ) ) ( not ( = ?auto_5208 ?auto_5227 ) ) ( not ( = ?auto_5208 ?auto_5228 ) ) ( not ( = ?auto_5208 ?auto_5225 ) ) ( not ( = ?auto_5208 ?auto_5232 ) ) ( not ( = ?auto_5208 ?auto_5230 ) ) ( not ( = ?auto_5209 ?auto_5220 ) ) ( not ( = ?auto_5209 ?auto_5229 ) ) ( not ( = ?auto_5209 ?auto_5218 ) ) ( not ( = ?auto_5209 ?auto_5224 ) ) ( not ( = ?auto_5209 ?auto_5219 ) ) ( not ( = ?auto_5209 ?auto_5217 ) ) ( not ( = ?auto_5210 ?auto_5221 ) ) ( not ( = ?auto_5210 ?auto_5231 ) ) ( not ( = ?auto_5210 ?auto_5216 ) ) ( not ( = ?auto_5210 ?auto_5222 ) ) ( not ( = ?auto_5210 ?auto_5215 ) ) ( not ( = ?auto_5210 ?auto_5223 ) ) ( not ( = ?auto_5212 ?auto_5226 ) ) ( not ( = ?auto_5212 ?auto_5227 ) ) ( not ( = ?auto_5212 ?auto_5228 ) ) ( not ( = ?auto_5212 ?auto_5225 ) ) ( not ( = ?auto_5212 ?auto_5232 ) ) ( not ( = ?auto_5212 ?auto_5230 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5201 ?auto_5202 ?auto_5203 ?auto_5204 ?auto_5205 ?auto_5206 ?auto_5207 )
      ( MAKE-1CRATE ?auto_5207 ?auto_5208 )
      ( MAKE-7CRATE-VERIFY ?auto_5201 ?auto_5202 ?auto_5203 ?auto_5204 ?auto_5205 ?auto_5206 ?auto_5207 ?auto_5208 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5235 - SURFACE
      ?auto_5236 - SURFACE
    )
    :vars
    (
      ?auto_5237 - HOIST
      ?auto_5238 - PLACE
      ?auto_5240 - PLACE
      ?auto_5241 - HOIST
      ?auto_5242 - SURFACE
      ?auto_5239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5237 ?auto_5238 ) ( SURFACE-AT ?auto_5235 ?auto_5238 ) ( CLEAR ?auto_5235 ) ( IS-CRATE ?auto_5236 ) ( AVAILABLE ?auto_5237 ) ( not ( = ?auto_5240 ?auto_5238 ) ) ( HOIST-AT ?auto_5241 ?auto_5240 ) ( AVAILABLE ?auto_5241 ) ( SURFACE-AT ?auto_5236 ?auto_5240 ) ( ON ?auto_5236 ?auto_5242 ) ( CLEAR ?auto_5236 ) ( TRUCK-AT ?auto_5239 ?auto_5238 ) ( not ( = ?auto_5235 ?auto_5236 ) ) ( not ( = ?auto_5235 ?auto_5242 ) ) ( not ( = ?auto_5236 ?auto_5242 ) ) ( not ( = ?auto_5237 ?auto_5241 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5239 ?auto_5238 ?auto_5240 )
      ( !LIFT ?auto_5241 ?auto_5236 ?auto_5242 ?auto_5240 )
      ( !LOAD ?auto_5241 ?auto_5236 ?auto_5239 ?auto_5240 )
      ( !DRIVE ?auto_5239 ?auto_5240 ?auto_5238 )
      ( !UNLOAD ?auto_5237 ?auto_5236 ?auto_5239 ?auto_5238 )
      ( !DROP ?auto_5237 ?auto_5236 ?auto_5235 ?auto_5238 )
      ( MAKE-1CRATE-VERIFY ?auto_5235 ?auto_5236 ) )
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
      ?auto_5260 - SURFACE
      ?auto_5259 - SURFACE
    )
    :vars
    (
      ?auto_5266 - HOIST
      ?auto_5265 - PLACE
      ?auto_5261 - PLACE
      ?auto_5264 - HOIST
      ?auto_5263 - SURFACE
      ?auto_5285 - PLACE
      ?auto_5287 - HOIST
      ?auto_5267 - SURFACE
      ?auto_5283 - PLACE
      ?auto_5282 - HOIST
      ?auto_5278 - SURFACE
      ?auto_5270 - PLACE
      ?auto_5272 - HOIST
      ?auto_5279 - SURFACE
      ?auto_5269 - PLACE
      ?auto_5268 - HOIST
      ?auto_5280 - SURFACE
      ?auto_5277 - PLACE
      ?auto_5281 - HOIST
      ?auto_5276 - SURFACE
      ?auto_5284 - PLACE
      ?auto_5273 - HOIST
      ?auto_5271 - SURFACE
      ?auto_5286 - PLACE
      ?auto_5275 - HOIST
      ?auto_5274 - SURFACE
      ?auto_5262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5266 ?auto_5265 ) ( IS-CRATE ?auto_5259 ) ( not ( = ?auto_5261 ?auto_5265 ) ) ( HOIST-AT ?auto_5264 ?auto_5261 ) ( AVAILABLE ?auto_5264 ) ( SURFACE-AT ?auto_5259 ?auto_5261 ) ( ON ?auto_5259 ?auto_5263 ) ( CLEAR ?auto_5259 ) ( not ( = ?auto_5260 ?auto_5259 ) ) ( not ( = ?auto_5260 ?auto_5263 ) ) ( not ( = ?auto_5259 ?auto_5263 ) ) ( not ( = ?auto_5266 ?auto_5264 ) ) ( IS-CRATE ?auto_5260 ) ( not ( = ?auto_5285 ?auto_5265 ) ) ( HOIST-AT ?auto_5287 ?auto_5285 ) ( AVAILABLE ?auto_5287 ) ( SURFACE-AT ?auto_5260 ?auto_5285 ) ( ON ?auto_5260 ?auto_5267 ) ( CLEAR ?auto_5260 ) ( not ( = ?auto_5258 ?auto_5260 ) ) ( not ( = ?auto_5258 ?auto_5267 ) ) ( not ( = ?auto_5260 ?auto_5267 ) ) ( not ( = ?auto_5266 ?auto_5287 ) ) ( IS-CRATE ?auto_5258 ) ( not ( = ?auto_5283 ?auto_5265 ) ) ( HOIST-AT ?auto_5282 ?auto_5283 ) ( AVAILABLE ?auto_5282 ) ( SURFACE-AT ?auto_5258 ?auto_5283 ) ( ON ?auto_5258 ?auto_5278 ) ( CLEAR ?auto_5258 ) ( not ( = ?auto_5257 ?auto_5258 ) ) ( not ( = ?auto_5257 ?auto_5278 ) ) ( not ( = ?auto_5258 ?auto_5278 ) ) ( not ( = ?auto_5266 ?auto_5282 ) ) ( IS-CRATE ?auto_5257 ) ( not ( = ?auto_5270 ?auto_5265 ) ) ( HOIST-AT ?auto_5272 ?auto_5270 ) ( AVAILABLE ?auto_5272 ) ( SURFACE-AT ?auto_5257 ?auto_5270 ) ( ON ?auto_5257 ?auto_5279 ) ( CLEAR ?auto_5257 ) ( not ( = ?auto_5256 ?auto_5257 ) ) ( not ( = ?auto_5256 ?auto_5279 ) ) ( not ( = ?auto_5257 ?auto_5279 ) ) ( not ( = ?auto_5266 ?auto_5272 ) ) ( IS-CRATE ?auto_5256 ) ( not ( = ?auto_5269 ?auto_5265 ) ) ( HOIST-AT ?auto_5268 ?auto_5269 ) ( AVAILABLE ?auto_5268 ) ( SURFACE-AT ?auto_5256 ?auto_5269 ) ( ON ?auto_5256 ?auto_5280 ) ( CLEAR ?auto_5256 ) ( not ( = ?auto_5255 ?auto_5256 ) ) ( not ( = ?auto_5255 ?auto_5280 ) ) ( not ( = ?auto_5256 ?auto_5280 ) ) ( not ( = ?auto_5266 ?auto_5268 ) ) ( IS-CRATE ?auto_5255 ) ( not ( = ?auto_5277 ?auto_5265 ) ) ( HOIST-AT ?auto_5281 ?auto_5277 ) ( AVAILABLE ?auto_5281 ) ( SURFACE-AT ?auto_5255 ?auto_5277 ) ( ON ?auto_5255 ?auto_5276 ) ( CLEAR ?auto_5255 ) ( not ( = ?auto_5254 ?auto_5255 ) ) ( not ( = ?auto_5254 ?auto_5276 ) ) ( not ( = ?auto_5255 ?auto_5276 ) ) ( not ( = ?auto_5266 ?auto_5281 ) ) ( IS-CRATE ?auto_5254 ) ( not ( = ?auto_5284 ?auto_5265 ) ) ( HOIST-AT ?auto_5273 ?auto_5284 ) ( AVAILABLE ?auto_5273 ) ( SURFACE-AT ?auto_5254 ?auto_5284 ) ( ON ?auto_5254 ?auto_5271 ) ( CLEAR ?auto_5254 ) ( not ( = ?auto_5253 ?auto_5254 ) ) ( not ( = ?auto_5253 ?auto_5271 ) ) ( not ( = ?auto_5254 ?auto_5271 ) ) ( not ( = ?auto_5266 ?auto_5273 ) ) ( SURFACE-AT ?auto_5252 ?auto_5265 ) ( CLEAR ?auto_5252 ) ( IS-CRATE ?auto_5253 ) ( AVAILABLE ?auto_5266 ) ( not ( = ?auto_5286 ?auto_5265 ) ) ( HOIST-AT ?auto_5275 ?auto_5286 ) ( AVAILABLE ?auto_5275 ) ( SURFACE-AT ?auto_5253 ?auto_5286 ) ( ON ?auto_5253 ?auto_5274 ) ( CLEAR ?auto_5253 ) ( TRUCK-AT ?auto_5262 ?auto_5265 ) ( not ( = ?auto_5252 ?auto_5253 ) ) ( not ( = ?auto_5252 ?auto_5274 ) ) ( not ( = ?auto_5253 ?auto_5274 ) ) ( not ( = ?auto_5266 ?auto_5275 ) ) ( not ( = ?auto_5252 ?auto_5254 ) ) ( not ( = ?auto_5252 ?auto_5271 ) ) ( not ( = ?auto_5254 ?auto_5274 ) ) ( not ( = ?auto_5284 ?auto_5286 ) ) ( not ( = ?auto_5273 ?auto_5275 ) ) ( not ( = ?auto_5271 ?auto_5274 ) ) ( not ( = ?auto_5252 ?auto_5255 ) ) ( not ( = ?auto_5252 ?auto_5276 ) ) ( not ( = ?auto_5253 ?auto_5255 ) ) ( not ( = ?auto_5253 ?auto_5276 ) ) ( not ( = ?auto_5255 ?auto_5271 ) ) ( not ( = ?auto_5255 ?auto_5274 ) ) ( not ( = ?auto_5277 ?auto_5284 ) ) ( not ( = ?auto_5277 ?auto_5286 ) ) ( not ( = ?auto_5281 ?auto_5273 ) ) ( not ( = ?auto_5281 ?auto_5275 ) ) ( not ( = ?auto_5276 ?auto_5271 ) ) ( not ( = ?auto_5276 ?auto_5274 ) ) ( not ( = ?auto_5252 ?auto_5256 ) ) ( not ( = ?auto_5252 ?auto_5280 ) ) ( not ( = ?auto_5253 ?auto_5256 ) ) ( not ( = ?auto_5253 ?auto_5280 ) ) ( not ( = ?auto_5254 ?auto_5256 ) ) ( not ( = ?auto_5254 ?auto_5280 ) ) ( not ( = ?auto_5256 ?auto_5276 ) ) ( not ( = ?auto_5256 ?auto_5271 ) ) ( not ( = ?auto_5256 ?auto_5274 ) ) ( not ( = ?auto_5269 ?auto_5277 ) ) ( not ( = ?auto_5269 ?auto_5284 ) ) ( not ( = ?auto_5269 ?auto_5286 ) ) ( not ( = ?auto_5268 ?auto_5281 ) ) ( not ( = ?auto_5268 ?auto_5273 ) ) ( not ( = ?auto_5268 ?auto_5275 ) ) ( not ( = ?auto_5280 ?auto_5276 ) ) ( not ( = ?auto_5280 ?auto_5271 ) ) ( not ( = ?auto_5280 ?auto_5274 ) ) ( not ( = ?auto_5252 ?auto_5257 ) ) ( not ( = ?auto_5252 ?auto_5279 ) ) ( not ( = ?auto_5253 ?auto_5257 ) ) ( not ( = ?auto_5253 ?auto_5279 ) ) ( not ( = ?auto_5254 ?auto_5257 ) ) ( not ( = ?auto_5254 ?auto_5279 ) ) ( not ( = ?auto_5255 ?auto_5257 ) ) ( not ( = ?auto_5255 ?auto_5279 ) ) ( not ( = ?auto_5257 ?auto_5280 ) ) ( not ( = ?auto_5257 ?auto_5276 ) ) ( not ( = ?auto_5257 ?auto_5271 ) ) ( not ( = ?auto_5257 ?auto_5274 ) ) ( not ( = ?auto_5270 ?auto_5269 ) ) ( not ( = ?auto_5270 ?auto_5277 ) ) ( not ( = ?auto_5270 ?auto_5284 ) ) ( not ( = ?auto_5270 ?auto_5286 ) ) ( not ( = ?auto_5272 ?auto_5268 ) ) ( not ( = ?auto_5272 ?auto_5281 ) ) ( not ( = ?auto_5272 ?auto_5273 ) ) ( not ( = ?auto_5272 ?auto_5275 ) ) ( not ( = ?auto_5279 ?auto_5280 ) ) ( not ( = ?auto_5279 ?auto_5276 ) ) ( not ( = ?auto_5279 ?auto_5271 ) ) ( not ( = ?auto_5279 ?auto_5274 ) ) ( not ( = ?auto_5252 ?auto_5258 ) ) ( not ( = ?auto_5252 ?auto_5278 ) ) ( not ( = ?auto_5253 ?auto_5258 ) ) ( not ( = ?auto_5253 ?auto_5278 ) ) ( not ( = ?auto_5254 ?auto_5258 ) ) ( not ( = ?auto_5254 ?auto_5278 ) ) ( not ( = ?auto_5255 ?auto_5258 ) ) ( not ( = ?auto_5255 ?auto_5278 ) ) ( not ( = ?auto_5256 ?auto_5258 ) ) ( not ( = ?auto_5256 ?auto_5278 ) ) ( not ( = ?auto_5258 ?auto_5279 ) ) ( not ( = ?auto_5258 ?auto_5280 ) ) ( not ( = ?auto_5258 ?auto_5276 ) ) ( not ( = ?auto_5258 ?auto_5271 ) ) ( not ( = ?auto_5258 ?auto_5274 ) ) ( not ( = ?auto_5283 ?auto_5270 ) ) ( not ( = ?auto_5283 ?auto_5269 ) ) ( not ( = ?auto_5283 ?auto_5277 ) ) ( not ( = ?auto_5283 ?auto_5284 ) ) ( not ( = ?auto_5283 ?auto_5286 ) ) ( not ( = ?auto_5282 ?auto_5272 ) ) ( not ( = ?auto_5282 ?auto_5268 ) ) ( not ( = ?auto_5282 ?auto_5281 ) ) ( not ( = ?auto_5282 ?auto_5273 ) ) ( not ( = ?auto_5282 ?auto_5275 ) ) ( not ( = ?auto_5278 ?auto_5279 ) ) ( not ( = ?auto_5278 ?auto_5280 ) ) ( not ( = ?auto_5278 ?auto_5276 ) ) ( not ( = ?auto_5278 ?auto_5271 ) ) ( not ( = ?auto_5278 ?auto_5274 ) ) ( not ( = ?auto_5252 ?auto_5260 ) ) ( not ( = ?auto_5252 ?auto_5267 ) ) ( not ( = ?auto_5253 ?auto_5260 ) ) ( not ( = ?auto_5253 ?auto_5267 ) ) ( not ( = ?auto_5254 ?auto_5260 ) ) ( not ( = ?auto_5254 ?auto_5267 ) ) ( not ( = ?auto_5255 ?auto_5260 ) ) ( not ( = ?auto_5255 ?auto_5267 ) ) ( not ( = ?auto_5256 ?auto_5260 ) ) ( not ( = ?auto_5256 ?auto_5267 ) ) ( not ( = ?auto_5257 ?auto_5260 ) ) ( not ( = ?auto_5257 ?auto_5267 ) ) ( not ( = ?auto_5260 ?auto_5278 ) ) ( not ( = ?auto_5260 ?auto_5279 ) ) ( not ( = ?auto_5260 ?auto_5280 ) ) ( not ( = ?auto_5260 ?auto_5276 ) ) ( not ( = ?auto_5260 ?auto_5271 ) ) ( not ( = ?auto_5260 ?auto_5274 ) ) ( not ( = ?auto_5285 ?auto_5283 ) ) ( not ( = ?auto_5285 ?auto_5270 ) ) ( not ( = ?auto_5285 ?auto_5269 ) ) ( not ( = ?auto_5285 ?auto_5277 ) ) ( not ( = ?auto_5285 ?auto_5284 ) ) ( not ( = ?auto_5285 ?auto_5286 ) ) ( not ( = ?auto_5287 ?auto_5282 ) ) ( not ( = ?auto_5287 ?auto_5272 ) ) ( not ( = ?auto_5287 ?auto_5268 ) ) ( not ( = ?auto_5287 ?auto_5281 ) ) ( not ( = ?auto_5287 ?auto_5273 ) ) ( not ( = ?auto_5287 ?auto_5275 ) ) ( not ( = ?auto_5267 ?auto_5278 ) ) ( not ( = ?auto_5267 ?auto_5279 ) ) ( not ( = ?auto_5267 ?auto_5280 ) ) ( not ( = ?auto_5267 ?auto_5276 ) ) ( not ( = ?auto_5267 ?auto_5271 ) ) ( not ( = ?auto_5267 ?auto_5274 ) ) ( not ( = ?auto_5252 ?auto_5259 ) ) ( not ( = ?auto_5252 ?auto_5263 ) ) ( not ( = ?auto_5253 ?auto_5259 ) ) ( not ( = ?auto_5253 ?auto_5263 ) ) ( not ( = ?auto_5254 ?auto_5259 ) ) ( not ( = ?auto_5254 ?auto_5263 ) ) ( not ( = ?auto_5255 ?auto_5259 ) ) ( not ( = ?auto_5255 ?auto_5263 ) ) ( not ( = ?auto_5256 ?auto_5259 ) ) ( not ( = ?auto_5256 ?auto_5263 ) ) ( not ( = ?auto_5257 ?auto_5259 ) ) ( not ( = ?auto_5257 ?auto_5263 ) ) ( not ( = ?auto_5258 ?auto_5259 ) ) ( not ( = ?auto_5258 ?auto_5263 ) ) ( not ( = ?auto_5259 ?auto_5267 ) ) ( not ( = ?auto_5259 ?auto_5278 ) ) ( not ( = ?auto_5259 ?auto_5279 ) ) ( not ( = ?auto_5259 ?auto_5280 ) ) ( not ( = ?auto_5259 ?auto_5276 ) ) ( not ( = ?auto_5259 ?auto_5271 ) ) ( not ( = ?auto_5259 ?auto_5274 ) ) ( not ( = ?auto_5261 ?auto_5285 ) ) ( not ( = ?auto_5261 ?auto_5283 ) ) ( not ( = ?auto_5261 ?auto_5270 ) ) ( not ( = ?auto_5261 ?auto_5269 ) ) ( not ( = ?auto_5261 ?auto_5277 ) ) ( not ( = ?auto_5261 ?auto_5284 ) ) ( not ( = ?auto_5261 ?auto_5286 ) ) ( not ( = ?auto_5264 ?auto_5287 ) ) ( not ( = ?auto_5264 ?auto_5282 ) ) ( not ( = ?auto_5264 ?auto_5272 ) ) ( not ( = ?auto_5264 ?auto_5268 ) ) ( not ( = ?auto_5264 ?auto_5281 ) ) ( not ( = ?auto_5264 ?auto_5273 ) ) ( not ( = ?auto_5264 ?auto_5275 ) ) ( not ( = ?auto_5263 ?auto_5267 ) ) ( not ( = ?auto_5263 ?auto_5278 ) ) ( not ( = ?auto_5263 ?auto_5279 ) ) ( not ( = ?auto_5263 ?auto_5280 ) ) ( not ( = ?auto_5263 ?auto_5276 ) ) ( not ( = ?auto_5263 ?auto_5271 ) ) ( not ( = ?auto_5263 ?auto_5274 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5252 ?auto_5253 ?auto_5254 ?auto_5255 ?auto_5256 ?auto_5257 ?auto_5258 ?auto_5260 )
      ( MAKE-1CRATE ?auto_5260 ?auto_5259 )
      ( MAKE-8CRATE-VERIFY ?auto_5252 ?auto_5253 ?auto_5254 ?auto_5255 ?auto_5256 ?auto_5257 ?auto_5258 ?auto_5260 ?auto_5259 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5290 - SURFACE
      ?auto_5291 - SURFACE
    )
    :vars
    (
      ?auto_5292 - HOIST
      ?auto_5293 - PLACE
      ?auto_5295 - PLACE
      ?auto_5296 - HOIST
      ?auto_5297 - SURFACE
      ?auto_5294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5292 ?auto_5293 ) ( SURFACE-AT ?auto_5290 ?auto_5293 ) ( CLEAR ?auto_5290 ) ( IS-CRATE ?auto_5291 ) ( AVAILABLE ?auto_5292 ) ( not ( = ?auto_5295 ?auto_5293 ) ) ( HOIST-AT ?auto_5296 ?auto_5295 ) ( AVAILABLE ?auto_5296 ) ( SURFACE-AT ?auto_5291 ?auto_5295 ) ( ON ?auto_5291 ?auto_5297 ) ( CLEAR ?auto_5291 ) ( TRUCK-AT ?auto_5294 ?auto_5293 ) ( not ( = ?auto_5290 ?auto_5291 ) ) ( not ( = ?auto_5290 ?auto_5297 ) ) ( not ( = ?auto_5291 ?auto_5297 ) ) ( not ( = ?auto_5292 ?auto_5296 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5294 ?auto_5293 ?auto_5295 )
      ( !LIFT ?auto_5296 ?auto_5291 ?auto_5297 ?auto_5295 )
      ( !LOAD ?auto_5296 ?auto_5291 ?auto_5294 ?auto_5295 )
      ( !DRIVE ?auto_5294 ?auto_5295 ?auto_5293 )
      ( !UNLOAD ?auto_5292 ?auto_5291 ?auto_5294 ?auto_5293 )
      ( !DROP ?auto_5292 ?auto_5291 ?auto_5290 ?auto_5293 )
      ( MAKE-1CRATE-VERIFY ?auto_5290 ?auto_5291 ) )
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
      ?auto_5317 - SURFACE
      ?auto_5316 - SURFACE
      ?auto_5315 - SURFACE
    )
    :vars
    (
      ?auto_5322 - HOIST
      ?auto_5321 - PLACE
      ?auto_5320 - PLACE
      ?auto_5323 - HOIST
      ?auto_5319 - SURFACE
      ?auto_5344 - PLACE
      ?auto_5343 - HOIST
      ?auto_5326 - SURFACE
      ?auto_5330 - PLACE
      ?auto_5331 - HOIST
      ?auto_5325 - SURFACE
      ?auto_5329 - PLACE
      ?auto_5333 - HOIST
      ?auto_5337 - SURFACE
      ?auto_5327 - PLACE
      ?auto_5341 - HOIST
      ?auto_5338 - SURFACE
      ?auto_5328 - PLACE
      ?auto_5324 - HOIST
      ?auto_5339 - SURFACE
      ?auto_5335 - PLACE
      ?auto_5345 - HOIST
      ?auto_5336 - SURFACE
      ?auto_5342 - SURFACE
      ?auto_5332 - PLACE
      ?auto_5334 - HOIST
      ?auto_5340 - SURFACE
      ?auto_5318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5322 ?auto_5321 ) ( IS-CRATE ?auto_5315 ) ( not ( = ?auto_5320 ?auto_5321 ) ) ( HOIST-AT ?auto_5323 ?auto_5320 ) ( SURFACE-AT ?auto_5315 ?auto_5320 ) ( ON ?auto_5315 ?auto_5319 ) ( CLEAR ?auto_5315 ) ( not ( = ?auto_5316 ?auto_5315 ) ) ( not ( = ?auto_5316 ?auto_5319 ) ) ( not ( = ?auto_5315 ?auto_5319 ) ) ( not ( = ?auto_5322 ?auto_5323 ) ) ( IS-CRATE ?auto_5316 ) ( not ( = ?auto_5344 ?auto_5321 ) ) ( HOIST-AT ?auto_5343 ?auto_5344 ) ( AVAILABLE ?auto_5343 ) ( SURFACE-AT ?auto_5316 ?auto_5344 ) ( ON ?auto_5316 ?auto_5326 ) ( CLEAR ?auto_5316 ) ( not ( = ?auto_5317 ?auto_5316 ) ) ( not ( = ?auto_5317 ?auto_5326 ) ) ( not ( = ?auto_5316 ?auto_5326 ) ) ( not ( = ?auto_5322 ?auto_5343 ) ) ( IS-CRATE ?auto_5317 ) ( not ( = ?auto_5330 ?auto_5321 ) ) ( HOIST-AT ?auto_5331 ?auto_5330 ) ( AVAILABLE ?auto_5331 ) ( SURFACE-AT ?auto_5317 ?auto_5330 ) ( ON ?auto_5317 ?auto_5325 ) ( CLEAR ?auto_5317 ) ( not ( = ?auto_5314 ?auto_5317 ) ) ( not ( = ?auto_5314 ?auto_5325 ) ) ( not ( = ?auto_5317 ?auto_5325 ) ) ( not ( = ?auto_5322 ?auto_5331 ) ) ( IS-CRATE ?auto_5314 ) ( not ( = ?auto_5329 ?auto_5321 ) ) ( HOIST-AT ?auto_5333 ?auto_5329 ) ( AVAILABLE ?auto_5333 ) ( SURFACE-AT ?auto_5314 ?auto_5329 ) ( ON ?auto_5314 ?auto_5337 ) ( CLEAR ?auto_5314 ) ( not ( = ?auto_5313 ?auto_5314 ) ) ( not ( = ?auto_5313 ?auto_5337 ) ) ( not ( = ?auto_5314 ?auto_5337 ) ) ( not ( = ?auto_5322 ?auto_5333 ) ) ( IS-CRATE ?auto_5313 ) ( not ( = ?auto_5327 ?auto_5321 ) ) ( HOIST-AT ?auto_5341 ?auto_5327 ) ( AVAILABLE ?auto_5341 ) ( SURFACE-AT ?auto_5313 ?auto_5327 ) ( ON ?auto_5313 ?auto_5338 ) ( CLEAR ?auto_5313 ) ( not ( = ?auto_5312 ?auto_5313 ) ) ( not ( = ?auto_5312 ?auto_5338 ) ) ( not ( = ?auto_5313 ?auto_5338 ) ) ( not ( = ?auto_5322 ?auto_5341 ) ) ( IS-CRATE ?auto_5312 ) ( not ( = ?auto_5328 ?auto_5321 ) ) ( HOIST-AT ?auto_5324 ?auto_5328 ) ( AVAILABLE ?auto_5324 ) ( SURFACE-AT ?auto_5312 ?auto_5328 ) ( ON ?auto_5312 ?auto_5339 ) ( CLEAR ?auto_5312 ) ( not ( = ?auto_5311 ?auto_5312 ) ) ( not ( = ?auto_5311 ?auto_5339 ) ) ( not ( = ?auto_5312 ?auto_5339 ) ) ( not ( = ?auto_5322 ?auto_5324 ) ) ( IS-CRATE ?auto_5311 ) ( not ( = ?auto_5335 ?auto_5321 ) ) ( HOIST-AT ?auto_5345 ?auto_5335 ) ( AVAILABLE ?auto_5345 ) ( SURFACE-AT ?auto_5311 ?auto_5335 ) ( ON ?auto_5311 ?auto_5336 ) ( CLEAR ?auto_5311 ) ( not ( = ?auto_5310 ?auto_5311 ) ) ( not ( = ?auto_5310 ?auto_5336 ) ) ( not ( = ?auto_5311 ?auto_5336 ) ) ( not ( = ?auto_5322 ?auto_5345 ) ) ( IS-CRATE ?auto_5310 ) ( AVAILABLE ?auto_5323 ) ( SURFACE-AT ?auto_5310 ?auto_5320 ) ( ON ?auto_5310 ?auto_5342 ) ( CLEAR ?auto_5310 ) ( not ( = ?auto_5309 ?auto_5310 ) ) ( not ( = ?auto_5309 ?auto_5342 ) ) ( not ( = ?auto_5310 ?auto_5342 ) ) ( SURFACE-AT ?auto_5308 ?auto_5321 ) ( CLEAR ?auto_5308 ) ( IS-CRATE ?auto_5309 ) ( AVAILABLE ?auto_5322 ) ( not ( = ?auto_5332 ?auto_5321 ) ) ( HOIST-AT ?auto_5334 ?auto_5332 ) ( AVAILABLE ?auto_5334 ) ( SURFACE-AT ?auto_5309 ?auto_5332 ) ( ON ?auto_5309 ?auto_5340 ) ( CLEAR ?auto_5309 ) ( TRUCK-AT ?auto_5318 ?auto_5321 ) ( not ( = ?auto_5308 ?auto_5309 ) ) ( not ( = ?auto_5308 ?auto_5340 ) ) ( not ( = ?auto_5309 ?auto_5340 ) ) ( not ( = ?auto_5322 ?auto_5334 ) ) ( not ( = ?auto_5308 ?auto_5310 ) ) ( not ( = ?auto_5308 ?auto_5342 ) ) ( not ( = ?auto_5310 ?auto_5340 ) ) ( not ( = ?auto_5320 ?auto_5332 ) ) ( not ( = ?auto_5323 ?auto_5334 ) ) ( not ( = ?auto_5342 ?auto_5340 ) ) ( not ( = ?auto_5308 ?auto_5311 ) ) ( not ( = ?auto_5308 ?auto_5336 ) ) ( not ( = ?auto_5309 ?auto_5311 ) ) ( not ( = ?auto_5309 ?auto_5336 ) ) ( not ( = ?auto_5311 ?auto_5342 ) ) ( not ( = ?auto_5311 ?auto_5340 ) ) ( not ( = ?auto_5335 ?auto_5320 ) ) ( not ( = ?auto_5335 ?auto_5332 ) ) ( not ( = ?auto_5345 ?auto_5323 ) ) ( not ( = ?auto_5345 ?auto_5334 ) ) ( not ( = ?auto_5336 ?auto_5342 ) ) ( not ( = ?auto_5336 ?auto_5340 ) ) ( not ( = ?auto_5308 ?auto_5312 ) ) ( not ( = ?auto_5308 ?auto_5339 ) ) ( not ( = ?auto_5309 ?auto_5312 ) ) ( not ( = ?auto_5309 ?auto_5339 ) ) ( not ( = ?auto_5310 ?auto_5312 ) ) ( not ( = ?auto_5310 ?auto_5339 ) ) ( not ( = ?auto_5312 ?auto_5336 ) ) ( not ( = ?auto_5312 ?auto_5342 ) ) ( not ( = ?auto_5312 ?auto_5340 ) ) ( not ( = ?auto_5328 ?auto_5335 ) ) ( not ( = ?auto_5328 ?auto_5320 ) ) ( not ( = ?auto_5328 ?auto_5332 ) ) ( not ( = ?auto_5324 ?auto_5345 ) ) ( not ( = ?auto_5324 ?auto_5323 ) ) ( not ( = ?auto_5324 ?auto_5334 ) ) ( not ( = ?auto_5339 ?auto_5336 ) ) ( not ( = ?auto_5339 ?auto_5342 ) ) ( not ( = ?auto_5339 ?auto_5340 ) ) ( not ( = ?auto_5308 ?auto_5313 ) ) ( not ( = ?auto_5308 ?auto_5338 ) ) ( not ( = ?auto_5309 ?auto_5313 ) ) ( not ( = ?auto_5309 ?auto_5338 ) ) ( not ( = ?auto_5310 ?auto_5313 ) ) ( not ( = ?auto_5310 ?auto_5338 ) ) ( not ( = ?auto_5311 ?auto_5313 ) ) ( not ( = ?auto_5311 ?auto_5338 ) ) ( not ( = ?auto_5313 ?auto_5339 ) ) ( not ( = ?auto_5313 ?auto_5336 ) ) ( not ( = ?auto_5313 ?auto_5342 ) ) ( not ( = ?auto_5313 ?auto_5340 ) ) ( not ( = ?auto_5327 ?auto_5328 ) ) ( not ( = ?auto_5327 ?auto_5335 ) ) ( not ( = ?auto_5327 ?auto_5320 ) ) ( not ( = ?auto_5327 ?auto_5332 ) ) ( not ( = ?auto_5341 ?auto_5324 ) ) ( not ( = ?auto_5341 ?auto_5345 ) ) ( not ( = ?auto_5341 ?auto_5323 ) ) ( not ( = ?auto_5341 ?auto_5334 ) ) ( not ( = ?auto_5338 ?auto_5339 ) ) ( not ( = ?auto_5338 ?auto_5336 ) ) ( not ( = ?auto_5338 ?auto_5342 ) ) ( not ( = ?auto_5338 ?auto_5340 ) ) ( not ( = ?auto_5308 ?auto_5314 ) ) ( not ( = ?auto_5308 ?auto_5337 ) ) ( not ( = ?auto_5309 ?auto_5314 ) ) ( not ( = ?auto_5309 ?auto_5337 ) ) ( not ( = ?auto_5310 ?auto_5314 ) ) ( not ( = ?auto_5310 ?auto_5337 ) ) ( not ( = ?auto_5311 ?auto_5314 ) ) ( not ( = ?auto_5311 ?auto_5337 ) ) ( not ( = ?auto_5312 ?auto_5314 ) ) ( not ( = ?auto_5312 ?auto_5337 ) ) ( not ( = ?auto_5314 ?auto_5338 ) ) ( not ( = ?auto_5314 ?auto_5339 ) ) ( not ( = ?auto_5314 ?auto_5336 ) ) ( not ( = ?auto_5314 ?auto_5342 ) ) ( not ( = ?auto_5314 ?auto_5340 ) ) ( not ( = ?auto_5329 ?auto_5327 ) ) ( not ( = ?auto_5329 ?auto_5328 ) ) ( not ( = ?auto_5329 ?auto_5335 ) ) ( not ( = ?auto_5329 ?auto_5320 ) ) ( not ( = ?auto_5329 ?auto_5332 ) ) ( not ( = ?auto_5333 ?auto_5341 ) ) ( not ( = ?auto_5333 ?auto_5324 ) ) ( not ( = ?auto_5333 ?auto_5345 ) ) ( not ( = ?auto_5333 ?auto_5323 ) ) ( not ( = ?auto_5333 ?auto_5334 ) ) ( not ( = ?auto_5337 ?auto_5338 ) ) ( not ( = ?auto_5337 ?auto_5339 ) ) ( not ( = ?auto_5337 ?auto_5336 ) ) ( not ( = ?auto_5337 ?auto_5342 ) ) ( not ( = ?auto_5337 ?auto_5340 ) ) ( not ( = ?auto_5308 ?auto_5317 ) ) ( not ( = ?auto_5308 ?auto_5325 ) ) ( not ( = ?auto_5309 ?auto_5317 ) ) ( not ( = ?auto_5309 ?auto_5325 ) ) ( not ( = ?auto_5310 ?auto_5317 ) ) ( not ( = ?auto_5310 ?auto_5325 ) ) ( not ( = ?auto_5311 ?auto_5317 ) ) ( not ( = ?auto_5311 ?auto_5325 ) ) ( not ( = ?auto_5312 ?auto_5317 ) ) ( not ( = ?auto_5312 ?auto_5325 ) ) ( not ( = ?auto_5313 ?auto_5317 ) ) ( not ( = ?auto_5313 ?auto_5325 ) ) ( not ( = ?auto_5317 ?auto_5337 ) ) ( not ( = ?auto_5317 ?auto_5338 ) ) ( not ( = ?auto_5317 ?auto_5339 ) ) ( not ( = ?auto_5317 ?auto_5336 ) ) ( not ( = ?auto_5317 ?auto_5342 ) ) ( not ( = ?auto_5317 ?auto_5340 ) ) ( not ( = ?auto_5330 ?auto_5329 ) ) ( not ( = ?auto_5330 ?auto_5327 ) ) ( not ( = ?auto_5330 ?auto_5328 ) ) ( not ( = ?auto_5330 ?auto_5335 ) ) ( not ( = ?auto_5330 ?auto_5320 ) ) ( not ( = ?auto_5330 ?auto_5332 ) ) ( not ( = ?auto_5331 ?auto_5333 ) ) ( not ( = ?auto_5331 ?auto_5341 ) ) ( not ( = ?auto_5331 ?auto_5324 ) ) ( not ( = ?auto_5331 ?auto_5345 ) ) ( not ( = ?auto_5331 ?auto_5323 ) ) ( not ( = ?auto_5331 ?auto_5334 ) ) ( not ( = ?auto_5325 ?auto_5337 ) ) ( not ( = ?auto_5325 ?auto_5338 ) ) ( not ( = ?auto_5325 ?auto_5339 ) ) ( not ( = ?auto_5325 ?auto_5336 ) ) ( not ( = ?auto_5325 ?auto_5342 ) ) ( not ( = ?auto_5325 ?auto_5340 ) ) ( not ( = ?auto_5308 ?auto_5316 ) ) ( not ( = ?auto_5308 ?auto_5326 ) ) ( not ( = ?auto_5309 ?auto_5316 ) ) ( not ( = ?auto_5309 ?auto_5326 ) ) ( not ( = ?auto_5310 ?auto_5316 ) ) ( not ( = ?auto_5310 ?auto_5326 ) ) ( not ( = ?auto_5311 ?auto_5316 ) ) ( not ( = ?auto_5311 ?auto_5326 ) ) ( not ( = ?auto_5312 ?auto_5316 ) ) ( not ( = ?auto_5312 ?auto_5326 ) ) ( not ( = ?auto_5313 ?auto_5316 ) ) ( not ( = ?auto_5313 ?auto_5326 ) ) ( not ( = ?auto_5314 ?auto_5316 ) ) ( not ( = ?auto_5314 ?auto_5326 ) ) ( not ( = ?auto_5316 ?auto_5325 ) ) ( not ( = ?auto_5316 ?auto_5337 ) ) ( not ( = ?auto_5316 ?auto_5338 ) ) ( not ( = ?auto_5316 ?auto_5339 ) ) ( not ( = ?auto_5316 ?auto_5336 ) ) ( not ( = ?auto_5316 ?auto_5342 ) ) ( not ( = ?auto_5316 ?auto_5340 ) ) ( not ( = ?auto_5344 ?auto_5330 ) ) ( not ( = ?auto_5344 ?auto_5329 ) ) ( not ( = ?auto_5344 ?auto_5327 ) ) ( not ( = ?auto_5344 ?auto_5328 ) ) ( not ( = ?auto_5344 ?auto_5335 ) ) ( not ( = ?auto_5344 ?auto_5320 ) ) ( not ( = ?auto_5344 ?auto_5332 ) ) ( not ( = ?auto_5343 ?auto_5331 ) ) ( not ( = ?auto_5343 ?auto_5333 ) ) ( not ( = ?auto_5343 ?auto_5341 ) ) ( not ( = ?auto_5343 ?auto_5324 ) ) ( not ( = ?auto_5343 ?auto_5345 ) ) ( not ( = ?auto_5343 ?auto_5323 ) ) ( not ( = ?auto_5343 ?auto_5334 ) ) ( not ( = ?auto_5326 ?auto_5325 ) ) ( not ( = ?auto_5326 ?auto_5337 ) ) ( not ( = ?auto_5326 ?auto_5338 ) ) ( not ( = ?auto_5326 ?auto_5339 ) ) ( not ( = ?auto_5326 ?auto_5336 ) ) ( not ( = ?auto_5326 ?auto_5342 ) ) ( not ( = ?auto_5326 ?auto_5340 ) ) ( not ( = ?auto_5308 ?auto_5315 ) ) ( not ( = ?auto_5308 ?auto_5319 ) ) ( not ( = ?auto_5309 ?auto_5315 ) ) ( not ( = ?auto_5309 ?auto_5319 ) ) ( not ( = ?auto_5310 ?auto_5315 ) ) ( not ( = ?auto_5310 ?auto_5319 ) ) ( not ( = ?auto_5311 ?auto_5315 ) ) ( not ( = ?auto_5311 ?auto_5319 ) ) ( not ( = ?auto_5312 ?auto_5315 ) ) ( not ( = ?auto_5312 ?auto_5319 ) ) ( not ( = ?auto_5313 ?auto_5315 ) ) ( not ( = ?auto_5313 ?auto_5319 ) ) ( not ( = ?auto_5314 ?auto_5315 ) ) ( not ( = ?auto_5314 ?auto_5319 ) ) ( not ( = ?auto_5317 ?auto_5315 ) ) ( not ( = ?auto_5317 ?auto_5319 ) ) ( not ( = ?auto_5315 ?auto_5326 ) ) ( not ( = ?auto_5315 ?auto_5325 ) ) ( not ( = ?auto_5315 ?auto_5337 ) ) ( not ( = ?auto_5315 ?auto_5338 ) ) ( not ( = ?auto_5315 ?auto_5339 ) ) ( not ( = ?auto_5315 ?auto_5336 ) ) ( not ( = ?auto_5315 ?auto_5342 ) ) ( not ( = ?auto_5315 ?auto_5340 ) ) ( not ( = ?auto_5319 ?auto_5326 ) ) ( not ( = ?auto_5319 ?auto_5325 ) ) ( not ( = ?auto_5319 ?auto_5337 ) ) ( not ( = ?auto_5319 ?auto_5338 ) ) ( not ( = ?auto_5319 ?auto_5339 ) ) ( not ( = ?auto_5319 ?auto_5336 ) ) ( not ( = ?auto_5319 ?auto_5342 ) ) ( not ( = ?auto_5319 ?auto_5340 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5308 ?auto_5309 ?auto_5310 ?auto_5311 ?auto_5312 ?auto_5313 ?auto_5314 ?auto_5317 ?auto_5316 )
      ( MAKE-1CRATE ?auto_5316 ?auto_5315 )
      ( MAKE-9CRATE-VERIFY ?auto_5308 ?auto_5309 ?auto_5310 ?auto_5311 ?auto_5312 ?auto_5313 ?auto_5314 ?auto_5317 ?auto_5316 ?auto_5315 ) )
  )

)

