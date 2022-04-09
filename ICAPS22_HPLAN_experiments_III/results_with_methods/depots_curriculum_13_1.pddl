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
      ?auto_14076 - SURFACE
      ?auto_14077 - SURFACE
    )
    :vars
    (
      ?auto_14078 - HOIST
      ?auto_14079 - PLACE
      ?auto_14081 - PLACE
      ?auto_14082 - HOIST
      ?auto_14083 - SURFACE
      ?auto_14080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14078 ?auto_14079 ) ( SURFACE-AT ?auto_14076 ?auto_14079 ) ( CLEAR ?auto_14076 ) ( IS-CRATE ?auto_14077 ) ( AVAILABLE ?auto_14078 ) ( not ( = ?auto_14081 ?auto_14079 ) ) ( HOIST-AT ?auto_14082 ?auto_14081 ) ( AVAILABLE ?auto_14082 ) ( SURFACE-AT ?auto_14077 ?auto_14081 ) ( ON ?auto_14077 ?auto_14083 ) ( CLEAR ?auto_14077 ) ( TRUCK-AT ?auto_14080 ?auto_14079 ) ( not ( = ?auto_14076 ?auto_14077 ) ) ( not ( = ?auto_14076 ?auto_14083 ) ) ( not ( = ?auto_14077 ?auto_14083 ) ) ( not ( = ?auto_14078 ?auto_14082 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14080 ?auto_14079 ?auto_14081 )
      ( !LIFT ?auto_14082 ?auto_14077 ?auto_14083 ?auto_14081 )
      ( !LOAD ?auto_14082 ?auto_14077 ?auto_14080 ?auto_14081 )
      ( !DRIVE ?auto_14080 ?auto_14081 ?auto_14079 )
      ( !UNLOAD ?auto_14078 ?auto_14077 ?auto_14080 ?auto_14079 )
      ( !DROP ?auto_14078 ?auto_14077 ?auto_14076 ?auto_14079 )
      ( MAKE-1CRATE-VERIFY ?auto_14076 ?auto_14077 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14086 - SURFACE
      ?auto_14087 - SURFACE
    )
    :vars
    (
      ?auto_14088 - HOIST
      ?auto_14089 - PLACE
      ?auto_14091 - PLACE
      ?auto_14092 - HOIST
      ?auto_14093 - SURFACE
      ?auto_14090 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14088 ?auto_14089 ) ( SURFACE-AT ?auto_14086 ?auto_14089 ) ( CLEAR ?auto_14086 ) ( IS-CRATE ?auto_14087 ) ( AVAILABLE ?auto_14088 ) ( not ( = ?auto_14091 ?auto_14089 ) ) ( HOIST-AT ?auto_14092 ?auto_14091 ) ( AVAILABLE ?auto_14092 ) ( SURFACE-AT ?auto_14087 ?auto_14091 ) ( ON ?auto_14087 ?auto_14093 ) ( CLEAR ?auto_14087 ) ( TRUCK-AT ?auto_14090 ?auto_14089 ) ( not ( = ?auto_14086 ?auto_14087 ) ) ( not ( = ?auto_14086 ?auto_14093 ) ) ( not ( = ?auto_14087 ?auto_14093 ) ) ( not ( = ?auto_14088 ?auto_14092 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14090 ?auto_14089 ?auto_14091 )
      ( !LIFT ?auto_14092 ?auto_14087 ?auto_14093 ?auto_14091 )
      ( !LOAD ?auto_14092 ?auto_14087 ?auto_14090 ?auto_14091 )
      ( !DRIVE ?auto_14090 ?auto_14091 ?auto_14089 )
      ( !UNLOAD ?auto_14088 ?auto_14087 ?auto_14090 ?auto_14089 )
      ( !DROP ?auto_14088 ?auto_14087 ?auto_14086 ?auto_14089 )
      ( MAKE-1CRATE-VERIFY ?auto_14086 ?auto_14087 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14097 - SURFACE
      ?auto_14098 - SURFACE
      ?auto_14099 - SURFACE
    )
    :vars
    (
      ?auto_14102 - HOIST
      ?auto_14101 - PLACE
      ?auto_14103 - PLACE
      ?auto_14105 - HOIST
      ?auto_14104 - SURFACE
      ?auto_14108 - PLACE
      ?auto_14106 - HOIST
      ?auto_14107 - SURFACE
      ?auto_14100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14102 ?auto_14101 ) ( IS-CRATE ?auto_14099 ) ( not ( = ?auto_14103 ?auto_14101 ) ) ( HOIST-AT ?auto_14105 ?auto_14103 ) ( AVAILABLE ?auto_14105 ) ( SURFACE-AT ?auto_14099 ?auto_14103 ) ( ON ?auto_14099 ?auto_14104 ) ( CLEAR ?auto_14099 ) ( not ( = ?auto_14098 ?auto_14099 ) ) ( not ( = ?auto_14098 ?auto_14104 ) ) ( not ( = ?auto_14099 ?auto_14104 ) ) ( not ( = ?auto_14102 ?auto_14105 ) ) ( SURFACE-AT ?auto_14097 ?auto_14101 ) ( CLEAR ?auto_14097 ) ( IS-CRATE ?auto_14098 ) ( AVAILABLE ?auto_14102 ) ( not ( = ?auto_14108 ?auto_14101 ) ) ( HOIST-AT ?auto_14106 ?auto_14108 ) ( AVAILABLE ?auto_14106 ) ( SURFACE-AT ?auto_14098 ?auto_14108 ) ( ON ?auto_14098 ?auto_14107 ) ( CLEAR ?auto_14098 ) ( TRUCK-AT ?auto_14100 ?auto_14101 ) ( not ( = ?auto_14097 ?auto_14098 ) ) ( not ( = ?auto_14097 ?auto_14107 ) ) ( not ( = ?auto_14098 ?auto_14107 ) ) ( not ( = ?auto_14102 ?auto_14106 ) ) ( not ( = ?auto_14097 ?auto_14099 ) ) ( not ( = ?auto_14097 ?auto_14104 ) ) ( not ( = ?auto_14099 ?auto_14107 ) ) ( not ( = ?auto_14103 ?auto_14108 ) ) ( not ( = ?auto_14105 ?auto_14106 ) ) ( not ( = ?auto_14104 ?auto_14107 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14097 ?auto_14098 )
      ( MAKE-1CRATE ?auto_14098 ?auto_14099 )
      ( MAKE-2CRATE-VERIFY ?auto_14097 ?auto_14098 ?auto_14099 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14111 - SURFACE
      ?auto_14112 - SURFACE
    )
    :vars
    (
      ?auto_14113 - HOIST
      ?auto_14114 - PLACE
      ?auto_14116 - PLACE
      ?auto_14117 - HOIST
      ?auto_14118 - SURFACE
      ?auto_14115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14113 ?auto_14114 ) ( SURFACE-AT ?auto_14111 ?auto_14114 ) ( CLEAR ?auto_14111 ) ( IS-CRATE ?auto_14112 ) ( AVAILABLE ?auto_14113 ) ( not ( = ?auto_14116 ?auto_14114 ) ) ( HOIST-AT ?auto_14117 ?auto_14116 ) ( AVAILABLE ?auto_14117 ) ( SURFACE-AT ?auto_14112 ?auto_14116 ) ( ON ?auto_14112 ?auto_14118 ) ( CLEAR ?auto_14112 ) ( TRUCK-AT ?auto_14115 ?auto_14114 ) ( not ( = ?auto_14111 ?auto_14112 ) ) ( not ( = ?auto_14111 ?auto_14118 ) ) ( not ( = ?auto_14112 ?auto_14118 ) ) ( not ( = ?auto_14113 ?auto_14117 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14115 ?auto_14114 ?auto_14116 )
      ( !LIFT ?auto_14117 ?auto_14112 ?auto_14118 ?auto_14116 )
      ( !LOAD ?auto_14117 ?auto_14112 ?auto_14115 ?auto_14116 )
      ( !DRIVE ?auto_14115 ?auto_14116 ?auto_14114 )
      ( !UNLOAD ?auto_14113 ?auto_14112 ?auto_14115 ?auto_14114 )
      ( !DROP ?auto_14113 ?auto_14112 ?auto_14111 ?auto_14114 )
      ( MAKE-1CRATE-VERIFY ?auto_14111 ?auto_14112 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14123 - SURFACE
      ?auto_14124 - SURFACE
      ?auto_14125 - SURFACE
      ?auto_14126 - SURFACE
    )
    :vars
    (
      ?auto_14129 - HOIST
      ?auto_14130 - PLACE
      ?auto_14132 - PLACE
      ?auto_14128 - HOIST
      ?auto_14131 - SURFACE
      ?auto_14133 - PLACE
      ?auto_14135 - HOIST
      ?auto_14134 - SURFACE
      ?auto_14136 - PLACE
      ?auto_14138 - HOIST
      ?auto_14137 - SURFACE
      ?auto_14127 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14129 ?auto_14130 ) ( IS-CRATE ?auto_14126 ) ( not ( = ?auto_14132 ?auto_14130 ) ) ( HOIST-AT ?auto_14128 ?auto_14132 ) ( AVAILABLE ?auto_14128 ) ( SURFACE-AT ?auto_14126 ?auto_14132 ) ( ON ?auto_14126 ?auto_14131 ) ( CLEAR ?auto_14126 ) ( not ( = ?auto_14125 ?auto_14126 ) ) ( not ( = ?auto_14125 ?auto_14131 ) ) ( not ( = ?auto_14126 ?auto_14131 ) ) ( not ( = ?auto_14129 ?auto_14128 ) ) ( IS-CRATE ?auto_14125 ) ( not ( = ?auto_14133 ?auto_14130 ) ) ( HOIST-AT ?auto_14135 ?auto_14133 ) ( AVAILABLE ?auto_14135 ) ( SURFACE-AT ?auto_14125 ?auto_14133 ) ( ON ?auto_14125 ?auto_14134 ) ( CLEAR ?auto_14125 ) ( not ( = ?auto_14124 ?auto_14125 ) ) ( not ( = ?auto_14124 ?auto_14134 ) ) ( not ( = ?auto_14125 ?auto_14134 ) ) ( not ( = ?auto_14129 ?auto_14135 ) ) ( SURFACE-AT ?auto_14123 ?auto_14130 ) ( CLEAR ?auto_14123 ) ( IS-CRATE ?auto_14124 ) ( AVAILABLE ?auto_14129 ) ( not ( = ?auto_14136 ?auto_14130 ) ) ( HOIST-AT ?auto_14138 ?auto_14136 ) ( AVAILABLE ?auto_14138 ) ( SURFACE-AT ?auto_14124 ?auto_14136 ) ( ON ?auto_14124 ?auto_14137 ) ( CLEAR ?auto_14124 ) ( TRUCK-AT ?auto_14127 ?auto_14130 ) ( not ( = ?auto_14123 ?auto_14124 ) ) ( not ( = ?auto_14123 ?auto_14137 ) ) ( not ( = ?auto_14124 ?auto_14137 ) ) ( not ( = ?auto_14129 ?auto_14138 ) ) ( not ( = ?auto_14123 ?auto_14125 ) ) ( not ( = ?auto_14123 ?auto_14134 ) ) ( not ( = ?auto_14125 ?auto_14137 ) ) ( not ( = ?auto_14133 ?auto_14136 ) ) ( not ( = ?auto_14135 ?auto_14138 ) ) ( not ( = ?auto_14134 ?auto_14137 ) ) ( not ( = ?auto_14123 ?auto_14126 ) ) ( not ( = ?auto_14123 ?auto_14131 ) ) ( not ( = ?auto_14124 ?auto_14126 ) ) ( not ( = ?auto_14124 ?auto_14131 ) ) ( not ( = ?auto_14126 ?auto_14134 ) ) ( not ( = ?auto_14126 ?auto_14137 ) ) ( not ( = ?auto_14132 ?auto_14133 ) ) ( not ( = ?auto_14132 ?auto_14136 ) ) ( not ( = ?auto_14128 ?auto_14135 ) ) ( not ( = ?auto_14128 ?auto_14138 ) ) ( not ( = ?auto_14131 ?auto_14134 ) ) ( not ( = ?auto_14131 ?auto_14137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14123 ?auto_14124 ?auto_14125 )
      ( MAKE-1CRATE ?auto_14125 ?auto_14126 )
      ( MAKE-3CRATE-VERIFY ?auto_14123 ?auto_14124 ?auto_14125 ?auto_14126 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14141 - SURFACE
      ?auto_14142 - SURFACE
    )
    :vars
    (
      ?auto_14143 - HOIST
      ?auto_14144 - PLACE
      ?auto_14146 - PLACE
      ?auto_14147 - HOIST
      ?auto_14148 - SURFACE
      ?auto_14145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14143 ?auto_14144 ) ( SURFACE-AT ?auto_14141 ?auto_14144 ) ( CLEAR ?auto_14141 ) ( IS-CRATE ?auto_14142 ) ( AVAILABLE ?auto_14143 ) ( not ( = ?auto_14146 ?auto_14144 ) ) ( HOIST-AT ?auto_14147 ?auto_14146 ) ( AVAILABLE ?auto_14147 ) ( SURFACE-AT ?auto_14142 ?auto_14146 ) ( ON ?auto_14142 ?auto_14148 ) ( CLEAR ?auto_14142 ) ( TRUCK-AT ?auto_14145 ?auto_14144 ) ( not ( = ?auto_14141 ?auto_14142 ) ) ( not ( = ?auto_14141 ?auto_14148 ) ) ( not ( = ?auto_14142 ?auto_14148 ) ) ( not ( = ?auto_14143 ?auto_14147 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14145 ?auto_14144 ?auto_14146 )
      ( !LIFT ?auto_14147 ?auto_14142 ?auto_14148 ?auto_14146 )
      ( !LOAD ?auto_14147 ?auto_14142 ?auto_14145 ?auto_14146 )
      ( !DRIVE ?auto_14145 ?auto_14146 ?auto_14144 )
      ( !UNLOAD ?auto_14143 ?auto_14142 ?auto_14145 ?auto_14144 )
      ( !DROP ?auto_14143 ?auto_14142 ?auto_14141 ?auto_14144 )
      ( MAKE-1CRATE-VERIFY ?auto_14141 ?auto_14142 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14154 - SURFACE
      ?auto_14155 - SURFACE
      ?auto_14156 - SURFACE
      ?auto_14157 - SURFACE
      ?auto_14158 - SURFACE
    )
    :vars
    (
      ?auto_14162 - HOIST
      ?auto_14163 - PLACE
      ?auto_14161 - PLACE
      ?auto_14160 - HOIST
      ?auto_14159 - SURFACE
      ?auto_14170 - PLACE
      ?auto_14171 - HOIST
      ?auto_14173 - SURFACE
      ?auto_14169 - PLACE
      ?auto_14165 - HOIST
      ?auto_14166 - SURFACE
      ?auto_14167 - PLACE
      ?auto_14172 - HOIST
      ?auto_14168 - SURFACE
      ?auto_14164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14162 ?auto_14163 ) ( IS-CRATE ?auto_14158 ) ( not ( = ?auto_14161 ?auto_14163 ) ) ( HOIST-AT ?auto_14160 ?auto_14161 ) ( AVAILABLE ?auto_14160 ) ( SURFACE-AT ?auto_14158 ?auto_14161 ) ( ON ?auto_14158 ?auto_14159 ) ( CLEAR ?auto_14158 ) ( not ( = ?auto_14157 ?auto_14158 ) ) ( not ( = ?auto_14157 ?auto_14159 ) ) ( not ( = ?auto_14158 ?auto_14159 ) ) ( not ( = ?auto_14162 ?auto_14160 ) ) ( IS-CRATE ?auto_14157 ) ( not ( = ?auto_14170 ?auto_14163 ) ) ( HOIST-AT ?auto_14171 ?auto_14170 ) ( AVAILABLE ?auto_14171 ) ( SURFACE-AT ?auto_14157 ?auto_14170 ) ( ON ?auto_14157 ?auto_14173 ) ( CLEAR ?auto_14157 ) ( not ( = ?auto_14156 ?auto_14157 ) ) ( not ( = ?auto_14156 ?auto_14173 ) ) ( not ( = ?auto_14157 ?auto_14173 ) ) ( not ( = ?auto_14162 ?auto_14171 ) ) ( IS-CRATE ?auto_14156 ) ( not ( = ?auto_14169 ?auto_14163 ) ) ( HOIST-AT ?auto_14165 ?auto_14169 ) ( AVAILABLE ?auto_14165 ) ( SURFACE-AT ?auto_14156 ?auto_14169 ) ( ON ?auto_14156 ?auto_14166 ) ( CLEAR ?auto_14156 ) ( not ( = ?auto_14155 ?auto_14156 ) ) ( not ( = ?auto_14155 ?auto_14166 ) ) ( not ( = ?auto_14156 ?auto_14166 ) ) ( not ( = ?auto_14162 ?auto_14165 ) ) ( SURFACE-AT ?auto_14154 ?auto_14163 ) ( CLEAR ?auto_14154 ) ( IS-CRATE ?auto_14155 ) ( AVAILABLE ?auto_14162 ) ( not ( = ?auto_14167 ?auto_14163 ) ) ( HOIST-AT ?auto_14172 ?auto_14167 ) ( AVAILABLE ?auto_14172 ) ( SURFACE-AT ?auto_14155 ?auto_14167 ) ( ON ?auto_14155 ?auto_14168 ) ( CLEAR ?auto_14155 ) ( TRUCK-AT ?auto_14164 ?auto_14163 ) ( not ( = ?auto_14154 ?auto_14155 ) ) ( not ( = ?auto_14154 ?auto_14168 ) ) ( not ( = ?auto_14155 ?auto_14168 ) ) ( not ( = ?auto_14162 ?auto_14172 ) ) ( not ( = ?auto_14154 ?auto_14156 ) ) ( not ( = ?auto_14154 ?auto_14166 ) ) ( not ( = ?auto_14156 ?auto_14168 ) ) ( not ( = ?auto_14169 ?auto_14167 ) ) ( not ( = ?auto_14165 ?auto_14172 ) ) ( not ( = ?auto_14166 ?auto_14168 ) ) ( not ( = ?auto_14154 ?auto_14157 ) ) ( not ( = ?auto_14154 ?auto_14173 ) ) ( not ( = ?auto_14155 ?auto_14157 ) ) ( not ( = ?auto_14155 ?auto_14173 ) ) ( not ( = ?auto_14157 ?auto_14166 ) ) ( not ( = ?auto_14157 ?auto_14168 ) ) ( not ( = ?auto_14170 ?auto_14169 ) ) ( not ( = ?auto_14170 ?auto_14167 ) ) ( not ( = ?auto_14171 ?auto_14165 ) ) ( not ( = ?auto_14171 ?auto_14172 ) ) ( not ( = ?auto_14173 ?auto_14166 ) ) ( not ( = ?auto_14173 ?auto_14168 ) ) ( not ( = ?auto_14154 ?auto_14158 ) ) ( not ( = ?auto_14154 ?auto_14159 ) ) ( not ( = ?auto_14155 ?auto_14158 ) ) ( not ( = ?auto_14155 ?auto_14159 ) ) ( not ( = ?auto_14156 ?auto_14158 ) ) ( not ( = ?auto_14156 ?auto_14159 ) ) ( not ( = ?auto_14158 ?auto_14173 ) ) ( not ( = ?auto_14158 ?auto_14166 ) ) ( not ( = ?auto_14158 ?auto_14168 ) ) ( not ( = ?auto_14161 ?auto_14170 ) ) ( not ( = ?auto_14161 ?auto_14169 ) ) ( not ( = ?auto_14161 ?auto_14167 ) ) ( not ( = ?auto_14160 ?auto_14171 ) ) ( not ( = ?auto_14160 ?auto_14165 ) ) ( not ( = ?auto_14160 ?auto_14172 ) ) ( not ( = ?auto_14159 ?auto_14173 ) ) ( not ( = ?auto_14159 ?auto_14166 ) ) ( not ( = ?auto_14159 ?auto_14168 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_14154 ?auto_14155 ?auto_14156 ?auto_14157 )
      ( MAKE-1CRATE ?auto_14157 ?auto_14158 )
      ( MAKE-4CRATE-VERIFY ?auto_14154 ?auto_14155 ?auto_14156 ?auto_14157 ?auto_14158 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14176 - SURFACE
      ?auto_14177 - SURFACE
    )
    :vars
    (
      ?auto_14178 - HOIST
      ?auto_14179 - PLACE
      ?auto_14181 - PLACE
      ?auto_14182 - HOIST
      ?auto_14183 - SURFACE
      ?auto_14180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14178 ?auto_14179 ) ( SURFACE-AT ?auto_14176 ?auto_14179 ) ( CLEAR ?auto_14176 ) ( IS-CRATE ?auto_14177 ) ( AVAILABLE ?auto_14178 ) ( not ( = ?auto_14181 ?auto_14179 ) ) ( HOIST-AT ?auto_14182 ?auto_14181 ) ( AVAILABLE ?auto_14182 ) ( SURFACE-AT ?auto_14177 ?auto_14181 ) ( ON ?auto_14177 ?auto_14183 ) ( CLEAR ?auto_14177 ) ( TRUCK-AT ?auto_14180 ?auto_14179 ) ( not ( = ?auto_14176 ?auto_14177 ) ) ( not ( = ?auto_14176 ?auto_14183 ) ) ( not ( = ?auto_14177 ?auto_14183 ) ) ( not ( = ?auto_14178 ?auto_14182 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14180 ?auto_14179 ?auto_14181 )
      ( !LIFT ?auto_14182 ?auto_14177 ?auto_14183 ?auto_14181 )
      ( !LOAD ?auto_14182 ?auto_14177 ?auto_14180 ?auto_14181 )
      ( !DRIVE ?auto_14180 ?auto_14181 ?auto_14179 )
      ( !UNLOAD ?auto_14178 ?auto_14177 ?auto_14180 ?auto_14179 )
      ( !DROP ?auto_14178 ?auto_14177 ?auto_14176 ?auto_14179 )
      ( MAKE-1CRATE-VERIFY ?auto_14176 ?auto_14177 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14190 - SURFACE
      ?auto_14191 - SURFACE
      ?auto_14192 - SURFACE
      ?auto_14193 - SURFACE
      ?auto_14194 - SURFACE
      ?auto_14195 - SURFACE
    )
    :vars
    (
      ?auto_14197 - HOIST
      ?auto_14201 - PLACE
      ?auto_14196 - PLACE
      ?auto_14200 - HOIST
      ?auto_14199 - SURFACE
      ?auto_14209 - PLACE
      ?auto_14202 - HOIST
      ?auto_14213 - SURFACE
      ?auto_14205 - PLACE
      ?auto_14206 - HOIST
      ?auto_14211 - SURFACE
      ?auto_14204 - PLACE
      ?auto_14212 - HOIST
      ?auto_14208 - SURFACE
      ?auto_14210 - PLACE
      ?auto_14203 - HOIST
      ?auto_14207 - SURFACE
      ?auto_14198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14197 ?auto_14201 ) ( IS-CRATE ?auto_14195 ) ( not ( = ?auto_14196 ?auto_14201 ) ) ( HOIST-AT ?auto_14200 ?auto_14196 ) ( AVAILABLE ?auto_14200 ) ( SURFACE-AT ?auto_14195 ?auto_14196 ) ( ON ?auto_14195 ?auto_14199 ) ( CLEAR ?auto_14195 ) ( not ( = ?auto_14194 ?auto_14195 ) ) ( not ( = ?auto_14194 ?auto_14199 ) ) ( not ( = ?auto_14195 ?auto_14199 ) ) ( not ( = ?auto_14197 ?auto_14200 ) ) ( IS-CRATE ?auto_14194 ) ( not ( = ?auto_14209 ?auto_14201 ) ) ( HOIST-AT ?auto_14202 ?auto_14209 ) ( AVAILABLE ?auto_14202 ) ( SURFACE-AT ?auto_14194 ?auto_14209 ) ( ON ?auto_14194 ?auto_14213 ) ( CLEAR ?auto_14194 ) ( not ( = ?auto_14193 ?auto_14194 ) ) ( not ( = ?auto_14193 ?auto_14213 ) ) ( not ( = ?auto_14194 ?auto_14213 ) ) ( not ( = ?auto_14197 ?auto_14202 ) ) ( IS-CRATE ?auto_14193 ) ( not ( = ?auto_14205 ?auto_14201 ) ) ( HOIST-AT ?auto_14206 ?auto_14205 ) ( AVAILABLE ?auto_14206 ) ( SURFACE-AT ?auto_14193 ?auto_14205 ) ( ON ?auto_14193 ?auto_14211 ) ( CLEAR ?auto_14193 ) ( not ( = ?auto_14192 ?auto_14193 ) ) ( not ( = ?auto_14192 ?auto_14211 ) ) ( not ( = ?auto_14193 ?auto_14211 ) ) ( not ( = ?auto_14197 ?auto_14206 ) ) ( IS-CRATE ?auto_14192 ) ( not ( = ?auto_14204 ?auto_14201 ) ) ( HOIST-AT ?auto_14212 ?auto_14204 ) ( AVAILABLE ?auto_14212 ) ( SURFACE-AT ?auto_14192 ?auto_14204 ) ( ON ?auto_14192 ?auto_14208 ) ( CLEAR ?auto_14192 ) ( not ( = ?auto_14191 ?auto_14192 ) ) ( not ( = ?auto_14191 ?auto_14208 ) ) ( not ( = ?auto_14192 ?auto_14208 ) ) ( not ( = ?auto_14197 ?auto_14212 ) ) ( SURFACE-AT ?auto_14190 ?auto_14201 ) ( CLEAR ?auto_14190 ) ( IS-CRATE ?auto_14191 ) ( AVAILABLE ?auto_14197 ) ( not ( = ?auto_14210 ?auto_14201 ) ) ( HOIST-AT ?auto_14203 ?auto_14210 ) ( AVAILABLE ?auto_14203 ) ( SURFACE-AT ?auto_14191 ?auto_14210 ) ( ON ?auto_14191 ?auto_14207 ) ( CLEAR ?auto_14191 ) ( TRUCK-AT ?auto_14198 ?auto_14201 ) ( not ( = ?auto_14190 ?auto_14191 ) ) ( not ( = ?auto_14190 ?auto_14207 ) ) ( not ( = ?auto_14191 ?auto_14207 ) ) ( not ( = ?auto_14197 ?auto_14203 ) ) ( not ( = ?auto_14190 ?auto_14192 ) ) ( not ( = ?auto_14190 ?auto_14208 ) ) ( not ( = ?auto_14192 ?auto_14207 ) ) ( not ( = ?auto_14204 ?auto_14210 ) ) ( not ( = ?auto_14212 ?auto_14203 ) ) ( not ( = ?auto_14208 ?auto_14207 ) ) ( not ( = ?auto_14190 ?auto_14193 ) ) ( not ( = ?auto_14190 ?auto_14211 ) ) ( not ( = ?auto_14191 ?auto_14193 ) ) ( not ( = ?auto_14191 ?auto_14211 ) ) ( not ( = ?auto_14193 ?auto_14208 ) ) ( not ( = ?auto_14193 ?auto_14207 ) ) ( not ( = ?auto_14205 ?auto_14204 ) ) ( not ( = ?auto_14205 ?auto_14210 ) ) ( not ( = ?auto_14206 ?auto_14212 ) ) ( not ( = ?auto_14206 ?auto_14203 ) ) ( not ( = ?auto_14211 ?auto_14208 ) ) ( not ( = ?auto_14211 ?auto_14207 ) ) ( not ( = ?auto_14190 ?auto_14194 ) ) ( not ( = ?auto_14190 ?auto_14213 ) ) ( not ( = ?auto_14191 ?auto_14194 ) ) ( not ( = ?auto_14191 ?auto_14213 ) ) ( not ( = ?auto_14192 ?auto_14194 ) ) ( not ( = ?auto_14192 ?auto_14213 ) ) ( not ( = ?auto_14194 ?auto_14211 ) ) ( not ( = ?auto_14194 ?auto_14208 ) ) ( not ( = ?auto_14194 ?auto_14207 ) ) ( not ( = ?auto_14209 ?auto_14205 ) ) ( not ( = ?auto_14209 ?auto_14204 ) ) ( not ( = ?auto_14209 ?auto_14210 ) ) ( not ( = ?auto_14202 ?auto_14206 ) ) ( not ( = ?auto_14202 ?auto_14212 ) ) ( not ( = ?auto_14202 ?auto_14203 ) ) ( not ( = ?auto_14213 ?auto_14211 ) ) ( not ( = ?auto_14213 ?auto_14208 ) ) ( not ( = ?auto_14213 ?auto_14207 ) ) ( not ( = ?auto_14190 ?auto_14195 ) ) ( not ( = ?auto_14190 ?auto_14199 ) ) ( not ( = ?auto_14191 ?auto_14195 ) ) ( not ( = ?auto_14191 ?auto_14199 ) ) ( not ( = ?auto_14192 ?auto_14195 ) ) ( not ( = ?auto_14192 ?auto_14199 ) ) ( not ( = ?auto_14193 ?auto_14195 ) ) ( not ( = ?auto_14193 ?auto_14199 ) ) ( not ( = ?auto_14195 ?auto_14213 ) ) ( not ( = ?auto_14195 ?auto_14211 ) ) ( not ( = ?auto_14195 ?auto_14208 ) ) ( not ( = ?auto_14195 ?auto_14207 ) ) ( not ( = ?auto_14196 ?auto_14209 ) ) ( not ( = ?auto_14196 ?auto_14205 ) ) ( not ( = ?auto_14196 ?auto_14204 ) ) ( not ( = ?auto_14196 ?auto_14210 ) ) ( not ( = ?auto_14200 ?auto_14202 ) ) ( not ( = ?auto_14200 ?auto_14206 ) ) ( not ( = ?auto_14200 ?auto_14212 ) ) ( not ( = ?auto_14200 ?auto_14203 ) ) ( not ( = ?auto_14199 ?auto_14213 ) ) ( not ( = ?auto_14199 ?auto_14211 ) ) ( not ( = ?auto_14199 ?auto_14208 ) ) ( not ( = ?auto_14199 ?auto_14207 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_14190 ?auto_14191 ?auto_14192 ?auto_14193 ?auto_14194 )
      ( MAKE-1CRATE ?auto_14194 ?auto_14195 )
      ( MAKE-5CRATE-VERIFY ?auto_14190 ?auto_14191 ?auto_14192 ?auto_14193 ?auto_14194 ?auto_14195 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14216 - SURFACE
      ?auto_14217 - SURFACE
    )
    :vars
    (
      ?auto_14218 - HOIST
      ?auto_14219 - PLACE
      ?auto_14221 - PLACE
      ?auto_14222 - HOIST
      ?auto_14223 - SURFACE
      ?auto_14220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14218 ?auto_14219 ) ( SURFACE-AT ?auto_14216 ?auto_14219 ) ( CLEAR ?auto_14216 ) ( IS-CRATE ?auto_14217 ) ( AVAILABLE ?auto_14218 ) ( not ( = ?auto_14221 ?auto_14219 ) ) ( HOIST-AT ?auto_14222 ?auto_14221 ) ( AVAILABLE ?auto_14222 ) ( SURFACE-AT ?auto_14217 ?auto_14221 ) ( ON ?auto_14217 ?auto_14223 ) ( CLEAR ?auto_14217 ) ( TRUCK-AT ?auto_14220 ?auto_14219 ) ( not ( = ?auto_14216 ?auto_14217 ) ) ( not ( = ?auto_14216 ?auto_14223 ) ) ( not ( = ?auto_14217 ?auto_14223 ) ) ( not ( = ?auto_14218 ?auto_14222 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14220 ?auto_14219 ?auto_14221 )
      ( !LIFT ?auto_14222 ?auto_14217 ?auto_14223 ?auto_14221 )
      ( !LOAD ?auto_14222 ?auto_14217 ?auto_14220 ?auto_14221 )
      ( !DRIVE ?auto_14220 ?auto_14221 ?auto_14219 )
      ( !UNLOAD ?auto_14218 ?auto_14217 ?auto_14220 ?auto_14219 )
      ( !DROP ?auto_14218 ?auto_14217 ?auto_14216 ?auto_14219 )
      ( MAKE-1CRATE-VERIFY ?auto_14216 ?auto_14217 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_14231 - SURFACE
      ?auto_14232 - SURFACE
      ?auto_14233 - SURFACE
      ?auto_14234 - SURFACE
      ?auto_14235 - SURFACE
      ?auto_14236 - SURFACE
      ?auto_14237 - SURFACE
    )
    :vars
    (
      ?auto_14243 - HOIST
      ?auto_14238 - PLACE
      ?auto_14239 - PLACE
      ?auto_14240 - HOIST
      ?auto_14241 - SURFACE
      ?auto_14257 - PLACE
      ?auto_14249 - HOIST
      ?auto_14244 - SURFACE
      ?auto_14248 - PLACE
      ?auto_14256 - HOIST
      ?auto_14247 - SURFACE
      ?auto_14251 - PLACE
      ?auto_14252 - HOIST
      ?auto_14258 - SURFACE
      ?auto_14254 - PLACE
      ?auto_14255 - HOIST
      ?auto_14245 - SURFACE
      ?auto_14250 - PLACE
      ?auto_14253 - HOIST
      ?auto_14246 - SURFACE
      ?auto_14242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14243 ?auto_14238 ) ( IS-CRATE ?auto_14237 ) ( not ( = ?auto_14239 ?auto_14238 ) ) ( HOIST-AT ?auto_14240 ?auto_14239 ) ( AVAILABLE ?auto_14240 ) ( SURFACE-AT ?auto_14237 ?auto_14239 ) ( ON ?auto_14237 ?auto_14241 ) ( CLEAR ?auto_14237 ) ( not ( = ?auto_14236 ?auto_14237 ) ) ( not ( = ?auto_14236 ?auto_14241 ) ) ( not ( = ?auto_14237 ?auto_14241 ) ) ( not ( = ?auto_14243 ?auto_14240 ) ) ( IS-CRATE ?auto_14236 ) ( not ( = ?auto_14257 ?auto_14238 ) ) ( HOIST-AT ?auto_14249 ?auto_14257 ) ( AVAILABLE ?auto_14249 ) ( SURFACE-AT ?auto_14236 ?auto_14257 ) ( ON ?auto_14236 ?auto_14244 ) ( CLEAR ?auto_14236 ) ( not ( = ?auto_14235 ?auto_14236 ) ) ( not ( = ?auto_14235 ?auto_14244 ) ) ( not ( = ?auto_14236 ?auto_14244 ) ) ( not ( = ?auto_14243 ?auto_14249 ) ) ( IS-CRATE ?auto_14235 ) ( not ( = ?auto_14248 ?auto_14238 ) ) ( HOIST-AT ?auto_14256 ?auto_14248 ) ( AVAILABLE ?auto_14256 ) ( SURFACE-AT ?auto_14235 ?auto_14248 ) ( ON ?auto_14235 ?auto_14247 ) ( CLEAR ?auto_14235 ) ( not ( = ?auto_14234 ?auto_14235 ) ) ( not ( = ?auto_14234 ?auto_14247 ) ) ( not ( = ?auto_14235 ?auto_14247 ) ) ( not ( = ?auto_14243 ?auto_14256 ) ) ( IS-CRATE ?auto_14234 ) ( not ( = ?auto_14251 ?auto_14238 ) ) ( HOIST-AT ?auto_14252 ?auto_14251 ) ( AVAILABLE ?auto_14252 ) ( SURFACE-AT ?auto_14234 ?auto_14251 ) ( ON ?auto_14234 ?auto_14258 ) ( CLEAR ?auto_14234 ) ( not ( = ?auto_14233 ?auto_14234 ) ) ( not ( = ?auto_14233 ?auto_14258 ) ) ( not ( = ?auto_14234 ?auto_14258 ) ) ( not ( = ?auto_14243 ?auto_14252 ) ) ( IS-CRATE ?auto_14233 ) ( not ( = ?auto_14254 ?auto_14238 ) ) ( HOIST-AT ?auto_14255 ?auto_14254 ) ( AVAILABLE ?auto_14255 ) ( SURFACE-AT ?auto_14233 ?auto_14254 ) ( ON ?auto_14233 ?auto_14245 ) ( CLEAR ?auto_14233 ) ( not ( = ?auto_14232 ?auto_14233 ) ) ( not ( = ?auto_14232 ?auto_14245 ) ) ( not ( = ?auto_14233 ?auto_14245 ) ) ( not ( = ?auto_14243 ?auto_14255 ) ) ( SURFACE-AT ?auto_14231 ?auto_14238 ) ( CLEAR ?auto_14231 ) ( IS-CRATE ?auto_14232 ) ( AVAILABLE ?auto_14243 ) ( not ( = ?auto_14250 ?auto_14238 ) ) ( HOIST-AT ?auto_14253 ?auto_14250 ) ( AVAILABLE ?auto_14253 ) ( SURFACE-AT ?auto_14232 ?auto_14250 ) ( ON ?auto_14232 ?auto_14246 ) ( CLEAR ?auto_14232 ) ( TRUCK-AT ?auto_14242 ?auto_14238 ) ( not ( = ?auto_14231 ?auto_14232 ) ) ( not ( = ?auto_14231 ?auto_14246 ) ) ( not ( = ?auto_14232 ?auto_14246 ) ) ( not ( = ?auto_14243 ?auto_14253 ) ) ( not ( = ?auto_14231 ?auto_14233 ) ) ( not ( = ?auto_14231 ?auto_14245 ) ) ( not ( = ?auto_14233 ?auto_14246 ) ) ( not ( = ?auto_14254 ?auto_14250 ) ) ( not ( = ?auto_14255 ?auto_14253 ) ) ( not ( = ?auto_14245 ?auto_14246 ) ) ( not ( = ?auto_14231 ?auto_14234 ) ) ( not ( = ?auto_14231 ?auto_14258 ) ) ( not ( = ?auto_14232 ?auto_14234 ) ) ( not ( = ?auto_14232 ?auto_14258 ) ) ( not ( = ?auto_14234 ?auto_14245 ) ) ( not ( = ?auto_14234 ?auto_14246 ) ) ( not ( = ?auto_14251 ?auto_14254 ) ) ( not ( = ?auto_14251 ?auto_14250 ) ) ( not ( = ?auto_14252 ?auto_14255 ) ) ( not ( = ?auto_14252 ?auto_14253 ) ) ( not ( = ?auto_14258 ?auto_14245 ) ) ( not ( = ?auto_14258 ?auto_14246 ) ) ( not ( = ?auto_14231 ?auto_14235 ) ) ( not ( = ?auto_14231 ?auto_14247 ) ) ( not ( = ?auto_14232 ?auto_14235 ) ) ( not ( = ?auto_14232 ?auto_14247 ) ) ( not ( = ?auto_14233 ?auto_14235 ) ) ( not ( = ?auto_14233 ?auto_14247 ) ) ( not ( = ?auto_14235 ?auto_14258 ) ) ( not ( = ?auto_14235 ?auto_14245 ) ) ( not ( = ?auto_14235 ?auto_14246 ) ) ( not ( = ?auto_14248 ?auto_14251 ) ) ( not ( = ?auto_14248 ?auto_14254 ) ) ( not ( = ?auto_14248 ?auto_14250 ) ) ( not ( = ?auto_14256 ?auto_14252 ) ) ( not ( = ?auto_14256 ?auto_14255 ) ) ( not ( = ?auto_14256 ?auto_14253 ) ) ( not ( = ?auto_14247 ?auto_14258 ) ) ( not ( = ?auto_14247 ?auto_14245 ) ) ( not ( = ?auto_14247 ?auto_14246 ) ) ( not ( = ?auto_14231 ?auto_14236 ) ) ( not ( = ?auto_14231 ?auto_14244 ) ) ( not ( = ?auto_14232 ?auto_14236 ) ) ( not ( = ?auto_14232 ?auto_14244 ) ) ( not ( = ?auto_14233 ?auto_14236 ) ) ( not ( = ?auto_14233 ?auto_14244 ) ) ( not ( = ?auto_14234 ?auto_14236 ) ) ( not ( = ?auto_14234 ?auto_14244 ) ) ( not ( = ?auto_14236 ?auto_14247 ) ) ( not ( = ?auto_14236 ?auto_14258 ) ) ( not ( = ?auto_14236 ?auto_14245 ) ) ( not ( = ?auto_14236 ?auto_14246 ) ) ( not ( = ?auto_14257 ?auto_14248 ) ) ( not ( = ?auto_14257 ?auto_14251 ) ) ( not ( = ?auto_14257 ?auto_14254 ) ) ( not ( = ?auto_14257 ?auto_14250 ) ) ( not ( = ?auto_14249 ?auto_14256 ) ) ( not ( = ?auto_14249 ?auto_14252 ) ) ( not ( = ?auto_14249 ?auto_14255 ) ) ( not ( = ?auto_14249 ?auto_14253 ) ) ( not ( = ?auto_14244 ?auto_14247 ) ) ( not ( = ?auto_14244 ?auto_14258 ) ) ( not ( = ?auto_14244 ?auto_14245 ) ) ( not ( = ?auto_14244 ?auto_14246 ) ) ( not ( = ?auto_14231 ?auto_14237 ) ) ( not ( = ?auto_14231 ?auto_14241 ) ) ( not ( = ?auto_14232 ?auto_14237 ) ) ( not ( = ?auto_14232 ?auto_14241 ) ) ( not ( = ?auto_14233 ?auto_14237 ) ) ( not ( = ?auto_14233 ?auto_14241 ) ) ( not ( = ?auto_14234 ?auto_14237 ) ) ( not ( = ?auto_14234 ?auto_14241 ) ) ( not ( = ?auto_14235 ?auto_14237 ) ) ( not ( = ?auto_14235 ?auto_14241 ) ) ( not ( = ?auto_14237 ?auto_14244 ) ) ( not ( = ?auto_14237 ?auto_14247 ) ) ( not ( = ?auto_14237 ?auto_14258 ) ) ( not ( = ?auto_14237 ?auto_14245 ) ) ( not ( = ?auto_14237 ?auto_14246 ) ) ( not ( = ?auto_14239 ?auto_14257 ) ) ( not ( = ?auto_14239 ?auto_14248 ) ) ( not ( = ?auto_14239 ?auto_14251 ) ) ( not ( = ?auto_14239 ?auto_14254 ) ) ( not ( = ?auto_14239 ?auto_14250 ) ) ( not ( = ?auto_14240 ?auto_14249 ) ) ( not ( = ?auto_14240 ?auto_14256 ) ) ( not ( = ?auto_14240 ?auto_14252 ) ) ( not ( = ?auto_14240 ?auto_14255 ) ) ( not ( = ?auto_14240 ?auto_14253 ) ) ( not ( = ?auto_14241 ?auto_14244 ) ) ( not ( = ?auto_14241 ?auto_14247 ) ) ( not ( = ?auto_14241 ?auto_14258 ) ) ( not ( = ?auto_14241 ?auto_14245 ) ) ( not ( = ?auto_14241 ?auto_14246 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_14231 ?auto_14232 ?auto_14233 ?auto_14234 ?auto_14235 ?auto_14236 )
      ( MAKE-1CRATE ?auto_14236 ?auto_14237 )
      ( MAKE-6CRATE-VERIFY ?auto_14231 ?auto_14232 ?auto_14233 ?auto_14234 ?auto_14235 ?auto_14236 ?auto_14237 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14261 - SURFACE
      ?auto_14262 - SURFACE
    )
    :vars
    (
      ?auto_14263 - HOIST
      ?auto_14264 - PLACE
      ?auto_14266 - PLACE
      ?auto_14267 - HOIST
      ?auto_14268 - SURFACE
      ?auto_14265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14263 ?auto_14264 ) ( SURFACE-AT ?auto_14261 ?auto_14264 ) ( CLEAR ?auto_14261 ) ( IS-CRATE ?auto_14262 ) ( AVAILABLE ?auto_14263 ) ( not ( = ?auto_14266 ?auto_14264 ) ) ( HOIST-AT ?auto_14267 ?auto_14266 ) ( AVAILABLE ?auto_14267 ) ( SURFACE-AT ?auto_14262 ?auto_14266 ) ( ON ?auto_14262 ?auto_14268 ) ( CLEAR ?auto_14262 ) ( TRUCK-AT ?auto_14265 ?auto_14264 ) ( not ( = ?auto_14261 ?auto_14262 ) ) ( not ( = ?auto_14261 ?auto_14268 ) ) ( not ( = ?auto_14262 ?auto_14268 ) ) ( not ( = ?auto_14263 ?auto_14267 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14265 ?auto_14264 ?auto_14266 )
      ( !LIFT ?auto_14267 ?auto_14262 ?auto_14268 ?auto_14266 )
      ( !LOAD ?auto_14267 ?auto_14262 ?auto_14265 ?auto_14266 )
      ( !DRIVE ?auto_14265 ?auto_14266 ?auto_14264 )
      ( !UNLOAD ?auto_14263 ?auto_14262 ?auto_14265 ?auto_14264 )
      ( !DROP ?auto_14263 ?auto_14262 ?auto_14261 ?auto_14264 )
      ( MAKE-1CRATE-VERIFY ?auto_14261 ?auto_14262 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_14277 - SURFACE
      ?auto_14278 - SURFACE
      ?auto_14279 - SURFACE
      ?auto_14280 - SURFACE
      ?auto_14281 - SURFACE
      ?auto_14282 - SURFACE
      ?auto_14283 - SURFACE
      ?auto_14284 - SURFACE
    )
    :vars
    (
      ?auto_14290 - HOIST
      ?auto_14287 - PLACE
      ?auto_14285 - PLACE
      ?auto_14288 - HOIST
      ?auto_14286 - SURFACE
      ?auto_14306 - PLACE
      ?auto_14298 - HOIST
      ?auto_14300 - SURFACE
      ?auto_14295 - PLACE
      ?auto_14299 - HOIST
      ?auto_14305 - SURFACE
      ?auto_14301 - SURFACE
      ?auto_14296 - PLACE
      ?auto_14291 - HOIST
      ?auto_14304 - SURFACE
      ?auto_14292 - PLACE
      ?auto_14294 - HOIST
      ?auto_14302 - SURFACE
      ?auto_14297 - PLACE
      ?auto_14293 - HOIST
      ?auto_14303 - SURFACE
      ?auto_14289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14290 ?auto_14287 ) ( IS-CRATE ?auto_14284 ) ( not ( = ?auto_14285 ?auto_14287 ) ) ( HOIST-AT ?auto_14288 ?auto_14285 ) ( SURFACE-AT ?auto_14284 ?auto_14285 ) ( ON ?auto_14284 ?auto_14286 ) ( CLEAR ?auto_14284 ) ( not ( = ?auto_14283 ?auto_14284 ) ) ( not ( = ?auto_14283 ?auto_14286 ) ) ( not ( = ?auto_14284 ?auto_14286 ) ) ( not ( = ?auto_14290 ?auto_14288 ) ) ( IS-CRATE ?auto_14283 ) ( not ( = ?auto_14306 ?auto_14287 ) ) ( HOIST-AT ?auto_14298 ?auto_14306 ) ( AVAILABLE ?auto_14298 ) ( SURFACE-AT ?auto_14283 ?auto_14306 ) ( ON ?auto_14283 ?auto_14300 ) ( CLEAR ?auto_14283 ) ( not ( = ?auto_14282 ?auto_14283 ) ) ( not ( = ?auto_14282 ?auto_14300 ) ) ( not ( = ?auto_14283 ?auto_14300 ) ) ( not ( = ?auto_14290 ?auto_14298 ) ) ( IS-CRATE ?auto_14282 ) ( not ( = ?auto_14295 ?auto_14287 ) ) ( HOIST-AT ?auto_14299 ?auto_14295 ) ( AVAILABLE ?auto_14299 ) ( SURFACE-AT ?auto_14282 ?auto_14295 ) ( ON ?auto_14282 ?auto_14305 ) ( CLEAR ?auto_14282 ) ( not ( = ?auto_14281 ?auto_14282 ) ) ( not ( = ?auto_14281 ?auto_14305 ) ) ( not ( = ?auto_14282 ?auto_14305 ) ) ( not ( = ?auto_14290 ?auto_14299 ) ) ( IS-CRATE ?auto_14281 ) ( AVAILABLE ?auto_14288 ) ( SURFACE-AT ?auto_14281 ?auto_14285 ) ( ON ?auto_14281 ?auto_14301 ) ( CLEAR ?auto_14281 ) ( not ( = ?auto_14280 ?auto_14281 ) ) ( not ( = ?auto_14280 ?auto_14301 ) ) ( not ( = ?auto_14281 ?auto_14301 ) ) ( IS-CRATE ?auto_14280 ) ( not ( = ?auto_14296 ?auto_14287 ) ) ( HOIST-AT ?auto_14291 ?auto_14296 ) ( AVAILABLE ?auto_14291 ) ( SURFACE-AT ?auto_14280 ?auto_14296 ) ( ON ?auto_14280 ?auto_14304 ) ( CLEAR ?auto_14280 ) ( not ( = ?auto_14279 ?auto_14280 ) ) ( not ( = ?auto_14279 ?auto_14304 ) ) ( not ( = ?auto_14280 ?auto_14304 ) ) ( not ( = ?auto_14290 ?auto_14291 ) ) ( IS-CRATE ?auto_14279 ) ( not ( = ?auto_14292 ?auto_14287 ) ) ( HOIST-AT ?auto_14294 ?auto_14292 ) ( AVAILABLE ?auto_14294 ) ( SURFACE-AT ?auto_14279 ?auto_14292 ) ( ON ?auto_14279 ?auto_14302 ) ( CLEAR ?auto_14279 ) ( not ( = ?auto_14278 ?auto_14279 ) ) ( not ( = ?auto_14278 ?auto_14302 ) ) ( not ( = ?auto_14279 ?auto_14302 ) ) ( not ( = ?auto_14290 ?auto_14294 ) ) ( SURFACE-AT ?auto_14277 ?auto_14287 ) ( CLEAR ?auto_14277 ) ( IS-CRATE ?auto_14278 ) ( AVAILABLE ?auto_14290 ) ( not ( = ?auto_14297 ?auto_14287 ) ) ( HOIST-AT ?auto_14293 ?auto_14297 ) ( AVAILABLE ?auto_14293 ) ( SURFACE-AT ?auto_14278 ?auto_14297 ) ( ON ?auto_14278 ?auto_14303 ) ( CLEAR ?auto_14278 ) ( TRUCK-AT ?auto_14289 ?auto_14287 ) ( not ( = ?auto_14277 ?auto_14278 ) ) ( not ( = ?auto_14277 ?auto_14303 ) ) ( not ( = ?auto_14278 ?auto_14303 ) ) ( not ( = ?auto_14290 ?auto_14293 ) ) ( not ( = ?auto_14277 ?auto_14279 ) ) ( not ( = ?auto_14277 ?auto_14302 ) ) ( not ( = ?auto_14279 ?auto_14303 ) ) ( not ( = ?auto_14292 ?auto_14297 ) ) ( not ( = ?auto_14294 ?auto_14293 ) ) ( not ( = ?auto_14302 ?auto_14303 ) ) ( not ( = ?auto_14277 ?auto_14280 ) ) ( not ( = ?auto_14277 ?auto_14304 ) ) ( not ( = ?auto_14278 ?auto_14280 ) ) ( not ( = ?auto_14278 ?auto_14304 ) ) ( not ( = ?auto_14280 ?auto_14302 ) ) ( not ( = ?auto_14280 ?auto_14303 ) ) ( not ( = ?auto_14296 ?auto_14292 ) ) ( not ( = ?auto_14296 ?auto_14297 ) ) ( not ( = ?auto_14291 ?auto_14294 ) ) ( not ( = ?auto_14291 ?auto_14293 ) ) ( not ( = ?auto_14304 ?auto_14302 ) ) ( not ( = ?auto_14304 ?auto_14303 ) ) ( not ( = ?auto_14277 ?auto_14281 ) ) ( not ( = ?auto_14277 ?auto_14301 ) ) ( not ( = ?auto_14278 ?auto_14281 ) ) ( not ( = ?auto_14278 ?auto_14301 ) ) ( not ( = ?auto_14279 ?auto_14281 ) ) ( not ( = ?auto_14279 ?auto_14301 ) ) ( not ( = ?auto_14281 ?auto_14304 ) ) ( not ( = ?auto_14281 ?auto_14302 ) ) ( not ( = ?auto_14281 ?auto_14303 ) ) ( not ( = ?auto_14285 ?auto_14296 ) ) ( not ( = ?auto_14285 ?auto_14292 ) ) ( not ( = ?auto_14285 ?auto_14297 ) ) ( not ( = ?auto_14288 ?auto_14291 ) ) ( not ( = ?auto_14288 ?auto_14294 ) ) ( not ( = ?auto_14288 ?auto_14293 ) ) ( not ( = ?auto_14301 ?auto_14304 ) ) ( not ( = ?auto_14301 ?auto_14302 ) ) ( not ( = ?auto_14301 ?auto_14303 ) ) ( not ( = ?auto_14277 ?auto_14282 ) ) ( not ( = ?auto_14277 ?auto_14305 ) ) ( not ( = ?auto_14278 ?auto_14282 ) ) ( not ( = ?auto_14278 ?auto_14305 ) ) ( not ( = ?auto_14279 ?auto_14282 ) ) ( not ( = ?auto_14279 ?auto_14305 ) ) ( not ( = ?auto_14280 ?auto_14282 ) ) ( not ( = ?auto_14280 ?auto_14305 ) ) ( not ( = ?auto_14282 ?auto_14301 ) ) ( not ( = ?auto_14282 ?auto_14304 ) ) ( not ( = ?auto_14282 ?auto_14302 ) ) ( not ( = ?auto_14282 ?auto_14303 ) ) ( not ( = ?auto_14295 ?auto_14285 ) ) ( not ( = ?auto_14295 ?auto_14296 ) ) ( not ( = ?auto_14295 ?auto_14292 ) ) ( not ( = ?auto_14295 ?auto_14297 ) ) ( not ( = ?auto_14299 ?auto_14288 ) ) ( not ( = ?auto_14299 ?auto_14291 ) ) ( not ( = ?auto_14299 ?auto_14294 ) ) ( not ( = ?auto_14299 ?auto_14293 ) ) ( not ( = ?auto_14305 ?auto_14301 ) ) ( not ( = ?auto_14305 ?auto_14304 ) ) ( not ( = ?auto_14305 ?auto_14302 ) ) ( not ( = ?auto_14305 ?auto_14303 ) ) ( not ( = ?auto_14277 ?auto_14283 ) ) ( not ( = ?auto_14277 ?auto_14300 ) ) ( not ( = ?auto_14278 ?auto_14283 ) ) ( not ( = ?auto_14278 ?auto_14300 ) ) ( not ( = ?auto_14279 ?auto_14283 ) ) ( not ( = ?auto_14279 ?auto_14300 ) ) ( not ( = ?auto_14280 ?auto_14283 ) ) ( not ( = ?auto_14280 ?auto_14300 ) ) ( not ( = ?auto_14281 ?auto_14283 ) ) ( not ( = ?auto_14281 ?auto_14300 ) ) ( not ( = ?auto_14283 ?auto_14305 ) ) ( not ( = ?auto_14283 ?auto_14301 ) ) ( not ( = ?auto_14283 ?auto_14304 ) ) ( not ( = ?auto_14283 ?auto_14302 ) ) ( not ( = ?auto_14283 ?auto_14303 ) ) ( not ( = ?auto_14306 ?auto_14295 ) ) ( not ( = ?auto_14306 ?auto_14285 ) ) ( not ( = ?auto_14306 ?auto_14296 ) ) ( not ( = ?auto_14306 ?auto_14292 ) ) ( not ( = ?auto_14306 ?auto_14297 ) ) ( not ( = ?auto_14298 ?auto_14299 ) ) ( not ( = ?auto_14298 ?auto_14288 ) ) ( not ( = ?auto_14298 ?auto_14291 ) ) ( not ( = ?auto_14298 ?auto_14294 ) ) ( not ( = ?auto_14298 ?auto_14293 ) ) ( not ( = ?auto_14300 ?auto_14305 ) ) ( not ( = ?auto_14300 ?auto_14301 ) ) ( not ( = ?auto_14300 ?auto_14304 ) ) ( not ( = ?auto_14300 ?auto_14302 ) ) ( not ( = ?auto_14300 ?auto_14303 ) ) ( not ( = ?auto_14277 ?auto_14284 ) ) ( not ( = ?auto_14277 ?auto_14286 ) ) ( not ( = ?auto_14278 ?auto_14284 ) ) ( not ( = ?auto_14278 ?auto_14286 ) ) ( not ( = ?auto_14279 ?auto_14284 ) ) ( not ( = ?auto_14279 ?auto_14286 ) ) ( not ( = ?auto_14280 ?auto_14284 ) ) ( not ( = ?auto_14280 ?auto_14286 ) ) ( not ( = ?auto_14281 ?auto_14284 ) ) ( not ( = ?auto_14281 ?auto_14286 ) ) ( not ( = ?auto_14282 ?auto_14284 ) ) ( not ( = ?auto_14282 ?auto_14286 ) ) ( not ( = ?auto_14284 ?auto_14300 ) ) ( not ( = ?auto_14284 ?auto_14305 ) ) ( not ( = ?auto_14284 ?auto_14301 ) ) ( not ( = ?auto_14284 ?auto_14304 ) ) ( not ( = ?auto_14284 ?auto_14302 ) ) ( not ( = ?auto_14284 ?auto_14303 ) ) ( not ( = ?auto_14286 ?auto_14300 ) ) ( not ( = ?auto_14286 ?auto_14305 ) ) ( not ( = ?auto_14286 ?auto_14301 ) ) ( not ( = ?auto_14286 ?auto_14304 ) ) ( not ( = ?auto_14286 ?auto_14302 ) ) ( not ( = ?auto_14286 ?auto_14303 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_14277 ?auto_14278 ?auto_14279 ?auto_14280 ?auto_14281 ?auto_14282 ?auto_14283 )
      ( MAKE-1CRATE ?auto_14283 ?auto_14284 )
      ( MAKE-7CRATE-VERIFY ?auto_14277 ?auto_14278 ?auto_14279 ?auto_14280 ?auto_14281 ?auto_14282 ?auto_14283 ?auto_14284 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14309 - SURFACE
      ?auto_14310 - SURFACE
    )
    :vars
    (
      ?auto_14311 - HOIST
      ?auto_14312 - PLACE
      ?auto_14314 - PLACE
      ?auto_14315 - HOIST
      ?auto_14316 - SURFACE
      ?auto_14313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14311 ?auto_14312 ) ( SURFACE-AT ?auto_14309 ?auto_14312 ) ( CLEAR ?auto_14309 ) ( IS-CRATE ?auto_14310 ) ( AVAILABLE ?auto_14311 ) ( not ( = ?auto_14314 ?auto_14312 ) ) ( HOIST-AT ?auto_14315 ?auto_14314 ) ( AVAILABLE ?auto_14315 ) ( SURFACE-AT ?auto_14310 ?auto_14314 ) ( ON ?auto_14310 ?auto_14316 ) ( CLEAR ?auto_14310 ) ( TRUCK-AT ?auto_14313 ?auto_14312 ) ( not ( = ?auto_14309 ?auto_14310 ) ) ( not ( = ?auto_14309 ?auto_14316 ) ) ( not ( = ?auto_14310 ?auto_14316 ) ) ( not ( = ?auto_14311 ?auto_14315 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14313 ?auto_14312 ?auto_14314 )
      ( !LIFT ?auto_14315 ?auto_14310 ?auto_14316 ?auto_14314 )
      ( !LOAD ?auto_14315 ?auto_14310 ?auto_14313 ?auto_14314 )
      ( !DRIVE ?auto_14313 ?auto_14314 ?auto_14312 )
      ( !UNLOAD ?auto_14311 ?auto_14310 ?auto_14313 ?auto_14312 )
      ( !DROP ?auto_14311 ?auto_14310 ?auto_14309 ?auto_14312 )
      ( MAKE-1CRATE-VERIFY ?auto_14309 ?auto_14310 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_14326 - SURFACE
      ?auto_14327 - SURFACE
      ?auto_14328 - SURFACE
      ?auto_14329 - SURFACE
      ?auto_14330 - SURFACE
      ?auto_14331 - SURFACE
      ?auto_14332 - SURFACE
      ?auto_14334 - SURFACE
      ?auto_14333 - SURFACE
    )
    :vars
    (
      ?auto_14337 - HOIST
      ?auto_14335 - PLACE
      ?auto_14340 - PLACE
      ?auto_14338 - HOIST
      ?auto_14339 - SURFACE
      ?auto_14352 - PLACE
      ?auto_14349 - HOIST
      ?auto_14348 - SURFACE
      ?auto_14358 - PLACE
      ?auto_14346 - HOIST
      ?auto_14342 - SURFACE
      ?auto_14350 - PLACE
      ?auto_14359 - HOIST
      ?auto_14356 - SURFACE
      ?auto_14341 - SURFACE
      ?auto_14351 - PLACE
      ?auto_14357 - HOIST
      ?auto_14345 - SURFACE
      ?auto_14354 - PLACE
      ?auto_14353 - HOIST
      ?auto_14343 - SURFACE
      ?auto_14347 - PLACE
      ?auto_14355 - HOIST
      ?auto_14344 - SURFACE
      ?auto_14336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14337 ?auto_14335 ) ( IS-CRATE ?auto_14333 ) ( not ( = ?auto_14340 ?auto_14335 ) ) ( HOIST-AT ?auto_14338 ?auto_14340 ) ( AVAILABLE ?auto_14338 ) ( SURFACE-AT ?auto_14333 ?auto_14340 ) ( ON ?auto_14333 ?auto_14339 ) ( CLEAR ?auto_14333 ) ( not ( = ?auto_14334 ?auto_14333 ) ) ( not ( = ?auto_14334 ?auto_14339 ) ) ( not ( = ?auto_14333 ?auto_14339 ) ) ( not ( = ?auto_14337 ?auto_14338 ) ) ( IS-CRATE ?auto_14334 ) ( not ( = ?auto_14352 ?auto_14335 ) ) ( HOIST-AT ?auto_14349 ?auto_14352 ) ( SURFACE-AT ?auto_14334 ?auto_14352 ) ( ON ?auto_14334 ?auto_14348 ) ( CLEAR ?auto_14334 ) ( not ( = ?auto_14332 ?auto_14334 ) ) ( not ( = ?auto_14332 ?auto_14348 ) ) ( not ( = ?auto_14334 ?auto_14348 ) ) ( not ( = ?auto_14337 ?auto_14349 ) ) ( IS-CRATE ?auto_14332 ) ( not ( = ?auto_14358 ?auto_14335 ) ) ( HOIST-AT ?auto_14346 ?auto_14358 ) ( AVAILABLE ?auto_14346 ) ( SURFACE-AT ?auto_14332 ?auto_14358 ) ( ON ?auto_14332 ?auto_14342 ) ( CLEAR ?auto_14332 ) ( not ( = ?auto_14331 ?auto_14332 ) ) ( not ( = ?auto_14331 ?auto_14342 ) ) ( not ( = ?auto_14332 ?auto_14342 ) ) ( not ( = ?auto_14337 ?auto_14346 ) ) ( IS-CRATE ?auto_14331 ) ( not ( = ?auto_14350 ?auto_14335 ) ) ( HOIST-AT ?auto_14359 ?auto_14350 ) ( AVAILABLE ?auto_14359 ) ( SURFACE-AT ?auto_14331 ?auto_14350 ) ( ON ?auto_14331 ?auto_14356 ) ( CLEAR ?auto_14331 ) ( not ( = ?auto_14330 ?auto_14331 ) ) ( not ( = ?auto_14330 ?auto_14356 ) ) ( not ( = ?auto_14331 ?auto_14356 ) ) ( not ( = ?auto_14337 ?auto_14359 ) ) ( IS-CRATE ?auto_14330 ) ( AVAILABLE ?auto_14349 ) ( SURFACE-AT ?auto_14330 ?auto_14352 ) ( ON ?auto_14330 ?auto_14341 ) ( CLEAR ?auto_14330 ) ( not ( = ?auto_14329 ?auto_14330 ) ) ( not ( = ?auto_14329 ?auto_14341 ) ) ( not ( = ?auto_14330 ?auto_14341 ) ) ( IS-CRATE ?auto_14329 ) ( not ( = ?auto_14351 ?auto_14335 ) ) ( HOIST-AT ?auto_14357 ?auto_14351 ) ( AVAILABLE ?auto_14357 ) ( SURFACE-AT ?auto_14329 ?auto_14351 ) ( ON ?auto_14329 ?auto_14345 ) ( CLEAR ?auto_14329 ) ( not ( = ?auto_14328 ?auto_14329 ) ) ( not ( = ?auto_14328 ?auto_14345 ) ) ( not ( = ?auto_14329 ?auto_14345 ) ) ( not ( = ?auto_14337 ?auto_14357 ) ) ( IS-CRATE ?auto_14328 ) ( not ( = ?auto_14354 ?auto_14335 ) ) ( HOIST-AT ?auto_14353 ?auto_14354 ) ( AVAILABLE ?auto_14353 ) ( SURFACE-AT ?auto_14328 ?auto_14354 ) ( ON ?auto_14328 ?auto_14343 ) ( CLEAR ?auto_14328 ) ( not ( = ?auto_14327 ?auto_14328 ) ) ( not ( = ?auto_14327 ?auto_14343 ) ) ( not ( = ?auto_14328 ?auto_14343 ) ) ( not ( = ?auto_14337 ?auto_14353 ) ) ( SURFACE-AT ?auto_14326 ?auto_14335 ) ( CLEAR ?auto_14326 ) ( IS-CRATE ?auto_14327 ) ( AVAILABLE ?auto_14337 ) ( not ( = ?auto_14347 ?auto_14335 ) ) ( HOIST-AT ?auto_14355 ?auto_14347 ) ( AVAILABLE ?auto_14355 ) ( SURFACE-AT ?auto_14327 ?auto_14347 ) ( ON ?auto_14327 ?auto_14344 ) ( CLEAR ?auto_14327 ) ( TRUCK-AT ?auto_14336 ?auto_14335 ) ( not ( = ?auto_14326 ?auto_14327 ) ) ( not ( = ?auto_14326 ?auto_14344 ) ) ( not ( = ?auto_14327 ?auto_14344 ) ) ( not ( = ?auto_14337 ?auto_14355 ) ) ( not ( = ?auto_14326 ?auto_14328 ) ) ( not ( = ?auto_14326 ?auto_14343 ) ) ( not ( = ?auto_14328 ?auto_14344 ) ) ( not ( = ?auto_14354 ?auto_14347 ) ) ( not ( = ?auto_14353 ?auto_14355 ) ) ( not ( = ?auto_14343 ?auto_14344 ) ) ( not ( = ?auto_14326 ?auto_14329 ) ) ( not ( = ?auto_14326 ?auto_14345 ) ) ( not ( = ?auto_14327 ?auto_14329 ) ) ( not ( = ?auto_14327 ?auto_14345 ) ) ( not ( = ?auto_14329 ?auto_14343 ) ) ( not ( = ?auto_14329 ?auto_14344 ) ) ( not ( = ?auto_14351 ?auto_14354 ) ) ( not ( = ?auto_14351 ?auto_14347 ) ) ( not ( = ?auto_14357 ?auto_14353 ) ) ( not ( = ?auto_14357 ?auto_14355 ) ) ( not ( = ?auto_14345 ?auto_14343 ) ) ( not ( = ?auto_14345 ?auto_14344 ) ) ( not ( = ?auto_14326 ?auto_14330 ) ) ( not ( = ?auto_14326 ?auto_14341 ) ) ( not ( = ?auto_14327 ?auto_14330 ) ) ( not ( = ?auto_14327 ?auto_14341 ) ) ( not ( = ?auto_14328 ?auto_14330 ) ) ( not ( = ?auto_14328 ?auto_14341 ) ) ( not ( = ?auto_14330 ?auto_14345 ) ) ( not ( = ?auto_14330 ?auto_14343 ) ) ( not ( = ?auto_14330 ?auto_14344 ) ) ( not ( = ?auto_14352 ?auto_14351 ) ) ( not ( = ?auto_14352 ?auto_14354 ) ) ( not ( = ?auto_14352 ?auto_14347 ) ) ( not ( = ?auto_14349 ?auto_14357 ) ) ( not ( = ?auto_14349 ?auto_14353 ) ) ( not ( = ?auto_14349 ?auto_14355 ) ) ( not ( = ?auto_14341 ?auto_14345 ) ) ( not ( = ?auto_14341 ?auto_14343 ) ) ( not ( = ?auto_14341 ?auto_14344 ) ) ( not ( = ?auto_14326 ?auto_14331 ) ) ( not ( = ?auto_14326 ?auto_14356 ) ) ( not ( = ?auto_14327 ?auto_14331 ) ) ( not ( = ?auto_14327 ?auto_14356 ) ) ( not ( = ?auto_14328 ?auto_14331 ) ) ( not ( = ?auto_14328 ?auto_14356 ) ) ( not ( = ?auto_14329 ?auto_14331 ) ) ( not ( = ?auto_14329 ?auto_14356 ) ) ( not ( = ?auto_14331 ?auto_14341 ) ) ( not ( = ?auto_14331 ?auto_14345 ) ) ( not ( = ?auto_14331 ?auto_14343 ) ) ( not ( = ?auto_14331 ?auto_14344 ) ) ( not ( = ?auto_14350 ?auto_14352 ) ) ( not ( = ?auto_14350 ?auto_14351 ) ) ( not ( = ?auto_14350 ?auto_14354 ) ) ( not ( = ?auto_14350 ?auto_14347 ) ) ( not ( = ?auto_14359 ?auto_14349 ) ) ( not ( = ?auto_14359 ?auto_14357 ) ) ( not ( = ?auto_14359 ?auto_14353 ) ) ( not ( = ?auto_14359 ?auto_14355 ) ) ( not ( = ?auto_14356 ?auto_14341 ) ) ( not ( = ?auto_14356 ?auto_14345 ) ) ( not ( = ?auto_14356 ?auto_14343 ) ) ( not ( = ?auto_14356 ?auto_14344 ) ) ( not ( = ?auto_14326 ?auto_14332 ) ) ( not ( = ?auto_14326 ?auto_14342 ) ) ( not ( = ?auto_14327 ?auto_14332 ) ) ( not ( = ?auto_14327 ?auto_14342 ) ) ( not ( = ?auto_14328 ?auto_14332 ) ) ( not ( = ?auto_14328 ?auto_14342 ) ) ( not ( = ?auto_14329 ?auto_14332 ) ) ( not ( = ?auto_14329 ?auto_14342 ) ) ( not ( = ?auto_14330 ?auto_14332 ) ) ( not ( = ?auto_14330 ?auto_14342 ) ) ( not ( = ?auto_14332 ?auto_14356 ) ) ( not ( = ?auto_14332 ?auto_14341 ) ) ( not ( = ?auto_14332 ?auto_14345 ) ) ( not ( = ?auto_14332 ?auto_14343 ) ) ( not ( = ?auto_14332 ?auto_14344 ) ) ( not ( = ?auto_14358 ?auto_14350 ) ) ( not ( = ?auto_14358 ?auto_14352 ) ) ( not ( = ?auto_14358 ?auto_14351 ) ) ( not ( = ?auto_14358 ?auto_14354 ) ) ( not ( = ?auto_14358 ?auto_14347 ) ) ( not ( = ?auto_14346 ?auto_14359 ) ) ( not ( = ?auto_14346 ?auto_14349 ) ) ( not ( = ?auto_14346 ?auto_14357 ) ) ( not ( = ?auto_14346 ?auto_14353 ) ) ( not ( = ?auto_14346 ?auto_14355 ) ) ( not ( = ?auto_14342 ?auto_14356 ) ) ( not ( = ?auto_14342 ?auto_14341 ) ) ( not ( = ?auto_14342 ?auto_14345 ) ) ( not ( = ?auto_14342 ?auto_14343 ) ) ( not ( = ?auto_14342 ?auto_14344 ) ) ( not ( = ?auto_14326 ?auto_14334 ) ) ( not ( = ?auto_14326 ?auto_14348 ) ) ( not ( = ?auto_14327 ?auto_14334 ) ) ( not ( = ?auto_14327 ?auto_14348 ) ) ( not ( = ?auto_14328 ?auto_14334 ) ) ( not ( = ?auto_14328 ?auto_14348 ) ) ( not ( = ?auto_14329 ?auto_14334 ) ) ( not ( = ?auto_14329 ?auto_14348 ) ) ( not ( = ?auto_14330 ?auto_14334 ) ) ( not ( = ?auto_14330 ?auto_14348 ) ) ( not ( = ?auto_14331 ?auto_14334 ) ) ( not ( = ?auto_14331 ?auto_14348 ) ) ( not ( = ?auto_14334 ?auto_14342 ) ) ( not ( = ?auto_14334 ?auto_14356 ) ) ( not ( = ?auto_14334 ?auto_14341 ) ) ( not ( = ?auto_14334 ?auto_14345 ) ) ( not ( = ?auto_14334 ?auto_14343 ) ) ( not ( = ?auto_14334 ?auto_14344 ) ) ( not ( = ?auto_14348 ?auto_14342 ) ) ( not ( = ?auto_14348 ?auto_14356 ) ) ( not ( = ?auto_14348 ?auto_14341 ) ) ( not ( = ?auto_14348 ?auto_14345 ) ) ( not ( = ?auto_14348 ?auto_14343 ) ) ( not ( = ?auto_14348 ?auto_14344 ) ) ( not ( = ?auto_14326 ?auto_14333 ) ) ( not ( = ?auto_14326 ?auto_14339 ) ) ( not ( = ?auto_14327 ?auto_14333 ) ) ( not ( = ?auto_14327 ?auto_14339 ) ) ( not ( = ?auto_14328 ?auto_14333 ) ) ( not ( = ?auto_14328 ?auto_14339 ) ) ( not ( = ?auto_14329 ?auto_14333 ) ) ( not ( = ?auto_14329 ?auto_14339 ) ) ( not ( = ?auto_14330 ?auto_14333 ) ) ( not ( = ?auto_14330 ?auto_14339 ) ) ( not ( = ?auto_14331 ?auto_14333 ) ) ( not ( = ?auto_14331 ?auto_14339 ) ) ( not ( = ?auto_14332 ?auto_14333 ) ) ( not ( = ?auto_14332 ?auto_14339 ) ) ( not ( = ?auto_14333 ?auto_14348 ) ) ( not ( = ?auto_14333 ?auto_14342 ) ) ( not ( = ?auto_14333 ?auto_14356 ) ) ( not ( = ?auto_14333 ?auto_14341 ) ) ( not ( = ?auto_14333 ?auto_14345 ) ) ( not ( = ?auto_14333 ?auto_14343 ) ) ( not ( = ?auto_14333 ?auto_14344 ) ) ( not ( = ?auto_14340 ?auto_14352 ) ) ( not ( = ?auto_14340 ?auto_14358 ) ) ( not ( = ?auto_14340 ?auto_14350 ) ) ( not ( = ?auto_14340 ?auto_14351 ) ) ( not ( = ?auto_14340 ?auto_14354 ) ) ( not ( = ?auto_14340 ?auto_14347 ) ) ( not ( = ?auto_14338 ?auto_14349 ) ) ( not ( = ?auto_14338 ?auto_14346 ) ) ( not ( = ?auto_14338 ?auto_14359 ) ) ( not ( = ?auto_14338 ?auto_14357 ) ) ( not ( = ?auto_14338 ?auto_14353 ) ) ( not ( = ?auto_14338 ?auto_14355 ) ) ( not ( = ?auto_14339 ?auto_14348 ) ) ( not ( = ?auto_14339 ?auto_14342 ) ) ( not ( = ?auto_14339 ?auto_14356 ) ) ( not ( = ?auto_14339 ?auto_14341 ) ) ( not ( = ?auto_14339 ?auto_14345 ) ) ( not ( = ?auto_14339 ?auto_14343 ) ) ( not ( = ?auto_14339 ?auto_14344 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_14326 ?auto_14327 ?auto_14328 ?auto_14329 ?auto_14330 ?auto_14331 ?auto_14332 ?auto_14334 )
      ( MAKE-1CRATE ?auto_14334 ?auto_14333 )
      ( MAKE-8CRATE-VERIFY ?auto_14326 ?auto_14327 ?auto_14328 ?auto_14329 ?auto_14330 ?auto_14331 ?auto_14332 ?auto_14334 ?auto_14333 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14362 - SURFACE
      ?auto_14363 - SURFACE
    )
    :vars
    (
      ?auto_14364 - HOIST
      ?auto_14365 - PLACE
      ?auto_14367 - PLACE
      ?auto_14368 - HOIST
      ?auto_14369 - SURFACE
      ?auto_14366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14364 ?auto_14365 ) ( SURFACE-AT ?auto_14362 ?auto_14365 ) ( CLEAR ?auto_14362 ) ( IS-CRATE ?auto_14363 ) ( AVAILABLE ?auto_14364 ) ( not ( = ?auto_14367 ?auto_14365 ) ) ( HOIST-AT ?auto_14368 ?auto_14367 ) ( AVAILABLE ?auto_14368 ) ( SURFACE-AT ?auto_14363 ?auto_14367 ) ( ON ?auto_14363 ?auto_14369 ) ( CLEAR ?auto_14363 ) ( TRUCK-AT ?auto_14366 ?auto_14365 ) ( not ( = ?auto_14362 ?auto_14363 ) ) ( not ( = ?auto_14362 ?auto_14369 ) ) ( not ( = ?auto_14363 ?auto_14369 ) ) ( not ( = ?auto_14364 ?auto_14368 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14366 ?auto_14365 ?auto_14367 )
      ( !LIFT ?auto_14368 ?auto_14363 ?auto_14369 ?auto_14367 )
      ( !LOAD ?auto_14368 ?auto_14363 ?auto_14366 ?auto_14367 )
      ( !DRIVE ?auto_14366 ?auto_14367 ?auto_14365 )
      ( !UNLOAD ?auto_14364 ?auto_14363 ?auto_14366 ?auto_14365 )
      ( !DROP ?auto_14364 ?auto_14363 ?auto_14362 ?auto_14365 )
      ( MAKE-1CRATE-VERIFY ?auto_14362 ?auto_14363 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_14380 - SURFACE
      ?auto_14381 - SURFACE
      ?auto_14382 - SURFACE
      ?auto_14383 - SURFACE
      ?auto_14384 - SURFACE
      ?auto_14385 - SURFACE
      ?auto_14386 - SURFACE
      ?auto_14389 - SURFACE
      ?auto_14388 - SURFACE
      ?auto_14387 - SURFACE
    )
    :vars
    (
      ?auto_14393 - HOIST
      ?auto_14394 - PLACE
      ?auto_14391 - PLACE
      ?auto_14395 - HOIST
      ?auto_14390 - SURFACE
      ?auto_14397 - PLACE
      ?auto_14398 - HOIST
      ?auto_14417 - SURFACE
      ?auto_14404 - PLACE
      ?auto_14401 - HOIST
      ?auto_14407 - SURFACE
      ?auto_14411 - PLACE
      ?auto_14409 - HOIST
      ?auto_14415 - SURFACE
      ?auto_14403 - PLACE
      ?auto_14414 - HOIST
      ?auto_14400 - SURFACE
      ?auto_14396 - SURFACE
      ?auto_14402 - PLACE
      ?auto_14413 - HOIST
      ?auto_14410 - SURFACE
      ?auto_14406 - PLACE
      ?auto_14405 - HOIST
      ?auto_14412 - SURFACE
      ?auto_14408 - PLACE
      ?auto_14399 - HOIST
      ?auto_14416 - SURFACE
      ?auto_14392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14393 ?auto_14394 ) ( IS-CRATE ?auto_14387 ) ( not ( = ?auto_14391 ?auto_14394 ) ) ( HOIST-AT ?auto_14395 ?auto_14391 ) ( AVAILABLE ?auto_14395 ) ( SURFACE-AT ?auto_14387 ?auto_14391 ) ( ON ?auto_14387 ?auto_14390 ) ( CLEAR ?auto_14387 ) ( not ( = ?auto_14388 ?auto_14387 ) ) ( not ( = ?auto_14388 ?auto_14390 ) ) ( not ( = ?auto_14387 ?auto_14390 ) ) ( not ( = ?auto_14393 ?auto_14395 ) ) ( IS-CRATE ?auto_14388 ) ( not ( = ?auto_14397 ?auto_14394 ) ) ( HOIST-AT ?auto_14398 ?auto_14397 ) ( AVAILABLE ?auto_14398 ) ( SURFACE-AT ?auto_14388 ?auto_14397 ) ( ON ?auto_14388 ?auto_14417 ) ( CLEAR ?auto_14388 ) ( not ( = ?auto_14389 ?auto_14388 ) ) ( not ( = ?auto_14389 ?auto_14417 ) ) ( not ( = ?auto_14388 ?auto_14417 ) ) ( not ( = ?auto_14393 ?auto_14398 ) ) ( IS-CRATE ?auto_14389 ) ( not ( = ?auto_14404 ?auto_14394 ) ) ( HOIST-AT ?auto_14401 ?auto_14404 ) ( SURFACE-AT ?auto_14389 ?auto_14404 ) ( ON ?auto_14389 ?auto_14407 ) ( CLEAR ?auto_14389 ) ( not ( = ?auto_14386 ?auto_14389 ) ) ( not ( = ?auto_14386 ?auto_14407 ) ) ( not ( = ?auto_14389 ?auto_14407 ) ) ( not ( = ?auto_14393 ?auto_14401 ) ) ( IS-CRATE ?auto_14386 ) ( not ( = ?auto_14411 ?auto_14394 ) ) ( HOIST-AT ?auto_14409 ?auto_14411 ) ( AVAILABLE ?auto_14409 ) ( SURFACE-AT ?auto_14386 ?auto_14411 ) ( ON ?auto_14386 ?auto_14415 ) ( CLEAR ?auto_14386 ) ( not ( = ?auto_14385 ?auto_14386 ) ) ( not ( = ?auto_14385 ?auto_14415 ) ) ( not ( = ?auto_14386 ?auto_14415 ) ) ( not ( = ?auto_14393 ?auto_14409 ) ) ( IS-CRATE ?auto_14385 ) ( not ( = ?auto_14403 ?auto_14394 ) ) ( HOIST-AT ?auto_14414 ?auto_14403 ) ( AVAILABLE ?auto_14414 ) ( SURFACE-AT ?auto_14385 ?auto_14403 ) ( ON ?auto_14385 ?auto_14400 ) ( CLEAR ?auto_14385 ) ( not ( = ?auto_14384 ?auto_14385 ) ) ( not ( = ?auto_14384 ?auto_14400 ) ) ( not ( = ?auto_14385 ?auto_14400 ) ) ( not ( = ?auto_14393 ?auto_14414 ) ) ( IS-CRATE ?auto_14384 ) ( AVAILABLE ?auto_14401 ) ( SURFACE-AT ?auto_14384 ?auto_14404 ) ( ON ?auto_14384 ?auto_14396 ) ( CLEAR ?auto_14384 ) ( not ( = ?auto_14383 ?auto_14384 ) ) ( not ( = ?auto_14383 ?auto_14396 ) ) ( not ( = ?auto_14384 ?auto_14396 ) ) ( IS-CRATE ?auto_14383 ) ( not ( = ?auto_14402 ?auto_14394 ) ) ( HOIST-AT ?auto_14413 ?auto_14402 ) ( AVAILABLE ?auto_14413 ) ( SURFACE-AT ?auto_14383 ?auto_14402 ) ( ON ?auto_14383 ?auto_14410 ) ( CLEAR ?auto_14383 ) ( not ( = ?auto_14382 ?auto_14383 ) ) ( not ( = ?auto_14382 ?auto_14410 ) ) ( not ( = ?auto_14383 ?auto_14410 ) ) ( not ( = ?auto_14393 ?auto_14413 ) ) ( IS-CRATE ?auto_14382 ) ( not ( = ?auto_14406 ?auto_14394 ) ) ( HOIST-AT ?auto_14405 ?auto_14406 ) ( AVAILABLE ?auto_14405 ) ( SURFACE-AT ?auto_14382 ?auto_14406 ) ( ON ?auto_14382 ?auto_14412 ) ( CLEAR ?auto_14382 ) ( not ( = ?auto_14381 ?auto_14382 ) ) ( not ( = ?auto_14381 ?auto_14412 ) ) ( not ( = ?auto_14382 ?auto_14412 ) ) ( not ( = ?auto_14393 ?auto_14405 ) ) ( SURFACE-AT ?auto_14380 ?auto_14394 ) ( CLEAR ?auto_14380 ) ( IS-CRATE ?auto_14381 ) ( AVAILABLE ?auto_14393 ) ( not ( = ?auto_14408 ?auto_14394 ) ) ( HOIST-AT ?auto_14399 ?auto_14408 ) ( AVAILABLE ?auto_14399 ) ( SURFACE-AT ?auto_14381 ?auto_14408 ) ( ON ?auto_14381 ?auto_14416 ) ( CLEAR ?auto_14381 ) ( TRUCK-AT ?auto_14392 ?auto_14394 ) ( not ( = ?auto_14380 ?auto_14381 ) ) ( not ( = ?auto_14380 ?auto_14416 ) ) ( not ( = ?auto_14381 ?auto_14416 ) ) ( not ( = ?auto_14393 ?auto_14399 ) ) ( not ( = ?auto_14380 ?auto_14382 ) ) ( not ( = ?auto_14380 ?auto_14412 ) ) ( not ( = ?auto_14382 ?auto_14416 ) ) ( not ( = ?auto_14406 ?auto_14408 ) ) ( not ( = ?auto_14405 ?auto_14399 ) ) ( not ( = ?auto_14412 ?auto_14416 ) ) ( not ( = ?auto_14380 ?auto_14383 ) ) ( not ( = ?auto_14380 ?auto_14410 ) ) ( not ( = ?auto_14381 ?auto_14383 ) ) ( not ( = ?auto_14381 ?auto_14410 ) ) ( not ( = ?auto_14383 ?auto_14412 ) ) ( not ( = ?auto_14383 ?auto_14416 ) ) ( not ( = ?auto_14402 ?auto_14406 ) ) ( not ( = ?auto_14402 ?auto_14408 ) ) ( not ( = ?auto_14413 ?auto_14405 ) ) ( not ( = ?auto_14413 ?auto_14399 ) ) ( not ( = ?auto_14410 ?auto_14412 ) ) ( not ( = ?auto_14410 ?auto_14416 ) ) ( not ( = ?auto_14380 ?auto_14384 ) ) ( not ( = ?auto_14380 ?auto_14396 ) ) ( not ( = ?auto_14381 ?auto_14384 ) ) ( not ( = ?auto_14381 ?auto_14396 ) ) ( not ( = ?auto_14382 ?auto_14384 ) ) ( not ( = ?auto_14382 ?auto_14396 ) ) ( not ( = ?auto_14384 ?auto_14410 ) ) ( not ( = ?auto_14384 ?auto_14412 ) ) ( not ( = ?auto_14384 ?auto_14416 ) ) ( not ( = ?auto_14404 ?auto_14402 ) ) ( not ( = ?auto_14404 ?auto_14406 ) ) ( not ( = ?auto_14404 ?auto_14408 ) ) ( not ( = ?auto_14401 ?auto_14413 ) ) ( not ( = ?auto_14401 ?auto_14405 ) ) ( not ( = ?auto_14401 ?auto_14399 ) ) ( not ( = ?auto_14396 ?auto_14410 ) ) ( not ( = ?auto_14396 ?auto_14412 ) ) ( not ( = ?auto_14396 ?auto_14416 ) ) ( not ( = ?auto_14380 ?auto_14385 ) ) ( not ( = ?auto_14380 ?auto_14400 ) ) ( not ( = ?auto_14381 ?auto_14385 ) ) ( not ( = ?auto_14381 ?auto_14400 ) ) ( not ( = ?auto_14382 ?auto_14385 ) ) ( not ( = ?auto_14382 ?auto_14400 ) ) ( not ( = ?auto_14383 ?auto_14385 ) ) ( not ( = ?auto_14383 ?auto_14400 ) ) ( not ( = ?auto_14385 ?auto_14396 ) ) ( not ( = ?auto_14385 ?auto_14410 ) ) ( not ( = ?auto_14385 ?auto_14412 ) ) ( not ( = ?auto_14385 ?auto_14416 ) ) ( not ( = ?auto_14403 ?auto_14404 ) ) ( not ( = ?auto_14403 ?auto_14402 ) ) ( not ( = ?auto_14403 ?auto_14406 ) ) ( not ( = ?auto_14403 ?auto_14408 ) ) ( not ( = ?auto_14414 ?auto_14401 ) ) ( not ( = ?auto_14414 ?auto_14413 ) ) ( not ( = ?auto_14414 ?auto_14405 ) ) ( not ( = ?auto_14414 ?auto_14399 ) ) ( not ( = ?auto_14400 ?auto_14396 ) ) ( not ( = ?auto_14400 ?auto_14410 ) ) ( not ( = ?auto_14400 ?auto_14412 ) ) ( not ( = ?auto_14400 ?auto_14416 ) ) ( not ( = ?auto_14380 ?auto_14386 ) ) ( not ( = ?auto_14380 ?auto_14415 ) ) ( not ( = ?auto_14381 ?auto_14386 ) ) ( not ( = ?auto_14381 ?auto_14415 ) ) ( not ( = ?auto_14382 ?auto_14386 ) ) ( not ( = ?auto_14382 ?auto_14415 ) ) ( not ( = ?auto_14383 ?auto_14386 ) ) ( not ( = ?auto_14383 ?auto_14415 ) ) ( not ( = ?auto_14384 ?auto_14386 ) ) ( not ( = ?auto_14384 ?auto_14415 ) ) ( not ( = ?auto_14386 ?auto_14400 ) ) ( not ( = ?auto_14386 ?auto_14396 ) ) ( not ( = ?auto_14386 ?auto_14410 ) ) ( not ( = ?auto_14386 ?auto_14412 ) ) ( not ( = ?auto_14386 ?auto_14416 ) ) ( not ( = ?auto_14411 ?auto_14403 ) ) ( not ( = ?auto_14411 ?auto_14404 ) ) ( not ( = ?auto_14411 ?auto_14402 ) ) ( not ( = ?auto_14411 ?auto_14406 ) ) ( not ( = ?auto_14411 ?auto_14408 ) ) ( not ( = ?auto_14409 ?auto_14414 ) ) ( not ( = ?auto_14409 ?auto_14401 ) ) ( not ( = ?auto_14409 ?auto_14413 ) ) ( not ( = ?auto_14409 ?auto_14405 ) ) ( not ( = ?auto_14409 ?auto_14399 ) ) ( not ( = ?auto_14415 ?auto_14400 ) ) ( not ( = ?auto_14415 ?auto_14396 ) ) ( not ( = ?auto_14415 ?auto_14410 ) ) ( not ( = ?auto_14415 ?auto_14412 ) ) ( not ( = ?auto_14415 ?auto_14416 ) ) ( not ( = ?auto_14380 ?auto_14389 ) ) ( not ( = ?auto_14380 ?auto_14407 ) ) ( not ( = ?auto_14381 ?auto_14389 ) ) ( not ( = ?auto_14381 ?auto_14407 ) ) ( not ( = ?auto_14382 ?auto_14389 ) ) ( not ( = ?auto_14382 ?auto_14407 ) ) ( not ( = ?auto_14383 ?auto_14389 ) ) ( not ( = ?auto_14383 ?auto_14407 ) ) ( not ( = ?auto_14384 ?auto_14389 ) ) ( not ( = ?auto_14384 ?auto_14407 ) ) ( not ( = ?auto_14385 ?auto_14389 ) ) ( not ( = ?auto_14385 ?auto_14407 ) ) ( not ( = ?auto_14389 ?auto_14415 ) ) ( not ( = ?auto_14389 ?auto_14400 ) ) ( not ( = ?auto_14389 ?auto_14396 ) ) ( not ( = ?auto_14389 ?auto_14410 ) ) ( not ( = ?auto_14389 ?auto_14412 ) ) ( not ( = ?auto_14389 ?auto_14416 ) ) ( not ( = ?auto_14407 ?auto_14415 ) ) ( not ( = ?auto_14407 ?auto_14400 ) ) ( not ( = ?auto_14407 ?auto_14396 ) ) ( not ( = ?auto_14407 ?auto_14410 ) ) ( not ( = ?auto_14407 ?auto_14412 ) ) ( not ( = ?auto_14407 ?auto_14416 ) ) ( not ( = ?auto_14380 ?auto_14388 ) ) ( not ( = ?auto_14380 ?auto_14417 ) ) ( not ( = ?auto_14381 ?auto_14388 ) ) ( not ( = ?auto_14381 ?auto_14417 ) ) ( not ( = ?auto_14382 ?auto_14388 ) ) ( not ( = ?auto_14382 ?auto_14417 ) ) ( not ( = ?auto_14383 ?auto_14388 ) ) ( not ( = ?auto_14383 ?auto_14417 ) ) ( not ( = ?auto_14384 ?auto_14388 ) ) ( not ( = ?auto_14384 ?auto_14417 ) ) ( not ( = ?auto_14385 ?auto_14388 ) ) ( not ( = ?auto_14385 ?auto_14417 ) ) ( not ( = ?auto_14386 ?auto_14388 ) ) ( not ( = ?auto_14386 ?auto_14417 ) ) ( not ( = ?auto_14388 ?auto_14407 ) ) ( not ( = ?auto_14388 ?auto_14415 ) ) ( not ( = ?auto_14388 ?auto_14400 ) ) ( not ( = ?auto_14388 ?auto_14396 ) ) ( not ( = ?auto_14388 ?auto_14410 ) ) ( not ( = ?auto_14388 ?auto_14412 ) ) ( not ( = ?auto_14388 ?auto_14416 ) ) ( not ( = ?auto_14397 ?auto_14404 ) ) ( not ( = ?auto_14397 ?auto_14411 ) ) ( not ( = ?auto_14397 ?auto_14403 ) ) ( not ( = ?auto_14397 ?auto_14402 ) ) ( not ( = ?auto_14397 ?auto_14406 ) ) ( not ( = ?auto_14397 ?auto_14408 ) ) ( not ( = ?auto_14398 ?auto_14401 ) ) ( not ( = ?auto_14398 ?auto_14409 ) ) ( not ( = ?auto_14398 ?auto_14414 ) ) ( not ( = ?auto_14398 ?auto_14413 ) ) ( not ( = ?auto_14398 ?auto_14405 ) ) ( not ( = ?auto_14398 ?auto_14399 ) ) ( not ( = ?auto_14417 ?auto_14407 ) ) ( not ( = ?auto_14417 ?auto_14415 ) ) ( not ( = ?auto_14417 ?auto_14400 ) ) ( not ( = ?auto_14417 ?auto_14396 ) ) ( not ( = ?auto_14417 ?auto_14410 ) ) ( not ( = ?auto_14417 ?auto_14412 ) ) ( not ( = ?auto_14417 ?auto_14416 ) ) ( not ( = ?auto_14380 ?auto_14387 ) ) ( not ( = ?auto_14380 ?auto_14390 ) ) ( not ( = ?auto_14381 ?auto_14387 ) ) ( not ( = ?auto_14381 ?auto_14390 ) ) ( not ( = ?auto_14382 ?auto_14387 ) ) ( not ( = ?auto_14382 ?auto_14390 ) ) ( not ( = ?auto_14383 ?auto_14387 ) ) ( not ( = ?auto_14383 ?auto_14390 ) ) ( not ( = ?auto_14384 ?auto_14387 ) ) ( not ( = ?auto_14384 ?auto_14390 ) ) ( not ( = ?auto_14385 ?auto_14387 ) ) ( not ( = ?auto_14385 ?auto_14390 ) ) ( not ( = ?auto_14386 ?auto_14387 ) ) ( not ( = ?auto_14386 ?auto_14390 ) ) ( not ( = ?auto_14389 ?auto_14387 ) ) ( not ( = ?auto_14389 ?auto_14390 ) ) ( not ( = ?auto_14387 ?auto_14417 ) ) ( not ( = ?auto_14387 ?auto_14407 ) ) ( not ( = ?auto_14387 ?auto_14415 ) ) ( not ( = ?auto_14387 ?auto_14400 ) ) ( not ( = ?auto_14387 ?auto_14396 ) ) ( not ( = ?auto_14387 ?auto_14410 ) ) ( not ( = ?auto_14387 ?auto_14412 ) ) ( not ( = ?auto_14387 ?auto_14416 ) ) ( not ( = ?auto_14391 ?auto_14397 ) ) ( not ( = ?auto_14391 ?auto_14404 ) ) ( not ( = ?auto_14391 ?auto_14411 ) ) ( not ( = ?auto_14391 ?auto_14403 ) ) ( not ( = ?auto_14391 ?auto_14402 ) ) ( not ( = ?auto_14391 ?auto_14406 ) ) ( not ( = ?auto_14391 ?auto_14408 ) ) ( not ( = ?auto_14395 ?auto_14398 ) ) ( not ( = ?auto_14395 ?auto_14401 ) ) ( not ( = ?auto_14395 ?auto_14409 ) ) ( not ( = ?auto_14395 ?auto_14414 ) ) ( not ( = ?auto_14395 ?auto_14413 ) ) ( not ( = ?auto_14395 ?auto_14405 ) ) ( not ( = ?auto_14395 ?auto_14399 ) ) ( not ( = ?auto_14390 ?auto_14417 ) ) ( not ( = ?auto_14390 ?auto_14407 ) ) ( not ( = ?auto_14390 ?auto_14415 ) ) ( not ( = ?auto_14390 ?auto_14400 ) ) ( not ( = ?auto_14390 ?auto_14396 ) ) ( not ( = ?auto_14390 ?auto_14410 ) ) ( not ( = ?auto_14390 ?auto_14412 ) ) ( not ( = ?auto_14390 ?auto_14416 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_14380 ?auto_14381 ?auto_14382 ?auto_14383 ?auto_14384 ?auto_14385 ?auto_14386 ?auto_14389 ?auto_14388 )
      ( MAKE-1CRATE ?auto_14388 ?auto_14387 )
      ( MAKE-9CRATE-VERIFY ?auto_14380 ?auto_14381 ?auto_14382 ?auto_14383 ?auto_14384 ?auto_14385 ?auto_14386 ?auto_14389 ?auto_14388 ?auto_14387 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14420 - SURFACE
      ?auto_14421 - SURFACE
    )
    :vars
    (
      ?auto_14422 - HOIST
      ?auto_14423 - PLACE
      ?auto_14425 - PLACE
      ?auto_14426 - HOIST
      ?auto_14427 - SURFACE
      ?auto_14424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14422 ?auto_14423 ) ( SURFACE-AT ?auto_14420 ?auto_14423 ) ( CLEAR ?auto_14420 ) ( IS-CRATE ?auto_14421 ) ( AVAILABLE ?auto_14422 ) ( not ( = ?auto_14425 ?auto_14423 ) ) ( HOIST-AT ?auto_14426 ?auto_14425 ) ( AVAILABLE ?auto_14426 ) ( SURFACE-AT ?auto_14421 ?auto_14425 ) ( ON ?auto_14421 ?auto_14427 ) ( CLEAR ?auto_14421 ) ( TRUCK-AT ?auto_14424 ?auto_14423 ) ( not ( = ?auto_14420 ?auto_14421 ) ) ( not ( = ?auto_14420 ?auto_14427 ) ) ( not ( = ?auto_14421 ?auto_14427 ) ) ( not ( = ?auto_14422 ?auto_14426 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14424 ?auto_14423 ?auto_14425 )
      ( !LIFT ?auto_14426 ?auto_14421 ?auto_14427 ?auto_14425 )
      ( !LOAD ?auto_14426 ?auto_14421 ?auto_14424 ?auto_14425 )
      ( !DRIVE ?auto_14424 ?auto_14425 ?auto_14423 )
      ( !UNLOAD ?auto_14422 ?auto_14421 ?auto_14424 ?auto_14423 )
      ( !DROP ?auto_14422 ?auto_14421 ?auto_14420 ?auto_14423 )
      ( MAKE-1CRATE-VERIFY ?auto_14420 ?auto_14421 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_14439 - SURFACE
      ?auto_14440 - SURFACE
      ?auto_14441 - SURFACE
      ?auto_14442 - SURFACE
      ?auto_14443 - SURFACE
      ?auto_14444 - SURFACE
      ?auto_14445 - SURFACE
      ?auto_14448 - SURFACE
      ?auto_14447 - SURFACE
      ?auto_14446 - SURFACE
      ?auto_14449 - SURFACE
    )
    :vars
    (
      ?auto_14451 - HOIST
      ?auto_14452 - PLACE
      ?auto_14453 - PLACE
      ?auto_14454 - HOIST
      ?auto_14455 - SURFACE
      ?auto_14459 - PLACE
      ?auto_14474 - HOIST
      ?auto_14479 - SURFACE
      ?auto_14460 - PLACE
      ?auto_14457 - HOIST
      ?auto_14480 - SURFACE
      ?auto_14473 - PLACE
      ?auto_14464 - HOIST
      ?auto_14469 - SURFACE
      ?auto_14471 - PLACE
      ?auto_14461 - HOIST
      ?auto_14456 - SURFACE
      ?auto_14462 - PLACE
      ?auto_14472 - HOIST
      ?auto_14465 - SURFACE
      ?auto_14476 - SURFACE
      ?auto_14463 - PLACE
      ?auto_14466 - HOIST
      ?auto_14475 - SURFACE
      ?auto_14478 - PLACE
      ?auto_14468 - HOIST
      ?auto_14477 - SURFACE
      ?auto_14458 - PLACE
      ?auto_14467 - HOIST
      ?auto_14470 - SURFACE
      ?auto_14450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14451 ?auto_14452 ) ( IS-CRATE ?auto_14449 ) ( not ( = ?auto_14453 ?auto_14452 ) ) ( HOIST-AT ?auto_14454 ?auto_14453 ) ( AVAILABLE ?auto_14454 ) ( SURFACE-AT ?auto_14449 ?auto_14453 ) ( ON ?auto_14449 ?auto_14455 ) ( CLEAR ?auto_14449 ) ( not ( = ?auto_14446 ?auto_14449 ) ) ( not ( = ?auto_14446 ?auto_14455 ) ) ( not ( = ?auto_14449 ?auto_14455 ) ) ( not ( = ?auto_14451 ?auto_14454 ) ) ( IS-CRATE ?auto_14446 ) ( not ( = ?auto_14459 ?auto_14452 ) ) ( HOIST-AT ?auto_14474 ?auto_14459 ) ( AVAILABLE ?auto_14474 ) ( SURFACE-AT ?auto_14446 ?auto_14459 ) ( ON ?auto_14446 ?auto_14479 ) ( CLEAR ?auto_14446 ) ( not ( = ?auto_14447 ?auto_14446 ) ) ( not ( = ?auto_14447 ?auto_14479 ) ) ( not ( = ?auto_14446 ?auto_14479 ) ) ( not ( = ?auto_14451 ?auto_14474 ) ) ( IS-CRATE ?auto_14447 ) ( not ( = ?auto_14460 ?auto_14452 ) ) ( HOIST-AT ?auto_14457 ?auto_14460 ) ( AVAILABLE ?auto_14457 ) ( SURFACE-AT ?auto_14447 ?auto_14460 ) ( ON ?auto_14447 ?auto_14480 ) ( CLEAR ?auto_14447 ) ( not ( = ?auto_14448 ?auto_14447 ) ) ( not ( = ?auto_14448 ?auto_14480 ) ) ( not ( = ?auto_14447 ?auto_14480 ) ) ( not ( = ?auto_14451 ?auto_14457 ) ) ( IS-CRATE ?auto_14448 ) ( not ( = ?auto_14473 ?auto_14452 ) ) ( HOIST-AT ?auto_14464 ?auto_14473 ) ( SURFACE-AT ?auto_14448 ?auto_14473 ) ( ON ?auto_14448 ?auto_14469 ) ( CLEAR ?auto_14448 ) ( not ( = ?auto_14445 ?auto_14448 ) ) ( not ( = ?auto_14445 ?auto_14469 ) ) ( not ( = ?auto_14448 ?auto_14469 ) ) ( not ( = ?auto_14451 ?auto_14464 ) ) ( IS-CRATE ?auto_14445 ) ( not ( = ?auto_14471 ?auto_14452 ) ) ( HOIST-AT ?auto_14461 ?auto_14471 ) ( AVAILABLE ?auto_14461 ) ( SURFACE-AT ?auto_14445 ?auto_14471 ) ( ON ?auto_14445 ?auto_14456 ) ( CLEAR ?auto_14445 ) ( not ( = ?auto_14444 ?auto_14445 ) ) ( not ( = ?auto_14444 ?auto_14456 ) ) ( not ( = ?auto_14445 ?auto_14456 ) ) ( not ( = ?auto_14451 ?auto_14461 ) ) ( IS-CRATE ?auto_14444 ) ( not ( = ?auto_14462 ?auto_14452 ) ) ( HOIST-AT ?auto_14472 ?auto_14462 ) ( AVAILABLE ?auto_14472 ) ( SURFACE-AT ?auto_14444 ?auto_14462 ) ( ON ?auto_14444 ?auto_14465 ) ( CLEAR ?auto_14444 ) ( not ( = ?auto_14443 ?auto_14444 ) ) ( not ( = ?auto_14443 ?auto_14465 ) ) ( not ( = ?auto_14444 ?auto_14465 ) ) ( not ( = ?auto_14451 ?auto_14472 ) ) ( IS-CRATE ?auto_14443 ) ( AVAILABLE ?auto_14464 ) ( SURFACE-AT ?auto_14443 ?auto_14473 ) ( ON ?auto_14443 ?auto_14476 ) ( CLEAR ?auto_14443 ) ( not ( = ?auto_14442 ?auto_14443 ) ) ( not ( = ?auto_14442 ?auto_14476 ) ) ( not ( = ?auto_14443 ?auto_14476 ) ) ( IS-CRATE ?auto_14442 ) ( not ( = ?auto_14463 ?auto_14452 ) ) ( HOIST-AT ?auto_14466 ?auto_14463 ) ( AVAILABLE ?auto_14466 ) ( SURFACE-AT ?auto_14442 ?auto_14463 ) ( ON ?auto_14442 ?auto_14475 ) ( CLEAR ?auto_14442 ) ( not ( = ?auto_14441 ?auto_14442 ) ) ( not ( = ?auto_14441 ?auto_14475 ) ) ( not ( = ?auto_14442 ?auto_14475 ) ) ( not ( = ?auto_14451 ?auto_14466 ) ) ( IS-CRATE ?auto_14441 ) ( not ( = ?auto_14478 ?auto_14452 ) ) ( HOIST-AT ?auto_14468 ?auto_14478 ) ( AVAILABLE ?auto_14468 ) ( SURFACE-AT ?auto_14441 ?auto_14478 ) ( ON ?auto_14441 ?auto_14477 ) ( CLEAR ?auto_14441 ) ( not ( = ?auto_14440 ?auto_14441 ) ) ( not ( = ?auto_14440 ?auto_14477 ) ) ( not ( = ?auto_14441 ?auto_14477 ) ) ( not ( = ?auto_14451 ?auto_14468 ) ) ( SURFACE-AT ?auto_14439 ?auto_14452 ) ( CLEAR ?auto_14439 ) ( IS-CRATE ?auto_14440 ) ( AVAILABLE ?auto_14451 ) ( not ( = ?auto_14458 ?auto_14452 ) ) ( HOIST-AT ?auto_14467 ?auto_14458 ) ( AVAILABLE ?auto_14467 ) ( SURFACE-AT ?auto_14440 ?auto_14458 ) ( ON ?auto_14440 ?auto_14470 ) ( CLEAR ?auto_14440 ) ( TRUCK-AT ?auto_14450 ?auto_14452 ) ( not ( = ?auto_14439 ?auto_14440 ) ) ( not ( = ?auto_14439 ?auto_14470 ) ) ( not ( = ?auto_14440 ?auto_14470 ) ) ( not ( = ?auto_14451 ?auto_14467 ) ) ( not ( = ?auto_14439 ?auto_14441 ) ) ( not ( = ?auto_14439 ?auto_14477 ) ) ( not ( = ?auto_14441 ?auto_14470 ) ) ( not ( = ?auto_14478 ?auto_14458 ) ) ( not ( = ?auto_14468 ?auto_14467 ) ) ( not ( = ?auto_14477 ?auto_14470 ) ) ( not ( = ?auto_14439 ?auto_14442 ) ) ( not ( = ?auto_14439 ?auto_14475 ) ) ( not ( = ?auto_14440 ?auto_14442 ) ) ( not ( = ?auto_14440 ?auto_14475 ) ) ( not ( = ?auto_14442 ?auto_14477 ) ) ( not ( = ?auto_14442 ?auto_14470 ) ) ( not ( = ?auto_14463 ?auto_14478 ) ) ( not ( = ?auto_14463 ?auto_14458 ) ) ( not ( = ?auto_14466 ?auto_14468 ) ) ( not ( = ?auto_14466 ?auto_14467 ) ) ( not ( = ?auto_14475 ?auto_14477 ) ) ( not ( = ?auto_14475 ?auto_14470 ) ) ( not ( = ?auto_14439 ?auto_14443 ) ) ( not ( = ?auto_14439 ?auto_14476 ) ) ( not ( = ?auto_14440 ?auto_14443 ) ) ( not ( = ?auto_14440 ?auto_14476 ) ) ( not ( = ?auto_14441 ?auto_14443 ) ) ( not ( = ?auto_14441 ?auto_14476 ) ) ( not ( = ?auto_14443 ?auto_14475 ) ) ( not ( = ?auto_14443 ?auto_14477 ) ) ( not ( = ?auto_14443 ?auto_14470 ) ) ( not ( = ?auto_14473 ?auto_14463 ) ) ( not ( = ?auto_14473 ?auto_14478 ) ) ( not ( = ?auto_14473 ?auto_14458 ) ) ( not ( = ?auto_14464 ?auto_14466 ) ) ( not ( = ?auto_14464 ?auto_14468 ) ) ( not ( = ?auto_14464 ?auto_14467 ) ) ( not ( = ?auto_14476 ?auto_14475 ) ) ( not ( = ?auto_14476 ?auto_14477 ) ) ( not ( = ?auto_14476 ?auto_14470 ) ) ( not ( = ?auto_14439 ?auto_14444 ) ) ( not ( = ?auto_14439 ?auto_14465 ) ) ( not ( = ?auto_14440 ?auto_14444 ) ) ( not ( = ?auto_14440 ?auto_14465 ) ) ( not ( = ?auto_14441 ?auto_14444 ) ) ( not ( = ?auto_14441 ?auto_14465 ) ) ( not ( = ?auto_14442 ?auto_14444 ) ) ( not ( = ?auto_14442 ?auto_14465 ) ) ( not ( = ?auto_14444 ?auto_14476 ) ) ( not ( = ?auto_14444 ?auto_14475 ) ) ( not ( = ?auto_14444 ?auto_14477 ) ) ( not ( = ?auto_14444 ?auto_14470 ) ) ( not ( = ?auto_14462 ?auto_14473 ) ) ( not ( = ?auto_14462 ?auto_14463 ) ) ( not ( = ?auto_14462 ?auto_14478 ) ) ( not ( = ?auto_14462 ?auto_14458 ) ) ( not ( = ?auto_14472 ?auto_14464 ) ) ( not ( = ?auto_14472 ?auto_14466 ) ) ( not ( = ?auto_14472 ?auto_14468 ) ) ( not ( = ?auto_14472 ?auto_14467 ) ) ( not ( = ?auto_14465 ?auto_14476 ) ) ( not ( = ?auto_14465 ?auto_14475 ) ) ( not ( = ?auto_14465 ?auto_14477 ) ) ( not ( = ?auto_14465 ?auto_14470 ) ) ( not ( = ?auto_14439 ?auto_14445 ) ) ( not ( = ?auto_14439 ?auto_14456 ) ) ( not ( = ?auto_14440 ?auto_14445 ) ) ( not ( = ?auto_14440 ?auto_14456 ) ) ( not ( = ?auto_14441 ?auto_14445 ) ) ( not ( = ?auto_14441 ?auto_14456 ) ) ( not ( = ?auto_14442 ?auto_14445 ) ) ( not ( = ?auto_14442 ?auto_14456 ) ) ( not ( = ?auto_14443 ?auto_14445 ) ) ( not ( = ?auto_14443 ?auto_14456 ) ) ( not ( = ?auto_14445 ?auto_14465 ) ) ( not ( = ?auto_14445 ?auto_14476 ) ) ( not ( = ?auto_14445 ?auto_14475 ) ) ( not ( = ?auto_14445 ?auto_14477 ) ) ( not ( = ?auto_14445 ?auto_14470 ) ) ( not ( = ?auto_14471 ?auto_14462 ) ) ( not ( = ?auto_14471 ?auto_14473 ) ) ( not ( = ?auto_14471 ?auto_14463 ) ) ( not ( = ?auto_14471 ?auto_14478 ) ) ( not ( = ?auto_14471 ?auto_14458 ) ) ( not ( = ?auto_14461 ?auto_14472 ) ) ( not ( = ?auto_14461 ?auto_14464 ) ) ( not ( = ?auto_14461 ?auto_14466 ) ) ( not ( = ?auto_14461 ?auto_14468 ) ) ( not ( = ?auto_14461 ?auto_14467 ) ) ( not ( = ?auto_14456 ?auto_14465 ) ) ( not ( = ?auto_14456 ?auto_14476 ) ) ( not ( = ?auto_14456 ?auto_14475 ) ) ( not ( = ?auto_14456 ?auto_14477 ) ) ( not ( = ?auto_14456 ?auto_14470 ) ) ( not ( = ?auto_14439 ?auto_14448 ) ) ( not ( = ?auto_14439 ?auto_14469 ) ) ( not ( = ?auto_14440 ?auto_14448 ) ) ( not ( = ?auto_14440 ?auto_14469 ) ) ( not ( = ?auto_14441 ?auto_14448 ) ) ( not ( = ?auto_14441 ?auto_14469 ) ) ( not ( = ?auto_14442 ?auto_14448 ) ) ( not ( = ?auto_14442 ?auto_14469 ) ) ( not ( = ?auto_14443 ?auto_14448 ) ) ( not ( = ?auto_14443 ?auto_14469 ) ) ( not ( = ?auto_14444 ?auto_14448 ) ) ( not ( = ?auto_14444 ?auto_14469 ) ) ( not ( = ?auto_14448 ?auto_14456 ) ) ( not ( = ?auto_14448 ?auto_14465 ) ) ( not ( = ?auto_14448 ?auto_14476 ) ) ( not ( = ?auto_14448 ?auto_14475 ) ) ( not ( = ?auto_14448 ?auto_14477 ) ) ( not ( = ?auto_14448 ?auto_14470 ) ) ( not ( = ?auto_14469 ?auto_14456 ) ) ( not ( = ?auto_14469 ?auto_14465 ) ) ( not ( = ?auto_14469 ?auto_14476 ) ) ( not ( = ?auto_14469 ?auto_14475 ) ) ( not ( = ?auto_14469 ?auto_14477 ) ) ( not ( = ?auto_14469 ?auto_14470 ) ) ( not ( = ?auto_14439 ?auto_14447 ) ) ( not ( = ?auto_14439 ?auto_14480 ) ) ( not ( = ?auto_14440 ?auto_14447 ) ) ( not ( = ?auto_14440 ?auto_14480 ) ) ( not ( = ?auto_14441 ?auto_14447 ) ) ( not ( = ?auto_14441 ?auto_14480 ) ) ( not ( = ?auto_14442 ?auto_14447 ) ) ( not ( = ?auto_14442 ?auto_14480 ) ) ( not ( = ?auto_14443 ?auto_14447 ) ) ( not ( = ?auto_14443 ?auto_14480 ) ) ( not ( = ?auto_14444 ?auto_14447 ) ) ( not ( = ?auto_14444 ?auto_14480 ) ) ( not ( = ?auto_14445 ?auto_14447 ) ) ( not ( = ?auto_14445 ?auto_14480 ) ) ( not ( = ?auto_14447 ?auto_14469 ) ) ( not ( = ?auto_14447 ?auto_14456 ) ) ( not ( = ?auto_14447 ?auto_14465 ) ) ( not ( = ?auto_14447 ?auto_14476 ) ) ( not ( = ?auto_14447 ?auto_14475 ) ) ( not ( = ?auto_14447 ?auto_14477 ) ) ( not ( = ?auto_14447 ?auto_14470 ) ) ( not ( = ?auto_14460 ?auto_14473 ) ) ( not ( = ?auto_14460 ?auto_14471 ) ) ( not ( = ?auto_14460 ?auto_14462 ) ) ( not ( = ?auto_14460 ?auto_14463 ) ) ( not ( = ?auto_14460 ?auto_14478 ) ) ( not ( = ?auto_14460 ?auto_14458 ) ) ( not ( = ?auto_14457 ?auto_14464 ) ) ( not ( = ?auto_14457 ?auto_14461 ) ) ( not ( = ?auto_14457 ?auto_14472 ) ) ( not ( = ?auto_14457 ?auto_14466 ) ) ( not ( = ?auto_14457 ?auto_14468 ) ) ( not ( = ?auto_14457 ?auto_14467 ) ) ( not ( = ?auto_14480 ?auto_14469 ) ) ( not ( = ?auto_14480 ?auto_14456 ) ) ( not ( = ?auto_14480 ?auto_14465 ) ) ( not ( = ?auto_14480 ?auto_14476 ) ) ( not ( = ?auto_14480 ?auto_14475 ) ) ( not ( = ?auto_14480 ?auto_14477 ) ) ( not ( = ?auto_14480 ?auto_14470 ) ) ( not ( = ?auto_14439 ?auto_14446 ) ) ( not ( = ?auto_14439 ?auto_14479 ) ) ( not ( = ?auto_14440 ?auto_14446 ) ) ( not ( = ?auto_14440 ?auto_14479 ) ) ( not ( = ?auto_14441 ?auto_14446 ) ) ( not ( = ?auto_14441 ?auto_14479 ) ) ( not ( = ?auto_14442 ?auto_14446 ) ) ( not ( = ?auto_14442 ?auto_14479 ) ) ( not ( = ?auto_14443 ?auto_14446 ) ) ( not ( = ?auto_14443 ?auto_14479 ) ) ( not ( = ?auto_14444 ?auto_14446 ) ) ( not ( = ?auto_14444 ?auto_14479 ) ) ( not ( = ?auto_14445 ?auto_14446 ) ) ( not ( = ?auto_14445 ?auto_14479 ) ) ( not ( = ?auto_14448 ?auto_14446 ) ) ( not ( = ?auto_14448 ?auto_14479 ) ) ( not ( = ?auto_14446 ?auto_14480 ) ) ( not ( = ?auto_14446 ?auto_14469 ) ) ( not ( = ?auto_14446 ?auto_14456 ) ) ( not ( = ?auto_14446 ?auto_14465 ) ) ( not ( = ?auto_14446 ?auto_14476 ) ) ( not ( = ?auto_14446 ?auto_14475 ) ) ( not ( = ?auto_14446 ?auto_14477 ) ) ( not ( = ?auto_14446 ?auto_14470 ) ) ( not ( = ?auto_14459 ?auto_14460 ) ) ( not ( = ?auto_14459 ?auto_14473 ) ) ( not ( = ?auto_14459 ?auto_14471 ) ) ( not ( = ?auto_14459 ?auto_14462 ) ) ( not ( = ?auto_14459 ?auto_14463 ) ) ( not ( = ?auto_14459 ?auto_14478 ) ) ( not ( = ?auto_14459 ?auto_14458 ) ) ( not ( = ?auto_14474 ?auto_14457 ) ) ( not ( = ?auto_14474 ?auto_14464 ) ) ( not ( = ?auto_14474 ?auto_14461 ) ) ( not ( = ?auto_14474 ?auto_14472 ) ) ( not ( = ?auto_14474 ?auto_14466 ) ) ( not ( = ?auto_14474 ?auto_14468 ) ) ( not ( = ?auto_14474 ?auto_14467 ) ) ( not ( = ?auto_14479 ?auto_14480 ) ) ( not ( = ?auto_14479 ?auto_14469 ) ) ( not ( = ?auto_14479 ?auto_14456 ) ) ( not ( = ?auto_14479 ?auto_14465 ) ) ( not ( = ?auto_14479 ?auto_14476 ) ) ( not ( = ?auto_14479 ?auto_14475 ) ) ( not ( = ?auto_14479 ?auto_14477 ) ) ( not ( = ?auto_14479 ?auto_14470 ) ) ( not ( = ?auto_14439 ?auto_14449 ) ) ( not ( = ?auto_14439 ?auto_14455 ) ) ( not ( = ?auto_14440 ?auto_14449 ) ) ( not ( = ?auto_14440 ?auto_14455 ) ) ( not ( = ?auto_14441 ?auto_14449 ) ) ( not ( = ?auto_14441 ?auto_14455 ) ) ( not ( = ?auto_14442 ?auto_14449 ) ) ( not ( = ?auto_14442 ?auto_14455 ) ) ( not ( = ?auto_14443 ?auto_14449 ) ) ( not ( = ?auto_14443 ?auto_14455 ) ) ( not ( = ?auto_14444 ?auto_14449 ) ) ( not ( = ?auto_14444 ?auto_14455 ) ) ( not ( = ?auto_14445 ?auto_14449 ) ) ( not ( = ?auto_14445 ?auto_14455 ) ) ( not ( = ?auto_14448 ?auto_14449 ) ) ( not ( = ?auto_14448 ?auto_14455 ) ) ( not ( = ?auto_14447 ?auto_14449 ) ) ( not ( = ?auto_14447 ?auto_14455 ) ) ( not ( = ?auto_14449 ?auto_14479 ) ) ( not ( = ?auto_14449 ?auto_14480 ) ) ( not ( = ?auto_14449 ?auto_14469 ) ) ( not ( = ?auto_14449 ?auto_14456 ) ) ( not ( = ?auto_14449 ?auto_14465 ) ) ( not ( = ?auto_14449 ?auto_14476 ) ) ( not ( = ?auto_14449 ?auto_14475 ) ) ( not ( = ?auto_14449 ?auto_14477 ) ) ( not ( = ?auto_14449 ?auto_14470 ) ) ( not ( = ?auto_14453 ?auto_14459 ) ) ( not ( = ?auto_14453 ?auto_14460 ) ) ( not ( = ?auto_14453 ?auto_14473 ) ) ( not ( = ?auto_14453 ?auto_14471 ) ) ( not ( = ?auto_14453 ?auto_14462 ) ) ( not ( = ?auto_14453 ?auto_14463 ) ) ( not ( = ?auto_14453 ?auto_14478 ) ) ( not ( = ?auto_14453 ?auto_14458 ) ) ( not ( = ?auto_14454 ?auto_14474 ) ) ( not ( = ?auto_14454 ?auto_14457 ) ) ( not ( = ?auto_14454 ?auto_14464 ) ) ( not ( = ?auto_14454 ?auto_14461 ) ) ( not ( = ?auto_14454 ?auto_14472 ) ) ( not ( = ?auto_14454 ?auto_14466 ) ) ( not ( = ?auto_14454 ?auto_14468 ) ) ( not ( = ?auto_14454 ?auto_14467 ) ) ( not ( = ?auto_14455 ?auto_14479 ) ) ( not ( = ?auto_14455 ?auto_14480 ) ) ( not ( = ?auto_14455 ?auto_14469 ) ) ( not ( = ?auto_14455 ?auto_14456 ) ) ( not ( = ?auto_14455 ?auto_14465 ) ) ( not ( = ?auto_14455 ?auto_14476 ) ) ( not ( = ?auto_14455 ?auto_14475 ) ) ( not ( = ?auto_14455 ?auto_14477 ) ) ( not ( = ?auto_14455 ?auto_14470 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_14439 ?auto_14440 ?auto_14441 ?auto_14442 ?auto_14443 ?auto_14444 ?auto_14445 ?auto_14448 ?auto_14447 ?auto_14446 )
      ( MAKE-1CRATE ?auto_14446 ?auto_14449 )
      ( MAKE-10CRATE-VERIFY ?auto_14439 ?auto_14440 ?auto_14441 ?auto_14442 ?auto_14443 ?auto_14444 ?auto_14445 ?auto_14448 ?auto_14447 ?auto_14446 ?auto_14449 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14483 - SURFACE
      ?auto_14484 - SURFACE
    )
    :vars
    (
      ?auto_14485 - HOIST
      ?auto_14486 - PLACE
      ?auto_14488 - PLACE
      ?auto_14489 - HOIST
      ?auto_14490 - SURFACE
      ?auto_14487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14485 ?auto_14486 ) ( SURFACE-AT ?auto_14483 ?auto_14486 ) ( CLEAR ?auto_14483 ) ( IS-CRATE ?auto_14484 ) ( AVAILABLE ?auto_14485 ) ( not ( = ?auto_14488 ?auto_14486 ) ) ( HOIST-AT ?auto_14489 ?auto_14488 ) ( AVAILABLE ?auto_14489 ) ( SURFACE-AT ?auto_14484 ?auto_14488 ) ( ON ?auto_14484 ?auto_14490 ) ( CLEAR ?auto_14484 ) ( TRUCK-AT ?auto_14487 ?auto_14486 ) ( not ( = ?auto_14483 ?auto_14484 ) ) ( not ( = ?auto_14483 ?auto_14490 ) ) ( not ( = ?auto_14484 ?auto_14490 ) ) ( not ( = ?auto_14485 ?auto_14489 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14487 ?auto_14486 ?auto_14488 )
      ( !LIFT ?auto_14489 ?auto_14484 ?auto_14490 ?auto_14488 )
      ( !LOAD ?auto_14489 ?auto_14484 ?auto_14487 ?auto_14488 )
      ( !DRIVE ?auto_14487 ?auto_14488 ?auto_14486 )
      ( !UNLOAD ?auto_14485 ?auto_14484 ?auto_14487 ?auto_14486 )
      ( !DROP ?auto_14485 ?auto_14484 ?auto_14483 ?auto_14486 )
      ( MAKE-1CRATE-VERIFY ?auto_14483 ?auto_14484 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_14503 - SURFACE
      ?auto_14504 - SURFACE
      ?auto_14505 - SURFACE
      ?auto_14506 - SURFACE
      ?auto_14507 - SURFACE
      ?auto_14508 - SURFACE
      ?auto_14509 - SURFACE
      ?auto_14512 - SURFACE
      ?auto_14511 - SURFACE
      ?auto_14510 - SURFACE
      ?auto_14513 - SURFACE
      ?auto_14514 - SURFACE
    )
    :vars
    (
      ?auto_14515 - HOIST
      ?auto_14518 - PLACE
      ?auto_14517 - PLACE
      ?auto_14516 - HOIST
      ?auto_14519 - SURFACE
      ?auto_14529 - PLACE
      ?auto_14532 - HOIST
      ?auto_14530 - SURFACE
      ?auto_14537 - PLACE
      ?auto_14526 - HOIST
      ?auto_14538 - SURFACE
      ?auto_14546 - SURFACE
      ?auto_14528 - PLACE
      ?auto_14521 - HOIST
      ?auto_14541 - SURFACE
      ?auto_14533 - PLACE
      ?auto_14535 - HOIST
      ?auto_14536 - SURFACE
      ?auto_14534 - PLACE
      ?auto_14525 - HOIST
      ?auto_14523 - SURFACE
      ?auto_14542 - SURFACE
      ?auto_14544 - PLACE
      ?auto_14540 - HOIST
      ?auto_14543 - SURFACE
      ?auto_14531 - PLACE
      ?auto_14522 - HOIST
      ?auto_14545 - SURFACE
      ?auto_14524 - PLACE
      ?auto_14527 - HOIST
      ?auto_14539 - SURFACE
      ?auto_14520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14515 ?auto_14518 ) ( IS-CRATE ?auto_14514 ) ( not ( = ?auto_14517 ?auto_14518 ) ) ( HOIST-AT ?auto_14516 ?auto_14517 ) ( SURFACE-AT ?auto_14514 ?auto_14517 ) ( ON ?auto_14514 ?auto_14519 ) ( CLEAR ?auto_14514 ) ( not ( = ?auto_14513 ?auto_14514 ) ) ( not ( = ?auto_14513 ?auto_14519 ) ) ( not ( = ?auto_14514 ?auto_14519 ) ) ( not ( = ?auto_14515 ?auto_14516 ) ) ( IS-CRATE ?auto_14513 ) ( not ( = ?auto_14529 ?auto_14518 ) ) ( HOIST-AT ?auto_14532 ?auto_14529 ) ( AVAILABLE ?auto_14532 ) ( SURFACE-AT ?auto_14513 ?auto_14529 ) ( ON ?auto_14513 ?auto_14530 ) ( CLEAR ?auto_14513 ) ( not ( = ?auto_14510 ?auto_14513 ) ) ( not ( = ?auto_14510 ?auto_14530 ) ) ( not ( = ?auto_14513 ?auto_14530 ) ) ( not ( = ?auto_14515 ?auto_14532 ) ) ( IS-CRATE ?auto_14510 ) ( not ( = ?auto_14537 ?auto_14518 ) ) ( HOIST-AT ?auto_14526 ?auto_14537 ) ( AVAILABLE ?auto_14526 ) ( SURFACE-AT ?auto_14510 ?auto_14537 ) ( ON ?auto_14510 ?auto_14538 ) ( CLEAR ?auto_14510 ) ( not ( = ?auto_14511 ?auto_14510 ) ) ( not ( = ?auto_14511 ?auto_14538 ) ) ( not ( = ?auto_14510 ?auto_14538 ) ) ( not ( = ?auto_14515 ?auto_14526 ) ) ( IS-CRATE ?auto_14511 ) ( AVAILABLE ?auto_14516 ) ( SURFACE-AT ?auto_14511 ?auto_14517 ) ( ON ?auto_14511 ?auto_14546 ) ( CLEAR ?auto_14511 ) ( not ( = ?auto_14512 ?auto_14511 ) ) ( not ( = ?auto_14512 ?auto_14546 ) ) ( not ( = ?auto_14511 ?auto_14546 ) ) ( IS-CRATE ?auto_14512 ) ( not ( = ?auto_14528 ?auto_14518 ) ) ( HOIST-AT ?auto_14521 ?auto_14528 ) ( SURFACE-AT ?auto_14512 ?auto_14528 ) ( ON ?auto_14512 ?auto_14541 ) ( CLEAR ?auto_14512 ) ( not ( = ?auto_14509 ?auto_14512 ) ) ( not ( = ?auto_14509 ?auto_14541 ) ) ( not ( = ?auto_14512 ?auto_14541 ) ) ( not ( = ?auto_14515 ?auto_14521 ) ) ( IS-CRATE ?auto_14509 ) ( not ( = ?auto_14533 ?auto_14518 ) ) ( HOIST-AT ?auto_14535 ?auto_14533 ) ( AVAILABLE ?auto_14535 ) ( SURFACE-AT ?auto_14509 ?auto_14533 ) ( ON ?auto_14509 ?auto_14536 ) ( CLEAR ?auto_14509 ) ( not ( = ?auto_14508 ?auto_14509 ) ) ( not ( = ?auto_14508 ?auto_14536 ) ) ( not ( = ?auto_14509 ?auto_14536 ) ) ( not ( = ?auto_14515 ?auto_14535 ) ) ( IS-CRATE ?auto_14508 ) ( not ( = ?auto_14534 ?auto_14518 ) ) ( HOIST-AT ?auto_14525 ?auto_14534 ) ( AVAILABLE ?auto_14525 ) ( SURFACE-AT ?auto_14508 ?auto_14534 ) ( ON ?auto_14508 ?auto_14523 ) ( CLEAR ?auto_14508 ) ( not ( = ?auto_14507 ?auto_14508 ) ) ( not ( = ?auto_14507 ?auto_14523 ) ) ( not ( = ?auto_14508 ?auto_14523 ) ) ( not ( = ?auto_14515 ?auto_14525 ) ) ( IS-CRATE ?auto_14507 ) ( AVAILABLE ?auto_14521 ) ( SURFACE-AT ?auto_14507 ?auto_14528 ) ( ON ?auto_14507 ?auto_14542 ) ( CLEAR ?auto_14507 ) ( not ( = ?auto_14506 ?auto_14507 ) ) ( not ( = ?auto_14506 ?auto_14542 ) ) ( not ( = ?auto_14507 ?auto_14542 ) ) ( IS-CRATE ?auto_14506 ) ( not ( = ?auto_14544 ?auto_14518 ) ) ( HOIST-AT ?auto_14540 ?auto_14544 ) ( AVAILABLE ?auto_14540 ) ( SURFACE-AT ?auto_14506 ?auto_14544 ) ( ON ?auto_14506 ?auto_14543 ) ( CLEAR ?auto_14506 ) ( not ( = ?auto_14505 ?auto_14506 ) ) ( not ( = ?auto_14505 ?auto_14543 ) ) ( not ( = ?auto_14506 ?auto_14543 ) ) ( not ( = ?auto_14515 ?auto_14540 ) ) ( IS-CRATE ?auto_14505 ) ( not ( = ?auto_14531 ?auto_14518 ) ) ( HOIST-AT ?auto_14522 ?auto_14531 ) ( AVAILABLE ?auto_14522 ) ( SURFACE-AT ?auto_14505 ?auto_14531 ) ( ON ?auto_14505 ?auto_14545 ) ( CLEAR ?auto_14505 ) ( not ( = ?auto_14504 ?auto_14505 ) ) ( not ( = ?auto_14504 ?auto_14545 ) ) ( not ( = ?auto_14505 ?auto_14545 ) ) ( not ( = ?auto_14515 ?auto_14522 ) ) ( SURFACE-AT ?auto_14503 ?auto_14518 ) ( CLEAR ?auto_14503 ) ( IS-CRATE ?auto_14504 ) ( AVAILABLE ?auto_14515 ) ( not ( = ?auto_14524 ?auto_14518 ) ) ( HOIST-AT ?auto_14527 ?auto_14524 ) ( AVAILABLE ?auto_14527 ) ( SURFACE-AT ?auto_14504 ?auto_14524 ) ( ON ?auto_14504 ?auto_14539 ) ( CLEAR ?auto_14504 ) ( TRUCK-AT ?auto_14520 ?auto_14518 ) ( not ( = ?auto_14503 ?auto_14504 ) ) ( not ( = ?auto_14503 ?auto_14539 ) ) ( not ( = ?auto_14504 ?auto_14539 ) ) ( not ( = ?auto_14515 ?auto_14527 ) ) ( not ( = ?auto_14503 ?auto_14505 ) ) ( not ( = ?auto_14503 ?auto_14545 ) ) ( not ( = ?auto_14505 ?auto_14539 ) ) ( not ( = ?auto_14531 ?auto_14524 ) ) ( not ( = ?auto_14522 ?auto_14527 ) ) ( not ( = ?auto_14545 ?auto_14539 ) ) ( not ( = ?auto_14503 ?auto_14506 ) ) ( not ( = ?auto_14503 ?auto_14543 ) ) ( not ( = ?auto_14504 ?auto_14506 ) ) ( not ( = ?auto_14504 ?auto_14543 ) ) ( not ( = ?auto_14506 ?auto_14545 ) ) ( not ( = ?auto_14506 ?auto_14539 ) ) ( not ( = ?auto_14544 ?auto_14531 ) ) ( not ( = ?auto_14544 ?auto_14524 ) ) ( not ( = ?auto_14540 ?auto_14522 ) ) ( not ( = ?auto_14540 ?auto_14527 ) ) ( not ( = ?auto_14543 ?auto_14545 ) ) ( not ( = ?auto_14543 ?auto_14539 ) ) ( not ( = ?auto_14503 ?auto_14507 ) ) ( not ( = ?auto_14503 ?auto_14542 ) ) ( not ( = ?auto_14504 ?auto_14507 ) ) ( not ( = ?auto_14504 ?auto_14542 ) ) ( not ( = ?auto_14505 ?auto_14507 ) ) ( not ( = ?auto_14505 ?auto_14542 ) ) ( not ( = ?auto_14507 ?auto_14543 ) ) ( not ( = ?auto_14507 ?auto_14545 ) ) ( not ( = ?auto_14507 ?auto_14539 ) ) ( not ( = ?auto_14528 ?auto_14544 ) ) ( not ( = ?auto_14528 ?auto_14531 ) ) ( not ( = ?auto_14528 ?auto_14524 ) ) ( not ( = ?auto_14521 ?auto_14540 ) ) ( not ( = ?auto_14521 ?auto_14522 ) ) ( not ( = ?auto_14521 ?auto_14527 ) ) ( not ( = ?auto_14542 ?auto_14543 ) ) ( not ( = ?auto_14542 ?auto_14545 ) ) ( not ( = ?auto_14542 ?auto_14539 ) ) ( not ( = ?auto_14503 ?auto_14508 ) ) ( not ( = ?auto_14503 ?auto_14523 ) ) ( not ( = ?auto_14504 ?auto_14508 ) ) ( not ( = ?auto_14504 ?auto_14523 ) ) ( not ( = ?auto_14505 ?auto_14508 ) ) ( not ( = ?auto_14505 ?auto_14523 ) ) ( not ( = ?auto_14506 ?auto_14508 ) ) ( not ( = ?auto_14506 ?auto_14523 ) ) ( not ( = ?auto_14508 ?auto_14542 ) ) ( not ( = ?auto_14508 ?auto_14543 ) ) ( not ( = ?auto_14508 ?auto_14545 ) ) ( not ( = ?auto_14508 ?auto_14539 ) ) ( not ( = ?auto_14534 ?auto_14528 ) ) ( not ( = ?auto_14534 ?auto_14544 ) ) ( not ( = ?auto_14534 ?auto_14531 ) ) ( not ( = ?auto_14534 ?auto_14524 ) ) ( not ( = ?auto_14525 ?auto_14521 ) ) ( not ( = ?auto_14525 ?auto_14540 ) ) ( not ( = ?auto_14525 ?auto_14522 ) ) ( not ( = ?auto_14525 ?auto_14527 ) ) ( not ( = ?auto_14523 ?auto_14542 ) ) ( not ( = ?auto_14523 ?auto_14543 ) ) ( not ( = ?auto_14523 ?auto_14545 ) ) ( not ( = ?auto_14523 ?auto_14539 ) ) ( not ( = ?auto_14503 ?auto_14509 ) ) ( not ( = ?auto_14503 ?auto_14536 ) ) ( not ( = ?auto_14504 ?auto_14509 ) ) ( not ( = ?auto_14504 ?auto_14536 ) ) ( not ( = ?auto_14505 ?auto_14509 ) ) ( not ( = ?auto_14505 ?auto_14536 ) ) ( not ( = ?auto_14506 ?auto_14509 ) ) ( not ( = ?auto_14506 ?auto_14536 ) ) ( not ( = ?auto_14507 ?auto_14509 ) ) ( not ( = ?auto_14507 ?auto_14536 ) ) ( not ( = ?auto_14509 ?auto_14523 ) ) ( not ( = ?auto_14509 ?auto_14542 ) ) ( not ( = ?auto_14509 ?auto_14543 ) ) ( not ( = ?auto_14509 ?auto_14545 ) ) ( not ( = ?auto_14509 ?auto_14539 ) ) ( not ( = ?auto_14533 ?auto_14534 ) ) ( not ( = ?auto_14533 ?auto_14528 ) ) ( not ( = ?auto_14533 ?auto_14544 ) ) ( not ( = ?auto_14533 ?auto_14531 ) ) ( not ( = ?auto_14533 ?auto_14524 ) ) ( not ( = ?auto_14535 ?auto_14525 ) ) ( not ( = ?auto_14535 ?auto_14521 ) ) ( not ( = ?auto_14535 ?auto_14540 ) ) ( not ( = ?auto_14535 ?auto_14522 ) ) ( not ( = ?auto_14535 ?auto_14527 ) ) ( not ( = ?auto_14536 ?auto_14523 ) ) ( not ( = ?auto_14536 ?auto_14542 ) ) ( not ( = ?auto_14536 ?auto_14543 ) ) ( not ( = ?auto_14536 ?auto_14545 ) ) ( not ( = ?auto_14536 ?auto_14539 ) ) ( not ( = ?auto_14503 ?auto_14512 ) ) ( not ( = ?auto_14503 ?auto_14541 ) ) ( not ( = ?auto_14504 ?auto_14512 ) ) ( not ( = ?auto_14504 ?auto_14541 ) ) ( not ( = ?auto_14505 ?auto_14512 ) ) ( not ( = ?auto_14505 ?auto_14541 ) ) ( not ( = ?auto_14506 ?auto_14512 ) ) ( not ( = ?auto_14506 ?auto_14541 ) ) ( not ( = ?auto_14507 ?auto_14512 ) ) ( not ( = ?auto_14507 ?auto_14541 ) ) ( not ( = ?auto_14508 ?auto_14512 ) ) ( not ( = ?auto_14508 ?auto_14541 ) ) ( not ( = ?auto_14512 ?auto_14536 ) ) ( not ( = ?auto_14512 ?auto_14523 ) ) ( not ( = ?auto_14512 ?auto_14542 ) ) ( not ( = ?auto_14512 ?auto_14543 ) ) ( not ( = ?auto_14512 ?auto_14545 ) ) ( not ( = ?auto_14512 ?auto_14539 ) ) ( not ( = ?auto_14541 ?auto_14536 ) ) ( not ( = ?auto_14541 ?auto_14523 ) ) ( not ( = ?auto_14541 ?auto_14542 ) ) ( not ( = ?auto_14541 ?auto_14543 ) ) ( not ( = ?auto_14541 ?auto_14545 ) ) ( not ( = ?auto_14541 ?auto_14539 ) ) ( not ( = ?auto_14503 ?auto_14511 ) ) ( not ( = ?auto_14503 ?auto_14546 ) ) ( not ( = ?auto_14504 ?auto_14511 ) ) ( not ( = ?auto_14504 ?auto_14546 ) ) ( not ( = ?auto_14505 ?auto_14511 ) ) ( not ( = ?auto_14505 ?auto_14546 ) ) ( not ( = ?auto_14506 ?auto_14511 ) ) ( not ( = ?auto_14506 ?auto_14546 ) ) ( not ( = ?auto_14507 ?auto_14511 ) ) ( not ( = ?auto_14507 ?auto_14546 ) ) ( not ( = ?auto_14508 ?auto_14511 ) ) ( not ( = ?auto_14508 ?auto_14546 ) ) ( not ( = ?auto_14509 ?auto_14511 ) ) ( not ( = ?auto_14509 ?auto_14546 ) ) ( not ( = ?auto_14511 ?auto_14541 ) ) ( not ( = ?auto_14511 ?auto_14536 ) ) ( not ( = ?auto_14511 ?auto_14523 ) ) ( not ( = ?auto_14511 ?auto_14542 ) ) ( not ( = ?auto_14511 ?auto_14543 ) ) ( not ( = ?auto_14511 ?auto_14545 ) ) ( not ( = ?auto_14511 ?auto_14539 ) ) ( not ( = ?auto_14517 ?auto_14528 ) ) ( not ( = ?auto_14517 ?auto_14533 ) ) ( not ( = ?auto_14517 ?auto_14534 ) ) ( not ( = ?auto_14517 ?auto_14544 ) ) ( not ( = ?auto_14517 ?auto_14531 ) ) ( not ( = ?auto_14517 ?auto_14524 ) ) ( not ( = ?auto_14516 ?auto_14521 ) ) ( not ( = ?auto_14516 ?auto_14535 ) ) ( not ( = ?auto_14516 ?auto_14525 ) ) ( not ( = ?auto_14516 ?auto_14540 ) ) ( not ( = ?auto_14516 ?auto_14522 ) ) ( not ( = ?auto_14516 ?auto_14527 ) ) ( not ( = ?auto_14546 ?auto_14541 ) ) ( not ( = ?auto_14546 ?auto_14536 ) ) ( not ( = ?auto_14546 ?auto_14523 ) ) ( not ( = ?auto_14546 ?auto_14542 ) ) ( not ( = ?auto_14546 ?auto_14543 ) ) ( not ( = ?auto_14546 ?auto_14545 ) ) ( not ( = ?auto_14546 ?auto_14539 ) ) ( not ( = ?auto_14503 ?auto_14510 ) ) ( not ( = ?auto_14503 ?auto_14538 ) ) ( not ( = ?auto_14504 ?auto_14510 ) ) ( not ( = ?auto_14504 ?auto_14538 ) ) ( not ( = ?auto_14505 ?auto_14510 ) ) ( not ( = ?auto_14505 ?auto_14538 ) ) ( not ( = ?auto_14506 ?auto_14510 ) ) ( not ( = ?auto_14506 ?auto_14538 ) ) ( not ( = ?auto_14507 ?auto_14510 ) ) ( not ( = ?auto_14507 ?auto_14538 ) ) ( not ( = ?auto_14508 ?auto_14510 ) ) ( not ( = ?auto_14508 ?auto_14538 ) ) ( not ( = ?auto_14509 ?auto_14510 ) ) ( not ( = ?auto_14509 ?auto_14538 ) ) ( not ( = ?auto_14512 ?auto_14510 ) ) ( not ( = ?auto_14512 ?auto_14538 ) ) ( not ( = ?auto_14510 ?auto_14546 ) ) ( not ( = ?auto_14510 ?auto_14541 ) ) ( not ( = ?auto_14510 ?auto_14536 ) ) ( not ( = ?auto_14510 ?auto_14523 ) ) ( not ( = ?auto_14510 ?auto_14542 ) ) ( not ( = ?auto_14510 ?auto_14543 ) ) ( not ( = ?auto_14510 ?auto_14545 ) ) ( not ( = ?auto_14510 ?auto_14539 ) ) ( not ( = ?auto_14537 ?auto_14517 ) ) ( not ( = ?auto_14537 ?auto_14528 ) ) ( not ( = ?auto_14537 ?auto_14533 ) ) ( not ( = ?auto_14537 ?auto_14534 ) ) ( not ( = ?auto_14537 ?auto_14544 ) ) ( not ( = ?auto_14537 ?auto_14531 ) ) ( not ( = ?auto_14537 ?auto_14524 ) ) ( not ( = ?auto_14526 ?auto_14516 ) ) ( not ( = ?auto_14526 ?auto_14521 ) ) ( not ( = ?auto_14526 ?auto_14535 ) ) ( not ( = ?auto_14526 ?auto_14525 ) ) ( not ( = ?auto_14526 ?auto_14540 ) ) ( not ( = ?auto_14526 ?auto_14522 ) ) ( not ( = ?auto_14526 ?auto_14527 ) ) ( not ( = ?auto_14538 ?auto_14546 ) ) ( not ( = ?auto_14538 ?auto_14541 ) ) ( not ( = ?auto_14538 ?auto_14536 ) ) ( not ( = ?auto_14538 ?auto_14523 ) ) ( not ( = ?auto_14538 ?auto_14542 ) ) ( not ( = ?auto_14538 ?auto_14543 ) ) ( not ( = ?auto_14538 ?auto_14545 ) ) ( not ( = ?auto_14538 ?auto_14539 ) ) ( not ( = ?auto_14503 ?auto_14513 ) ) ( not ( = ?auto_14503 ?auto_14530 ) ) ( not ( = ?auto_14504 ?auto_14513 ) ) ( not ( = ?auto_14504 ?auto_14530 ) ) ( not ( = ?auto_14505 ?auto_14513 ) ) ( not ( = ?auto_14505 ?auto_14530 ) ) ( not ( = ?auto_14506 ?auto_14513 ) ) ( not ( = ?auto_14506 ?auto_14530 ) ) ( not ( = ?auto_14507 ?auto_14513 ) ) ( not ( = ?auto_14507 ?auto_14530 ) ) ( not ( = ?auto_14508 ?auto_14513 ) ) ( not ( = ?auto_14508 ?auto_14530 ) ) ( not ( = ?auto_14509 ?auto_14513 ) ) ( not ( = ?auto_14509 ?auto_14530 ) ) ( not ( = ?auto_14512 ?auto_14513 ) ) ( not ( = ?auto_14512 ?auto_14530 ) ) ( not ( = ?auto_14511 ?auto_14513 ) ) ( not ( = ?auto_14511 ?auto_14530 ) ) ( not ( = ?auto_14513 ?auto_14538 ) ) ( not ( = ?auto_14513 ?auto_14546 ) ) ( not ( = ?auto_14513 ?auto_14541 ) ) ( not ( = ?auto_14513 ?auto_14536 ) ) ( not ( = ?auto_14513 ?auto_14523 ) ) ( not ( = ?auto_14513 ?auto_14542 ) ) ( not ( = ?auto_14513 ?auto_14543 ) ) ( not ( = ?auto_14513 ?auto_14545 ) ) ( not ( = ?auto_14513 ?auto_14539 ) ) ( not ( = ?auto_14529 ?auto_14537 ) ) ( not ( = ?auto_14529 ?auto_14517 ) ) ( not ( = ?auto_14529 ?auto_14528 ) ) ( not ( = ?auto_14529 ?auto_14533 ) ) ( not ( = ?auto_14529 ?auto_14534 ) ) ( not ( = ?auto_14529 ?auto_14544 ) ) ( not ( = ?auto_14529 ?auto_14531 ) ) ( not ( = ?auto_14529 ?auto_14524 ) ) ( not ( = ?auto_14532 ?auto_14526 ) ) ( not ( = ?auto_14532 ?auto_14516 ) ) ( not ( = ?auto_14532 ?auto_14521 ) ) ( not ( = ?auto_14532 ?auto_14535 ) ) ( not ( = ?auto_14532 ?auto_14525 ) ) ( not ( = ?auto_14532 ?auto_14540 ) ) ( not ( = ?auto_14532 ?auto_14522 ) ) ( not ( = ?auto_14532 ?auto_14527 ) ) ( not ( = ?auto_14530 ?auto_14538 ) ) ( not ( = ?auto_14530 ?auto_14546 ) ) ( not ( = ?auto_14530 ?auto_14541 ) ) ( not ( = ?auto_14530 ?auto_14536 ) ) ( not ( = ?auto_14530 ?auto_14523 ) ) ( not ( = ?auto_14530 ?auto_14542 ) ) ( not ( = ?auto_14530 ?auto_14543 ) ) ( not ( = ?auto_14530 ?auto_14545 ) ) ( not ( = ?auto_14530 ?auto_14539 ) ) ( not ( = ?auto_14503 ?auto_14514 ) ) ( not ( = ?auto_14503 ?auto_14519 ) ) ( not ( = ?auto_14504 ?auto_14514 ) ) ( not ( = ?auto_14504 ?auto_14519 ) ) ( not ( = ?auto_14505 ?auto_14514 ) ) ( not ( = ?auto_14505 ?auto_14519 ) ) ( not ( = ?auto_14506 ?auto_14514 ) ) ( not ( = ?auto_14506 ?auto_14519 ) ) ( not ( = ?auto_14507 ?auto_14514 ) ) ( not ( = ?auto_14507 ?auto_14519 ) ) ( not ( = ?auto_14508 ?auto_14514 ) ) ( not ( = ?auto_14508 ?auto_14519 ) ) ( not ( = ?auto_14509 ?auto_14514 ) ) ( not ( = ?auto_14509 ?auto_14519 ) ) ( not ( = ?auto_14512 ?auto_14514 ) ) ( not ( = ?auto_14512 ?auto_14519 ) ) ( not ( = ?auto_14511 ?auto_14514 ) ) ( not ( = ?auto_14511 ?auto_14519 ) ) ( not ( = ?auto_14510 ?auto_14514 ) ) ( not ( = ?auto_14510 ?auto_14519 ) ) ( not ( = ?auto_14514 ?auto_14530 ) ) ( not ( = ?auto_14514 ?auto_14538 ) ) ( not ( = ?auto_14514 ?auto_14546 ) ) ( not ( = ?auto_14514 ?auto_14541 ) ) ( not ( = ?auto_14514 ?auto_14536 ) ) ( not ( = ?auto_14514 ?auto_14523 ) ) ( not ( = ?auto_14514 ?auto_14542 ) ) ( not ( = ?auto_14514 ?auto_14543 ) ) ( not ( = ?auto_14514 ?auto_14545 ) ) ( not ( = ?auto_14514 ?auto_14539 ) ) ( not ( = ?auto_14519 ?auto_14530 ) ) ( not ( = ?auto_14519 ?auto_14538 ) ) ( not ( = ?auto_14519 ?auto_14546 ) ) ( not ( = ?auto_14519 ?auto_14541 ) ) ( not ( = ?auto_14519 ?auto_14536 ) ) ( not ( = ?auto_14519 ?auto_14523 ) ) ( not ( = ?auto_14519 ?auto_14542 ) ) ( not ( = ?auto_14519 ?auto_14543 ) ) ( not ( = ?auto_14519 ?auto_14545 ) ) ( not ( = ?auto_14519 ?auto_14539 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_14503 ?auto_14504 ?auto_14505 ?auto_14506 ?auto_14507 ?auto_14508 ?auto_14509 ?auto_14512 ?auto_14511 ?auto_14510 ?auto_14513 )
      ( MAKE-1CRATE ?auto_14513 ?auto_14514 )
      ( MAKE-11CRATE-VERIFY ?auto_14503 ?auto_14504 ?auto_14505 ?auto_14506 ?auto_14507 ?auto_14508 ?auto_14509 ?auto_14512 ?auto_14511 ?auto_14510 ?auto_14513 ?auto_14514 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14549 - SURFACE
      ?auto_14550 - SURFACE
    )
    :vars
    (
      ?auto_14551 - HOIST
      ?auto_14552 - PLACE
      ?auto_14554 - PLACE
      ?auto_14555 - HOIST
      ?auto_14556 - SURFACE
      ?auto_14553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14551 ?auto_14552 ) ( SURFACE-AT ?auto_14549 ?auto_14552 ) ( CLEAR ?auto_14549 ) ( IS-CRATE ?auto_14550 ) ( AVAILABLE ?auto_14551 ) ( not ( = ?auto_14554 ?auto_14552 ) ) ( HOIST-AT ?auto_14555 ?auto_14554 ) ( AVAILABLE ?auto_14555 ) ( SURFACE-AT ?auto_14550 ?auto_14554 ) ( ON ?auto_14550 ?auto_14556 ) ( CLEAR ?auto_14550 ) ( TRUCK-AT ?auto_14553 ?auto_14552 ) ( not ( = ?auto_14549 ?auto_14550 ) ) ( not ( = ?auto_14549 ?auto_14556 ) ) ( not ( = ?auto_14550 ?auto_14556 ) ) ( not ( = ?auto_14551 ?auto_14555 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14553 ?auto_14552 ?auto_14554 )
      ( !LIFT ?auto_14555 ?auto_14550 ?auto_14556 ?auto_14554 )
      ( !LOAD ?auto_14555 ?auto_14550 ?auto_14553 ?auto_14554 )
      ( !DRIVE ?auto_14553 ?auto_14554 ?auto_14552 )
      ( !UNLOAD ?auto_14551 ?auto_14550 ?auto_14553 ?auto_14552 )
      ( !DROP ?auto_14551 ?auto_14550 ?auto_14549 ?auto_14552 )
      ( MAKE-1CRATE-VERIFY ?auto_14549 ?auto_14550 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_14570 - SURFACE
      ?auto_14571 - SURFACE
      ?auto_14572 - SURFACE
      ?auto_14573 - SURFACE
      ?auto_14574 - SURFACE
      ?auto_14575 - SURFACE
      ?auto_14576 - SURFACE
      ?auto_14579 - SURFACE
      ?auto_14578 - SURFACE
      ?auto_14577 - SURFACE
      ?auto_14580 - SURFACE
      ?auto_14581 - SURFACE
      ?auto_14582 - SURFACE
    )
    :vars
    (
      ?auto_14584 - HOIST
      ?auto_14586 - PLACE
      ?auto_14585 - PLACE
      ?auto_14583 - HOIST
      ?auto_14587 - SURFACE
      ?auto_14592 - PLACE
      ?auto_14593 - HOIST
      ?auto_14610 - SURFACE
      ?auto_14594 - PLACE
      ?auto_14615 - HOIST
      ?auto_14591 - SURFACE
      ?auto_14607 - PLACE
      ?auto_14590 - HOIST
      ?auto_14608 - SURFACE
      ?auto_14598 - SURFACE
      ?auto_14600 - PLACE
      ?auto_14613 - HOIST
      ?auto_14604 - SURFACE
      ?auto_14599 - PLACE
      ?auto_14601 - HOIST
      ?auto_14605 - SURFACE
      ?auto_14603 - PLACE
      ?auto_14602 - HOIST
      ?auto_14596 - SURFACE
      ?auto_14609 - SURFACE
      ?auto_14589 - SURFACE
      ?auto_14597 - PLACE
      ?auto_14611 - HOIST
      ?auto_14595 - SURFACE
      ?auto_14612 - PLACE
      ?auto_14606 - HOIST
      ?auto_14614 - SURFACE
      ?auto_14588 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14584 ?auto_14586 ) ( IS-CRATE ?auto_14582 ) ( not ( = ?auto_14585 ?auto_14586 ) ) ( HOIST-AT ?auto_14583 ?auto_14585 ) ( SURFACE-AT ?auto_14582 ?auto_14585 ) ( ON ?auto_14582 ?auto_14587 ) ( CLEAR ?auto_14582 ) ( not ( = ?auto_14581 ?auto_14582 ) ) ( not ( = ?auto_14581 ?auto_14587 ) ) ( not ( = ?auto_14582 ?auto_14587 ) ) ( not ( = ?auto_14584 ?auto_14583 ) ) ( IS-CRATE ?auto_14581 ) ( not ( = ?auto_14592 ?auto_14586 ) ) ( HOIST-AT ?auto_14593 ?auto_14592 ) ( SURFACE-AT ?auto_14581 ?auto_14592 ) ( ON ?auto_14581 ?auto_14610 ) ( CLEAR ?auto_14581 ) ( not ( = ?auto_14580 ?auto_14581 ) ) ( not ( = ?auto_14580 ?auto_14610 ) ) ( not ( = ?auto_14581 ?auto_14610 ) ) ( not ( = ?auto_14584 ?auto_14593 ) ) ( IS-CRATE ?auto_14580 ) ( not ( = ?auto_14594 ?auto_14586 ) ) ( HOIST-AT ?auto_14615 ?auto_14594 ) ( AVAILABLE ?auto_14615 ) ( SURFACE-AT ?auto_14580 ?auto_14594 ) ( ON ?auto_14580 ?auto_14591 ) ( CLEAR ?auto_14580 ) ( not ( = ?auto_14577 ?auto_14580 ) ) ( not ( = ?auto_14577 ?auto_14591 ) ) ( not ( = ?auto_14580 ?auto_14591 ) ) ( not ( = ?auto_14584 ?auto_14615 ) ) ( IS-CRATE ?auto_14577 ) ( not ( = ?auto_14607 ?auto_14586 ) ) ( HOIST-AT ?auto_14590 ?auto_14607 ) ( AVAILABLE ?auto_14590 ) ( SURFACE-AT ?auto_14577 ?auto_14607 ) ( ON ?auto_14577 ?auto_14608 ) ( CLEAR ?auto_14577 ) ( not ( = ?auto_14578 ?auto_14577 ) ) ( not ( = ?auto_14578 ?auto_14608 ) ) ( not ( = ?auto_14577 ?auto_14608 ) ) ( not ( = ?auto_14584 ?auto_14590 ) ) ( IS-CRATE ?auto_14578 ) ( AVAILABLE ?auto_14593 ) ( SURFACE-AT ?auto_14578 ?auto_14592 ) ( ON ?auto_14578 ?auto_14598 ) ( CLEAR ?auto_14578 ) ( not ( = ?auto_14579 ?auto_14578 ) ) ( not ( = ?auto_14579 ?auto_14598 ) ) ( not ( = ?auto_14578 ?auto_14598 ) ) ( IS-CRATE ?auto_14579 ) ( not ( = ?auto_14600 ?auto_14586 ) ) ( HOIST-AT ?auto_14613 ?auto_14600 ) ( SURFACE-AT ?auto_14579 ?auto_14600 ) ( ON ?auto_14579 ?auto_14604 ) ( CLEAR ?auto_14579 ) ( not ( = ?auto_14576 ?auto_14579 ) ) ( not ( = ?auto_14576 ?auto_14604 ) ) ( not ( = ?auto_14579 ?auto_14604 ) ) ( not ( = ?auto_14584 ?auto_14613 ) ) ( IS-CRATE ?auto_14576 ) ( not ( = ?auto_14599 ?auto_14586 ) ) ( HOIST-AT ?auto_14601 ?auto_14599 ) ( AVAILABLE ?auto_14601 ) ( SURFACE-AT ?auto_14576 ?auto_14599 ) ( ON ?auto_14576 ?auto_14605 ) ( CLEAR ?auto_14576 ) ( not ( = ?auto_14575 ?auto_14576 ) ) ( not ( = ?auto_14575 ?auto_14605 ) ) ( not ( = ?auto_14576 ?auto_14605 ) ) ( not ( = ?auto_14584 ?auto_14601 ) ) ( IS-CRATE ?auto_14575 ) ( not ( = ?auto_14603 ?auto_14586 ) ) ( HOIST-AT ?auto_14602 ?auto_14603 ) ( AVAILABLE ?auto_14602 ) ( SURFACE-AT ?auto_14575 ?auto_14603 ) ( ON ?auto_14575 ?auto_14596 ) ( CLEAR ?auto_14575 ) ( not ( = ?auto_14574 ?auto_14575 ) ) ( not ( = ?auto_14574 ?auto_14596 ) ) ( not ( = ?auto_14575 ?auto_14596 ) ) ( not ( = ?auto_14584 ?auto_14602 ) ) ( IS-CRATE ?auto_14574 ) ( AVAILABLE ?auto_14613 ) ( SURFACE-AT ?auto_14574 ?auto_14600 ) ( ON ?auto_14574 ?auto_14609 ) ( CLEAR ?auto_14574 ) ( not ( = ?auto_14573 ?auto_14574 ) ) ( not ( = ?auto_14573 ?auto_14609 ) ) ( not ( = ?auto_14574 ?auto_14609 ) ) ( IS-CRATE ?auto_14573 ) ( AVAILABLE ?auto_14583 ) ( SURFACE-AT ?auto_14573 ?auto_14585 ) ( ON ?auto_14573 ?auto_14589 ) ( CLEAR ?auto_14573 ) ( not ( = ?auto_14572 ?auto_14573 ) ) ( not ( = ?auto_14572 ?auto_14589 ) ) ( not ( = ?auto_14573 ?auto_14589 ) ) ( IS-CRATE ?auto_14572 ) ( not ( = ?auto_14597 ?auto_14586 ) ) ( HOIST-AT ?auto_14611 ?auto_14597 ) ( AVAILABLE ?auto_14611 ) ( SURFACE-AT ?auto_14572 ?auto_14597 ) ( ON ?auto_14572 ?auto_14595 ) ( CLEAR ?auto_14572 ) ( not ( = ?auto_14571 ?auto_14572 ) ) ( not ( = ?auto_14571 ?auto_14595 ) ) ( not ( = ?auto_14572 ?auto_14595 ) ) ( not ( = ?auto_14584 ?auto_14611 ) ) ( SURFACE-AT ?auto_14570 ?auto_14586 ) ( CLEAR ?auto_14570 ) ( IS-CRATE ?auto_14571 ) ( AVAILABLE ?auto_14584 ) ( not ( = ?auto_14612 ?auto_14586 ) ) ( HOIST-AT ?auto_14606 ?auto_14612 ) ( AVAILABLE ?auto_14606 ) ( SURFACE-AT ?auto_14571 ?auto_14612 ) ( ON ?auto_14571 ?auto_14614 ) ( CLEAR ?auto_14571 ) ( TRUCK-AT ?auto_14588 ?auto_14586 ) ( not ( = ?auto_14570 ?auto_14571 ) ) ( not ( = ?auto_14570 ?auto_14614 ) ) ( not ( = ?auto_14571 ?auto_14614 ) ) ( not ( = ?auto_14584 ?auto_14606 ) ) ( not ( = ?auto_14570 ?auto_14572 ) ) ( not ( = ?auto_14570 ?auto_14595 ) ) ( not ( = ?auto_14572 ?auto_14614 ) ) ( not ( = ?auto_14597 ?auto_14612 ) ) ( not ( = ?auto_14611 ?auto_14606 ) ) ( not ( = ?auto_14595 ?auto_14614 ) ) ( not ( = ?auto_14570 ?auto_14573 ) ) ( not ( = ?auto_14570 ?auto_14589 ) ) ( not ( = ?auto_14571 ?auto_14573 ) ) ( not ( = ?auto_14571 ?auto_14589 ) ) ( not ( = ?auto_14573 ?auto_14595 ) ) ( not ( = ?auto_14573 ?auto_14614 ) ) ( not ( = ?auto_14585 ?auto_14597 ) ) ( not ( = ?auto_14585 ?auto_14612 ) ) ( not ( = ?auto_14583 ?auto_14611 ) ) ( not ( = ?auto_14583 ?auto_14606 ) ) ( not ( = ?auto_14589 ?auto_14595 ) ) ( not ( = ?auto_14589 ?auto_14614 ) ) ( not ( = ?auto_14570 ?auto_14574 ) ) ( not ( = ?auto_14570 ?auto_14609 ) ) ( not ( = ?auto_14571 ?auto_14574 ) ) ( not ( = ?auto_14571 ?auto_14609 ) ) ( not ( = ?auto_14572 ?auto_14574 ) ) ( not ( = ?auto_14572 ?auto_14609 ) ) ( not ( = ?auto_14574 ?auto_14589 ) ) ( not ( = ?auto_14574 ?auto_14595 ) ) ( not ( = ?auto_14574 ?auto_14614 ) ) ( not ( = ?auto_14600 ?auto_14585 ) ) ( not ( = ?auto_14600 ?auto_14597 ) ) ( not ( = ?auto_14600 ?auto_14612 ) ) ( not ( = ?auto_14613 ?auto_14583 ) ) ( not ( = ?auto_14613 ?auto_14611 ) ) ( not ( = ?auto_14613 ?auto_14606 ) ) ( not ( = ?auto_14609 ?auto_14589 ) ) ( not ( = ?auto_14609 ?auto_14595 ) ) ( not ( = ?auto_14609 ?auto_14614 ) ) ( not ( = ?auto_14570 ?auto_14575 ) ) ( not ( = ?auto_14570 ?auto_14596 ) ) ( not ( = ?auto_14571 ?auto_14575 ) ) ( not ( = ?auto_14571 ?auto_14596 ) ) ( not ( = ?auto_14572 ?auto_14575 ) ) ( not ( = ?auto_14572 ?auto_14596 ) ) ( not ( = ?auto_14573 ?auto_14575 ) ) ( not ( = ?auto_14573 ?auto_14596 ) ) ( not ( = ?auto_14575 ?auto_14609 ) ) ( not ( = ?auto_14575 ?auto_14589 ) ) ( not ( = ?auto_14575 ?auto_14595 ) ) ( not ( = ?auto_14575 ?auto_14614 ) ) ( not ( = ?auto_14603 ?auto_14600 ) ) ( not ( = ?auto_14603 ?auto_14585 ) ) ( not ( = ?auto_14603 ?auto_14597 ) ) ( not ( = ?auto_14603 ?auto_14612 ) ) ( not ( = ?auto_14602 ?auto_14613 ) ) ( not ( = ?auto_14602 ?auto_14583 ) ) ( not ( = ?auto_14602 ?auto_14611 ) ) ( not ( = ?auto_14602 ?auto_14606 ) ) ( not ( = ?auto_14596 ?auto_14609 ) ) ( not ( = ?auto_14596 ?auto_14589 ) ) ( not ( = ?auto_14596 ?auto_14595 ) ) ( not ( = ?auto_14596 ?auto_14614 ) ) ( not ( = ?auto_14570 ?auto_14576 ) ) ( not ( = ?auto_14570 ?auto_14605 ) ) ( not ( = ?auto_14571 ?auto_14576 ) ) ( not ( = ?auto_14571 ?auto_14605 ) ) ( not ( = ?auto_14572 ?auto_14576 ) ) ( not ( = ?auto_14572 ?auto_14605 ) ) ( not ( = ?auto_14573 ?auto_14576 ) ) ( not ( = ?auto_14573 ?auto_14605 ) ) ( not ( = ?auto_14574 ?auto_14576 ) ) ( not ( = ?auto_14574 ?auto_14605 ) ) ( not ( = ?auto_14576 ?auto_14596 ) ) ( not ( = ?auto_14576 ?auto_14609 ) ) ( not ( = ?auto_14576 ?auto_14589 ) ) ( not ( = ?auto_14576 ?auto_14595 ) ) ( not ( = ?auto_14576 ?auto_14614 ) ) ( not ( = ?auto_14599 ?auto_14603 ) ) ( not ( = ?auto_14599 ?auto_14600 ) ) ( not ( = ?auto_14599 ?auto_14585 ) ) ( not ( = ?auto_14599 ?auto_14597 ) ) ( not ( = ?auto_14599 ?auto_14612 ) ) ( not ( = ?auto_14601 ?auto_14602 ) ) ( not ( = ?auto_14601 ?auto_14613 ) ) ( not ( = ?auto_14601 ?auto_14583 ) ) ( not ( = ?auto_14601 ?auto_14611 ) ) ( not ( = ?auto_14601 ?auto_14606 ) ) ( not ( = ?auto_14605 ?auto_14596 ) ) ( not ( = ?auto_14605 ?auto_14609 ) ) ( not ( = ?auto_14605 ?auto_14589 ) ) ( not ( = ?auto_14605 ?auto_14595 ) ) ( not ( = ?auto_14605 ?auto_14614 ) ) ( not ( = ?auto_14570 ?auto_14579 ) ) ( not ( = ?auto_14570 ?auto_14604 ) ) ( not ( = ?auto_14571 ?auto_14579 ) ) ( not ( = ?auto_14571 ?auto_14604 ) ) ( not ( = ?auto_14572 ?auto_14579 ) ) ( not ( = ?auto_14572 ?auto_14604 ) ) ( not ( = ?auto_14573 ?auto_14579 ) ) ( not ( = ?auto_14573 ?auto_14604 ) ) ( not ( = ?auto_14574 ?auto_14579 ) ) ( not ( = ?auto_14574 ?auto_14604 ) ) ( not ( = ?auto_14575 ?auto_14579 ) ) ( not ( = ?auto_14575 ?auto_14604 ) ) ( not ( = ?auto_14579 ?auto_14605 ) ) ( not ( = ?auto_14579 ?auto_14596 ) ) ( not ( = ?auto_14579 ?auto_14609 ) ) ( not ( = ?auto_14579 ?auto_14589 ) ) ( not ( = ?auto_14579 ?auto_14595 ) ) ( not ( = ?auto_14579 ?auto_14614 ) ) ( not ( = ?auto_14604 ?auto_14605 ) ) ( not ( = ?auto_14604 ?auto_14596 ) ) ( not ( = ?auto_14604 ?auto_14609 ) ) ( not ( = ?auto_14604 ?auto_14589 ) ) ( not ( = ?auto_14604 ?auto_14595 ) ) ( not ( = ?auto_14604 ?auto_14614 ) ) ( not ( = ?auto_14570 ?auto_14578 ) ) ( not ( = ?auto_14570 ?auto_14598 ) ) ( not ( = ?auto_14571 ?auto_14578 ) ) ( not ( = ?auto_14571 ?auto_14598 ) ) ( not ( = ?auto_14572 ?auto_14578 ) ) ( not ( = ?auto_14572 ?auto_14598 ) ) ( not ( = ?auto_14573 ?auto_14578 ) ) ( not ( = ?auto_14573 ?auto_14598 ) ) ( not ( = ?auto_14574 ?auto_14578 ) ) ( not ( = ?auto_14574 ?auto_14598 ) ) ( not ( = ?auto_14575 ?auto_14578 ) ) ( not ( = ?auto_14575 ?auto_14598 ) ) ( not ( = ?auto_14576 ?auto_14578 ) ) ( not ( = ?auto_14576 ?auto_14598 ) ) ( not ( = ?auto_14578 ?auto_14604 ) ) ( not ( = ?auto_14578 ?auto_14605 ) ) ( not ( = ?auto_14578 ?auto_14596 ) ) ( not ( = ?auto_14578 ?auto_14609 ) ) ( not ( = ?auto_14578 ?auto_14589 ) ) ( not ( = ?auto_14578 ?auto_14595 ) ) ( not ( = ?auto_14578 ?auto_14614 ) ) ( not ( = ?auto_14592 ?auto_14600 ) ) ( not ( = ?auto_14592 ?auto_14599 ) ) ( not ( = ?auto_14592 ?auto_14603 ) ) ( not ( = ?auto_14592 ?auto_14585 ) ) ( not ( = ?auto_14592 ?auto_14597 ) ) ( not ( = ?auto_14592 ?auto_14612 ) ) ( not ( = ?auto_14593 ?auto_14613 ) ) ( not ( = ?auto_14593 ?auto_14601 ) ) ( not ( = ?auto_14593 ?auto_14602 ) ) ( not ( = ?auto_14593 ?auto_14583 ) ) ( not ( = ?auto_14593 ?auto_14611 ) ) ( not ( = ?auto_14593 ?auto_14606 ) ) ( not ( = ?auto_14598 ?auto_14604 ) ) ( not ( = ?auto_14598 ?auto_14605 ) ) ( not ( = ?auto_14598 ?auto_14596 ) ) ( not ( = ?auto_14598 ?auto_14609 ) ) ( not ( = ?auto_14598 ?auto_14589 ) ) ( not ( = ?auto_14598 ?auto_14595 ) ) ( not ( = ?auto_14598 ?auto_14614 ) ) ( not ( = ?auto_14570 ?auto_14577 ) ) ( not ( = ?auto_14570 ?auto_14608 ) ) ( not ( = ?auto_14571 ?auto_14577 ) ) ( not ( = ?auto_14571 ?auto_14608 ) ) ( not ( = ?auto_14572 ?auto_14577 ) ) ( not ( = ?auto_14572 ?auto_14608 ) ) ( not ( = ?auto_14573 ?auto_14577 ) ) ( not ( = ?auto_14573 ?auto_14608 ) ) ( not ( = ?auto_14574 ?auto_14577 ) ) ( not ( = ?auto_14574 ?auto_14608 ) ) ( not ( = ?auto_14575 ?auto_14577 ) ) ( not ( = ?auto_14575 ?auto_14608 ) ) ( not ( = ?auto_14576 ?auto_14577 ) ) ( not ( = ?auto_14576 ?auto_14608 ) ) ( not ( = ?auto_14579 ?auto_14577 ) ) ( not ( = ?auto_14579 ?auto_14608 ) ) ( not ( = ?auto_14577 ?auto_14598 ) ) ( not ( = ?auto_14577 ?auto_14604 ) ) ( not ( = ?auto_14577 ?auto_14605 ) ) ( not ( = ?auto_14577 ?auto_14596 ) ) ( not ( = ?auto_14577 ?auto_14609 ) ) ( not ( = ?auto_14577 ?auto_14589 ) ) ( not ( = ?auto_14577 ?auto_14595 ) ) ( not ( = ?auto_14577 ?auto_14614 ) ) ( not ( = ?auto_14607 ?auto_14592 ) ) ( not ( = ?auto_14607 ?auto_14600 ) ) ( not ( = ?auto_14607 ?auto_14599 ) ) ( not ( = ?auto_14607 ?auto_14603 ) ) ( not ( = ?auto_14607 ?auto_14585 ) ) ( not ( = ?auto_14607 ?auto_14597 ) ) ( not ( = ?auto_14607 ?auto_14612 ) ) ( not ( = ?auto_14590 ?auto_14593 ) ) ( not ( = ?auto_14590 ?auto_14613 ) ) ( not ( = ?auto_14590 ?auto_14601 ) ) ( not ( = ?auto_14590 ?auto_14602 ) ) ( not ( = ?auto_14590 ?auto_14583 ) ) ( not ( = ?auto_14590 ?auto_14611 ) ) ( not ( = ?auto_14590 ?auto_14606 ) ) ( not ( = ?auto_14608 ?auto_14598 ) ) ( not ( = ?auto_14608 ?auto_14604 ) ) ( not ( = ?auto_14608 ?auto_14605 ) ) ( not ( = ?auto_14608 ?auto_14596 ) ) ( not ( = ?auto_14608 ?auto_14609 ) ) ( not ( = ?auto_14608 ?auto_14589 ) ) ( not ( = ?auto_14608 ?auto_14595 ) ) ( not ( = ?auto_14608 ?auto_14614 ) ) ( not ( = ?auto_14570 ?auto_14580 ) ) ( not ( = ?auto_14570 ?auto_14591 ) ) ( not ( = ?auto_14571 ?auto_14580 ) ) ( not ( = ?auto_14571 ?auto_14591 ) ) ( not ( = ?auto_14572 ?auto_14580 ) ) ( not ( = ?auto_14572 ?auto_14591 ) ) ( not ( = ?auto_14573 ?auto_14580 ) ) ( not ( = ?auto_14573 ?auto_14591 ) ) ( not ( = ?auto_14574 ?auto_14580 ) ) ( not ( = ?auto_14574 ?auto_14591 ) ) ( not ( = ?auto_14575 ?auto_14580 ) ) ( not ( = ?auto_14575 ?auto_14591 ) ) ( not ( = ?auto_14576 ?auto_14580 ) ) ( not ( = ?auto_14576 ?auto_14591 ) ) ( not ( = ?auto_14579 ?auto_14580 ) ) ( not ( = ?auto_14579 ?auto_14591 ) ) ( not ( = ?auto_14578 ?auto_14580 ) ) ( not ( = ?auto_14578 ?auto_14591 ) ) ( not ( = ?auto_14580 ?auto_14608 ) ) ( not ( = ?auto_14580 ?auto_14598 ) ) ( not ( = ?auto_14580 ?auto_14604 ) ) ( not ( = ?auto_14580 ?auto_14605 ) ) ( not ( = ?auto_14580 ?auto_14596 ) ) ( not ( = ?auto_14580 ?auto_14609 ) ) ( not ( = ?auto_14580 ?auto_14589 ) ) ( not ( = ?auto_14580 ?auto_14595 ) ) ( not ( = ?auto_14580 ?auto_14614 ) ) ( not ( = ?auto_14594 ?auto_14607 ) ) ( not ( = ?auto_14594 ?auto_14592 ) ) ( not ( = ?auto_14594 ?auto_14600 ) ) ( not ( = ?auto_14594 ?auto_14599 ) ) ( not ( = ?auto_14594 ?auto_14603 ) ) ( not ( = ?auto_14594 ?auto_14585 ) ) ( not ( = ?auto_14594 ?auto_14597 ) ) ( not ( = ?auto_14594 ?auto_14612 ) ) ( not ( = ?auto_14615 ?auto_14590 ) ) ( not ( = ?auto_14615 ?auto_14593 ) ) ( not ( = ?auto_14615 ?auto_14613 ) ) ( not ( = ?auto_14615 ?auto_14601 ) ) ( not ( = ?auto_14615 ?auto_14602 ) ) ( not ( = ?auto_14615 ?auto_14583 ) ) ( not ( = ?auto_14615 ?auto_14611 ) ) ( not ( = ?auto_14615 ?auto_14606 ) ) ( not ( = ?auto_14591 ?auto_14608 ) ) ( not ( = ?auto_14591 ?auto_14598 ) ) ( not ( = ?auto_14591 ?auto_14604 ) ) ( not ( = ?auto_14591 ?auto_14605 ) ) ( not ( = ?auto_14591 ?auto_14596 ) ) ( not ( = ?auto_14591 ?auto_14609 ) ) ( not ( = ?auto_14591 ?auto_14589 ) ) ( not ( = ?auto_14591 ?auto_14595 ) ) ( not ( = ?auto_14591 ?auto_14614 ) ) ( not ( = ?auto_14570 ?auto_14581 ) ) ( not ( = ?auto_14570 ?auto_14610 ) ) ( not ( = ?auto_14571 ?auto_14581 ) ) ( not ( = ?auto_14571 ?auto_14610 ) ) ( not ( = ?auto_14572 ?auto_14581 ) ) ( not ( = ?auto_14572 ?auto_14610 ) ) ( not ( = ?auto_14573 ?auto_14581 ) ) ( not ( = ?auto_14573 ?auto_14610 ) ) ( not ( = ?auto_14574 ?auto_14581 ) ) ( not ( = ?auto_14574 ?auto_14610 ) ) ( not ( = ?auto_14575 ?auto_14581 ) ) ( not ( = ?auto_14575 ?auto_14610 ) ) ( not ( = ?auto_14576 ?auto_14581 ) ) ( not ( = ?auto_14576 ?auto_14610 ) ) ( not ( = ?auto_14579 ?auto_14581 ) ) ( not ( = ?auto_14579 ?auto_14610 ) ) ( not ( = ?auto_14578 ?auto_14581 ) ) ( not ( = ?auto_14578 ?auto_14610 ) ) ( not ( = ?auto_14577 ?auto_14581 ) ) ( not ( = ?auto_14577 ?auto_14610 ) ) ( not ( = ?auto_14581 ?auto_14591 ) ) ( not ( = ?auto_14581 ?auto_14608 ) ) ( not ( = ?auto_14581 ?auto_14598 ) ) ( not ( = ?auto_14581 ?auto_14604 ) ) ( not ( = ?auto_14581 ?auto_14605 ) ) ( not ( = ?auto_14581 ?auto_14596 ) ) ( not ( = ?auto_14581 ?auto_14609 ) ) ( not ( = ?auto_14581 ?auto_14589 ) ) ( not ( = ?auto_14581 ?auto_14595 ) ) ( not ( = ?auto_14581 ?auto_14614 ) ) ( not ( = ?auto_14610 ?auto_14591 ) ) ( not ( = ?auto_14610 ?auto_14608 ) ) ( not ( = ?auto_14610 ?auto_14598 ) ) ( not ( = ?auto_14610 ?auto_14604 ) ) ( not ( = ?auto_14610 ?auto_14605 ) ) ( not ( = ?auto_14610 ?auto_14596 ) ) ( not ( = ?auto_14610 ?auto_14609 ) ) ( not ( = ?auto_14610 ?auto_14589 ) ) ( not ( = ?auto_14610 ?auto_14595 ) ) ( not ( = ?auto_14610 ?auto_14614 ) ) ( not ( = ?auto_14570 ?auto_14582 ) ) ( not ( = ?auto_14570 ?auto_14587 ) ) ( not ( = ?auto_14571 ?auto_14582 ) ) ( not ( = ?auto_14571 ?auto_14587 ) ) ( not ( = ?auto_14572 ?auto_14582 ) ) ( not ( = ?auto_14572 ?auto_14587 ) ) ( not ( = ?auto_14573 ?auto_14582 ) ) ( not ( = ?auto_14573 ?auto_14587 ) ) ( not ( = ?auto_14574 ?auto_14582 ) ) ( not ( = ?auto_14574 ?auto_14587 ) ) ( not ( = ?auto_14575 ?auto_14582 ) ) ( not ( = ?auto_14575 ?auto_14587 ) ) ( not ( = ?auto_14576 ?auto_14582 ) ) ( not ( = ?auto_14576 ?auto_14587 ) ) ( not ( = ?auto_14579 ?auto_14582 ) ) ( not ( = ?auto_14579 ?auto_14587 ) ) ( not ( = ?auto_14578 ?auto_14582 ) ) ( not ( = ?auto_14578 ?auto_14587 ) ) ( not ( = ?auto_14577 ?auto_14582 ) ) ( not ( = ?auto_14577 ?auto_14587 ) ) ( not ( = ?auto_14580 ?auto_14582 ) ) ( not ( = ?auto_14580 ?auto_14587 ) ) ( not ( = ?auto_14582 ?auto_14610 ) ) ( not ( = ?auto_14582 ?auto_14591 ) ) ( not ( = ?auto_14582 ?auto_14608 ) ) ( not ( = ?auto_14582 ?auto_14598 ) ) ( not ( = ?auto_14582 ?auto_14604 ) ) ( not ( = ?auto_14582 ?auto_14605 ) ) ( not ( = ?auto_14582 ?auto_14596 ) ) ( not ( = ?auto_14582 ?auto_14609 ) ) ( not ( = ?auto_14582 ?auto_14589 ) ) ( not ( = ?auto_14582 ?auto_14595 ) ) ( not ( = ?auto_14582 ?auto_14614 ) ) ( not ( = ?auto_14587 ?auto_14610 ) ) ( not ( = ?auto_14587 ?auto_14591 ) ) ( not ( = ?auto_14587 ?auto_14608 ) ) ( not ( = ?auto_14587 ?auto_14598 ) ) ( not ( = ?auto_14587 ?auto_14604 ) ) ( not ( = ?auto_14587 ?auto_14605 ) ) ( not ( = ?auto_14587 ?auto_14596 ) ) ( not ( = ?auto_14587 ?auto_14609 ) ) ( not ( = ?auto_14587 ?auto_14589 ) ) ( not ( = ?auto_14587 ?auto_14595 ) ) ( not ( = ?auto_14587 ?auto_14614 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_14570 ?auto_14571 ?auto_14572 ?auto_14573 ?auto_14574 ?auto_14575 ?auto_14576 ?auto_14579 ?auto_14578 ?auto_14577 ?auto_14580 ?auto_14581 )
      ( MAKE-1CRATE ?auto_14581 ?auto_14582 )
      ( MAKE-12CRATE-VERIFY ?auto_14570 ?auto_14571 ?auto_14572 ?auto_14573 ?auto_14574 ?auto_14575 ?auto_14576 ?auto_14579 ?auto_14578 ?auto_14577 ?auto_14580 ?auto_14581 ?auto_14582 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14618 - SURFACE
      ?auto_14619 - SURFACE
    )
    :vars
    (
      ?auto_14620 - HOIST
      ?auto_14621 - PLACE
      ?auto_14623 - PLACE
      ?auto_14624 - HOIST
      ?auto_14625 - SURFACE
      ?auto_14622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14620 ?auto_14621 ) ( SURFACE-AT ?auto_14618 ?auto_14621 ) ( CLEAR ?auto_14618 ) ( IS-CRATE ?auto_14619 ) ( AVAILABLE ?auto_14620 ) ( not ( = ?auto_14623 ?auto_14621 ) ) ( HOIST-AT ?auto_14624 ?auto_14623 ) ( AVAILABLE ?auto_14624 ) ( SURFACE-AT ?auto_14619 ?auto_14623 ) ( ON ?auto_14619 ?auto_14625 ) ( CLEAR ?auto_14619 ) ( TRUCK-AT ?auto_14622 ?auto_14621 ) ( not ( = ?auto_14618 ?auto_14619 ) ) ( not ( = ?auto_14618 ?auto_14625 ) ) ( not ( = ?auto_14619 ?auto_14625 ) ) ( not ( = ?auto_14620 ?auto_14624 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14622 ?auto_14621 ?auto_14623 )
      ( !LIFT ?auto_14624 ?auto_14619 ?auto_14625 ?auto_14623 )
      ( !LOAD ?auto_14624 ?auto_14619 ?auto_14622 ?auto_14623 )
      ( !DRIVE ?auto_14622 ?auto_14623 ?auto_14621 )
      ( !UNLOAD ?auto_14620 ?auto_14619 ?auto_14622 ?auto_14621 )
      ( !DROP ?auto_14620 ?auto_14619 ?auto_14618 ?auto_14621 )
      ( MAKE-1CRATE-VERIFY ?auto_14618 ?auto_14619 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_14640 - SURFACE
      ?auto_14641 - SURFACE
      ?auto_14642 - SURFACE
      ?auto_14643 - SURFACE
      ?auto_14644 - SURFACE
      ?auto_14645 - SURFACE
      ?auto_14646 - SURFACE
      ?auto_14649 - SURFACE
      ?auto_14648 - SURFACE
      ?auto_14647 - SURFACE
      ?auto_14650 - SURFACE
      ?auto_14651 - SURFACE
      ?auto_14652 - SURFACE
      ?auto_14653 - SURFACE
    )
    :vars
    (
      ?auto_14655 - HOIST
      ?auto_14656 - PLACE
      ?auto_14654 - PLACE
      ?auto_14659 - HOIST
      ?auto_14658 - SURFACE
      ?auto_14675 - PLACE
      ?auto_14663 - HOIST
      ?auto_14684 - SURFACE
      ?auto_14677 - PLACE
      ?auto_14689 - HOIST
      ?auto_14681 - SURFACE
      ?auto_14678 - PLACE
      ?auto_14662 - HOIST
      ?auto_14679 - SURFACE
      ?auto_14685 - PLACE
      ?auto_14682 - HOIST
      ?auto_14667 - SURFACE
      ?auto_14680 - SURFACE
      ?auto_14669 - PLACE
      ?auto_14676 - HOIST
      ?auto_14670 - SURFACE
      ?auto_14661 - PLACE
      ?auto_14673 - HOIST
      ?auto_14686 - SURFACE
      ?auto_14666 - PLACE
      ?auto_14668 - HOIST
      ?auto_14674 - SURFACE
      ?auto_14671 - SURFACE
      ?auto_14687 - SURFACE
      ?auto_14672 - PLACE
      ?auto_14665 - HOIST
      ?auto_14683 - SURFACE
      ?auto_14660 - PLACE
      ?auto_14664 - HOIST
      ?auto_14688 - SURFACE
      ?auto_14657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14655 ?auto_14656 ) ( IS-CRATE ?auto_14653 ) ( not ( = ?auto_14654 ?auto_14656 ) ) ( HOIST-AT ?auto_14659 ?auto_14654 ) ( AVAILABLE ?auto_14659 ) ( SURFACE-AT ?auto_14653 ?auto_14654 ) ( ON ?auto_14653 ?auto_14658 ) ( CLEAR ?auto_14653 ) ( not ( = ?auto_14652 ?auto_14653 ) ) ( not ( = ?auto_14652 ?auto_14658 ) ) ( not ( = ?auto_14653 ?auto_14658 ) ) ( not ( = ?auto_14655 ?auto_14659 ) ) ( IS-CRATE ?auto_14652 ) ( not ( = ?auto_14675 ?auto_14656 ) ) ( HOIST-AT ?auto_14663 ?auto_14675 ) ( SURFACE-AT ?auto_14652 ?auto_14675 ) ( ON ?auto_14652 ?auto_14684 ) ( CLEAR ?auto_14652 ) ( not ( = ?auto_14651 ?auto_14652 ) ) ( not ( = ?auto_14651 ?auto_14684 ) ) ( not ( = ?auto_14652 ?auto_14684 ) ) ( not ( = ?auto_14655 ?auto_14663 ) ) ( IS-CRATE ?auto_14651 ) ( not ( = ?auto_14677 ?auto_14656 ) ) ( HOIST-AT ?auto_14689 ?auto_14677 ) ( SURFACE-AT ?auto_14651 ?auto_14677 ) ( ON ?auto_14651 ?auto_14681 ) ( CLEAR ?auto_14651 ) ( not ( = ?auto_14650 ?auto_14651 ) ) ( not ( = ?auto_14650 ?auto_14681 ) ) ( not ( = ?auto_14651 ?auto_14681 ) ) ( not ( = ?auto_14655 ?auto_14689 ) ) ( IS-CRATE ?auto_14650 ) ( not ( = ?auto_14678 ?auto_14656 ) ) ( HOIST-AT ?auto_14662 ?auto_14678 ) ( AVAILABLE ?auto_14662 ) ( SURFACE-AT ?auto_14650 ?auto_14678 ) ( ON ?auto_14650 ?auto_14679 ) ( CLEAR ?auto_14650 ) ( not ( = ?auto_14647 ?auto_14650 ) ) ( not ( = ?auto_14647 ?auto_14679 ) ) ( not ( = ?auto_14650 ?auto_14679 ) ) ( not ( = ?auto_14655 ?auto_14662 ) ) ( IS-CRATE ?auto_14647 ) ( not ( = ?auto_14685 ?auto_14656 ) ) ( HOIST-AT ?auto_14682 ?auto_14685 ) ( AVAILABLE ?auto_14682 ) ( SURFACE-AT ?auto_14647 ?auto_14685 ) ( ON ?auto_14647 ?auto_14667 ) ( CLEAR ?auto_14647 ) ( not ( = ?auto_14648 ?auto_14647 ) ) ( not ( = ?auto_14648 ?auto_14667 ) ) ( not ( = ?auto_14647 ?auto_14667 ) ) ( not ( = ?auto_14655 ?auto_14682 ) ) ( IS-CRATE ?auto_14648 ) ( AVAILABLE ?auto_14689 ) ( SURFACE-AT ?auto_14648 ?auto_14677 ) ( ON ?auto_14648 ?auto_14680 ) ( CLEAR ?auto_14648 ) ( not ( = ?auto_14649 ?auto_14648 ) ) ( not ( = ?auto_14649 ?auto_14680 ) ) ( not ( = ?auto_14648 ?auto_14680 ) ) ( IS-CRATE ?auto_14649 ) ( not ( = ?auto_14669 ?auto_14656 ) ) ( HOIST-AT ?auto_14676 ?auto_14669 ) ( SURFACE-AT ?auto_14649 ?auto_14669 ) ( ON ?auto_14649 ?auto_14670 ) ( CLEAR ?auto_14649 ) ( not ( = ?auto_14646 ?auto_14649 ) ) ( not ( = ?auto_14646 ?auto_14670 ) ) ( not ( = ?auto_14649 ?auto_14670 ) ) ( not ( = ?auto_14655 ?auto_14676 ) ) ( IS-CRATE ?auto_14646 ) ( not ( = ?auto_14661 ?auto_14656 ) ) ( HOIST-AT ?auto_14673 ?auto_14661 ) ( AVAILABLE ?auto_14673 ) ( SURFACE-AT ?auto_14646 ?auto_14661 ) ( ON ?auto_14646 ?auto_14686 ) ( CLEAR ?auto_14646 ) ( not ( = ?auto_14645 ?auto_14646 ) ) ( not ( = ?auto_14645 ?auto_14686 ) ) ( not ( = ?auto_14646 ?auto_14686 ) ) ( not ( = ?auto_14655 ?auto_14673 ) ) ( IS-CRATE ?auto_14645 ) ( not ( = ?auto_14666 ?auto_14656 ) ) ( HOIST-AT ?auto_14668 ?auto_14666 ) ( AVAILABLE ?auto_14668 ) ( SURFACE-AT ?auto_14645 ?auto_14666 ) ( ON ?auto_14645 ?auto_14674 ) ( CLEAR ?auto_14645 ) ( not ( = ?auto_14644 ?auto_14645 ) ) ( not ( = ?auto_14644 ?auto_14674 ) ) ( not ( = ?auto_14645 ?auto_14674 ) ) ( not ( = ?auto_14655 ?auto_14668 ) ) ( IS-CRATE ?auto_14644 ) ( AVAILABLE ?auto_14676 ) ( SURFACE-AT ?auto_14644 ?auto_14669 ) ( ON ?auto_14644 ?auto_14671 ) ( CLEAR ?auto_14644 ) ( not ( = ?auto_14643 ?auto_14644 ) ) ( not ( = ?auto_14643 ?auto_14671 ) ) ( not ( = ?auto_14644 ?auto_14671 ) ) ( IS-CRATE ?auto_14643 ) ( AVAILABLE ?auto_14663 ) ( SURFACE-AT ?auto_14643 ?auto_14675 ) ( ON ?auto_14643 ?auto_14687 ) ( CLEAR ?auto_14643 ) ( not ( = ?auto_14642 ?auto_14643 ) ) ( not ( = ?auto_14642 ?auto_14687 ) ) ( not ( = ?auto_14643 ?auto_14687 ) ) ( IS-CRATE ?auto_14642 ) ( not ( = ?auto_14672 ?auto_14656 ) ) ( HOIST-AT ?auto_14665 ?auto_14672 ) ( AVAILABLE ?auto_14665 ) ( SURFACE-AT ?auto_14642 ?auto_14672 ) ( ON ?auto_14642 ?auto_14683 ) ( CLEAR ?auto_14642 ) ( not ( = ?auto_14641 ?auto_14642 ) ) ( not ( = ?auto_14641 ?auto_14683 ) ) ( not ( = ?auto_14642 ?auto_14683 ) ) ( not ( = ?auto_14655 ?auto_14665 ) ) ( SURFACE-AT ?auto_14640 ?auto_14656 ) ( CLEAR ?auto_14640 ) ( IS-CRATE ?auto_14641 ) ( AVAILABLE ?auto_14655 ) ( not ( = ?auto_14660 ?auto_14656 ) ) ( HOIST-AT ?auto_14664 ?auto_14660 ) ( AVAILABLE ?auto_14664 ) ( SURFACE-AT ?auto_14641 ?auto_14660 ) ( ON ?auto_14641 ?auto_14688 ) ( CLEAR ?auto_14641 ) ( TRUCK-AT ?auto_14657 ?auto_14656 ) ( not ( = ?auto_14640 ?auto_14641 ) ) ( not ( = ?auto_14640 ?auto_14688 ) ) ( not ( = ?auto_14641 ?auto_14688 ) ) ( not ( = ?auto_14655 ?auto_14664 ) ) ( not ( = ?auto_14640 ?auto_14642 ) ) ( not ( = ?auto_14640 ?auto_14683 ) ) ( not ( = ?auto_14642 ?auto_14688 ) ) ( not ( = ?auto_14672 ?auto_14660 ) ) ( not ( = ?auto_14665 ?auto_14664 ) ) ( not ( = ?auto_14683 ?auto_14688 ) ) ( not ( = ?auto_14640 ?auto_14643 ) ) ( not ( = ?auto_14640 ?auto_14687 ) ) ( not ( = ?auto_14641 ?auto_14643 ) ) ( not ( = ?auto_14641 ?auto_14687 ) ) ( not ( = ?auto_14643 ?auto_14683 ) ) ( not ( = ?auto_14643 ?auto_14688 ) ) ( not ( = ?auto_14675 ?auto_14672 ) ) ( not ( = ?auto_14675 ?auto_14660 ) ) ( not ( = ?auto_14663 ?auto_14665 ) ) ( not ( = ?auto_14663 ?auto_14664 ) ) ( not ( = ?auto_14687 ?auto_14683 ) ) ( not ( = ?auto_14687 ?auto_14688 ) ) ( not ( = ?auto_14640 ?auto_14644 ) ) ( not ( = ?auto_14640 ?auto_14671 ) ) ( not ( = ?auto_14641 ?auto_14644 ) ) ( not ( = ?auto_14641 ?auto_14671 ) ) ( not ( = ?auto_14642 ?auto_14644 ) ) ( not ( = ?auto_14642 ?auto_14671 ) ) ( not ( = ?auto_14644 ?auto_14687 ) ) ( not ( = ?auto_14644 ?auto_14683 ) ) ( not ( = ?auto_14644 ?auto_14688 ) ) ( not ( = ?auto_14669 ?auto_14675 ) ) ( not ( = ?auto_14669 ?auto_14672 ) ) ( not ( = ?auto_14669 ?auto_14660 ) ) ( not ( = ?auto_14676 ?auto_14663 ) ) ( not ( = ?auto_14676 ?auto_14665 ) ) ( not ( = ?auto_14676 ?auto_14664 ) ) ( not ( = ?auto_14671 ?auto_14687 ) ) ( not ( = ?auto_14671 ?auto_14683 ) ) ( not ( = ?auto_14671 ?auto_14688 ) ) ( not ( = ?auto_14640 ?auto_14645 ) ) ( not ( = ?auto_14640 ?auto_14674 ) ) ( not ( = ?auto_14641 ?auto_14645 ) ) ( not ( = ?auto_14641 ?auto_14674 ) ) ( not ( = ?auto_14642 ?auto_14645 ) ) ( not ( = ?auto_14642 ?auto_14674 ) ) ( not ( = ?auto_14643 ?auto_14645 ) ) ( not ( = ?auto_14643 ?auto_14674 ) ) ( not ( = ?auto_14645 ?auto_14671 ) ) ( not ( = ?auto_14645 ?auto_14687 ) ) ( not ( = ?auto_14645 ?auto_14683 ) ) ( not ( = ?auto_14645 ?auto_14688 ) ) ( not ( = ?auto_14666 ?auto_14669 ) ) ( not ( = ?auto_14666 ?auto_14675 ) ) ( not ( = ?auto_14666 ?auto_14672 ) ) ( not ( = ?auto_14666 ?auto_14660 ) ) ( not ( = ?auto_14668 ?auto_14676 ) ) ( not ( = ?auto_14668 ?auto_14663 ) ) ( not ( = ?auto_14668 ?auto_14665 ) ) ( not ( = ?auto_14668 ?auto_14664 ) ) ( not ( = ?auto_14674 ?auto_14671 ) ) ( not ( = ?auto_14674 ?auto_14687 ) ) ( not ( = ?auto_14674 ?auto_14683 ) ) ( not ( = ?auto_14674 ?auto_14688 ) ) ( not ( = ?auto_14640 ?auto_14646 ) ) ( not ( = ?auto_14640 ?auto_14686 ) ) ( not ( = ?auto_14641 ?auto_14646 ) ) ( not ( = ?auto_14641 ?auto_14686 ) ) ( not ( = ?auto_14642 ?auto_14646 ) ) ( not ( = ?auto_14642 ?auto_14686 ) ) ( not ( = ?auto_14643 ?auto_14646 ) ) ( not ( = ?auto_14643 ?auto_14686 ) ) ( not ( = ?auto_14644 ?auto_14646 ) ) ( not ( = ?auto_14644 ?auto_14686 ) ) ( not ( = ?auto_14646 ?auto_14674 ) ) ( not ( = ?auto_14646 ?auto_14671 ) ) ( not ( = ?auto_14646 ?auto_14687 ) ) ( not ( = ?auto_14646 ?auto_14683 ) ) ( not ( = ?auto_14646 ?auto_14688 ) ) ( not ( = ?auto_14661 ?auto_14666 ) ) ( not ( = ?auto_14661 ?auto_14669 ) ) ( not ( = ?auto_14661 ?auto_14675 ) ) ( not ( = ?auto_14661 ?auto_14672 ) ) ( not ( = ?auto_14661 ?auto_14660 ) ) ( not ( = ?auto_14673 ?auto_14668 ) ) ( not ( = ?auto_14673 ?auto_14676 ) ) ( not ( = ?auto_14673 ?auto_14663 ) ) ( not ( = ?auto_14673 ?auto_14665 ) ) ( not ( = ?auto_14673 ?auto_14664 ) ) ( not ( = ?auto_14686 ?auto_14674 ) ) ( not ( = ?auto_14686 ?auto_14671 ) ) ( not ( = ?auto_14686 ?auto_14687 ) ) ( not ( = ?auto_14686 ?auto_14683 ) ) ( not ( = ?auto_14686 ?auto_14688 ) ) ( not ( = ?auto_14640 ?auto_14649 ) ) ( not ( = ?auto_14640 ?auto_14670 ) ) ( not ( = ?auto_14641 ?auto_14649 ) ) ( not ( = ?auto_14641 ?auto_14670 ) ) ( not ( = ?auto_14642 ?auto_14649 ) ) ( not ( = ?auto_14642 ?auto_14670 ) ) ( not ( = ?auto_14643 ?auto_14649 ) ) ( not ( = ?auto_14643 ?auto_14670 ) ) ( not ( = ?auto_14644 ?auto_14649 ) ) ( not ( = ?auto_14644 ?auto_14670 ) ) ( not ( = ?auto_14645 ?auto_14649 ) ) ( not ( = ?auto_14645 ?auto_14670 ) ) ( not ( = ?auto_14649 ?auto_14686 ) ) ( not ( = ?auto_14649 ?auto_14674 ) ) ( not ( = ?auto_14649 ?auto_14671 ) ) ( not ( = ?auto_14649 ?auto_14687 ) ) ( not ( = ?auto_14649 ?auto_14683 ) ) ( not ( = ?auto_14649 ?auto_14688 ) ) ( not ( = ?auto_14670 ?auto_14686 ) ) ( not ( = ?auto_14670 ?auto_14674 ) ) ( not ( = ?auto_14670 ?auto_14671 ) ) ( not ( = ?auto_14670 ?auto_14687 ) ) ( not ( = ?auto_14670 ?auto_14683 ) ) ( not ( = ?auto_14670 ?auto_14688 ) ) ( not ( = ?auto_14640 ?auto_14648 ) ) ( not ( = ?auto_14640 ?auto_14680 ) ) ( not ( = ?auto_14641 ?auto_14648 ) ) ( not ( = ?auto_14641 ?auto_14680 ) ) ( not ( = ?auto_14642 ?auto_14648 ) ) ( not ( = ?auto_14642 ?auto_14680 ) ) ( not ( = ?auto_14643 ?auto_14648 ) ) ( not ( = ?auto_14643 ?auto_14680 ) ) ( not ( = ?auto_14644 ?auto_14648 ) ) ( not ( = ?auto_14644 ?auto_14680 ) ) ( not ( = ?auto_14645 ?auto_14648 ) ) ( not ( = ?auto_14645 ?auto_14680 ) ) ( not ( = ?auto_14646 ?auto_14648 ) ) ( not ( = ?auto_14646 ?auto_14680 ) ) ( not ( = ?auto_14648 ?auto_14670 ) ) ( not ( = ?auto_14648 ?auto_14686 ) ) ( not ( = ?auto_14648 ?auto_14674 ) ) ( not ( = ?auto_14648 ?auto_14671 ) ) ( not ( = ?auto_14648 ?auto_14687 ) ) ( not ( = ?auto_14648 ?auto_14683 ) ) ( not ( = ?auto_14648 ?auto_14688 ) ) ( not ( = ?auto_14677 ?auto_14669 ) ) ( not ( = ?auto_14677 ?auto_14661 ) ) ( not ( = ?auto_14677 ?auto_14666 ) ) ( not ( = ?auto_14677 ?auto_14675 ) ) ( not ( = ?auto_14677 ?auto_14672 ) ) ( not ( = ?auto_14677 ?auto_14660 ) ) ( not ( = ?auto_14689 ?auto_14676 ) ) ( not ( = ?auto_14689 ?auto_14673 ) ) ( not ( = ?auto_14689 ?auto_14668 ) ) ( not ( = ?auto_14689 ?auto_14663 ) ) ( not ( = ?auto_14689 ?auto_14665 ) ) ( not ( = ?auto_14689 ?auto_14664 ) ) ( not ( = ?auto_14680 ?auto_14670 ) ) ( not ( = ?auto_14680 ?auto_14686 ) ) ( not ( = ?auto_14680 ?auto_14674 ) ) ( not ( = ?auto_14680 ?auto_14671 ) ) ( not ( = ?auto_14680 ?auto_14687 ) ) ( not ( = ?auto_14680 ?auto_14683 ) ) ( not ( = ?auto_14680 ?auto_14688 ) ) ( not ( = ?auto_14640 ?auto_14647 ) ) ( not ( = ?auto_14640 ?auto_14667 ) ) ( not ( = ?auto_14641 ?auto_14647 ) ) ( not ( = ?auto_14641 ?auto_14667 ) ) ( not ( = ?auto_14642 ?auto_14647 ) ) ( not ( = ?auto_14642 ?auto_14667 ) ) ( not ( = ?auto_14643 ?auto_14647 ) ) ( not ( = ?auto_14643 ?auto_14667 ) ) ( not ( = ?auto_14644 ?auto_14647 ) ) ( not ( = ?auto_14644 ?auto_14667 ) ) ( not ( = ?auto_14645 ?auto_14647 ) ) ( not ( = ?auto_14645 ?auto_14667 ) ) ( not ( = ?auto_14646 ?auto_14647 ) ) ( not ( = ?auto_14646 ?auto_14667 ) ) ( not ( = ?auto_14649 ?auto_14647 ) ) ( not ( = ?auto_14649 ?auto_14667 ) ) ( not ( = ?auto_14647 ?auto_14680 ) ) ( not ( = ?auto_14647 ?auto_14670 ) ) ( not ( = ?auto_14647 ?auto_14686 ) ) ( not ( = ?auto_14647 ?auto_14674 ) ) ( not ( = ?auto_14647 ?auto_14671 ) ) ( not ( = ?auto_14647 ?auto_14687 ) ) ( not ( = ?auto_14647 ?auto_14683 ) ) ( not ( = ?auto_14647 ?auto_14688 ) ) ( not ( = ?auto_14685 ?auto_14677 ) ) ( not ( = ?auto_14685 ?auto_14669 ) ) ( not ( = ?auto_14685 ?auto_14661 ) ) ( not ( = ?auto_14685 ?auto_14666 ) ) ( not ( = ?auto_14685 ?auto_14675 ) ) ( not ( = ?auto_14685 ?auto_14672 ) ) ( not ( = ?auto_14685 ?auto_14660 ) ) ( not ( = ?auto_14682 ?auto_14689 ) ) ( not ( = ?auto_14682 ?auto_14676 ) ) ( not ( = ?auto_14682 ?auto_14673 ) ) ( not ( = ?auto_14682 ?auto_14668 ) ) ( not ( = ?auto_14682 ?auto_14663 ) ) ( not ( = ?auto_14682 ?auto_14665 ) ) ( not ( = ?auto_14682 ?auto_14664 ) ) ( not ( = ?auto_14667 ?auto_14680 ) ) ( not ( = ?auto_14667 ?auto_14670 ) ) ( not ( = ?auto_14667 ?auto_14686 ) ) ( not ( = ?auto_14667 ?auto_14674 ) ) ( not ( = ?auto_14667 ?auto_14671 ) ) ( not ( = ?auto_14667 ?auto_14687 ) ) ( not ( = ?auto_14667 ?auto_14683 ) ) ( not ( = ?auto_14667 ?auto_14688 ) ) ( not ( = ?auto_14640 ?auto_14650 ) ) ( not ( = ?auto_14640 ?auto_14679 ) ) ( not ( = ?auto_14641 ?auto_14650 ) ) ( not ( = ?auto_14641 ?auto_14679 ) ) ( not ( = ?auto_14642 ?auto_14650 ) ) ( not ( = ?auto_14642 ?auto_14679 ) ) ( not ( = ?auto_14643 ?auto_14650 ) ) ( not ( = ?auto_14643 ?auto_14679 ) ) ( not ( = ?auto_14644 ?auto_14650 ) ) ( not ( = ?auto_14644 ?auto_14679 ) ) ( not ( = ?auto_14645 ?auto_14650 ) ) ( not ( = ?auto_14645 ?auto_14679 ) ) ( not ( = ?auto_14646 ?auto_14650 ) ) ( not ( = ?auto_14646 ?auto_14679 ) ) ( not ( = ?auto_14649 ?auto_14650 ) ) ( not ( = ?auto_14649 ?auto_14679 ) ) ( not ( = ?auto_14648 ?auto_14650 ) ) ( not ( = ?auto_14648 ?auto_14679 ) ) ( not ( = ?auto_14650 ?auto_14667 ) ) ( not ( = ?auto_14650 ?auto_14680 ) ) ( not ( = ?auto_14650 ?auto_14670 ) ) ( not ( = ?auto_14650 ?auto_14686 ) ) ( not ( = ?auto_14650 ?auto_14674 ) ) ( not ( = ?auto_14650 ?auto_14671 ) ) ( not ( = ?auto_14650 ?auto_14687 ) ) ( not ( = ?auto_14650 ?auto_14683 ) ) ( not ( = ?auto_14650 ?auto_14688 ) ) ( not ( = ?auto_14678 ?auto_14685 ) ) ( not ( = ?auto_14678 ?auto_14677 ) ) ( not ( = ?auto_14678 ?auto_14669 ) ) ( not ( = ?auto_14678 ?auto_14661 ) ) ( not ( = ?auto_14678 ?auto_14666 ) ) ( not ( = ?auto_14678 ?auto_14675 ) ) ( not ( = ?auto_14678 ?auto_14672 ) ) ( not ( = ?auto_14678 ?auto_14660 ) ) ( not ( = ?auto_14662 ?auto_14682 ) ) ( not ( = ?auto_14662 ?auto_14689 ) ) ( not ( = ?auto_14662 ?auto_14676 ) ) ( not ( = ?auto_14662 ?auto_14673 ) ) ( not ( = ?auto_14662 ?auto_14668 ) ) ( not ( = ?auto_14662 ?auto_14663 ) ) ( not ( = ?auto_14662 ?auto_14665 ) ) ( not ( = ?auto_14662 ?auto_14664 ) ) ( not ( = ?auto_14679 ?auto_14667 ) ) ( not ( = ?auto_14679 ?auto_14680 ) ) ( not ( = ?auto_14679 ?auto_14670 ) ) ( not ( = ?auto_14679 ?auto_14686 ) ) ( not ( = ?auto_14679 ?auto_14674 ) ) ( not ( = ?auto_14679 ?auto_14671 ) ) ( not ( = ?auto_14679 ?auto_14687 ) ) ( not ( = ?auto_14679 ?auto_14683 ) ) ( not ( = ?auto_14679 ?auto_14688 ) ) ( not ( = ?auto_14640 ?auto_14651 ) ) ( not ( = ?auto_14640 ?auto_14681 ) ) ( not ( = ?auto_14641 ?auto_14651 ) ) ( not ( = ?auto_14641 ?auto_14681 ) ) ( not ( = ?auto_14642 ?auto_14651 ) ) ( not ( = ?auto_14642 ?auto_14681 ) ) ( not ( = ?auto_14643 ?auto_14651 ) ) ( not ( = ?auto_14643 ?auto_14681 ) ) ( not ( = ?auto_14644 ?auto_14651 ) ) ( not ( = ?auto_14644 ?auto_14681 ) ) ( not ( = ?auto_14645 ?auto_14651 ) ) ( not ( = ?auto_14645 ?auto_14681 ) ) ( not ( = ?auto_14646 ?auto_14651 ) ) ( not ( = ?auto_14646 ?auto_14681 ) ) ( not ( = ?auto_14649 ?auto_14651 ) ) ( not ( = ?auto_14649 ?auto_14681 ) ) ( not ( = ?auto_14648 ?auto_14651 ) ) ( not ( = ?auto_14648 ?auto_14681 ) ) ( not ( = ?auto_14647 ?auto_14651 ) ) ( not ( = ?auto_14647 ?auto_14681 ) ) ( not ( = ?auto_14651 ?auto_14679 ) ) ( not ( = ?auto_14651 ?auto_14667 ) ) ( not ( = ?auto_14651 ?auto_14680 ) ) ( not ( = ?auto_14651 ?auto_14670 ) ) ( not ( = ?auto_14651 ?auto_14686 ) ) ( not ( = ?auto_14651 ?auto_14674 ) ) ( not ( = ?auto_14651 ?auto_14671 ) ) ( not ( = ?auto_14651 ?auto_14687 ) ) ( not ( = ?auto_14651 ?auto_14683 ) ) ( not ( = ?auto_14651 ?auto_14688 ) ) ( not ( = ?auto_14681 ?auto_14679 ) ) ( not ( = ?auto_14681 ?auto_14667 ) ) ( not ( = ?auto_14681 ?auto_14680 ) ) ( not ( = ?auto_14681 ?auto_14670 ) ) ( not ( = ?auto_14681 ?auto_14686 ) ) ( not ( = ?auto_14681 ?auto_14674 ) ) ( not ( = ?auto_14681 ?auto_14671 ) ) ( not ( = ?auto_14681 ?auto_14687 ) ) ( not ( = ?auto_14681 ?auto_14683 ) ) ( not ( = ?auto_14681 ?auto_14688 ) ) ( not ( = ?auto_14640 ?auto_14652 ) ) ( not ( = ?auto_14640 ?auto_14684 ) ) ( not ( = ?auto_14641 ?auto_14652 ) ) ( not ( = ?auto_14641 ?auto_14684 ) ) ( not ( = ?auto_14642 ?auto_14652 ) ) ( not ( = ?auto_14642 ?auto_14684 ) ) ( not ( = ?auto_14643 ?auto_14652 ) ) ( not ( = ?auto_14643 ?auto_14684 ) ) ( not ( = ?auto_14644 ?auto_14652 ) ) ( not ( = ?auto_14644 ?auto_14684 ) ) ( not ( = ?auto_14645 ?auto_14652 ) ) ( not ( = ?auto_14645 ?auto_14684 ) ) ( not ( = ?auto_14646 ?auto_14652 ) ) ( not ( = ?auto_14646 ?auto_14684 ) ) ( not ( = ?auto_14649 ?auto_14652 ) ) ( not ( = ?auto_14649 ?auto_14684 ) ) ( not ( = ?auto_14648 ?auto_14652 ) ) ( not ( = ?auto_14648 ?auto_14684 ) ) ( not ( = ?auto_14647 ?auto_14652 ) ) ( not ( = ?auto_14647 ?auto_14684 ) ) ( not ( = ?auto_14650 ?auto_14652 ) ) ( not ( = ?auto_14650 ?auto_14684 ) ) ( not ( = ?auto_14652 ?auto_14681 ) ) ( not ( = ?auto_14652 ?auto_14679 ) ) ( not ( = ?auto_14652 ?auto_14667 ) ) ( not ( = ?auto_14652 ?auto_14680 ) ) ( not ( = ?auto_14652 ?auto_14670 ) ) ( not ( = ?auto_14652 ?auto_14686 ) ) ( not ( = ?auto_14652 ?auto_14674 ) ) ( not ( = ?auto_14652 ?auto_14671 ) ) ( not ( = ?auto_14652 ?auto_14687 ) ) ( not ( = ?auto_14652 ?auto_14683 ) ) ( not ( = ?auto_14652 ?auto_14688 ) ) ( not ( = ?auto_14684 ?auto_14681 ) ) ( not ( = ?auto_14684 ?auto_14679 ) ) ( not ( = ?auto_14684 ?auto_14667 ) ) ( not ( = ?auto_14684 ?auto_14680 ) ) ( not ( = ?auto_14684 ?auto_14670 ) ) ( not ( = ?auto_14684 ?auto_14686 ) ) ( not ( = ?auto_14684 ?auto_14674 ) ) ( not ( = ?auto_14684 ?auto_14671 ) ) ( not ( = ?auto_14684 ?auto_14687 ) ) ( not ( = ?auto_14684 ?auto_14683 ) ) ( not ( = ?auto_14684 ?auto_14688 ) ) ( not ( = ?auto_14640 ?auto_14653 ) ) ( not ( = ?auto_14640 ?auto_14658 ) ) ( not ( = ?auto_14641 ?auto_14653 ) ) ( not ( = ?auto_14641 ?auto_14658 ) ) ( not ( = ?auto_14642 ?auto_14653 ) ) ( not ( = ?auto_14642 ?auto_14658 ) ) ( not ( = ?auto_14643 ?auto_14653 ) ) ( not ( = ?auto_14643 ?auto_14658 ) ) ( not ( = ?auto_14644 ?auto_14653 ) ) ( not ( = ?auto_14644 ?auto_14658 ) ) ( not ( = ?auto_14645 ?auto_14653 ) ) ( not ( = ?auto_14645 ?auto_14658 ) ) ( not ( = ?auto_14646 ?auto_14653 ) ) ( not ( = ?auto_14646 ?auto_14658 ) ) ( not ( = ?auto_14649 ?auto_14653 ) ) ( not ( = ?auto_14649 ?auto_14658 ) ) ( not ( = ?auto_14648 ?auto_14653 ) ) ( not ( = ?auto_14648 ?auto_14658 ) ) ( not ( = ?auto_14647 ?auto_14653 ) ) ( not ( = ?auto_14647 ?auto_14658 ) ) ( not ( = ?auto_14650 ?auto_14653 ) ) ( not ( = ?auto_14650 ?auto_14658 ) ) ( not ( = ?auto_14651 ?auto_14653 ) ) ( not ( = ?auto_14651 ?auto_14658 ) ) ( not ( = ?auto_14653 ?auto_14684 ) ) ( not ( = ?auto_14653 ?auto_14681 ) ) ( not ( = ?auto_14653 ?auto_14679 ) ) ( not ( = ?auto_14653 ?auto_14667 ) ) ( not ( = ?auto_14653 ?auto_14680 ) ) ( not ( = ?auto_14653 ?auto_14670 ) ) ( not ( = ?auto_14653 ?auto_14686 ) ) ( not ( = ?auto_14653 ?auto_14674 ) ) ( not ( = ?auto_14653 ?auto_14671 ) ) ( not ( = ?auto_14653 ?auto_14687 ) ) ( not ( = ?auto_14653 ?auto_14683 ) ) ( not ( = ?auto_14653 ?auto_14688 ) ) ( not ( = ?auto_14654 ?auto_14675 ) ) ( not ( = ?auto_14654 ?auto_14677 ) ) ( not ( = ?auto_14654 ?auto_14678 ) ) ( not ( = ?auto_14654 ?auto_14685 ) ) ( not ( = ?auto_14654 ?auto_14669 ) ) ( not ( = ?auto_14654 ?auto_14661 ) ) ( not ( = ?auto_14654 ?auto_14666 ) ) ( not ( = ?auto_14654 ?auto_14672 ) ) ( not ( = ?auto_14654 ?auto_14660 ) ) ( not ( = ?auto_14659 ?auto_14663 ) ) ( not ( = ?auto_14659 ?auto_14689 ) ) ( not ( = ?auto_14659 ?auto_14662 ) ) ( not ( = ?auto_14659 ?auto_14682 ) ) ( not ( = ?auto_14659 ?auto_14676 ) ) ( not ( = ?auto_14659 ?auto_14673 ) ) ( not ( = ?auto_14659 ?auto_14668 ) ) ( not ( = ?auto_14659 ?auto_14665 ) ) ( not ( = ?auto_14659 ?auto_14664 ) ) ( not ( = ?auto_14658 ?auto_14684 ) ) ( not ( = ?auto_14658 ?auto_14681 ) ) ( not ( = ?auto_14658 ?auto_14679 ) ) ( not ( = ?auto_14658 ?auto_14667 ) ) ( not ( = ?auto_14658 ?auto_14680 ) ) ( not ( = ?auto_14658 ?auto_14670 ) ) ( not ( = ?auto_14658 ?auto_14686 ) ) ( not ( = ?auto_14658 ?auto_14674 ) ) ( not ( = ?auto_14658 ?auto_14671 ) ) ( not ( = ?auto_14658 ?auto_14687 ) ) ( not ( = ?auto_14658 ?auto_14683 ) ) ( not ( = ?auto_14658 ?auto_14688 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_14640 ?auto_14641 ?auto_14642 ?auto_14643 ?auto_14644 ?auto_14645 ?auto_14646 ?auto_14649 ?auto_14648 ?auto_14647 ?auto_14650 ?auto_14651 ?auto_14652 )
      ( MAKE-1CRATE ?auto_14652 ?auto_14653 )
      ( MAKE-13CRATE-VERIFY ?auto_14640 ?auto_14641 ?auto_14642 ?auto_14643 ?auto_14644 ?auto_14645 ?auto_14646 ?auto_14649 ?auto_14648 ?auto_14647 ?auto_14650 ?auto_14651 ?auto_14652 ?auto_14653 ) )
  )

)

