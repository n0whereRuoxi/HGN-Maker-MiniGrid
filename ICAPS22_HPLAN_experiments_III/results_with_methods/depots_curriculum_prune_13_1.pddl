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

  ( :method MAKE-13CRATE-VERIFY
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
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14058 - SURFACE
      ?auto_14059 - SURFACE
    )
    :vars
    (
      ?auto_14060 - HOIST
      ?auto_14061 - PLACE
      ?auto_14063 - PLACE
      ?auto_14064 - HOIST
      ?auto_14065 - SURFACE
      ?auto_14062 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14060 ?auto_14061 ) ( SURFACE-AT ?auto_14058 ?auto_14061 ) ( CLEAR ?auto_14058 ) ( IS-CRATE ?auto_14059 ) ( AVAILABLE ?auto_14060 ) ( not ( = ?auto_14063 ?auto_14061 ) ) ( HOIST-AT ?auto_14064 ?auto_14063 ) ( AVAILABLE ?auto_14064 ) ( SURFACE-AT ?auto_14059 ?auto_14063 ) ( ON ?auto_14059 ?auto_14065 ) ( CLEAR ?auto_14059 ) ( TRUCK-AT ?auto_14062 ?auto_14061 ) ( not ( = ?auto_14058 ?auto_14059 ) ) ( not ( = ?auto_14058 ?auto_14065 ) ) ( not ( = ?auto_14059 ?auto_14065 ) ) ( not ( = ?auto_14060 ?auto_14064 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14062 ?auto_14061 ?auto_14063 )
      ( !LIFT ?auto_14064 ?auto_14059 ?auto_14065 ?auto_14063 )
      ( !LOAD ?auto_14064 ?auto_14059 ?auto_14062 ?auto_14063 )
      ( !DRIVE ?auto_14062 ?auto_14063 ?auto_14061 )
      ( !UNLOAD ?auto_14060 ?auto_14059 ?auto_14062 ?auto_14061 )
      ( !DROP ?auto_14060 ?auto_14059 ?auto_14058 ?auto_14061 )
      ( MAKE-1CRATE-VERIFY ?auto_14058 ?auto_14059 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14079 - SURFACE
      ?auto_14080 - SURFACE
      ?auto_14081 - SURFACE
    )
    :vars
    (
      ?auto_14086 - HOIST
      ?auto_14087 - PLACE
      ?auto_14083 - PLACE
      ?auto_14084 - HOIST
      ?auto_14085 - SURFACE
      ?auto_14088 - SURFACE
      ?auto_14082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14086 ?auto_14087 ) ( IS-CRATE ?auto_14081 ) ( not ( = ?auto_14083 ?auto_14087 ) ) ( HOIST-AT ?auto_14084 ?auto_14083 ) ( SURFACE-AT ?auto_14081 ?auto_14083 ) ( ON ?auto_14081 ?auto_14085 ) ( CLEAR ?auto_14081 ) ( not ( = ?auto_14080 ?auto_14081 ) ) ( not ( = ?auto_14080 ?auto_14085 ) ) ( not ( = ?auto_14081 ?auto_14085 ) ) ( not ( = ?auto_14086 ?auto_14084 ) ) ( SURFACE-AT ?auto_14079 ?auto_14087 ) ( CLEAR ?auto_14079 ) ( IS-CRATE ?auto_14080 ) ( AVAILABLE ?auto_14086 ) ( AVAILABLE ?auto_14084 ) ( SURFACE-AT ?auto_14080 ?auto_14083 ) ( ON ?auto_14080 ?auto_14088 ) ( CLEAR ?auto_14080 ) ( TRUCK-AT ?auto_14082 ?auto_14087 ) ( not ( = ?auto_14079 ?auto_14080 ) ) ( not ( = ?auto_14079 ?auto_14088 ) ) ( not ( = ?auto_14080 ?auto_14088 ) ) ( not ( = ?auto_14079 ?auto_14081 ) ) ( not ( = ?auto_14079 ?auto_14085 ) ) ( not ( = ?auto_14081 ?auto_14088 ) ) ( not ( = ?auto_14085 ?auto_14088 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14079 ?auto_14080 )
      ( MAKE-1CRATE ?auto_14080 ?auto_14081 )
      ( MAKE-2CRATE-VERIFY ?auto_14079 ?auto_14080 ?auto_14081 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14103 - SURFACE
      ?auto_14104 - SURFACE
      ?auto_14105 - SURFACE
      ?auto_14106 - SURFACE
    )
    :vars
    (
      ?auto_14109 - HOIST
      ?auto_14110 - PLACE
      ?auto_14112 - PLACE
      ?auto_14111 - HOIST
      ?auto_14108 - SURFACE
      ?auto_14114 - PLACE
      ?auto_14115 - HOIST
      ?auto_14113 - SURFACE
      ?auto_14116 - SURFACE
      ?auto_14107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14109 ?auto_14110 ) ( IS-CRATE ?auto_14106 ) ( not ( = ?auto_14112 ?auto_14110 ) ) ( HOIST-AT ?auto_14111 ?auto_14112 ) ( AVAILABLE ?auto_14111 ) ( SURFACE-AT ?auto_14106 ?auto_14112 ) ( ON ?auto_14106 ?auto_14108 ) ( CLEAR ?auto_14106 ) ( not ( = ?auto_14105 ?auto_14106 ) ) ( not ( = ?auto_14105 ?auto_14108 ) ) ( not ( = ?auto_14106 ?auto_14108 ) ) ( not ( = ?auto_14109 ?auto_14111 ) ) ( IS-CRATE ?auto_14105 ) ( not ( = ?auto_14114 ?auto_14110 ) ) ( HOIST-AT ?auto_14115 ?auto_14114 ) ( SURFACE-AT ?auto_14105 ?auto_14114 ) ( ON ?auto_14105 ?auto_14113 ) ( CLEAR ?auto_14105 ) ( not ( = ?auto_14104 ?auto_14105 ) ) ( not ( = ?auto_14104 ?auto_14113 ) ) ( not ( = ?auto_14105 ?auto_14113 ) ) ( not ( = ?auto_14109 ?auto_14115 ) ) ( SURFACE-AT ?auto_14103 ?auto_14110 ) ( CLEAR ?auto_14103 ) ( IS-CRATE ?auto_14104 ) ( AVAILABLE ?auto_14109 ) ( AVAILABLE ?auto_14115 ) ( SURFACE-AT ?auto_14104 ?auto_14114 ) ( ON ?auto_14104 ?auto_14116 ) ( CLEAR ?auto_14104 ) ( TRUCK-AT ?auto_14107 ?auto_14110 ) ( not ( = ?auto_14103 ?auto_14104 ) ) ( not ( = ?auto_14103 ?auto_14116 ) ) ( not ( = ?auto_14104 ?auto_14116 ) ) ( not ( = ?auto_14103 ?auto_14105 ) ) ( not ( = ?auto_14103 ?auto_14113 ) ) ( not ( = ?auto_14105 ?auto_14116 ) ) ( not ( = ?auto_14113 ?auto_14116 ) ) ( not ( = ?auto_14103 ?auto_14106 ) ) ( not ( = ?auto_14103 ?auto_14108 ) ) ( not ( = ?auto_14104 ?auto_14106 ) ) ( not ( = ?auto_14104 ?auto_14108 ) ) ( not ( = ?auto_14106 ?auto_14113 ) ) ( not ( = ?auto_14106 ?auto_14116 ) ) ( not ( = ?auto_14112 ?auto_14114 ) ) ( not ( = ?auto_14111 ?auto_14115 ) ) ( not ( = ?auto_14108 ?auto_14113 ) ) ( not ( = ?auto_14108 ?auto_14116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14103 ?auto_14104 ?auto_14105 )
      ( MAKE-1CRATE ?auto_14105 ?auto_14106 )
      ( MAKE-3CRATE-VERIFY ?auto_14103 ?auto_14104 ?auto_14105 ?auto_14106 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14132 - SURFACE
      ?auto_14133 - SURFACE
      ?auto_14134 - SURFACE
      ?auto_14135 - SURFACE
      ?auto_14136 - SURFACE
    )
    :vars
    (
      ?auto_14137 - HOIST
      ?auto_14139 - PLACE
      ?auto_14138 - PLACE
      ?auto_14140 - HOIST
      ?auto_14142 - SURFACE
      ?auto_14147 - PLACE
      ?auto_14149 - HOIST
      ?auto_14145 - SURFACE
      ?auto_14143 - PLACE
      ?auto_14146 - HOIST
      ?auto_14148 - SURFACE
      ?auto_14144 - SURFACE
      ?auto_14141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14137 ?auto_14139 ) ( IS-CRATE ?auto_14136 ) ( not ( = ?auto_14138 ?auto_14139 ) ) ( HOIST-AT ?auto_14140 ?auto_14138 ) ( AVAILABLE ?auto_14140 ) ( SURFACE-AT ?auto_14136 ?auto_14138 ) ( ON ?auto_14136 ?auto_14142 ) ( CLEAR ?auto_14136 ) ( not ( = ?auto_14135 ?auto_14136 ) ) ( not ( = ?auto_14135 ?auto_14142 ) ) ( not ( = ?auto_14136 ?auto_14142 ) ) ( not ( = ?auto_14137 ?auto_14140 ) ) ( IS-CRATE ?auto_14135 ) ( not ( = ?auto_14147 ?auto_14139 ) ) ( HOIST-AT ?auto_14149 ?auto_14147 ) ( AVAILABLE ?auto_14149 ) ( SURFACE-AT ?auto_14135 ?auto_14147 ) ( ON ?auto_14135 ?auto_14145 ) ( CLEAR ?auto_14135 ) ( not ( = ?auto_14134 ?auto_14135 ) ) ( not ( = ?auto_14134 ?auto_14145 ) ) ( not ( = ?auto_14135 ?auto_14145 ) ) ( not ( = ?auto_14137 ?auto_14149 ) ) ( IS-CRATE ?auto_14134 ) ( not ( = ?auto_14143 ?auto_14139 ) ) ( HOIST-AT ?auto_14146 ?auto_14143 ) ( SURFACE-AT ?auto_14134 ?auto_14143 ) ( ON ?auto_14134 ?auto_14148 ) ( CLEAR ?auto_14134 ) ( not ( = ?auto_14133 ?auto_14134 ) ) ( not ( = ?auto_14133 ?auto_14148 ) ) ( not ( = ?auto_14134 ?auto_14148 ) ) ( not ( = ?auto_14137 ?auto_14146 ) ) ( SURFACE-AT ?auto_14132 ?auto_14139 ) ( CLEAR ?auto_14132 ) ( IS-CRATE ?auto_14133 ) ( AVAILABLE ?auto_14137 ) ( AVAILABLE ?auto_14146 ) ( SURFACE-AT ?auto_14133 ?auto_14143 ) ( ON ?auto_14133 ?auto_14144 ) ( CLEAR ?auto_14133 ) ( TRUCK-AT ?auto_14141 ?auto_14139 ) ( not ( = ?auto_14132 ?auto_14133 ) ) ( not ( = ?auto_14132 ?auto_14144 ) ) ( not ( = ?auto_14133 ?auto_14144 ) ) ( not ( = ?auto_14132 ?auto_14134 ) ) ( not ( = ?auto_14132 ?auto_14148 ) ) ( not ( = ?auto_14134 ?auto_14144 ) ) ( not ( = ?auto_14148 ?auto_14144 ) ) ( not ( = ?auto_14132 ?auto_14135 ) ) ( not ( = ?auto_14132 ?auto_14145 ) ) ( not ( = ?auto_14133 ?auto_14135 ) ) ( not ( = ?auto_14133 ?auto_14145 ) ) ( not ( = ?auto_14135 ?auto_14148 ) ) ( not ( = ?auto_14135 ?auto_14144 ) ) ( not ( = ?auto_14147 ?auto_14143 ) ) ( not ( = ?auto_14149 ?auto_14146 ) ) ( not ( = ?auto_14145 ?auto_14148 ) ) ( not ( = ?auto_14145 ?auto_14144 ) ) ( not ( = ?auto_14132 ?auto_14136 ) ) ( not ( = ?auto_14132 ?auto_14142 ) ) ( not ( = ?auto_14133 ?auto_14136 ) ) ( not ( = ?auto_14133 ?auto_14142 ) ) ( not ( = ?auto_14134 ?auto_14136 ) ) ( not ( = ?auto_14134 ?auto_14142 ) ) ( not ( = ?auto_14136 ?auto_14145 ) ) ( not ( = ?auto_14136 ?auto_14148 ) ) ( not ( = ?auto_14136 ?auto_14144 ) ) ( not ( = ?auto_14138 ?auto_14147 ) ) ( not ( = ?auto_14138 ?auto_14143 ) ) ( not ( = ?auto_14140 ?auto_14149 ) ) ( not ( = ?auto_14140 ?auto_14146 ) ) ( not ( = ?auto_14142 ?auto_14145 ) ) ( not ( = ?auto_14142 ?auto_14148 ) ) ( not ( = ?auto_14142 ?auto_14144 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_14132 ?auto_14133 ?auto_14134 ?auto_14135 )
      ( MAKE-1CRATE ?auto_14135 ?auto_14136 )
      ( MAKE-4CRATE-VERIFY ?auto_14132 ?auto_14133 ?auto_14134 ?auto_14135 ?auto_14136 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14166 - SURFACE
      ?auto_14167 - SURFACE
      ?auto_14168 - SURFACE
      ?auto_14169 - SURFACE
      ?auto_14170 - SURFACE
      ?auto_14171 - SURFACE
    )
    :vars
    (
      ?auto_14175 - HOIST
      ?auto_14174 - PLACE
      ?auto_14172 - PLACE
      ?auto_14173 - HOIST
      ?auto_14176 - SURFACE
      ?auto_14184 - PLACE
      ?auto_14183 - HOIST
      ?auto_14181 - SURFACE
      ?auto_14178 - PLACE
      ?auto_14182 - HOIST
      ?auto_14186 - SURFACE
      ?auto_14185 - PLACE
      ?auto_14179 - HOIST
      ?auto_14180 - SURFACE
      ?auto_14187 - SURFACE
      ?auto_14177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14175 ?auto_14174 ) ( IS-CRATE ?auto_14171 ) ( not ( = ?auto_14172 ?auto_14174 ) ) ( HOIST-AT ?auto_14173 ?auto_14172 ) ( AVAILABLE ?auto_14173 ) ( SURFACE-AT ?auto_14171 ?auto_14172 ) ( ON ?auto_14171 ?auto_14176 ) ( CLEAR ?auto_14171 ) ( not ( = ?auto_14170 ?auto_14171 ) ) ( not ( = ?auto_14170 ?auto_14176 ) ) ( not ( = ?auto_14171 ?auto_14176 ) ) ( not ( = ?auto_14175 ?auto_14173 ) ) ( IS-CRATE ?auto_14170 ) ( not ( = ?auto_14184 ?auto_14174 ) ) ( HOIST-AT ?auto_14183 ?auto_14184 ) ( AVAILABLE ?auto_14183 ) ( SURFACE-AT ?auto_14170 ?auto_14184 ) ( ON ?auto_14170 ?auto_14181 ) ( CLEAR ?auto_14170 ) ( not ( = ?auto_14169 ?auto_14170 ) ) ( not ( = ?auto_14169 ?auto_14181 ) ) ( not ( = ?auto_14170 ?auto_14181 ) ) ( not ( = ?auto_14175 ?auto_14183 ) ) ( IS-CRATE ?auto_14169 ) ( not ( = ?auto_14178 ?auto_14174 ) ) ( HOIST-AT ?auto_14182 ?auto_14178 ) ( AVAILABLE ?auto_14182 ) ( SURFACE-AT ?auto_14169 ?auto_14178 ) ( ON ?auto_14169 ?auto_14186 ) ( CLEAR ?auto_14169 ) ( not ( = ?auto_14168 ?auto_14169 ) ) ( not ( = ?auto_14168 ?auto_14186 ) ) ( not ( = ?auto_14169 ?auto_14186 ) ) ( not ( = ?auto_14175 ?auto_14182 ) ) ( IS-CRATE ?auto_14168 ) ( not ( = ?auto_14185 ?auto_14174 ) ) ( HOIST-AT ?auto_14179 ?auto_14185 ) ( SURFACE-AT ?auto_14168 ?auto_14185 ) ( ON ?auto_14168 ?auto_14180 ) ( CLEAR ?auto_14168 ) ( not ( = ?auto_14167 ?auto_14168 ) ) ( not ( = ?auto_14167 ?auto_14180 ) ) ( not ( = ?auto_14168 ?auto_14180 ) ) ( not ( = ?auto_14175 ?auto_14179 ) ) ( SURFACE-AT ?auto_14166 ?auto_14174 ) ( CLEAR ?auto_14166 ) ( IS-CRATE ?auto_14167 ) ( AVAILABLE ?auto_14175 ) ( AVAILABLE ?auto_14179 ) ( SURFACE-AT ?auto_14167 ?auto_14185 ) ( ON ?auto_14167 ?auto_14187 ) ( CLEAR ?auto_14167 ) ( TRUCK-AT ?auto_14177 ?auto_14174 ) ( not ( = ?auto_14166 ?auto_14167 ) ) ( not ( = ?auto_14166 ?auto_14187 ) ) ( not ( = ?auto_14167 ?auto_14187 ) ) ( not ( = ?auto_14166 ?auto_14168 ) ) ( not ( = ?auto_14166 ?auto_14180 ) ) ( not ( = ?auto_14168 ?auto_14187 ) ) ( not ( = ?auto_14180 ?auto_14187 ) ) ( not ( = ?auto_14166 ?auto_14169 ) ) ( not ( = ?auto_14166 ?auto_14186 ) ) ( not ( = ?auto_14167 ?auto_14169 ) ) ( not ( = ?auto_14167 ?auto_14186 ) ) ( not ( = ?auto_14169 ?auto_14180 ) ) ( not ( = ?auto_14169 ?auto_14187 ) ) ( not ( = ?auto_14178 ?auto_14185 ) ) ( not ( = ?auto_14182 ?auto_14179 ) ) ( not ( = ?auto_14186 ?auto_14180 ) ) ( not ( = ?auto_14186 ?auto_14187 ) ) ( not ( = ?auto_14166 ?auto_14170 ) ) ( not ( = ?auto_14166 ?auto_14181 ) ) ( not ( = ?auto_14167 ?auto_14170 ) ) ( not ( = ?auto_14167 ?auto_14181 ) ) ( not ( = ?auto_14168 ?auto_14170 ) ) ( not ( = ?auto_14168 ?auto_14181 ) ) ( not ( = ?auto_14170 ?auto_14186 ) ) ( not ( = ?auto_14170 ?auto_14180 ) ) ( not ( = ?auto_14170 ?auto_14187 ) ) ( not ( = ?auto_14184 ?auto_14178 ) ) ( not ( = ?auto_14184 ?auto_14185 ) ) ( not ( = ?auto_14183 ?auto_14182 ) ) ( not ( = ?auto_14183 ?auto_14179 ) ) ( not ( = ?auto_14181 ?auto_14186 ) ) ( not ( = ?auto_14181 ?auto_14180 ) ) ( not ( = ?auto_14181 ?auto_14187 ) ) ( not ( = ?auto_14166 ?auto_14171 ) ) ( not ( = ?auto_14166 ?auto_14176 ) ) ( not ( = ?auto_14167 ?auto_14171 ) ) ( not ( = ?auto_14167 ?auto_14176 ) ) ( not ( = ?auto_14168 ?auto_14171 ) ) ( not ( = ?auto_14168 ?auto_14176 ) ) ( not ( = ?auto_14169 ?auto_14171 ) ) ( not ( = ?auto_14169 ?auto_14176 ) ) ( not ( = ?auto_14171 ?auto_14181 ) ) ( not ( = ?auto_14171 ?auto_14186 ) ) ( not ( = ?auto_14171 ?auto_14180 ) ) ( not ( = ?auto_14171 ?auto_14187 ) ) ( not ( = ?auto_14172 ?auto_14184 ) ) ( not ( = ?auto_14172 ?auto_14178 ) ) ( not ( = ?auto_14172 ?auto_14185 ) ) ( not ( = ?auto_14173 ?auto_14183 ) ) ( not ( = ?auto_14173 ?auto_14182 ) ) ( not ( = ?auto_14173 ?auto_14179 ) ) ( not ( = ?auto_14176 ?auto_14181 ) ) ( not ( = ?auto_14176 ?auto_14186 ) ) ( not ( = ?auto_14176 ?auto_14180 ) ) ( not ( = ?auto_14176 ?auto_14187 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_14166 ?auto_14167 ?auto_14168 ?auto_14169 ?auto_14170 )
      ( MAKE-1CRATE ?auto_14170 ?auto_14171 )
      ( MAKE-5CRATE-VERIFY ?auto_14166 ?auto_14167 ?auto_14168 ?auto_14169 ?auto_14170 ?auto_14171 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_14205 - SURFACE
      ?auto_14206 - SURFACE
      ?auto_14207 - SURFACE
      ?auto_14208 - SURFACE
      ?auto_14209 - SURFACE
      ?auto_14210 - SURFACE
      ?auto_14211 - SURFACE
    )
    :vars
    (
      ?auto_14216 - HOIST
      ?auto_14215 - PLACE
      ?auto_14214 - PLACE
      ?auto_14217 - HOIST
      ?auto_14212 - SURFACE
      ?auto_14230 - PLACE
      ?auto_14224 - HOIST
      ?auto_14228 - SURFACE
      ?auto_14221 - PLACE
      ?auto_14219 - HOIST
      ?auto_14223 - SURFACE
      ?auto_14229 - PLACE
      ?auto_14220 - HOIST
      ?auto_14226 - SURFACE
      ?auto_14222 - PLACE
      ?auto_14227 - HOIST
      ?auto_14218 - SURFACE
      ?auto_14225 - SURFACE
      ?auto_14213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14216 ?auto_14215 ) ( IS-CRATE ?auto_14211 ) ( not ( = ?auto_14214 ?auto_14215 ) ) ( HOIST-AT ?auto_14217 ?auto_14214 ) ( AVAILABLE ?auto_14217 ) ( SURFACE-AT ?auto_14211 ?auto_14214 ) ( ON ?auto_14211 ?auto_14212 ) ( CLEAR ?auto_14211 ) ( not ( = ?auto_14210 ?auto_14211 ) ) ( not ( = ?auto_14210 ?auto_14212 ) ) ( not ( = ?auto_14211 ?auto_14212 ) ) ( not ( = ?auto_14216 ?auto_14217 ) ) ( IS-CRATE ?auto_14210 ) ( not ( = ?auto_14230 ?auto_14215 ) ) ( HOIST-AT ?auto_14224 ?auto_14230 ) ( AVAILABLE ?auto_14224 ) ( SURFACE-AT ?auto_14210 ?auto_14230 ) ( ON ?auto_14210 ?auto_14228 ) ( CLEAR ?auto_14210 ) ( not ( = ?auto_14209 ?auto_14210 ) ) ( not ( = ?auto_14209 ?auto_14228 ) ) ( not ( = ?auto_14210 ?auto_14228 ) ) ( not ( = ?auto_14216 ?auto_14224 ) ) ( IS-CRATE ?auto_14209 ) ( not ( = ?auto_14221 ?auto_14215 ) ) ( HOIST-AT ?auto_14219 ?auto_14221 ) ( AVAILABLE ?auto_14219 ) ( SURFACE-AT ?auto_14209 ?auto_14221 ) ( ON ?auto_14209 ?auto_14223 ) ( CLEAR ?auto_14209 ) ( not ( = ?auto_14208 ?auto_14209 ) ) ( not ( = ?auto_14208 ?auto_14223 ) ) ( not ( = ?auto_14209 ?auto_14223 ) ) ( not ( = ?auto_14216 ?auto_14219 ) ) ( IS-CRATE ?auto_14208 ) ( not ( = ?auto_14229 ?auto_14215 ) ) ( HOIST-AT ?auto_14220 ?auto_14229 ) ( AVAILABLE ?auto_14220 ) ( SURFACE-AT ?auto_14208 ?auto_14229 ) ( ON ?auto_14208 ?auto_14226 ) ( CLEAR ?auto_14208 ) ( not ( = ?auto_14207 ?auto_14208 ) ) ( not ( = ?auto_14207 ?auto_14226 ) ) ( not ( = ?auto_14208 ?auto_14226 ) ) ( not ( = ?auto_14216 ?auto_14220 ) ) ( IS-CRATE ?auto_14207 ) ( not ( = ?auto_14222 ?auto_14215 ) ) ( HOIST-AT ?auto_14227 ?auto_14222 ) ( SURFACE-AT ?auto_14207 ?auto_14222 ) ( ON ?auto_14207 ?auto_14218 ) ( CLEAR ?auto_14207 ) ( not ( = ?auto_14206 ?auto_14207 ) ) ( not ( = ?auto_14206 ?auto_14218 ) ) ( not ( = ?auto_14207 ?auto_14218 ) ) ( not ( = ?auto_14216 ?auto_14227 ) ) ( SURFACE-AT ?auto_14205 ?auto_14215 ) ( CLEAR ?auto_14205 ) ( IS-CRATE ?auto_14206 ) ( AVAILABLE ?auto_14216 ) ( AVAILABLE ?auto_14227 ) ( SURFACE-AT ?auto_14206 ?auto_14222 ) ( ON ?auto_14206 ?auto_14225 ) ( CLEAR ?auto_14206 ) ( TRUCK-AT ?auto_14213 ?auto_14215 ) ( not ( = ?auto_14205 ?auto_14206 ) ) ( not ( = ?auto_14205 ?auto_14225 ) ) ( not ( = ?auto_14206 ?auto_14225 ) ) ( not ( = ?auto_14205 ?auto_14207 ) ) ( not ( = ?auto_14205 ?auto_14218 ) ) ( not ( = ?auto_14207 ?auto_14225 ) ) ( not ( = ?auto_14218 ?auto_14225 ) ) ( not ( = ?auto_14205 ?auto_14208 ) ) ( not ( = ?auto_14205 ?auto_14226 ) ) ( not ( = ?auto_14206 ?auto_14208 ) ) ( not ( = ?auto_14206 ?auto_14226 ) ) ( not ( = ?auto_14208 ?auto_14218 ) ) ( not ( = ?auto_14208 ?auto_14225 ) ) ( not ( = ?auto_14229 ?auto_14222 ) ) ( not ( = ?auto_14220 ?auto_14227 ) ) ( not ( = ?auto_14226 ?auto_14218 ) ) ( not ( = ?auto_14226 ?auto_14225 ) ) ( not ( = ?auto_14205 ?auto_14209 ) ) ( not ( = ?auto_14205 ?auto_14223 ) ) ( not ( = ?auto_14206 ?auto_14209 ) ) ( not ( = ?auto_14206 ?auto_14223 ) ) ( not ( = ?auto_14207 ?auto_14209 ) ) ( not ( = ?auto_14207 ?auto_14223 ) ) ( not ( = ?auto_14209 ?auto_14226 ) ) ( not ( = ?auto_14209 ?auto_14218 ) ) ( not ( = ?auto_14209 ?auto_14225 ) ) ( not ( = ?auto_14221 ?auto_14229 ) ) ( not ( = ?auto_14221 ?auto_14222 ) ) ( not ( = ?auto_14219 ?auto_14220 ) ) ( not ( = ?auto_14219 ?auto_14227 ) ) ( not ( = ?auto_14223 ?auto_14226 ) ) ( not ( = ?auto_14223 ?auto_14218 ) ) ( not ( = ?auto_14223 ?auto_14225 ) ) ( not ( = ?auto_14205 ?auto_14210 ) ) ( not ( = ?auto_14205 ?auto_14228 ) ) ( not ( = ?auto_14206 ?auto_14210 ) ) ( not ( = ?auto_14206 ?auto_14228 ) ) ( not ( = ?auto_14207 ?auto_14210 ) ) ( not ( = ?auto_14207 ?auto_14228 ) ) ( not ( = ?auto_14208 ?auto_14210 ) ) ( not ( = ?auto_14208 ?auto_14228 ) ) ( not ( = ?auto_14210 ?auto_14223 ) ) ( not ( = ?auto_14210 ?auto_14226 ) ) ( not ( = ?auto_14210 ?auto_14218 ) ) ( not ( = ?auto_14210 ?auto_14225 ) ) ( not ( = ?auto_14230 ?auto_14221 ) ) ( not ( = ?auto_14230 ?auto_14229 ) ) ( not ( = ?auto_14230 ?auto_14222 ) ) ( not ( = ?auto_14224 ?auto_14219 ) ) ( not ( = ?auto_14224 ?auto_14220 ) ) ( not ( = ?auto_14224 ?auto_14227 ) ) ( not ( = ?auto_14228 ?auto_14223 ) ) ( not ( = ?auto_14228 ?auto_14226 ) ) ( not ( = ?auto_14228 ?auto_14218 ) ) ( not ( = ?auto_14228 ?auto_14225 ) ) ( not ( = ?auto_14205 ?auto_14211 ) ) ( not ( = ?auto_14205 ?auto_14212 ) ) ( not ( = ?auto_14206 ?auto_14211 ) ) ( not ( = ?auto_14206 ?auto_14212 ) ) ( not ( = ?auto_14207 ?auto_14211 ) ) ( not ( = ?auto_14207 ?auto_14212 ) ) ( not ( = ?auto_14208 ?auto_14211 ) ) ( not ( = ?auto_14208 ?auto_14212 ) ) ( not ( = ?auto_14209 ?auto_14211 ) ) ( not ( = ?auto_14209 ?auto_14212 ) ) ( not ( = ?auto_14211 ?auto_14228 ) ) ( not ( = ?auto_14211 ?auto_14223 ) ) ( not ( = ?auto_14211 ?auto_14226 ) ) ( not ( = ?auto_14211 ?auto_14218 ) ) ( not ( = ?auto_14211 ?auto_14225 ) ) ( not ( = ?auto_14214 ?auto_14230 ) ) ( not ( = ?auto_14214 ?auto_14221 ) ) ( not ( = ?auto_14214 ?auto_14229 ) ) ( not ( = ?auto_14214 ?auto_14222 ) ) ( not ( = ?auto_14217 ?auto_14224 ) ) ( not ( = ?auto_14217 ?auto_14219 ) ) ( not ( = ?auto_14217 ?auto_14220 ) ) ( not ( = ?auto_14217 ?auto_14227 ) ) ( not ( = ?auto_14212 ?auto_14228 ) ) ( not ( = ?auto_14212 ?auto_14223 ) ) ( not ( = ?auto_14212 ?auto_14226 ) ) ( not ( = ?auto_14212 ?auto_14218 ) ) ( not ( = ?auto_14212 ?auto_14225 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_14205 ?auto_14206 ?auto_14207 ?auto_14208 ?auto_14209 ?auto_14210 )
      ( MAKE-1CRATE ?auto_14210 ?auto_14211 )
      ( MAKE-6CRATE-VERIFY ?auto_14205 ?auto_14206 ?auto_14207 ?auto_14208 ?auto_14209 ?auto_14210 ?auto_14211 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_14249 - SURFACE
      ?auto_14250 - SURFACE
      ?auto_14251 - SURFACE
      ?auto_14252 - SURFACE
      ?auto_14253 - SURFACE
      ?auto_14254 - SURFACE
      ?auto_14255 - SURFACE
      ?auto_14256 - SURFACE
    )
    :vars
    (
      ?auto_14258 - HOIST
      ?auto_14260 - PLACE
      ?auto_14261 - PLACE
      ?auto_14259 - HOIST
      ?auto_14262 - SURFACE
      ?auto_14273 - PLACE
      ?auto_14276 - HOIST
      ?auto_14274 - SURFACE
      ?auto_14270 - PLACE
      ?auto_14272 - HOIST
      ?auto_14268 - SURFACE
      ?auto_14278 - PLACE
      ?auto_14271 - HOIST
      ?auto_14263 - SURFACE
      ?auto_14264 - PLACE
      ?auto_14275 - HOIST
      ?auto_14267 - SURFACE
      ?auto_14265 - PLACE
      ?auto_14266 - HOIST
      ?auto_14269 - SURFACE
      ?auto_14277 - SURFACE
      ?auto_14257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14258 ?auto_14260 ) ( IS-CRATE ?auto_14256 ) ( not ( = ?auto_14261 ?auto_14260 ) ) ( HOIST-AT ?auto_14259 ?auto_14261 ) ( AVAILABLE ?auto_14259 ) ( SURFACE-AT ?auto_14256 ?auto_14261 ) ( ON ?auto_14256 ?auto_14262 ) ( CLEAR ?auto_14256 ) ( not ( = ?auto_14255 ?auto_14256 ) ) ( not ( = ?auto_14255 ?auto_14262 ) ) ( not ( = ?auto_14256 ?auto_14262 ) ) ( not ( = ?auto_14258 ?auto_14259 ) ) ( IS-CRATE ?auto_14255 ) ( not ( = ?auto_14273 ?auto_14260 ) ) ( HOIST-AT ?auto_14276 ?auto_14273 ) ( AVAILABLE ?auto_14276 ) ( SURFACE-AT ?auto_14255 ?auto_14273 ) ( ON ?auto_14255 ?auto_14274 ) ( CLEAR ?auto_14255 ) ( not ( = ?auto_14254 ?auto_14255 ) ) ( not ( = ?auto_14254 ?auto_14274 ) ) ( not ( = ?auto_14255 ?auto_14274 ) ) ( not ( = ?auto_14258 ?auto_14276 ) ) ( IS-CRATE ?auto_14254 ) ( not ( = ?auto_14270 ?auto_14260 ) ) ( HOIST-AT ?auto_14272 ?auto_14270 ) ( AVAILABLE ?auto_14272 ) ( SURFACE-AT ?auto_14254 ?auto_14270 ) ( ON ?auto_14254 ?auto_14268 ) ( CLEAR ?auto_14254 ) ( not ( = ?auto_14253 ?auto_14254 ) ) ( not ( = ?auto_14253 ?auto_14268 ) ) ( not ( = ?auto_14254 ?auto_14268 ) ) ( not ( = ?auto_14258 ?auto_14272 ) ) ( IS-CRATE ?auto_14253 ) ( not ( = ?auto_14278 ?auto_14260 ) ) ( HOIST-AT ?auto_14271 ?auto_14278 ) ( AVAILABLE ?auto_14271 ) ( SURFACE-AT ?auto_14253 ?auto_14278 ) ( ON ?auto_14253 ?auto_14263 ) ( CLEAR ?auto_14253 ) ( not ( = ?auto_14252 ?auto_14253 ) ) ( not ( = ?auto_14252 ?auto_14263 ) ) ( not ( = ?auto_14253 ?auto_14263 ) ) ( not ( = ?auto_14258 ?auto_14271 ) ) ( IS-CRATE ?auto_14252 ) ( not ( = ?auto_14264 ?auto_14260 ) ) ( HOIST-AT ?auto_14275 ?auto_14264 ) ( AVAILABLE ?auto_14275 ) ( SURFACE-AT ?auto_14252 ?auto_14264 ) ( ON ?auto_14252 ?auto_14267 ) ( CLEAR ?auto_14252 ) ( not ( = ?auto_14251 ?auto_14252 ) ) ( not ( = ?auto_14251 ?auto_14267 ) ) ( not ( = ?auto_14252 ?auto_14267 ) ) ( not ( = ?auto_14258 ?auto_14275 ) ) ( IS-CRATE ?auto_14251 ) ( not ( = ?auto_14265 ?auto_14260 ) ) ( HOIST-AT ?auto_14266 ?auto_14265 ) ( SURFACE-AT ?auto_14251 ?auto_14265 ) ( ON ?auto_14251 ?auto_14269 ) ( CLEAR ?auto_14251 ) ( not ( = ?auto_14250 ?auto_14251 ) ) ( not ( = ?auto_14250 ?auto_14269 ) ) ( not ( = ?auto_14251 ?auto_14269 ) ) ( not ( = ?auto_14258 ?auto_14266 ) ) ( SURFACE-AT ?auto_14249 ?auto_14260 ) ( CLEAR ?auto_14249 ) ( IS-CRATE ?auto_14250 ) ( AVAILABLE ?auto_14258 ) ( AVAILABLE ?auto_14266 ) ( SURFACE-AT ?auto_14250 ?auto_14265 ) ( ON ?auto_14250 ?auto_14277 ) ( CLEAR ?auto_14250 ) ( TRUCK-AT ?auto_14257 ?auto_14260 ) ( not ( = ?auto_14249 ?auto_14250 ) ) ( not ( = ?auto_14249 ?auto_14277 ) ) ( not ( = ?auto_14250 ?auto_14277 ) ) ( not ( = ?auto_14249 ?auto_14251 ) ) ( not ( = ?auto_14249 ?auto_14269 ) ) ( not ( = ?auto_14251 ?auto_14277 ) ) ( not ( = ?auto_14269 ?auto_14277 ) ) ( not ( = ?auto_14249 ?auto_14252 ) ) ( not ( = ?auto_14249 ?auto_14267 ) ) ( not ( = ?auto_14250 ?auto_14252 ) ) ( not ( = ?auto_14250 ?auto_14267 ) ) ( not ( = ?auto_14252 ?auto_14269 ) ) ( not ( = ?auto_14252 ?auto_14277 ) ) ( not ( = ?auto_14264 ?auto_14265 ) ) ( not ( = ?auto_14275 ?auto_14266 ) ) ( not ( = ?auto_14267 ?auto_14269 ) ) ( not ( = ?auto_14267 ?auto_14277 ) ) ( not ( = ?auto_14249 ?auto_14253 ) ) ( not ( = ?auto_14249 ?auto_14263 ) ) ( not ( = ?auto_14250 ?auto_14253 ) ) ( not ( = ?auto_14250 ?auto_14263 ) ) ( not ( = ?auto_14251 ?auto_14253 ) ) ( not ( = ?auto_14251 ?auto_14263 ) ) ( not ( = ?auto_14253 ?auto_14267 ) ) ( not ( = ?auto_14253 ?auto_14269 ) ) ( not ( = ?auto_14253 ?auto_14277 ) ) ( not ( = ?auto_14278 ?auto_14264 ) ) ( not ( = ?auto_14278 ?auto_14265 ) ) ( not ( = ?auto_14271 ?auto_14275 ) ) ( not ( = ?auto_14271 ?auto_14266 ) ) ( not ( = ?auto_14263 ?auto_14267 ) ) ( not ( = ?auto_14263 ?auto_14269 ) ) ( not ( = ?auto_14263 ?auto_14277 ) ) ( not ( = ?auto_14249 ?auto_14254 ) ) ( not ( = ?auto_14249 ?auto_14268 ) ) ( not ( = ?auto_14250 ?auto_14254 ) ) ( not ( = ?auto_14250 ?auto_14268 ) ) ( not ( = ?auto_14251 ?auto_14254 ) ) ( not ( = ?auto_14251 ?auto_14268 ) ) ( not ( = ?auto_14252 ?auto_14254 ) ) ( not ( = ?auto_14252 ?auto_14268 ) ) ( not ( = ?auto_14254 ?auto_14263 ) ) ( not ( = ?auto_14254 ?auto_14267 ) ) ( not ( = ?auto_14254 ?auto_14269 ) ) ( not ( = ?auto_14254 ?auto_14277 ) ) ( not ( = ?auto_14270 ?auto_14278 ) ) ( not ( = ?auto_14270 ?auto_14264 ) ) ( not ( = ?auto_14270 ?auto_14265 ) ) ( not ( = ?auto_14272 ?auto_14271 ) ) ( not ( = ?auto_14272 ?auto_14275 ) ) ( not ( = ?auto_14272 ?auto_14266 ) ) ( not ( = ?auto_14268 ?auto_14263 ) ) ( not ( = ?auto_14268 ?auto_14267 ) ) ( not ( = ?auto_14268 ?auto_14269 ) ) ( not ( = ?auto_14268 ?auto_14277 ) ) ( not ( = ?auto_14249 ?auto_14255 ) ) ( not ( = ?auto_14249 ?auto_14274 ) ) ( not ( = ?auto_14250 ?auto_14255 ) ) ( not ( = ?auto_14250 ?auto_14274 ) ) ( not ( = ?auto_14251 ?auto_14255 ) ) ( not ( = ?auto_14251 ?auto_14274 ) ) ( not ( = ?auto_14252 ?auto_14255 ) ) ( not ( = ?auto_14252 ?auto_14274 ) ) ( not ( = ?auto_14253 ?auto_14255 ) ) ( not ( = ?auto_14253 ?auto_14274 ) ) ( not ( = ?auto_14255 ?auto_14268 ) ) ( not ( = ?auto_14255 ?auto_14263 ) ) ( not ( = ?auto_14255 ?auto_14267 ) ) ( not ( = ?auto_14255 ?auto_14269 ) ) ( not ( = ?auto_14255 ?auto_14277 ) ) ( not ( = ?auto_14273 ?auto_14270 ) ) ( not ( = ?auto_14273 ?auto_14278 ) ) ( not ( = ?auto_14273 ?auto_14264 ) ) ( not ( = ?auto_14273 ?auto_14265 ) ) ( not ( = ?auto_14276 ?auto_14272 ) ) ( not ( = ?auto_14276 ?auto_14271 ) ) ( not ( = ?auto_14276 ?auto_14275 ) ) ( not ( = ?auto_14276 ?auto_14266 ) ) ( not ( = ?auto_14274 ?auto_14268 ) ) ( not ( = ?auto_14274 ?auto_14263 ) ) ( not ( = ?auto_14274 ?auto_14267 ) ) ( not ( = ?auto_14274 ?auto_14269 ) ) ( not ( = ?auto_14274 ?auto_14277 ) ) ( not ( = ?auto_14249 ?auto_14256 ) ) ( not ( = ?auto_14249 ?auto_14262 ) ) ( not ( = ?auto_14250 ?auto_14256 ) ) ( not ( = ?auto_14250 ?auto_14262 ) ) ( not ( = ?auto_14251 ?auto_14256 ) ) ( not ( = ?auto_14251 ?auto_14262 ) ) ( not ( = ?auto_14252 ?auto_14256 ) ) ( not ( = ?auto_14252 ?auto_14262 ) ) ( not ( = ?auto_14253 ?auto_14256 ) ) ( not ( = ?auto_14253 ?auto_14262 ) ) ( not ( = ?auto_14254 ?auto_14256 ) ) ( not ( = ?auto_14254 ?auto_14262 ) ) ( not ( = ?auto_14256 ?auto_14274 ) ) ( not ( = ?auto_14256 ?auto_14268 ) ) ( not ( = ?auto_14256 ?auto_14263 ) ) ( not ( = ?auto_14256 ?auto_14267 ) ) ( not ( = ?auto_14256 ?auto_14269 ) ) ( not ( = ?auto_14256 ?auto_14277 ) ) ( not ( = ?auto_14261 ?auto_14273 ) ) ( not ( = ?auto_14261 ?auto_14270 ) ) ( not ( = ?auto_14261 ?auto_14278 ) ) ( not ( = ?auto_14261 ?auto_14264 ) ) ( not ( = ?auto_14261 ?auto_14265 ) ) ( not ( = ?auto_14259 ?auto_14276 ) ) ( not ( = ?auto_14259 ?auto_14272 ) ) ( not ( = ?auto_14259 ?auto_14271 ) ) ( not ( = ?auto_14259 ?auto_14275 ) ) ( not ( = ?auto_14259 ?auto_14266 ) ) ( not ( = ?auto_14262 ?auto_14274 ) ) ( not ( = ?auto_14262 ?auto_14268 ) ) ( not ( = ?auto_14262 ?auto_14263 ) ) ( not ( = ?auto_14262 ?auto_14267 ) ) ( not ( = ?auto_14262 ?auto_14269 ) ) ( not ( = ?auto_14262 ?auto_14277 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_14249 ?auto_14250 ?auto_14251 ?auto_14252 ?auto_14253 ?auto_14254 ?auto_14255 )
      ( MAKE-1CRATE ?auto_14255 ?auto_14256 )
      ( MAKE-7CRATE-VERIFY ?auto_14249 ?auto_14250 ?auto_14251 ?auto_14252 ?auto_14253 ?auto_14254 ?auto_14255 ?auto_14256 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_14298 - SURFACE
      ?auto_14299 - SURFACE
      ?auto_14300 - SURFACE
      ?auto_14301 - SURFACE
      ?auto_14302 - SURFACE
      ?auto_14303 - SURFACE
      ?auto_14304 - SURFACE
      ?auto_14305 - SURFACE
      ?auto_14306 - SURFACE
    )
    :vars
    (
      ?auto_14309 - HOIST
      ?auto_14310 - PLACE
      ?auto_14311 - PLACE
      ?auto_14307 - HOIST
      ?auto_14312 - SURFACE
      ?auto_14330 - PLACE
      ?auto_14320 - HOIST
      ?auto_14316 - SURFACE
      ?auto_14327 - PLACE
      ?auto_14322 - HOIST
      ?auto_14317 - SURFACE
      ?auto_14315 - PLACE
      ?auto_14314 - HOIST
      ?auto_14324 - SURFACE
      ?auto_14319 - PLACE
      ?auto_14318 - HOIST
      ?auto_14328 - SURFACE
      ?auto_14329 - PLACE
      ?auto_14331 - HOIST
      ?auto_14325 - SURFACE
      ?auto_14321 - PLACE
      ?auto_14313 - HOIST
      ?auto_14326 - SURFACE
      ?auto_14323 - SURFACE
      ?auto_14308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14309 ?auto_14310 ) ( IS-CRATE ?auto_14306 ) ( not ( = ?auto_14311 ?auto_14310 ) ) ( HOIST-AT ?auto_14307 ?auto_14311 ) ( AVAILABLE ?auto_14307 ) ( SURFACE-AT ?auto_14306 ?auto_14311 ) ( ON ?auto_14306 ?auto_14312 ) ( CLEAR ?auto_14306 ) ( not ( = ?auto_14305 ?auto_14306 ) ) ( not ( = ?auto_14305 ?auto_14312 ) ) ( not ( = ?auto_14306 ?auto_14312 ) ) ( not ( = ?auto_14309 ?auto_14307 ) ) ( IS-CRATE ?auto_14305 ) ( not ( = ?auto_14330 ?auto_14310 ) ) ( HOIST-AT ?auto_14320 ?auto_14330 ) ( AVAILABLE ?auto_14320 ) ( SURFACE-AT ?auto_14305 ?auto_14330 ) ( ON ?auto_14305 ?auto_14316 ) ( CLEAR ?auto_14305 ) ( not ( = ?auto_14304 ?auto_14305 ) ) ( not ( = ?auto_14304 ?auto_14316 ) ) ( not ( = ?auto_14305 ?auto_14316 ) ) ( not ( = ?auto_14309 ?auto_14320 ) ) ( IS-CRATE ?auto_14304 ) ( not ( = ?auto_14327 ?auto_14310 ) ) ( HOIST-AT ?auto_14322 ?auto_14327 ) ( AVAILABLE ?auto_14322 ) ( SURFACE-AT ?auto_14304 ?auto_14327 ) ( ON ?auto_14304 ?auto_14317 ) ( CLEAR ?auto_14304 ) ( not ( = ?auto_14303 ?auto_14304 ) ) ( not ( = ?auto_14303 ?auto_14317 ) ) ( not ( = ?auto_14304 ?auto_14317 ) ) ( not ( = ?auto_14309 ?auto_14322 ) ) ( IS-CRATE ?auto_14303 ) ( not ( = ?auto_14315 ?auto_14310 ) ) ( HOIST-AT ?auto_14314 ?auto_14315 ) ( AVAILABLE ?auto_14314 ) ( SURFACE-AT ?auto_14303 ?auto_14315 ) ( ON ?auto_14303 ?auto_14324 ) ( CLEAR ?auto_14303 ) ( not ( = ?auto_14302 ?auto_14303 ) ) ( not ( = ?auto_14302 ?auto_14324 ) ) ( not ( = ?auto_14303 ?auto_14324 ) ) ( not ( = ?auto_14309 ?auto_14314 ) ) ( IS-CRATE ?auto_14302 ) ( not ( = ?auto_14319 ?auto_14310 ) ) ( HOIST-AT ?auto_14318 ?auto_14319 ) ( AVAILABLE ?auto_14318 ) ( SURFACE-AT ?auto_14302 ?auto_14319 ) ( ON ?auto_14302 ?auto_14328 ) ( CLEAR ?auto_14302 ) ( not ( = ?auto_14301 ?auto_14302 ) ) ( not ( = ?auto_14301 ?auto_14328 ) ) ( not ( = ?auto_14302 ?auto_14328 ) ) ( not ( = ?auto_14309 ?auto_14318 ) ) ( IS-CRATE ?auto_14301 ) ( not ( = ?auto_14329 ?auto_14310 ) ) ( HOIST-AT ?auto_14331 ?auto_14329 ) ( AVAILABLE ?auto_14331 ) ( SURFACE-AT ?auto_14301 ?auto_14329 ) ( ON ?auto_14301 ?auto_14325 ) ( CLEAR ?auto_14301 ) ( not ( = ?auto_14300 ?auto_14301 ) ) ( not ( = ?auto_14300 ?auto_14325 ) ) ( not ( = ?auto_14301 ?auto_14325 ) ) ( not ( = ?auto_14309 ?auto_14331 ) ) ( IS-CRATE ?auto_14300 ) ( not ( = ?auto_14321 ?auto_14310 ) ) ( HOIST-AT ?auto_14313 ?auto_14321 ) ( SURFACE-AT ?auto_14300 ?auto_14321 ) ( ON ?auto_14300 ?auto_14326 ) ( CLEAR ?auto_14300 ) ( not ( = ?auto_14299 ?auto_14300 ) ) ( not ( = ?auto_14299 ?auto_14326 ) ) ( not ( = ?auto_14300 ?auto_14326 ) ) ( not ( = ?auto_14309 ?auto_14313 ) ) ( SURFACE-AT ?auto_14298 ?auto_14310 ) ( CLEAR ?auto_14298 ) ( IS-CRATE ?auto_14299 ) ( AVAILABLE ?auto_14309 ) ( AVAILABLE ?auto_14313 ) ( SURFACE-AT ?auto_14299 ?auto_14321 ) ( ON ?auto_14299 ?auto_14323 ) ( CLEAR ?auto_14299 ) ( TRUCK-AT ?auto_14308 ?auto_14310 ) ( not ( = ?auto_14298 ?auto_14299 ) ) ( not ( = ?auto_14298 ?auto_14323 ) ) ( not ( = ?auto_14299 ?auto_14323 ) ) ( not ( = ?auto_14298 ?auto_14300 ) ) ( not ( = ?auto_14298 ?auto_14326 ) ) ( not ( = ?auto_14300 ?auto_14323 ) ) ( not ( = ?auto_14326 ?auto_14323 ) ) ( not ( = ?auto_14298 ?auto_14301 ) ) ( not ( = ?auto_14298 ?auto_14325 ) ) ( not ( = ?auto_14299 ?auto_14301 ) ) ( not ( = ?auto_14299 ?auto_14325 ) ) ( not ( = ?auto_14301 ?auto_14326 ) ) ( not ( = ?auto_14301 ?auto_14323 ) ) ( not ( = ?auto_14329 ?auto_14321 ) ) ( not ( = ?auto_14331 ?auto_14313 ) ) ( not ( = ?auto_14325 ?auto_14326 ) ) ( not ( = ?auto_14325 ?auto_14323 ) ) ( not ( = ?auto_14298 ?auto_14302 ) ) ( not ( = ?auto_14298 ?auto_14328 ) ) ( not ( = ?auto_14299 ?auto_14302 ) ) ( not ( = ?auto_14299 ?auto_14328 ) ) ( not ( = ?auto_14300 ?auto_14302 ) ) ( not ( = ?auto_14300 ?auto_14328 ) ) ( not ( = ?auto_14302 ?auto_14325 ) ) ( not ( = ?auto_14302 ?auto_14326 ) ) ( not ( = ?auto_14302 ?auto_14323 ) ) ( not ( = ?auto_14319 ?auto_14329 ) ) ( not ( = ?auto_14319 ?auto_14321 ) ) ( not ( = ?auto_14318 ?auto_14331 ) ) ( not ( = ?auto_14318 ?auto_14313 ) ) ( not ( = ?auto_14328 ?auto_14325 ) ) ( not ( = ?auto_14328 ?auto_14326 ) ) ( not ( = ?auto_14328 ?auto_14323 ) ) ( not ( = ?auto_14298 ?auto_14303 ) ) ( not ( = ?auto_14298 ?auto_14324 ) ) ( not ( = ?auto_14299 ?auto_14303 ) ) ( not ( = ?auto_14299 ?auto_14324 ) ) ( not ( = ?auto_14300 ?auto_14303 ) ) ( not ( = ?auto_14300 ?auto_14324 ) ) ( not ( = ?auto_14301 ?auto_14303 ) ) ( not ( = ?auto_14301 ?auto_14324 ) ) ( not ( = ?auto_14303 ?auto_14328 ) ) ( not ( = ?auto_14303 ?auto_14325 ) ) ( not ( = ?auto_14303 ?auto_14326 ) ) ( not ( = ?auto_14303 ?auto_14323 ) ) ( not ( = ?auto_14315 ?auto_14319 ) ) ( not ( = ?auto_14315 ?auto_14329 ) ) ( not ( = ?auto_14315 ?auto_14321 ) ) ( not ( = ?auto_14314 ?auto_14318 ) ) ( not ( = ?auto_14314 ?auto_14331 ) ) ( not ( = ?auto_14314 ?auto_14313 ) ) ( not ( = ?auto_14324 ?auto_14328 ) ) ( not ( = ?auto_14324 ?auto_14325 ) ) ( not ( = ?auto_14324 ?auto_14326 ) ) ( not ( = ?auto_14324 ?auto_14323 ) ) ( not ( = ?auto_14298 ?auto_14304 ) ) ( not ( = ?auto_14298 ?auto_14317 ) ) ( not ( = ?auto_14299 ?auto_14304 ) ) ( not ( = ?auto_14299 ?auto_14317 ) ) ( not ( = ?auto_14300 ?auto_14304 ) ) ( not ( = ?auto_14300 ?auto_14317 ) ) ( not ( = ?auto_14301 ?auto_14304 ) ) ( not ( = ?auto_14301 ?auto_14317 ) ) ( not ( = ?auto_14302 ?auto_14304 ) ) ( not ( = ?auto_14302 ?auto_14317 ) ) ( not ( = ?auto_14304 ?auto_14324 ) ) ( not ( = ?auto_14304 ?auto_14328 ) ) ( not ( = ?auto_14304 ?auto_14325 ) ) ( not ( = ?auto_14304 ?auto_14326 ) ) ( not ( = ?auto_14304 ?auto_14323 ) ) ( not ( = ?auto_14327 ?auto_14315 ) ) ( not ( = ?auto_14327 ?auto_14319 ) ) ( not ( = ?auto_14327 ?auto_14329 ) ) ( not ( = ?auto_14327 ?auto_14321 ) ) ( not ( = ?auto_14322 ?auto_14314 ) ) ( not ( = ?auto_14322 ?auto_14318 ) ) ( not ( = ?auto_14322 ?auto_14331 ) ) ( not ( = ?auto_14322 ?auto_14313 ) ) ( not ( = ?auto_14317 ?auto_14324 ) ) ( not ( = ?auto_14317 ?auto_14328 ) ) ( not ( = ?auto_14317 ?auto_14325 ) ) ( not ( = ?auto_14317 ?auto_14326 ) ) ( not ( = ?auto_14317 ?auto_14323 ) ) ( not ( = ?auto_14298 ?auto_14305 ) ) ( not ( = ?auto_14298 ?auto_14316 ) ) ( not ( = ?auto_14299 ?auto_14305 ) ) ( not ( = ?auto_14299 ?auto_14316 ) ) ( not ( = ?auto_14300 ?auto_14305 ) ) ( not ( = ?auto_14300 ?auto_14316 ) ) ( not ( = ?auto_14301 ?auto_14305 ) ) ( not ( = ?auto_14301 ?auto_14316 ) ) ( not ( = ?auto_14302 ?auto_14305 ) ) ( not ( = ?auto_14302 ?auto_14316 ) ) ( not ( = ?auto_14303 ?auto_14305 ) ) ( not ( = ?auto_14303 ?auto_14316 ) ) ( not ( = ?auto_14305 ?auto_14317 ) ) ( not ( = ?auto_14305 ?auto_14324 ) ) ( not ( = ?auto_14305 ?auto_14328 ) ) ( not ( = ?auto_14305 ?auto_14325 ) ) ( not ( = ?auto_14305 ?auto_14326 ) ) ( not ( = ?auto_14305 ?auto_14323 ) ) ( not ( = ?auto_14330 ?auto_14327 ) ) ( not ( = ?auto_14330 ?auto_14315 ) ) ( not ( = ?auto_14330 ?auto_14319 ) ) ( not ( = ?auto_14330 ?auto_14329 ) ) ( not ( = ?auto_14330 ?auto_14321 ) ) ( not ( = ?auto_14320 ?auto_14322 ) ) ( not ( = ?auto_14320 ?auto_14314 ) ) ( not ( = ?auto_14320 ?auto_14318 ) ) ( not ( = ?auto_14320 ?auto_14331 ) ) ( not ( = ?auto_14320 ?auto_14313 ) ) ( not ( = ?auto_14316 ?auto_14317 ) ) ( not ( = ?auto_14316 ?auto_14324 ) ) ( not ( = ?auto_14316 ?auto_14328 ) ) ( not ( = ?auto_14316 ?auto_14325 ) ) ( not ( = ?auto_14316 ?auto_14326 ) ) ( not ( = ?auto_14316 ?auto_14323 ) ) ( not ( = ?auto_14298 ?auto_14306 ) ) ( not ( = ?auto_14298 ?auto_14312 ) ) ( not ( = ?auto_14299 ?auto_14306 ) ) ( not ( = ?auto_14299 ?auto_14312 ) ) ( not ( = ?auto_14300 ?auto_14306 ) ) ( not ( = ?auto_14300 ?auto_14312 ) ) ( not ( = ?auto_14301 ?auto_14306 ) ) ( not ( = ?auto_14301 ?auto_14312 ) ) ( not ( = ?auto_14302 ?auto_14306 ) ) ( not ( = ?auto_14302 ?auto_14312 ) ) ( not ( = ?auto_14303 ?auto_14306 ) ) ( not ( = ?auto_14303 ?auto_14312 ) ) ( not ( = ?auto_14304 ?auto_14306 ) ) ( not ( = ?auto_14304 ?auto_14312 ) ) ( not ( = ?auto_14306 ?auto_14316 ) ) ( not ( = ?auto_14306 ?auto_14317 ) ) ( not ( = ?auto_14306 ?auto_14324 ) ) ( not ( = ?auto_14306 ?auto_14328 ) ) ( not ( = ?auto_14306 ?auto_14325 ) ) ( not ( = ?auto_14306 ?auto_14326 ) ) ( not ( = ?auto_14306 ?auto_14323 ) ) ( not ( = ?auto_14311 ?auto_14330 ) ) ( not ( = ?auto_14311 ?auto_14327 ) ) ( not ( = ?auto_14311 ?auto_14315 ) ) ( not ( = ?auto_14311 ?auto_14319 ) ) ( not ( = ?auto_14311 ?auto_14329 ) ) ( not ( = ?auto_14311 ?auto_14321 ) ) ( not ( = ?auto_14307 ?auto_14320 ) ) ( not ( = ?auto_14307 ?auto_14322 ) ) ( not ( = ?auto_14307 ?auto_14314 ) ) ( not ( = ?auto_14307 ?auto_14318 ) ) ( not ( = ?auto_14307 ?auto_14331 ) ) ( not ( = ?auto_14307 ?auto_14313 ) ) ( not ( = ?auto_14312 ?auto_14316 ) ) ( not ( = ?auto_14312 ?auto_14317 ) ) ( not ( = ?auto_14312 ?auto_14324 ) ) ( not ( = ?auto_14312 ?auto_14328 ) ) ( not ( = ?auto_14312 ?auto_14325 ) ) ( not ( = ?auto_14312 ?auto_14326 ) ) ( not ( = ?auto_14312 ?auto_14323 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_14298 ?auto_14299 ?auto_14300 ?auto_14301 ?auto_14302 ?auto_14303 ?auto_14304 ?auto_14305 )
      ( MAKE-1CRATE ?auto_14305 ?auto_14306 )
      ( MAKE-8CRATE-VERIFY ?auto_14298 ?auto_14299 ?auto_14300 ?auto_14301 ?auto_14302 ?auto_14303 ?auto_14304 ?auto_14305 ?auto_14306 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_14352 - SURFACE
      ?auto_14353 - SURFACE
      ?auto_14354 - SURFACE
      ?auto_14355 - SURFACE
      ?auto_14356 - SURFACE
      ?auto_14357 - SURFACE
      ?auto_14358 - SURFACE
      ?auto_14359 - SURFACE
      ?auto_14360 - SURFACE
      ?auto_14361 - SURFACE
    )
    :vars
    (
      ?auto_14364 - HOIST
      ?auto_14365 - PLACE
      ?auto_14362 - PLACE
      ?auto_14363 - HOIST
      ?auto_14366 - SURFACE
      ?auto_14375 - PLACE
      ?auto_14387 - HOIST
      ?auto_14374 - SURFACE
      ?auto_14383 - PLACE
      ?auto_14372 - HOIST
      ?auto_14373 - SURFACE
      ?auto_14379 - PLACE
      ?auto_14368 - HOIST
      ?auto_14369 - SURFACE
      ?auto_14384 - SURFACE
      ?auto_14378 - PLACE
      ?auto_14380 - HOIST
      ?auto_14382 - SURFACE
      ?auto_14377 - PLACE
      ?auto_14371 - HOIST
      ?auto_14370 - SURFACE
      ?auto_14376 - PLACE
      ?auto_14385 - HOIST
      ?auto_14386 - SURFACE
      ?auto_14381 - SURFACE
      ?auto_14367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14364 ?auto_14365 ) ( IS-CRATE ?auto_14361 ) ( not ( = ?auto_14362 ?auto_14365 ) ) ( HOIST-AT ?auto_14363 ?auto_14362 ) ( SURFACE-AT ?auto_14361 ?auto_14362 ) ( ON ?auto_14361 ?auto_14366 ) ( CLEAR ?auto_14361 ) ( not ( = ?auto_14360 ?auto_14361 ) ) ( not ( = ?auto_14360 ?auto_14366 ) ) ( not ( = ?auto_14361 ?auto_14366 ) ) ( not ( = ?auto_14364 ?auto_14363 ) ) ( IS-CRATE ?auto_14360 ) ( not ( = ?auto_14375 ?auto_14365 ) ) ( HOIST-AT ?auto_14387 ?auto_14375 ) ( AVAILABLE ?auto_14387 ) ( SURFACE-AT ?auto_14360 ?auto_14375 ) ( ON ?auto_14360 ?auto_14374 ) ( CLEAR ?auto_14360 ) ( not ( = ?auto_14359 ?auto_14360 ) ) ( not ( = ?auto_14359 ?auto_14374 ) ) ( not ( = ?auto_14360 ?auto_14374 ) ) ( not ( = ?auto_14364 ?auto_14387 ) ) ( IS-CRATE ?auto_14359 ) ( not ( = ?auto_14383 ?auto_14365 ) ) ( HOIST-AT ?auto_14372 ?auto_14383 ) ( AVAILABLE ?auto_14372 ) ( SURFACE-AT ?auto_14359 ?auto_14383 ) ( ON ?auto_14359 ?auto_14373 ) ( CLEAR ?auto_14359 ) ( not ( = ?auto_14358 ?auto_14359 ) ) ( not ( = ?auto_14358 ?auto_14373 ) ) ( not ( = ?auto_14359 ?auto_14373 ) ) ( not ( = ?auto_14364 ?auto_14372 ) ) ( IS-CRATE ?auto_14358 ) ( not ( = ?auto_14379 ?auto_14365 ) ) ( HOIST-AT ?auto_14368 ?auto_14379 ) ( AVAILABLE ?auto_14368 ) ( SURFACE-AT ?auto_14358 ?auto_14379 ) ( ON ?auto_14358 ?auto_14369 ) ( CLEAR ?auto_14358 ) ( not ( = ?auto_14357 ?auto_14358 ) ) ( not ( = ?auto_14357 ?auto_14369 ) ) ( not ( = ?auto_14358 ?auto_14369 ) ) ( not ( = ?auto_14364 ?auto_14368 ) ) ( IS-CRATE ?auto_14357 ) ( AVAILABLE ?auto_14363 ) ( SURFACE-AT ?auto_14357 ?auto_14362 ) ( ON ?auto_14357 ?auto_14384 ) ( CLEAR ?auto_14357 ) ( not ( = ?auto_14356 ?auto_14357 ) ) ( not ( = ?auto_14356 ?auto_14384 ) ) ( not ( = ?auto_14357 ?auto_14384 ) ) ( IS-CRATE ?auto_14356 ) ( not ( = ?auto_14378 ?auto_14365 ) ) ( HOIST-AT ?auto_14380 ?auto_14378 ) ( AVAILABLE ?auto_14380 ) ( SURFACE-AT ?auto_14356 ?auto_14378 ) ( ON ?auto_14356 ?auto_14382 ) ( CLEAR ?auto_14356 ) ( not ( = ?auto_14355 ?auto_14356 ) ) ( not ( = ?auto_14355 ?auto_14382 ) ) ( not ( = ?auto_14356 ?auto_14382 ) ) ( not ( = ?auto_14364 ?auto_14380 ) ) ( IS-CRATE ?auto_14355 ) ( not ( = ?auto_14377 ?auto_14365 ) ) ( HOIST-AT ?auto_14371 ?auto_14377 ) ( AVAILABLE ?auto_14371 ) ( SURFACE-AT ?auto_14355 ?auto_14377 ) ( ON ?auto_14355 ?auto_14370 ) ( CLEAR ?auto_14355 ) ( not ( = ?auto_14354 ?auto_14355 ) ) ( not ( = ?auto_14354 ?auto_14370 ) ) ( not ( = ?auto_14355 ?auto_14370 ) ) ( not ( = ?auto_14364 ?auto_14371 ) ) ( IS-CRATE ?auto_14354 ) ( not ( = ?auto_14376 ?auto_14365 ) ) ( HOIST-AT ?auto_14385 ?auto_14376 ) ( SURFACE-AT ?auto_14354 ?auto_14376 ) ( ON ?auto_14354 ?auto_14386 ) ( CLEAR ?auto_14354 ) ( not ( = ?auto_14353 ?auto_14354 ) ) ( not ( = ?auto_14353 ?auto_14386 ) ) ( not ( = ?auto_14354 ?auto_14386 ) ) ( not ( = ?auto_14364 ?auto_14385 ) ) ( SURFACE-AT ?auto_14352 ?auto_14365 ) ( CLEAR ?auto_14352 ) ( IS-CRATE ?auto_14353 ) ( AVAILABLE ?auto_14364 ) ( AVAILABLE ?auto_14385 ) ( SURFACE-AT ?auto_14353 ?auto_14376 ) ( ON ?auto_14353 ?auto_14381 ) ( CLEAR ?auto_14353 ) ( TRUCK-AT ?auto_14367 ?auto_14365 ) ( not ( = ?auto_14352 ?auto_14353 ) ) ( not ( = ?auto_14352 ?auto_14381 ) ) ( not ( = ?auto_14353 ?auto_14381 ) ) ( not ( = ?auto_14352 ?auto_14354 ) ) ( not ( = ?auto_14352 ?auto_14386 ) ) ( not ( = ?auto_14354 ?auto_14381 ) ) ( not ( = ?auto_14386 ?auto_14381 ) ) ( not ( = ?auto_14352 ?auto_14355 ) ) ( not ( = ?auto_14352 ?auto_14370 ) ) ( not ( = ?auto_14353 ?auto_14355 ) ) ( not ( = ?auto_14353 ?auto_14370 ) ) ( not ( = ?auto_14355 ?auto_14386 ) ) ( not ( = ?auto_14355 ?auto_14381 ) ) ( not ( = ?auto_14377 ?auto_14376 ) ) ( not ( = ?auto_14371 ?auto_14385 ) ) ( not ( = ?auto_14370 ?auto_14386 ) ) ( not ( = ?auto_14370 ?auto_14381 ) ) ( not ( = ?auto_14352 ?auto_14356 ) ) ( not ( = ?auto_14352 ?auto_14382 ) ) ( not ( = ?auto_14353 ?auto_14356 ) ) ( not ( = ?auto_14353 ?auto_14382 ) ) ( not ( = ?auto_14354 ?auto_14356 ) ) ( not ( = ?auto_14354 ?auto_14382 ) ) ( not ( = ?auto_14356 ?auto_14370 ) ) ( not ( = ?auto_14356 ?auto_14386 ) ) ( not ( = ?auto_14356 ?auto_14381 ) ) ( not ( = ?auto_14378 ?auto_14377 ) ) ( not ( = ?auto_14378 ?auto_14376 ) ) ( not ( = ?auto_14380 ?auto_14371 ) ) ( not ( = ?auto_14380 ?auto_14385 ) ) ( not ( = ?auto_14382 ?auto_14370 ) ) ( not ( = ?auto_14382 ?auto_14386 ) ) ( not ( = ?auto_14382 ?auto_14381 ) ) ( not ( = ?auto_14352 ?auto_14357 ) ) ( not ( = ?auto_14352 ?auto_14384 ) ) ( not ( = ?auto_14353 ?auto_14357 ) ) ( not ( = ?auto_14353 ?auto_14384 ) ) ( not ( = ?auto_14354 ?auto_14357 ) ) ( not ( = ?auto_14354 ?auto_14384 ) ) ( not ( = ?auto_14355 ?auto_14357 ) ) ( not ( = ?auto_14355 ?auto_14384 ) ) ( not ( = ?auto_14357 ?auto_14382 ) ) ( not ( = ?auto_14357 ?auto_14370 ) ) ( not ( = ?auto_14357 ?auto_14386 ) ) ( not ( = ?auto_14357 ?auto_14381 ) ) ( not ( = ?auto_14362 ?auto_14378 ) ) ( not ( = ?auto_14362 ?auto_14377 ) ) ( not ( = ?auto_14362 ?auto_14376 ) ) ( not ( = ?auto_14363 ?auto_14380 ) ) ( not ( = ?auto_14363 ?auto_14371 ) ) ( not ( = ?auto_14363 ?auto_14385 ) ) ( not ( = ?auto_14384 ?auto_14382 ) ) ( not ( = ?auto_14384 ?auto_14370 ) ) ( not ( = ?auto_14384 ?auto_14386 ) ) ( not ( = ?auto_14384 ?auto_14381 ) ) ( not ( = ?auto_14352 ?auto_14358 ) ) ( not ( = ?auto_14352 ?auto_14369 ) ) ( not ( = ?auto_14353 ?auto_14358 ) ) ( not ( = ?auto_14353 ?auto_14369 ) ) ( not ( = ?auto_14354 ?auto_14358 ) ) ( not ( = ?auto_14354 ?auto_14369 ) ) ( not ( = ?auto_14355 ?auto_14358 ) ) ( not ( = ?auto_14355 ?auto_14369 ) ) ( not ( = ?auto_14356 ?auto_14358 ) ) ( not ( = ?auto_14356 ?auto_14369 ) ) ( not ( = ?auto_14358 ?auto_14384 ) ) ( not ( = ?auto_14358 ?auto_14382 ) ) ( not ( = ?auto_14358 ?auto_14370 ) ) ( not ( = ?auto_14358 ?auto_14386 ) ) ( not ( = ?auto_14358 ?auto_14381 ) ) ( not ( = ?auto_14379 ?auto_14362 ) ) ( not ( = ?auto_14379 ?auto_14378 ) ) ( not ( = ?auto_14379 ?auto_14377 ) ) ( not ( = ?auto_14379 ?auto_14376 ) ) ( not ( = ?auto_14368 ?auto_14363 ) ) ( not ( = ?auto_14368 ?auto_14380 ) ) ( not ( = ?auto_14368 ?auto_14371 ) ) ( not ( = ?auto_14368 ?auto_14385 ) ) ( not ( = ?auto_14369 ?auto_14384 ) ) ( not ( = ?auto_14369 ?auto_14382 ) ) ( not ( = ?auto_14369 ?auto_14370 ) ) ( not ( = ?auto_14369 ?auto_14386 ) ) ( not ( = ?auto_14369 ?auto_14381 ) ) ( not ( = ?auto_14352 ?auto_14359 ) ) ( not ( = ?auto_14352 ?auto_14373 ) ) ( not ( = ?auto_14353 ?auto_14359 ) ) ( not ( = ?auto_14353 ?auto_14373 ) ) ( not ( = ?auto_14354 ?auto_14359 ) ) ( not ( = ?auto_14354 ?auto_14373 ) ) ( not ( = ?auto_14355 ?auto_14359 ) ) ( not ( = ?auto_14355 ?auto_14373 ) ) ( not ( = ?auto_14356 ?auto_14359 ) ) ( not ( = ?auto_14356 ?auto_14373 ) ) ( not ( = ?auto_14357 ?auto_14359 ) ) ( not ( = ?auto_14357 ?auto_14373 ) ) ( not ( = ?auto_14359 ?auto_14369 ) ) ( not ( = ?auto_14359 ?auto_14384 ) ) ( not ( = ?auto_14359 ?auto_14382 ) ) ( not ( = ?auto_14359 ?auto_14370 ) ) ( not ( = ?auto_14359 ?auto_14386 ) ) ( not ( = ?auto_14359 ?auto_14381 ) ) ( not ( = ?auto_14383 ?auto_14379 ) ) ( not ( = ?auto_14383 ?auto_14362 ) ) ( not ( = ?auto_14383 ?auto_14378 ) ) ( not ( = ?auto_14383 ?auto_14377 ) ) ( not ( = ?auto_14383 ?auto_14376 ) ) ( not ( = ?auto_14372 ?auto_14368 ) ) ( not ( = ?auto_14372 ?auto_14363 ) ) ( not ( = ?auto_14372 ?auto_14380 ) ) ( not ( = ?auto_14372 ?auto_14371 ) ) ( not ( = ?auto_14372 ?auto_14385 ) ) ( not ( = ?auto_14373 ?auto_14369 ) ) ( not ( = ?auto_14373 ?auto_14384 ) ) ( not ( = ?auto_14373 ?auto_14382 ) ) ( not ( = ?auto_14373 ?auto_14370 ) ) ( not ( = ?auto_14373 ?auto_14386 ) ) ( not ( = ?auto_14373 ?auto_14381 ) ) ( not ( = ?auto_14352 ?auto_14360 ) ) ( not ( = ?auto_14352 ?auto_14374 ) ) ( not ( = ?auto_14353 ?auto_14360 ) ) ( not ( = ?auto_14353 ?auto_14374 ) ) ( not ( = ?auto_14354 ?auto_14360 ) ) ( not ( = ?auto_14354 ?auto_14374 ) ) ( not ( = ?auto_14355 ?auto_14360 ) ) ( not ( = ?auto_14355 ?auto_14374 ) ) ( not ( = ?auto_14356 ?auto_14360 ) ) ( not ( = ?auto_14356 ?auto_14374 ) ) ( not ( = ?auto_14357 ?auto_14360 ) ) ( not ( = ?auto_14357 ?auto_14374 ) ) ( not ( = ?auto_14358 ?auto_14360 ) ) ( not ( = ?auto_14358 ?auto_14374 ) ) ( not ( = ?auto_14360 ?auto_14373 ) ) ( not ( = ?auto_14360 ?auto_14369 ) ) ( not ( = ?auto_14360 ?auto_14384 ) ) ( not ( = ?auto_14360 ?auto_14382 ) ) ( not ( = ?auto_14360 ?auto_14370 ) ) ( not ( = ?auto_14360 ?auto_14386 ) ) ( not ( = ?auto_14360 ?auto_14381 ) ) ( not ( = ?auto_14375 ?auto_14383 ) ) ( not ( = ?auto_14375 ?auto_14379 ) ) ( not ( = ?auto_14375 ?auto_14362 ) ) ( not ( = ?auto_14375 ?auto_14378 ) ) ( not ( = ?auto_14375 ?auto_14377 ) ) ( not ( = ?auto_14375 ?auto_14376 ) ) ( not ( = ?auto_14387 ?auto_14372 ) ) ( not ( = ?auto_14387 ?auto_14368 ) ) ( not ( = ?auto_14387 ?auto_14363 ) ) ( not ( = ?auto_14387 ?auto_14380 ) ) ( not ( = ?auto_14387 ?auto_14371 ) ) ( not ( = ?auto_14387 ?auto_14385 ) ) ( not ( = ?auto_14374 ?auto_14373 ) ) ( not ( = ?auto_14374 ?auto_14369 ) ) ( not ( = ?auto_14374 ?auto_14384 ) ) ( not ( = ?auto_14374 ?auto_14382 ) ) ( not ( = ?auto_14374 ?auto_14370 ) ) ( not ( = ?auto_14374 ?auto_14386 ) ) ( not ( = ?auto_14374 ?auto_14381 ) ) ( not ( = ?auto_14352 ?auto_14361 ) ) ( not ( = ?auto_14352 ?auto_14366 ) ) ( not ( = ?auto_14353 ?auto_14361 ) ) ( not ( = ?auto_14353 ?auto_14366 ) ) ( not ( = ?auto_14354 ?auto_14361 ) ) ( not ( = ?auto_14354 ?auto_14366 ) ) ( not ( = ?auto_14355 ?auto_14361 ) ) ( not ( = ?auto_14355 ?auto_14366 ) ) ( not ( = ?auto_14356 ?auto_14361 ) ) ( not ( = ?auto_14356 ?auto_14366 ) ) ( not ( = ?auto_14357 ?auto_14361 ) ) ( not ( = ?auto_14357 ?auto_14366 ) ) ( not ( = ?auto_14358 ?auto_14361 ) ) ( not ( = ?auto_14358 ?auto_14366 ) ) ( not ( = ?auto_14359 ?auto_14361 ) ) ( not ( = ?auto_14359 ?auto_14366 ) ) ( not ( = ?auto_14361 ?auto_14374 ) ) ( not ( = ?auto_14361 ?auto_14373 ) ) ( not ( = ?auto_14361 ?auto_14369 ) ) ( not ( = ?auto_14361 ?auto_14384 ) ) ( not ( = ?auto_14361 ?auto_14382 ) ) ( not ( = ?auto_14361 ?auto_14370 ) ) ( not ( = ?auto_14361 ?auto_14386 ) ) ( not ( = ?auto_14361 ?auto_14381 ) ) ( not ( = ?auto_14366 ?auto_14374 ) ) ( not ( = ?auto_14366 ?auto_14373 ) ) ( not ( = ?auto_14366 ?auto_14369 ) ) ( not ( = ?auto_14366 ?auto_14384 ) ) ( not ( = ?auto_14366 ?auto_14382 ) ) ( not ( = ?auto_14366 ?auto_14370 ) ) ( not ( = ?auto_14366 ?auto_14386 ) ) ( not ( = ?auto_14366 ?auto_14381 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_14352 ?auto_14353 ?auto_14354 ?auto_14355 ?auto_14356 ?auto_14357 ?auto_14358 ?auto_14359 ?auto_14360 )
      ( MAKE-1CRATE ?auto_14360 ?auto_14361 )
      ( MAKE-9CRATE-VERIFY ?auto_14352 ?auto_14353 ?auto_14354 ?auto_14355 ?auto_14356 ?auto_14357 ?auto_14358 ?auto_14359 ?auto_14360 ?auto_14361 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_14409 - SURFACE
      ?auto_14410 - SURFACE
      ?auto_14411 - SURFACE
      ?auto_14412 - SURFACE
      ?auto_14413 - SURFACE
      ?auto_14414 - SURFACE
      ?auto_14415 - SURFACE
      ?auto_14416 - SURFACE
      ?auto_14417 - SURFACE
      ?auto_14418 - SURFACE
      ?auto_14419 - SURFACE
    )
    :vars
    (
      ?auto_14425 - HOIST
      ?auto_14424 - PLACE
      ?auto_14421 - PLACE
      ?auto_14420 - HOIST
      ?auto_14422 - SURFACE
      ?auto_14443 - PLACE
      ?auto_14439 - HOIST
      ?auto_14438 - SURFACE
      ?auto_14445 - PLACE
      ?auto_14448 - HOIST
      ?auto_14436 - SURFACE
      ?auto_14434 - PLACE
      ?auto_14440 - HOIST
      ?auto_14431 - SURFACE
      ?auto_14427 - PLACE
      ?auto_14429 - HOIST
      ?auto_14430 - SURFACE
      ?auto_14435 - SURFACE
      ?auto_14437 - PLACE
      ?auto_14441 - HOIST
      ?auto_14446 - SURFACE
      ?auto_14428 - PLACE
      ?auto_14447 - HOIST
      ?auto_14442 - SURFACE
      ?auto_14444 - PLACE
      ?auto_14433 - HOIST
      ?auto_14432 - SURFACE
      ?auto_14426 - SURFACE
      ?auto_14423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14425 ?auto_14424 ) ( IS-CRATE ?auto_14419 ) ( not ( = ?auto_14421 ?auto_14424 ) ) ( HOIST-AT ?auto_14420 ?auto_14421 ) ( AVAILABLE ?auto_14420 ) ( SURFACE-AT ?auto_14419 ?auto_14421 ) ( ON ?auto_14419 ?auto_14422 ) ( CLEAR ?auto_14419 ) ( not ( = ?auto_14418 ?auto_14419 ) ) ( not ( = ?auto_14418 ?auto_14422 ) ) ( not ( = ?auto_14419 ?auto_14422 ) ) ( not ( = ?auto_14425 ?auto_14420 ) ) ( IS-CRATE ?auto_14418 ) ( not ( = ?auto_14443 ?auto_14424 ) ) ( HOIST-AT ?auto_14439 ?auto_14443 ) ( SURFACE-AT ?auto_14418 ?auto_14443 ) ( ON ?auto_14418 ?auto_14438 ) ( CLEAR ?auto_14418 ) ( not ( = ?auto_14417 ?auto_14418 ) ) ( not ( = ?auto_14417 ?auto_14438 ) ) ( not ( = ?auto_14418 ?auto_14438 ) ) ( not ( = ?auto_14425 ?auto_14439 ) ) ( IS-CRATE ?auto_14417 ) ( not ( = ?auto_14445 ?auto_14424 ) ) ( HOIST-AT ?auto_14448 ?auto_14445 ) ( AVAILABLE ?auto_14448 ) ( SURFACE-AT ?auto_14417 ?auto_14445 ) ( ON ?auto_14417 ?auto_14436 ) ( CLEAR ?auto_14417 ) ( not ( = ?auto_14416 ?auto_14417 ) ) ( not ( = ?auto_14416 ?auto_14436 ) ) ( not ( = ?auto_14417 ?auto_14436 ) ) ( not ( = ?auto_14425 ?auto_14448 ) ) ( IS-CRATE ?auto_14416 ) ( not ( = ?auto_14434 ?auto_14424 ) ) ( HOIST-AT ?auto_14440 ?auto_14434 ) ( AVAILABLE ?auto_14440 ) ( SURFACE-AT ?auto_14416 ?auto_14434 ) ( ON ?auto_14416 ?auto_14431 ) ( CLEAR ?auto_14416 ) ( not ( = ?auto_14415 ?auto_14416 ) ) ( not ( = ?auto_14415 ?auto_14431 ) ) ( not ( = ?auto_14416 ?auto_14431 ) ) ( not ( = ?auto_14425 ?auto_14440 ) ) ( IS-CRATE ?auto_14415 ) ( not ( = ?auto_14427 ?auto_14424 ) ) ( HOIST-AT ?auto_14429 ?auto_14427 ) ( AVAILABLE ?auto_14429 ) ( SURFACE-AT ?auto_14415 ?auto_14427 ) ( ON ?auto_14415 ?auto_14430 ) ( CLEAR ?auto_14415 ) ( not ( = ?auto_14414 ?auto_14415 ) ) ( not ( = ?auto_14414 ?auto_14430 ) ) ( not ( = ?auto_14415 ?auto_14430 ) ) ( not ( = ?auto_14425 ?auto_14429 ) ) ( IS-CRATE ?auto_14414 ) ( AVAILABLE ?auto_14439 ) ( SURFACE-AT ?auto_14414 ?auto_14443 ) ( ON ?auto_14414 ?auto_14435 ) ( CLEAR ?auto_14414 ) ( not ( = ?auto_14413 ?auto_14414 ) ) ( not ( = ?auto_14413 ?auto_14435 ) ) ( not ( = ?auto_14414 ?auto_14435 ) ) ( IS-CRATE ?auto_14413 ) ( not ( = ?auto_14437 ?auto_14424 ) ) ( HOIST-AT ?auto_14441 ?auto_14437 ) ( AVAILABLE ?auto_14441 ) ( SURFACE-AT ?auto_14413 ?auto_14437 ) ( ON ?auto_14413 ?auto_14446 ) ( CLEAR ?auto_14413 ) ( not ( = ?auto_14412 ?auto_14413 ) ) ( not ( = ?auto_14412 ?auto_14446 ) ) ( not ( = ?auto_14413 ?auto_14446 ) ) ( not ( = ?auto_14425 ?auto_14441 ) ) ( IS-CRATE ?auto_14412 ) ( not ( = ?auto_14428 ?auto_14424 ) ) ( HOIST-AT ?auto_14447 ?auto_14428 ) ( AVAILABLE ?auto_14447 ) ( SURFACE-AT ?auto_14412 ?auto_14428 ) ( ON ?auto_14412 ?auto_14442 ) ( CLEAR ?auto_14412 ) ( not ( = ?auto_14411 ?auto_14412 ) ) ( not ( = ?auto_14411 ?auto_14442 ) ) ( not ( = ?auto_14412 ?auto_14442 ) ) ( not ( = ?auto_14425 ?auto_14447 ) ) ( IS-CRATE ?auto_14411 ) ( not ( = ?auto_14444 ?auto_14424 ) ) ( HOIST-AT ?auto_14433 ?auto_14444 ) ( SURFACE-AT ?auto_14411 ?auto_14444 ) ( ON ?auto_14411 ?auto_14432 ) ( CLEAR ?auto_14411 ) ( not ( = ?auto_14410 ?auto_14411 ) ) ( not ( = ?auto_14410 ?auto_14432 ) ) ( not ( = ?auto_14411 ?auto_14432 ) ) ( not ( = ?auto_14425 ?auto_14433 ) ) ( SURFACE-AT ?auto_14409 ?auto_14424 ) ( CLEAR ?auto_14409 ) ( IS-CRATE ?auto_14410 ) ( AVAILABLE ?auto_14425 ) ( AVAILABLE ?auto_14433 ) ( SURFACE-AT ?auto_14410 ?auto_14444 ) ( ON ?auto_14410 ?auto_14426 ) ( CLEAR ?auto_14410 ) ( TRUCK-AT ?auto_14423 ?auto_14424 ) ( not ( = ?auto_14409 ?auto_14410 ) ) ( not ( = ?auto_14409 ?auto_14426 ) ) ( not ( = ?auto_14410 ?auto_14426 ) ) ( not ( = ?auto_14409 ?auto_14411 ) ) ( not ( = ?auto_14409 ?auto_14432 ) ) ( not ( = ?auto_14411 ?auto_14426 ) ) ( not ( = ?auto_14432 ?auto_14426 ) ) ( not ( = ?auto_14409 ?auto_14412 ) ) ( not ( = ?auto_14409 ?auto_14442 ) ) ( not ( = ?auto_14410 ?auto_14412 ) ) ( not ( = ?auto_14410 ?auto_14442 ) ) ( not ( = ?auto_14412 ?auto_14432 ) ) ( not ( = ?auto_14412 ?auto_14426 ) ) ( not ( = ?auto_14428 ?auto_14444 ) ) ( not ( = ?auto_14447 ?auto_14433 ) ) ( not ( = ?auto_14442 ?auto_14432 ) ) ( not ( = ?auto_14442 ?auto_14426 ) ) ( not ( = ?auto_14409 ?auto_14413 ) ) ( not ( = ?auto_14409 ?auto_14446 ) ) ( not ( = ?auto_14410 ?auto_14413 ) ) ( not ( = ?auto_14410 ?auto_14446 ) ) ( not ( = ?auto_14411 ?auto_14413 ) ) ( not ( = ?auto_14411 ?auto_14446 ) ) ( not ( = ?auto_14413 ?auto_14442 ) ) ( not ( = ?auto_14413 ?auto_14432 ) ) ( not ( = ?auto_14413 ?auto_14426 ) ) ( not ( = ?auto_14437 ?auto_14428 ) ) ( not ( = ?auto_14437 ?auto_14444 ) ) ( not ( = ?auto_14441 ?auto_14447 ) ) ( not ( = ?auto_14441 ?auto_14433 ) ) ( not ( = ?auto_14446 ?auto_14442 ) ) ( not ( = ?auto_14446 ?auto_14432 ) ) ( not ( = ?auto_14446 ?auto_14426 ) ) ( not ( = ?auto_14409 ?auto_14414 ) ) ( not ( = ?auto_14409 ?auto_14435 ) ) ( not ( = ?auto_14410 ?auto_14414 ) ) ( not ( = ?auto_14410 ?auto_14435 ) ) ( not ( = ?auto_14411 ?auto_14414 ) ) ( not ( = ?auto_14411 ?auto_14435 ) ) ( not ( = ?auto_14412 ?auto_14414 ) ) ( not ( = ?auto_14412 ?auto_14435 ) ) ( not ( = ?auto_14414 ?auto_14446 ) ) ( not ( = ?auto_14414 ?auto_14442 ) ) ( not ( = ?auto_14414 ?auto_14432 ) ) ( not ( = ?auto_14414 ?auto_14426 ) ) ( not ( = ?auto_14443 ?auto_14437 ) ) ( not ( = ?auto_14443 ?auto_14428 ) ) ( not ( = ?auto_14443 ?auto_14444 ) ) ( not ( = ?auto_14439 ?auto_14441 ) ) ( not ( = ?auto_14439 ?auto_14447 ) ) ( not ( = ?auto_14439 ?auto_14433 ) ) ( not ( = ?auto_14435 ?auto_14446 ) ) ( not ( = ?auto_14435 ?auto_14442 ) ) ( not ( = ?auto_14435 ?auto_14432 ) ) ( not ( = ?auto_14435 ?auto_14426 ) ) ( not ( = ?auto_14409 ?auto_14415 ) ) ( not ( = ?auto_14409 ?auto_14430 ) ) ( not ( = ?auto_14410 ?auto_14415 ) ) ( not ( = ?auto_14410 ?auto_14430 ) ) ( not ( = ?auto_14411 ?auto_14415 ) ) ( not ( = ?auto_14411 ?auto_14430 ) ) ( not ( = ?auto_14412 ?auto_14415 ) ) ( not ( = ?auto_14412 ?auto_14430 ) ) ( not ( = ?auto_14413 ?auto_14415 ) ) ( not ( = ?auto_14413 ?auto_14430 ) ) ( not ( = ?auto_14415 ?auto_14435 ) ) ( not ( = ?auto_14415 ?auto_14446 ) ) ( not ( = ?auto_14415 ?auto_14442 ) ) ( not ( = ?auto_14415 ?auto_14432 ) ) ( not ( = ?auto_14415 ?auto_14426 ) ) ( not ( = ?auto_14427 ?auto_14443 ) ) ( not ( = ?auto_14427 ?auto_14437 ) ) ( not ( = ?auto_14427 ?auto_14428 ) ) ( not ( = ?auto_14427 ?auto_14444 ) ) ( not ( = ?auto_14429 ?auto_14439 ) ) ( not ( = ?auto_14429 ?auto_14441 ) ) ( not ( = ?auto_14429 ?auto_14447 ) ) ( not ( = ?auto_14429 ?auto_14433 ) ) ( not ( = ?auto_14430 ?auto_14435 ) ) ( not ( = ?auto_14430 ?auto_14446 ) ) ( not ( = ?auto_14430 ?auto_14442 ) ) ( not ( = ?auto_14430 ?auto_14432 ) ) ( not ( = ?auto_14430 ?auto_14426 ) ) ( not ( = ?auto_14409 ?auto_14416 ) ) ( not ( = ?auto_14409 ?auto_14431 ) ) ( not ( = ?auto_14410 ?auto_14416 ) ) ( not ( = ?auto_14410 ?auto_14431 ) ) ( not ( = ?auto_14411 ?auto_14416 ) ) ( not ( = ?auto_14411 ?auto_14431 ) ) ( not ( = ?auto_14412 ?auto_14416 ) ) ( not ( = ?auto_14412 ?auto_14431 ) ) ( not ( = ?auto_14413 ?auto_14416 ) ) ( not ( = ?auto_14413 ?auto_14431 ) ) ( not ( = ?auto_14414 ?auto_14416 ) ) ( not ( = ?auto_14414 ?auto_14431 ) ) ( not ( = ?auto_14416 ?auto_14430 ) ) ( not ( = ?auto_14416 ?auto_14435 ) ) ( not ( = ?auto_14416 ?auto_14446 ) ) ( not ( = ?auto_14416 ?auto_14442 ) ) ( not ( = ?auto_14416 ?auto_14432 ) ) ( not ( = ?auto_14416 ?auto_14426 ) ) ( not ( = ?auto_14434 ?auto_14427 ) ) ( not ( = ?auto_14434 ?auto_14443 ) ) ( not ( = ?auto_14434 ?auto_14437 ) ) ( not ( = ?auto_14434 ?auto_14428 ) ) ( not ( = ?auto_14434 ?auto_14444 ) ) ( not ( = ?auto_14440 ?auto_14429 ) ) ( not ( = ?auto_14440 ?auto_14439 ) ) ( not ( = ?auto_14440 ?auto_14441 ) ) ( not ( = ?auto_14440 ?auto_14447 ) ) ( not ( = ?auto_14440 ?auto_14433 ) ) ( not ( = ?auto_14431 ?auto_14430 ) ) ( not ( = ?auto_14431 ?auto_14435 ) ) ( not ( = ?auto_14431 ?auto_14446 ) ) ( not ( = ?auto_14431 ?auto_14442 ) ) ( not ( = ?auto_14431 ?auto_14432 ) ) ( not ( = ?auto_14431 ?auto_14426 ) ) ( not ( = ?auto_14409 ?auto_14417 ) ) ( not ( = ?auto_14409 ?auto_14436 ) ) ( not ( = ?auto_14410 ?auto_14417 ) ) ( not ( = ?auto_14410 ?auto_14436 ) ) ( not ( = ?auto_14411 ?auto_14417 ) ) ( not ( = ?auto_14411 ?auto_14436 ) ) ( not ( = ?auto_14412 ?auto_14417 ) ) ( not ( = ?auto_14412 ?auto_14436 ) ) ( not ( = ?auto_14413 ?auto_14417 ) ) ( not ( = ?auto_14413 ?auto_14436 ) ) ( not ( = ?auto_14414 ?auto_14417 ) ) ( not ( = ?auto_14414 ?auto_14436 ) ) ( not ( = ?auto_14415 ?auto_14417 ) ) ( not ( = ?auto_14415 ?auto_14436 ) ) ( not ( = ?auto_14417 ?auto_14431 ) ) ( not ( = ?auto_14417 ?auto_14430 ) ) ( not ( = ?auto_14417 ?auto_14435 ) ) ( not ( = ?auto_14417 ?auto_14446 ) ) ( not ( = ?auto_14417 ?auto_14442 ) ) ( not ( = ?auto_14417 ?auto_14432 ) ) ( not ( = ?auto_14417 ?auto_14426 ) ) ( not ( = ?auto_14445 ?auto_14434 ) ) ( not ( = ?auto_14445 ?auto_14427 ) ) ( not ( = ?auto_14445 ?auto_14443 ) ) ( not ( = ?auto_14445 ?auto_14437 ) ) ( not ( = ?auto_14445 ?auto_14428 ) ) ( not ( = ?auto_14445 ?auto_14444 ) ) ( not ( = ?auto_14448 ?auto_14440 ) ) ( not ( = ?auto_14448 ?auto_14429 ) ) ( not ( = ?auto_14448 ?auto_14439 ) ) ( not ( = ?auto_14448 ?auto_14441 ) ) ( not ( = ?auto_14448 ?auto_14447 ) ) ( not ( = ?auto_14448 ?auto_14433 ) ) ( not ( = ?auto_14436 ?auto_14431 ) ) ( not ( = ?auto_14436 ?auto_14430 ) ) ( not ( = ?auto_14436 ?auto_14435 ) ) ( not ( = ?auto_14436 ?auto_14446 ) ) ( not ( = ?auto_14436 ?auto_14442 ) ) ( not ( = ?auto_14436 ?auto_14432 ) ) ( not ( = ?auto_14436 ?auto_14426 ) ) ( not ( = ?auto_14409 ?auto_14418 ) ) ( not ( = ?auto_14409 ?auto_14438 ) ) ( not ( = ?auto_14410 ?auto_14418 ) ) ( not ( = ?auto_14410 ?auto_14438 ) ) ( not ( = ?auto_14411 ?auto_14418 ) ) ( not ( = ?auto_14411 ?auto_14438 ) ) ( not ( = ?auto_14412 ?auto_14418 ) ) ( not ( = ?auto_14412 ?auto_14438 ) ) ( not ( = ?auto_14413 ?auto_14418 ) ) ( not ( = ?auto_14413 ?auto_14438 ) ) ( not ( = ?auto_14414 ?auto_14418 ) ) ( not ( = ?auto_14414 ?auto_14438 ) ) ( not ( = ?auto_14415 ?auto_14418 ) ) ( not ( = ?auto_14415 ?auto_14438 ) ) ( not ( = ?auto_14416 ?auto_14418 ) ) ( not ( = ?auto_14416 ?auto_14438 ) ) ( not ( = ?auto_14418 ?auto_14436 ) ) ( not ( = ?auto_14418 ?auto_14431 ) ) ( not ( = ?auto_14418 ?auto_14430 ) ) ( not ( = ?auto_14418 ?auto_14435 ) ) ( not ( = ?auto_14418 ?auto_14446 ) ) ( not ( = ?auto_14418 ?auto_14442 ) ) ( not ( = ?auto_14418 ?auto_14432 ) ) ( not ( = ?auto_14418 ?auto_14426 ) ) ( not ( = ?auto_14438 ?auto_14436 ) ) ( not ( = ?auto_14438 ?auto_14431 ) ) ( not ( = ?auto_14438 ?auto_14430 ) ) ( not ( = ?auto_14438 ?auto_14435 ) ) ( not ( = ?auto_14438 ?auto_14446 ) ) ( not ( = ?auto_14438 ?auto_14442 ) ) ( not ( = ?auto_14438 ?auto_14432 ) ) ( not ( = ?auto_14438 ?auto_14426 ) ) ( not ( = ?auto_14409 ?auto_14419 ) ) ( not ( = ?auto_14409 ?auto_14422 ) ) ( not ( = ?auto_14410 ?auto_14419 ) ) ( not ( = ?auto_14410 ?auto_14422 ) ) ( not ( = ?auto_14411 ?auto_14419 ) ) ( not ( = ?auto_14411 ?auto_14422 ) ) ( not ( = ?auto_14412 ?auto_14419 ) ) ( not ( = ?auto_14412 ?auto_14422 ) ) ( not ( = ?auto_14413 ?auto_14419 ) ) ( not ( = ?auto_14413 ?auto_14422 ) ) ( not ( = ?auto_14414 ?auto_14419 ) ) ( not ( = ?auto_14414 ?auto_14422 ) ) ( not ( = ?auto_14415 ?auto_14419 ) ) ( not ( = ?auto_14415 ?auto_14422 ) ) ( not ( = ?auto_14416 ?auto_14419 ) ) ( not ( = ?auto_14416 ?auto_14422 ) ) ( not ( = ?auto_14417 ?auto_14419 ) ) ( not ( = ?auto_14417 ?auto_14422 ) ) ( not ( = ?auto_14419 ?auto_14438 ) ) ( not ( = ?auto_14419 ?auto_14436 ) ) ( not ( = ?auto_14419 ?auto_14431 ) ) ( not ( = ?auto_14419 ?auto_14430 ) ) ( not ( = ?auto_14419 ?auto_14435 ) ) ( not ( = ?auto_14419 ?auto_14446 ) ) ( not ( = ?auto_14419 ?auto_14442 ) ) ( not ( = ?auto_14419 ?auto_14432 ) ) ( not ( = ?auto_14419 ?auto_14426 ) ) ( not ( = ?auto_14421 ?auto_14443 ) ) ( not ( = ?auto_14421 ?auto_14445 ) ) ( not ( = ?auto_14421 ?auto_14434 ) ) ( not ( = ?auto_14421 ?auto_14427 ) ) ( not ( = ?auto_14421 ?auto_14437 ) ) ( not ( = ?auto_14421 ?auto_14428 ) ) ( not ( = ?auto_14421 ?auto_14444 ) ) ( not ( = ?auto_14420 ?auto_14439 ) ) ( not ( = ?auto_14420 ?auto_14448 ) ) ( not ( = ?auto_14420 ?auto_14440 ) ) ( not ( = ?auto_14420 ?auto_14429 ) ) ( not ( = ?auto_14420 ?auto_14441 ) ) ( not ( = ?auto_14420 ?auto_14447 ) ) ( not ( = ?auto_14420 ?auto_14433 ) ) ( not ( = ?auto_14422 ?auto_14438 ) ) ( not ( = ?auto_14422 ?auto_14436 ) ) ( not ( = ?auto_14422 ?auto_14431 ) ) ( not ( = ?auto_14422 ?auto_14430 ) ) ( not ( = ?auto_14422 ?auto_14435 ) ) ( not ( = ?auto_14422 ?auto_14446 ) ) ( not ( = ?auto_14422 ?auto_14442 ) ) ( not ( = ?auto_14422 ?auto_14432 ) ) ( not ( = ?auto_14422 ?auto_14426 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_14409 ?auto_14410 ?auto_14411 ?auto_14412 ?auto_14413 ?auto_14414 ?auto_14415 ?auto_14416 ?auto_14417 ?auto_14418 )
      ( MAKE-1CRATE ?auto_14418 ?auto_14419 )
      ( MAKE-10CRATE-VERIFY ?auto_14409 ?auto_14410 ?auto_14411 ?auto_14412 ?auto_14413 ?auto_14414 ?auto_14415 ?auto_14416 ?auto_14417 ?auto_14418 ?auto_14419 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_14471 - SURFACE
      ?auto_14472 - SURFACE
      ?auto_14473 - SURFACE
      ?auto_14474 - SURFACE
      ?auto_14475 - SURFACE
      ?auto_14476 - SURFACE
      ?auto_14477 - SURFACE
      ?auto_14478 - SURFACE
      ?auto_14479 - SURFACE
      ?auto_14480 - SURFACE
      ?auto_14481 - SURFACE
      ?auto_14482 - SURFACE
    )
    :vars
    (
      ?auto_14488 - HOIST
      ?auto_14483 - PLACE
      ?auto_14486 - PLACE
      ?auto_14485 - HOIST
      ?auto_14484 - SURFACE
      ?auto_14489 - PLACE
      ?auto_14492 - HOIST
      ?auto_14509 - SURFACE
      ?auto_14501 - PLACE
      ?auto_14497 - HOIST
      ?auto_14494 - SURFACE
      ?auto_14507 - PLACE
      ?auto_14491 - HOIST
      ?auto_14493 - SURFACE
      ?auto_14499 - PLACE
      ?auto_14490 - HOIST
      ?auto_14510 - SURFACE
      ?auto_14511 - SURFACE
      ?auto_14505 - SURFACE
      ?auto_14504 - PLACE
      ?auto_14496 - HOIST
      ?auto_14506 - SURFACE
      ?auto_14500 - PLACE
      ?auto_14498 - HOIST
      ?auto_14508 - SURFACE
      ?auto_14502 - PLACE
      ?auto_14512 - HOIST
      ?auto_14495 - SURFACE
      ?auto_14503 - SURFACE
      ?auto_14487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14488 ?auto_14483 ) ( IS-CRATE ?auto_14482 ) ( not ( = ?auto_14486 ?auto_14483 ) ) ( HOIST-AT ?auto_14485 ?auto_14486 ) ( SURFACE-AT ?auto_14482 ?auto_14486 ) ( ON ?auto_14482 ?auto_14484 ) ( CLEAR ?auto_14482 ) ( not ( = ?auto_14481 ?auto_14482 ) ) ( not ( = ?auto_14481 ?auto_14484 ) ) ( not ( = ?auto_14482 ?auto_14484 ) ) ( not ( = ?auto_14488 ?auto_14485 ) ) ( IS-CRATE ?auto_14481 ) ( not ( = ?auto_14489 ?auto_14483 ) ) ( HOIST-AT ?auto_14492 ?auto_14489 ) ( AVAILABLE ?auto_14492 ) ( SURFACE-AT ?auto_14481 ?auto_14489 ) ( ON ?auto_14481 ?auto_14509 ) ( CLEAR ?auto_14481 ) ( not ( = ?auto_14480 ?auto_14481 ) ) ( not ( = ?auto_14480 ?auto_14509 ) ) ( not ( = ?auto_14481 ?auto_14509 ) ) ( not ( = ?auto_14488 ?auto_14492 ) ) ( IS-CRATE ?auto_14480 ) ( not ( = ?auto_14501 ?auto_14483 ) ) ( HOIST-AT ?auto_14497 ?auto_14501 ) ( SURFACE-AT ?auto_14480 ?auto_14501 ) ( ON ?auto_14480 ?auto_14494 ) ( CLEAR ?auto_14480 ) ( not ( = ?auto_14479 ?auto_14480 ) ) ( not ( = ?auto_14479 ?auto_14494 ) ) ( not ( = ?auto_14480 ?auto_14494 ) ) ( not ( = ?auto_14488 ?auto_14497 ) ) ( IS-CRATE ?auto_14479 ) ( not ( = ?auto_14507 ?auto_14483 ) ) ( HOIST-AT ?auto_14491 ?auto_14507 ) ( AVAILABLE ?auto_14491 ) ( SURFACE-AT ?auto_14479 ?auto_14507 ) ( ON ?auto_14479 ?auto_14493 ) ( CLEAR ?auto_14479 ) ( not ( = ?auto_14478 ?auto_14479 ) ) ( not ( = ?auto_14478 ?auto_14493 ) ) ( not ( = ?auto_14479 ?auto_14493 ) ) ( not ( = ?auto_14488 ?auto_14491 ) ) ( IS-CRATE ?auto_14478 ) ( not ( = ?auto_14499 ?auto_14483 ) ) ( HOIST-AT ?auto_14490 ?auto_14499 ) ( AVAILABLE ?auto_14490 ) ( SURFACE-AT ?auto_14478 ?auto_14499 ) ( ON ?auto_14478 ?auto_14510 ) ( CLEAR ?auto_14478 ) ( not ( = ?auto_14477 ?auto_14478 ) ) ( not ( = ?auto_14477 ?auto_14510 ) ) ( not ( = ?auto_14478 ?auto_14510 ) ) ( not ( = ?auto_14488 ?auto_14490 ) ) ( IS-CRATE ?auto_14477 ) ( AVAILABLE ?auto_14485 ) ( SURFACE-AT ?auto_14477 ?auto_14486 ) ( ON ?auto_14477 ?auto_14511 ) ( CLEAR ?auto_14477 ) ( not ( = ?auto_14476 ?auto_14477 ) ) ( not ( = ?auto_14476 ?auto_14511 ) ) ( not ( = ?auto_14477 ?auto_14511 ) ) ( IS-CRATE ?auto_14476 ) ( AVAILABLE ?auto_14497 ) ( SURFACE-AT ?auto_14476 ?auto_14501 ) ( ON ?auto_14476 ?auto_14505 ) ( CLEAR ?auto_14476 ) ( not ( = ?auto_14475 ?auto_14476 ) ) ( not ( = ?auto_14475 ?auto_14505 ) ) ( not ( = ?auto_14476 ?auto_14505 ) ) ( IS-CRATE ?auto_14475 ) ( not ( = ?auto_14504 ?auto_14483 ) ) ( HOIST-AT ?auto_14496 ?auto_14504 ) ( AVAILABLE ?auto_14496 ) ( SURFACE-AT ?auto_14475 ?auto_14504 ) ( ON ?auto_14475 ?auto_14506 ) ( CLEAR ?auto_14475 ) ( not ( = ?auto_14474 ?auto_14475 ) ) ( not ( = ?auto_14474 ?auto_14506 ) ) ( not ( = ?auto_14475 ?auto_14506 ) ) ( not ( = ?auto_14488 ?auto_14496 ) ) ( IS-CRATE ?auto_14474 ) ( not ( = ?auto_14500 ?auto_14483 ) ) ( HOIST-AT ?auto_14498 ?auto_14500 ) ( AVAILABLE ?auto_14498 ) ( SURFACE-AT ?auto_14474 ?auto_14500 ) ( ON ?auto_14474 ?auto_14508 ) ( CLEAR ?auto_14474 ) ( not ( = ?auto_14473 ?auto_14474 ) ) ( not ( = ?auto_14473 ?auto_14508 ) ) ( not ( = ?auto_14474 ?auto_14508 ) ) ( not ( = ?auto_14488 ?auto_14498 ) ) ( IS-CRATE ?auto_14473 ) ( not ( = ?auto_14502 ?auto_14483 ) ) ( HOIST-AT ?auto_14512 ?auto_14502 ) ( SURFACE-AT ?auto_14473 ?auto_14502 ) ( ON ?auto_14473 ?auto_14495 ) ( CLEAR ?auto_14473 ) ( not ( = ?auto_14472 ?auto_14473 ) ) ( not ( = ?auto_14472 ?auto_14495 ) ) ( not ( = ?auto_14473 ?auto_14495 ) ) ( not ( = ?auto_14488 ?auto_14512 ) ) ( SURFACE-AT ?auto_14471 ?auto_14483 ) ( CLEAR ?auto_14471 ) ( IS-CRATE ?auto_14472 ) ( AVAILABLE ?auto_14488 ) ( AVAILABLE ?auto_14512 ) ( SURFACE-AT ?auto_14472 ?auto_14502 ) ( ON ?auto_14472 ?auto_14503 ) ( CLEAR ?auto_14472 ) ( TRUCK-AT ?auto_14487 ?auto_14483 ) ( not ( = ?auto_14471 ?auto_14472 ) ) ( not ( = ?auto_14471 ?auto_14503 ) ) ( not ( = ?auto_14472 ?auto_14503 ) ) ( not ( = ?auto_14471 ?auto_14473 ) ) ( not ( = ?auto_14471 ?auto_14495 ) ) ( not ( = ?auto_14473 ?auto_14503 ) ) ( not ( = ?auto_14495 ?auto_14503 ) ) ( not ( = ?auto_14471 ?auto_14474 ) ) ( not ( = ?auto_14471 ?auto_14508 ) ) ( not ( = ?auto_14472 ?auto_14474 ) ) ( not ( = ?auto_14472 ?auto_14508 ) ) ( not ( = ?auto_14474 ?auto_14495 ) ) ( not ( = ?auto_14474 ?auto_14503 ) ) ( not ( = ?auto_14500 ?auto_14502 ) ) ( not ( = ?auto_14498 ?auto_14512 ) ) ( not ( = ?auto_14508 ?auto_14495 ) ) ( not ( = ?auto_14508 ?auto_14503 ) ) ( not ( = ?auto_14471 ?auto_14475 ) ) ( not ( = ?auto_14471 ?auto_14506 ) ) ( not ( = ?auto_14472 ?auto_14475 ) ) ( not ( = ?auto_14472 ?auto_14506 ) ) ( not ( = ?auto_14473 ?auto_14475 ) ) ( not ( = ?auto_14473 ?auto_14506 ) ) ( not ( = ?auto_14475 ?auto_14508 ) ) ( not ( = ?auto_14475 ?auto_14495 ) ) ( not ( = ?auto_14475 ?auto_14503 ) ) ( not ( = ?auto_14504 ?auto_14500 ) ) ( not ( = ?auto_14504 ?auto_14502 ) ) ( not ( = ?auto_14496 ?auto_14498 ) ) ( not ( = ?auto_14496 ?auto_14512 ) ) ( not ( = ?auto_14506 ?auto_14508 ) ) ( not ( = ?auto_14506 ?auto_14495 ) ) ( not ( = ?auto_14506 ?auto_14503 ) ) ( not ( = ?auto_14471 ?auto_14476 ) ) ( not ( = ?auto_14471 ?auto_14505 ) ) ( not ( = ?auto_14472 ?auto_14476 ) ) ( not ( = ?auto_14472 ?auto_14505 ) ) ( not ( = ?auto_14473 ?auto_14476 ) ) ( not ( = ?auto_14473 ?auto_14505 ) ) ( not ( = ?auto_14474 ?auto_14476 ) ) ( not ( = ?auto_14474 ?auto_14505 ) ) ( not ( = ?auto_14476 ?auto_14506 ) ) ( not ( = ?auto_14476 ?auto_14508 ) ) ( not ( = ?auto_14476 ?auto_14495 ) ) ( not ( = ?auto_14476 ?auto_14503 ) ) ( not ( = ?auto_14501 ?auto_14504 ) ) ( not ( = ?auto_14501 ?auto_14500 ) ) ( not ( = ?auto_14501 ?auto_14502 ) ) ( not ( = ?auto_14497 ?auto_14496 ) ) ( not ( = ?auto_14497 ?auto_14498 ) ) ( not ( = ?auto_14497 ?auto_14512 ) ) ( not ( = ?auto_14505 ?auto_14506 ) ) ( not ( = ?auto_14505 ?auto_14508 ) ) ( not ( = ?auto_14505 ?auto_14495 ) ) ( not ( = ?auto_14505 ?auto_14503 ) ) ( not ( = ?auto_14471 ?auto_14477 ) ) ( not ( = ?auto_14471 ?auto_14511 ) ) ( not ( = ?auto_14472 ?auto_14477 ) ) ( not ( = ?auto_14472 ?auto_14511 ) ) ( not ( = ?auto_14473 ?auto_14477 ) ) ( not ( = ?auto_14473 ?auto_14511 ) ) ( not ( = ?auto_14474 ?auto_14477 ) ) ( not ( = ?auto_14474 ?auto_14511 ) ) ( not ( = ?auto_14475 ?auto_14477 ) ) ( not ( = ?auto_14475 ?auto_14511 ) ) ( not ( = ?auto_14477 ?auto_14505 ) ) ( not ( = ?auto_14477 ?auto_14506 ) ) ( not ( = ?auto_14477 ?auto_14508 ) ) ( not ( = ?auto_14477 ?auto_14495 ) ) ( not ( = ?auto_14477 ?auto_14503 ) ) ( not ( = ?auto_14486 ?auto_14501 ) ) ( not ( = ?auto_14486 ?auto_14504 ) ) ( not ( = ?auto_14486 ?auto_14500 ) ) ( not ( = ?auto_14486 ?auto_14502 ) ) ( not ( = ?auto_14485 ?auto_14497 ) ) ( not ( = ?auto_14485 ?auto_14496 ) ) ( not ( = ?auto_14485 ?auto_14498 ) ) ( not ( = ?auto_14485 ?auto_14512 ) ) ( not ( = ?auto_14511 ?auto_14505 ) ) ( not ( = ?auto_14511 ?auto_14506 ) ) ( not ( = ?auto_14511 ?auto_14508 ) ) ( not ( = ?auto_14511 ?auto_14495 ) ) ( not ( = ?auto_14511 ?auto_14503 ) ) ( not ( = ?auto_14471 ?auto_14478 ) ) ( not ( = ?auto_14471 ?auto_14510 ) ) ( not ( = ?auto_14472 ?auto_14478 ) ) ( not ( = ?auto_14472 ?auto_14510 ) ) ( not ( = ?auto_14473 ?auto_14478 ) ) ( not ( = ?auto_14473 ?auto_14510 ) ) ( not ( = ?auto_14474 ?auto_14478 ) ) ( not ( = ?auto_14474 ?auto_14510 ) ) ( not ( = ?auto_14475 ?auto_14478 ) ) ( not ( = ?auto_14475 ?auto_14510 ) ) ( not ( = ?auto_14476 ?auto_14478 ) ) ( not ( = ?auto_14476 ?auto_14510 ) ) ( not ( = ?auto_14478 ?auto_14511 ) ) ( not ( = ?auto_14478 ?auto_14505 ) ) ( not ( = ?auto_14478 ?auto_14506 ) ) ( not ( = ?auto_14478 ?auto_14508 ) ) ( not ( = ?auto_14478 ?auto_14495 ) ) ( not ( = ?auto_14478 ?auto_14503 ) ) ( not ( = ?auto_14499 ?auto_14486 ) ) ( not ( = ?auto_14499 ?auto_14501 ) ) ( not ( = ?auto_14499 ?auto_14504 ) ) ( not ( = ?auto_14499 ?auto_14500 ) ) ( not ( = ?auto_14499 ?auto_14502 ) ) ( not ( = ?auto_14490 ?auto_14485 ) ) ( not ( = ?auto_14490 ?auto_14497 ) ) ( not ( = ?auto_14490 ?auto_14496 ) ) ( not ( = ?auto_14490 ?auto_14498 ) ) ( not ( = ?auto_14490 ?auto_14512 ) ) ( not ( = ?auto_14510 ?auto_14511 ) ) ( not ( = ?auto_14510 ?auto_14505 ) ) ( not ( = ?auto_14510 ?auto_14506 ) ) ( not ( = ?auto_14510 ?auto_14508 ) ) ( not ( = ?auto_14510 ?auto_14495 ) ) ( not ( = ?auto_14510 ?auto_14503 ) ) ( not ( = ?auto_14471 ?auto_14479 ) ) ( not ( = ?auto_14471 ?auto_14493 ) ) ( not ( = ?auto_14472 ?auto_14479 ) ) ( not ( = ?auto_14472 ?auto_14493 ) ) ( not ( = ?auto_14473 ?auto_14479 ) ) ( not ( = ?auto_14473 ?auto_14493 ) ) ( not ( = ?auto_14474 ?auto_14479 ) ) ( not ( = ?auto_14474 ?auto_14493 ) ) ( not ( = ?auto_14475 ?auto_14479 ) ) ( not ( = ?auto_14475 ?auto_14493 ) ) ( not ( = ?auto_14476 ?auto_14479 ) ) ( not ( = ?auto_14476 ?auto_14493 ) ) ( not ( = ?auto_14477 ?auto_14479 ) ) ( not ( = ?auto_14477 ?auto_14493 ) ) ( not ( = ?auto_14479 ?auto_14510 ) ) ( not ( = ?auto_14479 ?auto_14511 ) ) ( not ( = ?auto_14479 ?auto_14505 ) ) ( not ( = ?auto_14479 ?auto_14506 ) ) ( not ( = ?auto_14479 ?auto_14508 ) ) ( not ( = ?auto_14479 ?auto_14495 ) ) ( not ( = ?auto_14479 ?auto_14503 ) ) ( not ( = ?auto_14507 ?auto_14499 ) ) ( not ( = ?auto_14507 ?auto_14486 ) ) ( not ( = ?auto_14507 ?auto_14501 ) ) ( not ( = ?auto_14507 ?auto_14504 ) ) ( not ( = ?auto_14507 ?auto_14500 ) ) ( not ( = ?auto_14507 ?auto_14502 ) ) ( not ( = ?auto_14491 ?auto_14490 ) ) ( not ( = ?auto_14491 ?auto_14485 ) ) ( not ( = ?auto_14491 ?auto_14497 ) ) ( not ( = ?auto_14491 ?auto_14496 ) ) ( not ( = ?auto_14491 ?auto_14498 ) ) ( not ( = ?auto_14491 ?auto_14512 ) ) ( not ( = ?auto_14493 ?auto_14510 ) ) ( not ( = ?auto_14493 ?auto_14511 ) ) ( not ( = ?auto_14493 ?auto_14505 ) ) ( not ( = ?auto_14493 ?auto_14506 ) ) ( not ( = ?auto_14493 ?auto_14508 ) ) ( not ( = ?auto_14493 ?auto_14495 ) ) ( not ( = ?auto_14493 ?auto_14503 ) ) ( not ( = ?auto_14471 ?auto_14480 ) ) ( not ( = ?auto_14471 ?auto_14494 ) ) ( not ( = ?auto_14472 ?auto_14480 ) ) ( not ( = ?auto_14472 ?auto_14494 ) ) ( not ( = ?auto_14473 ?auto_14480 ) ) ( not ( = ?auto_14473 ?auto_14494 ) ) ( not ( = ?auto_14474 ?auto_14480 ) ) ( not ( = ?auto_14474 ?auto_14494 ) ) ( not ( = ?auto_14475 ?auto_14480 ) ) ( not ( = ?auto_14475 ?auto_14494 ) ) ( not ( = ?auto_14476 ?auto_14480 ) ) ( not ( = ?auto_14476 ?auto_14494 ) ) ( not ( = ?auto_14477 ?auto_14480 ) ) ( not ( = ?auto_14477 ?auto_14494 ) ) ( not ( = ?auto_14478 ?auto_14480 ) ) ( not ( = ?auto_14478 ?auto_14494 ) ) ( not ( = ?auto_14480 ?auto_14493 ) ) ( not ( = ?auto_14480 ?auto_14510 ) ) ( not ( = ?auto_14480 ?auto_14511 ) ) ( not ( = ?auto_14480 ?auto_14505 ) ) ( not ( = ?auto_14480 ?auto_14506 ) ) ( not ( = ?auto_14480 ?auto_14508 ) ) ( not ( = ?auto_14480 ?auto_14495 ) ) ( not ( = ?auto_14480 ?auto_14503 ) ) ( not ( = ?auto_14494 ?auto_14493 ) ) ( not ( = ?auto_14494 ?auto_14510 ) ) ( not ( = ?auto_14494 ?auto_14511 ) ) ( not ( = ?auto_14494 ?auto_14505 ) ) ( not ( = ?auto_14494 ?auto_14506 ) ) ( not ( = ?auto_14494 ?auto_14508 ) ) ( not ( = ?auto_14494 ?auto_14495 ) ) ( not ( = ?auto_14494 ?auto_14503 ) ) ( not ( = ?auto_14471 ?auto_14481 ) ) ( not ( = ?auto_14471 ?auto_14509 ) ) ( not ( = ?auto_14472 ?auto_14481 ) ) ( not ( = ?auto_14472 ?auto_14509 ) ) ( not ( = ?auto_14473 ?auto_14481 ) ) ( not ( = ?auto_14473 ?auto_14509 ) ) ( not ( = ?auto_14474 ?auto_14481 ) ) ( not ( = ?auto_14474 ?auto_14509 ) ) ( not ( = ?auto_14475 ?auto_14481 ) ) ( not ( = ?auto_14475 ?auto_14509 ) ) ( not ( = ?auto_14476 ?auto_14481 ) ) ( not ( = ?auto_14476 ?auto_14509 ) ) ( not ( = ?auto_14477 ?auto_14481 ) ) ( not ( = ?auto_14477 ?auto_14509 ) ) ( not ( = ?auto_14478 ?auto_14481 ) ) ( not ( = ?auto_14478 ?auto_14509 ) ) ( not ( = ?auto_14479 ?auto_14481 ) ) ( not ( = ?auto_14479 ?auto_14509 ) ) ( not ( = ?auto_14481 ?auto_14494 ) ) ( not ( = ?auto_14481 ?auto_14493 ) ) ( not ( = ?auto_14481 ?auto_14510 ) ) ( not ( = ?auto_14481 ?auto_14511 ) ) ( not ( = ?auto_14481 ?auto_14505 ) ) ( not ( = ?auto_14481 ?auto_14506 ) ) ( not ( = ?auto_14481 ?auto_14508 ) ) ( not ( = ?auto_14481 ?auto_14495 ) ) ( not ( = ?auto_14481 ?auto_14503 ) ) ( not ( = ?auto_14489 ?auto_14501 ) ) ( not ( = ?auto_14489 ?auto_14507 ) ) ( not ( = ?auto_14489 ?auto_14499 ) ) ( not ( = ?auto_14489 ?auto_14486 ) ) ( not ( = ?auto_14489 ?auto_14504 ) ) ( not ( = ?auto_14489 ?auto_14500 ) ) ( not ( = ?auto_14489 ?auto_14502 ) ) ( not ( = ?auto_14492 ?auto_14497 ) ) ( not ( = ?auto_14492 ?auto_14491 ) ) ( not ( = ?auto_14492 ?auto_14490 ) ) ( not ( = ?auto_14492 ?auto_14485 ) ) ( not ( = ?auto_14492 ?auto_14496 ) ) ( not ( = ?auto_14492 ?auto_14498 ) ) ( not ( = ?auto_14492 ?auto_14512 ) ) ( not ( = ?auto_14509 ?auto_14494 ) ) ( not ( = ?auto_14509 ?auto_14493 ) ) ( not ( = ?auto_14509 ?auto_14510 ) ) ( not ( = ?auto_14509 ?auto_14511 ) ) ( not ( = ?auto_14509 ?auto_14505 ) ) ( not ( = ?auto_14509 ?auto_14506 ) ) ( not ( = ?auto_14509 ?auto_14508 ) ) ( not ( = ?auto_14509 ?auto_14495 ) ) ( not ( = ?auto_14509 ?auto_14503 ) ) ( not ( = ?auto_14471 ?auto_14482 ) ) ( not ( = ?auto_14471 ?auto_14484 ) ) ( not ( = ?auto_14472 ?auto_14482 ) ) ( not ( = ?auto_14472 ?auto_14484 ) ) ( not ( = ?auto_14473 ?auto_14482 ) ) ( not ( = ?auto_14473 ?auto_14484 ) ) ( not ( = ?auto_14474 ?auto_14482 ) ) ( not ( = ?auto_14474 ?auto_14484 ) ) ( not ( = ?auto_14475 ?auto_14482 ) ) ( not ( = ?auto_14475 ?auto_14484 ) ) ( not ( = ?auto_14476 ?auto_14482 ) ) ( not ( = ?auto_14476 ?auto_14484 ) ) ( not ( = ?auto_14477 ?auto_14482 ) ) ( not ( = ?auto_14477 ?auto_14484 ) ) ( not ( = ?auto_14478 ?auto_14482 ) ) ( not ( = ?auto_14478 ?auto_14484 ) ) ( not ( = ?auto_14479 ?auto_14482 ) ) ( not ( = ?auto_14479 ?auto_14484 ) ) ( not ( = ?auto_14480 ?auto_14482 ) ) ( not ( = ?auto_14480 ?auto_14484 ) ) ( not ( = ?auto_14482 ?auto_14509 ) ) ( not ( = ?auto_14482 ?auto_14494 ) ) ( not ( = ?auto_14482 ?auto_14493 ) ) ( not ( = ?auto_14482 ?auto_14510 ) ) ( not ( = ?auto_14482 ?auto_14511 ) ) ( not ( = ?auto_14482 ?auto_14505 ) ) ( not ( = ?auto_14482 ?auto_14506 ) ) ( not ( = ?auto_14482 ?auto_14508 ) ) ( not ( = ?auto_14482 ?auto_14495 ) ) ( not ( = ?auto_14482 ?auto_14503 ) ) ( not ( = ?auto_14484 ?auto_14509 ) ) ( not ( = ?auto_14484 ?auto_14494 ) ) ( not ( = ?auto_14484 ?auto_14493 ) ) ( not ( = ?auto_14484 ?auto_14510 ) ) ( not ( = ?auto_14484 ?auto_14511 ) ) ( not ( = ?auto_14484 ?auto_14505 ) ) ( not ( = ?auto_14484 ?auto_14506 ) ) ( not ( = ?auto_14484 ?auto_14508 ) ) ( not ( = ?auto_14484 ?auto_14495 ) ) ( not ( = ?auto_14484 ?auto_14503 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_14471 ?auto_14472 ?auto_14473 ?auto_14474 ?auto_14475 ?auto_14476 ?auto_14477 ?auto_14478 ?auto_14479 ?auto_14480 ?auto_14481 )
      ( MAKE-1CRATE ?auto_14481 ?auto_14482 )
      ( MAKE-11CRATE-VERIFY ?auto_14471 ?auto_14472 ?auto_14473 ?auto_14474 ?auto_14475 ?auto_14476 ?auto_14477 ?auto_14478 ?auto_14479 ?auto_14480 ?auto_14481 ?auto_14482 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_14536 - SURFACE
      ?auto_14537 - SURFACE
      ?auto_14538 - SURFACE
      ?auto_14539 - SURFACE
      ?auto_14540 - SURFACE
      ?auto_14541 - SURFACE
      ?auto_14542 - SURFACE
      ?auto_14543 - SURFACE
      ?auto_14544 - SURFACE
      ?auto_14545 - SURFACE
      ?auto_14546 - SURFACE
      ?auto_14547 - SURFACE
      ?auto_14548 - SURFACE
    )
    :vars
    (
      ?auto_14554 - HOIST
      ?auto_14550 - PLACE
      ?auto_14552 - PLACE
      ?auto_14549 - HOIST
      ?auto_14553 - SURFACE
      ?auto_14572 - PLACE
      ?auto_14569 - HOIST
      ?auto_14567 - SURFACE
      ?auto_14575 - SURFACE
      ?auto_14557 - PLACE
      ?auto_14577 - HOIST
      ?auto_14576 - SURFACE
      ?auto_14571 - PLACE
      ?auto_14556 - HOIST
      ?auto_14566 - SURFACE
      ?auto_14573 - PLACE
      ?auto_14564 - HOIST
      ?auto_14560 - SURFACE
      ?auto_14565 - SURFACE
      ?auto_14562 - SURFACE
      ?auto_14563 - PLACE
      ?auto_14558 - HOIST
      ?auto_14559 - SURFACE
      ?auto_14568 - PLACE
      ?auto_14574 - HOIST
      ?auto_14555 - SURFACE
      ?auto_14570 - PLACE
      ?auto_14561 - HOIST
      ?auto_14579 - SURFACE
      ?auto_14578 - SURFACE
      ?auto_14551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14554 ?auto_14550 ) ( IS-CRATE ?auto_14548 ) ( not ( = ?auto_14552 ?auto_14550 ) ) ( HOIST-AT ?auto_14549 ?auto_14552 ) ( SURFACE-AT ?auto_14548 ?auto_14552 ) ( ON ?auto_14548 ?auto_14553 ) ( CLEAR ?auto_14548 ) ( not ( = ?auto_14547 ?auto_14548 ) ) ( not ( = ?auto_14547 ?auto_14553 ) ) ( not ( = ?auto_14548 ?auto_14553 ) ) ( not ( = ?auto_14554 ?auto_14549 ) ) ( IS-CRATE ?auto_14547 ) ( not ( = ?auto_14572 ?auto_14550 ) ) ( HOIST-AT ?auto_14569 ?auto_14572 ) ( SURFACE-AT ?auto_14547 ?auto_14572 ) ( ON ?auto_14547 ?auto_14567 ) ( CLEAR ?auto_14547 ) ( not ( = ?auto_14546 ?auto_14547 ) ) ( not ( = ?auto_14546 ?auto_14567 ) ) ( not ( = ?auto_14547 ?auto_14567 ) ) ( not ( = ?auto_14554 ?auto_14569 ) ) ( IS-CRATE ?auto_14546 ) ( AVAILABLE ?auto_14549 ) ( SURFACE-AT ?auto_14546 ?auto_14552 ) ( ON ?auto_14546 ?auto_14575 ) ( CLEAR ?auto_14546 ) ( not ( = ?auto_14545 ?auto_14546 ) ) ( not ( = ?auto_14545 ?auto_14575 ) ) ( not ( = ?auto_14546 ?auto_14575 ) ) ( IS-CRATE ?auto_14545 ) ( not ( = ?auto_14557 ?auto_14550 ) ) ( HOIST-AT ?auto_14577 ?auto_14557 ) ( SURFACE-AT ?auto_14545 ?auto_14557 ) ( ON ?auto_14545 ?auto_14576 ) ( CLEAR ?auto_14545 ) ( not ( = ?auto_14544 ?auto_14545 ) ) ( not ( = ?auto_14544 ?auto_14576 ) ) ( not ( = ?auto_14545 ?auto_14576 ) ) ( not ( = ?auto_14554 ?auto_14577 ) ) ( IS-CRATE ?auto_14544 ) ( not ( = ?auto_14571 ?auto_14550 ) ) ( HOIST-AT ?auto_14556 ?auto_14571 ) ( AVAILABLE ?auto_14556 ) ( SURFACE-AT ?auto_14544 ?auto_14571 ) ( ON ?auto_14544 ?auto_14566 ) ( CLEAR ?auto_14544 ) ( not ( = ?auto_14543 ?auto_14544 ) ) ( not ( = ?auto_14543 ?auto_14566 ) ) ( not ( = ?auto_14544 ?auto_14566 ) ) ( not ( = ?auto_14554 ?auto_14556 ) ) ( IS-CRATE ?auto_14543 ) ( not ( = ?auto_14573 ?auto_14550 ) ) ( HOIST-AT ?auto_14564 ?auto_14573 ) ( AVAILABLE ?auto_14564 ) ( SURFACE-AT ?auto_14543 ?auto_14573 ) ( ON ?auto_14543 ?auto_14560 ) ( CLEAR ?auto_14543 ) ( not ( = ?auto_14542 ?auto_14543 ) ) ( not ( = ?auto_14542 ?auto_14560 ) ) ( not ( = ?auto_14543 ?auto_14560 ) ) ( not ( = ?auto_14554 ?auto_14564 ) ) ( IS-CRATE ?auto_14542 ) ( AVAILABLE ?auto_14569 ) ( SURFACE-AT ?auto_14542 ?auto_14572 ) ( ON ?auto_14542 ?auto_14565 ) ( CLEAR ?auto_14542 ) ( not ( = ?auto_14541 ?auto_14542 ) ) ( not ( = ?auto_14541 ?auto_14565 ) ) ( not ( = ?auto_14542 ?auto_14565 ) ) ( IS-CRATE ?auto_14541 ) ( AVAILABLE ?auto_14577 ) ( SURFACE-AT ?auto_14541 ?auto_14557 ) ( ON ?auto_14541 ?auto_14562 ) ( CLEAR ?auto_14541 ) ( not ( = ?auto_14540 ?auto_14541 ) ) ( not ( = ?auto_14540 ?auto_14562 ) ) ( not ( = ?auto_14541 ?auto_14562 ) ) ( IS-CRATE ?auto_14540 ) ( not ( = ?auto_14563 ?auto_14550 ) ) ( HOIST-AT ?auto_14558 ?auto_14563 ) ( AVAILABLE ?auto_14558 ) ( SURFACE-AT ?auto_14540 ?auto_14563 ) ( ON ?auto_14540 ?auto_14559 ) ( CLEAR ?auto_14540 ) ( not ( = ?auto_14539 ?auto_14540 ) ) ( not ( = ?auto_14539 ?auto_14559 ) ) ( not ( = ?auto_14540 ?auto_14559 ) ) ( not ( = ?auto_14554 ?auto_14558 ) ) ( IS-CRATE ?auto_14539 ) ( not ( = ?auto_14568 ?auto_14550 ) ) ( HOIST-AT ?auto_14574 ?auto_14568 ) ( AVAILABLE ?auto_14574 ) ( SURFACE-AT ?auto_14539 ?auto_14568 ) ( ON ?auto_14539 ?auto_14555 ) ( CLEAR ?auto_14539 ) ( not ( = ?auto_14538 ?auto_14539 ) ) ( not ( = ?auto_14538 ?auto_14555 ) ) ( not ( = ?auto_14539 ?auto_14555 ) ) ( not ( = ?auto_14554 ?auto_14574 ) ) ( IS-CRATE ?auto_14538 ) ( not ( = ?auto_14570 ?auto_14550 ) ) ( HOIST-AT ?auto_14561 ?auto_14570 ) ( SURFACE-AT ?auto_14538 ?auto_14570 ) ( ON ?auto_14538 ?auto_14579 ) ( CLEAR ?auto_14538 ) ( not ( = ?auto_14537 ?auto_14538 ) ) ( not ( = ?auto_14537 ?auto_14579 ) ) ( not ( = ?auto_14538 ?auto_14579 ) ) ( not ( = ?auto_14554 ?auto_14561 ) ) ( SURFACE-AT ?auto_14536 ?auto_14550 ) ( CLEAR ?auto_14536 ) ( IS-CRATE ?auto_14537 ) ( AVAILABLE ?auto_14554 ) ( AVAILABLE ?auto_14561 ) ( SURFACE-AT ?auto_14537 ?auto_14570 ) ( ON ?auto_14537 ?auto_14578 ) ( CLEAR ?auto_14537 ) ( TRUCK-AT ?auto_14551 ?auto_14550 ) ( not ( = ?auto_14536 ?auto_14537 ) ) ( not ( = ?auto_14536 ?auto_14578 ) ) ( not ( = ?auto_14537 ?auto_14578 ) ) ( not ( = ?auto_14536 ?auto_14538 ) ) ( not ( = ?auto_14536 ?auto_14579 ) ) ( not ( = ?auto_14538 ?auto_14578 ) ) ( not ( = ?auto_14579 ?auto_14578 ) ) ( not ( = ?auto_14536 ?auto_14539 ) ) ( not ( = ?auto_14536 ?auto_14555 ) ) ( not ( = ?auto_14537 ?auto_14539 ) ) ( not ( = ?auto_14537 ?auto_14555 ) ) ( not ( = ?auto_14539 ?auto_14579 ) ) ( not ( = ?auto_14539 ?auto_14578 ) ) ( not ( = ?auto_14568 ?auto_14570 ) ) ( not ( = ?auto_14574 ?auto_14561 ) ) ( not ( = ?auto_14555 ?auto_14579 ) ) ( not ( = ?auto_14555 ?auto_14578 ) ) ( not ( = ?auto_14536 ?auto_14540 ) ) ( not ( = ?auto_14536 ?auto_14559 ) ) ( not ( = ?auto_14537 ?auto_14540 ) ) ( not ( = ?auto_14537 ?auto_14559 ) ) ( not ( = ?auto_14538 ?auto_14540 ) ) ( not ( = ?auto_14538 ?auto_14559 ) ) ( not ( = ?auto_14540 ?auto_14555 ) ) ( not ( = ?auto_14540 ?auto_14579 ) ) ( not ( = ?auto_14540 ?auto_14578 ) ) ( not ( = ?auto_14563 ?auto_14568 ) ) ( not ( = ?auto_14563 ?auto_14570 ) ) ( not ( = ?auto_14558 ?auto_14574 ) ) ( not ( = ?auto_14558 ?auto_14561 ) ) ( not ( = ?auto_14559 ?auto_14555 ) ) ( not ( = ?auto_14559 ?auto_14579 ) ) ( not ( = ?auto_14559 ?auto_14578 ) ) ( not ( = ?auto_14536 ?auto_14541 ) ) ( not ( = ?auto_14536 ?auto_14562 ) ) ( not ( = ?auto_14537 ?auto_14541 ) ) ( not ( = ?auto_14537 ?auto_14562 ) ) ( not ( = ?auto_14538 ?auto_14541 ) ) ( not ( = ?auto_14538 ?auto_14562 ) ) ( not ( = ?auto_14539 ?auto_14541 ) ) ( not ( = ?auto_14539 ?auto_14562 ) ) ( not ( = ?auto_14541 ?auto_14559 ) ) ( not ( = ?auto_14541 ?auto_14555 ) ) ( not ( = ?auto_14541 ?auto_14579 ) ) ( not ( = ?auto_14541 ?auto_14578 ) ) ( not ( = ?auto_14557 ?auto_14563 ) ) ( not ( = ?auto_14557 ?auto_14568 ) ) ( not ( = ?auto_14557 ?auto_14570 ) ) ( not ( = ?auto_14577 ?auto_14558 ) ) ( not ( = ?auto_14577 ?auto_14574 ) ) ( not ( = ?auto_14577 ?auto_14561 ) ) ( not ( = ?auto_14562 ?auto_14559 ) ) ( not ( = ?auto_14562 ?auto_14555 ) ) ( not ( = ?auto_14562 ?auto_14579 ) ) ( not ( = ?auto_14562 ?auto_14578 ) ) ( not ( = ?auto_14536 ?auto_14542 ) ) ( not ( = ?auto_14536 ?auto_14565 ) ) ( not ( = ?auto_14537 ?auto_14542 ) ) ( not ( = ?auto_14537 ?auto_14565 ) ) ( not ( = ?auto_14538 ?auto_14542 ) ) ( not ( = ?auto_14538 ?auto_14565 ) ) ( not ( = ?auto_14539 ?auto_14542 ) ) ( not ( = ?auto_14539 ?auto_14565 ) ) ( not ( = ?auto_14540 ?auto_14542 ) ) ( not ( = ?auto_14540 ?auto_14565 ) ) ( not ( = ?auto_14542 ?auto_14562 ) ) ( not ( = ?auto_14542 ?auto_14559 ) ) ( not ( = ?auto_14542 ?auto_14555 ) ) ( not ( = ?auto_14542 ?auto_14579 ) ) ( not ( = ?auto_14542 ?auto_14578 ) ) ( not ( = ?auto_14572 ?auto_14557 ) ) ( not ( = ?auto_14572 ?auto_14563 ) ) ( not ( = ?auto_14572 ?auto_14568 ) ) ( not ( = ?auto_14572 ?auto_14570 ) ) ( not ( = ?auto_14569 ?auto_14577 ) ) ( not ( = ?auto_14569 ?auto_14558 ) ) ( not ( = ?auto_14569 ?auto_14574 ) ) ( not ( = ?auto_14569 ?auto_14561 ) ) ( not ( = ?auto_14565 ?auto_14562 ) ) ( not ( = ?auto_14565 ?auto_14559 ) ) ( not ( = ?auto_14565 ?auto_14555 ) ) ( not ( = ?auto_14565 ?auto_14579 ) ) ( not ( = ?auto_14565 ?auto_14578 ) ) ( not ( = ?auto_14536 ?auto_14543 ) ) ( not ( = ?auto_14536 ?auto_14560 ) ) ( not ( = ?auto_14537 ?auto_14543 ) ) ( not ( = ?auto_14537 ?auto_14560 ) ) ( not ( = ?auto_14538 ?auto_14543 ) ) ( not ( = ?auto_14538 ?auto_14560 ) ) ( not ( = ?auto_14539 ?auto_14543 ) ) ( not ( = ?auto_14539 ?auto_14560 ) ) ( not ( = ?auto_14540 ?auto_14543 ) ) ( not ( = ?auto_14540 ?auto_14560 ) ) ( not ( = ?auto_14541 ?auto_14543 ) ) ( not ( = ?auto_14541 ?auto_14560 ) ) ( not ( = ?auto_14543 ?auto_14565 ) ) ( not ( = ?auto_14543 ?auto_14562 ) ) ( not ( = ?auto_14543 ?auto_14559 ) ) ( not ( = ?auto_14543 ?auto_14555 ) ) ( not ( = ?auto_14543 ?auto_14579 ) ) ( not ( = ?auto_14543 ?auto_14578 ) ) ( not ( = ?auto_14573 ?auto_14572 ) ) ( not ( = ?auto_14573 ?auto_14557 ) ) ( not ( = ?auto_14573 ?auto_14563 ) ) ( not ( = ?auto_14573 ?auto_14568 ) ) ( not ( = ?auto_14573 ?auto_14570 ) ) ( not ( = ?auto_14564 ?auto_14569 ) ) ( not ( = ?auto_14564 ?auto_14577 ) ) ( not ( = ?auto_14564 ?auto_14558 ) ) ( not ( = ?auto_14564 ?auto_14574 ) ) ( not ( = ?auto_14564 ?auto_14561 ) ) ( not ( = ?auto_14560 ?auto_14565 ) ) ( not ( = ?auto_14560 ?auto_14562 ) ) ( not ( = ?auto_14560 ?auto_14559 ) ) ( not ( = ?auto_14560 ?auto_14555 ) ) ( not ( = ?auto_14560 ?auto_14579 ) ) ( not ( = ?auto_14560 ?auto_14578 ) ) ( not ( = ?auto_14536 ?auto_14544 ) ) ( not ( = ?auto_14536 ?auto_14566 ) ) ( not ( = ?auto_14537 ?auto_14544 ) ) ( not ( = ?auto_14537 ?auto_14566 ) ) ( not ( = ?auto_14538 ?auto_14544 ) ) ( not ( = ?auto_14538 ?auto_14566 ) ) ( not ( = ?auto_14539 ?auto_14544 ) ) ( not ( = ?auto_14539 ?auto_14566 ) ) ( not ( = ?auto_14540 ?auto_14544 ) ) ( not ( = ?auto_14540 ?auto_14566 ) ) ( not ( = ?auto_14541 ?auto_14544 ) ) ( not ( = ?auto_14541 ?auto_14566 ) ) ( not ( = ?auto_14542 ?auto_14544 ) ) ( not ( = ?auto_14542 ?auto_14566 ) ) ( not ( = ?auto_14544 ?auto_14560 ) ) ( not ( = ?auto_14544 ?auto_14565 ) ) ( not ( = ?auto_14544 ?auto_14562 ) ) ( not ( = ?auto_14544 ?auto_14559 ) ) ( not ( = ?auto_14544 ?auto_14555 ) ) ( not ( = ?auto_14544 ?auto_14579 ) ) ( not ( = ?auto_14544 ?auto_14578 ) ) ( not ( = ?auto_14571 ?auto_14573 ) ) ( not ( = ?auto_14571 ?auto_14572 ) ) ( not ( = ?auto_14571 ?auto_14557 ) ) ( not ( = ?auto_14571 ?auto_14563 ) ) ( not ( = ?auto_14571 ?auto_14568 ) ) ( not ( = ?auto_14571 ?auto_14570 ) ) ( not ( = ?auto_14556 ?auto_14564 ) ) ( not ( = ?auto_14556 ?auto_14569 ) ) ( not ( = ?auto_14556 ?auto_14577 ) ) ( not ( = ?auto_14556 ?auto_14558 ) ) ( not ( = ?auto_14556 ?auto_14574 ) ) ( not ( = ?auto_14556 ?auto_14561 ) ) ( not ( = ?auto_14566 ?auto_14560 ) ) ( not ( = ?auto_14566 ?auto_14565 ) ) ( not ( = ?auto_14566 ?auto_14562 ) ) ( not ( = ?auto_14566 ?auto_14559 ) ) ( not ( = ?auto_14566 ?auto_14555 ) ) ( not ( = ?auto_14566 ?auto_14579 ) ) ( not ( = ?auto_14566 ?auto_14578 ) ) ( not ( = ?auto_14536 ?auto_14545 ) ) ( not ( = ?auto_14536 ?auto_14576 ) ) ( not ( = ?auto_14537 ?auto_14545 ) ) ( not ( = ?auto_14537 ?auto_14576 ) ) ( not ( = ?auto_14538 ?auto_14545 ) ) ( not ( = ?auto_14538 ?auto_14576 ) ) ( not ( = ?auto_14539 ?auto_14545 ) ) ( not ( = ?auto_14539 ?auto_14576 ) ) ( not ( = ?auto_14540 ?auto_14545 ) ) ( not ( = ?auto_14540 ?auto_14576 ) ) ( not ( = ?auto_14541 ?auto_14545 ) ) ( not ( = ?auto_14541 ?auto_14576 ) ) ( not ( = ?auto_14542 ?auto_14545 ) ) ( not ( = ?auto_14542 ?auto_14576 ) ) ( not ( = ?auto_14543 ?auto_14545 ) ) ( not ( = ?auto_14543 ?auto_14576 ) ) ( not ( = ?auto_14545 ?auto_14566 ) ) ( not ( = ?auto_14545 ?auto_14560 ) ) ( not ( = ?auto_14545 ?auto_14565 ) ) ( not ( = ?auto_14545 ?auto_14562 ) ) ( not ( = ?auto_14545 ?auto_14559 ) ) ( not ( = ?auto_14545 ?auto_14555 ) ) ( not ( = ?auto_14545 ?auto_14579 ) ) ( not ( = ?auto_14545 ?auto_14578 ) ) ( not ( = ?auto_14576 ?auto_14566 ) ) ( not ( = ?auto_14576 ?auto_14560 ) ) ( not ( = ?auto_14576 ?auto_14565 ) ) ( not ( = ?auto_14576 ?auto_14562 ) ) ( not ( = ?auto_14576 ?auto_14559 ) ) ( not ( = ?auto_14576 ?auto_14555 ) ) ( not ( = ?auto_14576 ?auto_14579 ) ) ( not ( = ?auto_14576 ?auto_14578 ) ) ( not ( = ?auto_14536 ?auto_14546 ) ) ( not ( = ?auto_14536 ?auto_14575 ) ) ( not ( = ?auto_14537 ?auto_14546 ) ) ( not ( = ?auto_14537 ?auto_14575 ) ) ( not ( = ?auto_14538 ?auto_14546 ) ) ( not ( = ?auto_14538 ?auto_14575 ) ) ( not ( = ?auto_14539 ?auto_14546 ) ) ( not ( = ?auto_14539 ?auto_14575 ) ) ( not ( = ?auto_14540 ?auto_14546 ) ) ( not ( = ?auto_14540 ?auto_14575 ) ) ( not ( = ?auto_14541 ?auto_14546 ) ) ( not ( = ?auto_14541 ?auto_14575 ) ) ( not ( = ?auto_14542 ?auto_14546 ) ) ( not ( = ?auto_14542 ?auto_14575 ) ) ( not ( = ?auto_14543 ?auto_14546 ) ) ( not ( = ?auto_14543 ?auto_14575 ) ) ( not ( = ?auto_14544 ?auto_14546 ) ) ( not ( = ?auto_14544 ?auto_14575 ) ) ( not ( = ?auto_14546 ?auto_14576 ) ) ( not ( = ?auto_14546 ?auto_14566 ) ) ( not ( = ?auto_14546 ?auto_14560 ) ) ( not ( = ?auto_14546 ?auto_14565 ) ) ( not ( = ?auto_14546 ?auto_14562 ) ) ( not ( = ?auto_14546 ?auto_14559 ) ) ( not ( = ?auto_14546 ?auto_14555 ) ) ( not ( = ?auto_14546 ?auto_14579 ) ) ( not ( = ?auto_14546 ?auto_14578 ) ) ( not ( = ?auto_14552 ?auto_14557 ) ) ( not ( = ?auto_14552 ?auto_14571 ) ) ( not ( = ?auto_14552 ?auto_14573 ) ) ( not ( = ?auto_14552 ?auto_14572 ) ) ( not ( = ?auto_14552 ?auto_14563 ) ) ( not ( = ?auto_14552 ?auto_14568 ) ) ( not ( = ?auto_14552 ?auto_14570 ) ) ( not ( = ?auto_14549 ?auto_14577 ) ) ( not ( = ?auto_14549 ?auto_14556 ) ) ( not ( = ?auto_14549 ?auto_14564 ) ) ( not ( = ?auto_14549 ?auto_14569 ) ) ( not ( = ?auto_14549 ?auto_14558 ) ) ( not ( = ?auto_14549 ?auto_14574 ) ) ( not ( = ?auto_14549 ?auto_14561 ) ) ( not ( = ?auto_14575 ?auto_14576 ) ) ( not ( = ?auto_14575 ?auto_14566 ) ) ( not ( = ?auto_14575 ?auto_14560 ) ) ( not ( = ?auto_14575 ?auto_14565 ) ) ( not ( = ?auto_14575 ?auto_14562 ) ) ( not ( = ?auto_14575 ?auto_14559 ) ) ( not ( = ?auto_14575 ?auto_14555 ) ) ( not ( = ?auto_14575 ?auto_14579 ) ) ( not ( = ?auto_14575 ?auto_14578 ) ) ( not ( = ?auto_14536 ?auto_14547 ) ) ( not ( = ?auto_14536 ?auto_14567 ) ) ( not ( = ?auto_14537 ?auto_14547 ) ) ( not ( = ?auto_14537 ?auto_14567 ) ) ( not ( = ?auto_14538 ?auto_14547 ) ) ( not ( = ?auto_14538 ?auto_14567 ) ) ( not ( = ?auto_14539 ?auto_14547 ) ) ( not ( = ?auto_14539 ?auto_14567 ) ) ( not ( = ?auto_14540 ?auto_14547 ) ) ( not ( = ?auto_14540 ?auto_14567 ) ) ( not ( = ?auto_14541 ?auto_14547 ) ) ( not ( = ?auto_14541 ?auto_14567 ) ) ( not ( = ?auto_14542 ?auto_14547 ) ) ( not ( = ?auto_14542 ?auto_14567 ) ) ( not ( = ?auto_14543 ?auto_14547 ) ) ( not ( = ?auto_14543 ?auto_14567 ) ) ( not ( = ?auto_14544 ?auto_14547 ) ) ( not ( = ?auto_14544 ?auto_14567 ) ) ( not ( = ?auto_14545 ?auto_14547 ) ) ( not ( = ?auto_14545 ?auto_14567 ) ) ( not ( = ?auto_14547 ?auto_14575 ) ) ( not ( = ?auto_14547 ?auto_14576 ) ) ( not ( = ?auto_14547 ?auto_14566 ) ) ( not ( = ?auto_14547 ?auto_14560 ) ) ( not ( = ?auto_14547 ?auto_14565 ) ) ( not ( = ?auto_14547 ?auto_14562 ) ) ( not ( = ?auto_14547 ?auto_14559 ) ) ( not ( = ?auto_14547 ?auto_14555 ) ) ( not ( = ?auto_14547 ?auto_14579 ) ) ( not ( = ?auto_14547 ?auto_14578 ) ) ( not ( = ?auto_14567 ?auto_14575 ) ) ( not ( = ?auto_14567 ?auto_14576 ) ) ( not ( = ?auto_14567 ?auto_14566 ) ) ( not ( = ?auto_14567 ?auto_14560 ) ) ( not ( = ?auto_14567 ?auto_14565 ) ) ( not ( = ?auto_14567 ?auto_14562 ) ) ( not ( = ?auto_14567 ?auto_14559 ) ) ( not ( = ?auto_14567 ?auto_14555 ) ) ( not ( = ?auto_14567 ?auto_14579 ) ) ( not ( = ?auto_14567 ?auto_14578 ) ) ( not ( = ?auto_14536 ?auto_14548 ) ) ( not ( = ?auto_14536 ?auto_14553 ) ) ( not ( = ?auto_14537 ?auto_14548 ) ) ( not ( = ?auto_14537 ?auto_14553 ) ) ( not ( = ?auto_14538 ?auto_14548 ) ) ( not ( = ?auto_14538 ?auto_14553 ) ) ( not ( = ?auto_14539 ?auto_14548 ) ) ( not ( = ?auto_14539 ?auto_14553 ) ) ( not ( = ?auto_14540 ?auto_14548 ) ) ( not ( = ?auto_14540 ?auto_14553 ) ) ( not ( = ?auto_14541 ?auto_14548 ) ) ( not ( = ?auto_14541 ?auto_14553 ) ) ( not ( = ?auto_14542 ?auto_14548 ) ) ( not ( = ?auto_14542 ?auto_14553 ) ) ( not ( = ?auto_14543 ?auto_14548 ) ) ( not ( = ?auto_14543 ?auto_14553 ) ) ( not ( = ?auto_14544 ?auto_14548 ) ) ( not ( = ?auto_14544 ?auto_14553 ) ) ( not ( = ?auto_14545 ?auto_14548 ) ) ( not ( = ?auto_14545 ?auto_14553 ) ) ( not ( = ?auto_14546 ?auto_14548 ) ) ( not ( = ?auto_14546 ?auto_14553 ) ) ( not ( = ?auto_14548 ?auto_14567 ) ) ( not ( = ?auto_14548 ?auto_14575 ) ) ( not ( = ?auto_14548 ?auto_14576 ) ) ( not ( = ?auto_14548 ?auto_14566 ) ) ( not ( = ?auto_14548 ?auto_14560 ) ) ( not ( = ?auto_14548 ?auto_14565 ) ) ( not ( = ?auto_14548 ?auto_14562 ) ) ( not ( = ?auto_14548 ?auto_14559 ) ) ( not ( = ?auto_14548 ?auto_14555 ) ) ( not ( = ?auto_14548 ?auto_14579 ) ) ( not ( = ?auto_14548 ?auto_14578 ) ) ( not ( = ?auto_14553 ?auto_14567 ) ) ( not ( = ?auto_14553 ?auto_14575 ) ) ( not ( = ?auto_14553 ?auto_14576 ) ) ( not ( = ?auto_14553 ?auto_14566 ) ) ( not ( = ?auto_14553 ?auto_14560 ) ) ( not ( = ?auto_14553 ?auto_14565 ) ) ( not ( = ?auto_14553 ?auto_14562 ) ) ( not ( = ?auto_14553 ?auto_14559 ) ) ( not ( = ?auto_14553 ?auto_14555 ) ) ( not ( = ?auto_14553 ?auto_14579 ) ) ( not ( = ?auto_14553 ?auto_14578 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_14536 ?auto_14537 ?auto_14538 ?auto_14539 ?auto_14540 ?auto_14541 ?auto_14542 ?auto_14543 ?auto_14544 ?auto_14545 ?auto_14546 ?auto_14547 )
      ( MAKE-1CRATE ?auto_14547 ?auto_14548 )
      ( MAKE-12CRATE-VERIFY ?auto_14536 ?auto_14537 ?auto_14538 ?auto_14539 ?auto_14540 ?auto_14541 ?auto_14542 ?auto_14543 ?auto_14544 ?auto_14545 ?auto_14546 ?auto_14547 ?auto_14548 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_14604 - SURFACE
      ?auto_14605 - SURFACE
      ?auto_14606 - SURFACE
      ?auto_14607 - SURFACE
      ?auto_14608 - SURFACE
      ?auto_14609 - SURFACE
      ?auto_14610 - SURFACE
      ?auto_14611 - SURFACE
      ?auto_14612 - SURFACE
      ?auto_14613 - SURFACE
      ?auto_14614 - SURFACE
      ?auto_14615 - SURFACE
      ?auto_14616 - SURFACE
      ?auto_14617 - SURFACE
    )
    :vars
    (
      ?auto_14620 - HOIST
      ?auto_14618 - PLACE
      ?auto_14623 - PLACE
      ?auto_14619 - HOIST
      ?auto_14622 - SURFACE
      ?auto_14645 - PLACE
      ?auto_14640 - HOIST
      ?auto_14647 - SURFACE
      ?auto_14628 - PLACE
      ?auto_14648 - HOIST
      ?auto_14633 - SURFACE
      ?auto_14625 - SURFACE
      ?auto_14629 - PLACE
      ?auto_14637 - HOIST
      ?auto_14649 - SURFACE
      ?auto_14626 - PLACE
      ?auto_14632 - HOIST
      ?auto_14638 - SURFACE
      ?auto_14644 - PLACE
      ?auto_14635 - HOIST
      ?auto_14634 - SURFACE
      ?auto_14642 - SURFACE
      ?auto_14630 - SURFACE
      ?auto_14627 - PLACE
      ?auto_14641 - HOIST
      ?auto_14631 - SURFACE
      ?auto_14639 - PLACE
      ?auto_14646 - HOIST
      ?auto_14643 - SURFACE
      ?auto_14624 - SURFACE
      ?auto_14636 - SURFACE
      ?auto_14621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14620 ?auto_14618 ) ( IS-CRATE ?auto_14617 ) ( not ( = ?auto_14623 ?auto_14618 ) ) ( HOIST-AT ?auto_14619 ?auto_14623 ) ( SURFACE-AT ?auto_14617 ?auto_14623 ) ( ON ?auto_14617 ?auto_14622 ) ( CLEAR ?auto_14617 ) ( not ( = ?auto_14616 ?auto_14617 ) ) ( not ( = ?auto_14616 ?auto_14622 ) ) ( not ( = ?auto_14617 ?auto_14622 ) ) ( not ( = ?auto_14620 ?auto_14619 ) ) ( IS-CRATE ?auto_14616 ) ( not ( = ?auto_14645 ?auto_14618 ) ) ( HOIST-AT ?auto_14640 ?auto_14645 ) ( SURFACE-AT ?auto_14616 ?auto_14645 ) ( ON ?auto_14616 ?auto_14647 ) ( CLEAR ?auto_14616 ) ( not ( = ?auto_14615 ?auto_14616 ) ) ( not ( = ?auto_14615 ?auto_14647 ) ) ( not ( = ?auto_14616 ?auto_14647 ) ) ( not ( = ?auto_14620 ?auto_14640 ) ) ( IS-CRATE ?auto_14615 ) ( not ( = ?auto_14628 ?auto_14618 ) ) ( HOIST-AT ?auto_14648 ?auto_14628 ) ( SURFACE-AT ?auto_14615 ?auto_14628 ) ( ON ?auto_14615 ?auto_14633 ) ( CLEAR ?auto_14615 ) ( not ( = ?auto_14614 ?auto_14615 ) ) ( not ( = ?auto_14614 ?auto_14633 ) ) ( not ( = ?auto_14615 ?auto_14633 ) ) ( not ( = ?auto_14620 ?auto_14648 ) ) ( IS-CRATE ?auto_14614 ) ( AVAILABLE ?auto_14640 ) ( SURFACE-AT ?auto_14614 ?auto_14645 ) ( ON ?auto_14614 ?auto_14625 ) ( CLEAR ?auto_14614 ) ( not ( = ?auto_14613 ?auto_14614 ) ) ( not ( = ?auto_14613 ?auto_14625 ) ) ( not ( = ?auto_14614 ?auto_14625 ) ) ( IS-CRATE ?auto_14613 ) ( not ( = ?auto_14629 ?auto_14618 ) ) ( HOIST-AT ?auto_14637 ?auto_14629 ) ( SURFACE-AT ?auto_14613 ?auto_14629 ) ( ON ?auto_14613 ?auto_14649 ) ( CLEAR ?auto_14613 ) ( not ( = ?auto_14612 ?auto_14613 ) ) ( not ( = ?auto_14612 ?auto_14649 ) ) ( not ( = ?auto_14613 ?auto_14649 ) ) ( not ( = ?auto_14620 ?auto_14637 ) ) ( IS-CRATE ?auto_14612 ) ( not ( = ?auto_14626 ?auto_14618 ) ) ( HOIST-AT ?auto_14632 ?auto_14626 ) ( AVAILABLE ?auto_14632 ) ( SURFACE-AT ?auto_14612 ?auto_14626 ) ( ON ?auto_14612 ?auto_14638 ) ( CLEAR ?auto_14612 ) ( not ( = ?auto_14611 ?auto_14612 ) ) ( not ( = ?auto_14611 ?auto_14638 ) ) ( not ( = ?auto_14612 ?auto_14638 ) ) ( not ( = ?auto_14620 ?auto_14632 ) ) ( IS-CRATE ?auto_14611 ) ( not ( = ?auto_14644 ?auto_14618 ) ) ( HOIST-AT ?auto_14635 ?auto_14644 ) ( AVAILABLE ?auto_14635 ) ( SURFACE-AT ?auto_14611 ?auto_14644 ) ( ON ?auto_14611 ?auto_14634 ) ( CLEAR ?auto_14611 ) ( not ( = ?auto_14610 ?auto_14611 ) ) ( not ( = ?auto_14610 ?auto_14634 ) ) ( not ( = ?auto_14611 ?auto_14634 ) ) ( not ( = ?auto_14620 ?auto_14635 ) ) ( IS-CRATE ?auto_14610 ) ( AVAILABLE ?auto_14648 ) ( SURFACE-AT ?auto_14610 ?auto_14628 ) ( ON ?auto_14610 ?auto_14642 ) ( CLEAR ?auto_14610 ) ( not ( = ?auto_14609 ?auto_14610 ) ) ( not ( = ?auto_14609 ?auto_14642 ) ) ( not ( = ?auto_14610 ?auto_14642 ) ) ( IS-CRATE ?auto_14609 ) ( AVAILABLE ?auto_14637 ) ( SURFACE-AT ?auto_14609 ?auto_14629 ) ( ON ?auto_14609 ?auto_14630 ) ( CLEAR ?auto_14609 ) ( not ( = ?auto_14608 ?auto_14609 ) ) ( not ( = ?auto_14608 ?auto_14630 ) ) ( not ( = ?auto_14609 ?auto_14630 ) ) ( IS-CRATE ?auto_14608 ) ( not ( = ?auto_14627 ?auto_14618 ) ) ( HOIST-AT ?auto_14641 ?auto_14627 ) ( AVAILABLE ?auto_14641 ) ( SURFACE-AT ?auto_14608 ?auto_14627 ) ( ON ?auto_14608 ?auto_14631 ) ( CLEAR ?auto_14608 ) ( not ( = ?auto_14607 ?auto_14608 ) ) ( not ( = ?auto_14607 ?auto_14631 ) ) ( not ( = ?auto_14608 ?auto_14631 ) ) ( not ( = ?auto_14620 ?auto_14641 ) ) ( IS-CRATE ?auto_14607 ) ( not ( = ?auto_14639 ?auto_14618 ) ) ( HOIST-AT ?auto_14646 ?auto_14639 ) ( AVAILABLE ?auto_14646 ) ( SURFACE-AT ?auto_14607 ?auto_14639 ) ( ON ?auto_14607 ?auto_14643 ) ( CLEAR ?auto_14607 ) ( not ( = ?auto_14606 ?auto_14607 ) ) ( not ( = ?auto_14606 ?auto_14643 ) ) ( not ( = ?auto_14607 ?auto_14643 ) ) ( not ( = ?auto_14620 ?auto_14646 ) ) ( IS-CRATE ?auto_14606 ) ( SURFACE-AT ?auto_14606 ?auto_14623 ) ( ON ?auto_14606 ?auto_14624 ) ( CLEAR ?auto_14606 ) ( not ( = ?auto_14605 ?auto_14606 ) ) ( not ( = ?auto_14605 ?auto_14624 ) ) ( not ( = ?auto_14606 ?auto_14624 ) ) ( SURFACE-AT ?auto_14604 ?auto_14618 ) ( CLEAR ?auto_14604 ) ( IS-CRATE ?auto_14605 ) ( AVAILABLE ?auto_14620 ) ( AVAILABLE ?auto_14619 ) ( SURFACE-AT ?auto_14605 ?auto_14623 ) ( ON ?auto_14605 ?auto_14636 ) ( CLEAR ?auto_14605 ) ( TRUCK-AT ?auto_14621 ?auto_14618 ) ( not ( = ?auto_14604 ?auto_14605 ) ) ( not ( = ?auto_14604 ?auto_14636 ) ) ( not ( = ?auto_14605 ?auto_14636 ) ) ( not ( = ?auto_14604 ?auto_14606 ) ) ( not ( = ?auto_14604 ?auto_14624 ) ) ( not ( = ?auto_14606 ?auto_14636 ) ) ( not ( = ?auto_14624 ?auto_14636 ) ) ( not ( = ?auto_14604 ?auto_14607 ) ) ( not ( = ?auto_14604 ?auto_14643 ) ) ( not ( = ?auto_14605 ?auto_14607 ) ) ( not ( = ?auto_14605 ?auto_14643 ) ) ( not ( = ?auto_14607 ?auto_14624 ) ) ( not ( = ?auto_14607 ?auto_14636 ) ) ( not ( = ?auto_14639 ?auto_14623 ) ) ( not ( = ?auto_14646 ?auto_14619 ) ) ( not ( = ?auto_14643 ?auto_14624 ) ) ( not ( = ?auto_14643 ?auto_14636 ) ) ( not ( = ?auto_14604 ?auto_14608 ) ) ( not ( = ?auto_14604 ?auto_14631 ) ) ( not ( = ?auto_14605 ?auto_14608 ) ) ( not ( = ?auto_14605 ?auto_14631 ) ) ( not ( = ?auto_14606 ?auto_14608 ) ) ( not ( = ?auto_14606 ?auto_14631 ) ) ( not ( = ?auto_14608 ?auto_14643 ) ) ( not ( = ?auto_14608 ?auto_14624 ) ) ( not ( = ?auto_14608 ?auto_14636 ) ) ( not ( = ?auto_14627 ?auto_14639 ) ) ( not ( = ?auto_14627 ?auto_14623 ) ) ( not ( = ?auto_14641 ?auto_14646 ) ) ( not ( = ?auto_14641 ?auto_14619 ) ) ( not ( = ?auto_14631 ?auto_14643 ) ) ( not ( = ?auto_14631 ?auto_14624 ) ) ( not ( = ?auto_14631 ?auto_14636 ) ) ( not ( = ?auto_14604 ?auto_14609 ) ) ( not ( = ?auto_14604 ?auto_14630 ) ) ( not ( = ?auto_14605 ?auto_14609 ) ) ( not ( = ?auto_14605 ?auto_14630 ) ) ( not ( = ?auto_14606 ?auto_14609 ) ) ( not ( = ?auto_14606 ?auto_14630 ) ) ( not ( = ?auto_14607 ?auto_14609 ) ) ( not ( = ?auto_14607 ?auto_14630 ) ) ( not ( = ?auto_14609 ?auto_14631 ) ) ( not ( = ?auto_14609 ?auto_14643 ) ) ( not ( = ?auto_14609 ?auto_14624 ) ) ( not ( = ?auto_14609 ?auto_14636 ) ) ( not ( = ?auto_14629 ?auto_14627 ) ) ( not ( = ?auto_14629 ?auto_14639 ) ) ( not ( = ?auto_14629 ?auto_14623 ) ) ( not ( = ?auto_14637 ?auto_14641 ) ) ( not ( = ?auto_14637 ?auto_14646 ) ) ( not ( = ?auto_14637 ?auto_14619 ) ) ( not ( = ?auto_14630 ?auto_14631 ) ) ( not ( = ?auto_14630 ?auto_14643 ) ) ( not ( = ?auto_14630 ?auto_14624 ) ) ( not ( = ?auto_14630 ?auto_14636 ) ) ( not ( = ?auto_14604 ?auto_14610 ) ) ( not ( = ?auto_14604 ?auto_14642 ) ) ( not ( = ?auto_14605 ?auto_14610 ) ) ( not ( = ?auto_14605 ?auto_14642 ) ) ( not ( = ?auto_14606 ?auto_14610 ) ) ( not ( = ?auto_14606 ?auto_14642 ) ) ( not ( = ?auto_14607 ?auto_14610 ) ) ( not ( = ?auto_14607 ?auto_14642 ) ) ( not ( = ?auto_14608 ?auto_14610 ) ) ( not ( = ?auto_14608 ?auto_14642 ) ) ( not ( = ?auto_14610 ?auto_14630 ) ) ( not ( = ?auto_14610 ?auto_14631 ) ) ( not ( = ?auto_14610 ?auto_14643 ) ) ( not ( = ?auto_14610 ?auto_14624 ) ) ( not ( = ?auto_14610 ?auto_14636 ) ) ( not ( = ?auto_14628 ?auto_14629 ) ) ( not ( = ?auto_14628 ?auto_14627 ) ) ( not ( = ?auto_14628 ?auto_14639 ) ) ( not ( = ?auto_14628 ?auto_14623 ) ) ( not ( = ?auto_14648 ?auto_14637 ) ) ( not ( = ?auto_14648 ?auto_14641 ) ) ( not ( = ?auto_14648 ?auto_14646 ) ) ( not ( = ?auto_14648 ?auto_14619 ) ) ( not ( = ?auto_14642 ?auto_14630 ) ) ( not ( = ?auto_14642 ?auto_14631 ) ) ( not ( = ?auto_14642 ?auto_14643 ) ) ( not ( = ?auto_14642 ?auto_14624 ) ) ( not ( = ?auto_14642 ?auto_14636 ) ) ( not ( = ?auto_14604 ?auto_14611 ) ) ( not ( = ?auto_14604 ?auto_14634 ) ) ( not ( = ?auto_14605 ?auto_14611 ) ) ( not ( = ?auto_14605 ?auto_14634 ) ) ( not ( = ?auto_14606 ?auto_14611 ) ) ( not ( = ?auto_14606 ?auto_14634 ) ) ( not ( = ?auto_14607 ?auto_14611 ) ) ( not ( = ?auto_14607 ?auto_14634 ) ) ( not ( = ?auto_14608 ?auto_14611 ) ) ( not ( = ?auto_14608 ?auto_14634 ) ) ( not ( = ?auto_14609 ?auto_14611 ) ) ( not ( = ?auto_14609 ?auto_14634 ) ) ( not ( = ?auto_14611 ?auto_14642 ) ) ( not ( = ?auto_14611 ?auto_14630 ) ) ( not ( = ?auto_14611 ?auto_14631 ) ) ( not ( = ?auto_14611 ?auto_14643 ) ) ( not ( = ?auto_14611 ?auto_14624 ) ) ( not ( = ?auto_14611 ?auto_14636 ) ) ( not ( = ?auto_14644 ?auto_14628 ) ) ( not ( = ?auto_14644 ?auto_14629 ) ) ( not ( = ?auto_14644 ?auto_14627 ) ) ( not ( = ?auto_14644 ?auto_14639 ) ) ( not ( = ?auto_14644 ?auto_14623 ) ) ( not ( = ?auto_14635 ?auto_14648 ) ) ( not ( = ?auto_14635 ?auto_14637 ) ) ( not ( = ?auto_14635 ?auto_14641 ) ) ( not ( = ?auto_14635 ?auto_14646 ) ) ( not ( = ?auto_14635 ?auto_14619 ) ) ( not ( = ?auto_14634 ?auto_14642 ) ) ( not ( = ?auto_14634 ?auto_14630 ) ) ( not ( = ?auto_14634 ?auto_14631 ) ) ( not ( = ?auto_14634 ?auto_14643 ) ) ( not ( = ?auto_14634 ?auto_14624 ) ) ( not ( = ?auto_14634 ?auto_14636 ) ) ( not ( = ?auto_14604 ?auto_14612 ) ) ( not ( = ?auto_14604 ?auto_14638 ) ) ( not ( = ?auto_14605 ?auto_14612 ) ) ( not ( = ?auto_14605 ?auto_14638 ) ) ( not ( = ?auto_14606 ?auto_14612 ) ) ( not ( = ?auto_14606 ?auto_14638 ) ) ( not ( = ?auto_14607 ?auto_14612 ) ) ( not ( = ?auto_14607 ?auto_14638 ) ) ( not ( = ?auto_14608 ?auto_14612 ) ) ( not ( = ?auto_14608 ?auto_14638 ) ) ( not ( = ?auto_14609 ?auto_14612 ) ) ( not ( = ?auto_14609 ?auto_14638 ) ) ( not ( = ?auto_14610 ?auto_14612 ) ) ( not ( = ?auto_14610 ?auto_14638 ) ) ( not ( = ?auto_14612 ?auto_14634 ) ) ( not ( = ?auto_14612 ?auto_14642 ) ) ( not ( = ?auto_14612 ?auto_14630 ) ) ( not ( = ?auto_14612 ?auto_14631 ) ) ( not ( = ?auto_14612 ?auto_14643 ) ) ( not ( = ?auto_14612 ?auto_14624 ) ) ( not ( = ?auto_14612 ?auto_14636 ) ) ( not ( = ?auto_14626 ?auto_14644 ) ) ( not ( = ?auto_14626 ?auto_14628 ) ) ( not ( = ?auto_14626 ?auto_14629 ) ) ( not ( = ?auto_14626 ?auto_14627 ) ) ( not ( = ?auto_14626 ?auto_14639 ) ) ( not ( = ?auto_14626 ?auto_14623 ) ) ( not ( = ?auto_14632 ?auto_14635 ) ) ( not ( = ?auto_14632 ?auto_14648 ) ) ( not ( = ?auto_14632 ?auto_14637 ) ) ( not ( = ?auto_14632 ?auto_14641 ) ) ( not ( = ?auto_14632 ?auto_14646 ) ) ( not ( = ?auto_14632 ?auto_14619 ) ) ( not ( = ?auto_14638 ?auto_14634 ) ) ( not ( = ?auto_14638 ?auto_14642 ) ) ( not ( = ?auto_14638 ?auto_14630 ) ) ( not ( = ?auto_14638 ?auto_14631 ) ) ( not ( = ?auto_14638 ?auto_14643 ) ) ( not ( = ?auto_14638 ?auto_14624 ) ) ( not ( = ?auto_14638 ?auto_14636 ) ) ( not ( = ?auto_14604 ?auto_14613 ) ) ( not ( = ?auto_14604 ?auto_14649 ) ) ( not ( = ?auto_14605 ?auto_14613 ) ) ( not ( = ?auto_14605 ?auto_14649 ) ) ( not ( = ?auto_14606 ?auto_14613 ) ) ( not ( = ?auto_14606 ?auto_14649 ) ) ( not ( = ?auto_14607 ?auto_14613 ) ) ( not ( = ?auto_14607 ?auto_14649 ) ) ( not ( = ?auto_14608 ?auto_14613 ) ) ( not ( = ?auto_14608 ?auto_14649 ) ) ( not ( = ?auto_14609 ?auto_14613 ) ) ( not ( = ?auto_14609 ?auto_14649 ) ) ( not ( = ?auto_14610 ?auto_14613 ) ) ( not ( = ?auto_14610 ?auto_14649 ) ) ( not ( = ?auto_14611 ?auto_14613 ) ) ( not ( = ?auto_14611 ?auto_14649 ) ) ( not ( = ?auto_14613 ?auto_14638 ) ) ( not ( = ?auto_14613 ?auto_14634 ) ) ( not ( = ?auto_14613 ?auto_14642 ) ) ( not ( = ?auto_14613 ?auto_14630 ) ) ( not ( = ?auto_14613 ?auto_14631 ) ) ( not ( = ?auto_14613 ?auto_14643 ) ) ( not ( = ?auto_14613 ?auto_14624 ) ) ( not ( = ?auto_14613 ?auto_14636 ) ) ( not ( = ?auto_14649 ?auto_14638 ) ) ( not ( = ?auto_14649 ?auto_14634 ) ) ( not ( = ?auto_14649 ?auto_14642 ) ) ( not ( = ?auto_14649 ?auto_14630 ) ) ( not ( = ?auto_14649 ?auto_14631 ) ) ( not ( = ?auto_14649 ?auto_14643 ) ) ( not ( = ?auto_14649 ?auto_14624 ) ) ( not ( = ?auto_14649 ?auto_14636 ) ) ( not ( = ?auto_14604 ?auto_14614 ) ) ( not ( = ?auto_14604 ?auto_14625 ) ) ( not ( = ?auto_14605 ?auto_14614 ) ) ( not ( = ?auto_14605 ?auto_14625 ) ) ( not ( = ?auto_14606 ?auto_14614 ) ) ( not ( = ?auto_14606 ?auto_14625 ) ) ( not ( = ?auto_14607 ?auto_14614 ) ) ( not ( = ?auto_14607 ?auto_14625 ) ) ( not ( = ?auto_14608 ?auto_14614 ) ) ( not ( = ?auto_14608 ?auto_14625 ) ) ( not ( = ?auto_14609 ?auto_14614 ) ) ( not ( = ?auto_14609 ?auto_14625 ) ) ( not ( = ?auto_14610 ?auto_14614 ) ) ( not ( = ?auto_14610 ?auto_14625 ) ) ( not ( = ?auto_14611 ?auto_14614 ) ) ( not ( = ?auto_14611 ?auto_14625 ) ) ( not ( = ?auto_14612 ?auto_14614 ) ) ( not ( = ?auto_14612 ?auto_14625 ) ) ( not ( = ?auto_14614 ?auto_14649 ) ) ( not ( = ?auto_14614 ?auto_14638 ) ) ( not ( = ?auto_14614 ?auto_14634 ) ) ( not ( = ?auto_14614 ?auto_14642 ) ) ( not ( = ?auto_14614 ?auto_14630 ) ) ( not ( = ?auto_14614 ?auto_14631 ) ) ( not ( = ?auto_14614 ?auto_14643 ) ) ( not ( = ?auto_14614 ?auto_14624 ) ) ( not ( = ?auto_14614 ?auto_14636 ) ) ( not ( = ?auto_14645 ?auto_14629 ) ) ( not ( = ?auto_14645 ?auto_14626 ) ) ( not ( = ?auto_14645 ?auto_14644 ) ) ( not ( = ?auto_14645 ?auto_14628 ) ) ( not ( = ?auto_14645 ?auto_14627 ) ) ( not ( = ?auto_14645 ?auto_14639 ) ) ( not ( = ?auto_14645 ?auto_14623 ) ) ( not ( = ?auto_14640 ?auto_14637 ) ) ( not ( = ?auto_14640 ?auto_14632 ) ) ( not ( = ?auto_14640 ?auto_14635 ) ) ( not ( = ?auto_14640 ?auto_14648 ) ) ( not ( = ?auto_14640 ?auto_14641 ) ) ( not ( = ?auto_14640 ?auto_14646 ) ) ( not ( = ?auto_14640 ?auto_14619 ) ) ( not ( = ?auto_14625 ?auto_14649 ) ) ( not ( = ?auto_14625 ?auto_14638 ) ) ( not ( = ?auto_14625 ?auto_14634 ) ) ( not ( = ?auto_14625 ?auto_14642 ) ) ( not ( = ?auto_14625 ?auto_14630 ) ) ( not ( = ?auto_14625 ?auto_14631 ) ) ( not ( = ?auto_14625 ?auto_14643 ) ) ( not ( = ?auto_14625 ?auto_14624 ) ) ( not ( = ?auto_14625 ?auto_14636 ) ) ( not ( = ?auto_14604 ?auto_14615 ) ) ( not ( = ?auto_14604 ?auto_14633 ) ) ( not ( = ?auto_14605 ?auto_14615 ) ) ( not ( = ?auto_14605 ?auto_14633 ) ) ( not ( = ?auto_14606 ?auto_14615 ) ) ( not ( = ?auto_14606 ?auto_14633 ) ) ( not ( = ?auto_14607 ?auto_14615 ) ) ( not ( = ?auto_14607 ?auto_14633 ) ) ( not ( = ?auto_14608 ?auto_14615 ) ) ( not ( = ?auto_14608 ?auto_14633 ) ) ( not ( = ?auto_14609 ?auto_14615 ) ) ( not ( = ?auto_14609 ?auto_14633 ) ) ( not ( = ?auto_14610 ?auto_14615 ) ) ( not ( = ?auto_14610 ?auto_14633 ) ) ( not ( = ?auto_14611 ?auto_14615 ) ) ( not ( = ?auto_14611 ?auto_14633 ) ) ( not ( = ?auto_14612 ?auto_14615 ) ) ( not ( = ?auto_14612 ?auto_14633 ) ) ( not ( = ?auto_14613 ?auto_14615 ) ) ( not ( = ?auto_14613 ?auto_14633 ) ) ( not ( = ?auto_14615 ?auto_14625 ) ) ( not ( = ?auto_14615 ?auto_14649 ) ) ( not ( = ?auto_14615 ?auto_14638 ) ) ( not ( = ?auto_14615 ?auto_14634 ) ) ( not ( = ?auto_14615 ?auto_14642 ) ) ( not ( = ?auto_14615 ?auto_14630 ) ) ( not ( = ?auto_14615 ?auto_14631 ) ) ( not ( = ?auto_14615 ?auto_14643 ) ) ( not ( = ?auto_14615 ?auto_14624 ) ) ( not ( = ?auto_14615 ?auto_14636 ) ) ( not ( = ?auto_14633 ?auto_14625 ) ) ( not ( = ?auto_14633 ?auto_14649 ) ) ( not ( = ?auto_14633 ?auto_14638 ) ) ( not ( = ?auto_14633 ?auto_14634 ) ) ( not ( = ?auto_14633 ?auto_14642 ) ) ( not ( = ?auto_14633 ?auto_14630 ) ) ( not ( = ?auto_14633 ?auto_14631 ) ) ( not ( = ?auto_14633 ?auto_14643 ) ) ( not ( = ?auto_14633 ?auto_14624 ) ) ( not ( = ?auto_14633 ?auto_14636 ) ) ( not ( = ?auto_14604 ?auto_14616 ) ) ( not ( = ?auto_14604 ?auto_14647 ) ) ( not ( = ?auto_14605 ?auto_14616 ) ) ( not ( = ?auto_14605 ?auto_14647 ) ) ( not ( = ?auto_14606 ?auto_14616 ) ) ( not ( = ?auto_14606 ?auto_14647 ) ) ( not ( = ?auto_14607 ?auto_14616 ) ) ( not ( = ?auto_14607 ?auto_14647 ) ) ( not ( = ?auto_14608 ?auto_14616 ) ) ( not ( = ?auto_14608 ?auto_14647 ) ) ( not ( = ?auto_14609 ?auto_14616 ) ) ( not ( = ?auto_14609 ?auto_14647 ) ) ( not ( = ?auto_14610 ?auto_14616 ) ) ( not ( = ?auto_14610 ?auto_14647 ) ) ( not ( = ?auto_14611 ?auto_14616 ) ) ( not ( = ?auto_14611 ?auto_14647 ) ) ( not ( = ?auto_14612 ?auto_14616 ) ) ( not ( = ?auto_14612 ?auto_14647 ) ) ( not ( = ?auto_14613 ?auto_14616 ) ) ( not ( = ?auto_14613 ?auto_14647 ) ) ( not ( = ?auto_14614 ?auto_14616 ) ) ( not ( = ?auto_14614 ?auto_14647 ) ) ( not ( = ?auto_14616 ?auto_14633 ) ) ( not ( = ?auto_14616 ?auto_14625 ) ) ( not ( = ?auto_14616 ?auto_14649 ) ) ( not ( = ?auto_14616 ?auto_14638 ) ) ( not ( = ?auto_14616 ?auto_14634 ) ) ( not ( = ?auto_14616 ?auto_14642 ) ) ( not ( = ?auto_14616 ?auto_14630 ) ) ( not ( = ?auto_14616 ?auto_14631 ) ) ( not ( = ?auto_14616 ?auto_14643 ) ) ( not ( = ?auto_14616 ?auto_14624 ) ) ( not ( = ?auto_14616 ?auto_14636 ) ) ( not ( = ?auto_14647 ?auto_14633 ) ) ( not ( = ?auto_14647 ?auto_14625 ) ) ( not ( = ?auto_14647 ?auto_14649 ) ) ( not ( = ?auto_14647 ?auto_14638 ) ) ( not ( = ?auto_14647 ?auto_14634 ) ) ( not ( = ?auto_14647 ?auto_14642 ) ) ( not ( = ?auto_14647 ?auto_14630 ) ) ( not ( = ?auto_14647 ?auto_14631 ) ) ( not ( = ?auto_14647 ?auto_14643 ) ) ( not ( = ?auto_14647 ?auto_14624 ) ) ( not ( = ?auto_14647 ?auto_14636 ) ) ( not ( = ?auto_14604 ?auto_14617 ) ) ( not ( = ?auto_14604 ?auto_14622 ) ) ( not ( = ?auto_14605 ?auto_14617 ) ) ( not ( = ?auto_14605 ?auto_14622 ) ) ( not ( = ?auto_14606 ?auto_14617 ) ) ( not ( = ?auto_14606 ?auto_14622 ) ) ( not ( = ?auto_14607 ?auto_14617 ) ) ( not ( = ?auto_14607 ?auto_14622 ) ) ( not ( = ?auto_14608 ?auto_14617 ) ) ( not ( = ?auto_14608 ?auto_14622 ) ) ( not ( = ?auto_14609 ?auto_14617 ) ) ( not ( = ?auto_14609 ?auto_14622 ) ) ( not ( = ?auto_14610 ?auto_14617 ) ) ( not ( = ?auto_14610 ?auto_14622 ) ) ( not ( = ?auto_14611 ?auto_14617 ) ) ( not ( = ?auto_14611 ?auto_14622 ) ) ( not ( = ?auto_14612 ?auto_14617 ) ) ( not ( = ?auto_14612 ?auto_14622 ) ) ( not ( = ?auto_14613 ?auto_14617 ) ) ( not ( = ?auto_14613 ?auto_14622 ) ) ( not ( = ?auto_14614 ?auto_14617 ) ) ( not ( = ?auto_14614 ?auto_14622 ) ) ( not ( = ?auto_14615 ?auto_14617 ) ) ( not ( = ?auto_14615 ?auto_14622 ) ) ( not ( = ?auto_14617 ?auto_14647 ) ) ( not ( = ?auto_14617 ?auto_14633 ) ) ( not ( = ?auto_14617 ?auto_14625 ) ) ( not ( = ?auto_14617 ?auto_14649 ) ) ( not ( = ?auto_14617 ?auto_14638 ) ) ( not ( = ?auto_14617 ?auto_14634 ) ) ( not ( = ?auto_14617 ?auto_14642 ) ) ( not ( = ?auto_14617 ?auto_14630 ) ) ( not ( = ?auto_14617 ?auto_14631 ) ) ( not ( = ?auto_14617 ?auto_14643 ) ) ( not ( = ?auto_14617 ?auto_14624 ) ) ( not ( = ?auto_14617 ?auto_14636 ) ) ( not ( = ?auto_14622 ?auto_14647 ) ) ( not ( = ?auto_14622 ?auto_14633 ) ) ( not ( = ?auto_14622 ?auto_14625 ) ) ( not ( = ?auto_14622 ?auto_14649 ) ) ( not ( = ?auto_14622 ?auto_14638 ) ) ( not ( = ?auto_14622 ?auto_14634 ) ) ( not ( = ?auto_14622 ?auto_14642 ) ) ( not ( = ?auto_14622 ?auto_14630 ) ) ( not ( = ?auto_14622 ?auto_14631 ) ) ( not ( = ?auto_14622 ?auto_14643 ) ) ( not ( = ?auto_14622 ?auto_14624 ) ) ( not ( = ?auto_14622 ?auto_14636 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_14604 ?auto_14605 ?auto_14606 ?auto_14607 ?auto_14608 ?auto_14609 ?auto_14610 ?auto_14611 ?auto_14612 ?auto_14613 ?auto_14614 ?auto_14615 ?auto_14616 )
      ( MAKE-1CRATE ?auto_14616 ?auto_14617 )
      ( MAKE-13CRATE-VERIFY ?auto_14604 ?auto_14605 ?auto_14606 ?auto_14607 ?auto_14608 ?auto_14609 ?auto_14610 ?auto_14611 ?auto_14612 ?auto_14613 ?auto_14614 ?auto_14615 ?auto_14616 ?auto_14617 ) )
  )

)

