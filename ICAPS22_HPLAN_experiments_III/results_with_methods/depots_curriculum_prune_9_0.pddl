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
      ?auto_5052 - PLACE
      ?auto_5054 - PLACE
      ?auto_5056 - HOIST
      ?auto_5057 - SURFACE
      ?auto_5060 - PLACE
      ?auto_5058 - HOIST
      ?auto_5059 - SURFACE
      ?auto_5055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5053 ?auto_5052 ) ( IS-CRATE ?auto_5051 ) ( not ( = ?auto_5054 ?auto_5052 ) ) ( HOIST-AT ?auto_5056 ?auto_5054 ) ( AVAILABLE ?auto_5056 ) ( SURFACE-AT ?auto_5051 ?auto_5054 ) ( ON ?auto_5051 ?auto_5057 ) ( CLEAR ?auto_5051 ) ( not ( = ?auto_5050 ?auto_5051 ) ) ( not ( = ?auto_5050 ?auto_5057 ) ) ( not ( = ?auto_5051 ?auto_5057 ) ) ( not ( = ?auto_5053 ?auto_5056 ) ) ( SURFACE-AT ?auto_5049 ?auto_5052 ) ( CLEAR ?auto_5049 ) ( IS-CRATE ?auto_5050 ) ( AVAILABLE ?auto_5053 ) ( not ( = ?auto_5060 ?auto_5052 ) ) ( HOIST-AT ?auto_5058 ?auto_5060 ) ( AVAILABLE ?auto_5058 ) ( SURFACE-AT ?auto_5050 ?auto_5060 ) ( ON ?auto_5050 ?auto_5059 ) ( CLEAR ?auto_5050 ) ( TRUCK-AT ?auto_5055 ?auto_5052 ) ( not ( = ?auto_5049 ?auto_5050 ) ) ( not ( = ?auto_5049 ?auto_5059 ) ) ( not ( = ?auto_5050 ?auto_5059 ) ) ( not ( = ?auto_5053 ?auto_5058 ) ) ( not ( = ?auto_5049 ?auto_5051 ) ) ( not ( = ?auto_5049 ?auto_5057 ) ) ( not ( = ?auto_5051 ?auto_5059 ) ) ( not ( = ?auto_5054 ?auto_5060 ) ) ( not ( = ?auto_5056 ?auto_5058 ) ) ( not ( = ?auto_5057 ?auto_5059 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5049 ?auto_5050 )
      ( MAKE-1CRATE ?auto_5050 ?auto_5051 )
      ( MAKE-2CRATE-VERIFY ?auto_5049 ?auto_5050 ?auto_5051 ) )
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
      ?auto_5079 - HOIST
      ?auto_5082 - PLACE
      ?auto_5084 - PLACE
      ?auto_5080 - HOIST
      ?auto_5083 - SURFACE
      ?auto_5085 - PLACE
      ?auto_5086 - HOIST
      ?auto_5088 - SURFACE
      ?auto_5087 - SURFACE
      ?auto_5081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5079 ?auto_5082 ) ( IS-CRATE ?auto_5078 ) ( not ( = ?auto_5084 ?auto_5082 ) ) ( HOIST-AT ?auto_5080 ?auto_5084 ) ( SURFACE-AT ?auto_5078 ?auto_5084 ) ( ON ?auto_5078 ?auto_5083 ) ( CLEAR ?auto_5078 ) ( not ( = ?auto_5077 ?auto_5078 ) ) ( not ( = ?auto_5077 ?auto_5083 ) ) ( not ( = ?auto_5078 ?auto_5083 ) ) ( not ( = ?auto_5079 ?auto_5080 ) ) ( IS-CRATE ?auto_5077 ) ( not ( = ?auto_5085 ?auto_5082 ) ) ( HOIST-AT ?auto_5086 ?auto_5085 ) ( AVAILABLE ?auto_5086 ) ( SURFACE-AT ?auto_5077 ?auto_5085 ) ( ON ?auto_5077 ?auto_5088 ) ( CLEAR ?auto_5077 ) ( not ( = ?auto_5076 ?auto_5077 ) ) ( not ( = ?auto_5076 ?auto_5088 ) ) ( not ( = ?auto_5077 ?auto_5088 ) ) ( not ( = ?auto_5079 ?auto_5086 ) ) ( SURFACE-AT ?auto_5075 ?auto_5082 ) ( CLEAR ?auto_5075 ) ( IS-CRATE ?auto_5076 ) ( AVAILABLE ?auto_5079 ) ( AVAILABLE ?auto_5080 ) ( SURFACE-AT ?auto_5076 ?auto_5084 ) ( ON ?auto_5076 ?auto_5087 ) ( CLEAR ?auto_5076 ) ( TRUCK-AT ?auto_5081 ?auto_5082 ) ( not ( = ?auto_5075 ?auto_5076 ) ) ( not ( = ?auto_5075 ?auto_5087 ) ) ( not ( = ?auto_5076 ?auto_5087 ) ) ( not ( = ?auto_5075 ?auto_5077 ) ) ( not ( = ?auto_5075 ?auto_5088 ) ) ( not ( = ?auto_5077 ?auto_5087 ) ) ( not ( = ?auto_5085 ?auto_5084 ) ) ( not ( = ?auto_5086 ?auto_5080 ) ) ( not ( = ?auto_5088 ?auto_5087 ) ) ( not ( = ?auto_5075 ?auto_5078 ) ) ( not ( = ?auto_5075 ?auto_5083 ) ) ( not ( = ?auto_5076 ?auto_5078 ) ) ( not ( = ?auto_5076 ?auto_5083 ) ) ( not ( = ?auto_5078 ?auto_5088 ) ) ( not ( = ?auto_5078 ?auto_5087 ) ) ( not ( = ?auto_5083 ?auto_5088 ) ) ( not ( = ?auto_5083 ?auto_5087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5075 ?auto_5076 ?auto_5077 )
      ( MAKE-1CRATE ?auto_5077 ?auto_5078 )
      ( MAKE-3CRATE-VERIFY ?auto_5075 ?auto_5076 ?auto_5077 ?auto_5078 ) )
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
      ?auto_5110 - HOIST
      ?auto_5114 - PLACE
      ?auto_5109 - PLACE
      ?auto_5112 - HOIST
      ?auto_5113 - SURFACE
      ?auto_5119 - SURFACE
      ?auto_5116 - PLACE
      ?auto_5118 - HOIST
      ?auto_5117 - SURFACE
      ?auto_5115 - SURFACE
      ?auto_5111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5110 ?auto_5114 ) ( IS-CRATE ?auto_5108 ) ( not ( = ?auto_5109 ?auto_5114 ) ) ( HOIST-AT ?auto_5112 ?auto_5109 ) ( SURFACE-AT ?auto_5108 ?auto_5109 ) ( ON ?auto_5108 ?auto_5113 ) ( CLEAR ?auto_5108 ) ( not ( = ?auto_5107 ?auto_5108 ) ) ( not ( = ?auto_5107 ?auto_5113 ) ) ( not ( = ?auto_5108 ?auto_5113 ) ) ( not ( = ?auto_5110 ?auto_5112 ) ) ( IS-CRATE ?auto_5107 ) ( SURFACE-AT ?auto_5107 ?auto_5109 ) ( ON ?auto_5107 ?auto_5119 ) ( CLEAR ?auto_5107 ) ( not ( = ?auto_5106 ?auto_5107 ) ) ( not ( = ?auto_5106 ?auto_5119 ) ) ( not ( = ?auto_5107 ?auto_5119 ) ) ( IS-CRATE ?auto_5106 ) ( not ( = ?auto_5116 ?auto_5114 ) ) ( HOIST-AT ?auto_5118 ?auto_5116 ) ( AVAILABLE ?auto_5118 ) ( SURFACE-AT ?auto_5106 ?auto_5116 ) ( ON ?auto_5106 ?auto_5117 ) ( CLEAR ?auto_5106 ) ( not ( = ?auto_5105 ?auto_5106 ) ) ( not ( = ?auto_5105 ?auto_5117 ) ) ( not ( = ?auto_5106 ?auto_5117 ) ) ( not ( = ?auto_5110 ?auto_5118 ) ) ( SURFACE-AT ?auto_5104 ?auto_5114 ) ( CLEAR ?auto_5104 ) ( IS-CRATE ?auto_5105 ) ( AVAILABLE ?auto_5110 ) ( AVAILABLE ?auto_5112 ) ( SURFACE-AT ?auto_5105 ?auto_5109 ) ( ON ?auto_5105 ?auto_5115 ) ( CLEAR ?auto_5105 ) ( TRUCK-AT ?auto_5111 ?auto_5114 ) ( not ( = ?auto_5104 ?auto_5105 ) ) ( not ( = ?auto_5104 ?auto_5115 ) ) ( not ( = ?auto_5105 ?auto_5115 ) ) ( not ( = ?auto_5104 ?auto_5106 ) ) ( not ( = ?auto_5104 ?auto_5117 ) ) ( not ( = ?auto_5106 ?auto_5115 ) ) ( not ( = ?auto_5116 ?auto_5109 ) ) ( not ( = ?auto_5118 ?auto_5112 ) ) ( not ( = ?auto_5117 ?auto_5115 ) ) ( not ( = ?auto_5104 ?auto_5107 ) ) ( not ( = ?auto_5104 ?auto_5119 ) ) ( not ( = ?auto_5105 ?auto_5107 ) ) ( not ( = ?auto_5105 ?auto_5119 ) ) ( not ( = ?auto_5107 ?auto_5117 ) ) ( not ( = ?auto_5107 ?auto_5115 ) ) ( not ( = ?auto_5119 ?auto_5117 ) ) ( not ( = ?auto_5119 ?auto_5115 ) ) ( not ( = ?auto_5104 ?auto_5108 ) ) ( not ( = ?auto_5104 ?auto_5113 ) ) ( not ( = ?auto_5105 ?auto_5108 ) ) ( not ( = ?auto_5105 ?auto_5113 ) ) ( not ( = ?auto_5106 ?auto_5108 ) ) ( not ( = ?auto_5106 ?auto_5113 ) ) ( not ( = ?auto_5108 ?auto_5119 ) ) ( not ( = ?auto_5108 ?auto_5117 ) ) ( not ( = ?auto_5108 ?auto_5115 ) ) ( not ( = ?auto_5113 ?auto_5119 ) ) ( not ( = ?auto_5113 ?auto_5117 ) ) ( not ( = ?auto_5113 ?auto_5115 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5104 ?auto_5105 ?auto_5106 ?auto_5107 )
      ( MAKE-1CRATE ?auto_5107 ?auto_5108 )
      ( MAKE-4CRATE-VERIFY ?auto_5104 ?auto_5105 ?auto_5106 ?auto_5107 ?auto_5108 ) )
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
      ?auto_5146 - HOIST
      ?auto_5144 - PLACE
      ?auto_5145 - PLACE
      ?auto_5147 - HOIST
      ?auto_5143 - SURFACE
      ?auto_5150 - PLACE
      ?auto_5148 - HOIST
      ?auto_5151 - SURFACE
      ?auto_5152 - SURFACE
      ?auto_5149 - SURFACE
      ?auto_5153 - SURFACE
      ?auto_5142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5146 ?auto_5144 ) ( IS-CRATE ?auto_5141 ) ( not ( = ?auto_5145 ?auto_5144 ) ) ( HOIST-AT ?auto_5147 ?auto_5145 ) ( SURFACE-AT ?auto_5141 ?auto_5145 ) ( ON ?auto_5141 ?auto_5143 ) ( CLEAR ?auto_5141 ) ( not ( = ?auto_5140 ?auto_5141 ) ) ( not ( = ?auto_5140 ?auto_5143 ) ) ( not ( = ?auto_5141 ?auto_5143 ) ) ( not ( = ?auto_5146 ?auto_5147 ) ) ( IS-CRATE ?auto_5140 ) ( not ( = ?auto_5150 ?auto_5144 ) ) ( HOIST-AT ?auto_5148 ?auto_5150 ) ( SURFACE-AT ?auto_5140 ?auto_5150 ) ( ON ?auto_5140 ?auto_5151 ) ( CLEAR ?auto_5140 ) ( not ( = ?auto_5139 ?auto_5140 ) ) ( not ( = ?auto_5139 ?auto_5151 ) ) ( not ( = ?auto_5140 ?auto_5151 ) ) ( not ( = ?auto_5146 ?auto_5148 ) ) ( IS-CRATE ?auto_5139 ) ( SURFACE-AT ?auto_5139 ?auto_5150 ) ( ON ?auto_5139 ?auto_5152 ) ( CLEAR ?auto_5139 ) ( not ( = ?auto_5138 ?auto_5139 ) ) ( not ( = ?auto_5138 ?auto_5152 ) ) ( not ( = ?auto_5139 ?auto_5152 ) ) ( IS-CRATE ?auto_5138 ) ( AVAILABLE ?auto_5147 ) ( SURFACE-AT ?auto_5138 ?auto_5145 ) ( ON ?auto_5138 ?auto_5149 ) ( CLEAR ?auto_5138 ) ( not ( = ?auto_5137 ?auto_5138 ) ) ( not ( = ?auto_5137 ?auto_5149 ) ) ( not ( = ?auto_5138 ?auto_5149 ) ) ( SURFACE-AT ?auto_5136 ?auto_5144 ) ( CLEAR ?auto_5136 ) ( IS-CRATE ?auto_5137 ) ( AVAILABLE ?auto_5146 ) ( AVAILABLE ?auto_5148 ) ( SURFACE-AT ?auto_5137 ?auto_5150 ) ( ON ?auto_5137 ?auto_5153 ) ( CLEAR ?auto_5137 ) ( TRUCK-AT ?auto_5142 ?auto_5144 ) ( not ( = ?auto_5136 ?auto_5137 ) ) ( not ( = ?auto_5136 ?auto_5153 ) ) ( not ( = ?auto_5137 ?auto_5153 ) ) ( not ( = ?auto_5136 ?auto_5138 ) ) ( not ( = ?auto_5136 ?auto_5149 ) ) ( not ( = ?auto_5138 ?auto_5153 ) ) ( not ( = ?auto_5145 ?auto_5150 ) ) ( not ( = ?auto_5147 ?auto_5148 ) ) ( not ( = ?auto_5149 ?auto_5153 ) ) ( not ( = ?auto_5136 ?auto_5139 ) ) ( not ( = ?auto_5136 ?auto_5152 ) ) ( not ( = ?auto_5137 ?auto_5139 ) ) ( not ( = ?auto_5137 ?auto_5152 ) ) ( not ( = ?auto_5139 ?auto_5149 ) ) ( not ( = ?auto_5139 ?auto_5153 ) ) ( not ( = ?auto_5152 ?auto_5149 ) ) ( not ( = ?auto_5152 ?auto_5153 ) ) ( not ( = ?auto_5136 ?auto_5140 ) ) ( not ( = ?auto_5136 ?auto_5151 ) ) ( not ( = ?auto_5137 ?auto_5140 ) ) ( not ( = ?auto_5137 ?auto_5151 ) ) ( not ( = ?auto_5138 ?auto_5140 ) ) ( not ( = ?auto_5138 ?auto_5151 ) ) ( not ( = ?auto_5140 ?auto_5152 ) ) ( not ( = ?auto_5140 ?auto_5149 ) ) ( not ( = ?auto_5140 ?auto_5153 ) ) ( not ( = ?auto_5151 ?auto_5152 ) ) ( not ( = ?auto_5151 ?auto_5149 ) ) ( not ( = ?auto_5151 ?auto_5153 ) ) ( not ( = ?auto_5136 ?auto_5141 ) ) ( not ( = ?auto_5136 ?auto_5143 ) ) ( not ( = ?auto_5137 ?auto_5141 ) ) ( not ( = ?auto_5137 ?auto_5143 ) ) ( not ( = ?auto_5138 ?auto_5141 ) ) ( not ( = ?auto_5138 ?auto_5143 ) ) ( not ( = ?auto_5139 ?auto_5141 ) ) ( not ( = ?auto_5139 ?auto_5143 ) ) ( not ( = ?auto_5141 ?auto_5151 ) ) ( not ( = ?auto_5141 ?auto_5152 ) ) ( not ( = ?auto_5141 ?auto_5149 ) ) ( not ( = ?auto_5141 ?auto_5153 ) ) ( not ( = ?auto_5143 ?auto_5151 ) ) ( not ( = ?auto_5143 ?auto_5152 ) ) ( not ( = ?auto_5143 ?auto_5149 ) ) ( not ( = ?auto_5143 ?auto_5153 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5136 ?auto_5137 ?auto_5138 ?auto_5139 ?auto_5140 )
      ( MAKE-1CRATE ?auto_5140 ?auto_5141 )
      ( MAKE-5CRATE-VERIFY ?auto_5136 ?auto_5137 ?auto_5138 ?auto_5139 ?auto_5140 ?auto_5141 ) )
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
      ?auto_5178 - HOIST
      ?auto_5181 - PLACE
      ?auto_5182 - PLACE
      ?auto_5180 - HOIST
      ?auto_5179 - SURFACE
      ?auto_5184 - PLACE
      ?auto_5185 - HOIST
      ?auto_5189 - SURFACE
      ?auto_5187 - SURFACE
      ?auto_5190 - SURFACE
      ?auto_5186 - SURFACE
      ?auto_5188 - SURFACE
      ?auto_5183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5178 ?auto_5181 ) ( IS-CRATE ?auto_5177 ) ( not ( = ?auto_5182 ?auto_5181 ) ) ( HOIST-AT ?auto_5180 ?auto_5182 ) ( SURFACE-AT ?auto_5177 ?auto_5182 ) ( ON ?auto_5177 ?auto_5179 ) ( CLEAR ?auto_5177 ) ( not ( = ?auto_5176 ?auto_5177 ) ) ( not ( = ?auto_5176 ?auto_5179 ) ) ( not ( = ?auto_5177 ?auto_5179 ) ) ( not ( = ?auto_5178 ?auto_5180 ) ) ( IS-CRATE ?auto_5176 ) ( not ( = ?auto_5184 ?auto_5181 ) ) ( HOIST-AT ?auto_5185 ?auto_5184 ) ( SURFACE-AT ?auto_5176 ?auto_5184 ) ( ON ?auto_5176 ?auto_5189 ) ( CLEAR ?auto_5176 ) ( not ( = ?auto_5175 ?auto_5176 ) ) ( not ( = ?auto_5175 ?auto_5189 ) ) ( not ( = ?auto_5176 ?auto_5189 ) ) ( not ( = ?auto_5178 ?auto_5185 ) ) ( IS-CRATE ?auto_5175 ) ( SURFACE-AT ?auto_5175 ?auto_5182 ) ( ON ?auto_5175 ?auto_5187 ) ( CLEAR ?auto_5175 ) ( not ( = ?auto_5174 ?auto_5175 ) ) ( not ( = ?auto_5174 ?auto_5187 ) ) ( not ( = ?auto_5175 ?auto_5187 ) ) ( IS-CRATE ?auto_5174 ) ( SURFACE-AT ?auto_5174 ?auto_5182 ) ( ON ?auto_5174 ?auto_5190 ) ( CLEAR ?auto_5174 ) ( not ( = ?auto_5173 ?auto_5174 ) ) ( not ( = ?auto_5173 ?auto_5190 ) ) ( not ( = ?auto_5174 ?auto_5190 ) ) ( IS-CRATE ?auto_5173 ) ( AVAILABLE ?auto_5185 ) ( SURFACE-AT ?auto_5173 ?auto_5184 ) ( ON ?auto_5173 ?auto_5186 ) ( CLEAR ?auto_5173 ) ( not ( = ?auto_5172 ?auto_5173 ) ) ( not ( = ?auto_5172 ?auto_5186 ) ) ( not ( = ?auto_5173 ?auto_5186 ) ) ( SURFACE-AT ?auto_5171 ?auto_5181 ) ( CLEAR ?auto_5171 ) ( IS-CRATE ?auto_5172 ) ( AVAILABLE ?auto_5178 ) ( AVAILABLE ?auto_5180 ) ( SURFACE-AT ?auto_5172 ?auto_5182 ) ( ON ?auto_5172 ?auto_5188 ) ( CLEAR ?auto_5172 ) ( TRUCK-AT ?auto_5183 ?auto_5181 ) ( not ( = ?auto_5171 ?auto_5172 ) ) ( not ( = ?auto_5171 ?auto_5188 ) ) ( not ( = ?auto_5172 ?auto_5188 ) ) ( not ( = ?auto_5171 ?auto_5173 ) ) ( not ( = ?auto_5171 ?auto_5186 ) ) ( not ( = ?auto_5173 ?auto_5188 ) ) ( not ( = ?auto_5184 ?auto_5182 ) ) ( not ( = ?auto_5185 ?auto_5180 ) ) ( not ( = ?auto_5186 ?auto_5188 ) ) ( not ( = ?auto_5171 ?auto_5174 ) ) ( not ( = ?auto_5171 ?auto_5190 ) ) ( not ( = ?auto_5172 ?auto_5174 ) ) ( not ( = ?auto_5172 ?auto_5190 ) ) ( not ( = ?auto_5174 ?auto_5186 ) ) ( not ( = ?auto_5174 ?auto_5188 ) ) ( not ( = ?auto_5190 ?auto_5186 ) ) ( not ( = ?auto_5190 ?auto_5188 ) ) ( not ( = ?auto_5171 ?auto_5175 ) ) ( not ( = ?auto_5171 ?auto_5187 ) ) ( not ( = ?auto_5172 ?auto_5175 ) ) ( not ( = ?auto_5172 ?auto_5187 ) ) ( not ( = ?auto_5173 ?auto_5175 ) ) ( not ( = ?auto_5173 ?auto_5187 ) ) ( not ( = ?auto_5175 ?auto_5190 ) ) ( not ( = ?auto_5175 ?auto_5186 ) ) ( not ( = ?auto_5175 ?auto_5188 ) ) ( not ( = ?auto_5187 ?auto_5190 ) ) ( not ( = ?auto_5187 ?auto_5186 ) ) ( not ( = ?auto_5187 ?auto_5188 ) ) ( not ( = ?auto_5171 ?auto_5176 ) ) ( not ( = ?auto_5171 ?auto_5189 ) ) ( not ( = ?auto_5172 ?auto_5176 ) ) ( not ( = ?auto_5172 ?auto_5189 ) ) ( not ( = ?auto_5173 ?auto_5176 ) ) ( not ( = ?auto_5173 ?auto_5189 ) ) ( not ( = ?auto_5174 ?auto_5176 ) ) ( not ( = ?auto_5174 ?auto_5189 ) ) ( not ( = ?auto_5176 ?auto_5187 ) ) ( not ( = ?auto_5176 ?auto_5190 ) ) ( not ( = ?auto_5176 ?auto_5186 ) ) ( not ( = ?auto_5176 ?auto_5188 ) ) ( not ( = ?auto_5189 ?auto_5187 ) ) ( not ( = ?auto_5189 ?auto_5190 ) ) ( not ( = ?auto_5189 ?auto_5186 ) ) ( not ( = ?auto_5189 ?auto_5188 ) ) ( not ( = ?auto_5171 ?auto_5177 ) ) ( not ( = ?auto_5171 ?auto_5179 ) ) ( not ( = ?auto_5172 ?auto_5177 ) ) ( not ( = ?auto_5172 ?auto_5179 ) ) ( not ( = ?auto_5173 ?auto_5177 ) ) ( not ( = ?auto_5173 ?auto_5179 ) ) ( not ( = ?auto_5174 ?auto_5177 ) ) ( not ( = ?auto_5174 ?auto_5179 ) ) ( not ( = ?auto_5175 ?auto_5177 ) ) ( not ( = ?auto_5175 ?auto_5179 ) ) ( not ( = ?auto_5177 ?auto_5189 ) ) ( not ( = ?auto_5177 ?auto_5187 ) ) ( not ( = ?auto_5177 ?auto_5190 ) ) ( not ( = ?auto_5177 ?auto_5186 ) ) ( not ( = ?auto_5177 ?auto_5188 ) ) ( not ( = ?auto_5179 ?auto_5189 ) ) ( not ( = ?auto_5179 ?auto_5187 ) ) ( not ( = ?auto_5179 ?auto_5190 ) ) ( not ( = ?auto_5179 ?auto_5186 ) ) ( not ( = ?auto_5179 ?auto_5188 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5171 ?auto_5172 ?auto_5173 ?auto_5174 ?auto_5175 ?auto_5176 )
      ( MAKE-1CRATE ?auto_5176 ?auto_5177 )
      ( MAKE-6CRATE-VERIFY ?auto_5171 ?auto_5172 ?auto_5173 ?auto_5174 ?auto_5175 ?auto_5176 ?auto_5177 ) )
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
      ?auto_5215 - SURFACE
      ?auto_5216 - SURFACE
    )
    :vars
    (
      ?auto_5222 - HOIST
      ?auto_5221 - PLACE
      ?auto_5217 - PLACE
      ?auto_5218 - HOIST
      ?auto_5219 - SURFACE
      ?auto_5226 - PLACE
      ?auto_5223 - HOIST
      ?auto_5227 - SURFACE
      ?auto_5229 - SURFACE
      ?auto_5230 - SURFACE
      ?auto_5228 - SURFACE
      ?auto_5224 - SURFACE
      ?auto_5225 - SURFACE
      ?auto_5220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5222 ?auto_5221 ) ( IS-CRATE ?auto_5216 ) ( not ( = ?auto_5217 ?auto_5221 ) ) ( HOIST-AT ?auto_5218 ?auto_5217 ) ( SURFACE-AT ?auto_5216 ?auto_5217 ) ( ON ?auto_5216 ?auto_5219 ) ( CLEAR ?auto_5216 ) ( not ( = ?auto_5215 ?auto_5216 ) ) ( not ( = ?auto_5215 ?auto_5219 ) ) ( not ( = ?auto_5216 ?auto_5219 ) ) ( not ( = ?auto_5222 ?auto_5218 ) ) ( IS-CRATE ?auto_5215 ) ( not ( = ?auto_5226 ?auto_5221 ) ) ( HOIST-AT ?auto_5223 ?auto_5226 ) ( SURFACE-AT ?auto_5215 ?auto_5226 ) ( ON ?auto_5215 ?auto_5227 ) ( CLEAR ?auto_5215 ) ( not ( = ?auto_5214 ?auto_5215 ) ) ( not ( = ?auto_5214 ?auto_5227 ) ) ( not ( = ?auto_5215 ?auto_5227 ) ) ( not ( = ?auto_5222 ?auto_5223 ) ) ( IS-CRATE ?auto_5214 ) ( SURFACE-AT ?auto_5214 ?auto_5217 ) ( ON ?auto_5214 ?auto_5229 ) ( CLEAR ?auto_5214 ) ( not ( = ?auto_5213 ?auto_5214 ) ) ( not ( = ?auto_5213 ?auto_5229 ) ) ( not ( = ?auto_5214 ?auto_5229 ) ) ( IS-CRATE ?auto_5213 ) ( SURFACE-AT ?auto_5213 ?auto_5226 ) ( ON ?auto_5213 ?auto_5230 ) ( CLEAR ?auto_5213 ) ( not ( = ?auto_5212 ?auto_5213 ) ) ( not ( = ?auto_5212 ?auto_5230 ) ) ( not ( = ?auto_5213 ?auto_5230 ) ) ( IS-CRATE ?auto_5212 ) ( SURFACE-AT ?auto_5212 ?auto_5226 ) ( ON ?auto_5212 ?auto_5228 ) ( CLEAR ?auto_5212 ) ( not ( = ?auto_5211 ?auto_5212 ) ) ( not ( = ?auto_5211 ?auto_5228 ) ) ( not ( = ?auto_5212 ?auto_5228 ) ) ( IS-CRATE ?auto_5211 ) ( AVAILABLE ?auto_5218 ) ( SURFACE-AT ?auto_5211 ?auto_5217 ) ( ON ?auto_5211 ?auto_5224 ) ( CLEAR ?auto_5211 ) ( not ( = ?auto_5210 ?auto_5211 ) ) ( not ( = ?auto_5210 ?auto_5224 ) ) ( not ( = ?auto_5211 ?auto_5224 ) ) ( SURFACE-AT ?auto_5209 ?auto_5221 ) ( CLEAR ?auto_5209 ) ( IS-CRATE ?auto_5210 ) ( AVAILABLE ?auto_5222 ) ( AVAILABLE ?auto_5223 ) ( SURFACE-AT ?auto_5210 ?auto_5226 ) ( ON ?auto_5210 ?auto_5225 ) ( CLEAR ?auto_5210 ) ( TRUCK-AT ?auto_5220 ?auto_5221 ) ( not ( = ?auto_5209 ?auto_5210 ) ) ( not ( = ?auto_5209 ?auto_5225 ) ) ( not ( = ?auto_5210 ?auto_5225 ) ) ( not ( = ?auto_5209 ?auto_5211 ) ) ( not ( = ?auto_5209 ?auto_5224 ) ) ( not ( = ?auto_5211 ?auto_5225 ) ) ( not ( = ?auto_5217 ?auto_5226 ) ) ( not ( = ?auto_5218 ?auto_5223 ) ) ( not ( = ?auto_5224 ?auto_5225 ) ) ( not ( = ?auto_5209 ?auto_5212 ) ) ( not ( = ?auto_5209 ?auto_5228 ) ) ( not ( = ?auto_5210 ?auto_5212 ) ) ( not ( = ?auto_5210 ?auto_5228 ) ) ( not ( = ?auto_5212 ?auto_5224 ) ) ( not ( = ?auto_5212 ?auto_5225 ) ) ( not ( = ?auto_5228 ?auto_5224 ) ) ( not ( = ?auto_5228 ?auto_5225 ) ) ( not ( = ?auto_5209 ?auto_5213 ) ) ( not ( = ?auto_5209 ?auto_5230 ) ) ( not ( = ?auto_5210 ?auto_5213 ) ) ( not ( = ?auto_5210 ?auto_5230 ) ) ( not ( = ?auto_5211 ?auto_5213 ) ) ( not ( = ?auto_5211 ?auto_5230 ) ) ( not ( = ?auto_5213 ?auto_5228 ) ) ( not ( = ?auto_5213 ?auto_5224 ) ) ( not ( = ?auto_5213 ?auto_5225 ) ) ( not ( = ?auto_5230 ?auto_5228 ) ) ( not ( = ?auto_5230 ?auto_5224 ) ) ( not ( = ?auto_5230 ?auto_5225 ) ) ( not ( = ?auto_5209 ?auto_5214 ) ) ( not ( = ?auto_5209 ?auto_5229 ) ) ( not ( = ?auto_5210 ?auto_5214 ) ) ( not ( = ?auto_5210 ?auto_5229 ) ) ( not ( = ?auto_5211 ?auto_5214 ) ) ( not ( = ?auto_5211 ?auto_5229 ) ) ( not ( = ?auto_5212 ?auto_5214 ) ) ( not ( = ?auto_5212 ?auto_5229 ) ) ( not ( = ?auto_5214 ?auto_5230 ) ) ( not ( = ?auto_5214 ?auto_5228 ) ) ( not ( = ?auto_5214 ?auto_5224 ) ) ( not ( = ?auto_5214 ?auto_5225 ) ) ( not ( = ?auto_5229 ?auto_5230 ) ) ( not ( = ?auto_5229 ?auto_5228 ) ) ( not ( = ?auto_5229 ?auto_5224 ) ) ( not ( = ?auto_5229 ?auto_5225 ) ) ( not ( = ?auto_5209 ?auto_5215 ) ) ( not ( = ?auto_5209 ?auto_5227 ) ) ( not ( = ?auto_5210 ?auto_5215 ) ) ( not ( = ?auto_5210 ?auto_5227 ) ) ( not ( = ?auto_5211 ?auto_5215 ) ) ( not ( = ?auto_5211 ?auto_5227 ) ) ( not ( = ?auto_5212 ?auto_5215 ) ) ( not ( = ?auto_5212 ?auto_5227 ) ) ( not ( = ?auto_5213 ?auto_5215 ) ) ( not ( = ?auto_5213 ?auto_5227 ) ) ( not ( = ?auto_5215 ?auto_5229 ) ) ( not ( = ?auto_5215 ?auto_5230 ) ) ( not ( = ?auto_5215 ?auto_5228 ) ) ( not ( = ?auto_5215 ?auto_5224 ) ) ( not ( = ?auto_5215 ?auto_5225 ) ) ( not ( = ?auto_5227 ?auto_5229 ) ) ( not ( = ?auto_5227 ?auto_5230 ) ) ( not ( = ?auto_5227 ?auto_5228 ) ) ( not ( = ?auto_5227 ?auto_5224 ) ) ( not ( = ?auto_5227 ?auto_5225 ) ) ( not ( = ?auto_5209 ?auto_5216 ) ) ( not ( = ?auto_5209 ?auto_5219 ) ) ( not ( = ?auto_5210 ?auto_5216 ) ) ( not ( = ?auto_5210 ?auto_5219 ) ) ( not ( = ?auto_5211 ?auto_5216 ) ) ( not ( = ?auto_5211 ?auto_5219 ) ) ( not ( = ?auto_5212 ?auto_5216 ) ) ( not ( = ?auto_5212 ?auto_5219 ) ) ( not ( = ?auto_5213 ?auto_5216 ) ) ( not ( = ?auto_5213 ?auto_5219 ) ) ( not ( = ?auto_5214 ?auto_5216 ) ) ( not ( = ?auto_5214 ?auto_5219 ) ) ( not ( = ?auto_5216 ?auto_5227 ) ) ( not ( = ?auto_5216 ?auto_5229 ) ) ( not ( = ?auto_5216 ?auto_5230 ) ) ( not ( = ?auto_5216 ?auto_5228 ) ) ( not ( = ?auto_5216 ?auto_5224 ) ) ( not ( = ?auto_5216 ?auto_5225 ) ) ( not ( = ?auto_5219 ?auto_5227 ) ) ( not ( = ?auto_5219 ?auto_5229 ) ) ( not ( = ?auto_5219 ?auto_5230 ) ) ( not ( = ?auto_5219 ?auto_5228 ) ) ( not ( = ?auto_5219 ?auto_5224 ) ) ( not ( = ?auto_5219 ?auto_5225 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5209 ?auto_5210 ?auto_5211 ?auto_5212 ?auto_5213 ?auto_5214 ?auto_5215 )
      ( MAKE-1CRATE ?auto_5215 ?auto_5216 )
      ( MAKE-7CRATE-VERIFY ?auto_5209 ?auto_5210 ?auto_5211 ?auto_5212 ?auto_5213 ?auto_5214 ?auto_5215 ?auto_5216 ) )
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
      ?auto_5256 - SURFACE
      ?auto_5257 - SURFACE
      ?auto_5258 - SURFACE
    )
    :vars
    (
      ?auto_5264 - HOIST
      ?auto_5263 - PLACE
      ?auto_5260 - PLACE
      ?auto_5261 - HOIST
      ?auto_5259 - SURFACE
      ?auto_5272 - PLACE
      ?auto_5273 - HOIST
      ?auto_5275 - SURFACE
      ?auto_5268 - PLACE
      ?auto_5270 - HOIST
      ?auto_5267 - SURFACE
      ?auto_5269 - SURFACE
      ?auto_5265 - SURFACE
      ?auto_5266 - SURFACE
      ?auto_5271 - SURFACE
      ?auto_5274 - SURFACE
      ?auto_5262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5264 ?auto_5263 ) ( IS-CRATE ?auto_5258 ) ( not ( = ?auto_5260 ?auto_5263 ) ) ( HOIST-AT ?auto_5261 ?auto_5260 ) ( AVAILABLE ?auto_5261 ) ( SURFACE-AT ?auto_5258 ?auto_5260 ) ( ON ?auto_5258 ?auto_5259 ) ( CLEAR ?auto_5258 ) ( not ( = ?auto_5257 ?auto_5258 ) ) ( not ( = ?auto_5257 ?auto_5259 ) ) ( not ( = ?auto_5258 ?auto_5259 ) ) ( not ( = ?auto_5264 ?auto_5261 ) ) ( IS-CRATE ?auto_5257 ) ( not ( = ?auto_5272 ?auto_5263 ) ) ( HOIST-AT ?auto_5273 ?auto_5272 ) ( SURFACE-AT ?auto_5257 ?auto_5272 ) ( ON ?auto_5257 ?auto_5275 ) ( CLEAR ?auto_5257 ) ( not ( = ?auto_5256 ?auto_5257 ) ) ( not ( = ?auto_5256 ?auto_5275 ) ) ( not ( = ?auto_5257 ?auto_5275 ) ) ( not ( = ?auto_5264 ?auto_5273 ) ) ( IS-CRATE ?auto_5256 ) ( not ( = ?auto_5268 ?auto_5263 ) ) ( HOIST-AT ?auto_5270 ?auto_5268 ) ( SURFACE-AT ?auto_5256 ?auto_5268 ) ( ON ?auto_5256 ?auto_5267 ) ( CLEAR ?auto_5256 ) ( not ( = ?auto_5255 ?auto_5256 ) ) ( not ( = ?auto_5255 ?auto_5267 ) ) ( not ( = ?auto_5256 ?auto_5267 ) ) ( not ( = ?auto_5264 ?auto_5270 ) ) ( IS-CRATE ?auto_5255 ) ( SURFACE-AT ?auto_5255 ?auto_5272 ) ( ON ?auto_5255 ?auto_5269 ) ( CLEAR ?auto_5255 ) ( not ( = ?auto_5254 ?auto_5255 ) ) ( not ( = ?auto_5254 ?auto_5269 ) ) ( not ( = ?auto_5255 ?auto_5269 ) ) ( IS-CRATE ?auto_5254 ) ( SURFACE-AT ?auto_5254 ?auto_5268 ) ( ON ?auto_5254 ?auto_5265 ) ( CLEAR ?auto_5254 ) ( not ( = ?auto_5253 ?auto_5254 ) ) ( not ( = ?auto_5253 ?auto_5265 ) ) ( not ( = ?auto_5254 ?auto_5265 ) ) ( IS-CRATE ?auto_5253 ) ( SURFACE-AT ?auto_5253 ?auto_5268 ) ( ON ?auto_5253 ?auto_5266 ) ( CLEAR ?auto_5253 ) ( not ( = ?auto_5252 ?auto_5253 ) ) ( not ( = ?auto_5252 ?auto_5266 ) ) ( not ( = ?auto_5253 ?auto_5266 ) ) ( IS-CRATE ?auto_5252 ) ( AVAILABLE ?auto_5273 ) ( SURFACE-AT ?auto_5252 ?auto_5272 ) ( ON ?auto_5252 ?auto_5271 ) ( CLEAR ?auto_5252 ) ( not ( = ?auto_5251 ?auto_5252 ) ) ( not ( = ?auto_5251 ?auto_5271 ) ) ( not ( = ?auto_5252 ?auto_5271 ) ) ( SURFACE-AT ?auto_5250 ?auto_5263 ) ( CLEAR ?auto_5250 ) ( IS-CRATE ?auto_5251 ) ( AVAILABLE ?auto_5264 ) ( AVAILABLE ?auto_5270 ) ( SURFACE-AT ?auto_5251 ?auto_5268 ) ( ON ?auto_5251 ?auto_5274 ) ( CLEAR ?auto_5251 ) ( TRUCK-AT ?auto_5262 ?auto_5263 ) ( not ( = ?auto_5250 ?auto_5251 ) ) ( not ( = ?auto_5250 ?auto_5274 ) ) ( not ( = ?auto_5251 ?auto_5274 ) ) ( not ( = ?auto_5250 ?auto_5252 ) ) ( not ( = ?auto_5250 ?auto_5271 ) ) ( not ( = ?auto_5252 ?auto_5274 ) ) ( not ( = ?auto_5272 ?auto_5268 ) ) ( not ( = ?auto_5273 ?auto_5270 ) ) ( not ( = ?auto_5271 ?auto_5274 ) ) ( not ( = ?auto_5250 ?auto_5253 ) ) ( not ( = ?auto_5250 ?auto_5266 ) ) ( not ( = ?auto_5251 ?auto_5253 ) ) ( not ( = ?auto_5251 ?auto_5266 ) ) ( not ( = ?auto_5253 ?auto_5271 ) ) ( not ( = ?auto_5253 ?auto_5274 ) ) ( not ( = ?auto_5266 ?auto_5271 ) ) ( not ( = ?auto_5266 ?auto_5274 ) ) ( not ( = ?auto_5250 ?auto_5254 ) ) ( not ( = ?auto_5250 ?auto_5265 ) ) ( not ( = ?auto_5251 ?auto_5254 ) ) ( not ( = ?auto_5251 ?auto_5265 ) ) ( not ( = ?auto_5252 ?auto_5254 ) ) ( not ( = ?auto_5252 ?auto_5265 ) ) ( not ( = ?auto_5254 ?auto_5266 ) ) ( not ( = ?auto_5254 ?auto_5271 ) ) ( not ( = ?auto_5254 ?auto_5274 ) ) ( not ( = ?auto_5265 ?auto_5266 ) ) ( not ( = ?auto_5265 ?auto_5271 ) ) ( not ( = ?auto_5265 ?auto_5274 ) ) ( not ( = ?auto_5250 ?auto_5255 ) ) ( not ( = ?auto_5250 ?auto_5269 ) ) ( not ( = ?auto_5251 ?auto_5255 ) ) ( not ( = ?auto_5251 ?auto_5269 ) ) ( not ( = ?auto_5252 ?auto_5255 ) ) ( not ( = ?auto_5252 ?auto_5269 ) ) ( not ( = ?auto_5253 ?auto_5255 ) ) ( not ( = ?auto_5253 ?auto_5269 ) ) ( not ( = ?auto_5255 ?auto_5265 ) ) ( not ( = ?auto_5255 ?auto_5266 ) ) ( not ( = ?auto_5255 ?auto_5271 ) ) ( not ( = ?auto_5255 ?auto_5274 ) ) ( not ( = ?auto_5269 ?auto_5265 ) ) ( not ( = ?auto_5269 ?auto_5266 ) ) ( not ( = ?auto_5269 ?auto_5271 ) ) ( not ( = ?auto_5269 ?auto_5274 ) ) ( not ( = ?auto_5250 ?auto_5256 ) ) ( not ( = ?auto_5250 ?auto_5267 ) ) ( not ( = ?auto_5251 ?auto_5256 ) ) ( not ( = ?auto_5251 ?auto_5267 ) ) ( not ( = ?auto_5252 ?auto_5256 ) ) ( not ( = ?auto_5252 ?auto_5267 ) ) ( not ( = ?auto_5253 ?auto_5256 ) ) ( not ( = ?auto_5253 ?auto_5267 ) ) ( not ( = ?auto_5254 ?auto_5256 ) ) ( not ( = ?auto_5254 ?auto_5267 ) ) ( not ( = ?auto_5256 ?auto_5269 ) ) ( not ( = ?auto_5256 ?auto_5265 ) ) ( not ( = ?auto_5256 ?auto_5266 ) ) ( not ( = ?auto_5256 ?auto_5271 ) ) ( not ( = ?auto_5256 ?auto_5274 ) ) ( not ( = ?auto_5267 ?auto_5269 ) ) ( not ( = ?auto_5267 ?auto_5265 ) ) ( not ( = ?auto_5267 ?auto_5266 ) ) ( not ( = ?auto_5267 ?auto_5271 ) ) ( not ( = ?auto_5267 ?auto_5274 ) ) ( not ( = ?auto_5250 ?auto_5257 ) ) ( not ( = ?auto_5250 ?auto_5275 ) ) ( not ( = ?auto_5251 ?auto_5257 ) ) ( not ( = ?auto_5251 ?auto_5275 ) ) ( not ( = ?auto_5252 ?auto_5257 ) ) ( not ( = ?auto_5252 ?auto_5275 ) ) ( not ( = ?auto_5253 ?auto_5257 ) ) ( not ( = ?auto_5253 ?auto_5275 ) ) ( not ( = ?auto_5254 ?auto_5257 ) ) ( not ( = ?auto_5254 ?auto_5275 ) ) ( not ( = ?auto_5255 ?auto_5257 ) ) ( not ( = ?auto_5255 ?auto_5275 ) ) ( not ( = ?auto_5257 ?auto_5267 ) ) ( not ( = ?auto_5257 ?auto_5269 ) ) ( not ( = ?auto_5257 ?auto_5265 ) ) ( not ( = ?auto_5257 ?auto_5266 ) ) ( not ( = ?auto_5257 ?auto_5271 ) ) ( not ( = ?auto_5257 ?auto_5274 ) ) ( not ( = ?auto_5275 ?auto_5267 ) ) ( not ( = ?auto_5275 ?auto_5269 ) ) ( not ( = ?auto_5275 ?auto_5265 ) ) ( not ( = ?auto_5275 ?auto_5266 ) ) ( not ( = ?auto_5275 ?auto_5271 ) ) ( not ( = ?auto_5275 ?auto_5274 ) ) ( not ( = ?auto_5250 ?auto_5258 ) ) ( not ( = ?auto_5250 ?auto_5259 ) ) ( not ( = ?auto_5251 ?auto_5258 ) ) ( not ( = ?auto_5251 ?auto_5259 ) ) ( not ( = ?auto_5252 ?auto_5258 ) ) ( not ( = ?auto_5252 ?auto_5259 ) ) ( not ( = ?auto_5253 ?auto_5258 ) ) ( not ( = ?auto_5253 ?auto_5259 ) ) ( not ( = ?auto_5254 ?auto_5258 ) ) ( not ( = ?auto_5254 ?auto_5259 ) ) ( not ( = ?auto_5255 ?auto_5258 ) ) ( not ( = ?auto_5255 ?auto_5259 ) ) ( not ( = ?auto_5256 ?auto_5258 ) ) ( not ( = ?auto_5256 ?auto_5259 ) ) ( not ( = ?auto_5258 ?auto_5275 ) ) ( not ( = ?auto_5258 ?auto_5267 ) ) ( not ( = ?auto_5258 ?auto_5269 ) ) ( not ( = ?auto_5258 ?auto_5265 ) ) ( not ( = ?auto_5258 ?auto_5266 ) ) ( not ( = ?auto_5258 ?auto_5271 ) ) ( not ( = ?auto_5258 ?auto_5274 ) ) ( not ( = ?auto_5260 ?auto_5272 ) ) ( not ( = ?auto_5260 ?auto_5268 ) ) ( not ( = ?auto_5261 ?auto_5273 ) ) ( not ( = ?auto_5261 ?auto_5270 ) ) ( not ( = ?auto_5259 ?auto_5275 ) ) ( not ( = ?auto_5259 ?auto_5267 ) ) ( not ( = ?auto_5259 ?auto_5269 ) ) ( not ( = ?auto_5259 ?auto_5265 ) ) ( not ( = ?auto_5259 ?auto_5266 ) ) ( not ( = ?auto_5259 ?auto_5271 ) ) ( not ( = ?auto_5259 ?auto_5274 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5250 ?auto_5251 ?auto_5252 ?auto_5253 ?auto_5254 ?auto_5255 ?auto_5256 ?auto_5257 )
      ( MAKE-1CRATE ?auto_5257 ?auto_5258 )
      ( MAKE-8CRATE-VERIFY ?auto_5250 ?auto_5251 ?auto_5252 ?auto_5253 ?auto_5254 ?auto_5255 ?auto_5256 ?auto_5257 ?auto_5258 ) )
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
      ?auto_5302 - SURFACE
      ?auto_5303 - SURFACE
      ?auto_5304 - SURFACE
      ?auto_5305 - SURFACE
    )
    :vars
    (
      ?auto_5309 - HOIST
      ?auto_5311 - PLACE
      ?auto_5310 - PLACE
      ?auto_5306 - HOIST
      ?auto_5308 - SURFACE
      ?auto_5312 - PLACE
      ?auto_5313 - HOIST
      ?auto_5321 - SURFACE
      ?auto_5317 - PLACE
      ?auto_5318 - HOIST
      ?auto_5314 - SURFACE
      ?auto_5325 - PLACE
      ?auto_5323 - HOIST
      ?auto_5324 - SURFACE
      ?auto_5319 - SURFACE
      ?auto_5316 - SURFACE
      ?auto_5322 - SURFACE
      ?auto_5315 - SURFACE
      ?auto_5320 - SURFACE
      ?auto_5307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5309 ?auto_5311 ) ( IS-CRATE ?auto_5305 ) ( not ( = ?auto_5310 ?auto_5311 ) ) ( HOIST-AT ?auto_5306 ?auto_5310 ) ( AVAILABLE ?auto_5306 ) ( SURFACE-AT ?auto_5305 ?auto_5310 ) ( ON ?auto_5305 ?auto_5308 ) ( CLEAR ?auto_5305 ) ( not ( = ?auto_5304 ?auto_5305 ) ) ( not ( = ?auto_5304 ?auto_5308 ) ) ( not ( = ?auto_5305 ?auto_5308 ) ) ( not ( = ?auto_5309 ?auto_5306 ) ) ( IS-CRATE ?auto_5304 ) ( not ( = ?auto_5312 ?auto_5311 ) ) ( HOIST-AT ?auto_5313 ?auto_5312 ) ( AVAILABLE ?auto_5313 ) ( SURFACE-AT ?auto_5304 ?auto_5312 ) ( ON ?auto_5304 ?auto_5321 ) ( CLEAR ?auto_5304 ) ( not ( = ?auto_5303 ?auto_5304 ) ) ( not ( = ?auto_5303 ?auto_5321 ) ) ( not ( = ?auto_5304 ?auto_5321 ) ) ( not ( = ?auto_5309 ?auto_5313 ) ) ( IS-CRATE ?auto_5303 ) ( not ( = ?auto_5317 ?auto_5311 ) ) ( HOIST-AT ?auto_5318 ?auto_5317 ) ( SURFACE-AT ?auto_5303 ?auto_5317 ) ( ON ?auto_5303 ?auto_5314 ) ( CLEAR ?auto_5303 ) ( not ( = ?auto_5302 ?auto_5303 ) ) ( not ( = ?auto_5302 ?auto_5314 ) ) ( not ( = ?auto_5303 ?auto_5314 ) ) ( not ( = ?auto_5309 ?auto_5318 ) ) ( IS-CRATE ?auto_5302 ) ( not ( = ?auto_5325 ?auto_5311 ) ) ( HOIST-AT ?auto_5323 ?auto_5325 ) ( SURFACE-AT ?auto_5302 ?auto_5325 ) ( ON ?auto_5302 ?auto_5324 ) ( CLEAR ?auto_5302 ) ( not ( = ?auto_5301 ?auto_5302 ) ) ( not ( = ?auto_5301 ?auto_5324 ) ) ( not ( = ?auto_5302 ?auto_5324 ) ) ( not ( = ?auto_5309 ?auto_5323 ) ) ( IS-CRATE ?auto_5301 ) ( SURFACE-AT ?auto_5301 ?auto_5317 ) ( ON ?auto_5301 ?auto_5319 ) ( CLEAR ?auto_5301 ) ( not ( = ?auto_5300 ?auto_5301 ) ) ( not ( = ?auto_5300 ?auto_5319 ) ) ( not ( = ?auto_5301 ?auto_5319 ) ) ( IS-CRATE ?auto_5300 ) ( SURFACE-AT ?auto_5300 ?auto_5325 ) ( ON ?auto_5300 ?auto_5316 ) ( CLEAR ?auto_5300 ) ( not ( = ?auto_5299 ?auto_5300 ) ) ( not ( = ?auto_5299 ?auto_5316 ) ) ( not ( = ?auto_5300 ?auto_5316 ) ) ( IS-CRATE ?auto_5299 ) ( SURFACE-AT ?auto_5299 ?auto_5325 ) ( ON ?auto_5299 ?auto_5322 ) ( CLEAR ?auto_5299 ) ( not ( = ?auto_5298 ?auto_5299 ) ) ( not ( = ?auto_5298 ?auto_5322 ) ) ( not ( = ?auto_5299 ?auto_5322 ) ) ( IS-CRATE ?auto_5298 ) ( AVAILABLE ?auto_5318 ) ( SURFACE-AT ?auto_5298 ?auto_5317 ) ( ON ?auto_5298 ?auto_5315 ) ( CLEAR ?auto_5298 ) ( not ( = ?auto_5297 ?auto_5298 ) ) ( not ( = ?auto_5297 ?auto_5315 ) ) ( not ( = ?auto_5298 ?auto_5315 ) ) ( SURFACE-AT ?auto_5296 ?auto_5311 ) ( CLEAR ?auto_5296 ) ( IS-CRATE ?auto_5297 ) ( AVAILABLE ?auto_5309 ) ( AVAILABLE ?auto_5323 ) ( SURFACE-AT ?auto_5297 ?auto_5325 ) ( ON ?auto_5297 ?auto_5320 ) ( CLEAR ?auto_5297 ) ( TRUCK-AT ?auto_5307 ?auto_5311 ) ( not ( = ?auto_5296 ?auto_5297 ) ) ( not ( = ?auto_5296 ?auto_5320 ) ) ( not ( = ?auto_5297 ?auto_5320 ) ) ( not ( = ?auto_5296 ?auto_5298 ) ) ( not ( = ?auto_5296 ?auto_5315 ) ) ( not ( = ?auto_5298 ?auto_5320 ) ) ( not ( = ?auto_5317 ?auto_5325 ) ) ( not ( = ?auto_5318 ?auto_5323 ) ) ( not ( = ?auto_5315 ?auto_5320 ) ) ( not ( = ?auto_5296 ?auto_5299 ) ) ( not ( = ?auto_5296 ?auto_5322 ) ) ( not ( = ?auto_5297 ?auto_5299 ) ) ( not ( = ?auto_5297 ?auto_5322 ) ) ( not ( = ?auto_5299 ?auto_5315 ) ) ( not ( = ?auto_5299 ?auto_5320 ) ) ( not ( = ?auto_5322 ?auto_5315 ) ) ( not ( = ?auto_5322 ?auto_5320 ) ) ( not ( = ?auto_5296 ?auto_5300 ) ) ( not ( = ?auto_5296 ?auto_5316 ) ) ( not ( = ?auto_5297 ?auto_5300 ) ) ( not ( = ?auto_5297 ?auto_5316 ) ) ( not ( = ?auto_5298 ?auto_5300 ) ) ( not ( = ?auto_5298 ?auto_5316 ) ) ( not ( = ?auto_5300 ?auto_5322 ) ) ( not ( = ?auto_5300 ?auto_5315 ) ) ( not ( = ?auto_5300 ?auto_5320 ) ) ( not ( = ?auto_5316 ?auto_5322 ) ) ( not ( = ?auto_5316 ?auto_5315 ) ) ( not ( = ?auto_5316 ?auto_5320 ) ) ( not ( = ?auto_5296 ?auto_5301 ) ) ( not ( = ?auto_5296 ?auto_5319 ) ) ( not ( = ?auto_5297 ?auto_5301 ) ) ( not ( = ?auto_5297 ?auto_5319 ) ) ( not ( = ?auto_5298 ?auto_5301 ) ) ( not ( = ?auto_5298 ?auto_5319 ) ) ( not ( = ?auto_5299 ?auto_5301 ) ) ( not ( = ?auto_5299 ?auto_5319 ) ) ( not ( = ?auto_5301 ?auto_5316 ) ) ( not ( = ?auto_5301 ?auto_5322 ) ) ( not ( = ?auto_5301 ?auto_5315 ) ) ( not ( = ?auto_5301 ?auto_5320 ) ) ( not ( = ?auto_5319 ?auto_5316 ) ) ( not ( = ?auto_5319 ?auto_5322 ) ) ( not ( = ?auto_5319 ?auto_5315 ) ) ( not ( = ?auto_5319 ?auto_5320 ) ) ( not ( = ?auto_5296 ?auto_5302 ) ) ( not ( = ?auto_5296 ?auto_5324 ) ) ( not ( = ?auto_5297 ?auto_5302 ) ) ( not ( = ?auto_5297 ?auto_5324 ) ) ( not ( = ?auto_5298 ?auto_5302 ) ) ( not ( = ?auto_5298 ?auto_5324 ) ) ( not ( = ?auto_5299 ?auto_5302 ) ) ( not ( = ?auto_5299 ?auto_5324 ) ) ( not ( = ?auto_5300 ?auto_5302 ) ) ( not ( = ?auto_5300 ?auto_5324 ) ) ( not ( = ?auto_5302 ?auto_5319 ) ) ( not ( = ?auto_5302 ?auto_5316 ) ) ( not ( = ?auto_5302 ?auto_5322 ) ) ( not ( = ?auto_5302 ?auto_5315 ) ) ( not ( = ?auto_5302 ?auto_5320 ) ) ( not ( = ?auto_5324 ?auto_5319 ) ) ( not ( = ?auto_5324 ?auto_5316 ) ) ( not ( = ?auto_5324 ?auto_5322 ) ) ( not ( = ?auto_5324 ?auto_5315 ) ) ( not ( = ?auto_5324 ?auto_5320 ) ) ( not ( = ?auto_5296 ?auto_5303 ) ) ( not ( = ?auto_5296 ?auto_5314 ) ) ( not ( = ?auto_5297 ?auto_5303 ) ) ( not ( = ?auto_5297 ?auto_5314 ) ) ( not ( = ?auto_5298 ?auto_5303 ) ) ( not ( = ?auto_5298 ?auto_5314 ) ) ( not ( = ?auto_5299 ?auto_5303 ) ) ( not ( = ?auto_5299 ?auto_5314 ) ) ( not ( = ?auto_5300 ?auto_5303 ) ) ( not ( = ?auto_5300 ?auto_5314 ) ) ( not ( = ?auto_5301 ?auto_5303 ) ) ( not ( = ?auto_5301 ?auto_5314 ) ) ( not ( = ?auto_5303 ?auto_5324 ) ) ( not ( = ?auto_5303 ?auto_5319 ) ) ( not ( = ?auto_5303 ?auto_5316 ) ) ( not ( = ?auto_5303 ?auto_5322 ) ) ( not ( = ?auto_5303 ?auto_5315 ) ) ( not ( = ?auto_5303 ?auto_5320 ) ) ( not ( = ?auto_5314 ?auto_5324 ) ) ( not ( = ?auto_5314 ?auto_5319 ) ) ( not ( = ?auto_5314 ?auto_5316 ) ) ( not ( = ?auto_5314 ?auto_5322 ) ) ( not ( = ?auto_5314 ?auto_5315 ) ) ( not ( = ?auto_5314 ?auto_5320 ) ) ( not ( = ?auto_5296 ?auto_5304 ) ) ( not ( = ?auto_5296 ?auto_5321 ) ) ( not ( = ?auto_5297 ?auto_5304 ) ) ( not ( = ?auto_5297 ?auto_5321 ) ) ( not ( = ?auto_5298 ?auto_5304 ) ) ( not ( = ?auto_5298 ?auto_5321 ) ) ( not ( = ?auto_5299 ?auto_5304 ) ) ( not ( = ?auto_5299 ?auto_5321 ) ) ( not ( = ?auto_5300 ?auto_5304 ) ) ( not ( = ?auto_5300 ?auto_5321 ) ) ( not ( = ?auto_5301 ?auto_5304 ) ) ( not ( = ?auto_5301 ?auto_5321 ) ) ( not ( = ?auto_5302 ?auto_5304 ) ) ( not ( = ?auto_5302 ?auto_5321 ) ) ( not ( = ?auto_5304 ?auto_5314 ) ) ( not ( = ?auto_5304 ?auto_5324 ) ) ( not ( = ?auto_5304 ?auto_5319 ) ) ( not ( = ?auto_5304 ?auto_5316 ) ) ( not ( = ?auto_5304 ?auto_5322 ) ) ( not ( = ?auto_5304 ?auto_5315 ) ) ( not ( = ?auto_5304 ?auto_5320 ) ) ( not ( = ?auto_5312 ?auto_5317 ) ) ( not ( = ?auto_5312 ?auto_5325 ) ) ( not ( = ?auto_5313 ?auto_5318 ) ) ( not ( = ?auto_5313 ?auto_5323 ) ) ( not ( = ?auto_5321 ?auto_5314 ) ) ( not ( = ?auto_5321 ?auto_5324 ) ) ( not ( = ?auto_5321 ?auto_5319 ) ) ( not ( = ?auto_5321 ?auto_5316 ) ) ( not ( = ?auto_5321 ?auto_5322 ) ) ( not ( = ?auto_5321 ?auto_5315 ) ) ( not ( = ?auto_5321 ?auto_5320 ) ) ( not ( = ?auto_5296 ?auto_5305 ) ) ( not ( = ?auto_5296 ?auto_5308 ) ) ( not ( = ?auto_5297 ?auto_5305 ) ) ( not ( = ?auto_5297 ?auto_5308 ) ) ( not ( = ?auto_5298 ?auto_5305 ) ) ( not ( = ?auto_5298 ?auto_5308 ) ) ( not ( = ?auto_5299 ?auto_5305 ) ) ( not ( = ?auto_5299 ?auto_5308 ) ) ( not ( = ?auto_5300 ?auto_5305 ) ) ( not ( = ?auto_5300 ?auto_5308 ) ) ( not ( = ?auto_5301 ?auto_5305 ) ) ( not ( = ?auto_5301 ?auto_5308 ) ) ( not ( = ?auto_5302 ?auto_5305 ) ) ( not ( = ?auto_5302 ?auto_5308 ) ) ( not ( = ?auto_5303 ?auto_5305 ) ) ( not ( = ?auto_5303 ?auto_5308 ) ) ( not ( = ?auto_5305 ?auto_5321 ) ) ( not ( = ?auto_5305 ?auto_5314 ) ) ( not ( = ?auto_5305 ?auto_5324 ) ) ( not ( = ?auto_5305 ?auto_5319 ) ) ( not ( = ?auto_5305 ?auto_5316 ) ) ( not ( = ?auto_5305 ?auto_5322 ) ) ( not ( = ?auto_5305 ?auto_5315 ) ) ( not ( = ?auto_5305 ?auto_5320 ) ) ( not ( = ?auto_5310 ?auto_5312 ) ) ( not ( = ?auto_5310 ?auto_5317 ) ) ( not ( = ?auto_5310 ?auto_5325 ) ) ( not ( = ?auto_5306 ?auto_5313 ) ) ( not ( = ?auto_5306 ?auto_5318 ) ) ( not ( = ?auto_5306 ?auto_5323 ) ) ( not ( = ?auto_5308 ?auto_5321 ) ) ( not ( = ?auto_5308 ?auto_5314 ) ) ( not ( = ?auto_5308 ?auto_5324 ) ) ( not ( = ?auto_5308 ?auto_5319 ) ) ( not ( = ?auto_5308 ?auto_5316 ) ) ( not ( = ?auto_5308 ?auto_5322 ) ) ( not ( = ?auto_5308 ?auto_5315 ) ) ( not ( = ?auto_5308 ?auto_5320 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5296 ?auto_5297 ?auto_5298 ?auto_5299 ?auto_5300 ?auto_5301 ?auto_5302 ?auto_5303 ?auto_5304 )
      ( MAKE-1CRATE ?auto_5304 ?auto_5305 )
      ( MAKE-9CRATE-VERIFY ?auto_5296 ?auto_5297 ?auto_5298 ?auto_5299 ?auto_5300 ?auto_5301 ?auto_5302 ?auto_5303 ?auto_5304 ?auto_5305 ) )
  )

)

