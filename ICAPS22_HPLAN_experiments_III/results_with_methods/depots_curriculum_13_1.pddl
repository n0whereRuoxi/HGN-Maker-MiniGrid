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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14068 - SURFACE
      ?auto_14069 - SURFACE
    )
    :vars
    (
      ?auto_14070 - HOIST
      ?auto_14071 - PLACE
      ?auto_14073 - PLACE
      ?auto_14074 - HOIST
      ?auto_14075 - SURFACE
      ?auto_14072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14070 ?auto_14071 ) ( SURFACE-AT ?auto_14068 ?auto_14071 ) ( CLEAR ?auto_14068 ) ( IS-CRATE ?auto_14069 ) ( AVAILABLE ?auto_14070 ) ( not ( = ?auto_14073 ?auto_14071 ) ) ( HOIST-AT ?auto_14074 ?auto_14073 ) ( AVAILABLE ?auto_14074 ) ( SURFACE-AT ?auto_14069 ?auto_14073 ) ( ON ?auto_14069 ?auto_14075 ) ( CLEAR ?auto_14069 ) ( TRUCK-AT ?auto_14072 ?auto_14071 ) ( not ( = ?auto_14068 ?auto_14069 ) ) ( not ( = ?auto_14068 ?auto_14075 ) ) ( not ( = ?auto_14069 ?auto_14075 ) ) ( not ( = ?auto_14070 ?auto_14074 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14072 ?auto_14071 ?auto_14073 )
      ( !LIFT ?auto_14074 ?auto_14069 ?auto_14075 ?auto_14073 )
      ( !LOAD ?auto_14074 ?auto_14069 ?auto_14072 ?auto_14073 )
      ( !DRIVE ?auto_14072 ?auto_14073 ?auto_14071 )
      ( !UNLOAD ?auto_14070 ?auto_14069 ?auto_14072 ?auto_14071 )
      ( !DROP ?auto_14070 ?auto_14069 ?auto_14068 ?auto_14071 )
      ( MAKE-1CRATE-VERIFY ?auto_14068 ?auto_14069 ) )
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
      ?auto_14085 - PLACE
      ?auto_14083 - PLACE
      ?auto_14084 - HOIST
      ?auto_14087 - SURFACE
      ?auto_14088 - SURFACE
      ?auto_14082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14086 ?auto_14085 ) ( IS-CRATE ?auto_14081 ) ( not ( = ?auto_14083 ?auto_14085 ) ) ( HOIST-AT ?auto_14084 ?auto_14083 ) ( SURFACE-AT ?auto_14081 ?auto_14083 ) ( ON ?auto_14081 ?auto_14087 ) ( CLEAR ?auto_14081 ) ( not ( = ?auto_14080 ?auto_14081 ) ) ( not ( = ?auto_14080 ?auto_14087 ) ) ( not ( = ?auto_14081 ?auto_14087 ) ) ( not ( = ?auto_14086 ?auto_14084 ) ) ( SURFACE-AT ?auto_14079 ?auto_14085 ) ( CLEAR ?auto_14079 ) ( IS-CRATE ?auto_14080 ) ( AVAILABLE ?auto_14086 ) ( AVAILABLE ?auto_14084 ) ( SURFACE-AT ?auto_14080 ?auto_14083 ) ( ON ?auto_14080 ?auto_14088 ) ( CLEAR ?auto_14080 ) ( TRUCK-AT ?auto_14082 ?auto_14085 ) ( not ( = ?auto_14079 ?auto_14080 ) ) ( not ( = ?auto_14079 ?auto_14088 ) ) ( not ( = ?auto_14080 ?auto_14088 ) ) ( not ( = ?auto_14079 ?auto_14081 ) ) ( not ( = ?auto_14079 ?auto_14087 ) ) ( not ( = ?auto_14081 ?auto_14088 ) ) ( not ( = ?auto_14087 ?auto_14088 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14079 ?auto_14080 )
      ( MAKE-1CRATE ?auto_14080 ?auto_14081 )
      ( MAKE-2CRATE-VERIFY ?auto_14079 ?auto_14080 ?auto_14081 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14091 - SURFACE
      ?auto_14092 - SURFACE
    )
    :vars
    (
      ?auto_14093 - HOIST
      ?auto_14094 - PLACE
      ?auto_14096 - PLACE
      ?auto_14097 - HOIST
      ?auto_14098 - SURFACE
      ?auto_14095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14093 ?auto_14094 ) ( SURFACE-AT ?auto_14091 ?auto_14094 ) ( CLEAR ?auto_14091 ) ( IS-CRATE ?auto_14092 ) ( AVAILABLE ?auto_14093 ) ( not ( = ?auto_14096 ?auto_14094 ) ) ( HOIST-AT ?auto_14097 ?auto_14096 ) ( AVAILABLE ?auto_14097 ) ( SURFACE-AT ?auto_14092 ?auto_14096 ) ( ON ?auto_14092 ?auto_14098 ) ( CLEAR ?auto_14092 ) ( TRUCK-AT ?auto_14095 ?auto_14094 ) ( not ( = ?auto_14091 ?auto_14092 ) ) ( not ( = ?auto_14091 ?auto_14098 ) ) ( not ( = ?auto_14092 ?auto_14098 ) ) ( not ( = ?auto_14093 ?auto_14097 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14095 ?auto_14094 ?auto_14096 )
      ( !LIFT ?auto_14097 ?auto_14092 ?auto_14098 ?auto_14096 )
      ( !LOAD ?auto_14097 ?auto_14092 ?auto_14095 ?auto_14096 )
      ( !DRIVE ?auto_14095 ?auto_14096 ?auto_14094 )
      ( !UNLOAD ?auto_14093 ?auto_14092 ?auto_14095 ?auto_14094 )
      ( !DROP ?auto_14093 ?auto_14092 ?auto_14091 ?auto_14094 )
      ( MAKE-1CRATE-VERIFY ?auto_14091 ?auto_14092 ) )
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
      ?auto_14110 - HOIST
      ?auto_14111 - PLACE
      ?auto_14108 - PLACE
      ?auto_14107 - HOIST
      ?auto_14109 - SURFACE
      ?auto_14115 - PLACE
      ?auto_14114 - HOIST
      ?auto_14116 - SURFACE
      ?auto_14113 - SURFACE
      ?auto_14112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14110 ?auto_14111 ) ( IS-CRATE ?auto_14106 ) ( not ( = ?auto_14108 ?auto_14111 ) ) ( HOIST-AT ?auto_14107 ?auto_14108 ) ( AVAILABLE ?auto_14107 ) ( SURFACE-AT ?auto_14106 ?auto_14108 ) ( ON ?auto_14106 ?auto_14109 ) ( CLEAR ?auto_14106 ) ( not ( = ?auto_14105 ?auto_14106 ) ) ( not ( = ?auto_14105 ?auto_14109 ) ) ( not ( = ?auto_14106 ?auto_14109 ) ) ( not ( = ?auto_14110 ?auto_14107 ) ) ( IS-CRATE ?auto_14105 ) ( not ( = ?auto_14115 ?auto_14111 ) ) ( HOIST-AT ?auto_14114 ?auto_14115 ) ( SURFACE-AT ?auto_14105 ?auto_14115 ) ( ON ?auto_14105 ?auto_14116 ) ( CLEAR ?auto_14105 ) ( not ( = ?auto_14104 ?auto_14105 ) ) ( not ( = ?auto_14104 ?auto_14116 ) ) ( not ( = ?auto_14105 ?auto_14116 ) ) ( not ( = ?auto_14110 ?auto_14114 ) ) ( SURFACE-AT ?auto_14103 ?auto_14111 ) ( CLEAR ?auto_14103 ) ( IS-CRATE ?auto_14104 ) ( AVAILABLE ?auto_14110 ) ( AVAILABLE ?auto_14114 ) ( SURFACE-AT ?auto_14104 ?auto_14115 ) ( ON ?auto_14104 ?auto_14113 ) ( CLEAR ?auto_14104 ) ( TRUCK-AT ?auto_14112 ?auto_14111 ) ( not ( = ?auto_14103 ?auto_14104 ) ) ( not ( = ?auto_14103 ?auto_14113 ) ) ( not ( = ?auto_14104 ?auto_14113 ) ) ( not ( = ?auto_14103 ?auto_14105 ) ) ( not ( = ?auto_14103 ?auto_14116 ) ) ( not ( = ?auto_14105 ?auto_14113 ) ) ( not ( = ?auto_14116 ?auto_14113 ) ) ( not ( = ?auto_14103 ?auto_14106 ) ) ( not ( = ?auto_14103 ?auto_14109 ) ) ( not ( = ?auto_14104 ?auto_14106 ) ) ( not ( = ?auto_14104 ?auto_14109 ) ) ( not ( = ?auto_14106 ?auto_14116 ) ) ( not ( = ?auto_14106 ?auto_14113 ) ) ( not ( = ?auto_14108 ?auto_14115 ) ) ( not ( = ?auto_14107 ?auto_14114 ) ) ( not ( = ?auto_14109 ?auto_14116 ) ) ( not ( = ?auto_14109 ?auto_14113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14103 ?auto_14104 ?auto_14105 )
      ( MAKE-1CRATE ?auto_14105 ?auto_14106 )
      ( MAKE-3CRATE-VERIFY ?auto_14103 ?auto_14104 ?auto_14105 ?auto_14106 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14119 - SURFACE
      ?auto_14120 - SURFACE
    )
    :vars
    (
      ?auto_14121 - HOIST
      ?auto_14122 - PLACE
      ?auto_14124 - PLACE
      ?auto_14125 - HOIST
      ?auto_14126 - SURFACE
      ?auto_14123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14121 ?auto_14122 ) ( SURFACE-AT ?auto_14119 ?auto_14122 ) ( CLEAR ?auto_14119 ) ( IS-CRATE ?auto_14120 ) ( AVAILABLE ?auto_14121 ) ( not ( = ?auto_14124 ?auto_14122 ) ) ( HOIST-AT ?auto_14125 ?auto_14124 ) ( AVAILABLE ?auto_14125 ) ( SURFACE-AT ?auto_14120 ?auto_14124 ) ( ON ?auto_14120 ?auto_14126 ) ( CLEAR ?auto_14120 ) ( TRUCK-AT ?auto_14123 ?auto_14122 ) ( not ( = ?auto_14119 ?auto_14120 ) ) ( not ( = ?auto_14119 ?auto_14126 ) ) ( not ( = ?auto_14120 ?auto_14126 ) ) ( not ( = ?auto_14121 ?auto_14125 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14123 ?auto_14122 ?auto_14124 )
      ( !LIFT ?auto_14125 ?auto_14120 ?auto_14126 ?auto_14124 )
      ( !LOAD ?auto_14125 ?auto_14120 ?auto_14123 ?auto_14124 )
      ( !DRIVE ?auto_14123 ?auto_14124 ?auto_14122 )
      ( !UNLOAD ?auto_14121 ?auto_14120 ?auto_14123 ?auto_14122 )
      ( !DROP ?auto_14121 ?auto_14120 ?auto_14119 ?auto_14122 )
      ( MAKE-1CRATE-VERIFY ?auto_14119 ?auto_14120 ) )
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
      ?auto_14141 - HOIST
      ?auto_14142 - PLACE
      ?auto_14140 - PLACE
      ?auto_14139 - HOIST
      ?auto_14137 - SURFACE
      ?auto_14144 - PLACE
      ?auto_14145 - HOIST
      ?auto_14143 - SURFACE
      ?auto_14149 - PLACE
      ?auto_14148 - HOIST
      ?auto_14147 - SURFACE
      ?auto_14146 - SURFACE
      ?auto_14138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14141 ?auto_14142 ) ( IS-CRATE ?auto_14136 ) ( not ( = ?auto_14140 ?auto_14142 ) ) ( HOIST-AT ?auto_14139 ?auto_14140 ) ( AVAILABLE ?auto_14139 ) ( SURFACE-AT ?auto_14136 ?auto_14140 ) ( ON ?auto_14136 ?auto_14137 ) ( CLEAR ?auto_14136 ) ( not ( = ?auto_14135 ?auto_14136 ) ) ( not ( = ?auto_14135 ?auto_14137 ) ) ( not ( = ?auto_14136 ?auto_14137 ) ) ( not ( = ?auto_14141 ?auto_14139 ) ) ( IS-CRATE ?auto_14135 ) ( not ( = ?auto_14144 ?auto_14142 ) ) ( HOIST-AT ?auto_14145 ?auto_14144 ) ( AVAILABLE ?auto_14145 ) ( SURFACE-AT ?auto_14135 ?auto_14144 ) ( ON ?auto_14135 ?auto_14143 ) ( CLEAR ?auto_14135 ) ( not ( = ?auto_14134 ?auto_14135 ) ) ( not ( = ?auto_14134 ?auto_14143 ) ) ( not ( = ?auto_14135 ?auto_14143 ) ) ( not ( = ?auto_14141 ?auto_14145 ) ) ( IS-CRATE ?auto_14134 ) ( not ( = ?auto_14149 ?auto_14142 ) ) ( HOIST-AT ?auto_14148 ?auto_14149 ) ( SURFACE-AT ?auto_14134 ?auto_14149 ) ( ON ?auto_14134 ?auto_14147 ) ( CLEAR ?auto_14134 ) ( not ( = ?auto_14133 ?auto_14134 ) ) ( not ( = ?auto_14133 ?auto_14147 ) ) ( not ( = ?auto_14134 ?auto_14147 ) ) ( not ( = ?auto_14141 ?auto_14148 ) ) ( SURFACE-AT ?auto_14132 ?auto_14142 ) ( CLEAR ?auto_14132 ) ( IS-CRATE ?auto_14133 ) ( AVAILABLE ?auto_14141 ) ( AVAILABLE ?auto_14148 ) ( SURFACE-AT ?auto_14133 ?auto_14149 ) ( ON ?auto_14133 ?auto_14146 ) ( CLEAR ?auto_14133 ) ( TRUCK-AT ?auto_14138 ?auto_14142 ) ( not ( = ?auto_14132 ?auto_14133 ) ) ( not ( = ?auto_14132 ?auto_14146 ) ) ( not ( = ?auto_14133 ?auto_14146 ) ) ( not ( = ?auto_14132 ?auto_14134 ) ) ( not ( = ?auto_14132 ?auto_14147 ) ) ( not ( = ?auto_14134 ?auto_14146 ) ) ( not ( = ?auto_14147 ?auto_14146 ) ) ( not ( = ?auto_14132 ?auto_14135 ) ) ( not ( = ?auto_14132 ?auto_14143 ) ) ( not ( = ?auto_14133 ?auto_14135 ) ) ( not ( = ?auto_14133 ?auto_14143 ) ) ( not ( = ?auto_14135 ?auto_14147 ) ) ( not ( = ?auto_14135 ?auto_14146 ) ) ( not ( = ?auto_14144 ?auto_14149 ) ) ( not ( = ?auto_14145 ?auto_14148 ) ) ( not ( = ?auto_14143 ?auto_14147 ) ) ( not ( = ?auto_14143 ?auto_14146 ) ) ( not ( = ?auto_14132 ?auto_14136 ) ) ( not ( = ?auto_14132 ?auto_14137 ) ) ( not ( = ?auto_14133 ?auto_14136 ) ) ( not ( = ?auto_14133 ?auto_14137 ) ) ( not ( = ?auto_14134 ?auto_14136 ) ) ( not ( = ?auto_14134 ?auto_14137 ) ) ( not ( = ?auto_14136 ?auto_14143 ) ) ( not ( = ?auto_14136 ?auto_14147 ) ) ( not ( = ?auto_14136 ?auto_14146 ) ) ( not ( = ?auto_14140 ?auto_14144 ) ) ( not ( = ?auto_14140 ?auto_14149 ) ) ( not ( = ?auto_14139 ?auto_14145 ) ) ( not ( = ?auto_14139 ?auto_14148 ) ) ( not ( = ?auto_14137 ?auto_14143 ) ) ( not ( = ?auto_14137 ?auto_14147 ) ) ( not ( = ?auto_14137 ?auto_14146 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_14132 ?auto_14133 ?auto_14134 ?auto_14135 )
      ( MAKE-1CRATE ?auto_14135 ?auto_14136 )
      ( MAKE-4CRATE-VERIFY ?auto_14132 ?auto_14133 ?auto_14134 ?auto_14135 ?auto_14136 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14152 - SURFACE
      ?auto_14153 - SURFACE
    )
    :vars
    (
      ?auto_14154 - HOIST
      ?auto_14155 - PLACE
      ?auto_14157 - PLACE
      ?auto_14158 - HOIST
      ?auto_14159 - SURFACE
      ?auto_14156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14154 ?auto_14155 ) ( SURFACE-AT ?auto_14152 ?auto_14155 ) ( CLEAR ?auto_14152 ) ( IS-CRATE ?auto_14153 ) ( AVAILABLE ?auto_14154 ) ( not ( = ?auto_14157 ?auto_14155 ) ) ( HOIST-AT ?auto_14158 ?auto_14157 ) ( AVAILABLE ?auto_14158 ) ( SURFACE-AT ?auto_14153 ?auto_14157 ) ( ON ?auto_14153 ?auto_14159 ) ( CLEAR ?auto_14153 ) ( TRUCK-AT ?auto_14156 ?auto_14155 ) ( not ( = ?auto_14152 ?auto_14153 ) ) ( not ( = ?auto_14152 ?auto_14159 ) ) ( not ( = ?auto_14153 ?auto_14159 ) ) ( not ( = ?auto_14154 ?auto_14158 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14156 ?auto_14155 ?auto_14157 )
      ( !LIFT ?auto_14158 ?auto_14153 ?auto_14159 ?auto_14157 )
      ( !LOAD ?auto_14158 ?auto_14153 ?auto_14156 ?auto_14157 )
      ( !DRIVE ?auto_14156 ?auto_14157 ?auto_14155 )
      ( !UNLOAD ?auto_14154 ?auto_14153 ?auto_14156 ?auto_14155 )
      ( !DROP ?auto_14154 ?auto_14153 ?auto_14152 ?auto_14155 )
      ( MAKE-1CRATE-VERIFY ?auto_14152 ?auto_14153 ) )
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
      ?auto_14176 - HOIST
      ?auto_14172 - PLACE
      ?auto_14174 - PLACE
      ?auto_14173 - HOIST
      ?auto_14175 - SURFACE
      ?auto_14179 - PLACE
      ?auto_14187 - HOIST
      ?auto_14182 - SURFACE
      ?auto_14183 - PLACE
      ?auto_14180 - HOIST
      ?auto_14178 - SURFACE
      ?auto_14181 - PLACE
      ?auto_14186 - HOIST
      ?auto_14185 - SURFACE
      ?auto_14184 - SURFACE
      ?auto_14177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14176 ?auto_14172 ) ( IS-CRATE ?auto_14171 ) ( not ( = ?auto_14174 ?auto_14172 ) ) ( HOIST-AT ?auto_14173 ?auto_14174 ) ( AVAILABLE ?auto_14173 ) ( SURFACE-AT ?auto_14171 ?auto_14174 ) ( ON ?auto_14171 ?auto_14175 ) ( CLEAR ?auto_14171 ) ( not ( = ?auto_14170 ?auto_14171 ) ) ( not ( = ?auto_14170 ?auto_14175 ) ) ( not ( = ?auto_14171 ?auto_14175 ) ) ( not ( = ?auto_14176 ?auto_14173 ) ) ( IS-CRATE ?auto_14170 ) ( not ( = ?auto_14179 ?auto_14172 ) ) ( HOIST-AT ?auto_14187 ?auto_14179 ) ( AVAILABLE ?auto_14187 ) ( SURFACE-AT ?auto_14170 ?auto_14179 ) ( ON ?auto_14170 ?auto_14182 ) ( CLEAR ?auto_14170 ) ( not ( = ?auto_14169 ?auto_14170 ) ) ( not ( = ?auto_14169 ?auto_14182 ) ) ( not ( = ?auto_14170 ?auto_14182 ) ) ( not ( = ?auto_14176 ?auto_14187 ) ) ( IS-CRATE ?auto_14169 ) ( not ( = ?auto_14183 ?auto_14172 ) ) ( HOIST-AT ?auto_14180 ?auto_14183 ) ( AVAILABLE ?auto_14180 ) ( SURFACE-AT ?auto_14169 ?auto_14183 ) ( ON ?auto_14169 ?auto_14178 ) ( CLEAR ?auto_14169 ) ( not ( = ?auto_14168 ?auto_14169 ) ) ( not ( = ?auto_14168 ?auto_14178 ) ) ( not ( = ?auto_14169 ?auto_14178 ) ) ( not ( = ?auto_14176 ?auto_14180 ) ) ( IS-CRATE ?auto_14168 ) ( not ( = ?auto_14181 ?auto_14172 ) ) ( HOIST-AT ?auto_14186 ?auto_14181 ) ( SURFACE-AT ?auto_14168 ?auto_14181 ) ( ON ?auto_14168 ?auto_14185 ) ( CLEAR ?auto_14168 ) ( not ( = ?auto_14167 ?auto_14168 ) ) ( not ( = ?auto_14167 ?auto_14185 ) ) ( not ( = ?auto_14168 ?auto_14185 ) ) ( not ( = ?auto_14176 ?auto_14186 ) ) ( SURFACE-AT ?auto_14166 ?auto_14172 ) ( CLEAR ?auto_14166 ) ( IS-CRATE ?auto_14167 ) ( AVAILABLE ?auto_14176 ) ( AVAILABLE ?auto_14186 ) ( SURFACE-AT ?auto_14167 ?auto_14181 ) ( ON ?auto_14167 ?auto_14184 ) ( CLEAR ?auto_14167 ) ( TRUCK-AT ?auto_14177 ?auto_14172 ) ( not ( = ?auto_14166 ?auto_14167 ) ) ( not ( = ?auto_14166 ?auto_14184 ) ) ( not ( = ?auto_14167 ?auto_14184 ) ) ( not ( = ?auto_14166 ?auto_14168 ) ) ( not ( = ?auto_14166 ?auto_14185 ) ) ( not ( = ?auto_14168 ?auto_14184 ) ) ( not ( = ?auto_14185 ?auto_14184 ) ) ( not ( = ?auto_14166 ?auto_14169 ) ) ( not ( = ?auto_14166 ?auto_14178 ) ) ( not ( = ?auto_14167 ?auto_14169 ) ) ( not ( = ?auto_14167 ?auto_14178 ) ) ( not ( = ?auto_14169 ?auto_14185 ) ) ( not ( = ?auto_14169 ?auto_14184 ) ) ( not ( = ?auto_14183 ?auto_14181 ) ) ( not ( = ?auto_14180 ?auto_14186 ) ) ( not ( = ?auto_14178 ?auto_14185 ) ) ( not ( = ?auto_14178 ?auto_14184 ) ) ( not ( = ?auto_14166 ?auto_14170 ) ) ( not ( = ?auto_14166 ?auto_14182 ) ) ( not ( = ?auto_14167 ?auto_14170 ) ) ( not ( = ?auto_14167 ?auto_14182 ) ) ( not ( = ?auto_14168 ?auto_14170 ) ) ( not ( = ?auto_14168 ?auto_14182 ) ) ( not ( = ?auto_14170 ?auto_14178 ) ) ( not ( = ?auto_14170 ?auto_14185 ) ) ( not ( = ?auto_14170 ?auto_14184 ) ) ( not ( = ?auto_14179 ?auto_14183 ) ) ( not ( = ?auto_14179 ?auto_14181 ) ) ( not ( = ?auto_14187 ?auto_14180 ) ) ( not ( = ?auto_14187 ?auto_14186 ) ) ( not ( = ?auto_14182 ?auto_14178 ) ) ( not ( = ?auto_14182 ?auto_14185 ) ) ( not ( = ?auto_14182 ?auto_14184 ) ) ( not ( = ?auto_14166 ?auto_14171 ) ) ( not ( = ?auto_14166 ?auto_14175 ) ) ( not ( = ?auto_14167 ?auto_14171 ) ) ( not ( = ?auto_14167 ?auto_14175 ) ) ( not ( = ?auto_14168 ?auto_14171 ) ) ( not ( = ?auto_14168 ?auto_14175 ) ) ( not ( = ?auto_14169 ?auto_14171 ) ) ( not ( = ?auto_14169 ?auto_14175 ) ) ( not ( = ?auto_14171 ?auto_14182 ) ) ( not ( = ?auto_14171 ?auto_14178 ) ) ( not ( = ?auto_14171 ?auto_14185 ) ) ( not ( = ?auto_14171 ?auto_14184 ) ) ( not ( = ?auto_14174 ?auto_14179 ) ) ( not ( = ?auto_14174 ?auto_14183 ) ) ( not ( = ?auto_14174 ?auto_14181 ) ) ( not ( = ?auto_14173 ?auto_14187 ) ) ( not ( = ?auto_14173 ?auto_14180 ) ) ( not ( = ?auto_14173 ?auto_14186 ) ) ( not ( = ?auto_14175 ?auto_14182 ) ) ( not ( = ?auto_14175 ?auto_14178 ) ) ( not ( = ?auto_14175 ?auto_14185 ) ) ( not ( = ?auto_14175 ?auto_14184 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_14166 ?auto_14167 ?auto_14168 ?auto_14169 ?auto_14170 )
      ( MAKE-1CRATE ?auto_14170 ?auto_14171 )
      ( MAKE-5CRATE-VERIFY ?auto_14166 ?auto_14167 ?auto_14168 ?auto_14169 ?auto_14170 ?auto_14171 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14190 - SURFACE
      ?auto_14191 - SURFACE
    )
    :vars
    (
      ?auto_14192 - HOIST
      ?auto_14193 - PLACE
      ?auto_14195 - PLACE
      ?auto_14196 - HOIST
      ?auto_14197 - SURFACE
      ?auto_14194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14192 ?auto_14193 ) ( SURFACE-AT ?auto_14190 ?auto_14193 ) ( CLEAR ?auto_14190 ) ( IS-CRATE ?auto_14191 ) ( AVAILABLE ?auto_14192 ) ( not ( = ?auto_14195 ?auto_14193 ) ) ( HOIST-AT ?auto_14196 ?auto_14195 ) ( AVAILABLE ?auto_14196 ) ( SURFACE-AT ?auto_14191 ?auto_14195 ) ( ON ?auto_14191 ?auto_14197 ) ( CLEAR ?auto_14191 ) ( TRUCK-AT ?auto_14194 ?auto_14193 ) ( not ( = ?auto_14190 ?auto_14191 ) ) ( not ( = ?auto_14190 ?auto_14197 ) ) ( not ( = ?auto_14191 ?auto_14197 ) ) ( not ( = ?auto_14192 ?auto_14196 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14194 ?auto_14193 ?auto_14195 )
      ( !LIFT ?auto_14196 ?auto_14191 ?auto_14197 ?auto_14195 )
      ( !LOAD ?auto_14196 ?auto_14191 ?auto_14194 ?auto_14195 )
      ( !DRIVE ?auto_14194 ?auto_14195 ?auto_14193 )
      ( !UNLOAD ?auto_14192 ?auto_14191 ?auto_14194 ?auto_14193 )
      ( !DROP ?auto_14192 ?auto_14191 ?auto_14190 ?auto_14193 )
      ( MAKE-1CRATE-VERIFY ?auto_14190 ?auto_14191 ) )
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
      ?auto_14217 - HOIST
      ?auto_14213 - PLACE
      ?auto_14216 - PLACE
      ?auto_14212 - HOIST
      ?auto_14214 - SURFACE
      ?auto_14223 - PLACE
      ?auto_14219 - HOIST
      ?auto_14218 - SURFACE
      ?auto_14228 - PLACE
      ?auto_14220 - HOIST
      ?auto_14226 - SURFACE
      ?auto_14224 - PLACE
      ?auto_14221 - HOIST
      ?auto_14227 - SURFACE
      ?auto_14225 - PLACE
      ?auto_14222 - HOIST
      ?auto_14229 - SURFACE
      ?auto_14230 - SURFACE
      ?auto_14215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14217 ?auto_14213 ) ( IS-CRATE ?auto_14211 ) ( not ( = ?auto_14216 ?auto_14213 ) ) ( HOIST-AT ?auto_14212 ?auto_14216 ) ( AVAILABLE ?auto_14212 ) ( SURFACE-AT ?auto_14211 ?auto_14216 ) ( ON ?auto_14211 ?auto_14214 ) ( CLEAR ?auto_14211 ) ( not ( = ?auto_14210 ?auto_14211 ) ) ( not ( = ?auto_14210 ?auto_14214 ) ) ( not ( = ?auto_14211 ?auto_14214 ) ) ( not ( = ?auto_14217 ?auto_14212 ) ) ( IS-CRATE ?auto_14210 ) ( not ( = ?auto_14223 ?auto_14213 ) ) ( HOIST-AT ?auto_14219 ?auto_14223 ) ( AVAILABLE ?auto_14219 ) ( SURFACE-AT ?auto_14210 ?auto_14223 ) ( ON ?auto_14210 ?auto_14218 ) ( CLEAR ?auto_14210 ) ( not ( = ?auto_14209 ?auto_14210 ) ) ( not ( = ?auto_14209 ?auto_14218 ) ) ( not ( = ?auto_14210 ?auto_14218 ) ) ( not ( = ?auto_14217 ?auto_14219 ) ) ( IS-CRATE ?auto_14209 ) ( not ( = ?auto_14228 ?auto_14213 ) ) ( HOIST-AT ?auto_14220 ?auto_14228 ) ( AVAILABLE ?auto_14220 ) ( SURFACE-AT ?auto_14209 ?auto_14228 ) ( ON ?auto_14209 ?auto_14226 ) ( CLEAR ?auto_14209 ) ( not ( = ?auto_14208 ?auto_14209 ) ) ( not ( = ?auto_14208 ?auto_14226 ) ) ( not ( = ?auto_14209 ?auto_14226 ) ) ( not ( = ?auto_14217 ?auto_14220 ) ) ( IS-CRATE ?auto_14208 ) ( not ( = ?auto_14224 ?auto_14213 ) ) ( HOIST-AT ?auto_14221 ?auto_14224 ) ( AVAILABLE ?auto_14221 ) ( SURFACE-AT ?auto_14208 ?auto_14224 ) ( ON ?auto_14208 ?auto_14227 ) ( CLEAR ?auto_14208 ) ( not ( = ?auto_14207 ?auto_14208 ) ) ( not ( = ?auto_14207 ?auto_14227 ) ) ( not ( = ?auto_14208 ?auto_14227 ) ) ( not ( = ?auto_14217 ?auto_14221 ) ) ( IS-CRATE ?auto_14207 ) ( not ( = ?auto_14225 ?auto_14213 ) ) ( HOIST-AT ?auto_14222 ?auto_14225 ) ( SURFACE-AT ?auto_14207 ?auto_14225 ) ( ON ?auto_14207 ?auto_14229 ) ( CLEAR ?auto_14207 ) ( not ( = ?auto_14206 ?auto_14207 ) ) ( not ( = ?auto_14206 ?auto_14229 ) ) ( not ( = ?auto_14207 ?auto_14229 ) ) ( not ( = ?auto_14217 ?auto_14222 ) ) ( SURFACE-AT ?auto_14205 ?auto_14213 ) ( CLEAR ?auto_14205 ) ( IS-CRATE ?auto_14206 ) ( AVAILABLE ?auto_14217 ) ( AVAILABLE ?auto_14222 ) ( SURFACE-AT ?auto_14206 ?auto_14225 ) ( ON ?auto_14206 ?auto_14230 ) ( CLEAR ?auto_14206 ) ( TRUCK-AT ?auto_14215 ?auto_14213 ) ( not ( = ?auto_14205 ?auto_14206 ) ) ( not ( = ?auto_14205 ?auto_14230 ) ) ( not ( = ?auto_14206 ?auto_14230 ) ) ( not ( = ?auto_14205 ?auto_14207 ) ) ( not ( = ?auto_14205 ?auto_14229 ) ) ( not ( = ?auto_14207 ?auto_14230 ) ) ( not ( = ?auto_14229 ?auto_14230 ) ) ( not ( = ?auto_14205 ?auto_14208 ) ) ( not ( = ?auto_14205 ?auto_14227 ) ) ( not ( = ?auto_14206 ?auto_14208 ) ) ( not ( = ?auto_14206 ?auto_14227 ) ) ( not ( = ?auto_14208 ?auto_14229 ) ) ( not ( = ?auto_14208 ?auto_14230 ) ) ( not ( = ?auto_14224 ?auto_14225 ) ) ( not ( = ?auto_14221 ?auto_14222 ) ) ( not ( = ?auto_14227 ?auto_14229 ) ) ( not ( = ?auto_14227 ?auto_14230 ) ) ( not ( = ?auto_14205 ?auto_14209 ) ) ( not ( = ?auto_14205 ?auto_14226 ) ) ( not ( = ?auto_14206 ?auto_14209 ) ) ( not ( = ?auto_14206 ?auto_14226 ) ) ( not ( = ?auto_14207 ?auto_14209 ) ) ( not ( = ?auto_14207 ?auto_14226 ) ) ( not ( = ?auto_14209 ?auto_14227 ) ) ( not ( = ?auto_14209 ?auto_14229 ) ) ( not ( = ?auto_14209 ?auto_14230 ) ) ( not ( = ?auto_14228 ?auto_14224 ) ) ( not ( = ?auto_14228 ?auto_14225 ) ) ( not ( = ?auto_14220 ?auto_14221 ) ) ( not ( = ?auto_14220 ?auto_14222 ) ) ( not ( = ?auto_14226 ?auto_14227 ) ) ( not ( = ?auto_14226 ?auto_14229 ) ) ( not ( = ?auto_14226 ?auto_14230 ) ) ( not ( = ?auto_14205 ?auto_14210 ) ) ( not ( = ?auto_14205 ?auto_14218 ) ) ( not ( = ?auto_14206 ?auto_14210 ) ) ( not ( = ?auto_14206 ?auto_14218 ) ) ( not ( = ?auto_14207 ?auto_14210 ) ) ( not ( = ?auto_14207 ?auto_14218 ) ) ( not ( = ?auto_14208 ?auto_14210 ) ) ( not ( = ?auto_14208 ?auto_14218 ) ) ( not ( = ?auto_14210 ?auto_14226 ) ) ( not ( = ?auto_14210 ?auto_14227 ) ) ( not ( = ?auto_14210 ?auto_14229 ) ) ( not ( = ?auto_14210 ?auto_14230 ) ) ( not ( = ?auto_14223 ?auto_14228 ) ) ( not ( = ?auto_14223 ?auto_14224 ) ) ( not ( = ?auto_14223 ?auto_14225 ) ) ( not ( = ?auto_14219 ?auto_14220 ) ) ( not ( = ?auto_14219 ?auto_14221 ) ) ( not ( = ?auto_14219 ?auto_14222 ) ) ( not ( = ?auto_14218 ?auto_14226 ) ) ( not ( = ?auto_14218 ?auto_14227 ) ) ( not ( = ?auto_14218 ?auto_14229 ) ) ( not ( = ?auto_14218 ?auto_14230 ) ) ( not ( = ?auto_14205 ?auto_14211 ) ) ( not ( = ?auto_14205 ?auto_14214 ) ) ( not ( = ?auto_14206 ?auto_14211 ) ) ( not ( = ?auto_14206 ?auto_14214 ) ) ( not ( = ?auto_14207 ?auto_14211 ) ) ( not ( = ?auto_14207 ?auto_14214 ) ) ( not ( = ?auto_14208 ?auto_14211 ) ) ( not ( = ?auto_14208 ?auto_14214 ) ) ( not ( = ?auto_14209 ?auto_14211 ) ) ( not ( = ?auto_14209 ?auto_14214 ) ) ( not ( = ?auto_14211 ?auto_14218 ) ) ( not ( = ?auto_14211 ?auto_14226 ) ) ( not ( = ?auto_14211 ?auto_14227 ) ) ( not ( = ?auto_14211 ?auto_14229 ) ) ( not ( = ?auto_14211 ?auto_14230 ) ) ( not ( = ?auto_14216 ?auto_14223 ) ) ( not ( = ?auto_14216 ?auto_14228 ) ) ( not ( = ?auto_14216 ?auto_14224 ) ) ( not ( = ?auto_14216 ?auto_14225 ) ) ( not ( = ?auto_14212 ?auto_14219 ) ) ( not ( = ?auto_14212 ?auto_14220 ) ) ( not ( = ?auto_14212 ?auto_14221 ) ) ( not ( = ?auto_14212 ?auto_14222 ) ) ( not ( = ?auto_14214 ?auto_14218 ) ) ( not ( = ?auto_14214 ?auto_14226 ) ) ( not ( = ?auto_14214 ?auto_14227 ) ) ( not ( = ?auto_14214 ?auto_14229 ) ) ( not ( = ?auto_14214 ?auto_14230 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_14205 ?auto_14206 ?auto_14207 ?auto_14208 ?auto_14209 ?auto_14210 )
      ( MAKE-1CRATE ?auto_14210 ?auto_14211 )
      ( MAKE-6CRATE-VERIFY ?auto_14205 ?auto_14206 ?auto_14207 ?auto_14208 ?auto_14209 ?auto_14210 ?auto_14211 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14233 - SURFACE
      ?auto_14234 - SURFACE
    )
    :vars
    (
      ?auto_14235 - HOIST
      ?auto_14236 - PLACE
      ?auto_14238 - PLACE
      ?auto_14239 - HOIST
      ?auto_14240 - SURFACE
      ?auto_14237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14235 ?auto_14236 ) ( SURFACE-AT ?auto_14233 ?auto_14236 ) ( CLEAR ?auto_14233 ) ( IS-CRATE ?auto_14234 ) ( AVAILABLE ?auto_14235 ) ( not ( = ?auto_14238 ?auto_14236 ) ) ( HOIST-AT ?auto_14239 ?auto_14238 ) ( AVAILABLE ?auto_14239 ) ( SURFACE-AT ?auto_14234 ?auto_14238 ) ( ON ?auto_14234 ?auto_14240 ) ( CLEAR ?auto_14234 ) ( TRUCK-AT ?auto_14237 ?auto_14236 ) ( not ( = ?auto_14233 ?auto_14234 ) ) ( not ( = ?auto_14233 ?auto_14240 ) ) ( not ( = ?auto_14234 ?auto_14240 ) ) ( not ( = ?auto_14235 ?auto_14239 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14237 ?auto_14236 ?auto_14238 )
      ( !LIFT ?auto_14239 ?auto_14234 ?auto_14240 ?auto_14238 )
      ( !LOAD ?auto_14239 ?auto_14234 ?auto_14237 ?auto_14238 )
      ( !DRIVE ?auto_14237 ?auto_14238 ?auto_14236 )
      ( !UNLOAD ?auto_14235 ?auto_14234 ?auto_14237 ?auto_14236 )
      ( !DROP ?auto_14235 ?auto_14234 ?auto_14233 ?auto_14236 )
      ( MAKE-1CRATE-VERIFY ?auto_14233 ?auto_14234 ) )
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
      ?auto_14256 - SURFACE
      ?auto_14255 - SURFACE
    )
    :vars
    (
      ?auto_14260 - HOIST
      ?auto_14259 - PLACE
      ?auto_14258 - PLACE
      ?auto_14262 - HOIST
      ?auto_14257 - SURFACE
      ?auto_14263 - PLACE
      ?auto_14271 - HOIST
      ?auto_14272 - SURFACE
      ?auto_14269 - PLACE
      ?auto_14273 - HOIST
      ?auto_14264 - SURFACE
      ?auto_14266 - PLACE
      ?auto_14275 - HOIST
      ?auto_14265 - SURFACE
      ?auto_14268 - PLACE
      ?auto_14274 - HOIST
      ?auto_14267 - SURFACE
      ?auto_14278 - PLACE
      ?auto_14270 - HOIST
      ?auto_14276 - SURFACE
      ?auto_14277 - SURFACE
      ?auto_14261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14260 ?auto_14259 ) ( IS-CRATE ?auto_14255 ) ( not ( = ?auto_14258 ?auto_14259 ) ) ( HOIST-AT ?auto_14262 ?auto_14258 ) ( AVAILABLE ?auto_14262 ) ( SURFACE-AT ?auto_14255 ?auto_14258 ) ( ON ?auto_14255 ?auto_14257 ) ( CLEAR ?auto_14255 ) ( not ( = ?auto_14256 ?auto_14255 ) ) ( not ( = ?auto_14256 ?auto_14257 ) ) ( not ( = ?auto_14255 ?auto_14257 ) ) ( not ( = ?auto_14260 ?auto_14262 ) ) ( IS-CRATE ?auto_14256 ) ( not ( = ?auto_14263 ?auto_14259 ) ) ( HOIST-AT ?auto_14271 ?auto_14263 ) ( AVAILABLE ?auto_14271 ) ( SURFACE-AT ?auto_14256 ?auto_14263 ) ( ON ?auto_14256 ?auto_14272 ) ( CLEAR ?auto_14256 ) ( not ( = ?auto_14254 ?auto_14256 ) ) ( not ( = ?auto_14254 ?auto_14272 ) ) ( not ( = ?auto_14256 ?auto_14272 ) ) ( not ( = ?auto_14260 ?auto_14271 ) ) ( IS-CRATE ?auto_14254 ) ( not ( = ?auto_14269 ?auto_14259 ) ) ( HOIST-AT ?auto_14273 ?auto_14269 ) ( AVAILABLE ?auto_14273 ) ( SURFACE-AT ?auto_14254 ?auto_14269 ) ( ON ?auto_14254 ?auto_14264 ) ( CLEAR ?auto_14254 ) ( not ( = ?auto_14253 ?auto_14254 ) ) ( not ( = ?auto_14253 ?auto_14264 ) ) ( not ( = ?auto_14254 ?auto_14264 ) ) ( not ( = ?auto_14260 ?auto_14273 ) ) ( IS-CRATE ?auto_14253 ) ( not ( = ?auto_14266 ?auto_14259 ) ) ( HOIST-AT ?auto_14275 ?auto_14266 ) ( AVAILABLE ?auto_14275 ) ( SURFACE-AT ?auto_14253 ?auto_14266 ) ( ON ?auto_14253 ?auto_14265 ) ( CLEAR ?auto_14253 ) ( not ( = ?auto_14252 ?auto_14253 ) ) ( not ( = ?auto_14252 ?auto_14265 ) ) ( not ( = ?auto_14253 ?auto_14265 ) ) ( not ( = ?auto_14260 ?auto_14275 ) ) ( IS-CRATE ?auto_14252 ) ( not ( = ?auto_14268 ?auto_14259 ) ) ( HOIST-AT ?auto_14274 ?auto_14268 ) ( AVAILABLE ?auto_14274 ) ( SURFACE-AT ?auto_14252 ?auto_14268 ) ( ON ?auto_14252 ?auto_14267 ) ( CLEAR ?auto_14252 ) ( not ( = ?auto_14251 ?auto_14252 ) ) ( not ( = ?auto_14251 ?auto_14267 ) ) ( not ( = ?auto_14252 ?auto_14267 ) ) ( not ( = ?auto_14260 ?auto_14274 ) ) ( IS-CRATE ?auto_14251 ) ( not ( = ?auto_14278 ?auto_14259 ) ) ( HOIST-AT ?auto_14270 ?auto_14278 ) ( SURFACE-AT ?auto_14251 ?auto_14278 ) ( ON ?auto_14251 ?auto_14276 ) ( CLEAR ?auto_14251 ) ( not ( = ?auto_14250 ?auto_14251 ) ) ( not ( = ?auto_14250 ?auto_14276 ) ) ( not ( = ?auto_14251 ?auto_14276 ) ) ( not ( = ?auto_14260 ?auto_14270 ) ) ( SURFACE-AT ?auto_14249 ?auto_14259 ) ( CLEAR ?auto_14249 ) ( IS-CRATE ?auto_14250 ) ( AVAILABLE ?auto_14260 ) ( AVAILABLE ?auto_14270 ) ( SURFACE-AT ?auto_14250 ?auto_14278 ) ( ON ?auto_14250 ?auto_14277 ) ( CLEAR ?auto_14250 ) ( TRUCK-AT ?auto_14261 ?auto_14259 ) ( not ( = ?auto_14249 ?auto_14250 ) ) ( not ( = ?auto_14249 ?auto_14277 ) ) ( not ( = ?auto_14250 ?auto_14277 ) ) ( not ( = ?auto_14249 ?auto_14251 ) ) ( not ( = ?auto_14249 ?auto_14276 ) ) ( not ( = ?auto_14251 ?auto_14277 ) ) ( not ( = ?auto_14276 ?auto_14277 ) ) ( not ( = ?auto_14249 ?auto_14252 ) ) ( not ( = ?auto_14249 ?auto_14267 ) ) ( not ( = ?auto_14250 ?auto_14252 ) ) ( not ( = ?auto_14250 ?auto_14267 ) ) ( not ( = ?auto_14252 ?auto_14276 ) ) ( not ( = ?auto_14252 ?auto_14277 ) ) ( not ( = ?auto_14268 ?auto_14278 ) ) ( not ( = ?auto_14274 ?auto_14270 ) ) ( not ( = ?auto_14267 ?auto_14276 ) ) ( not ( = ?auto_14267 ?auto_14277 ) ) ( not ( = ?auto_14249 ?auto_14253 ) ) ( not ( = ?auto_14249 ?auto_14265 ) ) ( not ( = ?auto_14250 ?auto_14253 ) ) ( not ( = ?auto_14250 ?auto_14265 ) ) ( not ( = ?auto_14251 ?auto_14253 ) ) ( not ( = ?auto_14251 ?auto_14265 ) ) ( not ( = ?auto_14253 ?auto_14267 ) ) ( not ( = ?auto_14253 ?auto_14276 ) ) ( not ( = ?auto_14253 ?auto_14277 ) ) ( not ( = ?auto_14266 ?auto_14268 ) ) ( not ( = ?auto_14266 ?auto_14278 ) ) ( not ( = ?auto_14275 ?auto_14274 ) ) ( not ( = ?auto_14275 ?auto_14270 ) ) ( not ( = ?auto_14265 ?auto_14267 ) ) ( not ( = ?auto_14265 ?auto_14276 ) ) ( not ( = ?auto_14265 ?auto_14277 ) ) ( not ( = ?auto_14249 ?auto_14254 ) ) ( not ( = ?auto_14249 ?auto_14264 ) ) ( not ( = ?auto_14250 ?auto_14254 ) ) ( not ( = ?auto_14250 ?auto_14264 ) ) ( not ( = ?auto_14251 ?auto_14254 ) ) ( not ( = ?auto_14251 ?auto_14264 ) ) ( not ( = ?auto_14252 ?auto_14254 ) ) ( not ( = ?auto_14252 ?auto_14264 ) ) ( not ( = ?auto_14254 ?auto_14265 ) ) ( not ( = ?auto_14254 ?auto_14267 ) ) ( not ( = ?auto_14254 ?auto_14276 ) ) ( not ( = ?auto_14254 ?auto_14277 ) ) ( not ( = ?auto_14269 ?auto_14266 ) ) ( not ( = ?auto_14269 ?auto_14268 ) ) ( not ( = ?auto_14269 ?auto_14278 ) ) ( not ( = ?auto_14273 ?auto_14275 ) ) ( not ( = ?auto_14273 ?auto_14274 ) ) ( not ( = ?auto_14273 ?auto_14270 ) ) ( not ( = ?auto_14264 ?auto_14265 ) ) ( not ( = ?auto_14264 ?auto_14267 ) ) ( not ( = ?auto_14264 ?auto_14276 ) ) ( not ( = ?auto_14264 ?auto_14277 ) ) ( not ( = ?auto_14249 ?auto_14256 ) ) ( not ( = ?auto_14249 ?auto_14272 ) ) ( not ( = ?auto_14250 ?auto_14256 ) ) ( not ( = ?auto_14250 ?auto_14272 ) ) ( not ( = ?auto_14251 ?auto_14256 ) ) ( not ( = ?auto_14251 ?auto_14272 ) ) ( not ( = ?auto_14252 ?auto_14256 ) ) ( not ( = ?auto_14252 ?auto_14272 ) ) ( not ( = ?auto_14253 ?auto_14256 ) ) ( not ( = ?auto_14253 ?auto_14272 ) ) ( not ( = ?auto_14256 ?auto_14264 ) ) ( not ( = ?auto_14256 ?auto_14265 ) ) ( not ( = ?auto_14256 ?auto_14267 ) ) ( not ( = ?auto_14256 ?auto_14276 ) ) ( not ( = ?auto_14256 ?auto_14277 ) ) ( not ( = ?auto_14263 ?auto_14269 ) ) ( not ( = ?auto_14263 ?auto_14266 ) ) ( not ( = ?auto_14263 ?auto_14268 ) ) ( not ( = ?auto_14263 ?auto_14278 ) ) ( not ( = ?auto_14271 ?auto_14273 ) ) ( not ( = ?auto_14271 ?auto_14275 ) ) ( not ( = ?auto_14271 ?auto_14274 ) ) ( not ( = ?auto_14271 ?auto_14270 ) ) ( not ( = ?auto_14272 ?auto_14264 ) ) ( not ( = ?auto_14272 ?auto_14265 ) ) ( not ( = ?auto_14272 ?auto_14267 ) ) ( not ( = ?auto_14272 ?auto_14276 ) ) ( not ( = ?auto_14272 ?auto_14277 ) ) ( not ( = ?auto_14249 ?auto_14255 ) ) ( not ( = ?auto_14249 ?auto_14257 ) ) ( not ( = ?auto_14250 ?auto_14255 ) ) ( not ( = ?auto_14250 ?auto_14257 ) ) ( not ( = ?auto_14251 ?auto_14255 ) ) ( not ( = ?auto_14251 ?auto_14257 ) ) ( not ( = ?auto_14252 ?auto_14255 ) ) ( not ( = ?auto_14252 ?auto_14257 ) ) ( not ( = ?auto_14253 ?auto_14255 ) ) ( not ( = ?auto_14253 ?auto_14257 ) ) ( not ( = ?auto_14254 ?auto_14255 ) ) ( not ( = ?auto_14254 ?auto_14257 ) ) ( not ( = ?auto_14255 ?auto_14272 ) ) ( not ( = ?auto_14255 ?auto_14264 ) ) ( not ( = ?auto_14255 ?auto_14265 ) ) ( not ( = ?auto_14255 ?auto_14267 ) ) ( not ( = ?auto_14255 ?auto_14276 ) ) ( not ( = ?auto_14255 ?auto_14277 ) ) ( not ( = ?auto_14258 ?auto_14263 ) ) ( not ( = ?auto_14258 ?auto_14269 ) ) ( not ( = ?auto_14258 ?auto_14266 ) ) ( not ( = ?auto_14258 ?auto_14268 ) ) ( not ( = ?auto_14258 ?auto_14278 ) ) ( not ( = ?auto_14262 ?auto_14271 ) ) ( not ( = ?auto_14262 ?auto_14273 ) ) ( not ( = ?auto_14262 ?auto_14275 ) ) ( not ( = ?auto_14262 ?auto_14274 ) ) ( not ( = ?auto_14262 ?auto_14270 ) ) ( not ( = ?auto_14257 ?auto_14272 ) ) ( not ( = ?auto_14257 ?auto_14264 ) ) ( not ( = ?auto_14257 ?auto_14265 ) ) ( not ( = ?auto_14257 ?auto_14267 ) ) ( not ( = ?auto_14257 ?auto_14276 ) ) ( not ( = ?auto_14257 ?auto_14277 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_14249 ?auto_14250 ?auto_14251 ?auto_14252 ?auto_14253 ?auto_14254 ?auto_14256 )
      ( MAKE-1CRATE ?auto_14256 ?auto_14255 )
      ( MAKE-7CRATE-VERIFY ?auto_14249 ?auto_14250 ?auto_14251 ?auto_14252 ?auto_14253 ?auto_14254 ?auto_14256 ?auto_14255 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14281 - SURFACE
      ?auto_14282 - SURFACE
    )
    :vars
    (
      ?auto_14283 - HOIST
      ?auto_14284 - PLACE
      ?auto_14286 - PLACE
      ?auto_14287 - HOIST
      ?auto_14288 - SURFACE
      ?auto_14285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14283 ?auto_14284 ) ( SURFACE-AT ?auto_14281 ?auto_14284 ) ( CLEAR ?auto_14281 ) ( IS-CRATE ?auto_14282 ) ( AVAILABLE ?auto_14283 ) ( not ( = ?auto_14286 ?auto_14284 ) ) ( HOIST-AT ?auto_14287 ?auto_14286 ) ( AVAILABLE ?auto_14287 ) ( SURFACE-AT ?auto_14282 ?auto_14286 ) ( ON ?auto_14282 ?auto_14288 ) ( CLEAR ?auto_14282 ) ( TRUCK-AT ?auto_14285 ?auto_14284 ) ( not ( = ?auto_14281 ?auto_14282 ) ) ( not ( = ?auto_14281 ?auto_14288 ) ) ( not ( = ?auto_14282 ?auto_14288 ) ) ( not ( = ?auto_14283 ?auto_14287 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14285 ?auto_14284 ?auto_14286 )
      ( !LIFT ?auto_14287 ?auto_14282 ?auto_14288 ?auto_14286 )
      ( !LOAD ?auto_14287 ?auto_14282 ?auto_14285 ?auto_14286 )
      ( !DRIVE ?auto_14285 ?auto_14286 ?auto_14284 )
      ( !UNLOAD ?auto_14283 ?auto_14282 ?auto_14285 ?auto_14284 )
      ( !DROP ?auto_14283 ?auto_14282 ?auto_14281 ?auto_14284 )
      ( MAKE-1CRATE-VERIFY ?auto_14281 ?auto_14282 ) )
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
      ?auto_14306 - SURFACE
      ?auto_14305 - SURFACE
      ?auto_14304 - SURFACE
    )
    :vars
    (
      ?auto_14309 - HOIST
      ?auto_14312 - PLACE
      ?auto_14308 - PLACE
      ?auto_14307 - HOIST
      ?auto_14310 - SURFACE
      ?auto_14323 - PLACE
      ?auto_14315 - HOIST
      ?auto_14313 - SURFACE
      ?auto_14329 - PLACE
      ?auto_14316 - HOIST
      ?auto_14325 - SURFACE
      ?auto_14320 - PLACE
      ?auto_14327 - HOIST
      ?auto_14324 - SURFACE
      ?auto_14314 - PLACE
      ?auto_14317 - HOIST
      ?auto_14331 - SURFACE
      ?auto_14321 - PLACE
      ?auto_14326 - HOIST
      ?auto_14322 - SURFACE
      ?auto_14328 - PLACE
      ?auto_14319 - HOIST
      ?auto_14318 - SURFACE
      ?auto_14330 - SURFACE
      ?auto_14311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14309 ?auto_14312 ) ( IS-CRATE ?auto_14304 ) ( not ( = ?auto_14308 ?auto_14312 ) ) ( HOIST-AT ?auto_14307 ?auto_14308 ) ( AVAILABLE ?auto_14307 ) ( SURFACE-AT ?auto_14304 ?auto_14308 ) ( ON ?auto_14304 ?auto_14310 ) ( CLEAR ?auto_14304 ) ( not ( = ?auto_14305 ?auto_14304 ) ) ( not ( = ?auto_14305 ?auto_14310 ) ) ( not ( = ?auto_14304 ?auto_14310 ) ) ( not ( = ?auto_14309 ?auto_14307 ) ) ( IS-CRATE ?auto_14305 ) ( not ( = ?auto_14323 ?auto_14312 ) ) ( HOIST-AT ?auto_14315 ?auto_14323 ) ( AVAILABLE ?auto_14315 ) ( SURFACE-AT ?auto_14305 ?auto_14323 ) ( ON ?auto_14305 ?auto_14313 ) ( CLEAR ?auto_14305 ) ( not ( = ?auto_14306 ?auto_14305 ) ) ( not ( = ?auto_14306 ?auto_14313 ) ) ( not ( = ?auto_14305 ?auto_14313 ) ) ( not ( = ?auto_14309 ?auto_14315 ) ) ( IS-CRATE ?auto_14306 ) ( not ( = ?auto_14329 ?auto_14312 ) ) ( HOIST-AT ?auto_14316 ?auto_14329 ) ( AVAILABLE ?auto_14316 ) ( SURFACE-AT ?auto_14306 ?auto_14329 ) ( ON ?auto_14306 ?auto_14325 ) ( CLEAR ?auto_14306 ) ( not ( = ?auto_14303 ?auto_14306 ) ) ( not ( = ?auto_14303 ?auto_14325 ) ) ( not ( = ?auto_14306 ?auto_14325 ) ) ( not ( = ?auto_14309 ?auto_14316 ) ) ( IS-CRATE ?auto_14303 ) ( not ( = ?auto_14320 ?auto_14312 ) ) ( HOIST-AT ?auto_14327 ?auto_14320 ) ( AVAILABLE ?auto_14327 ) ( SURFACE-AT ?auto_14303 ?auto_14320 ) ( ON ?auto_14303 ?auto_14324 ) ( CLEAR ?auto_14303 ) ( not ( = ?auto_14302 ?auto_14303 ) ) ( not ( = ?auto_14302 ?auto_14324 ) ) ( not ( = ?auto_14303 ?auto_14324 ) ) ( not ( = ?auto_14309 ?auto_14327 ) ) ( IS-CRATE ?auto_14302 ) ( not ( = ?auto_14314 ?auto_14312 ) ) ( HOIST-AT ?auto_14317 ?auto_14314 ) ( AVAILABLE ?auto_14317 ) ( SURFACE-AT ?auto_14302 ?auto_14314 ) ( ON ?auto_14302 ?auto_14331 ) ( CLEAR ?auto_14302 ) ( not ( = ?auto_14301 ?auto_14302 ) ) ( not ( = ?auto_14301 ?auto_14331 ) ) ( not ( = ?auto_14302 ?auto_14331 ) ) ( not ( = ?auto_14309 ?auto_14317 ) ) ( IS-CRATE ?auto_14301 ) ( not ( = ?auto_14321 ?auto_14312 ) ) ( HOIST-AT ?auto_14326 ?auto_14321 ) ( AVAILABLE ?auto_14326 ) ( SURFACE-AT ?auto_14301 ?auto_14321 ) ( ON ?auto_14301 ?auto_14322 ) ( CLEAR ?auto_14301 ) ( not ( = ?auto_14300 ?auto_14301 ) ) ( not ( = ?auto_14300 ?auto_14322 ) ) ( not ( = ?auto_14301 ?auto_14322 ) ) ( not ( = ?auto_14309 ?auto_14326 ) ) ( IS-CRATE ?auto_14300 ) ( not ( = ?auto_14328 ?auto_14312 ) ) ( HOIST-AT ?auto_14319 ?auto_14328 ) ( SURFACE-AT ?auto_14300 ?auto_14328 ) ( ON ?auto_14300 ?auto_14318 ) ( CLEAR ?auto_14300 ) ( not ( = ?auto_14299 ?auto_14300 ) ) ( not ( = ?auto_14299 ?auto_14318 ) ) ( not ( = ?auto_14300 ?auto_14318 ) ) ( not ( = ?auto_14309 ?auto_14319 ) ) ( SURFACE-AT ?auto_14298 ?auto_14312 ) ( CLEAR ?auto_14298 ) ( IS-CRATE ?auto_14299 ) ( AVAILABLE ?auto_14309 ) ( AVAILABLE ?auto_14319 ) ( SURFACE-AT ?auto_14299 ?auto_14328 ) ( ON ?auto_14299 ?auto_14330 ) ( CLEAR ?auto_14299 ) ( TRUCK-AT ?auto_14311 ?auto_14312 ) ( not ( = ?auto_14298 ?auto_14299 ) ) ( not ( = ?auto_14298 ?auto_14330 ) ) ( not ( = ?auto_14299 ?auto_14330 ) ) ( not ( = ?auto_14298 ?auto_14300 ) ) ( not ( = ?auto_14298 ?auto_14318 ) ) ( not ( = ?auto_14300 ?auto_14330 ) ) ( not ( = ?auto_14318 ?auto_14330 ) ) ( not ( = ?auto_14298 ?auto_14301 ) ) ( not ( = ?auto_14298 ?auto_14322 ) ) ( not ( = ?auto_14299 ?auto_14301 ) ) ( not ( = ?auto_14299 ?auto_14322 ) ) ( not ( = ?auto_14301 ?auto_14318 ) ) ( not ( = ?auto_14301 ?auto_14330 ) ) ( not ( = ?auto_14321 ?auto_14328 ) ) ( not ( = ?auto_14326 ?auto_14319 ) ) ( not ( = ?auto_14322 ?auto_14318 ) ) ( not ( = ?auto_14322 ?auto_14330 ) ) ( not ( = ?auto_14298 ?auto_14302 ) ) ( not ( = ?auto_14298 ?auto_14331 ) ) ( not ( = ?auto_14299 ?auto_14302 ) ) ( not ( = ?auto_14299 ?auto_14331 ) ) ( not ( = ?auto_14300 ?auto_14302 ) ) ( not ( = ?auto_14300 ?auto_14331 ) ) ( not ( = ?auto_14302 ?auto_14322 ) ) ( not ( = ?auto_14302 ?auto_14318 ) ) ( not ( = ?auto_14302 ?auto_14330 ) ) ( not ( = ?auto_14314 ?auto_14321 ) ) ( not ( = ?auto_14314 ?auto_14328 ) ) ( not ( = ?auto_14317 ?auto_14326 ) ) ( not ( = ?auto_14317 ?auto_14319 ) ) ( not ( = ?auto_14331 ?auto_14322 ) ) ( not ( = ?auto_14331 ?auto_14318 ) ) ( not ( = ?auto_14331 ?auto_14330 ) ) ( not ( = ?auto_14298 ?auto_14303 ) ) ( not ( = ?auto_14298 ?auto_14324 ) ) ( not ( = ?auto_14299 ?auto_14303 ) ) ( not ( = ?auto_14299 ?auto_14324 ) ) ( not ( = ?auto_14300 ?auto_14303 ) ) ( not ( = ?auto_14300 ?auto_14324 ) ) ( not ( = ?auto_14301 ?auto_14303 ) ) ( not ( = ?auto_14301 ?auto_14324 ) ) ( not ( = ?auto_14303 ?auto_14331 ) ) ( not ( = ?auto_14303 ?auto_14322 ) ) ( not ( = ?auto_14303 ?auto_14318 ) ) ( not ( = ?auto_14303 ?auto_14330 ) ) ( not ( = ?auto_14320 ?auto_14314 ) ) ( not ( = ?auto_14320 ?auto_14321 ) ) ( not ( = ?auto_14320 ?auto_14328 ) ) ( not ( = ?auto_14327 ?auto_14317 ) ) ( not ( = ?auto_14327 ?auto_14326 ) ) ( not ( = ?auto_14327 ?auto_14319 ) ) ( not ( = ?auto_14324 ?auto_14331 ) ) ( not ( = ?auto_14324 ?auto_14322 ) ) ( not ( = ?auto_14324 ?auto_14318 ) ) ( not ( = ?auto_14324 ?auto_14330 ) ) ( not ( = ?auto_14298 ?auto_14306 ) ) ( not ( = ?auto_14298 ?auto_14325 ) ) ( not ( = ?auto_14299 ?auto_14306 ) ) ( not ( = ?auto_14299 ?auto_14325 ) ) ( not ( = ?auto_14300 ?auto_14306 ) ) ( not ( = ?auto_14300 ?auto_14325 ) ) ( not ( = ?auto_14301 ?auto_14306 ) ) ( not ( = ?auto_14301 ?auto_14325 ) ) ( not ( = ?auto_14302 ?auto_14306 ) ) ( not ( = ?auto_14302 ?auto_14325 ) ) ( not ( = ?auto_14306 ?auto_14324 ) ) ( not ( = ?auto_14306 ?auto_14331 ) ) ( not ( = ?auto_14306 ?auto_14322 ) ) ( not ( = ?auto_14306 ?auto_14318 ) ) ( not ( = ?auto_14306 ?auto_14330 ) ) ( not ( = ?auto_14329 ?auto_14320 ) ) ( not ( = ?auto_14329 ?auto_14314 ) ) ( not ( = ?auto_14329 ?auto_14321 ) ) ( not ( = ?auto_14329 ?auto_14328 ) ) ( not ( = ?auto_14316 ?auto_14327 ) ) ( not ( = ?auto_14316 ?auto_14317 ) ) ( not ( = ?auto_14316 ?auto_14326 ) ) ( not ( = ?auto_14316 ?auto_14319 ) ) ( not ( = ?auto_14325 ?auto_14324 ) ) ( not ( = ?auto_14325 ?auto_14331 ) ) ( not ( = ?auto_14325 ?auto_14322 ) ) ( not ( = ?auto_14325 ?auto_14318 ) ) ( not ( = ?auto_14325 ?auto_14330 ) ) ( not ( = ?auto_14298 ?auto_14305 ) ) ( not ( = ?auto_14298 ?auto_14313 ) ) ( not ( = ?auto_14299 ?auto_14305 ) ) ( not ( = ?auto_14299 ?auto_14313 ) ) ( not ( = ?auto_14300 ?auto_14305 ) ) ( not ( = ?auto_14300 ?auto_14313 ) ) ( not ( = ?auto_14301 ?auto_14305 ) ) ( not ( = ?auto_14301 ?auto_14313 ) ) ( not ( = ?auto_14302 ?auto_14305 ) ) ( not ( = ?auto_14302 ?auto_14313 ) ) ( not ( = ?auto_14303 ?auto_14305 ) ) ( not ( = ?auto_14303 ?auto_14313 ) ) ( not ( = ?auto_14305 ?auto_14325 ) ) ( not ( = ?auto_14305 ?auto_14324 ) ) ( not ( = ?auto_14305 ?auto_14331 ) ) ( not ( = ?auto_14305 ?auto_14322 ) ) ( not ( = ?auto_14305 ?auto_14318 ) ) ( not ( = ?auto_14305 ?auto_14330 ) ) ( not ( = ?auto_14323 ?auto_14329 ) ) ( not ( = ?auto_14323 ?auto_14320 ) ) ( not ( = ?auto_14323 ?auto_14314 ) ) ( not ( = ?auto_14323 ?auto_14321 ) ) ( not ( = ?auto_14323 ?auto_14328 ) ) ( not ( = ?auto_14315 ?auto_14316 ) ) ( not ( = ?auto_14315 ?auto_14327 ) ) ( not ( = ?auto_14315 ?auto_14317 ) ) ( not ( = ?auto_14315 ?auto_14326 ) ) ( not ( = ?auto_14315 ?auto_14319 ) ) ( not ( = ?auto_14313 ?auto_14325 ) ) ( not ( = ?auto_14313 ?auto_14324 ) ) ( not ( = ?auto_14313 ?auto_14331 ) ) ( not ( = ?auto_14313 ?auto_14322 ) ) ( not ( = ?auto_14313 ?auto_14318 ) ) ( not ( = ?auto_14313 ?auto_14330 ) ) ( not ( = ?auto_14298 ?auto_14304 ) ) ( not ( = ?auto_14298 ?auto_14310 ) ) ( not ( = ?auto_14299 ?auto_14304 ) ) ( not ( = ?auto_14299 ?auto_14310 ) ) ( not ( = ?auto_14300 ?auto_14304 ) ) ( not ( = ?auto_14300 ?auto_14310 ) ) ( not ( = ?auto_14301 ?auto_14304 ) ) ( not ( = ?auto_14301 ?auto_14310 ) ) ( not ( = ?auto_14302 ?auto_14304 ) ) ( not ( = ?auto_14302 ?auto_14310 ) ) ( not ( = ?auto_14303 ?auto_14304 ) ) ( not ( = ?auto_14303 ?auto_14310 ) ) ( not ( = ?auto_14306 ?auto_14304 ) ) ( not ( = ?auto_14306 ?auto_14310 ) ) ( not ( = ?auto_14304 ?auto_14313 ) ) ( not ( = ?auto_14304 ?auto_14325 ) ) ( not ( = ?auto_14304 ?auto_14324 ) ) ( not ( = ?auto_14304 ?auto_14331 ) ) ( not ( = ?auto_14304 ?auto_14322 ) ) ( not ( = ?auto_14304 ?auto_14318 ) ) ( not ( = ?auto_14304 ?auto_14330 ) ) ( not ( = ?auto_14308 ?auto_14323 ) ) ( not ( = ?auto_14308 ?auto_14329 ) ) ( not ( = ?auto_14308 ?auto_14320 ) ) ( not ( = ?auto_14308 ?auto_14314 ) ) ( not ( = ?auto_14308 ?auto_14321 ) ) ( not ( = ?auto_14308 ?auto_14328 ) ) ( not ( = ?auto_14307 ?auto_14315 ) ) ( not ( = ?auto_14307 ?auto_14316 ) ) ( not ( = ?auto_14307 ?auto_14327 ) ) ( not ( = ?auto_14307 ?auto_14317 ) ) ( not ( = ?auto_14307 ?auto_14326 ) ) ( not ( = ?auto_14307 ?auto_14319 ) ) ( not ( = ?auto_14310 ?auto_14313 ) ) ( not ( = ?auto_14310 ?auto_14325 ) ) ( not ( = ?auto_14310 ?auto_14324 ) ) ( not ( = ?auto_14310 ?auto_14331 ) ) ( not ( = ?auto_14310 ?auto_14322 ) ) ( not ( = ?auto_14310 ?auto_14318 ) ) ( not ( = ?auto_14310 ?auto_14330 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_14298 ?auto_14299 ?auto_14300 ?auto_14301 ?auto_14302 ?auto_14303 ?auto_14306 ?auto_14305 )
      ( MAKE-1CRATE ?auto_14305 ?auto_14304 )
      ( MAKE-8CRATE-VERIFY ?auto_14298 ?auto_14299 ?auto_14300 ?auto_14301 ?auto_14302 ?auto_14303 ?auto_14306 ?auto_14305 ?auto_14304 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14334 - SURFACE
      ?auto_14335 - SURFACE
    )
    :vars
    (
      ?auto_14336 - HOIST
      ?auto_14337 - PLACE
      ?auto_14339 - PLACE
      ?auto_14340 - HOIST
      ?auto_14341 - SURFACE
      ?auto_14338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14336 ?auto_14337 ) ( SURFACE-AT ?auto_14334 ?auto_14337 ) ( CLEAR ?auto_14334 ) ( IS-CRATE ?auto_14335 ) ( AVAILABLE ?auto_14336 ) ( not ( = ?auto_14339 ?auto_14337 ) ) ( HOIST-AT ?auto_14340 ?auto_14339 ) ( AVAILABLE ?auto_14340 ) ( SURFACE-AT ?auto_14335 ?auto_14339 ) ( ON ?auto_14335 ?auto_14341 ) ( CLEAR ?auto_14335 ) ( TRUCK-AT ?auto_14338 ?auto_14337 ) ( not ( = ?auto_14334 ?auto_14335 ) ) ( not ( = ?auto_14334 ?auto_14341 ) ) ( not ( = ?auto_14335 ?auto_14341 ) ) ( not ( = ?auto_14336 ?auto_14340 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14338 ?auto_14337 ?auto_14339 )
      ( !LIFT ?auto_14340 ?auto_14335 ?auto_14341 ?auto_14339 )
      ( !LOAD ?auto_14340 ?auto_14335 ?auto_14338 ?auto_14339 )
      ( !DRIVE ?auto_14338 ?auto_14339 ?auto_14337 )
      ( !UNLOAD ?auto_14336 ?auto_14335 ?auto_14338 ?auto_14337 )
      ( !DROP ?auto_14336 ?auto_14335 ?auto_14334 ?auto_14337 )
      ( MAKE-1CRATE-VERIFY ?auto_14334 ?auto_14335 ) )
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
      ?auto_14360 - SURFACE
      ?auto_14359 - SURFACE
      ?auto_14358 - SURFACE
      ?auto_14361 - SURFACE
    )
    :vars
    (
      ?auto_14362 - HOIST
      ?auto_14363 - PLACE
      ?auto_14364 - PLACE
      ?auto_14366 - HOIST
      ?auto_14365 - SURFACE
      ?auto_14370 - PLACE
      ?auto_14368 - HOIST
      ?auto_14387 - SURFACE
      ?auto_14379 - PLACE
      ?auto_14369 - HOIST
      ?auto_14374 - SURFACE
      ?auto_14375 - PLACE
      ?auto_14372 - HOIST
      ?auto_14382 - SURFACE
      ?auto_14381 - SURFACE
      ?auto_14371 - PLACE
      ?auto_14386 - HOIST
      ?auto_14376 - SURFACE
      ?auto_14378 - PLACE
      ?auto_14383 - HOIST
      ?auto_14380 - SURFACE
      ?auto_14377 - PLACE
      ?auto_14384 - HOIST
      ?auto_14385 - SURFACE
      ?auto_14373 - SURFACE
      ?auto_14367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14362 ?auto_14363 ) ( IS-CRATE ?auto_14361 ) ( not ( = ?auto_14364 ?auto_14363 ) ) ( HOIST-AT ?auto_14366 ?auto_14364 ) ( SURFACE-AT ?auto_14361 ?auto_14364 ) ( ON ?auto_14361 ?auto_14365 ) ( CLEAR ?auto_14361 ) ( not ( = ?auto_14358 ?auto_14361 ) ) ( not ( = ?auto_14358 ?auto_14365 ) ) ( not ( = ?auto_14361 ?auto_14365 ) ) ( not ( = ?auto_14362 ?auto_14366 ) ) ( IS-CRATE ?auto_14358 ) ( not ( = ?auto_14370 ?auto_14363 ) ) ( HOIST-AT ?auto_14368 ?auto_14370 ) ( AVAILABLE ?auto_14368 ) ( SURFACE-AT ?auto_14358 ?auto_14370 ) ( ON ?auto_14358 ?auto_14387 ) ( CLEAR ?auto_14358 ) ( not ( = ?auto_14359 ?auto_14358 ) ) ( not ( = ?auto_14359 ?auto_14387 ) ) ( not ( = ?auto_14358 ?auto_14387 ) ) ( not ( = ?auto_14362 ?auto_14368 ) ) ( IS-CRATE ?auto_14359 ) ( not ( = ?auto_14379 ?auto_14363 ) ) ( HOIST-AT ?auto_14369 ?auto_14379 ) ( AVAILABLE ?auto_14369 ) ( SURFACE-AT ?auto_14359 ?auto_14379 ) ( ON ?auto_14359 ?auto_14374 ) ( CLEAR ?auto_14359 ) ( not ( = ?auto_14360 ?auto_14359 ) ) ( not ( = ?auto_14360 ?auto_14374 ) ) ( not ( = ?auto_14359 ?auto_14374 ) ) ( not ( = ?auto_14362 ?auto_14369 ) ) ( IS-CRATE ?auto_14360 ) ( not ( = ?auto_14375 ?auto_14363 ) ) ( HOIST-AT ?auto_14372 ?auto_14375 ) ( AVAILABLE ?auto_14372 ) ( SURFACE-AT ?auto_14360 ?auto_14375 ) ( ON ?auto_14360 ?auto_14382 ) ( CLEAR ?auto_14360 ) ( not ( = ?auto_14357 ?auto_14360 ) ) ( not ( = ?auto_14357 ?auto_14382 ) ) ( not ( = ?auto_14360 ?auto_14382 ) ) ( not ( = ?auto_14362 ?auto_14372 ) ) ( IS-CRATE ?auto_14357 ) ( AVAILABLE ?auto_14366 ) ( SURFACE-AT ?auto_14357 ?auto_14364 ) ( ON ?auto_14357 ?auto_14381 ) ( CLEAR ?auto_14357 ) ( not ( = ?auto_14356 ?auto_14357 ) ) ( not ( = ?auto_14356 ?auto_14381 ) ) ( not ( = ?auto_14357 ?auto_14381 ) ) ( IS-CRATE ?auto_14356 ) ( not ( = ?auto_14371 ?auto_14363 ) ) ( HOIST-AT ?auto_14386 ?auto_14371 ) ( AVAILABLE ?auto_14386 ) ( SURFACE-AT ?auto_14356 ?auto_14371 ) ( ON ?auto_14356 ?auto_14376 ) ( CLEAR ?auto_14356 ) ( not ( = ?auto_14355 ?auto_14356 ) ) ( not ( = ?auto_14355 ?auto_14376 ) ) ( not ( = ?auto_14356 ?auto_14376 ) ) ( not ( = ?auto_14362 ?auto_14386 ) ) ( IS-CRATE ?auto_14355 ) ( not ( = ?auto_14378 ?auto_14363 ) ) ( HOIST-AT ?auto_14383 ?auto_14378 ) ( AVAILABLE ?auto_14383 ) ( SURFACE-AT ?auto_14355 ?auto_14378 ) ( ON ?auto_14355 ?auto_14380 ) ( CLEAR ?auto_14355 ) ( not ( = ?auto_14354 ?auto_14355 ) ) ( not ( = ?auto_14354 ?auto_14380 ) ) ( not ( = ?auto_14355 ?auto_14380 ) ) ( not ( = ?auto_14362 ?auto_14383 ) ) ( IS-CRATE ?auto_14354 ) ( not ( = ?auto_14377 ?auto_14363 ) ) ( HOIST-AT ?auto_14384 ?auto_14377 ) ( SURFACE-AT ?auto_14354 ?auto_14377 ) ( ON ?auto_14354 ?auto_14385 ) ( CLEAR ?auto_14354 ) ( not ( = ?auto_14353 ?auto_14354 ) ) ( not ( = ?auto_14353 ?auto_14385 ) ) ( not ( = ?auto_14354 ?auto_14385 ) ) ( not ( = ?auto_14362 ?auto_14384 ) ) ( SURFACE-AT ?auto_14352 ?auto_14363 ) ( CLEAR ?auto_14352 ) ( IS-CRATE ?auto_14353 ) ( AVAILABLE ?auto_14362 ) ( AVAILABLE ?auto_14384 ) ( SURFACE-AT ?auto_14353 ?auto_14377 ) ( ON ?auto_14353 ?auto_14373 ) ( CLEAR ?auto_14353 ) ( TRUCK-AT ?auto_14367 ?auto_14363 ) ( not ( = ?auto_14352 ?auto_14353 ) ) ( not ( = ?auto_14352 ?auto_14373 ) ) ( not ( = ?auto_14353 ?auto_14373 ) ) ( not ( = ?auto_14352 ?auto_14354 ) ) ( not ( = ?auto_14352 ?auto_14385 ) ) ( not ( = ?auto_14354 ?auto_14373 ) ) ( not ( = ?auto_14385 ?auto_14373 ) ) ( not ( = ?auto_14352 ?auto_14355 ) ) ( not ( = ?auto_14352 ?auto_14380 ) ) ( not ( = ?auto_14353 ?auto_14355 ) ) ( not ( = ?auto_14353 ?auto_14380 ) ) ( not ( = ?auto_14355 ?auto_14385 ) ) ( not ( = ?auto_14355 ?auto_14373 ) ) ( not ( = ?auto_14378 ?auto_14377 ) ) ( not ( = ?auto_14383 ?auto_14384 ) ) ( not ( = ?auto_14380 ?auto_14385 ) ) ( not ( = ?auto_14380 ?auto_14373 ) ) ( not ( = ?auto_14352 ?auto_14356 ) ) ( not ( = ?auto_14352 ?auto_14376 ) ) ( not ( = ?auto_14353 ?auto_14356 ) ) ( not ( = ?auto_14353 ?auto_14376 ) ) ( not ( = ?auto_14354 ?auto_14356 ) ) ( not ( = ?auto_14354 ?auto_14376 ) ) ( not ( = ?auto_14356 ?auto_14380 ) ) ( not ( = ?auto_14356 ?auto_14385 ) ) ( not ( = ?auto_14356 ?auto_14373 ) ) ( not ( = ?auto_14371 ?auto_14378 ) ) ( not ( = ?auto_14371 ?auto_14377 ) ) ( not ( = ?auto_14386 ?auto_14383 ) ) ( not ( = ?auto_14386 ?auto_14384 ) ) ( not ( = ?auto_14376 ?auto_14380 ) ) ( not ( = ?auto_14376 ?auto_14385 ) ) ( not ( = ?auto_14376 ?auto_14373 ) ) ( not ( = ?auto_14352 ?auto_14357 ) ) ( not ( = ?auto_14352 ?auto_14381 ) ) ( not ( = ?auto_14353 ?auto_14357 ) ) ( not ( = ?auto_14353 ?auto_14381 ) ) ( not ( = ?auto_14354 ?auto_14357 ) ) ( not ( = ?auto_14354 ?auto_14381 ) ) ( not ( = ?auto_14355 ?auto_14357 ) ) ( not ( = ?auto_14355 ?auto_14381 ) ) ( not ( = ?auto_14357 ?auto_14376 ) ) ( not ( = ?auto_14357 ?auto_14380 ) ) ( not ( = ?auto_14357 ?auto_14385 ) ) ( not ( = ?auto_14357 ?auto_14373 ) ) ( not ( = ?auto_14364 ?auto_14371 ) ) ( not ( = ?auto_14364 ?auto_14378 ) ) ( not ( = ?auto_14364 ?auto_14377 ) ) ( not ( = ?auto_14366 ?auto_14386 ) ) ( not ( = ?auto_14366 ?auto_14383 ) ) ( not ( = ?auto_14366 ?auto_14384 ) ) ( not ( = ?auto_14381 ?auto_14376 ) ) ( not ( = ?auto_14381 ?auto_14380 ) ) ( not ( = ?auto_14381 ?auto_14385 ) ) ( not ( = ?auto_14381 ?auto_14373 ) ) ( not ( = ?auto_14352 ?auto_14360 ) ) ( not ( = ?auto_14352 ?auto_14382 ) ) ( not ( = ?auto_14353 ?auto_14360 ) ) ( not ( = ?auto_14353 ?auto_14382 ) ) ( not ( = ?auto_14354 ?auto_14360 ) ) ( not ( = ?auto_14354 ?auto_14382 ) ) ( not ( = ?auto_14355 ?auto_14360 ) ) ( not ( = ?auto_14355 ?auto_14382 ) ) ( not ( = ?auto_14356 ?auto_14360 ) ) ( not ( = ?auto_14356 ?auto_14382 ) ) ( not ( = ?auto_14360 ?auto_14381 ) ) ( not ( = ?auto_14360 ?auto_14376 ) ) ( not ( = ?auto_14360 ?auto_14380 ) ) ( not ( = ?auto_14360 ?auto_14385 ) ) ( not ( = ?auto_14360 ?auto_14373 ) ) ( not ( = ?auto_14375 ?auto_14364 ) ) ( not ( = ?auto_14375 ?auto_14371 ) ) ( not ( = ?auto_14375 ?auto_14378 ) ) ( not ( = ?auto_14375 ?auto_14377 ) ) ( not ( = ?auto_14372 ?auto_14366 ) ) ( not ( = ?auto_14372 ?auto_14386 ) ) ( not ( = ?auto_14372 ?auto_14383 ) ) ( not ( = ?auto_14372 ?auto_14384 ) ) ( not ( = ?auto_14382 ?auto_14381 ) ) ( not ( = ?auto_14382 ?auto_14376 ) ) ( not ( = ?auto_14382 ?auto_14380 ) ) ( not ( = ?auto_14382 ?auto_14385 ) ) ( not ( = ?auto_14382 ?auto_14373 ) ) ( not ( = ?auto_14352 ?auto_14359 ) ) ( not ( = ?auto_14352 ?auto_14374 ) ) ( not ( = ?auto_14353 ?auto_14359 ) ) ( not ( = ?auto_14353 ?auto_14374 ) ) ( not ( = ?auto_14354 ?auto_14359 ) ) ( not ( = ?auto_14354 ?auto_14374 ) ) ( not ( = ?auto_14355 ?auto_14359 ) ) ( not ( = ?auto_14355 ?auto_14374 ) ) ( not ( = ?auto_14356 ?auto_14359 ) ) ( not ( = ?auto_14356 ?auto_14374 ) ) ( not ( = ?auto_14357 ?auto_14359 ) ) ( not ( = ?auto_14357 ?auto_14374 ) ) ( not ( = ?auto_14359 ?auto_14382 ) ) ( not ( = ?auto_14359 ?auto_14381 ) ) ( not ( = ?auto_14359 ?auto_14376 ) ) ( not ( = ?auto_14359 ?auto_14380 ) ) ( not ( = ?auto_14359 ?auto_14385 ) ) ( not ( = ?auto_14359 ?auto_14373 ) ) ( not ( = ?auto_14379 ?auto_14375 ) ) ( not ( = ?auto_14379 ?auto_14364 ) ) ( not ( = ?auto_14379 ?auto_14371 ) ) ( not ( = ?auto_14379 ?auto_14378 ) ) ( not ( = ?auto_14379 ?auto_14377 ) ) ( not ( = ?auto_14369 ?auto_14372 ) ) ( not ( = ?auto_14369 ?auto_14366 ) ) ( not ( = ?auto_14369 ?auto_14386 ) ) ( not ( = ?auto_14369 ?auto_14383 ) ) ( not ( = ?auto_14369 ?auto_14384 ) ) ( not ( = ?auto_14374 ?auto_14382 ) ) ( not ( = ?auto_14374 ?auto_14381 ) ) ( not ( = ?auto_14374 ?auto_14376 ) ) ( not ( = ?auto_14374 ?auto_14380 ) ) ( not ( = ?auto_14374 ?auto_14385 ) ) ( not ( = ?auto_14374 ?auto_14373 ) ) ( not ( = ?auto_14352 ?auto_14358 ) ) ( not ( = ?auto_14352 ?auto_14387 ) ) ( not ( = ?auto_14353 ?auto_14358 ) ) ( not ( = ?auto_14353 ?auto_14387 ) ) ( not ( = ?auto_14354 ?auto_14358 ) ) ( not ( = ?auto_14354 ?auto_14387 ) ) ( not ( = ?auto_14355 ?auto_14358 ) ) ( not ( = ?auto_14355 ?auto_14387 ) ) ( not ( = ?auto_14356 ?auto_14358 ) ) ( not ( = ?auto_14356 ?auto_14387 ) ) ( not ( = ?auto_14357 ?auto_14358 ) ) ( not ( = ?auto_14357 ?auto_14387 ) ) ( not ( = ?auto_14360 ?auto_14358 ) ) ( not ( = ?auto_14360 ?auto_14387 ) ) ( not ( = ?auto_14358 ?auto_14374 ) ) ( not ( = ?auto_14358 ?auto_14382 ) ) ( not ( = ?auto_14358 ?auto_14381 ) ) ( not ( = ?auto_14358 ?auto_14376 ) ) ( not ( = ?auto_14358 ?auto_14380 ) ) ( not ( = ?auto_14358 ?auto_14385 ) ) ( not ( = ?auto_14358 ?auto_14373 ) ) ( not ( = ?auto_14370 ?auto_14379 ) ) ( not ( = ?auto_14370 ?auto_14375 ) ) ( not ( = ?auto_14370 ?auto_14364 ) ) ( not ( = ?auto_14370 ?auto_14371 ) ) ( not ( = ?auto_14370 ?auto_14378 ) ) ( not ( = ?auto_14370 ?auto_14377 ) ) ( not ( = ?auto_14368 ?auto_14369 ) ) ( not ( = ?auto_14368 ?auto_14372 ) ) ( not ( = ?auto_14368 ?auto_14366 ) ) ( not ( = ?auto_14368 ?auto_14386 ) ) ( not ( = ?auto_14368 ?auto_14383 ) ) ( not ( = ?auto_14368 ?auto_14384 ) ) ( not ( = ?auto_14387 ?auto_14374 ) ) ( not ( = ?auto_14387 ?auto_14382 ) ) ( not ( = ?auto_14387 ?auto_14381 ) ) ( not ( = ?auto_14387 ?auto_14376 ) ) ( not ( = ?auto_14387 ?auto_14380 ) ) ( not ( = ?auto_14387 ?auto_14385 ) ) ( not ( = ?auto_14387 ?auto_14373 ) ) ( not ( = ?auto_14352 ?auto_14361 ) ) ( not ( = ?auto_14352 ?auto_14365 ) ) ( not ( = ?auto_14353 ?auto_14361 ) ) ( not ( = ?auto_14353 ?auto_14365 ) ) ( not ( = ?auto_14354 ?auto_14361 ) ) ( not ( = ?auto_14354 ?auto_14365 ) ) ( not ( = ?auto_14355 ?auto_14361 ) ) ( not ( = ?auto_14355 ?auto_14365 ) ) ( not ( = ?auto_14356 ?auto_14361 ) ) ( not ( = ?auto_14356 ?auto_14365 ) ) ( not ( = ?auto_14357 ?auto_14361 ) ) ( not ( = ?auto_14357 ?auto_14365 ) ) ( not ( = ?auto_14360 ?auto_14361 ) ) ( not ( = ?auto_14360 ?auto_14365 ) ) ( not ( = ?auto_14359 ?auto_14361 ) ) ( not ( = ?auto_14359 ?auto_14365 ) ) ( not ( = ?auto_14361 ?auto_14387 ) ) ( not ( = ?auto_14361 ?auto_14374 ) ) ( not ( = ?auto_14361 ?auto_14382 ) ) ( not ( = ?auto_14361 ?auto_14381 ) ) ( not ( = ?auto_14361 ?auto_14376 ) ) ( not ( = ?auto_14361 ?auto_14380 ) ) ( not ( = ?auto_14361 ?auto_14385 ) ) ( not ( = ?auto_14361 ?auto_14373 ) ) ( not ( = ?auto_14365 ?auto_14387 ) ) ( not ( = ?auto_14365 ?auto_14374 ) ) ( not ( = ?auto_14365 ?auto_14382 ) ) ( not ( = ?auto_14365 ?auto_14381 ) ) ( not ( = ?auto_14365 ?auto_14376 ) ) ( not ( = ?auto_14365 ?auto_14380 ) ) ( not ( = ?auto_14365 ?auto_14385 ) ) ( not ( = ?auto_14365 ?auto_14373 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_14352 ?auto_14353 ?auto_14354 ?auto_14355 ?auto_14356 ?auto_14357 ?auto_14360 ?auto_14359 ?auto_14358 )
      ( MAKE-1CRATE ?auto_14358 ?auto_14361 )
      ( MAKE-9CRATE-VERIFY ?auto_14352 ?auto_14353 ?auto_14354 ?auto_14355 ?auto_14356 ?auto_14357 ?auto_14360 ?auto_14359 ?auto_14358 ?auto_14361 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14390 - SURFACE
      ?auto_14391 - SURFACE
    )
    :vars
    (
      ?auto_14392 - HOIST
      ?auto_14393 - PLACE
      ?auto_14395 - PLACE
      ?auto_14396 - HOIST
      ?auto_14397 - SURFACE
      ?auto_14394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14392 ?auto_14393 ) ( SURFACE-AT ?auto_14390 ?auto_14393 ) ( CLEAR ?auto_14390 ) ( IS-CRATE ?auto_14391 ) ( AVAILABLE ?auto_14392 ) ( not ( = ?auto_14395 ?auto_14393 ) ) ( HOIST-AT ?auto_14396 ?auto_14395 ) ( AVAILABLE ?auto_14396 ) ( SURFACE-AT ?auto_14391 ?auto_14395 ) ( ON ?auto_14391 ?auto_14397 ) ( CLEAR ?auto_14391 ) ( TRUCK-AT ?auto_14394 ?auto_14393 ) ( not ( = ?auto_14390 ?auto_14391 ) ) ( not ( = ?auto_14390 ?auto_14397 ) ) ( not ( = ?auto_14391 ?auto_14397 ) ) ( not ( = ?auto_14392 ?auto_14396 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14394 ?auto_14393 ?auto_14395 )
      ( !LIFT ?auto_14396 ?auto_14391 ?auto_14397 ?auto_14395 )
      ( !LOAD ?auto_14396 ?auto_14391 ?auto_14394 ?auto_14395 )
      ( !DRIVE ?auto_14394 ?auto_14395 ?auto_14393 )
      ( !UNLOAD ?auto_14392 ?auto_14391 ?auto_14394 ?auto_14393 )
      ( !DROP ?auto_14392 ?auto_14391 ?auto_14390 ?auto_14393 )
      ( MAKE-1CRATE-VERIFY ?auto_14390 ?auto_14391 ) )
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
      ?auto_14417 - SURFACE
      ?auto_14416 - SURFACE
      ?auto_14415 - SURFACE
      ?auto_14418 - SURFACE
      ?auto_14419 - SURFACE
    )
    :vars
    (
      ?auto_14425 - HOIST
      ?auto_14421 - PLACE
      ?auto_14422 - PLACE
      ?auto_14424 - HOIST
      ?auto_14423 - SURFACE
      ?auto_14439 - PLACE
      ?auto_14442 - HOIST
      ?auto_14441 - SURFACE
      ?auto_14429 - PLACE
      ?auto_14435 - HOIST
      ?auto_14427 - SURFACE
      ?auto_14426 - PLACE
      ?auto_14436 - HOIST
      ?auto_14447 - SURFACE
      ?auto_14448 - PLACE
      ?auto_14445 - HOIST
      ?auto_14440 - SURFACE
      ?auto_14433 - SURFACE
      ?auto_14438 - PLACE
      ?auto_14443 - HOIST
      ?auto_14431 - SURFACE
      ?auto_14430 - PLACE
      ?auto_14444 - HOIST
      ?auto_14432 - SURFACE
      ?auto_14434 - PLACE
      ?auto_14428 - HOIST
      ?auto_14437 - SURFACE
      ?auto_14446 - SURFACE
      ?auto_14420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14425 ?auto_14421 ) ( IS-CRATE ?auto_14419 ) ( not ( = ?auto_14422 ?auto_14421 ) ) ( HOIST-AT ?auto_14424 ?auto_14422 ) ( AVAILABLE ?auto_14424 ) ( SURFACE-AT ?auto_14419 ?auto_14422 ) ( ON ?auto_14419 ?auto_14423 ) ( CLEAR ?auto_14419 ) ( not ( = ?auto_14418 ?auto_14419 ) ) ( not ( = ?auto_14418 ?auto_14423 ) ) ( not ( = ?auto_14419 ?auto_14423 ) ) ( not ( = ?auto_14425 ?auto_14424 ) ) ( IS-CRATE ?auto_14418 ) ( not ( = ?auto_14439 ?auto_14421 ) ) ( HOIST-AT ?auto_14442 ?auto_14439 ) ( SURFACE-AT ?auto_14418 ?auto_14439 ) ( ON ?auto_14418 ?auto_14441 ) ( CLEAR ?auto_14418 ) ( not ( = ?auto_14415 ?auto_14418 ) ) ( not ( = ?auto_14415 ?auto_14441 ) ) ( not ( = ?auto_14418 ?auto_14441 ) ) ( not ( = ?auto_14425 ?auto_14442 ) ) ( IS-CRATE ?auto_14415 ) ( not ( = ?auto_14429 ?auto_14421 ) ) ( HOIST-AT ?auto_14435 ?auto_14429 ) ( AVAILABLE ?auto_14435 ) ( SURFACE-AT ?auto_14415 ?auto_14429 ) ( ON ?auto_14415 ?auto_14427 ) ( CLEAR ?auto_14415 ) ( not ( = ?auto_14416 ?auto_14415 ) ) ( not ( = ?auto_14416 ?auto_14427 ) ) ( not ( = ?auto_14415 ?auto_14427 ) ) ( not ( = ?auto_14425 ?auto_14435 ) ) ( IS-CRATE ?auto_14416 ) ( not ( = ?auto_14426 ?auto_14421 ) ) ( HOIST-AT ?auto_14436 ?auto_14426 ) ( AVAILABLE ?auto_14436 ) ( SURFACE-AT ?auto_14416 ?auto_14426 ) ( ON ?auto_14416 ?auto_14447 ) ( CLEAR ?auto_14416 ) ( not ( = ?auto_14417 ?auto_14416 ) ) ( not ( = ?auto_14417 ?auto_14447 ) ) ( not ( = ?auto_14416 ?auto_14447 ) ) ( not ( = ?auto_14425 ?auto_14436 ) ) ( IS-CRATE ?auto_14417 ) ( not ( = ?auto_14448 ?auto_14421 ) ) ( HOIST-AT ?auto_14445 ?auto_14448 ) ( AVAILABLE ?auto_14445 ) ( SURFACE-AT ?auto_14417 ?auto_14448 ) ( ON ?auto_14417 ?auto_14440 ) ( CLEAR ?auto_14417 ) ( not ( = ?auto_14414 ?auto_14417 ) ) ( not ( = ?auto_14414 ?auto_14440 ) ) ( not ( = ?auto_14417 ?auto_14440 ) ) ( not ( = ?auto_14425 ?auto_14445 ) ) ( IS-CRATE ?auto_14414 ) ( AVAILABLE ?auto_14442 ) ( SURFACE-AT ?auto_14414 ?auto_14439 ) ( ON ?auto_14414 ?auto_14433 ) ( CLEAR ?auto_14414 ) ( not ( = ?auto_14413 ?auto_14414 ) ) ( not ( = ?auto_14413 ?auto_14433 ) ) ( not ( = ?auto_14414 ?auto_14433 ) ) ( IS-CRATE ?auto_14413 ) ( not ( = ?auto_14438 ?auto_14421 ) ) ( HOIST-AT ?auto_14443 ?auto_14438 ) ( AVAILABLE ?auto_14443 ) ( SURFACE-AT ?auto_14413 ?auto_14438 ) ( ON ?auto_14413 ?auto_14431 ) ( CLEAR ?auto_14413 ) ( not ( = ?auto_14412 ?auto_14413 ) ) ( not ( = ?auto_14412 ?auto_14431 ) ) ( not ( = ?auto_14413 ?auto_14431 ) ) ( not ( = ?auto_14425 ?auto_14443 ) ) ( IS-CRATE ?auto_14412 ) ( not ( = ?auto_14430 ?auto_14421 ) ) ( HOIST-AT ?auto_14444 ?auto_14430 ) ( AVAILABLE ?auto_14444 ) ( SURFACE-AT ?auto_14412 ?auto_14430 ) ( ON ?auto_14412 ?auto_14432 ) ( CLEAR ?auto_14412 ) ( not ( = ?auto_14411 ?auto_14412 ) ) ( not ( = ?auto_14411 ?auto_14432 ) ) ( not ( = ?auto_14412 ?auto_14432 ) ) ( not ( = ?auto_14425 ?auto_14444 ) ) ( IS-CRATE ?auto_14411 ) ( not ( = ?auto_14434 ?auto_14421 ) ) ( HOIST-AT ?auto_14428 ?auto_14434 ) ( SURFACE-AT ?auto_14411 ?auto_14434 ) ( ON ?auto_14411 ?auto_14437 ) ( CLEAR ?auto_14411 ) ( not ( = ?auto_14410 ?auto_14411 ) ) ( not ( = ?auto_14410 ?auto_14437 ) ) ( not ( = ?auto_14411 ?auto_14437 ) ) ( not ( = ?auto_14425 ?auto_14428 ) ) ( SURFACE-AT ?auto_14409 ?auto_14421 ) ( CLEAR ?auto_14409 ) ( IS-CRATE ?auto_14410 ) ( AVAILABLE ?auto_14425 ) ( AVAILABLE ?auto_14428 ) ( SURFACE-AT ?auto_14410 ?auto_14434 ) ( ON ?auto_14410 ?auto_14446 ) ( CLEAR ?auto_14410 ) ( TRUCK-AT ?auto_14420 ?auto_14421 ) ( not ( = ?auto_14409 ?auto_14410 ) ) ( not ( = ?auto_14409 ?auto_14446 ) ) ( not ( = ?auto_14410 ?auto_14446 ) ) ( not ( = ?auto_14409 ?auto_14411 ) ) ( not ( = ?auto_14409 ?auto_14437 ) ) ( not ( = ?auto_14411 ?auto_14446 ) ) ( not ( = ?auto_14437 ?auto_14446 ) ) ( not ( = ?auto_14409 ?auto_14412 ) ) ( not ( = ?auto_14409 ?auto_14432 ) ) ( not ( = ?auto_14410 ?auto_14412 ) ) ( not ( = ?auto_14410 ?auto_14432 ) ) ( not ( = ?auto_14412 ?auto_14437 ) ) ( not ( = ?auto_14412 ?auto_14446 ) ) ( not ( = ?auto_14430 ?auto_14434 ) ) ( not ( = ?auto_14444 ?auto_14428 ) ) ( not ( = ?auto_14432 ?auto_14437 ) ) ( not ( = ?auto_14432 ?auto_14446 ) ) ( not ( = ?auto_14409 ?auto_14413 ) ) ( not ( = ?auto_14409 ?auto_14431 ) ) ( not ( = ?auto_14410 ?auto_14413 ) ) ( not ( = ?auto_14410 ?auto_14431 ) ) ( not ( = ?auto_14411 ?auto_14413 ) ) ( not ( = ?auto_14411 ?auto_14431 ) ) ( not ( = ?auto_14413 ?auto_14432 ) ) ( not ( = ?auto_14413 ?auto_14437 ) ) ( not ( = ?auto_14413 ?auto_14446 ) ) ( not ( = ?auto_14438 ?auto_14430 ) ) ( not ( = ?auto_14438 ?auto_14434 ) ) ( not ( = ?auto_14443 ?auto_14444 ) ) ( not ( = ?auto_14443 ?auto_14428 ) ) ( not ( = ?auto_14431 ?auto_14432 ) ) ( not ( = ?auto_14431 ?auto_14437 ) ) ( not ( = ?auto_14431 ?auto_14446 ) ) ( not ( = ?auto_14409 ?auto_14414 ) ) ( not ( = ?auto_14409 ?auto_14433 ) ) ( not ( = ?auto_14410 ?auto_14414 ) ) ( not ( = ?auto_14410 ?auto_14433 ) ) ( not ( = ?auto_14411 ?auto_14414 ) ) ( not ( = ?auto_14411 ?auto_14433 ) ) ( not ( = ?auto_14412 ?auto_14414 ) ) ( not ( = ?auto_14412 ?auto_14433 ) ) ( not ( = ?auto_14414 ?auto_14431 ) ) ( not ( = ?auto_14414 ?auto_14432 ) ) ( not ( = ?auto_14414 ?auto_14437 ) ) ( not ( = ?auto_14414 ?auto_14446 ) ) ( not ( = ?auto_14439 ?auto_14438 ) ) ( not ( = ?auto_14439 ?auto_14430 ) ) ( not ( = ?auto_14439 ?auto_14434 ) ) ( not ( = ?auto_14442 ?auto_14443 ) ) ( not ( = ?auto_14442 ?auto_14444 ) ) ( not ( = ?auto_14442 ?auto_14428 ) ) ( not ( = ?auto_14433 ?auto_14431 ) ) ( not ( = ?auto_14433 ?auto_14432 ) ) ( not ( = ?auto_14433 ?auto_14437 ) ) ( not ( = ?auto_14433 ?auto_14446 ) ) ( not ( = ?auto_14409 ?auto_14417 ) ) ( not ( = ?auto_14409 ?auto_14440 ) ) ( not ( = ?auto_14410 ?auto_14417 ) ) ( not ( = ?auto_14410 ?auto_14440 ) ) ( not ( = ?auto_14411 ?auto_14417 ) ) ( not ( = ?auto_14411 ?auto_14440 ) ) ( not ( = ?auto_14412 ?auto_14417 ) ) ( not ( = ?auto_14412 ?auto_14440 ) ) ( not ( = ?auto_14413 ?auto_14417 ) ) ( not ( = ?auto_14413 ?auto_14440 ) ) ( not ( = ?auto_14417 ?auto_14433 ) ) ( not ( = ?auto_14417 ?auto_14431 ) ) ( not ( = ?auto_14417 ?auto_14432 ) ) ( not ( = ?auto_14417 ?auto_14437 ) ) ( not ( = ?auto_14417 ?auto_14446 ) ) ( not ( = ?auto_14448 ?auto_14439 ) ) ( not ( = ?auto_14448 ?auto_14438 ) ) ( not ( = ?auto_14448 ?auto_14430 ) ) ( not ( = ?auto_14448 ?auto_14434 ) ) ( not ( = ?auto_14445 ?auto_14442 ) ) ( not ( = ?auto_14445 ?auto_14443 ) ) ( not ( = ?auto_14445 ?auto_14444 ) ) ( not ( = ?auto_14445 ?auto_14428 ) ) ( not ( = ?auto_14440 ?auto_14433 ) ) ( not ( = ?auto_14440 ?auto_14431 ) ) ( not ( = ?auto_14440 ?auto_14432 ) ) ( not ( = ?auto_14440 ?auto_14437 ) ) ( not ( = ?auto_14440 ?auto_14446 ) ) ( not ( = ?auto_14409 ?auto_14416 ) ) ( not ( = ?auto_14409 ?auto_14447 ) ) ( not ( = ?auto_14410 ?auto_14416 ) ) ( not ( = ?auto_14410 ?auto_14447 ) ) ( not ( = ?auto_14411 ?auto_14416 ) ) ( not ( = ?auto_14411 ?auto_14447 ) ) ( not ( = ?auto_14412 ?auto_14416 ) ) ( not ( = ?auto_14412 ?auto_14447 ) ) ( not ( = ?auto_14413 ?auto_14416 ) ) ( not ( = ?auto_14413 ?auto_14447 ) ) ( not ( = ?auto_14414 ?auto_14416 ) ) ( not ( = ?auto_14414 ?auto_14447 ) ) ( not ( = ?auto_14416 ?auto_14440 ) ) ( not ( = ?auto_14416 ?auto_14433 ) ) ( not ( = ?auto_14416 ?auto_14431 ) ) ( not ( = ?auto_14416 ?auto_14432 ) ) ( not ( = ?auto_14416 ?auto_14437 ) ) ( not ( = ?auto_14416 ?auto_14446 ) ) ( not ( = ?auto_14426 ?auto_14448 ) ) ( not ( = ?auto_14426 ?auto_14439 ) ) ( not ( = ?auto_14426 ?auto_14438 ) ) ( not ( = ?auto_14426 ?auto_14430 ) ) ( not ( = ?auto_14426 ?auto_14434 ) ) ( not ( = ?auto_14436 ?auto_14445 ) ) ( not ( = ?auto_14436 ?auto_14442 ) ) ( not ( = ?auto_14436 ?auto_14443 ) ) ( not ( = ?auto_14436 ?auto_14444 ) ) ( not ( = ?auto_14436 ?auto_14428 ) ) ( not ( = ?auto_14447 ?auto_14440 ) ) ( not ( = ?auto_14447 ?auto_14433 ) ) ( not ( = ?auto_14447 ?auto_14431 ) ) ( not ( = ?auto_14447 ?auto_14432 ) ) ( not ( = ?auto_14447 ?auto_14437 ) ) ( not ( = ?auto_14447 ?auto_14446 ) ) ( not ( = ?auto_14409 ?auto_14415 ) ) ( not ( = ?auto_14409 ?auto_14427 ) ) ( not ( = ?auto_14410 ?auto_14415 ) ) ( not ( = ?auto_14410 ?auto_14427 ) ) ( not ( = ?auto_14411 ?auto_14415 ) ) ( not ( = ?auto_14411 ?auto_14427 ) ) ( not ( = ?auto_14412 ?auto_14415 ) ) ( not ( = ?auto_14412 ?auto_14427 ) ) ( not ( = ?auto_14413 ?auto_14415 ) ) ( not ( = ?auto_14413 ?auto_14427 ) ) ( not ( = ?auto_14414 ?auto_14415 ) ) ( not ( = ?auto_14414 ?auto_14427 ) ) ( not ( = ?auto_14417 ?auto_14415 ) ) ( not ( = ?auto_14417 ?auto_14427 ) ) ( not ( = ?auto_14415 ?auto_14447 ) ) ( not ( = ?auto_14415 ?auto_14440 ) ) ( not ( = ?auto_14415 ?auto_14433 ) ) ( not ( = ?auto_14415 ?auto_14431 ) ) ( not ( = ?auto_14415 ?auto_14432 ) ) ( not ( = ?auto_14415 ?auto_14437 ) ) ( not ( = ?auto_14415 ?auto_14446 ) ) ( not ( = ?auto_14429 ?auto_14426 ) ) ( not ( = ?auto_14429 ?auto_14448 ) ) ( not ( = ?auto_14429 ?auto_14439 ) ) ( not ( = ?auto_14429 ?auto_14438 ) ) ( not ( = ?auto_14429 ?auto_14430 ) ) ( not ( = ?auto_14429 ?auto_14434 ) ) ( not ( = ?auto_14435 ?auto_14436 ) ) ( not ( = ?auto_14435 ?auto_14445 ) ) ( not ( = ?auto_14435 ?auto_14442 ) ) ( not ( = ?auto_14435 ?auto_14443 ) ) ( not ( = ?auto_14435 ?auto_14444 ) ) ( not ( = ?auto_14435 ?auto_14428 ) ) ( not ( = ?auto_14427 ?auto_14447 ) ) ( not ( = ?auto_14427 ?auto_14440 ) ) ( not ( = ?auto_14427 ?auto_14433 ) ) ( not ( = ?auto_14427 ?auto_14431 ) ) ( not ( = ?auto_14427 ?auto_14432 ) ) ( not ( = ?auto_14427 ?auto_14437 ) ) ( not ( = ?auto_14427 ?auto_14446 ) ) ( not ( = ?auto_14409 ?auto_14418 ) ) ( not ( = ?auto_14409 ?auto_14441 ) ) ( not ( = ?auto_14410 ?auto_14418 ) ) ( not ( = ?auto_14410 ?auto_14441 ) ) ( not ( = ?auto_14411 ?auto_14418 ) ) ( not ( = ?auto_14411 ?auto_14441 ) ) ( not ( = ?auto_14412 ?auto_14418 ) ) ( not ( = ?auto_14412 ?auto_14441 ) ) ( not ( = ?auto_14413 ?auto_14418 ) ) ( not ( = ?auto_14413 ?auto_14441 ) ) ( not ( = ?auto_14414 ?auto_14418 ) ) ( not ( = ?auto_14414 ?auto_14441 ) ) ( not ( = ?auto_14417 ?auto_14418 ) ) ( not ( = ?auto_14417 ?auto_14441 ) ) ( not ( = ?auto_14416 ?auto_14418 ) ) ( not ( = ?auto_14416 ?auto_14441 ) ) ( not ( = ?auto_14418 ?auto_14427 ) ) ( not ( = ?auto_14418 ?auto_14447 ) ) ( not ( = ?auto_14418 ?auto_14440 ) ) ( not ( = ?auto_14418 ?auto_14433 ) ) ( not ( = ?auto_14418 ?auto_14431 ) ) ( not ( = ?auto_14418 ?auto_14432 ) ) ( not ( = ?auto_14418 ?auto_14437 ) ) ( not ( = ?auto_14418 ?auto_14446 ) ) ( not ( = ?auto_14441 ?auto_14427 ) ) ( not ( = ?auto_14441 ?auto_14447 ) ) ( not ( = ?auto_14441 ?auto_14440 ) ) ( not ( = ?auto_14441 ?auto_14433 ) ) ( not ( = ?auto_14441 ?auto_14431 ) ) ( not ( = ?auto_14441 ?auto_14432 ) ) ( not ( = ?auto_14441 ?auto_14437 ) ) ( not ( = ?auto_14441 ?auto_14446 ) ) ( not ( = ?auto_14409 ?auto_14419 ) ) ( not ( = ?auto_14409 ?auto_14423 ) ) ( not ( = ?auto_14410 ?auto_14419 ) ) ( not ( = ?auto_14410 ?auto_14423 ) ) ( not ( = ?auto_14411 ?auto_14419 ) ) ( not ( = ?auto_14411 ?auto_14423 ) ) ( not ( = ?auto_14412 ?auto_14419 ) ) ( not ( = ?auto_14412 ?auto_14423 ) ) ( not ( = ?auto_14413 ?auto_14419 ) ) ( not ( = ?auto_14413 ?auto_14423 ) ) ( not ( = ?auto_14414 ?auto_14419 ) ) ( not ( = ?auto_14414 ?auto_14423 ) ) ( not ( = ?auto_14417 ?auto_14419 ) ) ( not ( = ?auto_14417 ?auto_14423 ) ) ( not ( = ?auto_14416 ?auto_14419 ) ) ( not ( = ?auto_14416 ?auto_14423 ) ) ( not ( = ?auto_14415 ?auto_14419 ) ) ( not ( = ?auto_14415 ?auto_14423 ) ) ( not ( = ?auto_14419 ?auto_14441 ) ) ( not ( = ?auto_14419 ?auto_14427 ) ) ( not ( = ?auto_14419 ?auto_14447 ) ) ( not ( = ?auto_14419 ?auto_14440 ) ) ( not ( = ?auto_14419 ?auto_14433 ) ) ( not ( = ?auto_14419 ?auto_14431 ) ) ( not ( = ?auto_14419 ?auto_14432 ) ) ( not ( = ?auto_14419 ?auto_14437 ) ) ( not ( = ?auto_14419 ?auto_14446 ) ) ( not ( = ?auto_14422 ?auto_14439 ) ) ( not ( = ?auto_14422 ?auto_14429 ) ) ( not ( = ?auto_14422 ?auto_14426 ) ) ( not ( = ?auto_14422 ?auto_14448 ) ) ( not ( = ?auto_14422 ?auto_14438 ) ) ( not ( = ?auto_14422 ?auto_14430 ) ) ( not ( = ?auto_14422 ?auto_14434 ) ) ( not ( = ?auto_14424 ?auto_14442 ) ) ( not ( = ?auto_14424 ?auto_14435 ) ) ( not ( = ?auto_14424 ?auto_14436 ) ) ( not ( = ?auto_14424 ?auto_14445 ) ) ( not ( = ?auto_14424 ?auto_14443 ) ) ( not ( = ?auto_14424 ?auto_14444 ) ) ( not ( = ?auto_14424 ?auto_14428 ) ) ( not ( = ?auto_14423 ?auto_14441 ) ) ( not ( = ?auto_14423 ?auto_14427 ) ) ( not ( = ?auto_14423 ?auto_14447 ) ) ( not ( = ?auto_14423 ?auto_14440 ) ) ( not ( = ?auto_14423 ?auto_14433 ) ) ( not ( = ?auto_14423 ?auto_14431 ) ) ( not ( = ?auto_14423 ?auto_14432 ) ) ( not ( = ?auto_14423 ?auto_14437 ) ) ( not ( = ?auto_14423 ?auto_14446 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_14409 ?auto_14410 ?auto_14411 ?auto_14412 ?auto_14413 ?auto_14414 ?auto_14417 ?auto_14416 ?auto_14415 ?auto_14418 )
      ( MAKE-1CRATE ?auto_14418 ?auto_14419 )
      ( MAKE-10CRATE-VERIFY ?auto_14409 ?auto_14410 ?auto_14411 ?auto_14412 ?auto_14413 ?auto_14414 ?auto_14417 ?auto_14416 ?auto_14415 ?auto_14418 ?auto_14419 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14451 - SURFACE
      ?auto_14452 - SURFACE
    )
    :vars
    (
      ?auto_14453 - HOIST
      ?auto_14454 - PLACE
      ?auto_14456 - PLACE
      ?auto_14457 - HOIST
      ?auto_14458 - SURFACE
      ?auto_14455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14453 ?auto_14454 ) ( SURFACE-AT ?auto_14451 ?auto_14454 ) ( CLEAR ?auto_14451 ) ( IS-CRATE ?auto_14452 ) ( AVAILABLE ?auto_14453 ) ( not ( = ?auto_14456 ?auto_14454 ) ) ( HOIST-AT ?auto_14457 ?auto_14456 ) ( AVAILABLE ?auto_14457 ) ( SURFACE-AT ?auto_14452 ?auto_14456 ) ( ON ?auto_14452 ?auto_14458 ) ( CLEAR ?auto_14452 ) ( TRUCK-AT ?auto_14455 ?auto_14454 ) ( not ( = ?auto_14451 ?auto_14452 ) ) ( not ( = ?auto_14451 ?auto_14458 ) ) ( not ( = ?auto_14452 ?auto_14458 ) ) ( not ( = ?auto_14453 ?auto_14457 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14455 ?auto_14454 ?auto_14456 )
      ( !LIFT ?auto_14457 ?auto_14452 ?auto_14458 ?auto_14456 )
      ( !LOAD ?auto_14457 ?auto_14452 ?auto_14455 ?auto_14456 )
      ( !DRIVE ?auto_14455 ?auto_14456 ?auto_14454 )
      ( !UNLOAD ?auto_14453 ?auto_14452 ?auto_14455 ?auto_14454 )
      ( !DROP ?auto_14453 ?auto_14452 ?auto_14451 ?auto_14454 )
      ( MAKE-1CRATE-VERIFY ?auto_14451 ?auto_14452 ) )
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
      ?auto_14479 - SURFACE
      ?auto_14478 - SURFACE
      ?auto_14477 - SURFACE
      ?auto_14480 - SURFACE
      ?auto_14482 - SURFACE
      ?auto_14481 - SURFACE
    )
    :vars
    (
      ?auto_14483 - HOIST
      ?auto_14484 - PLACE
      ?auto_14487 - PLACE
      ?auto_14488 - HOIST
      ?auto_14486 - SURFACE
      ?auto_14509 - PLACE
      ?auto_14506 - HOIST
      ?auto_14491 - SURFACE
      ?auto_14504 - PLACE
      ?auto_14495 - HOIST
      ?auto_14505 - SURFACE
      ?auto_14494 - PLACE
      ?auto_14512 - HOIST
      ?auto_14502 - SURFACE
      ?auto_14492 - PLACE
      ?auto_14508 - HOIST
      ?auto_14510 - SURFACE
      ?auto_14511 - SURFACE
      ?auto_14500 - SURFACE
      ?auto_14507 - PLACE
      ?auto_14498 - HOIST
      ?auto_14489 - SURFACE
      ?auto_14499 - PLACE
      ?auto_14493 - HOIST
      ?auto_14503 - SURFACE
      ?auto_14490 - PLACE
      ?auto_14496 - HOIST
      ?auto_14497 - SURFACE
      ?auto_14501 - SURFACE
      ?auto_14485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14483 ?auto_14484 ) ( IS-CRATE ?auto_14481 ) ( not ( = ?auto_14487 ?auto_14484 ) ) ( HOIST-AT ?auto_14488 ?auto_14487 ) ( SURFACE-AT ?auto_14481 ?auto_14487 ) ( ON ?auto_14481 ?auto_14486 ) ( CLEAR ?auto_14481 ) ( not ( = ?auto_14482 ?auto_14481 ) ) ( not ( = ?auto_14482 ?auto_14486 ) ) ( not ( = ?auto_14481 ?auto_14486 ) ) ( not ( = ?auto_14483 ?auto_14488 ) ) ( IS-CRATE ?auto_14482 ) ( not ( = ?auto_14509 ?auto_14484 ) ) ( HOIST-AT ?auto_14506 ?auto_14509 ) ( AVAILABLE ?auto_14506 ) ( SURFACE-AT ?auto_14482 ?auto_14509 ) ( ON ?auto_14482 ?auto_14491 ) ( CLEAR ?auto_14482 ) ( not ( = ?auto_14480 ?auto_14482 ) ) ( not ( = ?auto_14480 ?auto_14491 ) ) ( not ( = ?auto_14482 ?auto_14491 ) ) ( not ( = ?auto_14483 ?auto_14506 ) ) ( IS-CRATE ?auto_14480 ) ( not ( = ?auto_14504 ?auto_14484 ) ) ( HOIST-AT ?auto_14495 ?auto_14504 ) ( SURFACE-AT ?auto_14480 ?auto_14504 ) ( ON ?auto_14480 ?auto_14505 ) ( CLEAR ?auto_14480 ) ( not ( = ?auto_14477 ?auto_14480 ) ) ( not ( = ?auto_14477 ?auto_14505 ) ) ( not ( = ?auto_14480 ?auto_14505 ) ) ( not ( = ?auto_14483 ?auto_14495 ) ) ( IS-CRATE ?auto_14477 ) ( not ( = ?auto_14494 ?auto_14484 ) ) ( HOIST-AT ?auto_14512 ?auto_14494 ) ( AVAILABLE ?auto_14512 ) ( SURFACE-AT ?auto_14477 ?auto_14494 ) ( ON ?auto_14477 ?auto_14502 ) ( CLEAR ?auto_14477 ) ( not ( = ?auto_14478 ?auto_14477 ) ) ( not ( = ?auto_14478 ?auto_14502 ) ) ( not ( = ?auto_14477 ?auto_14502 ) ) ( not ( = ?auto_14483 ?auto_14512 ) ) ( IS-CRATE ?auto_14478 ) ( not ( = ?auto_14492 ?auto_14484 ) ) ( HOIST-AT ?auto_14508 ?auto_14492 ) ( AVAILABLE ?auto_14508 ) ( SURFACE-AT ?auto_14478 ?auto_14492 ) ( ON ?auto_14478 ?auto_14510 ) ( CLEAR ?auto_14478 ) ( not ( = ?auto_14479 ?auto_14478 ) ) ( not ( = ?auto_14479 ?auto_14510 ) ) ( not ( = ?auto_14478 ?auto_14510 ) ) ( not ( = ?auto_14483 ?auto_14508 ) ) ( IS-CRATE ?auto_14479 ) ( AVAILABLE ?auto_14488 ) ( SURFACE-AT ?auto_14479 ?auto_14487 ) ( ON ?auto_14479 ?auto_14511 ) ( CLEAR ?auto_14479 ) ( not ( = ?auto_14476 ?auto_14479 ) ) ( not ( = ?auto_14476 ?auto_14511 ) ) ( not ( = ?auto_14479 ?auto_14511 ) ) ( IS-CRATE ?auto_14476 ) ( AVAILABLE ?auto_14495 ) ( SURFACE-AT ?auto_14476 ?auto_14504 ) ( ON ?auto_14476 ?auto_14500 ) ( CLEAR ?auto_14476 ) ( not ( = ?auto_14475 ?auto_14476 ) ) ( not ( = ?auto_14475 ?auto_14500 ) ) ( not ( = ?auto_14476 ?auto_14500 ) ) ( IS-CRATE ?auto_14475 ) ( not ( = ?auto_14507 ?auto_14484 ) ) ( HOIST-AT ?auto_14498 ?auto_14507 ) ( AVAILABLE ?auto_14498 ) ( SURFACE-AT ?auto_14475 ?auto_14507 ) ( ON ?auto_14475 ?auto_14489 ) ( CLEAR ?auto_14475 ) ( not ( = ?auto_14474 ?auto_14475 ) ) ( not ( = ?auto_14474 ?auto_14489 ) ) ( not ( = ?auto_14475 ?auto_14489 ) ) ( not ( = ?auto_14483 ?auto_14498 ) ) ( IS-CRATE ?auto_14474 ) ( not ( = ?auto_14499 ?auto_14484 ) ) ( HOIST-AT ?auto_14493 ?auto_14499 ) ( AVAILABLE ?auto_14493 ) ( SURFACE-AT ?auto_14474 ?auto_14499 ) ( ON ?auto_14474 ?auto_14503 ) ( CLEAR ?auto_14474 ) ( not ( = ?auto_14473 ?auto_14474 ) ) ( not ( = ?auto_14473 ?auto_14503 ) ) ( not ( = ?auto_14474 ?auto_14503 ) ) ( not ( = ?auto_14483 ?auto_14493 ) ) ( IS-CRATE ?auto_14473 ) ( not ( = ?auto_14490 ?auto_14484 ) ) ( HOIST-AT ?auto_14496 ?auto_14490 ) ( SURFACE-AT ?auto_14473 ?auto_14490 ) ( ON ?auto_14473 ?auto_14497 ) ( CLEAR ?auto_14473 ) ( not ( = ?auto_14472 ?auto_14473 ) ) ( not ( = ?auto_14472 ?auto_14497 ) ) ( not ( = ?auto_14473 ?auto_14497 ) ) ( not ( = ?auto_14483 ?auto_14496 ) ) ( SURFACE-AT ?auto_14471 ?auto_14484 ) ( CLEAR ?auto_14471 ) ( IS-CRATE ?auto_14472 ) ( AVAILABLE ?auto_14483 ) ( AVAILABLE ?auto_14496 ) ( SURFACE-AT ?auto_14472 ?auto_14490 ) ( ON ?auto_14472 ?auto_14501 ) ( CLEAR ?auto_14472 ) ( TRUCK-AT ?auto_14485 ?auto_14484 ) ( not ( = ?auto_14471 ?auto_14472 ) ) ( not ( = ?auto_14471 ?auto_14501 ) ) ( not ( = ?auto_14472 ?auto_14501 ) ) ( not ( = ?auto_14471 ?auto_14473 ) ) ( not ( = ?auto_14471 ?auto_14497 ) ) ( not ( = ?auto_14473 ?auto_14501 ) ) ( not ( = ?auto_14497 ?auto_14501 ) ) ( not ( = ?auto_14471 ?auto_14474 ) ) ( not ( = ?auto_14471 ?auto_14503 ) ) ( not ( = ?auto_14472 ?auto_14474 ) ) ( not ( = ?auto_14472 ?auto_14503 ) ) ( not ( = ?auto_14474 ?auto_14497 ) ) ( not ( = ?auto_14474 ?auto_14501 ) ) ( not ( = ?auto_14499 ?auto_14490 ) ) ( not ( = ?auto_14493 ?auto_14496 ) ) ( not ( = ?auto_14503 ?auto_14497 ) ) ( not ( = ?auto_14503 ?auto_14501 ) ) ( not ( = ?auto_14471 ?auto_14475 ) ) ( not ( = ?auto_14471 ?auto_14489 ) ) ( not ( = ?auto_14472 ?auto_14475 ) ) ( not ( = ?auto_14472 ?auto_14489 ) ) ( not ( = ?auto_14473 ?auto_14475 ) ) ( not ( = ?auto_14473 ?auto_14489 ) ) ( not ( = ?auto_14475 ?auto_14503 ) ) ( not ( = ?auto_14475 ?auto_14497 ) ) ( not ( = ?auto_14475 ?auto_14501 ) ) ( not ( = ?auto_14507 ?auto_14499 ) ) ( not ( = ?auto_14507 ?auto_14490 ) ) ( not ( = ?auto_14498 ?auto_14493 ) ) ( not ( = ?auto_14498 ?auto_14496 ) ) ( not ( = ?auto_14489 ?auto_14503 ) ) ( not ( = ?auto_14489 ?auto_14497 ) ) ( not ( = ?auto_14489 ?auto_14501 ) ) ( not ( = ?auto_14471 ?auto_14476 ) ) ( not ( = ?auto_14471 ?auto_14500 ) ) ( not ( = ?auto_14472 ?auto_14476 ) ) ( not ( = ?auto_14472 ?auto_14500 ) ) ( not ( = ?auto_14473 ?auto_14476 ) ) ( not ( = ?auto_14473 ?auto_14500 ) ) ( not ( = ?auto_14474 ?auto_14476 ) ) ( not ( = ?auto_14474 ?auto_14500 ) ) ( not ( = ?auto_14476 ?auto_14489 ) ) ( not ( = ?auto_14476 ?auto_14503 ) ) ( not ( = ?auto_14476 ?auto_14497 ) ) ( not ( = ?auto_14476 ?auto_14501 ) ) ( not ( = ?auto_14504 ?auto_14507 ) ) ( not ( = ?auto_14504 ?auto_14499 ) ) ( not ( = ?auto_14504 ?auto_14490 ) ) ( not ( = ?auto_14495 ?auto_14498 ) ) ( not ( = ?auto_14495 ?auto_14493 ) ) ( not ( = ?auto_14495 ?auto_14496 ) ) ( not ( = ?auto_14500 ?auto_14489 ) ) ( not ( = ?auto_14500 ?auto_14503 ) ) ( not ( = ?auto_14500 ?auto_14497 ) ) ( not ( = ?auto_14500 ?auto_14501 ) ) ( not ( = ?auto_14471 ?auto_14479 ) ) ( not ( = ?auto_14471 ?auto_14511 ) ) ( not ( = ?auto_14472 ?auto_14479 ) ) ( not ( = ?auto_14472 ?auto_14511 ) ) ( not ( = ?auto_14473 ?auto_14479 ) ) ( not ( = ?auto_14473 ?auto_14511 ) ) ( not ( = ?auto_14474 ?auto_14479 ) ) ( not ( = ?auto_14474 ?auto_14511 ) ) ( not ( = ?auto_14475 ?auto_14479 ) ) ( not ( = ?auto_14475 ?auto_14511 ) ) ( not ( = ?auto_14479 ?auto_14500 ) ) ( not ( = ?auto_14479 ?auto_14489 ) ) ( not ( = ?auto_14479 ?auto_14503 ) ) ( not ( = ?auto_14479 ?auto_14497 ) ) ( not ( = ?auto_14479 ?auto_14501 ) ) ( not ( = ?auto_14487 ?auto_14504 ) ) ( not ( = ?auto_14487 ?auto_14507 ) ) ( not ( = ?auto_14487 ?auto_14499 ) ) ( not ( = ?auto_14487 ?auto_14490 ) ) ( not ( = ?auto_14488 ?auto_14495 ) ) ( not ( = ?auto_14488 ?auto_14498 ) ) ( not ( = ?auto_14488 ?auto_14493 ) ) ( not ( = ?auto_14488 ?auto_14496 ) ) ( not ( = ?auto_14511 ?auto_14500 ) ) ( not ( = ?auto_14511 ?auto_14489 ) ) ( not ( = ?auto_14511 ?auto_14503 ) ) ( not ( = ?auto_14511 ?auto_14497 ) ) ( not ( = ?auto_14511 ?auto_14501 ) ) ( not ( = ?auto_14471 ?auto_14478 ) ) ( not ( = ?auto_14471 ?auto_14510 ) ) ( not ( = ?auto_14472 ?auto_14478 ) ) ( not ( = ?auto_14472 ?auto_14510 ) ) ( not ( = ?auto_14473 ?auto_14478 ) ) ( not ( = ?auto_14473 ?auto_14510 ) ) ( not ( = ?auto_14474 ?auto_14478 ) ) ( not ( = ?auto_14474 ?auto_14510 ) ) ( not ( = ?auto_14475 ?auto_14478 ) ) ( not ( = ?auto_14475 ?auto_14510 ) ) ( not ( = ?auto_14476 ?auto_14478 ) ) ( not ( = ?auto_14476 ?auto_14510 ) ) ( not ( = ?auto_14478 ?auto_14511 ) ) ( not ( = ?auto_14478 ?auto_14500 ) ) ( not ( = ?auto_14478 ?auto_14489 ) ) ( not ( = ?auto_14478 ?auto_14503 ) ) ( not ( = ?auto_14478 ?auto_14497 ) ) ( not ( = ?auto_14478 ?auto_14501 ) ) ( not ( = ?auto_14492 ?auto_14487 ) ) ( not ( = ?auto_14492 ?auto_14504 ) ) ( not ( = ?auto_14492 ?auto_14507 ) ) ( not ( = ?auto_14492 ?auto_14499 ) ) ( not ( = ?auto_14492 ?auto_14490 ) ) ( not ( = ?auto_14508 ?auto_14488 ) ) ( not ( = ?auto_14508 ?auto_14495 ) ) ( not ( = ?auto_14508 ?auto_14498 ) ) ( not ( = ?auto_14508 ?auto_14493 ) ) ( not ( = ?auto_14508 ?auto_14496 ) ) ( not ( = ?auto_14510 ?auto_14511 ) ) ( not ( = ?auto_14510 ?auto_14500 ) ) ( not ( = ?auto_14510 ?auto_14489 ) ) ( not ( = ?auto_14510 ?auto_14503 ) ) ( not ( = ?auto_14510 ?auto_14497 ) ) ( not ( = ?auto_14510 ?auto_14501 ) ) ( not ( = ?auto_14471 ?auto_14477 ) ) ( not ( = ?auto_14471 ?auto_14502 ) ) ( not ( = ?auto_14472 ?auto_14477 ) ) ( not ( = ?auto_14472 ?auto_14502 ) ) ( not ( = ?auto_14473 ?auto_14477 ) ) ( not ( = ?auto_14473 ?auto_14502 ) ) ( not ( = ?auto_14474 ?auto_14477 ) ) ( not ( = ?auto_14474 ?auto_14502 ) ) ( not ( = ?auto_14475 ?auto_14477 ) ) ( not ( = ?auto_14475 ?auto_14502 ) ) ( not ( = ?auto_14476 ?auto_14477 ) ) ( not ( = ?auto_14476 ?auto_14502 ) ) ( not ( = ?auto_14479 ?auto_14477 ) ) ( not ( = ?auto_14479 ?auto_14502 ) ) ( not ( = ?auto_14477 ?auto_14510 ) ) ( not ( = ?auto_14477 ?auto_14511 ) ) ( not ( = ?auto_14477 ?auto_14500 ) ) ( not ( = ?auto_14477 ?auto_14489 ) ) ( not ( = ?auto_14477 ?auto_14503 ) ) ( not ( = ?auto_14477 ?auto_14497 ) ) ( not ( = ?auto_14477 ?auto_14501 ) ) ( not ( = ?auto_14494 ?auto_14492 ) ) ( not ( = ?auto_14494 ?auto_14487 ) ) ( not ( = ?auto_14494 ?auto_14504 ) ) ( not ( = ?auto_14494 ?auto_14507 ) ) ( not ( = ?auto_14494 ?auto_14499 ) ) ( not ( = ?auto_14494 ?auto_14490 ) ) ( not ( = ?auto_14512 ?auto_14508 ) ) ( not ( = ?auto_14512 ?auto_14488 ) ) ( not ( = ?auto_14512 ?auto_14495 ) ) ( not ( = ?auto_14512 ?auto_14498 ) ) ( not ( = ?auto_14512 ?auto_14493 ) ) ( not ( = ?auto_14512 ?auto_14496 ) ) ( not ( = ?auto_14502 ?auto_14510 ) ) ( not ( = ?auto_14502 ?auto_14511 ) ) ( not ( = ?auto_14502 ?auto_14500 ) ) ( not ( = ?auto_14502 ?auto_14489 ) ) ( not ( = ?auto_14502 ?auto_14503 ) ) ( not ( = ?auto_14502 ?auto_14497 ) ) ( not ( = ?auto_14502 ?auto_14501 ) ) ( not ( = ?auto_14471 ?auto_14480 ) ) ( not ( = ?auto_14471 ?auto_14505 ) ) ( not ( = ?auto_14472 ?auto_14480 ) ) ( not ( = ?auto_14472 ?auto_14505 ) ) ( not ( = ?auto_14473 ?auto_14480 ) ) ( not ( = ?auto_14473 ?auto_14505 ) ) ( not ( = ?auto_14474 ?auto_14480 ) ) ( not ( = ?auto_14474 ?auto_14505 ) ) ( not ( = ?auto_14475 ?auto_14480 ) ) ( not ( = ?auto_14475 ?auto_14505 ) ) ( not ( = ?auto_14476 ?auto_14480 ) ) ( not ( = ?auto_14476 ?auto_14505 ) ) ( not ( = ?auto_14479 ?auto_14480 ) ) ( not ( = ?auto_14479 ?auto_14505 ) ) ( not ( = ?auto_14478 ?auto_14480 ) ) ( not ( = ?auto_14478 ?auto_14505 ) ) ( not ( = ?auto_14480 ?auto_14502 ) ) ( not ( = ?auto_14480 ?auto_14510 ) ) ( not ( = ?auto_14480 ?auto_14511 ) ) ( not ( = ?auto_14480 ?auto_14500 ) ) ( not ( = ?auto_14480 ?auto_14489 ) ) ( not ( = ?auto_14480 ?auto_14503 ) ) ( not ( = ?auto_14480 ?auto_14497 ) ) ( not ( = ?auto_14480 ?auto_14501 ) ) ( not ( = ?auto_14505 ?auto_14502 ) ) ( not ( = ?auto_14505 ?auto_14510 ) ) ( not ( = ?auto_14505 ?auto_14511 ) ) ( not ( = ?auto_14505 ?auto_14500 ) ) ( not ( = ?auto_14505 ?auto_14489 ) ) ( not ( = ?auto_14505 ?auto_14503 ) ) ( not ( = ?auto_14505 ?auto_14497 ) ) ( not ( = ?auto_14505 ?auto_14501 ) ) ( not ( = ?auto_14471 ?auto_14482 ) ) ( not ( = ?auto_14471 ?auto_14491 ) ) ( not ( = ?auto_14472 ?auto_14482 ) ) ( not ( = ?auto_14472 ?auto_14491 ) ) ( not ( = ?auto_14473 ?auto_14482 ) ) ( not ( = ?auto_14473 ?auto_14491 ) ) ( not ( = ?auto_14474 ?auto_14482 ) ) ( not ( = ?auto_14474 ?auto_14491 ) ) ( not ( = ?auto_14475 ?auto_14482 ) ) ( not ( = ?auto_14475 ?auto_14491 ) ) ( not ( = ?auto_14476 ?auto_14482 ) ) ( not ( = ?auto_14476 ?auto_14491 ) ) ( not ( = ?auto_14479 ?auto_14482 ) ) ( not ( = ?auto_14479 ?auto_14491 ) ) ( not ( = ?auto_14478 ?auto_14482 ) ) ( not ( = ?auto_14478 ?auto_14491 ) ) ( not ( = ?auto_14477 ?auto_14482 ) ) ( not ( = ?auto_14477 ?auto_14491 ) ) ( not ( = ?auto_14482 ?auto_14505 ) ) ( not ( = ?auto_14482 ?auto_14502 ) ) ( not ( = ?auto_14482 ?auto_14510 ) ) ( not ( = ?auto_14482 ?auto_14511 ) ) ( not ( = ?auto_14482 ?auto_14500 ) ) ( not ( = ?auto_14482 ?auto_14489 ) ) ( not ( = ?auto_14482 ?auto_14503 ) ) ( not ( = ?auto_14482 ?auto_14497 ) ) ( not ( = ?auto_14482 ?auto_14501 ) ) ( not ( = ?auto_14509 ?auto_14504 ) ) ( not ( = ?auto_14509 ?auto_14494 ) ) ( not ( = ?auto_14509 ?auto_14492 ) ) ( not ( = ?auto_14509 ?auto_14487 ) ) ( not ( = ?auto_14509 ?auto_14507 ) ) ( not ( = ?auto_14509 ?auto_14499 ) ) ( not ( = ?auto_14509 ?auto_14490 ) ) ( not ( = ?auto_14506 ?auto_14495 ) ) ( not ( = ?auto_14506 ?auto_14512 ) ) ( not ( = ?auto_14506 ?auto_14508 ) ) ( not ( = ?auto_14506 ?auto_14488 ) ) ( not ( = ?auto_14506 ?auto_14498 ) ) ( not ( = ?auto_14506 ?auto_14493 ) ) ( not ( = ?auto_14506 ?auto_14496 ) ) ( not ( = ?auto_14491 ?auto_14505 ) ) ( not ( = ?auto_14491 ?auto_14502 ) ) ( not ( = ?auto_14491 ?auto_14510 ) ) ( not ( = ?auto_14491 ?auto_14511 ) ) ( not ( = ?auto_14491 ?auto_14500 ) ) ( not ( = ?auto_14491 ?auto_14489 ) ) ( not ( = ?auto_14491 ?auto_14503 ) ) ( not ( = ?auto_14491 ?auto_14497 ) ) ( not ( = ?auto_14491 ?auto_14501 ) ) ( not ( = ?auto_14471 ?auto_14481 ) ) ( not ( = ?auto_14471 ?auto_14486 ) ) ( not ( = ?auto_14472 ?auto_14481 ) ) ( not ( = ?auto_14472 ?auto_14486 ) ) ( not ( = ?auto_14473 ?auto_14481 ) ) ( not ( = ?auto_14473 ?auto_14486 ) ) ( not ( = ?auto_14474 ?auto_14481 ) ) ( not ( = ?auto_14474 ?auto_14486 ) ) ( not ( = ?auto_14475 ?auto_14481 ) ) ( not ( = ?auto_14475 ?auto_14486 ) ) ( not ( = ?auto_14476 ?auto_14481 ) ) ( not ( = ?auto_14476 ?auto_14486 ) ) ( not ( = ?auto_14479 ?auto_14481 ) ) ( not ( = ?auto_14479 ?auto_14486 ) ) ( not ( = ?auto_14478 ?auto_14481 ) ) ( not ( = ?auto_14478 ?auto_14486 ) ) ( not ( = ?auto_14477 ?auto_14481 ) ) ( not ( = ?auto_14477 ?auto_14486 ) ) ( not ( = ?auto_14480 ?auto_14481 ) ) ( not ( = ?auto_14480 ?auto_14486 ) ) ( not ( = ?auto_14481 ?auto_14491 ) ) ( not ( = ?auto_14481 ?auto_14505 ) ) ( not ( = ?auto_14481 ?auto_14502 ) ) ( not ( = ?auto_14481 ?auto_14510 ) ) ( not ( = ?auto_14481 ?auto_14511 ) ) ( not ( = ?auto_14481 ?auto_14500 ) ) ( not ( = ?auto_14481 ?auto_14489 ) ) ( not ( = ?auto_14481 ?auto_14503 ) ) ( not ( = ?auto_14481 ?auto_14497 ) ) ( not ( = ?auto_14481 ?auto_14501 ) ) ( not ( = ?auto_14486 ?auto_14491 ) ) ( not ( = ?auto_14486 ?auto_14505 ) ) ( not ( = ?auto_14486 ?auto_14502 ) ) ( not ( = ?auto_14486 ?auto_14510 ) ) ( not ( = ?auto_14486 ?auto_14511 ) ) ( not ( = ?auto_14486 ?auto_14500 ) ) ( not ( = ?auto_14486 ?auto_14489 ) ) ( not ( = ?auto_14486 ?auto_14503 ) ) ( not ( = ?auto_14486 ?auto_14497 ) ) ( not ( = ?auto_14486 ?auto_14501 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_14471 ?auto_14472 ?auto_14473 ?auto_14474 ?auto_14475 ?auto_14476 ?auto_14479 ?auto_14478 ?auto_14477 ?auto_14480 ?auto_14482 )
      ( MAKE-1CRATE ?auto_14482 ?auto_14481 )
      ( MAKE-11CRATE-VERIFY ?auto_14471 ?auto_14472 ?auto_14473 ?auto_14474 ?auto_14475 ?auto_14476 ?auto_14479 ?auto_14478 ?auto_14477 ?auto_14480 ?auto_14482 ?auto_14481 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14515 - SURFACE
      ?auto_14516 - SURFACE
    )
    :vars
    (
      ?auto_14517 - HOIST
      ?auto_14518 - PLACE
      ?auto_14520 - PLACE
      ?auto_14521 - HOIST
      ?auto_14522 - SURFACE
      ?auto_14519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14517 ?auto_14518 ) ( SURFACE-AT ?auto_14515 ?auto_14518 ) ( CLEAR ?auto_14515 ) ( IS-CRATE ?auto_14516 ) ( AVAILABLE ?auto_14517 ) ( not ( = ?auto_14520 ?auto_14518 ) ) ( HOIST-AT ?auto_14521 ?auto_14520 ) ( AVAILABLE ?auto_14521 ) ( SURFACE-AT ?auto_14516 ?auto_14520 ) ( ON ?auto_14516 ?auto_14522 ) ( CLEAR ?auto_14516 ) ( TRUCK-AT ?auto_14519 ?auto_14518 ) ( not ( = ?auto_14515 ?auto_14516 ) ) ( not ( = ?auto_14515 ?auto_14522 ) ) ( not ( = ?auto_14516 ?auto_14522 ) ) ( not ( = ?auto_14517 ?auto_14521 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14519 ?auto_14518 ?auto_14520 )
      ( !LIFT ?auto_14521 ?auto_14516 ?auto_14522 ?auto_14520 )
      ( !LOAD ?auto_14521 ?auto_14516 ?auto_14519 ?auto_14520 )
      ( !DRIVE ?auto_14519 ?auto_14520 ?auto_14518 )
      ( !UNLOAD ?auto_14517 ?auto_14516 ?auto_14519 ?auto_14518 )
      ( !DROP ?auto_14517 ?auto_14516 ?auto_14515 ?auto_14518 )
      ( MAKE-1CRATE-VERIFY ?auto_14515 ?auto_14516 ) )
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
      ?auto_14544 - SURFACE
      ?auto_14543 - SURFACE
      ?auto_14542 - SURFACE
      ?auto_14545 - SURFACE
      ?auto_14547 - SURFACE
      ?auto_14546 - SURFACE
      ?auto_14548 - SURFACE
    )
    :vars
    (
      ?auto_14549 - HOIST
      ?auto_14550 - PLACE
      ?auto_14551 - PLACE
      ?auto_14553 - HOIST
      ?auto_14554 - SURFACE
      ?auto_14570 - PLACE
      ?auto_14560 - HOIST
      ?auto_14575 - SURFACE
      ?auto_14567 - SURFACE
      ?auto_14559 - PLACE
      ?auto_14569 - HOIST
      ?auto_14568 - SURFACE
      ?auto_14579 - PLACE
      ?auto_14566 - HOIST
      ?auto_14571 - SURFACE
      ?auto_14563 - PLACE
      ?auto_14556 - HOIST
      ?auto_14574 - SURFACE
      ?auto_14565 - SURFACE
      ?auto_14577 - SURFACE
      ?auto_14562 - PLACE
      ?auto_14555 - HOIST
      ?auto_14564 - SURFACE
      ?auto_14578 - PLACE
      ?auto_14576 - HOIST
      ?auto_14557 - SURFACE
      ?auto_14561 - PLACE
      ?auto_14572 - HOIST
      ?auto_14558 - SURFACE
      ?auto_14573 - SURFACE
      ?auto_14552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14549 ?auto_14550 ) ( IS-CRATE ?auto_14548 ) ( not ( = ?auto_14551 ?auto_14550 ) ) ( HOIST-AT ?auto_14553 ?auto_14551 ) ( SURFACE-AT ?auto_14548 ?auto_14551 ) ( ON ?auto_14548 ?auto_14554 ) ( CLEAR ?auto_14548 ) ( not ( = ?auto_14546 ?auto_14548 ) ) ( not ( = ?auto_14546 ?auto_14554 ) ) ( not ( = ?auto_14548 ?auto_14554 ) ) ( not ( = ?auto_14549 ?auto_14553 ) ) ( IS-CRATE ?auto_14546 ) ( not ( = ?auto_14570 ?auto_14550 ) ) ( HOIST-AT ?auto_14560 ?auto_14570 ) ( SURFACE-AT ?auto_14546 ?auto_14570 ) ( ON ?auto_14546 ?auto_14575 ) ( CLEAR ?auto_14546 ) ( not ( = ?auto_14547 ?auto_14546 ) ) ( not ( = ?auto_14547 ?auto_14575 ) ) ( not ( = ?auto_14546 ?auto_14575 ) ) ( not ( = ?auto_14549 ?auto_14560 ) ) ( IS-CRATE ?auto_14547 ) ( AVAILABLE ?auto_14553 ) ( SURFACE-AT ?auto_14547 ?auto_14551 ) ( ON ?auto_14547 ?auto_14567 ) ( CLEAR ?auto_14547 ) ( not ( = ?auto_14545 ?auto_14547 ) ) ( not ( = ?auto_14545 ?auto_14567 ) ) ( not ( = ?auto_14547 ?auto_14567 ) ) ( IS-CRATE ?auto_14545 ) ( not ( = ?auto_14559 ?auto_14550 ) ) ( HOIST-AT ?auto_14569 ?auto_14559 ) ( SURFACE-AT ?auto_14545 ?auto_14559 ) ( ON ?auto_14545 ?auto_14568 ) ( CLEAR ?auto_14545 ) ( not ( = ?auto_14542 ?auto_14545 ) ) ( not ( = ?auto_14542 ?auto_14568 ) ) ( not ( = ?auto_14545 ?auto_14568 ) ) ( not ( = ?auto_14549 ?auto_14569 ) ) ( IS-CRATE ?auto_14542 ) ( not ( = ?auto_14579 ?auto_14550 ) ) ( HOIST-AT ?auto_14566 ?auto_14579 ) ( AVAILABLE ?auto_14566 ) ( SURFACE-AT ?auto_14542 ?auto_14579 ) ( ON ?auto_14542 ?auto_14571 ) ( CLEAR ?auto_14542 ) ( not ( = ?auto_14543 ?auto_14542 ) ) ( not ( = ?auto_14543 ?auto_14571 ) ) ( not ( = ?auto_14542 ?auto_14571 ) ) ( not ( = ?auto_14549 ?auto_14566 ) ) ( IS-CRATE ?auto_14543 ) ( not ( = ?auto_14563 ?auto_14550 ) ) ( HOIST-AT ?auto_14556 ?auto_14563 ) ( AVAILABLE ?auto_14556 ) ( SURFACE-AT ?auto_14543 ?auto_14563 ) ( ON ?auto_14543 ?auto_14574 ) ( CLEAR ?auto_14543 ) ( not ( = ?auto_14544 ?auto_14543 ) ) ( not ( = ?auto_14544 ?auto_14574 ) ) ( not ( = ?auto_14543 ?auto_14574 ) ) ( not ( = ?auto_14549 ?auto_14556 ) ) ( IS-CRATE ?auto_14544 ) ( AVAILABLE ?auto_14560 ) ( SURFACE-AT ?auto_14544 ?auto_14570 ) ( ON ?auto_14544 ?auto_14565 ) ( CLEAR ?auto_14544 ) ( not ( = ?auto_14541 ?auto_14544 ) ) ( not ( = ?auto_14541 ?auto_14565 ) ) ( not ( = ?auto_14544 ?auto_14565 ) ) ( IS-CRATE ?auto_14541 ) ( AVAILABLE ?auto_14569 ) ( SURFACE-AT ?auto_14541 ?auto_14559 ) ( ON ?auto_14541 ?auto_14577 ) ( CLEAR ?auto_14541 ) ( not ( = ?auto_14540 ?auto_14541 ) ) ( not ( = ?auto_14540 ?auto_14577 ) ) ( not ( = ?auto_14541 ?auto_14577 ) ) ( IS-CRATE ?auto_14540 ) ( not ( = ?auto_14562 ?auto_14550 ) ) ( HOIST-AT ?auto_14555 ?auto_14562 ) ( AVAILABLE ?auto_14555 ) ( SURFACE-AT ?auto_14540 ?auto_14562 ) ( ON ?auto_14540 ?auto_14564 ) ( CLEAR ?auto_14540 ) ( not ( = ?auto_14539 ?auto_14540 ) ) ( not ( = ?auto_14539 ?auto_14564 ) ) ( not ( = ?auto_14540 ?auto_14564 ) ) ( not ( = ?auto_14549 ?auto_14555 ) ) ( IS-CRATE ?auto_14539 ) ( not ( = ?auto_14578 ?auto_14550 ) ) ( HOIST-AT ?auto_14576 ?auto_14578 ) ( AVAILABLE ?auto_14576 ) ( SURFACE-AT ?auto_14539 ?auto_14578 ) ( ON ?auto_14539 ?auto_14557 ) ( CLEAR ?auto_14539 ) ( not ( = ?auto_14538 ?auto_14539 ) ) ( not ( = ?auto_14538 ?auto_14557 ) ) ( not ( = ?auto_14539 ?auto_14557 ) ) ( not ( = ?auto_14549 ?auto_14576 ) ) ( IS-CRATE ?auto_14538 ) ( not ( = ?auto_14561 ?auto_14550 ) ) ( HOIST-AT ?auto_14572 ?auto_14561 ) ( SURFACE-AT ?auto_14538 ?auto_14561 ) ( ON ?auto_14538 ?auto_14558 ) ( CLEAR ?auto_14538 ) ( not ( = ?auto_14537 ?auto_14538 ) ) ( not ( = ?auto_14537 ?auto_14558 ) ) ( not ( = ?auto_14538 ?auto_14558 ) ) ( not ( = ?auto_14549 ?auto_14572 ) ) ( SURFACE-AT ?auto_14536 ?auto_14550 ) ( CLEAR ?auto_14536 ) ( IS-CRATE ?auto_14537 ) ( AVAILABLE ?auto_14549 ) ( AVAILABLE ?auto_14572 ) ( SURFACE-AT ?auto_14537 ?auto_14561 ) ( ON ?auto_14537 ?auto_14573 ) ( CLEAR ?auto_14537 ) ( TRUCK-AT ?auto_14552 ?auto_14550 ) ( not ( = ?auto_14536 ?auto_14537 ) ) ( not ( = ?auto_14536 ?auto_14573 ) ) ( not ( = ?auto_14537 ?auto_14573 ) ) ( not ( = ?auto_14536 ?auto_14538 ) ) ( not ( = ?auto_14536 ?auto_14558 ) ) ( not ( = ?auto_14538 ?auto_14573 ) ) ( not ( = ?auto_14558 ?auto_14573 ) ) ( not ( = ?auto_14536 ?auto_14539 ) ) ( not ( = ?auto_14536 ?auto_14557 ) ) ( not ( = ?auto_14537 ?auto_14539 ) ) ( not ( = ?auto_14537 ?auto_14557 ) ) ( not ( = ?auto_14539 ?auto_14558 ) ) ( not ( = ?auto_14539 ?auto_14573 ) ) ( not ( = ?auto_14578 ?auto_14561 ) ) ( not ( = ?auto_14576 ?auto_14572 ) ) ( not ( = ?auto_14557 ?auto_14558 ) ) ( not ( = ?auto_14557 ?auto_14573 ) ) ( not ( = ?auto_14536 ?auto_14540 ) ) ( not ( = ?auto_14536 ?auto_14564 ) ) ( not ( = ?auto_14537 ?auto_14540 ) ) ( not ( = ?auto_14537 ?auto_14564 ) ) ( not ( = ?auto_14538 ?auto_14540 ) ) ( not ( = ?auto_14538 ?auto_14564 ) ) ( not ( = ?auto_14540 ?auto_14557 ) ) ( not ( = ?auto_14540 ?auto_14558 ) ) ( not ( = ?auto_14540 ?auto_14573 ) ) ( not ( = ?auto_14562 ?auto_14578 ) ) ( not ( = ?auto_14562 ?auto_14561 ) ) ( not ( = ?auto_14555 ?auto_14576 ) ) ( not ( = ?auto_14555 ?auto_14572 ) ) ( not ( = ?auto_14564 ?auto_14557 ) ) ( not ( = ?auto_14564 ?auto_14558 ) ) ( not ( = ?auto_14564 ?auto_14573 ) ) ( not ( = ?auto_14536 ?auto_14541 ) ) ( not ( = ?auto_14536 ?auto_14577 ) ) ( not ( = ?auto_14537 ?auto_14541 ) ) ( not ( = ?auto_14537 ?auto_14577 ) ) ( not ( = ?auto_14538 ?auto_14541 ) ) ( not ( = ?auto_14538 ?auto_14577 ) ) ( not ( = ?auto_14539 ?auto_14541 ) ) ( not ( = ?auto_14539 ?auto_14577 ) ) ( not ( = ?auto_14541 ?auto_14564 ) ) ( not ( = ?auto_14541 ?auto_14557 ) ) ( not ( = ?auto_14541 ?auto_14558 ) ) ( not ( = ?auto_14541 ?auto_14573 ) ) ( not ( = ?auto_14559 ?auto_14562 ) ) ( not ( = ?auto_14559 ?auto_14578 ) ) ( not ( = ?auto_14559 ?auto_14561 ) ) ( not ( = ?auto_14569 ?auto_14555 ) ) ( not ( = ?auto_14569 ?auto_14576 ) ) ( not ( = ?auto_14569 ?auto_14572 ) ) ( not ( = ?auto_14577 ?auto_14564 ) ) ( not ( = ?auto_14577 ?auto_14557 ) ) ( not ( = ?auto_14577 ?auto_14558 ) ) ( not ( = ?auto_14577 ?auto_14573 ) ) ( not ( = ?auto_14536 ?auto_14544 ) ) ( not ( = ?auto_14536 ?auto_14565 ) ) ( not ( = ?auto_14537 ?auto_14544 ) ) ( not ( = ?auto_14537 ?auto_14565 ) ) ( not ( = ?auto_14538 ?auto_14544 ) ) ( not ( = ?auto_14538 ?auto_14565 ) ) ( not ( = ?auto_14539 ?auto_14544 ) ) ( not ( = ?auto_14539 ?auto_14565 ) ) ( not ( = ?auto_14540 ?auto_14544 ) ) ( not ( = ?auto_14540 ?auto_14565 ) ) ( not ( = ?auto_14544 ?auto_14577 ) ) ( not ( = ?auto_14544 ?auto_14564 ) ) ( not ( = ?auto_14544 ?auto_14557 ) ) ( not ( = ?auto_14544 ?auto_14558 ) ) ( not ( = ?auto_14544 ?auto_14573 ) ) ( not ( = ?auto_14570 ?auto_14559 ) ) ( not ( = ?auto_14570 ?auto_14562 ) ) ( not ( = ?auto_14570 ?auto_14578 ) ) ( not ( = ?auto_14570 ?auto_14561 ) ) ( not ( = ?auto_14560 ?auto_14569 ) ) ( not ( = ?auto_14560 ?auto_14555 ) ) ( not ( = ?auto_14560 ?auto_14576 ) ) ( not ( = ?auto_14560 ?auto_14572 ) ) ( not ( = ?auto_14565 ?auto_14577 ) ) ( not ( = ?auto_14565 ?auto_14564 ) ) ( not ( = ?auto_14565 ?auto_14557 ) ) ( not ( = ?auto_14565 ?auto_14558 ) ) ( not ( = ?auto_14565 ?auto_14573 ) ) ( not ( = ?auto_14536 ?auto_14543 ) ) ( not ( = ?auto_14536 ?auto_14574 ) ) ( not ( = ?auto_14537 ?auto_14543 ) ) ( not ( = ?auto_14537 ?auto_14574 ) ) ( not ( = ?auto_14538 ?auto_14543 ) ) ( not ( = ?auto_14538 ?auto_14574 ) ) ( not ( = ?auto_14539 ?auto_14543 ) ) ( not ( = ?auto_14539 ?auto_14574 ) ) ( not ( = ?auto_14540 ?auto_14543 ) ) ( not ( = ?auto_14540 ?auto_14574 ) ) ( not ( = ?auto_14541 ?auto_14543 ) ) ( not ( = ?auto_14541 ?auto_14574 ) ) ( not ( = ?auto_14543 ?auto_14565 ) ) ( not ( = ?auto_14543 ?auto_14577 ) ) ( not ( = ?auto_14543 ?auto_14564 ) ) ( not ( = ?auto_14543 ?auto_14557 ) ) ( not ( = ?auto_14543 ?auto_14558 ) ) ( not ( = ?auto_14543 ?auto_14573 ) ) ( not ( = ?auto_14563 ?auto_14570 ) ) ( not ( = ?auto_14563 ?auto_14559 ) ) ( not ( = ?auto_14563 ?auto_14562 ) ) ( not ( = ?auto_14563 ?auto_14578 ) ) ( not ( = ?auto_14563 ?auto_14561 ) ) ( not ( = ?auto_14556 ?auto_14560 ) ) ( not ( = ?auto_14556 ?auto_14569 ) ) ( not ( = ?auto_14556 ?auto_14555 ) ) ( not ( = ?auto_14556 ?auto_14576 ) ) ( not ( = ?auto_14556 ?auto_14572 ) ) ( not ( = ?auto_14574 ?auto_14565 ) ) ( not ( = ?auto_14574 ?auto_14577 ) ) ( not ( = ?auto_14574 ?auto_14564 ) ) ( not ( = ?auto_14574 ?auto_14557 ) ) ( not ( = ?auto_14574 ?auto_14558 ) ) ( not ( = ?auto_14574 ?auto_14573 ) ) ( not ( = ?auto_14536 ?auto_14542 ) ) ( not ( = ?auto_14536 ?auto_14571 ) ) ( not ( = ?auto_14537 ?auto_14542 ) ) ( not ( = ?auto_14537 ?auto_14571 ) ) ( not ( = ?auto_14538 ?auto_14542 ) ) ( not ( = ?auto_14538 ?auto_14571 ) ) ( not ( = ?auto_14539 ?auto_14542 ) ) ( not ( = ?auto_14539 ?auto_14571 ) ) ( not ( = ?auto_14540 ?auto_14542 ) ) ( not ( = ?auto_14540 ?auto_14571 ) ) ( not ( = ?auto_14541 ?auto_14542 ) ) ( not ( = ?auto_14541 ?auto_14571 ) ) ( not ( = ?auto_14544 ?auto_14542 ) ) ( not ( = ?auto_14544 ?auto_14571 ) ) ( not ( = ?auto_14542 ?auto_14574 ) ) ( not ( = ?auto_14542 ?auto_14565 ) ) ( not ( = ?auto_14542 ?auto_14577 ) ) ( not ( = ?auto_14542 ?auto_14564 ) ) ( not ( = ?auto_14542 ?auto_14557 ) ) ( not ( = ?auto_14542 ?auto_14558 ) ) ( not ( = ?auto_14542 ?auto_14573 ) ) ( not ( = ?auto_14579 ?auto_14563 ) ) ( not ( = ?auto_14579 ?auto_14570 ) ) ( not ( = ?auto_14579 ?auto_14559 ) ) ( not ( = ?auto_14579 ?auto_14562 ) ) ( not ( = ?auto_14579 ?auto_14578 ) ) ( not ( = ?auto_14579 ?auto_14561 ) ) ( not ( = ?auto_14566 ?auto_14556 ) ) ( not ( = ?auto_14566 ?auto_14560 ) ) ( not ( = ?auto_14566 ?auto_14569 ) ) ( not ( = ?auto_14566 ?auto_14555 ) ) ( not ( = ?auto_14566 ?auto_14576 ) ) ( not ( = ?auto_14566 ?auto_14572 ) ) ( not ( = ?auto_14571 ?auto_14574 ) ) ( not ( = ?auto_14571 ?auto_14565 ) ) ( not ( = ?auto_14571 ?auto_14577 ) ) ( not ( = ?auto_14571 ?auto_14564 ) ) ( not ( = ?auto_14571 ?auto_14557 ) ) ( not ( = ?auto_14571 ?auto_14558 ) ) ( not ( = ?auto_14571 ?auto_14573 ) ) ( not ( = ?auto_14536 ?auto_14545 ) ) ( not ( = ?auto_14536 ?auto_14568 ) ) ( not ( = ?auto_14537 ?auto_14545 ) ) ( not ( = ?auto_14537 ?auto_14568 ) ) ( not ( = ?auto_14538 ?auto_14545 ) ) ( not ( = ?auto_14538 ?auto_14568 ) ) ( not ( = ?auto_14539 ?auto_14545 ) ) ( not ( = ?auto_14539 ?auto_14568 ) ) ( not ( = ?auto_14540 ?auto_14545 ) ) ( not ( = ?auto_14540 ?auto_14568 ) ) ( not ( = ?auto_14541 ?auto_14545 ) ) ( not ( = ?auto_14541 ?auto_14568 ) ) ( not ( = ?auto_14544 ?auto_14545 ) ) ( not ( = ?auto_14544 ?auto_14568 ) ) ( not ( = ?auto_14543 ?auto_14545 ) ) ( not ( = ?auto_14543 ?auto_14568 ) ) ( not ( = ?auto_14545 ?auto_14571 ) ) ( not ( = ?auto_14545 ?auto_14574 ) ) ( not ( = ?auto_14545 ?auto_14565 ) ) ( not ( = ?auto_14545 ?auto_14577 ) ) ( not ( = ?auto_14545 ?auto_14564 ) ) ( not ( = ?auto_14545 ?auto_14557 ) ) ( not ( = ?auto_14545 ?auto_14558 ) ) ( not ( = ?auto_14545 ?auto_14573 ) ) ( not ( = ?auto_14568 ?auto_14571 ) ) ( not ( = ?auto_14568 ?auto_14574 ) ) ( not ( = ?auto_14568 ?auto_14565 ) ) ( not ( = ?auto_14568 ?auto_14577 ) ) ( not ( = ?auto_14568 ?auto_14564 ) ) ( not ( = ?auto_14568 ?auto_14557 ) ) ( not ( = ?auto_14568 ?auto_14558 ) ) ( not ( = ?auto_14568 ?auto_14573 ) ) ( not ( = ?auto_14536 ?auto_14547 ) ) ( not ( = ?auto_14536 ?auto_14567 ) ) ( not ( = ?auto_14537 ?auto_14547 ) ) ( not ( = ?auto_14537 ?auto_14567 ) ) ( not ( = ?auto_14538 ?auto_14547 ) ) ( not ( = ?auto_14538 ?auto_14567 ) ) ( not ( = ?auto_14539 ?auto_14547 ) ) ( not ( = ?auto_14539 ?auto_14567 ) ) ( not ( = ?auto_14540 ?auto_14547 ) ) ( not ( = ?auto_14540 ?auto_14567 ) ) ( not ( = ?auto_14541 ?auto_14547 ) ) ( not ( = ?auto_14541 ?auto_14567 ) ) ( not ( = ?auto_14544 ?auto_14547 ) ) ( not ( = ?auto_14544 ?auto_14567 ) ) ( not ( = ?auto_14543 ?auto_14547 ) ) ( not ( = ?auto_14543 ?auto_14567 ) ) ( not ( = ?auto_14542 ?auto_14547 ) ) ( not ( = ?auto_14542 ?auto_14567 ) ) ( not ( = ?auto_14547 ?auto_14568 ) ) ( not ( = ?auto_14547 ?auto_14571 ) ) ( not ( = ?auto_14547 ?auto_14574 ) ) ( not ( = ?auto_14547 ?auto_14565 ) ) ( not ( = ?auto_14547 ?auto_14577 ) ) ( not ( = ?auto_14547 ?auto_14564 ) ) ( not ( = ?auto_14547 ?auto_14557 ) ) ( not ( = ?auto_14547 ?auto_14558 ) ) ( not ( = ?auto_14547 ?auto_14573 ) ) ( not ( = ?auto_14551 ?auto_14559 ) ) ( not ( = ?auto_14551 ?auto_14579 ) ) ( not ( = ?auto_14551 ?auto_14563 ) ) ( not ( = ?auto_14551 ?auto_14570 ) ) ( not ( = ?auto_14551 ?auto_14562 ) ) ( not ( = ?auto_14551 ?auto_14578 ) ) ( not ( = ?auto_14551 ?auto_14561 ) ) ( not ( = ?auto_14553 ?auto_14569 ) ) ( not ( = ?auto_14553 ?auto_14566 ) ) ( not ( = ?auto_14553 ?auto_14556 ) ) ( not ( = ?auto_14553 ?auto_14560 ) ) ( not ( = ?auto_14553 ?auto_14555 ) ) ( not ( = ?auto_14553 ?auto_14576 ) ) ( not ( = ?auto_14553 ?auto_14572 ) ) ( not ( = ?auto_14567 ?auto_14568 ) ) ( not ( = ?auto_14567 ?auto_14571 ) ) ( not ( = ?auto_14567 ?auto_14574 ) ) ( not ( = ?auto_14567 ?auto_14565 ) ) ( not ( = ?auto_14567 ?auto_14577 ) ) ( not ( = ?auto_14567 ?auto_14564 ) ) ( not ( = ?auto_14567 ?auto_14557 ) ) ( not ( = ?auto_14567 ?auto_14558 ) ) ( not ( = ?auto_14567 ?auto_14573 ) ) ( not ( = ?auto_14536 ?auto_14546 ) ) ( not ( = ?auto_14536 ?auto_14575 ) ) ( not ( = ?auto_14537 ?auto_14546 ) ) ( not ( = ?auto_14537 ?auto_14575 ) ) ( not ( = ?auto_14538 ?auto_14546 ) ) ( not ( = ?auto_14538 ?auto_14575 ) ) ( not ( = ?auto_14539 ?auto_14546 ) ) ( not ( = ?auto_14539 ?auto_14575 ) ) ( not ( = ?auto_14540 ?auto_14546 ) ) ( not ( = ?auto_14540 ?auto_14575 ) ) ( not ( = ?auto_14541 ?auto_14546 ) ) ( not ( = ?auto_14541 ?auto_14575 ) ) ( not ( = ?auto_14544 ?auto_14546 ) ) ( not ( = ?auto_14544 ?auto_14575 ) ) ( not ( = ?auto_14543 ?auto_14546 ) ) ( not ( = ?auto_14543 ?auto_14575 ) ) ( not ( = ?auto_14542 ?auto_14546 ) ) ( not ( = ?auto_14542 ?auto_14575 ) ) ( not ( = ?auto_14545 ?auto_14546 ) ) ( not ( = ?auto_14545 ?auto_14575 ) ) ( not ( = ?auto_14546 ?auto_14567 ) ) ( not ( = ?auto_14546 ?auto_14568 ) ) ( not ( = ?auto_14546 ?auto_14571 ) ) ( not ( = ?auto_14546 ?auto_14574 ) ) ( not ( = ?auto_14546 ?auto_14565 ) ) ( not ( = ?auto_14546 ?auto_14577 ) ) ( not ( = ?auto_14546 ?auto_14564 ) ) ( not ( = ?auto_14546 ?auto_14557 ) ) ( not ( = ?auto_14546 ?auto_14558 ) ) ( not ( = ?auto_14546 ?auto_14573 ) ) ( not ( = ?auto_14575 ?auto_14567 ) ) ( not ( = ?auto_14575 ?auto_14568 ) ) ( not ( = ?auto_14575 ?auto_14571 ) ) ( not ( = ?auto_14575 ?auto_14574 ) ) ( not ( = ?auto_14575 ?auto_14565 ) ) ( not ( = ?auto_14575 ?auto_14577 ) ) ( not ( = ?auto_14575 ?auto_14564 ) ) ( not ( = ?auto_14575 ?auto_14557 ) ) ( not ( = ?auto_14575 ?auto_14558 ) ) ( not ( = ?auto_14575 ?auto_14573 ) ) ( not ( = ?auto_14536 ?auto_14548 ) ) ( not ( = ?auto_14536 ?auto_14554 ) ) ( not ( = ?auto_14537 ?auto_14548 ) ) ( not ( = ?auto_14537 ?auto_14554 ) ) ( not ( = ?auto_14538 ?auto_14548 ) ) ( not ( = ?auto_14538 ?auto_14554 ) ) ( not ( = ?auto_14539 ?auto_14548 ) ) ( not ( = ?auto_14539 ?auto_14554 ) ) ( not ( = ?auto_14540 ?auto_14548 ) ) ( not ( = ?auto_14540 ?auto_14554 ) ) ( not ( = ?auto_14541 ?auto_14548 ) ) ( not ( = ?auto_14541 ?auto_14554 ) ) ( not ( = ?auto_14544 ?auto_14548 ) ) ( not ( = ?auto_14544 ?auto_14554 ) ) ( not ( = ?auto_14543 ?auto_14548 ) ) ( not ( = ?auto_14543 ?auto_14554 ) ) ( not ( = ?auto_14542 ?auto_14548 ) ) ( not ( = ?auto_14542 ?auto_14554 ) ) ( not ( = ?auto_14545 ?auto_14548 ) ) ( not ( = ?auto_14545 ?auto_14554 ) ) ( not ( = ?auto_14547 ?auto_14548 ) ) ( not ( = ?auto_14547 ?auto_14554 ) ) ( not ( = ?auto_14548 ?auto_14575 ) ) ( not ( = ?auto_14548 ?auto_14567 ) ) ( not ( = ?auto_14548 ?auto_14568 ) ) ( not ( = ?auto_14548 ?auto_14571 ) ) ( not ( = ?auto_14548 ?auto_14574 ) ) ( not ( = ?auto_14548 ?auto_14565 ) ) ( not ( = ?auto_14548 ?auto_14577 ) ) ( not ( = ?auto_14548 ?auto_14564 ) ) ( not ( = ?auto_14548 ?auto_14557 ) ) ( not ( = ?auto_14548 ?auto_14558 ) ) ( not ( = ?auto_14548 ?auto_14573 ) ) ( not ( = ?auto_14554 ?auto_14575 ) ) ( not ( = ?auto_14554 ?auto_14567 ) ) ( not ( = ?auto_14554 ?auto_14568 ) ) ( not ( = ?auto_14554 ?auto_14571 ) ) ( not ( = ?auto_14554 ?auto_14574 ) ) ( not ( = ?auto_14554 ?auto_14565 ) ) ( not ( = ?auto_14554 ?auto_14577 ) ) ( not ( = ?auto_14554 ?auto_14564 ) ) ( not ( = ?auto_14554 ?auto_14557 ) ) ( not ( = ?auto_14554 ?auto_14558 ) ) ( not ( = ?auto_14554 ?auto_14573 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_14536 ?auto_14537 ?auto_14538 ?auto_14539 ?auto_14540 ?auto_14541 ?auto_14544 ?auto_14543 ?auto_14542 ?auto_14545 ?auto_14547 ?auto_14546 )
      ( MAKE-1CRATE ?auto_14546 ?auto_14548 )
      ( MAKE-12CRATE-VERIFY ?auto_14536 ?auto_14537 ?auto_14538 ?auto_14539 ?auto_14540 ?auto_14541 ?auto_14544 ?auto_14543 ?auto_14542 ?auto_14545 ?auto_14547 ?auto_14546 ?auto_14548 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14582 - SURFACE
      ?auto_14583 - SURFACE
    )
    :vars
    (
      ?auto_14584 - HOIST
      ?auto_14585 - PLACE
      ?auto_14587 - PLACE
      ?auto_14588 - HOIST
      ?auto_14589 - SURFACE
      ?auto_14586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14584 ?auto_14585 ) ( SURFACE-AT ?auto_14582 ?auto_14585 ) ( CLEAR ?auto_14582 ) ( IS-CRATE ?auto_14583 ) ( AVAILABLE ?auto_14584 ) ( not ( = ?auto_14587 ?auto_14585 ) ) ( HOIST-AT ?auto_14588 ?auto_14587 ) ( AVAILABLE ?auto_14588 ) ( SURFACE-AT ?auto_14583 ?auto_14587 ) ( ON ?auto_14583 ?auto_14589 ) ( CLEAR ?auto_14583 ) ( TRUCK-AT ?auto_14586 ?auto_14585 ) ( not ( = ?auto_14582 ?auto_14583 ) ) ( not ( = ?auto_14582 ?auto_14589 ) ) ( not ( = ?auto_14583 ?auto_14589 ) ) ( not ( = ?auto_14584 ?auto_14588 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14586 ?auto_14585 ?auto_14587 )
      ( !LIFT ?auto_14588 ?auto_14583 ?auto_14589 ?auto_14587 )
      ( !LOAD ?auto_14588 ?auto_14583 ?auto_14586 ?auto_14587 )
      ( !DRIVE ?auto_14586 ?auto_14587 ?auto_14585 )
      ( !UNLOAD ?auto_14584 ?auto_14583 ?auto_14586 ?auto_14585 )
      ( !DROP ?auto_14584 ?auto_14583 ?auto_14582 ?auto_14585 )
      ( MAKE-1CRATE-VERIFY ?auto_14582 ?auto_14583 ) )
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
      ?auto_14612 - SURFACE
      ?auto_14611 - SURFACE
      ?auto_14610 - SURFACE
      ?auto_14613 - SURFACE
      ?auto_14615 - SURFACE
      ?auto_14614 - SURFACE
      ?auto_14616 - SURFACE
      ?auto_14617 - SURFACE
    )
    :vars
    (
      ?auto_14618 - HOIST
      ?auto_14622 - PLACE
      ?auto_14623 - PLACE
      ?auto_14620 - HOIST
      ?auto_14621 - SURFACE
      ?auto_14635 - PLACE
      ?auto_14625 - HOIST
      ?auto_14638 - SURFACE
      ?auto_14631 - PLACE
      ?auto_14624 - HOIST
      ?auto_14632 - SURFACE
      ?auto_14648 - SURFACE
      ?auto_14629 - PLACE
      ?auto_14636 - HOIST
      ?auto_14626 - SURFACE
      ?auto_14647 - PLACE
      ?auto_14630 - HOIST
      ?auto_14642 - SURFACE
      ?auto_14633 - PLACE
      ?auto_14634 - HOIST
      ?auto_14645 - SURFACE
      ?auto_14639 - SURFACE
      ?auto_14637 - SURFACE
      ?auto_14627 - PLACE
      ?auto_14640 - HOIST
      ?auto_14644 - SURFACE
      ?auto_14649 - PLACE
      ?auto_14628 - HOIST
      ?auto_14646 - SURFACE
      ?auto_14643 - SURFACE
      ?auto_14641 - SURFACE
      ?auto_14619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14618 ?auto_14622 ) ( IS-CRATE ?auto_14617 ) ( not ( = ?auto_14623 ?auto_14622 ) ) ( HOIST-AT ?auto_14620 ?auto_14623 ) ( SURFACE-AT ?auto_14617 ?auto_14623 ) ( ON ?auto_14617 ?auto_14621 ) ( CLEAR ?auto_14617 ) ( not ( = ?auto_14616 ?auto_14617 ) ) ( not ( = ?auto_14616 ?auto_14621 ) ) ( not ( = ?auto_14617 ?auto_14621 ) ) ( not ( = ?auto_14618 ?auto_14620 ) ) ( IS-CRATE ?auto_14616 ) ( not ( = ?auto_14635 ?auto_14622 ) ) ( HOIST-AT ?auto_14625 ?auto_14635 ) ( SURFACE-AT ?auto_14616 ?auto_14635 ) ( ON ?auto_14616 ?auto_14638 ) ( CLEAR ?auto_14616 ) ( not ( = ?auto_14614 ?auto_14616 ) ) ( not ( = ?auto_14614 ?auto_14638 ) ) ( not ( = ?auto_14616 ?auto_14638 ) ) ( not ( = ?auto_14618 ?auto_14625 ) ) ( IS-CRATE ?auto_14614 ) ( not ( = ?auto_14631 ?auto_14622 ) ) ( HOIST-AT ?auto_14624 ?auto_14631 ) ( SURFACE-AT ?auto_14614 ?auto_14631 ) ( ON ?auto_14614 ?auto_14632 ) ( CLEAR ?auto_14614 ) ( not ( = ?auto_14615 ?auto_14614 ) ) ( not ( = ?auto_14615 ?auto_14632 ) ) ( not ( = ?auto_14614 ?auto_14632 ) ) ( not ( = ?auto_14618 ?auto_14624 ) ) ( IS-CRATE ?auto_14615 ) ( AVAILABLE ?auto_14625 ) ( SURFACE-AT ?auto_14615 ?auto_14635 ) ( ON ?auto_14615 ?auto_14648 ) ( CLEAR ?auto_14615 ) ( not ( = ?auto_14613 ?auto_14615 ) ) ( not ( = ?auto_14613 ?auto_14648 ) ) ( not ( = ?auto_14615 ?auto_14648 ) ) ( IS-CRATE ?auto_14613 ) ( not ( = ?auto_14629 ?auto_14622 ) ) ( HOIST-AT ?auto_14636 ?auto_14629 ) ( SURFACE-AT ?auto_14613 ?auto_14629 ) ( ON ?auto_14613 ?auto_14626 ) ( CLEAR ?auto_14613 ) ( not ( = ?auto_14610 ?auto_14613 ) ) ( not ( = ?auto_14610 ?auto_14626 ) ) ( not ( = ?auto_14613 ?auto_14626 ) ) ( not ( = ?auto_14618 ?auto_14636 ) ) ( IS-CRATE ?auto_14610 ) ( not ( = ?auto_14647 ?auto_14622 ) ) ( HOIST-AT ?auto_14630 ?auto_14647 ) ( AVAILABLE ?auto_14630 ) ( SURFACE-AT ?auto_14610 ?auto_14647 ) ( ON ?auto_14610 ?auto_14642 ) ( CLEAR ?auto_14610 ) ( not ( = ?auto_14611 ?auto_14610 ) ) ( not ( = ?auto_14611 ?auto_14642 ) ) ( not ( = ?auto_14610 ?auto_14642 ) ) ( not ( = ?auto_14618 ?auto_14630 ) ) ( IS-CRATE ?auto_14611 ) ( not ( = ?auto_14633 ?auto_14622 ) ) ( HOIST-AT ?auto_14634 ?auto_14633 ) ( AVAILABLE ?auto_14634 ) ( SURFACE-AT ?auto_14611 ?auto_14633 ) ( ON ?auto_14611 ?auto_14645 ) ( CLEAR ?auto_14611 ) ( not ( = ?auto_14612 ?auto_14611 ) ) ( not ( = ?auto_14612 ?auto_14645 ) ) ( not ( = ?auto_14611 ?auto_14645 ) ) ( not ( = ?auto_14618 ?auto_14634 ) ) ( IS-CRATE ?auto_14612 ) ( AVAILABLE ?auto_14624 ) ( SURFACE-AT ?auto_14612 ?auto_14631 ) ( ON ?auto_14612 ?auto_14639 ) ( CLEAR ?auto_14612 ) ( not ( = ?auto_14609 ?auto_14612 ) ) ( not ( = ?auto_14609 ?auto_14639 ) ) ( not ( = ?auto_14612 ?auto_14639 ) ) ( IS-CRATE ?auto_14609 ) ( AVAILABLE ?auto_14636 ) ( SURFACE-AT ?auto_14609 ?auto_14629 ) ( ON ?auto_14609 ?auto_14637 ) ( CLEAR ?auto_14609 ) ( not ( = ?auto_14608 ?auto_14609 ) ) ( not ( = ?auto_14608 ?auto_14637 ) ) ( not ( = ?auto_14609 ?auto_14637 ) ) ( IS-CRATE ?auto_14608 ) ( not ( = ?auto_14627 ?auto_14622 ) ) ( HOIST-AT ?auto_14640 ?auto_14627 ) ( AVAILABLE ?auto_14640 ) ( SURFACE-AT ?auto_14608 ?auto_14627 ) ( ON ?auto_14608 ?auto_14644 ) ( CLEAR ?auto_14608 ) ( not ( = ?auto_14607 ?auto_14608 ) ) ( not ( = ?auto_14607 ?auto_14644 ) ) ( not ( = ?auto_14608 ?auto_14644 ) ) ( not ( = ?auto_14618 ?auto_14640 ) ) ( IS-CRATE ?auto_14607 ) ( not ( = ?auto_14649 ?auto_14622 ) ) ( HOIST-AT ?auto_14628 ?auto_14649 ) ( AVAILABLE ?auto_14628 ) ( SURFACE-AT ?auto_14607 ?auto_14649 ) ( ON ?auto_14607 ?auto_14646 ) ( CLEAR ?auto_14607 ) ( not ( = ?auto_14606 ?auto_14607 ) ) ( not ( = ?auto_14606 ?auto_14646 ) ) ( not ( = ?auto_14607 ?auto_14646 ) ) ( not ( = ?auto_14618 ?auto_14628 ) ) ( IS-CRATE ?auto_14606 ) ( SURFACE-AT ?auto_14606 ?auto_14623 ) ( ON ?auto_14606 ?auto_14643 ) ( CLEAR ?auto_14606 ) ( not ( = ?auto_14605 ?auto_14606 ) ) ( not ( = ?auto_14605 ?auto_14643 ) ) ( not ( = ?auto_14606 ?auto_14643 ) ) ( SURFACE-AT ?auto_14604 ?auto_14622 ) ( CLEAR ?auto_14604 ) ( IS-CRATE ?auto_14605 ) ( AVAILABLE ?auto_14618 ) ( AVAILABLE ?auto_14620 ) ( SURFACE-AT ?auto_14605 ?auto_14623 ) ( ON ?auto_14605 ?auto_14641 ) ( CLEAR ?auto_14605 ) ( TRUCK-AT ?auto_14619 ?auto_14622 ) ( not ( = ?auto_14604 ?auto_14605 ) ) ( not ( = ?auto_14604 ?auto_14641 ) ) ( not ( = ?auto_14605 ?auto_14641 ) ) ( not ( = ?auto_14604 ?auto_14606 ) ) ( not ( = ?auto_14604 ?auto_14643 ) ) ( not ( = ?auto_14606 ?auto_14641 ) ) ( not ( = ?auto_14643 ?auto_14641 ) ) ( not ( = ?auto_14604 ?auto_14607 ) ) ( not ( = ?auto_14604 ?auto_14646 ) ) ( not ( = ?auto_14605 ?auto_14607 ) ) ( not ( = ?auto_14605 ?auto_14646 ) ) ( not ( = ?auto_14607 ?auto_14643 ) ) ( not ( = ?auto_14607 ?auto_14641 ) ) ( not ( = ?auto_14649 ?auto_14623 ) ) ( not ( = ?auto_14628 ?auto_14620 ) ) ( not ( = ?auto_14646 ?auto_14643 ) ) ( not ( = ?auto_14646 ?auto_14641 ) ) ( not ( = ?auto_14604 ?auto_14608 ) ) ( not ( = ?auto_14604 ?auto_14644 ) ) ( not ( = ?auto_14605 ?auto_14608 ) ) ( not ( = ?auto_14605 ?auto_14644 ) ) ( not ( = ?auto_14606 ?auto_14608 ) ) ( not ( = ?auto_14606 ?auto_14644 ) ) ( not ( = ?auto_14608 ?auto_14646 ) ) ( not ( = ?auto_14608 ?auto_14643 ) ) ( not ( = ?auto_14608 ?auto_14641 ) ) ( not ( = ?auto_14627 ?auto_14649 ) ) ( not ( = ?auto_14627 ?auto_14623 ) ) ( not ( = ?auto_14640 ?auto_14628 ) ) ( not ( = ?auto_14640 ?auto_14620 ) ) ( not ( = ?auto_14644 ?auto_14646 ) ) ( not ( = ?auto_14644 ?auto_14643 ) ) ( not ( = ?auto_14644 ?auto_14641 ) ) ( not ( = ?auto_14604 ?auto_14609 ) ) ( not ( = ?auto_14604 ?auto_14637 ) ) ( not ( = ?auto_14605 ?auto_14609 ) ) ( not ( = ?auto_14605 ?auto_14637 ) ) ( not ( = ?auto_14606 ?auto_14609 ) ) ( not ( = ?auto_14606 ?auto_14637 ) ) ( not ( = ?auto_14607 ?auto_14609 ) ) ( not ( = ?auto_14607 ?auto_14637 ) ) ( not ( = ?auto_14609 ?auto_14644 ) ) ( not ( = ?auto_14609 ?auto_14646 ) ) ( not ( = ?auto_14609 ?auto_14643 ) ) ( not ( = ?auto_14609 ?auto_14641 ) ) ( not ( = ?auto_14629 ?auto_14627 ) ) ( not ( = ?auto_14629 ?auto_14649 ) ) ( not ( = ?auto_14629 ?auto_14623 ) ) ( not ( = ?auto_14636 ?auto_14640 ) ) ( not ( = ?auto_14636 ?auto_14628 ) ) ( not ( = ?auto_14636 ?auto_14620 ) ) ( not ( = ?auto_14637 ?auto_14644 ) ) ( not ( = ?auto_14637 ?auto_14646 ) ) ( not ( = ?auto_14637 ?auto_14643 ) ) ( not ( = ?auto_14637 ?auto_14641 ) ) ( not ( = ?auto_14604 ?auto_14612 ) ) ( not ( = ?auto_14604 ?auto_14639 ) ) ( not ( = ?auto_14605 ?auto_14612 ) ) ( not ( = ?auto_14605 ?auto_14639 ) ) ( not ( = ?auto_14606 ?auto_14612 ) ) ( not ( = ?auto_14606 ?auto_14639 ) ) ( not ( = ?auto_14607 ?auto_14612 ) ) ( not ( = ?auto_14607 ?auto_14639 ) ) ( not ( = ?auto_14608 ?auto_14612 ) ) ( not ( = ?auto_14608 ?auto_14639 ) ) ( not ( = ?auto_14612 ?auto_14637 ) ) ( not ( = ?auto_14612 ?auto_14644 ) ) ( not ( = ?auto_14612 ?auto_14646 ) ) ( not ( = ?auto_14612 ?auto_14643 ) ) ( not ( = ?auto_14612 ?auto_14641 ) ) ( not ( = ?auto_14631 ?auto_14629 ) ) ( not ( = ?auto_14631 ?auto_14627 ) ) ( not ( = ?auto_14631 ?auto_14649 ) ) ( not ( = ?auto_14631 ?auto_14623 ) ) ( not ( = ?auto_14624 ?auto_14636 ) ) ( not ( = ?auto_14624 ?auto_14640 ) ) ( not ( = ?auto_14624 ?auto_14628 ) ) ( not ( = ?auto_14624 ?auto_14620 ) ) ( not ( = ?auto_14639 ?auto_14637 ) ) ( not ( = ?auto_14639 ?auto_14644 ) ) ( not ( = ?auto_14639 ?auto_14646 ) ) ( not ( = ?auto_14639 ?auto_14643 ) ) ( not ( = ?auto_14639 ?auto_14641 ) ) ( not ( = ?auto_14604 ?auto_14611 ) ) ( not ( = ?auto_14604 ?auto_14645 ) ) ( not ( = ?auto_14605 ?auto_14611 ) ) ( not ( = ?auto_14605 ?auto_14645 ) ) ( not ( = ?auto_14606 ?auto_14611 ) ) ( not ( = ?auto_14606 ?auto_14645 ) ) ( not ( = ?auto_14607 ?auto_14611 ) ) ( not ( = ?auto_14607 ?auto_14645 ) ) ( not ( = ?auto_14608 ?auto_14611 ) ) ( not ( = ?auto_14608 ?auto_14645 ) ) ( not ( = ?auto_14609 ?auto_14611 ) ) ( not ( = ?auto_14609 ?auto_14645 ) ) ( not ( = ?auto_14611 ?auto_14639 ) ) ( not ( = ?auto_14611 ?auto_14637 ) ) ( not ( = ?auto_14611 ?auto_14644 ) ) ( not ( = ?auto_14611 ?auto_14646 ) ) ( not ( = ?auto_14611 ?auto_14643 ) ) ( not ( = ?auto_14611 ?auto_14641 ) ) ( not ( = ?auto_14633 ?auto_14631 ) ) ( not ( = ?auto_14633 ?auto_14629 ) ) ( not ( = ?auto_14633 ?auto_14627 ) ) ( not ( = ?auto_14633 ?auto_14649 ) ) ( not ( = ?auto_14633 ?auto_14623 ) ) ( not ( = ?auto_14634 ?auto_14624 ) ) ( not ( = ?auto_14634 ?auto_14636 ) ) ( not ( = ?auto_14634 ?auto_14640 ) ) ( not ( = ?auto_14634 ?auto_14628 ) ) ( not ( = ?auto_14634 ?auto_14620 ) ) ( not ( = ?auto_14645 ?auto_14639 ) ) ( not ( = ?auto_14645 ?auto_14637 ) ) ( not ( = ?auto_14645 ?auto_14644 ) ) ( not ( = ?auto_14645 ?auto_14646 ) ) ( not ( = ?auto_14645 ?auto_14643 ) ) ( not ( = ?auto_14645 ?auto_14641 ) ) ( not ( = ?auto_14604 ?auto_14610 ) ) ( not ( = ?auto_14604 ?auto_14642 ) ) ( not ( = ?auto_14605 ?auto_14610 ) ) ( not ( = ?auto_14605 ?auto_14642 ) ) ( not ( = ?auto_14606 ?auto_14610 ) ) ( not ( = ?auto_14606 ?auto_14642 ) ) ( not ( = ?auto_14607 ?auto_14610 ) ) ( not ( = ?auto_14607 ?auto_14642 ) ) ( not ( = ?auto_14608 ?auto_14610 ) ) ( not ( = ?auto_14608 ?auto_14642 ) ) ( not ( = ?auto_14609 ?auto_14610 ) ) ( not ( = ?auto_14609 ?auto_14642 ) ) ( not ( = ?auto_14612 ?auto_14610 ) ) ( not ( = ?auto_14612 ?auto_14642 ) ) ( not ( = ?auto_14610 ?auto_14645 ) ) ( not ( = ?auto_14610 ?auto_14639 ) ) ( not ( = ?auto_14610 ?auto_14637 ) ) ( not ( = ?auto_14610 ?auto_14644 ) ) ( not ( = ?auto_14610 ?auto_14646 ) ) ( not ( = ?auto_14610 ?auto_14643 ) ) ( not ( = ?auto_14610 ?auto_14641 ) ) ( not ( = ?auto_14647 ?auto_14633 ) ) ( not ( = ?auto_14647 ?auto_14631 ) ) ( not ( = ?auto_14647 ?auto_14629 ) ) ( not ( = ?auto_14647 ?auto_14627 ) ) ( not ( = ?auto_14647 ?auto_14649 ) ) ( not ( = ?auto_14647 ?auto_14623 ) ) ( not ( = ?auto_14630 ?auto_14634 ) ) ( not ( = ?auto_14630 ?auto_14624 ) ) ( not ( = ?auto_14630 ?auto_14636 ) ) ( not ( = ?auto_14630 ?auto_14640 ) ) ( not ( = ?auto_14630 ?auto_14628 ) ) ( not ( = ?auto_14630 ?auto_14620 ) ) ( not ( = ?auto_14642 ?auto_14645 ) ) ( not ( = ?auto_14642 ?auto_14639 ) ) ( not ( = ?auto_14642 ?auto_14637 ) ) ( not ( = ?auto_14642 ?auto_14644 ) ) ( not ( = ?auto_14642 ?auto_14646 ) ) ( not ( = ?auto_14642 ?auto_14643 ) ) ( not ( = ?auto_14642 ?auto_14641 ) ) ( not ( = ?auto_14604 ?auto_14613 ) ) ( not ( = ?auto_14604 ?auto_14626 ) ) ( not ( = ?auto_14605 ?auto_14613 ) ) ( not ( = ?auto_14605 ?auto_14626 ) ) ( not ( = ?auto_14606 ?auto_14613 ) ) ( not ( = ?auto_14606 ?auto_14626 ) ) ( not ( = ?auto_14607 ?auto_14613 ) ) ( not ( = ?auto_14607 ?auto_14626 ) ) ( not ( = ?auto_14608 ?auto_14613 ) ) ( not ( = ?auto_14608 ?auto_14626 ) ) ( not ( = ?auto_14609 ?auto_14613 ) ) ( not ( = ?auto_14609 ?auto_14626 ) ) ( not ( = ?auto_14612 ?auto_14613 ) ) ( not ( = ?auto_14612 ?auto_14626 ) ) ( not ( = ?auto_14611 ?auto_14613 ) ) ( not ( = ?auto_14611 ?auto_14626 ) ) ( not ( = ?auto_14613 ?auto_14642 ) ) ( not ( = ?auto_14613 ?auto_14645 ) ) ( not ( = ?auto_14613 ?auto_14639 ) ) ( not ( = ?auto_14613 ?auto_14637 ) ) ( not ( = ?auto_14613 ?auto_14644 ) ) ( not ( = ?auto_14613 ?auto_14646 ) ) ( not ( = ?auto_14613 ?auto_14643 ) ) ( not ( = ?auto_14613 ?auto_14641 ) ) ( not ( = ?auto_14626 ?auto_14642 ) ) ( not ( = ?auto_14626 ?auto_14645 ) ) ( not ( = ?auto_14626 ?auto_14639 ) ) ( not ( = ?auto_14626 ?auto_14637 ) ) ( not ( = ?auto_14626 ?auto_14644 ) ) ( not ( = ?auto_14626 ?auto_14646 ) ) ( not ( = ?auto_14626 ?auto_14643 ) ) ( not ( = ?auto_14626 ?auto_14641 ) ) ( not ( = ?auto_14604 ?auto_14615 ) ) ( not ( = ?auto_14604 ?auto_14648 ) ) ( not ( = ?auto_14605 ?auto_14615 ) ) ( not ( = ?auto_14605 ?auto_14648 ) ) ( not ( = ?auto_14606 ?auto_14615 ) ) ( not ( = ?auto_14606 ?auto_14648 ) ) ( not ( = ?auto_14607 ?auto_14615 ) ) ( not ( = ?auto_14607 ?auto_14648 ) ) ( not ( = ?auto_14608 ?auto_14615 ) ) ( not ( = ?auto_14608 ?auto_14648 ) ) ( not ( = ?auto_14609 ?auto_14615 ) ) ( not ( = ?auto_14609 ?auto_14648 ) ) ( not ( = ?auto_14612 ?auto_14615 ) ) ( not ( = ?auto_14612 ?auto_14648 ) ) ( not ( = ?auto_14611 ?auto_14615 ) ) ( not ( = ?auto_14611 ?auto_14648 ) ) ( not ( = ?auto_14610 ?auto_14615 ) ) ( not ( = ?auto_14610 ?auto_14648 ) ) ( not ( = ?auto_14615 ?auto_14626 ) ) ( not ( = ?auto_14615 ?auto_14642 ) ) ( not ( = ?auto_14615 ?auto_14645 ) ) ( not ( = ?auto_14615 ?auto_14639 ) ) ( not ( = ?auto_14615 ?auto_14637 ) ) ( not ( = ?auto_14615 ?auto_14644 ) ) ( not ( = ?auto_14615 ?auto_14646 ) ) ( not ( = ?auto_14615 ?auto_14643 ) ) ( not ( = ?auto_14615 ?auto_14641 ) ) ( not ( = ?auto_14635 ?auto_14629 ) ) ( not ( = ?auto_14635 ?auto_14647 ) ) ( not ( = ?auto_14635 ?auto_14633 ) ) ( not ( = ?auto_14635 ?auto_14631 ) ) ( not ( = ?auto_14635 ?auto_14627 ) ) ( not ( = ?auto_14635 ?auto_14649 ) ) ( not ( = ?auto_14635 ?auto_14623 ) ) ( not ( = ?auto_14625 ?auto_14636 ) ) ( not ( = ?auto_14625 ?auto_14630 ) ) ( not ( = ?auto_14625 ?auto_14634 ) ) ( not ( = ?auto_14625 ?auto_14624 ) ) ( not ( = ?auto_14625 ?auto_14640 ) ) ( not ( = ?auto_14625 ?auto_14628 ) ) ( not ( = ?auto_14625 ?auto_14620 ) ) ( not ( = ?auto_14648 ?auto_14626 ) ) ( not ( = ?auto_14648 ?auto_14642 ) ) ( not ( = ?auto_14648 ?auto_14645 ) ) ( not ( = ?auto_14648 ?auto_14639 ) ) ( not ( = ?auto_14648 ?auto_14637 ) ) ( not ( = ?auto_14648 ?auto_14644 ) ) ( not ( = ?auto_14648 ?auto_14646 ) ) ( not ( = ?auto_14648 ?auto_14643 ) ) ( not ( = ?auto_14648 ?auto_14641 ) ) ( not ( = ?auto_14604 ?auto_14614 ) ) ( not ( = ?auto_14604 ?auto_14632 ) ) ( not ( = ?auto_14605 ?auto_14614 ) ) ( not ( = ?auto_14605 ?auto_14632 ) ) ( not ( = ?auto_14606 ?auto_14614 ) ) ( not ( = ?auto_14606 ?auto_14632 ) ) ( not ( = ?auto_14607 ?auto_14614 ) ) ( not ( = ?auto_14607 ?auto_14632 ) ) ( not ( = ?auto_14608 ?auto_14614 ) ) ( not ( = ?auto_14608 ?auto_14632 ) ) ( not ( = ?auto_14609 ?auto_14614 ) ) ( not ( = ?auto_14609 ?auto_14632 ) ) ( not ( = ?auto_14612 ?auto_14614 ) ) ( not ( = ?auto_14612 ?auto_14632 ) ) ( not ( = ?auto_14611 ?auto_14614 ) ) ( not ( = ?auto_14611 ?auto_14632 ) ) ( not ( = ?auto_14610 ?auto_14614 ) ) ( not ( = ?auto_14610 ?auto_14632 ) ) ( not ( = ?auto_14613 ?auto_14614 ) ) ( not ( = ?auto_14613 ?auto_14632 ) ) ( not ( = ?auto_14614 ?auto_14648 ) ) ( not ( = ?auto_14614 ?auto_14626 ) ) ( not ( = ?auto_14614 ?auto_14642 ) ) ( not ( = ?auto_14614 ?auto_14645 ) ) ( not ( = ?auto_14614 ?auto_14639 ) ) ( not ( = ?auto_14614 ?auto_14637 ) ) ( not ( = ?auto_14614 ?auto_14644 ) ) ( not ( = ?auto_14614 ?auto_14646 ) ) ( not ( = ?auto_14614 ?auto_14643 ) ) ( not ( = ?auto_14614 ?auto_14641 ) ) ( not ( = ?auto_14632 ?auto_14648 ) ) ( not ( = ?auto_14632 ?auto_14626 ) ) ( not ( = ?auto_14632 ?auto_14642 ) ) ( not ( = ?auto_14632 ?auto_14645 ) ) ( not ( = ?auto_14632 ?auto_14639 ) ) ( not ( = ?auto_14632 ?auto_14637 ) ) ( not ( = ?auto_14632 ?auto_14644 ) ) ( not ( = ?auto_14632 ?auto_14646 ) ) ( not ( = ?auto_14632 ?auto_14643 ) ) ( not ( = ?auto_14632 ?auto_14641 ) ) ( not ( = ?auto_14604 ?auto_14616 ) ) ( not ( = ?auto_14604 ?auto_14638 ) ) ( not ( = ?auto_14605 ?auto_14616 ) ) ( not ( = ?auto_14605 ?auto_14638 ) ) ( not ( = ?auto_14606 ?auto_14616 ) ) ( not ( = ?auto_14606 ?auto_14638 ) ) ( not ( = ?auto_14607 ?auto_14616 ) ) ( not ( = ?auto_14607 ?auto_14638 ) ) ( not ( = ?auto_14608 ?auto_14616 ) ) ( not ( = ?auto_14608 ?auto_14638 ) ) ( not ( = ?auto_14609 ?auto_14616 ) ) ( not ( = ?auto_14609 ?auto_14638 ) ) ( not ( = ?auto_14612 ?auto_14616 ) ) ( not ( = ?auto_14612 ?auto_14638 ) ) ( not ( = ?auto_14611 ?auto_14616 ) ) ( not ( = ?auto_14611 ?auto_14638 ) ) ( not ( = ?auto_14610 ?auto_14616 ) ) ( not ( = ?auto_14610 ?auto_14638 ) ) ( not ( = ?auto_14613 ?auto_14616 ) ) ( not ( = ?auto_14613 ?auto_14638 ) ) ( not ( = ?auto_14615 ?auto_14616 ) ) ( not ( = ?auto_14615 ?auto_14638 ) ) ( not ( = ?auto_14616 ?auto_14632 ) ) ( not ( = ?auto_14616 ?auto_14648 ) ) ( not ( = ?auto_14616 ?auto_14626 ) ) ( not ( = ?auto_14616 ?auto_14642 ) ) ( not ( = ?auto_14616 ?auto_14645 ) ) ( not ( = ?auto_14616 ?auto_14639 ) ) ( not ( = ?auto_14616 ?auto_14637 ) ) ( not ( = ?auto_14616 ?auto_14644 ) ) ( not ( = ?auto_14616 ?auto_14646 ) ) ( not ( = ?auto_14616 ?auto_14643 ) ) ( not ( = ?auto_14616 ?auto_14641 ) ) ( not ( = ?auto_14638 ?auto_14632 ) ) ( not ( = ?auto_14638 ?auto_14648 ) ) ( not ( = ?auto_14638 ?auto_14626 ) ) ( not ( = ?auto_14638 ?auto_14642 ) ) ( not ( = ?auto_14638 ?auto_14645 ) ) ( not ( = ?auto_14638 ?auto_14639 ) ) ( not ( = ?auto_14638 ?auto_14637 ) ) ( not ( = ?auto_14638 ?auto_14644 ) ) ( not ( = ?auto_14638 ?auto_14646 ) ) ( not ( = ?auto_14638 ?auto_14643 ) ) ( not ( = ?auto_14638 ?auto_14641 ) ) ( not ( = ?auto_14604 ?auto_14617 ) ) ( not ( = ?auto_14604 ?auto_14621 ) ) ( not ( = ?auto_14605 ?auto_14617 ) ) ( not ( = ?auto_14605 ?auto_14621 ) ) ( not ( = ?auto_14606 ?auto_14617 ) ) ( not ( = ?auto_14606 ?auto_14621 ) ) ( not ( = ?auto_14607 ?auto_14617 ) ) ( not ( = ?auto_14607 ?auto_14621 ) ) ( not ( = ?auto_14608 ?auto_14617 ) ) ( not ( = ?auto_14608 ?auto_14621 ) ) ( not ( = ?auto_14609 ?auto_14617 ) ) ( not ( = ?auto_14609 ?auto_14621 ) ) ( not ( = ?auto_14612 ?auto_14617 ) ) ( not ( = ?auto_14612 ?auto_14621 ) ) ( not ( = ?auto_14611 ?auto_14617 ) ) ( not ( = ?auto_14611 ?auto_14621 ) ) ( not ( = ?auto_14610 ?auto_14617 ) ) ( not ( = ?auto_14610 ?auto_14621 ) ) ( not ( = ?auto_14613 ?auto_14617 ) ) ( not ( = ?auto_14613 ?auto_14621 ) ) ( not ( = ?auto_14615 ?auto_14617 ) ) ( not ( = ?auto_14615 ?auto_14621 ) ) ( not ( = ?auto_14614 ?auto_14617 ) ) ( not ( = ?auto_14614 ?auto_14621 ) ) ( not ( = ?auto_14617 ?auto_14638 ) ) ( not ( = ?auto_14617 ?auto_14632 ) ) ( not ( = ?auto_14617 ?auto_14648 ) ) ( not ( = ?auto_14617 ?auto_14626 ) ) ( not ( = ?auto_14617 ?auto_14642 ) ) ( not ( = ?auto_14617 ?auto_14645 ) ) ( not ( = ?auto_14617 ?auto_14639 ) ) ( not ( = ?auto_14617 ?auto_14637 ) ) ( not ( = ?auto_14617 ?auto_14644 ) ) ( not ( = ?auto_14617 ?auto_14646 ) ) ( not ( = ?auto_14617 ?auto_14643 ) ) ( not ( = ?auto_14617 ?auto_14641 ) ) ( not ( = ?auto_14621 ?auto_14638 ) ) ( not ( = ?auto_14621 ?auto_14632 ) ) ( not ( = ?auto_14621 ?auto_14648 ) ) ( not ( = ?auto_14621 ?auto_14626 ) ) ( not ( = ?auto_14621 ?auto_14642 ) ) ( not ( = ?auto_14621 ?auto_14645 ) ) ( not ( = ?auto_14621 ?auto_14639 ) ) ( not ( = ?auto_14621 ?auto_14637 ) ) ( not ( = ?auto_14621 ?auto_14644 ) ) ( not ( = ?auto_14621 ?auto_14646 ) ) ( not ( = ?auto_14621 ?auto_14643 ) ) ( not ( = ?auto_14621 ?auto_14641 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_14604 ?auto_14605 ?auto_14606 ?auto_14607 ?auto_14608 ?auto_14609 ?auto_14612 ?auto_14611 ?auto_14610 ?auto_14613 ?auto_14615 ?auto_14614 ?auto_14616 )
      ( MAKE-1CRATE ?auto_14616 ?auto_14617 )
      ( MAKE-13CRATE-VERIFY ?auto_14604 ?auto_14605 ?auto_14606 ?auto_14607 ?auto_14608 ?auto_14609 ?auto_14612 ?auto_14611 ?auto_14610 ?auto_14613 ?auto_14615 ?auto_14614 ?auto_14616 ?auto_14617 ) )
  )

)

