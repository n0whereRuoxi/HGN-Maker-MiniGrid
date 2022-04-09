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
      ?auto_5028 - SURFACE
      ?auto_5029 - SURFACE
    )
    :vars
    (
      ?auto_5030 - HOIST
      ?auto_5031 - PLACE
      ?auto_5033 - PLACE
      ?auto_5034 - HOIST
      ?auto_5035 - SURFACE
      ?auto_5032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5030 ?auto_5031 ) ( SURFACE-AT ?auto_5028 ?auto_5031 ) ( CLEAR ?auto_5028 ) ( IS-CRATE ?auto_5029 ) ( AVAILABLE ?auto_5030 ) ( not ( = ?auto_5033 ?auto_5031 ) ) ( HOIST-AT ?auto_5034 ?auto_5033 ) ( AVAILABLE ?auto_5034 ) ( SURFACE-AT ?auto_5029 ?auto_5033 ) ( ON ?auto_5029 ?auto_5035 ) ( CLEAR ?auto_5029 ) ( TRUCK-AT ?auto_5032 ?auto_5031 ) ( not ( = ?auto_5028 ?auto_5029 ) ) ( not ( = ?auto_5028 ?auto_5035 ) ) ( not ( = ?auto_5029 ?auto_5035 ) ) ( not ( = ?auto_5030 ?auto_5034 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5032 ?auto_5031 ?auto_5033 )
      ( !LIFT ?auto_5034 ?auto_5029 ?auto_5035 ?auto_5033 )
      ( !LOAD ?auto_5034 ?auto_5029 ?auto_5032 ?auto_5033 )
      ( !DRIVE ?auto_5032 ?auto_5033 ?auto_5031 )
      ( !UNLOAD ?auto_5030 ?auto_5029 ?auto_5032 ?auto_5031 )
      ( !DROP ?auto_5030 ?auto_5029 ?auto_5028 ?auto_5031 )
      ( MAKE-1CRATE-VERIFY ?auto_5028 ?auto_5029 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5038 - SURFACE
      ?auto_5039 - SURFACE
    )
    :vars
    (
      ?auto_5040 - HOIST
      ?auto_5041 - PLACE
      ?auto_5043 - PLACE
      ?auto_5044 - HOIST
      ?auto_5045 - SURFACE
      ?auto_5042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5040 ?auto_5041 ) ( SURFACE-AT ?auto_5038 ?auto_5041 ) ( CLEAR ?auto_5038 ) ( IS-CRATE ?auto_5039 ) ( AVAILABLE ?auto_5040 ) ( not ( = ?auto_5043 ?auto_5041 ) ) ( HOIST-AT ?auto_5044 ?auto_5043 ) ( AVAILABLE ?auto_5044 ) ( SURFACE-AT ?auto_5039 ?auto_5043 ) ( ON ?auto_5039 ?auto_5045 ) ( CLEAR ?auto_5039 ) ( TRUCK-AT ?auto_5042 ?auto_5041 ) ( not ( = ?auto_5038 ?auto_5039 ) ) ( not ( = ?auto_5038 ?auto_5045 ) ) ( not ( = ?auto_5039 ?auto_5045 ) ) ( not ( = ?auto_5040 ?auto_5044 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5042 ?auto_5041 ?auto_5043 )
      ( !LIFT ?auto_5044 ?auto_5039 ?auto_5045 ?auto_5043 )
      ( !LOAD ?auto_5044 ?auto_5039 ?auto_5042 ?auto_5043 )
      ( !DRIVE ?auto_5042 ?auto_5043 ?auto_5041 )
      ( !UNLOAD ?auto_5040 ?auto_5039 ?auto_5042 ?auto_5041 )
      ( !DROP ?auto_5040 ?auto_5039 ?auto_5038 ?auto_5041 )
      ( MAKE-1CRATE-VERIFY ?auto_5038 ?auto_5039 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5049 - SURFACE
      ?auto_5050 - SURFACE
      ?auto_5051 - SURFACE
    )
    :vars
    (
      ?auto_5053 - HOIST
      ?auto_5056 - PLACE
      ?auto_5052 - PLACE
      ?auto_5055 - HOIST
      ?auto_5057 - SURFACE
      ?auto_5058 - PLACE
      ?auto_5060 - HOIST
      ?auto_5059 - SURFACE
      ?auto_5054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5053 ?auto_5056 ) ( IS-CRATE ?auto_5051 ) ( not ( = ?auto_5052 ?auto_5056 ) ) ( HOIST-AT ?auto_5055 ?auto_5052 ) ( AVAILABLE ?auto_5055 ) ( SURFACE-AT ?auto_5051 ?auto_5052 ) ( ON ?auto_5051 ?auto_5057 ) ( CLEAR ?auto_5051 ) ( not ( = ?auto_5050 ?auto_5051 ) ) ( not ( = ?auto_5050 ?auto_5057 ) ) ( not ( = ?auto_5051 ?auto_5057 ) ) ( not ( = ?auto_5053 ?auto_5055 ) ) ( SURFACE-AT ?auto_5049 ?auto_5056 ) ( CLEAR ?auto_5049 ) ( IS-CRATE ?auto_5050 ) ( AVAILABLE ?auto_5053 ) ( not ( = ?auto_5058 ?auto_5056 ) ) ( HOIST-AT ?auto_5060 ?auto_5058 ) ( AVAILABLE ?auto_5060 ) ( SURFACE-AT ?auto_5050 ?auto_5058 ) ( ON ?auto_5050 ?auto_5059 ) ( CLEAR ?auto_5050 ) ( TRUCK-AT ?auto_5054 ?auto_5056 ) ( not ( = ?auto_5049 ?auto_5050 ) ) ( not ( = ?auto_5049 ?auto_5059 ) ) ( not ( = ?auto_5050 ?auto_5059 ) ) ( not ( = ?auto_5053 ?auto_5060 ) ) ( not ( = ?auto_5049 ?auto_5051 ) ) ( not ( = ?auto_5049 ?auto_5057 ) ) ( not ( = ?auto_5051 ?auto_5059 ) ) ( not ( = ?auto_5052 ?auto_5058 ) ) ( not ( = ?auto_5055 ?auto_5060 ) ) ( not ( = ?auto_5057 ?auto_5059 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5049 ?auto_5050 )
      ( MAKE-1CRATE ?auto_5050 ?auto_5051 )
      ( MAKE-2CRATE-VERIFY ?auto_5049 ?auto_5050 ?auto_5051 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5063 - SURFACE
      ?auto_5064 - SURFACE
    )
    :vars
    (
      ?auto_5065 - HOIST
      ?auto_5066 - PLACE
      ?auto_5068 - PLACE
      ?auto_5069 - HOIST
      ?auto_5070 - SURFACE
      ?auto_5067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5065 ?auto_5066 ) ( SURFACE-AT ?auto_5063 ?auto_5066 ) ( CLEAR ?auto_5063 ) ( IS-CRATE ?auto_5064 ) ( AVAILABLE ?auto_5065 ) ( not ( = ?auto_5068 ?auto_5066 ) ) ( HOIST-AT ?auto_5069 ?auto_5068 ) ( AVAILABLE ?auto_5069 ) ( SURFACE-AT ?auto_5064 ?auto_5068 ) ( ON ?auto_5064 ?auto_5070 ) ( CLEAR ?auto_5064 ) ( TRUCK-AT ?auto_5067 ?auto_5066 ) ( not ( = ?auto_5063 ?auto_5064 ) ) ( not ( = ?auto_5063 ?auto_5070 ) ) ( not ( = ?auto_5064 ?auto_5070 ) ) ( not ( = ?auto_5065 ?auto_5069 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5067 ?auto_5066 ?auto_5068 )
      ( !LIFT ?auto_5069 ?auto_5064 ?auto_5070 ?auto_5068 )
      ( !LOAD ?auto_5069 ?auto_5064 ?auto_5067 ?auto_5068 )
      ( !DRIVE ?auto_5067 ?auto_5068 ?auto_5066 )
      ( !UNLOAD ?auto_5065 ?auto_5064 ?auto_5067 ?auto_5066 )
      ( !DROP ?auto_5065 ?auto_5064 ?auto_5063 ?auto_5066 )
      ( MAKE-1CRATE-VERIFY ?auto_5063 ?auto_5064 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5075 - SURFACE
      ?auto_5076 - SURFACE
      ?auto_5077 - SURFACE
      ?auto_5078 - SURFACE
    )
    :vars
    (
      ?auto_5084 - HOIST
      ?auto_5081 - PLACE
      ?auto_5082 - PLACE
      ?auto_5079 - HOIST
      ?auto_5080 - SURFACE
      ?auto_5087 - PLACE
      ?auto_5086 - HOIST
      ?auto_5085 - SURFACE
      ?auto_5088 - SURFACE
      ?auto_5083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5084 ?auto_5081 ) ( IS-CRATE ?auto_5078 ) ( not ( = ?auto_5082 ?auto_5081 ) ) ( HOIST-AT ?auto_5079 ?auto_5082 ) ( SURFACE-AT ?auto_5078 ?auto_5082 ) ( ON ?auto_5078 ?auto_5080 ) ( CLEAR ?auto_5078 ) ( not ( = ?auto_5077 ?auto_5078 ) ) ( not ( = ?auto_5077 ?auto_5080 ) ) ( not ( = ?auto_5078 ?auto_5080 ) ) ( not ( = ?auto_5084 ?auto_5079 ) ) ( IS-CRATE ?auto_5077 ) ( not ( = ?auto_5087 ?auto_5081 ) ) ( HOIST-AT ?auto_5086 ?auto_5087 ) ( AVAILABLE ?auto_5086 ) ( SURFACE-AT ?auto_5077 ?auto_5087 ) ( ON ?auto_5077 ?auto_5085 ) ( CLEAR ?auto_5077 ) ( not ( = ?auto_5076 ?auto_5077 ) ) ( not ( = ?auto_5076 ?auto_5085 ) ) ( not ( = ?auto_5077 ?auto_5085 ) ) ( not ( = ?auto_5084 ?auto_5086 ) ) ( SURFACE-AT ?auto_5075 ?auto_5081 ) ( CLEAR ?auto_5075 ) ( IS-CRATE ?auto_5076 ) ( AVAILABLE ?auto_5084 ) ( AVAILABLE ?auto_5079 ) ( SURFACE-AT ?auto_5076 ?auto_5082 ) ( ON ?auto_5076 ?auto_5088 ) ( CLEAR ?auto_5076 ) ( TRUCK-AT ?auto_5083 ?auto_5081 ) ( not ( = ?auto_5075 ?auto_5076 ) ) ( not ( = ?auto_5075 ?auto_5088 ) ) ( not ( = ?auto_5076 ?auto_5088 ) ) ( not ( = ?auto_5075 ?auto_5077 ) ) ( not ( = ?auto_5075 ?auto_5085 ) ) ( not ( = ?auto_5077 ?auto_5088 ) ) ( not ( = ?auto_5087 ?auto_5082 ) ) ( not ( = ?auto_5086 ?auto_5079 ) ) ( not ( = ?auto_5085 ?auto_5088 ) ) ( not ( = ?auto_5075 ?auto_5078 ) ) ( not ( = ?auto_5075 ?auto_5080 ) ) ( not ( = ?auto_5076 ?auto_5078 ) ) ( not ( = ?auto_5076 ?auto_5080 ) ) ( not ( = ?auto_5078 ?auto_5085 ) ) ( not ( = ?auto_5078 ?auto_5088 ) ) ( not ( = ?auto_5080 ?auto_5085 ) ) ( not ( = ?auto_5080 ?auto_5088 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5075 ?auto_5076 ?auto_5077 )
      ( MAKE-1CRATE ?auto_5077 ?auto_5078 )
      ( MAKE-3CRATE-VERIFY ?auto_5075 ?auto_5076 ?auto_5077 ?auto_5078 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5091 - SURFACE
      ?auto_5092 - SURFACE
    )
    :vars
    (
      ?auto_5093 - HOIST
      ?auto_5094 - PLACE
      ?auto_5096 - PLACE
      ?auto_5097 - HOIST
      ?auto_5098 - SURFACE
      ?auto_5095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5093 ?auto_5094 ) ( SURFACE-AT ?auto_5091 ?auto_5094 ) ( CLEAR ?auto_5091 ) ( IS-CRATE ?auto_5092 ) ( AVAILABLE ?auto_5093 ) ( not ( = ?auto_5096 ?auto_5094 ) ) ( HOIST-AT ?auto_5097 ?auto_5096 ) ( AVAILABLE ?auto_5097 ) ( SURFACE-AT ?auto_5092 ?auto_5096 ) ( ON ?auto_5092 ?auto_5098 ) ( CLEAR ?auto_5092 ) ( TRUCK-AT ?auto_5095 ?auto_5094 ) ( not ( = ?auto_5091 ?auto_5092 ) ) ( not ( = ?auto_5091 ?auto_5098 ) ) ( not ( = ?auto_5092 ?auto_5098 ) ) ( not ( = ?auto_5093 ?auto_5097 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5095 ?auto_5094 ?auto_5096 )
      ( !LIFT ?auto_5097 ?auto_5092 ?auto_5098 ?auto_5096 )
      ( !LOAD ?auto_5097 ?auto_5092 ?auto_5095 ?auto_5096 )
      ( !DRIVE ?auto_5095 ?auto_5096 ?auto_5094 )
      ( !UNLOAD ?auto_5093 ?auto_5092 ?auto_5095 ?auto_5094 )
      ( !DROP ?auto_5093 ?auto_5092 ?auto_5091 ?auto_5094 )
      ( MAKE-1CRATE-VERIFY ?auto_5091 ?auto_5092 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5104 - SURFACE
      ?auto_5105 - SURFACE
      ?auto_5106 - SURFACE
      ?auto_5107 - SURFACE
      ?auto_5108 - SURFACE
    )
    :vars
    (
      ?auto_5113 - HOIST
      ?auto_5112 - PLACE
      ?auto_5111 - PLACE
      ?auto_5110 - HOIST
      ?auto_5114 - SURFACE
      ?auto_5119 - SURFACE
      ?auto_5117 - PLACE
      ?auto_5115 - HOIST
      ?auto_5118 - SURFACE
      ?auto_5116 - SURFACE
      ?auto_5109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5113 ?auto_5112 ) ( IS-CRATE ?auto_5108 ) ( not ( = ?auto_5111 ?auto_5112 ) ) ( HOIST-AT ?auto_5110 ?auto_5111 ) ( SURFACE-AT ?auto_5108 ?auto_5111 ) ( ON ?auto_5108 ?auto_5114 ) ( CLEAR ?auto_5108 ) ( not ( = ?auto_5107 ?auto_5108 ) ) ( not ( = ?auto_5107 ?auto_5114 ) ) ( not ( = ?auto_5108 ?auto_5114 ) ) ( not ( = ?auto_5113 ?auto_5110 ) ) ( IS-CRATE ?auto_5107 ) ( SURFACE-AT ?auto_5107 ?auto_5111 ) ( ON ?auto_5107 ?auto_5119 ) ( CLEAR ?auto_5107 ) ( not ( = ?auto_5106 ?auto_5107 ) ) ( not ( = ?auto_5106 ?auto_5119 ) ) ( not ( = ?auto_5107 ?auto_5119 ) ) ( IS-CRATE ?auto_5106 ) ( not ( = ?auto_5117 ?auto_5112 ) ) ( HOIST-AT ?auto_5115 ?auto_5117 ) ( AVAILABLE ?auto_5115 ) ( SURFACE-AT ?auto_5106 ?auto_5117 ) ( ON ?auto_5106 ?auto_5118 ) ( CLEAR ?auto_5106 ) ( not ( = ?auto_5105 ?auto_5106 ) ) ( not ( = ?auto_5105 ?auto_5118 ) ) ( not ( = ?auto_5106 ?auto_5118 ) ) ( not ( = ?auto_5113 ?auto_5115 ) ) ( SURFACE-AT ?auto_5104 ?auto_5112 ) ( CLEAR ?auto_5104 ) ( IS-CRATE ?auto_5105 ) ( AVAILABLE ?auto_5113 ) ( AVAILABLE ?auto_5110 ) ( SURFACE-AT ?auto_5105 ?auto_5111 ) ( ON ?auto_5105 ?auto_5116 ) ( CLEAR ?auto_5105 ) ( TRUCK-AT ?auto_5109 ?auto_5112 ) ( not ( = ?auto_5104 ?auto_5105 ) ) ( not ( = ?auto_5104 ?auto_5116 ) ) ( not ( = ?auto_5105 ?auto_5116 ) ) ( not ( = ?auto_5104 ?auto_5106 ) ) ( not ( = ?auto_5104 ?auto_5118 ) ) ( not ( = ?auto_5106 ?auto_5116 ) ) ( not ( = ?auto_5117 ?auto_5111 ) ) ( not ( = ?auto_5115 ?auto_5110 ) ) ( not ( = ?auto_5118 ?auto_5116 ) ) ( not ( = ?auto_5104 ?auto_5107 ) ) ( not ( = ?auto_5104 ?auto_5119 ) ) ( not ( = ?auto_5105 ?auto_5107 ) ) ( not ( = ?auto_5105 ?auto_5119 ) ) ( not ( = ?auto_5107 ?auto_5118 ) ) ( not ( = ?auto_5107 ?auto_5116 ) ) ( not ( = ?auto_5119 ?auto_5118 ) ) ( not ( = ?auto_5119 ?auto_5116 ) ) ( not ( = ?auto_5104 ?auto_5108 ) ) ( not ( = ?auto_5104 ?auto_5114 ) ) ( not ( = ?auto_5105 ?auto_5108 ) ) ( not ( = ?auto_5105 ?auto_5114 ) ) ( not ( = ?auto_5106 ?auto_5108 ) ) ( not ( = ?auto_5106 ?auto_5114 ) ) ( not ( = ?auto_5108 ?auto_5119 ) ) ( not ( = ?auto_5108 ?auto_5118 ) ) ( not ( = ?auto_5108 ?auto_5116 ) ) ( not ( = ?auto_5114 ?auto_5119 ) ) ( not ( = ?auto_5114 ?auto_5118 ) ) ( not ( = ?auto_5114 ?auto_5116 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5104 ?auto_5105 ?auto_5106 ?auto_5107 )
      ( MAKE-1CRATE ?auto_5107 ?auto_5108 )
      ( MAKE-4CRATE-VERIFY ?auto_5104 ?auto_5105 ?auto_5106 ?auto_5107 ?auto_5108 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5122 - SURFACE
      ?auto_5123 - SURFACE
    )
    :vars
    (
      ?auto_5124 - HOIST
      ?auto_5125 - PLACE
      ?auto_5127 - PLACE
      ?auto_5128 - HOIST
      ?auto_5129 - SURFACE
      ?auto_5126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5124 ?auto_5125 ) ( SURFACE-AT ?auto_5122 ?auto_5125 ) ( CLEAR ?auto_5122 ) ( IS-CRATE ?auto_5123 ) ( AVAILABLE ?auto_5124 ) ( not ( = ?auto_5127 ?auto_5125 ) ) ( HOIST-AT ?auto_5128 ?auto_5127 ) ( AVAILABLE ?auto_5128 ) ( SURFACE-AT ?auto_5123 ?auto_5127 ) ( ON ?auto_5123 ?auto_5129 ) ( CLEAR ?auto_5123 ) ( TRUCK-AT ?auto_5126 ?auto_5125 ) ( not ( = ?auto_5122 ?auto_5123 ) ) ( not ( = ?auto_5122 ?auto_5129 ) ) ( not ( = ?auto_5123 ?auto_5129 ) ) ( not ( = ?auto_5124 ?auto_5128 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5126 ?auto_5125 ?auto_5127 )
      ( !LIFT ?auto_5128 ?auto_5123 ?auto_5129 ?auto_5127 )
      ( !LOAD ?auto_5128 ?auto_5123 ?auto_5126 ?auto_5127 )
      ( !DRIVE ?auto_5126 ?auto_5127 ?auto_5125 )
      ( !UNLOAD ?auto_5124 ?auto_5123 ?auto_5126 ?auto_5125 )
      ( !DROP ?auto_5124 ?auto_5123 ?auto_5122 ?auto_5125 )
      ( MAKE-1CRATE-VERIFY ?auto_5122 ?auto_5123 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_5136 - SURFACE
      ?auto_5137 - SURFACE
      ?auto_5138 - SURFACE
      ?auto_5139 - SURFACE
      ?auto_5140 - SURFACE
      ?auto_5141 - SURFACE
    )
    :vars
    (
      ?auto_5143 - HOIST
      ?auto_5144 - PLACE
      ?auto_5142 - PLACE
      ?auto_5147 - HOIST
      ?auto_5145 - SURFACE
      ?auto_5152 - PLACE
      ?auto_5150 - HOIST
      ?auto_5153 - SURFACE
      ?auto_5149 - SURFACE
      ?auto_5148 - SURFACE
      ?auto_5151 - SURFACE
      ?auto_5146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5143 ?auto_5144 ) ( IS-CRATE ?auto_5141 ) ( not ( = ?auto_5142 ?auto_5144 ) ) ( HOIST-AT ?auto_5147 ?auto_5142 ) ( SURFACE-AT ?auto_5141 ?auto_5142 ) ( ON ?auto_5141 ?auto_5145 ) ( CLEAR ?auto_5141 ) ( not ( = ?auto_5140 ?auto_5141 ) ) ( not ( = ?auto_5140 ?auto_5145 ) ) ( not ( = ?auto_5141 ?auto_5145 ) ) ( not ( = ?auto_5143 ?auto_5147 ) ) ( IS-CRATE ?auto_5140 ) ( not ( = ?auto_5152 ?auto_5144 ) ) ( HOIST-AT ?auto_5150 ?auto_5152 ) ( SURFACE-AT ?auto_5140 ?auto_5152 ) ( ON ?auto_5140 ?auto_5153 ) ( CLEAR ?auto_5140 ) ( not ( = ?auto_5139 ?auto_5140 ) ) ( not ( = ?auto_5139 ?auto_5153 ) ) ( not ( = ?auto_5140 ?auto_5153 ) ) ( not ( = ?auto_5143 ?auto_5150 ) ) ( IS-CRATE ?auto_5139 ) ( SURFACE-AT ?auto_5139 ?auto_5152 ) ( ON ?auto_5139 ?auto_5149 ) ( CLEAR ?auto_5139 ) ( not ( = ?auto_5138 ?auto_5139 ) ) ( not ( = ?auto_5138 ?auto_5149 ) ) ( not ( = ?auto_5139 ?auto_5149 ) ) ( IS-CRATE ?auto_5138 ) ( AVAILABLE ?auto_5147 ) ( SURFACE-AT ?auto_5138 ?auto_5142 ) ( ON ?auto_5138 ?auto_5148 ) ( CLEAR ?auto_5138 ) ( not ( = ?auto_5137 ?auto_5138 ) ) ( not ( = ?auto_5137 ?auto_5148 ) ) ( not ( = ?auto_5138 ?auto_5148 ) ) ( SURFACE-AT ?auto_5136 ?auto_5144 ) ( CLEAR ?auto_5136 ) ( IS-CRATE ?auto_5137 ) ( AVAILABLE ?auto_5143 ) ( AVAILABLE ?auto_5150 ) ( SURFACE-AT ?auto_5137 ?auto_5152 ) ( ON ?auto_5137 ?auto_5151 ) ( CLEAR ?auto_5137 ) ( TRUCK-AT ?auto_5146 ?auto_5144 ) ( not ( = ?auto_5136 ?auto_5137 ) ) ( not ( = ?auto_5136 ?auto_5151 ) ) ( not ( = ?auto_5137 ?auto_5151 ) ) ( not ( = ?auto_5136 ?auto_5138 ) ) ( not ( = ?auto_5136 ?auto_5148 ) ) ( not ( = ?auto_5138 ?auto_5151 ) ) ( not ( = ?auto_5142 ?auto_5152 ) ) ( not ( = ?auto_5147 ?auto_5150 ) ) ( not ( = ?auto_5148 ?auto_5151 ) ) ( not ( = ?auto_5136 ?auto_5139 ) ) ( not ( = ?auto_5136 ?auto_5149 ) ) ( not ( = ?auto_5137 ?auto_5139 ) ) ( not ( = ?auto_5137 ?auto_5149 ) ) ( not ( = ?auto_5139 ?auto_5148 ) ) ( not ( = ?auto_5139 ?auto_5151 ) ) ( not ( = ?auto_5149 ?auto_5148 ) ) ( not ( = ?auto_5149 ?auto_5151 ) ) ( not ( = ?auto_5136 ?auto_5140 ) ) ( not ( = ?auto_5136 ?auto_5153 ) ) ( not ( = ?auto_5137 ?auto_5140 ) ) ( not ( = ?auto_5137 ?auto_5153 ) ) ( not ( = ?auto_5138 ?auto_5140 ) ) ( not ( = ?auto_5138 ?auto_5153 ) ) ( not ( = ?auto_5140 ?auto_5149 ) ) ( not ( = ?auto_5140 ?auto_5148 ) ) ( not ( = ?auto_5140 ?auto_5151 ) ) ( not ( = ?auto_5153 ?auto_5149 ) ) ( not ( = ?auto_5153 ?auto_5148 ) ) ( not ( = ?auto_5153 ?auto_5151 ) ) ( not ( = ?auto_5136 ?auto_5141 ) ) ( not ( = ?auto_5136 ?auto_5145 ) ) ( not ( = ?auto_5137 ?auto_5141 ) ) ( not ( = ?auto_5137 ?auto_5145 ) ) ( not ( = ?auto_5138 ?auto_5141 ) ) ( not ( = ?auto_5138 ?auto_5145 ) ) ( not ( = ?auto_5139 ?auto_5141 ) ) ( not ( = ?auto_5139 ?auto_5145 ) ) ( not ( = ?auto_5141 ?auto_5153 ) ) ( not ( = ?auto_5141 ?auto_5149 ) ) ( not ( = ?auto_5141 ?auto_5148 ) ) ( not ( = ?auto_5141 ?auto_5151 ) ) ( not ( = ?auto_5145 ?auto_5153 ) ) ( not ( = ?auto_5145 ?auto_5149 ) ) ( not ( = ?auto_5145 ?auto_5148 ) ) ( not ( = ?auto_5145 ?auto_5151 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5136 ?auto_5137 ?auto_5138 ?auto_5139 ?auto_5140 )
      ( MAKE-1CRATE ?auto_5140 ?auto_5141 )
      ( MAKE-5CRATE-VERIFY ?auto_5136 ?auto_5137 ?auto_5138 ?auto_5139 ?auto_5140 ?auto_5141 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5156 - SURFACE
      ?auto_5157 - SURFACE
    )
    :vars
    (
      ?auto_5158 - HOIST
      ?auto_5159 - PLACE
      ?auto_5161 - PLACE
      ?auto_5162 - HOIST
      ?auto_5163 - SURFACE
      ?auto_5160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5158 ?auto_5159 ) ( SURFACE-AT ?auto_5156 ?auto_5159 ) ( CLEAR ?auto_5156 ) ( IS-CRATE ?auto_5157 ) ( AVAILABLE ?auto_5158 ) ( not ( = ?auto_5161 ?auto_5159 ) ) ( HOIST-AT ?auto_5162 ?auto_5161 ) ( AVAILABLE ?auto_5162 ) ( SURFACE-AT ?auto_5157 ?auto_5161 ) ( ON ?auto_5157 ?auto_5163 ) ( CLEAR ?auto_5157 ) ( TRUCK-AT ?auto_5160 ?auto_5159 ) ( not ( = ?auto_5156 ?auto_5157 ) ) ( not ( = ?auto_5156 ?auto_5163 ) ) ( not ( = ?auto_5157 ?auto_5163 ) ) ( not ( = ?auto_5158 ?auto_5162 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5160 ?auto_5159 ?auto_5161 )
      ( !LIFT ?auto_5162 ?auto_5157 ?auto_5163 ?auto_5161 )
      ( !LOAD ?auto_5162 ?auto_5157 ?auto_5160 ?auto_5161 )
      ( !DRIVE ?auto_5160 ?auto_5161 ?auto_5159 )
      ( !UNLOAD ?auto_5158 ?auto_5157 ?auto_5160 ?auto_5159 )
      ( !DROP ?auto_5158 ?auto_5157 ?auto_5156 ?auto_5159 )
      ( MAKE-1CRATE-VERIFY ?auto_5156 ?auto_5157 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_5171 - SURFACE
      ?auto_5172 - SURFACE
      ?auto_5173 - SURFACE
      ?auto_5174 - SURFACE
      ?auto_5175 - SURFACE
      ?auto_5176 - SURFACE
      ?auto_5177 - SURFACE
    )
    :vars
    (
      ?auto_5181 - HOIST
      ?auto_5182 - PLACE
      ?auto_5180 - PLACE
      ?auto_5179 - HOIST
      ?auto_5183 - SURFACE
      ?auto_5186 - PLACE
      ?auto_5184 - HOIST
      ?auto_5185 - SURFACE
      ?auto_5189 - SURFACE
      ?auto_5188 - SURFACE
      ?auto_5190 - SURFACE
      ?auto_5187 - SURFACE
      ?auto_5178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5181 ?auto_5182 ) ( IS-CRATE ?auto_5177 ) ( not ( = ?auto_5180 ?auto_5182 ) ) ( HOIST-AT ?auto_5179 ?auto_5180 ) ( SURFACE-AT ?auto_5177 ?auto_5180 ) ( ON ?auto_5177 ?auto_5183 ) ( CLEAR ?auto_5177 ) ( not ( = ?auto_5176 ?auto_5177 ) ) ( not ( = ?auto_5176 ?auto_5183 ) ) ( not ( = ?auto_5177 ?auto_5183 ) ) ( not ( = ?auto_5181 ?auto_5179 ) ) ( IS-CRATE ?auto_5176 ) ( not ( = ?auto_5186 ?auto_5182 ) ) ( HOIST-AT ?auto_5184 ?auto_5186 ) ( SURFACE-AT ?auto_5176 ?auto_5186 ) ( ON ?auto_5176 ?auto_5185 ) ( CLEAR ?auto_5176 ) ( not ( = ?auto_5175 ?auto_5176 ) ) ( not ( = ?auto_5175 ?auto_5185 ) ) ( not ( = ?auto_5176 ?auto_5185 ) ) ( not ( = ?auto_5181 ?auto_5184 ) ) ( IS-CRATE ?auto_5175 ) ( SURFACE-AT ?auto_5175 ?auto_5180 ) ( ON ?auto_5175 ?auto_5189 ) ( CLEAR ?auto_5175 ) ( not ( = ?auto_5174 ?auto_5175 ) ) ( not ( = ?auto_5174 ?auto_5189 ) ) ( not ( = ?auto_5175 ?auto_5189 ) ) ( IS-CRATE ?auto_5174 ) ( SURFACE-AT ?auto_5174 ?auto_5180 ) ( ON ?auto_5174 ?auto_5188 ) ( CLEAR ?auto_5174 ) ( not ( = ?auto_5173 ?auto_5174 ) ) ( not ( = ?auto_5173 ?auto_5188 ) ) ( not ( = ?auto_5174 ?auto_5188 ) ) ( IS-CRATE ?auto_5173 ) ( AVAILABLE ?auto_5184 ) ( SURFACE-AT ?auto_5173 ?auto_5186 ) ( ON ?auto_5173 ?auto_5190 ) ( CLEAR ?auto_5173 ) ( not ( = ?auto_5172 ?auto_5173 ) ) ( not ( = ?auto_5172 ?auto_5190 ) ) ( not ( = ?auto_5173 ?auto_5190 ) ) ( SURFACE-AT ?auto_5171 ?auto_5182 ) ( CLEAR ?auto_5171 ) ( IS-CRATE ?auto_5172 ) ( AVAILABLE ?auto_5181 ) ( AVAILABLE ?auto_5179 ) ( SURFACE-AT ?auto_5172 ?auto_5180 ) ( ON ?auto_5172 ?auto_5187 ) ( CLEAR ?auto_5172 ) ( TRUCK-AT ?auto_5178 ?auto_5182 ) ( not ( = ?auto_5171 ?auto_5172 ) ) ( not ( = ?auto_5171 ?auto_5187 ) ) ( not ( = ?auto_5172 ?auto_5187 ) ) ( not ( = ?auto_5171 ?auto_5173 ) ) ( not ( = ?auto_5171 ?auto_5190 ) ) ( not ( = ?auto_5173 ?auto_5187 ) ) ( not ( = ?auto_5186 ?auto_5180 ) ) ( not ( = ?auto_5184 ?auto_5179 ) ) ( not ( = ?auto_5190 ?auto_5187 ) ) ( not ( = ?auto_5171 ?auto_5174 ) ) ( not ( = ?auto_5171 ?auto_5188 ) ) ( not ( = ?auto_5172 ?auto_5174 ) ) ( not ( = ?auto_5172 ?auto_5188 ) ) ( not ( = ?auto_5174 ?auto_5190 ) ) ( not ( = ?auto_5174 ?auto_5187 ) ) ( not ( = ?auto_5188 ?auto_5190 ) ) ( not ( = ?auto_5188 ?auto_5187 ) ) ( not ( = ?auto_5171 ?auto_5175 ) ) ( not ( = ?auto_5171 ?auto_5189 ) ) ( not ( = ?auto_5172 ?auto_5175 ) ) ( not ( = ?auto_5172 ?auto_5189 ) ) ( not ( = ?auto_5173 ?auto_5175 ) ) ( not ( = ?auto_5173 ?auto_5189 ) ) ( not ( = ?auto_5175 ?auto_5188 ) ) ( not ( = ?auto_5175 ?auto_5190 ) ) ( not ( = ?auto_5175 ?auto_5187 ) ) ( not ( = ?auto_5189 ?auto_5188 ) ) ( not ( = ?auto_5189 ?auto_5190 ) ) ( not ( = ?auto_5189 ?auto_5187 ) ) ( not ( = ?auto_5171 ?auto_5176 ) ) ( not ( = ?auto_5171 ?auto_5185 ) ) ( not ( = ?auto_5172 ?auto_5176 ) ) ( not ( = ?auto_5172 ?auto_5185 ) ) ( not ( = ?auto_5173 ?auto_5176 ) ) ( not ( = ?auto_5173 ?auto_5185 ) ) ( not ( = ?auto_5174 ?auto_5176 ) ) ( not ( = ?auto_5174 ?auto_5185 ) ) ( not ( = ?auto_5176 ?auto_5189 ) ) ( not ( = ?auto_5176 ?auto_5188 ) ) ( not ( = ?auto_5176 ?auto_5190 ) ) ( not ( = ?auto_5176 ?auto_5187 ) ) ( not ( = ?auto_5185 ?auto_5189 ) ) ( not ( = ?auto_5185 ?auto_5188 ) ) ( not ( = ?auto_5185 ?auto_5190 ) ) ( not ( = ?auto_5185 ?auto_5187 ) ) ( not ( = ?auto_5171 ?auto_5177 ) ) ( not ( = ?auto_5171 ?auto_5183 ) ) ( not ( = ?auto_5172 ?auto_5177 ) ) ( not ( = ?auto_5172 ?auto_5183 ) ) ( not ( = ?auto_5173 ?auto_5177 ) ) ( not ( = ?auto_5173 ?auto_5183 ) ) ( not ( = ?auto_5174 ?auto_5177 ) ) ( not ( = ?auto_5174 ?auto_5183 ) ) ( not ( = ?auto_5175 ?auto_5177 ) ) ( not ( = ?auto_5175 ?auto_5183 ) ) ( not ( = ?auto_5177 ?auto_5185 ) ) ( not ( = ?auto_5177 ?auto_5189 ) ) ( not ( = ?auto_5177 ?auto_5188 ) ) ( not ( = ?auto_5177 ?auto_5190 ) ) ( not ( = ?auto_5177 ?auto_5187 ) ) ( not ( = ?auto_5183 ?auto_5185 ) ) ( not ( = ?auto_5183 ?auto_5189 ) ) ( not ( = ?auto_5183 ?auto_5188 ) ) ( not ( = ?auto_5183 ?auto_5190 ) ) ( not ( = ?auto_5183 ?auto_5187 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5171 ?auto_5172 ?auto_5173 ?auto_5174 ?auto_5175 ?auto_5176 )
      ( MAKE-1CRATE ?auto_5176 ?auto_5177 )
      ( MAKE-6CRATE-VERIFY ?auto_5171 ?auto_5172 ?auto_5173 ?auto_5174 ?auto_5175 ?auto_5176 ?auto_5177 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5193 - SURFACE
      ?auto_5194 - SURFACE
    )
    :vars
    (
      ?auto_5195 - HOIST
      ?auto_5196 - PLACE
      ?auto_5198 - PLACE
      ?auto_5199 - HOIST
      ?auto_5200 - SURFACE
      ?auto_5197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5195 ?auto_5196 ) ( SURFACE-AT ?auto_5193 ?auto_5196 ) ( CLEAR ?auto_5193 ) ( IS-CRATE ?auto_5194 ) ( AVAILABLE ?auto_5195 ) ( not ( = ?auto_5198 ?auto_5196 ) ) ( HOIST-AT ?auto_5199 ?auto_5198 ) ( AVAILABLE ?auto_5199 ) ( SURFACE-AT ?auto_5194 ?auto_5198 ) ( ON ?auto_5194 ?auto_5200 ) ( CLEAR ?auto_5194 ) ( TRUCK-AT ?auto_5197 ?auto_5196 ) ( not ( = ?auto_5193 ?auto_5194 ) ) ( not ( = ?auto_5193 ?auto_5200 ) ) ( not ( = ?auto_5194 ?auto_5200 ) ) ( not ( = ?auto_5195 ?auto_5199 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5197 ?auto_5196 ?auto_5198 )
      ( !LIFT ?auto_5199 ?auto_5194 ?auto_5200 ?auto_5198 )
      ( !LOAD ?auto_5199 ?auto_5194 ?auto_5197 ?auto_5198 )
      ( !DRIVE ?auto_5197 ?auto_5198 ?auto_5196 )
      ( !UNLOAD ?auto_5195 ?auto_5194 ?auto_5197 ?auto_5196 )
      ( !DROP ?auto_5195 ?auto_5194 ?auto_5193 ?auto_5196 )
      ( MAKE-1CRATE-VERIFY ?auto_5193 ?auto_5194 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_5209 - SURFACE
      ?auto_5210 - SURFACE
      ?auto_5211 - SURFACE
      ?auto_5212 - SURFACE
      ?auto_5213 - SURFACE
      ?auto_5214 - SURFACE
      ?auto_5216 - SURFACE
      ?auto_5215 - SURFACE
    )
    :vars
    (
      ?auto_5218 - HOIST
      ?auto_5219 - PLACE
      ?auto_5222 - PLACE
      ?auto_5221 - HOIST
      ?auto_5217 - SURFACE
      ?auto_5223 - PLACE
      ?auto_5228 - HOIST
      ?auto_5229 - SURFACE
      ?auto_5225 - SURFACE
      ?auto_5226 - SURFACE
      ?auto_5227 - SURFACE
      ?auto_5230 - SURFACE
      ?auto_5224 - SURFACE
      ?auto_5220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5218 ?auto_5219 ) ( IS-CRATE ?auto_5215 ) ( not ( = ?auto_5222 ?auto_5219 ) ) ( HOIST-AT ?auto_5221 ?auto_5222 ) ( SURFACE-AT ?auto_5215 ?auto_5222 ) ( ON ?auto_5215 ?auto_5217 ) ( CLEAR ?auto_5215 ) ( not ( = ?auto_5216 ?auto_5215 ) ) ( not ( = ?auto_5216 ?auto_5217 ) ) ( not ( = ?auto_5215 ?auto_5217 ) ) ( not ( = ?auto_5218 ?auto_5221 ) ) ( IS-CRATE ?auto_5216 ) ( not ( = ?auto_5223 ?auto_5219 ) ) ( HOIST-AT ?auto_5228 ?auto_5223 ) ( SURFACE-AT ?auto_5216 ?auto_5223 ) ( ON ?auto_5216 ?auto_5229 ) ( CLEAR ?auto_5216 ) ( not ( = ?auto_5214 ?auto_5216 ) ) ( not ( = ?auto_5214 ?auto_5229 ) ) ( not ( = ?auto_5216 ?auto_5229 ) ) ( not ( = ?auto_5218 ?auto_5228 ) ) ( IS-CRATE ?auto_5214 ) ( SURFACE-AT ?auto_5214 ?auto_5222 ) ( ON ?auto_5214 ?auto_5225 ) ( CLEAR ?auto_5214 ) ( not ( = ?auto_5213 ?auto_5214 ) ) ( not ( = ?auto_5213 ?auto_5225 ) ) ( not ( = ?auto_5214 ?auto_5225 ) ) ( IS-CRATE ?auto_5213 ) ( SURFACE-AT ?auto_5213 ?auto_5223 ) ( ON ?auto_5213 ?auto_5226 ) ( CLEAR ?auto_5213 ) ( not ( = ?auto_5212 ?auto_5213 ) ) ( not ( = ?auto_5212 ?auto_5226 ) ) ( not ( = ?auto_5213 ?auto_5226 ) ) ( IS-CRATE ?auto_5212 ) ( SURFACE-AT ?auto_5212 ?auto_5223 ) ( ON ?auto_5212 ?auto_5227 ) ( CLEAR ?auto_5212 ) ( not ( = ?auto_5211 ?auto_5212 ) ) ( not ( = ?auto_5211 ?auto_5227 ) ) ( not ( = ?auto_5212 ?auto_5227 ) ) ( IS-CRATE ?auto_5211 ) ( AVAILABLE ?auto_5221 ) ( SURFACE-AT ?auto_5211 ?auto_5222 ) ( ON ?auto_5211 ?auto_5230 ) ( CLEAR ?auto_5211 ) ( not ( = ?auto_5210 ?auto_5211 ) ) ( not ( = ?auto_5210 ?auto_5230 ) ) ( not ( = ?auto_5211 ?auto_5230 ) ) ( SURFACE-AT ?auto_5209 ?auto_5219 ) ( CLEAR ?auto_5209 ) ( IS-CRATE ?auto_5210 ) ( AVAILABLE ?auto_5218 ) ( AVAILABLE ?auto_5228 ) ( SURFACE-AT ?auto_5210 ?auto_5223 ) ( ON ?auto_5210 ?auto_5224 ) ( CLEAR ?auto_5210 ) ( TRUCK-AT ?auto_5220 ?auto_5219 ) ( not ( = ?auto_5209 ?auto_5210 ) ) ( not ( = ?auto_5209 ?auto_5224 ) ) ( not ( = ?auto_5210 ?auto_5224 ) ) ( not ( = ?auto_5209 ?auto_5211 ) ) ( not ( = ?auto_5209 ?auto_5230 ) ) ( not ( = ?auto_5211 ?auto_5224 ) ) ( not ( = ?auto_5222 ?auto_5223 ) ) ( not ( = ?auto_5221 ?auto_5228 ) ) ( not ( = ?auto_5230 ?auto_5224 ) ) ( not ( = ?auto_5209 ?auto_5212 ) ) ( not ( = ?auto_5209 ?auto_5227 ) ) ( not ( = ?auto_5210 ?auto_5212 ) ) ( not ( = ?auto_5210 ?auto_5227 ) ) ( not ( = ?auto_5212 ?auto_5230 ) ) ( not ( = ?auto_5212 ?auto_5224 ) ) ( not ( = ?auto_5227 ?auto_5230 ) ) ( not ( = ?auto_5227 ?auto_5224 ) ) ( not ( = ?auto_5209 ?auto_5213 ) ) ( not ( = ?auto_5209 ?auto_5226 ) ) ( not ( = ?auto_5210 ?auto_5213 ) ) ( not ( = ?auto_5210 ?auto_5226 ) ) ( not ( = ?auto_5211 ?auto_5213 ) ) ( not ( = ?auto_5211 ?auto_5226 ) ) ( not ( = ?auto_5213 ?auto_5227 ) ) ( not ( = ?auto_5213 ?auto_5230 ) ) ( not ( = ?auto_5213 ?auto_5224 ) ) ( not ( = ?auto_5226 ?auto_5227 ) ) ( not ( = ?auto_5226 ?auto_5230 ) ) ( not ( = ?auto_5226 ?auto_5224 ) ) ( not ( = ?auto_5209 ?auto_5214 ) ) ( not ( = ?auto_5209 ?auto_5225 ) ) ( not ( = ?auto_5210 ?auto_5214 ) ) ( not ( = ?auto_5210 ?auto_5225 ) ) ( not ( = ?auto_5211 ?auto_5214 ) ) ( not ( = ?auto_5211 ?auto_5225 ) ) ( not ( = ?auto_5212 ?auto_5214 ) ) ( not ( = ?auto_5212 ?auto_5225 ) ) ( not ( = ?auto_5214 ?auto_5226 ) ) ( not ( = ?auto_5214 ?auto_5227 ) ) ( not ( = ?auto_5214 ?auto_5230 ) ) ( not ( = ?auto_5214 ?auto_5224 ) ) ( not ( = ?auto_5225 ?auto_5226 ) ) ( not ( = ?auto_5225 ?auto_5227 ) ) ( not ( = ?auto_5225 ?auto_5230 ) ) ( not ( = ?auto_5225 ?auto_5224 ) ) ( not ( = ?auto_5209 ?auto_5216 ) ) ( not ( = ?auto_5209 ?auto_5229 ) ) ( not ( = ?auto_5210 ?auto_5216 ) ) ( not ( = ?auto_5210 ?auto_5229 ) ) ( not ( = ?auto_5211 ?auto_5216 ) ) ( not ( = ?auto_5211 ?auto_5229 ) ) ( not ( = ?auto_5212 ?auto_5216 ) ) ( not ( = ?auto_5212 ?auto_5229 ) ) ( not ( = ?auto_5213 ?auto_5216 ) ) ( not ( = ?auto_5213 ?auto_5229 ) ) ( not ( = ?auto_5216 ?auto_5225 ) ) ( not ( = ?auto_5216 ?auto_5226 ) ) ( not ( = ?auto_5216 ?auto_5227 ) ) ( not ( = ?auto_5216 ?auto_5230 ) ) ( not ( = ?auto_5216 ?auto_5224 ) ) ( not ( = ?auto_5229 ?auto_5225 ) ) ( not ( = ?auto_5229 ?auto_5226 ) ) ( not ( = ?auto_5229 ?auto_5227 ) ) ( not ( = ?auto_5229 ?auto_5230 ) ) ( not ( = ?auto_5229 ?auto_5224 ) ) ( not ( = ?auto_5209 ?auto_5215 ) ) ( not ( = ?auto_5209 ?auto_5217 ) ) ( not ( = ?auto_5210 ?auto_5215 ) ) ( not ( = ?auto_5210 ?auto_5217 ) ) ( not ( = ?auto_5211 ?auto_5215 ) ) ( not ( = ?auto_5211 ?auto_5217 ) ) ( not ( = ?auto_5212 ?auto_5215 ) ) ( not ( = ?auto_5212 ?auto_5217 ) ) ( not ( = ?auto_5213 ?auto_5215 ) ) ( not ( = ?auto_5213 ?auto_5217 ) ) ( not ( = ?auto_5214 ?auto_5215 ) ) ( not ( = ?auto_5214 ?auto_5217 ) ) ( not ( = ?auto_5215 ?auto_5229 ) ) ( not ( = ?auto_5215 ?auto_5225 ) ) ( not ( = ?auto_5215 ?auto_5226 ) ) ( not ( = ?auto_5215 ?auto_5227 ) ) ( not ( = ?auto_5215 ?auto_5230 ) ) ( not ( = ?auto_5215 ?auto_5224 ) ) ( not ( = ?auto_5217 ?auto_5229 ) ) ( not ( = ?auto_5217 ?auto_5225 ) ) ( not ( = ?auto_5217 ?auto_5226 ) ) ( not ( = ?auto_5217 ?auto_5227 ) ) ( not ( = ?auto_5217 ?auto_5230 ) ) ( not ( = ?auto_5217 ?auto_5224 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5209 ?auto_5210 ?auto_5211 ?auto_5212 ?auto_5213 ?auto_5214 ?auto_5216 )
      ( MAKE-1CRATE ?auto_5216 ?auto_5215 )
      ( MAKE-7CRATE-VERIFY ?auto_5209 ?auto_5210 ?auto_5211 ?auto_5212 ?auto_5213 ?auto_5214 ?auto_5216 ?auto_5215 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5233 - SURFACE
      ?auto_5234 - SURFACE
    )
    :vars
    (
      ?auto_5235 - HOIST
      ?auto_5236 - PLACE
      ?auto_5238 - PLACE
      ?auto_5239 - HOIST
      ?auto_5240 - SURFACE
      ?auto_5237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5235 ?auto_5236 ) ( SURFACE-AT ?auto_5233 ?auto_5236 ) ( CLEAR ?auto_5233 ) ( IS-CRATE ?auto_5234 ) ( AVAILABLE ?auto_5235 ) ( not ( = ?auto_5238 ?auto_5236 ) ) ( HOIST-AT ?auto_5239 ?auto_5238 ) ( AVAILABLE ?auto_5239 ) ( SURFACE-AT ?auto_5234 ?auto_5238 ) ( ON ?auto_5234 ?auto_5240 ) ( CLEAR ?auto_5234 ) ( TRUCK-AT ?auto_5237 ?auto_5236 ) ( not ( = ?auto_5233 ?auto_5234 ) ) ( not ( = ?auto_5233 ?auto_5240 ) ) ( not ( = ?auto_5234 ?auto_5240 ) ) ( not ( = ?auto_5235 ?auto_5239 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5237 ?auto_5236 ?auto_5238 )
      ( !LIFT ?auto_5239 ?auto_5234 ?auto_5240 ?auto_5238 )
      ( !LOAD ?auto_5239 ?auto_5234 ?auto_5237 ?auto_5238 )
      ( !DRIVE ?auto_5237 ?auto_5238 ?auto_5236 )
      ( !UNLOAD ?auto_5235 ?auto_5234 ?auto_5237 ?auto_5236 )
      ( !DROP ?auto_5235 ?auto_5234 ?auto_5233 ?auto_5236 )
      ( MAKE-1CRATE-VERIFY ?auto_5233 ?auto_5234 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_5250 - SURFACE
      ?auto_5251 - SURFACE
      ?auto_5252 - SURFACE
      ?auto_5253 - SURFACE
      ?auto_5254 - SURFACE
      ?auto_5255 - SURFACE
      ?auto_5258 - SURFACE
      ?auto_5257 - SURFACE
      ?auto_5256 - SURFACE
    )
    :vars
    (
      ?auto_5259 - HOIST
      ?auto_5261 - PLACE
      ?auto_5264 - PLACE
      ?auto_5262 - HOIST
      ?auto_5263 - SURFACE
      ?auto_5275 - PLACE
      ?auto_5265 - HOIST
      ?auto_5273 - SURFACE
      ?auto_5268 - PLACE
      ?auto_5271 - HOIST
      ?auto_5270 - SURFACE
      ?auto_5267 - SURFACE
      ?auto_5274 - SURFACE
      ?auto_5272 - SURFACE
      ?auto_5269 - SURFACE
      ?auto_5266 - SURFACE
      ?auto_5260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5259 ?auto_5261 ) ( IS-CRATE ?auto_5256 ) ( not ( = ?auto_5264 ?auto_5261 ) ) ( HOIST-AT ?auto_5262 ?auto_5264 ) ( AVAILABLE ?auto_5262 ) ( SURFACE-AT ?auto_5256 ?auto_5264 ) ( ON ?auto_5256 ?auto_5263 ) ( CLEAR ?auto_5256 ) ( not ( = ?auto_5257 ?auto_5256 ) ) ( not ( = ?auto_5257 ?auto_5263 ) ) ( not ( = ?auto_5256 ?auto_5263 ) ) ( not ( = ?auto_5259 ?auto_5262 ) ) ( IS-CRATE ?auto_5257 ) ( not ( = ?auto_5275 ?auto_5261 ) ) ( HOIST-AT ?auto_5265 ?auto_5275 ) ( SURFACE-AT ?auto_5257 ?auto_5275 ) ( ON ?auto_5257 ?auto_5273 ) ( CLEAR ?auto_5257 ) ( not ( = ?auto_5258 ?auto_5257 ) ) ( not ( = ?auto_5258 ?auto_5273 ) ) ( not ( = ?auto_5257 ?auto_5273 ) ) ( not ( = ?auto_5259 ?auto_5265 ) ) ( IS-CRATE ?auto_5258 ) ( not ( = ?auto_5268 ?auto_5261 ) ) ( HOIST-AT ?auto_5271 ?auto_5268 ) ( SURFACE-AT ?auto_5258 ?auto_5268 ) ( ON ?auto_5258 ?auto_5270 ) ( CLEAR ?auto_5258 ) ( not ( = ?auto_5255 ?auto_5258 ) ) ( not ( = ?auto_5255 ?auto_5270 ) ) ( not ( = ?auto_5258 ?auto_5270 ) ) ( not ( = ?auto_5259 ?auto_5271 ) ) ( IS-CRATE ?auto_5255 ) ( SURFACE-AT ?auto_5255 ?auto_5275 ) ( ON ?auto_5255 ?auto_5267 ) ( CLEAR ?auto_5255 ) ( not ( = ?auto_5254 ?auto_5255 ) ) ( not ( = ?auto_5254 ?auto_5267 ) ) ( not ( = ?auto_5255 ?auto_5267 ) ) ( IS-CRATE ?auto_5254 ) ( SURFACE-AT ?auto_5254 ?auto_5268 ) ( ON ?auto_5254 ?auto_5274 ) ( CLEAR ?auto_5254 ) ( not ( = ?auto_5253 ?auto_5254 ) ) ( not ( = ?auto_5253 ?auto_5274 ) ) ( not ( = ?auto_5254 ?auto_5274 ) ) ( IS-CRATE ?auto_5253 ) ( SURFACE-AT ?auto_5253 ?auto_5268 ) ( ON ?auto_5253 ?auto_5272 ) ( CLEAR ?auto_5253 ) ( not ( = ?auto_5252 ?auto_5253 ) ) ( not ( = ?auto_5252 ?auto_5272 ) ) ( not ( = ?auto_5253 ?auto_5272 ) ) ( IS-CRATE ?auto_5252 ) ( AVAILABLE ?auto_5265 ) ( SURFACE-AT ?auto_5252 ?auto_5275 ) ( ON ?auto_5252 ?auto_5269 ) ( CLEAR ?auto_5252 ) ( not ( = ?auto_5251 ?auto_5252 ) ) ( not ( = ?auto_5251 ?auto_5269 ) ) ( not ( = ?auto_5252 ?auto_5269 ) ) ( SURFACE-AT ?auto_5250 ?auto_5261 ) ( CLEAR ?auto_5250 ) ( IS-CRATE ?auto_5251 ) ( AVAILABLE ?auto_5259 ) ( AVAILABLE ?auto_5271 ) ( SURFACE-AT ?auto_5251 ?auto_5268 ) ( ON ?auto_5251 ?auto_5266 ) ( CLEAR ?auto_5251 ) ( TRUCK-AT ?auto_5260 ?auto_5261 ) ( not ( = ?auto_5250 ?auto_5251 ) ) ( not ( = ?auto_5250 ?auto_5266 ) ) ( not ( = ?auto_5251 ?auto_5266 ) ) ( not ( = ?auto_5250 ?auto_5252 ) ) ( not ( = ?auto_5250 ?auto_5269 ) ) ( not ( = ?auto_5252 ?auto_5266 ) ) ( not ( = ?auto_5275 ?auto_5268 ) ) ( not ( = ?auto_5265 ?auto_5271 ) ) ( not ( = ?auto_5269 ?auto_5266 ) ) ( not ( = ?auto_5250 ?auto_5253 ) ) ( not ( = ?auto_5250 ?auto_5272 ) ) ( not ( = ?auto_5251 ?auto_5253 ) ) ( not ( = ?auto_5251 ?auto_5272 ) ) ( not ( = ?auto_5253 ?auto_5269 ) ) ( not ( = ?auto_5253 ?auto_5266 ) ) ( not ( = ?auto_5272 ?auto_5269 ) ) ( not ( = ?auto_5272 ?auto_5266 ) ) ( not ( = ?auto_5250 ?auto_5254 ) ) ( not ( = ?auto_5250 ?auto_5274 ) ) ( not ( = ?auto_5251 ?auto_5254 ) ) ( not ( = ?auto_5251 ?auto_5274 ) ) ( not ( = ?auto_5252 ?auto_5254 ) ) ( not ( = ?auto_5252 ?auto_5274 ) ) ( not ( = ?auto_5254 ?auto_5272 ) ) ( not ( = ?auto_5254 ?auto_5269 ) ) ( not ( = ?auto_5254 ?auto_5266 ) ) ( not ( = ?auto_5274 ?auto_5272 ) ) ( not ( = ?auto_5274 ?auto_5269 ) ) ( not ( = ?auto_5274 ?auto_5266 ) ) ( not ( = ?auto_5250 ?auto_5255 ) ) ( not ( = ?auto_5250 ?auto_5267 ) ) ( not ( = ?auto_5251 ?auto_5255 ) ) ( not ( = ?auto_5251 ?auto_5267 ) ) ( not ( = ?auto_5252 ?auto_5255 ) ) ( not ( = ?auto_5252 ?auto_5267 ) ) ( not ( = ?auto_5253 ?auto_5255 ) ) ( not ( = ?auto_5253 ?auto_5267 ) ) ( not ( = ?auto_5255 ?auto_5274 ) ) ( not ( = ?auto_5255 ?auto_5272 ) ) ( not ( = ?auto_5255 ?auto_5269 ) ) ( not ( = ?auto_5255 ?auto_5266 ) ) ( not ( = ?auto_5267 ?auto_5274 ) ) ( not ( = ?auto_5267 ?auto_5272 ) ) ( not ( = ?auto_5267 ?auto_5269 ) ) ( not ( = ?auto_5267 ?auto_5266 ) ) ( not ( = ?auto_5250 ?auto_5258 ) ) ( not ( = ?auto_5250 ?auto_5270 ) ) ( not ( = ?auto_5251 ?auto_5258 ) ) ( not ( = ?auto_5251 ?auto_5270 ) ) ( not ( = ?auto_5252 ?auto_5258 ) ) ( not ( = ?auto_5252 ?auto_5270 ) ) ( not ( = ?auto_5253 ?auto_5258 ) ) ( not ( = ?auto_5253 ?auto_5270 ) ) ( not ( = ?auto_5254 ?auto_5258 ) ) ( not ( = ?auto_5254 ?auto_5270 ) ) ( not ( = ?auto_5258 ?auto_5267 ) ) ( not ( = ?auto_5258 ?auto_5274 ) ) ( not ( = ?auto_5258 ?auto_5272 ) ) ( not ( = ?auto_5258 ?auto_5269 ) ) ( not ( = ?auto_5258 ?auto_5266 ) ) ( not ( = ?auto_5270 ?auto_5267 ) ) ( not ( = ?auto_5270 ?auto_5274 ) ) ( not ( = ?auto_5270 ?auto_5272 ) ) ( not ( = ?auto_5270 ?auto_5269 ) ) ( not ( = ?auto_5270 ?auto_5266 ) ) ( not ( = ?auto_5250 ?auto_5257 ) ) ( not ( = ?auto_5250 ?auto_5273 ) ) ( not ( = ?auto_5251 ?auto_5257 ) ) ( not ( = ?auto_5251 ?auto_5273 ) ) ( not ( = ?auto_5252 ?auto_5257 ) ) ( not ( = ?auto_5252 ?auto_5273 ) ) ( not ( = ?auto_5253 ?auto_5257 ) ) ( not ( = ?auto_5253 ?auto_5273 ) ) ( not ( = ?auto_5254 ?auto_5257 ) ) ( not ( = ?auto_5254 ?auto_5273 ) ) ( not ( = ?auto_5255 ?auto_5257 ) ) ( not ( = ?auto_5255 ?auto_5273 ) ) ( not ( = ?auto_5257 ?auto_5270 ) ) ( not ( = ?auto_5257 ?auto_5267 ) ) ( not ( = ?auto_5257 ?auto_5274 ) ) ( not ( = ?auto_5257 ?auto_5272 ) ) ( not ( = ?auto_5257 ?auto_5269 ) ) ( not ( = ?auto_5257 ?auto_5266 ) ) ( not ( = ?auto_5273 ?auto_5270 ) ) ( not ( = ?auto_5273 ?auto_5267 ) ) ( not ( = ?auto_5273 ?auto_5274 ) ) ( not ( = ?auto_5273 ?auto_5272 ) ) ( not ( = ?auto_5273 ?auto_5269 ) ) ( not ( = ?auto_5273 ?auto_5266 ) ) ( not ( = ?auto_5250 ?auto_5256 ) ) ( not ( = ?auto_5250 ?auto_5263 ) ) ( not ( = ?auto_5251 ?auto_5256 ) ) ( not ( = ?auto_5251 ?auto_5263 ) ) ( not ( = ?auto_5252 ?auto_5256 ) ) ( not ( = ?auto_5252 ?auto_5263 ) ) ( not ( = ?auto_5253 ?auto_5256 ) ) ( not ( = ?auto_5253 ?auto_5263 ) ) ( not ( = ?auto_5254 ?auto_5256 ) ) ( not ( = ?auto_5254 ?auto_5263 ) ) ( not ( = ?auto_5255 ?auto_5256 ) ) ( not ( = ?auto_5255 ?auto_5263 ) ) ( not ( = ?auto_5258 ?auto_5256 ) ) ( not ( = ?auto_5258 ?auto_5263 ) ) ( not ( = ?auto_5256 ?auto_5273 ) ) ( not ( = ?auto_5256 ?auto_5270 ) ) ( not ( = ?auto_5256 ?auto_5267 ) ) ( not ( = ?auto_5256 ?auto_5274 ) ) ( not ( = ?auto_5256 ?auto_5272 ) ) ( not ( = ?auto_5256 ?auto_5269 ) ) ( not ( = ?auto_5256 ?auto_5266 ) ) ( not ( = ?auto_5264 ?auto_5275 ) ) ( not ( = ?auto_5264 ?auto_5268 ) ) ( not ( = ?auto_5262 ?auto_5265 ) ) ( not ( = ?auto_5262 ?auto_5271 ) ) ( not ( = ?auto_5263 ?auto_5273 ) ) ( not ( = ?auto_5263 ?auto_5270 ) ) ( not ( = ?auto_5263 ?auto_5267 ) ) ( not ( = ?auto_5263 ?auto_5274 ) ) ( not ( = ?auto_5263 ?auto_5272 ) ) ( not ( = ?auto_5263 ?auto_5269 ) ) ( not ( = ?auto_5263 ?auto_5266 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5250 ?auto_5251 ?auto_5252 ?auto_5253 ?auto_5254 ?auto_5255 ?auto_5258 ?auto_5257 )
      ( MAKE-1CRATE ?auto_5257 ?auto_5256 )
      ( MAKE-8CRATE-VERIFY ?auto_5250 ?auto_5251 ?auto_5252 ?auto_5253 ?auto_5254 ?auto_5255 ?auto_5258 ?auto_5257 ?auto_5256 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5278 - SURFACE
      ?auto_5279 - SURFACE
    )
    :vars
    (
      ?auto_5280 - HOIST
      ?auto_5281 - PLACE
      ?auto_5283 - PLACE
      ?auto_5284 - HOIST
      ?auto_5285 - SURFACE
      ?auto_5282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5280 ?auto_5281 ) ( SURFACE-AT ?auto_5278 ?auto_5281 ) ( CLEAR ?auto_5278 ) ( IS-CRATE ?auto_5279 ) ( AVAILABLE ?auto_5280 ) ( not ( = ?auto_5283 ?auto_5281 ) ) ( HOIST-AT ?auto_5284 ?auto_5283 ) ( AVAILABLE ?auto_5284 ) ( SURFACE-AT ?auto_5279 ?auto_5283 ) ( ON ?auto_5279 ?auto_5285 ) ( CLEAR ?auto_5279 ) ( TRUCK-AT ?auto_5282 ?auto_5281 ) ( not ( = ?auto_5278 ?auto_5279 ) ) ( not ( = ?auto_5278 ?auto_5285 ) ) ( not ( = ?auto_5279 ?auto_5285 ) ) ( not ( = ?auto_5280 ?auto_5284 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5282 ?auto_5281 ?auto_5283 )
      ( !LIFT ?auto_5284 ?auto_5279 ?auto_5285 ?auto_5283 )
      ( !LOAD ?auto_5284 ?auto_5279 ?auto_5282 ?auto_5283 )
      ( !DRIVE ?auto_5282 ?auto_5283 ?auto_5281 )
      ( !UNLOAD ?auto_5280 ?auto_5279 ?auto_5282 ?auto_5281 )
      ( !DROP ?auto_5280 ?auto_5279 ?auto_5278 ?auto_5281 )
      ( MAKE-1CRATE-VERIFY ?auto_5278 ?auto_5279 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_5296 - SURFACE
      ?auto_5297 - SURFACE
      ?auto_5298 - SURFACE
      ?auto_5299 - SURFACE
      ?auto_5300 - SURFACE
      ?auto_5301 - SURFACE
      ?auto_5304 - SURFACE
      ?auto_5303 - SURFACE
      ?auto_5302 - SURFACE
      ?auto_5305 - SURFACE
    )
    :vars
    (
      ?auto_5311 - HOIST
      ?auto_5310 - PLACE
      ?auto_5306 - PLACE
      ?auto_5309 - HOIST
      ?auto_5308 - SURFACE
      ?auto_5312 - PLACE
      ?auto_5320 - HOIST
      ?auto_5315 - SURFACE
      ?auto_5318 - PLACE
      ?auto_5316 - HOIST
      ?auto_5317 - SURFACE
      ?auto_5321 - PLACE
      ?auto_5323 - HOIST
      ?auto_5325 - SURFACE
      ?auto_5313 - SURFACE
      ?auto_5319 - SURFACE
      ?auto_5322 - SURFACE
      ?auto_5324 - SURFACE
      ?auto_5314 - SURFACE
      ?auto_5307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5311 ?auto_5310 ) ( IS-CRATE ?auto_5305 ) ( not ( = ?auto_5306 ?auto_5310 ) ) ( HOIST-AT ?auto_5309 ?auto_5306 ) ( AVAILABLE ?auto_5309 ) ( SURFACE-AT ?auto_5305 ?auto_5306 ) ( ON ?auto_5305 ?auto_5308 ) ( CLEAR ?auto_5305 ) ( not ( = ?auto_5302 ?auto_5305 ) ) ( not ( = ?auto_5302 ?auto_5308 ) ) ( not ( = ?auto_5305 ?auto_5308 ) ) ( not ( = ?auto_5311 ?auto_5309 ) ) ( IS-CRATE ?auto_5302 ) ( not ( = ?auto_5312 ?auto_5310 ) ) ( HOIST-AT ?auto_5320 ?auto_5312 ) ( AVAILABLE ?auto_5320 ) ( SURFACE-AT ?auto_5302 ?auto_5312 ) ( ON ?auto_5302 ?auto_5315 ) ( CLEAR ?auto_5302 ) ( not ( = ?auto_5303 ?auto_5302 ) ) ( not ( = ?auto_5303 ?auto_5315 ) ) ( not ( = ?auto_5302 ?auto_5315 ) ) ( not ( = ?auto_5311 ?auto_5320 ) ) ( IS-CRATE ?auto_5303 ) ( not ( = ?auto_5318 ?auto_5310 ) ) ( HOIST-AT ?auto_5316 ?auto_5318 ) ( SURFACE-AT ?auto_5303 ?auto_5318 ) ( ON ?auto_5303 ?auto_5317 ) ( CLEAR ?auto_5303 ) ( not ( = ?auto_5304 ?auto_5303 ) ) ( not ( = ?auto_5304 ?auto_5317 ) ) ( not ( = ?auto_5303 ?auto_5317 ) ) ( not ( = ?auto_5311 ?auto_5316 ) ) ( IS-CRATE ?auto_5304 ) ( not ( = ?auto_5321 ?auto_5310 ) ) ( HOIST-AT ?auto_5323 ?auto_5321 ) ( SURFACE-AT ?auto_5304 ?auto_5321 ) ( ON ?auto_5304 ?auto_5325 ) ( CLEAR ?auto_5304 ) ( not ( = ?auto_5301 ?auto_5304 ) ) ( not ( = ?auto_5301 ?auto_5325 ) ) ( not ( = ?auto_5304 ?auto_5325 ) ) ( not ( = ?auto_5311 ?auto_5323 ) ) ( IS-CRATE ?auto_5301 ) ( SURFACE-AT ?auto_5301 ?auto_5318 ) ( ON ?auto_5301 ?auto_5313 ) ( CLEAR ?auto_5301 ) ( not ( = ?auto_5300 ?auto_5301 ) ) ( not ( = ?auto_5300 ?auto_5313 ) ) ( not ( = ?auto_5301 ?auto_5313 ) ) ( IS-CRATE ?auto_5300 ) ( SURFACE-AT ?auto_5300 ?auto_5321 ) ( ON ?auto_5300 ?auto_5319 ) ( CLEAR ?auto_5300 ) ( not ( = ?auto_5299 ?auto_5300 ) ) ( not ( = ?auto_5299 ?auto_5319 ) ) ( not ( = ?auto_5300 ?auto_5319 ) ) ( IS-CRATE ?auto_5299 ) ( SURFACE-AT ?auto_5299 ?auto_5321 ) ( ON ?auto_5299 ?auto_5322 ) ( CLEAR ?auto_5299 ) ( not ( = ?auto_5298 ?auto_5299 ) ) ( not ( = ?auto_5298 ?auto_5322 ) ) ( not ( = ?auto_5299 ?auto_5322 ) ) ( IS-CRATE ?auto_5298 ) ( AVAILABLE ?auto_5316 ) ( SURFACE-AT ?auto_5298 ?auto_5318 ) ( ON ?auto_5298 ?auto_5324 ) ( CLEAR ?auto_5298 ) ( not ( = ?auto_5297 ?auto_5298 ) ) ( not ( = ?auto_5297 ?auto_5324 ) ) ( not ( = ?auto_5298 ?auto_5324 ) ) ( SURFACE-AT ?auto_5296 ?auto_5310 ) ( CLEAR ?auto_5296 ) ( IS-CRATE ?auto_5297 ) ( AVAILABLE ?auto_5311 ) ( AVAILABLE ?auto_5323 ) ( SURFACE-AT ?auto_5297 ?auto_5321 ) ( ON ?auto_5297 ?auto_5314 ) ( CLEAR ?auto_5297 ) ( TRUCK-AT ?auto_5307 ?auto_5310 ) ( not ( = ?auto_5296 ?auto_5297 ) ) ( not ( = ?auto_5296 ?auto_5314 ) ) ( not ( = ?auto_5297 ?auto_5314 ) ) ( not ( = ?auto_5296 ?auto_5298 ) ) ( not ( = ?auto_5296 ?auto_5324 ) ) ( not ( = ?auto_5298 ?auto_5314 ) ) ( not ( = ?auto_5318 ?auto_5321 ) ) ( not ( = ?auto_5316 ?auto_5323 ) ) ( not ( = ?auto_5324 ?auto_5314 ) ) ( not ( = ?auto_5296 ?auto_5299 ) ) ( not ( = ?auto_5296 ?auto_5322 ) ) ( not ( = ?auto_5297 ?auto_5299 ) ) ( not ( = ?auto_5297 ?auto_5322 ) ) ( not ( = ?auto_5299 ?auto_5324 ) ) ( not ( = ?auto_5299 ?auto_5314 ) ) ( not ( = ?auto_5322 ?auto_5324 ) ) ( not ( = ?auto_5322 ?auto_5314 ) ) ( not ( = ?auto_5296 ?auto_5300 ) ) ( not ( = ?auto_5296 ?auto_5319 ) ) ( not ( = ?auto_5297 ?auto_5300 ) ) ( not ( = ?auto_5297 ?auto_5319 ) ) ( not ( = ?auto_5298 ?auto_5300 ) ) ( not ( = ?auto_5298 ?auto_5319 ) ) ( not ( = ?auto_5300 ?auto_5322 ) ) ( not ( = ?auto_5300 ?auto_5324 ) ) ( not ( = ?auto_5300 ?auto_5314 ) ) ( not ( = ?auto_5319 ?auto_5322 ) ) ( not ( = ?auto_5319 ?auto_5324 ) ) ( not ( = ?auto_5319 ?auto_5314 ) ) ( not ( = ?auto_5296 ?auto_5301 ) ) ( not ( = ?auto_5296 ?auto_5313 ) ) ( not ( = ?auto_5297 ?auto_5301 ) ) ( not ( = ?auto_5297 ?auto_5313 ) ) ( not ( = ?auto_5298 ?auto_5301 ) ) ( not ( = ?auto_5298 ?auto_5313 ) ) ( not ( = ?auto_5299 ?auto_5301 ) ) ( not ( = ?auto_5299 ?auto_5313 ) ) ( not ( = ?auto_5301 ?auto_5319 ) ) ( not ( = ?auto_5301 ?auto_5322 ) ) ( not ( = ?auto_5301 ?auto_5324 ) ) ( not ( = ?auto_5301 ?auto_5314 ) ) ( not ( = ?auto_5313 ?auto_5319 ) ) ( not ( = ?auto_5313 ?auto_5322 ) ) ( not ( = ?auto_5313 ?auto_5324 ) ) ( not ( = ?auto_5313 ?auto_5314 ) ) ( not ( = ?auto_5296 ?auto_5304 ) ) ( not ( = ?auto_5296 ?auto_5325 ) ) ( not ( = ?auto_5297 ?auto_5304 ) ) ( not ( = ?auto_5297 ?auto_5325 ) ) ( not ( = ?auto_5298 ?auto_5304 ) ) ( not ( = ?auto_5298 ?auto_5325 ) ) ( not ( = ?auto_5299 ?auto_5304 ) ) ( not ( = ?auto_5299 ?auto_5325 ) ) ( not ( = ?auto_5300 ?auto_5304 ) ) ( not ( = ?auto_5300 ?auto_5325 ) ) ( not ( = ?auto_5304 ?auto_5313 ) ) ( not ( = ?auto_5304 ?auto_5319 ) ) ( not ( = ?auto_5304 ?auto_5322 ) ) ( not ( = ?auto_5304 ?auto_5324 ) ) ( not ( = ?auto_5304 ?auto_5314 ) ) ( not ( = ?auto_5325 ?auto_5313 ) ) ( not ( = ?auto_5325 ?auto_5319 ) ) ( not ( = ?auto_5325 ?auto_5322 ) ) ( not ( = ?auto_5325 ?auto_5324 ) ) ( not ( = ?auto_5325 ?auto_5314 ) ) ( not ( = ?auto_5296 ?auto_5303 ) ) ( not ( = ?auto_5296 ?auto_5317 ) ) ( not ( = ?auto_5297 ?auto_5303 ) ) ( not ( = ?auto_5297 ?auto_5317 ) ) ( not ( = ?auto_5298 ?auto_5303 ) ) ( not ( = ?auto_5298 ?auto_5317 ) ) ( not ( = ?auto_5299 ?auto_5303 ) ) ( not ( = ?auto_5299 ?auto_5317 ) ) ( not ( = ?auto_5300 ?auto_5303 ) ) ( not ( = ?auto_5300 ?auto_5317 ) ) ( not ( = ?auto_5301 ?auto_5303 ) ) ( not ( = ?auto_5301 ?auto_5317 ) ) ( not ( = ?auto_5303 ?auto_5325 ) ) ( not ( = ?auto_5303 ?auto_5313 ) ) ( not ( = ?auto_5303 ?auto_5319 ) ) ( not ( = ?auto_5303 ?auto_5322 ) ) ( not ( = ?auto_5303 ?auto_5324 ) ) ( not ( = ?auto_5303 ?auto_5314 ) ) ( not ( = ?auto_5317 ?auto_5325 ) ) ( not ( = ?auto_5317 ?auto_5313 ) ) ( not ( = ?auto_5317 ?auto_5319 ) ) ( not ( = ?auto_5317 ?auto_5322 ) ) ( not ( = ?auto_5317 ?auto_5324 ) ) ( not ( = ?auto_5317 ?auto_5314 ) ) ( not ( = ?auto_5296 ?auto_5302 ) ) ( not ( = ?auto_5296 ?auto_5315 ) ) ( not ( = ?auto_5297 ?auto_5302 ) ) ( not ( = ?auto_5297 ?auto_5315 ) ) ( not ( = ?auto_5298 ?auto_5302 ) ) ( not ( = ?auto_5298 ?auto_5315 ) ) ( not ( = ?auto_5299 ?auto_5302 ) ) ( not ( = ?auto_5299 ?auto_5315 ) ) ( not ( = ?auto_5300 ?auto_5302 ) ) ( not ( = ?auto_5300 ?auto_5315 ) ) ( not ( = ?auto_5301 ?auto_5302 ) ) ( not ( = ?auto_5301 ?auto_5315 ) ) ( not ( = ?auto_5304 ?auto_5302 ) ) ( not ( = ?auto_5304 ?auto_5315 ) ) ( not ( = ?auto_5302 ?auto_5317 ) ) ( not ( = ?auto_5302 ?auto_5325 ) ) ( not ( = ?auto_5302 ?auto_5313 ) ) ( not ( = ?auto_5302 ?auto_5319 ) ) ( not ( = ?auto_5302 ?auto_5322 ) ) ( not ( = ?auto_5302 ?auto_5324 ) ) ( not ( = ?auto_5302 ?auto_5314 ) ) ( not ( = ?auto_5312 ?auto_5318 ) ) ( not ( = ?auto_5312 ?auto_5321 ) ) ( not ( = ?auto_5320 ?auto_5316 ) ) ( not ( = ?auto_5320 ?auto_5323 ) ) ( not ( = ?auto_5315 ?auto_5317 ) ) ( not ( = ?auto_5315 ?auto_5325 ) ) ( not ( = ?auto_5315 ?auto_5313 ) ) ( not ( = ?auto_5315 ?auto_5319 ) ) ( not ( = ?auto_5315 ?auto_5322 ) ) ( not ( = ?auto_5315 ?auto_5324 ) ) ( not ( = ?auto_5315 ?auto_5314 ) ) ( not ( = ?auto_5296 ?auto_5305 ) ) ( not ( = ?auto_5296 ?auto_5308 ) ) ( not ( = ?auto_5297 ?auto_5305 ) ) ( not ( = ?auto_5297 ?auto_5308 ) ) ( not ( = ?auto_5298 ?auto_5305 ) ) ( not ( = ?auto_5298 ?auto_5308 ) ) ( not ( = ?auto_5299 ?auto_5305 ) ) ( not ( = ?auto_5299 ?auto_5308 ) ) ( not ( = ?auto_5300 ?auto_5305 ) ) ( not ( = ?auto_5300 ?auto_5308 ) ) ( not ( = ?auto_5301 ?auto_5305 ) ) ( not ( = ?auto_5301 ?auto_5308 ) ) ( not ( = ?auto_5304 ?auto_5305 ) ) ( not ( = ?auto_5304 ?auto_5308 ) ) ( not ( = ?auto_5303 ?auto_5305 ) ) ( not ( = ?auto_5303 ?auto_5308 ) ) ( not ( = ?auto_5305 ?auto_5315 ) ) ( not ( = ?auto_5305 ?auto_5317 ) ) ( not ( = ?auto_5305 ?auto_5325 ) ) ( not ( = ?auto_5305 ?auto_5313 ) ) ( not ( = ?auto_5305 ?auto_5319 ) ) ( not ( = ?auto_5305 ?auto_5322 ) ) ( not ( = ?auto_5305 ?auto_5324 ) ) ( not ( = ?auto_5305 ?auto_5314 ) ) ( not ( = ?auto_5306 ?auto_5312 ) ) ( not ( = ?auto_5306 ?auto_5318 ) ) ( not ( = ?auto_5306 ?auto_5321 ) ) ( not ( = ?auto_5309 ?auto_5320 ) ) ( not ( = ?auto_5309 ?auto_5316 ) ) ( not ( = ?auto_5309 ?auto_5323 ) ) ( not ( = ?auto_5308 ?auto_5315 ) ) ( not ( = ?auto_5308 ?auto_5317 ) ) ( not ( = ?auto_5308 ?auto_5325 ) ) ( not ( = ?auto_5308 ?auto_5313 ) ) ( not ( = ?auto_5308 ?auto_5319 ) ) ( not ( = ?auto_5308 ?auto_5322 ) ) ( not ( = ?auto_5308 ?auto_5324 ) ) ( not ( = ?auto_5308 ?auto_5314 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5296 ?auto_5297 ?auto_5298 ?auto_5299 ?auto_5300 ?auto_5301 ?auto_5304 ?auto_5303 ?auto_5302 )
      ( MAKE-1CRATE ?auto_5302 ?auto_5305 )
      ( MAKE-9CRATE-VERIFY ?auto_5296 ?auto_5297 ?auto_5298 ?auto_5299 ?auto_5300 ?auto_5301 ?auto_5304 ?auto_5303 ?auto_5302 ?auto_5305 ) )
  )

)

